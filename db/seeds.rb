# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
Attendance.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')


5.times do
    u = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, encrypted_password: "userpassword", description: Faker::Lorem.sentences )
    u.email = u.first_name + '_' + u.last_name + '@yopmail.com'
    u.save
    puts "User created"
end

5.times do
   Event.create(start_date: Faker::Date.forward(days: 365), duration: [5,10,30,50,25,60].sample, title: Faker::Movie.title, description: Faker::Lorem.sentence(word_count: 20), price: rand(1..1000), location: Faker::Fantasy::Tolkien.location, admin_id: User.all.sample.id)
    puts "Event created"
end

Event.all.each do |event|
    random = rand(0..5)
    random.times do
      Attendance.create(user_id: User.all.sample.id, event: event)
      puts "Attendance created"
    end
end