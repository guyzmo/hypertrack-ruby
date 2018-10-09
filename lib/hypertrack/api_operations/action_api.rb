module HyperTrack
  module ApiOperations
    module ActionAPI
      def update(params)
        patch(params)
      end

      def complete(params={})
        path = 'complete/'
        post(path, params)
      end

      def cancel(params={})
        path = 'cancel/'
        post(path, params)
      end

      def mileage(params={})
        path = 'mileage/'
        get(path, params)
      end

      def meter(params={})
        path = 'meter/'
        get(path, params)
      end
    end
  end
end
