class AddUsersMailNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:users, :mail, false)
  end
end
