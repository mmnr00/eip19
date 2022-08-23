class IlscsController < ApplicationController
	before_action :authenticate_admin!, only: [:ilscindex,:ekidlistxls]
	before_action :set_all

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
		@perse = Perse.find(params[:perse])
	end

	def update
		@ilsc = Ilsc.find(params[:id])
		if @ilsc.update(ilsc_params)
			@ilsc.save
			redirect_to ilsc_list_path(perse: @ilsc.perse.id)
		else
			render @ekid.errors.full_messages
			render :edit
		end
	end

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
				redirect_to ilsc_list_path(perse: @ilsc.perse.id)
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
																:dobn,
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