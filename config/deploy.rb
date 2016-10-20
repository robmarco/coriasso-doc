# config valid only for current version of Capistrano
lock '3.6.1'

# Change these
server 'IP', port: 22, user: 'deployer', roles: [:web, :app], primary: true

set :repo_url,        'git@github.com:robmarco/coriasso-doc.git' # SSH git url
set :application,     'coriasso-doc'
set :user,            'deployer'

set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :rvm_type, :user

## Defaults:
set :scm,           :git
set :branch,        :master
set :format,        :pretty
set :log_level,     :debug
set :keep_releases, 3

## Linked Files & Directories (Default None):
set :linked_dirs,     %w{log}

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      invoke 'deploy'
    end
  end

  desc "Build version with middleman"
  task :middleman_build do
    on roles(:app) do
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, 'middleman build'
      end
    end
  end

  before :starting,  :check_revision
  after  :finishing, :cleanup
  after  :finishing, :middleman_build
end
