# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

NHL::Application.load_tasks

task :create_admin => :environment do
  user = User.create!( :email => 'admin@nhlawpl.com', :username => 'SuperAdmin',
  :password => 'password', :role => 'admin')
end
