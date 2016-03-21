module ApplicationHelper
  def convert_boolean(boolean)
    if boolean == true
      'fa fa-check-square'
    else
      'fa fa-square'
    end
  end
end
