require_relative 'gen/organization_exports_base'

module Asana
  module Resources
    # An _organization_export_ object represents a request to export the complete data of an Organization
    # in JSON format.
    #
    # To export an Organization using this API:
    #
    # * Create an `organization_export` [request](#create) and store the id that is returned.\
    # * Request the `organization_export` every few minutes, until the `state` field contains 'finished'.\
    # * Download the file located at the URL in the `download_url` field.
    #
    # Exports can take a long time, from several minutes to a few hours for large Organizations.
    #
    # **Note:** These endpoints are only available to [Service Accounts](/guide/help/premium/service-accounts)
    # of an [Enterprise](/enterprise) Organization.
    class OrganizationExport < OrganizationExportsBase


      attr_reader :id

      attr_reader :gid

      attr_reader :created_at

      attr_reader :download_url

      attr_reader :state

      attr_reader :organization

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'organization_exports'
        end

        # Returns details of a previously-requested Organization export.
        #
        # id - [Gid] Globally unique identifier for the Organization export.
        #
        # options - [Hash] the request I/O options.
        def find_by_id(client, id, options: {})

          self.new(parse(client.get("/organization_exports/#{id}", options: options)).first, client: client)
        end

        # This method creates a request to export an Organization. Asana will complete the export at some
        # point after you create the request.
        #
        # organization - [Gid] Globally unique identifier for the workspace or organization.
        #
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create(client, organization: required("organization"), options: {}, **data)
          with_params = data.merge(organization: organization).reject { |_,v| v.nil? || Array(v).empty? }
          Resource.new(parse(client.post("/organization_exports", body: with_params, options: options)).first, client: client)
        end
      end

    end
  end
end
