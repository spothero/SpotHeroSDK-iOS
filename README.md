# SpotHeroSDK-iOS

## Returned Types
Returned types are string values that are returned from various portions of the SDK.

#### Address Types
Defines the purpose of the address/entrance at the facility.
- `"default_vehicle_entrance"`: The vehicle entrance to be used for navigation and on the parking pass.
- `"physical"`: The address recognized by the facility owner.
- `"search"`: The location of the facility as it should appear in searches.
- `"vehicle_entrance"`: One of potentially several vehicle entrances at the facility.
- `"walking_distance"`: The location of the facility for walking distance calculations.

### Amenity Types
A value which uniquely distinguishes a type of amenity at a parking spot.
- `"attendant"`: The facility has staff on-site for assistance and questions.
- `"covered"`: The facility has a roof over the vehicles.
- `"ev"`: The facility has EV charging capabilities.
- `"heated"`: The facility is heated during cold weather.
- `"immediate_parking"`: The facility is immediately available for parking after a monthly reservation is created.
- `"in_out"`: Users may enter and exit the facility more than one time.
- `"no_contract"`: The facility does not require a signed, long-term contract for monthly parking.
- `"one_tap"`: The user can open the gate with a button on their app.
- `"paved"`: The surface of the facility is solid, such as asphalt or concrete.
- `"self_park"`: Users may park their own vehicles at this facility.
- `"shuttle"`: The facility has a shuttle available to nearby destinations, like an airport.
- `"touchless"`: Entering/exiting the facility does not require touching shared surfaces.
- `"valet"`: A valet will park the user's vehicle at this facility.
- `"wheelchair_accessible"`: The facility is wheelchair accessible.

### Facility Fees
Defines the supported fee types at the facility. The difference between a fee and a tax is when they are applied: A fee is applied to the base rate, while a tax is applied to the sum of the base rate and all applicable fees.
- `"airport_fee"`: A fee applied to reservations at facilities near airports.
- `"airport_tax"`: A tax applied to reservations at facilities near airports.
- `"blanket_fee"`: A fee applied to all reservations for facilities within a specific city.
- `"blanket_tax"`: A tax applied to all reservations for facilities within a specific city.
- `"oversize_fee"`: A fee applied to reservations for large vehicles.
- `"facility_fee"`: A fee applied to all reservations at a given facility.
- `"event_fee"`: A fee applied to reservations tied to events.

### Facility Parking Types
Represents a parking type offered at a facility.
- `"airport"`: A parking type aimed at travelers wishing to park near airports.
- `"monthly"`: A parking type aimed at customers looking for monthly parking.
- `"transient"`: A parking type aimed at customers looking for daily or hourly parking.

### Facility Types
Designation of different types of facilities.
- `"garage"`: An enclosed facility with potentially multiple levels.
- `"lot"`: An unenclosed single level facility.
- `"personal"`: A spot or spots owned by a person, family, or small business not otherwise in the parking business.
- `"under_el"`: A spot located under tracks for the Chicago El train system.
- `"valet_stand"`: A facility that offers valet services.
- `"unknown"`: A facility that does not have a facility type configured.

### Redemption Types
Defines the type of parking available at a garage.
- `"premium_valet"`: A valet parks the customer's vehicle, usually in a special place or private garage.
- `"self"`: A customer parks their own vehicle.
- `"self_valet_assist"`: A valet helps a customer park their vehicle.
- `"valet"`: A valet parks the customer's vehicle.
