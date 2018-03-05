class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :encrypted_password, :number, :role_id

  belongs_to :role

  def is_admin?
    return true if self.role.name == "admin"
  end


end
