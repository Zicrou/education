class Centre < ApplicationRecord
    has_many :juris

    validates_presence_of :numcentre
end
