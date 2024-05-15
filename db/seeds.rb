100.times do |index|
    instance = Instance.create!(
        cloud: %w(aws azure lambdalabs tensordock runpod latitude jarvislabs oblivus paperspace datacrunch massedcompute vultr).sample,
        region: "canada-1",
        shade_instance_type: "A6000",
        cloud_instance_type: "gpu_1x_a6000",
        cloud_assigned_id: Faker::Internet.uuid,
        shade_cloud: true,
        name: Faker::App.name,
        ip: Faker::Internet.ip_v4_address,
        ssh_user: "shadeform",
        ssh_port: 22,
        cost_estimate: Faker::Number.decimal(l_digits: 3, r_digits: 1).to_s
    )
    ConfigurationObject.create!(
        memory_in_gb: Faker::Number.between(from: 1, to: 500),
        storage_in_gb: Faker::Number.between(from: 1, to: 500),
        vcpus: Faker::Number.between(from: 1, to: 10),
        num_gpus: Faker::Number.between(from: 1, to: 10),
        gpu_type: "A100",
        interconnect: "pcie",
        vram_per_gpu_in_gb: Faker::Number.between(from: 1, to: 100),
        os: "ubuntu_22_shade_os",
        instance_id: instance.id
    )
end
