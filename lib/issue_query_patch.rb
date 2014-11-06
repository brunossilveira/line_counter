module IssueQueryPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)


    # Exectue this code at the class level (not instance level)
    base.class_eval do
      alias_method_chain :available_columns, :monitoring
    end
  end

  module InstanceMethods
    def available_columns_with_monitoring

      columns = available_columns_without_monitoring

      columns.each_with_index { |column, i| return columns if column.name == :estimated_lines }
      columns.push(QueryColumn.new(:estimated_lines, :caption => :label_estimated_lines))

      columns.each_with_index { |column, i| return columns if column.name == :commited_lines }
      columns.push(QueryColumn.new(:commited_lines, :caption => :label_commited_lines,
                                   :sortable => "((select sum(diff) from #{Branch.table_name} where #{Branch.table_name}.issue_id = #{Issue.table_name}.id)",
                                   :default_order => 'asc'))

      columns.each_with_index { |column, i| return columns if column.name == :calculated_hours_percentage }
      columns.push(QueryColumn.new(:calculated_hours_percentage, :caption => :label_calculated_hours_percentage,
                                   :sortable => "((select sum(hours) from #{TimeEntry.table_name} where #{TimeEntry.table_name}.issue_id = #{Issue.table_name}.id) / estimated_hours) * 100",
                                   :default_order => 'asc'))

      columns.each_with_index { |column, i| return columns if column.name == :calculated_lines_percentage }
      columns.push(QueryColumn.new(:calculated_lines_percentage, :caption => :label_calculated_lines_percentage,
                                   :sortable => "((select sum(diff) from #{Branch.table_name} where #{Branch.table_name}.issue_id = #{Issue.table_name}.id) / estimated_lines) * 100",
                                   :default_order => 'asc'))

      columns.each_with_index { |column, i| return columns if column.name == :calculated_productivity }
      columns.push(QueryColumn.new(:calculated_productivity, :caption => :label_calculated_productivity,
                                   :sortable => 'calculated_productivity',
                                   :default_order => 'asc'))

      columns.each_with_index { |column, i| return columns if column.name == :projected_hours }
      columns.push(QueryColumn.new(:projected_hours, :caption => :label_projected_hours))

      columns.each_with_index { |column, i| return columns if column.name == :projected_lines }
      columns.push(QueryColumn.new(:projected_lines, :caption => :label_projected_lines))

      columns.each_with_index { |column, i| return columns if column.name == :calculated_estimated_time }
      columns.push(QueryColumn.new(:calculated_estimated_time, :caption => :label_calculated_estimated_time))

    end
  end
end