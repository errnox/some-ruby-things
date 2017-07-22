require 'rexml/document'


Dir.glob('titles*.xml').each do |file|
  doc = REXML::Document.new(File.new(file))
  doc.elements.each('feed/entry/title') do |element|
    puts element.text
  end
end
