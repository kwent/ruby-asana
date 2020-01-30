### WARNING: This file is auto-generated by the asana-api-meta repo. Do not
### edit it manually.

require_relative '../../resource_includes/response_helper'

module Asana
  module Resources
    class PortfolioMembershipsBase < Resource

      def self.inherited(base)
        Registry.register(base)
      end

      class << self
        # Get a portfolio membership
        #
        # portfolio_membership_path_gid - [str]  (required)
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_portfolio_membership(client, portfolio_membership_path_gid: required("portfolio_membership_path_gid"), options: {})
          path = "/portfolio_memberships/{portfolio_membership_gid}"
          path["{portfolio_membership_path_gid}"] = portfolio_membership_path_gid
          PortfolioMembership.new(parse(client.get(path, options: options)).first, client: client)
        end

        # Get multiple portfolio memberships
        #

        # portfolio - [str]  The portfolio to filter results on.
        # workspace - [str]  The workspace to filter results on.
        # user - [str]  The user to filter results on.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_portfolio_memberships(client, portfolio: nil, workspace: nil, user: nil, options: {})
          path = "/portfolio_memberships"
          params = { portfolio: portfolio, workspace: workspace, user: user }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get(path, params: params, options: options)), type: PortfolioMembership, client: client)
        end

        # Get memberships from a portfolio
        #
        # portfolio_gid - [str]  (required) Globally unique identifier for the portfolio.
        # user - [str]  The user to filter results on.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_portfolio_memberships_for_portfolio(client, portfolio_gid: required("portfolio_gid"), user: nil, options: {})
          path = "/portfolios/{portfolio_gid}/portfolio_memberships"
          path["{portfolio_gid}"] = portfolio_gid
          params = { user: user }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get(path, params: params, options: options)), type: PortfolioMembership, client: client)
        end

      end
    end
  end
end
