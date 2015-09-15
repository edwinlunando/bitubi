Chef::Log.info('Running deploy/before_migrate.rb...')

Chef::Log.info('Pecompile Assets')
execute 'rake assets:precompile' do
  cwd release_path
  command "bundle exec rake assets:precompile"

  environment 'RAILS_ENV' => new_resource.environment['RAILS_ENV'],
              'SECRET_KEY_BASE' => new_resource.environment['SECRET_KEY_BASE'],
              'DEVISE_SECRET_KEY' => new_resource.environment['SECRET_KEY_BASE'],
              'FOG_DIRECTORY' => new_resource.environment['FOG_DIRECTORY'],
              'AWS_ACCESS_KEY_ID' => new_resource.environment['AWS_ACCESS_KEY_ID'],
              'AWS_SECRET_ACCESS_KEY' => new_resource.environment['AWS_SECRET_ACCESS_KEY']

end
