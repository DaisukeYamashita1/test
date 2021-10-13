class User < ApplicationRecord
    validates :user_name, {uniqueness:true , presence:true}
    validates :password, {presence: true}
    validates :agreement, {presence: true}

    generate_public_uid

    def to_param
        public_uid
    end

end
