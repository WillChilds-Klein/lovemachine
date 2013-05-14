class CrushMailer < ActionMailer::Base
  include Format

  def match_notify(party1, party2)
    match_email(party1, party2)
    match_email(party2, party1)
  end

  def match_email(crusher, crushee) # takes in emails, not Crush objects
  	@crusher = crusher
  	@crushee = crushee

  	mail(:to => "#{crusher.full_n} <#{crusher.email}>", :from => "Yale LoveMachine <lovemachine@herokuapp.com>", :subject => "You and " + @crushee.full_n + " have each crushed each other on the Yale LoveMahine!").deliver!#:subject => "You'll want to open this. Trust me.").deliver!
  end
end
