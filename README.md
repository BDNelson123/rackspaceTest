This is a test for rackspace.

<br><br>

I installed the devise gem for user authentication.  User's need a code to register as different types.  These codes are:<br>
Code.create(:type => 'Owner', :code => '112233')
Code.create(:type => 'Receptionist', :code => '445566')
Code.create(:type => 'Veterinarian', :code => '778899')
Code.create(:type => 'Customer', :code => '123456')
<br>
and they are located in seeds.rb.

<br><br>

I also created three different controllers and models (other than users).  They are pets, appointments, and members.  The members controller 
is the acting as the home controller where you can view other owners, veterinarians, customers, and receptionists.

<br><br>

I have not put in any rspec unit tests.  I can do this upon request.

<br><br>

I also haven't put too much focus onto actions other than create and read due to time constraints.

<br><br>

All controllers were created with scaffolding and the I used MySQL as my database.
