class PersesController < ApplicationController

	def edit
		@perse = Perse.find(params[:id])
	end

	def update
		@perse = Perse.find(params[:id])
		if @perse.stdoku.present? && params[:perse][:stdoku].blank?
			flash[:danger] = "Sila Pilih Satu Kategori Murid"
			redirect_to request.referrer and return
		end
		@perse.stdoku = nil
		@perse.save
		if @perse.update(perse_params)
			if params[:perse][:proge].present? && params[:perse][:prog] == "AKADEMI ANIS"
				perprg = Perproge.new(perse_id: @perse.id, proge_id: params[:perse][:proge])
				perprg.save
				flash[:success] = "Pendaftaran untuk #{perprg.proge.name} berjaya!"
				redirect_to persesch_path(prog: params[:perse][:prog], proge: params[:perse][:proge] )
			else
				redirect_to perse_path(id: @perse.id, flg: true)
			end
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
		@proge = Proge.find(params[:perse][:proge])
		if (@proge.tp.include? "CIKGU ANIS") && params[:perse][:stdoku].blank?
			flash[:danger] = "Sila Pilih Satu Kategori OKU Murid Anda"
			redirect_to request.referrer and return
		end
		if @perse.save 
			if (prog = params[:perse][:prog]).present?

				if prog == "DIDIK ANIS"
					redirect_to new_ddk_path(perse: @perse.id)

				elsif prog == "AKADEMI ANIS"
					Perproge.create(perse_id: @perse.id, proge_id: params[:perse][:proge])
					prg = Proge.find(params[:perse][:proge])
					flash[:success] = "Pendaftaran Untuk #{prg.name} Berjaya!"
					redirect_to persesch_path(prog: prog, proge: params[:perse][:proge] )

				elsif prog == "TERAPI ANIS" || prog == "SARINGAN ANIS" || prog == "INTERVENSI ANIS"
					if params[:perse][:regkid].present?
						redirect_to new_ekid_path(perse: @perse.id, prog: prog)
					else
						redirect_to ekid_list_path(perse: @perse.id)
					end
				end

			else
				redirect_to perse_path(id: @perse.id, flg: true)
			end
		else
			render @perse.errors.full_messages
			render :new
		end
	end

	def persesch
		@verf = false
		if params[:sch].present? #start search
			perse = Perse.where(ic: params[:icf]).last

			if perse.present? #IC present?
				if params[:ph].present? #dah masuk no fon
					if perse.ph == params[:ph]
						flash[:success] = "Selamat Kembali #{perse.name}"

						#program redirection
						if params[:prog].present?

							if params[:prog] == "DIDIK ANIS"
								redirect_to new_ddk_path(perse: perse.id)

							elsif params[:prog] == "AKADEMI ANIS"
								prg = Proge.find(params[:proge])
								if prg.tp.include? "SEMINAR ANIS"
									if perse.backg.present?
										Perproge.create(perse_id: perse.id, proge_id: prg.id) unless prg.perses.where(id: perse.id).present?
										flash[:success] = "Pendaftaran Untuk #{prg.name} Berjaya!"
										redirect_to persesch_path(prog: params[:prog], proge: params[:proge])
									else
										flash[:danger] = "Sila Lengkapkan Maklumat Anda"
										redirect_to edit_perse_path(id: perse.id, prog: params[:prog], proge: params[:proge])
									end
								elsif prg.tp.include? "CIKGU ANIS"
									if perse.stdoku.present?
										Perproge.create(perse_id: perse.id, proge_id: prg.id) unless prg.perses.where(id: perse.id).present?
										flash[:success] = "Pendaftaran Untuk #{prg.name} Berjaya!"
										redirect_to persesch_path(prog: params[:prog], proge: params[:proge])
									else
										flash[:danger] = "Sila Lengkapkan Maklumat Anda"
										redirect_to edit_perse_path(id: perse.id, prog: params[:prog], proge: params[:proge])
									end
								end

							elsif params[:prog] == "SARINGAN ANIS" || params[:prog] == "TERAPI ANIS" || params[:prog] == "INTERVENSI ANIS"
								if params[:regkid].present?
									redirect_to new_ekid_path(perse: perse.id, prog: params[:prog])
								else
									redirect_to ekid_list_path(perse: perse.id)
								end
							end	

						else
							redirect_to perse_path(id: perse.id, flg: true)
						end

					else
						@verf = true
						flash[:danger] = "No telefon yang dimasukkan tidak tepat"
					end
				else # belum masuk no fon
					@verf = true
					flash[:success] = "Selamat Kembali #{perse.name}"
				end
				
				#redirect_to perse
			else #IC not present ahli baru
				flash[:notice] = "Sila Lengkapkan Maklumat Anda"
				redirect_to new_perse_path(ic: params[:icf], prog: params[:prog], proge: params[:proge], regkid: params[:regkid])
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
															    :email,
															    :stdoku => [])
	end

end