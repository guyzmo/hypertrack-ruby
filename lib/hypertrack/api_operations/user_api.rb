module HyperTrack
  module ApiOperations
    module UserAPI

      def assign_actions(params)
        path = "assign_actions/"
        self.update(path, params, [:action_ids])
      end

      def update(params)
        self.patch(params)
      end

      def placeline(params={})
        path = "placeline/"
        self.get(path, params)
      end

      def mileage(params={})
        path = "mileage/"
        self.get(path, params)
      end
    end
  end
end