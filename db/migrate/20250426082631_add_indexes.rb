class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, %i[title level], unique: true
    add_index :categories, :title, unique: true
    add_index :test_passages, [:user_id, :test_id]
  end
end
