class User < ActiveRecord::Base
  has_attached_file :photo,
                    :path => ":rails_root/public/assets/users/:uid/images/"

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauht(auth)
  end

  def self.create_user_from_omniauht(auth)
    create(
        provider: auth['provider'],
        uid: auth['uid'],
        name: auth['info']['name']
    )
  end

end
