class AddNameAddressCityStateZipSchoolYearsToUsers < ActiveRecord::Migration
  def up
    unless column_exists? :users, :name
      add_column :users, :name, :string, :length => 35
    end

    unless column_exists? :users, :address
      add_column :users, :address, :string
    end

    unless column_exists? :users, :city
      add_column :users, :city, :string
    end

    unless column_exists? :users, :state
      add_column :users, :state, :string
    end

    unless column_exists? :users, :zip
      add_column :users, :zip, :integer, :length => 5
    end

    unless column_exists? :users, :school
      add_column :users, :school, :string
    end

    unless column_exists? :users, :years
      add_column :users, :years, :integer, :length => 3
    end
  end

  def down
    if column_exists? :users, :name
      remove_column :users, :name
    end

    if column_exists? :users, :address
      remove_column :users, :address
    end

    if column_exists? :users, :city
      remove_column :users, :city
    end

    if column_exists? :users, :state
      remove_column :users, :state
    end

    if column_exists? :users, :zip
      remove_column :users, :zip
    end

    if column_exists? :users, :school
      remove_column :users, :school
    end

    if column_exists? :users, :years
      remove_column :users, :years
    end
  end
end
