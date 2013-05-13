class Crush < ActiveRecord::Base
  include Format
  before_save :set_uuid, :fix_email
  attr_accessible :matches, :crush1, :crush2, :crush3, :crush4, :crush5, :crush6, :crush7, :email, :netID
  serialize :matches, Array
  extend FriendlyId
  friendly_id :uuid

  def all_crushes
    a = Array.new
    if !(crush1.nil? || crush1.empty?) then
      a.push(crush1)
    end
    if !(crush2.nil? || crush2.empty?) then
      a.push(crush2)
    end
    if !(crush3.nil? || crush3.empty?) then
      a.push(crush3)
    end
    if !(crush4.nil? || crush4.empty?) then
      a.push(crush4)
    end
    if !(crush5.nil? || crush5.empty?) then
      a.push(crush5)
    end
    if !(crush6.nil? || crush6.empty?) then
      a.push(crush6)
    end
    if !(crush7.nil? || crush7.empty?) then
      a.push(crush7)
    end
    return a
  end

  def form_done?
    return !((crush1.nil? || crush1.empty?) &&
      (crush2.nil? || crush2.empty?) &&
      (crush3.nil? || crush3.empty?) &&
      (crush4.nil? || crush4.empty?) &&
      (crush5.nil? || crush5.empty?) &&
      (crush6.nil? || crush6.empty?) &&
      (crush7.nil? || crush7.empty?))
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
    self.crush1 = yale_email(self.crush1)
    self.crush2 = yale_email(self.crush2)
    self.crush3 = yale_email(self.crush3)
    self.crush4 = yale_email(self.crush4)
    self.crush5 = yale_email(self.crush5)
    self.crush6 = yale_email(self.crush6)
    self.crush7 = yale_email(self.crush7)
  end


end