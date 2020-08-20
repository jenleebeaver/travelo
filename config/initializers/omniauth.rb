
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_KEY'],
                        ENV['FACEBOOK_SECRET']

    # provider :google, ENV['GOOGLE_KEY'],
    #                     ENV['GOOGLE_SECRET']
end