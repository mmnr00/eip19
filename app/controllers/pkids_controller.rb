class PkidsController < ApplicationController
	def new
		@pkid = Pkid.new
		@ekid = Ekid.find(params[:ekid])
		dob = @ekid.dob
		@age = (Date.today.year*12+Date.today.month) - (dob.year*12+dob.month)
		#render action: "new", layout: "eipblank"
	end

	def create
		@pkid = form_input(0,params[:pkid])
		#redirect_to ekidconf_path(id: @pkid.ekid)
		redirect_to ekid_list_path(perse: @pkid.ekid.perse.id)
	end

	def edit
		@pkid = Pkid.find(params[:id])
		@ekid = Ekid.find(params[:ekid])
		dob = @ekid.dob
		@age = (Date.today.year*12+Date.today.month) - (dob.year*12+dob.month)
		#render action: "edit", layout: "eipblank"
	end

	def update
		@pkid = Pkid.find(params[:id])
		@pkid = form_input(@pkid.id,params[:pkid])
		redirect_to ekidconf_path(id: @pkid.ekid)
	end

	private

	def form_input(id,params)
		par = params
		if id==0
			@pkid = Pkid.new
		else
			@pkid = Pkid.find(id)
		end
		par[:devkid].each do |k,v|
			@pkid.devkid[k]=v
		end
		par[:addfo].each do |k,v|
			@pkid.addfo[k]=v
		end
		par[:health].each do |k,v|
			@pkid.health[k]=v
		end
		par[:birth].each do |k,v|
			@pkid.birth[k]=v
		end
		par[:grow].each do |k,v|
			@pkid.grow[k]=v
		end
		par[:physpch].each do |k,v|
			@pkid.physpch[k]=v
		end
		par[:agr].each do |k,v|
			@pkid.agr[k]=v
		end
		
		
		@pkid.ekid_id = par[:ekid]
		@pkid.save
		return @pkid
	end


end






