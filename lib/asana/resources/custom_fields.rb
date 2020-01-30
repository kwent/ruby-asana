require_relative 'gen/custom_fields_base'

module Asana
  module Resources
    # Custom Fields store the metadata that is used in order to add user-specified
    # information to tasks in Asana. Be sure to reference the [Custom
    # Fields](/developers/documentation/getting-started/custom-fields) developer
    # documentation for more information about how custom fields relate to various
    # resources in Asana.
    #
    # Users in Asana can [lock custom
    # fields](/guide/help/premium/custom-fields#gl-lock-fields), which will make
    # them read-only when accessed by other users. Attempting to edit a locked
    # custom field will return HTTP error code `403 Forbidden`.
    class CustomField < CustomFieldsBase


      attr_reader :id

      attr_reader :gid

      attr_reader :resource_type

      attr_reader :resource_subtype

      attr_reader :name

      attr_reader :description

      attr_reader :type

      attr_reader :enum_options

      attr_reader :precision

      class << self
        # Returns the plural name of the resource.
        def plural_name
          'custom_fields'
        end

        # Creates a new custom field in a workspace. Every custom field is required to be created in a specific workspace, and this workspace cannot be changed once set.
        #
        # A custom field's `name` must be unique within a workspace and not conflict with names of existing task properties such as 'Due Date' or 'Assignee'. A custom field's `type` must be one of  'text', 'enum', or 'number'.
        #
        # Returns the full record of the newly created custom field.
        #
        # workspace - [Gid] The workspace to create a custom field in.
        # resource_subtype - [String] The type of the custom field. Must be one of the given values.
        # type - [String] **Deprecated: New integrations should prefer the `resource_subtype` parameter.**
        # name - [String] The name of the custom field.
        # description - [String] The description of the custom field.
        # precision - [Integer] The number of decimal places for the numerical values. Required if the custom field is of type 'number'.
        # enum_options - [String] The discrete values the custom field can assume. Required if the custom field is of type 'enum'.
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create(client, workspace: required("workspace"), resource_subtype: nil, type: nil, name: required("name"), description: nil, precision: nil, enum_options: nil, options: {}, **data)
          with_params = data.merge(workspace: workspace, resource_subtype: resource_subtype || type, name: name, description: description, precision: precision, enum_options: enum_options).reject { |_,v| v.nil? || Array(v).empty? }
          Resource.new(parse(client.post("/custom_fields", body: with_params, options: options)).first, client: client)
        end

        # Returns the complete definition of a custom field's metadata.
        #
        # id - [Gid] Globally unique identifier for the custom field.
        #
        # options - [Hash] the request I/O options.
        def find_by_id(client, id, options: {})

          self.new(parse(client.get("/custom_fields/#{id}", options: options)).first, client: client)
        end

        # Returns a list of the compact representation of all of the custom fields in a workspace.
        #
        # workspace - [Gid] The workspace or organization to find custom field definitions in.
        # per_page - [Integer] the number of records to fetch per page.
        # options - [Hash] the request I/O options.
        def find_by_workspace(client, workspace: required("workspace"), per_page: 20, options: {})
          params = { limit: per_page }.reject { |_,v| v.nil? || Array(v).empty? }
          Collection.new(parse(client.get("/workspaces/#{workspace}/custom_fields", params: params, options: options)), type: Resource, client: client)
        end

        # Creates an enum option and adds it to this custom field's list of enum options. A custom field can have at most 50 enum options (including disabled options). By default new enum options are inserted at the end of a custom field's list.
        #
        # Locked custom fields can only have enum options added by the user who locked the field.
        #
        # Returns the full record of the newly created enum option.
        #
        # custom_field - [Gid] Globally unique identifier for the custom field.
        #
        # name - [String] The name of the enum option.
        # color - [String] The color of the enum option. Defaults to 'none'.
        # insert_before - [Gid] An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.
        # insert_after - [Gid] An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def create_enum_option(client, custom_field: required("custom_field"), name: required("name"), color: nil, insert_before: nil, insert_after: nil, options: {}, **data)
          with_params = data.merge(name: name, color: color, insert_before: insert_before, insert_after: insert_after).reject { |_,v| v.nil? || Array(v).empty? }
          Resource.new(parse(client.post("/custom_fields/#{custom_field}/enum_options", body: with_params, options: options)).first, client: client)
        end
        alias_method :add_enum_option, :create_enum_option

        # Moves a particular enum option to be either before or after another specified enum option in the custom field.
        #
        # Locked custom fields can only be reordered by the user who locked the field.
        #
        # custom_field - [Gid] Globally unique identifier for the custom field.
        #
        # enum_option - [Gid] The ID of the enum option to relocate.
        # name - [String] The name of the enum option.
        # color - [String] The color of the enum option. Defaults to 'none'.
        # before_enum_option - [Gid] An existing enum option within this custom field before which the new enum option should be inserted. Cannot be provided together with after_enum_option.
        # after_enum_option - [Gid] An existing enum option within this custom field after which the new enum option should be inserted. Cannot be provided together with before_enum_option.
        # options - [Hash] the request I/O options.
        # data - [Hash] the attributes to post.
        def insert_enum_option(client, custom_field: required("custom_field"), enum_option: required("enum_option"), name: required("name"), color: nil, before_enum_option: nil, after_enum_option: nil, options: {}, **data)
          with_params = data.merge(enum_option: enum_option, name: name, color: color, before_enum_option: before_enum_option, after_enum_option: after_enum_option).reject { |_,v| v.nil? || Array(v).empty? }
          Resource.new(parse(client.post("/custom_fields/#{custom_field}/enum_options/insert", body: with_params, options: options)).first, client: client)
        end
        alias_method :reorder_enum_option, :insert_enum_option
      end

      # A specific, existing custom field can be updated by making a PUT request on the URL for that custom field. Only the fields provided in the `data` block will be updated; any unspecified fields will remain unchanged
      #
      # When using this method, it is best to specify only those fields you wish to change, or else you may overwrite changes made by another user since you last retrieved the custom field.
      #
      # An enum custom field's `enum_options` cannot be updated with this endpoint. Instead see "Work With Enum Options" for information on how to update `enum_options`.
      #
      # Locked custom fields can only be updated by the user who locked the field.
      #
      # Returns the complete updated custom field record.
      #
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def update(options: {}, **data)

        refresh_with(parse(client.put("/custom_fields/#{gid}", body: data, options: options)).first)
      end

      # A specific, existing custom field can be deleted by making a DELETE request on the URL for that custom field.
      #
      # Locked custom fields can only be deleted by the user who locked the field.
      #
      # Returns an empty data record.
      def delete()

        client.delete("/custom_fields/#{gid}") && true
      end

      # Updates an existing enum option. Enum custom fields require at least one enabled enum option.
      #
      # Locked custom fields can only be updated by the user who locked the field.
      #
      # Returns the full record of the updated enum option.
      #
      # enum_option - [Gid] Globally unique identifier for the enum option.
      #
      # name - [String] The name of the enum option.
      # color - [String] The color of the enum option. Defaults to 'none'.
      # enabled - [Boolean] Whether or not the enum option is a selectable value for the custom field.
      # options - [Hash] the request I/O options.
      # data - [Hash] the attributes to post.
      def update_enum_option(enum_option: required("enum_option"), name: required("name"), color: nil, enabled: nil, options: {}, **data)
        with_params = data.merge(name: name, color: color, enabled: enabled).reject { |_,v| v.nil? || Array(v).empty? }
        refresh_with(parse(client.put("/enum_options/#{enum_option}", body: with_params, options: options)).first)
      end

    end
  end
end
