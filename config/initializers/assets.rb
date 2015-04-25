# Be sure to restart your server when you modify this file.

# Precompile additional assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js)\z/
    full_path = Rails.application.assets.resolve(path).to_s
    app_assets_path = Rails.root.join('app', 'assets').to_s
    vendor_assets_path = Rails.root.join('vendor', 'assets').to_s
    if ((full_path.starts_with? app_assets_path) || (full_path.starts_with? vendor_assets_path))
      puts "including asset: " + full_path
      true
    else
      puts "excluding asset: " + full_path
      false
    end
  else
    false
  end
end
