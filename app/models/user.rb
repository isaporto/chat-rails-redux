class User < ApplicationRecord
  has_many :messages

  validates :username, presence: true, length: { in: 3..20 }, format: { with: /\A[\w-]+\z/, message: "only allows letters, numbers, dashes or/and underlines"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
