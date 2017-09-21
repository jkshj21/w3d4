# == Schema Information
#
# Table name: responses
#
#  id            :integer          not null, primary key
#  respondent_id :integer          not null
#  answer_id     :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Response < ApplicationRecord
  validates :respondent, presence: true
  validates :answer_id, presence: true
  validate :respondent_already_answered?
  validate :author_answering_himself?

  belongs_to(
    :respondent,
    class_name: 'User',
    foreign_key: :respondent_id,
    primary_key: :id
  )

  belongs_to(
    :answer_choice,
    class_name: 'AnswerChoice',
    foreign_key: :answer_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  # private
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    # if sibling_responses.any? { |response| response.respondent = self.respondent }
    if self.sibling_responses.exists?(respondent_id: self.respondent_id)
      errors[:respondent_id] << "You've already answered this question."
    end
  end

  def author_answering_himself?
    if self.answer_choice.question.poll.author_id == self.respondent_id
      errors[:respondent_id] << "You asked the question!"
    end
  end
end
