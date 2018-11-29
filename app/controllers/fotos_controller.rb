class FotosController < ApplicationController
	before_action :set_foto
	before_action :set_all

	def edit
	end

	def update
		@tchdetail = @foto.tchdetail
		if @foto.update(foto_params)
        redirect_to edit_tchdetail_path(@tchdetail)
      else
        render :edit
      end
	end

	def destroy
			@tchdetail = @foto.tchdetail
	    @foto.destroy
	    redirect_to edit_tchdetail_path(@tchdetail)
  end

  private

  def set_foto
			@foto = Foto.find(params[:id])
  end

  def set_all
		@teacher = current_teacher
		@parent = current_parent
		@admin = current_admin	
		@owner = current_owner
  end

  def foto_params
      params.require(:foto).permit(:foto_name, :picture)
  end

end