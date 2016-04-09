require 'rake'

namespace :vagrant do
  desc 'Run into vagrant for production'
  task :production do
    sh 'bundle exec itamae ssh --vagrant roles/production.rb'
  end
end
