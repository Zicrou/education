class Country < ApplicationRecord
    has_many :regions
    has_many :responszone

    validates_presence_of :name
end
