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

	# def create (dah x masuk sebab dah ada)
	# 	@skid = Skid.new(skid_params)
	# 	@ekid = @skid.ekid
	# 	if @skid.save
	# 		flash[:success] = "Screening Data Created"
	# 		if @skid.reflt == "Yes"
	# 		else
	# 			redirect_to owner_index_path
	# 		end
	# 	else
	# 		flash[:danger] = "Creation Failed. Please try again"
	# 		redirect_to root_path
	# 		#redirect_to sce_path(@ekid.sce)
	# 	end		
	# end

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
			flash[:notice] = "Screening Report Updated"
			if @skid.reflt == "Yes"
				if @ekid.rflt.present?
					redirect_to edit_rflt_path(id: @ekid.rflt.id, ekid: @ekid.id, rflt: 1)
				else
					redirect_to new_rflt_path(ekid: @ekid.id, rflt: 1)
				end 
			else
				redirect_to owner_index_path
			end
		else
			flash[:danger] = "Edit Failed. Please try again"
		end
		#redirect_to sce_path(@ekid.sce)
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
																:diag,
																:summ,
																:assr,
																:obs,
																:refc,
																:frmo,
																:scp,
																:cmt,
																:ovc,
																:stat,
																:ekid_id)
	end

end