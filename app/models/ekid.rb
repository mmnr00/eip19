class Ekid < ApplicationRecord
	has_one :pkid
	has_one :skid
	has_one :ote
	has_one :pte
	has_one :ste
	has_one :ate
	has_one :chkl
	has_one :rflt
	has_many :fotos
	accepts_nested_attributes_for :fotos
	belongs_to :perse
	belongs_to :sce, optional: true
	belongs_to :parent, optional: true
	before_save :save_ekids

	private

	def save_ekids
		self.name = self.name.upcase
	end

end
