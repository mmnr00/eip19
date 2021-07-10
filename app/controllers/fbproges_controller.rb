class FbprogesController < ApplicationController

	def newfbproge
		@proge = Proge.find(params[:proge])
		@fbproge = Fbproge.new
	end

end