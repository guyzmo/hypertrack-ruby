module HyperTrack
  class Action < HyperTrack::SharedResource
    include HyperTrack::ApiOperations::ActionAPI

    API_BASE_PATH = "actions/".freeze
    REQUIRED_FIELDS = [].freeze

    VALID_ATTRIBUTE_VALUES = {
      type: {
        allow_nil: true,
      },
      vehicle_type: {
        allowed: HyperTrack::SharedResource::VALID_VEHICLE_TYPES,
        allow_nil: true,
      },
    }.freeze

    def self.placeline(filter_params={})
      api_result = HyperTrack::ApiClient.fetch(get_class_name::API_BASE_PATH, filter_params)
      api_result['results'].each_with_index do |opts, idx|
        api_result['results'][idx] = get_class_name.new(opts['id'], opts)
      end

      api_result['results']
    end
  end
end
