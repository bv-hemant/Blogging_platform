#emails:string
#password_digest:string
#
#password:string virtual
#password_confirmation:string virtual

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #has_secure_password

  has_many :blogs
  validates :email, presence: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" },
    uniqueness: true
end
