# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   Mayor.create(name: 'Emanuel', city: cities.first)

Invoice.destroy_all
User.destroy_all

User.create({ first_name: "Reggie", last_name: "Thompson", company: "RDC", role: 0, email: "reggie@gmail.com", password: "12345678" })
client1 = User.create({ first_name: "Sarah", last_name: "Lewis", company: "Mattel", role: 1, email: "sarah@gmail.com", password: "12345678" })
client2 = User.create({ first_name: "George", last_name: "Vandalay", company: "NBC", role: 1, email: "george@gmail.com", password: "12345678" })

Invoice.create({ client_name: "Mattel", project_name: "iOS action_figure app", project_summary: "Become your favorite superheroes and villians, fight other players with blocky movement, and unlock new characters", amount_due: 3999.99, date: Date.parse('10/5/2012 10:47'), user_id: client1.id })
Invoice.create({ client_name: "Mattel", project_name: "Company blog", project_summary: "Company blog where select users can create posts for all to see", amount_due: 1599.99, date: Date.parse('02/12/1997 3:25'), user_id: client1.id })
Invoice.create({ client_name: "Mattel", project_name: "Charades app", project_summary: "Test your acting skills with charades app themed with NBC shows and programming", amount_due: 3599.99, date: Date.parse('06/12/1999 4:25'), user_id: client1.id })
Invoice.create({ client_name: "NBC", project_name: "TV remote app", project_summary: "Control your TV from your phone", amount_due: 5699.99, date: Date.parse('01/02/2000 1:25'), user_id: client2.id })
Invoice.create({ client_name: "NBC", project_name: "Trivial pursuit app", project_summary: "Be king/queen of TV and show off to your friends and family with your frivolous knowledge", amount_due: 2799.99, date: Date.parse('04/06/2002 3:25'), user_id: client2.id })
Invoice.create({ client_name: "NBC", project_name: "Movie preview app", project_summary: "Watch movie previes, read moving ratings from Rotten Tomatoes, and share with your friends and family your reviews!", amount_due: 6899.99, date: Date.parse('04/12/2003 3:25'), user_id: client2.id })
Invoice.create({ client_name: "NBC", project_name: "Sketch comedy app", project_summary: "Challenge your friends and family to a game of improv and sketch comedy", amount_due: 2999.99, date: Date.parse('07/11/2004 3:25'), user_id: client2.id })
