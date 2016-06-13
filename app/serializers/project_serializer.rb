class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :fund_goal, :end_date
  has_many :funds
  has_many :categories
  has_many :backers
  class FundSerializer < ActiveModel::Serializer
  	attributes :id, :backer_id, :amount
  end

  class User < ActiveModel::Serializer
    attributes :id, :email
  end
end