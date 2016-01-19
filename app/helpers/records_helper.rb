module RecordsHelper
  def self.convert_card_to_mark(card_boolean)
    if card_boolean == true
      'fa fa-check-square'
    else
      'fa fa-square'
    end
  end
end
