module ApplicationHelper
  def label_value(object, attribute)
    label = content_tag(:strong, object.class.human_attribute_name(attribute))
    delimiter = ': '
    value = block_given? ? yield : object.public_send(attribute)

    [label, delimiter, value].join().html_safe
  end
end
