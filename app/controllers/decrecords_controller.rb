class DecrecordsController < ApplicationController
  before_action :set_decrecord, only: [:show, :edit, :update, :destroy]

  # GET /decrecords
  # GET /decrecords.json
  def index
    @decrecords = Decrecord.page(params[:page]).per(24)
  end

  # GET /decrecords/1
  # GET /decrecords/1.json
  def show
  end

  # GET /decrecords/new
  def new
    @decrecord = Decrecord.new
  end

  # GET /decrecords/1/edit
  def edit
  end

  # POST /decrecords
  # POST /decrecords.json
  def create
    @decrecord = Decrecord.new(decrecord_params)

    respond_to do |format|
      if @decrecord.save
        format.html { redirect_to @decrecord, notice: 'Decrecord was successfully created.' }
        format.json { render :show, status: :created, location: @decrecord }
      else
        format.html { render :new }
        format.json { render json: @decrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decrecords/1
  # PATCH/PUT /decrecords/1.json
  def update
    respond_to do |format|
      if @decrecord.update(decrecord_params)
        format.html { redirect_to @decrecord, notice: 'Decrecord was successfully updated.' }
        format.json { render :show, status: :ok, location: @decrecord }
      else
        format.html { render :edit }
        format.json { render json: @decrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decrecords/1
  # DELETE /decrecords/1.json
  def destroy
    @decrecord.destroy
    respond_to do |format|
      format.html { redirect_to decrecords_url, notice: 'Decrecord was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decrecord
      @decrecord = Decrecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decrecord_params
      params.require(:decrecord).permit(:time, :pc_num)
    end
end
