require "spec_helper"
require 'velvet_cushion/decoders/yaml'

describe VelvetCushion::Decoders::Yaml do
  it "turns simple JSON into an object" do
    yaml = <<-EOS
a:
  b:
    c: 1
    d: 2
EOS
    object = VelvetCushion::Decoders::Yaml.new.decode(yaml)
    expect(object).to eq({'a' => { 'b' => {'c' => 1, 'd' => 2}}})
  end
end