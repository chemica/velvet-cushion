require "spec_helper"
#require 'velvet_cushion/decoders/simple_xml'

describe VelvetCushion::Decoders::SimpleXml do
  it "turns simple XML into an object" do
    xml = '<aa><bb>1</bb><cc>2</cc><dd>word</dd></aa>'
    object = VelvetCushion::Decoders::SimpleXml.new.decode(xml)
    expect(object).to eq({'aa' => {'bb' => '1', 'cc' => '2', 'dd' => 'word'}})
  end
end