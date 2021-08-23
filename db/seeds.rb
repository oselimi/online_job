# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
 @user = User.create( 
                    first_name: Faker::Name.name, 
                    last_name: Faker::Name.name, 
                    email: Faker::Internet.email, 
                    password: '123456',
                    password_confirmation: '123456'
                  )
end

10.times do 
  Job.create(
              title: Faker::Job.title,
              description: Faker::Lorem.sentence(word_count: 150),
              category: Faker::Job.position,
              deadline: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
              user: User.first 
            )
end

10.times do 
 Job.create(
             title: Faker::Job.title,
             description: Faker::Lorem.sentence(word_count: 150),
             category: Faker::Job.position,
             deadline: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
             user: User.last
           )
end
