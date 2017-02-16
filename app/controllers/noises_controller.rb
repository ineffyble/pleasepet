class NoisesController < ApplicationController
  before_action :set_noise, only: [:show, :edit, :update, :destroy]

  # GET /noises
  # GET /noises.json
  def index
    @noises = Noise.all
  end

  # GET /noises/1
  # GET /noises/1.json
  def show
  end

  # GET /noises/new
  def new
    @noise = Noise.new
  end

  # GET /noises/1/edit
  def edit
  end

  # POST /noises
  # POST /noises.json
  def create
    @noise = Noise.new(noise_params)

    respond_to do |format|
      if @noise.save
        format.html { redirect_to @noise, notice: 'Noise was successfully created.' }
        format.json { render :show, status: :created, location: @noise }
      else
        format.html { render :new }
        format.json { render json: @noise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noises/1
  # PATCH/PUT /noises/1.json
  def update
    respond_to do |format|
      if @noise.update(noise_params)
        format.html { redirect_to @noise, notice: 'Noise was successfully updated.' }
        format.json { render :show, status: :ok, location: @noise }
      else
        format.html { render :edit }
        format.json { render json: @noise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noises/1
  # DELETE /noises/1.json
  def destroy
    @noise.destroy
    respond_to do |format|
      format.html { redirect_to noises_url, notice: 'Noise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noise
      @noise = Noise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noise_params
      params.require(:noise).permit(:sound)
    end
end
