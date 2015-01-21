Templates::DEFAULTS.each do |key, value|
  eval %Q(Templates.#{key} ||= '#{value}')
end
