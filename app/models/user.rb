class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
 # has_many :pictures, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
end
