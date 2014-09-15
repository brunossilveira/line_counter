module IssuesControllerPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)


    # Exectue this code at the class level (not instance level)
    base.class_eval do
      before_filter :update_diff, :only => :show
    end
  end

  module ClassMethods
  end
  module InstanceMethods
    def update_diff
      @issue.branches.each do |branch|
        branch.diff = branch.get_diff
        branch.save!
      end
    end
  end
end