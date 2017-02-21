class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :pet, :pets]
  before_action :authenticate_pet!, only: [:edit, :update]
  before_action :verify_pet, only: [:edit, :update]

  # GET /pages/1
  # GET /pages/1.json
  def show
    @noises = Noise.where(page: @page)
  end

  # GET /pages/1/edit
  def edit; end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def pet
    puts params.to_json
    number_of_pets = (params[:quantity] ? params[:quantity] : 1)
    petter_id = (current_pet ? current_pet.id : false)
    set_received_pettings_counter
    number_of_pets.times do |i|
      puts "Petting!"
      PettingsInserterWorker.perform_async(DateTime.now.utc, @page.pet_id, petter_id)
      @received_pettings_counter.increment
    end
    respond_to do |format|
      format.json { render json: { count: @received_pettings_counter.value } }
    end
  end

  def pets
    # pettings = []
    # @page.pet.received_pettings.sort_by(&:petted_at).reverse.first(6).each do |petting|
    #   pettings.push({
    #     id: petting.id,
    #     petter: petting.petter ? { name: petting.petter.name, url: petting.petter.page.url } : false,
    #     petted_at: petting.petted_at,
    #   })
    # end
    set_received_pettings_counter
    respond_to do |format|
      format.json { render json: { count: @received_pettings_counter.value } }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_page
    params[:url].downcase!
    @page = Page.find_by! url: params[:url]
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:pet_id, :url, :name, :background, :text_color, noises_attributes: [:id, :page_id, :sound, :_destroy])
  end

  def petting_params
    params.require(:petting).permit(:petter_id, :petted_id, :petted_at)
  end

  def verify_pet
    if @page.pet != current_pet
      redirect_to edit_page_url(url: current_pet.page.url)
    end
  end

  def set_received_pettings_counter
    id = @page.pet.id
    @received_pettings_counter = Redis::Counter.new("pettings:received:#{id}")
    if @received_pettings_counter.value == 0
      @received_pettings_counter = Redis::Counter.new("pettings:received:#{id}", start: Pet.find(id).received_pettings.size)
    end
  end
end
