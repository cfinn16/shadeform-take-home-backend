class ConfigurationObjectsController < ApplicationController
  before_action :set_configuration_object, only: %i[ show update destroy ]

  # GET /configuration_objects
  def index
    @configuration_objects = ConfigurationObject.all

    render json: @configuration_objects
  end

  # GET /configuration_objects/1
  def show
    render json: @configuration_object
  end

  # POST /configuration_objects
  def create
    @configuration_object = ConfigurationObject.new(configuration_object_params)

    if @configuration_object.save
      render json: @configuration_object, status: :created, location: @configuration_object
    else
      render json: @configuration_object.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /configuration_objects/1
  def update
    if @configuration_object.update(configuration_object_params)
      render json: @configuration_object
    else
      render json: @configuration_object.errors, status: :unprocessable_entity
    end
  end

  # DELETE /configuration_objects/1
  def destroy
    @configuration_object.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_object
      @configuration_object = ConfigurationObject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuration_object_params
      params.require(:configuration_object).permit(:memory_in_gb, :storage_in_gb, :vcpus, :num_gpus, :gpu_type, :interconnect, :vram_per_gpu_in_gb, :os, :instance_id)
    end
end
