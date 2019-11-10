class OwnersController < ApplicationController
	before_action :authenticate_owner!
	before_action :set_owner

	def index
		if @owner.tchdetail.blank?
			redirect_to new_tchdetail_path(owner_id: @owner.id)
		end
		@sce = Sce.where(curr: true, loc: @owner.loc).first
		@ekids = @sce.ekids unless @sce.blank?
	end
	

	private 

	def set_owner
		@owner = current_owner
	end

	
	
end