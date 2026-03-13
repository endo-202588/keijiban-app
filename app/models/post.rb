class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def owned_by?(user)
    user && user.id == user_id
  end

  def save_tags(tag_names)
    self.tags = tag_names.map do |name|
      Tag.find_or_create_by(name: name)
    end
  end
end
