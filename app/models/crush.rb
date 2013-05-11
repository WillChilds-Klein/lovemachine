class Crush < ActiveRecord::Base
  attr_accessible :crusher, :crush_list, :email, :netID
  serialize :crush_list, Array.new(7)
end
