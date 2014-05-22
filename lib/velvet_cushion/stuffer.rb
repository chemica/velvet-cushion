module VelvetCushion
  class Stuffer

    attr_accessor :model_class

    def stuff(model, source, opts = {})
      decoder = get_decoder(model, opts)
      hash = decoder.decode(source)

      stuff_from_hash model, hash
    end

    def stuff_from_hash(model, hash)
      hash.each do |key, value|
        inject(model, key.to_sym, value) if model.respond_to? key
      end
      model
    end

    def inject(model, key, value)
      key_sym = :"#{key}="
      model.send(key_sym, value) if model.respond_to?(key_sym)
      # if model.reflections[key].present?
      #   case model.reflections[key]
      #     when :has_many, :has_and_belongs_to_many
      #       inject_list(model, key, value)
      #     when :has_one, :belongs_to
      #       inject_object(model, key, value)
      #   end
      # end

    end

    def get_decoder(model, config = {})
      decoder = config[:decoder] ||  model.class.cushion_model_decoder || VelvetCushion.configuration.default_decoder
      decoder_classname = ActiveSupport::Inflector.camelize decoder
      class_from_string("VelvetCushion::Decoders::#{decoder_classname}").new
    end

    # Required for Ruby 1.9.3. Ruby 2 allows Object.const_get with delimiters
    def class_from_string(str)
      str.split('::').inject(Object) do |mod, class_name|
        mod.const_get(class_name)
      end
    end
  end
end