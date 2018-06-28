module Bootstrap::CardHelper
  def card(options={})
    options = canonicalize_options(options)
    options = ensure_class(options, %w(card))
    content_tag(:div, options) do
      content_tag(:div, class: "card") do
        yield
      end
    end
  end
  
  def card_header(*args, &block)
    bootstrap_generator(*args, "card-header", :h5, &block)
  end

  def card_title(*args, &block)
    bootstrap_generator(*args, "card-title", :h5, &block)
  end
  
  def card_subtitle(*args, &block)
    bootstrap_generator(*args, "card-subtitle mb-2 text-muted", :h6, &block)
  end

  def card_text(*args, &block)
    bootstrap_generator(*args, "card-text", :p, _block)
  end
  
  def card_list(*args, &block)
    bootstrap_generator(*args, "list-group list-group-flush", :ul, &block)
  end  

  def card_list_item(*args, &block)
    bootstrap_generator(*args, "list-group-item", :li, &block)
  end

  def image_card_body(text)
    content_tag(:div, class: "card-body") do
      content_tag(:h5, text, class: "card-title")
    end
  end

  def image_card(options={})
    content_tag(:div, class: options[:class]) do
        content_tag(:div, class: "card ") do
          content_tag(:a, href: options[:url]) do
            image_tag(options[:image], alt: options[:title], class: "card-img-top") + image_card_body(options[:title])
          end
        end
    end
  end

end