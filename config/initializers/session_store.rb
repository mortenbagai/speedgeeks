# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_morten-demo_session',
  :secret      => '9c798f0f50ee6ef6f3c342e28331f7375e289db92bb06600e47daa07104b272b4fdcef412cc08f81d454560641791b584a6d34d207d5110e14a26305d7f4d6a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
