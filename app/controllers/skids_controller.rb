class SkidsController < ApplicationController
	before_action :set_all

	def new
		#@skid = Skid.new
		@ekid = Ekid.find(params[:ekid])
		if @ekid.skid.present?
			@skid=@ekid.skid
		else
			@skid = Skid.create(ekid_id: @ekid.id, stat: false)
		end
		
		@ate = @ekid.ate
		@pte = @ekid.pte
		@ste = @ekid.ste
		@ote = @ekid.ote
		@chkl = @ekid.chkl
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
		@ate = @ekid.ate
		@pte = @ekid.pte
		@ste = @ekid.ste
		@ote = @ekid.ote
		@chkl = @ekid.chkl
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