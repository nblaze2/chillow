require_relative 'box'
require 'pry'
class Truck
  attr_reader :boxes, :manifest

  def initialize
    @boxes = 0
    @manifest = []
  end

  def full?
    @boxes >= 40
  end

  def add_box(box_owner)
    if !full?
      @boxes += 1
      @manifest << Box.new(box_owner)
      true
    else
      false
    end
  end

  def remove_box #(box_owner)
    if @boxes != 0 # && @manifest.include?(box.box_owner)
      @boxes -= 1
      @manifest.pop
      # @manifest.delete_at(@manifest.index(box_owner))
      true
    else
      false
    end
  end

  def unload_all(box_owner)
    if @boxes != 0 # && @manifest.include?(box.box_owner)
      @manifest.delete_if { |box| box.owner == box_owner }
      @boxes = @manifest.size
      true
    else
      false
    end
  end
end
