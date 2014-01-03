class MoviesController < ApplicationController
  before_action :set_movie, only: [:destroy]

  # GET /movies
  def index
    @movies = Movie.order(status: :desc)
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)
    @movie.status = false
    if @movie.save
      redirect_to new_movie_path
    else
      render action: 'new'
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.status
      then @movie.update_attribute(:status, false)
      else @movie.update_attribute(:status, true)
    end
    redirect_to movies_url
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    redirect_to movies_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:name, :status)
  end

end
