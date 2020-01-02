class ScesController < ApplicationController
	before_action :set_sce, except: [:new,:create,:scexls]
	before_action :set_all

	def setsce
		if params[:curr] == "true"
			if Sce.where(loc: @sce.loc, curr: true).present?
				flash[:danger] = "You have other active programme"
			else
				@sce.curr = true
			end
		elsif params[:curr] == "false"
			@sce.curr = false
		end
		@sce.save
		redirect_to admin_index_path
	end

	def scexls
		@admin = current_admin
		@sce = Sce.where(id: params[:id])
		@ekids = nil
		@sce.each do |sc|
			if @ekids.blank?
				@ekids = sc.ekids
			else
				@ekids = @ekids.or(sc.ekids)
			end
		end
		skid = []
		@ekids.each do |ek|
			skid << ek.skid.id
		end
		@skids = Skid.where(id: skid)

		respond_to do |format|
      #format.html
      format.xlsx{
                  response.headers['Content-Disposition'] = 'attachment; filename="Screening Data.xlsx"'
      }
    end
	end

	def new
		@sce = Sce.new
	end

	def create
		@sce = Sce.new(sce_params)
		@sce.save
		redirect_to admin_index_path

	end

	def edit
	end

	def update
		@sce.update(sce_params)
		@sce.save
		redirect_to admin_index_path
	end

	def destroy
		if @sce.ekids.count > 0
			flash[:danger] = "Please remove all children in programme before deletion" 
		else
			@sce.destroy
			flash[:success] = "Deletion Successful"
		end
		redirect_to admin_index_path
	end


	def show
		@ekids = @sce.ekids
		cnt = 1
		@turn = Hash.new
		@ekids.where(stat: "CONF").order('updated_at ASC').each do |ek|
			@turn[ek.id] = cnt
			cnt = cnt + 1
		end
	end

	def showstat
		@ekids = @sce.ekids
		cnt = 1
		@turn = Hash.new

		@stel = Hash.new
		@atel = Hash.new
		@ptel = Hash.new
		@otel = Hash.new
		@dtel = Hash.new

		@ekids.where(stat: "CONF").order('updated_at ASC').each do |ek|
			@turn[ek.id] = cnt
			cnt = cnt + 1

			if ek.ste.present?
				@stel[ek.id] = ek.ste.stat 
			else
				@stel[ek.id] = nil 
			end

			if ek.ate.present?
				@atel[ek.id] = ek.ate.stat 
			else
				@atel[ek.id] = nil 
			end

			if ek.pte.present?
				@ptel[ek.id] = ek.pte.stat 
			else
				@ptel[ek.id] = nil 
			end

			if ek.ote.present?
				@otel[ek.id] = ek.ote.stat 
			else
				@otel[ek.id] = nil 
			end

			if ek.skid.present?
				@dtel[ek.id] = ek.skid.stat 
			else
				@dtel[ek.id] = nil 
			end


		end
	end

	def confsce
		@ekid = Ekid.find(params[:ekid])
		@ekid.sce_id = @sce.id
		@ekid.stat = "CONF"
		@ekid.save
		redirect_to sce_path(@sce)
	end

	def rmvsce
		@ekid = Ekid.find(params[:ekid])
		if @ekid.skid.present?
			flash[:danger] = "Please remove screening and feedback data before removal"
		else
			@ekid.sce_id = nil
			@ekid.stat = "CONFIRM"
			@ekid.save
			flash[:success] = "Removal Successful"
		end
		
		redirect_to sce_path(@sce)
	end


	private

	def set_sce
		@sce = Sce.find(params[:id])
	end

	def sce_params
		params.require(:sce).permit(:name,
																:date,
																:venue,
																:loc)
	end

	def set_all
		@admin = current_admin
	end

end