module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :email, :token_type, :user_id, :access_token, :full_name,:age, :height, :weight, :gender, :experience_level, :wish_list,:photo_url

    def user_id
      object.id
    end

    def token_type
      'Bearer'
    end

  end
end
