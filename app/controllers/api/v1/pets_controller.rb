class Api::V1::PetsController < ApplicationController
  def index
    @pets = Pet.all
    render json: @pets
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      render :show, status: :created
    else
      render error
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :description, :sex, :fur_type, :image_url)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
  end
end
