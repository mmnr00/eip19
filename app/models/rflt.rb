class Rflt < ApplicationRecord
	belongs_to :ekid
	serialize :rfpl,Hash
	serialize :ota,Hash
	serialize :sta,Hash
	serialize :ata,Hash
	serialize :pta,Hash
end
