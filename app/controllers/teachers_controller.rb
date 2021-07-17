class TeachersController < ApplicationController
	before_action :authenticate_teacher!, except: [:search, :find, :show, :updtch]
	before_action :set_teacher #, only: [:index, :college, :add_college, :remove_college, :payment_signup]


	def index
		# if @teacher.tchdetail.blank?
		# 	redirect_to new_tchdetail_path(teacher_id: @teacher.id)
		# end
		@ekids = Ekid.where(tp: "TERAPI ANIS", stat: "Permohonan Diluluskan")
	end


	
	private
    
    def set_teacher
      @teacher = current_teacher
    end
    
end

















