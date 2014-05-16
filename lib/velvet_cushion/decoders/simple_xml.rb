require 'active_support'
require 'active_support/deprecation'
require 'active_support/core_ext'

module VelvetCushion
  module Decoders
    class SimpleXml
      def decode(xml)
        ActiveSupport::XMLConverter.new(xml, nil).to_h
      end
    end
  end
end