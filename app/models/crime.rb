class Crime < ApplicationRecord
    has_many :commentcrimes
    has_many :reports
    belongs_to :user
    belongs_to :category
    validates_presence_of :category_id, :area, :title, :description, :user_id
    validates_length_of :title, minimum: 6, maximum: 50
end
