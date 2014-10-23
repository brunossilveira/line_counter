module QueriesHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :column_content, :monitoring
    end
  end

  module InstanceMethods
    def column_content_with_monitoring(column, issue)
      value = column.value(issue)
      if %w(Fixnum Float).include?( value.class.name ) and [:estimated_lines].include?(column.name)
        sprintf "%.2f", value
      else
        column_content_without_monitoring(column, issue)
      end
    end
  end
end