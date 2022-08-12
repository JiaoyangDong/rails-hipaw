class Api::V1::PetsController < Api::V1::BaseController
  def index
    if params["filter"].nil?
      @pets = Pet.all
    else
      # Pet.where()
      sql_query = []
      %w[species sex district].each do  |filter|
        p "now on #{filter}"
        unless params[filter] == "all"
          if filter == "species"
            if params[filter] == "other"
              sql_query << "species NOT IN (dog, cat)"
            else
              sql_query << "species = :species"
            end
          elsif filter == "sex"
            sql_query << "sex = :sex"
          elsif filter == "district"
            sql_query << "district = :district"
          end
        end
        # p sql_query.join(" AND ")
      end
      p "==========sql query: #{sql_query.join(" AND ")}"
      @pets = Pet.where(sql_query.join(" AND "),
        species: params["species"],
        sex: params["sex"],
        district: params["district"])
    end
    p @pets.length
    render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    @my_booking = @pet.bookings.find_by(user_id: @current_user)
    render json: {pet: @pet, my_booking: @my_booking}
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


  private

  def pet_params
    params.require(:pet).permit(:name, :age, :species, :description, :sex, :fur_type, :image_url, :district)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
  end
end
