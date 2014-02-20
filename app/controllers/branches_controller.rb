class BranchesController < ApplicationController

  def new
    @issue = Issue.find(params[:issue])
    @repositories = CounterRepository.where(:project_id => @issue.project_id).all
  end

  def append
    @issue = Issue.find(params[:issue])
    @branches = []

    params[:branch][:branch_ids].each do |val|
      branch_name = val.split(',')[1]
      if Branch.where(:issue_id => @issue.id, :name => branch_name).first.nil?
        repository_id = val.split(',')[0]
        repository = CounterRepository.find(repository_id)
        branch = Branch.new
        branch.name = branch_name
        branch.counter_repository = repository
        branch.issue = @issue
        branch.save!
        @branches << branch
      end
    end

  end

  def destroy
    @issue = Issue.find(params[:issue_id])
    branch = Branch.find(params[:branch_id])
    branch.destroy
  end

end
