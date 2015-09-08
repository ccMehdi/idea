class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :body, presence: {message: "A comment is required"},
                   uniqueness: {scope: :idea_id}

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
end
