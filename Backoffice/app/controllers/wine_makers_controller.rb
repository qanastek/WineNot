class WineMakersController < ApplicationController
  before_action :set_wine_maker, only: [:show, :edit, :update, :destroy]

  # GET /wine_makers
  # GET /wine_makers.json
  def index
    @wine_makers = WineMaker.all
  end

  # GET /wine_makers/1
  # GET /wine_makers/1.json
  def show
  end

  # GET /wine_makers/new
  def new
    @wine_maker = WineMaker.new
  end

  # GET /wine_makers/1/edit
  def edit
  end

  # POST /wine_makers
  # POST /wine_makers.json
  def create
    @wine_maker = WineMaker.new(wine_maker_params)

    respond_to do |format|
      if @wine_maker.save
        format.html { redirect_to @wine_maker, notice: 'Wine maker was successfully created.' }
        format.json { render :show, status: :created, location: @wine_maker }
      else
        format.html { render :new }
        format.json { render json: @wine_maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wine_makers/1
  # PATCH/PUT /wine_makers/1.json
  def update
    respond_to do |format|
      if @wine_maker.update(wine_maker_params)
        format.html { redirect_to @wine_maker, notice: 'Wine maker was successfully updated.' }
        format.json { render :show, status: :ok, location: @wine_maker }
      else
        format.html { render :edit }
        format.json { render json: @wine_maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wine_makers/1
  # DELETE /wine_makers/1.json
  def destroy
    @wine_maker.destroy
    respond_to do |format|
      format.html { redirect_to wine_makers_url, notice: 'Wine maker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine_maker
      @wine_maker = WineMaker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_maker_params
      params.require(:wine_maker).permit(:name)
    end
end
