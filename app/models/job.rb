class Job < ApplicationRecord
    validates :jobname, presence: true
    validates :status, presence: true
end