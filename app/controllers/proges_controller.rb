class ProgesController < ApplicationController

	def progeperse_xls
		@proge = Proge.find(params[:proge])
		@perses = @proge.perses
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = 'attachment; filename="PENDAFTARAN.xlsx"'
      }
    end
	end

	def updacv
		proge = Proge.find(params[:proge])
		proge.acv = !proge.acv
		proge.save
		flash[:notice] = "Program Dikemaskini"
		redirect_to request.referrer
	end

	def send_cert
		flash[:success] = "Email sent"
		proge = Proge.find(params[:proge])
		subject = "Sijil Penyertaan untuk #{proge.name}"
		proge.perses.each do |prs|
			link = "https://www.anisselangor.com/progecert?perse=#{prs.id}&proge=#{proge.id}"
			body = "
			Terima kasih <b>#{prs.name}</b> kerana telah menyertai <b>#{proge.name}</b> pada 
			<b>#{proge.date.strftime('%d-%m-%Y')}</b><br><br>

			Sila <a href=#{link}> KLIK DISINI </a> untuk mendapatkan sijil penyertaan anda. <br><br>

			Yang Berusaha,<br>
			<b>Jabatan ANIS</b> 
			"
			send_email(subject,prs.email,"",body)
		end
		
		redirect_to request.referrer
	end

	def upld_perse
		xlsx = Roo::Spreadsheet.open(params[:file])
    header = xlsx.row(xlsx.first_row)
    ((xlsx.first_row+1)..(xlsx.last_row)).each do |n|
    	row = Hash[[header, xlsx.row(n)].transpose]
    	ic = row["MYKAD"]

    	#create perse
    	if Perse.where(ic: ic).present?
    		perse = Perse.where(ic: ic).first
    	else
    		perse = Perse.new
    		perse.name = row["NAMA"]
				perse.ic = row["MYKAD"]
				if row["PHONE"][0] != "0"
					ph = "0#{row["PHONE"]}"
				else
					ph = row["PHONE"]
				end
				perse.ph = ph
				perse.gdr = row["GENDER"]
				dt = row["MYKAD"].to_s
				if dt.to_i <= 0
					perse.dob = Date.new("19#{dt[0..1]}".to_i,dt[2..3].to_i,dt[4..5].to_i)
				end
				perse.race = row["RACE"]
				perse.backg = row["BACKG"]
				perse.kdoku = row["OKU"]
				perse.kdiag = row["JENIS OKU"]
				perse.email = row["EMAIL"]
				if row["ALAMAT"].present?
					add = row["ALAMAT"]
				else
					add = "Tiada Alamat"
				end
				perse.add = add
				perse.save
    	end

    	#create perproge
    	if Perproge.where(perse_id:perse.id, proge_id:row["EVENT"]).blank?
    		Perproge.create(perse_id:perse.id, proge_id:row["EVENT"])
    	end

    end
	end

	def progeregls
		@proges = Proge.all
	end

	def progeperse
		@proge = Proge.find(params[:proge])
		@perses = @proge.perses
	end

	def progecert
		@perse = Perse.find(params[:perse])
		@proge = Proge.find(params[:proge])
		render action: "progecert", layout: "eipblank"
	end

	def index
		@proges = Proge.all
		# render action: "index", layout: "eipblank"
	end

	def show
		@proge = Proge.find(params[:id])
		render action: "show", layout: "eipblank"
	end

	

	def new
		@proge = Proge.new
		# render action: "new", layout: "eipblank"
	end

	def create
		@proge = Proge.new(proge_params)
		if @proge.save 
			redirect_to progeindex_path
		else
			render @proge.errors.full_messages
			render :new
		end

	end

	def edit
		@proge = Proge.find(params[:id])
		# render action: "edit", layout: "eipblank"
	end

	def update
		@proge = Proge.find(params[:id])
		if @proge.update(proge_params)
			redirect_to progeindex_path
		else
			render @proge.errors.full_messages
			render :new
		end
	end

	def destroy
		@proge = Proge.find(params[:id])
		@proge.destroy
		redirect_to progeindex_path
	end

	## OLD PROGRES

	def showatt
		@proge = Proge.find(params[:id])
		render action: "showatt", layout: "eipblank"
	end

	def schperse
		@proge = Proge.find(params[:proge])
		render action: "schperse", layout: "eipblank"
	end

	def findperse
		if params[:ic].blank?
			flash.now[:danger] = "Please key in"
		else
			if params[:typ] == "att"
				@perse = Perse.where(ic: params[:ic])
				if @perse.present?
					@perproge = Perproge.where(perse_id: @perse.first.id,
																	proge_id: params[:proge]).first
				else
					flash.now[:danger] = "NO RECORD. PLEASE CLICK BELOW TO REGISTER"
				end
			else
		    #@perse = Perse.where("ic like?", "%#{params[:ic]}%")
		    @perse = Perse.where(ic: params[:ic])
		    flash.now[:danger] = "NO RECORD. PLEASE CLICK BELOW TO REGISTER" unless @perse.present?
		  end
	  end
  	respond_to do |format|
		  format.js { render partial: 'proges/result' } 
		end   
	end

	def regproge
		Perproge.create(perse_id: params[:perse],
										proge_id: params[:proge],
										stat: "REG")
		redirect_to regconf_path(proge: params[:proge], perse: params[:perse])
	end

	def regconf
		@perproge = Perproge.where(proge_id: params[:proge], perse_id: params[:perse]).first
		render action: "regconf", layout: "eipblank"
	end

	def editreg
		@perse = Perse.find(params[:id])
		@proge = Proge.find(params[:proge])
		render action: "editreg", layout: "eipblank"
	end

	def updreg
		@perse = Perse.find(params[:perse][:id])
		@proge = Proge.find(params[:perse][:proge])
		if @perse.update(perse_params)
			Perproge.create(perse_id: @perse.id,
											proge_id: @proge.id,
											stat: "REG")
			redirect_to regconf_path(proge: @proge.id, perse: @perse.id)
		else
			render @perse.errors.full_messages
			render :new
		end
	end

	def newreg
		@perse = Perse.new
		@proge = Proge.find(params[:proge])
		render action: "newreg", layout: "eipblank"
	end

	def crtreg
		@perse = Perse.new(perse_params)
		exs = Perse.where(ic: @perse.ic).first
		@perse = exs unless exs.blank?
		@proge = Proge.find(params[:perse][:proge])

		if @perse.save && Perproge.where(perse_id: @perse.id,proge_id: @proge.id,stat: "REG").blank?
			Perproge.create(perse_id: @perse.id,
											proge_id: @proge.id,
											stat: "REG")
			#redirect_to regconf_path(proge: @proge.id, perse: @perse.id)
		end
		redirect_to regconf_path(proge: @proge.id, perse: @perse.id)
	end

	def cfmatt
		@perse = Perse.find(params[:id])
		@proge = Proge.find(params[:proge])
		@perproge = Perproge.find(params[:perproge])
		render action: "cfmatt", layout: "eipblank"
	end

	def updatt
		@perse = Perse.find(params[:perse][:id])
		@proge = Proge.find(params[:perse][:proge])
		@perproge = Perproge.find(params[:perse][:perproge])
		if @perse.update(perse_params)
			@perproge.stat = "BOTH"
			@perproge.save
		end
		flash[:success] = "Thank you. Your attendance has been confirmed"
		redirect_to attconf_path(id: @perproge.id, tp: "att")
	end

	def regatt
		@perse = Perse.find(params[:id])
		@proge = Proge.find(params[:proge])
		#@perproge = Perproge.find(params[:perproge])
		render action: "regatt", layout: "eipblank"
	end

	def newexsatt
		@perse = Perse.find(params[:perse][:id])
		@proge = Proge.find(params[:perse][:proge])
		#@perproge = Perproge.find(params[:perse][:perproge])
		if @perse.update(perse_params)
			@perproge = Perproge.create(perse_id: @perse.id,
																	proge_id: @proge.id,
																	stat: "ATT")
		end
		redirect_to attconf_path(id: @perproge.id, tp: "att")
	end

	def newatt
		@perse = Perse.new
		@proge = Proge.find(params[:proge])
		render action: "newatt", layout: "eipblank"
	end

	def crtnewatt
		@perse = Perse.new(perse_params)
		@proge = Proge.find(params[:perse][:proge])
		if @perse.save
			@perproge = Perproge.create(perse_id: @perse.id,
											proge_id: @proge.id,
											stat: "ATT")
			redirect_to attconf_path(id: @perproge.id, tp: "att")
		else
			render @perse.errors.full_messages
			render :new
		end
	end

	def attconf
		@perproge = Perproge.find(params[:id])
		render action: "attconf", layout: "eipblank"
	end

	## ~ Extract List
	def namelistxls
		@proge = Proge.find(params[:proge])
		if params[:tp] == "reg"
			@tp = "REGISTRATION"
			@prg = Perproge.where(proge_id: @proge.id).where.not(stat: "ATT")
		elsif params[:tp] == "att"
			@tp = "ATTENDANCE"
			@prg = Perproge.where(proge_id: @proge.id).where.not(stat: "REG")
		end
		@proge = Proge.find(params[:proge])
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = 'attachment; filename="Name List.xlsx"'
      }
    end
	end


	private

	def perse_params
		params.require(:perse).permit(:name, 
																	:ic, 
																	:ph, 
																	:inc,
																	:gdr,
																	:dun,
																	:dob)
	end

	def proge_params
		params.require(:proge).permit(:name, 
																	:date, 
																	:venue, 
																	:start,
																	:end,
																	:tp)
	end
	
end