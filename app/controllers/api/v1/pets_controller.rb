class Api::V1::PetsController < Api::V1::BaseController
  def index
    @pets = Pet.all
    # render json: @pets

  end

  def show
    @pet = Pet.find(params[:id])
    # render json: @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = @current_user
    if @pet.save
      render json: {pet: @pet}
      #render :show #, status: :created
    else
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
      # render json: @pet
      render :show
    else
      render_error
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    render json: { msg: 'Deleted' }
  end

  def upload
    @pet = Pet.find(params[:id])
    puts "params #{params}"
    @pet.image.attach(params[:image])
    render json: {msg: 'success'}
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :description, :sex, :fur_type, :district, :image)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
  end
end
