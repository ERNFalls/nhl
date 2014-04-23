class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :prefix
      t.string :suffix
      t.string :company_name
      t.string :ssn
      t.string :drivers_license_no
      t.date :date_of_birth
      t.string :address_line_one
      t.string :address_line_two
      t.string :address_line_three
      t.string :city
      t.string :state
      t.integer :zip_code
      t.integer :plus_four_code
      t.string :country
      t.string :aliases
      t.string :spouse
      t.string :marital_status
      t.string :repossessions
      t.string :pending_suit
      t.decimal :amount_owed_to_irs, :precision => 10, :scale => 2
      t.string :safety_deposit_contents
      t.string :safety_deposit_location
      t.string :safety_deposit_list
      t.string :other_losses
      t.boolean :ira, :default => false
      t.boolean :four_o_one_k, :default => false
      t.decimal :retirement, :precision => 10, :scale => 2
      t.decimal :pension, :precision => 10, :scale => 2
      t.decimal :disability, :precision => 10, :scale => 2
      t.decimal :child_support, :precision => 10, :scale => 2
      t.decimal :alimony, :precision => 10, :scale => 2
      t.decimal :other_income, :precision => 10, :scale => 2
      t.string :referred_by
      ### Devise Modules
      ## Database Authenticatable
      t.string :email, :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      ## Rememberable
      t.datetime :remember_created_at
      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
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
      t.string :legacy_pd_email_two
      t.string :legacy_pd_suffix
      t.string :legacy_pd_one
      t.string :legacy_pd_two
      t.string :legacy_pd_three
      t.string :legacy_pd_four
      t.string :legacy_pd_file
    end
    execute("ALTER SEQUENCE clients_id_seq RESTART WITH 15000;")
  end
end
