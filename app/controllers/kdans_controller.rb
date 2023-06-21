class KdansController < ApplicationController

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
																fotos_attributes: [:foto, :picture, :foto_name])
	end
end