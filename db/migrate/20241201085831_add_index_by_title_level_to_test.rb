class AddIndexByTitleLevelToTest < ActiveRecord::Migration[6.1]
  def change
    add_index(:tests, [:title, :level], unique: true, name: 'by_title_level')
  end
end
