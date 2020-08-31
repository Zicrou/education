class Juri < ApplicationRecord
    belongs_to :centre

    validates_presence_of :numjuri, :centre_id
end
