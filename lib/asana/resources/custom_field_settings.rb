require_relative 'gen/custom_field_settings_base'

module Asana
  module Resources
    # Custom fields are applied to a particular project or portfolio with the
    # Custom Field Settings resource. This resource both represents the
    # many-to-many join of the Custom Field and Project or Portfolio as well as
    # stores information that is relevant to that particular pairing; for instance,
    # the `is_important` property determines some possible application-specific
    # handling of that custom field and parent.
    class CustomFieldSetting < CustomFieldSettingsBase


      attr_reader :gid

      attr_reader :resource_type

      attr_reader :created_at

      attr_reader :is_important

      attr_reader :parent

      attr_reader :project

      attr_reader :custom_field

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'custom_field_settings'
        end

        # Returns a list of all of the custom fields settings on a project.
        #
        # project - [Gid] The ID of the project for which to list custom field settings
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_project(client, project: required("project"), per_page: 20, options: {})
          params = { limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/projects/#{project}/custom_field_settings", params: params, options: options)), type: Resource, client: client)
        end

        # Returns a list of all of the custom fields settings on a portfolio.
        #
        # portfolio - [Gid] The ID of the portfolio for which to list custom field settings
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_portfolio(client, portfolio: required("portfolio"), per_page: 20, options: {})
          params = { limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/portfolios/#{portfolio}/custom_field_settings", params: params, options: options)), type: Resource, client: client)
        end
      end

    end
  end
end
