# frozen_string_literal: true

require 'zip'

module Lt
  module Lcms
    module Lesson
      module Downloader
        class Gslide < Lt::Lcms::Lesson::Downloader::Base
          MIME_TYPE = 'application/vnd.google-apps.presentation'
          MIME_TYPE_EXPORT = 'application/vnd.openxmlformats-officedocument.presentationml.presentation'

          def self.gdoc_file_url(id)
            "https://docs.google.com/presentation/d/#{id}"
          end

          def initialize(credentials, file_url, opts = {})
            super
            @service = opts[:service]
          end

          def file_id
            return super if @file_url.include?('/')

            @file_id ||= @file_url
          end
        end
      end
    end
  end
end
