class Templates < RailsSettings::CachedSettings

  # Средний текст в футере (footer_text) - string
  # title  - string
  # description - text
  # keywords - string ????
  # H1 (“Кованые заборы”) - string
  # Поле, которое будет вставляться текстом в блок <header> (мета-теги для поисковиков, гео-теги)(header_addit)(text)

  DEFAULTS ={
    footer_text: 'Кованые заборы и ограждения из метталла <br>с установкой',
    title: 'Кованые изделия',
    description: 'Кровати из дерева двуспальные по недорогой цене от производителя деревянных кроватей из сосны. Купить в Москве кровать через интернет-магазин Letto с доставкой.',
    keywords: 'кровать, кровать двуспальная недорого, кровати москва, купить двуспальную кровать недорого',
    header_title: 'Кованые заборы',
    header_addit: 'Поле, которое будет вставляться текстом в блок <header> (мета-теги для поисковиков, гео-теги)'
  }



end
