class Missing < ApplicationRecord
    has_many :commentmissings
    has_many :reports
    belongs_to :user
    validates_presence_of :title, :description, :phone_number, :user_id
    validates_length_of :title, minimum: 6, maximum: 50
end
