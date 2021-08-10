class User < ApplicationRecord
    validates :email, {uniqueness:true , presence:true}
    validates :password, {presence: true}
    validates :agreement, {presence: true}

end
