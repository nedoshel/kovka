# begin
  Templates::DEFAULTS.each do |key, value|
    eval %Q(Templates.#{key} ||= '#{value}')
  end

  unless Templates.logo.try(:image).present?
    Templates.logo = Templates::LOGO[:title]
    Templates.logo.update(image: File.open("#{Rails.root}/app/assets/images#{Templates::LOGO[:img]}"))
  end

  unless Templates.favicon.try(:image).present?
    Templates.favicon = Templates::FAVICON[:title]
    Templates.favicon.update(image: File.open("#{Rails.root}/app/assets/images#{Templates::FAVICON[:img]}"))
  end

  unless Templates.span_logo.try(:image).present?
    Templates.span_logo = Templates::SPAN_LOGO[:title]
    Templates.span_logo.update(image: File.open("#{Rails.root}/app/assets/images#{Templates::SPAN_LOGO[:img]}"))
  end

# rescue
# end
