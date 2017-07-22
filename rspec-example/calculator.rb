class Calculator
  attr_accessor :customizable, :color

  def initialize()
    @version = '0.0.1'
    @customizable = true
    @color = 'white'
  end

  def sum(a, b)
    a.to_i + b.to_i
  end

  def mul(a, b)
    a.to_i * b.to_i
  end

  def big_number(value)
    value.to_i.abs + 100
  end

  def version
    "version #@version"
  end

  def change_color(color)
    @color = color
  end
end
