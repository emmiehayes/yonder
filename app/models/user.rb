class User < ApplicationRecord
 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.token = auth.credentials.token 
      user.refresh_token = auth.credentials.refresh_token
      user.oauth_expires_at = auth.credentials.expires_at
      user.save!
    end
  end
end

 