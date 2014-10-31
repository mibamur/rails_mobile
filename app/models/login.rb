class Login < ActiveRecord::Base

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :assign_default_role

  has_one :schet

  def assign_default_role
    add_role :reg if self.roles.blank?
  end
  def name
    self.email
  end

end
