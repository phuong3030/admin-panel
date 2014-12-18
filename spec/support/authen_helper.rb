module AuthenHelper
  def stub_authenticate!
    API::V1::User.helpers do
      def current_user
        FactoryGirl.create(:user_admin_role)
      end

      def authenticated_user
        true
      end
    end

  end
end
