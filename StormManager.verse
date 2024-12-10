using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Verse.org/Random }
using { /Fortnite.com/Game }
using { /Fortnite.com/Characters }
using { /UnrealEngine.com/Temporary/SpatialMath }

StormManager := class(creative_device):
    @editable
    # Storm Controller linked to a basic storm controller device to
    # facilitate the storm from movement to damage dealt to players in the
    # storm zone.
    StormController : basic_storm_controller_device = basic_storm_controller_device{}

    # Function: OnBegin()
    # Runs when the map is loaded, handles the initialization of the storm
    OnBegin<override>()<suspends>:void=
        InitializeStorm() # storm initilization

    # Function: InitializeStorm()
    # Initializes the storm by moving it to a specified location and rotation
    # over a duration of 1 minute.
    InitializeStorm()<suspends>:void=
        # vector3 object created as a parameter for the
        var movementVector : vector3 = vector3{X := 200.0, Y := 0.0, Z := 200.0}
        var rotationVector : rotation = MakeRotation(vector3{X := 0.0, 
        Y := 1.0, Z := 0.0}, 0.0)
        # storm controller device is called to move the storm to the
        # end location within 60 seconds
        StormController.MoveTo(movementVector, rotationVector, 60.0)
