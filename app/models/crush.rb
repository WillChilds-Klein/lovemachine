class Crush < ActiveRecord::Base
  attr_accessible :matches, :crush1, :crush2, :crush3, :crush4, :crush5, :crush6, :crush7, :email, :netID
  serialize :matches, Array

  def all_crushes
    a = Array.new
    if !crush1.empty? then
      a.push(crush1)
    end
    if !crush1.empty? then
      a.push(crush2)
    end
    if !crush1.empty? then
      a.push(crush3)
    end
    if !crush4.empty? then
      a.push(crush4)
    end
    if !crush5.empty? then
      a.push(crush5)
    end
    if !crush6.empty? then
      a.push(crush6)
    end
    if !crush7.empty? then
      a.push(crush7)
    end
    return a
  end

  def form_done?
    return !(crush1.empty? && crush2.empty? && crush3.empty? && crush4.empty? && crush5.empty? && crush6.empty? & crush7.empty?)
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