class AddEntryAtToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :entry_at, :datetime
  end
end
