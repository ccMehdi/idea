class Join < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :idea_id, uniqueness: {scope: :user_id}

  def user_name
    if user
      user.full_name
    else
      "Anonymous"
    end
  end
end
