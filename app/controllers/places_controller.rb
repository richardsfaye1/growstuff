class PlacesController < ApplicationController
  skip_authorize_resource

  def index
    respond_to do |format|
      format.html
      # json response is whatever we want to map here
      format.json { render :json => Member.located.to_json(:only => [:id, :login_name, :location, :latitude, :longitude]) }
    end
  end

  # GET /places/london
  # GET /places/london.json
  def show
    @place = params[:place] # used for page title
    @nearby_members = Member.nearest_to(params[:place])
    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @nearby_members.to_json(:only => [:id, :login_name, :location, :latitude, :longitude]) }
    end
  end

  def search
    respond_to do |format|
      format.html do
        redirect_to place_path(params[:new_place])
      end
    end
  end

end
