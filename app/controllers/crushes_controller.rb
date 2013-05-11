class CrushesController < ApplicationController
	# This will force CAS authentication before the user
 	# is allowed to access any action in this controller. 
	before_filter CASClient::Frameworks::Rails::Filter

	def index
		
	end

	def show
		@crush = Crush.find(params[:id])
	end

	def create
		@crush = Crush.new(params[:crush])

		Crush.all.each do |existing_crush|
			if @crush.crusher == existing_crush.crusher
				@ex_crush = existing_crush
				render "crushes/exists"
				return
			end

		end

		if @crush.save
			Crush.all.each do |existing_crush|
				if 


					CrushMailer.match_email(@crush.crusher, existing_crush.crusher).deliver
					CrushMailer.match_email(existing_crush.crusher, @crush.crusher).deliver
					Match.create(:p1 => @crush.cruser, :p2 => existing_crush.crusher) # only one entry. could do 2
				end
			end

			#CASClient::Frameworks::Rails::Filter.logout(self)
			render "crushes/success"
		else
			render "new"
		end
	end

	def edit

	end

	def update

	end

	def new
		@crush = Crush.new
		@crush.NetID = session[:cas_user]
	end 

	def destroy
		
	end

	def success
    	CASClient::Frameworks::Rails::Filter.logout(self)
	end
end