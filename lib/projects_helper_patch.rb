module ProjectsHelperPatch

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable
      alias_method_chain :project_settings_tabs, :monitoring
    end
  end

  module ClassMethods
  end

  module InstanceMethods

    def project_settings_tabs_with_monitoring
      tabs = project_settings_tabs_without_monitoring
      tabs.push({ :name => 'monitoring',
                  :action => :monitoring_settings,
                  :partial => 'projects/settings/monitoring',
                  :label => 'label_monitoring' })
      return tabs
    end

  end

end