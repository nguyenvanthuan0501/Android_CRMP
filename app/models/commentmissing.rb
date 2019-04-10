class Commentmissing < ApplicationRecord
    belongs_to :user
    belongs_to :missing
    validates_presence_of :content, :user_id, :missing_id
end