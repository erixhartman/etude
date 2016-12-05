# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.create(
  first_name: "Eric",
  last_name: "Hartman",
  email: "eah458@nyu.edu",
  price: 20,
  subject: 'guitar',
)

Teacher.create(
  first_name: "Luke",
  last_name: "Plourde",
  email: "luke@luke.com",
  price: 40,
  subject: 'guitar',
)

Teacher.create(
  first_name: "Ian",
  last_name: "Russell",
  email: "ian@ian.com",
  price: 40,
  subject: 'spanish',
)

Teacher.create(
  first_name: "Mike",
  last_name: "Schwartze",
  email: "mike@mike.com",
  price: 20,
  subject: 'spanish',
)

Student.create(
  first_name: "Seat",
  last_name: "Yourself",
  email: "seat@yourself.com"
)
