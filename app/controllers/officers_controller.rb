class OfficersController < ApplicationController
  def show
    @officer = JSON.parse(get_officer_details(params[:id]).body)["items"]
  end

  def search
    @officers = JSON.parse(search_officers_by_name(params[:q]).body)["items"]
  end

  private
    def search_officers_by_name(name)
      HTTParty.get('https://api.companieshouse.gov.uk/search/officers',
        { query: { q: name },
          basic_auth: { username: "M0HNR639VBSB9d8RQWXElUV1nEJ3kbRhcaQgDMzJ",
                        password: "" }
        }
      )
    end

    def get_officer_details(id)
      HTTParty.get("https://api.companieshouse.gov.uk/officers/#{id}/appointments",
        {
          basic_auth: { username: "M0HNR639VBSB9d8RQWXElUV1nEJ3kbRhcaQgDMzJ",
                        password: "" }
        }
      )
    end

end
