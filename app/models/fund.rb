class Fund < ActiveRecord::Base
  validates :amount, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validate :enough_in_balance
  belongs_to :project
  belongs_to :backer, class_name: "User"

  def submit
    self.backer.balance -= self.amount
    self.project.user.balance += self.amount
    self.project.user.save
    self.backer.save
  end

  def enough_in_balance
    if self.amount > self.backer.balance
      errors.add(:amount)
    end
  end

end
