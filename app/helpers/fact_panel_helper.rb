module FactPanelHelper
  def fact_panel(options = {})
    content_tag(:div, class: "row facts") do
      options.collect {|key, value| concat(fact_col(key, value))}
    end
  end

  def fact_col(key, value)
    content_tag(:div, class: "col-12 col-sm text-center") do
      content_tag(:p, key, class: "header") + content_tag(:p, value)
    end
  end

end