class ArtksController < ApplicationController
	before_action :authenticate_admin! , except: [:artk_list, :show]
	before_action :set_artk, only: [:show,:edit,:update]
	before_action :set_all

	def new
		@artk = Artk.new
	end

	def create
		@artk = Artk.new(artk_params)
		if @artk.save
			flash[:notice] = "Artikel Berjaya Diwujudkan"
			redirect_to artk_path(@artk)
		else
			flash[:danger] = "Tidak Berjaya. Sila Cuba Semula"
			redirect_to new_artk_path
		end
	end

	def edit
	end

	def update
		if @artk.update(artk_params)
			flash[:notice] = "Artikel Berjaya Dikemasini"
			redirect_to artk_path(@artk)
		else
			flash[:danger] = "Kemaskini Tidak Berjaya. Sila Cuba Semula"
			redirect_to edit_artk_path(@artk)
		end
	end

	def show

	end

	def artk_index
		@artks = Artk.all
	end

	def artk_list
		@artks = Artk.all
	end

	private


	def set_artk
		@artk = Artk.find(params[:id])
	end

	def artk_params
		params.require(:artk).permit(:title,
																:author,
																:headl,
																:bodl,
																:pic)
	end


end