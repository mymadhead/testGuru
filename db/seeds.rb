# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!([{ name: 'Jacob' },
                     { name: 'John' }])

category = Category.create!([{ name: :IT },
                             { name: :Games },
                             { name: :Music }])

test = Test.create!([{ title: 'Насколько хорошо вы разбираетесь в технологиях?', category: category[0], author: user[0] },
                     { title: 'Какая социальная сеть вам больше подходит?', category: category[0], author: user[0] },
                     { title: 'Какая профессия из мира IT вам подходит?', category: category[0], author: user[0] },
                     { title: 'Как хорошо ты знаешь вселенную Dota 2?', category: category[1], author: user[1] },
                     { title: 'Много ли вы знаете о геймерах?', category: category[1], author: user[1] },
                     { title: 'Тест: хорошо ли вы знаете советскую эстраду?', category: category[2], author: user[2] }])
question = Question.create!([{ body: 'Какие из этих приложений используют нейросети?',
                               test: test[0].id },
                             { body: 'В каких сферах больше всего используется блокчейн?',
                               test: test[0].id },
                             { body: 'Кто такой Илон Маск?',
                               test: test[0].id },
                             { body: 'Что такое hyperloop?',
                               test: test[1].id },
                             { body: 'Чем занимаются bug hunters?',
                               test: test[1].id },
                             { body: 'Сколько фундаменталов в Dota 2?',
                               test: test[1].id },
                             { body: 'У кого оригинал aghanims scepter?',
                               test: test[2].id },
                             { body: 'Почему битва древних никогда не закончится?',
                               test: test[2].id },
                             { body: 'Кто исполнил партию Трубадура в мультфильме "По следам бременских музыкантов"?',
                               test: test[2].id }])
Answer.create!([{ body: 'Prisma, EasyTen, Facebook', question: question[0], correct: true },
                { body: 'Findface, Api.ai, Luka', question: question[0], correct: false },
                { body: 'Findface, Instagram, Сбербанк Онлайн', question: question[0], correct: false },
                { body: 'Банковские технологии', question: question[1], correct: true },
                { body: 'Игры', question: question[1], correct: false },
                { body: 'Торговля', question: question[1], correct: false },
                { body: 'Основатель Tesla, SpaceX и SolarCity', question: question[2], correct: true },
                { body: 'Персонаж из Сейлор Мун', question: question[2], correct: false },
                { body: 'Режиссер, который снял фильм про основателя Facebook', question: question[2], correct: false },
                { body: 'Очень большая лупа', question: question[3], correct: false },
                { body: 'Гигантский телескоп, который построили недавно в Китае', question: question[3], correct: false },
                { body: 'Вакуумный поезд', question: question[3], correct: true },
                { body: 'Хакеры, которые ищут уязвимости в программах', question: question[4], correct: true },
                { body: 'Охотятся за жуками, а потом продают их в зоопарки', question: question[4], correct: false },
                { body: 'Это геймеры, играют в игры про жуков', question: question[4], correct: false },
                { body: '3', question: question[5], correct: false },
                { body: '4', question: question[5], correct: true },
                { body: '5', question: question[5], correct: false },
                { body: 'Его отдали Rubick', question: question[6], correct: true },
                { body: 'У Valve, даже не ищите', question: question[6], correct: false },
                { body: 'У Alchemist, конечно. Как столько аганимов варить без оригинала?', question: question[6], correct: false },
                { body: 'Из-за мультивселенных', question: question[7], correct: true },
                { body: 'На битву наложено проклятие', question: question[7], correct: false },
                { body: 'Герои Dota 2 находятся в волшебном измерении', question: question[7], correct: false },
                { body: 'Иосиф Кобзон', question: question[8], correct: true },
                { body: 'Муслим Магомаев', question: question[8], correct: false },
                { body: 'Михаил Боярский', question: question[8], correct: false }])

