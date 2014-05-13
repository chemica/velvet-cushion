require 'json'

module VelvetCushion
  module Decoders
    class Json
      def decode(json)
        JSON.parse json
      end
    end
  end
end