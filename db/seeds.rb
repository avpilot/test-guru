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

users = User.create([{ name: 'Andy', mail: 'andy@google.com' },
                     { name: 'Mike', mail: 'mike@google.com' },
                     { name: 'Tom', mail: 'tom@google.com' }])

tests = Test.create([{ title: 'Ruby', level: 1, category: categories.second, author: users.first },
                     { title: 'HTML', category: categories.first, author: users.first },
                     { title: 'Python', category: categories.second, author: users.first },
                     { title: 'Java', level: 2, category: categories.third, author: users.first },
                     { title: 'Rails', level: 3, category: categories.second, author: users.first },
                     { title: 'Assembler', level: 8, category: categories.fourth, author: users.second }])

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

# TestPassage.create([ { user: users.first, test: tests.first },
#                      { user: users.first, test: tests.second },
#                      { user: users.first, test: tests.third },
#                      { user: users.second, test: tests.first },
#                      { user: users.second, test: tests.third },
#                      { user: users.second, test: tests.fifth },
#                      { user: users.third, test: tests.first },
#                      { user: users.third, test: tests.second },
#                      { user: users.third, test: tests.fourth }])
