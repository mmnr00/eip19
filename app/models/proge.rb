class Proge < ApplicationRecord
	has_many :perproges
	has_many :perses, through: :perproges
	has_many :prgfds
	has_many :cntps
	has_many :fbproges
end
