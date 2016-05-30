# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({ first_name: "Reggie", last_name: "Thompson", company: "RDC", role: 0, email: "reggie@gmail.com", password: "12345678" })
User.create({ first_name: "Sarah", last_name: "Lewis", company: "Mattel", role: 1, email: "sarah@gmail.com", password: "12345678" })
User.create({ first_name: "George", last_name: "Vandalay", company: "NBC", role: 1, email: "george@gmail.com", password: "12345678" })

Invoice.create({  })
