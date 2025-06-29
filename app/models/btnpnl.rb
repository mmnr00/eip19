class Btnpnl < ApplicationRecord
	before_save :save_btnpnls

	private

	def save_btnpnls
		self.name = self.name.upcase
	end
end
