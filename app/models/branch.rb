require 'rugged'

class Branch < ActiveRecord::Base

  unloadable

  attr_accessible :name, :counter_repository, :issue

  belongs_to :issue
  belongs_to :counter_repository


  def diff
    count = 0
    repo = Rugged::Repository.new(counter_repository.url)
    diff = repo.diff(name, 'master')

    diff.each_patch do |patch|
      patch.hunks.each do |hunk|
        hunk.lines.each do |line|
          count = count + 1 if (line.new_lineno == -1 && !line.content.blank?)
          count = count - 1 if line.old_lineno == -1
        end
      end
    end
    count
  end

end
