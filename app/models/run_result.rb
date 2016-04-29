class RunResult < LegResult

  field :mmile, as: :minute_mile,type: Float
  field :my_ave, type: Float

  def calc_ave
    if event && secs
      meters = event.meters
      self.my_ave = meters.nil? ? nil : 12.1
    end
  end
end
