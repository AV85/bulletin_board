class User < ApplicationRecord
  extend Enumerize
  enumerize :role, in: { user: 0, moderator: 1, admin: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ads
  has_many :comments
  has_one_attached :avatar, dependent: :destroy

  def user?
    role == 0
  end

  def moderator?
    role == 1
  end

  def admin?
    role == 2
  end

end
