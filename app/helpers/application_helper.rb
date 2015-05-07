module ApplicationHelper

  def category_link(title, category)
    subdomain = category.kind_of?(Category) ? category.subdomain : category
    link_to title, root_url(subdomain: subdomain)
  end

  def category_href(category)
    subdomain = category.kind_of?(Category) ? category.subdomain : category
    root_url(subdomain: subdomain)
  end

  def translit(str)
    Russian.translit(str).gsub(" ", '_')
  end

  def translit_to_class(str_array)
    Russian.translit(str_array.map{ |t| t.gsub(" ", "_") }.join(" "))
  end

end
