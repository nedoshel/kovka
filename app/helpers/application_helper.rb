module ApplicationHelper

  def category_link(title, category)
    subdomain = category.kind_of?(Category) ? category.subdomain : category
    link_to title, root_url(subdomain: subdomain)
  end

  def translit(str)
    Russian.translit(str)
  end

  def translit_to_class(str_array)
    translit(str_array.join(" "))
  end

end
