ActiveRecord::Schema.define do
  self.verbose = false

  create_table :plains, :force => true do |t|
    t.string :dummy
  end

  create_table :cushioneds, :force => true do |t|
    t.string :dummy
  end

  create_table :articles, :force => true do |t|
    t.string :title
    t.text :body
    t.references :author
  end

  create_table :authors, :force => true do |t|
    t.string :name
  end

  create_table :addresses, :force => true do |t|
    t.string :name_or_number
    t.string :address
    t.string :postal_code
    t.references :author
  end

  create_table :authors_publishers, id: false do |t|
    t.references :authors
    t.references :publisher
  end

  create_table :publishers, :force => true do |t|
    t.string :name
  end

  create_table :reviews, :force => true do |t|
    t.references :article
    t.references :reviewer
    t.string :title
    t.text :body
  end

  create_table :reviewers, :force => true do |t|
    t.references :review
    t.string :first_name
    t.string :last_name
  end

end
