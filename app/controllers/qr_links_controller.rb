class QrLinksController < ApplicationController
  before_action :set_qr_link, only: %i[ show edit update destroy resolve ]

  # GET /qr_links or /qr_links.json
  def index
    @qr_links = QrLink.all
  end

  # GET /qr_links/1 or /qr_links/1.json
  def show
  end

  # GET /qr_links/new
  def new
    @qr_link = QrLink.new
  end

  # GET /qr_links/1/edit
  def edit
  end

  # POST /qr_links or /qr_links.json
  def create
    @qr_link = QrLink.new(qr_link_params)

    respond_to do |format|
      if @qr_link.save
        format.html { redirect_to qr_link_url(@qr_link), notice: "Qr link was successfully created." }
        format.json { render :show, status: :created, location: @qr_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @qr_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qr_links/1 or /qr_links/1.json
  def update
    respond_to do |format|
      if @qr_link.update(qr_link_params)
        format.html { redirect_to qr_link_url(@qr_link), notice: "Qr link was successfully updated." }
        format.json { render :show, status: :ok, location: @qr_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @qr_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qr_links/1 or /qr_links/1.json
  def destroy
    @qr_link.destroy!

    respond_to do |format|
      format.html { redirect_to qr_links_url, notice: "Qr link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def resolve
    url = @qr_link.destination_url.starts_with?("http") ? @qr_link.destination_url : "https://#{@qr_link.destination_url}"
    respond_to do |format|
      format.html { redirect_to url, allow_other_host: true, :protocol => 'https://'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qr_link
      @qr_link = QrLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qr_link_params
      params.require(:qr_link).permit(:name, :destination_url, :qrcode)
    end
end
