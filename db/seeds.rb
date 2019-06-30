# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)A

johnny = User.create first_name: "Johnny",   last_name: "Depp"
saikat = User.create first_name: "Saikat", last_name: "Sarkar"
sumit  = User.create first_name: "Sumit",  last_name: "Sarkar"

Message.create title: "This is a message from John",   user: johnny
Message.create title: "This is a message from Saikat", user: saikat
Message.create title: "This is a message from Sumit",  user: sumit

