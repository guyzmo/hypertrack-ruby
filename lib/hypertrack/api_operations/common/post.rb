module HyperTrack
  module ApiOperations
    module Common
      module Post
        def post(path, params, required_params=[])
          return unless HyperTrack::ParamsValidator.valid_args?(params, required_params, self.class::VALID_ATTRIBUTE_VALUES)
          api_path = "#{self.class::API_BASE_PATH}#{self.id}/" + path
          result = HyperTrack::ApiClient.post(api_path, params)
          update_attributes_in_object(result)
        end

        private

        def update_attributes_in_object(result)
          result = Util.symbolize_keys(result)

          self_keys = self.keys

          result.each do |key, value|
            if self_keys.include?(key) && self[key] != value
              self[key] = value
            end
          end

          self
        end
      end
    end
  end
end
