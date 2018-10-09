module HyperTrack
  class User < HyperTrack::SharedResource
    include HyperTrack::ApiOperations::UserAPI

    API_BASE_PATH = "users/".freeze
    REQUIRED_FIELDS = [:name].freeze

    VALID_ATTRIBUTE_VALUES = {
      vehicle_type: {
        allowed: HyperTrack::SharedResource::VALID_VEHICLE_TYPES,
      },
    }.freeze
  end
end
