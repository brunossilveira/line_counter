class CounterRepositoriesController < ApplicationController
  unloadable

  def index
    @project = Project.find(params[:id])
    @repositories = CounterRepository.where(:project_id => @project.id).all
  end

  def new
    @project = Project.find(params[:format])
    @repository = CounterRepository.new(:project => @project)
  end

  def create
    @project = Project.find(params[:project_id])
    @repository = CounterRepository.new(params[:counter_repository])
    @repository.project_id = @project.id
    if @repository.valid?
      @repository.save!
      flash[:notice] = l(:notice_successful_create)
    end
    @repositories = CounterRepository.where(:project_id => @project.id).all
    redirect_to action: 'index', id: @project.identifier
  end

  def edit
    @repository = CounterRepository.find(params[:id])
    @project = Project.find(@repository.project_id)
  end

  def update
    @repository = CounterRepository.find(params[:id])
    @repository.update_attributes(params[:counter_repository])
    @project = Project.find(@repository.project_id)
    if !@repository.save!
      flash[:error] = t(:error)
      render :edit
    else
      flash[:notice] = t(:notice_successful_update)
      redirect_to action: 'index', id: @project.identifier
    end
  end

  def destroy
    repo = CounterRepository.find(params[:id])
    @project = Project.find(repo.project_id)
    @repositories = CounterRepository.where(:project_id => @project.id).all

    if repo.destroy
      flash[:notice] = l(:notice_successful_delete)
    end
    redirect_to action: 'index', id: @project.identifier
  end

end
