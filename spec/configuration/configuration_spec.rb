require 'spec_helper'

describe VelvetCushion::Configuration do
  it "defaults to a :json default decoder but can be overridden" do
    # This tests two things, but the order of testing is important to ensure default behaviour is preserved.
    expect(VelvetCushion.configuration.default_decoder).to eq(:json)

    VelvetCushion.configure do |config|
      config.default_decoder = :simple_xml
    end

    expect(VelvetCushion.configuration.default_decoder).to eq(:simple_xml)

    VelvetCushion.configure do |config|
      config.default_decoder = :json
    end

    expect(VelvetCushion.configuration.default_decoder).to eq(:json)
  end

end
