class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  delegate :content_tag, :tag, to: :@template

  def text_field(name, *args)
    options    = args.extract_options!
    has_error  = !object.errors[name].empty?
    classes    = "control-group"
    error_html = ""

    if has_error
      classes += " error"
      error_html = object.errors[name].collect do |error|
        content_tag(:span, class: "help-block") do
          "#{name.to_s.titleize} #{error}"
        end
      end.join("").html_safe
    end

    if options[:append]
      content_tag(:div, class: classes) do
        label(name, options[:label], class: "control-label") +
        content_tag(:div, class: "input-append") do
          super(name, options) +
          content_tag(:span, class: "add-on") do
            options[:append]
          end
        end.html_safe +
        error_html
      end
    else
      content_tag(:div, class: classes) do
        label(name, options[:label], class: "control-label") +
        super(name, options) +
        error_html
      end
    end
  end

  def text_area(name, *args)
    options    = args.extract_options!
    has_error  = !object.errors[name].empty?
    classes    = "control-group"
    error_html = ""

    if has_error
      classes += " error"
      error_html = object.errors[name].collect do |error|
        content_tag(:span, class: "help-block") do
          "#{name.to_s.titleize} #{error}"
        end
      end.join("").html_safe
    end

    content_tag(:div, class: classes) do
      label(name, options[:label], class: "control-label") +
      super(name, options) +
      error_html
    end
  end

  def select(name, *args)
    has_error  = !object.errors[name].empty?
    classes    = "control-group"
    error_html = ""

    if has_error
      classes += " error"
      error_html = object.errors[name].collect do |error|
        content_tag(:span, class: "help-block") do
          "#{name.to_s.titleize} #{error}"
        end
      end.join("").html_safe
    end

    content_tag(:div, class: classes) do
      label(name, class: "control-label") +
      super(name, *args) +
      error_html
    end
  end

  def country_select(name, *args)
    has_error  = !object.errors[name].empty?
    classes    = "control-group"
    error_html = ""

    if has_error
      classes += " error"
      error_html = object.errors[name].collect do |error|
        content_tag(:span, class: "help-block") do
          "#{name.to_s.titleize} #{error}"
        end
      end.join("").html_safe
    end

    content_tag(:div, class: classes) do
      label(name, class: "control-label") +
      super(name, *args) +
      error_html
    end
  end

private

  def objectify_options(options)
    super.except(:append, :label)
  end
end
