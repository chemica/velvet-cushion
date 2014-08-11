module ActiveRecord
  module Acts
    module Cushion
      def self.included(base)
        base.extend(ClassMethods)
      end

      # Methods available to "acts_as_cushion" models.
      module InstanceMethods

        def stuff_with(source, options = {})
          stuffer = VelvetCushion::Stuffer.new self
          stuffer.stuff source, options
        end

      end

      # An +acts_as+ module that adds the ability to stuff model instances full of data (normally from a JSON API).
      # Nested objects will be guessed from model associations.
      module ClassMethods
        # config options are:
        #
        # * +decoder+ - specifies the default decoder to use for stuffing this model
        def acts_as_cushion(options = {})
          config = { decoder: nil }
          config.update(options) if options.is_a?(Hash)

          class_eval <<-EOF
          include ActiveRecord::Acts::Cushion::InstanceMethods
          EOF

          @cushion_model_decoder = config[:decoder] || VelvetCushion.configuration.default_decoder
        end

        def cushion_model_decoder
          @cushion_model_decoder
        end

      end

    end
  end
end
