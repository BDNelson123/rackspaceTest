class AddUniqueIndexToCode < ActiveRecord::Migration
  def change
    add_index :codes, :type, :unique => true
    add_index :codes, :code, :unique => true
  end
end
