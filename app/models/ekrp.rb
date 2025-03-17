class Ekrp < ApplicationRecord
	belongs_to :ekid
	serialize :exmls,type: Array
end
