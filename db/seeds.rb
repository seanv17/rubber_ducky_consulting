# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   Mayor.create(name: 'Emanuel', city: cities.first)

Invoice.destroy_all
User.destroy_all

admin_user   = User.create({ first_name: "Reggie", last_name: "Thompson", company: "RDC", role: 0, email: "reggie@gmail.com", password: "12345678" })
mattel_sarah_lewis = User.create({ first_name: "Sarah", last_name: "Lewis", company: "Mattel", role: 1, email: "sarah@gmail.com", password: "12345678" })
nbc_george_vandalay = User.create({ first_name: "George", last_name: "Vandalay", company: "NBC", role: 1, email: "george@gmail.com", password: "12345678" })

Invoice.create({ client_name: "Mattel", project_name: "iOS action_figure app", project_summary: "Become your favorite superheroes and villians, fight other players with blocky movement, and unlock new characters.", amount_due: 2999.99, date: 2014-10-12, user_id: mattel_sarah_lewis.id })
Invoice.create({ client_name: "NBC", project_name: "Sketch comedy app", project_summary: "Challenge your friends and family to a game of improv and sketch comedy.", amount_due: 1599.99, date: 1997-2-12, user_id: nbc_george_vandalay.id })
