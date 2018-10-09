module HyperTrack
  module ApiOperations
    module Common
      module Get
        def get(path, params, required_params=[])
          return unless HyperTrack::ParamsValidator.valid_args?(params, required_params, self.class::VALID_ATTRIBUTE_VALUES)
          api_path = "#{self.class::API_BASE_PATH}#{self.id}/" + path
          HyperTrack::ApiClient.fetch(api_path, params)
        end

        def get_list(path, params, required_params=[])
          return unless HyperTrack::ParamsValidator.valid_args?(params, required_params, self.class::VALID_ATTRIBUTE_VALUES)
          api_path = "#{self.class::API_BASE_PATH}#{self.id}/" + path
          HyperTrack::ApiClient.fetch(api_path, params)
        end
      end
    end
  end
end
