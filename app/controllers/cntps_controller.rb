class CntpsController < ApplicationController
	def cntplist
		@proge = Proge.find(params[:proge])
		@cntp = Cntp.new
	end

	def crtcntp
		@cntp = Cntp.new(cntp_params)
		@cntp.save
		flash[:success]="Program Baru Dikemaskini"
		redirect_to request.referrer
	end

	private

	def cntp_params
		params.require(:cntp).permit(:title,
																:start,
																:end,
																:lec,
																:ctn,
																:proge_id)
	end
end