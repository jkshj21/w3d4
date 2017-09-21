class ChangeResponseColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column(:responses, :user_id, :respondent)
  end
end
