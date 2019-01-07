class JobsSerializer < ActiveModel::Serializer
  attributes :id, :jobName, :status
end