class Message < ActiveRecord::Base
  validates :from, :to, :body, :status, :presence => true
end
