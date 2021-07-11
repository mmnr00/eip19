class FbprogesController < ApplicationController

	def crtfbproge
		pars = params[:fbc]
		@fbproge = Fbproge.new
		@fbproge.perse_id = pars[:perse]
		@fbproge.proge_id = pars[:proge]
		tmp = Hash.new
		pars.each do |k,v|
			# arr_tmp = []
			# arr_tmp[0] = v[:rate]
			# arr_tmp[1] = v[:gd]
			# arr_tmp[2] = v[:bd]
			# tmp[k] = arr_tmp
			if k != "perse" || k != "proge"
				puts k 
				puts v
				arr_tmp = []
				arr_tmp[0] = v[:rate]
				arr_tmp[1] = v[:gd]
				arr_tmp[2] = v[:bd]
				tmp[k] = arr_tmp
			end
		end
		@fbproge.ctnr = tmp 
		@fbproge.save
		# puts pars[:proge]
	end

	def newfbproge
		@proge = Proge.find(params[:proge])
		@perse = Perse.find(params[:perse])
		
	end

end