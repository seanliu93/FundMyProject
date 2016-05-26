class Fund < ActiveRecord::Base
  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :project
  belongs_to :backer, class_name: "User"

  def submit
    if self.amount > self.backer.balance
      self.destroy
      return false
    else
      self.backer.balance -= self.amount
      self.project.user.balance += self.amount
      self.project.user.save
      self.backer.save
    end
    true
  end
end
