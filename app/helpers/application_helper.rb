module ApplicationHelper

  def lookup_sic_code(code)
    CSV.read(Rails.root + "codes.csv", headers: true, header_converters: :symbol)
      .find(-> { {description: "#{code} doesn't exist"} }) { |hash| hash[:sic_code] == code.to_s }[:description]
  end

end
