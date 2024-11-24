# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([{ title: 'Frontend' },
                              { title: 'Backend' },
                              { title: 'Mobile development' }])

users = User.create([{ name: 'Andy', mail: 'andy@google.com' },
                     { name: 'Mike', mail: 'mike@google.com' },
                     { name: 'Tom', mail: 'tom@google.com' }])

tests = Test.create([{ title: 'Ruby', level: 1, category: categories.second, user: users.first },
                     { title: 'HTML', category: categories.first, user: users.first },
                     { title: 'Python', category: categories.second, user: users.first },
                     { title: 'Java', level: 2, category: categories.third, user: users.first },
                     { title: 'Rails', level: 3, category: categories.second, user: users.first }])

questions = Question.create([{ body: 'Who is the creator of Ruby?', test: tests.first },
                             { body: 'Who is the creator of HTML?', test: tests.second },
                             { body: 'Who is the creator of Python?', test: tests.third },
                             { body: 'Who is the creator of Java?', test: tests.fourth },
                             { body: 'Who is the creator of Rails?', test: tests.fifth }])

Answer.create([{ body: 'Matz', correct: true, question: questions.first },
               { body: 'Steve Jobs', question: questions.first },
               { body: 'Tim Berners-Lee', correct: true, question: questions.second },
               { body: 'Bjarne Stroustrup', question: questions.second },
               { body: 'Guido van Rossum', correct: true, question: questions.third },
               { body: 'Sergey Brin', question: questions.third },
               { body: 'James Gosling', correct: true, question: questions.fourth },
               { body: 'Larry Wall', question: questions.fourth },
               { body: 'David Heinemeier Hansson', correct: true, question: questions.fifth },
               { body: 'Rasmus Lerdorf', question: questions.fifth }])

TestPassage.create([ { user: users.first, test: tests.first },
                     { user: users.first, test: tests.second },
                     { user: users.first, test: tests.third },
                     { user: users.second, test: tests.first },
                     { user: users.second, test: tests.third },
                     { user: users.second, test: tests.fifth },
                     { user: users.third, test: tests.first },
                     { user: users.third, test: tests.second },
                     { user: users.third, test: tests.fourth }])
