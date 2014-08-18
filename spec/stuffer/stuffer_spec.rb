require 'spec_helper'


describe VelvetCushion::Stuffer do
  before(:each) do

  end

  it "stuffs an Article from a hash" do
    article = Article.new
    article.stuff_with('{"title": "A title", "body": "A body"}')
    expect(article.title).to eq("A title")
    expect(article.body).to eq("A body")
  end

  it "stuffs an Author with Articles (has_many)" do
    author = Author.new
    author.stuff_with('{"name":"Henry Biggins", "articles":[{"title":"title 1", "body":"body 1"},' +
                                                           '{"title":"title 2", "body":"body 2"}]}')
    expect(author.name).to eq('Henry Biggins')
    expect(author.articles.first.title).to eq('title 1')
    expect(author.articles.last.body).to eq('body 2')
    expect(author.articles.first.author).to eq(author)
  end

  it "stuffs an Author with an Address (has_one)" do
    author = Author.new
    author.stuff_with('{"name":"Henry Biggins", "address":{"name_or_number": "Duncodin",
                                                           "address": "Finite Loop",
                                                           "postal_code": "XY1 2AB"}}')
    expect(author.address.name_or_number).to eq('Duncodin')
    expect(author.address.address).to eq('Finite Loop')
    expect(author.address.postal_code).to eq('XY1 2AB')
    expect(author.address.author).to eq(author)
  end




end
