class Templates < RailsSettings::CachedSettings

  mount_uploader :image, ImageUploader

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
    header_addit: 'Поле, которое будет вставляться текстом в блок <header> (мета-теги для поисковиков, гео-теги)'
  }

  LOGO = { title: 'Кровати в Москве от производителя', img: '/img/logo.png' }

  def Templates.logo
    Templates.where(var: 'logo').first
  end



end
