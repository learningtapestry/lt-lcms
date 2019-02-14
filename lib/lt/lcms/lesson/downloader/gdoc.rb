# frozen_string_literal: true

require 'lt/lcms/lesson/downloader/base'

module Lt
  module Lcms
    module Lesson
      module Downloader
        class Gdoc < Base
          GOOGLE_DRAWING_RE = %r{https?://docs\.google\.com/?[^"]*/drawings/[^"]*}i
          MIME_TYPE = 'application/vnd.google-apps.document'
          MIME_TYPE_EXPORT = 'text/html'

          def self.gdoc_file_url(id)
            "https://docs.google.com/document/d/#{id}"
          end

          def download
            super(&method(:handle_google_drawings))
          end

          private

          attr_reader :options

          def handle_google_drawings(html)
            return html unless (match = html.scan(GOOGLE_DRAWING_RE))

            headers = { 'Authorization' => "Bearer #{@credentials.access_token}" }

            match.to_a.uniq.each do |url|
              response = HTTParty.get CGI.unescapeHTML(url), headers: headers
              new_src = "data:#{response.content_type};base64, #{Base64.encode64(response)}\" drawing_url=\"#{url}"
              html = html.gsub(url, new_src)
            end

            html
          end
        end
      end
    end
  end
end
