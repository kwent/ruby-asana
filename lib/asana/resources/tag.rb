require_relative 'gen/tags_base'

module Asana
  module Resources
    # A _tag_ is a label that can be attached to any task in Asana. It exists in a
    # single workspace or organization.
    #
    # Tags have some metadata associated with them, but it is possible that we will
    # simplify them in the future so it is not encouraged to rely too heavily on it.
    # Unlike projects, tags do not provide any ordering on the tasks they
    # are associated with.
    class Tag < TagsBase


      attr_reader :id

      attr_reader :gid

      attr_reader :resource_type

      attr_reader :created_at

      attr_reader :followers

      attr_reader :name

      attr_reader :color

      attr_reader :workspace

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'tags'
        end

        # Creates a new tag in a workspace or organization.
        #
        # Every tag is required to be created in a specific workspace or
        # organization, and this cannot be changed once set. Note that you can use
        # the `workspace` parameter regardless of whether or not it is an
        # organization.
        #
        # Returns the full record of the newly created tag.
        #
        # workspace - [Gid] The workspace or organization to create the tag in.
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create(client, workspace: required("workspace"), options: {}, **data)
          with_params = data.merge(workspace: workspace).reject { |_,v| v.nil? || Array(v).empty? }
          self.new(parse(client.post("/tags", body: with_params, options: options)).first, client: client)
        end

        # Creates a new tag in a workspace or organization.
        #
        # Every tag is required to be created in a specific workspace or
        # organization, and this cannot be changed once set. Note that you can use
        # the `workspace` parameter regardless of whether or not it is an
        # organization.
        #
        # Returns the full record of the newly created tag.
        #
        # workspace - [Gid] The workspace or organization to create the tag in.
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create_in_workspace(client, workspace: required("workspace"), options: {}, **data)

          self.new(parse(client.post("/workspaces/#{workspace}/tags", body: data, options: options)).first, client: client)
        end

        # Returns the complete tag record for a single tag.
        #
        # id - [Gid] The tag to get.
        # options - [Hash] the request I/O options.
        def find_by_id(client, id, options: {})

          self.new(parse(client.get("/tags/#{id}", options: options)).first, client: client)
        end

        # Returns the compact tag records for some filtered set of tags.
        # Use one or more of the parameters provided to filter the tags returned.
        #
        # workspace - [Gid] The workspace or organization to filter tags on.
        # team - [Gid] The team to filter tags on.
        # archived - [Boolean] Only return tags whose `archived` field takes on the value of
        # this parameter.
        #
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_all(client, workspace: nil, team: nil, archived: nil, per_page: 20, options: {})
          params = { workspace: workspace, team: team, archived: archived, limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/tags", params: params, options: options)), type: self, client: client)
        end

        # Returns the compact tag records for all tags in the workspace.
        #
        # workspace - [Gid] The workspace or organization to find tags in.
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_workspace(client, workspace: required("workspace"), per_page: 20, options: {})
          params = { limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/workspaces/#{workspace}/tags", params: params, options: options)), type: self, client: client)
        end
      end

      # Updates the properties of a tag. Only the fields provided in the `data`
      # block will be updated; any unspecified fields will remain unchanged.
      #
      # When using this method, it is best to specify only those fields you wish
      # to change, or else you may overwrite changes made by another user since
      # you last retrieved the task.
      #
      # Returns the complete updated tag record.
      #
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def update(options: {}, **data)

        refresh_with(parse(client.put("/tags/#{gid}", body: data, options: options)).first)
      end

      # A specific, existing tag can be deleted by making a DELETE request
      # on the URL for that tag.
      #
      # Returns an empty data record.
      def delete()

        client.delete("/tags/#{gid}") && true
      end

      # Returns the compact task records for all tasks with the given tag.
      # Tasks can have more than one tag at a time.
      #
      # per_page - [Integer] the number of records to fetch per page.
      # options - [Hash] the request I/O options.
      def get_tasks_with_tag(per_page: 20, options: {})
        params = { limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
        Collection.new(parse(client.get("/tags/#{gid}/tasks", params: params, options: options)), type: Task, client: client)
      end

    end
  end
end
