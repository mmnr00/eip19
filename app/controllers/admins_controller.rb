class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def laporan
		@yr_arr = (2021..Date.today.year)
		if params[:prg] == "DIDIK ANIS"

			@prg = "Didik ANIS"
			@all = Ddk.all
			@table_1 = {}
			@yr_arr.each do |yr|
				all_yr = @all.where('extract(year  from created_at) = ?', yr)
				@table_1[yr] = [all_yr.where(stat: "3").count,
											all_yr.where(stat: "1").count,
											all_yr.where(stat: "2").count,
											all_yr.where(stat: "4").count]
			end


		end
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = "attachment; filename=Laporan #{@prg}.xlsx"
      }
		end
	end

	def senaraipeserta
		@index = true
		@perses = Perse.all
		render action: "senaraipeserta", layout: "dsb-admin-pers" 
	end

	def edtddk
		@ddk = Ddk.find(params[:ddk])
	end

	def upddk
		pars = params[:ddk]
		@ddk = Ddk.find(pars[:ddk])
		@ddk.stat = pars[:stat]
		@ddk.statrs = pars[:statrs]
		@ddk.amtpmt = pars[:amtpmt]
		@ddk.dtpmt = pars[:dtpmt]
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
		@admin = current_admin
		render action: "index", layout: "dsb-admin-overview" 
	end

	def oldlsddk
		@ddk = Ddk.where(old1: true)
	end

	def lsddk
		@ddk = Ddk.where(old1: nil)
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
		render action: "lsddk", layout: "dsb-admin-ddk" 
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