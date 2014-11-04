class AddEstimatedLinesToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :estimated_lines, :integer
  end
end
