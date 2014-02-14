class AddCodeToUsers < ActiveRecord::Migration
  def up
    unless column_exists? :users, :code
      add_column :users, :code, :integer
    end
  end

  def down
    if column_exists? :users, :code
      remove_column :users, :code
    end
  end
end
