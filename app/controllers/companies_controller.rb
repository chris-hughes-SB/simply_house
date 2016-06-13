class CompaniesController < ApplicationController
  def show
  end

  def search
    @companies = JSON.parse(search_companies_by_name(params[:q]).body)["items"]
  end

  private
    def search_companies_by_name(name)
      HTTParty.get('https://api.companieshouse.gov.uk/search/companies',
        { query: { q: name },
          basic_auth: { username: "M0HNR639VBSB9d8RQWXElUV1nEJ3kbRhcaQgDMzJ",
                        password: "" }
        }
      )
    end
end
