class Hotline < ApplicationRecord
    validates_presence_of :area, :hotline_number
end
