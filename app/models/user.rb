class User < ActiveRecord::Base

  has_secure_password

  has_many :ideas, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_idea, through: :likes, source: :idea

  has_many :joins, dependent: :destroy
  has_many :joind_idea, through: :joins, source: :idea

  validates :email_address, presence: true, uniqueness: true,
                    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def liked_idea?(idea)
    liked_idea.include?(idea)
  end

  def joind_idea?(idea)
    joind_idea.include?(idea)
  end

end
