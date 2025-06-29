class BtnpnlsController < ApplicationController

	before_action :set_btnpnl, only: [:edit,:update,:destroy]

	def new
		@btnpnl = Btnpnl.new
		render action: "new", layout: "dsb-admin-btan"
	end

	def create
		@btnpnl = Btnpnl.new(btnpnl_params)
		@btnpnl.save
		flash[:success] = "#{@btnpnl.name} berjaya didaftarkan"
		redirect_to lsbtan_path(dsb: "panel")
	end

	def edit
		render action: "edit", layout: "dsb-admin-btan"
	end

	def update
		@btnpnl.update(btnpnl_params)
		@btnpnl.save 
		flash[:success] = "#{@btnpnl.name} berjaya dikemaskini"
		redirect_to lsbtan_path(dsb: "panel")
	end

	def destroy
	end

	private

	def set_btnpnl
     @btnpnl = Btnpnl.find(params[:id])
  end

  def btnpnl_params
		params.require(:btnpnl).permit(:name,
															    :acctnm,
															    :acctno,
															    :ph,
															    :email,
															    :stat,
															    :addr,
															    :tp,
															    :banknm,
																	:perse_id,
														    	fotos_attributes: [:foto, :picture, :foto_name])
	end

end