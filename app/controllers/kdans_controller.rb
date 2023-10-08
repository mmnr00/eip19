class KdansController < ApplicationController

	def ecardanis
		@kdan = Kdan.find(params[:id])
		if @kdan.stat != "Permohonan Lulus"
			redirect_to kdan_path(@kdan.id) and return
		end
		qrcode = RQRCode::QRCode.new("https://www.anisselangor.com/ecardanis?id=#{@kdan.id}")
		@svg = qrcode.as_svg(
		  offset: 0,
		  color: '000',
		  backgroundcolor: 'white',
		  shape_rendering: 'crispEdges',
		  module_size: 5,
		  standalone: true
		)
		render action: "ecardanis", layout: "eipblank" 
	end

	def kdanxls
		init_kdans = Kdan.all
		@kdans = init_kdans.where('extract(year from created_at) = ?', params[:yr]) unless params[:yr].blank?
		puts @kdans.count
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = "attachment; filename=Senarai Kad ANIS.xlsx"
      }
		end
	end

	def new
		@perse = Perse.find(params[:perse])
		@kdan = Kdan.new
		@kdan.fotos.build

		if params[:sch].present?
			dt = check_bday(params[:ic])
			kdan_exs = Kdan.where(ic: params[:ic])

			if kdan_exs.present?
				flash[:danger] = "No MYKID #{kdan_exs.last.name} ini sudah didaftarkan oleh #{kdan_exs.last.perse.name}"
			else
				if (dt>=18)
					@kid = false
					@cfm = true
					@kdantp = "DEWASA"
				else
					@kid = true
					@cfm = true
					@kdantp = "KANAK-KANAK"
				end
			end

		end
	end

	def create
		@kdan = Kdan.new(kdan_params)
		if @kdan.save
			flash[:success] = "Permohonan Kad ANIS Diterima. Terima kasih"
			redirect_to kdan_path(@kdan)
		else
			flash[:danger] = "Permohonan tidak berjaya. Sila Cuba Semula"
			redirect_to request.referrer
		end
	end

	def edit
		@kdan = Kdan.find(params[:id])
		if @kdan.tp == "KANAK-KANAK"
			@kid = true 
			@kdantp = "KANAK-KANAK"
		else
			@kid = false
			@kdantp = "DEWASA"
		end
	end

	def update
		@kdan = Kdan.find(params[:id])
		puts @kdan.update(kdan_params)
		if @kdan.update(kdan_params)
			flash[:success] = "Kemaskini Berjaya"
			redirect_to kdan_path(id: @kdan.id)
		else
			flash[:danger] = "Kemaskini Tidak Berjaya"
			redirect_to request.referrer
		end
	end

	def show
		@kdan = Kdan.find(params[:id])
	end

	def updkdan
		pars = params[:kdan]
		@kdan = Kdan.find(pars[:kdan])
		@kdan.stat = pars[:stat]
		@kdan.admcmt = pars[:admcmt]
		if @kdan.save
			flash[:success] = "Permohonan Berjaya Dikemaskini"
			if @kdan.stat == "Permohonan Lulus"
				link = "https://www.anisselangor.com/ecardanis?id=#{@kdan.id}"
				body = "
				Tahniah! Permohonan Kad ANIS untuk <b>#{@kdan.name}</b> telah diluluskan.<br><br>

				Sila klik <a href=#{link} >disini</a> untuk mendapatkan <i>E-Card</i> anda. Terima kasih. <br><br>

				Jabatan ANIS

				"
				if @kdan.email.present?
					emel = @kdan.email
				else
					emel = @kdan.prtemail
				end
				send_email("Permohonan Kad ANIS diluluskan",emel,"",body)
			end
			redirect_to kdan_index_path
		else
			flash[:danger] = "Kemaskini Tidak Berjaya. Sila Cuba Semula"
			redirect_to request.referrer
		end
		
	end

	def kdan_list
		@perse = Perse.find(params[:perse])
		@kdans = @perse.kdans
	end

	def kdan_index
		@kdans = Kdan.all
		if params[:sch].present?
			@kdans = @kdans.where('name LIKE ?', "%#{params[:sch_str].upcase}%") unless params[:sch_str].blank?
			if @kdans.blank?
				@kdans = Kdan.where('ic LIKE ?', "%#{params[:sch_str]}%") unless params[:sch_str].blank?
			end
			@kdans = @kdans.where(stat: params[:sch_stat]) unless params[:sch_stat].blank?
			@kdans = @kdans.where('extract(year from created_at) = ?', params[:yr]) unless params[:yr].blank?
		end
		render action: "kdan_index", layout: "dsb-admin-kad"
	end

	private
	def kdan_params
		params.require(:kdan).permit(:name,
																:ic,
																:okukd,
																:gender,
																:race,
																:dob,
																:brtplc,
																:addr,
																:job,
																:payr,
																:prtname,
																:prtrel,
																:prtic,
																:prtgender,
																:prtrace,
																:prtaddr,
																:prtfon,
																:prtemail,
																:prtjob,
																:prtpay,
																:perse_id,
																:tp,
																:notel,
																:email,
																:stat,
																:catg,
																fotos_attributes: [:foto, :picture, :foto_name])
	end
end