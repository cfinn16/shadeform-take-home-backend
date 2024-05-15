class InstancesController < ApplicationController
  def index
    @instances = Instance.includes(:configuration_object).all

    render json: @instances
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
    def instance_params
      params.require(:instance).permit(:id, :cloud, :region, :shade_instance_type, :cloud_instance_type, :cloud_assigned_id, :shade_cloud, :name, :configuration_object_id, :ip, :ssh_user, :ssh_port, :status, :cost_estimate, :created_at, :deleted_at)
    end
end
