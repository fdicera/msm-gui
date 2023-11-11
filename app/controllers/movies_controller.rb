class MoviesController < ApplicationController
  def create
    # params hash looks like this:
    # {"the_title"=> "1", "the_year"=>"2", "the_duration" => "3", "the_description"=>"4", "the_image" => "5", "the_director_id"=> "6"}
    n = Movie.new
    n.title = params.fetch("the_title")
    n.year = params.fetch("the_year")
    n.duration = params.fetch("the_duration")
    n.description = params.fetch("the_description")
    n.image = params.fetch("the_image")
    n.director_id = params.fetch("the_director_id")
    
    n.save

    redirect_to("/movies")
    
    # Retrieve user's inputs from params
    # Create a record in the movie table
    # Populate eac hcolumn with user input
    # Save

    # Redirect the user back to the /movies URL
  end

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({ :id => the_id})

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end
  
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
