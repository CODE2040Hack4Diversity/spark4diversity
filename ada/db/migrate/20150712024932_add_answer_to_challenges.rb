class AddAnswerToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :answer, :string
  end
end
