class PlainModel < ActiveRecord::Base

end

class CushionModel < ActiveRecord::Base
  acts_as_cushion
end

class ArticleModel < ActiveRecord::Base
  acts_as_cushion
  belongs_to :author_model
end

class AuthorModel < ActiveRecord::Base
  acts_as_cushion
  has_many :article_models
  has_one :address
end

class AddressModel < ActiveRecord::Base
  acts_as_cushion
  belongs_to :author_model
end
