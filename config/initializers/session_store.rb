# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pedido_online_session',
  :secret      => '54e9e874bd2b83988ad8d04f766096815f3261a0e24f81dbe4119cb904b3075fd552312b3717609b65e89baa0d860dec438bd24aa2bc35699c8880ae93efb162'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
