class AddLanguageToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :language, :string
  end
end
