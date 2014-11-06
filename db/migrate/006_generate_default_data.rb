class GenerateDefaultData < ActiveRecord::Migration
  def up
  	IssueCustomField.create(type: "IssueCustomField", name: "Complexity", field_format: "list", possible_values: ["Low", "Medium", "High"], regexp: "", min_length: nil, max_length: nil, is_required: true, is_for_all: true, is_filter: true, position: 1, searchable: true, default_value: "", editable: true, visible: true, multiple: false, format_store: {:url_pattern=>"", :edit_tag_style=>""}, description: "", trackers: Tracker.all)
    query = IssueQuery.new(name: "Relatório de Acompanhamento", filters: {"status_id"=>{:operator=>"*", :values=>[""]}}, column_names: [:tracker, :status, :calculated_estimated_time, :estimated_lines, :spent_hours, :commited_lines, :done_ratio, :calculated_hours_percentage, :calculated_lines_percentage, :calculated_productivity], sort_criteria: [], group_by: "", type: "IssueQuery", visibility: 1, options: {:draw_relations=>nil, :draw_progress_line=>nil}, roles: [Role.where(:name => 'Manager').first])    
    query.user_id = 1
    query.type = 'IssueQuery'
    query.save!
    query = IssueQuery.new(name: "Relatório de Projeção", filters: {"status_id"=>{:operator=>"o", :values=>[""]}}, column_names: [:project, :tracker, :calculated_estimated_time, :estimated_lines, :spent_hours, :commited_lines, :projected_hours, :projected_lines, :calculated_productivity], sort_criteria: [], group_by: "", type: "IssueQuery", visibility: 1, options: {:draw_relations=>nil, :draw_progress_line=>nil}, roles: [Role.where(:name => 'Manager').first])
    query.user_id = 1
    query.type = 'IssueQuery'
    query.save!
    query = IssueQuery.new(name: "Relatório de Batimento", filters: {"status_id"=>{:operator=>"c", :values=>[""]}}, column_names: [:tracker, :status, :calculated_estimated_time, :spent_hours, :estimated_lines, :commited_lines, :calculated_productivity], sort_criteria: [], group_by: "", type: "IssueQuery", visibility: 1, options: {:draw_relations=>nil, :draw_progress_line=>nil}, roles: [Role.where(:name => 'Manager').first])
    query.user_id = 1
    query.type = 'IssueQuery'
    query.save!
  end
end
