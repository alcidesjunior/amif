# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if ENV['type'] == "frontPanel"
  (1..4).each do |n|
    FrontPanel.create(:titulo=>"Título #{n}",:conteudo=>"Conteúdo #{n}")
  end
elsif ENV['type'] == "users"
  User.create(:nome=>"Admin",:sobrenome=>"",:email=>"adm@ifce.com",:password=>"qweqwe",:user_type=> 1,:modalidades_id=>1)
elsif ENV['type'] == "modalidade"
  modal  = Modalidade.create(:nome=>"Jiu-Jitsu")
elsif ENV['type'] == "faker_atletas"
  require 'faker'
  (1..10).each do |n|
    if n%2==1
      prof = 1
      moda = 2
    else
      prof = 2
      moda = 1
    end
    Atletum.create(
      :nome=>Faker::Name.name,
      :sobrenome=>Faker::Name.last_name,
      :data_nascimento=>Faker::Date.birthday(18, 35),
      :email=>Faker::Internet.email,
      :nacionalidade=>"brasileiro",
      :telefone1=>Faker::PhoneNumber.cell_phone,
      :telefone2=>Faker::PhoneNumber.phone_number,
      :graduacao=>"faixa branca",
      :professors_id=> prof,
      :modalidades_id=>moda
   )
  end
end
