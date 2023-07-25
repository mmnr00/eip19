class IlscsController < ApplicationController
	before_action :authenticate_admin!, only: [:ilscindex,:ilsclistxls]
	before_action :set_all

	def cpcuindex
		@admin = current_admin
		@ilscs = Ilsc.where(tp: "CPCU")
		@ekids = Ekid.all
		@ilscs = @ilscs.where('extract(year from created_at) = ?', params[:yr]) unless params[:yr].blank?
		if params[:sch].present?
			@ilscs  = @ilscs.where(tp: params[:sch_fld]) unless params[:sch_fld].blank?
			@ilscs  = @ilscs.where('name LIKE ?', "%#{params[:sch_str].upcase}%") unless params[:sch_str].blank?
			if params[:sch_crs].present?
				crs = {"Kursus Jahitan"=>"1",
        "Kursus Bakeri"=>"2",
        "Kursus Pengurusan Pejabat"=>"3",
        "Kursus Teknologi Digital"=>"4",
        "Kursus Kecerdasan Buatan"=>"5"}

        slc_crs = crs[params[:sch_crs]]
        arr_il = []
        @ilscs.each do |il|
        	arr_il << il.id unless !il.crstp.include? slc_crs

        end
        @ilscs = Ilsc.where(id: arr_il)
			end
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
		render action: "cpcuindex", layout: "dsb-admin-cpcu"
	end

	def cpcu_list
		@perse = Perse.find(params[:perse])
		@ilscs = @perse.ilscs.where(tp: "CPCU")
	end

	def ilscdet
		@admin = current_admin
		@ilscs = Ilsc.where(tp: "DET & JOB COACH")
		@ekids = Ekid.all
		@ilscs = @ilscs.where('extract(year from created_at) = ?', params[:yr]) unless params[:yr].blank?
		if params[:sch].present?
			@ilscs  = @ilscs.where(tp: params[:sch_fld]) unless params[:sch_fld].blank?
			@ilscs  = @ilscs.where('name LIKE ?', "%#{params[:sch_str].upcase}%") unless params[:sch_str].blank?
			if params[:sch_crs].present?
				crs = {"Kursus Jahitan"=>"1",
        "Kursus Bakeri"=>"2",
        "Kursus Pengurusan Pejabat"=>"3",
        "Kursus Teknologi Digital"=>"4",
        "Kursus Kecerdasan Buatan"=>"5"}

        slc_crs = crs[params[:sch_crs]]
        arr_il = []
        @ilscs.each do |il|
        	arr_il << il.id unless !il.crstp.include? slc_crs

        end
        @ilscs = Ilsc.where(id: arr_il)
			end
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
		render action: "ilscdet", layout: "dsb-admin-ilscdet" 
	end

	def ilscari
		@admin = current_admin
		@ilscs = Ilsc.where(tp: "PENCARIAN PEKERJAAN")
		@ekids = Ekid.all
		@ilscs = @ilscs.where('extract(year from created_at) = ?', params[:yr]) unless params[:yr].blank?
		if params[:sch].present?
			@ilscs  = @ilscs.where(tp: params[:sch_fld]) unless params[:sch_fld].blank?
			@ilscs  = @ilscs.where('name LIKE ?', "%#{params[:sch_str].upcase}%") unless params[:sch_str].blank?
			if params[:sch_crs].present?
				crs = {"Kursus Jahitan"=>"1",
        "Kursus Bakeri"=>"2",
        "Kursus Pengurusan Pejabat"=>"3",
        "Kursus Teknologi Digital"=>"4",
        "Kursus Kecerdasan Buatan"=>"5"}

        slc_crs = crs[params[:sch_crs]]
        arr_il = []
        @ilscs.each do |il|
        	arr_il << il.id unless !il.crstp.include? slc_crs

        end
        @ilscs = Ilsc.where(id: arr_il)
			end
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
		render action: "ilscari", layout: "dsb-admin-ilscari" 
	end


	def ilscphs
		pars = params[:ek]
		ek = Ilsc.find(pars[:ilsc])
		ek.update(phs: pars[:phs],descr: pars[:descr], dtp: pars[:dtp], dts: pars[:dts], dte:pars[:dte],plcadm:pars[:plcadm],crsadm:pars[:crsadm])
		#ek.admupd << [Date.today, current_admin.id, ek.stat, pars[:phs], pars[:descr],pars[:dtp],pars[:dts],pars[:dte],pars[:tp],pars[:sesd],pars[:sest]]
		ek.save  
		flash[:success] = "Kemaskini Status Berjaya"
		redirect_to request.referrer
	end

	def ilsc_stat
		@ilsc = Ilsc.find(params[:id])
		@ilsc.stat = params[:stat]
		@ilsc.save
		flash[:success] = "Status #{@ilsc.name} berjaya dikemaskini"
		redirect_to request.referrer
	end

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
		@phs = ["Permohonan Baru","Permohonan Tidak Lengkap", "Permohonan Lengkap (Dalam Semakan)", "Permohonan Ditolak","Permohonan Dalam Senarai Menunggu","Panggilan Temuduga", "Lulus Temuduga","Gagal Temuduga","Kemasukan Program","Tamat Program"]
		@ilscs = Ilsc.where(tp: "PERSEDIAAN ALAM PEKERJAAN")
		#@ekids = Ekid.all
		@ilscs = @ilscs.where('extract(year from created_at) = ?', params[:yr]) unless params[:yr].blank?
		if params[:sch].present?
			@ilscs  = @ilscs.where(tp: params[:sch_fld]) unless params[:sch_fld].blank?
			@ilscs  = @ilscs.where('name LIKE ?', "%#{params[:sch_str].upcase}%") unless params[:sch_str].blank?
			if params[:sch_crs].present?
				crs = {"Kursus Jahitan"=>"1",
        "Kursus Bakeri"=>"2",
        "Kursus Pengurusan Pejabat"=>"3",
        "Kursus Teknologi Digital"=>"4",
        "Kursus Kecerdasan Buatan"=>"5"}

        slc_crs = crs[params[:sch_crs]]
        arr_il = []
        @ilscs.each do |il|
        	arr_il << il.id unless !il.crstp.include? slc_crs

        end
        @ilscs = Ilsc.where(id: arr_il)
			end
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
		render action: "ilscindex", layout: "dsb-admin-ilsc" 
	end

	def ilsc_conf
		@ilsc = Ilsc.find(params[:id])
		@ekid = @ilsc
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
			if @ilsc.tp == "CPCU"
				redirect_to cpcu_list_path(perse: @ilsc.perse.id)
			else
				redirect_to ilsc_list_path(perse: @ilsc.perse.id)
			end
			
		else
			render @ilsc.errors.full_messages
			render :edit
		end
	end

	def ilsc_list
		@perse = Perse.find(params[:perse])
		@ilscs = @perse.ilscs.where.not(tp: "CPCU")
	end

	def new
		@ilsc = Ilsc.new
		@ilsc.schi = {"1"=>["", "", "", ""], "2"=>["", "", "", ""], "3"=>["", "", "", ""], "4"=>["", "", "", ""], "5"=>["", "", "", ""]}
		@ilsc.crls = {"1"=>["", "", ""], "2"=>["", "", ""], "3"=>["", "", ""], "4"=>["", "", ""], "5"=>["", "", ""]}
		@ilsc.prevmaj = {"1"=>["", "", ""], "2"=>["", "", ""], "3"=>["", "", ""], "4"=>["", "", ""], "5"=>["", "", ""]} 
		@ilsc.hosdoc = {"1"=>["", ""], "2"=>["", ""], "3"=>["", ""], "4"=>["", ""], "5"=>["", ""]} 
		@ilsc.sbls = {"1"=>["", "", "", "", ""], "2"=>["", "", "", "", ""], "3"=>["", "", "", "", ""], "4"=>["", "", "", "", ""], "5"=>["", "", "", "", ""], "6"=>["", "", "", "", ""], "7"=>["", "", "", "", ""], "8"=>["", "", "", "", ""], "9"=>["", "", "", "", ""], "10"=>["", "", "", "", ""]} 
		@perse = Perse.find(params[:perse])
		@ilsc.fotos.build
		if params[:sch].present?
			if params[:prog] == "PERSEDIAAN ALAM PEKERJAAN"
				dt = check_bday(params[:ic])
				if ((dt>=17) && (dt<=25))
					ilsc_exs = Ilsc.where(ic: params[:ic], tp: params[:prog])
					if ilsc_exs.present?
						flash[:danger] = "No MYKAD #{ilsc_exs.last.name} ini sudah didaftarkan oleh #{ilsc_exs.last.perse.name}"
					else
						@cfm = true
					end
				else
					flash[:danger] = "Umur peserta tidak menetapi syarat program (17 hingga 25 tahun)"
					redirect_to request.referrer	
				end
			elsif params[:prog] == "PENCARIAN PEKERJAAN"
				dt = check_bday(params[:ic])
				if ((dt>=18) && (dt<=35))
					ilsc_exs = Ilsc.where(ic: params[:ic], tp: params[:prog])
					if ilsc_exs.present?
						flash[:danger] = "No MYKAD #{ilsc_exs.last.name} ini sudah didaftarkan oleh #{ilsc_exs.last.perse.name}"
					else
						@cfm = true
					end
				else
					flash[:danger] = "Umur peserta tidak menetapi syarat program (18 hingga 35 tahun)"
					redirect_to request.referrer	
				end
			elsif params[:prog] == "DET & JOB COACH"
				ilsc_exs = Ilsc.where(ic: params[:ic], tp: params[:prog])
				if ilsc_exs.present?
					flash[:danger] = "No MYKAD #{ilsc_exs.last.name} ini sudah didaftarkan oleh #{ilsc_exs.last.perse.name}"
				else
					@cfm = true
				end
			elsif params[:prog] == "CPCU"
				ilsc_exs = Ilsc.where(ic: params[:ic], tp: params[:prog])
				if ilsc_exs.present?
					flash[:danger] = "No MYKAD #{ilsc_exs.last.name} ini sudah didaftarkan oleh #{ilsc_exs.last.perse.name}"
				else
					@cfm = true
				end
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
				puts "before-#{@ilsc.tp}"
				if @ilsc.tp == "PERSEDIAAN ALAM PEKERJAAN"
					@ilsc.stat = "Permohonan"
					@ilsc.phs = "Permohonan Baru"
				elsif @ilsc.tp == "PENCARIAN PEKERJAAN"
					@ilsc.phs = "Permohonan Dalam Semakan"
				end
				@ilsc.save
				puts "after-#{@ilsc.tp}"
				flash[:success] = "Pendaftaran Diterima. Pihak ANIS akan menghubungi anda jika permohonan diluluskan"
				if @ilsc.tp == "CPCU"
					redirect_to cpcu_list_path(perse: @ilsc.perse.id)
				else
					redirect_to ilsc_list_path(perse: @ilsc.perse.id)
				end
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
		if par[:schi].present?
			par[:schi].each do |k,v|
				@ilsc.schi[k] = [v["sek"],v["tahun"],v["keluar"],v["pencapaian"]]
			end
		end

		if par[:crls].present?
			par[:crls].each do |k,v|
				@ilsc.crls[k] = [v["nmcr"],v["ven"],v["prd"]]
			end
		end

		if par[:prevmaj].present?
			par[:prevmaj].each do |k,v|
				@ilsc.prevmaj[k] = [v["nmj"],v["jwt"],v["tempoh"]]
			end
		end

		if par[:hosdoc].present?
			par[:hosdoc].each do |k,v|
				@ilsc.hosdoc[k] = [v["hosnm"],v["diag"]]
			end
		end

		if par[:sbls].present?
			par[:sbls].each do |k,v|
				@ilsc.sbls[k] = [v["nmsb"],v["age"],v["skjb"],v["sbph"],v["thp"]]
			end
		end

		if par[:prtls].present?
			par[:prtls].each do |k,v|
				@ilsc.prtls[k] = v
			end
		end

		if par[:warls].present?
			par[:warls].each do |k,v|
				@ilsc.warls[k] = v
			end
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
														    :stat,
														    :phs,
														    :marstat,
																:dun,
																:parl,
																:prevmaj,
																:majnm,
														    :majjw,
														    :majjbt,
														    :majtmp,
														    :majadd,
														    :majtel,
														    :majfaks,
														    :majeml,
														    :okufm,
														    :rdoku,
														    :othcrs,
																:selspr,
																:nmwr,
																:relwr,
																:telhmwr,
																:phwr,
																:crstp => [],
																fotos_attributes: [:foto, :picture, :foto_name])
	end

	def set_all
		@admin = current_admin
	end

end