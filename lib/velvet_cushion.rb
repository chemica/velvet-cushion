require 'velvet_cushion/version'
# require 'velvet_cushion/active_record/acts/cushion'
# require 'active_record'

module VelvetCushion
  # begin
  #   require 'rails'
  #
  #   class Railtie < Rails::Railtie
  #     initializer 'acts_as_cushion.insert_into_active_record' do
  #       ActiveSupport.on_load :active_record do
  #         ActiveRecord::Base.send(:include, ActiveRecord::Acts::Cushion)
  #       end
  #     end
  #   end
  # rescue LoadError
  #   ActiveRecord::Base.send(:include, ActiveRecord::Acts::Cushion) if defined?(ActiveRecord)
  # end


  class << self

    # A configuration object. Must act like a hash and return sensible
    # values for all configuration options.
    attr_writer :configuration

    # Call this method to modify defaults in your initializers.
    #
    # @example
    #   VelvetCushion.configure do |config|
    #     config.default_decoder = :simple_xml
    #   end
    def configure()
      yield(configuration)
    end

    # The configuration object.
    # @see VelvetCushion.configure
    def configuration
      @configuration ||= Configuration.new
    end
  end

end
