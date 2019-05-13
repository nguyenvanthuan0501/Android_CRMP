class Report < ApplicationRecord
    belongs_to :reportcategory
    validates_presence_of :reportcategory_id, :post_id
end
