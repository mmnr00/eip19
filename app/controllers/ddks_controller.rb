class DdksController < ApplicationController

	before_action :set_ddk, except: [:new,:create]

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
		if @perse.ddk.present?
			redirect_to ddk_path(id: @perse.ddk.id) and return
		end
		@ddk = Ddk.new
	end

	def create
		@ddk = Ddk.new(ddk_params)
		@ddk.stat = 1
		if @ddk.save
			flash[:success] = "Permohonan Didik ANIS Diterima. Terima kasih"
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
																:agtp)
	end

end