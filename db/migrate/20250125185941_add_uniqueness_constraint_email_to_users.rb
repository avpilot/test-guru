class AddUniquenessConstraintEmailToUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :email, :string, unique: true
  end

  def down
    change_column :users, :email, :string, unique: false
  end
end
