class Commentcrime < ApplicationRecord
    belongs_to :user
    belongs_to :crime
    validates_presence_of :content, :user_id, :crime_id
end
