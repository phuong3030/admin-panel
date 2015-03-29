module Admin
  class User < ActiveRecord::Base
    belongs_to :group

    acts_as_messageable

    devise :database_authenticatable, 
      :recoverable, :rememberable, :trackable, :validatable

    validates_presence_of :firstname, :lastname, :email
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Wrong email format'

    def fullname
      firstname + ' ' + lastname
    end

    def mailboxer_email(object)
      case object
      when Mailboxer::Message
        return nil
      when Mailboxer::Notification
        return email
      end
    end
    
  end
end
