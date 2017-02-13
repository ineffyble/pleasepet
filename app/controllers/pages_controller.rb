class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :pet]
  before_action :authenticate_pet!, only: [:edit, :update]

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/1/edit
  def edit
    if @page.pet != current_pet
      redirect_to edit_page_url(url: current_pet.page.url)
    end
  end

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
    params[:petting] = {}
    if current_pet
      params[:petting][:petter_id] = current_pet.id
    end
    params[:petting][:petted_id] = @page.pet_id
    params[:petting][:petted_at] = DateTime.now
    @petting = Petting.new(petting_params)
    @petting.save!
    redirect_to @page
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find_by! url: params[:url]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:pet_id, :url, :name)
    end

    def petting_params
      params.require(:petting).permit(:petter_id, :petted_id, :petted_at)
    end
end
