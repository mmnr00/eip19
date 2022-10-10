class Perproge < ApplicationRecord
	belongs_to :perse
	belongs_to :proge
	serialize :att,Array
end
