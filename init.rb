require 'issue_form_hook_listener'
require 'issue_patch'
require 'issues_helper_patch'

Redmine::Plugin.register :line_counter do
  name 'Line Counter plugin'
  author 'Bruno Silveira'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/brunossilveira'
  author_url 'http://github.com/brunossilveira'

  permission :counter_repositories, {:counter_repositories => [:index]}, :public => true
  menu :project_menu, :counter_repositories, {:controller => 'counter_repositories', :action => 'index'}, :caption => 'Line Counter'

  ActionDispatch::Callbacks.to_prepare do
    # Redmine's files patches
    Issue.send(:include, IssuePatch)
    IssuesHelper.send(:include, IssuesHelperPatch)
  end
end
