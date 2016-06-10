class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :end_date, presence: true
  validates :fund_goal, presence: true
  belongs_to :user
  has_many :funds
  has_many :backers, -> { distinct }, through: :funds
  validate :end_date_cannot_be_in_the_past

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date)
    end
  end 

  def self.ending_projects
    @ending_projects = Project.where("end_date >= ?", Date.today).order("end_date asc")
  end

  def funded
    sum = 0
    self.funds.each do |f|
      if f.amount
        sum += f.amount
      end
    end
    sum
  end

  def funded_percent
    (self.funded.to_f / self.fund_goal.to_f * 100).round
  end

  def user_email
    User.find(self.user_id).email
  end


end
