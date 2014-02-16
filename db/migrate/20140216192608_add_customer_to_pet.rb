class AddCustomerToPet < ActiveRecord::Migration
  def up
    unless column_exists? :pets, :customer
      add_column :pets, :customer, :integer
    end
  end

  def down
    if column_exists? :pets, :customer
      remove_column :pets, :customer
    end
  end
end
