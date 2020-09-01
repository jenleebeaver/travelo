  
  posts/_form:
    Below is code displaying data from the locations/ret gem 
  
    <div>
      <h3>
        Location:
      </h3>
      // can we put this erb tags in the locations table and save them to :location_name?
      <%= @ret.country.name %>, <%= @ret.city.name %>
      <%= @ret.subdivisions.most_specific.name %>
    </div>



    TO DO:
    -check out how to create responsive margins 