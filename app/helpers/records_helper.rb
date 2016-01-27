# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  payment     :integer
#  date        :date
#  card        :boolean
#  memo        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

module RecordsHelper
  def self.convert_card_to_mark(card_boolean)
    if card_boolean == true
      'fa fa-check-square'
    else
      'fa fa-square'
    end
  end
end
