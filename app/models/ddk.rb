class Ddk < ApplicationRecord
	belongs_to :perse
	before_save :save_ddks

	private

	def save_ddks
		self.coname = self.coname.upcase
		self.conum = self.conum.upcase
	end

end
