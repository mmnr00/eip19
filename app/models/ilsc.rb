class Ilsc < ApplicationRecord
	has_many :fotos
	belongs_to :perse
	serialize :schi,Hash
	serialize :crls,Hash
	serialize :sbls,Hash
	serialize :prtls,Hash
	serialize :warls,Hash

	before_save :save_ilscs

	private

	def save_ilscs
		self.name = self.name.upcase
	end

end
