class CompaniesController < ApplicationController
  def show
    @company =build_company(params[:id])
    @officers = JSON.parse(get_company_officers(params[:id]).body)["items"]
  end

  def search
    @companies = get_companies(params[:q])
  end

  private
    def build_company(id)
      Company.from_hash(JSON.parse(get_company_details(id).body))
    end

    def get_companies(name)
      params = JSON.parse(search_companies_by_name(name).body)["items"]
      params.map { |company_params| Company.from_hash(company_params) }
    end

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
