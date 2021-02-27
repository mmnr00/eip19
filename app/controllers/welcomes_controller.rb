class WelcomesController < ApplicationController
	#before_action :authenticate_admin!
	before_action :allow_iframe_requests
	
	#layout "page"

	def index
		
	end

	def index2
		@teacher = current_teacher
		@admin = current_admin
		@owner = current_owner
		@parent = current_parent
		@index = true
		# if @owner && @owner.tchdetail.blank?
		# 	redirect_to new_tchdetail_path(owner_id: @owner.id)
		# elsif @teacher && @teacher.tchdetail.blank?
		# 	redirect_to new_tchdetail_path(teacher_id: @teacher.id)
		# else
		# 	render action: "index2", layout: "homepage2"	
		# end		
		
	end

	def login
		#render action: "login", layout: "dashboard"
		if current_admin || current_teacher || current_parent
			if current_admin
				redirect_to admin_index_path
			elsif current_teacher
				redirect_to admin_index_path
			elsif current_parent
				redirect_to parent_index_path
			end
		end
	end

	def sb_dashboard

		render action: "sb_dashboard", layout: "dsb-admin-eg"

	end

	def sb_table
		#render action: "sb_table", layout: "dsb-admin-eg"
	end

	def star_rating
		render action: "star_rating", layout: "dsb-admin-eg"
	end



	private

	def allow_iframe_requests
  	response.headers.delete('X-Frame-Options')
	end

end
















