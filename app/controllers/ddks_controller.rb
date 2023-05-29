class DdksController < ApplicationController

	before_action :set_ddk, except: [:new,:create,:ddkxls,:btnoku]

	def btnoku
		@ddk = Ddk.first
		@ddk.okucnt = @ddk.okucnt + 1
		@ddk.save 
		cnt = @ddk.okucnt
		#send email
		subject = "#{cnt} permohonan untuk Bantuan OKU ANIS"
		to = "anisselangor@gmail.com"
		body = "Permohonan Bantuan OKU ANIS terkini adalah sebanyak #{cnt}"
		#send_email(subject,to,"",body)
		redirect_to "https://kidcare.my/anisdocs/Borang Bantuan ANIS_2022-1.pdf"


	end

	def ddkxls
		@ddks = Ddk.where(old1: params[:old1])
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = "attachment; filename=Senarai Didik ANIS.xlsx"
      }
		end
	end

	def prtddk
		@print = true
		@perse = @ddk.perse
		render action: "prtddk", layout: "eipblank" 
	end

	def show
		@perse = @ddk.perse
	end

	def new
		@edit = false
		@perse = Perse.find(params[:perse])
		@ddks = Ddk.where(perse_id: @perse.id)
		# if @perse.ddk.present? && !@perse.ddk.old1?
		# 	redirect_to ddk_path(id: @perse.ddk.id) and return
		# end
		if @ddks.present? && @ddks.where(old1: nil).present?
			redirect_to ddk_path(id: @ddks.where(old1: nil).last.id) and return
		end
		@ddk = Ddk.new
		@ddk.fotos.build
	end

	def create
		@ddk = Ddk.new(ddk_params)
		@ddk.stat = 1
		if @ddk.save
			flash[:success] = "Permohonan Didik ANIS Diterima. Terima kasih"

			#send email
			subject = "Permohonan Didik ANIS Diterima"
			to = @ddk.email
			link = "https://www.anisselangor.com/persesch?utf8=✓&icf=#{@ddk.perse.ic}&sch=sdhjdsh876671&prog=DIDIK+ANIS&button="
			body = "
			Terima kasih kerana memohon untuk program Didik ANIS. Sukacita kami ingin maklumkan permohonan bagi
			<b>#{@ddk.coname}(#{@ddk.conum})</b> telah diterima.<br>
			Maklumat Permohonan Anda adalah seperti dibawah: <br>
			<ul>
				<li><b>No Siri: </b> DDK-#{@ddk.id.to_s.rjust(4, '0')}</li>
				<li><b>Nama Agensi: </b> #{@ddk.coname}</li>
				<li><b>No Pendaftaran: </b>#{@ddk.conum}</li>
				<li><b>Semakan Status: </b><a href=#{link}>Sila Klik Disini</a></li>
			</ul>
			"
			#send_email(subject,to,"jabatananis@yawas.my",body)

			redirect_to ddk_path(@ddk)
		else
			flash[:danger] = "Permohonan tidak berjaya. Sila Cuba Semula"
			redirect_to request.referrer
		end
	end

	def edit
		@edit = true
		@perse = @ddk.perse
	end

	def update
		if @ddk.update(ddk_params)
			flash[:success] = "Kemaskini Permohonan Berjaya"
			redirect_to ddk_path(@ddk)
		else
			flash[:danger] = "Kemaskini tidak berjaya. Sila Cuba Semula"
			redirect_to request.referrer
		end
	end

	def destroy
	end

	private

	def set_ddk
		@ddk = Ddk.find(params[:id])
	end

	def ddk_params
		params.require(:ddk).permit(:conum,
																:coname,
																:perse_id,
																:regby,
																:addr,
																:posk,
																:state,
																:email,
																:ph,
																:mpemb,
																:mpeng,
																:mpend,
																:mpert,
																:mfiz,
																:mmen,
																:mpelb,
																:stafct,
																:tchct,
																:okuct,
																:premdt,
																:mdl,
																:regyr,
																:stat,
																:statrs,
																:agtp,
																:accname,
																:accno,
																:accbank,
																:progt,
																:jawatanwakil,
																:bilterapi,
																fotos_attributes: [:foto, :picture, :foto_name])
	end

end