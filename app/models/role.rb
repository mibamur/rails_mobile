class Role < ActiveRecord::Base
  has_and_belongs_to_many :logins, :join_table => :logins_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
end
