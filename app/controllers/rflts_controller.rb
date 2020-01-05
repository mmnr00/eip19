class RfltsController < ApplicationController
	before_action :set_all

	def rflt_pdf
		@rflt = Rflt.find(params[:id])
		@ekid = @rflt.ekid
		respond_to do |format|
	 		format.html
	 		format.pdf do
		   render pdf: "[Refer Letter] #{@ekid.name}",
		   template: "rflts/_tabrflt.html.erb",
		   #disposition: "attachment",
		   #save_to_file: Rails.root.join('pdfs', "#{filename}.pdf"),
       #save_only: true, 
		   #page_size: "A6",
		   orientation: "portrait",
		   layout: 'pdf.html.erb'
			end
		end
	end

	def show
		@rflt = Rflt.find(params[:id])
		@ekid = @rflt.ekid
		
	end

	def new
		@rflt = Rflt.new
		@ekid = Ekid.find(params[:ekid])
		@skid = @ekid.skid
		@ate = @ekid.ate
		@pte = @ekid.pte
		@ste = @ekid.ste
		@ote = @ekid.ote
		@chkl = @ekid.chkl
	end

	def create
		@rflt=Rflt.new(rflt_params)
		if @rflt.save
			sce = @rflt.ekid.sce
			skid = @rflt.ekid.skid
			skid.stat = true
			skid.save
			flash[:success] = "Refer letter successfully created"
			sce = @rflt.ekid.sce
			if sce.curr
				redirect_to owner_index_path
			else
				redirect_to ownprev_path
			end
		else
			flash[:danger] = "Unsuccessful. Please try again"
		end

	end

	def edit
		@rflt = Rflt.find(params[:id])
		@ekid = Ekid.find(params[:ekid])
		@skid = @ekid.skid
		@ate = @ekid.ate
		@pte = @ekid.pte
		@ste = @ekid.ste
		@ote = @ekid.ote
		@chkl = @ekid.chkl
	end

	def update
		@rflt = Rflt.find(params[:id])
		if @rflt.update(rflt_params)
			flash[:success] = "Refer letter successfully updated"
			sce = @rflt.ekid.sce
			if sce.curr
				redirect_to owner_index_path
			else
				redirect_to ownprev_path
			end
		else
			flash[:danger] = "Unsuccessful. Please try again"
		end
	end

	private 

	def rflt_params
		params.require(:rflt).permit(:ovc,
																:ekid_id,
																:rped,
																:rcp,
																:rntn,
																:rent,
																:roph,
																:rot,
																:rst,
																:roth,
																:osens,
																:obeob,
																:ocog,
																:ogmtr,
																:ofmtr,
																:pgmtr,
																:pmov,
																:pendr,
																:spre,
																:srec,
																:sexpr,
																:ahr,
																:atin,
																:aear,
																:aresp,
																:owner_id)
		end

	def set_all
		@admin = current_admin
		@owner = current_owner
	end

end