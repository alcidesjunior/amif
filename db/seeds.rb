# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
modal  = Modalidade.create(:nome=>"Jiu-Jitsu")
User.create(:nome=>"Admin",:sobrenome=>"",:email=>"adm@ifce.com",:password=>"qweqwe",:user_type=> 1,:modalidades_id=>modal.id)
