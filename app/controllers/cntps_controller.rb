class CntpsController < ApplicationController

	def rptcntps_xls
		@proge = Proge.find(params[:proge])
		@perses = @proge.perses
		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = "attachment; filename=Laporan #{@proge.name}.xlsx"
      }
    end
	end

	def editcntp
		@cntp = Cntp.find(params[:cntp])
		@proge = @cntp.proge
	end

	def updcntp
		@cntp = Cntp.find(params[:cntp][:id])
		@proge = @cntp.proge
		if @cntp.update(cntp_params)
			flash[:success] = "Senarai Program Dikemasini"
			redirect_to cntplist_path(proge: @proge.id)
		else
			flash[:success] = "Tidak Berjaya. Sila Cuba Lagi"
			redirect_to request.referrer
		end
	end

	def rmvcntp
		@cntp = Cntp.find(params[:cntp])
		@cntp.destroy
		flash[:success] = "Senarai Program Dikemasini"
		redirect_to request.referrer
	end

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
																:dt,
																:proge_id)
	end
end