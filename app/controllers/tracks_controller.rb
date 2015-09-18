class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  def index
    @tracks = Track.all
  end

  def show
  end

  def new
    @track = Track.new
  end
  def edit
  end

  def create
    obj = S3_BUCKET.objects[params[:track].fetch(:url).original_filename]
    obj.write(
      file: params[:track].fetch(:url),
      acl: :public_read
    )
    @track = Track.new(track_params)
    @track.url = obj.public_url

      if @track.save
         redirect_to tracks_path, notice: 'Track was successfully created.'
      else
         render :new
      end
  end

  def update
      if @track.update(track_params)
        redirect_to @track, notice: 'Track was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @track.destroy
    redirect_to tracks_path, notice: 'Track was successfully destroyed.'
    head :no_content
  end

  private
    def set_track
      @track = Track.find(params[:id])
    end

    def track_params
      params.require(:track).permit(:name, :genre, :url)
    end
end
