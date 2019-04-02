class Category < ApplicationRecord
    has_many :crimes
    validates_presence_of :name_category
    validates_uniqueness_of :name_category
end
