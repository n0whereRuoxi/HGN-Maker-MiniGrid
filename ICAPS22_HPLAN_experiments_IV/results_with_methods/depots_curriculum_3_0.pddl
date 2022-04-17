( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?above - SURFACE
      ?below - SURFACE
    )
    :precondition
    ( and ( ON ?above ?below ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23 - SURFACE
      ?auto_22 - SURFACE
    )
    :vars
    (
      ?auto_24 - HOIST
      ?auto_25 - PLACE
      ?auto_27 - PLACE
      ?auto_28 - HOIST
      ?auto_29 - SURFACE
      ?auto_26 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24 ?auto_25 ) ( SURFACE-AT ?auto_22 ?auto_25 ) ( CLEAR ?auto_22 ) ( IS-CRATE ?auto_23 ) ( AVAILABLE ?auto_24 ) ( not ( = ?auto_27 ?auto_25 ) ) ( HOIST-AT ?auto_28 ?auto_27 ) ( AVAILABLE ?auto_28 ) ( SURFACE-AT ?auto_23 ?auto_27 ) ( ON ?auto_23 ?auto_29 ) ( CLEAR ?auto_23 ) ( TRUCK-AT ?auto_26 ?auto_25 ) ( not ( = ?auto_23 ?auto_22 ) ) ( not ( = ?auto_23 ?auto_29 ) ) ( not ( = ?auto_22 ?auto_29 ) ) ( not ( = ?auto_24 ?auto_28 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26 ?auto_25 ?auto_27 )
      ( !LIFT ?auto_28 ?auto_23 ?auto_29 ?auto_27 )
      ( !LOAD ?auto_28 ?auto_23 ?auto_26 ?auto_27 )
      ( !DRIVE ?auto_26 ?auto_27 ?auto_25 )
      ( !UNLOAD ?auto_24 ?auto_23 ?auto_26 ?auto_25 )
      ( !DROP ?auto_24 ?auto_23 ?auto_22 ?auto_25 )
      ( MAKE-ON-VERIFY ?auto_23 ?auto_22 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_33 - SURFACE
      ?auto_32 - SURFACE
    )
    :vars
    (
      ?auto_34 - HOIST
      ?auto_35 - PLACE
      ?auto_37 - PLACE
      ?auto_38 - HOIST
      ?auto_39 - SURFACE
      ?auto_36 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_34 ?auto_35 ) ( SURFACE-AT ?auto_32 ?auto_35 ) ( CLEAR ?auto_32 ) ( IS-CRATE ?auto_33 ) ( AVAILABLE ?auto_34 ) ( not ( = ?auto_37 ?auto_35 ) ) ( HOIST-AT ?auto_38 ?auto_37 ) ( AVAILABLE ?auto_38 ) ( SURFACE-AT ?auto_33 ?auto_37 ) ( ON ?auto_33 ?auto_39 ) ( CLEAR ?auto_33 ) ( TRUCK-AT ?auto_36 ?auto_35 ) ( not ( = ?auto_33 ?auto_32 ) ) ( not ( = ?auto_33 ?auto_39 ) ) ( not ( = ?auto_32 ?auto_39 ) ) ( not ( = ?auto_34 ?auto_38 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_36 ?auto_35 ?auto_37 )
      ( !LIFT ?auto_38 ?auto_33 ?auto_39 ?auto_37 )
      ( !LOAD ?auto_38 ?auto_33 ?auto_36 ?auto_37 )
      ( !DRIVE ?auto_36 ?auto_37 ?auto_35 )
      ( !UNLOAD ?auto_34 ?auto_33 ?auto_36 ?auto_35 )
      ( !DROP ?auto_34 ?auto_33 ?auto_32 ?auto_35 )
      ( MAKE-ON-VERIFY ?auto_33 ?auto_32 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43 - SURFACE
      ?auto_42 - SURFACE
    )
    :vars
    (
      ?auto_44 - HOIST
      ?auto_45 - PLACE
      ?auto_47 - PLACE
      ?auto_48 - HOIST
      ?auto_49 - SURFACE
      ?auto_46 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_44 ?auto_45 ) ( SURFACE-AT ?auto_42 ?auto_45 ) ( CLEAR ?auto_42 ) ( IS-CRATE ?auto_43 ) ( AVAILABLE ?auto_44 ) ( not ( = ?auto_47 ?auto_45 ) ) ( HOIST-AT ?auto_48 ?auto_47 ) ( AVAILABLE ?auto_48 ) ( SURFACE-AT ?auto_43 ?auto_47 ) ( ON ?auto_43 ?auto_49 ) ( CLEAR ?auto_43 ) ( TRUCK-AT ?auto_46 ?auto_45 ) ( not ( = ?auto_43 ?auto_42 ) ) ( not ( = ?auto_43 ?auto_49 ) ) ( not ( = ?auto_42 ?auto_49 ) ) ( not ( = ?auto_44 ?auto_48 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_46 ?auto_45 ?auto_47 )
      ( !LIFT ?auto_48 ?auto_43 ?auto_49 ?auto_47 )
      ( !LOAD ?auto_48 ?auto_43 ?auto_46 ?auto_47 )
      ( !DRIVE ?auto_46 ?auto_47 ?auto_45 )
      ( !UNLOAD ?auto_44 ?auto_43 ?auto_46 ?auto_45 )
      ( !DROP ?auto_44 ?auto_43 ?auto_42 ?auto_45 )
      ( MAKE-ON-VERIFY ?auto_43 ?auto_42 ) )
  )

)

