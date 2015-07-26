class Product < ActiveRecord::Base
  scope :search_test, lambda { |query| fuzzy_search(query, query) }
end
