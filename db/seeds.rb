# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed Codes Table
Code.create(:type => 'Owner', :code => '112233')
Code.create(:type => 'Receptionist', :code => '445566')
Code.create(:type => 'Veterinarian', :code => '778899')
Code.create(:type => 'Customer', :code => '123456')


