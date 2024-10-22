# frozen_string_literal: true

require 'active_record'
require 'yaml'
require 'bcrypt'

db_config = YAML.load_file(File.expand_path('database.yml', __dir__))
ActiveRecord::Base.establish_connection(db_config[ENV['APP_ENV'] || 'test'])
