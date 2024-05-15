require "test_helper"

class ConfigurationObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_object = configuration_objects(:one)
  end

  test "should get index" do
    get configuration_objects_url, as: :json
    assert_response :success
  end

  test "should create configuration_object" do
    assert_difference("ConfigurationObject.count") do
      post configuration_objects_url, params: { configuration_object: { gpu_type: @configuration_object.gpu_type, instance_id: @configuration_object.instance_id, interconnect: @configuration_object.interconnect, memory_in_gb: @configuration_object.memory_in_gb, num_gpus: @configuration_object.num_gpus, os: @configuration_object.os, storage_in_gb: @configuration_object.storage_in_gb, vcpus: @configuration_object.vcpus, vram_per_gpu_in_gb: @configuration_object.vram_per_gpu_in_gb } }, as: :json
    end

    assert_response :created
  end

  test "should show configuration_object" do
    get configuration_object_url(@configuration_object), as: :json
    assert_response :success
  end

  test "should update configuration_object" do
    patch configuration_object_url(@configuration_object), params: { configuration_object: { gpu_type: @configuration_object.gpu_type, instance_id: @configuration_object.instance_id, interconnect: @configuration_object.interconnect, memory_in_gb: @configuration_object.memory_in_gb, num_gpus: @configuration_object.num_gpus, os: @configuration_object.os, storage_in_gb: @configuration_object.storage_in_gb, vcpus: @configuration_object.vcpus, vram_per_gpu_in_gb: @configuration_object.vram_per_gpu_in_gb } }, as: :json
    assert_response :success
  end

  test "should destroy configuration_object" do
    assert_difference("ConfigurationObject.count", -1) do
      delete configuration_object_url(@configuration_object), as: :json
    end

    assert_response :no_content
  end
end
