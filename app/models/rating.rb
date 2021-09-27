class Rating < ApplicationRecord
    belongs_to :User
    belongs_to :Shell
end
