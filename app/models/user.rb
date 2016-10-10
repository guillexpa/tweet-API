class User < ApplicationRecord
  has_many :tweets
  # validates :email, :presence => true, :uniqueness => true
  # validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  # validates :password, :confirmation => true
  # validates_length_of :password, :in => 6..20, :on => :create
end
