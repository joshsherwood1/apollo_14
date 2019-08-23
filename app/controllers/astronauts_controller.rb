class AstronautsController<ApplicationController

  def index
    @astronauts = Astronaut.all
    # @astronaut = Astronaut.find(params[:id])
    # binding.pry
  end

  # private
# def astronaut_params
#   params.permit(:name, :age, :job)
# end
end
