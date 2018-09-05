module HyperTrack
  module ApiOperations
    module ActionAPI

      def complete(params={})
        path = "complete/"
        self.patch(path, params)
      end

      def cancel(params={})
        path = "cancel/"
        self.update(path, params)
      end

      def mileage(params={})
        path = "mileage/"
        self.get(path, params)
      end

      def meter(params={})
        path = "meter/"
        self.get(path, params)
      end
    end
  end
end
