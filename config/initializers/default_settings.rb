# begin
  Templates::DEFAULTS.each do |key, value|
    eval %Q(Templates.#{key} ||= '#{value}')
  end

  unless Templates.logo.try(:image).present?
    Templates.logo = Templates::LOGO[:title]
    Templates.logo.update(image: File.open("#{Rails.root}/app/assets/images#{Templates::LOGO[:img]}"))
  end

# rescue
# end
