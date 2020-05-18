class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    #userは1対Nの1側(複数のNを所持する)
	#class userが削除された際は以下も削除される(dependent: :destroy)
	has_many :photos, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy

end
