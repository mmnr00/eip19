class EkrpsController < ApplicationController

	def show
		@ekrp = Ekrp.find(params[:id])
	end

	def new
		@ekrp = Ekrp.new
		@ekid = Ekid.find(params[:ekid])
		@perse = @ekid.perse
	end

	def create 
		@ekrp = Ekrp.new(ekrp_params)
		if @ekrp.save 
			flash[:notice] = "Laporan Intervensi berjaya dijana"
			redirect_to ekrpls_path(ekid: @ekrp.ekid_id)
		else
			flash[:danger] = "Tidak berjaya. Sila cuba semula"
			redirect_to request.referrer
		end
	end

	def edit
		@ekrp = Ekrp.find(params[:id])
		@ekid = @ekrp.ekid
	end

	def update
		@ekrp = Ekrp.find(params[:id])
		if @ekrp.update(ekrp_params)
			flash[:success] = "Kemaskini Berjaya"
			redirect_to ekrpls_path(ekid: @ekrp.ekid_id)
		else
			flash[:danger] = "Tidak berjaya. Sila cuba semula"
			redirect_to request.referrer
		end

	end

	def destroy
		@ekrp = Ekrp.find(params[:id])
		@ekid = @ekrp.ekid
		if @ekrp.destroy
			flash[:success] = "Berjaya"
		else
			flash[:danger] = "Tidak berjaya. Sila cuba semula"
		end
		redirect_to request.referrer
	end

	def ekrpls
		@ekid = Ekid.find(params[:ekid])
		@ekrps = @ekid.ekrps
	end

	private

	def ekrp_params
		params.require(:ekrp).permit(:dt,
																	:ekid_id)
	end

end