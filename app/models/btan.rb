class Btan < ApplicationRecord
	serialize :household,type: Hash
	serialize :histbtn,type: Hash
	serialize :descrls,type: Array
	belongs_to :perse
	has_many	:fotos
	accepts_nested_attributes_for :fotos
end


