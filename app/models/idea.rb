class Idea < ActiveRecord::Base

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_many :joins, dependent: :destroy
  has_many :joind_users, through: :joins, source: :user

  validates :title, presence:   {message: "must be present"},
                    uniqueness: {scope: :body}

  validates :body, presence: true

  def user_name
    if user
      user.full_name
    else
      "Anonymous"
    end
  end

  def like_for(user)
    likes.find_by_user_id(user.id)
  end

  def join_for(user)
    joins.find_by_user_id(user.id)
  end

end
