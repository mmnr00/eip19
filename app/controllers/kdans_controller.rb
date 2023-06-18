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

	def show
		@kdan = Kdan.find(params[:id])
	end

	def kdan_list
		@perse = Perse.find(params[:perse])
		@kdans = @perse.kdans
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