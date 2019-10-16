class SkidsController < ApplicationController
	before_action :set_all

	def new
		@skid = Skid.new
		@ekid = Ekid.find(params[:ekid])
	end

	def create
		@skid = Skid.new(skid_params)
		@ekid = @skid.ekid
		if @skid.save
			flash[:success] = "Screening Data Created"
		else
			flash[:danger] = "Creation Failed. Please try again"
		end
		redirect_to sce_path(@ekid.sce)
	end

	def edit
		@skid = Skid.find(params[:id])
		@ekid = Ekid.find(params[:ekid])
	end

	def update
		@skid = Skid.find(params[:id])
		@ekid = @skid.ekid
		if @skid.update(skid_params)
			flash[:success] = "Screening Data Edited"
		else
			flash[:danger] = "Edit Failed. Please try again"
		end
		redirect_to sce_path(@ekid.sce)
	end

	private 

	def set_all
		@admin = current_admin
		@owner = current_owner
	end

	def skid_params
		params.require(:skid).permit(:dely,
																:delydesc,
																:phy,
																:cog,
																:comm,
																:soc,
																:adap,
																:reflt,
																:otnt,
																:ekid_id)
	end

end