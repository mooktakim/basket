# encoding: UTF-8
class PriceFormatter
  def self.format(pence)
    if pence < 100
      "#{pence}p"
    else
      "£%.2f" % (pence / 100.0)
    end
  end
end
