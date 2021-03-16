class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def edtddk
		@ddk = Ddk.find(params[:ddk])
	end

	def upddk
		pars = params[:ddk]
		@ddk = Ddk.find(pars[:ddk])
		@ddk.stat = pars[:stat]
		@ddk.statrs = pars[:statrs]
		if @ddk.save
			flash[:success] = "Permohonan Berjaya Dikemaskini"
			redirect_to lsddk_path(@ddk)
		else
			redirect_to request.referrer
		end
	end

	def index
		@perses = Perse.all
		@ddk = Ddk.all
	end

	def lsddk
		@ddk = Ddk.all
		if params[:sch].present?
			@ddk = @ddk.where(stat: params[:stat]) unless params[:stat].blank?
			if (str=params[:sch_str]).present?
				fld = params[:sch_fld]
				str = str.upcase

				if fld == "No Siri (4 no belakang)"
					@ddk = @ddk.where(id: str)
				elsif fld == "Nama Agensi"
					@ddk = @ddk.where('coname LIKE ?', "%#{str}%")
				elsif fld == "No Pendaftaran Agensi"
					@ddk = @ddk.where('conum LIKE ?', "%#{str}%")
				end
			end

		end
	end


	######## OLD KIDCARE ###########

	def acclist
		@admin = current_admin
		@admins = Admin.all
		@teachers = Teacher.all
		@owners = Owner.all
	end



	def index_old
		@admin = current_admin
		@ekids = Ekid.where(admloc: $admloc[@admin.id])
		# if @admin.id == 1
		# 	@ekids = Ekid.all
		# elsif @admin.id == 2
		# 	@ekids = Ekid.where(admloc: "sha")
		# elsif @admin.id == 3
		# 	@ekids = Ekid.where(admloc: "srd")
		# end
		
		#render action: "index", layout: "eipblank"
	end

	def indexkcr
		@admin = current_admin
		@spv = @admin.spv
		if Rails.env.production?
			@admin_taska = current_admin.taskas.where.not(id: [5, 9, 1, 44, 45, 4, 48, 75])
		else
			@admin_taska = current_admin.taskas
		end
		@admin_taska.each do |taska|
			@taska_id = taska.id
			@taska_name = taska.name
		end
		#if @admin_taska.count == 1 ; redirect_to taska_path(@taska_id) end
		#render action: "index", layout: "eip"

	end

	
	
end