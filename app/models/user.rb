class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :pages

  def self.find_for_line_oauth(auth, signed_in_resource=nil)
    user = User.find_by(uid: auth.uid)

    unless user
      user = User.new(
        # provider: auth.provider,
        uid:      auth.uid,
        # image_url:   auth.info.image,
        password: Devise.friendly_token[0, 20]
      )
      # user.skip_confirmation!
      user.save(validate: false)
    end
    user
  end
end
