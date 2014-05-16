module ActiveRecord
  module Acts
    module Cushion
      def self.included(base)
        base.extend(ClassMethods)
      end

      # An +acts_as+ module that adds the ability to stuff model instances full of data (normally from a JSON API).
      # Nested objects will be guessed from model associations.
      module ClassMethods
        # config options are:
        #
        # * +decoder+ - specifies the decoder to use for stuffing this model
        def acts_as_cushion(options = {})
          config = { decoder: nil }
          config.update(options) if options.is_a?(Hash)

          class_eval <<-EOV
            include ::ActiveRecord::Acts::Cushion::InstanceMethods

            def cushion_model_decoder
              #{config[:decoder] || VelvetCushion.configuration.default_decoder}
            end

          EOV
        end
      end

      # Methods available to "acts_as_cushion" models.
      module InstanceMethods

        def stuff_with(source, options = {})
          config = { decoder: cushion_model_decoder }
          config.update(options) if options.is_a?(Hash)

          decoder = cushion_get_decoder_instance(config)

          hash = decoder.decode(source)

          stuff_from_hash hash
        end

        def stuff_from_hash(hash)

        end

        private

        def cushion_get_decoder_instance(config)
          config[:decoder] ||= cushion_model_decoder

          decoder_classname = ActiveSupport::Inflector.camelize(config[:decoder])
          Object.const_get("VelvetCushion::Decoders::#{decoder_classname}").new
        end

      end
    end
  end
end