class TeachersController < ApplicationController
	before_action :authenticate_teacher!, except: [:search, :find, :show, :updtch]
	before_action :set_teacher #, only: [:index, :college, :add_college, :remove_college, :payment_signup]


	def index
		# if @teacher.tchdetail.blank?
		# 	redirect_to new_tchdetail_path(teacher_id: @teacher.id)
		# end
		@ekids = Ekid.where(tp: "INTERVENSI ANIS", stat: "Permohonan Diluluskan")
		if params[:sch].present?
			if params[:sch_nm].blank? && params[:sch_ic].blank?
				flash[:danger] = "Sila Masukkan Salah Satu Carian"
				redirect_to teacher_index_path and return
			end
			@ekids = @ekids.where('name LIKE ?', "%#{params[:sch_nm].upcase}%") unless params[:sch_nm].blank?
			@ekids = @ekids.where('ic LIKE ?', "%#{params[:sch_ic].upcase}%") unless params[:sch_ic].blank?
		end
	end


	
	private
    
    def set_teacher
      @teacher = current_teacher
    end
    
end

















