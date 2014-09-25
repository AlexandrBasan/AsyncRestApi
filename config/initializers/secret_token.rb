# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
AsyncApi::Application.config.secret_key_base = '7d0842178ca21a821d5e6e23892d903e9bad0b38a078a8ebb8347ae0f473ff09549470bc47ff03af7fb9a2199ff3180c1b2bc9ce97a16dbafba5017b090ba6ac'
