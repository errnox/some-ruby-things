require 'gruff'
require 'launchy'


dir = File.expand_path(File.dirname(__FILE__))
output_dir = "#{dir}/output"


graph = Gruff::Bullet.new
graph.title = 'Gruff Test Graph'
# graph.hide_line_markers = true
# graph.hide_legend = true
# graph.hide_title = true
# graph.hide_dots = true
# graph.hide_lines = true
# graph.baseline_value = 5
# graph.title_font_size = 50
# graph.legend_font_size = 10
# graph.x_axis_label = 'x axis label'
# graph.y_axis_label = 'y ayis label'
# graph.theme = {
#   :colors => %w(red green blue pink orange yellow brown),
#   :marker_color => 'grey',
#   :font_color => '#121212',
#   :background_colors => 'transparent',
# }
# graph.theme = Gruff::Themes::THIRTYSEVEN_SIGNALS
# graph.theme = Gruff::Themes::PASTEL
graph.labels = {
  0 => '0',
  100 => '100',
  200 => '200',
  300 => '300',
  400 => '400',
  500 => '500',
}

# graph.data 'Test Data Set 1', 500.times.collect { rand(500) - 0 }
# graph.data 'Test Data Set 2', 200.times.collect { rand(200) - 0 }
# graph.data 'Test Data Set 3', 200.times.collect { rand(500) - 0 }
# graph.data 'Test Data Set 4', 10.times.collect { rand(10) - 0 }

# graph.data 'Data', 10.times.collect { rand(10) - 0 }

graph.data 75, 100, {
  :target => 80,
  :low => 50,
  :high => 90,
}

Dir.mkdir(output_dir) unless Dir.exists?(output_dir)
graph.write("#{output_dir}/gruff.png")

# Launchy.open("file://#{output_dir}/gruff.png")
