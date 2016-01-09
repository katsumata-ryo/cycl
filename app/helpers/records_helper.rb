module RecordsHelper
  def self.convert_boolean_to_mark(boolean)
    if self == true
      'fa fa-check-square'
    else
      'fa fa-square'
    end
  end
end
