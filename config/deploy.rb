# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"
# server '146.120.162.145', port: 22, roles: [:web, :app, :db], primary: true

set :rvm_ruby_version, '3.3.0'

set :application, "GalleryNew"
set :repo_url, "git@github.com:AlexAlex2014/GalleryNew.git"
set :user,            'alex'
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :puma_rackup, -> { File.join(current_path, 'config.ru') }


set :branch, 'master'

set :passenger_restart_with_touch, true
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name

set :puma_systemctl_user, :system
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
# set :deploy_to,     "/var/www/gallery_new"
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
# set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log,  "#{shared_path}/log/puma_error.log"
set :puma_conf, "#{shared_path}/puma.rb"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_ed25519.pub) }
set :puma_control_app, false
set :puma_service_unit_type, 'simple' # or notify
set :puma_enable_socket_service, true # mendatory in our case
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
set :puma_threads, [4, 16]
set :puma_workers, 0

set :pty, true
set :use_sudo, false

set :rails_env, 'production'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/master.key', '.env', 'config/database.yaml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor', 'storage'

# append :linked_files, "config/database.yml"
# set :linked_files, %w[ config/database.yml ]
# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
# Rake::Task["deploy:assets:backup_manifest"].clear_actions

set :nginx_config_name, 'GalleryNew'
set :nginx_server_name, 'GalleryNew'
set :nginx_use_ssl, false # will be handled by certbot

# namespace :puma do
#   desc 'Create Directories for Puma Pids and Socket'
#   task :make_dirs do
#     on roles(:app) do
#       execute "mkdir #{shared_path}/tmp/sockets -p"
#       execute "mkdir #{shared_path}/tmp/pids -p"
#     end
#   end
#
#   before :start, :make_dirs
# end

# namespace :deploy do
#   desc "Make sure local git is in sync with remote."
#   task :check_revision do
#     on roles(:app) do
#       unless `git rev-parse HEAD` == `git rev-parse origin/master`
#         puts "WARNING: HEAD is not the same as origin/master"
#         puts "Run `git push` to sync changes."
#         exit
#       end
#     end
#   end
#
#   # namespace :check do
#   #   before :linked_files, :set_master_key do
#   #     on roles(:app), in: :sequence, wait: 10 do
#   #       unless test("[ -f #{shared_path}/config/master.key ]")
#   #         upload! 'config/master.key', "#{shared_path}/config/master.key"
#   #       end
#   #     end
#   #   end
#   # end
#
#   desc 'Initial Deploy'
#   task :initial do
#     on roles(:app) do
#       before 'deploy:restart', 'puma:start'
#
#       invoke 'deploy'
#     end
#   end
#
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       invoke!("puma:restart")
#     end
#   end
#
#   before :starting,     :check_revision
#   after  :finishing,    :compile_assets
#   after  :finishing,    :cleanup
#   after  :finishing,    :restart
# end

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 2

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
