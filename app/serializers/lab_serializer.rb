class LabSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :show, :description
end
