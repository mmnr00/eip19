class Ekid < ApplicationRecord
	has_one :pkid
	has_one :skid
	has_one :ote
	has_one :pte
	has_one :ste
	has_one :ate
	has_one :chkl
	has_one :rflt
	belongs_to :sce, optional: true
end
