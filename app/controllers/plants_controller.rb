class PlantsController < ApplicationController
    # GET /plants
    def index
      @plants = Plant.all
      render json: @plants
    end
  
    # GET /plants/1
    def show
      @plant = Plant.find(params[:id])
      render json: @plant
    end
  
    # POST /plants
    def create
      @plant = Plant.new(plant_params)
  
      if @plant.save
        render json: @plant, status: :created, location: @plant
      else
        render json: @plant.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    # Only allow a trusted parameter "white list" through.
    def plant_params
      params.require(:plant).permit(:name, :image, :price)
    end
  end
  