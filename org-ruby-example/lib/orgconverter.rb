require 'org-ruby'

require_relative "orgconverter/version"


module Orgconverter
  def to_html(input_file, outpu_file)
    org = File.open(input_file, 'r').read
    html = Orgmode::Parser.new().to_html
    File.open(output_file, 'w+') { |f| f.puts html }
  end
end
