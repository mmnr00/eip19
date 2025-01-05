class Btan < ApplicationRecord
	serialize :household,Hash
	serialize :histbtn,Hash
	serialize :descrls,Array
	has_many	:fotos
end


