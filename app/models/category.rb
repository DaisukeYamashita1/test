class Category < ApplicationRecord
  has_many :contents, foreign_key: 'category_id' 
end
