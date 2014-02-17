class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.find_by_sql ["
      SELECT 
        user.id as userID,
        pet.id as petID,
        user.name as userName,
        pet.name as petName,
        pet.type,
        pet.breed,
        pet.age,
        pet.weight,
        pet.date
      FROM 
        pets pet 
      INNER JOIN 
        users user 
      ON 
        pet.user_id = user.id
    "]
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    self.custom_cancan(['Owner', 'Veterinarian'])
    self.custom_cancan_id

    @pet = Pet.new
    @customers = User.select("id,name").where(:type => "Customer")
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    self.custom_cancan(['Owner'])

    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pet }
      else
        format.html { render action: 'new' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params[:pet]
    end
end
