class PersesController < ApplicationController

	def index
		@perses = Perse.all
		render action: "index", layout: "eipblank"
	end

	def show
		@perse = Perse.find(params[:id])
		render action: "show", layout: "eipblank"
	end

	def new
		@perse = Perse.new
		render action: "new", layout: "eipblank"
	end

	def create
		@perse = Perse.new(perse_params)
		if @perse.save 
			#redirect_to perseindex_path
		else
			render @perse.errors.full_messages
			render :new
		end

	end

	def edit
		@perse = Perse.find(params[:id])
		render action: "edit", layout: "eipblank"
	end

	def update
		@perse = Perse.find(params[:id])
		if @perse.update(perse_params)
			redirect_to perseindex_path
		else
			render @perse.errors.full_messages
			render :new
		end
	end

	private

	def perse_params
		params.require(:perse).permit(:name, 
																	:ic, 
																	:ph, 
																	:inc)
	end

end