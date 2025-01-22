class Btan < ApplicationRecord
	serialize :household,Hash
	serialize :histbtn,Hash
	serialize :descrls,Array
	has_many	:fotos
	accepts_nested_attributes_for :fotos
end


