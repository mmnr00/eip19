class Pkid < ApplicationRecord
	belongs_to :ekid
	serialize :devkid,type: Hash
	serialize :addfo,type: Hash
	serialize :health,type: Hash
	serialize :birth,type: Hash
	serialize :grow,type: Hash
	serialize :physpch,type: Hash
	serialize :agr,type: Hash
end
