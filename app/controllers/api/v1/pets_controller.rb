class Api::V1::PetsController < Api::V1::BaseController
  def index
    if params["filter"].nil?
      @pets = Pet.all
    else
      # Pet.where()
      sql_query = []
      %w[species gender size].each do  |filter|
        p "now on #{filter}"
        unless params[filter] == "all"
          if filter == "species"
            if params[filter] == "other"
              sql_query << "species NOT IN ('dog', 'cat')"
            else
              sql_query << "species = :species"
            end
          elsif filter == "gender"
            sql_query << "gender = :gender"
          elsif filter == "size"
            sql_query << "size = :size"
          end
        end
        # p sql_query.join(" AND ")
      end
      if sql_query.length == 0
        @pets = Pet.all
      else
        p "==========sql query: #{sql_query.join(" AND ")}"
        @pets = Pet.where(sql_query.join(" AND "),
          species: params["species"],
          sex: params["gender"],
          district: params["size"])
      end
    end
    p @pets.length
    # render json: @pets
  end

  def show
    @pet = Pet.find(params[:id])
    @my_booking = @pet.bookings.find_by(user: @current_user)
    # render json: {pet: @pet, my_booking: @my_booking}
    render json: {pet: @pet}
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
    params.require(:pet).permit(:name, :species, :age, :gender, :image_url, :size)
  end

  def render_error
    render json: { errors: @pet.errors.full_messages }, status: :unprocessable_entity
  end
end