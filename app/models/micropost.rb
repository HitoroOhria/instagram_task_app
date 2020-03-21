class Micropost < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
=======
  has_many :comments, dependent: :destroy
  
>>>>>>> origin/for-work
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  
<<<<<<< HEAD
=======
  def Micropost.search(word)
    Micropost.where(['content LIKE ?', "%#{word}%"]) if word
  end
  
>>>>>>> origin/for-work
  private
  
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
