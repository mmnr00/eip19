class Btan < ApplicationRecord
	serialize :household,type: Hash
	serialize :histbtn,type: Hash
	serialize :descrls,type: Array
	belongs_to :perse
	has_many	:fotos
	accepts_nested_attributes_for :fotos
	before_save :save_btans

	private

	def save_btans
		self.nmkd = self.nmkd.upcase
	end

end


