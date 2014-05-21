ActiveRecord::Schema.define do
  self.verbose = false

  create_table :plain_models, :force => true do |t|
    t.string :dummy
  end

  create_table :cushion_models, :force => true do |t|
    t.string :dummy
  end

  create_table :article_models, :force => true do |t|
    t.string :title
    t.text :body
  end
end