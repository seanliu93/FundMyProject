class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :encrypted_password, :balance, :admin?
  has_many :projects
  has_many :funds

  class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :title, :fund_goal, :end_date
  end

  class FundSerializer < ActiveModel::Serializer
    attributes :id, :project_id, :amount
  end
end
