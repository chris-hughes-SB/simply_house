class Address
  attr_accessor :line_1, :line_2, :city, :postcode

  def to_partial_path
    "companies/address"
  end

  def self.from_hash(param)
    return MissingAddress.new unless param["address_line_1"]

    address = new
    address.line_1 = param["address_line_1"]
    address.line_2 = param["address_line_2"]
    address.city = param["locality"]
    address.postcode = param["postal_code"]
    address
  end
end
