require './lib/show'

class Network
  attr_reader :name,
              :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def highest_paid_actor
    all_actors_of_network.max_by{|actor| actor.salary}.actor
  end

  def all_actors_of_network
    all_actors = []
    @shows.each do |show|
      all_actors << show.characters
    end
    all_actors.flatten
  end
end
