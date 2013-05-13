class Crush < ActiveRecord::Base
  include Format
  before_save :set_uuid, :fix_email
  attr_accessible :matches, :crush1, :crush2, :crush3, :crush4, :crush5, :crush6, :crush7, :email, :netID
  serialize :matches, Array
  extend FriendlyId
  friendly_id :uuid

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
    return !(crush1.blank? && crush2.blank? && crush3.blank? && crush4.blank? && crush5.blank? && crush6.blank? & crush7.blank?)
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

  def send_hints
    Hint.where(:author => self.email).each do |hint|
      CrushMailer.hint_notify(hint.email, hint.content)
    end
  end  

  def set_uuid
    self.uuid = SecureRandom.uuid.split("-").first if self.uuid.nil?
  end

  def fix_email
    self.email = yale_email(self.email)
  end
end