class MobileOparatorsController < ApplicationController
  before_action :set_mobile_oparator, only: [:show, :update, :destroy]

  # GET /mobile_oparators
  def index
    @mobile_oparators = MobileOparator.all
    render json: @mobile_oparators, status: :ok   
  end

  # GET /mobile_oparators/1
  def show
    render json: @mobile_oparator
  end

  # POST /mobile_oparators
  def create
    @mobile_oparator = MobileOparator.new(mobile_oparator_params)

    if @mobile_oparator.save
      render json: @mobile_oparator, status: :created
    else
      render json: @mobile_oparator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mobile_oparators/1
  def update
    if @mobile_oparator.update(mobile_oparator_params)
      render json: @mobile_oparator
    else
      render json: @mobile_oparator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mobile_oparators/1
  def destroy
    @mobile_oparator.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mobile_oparator
      @mobile_oparator = MobileOparator.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mobile_oparator_params
      params.require(:mobile_oparator).permit(:name)
    end
end
