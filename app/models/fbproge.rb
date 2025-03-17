class Fbproge < ApplicationRecord
	belongs_to :perse
	belongs_to :proge
	serialize :ctnr,type: Hash
end
