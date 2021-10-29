class Qsa < ApplicationRecord
	
	before_save :save_qsas

	private

	def save_qsas
		self.ques = self.ques.upcase
		self.ans = self.ans.upcase unless self.ans.blank?
		self.catg = self.catg.upcase
	end
	
end
