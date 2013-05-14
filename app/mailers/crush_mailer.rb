class CrushMailer < ActionMailer::Base
  include Format
  default from: "app15649060@heroku.com"

  def match_notify(party1, party2)
    match_email(party1, party2)
    match_email(party2, party1)
  end

  def match_email(crusher, crushee) # takes in emails, not Crush objects
  	@crusher = crusher
  	@crushee = crushee 

  	mail(:to => crusher, :subject => "You'll want to open this. Trust me.")
  end

  def hint_notify(lucky_person, content) # email and content passed in as strings
    @email = lucky_person
    @content = content

    mail(:to => @email, :subject => "oooOOOooo somebody liiikkkeess you")
  end
end
