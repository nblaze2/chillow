class Appartment
  attr_reader :address, :city_or_town, :zip_code, :rent, :lease_start_date, :lease_end_date, :roomates

  def initialize(address, city_or_town, zip_code, rent, lease_start_date, lease_end_date)
    @address = address
    @city_or_town = city_or_town
    @zip_code = zip_code
    @rent = rent
    @lease_start_date = lease_start_date
    @lease_end_date = lease_end_date
    @roomates = 0
  end

  def full?
    @roomates >= 4
  end

  def add_roomate
    if !full?
      @roomates += 1
      true
    else
      false
    end
  end

  def remove_roomate
    if @roomates != 0
      @roomates -= 1
      true
    else
      false
    end
  end
end
