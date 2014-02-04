class IssueFormHookListener < Redmine::Hook::ViewListener

  render_on :view_issues_form_details_bottom, :partial => 'branches/form'

end