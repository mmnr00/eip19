class IlscsController < ApplicationController
	before_action :authenticate_admin!, only: [:ilscindex,:ilsclistxls]
	before_action :set_all

	def statilsc
		pars = params[:ek]
		pars.each do |k,v|
			ek = Ilsc.find(k)
			ek.stat = v["stat"]
			ek.descr = v["descr"]
			ek.save
		end
		flash[:success] = "Kemaskini Status Berjaya"
		redirect_to request.referrer
	end

	def ilsclistxls
		@admin = current_admin
		# if params[:sce].present?
		# 	@ekids = Ekid.where(sce_id: params[:sce]).order('name ASC')
		# else
		# 	@ekids = Ekid.where(admloc: $admloc[@admin.id],stat: params[:stato]).order('name ASC')
		# end
		@ilscs = Ilsc.all
		if params[:sch].present?
			@ilscs = @ilscs.where(tp: params[:sch_fld]) unless params[:sch_fld].blank?
			@ilscs= @ilscs.where('name LIKE ?', "%#{params[:sch_str].upcase}%") unless params[:sch_str].blank?
			# if params[:stat].present?
			# 	if params[:stat] == "AKTIF"
			# 		@ekids = @ekids.where(stat: [nil,""])
			# 	else
			# 	 	@ekids = @ekids.where.not(stat: [nil,""])
			# 	end
			# 	@ilscs = @ilscs.where(stat: params[:stat])
				
			# end
		end
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = 'attachment; filename="ILSC List.xlsx"'
      }
    end
	end

	def ilscindex
		@admin = current_admin
		@ilscs = Ilsc.all
		@ekids = Ekid.all
		if params[:sch].present?
			@ilscs  = @ilscs.where(tp: params[:sch_fld]) unless params[:sch_fld].blank?
			@ilscs  = @ilscs.where('name LIKE ?', "%#{params[:sch_str].upcase}%") unless params[:sch_str].blank?
			# if params[:stat].present?
			# 	# if params[:stat] == "AKTIF"
			# 	# 	@ekids = @ekids.where(stat: [nil,""])
			# 	# else
			# 	# 	@ekids = @ekids.where.not(stat: [nil,""])
			# 	# end
			# 	@ekids = @ekids.where(stat: params[:stat])
				
			# end
		end
		@ddk = Ddk.all
	end

	def ilsc_conf
		@ilsc = Ilsc.find(params[:id])
		@perse = @ilsc.perse
		@diff = (Date.today.year*12+Date.today.month) - (@ilsc.dobn.year*12+@ilsc.dobn.month)
		@year = @diff/12
		@month = @diff - @year*12
	end

	def edit
		@ilsc = Ilsc.find(params[:id])
		@perse = @ilsc.perse
	end

	def update
		@ilsc = Ilsc.find(params[:id])
		if @ilsc.update(ilsc_params)
			ilsc_ls(@ilsc.id,params[:ilsc])
			@ilsc.save
			redirect_to ilsc_list_path(perse: @ilsc.perse.id)
		else
			render @ilsc.errors.full_messages
			render :edit
		end
	end

	def ilsc_list
		@perse = Perse.find(params[:perse])
		@ilscs = @perse.ilscs
	end

	def new
		@ilsc = Ilsc.new
		@ilsc.schi = {"1"=>["", "", "", ""], "2"=>["", "", "", ""], "3"=>["", "", "", ""], "4"=>["", "", "", ""], "5"=>["", "", "", ""]}
		@ilsc.crls = {"1"=>["", "", ""], "2"=>["", "", ""], "3"=>["", "", ""], "4"=>["", "", ""], "5"=>["", "", ""]} 
		@ilsc.sbls = {"1"=>["", "", "", "", ""], "2"=>["", "", "", "", ""], "3"=>["", "", "", "", ""], "4"=>["", "", "", "", ""], "5"=>["", "", "", "", ""], "6"=>["", "", "", "", ""], "7"=>["", "", "", "", ""], "8"=>["", "", "", "", ""], "9"=>["", "", "", "", ""], "10"=>["", "", "", "", ""]} 
		@perse = Perse.find(params[:perse])
		@ilsc.fotos.build
		if params[:sch].present?
			ilsc_exs = Ilsc.where(ic: params[:ic], tp: params[:prog])
			if ilsc_exs.present?
				flash[:danger] = "No MYKAD #{ilsc_exs.last.name} ini sudah didaftarkan oleh #{ilsc_exs.last.perse.name}"
			else
				@cfm = true
			end
		end
		#render action: "new", layout: "eipblank"
	
	end

	

	def create
		@ilsc = Ilsc.new(ilsc_params)
		#double entry
		if (exs=Ilsc.where(ic: @ilsc.ic, tp: @ilsc.tp)).present?
			flash[:danger] = "NAMA ANAK SUDAH DIDAFTARKAN DALAM SISTEM"
			redirect_to edit_ilsc_path(id: exs.first.id)
		else

			

			if @ilsc.save 
				ilsc_ls(@ilsc.id,params[:ilsc])
				

				flash[:success] = "Pendaftaran Diterima. Pihak ANIS akan menghubungi anda jika permohonan diluluskan"
				redirect_to ilsc_list_path(perse: @ilsc.perse.id)
			else
				render @ilsc.errors.full_messages
				render :new
			end
		end
	end

	private

	def ilsc_ls(id,params)
		par = params
		@ilsc = Ilsc.find(id)
		par[:schi].each do |k,v|
			@ilsc.schi[k] = [v["sek"],v["tahun"],v["keluar"],v["pencapaian"]]
		end

		par[:crls].each do |k,v|
			@ilsc.crls[k] = [v["nmcr"],v["ven"],v["prd"]]
		end

		par[:sbls].each do |k,v|
			@ilsc.sbls[k] = [v["nmsb"],v["age"],v["skjb"],v["sbph"],v["thp"]]
		end

		par[:prtls].each do |k,v|
			@ilsc.prtls[k] = v
		end

		par[:warls].each do |k,v|
			@ilsc.warls[k] = v
		end
		@ilsc.save
	end

	def ilsc_params
		params.require(:ilsc).permit(:name,
																:ic,
																:applnm,
																:applic,
																:addr,
																:ph,
																:vote,
																:email,
																:race,
																:relg,
																:oku,
																:dobn,
																:gender,
																:diag,
																:lastsch,
																:allerg,
																:perse_id,
																:tp,
																:birthplc,
														    :phtr,
														    :sport,
														    :hobby,
														    :jobint,
														    :occdiag,
														    :medc,
														    :occmedc,
														    :amtmedc,
														    :docnm,
														    :docph,
														    :crstp => [],
																fotos_attributes: [:foto, :picture, :foto_name])
	end

	def set_all
		@admin = current_admin
	end

end