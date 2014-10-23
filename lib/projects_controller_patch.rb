module ProjectsControllerPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    # Exectue this code at the class level (not instance level)
    base.class_eval do
      # around_action :update_monitoring_fields, only: :create
    end
  end

  module ClassMethods
  end
  module InstanceMethods

    def monitoring_settings    
      @project.inspection_preparation_average = params[:project][:inspection_preparation_average]
      @project.inspection_average = params[:project][:inspection_average]
      @project.rework_average = params[:project][:rework_average]
      @project.productivity_average = params[:project][:productivity_average]

      @project.update_correction_factors(params[:correction_factors])      

      if @project.save
        flash[:notice] = l(:notice_successful_update)
      end
      redirect_to settings_project_path(@project, :tab => 'monitoring')
    end

    def update_monitoring_fields 
      self.inspection_preparation_average = Setting.plugin_monitoring['inspection_preparation_average']
      self.inspection_average = Setting.plugin_monitoring['inspection_average']
      self.rework_average = Setting.plugin_monitoring['rework_average']
      self.productivity_average = Setting.plugin_monitoring['productivity_average']

      self.update_correction_factors(params[:correction_factors])   
    end
    
  end
end