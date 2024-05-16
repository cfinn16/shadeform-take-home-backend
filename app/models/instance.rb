class Instance < ApplicationRecord
    has_one :configuration_object, dependent: :destroy

    validates :cloud, inclusion: { in: %w(aws azure lambdalabs tensordock runpod latitude jarvislabs oblivus paperspace datacrunch massedcompute vultr)}
    validates :region, presence: true
    validates :shade_instance_type, presence: true
    validates :shade_cloud, presence: true
    validates :name, presence: true
    validates :ip, presence: true
    validates :status, inclusion: { in: %w(pending active deleted)}

end
