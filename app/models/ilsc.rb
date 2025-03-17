class Ilsc < ApplicationRecord
	has_many :fotos
	accepts_nested_attributes_for :fotos
	belongs_to :perse
	serialize :schi,type: Hash
	serialize :crls,type: Hash
	serialize :sbls,type: Hash
	serialize :prtls,type: Hash
	serialize :warls,type: Hash
	serialize :prevmaj,type: Hash
	serialize :hosdoc,type: Hash
	serialize :hosdocnw,type: Hash
	serialize :crstp,type: Array
	serialize :admupd,type: Array

	before_save :save_ilscs

	private

	def save_ilscs
		self.name = self.name.upcase
	end

end
