class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { in: 2..15 }

  has_one_attached :profile_image


  public
    def get_profile_image
      if profile_image.attached?
        profile_image
      else
        file_path = Rails.root.join('app/javascript/image/no_image.png')
        profile_image.attach(io: File.open(file_path), filename: 'no_image.png', content_type: 'image/png')
      end
    end


end
