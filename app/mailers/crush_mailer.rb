class CrushMailer < ActionMailer::Base
  default from: "yaleseniorcupid@gmail.com"

  def match_email(crusher, crushee)
  	@crusher = crusher
  	@crushee = crushee
  	email = @crusher # change to @crush.email once db schema is modified to accomodate email addresses

  	mail(:to => email, :subject => "You'll want to open this. Trust me.")
  end

  def crush_email
  	# notify user when somebody names them as a crush, don't reveal name, just that person's hint.
  end
end
