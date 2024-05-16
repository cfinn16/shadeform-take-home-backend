class InstancesController < ApplicationController
  before_action :set_instance, only: %i[ destroy ]
  def index
    @instances = Instance.limit(params[:limit]).offset(params[:offset])

    render json: @instances.as_json(include: :configuration_object)
  end

  # GET /instances/1
  def show
    render json: @instance
  end

  # POST /instances
  def create
    @instance = Instance.new(instance_params)

    if @instance.save
      render json: @instance, status: :created, location: @instance
    else
      render json: @instance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /instances/1

  # DELETE /instances/1
  def destroy
    @instance.destroy!
  end

  private
    def set_instance
      @instance = Instance.find(params[:id])
    end

    def instance_params
      params.require(:instance).permit(:id, :cloud, :region, :shade_instance_type, :cloud_instance_type, :cloud_assigned_id, :shade_cloud, :name, :configuration_object_id, :ip, :ssh_user, :ssh_port, :status, :cost_estimate, :created_at, :deleted_at)
    end
end
