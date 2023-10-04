class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Add the following lines manually
  before_create :generate_confirmation_token

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  protected

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
