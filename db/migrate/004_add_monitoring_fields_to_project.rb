class AddMonitoringFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :inspection_preparation_average, :integer
    add_column :projects, :inspection_average, :integer
    add_column :projects, :rework_average, :integer
    add_column :projects, :productivity_average, :integer  
  end
end
