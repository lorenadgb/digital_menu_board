module ApplicationHelper

  def date_string_for(datetime)
    datetime.strftime('%m/%d/%Y %H:%M:%S')
  end

  def link_to_image(image_path, target_link, options={})
    link_to(image_tag(image_path, height: '90', width: '130'), target_link, options)
  end
end
