module HyperTrack
  class SharedResource
    extend HyperTrack::ApiOperations::Common::Create
    extend HyperTrack::ApiOperations::Common::Retrieve
    extend HyperTrack::ApiOperations::Common::List
    extend HyperTrack::ApiOperations::Common::Nearby
    extend HyperTrack::ApiOperations::Common::RetrieveByUniqueId
    include HyperTrack::ApiOperations::Common::Patch
    include HyperTrack::ApiOperations::Common::Get
    include HyperTrack::ApiOperations::Common::Update
    include HyperTrack::ApiOperations::Common::Post

    VALID_VEHICLE_TYPES = [:walking, :bicycle, :motorcycle, :car, :'3-wheeler', :van].freeze # [:flight, :train, :ship]

    attr_accessor :id

    def initialize(id, opts)
      @id = id
      @values = Util.symbolize_keys(opts)
    end

    def [](key)
      @values[key.to_sym]
    end

    def []=(key, val)
      @values[key.to_sym] = val
    end

    def keys
      @values.keys
    end

    def values
      @values.values
    end

    def to_json
      JSON.generate(@values)
    end

    protected

    def method_missing(name, *args)
      if name[-1] == "="
        name = name[0..-2]

        if @values.key?(name.to_sym)
          self[name.to_sym] = args[0]
          return
        end

      elsif @values.key?(name.to_sym)
        return @values[name.to_sym]
      end

      super
    end

    def respond_to_missing?(name, include_private=false)
      return true if @values.key?(name.to_sym)
      super
    end

    private

    def self.get_class_name
      # To-Do: Umm.. Find some better approach
      Object.const_get(self.name)
    end
  end
end
