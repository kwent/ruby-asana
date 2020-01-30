require_relative 'gen/projects_base'

module Asana
  module Resources
    # A _project_ represents a prioritized list of tasks in Asana or a board with
    # columns of tasks represented as cards. It exists in a single workspace or
    # organization and is accessible to a subset of users in that workspace or
    # organization, depending on its permissions.
    #
    # Projects in organizations are shared with a single team. You cannot currently
    # change the team of a project via the API. Non-organization workspaces do not
    # have teams and so you should not specify the team of project in a regular
    # workspace.
    class Project < ProjectsBase

      include EventSubscription


      attr_reader :id

      attr_reader :gid

      attr_reader :resource_type

      attr_reader :name

      attr_reader :owner

      attr_reader :current_status

      attr_reader :due_date

      attr_reader :due_on

      attr_reader :start_on

      attr_reader :created_at

      attr_reader :modified_at

      attr_reader :archived

      attr_reader :public

      attr_reader :members

      attr_reader :followers

      attr_reader :custom_fields

      attr_reader :custom_field_settings

      attr_reader :color

      attr_reader :notes

      attr_reader :html_notes

      attr_reader :workspace

      attr_reader :team

      attr_reader :layout

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'projects'
        end

        # Creates a new project in a workspace or team.
        #
        # Every project is required to be created in a specific workspace or
        # organization, and this cannot be changed once set. Note that you can use
        # the `workspace` parameter regardless of whether or not it is an
        # organization.
        #
        # If the workspace for your project _is_ an organization, you must also
        # supply a `team` to share the project with.
        #
        # Returns the full record of the newly created project.
        #
        # workspace - [Gid] The workspace or organization to create the project in.
        # team - [Gid] If creating in an organization, the specific team to create the
        # project in.
        #
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create(client, workspace: required("workspace"), team: nil, options: {}, **data)
          with_params = data.merge(workspace: workspace, team: team).reject { |_,v| v.nil? || Array(v).empty? }
          self.new(parse(client.post("/projects", body: with_params, options: options)).first, client: client)
        end

        # If the workspace for your project _is_ an organization, you must also
        # supply a `team` to share the project with.
        #
        # Returns the full record of the newly created project.
        #
        # workspace - [Gid] The workspace or organization to create the project in.
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create_in_workspace(client, workspace: required("workspace"), options: {}, **data)

          self.new(parse(client.post("/workspaces/#{workspace}/projects", body: data, options: options)).first, client: client)
        end

        # Creates a project shared with the given team.
        #
        # Returns the full record of the newly created project.
        #
        # team - [Gid] The team to create the project in.
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create_in_team(client, team: required("team"), options: {}, **data)

          self.new(parse(client.post("/teams/#{team}/projects", body: data, options: options)).first, client: client)
        end

        # Returns the complete project record for a single project.
        #
        # id - [Gid] The project to get.
        # options - [Hash] the request I/O options.
        def find_by_id(client, id, options: {})

          self.new(parse(client.get("/projects/#{id}", options: options)).first, client: client)
        end

        # Returns the compact project records for some filtered set of projects.
        # Use one or more of the parameters provided to filter the projects returned.
        #
        # workspace - [Gid] The workspace or organization to filter projects on.
        # team - [Gid] The team to filter projects on.
        # is_template - [Boolean] **Note: This parameter can only be included if a team is also defined, or the workspace is not an organization**
        # Filters results to include only template projects.
        #
        # archived - [Boolean] Only return projects whose `archived` field takes on the value of
        # this parameter.
        #
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_all(client, workspace: nil, team: nil, is_template: nil, archived: nil, per_page: 20, options: {})
          params = { workspace: workspace, team: team, is_template: is_template, archived: archived, limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/projects", params: params, options: options)), type: self, client: client)
        end

        # Returns the compact project records for all projects in the workspace.
        #
        # workspace - [Gid] The workspace or organization to find projects in.
        # is_template - [Boolean] **Note: This parameter can only be included if a team is also defined, or the workspace is not an organization**
        # Filters results to include only template projects.
        #
        # archived - [Boolean] Only return projects whose `archived` field takes on the value of
        # this parameter.
        #
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_workspace(client, workspace: required("workspace"), is_template: nil, archived: nil, per_page: 20, options: {})
          params = { is_template: is_template, archived: archived, limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/workspaces/#{workspace}/projects", params: params, options: options)), type: self, client: client)
        end

        # Returns the compact project records for all projects in the team.
        #
        # team - [Gid] The team to find projects in.
        # is_template - [Boolean] Filters results to include only template projects.
        #
        # archived - [Boolean] Only return projects whose `archived` field takes on the value of
        # this parameter.
        #
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_team(client, team: required("team"), is_template: nil, archived: nil, per_page: 20, options: {})
          params = { is_template: is_template, archived: archived, limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/teams/#{team}/projects", params: params, options: options)), type: self, client: client)
        end
      end

      # A specific, existing project can be updated by making a PUT request on the
      # URL for that project. Only the fields provided in the `data` block will be
      # updated; any unspecified fields will remain unchanged.
      #
      # When using this method, it is best to specify only those fields you wish
      # to change, or else you may overwrite changes made by another user since
      # you last retrieved the task.
      #
      # Returns the complete updated project record.
      #
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def update(options: {}, **data)

        refresh_with(parse(client.put("/projects/#{gid}", body: data, options: options)).first)
      end

      # A specific, existing project can be deleted by making a DELETE request
      # on the URL for that project.
      #
      # Returns an empty data record.
      def delete()

        client.delete("/projects/#{gid}") && true
      end

      # Creates and returns a job that will asynchronously handle the duplication.
      #
      # name - [String] The name of the new project.
      # team - [Gid] Sets the team of the new project. If team is not defined, the new project
      # will be in the same team as the the original project.
      #
      # include - [Array] The elements that will be duplicated to the new project.
      # Tasks are always included.
      #
      # schedule_dates - [String] A dictionary of options to auto-shift dates.
      # `task_dates` must be included to use this option.
      # Requires either `start_on` or `due_on`, but not both.
      # `start_on` will set the first start date of the new
      # project to the given date, while `due_on` will set the last due date
      # to the given date. Both will offset the remaining dates by the same amount
      # of the original project.
      #
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def duplicate_project(name: required("name"), team: nil, include: nil, schedule_dates: nil, options: {}, **data)
        with_params = data.merge(name: name, team: team, include: include, schedule_dates: schedule_dates).reject { |_,v| v.nil? || Array(v).empty? }
        Resource.new(parse(client.post("/projects/#{gid}/duplicate", body: with_params, options: options)).first, client: client)
      end

      # Returns the compact task records for all tasks within the given project,
      # ordered by their priority within the project. Tasks can exist in more than one project at a time.
      #
      # per_page - [Integer] the number of records to fetch per page.
      # options - [Hash] the request I/O options.
      def tasks(per_page: 20, options: {})
        params = { limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
        Collection.new(parse(client.get("/projects/#{gid}/tasks", params: params, options: options)), type: Task, client: client)
      end

      # Adds the specified list of users as followers to the project. Followers are a subset of members, therefore if
      # the users are not already members of the project they will also become members as a result of this operation.
      # Returns the updated project record.
      #
      # followers - [Array] An array of followers to add to the project.
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def add_followers(followers: required("followers"), options: {}, **data)
        with_params = data.merge(followers: followers).reject { |_,v| v.nil? || Array(v).empty? }
        refresh_with(parse(client.post("/projects/#{gid}/addFollowers", body: with_params, options: options)).first)
      end

      # Removes the specified list of users from following the project, this will not affect project membership status.
      # Returns the updated project record.
      #
      # followers - [Array] An array of followers to remove from the project.
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def remove_followers(followers: required("followers"), options: {}, **data)
        with_params = data.merge(followers: followers).reject { |_,v| v.nil? || Array(v).empty? }
        refresh_with(parse(client.post("/projects/#{gid}/removeFollowers", body: with_params, options: options)).first)
      end

      # Adds the specified list of users as members of the project. Returns the updated project record.
      #
      # members - [Array] An array of user ids.
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def add_members(members: required("members"), options: {}, **data)
        with_params = data.merge(members: members).reject { |_,v| v.nil? || Array(v).empty? }
        refresh_with(parse(client.post("/projects/#{gid}/addMembers", body: with_params, options: options)).first)
      end

      # Removes the specified list of members from the project. Returns the updated project record.
      #
      # members - [Array] An array of user ids.
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def remove_members(members: required("members"), options: {}, **data)
        with_params = data.merge(members: members).reject { |_,v| v.nil? || Array(v).empty? }
        refresh_with(parse(client.post("/projects/#{gid}/removeMembers", body: with_params, options: options)).first)
      end

      # Create a new custom field setting on the project.
      #
      # custom_field - [Gid] The id of the custom field to associate with this project.
      # is_important - [Boolean] Whether this field should be considered important to this project.
      #
      # insert_before - [Gid] An id of a Custom Field Settings on this project, before which the new Custom Field Settings will be added.
      # `insert_before` and `insert_after` parameters cannot both be specified.
      #
      # insert_after - [Gid] An id of a Custom Field Settings on this project, after which the new Custom Field Settings will be added.
      # `insert_before` and `insert_after` parameters cannot both be specified.
      #
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def add_custom_field_setting(custom_field: required("custom_field"), is_important: nil, insert_before: nil, insert_after: nil, options: {}, **data)
        with_params = data.merge(custom_field: custom_field, is_important: is_important, insert_before: insert_before, insert_after: insert_after).reject { |_,v| v.nil? || Array(v).empty? }
        Resource.new(parse(client.post("/projects/#{gid}/addCustomFieldSetting", body: with_params, options: options)).first, client: client)
      end

      # Remove a custom field setting on the project.
      #
      # custom_field - [Gid] The id of the custom field to remove from this project.
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def remove_custom_field_setting(custom_field: nil, options: {}, **data)
        with_params = data.merge(custom_field: custom_field).reject { |_,v| v.nil? || Array(v).empty? }
        Resource.new(parse(client.post("/projects/#{gid}/removeCustomFieldSetting", body: with_params, options: options)).first, client: client)
      end

    end
  end
end
