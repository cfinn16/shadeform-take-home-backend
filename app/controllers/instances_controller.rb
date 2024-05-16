class InstancesController < ApplicationController
  before_action :set_instance, only: %i[ destroy ]
  def index
    @instances = Instance.limit(params[:limit]).offset(params[:offset])

    response = {
      instances: @instances.as_json(include: :configuration_object),
      count: Instance.count
    }

    render json: response
  end

  # GET /instances/1
  def show
    render json: @instance
  end

  # POST /instances
  def create
    @instance = Instance.new(instance_params)
    @instance.ip = Faker::Internet.ip_v4_address

    if @instance.save
        ConfigurationObject.create!(
          memory_in_gb: Faker::Number.between(from: 1, to: 500),
          storage_in_gb: Faker::Number.between(from: 1, to: 500),
          vcpus: Faker::Number.between(from: 1, to: 10),
          num_gpus: Faker::Number.between(from: 1, to: 10),
          gpu_type: "A100",
          interconnect: "pcie",
          vram_per_gpu_in_gb: Faker::Number.between(from: 1, to: 100),
          os: "ubuntu_22_shade_os",
          instance_id: @instance.id
      )
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
