# frozen_string_literal: true

require 'lt/lcms/lesson/downloader/base'

module Lt
  module Lcms
    module Lesson
      module Downloader
        class Gdoc < Base
          GOOGLE_DRAWING_RE = %r{https?://docs\.google\.com/?[^"]*/drawings/[^"]*}i
          GOOGLE_URL_RE = %r{https://www\.google\.com/url\?q=([^&]*)&?.*}i
          MIME_TYPE = 'application/vnd.google-apps.document'
          MIME_TYPE_EXPORT = 'text/html'

          def self.gdoc_file_url(id)
            "https://docs.google.com/document/d/#{id}"
          end

          def download
            super do |html|
              fix_links handle_google_drawings(html)
            end
          end

          private

          attr_reader :options

          BASE_DPI = 72.0
          private_constant :BASE_DPI

          def fix_links(html)
            doc = Nokogiri::HTML(html)
            doc.css('a').each do |link|
              next if link['href'].blank?

              link['href'] = CGI.unescape_html(link['href']).gsub GOOGLE_URL_RE, '\1'
            end
            doc.to_s
          end

          def handle_google_drawings(html)
            return html unless (match = html.scan(GOOGLE_DRAWING_RE))

            bearer = @credentials.fetch_access_token!['access_token']

            match.to_a.uniq.each do |url|
              upd_url = updated_drawing_url_for(url)
              response = HTTParty.get CGI.unescapeHTML(upd_url), headers: { 'Authorization' => "Bearer #{bearer}" }

              next unless response.code == 200

              new_src =
                "data:#{response.content_type};base64, #{Base64.encode64(response.to_s)}\" drawing_url=\"#{upd_url}"
              html = html.gsub(url, new_src)
            end

            html
          end

          # Update drawing url w/h parameters to download in better quality than default 72 dpi
          def updated_drawing_url_for(url)
            return url unless options[:dpi].present?

            dpi_ratio = options[:dpi].to_f / BASE_DPI
            uri = URI.parse(url)
            query = CGI.parse(uri.query.to_s).transform_values(&:first)
            query['w'] = (query['w'].to_i * dpi_ratio).round.to_s
            query['h'] = (query['h'].to_i * dpi_ratio).round.to_s
            URI::HTTPS.build(host: uri.host, path: uri.path, query: query.to_query).to_s
          end
        end
      end
    end
  end
end
