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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_425 - SURFACE
      ?auto_426 - SURFACE
    )
    :vars
    (
      ?auto_427 - HOIST
      ?auto_428 - PLACE
      ?auto_430 - PLACE
      ?auto_431 - HOIST
      ?auto_432 - SURFACE
      ?auto_429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_427 ?auto_428 ) ( SURFACE-AT ?auto_425 ?auto_428 ) ( CLEAR ?auto_425 ) ( IS-CRATE ?auto_426 ) ( AVAILABLE ?auto_427 ) ( not ( = ?auto_430 ?auto_428 ) ) ( HOIST-AT ?auto_431 ?auto_430 ) ( AVAILABLE ?auto_431 ) ( SURFACE-AT ?auto_426 ?auto_430 ) ( ON ?auto_426 ?auto_432 ) ( CLEAR ?auto_426 ) ( TRUCK-AT ?auto_429 ?auto_428 ) ( not ( = ?auto_425 ?auto_426 ) ) ( not ( = ?auto_425 ?auto_432 ) ) ( not ( = ?auto_426 ?auto_432 ) ) ( not ( = ?auto_427 ?auto_431 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_429 ?auto_428 ?auto_430 )
      ( !LIFT ?auto_431 ?auto_426 ?auto_432 ?auto_430 )
      ( !LOAD ?auto_431 ?auto_426 ?auto_429 ?auto_430 )
      ( !DRIVE ?auto_429 ?auto_430 ?auto_428 )
      ( !UNLOAD ?auto_427 ?auto_426 ?auto_429 ?auto_428 )
      ( !DROP ?auto_427 ?auto_426 ?auto_425 ?auto_428 )
      ( MAKE-1CRATE-VERIFY ?auto_425 ?auto_426 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_446 - SURFACE
      ?auto_447 - SURFACE
      ?auto_448 - SURFACE
    )
    :vars
    (
      ?auto_449 - HOIST
      ?auto_451 - PLACE
      ?auto_454 - PLACE
      ?auto_450 - HOIST
      ?auto_452 - SURFACE
      ?auto_457 - PLACE
      ?auto_455 - HOIST
      ?auto_456 - SURFACE
      ?auto_453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_449 ?auto_451 ) ( IS-CRATE ?auto_448 ) ( not ( = ?auto_454 ?auto_451 ) ) ( HOIST-AT ?auto_450 ?auto_454 ) ( AVAILABLE ?auto_450 ) ( SURFACE-AT ?auto_448 ?auto_454 ) ( ON ?auto_448 ?auto_452 ) ( CLEAR ?auto_448 ) ( not ( = ?auto_447 ?auto_448 ) ) ( not ( = ?auto_447 ?auto_452 ) ) ( not ( = ?auto_448 ?auto_452 ) ) ( not ( = ?auto_449 ?auto_450 ) ) ( SURFACE-AT ?auto_446 ?auto_451 ) ( CLEAR ?auto_446 ) ( IS-CRATE ?auto_447 ) ( AVAILABLE ?auto_449 ) ( not ( = ?auto_457 ?auto_451 ) ) ( HOIST-AT ?auto_455 ?auto_457 ) ( AVAILABLE ?auto_455 ) ( SURFACE-AT ?auto_447 ?auto_457 ) ( ON ?auto_447 ?auto_456 ) ( CLEAR ?auto_447 ) ( TRUCK-AT ?auto_453 ?auto_451 ) ( not ( = ?auto_446 ?auto_447 ) ) ( not ( = ?auto_446 ?auto_456 ) ) ( not ( = ?auto_447 ?auto_456 ) ) ( not ( = ?auto_449 ?auto_455 ) ) ( not ( = ?auto_446 ?auto_448 ) ) ( not ( = ?auto_446 ?auto_452 ) ) ( not ( = ?auto_448 ?auto_456 ) ) ( not ( = ?auto_454 ?auto_457 ) ) ( not ( = ?auto_450 ?auto_455 ) ) ( not ( = ?auto_452 ?auto_456 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_446 ?auto_447 )
      ( MAKE-1CRATE ?auto_447 ?auto_448 )
      ( MAKE-2CRATE-VERIFY ?auto_446 ?auto_447 ?auto_448 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_472 - SURFACE
      ?auto_473 - SURFACE
      ?auto_474 - SURFACE
      ?auto_475 - SURFACE
    )
    :vars
    (
      ?auto_477 - HOIST
      ?auto_476 - PLACE
      ?auto_481 - PLACE
      ?auto_478 - HOIST
      ?auto_479 - SURFACE
      ?auto_487 - PLACE
      ?auto_484 - HOIST
      ?auto_486 - SURFACE
      ?auto_483 - PLACE
      ?auto_482 - HOIST
      ?auto_485 - SURFACE
      ?auto_480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_477 ?auto_476 ) ( IS-CRATE ?auto_475 ) ( not ( = ?auto_481 ?auto_476 ) ) ( HOIST-AT ?auto_478 ?auto_481 ) ( AVAILABLE ?auto_478 ) ( SURFACE-AT ?auto_475 ?auto_481 ) ( ON ?auto_475 ?auto_479 ) ( CLEAR ?auto_475 ) ( not ( = ?auto_474 ?auto_475 ) ) ( not ( = ?auto_474 ?auto_479 ) ) ( not ( = ?auto_475 ?auto_479 ) ) ( not ( = ?auto_477 ?auto_478 ) ) ( IS-CRATE ?auto_474 ) ( not ( = ?auto_487 ?auto_476 ) ) ( HOIST-AT ?auto_484 ?auto_487 ) ( AVAILABLE ?auto_484 ) ( SURFACE-AT ?auto_474 ?auto_487 ) ( ON ?auto_474 ?auto_486 ) ( CLEAR ?auto_474 ) ( not ( = ?auto_473 ?auto_474 ) ) ( not ( = ?auto_473 ?auto_486 ) ) ( not ( = ?auto_474 ?auto_486 ) ) ( not ( = ?auto_477 ?auto_484 ) ) ( SURFACE-AT ?auto_472 ?auto_476 ) ( CLEAR ?auto_472 ) ( IS-CRATE ?auto_473 ) ( AVAILABLE ?auto_477 ) ( not ( = ?auto_483 ?auto_476 ) ) ( HOIST-AT ?auto_482 ?auto_483 ) ( AVAILABLE ?auto_482 ) ( SURFACE-AT ?auto_473 ?auto_483 ) ( ON ?auto_473 ?auto_485 ) ( CLEAR ?auto_473 ) ( TRUCK-AT ?auto_480 ?auto_476 ) ( not ( = ?auto_472 ?auto_473 ) ) ( not ( = ?auto_472 ?auto_485 ) ) ( not ( = ?auto_473 ?auto_485 ) ) ( not ( = ?auto_477 ?auto_482 ) ) ( not ( = ?auto_472 ?auto_474 ) ) ( not ( = ?auto_472 ?auto_486 ) ) ( not ( = ?auto_474 ?auto_485 ) ) ( not ( = ?auto_487 ?auto_483 ) ) ( not ( = ?auto_484 ?auto_482 ) ) ( not ( = ?auto_486 ?auto_485 ) ) ( not ( = ?auto_472 ?auto_475 ) ) ( not ( = ?auto_472 ?auto_479 ) ) ( not ( = ?auto_473 ?auto_475 ) ) ( not ( = ?auto_473 ?auto_479 ) ) ( not ( = ?auto_475 ?auto_486 ) ) ( not ( = ?auto_475 ?auto_485 ) ) ( not ( = ?auto_481 ?auto_487 ) ) ( not ( = ?auto_481 ?auto_483 ) ) ( not ( = ?auto_478 ?auto_484 ) ) ( not ( = ?auto_478 ?auto_482 ) ) ( not ( = ?auto_479 ?auto_486 ) ) ( not ( = ?auto_479 ?auto_485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_472 ?auto_473 ?auto_474 )
      ( MAKE-1CRATE ?auto_474 ?auto_475 )
      ( MAKE-3CRATE-VERIFY ?auto_472 ?auto_473 ?auto_474 ?auto_475 ) )
  )

)

