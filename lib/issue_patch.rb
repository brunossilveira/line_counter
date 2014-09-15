module IssuePatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)


    # Exectue this code at the class level (not instance level)
    base.class_eval do
      has_many :branches
      attr_accessible :estimated_lines


      safe_attributes 'estimated_lines', :if => lambda { |issue, user| issue.new_record? || user.allowed_to?(:edit_issues, issue.project) }
    end
  end

  module ClassMethods
  end
  module InstanceMethods
    def get_total_diff
      @total_diff ||= branches.sum(:diff) || 0
    end

    def get_percentage_done_calculated
      @percentage_done_calculated ||= get_total_diff.fdiv(estimated_lines) *100.0
    end
  end
end