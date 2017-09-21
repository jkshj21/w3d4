# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  u = User.create!(username: "David")

  p1 = Poll.create!(title: 'Dogs Poll', author_id: 6)

  q1 = Question.create!(text: 'What Dog Is Cutest?', poll_id: 3)
  ac1 = AnswerChoice.create!(text: 'Markov', question_id: 5)
  ac2 = AnswerChoice.create!(text: 'Curie', question_id: 5)
  ac3 = AnswerChoice.create!(text: 'Sally', question_id: 5)

  q2 = Question.create!(text: 'Which game Is Most Fun?', poll_id: 3)
  ac4 = AnswerChoice.create!(text: 'String', question_id: 6)
  ac5 = AnswerChoice.create!(text: 'Ball', question_id: 6)
  ac6 = AnswerChoice.create!(text: 'Bird', question_id: 6)

  r1 = Response.create!(
    respondent: 7,
    answer_id: 14
  )
  r2 = Response.create!(
    respondent: 8,
    answer_id: 16
  )
end
