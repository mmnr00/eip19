class IlscsController < ApplicationController
	before_action :authenticate_admin!, only: [:index,:ekidlistxls]
	before_action :set_all

	def ilsc_list
		@perse = Perse.find(params[:perse])
		@ilscs = @perse.ilscs
	end

	def new
		@ilsc = Ilsc.new
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
			redirect_to edit_ekid_path(id: exs.first.id)
		else
			if @ilsc.save 
				flash[:success] = "Pendaftaran Diterima. Pihak ANIS akan menghubungi anda jika permohonan diluluskan"

			else
				render @ilsc.errors.full_messages
				render :new
			end
		end
	end

	private

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
																:dob,
																:gender,
																:diag,
																:lastsch,
																:allerg,
																:perse_id,
																:tp)
	end

	def set_all
		@admin = current_admin
	end

end