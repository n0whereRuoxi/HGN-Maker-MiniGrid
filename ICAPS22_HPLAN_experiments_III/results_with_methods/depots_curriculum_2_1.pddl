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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_35 - SURFACE
      ?auto_36 - SURFACE
    )
    :vars
    (
      ?auto_37 - HOIST
      ?auto_38 - PLACE
      ?auto_40 - PLACE
      ?auto_41 - HOIST
      ?auto_42 - SURFACE
      ?auto_39 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_37 ?auto_38 ) ( SURFACE-AT ?auto_35 ?auto_38 ) ( CLEAR ?auto_35 ) ( IS-CRATE ?auto_36 ) ( AVAILABLE ?auto_37 ) ( not ( = ?auto_40 ?auto_38 ) ) ( HOIST-AT ?auto_41 ?auto_40 ) ( AVAILABLE ?auto_41 ) ( SURFACE-AT ?auto_36 ?auto_40 ) ( ON ?auto_36 ?auto_42 ) ( CLEAR ?auto_36 ) ( TRUCK-AT ?auto_39 ?auto_38 ) ( not ( = ?auto_35 ?auto_36 ) ) ( not ( = ?auto_35 ?auto_42 ) ) ( not ( = ?auto_36 ?auto_42 ) ) ( not ( = ?auto_37 ?auto_41 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_39 ?auto_38 ?auto_40 )
      ( !LIFT ?auto_41 ?auto_36 ?auto_42 ?auto_40 )
      ( !LOAD ?auto_41 ?auto_36 ?auto_39 ?auto_40 )
      ( !DRIVE ?auto_39 ?auto_40 ?auto_38 )
      ( !UNLOAD ?auto_37 ?auto_36 ?auto_39 ?auto_38 )
      ( !DROP ?auto_37 ?auto_36 ?auto_35 ?auto_38 )
      ( MAKE-1CRATE-VERIFY ?auto_35 ?auto_36 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_45 - SURFACE
      ?auto_46 - SURFACE
    )
    :vars
    (
      ?auto_47 - HOIST
      ?auto_48 - PLACE
      ?auto_50 - PLACE
      ?auto_51 - HOIST
      ?auto_52 - SURFACE
      ?auto_49 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_47 ?auto_48 ) ( SURFACE-AT ?auto_45 ?auto_48 ) ( CLEAR ?auto_45 ) ( IS-CRATE ?auto_46 ) ( AVAILABLE ?auto_47 ) ( not ( = ?auto_50 ?auto_48 ) ) ( HOIST-AT ?auto_51 ?auto_50 ) ( AVAILABLE ?auto_51 ) ( SURFACE-AT ?auto_46 ?auto_50 ) ( ON ?auto_46 ?auto_52 ) ( CLEAR ?auto_46 ) ( TRUCK-AT ?auto_49 ?auto_48 ) ( not ( = ?auto_45 ?auto_46 ) ) ( not ( = ?auto_45 ?auto_52 ) ) ( not ( = ?auto_46 ?auto_52 ) ) ( not ( = ?auto_47 ?auto_51 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_49 ?auto_48 ?auto_50 )
      ( !LIFT ?auto_51 ?auto_46 ?auto_52 ?auto_50 )
      ( !LOAD ?auto_51 ?auto_46 ?auto_49 ?auto_50 )
      ( !DRIVE ?auto_49 ?auto_50 ?auto_48 )
      ( !UNLOAD ?auto_47 ?auto_46 ?auto_49 ?auto_48 )
      ( !DROP ?auto_47 ?auto_46 ?auto_45 ?auto_48 )
      ( MAKE-1CRATE-VERIFY ?auto_45 ?auto_46 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_56 - SURFACE
      ?auto_57 - SURFACE
      ?auto_58 - SURFACE
    )
    :vars
    (
      ?auto_62 - HOIST
      ?auto_64 - PLACE
      ?auto_60 - PLACE
      ?auto_63 - HOIST
      ?auto_61 - SURFACE
      ?auto_65 - PLACE
      ?auto_66 - HOIST
      ?auto_67 - SURFACE
      ?auto_59 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_62 ?auto_64 ) ( IS-CRATE ?auto_58 ) ( not ( = ?auto_60 ?auto_64 ) ) ( HOIST-AT ?auto_63 ?auto_60 ) ( AVAILABLE ?auto_63 ) ( SURFACE-AT ?auto_58 ?auto_60 ) ( ON ?auto_58 ?auto_61 ) ( CLEAR ?auto_58 ) ( not ( = ?auto_57 ?auto_58 ) ) ( not ( = ?auto_57 ?auto_61 ) ) ( not ( = ?auto_58 ?auto_61 ) ) ( not ( = ?auto_62 ?auto_63 ) ) ( SURFACE-AT ?auto_56 ?auto_64 ) ( CLEAR ?auto_56 ) ( IS-CRATE ?auto_57 ) ( AVAILABLE ?auto_62 ) ( not ( = ?auto_65 ?auto_64 ) ) ( HOIST-AT ?auto_66 ?auto_65 ) ( AVAILABLE ?auto_66 ) ( SURFACE-AT ?auto_57 ?auto_65 ) ( ON ?auto_57 ?auto_67 ) ( CLEAR ?auto_57 ) ( TRUCK-AT ?auto_59 ?auto_64 ) ( not ( = ?auto_56 ?auto_57 ) ) ( not ( = ?auto_56 ?auto_67 ) ) ( not ( = ?auto_57 ?auto_67 ) ) ( not ( = ?auto_62 ?auto_66 ) ) ( not ( = ?auto_56 ?auto_58 ) ) ( not ( = ?auto_56 ?auto_61 ) ) ( not ( = ?auto_58 ?auto_67 ) ) ( not ( = ?auto_60 ?auto_65 ) ) ( not ( = ?auto_63 ?auto_66 ) ) ( not ( = ?auto_61 ?auto_67 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_56 ?auto_57 )
      ( MAKE-1CRATE ?auto_57 ?auto_58 )
      ( MAKE-2CRATE-VERIFY ?auto_56 ?auto_57 ?auto_58 ) )
  )

)

