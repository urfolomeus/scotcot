# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_scotcot_session',
  :secret      => '45360cbd68d5b1429c2df4e6a0d6c2ac6508b25d92bd98986bff783f36f1133fd8045752f8fd9ad950ea872c3cba49ebbde9f9d7d31de89cc9de0e5c8068a076'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
