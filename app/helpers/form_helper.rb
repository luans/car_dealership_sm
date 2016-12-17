module FormHelper
  def vue_form_for(object, *args, &block)
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(builder: VueFormBuilder)), &block)
  end
end
