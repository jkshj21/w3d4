class ChangeRespondentToRespondentId < ActiveRecord::Migration[5.1]
  def change
    rename_column(:responses, :respondent, :respondent_id)
  end
end
