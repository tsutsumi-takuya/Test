class ShopComment < ApplicationRecord

	#commentは1対NのN側(userに対して複数存在する)
	belongs_to :user
	belongs_to :photo

end
