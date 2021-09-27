class Shell < ApplicationRecord
validates :name, uniqueness: true

has_many :ratings
end
