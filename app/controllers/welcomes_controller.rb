class WelcomesController < ApplicationController
	#before_action :authenticate_admin!
	before_action :allow_iframe_requests
	before_action :set_all
	
	#layout "page"

	def pusatanis
		@index = true
	end

	def transisikerja
		@index = true
	end 

	def sediakerja
		@index = true
	end

	def ilscanis
		@index = true
	end

	def bukuanis
		@index = true
	end

	def prasekolahanis
		@index = true
	end

	def senaraipusatterapi
		@index = true
	end


	def senaraipdk
		@index = true
	end

	def jkmdaerah
		@index = true
	end

	def jkmnegeri
		@index = true
	end

	def pengumuman
		@index = true
		@artks = Artk.all
	end
	 
	def tanyaanis
		redirect_to soaljawab_path
	end

	def qatemp
	end

	def soaljawab
		@index = true
		@qsall = Qsa.where.not(ans: ["",nil])
		@qsas = @qsall
		if params[:catg].present?
			@qsas = @qsas.where(catg: params[:catg])
		end
		@catg = []
		@qsall.each do |qs|
			@catg << qs.catg unless @catg.include? qs.catg
		end
	end

	def mpachart
		@index = true
	end

	def sukarelawananis
		prog = Proge.where(tp: "SEMINAR SUKARELAWAN", acv: true)
		if prog.present? && prog.count == 1
			redirect_to persesch_path(prog:"AKADEMI ANIS", proge: prog.last.id)
		else
			flash[:danger] = "Maaf pendaftaran telah ditutup. Sila hubungi Penyelaras Program untuk maklumat lanjut"
			redirect_to persesch_path
		end
	end

	def cikguanisppki
		prog = Proge.where(tp: "SEMINAR SUKARELAWAN", acv: true)
		if prog.present? && prog.count == 1
			redirect_to persesch_path(prog:"AKADEMI ANIS", proge: prog.last.id)
		else
			flash[:danger] = "Maaf pendaftaran telah ditutup. Sila hubungi Penyelaras Program untuk maklumat lanjut"
			redirect_to persesch_path
		end
	end

	def cikguanistadika
		prog = Proge.where(tp: "CIKGU ANIS(TADIKA)", acv: true)
		if prog.present? && prog.count == 1
			redirect_to persesch_path(prog:"AKADEMI ANIS", proge: prog.last.id)
		else
			flash[:danger] = "Maaf pendaftaran telah ditutup. Sila hubungi Penyelaras Program untuk maklumat lanjut"
			redirect_to persesch_path
		end	
	end

	def cikguanispdk
		prog = Proge.where(tp: "CIKGU ANIS(PDK)", acv: true)
		if prog.present? && prog.count == 1
			redirect_to persesch_path(prog:"AKADEMI ANIS", proge: prog.last.id)
		else
			flash[:danger] = "Maaf pendaftaran telah ditutup. Sila hubungi Penyelaras Program untuk maklumat lanjut"
			redirect_to persesch_path
		end	
	end

	def bantuanoku2
		redirect_to "https://www.anisselangor.com/bantuanOKU"
	end

	def bantuanoku
		@index = true
	end

	def intervensianis
		@index = true
	end

	def daftarsaringan
		@index = true
	end

	def saringananis
		@index = true
	end


	def introanis
		@index = true
	end

	def orgchart
		@index = true
	end

	def sokonganis
		@index = true
	end

	def akademianis
		@index = true
	end

	def videols
	end

	def profilyb
		@index = true
	end

	def bantuananis
		@index = true
	end

	def tanya
		if params["g-recaptcha-response"].blank?
			flash[:danger] = "Pertanyaan tidak berjaya. Sila cuba lagi"
			redirect_to contactus_path
		else
			flash[:success] = "Pertanyaan anda telah direkodkan. Pihak kami akan menjawab secepat mungkin. Terima kasih"
			pars = params[:ans]
			subject = pars[:subject]
			to = "jabatananis@yawas.my"
			cc = pars[:email]
			body = "
				<b>Nama: </b> #{pars[:name]}<br>
				<b>Email: </b> #{pars[:email]}<br>
				<b>Maklumat: </b> #{pars[:msg]}<br>
			"
			send_email(subject,to,cc,body)
			redirect_to contactus_path(after: 1)
		end
	end

	def contactus
		#@index = true
	end

	def undercon
		@index = true
	end

	def didikanis
		@index = true
		#redirect_to persesch_path(prog: "DIDIK ANIS")
	end

	def index
		
	end

	def index2
		@teacher = current_teacher
		@admin = current_admin
		@owner = current_owner
		@parent = current_parent
		@index = true
		
		# if @owner && @owner.tchdetail.blank?
		# 	redirect_to new_tchdetail_path(owner_id: @owner.id)
		# elsif @teacher && @teacher.tchdetail.blank?
		# 	redirect_to new_tchdetail_path(teacher_id: @teacher.id)
		# else
		# 	render action: "index2", layout: "homepage2"	
		# end		
		
	end

	def login
		#render action: "login", layout: "dashboard"
		if current_admin || current_teacher || current_parent
			if current_admin
				redirect_to admin_index_path
			elsif current_teacher
				redirect_to admin_index_path
			elsif current_parent
				redirect_to parent_index_path
			end
		end
	end

	def sb_dashboard

		render action: "sb_dashboard", layout: "dsb-admin-eg"

	end

	def sb_table
		#render action: "sb_table", layout: "dsb-admin-eg"
	end

	def star_rating
		render action: "star_rating", layout: "dsb-admin-eg"
	end



	private

	def set_all
		@admin = current_admin
	end

	def allow_iframe_requests
  	response.headers.delete('X-Frame-Options')
	end

end
















