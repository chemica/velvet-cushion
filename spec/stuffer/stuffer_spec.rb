require 'spec_helper'


describe VelvetCushion::Stuffer do
  before(:each) do

  end

  it "stuffs an ArticleModel from JSON" do
    article = ArticleModel.new
    article.stuff_with('{"title": "This is the title", "body": "This is the body"}')
    expect(article.title).to eq("This is the title")
    expect(article.body).to eq("This is the body")
  end
end