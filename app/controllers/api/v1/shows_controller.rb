class Api::V1::ShowsController < Api::BaseController
  before_action :authenticate_user!, except: [:search, :show]

  def create
    @show = current_user.shows.create(show_params)
    respond_with :api, :v1, @show
  end

  def show
    @show = Show.find(params[:id])
    respond_with :api, :v1, @show
  end

  def update
    @show = current_user.shows.find(params[:id])
    @show.update_attributes show_params
    respond_with :api, :v1, @show
  end

  def toggle_active
    @show = current_user.shows.find(params[:id])
    @show.toggle_active
    respond_with :api, :v1, @show
  end

  def index
    @shows = current_user.shows
    respond_with :api, :v1, @shows
  end

  def search
    @shows = ShowSearchService.new(query: params[:q],
                                   price_min: params[:price0],
                                   price_max: params[:price1])
                              .results
    respond_with :api, :v1, @shows
  end

  def destroy
    @show = current_user.shows.find(params[:id])
    @show.destroy
    respond_with :api, :v1, @show
  end

  private

  def show_params
    params.require(:show).permit(:max_spectators, :length, :title, :description, :price, :price_person, :cover_picture_id, :starts_at, :ends_at, :date_at, pictures_attributes: [ :src, :_destroy, :id, :selected ])
  end
end
