class PersesController < ApplicationController

	def edit
		@perse = Perse.find(params[:id])
	end

	def update
		@perse = Perse.find(params[:id])
		if params[:perse][:proge].present?
			@proge = Proge.find(params[:perse][:proge])
			if @perse.stdoku.blank? && params[:perse][:stdoku].blank? && (@proge.tp.include? "CIKGU ANIS")
				flash[:danger] = "Sila Pilih Satu Kategori Murid"
				redirect_to request.referrer and return
			end
		end
		#@perse.stdoku = nil
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
		if params[:perse][:proge].present?
			@proge = Proge.find(params[:perse][:proge])
			if (@proge.tp.include? "CIKGU ANIS") && params[:perse][:stdoku].blank?
				flash[:danger] = "Sila Pilih Satu Kategori OKU Murid Anda"
				redirect_to request.referrer and return
			end
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

				elsif prog == "PUSAT ANIS" || prog == "TERAPI ANIS" || prog == "SARINGAN ANIS" || prog == "INTERVENSI ANIS" || prog == "PRASEKOLAH ANIS"
					if params[:perse][:regkid].present?
						redirect_to new_ekid_path(perse: @perse.id, prog: prog)
					else
						redirect_to ekid_list_path(perse: @perse.id)
					end
			

				elsif prog == "PERSEDIAAN ALAM PEKERJAAN" 
					if params[:perse][:regkid].present?
						redirect_to new_ilsc_path(perse: @perse.id, prog: prog)
					else
						redirect_to ilsc_list_path(perse: @perse.id)
					end
				elsif prog == "KAD ANIS" 
					if params[:perse][:regkid].present?
						redirect_to new_ilsc_path(perse: @perse.id, prog: prog)
					else
						redirect_to ilsc_list_path(perse: @perse.id)
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
		if params[:proge].present?
			prg = Proge.find(params[:proge])
			if (!prg.acv) && (params[:prog] != "CIKGU ANIS") && (params[:att].blank?)
				flash[:danger] = "Maaf pendaftaran telah ditutup. Sila hubungi Penyelaras Program untuk maklumat lanjut"
				redirect_to persesch_path and return
			end
		end
		@verf = false
		if params[:sch].present? #start search
			perse = Perse.where(ic: params[:icf]).last

			if perse.present? #IC present?
				if params[:ph].present? #dah masuk no fon
					if perse.ph == params[:ph]
						flash[:success] = "Selamat Kembali #{perse.name}"
						ppr = Perproge.where(perse_id: perse.id, proge: params[:proge]).last
						if params[:att].present?
							if ppr.present?
								ppr.att << params[:dt] unless (ppr.att.include? params[:dt])
								ppr.save
								flash[:success] = "Kehadiran Anda Telah Direkodkan"
							else
								flash[:success] = "Rekod anda tiada dalam pendaftaran program. Sila daftar and sahkan semula kedatangan"
							end
							redirect_to persesch_path(prog: "AKADEMI ANIS", proge: params[:proge]) and return
						end

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
									elsif prg.tp.include? "SEMINAR SUKARELAWAN"
									if perse.backgs.present?
										Perproge.create(perse_id: perse.id, proge_id: prg.id) unless prg.perses.where(id: perse.id).present?
										flash[:success] = "Pendaftaran Untuk #{prg.name} Berjaya!"
										redirect_to persesch_path(prog: params[:prog], proge: params[:proge])
									else
										flash[:danger] = "Sila Lengkapkan Maklumat Anda"
										redirect_to edit_perse_path(id: perse.id, prog: params[:prog], proge: params[:proge])
									end
								end
								

							elsif params[:prog] == "CIKGU ANIS"
								if Perproge.where(perse_id: perse.id, proge_id: params[:proge]).present?
									if Fbproge.where(perse_id: perse.id, proge_id: params[:proge]).present?
										# redirect_to progecert_path(perse: perse.id, proge: params[:proge])
										flash[:notice] = "Terima kasih atas maklumbalas anda"
										redirect_to persesch_path
									else
										flash[:danger] = "Sila Lengkapkan Maklumbalas Program"
										redirect_to newfbproge_path(perse: perse.id, proge: params[:proge])
									end
									
								else
									flash[:danger] = "Anda Tidak Mendaftar ke Program Ini"
									redirect_to persesch_path(proge: params[:proge], prog: params[:prog])
								end
								

							elsif params[:prog] == "PUSAT ANIS" || params[:prog] == "SARINGAN ANIS" || params[:prog] == "TERAPI ANIS" || params[:prog] == "INTERVENSI ANIS" || params[:prog] == "PRASEKOLAH ANIS"
								if params[:regkid].present?
									redirect_to new_ekid_path(perse: perse.id, prog: params[:prog])
								else
									redirect_to ekid_list_path(perse: perse.id)
								end
							elsif params[:prog] == "PERSEDIAAN ALAM PEKERJAAN" || params[:prog] == "TRANSISI PEKERJAAN" 
								if params[:regkid].present?
									redirect_to new_ilsc_path(perse: perse.id, prog: params[:prog])
								else
									redirect_to ilsc_list_path(perse: perse.id)
								end
							elsif params[:prog] == "KAD ANIS" 
								if params[:regkid].present?
									redirect_to new_kdan_path(perse: perse.id, prog: params[:prog])
								else
									redirect_to kdan_list_path(perse: perse.id)
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
				if params[:prog] == "CIKGU ANIS"
					flash[:danger] = "No MyKad Anda Tiada Dalam Rekod"
					redirect_to request.referrer
				elsif params[:prog] == "AKADEMI ANIS"
					# flash[:success] = "Rekod anda tiada dalam pendaftaran program. Sila daftar and sahkan semula kedatangan"
					# redirect_to persesch_path(prog: "AKADEMI ANIS", proge: params[:proge])
					flash[:notice] = "Sila Lengkapkan Maklumat Anda"
					redirect_to new_perse_path(ic: params[:icf], prog: params[:prog], proge: params[:proge], regkid: params[:regkid])
				else
					flash[:notice] = "Sila Lengkapkan Maklumat Anda"
					redirect_to new_perse_path(ic: params[:icf], prog: params[:prog], proge: params[:proge], regkid: params[:regkid])
				end
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
															    :backgs,
															    :backgoth,
															    :kdoku,
															    :kdiag,
															    :email,
															    :stdoku => [])
	end

end