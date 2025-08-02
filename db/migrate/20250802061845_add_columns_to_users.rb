class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :is_active, :boolean, default: true, null: false
  end
end
