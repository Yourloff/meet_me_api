# frozen_string_literal: true

class User
  include Mongoid::Document
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  ## Database authenticatable
  field :email, type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  field :name, type: String, default: ''
  field :last_name, type: String, default: ''
  field :phone, type: String, default: ''
  field :birthday, type: String, default: ''
  field :gender, type: String, default: ''
  field :city, type: String, default: ''

  field :jti, type: String, default: ''
  field :exp, type: DateTime, default: DateTime.now

  ## Trackable
  # field :sign_in_count,      type: Integer, default: 0
  # field :current_sign_in_at, type: Time
  # field :last_sign_in_at,    type: Time
  # field :current_sign_in_ip, type: String
  # field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  index({ email: 1, reset_password_token: 1 }, unique: true)

  def self.primary_key
    '_id'
  end

  def self.revoke_jwt(_payload, user)
    user.update_attribute(:jti, generate_jti)
  end
end
