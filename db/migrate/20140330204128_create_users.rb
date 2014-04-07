class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.string :company_name
      t.string :role
      t.string :avatar
      ### Devise Modules
      ## Database Authenticatable
      t.string :email, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable
      ## Encryptable
      # t.string :password_salt   
      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      # Token authenticatable
      # t.string :authentication_token
      ## Invitable
      # t.string :invitation_token
      t.timestamps
    end
  end
end
