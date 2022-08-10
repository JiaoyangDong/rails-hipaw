class Api::V1::PetsController < Api::V1::BaseController
  def index
    @pets = Pet.all
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = @current_user
    unless @pet.save
      render_error
    end
  end

  def edit
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      render json: @pet
    else
      render_error
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    render json: @pet
  end


  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :description, :sex, :fur_type, :image_url, :district)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
  end
end
