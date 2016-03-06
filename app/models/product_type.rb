class ProductType < ActiveRecord::Base
	has_many :fields, class_name: 'ProductField'
end
