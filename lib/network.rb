require './lib/show'
require 'pry'

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

  def payroll
    all_actors_of_network.inject({}) do |a,b|
       a[b.actor] = b.salary
       a
     end
  end

  def all_actors_of_network
    all_actors = []
    @shows.each do |show|
      all_actors << show.characters
    end
    all_actors.flatten
  end
end
