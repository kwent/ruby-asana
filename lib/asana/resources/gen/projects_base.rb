### WARNING: This file is auto-generated by the asana-api-meta repo. Do not
### edit it manually.

require_relative '../../resource_includes/response_helper'

module Asana
  module Resources
    class ProjectsBase < Resource

      def self.inherited(base)
        Registry.register(base)
      end

      class << self
        # Add a custom field to a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def add_custom_field_setting_for_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}/addCustomFieldSetting"
          path["{project_gid}"] = project_gid
          parse(client.post(path, body: data, options: options)).first
        end

        # Add users to a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def add_followers_for_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}/addFollowers"
          path["{project_gid}"] = project_gid
          parse(client.post(path, body: data, options: options)).first
        end

        # Add users to a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def add_members_for_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}/addMembers"
          path["{project_gid}"] = project_gid
          parse(client.post(path, body: data, options: options)).first
        end

        # Create a project
        #

        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def create_project(client, options: {}, **data)
          path = "/projects"
          Project.new(parse(client.post(path, body: data, options: options)).first, client: client)
        end

        # Create a project in a team
        #
        # team_gid - [str]  (required) Globally unique identifier for the team.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def create_project_for_team(client, team_gid: required("team_gid"), options: {}, **data)
          path = "/teams/{team_gid}/projects"
          path["{team_gid}"] = team_gid
          Project.new(parse(client.post(path, body: data, options: options)).first, client: client)
        end

        # Create a project in a workspace
        #
        # workspace_gid - [str]  (required) Globally unique identifier for the workspace or organization.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def create_project_for_workspace(client, workspace_gid: required("workspace_gid"), options: {}, **data)
          path = "/workspaces/{workspace_gid}/projects"
          path["{workspace_gid}"] = workspace_gid
          Project.new(parse(client.post(path, body: data, options: options)).first, client: client)
        end

        # Delete a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def delete_project(client, project_gid: required("project_gid"), options: {})
          path = "/projects/{project_gid}"
          path["{project_gid}"] = project_gid
          parse(client.delete(path, options: options)).first
        end

        # Duplicate a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def duplicate_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}/duplicate"
          path["{project_gid}"] = project_gid
          Job.new(parse(client.post(path, body: data, options: options)).first, client: client)
        end

        # Get a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_project(client, project_gid: required("project_gid"), options: {})
          path = "/projects/{project_gid}"
          path["{project_gid}"] = project_gid
          Project.new(parse(client.get(path, options: options)).first, client: client)
        end

        # Get multiple projects
        #

        # workspace - [str]  The workspace or organization to filter projects on.
        # team - [str]  The team to filter projects on.
        # archived - [bool]  Only return projects whose `archived` field takes on the value of this parameter.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_projects(client, workspace: nil, team: nil, archived: nil, options: {})
          path = "/projects"
          params = { workspace: workspace, team: team, archived: archived }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get(path, params: params, options: options)), type: Project, client: client)
        end

        # Get projects a task is in
        #
        # task_gid - [str]  (required) The task to operate on.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_projects_for_task(client, task_gid: required("task_gid"), options: {})
          path = "/tasks/{task_gid}/projects"
          path["{task_gid}"] = task_gid
          Collection.new(parse(client.get(path, options: options)), type: Project, client: client)
        end

        # Get a team's projects
        #
        # team_gid - [str]  (required) Globally unique identifier for the team.
        # archived - [bool]  Only return projects whose `archived` field takes on the value of this parameter.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_projects_for_team(client, team_gid: required("team_gid"), archived: nil, options: {})
          path = "/teams/{team_gid}/projects"
          path["{team_gid}"] = team_gid
          params = { archived: archived }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get(path, params: params, options: options)), type: Project, client: client)
        end

        # Get all projects in a workspace
        #
        # workspace_gid - [str]  (required) Globally unique identifier for the workspace or organization.
        # archived - [bool]  Only return projects whose `archived` field takes on the value of this parameter.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_projects_for_workspace(client, workspace_gid: required("workspace_gid"), archived: nil, options: {})
          path = "/workspaces/{workspace_gid}/projects"
          path["{workspace_gid}"] = workspace_gid
          params = { archived: archived }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get(path, params: params, options: options)), type: Project, client: client)
        end

        # Get task count of a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > offset - [str]  Offset token. An offset to the next page returned by the API. A pagination request will return an offset token, which can be used as an input parameter to the next request. If an offset is not passed in, the API will return the first page of results. 'Note: You can only pass in an offset that was returned to you via a previously paginated request.'
        # > limit - [int]  Results per page. The number of objects to return per page. The value must be between 1 and 100.
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        def get_task_counts_for_project(client, project_gid: required("project_gid"), options: {})
          path = "/projects/{project_gid}/task_counts"
          path["{project_gid}"] = project_gid
          parse(client.get(path, options: options)).first
        end

        # Remove a custom field from a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def remove_custom_field_setting_for_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}/removeCustomFieldSetting"
          path["{project_gid}"] = project_gid
          parse(client.post(path, body: data, options: options)).first
        end

        # Remove followers from a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def remove_followers_for_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}/removeFollowers"
          path["{project_gid}"] = project_gid
          parse(client.post(path, body: data, options: options)).first
        end

        # Remove users from a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to POST
        def remove_members_for_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}/removeMembers"
          path["{project_gid}"] = project_gid
          parse(client.post(path, body: data, options: options)).first
        end

        # Update a project
        #
        # project_gid - [str]  (required) Globally unique identifier for the project.
        # options - [Hash] the request I/O options
        # > opt_fields - [list[str]]  Defines fields to return. Some requests return *compact* representations of objects in order to conserve resources and complete the request more efficiently. Other times requests return more information than you may need. This option allows you to list the exact set of fields that the API should be sure to return for the objects. The field names should be provided as paths, described below. The id of included objects will always be returned, regardless of the field options.
        # > opt_pretty - [bool]  Provides “pretty” output. Provides the response in a “pretty” format. In the case of JSON this means doing proper line breaking and indentation to make it readable. This will take extra time and increase the response size so it is advisable only to use this during debugging.
        # data - [Hash] the attributes to PUT
        def update_project(client, project_gid: required("project_gid"), options: {}, **data)
          path = "/projects/{project_gid}"
          path["{project_gid}"] = project_gid
          Project.new(parse(client.put(path, body: data, options: options)).first, client: client)
        end

      end
    end
  end
end
