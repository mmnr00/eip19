class IlscsController < ApplicationController
	before_action :authenticate_admin!, only: [:index,:ekidlistxls]
	before_action :set_all

	def new
		@ilsc = Ilsc.new
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

	private

	def ilsc_params
		params.require(:ekid).permit(:name)
	end

	def set_all
		@admin = current_admin
	end

end