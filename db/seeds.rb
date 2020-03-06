# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EndUser.create! (
  [
    {
      nickname: "管理者",
      phone_number: "090-1234-5678",
      gender: "1",
      age: "1",
      fotsal_experience: "5",
      soccer_experience: "5",
      email: "aaa@aaa",
      admin: "true"
    }
  ]
)