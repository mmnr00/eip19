class QsasController < ApplicationController

	before_action :authenticate_admin!, only: [:admqsa, :edit]

	def admqsa
		@qsas = Qsa.all
	end

	def new
		@qsa = Qsa.new
		@qscatg = []
		Qsa.all.each do |qs|
			@qscatg << qs.catg unless @qscatg.include? qs.catg
		end
	end

	def show
	end

	def create
		@qsa = Qsa.new(qsa_params)
		@qsa.save 
		redirect_to root_path
	end

	def edit
		@qsa = Qsa.find(params[:id])
	end

	def update
		@qsa = Qsa.find(params[:id])
		if @qsa.update(qsa_params)
			flash[:notice] = "Kemaskini Berjaya"
			redirect_to admqsa_path
		else
			flash[:danger] = "Kemaskini Tidak Berjaya. Sila Cuba Lagi"
			redirect_to request.referrer
		end
	end

	def destroy
	end

	private

	def qsa_params
		params.require(:qsa).permit(:ques,
																:ans,
																:stat,
																:email,
																:catg,
																:name,
																:ph)
	end

end