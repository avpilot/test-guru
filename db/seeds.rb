# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ title: 'Frontend' },
                              { title: 'Backend' },
                              { title: 'Mobile development' },
                              { title: 'Embedded' }])

admin = User.create!(
  email: 'admin@example.com',
  password: 'somepass',
  password_confirmation: 'somepass',
  first_name: 'Andy',
  last_name: 'Pronin',
  type: 'Admin',
  confirmed_at: Time.current
)

users_data = [
  { email: 'user1@example.com', first_name: 'Иван', last_name: 'Петров' },
  { email: 'user2@example.com', first_name: 'Мария', last_name: 'Сидорова' },
  { email: 'user3@example.com', first_name: 'Алексей', last_name: 'Иванов' }
]

users_data.each do |user_data|
  user = User.create!(
    email: user_data[:email],
    password: 'password123',
    password_confirmation: 'password123',
    first_name: user_data[:first_name],
    last_name: user_data[:last_name],
    confirmed_at: Time.current
  )
end

tests = Test.create([{ title: 'Ruby', level: 1, category: categories.second, author: admin },
                     { title: 'HTML', category: categories.first, author: admin },
                     { title: 'Python', category: categories.second, author: admin },
                     { title: 'Java', level: 2, category: categories.third, author: admin },
                     { title: 'Rails', level: 3, category: categories.second, author: admin },
                     { title: 'Assembler', level: 8, category: categories.fourth, author: admin }])

questions = Question.create([{ body: 'Who is the creator of Ruby?', test_id: tests.first.id },
                             { body: 'Who is the creator of HTML?', test_id: tests.second.id },
                             { body: 'Who is the creator of Python?', test_id: tests.third.id },
                             { body: 'Who is the creator of Java?', test_id: tests.fourth.id },
                             { body: 'Who is the creator of Rails?', test_id: tests.fifth.id }])

Answer.create([{ body: 'Matz', correct: true, question_id: questions.first.id },
               { body: 'Steve Jobs', question_id: questions.first.id },
               { body: 'Tim Berners-Lee', correct: true, question_id: questions.second.id },
               { body: 'Bjarne Stroustrup', question_id: questions.second.id },
               { body: 'Guido van Rossum', correct: true, question_id: questions.third.id },
               { body: 'Sergey Brin', question_id: questions.third.id },
               { body: 'James Gosling', correct: true, question_id: questions.fourth.id },
               { body: 'Larry Wall', question_id: questions.fourth.id },
               { body: 'David Heinemeier Hansson', correct: true, question_id: questions.fifth.id },
               { body: 'Rasmus Lerdorf', question_id: questions.fifth.id }])
