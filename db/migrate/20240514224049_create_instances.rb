class CreateInstances < ActiveRecord::Migration[7.1]
  def change
    create_table :instances do |t|
      t.primary_key :id
      t.string :cloud
      t.string :region
      t.string :shade_instance_type
      t.string :cloud_instance_type
      t.string :cloud_assigned_id
      t.boolean :shade_cloud
      t.string :name
      t.integer :configuration_object_id
      t.string :ip, default: Faker::Internet.ip_v4_address
      t.string :ssh_user
      t.integer :ssh_port
      t.string :status, default: "active"
      t.string :cost_estimate
      t.timestamp :created_at
      t.timestamp :deleted_at, default: nil

      t.timestamps
    end
  end
end
