class Company
  attr_accessor :title, :company_number, :registered_office_address

  def title
    @title.titleize
  end

  def has_registered_office_address?
    registered_office_address != nil
  end

  def self.from_hash(param)
    company = new
    company.title = param["title"] || param["company_name"]
    company.company_number = param["company_number"]
    company.registered_office_address = Address.from_hash(param["registered_office_address"])
    company
  end
end
