class BikeResult < LegResult

  field :mph, type: Float
  field :my_ave, type: Float

  def calc_ave
    if event && secs
      meters = event.meters
      self.my_ave = meters.nil? ? nil : 12.1
    end
  end
end
