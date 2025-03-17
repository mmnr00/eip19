class Chkl < ApplicationRecord
	belongs_to :ekid
	serialize :gmtr,type: Hash
	serialize :fmtr,type: Hash
	serialize :adbh,type: Hash
	serialize :splg,type: Hash
	serialize :cogn,type: Hash
	serialize :audl,type: Hash
	serialize :prvb,type: Hash
	serialize :rcel,type: Hash
end
