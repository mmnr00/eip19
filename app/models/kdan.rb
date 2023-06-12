class Kdan < ApplicationRecord
	has_many :fotos
	accepts_nested_attributes_for :fotos
	belongs_to :perse

	before_save :save_kdans

	private

	def save_ilscs
		#self.name = self.name.upcase
	end
end
