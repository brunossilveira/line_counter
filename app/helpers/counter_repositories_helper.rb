module CounterRepositoriesHelper

  def inspection_lines
    Setting.plugin_line_counter['preparation_lines'].to_i
  end
end
