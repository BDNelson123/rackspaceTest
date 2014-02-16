class CreateAppointmentTable < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.integer :pet
      t.integer :customer
      t.boolean :reminder
      t.string :reason
    end
  end
end
