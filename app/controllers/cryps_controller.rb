class CrypsController < ApplicationController
  before_action :set_cryp, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy, :show]

  # GET /cryps
  # GET /cryps.json
  def index
    @cryps = Cryp.all
    #require 'net/http'
    #require 'json'

    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_cryps = JSON.parse(@response)
  end

  # GET /cryps/1
  # GET /cryps/1.json
  def show
  end

  # GET /cryps/new
  def new
    @cryp = Cryp.new
  end

  # GET /cryps/1/edit
  def edit
  end

  # POST /cryps
  # POST /cryps.json
  def create
    @cryp = Cryp.new(cryp_params)

    respond_to do |format|
      if @cryp.save
        format.html { redirect_to @cryp, notice: 'Cryp was successfully created.' }
        format.json { render :show, status: :created, location: @cryp }
      else
        format.html { render :new }
        format.json { render json: @cryp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cryps/1
  # PATCH/PUT /cryps/1.json
  def update
    respond_to do |format|
      if @cryp.update(cryp_params)
        format.html { redirect_to @cryp, notice: 'Cryp was successfully updated.' }
        format.json { render :show, status: :ok, location: @cryp }
      else
        format.html { render :edit }
        format.json { render json: @cryp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cryps/1
  # DELETE /cryps/1.json
  def destroy
    @cryp.destroy
    respond_to do |format|
      format.html { redirect_to cryps_url, notice: 'Cryp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cryp
      @cryp = Cryp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cryp_params
      params.require(:cryp).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end

    def correct_user
      @correct = current_user.cryps.find_by(id: params[:id])
      redirect_to cryps_path, notice: "Not authorized to edit this entry" if @correct.nil?
    end

end
