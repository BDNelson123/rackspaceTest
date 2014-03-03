require 'spec_helper'

# NOTES
# getting error saying date is nil so have to pass it in on before loops

describe Pet do
  describe "name validations" do
    context "name is present" do
      before(:each) do
        @pet = Pet.new(name: "Besty Boo", date: Date.today - 90)
      end

      it "does not add an error on the 'name' attribute" do
        @pet.should have(0).error_on(:name)
      end
    end

    context "name is not present" do
      before(:each) do
        @pet = Pet.new(name: "", date: Date.today - 90)
      end

      it "adds an error on the 'name' attribute" do
        @pet.should have(1).error_on(:name)
      end

      it "should redirect back to create pet page" do
        @pet.should redirect_to '/pets/new'
      end
    end
  end

  describe "type validations" do
    context "type is present" do
      before(:each) do
        @pet = Pet.new(type: "Dog", date: Date.today - 90)
      end

      it "does not add an error on the 'type' attribute" do
        @pet.should have(0).error_on(:type)
      end
    end

    context "type is not present" do
      before(:each) do
        @pet = Pet.new(type: "", date: Date.today - 90)
      end

      it "add an error on the 'type' attribute" do
        # will also get error on type_is_dog_or_cat
        @pet.should have(2).error_on(:type)
      end
    end

    context "type is Dog" do
      before(:each) do
        @pet = Pet.new(type: "Dog", date: Date.today - 90)
      end

      it "does not add an error on the 'type' attribute" do
        @pet.should have(0).error_on(:type)
      end
    end

    context "type is Cat" do
      before(:each) do 
        @pet = Pet.new(type: "Cat", date: Date.today - 90)
      end

      it "does not add an error on the 'type' attribute" do
        @pet.should have(0).error_on(:type)
      end
    end

    context "type is Snake" do
      before(:each) do
        @pet = Pet.new(type: "Snake", date: Date.today - 90)
      end

      it "adds an error on the 'type' attribute" do
        @pet.should have(1).error_on(:type)
      end
    end
  end

  describe "breed validations" do
    context "breed is present" do
      before(:each) do
        @pet = Pet.new(breed: "German Shepherd", date: Date.today - 90)
      end

      it "does not add an error on the 'breed' attribute" do
        @pet.should have(0).error_on(:breed)
      end
    end

    context "breed is not present" do
      before(:each) do
        @pet = Pet.new(breed: "", date: Date.today - 90)
      end

      it "adds an error on the 'breed' attribute" do
        @pet.should have(1).error_on(:breed)
      end
    end

    context "breed has less than 36 characters" do
      before(:each) do
        @pet = Pet.new(breed: "German Shepherd", date: Date.today - 90)
      end

      it "does not add an error on the 'breed' attribute" do
        @pet.should have(0).error_on(:breed)
      end
    end

    context "breed has more than 35 characters" do
      before(:each) do
        @pet = Pet.new(breed: "Louisiana Catahoula German Tinseltown Leopard Dog", date: Date.today - 90)
      end

      it "adds and error on the 'breed' attribute" do
        @pet.should have(1).error_on(:breed)
      end
    end
  end

  describe "age validations" do
    context "age is present" do
      before(:each) do
        @pet = Pet.new(age: "15", date: Date.today - 90)
      end

      it "does not add an error on the 'age' attribute" do
        @pet.should have(0).error_on(:age)
      end
    end

    context "age is not present" do
      before(:each) do
        @pet = Pet.new(age: "", date: Date.today - 90)
      end

      it "adds an error on the 'age' attribute" do
        @pet.should have(1).error_on(:age)
      end
    end
  end

  describe "weight validations" do
    context "weight is present" do
      before(:each) do
        @pet = Pet.new(weight: "50", date: Date.today - 90)
      end

      it "does not add an error on the 'weight' attribute" do
        @pet.should have(0).error_on(:weight)
      end
    end

    context "weight is not present" do
      before(:each) do
        @pet = Pet.new(weight: "", date: Date.today - 90)
      end

      it "adds an error on the 'weight' attribute" do
        @pet.should have(1).error_on(:weight)
      end
    end
  end

  describe "date validations" do
    context "date is present" do
      before(:each) do
        @pet = Pet.new(date: Date.today - 90)
      end

      it "does not add an error on the 'date' attribute" do
        @pet.should have(0).error_on(:date)
      end
    end

    context "date is in past" do
      before(:each) do
        @pet = Pet.new(date: Date.today - 90)
      end

      it "does not add an error on the 'date' attribute" do
        @pet.should have(0).error_on(:date)
      end
    end

    context "date is in future" do
      before(:each) do
        @pet = Pet.new(date: Date.today + 90)
      end

      it "adds an error on the 'date' attribute" do
        @pet.should have(1).error_on(:date)
      end
    end
  end
end
