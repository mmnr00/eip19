class PersesController < ApplicationController

	def edit
		@perse = Perse.find(params[:id])
	end

	def update
		@perse = Perse.find(params[:id])
		if @perse.update(perse_params)
			redirect_to perse_path(id: @perse.id, flg: true)
		else
			render @perse.errors.full_messages
			render :edit
		end
	end

	def show
		if params[:flg].present?
			@perse = Perse.find(params[:id])
		else
			flash[:danger] = "Maklumat yang dimasukkan tidak tepat"
			redirect_to request.referrer
		end
	end

	def new
		@perse = Perse.new
		#redirect_to perse_path(id: Perse.last.id)
	end

	def create
		@perse = Perse.new(perse_params)
		if @perse.save 
			redirect_to perse_path(id: @perse.id, flg: true)
		else
			render @perse.errors.full_messages
			render :new
		end
	end

	def persesch
		@verf = false
		if params[:sch].present?
			perse = Perse.where(ic: params[:icf]).last

			if perse.present? #IC present?
				if params[:ph].present?
					if perse.ph == params[:ph]
						flash[:success] = "Selamat Kembali #{perse.name}"
						redirect_to perse_path(id: perse.id, flg: true)
					else
						@verf = true
						flash[:danger] = "No telefon yang dimasukkan tidak tepat"
					end
				else
					@verf = true
					flash[:success] = "Selamat Kembali #{perse.name}"
				end
				
				#redirect_to perse
			else #IC not present
				flash[:notice] = "Sila Lengkapkan Maklumat Anda"
				redirect_to new_perse_path(ic: params[:icf])
			end
	
		end
	end


	###### OLD PERSES ################

	def index
		@perses_index = Perse.all
		render action: "index", layout: "eipblank"
	end

	# def show
	# 	@perse = Perse.find(params[:id])
	# 	render action: "show", layout: "eipblank"
	# end

	# def new
	# 	@perse = Perse.new
	# 	render action: "new", layout: "eipblank"
	# end

	# def create
	# 	@perse = Perse.new(perse_params)
	# 	if @perse.save 
	# 		redirect_to perseindex_path
	# 	else
	# 		render @perse.errors.full_messages
	# 		render :new
	# 	end

	# end

	# def edit
	# 	@perse = Perse.find(params[:id])
	# 	render action: "edit", layout: "eipblank"
	# end

	# def update
	# 	@perse = Perse.find(params[:id])
	# 	if @perse.update(perse_params)
	# 		redirect_to perseindex_path
	# 	else
	# 		render @perse.errors.full_messages
	# 		render :new
	# 	end
	# end

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