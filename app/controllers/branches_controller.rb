class BranchesController < ApplicationController
  unloadable

  def new
  end

  def append
    @issue = Issue.find(params[:object_id])
    @branches = []

    params[:branches].each do |val|
      branch = Branch.new
      branch.name = val.split(',')[1]
      branch.repository = Repository.find(val.split(',')[0])
      branch.issue = @issue
      @branches << branch
    end
  end

end
