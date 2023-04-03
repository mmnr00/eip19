class QsasController < ApplicationController

	before_action :authenticate_admin!, only: [:admqsa, :edit]

	def admqsa
		@qsas = Qsa.all
		@qsall = @qsas
		if params[:catg].present?
			@qsas = @qsas.where(catg: params[:catg])
		end
		
		@qscatg = []
		@qsall.each do |qs|
			@qscatg << qs.catg unless @qscatg.include? qs.catg
		end
		render action: "admqsa", layout: "dsb-admin-qsa" 
	end

	def new
		@qsa = Qsa.new
		@qscatg = []
		Qsa.all.each do |qs|
			@qscatg << qs.catg unless @qscatg.include? qs.catg
		end
		
	end

	def show
	end

	def create
		@qsa = Qsa.new(qsa_params)
		@qsa.save 
		if @qsa.ans.present?
			flash[:notice] = "Berjaya"
			redirect_to admqsa_path
		else
			#letak email to jabatan anis
			subject = "[TANYA ANIS] Soalan Baru Diterima Dibawah Kategori #{@qsa.catg}"
			to = "anisselangor@gmail.com"
			cc = @qsa.email
			body = "
				
				Maklumat Soalan adalah seperti dibawah: <br>
				<ul>
					<li><b>Nama Peserta: </b> #{@qsa.name}</li>
					<li><b>Email: </b> #{@qsa.email} </li>
					<li><b>No Telefon: </b> #{@qsa.ph}</li>
					<li><b>Kategori: </b> #{@qsa.catg}</li>
					<li><b>Soalan: </b> #{@qsa.ques}</li>
				</ul><br>
				<b>Yang Berkhidmat,</b><br>
				Sistem Jabatan ANIS

				"
			send_email(subject,to,cc,body)
			flash[:notice] = "Soalan Anda Diterima. Pihak kami akan maklumkan melalui email"
			redirect_to soaljawab_path
		end
		
	end

	def edit
		@qsa = Qsa.find(params[:id])
		@qscatg = []
		Qsa.all.each do |qs|
			@qscatg << qs.catg unless @qscatg.include? qs.catg
		end
	end

	def update
		@qsa = Qsa.find(params[:id])
		if @qsa.update(qsa_params)
			flash[:notice] = "Kemaskini Berjaya"
			#letak email to jabatan anis
			subject = "[TANYA ANIS] Jawapan Diterima Untuk Soalan Anda"
			to = "anisselangor@gmail.com"
			cc = @qsa.email
			body = "
				
				Maklumat Soalan adalah seperti dibawah: <br>
				<ul>
					<li><b>Nama Peserta: </b> #{@qsa.name}</li>
					<li><b>Email: </b> #{@qsa.email} </li>
					<li><b>No Telefon: </b> #{@qsa.ph}</li>
					<li><b>Kategori: </b> #{@qsa.catg}</li>
					<li><b>Soalan: </b> #{@qsa.ques}</li>
					<li><b>Jawapan: </b> #{@qsa.ans}</li>
				</ul><br>
				<b>Yang Berkhidmat,</b><br>
				Sistem Jabatan ANIS

				"
			send_email(subject,to,cc,body)
			redirect_to admqsa_path
		else
			flash[:danger] = "Kemaskini Tidak Berjaya. Sila Cuba Lagi"
			redirect_to request.referrer
		end
	end

	def destroy
		@qsa = Qsa.find(params[:id])
		if @qsa.destroy
			flash[:success] = "Soalan berjaya dipadam"
		else
			flash[:danger] = "Tidak Berjaya. Sila Cuba Lagi"
		end
		redirect_to request.referrer
	end

	private

	def qsa_params
		params.require(:qsa).permit(:ques,
																:ans,
																:stat,
																:email,
																:catg,
																:name,
																:ph)
	end

end