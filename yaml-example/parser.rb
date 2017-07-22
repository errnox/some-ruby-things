require 'yaml'
require 'awesome_print' # DEBUG


yaml = YAML.load_file('res/yaml/test.yaml')
ap yaml

yaml.each do |doc|
  if doc['code']
    eval doc['code']
  end
end
