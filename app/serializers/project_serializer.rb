class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :fund_goal, :end_date
  has_many :funds
  has_many :categories
  class FundSerializer < ActiveModel::Serializer
  	attributes :id, :amount, :backer
  end
end