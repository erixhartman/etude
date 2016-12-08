# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  first_name: "Eric",
  last_name: "Hartman",
  email: "eric@eric.com",
  password: "123",
  password_confirmation: "123"
)

Teacher.create(
  price: 20,
  subject: 'Spanish',
  postal_code: 123,
  user_id: 1
)

User.create(
  first_name: "Luke",
  last_name: "Plourde",
  email: "luke@luke.com",
  password: "123",
  password_confirmation: "123"
)

Teacher.create(
  price: 30,
  subject: 'Spanish',
  postal_code: 123,
  user_id: 2
)

User.create(
  first_name: "Ian",
  last_name: "Russell",
  email: "ian@ian.com",
  password: "123",
  password_confirmation: "123"
)

Teacher.create(
  price: 25,
  subject: 'Guitar',
  postal_code: 123,
  user_id: 3
)

User.create(
  first_name: "Mike",
  last_name: "Schwartze",
  email: "mike@mike.com",
  password: "123",
  password_confirmation: "123"
)

Teacher.create(
  price: 35,
  subject: 'Guitar',
  postal_code: 123,
  user_id: 4
)

User.create(
  first_name: "Seat",
  last_name: "Yourself",
  email: "seat@yourself.com",
  password: "123",
  password_confirmation: "123"
)

Student.create(
  user_id: 5
)

x = 0
7.times do
  AvailabilityRange.create(
  teacher_id: 1,
  start_time: 9,
  end_time: 17,
  weekday: x
  )
  x = x + 1
end
