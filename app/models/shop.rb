class Shop < ApplicationRecord

	belongs_to :user

	#photoは1対Nの1側(複数のNを所持する)
	#class photoが削除された際は以下も削除される(dependent: :destroy)
	has_many :comment, dependent: :destroy
	has_many :likes, dependent: :destroy

end
