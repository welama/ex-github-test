# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Joke.take.blank?
  Joke.create(
    [
      {
        title: '樹的味道',
        content: "Q: 樹嚐起來的味道像什麼？\r\n\r\nA: 像雞，因爲樹味像雞（數位相機）"
      },
      {
        title: '誰殺了熊',
        content: "Q: 數字 1 到 9 ，是誰殺了熊？\r\n\r\nA: 1 ，因爲伊莎貝爾（1殺bear）"
      },
      {
        title: '哈利波特',
        content: "Q: 哈利波特從霍格華茲畢業之後住在什麼地方？\r\n\r\nA: 住在燈泡裡，因爲他是鎢絲（巫師）"
      },
      {
        title: '大樹小樹',
        content: "Q: 大樹小樹差在哪裡？\r\n\r\nA: 插在土裡。"
      }
    ]
  )
end
