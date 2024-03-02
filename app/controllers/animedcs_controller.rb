class AnimedcsController < ApplicationController
  before_action :set_animedc, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  # GET /animedcs or /animedcs.json
  def index
    @animedcs = Animedc.all
  end

  # GET /animedcs/1 or /animedcs/1.json
  def show
  end

  # GET /animedcs/new
  def new
    #@animedc = Animedc.new
    @animedc = current_user.animedc.build
  end

  # GET /animedcs/1/edit
  def edit
  end

  # POST /animedcs or /animedcs.json
  def create
    #@animedc = Animedc.new(animedc_params)
    @animedc = current_user.animedc.build(animedc_params)

    respond_to do |format|
      if @animedc.save
        format.html { redirect_to animedc_url(@animedc), notice: "Anime was successfully created." }
        format.json { render :show, status: :created, location: @animedc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animedc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animedcs/1 or /animedcs/1.json
  def update
    respond_to do |format|
      if @animedc.update(animedc_params)
        format.html { redirect_to animedc_url(@animedc), notice: "Anime was successfully updated." }
        format.json { render :show, status: :ok, location: @animedc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animedc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animedcs/1 or /animedcs/1.json
  def destroy
    @animedc.destroy!

    respond_to do |format|
      format.html { redirect_to animedcs_url, notice: "Anime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @animedc = current_user.animedc.find_by(id: params[:id])
    redirect_to animedc_path, notice: "Not Authroized to Edit" if @animedc.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animedc
      @animedc = Animedc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animedc_params
      params.require(:animedc).permit(:anime_name, :authour, :watched, :rating, :user_id)
    end
end
