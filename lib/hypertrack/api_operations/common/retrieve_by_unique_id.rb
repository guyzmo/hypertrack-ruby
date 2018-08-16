module HyperTrack
  module ApiOperations
    module Common
      module RetrieveByUniqueId

        def retrieve_by_unique_id(id)
          raise HyperTrack::InvalidParameters.new("unique_id is required to retrieve a #{self.name}") unless valid_retrieve_id?(id)

          retrieve_customer_path = "#{get_class_name::API_BASE_PATH}?lookup_id=#{id}"
          result = HyperTrack::ApiClient.fetch(retrieve_customer_path)

          unless result["count"]
            raise HyperTrack::UnknownError.new("Unexpected response: " + result.inspect)
          end
          if result["count"] == 1
            return get_class_name.new(result["results"][0]["id"], result["results"][0])
          else
            raise HyperTrack::ResourceNotFound.new("Found " + result["count"].to_s + " users with unique_id = " + id)
          end
        end

        private

        def valid_retrieve_id?(id)
          !Util.blank?(id)
        end

      end
    end
  end
end