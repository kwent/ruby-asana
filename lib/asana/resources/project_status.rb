require_relative 'gen/project_statuses_base'

module Asana
  module Resources
    # A _project status_ is an update on the progress of a particular project, and is sent out to all project
    # followers when created. These updates include both text describing the update and a color code intended to
    # represent the overall state of the project: "green" for projects that are on track, "yellow" for projects
    # at risk, and "red" for projects that are behind.
    #
    # Project statuses can be created and deleted, but not modified.
    class ProjectStatus < ProjectStatusesBase


      attr_reader :id

      attr_reader :gid

      attr_reader :resource_type

      attr_reader :title

      attr_reader :text

      attr_reader :html_text

      attr_reader :color

      attr_reader :created_by

      attr_reader :created_at

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'project_statuses'
        end

        # Creates a new status update on the project.
        #
        # Returns the full record of the newly created project status update.
        #
        # project - [Gid] The project on which to create a status update.
        # text - [String] The text of the project status update.
        #
        # color - [String] The color to associate with the status update. Must be one of `"red"`, `"yellow"`, or `"green"`.
        #
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create_in_project(client, project: required("project"), text: required("text"), color: required("color"), options: {}, **data)
          with_params = data.merge(text: text, color: color).reject { |_,v| v.nil? || Array(v).empty? }
          Resource.new(parse(client.post("/projects/#{project}/project_statuses", body: with_params, options: options)).first, client: client)
        end
        alias_method :create, :create_in_project

        # Returns the compact project status update records for all updates on the project.
        #
        # project - [Gid] The project to find status updates for.
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_project(client, project: required("project"), per_page: 20, options: {})
          params = { limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/projects/#{project}/project_statuses", params: params, options: options)), type: Resource, client: client)
        end

        # Returns the complete record for a single status update.
        #
        # id - [Gid] The project status update to get.
        # options - [Hash] the request I/O options.
        def find_by_id(client, id, options: {})

          self.new(parse(client.get("/project_statuses/#{id}", options: options)).first, client: client)
        end
      end

      # Deletes a specific, existing project status update.
      #
      # Returns an empty data record.
      def delete()

        client.delete("/project_statuses/#{gid}") && true
      end

    end
  end
end
