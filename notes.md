  
  posts/_form
  <div class="field" class="fields_with_errors">
      <p>
        <%= f.label :location, "Where are you located?" %><br/>
        <%= f.collection_select :location_id, 
          Location.all, 
          :id, 
          :location_name,
          prompt: true, 
          :required => true, 
          class: "form-control"
        %>
      </p>
    </div>

       <div class="field" class="fields_with_errors>
      <%= f.label :location, "Your current location"%><br>
      <%= f.text_field :location_name, 
      value: "#{@ret.country.name}, #{@ret.city.name} #{@ret.subdivisions.most_specific.name}", 
      :required => true, 
      :disabled => true,
      class: "form-control"%>
    </div>

     <%= f.collection_check_boxes :location_id, Location.all, :id, :location_name %>

      <div class="field" class="fields_with_errors">
      <p>
        <%= f.fields_for :location, @location do |l| %>
          <%= l.label :location_name, "Where are you located?" %><br/>
          <%= l.text_field :location_name, 
            prompt: true, 
            :required => true, 
            class: "form-control"
          %>
          <%= p.hidden_field user_id, :value => current_user.id %>
        <%end%>
      </p>
    </div>