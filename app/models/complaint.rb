class Complaint < ApplicationRecord
    belongs_to :user
    belongs_to :complaint_categories, class_name: 'ComplaintCategory'
end
