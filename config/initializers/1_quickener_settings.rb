class QuickenerSettings < Settingslogic

  # Load the source file for settings
  source "#{Rails.root}/config/quickener.yml"
  namespace Rails.env

  def self.build_url
    custom_port = ":#{port}" unless [443, 80].include?(port.to_i)
    [protocol, '://', host, custom_port, relative_url].join('')
  end
end

QuickenerSettings['host'] ||= 'localhost'
QuickenerSettings['relative_url'] ||= '/'
QuickenerSettings['url'] ||= QuickenerSettings.build_url