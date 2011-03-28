# encoding: UTF-8
class PriceFormatter
  def self.format(pence)
    if pence >= 0 && pence < 100
      "#{pence}p"
    elsif pence < 0
      "-£%.2f" % (pence / 100.0)
    else
      "£%.2f" % (pence / 100.0)
    end
  end
end