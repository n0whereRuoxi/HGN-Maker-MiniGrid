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

  ( :method MAKE-16CRATE-VERIFY
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
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24438 - SURFACE
      ?auto_24439 - SURFACE
    )
    :vars
    (
      ?auto_24440 - HOIST
      ?auto_24441 - PLACE
      ?auto_24443 - PLACE
      ?auto_24444 - HOIST
      ?auto_24445 - SURFACE
      ?auto_24442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24440 ?auto_24441 ) ( SURFACE-AT ?auto_24438 ?auto_24441 ) ( CLEAR ?auto_24438 ) ( IS-CRATE ?auto_24439 ) ( AVAILABLE ?auto_24440 ) ( not ( = ?auto_24443 ?auto_24441 ) ) ( HOIST-AT ?auto_24444 ?auto_24443 ) ( AVAILABLE ?auto_24444 ) ( SURFACE-AT ?auto_24439 ?auto_24443 ) ( ON ?auto_24439 ?auto_24445 ) ( CLEAR ?auto_24439 ) ( TRUCK-AT ?auto_24442 ?auto_24441 ) ( not ( = ?auto_24438 ?auto_24439 ) ) ( not ( = ?auto_24438 ?auto_24445 ) ) ( not ( = ?auto_24439 ?auto_24445 ) ) ( not ( = ?auto_24440 ?auto_24444 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24442 ?auto_24441 ?auto_24443 )
      ( !LIFT ?auto_24444 ?auto_24439 ?auto_24445 ?auto_24443 )
      ( !LOAD ?auto_24444 ?auto_24439 ?auto_24442 ?auto_24443 )
      ( !DRIVE ?auto_24442 ?auto_24443 ?auto_24441 )
      ( !UNLOAD ?auto_24440 ?auto_24439 ?auto_24442 ?auto_24441 )
      ( !DROP ?auto_24440 ?auto_24439 ?auto_24438 ?auto_24441 )
      ( MAKE-1CRATE-VERIFY ?auto_24438 ?auto_24439 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24459 - SURFACE
      ?auto_24460 - SURFACE
      ?auto_24461 - SURFACE
    )
    :vars
    (
      ?auto_24466 - HOIST
      ?auto_24465 - PLACE
      ?auto_24464 - PLACE
      ?auto_24463 - HOIST
      ?auto_24467 - SURFACE
      ?auto_24470 - PLACE
      ?auto_24469 - HOIST
      ?auto_24468 - SURFACE
      ?auto_24462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24466 ?auto_24465 ) ( IS-CRATE ?auto_24461 ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( HOIST-AT ?auto_24463 ?auto_24464 ) ( AVAILABLE ?auto_24463 ) ( SURFACE-AT ?auto_24461 ?auto_24464 ) ( ON ?auto_24461 ?auto_24467 ) ( CLEAR ?auto_24461 ) ( not ( = ?auto_24460 ?auto_24461 ) ) ( not ( = ?auto_24460 ?auto_24467 ) ) ( not ( = ?auto_24461 ?auto_24467 ) ) ( not ( = ?auto_24466 ?auto_24463 ) ) ( SURFACE-AT ?auto_24459 ?auto_24465 ) ( CLEAR ?auto_24459 ) ( IS-CRATE ?auto_24460 ) ( AVAILABLE ?auto_24466 ) ( not ( = ?auto_24470 ?auto_24465 ) ) ( HOIST-AT ?auto_24469 ?auto_24470 ) ( AVAILABLE ?auto_24469 ) ( SURFACE-AT ?auto_24460 ?auto_24470 ) ( ON ?auto_24460 ?auto_24468 ) ( CLEAR ?auto_24460 ) ( TRUCK-AT ?auto_24462 ?auto_24465 ) ( not ( = ?auto_24459 ?auto_24460 ) ) ( not ( = ?auto_24459 ?auto_24468 ) ) ( not ( = ?auto_24460 ?auto_24468 ) ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( not ( = ?auto_24459 ?auto_24461 ) ) ( not ( = ?auto_24459 ?auto_24467 ) ) ( not ( = ?auto_24461 ?auto_24468 ) ) ( not ( = ?auto_24464 ?auto_24470 ) ) ( not ( = ?auto_24463 ?auto_24469 ) ) ( not ( = ?auto_24467 ?auto_24468 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24459 ?auto_24460 )
      ( MAKE-1CRATE ?auto_24460 ?auto_24461 )
      ( MAKE-2CRATE-VERIFY ?auto_24459 ?auto_24460 ?auto_24461 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24485 - SURFACE
      ?auto_24486 - SURFACE
      ?auto_24487 - SURFACE
      ?auto_24488 - SURFACE
    )
    :vars
    (
      ?auto_24491 - HOIST
      ?auto_24492 - PLACE
      ?auto_24489 - PLACE
      ?auto_24490 - HOIST
      ?auto_24493 - SURFACE
      ?auto_24500 - PLACE
      ?auto_24496 - HOIST
      ?auto_24498 - SURFACE
      ?auto_24497 - PLACE
      ?auto_24499 - HOIST
      ?auto_24495 - SURFACE
      ?auto_24494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24491 ?auto_24492 ) ( IS-CRATE ?auto_24488 ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( HOIST-AT ?auto_24490 ?auto_24489 ) ( AVAILABLE ?auto_24490 ) ( SURFACE-AT ?auto_24488 ?auto_24489 ) ( ON ?auto_24488 ?auto_24493 ) ( CLEAR ?auto_24488 ) ( not ( = ?auto_24487 ?auto_24488 ) ) ( not ( = ?auto_24487 ?auto_24493 ) ) ( not ( = ?auto_24488 ?auto_24493 ) ) ( not ( = ?auto_24491 ?auto_24490 ) ) ( IS-CRATE ?auto_24487 ) ( not ( = ?auto_24500 ?auto_24492 ) ) ( HOIST-AT ?auto_24496 ?auto_24500 ) ( AVAILABLE ?auto_24496 ) ( SURFACE-AT ?auto_24487 ?auto_24500 ) ( ON ?auto_24487 ?auto_24498 ) ( CLEAR ?auto_24487 ) ( not ( = ?auto_24486 ?auto_24487 ) ) ( not ( = ?auto_24486 ?auto_24498 ) ) ( not ( = ?auto_24487 ?auto_24498 ) ) ( not ( = ?auto_24491 ?auto_24496 ) ) ( SURFACE-AT ?auto_24485 ?auto_24492 ) ( CLEAR ?auto_24485 ) ( IS-CRATE ?auto_24486 ) ( AVAILABLE ?auto_24491 ) ( not ( = ?auto_24497 ?auto_24492 ) ) ( HOIST-AT ?auto_24499 ?auto_24497 ) ( AVAILABLE ?auto_24499 ) ( SURFACE-AT ?auto_24486 ?auto_24497 ) ( ON ?auto_24486 ?auto_24495 ) ( CLEAR ?auto_24486 ) ( TRUCK-AT ?auto_24494 ?auto_24492 ) ( not ( = ?auto_24485 ?auto_24486 ) ) ( not ( = ?auto_24485 ?auto_24495 ) ) ( not ( = ?auto_24486 ?auto_24495 ) ) ( not ( = ?auto_24491 ?auto_24499 ) ) ( not ( = ?auto_24485 ?auto_24487 ) ) ( not ( = ?auto_24485 ?auto_24498 ) ) ( not ( = ?auto_24487 ?auto_24495 ) ) ( not ( = ?auto_24500 ?auto_24497 ) ) ( not ( = ?auto_24496 ?auto_24499 ) ) ( not ( = ?auto_24498 ?auto_24495 ) ) ( not ( = ?auto_24485 ?auto_24488 ) ) ( not ( = ?auto_24485 ?auto_24493 ) ) ( not ( = ?auto_24486 ?auto_24488 ) ) ( not ( = ?auto_24486 ?auto_24493 ) ) ( not ( = ?auto_24488 ?auto_24498 ) ) ( not ( = ?auto_24488 ?auto_24495 ) ) ( not ( = ?auto_24489 ?auto_24500 ) ) ( not ( = ?auto_24489 ?auto_24497 ) ) ( not ( = ?auto_24490 ?auto_24496 ) ) ( not ( = ?auto_24490 ?auto_24499 ) ) ( not ( = ?auto_24493 ?auto_24498 ) ) ( not ( = ?auto_24493 ?auto_24495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24485 ?auto_24486 ?auto_24487 )
      ( MAKE-1CRATE ?auto_24487 ?auto_24488 )
      ( MAKE-3CRATE-VERIFY ?auto_24485 ?auto_24486 ?auto_24487 ?auto_24488 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24516 - SURFACE
      ?auto_24517 - SURFACE
      ?auto_24518 - SURFACE
      ?auto_24519 - SURFACE
      ?auto_24520 - SURFACE
    )
    :vars
    (
      ?auto_24523 - HOIST
      ?auto_24524 - PLACE
      ?auto_24521 - PLACE
      ?auto_24525 - HOIST
      ?auto_24522 - SURFACE
      ?auto_24535 - PLACE
      ?auto_24533 - HOIST
      ?auto_24532 - SURFACE
      ?auto_24534 - PLACE
      ?auto_24531 - HOIST
      ?auto_24528 - SURFACE
      ?auto_24527 - PLACE
      ?auto_24530 - HOIST
      ?auto_24529 - SURFACE
      ?auto_24526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24523 ?auto_24524 ) ( IS-CRATE ?auto_24520 ) ( not ( = ?auto_24521 ?auto_24524 ) ) ( HOIST-AT ?auto_24525 ?auto_24521 ) ( AVAILABLE ?auto_24525 ) ( SURFACE-AT ?auto_24520 ?auto_24521 ) ( ON ?auto_24520 ?auto_24522 ) ( CLEAR ?auto_24520 ) ( not ( = ?auto_24519 ?auto_24520 ) ) ( not ( = ?auto_24519 ?auto_24522 ) ) ( not ( = ?auto_24520 ?auto_24522 ) ) ( not ( = ?auto_24523 ?auto_24525 ) ) ( IS-CRATE ?auto_24519 ) ( not ( = ?auto_24535 ?auto_24524 ) ) ( HOIST-AT ?auto_24533 ?auto_24535 ) ( AVAILABLE ?auto_24533 ) ( SURFACE-AT ?auto_24519 ?auto_24535 ) ( ON ?auto_24519 ?auto_24532 ) ( CLEAR ?auto_24519 ) ( not ( = ?auto_24518 ?auto_24519 ) ) ( not ( = ?auto_24518 ?auto_24532 ) ) ( not ( = ?auto_24519 ?auto_24532 ) ) ( not ( = ?auto_24523 ?auto_24533 ) ) ( IS-CRATE ?auto_24518 ) ( not ( = ?auto_24534 ?auto_24524 ) ) ( HOIST-AT ?auto_24531 ?auto_24534 ) ( AVAILABLE ?auto_24531 ) ( SURFACE-AT ?auto_24518 ?auto_24534 ) ( ON ?auto_24518 ?auto_24528 ) ( CLEAR ?auto_24518 ) ( not ( = ?auto_24517 ?auto_24518 ) ) ( not ( = ?auto_24517 ?auto_24528 ) ) ( not ( = ?auto_24518 ?auto_24528 ) ) ( not ( = ?auto_24523 ?auto_24531 ) ) ( SURFACE-AT ?auto_24516 ?auto_24524 ) ( CLEAR ?auto_24516 ) ( IS-CRATE ?auto_24517 ) ( AVAILABLE ?auto_24523 ) ( not ( = ?auto_24527 ?auto_24524 ) ) ( HOIST-AT ?auto_24530 ?auto_24527 ) ( AVAILABLE ?auto_24530 ) ( SURFACE-AT ?auto_24517 ?auto_24527 ) ( ON ?auto_24517 ?auto_24529 ) ( CLEAR ?auto_24517 ) ( TRUCK-AT ?auto_24526 ?auto_24524 ) ( not ( = ?auto_24516 ?auto_24517 ) ) ( not ( = ?auto_24516 ?auto_24529 ) ) ( not ( = ?auto_24517 ?auto_24529 ) ) ( not ( = ?auto_24523 ?auto_24530 ) ) ( not ( = ?auto_24516 ?auto_24518 ) ) ( not ( = ?auto_24516 ?auto_24528 ) ) ( not ( = ?auto_24518 ?auto_24529 ) ) ( not ( = ?auto_24534 ?auto_24527 ) ) ( not ( = ?auto_24531 ?auto_24530 ) ) ( not ( = ?auto_24528 ?auto_24529 ) ) ( not ( = ?auto_24516 ?auto_24519 ) ) ( not ( = ?auto_24516 ?auto_24532 ) ) ( not ( = ?auto_24517 ?auto_24519 ) ) ( not ( = ?auto_24517 ?auto_24532 ) ) ( not ( = ?auto_24519 ?auto_24528 ) ) ( not ( = ?auto_24519 ?auto_24529 ) ) ( not ( = ?auto_24535 ?auto_24534 ) ) ( not ( = ?auto_24535 ?auto_24527 ) ) ( not ( = ?auto_24533 ?auto_24531 ) ) ( not ( = ?auto_24533 ?auto_24530 ) ) ( not ( = ?auto_24532 ?auto_24528 ) ) ( not ( = ?auto_24532 ?auto_24529 ) ) ( not ( = ?auto_24516 ?auto_24520 ) ) ( not ( = ?auto_24516 ?auto_24522 ) ) ( not ( = ?auto_24517 ?auto_24520 ) ) ( not ( = ?auto_24517 ?auto_24522 ) ) ( not ( = ?auto_24518 ?auto_24520 ) ) ( not ( = ?auto_24518 ?auto_24522 ) ) ( not ( = ?auto_24520 ?auto_24532 ) ) ( not ( = ?auto_24520 ?auto_24528 ) ) ( not ( = ?auto_24520 ?auto_24529 ) ) ( not ( = ?auto_24521 ?auto_24535 ) ) ( not ( = ?auto_24521 ?auto_24534 ) ) ( not ( = ?auto_24521 ?auto_24527 ) ) ( not ( = ?auto_24525 ?auto_24533 ) ) ( not ( = ?auto_24525 ?auto_24531 ) ) ( not ( = ?auto_24525 ?auto_24530 ) ) ( not ( = ?auto_24522 ?auto_24532 ) ) ( not ( = ?auto_24522 ?auto_24528 ) ) ( not ( = ?auto_24522 ?auto_24529 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_24516 ?auto_24517 ?auto_24518 ?auto_24519 )
      ( MAKE-1CRATE ?auto_24519 ?auto_24520 )
      ( MAKE-4CRATE-VERIFY ?auto_24516 ?auto_24517 ?auto_24518 ?auto_24519 ?auto_24520 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_24552 - SURFACE
      ?auto_24553 - SURFACE
      ?auto_24554 - SURFACE
      ?auto_24555 - SURFACE
      ?auto_24556 - SURFACE
      ?auto_24557 - SURFACE
    )
    :vars
    (
      ?auto_24558 - HOIST
      ?auto_24559 - PLACE
      ?auto_24562 - PLACE
      ?auto_24563 - HOIST
      ?auto_24561 - SURFACE
      ?auto_24564 - PLACE
      ?auto_24572 - HOIST
      ?auto_24570 - SURFACE
      ?auto_24569 - PLACE
      ?auto_24566 - HOIST
      ?auto_24565 - SURFACE
      ?auto_24567 - SURFACE
      ?auto_24573 - PLACE
      ?auto_24568 - HOIST
      ?auto_24571 - SURFACE
      ?auto_24560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24558 ?auto_24559 ) ( IS-CRATE ?auto_24557 ) ( not ( = ?auto_24562 ?auto_24559 ) ) ( HOIST-AT ?auto_24563 ?auto_24562 ) ( SURFACE-AT ?auto_24557 ?auto_24562 ) ( ON ?auto_24557 ?auto_24561 ) ( CLEAR ?auto_24557 ) ( not ( = ?auto_24556 ?auto_24557 ) ) ( not ( = ?auto_24556 ?auto_24561 ) ) ( not ( = ?auto_24557 ?auto_24561 ) ) ( not ( = ?auto_24558 ?auto_24563 ) ) ( IS-CRATE ?auto_24556 ) ( not ( = ?auto_24564 ?auto_24559 ) ) ( HOIST-AT ?auto_24572 ?auto_24564 ) ( AVAILABLE ?auto_24572 ) ( SURFACE-AT ?auto_24556 ?auto_24564 ) ( ON ?auto_24556 ?auto_24570 ) ( CLEAR ?auto_24556 ) ( not ( = ?auto_24555 ?auto_24556 ) ) ( not ( = ?auto_24555 ?auto_24570 ) ) ( not ( = ?auto_24556 ?auto_24570 ) ) ( not ( = ?auto_24558 ?auto_24572 ) ) ( IS-CRATE ?auto_24555 ) ( not ( = ?auto_24569 ?auto_24559 ) ) ( HOIST-AT ?auto_24566 ?auto_24569 ) ( AVAILABLE ?auto_24566 ) ( SURFACE-AT ?auto_24555 ?auto_24569 ) ( ON ?auto_24555 ?auto_24565 ) ( CLEAR ?auto_24555 ) ( not ( = ?auto_24554 ?auto_24555 ) ) ( not ( = ?auto_24554 ?auto_24565 ) ) ( not ( = ?auto_24555 ?auto_24565 ) ) ( not ( = ?auto_24558 ?auto_24566 ) ) ( IS-CRATE ?auto_24554 ) ( AVAILABLE ?auto_24563 ) ( SURFACE-AT ?auto_24554 ?auto_24562 ) ( ON ?auto_24554 ?auto_24567 ) ( CLEAR ?auto_24554 ) ( not ( = ?auto_24553 ?auto_24554 ) ) ( not ( = ?auto_24553 ?auto_24567 ) ) ( not ( = ?auto_24554 ?auto_24567 ) ) ( SURFACE-AT ?auto_24552 ?auto_24559 ) ( CLEAR ?auto_24552 ) ( IS-CRATE ?auto_24553 ) ( AVAILABLE ?auto_24558 ) ( not ( = ?auto_24573 ?auto_24559 ) ) ( HOIST-AT ?auto_24568 ?auto_24573 ) ( AVAILABLE ?auto_24568 ) ( SURFACE-AT ?auto_24553 ?auto_24573 ) ( ON ?auto_24553 ?auto_24571 ) ( CLEAR ?auto_24553 ) ( TRUCK-AT ?auto_24560 ?auto_24559 ) ( not ( = ?auto_24552 ?auto_24553 ) ) ( not ( = ?auto_24552 ?auto_24571 ) ) ( not ( = ?auto_24553 ?auto_24571 ) ) ( not ( = ?auto_24558 ?auto_24568 ) ) ( not ( = ?auto_24552 ?auto_24554 ) ) ( not ( = ?auto_24552 ?auto_24567 ) ) ( not ( = ?auto_24554 ?auto_24571 ) ) ( not ( = ?auto_24562 ?auto_24573 ) ) ( not ( = ?auto_24563 ?auto_24568 ) ) ( not ( = ?auto_24567 ?auto_24571 ) ) ( not ( = ?auto_24552 ?auto_24555 ) ) ( not ( = ?auto_24552 ?auto_24565 ) ) ( not ( = ?auto_24553 ?auto_24555 ) ) ( not ( = ?auto_24553 ?auto_24565 ) ) ( not ( = ?auto_24555 ?auto_24567 ) ) ( not ( = ?auto_24555 ?auto_24571 ) ) ( not ( = ?auto_24569 ?auto_24562 ) ) ( not ( = ?auto_24569 ?auto_24573 ) ) ( not ( = ?auto_24566 ?auto_24563 ) ) ( not ( = ?auto_24566 ?auto_24568 ) ) ( not ( = ?auto_24565 ?auto_24567 ) ) ( not ( = ?auto_24565 ?auto_24571 ) ) ( not ( = ?auto_24552 ?auto_24556 ) ) ( not ( = ?auto_24552 ?auto_24570 ) ) ( not ( = ?auto_24553 ?auto_24556 ) ) ( not ( = ?auto_24553 ?auto_24570 ) ) ( not ( = ?auto_24554 ?auto_24556 ) ) ( not ( = ?auto_24554 ?auto_24570 ) ) ( not ( = ?auto_24556 ?auto_24565 ) ) ( not ( = ?auto_24556 ?auto_24567 ) ) ( not ( = ?auto_24556 ?auto_24571 ) ) ( not ( = ?auto_24564 ?auto_24569 ) ) ( not ( = ?auto_24564 ?auto_24562 ) ) ( not ( = ?auto_24564 ?auto_24573 ) ) ( not ( = ?auto_24572 ?auto_24566 ) ) ( not ( = ?auto_24572 ?auto_24563 ) ) ( not ( = ?auto_24572 ?auto_24568 ) ) ( not ( = ?auto_24570 ?auto_24565 ) ) ( not ( = ?auto_24570 ?auto_24567 ) ) ( not ( = ?auto_24570 ?auto_24571 ) ) ( not ( = ?auto_24552 ?auto_24557 ) ) ( not ( = ?auto_24552 ?auto_24561 ) ) ( not ( = ?auto_24553 ?auto_24557 ) ) ( not ( = ?auto_24553 ?auto_24561 ) ) ( not ( = ?auto_24554 ?auto_24557 ) ) ( not ( = ?auto_24554 ?auto_24561 ) ) ( not ( = ?auto_24555 ?auto_24557 ) ) ( not ( = ?auto_24555 ?auto_24561 ) ) ( not ( = ?auto_24557 ?auto_24570 ) ) ( not ( = ?auto_24557 ?auto_24565 ) ) ( not ( = ?auto_24557 ?auto_24567 ) ) ( not ( = ?auto_24557 ?auto_24571 ) ) ( not ( = ?auto_24561 ?auto_24570 ) ) ( not ( = ?auto_24561 ?auto_24565 ) ) ( not ( = ?auto_24561 ?auto_24567 ) ) ( not ( = ?auto_24561 ?auto_24571 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_24552 ?auto_24553 ?auto_24554 ?auto_24555 ?auto_24556 )
      ( MAKE-1CRATE ?auto_24556 ?auto_24557 )
      ( MAKE-5CRATE-VERIFY ?auto_24552 ?auto_24553 ?auto_24554 ?auto_24555 ?auto_24556 ?auto_24557 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_24591 - SURFACE
      ?auto_24592 - SURFACE
      ?auto_24593 - SURFACE
      ?auto_24594 - SURFACE
      ?auto_24595 - SURFACE
      ?auto_24596 - SURFACE
      ?auto_24597 - SURFACE
    )
    :vars
    (
      ?auto_24602 - HOIST
      ?auto_24599 - PLACE
      ?auto_24603 - PLACE
      ?auto_24600 - HOIST
      ?auto_24601 - SURFACE
      ?auto_24615 - PLACE
      ?auto_24614 - HOIST
      ?auto_24613 - SURFACE
      ?auto_24609 - PLACE
      ?auto_24604 - HOIST
      ?auto_24611 - SURFACE
      ?auto_24607 - PLACE
      ?auto_24610 - HOIST
      ?auto_24606 - SURFACE
      ?auto_24605 - SURFACE
      ?auto_24616 - PLACE
      ?auto_24608 - HOIST
      ?auto_24612 - SURFACE
      ?auto_24598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24602 ?auto_24599 ) ( IS-CRATE ?auto_24597 ) ( not ( = ?auto_24603 ?auto_24599 ) ) ( HOIST-AT ?auto_24600 ?auto_24603 ) ( AVAILABLE ?auto_24600 ) ( SURFACE-AT ?auto_24597 ?auto_24603 ) ( ON ?auto_24597 ?auto_24601 ) ( CLEAR ?auto_24597 ) ( not ( = ?auto_24596 ?auto_24597 ) ) ( not ( = ?auto_24596 ?auto_24601 ) ) ( not ( = ?auto_24597 ?auto_24601 ) ) ( not ( = ?auto_24602 ?auto_24600 ) ) ( IS-CRATE ?auto_24596 ) ( not ( = ?auto_24615 ?auto_24599 ) ) ( HOIST-AT ?auto_24614 ?auto_24615 ) ( SURFACE-AT ?auto_24596 ?auto_24615 ) ( ON ?auto_24596 ?auto_24613 ) ( CLEAR ?auto_24596 ) ( not ( = ?auto_24595 ?auto_24596 ) ) ( not ( = ?auto_24595 ?auto_24613 ) ) ( not ( = ?auto_24596 ?auto_24613 ) ) ( not ( = ?auto_24602 ?auto_24614 ) ) ( IS-CRATE ?auto_24595 ) ( not ( = ?auto_24609 ?auto_24599 ) ) ( HOIST-AT ?auto_24604 ?auto_24609 ) ( AVAILABLE ?auto_24604 ) ( SURFACE-AT ?auto_24595 ?auto_24609 ) ( ON ?auto_24595 ?auto_24611 ) ( CLEAR ?auto_24595 ) ( not ( = ?auto_24594 ?auto_24595 ) ) ( not ( = ?auto_24594 ?auto_24611 ) ) ( not ( = ?auto_24595 ?auto_24611 ) ) ( not ( = ?auto_24602 ?auto_24604 ) ) ( IS-CRATE ?auto_24594 ) ( not ( = ?auto_24607 ?auto_24599 ) ) ( HOIST-AT ?auto_24610 ?auto_24607 ) ( AVAILABLE ?auto_24610 ) ( SURFACE-AT ?auto_24594 ?auto_24607 ) ( ON ?auto_24594 ?auto_24606 ) ( CLEAR ?auto_24594 ) ( not ( = ?auto_24593 ?auto_24594 ) ) ( not ( = ?auto_24593 ?auto_24606 ) ) ( not ( = ?auto_24594 ?auto_24606 ) ) ( not ( = ?auto_24602 ?auto_24610 ) ) ( IS-CRATE ?auto_24593 ) ( AVAILABLE ?auto_24614 ) ( SURFACE-AT ?auto_24593 ?auto_24615 ) ( ON ?auto_24593 ?auto_24605 ) ( CLEAR ?auto_24593 ) ( not ( = ?auto_24592 ?auto_24593 ) ) ( not ( = ?auto_24592 ?auto_24605 ) ) ( not ( = ?auto_24593 ?auto_24605 ) ) ( SURFACE-AT ?auto_24591 ?auto_24599 ) ( CLEAR ?auto_24591 ) ( IS-CRATE ?auto_24592 ) ( AVAILABLE ?auto_24602 ) ( not ( = ?auto_24616 ?auto_24599 ) ) ( HOIST-AT ?auto_24608 ?auto_24616 ) ( AVAILABLE ?auto_24608 ) ( SURFACE-AT ?auto_24592 ?auto_24616 ) ( ON ?auto_24592 ?auto_24612 ) ( CLEAR ?auto_24592 ) ( TRUCK-AT ?auto_24598 ?auto_24599 ) ( not ( = ?auto_24591 ?auto_24592 ) ) ( not ( = ?auto_24591 ?auto_24612 ) ) ( not ( = ?auto_24592 ?auto_24612 ) ) ( not ( = ?auto_24602 ?auto_24608 ) ) ( not ( = ?auto_24591 ?auto_24593 ) ) ( not ( = ?auto_24591 ?auto_24605 ) ) ( not ( = ?auto_24593 ?auto_24612 ) ) ( not ( = ?auto_24615 ?auto_24616 ) ) ( not ( = ?auto_24614 ?auto_24608 ) ) ( not ( = ?auto_24605 ?auto_24612 ) ) ( not ( = ?auto_24591 ?auto_24594 ) ) ( not ( = ?auto_24591 ?auto_24606 ) ) ( not ( = ?auto_24592 ?auto_24594 ) ) ( not ( = ?auto_24592 ?auto_24606 ) ) ( not ( = ?auto_24594 ?auto_24605 ) ) ( not ( = ?auto_24594 ?auto_24612 ) ) ( not ( = ?auto_24607 ?auto_24615 ) ) ( not ( = ?auto_24607 ?auto_24616 ) ) ( not ( = ?auto_24610 ?auto_24614 ) ) ( not ( = ?auto_24610 ?auto_24608 ) ) ( not ( = ?auto_24606 ?auto_24605 ) ) ( not ( = ?auto_24606 ?auto_24612 ) ) ( not ( = ?auto_24591 ?auto_24595 ) ) ( not ( = ?auto_24591 ?auto_24611 ) ) ( not ( = ?auto_24592 ?auto_24595 ) ) ( not ( = ?auto_24592 ?auto_24611 ) ) ( not ( = ?auto_24593 ?auto_24595 ) ) ( not ( = ?auto_24593 ?auto_24611 ) ) ( not ( = ?auto_24595 ?auto_24606 ) ) ( not ( = ?auto_24595 ?auto_24605 ) ) ( not ( = ?auto_24595 ?auto_24612 ) ) ( not ( = ?auto_24609 ?auto_24607 ) ) ( not ( = ?auto_24609 ?auto_24615 ) ) ( not ( = ?auto_24609 ?auto_24616 ) ) ( not ( = ?auto_24604 ?auto_24610 ) ) ( not ( = ?auto_24604 ?auto_24614 ) ) ( not ( = ?auto_24604 ?auto_24608 ) ) ( not ( = ?auto_24611 ?auto_24606 ) ) ( not ( = ?auto_24611 ?auto_24605 ) ) ( not ( = ?auto_24611 ?auto_24612 ) ) ( not ( = ?auto_24591 ?auto_24596 ) ) ( not ( = ?auto_24591 ?auto_24613 ) ) ( not ( = ?auto_24592 ?auto_24596 ) ) ( not ( = ?auto_24592 ?auto_24613 ) ) ( not ( = ?auto_24593 ?auto_24596 ) ) ( not ( = ?auto_24593 ?auto_24613 ) ) ( not ( = ?auto_24594 ?auto_24596 ) ) ( not ( = ?auto_24594 ?auto_24613 ) ) ( not ( = ?auto_24596 ?auto_24611 ) ) ( not ( = ?auto_24596 ?auto_24606 ) ) ( not ( = ?auto_24596 ?auto_24605 ) ) ( not ( = ?auto_24596 ?auto_24612 ) ) ( not ( = ?auto_24613 ?auto_24611 ) ) ( not ( = ?auto_24613 ?auto_24606 ) ) ( not ( = ?auto_24613 ?auto_24605 ) ) ( not ( = ?auto_24613 ?auto_24612 ) ) ( not ( = ?auto_24591 ?auto_24597 ) ) ( not ( = ?auto_24591 ?auto_24601 ) ) ( not ( = ?auto_24592 ?auto_24597 ) ) ( not ( = ?auto_24592 ?auto_24601 ) ) ( not ( = ?auto_24593 ?auto_24597 ) ) ( not ( = ?auto_24593 ?auto_24601 ) ) ( not ( = ?auto_24594 ?auto_24597 ) ) ( not ( = ?auto_24594 ?auto_24601 ) ) ( not ( = ?auto_24595 ?auto_24597 ) ) ( not ( = ?auto_24595 ?auto_24601 ) ) ( not ( = ?auto_24597 ?auto_24613 ) ) ( not ( = ?auto_24597 ?auto_24611 ) ) ( not ( = ?auto_24597 ?auto_24606 ) ) ( not ( = ?auto_24597 ?auto_24605 ) ) ( not ( = ?auto_24597 ?auto_24612 ) ) ( not ( = ?auto_24603 ?auto_24615 ) ) ( not ( = ?auto_24603 ?auto_24609 ) ) ( not ( = ?auto_24603 ?auto_24607 ) ) ( not ( = ?auto_24603 ?auto_24616 ) ) ( not ( = ?auto_24600 ?auto_24614 ) ) ( not ( = ?auto_24600 ?auto_24604 ) ) ( not ( = ?auto_24600 ?auto_24610 ) ) ( not ( = ?auto_24600 ?auto_24608 ) ) ( not ( = ?auto_24601 ?auto_24613 ) ) ( not ( = ?auto_24601 ?auto_24611 ) ) ( not ( = ?auto_24601 ?auto_24606 ) ) ( not ( = ?auto_24601 ?auto_24605 ) ) ( not ( = ?auto_24601 ?auto_24612 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_24591 ?auto_24592 ?auto_24593 ?auto_24594 ?auto_24595 ?auto_24596 )
      ( MAKE-1CRATE ?auto_24596 ?auto_24597 )
      ( MAKE-6CRATE-VERIFY ?auto_24591 ?auto_24592 ?auto_24593 ?auto_24594 ?auto_24595 ?auto_24596 ?auto_24597 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_24635 - SURFACE
      ?auto_24636 - SURFACE
      ?auto_24637 - SURFACE
      ?auto_24638 - SURFACE
      ?auto_24639 - SURFACE
      ?auto_24640 - SURFACE
      ?auto_24641 - SURFACE
      ?auto_24642 - SURFACE
    )
    :vars
    (
      ?auto_24647 - HOIST
      ?auto_24645 - PLACE
      ?auto_24643 - PLACE
      ?auto_24644 - HOIST
      ?auto_24646 - SURFACE
      ?auto_24662 - PLACE
      ?auto_24651 - HOIST
      ?auto_24650 - SURFACE
      ?auto_24655 - PLACE
      ?auto_24653 - HOIST
      ?auto_24654 - SURFACE
      ?auto_24659 - PLACE
      ?auto_24661 - HOIST
      ?auto_24657 - SURFACE
      ?auto_24663 - PLACE
      ?auto_24658 - HOIST
      ?auto_24649 - SURFACE
      ?auto_24664 - SURFACE
      ?auto_24656 - PLACE
      ?auto_24660 - HOIST
      ?auto_24652 - SURFACE
      ?auto_24648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24647 ?auto_24645 ) ( IS-CRATE ?auto_24642 ) ( not ( = ?auto_24643 ?auto_24645 ) ) ( HOIST-AT ?auto_24644 ?auto_24643 ) ( AVAILABLE ?auto_24644 ) ( SURFACE-AT ?auto_24642 ?auto_24643 ) ( ON ?auto_24642 ?auto_24646 ) ( CLEAR ?auto_24642 ) ( not ( = ?auto_24641 ?auto_24642 ) ) ( not ( = ?auto_24641 ?auto_24646 ) ) ( not ( = ?auto_24642 ?auto_24646 ) ) ( not ( = ?auto_24647 ?auto_24644 ) ) ( IS-CRATE ?auto_24641 ) ( not ( = ?auto_24662 ?auto_24645 ) ) ( HOIST-AT ?auto_24651 ?auto_24662 ) ( AVAILABLE ?auto_24651 ) ( SURFACE-AT ?auto_24641 ?auto_24662 ) ( ON ?auto_24641 ?auto_24650 ) ( CLEAR ?auto_24641 ) ( not ( = ?auto_24640 ?auto_24641 ) ) ( not ( = ?auto_24640 ?auto_24650 ) ) ( not ( = ?auto_24641 ?auto_24650 ) ) ( not ( = ?auto_24647 ?auto_24651 ) ) ( IS-CRATE ?auto_24640 ) ( not ( = ?auto_24655 ?auto_24645 ) ) ( HOIST-AT ?auto_24653 ?auto_24655 ) ( SURFACE-AT ?auto_24640 ?auto_24655 ) ( ON ?auto_24640 ?auto_24654 ) ( CLEAR ?auto_24640 ) ( not ( = ?auto_24639 ?auto_24640 ) ) ( not ( = ?auto_24639 ?auto_24654 ) ) ( not ( = ?auto_24640 ?auto_24654 ) ) ( not ( = ?auto_24647 ?auto_24653 ) ) ( IS-CRATE ?auto_24639 ) ( not ( = ?auto_24659 ?auto_24645 ) ) ( HOIST-AT ?auto_24661 ?auto_24659 ) ( AVAILABLE ?auto_24661 ) ( SURFACE-AT ?auto_24639 ?auto_24659 ) ( ON ?auto_24639 ?auto_24657 ) ( CLEAR ?auto_24639 ) ( not ( = ?auto_24638 ?auto_24639 ) ) ( not ( = ?auto_24638 ?auto_24657 ) ) ( not ( = ?auto_24639 ?auto_24657 ) ) ( not ( = ?auto_24647 ?auto_24661 ) ) ( IS-CRATE ?auto_24638 ) ( not ( = ?auto_24663 ?auto_24645 ) ) ( HOIST-AT ?auto_24658 ?auto_24663 ) ( AVAILABLE ?auto_24658 ) ( SURFACE-AT ?auto_24638 ?auto_24663 ) ( ON ?auto_24638 ?auto_24649 ) ( CLEAR ?auto_24638 ) ( not ( = ?auto_24637 ?auto_24638 ) ) ( not ( = ?auto_24637 ?auto_24649 ) ) ( not ( = ?auto_24638 ?auto_24649 ) ) ( not ( = ?auto_24647 ?auto_24658 ) ) ( IS-CRATE ?auto_24637 ) ( AVAILABLE ?auto_24653 ) ( SURFACE-AT ?auto_24637 ?auto_24655 ) ( ON ?auto_24637 ?auto_24664 ) ( CLEAR ?auto_24637 ) ( not ( = ?auto_24636 ?auto_24637 ) ) ( not ( = ?auto_24636 ?auto_24664 ) ) ( not ( = ?auto_24637 ?auto_24664 ) ) ( SURFACE-AT ?auto_24635 ?auto_24645 ) ( CLEAR ?auto_24635 ) ( IS-CRATE ?auto_24636 ) ( AVAILABLE ?auto_24647 ) ( not ( = ?auto_24656 ?auto_24645 ) ) ( HOIST-AT ?auto_24660 ?auto_24656 ) ( AVAILABLE ?auto_24660 ) ( SURFACE-AT ?auto_24636 ?auto_24656 ) ( ON ?auto_24636 ?auto_24652 ) ( CLEAR ?auto_24636 ) ( TRUCK-AT ?auto_24648 ?auto_24645 ) ( not ( = ?auto_24635 ?auto_24636 ) ) ( not ( = ?auto_24635 ?auto_24652 ) ) ( not ( = ?auto_24636 ?auto_24652 ) ) ( not ( = ?auto_24647 ?auto_24660 ) ) ( not ( = ?auto_24635 ?auto_24637 ) ) ( not ( = ?auto_24635 ?auto_24664 ) ) ( not ( = ?auto_24637 ?auto_24652 ) ) ( not ( = ?auto_24655 ?auto_24656 ) ) ( not ( = ?auto_24653 ?auto_24660 ) ) ( not ( = ?auto_24664 ?auto_24652 ) ) ( not ( = ?auto_24635 ?auto_24638 ) ) ( not ( = ?auto_24635 ?auto_24649 ) ) ( not ( = ?auto_24636 ?auto_24638 ) ) ( not ( = ?auto_24636 ?auto_24649 ) ) ( not ( = ?auto_24638 ?auto_24664 ) ) ( not ( = ?auto_24638 ?auto_24652 ) ) ( not ( = ?auto_24663 ?auto_24655 ) ) ( not ( = ?auto_24663 ?auto_24656 ) ) ( not ( = ?auto_24658 ?auto_24653 ) ) ( not ( = ?auto_24658 ?auto_24660 ) ) ( not ( = ?auto_24649 ?auto_24664 ) ) ( not ( = ?auto_24649 ?auto_24652 ) ) ( not ( = ?auto_24635 ?auto_24639 ) ) ( not ( = ?auto_24635 ?auto_24657 ) ) ( not ( = ?auto_24636 ?auto_24639 ) ) ( not ( = ?auto_24636 ?auto_24657 ) ) ( not ( = ?auto_24637 ?auto_24639 ) ) ( not ( = ?auto_24637 ?auto_24657 ) ) ( not ( = ?auto_24639 ?auto_24649 ) ) ( not ( = ?auto_24639 ?auto_24664 ) ) ( not ( = ?auto_24639 ?auto_24652 ) ) ( not ( = ?auto_24659 ?auto_24663 ) ) ( not ( = ?auto_24659 ?auto_24655 ) ) ( not ( = ?auto_24659 ?auto_24656 ) ) ( not ( = ?auto_24661 ?auto_24658 ) ) ( not ( = ?auto_24661 ?auto_24653 ) ) ( not ( = ?auto_24661 ?auto_24660 ) ) ( not ( = ?auto_24657 ?auto_24649 ) ) ( not ( = ?auto_24657 ?auto_24664 ) ) ( not ( = ?auto_24657 ?auto_24652 ) ) ( not ( = ?auto_24635 ?auto_24640 ) ) ( not ( = ?auto_24635 ?auto_24654 ) ) ( not ( = ?auto_24636 ?auto_24640 ) ) ( not ( = ?auto_24636 ?auto_24654 ) ) ( not ( = ?auto_24637 ?auto_24640 ) ) ( not ( = ?auto_24637 ?auto_24654 ) ) ( not ( = ?auto_24638 ?auto_24640 ) ) ( not ( = ?auto_24638 ?auto_24654 ) ) ( not ( = ?auto_24640 ?auto_24657 ) ) ( not ( = ?auto_24640 ?auto_24649 ) ) ( not ( = ?auto_24640 ?auto_24664 ) ) ( not ( = ?auto_24640 ?auto_24652 ) ) ( not ( = ?auto_24654 ?auto_24657 ) ) ( not ( = ?auto_24654 ?auto_24649 ) ) ( not ( = ?auto_24654 ?auto_24664 ) ) ( not ( = ?auto_24654 ?auto_24652 ) ) ( not ( = ?auto_24635 ?auto_24641 ) ) ( not ( = ?auto_24635 ?auto_24650 ) ) ( not ( = ?auto_24636 ?auto_24641 ) ) ( not ( = ?auto_24636 ?auto_24650 ) ) ( not ( = ?auto_24637 ?auto_24641 ) ) ( not ( = ?auto_24637 ?auto_24650 ) ) ( not ( = ?auto_24638 ?auto_24641 ) ) ( not ( = ?auto_24638 ?auto_24650 ) ) ( not ( = ?auto_24639 ?auto_24641 ) ) ( not ( = ?auto_24639 ?auto_24650 ) ) ( not ( = ?auto_24641 ?auto_24654 ) ) ( not ( = ?auto_24641 ?auto_24657 ) ) ( not ( = ?auto_24641 ?auto_24649 ) ) ( not ( = ?auto_24641 ?auto_24664 ) ) ( not ( = ?auto_24641 ?auto_24652 ) ) ( not ( = ?auto_24662 ?auto_24655 ) ) ( not ( = ?auto_24662 ?auto_24659 ) ) ( not ( = ?auto_24662 ?auto_24663 ) ) ( not ( = ?auto_24662 ?auto_24656 ) ) ( not ( = ?auto_24651 ?auto_24653 ) ) ( not ( = ?auto_24651 ?auto_24661 ) ) ( not ( = ?auto_24651 ?auto_24658 ) ) ( not ( = ?auto_24651 ?auto_24660 ) ) ( not ( = ?auto_24650 ?auto_24654 ) ) ( not ( = ?auto_24650 ?auto_24657 ) ) ( not ( = ?auto_24650 ?auto_24649 ) ) ( not ( = ?auto_24650 ?auto_24664 ) ) ( not ( = ?auto_24650 ?auto_24652 ) ) ( not ( = ?auto_24635 ?auto_24642 ) ) ( not ( = ?auto_24635 ?auto_24646 ) ) ( not ( = ?auto_24636 ?auto_24642 ) ) ( not ( = ?auto_24636 ?auto_24646 ) ) ( not ( = ?auto_24637 ?auto_24642 ) ) ( not ( = ?auto_24637 ?auto_24646 ) ) ( not ( = ?auto_24638 ?auto_24642 ) ) ( not ( = ?auto_24638 ?auto_24646 ) ) ( not ( = ?auto_24639 ?auto_24642 ) ) ( not ( = ?auto_24639 ?auto_24646 ) ) ( not ( = ?auto_24640 ?auto_24642 ) ) ( not ( = ?auto_24640 ?auto_24646 ) ) ( not ( = ?auto_24642 ?auto_24650 ) ) ( not ( = ?auto_24642 ?auto_24654 ) ) ( not ( = ?auto_24642 ?auto_24657 ) ) ( not ( = ?auto_24642 ?auto_24649 ) ) ( not ( = ?auto_24642 ?auto_24664 ) ) ( not ( = ?auto_24642 ?auto_24652 ) ) ( not ( = ?auto_24643 ?auto_24662 ) ) ( not ( = ?auto_24643 ?auto_24655 ) ) ( not ( = ?auto_24643 ?auto_24659 ) ) ( not ( = ?auto_24643 ?auto_24663 ) ) ( not ( = ?auto_24643 ?auto_24656 ) ) ( not ( = ?auto_24644 ?auto_24651 ) ) ( not ( = ?auto_24644 ?auto_24653 ) ) ( not ( = ?auto_24644 ?auto_24661 ) ) ( not ( = ?auto_24644 ?auto_24658 ) ) ( not ( = ?auto_24644 ?auto_24660 ) ) ( not ( = ?auto_24646 ?auto_24650 ) ) ( not ( = ?auto_24646 ?auto_24654 ) ) ( not ( = ?auto_24646 ?auto_24657 ) ) ( not ( = ?auto_24646 ?auto_24649 ) ) ( not ( = ?auto_24646 ?auto_24664 ) ) ( not ( = ?auto_24646 ?auto_24652 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_24635 ?auto_24636 ?auto_24637 ?auto_24638 ?auto_24639 ?auto_24640 ?auto_24641 )
      ( MAKE-1CRATE ?auto_24641 ?auto_24642 )
      ( MAKE-7CRATE-VERIFY ?auto_24635 ?auto_24636 ?auto_24637 ?auto_24638 ?auto_24639 ?auto_24640 ?auto_24641 ?auto_24642 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_24684 - SURFACE
      ?auto_24685 - SURFACE
      ?auto_24686 - SURFACE
      ?auto_24687 - SURFACE
      ?auto_24688 - SURFACE
      ?auto_24689 - SURFACE
      ?auto_24690 - SURFACE
      ?auto_24691 - SURFACE
      ?auto_24692 - SURFACE
    )
    :vars
    (
      ?auto_24696 - HOIST
      ?auto_24695 - PLACE
      ?auto_24697 - PLACE
      ?auto_24694 - HOIST
      ?auto_24693 - SURFACE
      ?auto_24716 - PLACE
      ?auto_24715 - HOIST
      ?auto_24704 - SURFACE
      ?auto_24707 - PLACE
      ?auto_24706 - HOIST
      ?auto_24711 - SURFACE
      ?auto_24709 - PLACE
      ?auto_24717 - HOIST
      ?auto_24710 - SURFACE
      ?auto_24701 - PLACE
      ?auto_24699 - HOIST
      ?auto_24703 - SURFACE
      ?auto_24705 - PLACE
      ?auto_24702 - HOIST
      ?auto_24713 - SURFACE
      ?auto_24714 - SURFACE
      ?auto_24708 - PLACE
      ?auto_24700 - HOIST
      ?auto_24712 - SURFACE
      ?auto_24698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24696 ?auto_24695 ) ( IS-CRATE ?auto_24692 ) ( not ( = ?auto_24697 ?auto_24695 ) ) ( HOIST-AT ?auto_24694 ?auto_24697 ) ( AVAILABLE ?auto_24694 ) ( SURFACE-AT ?auto_24692 ?auto_24697 ) ( ON ?auto_24692 ?auto_24693 ) ( CLEAR ?auto_24692 ) ( not ( = ?auto_24691 ?auto_24692 ) ) ( not ( = ?auto_24691 ?auto_24693 ) ) ( not ( = ?auto_24692 ?auto_24693 ) ) ( not ( = ?auto_24696 ?auto_24694 ) ) ( IS-CRATE ?auto_24691 ) ( not ( = ?auto_24716 ?auto_24695 ) ) ( HOIST-AT ?auto_24715 ?auto_24716 ) ( AVAILABLE ?auto_24715 ) ( SURFACE-AT ?auto_24691 ?auto_24716 ) ( ON ?auto_24691 ?auto_24704 ) ( CLEAR ?auto_24691 ) ( not ( = ?auto_24690 ?auto_24691 ) ) ( not ( = ?auto_24690 ?auto_24704 ) ) ( not ( = ?auto_24691 ?auto_24704 ) ) ( not ( = ?auto_24696 ?auto_24715 ) ) ( IS-CRATE ?auto_24690 ) ( not ( = ?auto_24707 ?auto_24695 ) ) ( HOIST-AT ?auto_24706 ?auto_24707 ) ( AVAILABLE ?auto_24706 ) ( SURFACE-AT ?auto_24690 ?auto_24707 ) ( ON ?auto_24690 ?auto_24711 ) ( CLEAR ?auto_24690 ) ( not ( = ?auto_24689 ?auto_24690 ) ) ( not ( = ?auto_24689 ?auto_24711 ) ) ( not ( = ?auto_24690 ?auto_24711 ) ) ( not ( = ?auto_24696 ?auto_24706 ) ) ( IS-CRATE ?auto_24689 ) ( not ( = ?auto_24709 ?auto_24695 ) ) ( HOIST-AT ?auto_24717 ?auto_24709 ) ( SURFACE-AT ?auto_24689 ?auto_24709 ) ( ON ?auto_24689 ?auto_24710 ) ( CLEAR ?auto_24689 ) ( not ( = ?auto_24688 ?auto_24689 ) ) ( not ( = ?auto_24688 ?auto_24710 ) ) ( not ( = ?auto_24689 ?auto_24710 ) ) ( not ( = ?auto_24696 ?auto_24717 ) ) ( IS-CRATE ?auto_24688 ) ( not ( = ?auto_24701 ?auto_24695 ) ) ( HOIST-AT ?auto_24699 ?auto_24701 ) ( AVAILABLE ?auto_24699 ) ( SURFACE-AT ?auto_24688 ?auto_24701 ) ( ON ?auto_24688 ?auto_24703 ) ( CLEAR ?auto_24688 ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24703 ) ) ( not ( = ?auto_24688 ?auto_24703 ) ) ( not ( = ?auto_24696 ?auto_24699 ) ) ( IS-CRATE ?auto_24687 ) ( not ( = ?auto_24705 ?auto_24695 ) ) ( HOIST-AT ?auto_24702 ?auto_24705 ) ( AVAILABLE ?auto_24702 ) ( SURFACE-AT ?auto_24687 ?auto_24705 ) ( ON ?auto_24687 ?auto_24713 ) ( CLEAR ?auto_24687 ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( not ( = ?auto_24686 ?auto_24713 ) ) ( not ( = ?auto_24687 ?auto_24713 ) ) ( not ( = ?auto_24696 ?auto_24702 ) ) ( IS-CRATE ?auto_24686 ) ( AVAILABLE ?auto_24717 ) ( SURFACE-AT ?auto_24686 ?auto_24709 ) ( ON ?auto_24686 ?auto_24714 ) ( CLEAR ?auto_24686 ) ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24714 ) ) ( not ( = ?auto_24686 ?auto_24714 ) ) ( SURFACE-AT ?auto_24684 ?auto_24695 ) ( CLEAR ?auto_24684 ) ( IS-CRATE ?auto_24685 ) ( AVAILABLE ?auto_24696 ) ( not ( = ?auto_24708 ?auto_24695 ) ) ( HOIST-AT ?auto_24700 ?auto_24708 ) ( AVAILABLE ?auto_24700 ) ( SURFACE-AT ?auto_24685 ?auto_24708 ) ( ON ?auto_24685 ?auto_24712 ) ( CLEAR ?auto_24685 ) ( TRUCK-AT ?auto_24698 ?auto_24695 ) ( not ( = ?auto_24684 ?auto_24685 ) ) ( not ( = ?auto_24684 ?auto_24712 ) ) ( not ( = ?auto_24685 ?auto_24712 ) ) ( not ( = ?auto_24696 ?auto_24700 ) ) ( not ( = ?auto_24684 ?auto_24686 ) ) ( not ( = ?auto_24684 ?auto_24714 ) ) ( not ( = ?auto_24686 ?auto_24712 ) ) ( not ( = ?auto_24709 ?auto_24708 ) ) ( not ( = ?auto_24717 ?auto_24700 ) ) ( not ( = ?auto_24714 ?auto_24712 ) ) ( not ( = ?auto_24684 ?auto_24687 ) ) ( not ( = ?auto_24684 ?auto_24713 ) ) ( not ( = ?auto_24685 ?auto_24687 ) ) ( not ( = ?auto_24685 ?auto_24713 ) ) ( not ( = ?auto_24687 ?auto_24714 ) ) ( not ( = ?auto_24687 ?auto_24712 ) ) ( not ( = ?auto_24705 ?auto_24709 ) ) ( not ( = ?auto_24705 ?auto_24708 ) ) ( not ( = ?auto_24702 ?auto_24717 ) ) ( not ( = ?auto_24702 ?auto_24700 ) ) ( not ( = ?auto_24713 ?auto_24714 ) ) ( not ( = ?auto_24713 ?auto_24712 ) ) ( not ( = ?auto_24684 ?auto_24688 ) ) ( not ( = ?auto_24684 ?auto_24703 ) ) ( not ( = ?auto_24685 ?auto_24688 ) ) ( not ( = ?auto_24685 ?auto_24703 ) ) ( not ( = ?auto_24686 ?auto_24688 ) ) ( not ( = ?auto_24686 ?auto_24703 ) ) ( not ( = ?auto_24688 ?auto_24713 ) ) ( not ( = ?auto_24688 ?auto_24714 ) ) ( not ( = ?auto_24688 ?auto_24712 ) ) ( not ( = ?auto_24701 ?auto_24705 ) ) ( not ( = ?auto_24701 ?auto_24709 ) ) ( not ( = ?auto_24701 ?auto_24708 ) ) ( not ( = ?auto_24699 ?auto_24702 ) ) ( not ( = ?auto_24699 ?auto_24717 ) ) ( not ( = ?auto_24699 ?auto_24700 ) ) ( not ( = ?auto_24703 ?auto_24713 ) ) ( not ( = ?auto_24703 ?auto_24714 ) ) ( not ( = ?auto_24703 ?auto_24712 ) ) ( not ( = ?auto_24684 ?auto_24689 ) ) ( not ( = ?auto_24684 ?auto_24710 ) ) ( not ( = ?auto_24685 ?auto_24689 ) ) ( not ( = ?auto_24685 ?auto_24710 ) ) ( not ( = ?auto_24686 ?auto_24689 ) ) ( not ( = ?auto_24686 ?auto_24710 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24687 ?auto_24710 ) ) ( not ( = ?auto_24689 ?auto_24703 ) ) ( not ( = ?auto_24689 ?auto_24713 ) ) ( not ( = ?auto_24689 ?auto_24714 ) ) ( not ( = ?auto_24689 ?auto_24712 ) ) ( not ( = ?auto_24710 ?auto_24703 ) ) ( not ( = ?auto_24710 ?auto_24713 ) ) ( not ( = ?auto_24710 ?auto_24714 ) ) ( not ( = ?auto_24710 ?auto_24712 ) ) ( not ( = ?auto_24684 ?auto_24690 ) ) ( not ( = ?auto_24684 ?auto_24711 ) ) ( not ( = ?auto_24685 ?auto_24690 ) ) ( not ( = ?auto_24685 ?auto_24711 ) ) ( not ( = ?auto_24686 ?auto_24690 ) ) ( not ( = ?auto_24686 ?auto_24711 ) ) ( not ( = ?auto_24687 ?auto_24690 ) ) ( not ( = ?auto_24687 ?auto_24711 ) ) ( not ( = ?auto_24688 ?auto_24690 ) ) ( not ( = ?auto_24688 ?auto_24711 ) ) ( not ( = ?auto_24690 ?auto_24710 ) ) ( not ( = ?auto_24690 ?auto_24703 ) ) ( not ( = ?auto_24690 ?auto_24713 ) ) ( not ( = ?auto_24690 ?auto_24714 ) ) ( not ( = ?auto_24690 ?auto_24712 ) ) ( not ( = ?auto_24707 ?auto_24709 ) ) ( not ( = ?auto_24707 ?auto_24701 ) ) ( not ( = ?auto_24707 ?auto_24705 ) ) ( not ( = ?auto_24707 ?auto_24708 ) ) ( not ( = ?auto_24706 ?auto_24717 ) ) ( not ( = ?auto_24706 ?auto_24699 ) ) ( not ( = ?auto_24706 ?auto_24702 ) ) ( not ( = ?auto_24706 ?auto_24700 ) ) ( not ( = ?auto_24711 ?auto_24710 ) ) ( not ( = ?auto_24711 ?auto_24703 ) ) ( not ( = ?auto_24711 ?auto_24713 ) ) ( not ( = ?auto_24711 ?auto_24714 ) ) ( not ( = ?auto_24711 ?auto_24712 ) ) ( not ( = ?auto_24684 ?auto_24691 ) ) ( not ( = ?auto_24684 ?auto_24704 ) ) ( not ( = ?auto_24685 ?auto_24691 ) ) ( not ( = ?auto_24685 ?auto_24704 ) ) ( not ( = ?auto_24686 ?auto_24691 ) ) ( not ( = ?auto_24686 ?auto_24704 ) ) ( not ( = ?auto_24687 ?auto_24691 ) ) ( not ( = ?auto_24687 ?auto_24704 ) ) ( not ( = ?auto_24688 ?auto_24691 ) ) ( not ( = ?auto_24688 ?auto_24704 ) ) ( not ( = ?auto_24689 ?auto_24691 ) ) ( not ( = ?auto_24689 ?auto_24704 ) ) ( not ( = ?auto_24691 ?auto_24711 ) ) ( not ( = ?auto_24691 ?auto_24710 ) ) ( not ( = ?auto_24691 ?auto_24703 ) ) ( not ( = ?auto_24691 ?auto_24713 ) ) ( not ( = ?auto_24691 ?auto_24714 ) ) ( not ( = ?auto_24691 ?auto_24712 ) ) ( not ( = ?auto_24716 ?auto_24707 ) ) ( not ( = ?auto_24716 ?auto_24709 ) ) ( not ( = ?auto_24716 ?auto_24701 ) ) ( not ( = ?auto_24716 ?auto_24705 ) ) ( not ( = ?auto_24716 ?auto_24708 ) ) ( not ( = ?auto_24715 ?auto_24706 ) ) ( not ( = ?auto_24715 ?auto_24717 ) ) ( not ( = ?auto_24715 ?auto_24699 ) ) ( not ( = ?auto_24715 ?auto_24702 ) ) ( not ( = ?auto_24715 ?auto_24700 ) ) ( not ( = ?auto_24704 ?auto_24711 ) ) ( not ( = ?auto_24704 ?auto_24710 ) ) ( not ( = ?auto_24704 ?auto_24703 ) ) ( not ( = ?auto_24704 ?auto_24713 ) ) ( not ( = ?auto_24704 ?auto_24714 ) ) ( not ( = ?auto_24704 ?auto_24712 ) ) ( not ( = ?auto_24684 ?auto_24692 ) ) ( not ( = ?auto_24684 ?auto_24693 ) ) ( not ( = ?auto_24685 ?auto_24692 ) ) ( not ( = ?auto_24685 ?auto_24693 ) ) ( not ( = ?auto_24686 ?auto_24692 ) ) ( not ( = ?auto_24686 ?auto_24693 ) ) ( not ( = ?auto_24687 ?auto_24692 ) ) ( not ( = ?auto_24687 ?auto_24693 ) ) ( not ( = ?auto_24688 ?auto_24692 ) ) ( not ( = ?auto_24688 ?auto_24693 ) ) ( not ( = ?auto_24689 ?auto_24692 ) ) ( not ( = ?auto_24689 ?auto_24693 ) ) ( not ( = ?auto_24690 ?auto_24692 ) ) ( not ( = ?auto_24690 ?auto_24693 ) ) ( not ( = ?auto_24692 ?auto_24704 ) ) ( not ( = ?auto_24692 ?auto_24711 ) ) ( not ( = ?auto_24692 ?auto_24710 ) ) ( not ( = ?auto_24692 ?auto_24703 ) ) ( not ( = ?auto_24692 ?auto_24713 ) ) ( not ( = ?auto_24692 ?auto_24714 ) ) ( not ( = ?auto_24692 ?auto_24712 ) ) ( not ( = ?auto_24697 ?auto_24716 ) ) ( not ( = ?auto_24697 ?auto_24707 ) ) ( not ( = ?auto_24697 ?auto_24709 ) ) ( not ( = ?auto_24697 ?auto_24701 ) ) ( not ( = ?auto_24697 ?auto_24705 ) ) ( not ( = ?auto_24697 ?auto_24708 ) ) ( not ( = ?auto_24694 ?auto_24715 ) ) ( not ( = ?auto_24694 ?auto_24706 ) ) ( not ( = ?auto_24694 ?auto_24717 ) ) ( not ( = ?auto_24694 ?auto_24699 ) ) ( not ( = ?auto_24694 ?auto_24702 ) ) ( not ( = ?auto_24694 ?auto_24700 ) ) ( not ( = ?auto_24693 ?auto_24704 ) ) ( not ( = ?auto_24693 ?auto_24711 ) ) ( not ( = ?auto_24693 ?auto_24710 ) ) ( not ( = ?auto_24693 ?auto_24703 ) ) ( not ( = ?auto_24693 ?auto_24713 ) ) ( not ( = ?auto_24693 ?auto_24714 ) ) ( not ( = ?auto_24693 ?auto_24712 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_24684 ?auto_24685 ?auto_24686 ?auto_24687 ?auto_24688 ?auto_24689 ?auto_24690 ?auto_24691 )
      ( MAKE-1CRATE ?auto_24691 ?auto_24692 )
      ( MAKE-8CRATE-VERIFY ?auto_24684 ?auto_24685 ?auto_24686 ?auto_24687 ?auto_24688 ?auto_24689 ?auto_24690 ?auto_24691 ?auto_24692 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_24738 - SURFACE
      ?auto_24739 - SURFACE
      ?auto_24740 - SURFACE
      ?auto_24741 - SURFACE
      ?auto_24742 - SURFACE
      ?auto_24743 - SURFACE
      ?auto_24744 - SURFACE
      ?auto_24745 - SURFACE
      ?auto_24746 - SURFACE
      ?auto_24747 - SURFACE
    )
    :vars
    (
      ?auto_24749 - HOIST
      ?auto_24748 - PLACE
      ?auto_24750 - PLACE
      ?auto_24751 - HOIST
      ?auto_24753 - SURFACE
      ?auto_24767 - PLACE
      ?auto_24774 - HOIST
      ?auto_24775 - SURFACE
      ?auto_24761 - PLACE
      ?auto_24759 - HOIST
      ?auto_24757 - SURFACE
      ?auto_24755 - PLACE
      ?auto_24773 - HOIST
      ?auto_24771 - SURFACE
      ?auto_24754 - PLACE
      ?auto_24760 - HOIST
      ?auto_24770 - SURFACE
      ?auto_24763 - PLACE
      ?auto_24768 - HOIST
      ?auto_24758 - SURFACE
      ?auto_24756 - PLACE
      ?auto_24766 - HOIST
      ?auto_24762 - SURFACE
      ?auto_24765 - SURFACE
      ?auto_24769 - PLACE
      ?auto_24764 - HOIST
      ?auto_24772 - SURFACE
      ?auto_24752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24749 ?auto_24748 ) ( IS-CRATE ?auto_24747 ) ( not ( = ?auto_24750 ?auto_24748 ) ) ( HOIST-AT ?auto_24751 ?auto_24750 ) ( AVAILABLE ?auto_24751 ) ( SURFACE-AT ?auto_24747 ?auto_24750 ) ( ON ?auto_24747 ?auto_24753 ) ( CLEAR ?auto_24747 ) ( not ( = ?auto_24746 ?auto_24747 ) ) ( not ( = ?auto_24746 ?auto_24753 ) ) ( not ( = ?auto_24747 ?auto_24753 ) ) ( not ( = ?auto_24749 ?auto_24751 ) ) ( IS-CRATE ?auto_24746 ) ( not ( = ?auto_24767 ?auto_24748 ) ) ( HOIST-AT ?auto_24774 ?auto_24767 ) ( AVAILABLE ?auto_24774 ) ( SURFACE-AT ?auto_24746 ?auto_24767 ) ( ON ?auto_24746 ?auto_24775 ) ( CLEAR ?auto_24746 ) ( not ( = ?auto_24745 ?auto_24746 ) ) ( not ( = ?auto_24745 ?auto_24775 ) ) ( not ( = ?auto_24746 ?auto_24775 ) ) ( not ( = ?auto_24749 ?auto_24774 ) ) ( IS-CRATE ?auto_24745 ) ( not ( = ?auto_24761 ?auto_24748 ) ) ( HOIST-AT ?auto_24759 ?auto_24761 ) ( AVAILABLE ?auto_24759 ) ( SURFACE-AT ?auto_24745 ?auto_24761 ) ( ON ?auto_24745 ?auto_24757 ) ( CLEAR ?auto_24745 ) ( not ( = ?auto_24744 ?auto_24745 ) ) ( not ( = ?auto_24744 ?auto_24757 ) ) ( not ( = ?auto_24745 ?auto_24757 ) ) ( not ( = ?auto_24749 ?auto_24759 ) ) ( IS-CRATE ?auto_24744 ) ( not ( = ?auto_24755 ?auto_24748 ) ) ( HOIST-AT ?auto_24773 ?auto_24755 ) ( AVAILABLE ?auto_24773 ) ( SURFACE-AT ?auto_24744 ?auto_24755 ) ( ON ?auto_24744 ?auto_24771 ) ( CLEAR ?auto_24744 ) ( not ( = ?auto_24743 ?auto_24744 ) ) ( not ( = ?auto_24743 ?auto_24771 ) ) ( not ( = ?auto_24744 ?auto_24771 ) ) ( not ( = ?auto_24749 ?auto_24773 ) ) ( IS-CRATE ?auto_24743 ) ( not ( = ?auto_24754 ?auto_24748 ) ) ( HOIST-AT ?auto_24760 ?auto_24754 ) ( SURFACE-AT ?auto_24743 ?auto_24754 ) ( ON ?auto_24743 ?auto_24770 ) ( CLEAR ?auto_24743 ) ( not ( = ?auto_24742 ?auto_24743 ) ) ( not ( = ?auto_24742 ?auto_24770 ) ) ( not ( = ?auto_24743 ?auto_24770 ) ) ( not ( = ?auto_24749 ?auto_24760 ) ) ( IS-CRATE ?auto_24742 ) ( not ( = ?auto_24763 ?auto_24748 ) ) ( HOIST-AT ?auto_24768 ?auto_24763 ) ( AVAILABLE ?auto_24768 ) ( SURFACE-AT ?auto_24742 ?auto_24763 ) ( ON ?auto_24742 ?auto_24758 ) ( CLEAR ?auto_24742 ) ( not ( = ?auto_24741 ?auto_24742 ) ) ( not ( = ?auto_24741 ?auto_24758 ) ) ( not ( = ?auto_24742 ?auto_24758 ) ) ( not ( = ?auto_24749 ?auto_24768 ) ) ( IS-CRATE ?auto_24741 ) ( not ( = ?auto_24756 ?auto_24748 ) ) ( HOIST-AT ?auto_24766 ?auto_24756 ) ( AVAILABLE ?auto_24766 ) ( SURFACE-AT ?auto_24741 ?auto_24756 ) ( ON ?auto_24741 ?auto_24762 ) ( CLEAR ?auto_24741 ) ( not ( = ?auto_24740 ?auto_24741 ) ) ( not ( = ?auto_24740 ?auto_24762 ) ) ( not ( = ?auto_24741 ?auto_24762 ) ) ( not ( = ?auto_24749 ?auto_24766 ) ) ( IS-CRATE ?auto_24740 ) ( AVAILABLE ?auto_24760 ) ( SURFACE-AT ?auto_24740 ?auto_24754 ) ( ON ?auto_24740 ?auto_24765 ) ( CLEAR ?auto_24740 ) ( not ( = ?auto_24739 ?auto_24740 ) ) ( not ( = ?auto_24739 ?auto_24765 ) ) ( not ( = ?auto_24740 ?auto_24765 ) ) ( SURFACE-AT ?auto_24738 ?auto_24748 ) ( CLEAR ?auto_24738 ) ( IS-CRATE ?auto_24739 ) ( AVAILABLE ?auto_24749 ) ( not ( = ?auto_24769 ?auto_24748 ) ) ( HOIST-AT ?auto_24764 ?auto_24769 ) ( AVAILABLE ?auto_24764 ) ( SURFACE-AT ?auto_24739 ?auto_24769 ) ( ON ?auto_24739 ?auto_24772 ) ( CLEAR ?auto_24739 ) ( TRUCK-AT ?auto_24752 ?auto_24748 ) ( not ( = ?auto_24738 ?auto_24739 ) ) ( not ( = ?auto_24738 ?auto_24772 ) ) ( not ( = ?auto_24739 ?auto_24772 ) ) ( not ( = ?auto_24749 ?auto_24764 ) ) ( not ( = ?auto_24738 ?auto_24740 ) ) ( not ( = ?auto_24738 ?auto_24765 ) ) ( not ( = ?auto_24740 ?auto_24772 ) ) ( not ( = ?auto_24754 ?auto_24769 ) ) ( not ( = ?auto_24760 ?auto_24764 ) ) ( not ( = ?auto_24765 ?auto_24772 ) ) ( not ( = ?auto_24738 ?auto_24741 ) ) ( not ( = ?auto_24738 ?auto_24762 ) ) ( not ( = ?auto_24739 ?auto_24741 ) ) ( not ( = ?auto_24739 ?auto_24762 ) ) ( not ( = ?auto_24741 ?auto_24765 ) ) ( not ( = ?auto_24741 ?auto_24772 ) ) ( not ( = ?auto_24756 ?auto_24754 ) ) ( not ( = ?auto_24756 ?auto_24769 ) ) ( not ( = ?auto_24766 ?auto_24760 ) ) ( not ( = ?auto_24766 ?auto_24764 ) ) ( not ( = ?auto_24762 ?auto_24765 ) ) ( not ( = ?auto_24762 ?auto_24772 ) ) ( not ( = ?auto_24738 ?auto_24742 ) ) ( not ( = ?auto_24738 ?auto_24758 ) ) ( not ( = ?auto_24739 ?auto_24742 ) ) ( not ( = ?auto_24739 ?auto_24758 ) ) ( not ( = ?auto_24740 ?auto_24742 ) ) ( not ( = ?auto_24740 ?auto_24758 ) ) ( not ( = ?auto_24742 ?auto_24762 ) ) ( not ( = ?auto_24742 ?auto_24765 ) ) ( not ( = ?auto_24742 ?auto_24772 ) ) ( not ( = ?auto_24763 ?auto_24756 ) ) ( not ( = ?auto_24763 ?auto_24754 ) ) ( not ( = ?auto_24763 ?auto_24769 ) ) ( not ( = ?auto_24768 ?auto_24766 ) ) ( not ( = ?auto_24768 ?auto_24760 ) ) ( not ( = ?auto_24768 ?auto_24764 ) ) ( not ( = ?auto_24758 ?auto_24762 ) ) ( not ( = ?auto_24758 ?auto_24765 ) ) ( not ( = ?auto_24758 ?auto_24772 ) ) ( not ( = ?auto_24738 ?auto_24743 ) ) ( not ( = ?auto_24738 ?auto_24770 ) ) ( not ( = ?auto_24739 ?auto_24743 ) ) ( not ( = ?auto_24739 ?auto_24770 ) ) ( not ( = ?auto_24740 ?auto_24743 ) ) ( not ( = ?auto_24740 ?auto_24770 ) ) ( not ( = ?auto_24741 ?auto_24743 ) ) ( not ( = ?auto_24741 ?auto_24770 ) ) ( not ( = ?auto_24743 ?auto_24758 ) ) ( not ( = ?auto_24743 ?auto_24762 ) ) ( not ( = ?auto_24743 ?auto_24765 ) ) ( not ( = ?auto_24743 ?auto_24772 ) ) ( not ( = ?auto_24770 ?auto_24758 ) ) ( not ( = ?auto_24770 ?auto_24762 ) ) ( not ( = ?auto_24770 ?auto_24765 ) ) ( not ( = ?auto_24770 ?auto_24772 ) ) ( not ( = ?auto_24738 ?auto_24744 ) ) ( not ( = ?auto_24738 ?auto_24771 ) ) ( not ( = ?auto_24739 ?auto_24744 ) ) ( not ( = ?auto_24739 ?auto_24771 ) ) ( not ( = ?auto_24740 ?auto_24744 ) ) ( not ( = ?auto_24740 ?auto_24771 ) ) ( not ( = ?auto_24741 ?auto_24744 ) ) ( not ( = ?auto_24741 ?auto_24771 ) ) ( not ( = ?auto_24742 ?auto_24744 ) ) ( not ( = ?auto_24742 ?auto_24771 ) ) ( not ( = ?auto_24744 ?auto_24770 ) ) ( not ( = ?auto_24744 ?auto_24758 ) ) ( not ( = ?auto_24744 ?auto_24762 ) ) ( not ( = ?auto_24744 ?auto_24765 ) ) ( not ( = ?auto_24744 ?auto_24772 ) ) ( not ( = ?auto_24755 ?auto_24754 ) ) ( not ( = ?auto_24755 ?auto_24763 ) ) ( not ( = ?auto_24755 ?auto_24756 ) ) ( not ( = ?auto_24755 ?auto_24769 ) ) ( not ( = ?auto_24773 ?auto_24760 ) ) ( not ( = ?auto_24773 ?auto_24768 ) ) ( not ( = ?auto_24773 ?auto_24766 ) ) ( not ( = ?auto_24773 ?auto_24764 ) ) ( not ( = ?auto_24771 ?auto_24770 ) ) ( not ( = ?auto_24771 ?auto_24758 ) ) ( not ( = ?auto_24771 ?auto_24762 ) ) ( not ( = ?auto_24771 ?auto_24765 ) ) ( not ( = ?auto_24771 ?auto_24772 ) ) ( not ( = ?auto_24738 ?auto_24745 ) ) ( not ( = ?auto_24738 ?auto_24757 ) ) ( not ( = ?auto_24739 ?auto_24745 ) ) ( not ( = ?auto_24739 ?auto_24757 ) ) ( not ( = ?auto_24740 ?auto_24745 ) ) ( not ( = ?auto_24740 ?auto_24757 ) ) ( not ( = ?auto_24741 ?auto_24745 ) ) ( not ( = ?auto_24741 ?auto_24757 ) ) ( not ( = ?auto_24742 ?auto_24745 ) ) ( not ( = ?auto_24742 ?auto_24757 ) ) ( not ( = ?auto_24743 ?auto_24745 ) ) ( not ( = ?auto_24743 ?auto_24757 ) ) ( not ( = ?auto_24745 ?auto_24771 ) ) ( not ( = ?auto_24745 ?auto_24770 ) ) ( not ( = ?auto_24745 ?auto_24758 ) ) ( not ( = ?auto_24745 ?auto_24762 ) ) ( not ( = ?auto_24745 ?auto_24765 ) ) ( not ( = ?auto_24745 ?auto_24772 ) ) ( not ( = ?auto_24761 ?auto_24755 ) ) ( not ( = ?auto_24761 ?auto_24754 ) ) ( not ( = ?auto_24761 ?auto_24763 ) ) ( not ( = ?auto_24761 ?auto_24756 ) ) ( not ( = ?auto_24761 ?auto_24769 ) ) ( not ( = ?auto_24759 ?auto_24773 ) ) ( not ( = ?auto_24759 ?auto_24760 ) ) ( not ( = ?auto_24759 ?auto_24768 ) ) ( not ( = ?auto_24759 ?auto_24766 ) ) ( not ( = ?auto_24759 ?auto_24764 ) ) ( not ( = ?auto_24757 ?auto_24771 ) ) ( not ( = ?auto_24757 ?auto_24770 ) ) ( not ( = ?auto_24757 ?auto_24758 ) ) ( not ( = ?auto_24757 ?auto_24762 ) ) ( not ( = ?auto_24757 ?auto_24765 ) ) ( not ( = ?auto_24757 ?auto_24772 ) ) ( not ( = ?auto_24738 ?auto_24746 ) ) ( not ( = ?auto_24738 ?auto_24775 ) ) ( not ( = ?auto_24739 ?auto_24746 ) ) ( not ( = ?auto_24739 ?auto_24775 ) ) ( not ( = ?auto_24740 ?auto_24746 ) ) ( not ( = ?auto_24740 ?auto_24775 ) ) ( not ( = ?auto_24741 ?auto_24746 ) ) ( not ( = ?auto_24741 ?auto_24775 ) ) ( not ( = ?auto_24742 ?auto_24746 ) ) ( not ( = ?auto_24742 ?auto_24775 ) ) ( not ( = ?auto_24743 ?auto_24746 ) ) ( not ( = ?auto_24743 ?auto_24775 ) ) ( not ( = ?auto_24744 ?auto_24746 ) ) ( not ( = ?auto_24744 ?auto_24775 ) ) ( not ( = ?auto_24746 ?auto_24757 ) ) ( not ( = ?auto_24746 ?auto_24771 ) ) ( not ( = ?auto_24746 ?auto_24770 ) ) ( not ( = ?auto_24746 ?auto_24758 ) ) ( not ( = ?auto_24746 ?auto_24762 ) ) ( not ( = ?auto_24746 ?auto_24765 ) ) ( not ( = ?auto_24746 ?auto_24772 ) ) ( not ( = ?auto_24767 ?auto_24761 ) ) ( not ( = ?auto_24767 ?auto_24755 ) ) ( not ( = ?auto_24767 ?auto_24754 ) ) ( not ( = ?auto_24767 ?auto_24763 ) ) ( not ( = ?auto_24767 ?auto_24756 ) ) ( not ( = ?auto_24767 ?auto_24769 ) ) ( not ( = ?auto_24774 ?auto_24759 ) ) ( not ( = ?auto_24774 ?auto_24773 ) ) ( not ( = ?auto_24774 ?auto_24760 ) ) ( not ( = ?auto_24774 ?auto_24768 ) ) ( not ( = ?auto_24774 ?auto_24766 ) ) ( not ( = ?auto_24774 ?auto_24764 ) ) ( not ( = ?auto_24775 ?auto_24757 ) ) ( not ( = ?auto_24775 ?auto_24771 ) ) ( not ( = ?auto_24775 ?auto_24770 ) ) ( not ( = ?auto_24775 ?auto_24758 ) ) ( not ( = ?auto_24775 ?auto_24762 ) ) ( not ( = ?auto_24775 ?auto_24765 ) ) ( not ( = ?auto_24775 ?auto_24772 ) ) ( not ( = ?auto_24738 ?auto_24747 ) ) ( not ( = ?auto_24738 ?auto_24753 ) ) ( not ( = ?auto_24739 ?auto_24747 ) ) ( not ( = ?auto_24739 ?auto_24753 ) ) ( not ( = ?auto_24740 ?auto_24747 ) ) ( not ( = ?auto_24740 ?auto_24753 ) ) ( not ( = ?auto_24741 ?auto_24747 ) ) ( not ( = ?auto_24741 ?auto_24753 ) ) ( not ( = ?auto_24742 ?auto_24747 ) ) ( not ( = ?auto_24742 ?auto_24753 ) ) ( not ( = ?auto_24743 ?auto_24747 ) ) ( not ( = ?auto_24743 ?auto_24753 ) ) ( not ( = ?auto_24744 ?auto_24747 ) ) ( not ( = ?auto_24744 ?auto_24753 ) ) ( not ( = ?auto_24745 ?auto_24747 ) ) ( not ( = ?auto_24745 ?auto_24753 ) ) ( not ( = ?auto_24747 ?auto_24775 ) ) ( not ( = ?auto_24747 ?auto_24757 ) ) ( not ( = ?auto_24747 ?auto_24771 ) ) ( not ( = ?auto_24747 ?auto_24770 ) ) ( not ( = ?auto_24747 ?auto_24758 ) ) ( not ( = ?auto_24747 ?auto_24762 ) ) ( not ( = ?auto_24747 ?auto_24765 ) ) ( not ( = ?auto_24747 ?auto_24772 ) ) ( not ( = ?auto_24750 ?auto_24767 ) ) ( not ( = ?auto_24750 ?auto_24761 ) ) ( not ( = ?auto_24750 ?auto_24755 ) ) ( not ( = ?auto_24750 ?auto_24754 ) ) ( not ( = ?auto_24750 ?auto_24763 ) ) ( not ( = ?auto_24750 ?auto_24756 ) ) ( not ( = ?auto_24750 ?auto_24769 ) ) ( not ( = ?auto_24751 ?auto_24774 ) ) ( not ( = ?auto_24751 ?auto_24759 ) ) ( not ( = ?auto_24751 ?auto_24773 ) ) ( not ( = ?auto_24751 ?auto_24760 ) ) ( not ( = ?auto_24751 ?auto_24768 ) ) ( not ( = ?auto_24751 ?auto_24766 ) ) ( not ( = ?auto_24751 ?auto_24764 ) ) ( not ( = ?auto_24753 ?auto_24775 ) ) ( not ( = ?auto_24753 ?auto_24757 ) ) ( not ( = ?auto_24753 ?auto_24771 ) ) ( not ( = ?auto_24753 ?auto_24770 ) ) ( not ( = ?auto_24753 ?auto_24758 ) ) ( not ( = ?auto_24753 ?auto_24762 ) ) ( not ( = ?auto_24753 ?auto_24765 ) ) ( not ( = ?auto_24753 ?auto_24772 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_24738 ?auto_24739 ?auto_24740 ?auto_24741 ?auto_24742 ?auto_24743 ?auto_24744 ?auto_24745 ?auto_24746 )
      ( MAKE-1CRATE ?auto_24746 ?auto_24747 )
      ( MAKE-9CRATE-VERIFY ?auto_24738 ?auto_24739 ?auto_24740 ?auto_24741 ?auto_24742 ?auto_24743 ?auto_24744 ?auto_24745 ?auto_24746 ?auto_24747 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_24797 - SURFACE
      ?auto_24798 - SURFACE
      ?auto_24799 - SURFACE
      ?auto_24800 - SURFACE
      ?auto_24801 - SURFACE
      ?auto_24802 - SURFACE
      ?auto_24803 - SURFACE
      ?auto_24804 - SURFACE
      ?auto_24805 - SURFACE
      ?auto_24806 - SURFACE
      ?auto_24807 - SURFACE
    )
    :vars
    (
      ?auto_24808 - HOIST
      ?auto_24811 - PLACE
      ?auto_24810 - PLACE
      ?auto_24812 - HOIST
      ?auto_24809 - SURFACE
      ?auto_24815 - PLACE
      ?auto_24814 - HOIST
      ?auto_24822 - SURFACE
      ?auto_24829 - PLACE
      ?auto_24816 - HOIST
      ?auto_24831 - SURFACE
      ?auto_24830 - PLACE
      ?auto_24827 - HOIST
      ?auto_24819 - SURFACE
      ?auto_24835 - PLACE
      ?auto_24817 - HOIST
      ?auto_24832 - SURFACE
      ?auto_24824 - SURFACE
      ?auto_24833 - PLACE
      ?auto_24823 - HOIST
      ?auto_24828 - SURFACE
      ?auto_24820 - PLACE
      ?auto_24818 - HOIST
      ?auto_24825 - SURFACE
      ?auto_24834 - SURFACE
      ?auto_24826 - PLACE
      ?auto_24821 - HOIST
      ?auto_24836 - SURFACE
      ?auto_24813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24808 ?auto_24811 ) ( IS-CRATE ?auto_24807 ) ( not ( = ?auto_24810 ?auto_24811 ) ) ( HOIST-AT ?auto_24812 ?auto_24810 ) ( SURFACE-AT ?auto_24807 ?auto_24810 ) ( ON ?auto_24807 ?auto_24809 ) ( CLEAR ?auto_24807 ) ( not ( = ?auto_24806 ?auto_24807 ) ) ( not ( = ?auto_24806 ?auto_24809 ) ) ( not ( = ?auto_24807 ?auto_24809 ) ) ( not ( = ?auto_24808 ?auto_24812 ) ) ( IS-CRATE ?auto_24806 ) ( not ( = ?auto_24815 ?auto_24811 ) ) ( HOIST-AT ?auto_24814 ?auto_24815 ) ( AVAILABLE ?auto_24814 ) ( SURFACE-AT ?auto_24806 ?auto_24815 ) ( ON ?auto_24806 ?auto_24822 ) ( CLEAR ?auto_24806 ) ( not ( = ?auto_24805 ?auto_24806 ) ) ( not ( = ?auto_24805 ?auto_24822 ) ) ( not ( = ?auto_24806 ?auto_24822 ) ) ( not ( = ?auto_24808 ?auto_24814 ) ) ( IS-CRATE ?auto_24805 ) ( not ( = ?auto_24829 ?auto_24811 ) ) ( HOIST-AT ?auto_24816 ?auto_24829 ) ( AVAILABLE ?auto_24816 ) ( SURFACE-AT ?auto_24805 ?auto_24829 ) ( ON ?auto_24805 ?auto_24831 ) ( CLEAR ?auto_24805 ) ( not ( = ?auto_24804 ?auto_24805 ) ) ( not ( = ?auto_24804 ?auto_24831 ) ) ( not ( = ?auto_24805 ?auto_24831 ) ) ( not ( = ?auto_24808 ?auto_24816 ) ) ( IS-CRATE ?auto_24804 ) ( not ( = ?auto_24830 ?auto_24811 ) ) ( HOIST-AT ?auto_24827 ?auto_24830 ) ( AVAILABLE ?auto_24827 ) ( SURFACE-AT ?auto_24804 ?auto_24830 ) ( ON ?auto_24804 ?auto_24819 ) ( CLEAR ?auto_24804 ) ( not ( = ?auto_24803 ?auto_24804 ) ) ( not ( = ?auto_24803 ?auto_24819 ) ) ( not ( = ?auto_24804 ?auto_24819 ) ) ( not ( = ?auto_24808 ?auto_24827 ) ) ( IS-CRATE ?auto_24803 ) ( not ( = ?auto_24835 ?auto_24811 ) ) ( HOIST-AT ?auto_24817 ?auto_24835 ) ( AVAILABLE ?auto_24817 ) ( SURFACE-AT ?auto_24803 ?auto_24835 ) ( ON ?auto_24803 ?auto_24832 ) ( CLEAR ?auto_24803 ) ( not ( = ?auto_24802 ?auto_24803 ) ) ( not ( = ?auto_24802 ?auto_24832 ) ) ( not ( = ?auto_24803 ?auto_24832 ) ) ( not ( = ?auto_24808 ?auto_24817 ) ) ( IS-CRATE ?auto_24802 ) ( SURFACE-AT ?auto_24802 ?auto_24810 ) ( ON ?auto_24802 ?auto_24824 ) ( CLEAR ?auto_24802 ) ( not ( = ?auto_24801 ?auto_24802 ) ) ( not ( = ?auto_24801 ?auto_24824 ) ) ( not ( = ?auto_24802 ?auto_24824 ) ) ( IS-CRATE ?auto_24801 ) ( not ( = ?auto_24833 ?auto_24811 ) ) ( HOIST-AT ?auto_24823 ?auto_24833 ) ( AVAILABLE ?auto_24823 ) ( SURFACE-AT ?auto_24801 ?auto_24833 ) ( ON ?auto_24801 ?auto_24828 ) ( CLEAR ?auto_24801 ) ( not ( = ?auto_24800 ?auto_24801 ) ) ( not ( = ?auto_24800 ?auto_24828 ) ) ( not ( = ?auto_24801 ?auto_24828 ) ) ( not ( = ?auto_24808 ?auto_24823 ) ) ( IS-CRATE ?auto_24800 ) ( not ( = ?auto_24820 ?auto_24811 ) ) ( HOIST-AT ?auto_24818 ?auto_24820 ) ( AVAILABLE ?auto_24818 ) ( SURFACE-AT ?auto_24800 ?auto_24820 ) ( ON ?auto_24800 ?auto_24825 ) ( CLEAR ?auto_24800 ) ( not ( = ?auto_24799 ?auto_24800 ) ) ( not ( = ?auto_24799 ?auto_24825 ) ) ( not ( = ?auto_24800 ?auto_24825 ) ) ( not ( = ?auto_24808 ?auto_24818 ) ) ( IS-CRATE ?auto_24799 ) ( AVAILABLE ?auto_24812 ) ( SURFACE-AT ?auto_24799 ?auto_24810 ) ( ON ?auto_24799 ?auto_24834 ) ( CLEAR ?auto_24799 ) ( not ( = ?auto_24798 ?auto_24799 ) ) ( not ( = ?auto_24798 ?auto_24834 ) ) ( not ( = ?auto_24799 ?auto_24834 ) ) ( SURFACE-AT ?auto_24797 ?auto_24811 ) ( CLEAR ?auto_24797 ) ( IS-CRATE ?auto_24798 ) ( AVAILABLE ?auto_24808 ) ( not ( = ?auto_24826 ?auto_24811 ) ) ( HOIST-AT ?auto_24821 ?auto_24826 ) ( AVAILABLE ?auto_24821 ) ( SURFACE-AT ?auto_24798 ?auto_24826 ) ( ON ?auto_24798 ?auto_24836 ) ( CLEAR ?auto_24798 ) ( TRUCK-AT ?auto_24813 ?auto_24811 ) ( not ( = ?auto_24797 ?auto_24798 ) ) ( not ( = ?auto_24797 ?auto_24836 ) ) ( not ( = ?auto_24798 ?auto_24836 ) ) ( not ( = ?auto_24808 ?auto_24821 ) ) ( not ( = ?auto_24797 ?auto_24799 ) ) ( not ( = ?auto_24797 ?auto_24834 ) ) ( not ( = ?auto_24799 ?auto_24836 ) ) ( not ( = ?auto_24810 ?auto_24826 ) ) ( not ( = ?auto_24812 ?auto_24821 ) ) ( not ( = ?auto_24834 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24800 ) ) ( not ( = ?auto_24797 ?auto_24825 ) ) ( not ( = ?auto_24798 ?auto_24800 ) ) ( not ( = ?auto_24798 ?auto_24825 ) ) ( not ( = ?auto_24800 ?auto_24834 ) ) ( not ( = ?auto_24800 ?auto_24836 ) ) ( not ( = ?auto_24820 ?auto_24810 ) ) ( not ( = ?auto_24820 ?auto_24826 ) ) ( not ( = ?auto_24818 ?auto_24812 ) ) ( not ( = ?auto_24818 ?auto_24821 ) ) ( not ( = ?auto_24825 ?auto_24834 ) ) ( not ( = ?auto_24825 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24801 ) ) ( not ( = ?auto_24797 ?auto_24828 ) ) ( not ( = ?auto_24798 ?auto_24801 ) ) ( not ( = ?auto_24798 ?auto_24828 ) ) ( not ( = ?auto_24799 ?auto_24801 ) ) ( not ( = ?auto_24799 ?auto_24828 ) ) ( not ( = ?auto_24801 ?auto_24825 ) ) ( not ( = ?auto_24801 ?auto_24834 ) ) ( not ( = ?auto_24801 ?auto_24836 ) ) ( not ( = ?auto_24833 ?auto_24820 ) ) ( not ( = ?auto_24833 ?auto_24810 ) ) ( not ( = ?auto_24833 ?auto_24826 ) ) ( not ( = ?auto_24823 ?auto_24818 ) ) ( not ( = ?auto_24823 ?auto_24812 ) ) ( not ( = ?auto_24823 ?auto_24821 ) ) ( not ( = ?auto_24828 ?auto_24825 ) ) ( not ( = ?auto_24828 ?auto_24834 ) ) ( not ( = ?auto_24828 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24802 ) ) ( not ( = ?auto_24797 ?auto_24824 ) ) ( not ( = ?auto_24798 ?auto_24802 ) ) ( not ( = ?auto_24798 ?auto_24824 ) ) ( not ( = ?auto_24799 ?auto_24802 ) ) ( not ( = ?auto_24799 ?auto_24824 ) ) ( not ( = ?auto_24800 ?auto_24802 ) ) ( not ( = ?auto_24800 ?auto_24824 ) ) ( not ( = ?auto_24802 ?auto_24828 ) ) ( not ( = ?auto_24802 ?auto_24825 ) ) ( not ( = ?auto_24802 ?auto_24834 ) ) ( not ( = ?auto_24802 ?auto_24836 ) ) ( not ( = ?auto_24824 ?auto_24828 ) ) ( not ( = ?auto_24824 ?auto_24825 ) ) ( not ( = ?auto_24824 ?auto_24834 ) ) ( not ( = ?auto_24824 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24803 ) ) ( not ( = ?auto_24797 ?auto_24832 ) ) ( not ( = ?auto_24798 ?auto_24803 ) ) ( not ( = ?auto_24798 ?auto_24832 ) ) ( not ( = ?auto_24799 ?auto_24803 ) ) ( not ( = ?auto_24799 ?auto_24832 ) ) ( not ( = ?auto_24800 ?auto_24803 ) ) ( not ( = ?auto_24800 ?auto_24832 ) ) ( not ( = ?auto_24801 ?auto_24803 ) ) ( not ( = ?auto_24801 ?auto_24832 ) ) ( not ( = ?auto_24803 ?auto_24824 ) ) ( not ( = ?auto_24803 ?auto_24828 ) ) ( not ( = ?auto_24803 ?auto_24825 ) ) ( not ( = ?auto_24803 ?auto_24834 ) ) ( not ( = ?auto_24803 ?auto_24836 ) ) ( not ( = ?auto_24835 ?auto_24810 ) ) ( not ( = ?auto_24835 ?auto_24833 ) ) ( not ( = ?auto_24835 ?auto_24820 ) ) ( not ( = ?auto_24835 ?auto_24826 ) ) ( not ( = ?auto_24817 ?auto_24812 ) ) ( not ( = ?auto_24817 ?auto_24823 ) ) ( not ( = ?auto_24817 ?auto_24818 ) ) ( not ( = ?auto_24817 ?auto_24821 ) ) ( not ( = ?auto_24832 ?auto_24824 ) ) ( not ( = ?auto_24832 ?auto_24828 ) ) ( not ( = ?auto_24832 ?auto_24825 ) ) ( not ( = ?auto_24832 ?auto_24834 ) ) ( not ( = ?auto_24832 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24804 ) ) ( not ( = ?auto_24797 ?auto_24819 ) ) ( not ( = ?auto_24798 ?auto_24804 ) ) ( not ( = ?auto_24798 ?auto_24819 ) ) ( not ( = ?auto_24799 ?auto_24804 ) ) ( not ( = ?auto_24799 ?auto_24819 ) ) ( not ( = ?auto_24800 ?auto_24804 ) ) ( not ( = ?auto_24800 ?auto_24819 ) ) ( not ( = ?auto_24801 ?auto_24804 ) ) ( not ( = ?auto_24801 ?auto_24819 ) ) ( not ( = ?auto_24802 ?auto_24804 ) ) ( not ( = ?auto_24802 ?auto_24819 ) ) ( not ( = ?auto_24804 ?auto_24832 ) ) ( not ( = ?auto_24804 ?auto_24824 ) ) ( not ( = ?auto_24804 ?auto_24828 ) ) ( not ( = ?auto_24804 ?auto_24825 ) ) ( not ( = ?auto_24804 ?auto_24834 ) ) ( not ( = ?auto_24804 ?auto_24836 ) ) ( not ( = ?auto_24830 ?auto_24835 ) ) ( not ( = ?auto_24830 ?auto_24810 ) ) ( not ( = ?auto_24830 ?auto_24833 ) ) ( not ( = ?auto_24830 ?auto_24820 ) ) ( not ( = ?auto_24830 ?auto_24826 ) ) ( not ( = ?auto_24827 ?auto_24817 ) ) ( not ( = ?auto_24827 ?auto_24812 ) ) ( not ( = ?auto_24827 ?auto_24823 ) ) ( not ( = ?auto_24827 ?auto_24818 ) ) ( not ( = ?auto_24827 ?auto_24821 ) ) ( not ( = ?auto_24819 ?auto_24832 ) ) ( not ( = ?auto_24819 ?auto_24824 ) ) ( not ( = ?auto_24819 ?auto_24828 ) ) ( not ( = ?auto_24819 ?auto_24825 ) ) ( not ( = ?auto_24819 ?auto_24834 ) ) ( not ( = ?auto_24819 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24805 ) ) ( not ( = ?auto_24797 ?auto_24831 ) ) ( not ( = ?auto_24798 ?auto_24805 ) ) ( not ( = ?auto_24798 ?auto_24831 ) ) ( not ( = ?auto_24799 ?auto_24805 ) ) ( not ( = ?auto_24799 ?auto_24831 ) ) ( not ( = ?auto_24800 ?auto_24805 ) ) ( not ( = ?auto_24800 ?auto_24831 ) ) ( not ( = ?auto_24801 ?auto_24805 ) ) ( not ( = ?auto_24801 ?auto_24831 ) ) ( not ( = ?auto_24802 ?auto_24805 ) ) ( not ( = ?auto_24802 ?auto_24831 ) ) ( not ( = ?auto_24803 ?auto_24805 ) ) ( not ( = ?auto_24803 ?auto_24831 ) ) ( not ( = ?auto_24805 ?auto_24819 ) ) ( not ( = ?auto_24805 ?auto_24832 ) ) ( not ( = ?auto_24805 ?auto_24824 ) ) ( not ( = ?auto_24805 ?auto_24828 ) ) ( not ( = ?auto_24805 ?auto_24825 ) ) ( not ( = ?auto_24805 ?auto_24834 ) ) ( not ( = ?auto_24805 ?auto_24836 ) ) ( not ( = ?auto_24829 ?auto_24830 ) ) ( not ( = ?auto_24829 ?auto_24835 ) ) ( not ( = ?auto_24829 ?auto_24810 ) ) ( not ( = ?auto_24829 ?auto_24833 ) ) ( not ( = ?auto_24829 ?auto_24820 ) ) ( not ( = ?auto_24829 ?auto_24826 ) ) ( not ( = ?auto_24816 ?auto_24827 ) ) ( not ( = ?auto_24816 ?auto_24817 ) ) ( not ( = ?auto_24816 ?auto_24812 ) ) ( not ( = ?auto_24816 ?auto_24823 ) ) ( not ( = ?auto_24816 ?auto_24818 ) ) ( not ( = ?auto_24816 ?auto_24821 ) ) ( not ( = ?auto_24831 ?auto_24819 ) ) ( not ( = ?auto_24831 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24824 ) ) ( not ( = ?auto_24831 ?auto_24828 ) ) ( not ( = ?auto_24831 ?auto_24825 ) ) ( not ( = ?auto_24831 ?auto_24834 ) ) ( not ( = ?auto_24831 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24806 ) ) ( not ( = ?auto_24797 ?auto_24822 ) ) ( not ( = ?auto_24798 ?auto_24806 ) ) ( not ( = ?auto_24798 ?auto_24822 ) ) ( not ( = ?auto_24799 ?auto_24806 ) ) ( not ( = ?auto_24799 ?auto_24822 ) ) ( not ( = ?auto_24800 ?auto_24806 ) ) ( not ( = ?auto_24800 ?auto_24822 ) ) ( not ( = ?auto_24801 ?auto_24806 ) ) ( not ( = ?auto_24801 ?auto_24822 ) ) ( not ( = ?auto_24802 ?auto_24806 ) ) ( not ( = ?auto_24802 ?auto_24822 ) ) ( not ( = ?auto_24803 ?auto_24806 ) ) ( not ( = ?auto_24803 ?auto_24822 ) ) ( not ( = ?auto_24804 ?auto_24806 ) ) ( not ( = ?auto_24804 ?auto_24822 ) ) ( not ( = ?auto_24806 ?auto_24831 ) ) ( not ( = ?auto_24806 ?auto_24819 ) ) ( not ( = ?auto_24806 ?auto_24832 ) ) ( not ( = ?auto_24806 ?auto_24824 ) ) ( not ( = ?auto_24806 ?auto_24828 ) ) ( not ( = ?auto_24806 ?auto_24825 ) ) ( not ( = ?auto_24806 ?auto_24834 ) ) ( not ( = ?auto_24806 ?auto_24836 ) ) ( not ( = ?auto_24815 ?auto_24829 ) ) ( not ( = ?auto_24815 ?auto_24830 ) ) ( not ( = ?auto_24815 ?auto_24835 ) ) ( not ( = ?auto_24815 ?auto_24810 ) ) ( not ( = ?auto_24815 ?auto_24833 ) ) ( not ( = ?auto_24815 ?auto_24820 ) ) ( not ( = ?auto_24815 ?auto_24826 ) ) ( not ( = ?auto_24814 ?auto_24816 ) ) ( not ( = ?auto_24814 ?auto_24827 ) ) ( not ( = ?auto_24814 ?auto_24817 ) ) ( not ( = ?auto_24814 ?auto_24812 ) ) ( not ( = ?auto_24814 ?auto_24823 ) ) ( not ( = ?auto_24814 ?auto_24818 ) ) ( not ( = ?auto_24814 ?auto_24821 ) ) ( not ( = ?auto_24822 ?auto_24831 ) ) ( not ( = ?auto_24822 ?auto_24819 ) ) ( not ( = ?auto_24822 ?auto_24832 ) ) ( not ( = ?auto_24822 ?auto_24824 ) ) ( not ( = ?auto_24822 ?auto_24828 ) ) ( not ( = ?auto_24822 ?auto_24825 ) ) ( not ( = ?auto_24822 ?auto_24834 ) ) ( not ( = ?auto_24822 ?auto_24836 ) ) ( not ( = ?auto_24797 ?auto_24807 ) ) ( not ( = ?auto_24797 ?auto_24809 ) ) ( not ( = ?auto_24798 ?auto_24807 ) ) ( not ( = ?auto_24798 ?auto_24809 ) ) ( not ( = ?auto_24799 ?auto_24807 ) ) ( not ( = ?auto_24799 ?auto_24809 ) ) ( not ( = ?auto_24800 ?auto_24807 ) ) ( not ( = ?auto_24800 ?auto_24809 ) ) ( not ( = ?auto_24801 ?auto_24807 ) ) ( not ( = ?auto_24801 ?auto_24809 ) ) ( not ( = ?auto_24802 ?auto_24807 ) ) ( not ( = ?auto_24802 ?auto_24809 ) ) ( not ( = ?auto_24803 ?auto_24807 ) ) ( not ( = ?auto_24803 ?auto_24809 ) ) ( not ( = ?auto_24804 ?auto_24807 ) ) ( not ( = ?auto_24804 ?auto_24809 ) ) ( not ( = ?auto_24805 ?auto_24807 ) ) ( not ( = ?auto_24805 ?auto_24809 ) ) ( not ( = ?auto_24807 ?auto_24822 ) ) ( not ( = ?auto_24807 ?auto_24831 ) ) ( not ( = ?auto_24807 ?auto_24819 ) ) ( not ( = ?auto_24807 ?auto_24832 ) ) ( not ( = ?auto_24807 ?auto_24824 ) ) ( not ( = ?auto_24807 ?auto_24828 ) ) ( not ( = ?auto_24807 ?auto_24825 ) ) ( not ( = ?auto_24807 ?auto_24834 ) ) ( not ( = ?auto_24807 ?auto_24836 ) ) ( not ( = ?auto_24809 ?auto_24822 ) ) ( not ( = ?auto_24809 ?auto_24831 ) ) ( not ( = ?auto_24809 ?auto_24819 ) ) ( not ( = ?auto_24809 ?auto_24832 ) ) ( not ( = ?auto_24809 ?auto_24824 ) ) ( not ( = ?auto_24809 ?auto_24828 ) ) ( not ( = ?auto_24809 ?auto_24825 ) ) ( not ( = ?auto_24809 ?auto_24834 ) ) ( not ( = ?auto_24809 ?auto_24836 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_24797 ?auto_24798 ?auto_24799 ?auto_24800 ?auto_24801 ?auto_24802 ?auto_24803 ?auto_24804 ?auto_24805 ?auto_24806 )
      ( MAKE-1CRATE ?auto_24806 ?auto_24807 )
      ( MAKE-10CRATE-VERIFY ?auto_24797 ?auto_24798 ?auto_24799 ?auto_24800 ?auto_24801 ?auto_24802 ?auto_24803 ?auto_24804 ?auto_24805 ?auto_24806 ?auto_24807 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_24859 - SURFACE
      ?auto_24860 - SURFACE
      ?auto_24861 - SURFACE
      ?auto_24862 - SURFACE
      ?auto_24863 - SURFACE
      ?auto_24864 - SURFACE
      ?auto_24865 - SURFACE
      ?auto_24866 - SURFACE
      ?auto_24867 - SURFACE
      ?auto_24868 - SURFACE
      ?auto_24869 - SURFACE
      ?auto_24870 - SURFACE
    )
    :vars
    (
      ?auto_24873 - HOIST
      ?auto_24875 - PLACE
      ?auto_24876 - PLACE
      ?auto_24874 - HOIST
      ?auto_24872 - SURFACE
      ?auto_24889 - PLACE
      ?auto_24895 - HOIST
      ?auto_24890 - SURFACE
      ?auto_24887 - PLACE
      ?auto_24877 - HOIST
      ?auto_24893 - SURFACE
      ?auto_24888 - PLACE
      ?auto_24900 - HOIST
      ?auto_24881 - SURFACE
      ?auto_24886 - PLACE
      ?auto_24884 - HOIST
      ?auto_24894 - SURFACE
      ?auto_24901 - PLACE
      ?auto_24885 - HOIST
      ?auto_24899 - SURFACE
      ?auto_24891 - SURFACE
      ?auto_24892 - PLACE
      ?auto_24883 - HOIST
      ?auto_24880 - SURFACE
      ?auto_24896 - PLACE
      ?auto_24898 - HOIST
      ?auto_24897 - SURFACE
      ?auto_24902 - SURFACE
      ?auto_24882 - PLACE
      ?auto_24879 - HOIST
      ?auto_24878 - SURFACE
      ?auto_24871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24873 ?auto_24875 ) ( IS-CRATE ?auto_24870 ) ( not ( = ?auto_24876 ?auto_24875 ) ) ( HOIST-AT ?auto_24874 ?auto_24876 ) ( AVAILABLE ?auto_24874 ) ( SURFACE-AT ?auto_24870 ?auto_24876 ) ( ON ?auto_24870 ?auto_24872 ) ( CLEAR ?auto_24870 ) ( not ( = ?auto_24869 ?auto_24870 ) ) ( not ( = ?auto_24869 ?auto_24872 ) ) ( not ( = ?auto_24870 ?auto_24872 ) ) ( not ( = ?auto_24873 ?auto_24874 ) ) ( IS-CRATE ?auto_24869 ) ( not ( = ?auto_24889 ?auto_24875 ) ) ( HOIST-AT ?auto_24895 ?auto_24889 ) ( SURFACE-AT ?auto_24869 ?auto_24889 ) ( ON ?auto_24869 ?auto_24890 ) ( CLEAR ?auto_24869 ) ( not ( = ?auto_24868 ?auto_24869 ) ) ( not ( = ?auto_24868 ?auto_24890 ) ) ( not ( = ?auto_24869 ?auto_24890 ) ) ( not ( = ?auto_24873 ?auto_24895 ) ) ( IS-CRATE ?auto_24868 ) ( not ( = ?auto_24887 ?auto_24875 ) ) ( HOIST-AT ?auto_24877 ?auto_24887 ) ( AVAILABLE ?auto_24877 ) ( SURFACE-AT ?auto_24868 ?auto_24887 ) ( ON ?auto_24868 ?auto_24893 ) ( CLEAR ?auto_24868 ) ( not ( = ?auto_24867 ?auto_24868 ) ) ( not ( = ?auto_24867 ?auto_24893 ) ) ( not ( = ?auto_24868 ?auto_24893 ) ) ( not ( = ?auto_24873 ?auto_24877 ) ) ( IS-CRATE ?auto_24867 ) ( not ( = ?auto_24888 ?auto_24875 ) ) ( HOIST-AT ?auto_24900 ?auto_24888 ) ( AVAILABLE ?auto_24900 ) ( SURFACE-AT ?auto_24867 ?auto_24888 ) ( ON ?auto_24867 ?auto_24881 ) ( CLEAR ?auto_24867 ) ( not ( = ?auto_24866 ?auto_24867 ) ) ( not ( = ?auto_24866 ?auto_24881 ) ) ( not ( = ?auto_24867 ?auto_24881 ) ) ( not ( = ?auto_24873 ?auto_24900 ) ) ( IS-CRATE ?auto_24866 ) ( not ( = ?auto_24886 ?auto_24875 ) ) ( HOIST-AT ?auto_24884 ?auto_24886 ) ( AVAILABLE ?auto_24884 ) ( SURFACE-AT ?auto_24866 ?auto_24886 ) ( ON ?auto_24866 ?auto_24894 ) ( CLEAR ?auto_24866 ) ( not ( = ?auto_24865 ?auto_24866 ) ) ( not ( = ?auto_24865 ?auto_24894 ) ) ( not ( = ?auto_24866 ?auto_24894 ) ) ( not ( = ?auto_24873 ?auto_24884 ) ) ( IS-CRATE ?auto_24865 ) ( not ( = ?auto_24901 ?auto_24875 ) ) ( HOIST-AT ?auto_24885 ?auto_24901 ) ( AVAILABLE ?auto_24885 ) ( SURFACE-AT ?auto_24865 ?auto_24901 ) ( ON ?auto_24865 ?auto_24899 ) ( CLEAR ?auto_24865 ) ( not ( = ?auto_24864 ?auto_24865 ) ) ( not ( = ?auto_24864 ?auto_24899 ) ) ( not ( = ?auto_24865 ?auto_24899 ) ) ( not ( = ?auto_24873 ?auto_24885 ) ) ( IS-CRATE ?auto_24864 ) ( SURFACE-AT ?auto_24864 ?auto_24889 ) ( ON ?auto_24864 ?auto_24891 ) ( CLEAR ?auto_24864 ) ( not ( = ?auto_24863 ?auto_24864 ) ) ( not ( = ?auto_24863 ?auto_24891 ) ) ( not ( = ?auto_24864 ?auto_24891 ) ) ( IS-CRATE ?auto_24863 ) ( not ( = ?auto_24892 ?auto_24875 ) ) ( HOIST-AT ?auto_24883 ?auto_24892 ) ( AVAILABLE ?auto_24883 ) ( SURFACE-AT ?auto_24863 ?auto_24892 ) ( ON ?auto_24863 ?auto_24880 ) ( CLEAR ?auto_24863 ) ( not ( = ?auto_24862 ?auto_24863 ) ) ( not ( = ?auto_24862 ?auto_24880 ) ) ( not ( = ?auto_24863 ?auto_24880 ) ) ( not ( = ?auto_24873 ?auto_24883 ) ) ( IS-CRATE ?auto_24862 ) ( not ( = ?auto_24896 ?auto_24875 ) ) ( HOIST-AT ?auto_24898 ?auto_24896 ) ( AVAILABLE ?auto_24898 ) ( SURFACE-AT ?auto_24862 ?auto_24896 ) ( ON ?auto_24862 ?auto_24897 ) ( CLEAR ?auto_24862 ) ( not ( = ?auto_24861 ?auto_24862 ) ) ( not ( = ?auto_24861 ?auto_24897 ) ) ( not ( = ?auto_24862 ?auto_24897 ) ) ( not ( = ?auto_24873 ?auto_24898 ) ) ( IS-CRATE ?auto_24861 ) ( AVAILABLE ?auto_24895 ) ( SURFACE-AT ?auto_24861 ?auto_24889 ) ( ON ?auto_24861 ?auto_24902 ) ( CLEAR ?auto_24861 ) ( not ( = ?auto_24860 ?auto_24861 ) ) ( not ( = ?auto_24860 ?auto_24902 ) ) ( not ( = ?auto_24861 ?auto_24902 ) ) ( SURFACE-AT ?auto_24859 ?auto_24875 ) ( CLEAR ?auto_24859 ) ( IS-CRATE ?auto_24860 ) ( AVAILABLE ?auto_24873 ) ( not ( = ?auto_24882 ?auto_24875 ) ) ( HOIST-AT ?auto_24879 ?auto_24882 ) ( AVAILABLE ?auto_24879 ) ( SURFACE-AT ?auto_24860 ?auto_24882 ) ( ON ?auto_24860 ?auto_24878 ) ( CLEAR ?auto_24860 ) ( TRUCK-AT ?auto_24871 ?auto_24875 ) ( not ( = ?auto_24859 ?auto_24860 ) ) ( not ( = ?auto_24859 ?auto_24878 ) ) ( not ( = ?auto_24860 ?auto_24878 ) ) ( not ( = ?auto_24873 ?auto_24879 ) ) ( not ( = ?auto_24859 ?auto_24861 ) ) ( not ( = ?auto_24859 ?auto_24902 ) ) ( not ( = ?auto_24861 ?auto_24878 ) ) ( not ( = ?auto_24889 ?auto_24882 ) ) ( not ( = ?auto_24895 ?auto_24879 ) ) ( not ( = ?auto_24902 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24862 ) ) ( not ( = ?auto_24859 ?auto_24897 ) ) ( not ( = ?auto_24860 ?auto_24862 ) ) ( not ( = ?auto_24860 ?auto_24897 ) ) ( not ( = ?auto_24862 ?auto_24902 ) ) ( not ( = ?auto_24862 ?auto_24878 ) ) ( not ( = ?auto_24896 ?auto_24889 ) ) ( not ( = ?auto_24896 ?auto_24882 ) ) ( not ( = ?auto_24898 ?auto_24895 ) ) ( not ( = ?auto_24898 ?auto_24879 ) ) ( not ( = ?auto_24897 ?auto_24902 ) ) ( not ( = ?auto_24897 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24863 ) ) ( not ( = ?auto_24859 ?auto_24880 ) ) ( not ( = ?auto_24860 ?auto_24863 ) ) ( not ( = ?auto_24860 ?auto_24880 ) ) ( not ( = ?auto_24861 ?auto_24863 ) ) ( not ( = ?auto_24861 ?auto_24880 ) ) ( not ( = ?auto_24863 ?auto_24897 ) ) ( not ( = ?auto_24863 ?auto_24902 ) ) ( not ( = ?auto_24863 ?auto_24878 ) ) ( not ( = ?auto_24892 ?auto_24896 ) ) ( not ( = ?auto_24892 ?auto_24889 ) ) ( not ( = ?auto_24892 ?auto_24882 ) ) ( not ( = ?auto_24883 ?auto_24898 ) ) ( not ( = ?auto_24883 ?auto_24895 ) ) ( not ( = ?auto_24883 ?auto_24879 ) ) ( not ( = ?auto_24880 ?auto_24897 ) ) ( not ( = ?auto_24880 ?auto_24902 ) ) ( not ( = ?auto_24880 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24864 ) ) ( not ( = ?auto_24859 ?auto_24891 ) ) ( not ( = ?auto_24860 ?auto_24864 ) ) ( not ( = ?auto_24860 ?auto_24891 ) ) ( not ( = ?auto_24861 ?auto_24864 ) ) ( not ( = ?auto_24861 ?auto_24891 ) ) ( not ( = ?auto_24862 ?auto_24864 ) ) ( not ( = ?auto_24862 ?auto_24891 ) ) ( not ( = ?auto_24864 ?auto_24880 ) ) ( not ( = ?auto_24864 ?auto_24897 ) ) ( not ( = ?auto_24864 ?auto_24902 ) ) ( not ( = ?auto_24864 ?auto_24878 ) ) ( not ( = ?auto_24891 ?auto_24880 ) ) ( not ( = ?auto_24891 ?auto_24897 ) ) ( not ( = ?auto_24891 ?auto_24902 ) ) ( not ( = ?auto_24891 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24865 ) ) ( not ( = ?auto_24859 ?auto_24899 ) ) ( not ( = ?auto_24860 ?auto_24865 ) ) ( not ( = ?auto_24860 ?auto_24899 ) ) ( not ( = ?auto_24861 ?auto_24865 ) ) ( not ( = ?auto_24861 ?auto_24899 ) ) ( not ( = ?auto_24862 ?auto_24865 ) ) ( not ( = ?auto_24862 ?auto_24899 ) ) ( not ( = ?auto_24863 ?auto_24865 ) ) ( not ( = ?auto_24863 ?auto_24899 ) ) ( not ( = ?auto_24865 ?auto_24891 ) ) ( not ( = ?auto_24865 ?auto_24880 ) ) ( not ( = ?auto_24865 ?auto_24897 ) ) ( not ( = ?auto_24865 ?auto_24902 ) ) ( not ( = ?auto_24865 ?auto_24878 ) ) ( not ( = ?auto_24901 ?auto_24889 ) ) ( not ( = ?auto_24901 ?auto_24892 ) ) ( not ( = ?auto_24901 ?auto_24896 ) ) ( not ( = ?auto_24901 ?auto_24882 ) ) ( not ( = ?auto_24885 ?auto_24895 ) ) ( not ( = ?auto_24885 ?auto_24883 ) ) ( not ( = ?auto_24885 ?auto_24898 ) ) ( not ( = ?auto_24885 ?auto_24879 ) ) ( not ( = ?auto_24899 ?auto_24891 ) ) ( not ( = ?auto_24899 ?auto_24880 ) ) ( not ( = ?auto_24899 ?auto_24897 ) ) ( not ( = ?auto_24899 ?auto_24902 ) ) ( not ( = ?auto_24899 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24866 ) ) ( not ( = ?auto_24859 ?auto_24894 ) ) ( not ( = ?auto_24860 ?auto_24866 ) ) ( not ( = ?auto_24860 ?auto_24894 ) ) ( not ( = ?auto_24861 ?auto_24866 ) ) ( not ( = ?auto_24861 ?auto_24894 ) ) ( not ( = ?auto_24862 ?auto_24866 ) ) ( not ( = ?auto_24862 ?auto_24894 ) ) ( not ( = ?auto_24863 ?auto_24866 ) ) ( not ( = ?auto_24863 ?auto_24894 ) ) ( not ( = ?auto_24864 ?auto_24866 ) ) ( not ( = ?auto_24864 ?auto_24894 ) ) ( not ( = ?auto_24866 ?auto_24899 ) ) ( not ( = ?auto_24866 ?auto_24891 ) ) ( not ( = ?auto_24866 ?auto_24880 ) ) ( not ( = ?auto_24866 ?auto_24897 ) ) ( not ( = ?auto_24866 ?auto_24902 ) ) ( not ( = ?auto_24866 ?auto_24878 ) ) ( not ( = ?auto_24886 ?auto_24901 ) ) ( not ( = ?auto_24886 ?auto_24889 ) ) ( not ( = ?auto_24886 ?auto_24892 ) ) ( not ( = ?auto_24886 ?auto_24896 ) ) ( not ( = ?auto_24886 ?auto_24882 ) ) ( not ( = ?auto_24884 ?auto_24885 ) ) ( not ( = ?auto_24884 ?auto_24895 ) ) ( not ( = ?auto_24884 ?auto_24883 ) ) ( not ( = ?auto_24884 ?auto_24898 ) ) ( not ( = ?auto_24884 ?auto_24879 ) ) ( not ( = ?auto_24894 ?auto_24899 ) ) ( not ( = ?auto_24894 ?auto_24891 ) ) ( not ( = ?auto_24894 ?auto_24880 ) ) ( not ( = ?auto_24894 ?auto_24897 ) ) ( not ( = ?auto_24894 ?auto_24902 ) ) ( not ( = ?auto_24894 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24867 ) ) ( not ( = ?auto_24859 ?auto_24881 ) ) ( not ( = ?auto_24860 ?auto_24867 ) ) ( not ( = ?auto_24860 ?auto_24881 ) ) ( not ( = ?auto_24861 ?auto_24867 ) ) ( not ( = ?auto_24861 ?auto_24881 ) ) ( not ( = ?auto_24862 ?auto_24867 ) ) ( not ( = ?auto_24862 ?auto_24881 ) ) ( not ( = ?auto_24863 ?auto_24867 ) ) ( not ( = ?auto_24863 ?auto_24881 ) ) ( not ( = ?auto_24864 ?auto_24867 ) ) ( not ( = ?auto_24864 ?auto_24881 ) ) ( not ( = ?auto_24865 ?auto_24867 ) ) ( not ( = ?auto_24865 ?auto_24881 ) ) ( not ( = ?auto_24867 ?auto_24894 ) ) ( not ( = ?auto_24867 ?auto_24899 ) ) ( not ( = ?auto_24867 ?auto_24891 ) ) ( not ( = ?auto_24867 ?auto_24880 ) ) ( not ( = ?auto_24867 ?auto_24897 ) ) ( not ( = ?auto_24867 ?auto_24902 ) ) ( not ( = ?auto_24867 ?auto_24878 ) ) ( not ( = ?auto_24888 ?auto_24886 ) ) ( not ( = ?auto_24888 ?auto_24901 ) ) ( not ( = ?auto_24888 ?auto_24889 ) ) ( not ( = ?auto_24888 ?auto_24892 ) ) ( not ( = ?auto_24888 ?auto_24896 ) ) ( not ( = ?auto_24888 ?auto_24882 ) ) ( not ( = ?auto_24900 ?auto_24884 ) ) ( not ( = ?auto_24900 ?auto_24885 ) ) ( not ( = ?auto_24900 ?auto_24895 ) ) ( not ( = ?auto_24900 ?auto_24883 ) ) ( not ( = ?auto_24900 ?auto_24898 ) ) ( not ( = ?auto_24900 ?auto_24879 ) ) ( not ( = ?auto_24881 ?auto_24894 ) ) ( not ( = ?auto_24881 ?auto_24899 ) ) ( not ( = ?auto_24881 ?auto_24891 ) ) ( not ( = ?auto_24881 ?auto_24880 ) ) ( not ( = ?auto_24881 ?auto_24897 ) ) ( not ( = ?auto_24881 ?auto_24902 ) ) ( not ( = ?auto_24881 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24868 ) ) ( not ( = ?auto_24859 ?auto_24893 ) ) ( not ( = ?auto_24860 ?auto_24868 ) ) ( not ( = ?auto_24860 ?auto_24893 ) ) ( not ( = ?auto_24861 ?auto_24868 ) ) ( not ( = ?auto_24861 ?auto_24893 ) ) ( not ( = ?auto_24862 ?auto_24868 ) ) ( not ( = ?auto_24862 ?auto_24893 ) ) ( not ( = ?auto_24863 ?auto_24868 ) ) ( not ( = ?auto_24863 ?auto_24893 ) ) ( not ( = ?auto_24864 ?auto_24868 ) ) ( not ( = ?auto_24864 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24868 ) ) ( not ( = ?auto_24865 ?auto_24893 ) ) ( not ( = ?auto_24866 ?auto_24868 ) ) ( not ( = ?auto_24866 ?auto_24893 ) ) ( not ( = ?auto_24868 ?auto_24881 ) ) ( not ( = ?auto_24868 ?auto_24894 ) ) ( not ( = ?auto_24868 ?auto_24899 ) ) ( not ( = ?auto_24868 ?auto_24891 ) ) ( not ( = ?auto_24868 ?auto_24880 ) ) ( not ( = ?auto_24868 ?auto_24897 ) ) ( not ( = ?auto_24868 ?auto_24902 ) ) ( not ( = ?auto_24868 ?auto_24878 ) ) ( not ( = ?auto_24887 ?auto_24888 ) ) ( not ( = ?auto_24887 ?auto_24886 ) ) ( not ( = ?auto_24887 ?auto_24901 ) ) ( not ( = ?auto_24887 ?auto_24889 ) ) ( not ( = ?auto_24887 ?auto_24892 ) ) ( not ( = ?auto_24887 ?auto_24896 ) ) ( not ( = ?auto_24887 ?auto_24882 ) ) ( not ( = ?auto_24877 ?auto_24900 ) ) ( not ( = ?auto_24877 ?auto_24884 ) ) ( not ( = ?auto_24877 ?auto_24885 ) ) ( not ( = ?auto_24877 ?auto_24895 ) ) ( not ( = ?auto_24877 ?auto_24883 ) ) ( not ( = ?auto_24877 ?auto_24898 ) ) ( not ( = ?auto_24877 ?auto_24879 ) ) ( not ( = ?auto_24893 ?auto_24881 ) ) ( not ( = ?auto_24893 ?auto_24894 ) ) ( not ( = ?auto_24893 ?auto_24899 ) ) ( not ( = ?auto_24893 ?auto_24891 ) ) ( not ( = ?auto_24893 ?auto_24880 ) ) ( not ( = ?auto_24893 ?auto_24897 ) ) ( not ( = ?auto_24893 ?auto_24902 ) ) ( not ( = ?auto_24893 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24869 ) ) ( not ( = ?auto_24859 ?auto_24890 ) ) ( not ( = ?auto_24860 ?auto_24869 ) ) ( not ( = ?auto_24860 ?auto_24890 ) ) ( not ( = ?auto_24861 ?auto_24869 ) ) ( not ( = ?auto_24861 ?auto_24890 ) ) ( not ( = ?auto_24862 ?auto_24869 ) ) ( not ( = ?auto_24862 ?auto_24890 ) ) ( not ( = ?auto_24863 ?auto_24869 ) ) ( not ( = ?auto_24863 ?auto_24890 ) ) ( not ( = ?auto_24864 ?auto_24869 ) ) ( not ( = ?auto_24864 ?auto_24890 ) ) ( not ( = ?auto_24865 ?auto_24869 ) ) ( not ( = ?auto_24865 ?auto_24890 ) ) ( not ( = ?auto_24866 ?auto_24869 ) ) ( not ( = ?auto_24866 ?auto_24890 ) ) ( not ( = ?auto_24867 ?auto_24869 ) ) ( not ( = ?auto_24867 ?auto_24890 ) ) ( not ( = ?auto_24869 ?auto_24893 ) ) ( not ( = ?auto_24869 ?auto_24881 ) ) ( not ( = ?auto_24869 ?auto_24894 ) ) ( not ( = ?auto_24869 ?auto_24899 ) ) ( not ( = ?auto_24869 ?auto_24891 ) ) ( not ( = ?auto_24869 ?auto_24880 ) ) ( not ( = ?auto_24869 ?auto_24897 ) ) ( not ( = ?auto_24869 ?auto_24902 ) ) ( not ( = ?auto_24869 ?auto_24878 ) ) ( not ( = ?auto_24890 ?auto_24893 ) ) ( not ( = ?auto_24890 ?auto_24881 ) ) ( not ( = ?auto_24890 ?auto_24894 ) ) ( not ( = ?auto_24890 ?auto_24899 ) ) ( not ( = ?auto_24890 ?auto_24891 ) ) ( not ( = ?auto_24890 ?auto_24880 ) ) ( not ( = ?auto_24890 ?auto_24897 ) ) ( not ( = ?auto_24890 ?auto_24902 ) ) ( not ( = ?auto_24890 ?auto_24878 ) ) ( not ( = ?auto_24859 ?auto_24870 ) ) ( not ( = ?auto_24859 ?auto_24872 ) ) ( not ( = ?auto_24860 ?auto_24870 ) ) ( not ( = ?auto_24860 ?auto_24872 ) ) ( not ( = ?auto_24861 ?auto_24870 ) ) ( not ( = ?auto_24861 ?auto_24872 ) ) ( not ( = ?auto_24862 ?auto_24870 ) ) ( not ( = ?auto_24862 ?auto_24872 ) ) ( not ( = ?auto_24863 ?auto_24870 ) ) ( not ( = ?auto_24863 ?auto_24872 ) ) ( not ( = ?auto_24864 ?auto_24870 ) ) ( not ( = ?auto_24864 ?auto_24872 ) ) ( not ( = ?auto_24865 ?auto_24870 ) ) ( not ( = ?auto_24865 ?auto_24872 ) ) ( not ( = ?auto_24866 ?auto_24870 ) ) ( not ( = ?auto_24866 ?auto_24872 ) ) ( not ( = ?auto_24867 ?auto_24870 ) ) ( not ( = ?auto_24867 ?auto_24872 ) ) ( not ( = ?auto_24868 ?auto_24870 ) ) ( not ( = ?auto_24868 ?auto_24872 ) ) ( not ( = ?auto_24870 ?auto_24890 ) ) ( not ( = ?auto_24870 ?auto_24893 ) ) ( not ( = ?auto_24870 ?auto_24881 ) ) ( not ( = ?auto_24870 ?auto_24894 ) ) ( not ( = ?auto_24870 ?auto_24899 ) ) ( not ( = ?auto_24870 ?auto_24891 ) ) ( not ( = ?auto_24870 ?auto_24880 ) ) ( not ( = ?auto_24870 ?auto_24897 ) ) ( not ( = ?auto_24870 ?auto_24902 ) ) ( not ( = ?auto_24870 ?auto_24878 ) ) ( not ( = ?auto_24876 ?auto_24889 ) ) ( not ( = ?auto_24876 ?auto_24887 ) ) ( not ( = ?auto_24876 ?auto_24888 ) ) ( not ( = ?auto_24876 ?auto_24886 ) ) ( not ( = ?auto_24876 ?auto_24901 ) ) ( not ( = ?auto_24876 ?auto_24892 ) ) ( not ( = ?auto_24876 ?auto_24896 ) ) ( not ( = ?auto_24876 ?auto_24882 ) ) ( not ( = ?auto_24874 ?auto_24895 ) ) ( not ( = ?auto_24874 ?auto_24877 ) ) ( not ( = ?auto_24874 ?auto_24900 ) ) ( not ( = ?auto_24874 ?auto_24884 ) ) ( not ( = ?auto_24874 ?auto_24885 ) ) ( not ( = ?auto_24874 ?auto_24883 ) ) ( not ( = ?auto_24874 ?auto_24898 ) ) ( not ( = ?auto_24874 ?auto_24879 ) ) ( not ( = ?auto_24872 ?auto_24890 ) ) ( not ( = ?auto_24872 ?auto_24893 ) ) ( not ( = ?auto_24872 ?auto_24881 ) ) ( not ( = ?auto_24872 ?auto_24894 ) ) ( not ( = ?auto_24872 ?auto_24899 ) ) ( not ( = ?auto_24872 ?auto_24891 ) ) ( not ( = ?auto_24872 ?auto_24880 ) ) ( not ( = ?auto_24872 ?auto_24897 ) ) ( not ( = ?auto_24872 ?auto_24902 ) ) ( not ( = ?auto_24872 ?auto_24878 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24859 ?auto_24860 ?auto_24861 ?auto_24862 ?auto_24863 ?auto_24864 ?auto_24865 ?auto_24866 ?auto_24867 ?auto_24868 ?auto_24869 )
      ( MAKE-1CRATE ?auto_24869 ?auto_24870 )
      ( MAKE-11CRATE-VERIFY ?auto_24859 ?auto_24860 ?auto_24861 ?auto_24862 ?auto_24863 ?auto_24864 ?auto_24865 ?auto_24866 ?auto_24867 ?auto_24868 ?auto_24869 ?auto_24870 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_24926 - SURFACE
      ?auto_24927 - SURFACE
      ?auto_24928 - SURFACE
      ?auto_24929 - SURFACE
      ?auto_24930 - SURFACE
      ?auto_24931 - SURFACE
      ?auto_24932 - SURFACE
      ?auto_24933 - SURFACE
      ?auto_24934 - SURFACE
      ?auto_24935 - SURFACE
      ?auto_24936 - SURFACE
      ?auto_24937 - SURFACE
      ?auto_24938 - SURFACE
    )
    :vars
    (
      ?auto_24944 - HOIST
      ?auto_24941 - PLACE
      ?auto_24939 - PLACE
      ?auto_24940 - HOIST
      ?auto_24943 - SURFACE
      ?auto_24953 - PLACE
      ?auto_24947 - HOIST
      ?auto_24969 - SURFACE
      ?auto_24967 - PLACE
      ?auto_24965 - HOIST
      ?auto_24971 - SURFACE
      ?auto_24955 - PLACE
      ?auto_24959 - HOIST
      ?auto_24951 - SURFACE
      ?auto_24945 - PLACE
      ?auto_24957 - HOIST
      ?auto_24946 - SURFACE
      ?auto_24952 - SURFACE
      ?auto_24949 - PLACE
      ?auto_24961 - HOIST
      ?auto_24960 - SURFACE
      ?auto_24968 - SURFACE
      ?auto_24958 - PLACE
      ?auto_24956 - HOIST
      ?auto_24964 - SURFACE
      ?auto_24962 - PLACE
      ?auto_24948 - HOIST
      ?auto_24970 - SURFACE
      ?auto_24966 - SURFACE
      ?auto_24963 - PLACE
      ?auto_24950 - HOIST
      ?auto_24954 - SURFACE
      ?auto_24942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24944 ?auto_24941 ) ( IS-CRATE ?auto_24938 ) ( not ( = ?auto_24939 ?auto_24941 ) ) ( HOIST-AT ?auto_24940 ?auto_24939 ) ( SURFACE-AT ?auto_24938 ?auto_24939 ) ( ON ?auto_24938 ?auto_24943 ) ( CLEAR ?auto_24938 ) ( not ( = ?auto_24937 ?auto_24938 ) ) ( not ( = ?auto_24937 ?auto_24943 ) ) ( not ( = ?auto_24938 ?auto_24943 ) ) ( not ( = ?auto_24944 ?auto_24940 ) ) ( IS-CRATE ?auto_24937 ) ( not ( = ?auto_24953 ?auto_24941 ) ) ( HOIST-AT ?auto_24947 ?auto_24953 ) ( AVAILABLE ?auto_24947 ) ( SURFACE-AT ?auto_24937 ?auto_24953 ) ( ON ?auto_24937 ?auto_24969 ) ( CLEAR ?auto_24937 ) ( not ( = ?auto_24936 ?auto_24937 ) ) ( not ( = ?auto_24936 ?auto_24969 ) ) ( not ( = ?auto_24937 ?auto_24969 ) ) ( not ( = ?auto_24944 ?auto_24947 ) ) ( IS-CRATE ?auto_24936 ) ( not ( = ?auto_24967 ?auto_24941 ) ) ( HOIST-AT ?auto_24965 ?auto_24967 ) ( SURFACE-AT ?auto_24936 ?auto_24967 ) ( ON ?auto_24936 ?auto_24971 ) ( CLEAR ?auto_24936 ) ( not ( = ?auto_24935 ?auto_24936 ) ) ( not ( = ?auto_24935 ?auto_24971 ) ) ( not ( = ?auto_24936 ?auto_24971 ) ) ( not ( = ?auto_24944 ?auto_24965 ) ) ( IS-CRATE ?auto_24935 ) ( not ( = ?auto_24955 ?auto_24941 ) ) ( HOIST-AT ?auto_24959 ?auto_24955 ) ( AVAILABLE ?auto_24959 ) ( SURFACE-AT ?auto_24935 ?auto_24955 ) ( ON ?auto_24935 ?auto_24951 ) ( CLEAR ?auto_24935 ) ( not ( = ?auto_24934 ?auto_24935 ) ) ( not ( = ?auto_24934 ?auto_24951 ) ) ( not ( = ?auto_24935 ?auto_24951 ) ) ( not ( = ?auto_24944 ?auto_24959 ) ) ( IS-CRATE ?auto_24934 ) ( not ( = ?auto_24945 ?auto_24941 ) ) ( HOIST-AT ?auto_24957 ?auto_24945 ) ( AVAILABLE ?auto_24957 ) ( SURFACE-AT ?auto_24934 ?auto_24945 ) ( ON ?auto_24934 ?auto_24946 ) ( CLEAR ?auto_24934 ) ( not ( = ?auto_24933 ?auto_24934 ) ) ( not ( = ?auto_24933 ?auto_24946 ) ) ( not ( = ?auto_24934 ?auto_24946 ) ) ( not ( = ?auto_24944 ?auto_24957 ) ) ( IS-CRATE ?auto_24933 ) ( AVAILABLE ?auto_24940 ) ( SURFACE-AT ?auto_24933 ?auto_24939 ) ( ON ?auto_24933 ?auto_24952 ) ( CLEAR ?auto_24933 ) ( not ( = ?auto_24932 ?auto_24933 ) ) ( not ( = ?auto_24932 ?auto_24952 ) ) ( not ( = ?auto_24933 ?auto_24952 ) ) ( IS-CRATE ?auto_24932 ) ( not ( = ?auto_24949 ?auto_24941 ) ) ( HOIST-AT ?auto_24961 ?auto_24949 ) ( AVAILABLE ?auto_24961 ) ( SURFACE-AT ?auto_24932 ?auto_24949 ) ( ON ?auto_24932 ?auto_24960 ) ( CLEAR ?auto_24932 ) ( not ( = ?auto_24931 ?auto_24932 ) ) ( not ( = ?auto_24931 ?auto_24960 ) ) ( not ( = ?auto_24932 ?auto_24960 ) ) ( not ( = ?auto_24944 ?auto_24961 ) ) ( IS-CRATE ?auto_24931 ) ( SURFACE-AT ?auto_24931 ?auto_24967 ) ( ON ?auto_24931 ?auto_24968 ) ( CLEAR ?auto_24931 ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24930 ?auto_24968 ) ) ( not ( = ?auto_24931 ?auto_24968 ) ) ( IS-CRATE ?auto_24930 ) ( not ( = ?auto_24958 ?auto_24941 ) ) ( HOIST-AT ?auto_24956 ?auto_24958 ) ( AVAILABLE ?auto_24956 ) ( SURFACE-AT ?auto_24930 ?auto_24958 ) ( ON ?auto_24930 ?auto_24964 ) ( CLEAR ?auto_24930 ) ( not ( = ?auto_24929 ?auto_24930 ) ) ( not ( = ?auto_24929 ?auto_24964 ) ) ( not ( = ?auto_24930 ?auto_24964 ) ) ( not ( = ?auto_24944 ?auto_24956 ) ) ( IS-CRATE ?auto_24929 ) ( not ( = ?auto_24962 ?auto_24941 ) ) ( HOIST-AT ?auto_24948 ?auto_24962 ) ( AVAILABLE ?auto_24948 ) ( SURFACE-AT ?auto_24929 ?auto_24962 ) ( ON ?auto_24929 ?auto_24970 ) ( CLEAR ?auto_24929 ) ( not ( = ?auto_24928 ?auto_24929 ) ) ( not ( = ?auto_24928 ?auto_24970 ) ) ( not ( = ?auto_24929 ?auto_24970 ) ) ( not ( = ?auto_24944 ?auto_24948 ) ) ( IS-CRATE ?auto_24928 ) ( AVAILABLE ?auto_24965 ) ( SURFACE-AT ?auto_24928 ?auto_24967 ) ( ON ?auto_24928 ?auto_24966 ) ( CLEAR ?auto_24928 ) ( not ( = ?auto_24927 ?auto_24928 ) ) ( not ( = ?auto_24927 ?auto_24966 ) ) ( not ( = ?auto_24928 ?auto_24966 ) ) ( SURFACE-AT ?auto_24926 ?auto_24941 ) ( CLEAR ?auto_24926 ) ( IS-CRATE ?auto_24927 ) ( AVAILABLE ?auto_24944 ) ( not ( = ?auto_24963 ?auto_24941 ) ) ( HOIST-AT ?auto_24950 ?auto_24963 ) ( AVAILABLE ?auto_24950 ) ( SURFACE-AT ?auto_24927 ?auto_24963 ) ( ON ?auto_24927 ?auto_24954 ) ( CLEAR ?auto_24927 ) ( TRUCK-AT ?auto_24942 ?auto_24941 ) ( not ( = ?auto_24926 ?auto_24927 ) ) ( not ( = ?auto_24926 ?auto_24954 ) ) ( not ( = ?auto_24927 ?auto_24954 ) ) ( not ( = ?auto_24944 ?auto_24950 ) ) ( not ( = ?auto_24926 ?auto_24928 ) ) ( not ( = ?auto_24926 ?auto_24966 ) ) ( not ( = ?auto_24928 ?auto_24954 ) ) ( not ( = ?auto_24967 ?auto_24963 ) ) ( not ( = ?auto_24965 ?auto_24950 ) ) ( not ( = ?auto_24966 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24929 ) ) ( not ( = ?auto_24926 ?auto_24970 ) ) ( not ( = ?auto_24927 ?auto_24929 ) ) ( not ( = ?auto_24927 ?auto_24970 ) ) ( not ( = ?auto_24929 ?auto_24966 ) ) ( not ( = ?auto_24929 ?auto_24954 ) ) ( not ( = ?auto_24962 ?auto_24967 ) ) ( not ( = ?auto_24962 ?auto_24963 ) ) ( not ( = ?auto_24948 ?auto_24965 ) ) ( not ( = ?auto_24948 ?auto_24950 ) ) ( not ( = ?auto_24970 ?auto_24966 ) ) ( not ( = ?auto_24970 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24930 ) ) ( not ( = ?auto_24926 ?auto_24964 ) ) ( not ( = ?auto_24927 ?auto_24930 ) ) ( not ( = ?auto_24927 ?auto_24964 ) ) ( not ( = ?auto_24928 ?auto_24930 ) ) ( not ( = ?auto_24928 ?auto_24964 ) ) ( not ( = ?auto_24930 ?auto_24970 ) ) ( not ( = ?auto_24930 ?auto_24966 ) ) ( not ( = ?auto_24930 ?auto_24954 ) ) ( not ( = ?auto_24958 ?auto_24962 ) ) ( not ( = ?auto_24958 ?auto_24967 ) ) ( not ( = ?auto_24958 ?auto_24963 ) ) ( not ( = ?auto_24956 ?auto_24948 ) ) ( not ( = ?auto_24956 ?auto_24965 ) ) ( not ( = ?auto_24956 ?auto_24950 ) ) ( not ( = ?auto_24964 ?auto_24970 ) ) ( not ( = ?auto_24964 ?auto_24966 ) ) ( not ( = ?auto_24964 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24931 ) ) ( not ( = ?auto_24926 ?auto_24968 ) ) ( not ( = ?auto_24927 ?auto_24931 ) ) ( not ( = ?auto_24927 ?auto_24968 ) ) ( not ( = ?auto_24928 ?auto_24931 ) ) ( not ( = ?auto_24928 ?auto_24968 ) ) ( not ( = ?auto_24929 ?auto_24931 ) ) ( not ( = ?auto_24929 ?auto_24968 ) ) ( not ( = ?auto_24931 ?auto_24964 ) ) ( not ( = ?auto_24931 ?auto_24970 ) ) ( not ( = ?auto_24931 ?auto_24966 ) ) ( not ( = ?auto_24931 ?auto_24954 ) ) ( not ( = ?auto_24968 ?auto_24964 ) ) ( not ( = ?auto_24968 ?auto_24970 ) ) ( not ( = ?auto_24968 ?auto_24966 ) ) ( not ( = ?auto_24968 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24932 ) ) ( not ( = ?auto_24926 ?auto_24960 ) ) ( not ( = ?auto_24927 ?auto_24932 ) ) ( not ( = ?auto_24927 ?auto_24960 ) ) ( not ( = ?auto_24928 ?auto_24932 ) ) ( not ( = ?auto_24928 ?auto_24960 ) ) ( not ( = ?auto_24929 ?auto_24932 ) ) ( not ( = ?auto_24929 ?auto_24960 ) ) ( not ( = ?auto_24930 ?auto_24932 ) ) ( not ( = ?auto_24930 ?auto_24960 ) ) ( not ( = ?auto_24932 ?auto_24968 ) ) ( not ( = ?auto_24932 ?auto_24964 ) ) ( not ( = ?auto_24932 ?auto_24970 ) ) ( not ( = ?auto_24932 ?auto_24966 ) ) ( not ( = ?auto_24932 ?auto_24954 ) ) ( not ( = ?auto_24949 ?auto_24967 ) ) ( not ( = ?auto_24949 ?auto_24958 ) ) ( not ( = ?auto_24949 ?auto_24962 ) ) ( not ( = ?auto_24949 ?auto_24963 ) ) ( not ( = ?auto_24961 ?auto_24965 ) ) ( not ( = ?auto_24961 ?auto_24956 ) ) ( not ( = ?auto_24961 ?auto_24948 ) ) ( not ( = ?auto_24961 ?auto_24950 ) ) ( not ( = ?auto_24960 ?auto_24968 ) ) ( not ( = ?auto_24960 ?auto_24964 ) ) ( not ( = ?auto_24960 ?auto_24970 ) ) ( not ( = ?auto_24960 ?auto_24966 ) ) ( not ( = ?auto_24960 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24933 ) ) ( not ( = ?auto_24926 ?auto_24952 ) ) ( not ( = ?auto_24927 ?auto_24933 ) ) ( not ( = ?auto_24927 ?auto_24952 ) ) ( not ( = ?auto_24928 ?auto_24933 ) ) ( not ( = ?auto_24928 ?auto_24952 ) ) ( not ( = ?auto_24929 ?auto_24933 ) ) ( not ( = ?auto_24929 ?auto_24952 ) ) ( not ( = ?auto_24930 ?auto_24933 ) ) ( not ( = ?auto_24930 ?auto_24952 ) ) ( not ( = ?auto_24931 ?auto_24933 ) ) ( not ( = ?auto_24931 ?auto_24952 ) ) ( not ( = ?auto_24933 ?auto_24960 ) ) ( not ( = ?auto_24933 ?auto_24968 ) ) ( not ( = ?auto_24933 ?auto_24964 ) ) ( not ( = ?auto_24933 ?auto_24970 ) ) ( not ( = ?auto_24933 ?auto_24966 ) ) ( not ( = ?auto_24933 ?auto_24954 ) ) ( not ( = ?auto_24939 ?auto_24949 ) ) ( not ( = ?auto_24939 ?auto_24967 ) ) ( not ( = ?auto_24939 ?auto_24958 ) ) ( not ( = ?auto_24939 ?auto_24962 ) ) ( not ( = ?auto_24939 ?auto_24963 ) ) ( not ( = ?auto_24940 ?auto_24961 ) ) ( not ( = ?auto_24940 ?auto_24965 ) ) ( not ( = ?auto_24940 ?auto_24956 ) ) ( not ( = ?auto_24940 ?auto_24948 ) ) ( not ( = ?auto_24940 ?auto_24950 ) ) ( not ( = ?auto_24952 ?auto_24960 ) ) ( not ( = ?auto_24952 ?auto_24968 ) ) ( not ( = ?auto_24952 ?auto_24964 ) ) ( not ( = ?auto_24952 ?auto_24970 ) ) ( not ( = ?auto_24952 ?auto_24966 ) ) ( not ( = ?auto_24952 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24934 ) ) ( not ( = ?auto_24926 ?auto_24946 ) ) ( not ( = ?auto_24927 ?auto_24934 ) ) ( not ( = ?auto_24927 ?auto_24946 ) ) ( not ( = ?auto_24928 ?auto_24934 ) ) ( not ( = ?auto_24928 ?auto_24946 ) ) ( not ( = ?auto_24929 ?auto_24934 ) ) ( not ( = ?auto_24929 ?auto_24946 ) ) ( not ( = ?auto_24930 ?auto_24934 ) ) ( not ( = ?auto_24930 ?auto_24946 ) ) ( not ( = ?auto_24931 ?auto_24934 ) ) ( not ( = ?auto_24931 ?auto_24946 ) ) ( not ( = ?auto_24932 ?auto_24934 ) ) ( not ( = ?auto_24932 ?auto_24946 ) ) ( not ( = ?auto_24934 ?auto_24952 ) ) ( not ( = ?auto_24934 ?auto_24960 ) ) ( not ( = ?auto_24934 ?auto_24968 ) ) ( not ( = ?auto_24934 ?auto_24964 ) ) ( not ( = ?auto_24934 ?auto_24970 ) ) ( not ( = ?auto_24934 ?auto_24966 ) ) ( not ( = ?auto_24934 ?auto_24954 ) ) ( not ( = ?auto_24945 ?auto_24939 ) ) ( not ( = ?auto_24945 ?auto_24949 ) ) ( not ( = ?auto_24945 ?auto_24967 ) ) ( not ( = ?auto_24945 ?auto_24958 ) ) ( not ( = ?auto_24945 ?auto_24962 ) ) ( not ( = ?auto_24945 ?auto_24963 ) ) ( not ( = ?auto_24957 ?auto_24940 ) ) ( not ( = ?auto_24957 ?auto_24961 ) ) ( not ( = ?auto_24957 ?auto_24965 ) ) ( not ( = ?auto_24957 ?auto_24956 ) ) ( not ( = ?auto_24957 ?auto_24948 ) ) ( not ( = ?auto_24957 ?auto_24950 ) ) ( not ( = ?auto_24946 ?auto_24952 ) ) ( not ( = ?auto_24946 ?auto_24960 ) ) ( not ( = ?auto_24946 ?auto_24968 ) ) ( not ( = ?auto_24946 ?auto_24964 ) ) ( not ( = ?auto_24946 ?auto_24970 ) ) ( not ( = ?auto_24946 ?auto_24966 ) ) ( not ( = ?auto_24946 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24935 ) ) ( not ( = ?auto_24926 ?auto_24951 ) ) ( not ( = ?auto_24927 ?auto_24935 ) ) ( not ( = ?auto_24927 ?auto_24951 ) ) ( not ( = ?auto_24928 ?auto_24935 ) ) ( not ( = ?auto_24928 ?auto_24951 ) ) ( not ( = ?auto_24929 ?auto_24935 ) ) ( not ( = ?auto_24929 ?auto_24951 ) ) ( not ( = ?auto_24930 ?auto_24935 ) ) ( not ( = ?auto_24930 ?auto_24951 ) ) ( not ( = ?auto_24931 ?auto_24935 ) ) ( not ( = ?auto_24931 ?auto_24951 ) ) ( not ( = ?auto_24932 ?auto_24935 ) ) ( not ( = ?auto_24932 ?auto_24951 ) ) ( not ( = ?auto_24933 ?auto_24935 ) ) ( not ( = ?auto_24933 ?auto_24951 ) ) ( not ( = ?auto_24935 ?auto_24946 ) ) ( not ( = ?auto_24935 ?auto_24952 ) ) ( not ( = ?auto_24935 ?auto_24960 ) ) ( not ( = ?auto_24935 ?auto_24968 ) ) ( not ( = ?auto_24935 ?auto_24964 ) ) ( not ( = ?auto_24935 ?auto_24970 ) ) ( not ( = ?auto_24935 ?auto_24966 ) ) ( not ( = ?auto_24935 ?auto_24954 ) ) ( not ( = ?auto_24955 ?auto_24945 ) ) ( not ( = ?auto_24955 ?auto_24939 ) ) ( not ( = ?auto_24955 ?auto_24949 ) ) ( not ( = ?auto_24955 ?auto_24967 ) ) ( not ( = ?auto_24955 ?auto_24958 ) ) ( not ( = ?auto_24955 ?auto_24962 ) ) ( not ( = ?auto_24955 ?auto_24963 ) ) ( not ( = ?auto_24959 ?auto_24957 ) ) ( not ( = ?auto_24959 ?auto_24940 ) ) ( not ( = ?auto_24959 ?auto_24961 ) ) ( not ( = ?auto_24959 ?auto_24965 ) ) ( not ( = ?auto_24959 ?auto_24956 ) ) ( not ( = ?auto_24959 ?auto_24948 ) ) ( not ( = ?auto_24959 ?auto_24950 ) ) ( not ( = ?auto_24951 ?auto_24946 ) ) ( not ( = ?auto_24951 ?auto_24952 ) ) ( not ( = ?auto_24951 ?auto_24960 ) ) ( not ( = ?auto_24951 ?auto_24968 ) ) ( not ( = ?auto_24951 ?auto_24964 ) ) ( not ( = ?auto_24951 ?auto_24970 ) ) ( not ( = ?auto_24951 ?auto_24966 ) ) ( not ( = ?auto_24951 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24936 ) ) ( not ( = ?auto_24926 ?auto_24971 ) ) ( not ( = ?auto_24927 ?auto_24936 ) ) ( not ( = ?auto_24927 ?auto_24971 ) ) ( not ( = ?auto_24928 ?auto_24936 ) ) ( not ( = ?auto_24928 ?auto_24971 ) ) ( not ( = ?auto_24929 ?auto_24936 ) ) ( not ( = ?auto_24929 ?auto_24971 ) ) ( not ( = ?auto_24930 ?auto_24936 ) ) ( not ( = ?auto_24930 ?auto_24971 ) ) ( not ( = ?auto_24931 ?auto_24936 ) ) ( not ( = ?auto_24931 ?auto_24971 ) ) ( not ( = ?auto_24932 ?auto_24936 ) ) ( not ( = ?auto_24932 ?auto_24971 ) ) ( not ( = ?auto_24933 ?auto_24936 ) ) ( not ( = ?auto_24933 ?auto_24971 ) ) ( not ( = ?auto_24934 ?auto_24936 ) ) ( not ( = ?auto_24934 ?auto_24971 ) ) ( not ( = ?auto_24936 ?auto_24951 ) ) ( not ( = ?auto_24936 ?auto_24946 ) ) ( not ( = ?auto_24936 ?auto_24952 ) ) ( not ( = ?auto_24936 ?auto_24960 ) ) ( not ( = ?auto_24936 ?auto_24968 ) ) ( not ( = ?auto_24936 ?auto_24964 ) ) ( not ( = ?auto_24936 ?auto_24970 ) ) ( not ( = ?auto_24936 ?auto_24966 ) ) ( not ( = ?auto_24936 ?auto_24954 ) ) ( not ( = ?auto_24971 ?auto_24951 ) ) ( not ( = ?auto_24971 ?auto_24946 ) ) ( not ( = ?auto_24971 ?auto_24952 ) ) ( not ( = ?auto_24971 ?auto_24960 ) ) ( not ( = ?auto_24971 ?auto_24968 ) ) ( not ( = ?auto_24971 ?auto_24964 ) ) ( not ( = ?auto_24971 ?auto_24970 ) ) ( not ( = ?auto_24971 ?auto_24966 ) ) ( not ( = ?auto_24971 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24937 ) ) ( not ( = ?auto_24926 ?auto_24969 ) ) ( not ( = ?auto_24927 ?auto_24937 ) ) ( not ( = ?auto_24927 ?auto_24969 ) ) ( not ( = ?auto_24928 ?auto_24937 ) ) ( not ( = ?auto_24928 ?auto_24969 ) ) ( not ( = ?auto_24929 ?auto_24937 ) ) ( not ( = ?auto_24929 ?auto_24969 ) ) ( not ( = ?auto_24930 ?auto_24937 ) ) ( not ( = ?auto_24930 ?auto_24969 ) ) ( not ( = ?auto_24931 ?auto_24937 ) ) ( not ( = ?auto_24931 ?auto_24969 ) ) ( not ( = ?auto_24932 ?auto_24937 ) ) ( not ( = ?auto_24932 ?auto_24969 ) ) ( not ( = ?auto_24933 ?auto_24937 ) ) ( not ( = ?auto_24933 ?auto_24969 ) ) ( not ( = ?auto_24934 ?auto_24937 ) ) ( not ( = ?auto_24934 ?auto_24969 ) ) ( not ( = ?auto_24935 ?auto_24937 ) ) ( not ( = ?auto_24935 ?auto_24969 ) ) ( not ( = ?auto_24937 ?auto_24971 ) ) ( not ( = ?auto_24937 ?auto_24951 ) ) ( not ( = ?auto_24937 ?auto_24946 ) ) ( not ( = ?auto_24937 ?auto_24952 ) ) ( not ( = ?auto_24937 ?auto_24960 ) ) ( not ( = ?auto_24937 ?auto_24968 ) ) ( not ( = ?auto_24937 ?auto_24964 ) ) ( not ( = ?auto_24937 ?auto_24970 ) ) ( not ( = ?auto_24937 ?auto_24966 ) ) ( not ( = ?auto_24937 ?auto_24954 ) ) ( not ( = ?auto_24953 ?auto_24967 ) ) ( not ( = ?auto_24953 ?auto_24955 ) ) ( not ( = ?auto_24953 ?auto_24945 ) ) ( not ( = ?auto_24953 ?auto_24939 ) ) ( not ( = ?auto_24953 ?auto_24949 ) ) ( not ( = ?auto_24953 ?auto_24958 ) ) ( not ( = ?auto_24953 ?auto_24962 ) ) ( not ( = ?auto_24953 ?auto_24963 ) ) ( not ( = ?auto_24947 ?auto_24965 ) ) ( not ( = ?auto_24947 ?auto_24959 ) ) ( not ( = ?auto_24947 ?auto_24957 ) ) ( not ( = ?auto_24947 ?auto_24940 ) ) ( not ( = ?auto_24947 ?auto_24961 ) ) ( not ( = ?auto_24947 ?auto_24956 ) ) ( not ( = ?auto_24947 ?auto_24948 ) ) ( not ( = ?auto_24947 ?auto_24950 ) ) ( not ( = ?auto_24969 ?auto_24971 ) ) ( not ( = ?auto_24969 ?auto_24951 ) ) ( not ( = ?auto_24969 ?auto_24946 ) ) ( not ( = ?auto_24969 ?auto_24952 ) ) ( not ( = ?auto_24969 ?auto_24960 ) ) ( not ( = ?auto_24969 ?auto_24968 ) ) ( not ( = ?auto_24969 ?auto_24964 ) ) ( not ( = ?auto_24969 ?auto_24970 ) ) ( not ( = ?auto_24969 ?auto_24966 ) ) ( not ( = ?auto_24969 ?auto_24954 ) ) ( not ( = ?auto_24926 ?auto_24938 ) ) ( not ( = ?auto_24926 ?auto_24943 ) ) ( not ( = ?auto_24927 ?auto_24938 ) ) ( not ( = ?auto_24927 ?auto_24943 ) ) ( not ( = ?auto_24928 ?auto_24938 ) ) ( not ( = ?auto_24928 ?auto_24943 ) ) ( not ( = ?auto_24929 ?auto_24938 ) ) ( not ( = ?auto_24929 ?auto_24943 ) ) ( not ( = ?auto_24930 ?auto_24938 ) ) ( not ( = ?auto_24930 ?auto_24943 ) ) ( not ( = ?auto_24931 ?auto_24938 ) ) ( not ( = ?auto_24931 ?auto_24943 ) ) ( not ( = ?auto_24932 ?auto_24938 ) ) ( not ( = ?auto_24932 ?auto_24943 ) ) ( not ( = ?auto_24933 ?auto_24938 ) ) ( not ( = ?auto_24933 ?auto_24943 ) ) ( not ( = ?auto_24934 ?auto_24938 ) ) ( not ( = ?auto_24934 ?auto_24943 ) ) ( not ( = ?auto_24935 ?auto_24938 ) ) ( not ( = ?auto_24935 ?auto_24943 ) ) ( not ( = ?auto_24936 ?auto_24938 ) ) ( not ( = ?auto_24936 ?auto_24943 ) ) ( not ( = ?auto_24938 ?auto_24969 ) ) ( not ( = ?auto_24938 ?auto_24971 ) ) ( not ( = ?auto_24938 ?auto_24951 ) ) ( not ( = ?auto_24938 ?auto_24946 ) ) ( not ( = ?auto_24938 ?auto_24952 ) ) ( not ( = ?auto_24938 ?auto_24960 ) ) ( not ( = ?auto_24938 ?auto_24968 ) ) ( not ( = ?auto_24938 ?auto_24964 ) ) ( not ( = ?auto_24938 ?auto_24970 ) ) ( not ( = ?auto_24938 ?auto_24966 ) ) ( not ( = ?auto_24938 ?auto_24954 ) ) ( not ( = ?auto_24943 ?auto_24969 ) ) ( not ( = ?auto_24943 ?auto_24971 ) ) ( not ( = ?auto_24943 ?auto_24951 ) ) ( not ( = ?auto_24943 ?auto_24946 ) ) ( not ( = ?auto_24943 ?auto_24952 ) ) ( not ( = ?auto_24943 ?auto_24960 ) ) ( not ( = ?auto_24943 ?auto_24968 ) ) ( not ( = ?auto_24943 ?auto_24964 ) ) ( not ( = ?auto_24943 ?auto_24970 ) ) ( not ( = ?auto_24943 ?auto_24966 ) ) ( not ( = ?auto_24943 ?auto_24954 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24926 ?auto_24927 ?auto_24928 ?auto_24929 ?auto_24930 ?auto_24931 ?auto_24932 ?auto_24933 ?auto_24934 ?auto_24935 ?auto_24936 ?auto_24937 )
      ( MAKE-1CRATE ?auto_24937 ?auto_24938 )
      ( MAKE-12CRATE-VERIFY ?auto_24926 ?auto_24927 ?auto_24928 ?auto_24929 ?auto_24930 ?auto_24931 ?auto_24932 ?auto_24933 ?auto_24934 ?auto_24935 ?auto_24936 ?auto_24937 ?auto_24938 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_24996 - SURFACE
      ?auto_24997 - SURFACE
      ?auto_24998 - SURFACE
      ?auto_24999 - SURFACE
      ?auto_25000 - SURFACE
      ?auto_25001 - SURFACE
      ?auto_25002 - SURFACE
      ?auto_25003 - SURFACE
      ?auto_25004 - SURFACE
      ?auto_25005 - SURFACE
      ?auto_25006 - SURFACE
      ?auto_25007 - SURFACE
      ?auto_25008 - SURFACE
      ?auto_25009 - SURFACE
    )
    :vars
    (
      ?auto_25012 - HOIST
      ?auto_25015 - PLACE
      ?auto_25011 - PLACE
      ?auto_25013 - HOIST
      ?auto_25014 - SURFACE
      ?auto_25026 - PLACE
      ?auto_25034 - HOIST
      ?auto_25027 - SURFACE
      ?auto_25043 - PLACE
      ?auto_25022 - HOIST
      ?auto_25024 - SURFACE
      ?auto_25017 - PLACE
      ?auto_25042 - HOIST
      ?auto_25029 - SURFACE
      ?auto_25025 - PLACE
      ?auto_25016 - HOIST
      ?auto_25030 - SURFACE
      ?auto_25023 - PLACE
      ?auto_25033 - HOIST
      ?auto_25044 - SURFACE
      ?auto_25040 - SURFACE
      ?auto_25019 - PLACE
      ?auto_25035 - HOIST
      ?auto_25045 - SURFACE
      ?auto_25032 - SURFACE
      ?auto_25018 - PLACE
      ?auto_25041 - HOIST
      ?auto_25028 - SURFACE
      ?auto_25020 - PLACE
      ?auto_25021 - HOIST
      ?auto_25036 - SURFACE
      ?auto_25039 - SURFACE
      ?auto_25031 - PLACE
      ?auto_25037 - HOIST
      ?auto_25038 - SURFACE
      ?auto_25010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25012 ?auto_25015 ) ( IS-CRATE ?auto_25009 ) ( not ( = ?auto_25011 ?auto_25015 ) ) ( HOIST-AT ?auto_25013 ?auto_25011 ) ( AVAILABLE ?auto_25013 ) ( SURFACE-AT ?auto_25009 ?auto_25011 ) ( ON ?auto_25009 ?auto_25014 ) ( CLEAR ?auto_25009 ) ( not ( = ?auto_25008 ?auto_25009 ) ) ( not ( = ?auto_25008 ?auto_25014 ) ) ( not ( = ?auto_25009 ?auto_25014 ) ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( IS-CRATE ?auto_25008 ) ( not ( = ?auto_25026 ?auto_25015 ) ) ( HOIST-AT ?auto_25034 ?auto_25026 ) ( SURFACE-AT ?auto_25008 ?auto_25026 ) ( ON ?auto_25008 ?auto_25027 ) ( CLEAR ?auto_25008 ) ( not ( = ?auto_25007 ?auto_25008 ) ) ( not ( = ?auto_25007 ?auto_25027 ) ) ( not ( = ?auto_25008 ?auto_25027 ) ) ( not ( = ?auto_25012 ?auto_25034 ) ) ( IS-CRATE ?auto_25007 ) ( not ( = ?auto_25043 ?auto_25015 ) ) ( HOIST-AT ?auto_25022 ?auto_25043 ) ( AVAILABLE ?auto_25022 ) ( SURFACE-AT ?auto_25007 ?auto_25043 ) ( ON ?auto_25007 ?auto_25024 ) ( CLEAR ?auto_25007 ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25024 ) ) ( not ( = ?auto_25007 ?auto_25024 ) ) ( not ( = ?auto_25012 ?auto_25022 ) ) ( IS-CRATE ?auto_25006 ) ( not ( = ?auto_25017 ?auto_25015 ) ) ( HOIST-AT ?auto_25042 ?auto_25017 ) ( SURFACE-AT ?auto_25006 ?auto_25017 ) ( ON ?auto_25006 ?auto_25029 ) ( CLEAR ?auto_25006 ) ( not ( = ?auto_25005 ?auto_25006 ) ) ( not ( = ?auto_25005 ?auto_25029 ) ) ( not ( = ?auto_25006 ?auto_25029 ) ) ( not ( = ?auto_25012 ?auto_25042 ) ) ( IS-CRATE ?auto_25005 ) ( not ( = ?auto_25025 ?auto_25015 ) ) ( HOIST-AT ?auto_25016 ?auto_25025 ) ( AVAILABLE ?auto_25016 ) ( SURFACE-AT ?auto_25005 ?auto_25025 ) ( ON ?auto_25005 ?auto_25030 ) ( CLEAR ?auto_25005 ) ( not ( = ?auto_25004 ?auto_25005 ) ) ( not ( = ?auto_25004 ?auto_25030 ) ) ( not ( = ?auto_25005 ?auto_25030 ) ) ( not ( = ?auto_25012 ?auto_25016 ) ) ( IS-CRATE ?auto_25004 ) ( not ( = ?auto_25023 ?auto_25015 ) ) ( HOIST-AT ?auto_25033 ?auto_25023 ) ( AVAILABLE ?auto_25033 ) ( SURFACE-AT ?auto_25004 ?auto_25023 ) ( ON ?auto_25004 ?auto_25044 ) ( CLEAR ?auto_25004 ) ( not ( = ?auto_25003 ?auto_25004 ) ) ( not ( = ?auto_25003 ?auto_25044 ) ) ( not ( = ?auto_25004 ?auto_25044 ) ) ( not ( = ?auto_25012 ?auto_25033 ) ) ( IS-CRATE ?auto_25003 ) ( AVAILABLE ?auto_25034 ) ( SURFACE-AT ?auto_25003 ?auto_25026 ) ( ON ?auto_25003 ?auto_25040 ) ( CLEAR ?auto_25003 ) ( not ( = ?auto_25002 ?auto_25003 ) ) ( not ( = ?auto_25002 ?auto_25040 ) ) ( not ( = ?auto_25003 ?auto_25040 ) ) ( IS-CRATE ?auto_25002 ) ( not ( = ?auto_25019 ?auto_25015 ) ) ( HOIST-AT ?auto_25035 ?auto_25019 ) ( AVAILABLE ?auto_25035 ) ( SURFACE-AT ?auto_25002 ?auto_25019 ) ( ON ?auto_25002 ?auto_25045 ) ( CLEAR ?auto_25002 ) ( not ( = ?auto_25001 ?auto_25002 ) ) ( not ( = ?auto_25001 ?auto_25045 ) ) ( not ( = ?auto_25002 ?auto_25045 ) ) ( not ( = ?auto_25012 ?auto_25035 ) ) ( IS-CRATE ?auto_25001 ) ( SURFACE-AT ?auto_25001 ?auto_25017 ) ( ON ?auto_25001 ?auto_25032 ) ( CLEAR ?auto_25001 ) ( not ( = ?auto_25000 ?auto_25001 ) ) ( not ( = ?auto_25000 ?auto_25032 ) ) ( not ( = ?auto_25001 ?auto_25032 ) ) ( IS-CRATE ?auto_25000 ) ( not ( = ?auto_25018 ?auto_25015 ) ) ( HOIST-AT ?auto_25041 ?auto_25018 ) ( AVAILABLE ?auto_25041 ) ( SURFACE-AT ?auto_25000 ?auto_25018 ) ( ON ?auto_25000 ?auto_25028 ) ( CLEAR ?auto_25000 ) ( not ( = ?auto_24999 ?auto_25000 ) ) ( not ( = ?auto_24999 ?auto_25028 ) ) ( not ( = ?auto_25000 ?auto_25028 ) ) ( not ( = ?auto_25012 ?auto_25041 ) ) ( IS-CRATE ?auto_24999 ) ( not ( = ?auto_25020 ?auto_25015 ) ) ( HOIST-AT ?auto_25021 ?auto_25020 ) ( AVAILABLE ?auto_25021 ) ( SURFACE-AT ?auto_24999 ?auto_25020 ) ( ON ?auto_24999 ?auto_25036 ) ( CLEAR ?auto_24999 ) ( not ( = ?auto_24998 ?auto_24999 ) ) ( not ( = ?auto_24998 ?auto_25036 ) ) ( not ( = ?auto_24999 ?auto_25036 ) ) ( not ( = ?auto_25012 ?auto_25021 ) ) ( IS-CRATE ?auto_24998 ) ( AVAILABLE ?auto_25042 ) ( SURFACE-AT ?auto_24998 ?auto_25017 ) ( ON ?auto_24998 ?auto_25039 ) ( CLEAR ?auto_24998 ) ( not ( = ?auto_24997 ?auto_24998 ) ) ( not ( = ?auto_24997 ?auto_25039 ) ) ( not ( = ?auto_24998 ?auto_25039 ) ) ( SURFACE-AT ?auto_24996 ?auto_25015 ) ( CLEAR ?auto_24996 ) ( IS-CRATE ?auto_24997 ) ( AVAILABLE ?auto_25012 ) ( not ( = ?auto_25031 ?auto_25015 ) ) ( HOIST-AT ?auto_25037 ?auto_25031 ) ( AVAILABLE ?auto_25037 ) ( SURFACE-AT ?auto_24997 ?auto_25031 ) ( ON ?auto_24997 ?auto_25038 ) ( CLEAR ?auto_24997 ) ( TRUCK-AT ?auto_25010 ?auto_25015 ) ( not ( = ?auto_24996 ?auto_24997 ) ) ( not ( = ?auto_24996 ?auto_25038 ) ) ( not ( = ?auto_24997 ?auto_25038 ) ) ( not ( = ?auto_25012 ?auto_25037 ) ) ( not ( = ?auto_24996 ?auto_24998 ) ) ( not ( = ?auto_24996 ?auto_25039 ) ) ( not ( = ?auto_24998 ?auto_25038 ) ) ( not ( = ?auto_25017 ?auto_25031 ) ) ( not ( = ?auto_25042 ?auto_25037 ) ) ( not ( = ?auto_25039 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_24999 ) ) ( not ( = ?auto_24996 ?auto_25036 ) ) ( not ( = ?auto_24997 ?auto_24999 ) ) ( not ( = ?auto_24997 ?auto_25036 ) ) ( not ( = ?auto_24999 ?auto_25039 ) ) ( not ( = ?auto_24999 ?auto_25038 ) ) ( not ( = ?auto_25020 ?auto_25017 ) ) ( not ( = ?auto_25020 ?auto_25031 ) ) ( not ( = ?auto_25021 ?auto_25042 ) ) ( not ( = ?auto_25021 ?auto_25037 ) ) ( not ( = ?auto_25036 ?auto_25039 ) ) ( not ( = ?auto_25036 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25000 ) ) ( not ( = ?auto_24996 ?auto_25028 ) ) ( not ( = ?auto_24997 ?auto_25000 ) ) ( not ( = ?auto_24997 ?auto_25028 ) ) ( not ( = ?auto_24998 ?auto_25000 ) ) ( not ( = ?auto_24998 ?auto_25028 ) ) ( not ( = ?auto_25000 ?auto_25036 ) ) ( not ( = ?auto_25000 ?auto_25039 ) ) ( not ( = ?auto_25000 ?auto_25038 ) ) ( not ( = ?auto_25018 ?auto_25020 ) ) ( not ( = ?auto_25018 ?auto_25017 ) ) ( not ( = ?auto_25018 ?auto_25031 ) ) ( not ( = ?auto_25041 ?auto_25021 ) ) ( not ( = ?auto_25041 ?auto_25042 ) ) ( not ( = ?auto_25041 ?auto_25037 ) ) ( not ( = ?auto_25028 ?auto_25036 ) ) ( not ( = ?auto_25028 ?auto_25039 ) ) ( not ( = ?auto_25028 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25001 ) ) ( not ( = ?auto_24996 ?auto_25032 ) ) ( not ( = ?auto_24997 ?auto_25001 ) ) ( not ( = ?auto_24997 ?auto_25032 ) ) ( not ( = ?auto_24998 ?auto_25001 ) ) ( not ( = ?auto_24998 ?auto_25032 ) ) ( not ( = ?auto_24999 ?auto_25001 ) ) ( not ( = ?auto_24999 ?auto_25032 ) ) ( not ( = ?auto_25001 ?auto_25028 ) ) ( not ( = ?auto_25001 ?auto_25036 ) ) ( not ( = ?auto_25001 ?auto_25039 ) ) ( not ( = ?auto_25001 ?auto_25038 ) ) ( not ( = ?auto_25032 ?auto_25028 ) ) ( not ( = ?auto_25032 ?auto_25036 ) ) ( not ( = ?auto_25032 ?auto_25039 ) ) ( not ( = ?auto_25032 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25002 ) ) ( not ( = ?auto_24996 ?auto_25045 ) ) ( not ( = ?auto_24997 ?auto_25002 ) ) ( not ( = ?auto_24997 ?auto_25045 ) ) ( not ( = ?auto_24998 ?auto_25002 ) ) ( not ( = ?auto_24998 ?auto_25045 ) ) ( not ( = ?auto_24999 ?auto_25002 ) ) ( not ( = ?auto_24999 ?auto_25045 ) ) ( not ( = ?auto_25000 ?auto_25002 ) ) ( not ( = ?auto_25000 ?auto_25045 ) ) ( not ( = ?auto_25002 ?auto_25032 ) ) ( not ( = ?auto_25002 ?auto_25028 ) ) ( not ( = ?auto_25002 ?auto_25036 ) ) ( not ( = ?auto_25002 ?auto_25039 ) ) ( not ( = ?auto_25002 ?auto_25038 ) ) ( not ( = ?auto_25019 ?auto_25017 ) ) ( not ( = ?auto_25019 ?auto_25018 ) ) ( not ( = ?auto_25019 ?auto_25020 ) ) ( not ( = ?auto_25019 ?auto_25031 ) ) ( not ( = ?auto_25035 ?auto_25042 ) ) ( not ( = ?auto_25035 ?auto_25041 ) ) ( not ( = ?auto_25035 ?auto_25021 ) ) ( not ( = ?auto_25035 ?auto_25037 ) ) ( not ( = ?auto_25045 ?auto_25032 ) ) ( not ( = ?auto_25045 ?auto_25028 ) ) ( not ( = ?auto_25045 ?auto_25036 ) ) ( not ( = ?auto_25045 ?auto_25039 ) ) ( not ( = ?auto_25045 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25003 ) ) ( not ( = ?auto_24996 ?auto_25040 ) ) ( not ( = ?auto_24997 ?auto_25003 ) ) ( not ( = ?auto_24997 ?auto_25040 ) ) ( not ( = ?auto_24998 ?auto_25003 ) ) ( not ( = ?auto_24998 ?auto_25040 ) ) ( not ( = ?auto_24999 ?auto_25003 ) ) ( not ( = ?auto_24999 ?auto_25040 ) ) ( not ( = ?auto_25000 ?auto_25003 ) ) ( not ( = ?auto_25000 ?auto_25040 ) ) ( not ( = ?auto_25001 ?auto_25003 ) ) ( not ( = ?auto_25001 ?auto_25040 ) ) ( not ( = ?auto_25003 ?auto_25045 ) ) ( not ( = ?auto_25003 ?auto_25032 ) ) ( not ( = ?auto_25003 ?auto_25028 ) ) ( not ( = ?auto_25003 ?auto_25036 ) ) ( not ( = ?auto_25003 ?auto_25039 ) ) ( not ( = ?auto_25003 ?auto_25038 ) ) ( not ( = ?auto_25026 ?auto_25019 ) ) ( not ( = ?auto_25026 ?auto_25017 ) ) ( not ( = ?auto_25026 ?auto_25018 ) ) ( not ( = ?auto_25026 ?auto_25020 ) ) ( not ( = ?auto_25026 ?auto_25031 ) ) ( not ( = ?auto_25034 ?auto_25035 ) ) ( not ( = ?auto_25034 ?auto_25042 ) ) ( not ( = ?auto_25034 ?auto_25041 ) ) ( not ( = ?auto_25034 ?auto_25021 ) ) ( not ( = ?auto_25034 ?auto_25037 ) ) ( not ( = ?auto_25040 ?auto_25045 ) ) ( not ( = ?auto_25040 ?auto_25032 ) ) ( not ( = ?auto_25040 ?auto_25028 ) ) ( not ( = ?auto_25040 ?auto_25036 ) ) ( not ( = ?auto_25040 ?auto_25039 ) ) ( not ( = ?auto_25040 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25004 ) ) ( not ( = ?auto_24996 ?auto_25044 ) ) ( not ( = ?auto_24997 ?auto_25004 ) ) ( not ( = ?auto_24997 ?auto_25044 ) ) ( not ( = ?auto_24998 ?auto_25004 ) ) ( not ( = ?auto_24998 ?auto_25044 ) ) ( not ( = ?auto_24999 ?auto_25004 ) ) ( not ( = ?auto_24999 ?auto_25044 ) ) ( not ( = ?auto_25000 ?auto_25004 ) ) ( not ( = ?auto_25000 ?auto_25044 ) ) ( not ( = ?auto_25001 ?auto_25004 ) ) ( not ( = ?auto_25001 ?auto_25044 ) ) ( not ( = ?auto_25002 ?auto_25004 ) ) ( not ( = ?auto_25002 ?auto_25044 ) ) ( not ( = ?auto_25004 ?auto_25040 ) ) ( not ( = ?auto_25004 ?auto_25045 ) ) ( not ( = ?auto_25004 ?auto_25032 ) ) ( not ( = ?auto_25004 ?auto_25028 ) ) ( not ( = ?auto_25004 ?auto_25036 ) ) ( not ( = ?auto_25004 ?auto_25039 ) ) ( not ( = ?auto_25004 ?auto_25038 ) ) ( not ( = ?auto_25023 ?auto_25026 ) ) ( not ( = ?auto_25023 ?auto_25019 ) ) ( not ( = ?auto_25023 ?auto_25017 ) ) ( not ( = ?auto_25023 ?auto_25018 ) ) ( not ( = ?auto_25023 ?auto_25020 ) ) ( not ( = ?auto_25023 ?auto_25031 ) ) ( not ( = ?auto_25033 ?auto_25034 ) ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( not ( = ?auto_25033 ?auto_25042 ) ) ( not ( = ?auto_25033 ?auto_25041 ) ) ( not ( = ?auto_25033 ?auto_25021 ) ) ( not ( = ?auto_25033 ?auto_25037 ) ) ( not ( = ?auto_25044 ?auto_25040 ) ) ( not ( = ?auto_25044 ?auto_25045 ) ) ( not ( = ?auto_25044 ?auto_25032 ) ) ( not ( = ?auto_25044 ?auto_25028 ) ) ( not ( = ?auto_25044 ?auto_25036 ) ) ( not ( = ?auto_25044 ?auto_25039 ) ) ( not ( = ?auto_25044 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25005 ) ) ( not ( = ?auto_24996 ?auto_25030 ) ) ( not ( = ?auto_24997 ?auto_25005 ) ) ( not ( = ?auto_24997 ?auto_25030 ) ) ( not ( = ?auto_24998 ?auto_25005 ) ) ( not ( = ?auto_24998 ?auto_25030 ) ) ( not ( = ?auto_24999 ?auto_25005 ) ) ( not ( = ?auto_24999 ?auto_25030 ) ) ( not ( = ?auto_25000 ?auto_25005 ) ) ( not ( = ?auto_25000 ?auto_25030 ) ) ( not ( = ?auto_25001 ?auto_25005 ) ) ( not ( = ?auto_25001 ?auto_25030 ) ) ( not ( = ?auto_25002 ?auto_25005 ) ) ( not ( = ?auto_25002 ?auto_25030 ) ) ( not ( = ?auto_25003 ?auto_25005 ) ) ( not ( = ?auto_25003 ?auto_25030 ) ) ( not ( = ?auto_25005 ?auto_25044 ) ) ( not ( = ?auto_25005 ?auto_25040 ) ) ( not ( = ?auto_25005 ?auto_25045 ) ) ( not ( = ?auto_25005 ?auto_25032 ) ) ( not ( = ?auto_25005 ?auto_25028 ) ) ( not ( = ?auto_25005 ?auto_25036 ) ) ( not ( = ?auto_25005 ?auto_25039 ) ) ( not ( = ?auto_25005 ?auto_25038 ) ) ( not ( = ?auto_25025 ?auto_25023 ) ) ( not ( = ?auto_25025 ?auto_25026 ) ) ( not ( = ?auto_25025 ?auto_25019 ) ) ( not ( = ?auto_25025 ?auto_25017 ) ) ( not ( = ?auto_25025 ?auto_25018 ) ) ( not ( = ?auto_25025 ?auto_25020 ) ) ( not ( = ?auto_25025 ?auto_25031 ) ) ( not ( = ?auto_25016 ?auto_25033 ) ) ( not ( = ?auto_25016 ?auto_25034 ) ) ( not ( = ?auto_25016 ?auto_25035 ) ) ( not ( = ?auto_25016 ?auto_25042 ) ) ( not ( = ?auto_25016 ?auto_25041 ) ) ( not ( = ?auto_25016 ?auto_25021 ) ) ( not ( = ?auto_25016 ?auto_25037 ) ) ( not ( = ?auto_25030 ?auto_25044 ) ) ( not ( = ?auto_25030 ?auto_25040 ) ) ( not ( = ?auto_25030 ?auto_25045 ) ) ( not ( = ?auto_25030 ?auto_25032 ) ) ( not ( = ?auto_25030 ?auto_25028 ) ) ( not ( = ?auto_25030 ?auto_25036 ) ) ( not ( = ?auto_25030 ?auto_25039 ) ) ( not ( = ?auto_25030 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25006 ) ) ( not ( = ?auto_24996 ?auto_25029 ) ) ( not ( = ?auto_24997 ?auto_25006 ) ) ( not ( = ?auto_24997 ?auto_25029 ) ) ( not ( = ?auto_24998 ?auto_25006 ) ) ( not ( = ?auto_24998 ?auto_25029 ) ) ( not ( = ?auto_24999 ?auto_25006 ) ) ( not ( = ?auto_24999 ?auto_25029 ) ) ( not ( = ?auto_25000 ?auto_25006 ) ) ( not ( = ?auto_25000 ?auto_25029 ) ) ( not ( = ?auto_25001 ?auto_25006 ) ) ( not ( = ?auto_25001 ?auto_25029 ) ) ( not ( = ?auto_25002 ?auto_25006 ) ) ( not ( = ?auto_25002 ?auto_25029 ) ) ( not ( = ?auto_25003 ?auto_25006 ) ) ( not ( = ?auto_25003 ?auto_25029 ) ) ( not ( = ?auto_25004 ?auto_25006 ) ) ( not ( = ?auto_25004 ?auto_25029 ) ) ( not ( = ?auto_25006 ?auto_25030 ) ) ( not ( = ?auto_25006 ?auto_25044 ) ) ( not ( = ?auto_25006 ?auto_25040 ) ) ( not ( = ?auto_25006 ?auto_25045 ) ) ( not ( = ?auto_25006 ?auto_25032 ) ) ( not ( = ?auto_25006 ?auto_25028 ) ) ( not ( = ?auto_25006 ?auto_25036 ) ) ( not ( = ?auto_25006 ?auto_25039 ) ) ( not ( = ?auto_25006 ?auto_25038 ) ) ( not ( = ?auto_25029 ?auto_25030 ) ) ( not ( = ?auto_25029 ?auto_25044 ) ) ( not ( = ?auto_25029 ?auto_25040 ) ) ( not ( = ?auto_25029 ?auto_25045 ) ) ( not ( = ?auto_25029 ?auto_25032 ) ) ( not ( = ?auto_25029 ?auto_25028 ) ) ( not ( = ?auto_25029 ?auto_25036 ) ) ( not ( = ?auto_25029 ?auto_25039 ) ) ( not ( = ?auto_25029 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25007 ) ) ( not ( = ?auto_24996 ?auto_25024 ) ) ( not ( = ?auto_24997 ?auto_25007 ) ) ( not ( = ?auto_24997 ?auto_25024 ) ) ( not ( = ?auto_24998 ?auto_25007 ) ) ( not ( = ?auto_24998 ?auto_25024 ) ) ( not ( = ?auto_24999 ?auto_25007 ) ) ( not ( = ?auto_24999 ?auto_25024 ) ) ( not ( = ?auto_25000 ?auto_25007 ) ) ( not ( = ?auto_25000 ?auto_25024 ) ) ( not ( = ?auto_25001 ?auto_25007 ) ) ( not ( = ?auto_25001 ?auto_25024 ) ) ( not ( = ?auto_25002 ?auto_25007 ) ) ( not ( = ?auto_25002 ?auto_25024 ) ) ( not ( = ?auto_25003 ?auto_25007 ) ) ( not ( = ?auto_25003 ?auto_25024 ) ) ( not ( = ?auto_25004 ?auto_25007 ) ) ( not ( = ?auto_25004 ?auto_25024 ) ) ( not ( = ?auto_25005 ?auto_25007 ) ) ( not ( = ?auto_25005 ?auto_25024 ) ) ( not ( = ?auto_25007 ?auto_25029 ) ) ( not ( = ?auto_25007 ?auto_25030 ) ) ( not ( = ?auto_25007 ?auto_25044 ) ) ( not ( = ?auto_25007 ?auto_25040 ) ) ( not ( = ?auto_25007 ?auto_25045 ) ) ( not ( = ?auto_25007 ?auto_25032 ) ) ( not ( = ?auto_25007 ?auto_25028 ) ) ( not ( = ?auto_25007 ?auto_25036 ) ) ( not ( = ?auto_25007 ?auto_25039 ) ) ( not ( = ?auto_25007 ?auto_25038 ) ) ( not ( = ?auto_25043 ?auto_25017 ) ) ( not ( = ?auto_25043 ?auto_25025 ) ) ( not ( = ?auto_25043 ?auto_25023 ) ) ( not ( = ?auto_25043 ?auto_25026 ) ) ( not ( = ?auto_25043 ?auto_25019 ) ) ( not ( = ?auto_25043 ?auto_25018 ) ) ( not ( = ?auto_25043 ?auto_25020 ) ) ( not ( = ?auto_25043 ?auto_25031 ) ) ( not ( = ?auto_25022 ?auto_25042 ) ) ( not ( = ?auto_25022 ?auto_25016 ) ) ( not ( = ?auto_25022 ?auto_25033 ) ) ( not ( = ?auto_25022 ?auto_25034 ) ) ( not ( = ?auto_25022 ?auto_25035 ) ) ( not ( = ?auto_25022 ?auto_25041 ) ) ( not ( = ?auto_25022 ?auto_25021 ) ) ( not ( = ?auto_25022 ?auto_25037 ) ) ( not ( = ?auto_25024 ?auto_25029 ) ) ( not ( = ?auto_25024 ?auto_25030 ) ) ( not ( = ?auto_25024 ?auto_25044 ) ) ( not ( = ?auto_25024 ?auto_25040 ) ) ( not ( = ?auto_25024 ?auto_25045 ) ) ( not ( = ?auto_25024 ?auto_25032 ) ) ( not ( = ?auto_25024 ?auto_25028 ) ) ( not ( = ?auto_25024 ?auto_25036 ) ) ( not ( = ?auto_25024 ?auto_25039 ) ) ( not ( = ?auto_25024 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25008 ) ) ( not ( = ?auto_24996 ?auto_25027 ) ) ( not ( = ?auto_24997 ?auto_25008 ) ) ( not ( = ?auto_24997 ?auto_25027 ) ) ( not ( = ?auto_24998 ?auto_25008 ) ) ( not ( = ?auto_24998 ?auto_25027 ) ) ( not ( = ?auto_24999 ?auto_25008 ) ) ( not ( = ?auto_24999 ?auto_25027 ) ) ( not ( = ?auto_25000 ?auto_25008 ) ) ( not ( = ?auto_25000 ?auto_25027 ) ) ( not ( = ?auto_25001 ?auto_25008 ) ) ( not ( = ?auto_25001 ?auto_25027 ) ) ( not ( = ?auto_25002 ?auto_25008 ) ) ( not ( = ?auto_25002 ?auto_25027 ) ) ( not ( = ?auto_25003 ?auto_25008 ) ) ( not ( = ?auto_25003 ?auto_25027 ) ) ( not ( = ?auto_25004 ?auto_25008 ) ) ( not ( = ?auto_25004 ?auto_25027 ) ) ( not ( = ?auto_25005 ?auto_25008 ) ) ( not ( = ?auto_25005 ?auto_25027 ) ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( not ( = ?auto_25006 ?auto_25027 ) ) ( not ( = ?auto_25008 ?auto_25024 ) ) ( not ( = ?auto_25008 ?auto_25029 ) ) ( not ( = ?auto_25008 ?auto_25030 ) ) ( not ( = ?auto_25008 ?auto_25044 ) ) ( not ( = ?auto_25008 ?auto_25040 ) ) ( not ( = ?auto_25008 ?auto_25045 ) ) ( not ( = ?auto_25008 ?auto_25032 ) ) ( not ( = ?auto_25008 ?auto_25028 ) ) ( not ( = ?auto_25008 ?auto_25036 ) ) ( not ( = ?auto_25008 ?auto_25039 ) ) ( not ( = ?auto_25008 ?auto_25038 ) ) ( not ( = ?auto_25027 ?auto_25024 ) ) ( not ( = ?auto_25027 ?auto_25029 ) ) ( not ( = ?auto_25027 ?auto_25030 ) ) ( not ( = ?auto_25027 ?auto_25044 ) ) ( not ( = ?auto_25027 ?auto_25040 ) ) ( not ( = ?auto_25027 ?auto_25045 ) ) ( not ( = ?auto_25027 ?auto_25032 ) ) ( not ( = ?auto_25027 ?auto_25028 ) ) ( not ( = ?auto_25027 ?auto_25036 ) ) ( not ( = ?auto_25027 ?auto_25039 ) ) ( not ( = ?auto_25027 ?auto_25038 ) ) ( not ( = ?auto_24996 ?auto_25009 ) ) ( not ( = ?auto_24996 ?auto_25014 ) ) ( not ( = ?auto_24997 ?auto_25009 ) ) ( not ( = ?auto_24997 ?auto_25014 ) ) ( not ( = ?auto_24998 ?auto_25009 ) ) ( not ( = ?auto_24998 ?auto_25014 ) ) ( not ( = ?auto_24999 ?auto_25009 ) ) ( not ( = ?auto_24999 ?auto_25014 ) ) ( not ( = ?auto_25000 ?auto_25009 ) ) ( not ( = ?auto_25000 ?auto_25014 ) ) ( not ( = ?auto_25001 ?auto_25009 ) ) ( not ( = ?auto_25001 ?auto_25014 ) ) ( not ( = ?auto_25002 ?auto_25009 ) ) ( not ( = ?auto_25002 ?auto_25014 ) ) ( not ( = ?auto_25003 ?auto_25009 ) ) ( not ( = ?auto_25003 ?auto_25014 ) ) ( not ( = ?auto_25004 ?auto_25009 ) ) ( not ( = ?auto_25004 ?auto_25014 ) ) ( not ( = ?auto_25005 ?auto_25009 ) ) ( not ( = ?auto_25005 ?auto_25014 ) ) ( not ( = ?auto_25006 ?auto_25009 ) ) ( not ( = ?auto_25006 ?auto_25014 ) ) ( not ( = ?auto_25007 ?auto_25009 ) ) ( not ( = ?auto_25007 ?auto_25014 ) ) ( not ( = ?auto_25009 ?auto_25027 ) ) ( not ( = ?auto_25009 ?auto_25024 ) ) ( not ( = ?auto_25009 ?auto_25029 ) ) ( not ( = ?auto_25009 ?auto_25030 ) ) ( not ( = ?auto_25009 ?auto_25044 ) ) ( not ( = ?auto_25009 ?auto_25040 ) ) ( not ( = ?auto_25009 ?auto_25045 ) ) ( not ( = ?auto_25009 ?auto_25032 ) ) ( not ( = ?auto_25009 ?auto_25028 ) ) ( not ( = ?auto_25009 ?auto_25036 ) ) ( not ( = ?auto_25009 ?auto_25039 ) ) ( not ( = ?auto_25009 ?auto_25038 ) ) ( not ( = ?auto_25011 ?auto_25026 ) ) ( not ( = ?auto_25011 ?auto_25043 ) ) ( not ( = ?auto_25011 ?auto_25017 ) ) ( not ( = ?auto_25011 ?auto_25025 ) ) ( not ( = ?auto_25011 ?auto_25023 ) ) ( not ( = ?auto_25011 ?auto_25019 ) ) ( not ( = ?auto_25011 ?auto_25018 ) ) ( not ( = ?auto_25011 ?auto_25020 ) ) ( not ( = ?auto_25011 ?auto_25031 ) ) ( not ( = ?auto_25013 ?auto_25034 ) ) ( not ( = ?auto_25013 ?auto_25022 ) ) ( not ( = ?auto_25013 ?auto_25042 ) ) ( not ( = ?auto_25013 ?auto_25016 ) ) ( not ( = ?auto_25013 ?auto_25033 ) ) ( not ( = ?auto_25013 ?auto_25035 ) ) ( not ( = ?auto_25013 ?auto_25041 ) ) ( not ( = ?auto_25013 ?auto_25021 ) ) ( not ( = ?auto_25013 ?auto_25037 ) ) ( not ( = ?auto_25014 ?auto_25027 ) ) ( not ( = ?auto_25014 ?auto_25024 ) ) ( not ( = ?auto_25014 ?auto_25029 ) ) ( not ( = ?auto_25014 ?auto_25030 ) ) ( not ( = ?auto_25014 ?auto_25044 ) ) ( not ( = ?auto_25014 ?auto_25040 ) ) ( not ( = ?auto_25014 ?auto_25045 ) ) ( not ( = ?auto_25014 ?auto_25032 ) ) ( not ( = ?auto_25014 ?auto_25028 ) ) ( not ( = ?auto_25014 ?auto_25036 ) ) ( not ( = ?auto_25014 ?auto_25039 ) ) ( not ( = ?auto_25014 ?auto_25038 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_24996 ?auto_24997 ?auto_24998 ?auto_24999 ?auto_25000 ?auto_25001 ?auto_25002 ?auto_25003 ?auto_25004 ?auto_25005 ?auto_25006 ?auto_25007 ?auto_25008 )
      ( MAKE-1CRATE ?auto_25008 ?auto_25009 )
      ( MAKE-13CRATE-VERIFY ?auto_24996 ?auto_24997 ?auto_24998 ?auto_24999 ?auto_25000 ?auto_25001 ?auto_25002 ?auto_25003 ?auto_25004 ?auto_25005 ?auto_25006 ?auto_25007 ?auto_25008 ?auto_25009 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_25071 - SURFACE
      ?auto_25072 - SURFACE
      ?auto_25073 - SURFACE
      ?auto_25074 - SURFACE
      ?auto_25075 - SURFACE
      ?auto_25076 - SURFACE
      ?auto_25077 - SURFACE
      ?auto_25078 - SURFACE
      ?auto_25079 - SURFACE
      ?auto_25080 - SURFACE
      ?auto_25081 - SURFACE
      ?auto_25082 - SURFACE
      ?auto_25083 - SURFACE
      ?auto_25084 - SURFACE
      ?auto_25085 - SURFACE
    )
    :vars
    (
      ?auto_25090 - HOIST
      ?auto_25088 - PLACE
      ?auto_25089 - PLACE
      ?auto_25091 - HOIST
      ?auto_25086 - SURFACE
      ?auto_25110 - PLACE
      ?auto_25118 - HOIST
      ?auto_25120 - SURFACE
      ?auto_25095 - PLACE
      ?auto_25102 - HOIST
      ?auto_25097 - SURFACE
      ?auto_25119 - PLACE
      ?auto_25109 - HOIST
      ?auto_25124 - SURFACE
      ?auto_25112 - PLACE
      ?auto_25103 - HOIST
      ?auto_25096 - SURFACE
      ?auto_25098 - PLACE
      ?auto_25123 - HOIST
      ?auto_25116 - SURFACE
      ?auto_25114 - PLACE
      ?auto_25100 - HOIST
      ?auto_25104 - SURFACE
      ?auto_25121 - SURFACE
      ?auto_25111 - PLACE
      ?auto_25101 - HOIST
      ?auto_25106 - SURFACE
      ?auto_25092 - SURFACE
      ?auto_25117 - PLACE
      ?auto_25115 - HOIST
      ?auto_25093 - SURFACE
      ?auto_25113 - PLACE
      ?auto_25105 - HOIST
      ?auto_25122 - SURFACE
      ?auto_25099 - SURFACE
      ?auto_25094 - PLACE
      ?auto_25108 - HOIST
      ?auto_25107 - SURFACE
      ?auto_25087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25090 ?auto_25088 ) ( IS-CRATE ?auto_25085 ) ( not ( = ?auto_25089 ?auto_25088 ) ) ( HOIST-AT ?auto_25091 ?auto_25089 ) ( AVAILABLE ?auto_25091 ) ( SURFACE-AT ?auto_25085 ?auto_25089 ) ( ON ?auto_25085 ?auto_25086 ) ( CLEAR ?auto_25085 ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25086 ) ) ( not ( = ?auto_25090 ?auto_25091 ) ) ( IS-CRATE ?auto_25084 ) ( not ( = ?auto_25110 ?auto_25088 ) ) ( HOIST-AT ?auto_25118 ?auto_25110 ) ( AVAILABLE ?auto_25118 ) ( SURFACE-AT ?auto_25084 ?auto_25110 ) ( ON ?auto_25084 ?auto_25120 ) ( CLEAR ?auto_25084 ) ( not ( = ?auto_25083 ?auto_25084 ) ) ( not ( = ?auto_25083 ?auto_25120 ) ) ( not ( = ?auto_25084 ?auto_25120 ) ) ( not ( = ?auto_25090 ?auto_25118 ) ) ( IS-CRATE ?auto_25083 ) ( not ( = ?auto_25095 ?auto_25088 ) ) ( HOIST-AT ?auto_25102 ?auto_25095 ) ( SURFACE-AT ?auto_25083 ?auto_25095 ) ( ON ?auto_25083 ?auto_25097 ) ( CLEAR ?auto_25083 ) ( not ( = ?auto_25082 ?auto_25083 ) ) ( not ( = ?auto_25082 ?auto_25097 ) ) ( not ( = ?auto_25083 ?auto_25097 ) ) ( not ( = ?auto_25090 ?auto_25102 ) ) ( IS-CRATE ?auto_25082 ) ( not ( = ?auto_25119 ?auto_25088 ) ) ( HOIST-AT ?auto_25109 ?auto_25119 ) ( AVAILABLE ?auto_25109 ) ( SURFACE-AT ?auto_25082 ?auto_25119 ) ( ON ?auto_25082 ?auto_25124 ) ( CLEAR ?auto_25082 ) ( not ( = ?auto_25081 ?auto_25082 ) ) ( not ( = ?auto_25081 ?auto_25124 ) ) ( not ( = ?auto_25082 ?auto_25124 ) ) ( not ( = ?auto_25090 ?auto_25109 ) ) ( IS-CRATE ?auto_25081 ) ( not ( = ?auto_25112 ?auto_25088 ) ) ( HOIST-AT ?auto_25103 ?auto_25112 ) ( SURFACE-AT ?auto_25081 ?auto_25112 ) ( ON ?auto_25081 ?auto_25096 ) ( CLEAR ?auto_25081 ) ( not ( = ?auto_25080 ?auto_25081 ) ) ( not ( = ?auto_25080 ?auto_25096 ) ) ( not ( = ?auto_25081 ?auto_25096 ) ) ( not ( = ?auto_25090 ?auto_25103 ) ) ( IS-CRATE ?auto_25080 ) ( not ( = ?auto_25098 ?auto_25088 ) ) ( HOIST-AT ?auto_25123 ?auto_25098 ) ( AVAILABLE ?auto_25123 ) ( SURFACE-AT ?auto_25080 ?auto_25098 ) ( ON ?auto_25080 ?auto_25116 ) ( CLEAR ?auto_25080 ) ( not ( = ?auto_25079 ?auto_25080 ) ) ( not ( = ?auto_25079 ?auto_25116 ) ) ( not ( = ?auto_25080 ?auto_25116 ) ) ( not ( = ?auto_25090 ?auto_25123 ) ) ( IS-CRATE ?auto_25079 ) ( not ( = ?auto_25114 ?auto_25088 ) ) ( HOIST-AT ?auto_25100 ?auto_25114 ) ( AVAILABLE ?auto_25100 ) ( SURFACE-AT ?auto_25079 ?auto_25114 ) ( ON ?auto_25079 ?auto_25104 ) ( CLEAR ?auto_25079 ) ( not ( = ?auto_25078 ?auto_25079 ) ) ( not ( = ?auto_25078 ?auto_25104 ) ) ( not ( = ?auto_25079 ?auto_25104 ) ) ( not ( = ?auto_25090 ?auto_25100 ) ) ( IS-CRATE ?auto_25078 ) ( AVAILABLE ?auto_25102 ) ( SURFACE-AT ?auto_25078 ?auto_25095 ) ( ON ?auto_25078 ?auto_25121 ) ( CLEAR ?auto_25078 ) ( not ( = ?auto_25077 ?auto_25078 ) ) ( not ( = ?auto_25077 ?auto_25121 ) ) ( not ( = ?auto_25078 ?auto_25121 ) ) ( IS-CRATE ?auto_25077 ) ( not ( = ?auto_25111 ?auto_25088 ) ) ( HOIST-AT ?auto_25101 ?auto_25111 ) ( AVAILABLE ?auto_25101 ) ( SURFACE-AT ?auto_25077 ?auto_25111 ) ( ON ?auto_25077 ?auto_25106 ) ( CLEAR ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25076 ?auto_25106 ) ) ( not ( = ?auto_25077 ?auto_25106 ) ) ( not ( = ?auto_25090 ?auto_25101 ) ) ( IS-CRATE ?auto_25076 ) ( SURFACE-AT ?auto_25076 ?auto_25112 ) ( ON ?auto_25076 ?auto_25092 ) ( CLEAR ?auto_25076 ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25092 ) ) ( not ( = ?auto_25076 ?auto_25092 ) ) ( IS-CRATE ?auto_25075 ) ( not ( = ?auto_25117 ?auto_25088 ) ) ( HOIST-AT ?auto_25115 ?auto_25117 ) ( AVAILABLE ?auto_25115 ) ( SURFACE-AT ?auto_25075 ?auto_25117 ) ( ON ?auto_25075 ?auto_25093 ) ( CLEAR ?auto_25075 ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25093 ) ) ( not ( = ?auto_25075 ?auto_25093 ) ) ( not ( = ?auto_25090 ?auto_25115 ) ) ( IS-CRATE ?auto_25074 ) ( not ( = ?auto_25113 ?auto_25088 ) ) ( HOIST-AT ?auto_25105 ?auto_25113 ) ( AVAILABLE ?auto_25105 ) ( SURFACE-AT ?auto_25074 ?auto_25113 ) ( ON ?auto_25074 ?auto_25122 ) ( CLEAR ?auto_25074 ) ( not ( = ?auto_25073 ?auto_25074 ) ) ( not ( = ?auto_25073 ?auto_25122 ) ) ( not ( = ?auto_25074 ?auto_25122 ) ) ( not ( = ?auto_25090 ?auto_25105 ) ) ( IS-CRATE ?auto_25073 ) ( AVAILABLE ?auto_25103 ) ( SURFACE-AT ?auto_25073 ?auto_25112 ) ( ON ?auto_25073 ?auto_25099 ) ( CLEAR ?auto_25073 ) ( not ( = ?auto_25072 ?auto_25073 ) ) ( not ( = ?auto_25072 ?auto_25099 ) ) ( not ( = ?auto_25073 ?auto_25099 ) ) ( SURFACE-AT ?auto_25071 ?auto_25088 ) ( CLEAR ?auto_25071 ) ( IS-CRATE ?auto_25072 ) ( AVAILABLE ?auto_25090 ) ( not ( = ?auto_25094 ?auto_25088 ) ) ( HOIST-AT ?auto_25108 ?auto_25094 ) ( AVAILABLE ?auto_25108 ) ( SURFACE-AT ?auto_25072 ?auto_25094 ) ( ON ?auto_25072 ?auto_25107 ) ( CLEAR ?auto_25072 ) ( TRUCK-AT ?auto_25087 ?auto_25088 ) ( not ( = ?auto_25071 ?auto_25072 ) ) ( not ( = ?auto_25071 ?auto_25107 ) ) ( not ( = ?auto_25072 ?auto_25107 ) ) ( not ( = ?auto_25090 ?auto_25108 ) ) ( not ( = ?auto_25071 ?auto_25073 ) ) ( not ( = ?auto_25071 ?auto_25099 ) ) ( not ( = ?auto_25073 ?auto_25107 ) ) ( not ( = ?auto_25112 ?auto_25094 ) ) ( not ( = ?auto_25103 ?auto_25108 ) ) ( not ( = ?auto_25099 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25074 ) ) ( not ( = ?auto_25071 ?auto_25122 ) ) ( not ( = ?auto_25072 ?auto_25074 ) ) ( not ( = ?auto_25072 ?auto_25122 ) ) ( not ( = ?auto_25074 ?auto_25099 ) ) ( not ( = ?auto_25074 ?auto_25107 ) ) ( not ( = ?auto_25113 ?auto_25112 ) ) ( not ( = ?auto_25113 ?auto_25094 ) ) ( not ( = ?auto_25105 ?auto_25103 ) ) ( not ( = ?auto_25105 ?auto_25108 ) ) ( not ( = ?auto_25122 ?auto_25099 ) ) ( not ( = ?auto_25122 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25075 ) ) ( not ( = ?auto_25071 ?auto_25093 ) ) ( not ( = ?auto_25072 ?auto_25075 ) ) ( not ( = ?auto_25072 ?auto_25093 ) ) ( not ( = ?auto_25073 ?auto_25075 ) ) ( not ( = ?auto_25073 ?auto_25093 ) ) ( not ( = ?auto_25075 ?auto_25122 ) ) ( not ( = ?auto_25075 ?auto_25099 ) ) ( not ( = ?auto_25075 ?auto_25107 ) ) ( not ( = ?auto_25117 ?auto_25113 ) ) ( not ( = ?auto_25117 ?auto_25112 ) ) ( not ( = ?auto_25117 ?auto_25094 ) ) ( not ( = ?auto_25115 ?auto_25105 ) ) ( not ( = ?auto_25115 ?auto_25103 ) ) ( not ( = ?auto_25115 ?auto_25108 ) ) ( not ( = ?auto_25093 ?auto_25122 ) ) ( not ( = ?auto_25093 ?auto_25099 ) ) ( not ( = ?auto_25093 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25076 ) ) ( not ( = ?auto_25071 ?auto_25092 ) ) ( not ( = ?auto_25072 ?auto_25076 ) ) ( not ( = ?auto_25072 ?auto_25092 ) ) ( not ( = ?auto_25073 ?auto_25076 ) ) ( not ( = ?auto_25073 ?auto_25092 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25092 ) ) ( not ( = ?auto_25076 ?auto_25093 ) ) ( not ( = ?auto_25076 ?auto_25122 ) ) ( not ( = ?auto_25076 ?auto_25099 ) ) ( not ( = ?auto_25076 ?auto_25107 ) ) ( not ( = ?auto_25092 ?auto_25093 ) ) ( not ( = ?auto_25092 ?auto_25122 ) ) ( not ( = ?auto_25092 ?auto_25099 ) ) ( not ( = ?auto_25092 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25077 ) ) ( not ( = ?auto_25071 ?auto_25106 ) ) ( not ( = ?auto_25072 ?auto_25077 ) ) ( not ( = ?auto_25072 ?auto_25106 ) ) ( not ( = ?auto_25073 ?auto_25077 ) ) ( not ( = ?auto_25073 ?auto_25106 ) ) ( not ( = ?auto_25074 ?auto_25077 ) ) ( not ( = ?auto_25074 ?auto_25106 ) ) ( not ( = ?auto_25075 ?auto_25077 ) ) ( not ( = ?auto_25075 ?auto_25106 ) ) ( not ( = ?auto_25077 ?auto_25092 ) ) ( not ( = ?auto_25077 ?auto_25093 ) ) ( not ( = ?auto_25077 ?auto_25122 ) ) ( not ( = ?auto_25077 ?auto_25099 ) ) ( not ( = ?auto_25077 ?auto_25107 ) ) ( not ( = ?auto_25111 ?auto_25112 ) ) ( not ( = ?auto_25111 ?auto_25117 ) ) ( not ( = ?auto_25111 ?auto_25113 ) ) ( not ( = ?auto_25111 ?auto_25094 ) ) ( not ( = ?auto_25101 ?auto_25103 ) ) ( not ( = ?auto_25101 ?auto_25115 ) ) ( not ( = ?auto_25101 ?auto_25105 ) ) ( not ( = ?auto_25101 ?auto_25108 ) ) ( not ( = ?auto_25106 ?auto_25092 ) ) ( not ( = ?auto_25106 ?auto_25093 ) ) ( not ( = ?auto_25106 ?auto_25122 ) ) ( not ( = ?auto_25106 ?auto_25099 ) ) ( not ( = ?auto_25106 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25078 ) ) ( not ( = ?auto_25071 ?auto_25121 ) ) ( not ( = ?auto_25072 ?auto_25078 ) ) ( not ( = ?auto_25072 ?auto_25121 ) ) ( not ( = ?auto_25073 ?auto_25078 ) ) ( not ( = ?auto_25073 ?auto_25121 ) ) ( not ( = ?auto_25074 ?auto_25078 ) ) ( not ( = ?auto_25074 ?auto_25121 ) ) ( not ( = ?auto_25075 ?auto_25078 ) ) ( not ( = ?auto_25075 ?auto_25121 ) ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( not ( = ?auto_25076 ?auto_25121 ) ) ( not ( = ?auto_25078 ?auto_25106 ) ) ( not ( = ?auto_25078 ?auto_25092 ) ) ( not ( = ?auto_25078 ?auto_25093 ) ) ( not ( = ?auto_25078 ?auto_25122 ) ) ( not ( = ?auto_25078 ?auto_25099 ) ) ( not ( = ?auto_25078 ?auto_25107 ) ) ( not ( = ?auto_25095 ?auto_25111 ) ) ( not ( = ?auto_25095 ?auto_25112 ) ) ( not ( = ?auto_25095 ?auto_25117 ) ) ( not ( = ?auto_25095 ?auto_25113 ) ) ( not ( = ?auto_25095 ?auto_25094 ) ) ( not ( = ?auto_25102 ?auto_25101 ) ) ( not ( = ?auto_25102 ?auto_25103 ) ) ( not ( = ?auto_25102 ?auto_25115 ) ) ( not ( = ?auto_25102 ?auto_25105 ) ) ( not ( = ?auto_25102 ?auto_25108 ) ) ( not ( = ?auto_25121 ?auto_25106 ) ) ( not ( = ?auto_25121 ?auto_25092 ) ) ( not ( = ?auto_25121 ?auto_25093 ) ) ( not ( = ?auto_25121 ?auto_25122 ) ) ( not ( = ?auto_25121 ?auto_25099 ) ) ( not ( = ?auto_25121 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25079 ) ) ( not ( = ?auto_25071 ?auto_25104 ) ) ( not ( = ?auto_25072 ?auto_25079 ) ) ( not ( = ?auto_25072 ?auto_25104 ) ) ( not ( = ?auto_25073 ?auto_25079 ) ) ( not ( = ?auto_25073 ?auto_25104 ) ) ( not ( = ?auto_25074 ?auto_25079 ) ) ( not ( = ?auto_25074 ?auto_25104 ) ) ( not ( = ?auto_25075 ?auto_25079 ) ) ( not ( = ?auto_25075 ?auto_25104 ) ) ( not ( = ?auto_25076 ?auto_25079 ) ) ( not ( = ?auto_25076 ?auto_25104 ) ) ( not ( = ?auto_25077 ?auto_25079 ) ) ( not ( = ?auto_25077 ?auto_25104 ) ) ( not ( = ?auto_25079 ?auto_25121 ) ) ( not ( = ?auto_25079 ?auto_25106 ) ) ( not ( = ?auto_25079 ?auto_25092 ) ) ( not ( = ?auto_25079 ?auto_25093 ) ) ( not ( = ?auto_25079 ?auto_25122 ) ) ( not ( = ?auto_25079 ?auto_25099 ) ) ( not ( = ?auto_25079 ?auto_25107 ) ) ( not ( = ?auto_25114 ?auto_25095 ) ) ( not ( = ?auto_25114 ?auto_25111 ) ) ( not ( = ?auto_25114 ?auto_25112 ) ) ( not ( = ?auto_25114 ?auto_25117 ) ) ( not ( = ?auto_25114 ?auto_25113 ) ) ( not ( = ?auto_25114 ?auto_25094 ) ) ( not ( = ?auto_25100 ?auto_25102 ) ) ( not ( = ?auto_25100 ?auto_25101 ) ) ( not ( = ?auto_25100 ?auto_25103 ) ) ( not ( = ?auto_25100 ?auto_25115 ) ) ( not ( = ?auto_25100 ?auto_25105 ) ) ( not ( = ?auto_25100 ?auto_25108 ) ) ( not ( = ?auto_25104 ?auto_25121 ) ) ( not ( = ?auto_25104 ?auto_25106 ) ) ( not ( = ?auto_25104 ?auto_25092 ) ) ( not ( = ?auto_25104 ?auto_25093 ) ) ( not ( = ?auto_25104 ?auto_25122 ) ) ( not ( = ?auto_25104 ?auto_25099 ) ) ( not ( = ?auto_25104 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25080 ) ) ( not ( = ?auto_25071 ?auto_25116 ) ) ( not ( = ?auto_25072 ?auto_25080 ) ) ( not ( = ?auto_25072 ?auto_25116 ) ) ( not ( = ?auto_25073 ?auto_25080 ) ) ( not ( = ?auto_25073 ?auto_25116 ) ) ( not ( = ?auto_25074 ?auto_25080 ) ) ( not ( = ?auto_25074 ?auto_25116 ) ) ( not ( = ?auto_25075 ?auto_25080 ) ) ( not ( = ?auto_25075 ?auto_25116 ) ) ( not ( = ?auto_25076 ?auto_25080 ) ) ( not ( = ?auto_25076 ?auto_25116 ) ) ( not ( = ?auto_25077 ?auto_25080 ) ) ( not ( = ?auto_25077 ?auto_25116 ) ) ( not ( = ?auto_25078 ?auto_25080 ) ) ( not ( = ?auto_25078 ?auto_25116 ) ) ( not ( = ?auto_25080 ?auto_25104 ) ) ( not ( = ?auto_25080 ?auto_25121 ) ) ( not ( = ?auto_25080 ?auto_25106 ) ) ( not ( = ?auto_25080 ?auto_25092 ) ) ( not ( = ?auto_25080 ?auto_25093 ) ) ( not ( = ?auto_25080 ?auto_25122 ) ) ( not ( = ?auto_25080 ?auto_25099 ) ) ( not ( = ?auto_25080 ?auto_25107 ) ) ( not ( = ?auto_25098 ?auto_25114 ) ) ( not ( = ?auto_25098 ?auto_25095 ) ) ( not ( = ?auto_25098 ?auto_25111 ) ) ( not ( = ?auto_25098 ?auto_25112 ) ) ( not ( = ?auto_25098 ?auto_25117 ) ) ( not ( = ?auto_25098 ?auto_25113 ) ) ( not ( = ?auto_25098 ?auto_25094 ) ) ( not ( = ?auto_25123 ?auto_25100 ) ) ( not ( = ?auto_25123 ?auto_25102 ) ) ( not ( = ?auto_25123 ?auto_25101 ) ) ( not ( = ?auto_25123 ?auto_25103 ) ) ( not ( = ?auto_25123 ?auto_25115 ) ) ( not ( = ?auto_25123 ?auto_25105 ) ) ( not ( = ?auto_25123 ?auto_25108 ) ) ( not ( = ?auto_25116 ?auto_25104 ) ) ( not ( = ?auto_25116 ?auto_25121 ) ) ( not ( = ?auto_25116 ?auto_25106 ) ) ( not ( = ?auto_25116 ?auto_25092 ) ) ( not ( = ?auto_25116 ?auto_25093 ) ) ( not ( = ?auto_25116 ?auto_25122 ) ) ( not ( = ?auto_25116 ?auto_25099 ) ) ( not ( = ?auto_25116 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25081 ) ) ( not ( = ?auto_25071 ?auto_25096 ) ) ( not ( = ?auto_25072 ?auto_25081 ) ) ( not ( = ?auto_25072 ?auto_25096 ) ) ( not ( = ?auto_25073 ?auto_25081 ) ) ( not ( = ?auto_25073 ?auto_25096 ) ) ( not ( = ?auto_25074 ?auto_25081 ) ) ( not ( = ?auto_25074 ?auto_25096 ) ) ( not ( = ?auto_25075 ?auto_25081 ) ) ( not ( = ?auto_25075 ?auto_25096 ) ) ( not ( = ?auto_25076 ?auto_25081 ) ) ( not ( = ?auto_25076 ?auto_25096 ) ) ( not ( = ?auto_25077 ?auto_25081 ) ) ( not ( = ?auto_25077 ?auto_25096 ) ) ( not ( = ?auto_25078 ?auto_25081 ) ) ( not ( = ?auto_25078 ?auto_25096 ) ) ( not ( = ?auto_25079 ?auto_25081 ) ) ( not ( = ?auto_25079 ?auto_25096 ) ) ( not ( = ?auto_25081 ?auto_25116 ) ) ( not ( = ?auto_25081 ?auto_25104 ) ) ( not ( = ?auto_25081 ?auto_25121 ) ) ( not ( = ?auto_25081 ?auto_25106 ) ) ( not ( = ?auto_25081 ?auto_25092 ) ) ( not ( = ?auto_25081 ?auto_25093 ) ) ( not ( = ?auto_25081 ?auto_25122 ) ) ( not ( = ?auto_25081 ?auto_25099 ) ) ( not ( = ?auto_25081 ?auto_25107 ) ) ( not ( = ?auto_25096 ?auto_25116 ) ) ( not ( = ?auto_25096 ?auto_25104 ) ) ( not ( = ?auto_25096 ?auto_25121 ) ) ( not ( = ?auto_25096 ?auto_25106 ) ) ( not ( = ?auto_25096 ?auto_25092 ) ) ( not ( = ?auto_25096 ?auto_25093 ) ) ( not ( = ?auto_25096 ?auto_25122 ) ) ( not ( = ?auto_25096 ?auto_25099 ) ) ( not ( = ?auto_25096 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25082 ) ) ( not ( = ?auto_25071 ?auto_25124 ) ) ( not ( = ?auto_25072 ?auto_25082 ) ) ( not ( = ?auto_25072 ?auto_25124 ) ) ( not ( = ?auto_25073 ?auto_25082 ) ) ( not ( = ?auto_25073 ?auto_25124 ) ) ( not ( = ?auto_25074 ?auto_25082 ) ) ( not ( = ?auto_25074 ?auto_25124 ) ) ( not ( = ?auto_25075 ?auto_25082 ) ) ( not ( = ?auto_25075 ?auto_25124 ) ) ( not ( = ?auto_25076 ?auto_25082 ) ) ( not ( = ?auto_25076 ?auto_25124 ) ) ( not ( = ?auto_25077 ?auto_25082 ) ) ( not ( = ?auto_25077 ?auto_25124 ) ) ( not ( = ?auto_25078 ?auto_25082 ) ) ( not ( = ?auto_25078 ?auto_25124 ) ) ( not ( = ?auto_25079 ?auto_25082 ) ) ( not ( = ?auto_25079 ?auto_25124 ) ) ( not ( = ?auto_25080 ?auto_25082 ) ) ( not ( = ?auto_25080 ?auto_25124 ) ) ( not ( = ?auto_25082 ?auto_25096 ) ) ( not ( = ?auto_25082 ?auto_25116 ) ) ( not ( = ?auto_25082 ?auto_25104 ) ) ( not ( = ?auto_25082 ?auto_25121 ) ) ( not ( = ?auto_25082 ?auto_25106 ) ) ( not ( = ?auto_25082 ?auto_25092 ) ) ( not ( = ?auto_25082 ?auto_25093 ) ) ( not ( = ?auto_25082 ?auto_25122 ) ) ( not ( = ?auto_25082 ?auto_25099 ) ) ( not ( = ?auto_25082 ?auto_25107 ) ) ( not ( = ?auto_25119 ?auto_25112 ) ) ( not ( = ?auto_25119 ?auto_25098 ) ) ( not ( = ?auto_25119 ?auto_25114 ) ) ( not ( = ?auto_25119 ?auto_25095 ) ) ( not ( = ?auto_25119 ?auto_25111 ) ) ( not ( = ?auto_25119 ?auto_25117 ) ) ( not ( = ?auto_25119 ?auto_25113 ) ) ( not ( = ?auto_25119 ?auto_25094 ) ) ( not ( = ?auto_25109 ?auto_25103 ) ) ( not ( = ?auto_25109 ?auto_25123 ) ) ( not ( = ?auto_25109 ?auto_25100 ) ) ( not ( = ?auto_25109 ?auto_25102 ) ) ( not ( = ?auto_25109 ?auto_25101 ) ) ( not ( = ?auto_25109 ?auto_25115 ) ) ( not ( = ?auto_25109 ?auto_25105 ) ) ( not ( = ?auto_25109 ?auto_25108 ) ) ( not ( = ?auto_25124 ?auto_25096 ) ) ( not ( = ?auto_25124 ?auto_25116 ) ) ( not ( = ?auto_25124 ?auto_25104 ) ) ( not ( = ?auto_25124 ?auto_25121 ) ) ( not ( = ?auto_25124 ?auto_25106 ) ) ( not ( = ?auto_25124 ?auto_25092 ) ) ( not ( = ?auto_25124 ?auto_25093 ) ) ( not ( = ?auto_25124 ?auto_25122 ) ) ( not ( = ?auto_25124 ?auto_25099 ) ) ( not ( = ?auto_25124 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25083 ) ) ( not ( = ?auto_25071 ?auto_25097 ) ) ( not ( = ?auto_25072 ?auto_25083 ) ) ( not ( = ?auto_25072 ?auto_25097 ) ) ( not ( = ?auto_25073 ?auto_25083 ) ) ( not ( = ?auto_25073 ?auto_25097 ) ) ( not ( = ?auto_25074 ?auto_25083 ) ) ( not ( = ?auto_25074 ?auto_25097 ) ) ( not ( = ?auto_25075 ?auto_25083 ) ) ( not ( = ?auto_25075 ?auto_25097 ) ) ( not ( = ?auto_25076 ?auto_25083 ) ) ( not ( = ?auto_25076 ?auto_25097 ) ) ( not ( = ?auto_25077 ?auto_25083 ) ) ( not ( = ?auto_25077 ?auto_25097 ) ) ( not ( = ?auto_25078 ?auto_25083 ) ) ( not ( = ?auto_25078 ?auto_25097 ) ) ( not ( = ?auto_25079 ?auto_25083 ) ) ( not ( = ?auto_25079 ?auto_25097 ) ) ( not ( = ?auto_25080 ?auto_25083 ) ) ( not ( = ?auto_25080 ?auto_25097 ) ) ( not ( = ?auto_25081 ?auto_25083 ) ) ( not ( = ?auto_25081 ?auto_25097 ) ) ( not ( = ?auto_25083 ?auto_25124 ) ) ( not ( = ?auto_25083 ?auto_25096 ) ) ( not ( = ?auto_25083 ?auto_25116 ) ) ( not ( = ?auto_25083 ?auto_25104 ) ) ( not ( = ?auto_25083 ?auto_25121 ) ) ( not ( = ?auto_25083 ?auto_25106 ) ) ( not ( = ?auto_25083 ?auto_25092 ) ) ( not ( = ?auto_25083 ?auto_25093 ) ) ( not ( = ?auto_25083 ?auto_25122 ) ) ( not ( = ?auto_25083 ?auto_25099 ) ) ( not ( = ?auto_25083 ?auto_25107 ) ) ( not ( = ?auto_25097 ?auto_25124 ) ) ( not ( = ?auto_25097 ?auto_25096 ) ) ( not ( = ?auto_25097 ?auto_25116 ) ) ( not ( = ?auto_25097 ?auto_25104 ) ) ( not ( = ?auto_25097 ?auto_25121 ) ) ( not ( = ?auto_25097 ?auto_25106 ) ) ( not ( = ?auto_25097 ?auto_25092 ) ) ( not ( = ?auto_25097 ?auto_25093 ) ) ( not ( = ?auto_25097 ?auto_25122 ) ) ( not ( = ?auto_25097 ?auto_25099 ) ) ( not ( = ?auto_25097 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25084 ) ) ( not ( = ?auto_25071 ?auto_25120 ) ) ( not ( = ?auto_25072 ?auto_25084 ) ) ( not ( = ?auto_25072 ?auto_25120 ) ) ( not ( = ?auto_25073 ?auto_25084 ) ) ( not ( = ?auto_25073 ?auto_25120 ) ) ( not ( = ?auto_25074 ?auto_25084 ) ) ( not ( = ?auto_25074 ?auto_25120 ) ) ( not ( = ?auto_25075 ?auto_25084 ) ) ( not ( = ?auto_25075 ?auto_25120 ) ) ( not ( = ?auto_25076 ?auto_25084 ) ) ( not ( = ?auto_25076 ?auto_25120 ) ) ( not ( = ?auto_25077 ?auto_25084 ) ) ( not ( = ?auto_25077 ?auto_25120 ) ) ( not ( = ?auto_25078 ?auto_25084 ) ) ( not ( = ?auto_25078 ?auto_25120 ) ) ( not ( = ?auto_25079 ?auto_25084 ) ) ( not ( = ?auto_25079 ?auto_25120 ) ) ( not ( = ?auto_25080 ?auto_25084 ) ) ( not ( = ?auto_25080 ?auto_25120 ) ) ( not ( = ?auto_25081 ?auto_25084 ) ) ( not ( = ?auto_25081 ?auto_25120 ) ) ( not ( = ?auto_25082 ?auto_25084 ) ) ( not ( = ?auto_25082 ?auto_25120 ) ) ( not ( = ?auto_25084 ?auto_25097 ) ) ( not ( = ?auto_25084 ?auto_25124 ) ) ( not ( = ?auto_25084 ?auto_25096 ) ) ( not ( = ?auto_25084 ?auto_25116 ) ) ( not ( = ?auto_25084 ?auto_25104 ) ) ( not ( = ?auto_25084 ?auto_25121 ) ) ( not ( = ?auto_25084 ?auto_25106 ) ) ( not ( = ?auto_25084 ?auto_25092 ) ) ( not ( = ?auto_25084 ?auto_25093 ) ) ( not ( = ?auto_25084 ?auto_25122 ) ) ( not ( = ?auto_25084 ?auto_25099 ) ) ( not ( = ?auto_25084 ?auto_25107 ) ) ( not ( = ?auto_25110 ?auto_25095 ) ) ( not ( = ?auto_25110 ?auto_25119 ) ) ( not ( = ?auto_25110 ?auto_25112 ) ) ( not ( = ?auto_25110 ?auto_25098 ) ) ( not ( = ?auto_25110 ?auto_25114 ) ) ( not ( = ?auto_25110 ?auto_25111 ) ) ( not ( = ?auto_25110 ?auto_25117 ) ) ( not ( = ?auto_25110 ?auto_25113 ) ) ( not ( = ?auto_25110 ?auto_25094 ) ) ( not ( = ?auto_25118 ?auto_25102 ) ) ( not ( = ?auto_25118 ?auto_25109 ) ) ( not ( = ?auto_25118 ?auto_25103 ) ) ( not ( = ?auto_25118 ?auto_25123 ) ) ( not ( = ?auto_25118 ?auto_25100 ) ) ( not ( = ?auto_25118 ?auto_25101 ) ) ( not ( = ?auto_25118 ?auto_25115 ) ) ( not ( = ?auto_25118 ?auto_25105 ) ) ( not ( = ?auto_25118 ?auto_25108 ) ) ( not ( = ?auto_25120 ?auto_25097 ) ) ( not ( = ?auto_25120 ?auto_25124 ) ) ( not ( = ?auto_25120 ?auto_25096 ) ) ( not ( = ?auto_25120 ?auto_25116 ) ) ( not ( = ?auto_25120 ?auto_25104 ) ) ( not ( = ?auto_25120 ?auto_25121 ) ) ( not ( = ?auto_25120 ?auto_25106 ) ) ( not ( = ?auto_25120 ?auto_25092 ) ) ( not ( = ?auto_25120 ?auto_25093 ) ) ( not ( = ?auto_25120 ?auto_25122 ) ) ( not ( = ?auto_25120 ?auto_25099 ) ) ( not ( = ?auto_25120 ?auto_25107 ) ) ( not ( = ?auto_25071 ?auto_25085 ) ) ( not ( = ?auto_25071 ?auto_25086 ) ) ( not ( = ?auto_25072 ?auto_25085 ) ) ( not ( = ?auto_25072 ?auto_25086 ) ) ( not ( = ?auto_25073 ?auto_25085 ) ) ( not ( = ?auto_25073 ?auto_25086 ) ) ( not ( = ?auto_25074 ?auto_25085 ) ) ( not ( = ?auto_25074 ?auto_25086 ) ) ( not ( = ?auto_25075 ?auto_25085 ) ) ( not ( = ?auto_25075 ?auto_25086 ) ) ( not ( = ?auto_25076 ?auto_25085 ) ) ( not ( = ?auto_25076 ?auto_25086 ) ) ( not ( = ?auto_25077 ?auto_25085 ) ) ( not ( = ?auto_25077 ?auto_25086 ) ) ( not ( = ?auto_25078 ?auto_25085 ) ) ( not ( = ?auto_25078 ?auto_25086 ) ) ( not ( = ?auto_25079 ?auto_25085 ) ) ( not ( = ?auto_25079 ?auto_25086 ) ) ( not ( = ?auto_25080 ?auto_25085 ) ) ( not ( = ?auto_25080 ?auto_25086 ) ) ( not ( = ?auto_25081 ?auto_25085 ) ) ( not ( = ?auto_25081 ?auto_25086 ) ) ( not ( = ?auto_25082 ?auto_25085 ) ) ( not ( = ?auto_25082 ?auto_25086 ) ) ( not ( = ?auto_25083 ?auto_25085 ) ) ( not ( = ?auto_25083 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25120 ) ) ( not ( = ?auto_25085 ?auto_25097 ) ) ( not ( = ?auto_25085 ?auto_25124 ) ) ( not ( = ?auto_25085 ?auto_25096 ) ) ( not ( = ?auto_25085 ?auto_25116 ) ) ( not ( = ?auto_25085 ?auto_25104 ) ) ( not ( = ?auto_25085 ?auto_25121 ) ) ( not ( = ?auto_25085 ?auto_25106 ) ) ( not ( = ?auto_25085 ?auto_25092 ) ) ( not ( = ?auto_25085 ?auto_25093 ) ) ( not ( = ?auto_25085 ?auto_25122 ) ) ( not ( = ?auto_25085 ?auto_25099 ) ) ( not ( = ?auto_25085 ?auto_25107 ) ) ( not ( = ?auto_25089 ?auto_25110 ) ) ( not ( = ?auto_25089 ?auto_25095 ) ) ( not ( = ?auto_25089 ?auto_25119 ) ) ( not ( = ?auto_25089 ?auto_25112 ) ) ( not ( = ?auto_25089 ?auto_25098 ) ) ( not ( = ?auto_25089 ?auto_25114 ) ) ( not ( = ?auto_25089 ?auto_25111 ) ) ( not ( = ?auto_25089 ?auto_25117 ) ) ( not ( = ?auto_25089 ?auto_25113 ) ) ( not ( = ?auto_25089 ?auto_25094 ) ) ( not ( = ?auto_25091 ?auto_25118 ) ) ( not ( = ?auto_25091 ?auto_25102 ) ) ( not ( = ?auto_25091 ?auto_25109 ) ) ( not ( = ?auto_25091 ?auto_25103 ) ) ( not ( = ?auto_25091 ?auto_25123 ) ) ( not ( = ?auto_25091 ?auto_25100 ) ) ( not ( = ?auto_25091 ?auto_25101 ) ) ( not ( = ?auto_25091 ?auto_25115 ) ) ( not ( = ?auto_25091 ?auto_25105 ) ) ( not ( = ?auto_25091 ?auto_25108 ) ) ( not ( = ?auto_25086 ?auto_25120 ) ) ( not ( = ?auto_25086 ?auto_25097 ) ) ( not ( = ?auto_25086 ?auto_25124 ) ) ( not ( = ?auto_25086 ?auto_25096 ) ) ( not ( = ?auto_25086 ?auto_25116 ) ) ( not ( = ?auto_25086 ?auto_25104 ) ) ( not ( = ?auto_25086 ?auto_25121 ) ) ( not ( = ?auto_25086 ?auto_25106 ) ) ( not ( = ?auto_25086 ?auto_25092 ) ) ( not ( = ?auto_25086 ?auto_25093 ) ) ( not ( = ?auto_25086 ?auto_25122 ) ) ( not ( = ?auto_25086 ?auto_25099 ) ) ( not ( = ?auto_25086 ?auto_25107 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25071 ?auto_25072 ?auto_25073 ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ?auto_25078 ?auto_25079 ?auto_25080 ?auto_25081 ?auto_25082 ?auto_25083 ?auto_25084 )
      ( MAKE-1CRATE ?auto_25084 ?auto_25085 )
      ( MAKE-14CRATE-VERIFY ?auto_25071 ?auto_25072 ?auto_25073 ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ?auto_25078 ?auto_25079 ?auto_25080 ?auto_25081 ?auto_25082 ?auto_25083 ?auto_25084 ?auto_25085 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_25151 - SURFACE
      ?auto_25152 - SURFACE
      ?auto_25153 - SURFACE
      ?auto_25154 - SURFACE
      ?auto_25155 - SURFACE
      ?auto_25156 - SURFACE
      ?auto_25157 - SURFACE
      ?auto_25158 - SURFACE
      ?auto_25159 - SURFACE
      ?auto_25160 - SURFACE
      ?auto_25161 - SURFACE
      ?auto_25162 - SURFACE
      ?auto_25163 - SURFACE
      ?auto_25164 - SURFACE
      ?auto_25166 - SURFACE
      ?auto_25165 - SURFACE
    )
    :vars
    (
      ?auto_25171 - HOIST
      ?auto_25167 - PLACE
      ?auto_25169 - PLACE
      ?auto_25168 - HOIST
      ?auto_25170 - SURFACE
      ?auto_25188 - PLACE
      ?auto_25180 - HOIST
      ?auto_25195 - SURFACE
      ?auto_25173 - PLACE
      ?auto_25201 - HOIST
      ?auto_25196 - SURFACE
      ?auto_25182 - PLACE
      ?auto_25207 - HOIST
      ?auto_25190 - SURFACE
      ?auto_25186 - PLACE
      ?auto_25187 - HOIST
      ?auto_25193 - SURFACE
      ?auto_25192 - PLACE
      ?auto_25199 - HOIST
      ?auto_25197 - SURFACE
      ?auto_25176 - PLACE
      ?auto_25177 - HOIST
      ?auto_25191 - SURFACE
      ?auto_25194 - PLACE
      ?auto_25202 - HOIST
      ?auto_25208 - SURFACE
      ?auto_25206 - SURFACE
      ?auto_25179 - PLACE
      ?auto_25203 - HOIST
      ?auto_25183 - SURFACE
      ?auto_25174 - SURFACE
      ?auto_25181 - PLACE
      ?auto_25204 - HOIST
      ?auto_25198 - SURFACE
      ?auto_25184 - PLACE
      ?auto_25189 - HOIST
      ?auto_25205 - SURFACE
      ?auto_25178 - SURFACE
      ?auto_25175 - PLACE
      ?auto_25185 - HOIST
      ?auto_25200 - SURFACE
      ?auto_25172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25171 ?auto_25167 ) ( IS-CRATE ?auto_25165 ) ( not ( = ?auto_25169 ?auto_25167 ) ) ( HOIST-AT ?auto_25168 ?auto_25169 ) ( AVAILABLE ?auto_25168 ) ( SURFACE-AT ?auto_25165 ?auto_25169 ) ( ON ?auto_25165 ?auto_25170 ) ( CLEAR ?auto_25165 ) ( not ( = ?auto_25166 ?auto_25165 ) ) ( not ( = ?auto_25166 ?auto_25170 ) ) ( not ( = ?auto_25165 ?auto_25170 ) ) ( not ( = ?auto_25171 ?auto_25168 ) ) ( IS-CRATE ?auto_25166 ) ( not ( = ?auto_25188 ?auto_25167 ) ) ( HOIST-AT ?auto_25180 ?auto_25188 ) ( AVAILABLE ?auto_25180 ) ( SURFACE-AT ?auto_25166 ?auto_25188 ) ( ON ?auto_25166 ?auto_25195 ) ( CLEAR ?auto_25166 ) ( not ( = ?auto_25164 ?auto_25166 ) ) ( not ( = ?auto_25164 ?auto_25195 ) ) ( not ( = ?auto_25166 ?auto_25195 ) ) ( not ( = ?auto_25171 ?auto_25180 ) ) ( IS-CRATE ?auto_25164 ) ( not ( = ?auto_25173 ?auto_25167 ) ) ( HOIST-AT ?auto_25201 ?auto_25173 ) ( AVAILABLE ?auto_25201 ) ( SURFACE-AT ?auto_25164 ?auto_25173 ) ( ON ?auto_25164 ?auto_25196 ) ( CLEAR ?auto_25164 ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( not ( = ?auto_25163 ?auto_25196 ) ) ( not ( = ?auto_25164 ?auto_25196 ) ) ( not ( = ?auto_25171 ?auto_25201 ) ) ( IS-CRATE ?auto_25163 ) ( not ( = ?auto_25182 ?auto_25167 ) ) ( HOIST-AT ?auto_25207 ?auto_25182 ) ( SURFACE-AT ?auto_25163 ?auto_25182 ) ( ON ?auto_25163 ?auto_25190 ) ( CLEAR ?auto_25163 ) ( not ( = ?auto_25162 ?auto_25163 ) ) ( not ( = ?auto_25162 ?auto_25190 ) ) ( not ( = ?auto_25163 ?auto_25190 ) ) ( not ( = ?auto_25171 ?auto_25207 ) ) ( IS-CRATE ?auto_25162 ) ( not ( = ?auto_25186 ?auto_25167 ) ) ( HOIST-AT ?auto_25187 ?auto_25186 ) ( AVAILABLE ?auto_25187 ) ( SURFACE-AT ?auto_25162 ?auto_25186 ) ( ON ?auto_25162 ?auto_25193 ) ( CLEAR ?auto_25162 ) ( not ( = ?auto_25161 ?auto_25162 ) ) ( not ( = ?auto_25161 ?auto_25193 ) ) ( not ( = ?auto_25162 ?auto_25193 ) ) ( not ( = ?auto_25171 ?auto_25187 ) ) ( IS-CRATE ?auto_25161 ) ( not ( = ?auto_25192 ?auto_25167 ) ) ( HOIST-AT ?auto_25199 ?auto_25192 ) ( SURFACE-AT ?auto_25161 ?auto_25192 ) ( ON ?auto_25161 ?auto_25197 ) ( CLEAR ?auto_25161 ) ( not ( = ?auto_25160 ?auto_25161 ) ) ( not ( = ?auto_25160 ?auto_25197 ) ) ( not ( = ?auto_25161 ?auto_25197 ) ) ( not ( = ?auto_25171 ?auto_25199 ) ) ( IS-CRATE ?auto_25160 ) ( not ( = ?auto_25176 ?auto_25167 ) ) ( HOIST-AT ?auto_25177 ?auto_25176 ) ( AVAILABLE ?auto_25177 ) ( SURFACE-AT ?auto_25160 ?auto_25176 ) ( ON ?auto_25160 ?auto_25191 ) ( CLEAR ?auto_25160 ) ( not ( = ?auto_25159 ?auto_25160 ) ) ( not ( = ?auto_25159 ?auto_25191 ) ) ( not ( = ?auto_25160 ?auto_25191 ) ) ( not ( = ?auto_25171 ?auto_25177 ) ) ( IS-CRATE ?auto_25159 ) ( not ( = ?auto_25194 ?auto_25167 ) ) ( HOIST-AT ?auto_25202 ?auto_25194 ) ( AVAILABLE ?auto_25202 ) ( SURFACE-AT ?auto_25159 ?auto_25194 ) ( ON ?auto_25159 ?auto_25208 ) ( CLEAR ?auto_25159 ) ( not ( = ?auto_25158 ?auto_25159 ) ) ( not ( = ?auto_25158 ?auto_25208 ) ) ( not ( = ?auto_25159 ?auto_25208 ) ) ( not ( = ?auto_25171 ?auto_25202 ) ) ( IS-CRATE ?auto_25158 ) ( AVAILABLE ?auto_25207 ) ( SURFACE-AT ?auto_25158 ?auto_25182 ) ( ON ?auto_25158 ?auto_25206 ) ( CLEAR ?auto_25158 ) ( not ( = ?auto_25157 ?auto_25158 ) ) ( not ( = ?auto_25157 ?auto_25206 ) ) ( not ( = ?auto_25158 ?auto_25206 ) ) ( IS-CRATE ?auto_25157 ) ( not ( = ?auto_25179 ?auto_25167 ) ) ( HOIST-AT ?auto_25203 ?auto_25179 ) ( AVAILABLE ?auto_25203 ) ( SURFACE-AT ?auto_25157 ?auto_25179 ) ( ON ?auto_25157 ?auto_25183 ) ( CLEAR ?auto_25157 ) ( not ( = ?auto_25156 ?auto_25157 ) ) ( not ( = ?auto_25156 ?auto_25183 ) ) ( not ( = ?auto_25157 ?auto_25183 ) ) ( not ( = ?auto_25171 ?auto_25203 ) ) ( IS-CRATE ?auto_25156 ) ( SURFACE-AT ?auto_25156 ?auto_25192 ) ( ON ?auto_25156 ?auto_25174 ) ( CLEAR ?auto_25156 ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( not ( = ?auto_25155 ?auto_25174 ) ) ( not ( = ?auto_25156 ?auto_25174 ) ) ( IS-CRATE ?auto_25155 ) ( not ( = ?auto_25181 ?auto_25167 ) ) ( HOIST-AT ?auto_25204 ?auto_25181 ) ( AVAILABLE ?auto_25204 ) ( SURFACE-AT ?auto_25155 ?auto_25181 ) ( ON ?auto_25155 ?auto_25198 ) ( CLEAR ?auto_25155 ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25154 ?auto_25198 ) ) ( not ( = ?auto_25155 ?auto_25198 ) ) ( not ( = ?auto_25171 ?auto_25204 ) ) ( IS-CRATE ?auto_25154 ) ( not ( = ?auto_25184 ?auto_25167 ) ) ( HOIST-AT ?auto_25189 ?auto_25184 ) ( AVAILABLE ?auto_25189 ) ( SURFACE-AT ?auto_25154 ?auto_25184 ) ( ON ?auto_25154 ?auto_25205 ) ( CLEAR ?auto_25154 ) ( not ( = ?auto_25153 ?auto_25154 ) ) ( not ( = ?auto_25153 ?auto_25205 ) ) ( not ( = ?auto_25154 ?auto_25205 ) ) ( not ( = ?auto_25171 ?auto_25189 ) ) ( IS-CRATE ?auto_25153 ) ( AVAILABLE ?auto_25199 ) ( SURFACE-AT ?auto_25153 ?auto_25192 ) ( ON ?auto_25153 ?auto_25178 ) ( CLEAR ?auto_25153 ) ( not ( = ?auto_25152 ?auto_25153 ) ) ( not ( = ?auto_25152 ?auto_25178 ) ) ( not ( = ?auto_25153 ?auto_25178 ) ) ( SURFACE-AT ?auto_25151 ?auto_25167 ) ( CLEAR ?auto_25151 ) ( IS-CRATE ?auto_25152 ) ( AVAILABLE ?auto_25171 ) ( not ( = ?auto_25175 ?auto_25167 ) ) ( HOIST-AT ?auto_25185 ?auto_25175 ) ( AVAILABLE ?auto_25185 ) ( SURFACE-AT ?auto_25152 ?auto_25175 ) ( ON ?auto_25152 ?auto_25200 ) ( CLEAR ?auto_25152 ) ( TRUCK-AT ?auto_25172 ?auto_25167 ) ( not ( = ?auto_25151 ?auto_25152 ) ) ( not ( = ?auto_25151 ?auto_25200 ) ) ( not ( = ?auto_25152 ?auto_25200 ) ) ( not ( = ?auto_25171 ?auto_25185 ) ) ( not ( = ?auto_25151 ?auto_25153 ) ) ( not ( = ?auto_25151 ?auto_25178 ) ) ( not ( = ?auto_25153 ?auto_25200 ) ) ( not ( = ?auto_25192 ?auto_25175 ) ) ( not ( = ?auto_25199 ?auto_25185 ) ) ( not ( = ?auto_25178 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25154 ) ) ( not ( = ?auto_25151 ?auto_25205 ) ) ( not ( = ?auto_25152 ?auto_25154 ) ) ( not ( = ?auto_25152 ?auto_25205 ) ) ( not ( = ?auto_25154 ?auto_25178 ) ) ( not ( = ?auto_25154 ?auto_25200 ) ) ( not ( = ?auto_25184 ?auto_25192 ) ) ( not ( = ?auto_25184 ?auto_25175 ) ) ( not ( = ?auto_25189 ?auto_25199 ) ) ( not ( = ?auto_25189 ?auto_25185 ) ) ( not ( = ?auto_25205 ?auto_25178 ) ) ( not ( = ?auto_25205 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25155 ) ) ( not ( = ?auto_25151 ?auto_25198 ) ) ( not ( = ?auto_25152 ?auto_25155 ) ) ( not ( = ?auto_25152 ?auto_25198 ) ) ( not ( = ?auto_25153 ?auto_25155 ) ) ( not ( = ?auto_25153 ?auto_25198 ) ) ( not ( = ?auto_25155 ?auto_25205 ) ) ( not ( = ?auto_25155 ?auto_25178 ) ) ( not ( = ?auto_25155 ?auto_25200 ) ) ( not ( = ?auto_25181 ?auto_25184 ) ) ( not ( = ?auto_25181 ?auto_25192 ) ) ( not ( = ?auto_25181 ?auto_25175 ) ) ( not ( = ?auto_25204 ?auto_25189 ) ) ( not ( = ?auto_25204 ?auto_25199 ) ) ( not ( = ?auto_25204 ?auto_25185 ) ) ( not ( = ?auto_25198 ?auto_25205 ) ) ( not ( = ?auto_25198 ?auto_25178 ) ) ( not ( = ?auto_25198 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25156 ) ) ( not ( = ?auto_25151 ?auto_25174 ) ) ( not ( = ?auto_25152 ?auto_25156 ) ) ( not ( = ?auto_25152 ?auto_25174 ) ) ( not ( = ?auto_25153 ?auto_25156 ) ) ( not ( = ?auto_25153 ?auto_25174 ) ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( not ( = ?auto_25154 ?auto_25174 ) ) ( not ( = ?auto_25156 ?auto_25198 ) ) ( not ( = ?auto_25156 ?auto_25205 ) ) ( not ( = ?auto_25156 ?auto_25178 ) ) ( not ( = ?auto_25156 ?auto_25200 ) ) ( not ( = ?auto_25174 ?auto_25198 ) ) ( not ( = ?auto_25174 ?auto_25205 ) ) ( not ( = ?auto_25174 ?auto_25178 ) ) ( not ( = ?auto_25174 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25157 ) ) ( not ( = ?auto_25151 ?auto_25183 ) ) ( not ( = ?auto_25152 ?auto_25157 ) ) ( not ( = ?auto_25152 ?auto_25183 ) ) ( not ( = ?auto_25153 ?auto_25157 ) ) ( not ( = ?auto_25153 ?auto_25183 ) ) ( not ( = ?auto_25154 ?auto_25157 ) ) ( not ( = ?auto_25154 ?auto_25183 ) ) ( not ( = ?auto_25155 ?auto_25157 ) ) ( not ( = ?auto_25155 ?auto_25183 ) ) ( not ( = ?auto_25157 ?auto_25174 ) ) ( not ( = ?auto_25157 ?auto_25198 ) ) ( not ( = ?auto_25157 ?auto_25205 ) ) ( not ( = ?auto_25157 ?auto_25178 ) ) ( not ( = ?auto_25157 ?auto_25200 ) ) ( not ( = ?auto_25179 ?auto_25192 ) ) ( not ( = ?auto_25179 ?auto_25181 ) ) ( not ( = ?auto_25179 ?auto_25184 ) ) ( not ( = ?auto_25179 ?auto_25175 ) ) ( not ( = ?auto_25203 ?auto_25199 ) ) ( not ( = ?auto_25203 ?auto_25204 ) ) ( not ( = ?auto_25203 ?auto_25189 ) ) ( not ( = ?auto_25203 ?auto_25185 ) ) ( not ( = ?auto_25183 ?auto_25174 ) ) ( not ( = ?auto_25183 ?auto_25198 ) ) ( not ( = ?auto_25183 ?auto_25205 ) ) ( not ( = ?auto_25183 ?auto_25178 ) ) ( not ( = ?auto_25183 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25158 ) ) ( not ( = ?auto_25151 ?auto_25206 ) ) ( not ( = ?auto_25152 ?auto_25158 ) ) ( not ( = ?auto_25152 ?auto_25206 ) ) ( not ( = ?auto_25153 ?auto_25158 ) ) ( not ( = ?auto_25153 ?auto_25206 ) ) ( not ( = ?auto_25154 ?auto_25158 ) ) ( not ( = ?auto_25154 ?auto_25206 ) ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( not ( = ?auto_25155 ?auto_25206 ) ) ( not ( = ?auto_25156 ?auto_25158 ) ) ( not ( = ?auto_25156 ?auto_25206 ) ) ( not ( = ?auto_25158 ?auto_25183 ) ) ( not ( = ?auto_25158 ?auto_25174 ) ) ( not ( = ?auto_25158 ?auto_25198 ) ) ( not ( = ?auto_25158 ?auto_25205 ) ) ( not ( = ?auto_25158 ?auto_25178 ) ) ( not ( = ?auto_25158 ?auto_25200 ) ) ( not ( = ?auto_25182 ?auto_25179 ) ) ( not ( = ?auto_25182 ?auto_25192 ) ) ( not ( = ?auto_25182 ?auto_25181 ) ) ( not ( = ?auto_25182 ?auto_25184 ) ) ( not ( = ?auto_25182 ?auto_25175 ) ) ( not ( = ?auto_25207 ?auto_25203 ) ) ( not ( = ?auto_25207 ?auto_25199 ) ) ( not ( = ?auto_25207 ?auto_25204 ) ) ( not ( = ?auto_25207 ?auto_25189 ) ) ( not ( = ?auto_25207 ?auto_25185 ) ) ( not ( = ?auto_25206 ?auto_25183 ) ) ( not ( = ?auto_25206 ?auto_25174 ) ) ( not ( = ?auto_25206 ?auto_25198 ) ) ( not ( = ?auto_25206 ?auto_25205 ) ) ( not ( = ?auto_25206 ?auto_25178 ) ) ( not ( = ?auto_25206 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25159 ) ) ( not ( = ?auto_25151 ?auto_25208 ) ) ( not ( = ?auto_25152 ?auto_25159 ) ) ( not ( = ?auto_25152 ?auto_25208 ) ) ( not ( = ?auto_25153 ?auto_25159 ) ) ( not ( = ?auto_25153 ?auto_25208 ) ) ( not ( = ?auto_25154 ?auto_25159 ) ) ( not ( = ?auto_25154 ?auto_25208 ) ) ( not ( = ?auto_25155 ?auto_25159 ) ) ( not ( = ?auto_25155 ?auto_25208 ) ) ( not ( = ?auto_25156 ?auto_25159 ) ) ( not ( = ?auto_25156 ?auto_25208 ) ) ( not ( = ?auto_25157 ?auto_25159 ) ) ( not ( = ?auto_25157 ?auto_25208 ) ) ( not ( = ?auto_25159 ?auto_25206 ) ) ( not ( = ?auto_25159 ?auto_25183 ) ) ( not ( = ?auto_25159 ?auto_25174 ) ) ( not ( = ?auto_25159 ?auto_25198 ) ) ( not ( = ?auto_25159 ?auto_25205 ) ) ( not ( = ?auto_25159 ?auto_25178 ) ) ( not ( = ?auto_25159 ?auto_25200 ) ) ( not ( = ?auto_25194 ?auto_25182 ) ) ( not ( = ?auto_25194 ?auto_25179 ) ) ( not ( = ?auto_25194 ?auto_25192 ) ) ( not ( = ?auto_25194 ?auto_25181 ) ) ( not ( = ?auto_25194 ?auto_25184 ) ) ( not ( = ?auto_25194 ?auto_25175 ) ) ( not ( = ?auto_25202 ?auto_25207 ) ) ( not ( = ?auto_25202 ?auto_25203 ) ) ( not ( = ?auto_25202 ?auto_25199 ) ) ( not ( = ?auto_25202 ?auto_25204 ) ) ( not ( = ?auto_25202 ?auto_25189 ) ) ( not ( = ?auto_25202 ?auto_25185 ) ) ( not ( = ?auto_25208 ?auto_25206 ) ) ( not ( = ?auto_25208 ?auto_25183 ) ) ( not ( = ?auto_25208 ?auto_25174 ) ) ( not ( = ?auto_25208 ?auto_25198 ) ) ( not ( = ?auto_25208 ?auto_25205 ) ) ( not ( = ?auto_25208 ?auto_25178 ) ) ( not ( = ?auto_25208 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25160 ) ) ( not ( = ?auto_25151 ?auto_25191 ) ) ( not ( = ?auto_25152 ?auto_25160 ) ) ( not ( = ?auto_25152 ?auto_25191 ) ) ( not ( = ?auto_25153 ?auto_25160 ) ) ( not ( = ?auto_25153 ?auto_25191 ) ) ( not ( = ?auto_25154 ?auto_25160 ) ) ( not ( = ?auto_25154 ?auto_25191 ) ) ( not ( = ?auto_25155 ?auto_25160 ) ) ( not ( = ?auto_25155 ?auto_25191 ) ) ( not ( = ?auto_25156 ?auto_25160 ) ) ( not ( = ?auto_25156 ?auto_25191 ) ) ( not ( = ?auto_25157 ?auto_25160 ) ) ( not ( = ?auto_25157 ?auto_25191 ) ) ( not ( = ?auto_25158 ?auto_25160 ) ) ( not ( = ?auto_25158 ?auto_25191 ) ) ( not ( = ?auto_25160 ?auto_25208 ) ) ( not ( = ?auto_25160 ?auto_25206 ) ) ( not ( = ?auto_25160 ?auto_25183 ) ) ( not ( = ?auto_25160 ?auto_25174 ) ) ( not ( = ?auto_25160 ?auto_25198 ) ) ( not ( = ?auto_25160 ?auto_25205 ) ) ( not ( = ?auto_25160 ?auto_25178 ) ) ( not ( = ?auto_25160 ?auto_25200 ) ) ( not ( = ?auto_25176 ?auto_25194 ) ) ( not ( = ?auto_25176 ?auto_25182 ) ) ( not ( = ?auto_25176 ?auto_25179 ) ) ( not ( = ?auto_25176 ?auto_25192 ) ) ( not ( = ?auto_25176 ?auto_25181 ) ) ( not ( = ?auto_25176 ?auto_25184 ) ) ( not ( = ?auto_25176 ?auto_25175 ) ) ( not ( = ?auto_25177 ?auto_25202 ) ) ( not ( = ?auto_25177 ?auto_25207 ) ) ( not ( = ?auto_25177 ?auto_25203 ) ) ( not ( = ?auto_25177 ?auto_25199 ) ) ( not ( = ?auto_25177 ?auto_25204 ) ) ( not ( = ?auto_25177 ?auto_25189 ) ) ( not ( = ?auto_25177 ?auto_25185 ) ) ( not ( = ?auto_25191 ?auto_25208 ) ) ( not ( = ?auto_25191 ?auto_25206 ) ) ( not ( = ?auto_25191 ?auto_25183 ) ) ( not ( = ?auto_25191 ?auto_25174 ) ) ( not ( = ?auto_25191 ?auto_25198 ) ) ( not ( = ?auto_25191 ?auto_25205 ) ) ( not ( = ?auto_25191 ?auto_25178 ) ) ( not ( = ?auto_25191 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25161 ) ) ( not ( = ?auto_25151 ?auto_25197 ) ) ( not ( = ?auto_25152 ?auto_25161 ) ) ( not ( = ?auto_25152 ?auto_25197 ) ) ( not ( = ?auto_25153 ?auto_25161 ) ) ( not ( = ?auto_25153 ?auto_25197 ) ) ( not ( = ?auto_25154 ?auto_25161 ) ) ( not ( = ?auto_25154 ?auto_25197 ) ) ( not ( = ?auto_25155 ?auto_25161 ) ) ( not ( = ?auto_25155 ?auto_25197 ) ) ( not ( = ?auto_25156 ?auto_25161 ) ) ( not ( = ?auto_25156 ?auto_25197 ) ) ( not ( = ?auto_25157 ?auto_25161 ) ) ( not ( = ?auto_25157 ?auto_25197 ) ) ( not ( = ?auto_25158 ?auto_25161 ) ) ( not ( = ?auto_25158 ?auto_25197 ) ) ( not ( = ?auto_25159 ?auto_25161 ) ) ( not ( = ?auto_25159 ?auto_25197 ) ) ( not ( = ?auto_25161 ?auto_25191 ) ) ( not ( = ?auto_25161 ?auto_25208 ) ) ( not ( = ?auto_25161 ?auto_25206 ) ) ( not ( = ?auto_25161 ?auto_25183 ) ) ( not ( = ?auto_25161 ?auto_25174 ) ) ( not ( = ?auto_25161 ?auto_25198 ) ) ( not ( = ?auto_25161 ?auto_25205 ) ) ( not ( = ?auto_25161 ?auto_25178 ) ) ( not ( = ?auto_25161 ?auto_25200 ) ) ( not ( = ?auto_25197 ?auto_25191 ) ) ( not ( = ?auto_25197 ?auto_25208 ) ) ( not ( = ?auto_25197 ?auto_25206 ) ) ( not ( = ?auto_25197 ?auto_25183 ) ) ( not ( = ?auto_25197 ?auto_25174 ) ) ( not ( = ?auto_25197 ?auto_25198 ) ) ( not ( = ?auto_25197 ?auto_25205 ) ) ( not ( = ?auto_25197 ?auto_25178 ) ) ( not ( = ?auto_25197 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25162 ) ) ( not ( = ?auto_25151 ?auto_25193 ) ) ( not ( = ?auto_25152 ?auto_25162 ) ) ( not ( = ?auto_25152 ?auto_25193 ) ) ( not ( = ?auto_25153 ?auto_25162 ) ) ( not ( = ?auto_25153 ?auto_25193 ) ) ( not ( = ?auto_25154 ?auto_25162 ) ) ( not ( = ?auto_25154 ?auto_25193 ) ) ( not ( = ?auto_25155 ?auto_25162 ) ) ( not ( = ?auto_25155 ?auto_25193 ) ) ( not ( = ?auto_25156 ?auto_25162 ) ) ( not ( = ?auto_25156 ?auto_25193 ) ) ( not ( = ?auto_25157 ?auto_25162 ) ) ( not ( = ?auto_25157 ?auto_25193 ) ) ( not ( = ?auto_25158 ?auto_25162 ) ) ( not ( = ?auto_25158 ?auto_25193 ) ) ( not ( = ?auto_25159 ?auto_25162 ) ) ( not ( = ?auto_25159 ?auto_25193 ) ) ( not ( = ?auto_25160 ?auto_25162 ) ) ( not ( = ?auto_25160 ?auto_25193 ) ) ( not ( = ?auto_25162 ?auto_25197 ) ) ( not ( = ?auto_25162 ?auto_25191 ) ) ( not ( = ?auto_25162 ?auto_25208 ) ) ( not ( = ?auto_25162 ?auto_25206 ) ) ( not ( = ?auto_25162 ?auto_25183 ) ) ( not ( = ?auto_25162 ?auto_25174 ) ) ( not ( = ?auto_25162 ?auto_25198 ) ) ( not ( = ?auto_25162 ?auto_25205 ) ) ( not ( = ?auto_25162 ?auto_25178 ) ) ( not ( = ?auto_25162 ?auto_25200 ) ) ( not ( = ?auto_25186 ?auto_25192 ) ) ( not ( = ?auto_25186 ?auto_25176 ) ) ( not ( = ?auto_25186 ?auto_25194 ) ) ( not ( = ?auto_25186 ?auto_25182 ) ) ( not ( = ?auto_25186 ?auto_25179 ) ) ( not ( = ?auto_25186 ?auto_25181 ) ) ( not ( = ?auto_25186 ?auto_25184 ) ) ( not ( = ?auto_25186 ?auto_25175 ) ) ( not ( = ?auto_25187 ?auto_25199 ) ) ( not ( = ?auto_25187 ?auto_25177 ) ) ( not ( = ?auto_25187 ?auto_25202 ) ) ( not ( = ?auto_25187 ?auto_25207 ) ) ( not ( = ?auto_25187 ?auto_25203 ) ) ( not ( = ?auto_25187 ?auto_25204 ) ) ( not ( = ?auto_25187 ?auto_25189 ) ) ( not ( = ?auto_25187 ?auto_25185 ) ) ( not ( = ?auto_25193 ?auto_25197 ) ) ( not ( = ?auto_25193 ?auto_25191 ) ) ( not ( = ?auto_25193 ?auto_25208 ) ) ( not ( = ?auto_25193 ?auto_25206 ) ) ( not ( = ?auto_25193 ?auto_25183 ) ) ( not ( = ?auto_25193 ?auto_25174 ) ) ( not ( = ?auto_25193 ?auto_25198 ) ) ( not ( = ?auto_25193 ?auto_25205 ) ) ( not ( = ?auto_25193 ?auto_25178 ) ) ( not ( = ?auto_25193 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25163 ) ) ( not ( = ?auto_25151 ?auto_25190 ) ) ( not ( = ?auto_25152 ?auto_25163 ) ) ( not ( = ?auto_25152 ?auto_25190 ) ) ( not ( = ?auto_25153 ?auto_25163 ) ) ( not ( = ?auto_25153 ?auto_25190 ) ) ( not ( = ?auto_25154 ?auto_25163 ) ) ( not ( = ?auto_25154 ?auto_25190 ) ) ( not ( = ?auto_25155 ?auto_25163 ) ) ( not ( = ?auto_25155 ?auto_25190 ) ) ( not ( = ?auto_25156 ?auto_25163 ) ) ( not ( = ?auto_25156 ?auto_25190 ) ) ( not ( = ?auto_25157 ?auto_25163 ) ) ( not ( = ?auto_25157 ?auto_25190 ) ) ( not ( = ?auto_25158 ?auto_25163 ) ) ( not ( = ?auto_25158 ?auto_25190 ) ) ( not ( = ?auto_25159 ?auto_25163 ) ) ( not ( = ?auto_25159 ?auto_25190 ) ) ( not ( = ?auto_25160 ?auto_25163 ) ) ( not ( = ?auto_25160 ?auto_25190 ) ) ( not ( = ?auto_25161 ?auto_25163 ) ) ( not ( = ?auto_25161 ?auto_25190 ) ) ( not ( = ?auto_25163 ?auto_25193 ) ) ( not ( = ?auto_25163 ?auto_25197 ) ) ( not ( = ?auto_25163 ?auto_25191 ) ) ( not ( = ?auto_25163 ?auto_25208 ) ) ( not ( = ?auto_25163 ?auto_25206 ) ) ( not ( = ?auto_25163 ?auto_25183 ) ) ( not ( = ?auto_25163 ?auto_25174 ) ) ( not ( = ?auto_25163 ?auto_25198 ) ) ( not ( = ?auto_25163 ?auto_25205 ) ) ( not ( = ?auto_25163 ?auto_25178 ) ) ( not ( = ?auto_25163 ?auto_25200 ) ) ( not ( = ?auto_25190 ?auto_25193 ) ) ( not ( = ?auto_25190 ?auto_25197 ) ) ( not ( = ?auto_25190 ?auto_25191 ) ) ( not ( = ?auto_25190 ?auto_25208 ) ) ( not ( = ?auto_25190 ?auto_25206 ) ) ( not ( = ?auto_25190 ?auto_25183 ) ) ( not ( = ?auto_25190 ?auto_25174 ) ) ( not ( = ?auto_25190 ?auto_25198 ) ) ( not ( = ?auto_25190 ?auto_25205 ) ) ( not ( = ?auto_25190 ?auto_25178 ) ) ( not ( = ?auto_25190 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25164 ) ) ( not ( = ?auto_25151 ?auto_25196 ) ) ( not ( = ?auto_25152 ?auto_25164 ) ) ( not ( = ?auto_25152 ?auto_25196 ) ) ( not ( = ?auto_25153 ?auto_25164 ) ) ( not ( = ?auto_25153 ?auto_25196 ) ) ( not ( = ?auto_25154 ?auto_25164 ) ) ( not ( = ?auto_25154 ?auto_25196 ) ) ( not ( = ?auto_25155 ?auto_25164 ) ) ( not ( = ?auto_25155 ?auto_25196 ) ) ( not ( = ?auto_25156 ?auto_25164 ) ) ( not ( = ?auto_25156 ?auto_25196 ) ) ( not ( = ?auto_25157 ?auto_25164 ) ) ( not ( = ?auto_25157 ?auto_25196 ) ) ( not ( = ?auto_25158 ?auto_25164 ) ) ( not ( = ?auto_25158 ?auto_25196 ) ) ( not ( = ?auto_25159 ?auto_25164 ) ) ( not ( = ?auto_25159 ?auto_25196 ) ) ( not ( = ?auto_25160 ?auto_25164 ) ) ( not ( = ?auto_25160 ?auto_25196 ) ) ( not ( = ?auto_25161 ?auto_25164 ) ) ( not ( = ?auto_25161 ?auto_25196 ) ) ( not ( = ?auto_25162 ?auto_25164 ) ) ( not ( = ?auto_25162 ?auto_25196 ) ) ( not ( = ?auto_25164 ?auto_25190 ) ) ( not ( = ?auto_25164 ?auto_25193 ) ) ( not ( = ?auto_25164 ?auto_25197 ) ) ( not ( = ?auto_25164 ?auto_25191 ) ) ( not ( = ?auto_25164 ?auto_25208 ) ) ( not ( = ?auto_25164 ?auto_25206 ) ) ( not ( = ?auto_25164 ?auto_25183 ) ) ( not ( = ?auto_25164 ?auto_25174 ) ) ( not ( = ?auto_25164 ?auto_25198 ) ) ( not ( = ?auto_25164 ?auto_25205 ) ) ( not ( = ?auto_25164 ?auto_25178 ) ) ( not ( = ?auto_25164 ?auto_25200 ) ) ( not ( = ?auto_25173 ?auto_25182 ) ) ( not ( = ?auto_25173 ?auto_25186 ) ) ( not ( = ?auto_25173 ?auto_25192 ) ) ( not ( = ?auto_25173 ?auto_25176 ) ) ( not ( = ?auto_25173 ?auto_25194 ) ) ( not ( = ?auto_25173 ?auto_25179 ) ) ( not ( = ?auto_25173 ?auto_25181 ) ) ( not ( = ?auto_25173 ?auto_25184 ) ) ( not ( = ?auto_25173 ?auto_25175 ) ) ( not ( = ?auto_25201 ?auto_25207 ) ) ( not ( = ?auto_25201 ?auto_25187 ) ) ( not ( = ?auto_25201 ?auto_25199 ) ) ( not ( = ?auto_25201 ?auto_25177 ) ) ( not ( = ?auto_25201 ?auto_25202 ) ) ( not ( = ?auto_25201 ?auto_25203 ) ) ( not ( = ?auto_25201 ?auto_25204 ) ) ( not ( = ?auto_25201 ?auto_25189 ) ) ( not ( = ?auto_25201 ?auto_25185 ) ) ( not ( = ?auto_25196 ?auto_25190 ) ) ( not ( = ?auto_25196 ?auto_25193 ) ) ( not ( = ?auto_25196 ?auto_25197 ) ) ( not ( = ?auto_25196 ?auto_25191 ) ) ( not ( = ?auto_25196 ?auto_25208 ) ) ( not ( = ?auto_25196 ?auto_25206 ) ) ( not ( = ?auto_25196 ?auto_25183 ) ) ( not ( = ?auto_25196 ?auto_25174 ) ) ( not ( = ?auto_25196 ?auto_25198 ) ) ( not ( = ?auto_25196 ?auto_25205 ) ) ( not ( = ?auto_25196 ?auto_25178 ) ) ( not ( = ?auto_25196 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25166 ) ) ( not ( = ?auto_25151 ?auto_25195 ) ) ( not ( = ?auto_25152 ?auto_25166 ) ) ( not ( = ?auto_25152 ?auto_25195 ) ) ( not ( = ?auto_25153 ?auto_25166 ) ) ( not ( = ?auto_25153 ?auto_25195 ) ) ( not ( = ?auto_25154 ?auto_25166 ) ) ( not ( = ?auto_25154 ?auto_25195 ) ) ( not ( = ?auto_25155 ?auto_25166 ) ) ( not ( = ?auto_25155 ?auto_25195 ) ) ( not ( = ?auto_25156 ?auto_25166 ) ) ( not ( = ?auto_25156 ?auto_25195 ) ) ( not ( = ?auto_25157 ?auto_25166 ) ) ( not ( = ?auto_25157 ?auto_25195 ) ) ( not ( = ?auto_25158 ?auto_25166 ) ) ( not ( = ?auto_25158 ?auto_25195 ) ) ( not ( = ?auto_25159 ?auto_25166 ) ) ( not ( = ?auto_25159 ?auto_25195 ) ) ( not ( = ?auto_25160 ?auto_25166 ) ) ( not ( = ?auto_25160 ?auto_25195 ) ) ( not ( = ?auto_25161 ?auto_25166 ) ) ( not ( = ?auto_25161 ?auto_25195 ) ) ( not ( = ?auto_25162 ?auto_25166 ) ) ( not ( = ?auto_25162 ?auto_25195 ) ) ( not ( = ?auto_25163 ?auto_25166 ) ) ( not ( = ?auto_25163 ?auto_25195 ) ) ( not ( = ?auto_25166 ?auto_25196 ) ) ( not ( = ?auto_25166 ?auto_25190 ) ) ( not ( = ?auto_25166 ?auto_25193 ) ) ( not ( = ?auto_25166 ?auto_25197 ) ) ( not ( = ?auto_25166 ?auto_25191 ) ) ( not ( = ?auto_25166 ?auto_25208 ) ) ( not ( = ?auto_25166 ?auto_25206 ) ) ( not ( = ?auto_25166 ?auto_25183 ) ) ( not ( = ?auto_25166 ?auto_25174 ) ) ( not ( = ?auto_25166 ?auto_25198 ) ) ( not ( = ?auto_25166 ?auto_25205 ) ) ( not ( = ?auto_25166 ?auto_25178 ) ) ( not ( = ?auto_25166 ?auto_25200 ) ) ( not ( = ?auto_25188 ?auto_25173 ) ) ( not ( = ?auto_25188 ?auto_25182 ) ) ( not ( = ?auto_25188 ?auto_25186 ) ) ( not ( = ?auto_25188 ?auto_25192 ) ) ( not ( = ?auto_25188 ?auto_25176 ) ) ( not ( = ?auto_25188 ?auto_25194 ) ) ( not ( = ?auto_25188 ?auto_25179 ) ) ( not ( = ?auto_25188 ?auto_25181 ) ) ( not ( = ?auto_25188 ?auto_25184 ) ) ( not ( = ?auto_25188 ?auto_25175 ) ) ( not ( = ?auto_25180 ?auto_25201 ) ) ( not ( = ?auto_25180 ?auto_25207 ) ) ( not ( = ?auto_25180 ?auto_25187 ) ) ( not ( = ?auto_25180 ?auto_25199 ) ) ( not ( = ?auto_25180 ?auto_25177 ) ) ( not ( = ?auto_25180 ?auto_25202 ) ) ( not ( = ?auto_25180 ?auto_25203 ) ) ( not ( = ?auto_25180 ?auto_25204 ) ) ( not ( = ?auto_25180 ?auto_25189 ) ) ( not ( = ?auto_25180 ?auto_25185 ) ) ( not ( = ?auto_25195 ?auto_25196 ) ) ( not ( = ?auto_25195 ?auto_25190 ) ) ( not ( = ?auto_25195 ?auto_25193 ) ) ( not ( = ?auto_25195 ?auto_25197 ) ) ( not ( = ?auto_25195 ?auto_25191 ) ) ( not ( = ?auto_25195 ?auto_25208 ) ) ( not ( = ?auto_25195 ?auto_25206 ) ) ( not ( = ?auto_25195 ?auto_25183 ) ) ( not ( = ?auto_25195 ?auto_25174 ) ) ( not ( = ?auto_25195 ?auto_25198 ) ) ( not ( = ?auto_25195 ?auto_25205 ) ) ( not ( = ?auto_25195 ?auto_25178 ) ) ( not ( = ?auto_25195 ?auto_25200 ) ) ( not ( = ?auto_25151 ?auto_25165 ) ) ( not ( = ?auto_25151 ?auto_25170 ) ) ( not ( = ?auto_25152 ?auto_25165 ) ) ( not ( = ?auto_25152 ?auto_25170 ) ) ( not ( = ?auto_25153 ?auto_25165 ) ) ( not ( = ?auto_25153 ?auto_25170 ) ) ( not ( = ?auto_25154 ?auto_25165 ) ) ( not ( = ?auto_25154 ?auto_25170 ) ) ( not ( = ?auto_25155 ?auto_25165 ) ) ( not ( = ?auto_25155 ?auto_25170 ) ) ( not ( = ?auto_25156 ?auto_25165 ) ) ( not ( = ?auto_25156 ?auto_25170 ) ) ( not ( = ?auto_25157 ?auto_25165 ) ) ( not ( = ?auto_25157 ?auto_25170 ) ) ( not ( = ?auto_25158 ?auto_25165 ) ) ( not ( = ?auto_25158 ?auto_25170 ) ) ( not ( = ?auto_25159 ?auto_25165 ) ) ( not ( = ?auto_25159 ?auto_25170 ) ) ( not ( = ?auto_25160 ?auto_25165 ) ) ( not ( = ?auto_25160 ?auto_25170 ) ) ( not ( = ?auto_25161 ?auto_25165 ) ) ( not ( = ?auto_25161 ?auto_25170 ) ) ( not ( = ?auto_25162 ?auto_25165 ) ) ( not ( = ?auto_25162 ?auto_25170 ) ) ( not ( = ?auto_25163 ?auto_25165 ) ) ( not ( = ?auto_25163 ?auto_25170 ) ) ( not ( = ?auto_25164 ?auto_25165 ) ) ( not ( = ?auto_25164 ?auto_25170 ) ) ( not ( = ?auto_25165 ?auto_25195 ) ) ( not ( = ?auto_25165 ?auto_25196 ) ) ( not ( = ?auto_25165 ?auto_25190 ) ) ( not ( = ?auto_25165 ?auto_25193 ) ) ( not ( = ?auto_25165 ?auto_25197 ) ) ( not ( = ?auto_25165 ?auto_25191 ) ) ( not ( = ?auto_25165 ?auto_25208 ) ) ( not ( = ?auto_25165 ?auto_25206 ) ) ( not ( = ?auto_25165 ?auto_25183 ) ) ( not ( = ?auto_25165 ?auto_25174 ) ) ( not ( = ?auto_25165 ?auto_25198 ) ) ( not ( = ?auto_25165 ?auto_25205 ) ) ( not ( = ?auto_25165 ?auto_25178 ) ) ( not ( = ?auto_25165 ?auto_25200 ) ) ( not ( = ?auto_25169 ?auto_25188 ) ) ( not ( = ?auto_25169 ?auto_25173 ) ) ( not ( = ?auto_25169 ?auto_25182 ) ) ( not ( = ?auto_25169 ?auto_25186 ) ) ( not ( = ?auto_25169 ?auto_25192 ) ) ( not ( = ?auto_25169 ?auto_25176 ) ) ( not ( = ?auto_25169 ?auto_25194 ) ) ( not ( = ?auto_25169 ?auto_25179 ) ) ( not ( = ?auto_25169 ?auto_25181 ) ) ( not ( = ?auto_25169 ?auto_25184 ) ) ( not ( = ?auto_25169 ?auto_25175 ) ) ( not ( = ?auto_25168 ?auto_25180 ) ) ( not ( = ?auto_25168 ?auto_25201 ) ) ( not ( = ?auto_25168 ?auto_25207 ) ) ( not ( = ?auto_25168 ?auto_25187 ) ) ( not ( = ?auto_25168 ?auto_25199 ) ) ( not ( = ?auto_25168 ?auto_25177 ) ) ( not ( = ?auto_25168 ?auto_25202 ) ) ( not ( = ?auto_25168 ?auto_25203 ) ) ( not ( = ?auto_25168 ?auto_25204 ) ) ( not ( = ?auto_25168 ?auto_25189 ) ) ( not ( = ?auto_25168 ?auto_25185 ) ) ( not ( = ?auto_25170 ?auto_25195 ) ) ( not ( = ?auto_25170 ?auto_25196 ) ) ( not ( = ?auto_25170 ?auto_25190 ) ) ( not ( = ?auto_25170 ?auto_25193 ) ) ( not ( = ?auto_25170 ?auto_25197 ) ) ( not ( = ?auto_25170 ?auto_25191 ) ) ( not ( = ?auto_25170 ?auto_25208 ) ) ( not ( = ?auto_25170 ?auto_25206 ) ) ( not ( = ?auto_25170 ?auto_25183 ) ) ( not ( = ?auto_25170 ?auto_25174 ) ) ( not ( = ?auto_25170 ?auto_25198 ) ) ( not ( = ?auto_25170 ?auto_25205 ) ) ( not ( = ?auto_25170 ?auto_25178 ) ) ( not ( = ?auto_25170 ?auto_25200 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_25151 ?auto_25152 ?auto_25153 ?auto_25154 ?auto_25155 ?auto_25156 ?auto_25157 ?auto_25158 ?auto_25159 ?auto_25160 ?auto_25161 ?auto_25162 ?auto_25163 ?auto_25164 ?auto_25166 )
      ( MAKE-1CRATE ?auto_25166 ?auto_25165 )
      ( MAKE-15CRATE-VERIFY ?auto_25151 ?auto_25152 ?auto_25153 ?auto_25154 ?auto_25155 ?auto_25156 ?auto_25157 ?auto_25158 ?auto_25159 ?auto_25160 ?auto_25161 ?auto_25162 ?auto_25163 ?auto_25164 ?auto_25166 ?auto_25165 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_25236 - SURFACE
      ?auto_25237 - SURFACE
      ?auto_25238 - SURFACE
      ?auto_25239 - SURFACE
      ?auto_25240 - SURFACE
      ?auto_25241 - SURFACE
      ?auto_25242 - SURFACE
      ?auto_25243 - SURFACE
      ?auto_25244 - SURFACE
      ?auto_25245 - SURFACE
      ?auto_25246 - SURFACE
      ?auto_25247 - SURFACE
      ?auto_25248 - SURFACE
      ?auto_25249 - SURFACE
      ?auto_25251 - SURFACE
      ?auto_25250 - SURFACE
      ?auto_25252 - SURFACE
    )
    :vars
    (
      ?auto_25253 - HOIST
      ?auto_25254 - PLACE
      ?auto_25255 - PLACE
      ?auto_25256 - HOIST
      ?auto_25258 - SURFACE
      ?auto_25277 - PLACE
      ?auto_25287 - HOIST
      ?auto_25283 - SURFACE
      ?auto_25289 - PLACE
      ?auto_25270 - HOIST
      ?auto_25284 - SURFACE
      ?auto_25272 - PLACE
      ?auto_25282 - HOIST
      ?auto_25263 - SURFACE
      ?auto_25285 - SURFACE
      ?auto_25264 - PLACE
      ?auto_25280 - HOIST
      ?auto_25293 - SURFACE
      ?auto_25291 - PLACE
      ?auto_25261 - HOIST
      ?auto_25279 - SURFACE
      ?auto_25262 - PLACE
      ?auto_25281 - HOIST
      ?auto_25273 - SURFACE
      ?auto_25275 - PLACE
      ?auto_25294 - HOIST
      ?auto_25286 - SURFACE
      ?auto_25278 - SURFACE
      ?auto_25266 - PLACE
      ?auto_25276 - HOIST
      ?auto_25292 - SURFACE
      ?auto_25269 - SURFACE
      ?auto_25268 - PLACE
      ?auto_25295 - HOIST
      ?auto_25271 - SURFACE
      ?auto_25259 - PLACE
      ?auto_25267 - HOIST
      ?auto_25260 - SURFACE
      ?auto_25290 - SURFACE
      ?auto_25288 - PLACE
      ?auto_25265 - HOIST
      ?auto_25274 - SURFACE
      ?auto_25257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25253 ?auto_25254 ) ( IS-CRATE ?auto_25252 ) ( not ( = ?auto_25255 ?auto_25254 ) ) ( HOIST-AT ?auto_25256 ?auto_25255 ) ( SURFACE-AT ?auto_25252 ?auto_25255 ) ( ON ?auto_25252 ?auto_25258 ) ( CLEAR ?auto_25252 ) ( not ( = ?auto_25250 ?auto_25252 ) ) ( not ( = ?auto_25250 ?auto_25258 ) ) ( not ( = ?auto_25252 ?auto_25258 ) ) ( not ( = ?auto_25253 ?auto_25256 ) ) ( IS-CRATE ?auto_25250 ) ( not ( = ?auto_25277 ?auto_25254 ) ) ( HOIST-AT ?auto_25287 ?auto_25277 ) ( AVAILABLE ?auto_25287 ) ( SURFACE-AT ?auto_25250 ?auto_25277 ) ( ON ?auto_25250 ?auto_25283 ) ( CLEAR ?auto_25250 ) ( not ( = ?auto_25251 ?auto_25250 ) ) ( not ( = ?auto_25251 ?auto_25283 ) ) ( not ( = ?auto_25250 ?auto_25283 ) ) ( not ( = ?auto_25253 ?auto_25287 ) ) ( IS-CRATE ?auto_25251 ) ( not ( = ?auto_25289 ?auto_25254 ) ) ( HOIST-AT ?auto_25270 ?auto_25289 ) ( AVAILABLE ?auto_25270 ) ( SURFACE-AT ?auto_25251 ?auto_25289 ) ( ON ?auto_25251 ?auto_25284 ) ( CLEAR ?auto_25251 ) ( not ( = ?auto_25249 ?auto_25251 ) ) ( not ( = ?auto_25249 ?auto_25284 ) ) ( not ( = ?auto_25251 ?auto_25284 ) ) ( not ( = ?auto_25253 ?auto_25270 ) ) ( IS-CRATE ?auto_25249 ) ( not ( = ?auto_25272 ?auto_25254 ) ) ( HOIST-AT ?auto_25282 ?auto_25272 ) ( AVAILABLE ?auto_25282 ) ( SURFACE-AT ?auto_25249 ?auto_25272 ) ( ON ?auto_25249 ?auto_25263 ) ( CLEAR ?auto_25249 ) ( not ( = ?auto_25248 ?auto_25249 ) ) ( not ( = ?auto_25248 ?auto_25263 ) ) ( not ( = ?auto_25249 ?auto_25263 ) ) ( not ( = ?auto_25253 ?auto_25282 ) ) ( IS-CRATE ?auto_25248 ) ( SURFACE-AT ?auto_25248 ?auto_25255 ) ( ON ?auto_25248 ?auto_25285 ) ( CLEAR ?auto_25248 ) ( not ( = ?auto_25247 ?auto_25248 ) ) ( not ( = ?auto_25247 ?auto_25285 ) ) ( not ( = ?auto_25248 ?auto_25285 ) ) ( IS-CRATE ?auto_25247 ) ( not ( = ?auto_25264 ?auto_25254 ) ) ( HOIST-AT ?auto_25280 ?auto_25264 ) ( AVAILABLE ?auto_25280 ) ( SURFACE-AT ?auto_25247 ?auto_25264 ) ( ON ?auto_25247 ?auto_25293 ) ( CLEAR ?auto_25247 ) ( not ( = ?auto_25246 ?auto_25247 ) ) ( not ( = ?auto_25246 ?auto_25293 ) ) ( not ( = ?auto_25247 ?auto_25293 ) ) ( not ( = ?auto_25253 ?auto_25280 ) ) ( IS-CRATE ?auto_25246 ) ( not ( = ?auto_25291 ?auto_25254 ) ) ( HOIST-AT ?auto_25261 ?auto_25291 ) ( SURFACE-AT ?auto_25246 ?auto_25291 ) ( ON ?auto_25246 ?auto_25279 ) ( CLEAR ?auto_25246 ) ( not ( = ?auto_25245 ?auto_25246 ) ) ( not ( = ?auto_25245 ?auto_25279 ) ) ( not ( = ?auto_25246 ?auto_25279 ) ) ( not ( = ?auto_25253 ?auto_25261 ) ) ( IS-CRATE ?auto_25245 ) ( not ( = ?auto_25262 ?auto_25254 ) ) ( HOIST-AT ?auto_25281 ?auto_25262 ) ( AVAILABLE ?auto_25281 ) ( SURFACE-AT ?auto_25245 ?auto_25262 ) ( ON ?auto_25245 ?auto_25273 ) ( CLEAR ?auto_25245 ) ( not ( = ?auto_25244 ?auto_25245 ) ) ( not ( = ?auto_25244 ?auto_25273 ) ) ( not ( = ?auto_25245 ?auto_25273 ) ) ( not ( = ?auto_25253 ?auto_25281 ) ) ( IS-CRATE ?auto_25244 ) ( not ( = ?auto_25275 ?auto_25254 ) ) ( HOIST-AT ?auto_25294 ?auto_25275 ) ( AVAILABLE ?auto_25294 ) ( SURFACE-AT ?auto_25244 ?auto_25275 ) ( ON ?auto_25244 ?auto_25286 ) ( CLEAR ?auto_25244 ) ( not ( = ?auto_25243 ?auto_25244 ) ) ( not ( = ?auto_25243 ?auto_25286 ) ) ( not ( = ?auto_25244 ?auto_25286 ) ) ( not ( = ?auto_25253 ?auto_25294 ) ) ( IS-CRATE ?auto_25243 ) ( AVAILABLE ?auto_25256 ) ( SURFACE-AT ?auto_25243 ?auto_25255 ) ( ON ?auto_25243 ?auto_25278 ) ( CLEAR ?auto_25243 ) ( not ( = ?auto_25242 ?auto_25243 ) ) ( not ( = ?auto_25242 ?auto_25278 ) ) ( not ( = ?auto_25243 ?auto_25278 ) ) ( IS-CRATE ?auto_25242 ) ( not ( = ?auto_25266 ?auto_25254 ) ) ( HOIST-AT ?auto_25276 ?auto_25266 ) ( AVAILABLE ?auto_25276 ) ( SURFACE-AT ?auto_25242 ?auto_25266 ) ( ON ?auto_25242 ?auto_25292 ) ( CLEAR ?auto_25242 ) ( not ( = ?auto_25241 ?auto_25242 ) ) ( not ( = ?auto_25241 ?auto_25292 ) ) ( not ( = ?auto_25242 ?auto_25292 ) ) ( not ( = ?auto_25253 ?auto_25276 ) ) ( IS-CRATE ?auto_25241 ) ( SURFACE-AT ?auto_25241 ?auto_25291 ) ( ON ?auto_25241 ?auto_25269 ) ( CLEAR ?auto_25241 ) ( not ( = ?auto_25240 ?auto_25241 ) ) ( not ( = ?auto_25240 ?auto_25269 ) ) ( not ( = ?auto_25241 ?auto_25269 ) ) ( IS-CRATE ?auto_25240 ) ( not ( = ?auto_25268 ?auto_25254 ) ) ( HOIST-AT ?auto_25295 ?auto_25268 ) ( AVAILABLE ?auto_25295 ) ( SURFACE-AT ?auto_25240 ?auto_25268 ) ( ON ?auto_25240 ?auto_25271 ) ( CLEAR ?auto_25240 ) ( not ( = ?auto_25239 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25271 ) ) ( not ( = ?auto_25240 ?auto_25271 ) ) ( not ( = ?auto_25253 ?auto_25295 ) ) ( IS-CRATE ?auto_25239 ) ( not ( = ?auto_25259 ?auto_25254 ) ) ( HOIST-AT ?auto_25267 ?auto_25259 ) ( AVAILABLE ?auto_25267 ) ( SURFACE-AT ?auto_25239 ?auto_25259 ) ( ON ?auto_25239 ?auto_25260 ) ( CLEAR ?auto_25239 ) ( not ( = ?auto_25238 ?auto_25239 ) ) ( not ( = ?auto_25238 ?auto_25260 ) ) ( not ( = ?auto_25239 ?auto_25260 ) ) ( not ( = ?auto_25253 ?auto_25267 ) ) ( IS-CRATE ?auto_25238 ) ( AVAILABLE ?auto_25261 ) ( SURFACE-AT ?auto_25238 ?auto_25291 ) ( ON ?auto_25238 ?auto_25290 ) ( CLEAR ?auto_25238 ) ( not ( = ?auto_25237 ?auto_25238 ) ) ( not ( = ?auto_25237 ?auto_25290 ) ) ( not ( = ?auto_25238 ?auto_25290 ) ) ( SURFACE-AT ?auto_25236 ?auto_25254 ) ( CLEAR ?auto_25236 ) ( IS-CRATE ?auto_25237 ) ( AVAILABLE ?auto_25253 ) ( not ( = ?auto_25288 ?auto_25254 ) ) ( HOIST-AT ?auto_25265 ?auto_25288 ) ( AVAILABLE ?auto_25265 ) ( SURFACE-AT ?auto_25237 ?auto_25288 ) ( ON ?auto_25237 ?auto_25274 ) ( CLEAR ?auto_25237 ) ( TRUCK-AT ?auto_25257 ?auto_25254 ) ( not ( = ?auto_25236 ?auto_25237 ) ) ( not ( = ?auto_25236 ?auto_25274 ) ) ( not ( = ?auto_25237 ?auto_25274 ) ) ( not ( = ?auto_25253 ?auto_25265 ) ) ( not ( = ?auto_25236 ?auto_25238 ) ) ( not ( = ?auto_25236 ?auto_25290 ) ) ( not ( = ?auto_25238 ?auto_25274 ) ) ( not ( = ?auto_25291 ?auto_25288 ) ) ( not ( = ?auto_25261 ?auto_25265 ) ) ( not ( = ?auto_25290 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25239 ) ) ( not ( = ?auto_25236 ?auto_25260 ) ) ( not ( = ?auto_25237 ?auto_25239 ) ) ( not ( = ?auto_25237 ?auto_25260 ) ) ( not ( = ?auto_25239 ?auto_25290 ) ) ( not ( = ?auto_25239 ?auto_25274 ) ) ( not ( = ?auto_25259 ?auto_25291 ) ) ( not ( = ?auto_25259 ?auto_25288 ) ) ( not ( = ?auto_25267 ?auto_25261 ) ) ( not ( = ?auto_25267 ?auto_25265 ) ) ( not ( = ?auto_25260 ?auto_25290 ) ) ( not ( = ?auto_25260 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25240 ) ) ( not ( = ?auto_25236 ?auto_25271 ) ) ( not ( = ?auto_25237 ?auto_25240 ) ) ( not ( = ?auto_25237 ?auto_25271 ) ) ( not ( = ?auto_25238 ?auto_25240 ) ) ( not ( = ?auto_25238 ?auto_25271 ) ) ( not ( = ?auto_25240 ?auto_25260 ) ) ( not ( = ?auto_25240 ?auto_25290 ) ) ( not ( = ?auto_25240 ?auto_25274 ) ) ( not ( = ?auto_25268 ?auto_25259 ) ) ( not ( = ?auto_25268 ?auto_25291 ) ) ( not ( = ?auto_25268 ?auto_25288 ) ) ( not ( = ?auto_25295 ?auto_25267 ) ) ( not ( = ?auto_25295 ?auto_25261 ) ) ( not ( = ?auto_25295 ?auto_25265 ) ) ( not ( = ?auto_25271 ?auto_25260 ) ) ( not ( = ?auto_25271 ?auto_25290 ) ) ( not ( = ?auto_25271 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25241 ) ) ( not ( = ?auto_25236 ?auto_25269 ) ) ( not ( = ?auto_25237 ?auto_25241 ) ) ( not ( = ?auto_25237 ?auto_25269 ) ) ( not ( = ?auto_25238 ?auto_25241 ) ) ( not ( = ?auto_25238 ?auto_25269 ) ) ( not ( = ?auto_25239 ?auto_25241 ) ) ( not ( = ?auto_25239 ?auto_25269 ) ) ( not ( = ?auto_25241 ?auto_25271 ) ) ( not ( = ?auto_25241 ?auto_25260 ) ) ( not ( = ?auto_25241 ?auto_25290 ) ) ( not ( = ?auto_25241 ?auto_25274 ) ) ( not ( = ?auto_25269 ?auto_25271 ) ) ( not ( = ?auto_25269 ?auto_25260 ) ) ( not ( = ?auto_25269 ?auto_25290 ) ) ( not ( = ?auto_25269 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25242 ) ) ( not ( = ?auto_25236 ?auto_25292 ) ) ( not ( = ?auto_25237 ?auto_25242 ) ) ( not ( = ?auto_25237 ?auto_25292 ) ) ( not ( = ?auto_25238 ?auto_25242 ) ) ( not ( = ?auto_25238 ?auto_25292 ) ) ( not ( = ?auto_25239 ?auto_25242 ) ) ( not ( = ?auto_25239 ?auto_25292 ) ) ( not ( = ?auto_25240 ?auto_25242 ) ) ( not ( = ?auto_25240 ?auto_25292 ) ) ( not ( = ?auto_25242 ?auto_25269 ) ) ( not ( = ?auto_25242 ?auto_25271 ) ) ( not ( = ?auto_25242 ?auto_25260 ) ) ( not ( = ?auto_25242 ?auto_25290 ) ) ( not ( = ?auto_25242 ?auto_25274 ) ) ( not ( = ?auto_25266 ?auto_25291 ) ) ( not ( = ?auto_25266 ?auto_25268 ) ) ( not ( = ?auto_25266 ?auto_25259 ) ) ( not ( = ?auto_25266 ?auto_25288 ) ) ( not ( = ?auto_25276 ?auto_25261 ) ) ( not ( = ?auto_25276 ?auto_25295 ) ) ( not ( = ?auto_25276 ?auto_25267 ) ) ( not ( = ?auto_25276 ?auto_25265 ) ) ( not ( = ?auto_25292 ?auto_25269 ) ) ( not ( = ?auto_25292 ?auto_25271 ) ) ( not ( = ?auto_25292 ?auto_25260 ) ) ( not ( = ?auto_25292 ?auto_25290 ) ) ( not ( = ?auto_25292 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25243 ) ) ( not ( = ?auto_25236 ?auto_25278 ) ) ( not ( = ?auto_25237 ?auto_25243 ) ) ( not ( = ?auto_25237 ?auto_25278 ) ) ( not ( = ?auto_25238 ?auto_25243 ) ) ( not ( = ?auto_25238 ?auto_25278 ) ) ( not ( = ?auto_25239 ?auto_25243 ) ) ( not ( = ?auto_25239 ?auto_25278 ) ) ( not ( = ?auto_25240 ?auto_25243 ) ) ( not ( = ?auto_25240 ?auto_25278 ) ) ( not ( = ?auto_25241 ?auto_25243 ) ) ( not ( = ?auto_25241 ?auto_25278 ) ) ( not ( = ?auto_25243 ?auto_25292 ) ) ( not ( = ?auto_25243 ?auto_25269 ) ) ( not ( = ?auto_25243 ?auto_25271 ) ) ( not ( = ?auto_25243 ?auto_25260 ) ) ( not ( = ?auto_25243 ?auto_25290 ) ) ( not ( = ?auto_25243 ?auto_25274 ) ) ( not ( = ?auto_25255 ?auto_25266 ) ) ( not ( = ?auto_25255 ?auto_25291 ) ) ( not ( = ?auto_25255 ?auto_25268 ) ) ( not ( = ?auto_25255 ?auto_25259 ) ) ( not ( = ?auto_25255 ?auto_25288 ) ) ( not ( = ?auto_25256 ?auto_25276 ) ) ( not ( = ?auto_25256 ?auto_25261 ) ) ( not ( = ?auto_25256 ?auto_25295 ) ) ( not ( = ?auto_25256 ?auto_25267 ) ) ( not ( = ?auto_25256 ?auto_25265 ) ) ( not ( = ?auto_25278 ?auto_25292 ) ) ( not ( = ?auto_25278 ?auto_25269 ) ) ( not ( = ?auto_25278 ?auto_25271 ) ) ( not ( = ?auto_25278 ?auto_25260 ) ) ( not ( = ?auto_25278 ?auto_25290 ) ) ( not ( = ?auto_25278 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25244 ) ) ( not ( = ?auto_25236 ?auto_25286 ) ) ( not ( = ?auto_25237 ?auto_25244 ) ) ( not ( = ?auto_25237 ?auto_25286 ) ) ( not ( = ?auto_25238 ?auto_25244 ) ) ( not ( = ?auto_25238 ?auto_25286 ) ) ( not ( = ?auto_25239 ?auto_25244 ) ) ( not ( = ?auto_25239 ?auto_25286 ) ) ( not ( = ?auto_25240 ?auto_25244 ) ) ( not ( = ?auto_25240 ?auto_25286 ) ) ( not ( = ?auto_25241 ?auto_25244 ) ) ( not ( = ?auto_25241 ?auto_25286 ) ) ( not ( = ?auto_25242 ?auto_25244 ) ) ( not ( = ?auto_25242 ?auto_25286 ) ) ( not ( = ?auto_25244 ?auto_25278 ) ) ( not ( = ?auto_25244 ?auto_25292 ) ) ( not ( = ?auto_25244 ?auto_25269 ) ) ( not ( = ?auto_25244 ?auto_25271 ) ) ( not ( = ?auto_25244 ?auto_25260 ) ) ( not ( = ?auto_25244 ?auto_25290 ) ) ( not ( = ?auto_25244 ?auto_25274 ) ) ( not ( = ?auto_25275 ?auto_25255 ) ) ( not ( = ?auto_25275 ?auto_25266 ) ) ( not ( = ?auto_25275 ?auto_25291 ) ) ( not ( = ?auto_25275 ?auto_25268 ) ) ( not ( = ?auto_25275 ?auto_25259 ) ) ( not ( = ?auto_25275 ?auto_25288 ) ) ( not ( = ?auto_25294 ?auto_25256 ) ) ( not ( = ?auto_25294 ?auto_25276 ) ) ( not ( = ?auto_25294 ?auto_25261 ) ) ( not ( = ?auto_25294 ?auto_25295 ) ) ( not ( = ?auto_25294 ?auto_25267 ) ) ( not ( = ?auto_25294 ?auto_25265 ) ) ( not ( = ?auto_25286 ?auto_25278 ) ) ( not ( = ?auto_25286 ?auto_25292 ) ) ( not ( = ?auto_25286 ?auto_25269 ) ) ( not ( = ?auto_25286 ?auto_25271 ) ) ( not ( = ?auto_25286 ?auto_25260 ) ) ( not ( = ?auto_25286 ?auto_25290 ) ) ( not ( = ?auto_25286 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25245 ) ) ( not ( = ?auto_25236 ?auto_25273 ) ) ( not ( = ?auto_25237 ?auto_25245 ) ) ( not ( = ?auto_25237 ?auto_25273 ) ) ( not ( = ?auto_25238 ?auto_25245 ) ) ( not ( = ?auto_25238 ?auto_25273 ) ) ( not ( = ?auto_25239 ?auto_25245 ) ) ( not ( = ?auto_25239 ?auto_25273 ) ) ( not ( = ?auto_25240 ?auto_25245 ) ) ( not ( = ?auto_25240 ?auto_25273 ) ) ( not ( = ?auto_25241 ?auto_25245 ) ) ( not ( = ?auto_25241 ?auto_25273 ) ) ( not ( = ?auto_25242 ?auto_25245 ) ) ( not ( = ?auto_25242 ?auto_25273 ) ) ( not ( = ?auto_25243 ?auto_25245 ) ) ( not ( = ?auto_25243 ?auto_25273 ) ) ( not ( = ?auto_25245 ?auto_25286 ) ) ( not ( = ?auto_25245 ?auto_25278 ) ) ( not ( = ?auto_25245 ?auto_25292 ) ) ( not ( = ?auto_25245 ?auto_25269 ) ) ( not ( = ?auto_25245 ?auto_25271 ) ) ( not ( = ?auto_25245 ?auto_25260 ) ) ( not ( = ?auto_25245 ?auto_25290 ) ) ( not ( = ?auto_25245 ?auto_25274 ) ) ( not ( = ?auto_25262 ?auto_25275 ) ) ( not ( = ?auto_25262 ?auto_25255 ) ) ( not ( = ?auto_25262 ?auto_25266 ) ) ( not ( = ?auto_25262 ?auto_25291 ) ) ( not ( = ?auto_25262 ?auto_25268 ) ) ( not ( = ?auto_25262 ?auto_25259 ) ) ( not ( = ?auto_25262 ?auto_25288 ) ) ( not ( = ?auto_25281 ?auto_25294 ) ) ( not ( = ?auto_25281 ?auto_25256 ) ) ( not ( = ?auto_25281 ?auto_25276 ) ) ( not ( = ?auto_25281 ?auto_25261 ) ) ( not ( = ?auto_25281 ?auto_25295 ) ) ( not ( = ?auto_25281 ?auto_25267 ) ) ( not ( = ?auto_25281 ?auto_25265 ) ) ( not ( = ?auto_25273 ?auto_25286 ) ) ( not ( = ?auto_25273 ?auto_25278 ) ) ( not ( = ?auto_25273 ?auto_25292 ) ) ( not ( = ?auto_25273 ?auto_25269 ) ) ( not ( = ?auto_25273 ?auto_25271 ) ) ( not ( = ?auto_25273 ?auto_25260 ) ) ( not ( = ?auto_25273 ?auto_25290 ) ) ( not ( = ?auto_25273 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25246 ) ) ( not ( = ?auto_25236 ?auto_25279 ) ) ( not ( = ?auto_25237 ?auto_25246 ) ) ( not ( = ?auto_25237 ?auto_25279 ) ) ( not ( = ?auto_25238 ?auto_25246 ) ) ( not ( = ?auto_25238 ?auto_25279 ) ) ( not ( = ?auto_25239 ?auto_25246 ) ) ( not ( = ?auto_25239 ?auto_25279 ) ) ( not ( = ?auto_25240 ?auto_25246 ) ) ( not ( = ?auto_25240 ?auto_25279 ) ) ( not ( = ?auto_25241 ?auto_25246 ) ) ( not ( = ?auto_25241 ?auto_25279 ) ) ( not ( = ?auto_25242 ?auto_25246 ) ) ( not ( = ?auto_25242 ?auto_25279 ) ) ( not ( = ?auto_25243 ?auto_25246 ) ) ( not ( = ?auto_25243 ?auto_25279 ) ) ( not ( = ?auto_25244 ?auto_25246 ) ) ( not ( = ?auto_25244 ?auto_25279 ) ) ( not ( = ?auto_25246 ?auto_25273 ) ) ( not ( = ?auto_25246 ?auto_25286 ) ) ( not ( = ?auto_25246 ?auto_25278 ) ) ( not ( = ?auto_25246 ?auto_25292 ) ) ( not ( = ?auto_25246 ?auto_25269 ) ) ( not ( = ?auto_25246 ?auto_25271 ) ) ( not ( = ?auto_25246 ?auto_25260 ) ) ( not ( = ?auto_25246 ?auto_25290 ) ) ( not ( = ?auto_25246 ?auto_25274 ) ) ( not ( = ?auto_25279 ?auto_25273 ) ) ( not ( = ?auto_25279 ?auto_25286 ) ) ( not ( = ?auto_25279 ?auto_25278 ) ) ( not ( = ?auto_25279 ?auto_25292 ) ) ( not ( = ?auto_25279 ?auto_25269 ) ) ( not ( = ?auto_25279 ?auto_25271 ) ) ( not ( = ?auto_25279 ?auto_25260 ) ) ( not ( = ?auto_25279 ?auto_25290 ) ) ( not ( = ?auto_25279 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25247 ) ) ( not ( = ?auto_25236 ?auto_25293 ) ) ( not ( = ?auto_25237 ?auto_25247 ) ) ( not ( = ?auto_25237 ?auto_25293 ) ) ( not ( = ?auto_25238 ?auto_25247 ) ) ( not ( = ?auto_25238 ?auto_25293 ) ) ( not ( = ?auto_25239 ?auto_25247 ) ) ( not ( = ?auto_25239 ?auto_25293 ) ) ( not ( = ?auto_25240 ?auto_25247 ) ) ( not ( = ?auto_25240 ?auto_25293 ) ) ( not ( = ?auto_25241 ?auto_25247 ) ) ( not ( = ?auto_25241 ?auto_25293 ) ) ( not ( = ?auto_25242 ?auto_25247 ) ) ( not ( = ?auto_25242 ?auto_25293 ) ) ( not ( = ?auto_25243 ?auto_25247 ) ) ( not ( = ?auto_25243 ?auto_25293 ) ) ( not ( = ?auto_25244 ?auto_25247 ) ) ( not ( = ?auto_25244 ?auto_25293 ) ) ( not ( = ?auto_25245 ?auto_25247 ) ) ( not ( = ?auto_25245 ?auto_25293 ) ) ( not ( = ?auto_25247 ?auto_25279 ) ) ( not ( = ?auto_25247 ?auto_25273 ) ) ( not ( = ?auto_25247 ?auto_25286 ) ) ( not ( = ?auto_25247 ?auto_25278 ) ) ( not ( = ?auto_25247 ?auto_25292 ) ) ( not ( = ?auto_25247 ?auto_25269 ) ) ( not ( = ?auto_25247 ?auto_25271 ) ) ( not ( = ?auto_25247 ?auto_25260 ) ) ( not ( = ?auto_25247 ?auto_25290 ) ) ( not ( = ?auto_25247 ?auto_25274 ) ) ( not ( = ?auto_25264 ?auto_25291 ) ) ( not ( = ?auto_25264 ?auto_25262 ) ) ( not ( = ?auto_25264 ?auto_25275 ) ) ( not ( = ?auto_25264 ?auto_25255 ) ) ( not ( = ?auto_25264 ?auto_25266 ) ) ( not ( = ?auto_25264 ?auto_25268 ) ) ( not ( = ?auto_25264 ?auto_25259 ) ) ( not ( = ?auto_25264 ?auto_25288 ) ) ( not ( = ?auto_25280 ?auto_25261 ) ) ( not ( = ?auto_25280 ?auto_25281 ) ) ( not ( = ?auto_25280 ?auto_25294 ) ) ( not ( = ?auto_25280 ?auto_25256 ) ) ( not ( = ?auto_25280 ?auto_25276 ) ) ( not ( = ?auto_25280 ?auto_25295 ) ) ( not ( = ?auto_25280 ?auto_25267 ) ) ( not ( = ?auto_25280 ?auto_25265 ) ) ( not ( = ?auto_25293 ?auto_25279 ) ) ( not ( = ?auto_25293 ?auto_25273 ) ) ( not ( = ?auto_25293 ?auto_25286 ) ) ( not ( = ?auto_25293 ?auto_25278 ) ) ( not ( = ?auto_25293 ?auto_25292 ) ) ( not ( = ?auto_25293 ?auto_25269 ) ) ( not ( = ?auto_25293 ?auto_25271 ) ) ( not ( = ?auto_25293 ?auto_25260 ) ) ( not ( = ?auto_25293 ?auto_25290 ) ) ( not ( = ?auto_25293 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25248 ) ) ( not ( = ?auto_25236 ?auto_25285 ) ) ( not ( = ?auto_25237 ?auto_25248 ) ) ( not ( = ?auto_25237 ?auto_25285 ) ) ( not ( = ?auto_25238 ?auto_25248 ) ) ( not ( = ?auto_25238 ?auto_25285 ) ) ( not ( = ?auto_25239 ?auto_25248 ) ) ( not ( = ?auto_25239 ?auto_25285 ) ) ( not ( = ?auto_25240 ?auto_25248 ) ) ( not ( = ?auto_25240 ?auto_25285 ) ) ( not ( = ?auto_25241 ?auto_25248 ) ) ( not ( = ?auto_25241 ?auto_25285 ) ) ( not ( = ?auto_25242 ?auto_25248 ) ) ( not ( = ?auto_25242 ?auto_25285 ) ) ( not ( = ?auto_25243 ?auto_25248 ) ) ( not ( = ?auto_25243 ?auto_25285 ) ) ( not ( = ?auto_25244 ?auto_25248 ) ) ( not ( = ?auto_25244 ?auto_25285 ) ) ( not ( = ?auto_25245 ?auto_25248 ) ) ( not ( = ?auto_25245 ?auto_25285 ) ) ( not ( = ?auto_25246 ?auto_25248 ) ) ( not ( = ?auto_25246 ?auto_25285 ) ) ( not ( = ?auto_25248 ?auto_25293 ) ) ( not ( = ?auto_25248 ?auto_25279 ) ) ( not ( = ?auto_25248 ?auto_25273 ) ) ( not ( = ?auto_25248 ?auto_25286 ) ) ( not ( = ?auto_25248 ?auto_25278 ) ) ( not ( = ?auto_25248 ?auto_25292 ) ) ( not ( = ?auto_25248 ?auto_25269 ) ) ( not ( = ?auto_25248 ?auto_25271 ) ) ( not ( = ?auto_25248 ?auto_25260 ) ) ( not ( = ?auto_25248 ?auto_25290 ) ) ( not ( = ?auto_25248 ?auto_25274 ) ) ( not ( = ?auto_25285 ?auto_25293 ) ) ( not ( = ?auto_25285 ?auto_25279 ) ) ( not ( = ?auto_25285 ?auto_25273 ) ) ( not ( = ?auto_25285 ?auto_25286 ) ) ( not ( = ?auto_25285 ?auto_25278 ) ) ( not ( = ?auto_25285 ?auto_25292 ) ) ( not ( = ?auto_25285 ?auto_25269 ) ) ( not ( = ?auto_25285 ?auto_25271 ) ) ( not ( = ?auto_25285 ?auto_25260 ) ) ( not ( = ?auto_25285 ?auto_25290 ) ) ( not ( = ?auto_25285 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25249 ) ) ( not ( = ?auto_25236 ?auto_25263 ) ) ( not ( = ?auto_25237 ?auto_25249 ) ) ( not ( = ?auto_25237 ?auto_25263 ) ) ( not ( = ?auto_25238 ?auto_25249 ) ) ( not ( = ?auto_25238 ?auto_25263 ) ) ( not ( = ?auto_25239 ?auto_25249 ) ) ( not ( = ?auto_25239 ?auto_25263 ) ) ( not ( = ?auto_25240 ?auto_25249 ) ) ( not ( = ?auto_25240 ?auto_25263 ) ) ( not ( = ?auto_25241 ?auto_25249 ) ) ( not ( = ?auto_25241 ?auto_25263 ) ) ( not ( = ?auto_25242 ?auto_25249 ) ) ( not ( = ?auto_25242 ?auto_25263 ) ) ( not ( = ?auto_25243 ?auto_25249 ) ) ( not ( = ?auto_25243 ?auto_25263 ) ) ( not ( = ?auto_25244 ?auto_25249 ) ) ( not ( = ?auto_25244 ?auto_25263 ) ) ( not ( = ?auto_25245 ?auto_25249 ) ) ( not ( = ?auto_25245 ?auto_25263 ) ) ( not ( = ?auto_25246 ?auto_25249 ) ) ( not ( = ?auto_25246 ?auto_25263 ) ) ( not ( = ?auto_25247 ?auto_25249 ) ) ( not ( = ?auto_25247 ?auto_25263 ) ) ( not ( = ?auto_25249 ?auto_25285 ) ) ( not ( = ?auto_25249 ?auto_25293 ) ) ( not ( = ?auto_25249 ?auto_25279 ) ) ( not ( = ?auto_25249 ?auto_25273 ) ) ( not ( = ?auto_25249 ?auto_25286 ) ) ( not ( = ?auto_25249 ?auto_25278 ) ) ( not ( = ?auto_25249 ?auto_25292 ) ) ( not ( = ?auto_25249 ?auto_25269 ) ) ( not ( = ?auto_25249 ?auto_25271 ) ) ( not ( = ?auto_25249 ?auto_25260 ) ) ( not ( = ?auto_25249 ?auto_25290 ) ) ( not ( = ?auto_25249 ?auto_25274 ) ) ( not ( = ?auto_25272 ?auto_25255 ) ) ( not ( = ?auto_25272 ?auto_25264 ) ) ( not ( = ?auto_25272 ?auto_25291 ) ) ( not ( = ?auto_25272 ?auto_25262 ) ) ( not ( = ?auto_25272 ?auto_25275 ) ) ( not ( = ?auto_25272 ?auto_25266 ) ) ( not ( = ?auto_25272 ?auto_25268 ) ) ( not ( = ?auto_25272 ?auto_25259 ) ) ( not ( = ?auto_25272 ?auto_25288 ) ) ( not ( = ?auto_25282 ?auto_25256 ) ) ( not ( = ?auto_25282 ?auto_25280 ) ) ( not ( = ?auto_25282 ?auto_25261 ) ) ( not ( = ?auto_25282 ?auto_25281 ) ) ( not ( = ?auto_25282 ?auto_25294 ) ) ( not ( = ?auto_25282 ?auto_25276 ) ) ( not ( = ?auto_25282 ?auto_25295 ) ) ( not ( = ?auto_25282 ?auto_25267 ) ) ( not ( = ?auto_25282 ?auto_25265 ) ) ( not ( = ?auto_25263 ?auto_25285 ) ) ( not ( = ?auto_25263 ?auto_25293 ) ) ( not ( = ?auto_25263 ?auto_25279 ) ) ( not ( = ?auto_25263 ?auto_25273 ) ) ( not ( = ?auto_25263 ?auto_25286 ) ) ( not ( = ?auto_25263 ?auto_25278 ) ) ( not ( = ?auto_25263 ?auto_25292 ) ) ( not ( = ?auto_25263 ?auto_25269 ) ) ( not ( = ?auto_25263 ?auto_25271 ) ) ( not ( = ?auto_25263 ?auto_25260 ) ) ( not ( = ?auto_25263 ?auto_25290 ) ) ( not ( = ?auto_25263 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25251 ) ) ( not ( = ?auto_25236 ?auto_25284 ) ) ( not ( = ?auto_25237 ?auto_25251 ) ) ( not ( = ?auto_25237 ?auto_25284 ) ) ( not ( = ?auto_25238 ?auto_25251 ) ) ( not ( = ?auto_25238 ?auto_25284 ) ) ( not ( = ?auto_25239 ?auto_25251 ) ) ( not ( = ?auto_25239 ?auto_25284 ) ) ( not ( = ?auto_25240 ?auto_25251 ) ) ( not ( = ?auto_25240 ?auto_25284 ) ) ( not ( = ?auto_25241 ?auto_25251 ) ) ( not ( = ?auto_25241 ?auto_25284 ) ) ( not ( = ?auto_25242 ?auto_25251 ) ) ( not ( = ?auto_25242 ?auto_25284 ) ) ( not ( = ?auto_25243 ?auto_25251 ) ) ( not ( = ?auto_25243 ?auto_25284 ) ) ( not ( = ?auto_25244 ?auto_25251 ) ) ( not ( = ?auto_25244 ?auto_25284 ) ) ( not ( = ?auto_25245 ?auto_25251 ) ) ( not ( = ?auto_25245 ?auto_25284 ) ) ( not ( = ?auto_25246 ?auto_25251 ) ) ( not ( = ?auto_25246 ?auto_25284 ) ) ( not ( = ?auto_25247 ?auto_25251 ) ) ( not ( = ?auto_25247 ?auto_25284 ) ) ( not ( = ?auto_25248 ?auto_25251 ) ) ( not ( = ?auto_25248 ?auto_25284 ) ) ( not ( = ?auto_25251 ?auto_25263 ) ) ( not ( = ?auto_25251 ?auto_25285 ) ) ( not ( = ?auto_25251 ?auto_25293 ) ) ( not ( = ?auto_25251 ?auto_25279 ) ) ( not ( = ?auto_25251 ?auto_25273 ) ) ( not ( = ?auto_25251 ?auto_25286 ) ) ( not ( = ?auto_25251 ?auto_25278 ) ) ( not ( = ?auto_25251 ?auto_25292 ) ) ( not ( = ?auto_25251 ?auto_25269 ) ) ( not ( = ?auto_25251 ?auto_25271 ) ) ( not ( = ?auto_25251 ?auto_25260 ) ) ( not ( = ?auto_25251 ?auto_25290 ) ) ( not ( = ?auto_25251 ?auto_25274 ) ) ( not ( = ?auto_25289 ?auto_25272 ) ) ( not ( = ?auto_25289 ?auto_25255 ) ) ( not ( = ?auto_25289 ?auto_25264 ) ) ( not ( = ?auto_25289 ?auto_25291 ) ) ( not ( = ?auto_25289 ?auto_25262 ) ) ( not ( = ?auto_25289 ?auto_25275 ) ) ( not ( = ?auto_25289 ?auto_25266 ) ) ( not ( = ?auto_25289 ?auto_25268 ) ) ( not ( = ?auto_25289 ?auto_25259 ) ) ( not ( = ?auto_25289 ?auto_25288 ) ) ( not ( = ?auto_25270 ?auto_25282 ) ) ( not ( = ?auto_25270 ?auto_25256 ) ) ( not ( = ?auto_25270 ?auto_25280 ) ) ( not ( = ?auto_25270 ?auto_25261 ) ) ( not ( = ?auto_25270 ?auto_25281 ) ) ( not ( = ?auto_25270 ?auto_25294 ) ) ( not ( = ?auto_25270 ?auto_25276 ) ) ( not ( = ?auto_25270 ?auto_25295 ) ) ( not ( = ?auto_25270 ?auto_25267 ) ) ( not ( = ?auto_25270 ?auto_25265 ) ) ( not ( = ?auto_25284 ?auto_25263 ) ) ( not ( = ?auto_25284 ?auto_25285 ) ) ( not ( = ?auto_25284 ?auto_25293 ) ) ( not ( = ?auto_25284 ?auto_25279 ) ) ( not ( = ?auto_25284 ?auto_25273 ) ) ( not ( = ?auto_25284 ?auto_25286 ) ) ( not ( = ?auto_25284 ?auto_25278 ) ) ( not ( = ?auto_25284 ?auto_25292 ) ) ( not ( = ?auto_25284 ?auto_25269 ) ) ( not ( = ?auto_25284 ?auto_25271 ) ) ( not ( = ?auto_25284 ?auto_25260 ) ) ( not ( = ?auto_25284 ?auto_25290 ) ) ( not ( = ?auto_25284 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25250 ) ) ( not ( = ?auto_25236 ?auto_25283 ) ) ( not ( = ?auto_25237 ?auto_25250 ) ) ( not ( = ?auto_25237 ?auto_25283 ) ) ( not ( = ?auto_25238 ?auto_25250 ) ) ( not ( = ?auto_25238 ?auto_25283 ) ) ( not ( = ?auto_25239 ?auto_25250 ) ) ( not ( = ?auto_25239 ?auto_25283 ) ) ( not ( = ?auto_25240 ?auto_25250 ) ) ( not ( = ?auto_25240 ?auto_25283 ) ) ( not ( = ?auto_25241 ?auto_25250 ) ) ( not ( = ?auto_25241 ?auto_25283 ) ) ( not ( = ?auto_25242 ?auto_25250 ) ) ( not ( = ?auto_25242 ?auto_25283 ) ) ( not ( = ?auto_25243 ?auto_25250 ) ) ( not ( = ?auto_25243 ?auto_25283 ) ) ( not ( = ?auto_25244 ?auto_25250 ) ) ( not ( = ?auto_25244 ?auto_25283 ) ) ( not ( = ?auto_25245 ?auto_25250 ) ) ( not ( = ?auto_25245 ?auto_25283 ) ) ( not ( = ?auto_25246 ?auto_25250 ) ) ( not ( = ?auto_25246 ?auto_25283 ) ) ( not ( = ?auto_25247 ?auto_25250 ) ) ( not ( = ?auto_25247 ?auto_25283 ) ) ( not ( = ?auto_25248 ?auto_25250 ) ) ( not ( = ?auto_25248 ?auto_25283 ) ) ( not ( = ?auto_25249 ?auto_25250 ) ) ( not ( = ?auto_25249 ?auto_25283 ) ) ( not ( = ?auto_25250 ?auto_25284 ) ) ( not ( = ?auto_25250 ?auto_25263 ) ) ( not ( = ?auto_25250 ?auto_25285 ) ) ( not ( = ?auto_25250 ?auto_25293 ) ) ( not ( = ?auto_25250 ?auto_25279 ) ) ( not ( = ?auto_25250 ?auto_25273 ) ) ( not ( = ?auto_25250 ?auto_25286 ) ) ( not ( = ?auto_25250 ?auto_25278 ) ) ( not ( = ?auto_25250 ?auto_25292 ) ) ( not ( = ?auto_25250 ?auto_25269 ) ) ( not ( = ?auto_25250 ?auto_25271 ) ) ( not ( = ?auto_25250 ?auto_25260 ) ) ( not ( = ?auto_25250 ?auto_25290 ) ) ( not ( = ?auto_25250 ?auto_25274 ) ) ( not ( = ?auto_25277 ?auto_25289 ) ) ( not ( = ?auto_25277 ?auto_25272 ) ) ( not ( = ?auto_25277 ?auto_25255 ) ) ( not ( = ?auto_25277 ?auto_25264 ) ) ( not ( = ?auto_25277 ?auto_25291 ) ) ( not ( = ?auto_25277 ?auto_25262 ) ) ( not ( = ?auto_25277 ?auto_25275 ) ) ( not ( = ?auto_25277 ?auto_25266 ) ) ( not ( = ?auto_25277 ?auto_25268 ) ) ( not ( = ?auto_25277 ?auto_25259 ) ) ( not ( = ?auto_25277 ?auto_25288 ) ) ( not ( = ?auto_25287 ?auto_25270 ) ) ( not ( = ?auto_25287 ?auto_25282 ) ) ( not ( = ?auto_25287 ?auto_25256 ) ) ( not ( = ?auto_25287 ?auto_25280 ) ) ( not ( = ?auto_25287 ?auto_25261 ) ) ( not ( = ?auto_25287 ?auto_25281 ) ) ( not ( = ?auto_25287 ?auto_25294 ) ) ( not ( = ?auto_25287 ?auto_25276 ) ) ( not ( = ?auto_25287 ?auto_25295 ) ) ( not ( = ?auto_25287 ?auto_25267 ) ) ( not ( = ?auto_25287 ?auto_25265 ) ) ( not ( = ?auto_25283 ?auto_25284 ) ) ( not ( = ?auto_25283 ?auto_25263 ) ) ( not ( = ?auto_25283 ?auto_25285 ) ) ( not ( = ?auto_25283 ?auto_25293 ) ) ( not ( = ?auto_25283 ?auto_25279 ) ) ( not ( = ?auto_25283 ?auto_25273 ) ) ( not ( = ?auto_25283 ?auto_25286 ) ) ( not ( = ?auto_25283 ?auto_25278 ) ) ( not ( = ?auto_25283 ?auto_25292 ) ) ( not ( = ?auto_25283 ?auto_25269 ) ) ( not ( = ?auto_25283 ?auto_25271 ) ) ( not ( = ?auto_25283 ?auto_25260 ) ) ( not ( = ?auto_25283 ?auto_25290 ) ) ( not ( = ?auto_25283 ?auto_25274 ) ) ( not ( = ?auto_25236 ?auto_25252 ) ) ( not ( = ?auto_25236 ?auto_25258 ) ) ( not ( = ?auto_25237 ?auto_25252 ) ) ( not ( = ?auto_25237 ?auto_25258 ) ) ( not ( = ?auto_25238 ?auto_25252 ) ) ( not ( = ?auto_25238 ?auto_25258 ) ) ( not ( = ?auto_25239 ?auto_25252 ) ) ( not ( = ?auto_25239 ?auto_25258 ) ) ( not ( = ?auto_25240 ?auto_25252 ) ) ( not ( = ?auto_25240 ?auto_25258 ) ) ( not ( = ?auto_25241 ?auto_25252 ) ) ( not ( = ?auto_25241 ?auto_25258 ) ) ( not ( = ?auto_25242 ?auto_25252 ) ) ( not ( = ?auto_25242 ?auto_25258 ) ) ( not ( = ?auto_25243 ?auto_25252 ) ) ( not ( = ?auto_25243 ?auto_25258 ) ) ( not ( = ?auto_25244 ?auto_25252 ) ) ( not ( = ?auto_25244 ?auto_25258 ) ) ( not ( = ?auto_25245 ?auto_25252 ) ) ( not ( = ?auto_25245 ?auto_25258 ) ) ( not ( = ?auto_25246 ?auto_25252 ) ) ( not ( = ?auto_25246 ?auto_25258 ) ) ( not ( = ?auto_25247 ?auto_25252 ) ) ( not ( = ?auto_25247 ?auto_25258 ) ) ( not ( = ?auto_25248 ?auto_25252 ) ) ( not ( = ?auto_25248 ?auto_25258 ) ) ( not ( = ?auto_25249 ?auto_25252 ) ) ( not ( = ?auto_25249 ?auto_25258 ) ) ( not ( = ?auto_25251 ?auto_25252 ) ) ( not ( = ?auto_25251 ?auto_25258 ) ) ( not ( = ?auto_25252 ?auto_25283 ) ) ( not ( = ?auto_25252 ?auto_25284 ) ) ( not ( = ?auto_25252 ?auto_25263 ) ) ( not ( = ?auto_25252 ?auto_25285 ) ) ( not ( = ?auto_25252 ?auto_25293 ) ) ( not ( = ?auto_25252 ?auto_25279 ) ) ( not ( = ?auto_25252 ?auto_25273 ) ) ( not ( = ?auto_25252 ?auto_25286 ) ) ( not ( = ?auto_25252 ?auto_25278 ) ) ( not ( = ?auto_25252 ?auto_25292 ) ) ( not ( = ?auto_25252 ?auto_25269 ) ) ( not ( = ?auto_25252 ?auto_25271 ) ) ( not ( = ?auto_25252 ?auto_25260 ) ) ( not ( = ?auto_25252 ?auto_25290 ) ) ( not ( = ?auto_25252 ?auto_25274 ) ) ( not ( = ?auto_25258 ?auto_25283 ) ) ( not ( = ?auto_25258 ?auto_25284 ) ) ( not ( = ?auto_25258 ?auto_25263 ) ) ( not ( = ?auto_25258 ?auto_25285 ) ) ( not ( = ?auto_25258 ?auto_25293 ) ) ( not ( = ?auto_25258 ?auto_25279 ) ) ( not ( = ?auto_25258 ?auto_25273 ) ) ( not ( = ?auto_25258 ?auto_25286 ) ) ( not ( = ?auto_25258 ?auto_25278 ) ) ( not ( = ?auto_25258 ?auto_25292 ) ) ( not ( = ?auto_25258 ?auto_25269 ) ) ( not ( = ?auto_25258 ?auto_25271 ) ) ( not ( = ?auto_25258 ?auto_25260 ) ) ( not ( = ?auto_25258 ?auto_25290 ) ) ( not ( = ?auto_25258 ?auto_25274 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_25236 ?auto_25237 ?auto_25238 ?auto_25239 ?auto_25240 ?auto_25241 ?auto_25242 ?auto_25243 ?auto_25244 ?auto_25245 ?auto_25246 ?auto_25247 ?auto_25248 ?auto_25249 ?auto_25251 ?auto_25250 )
      ( MAKE-1CRATE ?auto_25250 ?auto_25252 )
      ( MAKE-16CRATE-VERIFY ?auto_25236 ?auto_25237 ?auto_25238 ?auto_25239 ?auto_25240 ?auto_25241 ?auto_25242 ?auto_25243 ?auto_25244 ?auto_25245 ?auto_25246 ?auto_25247 ?auto_25248 ?auto_25249 ?auto_25251 ?auto_25250 ?auto_25252 ) )
  )

)

