# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'

# Configuración de ActiveRecord
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

require './models/user'

def update_user_type(user_name)
  user = User.find_by(username: user_name)

  if user
    user.user_type = 1
    user.save!
    puts "Usuario #{user_name} actualizado con éxito."
  else
    puts "Usuario #{user_name} no encontrado."
  end
end

if __FILE__ == $PROGRAM_NAME
  print 'Introduce el nombre del nuevo administrador de Geogef: '
  name_to_search = gets.chomp
  update_user_type(name_to_search)
end
