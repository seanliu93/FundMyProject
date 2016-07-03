class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :projects
  class ProjectSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :fund_goal, :end_date
  end
end
