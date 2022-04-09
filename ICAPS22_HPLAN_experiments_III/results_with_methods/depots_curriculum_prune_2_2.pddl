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
      ?auto_70 - SURFACE
      ?auto_71 - SURFACE
    )
    :vars
    (
      ?auto_72 - HOIST
      ?auto_73 - PLACE
      ?auto_75 - PLACE
      ?auto_76 - HOIST
      ?auto_77 - SURFACE
      ?auto_74 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72 ?auto_73 ) ( SURFACE-AT ?auto_70 ?auto_73 ) ( CLEAR ?auto_70 ) ( IS-CRATE ?auto_71 ) ( AVAILABLE ?auto_72 ) ( not ( = ?auto_75 ?auto_73 ) ) ( HOIST-AT ?auto_76 ?auto_75 ) ( AVAILABLE ?auto_76 ) ( SURFACE-AT ?auto_71 ?auto_75 ) ( ON ?auto_71 ?auto_77 ) ( CLEAR ?auto_71 ) ( TRUCK-AT ?auto_74 ?auto_73 ) ( not ( = ?auto_70 ?auto_71 ) ) ( not ( = ?auto_70 ?auto_77 ) ) ( not ( = ?auto_71 ?auto_77 ) ) ( not ( = ?auto_72 ?auto_76 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_74 ?auto_73 ?auto_75 )
      ( !LIFT ?auto_76 ?auto_71 ?auto_77 ?auto_75 )
      ( !LOAD ?auto_76 ?auto_71 ?auto_74 ?auto_75 )
      ( !DRIVE ?auto_74 ?auto_75 ?auto_73 )
      ( !UNLOAD ?auto_72 ?auto_71 ?auto_74 ?auto_73 )
      ( !DROP ?auto_72 ?auto_71 ?auto_70 ?auto_73 )
      ( MAKE-1CRATE-VERIFY ?auto_70 ?auto_71 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_91 - SURFACE
      ?auto_92 - SURFACE
      ?auto_93 - SURFACE
    )
    :vars
    (
      ?auto_98 - HOIST
      ?auto_94 - PLACE
      ?auto_96 - PLACE
      ?auto_95 - HOIST
      ?auto_99 - SURFACE
      ?auto_100 - SURFACE
      ?auto_97 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98 ?auto_94 ) ( IS-CRATE ?auto_93 ) ( not ( = ?auto_96 ?auto_94 ) ) ( HOIST-AT ?auto_95 ?auto_96 ) ( SURFACE-AT ?auto_93 ?auto_96 ) ( ON ?auto_93 ?auto_99 ) ( CLEAR ?auto_93 ) ( not ( = ?auto_92 ?auto_93 ) ) ( not ( = ?auto_92 ?auto_99 ) ) ( not ( = ?auto_93 ?auto_99 ) ) ( not ( = ?auto_98 ?auto_95 ) ) ( SURFACE-AT ?auto_91 ?auto_94 ) ( CLEAR ?auto_91 ) ( IS-CRATE ?auto_92 ) ( AVAILABLE ?auto_98 ) ( AVAILABLE ?auto_95 ) ( SURFACE-AT ?auto_92 ?auto_96 ) ( ON ?auto_92 ?auto_100 ) ( CLEAR ?auto_92 ) ( TRUCK-AT ?auto_97 ?auto_94 ) ( not ( = ?auto_91 ?auto_92 ) ) ( not ( = ?auto_91 ?auto_100 ) ) ( not ( = ?auto_92 ?auto_100 ) ) ( not ( = ?auto_91 ?auto_93 ) ) ( not ( = ?auto_91 ?auto_99 ) ) ( not ( = ?auto_93 ?auto_100 ) ) ( not ( = ?auto_99 ?auto_100 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_91 ?auto_92 )
      ( MAKE-1CRATE ?auto_92 ?auto_93 )
      ( MAKE-2CRATE-VERIFY ?auto_91 ?auto_92 ?auto_93 ) )
  )

)

