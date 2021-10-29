class Ekrp < ApplicationRecord
	belongs_to :ekid
	serialize :exmls,Array
end
