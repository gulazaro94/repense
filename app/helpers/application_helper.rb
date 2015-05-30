module ApplicationHelper

  def show_errors(resource)
    return if resource.errors.empty?
    content_tag(:div, class: 'alert alert-danger') do
      resource.errors.full_messages.map do |error_message|
        concat(content_tag(:div, error_message))
      end
    end
  end

  def t_attr(model_name, attr_name)
    t("activerecord.attributes.#{model_name}.#{attr_name}")
  end

  def back_button
    link_to t('application.label.back'), root_path, class: 'btn btn-default right'
  end
end
