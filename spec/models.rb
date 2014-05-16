class PlainModel < ActiveRecord::Base

end

class CushionModel < ActiveRecord::Base
  acts_as_cushion
end