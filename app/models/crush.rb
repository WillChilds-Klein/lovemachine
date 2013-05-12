class Crush < ActiveRecord::Base
  attr_accessible :matches, :crush1, :crush2, :crush3, :crush4, :crush5, :crush6, :crush7, :email, :netID
  serialize :matches, Array

  def all_crushes
    return [crush1, crush2, crush3, crush4, crush5, crush6, crush7]
  end

  def form_done?
    return !!(crush1 || crush2 || crush3 || crush4 || crush5 || crush6 || crush7)
  end
end