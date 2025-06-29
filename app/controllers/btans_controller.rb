class BtansController < ApplicationController

	before_action :set_btan, only: [:show,:edit,:update]
	before_action :authenticate_admin!, only: [:lsbtan]

	def btan_list
		@perse = Perse.find(params[:perse])
		@btans = @perse.btans
	end

	def updstatbtan
		pars = params[:btan]
		@btan = Btan.find(pars[:id])
		@btan.stat = pars[:stat]
		@btan.descr = pars[:descr]
		@btan.descrls << [Admin.find(pars[:admid]).username,Time.new, pars[:stat], pars[:descr]]
		if @btan.save
			flash[:success] = "Kemaskini Berjaya"
		else 
			flash[:danger] = "Kemaskini Tidak Berjaya"
		end
		redirect_to request.referrer
	end

	def lsbtan
		@btans = Btan.all
		if params[:dsb] == "memo"
			@par = "memo"
		elsif params[:dsb] == "lulus"
			@par = "lulus"
		elsif params[:dsb] == "pmt"
			@par = "pmt"
		elsif params[:dsb] == "panel"
			@par = "panel"
			@btnpnls = Btnpnl.all
			if params[:sch].present?
				sch_str = params[:sch_str].upcase unless params[:sch_str].blank?
				@btnpnls = @btnpnls.where("name like (?)", "%#{sch_str}%") unless params[:sch_str].blank?
				@btnpnls = @btnpnls.where(tp: params[:sch_tp]) unless params[:sch_tp].blank?
			end
		else
			if params[:sch].present?
				@btans = @btans.where(stat: params[:stat]) unless params[:stat].blank?
				sch_str = params[:sch_str].upcase unless params[:sch_str].blank?
				@btans = @btans.where("nmkd like (?)", "%#{sch_str}%") unless params[:sch_str].blank?
				@btans = @btans.where(purp: params[:sch_tp]) unless params[:sch_tp].blank?
				@btans = @btans.where(stat: params[:sch_stat]) unless params[:sch_stat].blank?
			end
		end
		render action: "lsbtan", layout: "dsb-admin-btan"
	end

	def new
		@btan = Btan.new
		@perse = Perse.find(params[:perse])
		@btan.fotos.build
		hash_temp = {}
		(1..10).each do |n|
			hash_temp[n.to_s] = ["", "", "", "",""]
		end
		puts hash_temp
		@btan.household = hash_temp #{"1"=>["", "", "", "",""], "2"=>["", "", "", "",""], "3"=>["", "", "", "",""], "4"=>["", "", "", "",""], "5"=>["", "", "", "",""]}
	end

	def create
		@btan = Btan.new(btan_params)
		@btan.save
		btan_ls(@btan.id,params[:btan])
		@btan.stat = "BELUM DISEMAK"
		@btan.save
		redirect_to btan_path(@btan)
	end

	def show
		
	end

	def edit
		if @btan.household.blank?
		@btan.household = {"1"=>["", "", "", "",""], "2"=>["", "", "", "",""], "3"=>["", "", "", "",""], "4"=>["", "", "", "",""], "5"=>["", "", "", "",""]}
		end
	end

	def update
		@btan.update(btan_params)
		btan_ls(@btan.id,params[:btan])
		@btan.save 
		redirect_to btan_path(@btan)
		#redirect_to request.referrer
	end

	private

	def set_btan
      @btan = Btan.find(params[:id])
   end

  def btan_ls(id,params)
		par = params
		@btan = Btan.find(id)
		if par[:household].present?
			par[:household].each do |k,v|
				@btan.household[k] = [v["nama"],v["kp"],v["hubg"],v["umur"],v["pend"]]
			end
		end
		@btan.save
	end

	def btan_params
		params.require(:btan).permit(:name,
																:ic,
																:purp,
														    :amnt,
														    :dun,
														    :marr,
														    :addr,
														    :perd,
														    :undi,
														    :race,
														    :relg,
														    :phhm,
														    :phmb,
														    :empl,
														    :phemp,
														    :sect,
														    :gaji,
														    :rel,
														    :namesp,
														    :icsp,
														    :addrsp,
														    :perdsp,
														    :undisp,
														    :phhmsp,
														    :phmbsp,
														    :emplsp,
														    :phempsp,
														    :sectsp,
														    :gajisp,
														    :relsp,
														    :household,
														    :histbtn,
														    :namakd,
														    :ickd,
														    :gdrkd,
														    :racekd,
														    :relkd,
														    :addrkd,
														    :okuno,
														    :okutp,
														    :statekd,
														    :perdkd,
														    :sekkd,
														    :tnc,
														    :nmkd,
														    :perse_id,
														    fotos_attributes: [:foto, :picture, :foto_name])
	end

end