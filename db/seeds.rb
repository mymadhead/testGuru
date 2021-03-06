# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ name: :IT },
                             { name: :Games },
                             { name: :Music }])

tests = Test.create!([{ title: 'Ruby', level: 1, category: categories[0], author: User.find(1) },
                      { title: 'Ruby on Rails', level: 2, category: categories[0], author: User.find(1)},
                      { title: 'Python', level: 3, category: categories[0], author: User.find(1) },
                      { title: 'Corel draw', level: 1, category: categories[1], author: User.find(1) },
                      { title: 'Painting', level: 2, category: categories[1], author: User.find(1) },
                      { title: 'Workshop', level: 0, category: categories[2], author: User.find(1) }])

questions = Question.create!([{ body: 'Which of following is current version of Ruby?', test: tests[0] },
                              { body: 'How to create an block?', test: tests[0] },
                              { body: 'What is Rails', test: tests[1] },
                              { body: 'What Ruby on Rails has in common with railsroad', test: tests[1] },
                              { body: 'What does it mean PYTHON', test: tests[2] },
                              { body: 'What time is it now?', test: tests[2] },
                              { body: 'What is the main purpose of Corel DRAW?', test: tests[3] },
                              { body: 'What studio develop paint?', test: tests[3] },
                              { body: 'What color match with white?', test: tests[4] },
                              { body: 'Tom&Jerry??', test: tests[4] },
                              { body: 'Tom&Jerry??', test: tests[5] },
                              { body: 'You will work at ', test: tests[5] }])

answers = Answer.create!([{ body: '1', correct: false, question: questions[0] },
                          { body: 'Speed race', correct: false, question: questions[0] },
                          { body: '2.6.3', correct: true, question: questions[0] },
                          { body: 'Secret chamber', correct: false, question: questions[0] },
                          { body: 'By using "do"', correct: true, question: questions[1] },
                          { body: 'Ask brother', correct: false, question: questions[1] },
                          { body: 'Jamaica', correct: false, question: questions[1] },
                          { body: 'Entering at house', correct: false, question: questions[1] },
                          { body: 'Framework', correct: true, question: questions[2] },
                          { body: 'Hard work', correct: false, question: questions[2] },
                          { body: 'Hardcore', correct: false, question: questions[2] },
                          { body: 'Woodstock', correct: false, question: questions[2] },
                          { body: 'Training', correct: false, question: questions[3] },
                          { body: 'Raining', correct: false, question: questions[3] },
                          { body: 'Being', correct: false, question: questions[3] },
                          { body: 'Nothing', correct: true, question: questions[3] },
                          { body: 'Formula Translating System', correct: true, question: questions[4] },
                          { body: 'a car', correct: false, question: questions[4] },
                          { body: 'a dog', correct: false, question: questions[4] },
                          { body: 'Follow the rabbit', correct: false, question: questions[4] },
                          { body: 'Terminator', correct: false, question: questions[5] },
                          { body: 'Graphic design', correct: false, question: questions[5] },
                          { body: 'Jedi', correct: false, question: questions[5] },
                          { body: 'Talking about', correct: true, question: questions[5] },
                          { body: 'General motors', correct: false, question: questions[6] },
                          { body: 'Slipknot', correct: false, question: questions[6] },
                          { body: 'Diablo 3', correct: false, question: questions[6] },
                          { body: 'Adobe', correct: true, question: questions[6] },
                          { body: 'Blue', correct: false, question: questions[7] },
                          { body: 'Table', correct: false, question: questions[7] },
                          { body: 'Red', correct: false, question: questions[7] },
                          { body: 'Green', correct: true, question: questions[7] },
                          { body: 'Dust', correct: true, question: questions[8] },
                          { body: 'Shining', correct: false, question: questions[8] },
                          { body: 'Zig-Rig', correct: false, question: questions[8] },
                          { body: 'Helicopter', correct: false, question: questions[8] }])
