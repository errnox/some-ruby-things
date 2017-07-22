class App
  def initialize
    @data = [22, 3, 47, 24, 42, 323, 3, 34, 39, 45]
  end

  def run
    ema = 0
    w = 0.05
    @data.each do |x|
      ema = w * ema + (1 - w) * x
      puts "x: #{x}    ema: #{ema}"
    end
  end
end

app = App.new
app.run
