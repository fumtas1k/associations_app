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
class User < ApplicationRecord
  has_many :blogs
end
