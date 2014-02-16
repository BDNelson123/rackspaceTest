class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.column :name, :string, :length => 35
      t.column :type, :string
      t.column :breed, :string, :length => 35
      t.column :age, :integer
      t.column :weight, :integer
      t.column :date, :date
      t.timestamps
    end
  end
end
