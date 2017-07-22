require 'gnuplot'


Gnuplot.open do |gp|
  Gnuplot::Plot.new(gp) do |plot|
    plot.xrange "[-10:10]"
    plot.title 'Test Plot'
    plot.ylabel 'x'
    plot.xlabel 'sin(x)'

    x = (0..50).collect { |v| v.to_f }
    y = x.collect { |v| v ** 2 }

    plot.data << Gnuplot::DataSet.new([x, y]) do |ds|
      ds.with = 'linespoints'
      ds.linewidth = 1
      ds.title = 'Test data'
    end

    x = (0..100).collect { |v| v }
    y = x.collect { |v| v ** 2 }

    plot.data << Gnuplot::DataSet.new([x, y]) do |ds|
      ds.with = 'boxes fill solid 0.25 border'
      ds.linewidth = 1
      ds.title = 'Other test data'
    end

    plot.terminal 'png'
    plot.output 'plot.png'
  end
end
