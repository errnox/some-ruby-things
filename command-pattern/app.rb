require_relative 'command'
require_relative 'lightswitch'


light_switch = LightSwitch.new
command = Command.new('Random test command',
                      lambda() { lightswitch.turn_on },
                      lambda() { lightswitch.turn_off })
light_switch.turn_on
light_switch.turn_off
