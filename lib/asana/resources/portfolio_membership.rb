require_relative 'gen/portfolio_memberships_base'

module Asana
  module Resources
    # This object determines if a user is a member of a portfolio.
    class PortfolioMembership < PortfolioMembershipsBase


      attr_reader :id

      attr_reader :gid

      attr_reader :resource_type

      attr_reader :user

      attr_reader :portfolio

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'portfolio_memberships'
        end

        # Returns the compact portfolio membership records for the portfolio. You must
        # specify `portfolio`, `portfolio` and `user`, or `workspace` and `user`.
        #
        # portfolio - [Gid] The portfolio for which to fetch memberships.
        # workspace - [Gid] The workspace for which to fetch memberships.
        # user - [String] The user to filter the memberships to.
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_all(client, portfolio: nil, workspace: nil, user: nil, per_page: 20, options: {})
          params = { portfolio: portfolio, workspace: workspace, user: user, limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/portfolio_memberships", params: params, options: options)), type: Resource, client: client)
        end

        # Returns the compact portfolio membership records for the portfolio.
        #
        # portfolio - [Gid] The portfolio for which to fetch memberships.
        # user - [String] If present, the user to filter the memberships to.
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_portfolio(client, portfolio: required("portfolio"), user: nil, per_page: 20, options: {})
          params = { user: user, limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/portfolios/#{portfolio}/portfolio_memberships", params: params, options: options)), type: Resource, client: client)
        end

        # Returns the portfolio membership record.
        #
        # id - [Gid] Globally unique identifier for the portfolio membership.
        #
        # options - [Hash] the request I/O options.
        def find_by_id(client, id, options: {})

          self.new(parse(client.get("/portfolio_memberships/#{id}", options: options)).first, client: client)
        end
      end

    end
  end
end
