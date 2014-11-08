# Configure devise authencation method for CMS
Dir.glob("#{Rails.root}/lib/auth_module/*").each { |f| require f }
# Override active admin view, config friendly_id for active admin
Dir.glob("#{Rails.root}/lib/active_admin_override/*").each { |f| require f }
