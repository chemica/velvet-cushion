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

  it "stuffs an author with articles" do
    author = AuthorModel.new
    author.stuff_with('{"name":"Henry Biggins", "article_models":[{"title":"title 1", "body":"body 1"},' +
                                                           '{"title":"title 2", "body":"body 2"}]}')
    expect(author.name).to eq('Henry Biggins')
    expect(author.article_models.first.title).to eq('title 1')
    expect(author.article_models.last.body).to eq('body 2')
  end
end
