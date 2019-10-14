class Chkl < ApplicationRecord
	belongs_to :ekid
	serialize :gmtr,Hash
	serialize :fmtr,Hash
	serialize :adbh,Hash
	serialize :splg,Hash
	serialize :cogn,Hash
	serialize :audl,Hash
	serialize :prvb,Hash
	serialize :rcel,Hash
end
