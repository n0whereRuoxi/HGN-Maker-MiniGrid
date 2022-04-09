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

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1702997 - SURFACE
      ?auto_1702998 - SURFACE
    )
    :vars
    (
      ?auto_1702999 - HOIST
      ?auto_1703000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1702999 ?auto_1703000 ) ( SURFACE-AT ?auto_1702997 ?auto_1703000 ) ( CLEAR ?auto_1702997 ) ( LIFTING ?auto_1702999 ?auto_1702998 ) ( IS-CRATE ?auto_1702998 ) ( not ( = ?auto_1702997 ?auto_1702998 ) ) )
    :subtasks
    ( ( !DROP ?auto_1702999 ?auto_1702998 ?auto_1702997 ?auto_1703000 )
      ( MAKE-1CRATE-VERIFY ?auto_1702997 ?auto_1702998 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703001 - SURFACE
      ?auto_1703002 - SURFACE
    )
    :vars
    (
      ?auto_1703003 - HOIST
      ?auto_1703004 - PLACE
      ?auto_1703005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703003 ?auto_1703004 ) ( SURFACE-AT ?auto_1703001 ?auto_1703004 ) ( CLEAR ?auto_1703001 ) ( IS-CRATE ?auto_1703002 ) ( not ( = ?auto_1703001 ?auto_1703002 ) ) ( TRUCK-AT ?auto_1703005 ?auto_1703004 ) ( AVAILABLE ?auto_1703003 ) ( IN ?auto_1703002 ?auto_1703005 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1703003 ?auto_1703002 ?auto_1703005 ?auto_1703004 )
      ( MAKE-1CRATE ?auto_1703001 ?auto_1703002 )
      ( MAKE-1CRATE-VERIFY ?auto_1703001 ?auto_1703002 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703006 - SURFACE
      ?auto_1703007 - SURFACE
    )
    :vars
    (
      ?auto_1703008 - HOIST
      ?auto_1703009 - PLACE
      ?auto_1703010 - TRUCK
      ?auto_1703011 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703008 ?auto_1703009 ) ( SURFACE-AT ?auto_1703006 ?auto_1703009 ) ( CLEAR ?auto_1703006 ) ( IS-CRATE ?auto_1703007 ) ( not ( = ?auto_1703006 ?auto_1703007 ) ) ( AVAILABLE ?auto_1703008 ) ( IN ?auto_1703007 ?auto_1703010 ) ( TRUCK-AT ?auto_1703010 ?auto_1703011 ) ( not ( = ?auto_1703011 ?auto_1703009 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1703010 ?auto_1703011 ?auto_1703009 )
      ( MAKE-1CRATE ?auto_1703006 ?auto_1703007 )
      ( MAKE-1CRATE-VERIFY ?auto_1703006 ?auto_1703007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703012 - SURFACE
      ?auto_1703013 - SURFACE
    )
    :vars
    (
      ?auto_1703014 - HOIST
      ?auto_1703017 - PLACE
      ?auto_1703015 - TRUCK
      ?auto_1703016 - PLACE
      ?auto_1703018 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703014 ?auto_1703017 ) ( SURFACE-AT ?auto_1703012 ?auto_1703017 ) ( CLEAR ?auto_1703012 ) ( IS-CRATE ?auto_1703013 ) ( not ( = ?auto_1703012 ?auto_1703013 ) ) ( AVAILABLE ?auto_1703014 ) ( TRUCK-AT ?auto_1703015 ?auto_1703016 ) ( not ( = ?auto_1703016 ?auto_1703017 ) ) ( HOIST-AT ?auto_1703018 ?auto_1703016 ) ( LIFTING ?auto_1703018 ?auto_1703013 ) ( not ( = ?auto_1703014 ?auto_1703018 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1703018 ?auto_1703013 ?auto_1703015 ?auto_1703016 )
      ( MAKE-1CRATE ?auto_1703012 ?auto_1703013 )
      ( MAKE-1CRATE-VERIFY ?auto_1703012 ?auto_1703013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703019 - SURFACE
      ?auto_1703020 - SURFACE
    )
    :vars
    (
      ?auto_1703022 - HOIST
      ?auto_1703021 - PLACE
      ?auto_1703024 - TRUCK
      ?auto_1703023 - PLACE
      ?auto_1703025 - HOIST
      ?auto_1703026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703022 ?auto_1703021 ) ( SURFACE-AT ?auto_1703019 ?auto_1703021 ) ( CLEAR ?auto_1703019 ) ( IS-CRATE ?auto_1703020 ) ( not ( = ?auto_1703019 ?auto_1703020 ) ) ( AVAILABLE ?auto_1703022 ) ( TRUCK-AT ?auto_1703024 ?auto_1703023 ) ( not ( = ?auto_1703023 ?auto_1703021 ) ) ( HOIST-AT ?auto_1703025 ?auto_1703023 ) ( not ( = ?auto_1703022 ?auto_1703025 ) ) ( AVAILABLE ?auto_1703025 ) ( SURFACE-AT ?auto_1703020 ?auto_1703023 ) ( ON ?auto_1703020 ?auto_1703026 ) ( CLEAR ?auto_1703020 ) ( not ( = ?auto_1703019 ?auto_1703026 ) ) ( not ( = ?auto_1703020 ?auto_1703026 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1703025 ?auto_1703020 ?auto_1703026 ?auto_1703023 )
      ( MAKE-1CRATE ?auto_1703019 ?auto_1703020 )
      ( MAKE-1CRATE-VERIFY ?auto_1703019 ?auto_1703020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703027 - SURFACE
      ?auto_1703028 - SURFACE
    )
    :vars
    (
      ?auto_1703032 - HOIST
      ?auto_1703033 - PLACE
      ?auto_1703034 - PLACE
      ?auto_1703029 - HOIST
      ?auto_1703030 - SURFACE
      ?auto_1703031 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703032 ?auto_1703033 ) ( SURFACE-AT ?auto_1703027 ?auto_1703033 ) ( CLEAR ?auto_1703027 ) ( IS-CRATE ?auto_1703028 ) ( not ( = ?auto_1703027 ?auto_1703028 ) ) ( AVAILABLE ?auto_1703032 ) ( not ( = ?auto_1703034 ?auto_1703033 ) ) ( HOIST-AT ?auto_1703029 ?auto_1703034 ) ( not ( = ?auto_1703032 ?auto_1703029 ) ) ( AVAILABLE ?auto_1703029 ) ( SURFACE-AT ?auto_1703028 ?auto_1703034 ) ( ON ?auto_1703028 ?auto_1703030 ) ( CLEAR ?auto_1703028 ) ( not ( = ?auto_1703027 ?auto_1703030 ) ) ( not ( = ?auto_1703028 ?auto_1703030 ) ) ( TRUCK-AT ?auto_1703031 ?auto_1703033 ) )
    :subtasks
    ( ( !DRIVE ?auto_1703031 ?auto_1703033 ?auto_1703034 )
      ( MAKE-1CRATE ?auto_1703027 ?auto_1703028 )
      ( MAKE-1CRATE-VERIFY ?auto_1703027 ?auto_1703028 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703044 - SURFACE
      ?auto_1703045 - SURFACE
      ?auto_1703046 - SURFACE
    )
    :vars
    (
      ?auto_1703048 - HOIST
      ?auto_1703047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703048 ?auto_1703047 ) ( SURFACE-AT ?auto_1703045 ?auto_1703047 ) ( CLEAR ?auto_1703045 ) ( LIFTING ?auto_1703048 ?auto_1703046 ) ( IS-CRATE ?auto_1703046 ) ( not ( = ?auto_1703045 ?auto_1703046 ) ) ( ON ?auto_1703045 ?auto_1703044 ) ( not ( = ?auto_1703044 ?auto_1703045 ) ) ( not ( = ?auto_1703044 ?auto_1703046 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703045 ?auto_1703046 )
      ( MAKE-2CRATE-VERIFY ?auto_1703044 ?auto_1703045 ?auto_1703046 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703054 - SURFACE
      ?auto_1703055 - SURFACE
      ?auto_1703056 - SURFACE
    )
    :vars
    (
      ?auto_1703057 - HOIST
      ?auto_1703058 - PLACE
      ?auto_1703059 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703057 ?auto_1703058 ) ( SURFACE-AT ?auto_1703055 ?auto_1703058 ) ( CLEAR ?auto_1703055 ) ( IS-CRATE ?auto_1703056 ) ( not ( = ?auto_1703055 ?auto_1703056 ) ) ( TRUCK-AT ?auto_1703059 ?auto_1703058 ) ( AVAILABLE ?auto_1703057 ) ( IN ?auto_1703056 ?auto_1703059 ) ( ON ?auto_1703055 ?auto_1703054 ) ( not ( = ?auto_1703054 ?auto_1703055 ) ) ( not ( = ?auto_1703054 ?auto_1703056 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703055 ?auto_1703056 )
      ( MAKE-2CRATE-VERIFY ?auto_1703054 ?auto_1703055 ?auto_1703056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703060 - SURFACE
      ?auto_1703061 - SURFACE
    )
    :vars
    (
      ?auto_1703062 - HOIST
      ?auto_1703065 - PLACE
      ?auto_1703064 - TRUCK
      ?auto_1703063 - SURFACE
      ?auto_1703066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703062 ?auto_1703065 ) ( SURFACE-AT ?auto_1703060 ?auto_1703065 ) ( CLEAR ?auto_1703060 ) ( IS-CRATE ?auto_1703061 ) ( not ( = ?auto_1703060 ?auto_1703061 ) ) ( AVAILABLE ?auto_1703062 ) ( IN ?auto_1703061 ?auto_1703064 ) ( ON ?auto_1703060 ?auto_1703063 ) ( not ( = ?auto_1703063 ?auto_1703060 ) ) ( not ( = ?auto_1703063 ?auto_1703061 ) ) ( TRUCK-AT ?auto_1703064 ?auto_1703066 ) ( not ( = ?auto_1703066 ?auto_1703065 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1703064 ?auto_1703066 ?auto_1703065 )
      ( MAKE-2CRATE ?auto_1703063 ?auto_1703060 ?auto_1703061 )
      ( MAKE-1CRATE-VERIFY ?auto_1703060 ?auto_1703061 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703067 - SURFACE
      ?auto_1703068 - SURFACE
      ?auto_1703069 - SURFACE
    )
    :vars
    (
      ?auto_1703071 - HOIST
      ?auto_1703070 - PLACE
      ?auto_1703072 - TRUCK
      ?auto_1703073 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703071 ?auto_1703070 ) ( SURFACE-AT ?auto_1703068 ?auto_1703070 ) ( CLEAR ?auto_1703068 ) ( IS-CRATE ?auto_1703069 ) ( not ( = ?auto_1703068 ?auto_1703069 ) ) ( AVAILABLE ?auto_1703071 ) ( IN ?auto_1703069 ?auto_1703072 ) ( ON ?auto_1703068 ?auto_1703067 ) ( not ( = ?auto_1703067 ?auto_1703068 ) ) ( not ( = ?auto_1703067 ?auto_1703069 ) ) ( TRUCK-AT ?auto_1703072 ?auto_1703073 ) ( not ( = ?auto_1703073 ?auto_1703070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703068 ?auto_1703069 )
      ( MAKE-2CRATE-VERIFY ?auto_1703067 ?auto_1703068 ?auto_1703069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703074 - SURFACE
      ?auto_1703075 - SURFACE
    )
    :vars
    (
      ?auto_1703079 - HOIST
      ?auto_1703080 - PLACE
      ?auto_1703076 - SURFACE
      ?auto_1703077 - TRUCK
      ?auto_1703078 - PLACE
      ?auto_1703081 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703079 ?auto_1703080 ) ( SURFACE-AT ?auto_1703074 ?auto_1703080 ) ( CLEAR ?auto_1703074 ) ( IS-CRATE ?auto_1703075 ) ( not ( = ?auto_1703074 ?auto_1703075 ) ) ( AVAILABLE ?auto_1703079 ) ( ON ?auto_1703074 ?auto_1703076 ) ( not ( = ?auto_1703076 ?auto_1703074 ) ) ( not ( = ?auto_1703076 ?auto_1703075 ) ) ( TRUCK-AT ?auto_1703077 ?auto_1703078 ) ( not ( = ?auto_1703078 ?auto_1703080 ) ) ( HOIST-AT ?auto_1703081 ?auto_1703078 ) ( LIFTING ?auto_1703081 ?auto_1703075 ) ( not ( = ?auto_1703079 ?auto_1703081 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1703081 ?auto_1703075 ?auto_1703077 ?auto_1703078 )
      ( MAKE-2CRATE ?auto_1703076 ?auto_1703074 ?auto_1703075 )
      ( MAKE-1CRATE-VERIFY ?auto_1703074 ?auto_1703075 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703082 - SURFACE
      ?auto_1703083 - SURFACE
      ?auto_1703084 - SURFACE
    )
    :vars
    (
      ?auto_1703089 - HOIST
      ?auto_1703087 - PLACE
      ?auto_1703088 - TRUCK
      ?auto_1703085 - PLACE
      ?auto_1703086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703089 ?auto_1703087 ) ( SURFACE-AT ?auto_1703083 ?auto_1703087 ) ( CLEAR ?auto_1703083 ) ( IS-CRATE ?auto_1703084 ) ( not ( = ?auto_1703083 ?auto_1703084 ) ) ( AVAILABLE ?auto_1703089 ) ( ON ?auto_1703083 ?auto_1703082 ) ( not ( = ?auto_1703082 ?auto_1703083 ) ) ( not ( = ?auto_1703082 ?auto_1703084 ) ) ( TRUCK-AT ?auto_1703088 ?auto_1703085 ) ( not ( = ?auto_1703085 ?auto_1703087 ) ) ( HOIST-AT ?auto_1703086 ?auto_1703085 ) ( LIFTING ?auto_1703086 ?auto_1703084 ) ( not ( = ?auto_1703089 ?auto_1703086 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703083 ?auto_1703084 )
      ( MAKE-2CRATE-VERIFY ?auto_1703082 ?auto_1703083 ?auto_1703084 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703090 - SURFACE
      ?auto_1703091 - SURFACE
    )
    :vars
    (
      ?auto_1703092 - HOIST
      ?auto_1703095 - PLACE
      ?auto_1703094 - SURFACE
      ?auto_1703093 - TRUCK
      ?auto_1703096 - PLACE
      ?auto_1703097 - HOIST
      ?auto_1703098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703092 ?auto_1703095 ) ( SURFACE-AT ?auto_1703090 ?auto_1703095 ) ( CLEAR ?auto_1703090 ) ( IS-CRATE ?auto_1703091 ) ( not ( = ?auto_1703090 ?auto_1703091 ) ) ( AVAILABLE ?auto_1703092 ) ( ON ?auto_1703090 ?auto_1703094 ) ( not ( = ?auto_1703094 ?auto_1703090 ) ) ( not ( = ?auto_1703094 ?auto_1703091 ) ) ( TRUCK-AT ?auto_1703093 ?auto_1703096 ) ( not ( = ?auto_1703096 ?auto_1703095 ) ) ( HOIST-AT ?auto_1703097 ?auto_1703096 ) ( not ( = ?auto_1703092 ?auto_1703097 ) ) ( AVAILABLE ?auto_1703097 ) ( SURFACE-AT ?auto_1703091 ?auto_1703096 ) ( ON ?auto_1703091 ?auto_1703098 ) ( CLEAR ?auto_1703091 ) ( not ( = ?auto_1703090 ?auto_1703098 ) ) ( not ( = ?auto_1703091 ?auto_1703098 ) ) ( not ( = ?auto_1703094 ?auto_1703098 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1703097 ?auto_1703091 ?auto_1703098 ?auto_1703096 )
      ( MAKE-2CRATE ?auto_1703094 ?auto_1703090 ?auto_1703091 )
      ( MAKE-1CRATE-VERIFY ?auto_1703090 ?auto_1703091 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703099 - SURFACE
      ?auto_1703100 - SURFACE
      ?auto_1703101 - SURFACE
    )
    :vars
    (
      ?auto_1703103 - HOIST
      ?auto_1703104 - PLACE
      ?auto_1703102 - TRUCK
      ?auto_1703107 - PLACE
      ?auto_1703106 - HOIST
      ?auto_1703105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703103 ?auto_1703104 ) ( SURFACE-AT ?auto_1703100 ?auto_1703104 ) ( CLEAR ?auto_1703100 ) ( IS-CRATE ?auto_1703101 ) ( not ( = ?auto_1703100 ?auto_1703101 ) ) ( AVAILABLE ?auto_1703103 ) ( ON ?auto_1703100 ?auto_1703099 ) ( not ( = ?auto_1703099 ?auto_1703100 ) ) ( not ( = ?auto_1703099 ?auto_1703101 ) ) ( TRUCK-AT ?auto_1703102 ?auto_1703107 ) ( not ( = ?auto_1703107 ?auto_1703104 ) ) ( HOIST-AT ?auto_1703106 ?auto_1703107 ) ( not ( = ?auto_1703103 ?auto_1703106 ) ) ( AVAILABLE ?auto_1703106 ) ( SURFACE-AT ?auto_1703101 ?auto_1703107 ) ( ON ?auto_1703101 ?auto_1703105 ) ( CLEAR ?auto_1703101 ) ( not ( = ?auto_1703100 ?auto_1703105 ) ) ( not ( = ?auto_1703101 ?auto_1703105 ) ) ( not ( = ?auto_1703099 ?auto_1703105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703100 ?auto_1703101 )
      ( MAKE-2CRATE-VERIFY ?auto_1703099 ?auto_1703100 ?auto_1703101 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703108 - SURFACE
      ?auto_1703109 - SURFACE
    )
    :vars
    (
      ?auto_1703112 - HOIST
      ?auto_1703115 - PLACE
      ?auto_1703110 - SURFACE
      ?auto_1703114 - PLACE
      ?auto_1703113 - HOIST
      ?auto_1703111 - SURFACE
      ?auto_1703116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703112 ?auto_1703115 ) ( SURFACE-AT ?auto_1703108 ?auto_1703115 ) ( CLEAR ?auto_1703108 ) ( IS-CRATE ?auto_1703109 ) ( not ( = ?auto_1703108 ?auto_1703109 ) ) ( AVAILABLE ?auto_1703112 ) ( ON ?auto_1703108 ?auto_1703110 ) ( not ( = ?auto_1703110 ?auto_1703108 ) ) ( not ( = ?auto_1703110 ?auto_1703109 ) ) ( not ( = ?auto_1703114 ?auto_1703115 ) ) ( HOIST-AT ?auto_1703113 ?auto_1703114 ) ( not ( = ?auto_1703112 ?auto_1703113 ) ) ( AVAILABLE ?auto_1703113 ) ( SURFACE-AT ?auto_1703109 ?auto_1703114 ) ( ON ?auto_1703109 ?auto_1703111 ) ( CLEAR ?auto_1703109 ) ( not ( = ?auto_1703108 ?auto_1703111 ) ) ( not ( = ?auto_1703109 ?auto_1703111 ) ) ( not ( = ?auto_1703110 ?auto_1703111 ) ) ( TRUCK-AT ?auto_1703116 ?auto_1703115 ) )
    :subtasks
    ( ( !DRIVE ?auto_1703116 ?auto_1703115 ?auto_1703114 )
      ( MAKE-2CRATE ?auto_1703110 ?auto_1703108 ?auto_1703109 )
      ( MAKE-1CRATE-VERIFY ?auto_1703108 ?auto_1703109 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703117 - SURFACE
      ?auto_1703118 - SURFACE
      ?auto_1703119 - SURFACE
    )
    :vars
    (
      ?auto_1703120 - HOIST
      ?auto_1703121 - PLACE
      ?auto_1703125 - PLACE
      ?auto_1703124 - HOIST
      ?auto_1703122 - SURFACE
      ?auto_1703123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703120 ?auto_1703121 ) ( SURFACE-AT ?auto_1703118 ?auto_1703121 ) ( CLEAR ?auto_1703118 ) ( IS-CRATE ?auto_1703119 ) ( not ( = ?auto_1703118 ?auto_1703119 ) ) ( AVAILABLE ?auto_1703120 ) ( ON ?auto_1703118 ?auto_1703117 ) ( not ( = ?auto_1703117 ?auto_1703118 ) ) ( not ( = ?auto_1703117 ?auto_1703119 ) ) ( not ( = ?auto_1703125 ?auto_1703121 ) ) ( HOIST-AT ?auto_1703124 ?auto_1703125 ) ( not ( = ?auto_1703120 ?auto_1703124 ) ) ( AVAILABLE ?auto_1703124 ) ( SURFACE-AT ?auto_1703119 ?auto_1703125 ) ( ON ?auto_1703119 ?auto_1703122 ) ( CLEAR ?auto_1703119 ) ( not ( = ?auto_1703118 ?auto_1703122 ) ) ( not ( = ?auto_1703119 ?auto_1703122 ) ) ( not ( = ?auto_1703117 ?auto_1703122 ) ) ( TRUCK-AT ?auto_1703123 ?auto_1703121 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703118 ?auto_1703119 )
      ( MAKE-2CRATE-VERIFY ?auto_1703117 ?auto_1703118 ?auto_1703119 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703126 - SURFACE
      ?auto_1703127 - SURFACE
    )
    :vars
    (
      ?auto_1703129 - HOIST
      ?auto_1703133 - PLACE
      ?auto_1703131 - SURFACE
      ?auto_1703132 - PLACE
      ?auto_1703128 - HOIST
      ?auto_1703134 - SURFACE
      ?auto_1703130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703129 ?auto_1703133 ) ( IS-CRATE ?auto_1703127 ) ( not ( = ?auto_1703126 ?auto_1703127 ) ) ( not ( = ?auto_1703131 ?auto_1703126 ) ) ( not ( = ?auto_1703131 ?auto_1703127 ) ) ( not ( = ?auto_1703132 ?auto_1703133 ) ) ( HOIST-AT ?auto_1703128 ?auto_1703132 ) ( not ( = ?auto_1703129 ?auto_1703128 ) ) ( AVAILABLE ?auto_1703128 ) ( SURFACE-AT ?auto_1703127 ?auto_1703132 ) ( ON ?auto_1703127 ?auto_1703134 ) ( CLEAR ?auto_1703127 ) ( not ( = ?auto_1703126 ?auto_1703134 ) ) ( not ( = ?auto_1703127 ?auto_1703134 ) ) ( not ( = ?auto_1703131 ?auto_1703134 ) ) ( TRUCK-AT ?auto_1703130 ?auto_1703133 ) ( SURFACE-AT ?auto_1703131 ?auto_1703133 ) ( CLEAR ?auto_1703131 ) ( LIFTING ?auto_1703129 ?auto_1703126 ) ( IS-CRATE ?auto_1703126 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703131 ?auto_1703126 )
      ( MAKE-2CRATE ?auto_1703131 ?auto_1703126 ?auto_1703127 )
      ( MAKE-1CRATE-VERIFY ?auto_1703126 ?auto_1703127 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703135 - SURFACE
      ?auto_1703136 - SURFACE
      ?auto_1703137 - SURFACE
    )
    :vars
    (
      ?auto_1703141 - HOIST
      ?auto_1703143 - PLACE
      ?auto_1703138 - PLACE
      ?auto_1703140 - HOIST
      ?auto_1703139 - SURFACE
      ?auto_1703142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703141 ?auto_1703143 ) ( IS-CRATE ?auto_1703137 ) ( not ( = ?auto_1703136 ?auto_1703137 ) ) ( not ( = ?auto_1703135 ?auto_1703136 ) ) ( not ( = ?auto_1703135 ?auto_1703137 ) ) ( not ( = ?auto_1703138 ?auto_1703143 ) ) ( HOIST-AT ?auto_1703140 ?auto_1703138 ) ( not ( = ?auto_1703141 ?auto_1703140 ) ) ( AVAILABLE ?auto_1703140 ) ( SURFACE-AT ?auto_1703137 ?auto_1703138 ) ( ON ?auto_1703137 ?auto_1703139 ) ( CLEAR ?auto_1703137 ) ( not ( = ?auto_1703136 ?auto_1703139 ) ) ( not ( = ?auto_1703137 ?auto_1703139 ) ) ( not ( = ?auto_1703135 ?auto_1703139 ) ) ( TRUCK-AT ?auto_1703142 ?auto_1703143 ) ( SURFACE-AT ?auto_1703135 ?auto_1703143 ) ( CLEAR ?auto_1703135 ) ( LIFTING ?auto_1703141 ?auto_1703136 ) ( IS-CRATE ?auto_1703136 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703136 ?auto_1703137 )
      ( MAKE-2CRATE-VERIFY ?auto_1703135 ?auto_1703136 ?auto_1703137 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703144 - SURFACE
      ?auto_1703145 - SURFACE
    )
    :vars
    (
      ?auto_1703151 - HOIST
      ?auto_1703150 - PLACE
      ?auto_1703146 - SURFACE
      ?auto_1703147 - PLACE
      ?auto_1703152 - HOIST
      ?auto_1703149 - SURFACE
      ?auto_1703148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703151 ?auto_1703150 ) ( IS-CRATE ?auto_1703145 ) ( not ( = ?auto_1703144 ?auto_1703145 ) ) ( not ( = ?auto_1703146 ?auto_1703144 ) ) ( not ( = ?auto_1703146 ?auto_1703145 ) ) ( not ( = ?auto_1703147 ?auto_1703150 ) ) ( HOIST-AT ?auto_1703152 ?auto_1703147 ) ( not ( = ?auto_1703151 ?auto_1703152 ) ) ( AVAILABLE ?auto_1703152 ) ( SURFACE-AT ?auto_1703145 ?auto_1703147 ) ( ON ?auto_1703145 ?auto_1703149 ) ( CLEAR ?auto_1703145 ) ( not ( = ?auto_1703144 ?auto_1703149 ) ) ( not ( = ?auto_1703145 ?auto_1703149 ) ) ( not ( = ?auto_1703146 ?auto_1703149 ) ) ( TRUCK-AT ?auto_1703148 ?auto_1703150 ) ( SURFACE-AT ?auto_1703146 ?auto_1703150 ) ( CLEAR ?auto_1703146 ) ( IS-CRATE ?auto_1703144 ) ( AVAILABLE ?auto_1703151 ) ( IN ?auto_1703144 ?auto_1703148 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1703151 ?auto_1703144 ?auto_1703148 ?auto_1703150 )
      ( MAKE-2CRATE ?auto_1703146 ?auto_1703144 ?auto_1703145 )
      ( MAKE-1CRATE-VERIFY ?auto_1703144 ?auto_1703145 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1703153 - SURFACE
      ?auto_1703154 - SURFACE
      ?auto_1703155 - SURFACE
    )
    :vars
    (
      ?auto_1703161 - HOIST
      ?auto_1703157 - PLACE
      ?auto_1703156 - PLACE
      ?auto_1703158 - HOIST
      ?auto_1703159 - SURFACE
      ?auto_1703160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703161 ?auto_1703157 ) ( IS-CRATE ?auto_1703155 ) ( not ( = ?auto_1703154 ?auto_1703155 ) ) ( not ( = ?auto_1703153 ?auto_1703154 ) ) ( not ( = ?auto_1703153 ?auto_1703155 ) ) ( not ( = ?auto_1703156 ?auto_1703157 ) ) ( HOIST-AT ?auto_1703158 ?auto_1703156 ) ( not ( = ?auto_1703161 ?auto_1703158 ) ) ( AVAILABLE ?auto_1703158 ) ( SURFACE-AT ?auto_1703155 ?auto_1703156 ) ( ON ?auto_1703155 ?auto_1703159 ) ( CLEAR ?auto_1703155 ) ( not ( = ?auto_1703154 ?auto_1703159 ) ) ( not ( = ?auto_1703155 ?auto_1703159 ) ) ( not ( = ?auto_1703153 ?auto_1703159 ) ) ( TRUCK-AT ?auto_1703160 ?auto_1703157 ) ( SURFACE-AT ?auto_1703153 ?auto_1703157 ) ( CLEAR ?auto_1703153 ) ( IS-CRATE ?auto_1703154 ) ( AVAILABLE ?auto_1703161 ) ( IN ?auto_1703154 ?auto_1703160 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703154 ?auto_1703155 )
      ( MAKE-2CRATE-VERIFY ?auto_1703153 ?auto_1703154 ?auto_1703155 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1703198 - SURFACE
      ?auto_1703199 - SURFACE
    )
    :vars
    (
      ?auto_1703203 - HOIST
      ?auto_1703202 - PLACE
      ?auto_1703200 - SURFACE
      ?auto_1703201 - PLACE
      ?auto_1703205 - HOIST
      ?auto_1703206 - SURFACE
      ?auto_1703204 - TRUCK
      ?auto_1703207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703203 ?auto_1703202 ) ( SURFACE-AT ?auto_1703198 ?auto_1703202 ) ( CLEAR ?auto_1703198 ) ( IS-CRATE ?auto_1703199 ) ( not ( = ?auto_1703198 ?auto_1703199 ) ) ( AVAILABLE ?auto_1703203 ) ( ON ?auto_1703198 ?auto_1703200 ) ( not ( = ?auto_1703200 ?auto_1703198 ) ) ( not ( = ?auto_1703200 ?auto_1703199 ) ) ( not ( = ?auto_1703201 ?auto_1703202 ) ) ( HOIST-AT ?auto_1703205 ?auto_1703201 ) ( not ( = ?auto_1703203 ?auto_1703205 ) ) ( AVAILABLE ?auto_1703205 ) ( SURFACE-AT ?auto_1703199 ?auto_1703201 ) ( ON ?auto_1703199 ?auto_1703206 ) ( CLEAR ?auto_1703199 ) ( not ( = ?auto_1703198 ?auto_1703206 ) ) ( not ( = ?auto_1703199 ?auto_1703206 ) ) ( not ( = ?auto_1703200 ?auto_1703206 ) ) ( TRUCK-AT ?auto_1703204 ?auto_1703207 ) ( not ( = ?auto_1703207 ?auto_1703202 ) ) ( not ( = ?auto_1703201 ?auto_1703207 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1703204 ?auto_1703207 ?auto_1703202 )
      ( MAKE-1CRATE ?auto_1703198 ?auto_1703199 )
      ( MAKE-1CRATE-VERIFY ?auto_1703198 ?auto_1703199 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703237 - SURFACE
      ?auto_1703238 - SURFACE
      ?auto_1703239 - SURFACE
      ?auto_1703240 - SURFACE
    )
    :vars
    (
      ?auto_1703242 - HOIST
      ?auto_1703241 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703242 ?auto_1703241 ) ( SURFACE-AT ?auto_1703239 ?auto_1703241 ) ( CLEAR ?auto_1703239 ) ( LIFTING ?auto_1703242 ?auto_1703240 ) ( IS-CRATE ?auto_1703240 ) ( not ( = ?auto_1703239 ?auto_1703240 ) ) ( ON ?auto_1703238 ?auto_1703237 ) ( ON ?auto_1703239 ?auto_1703238 ) ( not ( = ?auto_1703237 ?auto_1703238 ) ) ( not ( = ?auto_1703237 ?auto_1703239 ) ) ( not ( = ?auto_1703237 ?auto_1703240 ) ) ( not ( = ?auto_1703238 ?auto_1703239 ) ) ( not ( = ?auto_1703238 ?auto_1703240 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703239 ?auto_1703240 )
      ( MAKE-3CRATE-VERIFY ?auto_1703237 ?auto_1703238 ?auto_1703239 ?auto_1703240 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703254 - SURFACE
      ?auto_1703255 - SURFACE
      ?auto_1703256 - SURFACE
      ?auto_1703257 - SURFACE
    )
    :vars
    (
      ?auto_1703260 - HOIST
      ?auto_1703259 - PLACE
      ?auto_1703258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703260 ?auto_1703259 ) ( SURFACE-AT ?auto_1703256 ?auto_1703259 ) ( CLEAR ?auto_1703256 ) ( IS-CRATE ?auto_1703257 ) ( not ( = ?auto_1703256 ?auto_1703257 ) ) ( TRUCK-AT ?auto_1703258 ?auto_1703259 ) ( AVAILABLE ?auto_1703260 ) ( IN ?auto_1703257 ?auto_1703258 ) ( ON ?auto_1703256 ?auto_1703255 ) ( not ( = ?auto_1703255 ?auto_1703256 ) ) ( not ( = ?auto_1703255 ?auto_1703257 ) ) ( ON ?auto_1703255 ?auto_1703254 ) ( not ( = ?auto_1703254 ?auto_1703255 ) ) ( not ( = ?auto_1703254 ?auto_1703256 ) ) ( not ( = ?auto_1703254 ?auto_1703257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703255 ?auto_1703256 ?auto_1703257 )
      ( MAKE-3CRATE-VERIFY ?auto_1703254 ?auto_1703255 ?auto_1703256 ?auto_1703257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703275 - SURFACE
      ?auto_1703276 - SURFACE
      ?auto_1703277 - SURFACE
      ?auto_1703278 - SURFACE
    )
    :vars
    (
      ?auto_1703281 - HOIST
      ?auto_1703282 - PLACE
      ?auto_1703280 - TRUCK
      ?auto_1703279 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703281 ?auto_1703282 ) ( SURFACE-AT ?auto_1703277 ?auto_1703282 ) ( CLEAR ?auto_1703277 ) ( IS-CRATE ?auto_1703278 ) ( not ( = ?auto_1703277 ?auto_1703278 ) ) ( AVAILABLE ?auto_1703281 ) ( IN ?auto_1703278 ?auto_1703280 ) ( ON ?auto_1703277 ?auto_1703276 ) ( not ( = ?auto_1703276 ?auto_1703277 ) ) ( not ( = ?auto_1703276 ?auto_1703278 ) ) ( TRUCK-AT ?auto_1703280 ?auto_1703279 ) ( not ( = ?auto_1703279 ?auto_1703282 ) ) ( ON ?auto_1703276 ?auto_1703275 ) ( not ( = ?auto_1703275 ?auto_1703276 ) ) ( not ( = ?auto_1703275 ?auto_1703277 ) ) ( not ( = ?auto_1703275 ?auto_1703278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703276 ?auto_1703277 ?auto_1703278 )
      ( MAKE-3CRATE-VERIFY ?auto_1703275 ?auto_1703276 ?auto_1703277 ?auto_1703278 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703299 - SURFACE
      ?auto_1703300 - SURFACE
      ?auto_1703301 - SURFACE
      ?auto_1703302 - SURFACE
    )
    :vars
    (
      ?auto_1703306 - HOIST
      ?auto_1703304 - PLACE
      ?auto_1703307 - TRUCK
      ?auto_1703305 - PLACE
      ?auto_1703303 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703306 ?auto_1703304 ) ( SURFACE-AT ?auto_1703301 ?auto_1703304 ) ( CLEAR ?auto_1703301 ) ( IS-CRATE ?auto_1703302 ) ( not ( = ?auto_1703301 ?auto_1703302 ) ) ( AVAILABLE ?auto_1703306 ) ( ON ?auto_1703301 ?auto_1703300 ) ( not ( = ?auto_1703300 ?auto_1703301 ) ) ( not ( = ?auto_1703300 ?auto_1703302 ) ) ( TRUCK-AT ?auto_1703307 ?auto_1703305 ) ( not ( = ?auto_1703305 ?auto_1703304 ) ) ( HOIST-AT ?auto_1703303 ?auto_1703305 ) ( LIFTING ?auto_1703303 ?auto_1703302 ) ( not ( = ?auto_1703306 ?auto_1703303 ) ) ( ON ?auto_1703300 ?auto_1703299 ) ( not ( = ?auto_1703299 ?auto_1703300 ) ) ( not ( = ?auto_1703299 ?auto_1703301 ) ) ( not ( = ?auto_1703299 ?auto_1703302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703300 ?auto_1703301 ?auto_1703302 )
      ( MAKE-3CRATE-VERIFY ?auto_1703299 ?auto_1703300 ?auto_1703301 ?auto_1703302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703326 - SURFACE
      ?auto_1703327 - SURFACE
      ?auto_1703328 - SURFACE
      ?auto_1703329 - SURFACE
    )
    :vars
    (
      ?auto_1703333 - HOIST
      ?auto_1703332 - PLACE
      ?auto_1703330 - TRUCK
      ?auto_1703334 - PLACE
      ?auto_1703331 - HOIST
      ?auto_1703335 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703333 ?auto_1703332 ) ( SURFACE-AT ?auto_1703328 ?auto_1703332 ) ( CLEAR ?auto_1703328 ) ( IS-CRATE ?auto_1703329 ) ( not ( = ?auto_1703328 ?auto_1703329 ) ) ( AVAILABLE ?auto_1703333 ) ( ON ?auto_1703328 ?auto_1703327 ) ( not ( = ?auto_1703327 ?auto_1703328 ) ) ( not ( = ?auto_1703327 ?auto_1703329 ) ) ( TRUCK-AT ?auto_1703330 ?auto_1703334 ) ( not ( = ?auto_1703334 ?auto_1703332 ) ) ( HOIST-AT ?auto_1703331 ?auto_1703334 ) ( not ( = ?auto_1703333 ?auto_1703331 ) ) ( AVAILABLE ?auto_1703331 ) ( SURFACE-AT ?auto_1703329 ?auto_1703334 ) ( ON ?auto_1703329 ?auto_1703335 ) ( CLEAR ?auto_1703329 ) ( not ( = ?auto_1703328 ?auto_1703335 ) ) ( not ( = ?auto_1703329 ?auto_1703335 ) ) ( not ( = ?auto_1703327 ?auto_1703335 ) ) ( ON ?auto_1703327 ?auto_1703326 ) ( not ( = ?auto_1703326 ?auto_1703327 ) ) ( not ( = ?auto_1703326 ?auto_1703328 ) ) ( not ( = ?auto_1703326 ?auto_1703329 ) ) ( not ( = ?auto_1703326 ?auto_1703335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703327 ?auto_1703328 ?auto_1703329 )
      ( MAKE-3CRATE-VERIFY ?auto_1703326 ?auto_1703327 ?auto_1703328 ?auto_1703329 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703354 - SURFACE
      ?auto_1703355 - SURFACE
      ?auto_1703356 - SURFACE
      ?auto_1703357 - SURFACE
    )
    :vars
    (
      ?auto_1703363 - HOIST
      ?auto_1703360 - PLACE
      ?auto_1703361 - PLACE
      ?auto_1703358 - HOIST
      ?auto_1703362 - SURFACE
      ?auto_1703359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703363 ?auto_1703360 ) ( SURFACE-AT ?auto_1703356 ?auto_1703360 ) ( CLEAR ?auto_1703356 ) ( IS-CRATE ?auto_1703357 ) ( not ( = ?auto_1703356 ?auto_1703357 ) ) ( AVAILABLE ?auto_1703363 ) ( ON ?auto_1703356 ?auto_1703355 ) ( not ( = ?auto_1703355 ?auto_1703356 ) ) ( not ( = ?auto_1703355 ?auto_1703357 ) ) ( not ( = ?auto_1703361 ?auto_1703360 ) ) ( HOIST-AT ?auto_1703358 ?auto_1703361 ) ( not ( = ?auto_1703363 ?auto_1703358 ) ) ( AVAILABLE ?auto_1703358 ) ( SURFACE-AT ?auto_1703357 ?auto_1703361 ) ( ON ?auto_1703357 ?auto_1703362 ) ( CLEAR ?auto_1703357 ) ( not ( = ?auto_1703356 ?auto_1703362 ) ) ( not ( = ?auto_1703357 ?auto_1703362 ) ) ( not ( = ?auto_1703355 ?auto_1703362 ) ) ( TRUCK-AT ?auto_1703359 ?auto_1703360 ) ( ON ?auto_1703355 ?auto_1703354 ) ( not ( = ?auto_1703354 ?auto_1703355 ) ) ( not ( = ?auto_1703354 ?auto_1703356 ) ) ( not ( = ?auto_1703354 ?auto_1703357 ) ) ( not ( = ?auto_1703354 ?auto_1703362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703355 ?auto_1703356 ?auto_1703357 )
      ( MAKE-3CRATE-VERIFY ?auto_1703354 ?auto_1703355 ?auto_1703356 ?auto_1703357 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703382 - SURFACE
      ?auto_1703383 - SURFACE
      ?auto_1703384 - SURFACE
      ?auto_1703385 - SURFACE
    )
    :vars
    (
      ?auto_1703387 - HOIST
      ?auto_1703390 - PLACE
      ?auto_1703388 - PLACE
      ?auto_1703386 - HOIST
      ?auto_1703391 - SURFACE
      ?auto_1703389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703387 ?auto_1703390 ) ( IS-CRATE ?auto_1703385 ) ( not ( = ?auto_1703384 ?auto_1703385 ) ) ( not ( = ?auto_1703383 ?auto_1703384 ) ) ( not ( = ?auto_1703383 ?auto_1703385 ) ) ( not ( = ?auto_1703388 ?auto_1703390 ) ) ( HOIST-AT ?auto_1703386 ?auto_1703388 ) ( not ( = ?auto_1703387 ?auto_1703386 ) ) ( AVAILABLE ?auto_1703386 ) ( SURFACE-AT ?auto_1703385 ?auto_1703388 ) ( ON ?auto_1703385 ?auto_1703391 ) ( CLEAR ?auto_1703385 ) ( not ( = ?auto_1703384 ?auto_1703391 ) ) ( not ( = ?auto_1703385 ?auto_1703391 ) ) ( not ( = ?auto_1703383 ?auto_1703391 ) ) ( TRUCK-AT ?auto_1703389 ?auto_1703390 ) ( SURFACE-AT ?auto_1703383 ?auto_1703390 ) ( CLEAR ?auto_1703383 ) ( LIFTING ?auto_1703387 ?auto_1703384 ) ( IS-CRATE ?auto_1703384 ) ( ON ?auto_1703383 ?auto_1703382 ) ( not ( = ?auto_1703382 ?auto_1703383 ) ) ( not ( = ?auto_1703382 ?auto_1703384 ) ) ( not ( = ?auto_1703382 ?auto_1703385 ) ) ( not ( = ?auto_1703382 ?auto_1703391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703383 ?auto_1703384 ?auto_1703385 )
      ( MAKE-3CRATE-VERIFY ?auto_1703382 ?auto_1703383 ?auto_1703384 ?auto_1703385 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1703410 - SURFACE
      ?auto_1703411 - SURFACE
      ?auto_1703412 - SURFACE
      ?auto_1703413 - SURFACE
    )
    :vars
    (
      ?auto_1703414 - HOIST
      ?auto_1703419 - PLACE
      ?auto_1703417 - PLACE
      ?auto_1703418 - HOIST
      ?auto_1703416 - SURFACE
      ?auto_1703415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703414 ?auto_1703419 ) ( IS-CRATE ?auto_1703413 ) ( not ( = ?auto_1703412 ?auto_1703413 ) ) ( not ( = ?auto_1703411 ?auto_1703412 ) ) ( not ( = ?auto_1703411 ?auto_1703413 ) ) ( not ( = ?auto_1703417 ?auto_1703419 ) ) ( HOIST-AT ?auto_1703418 ?auto_1703417 ) ( not ( = ?auto_1703414 ?auto_1703418 ) ) ( AVAILABLE ?auto_1703418 ) ( SURFACE-AT ?auto_1703413 ?auto_1703417 ) ( ON ?auto_1703413 ?auto_1703416 ) ( CLEAR ?auto_1703413 ) ( not ( = ?auto_1703412 ?auto_1703416 ) ) ( not ( = ?auto_1703413 ?auto_1703416 ) ) ( not ( = ?auto_1703411 ?auto_1703416 ) ) ( TRUCK-AT ?auto_1703415 ?auto_1703419 ) ( SURFACE-AT ?auto_1703411 ?auto_1703419 ) ( CLEAR ?auto_1703411 ) ( IS-CRATE ?auto_1703412 ) ( AVAILABLE ?auto_1703414 ) ( IN ?auto_1703412 ?auto_1703415 ) ( ON ?auto_1703411 ?auto_1703410 ) ( not ( = ?auto_1703410 ?auto_1703411 ) ) ( not ( = ?auto_1703410 ?auto_1703412 ) ) ( not ( = ?auto_1703410 ?auto_1703413 ) ) ( not ( = ?auto_1703410 ?auto_1703416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703411 ?auto_1703412 ?auto_1703413 )
      ( MAKE-3CRATE-VERIFY ?auto_1703410 ?auto_1703411 ?auto_1703412 ?auto_1703413 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703701 - SURFACE
      ?auto_1703702 - SURFACE
      ?auto_1703703 - SURFACE
      ?auto_1703704 - SURFACE
      ?auto_1703705 - SURFACE
    )
    :vars
    (
      ?auto_1703707 - HOIST
      ?auto_1703706 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703707 ?auto_1703706 ) ( SURFACE-AT ?auto_1703704 ?auto_1703706 ) ( CLEAR ?auto_1703704 ) ( LIFTING ?auto_1703707 ?auto_1703705 ) ( IS-CRATE ?auto_1703705 ) ( not ( = ?auto_1703704 ?auto_1703705 ) ) ( ON ?auto_1703702 ?auto_1703701 ) ( ON ?auto_1703703 ?auto_1703702 ) ( ON ?auto_1703704 ?auto_1703703 ) ( not ( = ?auto_1703701 ?auto_1703702 ) ) ( not ( = ?auto_1703701 ?auto_1703703 ) ) ( not ( = ?auto_1703701 ?auto_1703704 ) ) ( not ( = ?auto_1703701 ?auto_1703705 ) ) ( not ( = ?auto_1703702 ?auto_1703703 ) ) ( not ( = ?auto_1703702 ?auto_1703704 ) ) ( not ( = ?auto_1703702 ?auto_1703705 ) ) ( not ( = ?auto_1703703 ?auto_1703704 ) ) ( not ( = ?auto_1703703 ?auto_1703705 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1703704 ?auto_1703705 )
      ( MAKE-4CRATE-VERIFY ?auto_1703701 ?auto_1703702 ?auto_1703703 ?auto_1703704 ?auto_1703705 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703726 - SURFACE
      ?auto_1703727 - SURFACE
      ?auto_1703728 - SURFACE
      ?auto_1703729 - SURFACE
      ?auto_1703730 - SURFACE
    )
    :vars
    (
      ?auto_1703731 - HOIST
      ?auto_1703732 - PLACE
      ?auto_1703733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703731 ?auto_1703732 ) ( SURFACE-AT ?auto_1703729 ?auto_1703732 ) ( CLEAR ?auto_1703729 ) ( IS-CRATE ?auto_1703730 ) ( not ( = ?auto_1703729 ?auto_1703730 ) ) ( TRUCK-AT ?auto_1703733 ?auto_1703732 ) ( AVAILABLE ?auto_1703731 ) ( IN ?auto_1703730 ?auto_1703733 ) ( ON ?auto_1703729 ?auto_1703728 ) ( not ( = ?auto_1703728 ?auto_1703729 ) ) ( not ( = ?auto_1703728 ?auto_1703730 ) ) ( ON ?auto_1703727 ?auto_1703726 ) ( ON ?auto_1703728 ?auto_1703727 ) ( not ( = ?auto_1703726 ?auto_1703727 ) ) ( not ( = ?auto_1703726 ?auto_1703728 ) ) ( not ( = ?auto_1703726 ?auto_1703729 ) ) ( not ( = ?auto_1703726 ?auto_1703730 ) ) ( not ( = ?auto_1703727 ?auto_1703728 ) ) ( not ( = ?auto_1703727 ?auto_1703729 ) ) ( not ( = ?auto_1703727 ?auto_1703730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703728 ?auto_1703729 ?auto_1703730 )
      ( MAKE-4CRATE-VERIFY ?auto_1703726 ?auto_1703727 ?auto_1703728 ?auto_1703729 ?auto_1703730 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703756 - SURFACE
      ?auto_1703757 - SURFACE
      ?auto_1703758 - SURFACE
      ?auto_1703759 - SURFACE
      ?auto_1703760 - SURFACE
    )
    :vars
    (
      ?auto_1703764 - HOIST
      ?auto_1703761 - PLACE
      ?auto_1703762 - TRUCK
      ?auto_1703763 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703764 ?auto_1703761 ) ( SURFACE-AT ?auto_1703759 ?auto_1703761 ) ( CLEAR ?auto_1703759 ) ( IS-CRATE ?auto_1703760 ) ( not ( = ?auto_1703759 ?auto_1703760 ) ) ( AVAILABLE ?auto_1703764 ) ( IN ?auto_1703760 ?auto_1703762 ) ( ON ?auto_1703759 ?auto_1703758 ) ( not ( = ?auto_1703758 ?auto_1703759 ) ) ( not ( = ?auto_1703758 ?auto_1703760 ) ) ( TRUCK-AT ?auto_1703762 ?auto_1703763 ) ( not ( = ?auto_1703763 ?auto_1703761 ) ) ( ON ?auto_1703757 ?auto_1703756 ) ( ON ?auto_1703758 ?auto_1703757 ) ( not ( = ?auto_1703756 ?auto_1703757 ) ) ( not ( = ?auto_1703756 ?auto_1703758 ) ) ( not ( = ?auto_1703756 ?auto_1703759 ) ) ( not ( = ?auto_1703756 ?auto_1703760 ) ) ( not ( = ?auto_1703757 ?auto_1703758 ) ) ( not ( = ?auto_1703757 ?auto_1703759 ) ) ( not ( = ?auto_1703757 ?auto_1703760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703758 ?auto_1703759 ?auto_1703760 )
      ( MAKE-4CRATE-VERIFY ?auto_1703756 ?auto_1703757 ?auto_1703758 ?auto_1703759 ?auto_1703760 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703790 - SURFACE
      ?auto_1703791 - SURFACE
      ?auto_1703792 - SURFACE
      ?auto_1703793 - SURFACE
      ?auto_1703794 - SURFACE
    )
    :vars
    (
      ?auto_1703796 - HOIST
      ?auto_1703799 - PLACE
      ?auto_1703798 - TRUCK
      ?auto_1703795 - PLACE
      ?auto_1703797 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703796 ?auto_1703799 ) ( SURFACE-AT ?auto_1703793 ?auto_1703799 ) ( CLEAR ?auto_1703793 ) ( IS-CRATE ?auto_1703794 ) ( not ( = ?auto_1703793 ?auto_1703794 ) ) ( AVAILABLE ?auto_1703796 ) ( ON ?auto_1703793 ?auto_1703792 ) ( not ( = ?auto_1703792 ?auto_1703793 ) ) ( not ( = ?auto_1703792 ?auto_1703794 ) ) ( TRUCK-AT ?auto_1703798 ?auto_1703795 ) ( not ( = ?auto_1703795 ?auto_1703799 ) ) ( HOIST-AT ?auto_1703797 ?auto_1703795 ) ( LIFTING ?auto_1703797 ?auto_1703794 ) ( not ( = ?auto_1703796 ?auto_1703797 ) ) ( ON ?auto_1703791 ?auto_1703790 ) ( ON ?auto_1703792 ?auto_1703791 ) ( not ( = ?auto_1703790 ?auto_1703791 ) ) ( not ( = ?auto_1703790 ?auto_1703792 ) ) ( not ( = ?auto_1703790 ?auto_1703793 ) ) ( not ( = ?auto_1703790 ?auto_1703794 ) ) ( not ( = ?auto_1703791 ?auto_1703792 ) ) ( not ( = ?auto_1703791 ?auto_1703793 ) ) ( not ( = ?auto_1703791 ?auto_1703794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703792 ?auto_1703793 ?auto_1703794 )
      ( MAKE-4CRATE-VERIFY ?auto_1703790 ?auto_1703791 ?auto_1703792 ?auto_1703793 ?auto_1703794 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703828 - SURFACE
      ?auto_1703829 - SURFACE
      ?auto_1703830 - SURFACE
      ?auto_1703831 - SURFACE
      ?auto_1703832 - SURFACE
    )
    :vars
    (
      ?auto_1703837 - HOIST
      ?auto_1703834 - PLACE
      ?auto_1703838 - TRUCK
      ?auto_1703836 - PLACE
      ?auto_1703833 - HOIST
      ?auto_1703835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703837 ?auto_1703834 ) ( SURFACE-AT ?auto_1703831 ?auto_1703834 ) ( CLEAR ?auto_1703831 ) ( IS-CRATE ?auto_1703832 ) ( not ( = ?auto_1703831 ?auto_1703832 ) ) ( AVAILABLE ?auto_1703837 ) ( ON ?auto_1703831 ?auto_1703830 ) ( not ( = ?auto_1703830 ?auto_1703831 ) ) ( not ( = ?auto_1703830 ?auto_1703832 ) ) ( TRUCK-AT ?auto_1703838 ?auto_1703836 ) ( not ( = ?auto_1703836 ?auto_1703834 ) ) ( HOIST-AT ?auto_1703833 ?auto_1703836 ) ( not ( = ?auto_1703837 ?auto_1703833 ) ) ( AVAILABLE ?auto_1703833 ) ( SURFACE-AT ?auto_1703832 ?auto_1703836 ) ( ON ?auto_1703832 ?auto_1703835 ) ( CLEAR ?auto_1703832 ) ( not ( = ?auto_1703831 ?auto_1703835 ) ) ( not ( = ?auto_1703832 ?auto_1703835 ) ) ( not ( = ?auto_1703830 ?auto_1703835 ) ) ( ON ?auto_1703829 ?auto_1703828 ) ( ON ?auto_1703830 ?auto_1703829 ) ( not ( = ?auto_1703828 ?auto_1703829 ) ) ( not ( = ?auto_1703828 ?auto_1703830 ) ) ( not ( = ?auto_1703828 ?auto_1703831 ) ) ( not ( = ?auto_1703828 ?auto_1703832 ) ) ( not ( = ?auto_1703828 ?auto_1703835 ) ) ( not ( = ?auto_1703829 ?auto_1703830 ) ) ( not ( = ?auto_1703829 ?auto_1703831 ) ) ( not ( = ?auto_1703829 ?auto_1703832 ) ) ( not ( = ?auto_1703829 ?auto_1703835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703830 ?auto_1703831 ?auto_1703832 )
      ( MAKE-4CRATE-VERIFY ?auto_1703828 ?auto_1703829 ?auto_1703830 ?auto_1703831 ?auto_1703832 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703867 - SURFACE
      ?auto_1703868 - SURFACE
      ?auto_1703869 - SURFACE
      ?auto_1703870 - SURFACE
      ?auto_1703871 - SURFACE
    )
    :vars
    (
      ?auto_1703877 - HOIST
      ?auto_1703874 - PLACE
      ?auto_1703872 - PLACE
      ?auto_1703873 - HOIST
      ?auto_1703875 - SURFACE
      ?auto_1703876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703877 ?auto_1703874 ) ( SURFACE-AT ?auto_1703870 ?auto_1703874 ) ( CLEAR ?auto_1703870 ) ( IS-CRATE ?auto_1703871 ) ( not ( = ?auto_1703870 ?auto_1703871 ) ) ( AVAILABLE ?auto_1703877 ) ( ON ?auto_1703870 ?auto_1703869 ) ( not ( = ?auto_1703869 ?auto_1703870 ) ) ( not ( = ?auto_1703869 ?auto_1703871 ) ) ( not ( = ?auto_1703872 ?auto_1703874 ) ) ( HOIST-AT ?auto_1703873 ?auto_1703872 ) ( not ( = ?auto_1703877 ?auto_1703873 ) ) ( AVAILABLE ?auto_1703873 ) ( SURFACE-AT ?auto_1703871 ?auto_1703872 ) ( ON ?auto_1703871 ?auto_1703875 ) ( CLEAR ?auto_1703871 ) ( not ( = ?auto_1703870 ?auto_1703875 ) ) ( not ( = ?auto_1703871 ?auto_1703875 ) ) ( not ( = ?auto_1703869 ?auto_1703875 ) ) ( TRUCK-AT ?auto_1703876 ?auto_1703874 ) ( ON ?auto_1703868 ?auto_1703867 ) ( ON ?auto_1703869 ?auto_1703868 ) ( not ( = ?auto_1703867 ?auto_1703868 ) ) ( not ( = ?auto_1703867 ?auto_1703869 ) ) ( not ( = ?auto_1703867 ?auto_1703870 ) ) ( not ( = ?auto_1703867 ?auto_1703871 ) ) ( not ( = ?auto_1703867 ?auto_1703875 ) ) ( not ( = ?auto_1703868 ?auto_1703869 ) ) ( not ( = ?auto_1703868 ?auto_1703870 ) ) ( not ( = ?auto_1703868 ?auto_1703871 ) ) ( not ( = ?auto_1703868 ?auto_1703875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703869 ?auto_1703870 ?auto_1703871 )
      ( MAKE-4CRATE-VERIFY ?auto_1703867 ?auto_1703868 ?auto_1703869 ?auto_1703870 ?auto_1703871 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703906 - SURFACE
      ?auto_1703907 - SURFACE
      ?auto_1703908 - SURFACE
      ?auto_1703909 - SURFACE
      ?auto_1703910 - SURFACE
    )
    :vars
    (
      ?auto_1703912 - HOIST
      ?auto_1703915 - PLACE
      ?auto_1703916 - PLACE
      ?auto_1703911 - HOIST
      ?auto_1703913 - SURFACE
      ?auto_1703914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703912 ?auto_1703915 ) ( IS-CRATE ?auto_1703910 ) ( not ( = ?auto_1703909 ?auto_1703910 ) ) ( not ( = ?auto_1703908 ?auto_1703909 ) ) ( not ( = ?auto_1703908 ?auto_1703910 ) ) ( not ( = ?auto_1703916 ?auto_1703915 ) ) ( HOIST-AT ?auto_1703911 ?auto_1703916 ) ( not ( = ?auto_1703912 ?auto_1703911 ) ) ( AVAILABLE ?auto_1703911 ) ( SURFACE-AT ?auto_1703910 ?auto_1703916 ) ( ON ?auto_1703910 ?auto_1703913 ) ( CLEAR ?auto_1703910 ) ( not ( = ?auto_1703909 ?auto_1703913 ) ) ( not ( = ?auto_1703910 ?auto_1703913 ) ) ( not ( = ?auto_1703908 ?auto_1703913 ) ) ( TRUCK-AT ?auto_1703914 ?auto_1703915 ) ( SURFACE-AT ?auto_1703908 ?auto_1703915 ) ( CLEAR ?auto_1703908 ) ( LIFTING ?auto_1703912 ?auto_1703909 ) ( IS-CRATE ?auto_1703909 ) ( ON ?auto_1703907 ?auto_1703906 ) ( ON ?auto_1703908 ?auto_1703907 ) ( not ( = ?auto_1703906 ?auto_1703907 ) ) ( not ( = ?auto_1703906 ?auto_1703908 ) ) ( not ( = ?auto_1703906 ?auto_1703909 ) ) ( not ( = ?auto_1703906 ?auto_1703910 ) ) ( not ( = ?auto_1703906 ?auto_1703913 ) ) ( not ( = ?auto_1703907 ?auto_1703908 ) ) ( not ( = ?auto_1703907 ?auto_1703909 ) ) ( not ( = ?auto_1703907 ?auto_1703910 ) ) ( not ( = ?auto_1703907 ?auto_1703913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703908 ?auto_1703909 ?auto_1703910 )
      ( MAKE-4CRATE-VERIFY ?auto_1703906 ?auto_1703907 ?auto_1703908 ?auto_1703909 ?auto_1703910 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1703945 - SURFACE
      ?auto_1703946 - SURFACE
      ?auto_1703947 - SURFACE
      ?auto_1703948 - SURFACE
      ?auto_1703949 - SURFACE
    )
    :vars
    (
      ?auto_1703954 - HOIST
      ?auto_1703952 - PLACE
      ?auto_1703950 - PLACE
      ?auto_1703953 - HOIST
      ?auto_1703955 - SURFACE
      ?auto_1703951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703954 ?auto_1703952 ) ( IS-CRATE ?auto_1703949 ) ( not ( = ?auto_1703948 ?auto_1703949 ) ) ( not ( = ?auto_1703947 ?auto_1703948 ) ) ( not ( = ?auto_1703947 ?auto_1703949 ) ) ( not ( = ?auto_1703950 ?auto_1703952 ) ) ( HOIST-AT ?auto_1703953 ?auto_1703950 ) ( not ( = ?auto_1703954 ?auto_1703953 ) ) ( AVAILABLE ?auto_1703953 ) ( SURFACE-AT ?auto_1703949 ?auto_1703950 ) ( ON ?auto_1703949 ?auto_1703955 ) ( CLEAR ?auto_1703949 ) ( not ( = ?auto_1703948 ?auto_1703955 ) ) ( not ( = ?auto_1703949 ?auto_1703955 ) ) ( not ( = ?auto_1703947 ?auto_1703955 ) ) ( TRUCK-AT ?auto_1703951 ?auto_1703952 ) ( SURFACE-AT ?auto_1703947 ?auto_1703952 ) ( CLEAR ?auto_1703947 ) ( IS-CRATE ?auto_1703948 ) ( AVAILABLE ?auto_1703954 ) ( IN ?auto_1703948 ?auto_1703951 ) ( ON ?auto_1703946 ?auto_1703945 ) ( ON ?auto_1703947 ?auto_1703946 ) ( not ( = ?auto_1703945 ?auto_1703946 ) ) ( not ( = ?auto_1703945 ?auto_1703947 ) ) ( not ( = ?auto_1703945 ?auto_1703948 ) ) ( not ( = ?auto_1703945 ?auto_1703949 ) ) ( not ( = ?auto_1703945 ?auto_1703955 ) ) ( not ( = ?auto_1703946 ?auto_1703947 ) ) ( not ( = ?auto_1703946 ?auto_1703948 ) ) ( not ( = ?auto_1703946 ?auto_1703949 ) ) ( not ( = ?auto_1703946 ?auto_1703955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1703947 ?auto_1703948 ?auto_1703949 )
      ( MAKE-4CRATE-VERIFY ?auto_1703945 ?auto_1703946 ?auto_1703947 ?auto_1703948 ?auto_1703949 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704605 - SURFACE
      ?auto_1704606 - SURFACE
      ?auto_1704607 - SURFACE
      ?auto_1704608 - SURFACE
      ?auto_1704609 - SURFACE
      ?auto_1704610 - SURFACE
    )
    :vars
    (
      ?auto_1704611 - HOIST
      ?auto_1704612 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704611 ?auto_1704612 ) ( SURFACE-AT ?auto_1704609 ?auto_1704612 ) ( CLEAR ?auto_1704609 ) ( LIFTING ?auto_1704611 ?auto_1704610 ) ( IS-CRATE ?auto_1704610 ) ( not ( = ?auto_1704609 ?auto_1704610 ) ) ( ON ?auto_1704606 ?auto_1704605 ) ( ON ?auto_1704607 ?auto_1704606 ) ( ON ?auto_1704608 ?auto_1704607 ) ( ON ?auto_1704609 ?auto_1704608 ) ( not ( = ?auto_1704605 ?auto_1704606 ) ) ( not ( = ?auto_1704605 ?auto_1704607 ) ) ( not ( = ?auto_1704605 ?auto_1704608 ) ) ( not ( = ?auto_1704605 ?auto_1704609 ) ) ( not ( = ?auto_1704605 ?auto_1704610 ) ) ( not ( = ?auto_1704606 ?auto_1704607 ) ) ( not ( = ?auto_1704606 ?auto_1704608 ) ) ( not ( = ?auto_1704606 ?auto_1704609 ) ) ( not ( = ?auto_1704606 ?auto_1704610 ) ) ( not ( = ?auto_1704607 ?auto_1704608 ) ) ( not ( = ?auto_1704607 ?auto_1704609 ) ) ( not ( = ?auto_1704607 ?auto_1704610 ) ) ( not ( = ?auto_1704608 ?auto_1704609 ) ) ( not ( = ?auto_1704608 ?auto_1704610 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1704609 ?auto_1704610 )
      ( MAKE-5CRATE-VERIFY ?auto_1704605 ?auto_1704606 ?auto_1704607 ?auto_1704608 ?auto_1704609 ?auto_1704610 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704639 - SURFACE
      ?auto_1704640 - SURFACE
      ?auto_1704641 - SURFACE
      ?auto_1704642 - SURFACE
      ?auto_1704643 - SURFACE
      ?auto_1704644 - SURFACE
    )
    :vars
    (
      ?auto_1704646 - HOIST
      ?auto_1704647 - PLACE
      ?auto_1704645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704646 ?auto_1704647 ) ( SURFACE-AT ?auto_1704643 ?auto_1704647 ) ( CLEAR ?auto_1704643 ) ( IS-CRATE ?auto_1704644 ) ( not ( = ?auto_1704643 ?auto_1704644 ) ) ( TRUCK-AT ?auto_1704645 ?auto_1704647 ) ( AVAILABLE ?auto_1704646 ) ( IN ?auto_1704644 ?auto_1704645 ) ( ON ?auto_1704643 ?auto_1704642 ) ( not ( = ?auto_1704642 ?auto_1704643 ) ) ( not ( = ?auto_1704642 ?auto_1704644 ) ) ( ON ?auto_1704640 ?auto_1704639 ) ( ON ?auto_1704641 ?auto_1704640 ) ( ON ?auto_1704642 ?auto_1704641 ) ( not ( = ?auto_1704639 ?auto_1704640 ) ) ( not ( = ?auto_1704639 ?auto_1704641 ) ) ( not ( = ?auto_1704639 ?auto_1704642 ) ) ( not ( = ?auto_1704639 ?auto_1704643 ) ) ( not ( = ?auto_1704639 ?auto_1704644 ) ) ( not ( = ?auto_1704640 ?auto_1704641 ) ) ( not ( = ?auto_1704640 ?auto_1704642 ) ) ( not ( = ?auto_1704640 ?auto_1704643 ) ) ( not ( = ?auto_1704640 ?auto_1704644 ) ) ( not ( = ?auto_1704641 ?auto_1704642 ) ) ( not ( = ?auto_1704641 ?auto_1704643 ) ) ( not ( = ?auto_1704641 ?auto_1704644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704642 ?auto_1704643 ?auto_1704644 )
      ( MAKE-5CRATE-VERIFY ?auto_1704639 ?auto_1704640 ?auto_1704641 ?auto_1704642 ?auto_1704643 ?auto_1704644 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704679 - SURFACE
      ?auto_1704680 - SURFACE
      ?auto_1704681 - SURFACE
      ?auto_1704682 - SURFACE
      ?auto_1704683 - SURFACE
      ?auto_1704684 - SURFACE
    )
    :vars
    (
      ?auto_1704687 - HOIST
      ?auto_1704686 - PLACE
      ?auto_1704688 - TRUCK
      ?auto_1704685 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704687 ?auto_1704686 ) ( SURFACE-AT ?auto_1704683 ?auto_1704686 ) ( CLEAR ?auto_1704683 ) ( IS-CRATE ?auto_1704684 ) ( not ( = ?auto_1704683 ?auto_1704684 ) ) ( AVAILABLE ?auto_1704687 ) ( IN ?auto_1704684 ?auto_1704688 ) ( ON ?auto_1704683 ?auto_1704682 ) ( not ( = ?auto_1704682 ?auto_1704683 ) ) ( not ( = ?auto_1704682 ?auto_1704684 ) ) ( TRUCK-AT ?auto_1704688 ?auto_1704685 ) ( not ( = ?auto_1704685 ?auto_1704686 ) ) ( ON ?auto_1704680 ?auto_1704679 ) ( ON ?auto_1704681 ?auto_1704680 ) ( ON ?auto_1704682 ?auto_1704681 ) ( not ( = ?auto_1704679 ?auto_1704680 ) ) ( not ( = ?auto_1704679 ?auto_1704681 ) ) ( not ( = ?auto_1704679 ?auto_1704682 ) ) ( not ( = ?auto_1704679 ?auto_1704683 ) ) ( not ( = ?auto_1704679 ?auto_1704684 ) ) ( not ( = ?auto_1704680 ?auto_1704681 ) ) ( not ( = ?auto_1704680 ?auto_1704682 ) ) ( not ( = ?auto_1704680 ?auto_1704683 ) ) ( not ( = ?auto_1704680 ?auto_1704684 ) ) ( not ( = ?auto_1704681 ?auto_1704682 ) ) ( not ( = ?auto_1704681 ?auto_1704683 ) ) ( not ( = ?auto_1704681 ?auto_1704684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704682 ?auto_1704683 ?auto_1704684 )
      ( MAKE-5CRATE-VERIFY ?auto_1704679 ?auto_1704680 ?auto_1704681 ?auto_1704682 ?auto_1704683 ?auto_1704684 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704724 - SURFACE
      ?auto_1704725 - SURFACE
      ?auto_1704726 - SURFACE
      ?auto_1704727 - SURFACE
      ?auto_1704728 - SURFACE
      ?auto_1704729 - SURFACE
    )
    :vars
    (
      ?auto_1704731 - HOIST
      ?auto_1704732 - PLACE
      ?auto_1704733 - TRUCK
      ?auto_1704730 - PLACE
      ?auto_1704734 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704731 ?auto_1704732 ) ( SURFACE-AT ?auto_1704728 ?auto_1704732 ) ( CLEAR ?auto_1704728 ) ( IS-CRATE ?auto_1704729 ) ( not ( = ?auto_1704728 ?auto_1704729 ) ) ( AVAILABLE ?auto_1704731 ) ( ON ?auto_1704728 ?auto_1704727 ) ( not ( = ?auto_1704727 ?auto_1704728 ) ) ( not ( = ?auto_1704727 ?auto_1704729 ) ) ( TRUCK-AT ?auto_1704733 ?auto_1704730 ) ( not ( = ?auto_1704730 ?auto_1704732 ) ) ( HOIST-AT ?auto_1704734 ?auto_1704730 ) ( LIFTING ?auto_1704734 ?auto_1704729 ) ( not ( = ?auto_1704731 ?auto_1704734 ) ) ( ON ?auto_1704725 ?auto_1704724 ) ( ON ?auto_1704726 ?auto_1704725 ) ( ON ?auto_1704727 ?auto_1704726 ) ( not ( = ?auto_1704724 ?auto_1704725 ) ) ( not ( = ?auto_1704724 ?auto_1704726 ) ) ( not ( = ?auto_1704724 ?auto_1704727 ) ) ( not ( = ?auto_1704724 ?auto_1704728 ) ) ( not ( = ?auto_1704724 ?auto_1704729 ) ) ( not ( = ?auto_1704725 ?auto_1704726 ) ) ( not ( = ?auto_1704725 ?auto_1704727 ) ) ( not ( = ?auto_1704725 ?auto_1704728 ) ) ( not ( = ?auto_1704725 ?auto_1704729 ) ) ( not ( = ?auto_1704726 ?auto_1704727 ) ) ( not ( = ?auto_1704726 ?auto_1704728 ) ) ( not ( = ?auto_1704726 ?auto_1704729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704727 ?auto_1704728 ?auto_1704729 )
      ( MAKE-5CRATE-VERIFY ?auto_1704724 ?auto_1704725 ?auto_1704726 ?auto_1704727 ?auto_1704728 ?auto_1704729 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704774 - SURFACE
      ?auto_1704775 - SURFACE
      ?auto_1704776 - SURFACE
      ?auto_1704777 - SURFACE
      ?auto_1704778 - SURFACE
      ?auto_1704779 - SURFACE
    )
    :vars
    (
      ?auto_1704780 - HOIST
      ?auto_1704782 - PLACE
      ?auto_1704785 - TRUCK
      ?auto_1704781 - PLACE
      ?auto_1704784 - HOIST
      ?auto_1704783 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704780 ?auto_1704782 ) ( SURFACE-AT ?auto_1704778 ?auto_1704782 ) ( CLEAR ?auto_1704778 ) ( IS-CRATE ?auto_1704779 ) ( not ( = ?auto_1704778 ?auto_1704779 ) ) ( AVAILABLE ?auto_1704780 ) ( ON ?auto_1704778 ?auto_1704777 ) ( not ( = ?auto_1704777 ?auto_1704778 ) ) ( not ( = ?auto_1704777 ?auto_1704779 ) ) ( TRUCK-AT ?auto_1704785 ?auto_1704781 ) ( not ( = ?auto_1704781 ?auto_1704782 ) ) ( HOIST-AT ?auto_1704784 ?auto_1704781 ) ( not ( = ?auto_1704780 ?auto_1704784 ) ) ( AVAILABLE ?auto_1704784 ) ( SURFACE-AT ?auto_1704779 ?auto_1704781 ) ( ON ?auto_1704779 ?auto_1704783 ) ( CLEAR ?auto_1704779 ) ( not ( = ?auto_1704778 ?auto_1704783 ) ) ( not ( = ?auto_1704779 ?auto_1704783 ) ) ( not ( = ?auto_1704777 ?auto_1704783 ) ) ( ON ?auto_1704775 ?auto_1704774 ) ( ON ?auto_1704776 ?auto_1704775 ) ( ON ?auto_1704777 ?auto_1704776 ) ( not ( = ?auto_1704774 ?auto_1704775 ) ) ( not ( = ?auto_1704774 ?auto_1704776 ) ) ( not ( = ?auto_1704774 ?auto_1704777 ) ) ( not ( = ?auto_1704774 ?auto_1704778 ) ) ( not ( = ?auto_1704774 ?auto_1704779 ) ) ( not ( = ?auto_1704774 ?auto_1704783 ) ) ( not ( = ?auto_1704775 ?auto_1704776 ) ) ( not ( = ?auto_1704775 ?auto_1704777 ) ) ( not ( = ?auto_1704775 ?auto_1704778 ) ) ( not ( = ?auto_1704775 ?auto_1704779 ) ) ( not ( = ?auto_1704775 ?auto_1704783 ) ) ( not ( = ?auto_1704776 ?auto_1704777 ) ) ( not ( = ?auto_1704776 ?auto_1704778 ) ) ( not ( = ?auto_1704776 ?auto_1704779 ) ) ( not ( = ?auto_1704776 ?auto_1704783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704777 ?auto_1704778 ?auto_1704779 )
      ( MAKE-5CRATE-VERIFY ?auto_1704774 ?auto_1704775 ?auto_1704776 ?auto_1704777 ?auto_1704778 ?auto_1704779 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704825 - SURFACE
      ?auto_1704826 - SURFACE
      ?auto_1704827 - SURFACE
      ?auto_1704828 - SURFACE
      ?auto_1704829 - SURFACE
      ?auto_1704830 - SURFACE
    )
    :vars
    (
      ?auto_1704834 - HOIST
      ?auto_1704836 - PLACE
      ?auto_1704831 - PLACE
      ?auto_1704835 - HOIST
      ?auto_1704833 - SURFACE
      ?auto_1704832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704834 ?auto_1704836 ) ( SURFACE-AT ?auto_1704829 ?auto_1704836 ) ( CLEAR ?auto_1704829 ) ( IS-CRATE ?auto_1704830 ) ( not ( = ?auto_1704829 ?auto_1704830 ) ) ( AVAILABLE ?auto_1704834 ) ( ON ?auto_1704829 ?auto_1704828 ) ( not ( = ?auto_1704828 ?auto_1704829 ) ) ( not ( = ?auto_1704828 ?auto_1704830 ) ) ( not ( = ?auto_1704831 ?auto_1704836 ) ) ( HOIST-AT ?auto_1704835 ?auto_1704831 ) ( not ( = ?auto_1704834 ?auto_1704835 ) ) ( AVAILABLE ?auto_1704835 ) ( SURFACE-AT ?auto_1704830 ?auto_1704831 ) ( ON ?auto_1704830 ?auto_1704833 ) ( CLEAR ?auto_1704830 ) ( not ( = ?auto_1704829 ?auto_1704833 ) ) ( not ( = ?auto_1704830 ?auto_1704833 ) ) ( not ( = ?auto_1704828 ?auto_1704833 ) ) ( TRUCK-AT ?auto_1704832 ?auto_1704836 ) ( ON ?auto_1704826 ?auto_1704825 ) ( ON ?auto_1704827 ?auto_1704826 ) ( ON ?auto_1704828 ?auto_1704827 ) ( not ( = ?auto_1704825 ?auto_1704826 ) ) ( not ( = ?auto_1704825 ?auto_1704827 ) ) ( not ( = ?auto_1704825 ?auto_1704828 ) ) ( not ( = ?auto_1704825 ?auto_1704829 ) ) ( not ( = ?auto_1704825 ?auto_1704830 ) ) ( not ( = ?auto_1704825 ?auto_1704833 ) ) ( not ( = ?auto_1704826 ?auto_1704827 ) ) ( not ( = ?auto_1704826 ?auto_1704828 ) ) ( not ( = ?auto_1704826 ?auto_1704829 ) ) ( not ( = ?auto_1704826 ?auto_1704830 ) ) ( not ( = ?auto_1704826 ?auto_1704833 ) ) ( not ( = ?auto_1704827 ?auto_1704828 ) ) ( not ( = ?auto_1704827 ?auto_1704829 ) ) ( not ( = ?auto_1704827 ?auto_1704830 ) ) ( not ( = ?auto_1704827 ?auto_1704833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704828 ?auto_1704829 ?auto_1704830 )
      ( MAKE-5CRATE-VERIFY ?auto_1704825 ?auto_1704826 ?auto_1704827 ?auto_1704828 ?auto_1704829 ?auto_1704830 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704876 - SURFACE
      ?auto_1704877 - SURFACE
      ?auto_1704878 - SURFACE
      ?auto_1704879 - SURFACE
      ?auto_1704880 - SURFACE
      ?auto_1704881 - SURFACE
    )
    :vars
    (
      ?auto_1704886 - HOIST
      ?auto_1704887 - PLACE
      ?auto_1704884 - PLACE
      ?auto_1704883 - HOIST
      ?auto_1704885 - SURFACE
      ?auto_1704882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704886 ?auto_1704887 ) ( IS-CRATE ?auto_1704881 ) ( not ( = ?auto_1704880 ?auto_1704881 ) ) ( not ( = ?auto_1704879 ?auto_1704880 ) ) ( not ( = ?auto_1704879 ?auto_1704881 ) ) ( not ( = ?auto_1704884 ?auto_1704887 ) ) ( HOIST-AT ?auto_1704883 ?auto_1704884 ) ( not ( = ?auto_1704886 ?auto_1704883 ) ) ( AVAILABLE ?auto_1704883 ) ( SURFACE-AT ?auto_1704881 ?auto_1704884 ) ( ON ?auto_1704881 ?auto_1704885 ) ( CLEAR ?auto_1704881 ) ( not ( = ?auto_1704880 ?auto_1704885 ) ) ( not ( = ?auto_1704881 ?auto_1704885 ) ) ( not ( = ?auto_1704879 ?auto_1704885 ) ) ( TRUCK-AT ?auto_1704882 ?auto_1704887 ) ( SURFACE-AT ?auto_1704879 ?auto_1704887 ) ( CLEAR ?auto_1704879 ) ( LIFTING ?auto_1704886 ?auto_1704880 ) ( IS-CRATE ?auto_1704880 ) ( ON ?auto_1704877 ?auto_1704876 ) ( ON ?auto_1704878 ?auto_1704877 ) ( ON ?auto_1704879 ?auto_1704878 ) ( not ( = ?auto_1704876 ?auto_1704877 ) ) ( not ( = ?auto_1704876 ?auto_1704878 ) ) ( not ( = ?auto_1704876 ?auto_1704879 ) ) ( not ( = ?auto_1704876 ?auto_1704880 ) ) ( not ( = ?auto_1704876 ?auto_1704881 ) ) ( not ( = ?auto_1704876 ?auto_1704885 ) ) ( not ( = ?auto_1704877 ?auto_1704878 ) ) ( not ( = ?auto_1704877 ?auto_1704879 ) ) ( not ( = ?auto_1704877 ?auto_1704880 ) ) ( not ( = ?auto_1704877 ?auto_1704881 ) ) ( not ( = ?auto_1704877 ?auto_1704885 ) ) ( not ( = ?auto_1704878 ?auto_1704879 ) ) ( not ( = ?auto_1704878 ?auto_1704880 ) ) ( not ( = ?auto_1704878 ?auto_1704881 ) ) ( not ( = ?auto_1704878 ?auto_1704885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704879 ?auto_1704880 ?auto_1704881 )
      ( MAKE-5CRATE-VERIFY ?auto_1704876 ?auto_1704877 ?auto_1704878 ?auto_1704879 ?auto_1704880 ?auto_1704881 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1704927 - SURFACE
      ?auto_1704928 - SURFACE
      ?auto_1704929 - SURFACE
      ?auto_1704930 - SURFACE
      ?auto_1704931 - SURFACE
      ?auto_1704932 - SURFACE
    )
    :vars
    (
      ?auto_1704938 - HOIST
      ?auto_1704934 - PLACE
      ?auto_1704937 - PLACE
      ?auto_1704933 - HOIST
      ?auto_1704935 - SURFACE
      ?auto_1704936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704938 ?auto_1704934 ) ( IS-CRATE ?auto_1704932 ) ( not ( = ?auto_1704931 ?auto_1704932 ) ) ( not ( = ?auto_1704930 ?auto_1704931 ) ) ( not ( = ?auto_1704930 ?auto_1704932 ) ) ( not ( = ?auto_1704937 ?auto_1704934 ) ) ( HOIST-AT ?auto_1704933 ?auto_1704937 ) ( not ( = ?auto_1704938 ?auto_1704933 ) ) ( AVAILABLE ?auto_1704933 ) ( SURFACE-AT ?auto_1704932 ?auto_1704937 ) ( ON ?auto_1704932 ?auto_1704935 ) ( CLEAR ?auto_1704932 ) ( not ( = ?auto_1704931 ?auto_1704935 ) ) ( not ( = ?auto_1704932 ?auto_1704935 ) ) ( not ( = ?auto_1704930 ?auto_1704935 ) ) ( TRUCK-AT ?auto_1704936 ?auto_1704934 ) ( SURFACE-AT ?auto_1704930 ?auto_1704934 ) ( CLEAR ?auto_1704930 ) ( IS-CRATE ?auto_1704931 ) ( AVAILABLE ?auto_1704938 ) ( IN ?auto_1704931 ?auto_1704936 ) ( ON ?auto_1704928 ?auto_1704927 ) ( ON ?auto_1704929 ?auto_1704928 ) ( ON ?auto_1704930 ?auto_1704929 ) ( not ( = ?auto_1704927 ?auto_1704928 ) ) ( not ( = ?auto_1704927 ?auto_1704929 ) ) ( not ( = ?auto_1704927 ?auto_1704930 ) ) ( not ( = ?auto_1704927 ?auto_1704931 ) ) ( not ( = ?auto_1704927 ?auto_1704932 ) ) ( not ( = ?auto_1704927 ?auto_1704935 ) ) ( not ( = ?auto_1704928 ?auto_1704929 ) ) ( not ( = ?auto_1704928 ?auto_1704930 ) ) ( not ( = ?auto_1704928 ?auto_1704931 ) ) ( not ( = ?auto_1704928 ?auto_1704932 ) ) ( not ( = ?auto_1704928 ?auto_1704935 ) ) ( not ( = ?auto_1704929 ?auto_1704930 ) ) ( not ( = ?auto_1704929 ?auto_1704931 ) ) ( not ( = ?auto_1704929 ?auto_1704932 ) ) ( not ( = ?auto_1704929 ?auto_1704935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1704930 ?auto_1704931 ?auto_1704932 )
      ( MAKE-5CRATE-VERIFY ?auto_1704927 ?auto_1704928 ?auto_1704929 ?auto_1704930 ?auto_1704931 ?auto_1704932 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706136 - SURFACE
      ?auto_1706137 - SURFACE
      ?auto_1706138 - SURFACE
      ?auto_1706139 - SURFACE
      ?auto_1706140 - SURFACE
      ?auto_1706141 - SURFACE
      ?auto_1706142 - SURFACE
    )
    :vars
    (
      ?auto_1706144 - HOIST
      ?auto_1706143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706144 ?auto_1706143 ) ( SURFACE-AT ?auto_1706141 ?auto_1706143 ) ( CLEAR ?auto_1706141 ) ( LIFTING ?auto_1706144 ?auto_1706142 ) ( IS-CRATE ?auto_1706142 ) ( not ( = ?auto_1706141 ?auto_1706142 ) ) ( ON ?auto_1706137 ?auto_1706136 ) ( ON ?auto_1706138 ?auto_1706137 ) ( ON ?auto_1706139 ?auto_1706138 ) ( ON ?auto_1706140 ?auto_1706139 ) ( ON ?auto_1706141 ?auto_1706140 ) ( not ( = ?auto_1706136 ?auto_1706137 ) ) ( not ( = ?auto_1706136 ?auto_1706138 ) ) ( not ( = ?auto_1706136 ?auto_1706139 ) ) ( not ( = ?auto_1706136 ?auto_1706140 ) ) ( not ( = ?auto_1706136 ?auto_1706141 ) ) ( not ( = ?auto_1706136 ?auto_1706142 ) ) ( not ( = ?auto_1706137 ?auto_1706138 ) ) ( not ( = ?auto_1706137 ?auto_1706139 ) ) ( not ( = ?auto_1706137 ?auto_1706140 ) ) ( not ( = ?auto_1706137 ?auto_1706141 ) ) ( not ( = ?auto_1706137 ?auto_1706142 ) ) ( not ( = ?auto_1706138 ?auto_1706139 ) ) ( not ( = ?auto_1706138 ?auto_1706140 ) ) ( not ( = ?auto_1706138 ?auto_1706141 ) ) ( not ( = ?auto_1706138 ?auto_1706142 ) ) ( not ( = ?auto_1706139 ?auto_1706140 ) ) ( not ( = ?auto_1706139 ?auto_1706141 ) ) ( not ( = ?auto_1706139 ?auto_1706142 ) ) ( not ( = ?auto_1706140 ?auto_1706141 ) ) ( not ( = ?auto_1706140 ?auto_1706142 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1706141 ?auto_1706142 )
      ( MAKE-6CRATE-VERIFY ?auto_1706136 ?auto_1706137 ?auto_1706138 ?auto_1706139 ?auto_1706140 ?auto_1706141 ?auto_1706142 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706180 - SURFACE
      ?auto_1706181 - SURFACE
      ?auto_1706182 - SURFACE
      ?auto_1706183 - SURFACE
      ?auto_1706184 - SURFACE
      ?auto_1706185 - SURFACE
      ?auto_1706186 - SURFACE
    )
    :vars
    (
      ?auto_1706188 - HOIST
      ?auto_1706187 - PLACE
      ?auto_1706189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706188 ?auto_1706187 ) ( SURFACE-AT ?auto_1706185 ?auto_1706187 ) ( CLEAR ?auto_1706185 ) ( IS-CRATE ?auto_1706186 ) ( not ( = ?auto_1706185 ?auto_1706186 ) ) ( TRUCK-AT ?auto_1706189 ?auto_1706187 ) ( AVAILABLE ?auto_1706188 ) ( IN ?auto_1706186 ?auto_1706189 ) ( ON ?auto_1706185 ?auto_1706184 ) ( not ( = ?auto_1706184 ?auto_1706185 ) ) ( not ( = ?auto_1706184 ?auto_1706186 ) ) ( ON ?auto_1706181 ?auto_1706180 ) ( ON ?auto_1706182 ?auto_1706181 ) ( ON ?auto_1706183 ?auto_1706182 ) ( ON ?auto_1706184 ?auto_1706183 ) ( not ( = ?auto_1706180 ?auto_1706181 ) ) ( not ( = ?auto_1706180 ?auto_1706182 ) ) ( not ( = ?auto_1706180 ?auto_1706183 ) ) ( not ( = ?auto_1706180 ?auto_1706184 ) ) ( not ( = ?auto_1706180 ?auto_1706185 ) ) ( not ( = ?auto_1706180 ?auto_1706186 ) ) ( not ( = ?auto_1706181 ?auto_1706182 ) ) ( not ( = ?auto_1706181 ?auto_1706183 ) ) ( not ( = ?auto_1706181 ?auto_1706184 ) ) ( not ( = ?auto_1706181 ?auto_1706185 ) ) ( not ( = ?auto_1706181 ?auto_1706186 ) ) ( not ( = ?auto_1706182 ?auto_1706183 ) ) ( not ( = ?auto_1706182 ?auto_1706184 ) ) ( not ( = ?auto_1706182 ?auto_1706185 ) ) ( not ( = ?auto_1706182 ?auto_1706186 ) ) ( not ( = ?auto_1706183 ?auto_1706184 ) ) ( not ( = ?auto_1706183 ?auto_1706185 ) ) ( not ( = ?auto_1706183 ?auto_1706186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706184 ?auto_1706185 ?auto_1706186 )
      ( MAKE-6CRATE-VERIFY ?auto_1706180 ?auto_1706181 ?auto_1706182 ?auto_1706183 ?auto_1706184 ?auto_1706185 ?auto_1706186 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706231 - SURFACE
      ?auto_1706232 - SURFACE
      ?auto_1706233 - SURFACE
      ?auto_1706234 - SURFACE
      ?auto_1706235 - SURFACE
      ?auto_1706236 - SURFACE
      ?auto_1706237 - SURFACE
    )
    :vars
    (
      ?auto_1706240 - HOIST
      ?auto_1706238 - PLACE
      ?auto_1706239 - TRUCK
      ?auto_1706241 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706240 ?auto_1706238 ) ( SURFACE-AT ?auto_1706236 ?auto_1706238 ) ( CLEAR ?auto_1706236 ) ( IS-CRATE ?auto_1706237 ) ( not ( = ?auto_1706236 ?auto_1706237 ) ) ( AVAILABLE ?auto_1706240 ) ( IN ?auto_1706237 ?auto_1706239 ) ( ON ?auto_1706236 ?auto_1706235 ) ( not ( = ?auto_1706235 ?auto_1706236 ) ) ( not ( = ?auto_1706235 ?auto_1706237 ) ) ( TRUCK-AT ?auto_1706239 ?auto_1706241 ) ( not ( = ?auto_1706241 ?auto_1706238 ) ) ( ON ?auto_1706232 ?auto_1706231 ) ( ON ?auto_1706233 ?auto_1706232 ) ( ON ?auto_1706234 ?auto_1706233 ) ( ON ?auto_1706235 ?auto_1706234 ) ( not ( = ?auto_1706231 ?auto_1706232 ) ) ( not ( = ?auto_1706231 ?auto_1706233 ) ) ( not ( = ?auto_1706231 ?auto_1706234 ) ) ( not ( = ?auto_1706231 ?auto_1706235 ) ) ( not ( = ?auto_1706231 ?auto_1706236 ) ) ( not ( = ?auto_1706231 ?auto_1706237 ) ) ( not ( = ?auto_1706232 ?auto_1706233 ) ) ( not ( = ?auto_1706232 ?auto_1706234 ) ) ( not ( = ?auto_1706232 ?auto_1706235 ) ) ( not ( = ?auto_1706232 ?auto_1706236 ) ) ( not ( = ?auto_1706232 ?auto_1706237 ) ) ( not ( = ?auto_1706233 ?auto_1706234 ) ) ( not ( = ?auto_1706233 ?auto_1706235 ) ) ( not ( = ?auto_1706233 ?auto_1706236 ) ) ( not ( = ?auto_1706233 ?auto_1706237 ) ) ( not ( = ?auto_1706234 ?auto_1706235 ) ) ( not ( = ?auto_1706234 ?auto_1706236 ) ) ( not ( = ?auto_1706234 ?auto_1706237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706235 ?auto_1706236 ?auto_1706237 )
      ( MAKE-6CRATE-VERIFY ?auto_1706231 ?auto_1706232 ?auto_1706233 ?auto_1706234 ?auto_1706235 ?auto_1706236 ?auto_1706237 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706288 - SURFACE
      ?auto_1706289 - SURFACE
      ?auto_1706290 - SURFACE
      ?auto_1706291 - SURFACE
      ?auto_1706292 - SURFACE
      ?auto_1706293 - SURFACE
      ?auto_1706294 - SURFACE
    )
    :vars
    (
      ?auto_1706297 - HOIST
      ?auto_1706296 - PLACE
      ?auto_1706299 - TRUCK
      ?auto_1706298 - PLACE
      ?auto_1706295 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706297 ?auto_1706296 ) ( SURFACE-AT ?auto_1706293 ?auto_1706296 ) ( CLEAR ?auto_1706293 ) ( IS-CRATE ?auto_1706294 ) ( not ( = ?auto_1706293 ?auto_1706294 ) ) ( AVAILABLE ?auto_1706297 ) ( ON ?auto_1706293 ?auto_1706292 ) ( not ( = ?auto_1706292 ?auto_1706293 ) ) ( not ( = ?auto_1706292 ?auto_1706294 ) ) ( TRUCK-AT ?auto_1706299 ?auto_1706298 ) ( not ( = ?auto_1706298 ?auto_1706296 ) ) ( HOIST-AT ?auto_1706295 ?auto_1706298 ) ( LIFTING ?auto_1706295 ?auto_1706294 ) ( not ( = ?auto_1706297 ?auto_1706295 ) ) ( ON ?auto_1706289 ?auto_1706288 ) ( ON ?auto_1706290 ?auto_1706289 ) ( ON ?auto_1706291 ?auto_1706290 ) ( ON ?auto_1706292 ?auto_1706291 ) ( not ( = ?auto_1706288 ?auto_1706289 ) ) ( not ( = ?auto_1706288 ?auto_1706290 ) ) ( not ( = ?auto_1706288 ?auto_1706291 ) ) ( not ( = ?auto_1706288 ?auto_1706292 ) ) ( not ( = ?auto_1706288 ?auto_1706293 ) ) ( not ( = ?auto_1706288 ?auto_1706294 ) ) ( not ( = ?auto_1706289 ?auto_1706290 ) ) ( not ( = ?auto_1706289 ?auto_1706291 ) ) ( not ( = ?auto_1706289 ?auto_1706292 ) ) ( not ( = ?auto_1706289 ?auto_1706293 ) ) ( not ( = ?auto_1706289 ?auto_1706294 ) ) ( not ( = ?auto_1706290 ?auto_1706291 ) ) ( not ( = ?auto_1706290 ?auto_1706292 ) ) ( not ( = ?auto_1706290 ?auto_1706293 ) ) ( not ( = ?auto_1706290 ?auto_1706294 ) ) ( not ( = ?auto_1706291 ?auto_1706292 ) ) ( not ( = ?auto_1706291 ?auto_1706293 ) ) ( not ( = ?auto_1706291 ?auto_1706294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706292 ?auto_1706293 ?auto_1706294 )
      ( MAKE-6CRATE-VERIFY ?auto_1706288 ?auto_1706289 ?auto_1706290 ?auto_1706291 ?auto_1706292 ?auto_1706293 ?auto_1706294 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706351 - SURFACE
      ?auto_1706352 - SURFACE
      ?auto_1706353 - SURFACE
      ?auto_1706354 - SURFACE
      ?auto_1706355 - SURFACE
      ?auto_1706356 - SURFACE
      ?auto_1706357 - SURFACE
    )
    :vars
    (
      ?auto_1706358 - HOIST
      ?auto_1706362 - PLACE
      ?auto_1706360 - TRUCK
      ?auto_1706359 - PLACE
      ?auto_1706363 - HOIST
      ?auto_1706361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706358 ?auto_1706362 ) ( SURFACE-AT ?auto_1706356 ?auto_1706362 ) ( CLEAR ?auto_1706356 ) ( IS-CRATE ?auto_1706357 ) ( not ( = ?auto_1706356 ?auto_1706357 ) ) ( AVAILABLE ?auto_1706358 ) ( ON ?auto_1706356 ?auto_1706355 ) ( not ( = ?auto_1706355 ?auto_1706356 ) ) ( not ( = ?auto_1706355 ?auto_1706357 ) ) ( TRUCK-AT ?auto_1706360 ?auto_1706359 ) ( not ( = ?auto_1706359 ?auto_1706362 ) ) ( HOIST-AT ?auto_1706363 ?auto_1706359 ) ( not ( = ?auto_1706358 ?auto_1706363 ) ) ( AVAILABLE ?auto_1706363 ) ( SURFACE-AT ?auto_1706357 ?auto_1706359 ) ( ON ?auto_1706357 ?auto_1706361 ) ( CLEAR ?auto_1706357 ) ( not ( = ?auto_1706356 ?auto_1706361 ) ) ( not ( = ?auto_1706357 ?auto_1706361 ) ) ( not ( = ?auto_1706355 ?auto_1706361 ) ) ( ON ?auto_1706352 ?auto_1706351 ) ( ON ?auto_1706353 ?auto_1706352 ) ( ON ?auto_1706354 ?auto_1706353 ) ( ON ?auto_1706355 ?auto_1706354 ) ( not ( = ?auto_1706351 ?auto_1706352 ) ) ( not ( = ?auto_1706351 ?auto_1706353 ) ) ( not ( = ?auto_1706351 ?auto_1706354 ) ) ( not ( = ?auto_1706351 ?auto_1706355 ) ) ( not ( = ?auto_1706351 ?auto_1706356 ) ) ( not ( = ?auto_1706351 ?auto_1706357 ) ) ( not ( = ?auto_1706351 ?auto_1706361 ) ) ( not ( = ?auto_1706352 ?auto_1706353 ) ) ( not ( = ?auto_1706352 ?auto_1706354 ) ) ( not ( = ?auto_1706352 ?auto_1706355 ) ) ( not ( = ?auto_1706352 ?auto_1706356 ) ) ( not ( = ?auto_1706352 ?auto_1706357 ) ) ( not ( = ?auto_1706352 ?auto_1706361 ) ) ( not ( = ?auto_1706353 ?auto_1706354 ) ) ( not ( = ?auto_1706353 ?auto_1706355 ) ) ( not ( = ?auto_1706353 ?auto_1706356 ) ) ( not ( = ?auto_1706353 ?auto_1706357 ) ) ( not ( = ?auto_1706353 ?auto_1706361 ) ) ( not ( = ?auto_1706354 ?auto_1706355 ) ) ( not ( = ?auto_1706354 ?auto_1706356 ) ) ( not ( = ?auto_1706354 ?auto_1706357 ) ) ( not ( = ?auto_1706354 ?auto_1706361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706355 ?auto_1706356 ?auto_1706357 )
      ( MAKE-6CRATE-VERIFY ?auto_1706351 ?auto_1706352 ?auto_1706353 ?auto_1706354 ?auto_1706355 ?auto_1706356 ?auto_1706357 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706415 - SURFACE
      ?auto_1706416 - SURFACE
      ?auto_1706417 - SURFACE
      ?auto_1706418 - SURFACE
      ?auto_1706419 - SURFACE
      ?auto_1706420 - SURFACE
      ?auto_1706421 - SURFACE
    )
    :vars
    (
      ?auto_1706422 - HOIST
      ?auto_1706424 - PLACE
      ?auto_1706427 - PLACE
      ?auto_1706423 - HOIST
      ?auto_1706426 - SURFACE
      ?auto_1706425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706422 ?auto_1706424 ) ( SURFACE-AT ?auto_1706420 ?auto_1706424 ) ( CLEAR ?auto_1706420 ) ( IS-CRATE ?auto_1706421 ) ( not ( = ?auto_1706420 ?auto_1706421 ) ) ( AVAILABLE ?auto_1706422 ) ( ON ?auto_1706420 ?auto_1706419 ) ( not ( = ?auto_1706419 ?auto_1706420 ) ) ( not ( = ?auto_1706419 ?auto_1706421 ) ) ( not ( = ?auto_1706427 ?auto_1706424 ) ) ( HOIST-AT ?auto_1706423 ?auto_1706427 ) ( not ( = ?auto_1706422 ?auto_1706423 ) ) ( AVAILABLE ?auto_1706423 ) ( SURFACE-AT ?auto_1706421 ?auto_1706427 ) ( ON ?auto_1706421 ?auto_1706426 ) ( CLEAR ?auto_1706421 ) ( not ( = ?auto_1706420 ?auto_1706426 ) ) ( not ( = ?auto_1706421 ?auto_1706426 ) ) ( not ( = ?auto_1706419 ?auto_1706426 ) ) ( TRUCK-AT ?auto_1706425 ?auto_1706424 ) ( ON ?auto_1706416 ?auto_1706415 ) ( ON ?auto_1706417 ?auto_1706416 ) ( ON ?auto_1706418 ?auto_1706417 ) ( ON ?auto_1706419 ?auto_1706418 ) ( not ( = ?auto_1706415 ?auto_1706416 ) ) ( not ( = ?auto_1706415 ?auto_1706417 ) ) ( not ( = ?auto_1706415 ?auto_1706418 ) ) ( not ( = ?auto_1706415 ?auto_1706419 ) ) ( not ( = ?auto_1706415 ?auto_1706420 ) ) ( not ( = ?auto_1706415 ?auto_1706421 ) ) ( not ( = ?auto_1706415 ?auto_1706426 ) ) ( not ( = ?auto_1706416 ?auto_1706417 ) ) ( not ( = ?auto_1706416 ?auto_1706418 ) ) ( not ( = ?auto_1706416 ?auto_1706419 ) ) ( not ( = ?auto_1706416 ?auto_1706420 ) ) ( not ( = ?auto_1706416 ?auto_1706421 ) ) ( not ( = ?auto_1706416 ?auto_1706426 ) ) ( not ( = ?auto_1706417 ?auto_1706418 ) ) ( not ( = ?auto_1706417 ?auto_1706419 ) ) ( not ( = ?auto_1706417 ?auto_1706420 ) ) ( not ( = ?auto_1706417 ?auto_1706421 ) ) ( not ( = ?auto_1706417 ?auto_1706426 ) ) ( not ( = ?auto_1706418 ?auto_1706419 ) ) ( not ( = ?auto_1706418 ?auto_1706420 ) ) ( not ( = ?auto_1706418 ?auto_1706421 ) ) ( not ( = ?auto_1706418 ?auto_1706426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706419 ?auto_1706420 ?auto_1706421 )
      ( MAKE-6CRATE-VERIFY ?auto_1706415 ?auto_1706416 ?auto_1706417 ?auto_1706418 ?auto_1706419 ?auto_1706420 ?auto_1706421 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706479 - SURFACE
      ?auto_1706480 - SURFACE
      ?auto_1706481 - SURFACE
      ?auto_1706482 - SURFACE
      ?auto_1706483 - SURFACE
      ?auto_1706484 - SURFACE
      ?auto_1706485 - SURFACE
    )
    :vars
    (
      ?auto_1706489 - HOIST
      ?auto_1706486 - PLACE
      ?auto_1706491 - PLACE
      ?auto_1706490 - HOIST
      ?auto_1706488 - SURFACE
      ?auto_1706487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706489 ?auto_1706486 ) ( IS-CRATE ?auto_1706485 ) ( not ( = ?auto_1706484 ?auto_1706485 ) ) ( not ( = ?auto_1706483 ?auto_1706484 ) ) ( not ( = ?auto_1706483 ?auto_1706485 ) ) ( not ( = ?auto_1706491 ?auto_1706486 ) ) ( HOIST-AT ?auto_1706490 ?auto_1706491 ) ( not ( = ?auto_1706489 ?auto_1706490 ) ) ( AVAILABLE ?auto_1706490 ) ( SURFACE-AT ?auto_1706485 ?auto_1706491 ) ( ON ?auto_1706485 ?auto_1706488 ) ( CLEAR ?auto_1706485 ) ( not ( = ?auto_1706484 ?auto_1706488 ) ) ( not ( = ?auto_1706485 ?auto_1706488 ) ) ( not ( = ?auto_1706483 ?auto_1706488 ) ) ( TRUCK-AT ?auto_1706487 ?auto_1706486 ) ( SURFACE-AT ?auto_1706483 ?auto_1706486 ) ( CLEAR ?auto_1706483 ) ( LIFTING ?auto_1706489 ?auto_1706484 ) ( IS-CRATE ?auto_1706484 ) ( ON ?auto_1706480 ?auto_1706479 ) ( ON ?auto_1706481 ?auto_1706480 ) ( ON ?auto_1706482 ?auto_1706481 ) ( ON ?auto_1706483 ?auto_1706482 ) ( not ( = ?auto_1706479 ?auto_1706480 ) ) ( not ( = ?auto_1706479 ?auto_1706481 ) ) ( not ( = ?auto_1706479 ?auto_1706482 ) ) ( not ( = ?auto_1706479 ?auto_1706483 ) ) ( not ( = ?auto_1706479 ?auto_1706484 ) ) ( not ( = ?auto_1706479 ?auto_1706485 ) ) ( not ( = ?auto_1706479 ?auto_1706488 ) ) ( not ( = ?auto_1706480 ?auto_1706481 ) ) ( not ( = ?auto_1706480 ?auto_1706482 ) ) ( not ( = ?auto_1706480 ?auto_1706483 ) ) ( not ( = ?auto_1706480 ?auto_1706484 ) ) ( not ( = ?auto_1706480 ?auto_1706485 ) ) ( not ( = ?auto_1706480 ?auto_1706488 ) ) ( not ( = ?auto_1706481 ?auto_1706482 ) ) ( not ( = ?auto_1706481 ?auto_1706483 ) ) ( not ( = ?auto_1706481 ?auto_1706484 ) ) ( not ( = ?auto_1706481 ?auto_1706485 ) ) ( not ( = ?auto_1706481 ?auto_1706488 ) ) ( not ( = ?auto_1706482 ?auto_1706483 ) ) ( not ( = ?auto_1706482 ?auto_1706484 ) ) ( not ( = ?auto_1706482 ?auto_1706485 ) ) ( not ( = ?auto_1706482 ?auto_1706488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706483 ?auto_1706484 ?auto_1706485 )
      ( MAKE-6CRATE-VERIFY ?auto_1706479 ?auto_1706480 ?auto_1706481 ?auto_1706482 ?auto_1706483 ?auto_1706484 ?auto_1706485 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1706543 - SURFACE
      ?auto_1706544 - SURFACE
      ?auto_1706545 - SURFACE
      ?auto_1706546 - SURFACE
      ?auto_1706547 - SURFACE
      ?auto_1706548 - SURFACE
      ?auto_1706549 - SURFACE
    )
    :vars
    (
      ?auto_1706550 - HOIST
      ?auto_1706552 - PLACE
      ?auto_1706555 - PLACE
      ?auto_1706553 - HOIST
      ?auto_1706554 - SURFACE
      ?auto_1706551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1706550 ?auto_1706552 ) ( IS-CRATE ?auto_1706549 ) ( not ( = ?auto_1706548 ?auto_1706549 ) ) ( not ( = ?auto_1706547 ?auto_1706548 ) ) ( not ( = ?auto_1706547 ?auto_1706549 ) ) ( not ( = ?auto_1706555 ?auto_1706552 ) ) ( HOIST-AT ?auto_1706553 ?auto_1706555 ) ( not ( = ?auto_1706550 ?auto_1706553 ) ) ( AVAILABLE ?auto_1706553 ) ( SURFACE-AT ?auto_1706549 ?auto_1706555 ) ( ON ?auto_1706549 ?auto_1706554 ) ( CLEAR ?auto_1706549 ) ( not ( = ?auto_1706548 ?auto_1706554 ) ) ( not ( = ?auto_1706549 ?auto_1706554 ) ) ( not ( = ?auto_1706547 ?auto_1706554 ) ) ( TRUCK-AT ?auto_1706551 ?auto_1706552 ) ( SURFACE-AT ?auto_1706547 ?auto_1706552 ) ( CLEAR ?auto_1706547 ) ( IS-CRATE ?auto_1706548 ) ( AVAILABLE ?auto_1706550 ) ( IN ?auto_1706548 ?auto_1706551 ) ( ON ?auto_1706544 ?auto_1706543 ) ( ON ?auto_1706545 ?auto_1706544 ) ( ON ?auto_1706546 ?auto_1706545 ) ( ON ?auto_1706547 ?auto_1706546 ) ( not ( = ?auto_1706543 ?auto_1706544 ) ) ( not ( = ?auto_1706543 ?auto_1706545 ) ) ( not ( = ?auto_1706543 ?auto_1706546 ) ) ( not ( = ?auto_1706543 ?auto_1706547 ) ) ( not ( = ?auto_1706543 ?auto_1706548 ) ) ( not ( = ?auto_1706543 ?auto_1706549 ) ) ( not ( = ?auto_1706543 ?auto_1706554 ) ) ( not ( = ?auto_1706544 ?auto_1706545 ) ) ( not ( = ?auto_1706544 ?auto_1706546 ) ) ( not ( = ?auto_1706544 ?auto_1706547 ) ) ( not ( = ?auto_1706544 ?auto_1706548 ) ) ( not ( = ?auto_1706544 ?auto_1706549 ) ) ( not ( = ?auto_1706544 ?auto_1706554 ) ) ( not ( = ?auto_1706545 ?auto_1706546 ) ) ( not ( = ?auto_1706545 ?auto_1706547 ) ) ( not ( = ?auto_1706545 ?auto_1706548 ) ) ( not ( = ?auto_1706545 ?auto_1706549 ) ) ( not ( = ?auto_1706545 ?auto_1706554 ) ) ( not ( = ?auto_1706546 ?auto_1706547 ) ) ( not ( = ?auto_1706546 ?auto_1706548 ) ) ( not ( = ?auto_1706546 ?auto_1706549 ) ) ( not ( = ?auto_1706546 ?auto_1706554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1706547 ?auto_1706548 ?auto_1706549 )
      ( MAKE-6CRATE-VERIFY ?auto_1706543 ?auto_1706544 ?auto_1706545 ?auto_1706546 ?auto_1706547 ?auto_1706548 ?auto_1706549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1708219 - SURFACE
      ?auto_1708220 - SURFACE
    )
    :vars
    (
      ?auto_1708223 - HOIST
      ?auto_1708221 - PLACE
      ?auto_1708227 - SURFACE
      ?auto_1708222 - TRUCK
      ?auto_1708225 - PLACE
      ?auto_1708226 - HOIST
      ?auto_1708224 - SURFACE
      ?auto_1708228 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708223 ?auto_1708221 ) ( SURFACE-AT ?auto_1708219 ?auto_1708221 ) ( CLEAR ?auto_1708219 ) ( IS-CRATE ?auto_1708220 ) ( not ( = ?auto_1708219 ?auto_1708220 ) ) ( AVAILABLE ?auto_1708223 ) ( ON ?auto_1708219 ?auto_1708227 ) ( not ( = ?auto_1708227 ?auto_1708219 ) ) ( not ( = ?auto_1708227 ?auto_1708220 ) ) ( TRUCK-AT ?auto_1708222 ?auto_1708225 ) ( not ( = ?auto_1708225 ?auto_1708221 ) ) ( HOIST-AT ?auto_1708226 ?auto_1708225 ) ( not ( = ?auto_1708223 ?auto_1708226 ) ) ( SURFACE-AT ?auto_1708220 ?auto_1708225 ) ( ON ?auto_1708220 ?auto_1708224 ) ( CLEAR ?auto_1708220 ) ( not ( = ?auto_1708219 ?auto_1708224 ) ) ( not ( = ?auto_1708220 ?auto_1708224 ) ) ( not ( = ?auto_1708227 ?auto_1708224 ) ) ( LIFTING ?auto_1708226 ?auto_1708228 ) ( IS-CRATE ?auto_1708228 ) ( not ( = ?auto_1708219 ?auto_1708228 ) ) ( not ( = ?auto_1708220 ?auto_1708228 ) ) ( not ( = ?auto_1708227 ?auto_1708228 ) ) ( not ( = ?auto_1708224 ?auto_1708228 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1708226 ?auto_1708228 ?auto_1708222 ?auto_1708225 )
      ( MAKE-1CRATE ?auto_1708219 ?auto_1708220 )
      ( MAKE-1CRATE-VERIFY ?auto_1708219 ?auto_1708220 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708495 - SURFACE
      ?auto_1708496 - SURFACE
      ?auto_1708497 - SURFACE
      ?auto_1708498 - SURFACE
      ?auto_1708499 - SURFACE
      ?auto_1708500 - SURFACE
      ?auto_1708501 - SURFACE
      ?auto_1708502 - SURFACE
    )
    :vars
    (
      ?auto_1708504 - HOIST
      ?auto_1708503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708504 ?auto_1708503 ) ( SURFACE-AT ?auto_1708501 ?auto_1708503 ) ( CLEAR ?auto_1708501 ) ( LIFTING ?auto_1708504 ?auto_1708502 ) ( IS-CRATE ?auto_1708502 ) ( not ( = ?auto_1708501 ?auto_1708502 ) ) ( ON ?auto_1708496 ?auto_1708495 ) ( ON ?auto_1708497 ?auto_1708496 ) ( ON ?auto_1708498 ?auto_1708497 ) ( ON ?auto_1708499 ?auto_1708498 ) ( ON ?auto_1708500 ?auto_1708499 ) ( ON ?auto_1708501 ?auto_1708500 ) ( not ( = ?auto_1708495 ?auto_1708496 ) ) ( not ( = ?auto_1708495 ?auto_1708497 ) ) ( not ( = ?auto_1708495 ?auto_1708498 ) ) ( not ( = ?auto_1708495 ?auto_1708499 ) ) ( not ( = ?auto_1708495 ?auto_1708500 ) ) ( not ( = ?auto_1708495 ?auto_1708501 ) ) ( not ( = ?auto_1708495 ?auto_1708502 ) ) ( not ( = ?auto_1708496 ?auto_1708497 ) ) ( not ( = ?auto_1708496 ?auto_1708498 ) ) ( not ( = ?auto_1708496 ?auto_1708499 ) ) ( not ( = ?auto_1708496 ?auto_1708500 ) ) ( not ( = ?auto_1708496 ?auto_1708501 ) ) ( not ( = ?auto_1708496 ?auto_1708502 ) ) ( not ( = ?auto_1708497 ?auto_1708498 ) ) ( not ( = ?auto_1708497 ?auto_1708499 ) ) ( not ( = ?auto_1708497 ?auto_1708500 ) ) ( not ( = ?auto_1708497 ?auto_1708501 ) ) ( not ( = ?auto_1708497 ?auto_1708502 ) ) ( not ( = ?auto_1708498 ?auto_1708499 ) ) ( not ( = ?auto_1708498 ?auto_1708500 ) ) ( not ( = ?auto_1708498 ?auto_1708501 ) ) ( not ( = ?auto_1708498 ?auto_1708502 ) ) ( not ( = ?auto_1708499 ?auto_1708500 ) ) ( not ( = ?auto_1708499 ?auto_1708501 ) ) ( not ( = ?auto_1708499 ?auto_1708502 ) ) ( not ( = ?auto_1708500 ?auto_1708501 ) ) ( not ( = ?auto_1708500 ?auto_1708502 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1708501 ?auto_1708502 )
      ( MAKE-7CRATE-VERIFY ?auto_1708495 ?auto_1708496 ?auto_1708497 ?auto_1708498 ?auto_1708499 ?auto_1708500 ?auto_1708501 ?auto_1708502 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708550 - SURFACE
      ?auto_1708551 - SURFACE
      ?auto_1708552 - SURFACE
      ?auto_1708553 - SURFACE
      ?auto_1708554 - SURFACE
      ?auto_1708555 - SURFACE
      ?auto_1708556 - SURFACE
      ?auto_1708557 - SURFACE
    )
    :vars
    (
      ?auto_1708559 - HOIST
      ?auto_1708560 - PLACE
      ?auto_1708558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708559 ?auto_1708560 ) ( SURFACE-AT ?auto_1708556 ?auto_1708560 ) ( CLEAR ?auto_1708556 ) ( IS-CRATE ?auto_1708557 ) ( not ( = ?auto_1708556 ?auto_1708557 ) ) ( TRUCK-AT ?auto_1708558 ?auto_1708560 ) ( AVAILABLE ?auto_1708559 ) ( IN ?auto_1708557 ?auto_1708558 ) ( ON ?auto_1708556 ?auto_1708555 ) ( not ( = ?auto_1708555 ?auto_1708556 ) ) ( not ( = ?auto_1708555 ?auto_1708557 ) ) ( ON ?auto_1708551 ?auto_1708550 ) ( ON ?auto_1708552 ?auto_1708551 ) ( ON ?auto_1708553 ?auto_1708552 ) ( ON ?auto_1708554 ?auto_1708553 ) ( ON ?auto_1708555 ?auto_1708554 ) ( not ( = ?auto_1708550 ?auto_1708551 ) ) ( not ( = ?auto_1708550 ?auto_1708552 ) ) ( not ( = ?auto_1708550 ?auto_1708553 ) ) ( not ( = ?auto_1708550 ?auto_1708554 ) ) ( not ( = ?auto_1708550 ?auto_1708555 ) ) ( not ( = ?auto_1708550 ?auto_1708556 ) ) ( not ( = ?auto_1708550 ?auto_1708557 ) ) ( not ( = ?auto_1708551 ?auto_1708552 ) ) ( not ( = ?auto_1708551 ?auto_1708553 ) ) ( not ( = ?auto_1708551 ?auto_1708554 ) ) ( not ( = ?auto_1708551 ?auto_1708555 ) ) ( not ( = ?auto_1708551 ?auto_1708556 ) ) ( not ( = ?auto_1708551 ?auto_1708557 ) ) ( not ( = ?auto_1708552 ?auto_1708553 ) ) ( not ( = ?auto_1708552 ?auto_1708554 ) ) ( not ( = ?auto_1708552 ?auto_1708555 ) ) ( not ( = ?auto_1708552 ?auto_1708556 ) ) ( not ( = ?auto_1708552 ?auto_1708557 ) ) ( not ( = ?auto_1708553 ?auto_1708554 ) ) ( not ( = ?auto_1708553 ?auto_1708555 ) ) ( not ( = ?auto_1708553 ?auto_1708556 ) ) ( not ( = ?auto_1708553 ?auto_1708557 ) ) ( not ( = ?auto_1708554 ?auto_1708555 ) ) ( not ( = ?auto_1708554 ?auto_1708556 ) ) ( not ( = ?auto_1708554 ?auto_1708557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708555 ?auto_1708556 ?auto_1708557 )
      ( MAKE-7CRATE-VERIFY ?auto_1708550 ?auto_1708551 ?auto_1708552 ?auto_1708553 ?auto_1708554 ?auto_1708555 ?auto_1708556 ?auto_1708557 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708613 - SURFACE
      ?auto_1708614 - SURFACE
      ?auto_1708615 - SURFACE
      ?auto_1708616 - SURFACE
      ?auto_1708617 - SURFACE
      ?auto_1708618 - SURFACE
      ?auto_1708619 - SURFACE
      ?auto_1708620 - SURFACE
    )
    :vars
    (
      ?auto_1708621 - HOIST
      ?auto_1708624 - PLACE
      ?auto_1708622 - TRUCK
      ?auto_1708623 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708621 ?auto_1708624 ) ( SURFACE-AT ?auto_1708619 ?auto_1708624 ) ( CLEAR ?auto_1708619 ) ( IS-CRATE ?auto_1708620 ) ( not ( = ?auto_1708619 ?auto_1708620 ) ) ( AVAILABLE ?auto_1708621 ) ( IN ?auto_1708620 ?auto_1708622 ) ( ON ?auto_1708619 ?auto_1708618 ) ( not ( = ?auto_1708618 ?auto_1708619 ) ) ( not ( = ?auto_1708618 ?auto_1708620 ) ) ( TRUCK-AT ?auto_1708622 ?auto_1708623 ) ( not ( = ?auto_1708623 ?auto_1708624 ) ) ( ON ?auto_1708614 ?auto_1708613 ) ( ON ?auto_1708615 ?auto_1708614 ) ( ON ?auto_1708616 ?auto_1708615 ) ( ON ?auto_1708617 ?auto_1708616 ) ( ON ?auto_1708618 ?auto_1708617 ) ( not ( = ?auto_1708613 ?auto_1708614 ) ) ( not ( = ?auto_1708613 ?auto_1708615 ) ) ( not ( = ?auto_1708613 ?auto_1708616 ) ) ( not ( = ?auto_1708613 ?auto_1708617 ) ) ( not ( = ?auto_1708613 ?auto_1708618 ) ) ( not ( = ?auto_1708613 ?auto_1708619 ) ) ( not ( = ?auto_1708613 ?auto_1708620 ) ) ( not ( = ?auto_1708614 ?auto_1708615 ) ) ( not ( = ?auto_1708614 ?auto_1708616 ) ) ( not ( = ?auto_1708614 ?auto_1708617 ) ) ( not ( = ?auto_1708614 ?auto_1708618 ) ) ( not ( = ?auto_1708614 ?auto_1708619 ) ) ( not ( = ?auto_1708614 ?auto_1708620 ) ) ( not ( = ?auto_1708615 ?auto_1708616 ) ) ( not ( = ?auto_1708615 ?auto_1708617 ) ) ( not ( = ?auto_1708615 ?auto_1708618 ) ) ( not ( = ?auto_1708615 ?auto_1708619 ) ) ( not ( = ?auto_1708615 ?auto_1708620 ) ) ( not ( = ?auto_1708616 ?auto_1708617 ) ) ( not ( = ?auto_1708616 ?auto_1708618 ) ) ( not ( = ?auto_1708616 ?auto_1708619 ) ) ( not ( = ?auto_1708616 ?auto_1708620 ) ) ( not ( = ?auto_1708617 ?auto_1708618 ) ) ( not ( = ?auto_1708617 ?auto_1708619 ) ) ( not ( = ?auto_1708617 ?auto_1708620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708618 ?auto_1708619 ?auto_1708620 )
      ( MAKE-7CRATE-VERIFY ?auto_1708613 ?auto_1708614 ?auto_1708615 ?auto_1708616 ?auto_1708617 ?auto_1708618 ?auto_1708619 ?auto_1708620 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708683 - SURFACE
      ?auto_1708684 - SURFACE
      ?auto_1708685 - SURFACE
      ?auto_1708686 - SURFACE
      ?auto_1708687 - SURFACE
      ?auto_1708688 - SURFACE
      ?auto_1708689 - SURFACE
      ?auto_1708690 - SURFACE
    )
    :vars
    (
      ?auto_1708692 - HOIST
      ?auto_1708691 - PLACE
      ?auto_1708693 - TRUCK
      ?auto_1708694 - PLACE
      ?auto_1708695 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708692 ?auto_1708691 ) ( SURFACE-AT ?auto_1708689 ?auto_1708691 ) ( CLEAR ?auto_1708689 ) ( IS-CRATE ?auto_1708690 ) ( not ( = ?auto_1708689 ?auto_1708690 ) ) ( AVAILABLE ?auto_1708692 ) ( ON ?auto_1708689 ?auto_1708688 ) ( not ( = ?auto_1708688 ?auto_1708689 ) ) ( not ( = ?auto_1708688 ?auto_1708690 ) ) ( TRUCK-AT ?auto_1708693 ?auto_1708694 ) ( not ( = ?auto_1708694 ?auto_1708691 ) ) ( HOIST-AT ?auto_1708695 ?auto_1708694 ) ( LIFTING ?auto_1708695 ?auto_1708690 ) ( not ( = ?auto_1708692 ?auto_1708695 ) ) ( ON ?auto_1708684 ?auto_1708683 ) ( ON ?auto_1708685 ?auto_1708684 ) ( ON ?auto_1708686 ?auto_1708685 ) ( ON ?auto_1708687 ?auto_1708686 ) ( ON ?auto_1708688 ?auto_1708687 ) ( not ( = ?auto_1708683 ?auto_1708684 ) ) ( not ( = ?auto_1708683 ?auto_1708685 ) ) ( not ( = ?auto_1708683 ?auto_1708686 ) ) ( not ( = ?auto_1708683 ?auto_1708687 ) ) ( not ( = ?auto_1708683 ?auto_1708688 ) ) ( not ( = ?auto_1708683 ?auto_1708689 ) ) ( not ( = ?auto_1708683 ?auto_1708690 ) ) ( not ( = ?auto_1708684 ?auto_1708685 ) ) ( not ( = ?auto_1708684 ?auto_1708686 ) ) ( not ( = ?auto_1708684 ?auto_1708687 ) ) ( not ( = ?auto_1708684 ?auto_1708688 ) ) ( not ( = ?auto_1708684 ?auto_1708689 ) ) ( not ( = ?auto_1708684 ?auto_1708690 ) ) ( not ( = ?auto_1708685 ?auto_1708686 ) ) ( not ( = ?auto_1708685 ?auto_1708687 ) ) ( not ( = ?auto_1708685 ?auto_1708688 ) ) ( not ( = ?auto_1708685 ?auto_1708689 ) ) ( not ( = ?auto_1708685 ?auto_1708690 ) ) ( not ( = ?auto_1708686 ?auto_1708687 ) ) ( not ( = ?auto_1708686 ?auto_1708688 ) ) ( not ( = ?auto_1708686 ?auto_1708689 ) ) ( not ( = ?auto_1708686 ?auto_1708690 ) ) ( not ( = ?auto_1708687 ?auto_1708688 ) ) ( not ( = ?auto_1708687 ?auto_1708689 ) ) ( not ( = ?auto_1708687 ?auto_1708690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708688 ?auto_1708689 ?auto_1708690 )
      ( MAKE-7CRATE-VERIFY ?auto_1708683 ?auto_1708684 ?auto_1708685 ?auto_1708686 ?auto_1708687 ?auto_1708688 ?auto_1708689 ?auto_1708690 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708760 - SURFACE
      ?auto_1708761 - SURFACE
      ?auto_1708762 - SURFACE
      ?auto_1708763 - SURFACE
      ?auto_1708764 - SURFACE
      ?auto_1708765 - SURFACE
      ?auto_1708766 - SURFACE
      ?auto_1708767 - SURFACE
    )
    :vars
    (
      ?auto_1708770 - HOIST
      ?auto_1708772 - PLACE
      ?auto_1708771 - TRUCK
      ?auto_1708773 - PLACE
      ?auto_1708768 - HOIST
      ?auto_1708769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708770 ?auto_1708772 ) ( SURFACE-AT ?auto_1708766 ?auto_1708772 ) ( CLEAR ?auto_1708766 ) ( IS-CRATE ?auto_1708767 ) ( not ( = ?auto_1708766 ?auto_1708767 ) ) ( AVAILABLE ?auto_1708770 ) ( ON ?auto_1708766 ?auto_1708765 ) ( not ( = ?auto_1708765 ?auto_1708766 ) ) ( not ( = ?auto_1708765 ?auto_1708767 ) ) ( TRUCK-AT ?auto_1708771 ?auto_1708773 ) ( not ( = ?auto_1708773 ?auto_1708772 ) ) ( HOIST-AT ?auto_1708768 ?auto_1708773 ) ( not ( = ?auto_1708770 ?auto_1708768 ) ) ( AVAILABLE ?auto_1708768 ) ( SURFACE-AT ?auto_1708767 ?auto_1708773 ) ( ON ?auto_1708767 ?auto_1708769 ) ( CLEAR ?auto_1708767 ) ( not ( = ?auto_1708766 ?auto_1708769 ) ) ( not ( = ?auto_1708767 ?auto_1708769 ) ) ( not ( = ?auto_1708765 ?auto_1708769 ) ) ( ON ?auto_1708761 ?auto_1708760 ) ( ON ?auto_1708762 ?auto_1708761 ) ( ON ?auto_1708763 ?auto_1708762 ) ( ON ?auto_1708764 ?auto_1708763 ) ( ON ?auto_1708765 ?auto_1708764 ) ( not ( = ?auto_1708760 ?auto_1708761 ) ) ( not ( = ?auto_1708760 ?auto_1708762 ) ) ( not ( = ?auto_1708760 ?auto_1708763 ) ) ( not ( = ?auto_1708760 ?auto_1708764 ) ) ( not ( = ?auto_1708760 ?auto_1708765 ) ) ( not ( = ?auto_1708760 ?auto_1708766 ) ) ( not ( = ?auto_1708760 ?auto_1708767 ) ) ( not ( = ?auto_1708760 ?auto_1708769 ) ) ( not ( = ?auto_1708761 ?auto_1708762 ) ) ( not ( = ?auto_1708761 ?auto_1708763 ) ) ( not ( = ?auto_1708761 ?auto_1708764 ) ) ( not ( = ?auto_1708761 ?auto_1708765 ) ) ( not ( = ?auto_1708761 ?auto_1708766 ) ) ( not ( = ?auto_1708761 ?auto_1708767 ) ) ( not ( = ?auto_1708761 ?auto_1708769 ) ) ( not ( = ?auto_1708762 ?auto_1708763 ) ) ( not ( = ?auto_1708762 ?auto_1708764 ) ) ( not ( = ?auto_1708762 ?auto_1708765 ) ) ( not ( = ?auto_1708762 ?auto_1708766 ) ) ( not ( = ?auto_1708762 ?auto_1708767 ) ) ( not ( = ?auto_1708762 ?auto_1708769 ) ) ( not ( = ?auto_1708763 ?auto_1708764 ) ) ( not ( = ?auto_1708763 ?auto_1708765 ) ) ( not ( = ?auto_1708763 ?auto_1708766 ) ) ( not ( = ?auto_1708763 ?auto_1708767 ) ) ( not ( = ?auto_1708763 ?auto_1708769 ) ) ( not ( = ?auto_1708764 ?auto_1708765 ) ) ( not ( = ?auto_1708764 ?auto_1708766 ) ) ( not ( = ?auto_1708764 ?auto_1708767 ) ) ( not ( = ?auto_1708764 ?auto_1708769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708765 ?auto_1708766 ?auto_1708767 )
      ( MAKE-7CRATE-VERIFY ?auto_1708760 ?auto_1708761 ?auto_1708762 ?auto_1708763 ?auto_1708764 ?auto_1708765 ?auto_1708766 ?auto_1708767 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708838 - SURFACE
      ?auto_1708839 - SURFACE
      ?auto_1708840 - SURFACE
      ?auto_1708841 - SURFACE
      ?auto_1708842 - SURFACE
      ?auto_1708843 - SURFACE
      ?auto_1708844 - SURFACE
      ?auto_1708845 - SURFACE
    )
    :vars
    (
      ?auto_1708850 - HOIST
      ?auto_1708846 - PLACE
      ?auto_1708847 - PLACE
      ?auto_1708851 - HOIST
      ?auto_1708848 - SURFACE
      ?auto_1708849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708850 ?auto_1708846 ) ( SURFACE-AT ?auto_1708844 ?auto_1708846 ) ( CLEAR ?auto_1708844 ) ( IS-CRATE ?auto_1708845 ) ( not ( = ?auto_1708844 ?auto_1708845 ) ) ( AVAILABLE ?auto_1708850 ) ( ON ?auto_1708844 ?auto_1708843 ) ( not ( = ?auto_1708843 ?auto_1708844 ) ) ( not ( = ?auto_1708843 ?auto_1708845 ) ) ( not ( = ?auto_1708847 ?auto_1708846 ) ) ( HOIST-AT ?auto_1708851 ?auto_1708847 ) ( not ( = ?auto_1708850 ?auto_1708851 ) ) ( AVAILABLE ?auto_1708851 ) ( SURFACE-AT ?auto_1708845 ?auto_1708847 ) ( ON ?auto_1708845 ?auto_1708848 ) ( CLEAR ?auto_1708845 ) ( not ( = ?auto_1708844 ?auto_1708848 ) ) ( not ( = ?auto_1708845 ?auto_1708848 ) ) ( not ( = ?auto_1708843 ?auto_1708848 ) ) ( TRUCK-AT ?auto_1708849 ?auto_1708846 ) ( ON ?auto_1708839 ?auto_1708838 ) ( ON ?auto_1708840 ?auto_1708839 ) ( ON ?auto_1708841 ?auto_1708840 ) ( ON ?auto_1708842 ?auto_1708841 ) ( ON ?auto_1708843 ?auto_1708842 ) ( not ( = ?auto_1708838 ?auto_1708839 ) ) ( not ( = ?auto_1708838 ?auto_1708840 ) ) ( not ( = ?auto_1708838 ?auto_1708841 ) ) ( not ( = ?auto_1708838 ?auto_1708842 ) ) ( not ( = ?auto_1708838 ?auto_1708843 ) ) ( not ( = ?auto_1708838 ?auto_1708844 ) ) ( not ( = ?auto_1708838 ?auto_1708845 ) ) ( not ( = ?auto_1708838 ?auto_1708848 ) ) ( not ( = ?auto_1708839 ?auto_1708840 ) ) ( not ( = ?auto_1708839 ?auto_1708841 ) ) ( not ( = ?auto_1708839 ?auto_1708842 ) ) ( not ( = ?auto_1708839 ?auto_1708843 ) ) ( not ( = ?auto_1708839 ?auto_1708844 ) ) ( not ( = ?auto_1708839 ?auto_1708845 ) ) ( not ( = ?auto_1708839 ?auto_1708848 ) ) ( not ( = ?auto_1708840 ?auto_1708841 ) ) ( not ( = ?auto_1708840 ?auto_1708842 ) ) ( not ( = ?auto_1708840 ?auto_1708843 ) ) ( not ( = ?auto_1708840 ?auto_1708844 ) ) ( not ( = ?auto_1708840 ?auto_1708845 ) ) ( not ( = ?auto_1708840 ?auto_1708848 ) ) ( not ( = ?auto_1708841 ?auto_1708842 ) ) ( not ( = ?auto_1708841 ?auto_1708843 ) ) ( not ( = ?auto_1708841 ?auto_1708844 ) ) ( not ( = ?auto_1708841 ?auto_1708845 ) ) ( not ( = ?auto_1708841 ?auto_1708848 ) ) ( not ( = ?auto_1708842 ?auto_1708843 ) ) ( not ( = ?auto_1708842 ?auto_1708844 ) ) ( not ( = ?auto_1708842 ?auto_1708845 ) ) ( not ( = ?auto_1708842 ?auto_1708848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708843 ?auto_1708844 ?auto_1708845 )
      ( MAKE-7CRATE-VERIFY ?auto_1708838 ?auto_1708839 ?auto_1708840 ?auto_1708841 ?auto_1708842 ?auto_1708843 ?auto_1708844 ?auto_1708845 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708916 - SURFACE
      ?auto_1708917 - SURFACE
      ?auto_1708918 - SURFACE
      ?auto_1708919 - SURFACE
      ?auto_1708920 - SURFACE
      ?auto_1708921 - SURFACE
      ?auto_1708922 - SURFACE
      ?auto_1708923 - SURFACE
    )
    :vars
    (
      ?auto_1708929 - HOIST
      ?auto_1708928 - PLACE
      ?auto_1708926 - PLACE
      ?auto_1708924 - HOIST
      ?auto_1708927 - SURFACE
      ?auto_1708925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1708929 ?auto_1708928 ) ( IS-CRATE ?auto_1708923 ) ( not ( = ?auto_1708922 ?auto_1708923 ) ) ( not ( = ?auto_1708921 ?auto_1708922 ) ) ( not ( = ?auto_1708921 ?auto_1708923 ) ) ( not ( = ?auto_1708926 ?auto_1708928 ) ) ( HOIST-AT ?auto_1708924 ?auto_1708926 ) ( not ( = ?auto_1708929 ?auto_1708924 ) ) ( AVAILABLE ?auto_1708924 ) ( SURFACE-AT ?auto_1708923 ?auto_1708926 ) ( ON ?auto_1708923 ?auto_1708927 ) ( CLEAR ?auto_1708923 ) ( not ( = ?auto_1708922 ?auto_1708927 ) ) ( not ( = ?auto_1708923 ?auto_1708927 ) ) ( not ( = ?auto_1708921 ?auto_1708927 ) ) ( TRUCK-AT ?auto_1708925 ?auto_1708928 ) ( SURFACE-AT ?auto_1708921 ?auto_1708928 ) ( CLEAR ?auto_1708921 ) ( LIFTING ?auto_1708929 ?auto_1708922 ) ( IS-CRATE ?auto_1708922 ) ( ON ?auto_1708917 ?auto_1708916 ) ( ON ?auto_1708918 ?auto_1708917 ) ( ON ?auto_1708919 ?auto_1708918 ) ( ON ?auto_1708920 ?auto_1708919 ) ( ON ?auto_1708921 ?auto_1708920 ) ( not ( = ?auto_1708916 ?auto_1708917 ) ) ( not ( = ?auto_1708916 ?auto_1708918 ) ) ( not ( = ?auto_1708916 ?auto_1708919 ) ) ( not ( = ?auto_1708916 ?auto_1708920 ) ) ( not ( = ?auto_1708916 ?auto_1708921 ) ) ( not ( = ?auto_1708916 ?auto_1708922 ) ) ( not ( = ?auto_1708916 ?auto_1708923 ) ) ( not ( = ?auto_1708916 ?auto_1708927 ) ) ( not ( = ?auto_1708917 ?auto_1708918 ) ) ( not ( = ?auto_1708917 ?auto_1708919 ) ) ( not ( = ?auto_1708917 ?auto_1708920 ) ) ( not ( = ?auto_1708917 ?auto_1708921 ) ) ( not ( = ?auto_1708917 ?auto_1708922 ) ) ( not ( = ?auto_1708917 ?auto_1708923 ) ) ( not ( = ?auto_1708917 ?auto_1708927 ) ) ( not ( = ?auto_1708918 ?auto_1708919 ) ) ( not ( = ?auto_1708918 ?auto_1708920 ) ) ( not ( = ?auto_1708918 ?auto_1708921 ) ) ( not ( = ?auto_1708918 ?auto_1708922 ) ) ( not ( = ?auto_1708918 ?auto_1708923 ) ) ( not ( = ?auto_1708918 ?auto_1708927 ) ) ( not ( = ?auto_1708919 ?auto_1708920 ) ) ( not ( = ?auto_1708919 ?auto_1708921 ) ) ( not ( = ?auto_1708919 ?auto_1708922 ) ) ( not ( = ?auto_1708919 ?auto_1708923 ) ) ( not ( = ?auto_1708919 ?auto_1708927 ) ) ( not ( = ?auto_1708920 ?auto_1708921 ) ) ( not ( = ?auto_1708920 ?auto_1708922 ) ) ( not ( = ?auto_1708920 ?auto_1708923 ) ) ( not ( = ?auto_1708920 ?auto_1708927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708921 ?auto_1708922 ?auto_1708923 )
      ( MAKE-7CRATE-VERIFY ?auto_1708916 ?auto_1708917 ?auto_1708918 ?auto_1708919 ?auto_1708920 ?auto_1708921 ?auto_1708922 ?auto_1708923 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1708994 - SURFACE
      ?auto_1708995 - SURFACE
      ?auto_1708996 - SURFACE
      ?auto_1708997 - SURFACE
      ?auto_1708998 - SURFACE
      ?auto_1708999 - SURFACE
      ?auto_1709000 - SURFACE
      ?auto_1709001 - SURFACE
    )
    :vars
    (
      ?auto_1709005 - HOIST
      ?auto_1709004 - PLACE
      ?auto_1709002 - PLACE
      ?auto_1709007 - HOIST
      ?auto_1709003 - SURFACE
      ?auto_1709006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1709005 ?auto_1709004 ) ( IS-CRATE ?auto_1709001 ) ( not ( = ?auto_1709000 ?auto_1709001 ) ) ( not ( = ?auto_1708999 ?auto_1709000 ) ) ( not ( = ?auto_1708999 ?auto_1709001 ) ) ( not ( = ?auto_1709002 ?auto_1709004 ) ) ( HOIST-AT ?auto_1709007 ?auto_1709002 ) ( not ( = ?auto_1709005 ?auto_1709007 ) ) ( AVAILABLE ?auto_1709007 ) ( SURFACE-AT ?auto_1709001 ?auto_1709002 ) ( ON ?auto_1709001 ?auto_1709003 ) ( CLEAR ?auto_1709001 ) ( not ( = ?auto_1709000 ?auto_1709003 ) ) ( not ( = ?auto_1709001 ?auto_1709003 ) ) ( not ( = ?auto_1708999 ?auto_1709003 ) ) ( TRUCK-AT ?auto_1709006 ?auto_1709004 ) ( SURFACE-AT ?auto_1708999 ?auto_1709004 ) ( CLEAR ?auto_1708999 ) ( IS-CRATE ?auto_1709000 ) ( AVAILABLE ?auto_1709005 ) ( IN ?auto_1709000 ?auto_1709006 ) ( ON ?auto_1708995 ?auto_1708994 ) ( ON ?auto_1708996 ?auto_1708995 ) ( ON ?auto_1708997 ?auto_1708996 ) ( ON ?auto_1708998 ?auto_1708997 ) ( ON ?auto_1708999 ?auto_1708998 ) ( not ( = ?auto_1708994 ?auto_1708995 ) ) ( not ( = ?auto_1708994 ?auto_1708996 ) ) ( not ( = ?auto_1708994 ?auto_1708997 ) ) ( not ( = ?auto_1708994 ?auto_1708998 ) ) ( not ( = ?auto_1708994 ?auto_1708999 ) ) ( not ( = ?auto_1708994 ?auto_1709000 ) ) ( not ( = ?auto_1708994 ?auto_1709001 ) ) ( not ( = ?auto_1708994 ?auto_1709003 ) ) ( not ( = ?auto_1708995 ?auto_1708996 ) ) ( not ( = ?auto_1708995 ?auto_1708997 ) ) ( not ( = ?auto_1708995 ?auto_1708998 ) ) ( not ( = ?auto_1708995 ?auto_1708999 ) ) ( not ( = ?auto_1708995 ?auto_1709000 ) ) ( not ( = ?auto_1708995 ?auto_1709001 ) ) ( not ( = ?auto_1708995 ?auto_1709003 ) ) ( not ( = ?auto_1708996 ?auto_1708997 ) ) ( not ( = ?auto_1708996 ?auto_1708998 ) ) ( not ( = ?auto_1708996 ?auto_1708999 ) ) ( not ( = ?auto_1708996 ?auto_1709000 ) ) ( not ( = ?auto_1708996 ?auto_1709001 ) ) ( not ( = ?auto_1708996 ?auto_1709003 ) ) ( not ( = ?auto_1708997 ?auto_1708998 ) ) ( not ( = ?auto_1708997 ?auto_1708999 ) ) ( not ( = ?auto_1708997 ?auto_1709000 ) ) ( not ( = ?auto_1708997 ?auto_1709001 ) ) ( not ( = ?auto_1708997 ?auto_1709003 ) ) ( not ( = ?auto_1708998 ?auto_1708999 ) ) ( not ( = ?auto_1708998 ?auto_1709000 ) ) ( not ( = ?auto_1708998 ?auto_1709001 ) ) ( not ( = ?auto_1708998 ?auto_1709003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1708999 ?auto_1709000 ?auto_1709001 )
      ( MAKE-7CRATE-VERIFY ?auto_1708994 ?auto_1708995 ?auto_1708996 ?auto_1708997 ?auto_1708998 ?auto_1708999 ?auto_1709000 ?auto_1709001 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1711565 - SURFACE
      ?auto_1711566 - SURFACE
    )
    :vars
    (
      ?auto_1711572 - HOIST
      ?auto_1711568 - PLACE
      ?auto_1711573 - SURFACE
      ?auto_1711567 - PLACE
      ?auto_1711571 - HOIST
      ?auto_1711570 - SURFACE
      ?auto_1711569 - TRUCK
      ?auto_1711574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711572 ?auto_1711568 ) ( SURFACE-AT ?auto_1711565 ?auto_1711568 ) ( CLEAR ?auto_1711565 ) ( IS-CRATE ?auto_1711566 ) ( not ( = ?auto_1711565 ?auto_1711566 ) ) ( ON ?auto_1711565 ?auto_1711573 ) ( not ( = ?auto_1711573 ?auto_1711565 ) ) ( not ( = ?auto_1711573 ?auto_1711566 ) ) ( not ( = ?auto_1711567 ?auto_1711568 ) ) ( HOIST-AT ?auto_1711571 ?auto_1711567 ) ( not ( = ?auto_1711572 ?auto_1711571 ) ) ( AVAILABLE ?auto_1711571 ) ( SURFACE-AT ?auto_1711566 ?auto_1711567 ) ( ON ?auto_1711566 ?auto_1711570 ) ( CLEAR ?auto_1711566 ) ( not ( = ?auto_1711565 ?auto_1711570 ) ) ( not ( = ?auto_1711566 ?auto_1711570 ) ) ( not ( = ?auto_1711573 ?auto_1711570 ) ) ( TRUCK-AT ?auto_1711569 ?auto_1711568 ) ( LIFTING ?auto_1711572 ?auto_1711574 ) ( IS-CRATE ?auto_1711574 ) ( not ( = ?auto_1711565 ?auto_1711574 ) ) ( not ( = ?auto_1711566 ?auto_1711574 ) ) ( not ( = ?auto_1711573 ?auto_1711574 ) ) ( not ( = ?auto_1711570 ?auto_1711574 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1711572 ?auto_1711574 ?auto_1711569 ?auto_1711568 )
      ( MAKE-1CRATE ?auto_1711565 ?auto_1711566 )
      ( MAKE-1CRATE-VERIFY ?auto_1711565 ?auto_1711566 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711907 - SURFACE
      ?auto_1711908 - SURFACE
      ?auto_1711909 - SURFACE
      ?auto_1711910 - SURFACE
      ?auto_1711911 - SURFACE
      ?auto_1711912 - SURFACE
      ?auto_1711913 - SURFACE
      ?auto_1711914 - SURFACE
      ?auto_1711915 - SURFACE
    )
    :vars
    (
      ?auto_1711916 - HOIST
      ?auto_1711917 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711916 ?auto_1711917 ) ( SURFACE-AT ?auto_1711914 ?auto_1711917 ) ( CLEAR ?auto_1711914 ) ( LIFTING ?auto_1711916 ?auto_1711915 ) ( IS-CRATE ?auto_1711915 ) ( not ( = ?auto_1711914 ?auto_1711915 ) ) ( ON ?auto_1711908 ?auto_1711907 ) ( ON ?auto_1711909 ?auto_1711908 ) ( ON ?auto_1711910 ?auto_1711909 ) ( ON ?auto_1711911 ?auto_1711910 ) ( ON ?auto_1711912 ?auto_1711911 ) ( ON ?auto_1711913 ?auto_1711912 ) ( ON ?auto_1711914 ?auto_1711913 ) ( not ( = ?auto_1711907 ?auto_1711908 ) ) ( not ( = ?auto_1711907 ?auto_1711909 ) ) ( not ( = ?auto_1711907 ?auto_1711910 ) ) ( not ( = ?auto_1711907 ?auto_1711911 ) ) ( not ( = ?auto_1711907 ?auto_1711912 ) ) ( not ( = ?auto_1711907 ?auto_1711913 ) ) ( not ( = ?auto_1711907 ?auto_1711914 ) ) ( not ( = ?auto_1711907 ?auto_1711915 ) ) ( not ( = ?auto_1711908 ?auto_1711909 ) ) ( not ( = ?auto_1711908 ?auto_1711910 ) ) ( not ( = ?auto_1711908 ?auto_1711911 ) ) ( not ( = ?auto_1711908 ?auto_1711912 ) ) ( not ( = ?auto_1711908 ?auto_1711913 ) ) ( not ( = ?auto_1711908 ?auto_1711914 ) ) ( not ( = ?auto_1711908 ?auto_1711915 ) ) ( not ( = ?auto_1711909 ?auto_1711910 ) ) ( not ( = ?auto_1711909 ?auto_1711911 ) ) ( not ( = ?auto_1711909 ?auto_1711912 ) ) ( not ( = ?auto_1711909 ?auto_1711913 ) ) ( not ( = ?auto_1711909 ?auto_1711914 ) ) ( not ( = ?auto_1711909 ?auto_1711915 ) ) ( not ( = ?auto_1711910 ?auto_1711911 ) ) ( not ( = ?auto_1711910 ?auto_1711912 ) ) ( not ( = ?auto_1711910 ?auto_1711913 ) ) ( not ( = ?auto_1711910 ?auto_1711914 ) ) ( not ( = ?auto_1711910 ?auto_1711915 ) ) ( not ( = ?auto_1711911 ?auto_1711912 ) ) ( not ( = ?auto_1711911 ?auto_1711913 ) ) ( not ( = ?auto_1711911 ?auto_1711914 ) ) ( not ( = ?auto_1711911 ?auto_1711915 ) ) ( not ( = ?auto_1711912 ?auto_1711913 ) ) ( not ( = ?auto_1711912 ?auto_1711914 ) ) ( not ( = ?auto_1711912 ?auto_1711915 ) ) ( not ( = ?auto_1711913 ?auto_1711914 ) ) ( not ( = ?auto_1711913 ?auto_1711915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1711914 ?auto_1711915 )
      ( MAKE-8CRATE-VERIFY ?auto_1711907 ?auto_1711908 ?auto_1711909 ?auto_1711910 ?auto_1711911 ?auto_1711912 ?auto_1711913 ?auto_1711914 ?auto_1711915 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1711974 - SURFACE
      ?auto_1711975 - SURFACE
      ?auto_1711976 - SURFACE
      ?auto_1711977 - SURFACE
      ?auto_1711978 - SURFACE
      ?auto_1711979 - SURFACE
      ?auto_1711980 - SURFACE
      ?auto_1711981 - SURFACE
      ?auto_1711982 - SURFACE
    )
    :vars
    (
      ?auto_1711984 - HOIST
      ?auto_1711985 - PLACE
      ?auto_1711983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1711984 ?auto_1711985 ) ( SURFACE-AT ?auto_1711981 ?auto_1711985 ) ( CLEAR ?auto_1711981 ) ( IS-CRATE ?auto_1711982 ) ( not ( = ?auto_1711981 ?auto_1711982 ) ) ( TRUCK-AT ?auto_1711983 ?auto_1711985 ) ( AVAILABLE ?auto_1711984 ) ( IN ?auto_1711982 ?auto_1711983 ) ( ON ?auto_1711981 ?auto_1711980 ) ( not ( = ?auto_1711980 ?auto_1711981 ) ) ( not ( = ?auto_1711980 ?auto_1711982 ) ) ( ON ?auto_1711975 ?auto_1711974 ) ( ON ?auto_1711976 ?auto_1711975 ) ( ON ?auto_1711977 ?auto_1711976 ) ( ON ?auto_1711978 ?auto_1711977 ) ( ON ?auto_1711979 ?auto_1711978 ) ( ON ?auto_1711980 ?auto_1711979 ) ( not ( = ?auto_1711974 ?auto_1711975 ) ) ( not ( = ?auto_1711974 ?auto_1711976 ) ) ( not ( = ?auto_1711974 ?auto_1711977 ) ) ( not ( = ?auto_1711974 ?auto_1711978 ) ) ( not ( = ?auto_1711974 ?auto_1711979 ) ) ( not ( = ?auto_1711974 ?auto_1711980 ) ) ( not ( = ?auto_1711974 ?auto_1711981 ) ) ( not ( = ?auto_1711974 ?auto_1711982 ) ) ( not ( = ?auto_1711975 ?auto_1711976 ) ) ( not ( = ?auto_1711975 ?auto_1711977 ) ) ( not ( = ?auto_1711975 ?auto_1711978 ) ) ( not ( = ?auto_1711975 ?auto_1711979 ) ) ( not ( = ?auto_1711975 ?auto_1711980 ) ) ( not ( = ?auto_1711975 ?auto_1711981 ) ) ( not ( = ?auto_1711975 ?auto_1711982 ) ) ( not ( = ?auto_1711976 ?auto_1711977 ) ) ( not ( = ?auto_1711976 ?auto_1711978 ) ) ( not ( = ?auto_1711976 ?auto_1711979 ) ) ( not ( = ?auto_1711976 ?auto_1711980 ) ) ( not ( = ?auto_1711976 ?auto_1711981 ) ) ( not ( = ?auto_1711976 ?auto_1711982 ) ) ( not ( = ?auto_1711977 ?auto_1711978 ) ) ( not ( = ?auto_1711977 ?auto_1711979 ) ) ( not ( = ?auto_1711977 ?auto_1711980 ) ) ( not ( = ?auto_1711977 ?auto_1711981 ) ) ( not ( = ?auto_1711977 ?auto_1711982 ) ) ( not ( = ?auto_1711978 ?auto_1711979 ) ) ( not ( = ?auto_1711978 ?auto_1711980 ) ) ( not ( = ?auto_1711978 ?auto_1711981 ) ) ( not ( = ?auto_1711978 ?auto_1711982 ) ) ( not ( = ?auto_1711979 ?auto_1711980 ) ) ( not ( = ?auto_1711979 ?auto_1711981 ) ) ( not ( = ?auto_1711979 ?auto_1711982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1711980 ?auto_1711981 ?auto_1711982 )
      ( MAKE-8CRATE-VERIFY ?auto_1711974 ?auto_1711975 ?auto_1711976 ?auto_1711977 ?auto_1711978 ?auto_1711979 ?auto_1711980 ?auto_1711981 ?auto_1711982 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712050 - SURFACE
      ?auto_1712051 - SURFACE
      ?auto_1712052 - SURFACE
      ?auto_1712053 - SURFACE
      ?auto_1712054 - SURFACE
      ?auto_1712055 - SURFACE
      ?auto_1712056 - SURFACE
      ?auto_1712057 - SURFACE
      ?auto_1712058 - SURFACE
    )
    :vars
    (
      ?auto_1712059 - HOIST
      ?auto_1712061 - PLACE
      ?auto_1712060 - TRUCK
      ?auto_1712062 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712059 ?auto_1712061 ) ( SURFACE-AT ?auto_1712057 ?auto_1712061 ) ( CLEAR ?auto_1712057 ) ( IS-CRATE ?auto_1712058 ) ( not ( = ?auto_1712057 ?auto_1712058 ) ) ( AVAILABLE ?auto_1712059 ) ( IN ?auto_1712058 ?auto_1712060 ) ( ON ?auto_1712057 ?auto_1712056 ) ( not ( = ?auto_1712056 ?auto_1712057 ) ) ( not ( = ?auto_1712056 ?auto_1712058 ) ) ( TRUCK-AT ?auto_1712060 ?auto_1712062 ) ( not ( = ?auto_1712062 ?auto_1712061 ) ) ( ON ?auto_1712051 ?auto_1712050 ) ( ON ?auto_1712052 ?auto_1712051 ) ( ON ?auto_1712053 ?auto_1712052 ) ( ON ?auto_1712054 ?auto_1712053 ) ( ON ?auto_1712055 ?auto_1712054 ) ( ON ?auto_1712056 ?auto_1712055 ) ( not ( = ?auto_1712050 ?auto_1712051 ) ) ( not ( = ?auto_1712050 ?auto_1712052 ) ) ( not ( = ?auto_1712050 ?auto_1712053 ) ) ( not ( = ?auto_1712050 ?auto_1712054 ) ) ( not ( = ?auto_1712050 ?auto_1712055 ) ) ( not ( = ?auto_1712050 ?auto_1712056 ) ) ( not ( = ?auto_1712050 ?auto_1712057 ) ) ( not ( = ?auto_1712050 ?auto_1712058 ) ) ( not ( = ?auto_1712051 ?auto_1712052 ) ) ( not ( = ?auto_1712051 ?auto_1712053 ) ) ( not ( = ?auto_1712051 ?auto_1712054 ) ) ( not ( = ?auto_1712051 ?auto_1712055 ) ) ( not ( = ?auto_1712051 ?auto_1712056 ) ) ( not ( = ?auto_1712051 ?auto_1712057 ) ) ( not ( = ?auto_1712051 ?auto_1712058 ) ) ( not ( = ?auto_1712052 ?auto_1712053 ) ) ( not ( = ?auto_1712052 ?auto_1712054 ) ) ( not ( = ?auto_1712052 ?auto_1712055 ) ) ( not ( = ?auto_1712052 ?auto_1712056 ) ) ( not ( = ?auto_1712052 ?auto_1712057 ) ) ( not ( = ?auto_1712052 ?auto_1712058 ) ) ( not ( = ?auto_1712053 ?auto_1712054 ) ) ( not ( = ?auto_1712053 ?auto_1712055 ) ) ( not ( = ?auto_1712053 ?auto_1712056 ) ) ( not ( = ?auto_1712053 ?auto_1712057 ) ) ( not ( = ?auto_1712053 ?auto_1712058 ) ) ( not ( = ?auto_1712054 ?auto_1712055 ) ) ( not ( = ?auto_1712054 ?auto_1712056 ) ) ( not ( = ?auto_1712054 ?auto_1712057 ) ) ( not ( = ?auto_1712054 ?auto_1712058 ) ) ( not ( = ?auto_1712055 ?auto_1712056 ) ) ( not ( = ?auto_1712055 ?auto_1712057 ) ) ( not ( = ?auto_1712055 ?auto_1712058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712056 ?auto_1712057 ?auto_1712058 )
      ( MAKE-8CRATE-VERIFY ?auto_1712050 ?auto_1712051 ?auto_1712052 ?auto_1712053 ?auto_1712054 ?auto_1712055 ?auto_1712056 ?auto_1712057 ?auto_1712058 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712134 - SURFACE
      ?auto_1712135 - SURFACE
      ?auto_1712136 - SURFACE
      ?auto_1712137 - SURFACE
      ?auto_1712138 - SURFACE
      ?auto_1712139 - SURFACE
      ?auto_1712140 - SURFACE
      ?auto_1712141 - SURFACE
      ?auto_1712142 - SURFACE
    )
    :vars
    (
      ?auto_1712145 - HOIST
      ?auto_1712144 - PLACE
      ?auto_1712146 - TRUCK
      ?auto_1712147 - PLACE
      ?auto_1712143 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712145 ?auto_1712144 ) ( SURFACE-AT ?auto_1712141 ?auto_1712144 ) ( CLEAR ?auto_1712141 ) ( IS-CRATE ?auto_1712142 ) ( not ( = ?auto_1712141 ?auto_1712142 ) ) ( AVAILABLE ?auto_1712145 ) ( ON ?auto_1712141 ?auto_1712140 ) ( not ( = ?auto_1712140 ?auto_1712141 ) ) ( not ( = ?auto_1712140 ?auto_1712142 ) ) ( TRUCK-AT ?auto_1712146 ?auto_1712147 ) ( not ( = ?auto_1712147 ?auto_1712144 ) ) ( HOIST-AT ?auto_1712143 ?auto_1712147 ) ( LIFTING ?auto_1712143 ?auto_1712142 ) ( not ( = ?auto_1712145 ?auto_1712143 ) ) ( ON ?auto_1712135 ?auto_1712134 ) ( ON ?auto_1712136 ?auto_1712135 ) ( ON ?auto_1712137 ?auto_1712136 ) ( ON ?auto_1712138 ?auto_1712137 ) ( ON ?auto_1712139 ?auto_1712138 ) ( ON ?auto_1712140 ?auto_1712139 ) ( not ( = ?auto_1712134 ?auto_1712135 ) ) ( not ( = ?auto_1712134 ?auto_1712136 ) ) ( not ( = ?auto_1712134 ?auto_1712137 ) ) ( not ( = ?auto_1712134 ?auto_1712138 ) ) ( not ( = ?auto_1712134 ?auto_1712139 ) ) ( not ( = ?auto_1712134 ?auto_1712140 ) ) ( not ( = ?auto_1712134 ?auto_1712141 ) ) ( not ( = ?auto_1712134 ?auto_1712142 ) ) ( not ( = ?auto_1712135 ?auto_1712136 ) ) ( not ( = ?auto_1712135 ?auto_1712137 ) ) ( not ( = ?auto_1712135 ?auto_1712138 ) ) ( not ( = ?auto_1712135 ?auto_1712139 ) ) ( not ( = ?auto_1712135 ?auto_1712140 ) ) ( not ( = ?auto_1712135 ?auto_1712141 ) ) ( not ( = ?auto_1712135 ?auto_1712142 ) ) ( not ( = ?auto_1712136 ?auto_1712137 ) ) ( not ( = ?auto_1712136 ?auto_1712138 ) ) ( not ( = ?auto_1712136 ?auto_1712139 ) ) ( not ( = ?auto_1712136 ?auto_1712140 ) ) ( not ( = ?auto_1712136 ?auto_1712141 ) ) ( not ( = ?auto_1712136 ?auto_1712142 ) ) ( not ( = ?auto_1712137 ?auto_1712138 ) ) ( not ( = ?auto_1712137 ?auto_1712139 ) ) ( not ( = ?auto_1712137 ?auto_1712140 ) ) ( not ( = ?auto_1712137 ?auto_1712141 ) ) ( not ( = ?auto_1712137 ?auto_1712142 ) ) ( not ( = ?auto_1712138 ?auto_1712139 ) ) ( not ( = ?auto_1712138 ?auto_1712140 ) ) ( not ( = ?auto_1712138 ?auto_1712141 ) ) ( not ( = ?auto_1712138 ?auto_1712142 ) ) ( not ( = ?auto_1712139 ?auto_1712140 ) ) ( not ( = ?auto_1712139 ?auto_1712141 ) ) ( not ( = ?auto_1712139 ?auto_1712142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712140 ?auto_1712141 ?auto_1712142 )
      ( MAKE-8CRATE-VERIFY ?auto_1712134 ?auto_1712135 ?auto_1712136 ?auto_1712137 ?auto_1712138 ?auto_1712139 ?auto_1712140 ?auto_1712141 ?auto_1712142 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712226 - SURFACE
      ?auto_1712227 - SURFACE
      ?auto_1712228 - SURFACE
      ?auto_1712229 - SURFACE
      ?auto_1712230 - SURFACE
      ?auto_1712231 - SURFACE
      ?auto_1712232 - SURFACE
      ?auto_1712233 - SURFACE
      ?auto_1712234 - SURFACE
    )
    :vars
    (
      ?auto_1712239 - HOIST
      ?auto_1712240 - PLACE
      ?auto_1712235 - TRUCK
      ?auto_1712238 - PLACE
      ?auto_1712236 - HOIST
      ?auto_1712237 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712239 ?auto_1712240 ) ( SURFACE-AT ?auto_1712233 ?auto_1712240 ) ( CLEAR ?auto_1712233 ) ( IS-CRATE ?auto_1712234 ) ( not ( = ?auto_1712233 ?auto_1712234 ) ) ( AVAILABLE ?auto_1712239 ) ( ON ?auto_1712233 ?auto_1712232 ) ( not ( = ?auto_1712232 ?auto_1712233 ) ) ( not ( = ?auto_1712232 ?auto_1712234 ) ) ( TRUCK-AT ?auto_1712235 ?auto_1712238 ) ( not ( = ?auto_1712238 ?auto_1712240 ) ) ( HOIST-AT ?auto_1712236 ?auto_1712238 ) ( not ( = ?auto_1712239 ?auto_1712236 ) ) ( AVAILABLE ?auto_1712236 ) ( SURFACE-AT ?auto_1712234 ?auto_1712238 ) ( ON ?auto_1712234 ?auto_1712237 ) ( CLEAR ?auto_1712234 ) ( not ( = ?auto_1712233 ?auto_1712237 ) ) ( not ( = ?auto_1712234 ?auto_1712237 ) ) ( not ( = ?auto_1712232 ?auto_1712237 ) ) ( ON ?auto_1712227 ?auto_1712226 ) ( ON ?auto_1712228 ?auto_1712227 ) ( ON ?auto_1712229 ?auto_1712228 ) ( ON ?auto_1712230 ?auto_1712229 ) ( ON ?auto_1712231 ?auto_1712230 ) ( ON ?auto_1712232 ?auto_1712231 ) ( not ( = ?auto_1712226 ?auto_1712227 ) ) ( not ( = ?auto_1712226 ?auto_1712228 ) ) ( not ( = ?auto_1712226 ?auto_1712229 ) ) ( not ( = ?auto_1712226 ?auto_1712230 ) ) ( not ( = ?auto_1712226 ?auto_1712231 ) ) ( not ( = ?auto_1712226 ?auto_1712232 ) ) ( not ( = ?auto_1712226 ?auto_1712233 ) ) ( not ( = ?auto_1712226 ?auto_1712234 ) ) ( not ( = ?auto_1712226 ?auto_1712237 ) ) ( not ( = ?auto_1712227 ?auto_1712228 ) ) ( not ( = ?auto_1712227 ?auto_1712229 ) ) ( not ( = ?auto_1712227 ?auto_1712230 ) ) ( not ( = ?auto_1712227 ?auto_1712231 ) ) ( not ( = ?auto_1712227 ?auto_1712232 ) ) ( not ( = ?auto_1712227 ?auto_1712233 ) ) ( not ( = ?auto_1712227 ?auto_1712234 ) ) ( not ( = ?auto_1712227 ?auto_1712237 ) ) ( not ( = ?auto_1712228 ?auto_1712229 ) ) ( not ( = ?auto_1712228 ?auto_1712230 ) ) ( not ( = ?auto_1712228 ?auto_1712231 ) ) ( not ( = ?auto_1712228 ?auto_1712232 ) ) ( not ( = ?auto_1712228 ?auto_1712233 ) ) ( not ( = ?auto_1712228 ?auto_1712234 ) ) ( not ( = ?auto_1712228 ?auto_1712237 ) ) ( not ( = ?auto_1712229 ?auto_1712230 ) ) ( not ( = ?auto_1712229 ?auto_1712231 ) ) ( not ( = ?auto_1712229 ?auto_1712232 ) ) ( not ( = ?auto_1712229 ?auto_1712233 ) ) ( not ( = ?auto_1712229 ?auto_1712234 ) ) ( not ( = ?auto_1712229 ?auto_1712237 ) ) ( not ( = ?auto_1712230 ?auto_1712231 ) ) ( not ( = ?auto_1712230 ?auto_1712232 ) ) ( not ( = ?auto_1712230 ?auto_1712233 ) ) ( not ( = ?auto_1712230 ?auto_1712234 ) ) ( not ( = ?auto_1712230 ?auto_1712237 ) ) ( not ( = ?auto_1712231 ?auto_1712232 ) ) ( not ( = ?auto_1712231 ?auto_1712233 ) ) ( not ( = ?auto_1712231 ?auto_1712234 ) ) ( not ( = ?auto_1712231 ?auto_1712237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712232 ?auto_1712233 ?auto_1712234 )
      ( MAKE-8CRATE-VERIFY ?auto_1712226 ?auto_1712227 ?auto_1712228 ?auto_1712229 ?auto_1712230 ?auto_1712231 ?auto_1712232 ?auto_1712233 ?auto_1712234 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712319 - SURFACE
      ?auto_1712320 - SURFACE
      ?auto_1712321 - SURFACE
      ?auto_1712322 - SURFACE
      ?auto_1712323 - SURFACE
      ?auto_1712324 - SURFACE
      ?auto_1712325 - SURFACE
      ?auto_1712326 - SURFACE
      ?auto_1712327 - SURFACE
    )
    :vars
    (
      ?auto_1712331 - HOIST
      ?auto_1712328 - PLACE
      ?auto_1712333 - PLACE
      ?auto_1712332 - HOIST
      ?auto_1712330 - SURFACE
      ?auto_1712329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712331 ?auto_1712328 ) ( SURFACE-AT ?auto_1712326 ?auto_1712328 ) ( CLEAR ?auto_1712326 ) ( IS-CRATE ?auto_1712327 ) ( not ( = ?auto_1712326 ?auto_1712327 ) ) ( AVAILABLE ?auto_1712331 ) ( ON ?auto_1712326 ?auto_1712325 ) ( not ( = ?auto_1712325 ?auto_1712326 ) ) ( not ( = ?auto_1712325 ?auto_1712327 ) ) ( not ( = ?auto_1712333 ?auto_1712328 ) ) ( HOIST-AT ?auto_1712332 ?auto_1712333 ) ( not ( = ?auto_1712331 ?auto_1712332 ) ) ( AVAILABLE ?auto_1712332 ) ( SURFACE-AT ?auto_1712327 ?auto_1712333 ) ( ON ?auto_1712327 ?auto_1712330 ) ( CLEAR ?auto_1712327 ) ( not ( = ?auto_1712326 ?auto_1712330 ) ) ( not ( = ?auto_1712327 ?auto_1712330 ) ) ( not ( = ?auto_1712325 ?auto_1712330 ) ) ( TRUCK-AT ?auto_1712329 ?auto_1712328 ) ( ON ?auto_1712320 ?auto_1712319 ) ( ON ?auto_1712321 ?auto_1712320 ) ( ON ?auto_1712322 ?auto_1712321 ) ( ON ?auto_1712323 ?auto_1712322 ) ( ON ?auto_1712324 ?auto_1712323 ) ( ON ?auto_1712325 ?auto_1712324 ) ( not ( = ?auto_1712319 ?auto_1712320 ) ) ( not ( = ?auto_1712319 ?auto_1712321 ) ) ( not ( = ?auto_1712319 ?auto_1712322 ) ) ( not ( = ?auto_1712319 ?auto_1712323 ) ) ( not ( = ?auto_1712319 ?auto_1712324 ) ) ( not ( = ?auto_1712319 ?auto_1712325 ) ) ( not ( = ?auto_1712319 ?auto_1712326 ) ) ( not ( = ?auto_1712319 ?auto_1712327 ) ) ( not ( = ?auto_1712319 ?auto_1712330 ) ) ( not ( = ?auto_1712320 ?auto_1712321 ) ) ( not ( = ?auto_1712320 ?auto_1712322 ) ) ( not ( = ?auto_1712320 ?auto_1712323 ) ) ( not ( = ?auto_1712320 ?auto_1712324 ) ) ( not ( = ?auto_1712320 ?auto_1712325 ) ) ( not ( = ?auto_1712320 ?auto_1712326 ) ) ( not ( = ?auto_1712320 ?auto_1712327 ) ) ( not ( = ?auto_1712320 ?auto_1712330 ) ) ( not ( = ?auto_1712321 ?auto_1712322 ) ) ( not ( = ?auto_1712321 ?auto_1712323 ) ) ( not ( = ?auto_1712321 ?auto_1712324 ) ) ( not ( = ?auto_1712321 ?auto_1712325 ) ) ( not ( = ?auto_1712321 ?auto_1712326 ) ) ( not ( = ?auto_1712321 ?auto_1712327 ) ) ( not ( = ?auto_1712321 ?auto_1712330 ) ) ( not ( = ?auto_1712322 ?auto_1712323 ) ) ( not ( = ?auto_1712322 ?auto_1712324 ) ) ( not ( = ?auto_1712322 ?auto_1712325 ) ) ( not ( = ?auto_1712322 ?auto_1712326 ) ) ( not ( = ?auto_1712322 ?auto_1712327 ) ) ( not ( = ?auto_1712322 ?auto_1712330 ) ) ( not ( = ?auto_1712323 ?auto_1712324 ) ) ( not ( = ?auto_1712323 ?auto_1712325 ) ) ( not ( = ?auto_1712323 ?auto_1712326 ) ) ( not ( = ?auto_1712323 ?auto_1712327 ) ) ( not ( = ?auto_1712323 ?auto_1712330 ) ) ( not ( = ?auto_1712324 ?auto_1712325 ) ) ( not ( = ?auto_1712324 ?auto_1712326 ) ) ( not ( = ?auto_1712324 ?auto_1712327 ) ) ( not ( = ?auto_1712324 ?auto_1712330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712325 ?auto_1712326 ?auto_1712327 )
      ( MAKE-8CRATE-VERIFY ?auto_1712319 ?auto_1712320 ?auto_1712321 ?auto_1712322 ?auto_1712323 ?auto_1712324 ?auto_1712325 ?auto_1712326 ?auto_1712327 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712412 - SURFACE
      ?auto_1712413 - SURFACE
      ?auto_1712414 - SURFACE
      ?auto_1712415 - SURFACE
      ?auto_1712416 - SURFACE
      ?auto_1712417 - SURFACE
      ?auto_1712418 - SURFACE
      ?auto_1712419 - SURFACE
      ?auto_1712420 - SURFACE
    )
    :vars
    (
      ?auto_1712422 - HOIST
      ?auto_1712424 - PLACE
      ?auto_1712421 - PLACE
      ?auto_1712425 - HOIST
      ?auto_1712426 - SURFACE
      ?auto_1712423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712422 ?auto_1712424 ) ( IS-CRATE ?auto_1712420 ) ( not ( = ?auto_1712419 ?auto_1712420 ) ) ( not ( = ?auto_1712418 ?auto_1712419 ) ) ( not ( = ?auto_1712418 ?auto_1712420 ) ) ( not ( = ?auto_1712421 ?auto_1712424 ) ) ( HOIST-AT ?auto_1712425 ?auto_1712421 ) ( not ( = ?auto_1712422 ?auto_1712425 ) ) ( AVAILABLE ?auto_1712425 ) ( SURFACE-AT ?auto_1712420 ?auto_1712421 ) ( ON ?auto_1712420 ?auto_1712426 ) ( CLEAR ?auto_1712420 ) ( not ( = ?auto_1712419 ?auto_1712426 ) ) ( not ( = ?auto_1712420 ?auto_1712426 ) ) ( not ( = ?auto_1712418 ?auto_1712426 ) ) ( TRUCK-AT ?auto_1712423 ?auto_1712424 ) ( SURFACE-AT ?auto_1712418 ?auto_1712424 ) ( CLEAR ?auto_1712418 ) ( LIFTING ?auto_1712422 ?auto_1712419 ) ( IS-CRATE ?auto_1712419 ) ( ON ?auto_1712413 ?auto_1712412 ) ( ON ?auto_1712414 ?auto_1712413 ) ( ON ?auto_1712415 ?auto_1712414 ) ( ON ?auto_1712416 ?auto_1712415 ) ( ON ?auto_1712417 ?auto_1712416 ) ( ON ?auto_1712418 ?auto_1712417 ) ( not ( = ?auto_1712412 ?auto_1712413 ) ) ( not ( = ?auto_1712412 ?auto_1712414 ) ) ( not ( = ?auto_1712412 ?auto_1712415 ) ) ( not ( = ?auto_1712412 ?auto_1712416 ) ) ( not ( = ?auto_1712412 ?auto_1712417 ) ) ( not ( = ?auto_1712412 ?auto_1712418 ) ) ( not ( = ?auto_1712412 ?auto_1712419 ) ) ( not ( = ?auto_1712412 ?auto_1712420 ) ) ( not ( = ?auto_1712412 ?auto_1712426 ) ) ( not ( = ?auto_1712413 ?auto_1712414 ) ) ( not ( = ?auto_1712413 ?auto_1712415 ) ) ( not ( = ?auto_1712413 ?auto_1712416 ) ) ( not ( = ?auto_1712413 ?auto_1712417 ) ) ( not ( = ?auto_1712413 ?auto_1712418 ) ) ( not ( = ?auto_1712413 ?auto_1712419 ) ) ( not ( = ?auto_1712413 ?auto_1712420 ) ) ( not ( = ?auto_1712413 ?auto_1712426 ) ) ( not ( = ?auto_1712414 ?auto_1712415 ) ) ( not ( = ?auto_1712414 ?auto_1712416 ) ) ( not ( = ?auto_1712414 ?auto_1712417 ) ) ( not ( = ?auto_1712414 ?auto_1712418 ) ) ( not ( = ?auto_1712414 ?auto_1712419 ) ) ( not ( = ?auto_1712414 ?auto_1712420 ) ) ( not ( = ?auto_1712414 ?auto_1712426 ) ) ( not ( = ?auto_1712415 ?auto_1712416 ) ) ( not ( = ?auto_1712415 ?auto_1712417 ) ) ( not ( = ?auto_1712415 ?auto_1712418 ) ) ( not ( = ?auto_1712415 ?auto_1712419 ) ) ( not ( = ?auto_1712415 ?auto_1712420 ) ) ( not ( = ?auto_1712415 ?auto_1712426 ) ) ( not ( = ?auto_1712416 ?auto_1712417 ) ) ( not ( = ?auto_1712416 ?auto_1712418 ) ) ( not ( = ?auto_1712416 ?auto_1712419 ) ) ( not ( = ?auto_1712416 ?auto_1712420 ) ) ( not ( = ?auto_1712416 ?auto_1712426 ) ) ( not ( = ?auto_1712417 ?auto_1712418 ) ) ( not ( = ?auto_1712417 ?auto_1712419 ) ) ( not ( = ?auto_1712417 ?auto_1712420 ) ) ( not ( = ?auto_1712417 ?auto_1712426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712418 ?auto_1712419 ?auto_1712420 )
      ( MAKE-8CRATE-VERIFY ?auto_1712412 ?auto_1712413 ?auto_1712414 ?auto_1712415 ?auto_1712416 ?auto_1712417 ?auto_1712418 ?auto_1712419 ?auto_1712420 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1712505 - SURFACE
      ?auto_1712506 - SURFACE
      ?auto_1712507 - SURFACE
      ?auto_1712508 - SURFACE
      ?auto_1712509 - SURFACE
      ?auto_1712510 - SURFACE
      ?auto_1712511 - SURFACE
      ?auto_1712512 - SURFACE
      ?auto_1712513 - SURFACE
    )
    :vars
    (
      ?auto_1712519 - HOIST
      ?auto_1712514 - PLACE
      ?auto_1712518 - PLACE
      ?auto_1712515 - HOIST
      ?auto_1712516 - SURFACE
      ?auto_1712517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712519 ?auto_1712514 ) ( IS-CRATE ?auto_1712513 ) ( not ( = ?auto_1712512 ?auto_1712513 ) ) ( not ( = ?auto_1712511 ?auto_1712512 ) ) ( not ( = ?auto_1712511 ?auto_1712513 ) ) ( not ( = ?auto_1712518 ?auto_1712514 ) ) ( HOIST-AT ?auto_1712515 ?auto_1712518 ) ( not ( = ?auto_1712519 ?auto_1712515 ) ) ( AVAILABLE ?auto_1712515 ) ( SURFACE-AT ?auto_1712513 ?auto_1712518 ) ( ON ?auto_1712513 ?auto_1712516 ) ( CLEAR ?auto_1712513 ) ( not ( = ?auto_1712512 ?auto_1712516 ) ) ( not ( = ?auto_1712513 ?auto_1712516 ) ) ( not ( = ?auto_1712511 ?auto_1712516 ) ) ( TRUCK-AT ?auto_1712517 ?auto_1712514 ) ( SURFACE-AT ?auto_1712511 ?auto_1712514 ) ( CLEAR ?auto_1712511 ) ( IS-CRATE ?auto_1712512 ) ( AVAILABLE ?auto_1712519 ) ( IN ?auto_1712512 ?auto_1712517 ) ( ON ?auto_1712506 ?auto_1712505 ) ( ON ?auto_1712507 ?auto_1712506 ) ( ON ?auto_1712508 ?auto_1712507 ) ( ON ?auto_1712509 ?auto_1712508 ) ( ON ?auto_1712510 ?auto_1712509 ) ( ON ?auto_1712511 ?auto_1712510 ) ( not ( = ?auto_1712505 ?auto_1712506 ) ) ( not ( = ?auto_1712505 ?auto_1712507 ) ) ( not ( = ?auto_1712505 ?auto_1712508 ) ) ( not ( = ?auto_1712505 ?auto_1712509 ) ) ( not ( = ?auto_1712505 ?auto_1712510 ) ) ( not ( = ?auto_1712505 ?auto_1712511 ) ) ( not ( = ?auto_1712505 ?auto_1712512 ) ) ( not ( = ?auto_1712505 ?auto_1712513 ) ) ( not ( = ?auto_1712505 ?auto_1712516 ) ) ( not ( = ?auto_1712506 ?auto_1712507 ) ) ( not ( = ?auto_1712506 ?auto_1712508 ) ) ( not ( = ?auto_1712506 ?auto_1712509 ) ) ( not ( = ?auto_1712506 ?auto_1712510 ) ) ( not ( = ?auto_1712506 ?auto_1712511 ) ) ( not ( = ?auto_1712506 ?auto_1712512 ) ) ( not ( = ?auto_1712506 ?auto_1712513 ) ) ( not ( = ?auto_1712506 ?auto_1712516 ) ) ( not ( = ?auto_1712507 ?auto_1712508 ) ) ( not ( = ?auto_1712507 ?auto_1712509 ) ) ( not ( = ?auto_1712507 ?auto_1712510 ) ) ( not ( = ?auto_1712507 ?auto_1712511 ) ) ( not ( = ?auto_1712507 ?auto_1712512 ) ) ( not ( = ?auto_1712507 ?auto_1712513 ) ) ( not ( = ?auto_1712507 ?auto_1712516 ) ) ( not ( = ?auto_1712508 ?auto_1712509 ) ) ( not ( = ?auto_1712508 ?auto_1712510 ) ) ( not ( = ?auto_1712508 ?auto_1712511 ) ) ( not ( = ?auto_1712508 ?auto_1712512 ) ) ( not ( = ?auto_1712508 ?auto_1712513 ) ) ( not ( = ?auto_1712508 ?auto_1712516 ) ) ( not ( = ?auto_1712509 ?auto_1712510 ) ) ( not ( = ?auto_1712509 ?auto_1712511 ) ) ( not ( = ?auto_1712509 ?auto_1712512 ) ) ( not ( = ?auto_1712509 ?auto_1712513 ) ) ( not ( = ?auto_1712509 ?auto_1712516 ) ) ( not ( = ?auto_1712510 ?auto_1712511 ) ) ( not ( = ?auto_1712510 ?auto_1712512 ) ) ( not ( = ?auto_1712510 ?auto_1712513 ) ) ( not ( = ?auto_1712510 ?auto_1712516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1712511 ?auto_1712512 ?auto_1712513 )
      ( MAKE-8CRATE-VERIFY ?auto_1712505 ?auto_1712506 ?auto_1712507 ?auto_1712508 ?auto_1712509 ?auto_1712510 ?auto_1712511 ?auto_1712512 ?auto_1712513 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716592 - SURFACE
      ?auto_1716593 - SURFACE
      ?auto_1716594 - SURFACE
      ?auto_1716595 - SURFACE
      ?auto_1716596 - SURFACE
      ?auto_1716597 - SURFACE
      ?auto_1716598 - SURFACE
      ?auto_1716599 - SURFACE
      ?auto_1716600 - SURFACE
      ?auto_1716601 - SURFACE
    )
    :vars
    (
      ?auto_1716602 - HOIST
      ?auto_1716603 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716602 ?auto_1716603 ) ( SURFACE-AT ?auto_1716600 ?auto_1716603 ) ( CLEAR ?auto_1716600 ) ( LIFTING ?auto_1716602 ?auto_1716601 ) ( IS-CRATE ?auto_1716601 ) ( not ( = ?auto_1716600 ?auto_1716601 ) ) ( ON ?auto_1716593 ?auto_1716592 ) ( ON ?auto_1716594 ?auto_1716593 ) ( ON ?auto_1716595 ?auto_1716594 ) ( ON ?auto_1716596 ?auto_1716595 ) ( ON ?auto_1716597 ?auto_1716596 ) ( ON ?auto_1716598 ?auto_1716597 ) ( ON ?auto_1716599 ?auto_1716598 ) ( ON ?auto_1716600 ?auto_1716599 ) ( not ( = ?auto_1716592 ?auto_1716593 ) ) ( not ( = ?auto_1716592 ?auto_1716594 ) ) ( not ( = ?auto_1716592 ?auto_1716595 ) ) ( not ( = ?auto_1716592 ?auto_1716596 ) ) ( not ( = ?auto_1716592 ?auto_1716597 ) ) ( not ( = ?auto_1716592 ?auto_1716598 ) ) ( not ( = ?auto_1716592 ?auto_1716599 ) ) ( not ( = ?auto_1716592 ?auto_1716600 ) ) ( not ( = ?auto_1716592 ?auto_1716601 ) ) ( not ( = ?auto_1716593 ?auto_1716594 ) ) ( not ( = ?auto_1716593 ?auto_1716595 ) ) ( not ( = ?auto_1716593 ?auto_1716596 ) ) ( not ( = ?auto_1716593 ?auto_1716597 ) ) ( not ( = ?auto_1716593 ?auto_1716598 ) ) ( not ( = ?auto_1716593 ?auto_1716599 ) ) ( not ( = ?auto_1716593 ?auto_1716600 ) ) ( not ( = ?auto_1716593 ?auto_1716601 ) ) ( not ( = ?auto_1716594 ?auto_1716595 ) ) ( not ( = ?auto_1716594 ?auto_1716596 ) ) ( not ( = ?auto_1716594 ?auto_1716597 ) ) ( not ( = ?auto_1716594 ?auto_1716598 ) ) ( not ( = ?auto_1716594 ?auto_1716599 ) ) ( not ( = ?auto_1716594 ?auto_1716600 ) ) ( not ( = ?auto_1716594 ?auto_1716601 ) ) ( not ( = ?auto_1716595 ?auto_1716596 ) ) ( not ( = ?auto_1716595 ?auto_1716597 ) ) ( not ( = ?auto_1716595 ?auto_1716598 ) ) ( not ( = ?auto_1716595 ?auto_1716599 ) ) ( not ( = ?auto_1716595 ?auto_1716600 ) ) ( not ( = ?auto_1716595 ?auto_1716601 ) ) ( not ( = ?auto_1716596 ?auto_1716597 ) ) ( not ( = ?auto_1716596 ?auto_1716598 ) ) ( not ( = ?auto_1716596 ?auto_1716599 ) ) ( not ( = ?auto_1716596 ?auto_1716600 ) ) ( not ( = ?auto_1716596 ?auto_1716601 ) ) ( not ( = ?auto_1716597 ?auto_1716598 ) ) ( not ( = ?auto_1716597 ?auto_1716599 ) ) ( not ( = ?auto_1716597 ?auto_1716600 ) ) ( not ( = ?auto_1716597 ?auto_1716601 ) ) ( not ( = ?auto_1716598 ?auto_1716599 ) ) ( not ( = ?auto_1716598 ?auto_1716600 ) ) ( not ( = ?auto_1716598 ?auto_1716601 ) ) ( not ( = ?auto_1716599 ?auto_1716600 ) ) ( not ( = ?auto_1716599 ?auto_1716601 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1716600 ?auto_1716601 )
      ( MAKE-9CRATE-VERIFY ?auto_1716592 ?auto_1716593 ?auto_1716594 ?auto_1716595 ?auto_1716596 ?auto_1716597 ?auto_1716598 ?auto_1716599 ?auto_1716600 ?auto_1716601 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716672 - SURFACE
      ?auto_1716673 - SURFACE
      ?auto_1716674 - SURFACE
      ?auto_1716675 - SURFACE
      ?auto_1716676 - SURFACE
      ?auto_1716677 - SURFACE
      ?auto_1716678 - SURFACE
      ?auto_1716679 - SURFACE
      ?auto_1716680 - SURFACE
      ?auto_1716681 - SURFACE
    )
    :vars
    (
      ?auto_1716682 - HOIST
      ?auto_1716684 - PLACE
      ?auto_1716683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716682 ?auto_1716684 ) ( SURFACE-AT ?auto_1716680 ?auto_1716684 ) ( CLEAR ?auto_1716680 ) ( IS-CRATE ?auto_1716681 ) ( not ( = ?auto_1716680 ?auto_1716681 ) ) ( TRUCK-AT ?auto_1716683 ?auto_1716684 ) ( AVAILABLE ?auto_1716682 ) ( IN ?auto_1716681 ?auto_1716683 ) ( ON ?auto_1716680 ?auto_1716679 ) ( not ( = ?auto_1716679 ?auto_1716680 ) ) ( not ( = ?auto_1716679 ?auto_1716681 ) ) ( ON ?auto_1716673 ?auto_1716672 ) ( ON ?auto_1716674 ?auto_1716673 ) ( ON ?auto_1716675 ?auto_1716674 ) ( ON ?auto_1716676 ?auto_1716675 ) ( ON ?auto_1716677 ?auto_1716676 ) ( ON ?auto_1716678 ?auto_1716677 ) ( ON ?auto_1716679 ?auto_1716678 ) ( not ( = ?auto_1716672 ?auto_1716673 ) ) ( not ( = ?auto_1716672 ?auto_1716674 ) ) ( not ( = ?auto_1716672 ?auto_1716675 ) ) ( not ( = ?auto_1716672 ?auto_1716676 ) ) ( not ( = ?auto_1716672 ?auto_1716677 ) ) ( not ( = ?auto_1716672 ?auto_1716678 ) ) ( not ( = ?auto_1716672 ?auto_1716679 ) ) ( not ( = ?auto_1716672 ?auto_1716680 ) ) ( not ( = ?auto_1716672 ?auto_1716681 ) ) ( not ( = ?auto_1716673 ?auto_1716674 ) ) ( not ( = ?auto_1716673 ?auto_1716675 ) ) ( not ( = ?auto_1716673 ?auto_1716676 ) ) ( not ( = ?auto_1716673 ?auto_1716677 ) ) ( not ( = ?auto_1716673 ?auto_1716678 ) ) ( not ( = ?auto_1716673 ?auto_1716679 ) ) ( not ( = ?auto_1716673 ?auto_1716680 ) ) ( not ( = ?auto_1716673 ?auto_1716681 ) ) ( not ( = ?auto_1716674 ?auto_1716675 ) ) ( not ( = ?auto_1716674 ?auto_1716676 ) ) ( not ( = ?auto_1716674 ?auto_1716677 ) ) ( not ( = ?auto_1716674 ?auto_1716678 ) ) ( not ( = ?auto_1716674 ?auto_1716679 ) ) ( not ( = ?auto_1716674 ?auto_1716680 ) ) ( not ( = ?auto_1716674 ?auto_1716681 ) ) ( not ( = ?auto_1716675 ?auto_1716676 ) ) ( not ( = ?auto_1716675 ?auto_1716677 ) ) ( not ( = ?auto_1716675 ?auto_1716678 ) ) ( not ( = ?auto_1716675 ?auto_1716679 ) ) ( not ( = ?auto_1716675 ?auto_1716680 ) ) ( not ( = ?auto_1716675 ?auto_1716681 ) ) ( not ( = ?auto_1716676 ?auto_1716677 ) ) ( not ( = ?auto_1716676 ?auto_1716678 ) ) ( not ( = ?auto_1716676 ?auto_1716679 ) ) ( not ( = ?auto_1716676 ?auto_1716680 ) ) ( not ( = ?auto_1716676 ?auto_1716681 ) ) ( not ( = ?auto_1716677 ?auto_1716678 ) ) ( not ( = ?auto_1716677 ?auto_1716679 ) ) ( not ( = ?auto_1716677 ?auto_1716680 ) ) ( not ( = ?auto_1716677 ?auto_1716681 ) ) ( not ( = ?auto_1716678 ?auto_1716679 ) ) ( not ( = ?auto_1716678 ?auto_1716680 ) ) ( not ( = ?auto_1716678 ?auto_1716681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716679 ?auto_1716680 ?auto_1716681 )
      ( MAKE-9CRATE-VERIFY ?auto_1716672 ?auto_1716673 ?auto_1716674 ?auto_1716675 ?auto_1716676 ?auto_1716677 ?auto_1716678 ?auto_1716679 ?auto_1716680 ?auto_1716681 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716762 - SURFACE
      ?auto_1716763 - SURFACE
      ?auto_1716764 - SURFACE
      ?auto_1716765 - SURFACE
      ?auto_1716766 - SURFACE
      ?auto_1716767 - SURFACE
      ?auto_1716768 - SURFACE
      ?auto_1716769 - SURFACE
      ?auto_1716770 - SURFACE
      ?auto_1716771 - SURFACE
    )
    :vars
    (
      ?auto_1716773 - HOIST
      ?auto_1716772 - PLACE
      ?auto_1716774 - TRUCK
      ?auto_1716775 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716773 ?auto_1716772 ) ( SURFACE-AT ?auto_1716770 ?auto_1716772 ) ( CLEAR ?auto_1716770 ) ( IS-CRATE ?auto_1716771 ) ( not ( = ?auto_1716770 ?auto_1716771 ) ) ( AVAILABLE ?auto_1716773 ) ( IN ?auto_1716771 ?auto_1716774 ) ( ON ?auto_1716770 ?auto_1716769 ) ( not ( = ?auto_1716769 ?auto_1716770 ) ) ( not ( = ?auto_1716769 ?auto_1716771 ) ) ( TRUCK-AT ?auto_1716774 ?auto_1716775 ) ( not ( = ?auto_1716775 ?auto_1716772 ) ) ( ON ?auto_1716763 ?auto_1716762 ) ( ON ?auto_1716764 ?auto_1716763 ) ( ON ?auto_1716765 ?auto_1716764 ) ( ON ?auto_1716766 ?auto_1716765 ) ( ON ?auto_1716767 ?auto_1716766 ) ( ON ?auto_1716768 ?auto_1716767 ) ( ON ?auto_1716769 ?auto_1716768 ) ( not ( = ?auto_1716762 ?auto_1716763 ) ) ( not ( = ?auto_1716762 ?auto_1716764 ) ) ( not ( = ?auto_1716762 ?auto_1716765 ) ) ( not ( = ?auto_1716762 ?auto_1716766 ) ) ( not ( = ?auto_1716762 ?auto_1716767 ) ) ( not ( = ?auto_1716762 ?auto_1716768 ) ) ( not ( = ?auto_1716762 ?auto_1716769 ) ) ( not ( = ?auto_1716762 ?auto_1716770 ) ) ( not ( = ?auto_1716762 ?auto_1716771 ) ) ( not ( = ?auto_1716763 ?auto_1716764 ) ) ( not ( = ?auto_1716763 ?auto_1716765 ) ) ( not ( = ?auto_1716763 ?auto_1716766 ) ) ( not ( = ?auto_1716763 ?auto_1716767 ) ) ( not ( = ?auto_1716763 ?auto_1716768 ) ) ( not ( = ?auto_1716763 ?auto_1716769 ) ) ( not ( = ?auto_1716763 ?auto_1716770 ) ) ( not ( = ?auto_1716763 ?auto_1716771 ) ) ( not ( = ?auto_1716764 ?auto_1716765 ) ) ( not ( = ?auto_1716764 ?auto_1716766 ) ) ( not ( = ?auto_1716764 ?auto_1716767 ) ) ( not ( = ?auto_1716764 ?auto_1716768 ) ) ( not ( = ?auto_1716764 ?auto_1716769 ) ) ( not ( = ?auto_1716764 ?auto_1716770 ) ) ( not ( = ?auto_1716764 ?auto_1716771 ) ) ( not ( = ?auto_1716765 ?auto_1716766 ) ) ( not ( = ?auto_1716765 ?auto_1716767 ) ) ( not ( = ?auto_1716765 ?auto_1716768 ) ) ( not ( = ?auto_1716765 ?auto_1716769 ) ) ( not ( = ?auto_1716765 ?auto_1716770 ) ) ( not ( = ?auto_1716765 ?auto_1716771 ) ) ( not ( = ?auto_1716766 ?auto_1716767 ) ) ( not ( = ?auto_1716766 ?auto_1716768 ) ) ( not ( = ?auto_1716766 ?auto_1716769 ) ) ( not ( = ?auto_1716766 ?auto_1716770 ) ) ( not ( = ?auto_1716766 ?auto_1716771 ) ) ( not ( = ?auto_1716767 ?auto_1716768 ) ) ( not ( = ?auto_1716767 ?auto_1716769 ) ) ( not ( = ?auto_1716767 ?auto_1716770 ) ) ( not ( = ?auto_1716767 ?auto_1716771 ) ) ( not ( = ?auto_1716768 ?auto_1716769 ) ) ( not ( = ?auto_1716768 ?auto_1716770 ) ) ( not ( = ?auto_1716768 ?auto_1716771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716769 ?auto_1716770 ?auto_1716771 )
      ( MAKE-9CRATE-VERIFY ?auto_1716762 ?auto_1716763 ?auto_1716764 ?auto_1716765 ?auto_1716766 ?auto_1716767 ?auto_1716768 ?auto_1716769 ?auto_1716770 ?auto_1716771 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716861 - SURFACE
      ?auto_1716862 - SURFACE
      ?auto_1716863 - SURFACE
      ?auto_1716864 - SURFACE
      ?auto_1716865 - SURFACE
      ?auto_1716866 - SURFACE
      ?auto_1716867 - SURFACE
      ?auto_1716868 - SURFACE
      ?auto_1716869 - SURFACE
      ?auto_1716870 - SURFACE
    )
    :vars
    (
      ?auto_1716871 - HOIST
      ?auto_1716872 - PLACE
      ?auto_1716875 - TRUCK
      ?auto_1716874 - PLACE
      ?auto_1716873 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716871 ?auto_1716872 ) ( SURFACE-AT ?auto_1716869 ?auto_1716872 ) ( CLEAR ?auto_1716869 ) ( IS-CRATE ?auto_1716870 ) ( not ( = ?auto_1716869 ?auto_1716870 ) ) ( AVAILABLE ?auto_1716871 ) ( ON ?auto_1716869 ?auto_1716868 ) ( not ( = ?auto_1716868 ?auto_1716869 ) ) ( not ( = ?auto_1716868 ?auto_1716870 ) ) ( TRUCK-AT ?auto_1716875 ?auto_1716874 ) ( not ( = ?auto_1716874 ?auto_1716872 ) ) ( HOIST-AT ?auto_1716873 ?auto_1716874 ) ( LIFTING ?auto_1716873 ?auto_1716870 ) ( not ( = ?auto_1716871 ?auto_1716873 ) ) ( ON ?auto_1716862 ?auto_1716861 ) ( ON ?auto_1716863 ?auto_1716862 ) ( ON ?auto_1716864 ?auto_1716863 ) ( ON ?auto_1716865 ?auto_1716864 ) ( ON ?auto_1716866 ?auto_1716865 ) ( ON ?auto_1716867 ?auto_1716866 ) ( ON ?auto_1716868 ?auto_1716867 ) ( not ( = ?auto_1716861 ?auto_1716862 ) ) ( not ( = ?auto_1716861 ?auto_1716863 ) ) ( not ( = ?auto_1716861 ?auto_1716864 ) ) ( not ( = ?auto_1716861 ?auto_1716865 ) ) ( not ( = ?auto_1716861 ?auto_1716866 ) ) ( not ( = ?auto_1716861 ?auto_1716867 ) ) ( not ( = ?auto_1716861 ?auto_1716868 ) ) ( not ( = ?auto_1716861 ?auto_1716869 ) ) ( not ( = ?auto_1716861 ?auto_1716870 ) ) ( not ( = ?auto_1716862 ?auto_1716863 ) ) ( not ( = ?auto_1716862 ?auto_1716864 ) ) ( not ( = ?auto_1716862 ?auto_1716865 ) ) ( not ( = ?auto_1716862 ?auto_1716866 ) ) ( not ( = ?auto_1716862 ?auto_1716867 ) ) ( not ( = ?auto_1716862 ?auto_1716868 ) ) ( not ( = ?auto_1716862 ?auto_1716869 ) ) ( not ( = ?auto_1716862 ?auto_1716870 ) ) ( not ( = ?auto_1716863 ?auto_1716864 ) ) ( not ( = ?auto_1716863 ?auto_1716865 ) ) ( not ( = ?auto_1716863 ?auto_1716866 ) ) ( not ( = ?auto_1716863 ?auto_1716867 ) ) ( not ( = ?auto_1716863 ?auto_1716868 ) ) ( not ( = ?auto_1716863 ?auto_1716869 ) ) ( not ( = ?auto_1716863 ?auto_1716870 ) ) ( not ( = ?auto_1716864 ?auto_1716865 ) ) ( not ( = ?auto_1716864 ?auto_1716866 ) ) ( not ( = ?auto_1716864 ?auto_1716867 ) ) ( not ( = ?auto_1716864 ?auto_1716868 ) ) ( not ( = ?auto_1716864 ?auto_1716869 ) ) ( not ( = ?auto_1716864 ?auto_1716870 ) ) ( not ( = ?auto_1716865 ?auto_1716866 ) ) ( not ( = ?auto_1716865 ?auto_1716867 ) ) ( not ( = ?auto_1716865 ?auto_1716868 ) ) ( not ( = ?auto_1716865 ?auto_1716869 ) ) ( not ( = ?auto_1716865 ?auto_1716870 ) ) ( not ( = ?auto_1716866 ?auto_1716867 ) ) ( not ( = ?auto_1716866 ?auto_1716868 ) ) ( not ( = ?auto_1716866 ?auto_1716869 ) ) ( not ( = ?auto_1716866 ?auto_1716870 ) ) ( not ( = ?auto_1716867 ?auto_1716868 ) ) ( not ( = ?auto_1716867 ?auto_1716869 ) ) ( not ( = ?auto_1716867 ?auto_1716870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716868 ?auto_1716869 ?auto_1716870 )
      ( MAKE-9CRATE-VERIFY ?auto_1716861 ?auto_1716862 ?auto_1716863 ?auto_1716864 ?auto_1716865 ?auto_1716866 ?auto_1716867 ?auto_1716868 ?auto_1716869 ?auto_1716870 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1716969 - SURFACE
      ?auto_1716970 - SURFACE
      ?auto_1716971 - SURFACE
      ?auto_1716972 - SURFACE
      ?auto_1716973 - SURFACE
      ?auto_1716974 - SURFACE
      ?auto_1716975 - SURFACE
      ?auto_1716976 - SURFACE
      ?auto_1716977 - SURFACE
      ?auto_1716978 - SURFACE
    )
    :vars
    (
      ?auto_1716979 - HOIST
      ?auto_1716982 - PLACE
      ?auto_1716984 - TRUCK
      ?auto_1716981 - PLACE
      ?auto_1716980 - HOIST
      ?auto_1716983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1716979 ?auto_1716982 ) ( SURFACE-AT ?auto_1716977 ?auto_1716982 ) ( CLEAR ?auto_1716977 ) ( IS-CRATE ?auto_1716978 ) ( not ( = ?auto_1716977 ?auto_1716978 ) ) ( AVAILABLE ?auto_1716979 ) ( ON ?auto_1716977 ?auto_1716976 ) ( not ( = ?auto_1716976 ?auto_1716977 ) ) ( not ( = ?auto_1716976 ?auto_1716978 ) ) ( TRUCK-AT ?auto_1716984 ?auto_1716981 ) ( not ( = ?auto_1716981 ?auto_1716982 ) ) ( HOIST-AT ?auto_1716980 ?auto_1716981 ) ( not ( = ?auto_1716979 ?auto_1716980 ) ) ( AVAILABLE ?auto_1716980 ) ( SURFACE-AT ?auto_1716978 ?auto_1716981 ) ( ON ?auto_1716978 ?auto_1716983 ) ( CLEAR ?auto_1716978 ) ( not ( = ?auto_1716977 ?auto_1716983 ) ) ( not ( = ?auto_1716978 ?auto_1716983 ) ) ( not ( = ?auto_1716976 ?auto_1716983 ) ) ( ON ?auto_1716970 ?auto_1716969 ) ( ON ?auto_1716971 ?auto_1716970 ) ( ON ?auto_1716972 ?auto_1716971 ) ( ON ?auto_1716973 ?auto_1716972 ) ( ON ?auto_1716974 ?auto_1716973 ) ( ON ?auto_1716975 ?auto_1716974 ) ( ON ?auto_1716976 ?auto_1716975 ) ( not ( = ?auto_1716969 ?auto_1716970 ) ) ( not ( = ?auto_1716969 ?auto_1716971 ) ) ( not ( = ?auto_1716969 ?auto_1716972 ) ) ( not ( = ?auto_1716969 ?auto_1716973 ) ) ( not ( = ?auto_1716969 ?auto_1716974 ) ) ( not ( = ?auto_1716969 ?auto_1716975 ) ) ( not ( = ?auto_1716969 ?auto_1716976 ) ) ( not ( = ?auto_1716969 ?auto_1716977 ) ) ( not ( = ?auto_1716969 ?auto_1716978 ) ) ( not ( = ?auto_1716969 ?auto_1716983 ) ) ( not ( = ?auto_1716970 ?auto_1716971 ) ) ( not ( = ?auto_1716970 ?auto_1716972 ) ) ( not ( = ?auto_1716970 ?auto_1716973 ) ) ( not ( = ?auto_1716970 ?auto_1716974 ) ) ( not ( = ?auto_1716970 ?auto_1716975 ) ) ( not ( = ?auto_1716970 ?auto_1716976 ) ) ( not ( = ?auto_1716970 ?auto_1716977 ) ) ( not ( = ?auto_1716970 ?auto_1716978 ) ) ( not ( = ?auto_1716970 ?auto_1716983 ) ) ( not ( = ?auto_1716971 ?auto_1716972 ) ) ( not ( = ?auto_1716971 ?auto_1716973 ) ) ( not ( = ?auto_1716971 ?auto_1716974 ) ) ( not ( = ?auto_1716971 ?auto_1716975 ) ) ( not ( = ?auto_1716971 ?auto_1716976 ) ) ( not ( = ?auto_1716971 ?auto_1716977 ) ) ( not ( = ?auto_1716971 ?auto_1716978 ) ) ( not ( = ?auto_1716971 ?auto_1716983 ) ) ( not ( = ?auto_1716972 ?auto_1716973 ) ) ( not ( = ?auto_1716972 ?auto_1716974 ) ) ( not ( = ?auto_1716972 ?auto_1716975 ) ) ( not ( = ?auto_1716972 ?auto_1716976 ) ) ( not ( = ?auto_1716972 ?auto_1716977 ) ) ( not ( = ?auto_1716972 ?auto_1716978 ) ) ( not ( = ?auto_1716972 ?auto_1716983 ) ) ( not ( = ?auto_1716973 ?auto_1716974 ) ) ( not ( = ?auto_1716973 ?auto_1716975 ) ) ( not ( = ?auto_1716973 ?auto_1716976 ) ) ( not ( = ?auto_1716973 ?auto_1716977 ) ) ( not ( = ?auto_1716973 ?auto_1716978 ) ) ( not ( = ?auto_1716973 ?auto_1716983 ) ) ( not ( = ?auto_1716974 ?auto_1716975 ) ) ( not ( = ?auto_1716974 ?auto_1716976 ) ) ( not ( = ?auto_1716974 ?auto_1716977 ) ) ( not ( = ?auto_1716974 ?auto_1716978 ) ) ( not ( = ?auto_1716974 ?auto_1716983 ) ) ( not ( = ?auto_1716975 ?auto_1716976 ) ) ( not ( = ?auto_1716975 ?auto_1716977 ) ) ( not ( = ?auto_1716975 ?auto_1716978 ) ) ( not ( = ?auto_1716975 ?auto_1716983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1716976 ?auto_1716977 ?auto_1716978 )
      ( MAKE-9CRATE-VERIFY ?auto_1716969 ?auto_1716970 ?auto_1716971 ?auto_1716972 ?auto_1716973 ?auto_1716974 ?auto_1716975 ?auto_1716976 ?auto_1716977 ?auto_1716978 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1717078 - SURFACE
      ?auto_1717079 - SURFACE
      ?auto_1717080 - SURFACE
      ?auto_1717081 - SURFACE
      ?auto_1717082 - SURFACE
      ?auto_1717083 - SURFACE
      ?auto_1717084 - SURFACE
      ?auto_1717085 - SURFACE
      ?auto_1717086 - SURFACE
      ?auto_1717087 - SURFACE
    )
    :vars
    (
      ?auto_1717088 - HOIST
      ?auto_1717090 - PLACE
      ?auto_1717091 - PLACE
      ?auto_1717093 - HOIST
      ?auto_1717089 - SURFACE
      ?auto_1717092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1717088 ?auto_1717090 ) ( SURFACE-AT ?auto_1717086 ?auto_1717090 ) ( CLEAR ?auto_1717086 ) ( IS-CRATE ?auto_1717087 ) ( not ( = ?auto_1717086 ?auto_1717087 ) ) ( AVAILABLE ?auto_1717088 ) ( ON ?auto_1717086 ?auto_1717085 ) ( not ( = ?auto_1717085 ?auto_1717086 ) ) ( not ( = ?auto_1717085 ?auto_1717087 ) ) ( not ( = ?auto_1717091 ?auto_1717090 ) ) ( HOIST-AT ?auto_1717093 ?auto_1717091 ) ( not ( = ?auto_1717088 ?auto_1717093 ) ) ( AVAILABLE ?auto_1717093 ) ( SURFACE-AT ?auto_1717087 ?auto_1717091 ) ( ON ?auto_1717087 ?auto_1717089 ) ( CLEAR ?auto_1717087 ) ( not ( = ?auto_1717086 ?auto_1717089 ) ) ( not ( = ?auto_1717087 ?auto_1717089 ) ) ( not ( = ?auto_1717085 ?auto_1717089 ) ) ( TRUCK-AT ?auto_1717092 ?auto_1717090 ) ( ON ?auto_1717079 ?auto_1717078 ) ( ON ?auto_1717080 ?auto_1717079 ) ( ON ?auto_1717081 ?auto_1717080 ) ( ON ?auto_1717082 ?auto_1717081 ) ( ON ?auto_1717083 ?auto_1717082 ) ( ON ?auto_1717084 ?auto_1717083 ) ( ON ?auto_1717085 ?auto_1717084 ) ( not ( = ?auto_1717078 ?auto_1717079 ) ) ( not ( = ?auto_1717078 ?auto_1717080 ) ) ( not ( = ?auto_1717078 ?auto_1717081 ) ) ( not ( = ?auto_1717078 ?auto_1717082 ) ) ( not ( = ?auto_1717078 ?auto_1717083 ) ) ( not ( = ?auto_1717078 ?auto_1717084 ) ) ( not ( = ?auto_1717078 ?auto_1717085 ) ) ( not ( = ?auto_1717078 ?auto_1717086 ) ) ( not ( = ?auto_1717078 ?auto_1717087 ) ) ( not ( = ?auto_1717078 ?auto_1717089 ) ) ( not ( = ?auto_1717079 ?auto_1717080 ) ) ( not ( = ?auto_1717079 ?auto_1717081 ) ) ( not ( = ?auto_1717079 ?auto_1717082 ) ) ( not ( = ?auto_1717079 ?auto_1717083 ) ) ( not ( = ?auto_1717079 ?auto_1717084 ) ) ( not ( = ?auto_1717079 ?auto_1717085 ) ) ( not ( = ?auto_1717079 ?auto_1717086 ) ) ( not ( = ?auto_1717079 ?auto_1717087 ) ) ( not ( = ?auto_1717079 ?auto_1717089 ) ) ( not ( = ?auto_1717080 ?auto_1717081 ) ) ( not ( = ?auto_1717080 ?auto_1717082 ) ) ( not ( = ?auto_1717080 ?auto_1717083 ) ) ( not ( = ?auto_1717080 ?auto_1717084 ) ) ( not ( = ?auto_1717080 ?auto_1717085 ) ) ( not ( = ?auto_1717080 ?auto_1717086 ) ) ( not ( = ?auto_1717080 ?auto_1717087 ) ) ( not ( = ?auto_1717080 ?auto_1717089 ) ) ( not ( = ?auto_1717081 ?auto_1717082 ) ) ( not ( = ?auto_1717081 ?auto_1717083 ) ) ( not ( = ?auto_1717081 ?auto_1717084 ) ) ( not ( = ?auto_1717081 ?auto_1717085 ) ) ( not ( = ?auto_1717081 ?auto_1717086 ) ) ( not ( = ?auto_1717081 ?auto_1717087 ) ) ( not ( = ?auto_1717081 ?auto_1717089 ) ) ( not ( = ?auto_1717082 ?auto_1717083 ) ) ( not ( = ?auto_1717082 ?auto_1717084 ) ) ( not ( = ?auto_1717082 ?auto_1717085 ) ) ( not ( = ?auto_1717082 ?auto_1717086 ) ) ( not ( = ?auto_1717082 ?auto_1717087 ) ) ( not ( = ?auto_1717082 ?auto_1717089 ) ) ( not ( = ?auto_1717083 ?auto_1717084 ) ) ( not ( = ?auto_1717083 ?auto_1717085 ) ) ( not ( = ?auto_1717083 ?auto_1717086 ) ) ( not ( = ?auto_1717083 ?auto_1717087 ) ) ( not ( = ?auto_1717083 ?auto_1717089 ) ) ( not ( = ?auto_1717084 ?auto_1717085 ) ) ( not ( = ?auto_1717084 ?auto_1717086 ) ) ( not ( = ?auto_1717084 ?auto_1717087 ) ) ( not ( = ?auto_1717084 ?auto_1717089 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1717085 ?auto_1717086 ?auto_1717087 )
      ( MAKE-9CRATE-VERIFY ?auto_1717078 ?auto_1717079 ?auto_1717080 ?auto_1717081 ?auto_1717082 ?auto_1717083 ?auto_1717084 ?auto_1717085 ?auto_1717086 ?auto_1717087 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1717187 - SURFACE
      ?auto_1717188 - SURFACE
      ?auto_1717189 - SURFACE
      ?auto_1717190 - SURFACE
      ?auto_1717191 - SURFACE
      ?auto_1717192 - SURFACE
      ?auto_1717193 - SURFACE
      ?auto_1717194 - SURFACE
      ?auto_1717195 - SURFACE
      ?auto_1717196 - SURFACE
    )
    :vars
    (
      ?auto_1717201 - HOIST
      ?auto_1717200 - PLACE
      ?auto_1717198 - PLACE
      ?auto_1717202 - HOIST
      ?auto_1717199 - SURFACE
      ?auto_1717197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1717201 ?auto_1717200 ) ( IS-CRATE ?auto_1717196 ) ( not ( = ?auto_1717195 ?auto_1717196 ) ) ( not ( = ?auto_1717194 ?auto_1717195 ) ) ( not ( = ?auto_1717194 ?auto_1717196 ) ) ( not ( = ?auto_1717198 ?auto_1717200 ) ) ( HOIST-AT ?auto_1717202 ?auto_1717198 ) ( not ( = ?auto_1717201 ?auto_1717202 ) ) ( AVAILABLE ?auto_1717202 ) ( SURFACE-AT ?auto_1717196 ?auto_1717198 ) ( ON ?auto_1717196 ?auto_1717199 ) ( CLEAR ?auto_1717196 ) ( not ( = ?auto_1717195 ?auto_1717199 ) ) ( not ( = ?auto_1717196 ?auto_1717199 ) ) ( not ( = ?auto_1717194 ?auto_1717199 ) ) ( TRUCK-AT ?auto_1717197 ?auto_1717200 ) ( SURFACE-AT ?auto_1717194 ?auto_1717200 ) ( CLEAR ?auto_1717194 ) ( LIFTING ?auto_1717201 ?auto_1717195 ) ( IS-CRATE ?auto_1717195 ) ( ON ?auto_1717188 ?auto_1717187 ) ( ON ?auto_1717189 ?auto_1717188 ) ( ON ?auto_1717190 ?auto_1717189 ) ( ON ?auto_1717191 ?auto_1717190 ) ( ON ?auto_1717192 ?auto_1717191 ) ( ON ?auto_1717193 ?auto_1717192 ) ( ON ?auto_1717194 ?auto_1717193 ) ( not ( = ?auto_1717187 ?auto_1717188 ) ) ( not ( = ?auto_1717187 ?auto_1717189 ) ) ( not ( = ?auto_1717187 ?auto_1717190 ) ) ( not ( = ?auto_1717187 ?auto_1717191 ) ) ( not ( = ?auto_1717187 ?auto_1717192 ) ) ( not ( = ?auto_1717187 ?auto_1717193 ) ) ( not ( = ?auto_1717187 ?auto_1717194 ) ) ( not ( = ?auto_1717187 ?auto_1717195 ) ) ( not ( = ?auto_1717187 ?auto_1717196 ) ) ( not ( = ?auto_1717187 ?auto_1717199 ) ) ( not ( = ?auto_1717188 ?auto_1717189 ) ) ( not ( = ?auto_1717188 ?auto_1717190 ) ) ( not ( = ?auto_1717188 ?auto_1717191 ) ) ( not ( = ?auto_1717188 ?auto_1717192 ) ) ( not ( = ?auto_1717188 ?auto_1717193 ) ) ( not ( = ?auto_1717188 ?auto_1717194 ) ) ( not ( = ?auto_1717188 ?auto_1717195 ) ) ( not ( = ?auto_1717188 ?auto_1717196 ) ) ( not ( = ?auto_1717188 ?auto_1717199 ) ) ( not ( = ?auto_1717189 ?auto_1717190 ) ) ( not ( = ?auto_1717189 ?auto_1717191 ) ) ( not ( = ?auto_1717189 ?auto_1717192 ) ) ( not ( = ?auto_1717189 ?auto_1717193 ) ) ( not ( = ?auto_1717189 ?auto_1717194 ) ) ( not ( = ?auto_1717189 ?auto_1717195 ) ) ( not ( = ?auto_1717189 ?auto_1717196 ) ) ( not ( = ?auto_1717189 ?auto_1717199 ) ) ( not ( = ?auto_1717190 ?auto_1717191 ) ) ( not ( = ?auto_1717190 ?auto_1717192 ) ) ( not ( = ?auto_1717190 ?auto_1717193 ) ) ( not ( = ?auto_1717190 ?auto_1717194 ) ) ( not ( = ?auto_1717190 ?auto_1717195 ) ) ( not ( = ?auto_1717190 ?auto_1717196 ) ) ( not ( = ?auto_1717190 ?auto_1717199 ) ) ( not ( = ?auto_1717191 ?auto_1717192 ) ) ( not ( = ?auto_1717191 ?auto_1717193 ) ) ( not ( = ?auto_1717191 ?auto_1717194 ) ) ( not ( = ?auto_1717191 ?auto_1717195 ) ) ( not ( = ?auto_1717191 ?auto_1717196 ) ) ( not ( = ?auto_1717191 ?auto_1717199 ) ) ( not ( = ?auto_1717192 ?auto_1717193 ) ) ( not ( = ?auto_1717192 ?auto_1717194 ) ) ( not ( = ?auto_1717192 ?auto_1717195 ) ) ( not ( = ?auto_1717192 ?auto_1717196 ) ) ( not ( = ?auto_1717192 ?auto_1717199 ) ) ( not ( = ?auto_1717193 ?auto_1717194 ) ) ( not ( = ?auto_1717193 ?auto_1717195 ) ) ( not ( = ?auto_1717193 ?auto_1717196 ) ) ( not ( = ?auto_1717193 ?auto_1717199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1717194 ?auto_1717195 ?auto_1717196 )
      ( MAKE-9CRATE-VERIFY ?auto_1717187 ?auto_1717188 ?auto_1717189 ?auto_1717190 ?auto_1717191 ?auto_1717192 ?auto_1717193 ?auto_1717194 ?auto_1717195 ?auto_1717196 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1717296 - SURFACE
      ?auto_1717297 - SURFACE
      ?auto_1717298 - SURFACE
      ?auto_1717299 - SURFACE
      ?auto_1717300 - SURFACE
      ?auto_1717301 - SURFACE
      ?auto_1717302 - SURFACE
      ?auto_1717303 - SURFACE
      ?auto_1717304 - SURFACE
      ?auto_1717305 - SURFACE
    )
    :vars
    (
      ?auto_1717309 - HOIST
      ?auto_1717306 - PLACE
      ?auto_1717311 - PLACE
      ?auto_1717310 - HOIST
      ?auto_1717307 - SURFACE
      ?auto_1717308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1717309 ?auto_1717306 ) ( IS-CRATE ?auto_1717305 ) ( not ( = ?auto_1717304 ?auto_1717305 ) ) ( not ( = ?auto_1717303 ?auto_1717304 ) ) ( not ( = ?auto_1717303 ?auto_1717305 ) ) ( not ( = ?auto_1717311 ?auto_1717306 ) ) ( HOIST-AT ?auto_1717310 ?auto_1717311 ) ( not ( = ?auto_1717309 ?auto_1717310 ) ) ( AVAILABLE ?auto_1717310 ) ( SURFACE-AT ?auto_1717305 ?auto_1717311 ) ( ON ?auto_1717305 ?auto_1717307 ) ( CLEAR ?auto_1717305 ) ( not ( = ?auto_1717304 ?auto_1717307 ) ) ( not ( = ?auto_1717305 ?auto_1717307 ) ) ( not ( = ?auto_1717303 ?auto_1717307 ) ) ( TRUCK-AT ?auto_1717308 ?auto_1717306 ) ( SURFACE-AT ?auto_1717303 ?auto_1717306 ) ( CLEAR ?auto_1717303 ) ( IS-CRATE ?auto_1717304 ) ( AVAILABLE ?auto_1717309 ) ( IN ?auto_1717304 ?auto_1717308 ) ( ON ?auto_1717297 ?auto_1717296 ) ( ON ?auto_1717298 ?auto_1717297 ) ( ON ?auto_1717299 ?auto_1717298 ) ( ON ?auto_1717300 ?auto_1717299 ) ( ON ?auto_1717301 ?auto_1717300 ) ( ON ?auto_1717302 ?auto_1717301 ) ( ON ?auto_1717303 ?auto_1717302 ) ( not ( = ?auto_1717296 ?auto_1717297 ) ) ( not ( = ?auto_1717296 ?auto_1717298 ) ) ( not ( = ?auto_1717296 ?auto_1717299 ) ) ( not ( = ?auto_1717296 ?auto_1717300 ) ) ( not ( = ?auto_1717296 ?auto_1717301 ) ) ( not ( = ?auto_1717296 ?auto_1717302 ) ) ( not ( = ?auto_1717296 ?auto_1717303 ) ) ( not ( = ?auto_1717296 ?auto_1717304 ) ) ( not ( = ?auto_1717296 ?auto_1717305 ) ) ( not ( = ?auto_1717296 ?auto_1717307 ) ) ( not ( = ?auto_1717297 ?auto_1717298 ) ) ( not ( = ?auto_1717297 ?auto_1717299 ) ) ( not ( = ?auto_1717297 ?auto_1717300 ) ) ( not ( = ?auto_1717297 ?auto_1717301 ) ) ( not ( = ?auto_1717297 ?auto_1717302 ) ) ( not ( = ?auto_1717297 ?auto_1717303 ) ) ( not ( = ?auto_1717297 ?auto_1717304 ) ) ( not ( = ?auto_1717297 ?auto_1717305 ) ) ( not ( = ?auto_1717297 ?auto_1717307 ) ) ( not ( = ?auto_1717298 ?auto_1717299 ) ) ( not ( = ?auto_1717298 ?auto_1717300 ) ) ( not ( = ?auto_1717298 ?auto_1717301 ) ) ( not ( = ?auto_1717298 ?auto_1717302 ) ) ( not ( = ?auto_1717298 ?auto_1717303 ) ) ( not ( = ?auto_1717298 ?auto_1717304 ) ) ( not ( = ?auto_1717298 ?auto_1717305 ) ) ( not ( = ?auto_1717298 ?auto_1717307 ) ) ( not ( = ?auto_1717299 ?auto_1717300 ) ) ( not ( = ?auto_1717299 ?auto_1717301 ) ) ( not ( = ?auto_1717299 ?auto_1717302 ) ) ( not ( = ?auto_1717299 ?auto_1717303 ) ) ( not ( = ?auto_1717299 ?auto_1717304 ) ) ( not ( = ?auto_1717299 ?auto_1717305 ) ) ( not ( = ?auto_1717299 ?auto_1717307 ) ) ( not ( = ?auto_1717300 ?auto_1717301 ) ) ( not ( = ?auto_1717300 ?auto_1717302 ) ) ( not ( = ?auto_1717300 ?auto_1717303 ) ) ( not ( = ?auto_1717300 ?auto_1717304 ) ) ( not ( = ?auto_1717300 ?auto_1717305 ) ) ( not ( = ?auto_1717300 ?auto_1717307 ) ) ( not ( = ?auto_1717301 ?auto_1717302 ) ) ( not ( = ?auto_1717301 ?auto_1717303 ) ) ( not ( = ?auto_1717301 ?auto_1717304 ) ) ( not ( = ?auto_1717301 ?auto_1717305 ) ) ( not ( = ?auto_1717301 ?auto_1717307 ) ) ( not ( = ?auto_1717302 ?auto_1717303 ) ) ( not ( = ?auto_1717302 ?auto_1717304 ) ) ( not ( = ?auto_1717302 ?auto_1717305 ) ) ( not ( = ?auto_1717302 ?auto_1717307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1717303 ?auto_1717304 ?auto_1717305 )
      ( MAKE-9CRATE-VERIFY ?auto_1717296 ?auto_1717297 ?auto_1717298 ?auto_1717299 ?auto_1717300 ?auto_1717301 ?auto_1717302 ?auto_1717303 ?auto_1717304 ?auto_1717305 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722812 - SURFACE
      ?auto_1722813 - SURFACE
      ?auto_1722814 - SURFACE
      ?auto_1722815 - SURFACE
      ?auto_1722816 - SURFACE
      ?auto_1722817 - SURFACE
      ?auto_1722818 - SURFACE
      ?auto_1722819 - SURFACE
      ?auto_1722820 - SURFACE
      ?auto_1722821 - SURFACE
      ?auto_1722822 - SURFACE
    )
    :vars
    (
      ?auto_1722824 - HOIST
      ?auto_1722823 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722824 ?auto_1722823 ) ( SURFACE-AT ?auto_1722821 ?auto_1722823 ) ( CLEAR ?auto_1722821 ) ( LIFTING ?auto_1722824 ?auto_1722822 ) ( IS-CRATE ?auto_1722822 ) ( not ( = ?auto_1722821 ?auto_1722822 ) ) ( ON ?auto_1722813 ?auto_1722812 ) ( ON ?auto_1722814 ?auto_1722813 ) ( ON ?auto_1722815 ?auto_1722814 ) ( ON ?auto_1722816 ?auto_1722815 ) ( ON ?auto_1722817 ?auto_1722816 ) ( ON ?auto_1722818 ?auto_1722817 ) ( ON ?auto_1722819 ?auto_1722818 ) ( ON ?auto_1722820 ?auto_1722819 ) ( ON ?auto_1722821 ?auto_1722820 ) ( not ( = ?auto_1722812 ?auto_1722813 ) ) ( not ( = ?auto_1722812 ?auto_1722814 ) ) ( not ( = ?auto_1722812 ?auto_1722815 ) ) ( not ( = ?auto_1722812 ?auto_1722816 ) ) ( not ( = ?auto_1722812 ?auto_1722817 ) ) ( not ( = ?auto_1722812 ?auto_1722818 ) ) ( not ( = ?auto_1722812 ?auto_1722819 ) ) ( not ( = ?auto_1722812 ?auto_1722820 ) ) ( not ( = ?auto_1722812 ?auto_1722821 ) ) ( not ( = ?auto_1722812 ?auto_1722822 ) ) ( not ( = ?auto_1722813 ?auto_1722814 ) ) ( not ( = ?auto_1722813 ?auto_1722815 ) ) ( not ( = ?auto_1722813 ?auto_1722816 ) ) ( not ( = ?auto_1722813 ?auto_1722817 ) ) ( not ( = ?auto_1722813 ?auto_1722818 ) ) ( not ( = ?auto_1722813 ?auto_1722819 ) ) ( not ( = ?auto_1722813 ?auto_1722820 ) ) ( not ( = ?auto_1722813 ?auto_1722821 ) ) ( not ( = ?auto_1722813 ?auto_1722822 ) ) ( not ( = ?auto_1722814 ?auto_1722815 ) ) ( not ( = ?auto_1722814 ?auto_1722816 ) ) ( not ( = ?auto_1722814 ?auto_1722817 ) ) ( not ( = ?auto_1722814 ?auto_1722818 ) ) ( not ( = ?auto_1722814 ?auto_1722819 ) ) ( not ( = ?auto_1722814 ?auto_1722820 ) ) ( not ( = ?auto_1722814 ?auto_1722821 ) ) ( not ( = ?auto_1722814 ?auto_1722822 ) ) ( not ( = ?auto_1722815 ?auto_1722816 ) ) ( not ( = ?auto_1722815 ?auto_1722817 ) ) ( not ( = ?auto_1722815 ?auto_1722818 ) ) ( not ( = ?auto_1722815 ?auto_1722819 ) ) ( not ( = ?auto_1722815 ?auto_1722820 ) ) ( not ( = ?auto_1722815 ?auto_1722821 ) ) ( not ( = ?auto_1722815 ?auto_1722822 ) ) ( not ( = ?auto_1722816 ?auto_1722817 ) ) ( not ( = ?auto_1722816 ?auto_1722818 ) ) ( not ( = ?auto_1722816 ?auto_1722819 ) ) ( not ( = ?auto_1722816 ?auto_1722820 ) ) ( not ( = ?auto_1722816 ?auto_1722821 ) ) ( not ( = ?auto_1722816 ?auto_1722822 ) ) ( not ( = ?auto_1722817 ?auto_1722818 ) ) ( not ( = ?auto_1722817 ?auto_1722819 ) ) ( not ( = ?auto_1722817 ?auto_1722820 ) ) ( not ( = ?auto_1722817 ?auto_1722821 ) ) ( not ( = ?auto_1722817 ?auto_1722822 ) ) ( not ( = ?auto_1722818 ?auto_1722819 ) ) ( not ( = ?auto_1722818 ?auto_1722820 ) ) ( not ( = ?auto_1722818 ?auto_1722821 ) ) ( not ( = ?auto_1722818 ?auto_1722822 ) ) ( not ( = ?auto_1722819 ?auto_1722820 ) ) ( not ( = ?auto_1722819 ?auto_1722821 ) ) ( not ( = ?auto_1722819 ?auto_1722822 ) ) ( not ( = ?auto_1722820 ?auto_1722821 ) ) ( not ( = ?auto_1722820 ?auto_1722822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1722821 ?auto_1722822 )
      ( MAKE-10CRATE-VERIFY ?auto_1722812 ?auto_1722813 ?auto_1722814 ?auto_1722815 ?auto_1722816 ?auto_1722817 ?auto_1722818 ?auto_1722819 ?auto_1722820 ?auto_1722821 ?auto_1722822 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1722906 - SURFACE
      ?auto_1722907 - SURFACE
      ?auto_1722908 - SURFACE
      ?auto_1722909 - SURFACE
      ?auto_1722910 - SURFACE
      ?auto_1722911 - SURFACE
      ?auto_1722912 - SURFACE
      ?auto_1722913 - SURFACE
      ?auto_1722914 - SURFACE
      ?auto_1722915 - SURFACE
      ?auto_1722916 - SURFACE
    )
    :vars
    (
      ?auto_1722918 - HOIST
      ?auto_1722919 - PLACE
      ?auto_1722917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722918 ?auto_1722919 ) ( SURFACE-AT ?auto_1722915 ?auto_1722919 ) ( CLEAR ?auto_1722915 ) ( IS-CRATE ?auto_1722916 ) ( not ( = ?auto_1722915 ?auto_1722916 ) ) ( TRUCK-AT ?auto_1722917 ?auto_1722919 ) ( AVAILABLE ?auto_1722918 ) ( IN ?auto_1722916 ?auto_1722917 ) ( ON ?auto_1722915 ?auto_1722914 ) ( not ( = ?auto_1722914 ?auto_1722915 ) ) ( not ( = ?auto_1722914 ?auto_1722916 ) ) ( ON ?auto_1722907 ?auto_1722906 ) ( ON ?auto_1722908 ?auto_1722907 ) ( ON ?auto_1722909 ?auto_1722908 ) ( ON ?auto_1722910 ?auto_1722909 ) ( ON ?auto_1722911 ?auto_1722910 ) ( ON ?auto_1722912 ?auto_1722911 ) ( ON ?auto_1722913 ?auto_1722912 ) ( ON ?auto_1722914 ?auto_1722913 ) ( not ( = ?auto_1722906 ?auto_1722907 ) ) ( not ( = ?auto_1722906 ?auto_1722908 ) ) ( not ( = ?auto_1722906 ?auto_1722909 ) ) ( not ( = ?auto_1722906 ?auto_1722910 ) ) ( not ( = ?auto_1722906 ?auto_1722911 ) ) ( not ( = ?auto_1722906 ?auto_1722912 ) ) ( not ( = ?auto_1722906 ?auto_1722913 ) ) ( not ( = ?auto_1722906 ?auto_1722914 ) ) ( not ( = ?auto_1722906 ?auto_1722915 ) ) ( not ( = ?auto_1722906 ?auto_1722916 ) ) ( not ( = ?auto_1722907 ?auto_1722908 ) ) ( not ( = ?auto_1722907 ?auto_1722909 ) ) ( not ( = ?auto_1722907 ?auto_1722910 ) ) ( not ( = ?auto_1722907 ?auto_1722911 ) ) ( not ( = ?auto_1722907 ?auto_1722912 ) ) ( not ( = ?auto_1722907 ?auto_1722913 ) ) ( not ( = ?auto_1722907 ?auto_1722914 ) ) ( not ( = ?auto_1722907 ?auto_1722915 ) ) ( not ( = ?auto_1722907 ?auto_1722916 ) ) ( not ( = ?auto_1722908 ?auto_1722909 ) ) ( not ( = ?auto_1722908 ?auto_1722910 ) ) ( not ( = ?auto_1722908 ?auto_1722911 ) ) ( not ( = ?auto_1722908 ?auto_1722912 ) ) ( not ( = ?auto_1722908 ?auto_1722913 ) ) ( not ( = ?auto_1722908 ?auto_1722914 ) ) ( not ( = ?auto_1722908 ?auto_1722915 ) ) ( not ( = ?auto_1722908 ?auto_1722916 ) ) ( not ( = ?auto_1722909 ?auto_1722910 ) ) ( not ( = ?auto_1722909 ?auto_1722911 ) ) ( not ( = ?auto_1722909 ?auto_1722912 ) ) ( not ( = ?auto_1722909 ?auto_1722913 ) ) ( not ( = ?auto_1722909 ?auto_1722914 ) ) ( not ( = ?auto_1722909 ?auto_1722915 ) ) ( not ( = ?auto_1722909 ?auto_1722916 ) ) ( not ( = ?auto_1722910 ?auto_1722911 ) ) ( not ( = ?auto_1722910 ?auto_1722912 ) ) ( not ( = ?auto_1722910 ?auto_1722913 ) ) ( not ( = ?auto_1722910 ?auto_1722914 ) ) ( not ( = ?auto_1722910 ?auto_1722915 ) ) ( not ( = ?auto_1722910 ?auto_1722916 ) ) ( not ( = ?auto_1722911 ?auto_1722912 ) ) ( not ( = ?auto_1722911 ?auto_1722913 ) ) ( not ( = ?auto_1722911 ?auto_1722914 ) ) ( not ( = ?auto_1722911 ?auto_1722915 ) ) ( not ( = ?auto_1722911 ?auto_1722916 ) ) ( not ( = ?auto_1722912 ?auto_1722913 ) ) ( not ( = ?auto_1722912 ?auto_1722914 ) ) ( not ( = ?auto_1722912 ?auto_1722915 ) ) ( not ( = ?auto_1722912 ?auto_1722916 ) ) ( not ( = ?auto_1722913 ?auto_1722914 ) ) ( not ( = ?auto_1722913 ?auto_1722915 ) ) ( not ( = ?auto_1722913 ?auto_1722916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1722914 ?auto_1722915 ?auto_1722916 )
      ( MAKE-10CRATE-VERIFY ?auto_1722906 ?auto_1722907 ?auto_1722908 ?auto_1722909 ?auto_1722910 ?auto_1722911 ?auto_1722912 ?auto_1722913 ?auto_1722914 ?auto_1722915 ?auto_1722916 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723011 - SURFACE
      ?auto_1723012 - SURFACE
      ?auto_1723013 - SURFACE
      ?auto_1723014 - SURFACE
      ?auto_1723015 - SURFACE
      ?auto_1723016 - SURFACE
      ?auto_1723017 - SURFACE
      ?auto_1723018 - SURFACE
      ?auto_1723019 - SURFACE
      ?auto_1723020 - SURFACE
      ?auto_1723021 - SURFACE
    )
    :vars
    (
      ?auto_1723025 - HOIST
      ?auto_1723024 - PLACE
      ?auto_1723022 - TRUCK
      ?auto_1723023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723025 ?auto_1723024 ) ( SURFACE-AT ?auto_1723020 ?auto_1723024 ) ( CLEAR ?auto_1723020 ) ( IS-CRATE ?auto_1723021 ) ( not ( = ?auto_1723020 ?auto_1723021 ) ) ( AVAILABLE ?auto_1723025 ) ( IN ?auto_1723021 ?auto_1723022 ) ( ON ?auto_1723020 ?auto_1723019 ) ( not ( = ?auto_1723019 ?auto_1723020 ) ) ( not ( = ?auto_1723019 ?auto_1723021 ) ) ( TRUCK-AT ?auto_1723022 ?auto_1723023 ) ( not ( = ?auto_1723023 ?auto_1723024 ) ) ( ON ?auto_1723012 ?auto_1723011 ) ( ON ?auto_1723013 ?auto_1723012 ) ( ON ?auto_1723014 ?auto_1723013 ) ( ON ?auto_1723015 ?auto_1723014 ) ( ON ?auto_1723016 ?auto_1723015 ) ( ON ?auto_1723017 ?auto_1723016 ) ( ON ?auto_1723018 ?auto_1723017 ) ( ON ?auto_1723019 ?auto_1723018 ) ( not ( = ?auto_1723011 ?auto_1723012 ) ) ( not ( = ?auto_1723011 ?auto_1723013 ) ) ( not ( = ?auto_1723011 ?auto_1723014 ) ) ( not ( = ?auto_1723011 ?auto_1723015 ) ) ( not ( = ?auto_1723011 ?auto_1723016 ) ) ( not ( = ?auto_1723011 ?auto_1723017 ) ) ( not ( = ?auto_1723011 ?auto_1723018 ) ) ( not ( = ?auto_1723011 ?auto_1723019 ) ) ( not ( = ?auto_1723011 ?auto_1723020 ) ) ( not ( = ?auto_1723011 ?auto_1723021 ) ) ( not ( = ?auto_1723012 ?auto_1723013 ) ) ( not ( = ?auto_1723012 ?auto_1723014 ) ) ( not ( = ?auto_1723012 ?auto_1723015 ) ) ( not ( = ?auto_1723012 ?auto_1723016 ) ) ( not ( = ?auto_1723012 ?auto_1723017 ) ) ( not ( = ?auto_1723012 ?auto_1723018 ) ) ( not ( = ?auto_1723012 ?auto_1723019 ) ) ( not ( = ?auto_1723012 ?auto_1723020 ) ) ( not ( = ?auto_1723012 ?auto_1723021 ) ) ( not ( = ?auto_1723013 ?auto_1723014 ) ) ( not ( = ?auto_1723013 ?auto_1723015 ) ) ( not ( = ?auto_1723013 ?auto_1723016 ) ) ( not ( = ?auto_1723013 ?auto_1723017 ) ) ( not ( = ?auto_1723013 ?auto_1723018 ) ) ( not ( = ?auto_1723013 ?auto_1723019 ) ) ( not ( = ?auto_1723013 ?auto_1723020 ) ) ( not ( = ?auto_1723013 ?auto_1723021 ) ) ( not ( = ?auto_1723014 ?auto_1723015 ) ) ( not ( = ?auto_1723014 ?auto_1723016 ) ) ( not ( = ?auto_1723014 ?auto_1723017 ) ) ( not ( = ?auto_1723014 ?auto_1723018 ) ) ( not ( = ?auto_1723014 ?auto_1723019 ) ) ( not ( = ?auto_1723014 ?auto_1723020 ) ) ( not ( = ?auto_1723014 ?auto_1723021 ) ) ( not ( = ?auto_1723015 ?auto_1723016 ) ) ( not ( = ?auto_1723015 ?auto_1723017 ) ) ( not ( = ?auto_1723015 ?auto_1723018 ) ) ( not ( = ?auto_1723015 ?auto_1723019 ) ) ( not ( = ?auto_1723015 ?auto_1723020 ) ) ( not ( = ?auto_1723015 ?auto_1723021 ) ) ( not ( = ?auto_1723016 ?auto_1723017 ) ) ( not ( = ?auto_1723016 ?auto_1723018 ) ) ( not ( = ?auto_1723016 ?auto_1723019 ) ) ( not ( = ?auto_1723016 ?auto_1723020 ) ) ( not ( = ?auto_1723016 ?auto_1723021 ) ) ( not ( = ?auto_1723017 ?auto_1723018 ) ) ( not ( = ?auto_1723017 ?auto_1723019 ) ) ( not ( = ?auto_1723017 ?auto_1723020 ) ) ( not ( = ?auto_1723017 ?auto_1723021 ) ) ( not ( = ?auto_1723018 ?auto_1723019 ) ) ( not ( = ?auto_1723018 ?auto_1723020 ) ) ( not ( = ?auto_1723018 ?auto_1723021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723019 ?auto_1723020 ?auto_1723021 )
      ( MAKE-10CRATE-VERIFY ?auto_1723011 ?auto_1723012 ?auto_1723013 ?auto_1723014 ?auto_1723015 ?auto_1723016 ?auto_1723017 ?auto_1723018 ?auto_1723019 ?auto_1723020 ?auto_1723021 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723126 - SURFACE
      ?auto_1723127 - SURFACE
      ?auto_1723128 - SURFACE
      ?auto_1723129 - SURFACE
      ?auto_1723130 - SURFACE
      ?auto_1723131 - SURFACE
      ?auto_1723132 - SURFACE
      ?auto_1723133 - SURFACE
      ?auto_1723134 - SURFACE
      ?auto_1723135 - SURFACE
      ?auto_1723136 - SURFACE
    )
    :vars
    (
      ?auto_1723140 - HOIST
      ?auto_1723137 - PLACE
      ?auto_1723139 - TRUCK
      ?auto_1723141 - PLACE
      ?auto_1723138 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723140 ?auto_1723137 ) ( SURFACE-AT ?auto_1723135 ?auto_1723137 ) ( CLEAR ?auto_1723135 ) ( IS-CRATE ?auto_1723136 ) ( not ( = ?auto_1723135 ?auto_1723136 ) ) ( AVAILABLE ?auto_1723140 ) ( ON ?auto_1723135 ?auto_1723134 ) ( not ( = ?auto_1723134 ?auto_1723135 ) ) ( not ( = ?auto_1723134 ?auto_1723136 ) ) ( TRUCK-AT ?auto_1723139 ?auto_1723141 ) ( not ( = ?auto_1723141 ?auto_1723137 ) ) ( HOIST-AT ?auto_1723138 ?auto_1723141 ) ( LIFTING ?auto_1723138 ?auto_1723136 ) ( not ( = ?auto_1723140 ?auto_1723138 ) ) ( ON ?auto_1723127 ?auto_1723126 ) ( ON ?auto_1723128 ?auto_1723127 ) ( ON ?auto_1723129 ?auto_1723128 ) ( ON ?auto_1723130 ?auto_1723129 ) ( ON ?auto_1723131 ?auto_1723130 ) ( ON ?auto_1723132 ?auto_1723131 ) ( ON ?auto_1723133 ?auto_1723132 ) ( ON ?auto_1723134 ?auto_1723133 ) ( not ( = ?auto_1723126 ?auto_1723127 ) ) ( not ( = ?auto_1723126 ?auto_1723128 ) ) ( not ( = ?auto_1723126 ?auto_1723129 ) ) ( not ( = ?auto_1723126 ?auto_1723130 ) ) ( not ( = ?auto_1723126 ?auto_1723131 ) ) ( not ( = ?auto_1723126 ?auto_1723132 ) ) ( not ( = ?auto_1723126 ?auto_1723133 ) ) ( not ( = ?auto_1723126 ?auto_1723134 ) ) ( not ( = ?auto_1723126 ?auto_1723135 ) ) ( not ( = ?auto_1723126 ?auto_1723136 ) ) ( not ( = ?auto_1723127 ?auto_1723128 ) ) ( not ( = ?auto_1723127 ?auto_1723129 ) ) ( not ( = ?auto_1723127 ?auto_1723130 ) ) ( not ( = ?auto_1723127 ?auto_1723131 ) ) ( not ( = ?auto_1723127 ?auto_1723132 ) ) ( not ( = ?auto_1723127 ?auto_1723133 ) ) ( not ( = ?auto_1723127 ?auto_1723134 ) ) ( not ( = ?auto_1723127 ?auto_1723135 ) ) ( not ( = ?auto_1723127 ?auto_1723136 ) ) ( not ( = ?auto_1723128 ?auto_1723129 ) ) ( not ( = ?auto_1723128 ?auto_1723130 ) ) ( not ( = ?auto_1723128 ?auto_1723131 ) ) ( not ( = ?auto_1723128 ?auto_1723132 ) ) ( not ( = ?auto_1723128 ?auto_1723133 ) ) ( not ( = ?auto_1723128 ?auto_1723134 ) ) ( not ( = ?auto_1723128 ?auto_1723135 ) ) ( not ( = ?auto_1723128 ?auto_1723136 ) ) ( not ( = ?auto_1723129 ?auto_1723130 ) ) ( not ( = ?auto_1723129 ?auto_1723131 ) ) ( not ( = ?auto_1723129 ?auto_1723132 ) ) ( not ( = ?auto_1723129 ?auto_1723133 ) ) ( not ( = ?auto_1723129 ?auto_1723134 ) ) ( not ( = ?auto_1723129 ?auto_1723135 ) ) ( not ( = ?auto_1723129 ?auto_1723136 ) ) ( not ( = ?auto_1723130 ?auto_1723131 ) ) ( not ( = ?auto_1723130 ?auto_1723132 ) ) ( not ( = ?auto_1723130 ?auto_1723133 ) ) ( not ( = ?auto_1723130 ?auto_1723134 ) ) ( not ( = ?auto_1723130 ?auto_1723135 ) ) ( not ( = ?auto_1723130 ?auto_1723136 ) ) ( not ( = ?auto_1723131 ?auto_1723132 ) ) ( not ( = ?auto_1723131 ?auto_1723133 ) ) ( not ( = ?auto_1723131 ?auto_1723134 ) ) ( not ( = ?auto_1723131 ?auto_1723135 ) ) ( not ( = ?auto_1723131 ?auto_1723136 ) ) ( not ( = ?auto_1723132 ?auto_1723133 ) ) ( not ( = ?auto_1723132 ?auto_1723134 ) ) ( not ( = ?auto_1723132 ?auto_1723135 ) ) ( not ( = ?auto_1723132 ?auto_1723136 ) ) ( not ( = ?auto_1723133 ?auto_1723134 ) ) ( not ( = ?auto_1723133 ?auto_1723135 ) ) ( not ( = ?auto_1723133 ?auto_1723136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723134 ?auto_1723135 ?auto_1723136 )
      ( MAKE-10CRATE-VERIFY ?auto_1723126 ?auto_1723127 ?auto_1723128 ?auto_1723129 ?auto_1723130 ?auto_1723131 ?auto_1723132 ?auto_1723133 ?auto_1723134 ?auto_1723135 ?auto_1723136 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723251 - SURFACE
      ?auto_1723252 - SURFACE
      ?auto_1723253 - SURFACE
      ?auto_1723254 - SURFACE
      ?auto_1723255 - SURFACE
      ?auto_1723256 - SURFACE
      ?auto_1723257 - SURFACE
      ?auto_1723258 - SURFACE
      ?auto_1723259 - SURFACE
      ?auto_1723260 - SURFACE
      ?auto_1723261 - SURFACE
    )
    :vars
    (
      ?auto_1723264 - HOIST
      ?auto_1723266 - PLACE
      ?auto_1723262 - TRUCK
      ?auto_1723267 - PLACE
      ?auto_1723265 - HOIST
      ?auto_1723263 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723264 ?auto_1723266 ) ( SURFACE-AT ?auto_1723260 ?auto_1723266 ) ( CLEAR ?auto_1723260 ) ( IS-CRATE ?auto_1723261 ) ( not ( = ?auto_1723260 ?auto_1723261 ) ) ( AVAILABLE ?auto_1723264 ) ( ON ?auto_1723260 ?auto_1723259 ) ( not ( = ?auto_1723259 ?auto_1723260 ) ) ( not ( = ?auto_1723259 ?auto_1723261 ) ) ( TRUCK-AT ?auto_1723262 ?auto_1723267 ) ( not ( = ?auto_1723267 ?auto_1723266 ) ) ( HOIST-AT ?auto_1723265 ?auto_1723267 ) ( not ( = ?auto_1723264 ?auto_1723265 ) ) ( AVAILABLE ?auto_1723265 ) ( SURFACE-AT ?auto_1723261 ?auto_1723267 ) ( ON ?auto_1723261 ?auto_1723263 ) ( CLEAR ?auto_1723261 ) ( not ( = ?auto_1723260 ?auto_1723263 ) ) ( not ( = ?auto_1723261 ?auto_1723263 ) ) ( not ( = ?auto_1723259 ?auto_1723263 ) ) ( ON ?auto_1723252 ?auto_1723251 ) ( ON ?auto_1723253 ?auto_1723252 ) ( ON ?auto_1723254 ?auto_1723253 ) ( ON ?auto_1723255 ?auto_1723254 ) ( ON ?auto_1723256 ?auto_1723255 ) ( ON ?auto_1723257 ?auto_1723256 ) ( ON ?auto_1723258 ?auto_1723257 ) ( ON ?auto_1723259 ?auto_1723258 ) ( not ( = ?auto_1723251 ?auto_1723252 ) ) ( not ( = ?auto_1723251 ?auto_1723253 ) ) ( not ( = ?auto_1723251 ?auto_1723254 ) ) ( not ( = ?auto_1723251 ?auto_1723255 ) ) ( not ( = ?auto_1723251 ?auto_1723256 ) ) ( not ( = ?auto_1723251 ?auto_1723257 ) ) ( not ( = ?auto_1723251 ?auto_1723258 ) ) ( not ( = ?auto_1723251 ?auto_1723259 ) ) ( not ( = ?auto_1723251 ?auto_1723260 ) ) ( not ( = ?auto_1723251 ?auto_1723261 ) ) ( not ( = ?auto_1723251 ?auto_1723263 ) ) ( not ( = ?auto_1723252 ?auto_1723253 ) ) ( not ( = ?auto_1723252 ?auto_1723254 ) ) ( not ( = ?auto_1723252 ?auto_1723255 ) ) ( not ( = ?auto_1723252 ?auto_1723256 ) ) ( not ( = ?auto_1723252 ?auto_1723257 ) ) ( not ( = ?auto_1723252 ?auto_1723258 ) ) ( not ( = ?auto_1723252 ?auto_1723259 ) ) ( not ( = ?auto_1723252 ?auto_1723260 ) ) ( not ( = ?auto_1723252 ?auto_1723261 ) ) ( not ( = ?auto_1723252 ?auto_1723263 ) ) ( not ( = ?auto_1723253 ?auto_1723254 ) ) ( not ( = ?auto_1723253 ?auto_1723255 ) ) ( not ( = ?auto_1723253 ?auto_1723256 ) ) ( not ( = ?auto_1723253 ?auto_1723257 ) ) ( not ( = ?auto_1723253 ?auto_1723258 ) ) ( not ( = ?auto_1723253 ?auto_1723259 ) ) ( not ( = ?auto_1723253 ?auto_1723260 ) ) ( not ( = ?auto_1723253 ?auto_1723261 ) ) ( not ( = ?auto_1723253 ?auto_1723263 ) ) ( not ( = ?auto_1723254 ?auto_1723255 ) ) ( not ( = ?auto_1723254 ?auto_1723256 ) ) ( not ( = ?auto_1723254 ?auto_1723257 ) ) ( not ( = ?auto_1723254 ?auto_1723258 ) ) ( not ( = ?auto_1723254 ?auto_1723259 ) ) ( not ( = ?auto_1723254 ?auto_1723260 ) ) ( not ( = ?auto_1723254 ?auto_1723261 ) ) ( not ( = ?auto_1723254 ?auto_1723263 ) ) ( not ( = ?auto_1723255 ?auto_1723256 ) ) ( not ( = ?auto_1723255 ?auto_1723257 ) ) ( not ( = ?auto_1723255 ?auto_1723258 ) ) ( not ( = ?auto_1723255 ?auto_1723259 ) ) ( not ( = ?auto_1723255 ?auto_1723260 ) ) ( not ( = ?auto_1723255 ?auto_1723261 ) ) ( not ( = ?auto_1723255 ?auto_1723263 ) ) ( not ( = ?auto_1723256 ?auto_1723257 ) ) ( not ( = ?auto_1723256 ?auto_1723258 ) ) ( not ( = ?auto_1723256 ?auto_1723259 ) ) ( not ( = ?auto_1723256 ?auto_1723260 ) ) ( not ( = ?auto_1723256 ?auto_1723261 ) ) ( not ( = ?auto_1723256 ?auto_1723263 ) ) ( not ( = ?auto_1723257 ?auto_1723258 ) ) ( not ( = ?auto_1723257 ?auto_1723259 ) ) ( not ( = ?auto_1723257 ?auto_1723260 ) ) ( not ( = ?auto_1723257 ?auto_1723261 ) ) ( not ( = ?auto_1723257 ?auto_1723263 ) ) ( not ( = ?auto_1723258 ?auto_1723259 ) ) ( not ( = ?auto_1723258 ?auto_1723260 ) ) ( not ( = ?auto_1723258 ?auto_1723261 ) ) ( not ( = ?auto_1723258 ?auto_1723263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723259 ?auto_1723260 ?auto_1723261 )
      ( MAKE-10CRATE-VERIFY ?auto_1723251 ?auto_1723252 ?auto_1723253 ?auto_1723254 ?auto_1723255 ?auto_1723256 ?auto_1723257 ?auto_1723258 ?auto_1723259 ?auto_1723260 ?auto_1723261 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723377 - SURFACE
      ?auto_1723378 - SURFACE
      ?auto_1723379 - SURFACE
      ?auto_1723380 - SURFACE
      ?auto_1723381 - SURFACE
      ?auto_1723382 - SURFACE
      ?auto_1723383 - SURFACE
      ?auto_1723384 - SURFACE
      ?auto_1723385 - SURFACE
      ?auto_1723386 - SURFACE
      ?auto_1723387 - SURFACE
    )
    :vars
    (
      ?auto_1723390 - HOIST
      ?auto_1723389 - PLACE
      ?auto_1723388 - PLACE
      ?auto_1723392 - HOIST
      ?auto_1723393 - SURFACE
      ?auto_1723391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723390 ?auto_1723389 ) ( SURFACE-AT ?auto_1723386 ?auto_1723389 ) ( CLEAR ?auto_1723386 ) ( IS-CRATE ?auto_1723387 ) ( not ( = ?auto_1723386 ?auto_1723387 ) ) ( AVAILABLE ?auto_1723390 ) ( ON ?auto_1723386 ?auto_1723385 ) ( not ( = ?auto_1723385 ?auto_1723386 ) ) ( not ( = ?auto_1723385 ?auto_1723387 ) ) ( not ( = ?auto_1723388 ?auto_1723389 ) ) ( HOIST-AT ?auto_1723392 ?auto_1723388 ) ( not ( = ?auto_1723390 ?auto_1723392 ) ) ( AVAILABLE ?auto_1723392 ) ( SURFACE-AT ?auto_1723387 ?auto_1723388 ) ( ON ?auto_1723387 ?auto_1723393 ) ( CLEAR ?auto_1723387 ) ( not ( = ?auto_1723386 ?auto_1723393 ) ) ( not ( = ?auto_1723387 ?auto_1723393 ) ) ( not ( = ?auto_1723385 ?auto_1723393 ) ) ( TRUCK-AT ?auto_1723391 ?auto_1723389 ) ( ON ?auto_1723378 ?auto_1723377 ) ( ON ?auto_1723379 ?auto_1723378 ) ( ON ?auto_1723380 ?auto_1723379 ) ( ON ?auto_1723381 ?auto_1723380 ) ( ON ?auto_1723382 ?auto_1723381 ) ( ON ?auto_1723383 ?auto_1723382 ) ( ON ?auto_1723384 ?auto_1723383 ) ( ON ?auto_1723385 ?auto_1723384 ) ( not ( = ?auto_1723377 ?auto_1723378 ) ) ( not ( = ?auto_1723377 ?auto_1723379 ) ) ( not ( = ?auto_1723377 ?auto_1723380 ) ) ( not ( = ?auto_1723377 ?auto_1723381 ) ) ( not ( = ?auto_1723377 ?auto_1723382 ) ) ( not ( = ?auto_1723377 ?auto_1723383 ) ) ( not ( = ?auto_1723377 ?auto_1723384 ) ) ( not ( = ?auto_1723377 ?auto_1723385 ) ) ( not ( = ?auto_1723377 ?auto_1723386 ) ) ( not ( = ?auto_1723377 ?auto_1723387 ) ) ( not ( = ?auto_1723377 ?auto_1723393 ) ) ( not ( = ?auto_1723378 ?auto_1723379 ) ) ( not ( = ?auto_1723378 ?auto_1723380 ) ) ( not ( = ?auto_1723378 ?auto_1723381 ) ) ( not ( = ?auto_1723378 ?auto_1723382 ) ) ( not ( = ?auto_1723378 ?auto_1723383 ) ) ( not ( = ?auto_1723378 ?auto_1723384 ) ) ( not ( = ?auto_1723378 ?auto_1723385 ) ) ( not ( = ?auto_1723378 ?auto_1723386 ) ) ( not ( = ?auto_1723378 ?auto_1723387 ) ) ( not ( = ?auto_1723378 ?auto_1723393 ) ) ( not ( = ?auto_1723379 ?auto_1723380 ) ) ( not ( = ?auto_1723379 ?auto_1723381 ) ) ( not ( = ?auto_1723379 ?auto_1723382 ) ) ( not ( = ?auto_1723379 ?auto_1723383 ) ) ( not ( = ?auto_1723379 ?auto_1723384 ) ) ( not ( = ?auto_1723379 ?auto_1723385 ) ) ( not ( = ?auto_1723379 ?auto_1723386 ) ) ( not ( = ?auto_1723379 ?auto_1723387 ) ) ( not ( = ?auto_1723379 ?auto_1723393 ) ) ( not ( = ?auto_1723380 ?auto_1723381 ) ) ( not ( = ?auto_1723380 ?auto_1723382 ) ) ( not ( = ?auto_1723380 ?auto_1723383 ) ) ( not ( = ?auto_1723380 ?auto_1723384 ) ) ( not ( = ?auto_1723380 ?auto_1723385 ) ) ( not ( = ?auto_1723380 ?auto_1723386 ) ) ( not ( = ?auto_1723380 ?auto_1723387 ) ) ( not ( = ?auto_1723380 ?auto_1723393 ) ) ( not ( = ?auto_1723381 ?auto_1723382 ) ) ( not ( = ?auto_1723381 ?auto_1723383 ) ) ( not ( = ?auto_1723381 ?auto_1723384 ) ) ( not ( = ?auto_1723381 ?auto_1723385 ) ) ( not ( = ?auto_1723381 ?auto_1723386 ) ) ( not ( = ?auto_1723381 ?auto_1723387 ) ) ( not ( = ?auto_1723381 ?auto_1723393 ) ) ( not ( = ?auto_1723382 ?auto_1723383 ) ) ( not ( = ?auto_1723382 ?auto_1723384 ) ) ( not ( = ?auto_1723382 ?auto_1723385 ) ) ( not ( = ?auto_1723382 ?auto_1723386 ) ) ( not ( = ?auto_1723382 ?auto_1723387 ) ) ( not ( = ?auto_1723382 ?auto_1723393 ) ) ( not ( = ?auto_1723383 ?auto_1723384 ) ) ( not ( = ?auto_1723383 ?auto_1723385 ) ) ( not ( = ?auto_1723383 ?auto_1723386 ) ) ( not ( = ?auto_1723383 ?auto_1723387 ) ) ( not ( = ?auto_1723383 ?auto_1723393 ) ) ( not ( = ?auto_1723384 ?auto_1723385 ) ) ( not ( = ?auto_1723384 ?auto_1723386 ) ) ( not ( = ?auto_1723384 ?auto_1723387 ) ) ( not ( = ?auto_1723384 ?auto_1723393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723385 ?auto_1723386 ?auto_1723387 )
      ( MAKE-10CRATE-VERIFY ?auto_1723377 ?auto_1723378 ?auto_1723379 ?auto_1723380 ?auto_1723381 ?auto_1723382 ?auto_1723383 ?auto_1723384 ?auto_1723385 ?auto_1723386 ?auto_1723387 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723503 - SURFACE
      ?auto_1723504 - SURFACE
      ?auto_1723505 - SURFACE
      ?auto_1723506 - SURFACE
      ?auto_1723507 - SURFACE
      ?auto_1723508 - SURFACE
      ?auto_1723509 - SURFACE
      ?auto_1723510 - SURFACE
      ?auto_1723511 - SURFACE
      ?auto_1723512 - SURFACE
      ?auto_1723513 - SURFACE
    )
    :vars
    (
      ?auto_1723517 - HOIST
      ?auto_1723519 - PLACE
      ?auto_1723518 - PLACE
      ?auto_1723515 - HOIST
      ?auto_1723514 - SURFACE
      ?auto_1723516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723517 ?auto_1723519 ) ( IS-CRATE ?auto_1723513 ) ( not ( = ?auto_1723512 ?auto_1723513 ) ) ( not ( = ?auto_1723511 ?auto_1723512 ) ) ( not ( = ?auto_1723511 ?auto_1723513 ) ) ( not ( = ?auto_1723518 ?auto_1723519 ) ) ( HOIST-AT ?auto_1723515 ?auto_1723518 ) ( not ( = ?auto_1723517 ?auto_1723515 ) ) ( AVAILABLE ?auto_1723515 ) ( SURFACE-AT ?auto_1723513 ?auto_1723518 ) ( ON ?auto_1723513 ?auto_1723514 ) ( CLEAR ?auto_1723513 ) ( not ( = ?auto_1723512 ?auto_1723514 ) ) ( not ( = ?auto_1723513 ?auto_1723514 ) ) ( not ( = ?auto_1723511 ?auto_1723514 ) ) ( TRUCK-AT ?auto_1723516 ?auto_1723519 ) ( SURFACE-AT ?auto_1723511 ?auto_1723519 ) ( CLEAR ?auto_1723511 ) ( LIFTING ?auto_1723517 ?auto_1723512 ) ( IS-CRATE ?auto_1723512 ) ( ON ?auto_1723504 ?auto_1723503 ) ( ON ?auto_1723505 ?auto_1723504 ) ( ON ?auto_1723506 ?auto_1723505 ) ( ON ?auto_1723507 ?auto_1723506 ) ( ON ?auto_1723508 ?auto_1723507 ) ( ON ?auto_1723509 ?auto_1723508 ) ( ON ?auto_1723510 ?auto_1723509 ) ( ON ?auto_1723511 ?auto_1723510 ) ( not ( = ?auto_1723503 ?auto_1723504 ) ) ( not ( = ?auto_1723503 ?auto_1723505 ) ) ( not ( = ?auto_1723503 ?auto_1723506 ) ) ( not ( = ?auto_1723503 ?auto_1723507 ) ) ( not ( = ?auto_1723503 ?auto_1723508 ) ) ( not ( = ?auto_1723503 ?auto_1723509 ) ) ( not ( = ?auto_1723503 ?auto_1723510 ) ) ( not ( = ?auto_1723503 ?auto_1723511 ) ) ( not ( = ?auto_1723503 ?auto_1723512 ) ) ( not ( = ?auto_1723503 ?auto_1723513 ) ) ( not ( = ?auto_1723503 ?auto_1723514 ) ) ( not ( = ?auto_1723504 ?auto_1723505 ) ) ( not ( = ?auto_1723504 ?auto_1723506 ) ) ( not ( = ?auto_1723504 ?auto_1723507 ) ) ( not ( = ?auto_1723504 ?auto_1723508 ) ) ( not ( = ?auto_1723504 ?auto_1723509 ) ) ( not ( = ?auto_1723504 ?auto_1723510 ) ) ( not ( = ?auto_1723504 ?auto_1723511 ) ) ( not ( = ?auto_1723504 ?auto_1723512 ) ) ( not ( = ?auto_1723504 ?auto_1723513 ) ) ( not ( = ?auto_1723504 ?auto_1723514 ) ) ( not ( = ?auto_1723505 ?auto_1723506 ) ) ( not ( = ?auto_1723505 ?auto_1723507 ) ) ( not ( = ?auto_1723505 ?auto_1723508 ) ) ( not ( = ?auto_1723505 ?auto_1723509 ) ) ( not ( = ?auto_1723505 ?auto_1723510 ) ) ( not ( = ?auto_1723505 ?auto_1723511 ) ) ( not ( = ?auto_1723505 ?auto_1723512 ) ) ( not ( = ?auto_1723505 ?auto_1723513 ) ) ( not ( = ?auto_1723505 ?auto_1723514 ) ) ( not ( = ?auto_1723506 ?auto_1723507 ) ) ( not ( = ?auto_1723506 ?auto_1723508 ) ) ( not ( = ?auto_1723506 ?auto_1723509 ) ) ( not ( = ?auto_1723506 ?auto_1723510 ) ) ( not ( = ?auto_1723506 ?auto_1723511 ) ) ( not ( = ?auto_1723506 ?auto_1723512 ) ) ( not ( = ?auto_1723506 ?auto_1723513 ) ) ( not ( = ?auto_1723506 ?auto_1723514 ) ) ( not ( = ?auto_1723507 ?auto_1723508 ) ) ( not ( = ?auto_1723507 ?auto_1723509 ) ) ( not ( = ?auto_1723507 ?auto_1723510 ) ) ( not ( = ?auto_1723507 ?auto_1723511 ) ) ( not ( = ?auto_1723507 ?auto_1723512 ) ) ( not ( = ?auto_1723507 ?auto_1723513 ) ) ( not ( = ?auto_1723507 ?auto_1723514 ) ) ( not ( = ?auto_1723508 ?auto_1723509 ) ) ( not ( = ?auto_1723508 ?auto_1723510 ) ) ( not ( = ?auto_1723508 ?auto_1723511 ) ) ( not ( = ?auto_1723508 ?auto_1723512 ) ) ( not ( = ?auto_1723508 ?auto_1723513 ) ) ( not ( = ?auto_1723508 ?auto_1723514 ) ) ( not ( = ?auto_1723509 ?auto_1723510 ) ) ( not ( = ?auto_1723509 ?auto_1723511 ) ) ( not ( = ?auto_1723509 ?auto_1723512 ) ) ( not ( = ?auto_1723509 ?auto_1723513 ) ) ( not ( = ?auto_1723509 ?auto_1723514 ) ) ( not ( = ?auto_1723510 ?auto_1723511 ) ) ( not ( = ?auto_1723510 ?auto_1723512 ) ) ( not ( = ?auto_1723510 ?auto_1723513 ) ) ( not ( = ?auto_1723510 ?auto_1723514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723511 ?auto_1723512 ?auto_1723513 )
      ( MAKE-10CRATE-VERIFY ?auto_1723503 ?auto_1723504 ?auto_1723505 ?auto_1723506 ?auto_1723507 ?auto_1723508 ?auto_1723509 ?auto_1723510 ?auto_1723511 ?auto_1723512 ?auto_1723513 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1723629 - SURFACE
      ?auto_1723630 - SURFACE
      ?auto_1723631 - SURFACE
      ?auto_1723632 - SURFACE
      ?auto_1723633 - SURFACE
      ?auto_1723634 - SURFACE
      ?auto_1723635 - SURFACE
      ?auto_1723636 - SURFACE
      ?auto_1723637 - SURFACE
      ?auto_1723638 - SURFACE
      ?auto_1723639 - SURFACE
    )
    :vars
    (
      ?auto_1723644 - HOIST
      ?auto_1723643 - PLACE
      ?auto_1723645 - PLACE
      ?auto_1723642 - HOIST
      ?auto_1723641 - SURFACE
      ?auto_1723640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1723644 ?auto_1723643 ) ( IS-CRATE ?auto_1723639 ) ( not ( = ?auto_1723638 ?auto_1723639 ) ) ( not ( = ?auto_1723637 ?auto_1723638 ) ) ( not ( = ?auto_1723637 ?auto_1723639 ) ) ( not ( = ?auto_1723645 ?auto_1723643 ) ) ( HOIST-AT ?auto_1723642 ?auto_1723645 ) ( not ( = ?auto_1723644 ?auto_1723642 ) ) ( AVAILABLE ?auto_1723642 ) ( SURFACE-AT ?auto_1723639 ?auto_1723645 ) ( ON ?auto_1723639 ?auto_1723641 ) ( CLEAR ?auto_1723639 ) ( not ( = ?auto_1723638 ?auto_1723641 ) ) ( not ( = ?auto_1723639 ?auto_1723641 ) ) ( not ( = ?auto_1723637 ?auto_1723641 ) ) ( TRUCK-AT ?auto_1723640 ?auto_1723643 ) ( SURFACE-AT ?auto_1723637 ?auto_1723643 ) ( CLEAR ?auto_1723637 ) ( IS-CRATE ?auto_1723638 ) ( AVAILABLE ?auto_1723644 ) ( IN ?auto_1723638 ?auto_1723640 ) ( ON ?auto_1723630 ?auto_1723629 ) ( ON ?auto_1723631 ?auto_1723630 ) ( ON ?auto_1723632 ?auto_1723631 ) ( ON ?auto_1723633 ?auto_1723632 ) ( ON ?auto_1723634 ?auto_1723633 ) ( ON ?auto_1723635 ?auto_1723634 ) ( ON ?auto_1723636 ?auto_1723635 ) ( ON ?auto_1723637 ?auto_1723636 ) ( not ( = ?auto_1723629 ?auto_1723630 ) ) ( not ( = ?auto_1723629 ?auto_1723631 ) ) ( not ( = ?auto_1723629 ?auto_1723632 ) ) ( not ( = ?auto_1723629 ?auto_1723633 ) ) ( not ( = ?auto_1723629 ?auto_1723634 ) ) ( not ( = ?auto_1723629 ?auto_1723635 ) ) ( not ( = ?auto_1723629 ?auto_1723636 ) ) ( not ( = ?auto_1723629 ?auto_1723637 ) ) ( not ( = ?auto_1723629 ?auto_1723638 ) ) ( not ( = ?auto_1723629 ?auto_1723639 ) ) ( not ( = ?auto_1723629 ?auto_1723641 ) ) ( not ( = ?auto_1723630 ?auto_1723631 ) ) ( not ( = ?auto_1723630 ?auto_1723632 ) ) ( not ( = ?auto_1723630 ?auto_1723633 ) ) ( not ( = ?auto_1723630 ?auto_1723634 ) ) ( not ( = ?auto_1723630 ?auto_1723635 ) ) ( not ( = ?auto_1723630 ?auto_1723636 ) ) ( not ( = ?auto_1723630 ?auto_1723637 ) ) ( not ( = ?auto_1723630 ?auto_1723638 ) ) ( not ( = ?auto_1723630 ?auto_1723639 ) ) ( not ( = ?auto_1723630 ?auto_1723641 ) ) ( not ( = ?auto_1723631 ?auto_1723632 ) ) ( not ( = ?auto_1723631 ?auto_1723633 ) ) ( not ( = ?auto_1723631 ?auto_1723634 ) ) ( not ( = ?auto_1723631 ?auto_1723635 ) ) ( not ( = ?auto_1723631 ?auto_1723636 ) ) ( not ( = ?auto_1723631 ?auto_1723637 ) ) ( not ( = ?auto_1723631 ?auto_1723638 ) ) ( not ( = ?auto_1723631 ?auto_1723639 ) ) ( not ( = ?auto_1723631 ?auto_1723641 ) ) ( not ( = ?auto_1723632 ?auto_1723633 ) ) ( not ( = ?auto_1723632 ?auto_1723634 ) ) ( not ( = ?auto_1723632 ?auto_1723635 ) ) ( not ( = ?auto_1723632 ?auto_1723636 ) ) ( not ( = ?auto_1723632 ?auto_1723637 ) ) ( not ( = ?auto_1723632 ?auto_1723638 ) ) ( not ( = ?auto_1723632 ?auto_1723639 ) ) ( not ( = ?auto_1723632 ?auto_1723641 ) ) ( not ( = ?auto_1723633 ?auto_1723634 ) ) ( not ( = ?auto_1723633 ?auto_1723635 ) ) ( not ( = ?auto_1723633 ?auto_1723636 ) ) ( not ( = ?auto_1723633 ?auto_1723637 ) ) ( not ( = ?auto_1723633 ?auto_1723638 ) ) ( not ( = ?auto_1723633 ?auto_1723639 ) ) ( not ( = ?auto_1723633 ?auto_1723641 ) ) ( not ( = ?auto_1723634 ?auto_1723635 ) ) ( not ( = ?auto_1723634 ?auto_1723636 ) ) ( not ( = ?auto_1723634 ?auto_1723637 ) ) ( not ( = ?auto_1723634 ?auto_1723638 ) ) ( not ( = ?auto_1723634 ?auto_1723639 ) ) ( not ( = ?auto_1723634 ?auto_1723641 ) ) ( not ( = ?auto_1723635 ?auto_1723636 ) ) ( not ( = ?auto_1723635 ?auto_1723637 ) ) ( not ( = ?auto_1723635 ?auto_1723638 ) ) ( not ( = ?auto_1723635 ?auto_1723639 ) ) ( not ( = ?auto_1723635 ?auto_1723641 ) ) ( not ( = ?auto_1723636 ?auto_1723637 ) ) ( not ( = ?auto_1723636 ?auto_1723638 ) ) ( not ( = ?auto_1723636 ?auto_1723639 ) ) ( not ( = ?auto_1723636 ?auto_1723641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1723637 ?auto_1723638 ?auto_1723639 )
      ( MAKE-10CRATE-VERIFY ?auto_1723629 ?auto_1723630 ?auto_1723631 ?auto_1723632 ?auto_1723633 ?auto_1723634 ?auto_1723635 ?auto_1723636 ?auto_1723637 ?auto_1723638 ?auto_1723639 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730873 - SURFACE
      ?auto_1730874 - SURFACE
      ?auto_1730875 - SURFACE
      ?auto_1730876 - SURFACE
      ?auto_1730877 - SURFACE
      ?auto_1730878 - SURFACE
      ?auto_1730879 - SURFACE
      ?auto_1730880 - SURFACE
      ?auto_1730881 - SURFACE
      ?auto_1730882 - SURFACE
      ?auto_1730883 - SURFACE
      ?auto_1730884 - SURFACE
    )
    :vars
    (
      ?auto_1730885 - HOIST
      ?auto_1730886 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730885 ?auto_1730886 ) ( SURFACE-AT ?auto_1730883 ?auto_1730886 ) ( CLEAR ?auto_1730883 ) ( LIFTING ?auto_1730885 ?auto_1730884 ) ( IS-CRATE ?auto_1730884 ) ( not ( = ?auto_1730883 ?auto_1730884 ) ) ( ON ?auto_1730874 ?auto_1730873 ) ( ON ?auto_1730875 ?auto_1730874 ) ( ON ?auto_1730876 ?auto_1730875 ) ( ON ?auto_1730877 ?auto_1730876 ) ( ON ?auto_1730878 ?auto_1730877 ) ( ON ?auto_1730879 ?auto_1730878 ) ( ON ?auto_1730880 ?auto_1730879 ) ( ON ?auto_1730881 ?auto_1730880 ) ( ON ?auto_1730882 ?auto_1730881 ) ( ON ?auto_1730883 ?auto_1730882 ) ( not ( = ?auto_1730873 ?auto_1730874 ) ) ( not ( = ?auto_1730873 ?auto_1730875 ) ) ( not ( = ?auto_1730873 ?auto_1730876 ) ) ( not ( = ?auto_1730873 ?auto_1730877 ) ) ( not ( = ?auto_1730873 ?auto_1730878 ) ) ( not ( = ?auto_1730873 ?auto_1730879 ) ) ( not ( = ?auto_1730873 ?auto_1730880 ) ) ( not ( = ?auto_1730873 ?auto_1730881 ) ) ( not ( = ?auto_1730873 ?auto_1730882 ) ) ( not ( = ?auto_1730873 ?auto_1730883 ) ) ( not ( = ?auto_1730873 ?auto_1730884 ) ) ( not ( = ?auto_1730874 ?auto_1730875 ) ) ( not ( = ?auto_1730874 ?auto_1730876 ) ) ( not ( = ?auto_1730874 ?auto_1730877 ) ) ( not ( = ?auto_1730874 ?auto_1730878 ) ) ( not ( = ?auto_1730874 ?auto_1730879 ) ) ( not ( = ?auto_1730874 ?auto_1730880 ) ) ( not ( = ?auto_1730874 ?auto_1730881 ) ) ( not ( = ?auto_1730874 ?auto_1730882 ) ) ( not ( = ?auto_1730874 ?auto_1730883 ) ) ( not ( = ?auto_1730874 ?auto_1730884 ) ) ( not ( = ?auto_1730875 ?auto_1730876 ) ) ( not ( = ?auto_1730875 ?auto_1730877 ) ) ( not ( = ?auto_1730875 ?auto_1730878 ) ) ( not ( = ?auto_1730875 ?auto_1730879 ) ) ( not ( = ?auto_1730875 ?auto_1730880 ) ) ( not ( = ?auto_1730875 ?auto_1730881 ) ) ( not ( = ?auto_1730875 ?auto_1730882 ) ) ( not ( = ?auto_1730875 ?auto_1730883 ) ) ( not ( = ?auto_1730875 ?auto_1730884 ) ) ( not ( = ?auto_1730876 ?auto_1730877 ) ) ( not ( = ?auto_1730876 ?auto_1730878 ) ) ( not ( = ?auto_1730876 ?auto_1730879 ) ) ( not ( = ?auto_1730876 ?auto_1730880 ) ) ( not ( = ?auto_1730876 ?auto_1730881 ) ) ( not ( = ?auto_1730876 ?auto_1730882 ) ) ( not ( = ?auto_1730876 ?auto_1730883 ) ) ( not ( = ?auto_1730876 ?auto_1730884 ) ) ( not ( = ?auto_1730877 ?auto_1730878 ) ) ( not ( = ?auto_1730877 ?auto_1730879 ) ) ( not ( = ?auto_1730877 ?auto_1730880 ) ) ( not ( = ?auto_1730877 ?auto_1730881 ) ) ( not ( = ?auto_1730877 ?auto_1730882 ) ) ( not ( = ?auto_1730877 ?auto_1730883 ) ) ( not ( = ?auto_1730877 ?auto_1730884 ) ) ( not ( = ?auto_1730878 ?auto_1730879 ) ) ( not ( = ?auto_1730878 ?auto_1730880 ) ) ( not ( = ?auto_1730878 ?auto_1730881 ) ) ( not ( = ?auto_1730878 ?auto_1730882 ) ) ( not ( = ?auto_1730878 ?auto_1730883 ) ) ( not ( = ?auto_1730878 ?auto_1730884 ) ) ( not ( = ?auto_1730879 ?auto_1730880 ) ) ( not ( = ?auto_1730879 ?auto_1730881 ) ) ( not ( = ?auto_1730879 ?auto_1730882 ) ) ( not ( = ?auto_1730879 ?auto_1730883 ) ) ( not ( = ?auto_1730879 ?auto_1730884 ) ) ( not ( = ?auto_1730880 ?auto_1730881 ) ) ( not ( = ?auto_1730880 ?auto_1730882 ) ) ( not ( = ?auto_1730880 ?auto_1730883 ) ) ( not ( = ?auto_1730880 ?auto_1730884 ) ) ( not ( = ?auto_1730881 ?auto_1730882 ) ) ( not ( = ?auto_1730881 ?auto_1730883 ) ) ( not ( = ?auto_1730881 ?auto_1730884 ) ) ( not ( = ?auto_1730882 ?auto_1730883 ) ) ( not ( = ?auto_1730882 ?auto_1730884 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1730883 ?auto_1730884 )
      ( MAKE-11CRATE-VERIFY ?auto_1730873 ?auto_1730874 ?auto_1730875 ?auto_1730876 ?auto_1730877 ?auto_1730878 ?auto_1730879 ?auto_1730880 ?auto_1730881 ?auto_1730882 ?auto_1730883 ?auto_1730884 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1730982 - SURFACE
      ?auto_1730983 - SURFACE
      ?auto_1730984 - SURFACE
      ?auto_1730985 - SURFACE
      ?auto_1730986 - SURFACE
      ?auto_1730987 - SURFACE
      ?auto_1730988 - SURFACE
      ?auto_1730989 - SURFACE
      ?auto_1730990 - SURFACE
      ?auto_1730991 - SURFACE
      ?auto_1730992 - SURFACE
      ?auto_1730993 - SURFACE
    )
    :vars
    (
      ?auto_1730994 - HOIST
      ?auto_1730996 - PLACE
      ?auto_1730995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1730994 ?auto_1730996 ) ( SURFACE-AT ?auto_1730992 ?auto_1730996 ) ( CLEAR ?auto_1730992 ) ( IS-CRATE ?auto_1730993 ) ( not ( = ?auto_1730992 ?auto_1730993 ) ) ( TRUCK-AT ?auto_1730995 ?auto_1730996 ) ( AVAILABLE ?auto_1730994 ) ( IN ?auto_1730993 ?auto_1730995 ) ( ON ?auto_1730992 ?auto_1730991 ) ( not ( = ?auto_1730991 ?auto_1730992 ) ) ( not ( = ?auto_1730991 ?auto_1730993 ) ) ( ON ?auto_1730983 ?auto_1730982 ) ( ON ?auto_1730984 ?auto_1730983 ) ( ON ?auto_1730985 ?auto_1730984 ) ( ON ?auto_1730986 ?auto_1730985 ) ( ON ?auto_1730987 ?auto_1730986 ) ( ON ?auto_1730988 ?auto_1730987 ) ( ON ?auto_1730989 ?auto_1730988 ) ( ON ?auto_1730990 ?auto_1730989 ) ( ON ?auto_1730991 ?auto_1730990 ) ( not ( = ?auto_1730982 ?auto_1730983 ) ) ( not ( = ?auto_1730982 ?auto_1730984 ) ) ( not ( = ?auto_1730982 ?auto_1730985 ) ) ( not ( = ?auto_1730982 ?auto_1730986 ) ) ( not ( = ?auto_1730982 ?auto_1730987 ) ) ( not ( = ?auto_1730982 ?auto_1730988 ) ) ( not ( = ?auto_1730982 ?auto_1730989 ) ) ( not ( = ?auto_1730982 ?auto_1730990 ) ) ( not ( = ?auto_1730982 ?auto_1730991 ) ) ( not ( = ?auto_1730982 ?auto_1730992 ) ) ( not ( = ?auto_1730982 ?auto_1730993 ) ) ( not ( = ?auto_1730983 ?auto_1730984 ) ) ( not ( = ?auto_1730983 ?auto_1730985 ) ) ( not ( = ?auto_1730983 ?auto_1730986 ) ) ( not ( = ?auto_1730983 ?auto_1730987 ) ) ( not ( = ?auto_1730983 ?auto_1730988 ) ) ( not ( = ?auto_1730983 ?auto_1730989 ) ) ( not ( = ?auto_1730983 ?auto_1730990 ) ) ( not ( = ?auto_1730983 ?auto_1730991 ) ) ( not ( = ?auto_1730983 ?auto_1730992 ) ) ( not ( = ?auto_1730983 ?auto_1730993 ) ) ( not ( = ?auto_1730984 ?auto_1730985 ) ) ( not ( = ?auto_1730984 ?auto_1730986 ) ) ( not ( = ?auto_1730984 ?auto_1730987 ) ) ( not ( = ?auto_1730984 ?auto_1730988 ) ) ( not ( = ?auto_1730984 ?auto_1730989 ) ) ( not ( = ?auto_1730984 ?auto_1730990 ) ) ( not ( = ?auto_1730984 ?auto_1730991 ) ) ( not ( = ?auto_1730984 ?auto_1730992 ) ) ( not ( = ?auto_1730984 ?auto_1730993 ) ) ( not ( = ?auto_1730985 ?auto_1730986 ) ) ( not ( = ?auto_1730985 ?auto_1730987 ) ) ( not ( = ?auto_1730985 ?auto_1730988 ) ) ( not ( = ?auto_1730985 ?auto_1730989 ) ) ( not ( = ?auto_1730985 ?auto_1730990 ) ) ( not ( = ?auto_1730985 ?auto_1730991 ) ) ( not ( = ?auto_1730985 ?auto_1730992 ) ) ( not ( = ?auto_1730985 ?auto_1730993 ) ) ( not ( = ?auto_1730986 ?auto_1730987 ) ) ( not ( = ?auto_1730986 ?auto_1730988 ) ) ( not ( = ?auto_1730986 ?auto_1730989 ) ) ( not ( = ?auto_1730986 ?auto_1730990 ) ) ( not ( = ?auto_1730986 ?auto_1730991 ) ) ( not ( = ?auto_1730986 ?auto_1730992 ) ) ( not ( = ?auto_1730986 ?auto_1730993 ) ) ( not ( = ?auto_1730987 ?auto_1730988 ) ) ( not ( = ?auto_1730987 ?auto_1730989 ) ) ( not ( = ?auto_1730987 ?auto_1730990 ) ) ( not ( = ?auto_1730987 ?auto_1730991 ) ) ( not ( = ?auto_1730987 ?auto_1730992 ) ) ( not ( = ?auto_1730987 ?auto_1730993 ) ) ( not ( = ?auto_1730988 ?auto_1730989 ) ) ( not ( = ?auto_1730988 ?auto_1730990 ) ) ( not ( = ?auto_1730988 ?auto_1730991 ) ) ( not ( = ?auto_1730988 ?auto_1730992 ) ) ( not ( = ?auto_1730988 ?auto_1730993 ) ) ( not ( = ?auto_1730989 ?auto_1730990 ) ) ( not ( = ?auto_1730989 ?auto_1730991 ) ) ( not ( = ?auto_1730989 ?auto_1730992 ) ) ( not ( = ?auto_1730989 ?auto_1730993 ) ) ( not ( = ?auto_1730990 ?auto_1730991 ) ) ( not ( = ?auto_1730990 ?auto_1730992 ) ) ( not ( = ?auto_1730990 ?auto_1730993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1730991 ?auto_1730992 ?auto_1730993 )
      ( MAKE-11CRATE-VERIFY ?auto_1730982 ?auto_1730983 ?auto_1730984 ?auto_1730985 ?auto_1730986 ?auto_1730987 ?auto_1730988 ?auto_1730989 ?auto_1730990 ?auto_1730991 ?auto_1730992 ?auto_1730993 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731103 - SURFACE
      ?auto_1731104 - SURFACE
      ?auto_1731105 - SURFACE
      ?auto_1731106 - SURFACE
      ?auto_1731107 - SURFACE
      ?auto_1731108 - SURFACE
      ?auto_1731109 - SURFACE
      ?auto_1731110 - SURFACE
      ?auto_1731111 - SURFACE
      ?auto_1731112 - SURFACE
      ?auto_1731113 - SURFACE
      ?auto_1731114 - SURFACE
    )
    :vars
    (
      ?auto_1731116 - HOIST
      ?auto_1731118 - PLACE
      ?auto_1731115 - TRUCK
      ?auto_1731117 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731116 ?auto_1731118 ) ( SURFACE-AT ?auto_1731113 ?auto_1731118 ) ( CLEAR ?auto_1731113 ) ( IS-CRATE ?auto_1731114 ) ( not ( = ?auto_1731113 ?auto_1731114 ) ) ( AVAILABLE ?auto_1731116 ) ( IN ?auto_1731114 ?auto_1731115 ) ( ON ?auto_1731113 ?auto_1731112 ) ( not ( = ?auto_1731112 ?auto_1731113 ) ) ( not ( = ?auto_1731112 ?auto_1731114 ) ) ( TRUCK-AT ?auto_1731115 ?auto_1731117 ) ( not ( = ?auto_1731117 ?auto_1731118 ) ) ( ON ?auto_1731104 ?auto_1731103 ) ( ON ?auto_1731105 ?auto_1731104 ) ( ON ?auto_1731106 ?auto_1731105 ) ( ON ?auto_1731107 ?auto_1731106 ) ( ON ?auto_1731108 ?auto_1731107 ) ( ON ?auto_1731109 ?auto_1731108 ) ( ON ?auto_1731110 ?auto_1731109 ) ( ON ?auto_1731111 ?auto_1731110 ) ( ON ?auto_1731112 ?auto_1731111 ) ( not ( = ?auto_1731103 ?auto_1731104 ) ) ( not ( = ?auto_1731103 ?auto_1731105 ) ) ( not ( = ?auto_1731103 ?auto_1731106 ) ) ( not ( = ?auto_1731103 ?auto_1731107 ) ) ( not ( = ?auto_1731103 ?auto_1731108 ) ) ( not ( = ?auto_1731103 ?auto_1731109 ) ) ( not ( = ?auto_1731103 ?auto_1731110 ) ) ( not ( = ?auto_1731103 ?auto_1731111 ) ) ( not ( = ?auto_1731103 ?auto_1731112 ) ) ( not ( = ?auto_1731103 ?auto_1731113 ) ) ( not ( = ?auto_1731103 ?auto_1731114 ) ) ( not ( = ?auto_1731104 ?auto_1731105 ) ) ( not ( = ?auto_1731104 ?auto_1731106 ) ) ( not ( = ?auto_1731104 ?auto_1731107 ) ) ( not ( = ?auto_1731104 ?auto_1731108 ) ) ( not ( = ?auto_1731104 ?auto_1731109 ) ) ( not ( = ?auto_1731104 ?auto_1731110 ) ) ( not ( = ?auto_1731104 ?auto_1731111 ) ) ( not ( = ?auto_1731104 ?auto_1731112 ) ) ( not ( = ?auto_1731104 ?auto_1731113 ) ) ( not ( = ?auto_1731104 ?auto_1731114 ) ) ( not ( = ?auto_1731105 ?auto_1731106 ) ) ( not ( = ?auto_1731105 ?auto_1731107 ) ) ( not ( = ?auto_1731105 ?auto_1731108 ) ) ( not ( = ?auto_1731105 ?auto_1731109 ) ) ( not ( = ?auto_1731105 ?auto_1731110 ) ) ( not ( = ?auto_1731105 ?auto_1731111 ) ) ( not ( = ?auto_1731105 ?auto_1731112 ) ) ( not ( = ?auto_1731105 ?auto_1731113 ) ) ( not ( = ?auto_1731105 ?auto_1731114 ) ) ( not ( = ?auto_1731106 ?auto_1731107 ) ) ( not ( = ?auto_1731106 ?auto_1731108 ) ) ( not ( = ?auto_1731106 ?auto_1731109 ) ) ( not ( = ?auto_1731106 ?auto_1731110 ) ) ( not ( = ?auto_1731106 ?auto_1731111 ) ) ( not ( = ?auto_1731106 ?auto_1731112 ) ) ( not ( = ?auto_1731106 ?auto_1731113 ) ) ( not ( = ?auto_1731106 ?auto_1731114 ) ) ( not ( = ?auto_1731107 ?auto_1731108 ) ) ( not ( = ?auto_1731107 ?auto_1731109 ) ) ( not ( = ?auto_1731107 ?auto_1731110 ) ) ( not ( = ?auto_1731107 ?auto_1731111 ) ) ( not ( = ?auto_1731107 ?auto_1731112 ) ) ( not ( = ?auto_1731107 ?auto_1731113 ) ) ( not ( = ?auto_1731107 ?auto_1731114 ) ) ( not ( = ?auto_1731108 ?auto_1731109 ) ) ( not ( = ?auto_1731108 ?auto_1731110 ) ) ( not ( = ?auto_1731108 ?auto_1731111 ) ) ( not ( = ?auto_1731108 ?auto_1731112 ) ) ( not ( = ?auto_1731108 ?auto_1731113 ) ) ( not ( = ?auto_1731108 ?auto_1731114 ) ) ( not ( = ?auto_1731109 ?auto_1731110 ) ) ( not ( = ?auto_1731109 ?auto_1731111 ) ) ( not ( = ?auto_1731109 ?auto_1731112 ) ) ( not ( = ?auto_1731109 ?auto_1731113 ) ) ( not ( = ?auto_1731109 ?auto_1731114 ) ) ( not ( = ?auto_1731110 ?auto_1731111 ) ) ( not ( = ?auto_1731110 ?auto_1731112 ) ) ( not ( = ?auto_1731110 ?auto_1731113 ) ) ( not ( = ?auto_1731110 ?auto_1731114 ) ) ( not ( = ?auto_1731111 ?auto_1731112 ) ) ( not ( = ?auto_1731111 ?auto_1731113 ) ) ( not ( = ?auto_1731111 ?auto_1731114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731112 ?auto_1731113 ?auto_1731114 )
      ( MAKE-11CRATE-VERIFY ?auto_1731103 ?auto_1731104 ?auto_1731105 ?auto_1731106 ?auto_1731107 ?auto_1731108 ?auto_1731109 ?auto_1731110 ?auto_1731111 ?auto_1731112 ?auto_1731113 ?auto_1731114 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731235 - SURFACE
      ?auto_1731236 - SURFACE
      ?auto_1731237 - SURFACE
      ?auto_1731238 - SURFACE
      ?auto_1731239 - SURFACE
      ?auto_1731240 - SURFACE
      ?auto_1731241 - SURFACE
      ?auto_1731242 - SURFACE
      ?auto_1731243 - SURFACE
      ?auto_1731244 - SURFACE
      ?auto_1731245 - SURFACE
      ?auto_1731246 - SURFACE
    )
    :vars
    (
      ?auto_1731250 - HOIST
      ?auto_1731251 - PLACE
      ?auto_1731247 - TRUCK
      ?auto_1731248 - PLACE
      ?auto_1731249 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731250 ?auto_1731251 ) ( SURFACE-AT ?auto_1731245 ?auto_1731251 ) ( CLEAR ?auto_1731245 ) ( IS-CRATE ?auto_1731246 ) ( not ( = ?auto_1731245 ?auto_1731246 ) ) ( AVAILABLE ?auto_1731250 ) ( ON ?auto_1731245 ?auto_1731244 ) ( not ( = ?auto_1731244 ?auto_1731245 ) ) ( not ( = ?auto_1731244 ?auto_1731246 ) ) ( TRUCK-AT ?auto_1731247 ?auto_1731248 ) ( not ( = ?auto_1731248 ?auto_1731251 ) ) ( HOIST-AT ?auto_1731249 ?auto_1731248 ) ( LIFTING ?auto_1731249 ?auto_1731246 ) ( not ( = ?auto_1731250 ?auto_1731249 ) ) ( ON ?auto_1731236 ?auto_1731235 ) ( ON ?auto_1731237 ?auto_1731236 ) ( ON ?auto_1731238 ?auto_1731237 ) ( ON ?auto_1731239 ?auto_1731238 ) ( ON ?auto_1731240 ?auto_1731239 ) ( ON ?auto_1731241 ?auto_1731240 ) ( ON ?auto_1731242 ?auto_1731241 ) ( ON ?auto_1731243 ?auto_1731242 ) ( ON ?auto_1731244 ?auto_1731243 ) ( not ( = ?auto_1731235 ?auto_1731236 ) ) ( not ( = ?auto_1731235 ?auto_1731237 ) ) ( not ( = ?auto_1731235 ?auto_1731238 ) ) ( not ( = ?auto_1731235 ?auto_1731239 ) ) ( not ( = ?auto_1731235 ?auto_1731240 ) ) ( not ( = ?auto_1731235 ?auto_1731241 ) ) ( not ( = ?auto_1731235 ?auto_1731242 ) ) ( not ( = ?auto_1731235 ?auto_1731243 ) ) ( not ( = ?auto_1731235 ?auto_1731244 ) ) ( not ( = ?auto_1731235 ?auto_1731245 ) ) ( not ( = ?auto_1731235 ?auto_1731246 ) ) ( not ( = ?auto_1731236 ?auto_1731237 ) ) ( not ( = ?auto_1731236 ?auto_1731238 ) ) ( not ( = ?auto_1731236 ?auto_1731239 ) ) ( not ( = ?auto_1731236 ?auto_1731240 ) ) ( not ( = ?auto_1731236 ?auto_1731241 ) ) ( not ( = ?auto_1731236 ?auto_1731242 ) ) ( not ( = ?auto_1731236 ?auto_1731243 ) ) ( not ( = ?auto_1731236 ?auto_1731244 ) ) ( not ( = ?auto_1731236 ?auto_1731245 ) ) ( not ( = ?auto_1731236 ?auto_1731246 ) ) ( not ( = ?auto_1731237 ?auto_1731238 ) ) ( not ( = ?auto_1731237 ?auto_1731239 ) ) ( not ( = ?auto_1731237 ?auto_1731240 ) ) ( not ( = ?auto_1731237 ?auto_1731241 ) ) ( not ( = ?auto_1731237 ?auto_1731242 ) ) ( not ( = ?auto_1731237 ?auto_1731243 ) ) ( not ( = ?auto_1731237 ?auto_1731244 ) ) ( not ( = ?auto_1731237 ?auto_1731245 ) ) ( not ( = ?auto_1731237 ?auto_1731246 ) ) ( not ( = ?auto_1731238 ?auto_1731239 ) ) ( not ( = ?auto_1731238 ?auto_1731240 ) ) ( not ( = ?auto_1731238 ?auto_1731241 ) ) ( not ( = ?auto_1731238 ?auto_1731242 ) ) ( not ( = ?auto_1731238 ?auto_1731243 ) ) ( not ( = ?auto_1731238 ?auto_1731244 ) ) ( not ( = ?auto_1731238 ?auto_1731245 ) ) ( not ( = ?auto_1731238 ?auto_1731246 ) ) ( not ( = ?auto_1731239 ?auto_1731240 ) ) ( not ( = ?auto_1731239 ?auto_1731241 ) ) ( not ( = ?auto_1731239 ?auto_1731242 ) ) ( not ( = ?auto_1731239 ?auto_1731243 ) ) ( not ( = ?auto_1731239 ?auto_1731244 ) ) ( not ( = ?auto_1731239 ?auto_1731245 ) ) ( not ( = ?auto_1731239 ?auto_1731246 ) ) ( not ( = ?auto_1731240 ?auto_1731241 ) ) ( not ( = ?auto_1731240 ?auto_1731242 ) ) ( not ( = ?auto_1731240 ?auto_1731243 ) ) ( not ( = ?auto_1731240 ?auto_1731244 ) ) ( not ( = ?auto_1731240 ?auto_1731245 ) ) ( not ( = ?auto_1731240 ?auto_1731246 ) ) ( not ( = ?auto_1731241 ?auto_1731242 ) ) ( not ( = ?auto_1731241 ?auto_1731243 ) ) ( not ( = ?auto_1731241 ?auto_1731244 ) ) ( not ( = ?auto_1731241 ?auto_1731245 ) ) ( not ( = ?auto_1731241 ?auto_1731246 ) ) ( not ( = ?auto_1731242 ?auto_1731243 ) ) ( not ( = ?auto_1731242 ?auto_1731244 ) ) ( not ( = ?auto_1731242 ?auto_1731245 ) ) ( not ( = ?auto_1731242 ?auto_1731246 ) ) ( not ( = ?auto_1731243 ?auto_1731244 ) ) ( not ( = ?auto_1731243 ?auto_1731245 ) ) ( not ( = ?auto_1731243 ?auto_1731246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731244 ?auto_1731245 ?auto_1731246 )
      ( MAKE-11CRATE-VERIFY ?auto_1731235 ?auto_1731236 ?auto_1731237 ?auto_1731238 ?auto_1731239 ?auto_1731240 ?auto_1731241 ?auto_1731242 ?auto_1731243 ?auto_1731244 ?auto_1731245 ?auto_1731246 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731378 - SURFACE
      ?auto_1731379 - SURFACE
      ?auto_1731380 - SURFACE
      ?auto_1731381 - SURFACE
      ?auto_1731382 - SURFACE
      ?auto_1731383 - SURFACE
      ?auto_1731384 - SURFACE
      ?auto_1731385 - SURFACE
      ?auto_1731386 - SURFACE
      ?auto_1731387 - SURFACE
      ?auto_1731388 - SURFACE
      ?auto_1731389 - SURFACE
    )
    :vars
    (
      ?auto_1731395 - HOIST
      ?auto_1731390 - PLACE
      ?auto_1731394 - TRUCK
      ?auto_1731391 - PLACE
      ?auto_1731392 - HOIST
      ?auto_1731393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731395 ?auto_1731390 ) ( SURFACE-AT ?auto_1731388 ?auto_1731390 ) ( CLEAR ?auto_1731388 ) ( IS-CRATE ?auto_1731389 ) ( not ( = ?auto_1731388 ?auto_1731389 ) ) ( AVAILABLE ?auto_1731395 ) ( ON ?auto_1731388 ?auto_1731387 ) ( not ( = ?auto_1731387 ?auto_1731388 ) ) ( not ( = ?auto_1731387 ?auto_1731389 ) ) ( TRUCK-AT ?auto_1731394 ?auto_1731391 ) ( not ( = ?auto_1731391 ?auto_1731390 ) ) ( HOIST-AT ?auto_1731392 ?auto_1731391 ) ( not ( = ?auto_1731395 ?auto_1731392 ) ) ( AVAILABLE ?auto_1731392 ) ( SURFACE-AT ?auto_1731389 ?auto_1731391 ) ( ON ?auto_1731389 ?auto_1731393 ) ( CLEAR ?auto_1731389 ) ( not ( = ?auto_1731388 ?auto_1731393 ) ) ( not ( = ?auto_1731389 ?auto_1731393 ) ) ( not ( = ?auto_1731387 ?auto_1731393 ) ) ( ON ?auto_1731379 ?auto_1731378 ) ( ON ?auto_1731380 ?auto_1731379 ) ( ON ?auto_1731381 ?auto_1731380 ) ( ON ?auto_1731382 ?auto_1731381 ) ( ON ?auto_1731383 ?auto_1731382 ) ( ON ?auto_1731384 ?auto_1731383 ) ( ON ?auto_1731385 ?auto_1731384 ) ( ON ?auto_1731386 ?auto_1731385 ) ( ON ?auto_1731387 ?auto_1731386 ) ( not ( = ?auto_1731378 ?auto_1731379 ) ) ( not ( = ?auto_1731378 ?auto_1731380 ) ) ( not ( = ?auto_1731378 ?auto_1731381 ) ) ( not ( = ?auto_1731378 ?auto_1731382 ) ) ( not ( = ?auto_1731378 ?auto_1731383 ) ) ( not ( = ?auto_1731378 ?auto_1731384 ) ) ( not ( = ?auto_1731378 ?auto_1731385 ) ) ( not ( = ?auto_1731378 ?auto_1731386 ) ) ( not ( = ?auto_1731378 ?auto_1731387 ) ) ( not ( = ?auto_1731378 ?auto_1731388 ) ) ( not ( = ?auto_1731378 ?auto_1731389 ) ) ( not ( = ?auto_1731378 ?auto_1731393 ) ) ( not ( = ?auto_1731379 ?auto_1731380 ) ) ( not ( = ?auto_1731379 ?auto_1731381 ) ) ( not ( = ?auto_1731379 ?auto_1731382 ) ) ( not ( = ?auto_1731379 ?auto_1731383 ) ) ( not ( = ?auto_1731379 ?auto_1731384 ) ) ( not ( = ?auto_1731379 ?auto_1731385 ) ) ( not ( = ?auto_1731379 ?auto_1731386 ) ) ( not ( = ?auto_1731379 ?auto_1731387 ) ) ( not ( = ?auto_1731379 ?auto_1731388 ) ) ( not ( = ?auto_1731379 ?auto_1731389 ) ) ( not ( = ?auto_1731379 ?auto_1731393 ) ) ( not ( = ?auto_1731380 ?auto_1731381 ) ) ( not ( = ?auto_1731380 ?auto_1731382 ) ) ( not ( = ?auto_1731380 ?auto_1731383 ) ) ( not ( = ?auto_1731380 ?auto_1731384 ) ) ( not ( = ?auto_1731380 ?auto_1731385 ) ) ( not ( = ?auto_1731380 ?auto_1731386 ) ) ( not ( = ?auto_1731380 ?auto_1731387 ) ) ( not ( = ?auto_1731380 ?auto_1731388 ) ) ( not ( = ?auto_1731380 ?auto_1731389 ) ) ( not ( = ?auto_1731380 ?auto_1731393 ) ) ( not ( = ?auto_1731381 ?auto_1731382 ) ) ( not ( = ?auto_1731381 ?auto_1731383 ) ) ( not ( = ?auto_1731381 ?auto_1731384 ) ) ( not ( = ?auto_1731381 ?auto_1731385 ) ) ( not ( = ?auto_1731381 ?auto_1731386 ) ) ( not ( = ?auto_1731381 ?auto_1731387 ) ) ( not ( = ?auto_1731381 ?auto_1731388 ) ) ( not ( = ?auto_1731381 ?auto_1731389 ) ) ( not ( = ?auto_1731381 ?auto_1731393 ) ) ( not ( = ?auto_1731382 ?auto_1731383 ) ) ( not ( = ?auto_1731382 ?auto_1731384 ) ) ( not ( = ?auto_1731382 ?auto_1731385 ) ) ( not ( = ?auto_1731382 ?auto_1731386 ) ) ( not ( = ?auto_1731382 ?auto_1731387 ) ) ( not ( = ?auto_1731382 ?auto_1731388 ) ) ( not ( = ?auto_1731382 ?auto_1731389 ) ) ( not ( = ?auto_1731382 ?auto_1731393 ) ) ( not ( = ?auto_1731383 ?auto_1731384 ) ) ( not ( = ?auto_1731383 ?auto_1731385 ) ) ( not ( = ?auto_1731383 ?auto_1731386 ) ) ( not ( = ?auto_1731383 ?auto_1731387 ) ) ( not ( = ?auto_1731383 ?auto_1731388 ) ) ( not ( = ?auto_1731383 ?auto_1731389 ) ) ( not ( = ?auto_1731383 ?auto_1731393 ) ) ( not ( = ?auto_1731384 ?auto_1731385 ) ) ( not ( = ?auto_1731384 ?auto_1731386 ) ) ( not ( = ?auto_1731384 ?auto_1731387 ) ) ( not ( = ?auto_1731384 ?auto_1731388 ) ) ( not ( = ?auto_1731384 ?auto_1731389 ) ) ( not ( = ?auto_1731384 ?auto_1731393 ) ) ( not ( = ?auto_1731385 ?auto_1731386 ) ) ( not ( = ?auto_1731385 ?auto_1731387 ) ) ( not ( = ?auto_1731385 ?auto_1731388 ) ) ( not ( = ?auto_1731385 ?auto_1731389 ) ) ( not ( = ?auto_1731385 ?auto_1731393 ) ) ( not ( = ?auto_1731386 ?auto_1731387 ) ) ( not ( = ?auto_1731386 ?auto_1731388 ) ) ( not ( = ?auto_1731386 ?auto_1731389 ) ) ( not ( = ?auto_1731386 ?auto_1731393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731387 ?auto_1731388 ?auto_1731389 )
      ( MAKE-11CRATE-VERIFY ?auto_1731378 ?auto_1731379 ?auto_1731380 ?auto_1731381 ?auto_1731382 ?auto_1731383 ?auto_1731384 ?auto_1731385 ?auto_1731386 ?auto_1731387 ?auto_1731388 ?auto_1731389 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731522 - SURFACE
      ?auto_1731523 - SURFACE
      ?auto_1731524 - SURFACE
      ?auto_1731525 - SURFACE
      ?auto_1731526 - SURFACE
      ?auto_1731527 - SURFACE
      ?auto_1731528 - SURFACE
      ?auto_1731529 - SURFACE
      ?auto_1731530 - SURFACE
      ?auto_1731531 - SURFACE
      ?auto_1731532 - SURFACE
      ?auto_1731533 - SURFACE
    )
    :vars
    (
      ?auto_1731536 - HOIST
      ?auto_1731535 - PLACE
      ?auto_1731539 - PLACE
      ?auto_1731534 - HOIST
      ?auto_1731538 - SURFACE
      ?auto_1731537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731536 ?auto_1731535 ) ( SURFACE-AT ?auto_1731532 ?auto_1731535 ) ( CLEAR ?auto_1731532 ) ( IS-CRATE ?auto_1731533 ) ( not ( = ?auto_1731532 ?auto_1731533 ) ) ( AVAILABLE ?auto_1731536 ) ( ON ?auto_1731532 ?auto_1731531 ) ( not ( = ?auto_1731531 ?auto_1731532 ) ) ( not ( = ?auto_1731531 ?auto_1731533 ) ) ( not ( = ?auto_1731539 ?auto_1731535 ) ) ( HOIST-AT ?auto_1731534 ?auto_1731539 ) ( not ( = ?auto_1731536 ?auto_1731534 ) ) ( AVAILABLE ?auto_1731534 ) ( SURFACE-AT ?auto_1731533 ?auto_1731539 ) ( ON ?auto_1731533 ?auto_1731538 ) ( CLEAR ?auto_1731533 ) ( not ( = ?auto_1731532 ?auto_1731538 ) ) ( not ( = ?auto_1731533 ?auto_1731538 ) ) ( not ( = ?auto_1731531 ?auto_1731538 ) ) ( TRUCK-AT ?auto_1731537 ?auto_1731535 ) ( ON ?auto_1731523 ?auto_1731522 ) ( ON ?auto_1731524 ?auto_1731523 ) ( ON ?auto_1731525 ?auto_1731524 ) ( ON ?auto_1731526 ?auto_1731525 ) ( ON ?auto_1731527 ?auto_1731526 ) ( ON ?auto_1731528 ?auto_1731527 ) ( ON ?auto_1731529 ?auto_1731528 ) ( ON ?auto_1731530 ?auto_1731529 ) ( ON ?auto_1731531 ?auto_1731530 ) ( not ( = ?auto_1731522 ?auto_1731523 ) ) ( not ( = ?auto_1731522 ?auto_1731524 ) ) ( not ( = ?auto_1731522 ?auto_1731525 ) ) ( not ( = ?auto_1731522 ?auto_1731526 ) ) ( not ( = ?auto_1731522 ?auto_1731527 ) ) ( not ( = ?auto_1731522 ?auto_1731528 ) ) ( not ( = ?auto_1731522 ?auto_1731529 ) ) ( not ( = ?auto_1731522 ?auto_1731530 ) ) ( not ( = ?auto_1731522 ?auto_1731531 ) ) ( not ( = ?auto_1731522 ?auto_1731532 ) ) ( not ( = ?auto_1731522 ?auto_1731533 ) ) ( not ( = ?auto_1731522 ?auto_1731538 ) ) ( not ( = ?auto_1731523 ?auto_1731524 ) ) ( not ( = ?auto_1731523 ?auto_1731525 ) ) ( not ( = ?auto_1731523 ?auto_1731526 ) ) ( not ( = ?auto_1731523 ?auto_1731527 ) ) ( not ( = ?auto_1731523 ?auto_1731528 ) ) ( not ( = ?auto_1731523 ?auto_1731529 ) ) ( not ( = ?auto_1731523 ?auto_1731530 ) ) ( not ( = ?auto_1731523 ?auto_1731531 ) ) ( not ( = ?auto_1731523 ?auto_1731532 ) ) ( not ( = ?auto_1731523 ?auto_1731533 ) ) ( not ( = ?auto_1731523 ?auto_1731538 ) ) ( not ( = ?auto_1731524 ?auto_1731525 ) ) ( not ( = ?auto_1731524 ?auto_1731526 ) ) ( not ( = ?auto_1731524 ?auto_1731527 ) ) ( not ( = ?auto_1731524 ?auto_1731528 ) ) ( not ( = ?auto_1731524 ?auto_1731529 ) ) ( not ( = ?auto_1731524 ?auto_1731530 ) ) ( not ( = ?auto_1731524 ?auto_1731531 ) ) ( not ( = ?auto_1731524 ?auto_1731532 ) ) ( not ( = ?auto_1731524 ?auto_1731533 ) ) ( not ( = ?auto_1731524 ?auto_1731538 ) ) ( not ( = ?auto_1731525 ?auto_1731526 ) ) ( not ( = ?auto_1731525 ?auto_1731527 ) ) ( not ( = ?auto_1731525 ?auto_1731528 ) ) ( not ( = ?auto_1731525 ?auto_1731529 ) ) ( not ( = ?auto_1731525 ?auto_1731530 ) ) ( not ( = ?auto_1731525 ?auto_1731531 ) ) ( not ( = ?auto_1731525 ?auto_1731532 ) ) ( not ( = ?auto_1731525 ?auto_1731533 ) ) ( not ( = ?auto_1731525 ?auto_1731538 ) ) ( not ( = ?auto_1731526 ?auto_1731527 ) ) ( not ( = ?auto_1731526 ?auto_1731528 ) ) ( not ( = ?auto_1731526 ?auto_1731529 ) ) ( not ( = ?auto_1731526 ?auto_1731530 ) ) ( not ( = ?auto_1731526 ?auto_1731531 ) ) ( not ( = ?auto_1731526 ?auto_1731532 ) ) ( not ( = ?auto_1731526 ?auto_1731533 ) ) ( not ( = ?auto_1731526 ?auto_1731538 ) ) ( not ( = ?auto_1731527 ?auto_1731528 ) ) ( not ( = ?auto_1731527 ?auto_1731529 ) ) ( not ( = ?auto_1731527 ?auto_1731530 ) ) ( not ( = ?auto_1731527 ?auto_1731531 ) ) ( not ( = ?auto_1731527 ?auto_1731532 ) ) ( not ( = ?auto_1731527 ?auto_1731533 ) ) ( not ( = ?auto_1731527 ?auto_1731538 ) ) ( not ( = ?auto_1731528 ?auto_1731529 ) ) ( not ( = ?auto_1731528 ?auto_1731530 ) ) ( not ( = ?auto_1731528 ?auto_1731531 ) ) ( not ( = ?auto_1731528 ?auto_1731532 ) ) ( not ( = ?auto_1731528 ?auto_1731533 ) ) ( not ( = ?auto_1731528 ?auto_1731538 ) ) ( not ( = ?auto_1731529 ?auto_1731530 ) ) ( not ( = ?auto_1731529 ?auto_1731531 ) ) ( not ( = ?auto_1731529 ?auto_1731532 ) ) ( not ( = ?auto_1731529 ?auto_1731533 ) ) ( not ( = ?auto_1731529 ?auto_1731538 ) ) ( not ( = ?auto_1731530 ?auto_1731531 ) ) ( not ( = ?auto_1731530 ?auto_1731532 ) ) ( not ( = ?auto_1731530 ?auto_1731533 ) ) ( not ( = ?auto_1731530 ?auto_1731538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731531 ?auto_1731532 ?auto_1731533 )
      ( MAKE-11CRATE-VERIFY ?auto_1731522 ?auto_1731523 ?auto_1731524 ?auto_1731525 ?auto_1731526 ?auto_1731527 ?auto_1731528 ?auto_1731529 ?auto_1731530 ?auto_1731531 ?auto_1731532 ?auto_1731533 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731666 - SURFACE
      ?auto_1731667 - SURFACE
      ?auto_1731668 - SURFACE
      ?auto_1731669 - SURFACE
      ?auto_1731670 - SURFACE
      ?auto_1731671 - SURFACE
      ?auto_1731672 - SURFACE
      ?auto_1731673 - SURFACE
      ?auto_1731674 - SURFACE
      ?auto_1731675 - SURFACE
      ?auto_1731676 - SURFACE
      ?auto_1731677 - SURFACE
    )
    :vars
    (
      ?auto_1731678 - HOIST
      ?auto_1731683 - PLACE
      ?auto_1731682 - PLACE
      ?auto_1731679 - HOIST
      ?auto_1731680 - SURFACE
      ?auto_1731681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731678 ?auto_1731683 ) ( IS-CRATE ?auto_1731677 ) ( not ( = ?auto_1731676 ?auto_1731677 ) ) ( not ( = ?auto_1731675 ?auto_1731676 ) ) ( not ( = ?auto_1731675 ?auto_1731677 ) ) ( not ( = ?auto_1731682 ?auto_1731683 ) ) ( HOIST-AT ?auto_1731679 ?auto_1731682 ) ( not ( = ?auto_1731678 ?auto_1731679 ) ) ( AVAILABLE ?auto_1731679 ) ( SURFACE-AT ?auto_1731677 ?auto_1731682 ) ( ON ?auto_1731677 ?auto_1731680 ) ( CLEAR ?auto_1731677 ) ( not ( = ?auto_1731676 ?auto_1731680 ) ) ( not ( = ?auto_1731677 ?auto_1731680 ) ) ( not ( = ?auto_1731675 ?auto_1731680 ) ) ( TRUCK-AT ?auto_1731681 ?auto_1731683 ) ( SURFACE-AT ?auto_1731675 ?auto_1731683 ) ( CLEAR ?auto_1731675 ) ( LIFTING ?auto_1731678 ?auto_1731676 ) ( IS-CRATE ?auto_1731676 ) ( ON ?auto_1731667 ?auto_1731666 ) ( ON ?auto_1731668 ?auto_1731667 ) ( ON ?auto_1731669 ?auto_1731668 ) ( ON ?auto_1731670 ?auto_1731669 ) ( ON ?auto_1731671 ?auto_1731670 ) ( ON ?auto_1731672 ?auto_1731671 ) ( ON ?auto_1731673 ?auto_1731672 ) ( ON ?auto_1731674 ?auto_1731673 ) ( ON ?auto_1731675 ?auto_1731674 ) ( not ( = ?auto_1731666 ?auto_1731667 ) ) ( not ( = ?auto_1731666 ?auto_1731668 ) ) ( not ( = ?auto_1731666 ?auto_1731669 ) ) ( not ( = ?auto_1731666 ?auto_1731670 ) ) ( not ( = ?auto_1731666 ?auto_1731671 ) ) ( not ( = ?auto_1731666 ?auto_1731672 ) ) ( not ( = ?auto_1731666 ?auto_1731673 ) ) ( not ( = ?auto_1731666 ?auto_1731674 ) ) ( not ( = ?auto_1731666 ?auto_1731675 ) ) ( not ( = ?auto_1731666 ?auto_1731676 ) ) ( not ( = ?auto_1731666 ?auto_1731677 ) ) ( not ( = ?auto_1731666 ?auto_1731680 ) ) ( not ( = ?auto_1731667 ?auto_1731668 ) ) ( not ( = ?auto_1731667 ?auto_1731669 ) ) ( not ( = ?auto_1731667 ?auto_1731670 ) ) ( not ( = ?auto_1731667 ?auto_1731671 ) ) ( not ( = ?auto_1731667 ?auto_1731672 ) ) ( not ( = ?auto_1731667 ?auto_1731673 ) ) ( not ( = ?auto_1731667 ?auto_1731674 ) ) ( not ( = ?auto_1731667 ?auto_1731675 ) ) ( not ( = ?auto_1731667 ?auto_1731676 ) ) ( not ( = ?auto_1731667 ?auto_1731677 ) ) ( not ( = ?auto_1731667 ?auto_1731680 ) ) ( not ( = ?auto_1731668 ?auto_1731669 ) ) ( not ( = ?auto_1731668 ?auto_1731670 ) ) ( not ( = ?auto_1731668 ?auto_1731671 ) ) ( not ( = ?auto_1731668 ?auto_1731672 ) ) ( not ( = ?auto_1731668 ?auto_1731673 ) ) ( not ( = ?auto_1731668 ?auto_1731674 ) ) ( not ( = ?auto_1731668 ?auto_1731675 ) ) ( not ( = ?auto_1731668 ?auto_1731676 ) ) ( not ( = ?auto_1731668 ?auto_1731677 ) ) ( not ( = ?auto_1731668 ?auto_1731680 ) ) ( not ( = ?auto_1731669 ?auto_1731670 ) ) ( not ( = ?auto_1731669 ?auto_1731671 ) ) ( not ( = ?auto_1731669 ?auto_1731672 ) ) ( not ( = ?auto_1731669 ?auto_1731673 ) ) ( not ( = ?auto_1731669 ?auto_1731674 ) ) ( not ( = ?auto_1731669 ?auto_1731675 ) ) ( not ( = ?auto_1731669 ?auto_1731676 ) ) ( not ( = ?auto_1731669 ?auto_1731677 ) ) ( not ( = ?auto_1731669 ?auto_1731680 ) ) ( not ( = ?auto_1731670 ?auto_1731671 ) ) ( not ( = ?auto_1731670 ?auto_1731672 ) ) ( not ( = ?auto_1731670 ?auto_1731673 ) ) ( not ( = ?auto_1731670 ?auto_1731674 ) ) ( not ( = ?auto_1731670 ?auto_1731675 ) ) ( not ( = ?auto_1731670 ?auto_1731676 ) ) ( not ( = ?auto_1731670 ?auto_1731677 ) ) ( not ( = ?auto_1731670 ?auto_1731680 ) ) ( not ( = ?auto_1731671 ?auto_1731672 ) ) ( not ( = ?auto_1731671 ?auto_1731673 ) ) ( not ( = ?auto_1731671 ?auto_1731674 ) ) ( not ( = ?auto_1731671 ?auto_1731675 ) ) ( not ( = ?auto_1731671 ?auto_1731676 ) ) ( not ( = ?auto_1731671 ?auto_1731677 ) ) ( not ( = ?auto_1731671 ?auto_1731680 ) ) ( not ( = ?auto_1731672 ?auto_1731673 ) ) ( not ( = ?auto_1731672 ?auto_1731674 ) ) ( not ( = ?auto_1731672 ?auto_1731675 ) ) ( not ( = ?auto_1731672 ?auto_1731676 ) ) ( not ( = ?auto_1731672 ?auto_1731677 ) ) ( not ( = ?auto_1731672 ?auto_1731680 ) ) ( not ( = ?auto_1731673 ?auto_1731674 ) ) ( not ( = ?auto_1731673 ?auto_1731675 ) ) ( not ( = ?auto_1731673 ?auto_1731676 ) ) ( not ( = ?auto_1731673 ?auto_1731677 ) ) ( not ( = ?auto_1731673 ?auto_1731680 ) ) ( not ( = ?auto_1731674 ?auto_1731675 ) ) ( not ( = ?auto_1731674 ?auto_1731676 ) ) ( not ( = ?auto_1731674 ?auto_1731677 ) ) ( not ( = ?auto_1731674 ?auto_1731680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731675 ?auto_1731676 ?auto_1731677 )
      ( MAKE-11CRATE-VERIFY ?auto_1731666 ?auto_1731667 ?auto_1731668 ?auto_1731669 ?auto_1731670 ?auto_1731671 ?auto_1731672 ?auto_1731673 ?auto_1731674 ?auto_1731675 ?auto_1731676 ?auto_1731677 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1731810 - SURFACE
      ?auto_1731811 - SURFACE
      ?auto_1731812 - SURFACE
      ?auto_1731813 - SURFACE
      ?auto_1731814 - SURFACE
      ?auto_1731815 - SURFACE
      ?auto_1731816 - SURFACE
      ?auto_1731817 - SURFACE
      ?auto_1731818 - SURFACE
      ?auto_1731819 - SURFACE
      ?auto_1731820 - SURFACE
      ?auto_1731821 - SURFACE
    )
    :vars
    (
      ?auto_1731823 - HOIST
      ?auto_1731825 - PLACE
      ?auto_1731824 - PLACE
      ?auto_1731827 - HOIST
      ?auto_1731826 - SURFACE
      ?auto_1731822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731823 ?auto_1731825 ) ( IS-CRATE ?auto_1731821 ) ( not ( = ?auto_1731820 ?auto_1731821 ) ) ( not ( = ?auto_1731819 ?auto_1731820 ) ) ( not ( = ?auto_1731819 ?auto_1731821 ) ) ( not ( = ?auto_1731824 ?auto_1731825 ) ) ( HOIST-AT ?auto_1731827 ?auto_1731824 ) ( not ( = ?auto_1731823 ?auto_1731827 ) ) ( AVAILABLE ?auto_1731827 ) ( SURFACE-AT ?auto_1731821 ?auto_1731824 ) ( ON ?auto_1731821 ?auto_1731826 ) ( CLEAR ?auto_1731821 ) ( not ( = ?auto_1731820 ?auto_1731826 ) ) ( not ( = ?auto_1731821 ?auto_1731826 ) ) ( not ( = ?auto_1731819 ?auto_1731826 ) ) ( TRUCK-AT ?auto_1731822 ?auto_1731825 ) ( SURFACE-AT ?auto_1731819 ?auto_1731825 ) ( CLEAR ?auto_1731819 ) ( IS-CRATE ?auto_1731820 ) ( AVAILABLE ?auto_1731823 ) ( IN ?auto_1731820 ?auto_1731822 ) ( ON ?auto_1731811 ?auto_1731810 ) ( ON ?auto_1731812 ?auto_1731811 ) ( ON ?auto_1731813 ?auto_1731812 ) ( ON ?auto_1731814 ?auto_1731813 ) ( ON ?auto_1731815 ?auto_1731814 ) ( ON ?auto_1731816 ?auto_1731815 ) ( ON ?auto_1731817 ?auto_1731816 ) ( ON ?auto_1731818 ?auto_1731817 ) ( ON ?auto_1731819 ?auto_1731818 ) ( not ( = ?auto_1731810 ?auto_1731811 ) ) ( not ( = ?auto_1731810 ?auto_1731812 ) ) ( not ( = ?auto_1731810 ?auto_1731813 ) ) ( not ( = ?auto_1731810 ?auto_1731814 ) ) ( not ( = ?auto_1731810 ?auto_1731815 ) ) ( not ( = ?auto_1731810 ?auto_1731816 ) ) ( not ( = ?auto_1731810 ?auto_1731817 ) ) ( not ( = ?auto_1731810 ?auto_1731818 ) ) ( not ( = ?auto_1731810 ?auto_1731819 ) ) ( not ( = ?auto_1731810 ?auto_1731820 ) ) ( not ( = ?auto_1731810 ?auto_1731821 ) ) ( not ( = ?auto_1731810 ?auto_1731826 ) ) ( not ( = ?auto_1731811 ?auto_1731812 ) ) ( not ( = ?auto_1731811 ?auto_1731813 ) ) ( not ( = ?auto_1731811 ?auto_1731814 ) ) ( not ( = ?auto_1731811 ?auto_1731815 ) ) ( not ( = ?auto_1731811 ?auto_1731816 ) ) ( not ( = ?auto_1731811 ?auto_1731817 ) ) ( not ( = ?auto_1731811 ?auto_1731818 ) ) ( not ( = ?auto_1731811 ?auto_1731819 ) ) ( not ( = ?auto_1731811 ?auto_1731820 ) ) ( not ( = ?auto_1731811 ?auto_1731821 ) ) ( not ( = ?auto_1731811 ?auto_1731826 ) ) ( not ( = ?auto_1731812 ?auto_1731813 ) ) ( not ( = ?auto_1731812 ?auto_1731814 ) ) ( not ( = ?auto_1731812 ?auto_1731815 ) ) ( not ( = ?auto_1731812 ?auto_1731816 ) ) ( not ( = ?auto_1731812 ?auto_1731817 ) ) ( not ( = ?auto_1731812 ?auto_1731818 ) ) ( not ( = ?auto_1731812 ?auto_1731819 ) ) ( not ( = ?auto_1731812 ?auto_1731820 ) ) ( not ( = ?auto_1731812 ?auto_1731821 ) ) ( not ( = ?auto_1731812 ?auto_1731826 ) ) ( not ( = ?auto_1731813 ?auto_1731814 ) ) ( not ( = ?auto_1731813 ?auto_1731815 ) ) ( not ( = ?auto_1731813 ?auto_1731816 ) ) ( not ( = ?auto_1731813 ?auto_1731817 ) ) ( not ( = ?auto_1731813 ?auto_1731818 ) ) ( not ( = ?auto_1731813 ?auto_1731819 ) ) ( not ( = ?auto_1731813 ?auto_1731820 ) ) ( not ( = ?auto_1731813 ?auto_1731821 ) ) ( not ( = ?auto_1731813 ?auto_1731826 ) ) ( not ( = ?auto_1731814 ?auto_1731815 ) ) ( not ( = ?auto_1731814 ?auto_1731816 ) ) ( not ( = ?auto_1731814 ?auto_1731817 ) ) ( not ( = ?auto_1731814 ?auto_1731818 ) ) ( not ( = ?auto_1731814 ?auto_1731819 ) ) ( not ( = ?auto_1731814 ?auto_1731820 ) ) ( not ( = ?auto_1731814 ?auto_1731821 ) ) ( not ( = ?auto_1731814 ?auto_1731826 ) ) ( not ( = ?auto_1731815 ?auto_1731816 ) ) ( not ( = ?auto_1731815 ?auto_1731817 ) ) ( not ( = ?auto_1731815 ?auto_1731818 ) ) ( not ( = ?auto_1731815 ?auto_1731819 ) ) ( not ( = ?auto_1731815 ?auto_1731820 ) ) ( not ( = ?auto_1731815 ?auto_1731821 ) ) ( not ( = ?auto_1731815 ?auto_1731826 ) ) ( not ( = ?auto_1731816 ?auto_1731817 ) ) ( not ( = ?auto_1731816 ?auto_1731818 ) ) ( not ( = ?auto_1731816 ?auto_1731819 ) ) ( not ( = ?auto_1731816 ?auto_1731820 ) ) ( not ( = ?auto_1731816 ?auto_1731821 ) ) ( not ( = ?auto_1731816 ?auto_1731826 ) ) ( not ( = ?auto_1731817 ?auto_1731818 ) ) ( not ( = ?auto_1731817 ?auto_1731819 ) ) ( not ( = ?auto_1731817 ?auto_1731820 ) ) ( not ( = ?auto_1731817 ?auto_1731821 ) ) ( not ( = ?auto_1731817 ?auto_1731826 ) ) ( not ( = ?auto_1731818 ?auto_1731819 ) ) ( not ( = ?auto_1731818 ?auto_1731820 ) ) ( not ( = ?auto_1731818 ?auto_1731821 ) ) ( not ( = ?auto_1731818 ?auto_1731826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1731819 ?auto_1731820 ?auto_1731821 )
      ( MAKE-11CRATE-VERIFY ?auto_1731810 ?auto_1731811 ?auto_1731812 ?auto_1731813 ?auto_1731814 ?auto_1731815 ?auto_1731816 ?auto_1731817 ?auto_1731818 ?auto_1731819 ?auto_1731820 ?auto_1731821 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741027 - SURFACE
      ?auto_1741028 - SURFACE
      ?auto_1741029 - SURFACE
      ?auto_1741030 - SURFACE
      ?auto_1741031 - SURFACE
      ?auto_1741032 - SURFACE
      ?auto_1741033 - SURFACE
      ?auto_1741034 - SURFACE
      ?auto_1741035 - SURFACE
      ?auto_1741036 - SURFACE
      ?auto_1741037 - SURFACE
      ?auto_1741038 - SURFACE
      ?auto_1741039 - SURFACE
    )
    :vars
    (
      ?auto_1741040 - HOIST
      ?auto_1741041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741040 ?auto_1741041 ) ( SURFACE-AT ?auto_1741038 ?auto_1741041 ) ( CLEAR ?auto_1741038 ) ( LIFTING ?auto_1741040 ?auto_1741039 ) ( IS-CRATE ?auto_1741039 ) ( not ( = ?auto_1741038 ?auto_1741039 ) ) ( ON ?auto_1741028 ?auto_1741027 ) ( ON ?auto_1741029 ?auto_1741028 ) ( ON ?auto_1741030 ?auto_1741029 ) ( ON ?auto_1741031 ?auto_1741030 ) ( ON ?auto_1741032 ?auto_1741031 ) ( ON ?auto_1741033 ?auto_1741032 ) ( ON ?auto_1741034 ?auto_1741033 ) ( ON ?auto_1741035 ?auto_1741034 ) ( ON ?auto_1741036 ?auto_1741035 ) ( ON ?auto_1741037 ?auto_1741036 ) ( ON ?auto_1741038 ?auto_1741037 ) ( not ( = ?auto_1741027 ?auto_1741028 ) ) ( not ( = ?auto_1741027 ?auto_1741029 ) ) ( not ( = ?auto_1741027 ?auto_1741030 ) ) ( not ( = ?auto_1741027 ?auto_1741031 ) ) ( not ( = ?auto_1741027 ?auto_1741032 ) ) ( not ( = ?auto_1741027 ?auto_1741033 ) ) ( not ( = ?auto_1741027 ?auto_1741034 ) ) ( not ( = ?auto_1741027 ?auto_1741035 ) ) ( not ( = ?auto_1741027 ?auto_1741036 ) ) ( not ( = ?auto_1741027 ?auto_1741037 ) ) ( not ( = ?auto_1741027 ?auto_1741038 ) ) ( not ( = ?auto_1741027 ?auto_1741039 ) ) ( not ( = ?auto_1741028 ?auto_1741029 ) ) ( not ( = ?auto_1741028 ?auto_1741030 ) ) ( not ( = ?auto_1741028 ?auto_1741031 ) ) ( not ( = ?auto_1741028 ?auto_1741032 ) ) ( not ( = ?auto_1741028 ?auto_1741033 ) ) ( not ( = ?auto_1741028 ?auto_1741034 ) ) ( not ( = ?auto_1741028 ?auto_1741035 ) ) ( not ( = ?auto_1741028 ?auto_1741036 ) ) ( not ( = ?auto_1741028 ?auto_1741037 ) ) ( not ( = ?auto_1741028 ?auto_1741038 ) ) ( not ( = ?auto_1741028 ?auto_1741039 ) ) ( not ( = ?auto_1741029 ?auto_1741030 ) ) ( not ( = ?auto_1741029 ?auto_1741031 ) ) ( not ( = ?auto_1741029 ?auto_1741032 ) ) ( not ( = ?auto_1741029 ?auto_1741033 ) ) ( not ( = ?auto_1741029 ?auto_1741034 ) ) ( not ( = ?auto_1741029 ?auto_1741035 ) ) ( not ( = ?auto_1741029 ?auto_1741036 ) ) ( not ( = ?auto_1741029 ?auto_1741037 ) ) ( not ( = ?auto_1741029 ?auto_1741038 ) ) ( not ( = ?auto_1741029 ?auto_1741039 ) ) ( not ( = ?auto_1741030 ?auto_1741031 ) ) ( not ( = ?auto_1741030 ?auto_1741032 ) ) ( not ( = ?auto_1741030 ?auto_1741033 ) ) ( not ( = ?auto_1741030 ?auto_1741034 ) ) ( not ( = ?auto_1741030 ?auto_1741035 ) ) ( not ( = ?auto_1741030 ?auto_1741036 ) ) ( not ( = ?auto_1741030 ?auto_1741037 ) ) ( not ( = ?auto_1741030 ?auto_1741038 ) ) ( not ( = ?auto_1741030 ?auto_1741039 ) ) ( not ( = ?auto_1741031 ?auto_1741032 ) ) ( not ( = ?auto_1741031 ?auto_1741033 ) ) ( not ( = ?auto_1741031 ?auto_1741034 ) ) ( not ( = ?auto_1741031 ?auto_1741035 ) ) ( not ( = ?auto_1741031 ?auto_1741036 ) ) ( not ( = ?auto_1741031 ?auto_1741037 ) ) ( not ( = ?auto_1741031 ?auto_1741038 ) ) ( not ( = ?auto_1741031 ?auto_1741039 ) ) ( not ( = ?auto_1741032 ?auto_1741033 ) ) ( not ( = ?auto_1741032 ?auto_1741034 ) ) ( not ( = ?auto_1741032 ?auto_1741035 ) ) ( not ( = ?auto_1741032 ?auto_1741036 ) ) ( not ( = ?auto_1741032 ?auto_1741037 ) ) ( not ( = ?auto_1741032 ?auto_1741038 ) ) ( not ( = ?auto_1741032 ?auto_1741039 ) ) ( not ( = ?auto_1741033 ?auto_1741034 ) ) ( not ( = ?auto_1741033 ?auto_1741035 ) ) ( not ( = ?auto_1741033 ?auto_1741036 ) ) ( not ( = ?auto_1741033 ?auto_1741037 ) ) ( not ( = ?auto_1741033 ?auto_1741038 ) ) ( not ( = ?auto_1741033 ?auto_1741039 ) ) ( not ( = ?auto_1741034 ?auto_1741035 ) ) ( not ( = ?auto_1741034 ?auto_1741036 ) ) ( not ( = ?auto_1741034 ?auto_1741037 ) ) ( not ( = ?auto_1741034 ?auto_1741038 ) ) ( not ( = ?auto_1741034 ?auto_1741039 ) ) ( not ( = ?auto_1741035 ?auto_1741036 ) ) ( not ( = ?auto_1741035 ?auto_1741037 ) ) ( not ( = ?auto_1741035 ?auto_1741038 ) ) ( not ( = ?auto_1741035 ?auto_1741039 ) ) ( not ( = ?auto_1741036 ?auto_1741037 ) ) ( not ( = ?auto_1741036 ?auto_1741038 ) ) ( not ( = ?auto_1741036 ?auto_1741039 ) ) ( not ( = ?auto_1741037 ?auto_1741038 ) ) ( not ( = ?auto_1741037 ?auto_1741039 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1741038 ?auto_1741039 )
      ( MAKE-12CRATE-VERIFY ?auto_1741027 ?auto_1741028 ?auto_1741029 ?auto_1741030 ?auto_1741031 ?auto_1741032 ?auto_1741033 ?auto_1741034 ?auto_1741035 ?auto_1741036 ?auto_1741037 ?auto_1741038 ?auto_1741039 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741152 - SURFACE
      ?auto_1741153 - SURFACE
      ?auto_1741154 - SURFACE
      ?auto_1741155 - SURFACE
      ?auto_1741156 - SURFACE
      ?auto_1741157 - SURFACE
      ?auto_1741158 - SURFACE
      ?auto_1741159 - SURFACE
      ?auto_1741160 - SURFACE
      ?auto_1741161 - SURFACE
      ?auto_1741162 - SURFACE
      ?auto_1741163 - SURFACE
      ?auto_1741164 - SURFACE
    )
    :vars
    (
      ?auto_1741167 - HOIST
      ?auto_1741166 - PLACE
      ?auto_1741165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741167 ?auto_1741166 ) ( SURFACE-AT ?auto_1741163 ?auto_1741166 ) ( CLEAR ?auto_1741163 ) ( IS-CRATE ?auto_1741164 ) ( not ( = ?auto_1741163 ?auto_1741164 ) ) ( TRUCK-AT ?auto_1741165 ?auto_1741166 ) ( AVAILABLE ?auto_1741167 ) ( IN ?auto_1741164 ?auto_1741165 ) ( ON ?auto_1741163 ?auto_1741162 ) ( not ( = ?auto_1741162 ?auto_1741163 ) ) ( not ( = ?auto_1741162 ?auto_1741164 ) ) ( ON ?auto_1741153 ?auto_1741152 ) ( ON ?auto_1741154 ?auto_1741153 ) ( ON ?auto_1741155 ?auto_1741154 ) ( ON ?auto_1741156 ?auto_1741155 ) ( ON ?auto_1741157 ?auto_1741156 ) ( ON ?auto_1741158 ?auto_1741157 ) ( ON ?auto_1741159 ?auto_1741158 ) ( ON ?auto_1741160 ?auto_1741159 ) ( ON ?auto_1741161 ?auto_1741160 ) ( ON ?auto_1741162 ?auto_1741161 ) ( not ( = ?auto_1741152 ?auto_1741153 ) ) ( not ( = ?auto_1741152 ?auto_1741154 ) ) ( not ( = ?auto_1741152 ?auto_1741155 ) ) ( not ( = ?auto_1741152 ?auto_1741156 ) ) ( not ( = ?auto_1741152 ?auto_1741157 ) ) ( not ( = ?auto_1741152 ?auto_1741158 ) ) ( not ( = ?auto_1741152 ?auto_1741159 ) ) ( not ( = ?auto_1741152 ?auto_1741160 ) ) ( not ( = ?auto_1741152 ?auto_1741161 ) ) ( not ( = ?auto_1741152 ?auto_1741162 ) ) ( not ( = ?auto_1741152 ?auto_1741163 ) ) ( not ( = ?auto_1741152 ?auto_1741164 ) ) ( not ( = ?auto_1741153 ?auto_1741154 ) ) ( not ( = ?auto_1741153 ?auto_1741155 ) ) ( not ( = ?auto_1741153 ?auto_1741156 ) ) ( not ( = ?auto_1741153 ?auto_1741157 ) ) ( not ( = ?auto_1741153 ?auto_1741158 ) ) ( not ( = ?auto_1741153 ?auto_1741159 ) ) ( not ( = ?auto_1741153 ?auto_1741160 ) ) ( not ( = ?auto_1741153 ?auto_1741161 ) ) ( not ( = ?auto_1741153 ?auto_1741162 ) ) ( not ( = ?auto_1741153 ?auto_1741163 ) ) ( not ( = ?auto_1741153 ?auto_1741164 ) ) ( not ( = ?auto_1741154 ?auto_1741155 ) ) ( not ( = ?auto_1741154 ?auto_1741156 ) ) ( not ( = ?auto_1741154 ?auto_1741157 ) ) ( not ( = ?auto_1741154 ?auto_1741158 ) ) ( not ( = ?auto_1741154 ?auto_1741159 ) ) ( not ( = ?auto_1741154 ?auto_1741160 ) ) ( not ( = ?auto_1741154 ?auto_1741161 ) ) ( not ( = ?auto_1741154 ?auto_1741162 ) ) ( not ( = ?auto_1741154 ?auto_1741163 ) ) ( not ( = ?auto_1741154 ?auto_1741164 ) ) ( not ( = ?auto_1741155 ?auto_1741156 ) ) ( not ( = ?auto_1741155 ?auto_1741157 ) ) ( not ( = ?auto_1741155 ?auto_1741158 ) ) ( not ( = ?auto_1741155 ?auto_1741159 ) ) ( not ( = ?auto_1741155 ?auto_1741160 ) ) ( not ( = ?auto_1741155 ?auto_1741161 ) ) ( not ( = ?auto_1741155 ?auto_1741162 ) ) ( not ( = ?auto_1741155 ?auto_1741163 ) ) ( not ( = ?auto_1741155 ?auto_1741164 ) ) ( not ( = ?auto_1741156 ?auto_1741157 ) ) ( not ( = ?auto_1741156 ?auto_1741158 ) ) ( not ( = ?auto_1741156 ?auto_1741159 ) ) ( not ( = ?auto_1741156 ?auto_1741160 ) ) ( not ( = ?auto_1741156 ?auto_1741161 ) ) ( not ( = ?auto_1741156 ?auto_1741162 ) ) ( not ( = ?auto_1741156 ?auto_1741163 ) ) ( not ( = ?auto_1741156 ?auto_1741164 ) ) ( not ( = ?auto_1741157 ?auto_1741158 ) ) ( not ( = ?auto_1741157 ?auto_1741159 ) ) ( not ( = ?auto_1741157 ?auto_1741160 ) ) ( not ( = ?auto_1741157 ?auto_1741161 ) ) ( not ( = ?auto_1741157 ?auto_1741162 ) ) ( not ( = ?auto_1741157 ?auto_1741163 ) ) ( not ( = ?auto_1741157 ?auto_1741164 ) ) ( not ( = ?auto_1741158 ?auto_1741159 ) ) ( not ( = ?auto_1741158 ?auto_1741160 ) ) ( not ( = ?auto_1741158 ?auto_1741161 ) ) ( not ( = ?auto_1741158 ?auto_1741162 ) ) ( not ( = ?auto_1741158 ?auto_1741163 ) ) ( not ( = ?auto_1741158 ?auto_1741164 ) ) ( not ( = ?auto_1741159 ?auto_1741160 ) ) ( not ( = ?auto_1741159 ?auto_1741161 ) ) ( not ( = ?auto_1741159 ?auto_1741162 ) ) ( not ( = ?auto_1741159 ?auto_1741163 ) ) ( not ( = ?auto_1741159 ?auto_1741164 ) ) ( not ( = ?auto_1741160 ?auto_1741161 ) ) ( not ( = ?auto_1741160 ?auto_1741162 ) ) ( not ( = ?auto_1741160 ?auto_1741163 ) ) ( not ( = ?auto_1741160 ?auto_1741164 ) ) ( not ( = ?auto_1741161 ?auto_1741162 ) ) ( not ( = ?auto_1741161 ?auto_1741163 ) ) ( not ( = ?auto_1741161 ?auto_1741164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741162 ?auto_1741163 ?auto_1741164 )
      ( MAKE-12CRATE-VERIFY ?auto_1741152 ?auto_1741153 ?auto_1741154 ?auto_1741155 ?auto_1741156 ?auto_1741157 ?auto_1741158 ?auto_1741159 ?auto_1741160 ?auto_1741161 ?auto_1741162 ?auto_1741163 ?auto_1741164 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741290 - SURFACE
      ?auto_1741291 - SURFACE
      ?auto_1741292 - SURFACE
      ?auto_1741293 - SURFACE
      ?auto_1741294 - SURFACE
      ?auto_1741295 - SURFACE
      ?auto_1741296 - SURFACE
      ?auto_1741297 - SURFACE
      ?auto_1741298 - SURFACE
      ?auto_1741299 - SURFACE
      ?auto_1741300 - SURFACE
      ?auto_1741301 - SURFACE
      ?auto_1741302 - SURFACE
    )
    :vars
    (
      ?auto_1741305 - HOIST
      ?auto_1741304 - PLACE
      ?auto_1741303 - TRUCK
      ?auto_1741306 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741305 ?auto_1741304 ) ( SURFACE-AT ?auto_1741301 ?auto_1741304 ) ( CLEAR ?auto_1741301 ) ( IS-CRATE ?auto_1741302 ) ( not ( = ?auto_1741301 ?auto_1741302 ) ) ( AVAILABLE ?auto_1741305 ) ( IN ?auto_1741302 ?auto_1741303 ) ( ON ?auto_1741301 ?auto_1741300 ) ( not ( = ?auto_1741300 ?auto_1741301 ) ) ( not ( = ?auto_1741300 ?auto_1741302 ) ) ( TRUCK-AT ?auto_1741303 ?auto_1741306 ) ( not ( = ?auto_1741306 ?auto_1741304 ) ) ( ON ?auto_1741291 ?auto_1741290 ) ( ON ?auto_1741292 ?auto_1741291 ) ( ON ?auto_1741293 ?auto_1741292 ) ( ON ?auto_1741294 ?auto_1741293 ) ( ON ?auto_1741295 ?auto_1741294 ) ( ON ?auto_1741296 ?auto_1741295 ) ( ON ?auto_1741297 ?auto_1741296 ) ( ON ?auto_1741298 ?auto_1741297 ) ( ON ?auto_1741299 ?auto_1741298 ) ( ON ?auto_1741300 ?auto_1741299 ) ( not ( = ?auto_1741290 ?auto_1741291 ) ) ( not ( = ?auto_1741290 ?auto_1741292 ) ) ( not ( = ?auto_1741290 ?auto_1741293 ) ) ( not ( = ?auto_1741290 ?auto_1741294 ) ) ( not ( = ?auto_1741290 ?auto_1741295 ) ) ( not ( = ?auto_1741290 ?auto_1741296 ) ) ( not ( = ?auto_1741290 ?auto_1741297 ) ) ( not ( = ?auto_1741290 ?auto_1741298 ) ) ( not ( = ?auto_1741290 ?auto_1741299 ) ) ( not ( = ?auto_1741290 ?auto_1741300 ) ) ( not ( = ?auto_1741290 ?auto_1741301 ) ) ( not ( = ?auto_1741290 ?auto_1741302 ) ) ( not ( = ?auto_1741291 ?auto_1741292 ) ) ( not ( = ?auto_1741291 ?auto_1741293 ) ) ( not ( = ?auto_1741291 ?auto_1741294 ) ) ( not ( = ?auto_1741291 ?auto_1741295 ) ) ( not ( = ?auto_1741291 ?auto_1741296 ) ) ( not ( = ?auto_1741291 ?auto_1741297 ) ) ( not ( = ?auto_1741291 ?auto_1741298 ) ) ( not ( = ?auto_1741291 ?auto_1741299 ) ) ( not ( = ?auto_1741291 ?auto_1741300 ) ) ( not ( = ?auto_1741291 ?auto_1741301 ) ) ( not ( = ?auto_1741291 ?auto_1741302 ) ) ( not ( = ?auto_1741292 ?auto_1741293 ) ) ( not ( = ?auto_1741292 ?auto_1741294 ) ) ( not ( = ?auto_1741292 ?auto_1741295 ) ) ( not ( = ?auto_1741292 ?auto_1741296 ) ) ( not ( = ?auto_1741292 ?auto_1741297 ) ) ( not ( = ?auto_1741292 ?auto_1741298 ) ) ( not ( = ?auto_1741292 ?auto_1741299 ) ) ( not ( = ?auto_1741292 ?auto_1741300 ) ) ( not ( = ?auto_1741292 ?auto_1741301 ) ) ( not ( = ?auto_1741292 ?auto_1741302 ) ) ( not ( = ?auto_1741293 ?auto_1741294 ) ) ( not ( = ?auto_1741293 ?auto_1741295 ) ) ( not ( = ?auto_1741293 ?auto_1741296 ) ) ( not ( = ?auto_1741293 ?auto_1741297 ) ) ( not ( = ?auto_1741293 ?auto_1741298 ) ) ( not ( = ?auto_1741293 ?auto_1741299 ) ) ( not ( = ?auto_1741293 ?auto_1741300 ) ) ( not ( = ?auto_1741293 ?auto_1741301 ) ) ( not ( = ?auto_1741293 ?auto_1741302 ) ) ( not ( = ?auto_1741294 ?auto_1741295 ) ) ( not ( = ?auto_1741294 ?auto_1741296 ) ) ( not ( = ?auto_1741294 ?auto_1741297 ) ) ( not ( = ?auto_1741294 ?auto_1741298 ) ) ( not ( = ?auto_1741294 ?auto_1741299 ) ) ( not ( = ?auto_1741294 ?auto_1741300 ) ) ( not ( = ?auto_1741294 ?auto_1741301 ) ) ( not ( = ?auto_1741294 ?auto_1741302 ) ) ( not ( = ?auto_1741295 ?auto_1741296 ) ) ( not ( = ?auto_1741295 ?auto_1741297 ) ) ( not ( = ?auto_1741295 ?auto_1741298 ) ) ( not ( = ?auto_1741295 ?auto_1741299 ) ) ( not ( = ?auto_1741295 ?auto_1741300 ) ) ( not ( = ?auto_1741295 ?auto_1741301 ) ) ( not ( = ?auto_1741295 ?auto_1741302 ) ) ( not ( = ?auto_1741296 ?auto_1741297 ) ) ( not ( = ?auto_1741296 ?auto_1741298 ) ) ( not ( = ?auto_1741296 ?auto_1741299 ) ) ( not ( = ?auto_1741296 ?auto_1741300 ) ) ( not ( = ?auto_1741296 ?auto_1741301 ) ) ( not ( = ?auto_1741296 ?auto_1741302 ) ) ( not ( = ?auto_1741297 ?auto_1741298 ) ) ( not ( = ?auto_1741297 ?auto_1741299 ) ) ( not ( = ?auto_1741297 ?auto_1741300 ) ) ( not ( = ?auto_1741297 ?auto_1741301 ) ) ( not ( = ?auto_1741297 ?auto_1741302 ) ) ( not ( = ?auto_1741298 ?auto_1741299 ) ) ( not ( = ?auto_1741298 ?auto_1741300 ) ) ( not ( = ?auto_1741298 ?auto_1741301 ) ) ( not ( = ?auto_1741298 ?auto_1741302 ) ) ( not ( = ?auto_1741299 ?auto_1741300 ) ) ( not ( = ?auto_1741299 ?auto_1741301 ) ) ( not ( = ?auto_1741299 ?auto_1741302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741300 ?auto_1741301 ?auto_1741302 )
      ( MAKE-12CRATE-VERIFY ?auto_1741290 ?auto_1741291 ?auto_1741292 ?auto_1741293 ?auto_1741294 ?auto_1741295 ?auto_1741296 ?auto_1741297 ?auto_1741298 ?auto_1741299 ?auto_1741300 ?auto_1741301 ?auto_1741302 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741440 - SURFACE
      ?auto_1741441 - SURFACE
      ?auto_1741442 - SURFACE
      ?auto_1741443 - SURFACE
      ?auto_1741444 - SURFACE
      ?auto_1741445 - SURFACE
      ?auto_1741446 - SURFACE
      ?auto_1741447 - SURFACE
      ?auto_1741448 - SURFACE
      ?auto_1741449 - SURFACE
      ?auto_1741450 - SURFACE
      ?auto_1741451 - SURFACE
      ?auto_1741452 - SURFACE
    )
    :vars
    (
      ?auto_1741455 - HOIST
      ?auto_1741456 - PLACE
      ?auto_1741454 - TRUCK
      ?auto_1741453 - PLACE
      ?auto_1741457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741455 ?auto_1741456 ) ( SURFACE-AT ?auto_1741451 ?auto_1741456 ) ( CLEAR ?auto_1741451 ) ( IS-CRATE ?auto_1741452 ) ( not ( = ?auto_1741451 ?auto_1741452 ) ) ( AVAILABLE ?auto_1741455 ) ( ON ?auto_1741451 ?auto_1741450 ) ( not ( = ?auto_1741450 ?auto_1741451 ) ) ( not ( = ?auto_1741450 ?auto_1741452 ) ) ( TRUCK-AT ?auto_1741454 ?auto_1741453 ) ( not ( = ?auto_1741453 ?auto_1741456 ) ) ( HOIST-AT ?auto_1741457 ?auto_1741453 ) ( LIFTING ?auto_1741457 ?auto_1741452 ) ( not ( = ?auto_1741455 ?auto_1741457 ) ) ( ON ?auto_1741441 ?auto_1741440 ) ( ON ?auto_1741442 ?auto_1741441 ) ( ON ?auto_1741443 ?auto_1741442 ) ( ON ?auto_1741444 ?auto_1741443 ) ( ON ?auto_1741445 ?auto_1741444 ) ( ON ?auto_1741446 ?auto_1741445 ) ( ON ?auto_1741447 ?auto_1741446 ) ( ON ?auto_1741448 ?auto_1741447 ) ( ON ?auto_1741449 ?auto_1741448 ) ( ON ?auto_1741450 ?auto_1741449 ) ( not ( = ?auto_1741440 ?auto_1741441 ) ) ( not ( = ?auto_1741440 ?auto_1741442 ) ) ( not ( = ?auto_1741440 ?auto_1741443 ) ) ( not ( = ?auto_1741440 ?auto_1741444 ) ) ( not ( = ?auto_1741440 ?auto_1741445 ) ) ( not ( = ?auto_1741440 ?auto_1741446 ) ) ( not ( = ?auto_1741440 ?auto_1741447 ) ) ( not ( = ?auto_1741440 ?auto_1741448 ) ) ( not ( = ?auto_1741440 ?auto_1741449 ) ) ( not ( = ?auto_1741440 ?auto_1741450 ) ) ( not ( = ?auto_1741440 ?auto_1741451 ) ) ( not ( = ?auto_1741440 ?auto_1741452 ) ) ( not ( = ?auto_1741441 ?auto_1741442 ) ) ( not ( = ?auto_1741441 ?auto_1741443 ) ) ( not ( = ?auto_1741441 ?auto_1741444 ) ) ( not ( = ?auto_1741441 ?auto_1741445 ) ) ( not ( = ?auto_1741441 ?auto_1741446 ) ) ( not ( = ?auto_1741441 ?auto_1741447 ) ) ( not ( = ?auto_1741441 ?auto_1741448 ) ) ( not ( = ?auto_1741441 ?auto_1741449 ) ) ( not ( = ?auto_1741441 ?auto_1741450 ) ) ( not ( = ?auto_1741441 ?auto_1741451 ) ) ( not ( = ?auto_1741441 ?auto_1741452 ) ) ( not ( = ?auto_1741442 ?auto_1741443 ) ) ( not ( = ?auto_1741442 ?auto_1741444 ) ) ( not ( = ?auto_1741442 ?auto_1741445 ) ) ( not ( = ?auto_1741442 ?auto_1741446 ) ) ( not ( = ?auto_1741442 ?auto_1741447 ) ) ( not ( = ?auto_1741442 ?auto_1741448 ) ) ( not ( = ?auto_1741442 ?auto_1741449 ) ) ( not ( = ?auto_1741442 ?auto_1741450 ) ) ( not ( = ?auto_1741442 ?auto_1741451 ) ) ( not ( = ?auto_1741442 ?auto_1741452 ) ) ( not ( = ?auto_1741443 ?auto_1741444 ) ) ( not ( = ?auto_1741443 ?auto_1741445 ) ) ( not ( = ?auto_1741443 ?auto_1741446 ) ) ( not ( = ?auto_1741443 ?auto_1741447 ) ) ( not ( = ?auto_1741443 ?auto_1741448 ) ) ( not ( = ?auto_1741443 ?auto_1741449 ) ) ( not ( = ?auto_1741443 ?auto_1741450 ) ) ( not ( = ?auto_1741443 ?auto_1741451 ) ) ( not ( = ?auto_1741443 ?auto_1741452 ) ) ( not ( = ?auto_1741444 ?auto_1741445 ) ) ( not ( = ?auto_1741444 ?auto_1741446 ) ) ( not ( = ?auto_1741444 ?auto_1741447 ) ) ( not ( = ?auto_1741444 ?auto_1741448 ) ) ( not ( = ?auto_1741444 ?auto_1741449 ) ) ( not ( = ?auto_1741444 ?auto_1741450 ) ) ( not ( = ?auto_1741444 ?auto_1741451 ) ) ( not ( = ?auto_1741444 ?auto_1741452 ) ) ( not ( = ?auto_1741445 ?auto_1741446 ) ) ( not ( = ?auto_1741445 ?auto_1741447 ) ) ( not ( = ?auto_1741445 ?auto_1741448 ) ) ( not ( = ?auto_1741445 ?auto_1741449 ) ) ( not ( = ?auto_1741445 ?auto_1741450 ) ) ( not ( = ?auto_1741445 ?auto_1741451 ) ) ( not ( = ?auto_1741445 ?auto_1741452 ) ) ( not ( = ?auto_1741446 ?auto_1741447 ) ) ( not ( = ?auto_1741446 ?auto_1741448 ) ) ( not ( = ?auto_1741446 ?auto_1741449 ) ) ( not ( = ?auto_1741446 ?auto_1741450 ) ) ( not ( = ?auto_1741446 ?auto_1741451 ) ) ( not ( = ?auto_1741446 ?auto_1741452 ) ) ( not ( = ?auto_1741447 ?auto_1741448 ) ) ( not ( = ?auto_1741447 ?auto_1741449 ) ) ( not ( = ?auto_1741447 ?auto_1741450 ) ) ( not ( = ?auto_1741447 ?auto_1741451 ) ) ( not ( = ?auto_1741447 ?auto_1741452 ) ) ( not ( = ?auto_1741448 ?auto_1741449 ) ) ( not ( = ?auto_1741448 ?auto_1741450 ) ) ( not ( = ?auto_1741448 ?auto_1741451 ) ) ( not ( = ?auto_1741448 ?auto_1741452 ) ) ( not ( = ?auto_1741449 ?auto_1741450 ) ) ( not ( = ?auto_1741449 ?auto_1741451 ) ) ( not ( = ?auto_1741449 ?auto_1741452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741450 ?auto_1741451 ?auto_1741452 )
      ( MAKE-12CRATE-VERIFY ?auto_1741440 ?auto_1741441 ?auto_1741442 ?auto_1741443 ?auto_1741444 ?auto_1741445 ?auto_1741446 ?auto_1741447 ?auto_1741448 ?auto_1741449 ?auto_1741450 ?auto_1741451 ?auto_1741452 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741602 - SURFACE
      ?auto_1741603 - SURFACE
      ?auto_1741604 - SURFACE
      ?auto_1741605 - SURFACE
      ?auto_1741606 - SURFACE
      ?auto_1741607 - SURFACE
      ?auto_1741608 - SURFACE
      ?auto_1741609 - SURFACE
      ?auto_1741610 - SURFACE
      ?auto_1741611 - SURFACE
      ?auto_1741612 - SURFACE
      ?auto_1741613 - SURFACE
      ?auto_1741614 - SURFACE
    )
    :vars
    (
      ?auto_1741617 - HOIST
      ?auto_1741620 - PLACE
      ?auto_1741616 - TRUCK
      ?auto_1741619 - PLACE
      ?auto_1741615 - HOIST
      ?auto_1741618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741617 ?auto_1741620 ) ( SURFACE-AT ?auto_1741613 ?auto_1741620 ) ( CLEAR ?auto_1741613 ) ( IS-CRATE ?auto_1741614 ) ( not ( = ?auto_1741613 ?auto_1741614 ) ) ( AVAILABLE ?auto_1741617 ) ( ON ?auto_1741613 ?auto_1741612 ) ( not ( = ?auto_1741612 ?auto_1741613 ) ) ( not ( = ?auto_1741612 ?auto_1741614 ) ) ( TRUCK-AT ?auto_1741616 ?auto_1741619 ) ( not ( = ?auto_1741619 ?auto_1741620 ) ) ( HOIST-AT ?auto_1741615 ?auto_1741619 ) ( not ( = ?auto_1741617 ?auto_1741615 ) ) ( AVAILABLE ?auto_1741615 ) ( SURFACE-AT ?auto_1741614 ?auto_1741619 ) ( ON ?auto_1741614 ?auto_1741618 ) ( CLEAR ?auto_1741614 ) ( not ( = ?auto_1741613 ?auto_1741618 ) ) ( not ( = ?auto_1741614 ?auto_1741618 ) ) ( not ( = ?auto_1741612 ?auto_1741618 ) ) ( ON ?auto_1741603 ?auto_1741602 ) ( ON ?auto_1741604 ?auto_1741603 ) ( ON ?auto_1741605 ?auto_1741604 ) ( ON ?auto_1741606 ?auto_1741605 ) ( ON ?auto_1741607 ?auto_1741606 ) ( ON ?auto_1741608 ?auto_1741607 ) ( ON ?auto_1741609 ?auto_1741608 ) ( ON ?auto_1741610 ?auto_1741609 ) ( ON ?auto_1741611 ?auto_1741610 ) ( ON ?auto_1741612 ?auto_1741611 ) ( not ( = ?auto_1741602 ?auto_1741603 ) ) ( not ( = ?auto_1741602 ?auto_1741604 ) ) ( not ( = ?auto_1741602 ?auto_1741605 ) ) ( not ( = ?auto_1741602 ?auto_1741606 ) ) ( not ( = ?auto_1741602 ?auto_1741607 ) ) ( not ( = ?auto_1741602 ?auto_1741608 ) ) ( not ( = ?auto_1741602 ?auto_1741609 ) ) ( not ( = ?auto_1741602 ?auto_1741610 ) ) ( not ( = ?auto_1741602 ?auto_1741611 ) ) ( not ( = ?auto_1741602 ?auto_1741612 ) ) ( not ( = ?auto_1741602 ?auto_1741613 ) ) ( not ( = ?auto_1741602 ?auto_1741614 ) ) ( not ( = ?auto_1741602 ?auto_1741618 ) ) ( not ( = ?auto_1741603 ?auto_1741604 ) ) ( not ( = ?auto_1741603 ?auto_1741605 ) ) ( not ( = ?auto_1741603 ?auto_1741606 ) ) ( not ( = ?auto_1741603 ?auto_1741607 ) ) ( not ( = ?auto_1741603 ?auto_1741608 ) ) ( not ( = ?auto_1741603 ?auto_1741609 ) ) ( not ( = ?auto_1741603 ?auto_1741610 ) ) ( not ( = ?auto_1741603 ?auto_1741611 ) ) ( not ( = ?auto_1741603 ?auto_1741612 ) ) ( not ( = ?auto_1741603 ?auto_1741613 ) ) ( not ( = ?auto_1741603 ?auto_1741614 ) ) ( not ( = ?auto_1741603 ?auto_1741618 ) ) ( not ( = ?auto_1741604 ?auto_1741605 ) ) ( not ( = ?auto_1741604 ?auto_1741606 ) ) ( not ( = ?auto_1741604 ?auto_1741607 ) ) ( not ( = ?auto_1741604 ?auto_1741608 ) ) ( not ( = ?auto_1741604 ?auto_1741609 ) ) ( not ( = ?auto_1741604 ?auto_1741610 ) ) ( not ( = ?auto_1741604 ?auto_1741611 ) ) ( not ( = ?auto_1741604 ?auto_1741612 ) ) ( not ( = ?auto_1741604 ?auto_1741613 ) ) ( not ( = ?auto_1741604 ?auto_1741614 ) ) ( not ( = ?auto_1741604 ?auto_1741618 ) ) ( not ( = ?auto_1741605 ?auto_1741606 ) ) ( not ( = ?auto_1741605 ?auto_1741607 ) ) ( not ( = ?auto_1741605 ?auto_1741608 ) ) ( not ( = ?auto_1741605 ?auto_1741609 ) ) ( not ( = ?auto_1741605 ?auto_1741610 ) ) ( not ( = ?auto_1741605 ?auto_1741611 ) ) ( not ( = ?auto_1741605 ?auto_1741612 ) ) ( not ( = ?auto_1741605 ?auto_1741613 ) ) ( not ( = ?auto_1741605 ?auto_1741614 ) ) ( not ( = ?auto_1741605 ?auto_1741618 ) ) ( not ( = ?auto_1741606 ?auto_1741607 ) ) ( not ( = ?auto_1741606 ?auto_1741608 ) ) ( not ( = ?auto_1741606 ?auto_1741609 ) ) ( not ( = ?auto_1741606 ?auto_1741610 ) ) ( not ( = ?auto_1741606 ?auto_1741611 ) ) ( not ( = ?auto_1741606 ?auto_1741612 ) ) ( not ( = ?auto_1741606 ?auto_1741613 ) ) ( not ( = ?auto_1741606 ?auto_1741614 ) ) ( not ( = ?auto_1741606 ?auto_1741618 ) ) ( not ( = ?auto_1741607 ?auto_1741608 ) ) ( not ( = ?auto_1741607 ?auto_1741609 ) ) ( not ( = ?auto_1741607 ?auto_1741610 ) ) ( not ( = ?auto_1741607 ?auto_1741611 ) ) ( not ( = ?auto_1741607 ?auto_1741612 ) ) ( not ( = ?auto_1741607 ?auto_1741613 ) ) ( not ( = ?auto_1741607 ?auto_1741614 ) ) ( not ( = ?auto_1741607 ?auto_1741618 ) ) ( not ( = ?auto_1741608 ?auto_1741609 ) ) ( not ( = ?auto_1741608 ?auto_1741610 ) ) ( not ( = ?auto_1741608 ?auto_1741611 ) ) ( not ( = ?auto_1741608 ?auto_1741612 ) ) ( not ( = ?auto_1741608 ?auto_1741613 ) ) ( not ( = ?auto_1741608 ?auto_1741614 ) ) ( not ( = ?auto_1741608 ?auto_1741618 ) ) ( not ( = ?auto_1741609 ?auto_1741610 ) ) ( not ( = ?auto_1741609 ?auto_1741611 ) ) ( not ( = ?auto_1741609 ?auto_1741612 ) ) ( not ( = ?auto_1741609 ?auto_1741613 ) ) ( not ( = ?auto_1741609 ?auto_1741614 ) ) ( not ( = ?auto_1741609 ?auto_1741618 ) ) ( not ( = ?auto_1741610 ?auto_1741611 ) ) ( not ( = ?auto_1741610 ?auto_1741612 ) ) ( not ( = ?auto_1741610 ?auto_1741613 ) ) ( not ( = ?auto_1741610 ?auto_1741614 ) ) ( not ( = ?auto_1741610 ?auto_1741618 ) ) ( not ( = ?auto_1741611 ?auto_1741612 ) ) ( not ( = ?auto_1741611 ?auto_1741613 ) ) ( not ( = ?auto_1741611 ?auto_1741614 ) ) ( not ( = ?auto_1741611 ?auto_1741618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741612 ?auto_1741613 ?auto_1741614 )
      ( MAKE-12CRATE-VERIFY ?auto_1741602 ?auto_1741603 ?auto_1741604 ?auto_1741605 ?auto_1741606 ?auto_1741607 ?auto_1741608 ?auto_1741609 ?auto_1741610 ?auto_1741611 ?auto_1741612 ?auto_1741613 ?auto_1741614 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741765 - SURFACE
      ?auto_1741766 - SURFACE
      ?auto_1741767 - SURFACE
      ?auto_1741768 - SURFACE
      ?auto_1741769 - SURFACE
      ?auto_1741770 - SURFACE
      ?auto_1741771 - SURFACE
      ?auto_1741772 - SURFACE
      ?auto_1741773 - SURFACE
      ?auto_1741774 - SURFACE
      ?auto_1741775 - SURFACE
      ?auto_1741776 - SURFACE
      ?auto_1741777 - SURFACE
    )
    :vars
    (
      ?auto_1741779 - HOIST
      ?auto_1741781 - PLACE
      ?auto_1741782 - PLACE
      ?auto_1741778 - HOIST
      ?auto_1741783 - SURFACE
      ?auto_1741780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741779 ?auto_1741781 ) ( SURFACE-AT ?auto_1741776 ?auto_1741781 ) ( CLEAR ?auto_1741776 ) ( IS-CRATE ?auto_1741777 ) ( not ( = ?auto_1741776 ?auto_1741777 ) ) ( AVAILABLE ?auto_1741779 ) ( ON ?auto_1741776 ?auto_1741775 ) ( not ( = ?auto_1741775 ?auto_1741776 ) ) ( not ( = ?auto_1741775 ?auto_1741777 ) ) ( not ( = ?auto_1741782 ?auto_1741781 ) ) ( HOIST-AT ?auto_1741778 ?auto_1741782 ) ( not ( = ?auto_1741779 ?auto_1741778 ) ) ( AVAILABLE ?auto_1741778 ) ( SURFACE-AT ?auto_1741777 ?auto_1741782 ) ( ON ?auto_1741777 ?auto_1741783 ) ( CLEAR ?auto_1741777 ) ( not ( = ?auto_1741776 ?auto_1741783 ) ) ( not ( = ?auto_1741777 ?auto_1741783 ) ) ( not ( = ?auto_1741775 ?auto_1741783 ) ) ( TRUCK-AT ?auto_1741780 ?auto_1741781 ) ( ON ?auto_1741766 ?auto_1741765 ) ( ON ?auto_1741767 ?auto_1741766 ) ( ON ?auto_1741768 ?auto_1741767 ) ( ON ?auto_1741769 ?auto_1741768 ) ( ON ?auto_1741770 ?auto_1741769 ) ( ON ?auto_1741771 ?auto_1741770 ) ( ON ?auto_1741772 ?auto_1741771 ) ( ON ?auto_1741773 ?auto_1741772 ) ( ON ?auto_1741774 ?auto_1741773 ) ( ON ?auto_1741775 ?auto_1741774 ) ( not ( = ?auto_1741765 ?auto_1741766 ) ) ( not ( = ?auto_1741765 ?auto_1741767 ) ) ( not ( = ?auto_1741765 ?auto_1741768 ) ) ( not ( = ?auto_1741765 ?auto_1741769 ) ) ( not ( = ?auto_1741765 ?auto_1741770 ) ) ( not ( = ?auto_1741765 ?auto_1741771 ) ) ( not ( = ?auto_1741765 ?auto_1741772 ) ) ( not ( = ?auto_1741765 ?auto_1741773 ) ) ( not ( = ?auto_1741765 ?auto_1741774 ) ) ( not ( = ?auto_1741765 ?auto_1741775 ) ) ( not ( = ?auto_1741765 ?auto_1741776 ) ) ( not ( = ?auto_1741765 ?auto_1741777 ) ) ( not ( = ?auto_1741765 ?auto_1741783 ) ) ( not ( = ?auto_1741766 ?auto_1741767 ) ) ( not ( = ?auto_1741766 ?auto_1741768 ) ) ( not ( = ?auto_1741766 ?auto_1741769 ) ) ( not ( = ?auto_1741766 ?auto_1741770 ) ) ( not ( = ?auto_1741766 ?auto_1741771 ) ) ( not ( = ?auto_1741766 ?auto_1741772 ) ) ( not ( = ?auto_1741766 ?auto_1741773 ) ) ( not ( = ?auto_1741766 ?auto_1741774 ) ) ( not ( = ?auto_1741766 ?auto_1741775 ) ) ( not ( = ?auto_1741766 ?auto_1741776 ) ) ( not ( = ?auto_1741766 ?auto_1741777 ) ) ( not ( = ?auto_1741766 ?auto_1741783 ) ) ( not ( = ?auto_1741767 ?auto_1741768 ) ) ( not ( = ?auto_1741767 ?auto_1741769 ) ) ( not ( = ?auto_1741767 ?auto_1741770 ) ) ( not ( = ?auto_1741767 ?auto_1741771 ) ) ( not ( = ?auto_1741767 ?auto_1741772 ) ) ( not ( = ?auto_1741767 ?auto_1741773 ) ) ( not ( = ?auto_1741767 ?auto_1741774 ) ) ( not ( = ?auto_1741767 ?auto_1741775 ) ) ( not ( = ?auto_1741767 ?auto_1741776 ) ) ( not ( = ?auto_1741767 ?auto_1741777 ) ) ( not ( = ?auto_1741767 ?auto_1741783 ) ) ( not ( = ?auto_1741768 ?auto_1741769 ) ) ( not ( = ?auto_1741768 ?auto_1741770 ) ) ( not ( = ?auto_1741768 ?auto_1741771 ) ) ( not ( = ?auto_1741768 ?auto_1741772 ) ) ( not ( = ?auto_1741768 ?auto_1741773 ) ) ( not ( = ?auto_1741768 ?auto_1741774 ) ) ( not ( = ?auto_1741768 ?auto_1741775 ) ) ( not ( = ?auto_1741768 ?auto_1741776 ) ) ( not ( = ?auto_1741768 ?auto_1741777 ) ) ( not ( = ?auto_1741768 ?auto_1741783 ) ) ( not ( = ?auto_1741769 ?auto_1741770 ) ) ( not ( = ?auto_1741769 ?auto_1741771 ) ) ( not ( = ?auto_1741769 ?auto_1741772 ) ) ( not ( = ?auto_1741769 ?auto_1741773 ) ) ( not ( = ?auto_1741769 ?auto_1741774 ) ) ( not ( = ?auto_1741769 ?auto_1741775 ) ) ( not ( = ?auto_1741769 ?auto_1741776 ) ) ( not ( = ?auto_1741769 ?auto_1741777 ) ) ( not ( = ?auto_1741769 ?auto_1741783 ) ) ( not ( = ?auto_1741770 ?auto_1741771 ) ) ( not ( = ?auto_1741770 ?auto_1741772 ) ) ( not ( = ?auto_1741770 ?auto_1741773 ) ) ( not ( = ?auto_1741770 ?auto_1741774 ) ) ( not ( = ?auto_1741770 ?auto_1741775 ) ) ( not ( = ?auto_1741770 ?auto_1741776 ) ) ( not ( = ?auto_1741770 ?auto_1741777 ) ) ( not ( = ?auto_1741770 ?auto_1741783 ) ) ( not ( = ?auto_1741771 ?auto_1741772 ) ) ( not ( = ?auto_1741771 ?auto_1741773 ) ) ( not ( = ?auto_1741771 ?auto_1741774 ) ) ( not ( = ?auto_1741771 ?auto_1741775 ) ) ( not ( = ?auto_1741771 ?auto_1741776 ) ) ( not ( = ?auto_1741771 ?auto_1741777 ) ) ( not ( = ?auto_1741771 ?auto_1741783 ) ) ( not ( = ?auto_1741772 ?auto_1741773 ) ) ( not ( = ?auto_1741772 ?auto_1741774 ) ) ( not ( = ?auto_1741772 ?auto_1741775 ) ) ( not ( = ?auto_1741772 ?auto_1741776 ) ) ( not ( = ?auto_1741772 ?auto_1741777 ) ) ( not ( = ?auto_1741772 ?auto_1741783 ) ) ( not ( = ?auto_1741773 ?auto_1741774 ) ) ( not ( = ?auto_1741773 ?auto_1741775 ) ) ( not ( = ?auto_1741773 ?auto_1741776 ) ) ( not ( = ?auto_1741773 ?auto_1741777 ) ) ( not ( = ?auto_1741773 ?auto_1741783 ) ) ( not ( = ?auto_1741774 ?auto_1741775 ) ) ( not ( = ?auto_1741774 ?auto_1741776 ) ) ( not ( = ?auto_1741774 ?auto_1741777 ) ) ( not ( = ?auto_1741774 ?auto_1741783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741775 ?auto_1741776 ?auto_1741777 )
      ( MAKE-12CRATE-VERIFY ?auto_1741765 ?auto_1741766 ?auto_1741767 ?auto_1741768 ?auto_1741769 ?auto_1741770 ?auto_1741771 ?auto_1741772 ?auto_1741773 ?auto_1741774 ?auto_1741775 ?auto_1741776 ?auto_1741777 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1741928 - SURFACE
      ?auto_1741929 - SURFACE
      ?auto_1741930 - SURFACE
      ?auto_1741931 - SURFACE
      ?auto_1741932 - SURFACE
      ?auto_1741933 - SURFACE
      ?auto_1741934 - SURFACE
      ?auto_1741935 - SURFACE
      ?auto_1741936 - SURFACE
      ?auto_1741937 - SURFACE
      ?auto_1741938 - SURFACE
      ?auto_1741939 - SURFACE
      ?auto_1741940 - SURFACE
    )
    :vars
    (
      ?auto_1741943 - HOIST
      ?auto_1741946 - PLACE
      ?auto_1741944 - PLACE
      ?auto_1741945 - HOIST
      ?auto_1741942 - SURFACE
      ?auto_1741941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1741943 ?auto_1741946 ) ( IS-CRATE ?auto_1741940 ) ( not ( = ?auto_1741939 ?auto_1741940 ) ) ( not ( = ?auto_1741938 ?auto_1741939 ) ) ( not ( = ?auto_1741938 ?auto_1741940 ) ) ( not ( = ?auto_1741944 ?auto_1741946 ) ) ( HOIST-AT ?auto_1741945 ?auto_1741944 ) ( not ( = ?auto_1741943 ?auto_1741945 ) ) ( AVAILABLE ?auto_1741945 ) ( SURFACE-AT ?auto_1741940 ?auto_1741944 ) ( ON ?auto_1741940 ?auto_1741942 ) ( CLEAR ?auto_1741940 ) ( not ( = ?auto_1741939 ?auto_1741942 ) ) ( not ( = ?auto_1741940 ?auto_1741942 ) ) ( not ( = ?auto_1741938 ?auto_1741942 ) ) ( TRUCK-AT ?auto_1741941 ?auto_1741946 ) ( SURFACE-AT ?auto_1741938 ?auto_1741946 ) ( CLEAR ?auto_1741938 ) ( LIFTING ?auto_1741943 ?auto_1741939 ) ( IS-CRATE ?auto_1741939 ) ( ON ?auto_1741929 ?auto_1741928 ) ( ON ?auto_1741930 ?auto_1741929 ) ( ON ?auto_1741931 ?auto_1741930 ) ( ON ?auto_1741932 ?auto_1741931 ) ( ON ?auto_1741933 ?auto_1741932 ) ( ON ?auto_1741934 ?auto_1741933 ) ( ON ?auto_1741935 ?auto_1741934 ) ( ON ?auto_1741936 ?auto_1741935 ) ( ON ?auto_1741937 ?auto_1741936 ) ( ON ?auto_1741938 ?auto_1741937 ) ( not ( = ?auto_1741928 ?auto_1741929 ) ) ( not ( = ?auto_1741928 ?auto_1741930 ) ) ( not ( = ?auto_1741928 ?auto_1741931 ) ) ( not ( = ?auto_1741928 ?auto_1741932 ) ) ( not ( = ?auto_1741928 ?auto_1741933 ) ) ( not ( = ?auto_1741928 ?auto_1741934 ) ) ( not ( = ?auto_1741928 ?auto_1741935 ) ) ( not ( = ?auto_1741928 ?auto_1741936 ) ) ( not ( = ?auto_1741928 ?auto_1741937 ) ) ( not ( = ?auto_1741928 ?auto_1741938 ) ) ( not ( = ?auto_1741928 ?auto_1741939 ) ) ( not ( = ?auto_1741928 ?auto_1741940 ) ) ( not ( = ?auto_1741928 ?auto_1741942 ) ) ( not ( = ?auto_1741929 ?auto_1741930 ) ) ( not ( = ?auto_1741929 ?auto_1741931 ) ) ( not ( = ?auto_1741929 ?auto_1741932 ) ) ( not ( = ?auto_1741929 ?auto_1741933 ) ) ( not ( = ?auto_1741929 ?auto_1741934 ) ) ( not ( = ?auto_1741929 ?auto_1741935 ) ) ( not ( = ?auto_1741929 ?auto_1741936 ) ) ( not ( = ?auto_1741929 ?auto_1741937 ) ) ( not ( = ?auto_1741929 ?auto_1741938 ) ) ( not ( = ?auto_1741929 ?auto_1741939 ) ) ( not ( = ?auto_1741929 ?auto_1741940 ) ) ( not ( = ?auto_1741929 ?auto_1741942 ) ) ( not ( = ?auto_1741930 ?auto_1741931 ) ) ( not ( = ?auto_1741930 ?auto_1741932 ) ) ( not ( = ?auto_1741930 ?auto_1741933 ) ) ( not ( = ?auto_1741930 ?auto_1741934 ) ) ( not ( = ?auto_1741930 ?auto_1741935 ) ) ( not ( = ?auto_1741930 ?auto_1741936 ) ) ( not ( = ?auto_1741930 ?auto_1741937 ) ) ( not ( = ?auto_1741930 ?auto_1741938 ) ) ( not ( = ?auto_1741930 ?auto_1741939 ) ) ( not ( = ?auto_1741930 ?auto_1741940 ) ) ( not ( = ?auto_1741930 ?auto_1741942 ) ) ( not ( = ?auto_1741931 ?auto_1741932 ) ) ( not ( = ?auto_1741931 ?auto_1741933 ) ) ( not ( = ?auto_1741931 ?auto_1741934 ) ) ( not ( = ?auto_1741931 ?auto_1741935 ) ) ( not ( = ?auto_1741931 ?auto_1741936 ) ) ( not ( = ?auto_1741931 ?auto_1741937 ) ) ( not ( = ?auto_1741931 ?auto_1741938 ) ) ( not ( = ?auto_1741931 ?auto_1741939 ) ) ( not ( = ?auto_1741931 ?auto_1741940 ) ) ( not ( = ?auto_1741931 ?auto_1741942 ) ) ( not ( = ?auto_1741932 ?auto_1741933 ) ) ( not ( = ?auto_1741932 ?auto_1741934 ) ) ( not ( = ?auto_1741932 ?auto_1741935 ) ) ( not ( = ?auto_1741932 ?auto_1741936 ) ) ( not ( = ?auto_1741932 ?auto_1741937 ) ) ( not ( = ?auto_1741932 ?auto_1741938 ) ) ( not ( = ?auto_1741932 ?auto_1741939 ) ) ( not ( = ?auto_1741932 ?auto_1741940 ) ) ( not ( = ?auto_1741932 ?auto_1741942 ) ) ( not ( = ?auto_1741933 ?auto_1741934 ) ) ( not ( = ?auto_1741933 ?auto_1741935 ) ) ( not ( = ?auto_1741933 ?auto_1741936 ) ) ( not ( = ?auto_1741933 ?auto_1741937 ) ) ( not ( = ?auto_1741933 ?auto_1741938 ) ) ( not ( = ?auto_1741933 ?auto_1741939 ) ) ( not ( = ?auto_1741933 ?auto_1741940 ) ) ( not ( = ?auto_1741933 ?auto_1741942 ) ) ( not ( = ?auto_1741934 ?auto_1741935 ) ) ( not ( = ?auto_1741934 ?auto_1741936 ) ) ( not ( = ?auto_1741934 ?auto_1741937 ) ) ( not ( = ?auto_1741934 ?auto_1741938 ) ) ( not ( = ?auto_1741934 ?auto_1741939 ) ) ( not ( = ?auto_1741934 ?auto_1741940 ) ) ( not ( = ?auto_1741934 ?auto_1741942 ) ) ( not ( = ?auto_1741935 ?auto_1741936 ) ) ( not ( = ?auto_1741935 ?auto_1741937 ) ) ( not ( = ?auto_1741935 ?auto_1741938 ) ) ( not ( = ?auto_1741935 ?auto_1741939 ) ) ( not ( = ?auto_1741935 ?auto_1741940 ) ) ( not ( = ?auto_1741935 ?auto_1741942 ) ) ( not ( = ?auto_1741936 ?auto_1741937 ) ) ( not ( = ?auto_1741936 ?auto_1741938 ) ) ( not ( = ?auto_1741936 ?auto_1741939 ) ) ( not ( = ?auto_1741936 ?auto_1741940 ) ) ( not ( = ?auto_1741936 ?auto_1741942 ) ) ( not ( = ?auto_1741937 ?auto_1741938 ) ) ( not ( = ?auto_1741937 ?auto_1741939 ) ) ( not ( = ?auto_1741937 ?auto_1741940 ) ) ( not ( = ?auto_1741937 ?auto_1741942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1741938 ?auto_1741939 ?auto_1741940 )
      ( MAKE-12CRATE-VERIFY ?auto_1741928 ?auto_1741929 ?auto_1741930 ?auto_1741931 ?auto_1741932 ?auto_1741933 ?auto_1741934 ?auto_1741935 ?auto_1741936 ?auto_1741937 ?auto_1741938 ?auto_1741939 ?auto_1741940 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1742091 - SURFACE
      ?auto_1742092 - SURFACE
      ?auto_1742093 - SURFACE
      ?auto_1742094 - SURFACE
      ?auto_1742095 - SURFACE
      ?auto_1742096 - SURFACE
      ?auto_1742097 - SURFACE
      ?auto_1742098 - SURFACE
      ?auto_1742099 - SURFACE
      ?auto_1742100 - SURFACE
      ?auto_1742101 - SURFACE
      ?auto_1742102 - SURFACE
      ?auto_1742103 - SURFACE
    )
    :vars
    (
      ?auto_1742108 - HOIST
      ?auto_1742105 - PLACE
      ?auto_1742107 - PLACE
      ?auto_1742109 - HOIST
      ?auto_1742104 - SURFACE
      ?auto_1742106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742108 ?auto_1742105 ) ( IS-CRATE ?auto_1742103 ) ( not ( = ?auto_1742102 ?auto_1742103 ) ) ( not ( = ?auto_1742101 ?auto_1742102 ) ) ( not ( = ?auto_1742101 ?auto_1742103 ) ) ( not ( = ?auto_1742107 ?auto_1742105 ) ) ( HOIST-AT ?auto_1742109 ?auto_1742107 ) ( not ( = ?auto_1742108 ?auto_1742109 ) ) ( AVAILABLE ?auto_1742109 ) ( SURFACE-AT ?auto_1742103 ?auto_1742107 ) ( ON ?auto_1742103 ?auto_1742104 ) ( CLEAR ?auto_1742103 ) ( not ( = ?auto_1742102 ?auto_1742104 ) ) ( not ( = ?auto_1742103 ?auto_1742104 ) ) ( not ( = ?auto_1742101 ?auto_1742104 ) ) ( TRUCK-AT ?auto_1742106 ?auto_1742105 ) ( SURFACE-AT ?auto_1742101 ?auto_1742105 ) ( CLEAR ?auto_1742101 ) ( IS-CRATE ?auto_1742102 ) ( AVAILABLE ?auto_1742108 ) ( IN ?auto_1742102 ?auto_1742106 ) ( ON ?auto_1742092 ?auto_1742091 ) ( ON ?auto_1742093 ?auto_1742092 ) ( ON ?auto_1742094 ?auto_1742093 ) ( ON ?auto_1742095 ?auto_1742094 ) ( ON ?auto_1742096 ?auto_1742095 ) ( ON ?auto_1742097 ?auto_1742096 ) ( ON ?auto_1742098 ?auto_1742097 ) ( ON ?auto_1742099 ?auto_1742098 ) ( ON ?auto_1742100 ?auto_1742099 ) ( ON ?auto_1742101 ?auto_1742100 ) ( not ( = ?auto_1742091 ?auto_1742092 ) ) ( not ( = ?auto_1742091 ?auto_1742093 ) ) ( not ( = ?auto_1742091 ?auto_1742094 ) ) ( not ( = ?auto_1742091 ?auto_1742095 ) ) ( not ( = ?auto_1742091 ?auto_1742096 ) ) ( not ( = ?auto_1742091 ?auto_1742097 ) ) ( not ( = ?auto_1742091 ?auto_1742098 ) ) ( not ( = ?auto_1742091 ?auto_1742099 ) ) ( not ( = ?auto_1742091 ?auto_1742100 ) ) ( not ( = ?auto_1742091 ?auto_1742101 ) ) ( not ( = ?auto_1742091 ?auto_1742102 ) ) ( not ( = ?auto_1742091 ?auto_1742103 ) ) ( not ( = ?auto_1742091 ?auto_1742104 ) ) ( not ( = ?auto_1742092 ?auto_1742093 ) ) ( not ( = ?auto_1742092 ?auto_1742094 ) ) ( not ( = ?auto_1742092 ?auto_1742095 ) ) ( not ( = ?auto_1742092 ?auto_1742096 ) ) ( not ( = ?auto_1742092 ?auto_1742097 ) ) ( not ( = ?auto_1742092 ?auto_1742098 ) ) ( not ( = ?auto_1742092 ?auto_1742099 ) ) ( not ( = ?auto_1742092 ?auto_1742100 ) ) ( not ( = ?auto_1742092 ?auto_1742101 ) ) ( not ( = ?auto_1742092 ?auto_1742102 ) ) ( not ( = ?auto_1742092 ?auto_1742103 ) ) ( not ( = ?auto_1742092 ?auto_1742104 ) ) ( not ( = ?auto_1742093 ?auto_1742094 ) ) ( not ( = ?auto_1742093 ?auto_1742095 ) ) ( not ( = ?auto_1742093 ?auto_1742096 ) ) ( not ( = ?auto_1742093 ?auto_1742097 ) ) ( not ( = ?auto_1742093 ?auto_1742098 ) ) ( not ( = ?auto_1742093 ?auto_1742099 ) ) ( not ( = ?auto_1742093 ?auto_1742100 ) ) ( not ( = ?auto_1742093 ?auto_1742101 ) ) ( not ( = ?auto_1742093 ?auto_1742102 ) ) ( not ( = ?auto_1742093 ?auto_1742103 ) ) ( not ( = ?auto_1742093 ?auto_1742104 ) ) ( not ( = ?auto_1742094 ?auto_1742095 ) ) ( not ( = ?auto_1742094 ?auto_1742096 ) ) ( not ( = ?auto_1742094 ?auto_1742097 ) ) ( not ( = ?auto_1742094 ?auto_1742098 ) ) ( not ( = ?auto_1742094 ?auto_1742099 ) ) ( not ( = ?auto_1742094 ?auto_1742100 ) ) ( not ( = ?auto_1742094 ?auto_1742101 ) ) ( not ( = ?auto_1742094 ?auto_1742102 ) ) ( not ( = ?auto_1742094 ?auto_1742103 ) ) ( not ( = ?auto_1742094 ?auto_1742104 ) ) ( not ( = ?auto_1742095 ?auto_1742096 ) ) ( not ( = ?auto_1742095 ?auto_1742097 ) ) ( not ( = ?auto_1742095 ?auto_1742098 ) ) ( not ( = ?auto_1742095 ?auto_1742099 ) ) ( not ( = ?auto_1742095 ?auto_1742100 ) ) ( not ( = ?auto_1742095 ?auto_1742101 ) ) ( not ( = ?auto_1742095 ?auto_1742102 ) ) ( not ( = ?auto_1742095 ?auto_1742103 ) ) ( not ( = ?auto_1742095 ?auto_1742104 ) ) ( not ( = ?auto_1742096 ?auto_1742097 ) ) ( not ( = ?auto_1742096 ?auto_1742098 ) ) ( not ( = ?auto_1742096 ?auto_1742099 ) ) ( not ( = ?auto_1742096 ?auto_1742100 ) ) ( not ( = ?auto_1742096 ?auto_1742101 ) ) ( not ( = ?auto_1742096 ?auto_1742102 ) ) ( not ( = ?auto_1742096 ?auto_1742103 ) ) ( not ( = ?auto_1742096 ?auto_1742104 ) ) ( not ( = ?auto_1742097 ?auto_1742098 ) ) ( not ( = ?auto_1742097 ?auto_1742099 ) ) ( not ( = ?auto_1742097 ?auto_1742100 ) ) ( not ( = ?auto_1742097 ?auto_1742101 ) ) ( not ( = ?auto_1742097 ?auto_1742102 ) ) ( not ( = ?auto_1742097 ?auto_1742103 ) ) ( not ( = ?auto_1742097 ?auto_1742104 ) ) ( not ( = ?auto_1742098 ?auto_1742099 ) ) ( not ( = ?auto_1742098 ?auto_1742100 ) ) ( not ( = ?auto_1742098 ?auto_1742101 ) ) ( not ( = ?auto_1742098 ?auto_1742102 ) ) ( not ( = ?auto_1742098 ?auto_1742103 ) ) ( not ( = ?auto_1742098 ?auto_1742104 ) ) ( not ( = ?auto_1742099 ?auto_1742100 ) ) ( not ( = ?auto_1742099 ?auto_1742101 ) ) ( not ( = ?auto_1742099 ?auto_1742102 ) ) ( not ( = ?auto_1742099 ?auto_1742103 ) ) ( not ( = ?auto_1742099 ?auto_1742104 ) ) ( not ( = ?auto_1742100 ?auto_1742101 ) ) ( not ( = ?auto_1742100 ?auto_1742102 ) ) ( not ( = ?auto_1742100 ?auto_1742103 ) ) ( not ( = ?auto_1742100 ?auto_1742104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742101 ?auto_1742102 ?auto_1742103 )
      ( MAKE-12CRATE-VERIFY ?auto_1742091 ?auto_1742092 ?auto_1742093 ?auto_1742094 ?auto_1742095 ?auto_1742096 ?auto_1742097 ?auto_1742098 ?auto_1742099 ?auto_1742100 ?auto_1742101 ?auto_1742102 ?auto_1742103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1742110 - SURFACE
      ?auto_1742111 - SURFACE
    )
    :vars
    (
      ?auto_1742117 - HOIST
      ?auto_1742114 - PLACE
      ?auto_1742112 - SURFACE
      ?auto_1742116 - PLACE
      ?auto_1742118 - HOIST
      ?auto_1742113 - SURFACE
      ?auto_1742115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742117 ?auto_1742114 ) ( IS-CRATE ?auto_1742111 ) ( not ( = ?auto_1742110 ?auto_1742111 ) ) ( not ( = ?auto_1742112 ?auto_1742110 ) ) ( not ( = ?auto_1742112 ?auto_1742111 ) ) ( not ( = ?auto_1742116 ?auto_1742114 ) ) ( HOIST-AT ?auto_1742118 ?auto_1742116 ) ( not ( = ?auto_1742117 ?auto_1742118 ) ) ( AVAILABLE ?auto_1742118 ) ( SURFACE-AT ?auto_1742111 ?auto_1742116 ) ( ON ?auto_1742111 ?auto_1742113 ) ( CLEAR ?auto_1742111 ) ( not ( = ?auto_1742110 ?auto_1742113 ) ) ( not ( = ?auto_1742111 ?auto_1742113 ) ) ( not ( = ?auto_1742112 ?auto_1742113 ) ) ( SURFACE-AT ?auto_1742112 ?auto_1742114 ) ( CLEAR ?auto_1742112 ) ( IS-CRATE ?auto_1742110 ) ( AVAILABLE ?auto_1742117 ) ( IN ?auto_1742110 ?auto_1742115 ) ( TRUCK-AT ?auto_1742115 ?auto_1742116 ) )
    :subtasks
    ( ( !DRIVE ?auto_1742115 ?auto_1742116 ?auto_1742114 )
      ( MAKE-2CRATE ?auto_1742112 ?auto_1742110 ?auto_1742111 )
      ( MAKE-1CRATE-VERIFY ?auto_1742110 ?auto_1742111 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1742119 - SURFACE
      ?auto_1742120 - SURFACE
      ?auto_1742121 - SURFACE
    )
    :vars
    (
      ?auto_1742126 - HOIST
      ?auto_1742123 - PLACE
      ?auto_1742122 - PLACE
      ?auto_1742124 - HOIST
      ?auto_1742125 - SURFACE
      ?auto_1742127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742126 ?auto_1742123 ) ( IS-CRATE ?auto_1742121 ) ( not ( = ?auto_1742120 ?auto_1742121 ) ) ( not ( = ?auto_1742119 ?auto_1742120 ) ) ( not ( = ?auto_1742119 ?auto_1742121 ) ) ( not ( = ?auto_1742122 ?auto_1742123 ) ) ( HOIST-AT ?auto_1742124 ?auto_1742122 ) ( not ( = ?auto_1742126 ?auto_1742124 ) ) ( AVAILABLE ?auto_1742124 ) ( SURFACE-AT ?auto_1742121 ?auto_1742122 ) ( ON ?auto_1742121 ?auto_1742125 ) ( CLEAR ?auto_1742121 ) ( not ( = ?auto_1742120 ?auto_1742125 ) ) ( not ( = ?auto_1742121 ?auto_1742125 ) ) ( not ( = ?auto_1742119 ?auto_1742125 ) ) ( SURFACE-AT ?auto_1742119 ?auto_1742123 ) ( CLEAR ?auto_1742119 ) ( IS-CRATE ?auto_1742120 ) ( AVAILABLE ?auto_1742126 ) ( IN ?auto_1742120 ?auto_1742127 ) ( TRUCK-AT ?auto_1742127 ?auto_1742122 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1742120 ?auto_1742121 )
      ( MAKE-2CRATE-VERIFY ?auto_1742119 ?auto_1742120 ?auto_1742121 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1742128 - SURFACE
      ?auto_1742129 - SURFACE
      ?auto_1742130 - SURFACE
      ?auto_1742131 - SURFACE
    )
    :vars
    (
      ?auto_1742135 - HOIST
      ?auto_1742133 - PLACE
      ?auto_1742134 - PLACE
      ?auto_1742136 - HOIST
      ?auto_1742137 - SURFACE
      ?auto_1742132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742135 ?auto_1742133 ) ( IS-CRATE ?auto_1742131 ) ( not ( = ?auto_1742130 ?auto_1742131 ) ) ( not ( = ?auto_1742129 ?auto_1742130 ) ) ( not ( = ?auto_1742129 ?auto_1742131 ) ) ( not ( = ?auto_1742134 ?auto_1742133 ) ) ( HOIST-AT ?auto_1742136 ?auto_1742134 ) ( not ( = ?auto_1742135 ?auto_1742136 ) ) ( AVAILABLE ?auto_1742136 ) ( SURFACE-AT ?auto_1742131 ?auto_1742134 ) ( ON ?auto_1742131 ?auto_1742137 ) ( CLEAR ?auto_1742131 ) ( not ( = ?auto_1742130 ?auto_1742137 ) ) ( not ( = ?auto_1742131 ?auto_1742137 ) ) ( not ( = ?auto_1742129 ?auto_1742137 ) ) ( SURFACE-AT ?auto_1742129 ?auto_1742133 ) ( CLEAR ?auto_1742129 ) ( IS-CRATE ?auto_1742130 ) ( AVAILABLE ?auto_1742135 ) ( IN ?auto_1742130 ?auto_1742132 ) ( TRUCK-AT ?auto_1742132 ?auto_1742134 ) ( ON ?auto_1742129 ?auto_1742128 ) ( not ( = ?auto_1742128 ?auto_1742129 ) ) ( not ( = ?auto_1742128 ?auto_1742130 ) ) ( not ( = ?auto_1742128 ?auto_1742131 ) ) ( not ( = ?auto_1742128 ?auto_1742137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742129 ?auto_1742130 ?auto_1742131 )
      ( MAKE-3CRATE-VERIFY ?auto_1742128 ?auto_1742129 ?auto_1742130 ?auto_1742131 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1742138 - SURFACE
      ?auto_1742139 - SURFACE
      ?auto_1742140 - SURFACE
      ?auto_1742141 - SURFACE
      ?auto_1742142 - SURFACE
    )
    :vars
    (
      ?auto_1742146 - HOIST
      ?auto_1742144 - PLACE
      ?auto_1742145 - PLACE
      ?auto_1742147 - HOIST
      ?auto_1742148 - SURFACE
      ?auto_1742143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742146 ?auto_1742144 ) ( IS-CRATE ?auto_1742142 ) ( not ( = ?auto_1742141 ?auto_1742142 ) ) ( not ( = ?auto_1742140 ?auto_1742141 ) ) ( not ( = ?auto_1742140 ?auto_1742142 ) ) ( not ( = ?auto_1742145 ?auto_1742144 ) ) ( HOIST-AT ?auto_1742147 ?auto_1742145 ) ( not ( = ?auto_1742146 ?auto_1742147 ) ) ( AVAILABLE ?auto_1742147 ) ( SURFACE-AT ?auto_1742142 ?auto_1742145 ) ( ON ?auto_1742142 ?auto_1742148 ) ( CLEAR ?auto_1742142 ) ( not ( = ?auto_1742141 ?auto_1742148 ) ) ( not ( = ?auto_1742142 ?auto_1742148 ) ) ( not ( = ?auto_1742140 ?auto_1742148 ) ) ( SURFACE-AT ?auto_1742140 ?auto_1742144 ) ( CLEAR ?auto_1742140 ) ( IS-CRATE ?auto_1742141 ) ( AVAILABLE ?auto_1742146 ) ( IN ?auto_1742141 ?auto_1742143 ) ( TRUCK-AT ?auto_1742143 ?auto_1742145 ) ( ON ?auto_1742139 ?auto_1742138 ) ( ON ?auto_1742140 ?auto_1742139 ) ( not ( = ?auto_1742138 ?auto_1742139 ) ) ( not ( = ?auto_1742138 ?auto_1742140 ) ) ( not ( = ?auto_1742138 ?auto_1742141 ) ) ( not ( = ?auto_1742138 ?auto_1742142 ) ) ( not ( = ?auto_1742138 ?auto_1742148 ) ) ( not ( = ?auto_1742139 ?auto_1742140 ) ) ( not ( = ?auto_1742139 ?auto_1742141 ) ) ( not ( = ?auto_1742139 ?auto_1742142 ) ) ( not ( = ?auto_1742139 ?auto_1742148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742140 ?auto_1742141 ?auto_1742142 )
      ( MAKE-4CRATE-VERIFY ?auto_1742138 ?auto_1742139 ?auto_1742140 ?auto_1742141 ?auto_1742142 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1742149 - SURFACE
      ?auto_1742150 - SURFACE
      ?auto_1742151 - SURFACE
      ?auto_1742152 - SURFACE
      ?auto_1742153 - SURFACE
      ?auto_1742154 - SURFACE
    )
    :vars
    (
      ?auto_1742158 - HOIST
      ?auto_1742156 - PLACE
      ?auto_1742157 - PLACE
      ?auto_1742159 - HOIST
      ?auto_1742160 - SURFACE
      ?auto_1742155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742158 ?auto_1742156 ) ( IS-CRATE ?auto_1742154 ) ( not ( = ?auto_1742153 ?auto_1742154 ) ) ( not ( = ?auto_1742152 ?auto_1742153 ) ) ( not ( = ?auto_1742152 ?auto_1742154 ) ) ( not ( = ?auto_1742157 ?auto_1742156 ) ) ( HOIST-AT ?auto_1742159 ?auto_1742157 ) ( not ( = ?auto_1742158 ?auto_1742159 ) ) ( AVAILABLE ?auto_1742159 ) ( SURFACE-AT ?auto_1742154 ?auto_1742157 ) ( ON ?auto_1742154 ?auto_1742160 ) ( CLEAR ?auto_1742154 ) ( not ( = ?auto_1742153 ?auto_1742160 ) ) ( not ( = ?auto_1742154 ?auto_1742160 ) ) ( not ( = ?auto_1742152 ?auto_1742160 ) ) ( SURFACE-AT ?auto_1742152 ?auto_1742156 ) ( CLEAR ?auto_1742152 ) ( IS-CRATE ?auto_1742153 ) ( AVAILABLE ?auto_1742158 ) ( IN ?auto_1742153 ?auto_1742155 ) ( TRUCK-AT ?auto_1742155 ?auto_1742157 ) ( ON ?auto_1742150 ?auto_1742149 ) ( ON ?auto_1742151 ?auto_1742150 ) ( ON ?auto_1742152 ?auto_1742151 ) ( not ( = ?auto_1742149 ?auto_1742150 ) ) ( not ( = ?auto_1742149 ?auto_1742151 ) ) ( not ( = ?auto_1742149 ?auto_1742152 ) ) ( not ( = ?auto_1742149 ?auto_1742153 ) ) ( not ( = ?auto_1742149 ?auto_1742154 ) ) ( not ( = ?auto_1742149 ?auto_1742160 ) ) ( not ( = ?auto_1742150 ?auto_1742151 ) ) ( not ( = ?auto_1742150 ?auto_1742152 ) ) ( not ( = ?auto_1742150 ?auto_1742153 ) ) ( not ( = ?auto_1742150 ?auto_1742154 ) ) ( not ( = ?auto_1742150 ?auto_1742160 ) ) ( not ( = ?auto_1742151 ?auto_1742152 ) ) ( not ( = ?auto_1742151 ?auto_1742153 ) ) ( not ( = ?auto_1742151 ?auto_1742154 ) ) ( not ( = ?auto_1742151 ?auto_1742160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742152 ?auto_1742153 ?auto_1742154 )
      ( MAKE-5CRATE-VERIFY ?auto_1742149 ?auto_1742150 ?auto_1742151 ?auto_1742152 ?auto_1742153 ?auto_1742154 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1742161 - SURFACE
      ?auto_1742162 - SURFACE
      ?auto_1742163 - SURFACE
      ?auto_1742164 - SURFACE
      ?auto_1742165 - SURFACE
      ?auto_1742166 - SURFACE
      ?auto_1742167 - SURFACE
    )
    :vars
    (
      ?auto_1742171 - HOIST
      ?auto_1742169 - PLACE
      ?auto_1742170 - PLACE
      ?auto_1742172 - HOIST
      ?auto_1742173 - SURFACE
      ?auto_1742168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742171 ?auto_1742169 ) ( IS-CRATE ?auto_1742167 ) ( not ( = ?auto_1742166 ?auto_1742167 ) ) ( not ( = ?auto_1742165 ?auto_1742166 ) ) ( not ( = ?auto_1742165 ?auto_1742167 ) ) ( not ( = ?auto_1742170 ?auto_1742169 ) ) ( HOIST-AT ?auto_1742172 ?auto_1742170 ) ( not ( = ?auto_1742171 ?auto_1742172 ) ) ( AVAILABLE ?auto_1742172 ) ( SURFACE-AT ?auto_1742167 ?auto_1742170 ) ( ON ?auto_1742167 ?auto_1742173 ) ( CLEAR ?auto_1742167 ) ( not ( = ?auto_1742166 ?auto_1742173 ) ) ( not ( = ?auto_1742167 ?auto_1742173 ) ) ( not ( = ?auto_1742165 ?auto_1742173 ) ) ( SURFACE-AT ?auto_1742165 ?auto_1742169 ) ( CLEAR ?auto_1742165 ) ( IS-CRATE ?auto_1742166 ) ( AVAILABLE ?auto_1742171 ) ( IN ?auto_1742166 ?auto_1742168 ) ( TRUCK-AT ?auto_1742168 ?auto_1742170 ) ( ON ?auto_1742162 ?auto_1742161 ) ( ON ?auto_1742163 ?auto_1742162 ) ( ON ?auto_1742164 ?auto_1742163 ) ( ON ?auto_1742165 ?auto_1742164 ) ( not ( = ?auto_1742161 ?auto_1742162 ) ) ( not ( = ?auto_1742161 ?auto_1742163 ) ) ( not ( = ?auto_1742161 ?auto_1742164 ) ) ( not ( = ?auto_1742161 ?auto_1742165 ) ) ( not ( = ?auto_1742161 ?auto_1742166 ) ) ( not ( = ?auto_1742161 ?auto_1742167 ) ) ( not ( = ?auto_1742161 ?auto_1742173 ) ) ( not ( = ?auto_1742162 ?auto_1742163 ) ) ( not ( = ?auto_1742162 ?auto_1742164 ) ) ( not ( = ?auto_1742162 ?auto_1742165 ) ) ( not ( = ?auto_1742162 ?auto_1742166 ) ) ( not ( = ?auto_1742162 ?auto_1742167 ) ) ( not ( = ?auto_1742162 ?auto_1742173 ) ) ( not ( = ?auto_1742163 ?auto_1742164 ) ) ( not ( = ?auto_1742163 ?auto_1742165 ) ) ( not ( = ?auto_1742163 ?auto_1742166 ) ) ( not ( = ?auto_1742163 ?auto_1742167 ) ) ( not ( = ?auto_1742163 ?auto_1742173 ) ) ( not ( = ?auto_1742164 ?auto_1742165 ) ) ( not ( = ?auto_1742164 ?auto_1742166 ) ) ( not ( = ?auto_1742164 ?auto_1742167 ) ) ( not ( = ?auto_1742164 ?auto_1742173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742165 ?auto_1742166 ?auto_1742167 )
      ( MAKE-6CRATE-VERIFY ?auto_1742161 ?auto_1742162 ?auto_1742163 ?auto_1742164 ?auto_1742165 ?auto_1742166 ?auto_1742167 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1742174 - SURFACE
      ?auto_1742175 - SURFACE
      ?auto_1742176 - SURFACE
      ?auto_1742177 - SURFACE
      ?auto_1742178 - SURFACE
      ?auto_1742179 - SURFACE
      ?auto_1742180 - SURFACE
      ?auto_1742181 - SURFACE
    )
    :vars
    (
      ?auto_1742185 - HOIST
      ?auto_1742183 - PLACE
      ?auto_1742184 - PLACE
      ?auto_1742186 - HOIST
      ?auto_1742187 - SURFACE
      ?auto_1742182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742185 ?auto_1742183 ) ( IS-CRATE ?auto_1742181 ) ( not ( = ?auto_1742180 ?auto_1742181 ) ) ( not ( = ?auto_1742179 ?auto_1742180 ) ) ( not ( = ?auto_1742179 ?auto_1742181 ) ) ( not ( = ?auto_1742184 ?auto_1742183 ) ) ( HOIST-AT ?auto_1742186 ?auto_1742184 ) ( not ( = ?auto_1742185 ?auto_1742186 ) ) ( AVAILABLE ?auto_1742186 ) ( SURFACE-AT ?auto_1742181 ?auto_1742184 ) ( ON ?auto_1742181 ?auto_1742187 ) ( CLEAR ?auto_1742181 ) ( not ( = ?auto_1742180 ?auto_1742187 ) ) ( not ( = ?auto_1742181 ?auto_1742187 ) ) ( not ( = ?auto_1742179 ?auto_1742187 ) ) ( SURFACE-AT ?auto_1742179 ?auto_1742183 ) ( CLEAR ?auto_1742179 ) ( IS-CRATE ?auto_1742180 ) ( AVAILABLE ?auto_1742185 ) ( IN ?auto_1742180 ?auto_1742182 ) ( TRUCK-AT ?auto_1742182 ?auto_1742184 ) ( ON ?auto_1742175 ?auto_1742174 ) ( ON ?auto_1742176 ?auto_1742175 ) ( ON ?auto_1742177 ?auto_1742176 ) ( ON ?auto_1742178 ?auto_1742177 ) ( ON ?auto_1742179 ?auto_1742178 ) ( not ( = ?auto_1742174 ?auto_1742175 ) ) ( not ( = ?auto_1742174 ?auto_1742176 ) ) ( not ( = ?auto_1742174 ?auto_1742177 ) ) ( not ( = ?auto_1742174 ?auto_1742178 ) ) ( not ( = ?auto_1742174 ?auto_1742179 ) ) ( not ( = ?auto_1742174 ?auto_1742180 ) ) ( not ( = ?auto_1742174 ?auto_1742181 ) ) ( not ( = ?auto_1742174 ?auto_1742187 ) ) ( not ( = ?auto_1742175 ?auto_1742176 ) ) ( not ( = ?auto_1742175 ?auto_1742177 ) ) ( not ( = ?auto_1742175 ?auto_1742178 ) ) ( not ( = ?auto_1742175 ?auto_1742179 ) ) ( not ( = ?auto_1742175 ?auto_1742180 ) ) ( not ( = ?auto_1742175 ?auto_1742181 ) ) ( not ( = ?auto_1742175 ?auto_1742187 ) ) ( not ( = ?auto_1742176 ?auto_1742177 ) ) ( not ( = ?auto_1742176 ?auto_1742178 ) ) ( not ( = ?auto_1742176 ?auto_1742179 ) ) ( not ( = ?auto_1742176 ?auto_1742180 ) ) ( not ( = ?auto_1742176 ?auto_1742181 ) ) ( not ( = ?auto_1742176 ?auto_1742187 ) ) ( not ( = ?auto_1742177 ?auto_1742178 ) ) ( not ( = ?auto_1742177 ?auto_1742179 ) ) ( not ( = ?auto_1742177 ?auto_1742180 ) ) ( not ( = ?auto_1742177 ?auto_1742181 ) ) ( not ( = ?auto_1742177 ?auto_1742187 ) ) ( not ( = ?auto_1742178 ?auto_1742179 ) ) ( not ( = ?auto_1742178 ?auto_1742180 ) ) ( not ( = ?auto_1742178 ?auto_1742181 ) ) ( not ( = ?auto_1742178 ?auto_1742187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742179 ?auto_1742180 ?auto_1742181 )
      ( MAKE-7CRATE-VERIFY ?auto_1742174 ?auto_1742175 ?auto_1742176 ?auto_1742177 ?auto_1742178 ?auto_1742179 ?auto_1742180 ?auto_1742181 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1742188 - SURFACE
      ?auto_1742189 - SURFACE
      ?auto_1742190 - SURFACE
      ?auto_1742191 - SURFACE
      ?auto_1742192 - SURFACE
      ?auto_1742193 - SURFACE
      ?auto_1742194 - SURFACE
      ?auto_1742195 - SURFACE
      ?auto_1742196 - SURFACE
    )
    :vars
    (
      ?auto_1742200 - HOIST
      ?auto_1742198 - PLACE
      ?auto_1742199 - PLACE
      ?auto_1742201 - HOIST
      ?auto_1742202 - SURFACE
      ?auto_1742197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742200 ?auto_1742198 ) ( IS-CRATE ?auto_1742196 ) ( not ( = ?auto_1742195 ?auto_1742196 ) ) ( not ( = ?auto_1742194 ?auto_1742195 ) ) ( not ( = ?auto_1742194 ?auto_1742196 ) ) ( not ( = ?auto_1742199 ?auto_1742198 ) ) ( HOIST-AT ?auto_1742201 ?auto_1742199 ) ( not ( = ?auto_1742200 ?auto_1742201 ) ) ( AVAILABLE ?auto_1742201 ) ( SURFACE-AT ?auto_1742196 ?auto_1742199 ) ( ON ?auto_1742196 ?auto_1742202 ) ( CLEAR ?auto_1742196 ) ( not ( = ?auto_1742195 ?auto_1742202 ) ) ( not ( = ?auto_1742196 ?auto_1742202 ) ) ( not ( = ?auto_1742194 ?auto_1742202 ) ) ( SURFACE-AT ?auto_1742194 ?auto_1742198 ) ( CLEAR ?auto_1742194 ) ( IS-CRATE ?auto_1742195 ) ( AVAILABLE ?auto_1742200 ) ( IN ?auto_1742195 ?auto_1742197 ) ( TRUCK-AT ?auto_1742197 ?auto_1742199 ) ( ON ?auto_1742189 ?auto_1742188 ) ( ON ?auto_1742190 ?auto_1742189 ) ( ON ?auto_1742191 ?auto_1742190 ) ( ON ?auto_1742192 ?auto_1742191 ) ( ON ?auto_1742193 ?auto_1742192 ) ( ON ?auto_1742194 ?auto_1742193 ) ( not ( = ?auto_1742188 ?auto_1742189 ) ) ( not ( = ?auto_1742188 ?auto_1742190 ) ) ( not ( = ?auto_1742188 ?auto_1742191 ) ) ( not ( = ?auto_1742188 ?auto_1742192 ) ) ( not ( = ?auto_1742188 ?auto_1742193 ) ) ( not ( = ?auto_1742188 ?auto_1742194 ) ) ( not ( = ?auto_1742188 ?auto_1742195 ) ) ( not ( = ?auto_1742188 ?auto_1742196 ) ) ( not ( = ?auto_1742188 ?auto_1742202 ) ) ( not ( = ?auto_1742189 ?auto_1742190 ) ) ( not ( = ?auto_1742189 ?auto_1742191 ) ) ( not ( = ?auto_1742189 ?auto_1742192 ) ) ( not ( = ?auto_1742189 ?auto_1742193 ) ) ( not ( = ?auto_1742189 ?auto_1742194 ) ) ( not ( = ?auto_1742189 ?auto_1742195 ) ) ( not ( = ?auto_1742189 ?auto_1742196 ) ) ( not ( = ?auto_1742189 ?auto_1742202 ) ) ( not ( = ?auto_1742190 ?auto_1742191 ) ) ( not ( = ?auto_1742190 ?auto_1742192 ) ) ( not ( = ?auto_1742190 ?auto_1742193 ) ) ( not ( = ?auto_1742190 ?auto_1742194 ) ) ( not ( = ?auto_1742190 ?auto_1742195 ) ) ( not ( = ?auto_1742190 ?auto_1742196 ) ) ( not ( = ?auto_1742190 ?auto_1742202 ) ) ( not ( = ?auto_1742191 ?auto_1742192 ) ) ( not ( = ?auto_1742191 ?auto_1742193 ) ) ( not ( = ?auto_1742191 ?auto_1742194 ) ) ( not ( = ?auto_1742191 ?auto_1742195 ) ) ( not ( = ?auto_1742191 ?auto_1742196 ) ) ( not ( = ?auto_1742191 ?auto_1742202 ) ) ( not ( = ?auto_1742192 ?auto_1742193 ) ) ( not ( = ?auto_1742192 ?auto_1742194 ) ) ( not ( = ?auto_1742192 ?auto_1742195 ) ) ( not ( = ?auto_1742192 ?auto_1742196 ) ) ( not ( = ?auto_1742192 ?auto_1742202 ) ) ( not ( = ?auto_1742193 ?auto_1742194 ) ) ( not ( = ?auto_1742193 ?auto_1742195 ) ) ( not ( = ?auto_1742193 ?auto_1742196 ) ) ( not ( = ?auto_1742193 ?auto_1742202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742194 ?auto_1742195 ?auto_1742196 )
      ( MAKE-8CRATE-VERIFY ?auto_1742188 ?auto_1742189 ?auto_1742190 ?auto_1742191 ?auto_1742192 ?auto_1742193 ?auto_1742194 ?auto_1742195 ?auto_1742196 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1742203 - SURFACE
      ?auto_1742204 - SURFACE
      ?auto_1742205 - SURFACE
      ?auto_1742206 - SURFACE
      ?auto_1742207 - SURFACE
      ?auto_1742208 - SURFACE
      ?auto_1742209 - SURFACE
      ?auto_1742210 - SURFACE
      ?auto_1742211 - SURFACE
      ?auto_1742212 - SURFACE
    )
    :vars
    (
      ?auto_1742216 - HOIST
      ?auto_1742214 - PLACE
      ?auto_1742215 - PLACE
      ?auto_1742217 - HOIST
      ?auto_1742218 - SURFACE
      ?auto_1742213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742216 ?auto_1742214 ) ( IS-CRATE ?auto_1742212 ) ( not ( = ?auto_1742211 ?auto_1742212 ) ) ( not ( = ?auto_1742210 ?auto_1742211 ) ) ( not ( = ?auto_1742210 ?auto_1742212 ) ) ( not ( = ?auto_1742215 ?auto_1742214 ) ) ( HOIST-AT ?auto_1742217 ?auto_1742215 ) ( not ( = ?auto_1742216 ?auto_1742217 ) ) ( AVAILABLE ?auto_1742217 ) ( SURFACE-AT ?auto_1742212 ?auto_1742215 ) ( ON ?auto_1742212 ?auto_1742218 ) ( CLEAR ?auto_1742212 ) ( not ( = ?auto_1742211 ?auto_1742218 ) ) ( not ( = ?auto_1742212 ?auto_1742218 ) ) ( not ( = ?auto_1742210 ?auto_1742218 ) ) ( SURFACE-AT ?auto_1742210 ?auto_1742214 ) ( CLEAR ?auto_1742210 ) ( IS-CRATE ?auto_1742211 ) ( AVAILABLE ?auto_1742216 ) ( IN ?auto_1742211 ?auto_1742213 ) ( TRUCK-AT ?auto_1742213 ?auto_1742215 ) ( ON ?auto_1742204 ?auto_1742203 ) ( ON ?auto_1742205 ?auto_1742204 ) ( ON ?auto_1742206 ?auto_1742205 ) ( ON ?auto_1742207 ?auto_1742206 ) ( ON ?auto_1742208 ?auto_1742207 ) ( ON ?auto_1742209 ?auto_1742208 ) ( ON ?auto_1742210 ?auto_1742209 ) ( not ( = ?auto_1742203 ?auto_1742204 ) ) ( not ( = ?auto_1742203 ?auto_1742205 ) ) ( not ( = ?auto_1742203 ?auto_1742206 ) ) ( not ( = ?auto_1742203 ?auto_1742207 ) ) ( not ( = ?auto_1742203 ?auto_1742208 ) ) ( not ( = ?auto_1742203 ?auto_1742209 ) ) ( not ( = ?auto_1742203 ?auto_1742210 ) ) ( not ( = ?auto_1742203 ?auto_1742211 ) ) ( not ( = ?auto_1742203 ?auto_1742212 ) ) ( not ( = ?auto_1742203 ?auto_1742218 ) ) ( not ( = ?auto_1742204 ?auto_1742205 ) ) ( not ( = ?auto_1742204 ?auto_1742206 ) ) ( not ( = ?auto_1742204 ?auto_1742207 ) ) ( not ( = ?auto_1742204 ?auto_1742208 ) ) ( not ( = ?auto_1742204 ?auto_1742209 ) ) ( not ( = ?auto_1742204 ?auto_1742210 ) ) ( not ( = ?auto_1742204 ?auto_1742211 ) ) ( not ( = ?auto_1742204 ?auto_1742212 ) ) ( not ( = ?auto_1742204 ?auto_1742218 ) ) ( not ( = ?auto_1742205 ?auto_1742206 ) ) ( not ( = ?auto_1742205 ?auto_1742207 ) ) ( not ( = ?auto_1742205 ?auto_1742208 ) ) ( not ( = ?auto_1742205 ?auto_1742209 ) ) ( not ( = ?auto_1742205 ?auto_1742210 ) ) ( not ( = ?auto_1742205 ?auto_1742211 ) ) ( not ( = ?auto_1742205 ?auto_1742212 ) ) ( not ( = ?auto_1742205 ?auto_1742218 ) ) ( not ( = ?auto_1742206 ?auto_1742207 ) ) ( not ( = ?auto_1742206 ?auto_1742208 ) ) ( not ( = ?auto_1742206 ?auto_1742209 ) ) ( not ( = ?auto_1742206 ?auto_1742210 ) ) ( not ( = ?auto_1742206 ?auto_1742211 ) ) ( not ( = ?auto_1742206 ?auto_1742212 ) ) ( not ( = ?auto_1742206 ?auto_1742218 ) ) ( not ( = ?auto_1742207 ?auto_1742208 ) ) ( not ( = ?auto_1742207 ?auto_1742209 ) ) ( not ( = ?auto_1742207 ?auto_1742210 ) ) ( not ( = ?auto_1742207 ?auto_1742211 ) ) ( not ( = ?auto_1742207 ?auto_1742212 ) ) ( not ( = ?auto_1742207 ?auto_1742218 ) ) ( not ( = ?auto_1742208 ?auto_1742209 ) ) ( not ( = ?auto_1742208 ?auto_1742210 ) ) ( not ( = ?auto_1742208 ?auto_1742211 ) ) ( not ( = ?auto_1742208 ?auto_1742212 ) ) ( not ( = ?auto_1742208 ?auto_1742218 ) ) ( not ( = ?auto_1742209 ?auto_1742210 ) ) ( not ( = ?auto_1742209 ?auto_1742211 ) ) ( not ( = ?auto_1742209 ?auto_1742212 ) ) ( not ( = ?auto_1742209 ?auto_1742218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742210 ?auto_1742211 ?auto_1742212 )
      ( MAKE-9CRATE-VERIFY ?auto_1742203 ?auto_1742204 ?auto_1742205 ?auto_1742206 ?auto_1742207 ?auto_1742208 ?auto_1742209 ?auto_1742210 ?auto_1742211 ?auto_1742212 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1742219 - SURFACE
      ?auto_1742220 - SURFACE
      ?auto_1742221 - SURFACE
      ?auto_1742222 - SURFACE
      ?auto_1742223 - SURFACE
      ?auto_1742224 - SURFACE
      ?auto_1742225 - SURFACE
      ?auto_1742226 - SURFACE
      ?auto_1742227 - SURFACE
      ?auto_1742228 - SURFACE
      ?auto_1742229 - SURFACE
    )
    :vars
    (
      ?auto_1742233 - HOIST
      ?auto_1742231 - PLACE
      ?auto_1742232 - PLACE
      ?auto_1742234 - HOIST
      ?auto_1742235 - SURFACE
      ?auto_1742230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742233 ?auto_1742231 ) ( IS-CRATE ?auto_1742229 ) ( not ( = ?auto_1742228 ?auto_1742229 ) ) ( not ( = ?auto_1742227 ?auto_1742228 ) ) ( not ( = ?auto_1742227 ?auto_1742229 ) ) ( not ( = ?auto_1742232 ?auto_1742231 ) ) ( HOIST-AT ?auto_1742234 ?auto_1742232 ) ( not ( = ?auto_1742233 ?auto_1742234 ) ) ( AVAILABLE ?auto_1742234 ) ( SURFACE-AT ?auto_1742229 ?auto_1742232 ) ( ON ?auto_1742229 ?auto_1742235 ) ( CLEAR ?auto_1742229 ) ( not ( = ?auto_1742228 ?auto_1742235 ) ) ( not ( = ?auto_1742229 ?auto_1742235 ) ) ( not ( = ?auto_1742227 ?auto_1742235 ) ) ( SURFACE-AT ?auto_1742227 ?auto_1742231 ) ( CLEAR ?auto_1742227 ) ( IS-CRATE ?auto_1742228 ) ( AVAILABLE ?auto_1742233 ) ( IN ?auto_1742228 ?auto_1742230 ) ( TRUCK-AT ?auto_1742230 ?auto_1742232 ) ( ON ?auto_1742220 ?auto_1742219 ) ( ON ?auto_1742221 ?auto_1742220 ) ( ON ?auto_1742222 ?auto_1742221 ) ( ON ?auto_1742223 ?auto_1742222 ) ( ON ?auto_1742224 ?auto_1742223 ) ( ON ?auto_1742225 ?auto_1742224 ) ( ON ?auto_1742226 ?auto_1742225 ) ( ON ?auto_1742227 ?auto_1742226 ) ( not ( = ?auto_1742219 ?auto_1742220 ) ) ( not ( = ?auto_1742219 ?auto_1742221 ) ) ( not ( = ?auto_1742219 ?auto_1742222 ) ) ( not ( = ?auto_1742219 ?auto_1742223 ) ) ( not ( = ?auto_1742219 ?auto_1742224 ) ) ( not ( = ?auto_1742219 ?auto_1742225 ) ) ( not ( = ?auto_1742219 ?auto_1742226 ) ) ( not ( = ?auto_1742219 ?auto_1742227 ) ) ( not ( = ?auto_1742219 ?auto_1742228 ) ) ( not ( = ?auto_1742219 ?auto_1742229 ) ) ( not ( = ?auto_1742219 ?auto_1742235 ) ) ( not ( = ?auto_1742220 ?auto_1742221 ) ) ( not ( = ?auto_1742220 ?auto_1742222 ) ) ( not ( = ?auto_1742220 ?auto_1742223 ) ) ( not ( = ?auto_1742220 ?auto_1742224 ) ) ( not ( = ?auto_1742220 ?auto_1742225 ) ) ( not ( = ?auto_1742220 ?auto_1742226 ) ) ( not ( = ?auto_1742220 ?auto_1742227 ) ) ( not ( = ?auto_1742220 ?auto_1742228 ) ) ( not ( = ?auto_1742220 ?auto_1742229 ) ) ( not ( = ?auto_1742220 ?auto_1742235 ) ) ( not ( = ?auto_1742221 ?auto_1742222 ) ) ( not ( = ?auto_1742221 ?auto_1742223 ) ) ( not ( = ?auto_1742221 ?auto_1742224 ) ) ( not ( = ?auto_1742221 ?auto_1742225 ) ) ( not ( = ?auto_1742221 ?auto_1742226 ) ) ( not ( = ?auto_1742221 ?auto_1742227 ) ) ( not ( = ?auto_1742221 ?auto_1742228 ) ) ( not ( = ?auto_1742221 ?auto_1742229 ) ) ( not ( = ?auto_1742221 ?auto_1742235 ) ) ( not ( = ?auto_1742222 ?auto_1742223 ) ) ( not ( = ?auto_1742222 ?auto_1742224 ) ) ( not ( = ?auto_1742222 ?auto_1742225 ) ) ( not ( = ?auto_1742222 ?auto_1742226 ) ) ( not ( = ?auto_1742222 ?auto_1742227 ) ) ( not ( = ?auto_1742222 ?auto_1742228 ) ) ( not ( = ?auto_1742222 ?auto_1742229 ) ) ( not ( = ?auto_1742222 ?auto_1742235 ) ) ( not ( = ?auto_1742223 ?auto_1742224 ) ) ( not ( = ?auto_1742223 ?auto_1742225 ) ) ( not ( = ?auto_1742223 ?auto_1742226 ) ) ( not ( = ?auto_1742223 ?auto_1742227 ) ) ( not ( = ?auto_1742223 ?auto_1742228 ) ) ( not ( = ?auto_1742223 ?auto_1742229 ) ) ( not ( = ?auto_1742223 ?auto_1742235 ) ) ( not ( = ?auto_1742224 ?auto_1742225 ) ) ( not ( = ?auto_1742224 ?auto_1742226 ) ) ( not ( = ?auto_1742224 ?auto_1742227 ) ) ( not ( = ?auto_1742224 ?auto_1742228 ) ) ( not ( = ?auto_1742224 ?auto_1742229 ) ) ( not ( = ?auto_1742224 ?auto_1742235 ) ) ( not ( = ?auto_1742225 ?auto_1742226 ) ) ( not ( = ?auto_1742225 ?auto_1742227 ) ) ( not ( = ?auto_1742225 ?auto_1742228 ) ) ( not ( = ?auto_1742225 ?auto_1742229 ) ) ( not ( = ?auto_1742225 ?auto_1742235 ) ) ( not ( = ?auto_1742226 ?auto_1742227 ) ) ( not ( = ?auto_1742226 ?auto_1742228 ) ) ( not ( = ?auto_1742226 ?auto_1742229 ) ) ( not ( = ?auto_1742226 ?auto_1742235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742227 ?auto_1742228 ?auto_1742229 )
      ( MAKE-10CRATE-VERIFY ?auto_1742219 ?auto_1742220 ?auto_1742221 ?auto_1742222 ?auto_1742223 ?auto_1742224 ?auto_1742225 ?auto_1742226 ?auto_1742227 ?auto_1742228 ?auto_1742229 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1742236 - SURFACE
      ?auto_1742237 - SURFACE
      ?auto_1742238 - SURFACE
      ?auto_1742239 - SURFACE
      ?auto_1742240 - SURFACE
      ?auto_1742241 - SURFACE
      ?auto_1742242 - SURFACE
      ?auto_1742243 - SURFACE
      ?auto_1742244 - SURFACE
      ?auto_1742245 - SURFACE
      ?auto_1742246 - SURFACE
      ?auto_1742247 - SURFACE
    )
    :vars
    (
      ?auto_1742251 - HOIST
      ?auto_1742249 - PLACE
      ?auto_1742250 - PLACE
      ?auto_1742252 - HOIST
      ?auto_1742253 - SURFACE
      ?auto_1742248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742251 ?auto_1742249 ) ( IS-CRATE ?auto_1742247 ) ( not ( = ?auto_1742246 ?auto_1742247 ) ) ( not ( = ?auto_1742245 ?auto_1742246 ) ) ( not ( = ?auto_1742245 ?auto_1742247 ) ) ( not ( = ?auto_1742250 ?auto_1742249 ) ) ( HOIST-AT ?auto_1742252 ?auto_1742250 ) ( not ( = ?auto_1742251 ?auto_1742252 ) ) ( AVAILABLE ?auto_1742252 ) ( SURFACE-AT ?auto_1742247 ?auto_1742250 ) ( ON ?auto_1742247 ?auto_1742253 ) ( CLEAR ?auto_1742247 ) ( not ( = ?auto_1742246 ?auto_1742253 ) ) ( not ( = ?auto_1742247 ?auto_1742253 ) ) ( not ( = ?auto_1742245 ?auto_1742253 ) ) ( SURFACE-AT ?auto_1742245 ?auto_1742249 ) ( CLEAR ?auto_1742245 ) ( IS-CRATE ?auto_1742246 ) ( AVAILABLE ?auto_1742251 ) ( IN ?auto_1742246 ?auto_1742248 ) ( TRUCK-AT ?auto_1742248 ?auto_1742250 ) ( ON ?auto_1742237 ?auto_1742236 ) ( ON ?auto_1742238 ?auto_1742237 ) ( ON ?auto_1742239 ?auto_1742238 ) ( ON ?auto_1742240 ?auto_1742239 ) ( ON ?auto_1742241 ?auto_1742240 ) ( ON ?auto_1742242 ?auto_1742241 ) ( ON ?auto_1742243 ?auto_1742242 ) ( ON ?auto_1742244 ?auto_1742243 ) ( ON ?auto_1742245 ?auto_1742244 ) ( not ( = ?auto_1742236 ?auto_1742237 ) ) ( not ( = ?auto_1742236 ?auto_1742238 ) ) ( not ( = ?auto_1742236 ?auto_1742239 ) ) ( not ( = ?auto_1742236 ?auto_1742240 ) ) ( not ( = ?auto_1742236 ?auto_1742241 ) ) ( not ( = ?auto_1742236 ?auto_1742242 ) ) ( not ( = ?auto_1742236 ?auto_1742243 ) ) ( not ( = ?auto_1742236 ?auto_1742244 ) ) ( not ( = ?auto_1742236 ?auto_1742245 ) ) ( not ( = ?auto_1742236 ?auto_1742246 ) ) ( not ( = ?auto_1742236 ?auto_1742247 ) ) ( not ( = ?auto_1742236 ?auto_1742253 ) ) ( not ( = ?auto_1742237 ?auto_1742238 ) ) ( not ( = ?auto_1742237 ?auto_1742239 ) ) ( not ( = ?auto_1742237 ?auto_1742240 ) ) ( not ( = ?auto_1742237 ?auto_1742241 ) ) ( not ( = ?auto_1742237 ?auto_1742242 ) ) ( not ( = ?auto_1742237 ?auto_1742243 ) ) ( not ( = ?auto_1742237 ?auto_1742244 ) ) ( not ( = ?auto_1742237 ?auto_1742245 ) ) ( not ( = ?auto_1742237 ?auto_1742246 ) ) ( not ( = ?auto_1742237 ?auto_1742247 ) ) ( not ( = ?auto_1742237 ?auto_1742253 ) ) ( not ( = ?auto_1742238 ?auto_1742239 ) ) ( not ( = ?auto_1742238 ?auto_1742240 ) ) ( not ( = ?auto_1742238 ?auto_1742241 ) ) ( not ( = ?auto_1742238 ?auto_1742242 ) ) ( not ( = ?auto_1742238 ?auto_1742243 ) ) ( not ( = ?auto_1742238 ?auto_1742244 ) ) ( not ( = ?auto_1742238 ?auto_1742245 ) ) ( not ( = ?auto_1742238 ?auto_1742246 ) ) ( not ( = ?auto_1742238 ?auto_1742247 ) ) ( not ( = ?auto_1742238 ?auto_1742253 ) ) ( not ( = ?auto_1742239 ?auto_1742240 ) ) ( not ( = ?auto_1742239 ?auto_1742241 ) ) ( not ( = ?auto_1742239 ?auto_1742242 ) ) ( not ( = ?auto_1742239 ?auto_1742243 ) ) ( not ( = ?auto_1742239 ?auto_1742244 ) ) ( not ( = ?auto_1742239 ?auto_1742245 ) ) ( not ( = ?auto_1742239 ?auto_1742246 ) ) ( not ( = ?auto_1742239 ?auto_1742247 ) ) ( not ( = ?auto_1742239 ?auto_1742253 ) ) ( not ( = ?auto_1742240 ?auto_1742241 ) ) ( not ( = ?auto_1742240 ?auto_1742242 ) ) ( not ( = ?auto_1742240 ?auto_1742243 ) ) ( not ( = ?auto_1742240 ?auto_1742244 ) ) ( not ( = ?auto_1742240 ?auto_1742245 ) ) ( not ( = ?auto_1742240 ?auto_1742246 ) ) ( not ( = ?auto_1742240 ?auto_1742247 ) ) ( not ( = ?auto_1742240 ?auto_1742253 ) ) ( not ( = ?auto_1742241 ?auto_1742242 ) ) ( not ( = ?auto_1742241 ?auto_1742243 ) ) ( not ( = ?auto_1742241 ?auto_1742244 ) ) ( not ( = ?auto_1742241 ?auto_1742245 ) ) ( not ( = ?auto_1742241 ?auto_1742246 ) ) ( not ( = ?auto_1742241 ?auto_1742247 ) ) ( not ( = ?auto_1742241 ?auto_1742253 ) ) ( not ( = ?auto_1742242 ?auto_1742243 ) ) ( not ( = ?auto_1742242 ?auto_1742244 ) ) ( not ( = ?auto_1742242 ?auto_1742245 ) ) ( not ( = ?auto_1742242 ?auto_1742246 ) ) ( not ( = ?auto_1742242 ?auto_1742247 ) ) ( not ( = ?auto_1742242 ?auto_1742253 ) ) ( not ( = ?auto_1742243 ?auto_1742244 ) ) ( not ( = ?auto_1742243 ?auto_1742245 ) ) ( not ( = ?auto_1742243 ?auto_1742246 ) ) ( not ( = ?auto_1742243 ?auto_1742247 ) ) ( not ( = ?auto_1742243 ?auto_1742253 ) ) ( not ( = ?auto_1742244 ?auto_1742245 ) ) ( not ( = ?auto_1742244 ?auto_1742246 ) ) ( not ( = ?auto_1742244 ?auto_1742247 ) ) ( not ( = ?auto_1742244 ?auto_1742253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742245 ?auto_1742246 ?auto_1742247 )
      ( MAKE-11CRATE-VERIFY ?auto_1742236 ?auto_1742237 ?auto_1742238 ?auto_1742239 ?auto_1742240 ?auto_1742241 ?auto_1742242 ?auto_1742243 ?auto_1742244 ?auto_1742245 ?auto_1742246 ?auto_1742247 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1742254 - SURFACE
      ?auto_1742255 - SURFACE
      ?auto_1742256 - SURFACE
      ?auto_1742257 - SURFACE
      ?auto_1742258 - SURFACE
      ?auto_1742259 - SURFACE
      ?auto_1742260 - SURFACE
      ?auto_1742261 - SURFACE
      ?auto_1742262 - SURFACE
      ?auto_1742263 - SURFACE
      ?auto_1742264 - SURFACE
      ?auto_1742265 - SURFACE
      ?auto_1742266 - SURFACE
    )
    :vars
    (
      ?auto_1742270 - HOIST
      ?auto_1742268 - PLACE
      ?auto_1742269 - PLACE
      ?auto_1742271 - HOIST
      ?auto_1742272 - SURFACE
      ?auto_1742267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742270 ?auto_1742268 ) ( IS-CRATE ?auto_1742266 ) ( not ( = ?auto_1742265 ?auto_1742266 ) ) ( not ( = ?auto_1742264 ?auto_1742265 ) ) ( not ( = ?auto_1742264 ?auto_1742266 ) ) ( not ( = ?auto_1742269 ?auto_1742268 ) ) ( HOIST-AT ?auto_1742271 ?auto_1742269 ) ( not ( = ?auto_1742270 ?auto_1742271 ) ) ( AVAILABLE ?auto_1742271 ) ( SURFACE-AT ?auto_1742266 ?auto_1742269 ) ( ON ?auto_1742266 ?auto_1742272 ) ( CLEAR ?auto_1742266 ) ( not ( = ?auto_1742265 ?auto_1742272 ) ) ( not ( = ?auto_1742266 ?auto_1742272 ) ) ( not ( = ?auto_1742264 ?auto_1742272 ) ) ( SURFACE-AT ?auto_1742264 ?auto_1742268 ) ( CLEAR ?auto_1742264 ) ( IS-CRATE ?auto_1742265 ) ( AVAILABLE ?auto_1742270 ) ( IN ?auto_1742265 ?auto_1742267 ) ( TRUCK-AT ?auto_1742267 ?auto_1742269 ) ( ON ?auto_1742255 ?auto_1742254 ) ( ON ?auto_1742256 ?auto_1742255 ) ( ON ?auto_1742257 ?auto_1742256 ) ( ON ?auto_1742258 ?auto_1742257 ) ( ON ?auto_1742259 ?auto_1742258 ) ( ON ?auto_1742260 ?auto_1742259 ) ( ON ?auto_1742261 ?auto_1742260 ) ( ON ?auto_1742262 ?auto_1742261 ) ( ON ?auto_1742263 ?auto_1742262 ) ( ON ?auto_1742264 ?auto_1742263 ) ( not ( = ?auto_1742254 ?auto_1742255 ) ) ( not ( = ?auto_1742254 ?auto_1742256 ) ) ( not ( = ?auto_1742254 ?auto_1742257 ) ) ( not ( = ?auto_1742254 ?auto_1742258 ) ) ( not ( = ?auto_1742254 ?auto_1742259 ) ) ( not ( = ?auto_1742254 ?auto_1742260 ) ) ( not ( = ?auto_1742254 ?auto_1742261 ) ) ( not ( = ?auto_1742254 ?auto_1742262 ) ) ( not ( = ?auto_1742254 ?auto_1742263 ) ) ( not ( = ?auto_1742254 ?auto_1742264 ) ) ( not ( = ?auto_1742254 ?auto_1742265 ) ) ( not ( = ?auto_1742254 ?auto_1742266 ) ) ( not ( = ?auto_1742254 ?auto_1742272 ) ) ( not ( = ?auto_1742255 ?auto_1742256 ) ) ( not ( = ?auto_1742255 ?auto_1742257 ) ) ( not ( = ?auto_1742255 ?auto_1742258 ) ) ( not ( = ?auto_1742255 ?auto_1742259 ) ) ( not ( = ?auto_1742255 ?auto_1742260 ) ) ( not ( = ?auto_1742255 ?auto_1742261 ) ) ( not ( = ?auto_1742255 ?auto_1742262 ) ) ( not ( = ?auto_1742255 ?auto_1742263 ) ) ( not ( = ?auto_1742255 ?auto_1742264 ) ) ( not ( = ?auto_1742255 ?auto_1742265 ) ) ( not ( = ?auto_1742255 ?auto_1742266 ) ) ( not ( = ?auto_1742255 ?auto_1742272 ) ) ( not ( = ?auto_1742256 ?auto_1742257 ) ) ( not ( = ?auto_1742256 ?auto_1742258 ) ) ( not ( = ?auto_1742256 ?auto_1742259 ) ) ( not ( = ?auto_1742256 ?auto_1742260 ) ) ( not ( = ?auto_1742256 ?auto_1742261 ) ) ( not ( = ?auto_1742256 ?auto_1742262 ) ) ( not ( = ?auto_1742256 ?auto_1742263 ) ) ( not ( = ?auto_1742256 ?auto_1742264 ) ) ( not ( = ?auto_1742256 ?auto_1742265 ) ) ( not ( = ?auto_1742256 ?auto_1742266 ) ) ( not ( = ?auto_1742256 ?auto_1742272 ) ) ( not ( = ?auto_1742257 ?auto_1742258 ) ) ( not ( = ?auto_1742257 ?auto_1742259 ) ) ( not ( = ?auto_1742257 ?auto_1742260 ) ) ( not ( = ?auto_1742257 ?auto_1742261 ) ) ( not ( = ?auto_1742257 ?auto_1742262 ) ) ( not ( = ?auto_1742257 ?auto_1742263 ) ) ( not ( = ?auto_1742257 ?auto_1742264 ) ) ( not ( = ?auto_1742257 ?auto_1742265 ) ) ( not ( = ?auto_1742257 ?auto_1742266 ) ) ( not ( = ?auto_1742257 ?auto_1742272 ) ) ( not ( = ?auto_1742258 ?auto_1742259 ) ) ( not ( = ?auto_1742258 ?auto_1742260 ) ) ( not ( = ?auto_1742258 ?auto_1742261 ) ) ( not ( = ?auto_1742258 ?auto_1742262 ) ) ( not ( = ?auto_1742258 ?auto_1742263 ) ) ( not ( = ?auto_1742258 ?auto_1742264 ) ) ( not ( = ?auto_1742258 ?auto_1742265 ) ) ( not ( = ?auto_1742258 ?auto_1742266 ) ) ( not ( = ?auto_1742258 ?auto_1742272 ) ) ( not ( = ?auto_1742259 ?auto_1742260 ) ) ( not ( = ?auto_1742259 ?auto_1742261 ) ) ( not ( = ?auto_1742259 ?auto_1742262 ) ) ( not ( = ?auto_1742259 ?auto_1742263 ) ) ( not ( = ?auto_1742259 ?auto_1742264 ) ) ( not ( = ?auto_1742259 ?auto_1742265 ) ) ( not ( = ?auto_1742259 ?auto_1742266 ) ) ( not ( = ?auto_1742259 ?auto_1742272 ) ) ( not ( = ?auto_1742260 ?auto_1742261 ) ) ( not ( = ?auto_1742260 ?auto_1742262 ) ) ( not ( = ?auto_1742260 ?auto_1742263 ) ) ( not ( = ?auto_1742260 ?auto_1742264 ) ) ( not ( = ?auto_1742260 ?auto_1742265 ) ) ( not ( = ?auto_1742260 ?auto_1742266 ) ) ( not ( = ?auto_1742260 ?auto_1742272 ) ) ( not ( = ?auto_1742261 ?auto_1742262 ) ) ( not ( = ?auto_1742261 ?auto_1742263 ) ) ( not ( = ?auto_1742261 ?auto_1742264 ) ) ( not ( = ?auto_1742261 ?auto_1742265 ) ) ( not ( = ?auto_1742261 ?auto_1742266 ) ) ( not ( = ?auto_1742261 ?auto_1742272 ) ) ( not ( = ?auto_1742262 ?auto_1742263 ) ) ( not ( = ?auto_1742262 ?auto_1742264 ) ) ( not ( = ?auto_1742262 ?auto_1742265 ) ) ( not ( = ?auto_1742262 ?auto_1742266 ) ) ( not ( = ?auto_1742262 ?auto_1742272 ) ) ( not ( = ?auto_1742263 ?auto_1742264 ) ) ( not ( = ?auto_1742263 ?auto_1742265 ) ) ( not ( = ?auto_1742263 ?auto_1742266 ) ) ( not ( = ?auto_1742263 ?auto_1742272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742264 ?auto_1742265 ?auto_1742266 )
      ( MAKE-12CRATE-VERIFY ?auto_1742254 ?auto_1742255 ?auto_1742256 ?auto_1742257 ?auto_1742258 ?auto_1742259 ?auto_1742260 ?auto_1742261 ?auto_1742262 ?auto_1742263 ?auto_1742264 ?auto_1742265 ?auto_1742266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1742273 - SURFACE
      ?auto_1742274 - SURFACE
    )
    :vars
    (
      ?auto_1742279 - HOIST
      ?auto_1742277 - PLACE
      ?auto_1742275 - SURFACE
      ?auto_1742278 - PLACE
      ?auto_1742280 - HOIST
      ?auto_1742281 - SURFACE
      ?auto_1742276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742279 ?auto_1742277 ) ( IS-CRATE ?auto_1742274 ) ( not ( = ?auto_1742273 ?auto_1742274 ) ) ( not ( = ?auto_1742275 ?auto_1742273 ) ) ( not ( = ?auto_1742275 ?auto_1742274 ) ) ( not ( = ?auto_1742278 ?auto_1742277 ) ) ( HOIST-AT ?auto_1742280 ?auto_1742278 ) ( not ( = ?auto_1742279 ?auto_1742280 ) ) ( SURFACE-AT ?auto_1742274 ?auto_1742278 ) ( ON ?auto_1742274 ?auto_1742281 ) ( CLEAR ?auto_1742274 ) ( not ( = ?auto_1742273 ?auto_1742281 ) ) ( not ( = ?auto_1742274 ?auto_1742281 ) ) ( not ( = ?auto_1742275 ?auto_1742281 ) ) ( SURFACE-AT ?auto_1742275 ?auto_1742277 ) ( CLEAR ?auto_1742275 ) ( IS-CRATE ?auto_1742273 ) ( AVAILABLE ?auto_1742279 ) ( TRUCK-AT ?auto_1742276 ?auto_1742278 ) ( LIFTING ?auto_1742280 ?auto_1742273 ) )
    :subtasks
    ( ( !LOAD ?auto_1742280 ?auto_1742273 ?auto_1742276 ?auto_1742278 )
      ( MAKE-2CRATE ?auto_1742275 ?auto_1742273 ?auto_1742274 )
      ( MAKE-1CRATE-VERIFY ?auto_1742273 ?auto_1742274 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1742282 - SURFACE
      ?auto_1742283 - SURFACE
      ?auto_1742284 - SURFACE
    )
    :vars
    (
      ?auto_1742285 - HOIST
      ?auto_1742286 - PLACE
      ?auto_1742290 - PLACE
      ?auto_1742288 - HOIST
      ?auto_1742289 - SURFACE
      ?auto_1742287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742285 ?auto_1742286 ) ( IS-CRATE ?auto_1742284 ) ( not ( = ?auto_1742283 ?auto_1742284 ) ) ( not ( = ?auto_1742282 ?auto_1742283 ) ) ( not ( = ?auto_1742282 ?auto_1742284 ) ) ( not ( = ?auto_1742290 ?auto_1742286 ) ) ( HOIST-AT ?auto_1742288 ?auto_1742290 ) ( not ( = ?auto_1742285 ?auto_1742288 ) ) ( SURFACE-AT ?auto_1742284 ?auto_1742290 ) ( ON ?auto_1742284 ?auto_1742289 ) ( CLEAR ?auto_1742284 ) ( not ( = ?auto_1742283 ?auto_1742289 ) ) ( not ( = ?auto_1742284 ?auto_1742289 ) ) ( not ( = ?auto_1742282 ?auto_1742289 ) ) ( SURFACE-AT ?auto_1742282 ?auto_1742286 ) ( CLEAR ?auto_1742282 ) ( IS-CRATE ?auto_1742283 ) ( AVAILABLE ?auto_1742285 ) ( TRUCK-AT ?auto_1742287 ?auto_1742290 ) ( LIFTING ?auto_1742288 ?auto_1742283 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1742283 ?auto_1742284 )
      ( MAKE-2CRATE-VERIFY ?auto_1742282 ?auto_1742283 ?auto_1742284 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1742291 - SURFACE
      ?auto_1742292 - SURFACE
      ?auto_1742293 - SURFACE
      ?auto_1742294 - SURFACE
    )
    :vars
    (
      ?auto_1742297 - HOIST
      ?auto_1742296 - PLACE
      ?auto_1742299 - PLACE
      ?auto_1742298 - HOIST
      ?auto_1742300 - SURFACE
      ?auto_1742295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742297 ?auto_1742296 ) ( IS-CRATE ?auto_1742294 ) ( not ( = ?auto_1742293 ?auto_1742294 ) ) ( not ( = ?auto_1742292 ?auto_1742293 ) ) ( not ( = ?auto_1742292 ?auto_1742294 ) ) ( not ( = ?auto_1742299 ?auto_1742296 ) ) ( HOIST-AT ?auto_1742298 ?auto_1742299 ) ( not ( = ?auto_1742297 ?auto_1742298 ) ) ( SURFACE-AT ?auto_1742294 ?auto_1742299 ) ( ON ?auto_1742294 ?auto_1742300 ) ( CLEAR ?auto_1742294 ) ( not ( = ?auto_1742293 ?auto_1742300 ) ) ( not ( = ?auto_1742294 ?auto_1742300 ) ) ( not ( = ?auto_1742292 ?auto_1742300 ) ) ( SURFACE-AT ?auto_1742292 ?auto_1742296 ) ( CLEAR ?auto_1742292 ) ( IS-CRATE ?auto_1742293 ) ( AVAILABLE ?auto_1742297 ) ( TRUCK-AT ?auto_1742295 ?auto_1742299 ) ( LIFTING ?auto_1742298 ?auto_1742293 ) ( ON ?auto_1742292 ?auto_1742291 ) ( not ( = ?auto_1742291 ?auto_1742292 ) ) ( not ( = ?auto_1742291 ?auto_1742293 ) ) ( not ( = ?auto_1742291 ?auto_1742294 ) ) ( not ( = ?auto_1742291 ?auto_1742300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742292 ?auto_1742293 ?auto_1742294 )
      ( MAKE-3CRATE-VERIFY ?auto_1742291 ?auto_1742292 ?auto_1742293 ?auto_1742294 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1742301 - SURFACE
      ?auto_1742302 - SURFACE
      ?auto_1742303 - SURFACE
      ?auto_1742304 - SURFACE
      ?auto_1742305 - SURFACE
    )
    :vars
    (
      ?auto_1742308 - HOIST
      ?auto_1742307 - PLACE
      ?auto_1742310 - PLACE
      ?auto_1742309 - HOIST
      ?auto_1742311 - SURFACE
      ?auto_1742306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742308 ?auto_1742307 ) ( IS-CRATE ?auto_1742305 ) ( not ( = ?auto_1742304 ?auto_1742305 ) ) ( not ( = ?auto_1742303 ?auto_1742304 ) ) ( not ( = ?auto_1742303 ?auto_1742305 ) ) ( not ( = ?auto_1742310 ?auto_1742307 ) ) ( HOIST-AT ?auto_1742309 ?auto_1742310 ) ( not ( = ?auto_1742308 ?auto_1742309 ) ) ( SURFACE-AT ?auto_1742305 ?auto_1742310 ) ( ON ?auto_1742305 ?auto_1742311 ) ( CLEAR ?auto_1742305 ) ( not ( = ?auto_1742304 ?auto_1742311 ) ) ( not ( = ?auto_1742305 ?auto_1742311 ) ) ( not ( = ?auto_1742303 ?auto_1742311 ) ) ( SURFACE-AT ?auto_1742303 ?auto_1742307 ) ( CLEAR ?auto_1742303 ) ( IS-CRATE ?auto_1742304 ) ( AVAILABLE ?auto_1742308 ) ( TRUCK-AT ?auto_1742306 ?auto_1742310 ) ( LIFTING ?auto_1742309 ?auto_1742304 ) ( ON ?auto_1742302 ?auto_1742301 ) ( ON ?auto_1742303 ?auto_1742302 ) ( not ( = ?auto_1742301 ?auto_1742302 ) ) ( not ( = ?auto_1742301 ?auto_1742303 ) ) ( not ( = ?auto_1742301 ?auto_1742304 ) ) ( not ( = ?auto_1742301 ?auto_1742305 ) ) ( not ( = ?auto_1742301 ?auto_1742311 ) ) ( not ( = ?auto_1742302 ?auto_1742303 ) ) ( not ( = ?auto_1742302 ?auto_1742304 ) ) ( not ( = ?auto_1742302 ?auto_1742305 ) ) ( not ( = ?auto_1742302 ?auto_1742311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742303 ?auto_1742304 ?auto_1742305 )
      ( MAKE-4CRATE-VERIFY ?auto_1742301 ?auto_1742302 ?auto_1742303 ?auto_1742304 ?auto_1742305 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1742312 - SURFACE
      ?auto_1742313 - SURFACE
      ?auto_1742314 - SURFACE
      ?auto_1742315 - SURFACE
      ?auto_1742316 - SURFACE
      ?auto_1742317 - SURFACE
    )
    :vars
    (
      ?auto_1742320 - HOIST
      ?auto_1742319 - PLACE
      ?auto_1742322 - PLACE
      ?auto_1742321 - HOIST
      ?auto_1742323 - SURFACE
      ?auto_1742318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742320 ?auto_1742319 ) ( IS-CRATE ?auto_1742317 ) ( not ( = ?auto_1742316 ?auto_1742317 ) ) ( not ( = ?auto_1742315 ?auto_1742316 ) ) ( not ( = ?auto_1742315 ?auto_1742317 ) ) ( not ( = ?auto_1742322 ?auto_1742319 ) ) ( HOIST-AT ?auto_1742321 ?auto_1742322 ) ( not ( = ?auto_1742320 ?auto_1742321 ) ) ( SURFACE-AT ?auto_1742317 ?auto_1742322 ) ( ON ?auto_1742317 ?auto_1742323 ) ( CLEAR ?auto_1742317 ) ( not ( = ?auto_1742316 ?auto_1742323 ) ) ( not ( = ?auto_1742317 ?auto_1742323 ) ) ( not ( = ?auto_1742315 ?auto_1742323 ) ) ( SURFACE-AT ?auto_1742315 ?auto_1742319 ) ( CLEAR ?auto_1742315 ) ( IS-CRATE ?auto_1742316 ) ( AVAILABLE ?auto_1742320 ) ( TRUCK-AT ?auto_1742318 ?auto_1742322 ) ( LIFTING ?auto_1742321 ?auto_1742316 ) ( ON ?auto_1742313 ?auto_1742312 ) ( ON ?auto_1742314 ?auto_1742313 ) ( ON ?auto_1742315 ?auto_1742314 ) ( not ( = ?auto_1742312 ?auto_1742313 ) ) ( not ( = ?auto_1742312 ?auto_1742314 ) ) ( not ( = ?auto_1742312 ?auto_1742315 ) ) ( not ( = ?auto_1742312 ?auto_1742316 ) ) ( not ( = ?auto_1742312 ?auto_1742317 ) ) ( not ( = ?auto_1742312 ?auto_1742323 ) ) ( not ( = ?auto_1742313 ?auto_1742314 ) ) ( not ( = ?auto_1742313 ?auto_1742315 ) ) ( not ( = ?auto_1742313 ?auto_1742316 ) ) ( not ( = ?auto_1742313 ?auto_1742317 ) ) ( not ( = ?auto_1742313 ?auto_1742323 ) ) ( not ( = ?auto_1742314 ?auto_1742315 ) ) ( not ( = ?auto_1742314 ?auto_1742316 ) ) ( not ( = ?auto_1742314 ?auto_1742317 ) ) ( not ( = ?auto_1742314 ?auto_1742323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742315 ?auto_1742316 ?auto_1742317 )
      ( MAKE-5CRATE-VERIFY ?auto_1742312 ?auto_1742313 ?auto_1742314 ?auto_1742315 ?auto_1742316 ?auto_1742317 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1742324 - SURFACE
      ?auto_1742325 - SURFACE
      ?auto_1742326 - SURFACE
      ?auto_1742327 - SURFACE
      ?auto_1742328 - SURFACE
      ?auto_1742329 - SURFACE
      ?auto_1742330 - SURFACE
    )
    :vars
    (
      ?auto_1742333 - HOIST
      ?auto_1742332 - PLACE
      ?auto_1742335 - PLACE
      ?auto_1742334 - HOIST
      ?auto_1742336 - SURFACE
      ?auto_1742331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742333 ?auto_1742332 ) ( IS-CRATE ?auto_1742330 ) ( not ( = ?auto_1742329 ?auto_1742330 ) ) ( not ( = ?auto_1742328 ?auto_1742329 ) ) ( not ( = ?auto_1742328 ?auto_1742330 ) ) ( not ( = ?auto_1742335 ?auto_1742332 ) ) ( HOIST-AT ?auto_1742334 ?auto_1742335 ) ( not ( = ?auto_1742333 ?auto_1742334 ) ) ( SURFACE-AT ?auto_1742330 ?auto_1742335 ) ( ON ?auto_1742330 ?auto_1742336 ) ( CLEAR ?auto_1742330 ) ( not ( = ?auto_1742329 ?auto_1742336 ) ) ( not ( = ?auto_1742330 ?auto_1742336 ) ) ( not ( = ?auto_1742328 ?auto_1742336 ) ) ( SURFACE-AT ?auto_1742328 ?auto_1742332 ) ( CLEAR ?auto_1742328 ) ( IS-CRATE ?auto_1742329 ) ( AVAILABLE ?auto_1742333 ) ( TRUCK-AT ?auto_1742331 ?auto_1742335 ) ( LIFTING ?auto_1742334 ?auto_1742329 ) ( ON ?auto_1742325 ?auto_1742324 ) ( ON ?auto_1742326 ?auto_1742325 ) ( ON ?auto_1742327 ?auto_1742326 ) ( ON ?auto_1742328 ?auto_1742327 ) ( not ( = ?auto_1742324 ?auto_1742325 ) ) ( not ( = ?auto_1742324 ?auto_1742326 ) ) ( not ( = ?auto_1742324 ?auto_1742327 ) ) ( not ( = ?auto_1742324 ?auto_1742328 ) ) ( not ( = ?auto_1742324 ?auto_1742329 ) ) ( not ( = ?auto_1742324 ?auto_1742330 ) ) ( not ( = ?auto_1742324 ?auto_1742336 ) ) ( not ( = ?auto_1742325 ?auto_1742326 ) ) ( not ( = ?auto_1742325 ?auto_1742327 ) ) ( not ( = ?auto_1742325 ?auto_1742328 ) ) ( not ( = ?auto_1742325 ?auto_1742329 ) ) ( not ( = ?auto_1742325 ?auto_1742330 ) ) ( not ( = ?auto_1742325 ?auto_1742336 ) ) ( not ( = ?auto_1742326 ?auto_1742327 ) ) ( not ( = ?auto_1742326 ?auto_1742328 ) ) ( not ( = ?auto_1742326 ?auto_1742329 ) ) ( not ( = ?auto_1742326 ?auto_1742330 ) ) ( not ( = ?auto_1742326 ?auto_1742336 ) ) ( not ( = ?auto_1742327 ?auto_1742328 ) ) ( not ( = ?auto_1742327 ?auto_1742329 ) ) ( not ( = ?auto_1742327 ?auto_1742330 ) ) ( not ( = ?auto_1742327 ?auto_1742336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742328 ?auto_1742329 ?auto_1742330 )
      ( MAKE-6CRATE-VERIFY ?auto_1742324 ?auto_1742325 ?auto_1742326 ?auto_1742327 ?auto_1742328 ?auto_1742329 ?auto_1742330 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1742337 - SURFACE
      ?auto_1742338 - SURFACE
      ?auto_1742339 - SURFACE
      ?auto_1742340 - SURFACE
      ?auto_1742341 - SURFACE
      ?auto_1742342 - SURFACE
      ?auto_1742343 - SURFACE
      ?auto_1742344 - SURFACE
    )
    :vars
    (
      ?auto_1742347 - HOIST
      ?auto_1742346 - PLACE
      ?auto_1742349 - PLACE
      ?auto_1742348 - HOIST
      ?auto_1742350 - SURFACE
      ?auto_1742345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742347 ?auto_1742346 ) ( IS-CRATE ?auto_1742344 ) ( not ( = ?auto_1742343 ?auto_1742344 ) ) ( not ( = ?auto_1742342 ?auto_1742343 ) ) ( not ( = ?auto_1742342 ?auto_1742344 ) ) ( not ( = ?auto_1742349 ?auto_1742346 ) ) ( HOIST-AT ?auto_1742348 ?auto_1742349 ) ( not ( = ?auto_1742347 ?auto_1742348 ) ) ( SURFACE-AT ?auto_1742344 ?auto_1742349 ) ( ON ?auto_1742344 ?auto_1742350 ) ( CLEAR ?auto_1742344 ) ( not ( = ?auto_1742343 ?auto_1742350 ) ) ( not ( = ?auto_1742344 ?auto_1742350 ) ) ( not ( = ?auto_1742342 ?auto_1742350 ) ) ( SURFACE-AT ?auto_1742342 ?auto_1742346 ) ( CLEAR ?auto_1742342 ) ( IS-CRATE ?auto_1742343 ) ( AVAILABLE ?auto_1742347 ) ( TRUCK-AT ?auto_1742345 ?auto_1742349 ) ( LIFTING ?auto_1742348 ?auto_1742343 ) ( ON ?auto_1742338 ?auto_1742337 ) ( ON ?auto_1742339 ?auto_1742338 ) ( ON ?auto_1742340 ?auto_1742339 ) ( ON ?auto_1742341 ?auto_1742340 ) ( ON ?auto_1742342 ?auto_1742341 ) ( not ( = ?auto_1742337 ?auto_1742338 ) ) ( not ( = ?auto_1742337 ?auto_1742339 ) ) ( not ( = ?auto_1742337 ?auto_1742340 ) ) ( not ( = ?auto_1742337 ?auto_1742341 ) ) ( not ( = ?auto_1742337 ?auto_1742342 ) ) ( not ( = ?auto_1742337 ?auto_1742343 ) ) ( not ( = ?auto_1742337 ?auto_1742344 ) ) ( not ( = ?auto_1742337 ?auto_1742350 ) ) ( not ( = ?auto_1742338 ?auto_1742339 ) ) ( not ( = ?auto_1742338 ?auto_1742340 ) ) ( not ( = ?auto_1742338 ?auto_1742341 ) ) ( not ( = ?auto_1742338 ?auto_1742342 ) ) ( not ( = ?auto_1742338 ?auto_1742343 ) ) ( not ( = ?auto_1742338 ?auto_1742344 ) ) ( not ( = ?auto_1742338 ?auto_1742350 ) ) ( not ( = ?auto_1742339 ?auto_1742340 ) ) ( not ( = ?auto_1742339 ?auto_1742341 ) ) ( not ( = ?auto_1742339 ?auto_1742342 ) ) ( not ( = ?auto_1742339 ?auto_1742343 ) ) ( not ( = ?auto_1742339 ?auto_1742344 ) ) ( not ( = ?auto_1742339 ?auto_1742350 ) ) ( not ( = ?auto_1742340 ?auto_1742341 ) ) ( not ( = ?auto_1742340 ?auto_1742342 ) ) ( not ( = ?auto_1742340 ?auto_1742343 ) ) ( not ( = ?auto_1742340 ?auto_1742344 ) ) ( not ( = ?auto_1742340 ?auto_1742350 ) ) ( not ( = ?auto_1742341 ?auto_1742342 ) ) ( not ( = ?auto_1742341 ?auto_1742343 ) ) ( not ( = ?auto_1742341 ?auto_1742344 ) ) ( not ( = ?auto_1742341 ?auto_1742350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742342 ?auto_1742343 ?auto_1742344 )
      ( MAKE-7CRATE-VERIFY ?auto_1742337 ?auto_1742338 ?auto_1742339 ?auto_1742340 ?auto_1742341 ?auto_1742342 ?auto_1742343 ?auto_1742344 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1742351 - SURFACE
      ?auto_1742352 - SURFACE
      ?auto_1742353 - SURFACE
      ?auto_1742354 - SURFACE
      ?auto_1742355 - SURFACE
      ?auto_1742356 - SURFACE
      ?auto_1742357 - SURFACE
      ?auto_1742358 - SURFACE
      ?auto_1742359 - SURFACE
    )
    :vars
    (
      ?auto_1742362 - HOIST
      ?auto_1742361 - PLACE
      ?auto_1742364 - PLACE
      ?auto_1742363 - HOIST
      ?auto_1742365 - SURFACE
      ?auto_1742360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742362 ?auto_1742361 ) ( IS-CRATE ?auto_1742359 ) ( not ( = ?auto_1742358 ?auto_1742359 ) ) ( not ( = ?auto_1742357 ?auto_1742358 ) ) ( not ( = ?auto_1742357 ?auto_1742359 ) ) ( not ( = ?auto_1742364 ?auto_1742361 ) ) ( HOIST-AT ?auto_1742363 ?auto_1742364 ) ( not ( = ?auto_1742362 ?auto_1742363 ) ) ( SURFACE-AT ?auto_1742359 ?auto_1742364 ) ( ON ?auto_1742359 ?auto_1742365 ) ( CLEAR ?auto_1742359 ) ( not ( = ?auto_1742358 ?auto_1742365 ) ) ( not ( = ?auto_1742359 ?auto_1742365 ) ) ( not ( = ?auto_1742357 ?auto_1742365 ) ) ( SURFACE-AT ?auto_1742357 ?auto_1742361 ) ( CLEAR ?auto_1742357 ) ( IS-CRATE ?auto_1742358 ) ( AVAILABLE ?auto_1742362 ) ( TRUCK-AT ?auto_1742360 ?auto_1742364 ) ( LIFTING ?auto_1742363 ?auto_1742358 ) ( ON ?auto_1742352 ?auto_1742351 ) ( ON ?auto_1742353 ?auto_1742352 ) ( ON ?auto_1742354 ?auto_1742353 ) ( ON ?auto_1742355 ?auto_1742354 ) ( ON ?auto_1742356 ?auto_1742355 ) ( ON ?auto_1742357 ?auto_1742356 ) ( not ( = ?auto_1742351 ?auto_1742352 ) ) ( not ( = ?auto_1742351 ?auto_1742353 ) ) ( not ( = ?auto_1742351 ?auto_1742354 ) ) ( not ( = ?auto_1742351 ?auto_1742355 ) ) ( not ( = ?auto_1742351 ?auto_1742356 ) ) ( not ( = ?auto_1742351 ?auto_1742357 ) ) ( not ( = ?auto_1742351 ?auto_1742358 ) ) ( not ( = ?auto_1742351 ?auto_1742359 ) ) ( not ( = ?auto_1742351 ?auto_1742365 ) ) ( not ( = ?auto_1742352 ?auto_1742353 ) ) ( not ( = ?auto_1742352 ?auto_1742354 ) ) ( not ( = ?auto_1742352 ?auto_1742355 ) ) ( not ( = ?auto_1742352 ?auto_1742356 ) ) ( not ( = ?auto_1742352 ?auto_1742357 ) ) ( not ( = ?auto_1742352 ?auto_1742358 ) ) ( not ( = ?auto_1742352 ?auto_1742359 ) ) ( not ( = ?auto_1742352 ?auto_1742365 ) ) ( not ( = ?auto_1742353 ?auto_1742354 ) ) ( not ( = ?auto_1742353 ?auto_1742355 ) ) ( not ( = ?auto_1742353 ?auto_1742356 ) ) ( not ( = ?auto_1742353 ?auto_1742357 ) ) ( not ( = ?auto_1742353 ?auto_1742358 ) ) ( not ( = ?auto_1742353 ?auto_1742359 ) ) ( not ( = ?auto_1742353 ?auto_1742365 ) ) ( not ( = ?auto_1742354 ?auto_1742355 ) ) ( not ( = ?auto_1742354 ?auto_1742356 ) ) ( not ( = ?auto_1742354 ?auto_1742357 ) ) ( not ( = ?auto_1742354 ?auto_1742358 ) ) ( not ( = ?auto_1742354 ?auto_1742359 ) ) ( not ( = ?auto_1742354 ?auto_1742365 ) ) ( not ( = ?auto_1742355 ?auto_1742356 ) ) ( not ( = ?auto_1742355 ?auto_1742357 ) ) ( not ( = ?auto_1742355 ?auto_1742358 ) ) ( not ( = ?auto_1742355 ?auto_1742359 ) ) ( not ( = ?auto_1742355 ?auto_1742365 ) ) ( not ( = ?auto_1742356 ?auto_1742357 ) ) ( not ( = ?auto_1742356 ?auto_1742358 ) ) ( not ( = ?auto_1742356 ?auto_1742359 ) ) ( not ( = ?auto_1742356 ?auto_1742365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742357 ?auto_1742358 ?auto_1742359 )
      ( MAKE-8CRATE-VERIFY ?auto_1742351 ?auto_1742352 ?auto_1742353 ?auto_1742354 ?auto_1742355 ?auto_1742356 ?auto_1742357 ?auto_1742358 ?auto_1742359 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1742366 - SURFACE
      ?auto_1742367 - SURFACE
      ?auto_1742368 - SURFACE
      ?auto_1742369 - SURFACE
      ?auto_1742370 - SURFACE
      ?auto_1742371 - SURFACE
      ?auto_1742372 - SURFACE
      ?auto_1742373 - SURFACE
      ?auto_1742374 - SURFACE
      ?auto_1742375 - SURFACE
    )
    :vars
    (
      ?auto_1742378 - HOIST
      ?auto_1742377 - PLACE
      ?auto_1742380 - PLACE
      ?auto_1742379 - HOIST
      ?auto_1742381 - SURFACE
      ?auto_1742376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742378 ?auto_1742377 ) ( IS-CRATE ?auto_1742375 ) ( not ( = ?auto_1742374 ?auto_1742375 ) ) ( not ( = ?auto_1742373 ?auto_1742374 ) ) ( not ( = ?auto_1742373 ?auto_1742375 ) ) ( not ( = ?auto_1742380 ?auto_1742377 ) ) ( HOIST-AT ?auto_1742379 ?auto_1742380 ) ( not ( = ?auto_1742378 ?auto_1742379 ) ) ( SURFACE-AT ?auto_1742375 ?auto_1742380 ) ( ON ?auto_1742375 ?auto_1742381 ) ( CLEAR ?auto_1742375 ) ( not ( = ?auto_1742374 ?auto_1742381 ) ) ( not ( = ?auto_1742375 ?auto_1742381 ) ) ( not ( = ?auto_1742373 ?auto_1742381 ) ) ( SURFACE-AT ?auto_1742373 ?auto_1742377 ) ( CLEAR ?auto_1742373 ) ( IS-CRATE ?auto_1742374 ) ( AVAILABLE ?auto_1742378 ) ( TRUCK-AT ?auto_1742376 ?auto_1742380 ) ( LIFTING ?auto_1742379 ?auto_1742374 ) ( ON ?auto_1742367 ?auto_1742366 ) ( ON ?auto_1742368 ?auto_1742367 ) ( ON ?auto_1742369 ?auto_1742368 ) ( ON ?auto_1742370 ?auto_1742369 ) ( ON ?auto_1742371 ?auto_1742370 ) ( ON ?auto_1742372 ?auto_1742371 ) ( ON ?auto_1742373 ?auto_1742372 ) ( not ( = ?auto_1742366 ?auto_1742367 ) ) ( not ( = ?auto_1742366 ?auto_1742368 ) ) ( not ( = ?auto_1742366 ?auto_1742369 ) ) ( not ( = ?auto_1742366 ?auto_1742370 ) ) ( not ( = ?auto_1742366 ?auto_1742371 ) ) ( not ( = ?auto_1742366 ?auto_1742372 ) ) ( not ( = ?auto_1742366 ?auto_1742373 ) ) ( not ( = ?auto_1742366 ?auto_1742374 ) ) ( not ( = ?auto_1742366 ?auto_1742375 ) ) ( not ( = ?auto_1742366 ?auto_1742381 ) ) ( not ( = ?auto_1742367 ?auto_1742368 ) ) ( not ( = ?auto_1742367 ?auto_1742369 ) ) ( not ( = ?auto_1742367 ?auto_1742370 ) ) ( not ( = ?auto_1742367 ?auto_1742371 ) ) ( not ( = ?auto_1742367 ?auto_1742372 ) ) ( not ( = ?auto_1742367 ?auto_1742373 ) ) ( not ( = ?auto_1742367 ?auto_1742374 ) ) ( not ( = ?auto_1742367 ?auto_1742375 ) ) ( not ( = ?auto_1742367 ?auto_1742381 ) ) ( not ( = ?auto_1742368 ?auto_1742369 ) ) ( not ( = ?auto_1742368 ?auto_1742370 ) ) ( not ( = ?auto_1742368 ?auto_1742371 ) ) ( not ( = ?auto_1742368 ?auto_1742372 ) ) ( not ( = ?auto_1742368 ?auto_1742373 ) ) ( not ( = ?auto_1742368 ?auto_1742374 ) ) ( not ( = ?auto_1742368 ?auto_1742375 ) ) ( not ( = ?auto_1742368 ?auto_1742381 ) ) ( not ( = ?auto_1742369 ?auto_1742370 ) ) ( not ( = ?auto_1742369 ?auto_1742371 ) ) ( not ( = ?auto_1742369 ?auto_1742372 ) ) ( not ( = ?auto_1742369 ?auto_1742373 ) ) ( not ( = ?auto_1742369 ?auto_1742374 ) ) ( not ( = ?auto_1742369 ?auto_1742375 ) ) ( not ( = ?auto_1742369 ?auto_1742381 ) ) ( not ( = ?auto_1742370 ?auto_1742371 ) ) ( not ( = ?auto_1742370 ?auto_1742372 ) ) ( not ( = ?auto_1742370 ?auto_1742373 ) ) ( not ( = ?auto_1742370 ?auto_1742374 ) ) ( not ( = ?auto_1742370 ?auto_1742375 ) ) ( not ( = ?auto_1742370 ?auto_1742381 ) ) ( not ( = ?auto_1742371 ?auto_1742372 ) ) ( not ( = ?auto_1742371 ?auto_1742373 ) ) ( not ( = ?auto_1742371 ?auto_1742374 ) ) ( not ( = ?auto_1742371 ?auto_1742375 ) ) ( not ( = ?auto_1742371 ?auto_1742381 ) ) ( not ( = ?auto_1742372 ?auto_1742373 ) ) ( not ( = ?auto_1742372 ?auto_1742374 ) ) ( not ( = ?auto_1742372 ?auto_1742375 ) ) ( not ( = ?auto_1742372 ?auto_1742381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742373 ?auto_1742374 ?auto_1742375 )
      ( MAKE-9CRATE-VERIFY ?auto_1742366 ?auto_1742367 ?auto_1742368 ?auto_1742369 ?auto_1742370 ?auto_1742371 ?auto_1742372 ?auto_1742373 ?auto_1742374 ?auto_1742375 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1742382 - SURFACE
      ?auto_1742383 - SURFACE
      ?auto_1742384 - SURFACE
      ?auto_1742385 - SURFACE
      ?auto_1742386 - SURFACE
      ?auto_1742387 - SURFACE
      ?auto_1742388 - SURFACE
      ?auto_1742389 - SURFACE
      ?auto_1742390 - SURFACE
      ?auto_1742391 - SURFACE
      ?auto_1742392 - SURFACE
    )
    :vars
    (
      ?auto_1742395 - HOIST
      ?auto_1742394 - PLACE
      ?auto_1742397 - PLACE
      ?auto_1742396 - HOIST
      ?auto_1742398 - SURFACE
      ?auto_1742393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742395 ?auto_1742394 ) ( IS-CRATE ?auto_1742392 ) ( not ( = ?auto_1742391 ?auto_1742392 ) ) ( not ( = ?auto_1742390 ?auto_1742391 ) ) ( not ( = ?auto_1742390 ?auto_1742392 ) ) ( not ( = ?auto_1742397 ?auto_1742394 ) ) ( HOIST-AT ?auto_1742396 ?auto_1742397 ) ( not ( = ?auto_1742395 ?auto_1742396 ) ) ( SURFACE-AT ?auto_1742392 ?auto_1742397 ) ( ON ?auto_1742392 ?auto_1742398 ) ( CLEAR ?auto_1742392 ) ( not ( = ?auto_1742391 ?auto_1742398 ) ) ( not ( = ?auto_1742392 ?auto_1742398 ) ) ( not ( = ?auto_1742390 ?auto_1742398 ) ) ( SURFACE-AT ?auto_1742390 ?auto_1742394 ) ( CLEAR ?auto_1742390 ) ( IS-CRATE ?auto_1742391 ) ( AVAILABLE ?auto_1742395 ) ( TRUCK-AT ?auto_1742393 ?auto_1742397 ) ( LIFTING ?auto_1742396 ?auto_1742391 ) ( ON ?auto_1742383 ?auto_1742382 ) ( ON ?auto_1742384 ?auto_1742383 ) ( ON ?auto_1742385 ?auto_1742384 ) ( ON ?auto_1742386 ?auto_1742385 ) ( ON ?auto_1742387 ?auto_1742386 ) ( ON ?auto_1742388 ?auto_1742387 ) ( ON ?auto_1742389 ?auto_1742388 ) ( ON ?auto_1742390 ?auto_1742389 ) ( not ( = ?auto_1742382 ?auto_1742383 ) ) ( not ( = ?auto_1742382 ?auto_1742384 ) ) ( not ( = ?auto_1742382 ?auto_1742385 ) ) ( not ( = ?auto_1742382 ?auto_1742386 ) ) ( not ( = ?auto_1742382 ?auto_1742387 ) ) ( not ( = ?auto_1742382 ?auto_1742388 ) ) ( not ( = ?auto_1742382 ?auto_1742389 ) ) ( not ( = ?auto_1742382 ?auto_1742390 ) ) ( not ( = ?auto_1742382 ?auto_1742391 ) ) ( not ( = ?auto_1742382 ?auto_1742392 ) ) ( not ( = ?auto_1742382 ?auto_1742398 ) ) ( not ( = ?auto_1742383 ?auto_1742384 ) ) ( not ( = ?auto_1742383 ?auto_1742385 ) ) ( not ( = ?auto_1742383 ?auto_1742386 ) ) ( not ( = ?auto_1742383 ?auto_1742387 ) ) ( not ( = ?auto_1742383 ?auto_1742388 ) ) ( not ( = ?auto_1742383 ?auto_1742389 ) ) ( not ( = ?auto_1742383 ?auto_1742390 ) ) ( not ( = ?auto_1742383 ?auto_1742391 ) ) ( not ( = ?auto_1742383 ?auto_1742392 ) ) ( not ( = ?auto_1742383 ?auto_1742398 ) ) ( not ( = ?auto_1742384 ?auto_1742385 ) ) ( not ( = ?auto_1742384 ?auto_1742386 ) ) ( not ( = ?auto_1742384 ?auto_1742387 ) ) ( not ( = ?auto_1742384 ?auto_1742388 ) ) ( not ( = ?auto_1742384 ?auto_1742389 ) ) ( not ( = ?auto_1742384 ?auto_1742390 ) ) ( not ( = ?auto_1742384 ?auto_1742391 ) ) ( not ( = ?auto_1742384 ?auto_1742392 ) ) ( not ( = ?auto_1742384 ?auto_1742398 ) ) ( not ( = ?auto_1742385 ?auto_1742386 ) ) ( not ( = ?auto_1742385 ?auto_1742387 ) ) ( not ( = ?auto_1742385 ?auto_1742388 ) ) ( not ( = ?auto_1742385 ?auto_1742389 ) ) ( not ( = ?auto_1742385 ?auto_1742390 ) ) ( not ( = ?auto_1742385 ?auto_1742391 ) ) ( not ( = ?auto_1742385 ?auto_1742392 ) ) ( not ( = ?auto_1742385 ?auto_1742398 ) ) ( not ( = ?auto_1742386 ?auto_1742387 ) ) ( not ( = ?auto_1742386 ?auto_1742388 ) ) ( not ( = ?auto_1742386 ?auto_1742389 ) ) ( not ( = ?auto_1742386 ?auto_1742390 ) ) ( not ( = ?auto_1742386 ?auto_1742391 ) ) ( not ( = ?auto_1742386 ?auto_1742392 ) ) ( not ( = ?auto_1742386 ?auto_1742398 ) ) ( not ( = ?auto_1742387 ?auto_1742388 ) ) ( not ( = ?auto_1742387 ?auto_1742389 ) ) ( not ( = ?auto_1742387 ?auto_1742390 ) ) ( not ( = ?auto_1742387 ?auto_1742391 ) ) ( not ( = ?auto_1742387 ?auto_1742392 ) ) ( not ( = ?auto_1742387 ?auto_1742398 ) ) ( not ( = ?auto_1742388 ?auto_1742389 ) ) ( not ( = ?auto_1742388 ?auto_1742390 ) ) ( not ( = ?auto_1742388 ?auto_1742391 ) ) ( not ( = ?auto_1742388 ?auto_1742392 ) ) ( not ( = ?auto_1742388 ?auto_1742398 ) ) ( not ( = ?auto_1742389 ?auto_1742390 ) ) ( not ( = ?auto_1742389 ?auto_1742391 ) ) ( not ( = ?auto_1742389 ?auto_1742392 ) ) ( not ( = ?auto_1742389 ?auto_1742398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742390 ?auto_1742391 ?auto_1742392 )
      ( MAKE-10CRATE-VERIFY ?auto_1742382 ?auto_1742383 ?auto_1742384 ?auto_1742385 ?auto_1742386 ?auto_1742387 ?auto_1742388 ?auto_1742389 ?auto_1742390 ?auto_1742391 ?auto_1742392 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1742399 - SURFACE
      ?auto_1742400 - SURFACE
      ?auto_1742401 - SURFACE
      ?auto_1742402 - SURFACE
      ?auto_1742403 - SURFACE
      ?auto_1742404 - SURFACE
      ?auto_1742405 - SURFACE
      ?auto_1742406 - SURFACE
      ?auto_1742407 - SURFACE
      ?auto_1742408 - SURFACE
      ?auto_1742409 - SURFACE
      ?auto_1742410 - SURFACE
    )
    :vars
    (
      ?auto_1742413 - HOIST
      ?auto_1742412 - PLACE
      ?auto_1742415 - PLACE
      ?auto_1742414 - HOIST
      ?auto_1742416 - SURFACE
      ?auto_1742411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742413 ?auto_1742412 ) ( IS-CRATE ?auto_1742410 ) ( not ( = ?auto_1742409 ?auto_1742410 ) ) ( not ( = ?auto_1742408 ?auto_1742409 ) ) ( not ( = ?auto_1742408 ?auto_1742410 ) ) ( not ( = ?auto_1742415 ?auto_1742412 ) ) ( HOIST-AT ?auto_1742414 ?auto_1742415 ) ( not ( = ?auto_1742413 ?auto_1742414 ) ) ( SURFACE-AT ?auto_1742410 ?auto_1742415 ) ( ON ?auto_1742410 ?auto_1742416 ) ( CLEAR ?auto_1742410 ) ( not ( = ?auto_1742409 ?auto_1742416 ) ) ( not ( = ?auto_1742410 ?auto_1742416 ) ) ( not ( = ?auto_1742408 ?auto_1742416 ) ) ( SURFACE-AT ?auto_1742408 ?auto_1742412 ) ( CLEAR ?auto_1742408 ) ( IS-CRATE ?auto_1742409 ) ( AVAILABLE ?auto_1742413 ) ( TRUCK-AT ?auto_1742411 ?auto_1742415 ) ( LIFTING ?auto_1742414 ?auto_1742409 ) ( ON ?auto_1742400 ?auto_1742399 ) ( ON ?auto_1742401 ?auto_1742400 ) ( ON ?auto_1742402 ?auto_1742401 ) ( ON ?auto_1742403 ?auto_1742402 ) ( ON ?auto_1742404 ?auto_1742403 ) ( ON ?auto_1742405 ?auto_1742404 ) ( ON ?auto_1742406 ?auto_1742405 ) ( ON ?auto_1742407 ?auto_1742406 ) ( ON ?auto_1742408 ?auto_1742407 ) ( not ( = ?auto_1742399 ?auto_1742400 ) ) ( not ( = ?auto_1742399 ?auto_1742401 ) ) ( not ( = ?auto_1742399 ?auto_1742402 ) ) ( not ( = ?auto_1742399 ?auto_1742403 ) ) ( not ( = ?auto_1742399 ?auto_1742404 ) ) ( not ( = ?auto_1742399 ?auto_1742405 ) ) ( not ( = ?auto_1742399 ?auto_1742406 ) ) ( not ( = ?auto_1742399 ?auto_1742407 ) ) ( not ( = ?auto_1742399 ?auto_1742408 ) ) ( not ( = ?auto_1742399 ?auto_1742409 ) ) ( not ( = ?auto_1742399 ?auto_1742410 ) ) ( not ( = ?auto_1742399 ?auto_1742416 ) ) ( not ( = ?auto_1742400 ?auto_1742401 ) ) ( not ( = ?auto_1742400 ?auto_1742402 ) ) ( not ( = ?auto_1742400 ?auto_1742403 ) ) ( not ( = ?auto_1742400 ?auto_1742404 ) ) ( not ( = ?auto_1742400 ?auto_1742405 ) ) ( not ( = ?auto_1742400 ?auto_1742406 ) ) ( not ( = ?auto_1742400 ?auto_1742407 ) ) ( not ( = ?auto_1742400 ?auto_1742408 ) ) ( not ( = ?auto_1742400 ?auto_1742409 ) ) ( not ( = ?auto_1742400 ?auto_1742410 ) ) ( not ( = ?auto_1742400 ?auto_1742416 ) ) ( not ( = ?auto_1742401 ?auto_1742402 ) ) ( not ( = ?auto_1742401 ?auto_1742403 ) ) ( not ( = ?auto_1742401 ?auto_1742404 ) ) ( not ( = ?auto_1742401 ?auto_1742405 ) ) ( not ( = ?auto_1742401 ?auto_1742406 ) ) ( not ( = ?auto_1742401 ?auto_1742407 ) ) ( not ( = ?auto_1742401 ?auto_1742408 ) ) ( not ( = ?auto_1742401 ?auto_1742409 ) ) ( not ( = ?auto_1742401 ?auto_1742410 ) ) ( not ( = ?auto_1742401 ?auto_1742416 ) ) ( not ( = ?auto_1742402 ?auto_1742403 ) ) ( not ( = ?auto_1742402 ?auto_1742404 ) ) ( not ( = ?auto_1742402 ?auto_1742405 ) ) ( not ( = ?auto_1742402 ?auto_1742406 ) ) ( not ( = ?auto_1742402 ?auto_1742407 ) ) ( not ( = ?auto_1742402 ?auto_1742408 ) ) ( not ( = ?auto_1742402 ?auto_1742409 ) ) ( not ( = ?auto_1742402 ?auto_1742410 ) ) ( not ( = ?auto_1742402 ?auto_1742416 ) ) ( not ( = ?auto_1742403 ?auto_1742404 ) ) ( not ( = ?auto_1742403 ?auto_1742405 ) ) ( not ( = ?auto_1742403 ?auto_1742406 ) ) ( not ( = ?auto_1742403 ?auto_1742407 ) ) ( not ( = ?auto_1742403 ?auto_1742408 ) ) ( not ( = ?auto_1742403 ?auto_1742409 ) ) ( not ( = ?auto_1742403 ?auto_1742410 ) ) ( not ( = ?auto_1742403 ?auto_1742416 ) ) ( not ( = ?auto_1742404 ?auto_1742405 ) ) ( not ( = ?auto_1742404 ?auto_1742406 ) ) ( not ( = ?auto_1742404 ?auto_1742407 ) ) ( not ( = ?auto_1742404 ?auto_1742408 ) ) ( not ( = ?auto_1742404 ?auto_1742409 ) ) ( not ( = ?auto_1742404 ?auto_1742410 ) ) ( not ( = ?auto_1742404 ?auto_1742416 ) ) ( not ( = ?auto_1742405 ?auto_1742406 ) ) ( not ( = ?auto_1742405 ?auto_1742407 ) ) ( not ( = ?auto_1742405 ?auto_1742408 ) ) ( not ( = ?auto_1742405 ?auto_1742409 ) ) ( not ( = ?auto_1742405 ?auto_1742410 ) ) ( not ( = ?auto_1742405 ?auto_1742416 ) ) ( not ( = ?auto_1742406 ?auto_1742407 ) ) ( not ( = ?auto_1742406 ?auto_1742408 ) ) ( not ( = ?auto_1742406 ?auto_1742409 ) ) ( not ( = ?auto_1742406 ?auto_1742410 ) ) ( not ( = ?auto_1742406 ?auto_1742416 ) ) ( not ( = ?auto_1742407 ?auto_1742408 ) ) ( not ( = ?auto_1742407 ?auto_1742409 ) ) ( not ( = ?auto_1742407 ?auto_1742410 ) ) ( not ( = ?auto_1742407 ?auto_1742416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742408 ?auto_1742409 ?auto_1742410 )
      ( MAKE-11CRATE-VERIFY ?auto_1742399 ?auto_1742400 ?auto_1742401 ?auto_1742402 ?auto_1742403 ?auto_1742404 ?auto_1742405 ?auto_1742406 ?auto_1742407 ?auto_1742408 ?auto_1742409 ?auto_1742410 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1742417 - SURFACE
      ?auto_1742418 - SURFACE
      ?auto_1742419 - SURFACE
      ?auto_1742420 - SURFACE
      ?auto_1742421 - SURFACE
      ?auto_1742422 - SURFACE
      ?auto_1742423 - SURFACE
      ?auto_1742424 - SURFACE
      ?auto_1742425 - SURFACE
      ?auto_1742426 - SURFACE
      ?auto_1742427 - SURFACE
      ?auto_1742428 - SURFACE
      ?auto_1742429 - SURFACE
    )
    :vars
    (
      ?auto_1742432 - HOIST
      ?auto_1742431 - PLACE
      ?auto_1742434 - PLACE
      ?auto_1742433 - HOIST
      ?auto_1742435 - SURFACE
      ?auto_1742430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742432 ?auto_1742431 ) ( IS-CRATE ?auto_1742429 ) ( not ( = ?auto_1742428 ?auto_1742429 ) ) ( not ( = ?auto_1742427 ?auto_1742428 ) ) ( not ( = ?auto_1742427 ?auto_1742429 ) ) ( not ( = ?auto_1742434 ?auto_1742431 ) ) ( HOIST-AT ?auto_1742433 ?auto_1742434 ) ( not ( = ?auto_1742432 ?auto_1742433 ) ) ( SURFACE-AT ?auto_1742429 ?auto_1742434 ) ( ON ?auto_1742429 ?auto_1742435 ) ( CLEAR ?auto_1742429 ) ( not ( = ?auto_1742428 ?auto_1742435 ) ) ( not ( = ?auto_1742429 ?auto_1742435 ) ) ( not ( = ?auto_1742427 ?auto_1742435 ) ) ( SURFACE-AT ?auto_1742427 ?auto_1742431 ) ( CLEAR ?auto_1742427 ) ( IS-CRATE ?auto_1742428 ) ( AVAILABLE ?auto_1742432 ) ( TRUCK-AT ?auto_1742430 ?auto_1742434 ) ( LIFTING ?auto_1742433 ?auto_1742428 ) ( ON ?auto_1742418 ?auto_1742417 ) ( ON ?auto_1742419 ?auto_1742418 ) ( ON ?auto_1742420 ?auto_1742419 ) ( ON ?auto_1742421 ?auto_1742420 ) ( ON ?auto_1742422 ?auto_1742421 ) ( ON ?auto_1742423 ?auto_1742422 ) ( ON ?auto_1742424 ?auto_1742423 ) ( ON ?auto_1742425 ?auto_1742424 ) ( ON ?auto_1742426 ?auto_1742425 ) ( ON ?auto_1742427 ?auto_1742426 ) ( not ( = ?auto_1742417 ?auto_1742418 ) ) ( not ( = ?auto_1742417 ?auto_1742419 ) ) ( not ( = ?auto_1742417 ?auto_1742420 ) ) ( not ( = ?auto_1742417 ?auto_1742421 ) ) ( not ( = ?auto_1742417 ?auto_1742422 ) ) ( not ( = ?auto_1742417 ?auto_1742423 ) ) ( not ( = ?auto_1742417 ?auto_1742424 ) ) ( not ( = ?auto_1742417 ?auto_1742425 ) ) ( not ( = ?auto_1742417 ?auto_1742426 ) ) ( not ( = ?auto_1742417 ?auto_1742427 ) ) ( not ( = ?auto_1742417 ?auto_1742428 ) ) ( not ( = ?auto_1742417 ?auto_1742429 ) ) ( not ( = ?auto_1742417 ?auto_1742435 ) ) ( not ( = ?auto_1742418 ?auto_1742419 ) ) ( not ( = ?auto_1742418 ?auto_1742420 ) ) ( not ( = ?auto_1742418 ?auto_1742421 ) ) ( not ( = ?auto_1742418 ?auto_1742422 ) ) ( not ( = ?auto_1742418 ?auto_1742423 ) ) ( not ( = ?auto_1742418 ?auto_1742424 ) ) ( not ( = ?auto_1742418 ?auto_1742425 ) ) ( not ( = ?auto_1742418 ?auto_1742426 ) ) ( not ( = ?auto_1742418 ?auto_1742427 ) ) ( not ( = ?auto_1742418 ?auto_1742428 ) ) ( not ( = ?auto_1742418 ?auto_1742429 ) ) ( not ( = ?auto_1742418 ?auto_1742435 ) ) ( not ( = ?auto_1742419 ?auto_1742420 ) ) ( not ( = ?auto_1742419 ?auto_1742421 ) ) ( not ( = ?auto_1742419 ?auto_1742422 ) ) ( not ( = ?auto_1742419 ?auto_1742423 ) ) ( not ( = ?auto_1742419 ?auto_1742424 ) ) ( not ( = ?auto_1742419 ?auto_1742425 ) ) ( not ( = ?auto_1742419 ?auto_1742426 ) ) ( not ( = ?auto_1742419 ?auto_1742427 ) ) ( not ( = ?auto_1742419 ?auto_1742428 ) ) ( not ( = ?auto_1742419 ?auto_1742429 ) ) ( not ( = ?auto_1742419 ?auto_1742435 ) ) ( not ( = ?auto_1742420 ?auto_1742421 ) ) ( not ( = ?auto_1742420 ?auto_1742422 ) ) ( not ( = ?auto_1742420 ?auto_1742423 ) ) ( not ( = ?auto_1742420 ?auto_1742424 ) ) ( not ( = ?auto_1742420 ?auto_1742425 ) ) ( not ( = ?auto_1742420 ?auto_1742426 ) ) ( not ( = ?auto_1742420 ?auto_1742427 ) ) ( not ( = ?auto_1742420 ?auto_1742428 ) ) ( not ( = ?auto_1742420 ?auto_1742429 ) ) ( not ( = ?auto_1742420 ?auto_1742435 ) ) ( not ( = ?auto_1742421 ?auto_1742422 ) ) ( not ( = ?auto_1742421 ?auto_1742423 ) ) ( not ( = ?auto_1742421 ?auto_1742424 ) ) ( not ( = ?auto_1742421 ?auto_1742425 ) ) ( not ( = ?auto_1742421 ?auto_1742426 ) ) ( not ( = ?auto_1742421 ?auto_1742427 ) ) ( not ( = ?auto_1742421 ?auto_1742428 ) ) ( not ( = ?auto_1742421 ?auto_1742429 ) ) ( not ( = ?auto_1742421 ?auto_1742435 ) ) ( not ( = ?auto_1742422 ?auto_1742423 ) ) ( not ( = ?auto_1742422 ?auto_1742424 ) ) ( not ( = ?auto_1742422 ?auto_1742425 ) ) ( not ( = ?auto_1742422 ?auto_1742426 ) ) ( not ( = ?auto_1742422 ?auto_1742427 ) ) ( not ( = ?auto_1742422 ?auto_1742428 ) ) ( not ( = ?auto_1742422 ?auto_1742429 ) ) ( not ( = ?auto_1742422 ?auto_1742435 ) ) ( not ( = ?auto_1742423 ?auto_1742424 ) ) ( not ( = ?auto_1742423 ?auto_1742425 ) ) ( not ( = ?auto_1742423 ?auto_1742426 ) ) ( not ( = ?auto_1742423 ?auto_1742427 ) ) ( not ( = ?auto_1742423 ?auto_1742428 ) ) ( not ( = ?auto_1742423 ?auto_1742429 ) ) ( not ( = ?auto_1742423 ?auto_1742435 ) ) ( not ( = ?auto_1742424 ?auto_1742425 ) ) ( not ( = ?auto_1742424 ?auto_1742426 ) ) ( not ( = ?auto_1742424 ?auto_1742427 ) ) ( not ( = ?auto_1742424 ?auto_1742428 ) ) ( not ( = ?auto_1742424 ?auto_1742429 ) ) ( not ( = ?auto_1742424 ?auto_1742435 ) ) ( not ( = ?auto_1742425 ?auto_1742426 ) ) ( not ( = ?auto_1742425 ?auto_1742427 ) ) ( not ( = ?auto_1742425 ?auto_1742428 ) ) ( not ( = ?auto_1742425 ?auto_1742429 ) ) ( not ( = ?auto_1742425 ?auto_1742435 ) ) ( not ( = ?auto_1742426 ?auto_1742427 ) ) ( not ( = ?auto_1742426 ?auto_1742428 ) ) ( not ( = ?auto_1742426 ?auto_1742429 ) ) ( not ( = ?auto_1742426 ?auto_1742435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742427 ?auto_1742428 ?auto_1742429 )
      ( MAKE-12CRATE-VERIFY ?auto_1742417 ?auto_1742418 ?auto_1742419 ?auto_1742420 ?auto_1742421 ?auto_1742422 ?auto_1742423 ?auto_1742424 ?auto_1742425 ?auto_1742426 ?auto_1742427 ?auto_1742428 ?auto_1742429 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1742436 - SURFACE
      ?auto_1742437 - SURFACE
    )
    :vars
    (
      ?auto_1742440 - HOIST
      ?auto_1742439 - PLACE
      ?auto_1742444 - SURFACE
      ?auto_1742442 - PLACE
      ?auto_1742441 - HOIST
      ?auto_1742443 - SURFACE
      ?auto_1742438 - TRUCK
      ?auto_1742445 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742440 ?auto_1742439 ) ( IS-CRATE ?auto_1742437 ) ( not ( = ?auto_1742436 ?auto_1742437 ) ) ( not ( = ?auto_1742444 ?auto_1742436 ) ) ( not ( = ?auto_1742444 ?auto_1742437 ) ) ( not ( = ?auto_1742442 ?auto_1742439 ) ) ( HOIST-AT ?auto_1742441 ?auto_1742442 ) ( not ( = ?auto_1742440 ?auto_1742441 ) ) ( SURFACE-AT ?auto_1742437 ?auto_1742442 ) ( ON ?auto_1742437 ?auto_1742443 ) ( CLEAR ?auto_1742437 ) ( not ( = ?auto_1742436 ?auto_1742443 ) ) ( not ( = ?auto_1742437 ?auto_1742443 ) ) ( not ( = ?auto_1742444 ?auto_1742443 ) ) ( SURFACE-AT ?auto_1742444 ?auto_1742439 ) ( CLEAR ?auto_1742444 ) ( IS-CRATE ?auto_1742436 ) ( AVAILABLE ?auto_1742440 ) ( TRUCK-AT ?auto_1742438 ?auto_1742442 ) ( AVAILABLE ?auto_1742441 ) ( SURFACE-AT ?auto_1742436 ?auto_1742442 ) ( ON ?auto_1742436 ?auto_1742445 ) ( CLEAR ?auto_1742436 ) ( not ( = ?auto_1742436 ?auto_1742445 ) ) ( not ( = ?auto_1742437 ?auto_1742445 ) ) ( not ( = ?auto_1742444 ?auto_1742445 ) ) ( not ( = ?auto_1742443 ?auto_1742445 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1742441 ?auto_1742436 ?auto_1742445 ?auto_1742442 )
      ( MAKE-2CRATE ?auto_1742444 ?auto_1742436 ?auto_1742437 )
      ( MAKE-1CRATE-VERIFY ?auto_1742436 ?auto_1742437 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1742446 - SURFACE
      ?auto_1742447 - SURFACE
      ?auto_1742448 - SURFACE
    )
    :vars
    (
      ?auto_1742451 - HOIST
      ?auto_1742450 - PLACE
      ?auto_1742455 - PLACE
      ?auto_1742454 - HOIST
      ?auto_1742449 - SURFACE
      ?auto_1742453 - TRUCK
      ?auto_1742452 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742451 ?auto_1742450 ) ( IS-CRATE ?auto_1742448 ) ( not ( = ?auto_1742447 ?auto_1742448 ) ) ( not ( = ?auto_1742446 ?auto_1742447 ) ) ( not ( = ?auto_1742446 ?auto_1742448 ) ) ( not ( = ?auto_1742455 ?auto_1742450 ) ) ( HOIST-AT ?auto_1742454 ?auto_1742455 ) ( not ( = ?auto_1742451 ?auto_1742454 ) ) ( SURFACE-AT ?auto_1742448 ?auto_1742455 ) ( ON ?auto_1742448 ?auto_1742449 ) ( CLEAR ?auto_1742448 ) ( not ( = ?auto_1742447 ?auto_1742449 ) ) ( not ( = ?auto_1742448 ?auto_1742449 ) ) ( not ( = ?auto_1742446 ?auto_1742449 ) ) ( SURFACE-AT ?auto_1742446 ?auto_1742450 ) ( CLEAR ?auto_1742446 ) ( IS-CRATE ?auto_1742447 ) ( AVAILABLE ?auto_1742451 ) ( TRUCK-AT ?auto_1742453 ?auto_1742455 ) ( AVAILABLE ?auto_1742454 ) ( SURFACE-AT ?auto_1742447 ?auto_1742455 ) ( ON ?auto_1742447 ?auto_1742452 ) ( CLEAR ?auto_1742447 ) ( not ( = ?auto_1742447 ?auto_1742452 ) ) ( not ( = ?auto_1742448 ?auto_1742452 ) ) ( not ( = ?auto_1742446 ?auto_1742452 ) ) ( not ( = ?auto_1742449 ?auto_1742452 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1742447 ?auto_1742448 )
      ( MAKE-2CRATE-VERIFY ?auto_1742446 ?auto_1742447 ?auto_1742448 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1742456 - SURFACE
      ?auto_1742457 - SURFACE
      ?auto_1742458 - SURFACE
      ?auto_1742459 - SURFACE
    )
    :vars
    (
      ?auto_1742464 - HOIST
      ?auto_1742465 - PLACE
      ?auto_1742462 - PLACE
      ?auto_1742466 - HOIST
      ?auto_1742461 - SURFACE
      ?auto_1742460 - TRUCK
      ?auto_1742463 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742464 ?auto_1742465 ) ( IS-CRATE ?auto_1742459 ) ( not ( = ?auto_1742458 ?auto_1742459 ) ) ( not ( = ?auto_1742457 ?auto_1742458 ) ) ( not ( = ?auto_1742457 ?auto_1742459 ) ) ( not ( = ?auto_1742462 ?auto_1742465 ) ) ( HOIST-AT ?auto_1742466 ?auto_1742462 ) ( not ( = ?auto_1742464 ?auto_1742466 ) ) ( SURFACE-AT ?auto_1742459 ?auto_1742462 ) ( ON ?auto_1742459 ?auto_1742461 ) ( CLEAR ?auto_1742459 ) ( not ( = ?auto_1742458 ?auto_1742461 ) ) ( not ( = ?auto_1742459 ?auto_1742461 ) ) ( not ( = ?auto_1742457 ?auto_1742461 ) ) ( SURFACE-AT ?auto_1742457 ?auto_1742465 ) ( CLEAR ?auto_1742457 ) ( IS-CRATE ?auto_1742458 ) ( AVAILABLE ?auto_1742464 ) ( TRUCK-AT ?auto_1742460 ?auto_1742462 ) ( AVAILABLE ?auto_1742466 ) ( SURFACE-AT ?auto_1742458 ?auto_1742462 ) ( ON ?auto_1742458 ?auto_1742463 ) ( CLEAR ?auto_1742458 ) ( not ( = ?auto_1742458 ?auto_1742463 ) ) ( not ( = ?auto_1742459 ?auto_1742463 ) ) ( not ( = ?auto_1742457 ?auto_1742463 ) ) ( not ( = ?auto_1742461 ?auto_1742463 ) ) ( ON ?auto_1742457 ?auto_1742456 ) ( not ( = ?auto_1742456 ?auto_1742457 ) ) ( not ( = ?auto_1742456 ?auto_1742458 ) ) ( not ( = ?auto_1742456 ?auto_1742459 ) ) ( not ( = ?auto_1742456 ?auto_1742461 ) ) ( not ( = ?auto_1742456 ?auto_1742463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742457 ?auto_1742458 ?auto_1742459 )
      ( MAKE-3CRATE-VERIFY ?auto_1742456 ?auto_1742457 ?auto_1742458 ?auto_1742459 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1742467 - SURFACE
      ?auto_1742468 - SURFACE
      ?auto_1742469 - SURFACE
      ?auto_1742470 - SURFACE
      ?auto_1742471 - SURFACE
    )
    :vars
    (
      ?auto_1742476 - HOIST
      ?auto_1742477 - PLACE
      ?auto_1742474 - PLACE
      ?auto_1742478 - HOIST
      ?auto_1742473 - SURFACE
      ?auto_1742472 - TRUCK
      ?auto_1742475 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742476 ?auto_1742477 ) ( IS-CRATE ?auto_1742471 ) ( not ( = ?auto_1742470 ?auto_1742471 ) ) ( not ( = ?auto_1742469 ?auto_1742470 ) ) ( not ( = ?auto_1742469 ?auto_1742471 ) ) ( not ( = ?auto_1742474 ?auto_1742477 ) ) ( HOIST-AT ?auto_1742478 ?auto_1742474 ) ( not ( = ?auto_1742476 ?auto_1742478 ) ) ( SURFACE-AT ?auto_1742471 ?auto_1742474 ) ( ON ?auto_1742471 ?auto_1742473 ) ( CLEAR ?auto_1742471 ) ( not ( = ?auto_1742470 ?auto_1742473 ) ) ( not ( = ?auto_1742471 ?auto_1742473 ) ) ( not ( = ?auto_1742469 ?auto_1742473 ) ) ( SURFACE-AT ?auto_1742469 ?auto_1742477 ) ( CLEAR ?auto_1742469 ) ( IS-CRATE ?auto_1742470 ) ( AVAILABLE ?auto_1742476 ) ( TRUCK-AT ?auto_1742472 ?auto_1742474 ) ( AVAILABLE ?auto_1742478 ) ( SURFACE-AT ?auto_1742470 ?auto_1742474 ) ( ON ?auto_1742470 ?auto_1742475 ) ( CLEAR ?auto_1742470 ) ( not ( = ?auto_1742470 ?auto_1742475 ) ) ( not ( = ?auto_1742471 ?auto_1742475 ) ) ( not ( = ?auto_1742469 ?auto_1742475 ) ) ( not ( = ?auto_1742473 ?auto_1742475 ) ) ( ON ?auto_1742468 ?auto_1742467 ) ( ON ?auto_1742469 ?auto_1742468 ) ( not ( = ?auto_1742467 ?auto_1742468 ) ) ( not ( = ?auto_1742467 ?auto_1742469 ) ) ( not ( = ?auto_1742467 ?auto_1742470 ) ) ( not ( = ?auto_1742467 ?auto_1742471 ) ) ( not ( = ?auto_1742467 ?auto_1742473 ) ) ( not ( = ?auto_1742467 ?auto_1742475 ) ) ( not ( = ?auto_1742468 ?auto_1742469 ) ) ( not ( = ?auto_1742468 ?auto_1742470 ) ) ( not ( = ?auto_1742468 ?auto_1742471 ) ) ( not ( = ?auto_1742468 ?auto_1742473 ) ) ( not ( = ?auto_1742468 ?auto_1742475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742469 ?auto_1742470 ?auto_1742471 )
      ( MAKE-4CRATE-VERIFY ?auto_1742467 ?auto_1742468 ?auto_1742469 ?auto_1742470 ?auto_1742471 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1742479 - SURFACE
      ?auto_1742480 - SURFACE
      ?auto_1742481 - SURFACE
      ?auto_1742482 - SURFACE
      ?auto_1742483 - SURFACE
      ?auto_1742484 - SURFACE
    )
    :vars
    (
      ?auto_1742489 - HOIST
      ?auto_1742490 - PLACE
      ?auto_1742487 - PLACE
      ?auto_1742491 - HOIST
      ?auto_1742486 - SURFACE
      ?auto_1742485 - TRUCK
      ?auto_1742488 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742489 ?auto_1742490 ) ( IS-CRATE ?auto_1742484 ) ( not ( = ?auto_1742483 ?auto_1742484 ) ) ( not ( = ?auto_1742482 ?auto_1742483 ) ) ( not ( = ?auto_1742482 ?auto_1742484 ) ) ( not ( = ?auto_1742487 ?auto_1742490 ) ) ( HOIST-AT ?auto_1742491 ?auto_1742487 ) ( not ( = ?auto_1742489 ?auto_1742491 ) ) ( SURFACE-AT ?auto_1742484 ?auto_1742487 ) ( ON ?auto_1742484 ?auto_1742486 ) ( CLEAR ?auto_1742484 ) ( not ( = ?auto_1742483 ?auto_1742486 ) ) ( not ( = ?auto_1742484 ?auto_1742486 ) ) ( not ( = ?auto_1742482 ?auto_1742486 ) ) ( SURFACE-AT ?auto_1742482 ?auto_1742490 ) ( CLEAR ?auto_1742482 ) ( IS-CRATE ?auto_1742483 ) ( AVAILABLE ?auto_1742489 ) ( TRUCK-AT ?auto_1742485 ?auto_1742487 ) ( AVAILABLE ?auto_1742491 ) ( SURFACE-AT ?auto_1742483 ?auto_1742487 ) ( ON ?auto_1742483 ?auto_1742488 ) ( CLEAR ?auto_1742483 ) ( not ( = ?auto_1742483 ?auto_1742488 ) ) ( not ( = ?auto_1742484 ?auto_1742488 ) ) ( not ( = ?auto_1742482 ?auto_1742488 ) ) ( not ( = ?auto_1742486 ?auto_1742488 ) ) ( ON ?auto_1742480 ?auto_1742479 ) ( ON ?auto_1742481 ?auto_1742480 ) ( ON ?auto_1742482 ?auto_1742481 ) ( not ( = ?auto_1742479 ?auto_1742480 ) ) ( not ( = ?auto_1742479 ?auto_1742481 ) ) ( not ( = ?auto_1742479 ?auto_1742482 ) ) ( not ( = ?auto_1742479 ?auto_1742483 ) ) ( not ( = ?auto_1742479 ?auto_1742484 ) ) ( not ( = ?auto_1742479 ?auto_1742486 ) ) ( not ( = ?auto_1742479 ?auto_1742488 ) ) ( not ( = ?auto_1742480 ?auto_1742481 ) ) ( not ( = ?auto_1742480 ?auto_1742482 ) ) ( not ( = ?auto_1742480 ?auto_1742483 ) ) ( not ( = ?auto_1742480 ?auto_1742484 ) ) ( not ( = ?auto_1742480 ?auto_1742486 ) ) ( not ( = ?auto_1742480 ?auto_1742488 ) ) ( not ( = ?auto_1742481 ?auto_1742482 ) ) ( not ( = ?auto_1742481 ?auto_1742483 ) ) ( not ( = ?auto_1742481 ?auto_1742484 ) ) ( not ( = ?auto_1742481 ?auto_1742486 ) ) ( not ( = ?auto_1742481 ?auto_1742488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742482 ?auto_1742483 ?auto_1742484 )
      ( MAKE-5CRATE-VERIFY ?auto_1742479 ?auto_1742480 ?auto_1742481 ?auto_1742482 ?auto_1742483 ?auto_1742484 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1742492 - SURFACE
      ?auto_1742493 - SURFACE
      ?auto_1742494 - SURFACE
      ?auto_1742495 - SURFACE
      ?auto_1742496 - SURFACE
      ?auto_1742497 - SURFACE
      ?auto_1742498 - SURFACE
    )
    :vars
    (
      ?auto_1742503 - HOIST
      ?auto_1742504 - PLACE
      ?auto_1742501 - PLACE
      ?auto_1742505 - HOIST
      ?auto_1742500 - SURFACE
      ?auto_1742499 - TRUCK
      ?auto_1742502 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742503 ?auto_1742504 ) ( IS-CRATE ?auto_1742498 ) ( not ( = ?auto_1742497 ?auto_1742498 ) ) ( not ( = ?auto_1742496 ?auto_1742497 ) ) ( not ( = ?auto_1742496 ?auto_1742498 ) ) ( not ( = ?auto_1742501 ?auto_1742504 ) ) ( HOIST-AT ?auto_1742505 ?auto_1742501 ) ( not ( = ?auto_1742503 ?auto_1742505 ) ) ( SURFACE-AT ?auto_1742498 ?auto_1742501 ) ( ON ?auto_1742498 ?auto_1742500 ) ( CLEAR ?auto_1742498 ) ( not ( = ?auto_1742497 ?auto_1742500 ) ) ( not ( = ?auto_1742498 ?auto_1742500 ) ) ( not ( = ?auto_1742496 ?auto_1742500 ) ) ( SURFACE-AT ?auto_1742496 ?auto_1742504 ) ( CLEAR ?auto_1742496 ) ( IS-CRATE ?auto_1742497 ) ( AVAILABLE ?auto_1742503 ) ( TRUCK-AT ?auto_1742499 ?auto_1742501 ) ( AVAILABLE ?auto_1742505 ) ( SURFACE-AT ?auto_1742497 ?auto_1742501 ) ( ON ?auto_1742497 ?auto_1742502 ) ( CLEAR ?auto_1742497 ) ( not ( = ?auto_1742497 ?auto_1742502 ) ) ( not ( = ?auto_1742498 ?auto_1742502 ) ) ( not ( = ?auto_1742496 ?auto_1742502 ) ) ( not ( = ?auto_1742500 ?auto_1742502 ) ) ( ON ?auto_1742493 ?auto_1742492 ) ( ON ?auto_1742494 ?auto_1742493 ) ( ON ?auto_1742495 ?auto_1742494 ) ( ON ?auto_1742496 ?auto_1742495 ) ( not ( = ?auto_1742492 ?auto_1742493 ) ) ( not ( = ?auto_1742492 ?auto_1742494 ) ) ( not ( = ?auto_1742492 ?auto_1742495 ) ) ( not ( = ?auto_1742492 ?auto_1742496 ) ) ( not ( = ?auto_1742492 ?auto_1742497 ) ) ( not ( = ?auto_1742492 ?auto_1742498 ) ) ( not ( = ?auto_1742492 ?auto_1742500 ) ) ( not ( = ?auto_1742492 ?auto_1742502 ) ) ( not ( = ?auto_1742493 ?auto_1742494 ) ) ( not ( = ?auto_1742493 ?auto_1742495 ) ) ( not ( = ?auto_1742493 ?auto_1742496 ) ) ( not ( = ?auto_1742493 ?auto_1742497 ) ) ( not ( = ?auto_1742493 ?auto_1742498 ) ) ( not ( = ?auto_1742493 ?auto_1742500 ) ) ( not ( = ?auto_1742493 ?auto_1742502 ) ) ( not ( = ?auto_1742494 ?auto_1742495 ) ) ( not ( = ?auto_1742494 ?auto_1742496 ) ) ( not ( = ?auto_1742494 ?auto_1742497 ) ) ( not ( = ?auto_1742494 ?auto_1742498 ) ) ( not ( = ?auto_1742494 ?auto_1742500 ) ) ( not ( = ?auto_1742494 ?auto_1742502 ) ) ( not ( = ?auto_1742495 ?auto_1742496 ) ) ( not ( = ?auto_1742495 ?auto_1742497 ) ) ( not ( = ?auto_1742495 ?auto_1742498 ) ) ( not ( = ?auto_1742495 ?auto_1742500 ) ) ( not ( = ?auto_1742495 ?auto_1742502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742496 ?auto_1742497 ?auto_1742498 )
      ( MAKE-6CRATE-VERIFY ?auto_1742492 ?auto_1742493 ?auto_1742494 ?auto_1742495 ?auto_1742496 ?auto_1742497 ?auto_1742498 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1742506 - SURFACE
      ?auto_1742507 - SURFACE
      ?auto_1742508 - SURFACE
      ?auto_1742509 - SURFACE
      ?auto_1742510 - SURFACE
      ?auto_1742511 - SURFACE
      ?auto_1742512 - SURFACE
      ?auto_1742513 - SURFACE
    )
    :vars
    (
      ?auto_1742518 - HOIST
      ?auto_1742519 - PLACE
      ?auto_1742516 - PLACE
      ?auto_1742520 - HOIST
      ?auto_1742515 - SURFACE
      ?auto_1742514 - TRUCK
      ?auto_1742517 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742518 ?auto_1742519 ) ( IS-CRATE ?auto_1742513 ) ( not ( = ?auto_1742512 ?auto_1742513 ) ) ( not ( = ?auto_1742511 ?auto_1742512 ) ) ( not ( = ?auto_1742511 ?auto_1742513 ) ) ( not ( = ?auto_1742516 ?auto_1742519 ) ) ( HOIST-AT ?auto_1742520 ?auto_1742516 ) ( not ( = ?auto_1742518 ?auto_1742520 ) ) ( SURFACE-AT ?auto_1742513 ?auto_1742516 ) ( ON ?auto_1742513 ?auto_1742515 ) ( CLEAR ?auto_1742513 ) ( not ( = ?auto_1742512 ?auto_1742515 ) ) ( not ( = ?auto_1742513 ?auto_1742515 ) ) ( not ( = ?auto_1742511 ?auto_1742515 ) ) ( SURFACE-AT ?auto_1742511 ?auto_1742519 ) ( CLEAR ?auto_1742511 ) ( IS-CRATE ?auto_1742512 ) ( AVAILABLE ?auto_1742518 ) ( TRUCK-AT ?auto_1742514 ?auto_1742516 ) ( AVAILABLE ?auto_1742520 ) ( SURFACE-AT ?auto_1742512 ?auto_1742516 ) ( ON ?auto_1742512 ?auto_1742517 ) ( CLEAR ?auto_1742512 ) ( not ( = ?auto_1742512 ?auto_1742517 ) ) ( not ( = ?auto_1742513 ?auto_1742517 ) ) ( not ( = ?auto_1742511 ?auto_1742517 ) ) ( not ( = ?auto_1742515 ?auto_1742517 ) ) ( ON ?auto_1742507 ?auto_1742506 ) ( ON ?auto_1742508 ?auto_1742507 ) ( ON ?auto_1742509 ?auto_1742508 ) ( ON ?auto_1742510 ?auto_1742509 ) ( ON ?auto_1742511 ?auto_1742510 ) ( not ( = ?auto_1742506 ?auto_1742507 ) ) ( not ( = ?auto_1742506 ?auto_1742508 ) ) ( not ( = ?auto_1742506 ?auto_1742509 ) ) ( not ( = ?auto_1742506 ?auto_1742510 ) ) ( not ( = ?auto_1742506 ?auto_1742511 ) ) ( not ( = ?auto_1742506 ?auto_1742512 ) ) ( not ( = ?auto_1742506 ?auto_1742513 ) ) ( not ( = ?auto_1742506 ?auto_1742515 ) ) ( not ( = ?auto_1742506 ?auto_1742517 ) ) ( not ( = ?auto_1742507 ?auto_1742508 ) ) ( not ( = ?auto_1742507 ?auto_1742509 ) ) ( not ( = ?auto_1742507 ?auto_1742510 ) ) ( not ( = ?auto_1742507 ?auto_1742511 ) ) ( not ( = ?auto_1742507 ?auto_1742512 ) ) ( not ( = ?auto_1742507 ?auto_1742513 ) ) ( not ( = ?auto_1742507 ?auto_1742515 ) ) ( not ( = ?auto_1742507 ?auto_1742517 ) ) ( not ( = ?auto_1742508 ?auto_1742509 ) ) ( not ( = ?auto_1742508 ?auto_1742510 ) ) ( not ( = ?auto_1742508 ?auto_1742511 ) ) ( not ( = ?auto_1742508 ?auto_1742512 ) ) ( not ( = ?auto_1742508 ?auto_1742513 ) ) ( not ( = ?auto_1742508 ?auto_1742515 ) ) ( not ( = ?auto_1742508 ?auto_1742517 ) ) ( not ( = ?auto_1742509 ?auto_1742510 ) ) ( not ( = ?auto_1742509 ?auto_1742511 ) ) ( not ( = ?auto_1742509 ?auto_1742512 ) ) ( not ( = ?auto_1742509 ?auto_1742513 ) ) ( not ( = ?auto_1742509 ?auto_1742515 ) ) ( not ( = ?auto_1742509 ?auto_1742517 ) ) ( not ( = ?auto_1742510 ?auto_1742511 ) ) ( not ( = ?auto_1742510 ?auto_1742512 ) ) ( not ( = ?auto_1742510 ?auto_1742513 ) ) ( not ( = ?auto_1742510 ?auto_1742515 ) ) ( not ( = ?auto_1742510 ?auto_1742517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742511 ?auto_1742512 ?auto_1742513 )
      ( MAKE-7CRATE-VERIFY ?auto_1742506 ?auto_1742507 ?auto_1742508 ?auto_1742509 ?auto_1742510 ?auto_1742511 ?auto_1742512 ?auto_1742513 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1742521 - SURFACE
      ?auto_1742522 - SURFACE
      ?auto_1742523 - SURFACE
      ?auto_1742524 - SURFACE
      ?auto_1742525 - SURFACE
      ?auto_1742526 - SURFACE
      ?auto_1742527 - SURFACE
      ?auto_1742528 - SURFACE
      ?auto_1742529 - SURFACE
    )
    :vars
    (
      ?auto_1742534 - HOIST
      ?auto_1742535 - PLACE
      ?auto_1742532 - PLACE
      ?auto_1742536 - HOIST
      ?auto_1742531 - SURFACE
      ?auto_1742530 - TRUCK
      ?auto_1742533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742534 ?auto_1742535 ) ( IS-CRATE ?auto_1742529 ) ( not ( = ?auto_1742528 ?auto_1742529 ) ) ( not ( = ?auto_1742527 ?auto_1742528 ) ) ( not ( = ?auto_1742527 ?auto_1742529 ) ) ( not ( = ?auto_1742532 ?auto_1742535 ) ) ( HOIST-AT ?auto_1742536 ?auto_1742532 ) ( not ( = ?auto_1742534 ?auto_1742536 ) ) ( SURFACE-AT ?auto_1742529 ?auto_1742532 ) ( ON ?auto_1742529 ?auto_1742531 ) ( CLEAR ?auto_1742529 ) ( not ( = ?auto_1742528 ?auto_1742531 ) ) ( not ( = ?auto_1742529 ?auto_1742531 ) ) ( not ( = ?auto_1742527 ?auto_1742531 ) ) ( SURFACE-AT ?auto_1742527 ?auto_1742535 ) ( CLEAR ?auto_1742527 ) ( IS-CRATE ?auto_1742528 ) ( AVAILABLE ?auto_1742534 ) ( TRUCK-AT ?auto_1742530 ?auto_1742532 ) ( AVAILABLE ?auto_1742536 ) ( SURFACE-AT ?auto_1742528 ?auto_1742532 ) ( ON ?auto_1742528 ?auto_1742533 ) ( CLEAR ?auto_1742528 ) ( not ( = ?auto_1742528 ?auto_1742533 ) ) ( not ( = ?auto_1742529 ?auto_1742533 ) ) ( not ( = ?auto_1742527 ?auto_1742533 ) ) ( not ( = ?auto_1742531 ?auto_1742533 ) ) ( ON ?auto_1742522 ?auto_1742521 ) ( ON ?auto_1742523 ?auto_1742522 ) ( ON ?auto_1742524 ?auto_1742523 ) ( ON ?auto_1742525 ?auto_1742524 ) ( ON ?auto_1742526 ?auto_1742525 ) ( ON ?auto_1742527 ?auto_1742526 ) ( not ( = ?auto_1742521 ?auto_1742522 ) ) ( not ( = ?auto_1742521 ?auto_1742523 ) ) ( not ( = ?auto_1742521 ?auto_1742524 ) ) ( not ( = ?auto_1742521 ?auto_1742525 ) ) ( not ( = ?auto_1742521 ?auto_1742526 ) ) ( not ( = ?auto_1742521 ?auto_1742527 ) ) ( not ( = ?auto_1742521 ?auto_1742528 ) ) ( not ( = ?auto_1742521 ?auto_1742529 ) ) ( not ( = ?auto_1742521 ?auto_1742531 ) ) ( not ( = ?auto_1742521 ?auto_1742533 ) ) ( not ( = ?auto_1742522 ?auto_1742523 ) ) ( not ( = ?auto_1742522 ?auto_1742524 ) ) ( not ( = ?auto_1742522 ?auto_1742525 ) ) ( not ( = ?auto_1742522 ?auto_1742526 ) ) ( not ( = ?auto_1742522 ?auto_1742527 ) ) ( not ( = ?auto_1742522 ?auto_1742528 ) ) ( not ( = ?auto_1742522 ?auto_1742529 ) ) ( not ( = ?auto_1742522 ?auto_1742531 ) ) ( not ( = ?auto_1742522 ?auto_1742533 ) ) ( not ( = ?auto_1742523 ?auto_1742524 ) ) ( not ( = ?auto_1742523 ?auto_1742525 ) ) ( not ( = ?auto_1742523 ?auto_1742526 ) ) ( not ( = ?auto_1742523 ?auto_1742527 ) ) ( not ( = ?auto_1742523 ?auto_1742528 ) ) ( not ( = ?auto_1742523 ?auto_1742529 ) ) ( not ( = ?auto_1742523 ?auto_1742531 ) ) ( not ( = ?auto_1742523 ?auto_1742533 ) ) ( not ( = ?auto_1742524 ?auto_1742525 ) ) ( not ( = ?auto_1742524 ?auto_1742526 ) ) ( not ( = ?auto_1742524 ?auto_1742527 ) ) ( not ( = ?auto_1742524 ?auto_1742528 ) ) ( not ( = ?auto_1742524 ?auto_1742529 ) ) ( not ( = ?auto_1742524 ?auto_1742531 ) ) ( not ( = ?auto_1742524 ?auto_1742533 ) ) ( not ( = ?auto_1742525 ?auto_1742526 ) ) ( not ( = ?auto_1742525 ?auto_1742527 ) ) ( not ( = ?auto_1742525 ?auto_1742528 ) ) ( not ( = ?auto_1742525 ?auto_1742529 ) ) ( not ( = ?auto_1742525 ?auto_1742531 ) ) ( not ( = ?auto_1742525 ?auto_1742533 ) ) ( not ( = ?auto_1742526 ?auto_1742527 ) ) ( not ( = ?auto_1742526 ?auto_1742528 ) ) ( not ( = ?auto_1742526 ?auto_1742529 ) ) ( not ( = ?auto_1742526 ?auto_1742531 ) ) ( not ( = ?auto_1742526 ?auto_1742533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742527 ?auto_1742528 ?auto_1742529 )
      ( MAKE-8CRATE-VERIFY ?auto_1742521 ?auto_1742522 ?auto_1742523 ?auto_1742524 ?auto_1742525 ?auto_1742526 ?auto_1742527 ?auto_1742528 ?auto_1742529 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1742537 - SURFACE
      ?auto_1742538 - SURFACE
      ?auto_1742539 - SURFACE
      ?auto_1742540 - SURFACE
      ?auto_1742541 - SURFACE
      ?auto_1742542 - SURFACE
      ?auto_1742543 - SURFACE
      ?auto_1742544 - SURFACE
      ?auto_1742545 - SURFACE
      ?auto_1742546 - SURFACE
    )
    :vars
    (
      ?auto_1742551 - HOIST
      ?auto_1742552 - PLACE
      ?auto_1742549 - PLACE
      ?auto_1742553 - HOIST
      ?auto_1742548 - SURFACE
      ?auto_1742547 - TRUCK
      ?auto_1742550 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742551 ?auto_1742552 ) ( IS-CRATE ?auto_1742546 ) ( not ( = ?auto_1742545 ?auto_1742546 ) ) ( not ( = ?auto_1742544 ?auto_1742545 ) ) ( not ( = ?auto_1742544 ?auto_1742546 ) ) ( not ( = ?auto_1742549 ?auto_1742552 ) ) ( HOIST-AT ?auto_1742553 ?auto_1742549 ) ( not ( = ?auto_1742551 ?auto_1742553 ) ) ( SURFACE-AT ?auto_1742546 ?auto_1742549 ) ( ON ?auto_1742546 ?auto_1742548 ) ( CLEAR ?auto_1742546 ) ( not ( = ?auto_1742545 ?auto_1742548 ) ) ( not ( = ?auto_1742546 ?auto_1742548 ) ) ( not ( = ?auto_1742544 ?auto_1742548 ) ) ( SURFACE-AT ?auto_1742544 ?auto_1742552 ) ( CLEAR ?auto_1742544 ) ( IS-CRATE ?auto_1742545 ) ( AVAILABLE ?auto_1742551 ) ( TRUCK-AT ?auto_1742547 ?auto_1742549 ) ( AVAILABLE ?auto_1742553 ) ( SURFACE-AT ?auto_1742545 ?auto_1742549 ) ( ON ?auto_1742545 ?auto_1742550 ) ( CLEAR ?auto_1742545 ) ( not ( = ?auto_1742545 ?auto_1742550 ) ) ( not ( = ?auto_1742546 ?auto_1742550 ) ) ( not ( = ?auto_1742544 ?auto_1742550 ) ) ( not ( = ?auto_1742548 ?auto_1742550 ) ) ( ON ?auto_1742538 ?auto_1742537 ) ( ON ?auto_1742539 ?auto_1742538 ) ( ON ?auto_1742540 ?auto_1742539 ) ( ON ?auto_1742541 ?auto_1742540 ) ( ON ?auto_1742542 ?auto_1742541 ) ( ON ?auto_1742543 ?auto_1742542 ) ( ON ?auto_1742544 ?auto_1742543 ) ( not ( = ?auto_1742537 ?auto_1742538 ) ) ( not ( = ?auto_1742537 ?auto_1742539 ) ) ( not ( = ?auto_1742537 ?auto_1742540 ) ) ( not ( = ?auto_1742537 ?auto_1742541 ) ) ( not ( = ?auto_1742537 ?auto_1742542 ) ) ( not ( = ?auto_1742537 ?auto_1742543 ) ) ( not ( = ?auto_1742537 ?auto_1742544 ) ) ( not ( = ?auto_1742537 ?auto_1742545 ) ) ( not ( = ?auto_1742537 ?auto_1742546 ) ) ( not ( = ?auto_1742537 ?auto_1742548 ) ) ( not ( = ?auto_1742537 ?auto_1742550 ) ) ( not ( = ?auto_1742538 ?auto_1742539 ) ) ( not ( = ?auto_1742538 ?auto_1742540 ) ) ( not ( = ?auto_1742538 ?auto_1742541 ) ) ( not ( = ?auto_1742538 ?auto_1742542 ) ) ( not ( = ?auto_1742538 ?auto_1742543 ) ) ( not ( = ?auto_1742538 ?auto_1742544 ) ) ( not ( = ?auto_1742538 ?auto_1742545 ) ) ( not ( = ?auto_1742538 ?auto_1742546 ) ) ( not ( = ?auto_1742538 ?auto_1742548 ) ) ( not ( = ?auto_1742538 ?auto_1742550 ) ) ( not ( = ?auto_1742539 ?auto_1742540 ) ) ( not ( = ?auto_1742539 ?auto_1742541 ) ) ( not ( = ?auto_1742539 ?auto_1742542 ) ) ( not ( = ?auto_1742539 ?auto_1742543 ) ) ( not ( = ?auto_1742539 ?auto_1742544 ) ) ( not ( = ?auto_1742539 ?auto_1742545 ) ) ( not ( = ?auto_1742539 ?auto_1742546 ) ) ( not ( = ?auto_1742539 ?auto_1742548 ) ) ( not ( = ?auto_1742539 ?auto_1742550 ) ) ( not ( = ?auto_1742540 ?auto_1742541 ) ) ( not ( = ?auto_1742540 ?auto_1742542 ) ) ( not ( = ?auto_1742540 ?auto_1742543 ) ) ( not ( = ?auto_1742540 ?auto_1742544 ) ) ( not ( = ?auto_1742540 ?auto_1742545 ) ) ( not ( = ?auto_1742540 ?auto_1742546 ) ) ( not ( = ?auto_1742540 ?auto_1742548 ) ) ( not ( = ?auto_1742540 ?auto_1742550 ) ) ( not ( = ?auto_1742541 ?auto_1742542 ) ) ( not ( = ?auto_1742541 ?auto_1742543 ) ) ( not ( = ?auto_1742541 ?auto_1742544 ) ) ( not ( = ?auto_1742541 ?auto_1742545 ) ) ( not ( = ?auto_1742541 ?auto_1742546 ) ) ( not ( = ?auto_1742541 ?auto_1742548 ) ) ( not ( = ?auto_1742541 ?auto_1742550 ) ) ( not ( = ?auto_1742542 ?auto_1742543 ) ) ( not ( = ?auto_1742542 ?auto_1742544 ) ) ( not ( = ?auto_1742542 ?auto_1742545 ) ) ( not ( = ?auto_1742542 ?auto_1742546 ) ) ( not ( = ?auto_1742542 ?auto_1742548 ) ) ( not ( = ?auto_1742542 ?auto_1742550 ) ) ( not ( = ?auto_1742543 ?auto_1742544 ) ) ( not ( = ?auto_1742543 ?auto_1742545 ) ) ( not ( = ?auto_1742543 ?auto_1742546 ) ) ( not ( = ?auto_1742543 ?auto_1742548 ) ) ( not ( = ?auto_1742543 ?auto_1742550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742544 ?auto_1742545 ?auto_1742546 )
      ( MAKE-9CRATE-VERIFY ?auto_1742537 ?auto_1742538 ?auto_1742539 ?auto_1742540 ?auto_1742541 ?auto_1742542 ?auto_1742543 ?auto_1742544 ?auto_1742545 ?auto_1742546 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1742554 - SURFACE
      ?auto_1742555 - SURFACE
      ?auto_1742556 - SURFACE
      ?auto_1742557 - SURFACE
      ?auto_1742558 - SURFACE
      ?auto_1742559 - SURFACE
      ?auto_1742560 - SURFACE
      ?auto_1742561 - SURFACE
      ?auto_1742562 - SURFACE
      ?auto_1742563 - SURFACE
      ?auto_1742564 - SURFACE
    )
    :vars
    (
      ?auto_1742569 - HOIST
      ?auto_1742570 - PLACE
      ?auto_1742567 - PLACE
      ?auto_1742571 - HOIST
      ?auto_1742566 - SURFACE
      ?auto_1742565 - TRUCK
      ?auto_1742568 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742569 ?auto_1742570 ) ( IS-CRATE ?auto_1742564 ) ( not ( = ?auto_1742563 ?auto_1742564 ) ) ( not ( = ?auto_1742562 ?auto_1742563 ) ) ( not ( = ?auto_1742562 ?auto_1742564 ) ) ( not ( = ?auto_1742567 ?auto_1742570 ) ) ( HOIST-AT ?auto_1742571 ?auto_1742567 ) ( not ( = ?auto_1742569 ?auto_1742571 ) ) ( SURFACE-AT ?auto_1742564 ?auto_1742567 ) ( ON ?auto_1742564 ?auto_1742566 ) ( CLEAR ?auto_1742564 ) ( not ( = ?auto_1742563 ?auto_1742566 ) ) ( not ( = ?auto_1742564 ?auto_1742566 ) ) ( not ( = ?auto_1742562 ?auto_1742566 ) ) ( SURFACE-AT ?auto_1742562 ?auto_1742570 ) ( CLEAR ?auto_1742562 ) ( IS-CRATE ?auto_1742563 ) ( AVAILABLE ?auto_1742569 ) ( TRUCK-AT ?auto_1742565 ?auto_1742567 ) ( AVAILABLE ?auto_1742571 ) ( SURFACE-AT ?auto_1742563 ?auto_1742567 ) ( ON ?auto_1742563 ?auto_1742568 ) ( CLEAR ?auto_1742563 ) ( not ( = ?auto_1742563 ?auto_1742568 ) ) ( not ( = ?auto_1742564 ?auto_1742568 ) ) ( not ( = ?auto_1742562 ?auto_1742568 ) ) ( not ( = ?auto_1742566 ?auto_1742568 ) ) ( ON ?auto_1742555 ?auto_1742554 ) ( ON ?auto_1742556 ?auto_1742555 ) ( ON ?auto_1742557 ?auto_1742556 ) ( ON ?auto_1742558 ?auto_1742557 ) ( ON ?auto_1742559 ?auto_1742558 ) ( ON ?auto_1742560 ?auto_1742559 ) ( ON ?auto_1742561 ?auto_1742560 ) ( ON ?auto_1742562 ?auto_1742561 ) ( not ( = ?auto_1742554 ?auto_1742555 ) ) ( not ( = ?auto_1742554 ?auto_1742556 ) ) ( not ( = ?auto_1742554 ?auto_1742557 ) ) ( not ( = ?auto_1742554 ?auto_1742558 ) ) ( not ( = ?auto_1742554 ?auto_1742559 ) ) ( not ( = ?auto_1742554 ?auto_1742560 ) ) ( not ( = ?auto_1742554 ?auto_1742561 ) ) ( not ( = ?auto_1742554 ?auto_1742562 ) ) ( not ( = ?auto_1742554 ?auto_1742563 ) ) ( not ( = ?auto_1742554 ?auto_1742564 ) ) ( not ( = ?auto_1742554 ?auto_1742566 ) ) ( not ( = ?auto_1742554 ?auto_1742568 ) ) ( not ( = ?auto_1742555 ?auto_1742556 ) ) ( not ( = ?auto_1742555 ?auto_1742557 ) ) ( not ( = ?auto_1742555 ?auto_1742558 ) ) ( not ( = ?auto_1742555 ?auto_1742559 ) ) ( not ( = ?auto_1742555 ?auto_1742560 ) ) ( not ( = ?auto_1742555 ?auto_1742561 ) ) ( not ( = ?auto_1742555 ?auto_1742562 ) ) ( not ( = ?auto_1742555 ?auto_1742563 ) ) ( not ( = ?auto_1742555 ?auto_1742564 ) ) ( not ( = ?auto_1742555 ?auto_1742566 ) ) ( not ( = ?auto_1742555 ?auto_1742568 ) ) ( not ( = ?auto_1742556 ?auto_1742557 ) ) ( not ( = ?auto_1742556 ?auto_1742558 ) ) ( not ( = ?auto_1742556 ?auto_1742559 ) ) ( not ( = ?auto_1742556 ?auto_1742560 ) ) ( not ( = ?auto_1742556 ?auto_1742561 ) ) ( not ( = ?auto_1742556 ?auto_1742562 ) ) ( not ( = ?auto_1742556 ?auto_1742563 ) ) ( not ( = ?auto_1742556 ?auto_1742564 ) ) ( not ( = ?auto_1742556 ?auto_1742566 ) ) ( not ( = ?auto_1742556 ?auto_1742568 ) ) ( not ( = ?auto_1742557 ?auto_1742558 ) ) ( not ( = ?auto_1742557 ?auto_1742559 ) ) ( not ( = ?auto_1742557 ?auto_1742560 ) ) ( not ( = ?auto_1742557 ?auto_1742561 ) ) ( not ( = ?auto_1742557 ?auto_1742562 ) ) ( not ( = ?auto_1742557 ?auto_1742563 ) ) ( not ( = ?auto_1742557 ?auto_1742564 ) ) ( not ( = ?auto_1742557 ?auto_1742566 ) ) ( not ( = ?auto_1742557 ?auto_1742568 ) ) ( not ( = ?auto_1742558 ?auto_1742559 ) ) ( not ( = ?auto_1742558 ?auto_1742560 ) ) ( not ( = ?auto_1742558 ?auto_1742561 ) ) ( not ( = ?auto_1742558 ?auto_1742562 ) ) ( not ( = ?auto_1742558 ?auto_1742563 ) ) ( not ( = ?auto_1742558 ?auto_1742564 ) ) ( not ( = ?auto_1742558 ?auto_1742566 ) ) ( not ( = ?auto_1742558 ?auto_1742568 ) ) ( not ( = ?auto_1742559 ?auto_1742560 ) ) ( not ( = ?auto_1742559 ?auto_1742561 ) ) ( not ( = ?auto_1742559 ?auto_1742562 ) ) ( not ( = ?auto_1742559 ?auto_1742563 ) ) ( not ( = ?auto_1742559 ?auto_1742564 ) ) ( not ( = ?auto_1742559 ?auto_1742566 ) ) ( not ( = ?auto_1742559 ?auto_1742568 ) ) ( not ( = ?auto_1742560 ?auto_1742561 ) ) ( not ( = ?auto_1742560 ?auto_1742562 ) ) ( not ( = ?auto_1742560 ?auto_1742563 ) ) ( not ( = ?auto_1742560 ?auto_1742564 ) ) ( not ( = ?auto_1742560 ?auto_1742566 ) ) ( not ( = ?auto_1742560 ?auto_1742568 ) ) ( not ( = ?auto_1742561 ?auto_1742562 ) ) ( not ( = ?auto_1742561 ?auto_1742563 ) ) ( not ( = ?auto_1742561 ?auto_1742564 ) ) ( not ( = ?auto_1742561 ?auto_1742566 ) ) ( not ( = ?auto_1742561 ?auto_1742568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742562 ?auto_1742563 ?auto_1742564 )
      ( MAKE-10CRATE-VERIFY ?auto_1742554 ?auto_1742555 ?auto_1742556 ?auto_1742557 ?auto_1742558 ?auto_1742559 ?auto_1742560 ?auto_1742561 ?auto_1742562 ?auto_1742563 ?auto_1742564 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1742572 - SURFACE
      ?auto_1742573 - SURFACE
      ?auto_1742574 - SURFACE
      ?auto_1742575 - SURFACE
      ?auto_1742576 - SURFACE
      ?auto_1742577 - SURFACE
      ?auto_1742578 - SURFACE
      ?auto_1742579 - SURFACE
      ?auto_1742580 - SURFACE
      ?auto_1742581 - SURFACE
      ?auto_1742582 - SURFACE
      ?auto_1742583 - SURFACE
    )
    :vars
    (
      ?auto_1742588 - HOIST
      ?auto_1742589 - PLACE
      ?auto_1742586 - PLACE
      ?auto_1742590 - HOIST
      ?auto_1742585 - SURFACE
      ?auto_1742584 - TRUCK
      ?auto_1742587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742588 ?auto_1742589 ) ( IS-CRATE ?auto_1742583 ) ( not ( = ?auto_1742582 ?auto_1742583 ) ) ( not ( = ?auto_1742581 ?auto_1742582 ) ) ( not ( = ?auto_1742581 ?auto_1742583 ) ) ( not ( = ?auto_1742586 ?auto_1742589 ) ) ( HOIST-AT ?auto_1742590 ?auto_1742586 ) ( not ( = ?auto_1742588 ?auto_1742590 ) ) ( SURFACE-AT ?auto_1742583 ?auto_1742586 ) ( ON ?auto_1742583 ?auto_1742585 ) ( CLEAR ?auto_1742583 ) ( not ( = ?auto_1742582 ?auto_1742585 ) ) ( not ( = ?auto_1742583 ?auto_1742585 ) ) ( not ( = ?auto_1742581 ?auto_1742585 ) ) ( SURFACE-AT ?auto_1742581 ?auto_1742589 ) ( CLEAR ?auto_1742581 ) ( IS-CRATE ?auto_1742582 ) ( AVAILABLE ?auto_1742588 ) ( TRUCK-AT ?auto_1742584 ?auto_1742586 ) ( AVAILABLE ?auto_1742590 ) ( SURFACE-AT ?auto_1742582 ?auto_1742586 ) ( ON ?auto_1742582 ?auto_1742587 ) ( CLEAR ?auto_1742582 ) ( not ( = ?auto_1742582 ?auto_1742587 ) ) ( not ( = ?auto_1742583 ?auto_1742587 ) ) ( not ( = ?auto_1742581 ?auto_1742587 ) ) ( not ( = ?auto_1742585 ?auto_1742587 ) ) ( ON ?auto_1742573 ?auto_1742572 ) ( ON ?auto_1742574 ?auto_1742573 ) ( ON ?auto_1742575 ?auto_1742574 ) ( ON ?auto_1742576 ?auto_1742575 ) ( ON ?auto_1742577 ?auto_1742576 ) ( ON ?auto_1742578 ?auto_1742577 ) ( ON ?auto_1742579 ?auto_1742578 ) ( ON ?auto_1742580 ?auto_1742579 ) ( ON ?auto_1742581 ?auto_1742580 ) ( not ( = ?auto_1742572 ?auto_1742573 ) ) ( not ( = ?auto_1742572 ?auto_1742574 ) ) ( not ( = ?auto_1742572 ?auto_1742575 ) ) ( not ( = ?auto_1742572 ?auto_1742576 ) ) ( not ( = ?auto_1742572 ?auto_1742577 ) ) ( not ( = ?auto_1742572 ?auto_1742578 ) ) ( not ( = ?auto_1742572 ?auto_1742579 ) ) ( not ( = ?auto_1742572 ?auto_1742580 ) ) ( not ( = ?auto_1742572 ?auto_1742581 ) ) ( not ( = ?auto_1742572 ?auto_1742582 ) ) ( not ( = ?auto_1742572 ?auto_1742583 ) ) ( not ( = ?auto_1742572 ?auto_1742585 ) ) ( not ( = ?auto_1742572 ?auto_1742587 ) ) ( not ( = ?auto_1742573 ?auto_1742574 ) ) ( not ( = ?auto_1742573 ?auto_1742575 ) ) ( not ( = ?auto_1742573 ?auto_1742576 ) ) ( not ( = ?auto_1742573 ?auto_1742577 ) ) ( not ( = ?auto_1742573 ?auto_1742578 ) ) ( not ( = ?auto_1742573 ?auto_1742579 ) ) ( not ( = ?auto_1742573 ?auto_1742580 ) ) ( not ( = ?auto_1742573 ?auto_1742581 ) ) ( not ( = ?auto_1742573 ?auto_1742582 ) ) ( not ( = ?auto_1742573 ?auto_1742583 ) ) ( not ( = ?auto_1742573 ?auto_1742585 ) ) ( not ( = ?auto_1742573 ?auto_1742587 ) ) ( not ( = ?auto_1742574 ?auto_1742575 ) ) ( not ( = ?auto_1742574 ?auto_1742576 ) ) ( not ( = ?auto_1742574 ?auto_1742577 ) ) ( not ( = ?auto_1742574 ?auto_1742578 ) ) ( not ( = ?auto_1742574 ?auto_1742579 ) ) ( not ( = ?auto_1742574 ?auto_1742580 ) ) ( not ( = ?auto_1742574 ?auto_1742581 ) ) ( not ( = ?auto_1742574 ?auto_1742582 ) ) ( not ( = ?auto_1742574 ?auto_1742583 ) ) ( not ( = ?auto_1742574 ?auto_1742585 ) ) ( not ( = ?auto_1742574 ?auto_1742587 ) ) ( not ( = ?auto_1742575 ?auto_1742576 ) ) ( not ( = ?auto_1742575 ?auto_1742577 ) ) ( not ( = ?auto_1742575 ?auto_1742578 ) ) ( not ( = ?auto_1742575 ?auto_1742579 ) ) ( not ( = ?auto_1742575 ?auto_1742580 ) ) ( not ( = ?auto_1742575 ?auto_1742581 ) ) ( not ( = ?auto_1742575 ?auto_1742582 ) ) ( not ( = ?auto_1742575 ?auto_1742583 ) ) ( not ( = ?auto_1742575 ?auto_1742585 ) ) ( not ( = ?auto_1742575 ?auto_1742587 ) ) ( not ( = ?auto_1742576 ?auto_1742577 ) ) ( not ( = ?auto_1742576 ?auto_1742578 ) ) ( not ( = ?auto_1742576 ?auto_1742579 ) ) ( not ( = ?auto_1742576 ?auto_1742580 ) ) ( not ( = ?auto_1742576 ?auto_1742581 ) ) ( not ( = ?auto_1742576 ?auto_1742582 ) ) ( not ( = ?auto_1742576 ?auto_1742583 ) ) ( not ( = ?auto_1742576 ?auto_1742585 ) ) ( not ( = ?auto_1742576 ?auto_1742587 ) ) ( not ( = ?auto_1742577 ?auto_1742578 ) ) ( not ( = ?auto_1742577 ?auto_1742579 ) ) ( not ( = ?auto_1742577 ?auto_1742580 ) ) ( not ( = ?auto_1742577 ?auto_1742581 ) ) ( not ( = ?auto_1742577 ?auto_1742582 ) ) ( not ( = ?auto_1742577 ?auto_1742583 ) ) ( not ( = ?auto_1742577 ?auto_1742585 ) ) ( not ( = ?auto_1742577 ?auto_1742587 ) ) ( not ( = ?auto_1742578 ?auto_1742579 ) ) ( not ( = ?auto_1742578 ?auto_1742580 ) ) ( not ( = ?auto_1742578 ?auto_1742581 ) ) ( not ( = ?auto_1742578 ?auto_1742582 ) ) ( not ( = ?auto_1742578 ?auto_1742583 ) ) ( not ( = ?auto_1742578 ?auto_1742585 ) ) ( not ( = ?auto_1742578 ?auto_1742587 ) ) ( not ( = ?auto_1742579 ?auto_1742580 ) ) ( not ( = ?auto_1742579 ?auto_1742581 ) ) ( not ( = ?auto_1742579 ?auto_1742582 ) ) ( not ( = ?auto_1742579 ?auto_1742583 ) ) ( not ( = ?auto_1742579 ?auto_1742585 ) ) ( not ( = ?auto_1742579 ?auto_1742587 ) ) ( not ( = ?auto_1742580 ?auto_1742581 ) ) ( not ( = ?auto_1742580 ?auto_1742582 ) ) ( not ( = ?auto_1742580 ?auto_1742583 ) ) ( not ( = ?auto_1742580 ?auto_1742585 ) ) ( not ( = ?auto_1742580 ?auto_1742587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742581 ?auto_1742582 ?auto_1742583 )
      ( MAKE-11CRATE-VERIFY ?auto_1742572 ?auto_1742573 ?auto_1742574 ?auto_1742575 ?auto_1742576 ?auto_1742577 ?auto_1742578 ?auto_1742579 ?auto_1742580 ?auto_1742581 ?auto_1742582 ?auto_1742583 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1742591 - SURFACE
      ?auto_1742592 - SURFACE
      ?auto_1742593 - SURFACE
      ?auto_1742594 - SURFACE
      ?auto_1742595 - SURFACE
      ?auto_1742596 - SURFACE
      ?auto_1742597 - SURFACE
      ?auto_1742598 - SURFACE
      ?auto_1742599 - SURFACE
      ?auto_1742600 - SURFACE
      ?auto_1742601 - SURFACE
      ?auto_1742602 - SURFACE
      ?auto_1742603 - SURFACE
    )
    :vars
    (
      ?auto_1742608 - HOIST
      ?auto_1742609 - PLACE
      ?auto_1742606 - PLACE
      ?auto_1742610 - HOIST
      ?auto_1742605 - SURFACE
      ?auto_1742604 - TRUCK
      ?auto_1742607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742608 ?auto_1742609 ) ( IS-CRATE ?auto_1742603 ) ( not ( = ?auto_1742602 ?auto_1742603 ) ) ( not ( = ?auto_1742601 ?auto_1742602 ) ) ( not ( = ?auto_1742601 ?auto_1742603 ) ) ( not ( = ?auto_1742606 ?auto_1742609 ) ) ( HOIST-AT ?auto_1742610 ?auto_1742606 ) ( not ( = ?auto_1742608 ?auto_1742610 ) ) ( SURFACE-AT ?auto_1742603 ?auto_1742606 ) ( ON ?auto_1742603 ?auto_1742605 ) ( CLEAR ?auto_1742603 ) ( not ( = ?auto_1742602 ?auto_1742605 ) ) ( not ( = ?auto_1742603 ?auto_1742605 ) ) ( not ( = ?auto_1742601 ?auto_1742605 ) ) ( SURFACE-AT ?auto_1742601 ?auto_1742609 ) ( CLEAR ?auto_1742601 ) ( IS-CRATE ?auto_1742602 ) ( AVAILABLE ?auto_1742608 ) ( TRUCK-AT ?auto_1742604 ?auto_1742606 ) ( AVAILABLE ?auto_1742610 ) ( SURFACE-AT ?auto_1742602 ?auto_1742606 ) ( ON ?auto_1742602 ?auto_1742607 ) ( CLEAR ?auto_1742602 ) ( not ( = ?auto_1742602 ?auto_1742607 ) ) ( not ( = ?auto_1742603 ?auto_1742607 ) ) ( not ( = ?auto_1742601 ?auto_1742607 ) ) ( not ( = ?auto_1742605 ?auto_1742607 ) ) ( ON ?auto_1742592 ?auto_1742591 ) ( ON ?auto_1742593 ?auto_1742592 ) ( ON ?auto_1742594 ?auto_1742593 ) ( ON ?auto_1742595 ?auto_1742594 ) ( ON ?auto_1742596 ?auto_1742595 ) ( ON ?auto_1742597 ?auto_1742596 ) ( ON ?auto_1742598 ?auto_1742597 ) ( ON ?auto_1742599 ?auto_1742598 ) ( ON ?auto_1742600 ?auto_1742599 ) ( ON ?auto_1742601 ?auto_1742600 ) ( not ( = ?auto_1742591 ?auto_1742592 ) ) ( not ( = ?auto_1742591 ?auto_1742593 ) ) ( not ( = ?auto_1742591 ?auto_1742594 ) ) ( not ( = ?auto_1742591 ?auto_1742595 ) ) ( not ( = ?auto_1742591 ?auto_1742596 ) ) ( not ( = ?auto_1742591 ?auto_1742597 ) ) ( not ( = ?auto_1742591 ?auto_1742598 ) ) ( not ( = ?auto_1742591 ?auto_1742599 ) ) ( not ( = ?auto_1742591 ?auto_1742600 ) ) ( not ( = ?auto_1742591 ?auto_1742601 ) ) ( not ( = ?auto_1742591 ?auto_1742602 ) ) ( not ( = ?auto_1742591 ?auto_1742603 ) ) ( not ( = ?auto_1742591 ?auto_1742605 ) ) ( not ( = ?auto_1742591 ?auto_1742607 ) ) ( not ( = ?auto_1742592 ?auto_1742593 ) ) ( not ( = ?auto_1742592 ?auto_1742594 ) ) ( not ( = ?auto_1742592 ?auto_1742595 ) ) ( not ( = ?auto_1742592 ?auto_1742596 ) ) ( not ( = ?auto_1742592 ?auto_1742597 ) ) ( not ( = ?auto_1742592 ?auto_1742598 ) ) ( not ( = ?auto_1742592 ?auto_1742599 ) ) ( not ( = ?auto_1742592 ?auto_1742600 ) ) ( not ( = ?auto_1742592 ?auto_1742601 ) ) ( not ( = ?auto_1742592 ?auto_1742602 ) ) ( not ( = ?auto_1742592 ?auto_1742603 ) ) ( not ( = ?auto_1742592 ?auto_1742605 ) ) ( not ( = ?auto_1742592 ?auto_1742607 ) ) ( not ( = ?auto_1742593 ?auto_1742594 ) ) ( not ( = ?auto_1742593 ?auto_1742595 ) ) ( not ( = ?auto_1742593 ?auto_1742596 ) ) ( not ( = ?auto_1742593 ?auto_1742597 ) ) ( not ( = ?auto_1742593 ?auto_1742598 ) ) ( not ( = ?auto_1742593 ?auto_1742599 ) ) ( not ( = ?auto_1742593 ?auto_1742600 ) ) ( not ( = ?auto_1742593 ?auto_1742601 ) ) ( not ( = ?auto_1742593 ?auto_1742602 ) ) ( not ( = ?auto_1742593 ?auto_1742603 ) ) ( not ( = ?auto_1742593 ?auto_1742605 ) ) ( not ( = ?auto_1742593 ?auto_1742607 ) ) ( not ( = ?auto_1742594 ?auto_1742595 ) ) ( not ( = ?auto_1742594 ?auto_1742596 ) ) ( not ( = ?auto_1742594 ?auto_1742597 ) ) ( not ( = ?auto_1742594 ?auto_1742598 ) ) ( not ( = ?auto_1742594 ?auto_1742599 ) ) ( not ( = ?auto_1742594 ?auto_1742600 ) ) ( not ( = ?auto_1742594 ?auto_1742601 ) ) ( not ( = ?auto_1742594 ?auto_1742602 ) ) ( not ( = ?auto_1742594 ?auto_1742603 ) ) ( not ( = ?auto_1742594 ?auto_1742605 ) ) ( not ( = ?auto_1742594 ?auto_1742607 ) ) ( not ( = ?auto_1742595 ?auto_1742596 ) ) ( not ( = ?auto_1742595 ?auto_1742597 ) ) ( not ( = ?auto_1742595 ?auto_1742598 ) ) ( not ( = ?auto_1742595 ?auto_1742599 ) ) ( not ( = ?auto_1742595 ?auto_1742600 ) ) ( not ( = ?auto_1742595 ?auto_1742601 ) ) ( not ( = ?auto_1742595 ?auto_1742602 ) ) ( not ( = ?auto_1742595 ?auto_1742603 ) ) ( not ( = ?auto_1742595 ?auto_1742605 ) ) ( not ( = ?auto_1742595 ?auto_1742607 ) ) ( not ( = ?auto_1742596 ?auto_1742597 ) ) ( not ( = ?auto_1742596 ?auto_1742598 ) ) ( not ( = ?auto_1742596 ?auto_1742599 ) ) ( not ( = ?auto_1742596 ?auto_1742600 ) ) ( not ( = ?auto_1742596 ?auto_1742601 ) ) ( not ( = ?auto_1742596 ?auto_1742602 ) ) ( not ( = ?auto_1742596 ?auto_1742603 ) ) ( not ( = ?auto_1742596 ?auto_1742605 ) ) ( not ( = ?auto_1742596 ?auto_1742607 ) ) ( not ( = ?auto_1742597 ?auto_1742598 ) ) ( not ( = ?auto_1742597 ?auto_1742599 ) ) ( not ( = ?auto_1742597 ?auto_1742600 ) ) ( not ( = ?auto_1742597 ?auto_1742601 ) ) ( not ( = ?auto_1742597 ?auto_1742602 ) ) ( not ( = ?auto_1742597 ?auto_1742603 ) ) ( not ( = ?auto_1742597 ?auto_1742605 ) ) ( not ( = ?auto_1742597 ?auto_1742607 ) ) ( not ( = ?auto_1742598 ?auto_1742599 ) ) ( not ( = ?auto_1742598 ?auto_1742600 ) ) ( not ( = ?auto_1742598 ?auto_1742601 ) ) ( not ( = ?auto_1742598 ?auto_1742602 ) ) ( not ( = ?auto_1742598 ?auto_1742603 ) ) ( not ( = ?auto_1742598 ?auto_1742605 ) ) ( not ( = ?auto_1742598 ?auto_1742607 ) ) ( not ( = ?auto_1742599 ?auto_1742600 ) ) ( not ( = ?auto_1742599 ?auto_1742601 ) ) ( not ( = ?auto_1742599 ?auto_1742602 ) ) ( not ( = ?auto_1742599 ?auto_1742603 ) ) ( not ( = ?auto_1742599 ?auto_1742605 ) ) ( not ( = ?auto_1742599 ?auto_1742607 ) ) ( not ( = ?auto_1742600 ?auto_1742601 ) ) ( not ( = ?auto_1742600 ?auto_1742602 ) ) ( not ( = ?auto_1742600 ?auto_1742603 ) ) ( not ( = ?auto_1742600 ?auto_1742605 ) ) ( not ( = ?auto_1742600 ?auto_1742607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742601 ?auto_1742602 ?auto_1742603 )
      ( MAKE-12CRATE-VERIFY ?auto_1742591 ?auto_1742592 ?auto_1742593 ?auto_1742594 ?auto_1742595 ?auto_1742596 ?auto_1742597 ?auto_1742598 ?auto_1742599 ?auto_1742600 ?auto_1742601 ?auto_1742602 ?auto_1742603 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1742611 - SURFACE
      ?auto_1742612 - SURFACE
    )
    :vars
    (
      ?auto_1742617 - HOIST
      ?auto_1742618 - PLACE
      ?auto_1742620 - SURFACE
      ?auto_1742615 - PLACE
      ?auto_1742619 - HOIST
      ?auto_1742614 - SURFACE
      ?auto_1742616 - SURFACE
      ?auto_1742613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742617 ?auto_1742618 ) ( IS-CRATE ?auto_1742612 ) ( not ( = ?auto_1742611 ?auto_1742612 ) ) ( not ( = ?auto_1742620 ?auto_1742611 ) ) ( not ( = ?auto_1742620 ?auto_1742612 ) ) ( not ( = ?auto_1742615 ?auto_1742618 ) ) ( HOIST-AT ?auto_1742619 ?auto_1742615 ) ( not ( = ?auto_1742617 ?auto_1742619 ) ) ( SURFACE-AT ?auto_1742612 ?auto_1742615 ) ( ON ?auto_1742612 ?auto_1742614 ) ( CLEAR ?auto_1742612 ) ( not ( = ?auto_1742611 ?auto_1742614 ) ) ( not ( = ?auto_1742612 ?auto_1742614 ) ) ( not ( = ?auto_1742620 ?auto_1742614 ) ) ( SURFACE-AT ?auto_1742620 ?auto_1742618 ) ( CLEAR ?auto_1742620 ) ( IS-CRATE ?auto_1742611 ) ( AVAILABLE ?auto_1742617 ) ( AVAILABLE ?auto_1742619 ) ( SURFACE-AT ?auto_1742611 ?auto_1742615 ) ( ON ?auto_1742611 ?auto_1742616 ) ( CLEAR ?auto_1742611 ) ( not ( = ?auto_1742611 ?auto_1742616 ) ) ( not ( = ?auto_1742612 ?auto_1742616 ) ) ( not ( = ?auto_1742620 ?auto_1742616 ) ) ( not ( = ?auto_1742614 ?auto_1742616 ) ) ( TRUCK-AT ?auto_1742613 ?auto_1742618 ) )
    :subtasks
    ( ( !DRIVE ?auto_1742613 ?auto_1742618 ?auto_1742615 )
      ( MAKE-2CRATE ?auto_1742620 ?auto_1742611 ?auto_1742612 )
      ( MAKE-1CRATE-VERIFY ?auto_1742611 ?auto_1742612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1742621 - SURFACE
      ?auto_1742622 - SURFACE
      ?auto_1742623 - SURFACE
    )
    :vars
    (
      ?auto_1742628 - HOIST
      ?auto_1742626 - PLACE
      ?auto_1742624 - PLACE
      ?auto_1742629 - HOIST
      ?auto_1742625 - SURFACE
      ?auto_1742630 - SURFACE
      ?auto_1742627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742628 ?auto_1742626 ) ( IS-CRATE ?auto_1742623 ) ( not ( = ?auto_1742622 ?auto_1742623 ) ) ( not ( = ?auto_1742621 ?auto_1742622 ) ) ( not ( = ?auto_1742621 ?auto_1742623 ) ) ( not ( = ?auto_1742624 ?auto_1742626 ) ) ( HOIST-AT ?auto_1742629 ?auto_1742624 ) ( not ( = ?auto_1742628 ?auto_1742629 ) ) ( SURFACE-AT ?auto_1742623 ?auto_1742624 ) ( ON ?auto_1742623 ?auto_1742625 ) ( CLEAR ?auto_1742623 ) ( not ( = ?auto_1742622 ?auto_1742625 ) ) ( not ( = ?auto_1742623 ?auto_1742625 ) ) ( not ( = ?auto_1742621 ?auto_1742625 ) ) ( SURFACE-AT ?auto_1742621 ?auto_1742626 ) ( CLEAR ?auto_1742621 ) ( IS-CRATE ?auto_1742622 ) ( AVAILABLE ?auto_1742628 ) ( AVAILABLE ?auto_1742629 ) ( SURFACE-AT ?auto_1742622 ?auto_1742624 ) ( ON ?auto_1742622 ?auto_1742630 ) ( CLEAR ?auto_1742622 ) ( not ( = ?auto_1742622 ?auto_1742630 ) ) ( not ( = ?auto_1742623 ?auto_1742630 ) ) ( not ( = ?auto_1742621 ?auto_1742630 ) ) ( not ( = ?auto_1742625 ?auto_1742630 ) ) ( TRUCK-AT ?auto_1742627 ?auto_1742626 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1742622 ?auto_1742623 )
      ( MAKE-2CRATE-VERIFY ?auto_1742621 ?auto_1742622 ?auto_1742623 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1742631 - SURFACE
      ?auto_1742632 - SURFACE
      ?auto_1742633 - SURFACE
      ?auto_1742634 - SURFACE
    )
    :vars
    (
      ?auto_1742641 - HOIST
      ?auto_1742640 - PLACE
      ?auto_1742637 - PLACE
      ?auto_1742636 - HOIST
      ?auto_1742638 - SURFACE
      ?auto_1742639 - SURFACE
      ?auto_1742635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742641 ?auto_1742640 ) ( IS-CRATE ?auto_1742634 ) ( not ( = ?auto_1742633 ?auto_1742634 ) ) ( not ( = ?auto_1742632 ?auto_1742633 ) ) ( not ( = ?auto_1742632 ?auto_1742634 ) ) ( not ( = ?auto_1742637 ?auto_1742640 ) ) ( HOIST-AT ?auto_1742636 ?auto_1742637 ) ( not ( = ?auto_1742641 ?auto_1742636 ) ) ( SURFACE-AT ?auto_1742634 ?auto_1742637 ) ( ON ?auto_1742634 ?auto_1742638 ) ( CLEAR ?auto_1742634 ) ( not ( = ?auto_1742633 ?auto_1742638 ) ) ( not ( = ?auto_1742634 ?auto_1742638 ) ) ( not ( = ?auto_1742632 ?auto_1742638 ) ) ( SURFACE-AT ?auto_1742632 ?auto_1742640 ) ( CLEAR ?auto_1742632 ) ( IS-CRATE ?auto_1742633 ) ( AVAILABLE ?auto_1742641 ) ( AVAILABLE ?auto_1742636 ) ( SURFACE-AT ?auto_1742633 ?auto_1742637 ) ( ON ?auto_1742633 ?auto_1742639 ) ( CLEAR ?auto_1742633 ) ( not ( = ?auto_1742633 ?auto_1742639 ) ) ( not ( = ?auto_1742634 ?auto_1742639 ) ) ( not ( = ?auto_1742632 ?auto_1742639 ) ) ( not ( = ?auto_1742638 ?auto_1742639 ) ) ( TRUCK-AT ?auto_1742635 ?auto_1742640 ) ( ON ?auto_1742632 ?auto_1742631 ) ( not ( = ?auto_1742631 ?auto_1742632 ) ) ( not ( = ?auto_1742631 ?auto_1742633 ) ) ( not ( = ?auto_1742631 ?auto_1742634 ) ) ( not ( = ?auto_1742631 ?auto_1742638 ) ) ( not ( = ?auto_1742631 ?auto_1742639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742632 ?auto_1742633 ?auto_1742634 )
      ( MAKE-3CRATE-VERIFY ?auto_1742631 ?auto_1742632 ?auto_1742633 ?auto_1742634 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1742642 - SURFACE
      ?auto_1742643 - SURFACE
      ?auto_1742644 - SURFACE
      ?auto_1742645 - SURFACE
      ?auto_1742646 - SURFACE
    )
    :vars
    (
      ?auto_1742653 - HOIST
      ?auto_1742652 - PLACE
      ?auto_1742649 - PLACE
      ?auto_1742648 - HOIST
      ?auto_1742650 - SURFACE
      ?auto_1742651 - SURFACE
      ?auto_1742647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742653 ?auto_1742652 ) ( IS-CRATE ?auto_1742646 ) ( not ( = ?auto_1742645 ?auto_1742646 ) ) ( not ( = ?auto_1742644 ?auto_1742645 ) ) ( not ( = ?auto_1742644 ?auto_1742646 ) ) ( not ( = ?auto_1742649 ?auto_1742652 ) ) ( HOIST-AT ?auto_1742648 ?auto_1742649 ) ( not ( = ?auto_1742653 ?auto_1742648 ) ) ( SURFACE-AT ?auto_1742646 ?auto_1742649 ) ( ON ?auto_1742646 ?auto_1742650 ) ( CLEAR ?auto_1742646 ) ( not ( = ?auto_1742645 ?auto_1742650 ) ) ( not ( = ?auto_1742646 ?auto_1742650 ) ) ( not ( = ?auto_1742644 ?auto_1742650 ) ) ( SURFACE-AT ?auto_1742644 ?auto_1742652 ) ( CLEAR ?auto_1742644 ) ( IS-CRATE ?auto_1742645 ) ( AVAILABLE ?auto_1742653 ) ( AVAILABLE ?auto_1742648 ) ( SURFACE-AT ?auto_1742645 ?auto_1742649 ) ( ON ?auto_1742645 ?auto_1742651 ) ( CLEAR ?auto_1742645 ) ( not ( = ?auto_1742645 ?auto_1742651 ) ) ( not ( = ?auto_1742646 ?auto_1742651 ) ) ( not ( = ?auto_1742644 ?auto_1742651 ) ) ( not ( = ?auto_1742650 ?auto_1742651 ) ) ( TRUCK-AT ?auto_1742647 ?auto_1742652 ) ( ON ?auto_1742643 ?auto_1742642 ) ( ON ?auto_1742644 ?auto_1742643 ) ( not ( = ?auto_1742642 ?auto_1742643 ) ) ( not ( = ?auto_1742642 ?auto_1742644 ) ) ( not ( = ?auto_1742642 ?auto_1742645 ) ) ( not ( = ?auto_1742642 ?auto_1742646 ) ) ( not ( = ?auto_1742642 ?auto_1742650 ) ) ( not ( = ?auto_1742642 ?auto_1742651 ) ) ( not ( = ?auto_1742643 ?auto_1742644 ) ) ( not ( = ?auto_1742643 ?auto_1742645 ) ) ( not ( = ?auto_1742643 ?auto_1742646 ) ) ( not ( = ?auto_1742643 ?auto_1742650 ) ) ( not ( = ?auto_1742643 ?auto_1742651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742644 ?auto_1742645 ?auto_1742646 )
      ( MAKE-4CRATE-VERIFY ?auto_1742642 ?auto_1742643 ?auto_1742644 ?auto_1742645 ?auto_1742646 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1742654 - SURFACE
      ?auto_1742655 - SURFACE
      ?auto_1742656 - SURFACE
      ?auto_1742657 - SURFACE
      ?auto_1742658 - SURFACE
      ?auto_1742659 - SURFACE
    )
    :vars
    (
      ?auto_1742666 - HOIST
      ?auto_1742665 - PLACE
      ?auto_1742662 - PLACE
      ?auto_1742661 - HOIST
      ?auto_1742663 - SURFACE
      ?auto_1742664 - SURFACE
      ?auto_1742660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742666 ?auto_1742665 ) ( IS-CRATE ?auto_1742659 ) ( not ( = ?auto_1742658 ?auto_1742659 ) ) ( not ( = ?auto_1742657 ?auto_1742658 ) ) ( not ( = ?auto_1742657 ?auto_1742659 ) ) ( not ( = ?auto_1742662 ?auto_1742665 ) ) ( HOIST-AT ?auto_1742661 ?auto_1742662 ) ( not ( = ?auto_1742666 ?auto_1742661 ) ) ( SURFACE-AT ?auto_1742659 ?auto_1742662 ) ( ON ?auto_1742659 ?auto_1742663 ) ( CLEAR ?auto_1742659 ) ( not ( = ?auto_1742658 ?auto_1742663 ) ) ( not ( = ?auto_1742659 ?auto_1742663 ) ) ( not ( = ?auto_1742657 ?auto_1742663 ) ) ( SURFACE-AT ?auto_1742657 ?auto_1742665 ) ( CLEAR ?auto_1742657 ) ( IS-CRATE ?auto_1742658 ) ( AVAILABLE ?auto_1742666 ) ( AVAILABLE ?auto_1742661 ) ( SURFACE-AT ?auto_1742658 ?auto_1742662 ) ( ON ?auto_1742658 ?auto_1742664 ) ( CLEAR ?auto_1742658 ) ( not ( = ?auto_1742658 ?auto_1742664 ) ) ( not ( = ?auto_1742659 ?auto_1742664 ) ) ( not ( = ?auto_1742657 ?auto_1742664 ) ) ( not ( = ?auto_1742663 ?auto_1742664 ) ) ( TRUCK-AT ?auto_1742660 ?auto_1742665 ) ( ON ?auto_1742655 ?auto_1742654 ) ( ON ?auto_1742656 ?auto_1742655 ) ( ON ?auto_1742657 ?auto_1742656 ) ( not ( = ?auto_1742654 ?auto_1742655 ) ) ( not ( = ?auto_1742654 ?auto_1742656 ) ) ( not ( = ?auto_1742654 ?auto_1742657 ) ) ( not ( = ?auto_1742654 ?auto_1742658 ) ) ( not ( = ?auto_1742654 ?auto_1742659 ) ) ( not ( = ?auto_1742654 ?auto_1742663 ) ) ( not ( = ?auto_1742654 ?auto_1742664 ) ) ( not ( = ?auto_1742655 ?auto_1742656 ) ) ( not ( = ?auto_1742655 ?auto_1742657 ) ) ( not ( = ?auto_1742655 ?auto_1742658 ) ) ( not ( = ?auto_1742655 ?auto_1742659 ) ) ( not ( = ?auto_1742655 ?auto_1742663 ) ) ( not ( = ?auto_1742655 ?auto_1742664 ) ) ( not ( = ?auto_1742656 ?auto_1742657 ) ) ( not ( = ?auto_1742656 ?auto_1742658 ) ) ( not ( = ?auto_1742656 ?auto_1742659 ) ) ( not ( = ?auto_1742656 ?auto_1742663 ) ) ( not ( = ?auto_1742656 ?auto_1742664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742657 ?auto_1742658 ?auto_1742659 )
      ( MAKE-5CRATE-VERIFY ?auto_1742654 ?auto_1742655 ?auto_1742656 ?auto_1742657 ?auto_1742658 ?auto_1742659 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1742667 - SURFACE
      ?auto_1742668 - SURFACE
      ?auto_1742669 - SURFACE
      ?auto_1742670 - SURFACE
      ?auto_1742671 - SURFACE
      ?auto_1742672 - SURFACE
      ?auto_1742673 - SURFACE
    )
    :vars
    (
      ?auto_1742680 - HOIST
      ?auto_1742679 - PLACE
      ?auto_1742676 - PLACE
      ?auto_1742675 - HOIST
      ?auto_1742677 - SURFACE
      ?auto_1742678 - SURFACE
      ?auto_1742674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742680 ?auto_1742679 ) ( IS-CRATE ?auto_1742673 ) ( not ( = ?auto_1742672 ?auto_1742673 ) ) ( not ( = ?auto_1742671 ?auto_1742672 ) ) ( not ( = ?auto_1742671 ?auto_1742673 ) ) ( not ( = ?auto_1742676 ?auto_1742679 ) ) ( HOIST-AT ?auto_1742675 ?auto_1742676 ) ( not ( = ?auto_1742680 ?auto_1742675 ) ) ( SURFACE-AT ?auto_1742673 ?auto_1742676 ) ( ON ?auto_1742673 ?auto_1742677 ) ( CLEAR ?auto_1742673 ) ( not ( = ?auto_1742672 ?auto_1742677 ) ) ( not ( = ?auto_1742673 ?auto_1742677 ) ) ( not ( = ?auto_1742671 ?auto_1742677 ) ) ( SURFACE-AT ?auto_1742671 ?auto_1742679 ) ( CLEAR ?auto_1742671 ) ( IS-CRATE ?auto_1742672 ) ( AVAILABLE ?auto_1742680 ) ( AVAILABLE ?auto_1742675 ) ( SURFACE-AT ?auto_1742672 ?auto_1742676 ) ( ON ?auto_1742672 ?auto_1742678 ) ( CLEAR ?auto_1742672 ) ( not ( = ?auto_1742672 ?auto_1742678 ) ) ( not ( = ?auto_1742673 ?auto_1742678 ) ) ( not ( = ?auto_1742671 ?auto_1742678 ) ) ( not ( = ?auto_1742677 ?auto_1742678 ) ) ( TRUCK-AT ?auto_1742674 ?auto_1742679 ) ( ON ?auto_1742668 ?auto_1742667 ) ( ON ?auto_1742669 ?auto_1742668 ) ( ON ?auto_1742670 ?auto_1742669 ) ( ON ?auto_1742671 ?auto_1742670 ) ( not ( = ?auto_1742667 ?auto_1742668 ) ) ( not ( = ?auto_1742667 ?auto_1742669 ) ) ( not ( = ?auto_1742667 ?auto_1742670 ) ) ( not ( = ?auto_1742667 ?auto_1742671 ) ) ( not ( = ?auto_1742667 ?auto_1742672 ) ) ( not ( = ?auto_1742667 ?auto_1742673 ) ) ( not ( = ?auto_1742667 ?auto_1742677 ) ) ( not ( = ?auto_1742667 ?auto_1742678 ) ) ( not ( = ?auto_1742668 ?auto_1742669 ) ) ( not ( = ?auto_1742668 ?auto_1742670 ) ) ( not ( = ?auto_1742668 ?auto_1742671 ) ) ( not ( = ?auto_1742668 ?auto_1742672 ) ) ( not ( = ?auto_1742668 ?auto_1742673 ) ) ( not ( = ?auto_1742668 ?auto_1742677 ) ) ( not ( = ?auto_1742668 ?auto_1742678 ) ) ( not ( = ?auto_1742669 ?auto_1742670 ) ) ( not ( = ?auto_1742669 ?auto_1742671 ) ) ( not ( = ?auto_1742669 ?auto_1742672 ) ) ( not ( = ?auto_1742669 ?auto_1742673 ) ) ( not ( = ?auto_1742669 ?auto_1742677 ) ) ( not ( = ?auto_1742669 ?auto_1742678 ) ) ( not ( = ?auto_1742670 ?auto_1742671 ) ) ( not ( = ?auto_1742670 ?auto_1742672 ) ) ( not ( = ?auto_1742670 ?auto_1742673 ) ) ( not ( = ?auto_1742670 ?auto_1742677 ) ) ( not ( = ?auto_1742670 ?auto_1742678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742671 ?auto_1742672 ?auto_1742673 )
      ( MAKE-6CRATE-VERIFY ?auto_1742667 ?auto_1742668 ?auto_1742669 ?auto_1742670 ?auto_1742671 ?auto_1742672 ?auto_1742673 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1742681 - SURFACE
      ?auto_1742682 - SURFACE
      ?auto_1742683 - SURFACE
      ?auto_1742684 - SURFACE
      ?auto_1742685 - SURFACE
      ?auto_1742686 - SURFACE
      ?auto_1742687 - SURFACE
      ?auto_1742688 - SURFACE
    )
    :vars
    (
      ?auto_1742695 - HOIST
      ?auto_1742694 - PLACE
      ?auto_1742691 - PLACE
      ?auto_1742690 - HOIST
      ?auto_1742692 - SURFACE
      ?auto_1742693 - SURFACE
      ?auto_1742689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742695 ?auto_1742694 ) ( IS-CRATE ?auto_1742688 ) ( not ( = ?auto_1742687 ?auto_1742688 ) ) ( not ( = ?auto_1742686 ?auto_1742687 ) ) ( not ( = ?auto_1742686 ?auto_1742688 ) ) ( not ( = ?auto_1742691 ?auto_1742694 ) ) ( HOIST-AT ?auto_1742690 ?auto_1742691 ) ( not ( = ?auto_1742695 ?auto_1742690 ) ) ( SURFACE-AT ?auto_1742688 ?auto_1742691 ) ( ON ?auto_1742688 ?auto_1742692 ) ( CLEAR ?auto_1742688 ) ( not ( = ?auto_1742687 ?auto_1742692 ) ) ( not ( = ?auto_1742688 ?auto_1742692 ) ) ( not ( = ?auto_1742686 ?auto_1742692 ) ) ( SURFACE-AT ?auto_1742686 ?auto_1742694 ) ( CLEAR ?auto_1742686 ) ( IS-CRATE ?auto_1742687 ) ( AVAILABLE ?auto_1742695 ) ( AVAILABLE ?auto_1742690 ) ( SURFACE-AT ?auto_1742687 ?auto_1742691 ) ( ON ?auto_1742687 ?auto_1742693 ) ( CLEAR ?auto_1742687 ) ( not ( = ?auto_1742687 ?auto_1742693 ) ) ( not ( = ?auto_1742688 ?auto_1742693 ) ) ( not ( = ?auto_1742686 ?auto_1742693 ) ) ( not ( = ?auto_1742692 ?auto_1742693 ) ) ( TRUCK-AT ?auto_1742689 ?auto_1742694 ) ( ON ?auto_1742682 ?auto_1742681 ) ( ON ?auto_1742683 ?auto_1742682 ) ( ON ?auto_1742684 ?auto_1742683 ) ( ON ?auto_1742685 ?auto_1742684 ) ( ON ?auto_1742686 ?auto_1742685 ) ( not ( = ?auto_1742681 ?auto_1742682 ) ) ( not ( = ?auto_1742681 ?auto_1742683 ) ) ( not ( = ?auto_1742681 ?auto_1742684 ) ) ( not ( = ?auto_1742681 ?auto_1742685 ) ) ( not ( = ?auto_1742681 ?auto_1742686 ) ) ( not ( = ?auto_1742681 ?auto_1742687 ) ) ( not ( = ?auto_1742681 ?auto_1742688 ) ) ( not ( = ?auto_1742681 ?auto_1742692 ) ) ( not ( = ?auto_1742681 ?auto_1742693 ) ) ( not ( = ?auto_1742682 ?auto_1742683 ) ) ( not ( = ?auto_1742682 ?auto_1742684 ) ) ( not ( = ?auto_1742682 ?auto_1742685 ) ) ( not ( = ?auto_1742682 ?auto_1742686 ) ) ( not ( = ?auto_1742682 ?auto_1742687 ) ) ( not ( = ?auto_1742682 ?auto_1742688 ) ) ( not ( = ?auto_1742682 ?auto_1742692 ) ) ( not ( = ?auto_1742682 ?auto_1742693 ) ) ( not ( = ?auto_1742683 ?auto_1742684 ) ) ( not ( = ?auto_1742683 ?auto_1742685 ) ) ( not ( = ?auto_1742683 ?auto_1742686 ) ) ( not ( = ?auto_1742683 ?auto_1742687 ) ) ( not ( = ?auto_1742683 ?auto_1742688 ) ) ( not ( = ?auto_1742683 ?auto_1742692 ) ) ( not ( = ?auto_1742683 ?auto_1742693 ) ) ( not ( = ?auto_1742684 ?auto_1742685 ) ) ( not ( = ?auto_1742684 ?auto_1742686 ) ) ( not ( = ?auto_1742684 ?auto_1742687 ) ) ( not ( = ?auto_1742684 ?auto_1742688 ) ) ( not ( = ?auto_1742684 ?auto_1742692 ) ) ( not ( = ?auto_1742684 ?auto_1742693 ) ) ( not ( = ?auto_1742685 ?auto_1742686 ) ) ( not ( = ?auto_1742685 ?auto_1742687 ) ) ( not ( = ?auto_1742685 ?auto_1742688 ) ) ( not ( = ?auto_1742685 ?auto_1742692 ) ) ( not ( = ?auto_1742685 ?auto_1742693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742686 ?auto_1742687 ?auto_1742688 )
      ( MAKE-7CRATE-VERIFY ?auto_1742681 ?auto_1742682 ?auto_1742683 ?auto_1742684 ?auto_1742685 ?auto_1742686 ?auto_1742687 ?auto_1742688 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1742696 - SURFACE
      ?auto_1742697 - SURFACE
      ?auto_1742698 - SURFACE
      ?auto_1742699 - SURFACE
      ?auto_1742700 - SURFACE
      ?auto_1742701 - SURFACE
      ?auto_1742702 - SURFACE
      ?auto_1742703 - SURFACE
      ?auto_1742704 - SURFACE
    )
    :vars
    (
      ?auto_1742711 - HOIST
      ?auto_1742710 - PLACE
      ?auto_1742707 - PLACE
      ?auto_1742706 - HOIST
      ?auto_1742708 - SURFACE
      ?auto_1742709 - SURFACE
      ?auto_1742705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742711 ?auto_1742710 ) ( IS-CRATE ?auto_1742704 ) ( not ( = ?auto_1742703 ?auto_1742704 ) ) ( not ( = ?auto_1742702 ?auto_1742703 ) ) ( not ( = ?auto_1742702 ?auto_1742704 ) ) ( not ( = ?auto_1742707 ?auto_1742710 ) ) ( HOIST-AT ?auto_1742706 ?auto_1742707 ) ( not ( = ?auto_1742711 ?auto_1742706 ) ) ( SURFACE-AT ?auto_1742704 ?auto_1742707 ) ( ON ?auto_1742704 ?auto_1742708 ) ( CLEAR ?auto_1742704 ) ( not ( = ?auto_1742703 ?auto_1742708 ) ) ( not ( = ?auto_1742704 ?auto_1742708 ) ) ( not ( = ?auto_1742702 ?auto_1742708 ) ) ( SURFACE-AT ?auto_1742702 ?auto_1742710 ) ( CLEAR ?auto_1742702 ) ( IS-CRATE ?auto_1742703 ) ( AVAILABLE ?auto_1742711 ) ( AVAILABLE ?auto_1742706 ) ( SURFACE-AT ?auto_1742703 ?auto_1742707 ) ( ON ?auto_1742703 ?auto_1742709 ) ( CLEAR ?auto_1742703 ) ( not ( = ?auto_1742703 ?auto_1742709 ) ) ( not ( = ?auto_1742704 ?auto_1742709 ) ) ( not ( = ?auto_1742702 ?auto_1742709 ) ) ( not ( = ?auto_1742708 ?auto_1742709 ) ) ( TRUCK-AT ?auto_1742705 ?auto_1742710 ) ( ON ?auto_1742697 ?auto_1742696 ) ( ON ?auto_1742698 ?auto_1742697 ) ( ON ?auto_1742699 ?auto_1742698 ) ( ON ?auto_1742700 ?auto_1742699 ) ( ON ?auto_1742701 ?auto_1742700 ) ( ON ?auto_1742702 ?auto_1742701 ) ( not ( = ?auto_1742696 ?auto_1742697 ) ) ( not ( = ?auto_1742696 ?auto_1742698 ) ) ( not ( = ?auto_1742696 ?auto_1742699 ) ) ( not ( = ?auto_1742696 ?auto_1742700 ) ) ( not ( = ?auto_1742696 ?auto_1742701 ) ) ( not ( = ?auto_1742696 ?auto_1742702 ) ) ( not ( = ?auto_1742696 ?auto_1742703 ) ) ( not ( = ?auto_1742696 ?auto_1742704 ) ) ( not ( = ?auto_1742696 ?auto_1742708 ) ) ( not ( = ?auto_1742696 ?auto_1742709 ) ) ( not ( = ?auto_1742697 ?auto_1742698 ) ) ( not ( = ?auto_1742697 ?auto_1742699 ) ) ( not ( = ?auto_1742697 ?auto_1742700 ) ) ( not ( = ?auto_1742697 ?auto_1742701 ) ) ( not ( = ?auto_1742697 ?auto_1742702 ) ) ( not ( = ?auto_1742697 ?auto_1742703 ) ) ( not ( = ?auto_1742697 ?auto_1742704 ) ) ( not ( = ?auto_1742697 ?auto_1742708 ) ) ( not ( = ?auto_1742697 ?auto_1742709 ) ) ( not ( = ?auto_1742698 ?auto_1742699 ) ) ( not ( = ?auto_1742698 ?auto_1742700 ) ) ( not ( = ?auto_1742698 ?auto_1742701 ) ) ( not ( = ?auto_1742698 ?auto_1742702 ) ) ( not ( = ?auto_1742698 ?auto_1742703 ) ) ( not ( = ?auto_1742698 ?auto_1742704 ) ) ( not ( = ?auto_1742698 ?auto_1742708 ) ) ( not ( = ?auto_1742698 ?auto_1742709 ) ) ( not ( = ?auto_1742699 ?auto_1742700 ) ) ( not ( = ?auto_1742699 ?auto_1742701 ) ) ( not ( = ?auto_1742699 ?auto_1742702 ) ) ( not ( = ?auto_1742699 ?auto_1742703 ) ) ( not ( = ?auto_1742699 ?auto_1742704 ) ) ( not ( = ?auto_1742699 ?auto_1742708 ) ) ( not ( = ?auto_1742699 ?auto_1742709 ) ) ( not ( = ?auto_1742700 ?auto_1742701 ) ) ( not ( = ?auto_1742700 ?auto_1742702 ) ) ( not ( = ?auto_1742700 ?auto_1742703 ) ) ( not ( = ?auto_1742700 ?auto_1742704 ) ) ( not ( = ?auto_1742700 ?auto_1742708 ) ) ( not ( = ?auto_1742700 ?auto_1742709 ) ) ( not ( = ?auto_1742701 ?auto_1742702 ) ) ( not ( = ?auto_1742701 ?auto_1742703 ) ) ( not ( = ?auto_1742701 ?auto_1742704 ) ) ( not ( = ?auto_1742701 ?auto_1742708 ) ) ( not ( = ?auto_1742701 ?auto_1742709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742702 ?auto_1742703 ?auto_1742704 )
      ( MAKE-8CRATE-VERIFY ?auto_1742696 ?auto_1742697 ?auto_1742698 ?auto_1742699 ?auto_1742700 ?auto_1742701 ?auto_1742702 ?auto_1742703 ?auto_1742704 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1742712 - SURFACE
      ?auto_1742713 - SURFACE
      ?auto_1742714 - SURFACE
      ?auto_1742715 - SURFACE
      ?auto_1742716 - SURFACE
      ?auto_1742717 - SURFACE
      ?auto_1742718 - SURFACE
      ?auto_1742719 - SURFACE
      ?auto_1742720 - SURFACE
      ?auto_1742721 - SURFACE
    )
    :vars
    (
      ?auto_1742728 - HOIST
      ?auto_1742727 - PLACE
      ?auto_1742724 - PLACE
      ?auto_1742723 - HOIST
      ?auto_1742725 - SURFACE
      ?auto_1742726 - SURFACE
      ?auto_1742722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742728 ?auto_1742727 ) ( IS-CRATE ?auto_1742721 ) ( not ( = ?auto_1742720 ?auto_1742721 ) ) ( not ( = ?auto_1742719 ?auto_1742720 ) ) ( not ( = ?auto_1742719 ?auto_1742721 ) ) ( not ( = ?auto_1742724 ?auto_1742727 ) ) ( HOIST-AT ?auto_1742723 ?auto_1742724 ) ( not ( = ?auto_1742728 ?auto_1742723 ) ) ( SURFACE-AT ?auto_1742721 ?auto_1742724 ) ( ON ?auto_1742721 ?auto_1742725 ) ( CLEAR ?auto_1742721 ) ( not ( = ?auto_1742720 ?auto_1742725 ) ) ( not ( = ?auto_1742721 ?auto_1742725 ) ) ( not ( = ?auto_1742719 ?auto_1742725 ) ) ( SURFACE-AT ?auto_1742719 ?auto_1742727 ) ( CLEAR ?auto_1742719 ) ( IS-CRATE ?auto_1742720 ) ( AVAILABLE ?auto_1742728 ) ( AVAILABLE ?auto_1742723 ) ( SURFACE-AT ?auto_1742720 ?auto_1742724 ) ( ON ?auto_1742720 ?auto_1742726 ) ( CLEAR ?auto_1742720 ) ( not ( = ?auto_1742720 ?auto_1742726 ) ) ( not ( = ?auto_1742721 ?auto_1742726 ) ) ( not ( = ?auto_1742719 ?auto_1742726 ) ) ( not ( = ?auto_1742725 ?auto_1742726 ) ) ( TRUCK-AT ?auto_1742722 ?auto_1742727 ) ( ON ?auto_1742713 ?auto_1742712 ) ( ON ?auto_1742714 ?auto_1742713 ) ( ON ?auto_1742715 ?auto_1742714 ) ( ON ?auto_1742716 ?auto_1742715 ) ( ON ?auto_1742717 ?auto_1742716 ) ( ON ?auto_1742718 ?auto_1742717 ) ( ON ?auto_1742719 ?auto_1742718 ) ( not ( = ?auto_1742712 ?auto_1742713 ) ) ( not ( = ?auto_1742712 ?auto_1742714 ) ) ( not ( = ?auto_1742712 ?auto_1742715 ) ) ( not ( = ?auto_1742712 ?auto_1742716 ) ) ( not ( = ?auto_1742712 ?auto_1742717 ) ) ( not ( = ?auto_1742712 ?auto_1742718 ) ) ( not ( = ?auto_1742712 ?auto_1742719 ) ) ( not ( = ?auto_1742712 ?auto_1742720 ) ) ( not ( = ?auto_1742712 ?auto_1742721 ) ) ( not ( = ?auto_1742712 ?auto_1742725 ) ) ( not ( = ?auto_1742712 ?auto_1742726 ) ) ( not ( = ?auto_1742713 ?auto_1742714 ) ) ( not ( = ?auto_1742713 ?auto_1742715 ) ) ( not ( = ?auto_1742713 ?auto_1742716 ) ) ( not ( = ?auto_1742713 ?auto_1742717 ) ) ( not ( = ?auto_1742713 ?auto_1742718 ) ) ( not ( = ?auto_1742713 ?auto_1742719 ) ) ( not ( = ?auto_1742713 ?auto_1742720 ) ) ( not ( = ?auto_1742713 ?auto_1742721 ) ) ( not ( = ?auto_1742713 ?auto_1742725 ) ) ( not ( = ?auto_1742713 ?auto_1742726 ) ) ( not ( = ?auto_1742714 ?auto_1742715 ) ) ( not ( = ?auto_1742714 ?auto_1742716 ) ) ( not ( = ?auto_1742714 ?auto_1742717 ) ) ( not ( = ?auto_1742714 ?auto_1742718 ) ) ( not ( = ?auto_1742714 ?auto_1742719 ) ) ( not ( = ?auto_1742714 ?auto_1742720 ) ) ( not ( = ?auto_1742714 ?auto_1742721 ) ) ( not ( = ?auto_1742714 ?auto_1742725 ) ) ( not ( = ?auto_1742714 ?auto_1742726 ) ) ( not ( = ?auto_1742715 ?auto_1742716 ) ) ( not ( = ?auto_1742715 ?auto_1742717 ) ) ( not ( = ?auto_1742715 ?auto_1742718 ) ) ( not ( = ?auto_1742715 ?auto_1742719 ) ) ( not ( = ?auto_1742715 ?auto_1742720 ) ) ( not ( = ?auto_1742715 ?auto_1742721 ) ) ( not ( = ?auto_1742715 ?auto_1742725 ) ) ( not ( = ?auto_1742715 ?auto_1742726 ) ) ( not ( = ?auto_1742716 ?auto_1742717 ) ) ( not ( = ?auto_1742716 ?auto_1742718 ) ) ( not ( = ?auto_1742716 ?auto_1742719 ) ) ( not ( = ?auto_1742716 ?auto_1742720 ) ) ( not ( = ?auto_1742716 ?auto_1742721 ) ) ( not ( = ?auto_1742716 ?auto_1742725 ) ) ( not ( = ?auto_1742716 ?auto_1742726 ) ) ( not ( = ?auto_1742717 ?auto_1742718 ) ) ( not ( = ?auto_1742717 ?auto_1742719 ) ) ( not ( = ?auto_1742717 ?auto_1742720 ) ) ( not ( = ?auto_1742717 ?auto_1742721 ) ) ( not ( = ?auto_1742717 ?auto_1742725 ) ) ( not ( = ?auto_1742717 ?auto_1742726 ) ) ( not ( = ?auto_1742718 ?auto_1742719 ) ) ( not ( = ?auto_1742718 ?auto_1742720 ) ) ( not ( = ?auto_1742718 ?auto_1742721 ) ) ( not ( = ?auto_1742718 ?auto_1742725 ) ) ( not ( = ?auto_1742718 ?auto_1742726 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742719 ?auto_1742720 ?auto_1742721 )
      ( MAKE-9CRATE-VERIFY ?auto_1742712 ?auto_1742713 ?auto_1742714 ?auto_1742715 ?auto_1742716 ?auto_1742717 ?auto_1742718 ?auto_1742719 ?auto_1742720 ?auto_1742721 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1742729 - SURFACE
      ?auto_1742730 - SURFACE
      ?auto_1742731 - SURFACE
      ?auto_1742732 - SURFACE
      ?auto_1742733 - SURFACE
      ?auto_1742734 - SURFACE
      ?auto_1742735 - SURFACE
      ?auto_1742736 - SURFACE
      ?auto_1742737 - SURFACE
      ?auto_1742738 - SURFACE
      ?auto_1742739 - SURFACE
    )
    :vars
    (
      ?auto_1742746 - HOIST
      ?auto_1742745 - PLACE
      ?auto_1742742 - PLACE
      ?auto_1742741 - HOIST
      ?auto_1742743 - SURFACE
      ?auto_1742744 - SURFACE
      ?auto_1742740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742746 ?auto_1742745 ) ( IS-CRATE ?auto_1742739 ) ( not ( = ?auto_1742738 ?auto_1742739 ) ) ( not ( = ?auto_1742737 ?auto_1742738 ) ) ( not ( = ?auto_1742737 ?auto_1742739 ) ) ( not ( = ?auto_1742742 ?auto_1742745 ) ) ( HOIST-AT ?auto_1742741 ?auto_1742742 ) ( not ( = ?auto_1742746 ?auto_1742741 ) ) ( SURFACE-AT ?auto_1742739 ?auto_1742742 ) ( ON ?auto_1742739 ?auto_1742743 ) ( CLEAR ?auto_1742739 ) ( not ( = ?auto_1742738 ?auto_1742743 ) ) ( not ( = ?auto_1742739 ?auto_1742743 ) ) ( not ( = ?auto_1742737 ?auto_1742743 ) ) ( SURFACE-AT ?auto_1742737 ?auto_1742745 ) ( CLEAR ?auto_1742737 ) ( IS-CRATE ?auto_1742738 ) ( AVAILABLE ?auto_1742746 ) ( AVAILABLE ?auto_1742741 ) ( SURFACE-AT ?auto_1742738 ?auto_1742742 ) ( ON ?auto_1742738 ?auto_1742744 ) ( CLEAR ?auto_1742738 ) ( not ( = ?auto_1742738 ?auto_1742744 ) ) ( not ( = ?auto_1742739 ?auto_1742744 ) ) ( not ( = ?auto_1742737 ?auto_1742744 ) ) ( not ( = ?auto_1742743 ?auto_1742744 ) ) ( TRUCK-AT ?auto_1742740 ?auto_1742745 ) ( ON ?auto_1742730 ?auto_1742729 ) ( ON ?auto_1742731 ?auto_1742730 ) ( ON ?auto_1742732 ?auto_1742731 ) ( ON ?auto_1742733 ?auto_1742732 ) ( ON ?auto_1742734 ?auto_1742733 ) ( ON ?auto_1742735 ?auto_1742734 ) ( ON ?auto_1742736 ?auto_1742735 ) ( ON ?auto_1742737 ?auto_1742736 ) ( not ( = ?auto_1742729 ?auto_1742730 ) ) ( not ( = ?auto_1742729 ?auto_1742731 ) ) ( not ( = ?auto_1742729 ?auto_1742732 ) ) ( not ( = ?auto_1742729 ?auto_1742733 ) ) ( not ( = ?auto_1742729 ?auto_1742734 ) ) ( not ( = ?auto_1742729 ?auto_1742735 ) ) ( not ( = ?auto_1742729 ?auto_1742736 ) ) ( not ( = ?auto_1742729 ?auto_1742737 ) ) ( not ( = ?auto_1742729 ?auto_1742738 ) ) ( not ( = ?auto_1742729 ?auto_1742739 ) ) ( not ( = ?auto_1742729 ?auto_1742743 ) ) ( not ( = ?auto_1742729 ?auto_1742744 ) ) ( not ( = ?auto_1742730 ?auto_1742731 ) ) ( not ( = ?auto_1742730 ?auto_1742732 ) ) ( not ( = ?auto_1742730 ?auto_1742733 ) ) ( not ( = ?auto_1742730 ?auto_1742734 ) ) ( not ( = ?auto_1742730 ?auto_1742735 ) ) ( not ( = ?auto_1742730 ?auto_1742736 ) ) ( not ( = ?auto_1742730 ?auto_1742737 ) ) ( not ( = ?auto_1742730 ?auto_1742738 ) ) ( not ( = ?auto_1742730 ?auto_1742739 ) ) ( not ( = ?auto_1742730 ?auto_1742743 ) ) ( not ( = ?auto_1742730 ?auto_1742744 ) ) ( not ( = ?auto_1742731 ?auto_1742732 ) ) ( not ( = ?auto_1742731 ?auto_1742733 ) ) ( not ( = ?auto_1742731 ?auto_1742734 ) ) ( not ( = ?auto_1742731 ?auto_1742735 ) ) ( not ( = ?auto_1742731 ?auto_1742736 ) ) ( not ( = ?auto_1742731 ?auto_1742737 ) ) ( not ( = ?auto_1742731 ?auto_1742738 ) ) ( not ( = ?auto_1742731 ?auto_1742739 ) ) ( not ( = ?auto_1742731 ?auto_1742743 ) ) ( not ( = ?auto_1742731 ?auto_1742744 ) ) ( not ( = ?auto_1742732 ?auto_1742733 ) ) ( not ( = ?auto_1742732 ?auto_1742734 ) ) ( not ( = ?auto_1742732 ?auto_1742735 ) ) ( not ( = ?auto_1742732 ?auto_1742736 ) ) ( not ( = ?auto_1742732 ?auto_1742737 ) ) ( not ( = ?auto_1742732 ?auto_1742738 ) ) ( not ( = ?auto_1742732 ?auto_1742739 ) ) ( not ( = ?auto_1742732 ?auto_1742743 ) ) ( not ( = ?auto_1742732 ?auto_1742744 ) ) ( not ( = ?auto_1742733 ?auto_1742734 ) ) ( not ( = ?auto_1742733 ?auto_1742735 ) ) ( not ( = ?auto_1742733 ?auto_1742736 ) ) ( not ( = ?auto_1742733 ?auto_1742737 ) ) ( not ( = ?auto_1742733 ?auto_1742738 ) ) ( not ( = ?auto_1742733 ?auto_1742739 ) ) ( not ( = ?auto_1742733 ?auto_1742743 ) ) ( not ( = ?auto_1742733 ?auto_1742744 ) ) ( not ( = ?auto_1742734 ?auto_1742735 ) ) ( not ( = ?auto_1742734 ?auto_1742736 ) ) ( not ( = ?auto_1742734 ?auto_1742737 ) ) ( not ( = ?auto_1742734 ?auto_1742738 ) ) ( not ( = ?auto_1742734 ?auto_1742739 ) ) ( not ( = ?auto_1742734 ?auto_1742743 ) ) ( not ( = ?auto_1742734 ?auto_1742744 ) ) ( not ( = ?auto_1742735 ?auto_1742736 ) ) ( not ( = ?auto_1742735 ?auto_1742737 ) ) ( not ( = ?auto_1742735 ?auto_1742738 ) ) ( not ( = ?auto_1742735 ?auto_1742739 ) ) ( not ( = ?auto_1742735 ?auto_1742743 ) ) ( not ( = ?auto_1742735 ?auto_1742744 ) ) ( not ( = ?auto_1742736 ?auto_1742737 ) ) ( not ( = ?auto_1742736 ?auto_1742738 ) ) ( not ( = ?auto_1742736 ?auto_1742739 ) ) ( not ( = ?auto_1742736 ?auto_1742743 ) ) ( not ( = ?auto_1742736 ?auto_1742744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742737 ?auto_1742738 ?auto_1742739 )
      ( MAKE-10CRATE-VERIFY ?auto_1742729 ?auto_1742730 ?auto_1742731 ?auto_1742732 ?auto_1742733 ?auto_1742734 ?auto_1742735 ?auto_1742736 ?auto_1742737 ?auto_1742738 ?auto_1742739 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1742747 - SURFACE
      ?auto_1742748 - SURFACE
      ?auto_1742749 - SURFACE
      ?auto_1742750 - SURFACE
      ?auto_1742751 - SURFACE
      ?auto_1742752 - SURFACE
      ?auto_1742753 - SURFACE
      ?auto_1742754 - SURFACE
      ?auto_1742755 - SURFACE
      ?auto_1742756 - SURFACE
      ?auto_1742757 - SURFACE
      ?auto_1742758 - SURFACE
    )
    :vars
    (
      ?auto_1742765 - HOIST
      ?auto_1742764 - PLACE
      ?auto_1742761 - PLACE
      ?auto_1742760 - HOIST
      ?auto_1742762 - SURFACE
      ?auto_1742763 - SURFACE
      ?auto_1742759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742765 ?auto_1742764 ) ( IS-CRATE ?auto_1742758 ) ( not ( = ?auto_1742757 ?auto_1742758 ) ) ( not ( = ?auto_1742756 ?auto_1742757 ) ) ( not ( = ?auto_1742756 ?auto_1742758 ) ) ( not ( = ?auto_1742761 ?auto_1742764 ) ) ( HOIST-AT ?auto_1742760 ?auto_1742761 ) ( not ( = ?auto_1742765 ?auto_1742760 ) ) ( SURFACE-AT ?auto_1742758 ?auto_1742761 ) ( ON ?auto_1742758 ?auto_1742762 ) ( CLEAR ?auto_1742758 ) ( not ( = ?auto_1742757 ?auto_1742762 ) ) ( not ( = ?auto_1742758 ?auto_1742762 ) ) ( not ( = ?auto_1742756 ?auto_1742762 ) ) ( SURFACE-AT ?auto_1742756 ?auto_1742764 ) ( CLEAR ?auto_1742756 ) ( IS-CRATE ?auto_1742757 ) ( AVAILABLE ?auto_1742765 ) ( AVAILABLE ?auto_1742760 ) ( SURFACE-AT ?auto_1742757 ?auto_1742761 ) ( ON ?auto_1742757 ?auto_1742763 ) ( CLEAR ?auto_1742757 ) ( not ( = ?auto_1742757 ?auto_1742763 ) ) ( not ( = ?auto_1742758 ?auto_1742763 ) ) ( not ( = ?auto_1742756 ?auto_1742763 ) ) ( not ( = ?auto_1742762 ?auto_1742763 ) ) ( TRUCK-AT ?auto_1742759 ?auto_1742764 ) ( ON ?auto_1742748 ?auto_1742747 ) ( ON ?auto_1742749 ?auto_1742748 ) ( ON ?auto_1742750 ?auto_1742749 ) ( ON ?auto_1742751 ?auto_1742750 ) ( ON ?auto_1742752 ?auto_1742751 ) ( ON ?auto_1742753 ?auto_1742752 ) ( ON ?auto_1742754 ?auto_1742753 ) ( ON ?auto_1742755 ?auto_1742754 ) ( ON ?auto_1742756 ?auto_1742755 ) ( not ( = ?auto_1742747 ?auto_1742748 ) ) ( not ( = ?auto_1742747 ?auto_1742749 ) ) ( not ( = ?auto_1742747 ?auto_1742750 ) ) ( not ( = ?auto_1742747 ?auto_1742751 ) ) ( not ( = ?auto_1742747 ?auto_1742752 ) ) ( not ( = ?auto_1742747 ?auto_1742753 ) ) ( not ( = ?auto_1742747 ?auto_1742754 ) ) ( not ( = ?auto_1742747 ?auto_1742755 ) ) ( not ( = ?auto_1742747 ?auto_1742756 ) ) ( not ( = ?auto_1742747 ?auto_1742757 ) ) ( not ( = ?auto_1742747 ?auto_1742758 ) ) ( not ( = ?auto_1742747 ?auto_1742762 ) ) ( not ( = ?auto_1742747 ?auto_1742763 ) ) ( not ( = ?auto_1742748 ?auto_1742749 ) ) ( not ( = ?auto_1742748 ?auto_1742750 ) ) ( not ( = ?auto_1742748 ?auto_1742751 ) ) ( not ( = ?auto_1742748 ?auto_1742752 ) ) ( not ( = ?auto_1742748 ?auto_1742753 ) ) ( not ( = ?auto_1742748 ?auto_1742754 ) ) ( not ( = ?auto_1742748 ?auto_1742755 ) ) ( not ( = ?auto_1742748 ?auto_1742756 ) ) ( not ( = ?auto_1742748 ?auto_1742757 ) ) ( not ( = ?auto_1742748 ?auto_1742758 ) ) ( not ( = ?auto_1742748 ?auto_1742762 ) ) ( not ( = ?auto_1742748 ?auto_1742763 ) ) ( not ( = ?auto_1742749 ?auto_1742750 ) ) ( not ( = ?auto_1742749 ?auto_1742751 ) ) ( not ( = ?auto_1742749 ?auto_1742752 ) ) ( not ( = ?auto_1742749 ?auto_1742753 ) ) ( not ( = ?auto_1742749 ?auto_1742754 ) ) ( not ( = ?auto_1742749 ?auto_1742755 ) ) ( not ( = ?auto_1742749 ?auto_1742756 ) ) ( not ( = ?auto_1742749 ?auto_1742757 ) ) ( not ( = ?auto_1742749 ?auto_1742758 ) ) ( not ( = ?auto_1742749 ?auto_1742762 ) ) ( not ( = ?auto_1742749 ?auto_1742763 ) ) ( not ( = ?auto_1742750 ?auto_1742751 ) ) ( not ( = ?auto_1742750 ?auto_1742752 ) ) ( not ( = ?auto_1742750 ?auto_1742753 ) ) ( not ( = ?auto_1742750 ?auto_1742754 ) ) ( not ( = ?auto_1742750 ?auto_1742755 ) ) ( not ( = ?auto_1742750 ?auto_1742756 ) ) ( not ( = ?auto_1742750 ?auto_1742757 ) ) ( not ( = ?auto_1742750 ?auto_1742758 ) ) ( not ( = ?auto_1742750 ?auto_1742762 ) ) ( not ( = ?auto_1742750 ?auto_1742763 ) ) ( not ( = ?auto_1742751 ?auto_1742752 ) ) ( not ( = ?auto_1742751 ?auto_1742753 ) ) ( not ( = ?auto_1742751 ?auto_1742754 ) ) ( not ( = ?auto_1742751 ?auto_1742755 ) ) ( not ( = ?auto_1742751 ?auto_1742756 ) ) ( not ( = ?auto_1742751 ?auto_1742757 ) ) ( not ( = ?auto_1742751 ?auto_1742758 ) ) ( not ( = ?auto_1742751 ?auto_1742762 ) ) ( not ( = ?auto_1742751 ?auto_1742763 ) ) ( not ( = ?auto_1742752 ?auto_1742753 ) ) ( not ( = ?auto_1742752 ?auto_1742754 ) ) ( not ( = ?auto_1742752 ?auto_1742755 ) ) ( not ( = ?auto_1742752 ?auto_1742756 ) ) ( not ( = ?auto_1742752 ?auto_1742757 ) ) ( not ( = ?auto_1742752 ?auto_1742758 ) ) ( not ( = ?auto_1742752 ?auto_1742762 ) ) ( not ( = ?auto_1742752 ?auto_1742763 ) ) ( not ( = ?auto_1742753 ?auto_1742754 ) ) ( not ( = ?auto_1742753 ?auto_1742755 ) ) ( not ( = ?auto_1742753 ?auto_1742756 ) ) ( not ( = ?auto_1742753 ?auto_1742757 ) ) ( not ( = ?auto_1742753 ?auto_1742758 ) ) ( not ( = ?auto_1742753 ?auto_1742762 ) ) ( not ( = ?auto_1742753 ?auto_1742763 ) ) ( not ( = ?auto_1742754 ?auto_1742755 ) ) ( not ( = ?auto_1742754 ?auto_1742756 ) ) ( not ( = ?auto_1742754 ?auto_1742757 ) ) ( not ( = ?auto_1742754 ?auto_1742758 ) ) ( not ( = ?auto_1742754 ?auto_1742762 ) ) ( not ( = ?auto_1742754 ?auto_1742763 ) ) ( not ( = ?auto_1742755 ?auto_1742756 ) ) ( not ( = ?auto_1742755 ?auto_1742757 ) ) ( not ( = ?auto_1742755 ?auto_1742758 ) ) ( not ( = ?auto_1742755 ?auto_1742762 ) ) ( not ( = ?auto_1742755 ?auto_1742763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742756 ?auto_1742757 ?auto_1742758 )
      ( MAKE-11CRATE-VERIFY ?auto_1742747 ?auto_1742748 ?auto_1742749 ?auto_1742750 ?auto_1742751 ?auto_1742752 ?auto_1742753 ?auto_1742754 ?auto_1742755 ?auto_1742756 ?auto_1742757 ?auto_1742758 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1742766 - SURFACE
      ?auto_1742767 - SURFACE
      ?auto_1742768 - SURFACE
      ?auto_1742769 - SURFACE
      ?auto_1742770 - SURFACE
      ?auto_1742771 - SURFACE
      ?auto_1742772 - SURFACE
      ?auto_1742773 - SURFACE
      ?auto_1742774 - SURFACE
      ?auto_1742775 - SURFACE
      ?auto_1742776 - SURFACE
      ?auto_1742777 - SURFACE
      ?auto_1742778 - SURFACE
    )
    :vars
    (
      ?auto_1742785 - HOIST
      ?auto_1742784 - PLACE
      ?auto_1742781 - PLACE
      ?auto_1742780 - HOIST
      ?auto_1742782 - SURFACE
      ?auto_1742783 - SURFACE
      ?auto_1742779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742785 ?auto_1742784 ) ( IS-CRATE ?auto_1742778 ) ( not ( = ?auto_1742777 ?auto_1742778 ) ) ( not ( = ?auto_1742776 ?auto_1742777 ) ) ( not ( = ?auto_1742776 ?auto_1742778 ) ) ( not ( = ?auto_1742781 ?auto_1742784 ) ) ( HOIST-AT ?auto_1742780 ?auto_1742781 ) ( not ( = ?auto_1742785 ?auto_1742780 ) ) ( SURFACE-AT ?auto_1742778 ?auto_1742781 ) ( ON ?auto_1742778 ?auto_1742782 ) ( CLEAR ?auto_1742778 ) ( not ( = ?auto_1742777 ?auto_1742782 ) ) ( not ( = ?auto_1742778 ?auto_1742782 ) ) ( not ( = ?auto_1742776 ?auto_1742782 ) ) ( SURFACE-AT ?auto_1742776 ?auto_1742784 ) ( CLEAR ?auto_1742776 ) ( IS-CRATE ?auto_1742777 ) ( AVAILABLE ?auto_1742785 ) ( AVAILABLE ?auto_1742780 ) ( SURFACE-AT ?auto_1742777 ?auto_1742781 ) ( ON ?auto_1742777 ?auto_1742783 ) ( CLEAR ?auto_1742777 ) ( not ( = ?auto_1742777 ?auto_1742783 ) ) ( not ( = ?auto_1742778 ?auto_1742783 ) ) ( not ( = ?auto_1742776 ?auto_1742783 ) ) ( not ( = ?auto_1742782 ?auto_1742783 ) ) ( TRUCK-AT ?auto_1742779 ?auto_1742784 ) ( ON ?auto_1742767 ?auto_1742766 ) ( ON ?auto_1742768 ?auto_1742767 ) ( ON ?auto_1742769 ?auto_1742768 ) ( ON ?auto_1742770 ?auto_1742769 ) ( ON ?auto_1742771 ?auto_1742770 ) ( ON ?auto_1742772 ?auto_1742771 ) ( ON ?auto_1742773 ?auto_1742772 ) ( ON ?auto_1742774 ?auto_1742773 ) ( ON ?auto_1742775 ?auto_1742774 ) ( ON ?auto_1742776 ?auto_1742775 ) ( not ( = ?auto_1742766 ?auto_1742767 ) ) ( not ( = ?auto_1742766 ?auto_1742768 ) ) ( not ( = ?auto_1742766 ?auto_1742769 ) ) ( not ( = ?auto_1742766 ?auto_1742770 ) ) ( not ( = ?auto_1742766 ?auto_1742771 ) ) ( not ( = ?auto_1742766 ?auto_1742772 ) ) ( not ( = ?auto_1742766 ?auto_1742773 ) ) ( not ( = ?auto_1742766 ?auto_1742774 ) ) ( not ( = ?auto_1742766 ?auto_1742775 ) ) ( not ( = ?auto_1742766 ?auto_1742776 ) ) ( not ( = ?auto_1742766 ?auto_1742777 ) ) ( not ( = ?auto_1742766 ?auto_1742778 ) ) ( not ( = ?auto_1742766 ?auto_1742782 ) ) ( not ( = ?auto_1742766 ?auto_1742783 ) ) ( not ( = ?auto_1742767 ?auto_1742768 ) ) ( not ( = ?auto_1742767 ?auto_1742769 ) ) ( not ( = ?auto_1742767 ?auto_1742770 ) ) ( not ( = ?auto_1742767 ?auto_1742771 ) ) ( not ( = ?auto_1742767 ?auto_1742772 ) ) ( not ( = ?auto_1742767 ?auto_1742773 ) ) ( not ( = ?auto_1742767 ?auto_1742774 ) ) ( not ( = ?auto_1742767 ?auto_1742775 ) ) ( not ( = ?auto_1742767 ?auto_1742776 ) ) ( not ( = ?auto_1742767 ?auto_1742777 ) ) ( not ( = ?auto_1742767 ?auto_1742778 ) ) ( not ( = ?auto_1742767 ?auto_1742782 ) ) ( not ( = ?auto_1742767 ?auto_1742783 ) ) ( not ( = ?auto_1742768 ?auto_1742769 ) ) ( not ( = ?auto_1742768 ?auto_1742770 ) ) ( not ( = ?auto_1742768 ?auto_1742771 ) ) ( not ( = ?auto_1742768 ?auto_1742772 ) ) ( not ( = ?auto_1742768 ?auto_1742773 ) ) ( not ( = ?auto_1742768 ?auto_1742774 ) ) ( not ( = ?auto_1742768 ?auto_1742775 ) ) ( not ( = ?auto_1742768 ?auto_1742776 ) ) ( not ( = ?auto_1742768 ?auto_1742777 ) ) ( not ( = ?auto_1742768 ?auto_1742778 ) ) ( not ( = ?auto_1742768 ?auto_1742782 ) ) ( not ( = ?auto_1742768 ?auto_1742783 ) ) ( not ( = ?auto_1742769 ?auto_1742770 ) ) ( not ( = ?auto_1742769 ?auto_1742771 ) ) ( not ( = ?auto_1742769 ?auto_1742772 ) ) ( not ( = ?auto_1742769 ?auto_1742773 ) ) ( not ( = ?auto_1742769 ?auto_1742774 ) ) ( not ( = ?auto_1742769 ?auto_1742775 ) ) ( not ( = ?auto_1742769 ?auto_1742776 ) ) ( not ( = ?auto_1742769 ?auto_1742777 ) ) ( not ( = ?auto_1742769 ?auto_1742778 ) ) ( not ( = ?auto_1742769 ?auto_1742782 ) ) ( not ( = ?auto_1742769 ?auto_1742783 ) ) ( not ( = ?auto_1742770 ?auto_1742771 ) ) ( not ( = ?auto_1742770 ?auto_1742772 ) ) ( not ( = ?auto_1742770 ?auto_1742773 ) ) ( not ( = ?auto_1742770 ?auto_1742774 ) ) ( not ( = ?auto_1742770 ?auto_1742775 ) ) ( not ( = ?auto_1742770 ?auto_1742776 ) ) ( not ( = ?auto_1742770 ?auto_1742777 ) ) ( not ( = ?auto_1742770 ?auto_1742778 ) ) ( not ( = ?auto_1742770 ?auto_1742782 ) ) ( not ( = ?auto_1742770 ?auto_1742783 ) ) ( not ( = ?auto_1742771 ?auto_1742772 ) ) ( not ( = ?auto_1742771 ?auto_1742773 ) ) ( not ( = ?auto_1742771 ?auto_1742774 ) ) ( not ( = ?auto_1742771 ?auto_1742775 ) ) ( not ( = ?auto_1742771 ?auto_1742776 ) ) ( not ( = ?auto_1742771 ?auto_1742777 ) ) ( not ( = ?auto_1742771 ?auto_1742778 ) ) ( not ( = ?auto_1742771 ?auto_1742782 ) ) ( not ( = ?auto_1742771 ?auto_1742783 ) ) ( not ( = ?auto_1742772 ?auto_1742773 ) ) ( not ( = ?auto_1742772 ?auto_1742774 ) ) ( not ( = ?auto_1742772 ?auto_1742775 ) ) ( not ( = ?auto_1742772 ?auto_1742776 ) ) ( not ( = ?auto_1742772 ?auto_1742777 ) ) ( not ( = ?auto_1742772 ?auto_1742778 ) ) ( not ( = ?auto_1742772 ?auto_1742782 ) ) ( not ( = ?auto_1742772 ?auto_1742783 ) ) ( not ( = ?auto_1742773 ?auto_1742774 ) ) ( not ( = ?auto_1742773 ?auto_1742775 ) ) ( not ( = ?auto_1742773 ?auto_1742776 ) ) ( not ( = ?auto_1742773 ?auto_1742777 ) ) ( not ( = ?auto_1742773 ?auto_1742778 ) ) ( not ( = ?auto_1742773 ?auto_1742782 ) ) ( not ( = ?auto_1742773 ?auto_1742783 ) ) ( not ( = ?auto_1742774 ?auto_1742775 ) ) ( not ( = ?auto_1742774 ?auto_1742776 ) ) ( not ( = ?auto_1742774 ?auto_1742777 ) ) ( not ( = ?auto_1742774 ?auto_1742778 ) ) ( not ( = ?auto_1742774 ?auto_1742782 ) ) ( not ( = ?auto_1742774 ?auto_1742783 ) ) ( not ( = ?auto_1742775 ?auto_1742776 ) ) ( not ( = ?auto_1742775 ?auto_1742777 ) ) ( not ( = ?auto_1742775 ?auto_1742778 ) ) ( not ( = ?auto_1742775 ?auto_1742782 ) ) ( not ( = ?auto_1742775 ?auto_1742783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742776 ?auto_1742777 ?auto_1742778 )
      ( MAKE-12CRATE-VERIFY ?auto_1742766 ?auto_1742767 ?auto_1742768 ?auto_1742769 ?auto_1742770 ?auto_1742771 ?auto_1742772 ?auto_1742773 ?auto_1742774 ?auto_1742775 ?auto_1742776 ?auto_1742777 ?auto_1742778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1742786 - SURFACE
      ?auto_1742787 - SURFACE
    )
    :vars
    (
      ?auto_1742795 - HOIST
      ?auto_1742793 - PLACE
      ?auto_1742794 - SURFACE
      ?auto_1742790 - PLACE
      ?auto_1742789 - HOIST
      ?auto_1742791 - SURFACE
      ?auto_1742792 - SURFACE
      ?auto_1742788 - TRUCK
      ?auto_1742796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742795 ?auto_1742793 ) ( IS-CRATE ?auto_1742787 ) ( not ( = ?auto_1742786 ?auto_1742787 ) ) ( not ( = ?auto_1742794 ?auto_1742786 ) ) ( not ( = ?auto_1742794 ?auto_1742787 ) ) ( not ( = ?auto_1742790 ?auto_1742793 ) ) ( HOIST-AT ?auto_1742789 ?auto_1742790 ) ( not ( = ?auto_1742795 ?auto_1742789 ) ) ( SURFACE-AT ?auto_1742787 ?auto_1742790 ) ( ON ?auto_1742787 ?auto_1742791 ) ( CLEAR ?auto_1742787 ) ( not ( = ?auto_1742786 ?auto_1742791 ) ) ( not ( = ?auto_1742787 ?auto_1742791 ) ) ( not ( = ?auto_1742794 ?auto_1742791 ) ) ( IS-CRATE ?auto_1742786 ) ( AVAILABLE ?auto_1742789 ) ( SURFACE-AT ?auto_1742786 ?auto_1742790 ) ( ON ?auto_1742786 ?auto_1742792 ) ( CLEAR ?auto_1742786 ) ( not ( = ?auto_1742786 ?auto_1742792 ) ) ( not ( = ?auto_1742787 ?auto_1742792 ) ) ( not ( = ?auto_1742794 ?auto_1742792 ) ) ( not ( = ?auto_1742791 ?auto_1742792 ) ) ( TRUCK-AT ?auto_1742788 ?auto_1742793 ) ( SURFACE-AT ?auto_1742796 ?auto_1742793 ) ( CLEAR ?auto_1742796 ) ( LIFTING ?auto_1742795 ?auto_1742794 ) ( IS-CRATE ?auto_1742794 ) ( not ( = ?auto_1742796 ?auto_1742794 ) ) ( not ( = ?auto_1742786 ?auto_1742796 ) ) ( not ( = ?auto_1742787 ?auto_1742796 ) ) ( not ( = ?auto_1742791 ?auto_1742796 ) ) ( not ( = ?auto_1742792 ?auto_1742796 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1742796 ?auto_1742794 )
      ( MAKE-2CRATE ?auto_1742794 ?auto_1742786 ?auto_1742787 )
      ( MAKE-1CRATE-VERIFY ?auto_1742786 ?auto_1742787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1742797 - SURFACE
      ?auto_1742798 - SURFACE
      ?auto_1742799 - SURFACE
    )
    :vars
    (
      ?auto_1742800 - HOIST
      ?auto_1742805 - PLACE
      ?auto_1742802 - PLACE
      ?auto_1742807 - HOIST
      ?auto_1742801 - SURFACE
      ?auto_1742803 - SURFACE
      ?auto_1742804 - TRUCK
      ?auto_1742806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742800 ?auto_1742805 ) ( IS-CRATE ?auto_1742799 ) ( not ( = ?auto_1742798 ?auto_1742799 ) ) ( not ( = ?auto_1742797 ?auto_1742798 ) ) ( not ( = ?auto_1742797 ?auto_1742799 ) ) ( not ( = ?auto_1742802 ?auto_1742805 ) ) ( HOIST-AT ?auto_1742807 ?auto_1742802 ) ( not ( = ?auto_1742800 ?auto_1742807 ) ) ( SURFACE-AT ?auto_1742799 ?auto_1742802 ) ( ON ?auto_1742799 ?auto_1742801 ) ( CLEAR ?auto_1742799 ) ( not ( = ?auto_1742798 ?auto_1742801 ) ) ( not ( = ?auto_1742799 ?auto_1742801 ) ) ( not ( = ?auto_1742797 ?auto_1742801 ) ) ( IS-CRATE ?auto_1742798 ) ( AVAILABLE ?auto_1742807 ) ( SURFACE-AT ?auto_1742798 ?auto_1742802 ) ( ON ?auto_1742798 ?auto_1742803 ) ( CLEAR ?auto_1742798 ) ( not ( = ?auto_1742798 ?auto_1742803 ) ) ( not ( = ?auto_1742799 ?auto_1742803 ) ) ( not ( = ?auto_1742797 ?auto_1742803 ) ) ( not ( = ?auto_1742801 ?auto_1742803 ) ) ( TRUCK-AT ?auto_1742804 ?auto_1742805 ) ( SURFACE-AT ?auto_1742806 ?auto_1742805 ) ( CLEAR ?auto_1742806 ) ( LIFTING ?auto_1742800 ?auto_1742797 ) ( IS-CRATE ?auto_1742797 ) ( not ( = ?auto_1742806 ?auto_1742797 ) ) ( not ( = ?auto_1742798 ?auto_1742806 ) ) ( not ( = ?auto_1742799 ?auto_1742806 ) ) ( not ( = ?auto_1742801 ?auto_1742806 ) ) ( not ( = ?auto_1742803 ?auto_1742806 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1742798 ?auto_1742799 )
      ( MAKE-2CRATE-VERIFY ?auto_1742797 ?auto_1742798 ?auto_1742799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1742808 - SURFACE
      ?auto_1742809 - SURFACE
      ?auto_1742810 - SURFACE
      ?auto_1742811 - SURFACE
    )
    :vars
    (
      ?auto_1742816 - HOIST
      ?auto_1742818 - PLACE
      ?auto_1742813 - PLACE
      ?auto_1742815 - HOIST
      ?auto_1742814 - SURFACE
      ?auto_1742812 - SURFACE
      ?auto_1742817 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742816 ?auto_1742818 ) ( IS-CRATE ?auto_1742811 ) ( not ( = ?auto_1742810 ?auto_1742811 ) ) ( not ( = ?auto_1742809 ?auto_1742810 ) ) ( not ( = ?auto_1742809 ?auto_1742811 ) ) ( not ( = ?auto_1742813 ?auto_1742818 ) ) ( HOIST-AT ?auto_1742815 ?auto_1742813 ) ( not ( = ?auto_1742816 ?auto_1742815 ) ) ( SURFACE-AT ?auto_1742811 ?auto_1742813 ) ( ON ?auto_1742811 ?auto_1742814 ) ( CLEAR ?auto_1742811 ) ( not ( = ?auto_1742810 ?auto_1742814 ) ) ( not ( = ?auto_1742811 ?auto_1742814 ) ) ( not ( = ?auto_1742809 ?auto_1742814 ) ) ( IS-CRATE ?auto_1742810 ) ( AVAILABLE ?auto_1742815 ) ( SURFACE-AT ?auto_1742810 ?auto_1742813 ) ( ON ?auto_1742810 ?auto_1742812 ) ( CLEAR ?auto_1742810 ) ( not ( = ?auto_1742810 ?auto_1742812 ) ) ( not ( = ?auto_1742811 ?auto_1742812 ) ) ( not ( = ?auto_1742809 ?auto_1742812 ) ) ( not ( = ?auto_1742814 ?auto_1742812 ) ) ( TRUCK-AT ?auto_1742817 ?auto_1742818 ) ( SURFACE-AT ?auto_1742808 ?auto_1742818 ) ( CLEAR ?auto_1742808 ) ( LIFTING ?auto_1742816 ?auto_1742809 ) ( IS-CRATE ?auto_1742809 ) ( not ( = ?auto_1742808 ?auto_1742809 ) ) ( not ( = ?auto_1742810 ?auto_1742808 ) ) ( not ( = ?auto_1742811 ?auto_1742808 ) ) ( not ( = ?auto_1742814 ?auto_1742808 ) ) ( not ( = ?auto_1742812 ?auto_1742808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742809 ?auto_1742810 ?auto_1742811 )
      ( MAKE-3CRATE-VERIFY ?auto_1742808 ?auto_1742809 ?auto_1742810 ?auto_1742811 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1742819 - SURFACE
      ?auto_1742820 - SURFACE
      ?auto_1742821 - SURFACE
      ?auto_1742822 - SURFACE
      ?auto_1742823 - SURFACE
    )
    :vars
    (
      ?auto_1742828 - HOIST
      ?auto_1742830 - PLACE
      ?auto_1742825 - PLACE
      ?auto_1742827 - HOIST
      ?auto_1742826 - SURFACE
      ?auto_1742824 - SURFACE
      ?auto_1742829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742828 ?auto_1742830 ) ( IS-CRATE ?auto_1742823 ) ( not ( = ?auto_1742822 ?auto_1742823 ) ) ( not ( = ?auto_1742821 ?auto_1742822 ) ) ( not ( = ?auto_1742821 ?auto_1742823 ) ) ( not ( = ?auto_1742825 ?auto_1742830 ) ) ( HOIST-AT ?auto_1742827 ?auto_1742825 ) ( not ( = ?auto_1742828 ?auto_1742827 ) ) ( SURFACE-AT ?auto_1742823 ?auto_1742825 ) ( ON ?auto_1742823 ?auto_1742826 ) ( CLEAR ?auto_1742823 ) ( not ( = ?auto_1742822 ?auto_1742826 ) ) ( not ( = ?auto_1742823 ?auto_1742826 ) ) ( not ( = ?auto_1742821 ?auto_1742826 ) ) ( IS-CRATE ?auto_1742822 ) ( AVAILABLE ?auto_1742827 ) ( SURFACE-AT ?auto_1742822 ?auto_1742825 ) ( ON ?auto_1742822 ?auto_1742824 ) ( CLEAR ?auto_1742822 ) ( not ( = ?auto_1742822 ?auto_1742824 ) ) ( not ( = ?auto_1742823 ?auto_1742824 ) ) ( not ( = ?auto_1742821 ?auto_1742824 ) ) ( not ( = ?auto_1742826 ?auto_1742824 ) ) ( TRUCK-AT ?auto_1742829 ?auto_1742830 ) ( SURFACE-AT ?auto_1742820 ?auto_1742830 ) ( CLEAR ?auto_1742820 ) ( LIFTING ?auto_1742828 ?auto_1742821 ) ( IS-CRATE ?auto_1742821 ) ( not ( = ?auto_1742820 ?auto_1742821 ) ) ( not ( = ?auto_1742822 ?auto_1742820 ) ) ( not ( = ?auto_1742823 ?auto_1742820 ) ) ( not ( = ?auto_1742826 ?auto_1742820 ) ) ( not ( = ?auto_1742824 ?auto_1742820 ) ) ( ON ?auto_1742820 ?auto_1742819 ) ( not ( = ?auto_1742819 ?auto_1742820 ) ) ( not ( = ?auto_1742819 ?auto_1742821 ) ) ( not ( = ?auto_1742819 ?auto_1742822 ) ) ( not ( = ?auto_1742819 ?auto_1742823 ) ) ( not ( = ?auto_1742819 ?auto_1742826 ) ) ( not ( = ?auto_1742819 ?auto_1742824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742821 ?auto_1742822 ?auto_1742823 )
      ( MAKE-4CRATE-VERIFY ?auto_1742819 ?auto_1742820 ?auto_1742821 ?auto_1742822 ?auto_1742823 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1742831 - SURFACE
      ?auto_1742832 - SURFACE
      ?auto_1742833 - SURFACE
      ?auto_1742834 - SURFACE
      ?auto_1742835 - SURFACE
      ?auto_1742836 - SURFACE
    )
    :vars
    (
      ?auto_1742841 - HOIST
      ?auto_1742843 - PLACE
      ?auto_1742838 - PLACE
      ?auto_1742840 - HOIST
      ?auto_1742839 - SURFACE
      ?auto_1742837 - SURFACE
      ?auto_1742842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742841 ?auto_1742843 ) ( IS-CRATE ?auto_1742836 ) ( not ( = ?auto_1742835 ?auto_1742836 ) ) ( not ( = ?auto_1742834 ?auto_1742835 ) ) ( not ( = ?auto_1742834 ?auto_1742836 ) ) ( not ( = ?auto_1742838 ?auto_1742843 ) ) ( HOIST-AT ?auto_1742840 ?auto_1742838 ) ( not ( = ?auto_1742841 ?auto_1742840 ) ) ( SURFACE-AT ?auto_1742836 ?auto_1742838 ) ( ON ?auto_1742836 ?auto_1742839 ) ( CLEAR ?auto_1742836 ) ( not ( = ?auto_1742835 ?auto_1742839 ) ) ( not ( = ?auto_1742836 ?auto_1742839 ) ) ( not ( = ?auto_1742834 ?auto_1742839 ) ) ( IS-CRATE ?auto_1742835 ) ( AVAILABLE ?auto_1742840 ) ( SURFACE-AT ?auto_1742835 ?auto_1742838 ) ( ON ?auto_1742835 ?auto_1742837 ) ( CLEAR ?auto_1742835 ) ( not ( = ?auto_1742835 ?auto_1742837 ) ) ( not ( = ?auto_1742836 ?auto_1742837 ) ) ( not ( = ?auto_1742834 ?auto_1742837 ) ) ( not ( = ?auto_1742839 ?auto_1742837 ) ) ( TRUCK-AT ?auto_1742842 ?auto_1742843 ) ( SURFACE-AT ?auto_1742833 ?auto_1742843 ) ( CLEAR ?auto_1742833 ) ( LIFTING ?auto_1742841 ?auto_1742834 ) ( IS-CRATE ?auto_1742834 ) ( not ( = ?auto_1742833 ?auto_1742834 ) ) ( not ( = ?auto_1742835 ?auto_1742833 ) ) ( not ( = ?auto_1742836 ?auto_1742833 ) ) ( not ( = ?auto_1742839 ?auto_1742833 ) ) ( not ( = ?auto_1742837 ?auto_1742833 ) ) ( ON ?auto_1742832 ?auto_1742831 ) ( ON ?auto_1742833 ?auto_1742832 ) ( not ( = ?auto_1742831 ?auto_1742832 ) ) ( not ( = ?auto_1742831 ?auto_1742833 ) ) ( not ( = ?auto_1742831 ?auto_1742834 ) ) ( not ( = ?auto_1742831 ?auto_1742835 ) ) ( not ( = ?auto_1742831 ?auto_1742836 ) ) ( not ( = ?auto_1742831 ?auto_1742839 ) ) ( not ( = ?auto_1742831 ?auto_1742837 ) ) ( not ( = ?auto_1742832 ?auto_1742833 ) ) ( not ( = ?auto_1742832 ?auto_1742834 ) ) ( not ( = ?auto_1742832 ?auto_1742835 ) ) ( not ( = ?auto_1742832 ?auto_1742836 ) ) ( not ( = ?auto_1742832 ?auto_1742839 ) ) ( not ( = ?auto_1742832 ?auto_1742837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742834 ?auto_1742835 ?auto_1742836 )
      ( MAKE-5CRATE-VERIFY ?auto_1742831 ?auto_1742832 ?auto_1742833 ?auto_1742834 ?auto_1742835 ?auto_1742836 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1742844 - SURFACE
      ?auto_1742845 - SURFACE
      ?auto_1742846 - SURFACE
      ?auto_1742847 - SURFACE
      ?auto_1742848 - SURFACE
      ?auto_1742849 - SURFACE
      ?auto_1742850 - SURFACE
    )
    :vars
    (
      ?auto_1742855 - HOIST
      ?auto_1742857 - PLACE
      ?auto_1742852 - PLACE
      ?auto_1742854 - HOIST
      ?auto_1742853 - SURFACE
      ?auto_1742851 - SURFACE
      ?auto_1742856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742855 ?auto_1742857 ) ( IS-CRATE ?auto_1742850 ) ( not ( = ?auto_1742849 ?auto_1742850 ) ) ( not ( = ?auto_1742848 ?auto_1742849 ) ) ( not ( = ?auto_1742848 ?auto_1742850 ) ) ( not ( = ?auto_1742852 ?auto_1742857 ) ) ( HOIST-AT ?auto_1742854 ?auto_1742852 ) ( not ( = ?auto_1742855 ?auto_1742854 ) ) ( SURFACE-AT ?auto_1742850 ?auto_1742852 ) ( ON ?auto_1742850 ?auto_1742853 ) ( CLEAR ?auto_1742850 ) ( not ( = ?auto_1742849 ?auto_1742853 ) ) ( not ( = ?auto_1742850 ?auto_1742853 ) ) ( not ( = ?auto_1742848 ?auto_1742853 ) ) ( IS-CRATE ?auto_1742849 ) ( AVAILABLE ?auto_1742854 ) ( SURFACE-AT ?auto_1742849 ?auto_1742852 ) ( ON ?auto_1742849 ?auto_1742851 ) ( CLEAR ?auto_1742849 ) ( not ( = ?auto_1742849 ?auto_1742851 ) ) ( not ( = ?auto_1742850 ?auto_1742851 ) ) ( not ( = ?auto_1742848 ?auto_1742851 ) ) ( not ( = ?auto_1742853 ?auto_1742851 ) ) ( TRUCK-AT ?auto_1742856 ?auto_1742857 ) ( SURFACE-AT ?auto_1742847 ?auto_1742857 ) ( CLEAR ?auto_1742847 ) ( LIFTING ?auto_1742855 ?auto_1742848 ) ( IS-CRATE ?auto_1742848 ) ( not ( = ?auto_1742847 ?auto_1742848 ) ) ( not ( = ?auto_1742849 ?auto_1742847 ) ) ( not ( = ?auto_1742850 ?auto_1742847 ) ) ( not ( = ?auto_1742853 ?auto_1742847 ) ) ( not ( = ?auto_1742851 ?auto_1742847 ) ) ( ON ?auto_1742845 ?auto_1742844 ) ( ON ?auto_1742846 ?auto_1742845 ) ( ON ?auto_1742847 ?auto_1742846 ) ( not ( = ?auto_1742844 ?auto_1742845 ) ) ( not ( = ?auto_1742844 ?auto_1742846 ) ) ( not ( = ?auto_1742844 ?auto_1742847 ) ) ( not ( = ?auto_1742844 ?auto_1742848 ) ) ( not ( = ?auto_1742844 ?auto_1742849 ) ) ( not ( = ?auto_1742844 ?auto_1742850 ) ) ( not ( = ?auto_1742844 ?auto_1742853 ) ) ( not ( = ?auto_1742844 ?auto_1742851 ) ) ( not ( = ?auto_1742845 ?auto_1742846 ) ) ( not ( = ?auto_1742845 ?auto_1742847 ) ) ( not ( = ?auto_1742845 ?auto_1742848 ) ) ( not ( = ?auto_1742845 ?auto_1742849 ) ) ( not ( = ?auto_1742845 ?auto_1742850 ) ) ( not ( = ?auto_1742845 ?auto_1742853 ) ) ( not ( = ?auto_1742845 ?auto_1742851 ) ) ( not ( = ?auto_1742846 ?auto_1742847 ) ) ( not ( = ?auto_1742846 ?auto_1742848 ) ) ( not ( = ?auto_1742846 ?auto_1742849 ) ) ( not ( = ?auto_1742846 ?auto_1742850 ) ) ( not ( = ?auto_1742846 ?auto_1742853 ) ) ( not ( = ?auto_1742846 ?auto_1742851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742848 ?auto_1742849 ?auto_1742850 )
      ( MAKE-6CRATE-VERIFY ?auto_1742844 ?auto_1742845 ?auto_1742846 ?auto_1742847 ?auto_1742848 ?auto_1742849 ?auto_1742850 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1742858 - SURFACE
      ?auto_1742859 - SURFACE
      ?auto_1742860 - SURFACE
      ?auto_1742861 - SURFACE
      ?auto_1742862 - SURFACE
      ?auto_1742863 - SURFACE
      ?auto_1742864 - SURFACE
      ?auto_1742865 - SURFACE
    )
    :vars
    (
      ?auto_1742870 - HOIST
      ?auto_1742872 - PLACE
      ?auto_1742867 - PLACE
      ?auto_1742869 - HOIST
      ?auto_1742868 - SURFACE
      ?auto_1742866 - SURFACE
      ?auto_1742871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742870 ?auto_1742872 ) ( IS-CRATE ?auto_1742865 ) ( not ( = ?auto_1742864 ?auto_1742865 ) ) ( not ( = ?auto_1742863 ?auto_1742864 ) ) ( not ( = ?auto_1742863 ?auto_1742865 ) ) ( not ( = ?auto_1742867 ?auto_1742872 ) ) ( HOIST-AT ?auto_1742869 ?auto_1742867 ) ( not ( = ?auto_1742870 ?auto_1742869 ) ) ( SURFACE-AT ?auto_1742865 ?auto_1742867 ) ( ON ?auto_1742865 ?auto_1742868 ) ( CLEAR ?auto_1742865 ) ( not ( = ?auto_1742864 ?auto_1742868 ) ) ( not ( = ?auto_1742865 ?auto_1742868 ) ) ( not ( = ?auto_1742863 ?auto_1742868 ) ) ( IS-CRATE ?auto_1742864 ) ( AVAILABLE ?auto_1742869 ) ( SURFACE-AT ?auto_1742864 ?auto_1742867 ) ( ON ?auto_1742864 ?auto_1742866 ) ( CLEAR ?auto_1742864 ) ( not ( = ?auto_1742864 ?auto_1742866 ) ) ( not ( = ?auto_1742865 ?auto_1742866 ) ) ( not ( = ?auto_1742863 ?auto_1742866 ) ) ( not ( = ?auto_1742868 ?auto_1742866 ) ) ( TRUCK-AT ?auto_1742871 ?auto_1742872 ) ( SURFACE-AT ?auto_1742862 ?auto_1742872 ) ( CLEAR ?auto_1742862 ) ( LIFTING ?auto_1742870 ?auto_1742863 ) ( IS-CRATE ?auto_1742863 ) ( not ( = ?auto_1742862 ?auto_1742863 ) ) ( not ( = ?auto_1742864 ?auto_1742862 ) ) ( not ( = ?auto_1742865 ?auto_1742862 ) ) ( not ( = ?auto_1742868 ?auto_1742862 ) ) ( not ( = ?auto_1742866 ?auto_1742862 ) ) ( ON ?auto_1742859 ?auto_1742858 ) ( ON ?auto_1742860 ?auto_1742859 ) ( ON ?auto_1742861 ?auto_1742860 ) ( ON ?auto_1742862 ?auto_1742861 ) ( not ( = ?auto_1742858 ?auto_1742859 ) ) ( not ( = ?auto_1742858 ?auto_1742860 ) ) ( not ( = ?auto_1742858 ?auto_1742861 ) ) ( not ( = ?auto_1742858 ?auto_1742862 ) ) ( not ( = ?auto_1742858 ?auto_1742863 ) ) ( not ( = ?auto_1742858 ?auto_1742864 ) ) ( not ( = ?auto_1742858 ?auto_1742865 ) ) ( not ( = ?auto_1742858 ?auto_1742868 ) ) ( not ( = ?auto_1742858 ?auto_1742866 ) ) ( not ( = ?auto_1742859 ?auto_1742860 ) ) ( not ( = ?auto_1742859 ?auto_1742861 ) ) ( not ( = ?auto_1742859 ?auto_1742862 ) ) ( not ( = ?auto_1742859 ?auto_1742863 ) ) ( not ( = ?auto_1742859 ?auto_1742864 ) ) ( not ( = ?auto_1742859 ?auto_1742865 ) ) ( not ( = ?auto_1742859 ?auto_1742868 ) ) ( not ( = ?auto_1742859 ?auto_1742866 ) ) ( not ( = ?auto_1742860 ?auto_1742861 ) ) ( not ( = ?auto_1742860 ?auto_1742862 ) ) ( not ( = ?auto_1742860 ?auto_1742863 ) ) ( not ( = ?auto_1742860 ?auto_1742864 ) ) ( not ( = ?auto_1742860 ?auto_1742865 ) ) ( not ( = ?auto_1742860 ?auto_1742868 ) ) ( not ( = ?auto_1742860 ?auto_1742866 ) ) ( not ( = ?auto_1742861 ?auto_1742862 ) ) ( not ( = ?auto_1742861 ?auto_1742863 ) ) ( not ( = ?auto_1742861 ?auto_1742864 ) ) ( not ( = ?auto_1742861 ?auto_1742865 ) ) ( not ( = ?auto_1742861 ?auto_1742868 ) ) ( not ( = ?auto_1742861 ?auto_1742866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742863 ?auto_1742864 ?auto_1742865 )
      ( MAKE-7CRATE-VERIFY ?auto_1742858 ?auto_1742859 ?auto_1742860 ?auto_1742861 ?auto_1742862 ?auto_1742863 ?auto_1742864 ?auto_1742865 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1742873 - SURFACE
      ?auto_1742874 - SURFACE
      ?auto_1742875 - SURFACE
      ?auto_1742876 - SURFACE
      ?auto_1742877 - SURFACE
      ?auto_1742878 - SURFACE
      ?auto_1742879 - SURFACE
      ?auto_1742880 - SURFACE
      ?auto_1742881 - SURFACE
    )
    :vars
    (
      ?auto_1742886 - HOIST
      ?auto_1742888 - PLACE
      ?auto_1742883 - PLACE
      ?auto_1742885 - HOIST
      ?auto_1742884 - SURFACE
      ?auto_1742882 - SURFACE
      ?auto_1742887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742886 ?auto_1742888 ) ( IS-CRATE ?auto_1742881 ) ( not ( = ?auto_1742880 ?auto_1742881 ) ) ( not ( = ?auto_1742879 ?auto_1742880 ) ) ( not ( = ?auto_1742879 ?auto_1742881 ) ) ( not ( = ?auto_1742883 ?auto_1742888 ) ) ( HOIST-AT ?auto_1742885 ?auto_1742883 ) ( not ( = ?auto_1742886 ?auto_1742885 ) ) ( SURFACE-AT ?auto_1742881 ?auto_1742883 ) ( ON ?auto_1742881 ?auto_1742884 ) ( CLEAR ?auto_1742881 ) ( not ( = ?auto_1742880 ?auto_1742884 ) ) ( not ( = ?auto_1742881 ?auto_1742884 ) ) ( not ( = ?auto_1742879 ?auto_1742884 ) ) ( IS-CRATE ?auto_1742880 ) ( AVAILABLE ?auto_1742885 ) ( SURFACE-AT ?auto_1742880 ?auto_1742883 ) ( ON ?auto_1742880 ?auto_1742882 ) ( CLEAR ?auto_1742880 ) ( not ( = ?auto_1742880 ?auto_1742882 ) ) ( not ( = ?auto_1742881 ?auto_1742882 ) ) ( not ( = ?auto_1742879 ?auto_1742882 ) ) ( not ( = ?auto_1742884 ?auto_1742882 ) ) ( TRUCK-AT ?auto_1742887 ?auto_1742888 ) ( SURFACE-AT ?auto_1742878 ?auto_1742888 ) ( CLEAR ?auto_1742878 ) ( LIFTING ?auto_1742886 ?auto_1742879 ) ( IS-CRATE ?auto_1742879 ) ( not ( = ?auto_1742878 ?auto_1742879 ) ) ( not ( = ?auto_1742880 ?auto_1742878 ) ) ( not ( = ?auto_1742881 ?auto_1742878 ) ) ( not ( = ?auto_1742884 ?auto_1742878 ) ) ( not ( = ?auto_1742882 ?auto_1742878 ) ) ( ON ?auto_1742874 ?auto_1742873 ) ( ON ?auto_1742875 ?auto_1742874 ) ( ON ?auto_1742876 ?auto_1742875 ) ( ON ?auto_1742877 ?auto_1742876 ) ( ON ?auto_1742878 ?auto_1742877 ) ( not ( = ?auto_1742873 ?auto_1742874 ) ) ( not ( = ?auto_1742873 ?auto_1742875 ) ) ( not ( = ?auto_1742873 ?auto_1742876 ) ) ( not ( = ?auto_1742873 ?auto_1742877 ) ) ( not ( = ?auto_1742873 ?auto_1742878 ) ) ( not ( = ?auto_1742873 ?auto_1742879 ) ) ( not ( = ?auto_1742873 ?auto_1742880 ) ) ( not ( = ?auto_1742873 ?auto_1742881 ) ) ( not ( = ?auto_1742873 ?auto_1742884 ) ) ( not ( = ?auto_1742873 ?auto_1742882 ) ) ( not ( = ?auto_1742874 ?auto_1742875 ) ) ( not ( = ?auto_1742874 ?auto_1742876 ) ) ( not ( = ?auto_1742874 ?auto_1742877 ) ) ( not ( = ?auto_1742874 ?auto_1742878 ) ) ( not ( = ?auto_1742874 ?auto_1742879 ) ) ( not ( = ?auto_1742874 ?auto_1742880 ) ) ( not ( = ?auto_1742874 ?auto_1742881 ) ) ( not ( = ?auto_1742874 ?auto_1742884 ) ) ( not ( = ?auto_1742874 ?auto_1742882 ) ) ( not ( = ?auto_1742875 ?auto_1742876 ) ) ( not ( = ?auto_1742875 ?auto_1742877 ) ) ( not ( = ?auto_1742875 ?auto_1742878 ) ) ( not ( = ?auto_1742875 ?auto_1742879 ) ) ( not ( = ?auto_1742875 ?auto_1742880 ) ) ( not ( = ?auto_1742875 ?auto_1742881 ) ) ( not ( = ?auto_1742875 ?auto_1742884 ) ) ( not ( = ?auto_1742875 ?auto_1742882 ) ) ( not ( = ?auto_1742876 ?auto_1742877 ) ) ( not ( = ?auto_1742876 ?auto_1742878 ) ) ( not ( = ?auto_1742876 ?auto_1742879 ) ) ( not ( = ?auto_1742876 ?auto_1742880 ) ) ( not ( = ?auto_1742876 ?auto_1742881 ) ) ( not ( = ?auto_1742876 ?auto_1742884 ) ) ( not ( = ?auto_1742876 ?auto_1742882 ) ) ( not ( = ?auto_1742877 ?auto_1742878 ) ) ( not ( = ?auto_1742877 ?auto_1742879 ) ) ( not ( = ?auto_1742877 ?auto_1742880 ) ) ( not ( = ?auto_1742877 ?auto_1742881 ) ) ( not ( = ?auto_1742877 ?auto_1742884 ) ) ( not ( = ?auto_1742877 ?auto_1742882 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742879 ?auto_1742880 ?auto_1742881 )
      ( MAKE-8CRATE-VERIFY ?auto_1742873 ?auto_1742874 ?auto_1742875 ?auto_1742876 ?auto_1742877 ?auto_1742878 ?auto_1742879 ?auto_1742880 ?auto_1742881 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1742889 - SURFACE
      ?auto_1742890 - SURFACE
      ?auto_1742891 - SURFACE
      ?auto_1742892 - SURFACE
      ?auto_1742893 - SURFACE
      ?auto_1742894 - SURFACE
      ?auto_1742895 - SURFACE
      ?auto_1742896 - SURFACE
      ?auto_1742897 - SURFACE
      ?auto_1742898 - SURFACE
    )
    :vars
    (
      ?auto_1742903 - HOIST
      ?auto_1742905 - PLACE
      ?auto_1742900 - PLACE
      ?auto_1742902 - HOIST
      ?auto_1742901 - SURFACE
      ?auto_1742899 - SURFACE
      ?auto_1742904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742903 ?auto_1742905 ) ( IS-CRATE ?auto_1742898 ) ( not ( = ?auto_1742897 ?auto_1742898 ) ) ( not ( = ?auto_1742896 ?auto_1742897 ) ) ( not ( = ?auto_1742896 ?auto_1742898 ) ) ( not ( = ?auto_1742900 ?auto_1742905 ) ) ( HOIST-AT ?auto_1742902 ?auto_1742900 ) ( not ( = ?auto_1742903 ?auto_1742902 ) ) ( SURFACE-AT ?auto_1742898 ?auto_1742900 ) ( ON ?auto_1742898 ?auto_1742901 ) ( CLEAR ?auto_1742898 ) ( not ( = ?auto_1742897 ?auto_1742901 ) ) ( not ( = ?auto_1742898 ?auto_1742901 ) ) ( not ( = ?auto_1742896 ?auto_1742901 ) ) ( IS-CRATE ?auto_1742897 ) ( AVAILABLE ?auto_1742902 ) ( SURFACE-AT ?auto_1742897 ?auto_1742900 ) ( ON ?auto_1742897 ?auto_1742899 ) ( CLEAR ?auto_1742897 ) ( not ( = ?auto_1742897 ?auto_1742899 ) ) ( not ( = ?auto_1742898 ?auto_1742899 ) ) ( not ( = ?auto_1742896 ?auto_1742899 ) ) ( not ( = ?auto_1742901 ?auto_1742899 ) ) ( TRUCK-AT ?auto_1742904 ?auto_1742905 ) ( SURFACE-AT ?auto_1742895 ?auto_1742905 ) ( CLEAR ?auto_1742895 ) ( LIFTING ?auto_1742903 ?auto_1742896 ) ( IS-CRATE ?auto_1742896 ) ( not ( = ?auto_1742895 ?auto_1742896 ) ) ( not ( = ?auto_1742897 ?auto_1742895 ) ) ( not ( = ?auto_1742898 ?auto_1742895 ) ) ( not ( = ?auto_1742901 ?auto_1742895 ) ) ( not ( = ?auto_1742899 ?auto_1742895 ) ) ( ON ?auto_1742890 ?auto_1742889 ) ( ON ?auto_1742891 ?auto_1742890 ) ( ON ?auto_1742892 ?auto_1742891 ) ( ON ?auto_1742893 ?auto_1742892 ) ( ON ?auto_1742894 ?auto_1742893 ) ( ON ?auto_1742895 ?auto_1742894 ) ( not ( = ?auto_1742889 ?auto_1742890 ) ) ( not ( = ?auto_1742889 ?auto_1742891 ) ) ( not ( = ?auto_1742889 ?auto_1742892 ) ) ( not ( = ?auto_1742889 ?auto_1742893 ) ) ( not ( = ?auto_1742889 ?auto_1742894 ) ) ( not ( = ?auto_1742889 ?auto_1742895 ) ) ( not ( = ?auto_1742889 ?auto_1742896 ) ) ( not ( = ?auto_1742889 ?auto_1742897 ) ) ( not ( = ?auto_1742889 ?auto_1742898 ) ) ( not ( = ?auto_1742889 ?auto_1742901 ) ) ( not ( = ?auto_1742889 ?auto_1742899 ) ) ( not ( = ?auto_1742890 ?auto_1742891 ) ) ( not ( = ?auto_1742890 ?auto_1742892 ) ) ( not ( = ?auto_1742890 ?auto_1742893 ) ) ( not ( = ?auto_1742890 ?auto_1742894 ) ) ( not ( = ?auto_1742890 ?auto_1742895 ) ) ( not ( = ?auto_1742890 ?auto_1742896 ) ) ( not ( = ?auto_1742890 ?auto_1742897 ) ) ( not ( = ?auto_1742890 ?auto_1742898 ) ) ( not ( = ?auto_1742890 ?auto_1742901 ) ) ( not ( = ?auto_1742890 ?auto_1742899 ) ) ( not ( = ?auto_1742891 ?auto_1742892 ) ) ( not ( = ?auto_1742891 ?auto_1742893 ) ) ( not ( = ?auto_1742891 ?auto_1742894 ) ) ( not ( = ?auto_1742891 ?auto_1742895 ) ) ( not ( = ?auto_1742891 ?auto_1742896 ) ) ( not ( = ?auto_1742891 ?auto_1742897 ) ) ( not ( = ?auto_1742891 ?auto_1742898 ) ) ( not ( = ?auto_1742891 ?auto_1742901 ) ) ( not ( = ?auto_1742891 ?auto_1742899 ) ) ( not ( = ?auto_1742892 ?auto_1742893 ) ) ( not ( = ?auto_1742892 ?auto_1742894 ) ) ( not ( = ?auto_1742892 ?auto_1742895 ) ) ( not ( = ?auto_1742892 ?auto_1742896 ) ) ( not ( = ?auto_1742892 ?auto_1742897 ) ) ( not ( = ?auto_1742892 ?auto_1742898 ) ) ( not ( = ?auto_1742892 ?auto_1742901 ) ) ( not ( = ?auto_1742892 ?auto_1742899 ) ) ( not ( = ?auto_1742893 ?auto_1742894 ) ) ( not ( = ?auto_1742893 ?auto_1742895 ) ) ( not ( = ?auto_1742893 ?auto_1742896 ) ) ( not ( = ?auto_1742893 ?auto_1742897 ) ) ( not ( = ?auto_1742893 ?auto_1742898 ) ) ( not ( = ?auto_1742893 ?auto_1742901 ) ) ( not ( = ?auto_1742893 ?auto_1742899 ) ) ( not ( = ?auto_1742894 ?auto_1742895 ) ) ( not ( = ?auto_1742894 ?auto_1742896 ) ) ( not ( = ?auto_1742894 ?auto_1742897 ) ) ( not ( = ?auto_1742894 ?auto_1742898 ) ) ( not ( = ?auto_1742894 ?auto_1742901 ) ) ( not ( = ?auto_1742894 ?auto_1742899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742896 ?auto_1742897 ?auto_1742898 )
      ( MAKE-9CRATE-VERIFY ?auto_1742889 ?auto_1742890 ?auto_1742891 ?auto_1742892 ?auto_1742893 ?auto_1742894 ?auto_1742895 ?auto_1742896 ?auto_1742897 ?auto_1742898 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1742906 - SURFACE
      ?auto_1742907 - SURFACE
      ?auto_1742908 - SURFACE
      ?auto_1742909 - SURFACE
      ?auto_1742910 - SURFACE
      ?auto_1742911 - SURFACE
      ?auto_1742912 - SURFACE
      ?auto_1742913 - SURFACE
      ?auto_1742914 - SURFACE
      ?auto_1742915 - SURFACE
      ?auto_1742916 - SURFACE
    )
    :vars
    (
      ?auto_1742921 - HOIST
      ?auto_1742923 - PLACE
      ?auto_1742918 - PLACE
      ?auto_1742920 - HOIST
      ?auto_1742919 - SURFACE
      ?auto_1742917 - SURFACE
      ?auto_1742922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742921 ?auto_1742923 ) ( IS-CRATE ?auto_1742916 ) ( not ( = ?auto_1742915 ?auto_1742916 ) ) ( not ( = ?auto_1742914 ?auto_1742915 ) ) ( not ( = ?auto_1742914 ?auto_1742916 ) ) ( not ( = ?auto_1742918 ?auto_1742923 ) ) ( HOIST-AT ?auto_1742920 ?auto_1742918 ) ( not ( = ?auto_1742921 ?auto_1742920 ) ) ( SURFACE-AT ?auto_1742916 ?auto_1742918 ) ( ON ?auto_1742916 ?auto_1742919 ) ( CLEAR ?auto_1742916 ) ( not ( = ?auto_1742915 ?auto_1742919 ) ) ( not ( = ?auto_1742916 ?auto_1742919 ) ) ( not ( = ?auto_1742914 ?auto_1742919 ) ) ( IS-CRATE ?auto_1742915 ) ( AVAILABLE ?auto_1742920 ) ( SURFACE-AT ?auto_1742915 ?auto_1742918 ) ( ON ?auto_1742915 ?auto_1742917 ) ( CLEAR ?auto_1742915 ) ( not ( = ?auto_1742915 ?auto_1742917 ) ) ( not ( = ?auto_1742916 ?auto_1742917 ) ) ( not ( = ?auto_1742914 ?auto_1742917 ) ) ( not ( = ?auto_1742919 ?auto_1742917 ) ) ( TRUCK-AT ?auto_1742922 ?auto_1742923 ) ( SURFACE-AT ?auto_1742913 ?auto_1742923 ) ( CLEAR ?auto_1742913 ) ( LIFTING ?auto_1742921 ?auto_1742914 ) ( IS-CRATE ?auto_1742914 ) ( not ( = ?auto_1742913 ?auto_1742914 ) ) ( not ( = ?auto_1742915 ?auto_1742913 ) ) ( not ( = ?auto_1742916 ?auto_1742913 ) ) ( not ( = ?auto_1742919 ?auto_1742913 ) ) ( not ( = ?auto_1742917 ?auto_1742913 ) ) ( ON ?auto_1742907 ?auto_1742906 ) ( ON ?auto_1742908 ?auto_1742907 ) ( ON ?auto_1742909 ?auto_1742908 ) ( ON ?auto_1742910 ?auto_1742909 ) ( ON ?auto_1742911 ?auto_1742910 ) ( ON ?auto_1742912 ?auto_1742911 ) ( ON ?auto_1742913 ?auto_1742912 ) ( not ( = ?auto_1742906 ?auto_1742907 ) ) ( not ( = ?auto_1742906 ?auto_1742908 ) ) ( not ( = ?auto_1742906 ?auto_1742909 ) ) ( not ( = ?auto_1742906 ?auto_1742910 ) ) ( not ( = ?auto_1742906 ?auto_1742911 ) ) ( not ( = ?auto_1742906 ?auto_1742912 ) ) ( not ( = ?auto_1742906 ?auto_1742913 ) ) ( not ( = ?auto_1742906 ?auto_1742914 ) ) ( not ( = ?auto_1742906 ?auto_1742915 ) ) ( not ( = ?auto_1742906 ?auto_1742916 ) ) ( not ( = ?auto_1742906 ?auto_1742919 ) ) ( not ( = ?auto_1742906 ?auto_1742917 ) ) ( not ( = ?auto_1742907 ?auto_1742908 ) ) ( not ( = ?auto_1742907 ?auto_1742909 ) ) ( not ( = ?auto_1742907 ?auto_1742910 ) ) ( not ( = ?auto_1742907 ?auto_1742911 ) ) ( not ( = ?auto_1742907 ?auto_1742912 ) ) ( not ( = ?auto_1742907 ?auto_1742913 ) ) ( not ( = ?auto_1742907 ?auto_1742914 ) ) ( not ( = ?auto_1742907 ?auto_1742915 ) ) ( not ( = ?auto_1742907 ?auto_1742916 ) ) ( not ( = ?auto_1742907 ?auto_1742919 ) ) ( not ( = ?auto_1742907 ?auto_1742917 ) ) ( not ( = ?auto_1742908 ?auto_1742909 ) ) ( not ( = ?auto_1742908 ?auto_1742910 ) ) ( not ( = ?auto_1742908 ?auto_1742911 ) ) ( not ( = ?auto_1742908 ?auto_1742912 ) ) ( not ( = ?auto_1742908 ?auto_1742913 ) ) ( not ( = ?auto_1742908 ?auto_1742914 ) ) ( not ( = ?auto_1742908 ?auto_1742915 ) ) ( not ( = ?auto_1742908 ?auto_1742916 ) ) ( not ( = ?auto_1742908 ?auto_1742919 ) ) ( not ( = ?auto_1742908 ?auto_1742917 ) ) ( not ( = ?auto_1742909 ?auto_1742910 ) ) ( not ( = ?auto_1742909 ?auto_1742911 ) ) ( not ( = ?auto_1742909 ?auto_1742912 ) ) ( not ( = ?auto_1742909 ?auto_1742913 ) ) ( not ( = ?auto_1742909 ?auto_1742914 ) ) ( not ( = ?auto_1742909 ?auto_1742915 ) ) ( not ( = ?auto_1742909 ?auto_1742916 ) ) ( not ( = ?auto_1742909 ?auto_1742919 ) ) ( not ( = ?auto_1742909 ?auto_1742917 ) ) ( not ( = ?auto_1742910 ?auto_1742911 ) ) ( not ( = ?auto_1742910 ?auto_1742912 ) ) ( not ( = ?auto_1742910 ?auto_1742913 ) ) ( not ( = ?auto_1742910 ?auto_1742914 ) ) ( not ( = ?auto_1742910 ?auto_1742915 ) ) ( not ( = ?auto_1742910 ?auto_1742916 ) ) ( not ( = ?auto_1742910 ?auto_1742919 ) ) ( not ( = ?auto_1742910 ?auto_1742917 ) ) ( not ( = ?auto_1742911 ?auto_1742912 ) ) ( not ( = ?auto_1742911 ?auto_1742913 ) ) ( not ( = ?auto_1742911 ?auto_1742914 ) ) ( not ( = ?auto_1742911 ?auto_1742915 ) ) ( not ( = ?auto_1742911 ?auto_1742916 ) ) ( not ( = ?auto_1742911 ?auto_1742919 ) ) ( not ( = ?auto_1742911 ?auto_1742917 ) ) ( not ( = ?auto_1742912 ?auto_1742913 ) ) ( not ( = ?auto_1742912 ?auto_1742914 ) ) ( not ( = ?auto_1742912 ?auto_1742915 ) ) ( not ( = ?auto_1742912 ?auto_1742916 ) ) ( not ( = ?auto_1742912 ?auto_1742919 ) ) ( not ( = ?auto_1742912 ?auto_1742917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742914 ?auto_1742915 ?auto_1742916 )
      ( MAKE-10CRATE-VERIFY ?auto_1742906 ?auto_1742907 ?auto_1742908 ?auto_1742909 ?auto_1742910 ?auto_1742911 ?auto_1742912 ?auto_1742913 ?auto_1742914 ?auto_1742915 ?auto_1742916 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1742924 - SURFACE
      ?auto_1742925 - SURFACE
      ?auto_1742926 - SURFACE
      ?auto_1742927 - SURFACE
      ?auto_1742928 - SURFACE
      ?auto_1742929 - SURFACE
      ?auto_1742930 - SURFACE
      ?auto_1742931 - SURFACE
      ?auto_1742932 - SURFACE
      ?auto_1742933 - SURFACE
      ?auto_1742934 - SURFACE
      ?auto_1742935 - SURFACE
    )
    :vars
    (
      ?auto_1742940 - HOIST
      ?auto_1742942 - PLACE
      ?auto_1742937 - PLACE
      ?auto_1742939 - HOIST
      ?auto_1742938 - SURFACE
      ?auto_1742936 - SURFACE
      ?auto_1742941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742940 ?auto_1742942 ) ( IS-CRATE ?auto_1742935 ) ( not ( = ?auto_1742934 ?auto_1742935 ) ) ( not ( = ?auto_1742933 ?auto_1742934 ) ) ( not ( = ?auto_1742933 ?auto_1742935 ) ) ( not ( = ?auto_1742937 ?auto_1742942 ) ) ( HOIST-AT ?auto_1742939 ?auto_1742937 ) ( not ( = ?auto_1742940 ?auto_1742939 ) ) ( SURFACE-AT ?auto_1742935 ?auto_1742937 ) ( ON ?auto_1742935 ?auto_1742938 ) ( CLEAR ?auto_1742935 ) ( not ( = ?auto_1742934 ?auto_1742938 ) ) ( not ( = ?auto_1742935 ?auto_1742938 ) ) ( not ( = ?auto_1742933 ?auto_1742938 ) ) ( IS-CRATE ?auto_1742934 ) ( AVAILABLE ?auto_1742939 ) ( SURFACE-AT ?auto_1742934 ?auto_1742937 ) ( ON ?auto_1742934 ?auto_1742936 ) ( CLEAR ?auto_1742934 ) ( not ( = ?auto_1742934 ?auto_1742936 ) ) ( not ( = ?auto_1742935 ?auto_1742936 ) ) ( not ( = ?auto_1742933 ?auto_1742936 ) ) ( not ( = ?auto_1742938 ?auto_1742936 ) ) ( TRUCK-AT ?auto_1742941 ?auto_1742942 ) ( SURFACE-AT ?auto_1742932 ?auto_1742942 ) ( CLEAR ?auto_1742932 ) ( LIFTING ?auto_1742940 ?auto_1742933 ) ( IS-CRATE ?auto_1742933 ) ( not ( = ?auto_1742932 ?auto_1742933 ) ) ( not ( = ?auto_1742934 ?auto_1742932 ) ) ( not ( = ?auto_1742935 ?auto_1742932 ) ) ( not ( = ?auto_1742938 ?auto_1742932 ) ) ( not ( = ?auto_1742936 ?auto_1742932 ) ) ( ON ?auto_1742925 ?auto_1742924 ) ( ON ?auto_1742926 ?auto_1742925 ) ( ON ?auto_1742927 ?auto_1742926 ) ( ON ?auto_1742928 ?auto_1742927 ) ( ON ?auto_1742929 ?auto_1742928 ) ( ON ?auto_1742930 ?auto_1742929 ) ( ON ?auto_1742931 ?auto_1742930 ) ( ON ?auto_1742932 ?auto_1742931 ) ( not ( = ?auto_1742924 ?auto_1742925 ) ) ( not ( = ?auto_1742924 ?auto_1742926 ) ) ( not ( = ?auto_1742924 ?auto_1742927 ) ) ( not ( = ?auto_1742924 ?auto_1742928 ) ) ( not ( = ?auto_1742924 ?auto_1742929 ) ) ( not ( = ?auto_1742924 ?auto_1742930 ) ) ( not ( = ?auto_1742924 ?auto_1742931 ) ) ( not ( = ?auto_1742924 ?auto_1742932 ) ) ( not ( = ?auto_1742924 ?auto_1742933 ) ) ( not ( = ?auto_1742924 ?auto_1742934 ) ) ( not ( = ?auto_1742924 ?auto_1742935 ) ) ( not ( = ?auto_1742924 ?auto_1742938 ) ) ( not ( = ?auto_1742924 ?auto_1742936 ) ) ( not ( = ?auto_1742925 ?auto_1742926 ) ) ( not ( = ?auto_1742925 ?auto_1742927 ) ) ( not ( = ?auto_1742925 ?auto_1742928 ) ) ( not ( = ?auto_1742925 ?auto_1742929 ) ) ( not ( = ?auto_1742925 ?auto_1742930 ) ) ( not ( = ?auto_1742925 ?auto_1742931 ) ) ( not ( = ?auto_1742925 ?auto_1742932 ) ) ( not ( = ?auto_1742925 ?auto_1742933 ) ) ( not ( = ?auto_1742925 ?auto_1742934 ) ) ( not ( = ?auto_1742925 ?auto_1742935 ) ) ( not ( = ?auto_1742925 ?auto_1742938 ) ) ( not ( = ?auto_1742925 ?auto_1742936 ) ) ( not ( = ?auto_1742926 ?auto_1742927 ) ) ( not ( = ?auto_1742926 ?auto_1742928 ) ) ( not ( = ?auto_1742926 ?auto_1742929 ) ) ( not ( = ?auto_1742926 ?auto_1742930 ) ) ( not ( = ?auto_1742926 ?auto_1742931 ) ) ( not ( = ?auto_1742926 ?auto_1742932 ) ) ( not ( = ?auto_1742926 ?auto_1742933 ) ) ( not ( = ?auto_1742926 ?auto_1742934 ) ) ( not ( = ?auto_1742926 ?auto_1742935 ) ) ( not ( = ?auto_1742926 ?auto_1742938 ) ) ( not ( = ?auto_1742926 ?auto_1742936 ) ) ( not ( = ?auto_1742927 ?auto_1742928 ) ) ( not ( = ?auto_1742927 ?auto_1742929 ) ) ( not ( = ?auto_1742927 ?auto_1742930 ) ) ( not ( = ?auto_1742927 ?auto_1742931 ) ) ( not ( = ?auto_1742927 ?auto_1742932 ) ) ( not ( = ?auto_1742927 ?auto_1742933 ) ) ( not ( = ?auto_1742927 ?auto_1742934 ) ) ( not ( = ?auto_1742927 ?auto_1742935 ) ) ( not ( = ?auto_1742927 ?auto_1742938 ) ) ( not ( = ?auto_1742927 ?auto_1742936 ) ) ( not ( = ?auto_1742928 ?auto_1742929 ) ) ( not ( = ?auto_1742928 ?auto_1742930 ) ) ( not ( = ?auto_1742928 ?auto_1742931 ) ) ( not ( = ?auto_1742928 ?auto_1742932 ) ) ( not ( = ?auto_1742928 ?auto_1742933 ) ) ( not ( = ?auto_1742928 ?auto_1742934 ) ) ( not ( = ?auto_1742928 ?auto_1742935 ) ) ( not ( = ?auto_1742928 ?auto_1742938 ) ) ( not ( = ?auto_1742928 ?auto_1742936 ) ) ( not ( = ?auto_1742929 ?auto_1742930 ) ) ( not ( = ?auto_1742929 ?auto_1742931 ) ) ( not ( = ?auto_1742929 ?auto_1742932 ) ) ( not ( = ?auto_1742929 ?auto_1742933 ) ) ( not ( = ?auto_1742929 ?auto_1742934 ) ) ( not ( = ?auto_1742929 ?auto_1742935 ) ) ( not ( = ?auto_1742929 ?auto_1742938 ) ) ( not ( = ?auto_1742929 ?auto_1742936 ) ) ( not ( = ?auto_1742930 ?auto_1742931 ) ) ( not ( = ?auto_1742930 ?auto_1742932 ) ) ( not ( = ?auto_1742930 ?auto_1742933 ) ) ( not ( = ?auto_1742930 ?auto_1742934 ) ) ( not ( = ?auto_1742930 ?auto_1742935 ) ) ( not ( = ?auto_1742930 ?auto_1742938 ) ) ( not ( = ?auto_1742930 ?auto_1742936 ) ) ( not ( = ?auto_1742931 ?auto_1742932 ) ) ( not ( = ?auto_1742931 ?auto_1742933 ) ) ( not ( = ?auto_1742931 ?auto_1742934 ) ) ( not ( = ?auto_1742931 ?auto_1742935 ) ) ( not ( = ?auto_1742931 ?auto_1742938 ) ) ( not ( = ?auto_1742931 ?auto_1742936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742933 ?auto_1742934 ?auto_1742935 )
      ( MAKE-11CRATE-VERIFY ?auto_1742924 ?auto_1742925 ?auto_1742926 ?auto_1742927 ?auto_1742928 ?auto_1742929 ?auto_1742930 ?auto_1742931 ?auto_1742932 ?auto_1742933 ?auto_1742934 ?auto_1742935 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1742943 - SURFACE
      ?auto_1742944 - SURFACE
      ?auto_1742945 - SURFACE
      ?auto_1742946 - SURFACE
      ?auto_1742947 - SURFACE
      ?auto_1742948 - SURFACE
      ?auto_1742949 - SURFACE
      ?auto_1742950 - SURFACE
      ?auto_1742951 - SURFACE
      ?auto_1742952 - SURFACE
      ?auto_1742953 - SURFACE
      ?auto_1742954 - SURFACE
      ?auto_1742955 - SURFACE
    )
    :vars
    (
      ?auto_1742960 - HOIST
      ?auto_1742962 - PLACE
      ?auto_1742957 - PLACE
      ?auto_1742959 - HOIST
      ?auto_1742958 - SURFACE
      ?auto_1742956 - SURFACE
      ?auto_1742961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742960 ?auto_1742962 ) ( IS-CRATE ?auto_1742955 ) ( not ( = ?auto_1742954 ?auto_1742955 ) ) ( not ( = ?auto_1742953 ?auto_1742954 ) ) ( not ( = ?auto_1742953 ?auto_1742955 ) ) ( not ( = ?auto_1742957 ?auto_1742962 ) ) ( HOIST-AT ?auto_1742959 ?auto_1742957 ) ( not ( = ?auto_1742960 ?auto_1742959 ) ) ( SURFACE-AT ?auto_1742955 ?auto_1742957 ) ( ON ?auto_1742955 ?auto_1742958 ) ( CLEAR ?auto_1742955 ) ( not ( = ?auto_1742954 ?auto_1742958 ) ) ( not ( = ?auto_1742955 ?auto_1742958 ) ) ( not ( = ?auto_1742953 ?auto_1742958 ) ) ( IS-CRATE ?auto_1742954 ) ( AVAILABLE ?auto_1742959 ) ( SURFACE-AT ?auto_1742954 ?auto_1742957 ) ( ON ?auto_1742954 ?auto_1742956 ) ( CLEAR ?auto_1742954 ) ( not ( = ?auto_1742954 ?auto_1742956 ) ) ( not ( = ?auto_1742955 ?auto_1742956 ) ) ( not ( = ?auto_1742953 ?auto_1742956 ) ) ( not ( = ?auto_1742958 ?auto_1742956 ) ) ( TRUCK-AT ?auto_1742961 ?auto_1742962 ) ( SURFACE-AT ?auto_1742952 ?auto_1742962 ) ( CLEAR ?auto_1742952 ) ( LIFTING ?auto_1742960 ?auto_1742953 ) ( IS-CRATE ?auto_1742953 ) ( not ( = ?auto_1742952 ?auto_1742953 ) ) ( not ( = ?auto_1742954 ?auto_1742952 ) ) ( not ( = ?auto_1742955 ?auto_1742952 ) ) ( not ( = ?auto_1742958 ?auto_1742952 ) ) ( not ( = ?auto_1742956 ?auto_1742952 ) ) ( ON ?auto_1742944 ?auto_1742943 ) ( ON ?auto_1742945 ?auto_1742944 ) ( ON ?auto_1742946 ?auto_1742945 ) ( ON ?auto_1742947 ?auto_1742946 ) ( ON ?auto_1742948 ?auto_1742947 ) ( ON ?auto_1742949 ?auto_1742948 ) ( ON ?auto_1742950 ?auto_1742949 ) ( ON ?auto_1742951 ?auto_1742950 ) ( ON ?auto_1742952 ?auto_1742951 ) ( not ( = ?auto_1742943 ?auto_1742944 ) ) ( not ( = ?auto_1742943 ?auto_1742945 ) ) ( not ( = ?auto_1742943 ?auto_1742946 ) ) ( not ( = ?auto_1742943 ?auto_1742947 ) ) ( not ( = ?auto_1742943 ?auto_1742948 ) ) ( not ( = ?auto_1742943 ?auto_1742949 ) ) ( not ( = ?auto_1742943 ?auto_1742950 ) ) ( not ( = ?auto_1742943 ?auto_1742951 ) ) ( not ( = ?auto_1742943 ?auto_1742952 ) ) ( not ( = ?auto_1742943 ?auto_1742953 ) ) ( not ( = ?auto_1742943 ?auto_1742954 ) ) ( not ( = ?auto_1742943 ?auto_1742955 ) ) ( not ( = ?auto_1742943 ?auto_1742958 ) ) ( not ( = ?auto_1742943 ?auto_1742956 ) ) ( not ( = ?auto_1742944 ?auto_1742945 ) ) ( not ( = ?auto_1742944 ?auto_1742946 ) ) ( not ( = ?auto_1742944 ?auto_1742947 ) ) ( not ( = ?auto_1742944 ?auto_1742948 ) ) ( not ( = ?auto_1742944 ?auto_1742949 ) ) ( not ( = ?auto_1742944 ?auto_1742950 ) ) ( not ( = ?auto_1742944 ?auto_1742951 ) ) ( not ( = ?auto_1742944 ?auto_1742952 ) ) ( not ( = ?auto_1742944 ?auto_1742953 ) ) ( not ( = ?auto_1742944 ?auto_1742954 ) ) ( not ( = ?auto_1742944 ?auto_1742955 ) ) ( not ( = ?auto_1742944 ?auto_1742958 ) ) ( not ( = ?auto_1742944 ?auto_1742956 ) ) ( not ( = ?auto_1742945 ?auto_1742946 ) ) ( not ( = ?auto_1742945 ?auto_1742947 ) ) ( not ( = ?auto_1742945 ?auto_1742948 ) ) ( not ( = ?auto_1742945 ?auto_1742949 ) ) ( not ( = ?auto_1742945 ?auto_1742950 ) ) ( not ( = ?auto_1742945 ?auto_1742951 ) ) ( not ( = ?auto_1742945 ?auto_1742952 ) ) ( not ( = ?auto_1742945 ?auto_1742953 ) ) ( not ( = ?auto_1742945 ?auto_1742954 ) ) ( not ( = ?auto_1742945 ?auto_1742955 ) ) ( not ( = ?auto_1742945 ?auto_1742958 ) ) ( not ( = ?auto_1742945 ?auto_1742956 ) ) ( not ( = ?auto_1742946 ?auto_1742947 ) ) ( not ( = ?auto_1742946 ?auto_1742948 ) ) ( not ( = ?auto_1742946 ?auto_1742949 ) ) ( not ( = ?auto_1742946 ?auto_1742950 ) ) ( not ( = ?auto_1742946 ?auto_1742951 ) ) ( not ( = ?auto_1742946 ?auto_1742952 ) ) ( not ( = ?auto_1742946 ?auto_1742953 ) ) ( not ( = ?auto_1742946 ?auto_1742954 ) ) ( not ( = ?auto_1742946 ?auto_1742955 ) ) ( not ( = ?auto_1742946 ?auto_1742958 ) ) ( not ( = ?auto_1742946 ?auto_1742956 ) ) ( not ( = ?auto_1742947 ?auto_1742948 ) ) ( not ( = ?auto_1742947 ?auto_1742949 ) ) ( not ( = ?auto_1742947 ?auto_1742950 ) ) ( not ( = ?auto_1742947 ?auto_1742951 ) ) ( not ( = ?auto_1742947 ?auto_1742952 ) ) ( not ( = ?auto_1742947 ?auto_1742953 ) ) ( not ( = ?auto_1742947 ?auto_1742954 ) ) ( not ( = ?auto_1742947 ?auto_1742955 ) ) ( not ( = ?auto_1742947 ?auto_1742958 ) ) ( not ( = ?auto_1742947 ?auto_1742956 ) ) ( not ( = ?auto_1742948 ?auto_1742949 ) ) ( not ( = ?auto_1742948 ?auto_1742950 ) ) ( not ( = ?auto_1742948 ?auto_1742951 ) ) ( not ( = ?auto_1742948 ?auto_1742952 ) ) ( not ( = ?auto_1742948 ?auto_1742953 ) ) ( not ( = ?auto_1742948 ?auto_1742954 ) ) ( not ( = ?auto_1742948 ?auto_1742955 ) ) ( not ( = ?auto_1742948 ?auto_1742958 ) ) ( not ( = ?auto_1742948 ?auto_1742956 ) ) ( not ( = ?auto_1742949 ?auto_1742950 ) ) ( not ( = ?auto_1742949 ?auto_1742951 ) ) ( not ( = ?auto_1742949 ?auto_1742952 ) ) ( not ( = ?auto_1742949 ?auto_1742953 ) ) ( not ( = ?auto_1742949 ?auto_1742954 ) ) ( not ( = ?auto_1742949 ?auto_1742955 ) ) ( not ( = ?auto_1742949 ?auto_1742958 ) ) ( not ( = ?auto_1742949 ?auto_1742956 ) ) ( not ( = ?auto_1742950 ?auto_1742951 ) ) ( not ( = ?auto_1742950 ?auto_1742952 ) ) ( not ( = ?auto_1742950 ?auto_1742953 ) ) ( not ( = ?auto_1742950 ?auto_1742954 ) ) ( not ( = ?auto_1742950 ?auto_1742955 ) ) ( not ( = ?auto_1742950 ?auto_1742958 ) ) ( not ( = ?auto_1742950 ?auto_1742956 ) ) ( not ( = ?auto_1742951 ?auto_1742952 ) ) ( not ( = ?auto_1742951 ?auto_1742953 ) ) ( not ( = ?auto_1742951 ?auto_1742954 ) ) ( not ( = ?auto_1742951 ?auto_1742955 ) ) ( not ( = ?auto_1742951 ?auto_1742958 ) ) ( not ( = ?auto_1742951 ?auto_1742956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1742953 ?auto_1742954 ?auto_1742955 )
      ( MAKE-12CRATE-VERIFY ?auto_1742943 ?auto_1742944 ?auto_1742945 ?auto_1742946 ?auto_1742947 ?auto_1742948 ?auto_1742949 ?auto_1742950 ?auto_1742951 ?auto_1742952 ?auto_1742953 ?auto_1742954 ?auto_1742955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1744306 - SURFACE
      ?auto_1744307 - SURFACE
    )
    :vars
    (
      ?auto_1744314 - HOIST
      ?auto_1744315 - PLACE
      ?auto_1744308 - SURFACE
      ?auto_1744311 - PLACE
      ?auto_1744313 - HOIST
      ?auto_1744310 - SURFACE
      ?auto_1744312 - TRUCK
      ?auto_1744309 - SURFACE
      ?auto_1744316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1744314 ?auto_1744315 ) ( IS-CRATE ?auto_1744307 ) ( not ( = ?auto_1744306 ?auto_1744307 ) ) ( not ( = ?auto_1744308 ?auto_1744306 ) ) ( not ( = ?auto_1744308 ?auto_1744307 ) ) ( not ( = ?auto_1744311 ?auto_1744315 ) ) ( HOIST-AT ?auto_1744313 ?auto_1744311 ) ( not ( = ?auto_1744314 ?auto_1744313 ) ) ( SURFACE-AT ?auto_1744307 ?auto_1744311 ) ( ON ?auto_1744307 ?auto_1744310 ) ( CLEAR ?auto_1744307 ) ( not ( = ?auto_1744306 ?auto_1744310 ) ) ( not ( = ?auto_1744307 ?auto_1744310 ) ) ( not ( = ?auto_1744308 ?auto_1744310 ) ) ( SURFACE-AT ?auto_1744308 ?auto_1744315 ) ( CLEAR ?auto_1744308 ) ( IS-CRATE ?auto_1744306 ) ( AVAILABLE ?auto_1744314 ) ( TRUCK-AT ?auto_1744312 ?auto_1744311 ) ( SURFACE-AT ?auto_1744306 ?auto_1744311 ) ( ON ?auto_1744306 ?auto_1744309 ) ( CLEAR ?auto_1744306 ) ( not ( = ?auto_1744306 ?auto_1744309 ) ) ( not ( = ?auto_1744307 ?auto_1744309 ) ) ( not ( = ?auto_1744308 ?auto_1744309 ) ) ( not ( = ?auto_1744310 ?auto_1744309 ) ) ( LIFTING ?auto_1744313 ?auto_1744316 ) ( IS-CRATE ?auto_1744316 ) ( not ( = ?auto_1744306 ?auto_1744316 ) ) ( not ( = ?auto_1744307 ?auto_1744316 ) ) ( not ( = ?auto_1744308 ?auto_1744316 ) ) ( not ( = ?auto_1744310 ?auto_1744316 ) ) ( not ( = ?auto_1744309 ?auto_1744316 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1744313 ?auto_1744316 ?auto_1744312 ?auto_1744311 )
      ( MAKE-2CRATE ?auto_1744308 ?auto_1744306 ?auto_1744307 )
      ( MAKE-1CRATE-VERIFY ?auto_1744306 ?auto_1744307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1744317 - SURFACE
      ?auto_1744318 - SURFACE
      ?auto_1744319 - SURFACE
    )
    :vars
    (
      ?auto_1744326 - HOIST
      ?auto_1744325 - PLACE
      ?auto_1744327 - PLACE
      ?auto_1744320 - HOIST
      ?auto_1744324 - SURFACE
      ?auto_1744322 - TRUCK
      ?auto_1744321 - SURFACE
      ?auto_1744323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1744326 ?auto_1744325 ) ( IS-CRATE ?auto_1744319 ) ( not ( = ?auto_1744318 ?auto_1744319 ) ) ( not ( = ?auto_1744317 ?auto_1744318 ) ) ( not ( = ?auto_1744317 ?auto_1744319 ) ) ( not ( = ?auto_1744327 ?auto_1744325 ) ) ( HOIST-AT ?auto_1744320 ?auto_1744327 ) ( not ( = ?auto_1744326 ?auto_1744320 ) ) ( SURFACE-AT ?auto_1744319 ?auto_1744327 ) ( ON ?auto_1744319 ?auto_1744324 ) ( CLEAR ?auto_1744319 ) ( not ( = ?auto_1744318 ?auto_1744324 ) ) ( not ( = ?auto_1744319 ?auto_1744324 ) ) ( not ( = ?auto_1744317 ?auto_1744324 ) ) ( SURFACE-AT ?auto_1744317 ?auto_1744325 ) ( CLEAR ?auto_1744317 ) ( IS-CRATE ?auto_1744318 ) ( AVAILABLE ?auto_1744326 ) ( TRUCK-AT ?auto_1744322 ?auto_1744327 ) ( SURFACE-AT ?auto_1744318 ?auto_1744327 ) ( ON ?auto_1744318 ?auto_1744321 ) ( CLEAR ?auto_1744318 ) ( not ( = ?auto_1744318 ?auto_1744321 ) ) ( not ( = ?auto_1744319 ?auto_1744321 ) ) ( not ( = ?auto_1744317 ?auto_1744321 ) ) ( not ( = ?auto_1744324 ?auto_1744321 ) ) ( LIFTING ?auto_1744320 ?auto_1744323 ) ( IS-CRATE ?auto_1744323 ) ( not ( = ?auto_1744318 ?auto_1744323 ) ) ( not ( = ?auto_1744319 ?auto_1744323 ) ) ( not ( = ?auto_1744317 ?auto_1744323 ) ) ( not ( = ?auto_1744324 ?auto_1744323 ) ) ( not ( = ?auto_1744321 ?auto_1744323 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1744318 ?auto_1744319 )
      ( MAKE-2CRATE-VERIFY ?auto_1744317 ?auto_1744318 ?auto_1744319 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753447 - SURFACE
      ?auto_1753448 - SURFACE
      ?auto_1753449 - SURFACE
      ?auto_1753450 - SURFACE
      ?auto_1753451 - SURFACE
      ?auto_1753452 - SURFACE
      ?auto_1753453 - SURFACE
      ?auto_1753454 - SURFACE
      ?auto_1753455 - SURFACE
      ?auto_1753456 - SURFACE
      ?auto_1753457 - SURFACE
      ?auto_1753458 - SURFACE
      ?auto_1753459 - SURFACE
      ?auto_1753460 - SURFACE
    )
    :vars
    (
      ?auto_1753461 - HOIST
      ?auto_1753462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753461 ?auto_1753462 ) ( SURFACE-AT ?auto_1753459 ?auto_1753462 ) ( CLEAR ?auto_1753459 ) ( LIFTING ?auto_1753461 ?auto_1753460 ) ( IS-CRATE ?auto_1753460 ) ( not ( = ?auto_1753459 ?auto_1753460 ) ) ( ON ?auto_1753448 ?auto_1753447 ) ( ON ?auto_1753449 ?auto_1753448 ) ( ON ?auto_1753450 ?auto_1753449 ) ( ON ?auto_1753451 ?auto_1753450 ) ( ON ?auto_1753452 ?auto_1753451 ) ( ON ?auto_1753453 ?auto_1753452 ) ( ON ?auto_1753454 ?auto_1753453 ) ( ON ?auto_1753455 ?auto_1753454 ) ( ON ?auto_1753456 ?auto_1753455 ) ( ON ?auto_1753457 ?auto_1753456 ) ( ON ?auto_1753458 ?auto_1753457 ) ( ON ?auto_1753459 ?auto_1753458 ) ( not ( = ?auto_1753447 ?auto_1753448 ) ) ( not ( = ?auto_1753447 ?auto_1753449 ) ) ( not ( = ?auto_1753447 ?auto_1753450 ) ) ( not ( = ?auto_1753447 ?auto_1753451 ) ) ( not ( = ?auto_1753447 ?auto_1753452 ) ) ( not ( = ?auto_1753447 ?auto_1753453 ) ) ( not ( = ?auto_1753447 ?auto_1753454 ) ) ( not ( = ?auto_1753447 ?auto_1753455 ) ) ( not ( = ?auto_1753447 ?auto_1753456 ) ) ( not ( = ?auto_1753447 ?auto_1753457 ) ) ( not ( = ?auto_1753447 ?auto_1753458 ) ) ( not ( = ?auto_1753447 ?auto_1753459 ) ) ( not ( = ?auto_1753447 ?auto_1753460 ) ) ( not ( = ?auto_1753448 ?auto_1753449 ) ) ( not ( = ?auto_1753448 ?auto_1753450 ) ) ( not ( = ?auto_1753448 ?auto_1753451 ) ) ( not ( = ?auto_1753448 ?auto_1753452 ) ) ( not ( = ?auto_1753448 ?auto_1753453 ) ) ( not ( = ?auto_1753448 ?auto_1753454 ) ) ( not ( = ?auto_1753448 ?auto_1753455 ) ) ( not ( = ?auto_1753448 ?auto_1753456 ) ) ( not ( = ?auto_1753448 ?auto_1753457 ) ) ( not ( = ?auto_1753448 ?auto_1753458 ) ) ( not ( = ?auto_1753448 ?auto_1753459 ) ) ( not ( = ?auto_1753448 ?auto_1753460 ) ) ( not ( = ?auto_1753449 ?auto_1753450 ) ) ( not ( = ?auto_1753449 ?auto_1753451 ) ) ( not ( = ?auto_1753449 ?auto_1753452 ) ) ( not ( = ?auto_1753449 ?auto_1753453 ) ) ( not ( = ?auto_1753449 ?auto_1753454 ) ) ( not ( = ?auto_1753449 ?auto_1753455 ) ) ( not ( = ?auto_1753449 ?auto_1753456 ) ) ( not ( = ?auto_1753449 ?auto_1753457 ) ) ( not ( = ?auto_1753449 ?auto_1753458 ) ) ( not ( = ?auto_1753449 ?auto_1753459 ) ) ( not ( = ?auto_1753449 ?auto_1753460 ) ) ( not ( = ?auto_1753450 ?auto_1753451 ) ) ( not ( = ?auto_1753450 ?auto_1753452 ) ) ( not ( = ?auto_1753450 ?auto_1753453 ) ) ( not ( = ?auto_1753450 ?auto_1753454 ) ) ( not ( = ?auto_1753450 ?auto_1753455 ) ) ( not ( = ?auto_1753450 ?auto_1753456 ) ) ( not ( = ?auto_1753450 ?auto_1753457 ) ) ( not ( = ?auto_1753450 ?auto_1753458 ) ) ( not ( = ?auto_1753450 ?auto_1753459 ) ) ( not ( = ?auto_1753450 ?auto_1753460 ) ) ( not ( = ?auto_1753451 ?auto_1753452 ) ) ( not ( = ?auto_1753451 ?auto_1753453 ) ) ( not ( = ?auto_1753451 ?auto_1753454 ) ) ( not ( = ?auto_1753451 ?auto_1753455 ) ) ( not ( = ?auto_1753451 ?auto_1753456 ) ) ( not ( = ?auto_1753451 ?auto_1753457 ) ) ( not ( = ?auto_1753451 ?auto_1753458 ) ) ( not ( = ?auto_1753451 ?auto_1753459 ) ) ( not ( = ?auto_1753451 ?auto_1753460 ) ) ( not ( = ?auto_1753452 ?auto_1753453 ) ) ( not ( = ?auto_1753452 ?auto_1753454 ) ) ( not ( = ?auto_1753452 ?auto_1753455 ) ) ( not ( = ?auto_1753452 ?auto_1753456 ) ) ( not ( = ?auto_1753452 ?auto_1753457 ) ) ( not ( = ?auto_1753452 ?auto_1753458 ) ) ( not ( = ?auto_1753452 ?auto_1753459 ) ) ( not ( = ?auto_1753452 ?auto_1753460 ) ) ( not ( = ?auto_1753453 ?auto_1753454 ) ) ( not ( = ?auto_1753453 ?auto_1753455 ) ) ( not ( = ?auto_1753453 ?auto_1753456 ) ) ( not ( = ?auto_1753453 ?auto_1753457 ) ) ( not ( = ?auto_1753453 ?auto_1753458 ) ) ( not ( = ?auto_1753453 ?auto_1753459 ) ) ( not ( = ?auto_1753453 ?auto_1753460 ) ) ( not ( = ?auto_1753454 ?auto_1753455 ) ) ( not ( = ?auto_1753454 ?auto_1753456 ) ) ( not ( = ?auto_1753454 ?auto_1753457 ) ) ( not ( = ?auto_1753454 ?auto_1753458 ) ) ( not ( = ?auto_1753454 ?auto_1753459 ) ) ( not ( = ?auto_1753454 ?auto_1753460 ) ) ( not ( = ?auto_1753455 ?auto_1753456 ) ) ( not ( = ?auto_1753455 ?auto_1753457 ) ) ( not ( = ?auto_1753455 ?auto_1753458 ) ) ( not ( = ?auto_1753455 ?auto_1753459 ) ) ( not ( = ?auto_1753455 ?auto_1753460 ) ) ( not ( = ?auto_1753456 ?auto_1753457 ) ) ( not ( = ?auto_1753456 ?auto_1753458 ) ) ( not ( = ?auto_1753456 ?auto_1753459 ) ) ( not ( = ?auto_1753456 ?auto_1753460 ) ) ( not ( = ?auto_1753457 ?auto_1753458 ) ) ( not ( = ?auto_1753457 ?auto_1753459 ) ) ( not ( = ?auto_1753457 ?auto_1753460 ) ) ( not ( = ?auto_1753458 ?auto_1753459 ) ) ( not ( = ?auto_1753458 ?auto_1753460 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1753459 ?auto_1753460 )
      ( MAKE-13CRATE-VERIFY ?auto_1753447 ?auto_1753448 ?auto_1753449 ?auto_1753450 ?auto_1753451 ?auto_1753452 ?auto_1753453 ?auto_1753454 ?auto_1753455 ?auto_1753456 ?auto_1753457 ?auto_1753458 ?auto_1753459 ?auto_1753460 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753589 - SURFACE
      ?auto_1753590 - SURFACE
      ?auto_1753591 - SURFACE
      ?auto_1753592 - SURFACE
      ?auto_1753593 - SURFACE
      ?auto_1753594 - SURFACE
      ?auto_1753595 - SURFACE
      ?auto_1753596 - SURFACE
      ?auto_1753597 - SURFACE
      ?auto_1753598 - SURFACE
      ?auto_1753599 - SURFACE
      ?auto_1753600 - SURFACE
      ?auto_1753601 - SURFACE
      ?auto_1753602 - SURFACE
    )
    :vars
    (
      ?auto_1753604 - HOIST
      ?auto_1753603 - PLACE
      ?auto_1753605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753604 ?auto_1753603 ) ( SURFACE-AT ?auto_1753601 ?auto_1753603 ) ( CLEAR ?auto_1753601 ) ( IS-CRATE ?auto_1753602 ) ( not ( = ?auto_1753601 ?auto_1753602 ) ) ( TRUCK-AT ?auto_1753605 ?auto_1753603 ) ( AVAILABLE ?auto_1753604 ) ( IN ?auto_1753602 ?auto_1753605 ) ( ON ?auto_1753601 ?auto_1753600 ) ( not ( = ?auto_1753600 ?auto_1753601 ) ) ( not ( = ?auto_1753600 ?auto_1753602 ) ) ( ON ?auto_1753590 ?auto_1753589 ) ( ON ?auto_1753591 ?auto_1753590 ) ( ON ?auto_1753592 ?auto_1753591 ) ( ON ?auto_1753593 ?auto_1753592 ) ( ON ?auto_1753594 ?auto_1753593 ) ( ON ?auto_1753595 ?auto_1753594 ) ( ON ?auto_1753596 ?auto_1753595 ) ( ON ?auto_1753597 ?auto_1753596 ) ( ON ?auto_1753598 ?auto_1753597 ) ( ON ?auto_1753599 ?auto_1753598 ) ( ON ?auto_1753600 ?auto_1753599 ) ( not ( = ?auto_1753589 ?auto_1753590 ) ) ( not ( = ?auto_1753589 ?auto_1753591 ) ) ( not ( = ?auto_1753589 ?auto_1753592 ) ) ( not ( = ?auto_1753589 ?auto_1753593 ) ) ( not ( = ?auto_1753589 ?auto_1753594 ) ) ( not ( = ?auto_1753589 ?auto_1753595 ) ) ( not ( = ?auto_1753589 ?auto_1753596 ) ) ( not ( = ?auto_1753589 ?auto_1753597 ) ) ( not ( = ?auto_1753589 ?auto_1753598 ) ) ( not ( = ?auto_1753589 ?auto_1753599 ) ) ( not ( = ?auto_1753589 ?auto_1753600 ) ) ( not ( = ?auto_1753589 ?auto_1753601 ) ) ( not ( = ?auto_1753589 ?auto_1753602 ) ) ( not ( = ?auto_1753590 ?auto_1753591 ) ) ( not ( = ?auto_1753590 ?auto_1753592 ) ) ( not ( = ?auto_1753590 ?auto_1753593 ) ) ( not ( = ?auto_1753590 ?auto_1753594 ) ) ( not ( = ?auto_1753590 ?auto_1753595 ) ) ( not ( = ?auto_1753590 ?auto_1753596 ) ) ( not ( = ?auto_1753590 ?auto_1753597 ) ) ( not ( = ?auto_1753590 ?auto_1753598 ) ) ( not ( = ?auto_1753590 ?auto_1753599 ) ) ( not ( = ?auto_1753590 ?auto_1753600 ) ) ( not ( = ?auto_1753590 ?auto_1753601 ) ) ( not ( = ?auto_1753590 ?auto_1753602 ) ) ( not ( = ?auto_1753591 ?auto_1753592 ) ) ( not ( = ?auto_1753591 ?auto_1753593 ) ) ( not ( = ?auto_1753591 ?auto_1753594 ) ) ( not ( = ?auto_1753591 ?auto_1753595 ) ) ( not ( = ?auto_1753591 ?auto_1753596 ) ) ( not ( = ?auto_1753591 ?auto_1753597 ) ) ( not ( = ?auto_1753591 ?auto_1753598 ) ) ( not ( = ?auto_1753591 ?auto_1753599 ) ) ( not ( = ?auto_1753591 ?auto_1753600 ) ) ( not ( = ?auto_1753591 ?auto_1753601 ) ) ( not ( = ?auto_1753591 ?auto_1753602 ) ) ( not ( = ?auto_1753592 ?auto_1753593 ) ) ( not ( = ?auto_1753592 ?auto_1753594 ) ) ( not ( = ?auto_1753592 ?auto_1753595 ) ) ( not ( = ?auto_1753592 ?auto_1753596 ) ) ( not ( = ?auto_1753592 ?auto_1753597 ) ) ( not ( = ?auto_1753592 ?auto_1753598 ) ) ( not ( = ?auto_1753592 ?auto_1753599 ) ) ( not ( = ?auto_1753592 ?auto_1753600 ) ) ( not ( = ?auto_1753592 ?auto_1753601 ) ) ( not ( = ?auto_1753592 ?auto_1753602 ) ) ( not ( = ?auto_1753593 ?auto_1753594 ) ) ( not ( = ?auto_1753593 ?auto_1753595 ) ) ( not ( = ?auto_1753593 ?auto_1753596 ) ) ( not ( = ?auto_1753593 ?auto_1753597 ) ) ( not ( = ?auto_1753593 ?auto_1753598 ) ) ( not ( = ?auto_1753593 ?auto_1753599 ) ) ( not ( = ?auto_1753593 ?auto_1753600 ) ) ( not ( = ?auto_1753593 ?auto_1753601 ) ) ( not ( = ?auto_1753593 ?auto_1753602 ) ) ( not ( = ?auto_1753594 ?auto_1753595 ) ) ( not ( = ?auto_1753594 ?auto_1753596 ) ) ( not ( = ?auto_1753594 ?auto_1753597 ) ) ( not ( = ?auto_1753594 ?auto_1753598 ) ) ( not ( = ?auto_1753594 ?auto_1753599 ) ) ( not ( = ?auto_1753594 ?auto_1753600 ) ) ( not ( = ?auto_1753594 ?auto_1753601 ) ) ( not ( = ?auto_1753594 ?auto_1753602 ) ) ( not ( = ?auto_1753595 ?auto_1753596 ) ) ( not ( = ?auto_1753595 ?auto_1753597 ) ) ( not ( = ?auto_1753595 ?auto_1753598 ) ) ( not ( = ?auto_1753595 ?auto_1753599 ) ) ( not ( = ?auto_1753595 ?auto_1753600 ) ) ( not ( = ?auto_1753595 ?auto_1753601 ) ) ( not ( = ?auto_1753595 ?auto_1753602 ) ) ( not ( = ?auto_1753596 ?auto_1753597 ) ) ( not ( = ?auto_1753596 ?auto_1753598 ) ) ( not ( = ?auto_1753596 ?auto_1753599 ) ) ( not ( = ?auto_1753596 ?auto_1753600 ) ) ( not ( = ?auto_1753596 ?auto_1753601 ) ) ( not ( = ?auto_1753596 ?auto_1753602 ) ) ( not ( = ?auto_1753597 ?auto_1753598 ) ) ( not ( = ?auto_1753597 ?auto_1753599 ) ) ( not ( = ?auto_1753597 ?auto_1753600 ) ) ( not ( = ?auto_1753597 ?auto_1753601 ) ) ( not ( = ?auto_1753597 ?auto_1753602 ) ) ( not ( = ?auto_1753598 ?auto_1753599 ) ) ( not ( = ?auto_1753598 ?auto_1753600 ) ) ( not ( = ?auto_1753598 ?auto_1753601 ) ) ( not ( = ?auto_1753598 ?auto_1753602 ) ) ( not ( = ?auto_1753599 ?auto_1753600 ) ) ( not ( = ?auto_1753599 ?auto_1753601 ) ) ( not ( = ?auto_1753599 ?auto_1753602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753600 ?auto_1753601 ?auto_1753602 )
      ( MAKE-13CRATE-VERIFY ?auto_1753589 ?auto_1753590 ?auto_1753591 ?auto_1753592 ?auto_1753593 ?auto_1753594 ?auto_1753595 ?auto_1753596 ?auto_1753597 ?auto_1753598 ?auto_1753599 ?auto_1753600 ?auto_1753601 ?auto_1753602 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753745 - SURFACE
      ?auto_1753746 - SURFACE
      ?auto_1753747 - SURFACE
      ?auto_1753748 - SURFACE
      ?auto_1753749 - SURFACE
      ?auto_1753750 - SURFACE
      ?auto_1753751 - SURFACE
      ?auto_1753752 - SURFACE
      ?auto_1753753 - SURFACE
      ?auto_1753754 - SURFACE
      ?auto_1753755 - SURFACE
      ?auto_1753756 - SURFACE
      ?auto_1753757 - SURFACE
      ?auto_1753758 - SURFACE
    )
    :vars
    (
      ?auto_1753761 - HOIST
      ?auto_1753762 - PLACE
      ?auto_1753760 - TRUCK
      ?auto_1753759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753761 ?auto_1753762 ) ( SURFACE-AT ?auto_1753757 ?auto_1753762 ) ( CLEAR ?auto_1753757 ) ( IS-CRATE ?auto_1753758 ) ( not ( = ?auto_1753757 ?auto_1753758 ) ) ( AVAILABLE ?auto_1753761 ) ( IN ?auto_1753758 ?auto_1753760 ) ( ON ?auto_1753757 ?auto_1753756 ) ( not ( = ?auto_1753756 ?auto_1753757 ) ) ( not ( = ?auto_1753756 ?auto_1753758 ) ) ( TRUCK-AT ?auto_1753760 ?auto_1753759 ) ( not ( = ?auto_1753759 ?auto_1753762 ) ) ( ON ?auto_1753746 ?auto_1753745 ) ( ON ?auto_1753747 ?auto_1753746 ) ( ON ?auto_1753748 ?auto_1753747 ) ( ON ?auto_1753749 ?auto_1753748 ) ( ON ?auto_1753750 ?auto_1753749 ) ( ON ?auto_1753751 ?auto_1753750 ) ( ON ?auto_1753752 ?auto_1753751 ) ( ON ?auto_1753753 ?auto_1753752 ) ( ON ?auto_1753754 ?auto_1753753 ) ( ON ?auto_1753755 ?auto_1753754 ) ( ON ?auto_1753756 ?auto_1753755 ) ( not ( = ?auto_1753745 ?auto_1753746 ) ) ( not ( = ?auto_1753745 ?auto_1753747 ) ) ( not ( = ?auto_1753745 ?auto_1753748 ) ) ( not ( = ?auto_1753745 ?auto_1753749 ) ) ( not ( = ?auto_1753745 ?auto_1753750 ) ) ( not ( = ?auto_1753745 ?auto_1753751 ) ) ( not ( = ?auto_1753745 ?auto_1753752 ) ) ( not ( = ?auto_1753745 ?auto_1753753 ) ) ( not ( = ?auto_1753745 ?auto_1753754 ) ) ( not ( = ?auto_1753745 ?auto_1753755 ) ) ( not ( = ?auto_1753745 ?auto_1753756 ) ) ( not ( = ?auto_1753745 ?auto_1753757 ) ) ( not ( = ?auto_1753745 ?auto_1753758 ) ) ( not ( = ?auto_1753746 ?auto_1753747 ) ) ( not ( = ?auto_1753746 ?auto_1753748 ) ) ( not ( = ?auto_1753746 ?auto_1753749 ) ) ( not ( = ?auto_1753746 ?auto_1753750 ) ) ( not ( = ?auto_1753746 ?auto_1753751 ) ) ( not ( = ?auto_1753746 ?auto_1753752 ) ) ( not ( = ?auto_1753746 ?auto_1753753 ) ) ( not ( = ?auto_1753746 ?auto_1753754 ) ) ( not ( = ?auto_1753746 ?auto_1753755 ) ) ( not ( = ?auto_1753746 ?auto_1753756 ) ) ( not ( = ?auto_1753746 ?auto_1753757 ) ) ( not ( = ?auto_1753746 ?auto_1753758 ) ) ( not ( = ?auto_1753747 ?auto_1753748 ) ) ( not ( = ?auto_1753747 ?auto_1753749 ) ) ( not ( = ?auto_1753747 ?auto_1753750 ) ) ( not ( = ?auto_1753747 ?auto_1753751 ) ) ( not ( = ?auto_1753747 ?auto_1753752 ) ) ( not ( = ?auto_1753747 ?auto_1753753 ) ) ( not ( = ?auto_1753747 ?auto_1753754 ) ) ( not ( = ?auto_1753747 ?auto_1753755 ) ) ( not ( = ?auto_1753747 ?auto_1753756 ) ) ( not ( = ?auto_1753747 ?auto_1753757 ) ) ( not ( = ?auto_1753747 ?auto_1753758 ) ) ( not ( = ?auto_1753748 ?auto_1753749 ) ) ( not ( = ?auto_1753748 ?auto_1753750 ) ) ( not ( = ?auto_1753748 ?auto_1753751 ) ) ( not ( = ?auto_1753748 ?auto_1753752 ) ) ( not ( = ?auto_1753748 ?auto_1753753 ) ) ( not ( = ?auto_1753748 ?auto_1753754 ) ) ( not ( = ?auto_1753748 ?auto_1753755 ) ) ( not ( = ?auto_1753748 ?auto_1753756 ) ) ( not ( = ?auto_1753748 ?auto_1753757 ) ) ( not ( = ?auto_1753748 ?auto_1753758 ) ) ( not ( = ?auto_1753749 ?auto_1753750 ) ) ( not ( = ?auto_1753749 ?auto_1753751 ) ) ( not ( = ?auto_1753749 ?auto_1753752 ) ) ( not ( = ?auto_1753749 ?auto_1753753 ) ) ( not ( = ?auto_1753749 ?auto_1753754 ) ) ( not ( = ?auto_1753749 ?auto_1753755 ) ) ( not ( = ?auto_1753749 ?auto_1753756 ) ) ( not ( = ?auto_1753749 ?auto_1753757 ) ) ( not ( = ?auto_1753749 ?auto_1753758 ) ) ( not ( = ?auto_1753750 ?auto_1753751 ) ) ( not ( = ?auto_1753750 ?auto_1753752 ) ) ( not ( = ?auto_1753750 ?auto_1753753 ) ) ( not ( = ?auto_1753750 ?auto_1753754 ) ) ( not ( = ?auto_1753750 ?auto_1753755 ) ) ( not ( = ?auto_1753750 ?auto_1753756 ) ) ( not ( = ?auto_1753750 ?auto_1753757 ) ) ( not ( = ?auto_1753750 ?auto_1753758 ) ) ( not ( = ?auto_1753751 ?auto_1753752 ) ) ( not ( = ?auto_1753751 ?auto_1753753 ) ) ( not ( = ?auto_1753751 ?auto_1753754 ) ) ( not ( = ?auto_1753751 ?auto_1753755 ) ) ( not ( = ?auto_1753751 ?auto_1753756 ) ) ( not ( = ?auto_1753751 ?auto_1753757 ) ) ( not ( = ?auto_1753751 ?auto_1753758 ) ) ( not ( = ?auto_1753752 ?auto_1753753 ) ) ( not ( = ?auto_1753752 ?auto_1753754 ) ) ( not ( = ?auto_1753752 ?auto_1753755 ) ) ( not ( = ?auto_1753752 ?auto_1753756 ) ) ( not ( = ?auto_1753752 ?auto_1753757 ) ) ( not ( = ?auto_1753752 ?auto_1753758 ) ) ( not ( = ?auto_1753753 ?auto_1753754 ) ) ( not ( = ?auto_1753753 ?auto_1753755 ) ) ( not ( = ?auto_1753753 ?auto_1753756 ) ) ( not ( = ?auto_1753753 ?auto_1753757 ) ) ( not ( = ?auto_1753753 ?auto_1753758 ) ) ( not ( = ?auto_1753754 ?auto_1753755 ) ) ( not ( = ?auto_1753754 ?auto_1753756 ) ) ( not ( = ?auto_1753754 ?auto_1753757 ) ) ( not ( = ?auto_1753754 ?auto_1753758 ) ) ( not ( = ?auto_1753755 ?auto_1753756 ) ) ( not ( = ?auto_1753755 ?auto_1753757 ) ) ( not ( = ?auto_1753755 ?auto_1753758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753756 ?auto_1753757 ?auto_1753758 )
      ( MAKE-13CRATE-VERIFY ?auto_1753745 ?auto_1753746 ?auto_1753747 ?auto_1753748 ?auto_1753749 ?auto_1753750 ?auto_1753751 ?auto_1753752 ?auto_1753753 ?auto_1753754 ?auto_1753755 ?auto_1753756 ?auto_1753757 ?auto_1753758 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1753914 - SURFACE
      ?auto_1753915 - SURFACE
      ?auto_1753916 - SURFACE
      ?auto_1753917 - SURFACE
      ?auto_1753918 - SURFACE
      ?auto_1753919 - SURFACE
      ?auto_1753920 - SURFACE
      ?auto_1753921 - SURFACE
      ?auto_1753922 - SURFACE
      ?auto_1753923 - SURFACE
      ?auto_1753924 - SURFACE
      ?auto_1753925 - SURFACE
      ?auto_1753926 - SURFACE
      ?auto_1753927 - SURFACE
    )
    :vars
    (
      ?auto_1753929 - HOIST
      ?auto_1753932 - PLACE
      ?auto_1753931 - TRUCK
      ?auto_1753928 - PLACE
      ?auto_1753930 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753929 ?auto_1753932 ) ( SURFACE-AT ?auto_1753926 ?auto_1753932 ) ( CLEAR ?auto_1753926 ) ( IS-CRATE ?auto_1753927 ) ( not ( = ?auto_1753926 ?auto_1753927 ) ) ( AVAILABLE ?auto_1753929 ) ( ON ?auto_1753926 ?auto_1753925 ) ( not ( = ?auto_1753925 ?auto_1753926 ) ) ( not ( = ?auto_1753925 ?auto_1753927 ) ) ( TRUCK-AT ?auto_1753931 ?auto_1753928 ) ( not ( = ?auto_1753928 ?auto_1753932 ) ) ( HOIST-AT ?auto_1753930 ?auto_1753928 ) ( LIFTING ?auto_1753930 ?auto_1753927 ) ( not ( = ?auto_1753929 ?auto_1753930 ) ) ( ON ?auto_1753915 ?auto_1753914 ) ( ON ?auto_1753916 ?auto_1753915 ) ( ON ?auto_1753917 ?auto_1753916 ) ( ON ?auto_1753918 ?auto_1753917 ) ( ON ?auto_1753919 ?auto_1753918 ) ( ON ?auto_1753920 ?auto_1753919 ) ( ON ?auto_1753921 ?auto_1753920 ) ( ON ?auto_1753922 ?auto_1753921 ) ( ON ?auto_1753923 ?auto_1753922 ) ( ON ?auto_1753924 ?auto_1753923 ) ( ON ?auto_1753925 ?auto_1753924 ) ( not ( = ?auto_1753914 ?auto_1753915 ) ) ( not ( = ?auto_1753914 ?auto_1753916 ) ) ( not ( = ?auto_1753914 ?auto_1753917 ) ) ( not ( = ?auto_1753914 ?auto_1753918 ) ) ( not ( = ?auto_1753914 ?auto_1753919 ) ) ( not ( = ?auto_1753914 ?auto_1753920 ) ) ( not ( = ?auto_1753914 ?auto_1753921 ) ) ( not ( = ?auto_1753914 ?auto_1753922 ) ) ( not ( = ?auto_1753914 ?auto_1753923 ) ) ( not ( = ?auto_1753914 ?auto_1753924 ) ) ( not ( = ?auto_1753914 ?auto_1753925 ) ) ( not ( = ?auto_1753914 ?auto_1753926 ) ) ( not ( = ?auto_1753914 ?auto_1753927 ) ) ( not ( = ?auto_1753915 ?auto_1753916 ) ) ( not ( = ?auto_1753915 ?auto_1753917 ) ) ( not ( = ?auto_1753915 ?auto_1753918 ) ) ( not ( = ?auto_1753915 ?auto_1753919 ) ) ( not ( = ?auto_1753915 ?auto_1753920 ) ) ( not ( = ?auto_1753915 ?auto_1753921 ) ) ( not ( = ?auto_1753915 ?auto_1753922 ) ) ( not ( = ?auto_1753915 ?auto_1753923 ) ) ( not ( = ?auto_1753915 ?auto_1753924 ) ) ( not ( = ?auto_1753915 ?auto_1753925 ) ) ( not ( = ?auto_1753915 ?auto_1753926 ) ) ( not ( = ?auto_1753915 ?auto_1753927 ) ) ( not ( = ?auto_1753916 ?auto_1753917 ) ) ( not ( = ?auto_1753916 ?auto_1753918 ) ) ( not ( = ?auto_1753916 ?auto_1753919 ) ) ( not ( = ?auto_1753916 ?auto_1753920 ) ) ( not ( = ?auto_1753916 ?auto_1753921 ) ) ( not ( = ?auto_1753916 ?auto_1753922 ) ) ( not ( = ?auto_1753916 ?auto_1753923 ) ) ( not ( = ?auto_1753916 ?auto_1753924 ) ) ( not ( = ?auto_1753916 ?auto_1753925 ) ) ( not ( = ?auto_1753916 ?auto_1753926 ) ) ( not ( = ?auto_1753916 ?auto_1753927 ) ) ( not ( = ?auto_1753917 ?auto_1753918 ) ) ( not ( = ?auto_1753917 ?auto_1753919 ) ) ( not ( = ?auto_1753917 ?auto_1753920 ) ) ( not ( = ?auto_1753917 ?auto_1753921 ) ) ( not ( = ?auto_1753917 ?auto_1753922 ) ) ( not ( = ?auto_1753917 ?auto_1753923 ) ) ( not ( = ?auto_1753917 ?auto_1753924 ) ) ( not ( = ?auto_1753917 ?auto_1753925 ) ) ( not ( = ?auto_1753917 ?auto_1753926 ) ) ( not ( = ?auto_1753917 ?auto_1753927 ) ) ( not ( = ?auto_1753918 ?auto_1753919 ) ) ( not ( = ?auto_1753918 ?auto_1753920 ) ) ( not ( = ?auto_1753918 ?auto_1753921 ) ) ( not ( = ?auto_1753918 ?auto_1753922 ) ) ( not ( = ?auto_1753918 ?auto_1753923 ) ) ( not ( = ?auto_1753918 ?auto_1753924 ) ) ( not ( = ?auto_1753918 ?auto_1753925 ) ) ( not ( = ?auto_1753918 ?auto_1753926 ) ) ( not ( = ?auto_1753918 ?auto_1753927 ) ) ( not ( = ?auto_1753919 ?auto_1753920 ) ) ( not ( = ?auto_1753919 ?auto_1753921 ) ) ( not ( = ?auto_1753919 ?auto_1753922 ) ) ( not ( = ?auto_1753919 ?auto_1753923 ) ) ( not ( = ?auto_1753919 ?auto_1753924 ) ) ( not ( = ?auto_1753919 ?auto_1753925 ) ) ( not ( = ?auto_1753919 ?auto_1753926 ) ) ( not ( = ?auto_1753919 ?auto_1753927 ) ) ( not ( = ?auto_1753920 ?auto_1753921 ) ) ( not ( = ?auto_1753920 ?auto_1753922 ) ) ( not ( = ?auto_1753920 ?auto_1753923 ) ) ( not ( = ?auto_1753920 ?auto_1753924 ) ) ( not ( = ?auto_1753920 ?auto_1753925 ) ) ( not ( = ?auto_1753920 ?auto_1753926 ) ) ( not ( = ?auto_1753920 ?auto_1753927 ) ) ( not ( = ?auto_1753921 ?auto_1753922 ) ) ( not ( = ?auto_1753921 ?auto_1753923 ) ) ( not ( = ?auto_1753921 ?auto_1753924 ) ) ( not ( = ?auto_1753921 ?auto_1753925 ) ) ( not ( = ?auto_1753921 ?auto_1753926 ) ) ( not ( = ?auto_1753921 ?auto_1753927 ) ) ( not ( = ?auto_1753922 ?auto_1753923 ) ) ( not ( = ?auto_1753922 ?auto_1753924 ) ) ( not ( = ?auto_1753922 ?auto_1753925 ) ) ( not ( = ?auto_1753922 ?auto_1753926 ) ) ( not ( = ?auto_1753922 ?auto_1753927 ) ) ( not ( = ?auto_1753923 ?auto_1753924 ) ) ( not ( = ?auto_1753923 ?auto_1753925 ) ) ( not ( = ?auto_1753923 ?auto_1753926 ) ) ( not ( = ?auto_1753923 ?auto_1753927 ) ) ( not ( = ?auto_1753924 ?auto_1753925 ) ) ( not ( = ?auto_1753924 ?auto_1753926 ) ) ( not ( = ?auto_1753924 ?auto_1753927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1753925 ?auto_1753926 ?auto_1753927 )
      ( MAKE-13CRATE-VERIFY ?auto_1753914 ?auto_1753915 ?auto_1753916 ?auto_1753917 ?auto_1753918 ?auto_1753919 ?auto_1753920 ?auto_1753921 ?auto_1753922 ?auto_1753923 ?auto_1753924 ?auto_1753925 ?auto_1753926 ?auto_1753927 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754096 - SURFACE
      ?auto_1754097 - SURFACE
      ?auto_1754098 - SURFACE
      ?auto_1754099 - SURFACE
      ?auto_1754100 - SURFACE
      ?auto_1754101 - SURFACE
      ?auto_1754102 - SURFACE
      ?auto_1754103 - SURFACE
      ?auto_1754104 - SURFACE
      ?auto_1754105 - SURFACE
      ?auto_1754106 - SURFACE
      ?auto_1754107 - SURFACE
      ?auto_1754108 - SURFACE
      ?auto_1754109 - SURFACE
    )
    :vars
    (
      ?auto_1754110 - HOIST
      ?auto_1754113 - PLACE
      ?auto_1754112 - TRUCK
      ?auto_1754115 - PLACE
      ?auto_1754111 - HOIST
      ?auto_1754114 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754110 ?auto_1754113 ) ( SURFACE-AT ?auto_1754108 ?auto_1754113 ) ( CLEAR ?auto_1754108 ) ( IS-CRATE ?auto_1754109 ) ( not ( = ?auto_1754108 ?auto_1754109 ) ) ( AVAILABLE ?auto_1754110 ) ( ON ?auto_1754108 ?auto_1754107 ) ( not ( = ?auto_1754107 ?auto_1754108 ) ) ( not ( = ?auto_1754107 ?auto_1754109 ) ) ( TRUCK-AT ?auto_1754112 ?auto_1754115 ) ( not ( = ?auto_1754115 ?auto_1754113 ) ) ( HOIST-AT ?auto_1754111 ?auto_1754115 ) ( not ( = ?auto_1754110 ?auto_1754111 ) ) ( AVAILABLE ?auto_1754111 ) ( SURFACE-AT ?auto_1754109 ?auto_1754115 ) ( ON ?auto_1754109 ?auto_1754114 ) ( CLEAR ?auto_1754109 ) ( not ( = ?auto_1754108 ?auto_1754114 ) ) ( not ( = ?auto_1754109 ?auto_1754114 ) ) ( not ( = ?auto_1754107 ?auto_1754114 ) ) ( ON ?auto_1754097 ?auto_1754096 ) ( ON ?auto_1754098 ?auto_1754097 ) ( ON ?auto_1754099 ?auto_1754098 ) ( ON ?auto_1754100 ?auto_1754099 ) ( ON ?auto_1754101 ?auto_1754100 ) ( ON ?auto_1754102 ?auto_1754101 ) ( ON ?auto_1754103 ?auto_1754102 ) ( ON ?auto_1754104 ?auto_1754103 ) ( ON ?auto_1754105 ?auto_1754104 ) ( ON ?auto_1754106 ?auto_1754105 ) ( ON ?auto_1754107 ?auto_1754106 ) ( not ( = ?auto_1754096 ?auto_1754097 ) ) ( not ( = ?auto_1754096 ?auto_1754098 ) ) ( not ( = ?auto_1754096 ?auto_1754099 ) ) ( not ( = ?auto_1754096 ?auto_1754100 ) ) ( not ( = ?auto_1754096 ?auto_1754101 ) ) ( not ( = ?auto_1754096 ?auto_1754102 ) ) ( not ( = ?auto_1754096 ?auto_1754103 ) ) ( not ( = ?auto_1754096 ?auto_1754104 ) ) ( not ( = ?auto_1754096 ?auto_1754105 ) ) ( not ( = ?auto_1754096 ?auto_1754106 ) ) ( not ( = ?auto_1754096 ?auto_1754107 ) ) ( not ( = ?auto_1754096 ?auto_1754108 ) ) ( not ( = ?auto_1754096 ?auto_1754109 ) ) ( not ( = ?auto_1754096 ?auto_1754114 ) ) ( not ( = ?auto_1754097 ?auto_1754098 ) ) ( not ( = ?auto_1754097 ?auto_1754099 ) ) ( not ( = ?auto_1754097 ?auto_1754100 ) ) ( not ( = ?auto_1754097 ?auto_1754101 ) ) ( not ( = ?auto_1754097 ?auto_1754102 ) ) ( not ( = ?auto_1754097 ?auto_1754103 ) ) ( not ( = ?auto_1754097 ?auto_1754104 ) ) ( not ( = ?auto_1754097 ?auto_1754105 ) ) ( not ( = ?auto_1754097 ?auto_1754106 ) ) ( not ( = ?auto_1754097 ?auto_1754107 ) ) ( not ( = ?auto_1754097 ?auto_1754108 ) ) ( not ( = ?auto_1754097 ?auto_1754109 ) ) ( not ( = ?auto_1754097 ?auto_1754114 ) ) ( not ( = ?auto_1754098 ?auto_1754099 ) ) ( not ( = ?auto_1754098 ?auto_1754100 ) ) ( not ( = ?auto_1754098 ?auto_1754101 ) ) ( not ( = ?auto_1754098 ?auto_1754102 ) ) ( not ( = ?auto_1754098 ?auto_1754103 ) ) ( not ( = ?auto_1754098 ?auto_1754104 ) ) ( not ( = ?auto_1754098 ?auto_1754105 ) ) ( not ( = ?auto_1754098 ?auto_1754106 ) ) ( not ( = ?auto_1754098 ?auto_1754107 ) ) ( not ( = ?auto_1754098 ?auto_1754108 ) ) ( not ( = ?auto_1754098 ?auto_1754109 ) ) ( not ( = ?auto_1754098 ?auto_1754114 ) ) ( not ( = ?auto_1754099 ?auto_1754100 ) ) ( not ( = ?auto_1754099 ?auto_1754101 ) ) ( not ( = ?auto_1754099 ?auto_1754102 ) ) ( not ( = ?auto_1754099 ?auto_1754103 ) ) ( not ( = ?auto_1754099 ?auto_1754104 ) ) ( not ( = ?auto_1754099 ?auto_1754105 ) ) ( not ( = ?auto_1754099 ?auto_1754106 ) ) ( not ( = ?auto_1754099 ?auto_1754107 ) ) ( not ( = ?auto_1754099 ?auto_1754108 ) ) ( not ( = ?auto_1754099 ?auto_1754109 ) ) ( not ( = ?auto_1754099 ?auto_1754114 ) ) ( not ( = ?auto_1754100 ?auto_1754101 ) ) ( not ( = ?auto_1754100 ?auto_1754102 ) ) ( not ( = ?auto_1754100 ?auto_1754103 ) ) ( not ( = ?auto_1754100 ?auto_1754104 ) ) ( not ( = ?auto_1754100 ?auto_1754105 ) ) ( not ( = ?auto_1754100 ?auto_1754106 ) ) ( not ( = ?auto_1754100 ?auto_1754107 ) ) ( not ( = ?auto_1754100 ?auto_1754108 ) ) ( not ( = ?auto_1754100 ?auto_1754109 ) ) ( not ( = ?auto_1754100 ?auto_1754114 ) ) ( not ( = ?auto_1754101 ?auto_1754102 ) ) ( not ( = ?auto_1754101 ?auto_1754103 ) ) ( not ( = ?auto_1754101 ?auto_1754104 ) ) ( not ( = ?auto_1754101 ?auto_1754105 ) ) ( not ( = ?auto_1754101 ?auto_1754106 ) ) ( not ( = ?auto_1754101 ?auto_1754107 ) ) ( not ( = ?auto_1754101 ?auto_1754108 ) ) ( not ( = ?auto_1754101 ?auto_1754109 ) ) ( not ( = ?auto_1754101 ?auto_1754114 ) ) ( not ( = ?auto_1754102 ?auto_1754103 ) ) ( not ( = ?auto_1754102 ?auto_1754104 ) ) ( not ( = ?auto_1754102 ?auto_1754105 ) ) ( not ( = ?auto_1754102 ?auto_1754106 ) ) ( not ( = ?auto_1754102 ?auto_1754107 ) ) ( not ( = ?auto_1754102 ?auto_1754108 ) ) ( not ( = ?auto_1754102 ?auto_1754109 ) ) ( not ( = ?auto_1754102 ?auto_1754114 ) ) ( not ( = ?auto_1754103 ?auto_1754104 ) ) ( not ( = ?auto_1754103 ?auto_1754105 ) ) ( not ( = ?auto_1754103 ?auto_1754106 ) ) ( not ( = ?auto_1754103 ?auto_1754107 ) ) ( not ( = ?auto_1754103 ?auto_1754108 ) ) ( not ( = ?auto_1754103 ?auto_1754109 ) ) ( not ( = ?auto_1754103 ?auto_1754114 ) ) ( not ( = ?auto_1754104 ?auto_1754105 ) ) ( not ( = ?auto_1754104 ?auto_1754106 ) ) ( not ( = ?auto_1754104 ?auto_1754107 ) ) ( not ( = ?auto_1754104 ?auto_1754108 ) ) ( not ( = ?auto_1754104 ?auto_1754109 ) ) ( not ( = ?auto_1754104 ?auto_1754114 ) ) ( not ( = ?auto_1754105 ?auto_1754106 ) ) ( not ( = ?auto_1754105 ?auto_1754107 ) ) ( not ( = ?auto_1754105 ?auto_1754108 ) ) ( not ( = ?auto_1754105 ?auto_1754109 ) ) ( not ( = ?auto_1754105 ?auto_1754114 ) ) ( not ( = ?auto_1754106 ?auto_1754107 ) ) ( not ( = ?auto_1754106 ?auto_1754108 ) ) ( not ( = ?auto_1754106 ?auto_1754109 ) ) ( not ( = ?auto_1754106 ?auto_1754114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754107 ?auto_1754108 ?auto_1754109 )
      ( MAKE-13CRATE-VERIFY ?auto_1754096 ?auto_1754097 ?auto_1754098 ?auto_1754099 ?auto_1754100 ?auto_1754101 ?auto_1754102 ?auto_1754103 ?auto_1754104 ?auto_1754105 ?auto_1754106 ?auto_1754107 ?auto_1754108 ?auto_1754109 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754279 - SURFACE
      ?auto_1754280 - SURFACE
      ?auto_1754281 - SURFACE
      ?auto_1754282 - SURFACE
      ?auto_1754283 - SURFACE
      ?auto_1754284 - SURFACE
      ?auto_1754285 - SURFACE
      ?auto_1754286 - SURFACE
      ?auto_1754287 - SURFACE
      ?auto_1754288 - SURFACE
      ?auto_1754289 - SURFACE
      ?auto_1754290 - SURFACE
      ?auto_1754291 - SURFACE
      ?auto_1754292 - SURFACE
    )
    :vars
    (
      ?auto_1754296 - HOIST
      ?auto_1754298 - PLACE
      ?auto_1754295 - PLACE
      ?auto_1754294 - HOIST
      ?auto_1754297 - SURFACE
      ?auto_1754293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754296 ?auto_1754298 ) ( SURFACE-AT ?auto_1754291 ?auto_1754298 ) ( CLEAR ?auto_1754291 ) ( IS-CRATE ?auto_1754292 ) ( not ( = ?auto_1754291 ?auto_1754292 ) ) ( AVAILABLE ?auto_1754296 ) ( ON ?auto_1754291 ?auto_1754290 ) ( not ( = ?auto_1754290 ?auto_1754291 ) ) ( not ( = ?auto_1754290 ?auto_1754292 ) ) ( not ( = ?auto_1754295 ?auto_1754298 ) ) ( HOIST-AT ?auto_1754294 ?auto_1754295 ) ( not ( = ?auto_1754296 ?auto_1754294 ) ) ( AVAILABLE ?auto_1754294 ) ( SURFACE-AT ?auto_1754292 ?auto_1754295 ) ( ON ?auto_1754292 ?auto_1754297 ) ( CLEAR ?auto_1754292 ) ( not ( = ?auto_1754291 ?auto_1754297 ) ) ( not ( = ?auto_1754292 ?auto_1754297 ) ) ( not ( = ?auto_1754290 ?auto_1754297 ) ) ( TRUCK-AT ?auto_1754293 ?auto_1754298 ) ( ON ?auto_1754280 ?auto_1754279 ) ( ON ?auto_1754281 ?auto_1754280 ) ( ON ?auto_1754282 ?auto_1754281 ) ( ON ?auto_1754283 ?auto_1754282 ) ( ON ?auto_1754284 ?auto_1754283 ) ( ON ?auto_1754285 ?auto_1754284 ) ( ON ?auto_1754286 ?auto_1754285 ) ( ON ?auto_1754287 ?auto_1754286 ) ( ON ?auto_1754288 ?auto_1754287 ) ( ON ?auto_1754289 ?auto_1754288 ) ( ON ?auto_1754290 ?auto_1754289 ) ( not ( = ?auto_1754279 ?auto_1754280 ) ) ( not ( = ?auto_1754279 ?auto_1754281 ) ) ( not ( = ?auto_1754279 ?auto_1754282 ) ) ( not ( = ?auto_1754279 ?auto_1754283 ) ) ( not ( = ?auto_1754279 ?auto_1754284 ) ) ( not ( = ?auto_1754279 ?auto_1754285 ) ) ( not ( = ?auto_1754279 ?auto_1754286 ) ) ( not ( = ?auto_1754279 ?auto_1754287 ) ) ( not ( = ?auto_1754279 ?auto_1754288 ) ) ( not ( = ?auto_1754279 ?auto_1754289 ) ) ( not ( = ?auto_1754279 ?auto_1754290 ) ) ( not ( = ?auto_1754279 ?auto_1754291 ) ) ( not ( = ?auto_1754279 ?auto_1754292 ) ) ( not ( = ?auto_1754279 ?auto_1754297 ) ) ( not ( = ?auto_1754280 ?auto_1754281 ) ) ( not ( = ?auto_1754280 ?auto_1754282 ) ) ( not ( = ?auto_1754280 ?auto_1754283 ) ) ( not ( = ?auto_1754280 ?auto_1754284 ) ) ( not ( = ?auto_1754280 ?auto_1754285 ) ) ( not ( = ?auto_1754280 ?auto_1754286 ) ) ( not ( = ?auto_1754280 ?auto_1754287 ) ) ( not ( = ?auto_1754280 ?auto_1754288 ) ) ( not ( = ?auto_1754280 ?auto_1754289 ) ) ( not ( = ?auto_1754280 ?auto_1754290 ) ) ( not ( = ?auto_1754280 ?auto_1754291 ) ) ( not ( = ?auto_1754280 ?auto_1754292 ) ) ( not ( = ?auto_1754280 ?auto_1754297 ) ) ( not ( = ?auto_1754281 ?auto_1754282 ) ) ( not ( = ?auto_1754281 ?auto_1754283 ) ) ( not ( = ?auto_1754281 ?auto_1754284 ) ) ( not ( = ?auto_1754281 ?auto_1754285 ) ) ( not ( = ?auto_1754281 ?auto_1754286 ) ) ( not ( = ?auto_1754281 ?auto_1754287 ) ) ( not ( = ?auto_1754281 ?auto_1754288 ) ) ( not ( = ?auto_1754281 ?auto_1754289 ) ) ( not ( = ?auto_1754281 ?auto_1754290 ) ) ( not ( = ?auto_1754281 ?auto_1754291 ) ) ( not ( = ?auto_1754281 ?auto_1754292 ) ) ( not ( = ?auto_1754281 ?auto_1754297 ) ) ( not ( = ?auto_1754282 ?auto_1754283 ) ) ( not ( = ?auto_1754282 ?auto_1754284 ) ) ( not ( = ?auto_1754282 ?auto_1754285 ) ) ( not ( = ?auto_1754282 ?auto_1754286 ) ) ( not ( = ?auto_1754282 ?auto_1754287 ) ) ( not ( = ?auto_1754282 ?auto_1754288 ) ) ( not ( = ?auto_1754282 ?auto_1754289 ) ) ( not ( = ?auto_1754282 ?auto_1754290 ) ) ( not ( = ?auto_1754282 ?auto_1754291 ) ) ( not ( = ?auto_1754282 ?auto_1754292 ) ) ( not ( = ?auto_1754282 ?auto_1754297 ) ) ( not ( = ?auto_1754283 ?auto_1754284 ) ) ( not ( = ?auto_1754283 ?auto_1754285 ) ) ( not ( = ?auto_1754283 ?auto_1754286 ) ) ( not ( = ?auto_1754283 ?auto_1754287 ) ) ( not ( = ?auto_1754283 ?auto_1754288 ) ) ( not ( = ?auto_1754283 ?auto_1754289 ) ) ( not ( = ?auto_1754283 ?auto_1754290 ) ) ( not ( = ?auto_1754283 ?auto_1754291 ) ) ( not ( = ?auto_1754283 ?auto_1754292 ) ) ( not ( = ?auto_1754283 ?auto_1754297 ) ) ( not ( = ?auto_1754284 ?auto_1754285 ) ) ( not ( = ?auto_1754284 ?auto_1754286 ) ) ( not ( = ?auto_1754284 ?auto_1754287 ) ) ( not ( = ?auto_1754284 ?auto_1754288 ) ) ( not ( = ?auto_1754284 ?auto_1754289 ) ) ( not ( = ?auto_1754284 ?auto_1754290 ) ) ( not ( = ?auto_1754284 ?auto_1754291 ) ) ( not ( = ?auto_1754284 ?auto_1754292 ) ) ( not ( = ?auto_1754284 ?auto_1754297 ) ) ( not ( = ?auto_1754285 ?auto_1754286 ) ) ( not ( = ?auto_1754285 ?auto_1754287 ) ) ( not ( = ?auto_1754285 ?auto_1754288 ) ) ( not ( = ?auto_1754285 ?auto_1754289 ) ) ( not ( = ?auto_1754285 ?auto_1754290 ) ) ( not ( = ?auto_1754285 ?auto_1754291 ) ) ( not ( = ?auto_1754285 ?auto_1754292 ) ) ( not ( = ?auto_1754285 ?auto_1754297 ) ) ( not ( = ?auto_1754286 ?auto_1754287 ) ) ( not ( = ?auto_1754286 ?auto_1754288 ) ) ( not ( = ?auto_1754286 ?auto_1754289 ) ) ( not ( = ?auto_1754286 ?auto_1754290 ) ) ( not ( = ?auto_1754286 ?auto_1754291 ) ) ( not ( = ?auto_1754286 ?auto_1754292 ) ) ( not ( = ?auto_1754286 ?auto_1754297 ) ) ( not ( = ?auto_1754287 ?auto_1754288 ) ) ( not ( = ?auto_1754287 ?auto_1754289 ) ) ( not ( = ?auto_1754287 ?auto_1754290 ) ) ( not ( = ?auto_1754287 ?auto_1754291 ) ) ( not ( = ?auto_1754287 ?auto_1754292 ) ) ( not ( = ?auto_1754287 ?auto_1754297 ) ) ( not ( = ?auto_1754288 ?auto_1754289 ) ) ( not ( = ?auto_1754288 ?auto_1754290 ) ) ( not ( = ?auto_1754288 ?auto_1754291 ) ) ( not ( = ?auto_1754288 ?auto_1754292 ) ) ( not ( = ?auto_1754288 ?auto_1754297 ) ) ( not ( = ?auto_1754289 ?auto_1754290 ) ) ( not ( = ?auto_1754289 ?auto_1754291 ) ) ( not ( = ?auto_1754289 ?auto_1754292 ) ) ( not ( = ?auto_1754289 ?auto_1754297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754290 ?auto_1754291 ?auto_1754292 )
      ( MAKE-13CRATE-VERIFY ?auto_1754279 ?auto_1754280 ?auto_1754281 ?auto_1754282 ?auto_1754283 ?auto_1754284 ?auto_1754285 ?auto_1754286 ?auto_1754287 ?auto_1754288 ?auto_1754289 ?auto_1754290 ?auto_1754291 ?auto_1754292 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754462 - SURFACE
      ?auto_1754463 - SURFACE
      ?auto_1754464 - SURFACE
      ?auto_1754465 - SURFACE
      ?auto_1754466 - SURFACE
      ?auto_1754467 - SURFACE
      ?auto_1754468 - SURFACE
      ?auto_1754469 - SURFACE
      ?auto_1754470 - SURFACE
      ?auto_1754471 - SURFACE
      ?auto_1754472 - SURFACE
      ?auto_1754473 - SURFACE
      ?auto_1754474 - SURFACE
      ?auto_1754475 - SURFACE
    )
    :vars
    (
      ?auto_1754476 - HOIST
      ?auto_1754479 - PLACE
      ?auto_1754478 - PLACE
      ?auto_1754477 - HOIST
      ?auto_1754480 - SURFACE
      ?auto_1754481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754476 ?auto_1754479 ) ( IS-CRATE ?auto_1754475 ) ( not ( = ?auto_1754474 ?auto_1754475 ) ) ( not ( = ?auto_1754473 ?auto_1754474 ) ) ( not ( = ?auto_1754473 ?auto_1754475 ) ) ( not ( = ?auto_1754478 ?auto_1754479 ) ) ( HOIST-AT ?auto_1754477 ?auto_1754478 ) ( not ( = ?auto_1754476 ?auto_1754477 ) ) ( AVAILABLE ?auto_1754477 ) ( SURFACE-AT ?auto_1754475 ?auto_1754478 ) ( ON ?auto_1754475 ?auto_1754480 ) ( CLEAR ?auto_1754475 ) ( not ( = ?auto_1754474 ?auto_1754480 ) ) ( not ( = ?auto_1754475 ?auto_1754480 ) ) ( not ( = ?auto_1754473 ?auto_1754480 ) ) ( TRUCK-AT ?auto_1754481 ?auto_1754479 ) ( SURFACE-AT ?auto_1754473 ?auto_1754479 ) ( CLEAR ?auto_1754473 ) ( LIFTING ?auto_1754476 ?auto_1754474 ) ( IS-CRATE ?auto_1754474 ) ( ON ?auto_1754463 ?auto_1754462 ) ( ON ?auto_1754464 ?auto_1754463 ) ( ON ?auto_1754465 ?auto_1754464 ) ( ON ?auto_1754466 ?auto_1754465 ) ( ON ?auto_1754467 ?auto_1754466 ) ( ON ?auto_1754468 ?auto_1754467 ) ( ON ?auto_1754469 ?auto_1754468 ) ( ON ?auto_1754470 ?auto_1754469 ) ( ON ?auto_1754471 ?auto_1754470 ) ( ON ?auto_1754472 ?auto_1754471 ) ( ON ?auto_1754473 ?auto_1754472 ) ( not ( = ?auto_1754462 ?auto_1754463 ) ) ( not ( = ?auto_1754462 ?auto_1754464 ) ) ( not ( = ?auto_1754462 ?auto_1754465 ) ) ( not ( = ?auto_1754462 ?auto_1754466 ) ) ( not ( = ?auto_1754462 ?auto_1754467 ) ) ( not ( = ?auto_1754462 ?auto_1754468 ) ) ( not ( = ?auto_1754462 ?auto_1754469 ) ) ( not ( = ?auto_1754462 ?auto_1754470 ) ) ( not ( = ?auto_1754462 ?auto_1754471 ) ) ( not ( = ?auto_1754462 ?auto_1754472 ) ) ( not ( = ?auto_1754462 ?auto_1754473 ) ) ( not ( = ?auto_1754462 ?auto_1754474 ) ) ( not ( = ?auto_1754462 ?auto_1754475 ) ) ( not ( = ?auto_1754462 ?auto_1754480 ) ) ( not ( = ?auto_1754463 ?auto_1754464 ) ) ( not ( = ?auto_1754463 ?auto_1754465 ) ) ( not ( = ?auto_1754463 ?auto_1754466 ) ) ( not ( = ?auto_1754463 ?auto_1754467 ) ) ( not ( = ?auto_1754463 ?auto_1754468 ) ) ( not ( = ?auto_1754463 ?auto_1754469 ) ) ( not ( = ?auto_1754463 ?auto_1754470 ) ) ( not ( = ?auto_1754463 ?auto_1754471 ) ) ( not ( = ?auto_1754463 ?auto_1754472 ) ) ( not ( = ?auto_1754463 ?auto_1754473 ) ) ( not ( = ?auto_1754463 ?auto_1754474 ) ) ( not ( = ?auto_1754463 ?auto_1754475 ) ) ( not ( = ?auto_1754463 ?auto_1754480 ) ) ( not ( = ?auto_1754464 ?auto_1754465 ) ) ( not ( = ?auto_1754464 ?auto_1754466 ) ) ( not ( = ?auto_1754464 ?auto_1754467 ) ) ( not ( = ?auto_1754464 ?auto_1754468 ) ) ( not ( = ?auto_1754464 ?auto_1754469 ) ) ( not ( = ?auto_1754464 ?auto_1754470 ) ) ( not ( = ?auto_1754464 ?auto_1754471 ) ) ( not ( = ?auto_1754464 ?auto_1754472 ) ) ( not ( = ?auto_1754464 ?auto_1754473 ) ) ( not ( = ?auto_1754464 ?auto_1754474 ) ) ( not ( = ?auto_1754464 ?auto_1754475 ) ) ( not ( = ?auto_1754464 ?auto_1754480 ) ) ( not ( = ?auto_1754465 ?auto_1754466 ) ) ( not ( = ?auto_1754465 ?auto_1754467 ) ) ( not ( = ?auto_1754465 ?auto_1754468 ) ) ( not ( = ?auto_1754465 ?auto_1754469 ) ) ( not ( = ?auto_1754465 ?auto_1754470 ) ) ( not ( = ?auto_1754465 ?auto_1754471 ) ) ( not ( = ?auto_1754465 ?auto_1754472 ) ) ( not ( = ?auto_1754465 ?auto_1754473 ) ) ( not ( = ?auto_1754465 ?auto_1754474 ) ) ( not ( = ?auto_1754465 ?auto_1754475 ) ) ( not ( = ?auto_1754465 ?auto_1754480 ) ) ( not ( = ?auto_1754466 ?auto_1754467 ) ) ( not ( = ?auto_1754466 ?auto_1754468 ) ) ( not ( = ?auto_1754466 ?auto_1754469 ) ) ( not ( = ?auto_1754466 ?auto_1754470 ) ) ( not ( = ?auto_1754466 ?auto_1754471 ) ) ( not ( = ?auto_1754466 ?auto_1754472 ) ) ( not ( = ?auto_1754466 ?auto_1754473 ) ) ( not ( = ?auto_1754466 ?auto_1754474 ) ) ( not ( = ?auto_1754466 ?auto_1754475 ) ) ( not ( = ?auto_1754466 ?auto_1754480 ) ) ( not ( = ?auto_1754467 ?auto_1754468 ) ) ( not ( = ?auto_1754467 ?auto_1754469 ) ) ( not ( = ?auto_1754467 ?auto_1754470 ) ) ( not ( = ?auto_1754467 ?auto_1754471 ) ) ( not ( = ?auto_1754467 ?auto_1754472 ) ) ( not ( = ?auto_1754467 ?auto_1754473 ) ) ( not ( = ?auto_1754467 ?auto_1754474 ) ) ( not ( = ?auto_1754467 ?auto_1754475 ) ) ( not ( = ?auto_1754467 ?auto_1754480 ) ) ( not ( = ?auto_1754468 ?auto_1754469 ) ) ( not ( = ?auto_1754468 ?auto_1754470 ) ) ( not ( = ?auto_1754468 ?auto_1754471 ) ) ( not ( = ?auto_1754468 ?auto_1754472 ) ) ( not ( = ?auto_1754468 ?auto_1754473 ) ) ( not ( = ?auto_1754468 ?auto_1754474 ) ) ( not ( = ?auto_1754468 ?auto_1754475 ) ) ( not ( = ?auto_1754468 ?auto_1754480 ) ) ( not ( = ?auto_1754469 ?auto_1754470 ) ) ( not ( = ?auto_1754469 ?auto_1754471 ) ) ( not ( = ?auto_1754469 ?auto_1754472 ) ) ( not ( = ?auto_1754469 ?auto_1754473 ) ) ( not ( = ?auto_1754469 ?auto_1754474 ) ) ( not ( = ?auto_1754469 ?auto_1754475 ) ) ( not ( = ?auto_1754469 ?auto_1754480 ) ) ( not ( = ?auto_1754470 ?auto_1754471 ) ) ( not ( = ?auto_1754470 ?auto_1754472 ) ) ( not ( = ?auto_1754470 ?auto_1754473 ) ) ( not ( = ?auto_1754470 ?auto_1754474 ) ) ( not ( = ?auto_1754470 ?auto_1754475 ) ) ( not ( = ?auto_1754470 ?auto_1754480 ) ) ( not ( = ?auto_1754471 ?auto_1754472 ) ) ( not ( = ?auto_1754471 ?auto_1754473 ) ) ( not ( = ?auto_1754471 ?auto_1754474 ) ) ( not ( = ?auto_1754471 ?auto_1754475 ) ) ( not ( = ?auto_1754471 ?auto_1754480 ) ) ( not ( = ?auto_1754472 ?auto_1754473 ) ) ( not ( = ?auto_1754472 ?auto_1754474 ) ) ( not ( = ?auto_1754472 ?auto_1754475 ) ) ( not ( = ?auto_1754472 ?auto_1754480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754473 ?auto_1754474 ?auto_1754475 )
      ( MAKE-13CRATE-VERIFY ?auto_1754462 ?auto_1754463 ?auto_1754464 ?auto_1754465 ?auto_1754466 ?auto_1754467 ?auto_1754468 ?auto_1754469 ?auto_1754470 ?auto_1754471 ?auto_1754472 ?auto_1754473 ?auto_1754474 ?auto_1754475 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1754645 - SURFACE
      ?auto_1754646 - SURFACE
      ?auto_1754647 - SURFACE
      ?auto_1754648 - SURFACE
      ?auto_1754649 - SURFACE
      ?auto_1754650 - SURFACE
      ?auto_1754651 - SURFACE
      ?auto_1754652 - SURFACE
      ?auto_1754653 - SURFACE
      ?auto_1754654 - SURFACE
      ?auto_1754655 - SURFACE
      ?auto_1754656 - SURFACE
      ?auto_1754657 - SURFACE
      ?auto_1754658 - SURFACE
    )
    :vars
    (
      ?auto_1754660 - HOIST
      ?auto_1754662 - PLACE
      ?auto_1754663 - PLACE
      ?auto_1754664 - HOIST
      ?auto_1754659 - SURFACE
      ?auto_1754661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754660 ?auto_1754662 ) ( IS-CRATE ?auto_1754658 ) ( not ( = ?auto_1754657 ?auto_1754658 ) ) ( not ( = ?auto_1754656 ?auto_1754657 ) ) ( not ( = ?auto_1754656 ?auto_1754658 ) ) ( not ( = ?auto_1754663 ?auto_1754662 ) ) ( HOIST-AT ?auto_1754664 ?auto_1754663 ) ( not ( = ?auto_1754660 ?auto_1754664 ) ) ( AVAILABLE ?auto_1754664 ) ( SURFACE-AT ?auto_1754658 ?auto_1754663 ) ( ON ?auto_1754658 ?auto_1754659 ) ( CLEAR ?auto_1754658 ) ( not ( = ?auto_1754657 ?auto_1754659 ) ) ( not ( = ?auto_1754658 ?auto_1754659 ) ) ( not ( = ?auto_1754656 ?auto_1754659 ) ) ( TRUCK-AT ?auto_1754661 ?auto_1754662 ) ( SURFACE-AT ?auto_1754656 ?auto_1754662 ) ( CLEAR ?auto_1754656 ) ( IS-CRATE ?auto_1754657 ) ( AVAILABLE ?auto_1754660 ) ( IN ?auto_1754657 ?auto_1754661 ) ( ON ?auto_1754646 ?auto_1754645 ) ( ON ?auto_1754647 ?auto_1754646 ) ( ON ?auto_1754648 ?auto_1754647 ) ( ON ?auto_1754649 ?auto_1754648 ) ( ON ?auto_1754650 ?auto_1754649 ) ( ON ?auto_1754651 ?auto_1754650 ) ( ON ?auto_1754652 ?auto_1754651 ) ( ON ?auto_1754653 ?auto_1754652 ) ( ON ?auto_1754654 ?auto_1754653 ) ( ON ?auto_1754655 ?auto_1754654 ) ( ON ?auto_1754656 ?auto_1754655 ) ( not ( = ?auto_1754645 ?auto_1754646 ) ) ( not ( = ?auto_1754645 ?auto_1754647 ) ) ( not ( = ?auto_1754645 ?auto_1754648 ) ) ( not ( = ?auto_1754645 ?auto_1754649 ) ) ( not ( = ?auto_1754645 ?auto_1754650 ) ) ( not ( = ?auto_1754645 ?auto_1754651 ) ) ( not ( = ?auto_1754645 ?auto_1754652 ) ) ( not ( = ?auto_1754645 ?auto_1754653 ) ) ( not ( = ?auto_1754645 ?auto_1754654 ) ) ( not ( = ?auto_1754645 ?auto_1754655 ) ) ( not ( = ?auto_1754645 ?auto_1754656 ) ) ( not ( = ?auto_1754645 ?auto_1754657 ) ) ( not ( = ?auto_1754645 ?auto_1754658 ) ) ( not ( = ?auto_1754645 ?auto_1754659 ) ) ( not ( = ?auto_1754646 ?auto_1754647 ) ) ( not ( = ?auto_1754646 ?auto_1754648 ) ) ( not ( = ?auto_1754646 ?auto_1754649 ) ) ( not ( = ?auto_1754646 ?auto_1754650 ) ) ( not ( = ?auto_1754646 ?auto_1754651 ) ) ( not ( = ?auto_1754646 ?auto_1754652 ) ) ( not ( = ?auto_1754646 ?auto_1754653 ) ) ( not ( = ?auto_1754646 ?auto_1754654 ) ) ( not ( = ?auto_1754646 ?auto_1754655 ) ) ( not ( = ?auto_1754646 ?auto_1754656 ) ) ( not ( = ?auto_1754646 ?auto_1754657 ) ) ( not ( = ?auto_1754646 ?auto_1754658 ) ) ( not ( = ?auto_1754646 ?auto_1754659 ) ) ( not ( = ?auto_1754647 ?auto_1754648 ) ) ( not ( = ?auto_1754647 ?auto_1754649 ) ) ( not ( = ?auto_1754647 ?auto_1754650 ) ) ( not ( = ?auto_1754647 ?auto_1754651 ) ) ( not ( = ?auto_1754647 ?auto_1754652 ) ) ( not ( = ?auto_1754647 ?auto_1754653 ) ) ( not ( = ?auto_1754647 ?auto_1754654 ) ) ( not ( = ?auto_1754647 ?auto_1754655 ) ) ( not ( = ?auto_1754647 ?auto_1754656 ) ) ( not ( = ?auto_1754647 ?auto_1754657 ) ) ( not ( = ?auto_1754647 ?auto_1754658 ) ) ( not ( = ?auto_1754647 ?auto_1754659 ) ) ( not ( = ?auto_1754648 ?auto_1754649 ) ) ( not ( = ?auto_1754648 ?auto_1754650 ) ) ( not ( = ?auto_1754648 ?auto_1754651 ) ) ( not ( = ?auto_1754648 ?auto_1754652 ) ) ( not ( = ?auto_1754648 ?auto_1754653 ) ) ( not ( = ?auto_1754648 ?auto_1754654 ) ) ( not ( = ?auto_1754648 ?auto_1754655 ) ) ( not ( = ?auto_1754648 ?auto_1754656 ) ) ( not ( = ?auto_1754648 ?auto_1754657 ) ) ( not ( = ?auto_1754648 ?auto_1754658 ) ) ( not ( = ?auto_1754648 ?auto_1754659 ) ) ( not ( = ?auto_1754649 ?auto_1754650 ) ) ( not ( = ?auto_1754649 ?auto_1754651 ) ) ( not ( = ?auto_1754649 ?auto_1754652 ) ) ( not ( = ?auto_1754649 ?auto_1754653 ) ) ( not ( = ?auto_1754649 ?auto_1754654 ) ) ( not ( = ?auto_1754649 ?auto_1754655 ) ) ( not ( = ?auto_1754649 ?auto_1754656 ) ) ( not ( = ?auto_1754649 ?auto_1754657 ) ) ( not ( = ?auto_1754649 ?auto_1754658 ) ) ( not ( = ?auto_1754649 ?auto_1754659 ) ) ( not ( = ?auto_1754650 ?auto_1754651 ) ) ( not ( = ?auto_1754650 ?auto_1754652 ) ) ( not ( = ?auto_1754650 ?auto_1754653 ) ) ( not ( = ?auto_1754650 ?auto_1754654 ) ) ( not ( = ?auto_1754650 ?auto_1754655 ) ) ( not ( = ?auto_1754650 ?auto_1754656 ) ) ( not ( = ?auto_1754650 ?auto_1754657 ) ) ( not ( = ?auto_1754650 ?auto_1754658 ) ) ( not ( = ?auto_1754650 ?auto_1754659 ) ) ( not ( = ?auto_1754651 ?auto_1754652 ) ) ( not ( = ?auto_1754651 ?auto_1754653 ) ) ( not ( = ?auto_1754651 ?auto_1754654 ) ) ( not ( = ?auto_1754651 ?auto_1754655 ) ) ( not ( = ?auto_1754651 ?auto_1754656 ) ) ( not ( = ?auto_1754651 ?auto_1754657 ) ) ( not ( = ?auto_1754651 ?auto_1754658 ) ) ( not ( = ?auto_1754651 ?auto_1754659 ) ) ( not ( = ?auto_1754652 ?auto_1754653 ) ) ( not ( = ?auto_1754652 ?auto_1754654 ) ) ( not ( = ?auto_1754652 ?auto_1754655 ) ) ( not ( = ?auto_1754652 ?auto_1754656 ) ) ( not ( = ?auto_1754652 ?auto_1754657 ) ) ( not ( = ?auto_1754652 ?auto_1754658 ) ) ( not ( = ?auto_1754652 ?auto_1754659 ) ) ( not ( = ?auto_1754653 ?auto_1754654 ) ) ( not ( = ?auto_1754653 ?auto_1754655 ) ) ( not ( = ?auto_1754653 ?auto_1754656 ) ) ( not ( = ?auto_1754653 ?auto_1754657 ) ) ( not ( = ?auto_1754653 ?auto_1754658 ) ) ( not ( = ?auto_1754653 ?auto_1754659 ) ) ( not ( = ?auto_1754654 ?auto_1754655 ) ) ( not ( = ?auto_1754654 ?auto_1754656 ) ) ( not ( = ?auto_1754654 ?auto_1754657 ) ) ( not ( = ?auto_1754654 ?auto_1754658 ) ) ( not ( = ?auto_1754654 ?auto_1754659 ) ) ( not ( = ?auto_1754655 ?auto_1754656 ) ) ( not ( = ?auto_1754655 ?auto_1754657 ) ) ( not ( = ?auto_1754655 ?auto_1754658 ) ) ( not ( = ?auto_1754655 ?auto_1754659 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1754656 ?auto_1754657 ?auto_1754658 )
      ( MAKE-13CRATE-VERIFY ?auto_1754645 ?auto_1754646 ?auto_1754647 ?auto_1754648 ?auto_1754649 ?auto_1754650 ?auto_1754651 ?auto_1754652 ?auto_1754653 ?auto_1754654 ?auto_1754655 ?auto_1754656 ?auto_1754657 ?auto_1754658 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1768792 - SURFACE
      ?auto_1768793 - SURFACE
      ?auto_1768794 - SURFACE
      ?auto_1768795 - SURFACE
      ?auto_1768796 - SURFACE
      ?auto_1768797 - SURFACE
      ?auto_1768798 - SURFACE
      ?auto_1768799 - SURFACE
      ?auto_1768800 - SURFACE
      ?auto_1768801 - SURFACE
      ?auto_1768802 - SURFACE
      ?auto_1768803 - SURFACE
      ?auto_1768804 - SURFACE
      ?auto_1768805 - SURFACE
      ?auto_1768806 - SURFACE
    )
    :vars
    (
      ?auto_1768807 - HOIST
      ?auto_1768808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1768807 ?auto_1768808 ) ( SURFACE-AT ?auto_1768805 ?auto_1768808 ) ( CLEAR ?auto_1768805 ) ( LIFTING ?auto_1768807 ?auto_1768806 ) ( IS-CRATE ?auto_1768806 ) ( not ( = ?auto_1768805 ?auto_1768806 ) ) ( ON ?auto_1768793 ?auto_1768792 ) ( ON ?auto_1768794 ?auto_1768793 ) ( ON ?auto_1768795 ?auto_1768794 ) ( ON ?auto_1768796 ?auto_1768795 ) ( ON ?auto_1768797 ?auto_1768796 ) ( ON ?auto_1768798 ?auto_1768797 ) ( ON ?auto_1768799 ?auto_1768798 ) ( ON ?auto_1768800 ?auto_1768799 ) ( ON ?auto_1768801 ?auto_1768800 ) ( ON ?auto_1768802 ?auto_1768801 ) ( ON ?auto_1768803 ?auto_1768802 ) ( ON ?auto_1768804 ?auto_1768803 ) ( ON ?auto_1768805 ?auto_1768804 ) ( not ( = ?auto_1768792 ?auto_1768793 ) ) ( not ( = ?auto_1768792 ?auto_1768794 ) ) ( not ( = ?auto_1768792 ?auto_1768795 ) ) ( not ( = ?auto_1768792 ?auto_1768796 ) ) ( not ( = ?auto_1768792 ?auto_1768797 ) ) ( not ( = ?auto_1768792 ?auto_1768798 ) ) ( not ( = ?auto_1768792 ?auto_1768799 ) ) ( not ( = ?auto_1768792 ?auto_1768800 ) ) ( not ( = ?auto_1768792 ?auto_1768801 ) ) ( not ( = ?auto_1768792 ?auto_1768802 ) ) ( not ( = ?auto_1768792 ?auto_1768803 ) ) ( not ( = ?auto_1768792 ?auto_1768804 ) ) ( not ( = ?auto_1768792 ?auto_1768805 ) ) ( not ( = ?auto_1768792 ?auto_1768806 ) ) ( not ( = ?auto_1768793 ?auto_1768794 ) ) ( not ( = ?auto_1768793 ?auto_1768795 ) ) ( not ( = ?auto_1768793 ?auto_1768796 ) ) ( not ( = ?auto_1768793 ?auto_1768797 ) ) ( not ( = ?auto_1768793 ?auto_1768798 ) ) ( not ( = ?auto_1768793 ?auto_1768799 ) ) ( not ( = ?auto_1768793 ?auto_1768800 ) ) ( not ( = ?auto_1768793 ?auto_1768801 ) ) ( not ( = ?auto_1768793 ?auto_1768802 ) ) ( not ( = ?auto_1768793 ?auto_1768803 ) ) ( not ( = ?auto_1768793 ?auto_1768804 ) ) ( not ( = ?auto_1768793 ?auto_1768805 ) ) ( not ( = ?auto_1768793 ?auto_1768806 ) ) ( not ( = ?auto_1768794 ?auto_1768795 ) ) ( not ( = ?auto_1768794 ?auto_1768796 ) ) ( not ( = ?auto_1768794 ?auto_1768797 ) ) ( not ( = ?auto_1768794 ?auto_1768798 ) ) ( not ( = ?auto_1768794 ?auto_1768799 ) ) ( not ( = ?auto_1768794 ?auto_1768800 ) ) ( not ( = ?auto_1768794 ?auto_1768801 ) ) ( not ( = ?auto_1768794 ?auto_1768802 ) ) ( not ( = ?auto_1768794 ?auto_1768803 ) ) ( not ( = ?auto_1768794 ?auto_1768804 ) ) ( not ( = ?auto_1768794 ?auto_1768805 ) ) ( not ( = ?auto_1768794 ?auto_1768806 ) ) ( not ( = ?auto_1768795 ?auto_1768796 ) ) ( not ( = ?auto_1768795 ?auto_1768797 ) ) ( not ( = ?auto_1768795 ?auto_1768798 ) ) ( not ( = ?auto_1768795 ?auto_1768799 ) ) ( not ( = ?auto_1768795 ?auto_1768800 ) ) ( not ( = ?auto_1768795 ?auto_1768801 ) ) ( not ( = ?auto_1768795 ?auto_1768802 ) ) ( not ( = ?auto_1768795 ?auto_1768803 ) ) ( not ( = ?auto_1768795 ?auto_1768804 ) ) ( not ( = ?auto_1768795 ?auto_1768805 ) ) ( not ( = ?auto_1768795 ?auto_1768806 ) ) ( not ( = ?auto_1768796 ?auto_1768797 ) ) ( not ( = ?auto_1768796 ?auto_1768798 ) ) ( not ( = ?auto_1768796 ?auto_1768799 ) ) ( not ( = ?auto_1768796 ?auto_1768800 ) ) ( not ( = ?auto_1768796 ?auto_1768801 ) ) ( not ( = ?auto_1768796 ?auto_1768802 ) ) ( not ( = ?auto_1768796 ?auto_1768803 ) ) ( not ( = ?auto_1768796 ?auto_1768804 ) ) ( not ( = ?auto_1768796 ?auto_1768805 ) ) ( not ( = ?auto_1768796 ?auto_1768806 ) ) ( not ( = ?auto_1768797 ?auto_1768798 ) ) ( not ( = ?auto_1768797 ?auto_1768799 ) ) ( not ( = ?auto_1768797 ?auto_1768800 ) ) ( not ( = ?auto_1768797 ?auto_1768801 ) ) ( not ( = ?auto_1768797 ?auto_1768802 ) ) ( not ( = ?auto_1768797 ?auto_1768803 ) ) ( not ( = ?auto_1768797 ?auto_1768804 ) ) ( not ( = ?auto_1768797 ?auto_1768805 ) ) ( not ( = ?auto_1768797 ?auto_1768806 ) ) ( not ( = ?auto_1768798 ?auto_1768799 ) ) ( not ( = ?auto_1768798 ?auto_1768800 ) ) ( not ( = ?auto_1768798 ?auto_1768801 ) ) ( not ( = ?auto_1768798 ?auto_1768802 ) ) ( not ( = ?auto_1768798 ?auto_1768803 ) ) ( not ( = ?auto_1768798 ?auto_1768804 ) ) ( not ( = ?auto_1768798 ?auto_1768805 ) ) ( not ( = ?auto_1768798 ?auto_1768806 ) ) ( not ( = ?auto_1768799 ?auto_1768800 ) ) ( not ( = ?auto_1768799 ?auto_1768801 ) ) ( not ( = ?auto_1768799 ?auto_1768802 ) ) ( not ( = ?auto_1768799 ?auto_1768803 ) ) ( not ( = ?auto_1768799 ?auto_1768804 ) ) ( not ( = ?auto_1768799 ?auto_1768805 ) ) ( not ( = ?auto_1768799 ?auto_1768806 ) ) ( not ( = ?auto_1768800 ?auto_1768801 ) ) ( not ( = ?auto_1768800 ?auto_1768802 ) ) ( not ( = ?auto_1768800 ?auto_1768803 ) ) ( not ( = ?auto_1768800 ?auto_1768804 ) ) ( not ( = ?auto_1768800 ?auto_1768805 ) ) ( not ( = ?auto_1768800 ?auto_1768806 ) ) ( not ( = ?auto_1768801 ?auto_1768802 ) ) ( not ( = ?auto_1768801 ?auto_1768803 ) ) ( not ( = ?auto_1768801 ?auto_1768804 ) ) ( not ( = ?auto_1768801 ?auto_1768805 ) ) ( not ( = ?auto_1768801 ?auto_1768806 ) ) ( not ( = ?auto_1768802 ?auto_1768803 ) ) ( not ( = ?auto_1768802 ?auto_1768804 ) ) ( not ( = ?auto_1768802 ?auto_1768805 ) ) ( not ( = ?auto_1768802 ?auto_1768806 ) ) ( not ( = ?auto_1768803 ?auto_1768804 ) ) ( not ( = ?auto_1768803 ?auto_1768805 ) ) ( not ( = ?auto_1768803 ?auto_1768806 ) ) ( not ( = ?auto_1768804 ?auto_1768805 ) ) ( not ( = ?auto_1768804 ?auto_1768806 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1768805 ?auto_1768806 )
      ( MAKE-14CRATE-VERIFY ?auto_1768792 ?auto_1768793 ?auto_1768794 ?auto_1768795 ?auto_1768796 ?auto_1768797 ?auto_1768798 ?auto_1768799 ?auto_1768800 ?auto_1768801 ?auto_1768802 ?auto_1768803 ?auto_1768804 ?auto_1768805 ?auto_1768806 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1768952 - SURFACE
      ?auto_1768953 - SURFACE
      ?auto_1768954 - SURFACE
      ?auto_1768955 - SURFACE
      ?auto_1768956 - SURFACE
      ?auto_1768957 - SURFACE
      ?auto_1768958 - SURFACE
      ?auto_1768959 - SURFACE
      ?auto_1768960 - SURFACE
      ?auto_1768961 - SURFACE
      ?auto_1768962 - SURFACE
      ?auto_1768963 - SURFACE
      ?auto_1768964 - SURFACE
      ?auto_1768965 - SURFACE
      ?auto_1768966 - SURFACE
    )
    :vars
    (
      ?auto_1768967 - HOIST
      ?auto_1768969 - PLACE
      ?auto_1768968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1768967 ?auto_1768969 ) ( SURFACE-AT ?auto_1768965 ?auto_1768969 ) ( CLEAR ?auto_1768965 ) ( IS-CRATE ?auto_1768966 ) ( not ( = ?auto_1768965 ?auto_1768966 ) ) ( TRUCK-AT ?auto_1768968 ?auto_1768969 ) ( AVAILABLE ?auto_1768967 ) ( IN ?auto_1768966 ?auto_1768968 ) ( ON ?auto_1768965 ?auto_1768964 ) ( not ( = ?auto_1768964 ?auto_1768965 ) ) ( not ( = ?auto_1768964 ?auto_1768966 ) ) ( ON ?auto_1768953 ?auto_1768952 ) ( ON ?auto_1768954 ?auto_1768953 ) ( ON ?auto_1768955 ?auto_1768954 ) ( ON ?auto_1768956 ?auto_1768955 ) ( ON ?auto_1768957 ?auto_1768956 ) ( ON ?auto_1768958 ?auto_1768957 ) ( ON ?auto_1768959 ?auto_1768958 ) ( ON ?auto_1768960 ?auto_1768959 ) ( ON ?auto_1768961 ?auto_1768960 ) ( ON ?auto_1768962 ?auto_1768961 ) ( ON ?auto_1768963 ?auto_1768962 ) ( ON ?auto_1768964 ?auto_1768963 ) ( not ( = ?auto_1768952 ?auto_1768953 ) ) ( not ( = ?auto_1768952 ?auto_1768954 ) ) ( not ( = ?auto_1768952 ?auto_1768955 ) ) ( not ( = ?auto_1768952 ?auto_1768956 ) ) ( not ( = ?auto_1768952 ?auto_1768957 ) ) ( not ( = ?auto_1768952 ?auto_1768958 ) ) ( not ( = ?auto_1768952 ?auto_1768959 ) ) ( not ( = ?auto_1768952 ?auto_1768960 ) ) ( not ( = ?auto_1768952 ?auto_1768961 ) ) ( not ( = ?auto_1768952 ?auto_1768962 ) ) ( not ( = ?auto_1768952 ?auto_1768963 ) ) ( not ( = ?auto_1768952 ?auto_1768964 ) ) ( not ( = ?auto_1768952 ?auto_1768965 ) ) ( not ( = ?auto_1768952 ?auto_1768966 ) ) ( not ( = ?auto_1768953 ?auto_1768954 ) ) ( not ( = ?auto_1768953 ?auto_1768955 ) ) ( not ( = ?auto_1768953 ?auto_1768956 ) ) ( not ( = ?auto_1768953 ?auto_1768957 ) ) ( not ( = ?auto_1768953 ?auto_1768958 ) ) ( not ( = ?auto_1768953 ?auto_1768959 ) ) ( not ( = ?auto_1768953 ?auto_1768960 ) ) ( not ( = ?auto_1768953 ?auto_1768961 ) ) ( not ( = ?auto_1768953 ?auto_1768962 ) ) ( not ( = ?auto_1768953 ?auto_1768963 ) ) ( not ( = ?auto_1768953 ?auto_1768964 ) ) ( not ( = ?auto_1768953 ?auto_1768965 ) ) ( not ( = ?auto_1768953 ?auto_1768966 ) ) ( not ( = ?auto_1768954 ?auto_1768955 ) ) ( not ( = ?auto_1768954 ?auto_1768956 ) ) ( not ( = ?auto_1768954 ?auto_1768957 ) ) ( not ( = ?auto_1768954 ?auto_1768958 ) ) ( not ( = ?auto_1768954 ?auto_1768959 ) ) ( not ( = ?auto_1768954 ?auto_1768960 ) ) ( not ( = ?auto_1768954 ?auto_1768961 ) ) ( not ( = ?auto_1768954 ?auto_1768962 ) ) ( not ( = ?auto_1768954 ?auto_1768963 ) ) ( not ( = ?auto_1768954 ?auto_1768964 ) ) ( not ( = ?auto_1768954 ?auto_1768965 ) ) ( not ( = ?auto_1768954 ?auto_1768966 ) ) ( not ( = ?auto_1768955 ?auto_1768956 ) ) ( not ( = ?auto_1768955 ?auto_1768957 ) ) ( not ( = ?auto_1768955 ?auto_1768958 ) ) ( not ( = ?auto_1768955 ?auto_1768959 ) ) ( not ( = ?auto_1768955 ?auto_1768960 ) ) ( not ( = ?auto_1768955 ?auto_1768961 ) ) ( not ( = ?auto_1768955 ?auto_1768962 ) ) ( not ( = ?auto_1768955 ?auto_1768963 ) ) ( not ( = ?auto_1768955 ?auto_1768964 ) ) ( not ( = ?auto_1768955 ?auto_1768965 ) ) ( not ( = ?auto_1768955 ?auto_1768966 ) ) ( not ( = ?auto_1768956 ?auto_1768957 ) ) ( not ( = ?auto_1768956 ?auto_1768958 ) ) ( not ( = ?auto_1768956 ?auto_1768959 ) ) ( not ( = ?auto_1768956 ?auto_1768960 ) ) ( not ( = ?auto_1768956 ?auto_1768961 ) ) ( not ( = ?auto_1768956 ?auto_1768962 ) ) ( not ( = ?auto_1768956 ?auto_1768963 ) ) ( not ( = ?auto_1768956 ?auto_1768964 ) ) ( not ( = ?auto_1768956 ?auto_1768965 ) ) ( not ( = ?auto_1768956 ?auto_1768966 ) ) ( not ( = ?auto_1768957 ?auto_1768958 ) ) ( not ( = ?auto_1768957 ?auto_1768959 ) ) ( not ( = ?auto_1768957 ?auto_1768960 ) ) ( not ( = ?auto_1768957 ?auto_1768961 ) ) ( not ( = ?auto_1768957 ?auto_1768962 ) ) ( not ( = ?auto_1768957 ?auto_1768963 ) ) ( not ( = ?auto_1768957 ?auto_1768964 ) ) ( not ( = ?auto_1768957 ?auto_1768965 ) ) ( not ( = ?auto_1768957 ?auto_1768966 ) ) ( not ( = ?auto_1768958 ?auto_1768959 ) ) ( not ( = ?auto_1768958 ?auto_1768960 ) ) ( not ( = ?auto_1768958 ?auto_1768961 ) ) ( not ( = ?auto_1768958 ?auto_1768962 ) ) ( not ( = ?auto_1768958 ?auto_1768963 ) ) ( not ( = ?auto_1768958 ?auto_1768964 ) ) ( not ( = ?auto_1768958 ?auto_1768965 ) ) ( not ( = ?auto_1768958 ?auto_1768966 ) ) ( not ( = ?auto_1768959 ?auto_1768960 ) ) ( not ( = ?auto_1768959 ?auto_1768961 ) ) ( not ( = ?auto_1768959 ?auto_1768962 ) ) ( not ( = ?auto_1768959 ?auto_1768963 ) ) ( not ( = ?auto_1768959 ?auto_1768964 ) ) ( not ( = ?auto_1768959 ?auto_1768965 ) ) ( not ( = ?auto_1768959 ?auto_1768966 ) ) ( not ( = ?auto_1768960 ?auto_1768961 ) ) ( not ( = ?auto_1768960 ?auto_1768962 ) ) ( not ( = ?auto_1768960 ?auto_1768963 ) ) ( not ( = ?auto_1768960 ?auto_1768964 ) ) ( not ( = ?auto_1768960 ?auto_1768965 ) ) ( not ( = ?auto_1768960 ?auto_1768966 ) ) ( not ( = ?auto_1768961 ?auto_1768962 ) ) ( not ( = ?auto_1768961 ?auto_1768963 ) ) ( not ( = ?auto_1768961 ?auto_1768964 ) ) ( not ( = ?auto_1768961 ?auto_1768965 ) ) ( not ( = ?auto_1768961 ?auto_1768966 ) ) ( not ( = ?auto_1768962 ?auto_1768963 ) ) ( not ( = ?auto_1768962 ?auto_1768964 ) ) ( not ( = ?auto_1768962 ?auto_1768965 ) ) ( not ( = ?auto_1768962 ?auto_1768966 ) ) ( not ( = ?auto_1768963 ?auto_1768964 ) ) ( not ( = ?auto_1768963 ?auto_1768965 ) ) ( not ( = ?auto_1768963 ?auto_1768966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1768964 ?auto_1768965 ?auto_1768966 )
      ( MAKE-14CRATE-VERIFY ?auto_1768952 ?auto_1768953 ?auto_1768954 ?auto_1768955 ?auto_1768956 ?auto_1768957 ?auto_1768958 ?auto_1768959 ?auto_1768960 ?auto_1768961 ?auto_1768962 ?auto_1768963 ?auto_1768964 ?auto_1768965 ?auto_1768966 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769127 - SURFACE
      ?auto_1769128 - SURFACE
      ?auto_1769129 - SURFACE
      ?auto_1769130 - SURFACE
      ?auto_1769131 - SURFACE
      ?auto_1769132 - SURFACE
      ?auto_1769133 - SURFACE
      ?auto_1769134 - SURFACE
      ?auto_1769135 - SURFACE
      ?auto_1769136 - SURFACE
      ?auto_1769137 - SURFACE
      ?auto_1769138 - SURFACE
      ?auto_1769139 - SURFACE
      ?auto_1769140 - SURFACE
      ?auto_1769141 - SURFACE
    )
    :vars
    (
      ?auto_1769142 - HOIST
      ?auto_1769143 - PLACE
      ?auto_1769144 - TRUCK
      ?auto_1769145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769142 ?auto_1769143 ) ( SURFACE-AT ?auto_1769140 ?auto_1769143 ) ( CLEAR ?auto_1769140 ) ( IS-CRATE ?auto_1769141 ) ( not ( = ?auto_1769140 ?auto_1769141 ) ) ( AVAILABLE ?auto_1769142 ) ( IN ?auto_1769141 ?auto_1769144 ) ( ON ?auto_1769140 ?auto_1769139 ) ( not ( = ?auto_1769139 ?auto_1769140 ) ) ( not ( = ?auto_1769139 ?auto_1769141 ) ) ( TRUCK-AT ?auto_1769144 ?auto_1769145 ) ( not ( = ?auto_1769145 ?auto_1769143 ) ) ( ON ?auto_1769128 ?auto_1769127 ) ( ON ?auto_1769129 ?auto_1769128 ) ( ON ?auto_1769130 ?auto_1769129 ) ( ON ?auto_1769131 ?auto_1769130 ) ( ON ?auto_1769132 ?auto_1769131 ) ( ON ?auto_1769133 ?auto_1769132 ) ( ON ?auto_1769134 ?auto_1769133 ) ( ON ?auto_1769135 ?auto_1769134 ) ( ON ?auto_1769136 ?auto_1769135 ) ( ON ?auto_1769137 ?auto_1769136 ) ( ON ?auto_1769138 ?auto_1769137 ) ( ON ?auto_1769139 ?auto_1769138 ) ( not ( = ?auto_1769127 ?auto_1769128 ) ) ( not ( = ?auto_1769127 ?auto_1769129 ) ) ( not ( = ?auto_1769127 ?auto_1769130 ) ) ( not ( = ?auto_1769127 ?auto_1769131 ) ) ( not ( = ?auto_1769127 ?auto_1769132 ) ) ( not ( = ?auto_1769127 ?auto_1769133 ) ) ( not ( = ?auto_1769127 ?auto_1769134 ) ) ( not ( = ?auto_1769127 ?auto_1769135 ) ) ( not ( = ?auto_1769127 ?auto_1769136 ) ) ( not ( = ?auto_1769127 ?auto_1769137 ) ) ( not ( = ?auto_1769127 ?auto_1769138 ) ) ( not ( = ?auto_1769127 ?auto_1769139 ) ) ( not ( = ?auto_1769127 ?auto_1769140 ) ) ( not ( = ?auto_1769127 ?auto_1769141 ) ) ( not ( = ?auto_1769128 ?auto_1769129 ) ) ( not ( = ?auto_1769128 ?auto_1769130 ) ) ( not ( = ?auto_1769128 ?auto_1769131 ) ) ( not ( = ?auto_1769128 ?auto_1769132 ) ) ( not ( = ?auto_1769128 ?auto_1769133 ) ) ( not ( = ?auto_1769128 ?auto_1769134 ) ) ( not ( = ?auto_1769128 ?auto_1769135 ) ) ( not ( = ?auto_1769128 ?auto_1769136 ) ) ( not ( = ?auto_1769128 ?auto_1769137 ) ) ( not ( = ?auto_1769128 ?auto_1769138 ) ) ( not ( = ?auto_1769128 ?auto_1769139 ) ) ( not ( = ?auto_1769128 ?auto_1769140 ) ) ( not ( = ?auto_1769128 ?auto_1769141 ) ) ( not ( = ?auto_1769129 ?auto_1769130 ) ) ( not ( = ?auto_1769129 ?auto_1769131 ) ) ( not ( = ?auto_1769129 ?auto_1769132 ) ) ( not ( = ?auto_1769129 ?auto_1769133 ) ) ( not ( = ?auto_1769129 ?auto_1769134 ) ) ( not ( = ?auto_1769129 ?auto_1769135 ) ) ( not ( = ?auto_1769129 ?auto_1769136 ) ) ( not ( = ?auto_1769129 ?auto_1769137 ) ) ( not ( = ?auto_1769129 ?auto_1769138 ) ) ( not ( = ?auto_1769129 ?auto_1769139 ) ) ( not ( = ?auto_1769129 ?auto_1769140 ) ) ( not ( = ?auto_1769129 ?auto_1769141 ) ) ( not ( = ?auto_1769130 ?auto_1769131 ) ) ( not ( = ?auto_1769130 ?auto_1769132 ) ) ( not ( = ?auto_1769130 ?auto_1769133 ) ) ( not ( = ?auto_1769130 ?auto_1769134 ) ) ( not ( = ?auto_1769130 ?auto_1769135 ) ) ( not ( = ?auto_1769130 ?auto_1769136 ) ) ( not ( = ?auto_1769130 ?auto_1769137 ) ) ( not ( = ?auto_1769130 ?auto_1769138 ) ) ( not ( = ?auto_1769130 ?auto_1769139 ) ) ( not ( = ?auto_1769130 ?auto_1769140 ) ) ( not ( = ?auto_1769130 ?auto_1769141 ) ) ( not ( = ?auto_1769131 ?auto_1769132 ) ) ( not ( = ?auto_1769131 ?auto_1769133 ) ) ( not ( = ?auto_1769131 ?auto_1769134 ) ) ( not ( = ?auto_1769131 ?auto_1769135 ) ) ( not ( = ?auto_1769131 ?auto_1769136 ) ) ( not ( = ?auto_1769131 ?auto_1769137 ) ) ( not ( = ?auto_1769131 ?auto_1769138 ) ) ( not ( = ?auto_1769131 ?auto_1769139 ) ) ( not ( = ?auto_1769131 ?auto_1769140 ) ) ( not ( = ?auto_1769131 ?auto_1769141 ) ) ( not ( = ?auto_1769132 ?auto_1769133 ) ) ( not ( = ?auto_1769132 ?auto_1769134 ) ) ( not ( = ?auto_1769132 ?auto_1769135 ) ) ( not ( = ?auto_1769132 ?auto_1769136 ) ) ( not ( = ?auto_1769132 ?auto_1769137 ) ) ( not ( = ?auto_1769132 ?auto_1769138 ) ) ( not ( = ?auto_1769132 ?auto_1769139 ) ) ( not ( = ?auto_1769132 ?auto_1769140 ) ) ( not ( = ?auto_1769132 ?auto_1769141 ) ) ( not ( = ?auto_1769133 ?auto_1769134 ) ) ( not ( = ?auto_1769133 ?auto_1769135 ) ) ( not ( = ?auto_1769133 ?auto_1769136 ) ) ( not ( = ?auto_1769133 ?auto_1769137 ) ) ( not ( = ?auto_1769133 ?auto_1769138 ) ) ( not ( = ?auto_1769133 ?auto_1769139 ) ) ( not ( = ?auto_1769133 ?auto_1769140 ) ) ( not ( = ?auto_1769133 ?auto_1769141 ) ) ( not ( = ?auto_1769134 ?auto_1769135 ) ) ( not ( = ?auto_1769134 ?auto_1769136 ) ) ( not ( = ?auto_1769134 ?auto_1769137 ) ) ( not ( = ?auto_1769134 ?auto_1769138 ) ) ( not ( = ?auto_1769134 ?auto_1769139 ) ) ( not ( = ?auto_1769134 ?auto_1769140 ) ) ( not ( = ?auto_1769134 ?auto_1769141 ) ) ( not ( = ?auto_1769135 ?auto_1769136 ) ) ( not ( = ?auto_1769135 ?auto_1769137 ) ) ( not ( = ?auto_1769135 ?auto_1769138 ) ) ( not ( = ?auto_1769135 ?auto_1769139 ) ) ( not ( = ?auto_1769135 ?auto_1769140 ) ) ( not ( = ?auto_1769135 ?auto_1769141 ) ) ( not ( = ?auto_1769136 ?auto_1769137 ) ) ( not ( = ?auto_1769136 ?auto_1769138 ) ) ( not ( = ?auto_1769136 ?auto_1769139 ) ) ( not ( = ?auto_1769136 ?auto_1769140 ) ) ( not ( = ?auto_1769136 ?auto_1769141 ) ) ( not ( = ?auto_1769137 ?auto_1769138 ) ) ( not ( = ?auto_1769137 ?auto_1769139 ) ) ( not ( = ?auto_1769137 ?auto_1769140 ) ) ( not ( = ?auto_1769137 ?auto_1769141 ) ) ( not ( = ?auto_1769138 ?auto_1769139 ) ) ( not ( = ?auto_1769138 ?auto_1769140 ) ) ( not ( = ?auto_1769138 ?auto_1769141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769139 ?auto_1769140 ?auto_1769141 )
      ( MAKE-14CRATE-VERIFY ?auto_1769127 ?auto_1769128 ?auto_1769129 ?auto_1769130 ?auto_1769131 ?auto_1769132 ?auto_1769133 ?auto_1769134 ?auto_1769135 ?auto_1769136 ?auto_1769137 ?auto_1769138 ?auto_1769139 ?auto_1769140 ?auto_1769141 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769316 - SURFACE
      ?auto_1769317 - SURFACE
      ?auto_1769318 - SURFACE
      ?auto_1769319 - SURFACE
      ?auto_1769320 - SURFACE
      ?auto_1769321 - SURFACE
      ?auto_1769322 - SURFACE
      ?auto_1769323 - SURFACE
      ?auto_1769324 - SURFACE
      ?auto_1769325 - SURFACE
      ?auto_1769326 - SURFACE
      ?auto_1769327 - SURFACE
      ?auto_1769328 - SURFACE
      ?auto_1769329 - SURFACE
      ?auto_1769330 - SURFACE
    )
    :vars
    (
      ?auto_1769334 - HOIST
      ?auto_1769335 - PLACE
      ?auto_1769331 - TRUCK
      ?auto_1769333 - PLACE
      ?auto_1769332 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769334 ?auto_1769335 ) ( SURFACE-AT ?auto_1769329 ?auto_1769335 ) ( CLEAR ?auto_1769329 ) ( IS-CRATE ?auto_1769330 ) ( not ( = ?auto_1769329 ?auto_1769330 ) ) ( AVAILABLE ?auto_1769334 ) ( ON ?auto_1769329 ?auto_1769328 ) ( not ( = ?auto_1769328 ?auto_1769329 ) ) ( not ( = ?auto_1769328 ?auto_1769330 ) ) ( TRUCK-AT ?auto_1769331 ?auto_1769333 ) ( not ( = ?auto_1769333 ?auto_1769335 ) ) ( HOIST-AT ?auto_1769332 ?auto_1769333 ) ( LIFTING ?auto_1769332 ?auto_1769330 ) ( not ( = ?auto_1769334 ?auto_1769332 ) ) ( ON ?auto_1769317 ?auto_1769316 ) ( ON ?auto_1769318 ?auto_1769317 ) ( ON ?auto_1769319 ?auto_1769318 ) ( ON ?auto_1769320 ?auto_1769319 ) ( ON ?auto_1769321 ?auto_1769320 ) ( ON ?auto_1769322 ?auto_1769321 ) ( ON ?auto_1769323 ?auto_1769322 ) ( ON ?auto_1769324 ?auto_1769323 ) ( ON ?auto_1769325 ?auto_1769324 ) ( ON ?auto_1769326 ?auto_1769325 ) ( ON ?auto_1769327 ?auto_1769326 ) ( ON ?auto_1769328 ?auto_1769327 ) ( not ( = ?auto_1769316 ?auto_1769317 ) ) ( not ( = ?auto_1769316 ?auto_1769318 ) ) ( not ( = ?auto_1769316 ?auto_1769319 ) ) ( not ( = ?auto_1769316 ?auto_1769320 ) ) ( not ( = ?auto_1769316 ?auto_1769321 ) ) ( not ( = ?auto_1769316 ?auto_1769322 ) ) ( not ( = ?auto_1769316 ?auto_1769323 ) ) ( not ( = ?auto_1769316 ?auto_1769324 ) ) ( not ( = ?auto_1769316 ?auto_1769325 ) ) ( not ( = ?auto_1769316 ?auto_1769326 ) ) ( not ( = ?auto_1769316 ?auto_1769327 ) ) ( not ( = ?auto_1769316 ?auto_1769328 ) ) ( not ( = ?auto_1769316 ?auto_1769329 ) ) ( not ( = ?auto_1769316 ?auto_1769330 ) ) ( not ( = ?auto_1769317 ?auto_1769318 ) ) ( not ( = ?auto_1769317 ?auto_1769319 ) ) ( not ( = ?auto_1769317 ?auto_1769320 ) ) ( not ( = ?auto_1769317 ?auto_1769321 ) ) ( not ( = ?auto_1769317 ?auto_1769322 ) ) ( not ( = ?auto_1769317 ?auto_1769323 ) ) ( not ( = ?auto_1769317 ?auto_1769324 ) ) ( not ( = ?auto_1769317 ?auto_1769325 ) ) ( not ( = ?auto_1769317 ?auto_1769326 ) ) ( not ( = ?auto_1769317 ?auto_1769327 ) ) ( not ( = ?auto_1769317 ?auto_1769328 ) ) ( not ( = ?auto_1769317 ?auto_1769329 ) ) ( not ( = ?auto_1769317 ?auto_1769330 ) ) ( not ( = ?auto_1769318 ?auto_1769319 ) ) ( not ( = ?auto_1769318 ?auto_1769320 ) ) ( not ( = ?auto_1769318 ?auto_1769321 ) ) ( not ( = ?auto_1769318 ?auto_1769322 ) ) ( not ( = ?auto_1769318 ?auto_1769323 ) ) ( not ( = ?auto_1769318 ?auto_1769324 ) ) ( not ( = ?auto_1769318 ?auto_1769325 ) ) ( not ( = ?auto_1769318 ?auto_1769326 ) ) ( not ( = ?auto_1769318 ?auto_1769327 ) ) ( not ( = ?auto_1769318 ?auto_1769328 ) ) ( not ( = ?auto_1769318 ?auto_1769329 ) ) ( not ( = ?auto_1769318 ?auto_1769330 ) ) ( not ( = ?auto_1769319 ?auto_1769320 ) ) ( not ( = ?auto_1769319 ?auto_1769321 ) ) ( not ( = ?auto_1769319 ?auto_1769322 ) ) ( not ( = ?auto_1769319 ?auto_1769323 ) ) ( not ( = ?auto_1769319 ?auto_1769324 ) ) ( not ( = ?auto_1769319 ?auto_1769325 ) ) ( not ( = ?auto_1769319 ?auto_1769326 ) ) ( not ( = ?auto_1769319 ?auto_1769327 ) ) ( not ( = ?auto_1769319 ?auto_1769328 ) ) ( not ( = ?auto_1769319 ?auto_1769329 ) ) ( not ( = ?auto_1769319 ?auto_1769330 ) ) ( not ( = ?auto_1769320 ?auto_1769321 ) ) ( not ( = ?auto_1769320 ?auto_1769322 ) ) ( not ( = ?auto_1769320 ?auto_1769323 ) ) ( not ( = ?auto_1769320 ?auto_1769324 ) ) ( not ( = ?auto_1769320 ?auto_1769325 ) ) ( not ( = ?auto_1769320 ?auto_1769326 ) ) ( not ( = ?auto_1769320 ?auto_1769327 ) ) ( not ( = ?auto_1769320 ?auto_1769328 ) ) ( not ( = ?auto_1769320 ?auto_1769329 ) ) ( not ( = ?auto_1769320 ?auto_1769330 ) ) ( not ( = ?auto_1769321 ?auto_1769322 ) ) ( not ( = ?auto_1769321 ?auto_1769323 ) ) ( not ( = ?auto_1769321 ?auto_1769324 ) ) ( not ( = ?auto_1769321 ?auto_1769325 ) ) ( not ( = ?auto_1769321 ?auto_1769326 ) ) ( not ( = ?auto_1769321 ?auto_1769327 ) ) ( not ( = ?auto_1769321 ?auto_1769328 ) ) ( not ( = ?auto_1769321 ?auto_1769329 ) ) ( not ( = ?auto_1769321 ?auto_1769330 ) ) ( not ( = ?auto_1769322 ?auto_1769323 ) ) ( not ( = ?auto_1769322 ?auto_1769324 ) ) ( not ( = ?auto_1769322 ?auto_1769325 ) ) ( not ( = ?auto_1769322 ?auto_1769326 ) ) ( not ( = ?auto_1769322 ?auto_1769327 ) ) ( not ( = ?auto_1769322 ?auto_1769328 ) ) ( not ( = ?auto_1769322 ?auto_1769329 ) ) ( not ( = ?auto_1769322 ?auto_1769330 ) ) ( not ( = ?auto_1769323 ?auto_1769324 ) ) ( not ( = ?auto_1769323 ?auto_1769325 ) ) ( not ( = ?auto_1769323 ?auto_1769326 ) ) ( not ( = ?auto_1769323 ?auto_1769327 ) ) ( not ( = ?auto_1769323 ?auto_1769328 ) ) ( not ( = ?auto_1769323 ?auto_1769329 ) ) ( not ( = ?auto_1769323 ?auto_1769330 ) ) ( not ( = ?auto_1769324 ?auto_1769325 ) ) ( not ( = ?auto_1769324 ?auto_1769326 ) ) ( not ( = ?auto_1769324 ?auto_1769327 ) ) ( not ( = ?auto_1769324 ?auto_1769328 ) ) ( not ( = ?auto_1769324 ?auto_1769329 ) ) ( not ( = ?auto_1769324 ?auto_1769330 ) ) ( not ( = ?auto_1769325 ?auto_1769326 ) ) ( not ( = ?auto_1769325 ?auto_1769327 ) ) ( not ( = ?auto_1769325 ?auto_1769328 ) ) ( not ( = ?auto_1769325 ?auto_1769329 ) ) ( not ( = ?auto_1769325 ?auto_1769330 ) ) ( not ( = ?auto_1769326 ?auto_1769327 ) ) ( not ( = ?auto_1769326 ?auto_1769328 ) ) ( not ( = ?auto_1769326 ?auto_1769329 ) ) ( not ( = ?auto_1769326 ?auto_1769330 ) ) ( not ( = ?auto_1769327 ?auto_1769328 ) ) ( not ( = ?auto_1769327 ?auto_1769329 ) ) ( not ( = ?auto_1769327 ?auto_1769330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769328 ?auto_1769329 ?auto_1769330 )
      ( MAKE-14CRATE-VERIFY ?auto_1769316 ?auto_1769317 ?auto_1769318 ?auto_1769319 ?auto_1769320 ?auto_1769321 ?auto_1769322 ?auto_1769323 ?auto_1769324 ?auto_1769325 ?auto_1769326 ?auto_1769327 ?auto_1769328 ?auto_1769329 ?auto_1769330 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769519 - SURFACE
      ?auto_1769520 - SURFACE
      ?auto_1769521 - SURFACE
      ?auto_1769522 - SURFACE
      ?auto_1769523 - SURFACE
      ?auto_1769524 - SURFACE
      ?auto_1769525 - SURFACE
      ?auto_1769526 - SURFACE
      ?auto_1769527 - SURFACE
      ?auto_1769528 - SURFACE
      ?auto_1769529 - SURFACE
      ?auto_1769530 - SURFACE
      ?auto_1769531 - SURFACE
      ?auto_1769532 - SURFACE
      ?auto_1769533 - SURFACE
    )
    :vars
    (
      ?auto_1769539 - HOIST
      ?auto_1769536 - PLACE
      ?auto_1769535 - TRUCK
      ?auto_1769537 - PLACE
      ?auto_1769534 - HOIST
      ?auto_1769538 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769539 ?auto_1769536 ) ( SURFACE-AT ?auto_1769532 ?auto_1769536 ) ( CLEAR ?auto_1769532 ) ( IS-CRATE ?auto_1769533 ) ( not ( = ?auto_1769532 ?auto_1769533 ) ) ( AVAILABLE ?auto_1769539 ) ( ON ?auto_1769532 ?auto_1769531 ) ( not ( = ?auto_1769531 ?auto_1769532 ) ) ( not ( = ?auto_1769531 ?auto_1769533 ) ) ( TRUCK-AT ?auto_1769535 ?auto_1769537 ) ( not ( = ?auto_1769537 ?auto_1769536 ) ) ( HOIST-AT ?auto_1769534 ?auto_1769537 ) ( not ( = ?auto_1769539 ?auto_1769534 ) ) ( AVAILABLE ?auto_1769534 ) ( SURFACE-AT ?auto_1769533 ?auto_1769537 ) ( ON ?auto_1769533 ?auto_1769538 ) ( CLEAR ?auto_1769533 ) ( not ( = ?auto_1769532 ?auto_1769538 ) ) ( not ( = ?auto_1769533 ?auto_1769538 ) ) ( not ( = ?auto_1769531 ?auto_1769538 ) ) ( ON ?auto_1769520 ?auto_1769519 ) ( ON ?auto_1769521 ?auto_1769520 ) ( ON ?auto_1769522 ?auto_1769521 ) ( ON ?auto_1769523 ?auto_1769522 ) ( ON ?auto_1769524 ?auto_1769523 ) ( ON ?auto_1769525 ?auto_1769524 ) ( ON ?auto_1769526 ?auto_1769525 ) ( ON ?auto_1769527 ?auto_1769526 ) ( ON ?auto_1769528 ?auto_1769527 ) ( ON ?auto_1769529 ?auto_1769528 ) ( ON ?auto_1769530 ?auto_1769529 ) ( ON ?auto_1769531 ?auto_1769530 ) ( not ( = ?auto_1769519 ?auto_1769520 ) ) ( not ( = ?auto_1769519 ?auto_1769521 ) ) ( not ( = ?auto_1769519 ?auto_1769522 ) ) ( not ( = ?auto_1769519 ?auto_1769523 ) ) ( not ( = ?auto_1769519 ?auto_1769524 ) ) ( not ( = ?auto_1769519 ?auto_1769525 ) ) ( not ( = ?auto_1769519 ?auto_1769526 ) ) ( not ( = ?auto_1769519 ?auto_1769527 ) ) ( not ( = ?auto_1769519 ?auto_1769528 ) ) ( not ( = ?auto_1769519 ?auto_1769529 ) ) ( not ( = ?auto_1769519 ?auto_1769530 ) ) ( not ( = ?auto_1769519 ?auto_1769531 ) ) ( not ( = ?auto_1769519 ?auto_1769532 ) ) ( not ( = ?auto_1769519 ?auto_1769533 ) ) ( not ( = ?auto_1769519 ?auto_1769538 ) ) ( not ( = ?auto_1769520 ?auto_1769521 ) ) ( not ( = ?auto_1769520 ?auto_1769522 ) ) ( not ( = ?auto_1769520 ?auto_1769523 ) ) ( not ( = ?auto_1769520 ?auto_1769524 ) ) ( not ( = ?auto_1769520 ?auto_1769525 ) ) ( not ( = ?auto_1769520 ?auto_1769526 ) ) ( not ( = ?auto_1769520 ?auto_1769527 ) ) ( not ( = ?auto_1769520 ?auto_1769528 ) ) ( not ( = ?auto_1769520 ?auto_1769529 ) ) ( not ( = ?auto_1769520 ?auto_1769530 ) ) ( not ( = ?auto_1769520 ?auto_1769531 ) ) ( not ( = ?auto_1769520 ?auto_1769532 ) ) ( not ( = ?auto_1769520 ?auto_1769533 ) ) ( not ( = ?auto_1769520 ?auto_1769538 ) ) ( not ( = ?auto_1769521 ?auto_1769522 ) ) ( not ( = ?auto_1769521 ?auto_1769523 ) ) ( not ( = ?auto_1769521 ?auto_1769524 ) ) ( not ( = ?auto_1769521 ?auto_1769525 ) ) ( not ( = ?auto_1769521 ?auto_1769526 ) ) ( not ( = ?auto_1769521 ?auto_1769527 ) ) ( not ( = ?auto_1769521 ?auto_1769528 ) ) ( not ( = ?auto_1769521 ?auto_1769529 ) ) ( not ( = ?auto_1769521 ?auto_1769530 ) ) ( not ( = ?auto_1769521 ?auto_1769531 ) ) ( not ( = ?auto_1769521 ?auto_1769532 ) ) ( not ( = ?auto_1769521 ?auto_1769533 ) ) ( not ( = ?auto_1769521 ?auto_1769538 ) ) ( not ( = ?auto_1769522 ?auto_1769523 ) ) ( not ( = ?auto_1769522 ?auto_1769524 ) ) ( not ( = ?auto_1769522 ?auto_1769525 ) ) ( not ( = ?auto_1769522 ?auto_1769526 ) ) ( not ( = ?auto_1769522 ?auto_1769527 ) ) ( not ( = ?auto_1769522 ?auto_1769528 ) ) ( not ( = ?auto_1769522 ?auto_1769529 ) ) ( not ( = ?auto_1769522 ?auto_1769530 ) ) ( not ( = ?auto_1769522 ?auto_1769531 ) ) ( not ( = ?auto_1769522 ?auto_1769532 ) ) ( not ( = ?auto_1769522 ?auto_1769533 ) ) ( not ( = ?auto_1769522 ?auto_1769538 ) ) ( not ( = ?auto_1769523 ?auto_1769524 ) ) ( not ( = ?auto_1769523 ?auto_1769525 ) ) ( not ( = ?auto_1769523 ?auto_1769526 ) ) ( not ( = ?auto_1769523 ?auto_1769527 ) ) ( not ( = ?auto_1769523 ?auto_1769528 ) ) ( not ( = ?auto_1769523 ?auto_1769529 ) ) ( not ( = ?auto_1769523 ?auto_1769530 ) ) ( not ( = ?auto_1769523 ?auto_1769531 ) ) ( not ( = ?auto_1769523 ?auto_1769532 ) ) ( not ( = ?auto_1769523 ?auto_1769533 ) ) ( not ( = ?auto_1769523 ?auto_1769538 ) ) ( not ( = ?auto_1769524 ?auto_1769525 ) ) ( not ( = ?auto_1769524 ?auto_1769526 ) ) ( not ( = ?auto_1769524 ?auto_1769527 ) ) ( not ( = ?auto_1769524 ?auto_1769528 ) ) ( not ( = ?auto_1769524 ?auto_1769529 ) ) ( not ( = ?auto_1769524 ?auto_1769530 ) ) ( not ( = ?auto_1769524 ?auto_1769531 ) ) ( not ( = ?auto_1769524 ?auto_1769532 ) ) ( not ( = ?auto_1769524 ?auto_1769533 ) ) ( not ( = ?auto_1769524 ?auto_1769538 ) ) ( not ( = ?auto_1769525 ?auto_1769526 ) ) ( not ( = ?auto_1769525 ?auto_1769527 ) ) ( not ( = ?auto_1769525 ?auto_1769528 ) ) ( not ( = ?auto_1769525 ?auto_1769529 ) ) ( not ( = ?auto_1769525 ?auto_1769530 ) ) ( not ( = ?auto_1769525 ?auto_1769531 ) ) ( not ( = ?auto_1769525 ?auto_1769532 ) ) ( not ( = ?auto_1769525 ?auto_1769533 ) ) ( not ( = ?auto_1769525 ?auto_1769538 ) ) ( not ( = ?auto_1769526 ?auto_1769527 ) ) ( not ( = ?auto_1769526 ?auto_1769528 ) ) ( not ( = ?auto_1769526 ?auto_1769529 ) ) ( not ( = ?auto_1769526 ?auto_1769530 ) ) ( not ( = ?auto_1769526 ?auto_1769531 ) ) ( not ( = ?auto_1769526 ?auto_1769532 ) ) ( not ( = ?auto_1769526 ?auto_1769533 ) ) ( not ( = ?auto_1769526 ?auto_1769538 ) ) ( not ( = ?auto_1769527 ?auto_1769528 ) ) ( not ( = ?auto_1769527 ?auto_1769529 ) ) ( not ( = ?auto_1769527 ?auto_1769530 ) ) ( not ( = ?auto_1769527 ?auto_1769531 ) ) ( not ( = ?auto_1769527 ?auto_1769532 ) ) ( not ( = ?auto_1769527 ?auto_1769533 ) ) ( not ( = ?auto_1769527 ?auto_1769538 ) ) ( not ( = ?auto_1769528 ?auto_1769529 ) ) ( not ( = ?auto_1769528 ?auto_1769530 ) ) ( not ( = ?auto_1769528 ?auto_1769531 ) ) ( not ( = ?auto_1769528 ?auto_1769532 ) ) ( not ( = ?auto_1769528 ?auto_1769533 ) ) ( not ( = ?auto_1769528 ?auto_1769538 ) ) ( not ( = ?auto_1769529 ?auto_1769530 ) ) ( not ( = ?auto_1769529 ?auto_1769531 ) ) ( not ( = ?auto_1769529 ?auto_1769532 ) ) ( not ( = ?auto_1769529 ?auto_1769533 ) ) ( not ( = ?auto_1769529 ?auto_1769538 ) ) ( not ( = ?auto_1769530 ?auto_1769531 ) ) ( not ( = ?auto_1769530 ?auto_1769532 ) ) ( not ( = ?auto_1769530 ?auto_1769533 ) ) ( not ( = ?auto_1769530 ?auto_1769538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769531 ?auto_1769532 ?auto_1769533 )
      ( MAKE-14CRATE-VERIFY ?auto_1769519 ?auto_1769520 ?auto_1769521 ?auto_1769522 ?auto_1769523 ?auto_1769524 ?auto_1769525 ?auto_1769526 ?auto_1769527 ?auto_1769528 ?auto_1769529 ?auto_1769530 ?auto_1769531 ?auto_1769532 ?auto_1769533 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769723 - SURFACE
      ?auto_1769724 - SURFACE
      ?auto_1769725 - SURFACE
      ?auto_1769726 - SURFACE
      ?auto_1769727 - SURFACE
      ?auto_1769728 - SURFACE
      ?auto_1769729 - SURFACE
      ?auto_1769730 - SURFACE
      ?auto_1769731 - SURFACE
      ?auto_1769732 - SURFACE
      ?auto_1769733 - SURFACE
      ?auto_1769734 - SURFACE
      ?auto_1769735 - SURFACE
      ?auto_1769736 - SURFACE
      ?auto_1769737 - SURFACE
    )
    :vars
    (
      ?auto_1769739 - HOIST
      ?auto_1769742 - PLACE
      ?auto_1769740 - PLACE
      ?auto_1769743 - HOIST
      ?auto_1769738 - SURFACE
      ?auto_1769741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769739 ?auto_1769742 ) ( SURFACE-AT ?auto_1769736 ?auto_1769742 ) ( CLEAR ?auto_1769736 ) ( IS-CRATE ?auto_1769737 ) ( not ( = ?auto_1769736 ?auto_1769737 ) ) ( AVAILABLE ?auto_1769739 ) ( ON ?auto_1769736 ?auto_1769735 ) ( not ( = ?auto_1769735 ?auto_1769736 ) ) ( not ( = ?auto_1769735 ?auto_1769737 ) ) ( not ( = ?auto_1769740 ?auto_1769742 ) ) ( HOIST-AT ?auto_1769743 ?auto_1769740 ) ( not ( = ?auto_1769739 ?auto_1769743 ) ) ( AVAILABLE ?auto_1769743 ) ( SURFACE-AT ?auto_1769737 ?auto_1769740 ) ( ON ?auto_1769737 ?auto_1769738 ) ( CLEAR ?auto_1769737 ) ( not ( = ?auto_1769736 ?auto_1769738 ) ) ( not ( = ?auto_1769737 ?auto_1769738 ) ) ( not ( = ?auto_1769735 ?auto_1769738 ) ) ( TRUCK-AT ?auto_1769741 ?auto_1769742 ) ( ON ?auto_1769724 ?auto_1769723 ) ( ON ?auto_1769725 ?auto_1769724 ) ( ON ?auto_1769726 ?auto_1769725 ) ( ON ?auto_1769727 ?auto_1769726 ) ( ON ?auto_1769728 ?auto_1769727 ) ( ON ?auto_1769729 ?auto_1769728 ) ( ON ?auto_1769730 ?auto_1769729 ) ( ON ?auto_1769731 ?auto_1769730 ) ( ON ?auto_1769732 ?auto_1769731 ) ( ON ?auto_1769733 ?auto_1769732 ) ( ON ?auto_1769734 ?auto_1769733 ) ( ON ?auto_1769735 ?auto_1769734 ) ( not ( = ?auto_1769723 ?auto_1769724 ) ) ( not ( = ?auto_1769723 ?auto_1769725 ) ) ( not ( = ?auto_1769723 ?auto_1769726 ) ) ( not ( = ?auto_1769723 ?auto_1769727 ) ) ( not ( = ?auto_1769723 ?auto_1769728 ) ) ( not ( = ?auto_1769723 ?auto_1769729 ) ) ( not ( = ?auto_1769723 ?auto_1769730 ) ) ( not ( = ?auto_1769723 ?auto_1769731 ) ) ( not ( = ?auto_1769723 ?auto_1769732 ) ) ( not ( = ?auto_1769723 ?auto_1769733 ) ) ( not ( = ?auto_1769723 ?auto_1769734 ) ) ( not ( = ?auto_1769723 ?auto_1769735 ) ) ( not ( = ?auto_1769723 ?auto_1769736 ) ) ( not ( = ?auto_1769723 ?auto_1769737 ) ) ( not ( = ?auto_1769723 ?auto_1769738 ) ) ( not ( = ?auto_1769724 ?auto_1769725 ) ) ( not ( = ?auto_1769724 ?auto_1769726 ) ) ( not ( = ?auto_1769724 ?auto_1769727 ) ) ( not ( = ?auto_1769724 ?auto_1769728 ) ) ( not ( = ?auto_1769724 ?auto_1769729 ) ) ( not ( = ?auto_1769724 ?auto_1769730 ) ) ( not ( = ?auto_1769724 ?auto_1769731 ) ) ( not ( = ?auto_1769724 ?auto_1769732 ) ) ( not ( = ?auto_1769724 ?auto_1769733 ) ) ( not ( = ?auto_1769724 ?auto_1769734 ) ) ( not ( = ?auto_1769724 ?auto_1769735 ) ) ( not ( = ?auto_1769724 ?auto_1769736 ) ) ( not ( = ?auto_1769724 ?auto_1769737 ) ) ( not ( = ?auto_1769724 ?auto_1769738 ) ) ( not ( = ?auto_1769725 ?auto_1769726 ) ) ( not ( = ?auto_1769725 ?auto_1769727 ) ) ( not ( = ?auto_1769725 ?auto_1769728 ) ) ( not ( = ?auto_1769725 ?auto_1769729 ) ) ( not ( = ?auto_1769725 ?auto_1769730 ) ) ( not ( = ?auto_1769725 ?auto_1769731 ) ) ( not ( = ?auto_1769725 ?auto_1769732 ) ) ( not ( = ?auto_1769725 ?auto_1769733 ) ) ( not ( = ?auto_1769725 ?auto_1769734 ) ) ( not ( = ?auto_1769725 ?auto_1769735 ) ) ( not ( = ?auto_1769725 ?auto_1769736 ) ) ( not ( = ?auto_1769725 ?auto_1769737 ) ) ( not ( = ?auto_1769725 ?auto_1769738 ) ) ( not ( = ?auto_1769726 ?auto_1769727 ) ) ( not ( = ?auto_1769726 ?auto_1769728 ) ) ( not ( = ?auto_1769726 ?auto_1769729 ) ) ( not ( = ?auto_1769726 ?auto_1769730 ) ) ( not ( = ?auto_1769726 ?auto_1769731 ) ) ( not ( = ?auto_1769726 ?auto_1769732 ) ) ( not ( = ?auto_1769726 ?auto_1769733 ) ) ( not ( = ?auto_1769726 ?auto_1769734 ) ) ( not ( = ?auto_1769726 ?auto_1769735 ) ) ( not ( = ?auto_1769726 ?auto_1769736 ) ) ( not ( = ?auto_1769726 ?auto_1769737 ) ) ( not ( = ?auto_1769726 ?auto_1769738 ) ) ( not ( = ?auto_1769727 ?auto_1769728 ) ) ( not ( = ?auto_1769727 ?auto_1769729 ) ) ( not ( = ?auto_1769727 ?auto_1769730 ) ) ( not ( = ?auto_1769727 ?auto_1769731 ) ) ( not ( = ?auto_1769727 ?auto_1769732 ) ) ( not ( = ?auto_1769727 ?auto_1769733 ) ) ( not ( = ?auto_1769727 ?auto_1769734 ) ) ( not ( = ?auto_1769727 ?auto_1769735 ) ) ( not ( = ?auto_1769727 ?auto_1769736 ) ) ( not ( = ?auto_1769727 ?auto_1769737 ) ) ( not ( = ?auto_1769727 ?auto_1769738 ) ) ( not ( = ?auto_1769728 ?auto_1769729 ) ) ( not ( = ?auto_1769728 ?auto_1769730 ) ) ( not ( = ?auto_1769728 ?auto_1769731 ) ) ( not ( = ?auto_1769728 ?auto_1769732 ) ) ( not ( = ?auto_1769728 ?auto_1769733 ) ) ( not ( = ?auto_1769728 ?auto_1769734 ) ) ( not ( = ?auto_1769728 ?auto_1769735 ) ) ( not ( = ?auto_1769728 ?auto_1769736 ) ) ( not ( = ?auto_1769728 ?auto_1769737 ) ) ( not ( = ?auto_1769728 ?auto_1769738 ) ) ( not ( = ?auto_1769729 ?auto_1769730 ) ) ( not ( = ?auto_1769729 ?auto_1769731 ) ) ( not ( = ?auto_1769729 ?auto_1769732 ) ) ( not ( = ?auto_1769729 ?auto_1769733 ) ) ( not ( = ?auto_1769729 ?auto_1769734 ) ) ( not ( = ?auto_1769729 ?auto_1769735 ) ) ( not ( = ?auto_1769729 ?auto_1769736 ) ) ( not ( = ?auto_1769729 ?auto_1769737 ) ) ( not ( = ?auto_1769729 ?auto_1769738 ) ) ( not ( = ?auto_1769730 ?auto_1769731 ) ) ( not ( = ?auto_1769730 ?auto_1769732 ) ) ( not ( = ?auto_1769730 ?auto_1769733 ) ) ( not ( = ?auto_1769730 ?auto_1769734 ) ) ( not ( = ?auto_1769730 ?auto_1769735 ) ) ( not ( = ?auto_1769730 ?auto_1769736 ) ) ( not ( = ?auto_1769730 ?auto_1769737 ) ) ( not ( = ?auto_1769730 ?auto_1769738 ) ) ( not ( = ?auto_1769731 ?auto_1769732 ) ) ( not ( = ?auto_1769731 ?auto_1769733 ) ) ( not ( = ?auto_1769731 ?auto_1769734 ) ) ( not ( = ?auto_1769731 ?auto_1769735 ) ) ( not ( = ?auto_1769731 ?auto_1769736 ) ) ( not ( = ?auto_1769731 ?auto_1769737 ) ) ( not ( = ?auto_1769731 ?auto_1769738 ) ) ( not ( = ?auto_1769732 ?auto_1769733 ) ) ( not ( = ?auto_1769732 ?auto_1769734 ) ) ( not ( = ?auto_1769732 ?auto_1769735 ) ) ( not ( = ?auto_1769732 ?auto_1769736 ) ) ( not ( = ?auto_1769732 ?auto_1769737 ) ) ( not ( = ?auto_1769732 ?auto_1769738 ) ) ( not ( = ?auto_1769733 ?auto_1769734 ) ) ( not ( = ?auto_1769733 ?auto_1769735 ) ) ( not ( = ?auto_1769733 ?auto_1769736 ) ) ( not ( = ?auto_1769733 ?auto_1769737 ) ) ( not ( = ?auto_1769733 ?auto_1769738 ) ) ( not ( = ?auto_1769734 ?auto_1769735 ) ) ( not ( = ?auto_1769734 ?auto_1769736 ) ) ( not ( = ?auto_1769734 ?auto_1769737 ) ) ( not ( = ?auto_1769734 ?auto_1769738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769735 ?auto_1769736 ?auto_1769737 )
      ( MAKE-14CRATE-VERIFY ?auto_1769723 ?auto_1769724 ?auto_1769725 ?auto_1769726 ?auto_1769727 ?auto_1769728 ?auto_1769729 ?auto_1769730 ?auto_1769731 ?auto_1769732 ?auto_1769733 ?auto_1769734 ?auto_1769735 ?auto_1769736 ?auto_1769737 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1769927 - SURFACE
      ?auto_1769928 - SURFACE
      ?auto_1769929 - SURFACE
      ?auto_1769930 - SURFACE
      ?auto_1769931 - SURFACE
      ?auto_1769932 - SURFACE
      ?auto_1769933 - SURFACE
      ?auto_1769934 - SURFACE
      ?auto_1769935 - SURFACE
      ?auto_1769936 - SURFACE
      ?auto_1769937 - SURFACE
      ?auto_1769938 - SURFACE
      ?auto_1769939 - SURFACE
      ?auto_1769940 - SURFACE
      ?auto_1769941 - SURFACE
    )
    :vars
    (
      ?auto_1769942 - HOIST
      ?auto_1769944 - PLACE
      ?auto_1769945 - PLACE
      ?auto_1769947 - HOIST
      ?auto_1769946 - SURFACE
      ?auto_1769943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1769942 ?auto_1769944 ) ( IS-CRATE ?auto_1769941 ) ( not ( = ?auto_1769940 ?auto_1769941 ) ) ( not ( = ?auto_1769939 ?auto_1769940 ) ) ( not ( = ?auto_1769939 ?auto_1769941 ) ) ( not ( = ?auto_1769945 ?auto_1769944 ) ) ( HOIST-AT ?auto_1769947 ?auto_1769945 ) ( not ( = ?auto_1769942 ?auto_1769947 ) ) ( AVAILABLE ?auto_1769947 ) ( SURFACE-AT ?auto_1769941 ?auto_1769945 ) ( ON ?auto_1769941 ?auto_1769946 ) ( CLEAR ?auto_1769941 ) ( not ( = ?auto_1769940 ?auto_1769946 ) ) ( not ( = ?auto_1769941 ?auto_1769946 ) ) ( not ( = ?auto_1769939 ?auto_1769946 ) ) ( TRUCK-AT ?auto_1769943 ?auto_1769944 ) ( SURFACE-AT ?auto_1769939 ?auto_1769944 ) ( CLEAR ?auto_1769939 ) ( LIFTING ?auto_1769942 ?auto_1769940 ) ( IS-CRATE ?auto_1769940 ) ( ON ?auto_1769928 ?auto_1769927 ) ( ON ?auto_1769929 ?auto_1769928 ) ( ON ?auto_1769930 ?auto_1769929 ) ( ON ?auto_1769931 ?auto_1769930 ) ( ON ?auto_1769932 ?auto_1769931 ) ( ON ?auto_1769933 ?auto_1769932 ) ( ON ?auto_1769934 ?auto_1769933 ) ( ON ?auto_1769935 ?auto_1769934 ) ( ON ?auto_1769936 ?auto_1769935 ) ( ON ?auto_1769937 ?auto_1769936 ) ( ON ?auto_1769938 ?auto_1769937 ) ( ON ?auto_1769939 ?auto_1769938 ) ( not ( = ?auto_1769927 ?auto_1769928 ) ) ( not ( = ?auto_1769927 ?auto_1769929 ) ) ( not ( = ?auto_1769927 ?auto_1769930 ) ) ( not ( = ?auto_1769927 ?auto_1769931 ) ) ( not ( = ?auto_1769927 ?auto_1769932 ) ) ( not ( = ?auto_1769927 ?auto_1769933 ) ) ( not ( = ?auto_1769927 ?auto_1769934 ) ) ( not ( = ?auto_1769927 ?auto_1769935 ) ) ( not ( = ?auto_1769927 ?auto_1769936 ) ) ( not ( = ?auto_1769927 ?auto_1769937 ) ) ( not ( = ?auto_1769927 ?auto_1769938 ) ) ( not ( = ?auto_1769927 ?auto_1769939 ) ) ( not ( = ?auto_1769927 ?auto_1769940 ) ) ( not ( = ?auto_1769927 ?auto_1769941 ) ) ( not ( = ?auto_1769927 ?auto_1769946 ) ) ( not ( = ?auto_1769928 ?auto_1769929 ) ) ( not ( = ?auto_1769928 ?auto_1769930 ) ) ( not ( = ?auto_1769928 ?auto_1769931 ) ) ( not ( = ?auto_1769928 ?auto_1769932 ) ) ( not ( = ?auto_1769928 ?auto_1769933 ) ) ( not ( = ?auto_1769928 ?auto_1769934 ) ) ( not ( = ?auto_1769928 ?auto_1769935 ) ) ( not ( = ?auto_1769928 ?auto_1769936 ) ) ( not ( = ?auto_1769928 ?auto_1769937 ) ) ( not ( = ?auto_1769928 ?auto_1769938 ) ) ( not ( = ?auto_1769928 ?auto_1769939 ) ) ( not ( = ?auto_1769928 ?auto_1769940 ) ) ( not ( = ?auto_1769928 ?auto_1769941 ) ) ( not ( = ?auto_1769928 ?auto_1769946 ) ) ( not ( = ?auto_1769929 ?auto_1769930 ) ) ( not ( = ?auto_1769929 ?auto_1769931 ) ) ( not ( = ?auto_1769929 ?auto_1769932 ) ) ( not ( = ?auto_1769929 ?auto_1769933 ) ) ( not ( = ?auto_1769929 ?auto_1769934 ) ) ( not ( = ?auto_1769929 ?auto_1769935 ) ) ( not ( = ?auto_1769929 ?auto_1769936 ) ) ( not ( = ?auto_1769929 ?auto_1769937 ) ) ( not ( = ?auto_1769929 ?auto_1769938 ) ) ( not ( = ?auto_1769929 ?auto_1769939 ) ) ( not ( = ?auto_1769929 ?auto_1769940 ) ) ( not ( = ?auto_1769929 ?auto_1769941 ) ) ( not ( = ?auto_1769929 ?auto_1769946 ) ) ( not ( = ?auto_1769930 ?auto_1769931 ) ) ( not ( = ?auto_1769930 ?auto_1769932 ) ) ( not ( = ?auto_1769930 ?auto_1769933 ) ) ( not ( = ?auto_1769930 ?auto_1769934 ) ) ( not ( = ?auto_1769930 ?auto_1769935 ) ) ( not ( = ?auto_1769930 ?auto_1769936 ) ) ( not ( = ?auto_1769930 ?auto_1769937 ) ) ( not ( = ?auto_1769930 ?auto_1769938 ) ) ( not ( = ?auto_1769930 ?auto_1769939 ) ) ( not ( = ?auto_1769930 ?auto_1769940 ) ) ( not ( = ?auto_1769930 ?auto_1769941 ) ) ( not ( = ?auto_1769930 ?auto_1769946 ) ) ( not ( = ?auto_1769931 ?auto_1769932 ) ) ( not ( = ?auto_1769931 ?auto_1769933 ) ) ( not ( = ?auto_1769931 ?auto_1769934 ) ) ( not ( = ?auto_1769931 ?auto_1769935 ) ) ( not ( = ?auto_1769931 ?auto_1769936 ) ) ( not ( = ?auto_1769931 ?auto_1769937 ) ) ( not ( = ?auto_1769931 ?auto_1769938 ) ) ( not ( = ?auto_1769931 ?auto_1769939 ) ) ( not ( = ?auto_1769931 ?auto_1769940 ) ) ( not ( = ?auto_1769931 ?auto_1769941 ) ) ( not ( = ?auto_1769931 ?auto_1769946 ) ) ( not ( = ?auto_1769932 ?auto_1769933 ) ) ( not ( = ?auto_1769932 ?auto_1769934 ) ) ( not ( = ?auto_1769932 ?auto_1769935 ) ) ( not ( = ?auto_1769932 ?auto_1769936 ) ) ( not ( = ?auto_1769932 ?auto_1769937 ) ) ( not ( = ?auto_1769932 ?auto_1769938 ) ) ( not ( = ?auto_1769932 ?auto_1769939 ) ) ( not ( = ?auto_1769932 ?auto_1769940 ) ) ( not ( = ?auto_1769932 ?auto_1769941 ) ) ( not ( = ?auto_1769932 ?auto_1769946 ) ) ( not ( = ?auto_1769933 ?auto_1769934 ) ) ( not ( = ?auto_1769933 ?auto_1769935 ) ) ( not ( = ?auto_1769933 ?auto_1769936 ) ) ( not ( = ?auto_1769933 ?auto_1769937 ) ) ( not ( = ?auto_1769933 ?auto_1769938 ) ) ( not ( = ?auto_1769933 ?auto_1769939 ) ) ( not ( = ?auto_1769933 ?auto_1769940 ) ) ( not ( = ?auto_1769933 ?auto_1769941 ) ) ( not ( = ?auto_1769933 ?auto_1769946 ) ) ( not ( = ?auto_1769934 ?auto_1769935 ) ) ( not ( = ?auto_1769934 ?auto_1769936 ) ) ( not ( = ?auto_1769934 ?auto_1769937 ) ) ( not ( = ?auto_1769934 ?auto_1769938 ) ) ( not ( = ?auto_1769934 ?auto_1769939 ) ) ( not ( = ?auto_1769934 ?auto_1769940 ) ) ( not ( = ?auto_1769934 ?auto_1769941 ) ) ( not ( = ?auto_1769934 ?auto_1769946 ) ) ( not ( = ?auto_1769935 ?auto_1769936 ) ) ( not ( = ?auto_1769935 ?auto_1769937 ) ) ( not ( = ?auto_1769935 ?auto_1769938 ) ) ( not ( = ?auto_1769935 ?auto_1769939 ) ) ( not ( = ?auto_1769935 ?auto_1769940 ) ) ( not ( = ?auto_1769935 ?auto_1769941 ) ) ( not ( = ?auto_1769935 ?auto_1769946 ) ) ( not ( = ?auto_1769936 ?auto_1769937 ) ) ( not ( = ?auto_1769936 ?auto_1769938 ) ) ( not ( = ?auto_1769936 ?auto_1769939 ) ) ( not ( = ?auto_1769936 ?auto_1769940 ) ) ( not ( = ?auto_1769936 ?auto_1769941 ) ) ( not ( = ?auto_1769936 ?auto_1769946 ) ) ( not ( = ?auto_1769937 ?auto_1769938 ) ) ( not ( = ?auto_1769937 ?auto_1769939 ) ) ( not ( = ?auto_1769937 ?auto_1769940 ) ) ( not ( = ?auto_1769937 ?auto_1769941 ) ) ( not ( = ?auto_1769937 ?auto_1769946 ) ) ( not ( = ?auto_1769938 ?auto_1769939 ) ) ( not ( = ?auto_1769938 ?auto_1769940 ) ) ( not ( = ?auto_1769938 ?auto_1769941 ) ) ( not ( = ?auto_1769938 ?auto_1769946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1769939 ?auto_1769940 ?auto_1769941 )
      ( MAKE-14CRATE-VERIFY ?auto_1769927 ?auto_1769928 ?auto_1769929 ?auto_1769930 ?auto_1769931 ?auto_1769932 ?auto_1769933 ?auto_1769934 ?auto_1769935 ?auto_1769936 ?auto_1769937 ?auto_1769938 ?auto_1769939 ?auto_1769940 ?auto_1769941 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1770131 - SURFACE
      ?auto_1770132 - SURFACE
      ?auto_1770133 - SURFACE
      ?auto_1770134 - SURFACE
      ?auto_1770135 - SURFACE
      ?auto_1770136 - SURFACE
      ?auto_1770137 - SURFACE
      ?auto_1770138 - SURFACE
      ?auto_1770139 - SURFACE
      ?auto_1770140 - SURFACE
      ?auto_1770141 - SURFACE
      ?auto_1770142 - SURFACE
      ?auto_1770143 - SURFACE
      ?auto_1770144 - SURFACE
      ?auto_1770145 - SURFACE
    )
    :vars
    (
      ?auto_1770148 - HOIST
      ?auto_1770150 - PLACE
      ?auto_1770149 - PLACE
      ?auto_1770146 - HOIST
      ?auto_1770147 - SURFACE
      ?auto_1770151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1770148 ?auto_1770150 ) ( IS-CRATE ?auto_1770145 ) ( not ( = ?auto_1770144 ?auto_1770145 ) ) ( not ( = ?auto_1770143 ?auto_1770144 ) ) ( not ( = ?auto_1770143 ?auto_1770145 ) ) ( not ( = ?auto_1770149 ?auto_1770150 ) ) ( HOIST-AT ?auto_1770146 ?auto_1770149 ) ( not ( = ?auto_1770148 ?auto_1770146 ) ) ( AVAILABLE ?auto_1770146 ) ( SURFACE-AT ?auto_1770145 ?auto_1770149 ) ( ON ?auto_1770145 ?auto_1770147 ) ( CLEAR ?auto_1770145 ) ( not ( = ?auto_1770144 ?auto_1770147 ) ) ( not ( = ?auto_1770145 ?auto_1770147 ) ) ( not ( = ?auto_1770143 ?auto_1770147 ) ) ( TRUCK-AT ?auto_1770151 ?auto_1770150 ) ( SURFACE-AT ?auto_1770143 ?auto_1770150 ) ( CLEAR ?auto_1770143 ) ( IS-CRATE ?auto_1770144 ) ( AVAILABLE ?auto_1770148 ) ( IN ?auto_1770144 ?auto_1770151 ) ( ON ?auto_1770132 ?auto_1770131 ) ( ON ?auto_1770133 ?auto_1770132 ) ( ON ?auto_1770134 ?auto_1770133 ) ( ON ?auto_1770135 ?auto_1770134 ) ( ON ?auto_1770136 ?auto_1770135 ) ( ON ?auto_1770137 ?auto_1770136 ) ( ON ?auto_1770138 ?auto_1770137 ) ( ON ?auto_1770139 ?auto_1770138 ) ( ON ?auto_1770140 ?auto_1770139 ) ( ON ?auto_1770141 ?auto_1770140 ) ( ON ?auto_1770142 ?auto_1770141 ) ( ON ?auto_1770143 ?auto_1770142 ) ( not ( = ?auto_1770131 ?auto_1770132 ) ) ( not ( = ?auto_1770131 ?auto_1770133 ) ) ( not ( = ?auto_1770131 ?auto_1770134 ) ) ( not ( = ?auto_1770131 ?auto_1770135 ) ) ( not ( = ?auto_1770131 ?auto_1770136 ) ) ( not ( = ?auto_1770131 ?auto_1770137 ) ) ( not ( = ?auto_1770131 ?auto_1770138 ) ) ( not ( = ?auto_1770131 ?auto_1770139 ) ) ( not ( = ?auto_1770131 ?auto_1770140 ) ) ( not ( = ?auto_1770131 ?auto_1770141 ) ) ( not ( = ?auto_1770131 ?auto_1770142 ) ) ( not ( = ?auto_1770131 ?auto_1770143 ) ) ( not ( = ?auto_1770131 ?auto_1770144 ) ) ( not ( = ?auto_1770131 ?auto_1770145 ) ) ( not ( = ?auto_1770131 ?auto_1770147 ) ) ( not ( = ?auto_1770132 ?auto_1770133 ) ) ( not ( = ?auto_1770132 ?auto_1770134 ) ) ( not ( = ?auto_1770132 ?auto_1770135 ) ) ( not ( = ?auto_1770132 ?auto_1770136 ) ) ( not ( = ?auto_1770132 ?auto_1770137 ) ) ( not ( = ?auto_1770132 ?auto_1770138 ) ) ( not ( = ?auto_1770132 ?auto_1770139 ) ) ( not ( = ?auto_1770132 ?auto_1770140 ) ) ( not ( = ?auto_1770132 ?auto_1770141 ) ) ( not ( = ?auto_1770132 ?auto_1770142 ) ) ( not ( = ?auto_1770132 ?auto_1770143 ) ) ( not ( = ?auto_1770132 ?auto_1770144 ) ) ( not ( = ?auto_1770132 ?auto_1770145 ) ) ( not ( = ?auto_1770132 ?auto_1770147 ) ) ( not ( = ?auto_1770133 ?auto_1770134 ) ) ( not ( = ?auto_1770133 ?auto_1770135 ) ) ( not ( = ?auto_1770133 ?auto_1770136 ) ) ( not ( = ?auto_1770133 ?auto_1770137 ) ) ( not ( = ?auto_1770133 ?auto_1770138 ) ) ( not ( = ?auto_1770133 ?auto_1770139 ) ) ( not ( = ?auto_1770133 ?auto_1770140 ) ) ( not ( = ?auto_1770133 ?auto_1770141 ) ) ( not ( = ?auto_1770133 ?auto_1770142 ) ) ( not ( = ?auto_1770133 ?auto_1770143 ) ) ( not ( = ?auto_1770133 ?auto_1770144 ) ) ( not ( = ?auto_1770133 ?auto_1770145 ) ) ( not ( = ?auto_1770133 ?auto_1770147 ) ) ( not ( = ?auto_1770134 ?auto_1770135 ) ) ( not ( = ?auto_1770134 ?auto_1770136 ) ) ( not ( = ?auto_1770134 ?auto_1770137 ) ) ( not ( = ?auto_1770134 ?auto_1770138 ) ) ( not ( = ?auto_1770134 ?auto_1770139 ) ) ( not ( = ?auto_1770134 ?auto_1770140 ) ) ( not ( = ?auto_1770134 ?auto_1770141 ) ) ( not ( = ?auto_1770134 ?auto_1770142 ) ) ( not ( = ?auto_1770134 ?auto_1770143 ) ) ( not ( = ?auto_1770134 ?auto_1770144 ) ) ( not ( = ?auto_1770134 ?auto_1770145 ) ) ( not ( = ?auto_1770134 ?auto_1770147 ) ) ( not ( = ?auto_1770135 ?auto_1770136 ) ) ( not ( = ?auto_1770135 ?auto_1770137 ) ) ( not ( = ?auto_1770135 ?auto_1770138 ) ) ( not ( = ?auto_1770135 ?auto_1770139 ) ) ( not ( = ?auto_1770135 ?auto_1770140 ) ) ( not ( = ?auto_1770135 ?auto_1770141 ) ) ( not ( = ?auto_1770135 ?auto_1770142 ) ) ( not ( = ?auto_1770135 ?auto_1770143 ) ) ( not ( = ?auto_1770135 ?auto_1770144 ) ) ( not ( = ?auto_1770135 ?auto_1770145 ) ) ( not ( = ?auto_1770135 ?auto_1770147 ) ) ( not ( = ?auto_1770136 ?auto_1770137 ) ) ( not ( = ?auto_1770136 ?auto_1770138 ) ) ( not ( = ?auto_1770136 ?auto_1770139 ) ) ( not ( = ?auto_1770136 ?auto_1770140 ) ) ( not ( = ?auto_1770136 ?auto_1770141 ) ) ( not ( = ?auto_1770136 ?auto_1770142 ) ) ( not ( = ?auto_1770136 ?auto_1770143 ) ) ( not ( = ?auto_1770136 ?auto_1770144 ) ) ( not ( = ?auto_1770136 ?auto_1770145 ) ) ( not ( = ?auto_1770136 ?auto_1770147 ) ) ( not ( = ?auto_1770137 ?auto_1770138 ) ) ( not ( = ?auto_1770137 ?auto_1770139 ) ) ( not ( = ?auto_1770137 ?auto_1770140 ) ) ( not ( = ?auto_1770137 ?auto_1770141 ) ) ( not ( = ?auto_1770137 ?auto_1770142 ) ) ( not ( = ?auto_1770137 ?auto_1770143 ) ) ( not ( = ?auto_1770137 ?auto_1770144 ) ) ( not ( = ?auto_1770137 ?auto_1770145 ) ) ( not ( = ?auto_1770137 ?auto_1770147 ) ) ( not ( = ?auto_1770138 ?auto_1770139 ) ) ( not ( = ?auto_1770138 ?auto_1770140 ) ) ( not ( = ?auto_1770138 ?auto_1770141 ) ) ( not ( = ?auto_1770138 ?auto_1770142 ) ) ( not ( = ?auto_1770138 ?auto_1770143 ) ) ( not ( = ?auto_1770138 ?auto_1770144 ) ) ( not ( = ?auto_1770138 ?auto_1770145 ) ) ( not ( = ?auto_1770138 ?auto_1770147 ) ) ( not ( = ?auto_1770139 ?auto_1770140 ) ) ( not ( = ?auto_1770139 ?auto_1770141 ) ) ( not ( = ?auto_1770139 ?auto_1770142 ) ) ( not ( = ?auto_1770139 ?auto_1770143 ) ) ( not ( = ?auto_1770139 ?auto_1770144 ) ) ( not ( = ?auto_1770139 ?auto_1770145 ) ) ( not ( = ?auto_1770139 ?auto_1770147 ) ) ( not ( = ?auto_1770140 ?auto_1770141 ) ) ( not ( = ?auto_1770140 ?auto_1770142 ) ) ( not ( = ?auto_1770140 ?auto_1770143 ) ) ( not ( = ?auto_1770140 ?auto_1770144 ) ) ( not ( = ?auto_1770140 ?auto_1770145 ) ) ( not ( = ?auto_1770140 ?auto_1770147 ) ) ( not ( = ?auto_1770141 ?auto_1770142 ) ) ( not ( = ?auto_1770141 ?auto_1770143 ) ) ( not ( = ?auto_1770141 ?auto_1770144 ) ) ( not ( = ?auto_1770141 ?auto_1770145 ) ) ( not ( = ?auto_1770141 ?auto_1770147 ) ) ( not ( = ?auto_1770142 ?auto_1770143 ) ) ( not ( = ?auto_1770142 ?auto_1770144 ) ) ( not ( = ?auto_1770142 ?auto_1770145 ) ) ( not ( = ?auto_1770142 ?auto_1770147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1770143 ?auto_1770144 ?auto_1770145 )
      ( MAKE-14CRATE-VERIFY ?auto_1770131 ?auto_1770132 ?auto_1770133 ?auto_1770134 ?auto_1770135 ?auto_1770136 ?auto_1770137 ?auto_1770138 ?auto_1770139 ?auto_1770140 ?auto_1770141 ?auto_1770142 ?auto_1770143 ?auto_1770144 ?auto_1770145 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787292 - SURFACE
      ?auto_1787293 - SURFACE
      ?auto_1787294 - SURFACE
      ?auto_1787295 - SURFACE
      ?auto_1787296 - SURFACE
      ?auto_1787297 - SURFACE
      ?auto_1787298 - SURFACE
      ?auto_1787299 - SURFACE
      ?auto_1787300 - SURFACE
      ?auto_1787301 - SURFACE
      ?auto_1787302 - SURFACE
      ?auto_1787303 - SURFACE
      ?auto_1787304 - SURFACE
      ?auto_1787305 - SURFACE
      ?auto_1787306 - SURFACE
      ?auto_1787307 - SURFACE
    )
    :vars
    (
      ?auto_1787309 - HOIST
      ?auto_1787308 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787309 ?auto_1787308 ) ( SURFACE-AT ?auto_1787306 ?auto_1787308 ) ( CLEAR ?auto_1787306 ) ( LIFTING ?auto_1787309 ?auto_1787307 ) ( IS-CRATE ?auto_1787307 ) ( not ( = ?auto_1787306 ?auto_1787307 ) ) ( ON ?auto_1787293 ?auto_1787292 ) ( ON ?auto_1787294 ?auto_1787293 ) ( ON ?auto_1787295 ?auto_1787294 ) ( ON ?auto_1787296 ?auto_1787295 ) ( ON ?auto_1787297 ?auto_1787296 ) ( ON ?auto_1787298 ?auto_1787297 ) ( ON ?auto_1787299 ?auto_1787298 ) ( ON ?auto_1787300 ?auto_1787299 ) ( ON ?auto_1787301 ?auto_1787300 ) ( ON ?auto_1787302 ?auto_1787301 ) ( ON ?auto_1787303 ?auto_1787302 ) ( ON ?auto_1787304 ?auto_1787303 ) ( ON ?auto_1787305 ?auto_1787304 ) ( ON ?auto_1787306 ?auto_1787305 ) ( not ( = ?auto_1787292 ?auto_1787293 ) ) ( not ( = ?auto_1787292 ?auto_1787294 ) ) ( not ( = ?auto_1787292 ?auto_1787295 ) ) ( not ( = ?auto_1787292 ?auto_1787296 ) ) ( not ( = ?auto_1787292 ?auto_1787297 ) ) ( not ( = ?auto_1787292 ?auto_1787298 ) ) ( not ( = ?auto_1787292 ?auto_1787299 ) ) ( not ( = ?auto_1787292 ?auto_1787300 ) ) ( not ( = ?auto_1787292 ?auto_1787301 ) ) ( not ( = ?auto_1787292 ?auto_1787302 ) ) ( not ( = ?auto_1787292 ?auto_1787303 ) ) ( not ( = ?auto_1787292 ?auto_1787304 ) ) ( not ( = ?auto_1787292 ?auto_1787305 ) ) ( not ( = ?auto_1787292 ?auto_1787306 ) ) ( not ( = ?auto_1787292 ?auto_1787307 ) ) ( not ( = ?auto_1787293 ?auto_1787294 ) ) ( not ( = ?auto_1787293 ?auto_1787295 ) ) ( not ( = ?auto_1787293 ?auto_1787296 ) ) ( not ( = ?auto_1787293 ?auto_1787297 ) ) ( not ( = ?auto_1787293 ?auto_1787298 ) ) ( not ( = ?auto_1787293 ?auto_1787299 ) ) ( not ( = ?auto_1787293 ?auto_1787300 ) ) ( not ( = ?auto_1787293 ?auto_1787301 ) ) ( not ( = ?auto_1787293 ?auto_1787302 ) ) ( not ( = ?auto_1787293 ?auto_1787303 ) ) ( not ( = ?auto_1787293 ?auto_1787304 ) ) ( not ( = ?auto_1787293 ?auto_1787305 ) ) ( not ( = ?auto_1787293 ?auto_1787306 ) ) ( not ( = ?auto_1787293 ?auto_1787307 ) ) ( not ( = ?auto_1787294 ?auto_1787295 ) ) ( not ( = ?auto_1787294 ?auto_1787296 ) ) ( not ( = ?auto_1787294 ?auto_1787297 ) ) ( not ( = ?auto_1787294 ?auto_1787298 ) ) ( not ( = ?auto_1787294 ?auto_1787299 ) ) ( not ( = ?auto_1787294 ?auto_1787300 ) ) ( not ( = ?auto_1787294 ?auto_1787301 ) ) ( not ( = ?auto_1787294 ?auto_1787302 ) ) ( not ( = ?auto_1787294 ?auto_1787303 ) ) ( not ( = ?auto_1787294 ?auto_1787304 ) ) ( not ( = ?auto_1787294 ?auto_1787305 ) ) ( not ( = ?auto_1787294 ?auto_1787306 ) ) ( not ( = ?auto_1787294 ?auto_1787307 ) ) ( not ( = ?auto_1787295 ?auto_1787296 ) ) ( not ( = ?auto_1787295 ?auto_1787297 ) ) ( not ( = ?auto_1787295 ?auto_1787298 ) ) ( not ( = ?auto_1787295 ?auto_1787299 ) ) ( not ( = ?auto_1787295 ?auto_1787300 ) ) ( not ( = ?auto_1787295 ?auto_1787301 ) ) ( not ( = ?auto_1787295 ?auto_1787302 ) ) ( not ( = ?auto_1787295 ?auto_1787303 ) ) ( not ( = ?auto_1787295 ?auto_1787304 ) ) ( not ( = ?auto_1787295 ?auto_1787305 ) ) ( not ( = ?auto_1787295 ?auto_1787306 ) ) ( not ( = ?auto_1787295 ?auto_1787307 ) ) ( not ( = ?auto_1787296 ?auto_1787297 ) ) ( not ( = ?auto_1787296 ?auto_1787298 ) ) ( not ( = ?auto_1787296 ?auto_1787299 ) ) ( not ( = ?auto_1787296 ?auto_1787300 ) ) ( not ( = ?auto_1787296 ?auto_1787301 ) ) ( not ( = ?auto_1787296 ?auto_1787302 ) ) ( not ( = ?auto_1787296 ?auto_1787303 ) ) ( not ( = ?auto_1787296 ?auto_1787304 ) ) ( not ( = ?auto_1787296 ?auto_1787305 ) ) ( not ( = ?auto_1787296 ?auto_1787306 ) ) ( not ( = ?auto_1787296 ?auto_1787307 ) ) ( not ( = ?auto_1787297 ?auto_1787298 ) ) ( not ( = ?auto_1787297 ?auto_1787299 ) ) ( not ( = ?auto_1787297 ?auto_1787300 ) ) ( not ( = ?auto_1787297 ?auto_1787301 ) ) ( not ( = ?auto_1787297 ?auto_1787302 ) ) ( not ( = ?auto_1787297 ?auto_1787303 ) ) ( not ( = ?auto_1787297 ?auto_1787304 ) ) ( not ( = ?auto_1787297 ?auto_1787305 ) ) ( not ( = ?auto_1787297 ?auto_1787306 ) ) ( not ( = ?auto_1787297 ?auto_1787307 ) ) ( not ( = ?auto_1787298 ?auto_1787299 ) ) ( not ( = ?auto_1787298 ?auto_1787300 ) ) ( not ( = ?auto_1787298 ?auto_1787301 ) ) ( not ( = ?auto_1787298 ?auto_1787302 ) ) ( not ( = ?auto_1787298 ?auto_1787303 ) ) ( not ( = ?auto_1787298 ?auto_1787304 ) ) ( not ( = ?auto_1787298 ?auto_1787305 ) ) ( not ( = ?auto_1787298 ?auto_1787306 ) ) ( not ( = ?auto_1787298 ?auto_1787307 ) ) ( not ( = ?auto_1787299 ?auto_1787300 ) ) ( not ( = ?auto_1787299 ?auto_1787301 ) ) ( not ( = ?auto_1787299 ?auto_1787302 ) ) ( not ( = ?auto_1787299 ?auto_1787303 ) ) ( not ( = ?auto_1787299 ?auto_1787304 ) ) ( not ( = ?auto_1787299 ?auto_1787305 ) ) ( not ( = ?auto_1787299 ?auto_1787306 ) ) ( not ( = ?auto_1787299 ?auto_1787307 ) ) ( not ( = ?auto_1787300 ?auto_1787301 ) ) ( not ( = ?auto_1787300 ?auto_1787302 ) ) ( not ( = ?auto_1787300 ?auto_1787303 ) ) ( not ( = ?auto_1787300 ?auto_1787304 ) ) ( not ( = ?auto_1787300 ?auto_1787305 ) ) ( not ( = ?auto_1787300 ?auto_1787306 ) ) ( not ( = ?auto_1787300 ?auto_1787307 ) ) ( not ( = ?auto_1787301 ?auto_1787302 ) ) ( not ( = ?auto_1787301 ?auto_1787303 ) ) ( not ( = ?auto_1787301 ?auto_1787304 ) ) ( not ( = ?auto_1787301 ?auto_1787305 ) ) ( not ( = ?auto_1787301 ?auto_1787306 ) ) ( not ( = ?auto_1787301 ?auto_1787307 ) ) ( not ( = ?auto_1787302 ?auto_1787303 ) ) ( not ( = ?auto_1787302 ?auto_1787304 ) ) ( not ( = ?auto_1787302 ?auto_1787305 ) ) ( not ( = ?auto_1787302 ?auto_1787306 ) ) ( not ( = ?auto_1787302 ?auto_1787307 ) ) ( not ( = ?auto_1787303 ?auto_1787304 ) ) ( not ( = ?auto_1787303 ?auto_1787305 ) ) ( not ( = ?auto_1787303 ?auto_1787306 ) ) ( not ( = ?auto_1787303 ?auto_1787307 ) ) ( not ( = ?auto_1787304 ?auto_1787305 ) ) ( not ( = ?auto_1787304 ?auto_1787306 ) ) ( not ( = ?auto_1787304 ?auto_1787307 ) ) ( not ( = ?auto_1787305 ?auto_1787306 ) ) ( not ( = ?auto_1787305 ?auto_1787307 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1787306 ?auto_1787307 )
      ( MAKE-15CRATE-VERIFY ?auto_1787292 ?auto_1787293 ?auto_1787294 ?auto_1787295 ?auto_1787296 ?auto_1787297 ?auto_1787298 ?auto_1787299 ?auto_1787300 ?auto_1787301 ?auto_1787302 ?auto_1787303 ?auto_1787304 ?auto_1787305 ?auto_1787306 ?auto_1787307 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787471 - SURFACE
      ?auto_1787472 - SURFACE
      ?auto_1787473 - SURFACE
      ?auto_1787474 - SURFACE
      ?auto_1787475 - SURFACE
      ?auto_1787476 - SURFACE
      ?auto_1787477 - SURFACE
      ?auto_1787478 - SURFACE
      ?auto_1787479 - SURFACE
      ?auto_1787480 - SURFACE
      ?auto_1787481 - SURFACE
      ?auto_1787482 - SURFACE
      ?auto_1787483 - SURFACE
      ?auto_1787484 - SURFACE
      ?auto_1787485 - SURFACE
      ?auto_1787486 - SURFACE
    )
    :vars
    (
      ?auto_1787489 - HOIST
      ?auto_1787487 - PLACE
      ?auto_1787488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787489 ?auto_1787487 ) ( SURFACE-AT ?auto_1787485 ?auto_1787487 ) ( CLEAR ?auto_1787485 ) ( IS-CRATE ?auto_1787486 ) ( not ( = ?auto_1787485 ?auto_1787486 ) ) ( TRUCK-AT ?auto_1787488 ?auto_1787487 ) ( AVAILABLE ?auto_1787489 ) ( IN ?auto_1787486 ?auto_1787488 ) ( ON ?auto_1787485 ?auto_1787484 ) ( not ( = ?auto_1787484 ?auto_1787485 ) ) ( not ( = ?auto_1787484 ?auto_1787486 ) ) ( ON ?auto_1787472 ?auto_1787471 ) ( ON ?auto_1787473 ?auto_1787472 ) ( ON ?auto_1787474 ?auto_1787473 ) ( ON ?auto_1787475 ?auto_1787474 ) ( ON ?auto_1787476 ?auto_1787475 ) ( ON ?auto_1787477 ?auto_1787476 ) ( ON ?auto_1787478 ?auto_1787477 ) ( ON ?auto_1787479 ?auto_1787478 ) ( ON ?auto_1787480 ?auto_1787479 ) ( ON ?auto_1787481 ?auto_1787480 ) ( ON ?auto_1787482 ?auto_1787481 ) ( ON ?auto_1787483 ?auto_1787482 ) ( ON ?auto_1787484 ?auto_1787483 ) ( not ( = ?auto_1787471 ?auto_1787472 ) ) ( not ( = ?auto_1787471 ?auto_1787473 ) ) ( not ( = ?auto_1787471 ?auto_1787474 ) ) ( not ( = ?auto_1787471 ?auto_1787475 ) ) ( not ( = ?auto_1787471 ?auto_1787476 ) ) ( not ( = ?auto_1787471 ?auto_1787477 ) ) ( not ( = ?auto_1787471 ?auto_1787478 ) ) ( not ( = ?auto_1787471 ?auto_1787479 ) ) ( not ( = ?auto_1787471 ?auto_1787480 ) ) ( not ( = ?auto_1787471 ?auto_1787481 ) ) ( not ( = ?auto_1787471 ?auto_1787482 ) ) ( not ( = ?auto_1787471 ?auto_1787483 ) ) ( not ( = ?auto_1787471 ?auto_1787484 ) ) ( not ( = ?auto_1787471 ?auto_1787485 ) ) ( not ( = ?auto_1787471 ?auto_1787486 ) ) ( not ( = ?auto_1787472 ?auto_1787473 ) ) ( not ( = ?auto_1787472 ?auto_1787474 ) ) ( not ( = ?auto_1787472 ?auto_1787475 ) ) ( not ( = ?auto_1787472 ?auto_1787476 ) ) ( not ( = ?auto_1787472 ?auto_1787477 ) ) ( not ( = ?auto_1787472 ?auto_1787478 ) ) ( not ( = ?auto_1787472 ?auto_1787479 ) ) ( not ( = ?auto_1787472 ?auto_1787480 ) ) ( not ( = ?auto_1787472 ?auto_1787481 ) ) ( not ( = ?auto_1787472 ?auto_1787482 ) ) ( not ( = ?auto_1787472 ?auto_1787483 ) ) ( not ( = ?auto_1787472 ?auto_1787484 ) ) ( not ( = ?auto_1787472 ?auto_1787485 ) ) ( not ( = ?auto_1787472 ?auto_1787486 ) ) ( not ( = ?auto_1787473 ?auto_1787474 ) ) ( not ( = ?auto_1787473 ?auto_1787475 ) ) ( not ( = ?auto_1787473 ?auto_1787476 ) ) ( not ( = ?auto_1787473 ?auto_1787477 ) ) ( not ( = ?auto_1787473 ?auto_1787478 ) ) ( not ( = ?auto_1787473 ?auto_1787479 ) ) ( not ( = ?auto_1787473 ?auto_1787480 ) ) ( not ( = ?auto_1787473 ?auto_1787481 ) ) ( not ( = ?auto_1787473 ?auto_1787482 ) ) ( not ( = ?auto_1787473 ?auto_1787483 ) ) ( not ( = ?auto_1787473 ?auto_1787484 ) ) ( not ( = ?auto_1787473 ?auto_1787485 ) ) ( not ( = ?auto_1787473 ?auto_1787486 ) ) ( not ( = ?auto_1787474 ?auto_1787475 ) ) ( not ( = ?auto_1787474 ?auto_1787476 ) ) ( not ( = ?auto_1787474 ?auto_1787477 ) ) ( not ( = ?auto_1787474 ?auto_1787478 ) ) ( not ( = ?auto_1787474 ?auto_1787479 ) ) ( not ( = ?auto_1787474 ?auto_1787480 ) ) ( not ( = ?auto_1787474 ?auto_1787481 ) ) ( not ( = ?auto_1787474 ?auto_1787482 ) ) ( not ( = ?auto_1787474 ?auto_1787483 ) ) ( not ( = ?auto_1787474 ?auto_1787484 ) ) ( not ( = ?auto_1787474 ?auto_1787485 ) ) ( not ( = ?auto_1787474 ?auto_1787486 ) ) ( not ( = ?auto_1787475 ?auto_1787476 ) ) ( not ( = ?auto_1787475 ?auto_1787477 ) ) ( not ( = ?auto_1787475 ?auto_1787478 ) ) ( not ( = ?auto_1787475 ?auto_1787479 ) ) ( not ( = ?auto_1787475 ?auto_1787480 ) ) ( not ( = ?auto_1787475 ?auto_1787481 ) ) ( not ( = ?auto_1787475 ?auto_1787482 ) ) ( not ( = ?auto_1787475 ?auto_1787483 ) ) ( not ( = ?auto_1787475 ?auto_1787484 ) ) ( not ( = ?auto_1787475 ?auto_1787485 ) ) ( not ( = ?auto_1787475 ?auto_1787486 ) ) ( not ( = ?auto_1787476 ?auto_1787477 ) ) ( not ( = ?auto_1787476 ?auto_1787478 ) ) ( not ( = ?auto_1787476 ?auto_1787479 ) ) ( not ( = ?auto_1787476 ?auto_1787480 ) ) ( not ( = ?auto_1787476 ?auto_1787481 ) ) ( not ( = ?auto_1787476 ?auto_1787482 ) ) ( not ( = ?auto_1787476 ?auto_1787483 ) ) ( not ( = ?auto_1787476 ?auto_1787484 ) ) ( not ( = ?auto_1787476 ?auto_1787485 ) ) ( not ( = ?auto_1787476 ?auto_1787486 ) ) ( not ( = ?auto_1787477 ?auto_1787478 ) ) ( not ( = ?auto_1787477 ?auto_1787479 ) ) ( not ( = ?auto_1787477 ?auto_1787480 ) ) ( not ( = ?auto_1787477 ?auto_1787481 ) ) ( not ( = ?auto_1787477 ?auto_1787482 ) ) ( not ( = ?auto_1787477 ?auto_1787483 ) ) ( not ( = ?auto_1787477 ?auto_1787484 ) ) ( not ( = ?auto_1787477 ?auto_1787485 ) ) ( not ( = ?auto_1787477 ?auto_1787486 ) ) ( not ( = ?auto_1787478 ?auto_1787479 ) ) ( not ( = ?auto_1787478 ?auto_1787480 ) ) ( not ( = ?auto_1787478 ?auto_1787481 ) ) ( not ( = ?auto_1787478 ?auto_1787482 ) ) ( not ( = ?auto_1787478 ?auto_1787483 ) ) ( not ( = ?auto_1787478 ?auto_1787484 ) ) ( not ( = ?auto_1787478 ?auto_1787485 ) ) ( not ( = ?auto_1787478 ?auto_1787486 ) ) ( not ( = ?auto_1787479 ?auto_1787480 ) ) ( not ( = ?auto_1787479 ?auto_1787481 ) ) ( not ( = ?auto_1787479 ?auto_1787482 ) ) ( not ( = ?auto_1787479 ?auto_1787483 ) ) ( not ( = ?auto_1787479 ?auto_1787484 ) ) ( not ( = ?auto_1787479 ?auto_1787485 ) ) ( not ( = ?auto_1787479 ?auto_1787486 ) ) ( not ( = ?auto_1787480 ?auto_1787481 ) ) ( not ( = ?auto_1787480 ?auto_1787482 ) ) ( not ( = ?auto_1787480 ?auto_1787483 ) ) ( not ( = ?auto_1787480 ?auto_1787484 ) ) ( not ( = ?auto_1787480 ?auto_1787485 ) ) ( not ( = ?auto_1787480 ?auto_1787486 ) ) ( not ( = ?auto_1787481 ?auto_1787482 ) ) ( not ( = ?auto_1787481 ?auto_1787483 ) ) ( not ( = ?auto_1787481 ?auto_1787484 ) ) ( not ( = ?auto_1787481 ?auto_1787485 ) ) ( not ( = ?auto_1787481 ?auto_1787486 ) ) ( not ( = ?auto_1787482 ?auto_1787483 ) ) ( not ( = ?auto_1787482 ?auto_1787484 ) ) ( not ( = ?auto_1787482 ?auto_1787485 ) ) ( not ( = ?auto_1787482 ?auto_1787486 ) ) ( not ( = ?auto_1787483 ?auto_1787484 ) ) ( not ( = ?auto_1787483 ?auto_1787485 ) ) ( not ( = ?auto_1787483 ?auto_1787486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787484 ?auto_1787485 ?auto_1787486 )
      ( MAKE-15CRATE-VERIFY ?auto_1787471 ?auto_1787472 ?auto_1787473 ?auto_1787474 ?auto_1787475 ?auto_1787476 ?auto_1787477 ?auto_1787478 ?auto_1787479 ?auto_1787480 ?auto_1787481 ?auto_1787482 ?auto_1787483 ?auto_1787484 ?auto_1787485 ?auto_1787486 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787666 - SURFACE
      ?auto_1787667 - SURFACE
      ?auto_1787668 - SURFACE
      ?auto_1787669 - SURFACE
      ?auto_1787670 - SURFACE
      ?auto_1787671 - SURFACE
      ?auto_1787672 - SURFACE
      ?auto_1787673 - SURFACE
      ?auto_1787674 - SURFACE
      ?auto_1787675 - SURFACE
      ?auto_1787676 - SURFACE
      ?auto_1787677 - SURFACE
      ?auto_1787678 - SURFACE
      ?auto_1787679 - SURFACE
      ?auto_1787680 - SURFACE
      ?auto_1787681 - SURFACE
    )
    :vars
    (
      ?auto_1787683 - HOIST
      ?auto_1787684 - PLACE
      ?auto_1787682 - TRUCK
      ?auto_1787685 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787683 ?auto_1787684 ) ( SURFACE-AT ?auto_1787680 ?auto_1787684 ) ( CLEAR ?auto_1787680 ) ( IS-CRATE ?auto_1787681 ) ( not ( = ?auto_1787680 ?auto_1787681 ) ) ( AVAILABLE ?auto_1787683 ) ( IN ?auto_1787681 ?auto_1787682 ) ( ON ?auto_1787680 ?auto_1787679 ) ( not ( = ?auto_1787679 ?auto_1787680 ) ) ( not ( = ?auto_1787679 ?auto_1787681 ) ) ( TRUCK-AT ?auto_1787682 ?auto_1787685 ) ( not ( = ?auto_1787685 ?auto_1787684 ) ) ( ON ?auto_1787667 ?auto_1787666 ) ( ON ?auto_1787668 ?auto_1787667 ) ( ON ?auto_1787669 ?auto_1787668 ) ( ON ?auto_1787670 ?auto_1787669 ) ( ON ?auto_1787671 ?auto_1787670 ) ( ON ?auto_1787672 ?auto_1787671 ) ( ON ?auto_1787673 ?auto_1787672 ) ( ON ?auto_1787674 ?auto_1787673 ) ( ON ?auto_1787675 ?auto_1787674 ) ( ON ?auto_1787676 ?auto_1787675 ) ( ON ?auto_1787677 ?auto_1787676 ) ( ON ?auto_1787678 ?auto_1787677 ) ( ON ?auto_1787679 ?auto_1787678 ) ( not ( = ?auto_1787666 ?auto_1787667 ) ) ( not ( = ?auto_1787666 ?auto_1787668 ) ) ( not ( = ?auto_1787666 ?auto_1787669 ) ) ( not ( = ?auto_1787666 ?auto_1787670 ) ) ( not ( = ?auto_1787666 ?auto_1787671 ) ) ( not ( = ?auto_1787666 ?auto_1787672 ) ) ( not ( = ?auto_1787666 ?auto_1787673 ) ) ( not ( = ?auto_1787666 ?auto_1787674 ) ) ( not ( = ?auto_1787666 ?auto_1787675 ) ) ( not ( = ?auto_1787666 ?auto_1787676 ) ) ( not ( = ?auto_1787666 ?auto_1787677 ) ) ( not ( = ?auto_1787666 ?auto_1787678 ) ) ( not ( = ?auto_1787666 ?auto_1787679 ) ) ( not ( = ?auto_1787666 ?auto_1787680 ) ) ( not ( = ?auto_1787666 ?auto_1787681 ) ) ( not ( = ?auto_1787667 ?auto_1787668 ) ) ( not ( = ?auto_1787667 ?auto_1787669 ) ) ( not ( = ?auto_1787667 ?auto_1787670 ) ) ( not ( = ?auto_1787667 ?auto_1787671 ) ) ( not ( = ?auto_1787667 ?auto_1787672 ) ) ( not ( = ?auto_1787667 ?auto_1787673 ) ) ( not ( = ?auto_1787667 ?auto_1787674 ) ) ( not ( = ?auto_1787667 ?auto_1787675 ) ) ( not ( = ?auto_1787667 ?auto_1787676 ) ) ( not ( = ?auto_1787667 ?auto_1787677 ) ) ( not ( = ?auto_1787667 ?auto_1787678 ) ) ( not ( = ?auto_1787667 ?auto_1787679 ) ) ( not ( = ?auto_1787667 ?auto_1787680 ) ) ( not ( = ?auto_1787667 ?auto_1787681 ) ) ( not ( = ?auto_1787668 ?auto_1787669 ) ) ( not ( = ?auto_1787668 ?auto_1787670 ) ) ( not ( = ?auto_1787668 ?auto_1787671 ) ) ( not ( = ?auto_1787668 ?auto_1787672 ) ) ( not ( = ?auto_1787668 ?auto_1787673 ) ) ( not ( = ?auto_1787668 ?auto_1787674 ) ) ( not ( = ?auto_1787668 ?auto_1787675 ) ) ( not ( = ?auto_1787668 ?auto_1787676 ) ) ( not ( = ?auto_1787668 ?auto_1787677 ) ) ( not ( = ?auto_1787668 ?auto_1787678 ) ) ( not ( = ?auto_1787668 ?auto_1787679 ) ) ( not ( = ?auto_1787668 ?auto_1787680 ) ) ( not ( = ?auto_1787668 ?auto_1787681 ) ) ( not ( = ?auto_1787669 ?auto_1787670 ) ) ( not ( = ?auto_1787669 ?auto_1787671 ) ) ( not ( = ?auto_1787669 ?auto_1787672 ) ) ( not ( = ?auto_1787669 ?auto_1787673 ) ) ( not ( = ?auto_1787669 ?auto_1787674 ) ) ( not ( = ?auto_1787669 ?auto_1787675 ) ) ( not ( = ?auto_1787669 ?auto_1787676 ) ) ( not ( = ?auto_1787669 ?auto_1787677 ) ) ( not ( = ?auto_1787669 ?auto_1787678 ) ) ( not ( = ?auto_1787669 ?auto_1787679 ) ) ( not ( = ?auto_1787669 ?auto_1787680 ) ) ( not ( = ?auto_1787669 ?auto_1787681 ) ) ( not ( = ?auto_1787670 ?auto_1787671 ) ) ( not ( = ?auto_1787670 ?auto_1787672 ) ) ( not ( = ?auto_1787670 ?auto_1787673 ) ) ( not ( = ?auto_1787670 ?auto_1787674 ) ) ( not ( = ?auto_1787670 ?auto_1787675 ) ) ( not ( = ?auto_1787670 ?auto_1787676 ) ) ( not ( = ?auto_1787670 ?auto_1787677 ) ) ( not ( = ?auto_1787670 ?auto_1787678 ) ) ( not ( = ?auto_1787670 ?auto_1787679 ) ) ( not ( = ?auto_1787670 ?auto_1787680 ) ) ( not ( = ?auto_1787670 ?auto_1787681 ) ) ( not ( = ?auto_1787671 ?auto_1787672 ) ) ( not ( = ?auto_1787671 ?auto_1787673 ) ) ( not ( = ?auto_1787671 ?auto_1787674 ) ) ( not ( = ?auto_1787671 ?auto_1787675 ) ) ( not ( = ?auto_1787671 ?auto_1787676 ) ) ( not ( = ?auto_1787671 ?auto_1787677 ) ) ( not ( = ?auto_1787671 ?auto_1787678 ) ) ( not ( = ?auto_1787671 ?auto_1787679 ) ) ( not ( = ?auto_1787671 ?auto_1787680 ) ) ( not ( = ?auto_1787671 ?auto_1787681 ) ) ( not ( = ?auto_1787672 ?auto_1787673 ) ) ( not ( = ?auto_1787672 ?auto_1787674 ) ) ( not ( = ?auto_1787672 ?auto_1787675 ) ) ( not ( = ?auto_1787672 ?auto_1787676 ) ) ( not ( = ?auto_1787672 ?auto_1787677 ) ) ( not ( = ?auto_1787672 ?auto_1787678 ) ) ( not ( = ?auto_1787672 ?auto_1787679 ) ) ( not ( = ?auto_1787672 ?auto_1787680 ) ) ( not ( = ?auto_1787672 ?auto_1787681 ) ) ( not ( = ?auto_1787673 ?auto_1787674 ) ) ( not ( = ?auto_1787673 ?auto_1787675 ) ) ( not ( = ?auto_1787673 ?auto_1787676 ) ) ( not ( = ?auto_1787673 ?auto_1787677 ) ) ( not ( = ?auto_1787673 ?auto_1787678 ) ) ( not ( = ?auto_1787673 ?auto_1787679 ) ) ( not ( = ?auto_1787673 ?auto_1787680 ) ) ( not ( = ?auto_1787673 ?auto_1787681 ) ) ( not ( = ?auto_1787674 ?auto_1787675 ) ) ( not ( = ?auto_1787674 ?auto_1787676 ) ) ( not ( = ?auto_1787674 ?auto_1787677 ) ) ( not ( = ?auto_1787674 ?auto_1787678 ) ) ( not ( = ?auto_1787674 ?auto_1787679 ) ) ( not ( = ?auto_1787674 ?auto_1787680 ) ) ( not ( = ?auto_1787674 ?auto_1787681 ) ) ( not ( = ?auto_1787675 ?auto_1787676 ) ) ( not ( = ?auto_1787675 ?auto_1787677 ) ) ( not ( = ?auto_1787675 ?auto_1787678 ) ) ( not ( = ?auto_1787675 ?auto_1787679 ) ) ( not ( = ?auto_1787675 ?auto_1787680 ) ) ( not ( = ?auto_1787675 ?auto_1787681 ) ) ( not ( = ?auto_1787676 ?auto_1787677 ) ) ( not ( = ?auto_1787676 ?auto_1787678 ) ) ( not ( = ?auto_1787676 ?auto_1787679 ) ) ( not ( = ?auto_1787676 ?auto_1787680 ) ) ( not ( = ?auto_1787676 ?auto_1787681 ) ) ( not ( = ?auto_1787677 ?auto_1787678 ) ) ( not ( = ?auto_1787677 ?auto_1787679 ) ) ( not ( = ?auto_1787677 ?auto_1787680 ) ) ( not ( = ?auto_1787677 ?auto_1787681 ) ) ( not ( = ?auto_1787678 ?auto_1787679 ) ) ( not ( = ?auto_1787678 ?auto_1787680 ) ) ( not ( = ?auto_1787678 ?auto_1787681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787679 ?auto_1787680 ?auto_1787681 )
      ( MAKE-15CRATE-VERIFY ?auto_1787666 ?auto_1787667 ?auto_1787668 ?auto_1787669 ?auto_1787670 ?auto_1787671 ?auto_1787672 ?auto_1787673 ?auto_1787674 ?auto_1787675 ?auto_1787676 ?auto_1787677 ?auto_1787678 ?auto_1787679 ?auto_1787680 ?auto_1787681 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1787876 - SURFACE
      ?auto_1787877 - SURFACE
      ?auto_1787878 - SURFACE
      ?auto_1787879 - SURFACE
      ?auto_1787880 - SURFACE
      ?auto_1787881 - SURFACE
      ?auto_1787882 - SURFACE
      ?auto_1787883 - SURFACE
      ?auto_1787884 - SURFACE
      ?auto_1787885 - SURFACE
      ?auto_1787886 - SURFACE
      ?auto_1787887 - SURFACE
      ?auto_1787888 - SURFACE
      ?auto_1787889 - SURFACE
      ?auto_1787890 - SURFACE
      ?auto_1787891 - SURFACE
    )
    :vars
    (
      ?auto_1787893 - HOIST
      ?auto_1787894 - PLACE
      ?auto_1787892 - TRUCK
      ?auto_1787895 - PLACE
      ?auto_1787896 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1787893 ?auto_1787894 ) ( SURFACE-AT ?auto_1787890 ?auto_1787894 ) ( CLEAR ?auto_1787890 ) ( IS-CRATE ?auto_1787891 ) ( not ( = ?auto_1787890 ?auto_1787891 ) ) ( AVAILABLE ?auto_1787893 ) ( ON ?auto_1787890 ?auto_1787889 ) ( not ( = ?auto_1787889 ?auto_1787890 ) ) ( not ( = ?auto_1787889 ?auto_1787891 ) ) ( TRUCK-AT ?auto_1787892 ?auto_1787895 ) ( not ( = ?auto_1787895 ?auto_1787894 ) ) ( HOIST-AT ?auto_1787896 ?auto_1787895 ) ( LIFTING ?auto_1787896 ?auto_1787891 ) ( not ( = ?auto_1787893 ?auto_1787896 ) ) ( ON ?auto_1787877 ?auto_1787876 ) ( ON ?auto_1787878 ?auto_1787877 ) ( ON ?auto_1787879 ?auto_1787878 ) ( ON ?auto_1787880 ?auto_1787879 ) ( ON ?auto_1787881 ?auto_1787880 ) ( ON ?auto_1787882 ?auto_1787881 ) ( ON ?auto_1787883 ?auto_1787882 ) ( ON ?auto_1787884 ?auto_1787883 ) ( ON ?auto_1787885 ?auto_1787884 ) ( ON ?auto_1787886 ?auto_1787885 ) ( ON ?auto_1787887 ?auto_1787886 ) ( ON ?auto_1787888 ?auto_1787887 ) ( ON ?auto_1787889 ?auto_1787888 ) ( not ( = ?auto_1787876 ?auto_1787877 ) ) ( not ( = ?auto_1787876 ?auto_1787878 ) ) ( not ( = ?auto_1787876 ?auto_1787879 ) ) ( not ( = ?auto_1787876 ?auto_1787880 ) ) ( not ( = ?auto_1787876 ?auto_1787881 ) ) ( not ( = ?auto_1787876 ?auto_1787882 ) ) ( not ( = ?auto_1787876 ?auto_1787883 ) ) ( not ( = ?auto_1787876 ?auto_1787884 ) ) ( not ( = ?auto_1787876 ?auto_1787885 ) ) ( not ( = ?auto_1787876 ?auto_1787886 ) ) ( not ( = ?auto_1787876 ?auto_1787887 ) ) ( not ( = ?auto_1787876 ?auto_1787888 ) ) ( not ( = ?auto_1787876 ?auto_1787889 ) ) ( not ( = ?auto_1787876 ?auto_1787890 ) ) ( not ( = ?auto_1787876 ?auto_1787891 ) ) ( not ( = ?auto_1787877 ?auto_1787878 ) ) ( not ( = ?auto_1787877 ?auto_1787879 ) ) ( not ( = ?auto_1787877 ?auto_1787880 ) ) ( not ( = ?auto_1787877 ?auto_1787881 ) ) ( not ( = ?auto_1787877 ?auto_1787882 ) ) ( not ( = ?auto_1787877 ?auto_1787883 ) ) ( not ( = ?auto_1787877 ?auto_1787884 ) ) ( not ( = ?auto_1787877 ?auto_1787885 ) ) ( not ( = ?auto_1787877 ?auto_1787886 ) ) ( not ( = ?auto_1787877 ?auto_1787887 ) ) ( not ( = ?auto_1787877 ?auto_1787888 ) ) ( not ( = ?auto_1787877 ?auto_1787889 ) ) ( not ( = ?auto_1787877 ?auto_1787890 ) ) ( not ( = ?auto_1787877 ?auto_1787891 ) ) ( not ( = ?auto_1787878 ?auto_1787879 ) ) ( not ( = ?auto_1787878 ?auto_1787880 ) ) ( not ( = ?auto_1787878 ?auto_1787881 ) ) ( not ( = ?auto_1787878 ?auto_1787882 ) ) ( not ( = ?auto_1787878 ?auto_1787883 ) ) ( not ( = ?auto_1787878 ?auto_1787884 ) ) ( not ( = ?auto_1787878 ?auto_1787885 ) ) ( not ( = ?auto_1787878 ?auto_1787886 ) ) ( not ( = ?auto_1787878 ?auto_1787887 ) ) ( not ( = ?auto_1787878 ?auto_1787888 ) ) ( not ( = ?auto_1787878 ?auto_1787889 ) ) ( not ( = ?auto_1787878 ?auto_1787890 ) ) ( not ( = ?auto_1787878 ?auto_1787891 ) ) ( not ( = ?auto_1787879 ?auto_1787880 ) ) ( not ( = ?auto_1787879 ?auto_1787881 ) ) ( not ( = ?auto_1787879 ?auto_1787882 ) ) ( not ( = ?auto_1787879 ?auto_1787883 ) ) ( not ( = ?auto_1787879 ?auto_1787884 ) ) ( not ( = ?auto_1787879 ?auto_1787885 ) ) ( not ( = ?auto_1787879 ?auto_1787886 ) ) ( not ( = ?auto_1787879 ?auto_1787887 ) ) ( not ( = ?auto_1787879 ?auto_1787888 ) ) ( not ( = ?auto_1787879 ?auto_1787889 ) ) ( not ( = ?auto_1787879 ?auto_1787890 ) ) ( not ( = ?auto_1787879 ?auto_1787891 ) ) ( not ( = ?auto_1787880 ?auto_1787881 ) ) ( not ( = ?auto_1787880 ?auto_1787882 ) ) ( not ( = ?auto_1787880 ?auto_1787883 ) ) ( not ( = ?auto_1787880 ?auto_1787884 ) ) ( not ( = ?auto_1787880 ?auto_1787885 ) ) ( not ( = ?auto_1787880 ?auto_1787886 ) ) ( not ( = ?auto_1787880 ?auto_1787887 ) ) ( not ( = ?auto_1787880 ?auto_1787888 ) ) ( not ( = ?auto_1787880 ?auto_1787889 ) ) ( not ( = ?auto_1787880 ?auto_1787890 ) ) ( not ( = ?auto_1787880 ?auto_1787891 ) ) ( not ( = ?auto_1787881 ?auto_1787882 ) ) ( not ( = ?auto_1787881 ?auto_1787883 ) ) ( not ( = ?auto_1787881 ?auto_1787884 ) ) ( not ( = ?auto_1787881 ?auto_1787885 ) ) ( not ( = ?auto_1787881 ?auto_1787886 ) ) ( not ( = ?auto_1787881 ?auto_1787887 ) ) ( not ( = ?auto_1787881 ?auto_1787888 ) ) ( not ( = ?auto_1787881 ?auto_1787889 ) ) ( not ( = ?auto_1787881 ?auto_1787890 ) ) ( not ( = ?auto_1787881 ?auto_1787891 ) ) ( not ( = ?auto_1787882 ?auto_1787883 ) ) ( not ( = ?auto_1787882 ?auto_1787884 ) ) ( not ( = ?auto_1787882 ?auto_1787885 ) ) ( not ( = ?auto_1787882 ?auto_1787886 ) ) ( not ( = ?auto_1787882 ?auto_1787887 ) ) ( not ( = ?auto_1787882 ?auto_1787888 ) ) ( not ( = ?auto_1787882 ?auto_1787889 ) ) ( not ( = ?auto_1787882 ?auto_1787890 ) ) ( not ( = ?auto_1787882 ?auto_1787891 ) ) ( not ( = ?auto_1787883 ?auto_1787884 ) ) ( not ( = ?auto_1787883 ?auto_1787885 ) ) ( not ( = ?auto_1787883 ?auto_1787886 ) ) ( not ( = ?auto_1787883 ?auto_1787887 ) ) ( not ( = ?auto_1787883 ?auto_1787888 ) ) ( not ( = ?auto_1787883 ?auto_1787889 ) ) ( not ( = ?auto_1787883 ?auto_1787890 ) ) ( not ( = ?auto_1787883 ?auto_1787891 ) ) ( not ( = ?auto_1787884 ?auto_1787885 ) ) ( not ( = ?auto_1787884 ?auto_1787886 ) ) ( not ( = ?auto_1787884 ?auto_1787887 ) ) ( not ( = ?auto_1787884 ?auto_1787888 ) ) ( not ( = ?auto_1787884 ?auto_1787889 ) ) ( not ( = ?auto_1787884 ?auto_1787890 ) ) ( not ( = ?auto_1787884 ?auto_1787891 ) ) ( not ( = ?auto_1787885 ?auto_1787886 ) ) ( not ( = ?auto_1787885 ?auto_1787887 ) ) ( not ( = ?auto_1787885 ?auto_1787888 ) ) ( not ( = ?auto_1787885 ?auto_1787889 ) ) ( not ( = ?auto_1787885 ?auto_1787890 ) ) ( not ( = ?auto_1787885 ?auto_1787891 ) ) ( not ( = ?auto_1787886 ?auto_1787887 ) ) ( not ( = ?auto_1787886 ?auto_1787888 ) ) ( not ( = ?auto_1787886 ?auto_1787889 ) ) ( not ( = ?auto_1787886 ?auto_1787890 ) ) ( not ( = ?auto_1787886 ?auto_1787891 ) ) ( not ( = ?auto_1787887 ?auto_1787888 ) ) ( not ( = ?auto_1787887 ?auto_1787889 ) ) ( not ( = ?auto_1787887 ?auto_1787890 ) ) ( not ( = ?auto_1787887 ?auto_1787891 ) ) ( not ( = ?auto_1787888 ?auto_1787889 ) ) ( not ( = ?auto_1787888 ?auto_1787890 ) ) ( not ( = ?auto_1787888 ?auto_1787891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1787889 ?auto_1787890 ?auto_1787891 )
      ( MAKE-15CRATE-VERIFY ?auto_1787876 ?auto_1787877 ?auto_1787878 ?auto_1787879 ?auto_1787880 ?auto_1787881 ?auto_1787882 ?auto_1787883 ?auto_1787884 ?auto_1787885 ?auto_1787886 ?auto_1787887 ?auto_1787888 ?auto_1787889 ?auto_1787890 ?auto_1787891 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788101 - SURFACE
      ?auto_1788102 - SURFACE
      ?auto_1788103 - SURFACE
      ?auto_1788104 - SURFACE
      ?auto_1788105 - SURFACE
      ?auto_1788106 - SURFACE
      ?auto_1788107 - SURFACE
      ?auto_1788108 - SURFACE
      ?auto_1788109 - SURFACE
      ?auto_1788110 - SURFACE
      ?auto_1788111 - SURFACE
      ?auto_1788112 - SURFACE
      ?auto_1788113 - SURFACE
      ?auto_1788114 - SURFACE
      ?auto_1788115 - SURFACE
      ?auto_1788116 - SURFACE
    )
    :vars
    (
      ?auto_1788117 - HOIST
      ?auto_1788120 - PLACE
      ?auto_1788119 - TRUCK
      ?auto_1788118 - PLACE
      ?auto_1788122 - HOIST
      ?auto_1788121 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788117 ?auto_1788120 ) ( SURFACE-AT ?auto_1788115 ?auto_1788120 ) ( CLEAR ?auto_1788115 ) ( IS-CRATE ?auto_1788116 ) ( not ( = ?auto_1788115 ?auto_1788116 ) ) ( AVAILABLE ?auto_1788117 ) ( ON ?auto_1788115 ?auto_1788114 ) ( not ( = ?auto_1788114 ?auto_1788115 ) ) ( not ( = ?auto_1788114 ?auto_1788116 ) ) ( TRUCK-AT ?auto_1788119 ?auto_1788118 ) ( not ( = ?auto_1788118 ?auto_1788120 ) ) ( HOIST-AT ?auto_1788122 ?auto_1788118 ) ( not ( = ?auto_1788117 ?auto_1788122 ) ) ( AVAILABLE ?auto_1788122 ) ( SURFACE-AT ?auto_1788116 ?auto_1788118 ) ( ON ?auto_1788116 ?auto_1788121 ) ( CLEAR ?auto_1788116 ) ( not ( = ?auto_1788115 ?auto_1788121 ) ) ( not ( = ?auto_1788116 ?auto_1788121 ) ) ( not ( = ?auto_1788114 ?auto_1788121 ) ) ( ON ?auto_1788102 ?auto_1788101 ) ( ON ?auto_1788103 ?auto_1788102 ) ( ON ?auto_1788104 ?auto_1788103 ) ( ON ?auto_1788105 ?auto_1788104 ) ( ON ?auto_1788106 ?auto_1788105 ) ( ON ?auto_1788107 ?auto_1788106 ) ( ON ?auto_1788108 ?auto_1788107 ) ( ON ?auto_1788109 ?auto_1788108 ) ( ON ?auto_1788110 ?auto_1788109 ) ( ON ?auto_1788111 ?auto_1788110 ) ( ON ?auto_1788112 ?auto_1788111 ) ( ON ?auto_1788113 ?auto_1788112 ) ( ON ?auto_1788114 ?auto_1788113 ) ( not ( = ?auto_1788101 ?auto_1788102 ) ) ( not ( = ?auto_1788101 ?auto_1788103 ) ) ( not ( = ?auto_1788101 ?auto_1788104 ) ) ( not ( = ?auto_1788101 ?auto_1788105 ) ) ( not ( = ?auto_1788101 ?auto_1788106 ) ) ( not ( = ?auto_1788101 ?auto_1788107 ) ) ( not ( = ?auto_1788101 ?auto_1788108 ) ) ( not ( = ?auto_1788101 ?auto_1788109 ) ) ( not ( = ?auto_1788101 ?auto_1788110 ) ) ( not ( = ?auto_1788101 ?auto_1788111 ) ) ( not ( = ?auto_1788101 ?auto_1788112 ) ) ( not ( = ?auto_1788101 ?auto_1788113 ) ) ( not ( = ?auto_1788101 ?auto_1788114 ) ) ( not ( = ?auto_1788101 ?auto_1788115 ) ) ( not ( = ?auto_1788101 ?auto_1788116 ) ) ( not ( = ?auto_1788101 ?auto_1788121 ) ) ( not ( = ?auto_1788102 ?auto_1788103 ) ) ( not ( = ?auto_1788102 ?auto_1788104 ) ) ( not ( = ?auto_1788102 ?auto_1788105 ) ) ( not ( = ?auto_1788102 ?auto_1788106 ) ) ( not ( = ?auto_1788102 ?auto_1788107 ) ) ( not ( = ?auto_1788102 ?auto_1788108 ) ) ( not ( = ?auto_1788102 ?auto_1788109 ) ) ( not ( = ?auto_1788102 ?auto_1788110 ) ) ( not ( = ?auto_1788102 ?auto_1788111 ) ) ( not ( = ?auto_1788102 ?auto_1788112 ) ) ( not ( = ?auto_1788102 ?auto_1788113 ) ) ( not ( = ?auto_1788102 ?auto_1788114 ) ) ( not ( = ?auto_1788102 ?auto_1788115 ) ) ( not ( = ?auto_1788102 ?auto_1788116 ) ) ( not ( = ?auto_1788102 ?auto_1788121 ) ) ( not ( = ?auto_1788103 ?auto_1788104 ) ) ( not ( = ?auto_1788103 ?auto_1788105 ) ) ( not ( = ?auto_1788103 ?auto_1788106 ) ) ( not ( = ?auto_1788103 ?auto_1788107 ) ) ( not ( = ?auto_1788103 ?auto_1788108 ) ) ( not ( = ?auto_1788103 ?auto_1788109 ) ) ( not ( = ?auto_1788103 ?auto_1788110 ) ) ( not ( = ?auto_1788103 ?auto_1788111 ) ) ( not ( = ?auto_1788103 ?auto_1788112 ) ) ( not ( = ?auto_1788103 ?auto_1788113 ) ) ( not ( = ?auto_1788103 ?auto_1788114 ) ) ( not ( = ?auto_1788103 ?auto_1788115 ) ) ( not ( = ?auto_1788103 ?auto_1788116 ) ) ( not ( = ?auto_1788103 ?auto_1788121 ) ) ( not ( = ?auto_1788104 ?auto_1788105 ) ) ( not ( = ?auto_1788104 ?auto_1788106 ) ) ( not ( = ?auto_1788104 ?auto_1788107 ) ) ( not ( = ?auto_1788104 ?auto_1788108 ) ) ( not ( = ?auto_1788104 ?auto_1788109 ) ) ( not ( = ?auto_1788104 ?auto_1788110 ) ) ( not ( = ?auto_1788104 ?auto_1788111 ) ) ( not ( = ?auto_1788104 ?auto_1788112 ) ) ( not ( = ?auto_1788104 ?auto_1788113 ) ) ( not ( = ?auto_1788104 ?auto_1788114 ) ) ( not ( = ?auto_1788104 ?auto_1788115 ) ) ( not ( = ?auto_1788104 ?auto_1788116 ) ) ( not ( = ?auto_1788104 ?auto_1788121 ) ) ( not ( = ?auto_1788105 ?auto_1788106 ) ) ( not ( = ?auto_1788105 ?auto_1788107 ) ) ( not ( = ?auto_1788105 ?auto_1788108 ) ) ( not ( = ?auto_1788105 ?auto_1788109 ) ) ( not ( = ?auto_1788105 ?auto_1788110 ) ) ( not ( = ?auto_1788105 ?auto_1788111 ) ) ( not ( = ?auto_1788105 ?auto_1788112 ) ) ( not ( = ?auto_1788105 ?auto_1788113 ) ) ( not ( = ?auto_1788105 ?auto_1788114 ) ) ( not ( = ?auto_1788105 ?auto_1788115 ) ) ( not ( = ?auto_1788105 ?auto_1788116 ) ) ( not ( = ?auto_1788105 ?auto_1788121 ) ) ( not ( = ?auto_1788106 ?auto_1788107 ) ) ( not ( = ?auto_1788106 ?auto_1788108 ) ) ( not ( = ?auto_1788106 ?auto_1788109 ) ) ( not ( = ?auto_1788106 ?auto_1788110 ) ) ( not ( = ?auto_1788106 ?auto_1788111 ) ) ( not ( = ?auto_1788106 ?auto_1788112 ) ) ( not ( = ?auto_1788106 ?auto_1788113 ) ) ( not ( = ?auto_1788106 ?auto_1788114 ) ) ( not ( = ?auto_1788106 ?auto_1788115 ) ) ( not ( = ?auto_1788106 ?auto_1788116 ) ) ( not ( = ?auto_1788106 ?auto_1788121 ) ) ( not ( = ?auto_1788107 ?auto_1788108 ) ) ( not ( = ?auto_1788107 ?auto_1788109 ) ) ( not ( = ?auto_1788107 ?auto_1788110 ) ) ( not ( = ?auto_1788107 ?auto_1788111 ) ) ( not ( = ?auto_1788107 ?auto_1788112 ) ) ( not ( = ?auto_1788107 ?auto_1788113 ) ) ( not ( = ?auto_1788107 ?auto_1788114 ) ) ( not ( = ?auto_1788107 ?auto_1788115 ) ) ( not ( = ?auto_1788107 ?auto_1788116 ) ) ( not ( = ?auto_1788107 ?auto_1788121 ) ) ( not ( = ?auto_1788108 ?auto_1788109 ) ) ( not ( = ?auto_1788108 ?auto_1788110 ) ) ( not ( = ?auto_1788108 ?auto_1788111 ) ) ( not ( = ?auto_1788108 ?auto_1788112 ) ) ( not ( = ?auto_1788108 ?auto_1788113 ) ) ( not ( = ?auto_1788108 ?auto_1788114 ) ) ( not ( = ?auto_1788108 ?auto_1788115 ) ) ( not ( = ?auto_1788108 ?auto_1788116 ) ) ( not ( = ?auto_1788108 ?auto_1788121 ) ) ( not ( = ?auto_1788109 ?auto_1788110 ) ) ( not ( = ?auto_1788109 ?auto_1788111 ) ) ( not ( = ?auto_1788109 ?auto_1788112 ) ) ( not ( = ?auto_1788109 ?auto_1788113 ) ) ( not ( = ?auto_1788109 ?auto_1788114 ) ) ( not ( = ?auto_1788109 ?auto_1788115 ) ) ( not ( = ?auto_1788109 ?auto_1788116 ) ) ( not ( = ?auto_1788109 ?auto_1788121 ) ) ( not ( = ?auto_1788110 ?auto_1788111 ) ) ( not ( = ?auto_1788110 ?auto_1788112 ) ) ( not ( = ?auto_1788110 ?auto_1788113 ) ) ( not ( = ?auto_1788110 ?auto_1788114 ) ) ( not ( = ?auto_1788110 ?auto_1788115 ) ) ( not ( = ?auto_1788110 ?auto_1788116 ) ) ( not ( = ?auto_1788110 ?auto_1788121 ) ) ( not ( = ?auto_1788111 ?auto_1788112 ) ) ( not ( = ?auto_1788111 ?auto_1788113 ) ) ( not ( = ?auto_1788111 ?auto_1788114 ) ) ( not ( = ?auto_1788111 ?auto_1788115 ) ) ( not ( = ?auto_1788111 ?auto_1788116 ) ) ( not ( = ?auto_1788111 ?auto_1788121 ) ) ( not ( = ?auto_1788112 ?auto_1788113 ) ) ( not ( = ?auto_1788112 ?auto_1788114 ) ) ( not ( = ?auto_1788112 ?auto_1788115 ) ) ( not ( = ?auto_1788112 ?auto_1788116 ) ) ( not ( = ?auto_1788112 ?auto_1788121 ) ) ( not ( = ?auto_1788113 ?auto_1788114 ) ) ( not ( = ?auto_1788113 ?auto_1788115 ) ) ( not ( = ?auto_1788113 ?auto_1788116 ) ) ( not ( = ?auto_1788113 ?auto_1788121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788114 ?auto_1788115 ?auto_1788116 )
      ( MAKE-15CRATE-VERIFY ?auto_1788101 ?auto_1788102 ?auto_1788103 ?auto_1788104 ?auto_1788105 ?auto_1788106 ?auto_1788107 ?auto_1788108 ?auto_1788109 ?auto_1788110 ?auto_1788111 ?auto_1788112 ?auto_1788113 ?auto_1788114 ?auto_1788115 ?auto_1788116 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788327 - SURFACE
      ?auto_1788328 - SURFACE
      ?auto_1788329 - SURFACE
      ?auto_1788330 - SURFACE
      ?auto_1788331 - SURFACE
      ?auto_1788332 - SURFACE
      ?auto_1788333 - SURFACE
      ?auto_1788334 - SURFACE
      ?auto_1788335 - SURFACE
      ?auto_1788336 - SURFACE
      ?auto_1788337 - SURFACE
      ?auto_1788338 - SURFACE
      ?auto_1788339 - SURFACE
      ?auto_1788340 - SURFACE
      ?auto_1788341 - SURFACE
      ?auto_1788342 - SURFACE
    )
    :vars
    (
      ?auto_1788348 - HOIST
      ?auto_1788346 - PLACE
      ?auto_1788344 - PLACE
      ?auto_1788345 - HOIST
      ?auto_1788343 - SURFACE
      ?auto_1788347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788348 ?auto_1788346 ) ( SURFACE-AT ?auto_1788341 ?auto_1788346 ) ( CLEAR ?auto_1788341 ) ( IS-CRATE ?auto_1788342 ) ( not ( = ?auto_1788341 ?auto_1788342 ) ) ( AVAILABLE ?auto_1788348 ) ( ON ?auto_1788341 ?auto_1788340 ) ( not ( = ?auto_1788340 ?auto_1788341 ) ) ( not ( = ?auto_1788340 ?auto_1788342 ) ) ( not ( = ?auto_1788344 ?auto_1788346 ) ) ( HOIST-AT ?auto_1788345 ?auto_1788344 ) ( not ( = ?auto_1788348 ?auto_1788345 ) ) ( AVAILABLE ?auto_1788345 ) ( SURFACE-AT ?auto_1788342 ?auto_1788344 ) ( ON ?auto_1788342 ?auto_1788343 ) ( CLEAR ?auto_1788342 ) ( not ( = ?auto_1788341 ?auto_1788343 ) ) ( not ( = ?auto_1788342 ?auto_1788343 ) ) ( not ( = ?auto_1788340 ?auto_1788343 ) ) ( TRUCK-AT ?auto_1788347 ?auto_1788346 ) ( ON ?auto_1788328 ?auto_1788327 ) ( ON ?auto_1788329 ?auto_1788328 ) ( ON ?auto_1788330 ?auto_1788329 ) ( ON ?auto_1788331 ?auto_1788330 ) ( ON ?auto_1788332 ?auto_1788331 ) ( ON ?auto_1788333 ?auto_1788332 ) ( ON ?auto_1788334 ?auto_1788333 ) ( ON ?auto_1788335 ?auto_1788334 ) ( ON ?auto_1788336 ?auto_1788335 ) ( ON ?auto_1788337 ?auto_1788336 ) ( ON ?auto_1788338 ?auto_1788337 ) ( ON ?auto_1788339 ?auto_1788338 ) ( ON ?auto_1788340 ?auto_1788339 ) ( not ( = ?auto_1788327 ?auto_1788328 ) ) ( not ( = ?auto_1788327 ?auto_1788329 ) ) ( not ( = ?auto_1788327 ?auto_1788330 ) ) ( not ( = ?auto_1788327 ?auto_1788331 ) ) ( not ( = ?auto_1788327 ?auto_1788332 ) ) ( not ( = ?auto_1788327 ?auto_1788333 ) ) ( not ( = ?auto_1788327 ?auto_1788334 ) ) ( not ( = ?auto_1788327 ?auto_1788335 ) ) ( not ( = ?auto_1788327 ?auto_1788336 ) ) ( not ( = ?auto_1788327 ?auto_1788337 ) ) ( not ( = ?auto_1788327 ?auto_1788338 ) ) ( not ( = ?auto_1788327 ?auto_1788339 ) ) ( not ( = ?auto_1788327 ?auto_1788340 ) ) ( not ( = ?auto_1788327 ?auto_1788341 ) ) ( not ( = ?auto_1788327 ?auto_1788342 ) ) ( not ( = ?auto_1788327 ?auto_1788343 ) ) ( not ( = ?auto_1788328 ?auto_1788329 ) ) ( not ( = ?auto_1788328 ?auto_1788330 ) ) ( not ( = ?auto_1788328 ?auto_1788331 ) ) ( not ( = ?auto_1788328 ?auto_1788332 ) ) ( not ( = ?auto_1788328 ?auto_1788333 ) ) ( not ( = ?auto_1788328 ?auto_1788334 ) ) ( not ( = ?auto_1788328 ?auto_1788335 ) ) ( not ( = ?auto_1788328 ?auto_1788336 ) ) ( not ( = ?auto_1788328 ?auto_1788337 ) ) ( not ( = ?auto_1788328 ?auto_1788338 ) ) ( not ( = ?auto_1788328 ?auto_1788339 ) ) ( not ( = ?auto_1788328 ?auto_1788340 ) ) ( not ( = ?auto_1788328 ?auto_1788341 ) ) ( not ( = ?auto_1788328 ?auto_1788342 ) ) ( not ( = ?auto_1788328 ?auto_1788343 ) ) ( not ( = ?auto_1788329 ?auto_1788330 ) ) ( not ( = ?auto_1788329 ?auto_1788331 ) ) ( not ( = ?auto_1788329 ?auto_1788332 ) ) ( not ( = ?auto_1788329 ?auto_1788333 ) ) ( not ( = ?auto_1788329 ?auto_1788334 ) ) ( not ( = ?auto_1788329 ?auto_1788335 ) ) ( not ( = ?auto_1788329 ?auto_1788336 ) ) ( not ( = ?auto_1788329 ?auto_1788337 ) ) ( not ( = ?auto_1788329 ?auto_1788338 ) ) ( not ( = ?auto_1788329 ?auto_1788339 ) ) ( not ( = ?auto_1788329 ?auto_1788340 ) ) ( not ( = ?auto_1788329 ?auto_1788341 ) ) ( not ( = ?auto_1788329 ?auto_1788342 ) ) ( not ( = ?auto_1788329 ?auto_1788343 ) ) ( not ( = ?auto_1788330 ?auto_1788331 ) ) ( not ( = ?auto_1788330 ?auto_1788332 ) ) ( not ( = ?auto_1788330 ?auto_1788333 ) ) ( not ( = ?auto_1788330 ?auto_1788334 ) ) ( not ( = ?auto_1788330 ?auto_1788335 ) ) ( not ( = ?auto_1788330 ?auto_1788336 ) ) ( not ( = ?auto_1788330 ?auto_1788337 ) ) ( not ( = ?auto_1788330 ?auto_1788338 ) ) ( not ( = ?auto_1788330 ?auto_1788339 ) ) ( not ( = ?auto_1788330 ?auto_1788340 ) ) ( not ( = ?auto_1788330 ?auto_1788341 ) ) ( not ( = ?auto_1788330 ?auto_1788342 ) ) ( not ( = ?auto_1788330 ?auto_1788343 ) ) ( not ( = ?auto_1788331 ?auto_1788332 ) ) ( not ( = ?auto_1788331 ?auto_1788333 ) ) ( not ( = ?auto_1788331 ?auto_1788334 ) ) ( not ( = ?auto_1788331 ?auto_1788335 ) ) ( not ( = ?auto_1788331 ?auto_1788336 ) ) ( not ( = ?auto_1788331 ?auto_1788337 ) ) ( not ( = ?auto_1788331 ?auto_1788338 ) ) ( not ( = ?auto_1788331 ?auto_1788339 ) ) ( not ( = ?auto_1788331 ?auto_1788340 ) ) ( not ( = ?auto_1788331 ?auto_1788341 ) ) ( not ( = ?auto_1788331 ?auto_1788342 ) ) ( not ( = ?auto_1788331 ?auto_1788343 ) ) ( not ( = ?auto_1788332 ?auto_1788333 ) ) ( not ( = ?auto_1788332 ?auto_1788334 ) ) ( not ( = ?auto_1788332 ?auto_1788335 ) ) ( not ( = ?auto_1788332 ?auto_1788336 ) ) ( not ( = ?auto_1788332 ?auto_1788337 ) ) ( not ( = ?auto_1788332 ?auto_1788338 ) ) ( not ( = ?auto_1788332 ?auto_1788339 ) ) ( not ( = ?auto_1788332 ?auto_1788340 ) ) ( not ( = ?auto_1788332 ?auto_1788341 ) ) ( not ( = ?auto_1788332 ?auto_1788342 ) ) ( not ( = ?auto_1788332 ?auto_1788343 ) ) ( not ( = ?auto_1788333 ?auto_1788334 ) ) ( not ( = ?auto_1788333 ?auto_1788335 ) ) ( not ( = ?auto_1788333 ?auto_1788336 ) ) ( not ( = ?auto_1788333 ?auto_1788337 ) ) ( not ( = ?auto_1788333 ?auto_1788338 ) ) ( not ( = ?auto_1788333 ?auto_1788339 ) ) ( not ( = ?auto_1788333 ?auto_1788340 ) ) ( not ( = ?auto_1788333 ?auto_1788341 ) ) ( not ( = ?auto_1788333 ?auto_1788342 ) ) ( not ( = ?auto_1788333 ?auto_1788343 ) ) ( not ( = ?auto_1788334 ?auto_1788335 ) ) ( not ( = ?auto_1788334 ?auto_1788336 ) ) ( not ( = ?auto_1788334 ?auto_1788337 ) ) ( not ( = ?auto_1788334 ?auto_1788338 ) ) ( not ( = ?auto_1788334 ?auto_1788339 ) ) ( not ( = ?auto_1788334 ?auto_1788340 ) ) ( not ( = ?auto_1788334 ?auto_1788341 ) ) ( not ( = ?auto_1788334 ?auto_1788342 ) ) ( not ( = ?auto_1788334 ?auto_1788343 ) ) ( not ( = ?auto_1788335 ?auto_1788336 ) ) ( not ( = ?auto_1788335 ?auto_1788337 ) ) ( not ( = ?auto_1788335 ?auto_1788338 ) ) ( not ( = ?auto_1788335 ?auto_1788339 ) ) ( not ( = ?auto_1788335 ?auto_1788340 ) ) ( not ( = ?auto_1788335 ?auto_1788341 ) ) ( not ( = ?auto_1788335 ?auto_1788342 ) ) ( not ( = ?auto_1788335 ?auto_1788343 ) ) ( not ( = ?auto_1788336 ?auto_1788337 ) ) ( not ( = ?auto_1788336 ?auto_1788338 ) ) ( not ( = ?auto_1788336 ?auto_1788339 ) ) ( not ( = ?auto_1788336 ?auto_1788340 ) ) ( not ( = ?auto_1788336 ?auto_1788341 ) ) ( not ( = ?auto_1788336 ?auto_1788342 ) ) ( not ( = ?auto_1788336 ?auto_1788343 ) ) ( not ( = ?auto_1788337 ?auto_1788338 ) ) ( not ( = ?auto_1788337 ?auto_1788339 ) ) ( not ( = ?auto_1788337 ?auto_1788340 ) ) ( not ( = ?auto_1788337 ?auto_1788341 ) ) ( not ( = ?auto_1788337 ?auto_1788342 ) ) ( not ( = ?auto_1788337 ?auto_1788343 ) ) ( not ( = ?auto_1788338 ?auto_1788339 ) ) ( not ( = ?auto_1788338 ?auto_1788340 ) ) ( not ( = ?auto_1788338 ?auto_1788341 ) ) ( not ( = ?auto_1788338 ?auto_1788342 ) ) ( not ( = ?auto_1788338 ?auto_1788343 ) ) ( not ( = ?auto_1788339 ?auto_1788340 ) ) ( not ( = ?auto_1788339 ?auto_1788341 ) ) ( not ( = ?auto_1788339 ?auto_1788342 ) ) ( not ( = ?auto_1788339 ?auto_1788343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788340 ?auto_1788341 ?auto_1788342 )
      ( MAKE-15CRATE-VERIFY ?auto_1788327 ?auto_1788328 ?auto_1788329 ?auto_1788330 ?auto_1788331 ?auto_1788332 ?auto_1788333 ?auto_1788334 ?auto_1788335 ?auto_1788336 ?auto_1788337 ?auto_1788338 ?auto_1788339 ?auto_1788340 ?auto_1788341 ?auto_1788342 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788553 - SURFACE
      ?auto_1788554 - SURFACE
      ?auto_1788555 - SURFACE
      ?auto_1788556 - SURFACE
      ?auto_1788557 - SURFACE
      ?auto_1788558 - SURFACE
      ?auto_1788559 - SURFACE
      ?auto_1788560 - SURFACE
      ?auto_1788561 - SURFACE
      ?auto_1788562 - SURFACE
      ?auto_1788563 - SURFACE
      ?auto_1788564 - SURFACE
      ?auto_1788565 - SURFACE
      ?auto_1788566 - SURFACE
      ?auto_1788567 - SURFACE
      ?auto_1788568 - SURFACE
    )
    :vars
    (
      ?auto_1788573 - HOIST
      ?auto_1788569 - PLACE
      ?auto_1788574 - PLACE
      ?auto_1788570 - HOIST
      ?auto_1788572 - SURFACE
      ?auto_1788571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788573 ?auto_1788569 ) ( IS-CRATE ?auto_1788568 ) ( not ( = ?auto_1788567 ?auto_1788568 ) ) ( not ( = ?auto_1788566 ?auto_1788567 ) ) ( not ( = ?auto_1788566 ?auto_1788568 ) ) ( not ( = ?auto_1788574 ?auto_1788569 ) ) ( HOIST-AT ?auto_1788570 ?auto_1788574 ) ( not ( = ?auto_1788573 ?auto_1788570 ) ) ( AVAILABLE ?auto_1788570 ) ( SURFACE-AT ?auto_1788568 ?auto_1788574 ) ( ON ?auto_1788568 ?auto_1788572 ) ( CLEAR ?auto_1788568 ) ( not ( = ?auto_1788567 ?auto_1788572 ) ) ( not ( = ?auto_1788568 ?auto_1788572 ) ) ( not ( = ?auto_1788566 ?auto_1788572 ) ) ( TRUCK-AT ?auto_1788571 ?auto_1788569 ) ( SURFACE-AT ?auto_1788566 ?auto_1788569 ) ( CLEAR ?auto_1788566 ) ( LIFTING ?auto_1788573 ?auto_1788567 ) ( IS-CRATE ?auto_1788567 ) ( ON ?auto_1788554 ?auto_1788553 ) ( ON ?auto_1788555 ?auto_1788554 ) ( ON ?auto_1788556 ?auto_1788555 ) ( ON ?auto_1788557 ?auto_1788556 ) ( ON ?auto_1788558 ?auto_1788557 ) ( ON ?auto_1788559 ?auto_1788558 ) ( ON ?auto_1788560 ?auto_1788559 ) ( ON ?auto_1788561 ?auto_1788560 ) ( ON ?auto_1788562 ?auto_1788561 ) ( ON ?auto_1788563 ?auto_1788562 ) ( ON ?auto_1788564 ?auto_1788563 ) ( ON ?auto_1788565 ?auto_1788564 ) ( ON ?auto_1788566 ?auto_1788565 ) ( not ( = ?auto_1788553 ?auto_1788554 ) ) ( not ( = ?auto_1788553 ?auto_1788555 ) ) ( not ( = ?auto_1788553 ?auto_1788556 ) ) ( not ( = ?auto_1788553 ?auto_1788557 ) ) ( not ( = ?auto_1788553 ?auto_1788558 ) ) ( not ( = ?auto_1788553 ?auto_1788559 ) ) ( not ( = ?auto_1788553 ?auto_1788560 ) ) ( not ( = ?auto_1788553 ?auto_1788561 ) ) ( not ( = ?auto_1788553 ?auto_1788562 ) ) ( not ( = ?auto_1788553 ?auto_1788563 ) ) ( not ( = ?auto_1788553 ?auto_1788564 ) ) ( not ( = ?auto_1788553 ?auto_1788565 ) ) ( not ( = ?auto_1788553 ?auto_1788566 ) ) ( not ( = ?auto_1788553 ?auto_1788567 ) ) ( not ( = ?auto_1788553 ?auto_1788568 ) ) ( not ( = ?auto_1788553 ?auto_1788572 ) ) ( not ( = ?auto_1788554 ?auto_1788555 ) ) ( not ( = ?auto_1788554 ?auto_1788556 ) ) ( not ( = ?auto_1788554 ?auto_1788557 ) ) ( not ( = ?auto_1788554 ?auto_1788558 ) ) ( not ( = ?auto_1788554 ?auto_1788559 ) ) ( not ( = ?auto_1788554 ?auto_1788560 ) ) ( not ( = ?auto_1788554 ?auto_1788561 ) ) ( not ( = ?auto_1788554 ?auto_1788562 ) ) ( not ( = ?auto_1788554 ?auto_1788563 ) ) ( not ( = ?auto_1788554 ?auto_1788564 ) ) ( not ( = ?auto_1788554 ?auto_1788565 ) ) ( not ( = ?auto_1788554 ?auto_1788566 ) ) ( not ( = ?auto_1788554 ?auto_1788567 ) ) ( not ( = ?auto_1788554 ?auto_1788568 ) ) ( not ( = ?auto_1788554 ?auto_1788572 ) ) ( not ( = ?auto_1788555 ?auto_1788556 ) ) ( not ( = ?auto_1788555 ?auto_1788557 ) ) ( not ( = ?auto_1788555 ?auto_1788558 ) ) ( not ( = ?auto_1788555 ?auto_1788559 ) ) ( not ( = ?auto_1788555 ?auto_1788560 ) ) ( not ( = ?auto_1788555 ?auto_1788561 ) ) ( not ( = ?auto_1788555 ?auto_1788562 ) ) ( not ( = ?auto_1788555 ?auto_1788563 ) ) ( not ( = ?auto_1788555 ?auto_1788564 ) ) ( not ( = ?auto_1788555 ?auto_1788565 ) ) ( not ( = ?auto_1788555 ?auto_1788566 ) ) ( not ( = ?auto_1788555 ?auto_1788567 ) ) ( not ( = ?auto_1788555 ?auto_1788568 ) ) ( not ( = ?auto_1788555 ?auto_1788572 ) ) ( not ( = ?auto_1788556 ?auto_1788557 ) ) ( not ( = ?auto_1788556 ?auto_1788558 ) ) ( not ( = ?auto_1788556 ?auto_1788559 ) ) ( not ( = ?auto_1788556 ?auto_1788560 ) ) ( not ( = ?auto_1788556 ?auto_1788561 ) ) ( not ( = ?auto_1788556 ?auto_1788562 ) ) ( not ( = ?auto_1788556 ?auto_1788563 ) ) ( not ( = ?auto_1788556 ?auto_1788564 ) ) ( not ( = ?auto_1788556 ?auto_1788565 ) ) ( not ( = ?auto_1788556 ?auto_1788566 ) ) ( not ( = ?auto_1788556 ?auto_1788567 ) ) ( not ( = ?auto_1788556 ?auto_1788568 ) ) ( not ( = ?auto_1788556 ?auto_1788572 ) ) ( not ( = ?auto_1788557 ?auto_1788558 ) ) ( not ( = ?auto_1788557 ?auto_1788559 ) ) ( not ( = ?auto_1788557 ?auto_1788560 ) ) ( not ( = ?auto_1788557 ?auto_1788561 ) ) ( not ( = ?auto_1788557 ?auto_1788562 ) ) ( not ( = ?auto_1788557 ?auto_1788563 ) ) ( not ( = ?auto_1788557 ?auto_1788564 ) ) ( not ( = ?auto_1788557 ?auto_1788565 ) ) ( not ( = ?auto_1788557 ?auto_1788566 ) ) ( not ( = ?auto_1788557 ?auto_1788567 ) ) ( not ( = ?auto_1788557 ?auto_1788568 ) ) ( not ( = ?auto_1788557 ?auto_1788572 ) ) ( not ( = ?auto_1788558 ?auto_1788559 ) ) ( not ( = ?auto_1788558 ?auto_1788560 ) ) ( not ( = ?auto_1788558 ?auto_1788561 ) ) ( not ( = ?auto_1788558 ?auto_1788562 ) ) ( not ( = ?auto_1788558 ?auto_1788563 ) ) ( not ( = ?auto_1788558 ?auto_1788564 ) ) ( not ( = ?auto_1788558 ?auto_1788565 ) ) ( not ( = ?auto_1788558 ?auto_1788566 ) ) ( not ( = ?auto_1788558 ?auto_1788567 ) ) ( not ( = ?auto_1788558 ?auto_1788568 ) ) ( not ( = ?auto_1788558 ?auto_1788572 ) ) ( not ( = ?auto_1788559 ?auto_1788560 ) ) ( not ( = ?auto_1788559 ?auto_1788561 ) ) ( not ( = ?auto_1788559 ?auto_1788562 ) ) ( not ( = ?auto_1788559 ?auto_1788563 ) ) ( not ( = ?auto_1788559 ?auto_1788564 ) ) ( not ( = ?auto_1788559 ?auto_1788565 ) ) ( not ( = ?auto_1788559 ?auto_1788566 ) ) ( not ( = ?auto_1788559 ?auto_1788567 ) ) ( not ( = ?auto_1788559 ?auto_1788568 ) ) ( not ( = ?auto_1788559 ?auto_1788572 ) ) ( not ( = ?auto_1788560 ?auto_1788561 ) ) ( not ( = ?auto_1788560 ?auto_1788562 ) ) ( not ( = ?auto_1788560 ?auto_1788563 ) ) ( not ( = ?auto_1788560 ?auto_1788564 ) ) ( not ( = ?auto_1788560 ?auto_1788565 ) ) ( not ( = ?auto_1788560 ?auto_1788566 ) ) ( not ( = ?auto_1788560 ?auto_1788567 ) ) ( not ( = ?auto_1788560 ?auto_1788568 ) ) ( not ( = ?auto_1788560 ?auto_1788572 ) ) ( not ( = ?auto_1788561 ?auto_1788562 ) ) ( not ( = ?auto_1788561 ?auto_1788563 ) ) ( not ( = ?auto_1788561 ?auto_1788564 ) ) ( not ( = ?auto_1788561 ?auto_1788565 ) ) ( not ( = ?auto_1788561 ?auto_1788566 ) ) ( not ( = ?auto_1788561 ?auto_1788567 ) ) ( not ( = ?auto_1788561 ?auto_1788568 ) ) ( not ( = ?auto_1788561 ?auto_1788572 ) ) ( not ( = ?auto_1788562 ?auto_1788563 ) ) ( not ( = ?auto_1788562 ?auto_1788564 ) ) ( not ( = ?auto_1788562 ?auto_1788565 ) ) ( not ( = ?auto_1788562 ?auto_1788566 ) ) ( not ( = ?auto_1788562 ?auto_1788567 ) ) ( not ( = ?auto_1788562 ?auto_1788568 ) ) ( not ( = ?auto_1788562 ?auto_1788572 ) ) ( not ( = ?auto_1788563 ?auto_1788564 ) ) ( not ( = ?auto_1788563 ?auto_1788565 ) ) ( not ( = ?auto_1788563 ?auto_1788566 ) ) ( not ( = ?auto_1788563 ?auto_1788567 ) ) ( not ( = ?auto_1788563 ?auto_1788568 ) ) ( not ( = ?auto_1788563 ?auto_1788572 ) ) ( not ( = ?auto_1788564 ?auto_1788565 ) ) ( not ( = ?auto_1788564 ?auto_1788566 ) ) ( not ( = ?auto_1788564 ?auto_1788567 ) ) ( not ( = ?auto_1788564 ?auto_1788568 ) ) ( not ( = ?auto_1788564 ?auto_1788572 ) ) ( not ( = ?auto_1788565 ?auto_1788566 ) ) ( not ( = ?auto_1788565 ?auto_1788567 ) ) ( not ( = ?auto_1788565 ?auto_1788568 ) ) ( not ( = ?auto_1788565 ?auto_1788572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788566 ?auto_1788567 ?auto_1788568 )
      ( MAKE-15CRATE-VERIFY ?auto_1788553 ?auto_1788554 ?auto_1788555 ?auto_1788556 ?auto_1788557 ?auto_1788558 ?auto_1788559 ?auto_1788560 ?auto_1788561 ?auto_1788562 ?auto_1788563 ?auto_1788564 ?auto_1788565 ?auto_1788566 ?auto_1788567 ?auto_1788568 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1788779 - SURFACE
      ?auto_1788780 - SURFACE
      ?auto_1788781 - SURFACE
      ?auto_1788782 - SURFACE
      ?auto_1788783 - SURFACE
      ?auto_1788784 - SURFACE
      ?auto_1788785 - SURFACE
      ?auto_1788786 - SURFACE
      ?auto_1788787 - SURFACE
      ?auto_1788788 - SURFACE
      ?auto_1788789 - SURFACE
      ?auto_1788790 - SURFACE
      ?auto_1788791 - SURFACE
      ?auto_1788792 - SURFACE
      ?auto_1788793 - SURFACE
      ?auto_1788794 - SURFACE
    )
    :vars
    (
      ?auto_1788795 - HOIST
      ?auto_1788797 - PLACE
      ?auto_1788799 - PLACE
      ?auto_1788800 - HOIST
      ?auto_1788796 - SURFACE
      ?auto_1788798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788795 ?auto_1788797 ) ( IS-CRATE ?auto_1788794 ) ( not ( = ?auto_1788793 ?auto_1788794 ) ) ( not ( = ?auto_1788792 ?auto_1788793 ) ) ( not ( = ?auto_1788792 ?auto_1788794 ) ) ( not ( = ?auto_1788799 ?auto_1788797 ) ) ( HOIST-AT ?auto_1788800 ?auto_1788799 ) ( not ( = ?auto_1788795 ?auto_1788800 ) ) ( AVAILABLE ?auto_1788800 ) ( SURFACE-AT ?auto_1788794 ?auto_1788799 ) ( ON ?auto_1788794 ?auto_1788796 ) ( CLEAR ?auto_1788794 ) ( not ( = ?auto_1788793 ?auto_1788796 ) ) ( not ( = ?auto_1788794 ?auto_1788796 ) ) ( not ( = ?auto_1788792 ?auto_1788796 ) ) ( TRUCK-AT ?auto_1788798 ?auto_1788797 ) ( SURFACE-AT ?auto_1788792 ?auto_1788797 ) ( CLEAR ?auto_1788792 ) ( IS-CRATE ?auto_1788793 ) ( AVAILABLE ?auto_1788795 ) ( IN ?auto_1788793 ?auto_1788798 ) ( ON ?auto_1788780 ?auto_1788779 ) ( ON ?auto_1788781 ?auto_1788780 ) ( ON ?auto_1788782 ?auto_1788781 ) ( ON ?auto_1788783 ?auto_1788782 ) ( ON ?auto_1788784 ?auto_1788783 ) ( ON ?auto_1788785 ?auto_1788784 ) ( ON ?auto_1788786 ?auto_1788785 ) ( ON ?auto_1788787 ?auto_1788786 ) ( ON ?auto_1788788 ?auto_1788787 ) ( ON ?auto_1788789 ?auto_1788788 ) ( ON ?auto_1788790 ?auto_1788789 ) ( ON ?auto_1788791 ?auto_1788790 ) ( ON ?auto_1788792 ?auto_1788791 ) ( not ( = ?auto_1788779 ?auto_1788780 ) ) ( not ( = ?auto_1788779 ?auto_1788781 ) ) ( not ( = ?auto_1788779 ?auto_1788782 ) ) ( not ( = ?auto_1788779 ?auto_1788783 ) ) ( not ( = ?auto_1788779 ?auto_1788784 ) ) ( not ( = ?auto_1788779 ?auto_1788785 ) ) ( not ( = ?auto_1788779 ?auto_1788786 ) ) ( not ( = ?auto_1788779 ?auto_1788787 ) ) ( not ( = ?auto_1788779 ?auto_1788788 ) ) ( not ( = ?auto_1788779 ?auto_1788789 ) ) ( not ( = ?auto_1788779 ?auto_1788790 ) ) ( not ( = ?auto_1788779 ?auto_1788791 ) ) ( not ( = ?auto_1788779 ?auto_1788792 ) ) ( not ( = ?auto_1788779 ?auto_1788793 ) ) ( not ( = ?auto_1788779 ?auto_1788794 ) ) ( not ( = ?auto_1788779 ?auto_1788796 ) ) ( not ( = ?auto_1788780 ?auto_1788781 ) ) ( not ( = ?auto_1788780 ?auto_1788782 ) ) ( not ( = ?auto_1788780 ?auto_1788783 ) ) ( not ( = ?auto_1788780 ?auto_1788784 ) ) ( not ( = ?auto_1788780 ?auto_1788785 ) ) ( not ( = ?auto_1788780 ?auto_1788786 ) ) ( not ( = ?auto_1788780 ?auto_1788787 ) ) ( not ( = ?auto_1788780 ?auto_1788788 ) ) ( not ( = ?auto_1788780 ?auto_1788789 ) ) ( not ( = ?auto_1788780 ?auto_1788790 ) ) ( not ( = ?auto_1788780 ?auto_1788791 ) ) ( not ( = ?auto_1788780 ?auto_1788792 ) ) ( not ( = ?auto_1788780 ?auto_1788793 ) ) ( not ( = ?auto_1788780 ?auto_1788794 ) ) ( not ( = ?auto_1788780 ?auto_1788796 ) ) ( not ( = ?auto_1788781 ?auto_1788782 ) ) ( not ( = ?auto_1788781 ?auto_1788783 ) ) ( not ( = ?auto_1788781 ?auto_1788784 ) ) ( not ( = ?auto_1788781 ?auto_1788785 ) ) ( not ( = ?auto_1788781 ?auto_1788786 ) ) ( not ( = ?auto_1788781 ?auto_1788787 ) ) ( not ( = ?auto_1788781 ?auto_1788788 ) ) ( not ( = ?auto_1788781 ?auto_1788789 ) ) ( not ( = ?auto_1788781 ?auto_1788790 ) ) ( not ( = ?auto_1788781 ?auto_1788791 ) ) ( not ( = ?auto_1788781 ?auto_1788792 ) ) ( not ( = ?auto_1788781 ?auto_1788793 ) ) ( not ( = ?auto_1788781 ?auto_1788794 ) ) ( not ( = ?auto_1788781 ?auto_1788796 ) ) ( not ( = ?auto_1788782 ?auto_1788783 ) ) ( not ( = ?auto_1788782 ?auto_1788784 ) ) ( not ( = ?auto_1788782 ?auto_1788785 ) ) ( not ( = ?auto_1788782 ?auto_1788786 ) ) ( not ( = ?auto_1788782 ?auto_1788787 ) ) ( not ( = ?auto_1788782 ?auto_1788788 ) ) ( not ( = ?auto_1788782 ?auto_1788789 ) ) ( not ( = ?auto_1788782 ?auto_1788790 ) ) ( not ( = ?auto_1788782 ?auto_1788791 ) ) ( not ( = ?auto_1788782 ?auto_1788792 ) ) ( not ( = ?auto_1788782 ?auto_1788793 ) ) ( not ( = ?auto_1788782 ?auto_1788794 ) ) ( not ( = ?auto_1788782 ?auto_1788796 ) ) ( not ( = ?auto_1788783 ?auto_1788784 ) ) ( not ( = ?auto_1788783 ?auto_1788785 ) ) ( not ( = ?auto_1788783 ?auto_1788786 ) ) ( not ( = ?auto_1788783 ?auto_1788787 ) ) ( not ( = ?auto_1788783 ?auto_1788788 ) ) ( not ( = ?auto_1788783 ?auto_1788789 ) ) ( not ( = ?auto_1788783 ?auto_1788790 ) ) ( not ( = ?auto_1788783 ?auto_1788791 ) ) ( not ( = ?auto_1788783 ?auto_1788792 ) ) ( not ( = ?auto_1788783 ?auto_1788793 ) ) ( not ( = ?auto_1788783 ?auto_1788794 ) ) ( not ( = ?auto_1788783 ?auto_1788796 ) ) ( not ( = ?auto_1788784 ?auto_1788785 ) ) ( not ( = ?auto_1788784 ?auto_1788786 ) ) ( not ( = ?auto_1788784 ?auto_1788787 ) ) ( not ( = ?auto_1788784 ?auto_1788788 ) ) ( not ( = ?auto_1788784 ?auto_1788789 ) ) ( not ( = ?auto_1788784 ?auto_1788790 ) ) ( not ( = ?auto_1788784 ?auto_1788791 ) ) ( not ( = ?auto_1788784 ?auto_1788792 ) ) ( not ( = ?auto_1788784 ?auto_1788793 ) ) ( not ( = ?auto_1788784 ?auto_1788794 ) ) ( not ( = ?auto_1788784 ?auto_1788796 ) ) ( not ( = ?auto_1788785 ?auto_1788786 ) ) ( not ( = ?auto_1788785 ?auto_1788787 ) ) ( not ( = ?auto_1788785 ?auto_1788788 ) ) ( not ( = ?auto_1788785 ?auto_1788789 ) ) ( not ( = ?auto_1788785 ?auto_1788790 ) ) ( not ( = ?auto_1788785 ?auto_1788791 ) ) ( not ( = ?auto_1788785 ?auto_1788792 ) ) ( not ( = ?auto_1788785 ?auto_1788793 ) ) ( not ( = ?auto_1788785 ?auto_1788794 ) ) ( not ( = ?auto_1788785 ?auto_1788796 ) ) ( not ( = ?auto_1788786 ?auto_1788787 ) ) ( not ( = ?auto_1788786 ?auto_1788788 ) ) ( not ( = ?auto_1788786 ?auto_1788789 ) ) ( not ( = ?auto_1788786 ?auto_1788790 ) ) ( not ( = ?auto_1788786 ?auto_1788791 ) ) ( not ( = ?auto_1788786 ?auto_1788792 ) ) ( not ( = ?auto_1788786 ?auto_1788793 ) ) ( not ( = ?auto_1788786 ?auto_1788794 ) ) ( not ( = ?auto_1788786 ?auto_1788796 ) ) ( not ( = ?auto_1788787 ?auto_1788788 ) ) ( not ( = ?auto_1788787 ?auto_1788789 ) ) ( not ( = ?auto_1788787 ?auto_1788790 ) ) ( not ( = ?auto_1788787 ?auto_1788791 ) ) ( not ( = ?auto_1788787 ?auto_1788792 ) ) ( not ( = ?auto_1788787 ?auto_1788793 ) ) ( not ( = ?auto_1788787 ?auto_1788794 ) ) ( not ( = ?auto_1788787 ?auto_1788796 ) ) ( not ( = ?auto_1788788 ?auto_1788789 ) ) ( not ( = ?auto_1788788 ?auto_1788790 ) ) ( not ( = ?auto_1788788 ?auto_1788791 ) ) ( not ( = ?auto_1788788 ?auto_1788792 ) ) ( not ( = ?auto_1788788 ?auto_1788793 ) ) ( not ( = ?auto_1788788 ?auto_1788794 ) ) ( not ( = ?auto_1788788 ?auto_1788796 ) ) ( not ( = ?auto_1788789 ?auto_1788790 ) ) ( not ( = ?auto_1788789 ?auto_1788791 ) ) ( not ( = ?auto_1788789 ?auto_1788792 ) ) ( not ( = ?auto_1788789 ?auto_1788793 ) ) ( not ( = ?auto_1788789 ?auto_1788794 ) ) ( not ( = ?auto_1788789 ?auto_1788796 ) ) ( not ( = ?auto_1788790 ?auto_1788791 ) ) ( not ( = ?auto_1788790 ?auto_1788792 ) ) ( not ( = ?auto_1788790 ?auto_1788793 ) ) ( not ( = ?auto_1788790 ?auto_1788794 ) ) ( not ( = ?auto_1788790 ?auto_1788796 ) ) ( not ( = ?auto_1788791 ?auto_1788792 ) ) ( not ( = ?auto_1788791 ?auto_1788793 ) ) ( not ( = ?auto_1788791 ?auto_1788794 ) ) ( not ( = ?auto_1788791 ?auto_1788796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1788792 ?auto_1788793 ?auto_1788794 )
      ( MAKE-15CRATE-VERIFY ?auto_1788779 ?auto_1788780 ?auto_1788781 ?auto_1788782 ?auto_1788783 ?auto_1788784 ?auto_1788785 ?auto_1788786 ?auto_1788787 ?auto_1788788 ?auto_1788789 ?auto_1788790 ?auto_1788791 ?auto_1788792 ?auto_1788793 ?auto_1788794 ) )
  )

)

