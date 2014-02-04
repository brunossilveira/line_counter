module IssuesHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def branches_checkboxes(issue)
      issue.branches.map do |branch|
        tag = check_box_tag 'issues[branches_ids][]', branch.id, false, :id => nil
        content_tag 'label', "#{tag} #{h(branch.name)}".html_safe,
                    :id => "issue_branch_id_#{branch.id}",
                    :class => 'floating'
      end.join.html_safe
    end
  end
end