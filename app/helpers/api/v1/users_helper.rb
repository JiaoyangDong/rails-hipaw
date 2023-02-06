module Api::V1::UsersHelper
    def is_admin
        current_user.try(:admin?)
    end
end
