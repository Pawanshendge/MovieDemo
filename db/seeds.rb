# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Movie.create!(title: 'Animal', genre: 'Action, Drama', director: 'Sandeep Reddy Vanga', description: 'A son undergoes a remarkable transformation as the bond with his father begins to fracture, and he becomes consumed by a quest for vengeance.', release_year: '1 December 2023 (India)', duration: '3.4', cast: 'Ranbir Kapoor
Actor') 
Movie.create!(title: 'Ranjhana', genre: 'Action, Drama', director: 'Sandeep Reddy Vanga', description: 'A son undergoes a remarkable transformation as the bond with his father begins to fracture, and he becomes consumed by a quest for vengeance.', release_year: '1 December 2023 (India)', duration: '3.4', cast: 'Ranbir Kapoor
Actor')
Movie.create!(title: 'Avtar', genre: 'Action, Drama', director: 'Sandeep Reddy Vanga', description: 'A son undergoes a remarkable transformation as the bond with his father begins to fracture, and he becomes consumed by a quest for vengeance.', release_year: '1 December 2023 (India)', duration: '3.4', cast: 'Ranbir Kapoor
Actor')
Movie.create!(title: 'Animal2', genre: 'Action, Drama', director: 'Sandeep Reddy Vanga', description: 'A son undergoes a remarkable transformation as the bond with his father begins to fracture, and he becomes consumed by a quest for vengeance.', release_year: '1 December 2023 (India)', duration: '3.4', cast: 'Ranbir Kapoor
Actor')