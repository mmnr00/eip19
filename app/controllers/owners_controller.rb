class OwnersController < ApplicationController
	before_action :authenticate_owner!
	before_action :set_owner

	def index
		@sce = Sce.find($scses[@owner.loc])
		@ekids = @sce.ekids
	end
	

	private 

	def set_owner
		@owner = current_owner
	end

	
	
end