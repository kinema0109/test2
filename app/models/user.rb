class User < ApplicationRecord
    attr_accessor :remember_token
    has_many :microposts
    before_save {self.email=email.downcase}
    validates :name, presence: true, length:{maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length:{maximum: 250},
    format: { with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence: true, length:{minimum: 6,maximum: 12}
    # return hash digest
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    # return random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    # Remembers a user in the database for use in persistent sessions.
    def remember
        self.remember_token= User.new_token
        update_attribute(:remember_digest,User.digest(remember_token))
    end
    # returns true if the given token match the digest
    def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    def forget
        update_attribute(:remember_digest, nil)
    end
end
