class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@admin = current_admin
		@ekids = Ekid.where(admloc: $admloc[@admin.id])
		# if @admin.id == 1
		# 	@ekids = Ekid.all
		# elsif @admin.id == 2
		# 	@ekids = Ekid.where(admloc: "sha")
		# elsif @admin.id == 3
		# 	@ekids = Ekid.where(admloc: "srd")
		# end
		
		#render action: "index", layout: "eipblank"
	end

	def indexkcr
		@admin = current_admin
		@spv = @admin.spv
		if Rails.env.production?
			@admin_taska = current_admin.taskas.where.not(id: [5, 9, 1, 44, 45, 4, 48, 75])
		else
			@admin_taska = current_admin.taskas
		end
		@admin_taska.each do |taska|
			@taska_id = taska.id
			@taska_name = taska.name
		end
		#if @admin_taska.count == 1 ; redirect_to taska_path(@taska_id) end
		#render action: "index", layout: "eip"

	end

	
	
end