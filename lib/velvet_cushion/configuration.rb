module VelvetCushion
  # Used to set up and modify settings for the stuffing procedure.
  class Configuration

    OPTIONS = [:default_decoder].freeze

    # defaults to :json
    attr_accessor :default_decoder

    def initialize
      self.default_decoder = :json
    end

    # Allows config options to be read like a hash
    #
    # @param [Symbol] option Key for a given attribute
    def [](option)
      send(option)
    end

    # Returns a hash of all configurable options
    def to_hash
      OPTIONS.inject({}) do |hash, option|
        hash[option.to_sym] = self.send(option)
        hash
      end
    end

  end
end