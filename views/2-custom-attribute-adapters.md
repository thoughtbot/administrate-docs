# Handling Custom Attributes

Attribute adapters usually come in the form of gems,
and they act as plugins that extend the functionality of Administrate.

If your model has an attribute that's not handled by Administrate
(say, for example, geoJSON data),
it's easy to write your own adapter for it.

Attribute adapters are simple classes that define how to present an attribute
in Administrate's interfaces.

To write your own, simply implement the class...

    class GeoJsonAdapter < Administrate::Adapters::TextAdapter
      def render(resource)
    <<-HTML
        <div class="geojson" data-geometry=#{resource.send(:attr_name)}></div>
        <script src="/scripts/render_geojson.js" />
    HTML
      end

      # for the form field, this adapter will inherit behavior from TextAdapter,
      # and display a text area.
    end

... register your adapter with Administrate ...

    # config/initializers/administrate.rb
    Administrate::Adapters.register(:geometry, GeoJsonAdapter)

... and then use the adapter in your resources!

    Administrate.register Neighborhood do |neighborhood|
      neighborhood.string :name
      neighborhood.geometry :coordinates
    end
