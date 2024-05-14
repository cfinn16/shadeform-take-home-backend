require "test_helper"

class InstancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instance = instances(:one)
  end

  test "should get index" do
    get instances_url, as: :json
    assert_response :success
  end

  test "should create instance" do
    assert_difference("Instance.count") do
      post instances_url, params: { instance: { cloud: @instance.cloud, cloud_assigned_id: @instance.cloud_assigned_id, cloud_instance_type: @instance.cloud_instance_type, configuration_object_id: @instance.configuration_object_id, cost_estimate: @instance.cost_estimate, created_at: @instance.created_at, deleted_at: @instance.deleted_at, id: @instance.id, ip: @instance.ip, name: @instance.name, region: @instance.region, shade_cloud: @instance.shade_cloud, shade_instance_type: @instance.shade_instance_type, ssh_port: @instance.ssh_port, ssh_user: @instance.ssh_user, status: @instance.status } }, as: :json
    end

    assert_response :created
  end

  test "should show instance" do
    get instance_url(@instance), as: :json
    assert_response :success
  end

  test "should update instance" do
    patch instance_url(@instance), params: { instance: { cloud: @instance.cloud, cloud_assigned_id: @instance.cloud_assigned_id, cloud_instance_type: @instance.cloud_instance_type, configuration_object_id: @instance.configuration_object_id, cost_estimate: @instance.cost_estimate, created_at: @instance.created_at, deleted_at: @instance.deleted_at, id: @instance.id, ip: @instance.ip, name: @instance.name, region: @instance.region, shade_cloud: @instance.shade_cloud, shade_instance_type: @instance.shade_instance_type, ssh_port: @instance.ssh_port, ssh_user: @instance.ssh_user, status: @instance.status } }, as: :json
    assert_response :success
  end

  test "should destroy instance" do
    assert_difference("Instance.count", -1) do
      delete instance_url(@instance), as: :json
    end

    assert_response :no_content
  end
end
