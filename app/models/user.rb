# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :text             not null
#  name            :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, length: {maximum: 255},
                    uniqueness: true,
                    format: {with: /\A[\w.!#$%&'*+\/=?^`{|}~\-]+@[\w-]+\.[\w]+\z/i}
  before_validation {email.downcase!}

  has_secure_password
  validates :password, length: {minimum: 6}
  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog
end
