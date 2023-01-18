puts "🌱 Seeding contests..."

# create hackathon instance
h1 = Hackathon.create(
  image_url: "https://bit.ly/3B7hCTt",
  topic: "Trial Hackathon",
  description: "lorem ipsum dolor sit amet, consectetur adipiscing",
  location: "Nairobi, Ngong Lane",
  datetime: "12/06/2022 12:20:00"
)

# create user instance
u1 = User.create(
  fullname: "Maingi",
  email: "sammaingi5@gmail.com",
  phonenumber: "0796727706",
  languages: "Javascript, Python, Ruby",
  role: "Backend Developer"
)

# create event instance
e1 = Event.create(
  user_id: u1,
  hackathon_id: h1
)

puts "✅ Done seeding!"