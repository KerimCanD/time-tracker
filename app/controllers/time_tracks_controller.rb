class TimeTracksController < ApplicationController
  before_action :set_time_track, only: %i[ edit update destroy ]

  def index
    if current_user.is_admin?
      @q = TimeTrack.ransack(params[:q])
      @time_tracks = @q.result(distinct: true)
      respond_to do |format|
        format.html
        format.js
      end
    else
      @q = current_user.time_tracks.ransack(params[:q])
      @time_tracks = @q.result(distinct: true)
      respond_to do |format|
        format.html
        format.js
      end
    end
      
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def new
    @time_track = TimeTrack.new
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @time_track.update(time_track_params)
        format.js
        format.json { render :show, status: :ok, location: @time_track }
      else
        format.js
        format.json { render json: @time_track.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @time_track = current_user.time_tracks.new(time_track_params)

    respond_to do |format|
      if @time_track.save
        format.js
        format.json { render :show, status: :created, location: @time_track }
      else
        format.js
        format.json { render json: @time_track.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @time_track.destroy
    
    respond_to do |format|
      format.html { redirect_to time_tracks_url, notice: "Time track was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_time_track
    @time_track = TimeTrack.find(params[:id])
  end

  def time_track_params
    params.require(:time_track).permit(:time_started, :time_ended, :description, :time_type, :user_id)
  end
end
