class AdminsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@admin = current_admin
		@admin_taska = current_admin.taskas
		@admin_taska.each do |taska|
			@taska_id = taska.id
			@taska_name = taska.name
		end
		#if @admin_taska.count == 1 ; redirect_to taska_path(@taska_id) end
		#render action: "index", layout: "dsb-admin-overview"

	end

	def index_old
		@admin = current_admin
		@admin_taska = current_admin.taskas
		@admin_taska.each do |taska|
			@taska_id = taska.id
			@taska_name = taska.name
		end
		#if @admin_taska.count == 1 ; redirect_to taska_path(@taska_id) end
		#render action: "index", layout: "dsb-admin-overview"

	end

	def webarch
	end

	def webarchv2
	end

	
end