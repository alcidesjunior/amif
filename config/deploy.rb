# config valid only for current version of Capistrano
lock '3.8.0'

set :repo_url, 'git@github.com:alcidesjunior/amif.git'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :user, 'alcides'
set :application, 'amif'
set :rails_env, 'production'
server '200.129.46.3', user: "#{fetch(:user)}", roles: %w{app db web}, primary: true
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :pty, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/assets/galery/' ,'public/uploads', 'public/profile')

set :config_example_suffix, '.example'
set :config_files, %w{config/database.yml config/secrets.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"
set :rbenv_map_bins, %w{rake gem bundle ruby rails puma pumactl}
namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
end
