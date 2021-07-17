class FbprogesController < ApplicationController

	def crtfbproge
		pars = params[:fbc]
		@fbproge = Fbproge.new
		@fbproge.perse_id = pars[:perse]
		@fbproge.proge_id = pars[:proge]
		@fbproge.rate = pars[:rate]
		@fbproge.cmt = pars[:cmt]
		tmp = Hash.new
		puts pars
		pars.each do |k,v|
			if k == "perse" || k == "proge" || k == "rate" || k == "cmt" 
			else
				arr_tmp = []
				arr_tmp[0] = v[:rate][0].to_i
				arr_tmp[1] = v[:gd]
				arr_tmp[2] = v[:bd]
				arr_tmp[3] = v[:lr]
				tmp[k] = arr_tmp
				puts "K---> #{k} -- #{k.class}"
				puts "V---> #{v} -- #{v.class}"

			end
		end
		@fbproge.ctnr = tmp 
		@fbproge.save
		flash[:notice] = "Terima kasih atas maklumbalas anda"
		redirect_to persesch_path
		# redirect_to progecert_path(perse: pars[:perse], proge: pars[:proge])
		# puts pars[:proge]
	end

	def newfbproge
		@proge = Proge.find(params[:proge])
		@perse = Perse.find(params[:perse])
		
	end

end