require 'spec_helper'

describe ActiveRecord::Acts::Cushion do
  it "isn't included unless specified" do
    expect(PlainModel.new.respond_to?(:stuff_with)).not_to be_true
  end

  it "is included when specified" do
    expect(CushionModel.new.respond_to?(:stuff_with)).to be_true
  end
end