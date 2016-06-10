class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :funds, foreign_key: "backer_id"
  has_many :projects

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def backed_projects
    backed_projects = []
    self.funds.each do |p|
      backed_projects << Project.find(p.project_id)
    end
    backed_projects.uniq
  end




end
