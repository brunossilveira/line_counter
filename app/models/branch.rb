class Branch < ActiveRecord::Base
  unloadable

  attr_accessible :name

  belongs_to :issue
  has_one :repository
end
