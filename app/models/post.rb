class Post < ApplicationRecord
  belongs_to :user
  
  def owned_by?(user)
    user && user.id == user_id
  end
end
