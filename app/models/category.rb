class Category < ActiveRecord::Base
  has_many :project_categories
  has_many :projects, through: :project_categories

  def ending_projects
    self.projects.where("end_date >= ?", Date.today).order("end_date asc")
  end
end
