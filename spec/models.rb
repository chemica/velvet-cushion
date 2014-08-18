class Plain < ActiveRecord::Base

end

class Cushioned < ActiveRecord::Base
  acts_as_cushion
end

class Article < ActiveRecord::Base
  acts_as_cushion
  belongs_to :author
  has_many :reviews
  has_many :reviewers, through: :reviewers
end

class Author < ActiveRecord::Base
  acts_as_cushion
  has_many :articles
  has_one :address
  has_and_belongs_to_many :publishers
end

class Address < ActiveRecord::Base
  acts_as_cushion
  belongs_to :author
end

class Publisher < ActiveRecord::Base
  acts_as_cushion
  has_and_belongs_to_many :authors
end

class Review < ActiveRecord::Base
  acts_as_cushion
  has_one :article
  has_one :reviewer
end

class Reviewer < ActiveRecord::Base
  acts_as_cushion
  has_many :reviews
  has_many :articles, through: :reviews
end
