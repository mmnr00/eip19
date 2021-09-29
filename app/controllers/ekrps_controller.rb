class EkrpsController < ApplicationController

	def ekrpsum
		@ekid = Ekid.find(params[:ekid])
		@perse = @ekid.perse
		@ekrps = @ekid.ekrps.where("dt >= ?", params[:dtfr]).where("dt <= ?", params[:dtto])
		@ekrp = @ekrps.last
	end

	def show
		@ekrp = Ekrp.find(params[:id])
		@ekid = @ekrp.ekid
		@perse = @ekid.perse
	end

	def new
		@ekrp = Ekrp.new
		@ekid = Ekid.find(params[:ekid])
		@perse = @ekid.perse
	end

	def create 
		@ekrp = Ekrp.new(ekrp_params)
		@ekrp.exmls << [params[:ekrp][:exm], Date.today]
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
		@perse = @ekid.perse
	end

	def update
		@ekrp = Ekrp.find(params[:id])
		@ekrp.exmls << [params[:ekrp][:exm], Date.today]
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
		if params[:sch].present?
			# if params[:dtfr].blank? || params[:dtto].blank?
			# 	flash[:danger] = "Sila Masukkan Kedua-Dua Tarikh"
			# 	redirect_to request.referrer and return
			# end
			@ekrps = @ekrps.where("dt >= ?", params[:dtfr]).where("dt <= ?", params[:dtto])
		end
	end

	private

	def ekrp_params
		params.require(:ekrp).permit(:dt,
																:aa,
														    :ab,
														    :ac,
														    :ad,
														    :ae,
														    :af,
														    :ag,
														    :ah,
														    :ai,
														    :aj,
														    :ak,
														    :al,
														    :am,
														    :an,
														    :ao,
														    :ap,
														    :aq,
														    :ar,
														    :as,
														    :at,
														    :au,
														    :av,
														    :aw,
														    :ax,
														    :ay,
														    :az,
														    :ba,
														    :bb,
														    :bc,
														    :bd,
														    :be,
														    :bf,
														    :bg,
														    :bh,
														    :bi,
														    :bj,
														    :bk,
														    :bl,
														    :bm,
														    :bn,
														    :bo,
														    :bp,
														    :bq,
														    :br,
														    :bs,
														    :bt,
														    :bu,
														    :bv,
														    :bw,
														    :bx,
														    :by,
														    :bz,
														    :ca,
														    :cb,
														    :cc,
														    :cd,
														    :ce,
														    :cf,
														    :cg,
														    :ch,
														    :ci,
														    :cj,
														    :ck,
														    :cl,
														    :cm,
														    :cn,
														    :co,
														    :cp,
																:ekid_id)
	end

end