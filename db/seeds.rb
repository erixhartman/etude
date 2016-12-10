# Create teacher users
teacherusers = [
  { first_name: "Eric", last_name: "Hartman", subject: 'Spanish' },
  { first_name: "Luke", last_name: "Plourde", subject: 'Spanish' },
  { first_name: "Ian", last_name: "Russell", subject: 'Guitar' },
  { first_name: "Mike", last_name: "Schwartze", subject: 'Guitar' }
]

x = 0
teacherusers.each do
  User.create(
    first_name: teacherusers[x][:first_name],
    last_name: teacherusers[x][:last_name],
    email: "#{teacherusers[x][:first_name].downcase}@#{teacherusers[x][:first_name].downcase}.com",
    password: "123",
    password_confirmation: "123"
  )
  Teacher.create(
    price: rand(20..50),
    subject: teacherusers[x][:subject],
    postal_code: "M5V 3M1",
    user_id: x,
    bio: "I'm a very good #{teacherusers[x][:subject].downcase} teacher...",
    picture: "http://robohash.org/#{rand(1..99999)}",
    teaching_since: Time.now,
    street_address: "#{rand(50..8000)} Yonge St",
    city: "Toronto",
    province: "ON"
  )
  x = x + 1
end

# Create Student users
4.times do |x|
  User.create(
    first_name: "User#{x}",
    last_name: "User",
    email: "user#{x}@user.com",
    password: "123",
    password_confirmation: "123"
  )
  Student.create(user_id: x)
end

# Create lessons
Lesson.create(time: Time.new(2017, 05, 10, 11, 0, 0), student_id: 1, teacher_id: 1)
Lesson.create(time: Time.new(2017, 05, 10, 12, 0, 0), student_id: 1, teacher_id: 1)
Lesson.create(time: Time.new(2017, 05, 10, 13, 0, 0), student_id: 1, teacher_id: 1)

# Create random availability ranges for all teachers
teachers = Array (1..Teacher.all.count)
teachers.each do |t|
  x = 0
  rand(0..6).times do
    start_time = rand(7..19)
    end_time = rand((start_time + 2)..23)
    AvailabilityRange.create(
    teacher_id: t,
    start_time: start_time,
    end_time: end_time,
    weekday: x
    )
    x = x + 1
  end
end
