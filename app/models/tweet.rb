class Tweet < ApplicationRecord
  belongs_to :user
  validates_length_of :message, :in => 0..140, :on => :create
end
