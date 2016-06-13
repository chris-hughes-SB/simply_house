class CompaniesController < ApplicationController
  def show
    @company = JSON.parse(get_company_details(params[:id]).body)
    @officers = JSON.parse(get_company_officers(params[:id]).body)["items"]
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

    def get_company_details(id)
      HTTParty.get("https://api.companieshouse.gov.uk/company/#{id}",
        {
          basic_auth: { username: "M0HNR639VBSB9d8RQWXElUV1nEJ3kbRhcaQgDMzJ",
                        password: "" }
        }
      )
    end

    def get_company_officers(id)
      HTTParty.get("https://api.companieshouse.gov.uk/company/#{id}/officers",
        {
          basic_auth: { username: "M0HNR639VBSB9d8RQWXElUV1nEJ3kbRhcaQgDMzJ",
                        password: "" }
        }
      )
    end
end
