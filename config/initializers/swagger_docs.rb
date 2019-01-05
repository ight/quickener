# frozen_string_literal: true

module Swagger
  module Docs
    # Overriding the transform_path method in this class
    class Config
      def self.transform_path(path, api_version)
        "api/v#{api_version.to_i}/#{path}"
      end

      Swagger::Docs::Config.base_api_controller = ApplicationController
      Swagger::Docs::Config.register_apis(
        '1.0' => {
          # Base Controller for API
          base_api_controller: ApplicationController,
          # The extension used for the API
          api_extension_type: :json,
          # Location where the .json files will be store
          api_file_path: 'public/api/v1/',
          # Base path for api url
          base_path: QuickenerSettings.build_url,
          # If you want to delete all .json files at each generation
          clean_directory: false
        }
      )
    end
  end
end