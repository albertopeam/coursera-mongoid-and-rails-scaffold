class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps

  store_in collection:"results"

  field :bib, type: Integer
  field :secs, type: Float
  field :o, as: :overall, type: Placing
  field :gender, type: Placing
  field :group, type: Placing

  embeds_many :results, class_name: 'LegResult',
                        order: [:"event.o".asc],
                        after_add: :update_total,
                        after_remove: :update_total

  embeds_one :race, class_name: 'RaceRef'

  def update_total(result)
    sum = 0
    results.each do |res|
      sum += res.secs
    end
    self.secs = sum
  end

  def the_race
    return race.race if race
    nil
  end
end
