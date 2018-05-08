# frozen_string_literal: true

require 'zip'

module Lt
  module Lcms
    module Lesson
      module Downloader
        class Gspreadsheet < Lt::Lcms::Lesson::Downloader::Base
          MIME_TYPE = 'application/vnd.google-apps.spreadsheet'
          MIME_TYPE_EXPORT = 'application/x-vnd.oasis.opendocument.spreadsheet'

          def self.gdoc_file_url(id)
            "https://docs.google.com/spreadsheets/d/#{id}"
          end

          def download_sheet(sheet_name)
            result = StringIO.new
            tempfile = Tempfile.new
            tempfile.binmode
            download(mime_type: 'application/zip') do |raw_zip|
              tempfile.write raw_zip
              # NOTE: It's impossible to use ::Zip::InputStream due to `General Purpose Flag Bit 3`
              ::Zip::File.open(tempfile.path) do |zip|
                if (entry = zip.find_entry "#{sheet_name}.html")
                  result.write entry.get_input_stream.read
                end
              end
              result.string
            end
          ensure
            tempfile.close
            tempfile.unlink
          end
        end
      end
    end
  end
end
