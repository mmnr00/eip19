class BtansController < ApplicationController

	before_action :set_btan, only: [:show,:edit,:update]

	def new
		@btan = Btan.new
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
														    :nmkd)
	end

end