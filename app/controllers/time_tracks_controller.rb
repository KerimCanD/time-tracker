class TimeTracksController < ApplicationController
  before_action :set_time_track, only: %i[ show edit update destroy ]

  def index
    @time_tracks = TimeTrack.all
  end

  def show
  end

  def edit
  end

  def new
    @time_track = TimeTrack.new
    respond_to do |format|
      format.html
    end
  end

  def update
  end

  def create
  end

  private

  def set_time_track
    @time_track = TimeTrack.find(params[:id])
  end

  def time_track_params
    params.require(:time_track).permit(:time_started, :time_ended, :description, :type)
  end
end
