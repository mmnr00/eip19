class PrgfdsController < ApplicationController

	private
		def prgfds_params
			params.require(:prgfd).permit(:rate, 
																		:good, 
																		:bad, 
																		:perse_id,
																		:proge_id)
		end
	end

end