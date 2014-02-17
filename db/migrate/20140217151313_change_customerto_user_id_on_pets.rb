class ChangeCustomertoUserIdOnPets < ActiveRecord::Migration
  def change
    rename_column :pets, :customer, :user_id
  end
end
