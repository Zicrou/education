class Exercice < ApplicationRecord
	validates_presence_of :title, :introduction, :developpement, :conclusion
end
