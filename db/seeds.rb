subjects = ['Spanish', 'Guitar', 'French', 'Drums', 'Recorder', 'Samba', 'Welding',
  'Woodworking', 'Scrapbooking', 'Knitting', 'Korean', 'Cooking', 'Karate', 'Bridge',
  'Fishing', 'Waterskiing', 'Kiteboarding', 'Trombone', 'Trumpet', 'Boxing'
]

firstnames = [
  'Dinorah', 'Aleta', 'Carola', 'Chiquita', 'Kia', 'Tawny', 'Su', 'Kristan', 'Katia', 'Ha',
  'Claris', 'Lisabeth', 'Latoya', 'Krystin', 'Alexandria', 'Anya', 'Betty', 'Verena', 'Jada',
  'Nydia', 'Cordelia', 'Halley', 'Stephany', 'Bunny', 'Alta', 'Laci', 'Leah', 'Yanira',
  'Bobette', 'Shellie', 'Geraldine', 'Ozie', 'Theda', 'Jacquiline', 'Yoshiko', 'Miranda',
  'Filomena', 'Agripina', 'Jaimie', 'Susanna', 'Karey', 'Allene', 'Effie', 'Bee', 'Debi',
  'Dominic', 'Allen', 'Mohammed', 'Gino', 'Ervin', 'Berry', 'Pedro', 'Lawerence', 'Junior',
  'Kareem', 'Beau', 'Chester', 'Guillermo', 'Ismael', 'Mose', 'Royce', 'Jimmie', 'Hiram',
  'Jamar', 'Ian', 'Winston', 'Kelley', 'Jimmy', 'Lionel', 'Josue', 'Reid', 'Colby', 'Hank',
  'Rufus', 'Winfred', 'Kieth', 'Ezequiel', 'Steven', 'Miles', 'John', 'Leonard', 'Rusty',
  'Quinton', 'Darnell', 'Woodrow', 'Forest', 'Oscar', 'Alfredo', 'Dante', 'Donovan', 'Rickie',
  'Lane', 'Mauricio', 'Luke', 'Lawrence', 'Elia', 'Tama', 'Tessie', 'Fiona', 'Aimee'
]

lastnames = [
  'Lemon', 'Shaffer', 'Jurek', 'Deering', 'Hyre', 'Kuck', 'Mitchem', 'Sybert', 'Santelli',
  'Riendeau', 'Lomanto', 'Devens', 'Rancourt', 'Trudel', 'Pape', 'Autin', 'Pascucci',
  'Graydon', 'Topper', 'Schley', 'Darbonne', 'Cosper', 'Minchew', 'Jaynes', 'Phares',
  'Laford', 'Dreyer', 'Larin', 'Hanus', 'Woodham', 'Lehmann', 'Brito', 'Standard',
  'Delapena', 'Sires', 'Samford', 'Bagley', 'Charon', 'Claflin', 'Camilleri', 'Fitting',
  'Vassar', 'Durling', 'Lasso', 'Letcher', 'Deems', 'Shrock', 'Yeldell', 'Clampitt', 'Eaves'
]

# Create teacher users
teacherusers = [
  { first_name: "Eric", last_name: "Hartman", subject: subjects[rand(0..subjects.count)] },
  { first_name: "Luke", last_name: "Plourde", subject: subjects[rand(0..subjects.count)] },
  { first_name: "Ian", last_name: "Russell", subject: subjects[rand(0..subjects.count)] },
  { first_name: "Mike", last_name: "Schwartze", subject: subjects[rand(0..subjects.count)] }
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
    user_id: x + 1,
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
15.times do |x|
  User.create(
    first_name: "#{firstnames[rand(0..firstnames.count)]}",
    last_name: "#{lastnames[rand(0..lastnames.count)]}",
    email: "user#{x}@user.com",
    password: "123",
    password_confirmation: "123"
  )
  user = User.last
  Student.create(user_id: user.id)
end


# Create random availability ranges for all teachers
teachers = Array (1..Teacher.all.count)
teachers.each do |t|
  x = 0
  rand(1..6).times do
    start_time = rand(7..19)
    end_time = rand((start_time + 2)..23)
    AvailabilityRange.create(
    teacher_id: t,
    start_time: start_time,
    end_time: end_time,
    weekday: x
    )
    # Create a bunch of random lesons
    100.times do
      Lesson.create(
      time: Time.new(rand(2016..2017), rand(2..12), (rand(1..28)), (start_time + 1), 0, 0),
      student_id: rand(1..Student.all.count),
      teacher_id: t
      )
    end
    x = x + 1
  end
end
