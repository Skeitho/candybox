class Item < ActiveRecord::Base
	has_and_belongs_to_many :catalogs
	has_and_belongs_to_many :tags
	has_many :images
end
