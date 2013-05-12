class CrushesController < ApplicationController

	def edit
		@crush = current_user
	end

	def update
    @crush = current_user
    @crush.update_attributes(params[:crush])
   	redirect_to '/'
  end
end