class OwnersController < ApplicationController
	before_action :authenticate_owner!, except: [:updowner]
	before_action :set_owner

	def index
		if @owner.tchdetail.blank?
			redirect_to new_tchdetail_path(owner_id: @owner.id)
		end
		@sce = Sce.where(curr: true, loc: @owner.loc).first
		@ekids = @sce.ekids unless @sce.blank?
	end

	def updowner
		flash[:notice] = "Update Successful"
		redirect_to acclist_path(tb2_a: "active", tb2_ar: true, tb2_d:"show active")
	end
	

	private 

	def set_owner
		@owner = current_owner
	end

	
	
end