class TchdetailsController < ApplicationController
	before_action :set_tchdetail, except: [:new, :create]
	#before_action :rep_responsible?
	#before_action :authenticate_parent! || :authenticate_admin!
	def new
		@teacher = Teacher.find(params[:teacher_id])
		@tchdetail = Tchdetail.new
		@tchdetail.fotos.build
		#render action: "new", layout: "dsb-teacher-edu"
	end

	def create
		@teacher = Teacher.find(params[:tchdetail][:teacher_id])
		@tchdetail = Tchdetail.new(tchdetail_params)
		#@tchdetail.marital = params[:marital]
		#@tchdetail.education = params[:education]
		#@expense.taska = session[:taska_id]
		if @tchdetail.save

			flash[:notice] = "Children was successfully created"
			redirect_to teacher_college_path(@teacher)

												
		else
			render @tchdetail.errors.full_messages
			render :new
		end
	end

	def edit
		@tchdetail = Tchdetail.find(params[:id])
		@teacher = @tchdetail.teacher

	
		
	end

	def update
		@tchdetail = Tchdetail.find(params[:id])
		@teacher = @tchdetail.teacher
		#@classroom = Classroom.find(params[:classroom])
		if @tchdetail.update(tchdetail_params)
			flash[:notice] = "Children was successfully updated"
			redirect_to teacher_college_path(@teacher)
			
		else
			render 'edit'
		end
	end

	private
	def set_tchdetail
		@tchdetail = Tchdetail.find(params[:id])
	end

	def tchdetail_params
      params.require(:tchdetail).permit(:name, 
      																	:ic_1, 
      																	:ic_2, 
      																	:ic_3, 
      																	:phone_1, 
      																	:phone_2, 
      																	:marital, 
      																	:address_1, 
      																	:address_2,
      																	:city,
      																	:states,
      																	:postcode,
      																	:education,
      																	:teacher_id,
      																	fotos_attributes: [:foto, :picture, :foto_name] )
    end

end