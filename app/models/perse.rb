class Perse < ApplicationRecord
	has_many :perproges
	has_many :proges, through: :perproges
	has_one  :ddk
	has_many :ekids
	has_many :ilscs
	has_many :prgfds
	serialize :stdoku,Array
	has_many :fbproges
	before_save :save_perses

	private 

	def save_perses
		self.add = self.add.upcase
		self.name = self.name.upcase
	end

end
