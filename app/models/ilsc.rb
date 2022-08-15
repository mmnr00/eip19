class Ilsc < ApplicationRecord
	has_many :fotos
	belongs_to :perse
	before_save :save_ilscs

	private

	def save_ilscs
		self.name = self.name.upcase
	end

end
