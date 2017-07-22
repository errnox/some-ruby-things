class DmenuTest
  def initialize
    @composition = []
  end

  def compose
    color = choose('Color', {
                     'red' => '#FF0000',
                     'blue' => '#0000FF',
                     'green' => '#00FF00',
                     'yellow' => '#FFFF00',
                     'white' => '#FFFFFF',
                     'black' => '#000000',
                   })
    size = choose('Size', {
                    'small' => 5,
                    'normal' => 10,
                    'large' => 15,
                    'xl' => 20,
                    'xxl' => 25,
                  })
    label = choose('Size', {
                     'lowercase' => 'label',
                     'capitalized' => 'Label',
                     'uppercase' => 'LABEL',
                  })
    puts <<-REPORT

Report
------

Color......#{color}
Size.......#{size}
Label......#{label}

REPORT
  end

  def choose(prompt, choices)
    list = choices.keys.join "\n"
    prompt = "#{prompt}:"
    choice = `printf "#{list}\n" | dmenu -l 40 -p "#{prompt}"`
    choice.gsub!("\n", '')
    choices[choice] || choice
  end
end

dmenu_test = DmenuTest.new
dmenu_test.compose
