class KdansController < ApplicationController

	def new
		@perse = Perse.find(params[:perse])
		@kdan = Kdan.new
		@kdan.fotos.build

		if params[:sch].present?
			dt = check_bday(params[:ic])
			kdan_exs = Kdan.where(ic: params[:ic])

			if kdan_exs.present?
				flash[:danger] = "No MYKID {ekd_exs.last.name} ini sudah didaftarkan oleh {ekd_exs.last.perse.name}"
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
																fotos_attributes: [:foto, :picture, :foto_name])
	end
end