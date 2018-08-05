class ScreensController < ApplicationController
  before_action :set_screen, only: [:show, :edit, :update, :destroy, :slideshow]
  before_action :authenticate_user!, except: [:slideshow]

  def index
    @screens = Screen.all
  end

  def show
  end

  def new
    @screen = Screen.new
  end

  def edit
  end

  def create
    @screen = Screen.new(screen_params)
    @screen.user = current_user

    respond_to do |format|
      if @screen.save
        format.html { redirect_to @screen, notice: 'Screen was successfully created.' }
        format.json { render :show, status: :created, location: @screen }
      else
        format.html { render :new }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @screen.name     = screen_params[:name]
    @screen.interval = screen_params[:interval]

    if screen_params[:images]
      images = @screen.images
      images += screen_params[:images]
      @screen.images = images
    end

    respond_to do |format|
      if @screen.save
        format.html { redirect_to @screen, notice: 'Screen was successfully updated.' }
        format.json { render :show, status: :ok, location: @screen }
      else
        format.html { render :edit }
        format.json { render json: @screen.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @screen.destroy
    respond_to do |format|
      format.html { redirect_to screens_url, notice: 'Screen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def slideshow
  end

  private
    def set_screen
      @screen = Screen.find(params[:id])
    end

    def screen_params
      params.require(:screen).permit(:name, :interval, :user_id, images: [])
    end
end
