# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  ['user', 'admin', 'root', 'dev'].each do |role|
    Role.find_or_create_by({name: role})
  end

  lroot=Login.new
  lroot.email="admin@mail.ru"
  lroot.password="admin@mail.ru"
  lroot.password_confirmation="admin@mail.ru"
  lroot.add_role :root
  lroot.save!
