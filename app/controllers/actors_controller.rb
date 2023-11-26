class ActorsController < ApplicationController
  # Get the ID out of params
  def update
    m_id = params.fetch("the_id")

     # Look up the existing record
    matching_records = Actor.where({ :id => m_id })
    the_actor = matching_records.at(0)
    
   # Overwrite each column with the values from user inputs
   the_actor.name = params.fetch("the_name")
   the_actor.dob = params.fetch("the_dob")
   the_actor.bio = params.fetch("the_bio")
   the_actor.image = params.fetch("the_image")
   the_actor.actor_id = params.fetch("the_actor_id")

    # Save
    the_actor.save

    # Redirect to the movie details page
    redirect_to("/actors/#{the_actor.id}")
  end
  
  def create
    # params hash looks like this:
    # {"the_title"=> "1", "the_year"=>"2", "the_duration" => "3", "the_description"=>"4", "the_image" => "5", "the_director_id"=> "6"}
    n = Actor.new
    n.name = params.fetch("the_title")
    n.dob = params.fetch("the_year")
    n.bio = params.fetch("the_duration")
    n.image = params.fetch("the_image")
    n.actor_id = params.fetch("the_actor_id")
    
    n.save

    redirect_to("/actors")
    
    # Retrieve user's inputs from params
    # Create a record in the movie table
    # Populate eac hcolumn with user input
    # Save

    # Redirect the user back to the /movies URL
  end

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Actor.where({ :id => the_id})

    the_actor = matching_records.at(0)

    the_actor.destroy

    redirect_to("/actors")
  end
  
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end
end
