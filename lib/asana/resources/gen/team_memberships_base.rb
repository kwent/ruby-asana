### WARNING: This file is auto-generated by the asana-api-meta repo. Do not
### edit it manually.

require_relative '../../resource_includes/response_helper'

module Asana
  module Resources
    class TeamMembershipsBase < Resource

      def self.inherited(base)
        Registry.register(base)
      end

      class << self
        # Get a team membership
        #
        # team_membership_path_gid - [str]  (required)
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_team_membership(client, team_membership_path_gid: required("team_membership_path_gid"), options: {})
          path = "/team_memberships/{team_membership_gid}"
          path["{team_membership_path_gid}"] = team_membership_path_gid
          parse(client.get(path, options: options)).first
        end

        # Get team memberships
        #

        # team - [str]  Globally unique identifier for the team.
        # user - [str]  Globally unique identifier for the user. This parameter must be used with the workspace parameter.
        # workspace - [str]  Globally unique identifier for the workspace. This parameter must be used with the user parameter.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_team_memberships(client, team: nil, user: nil, workspace: nil, options: {})
          path = "/team_memberships"
          params = { team: team, user: user, workspace: workspace }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get(path, params: params, options: options)), type: Resource, client: client)
        end

        # Get memberships from a team
        #
        # team_gid - [str]  (required) Globally unique identifier for the team.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_team_memberships_for_team(client, team_gid: required("team_gid"), options: {})
          path = "/teams/{team_gid}/team_memberships"
          path["{team_gid}"] = team_gid
          Collection.new(parse(client.get(path, options: options)), type: Resource, client: client)
        end

        # Get memberships from a user
        #
        # user_gid - [str]  (required) Globally unique identifier for the user.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_team_memberships_for_user(client, user_gid: required("user_gid"), options: {})
          path = "/users/{user_gid}/team_memberships"
          path["{user_gid}"] = user_gid
          Collection.new(parse(client.get(path, options: options)), type: Resource, client: client)
        end

      end
    end
  end
end