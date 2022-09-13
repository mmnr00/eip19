class Ilsc < ApplicationRecord
	has_many :fotos
	accepts_nested_attributes_for :fotos
	belongs_to :perse
	serialize :schi,Hash
	serialize :crls,Hash
	serialize :sbls,Hash
	serialize :prtls,Hash
	serialize :warls,Hash
	serialize :crstp,Array

	before_save :save_ilscs

	private

	def save_ilscs
		self.name = self.name.upcase
	end

end
