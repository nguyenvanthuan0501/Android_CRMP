class Crime < ApplicationRecord
    belongs_to :users
    belongs_to :categorys
end
