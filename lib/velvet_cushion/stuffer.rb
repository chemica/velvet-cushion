module VelvetCushion
  class Stuffer

    attr_accessor :model

    def initialize(model)
      self.model = model
    end

    def stuff(source, opts = {})
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

    private

      def inject(model, key, value)
        reflections = model.reflections[key.to_sym]
        if reflections.present?
          self.send "stuff_#{reflections.macro}", model, key, value
        else
          key_sym = :"#{key}="
          model.send(key_sym, value) if model.respond_to?(key_sym)
        end
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

      def stuff_has_many(model, key, value)
        inject_list(model, key, value)
      end
      alias :stuff_has_and_belongs_to_many :stuff_has_many

      def stuff_has_one(model, key, value)
        inject_object(model, key, value)
      end
      alias :stuff_belongs_to :stuff_has_one

      def create_related_object(model, key, value)
        rel_model = model.send(key).build
        rel_model.stuff_with(value, :decoder => :hash)
      end

      def create_singular_object(model, key, value)
        rel_model = model.send(:"build_#{key}")
        rel_model.stuff_with(value, :decoder => :hash)
      end

      def inject_object(model, key, value)
        rel_model = create_singular_object(model, key, value)
        model.send :"#{key}=", rel_model
      end

      def inject_list(model, key, value)
        value.each do |v|
          rel_model = create_related_object(model, key, v)
          model.send(key).send(:<<, rel_model)
        end
      end
    end
end
