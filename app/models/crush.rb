class Crush < ActiveRecord::Base
  attr_accessible :matches, :crush1, :crush2, :crush3, :crush4, :crush5, :crush6, :crush7, :email, :netID
  serialize :matches, Array

  def all_crushes
    a = Array.new
    if crush1 then
      all.push(crush1)
    end
    if crush2 then
      all.push(crush2)
    end
    if crush3 then
      all.push(crush3)
    end
    if crush4 then
      all.push(crush4)
    end
    if crush5 then
      all.push(crush5)
    end
    if crush6 then
      all.push(crush6)
    end
    if crush7 then
      all.push(crush7)
    end
    return a
  end

  def form_done?
    return !!(crush1 || crush2 || crush3 || crush4 || crush5 || crush6 || crush7)
  end

  def populate_matches
    Crush.all.each do |their|
      if (their.all_crushes.include? self.email) && (self.all_crushes.include? their.email) then
        self.matches.push(their.email)
        their.matches.push(self.email)
        self.save
        their.save
      end
    end
  end

  def send_emails
    self.matches.each do |match|
      CrushMailer.match_notify(self.email, match)
    end
  end
end