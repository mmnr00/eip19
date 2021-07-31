class Qsa < ApplicationRecord
	
	before_save :save_qsas

	private

	def save_qsas
		self.ques = self.ques.upcase
	end
	
end
