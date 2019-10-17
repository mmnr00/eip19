class RfltsController < ApplicationController
	before_action :set_all

	def new
		@ekid = Ekid.find(params[:ekid])
		@skid = @ekid.skid
		@ate = @ekid.ate
		@pte = @ekid.pte
		@ste = @ekid.ste
		@ote = @ekid.ote
		@chkl = @ekid.chkl
	end

	def create

	end

	def edit
		@ekid = Ekid.find(params[:ekid])
		@skid = @ekid.skid
		@ate = @ekid.ate
		@pte = @ekid.pte
		@ste = @ekid.ste
		@ote = @ekid.ote
		@chkl = @ekid.chkl
	end

	def update
	end

	private 

	def set_all
		@admin = current_admin
		@owner = current_owner
	end

end