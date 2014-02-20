class IssueFormHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_sidebar_planning_bottom, :partial => 'branches/branches'
  render_on :view_issues_show_description_bottom, :partial => 'branches/diff'
end