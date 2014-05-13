require "spec_helper"
require 'velvet_cushion/decoders/json'

describe VelvetCushion::Decoders::Json do
  it "turns simple JSON into an object" do
    json = '{"a":1, "b":"2", "c":0.2}'
    object = VelvetCushion::Decoders::Json.new.decode(json)
    expect(object).to eq({'a' => 1, 'b' => '2', 'c' => 0.2})
  end
end