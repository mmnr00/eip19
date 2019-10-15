class EkidsController < ApplicationController
	before_action :authenticate_admin!, only: [:index]
	before_action :set_all

	def ekass
		tp = params[:tp]
		@ekid = Ekid.find(params[:id])
		if tp == "st"
			redirect_to edit_ste_path(ass: @ekid.ste.id, chkl: @ekid.chkl.id)
		elsif tp == "ot"
			redirect_to root_path(ass: 5, chkl: @ekid.chkl.id)
		end
	end

	def ekidsms
		@ekids = Ekid.where(id: params[:ekidid])
		@ekids.each do |ek|
			@client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_KEY"])
			@client.messages.create(
				to: "+60#{ek.mph}", 
				from: ENV["TWILIO_PHONE_NO"], 
				body: "\n\n MBI Selangor Incorporated 
				\n Terima kasih kerana mendaftar untuk Program Saringan Percuma anjuran MBI Selangor (INC).
				\n Tahniah! #{ek.name} telah disenaraipendek untuk proses pemilihan seterusnya. Untuk makluman, program seterusnya akan diadakan pada 22 September 2019 di Denai Alam.
				\n Sila whatsapp maklumat dibawah kepada urusetia Program, Pn Rusmina Sukim di 019-6072688
				\n 1. Nama Anak
				\n 2. Umur Anak dan No MyKid
				\n 3. No yang boleh dihubungi
				\n TEMPAT ADALAH AMAT TERHAD. Terima kasih atas kerjasama anda."
			)
		end
		flash[:success] = "SMS Sent to All #{@ekids.count}"
		redirect_to ekidindex_path(stato: params[:stato])
	end

	def ekidchg
		ekid = Ekid.find(params[:id])
		ekid.stat = params[:stat]
		if params[:loc] == "Shah Alam"
			loc = "sha"
		elsif params[:loc] == "Serdang"
			loc = "srd"
		end
		ekid.admloc = loc
		if ekid.save
			flash[:success] = "SUCCESS"
		else
			flash[:danger] = "FAILED. PLEASE TRY AGAIN"
		end
		redirect_to ekidindex_path(stato: params[:stato])
	end

	def ekidlistxls
		@admin = current_admin
		if params[:sce].present?
			@ekids = Ekid.where(sce_id: params[:sce]).order('name ASC')
		else
			@ekids = Ekid.where(admloc: $admloc[@admin.id],stat: params[:stato]).order('name ASC')
		end
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = 'attachment; filename="Name List.xlsx"'
      }
    end
	end

	def schekid
		render action: "schekid", layout: "eipblank"
	end

	def findekid
		@admin = current_admin
		if params[:ic].blank?
			flash.now[:danger] = "SILA MASUKKAN INPUT"
		else
			if params[:sce].present?
				@ekid = Ekid.where(ic: params[:ic])
			else
	    	@ekid = Ekid.where(ic: params[:ic])
	  	end
	    flash.now[:danger] = "TIADA DALAM REKOD" unless @ekid.present?
	  end
  	respond_to do |format|
		  format.js { render partial: 'ekids/result' } 
		end 
	end
	
	def index
		@admin = current_admin
		@ekids = Ekid.where(admloc: $admloc[@admin.id],stat: params[:stato])
		#render action: "index", layout: "eipblank"
	end

	def ekidconf
		@ekid = Ekid.find(params[:id])
		@diff = (Date.today.year*12+Date.today.month) - (@ekid.dob.year*12+@ekid.dob.month)
		@year = @diff/12
		@month = @diff - @year*12
		render action: "ekidconf", layout: "eipblank"
	end

	def ekidpdf
		@ekid = Ekid.find(params[:id])
		@diff = (Date.today.year*12+Date.today.month) - (@ekid.dob.year*12+@ekid.dob.month)
		@year = @diff/12
		@month = @diff - @year*12
		respond_to do |format|
	 		format.html
	 		format.pdf do
		   render pdf: "#{@ekid.name}",
		   template: "ekids/_profile.html.erb",
		   #disposition: "attachment",
		   #save_to_file: Rails.root.join('pdfs', "#{filename}.pdf"),
       #save_only: true, 
		   #page_size: "A6",
		   orientation: "portrait",
		   layout: 'pdf.html.erb'
			end
		end
	end

	def new
		@ekid = Ekid.new
		render action: "new", layout: "eipblank"
	end

	def create
		@ekid = Ekid.new(ekid_params)
		#double entry
		if (exs=Ekid.where(ic: @ekid.ic)).present?
			flash[:danger] = "NAMA ANAK SUDAH DIDAFTARKAN DALAM SISTEM"
			redirect_to edit_ekid_path(id: exs.first.id)
		else
			if @ekid.prefloc == "Shah Alam"
				@ekid.admloc = "sha"
			elsif @ekid.prefloc == "Serdang"
				@ekid.admloc = "srd"
			end
			#Filter early
			dob = @ekid.dob
			@age = (Date.today.year*12+Date.today.month) - (dob.year*12+dob.month)
			year = @age/12
			if @ekid.pinc == "Lebih dari 10,000" || (year >= 4)
				@ekid.stat = "REJECT"
			elsif @ekid.pinc == "5,000 hingga 10,000" && ((@ekid.sib.to_f) < 3)
				@ekid.stat = "REJECT"
			else
				@ekid.stat = "NEW"
			end
			if @ekid.save 
				redirect_to new_pkid_path(ekid: @ekid.id)
			else
				render @ekid.errors.full_messages
				render :new
			end
		end
	end

	def edit
		@ekid = Ekid.find(params[:id])
		render action: "edit", layout: "eipblank"
	end

	def update
		@ekid = Ekid.find(params[:id])
		if @ekid.update(ekid_params)
			if @ekid.prefloc == "Shah Alam"
				@ekid.admloc = "sha"
			elsif @ekid.prefloc == "Serdang"
				@ekid.admloc = "srd"
			end
			@ekid.save
			if (pkid = @ekid.pkid).present?
				redirect_to edit_pkid_path(pkid,ekid: @ekid.id)
			else
				redirect_to new_pkid_path(ekid: @ekid.id)
			end
		else
			render @ekid.errors.full_messages
			render :edit
		end
	end

	def xlsekid
	end

	def upldekids218
		xlsx = Roo::Spreadsheet.open(params[:file])
    header = xlsx.row(xlsx.first_row+2)
    @header2 = xlsx.row(xlsx.first_row+1)
    ((xlsx.first_row+3)..(xlsx.last_row)).each do |n|
      xlsx.row(n)
      @row = Hash[[header, xlsx.row(n)].transpose]
      ek = Ekid.create(name: @row["name"],
      						ic: @row["ic"],
      						gdr: @row["gdr"],
      						dob: @row["dob"],
      						dun:	@row["dun"],
									addr:	@row["addr"],
									mph:	@row["mmph"],
									fname:	@row["fname"],
									fage:	@row["fage"],
									fph:	@row["fph"],
									femail:	@row["femail"],
									fedu:	@row["fedu"],
									fwork:	@row["fwork"],
									fworktp:	@row["fworktp"],
									mname:	@row["mname"],
									mage:	@row["mage"],
									mmph:	@row["mmph"],
									memail:	@row["memail"],
									medu:	@row["medu"],
									mwork:	@row["mwork"],
									mworktp:	@row["mworktp"],
									sib:	@row["sib"],
									phist:	@row["phist"],
									phisttp:	@row["phisttp"],
									pinc:	@row["pinc"],
									ref:	@row["ref"],
									refloc:	@row["refloc"],
									prbtp:	@row["prbtp"],
									prbot:	@row["prbot"],
									stat: "CONF",
									prefloc: "Shah Alam",
									admloc: "sha",
									sce_id: @row["sce"],
									created_at: @row["Tarikh Pengesahan Kebenaran"])
      a=ek.ic
      ek.dob = Date.new("20#{a[0..1]}".to_i,a[2..3].to_i,a[4..5].to_i)
      ek.save
      # Start P Kid
      pk = Pkid.new(ekid_id: ek.id)
      #pk = Pkid.new(ekid_id: 9000)
      (16..19).each do |n|
      	pk.addfo[@row.keys[n]] = @row.values[n]
      end

      (20..37).each do |n|
      	pk.health[@row.keys[n]] = @row.values[n]
      end

      (38..41).each do |n|
      	pk.birth[@row.keys[n]] = @row.values[n]
      end

      (42..50).each do |n|
      	pk.grow[@row.keys[n]] = @row.values[n]
      end

      (51..66).each do |n|
      	pk.physpch[@row.keys[n]] = @row.values[n]
      end

      (67..71).each do |n|
      	pk.agr[@row.keys[n]] = @row.values[n]
      end


      (73..107).each do |n|
      	if @row.values[n].present?
      		pk.devkid[@row.keys[n]] = @row.values[n]
      	end
      end

      pk.created_at = @row["Tarikh Pengesahan Kebenaran"]
      pk.save
    end
    flash[:success] = "SUCCESS"
    #redirect_to ekidconf_path(id: ek.id)
    redirect_to admin_index_path
    #redirect_to ekidindex_path(stato: "CONFIRM")
	end

	def upldekids118
		xlsx = Roo::Spreadsheet.open(params[:file])
    header = xlsx.row(xlsx.first_row+2)
    @header2 = xlsx.row(xlsx.first_row+1)
    ((xlsx.first_row+3)..(xlsx.last_row)).each do |n|
      xlsx.row(n)
      @row = Hash[[header, xlsx.row(n)].transpose]
      ek = Ekid.create(name: @row["name"],
      						ic: @row["ic"],
      						gdr: @row["gdr"],
      						dob: @row["dob"],
      						dun:	@row["dun"],
									addr:	@row["addr"],
									mph:	@row["mmph"],
									fname:	@row["fname"],
									fage:	@row["fage"],
									fph:	@row["fph"],
									femail:	@row["femail"],
									fedu:	@row["fedu"],
									fwork:	@row["fwork"],
									fworktp:	@row["fworktp"],
									mname:	@row["mname"],
									mage:	@row["mage"],
									mmph:	@row["mmph"],
									memail:	@row["memail"],
									medu:	@row["medu"],
									mwork:	@row["mwork"],
									mworktp:	@row["mworktp"],
									sib:	@row["sib"],
									phist:	@row["phist"],
									phisttp:	@row["phisttp"],
									pinc:	@row["pinc"],
									ref:	@row["ref"],
									refloc:	@row["refloc"],
									prbtp:	@row["prbtp"],
									prbot:	@row["prbot"],
									stat: "CONF",
									prefloc: "Shah Alam",
									admloc: "sha",
									sce_id: @row["sce"],
									created_at: @row["Tarikh Pengesahan Kebenaran"])
      # Start P Kid
      pk = Pkid.new(ekid_id: ek.id)
      #pk = Pkid.new(ekid_id: 9000)
      (22..39).each do |n|
      	pk.health[@row.keys[n]] = @row.values[n]
      end

      (40..43).each do |n|
      	pk.birth[@row.keys[n]] = @row.values[n]
      end

      (44..59).each do |n|
      	pk.physpch[@row.keys[n]] = @row.values[n]
      end

      (60..64).each do |n|
      	pk.agr[@row.keys[n]] = @row.values[n]
      end

      (66..68).each do |n|
      	pk.addfo[@row.keys[n]] = @row.values[n]
      end

      (69..77).each do |n|
      	pk.grow[@row.keys[n]] = @row.values[n]
      end

      (78..112).each do |n|
      	if @row.values[n].present?
      		pk.devkid[@row.keys[n]] = @row.values[n]
      	end
      end

      pk.created_at = @row["Tarikh Pengesahan Kebenaran"]
      pk.save

      
      
    end
    flash[:success] = "CLASSROOMS ADDED"
    #redirect_to ekidconf_path(id: ek.id)
    redirect_to admin_index_path
    #redirect_to ekidindex_path(stato: "CONFIRM")
	end

	def upldekid
		xlsx = Roo::Spreadsheet.open(params[:file])
    header = xlsx.row(xlsx.first_row+2)
    @header2 = xlsx.row(xlsx.first_row+1)
    ((xlsx.first_row+3)..(xlsx.last_row)).each do |n|
      xlsx.row(n)
      @row = Hash[[header, xlsx.row(n)].transpose]
      ek = Ekid.create(name: @row["name"],
      						ic: @row["ic"],
      						gdr: @row["gdr"],
      						dob: @row["dob"],
      						dun:	@row["dun"],
									addr:	@row["addr"],
									mph:	@row["mph"],
									fname:	@row["fname"],
									fage:	@row["fage"],
									fph:	@row["fph"],
									femail:	@row["femail"],
									fedu:	@row["fedu"],
									fwork:	@row["fwork"],
									fworktp:	@row["fworktp"],
									mname:	@row["mname"],
									mage:	@row["mage"],
									mmph:	@row["mmph"],
									memail:	@row["memail"],
									medu:	@row["medu"],
									mwork:	@row["mwork"],
									mworktp:	@row["mworktp"],
									sib:	@row["sib"],
									phist:	@row["phist"],
									phisttp:	@row["phisttp"],
									pinc:	@row["pinc"],
									ref:	@row["ref"],
									refloc:	@row["refloc"],
									prbtp:	@row["prbtp"],
									prbot:	@row["prbot"],
									stat: "CONF",
									prefloc: "Shah Alam",
									admloc: "sha",
									sce_id: @row.values[129],
									created_at: @row.values[127])

      # Start P Kid
      pk = Pkid.new(ekid_id: ek.id)

      (30..64).each do |n|
      	if @row.values[n].present?
      		pk.devkid[@row.keys[n]] = @row.values[n]
      	end
      end

      (66..68).each do |n|
      	pk.addfo[@row.keys[n]] = @row.values[n]
      end

      (70..87).each do |n|
      	pk.health[@row.keys[n]] = @row.values[n]
      end

      (89..92).each do |n|
      	pk.birth[@row.keys[n]] = @row.values[n]
      end

      (94..102).each do |n|
      	pk.grow[@row.keys[n]] = @row.values[n]
      end

      (104..119).each do |n|
      	pk.physpch[@row.keys[n]] = @row.values[n]
      end

      (121..125).each do |n|
      	pk.agr[@row.keys[n]] = @row.values[n]
      end
      pk.created_at = @row.values[127]
      pk.save
      
    end
    flash[:success] = "CLASSROOMS ADDED"
    #redirect_to ekidconf_path(id: ek.id)
    redirect_to admin_index_path
    #redirect_to ekidindex_path(stato: "CONFIRM")
	end

	def upldekid_work
		xlsx = Roo::Spreadsheet.open(params[:file])
    header = xlsx.row(xlsx.first_row+2)
    ((xlsx.first_row+3)..(xlsx.last_row)).each do |n|
      xlsx.row(n)
      row = Hash[[header, xlsx.row(n)].transpose]
      ek = Ekid.create(name: row["name"],
      						ic: row["ic"],
      						gdr: row["gdr"],
      						dob: row["dob"],
      						dun:	row["dun"],
									addr:	row["addr"],
									mph:	row["mph"],
									fname:	row["fname"],
									fage:	row["fage"],
									fph:	row["fph"],
									femail:	row["femail"],
									fedu:	row["fedu"],
									fwork:	row["fwork"],
									fworktp:	row["fworktp"],
									mname:	row["mname"],
									mage:	row["mage"],
									mmph:	row["mmph"],
									memail:	row["memail"],
									medu:	row["medu"],
									mwork:	row["mwork"],
									mworktp:	row["mworktp"],
									sib:	row["sib"],
									phist:	row["phist"],
									phisttp:	row["phisttp"],
									pinc:	row["pinc"],
									ref:	row["ref"],
									refloc:	row["refloc"],
									prbtp:	row["prbtp"],
									prbot:	row["prbot"])
    end
    flash[:success] = "CLASSROOMS ADDED"
    redirect_to ekidindex_path
	end

	private

	def ekid_params
		params.require(:ekid).permit(:name,
																:ic,
																:gdr,
																:dob,
																:dun,
																:addr,
																:mph,
																:fname,
																:fage,
																:fph,
																:femail,
																:fedu,
																:fwork,
																:fworktp,
																:mname,
																:mage,
																:mmph,
																:memail,
																:medu,
																:mwork,
																:mworktp,
																:sib,
																:phist,
																:phisttp,
																:pinc,
																:ref,
																:refloc,
																:prbtp,
																:prbot,
																:prefloc)
	end

	def set_all
		@admin = current_admin
	end


end