# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = Category.create!([{ name: :IT },
                             { name: :Games },
                             { name: :Music }])

test = Test.create!([{ title: 'Насколько хорошо вы разбираетесь в технологиях?', category_id: category[0].id },
                     { title: 'Какая социальная сеть вам больше подходит?', category_id: category[0].id },
                     { title: 'Какая профессия из мира IT вам подходит?', category_id: category[0].id },
                     { title: 'Как хорошо ты знаешь вселенную Dota 2?', category_id: category[1].id },
                     { title: 'Много ли вы знаете о геймерах?', category_id: category[1].id },
                     { title: 'Тест: хорошо ли вы знаете советскую эстраду?', category_id: category[2].id }])
question = Question.create!([{ body: 'Какие из этих приложений используют нейросети?',
                               test_id: test[0].id },
                             { body: 'В каких сферах больше всего используется блокчейн?',
                               test_id: test[0].id },
                             { body: 'Кто такой Илон Маск?',
                               test_id: test[0].id },
                             { body: 'Что такое hyperloop?',
                               test_id: test[1].id },
                             { body: 'Чем занимаются bug hunters?',
                               test_id: test[1].id },
                             { body: 'Сколько фундаменталов в Dota 2?',
                               test_id: test[1].id },
                             { body: 'У кого оригинал aghanims scepter?',
                               test_id: test[2].id },
                             { body: 'Почему битва древних никогда не закончится?',
                               test_id: test[2].id },
                             { body: 'Кто исполнил партию Трубадура в мультфильме "По следам бременских музыкантов"?',
                               test_id: test[2].id }])
Answer.create!([{ body: 'Prisma, EasyTen, Facebook', question_id: question[0].id, correct: true },
                { body: 'Findface, Api.ai, Luka', question_id: question[0].id, correct: false },
                { body: 'Findface, Instagram, Сбербанк Онлайн', question_id: question[0].id, correct: false },
                { body: 'Банковские технологии', question_id: question[1].id, correct: true },
                { body: 'Игры', question_id: question[1].id, correct: false },
                { body: 'Торговля', question_id: question[1].id, correct: false },
                { body: 'Основатель Tesla, SpaceX и SolarCity', question_id: question[2].id, correct: true },
                { body: 'Персонаж из Сейлор Мун', question_id: question[2].id, correct: false },
                { body: 'Режиссер, который снял фильм про основателя Facebook', question_id: question[2].id, correct: false },
                { body: 'Очень большая лупа', question_id: question[3].id, correct: false },
                { body: 'Гигантский телескоп, который построили недавно в Китае', question_id: question[3].id, correct: false },
                { body: 'Вакуумный поезд', question_id: question[3].id, correct: true },
                { body: 'Хакеры, которые ищут уязвимости в программах', question_id: question[4].id, correct: true },
                { body: 'Охотятся за жуками, а потом продают их в зоопарки', question_id: question[4].id, correct: false },
                { body: 'Это геймеры, играют в игры про жуков', question_id: question[4].id, correct: false },
                { body: '3', question_id: question[5].id, correct: false },
                { body: '4', question_id: question[5].id, correct: true },
                { body: '5', question_id: question[5].id, correct: false },
                { body: 'Его отдали Rubick', question_id: question[6].id, correct: true },
                { body: 'У Valve, даже не ищите', question_id: question[6].id, correct: false },
                { body: 'У Alchemist, конечно. Как столько аганимов варить без оригинала?', question_id: question[6].id, correct: false },
                { body: 'Из-за мультивселенных', question_id: question[7].id, correct: true },
                { body: 'На битву наложено проклятие', question_id: question[7].id, correct: false },
                { body: 'Герои Dota 2 находятся в волшебном измерении', question_id: question[7].id, correct: false },
                { body: 'Иосиф Кобзон', question_id: question[8].id, correct: true },
                { body: 'Муслим Магомаев', question_id: question[8].id, correct: false },
                { body: 'Михаил Боярский', question_id: question[8].id, correct: false }])
User.create!(name: 'Jacob')
