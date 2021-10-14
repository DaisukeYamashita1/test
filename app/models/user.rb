class User < ApplicationRecord
    validates :user_name, uniqueness:{ message: 'は既に使われています' } , presence:{ message: 'を入力してください' }
    validates :agreement, presence: true
    validates :password, presence:{ message: 'を入力してください' }, length: {minimum: 8}, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: :invalid_password }    

    generate_public_uid

    def to_param
        public_uid
    end

end
