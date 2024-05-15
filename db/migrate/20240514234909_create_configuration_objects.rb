class CreateConfigurationObjects < ActiveRecord::Migration[7.1]
  def change
    create_table :configuration_objects do |t|
      t.belongs_to :instance, index: true
      t.integer :memory_in_gb
      t.integer :storage_in_gb
      t.integer :vcpus
      t.integer :num_gpus
      t.string :gpu_type
      t.string :interconnect
      t.integer :vram_per_gpu_in_gb
      t.string :os

      t.timestamps
    end
  end
end
