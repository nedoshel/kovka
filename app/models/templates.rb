class Templates < RailsSettings::CachedSettings

  mount_uploader :image, FileUploader

  # Средний текст в футере (footer_text) - string
  # title  - string
  # description - text
  # keywords - string ????
  # H1 (“Кованые заборы”) - string
  # Поле, которое будет вставляться текстом в блок <header> (мета-теги для поисковиков, гео-теги)(header_addit)(text)

  # Поле загрузки логотипа
  # Телефон
  # Поле изменения названия (firm_name) (например Terko)
  # В блоке text-left (под телефоном наверху) (firm_product) - “кованые изделия”
  # Блок загрузки favicon



  DEFAULTS = {
    footer_text: 'Кованые заборы и ограждения из метталла <br>с установкой',
    title: 'Кованые изделия',
    description: 'Кровати из дерева двуспальные по недорогой цене от производителя деревянных кроватей из сосны. Купить в Москве кровать через интернет-магазин Letto с доставкой.',
    keywords: 'кровать, кровать двуспальная недорого, кровати москва, купить двуспальную кровать недорого',
    header_title: 'Кованые заборы',
    header_addit: 'Поле, которое будет вставляться текстом в блок <header> (мета-теги для поисковиков, гео-теги)',
    phone: '+7 (499) 000-00-00',
    firm_product: 'кованые изделия',
    firm_name: 'footer Terko',
    mail_to: 'nedoshel@gmail.com;cci@nm.ru',
    firm_purpose: 'firm_purpose'
  }

  LOGO = { title: 'Кровати в Москве от производителя', img: '/img/logo.png' }
  FAVICON = { title: 'фавикон', img: '/img/favicon.ico' }
  SPAN_LOGO = { title: 'Кровати в Москве с доставкой от фабрики производителя', img: '/img/logo.png' }

  def Templates.logo
    Templates.where(var: 'logo').first
  end

  def Templates.favicon
    Templates.where(var: 'favicon').first
  end

  def Templates.span_logo
    Templates.where(var: 'span_logo').first
  end



end
