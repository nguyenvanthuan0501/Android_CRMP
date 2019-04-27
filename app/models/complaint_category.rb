class ComplaintCategory < ApplicationRecord
    has_many :complaints
    validates_presence_of :name
end
