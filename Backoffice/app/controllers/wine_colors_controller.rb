class WineColorsController < ApplicationController
  before_action :set_wine_color, only: [:show, :edit, :update, :destroy]

  # GET /wine_colors
  # GET /wine_colors.json
  def index
    @wine_colors = WineColor.all
  end

  # GET /wine_colors/1
  # GET /wine_colors/1.json
  def show
  end

  # GET /wine_colors/new
  def new
    @wine_color = WineColor.new
  end

  # GET /wine_colors/1/edit
  def edit
  end

  # POST /wine_colors
  # POST /wine_colors.json
  def create
    @wine_color = WineColor.new(wine_color_params)

    respond_to do |format|
      if @wine_color.save
        format.html { redirect_to @wine_color, notice: 'Wine color was successfully created.' }
        format.json { render :show, status: :created, location: @wine_color }
      else
        format.html { render :new }
        format.json { render json: @wine_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wine_colors/1
  # PATCH/PUT /wine_colors/1.json
  def update
    respond_to do |format|
      if @wine_color.update(wine_color_params)
        format.html { redirect_to @wine_color, notice: 'Wine color was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine_color }
      else
        format.html { render :edit }
        format.json { render json: @wine_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wine_colors/1
  # DELETE /wine_colors/1.json
  def destroy
    @wine_color.destroy
    respond_to do |format|
      format.html { redirect_to wine_colors_url, notice: 'Wine color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine_color
      @wine_color = WineColor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_color_params
      params.require(:wine_color).permit(:name)
    end
end
