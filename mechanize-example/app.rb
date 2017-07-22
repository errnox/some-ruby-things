require 'mechanize'
require 'launchy'


# Setup

website = 'http://www.codepad.org/'

agent = Mechanize.new do |agent|
  agent.user_agent_alias = 'Mac Firefox'
end
puts "Visiting #{website}"
page = agent.get(website)

# Submit original paste
puts 'Submitting code form'
code_form = page.forms.first
code_form.field_with(:name => 'code').value = <<-STRINGSTRINGSTRING
def hello
  puts 'Hello.'
end
STRINGSTRINGSTRING
code_form.radiobuttons_with(:name => 'lang')[10].check
code_form.checkbox_with(:name => 'private').check
code_form.checkbox_with(:name => 'run').check
paste_page = code_form.submit

# Fork the original paste
puts 'Visiting fork page'
fork_page = paste_page.link_with(:text => 'fork').click
puts 'Submitting fork form'
fork_page_form = fork_page.forms.first
fork_page_textarea = fork_page_form.field_with(:name => 'code')
fork_page_textarea.value = fork_page_textarea.value + <<-STRINGSTRINGSTRING

def bye
  puts 'Bye.'
end
STRINGSTRINGSTRING
fork_page = fork_page_form.submit

paste_page_url = paste_page.uri.to_s
fork_page_url = fork_page.uri.to_s

# Write info to stdout
puts "\nHere is the original paste:"
puts paste_page_url
puts "\nHere is the forked paste:"
puts fork_page_url

# Open all necessary pages in the browser
Launchy.open(paste_page_url)
Launchy.open(fork_page_url)
