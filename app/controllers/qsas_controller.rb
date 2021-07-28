class QsasController < ApplicationController

	def new
		@qsa = Qsa.new
	end

	def show
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def qsas_params
		params.require(:qsa).permit(:ques,
																:ans,
																:stat,
																:email,
																:name,
																:ph)
	end

end