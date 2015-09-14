Chef::Log.info('Running deploy/before_migrate.rb...')

Chef::Log.info('Pecompile Assets')
execute 'rake assets:precompile' do
  cwd release_path
  command "bundle exec rake assets:precompile"
  environment 'RAILS_ENV' => new_resource.environment['RAILS_ENV'], 'SECRET_KEY_BASE' => new_resource.environment['SECRET_KEY_BASE']
end
