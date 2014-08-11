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
    t.references :author_model
  end

  create_table :author_models, :force => true do |t|
    t.string :name
  end

  create_table :address_models, :force => true do |t|
    t.string :name_or_number
    t.string :address
    t.string :postal_code
    t.references :author_model
  end

end
