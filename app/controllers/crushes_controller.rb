class CrushesController < ApplicationController

	def edit
		@crush = current_user
	end

	def update
    @crush = current_user
    @crush.update_attributes(params[:crush])
    params[:hint].keys.sort.each_with_index do |key, i|
    	if params[:hint][key] then
    		Hint.create(:email => params[:crush][("crush"+(i+1).to_s).to_sym], :content => params[:hint][key])
    	end
    end
    @crush.populate_matches
    @crush.send_emails
   	if request.xhr? 
        render :nothing => true
      else
        redirect_to '/'
      end
  end
end