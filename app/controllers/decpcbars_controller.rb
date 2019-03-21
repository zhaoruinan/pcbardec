class DecpcbarsController < ApplicationController
  before_action :set_decpcbar, only: [:show, :edit, :update, :destroy]

  # GET /decpcbars
  # GET /decpcbars.json
  def index
    @decpcbars = Decpcbar.all
  end

  # GET /decpcbars/1
  # GET /decpcbars/1.json
  def show
  end

  # GET /decpcbars/new
  def new
    @decpcbar = Decpcbar.new
  end

  # GET /decpcbars/1/edit
  def edit
  end

  # POST /decpcbars
  # POST /decpcbars.json
  def create
    @decpcbar = Decpcbar.new(decpcbar_params)

    respond_to do |format|
      if @decpcbar.save
        format.html { redirect_to @decpcbar, notice: 'Decpcbar was successfully created.' }
        format.json { render :show, status: :created, location: @decpcbar }
      else
        format.html { render :new }
        format.json { render json: @decpcbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decpcbars/1
  # PATCH/PUT /decpcbars/1.json
  def update
    respond_to do |format|
      if @decpcbar.update(decpcbar_params)
        format.html { redirect_to @decpcbar, notice: 'Decpcbar was successfully updated.' }
        format.json { render :show, status: :ok, location: @decpcbar }
      else
        format.html { render :edit }
        format.json { render json: @decpcbar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decpcbars/1
  # DELETE /decpcbars/1.json
  def destroy
    @decpcbar.destroy
    respond_to do |format|
      format.html { redirect_to decpcbars_url, notice: 'Decpcbar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decpcbar
      @decpcbar = Decpcbar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decpcbar_params
      params.require(:decpcbar).permit(:name, :ip_sart, :ip_num)
    end
end
