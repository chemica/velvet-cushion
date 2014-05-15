require 'yaml'

module VelvetCushion
  module Decoders
    class Yaml
      def decode(yaml)
        YAML.load yaml
      end
    end
  end
end