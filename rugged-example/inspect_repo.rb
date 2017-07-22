require 'rugged'


repo = Rugged::Repository.init_at './repo'

oid = repo.write 'Some content for this blob', :blob

index = repo.index
index.add :path => 'README.md', :oid => oid, :mode => 0100644

current_tree = index.write_tree repo
parents = repo.empty? ? [] : [repo.head.target].compact

author = {:email => 'john@example.com', :time => Time.now, :name =>
  'John Doe'}

Rugged::Commit.create(repo,
                      :author => author,
                      :message => 'This is an auto-generated test commit.',
                      :committer => author,
                      :parents => parents,
                      :tree => current_tree,
                      :update_ref => 'HEAD')

puts repo.config['user.name']
