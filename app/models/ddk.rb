class Ddk < ApplicationRecord
	belongs_to :perse
	has_many	:fotos
	accepts_nested_attributes_for :fotos
	before_save :save_ddks

	private

	def save_ddks
		self.coname = self.coname.upcase
		self.conum = self.conum.upcase
	end

end
