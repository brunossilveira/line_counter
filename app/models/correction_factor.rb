class CorrectionFactor < ActiveRecord::Base
  unloadable
  attr_accessible :complexity, :project, :tracker, :value

  belongs_to :project
  belongs_to :tracker

  validates :complexity, inclusion: { in: %w(Low Medium High) }
end
