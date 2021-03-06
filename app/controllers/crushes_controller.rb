class CrushesController < ApplicationController
    include Format
    before_filter CASClient::Frameworks::Rails::Filter

	def edit
		@crush = unfix_email(current_user)
	end

	def update
    @crush = current_user
    @crush.update_attributes(params[:crush])
    params[:hint].keys.sort.each_with_index do |key, i|
        email = params[:crush][("crush"+(i+1).to_s).to_sym]
    	unless params[:hint][key].blank? || email.blank? then
    		Hint.create(:email => email,
                :content => params[:hint][key],
                :author => @crush.email)
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