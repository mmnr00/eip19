class Perse < ApplicationRecord
	has_many :perproges
	has_many :proges, through: :perproges
	has_one  :ddk
	has_many :ekids
	has_many :prgfds
	serialize :stdoku,Array
	before_save :save_perses

	private 

	def save_perses
		self.add = self.add.upcase
		self.name = self.name.upcase
	end

end
