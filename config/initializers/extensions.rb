Dir.glob("#{Rails.root}/lib/auth_module/*").each { |f| require f }
