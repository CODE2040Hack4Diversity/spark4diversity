class AddBodyToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :body, :text
  end
end
