# frozen_string_literal: true

module Lt
  module Lcms
    module Lesson
      module Uploader
        class Gdoc
          def initialize(credentials)
            @credentials = credentials
          end

          def upload(name, content, content_type, parent_folder_id = nil)
            file_metadata = {
              name: name,
              mime_type: Lt::Google::Api::Drive::MIME_FILE
            }
            file_metadata[:parents] = [parent_folder_id] if parent_folder_id.present?
            file = service.create_file(
              file_metadata,
              fields: 'id',
              upload_source: StringIO.new(content),
              content_type: content_type
            )
            file.id
          end

          private

          def service
            @service ||= Lt::Google::Api::Drive.build(@credentials)
          end
        end
      end
    end
  end
end