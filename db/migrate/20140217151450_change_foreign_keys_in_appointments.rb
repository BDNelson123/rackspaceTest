class ChangeForeignKeysInAppointments < ActiveRecord::Migration
  def change
    rename_column :appointments, :pet, :pet_id
    rename_column :appointments, :customer, :user_id
  end
end
