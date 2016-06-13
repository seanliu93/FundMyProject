class FundSerializer < ActiveModel::Serializer
  attributes :id, :amount
  has_one :backer
  has_one :project
end
