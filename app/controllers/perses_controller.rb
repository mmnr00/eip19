class PersesController < ApplicationController

	def new
		@perse = Perse.new
	end

	def create
		@perse = Perse.new(perse_params)
		if @perse.save 
			redirect_to perseindex_path
		else
			render @perse.errors.full_messages
			render :new
		end
	end

	def persesch
		if params[:sch].present?
			flash[:notice] = "Sila Lengkapkan Maklumat Anda"
			redirect_to new_perse_path(ic: params[:icf])
		end
	end


	###### OLD PERSES ################

	def index
		@perses_index = Perse.all
		render action: "index", layout: "eipblank"
	end

	def show
		@perse = Perse.find(params[:id])
		render action: "show", layout: "eipblank"
	end

	# def new
	# 	@perse = Perse.new
	# 	render action: "new", layout: "eipblank"
	# end

	def create
		@perse = Perse.new(perse_params)
		if @perse.save 
			redirect_to perseindex_path
		else
			render @perse.errors.full_messages
			render :new
		end

	end

	def edit
		@perse = Perse.find(params[:id])
		render action: "edit", layout: "eipblank"
	end

	def update
		@perse = Perse.find(params[:id])
		if @perse.update(perse_params)
			redirect_to perseindex_path
		else
			render @perse.errors.full_messages
			render :new
		end
	end

	private

	def perse_params
		params.require(:perse).permit(:name,
															    :ic,
															    :ph,
															    :inc,
															    :gdr,
															    :dun,
															    :dob,
															    :add,
															    :race,
															    :backg,
															    :backgo,
															    :kdoku,
															    :kdiag,
															    :email)
	end

end