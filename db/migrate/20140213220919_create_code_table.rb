class CreateCodeTable < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.column :type, :string
      t.column :code, :integer
    end
  end
end
