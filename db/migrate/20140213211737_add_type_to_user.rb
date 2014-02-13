class AddTypeToUser < ActiveRecord::Migration
  def up
    unless column_exists? :users, :type
      add_column :users, :type, :string
    end
  end

  def down
    if column_exists? :users, :type
      remove_column :users, :type
    end
  end
end
