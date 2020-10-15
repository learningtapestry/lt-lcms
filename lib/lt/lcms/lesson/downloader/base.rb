# frozen_string_literal: true

require 'google/apis/drive_v3'

module Lt
  module Lcms
    module Lesson
      module Downloader
        class Base
          RETRY_DELAYES = [10.seconds, 30.seconds, 45.seconds, 1.minute, 3.minutes].freeze
          MAX_RETRY_COUNT = RETRY_DELAYES.size
          MIME_TYPE_EXPORT = 'text/plain'

          def self.file_id_for(url)
            url.scan(%r{/d/([^/]+)/?}).first.try(:first) ||
              url.scan(%r{/open\?id=([^/]+)/?}).first.try(:first)
          end

          attr_reader :content

          def initialize(credentials, file_url, opts = {})
            @credentials = credentials
            @file_url = file_url
            @options = opts
          end

          def download(mime_type: self.class::MIME_TYPE_EXPORT)
            retry_attempt ||= 0
            raw_content = service
                            .export_file(file_id, mime_type)
                            .encode('ASCII-8BIT')
                            .force_encoding('UTF-8')
            @content =
              if block_given?
                yield raw_content
              else
                raw_content
              end
            self
          rescue ::Google::Apis::RateLimitError
            raise unless options[:import_retry]
            raise if retry_attempt >= MAX_RETRY_COUNT

            sleep RETRY_DELAYES[retry_attempt] * rand(1.0..5.0)
            retry_attempt += 1
            retry
          end

          def file
            @file ||= service.get_file(
              file_id,
              fields: 'lastModifyingUser,modifiedTime,name,version',
              supports_all_drives: true
            )
          end

          def file_id
            @file_id ||= self.class.file_id_for @file_url
          end

          private

          attr_reader :options

          def service
            @service ||= Lt::Google::Api::Drive.build(@credentials)
          end
        end
      end
    end
  end
end
