( define ( domain minigrid )
  ( :requirements :strips :typing :equality :htn )
  ( :types door obj robot room )
  ( :predicates
    ( ROBOT-IN ?a - ROBOT ?b - ROOM )
    ( OBJ-IN ?c - OBJ ?d - ROOM )
    ( ON-ROBOT ?e - OBJ ?f - ROBOT )
    ( DOOR-ON ?g - DOOR ?h - ROOM )
    ( OPEN ?j - DOOR )
    ( LOCKED ?k - DOOR )
    ( KEY ?l - OBJ )
    ( PARCEL ?m - OBJ )
  )
  ( :action !PICK-UP
    :parameters
    (
      ?robot - ROBOT
      ?obj - OBJ
      ?room - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?room ) ( OBJ-IN ?obj ?room ) )
    :effect
    ( and ( not ( OBJ-IN ?obj ?room ) ) ( ON-ROBOT ?obj ?robot ) )
  )
  ( :action !MOVE-TO
    :parameters
    (
      ?robot - ROBOT
      ?c1 - ROOM
      ?c2 - ROOM
      ?door - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?c1 ) ( DOOR-ON ?door ?c1 ) ( DOOR-ON ?door ?c2 ) ( OPEN ?door ) )
    :effect
    ( and ( not ( ROBOT-IN ?robot ?c1 ) ) ( ROBOT-IN ?robot ?c2 ) )
  )
  ( :action !DROP
    :parameters
    (
      ?robot - ROBOT
      ?obj - OBJ
      ?room - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?room ) ( ON-ROBOT ?obj ?robot ) )
    :effect
    ( and ( OBJ-IN ?obj ?room ) ( not ( ON-ROBOT ?obj ?robot ) ) )
  )
  ( :action !OPEN
    :parameters
    (
      ?robot - ROBOT
      ?door - DOOR
      ?c1 - ROOM
      ?key - OBJ
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?c1 ) ( DOOR-ON ?door ?c1 ) ( LOCKED ?door ) ( ON-ROBOT ?key ?robot ) ( KEY ?key ) )
    :effect
    ( and ( not ( LOCKED ?door ) ) ( OPEN ?door ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_811 - OBJ
      ?auto_810 - ROOM
    )
    :vars
    (
      ?auto_813 - ROBOT
    )
    :precondition
    (
    )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_813 ?auto_811 )
      ( DELIVER-PKG ?auto_813 ?auto_810 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_811 - OBJ
      ?auto_810 - ROOM
    )
    :vars
    (
      ?auto_813 - ROBOT
    )
    :precondition
    (
      ON-ROBOT ?auto_811 ?auto_813
    )
    :subtasks
    ( ( MOVE-TO ?auto_813 ?auto_810 )
      ( DELIVER-PKG ?auto_813 ?auto_810 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_811 - OBJ
      ?auto_810 - ROOM
    )
    :vars
    (
      ?auto_813 - ROBOT
    )
    :precondition
    (and
      ( ON-ROBOT ?auto_811 ?auto_813 )
      ( ROBOT-IN ?auto_813 ?auto_810 )
    )
    :subtasks
    ( 
      ( !DROP ?auto_813 ?auto_810 )
    )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_735 - ROBOT
      ?auto_736 - ROOM
    )
    :vars
    (
      ?auto_738 - ROOM
      ?auto_739 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_735 ?auto_738 ) ( DOOR-ON ?auto_739 ?auto_738 ) ( DOOR-ON ?auto_739 ?auto_736 ) ( OPEN ?auto_739 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_735 ?auto_738 ?auto_736 ?auto_739 ) )
  )  

  ( :method MOVE-TO
    :parameters
    (
      ?auto_735 - ROBOT
      ?auto_736 - ROOM
    )
    :vars
    (
      ?auto_738 - ROOM
      ?auto_740 - ROOM
      ?auto_739 - DOOR
    )
    :precondition
    ( and
      ( ROBOT-IN ?auto_735 ?auto_738 ) 
      ( DOOR-ON ?auto_739 ?auto_738 ) 
      ( DOOR-ON ?auto_739 ?auto_740 ) 
      ( OPEN ?auto_739 ) 
    )
    :subtasks
    ( 
      ( !MOVE-TO ?auto_735 ?auto_738 ?auto_740 ?auto_739 ) 
      ( MOVE-TO ?auto_735 ?auto_736 ) 
    )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_735 - ROBOT
      ?auto_736 - ROOM
    )
    :vars
    (
      ?auto_738 - ROOM
      ?auto_740 - ROOM
      ?auto_739 - DOOR
    )
    :precondition
    ( and
      ( ROBOT-IN ?auto_735 ?auto_738 ) 
      ( DOOR-ON ?auto_739 ?auto_738 ) 
      ( DOOR-ON ?auto_739 ?auto_740 ) 
      ( LOCKED ?auto_739 ) 
    )
    :subtasks
    ( 
      ( OPEN ?auto_739)
      ( !MOVE-TO ?auto_735 ?auto_738 ?auto_740 ?auto_739 ) 
      ( MOVE-TO ?auto_735 ?auto_736 ) 
    )
  )

)