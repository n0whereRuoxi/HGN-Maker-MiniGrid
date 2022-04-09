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
      ?auto_2524409 - SURFACE
      ?auto_2524410 - SURFACE
    )
    :vars
    (
      ?auto_2524411 - HOIST
      ?auto_2524412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524411 ?auto_2524412 ) ( SURFACE-AT ?auto_2524409 ?auto_2524412 ) ( CLEAR ?auto_2524409 ) ( LIFTING ?auto_2524411 ?auto_2524410 ) ( IS-CRATE ?auto_2524410 ) ( not ( = ?auto_2524409 ?auto_2524410 ) ) )
    :subtasks
    ( ( !DROP ?auto_2524411 ?auto_2524410 ?auto_2524409 ?auto_2524412 )
      ( MAKE-1CRATE-VERIFY ?auto_2524409 ?auto_2524410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524413 - SURFACE
      ?auto_2524414 - SURFACE
    )
    :vars
    (
      ?auto_2524415 - HOIST
      ?auto_2524416 - PLACE
      ?auto_2524417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524415 ?auto_2524416 ) ( SURFACE-AT ?auto_2524413 ?auto_2524416 ) ( CLEAR ?auto_2524413 ) ( IS-CRATE ?auto_2524414 ) ( not ( = ?auto_2524413 ?auto_2524414 ) ) ( TRUCK-AT ?auto_2524417 ?auto_2524416 ) ( AVAILABLE ?auto_2524415 ) ( IN ?auto_2524414 ?auto_2524417 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2524415 ?auto_2524414 ?auto_2524417 ?auto_2524416 )
      ( MAKE-1CRATE ?auto_2524413 ?auto_2524414 )
      ( MAKE-1CRATE-VERIFY ?auto_2524413 ?auto_2524414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524418 - SURFACE
      ?auto_2524419 - SURFACE
    )
    :vars
    (
      ?auto_2524421 - HOIST
      ?auto_2524420 - PLACE
      ?auto_2524422 - TRUCK
      ?auto_2524423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524421 ?auto_2524420 ) ( SURFACE-AT ?auto_2524418 ?auto_2524420 ) ( CLEAR ?auto_2524418 ) ( IS-CRATE ?auto_2524419 ) ( not ( = ?auto_2524418 ?auto_2524419 ) ) ( AVAILABLE ?auto_2524421 ) ( IN ?auto_2524419 ?auto_2524422 ) ( TRUCK-AT ?auto_2524422 ?auto_2524423 ) ( not ( = ?auto_2524423 ?auto_2524420 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2524422 ?auto_2524423 ?auto_2524420 )
      ( MAKE-1CRATE ?auto_2524418 ?auto_2524419 )
      ( MAKE-1CRATE-VERIFY ?auto_2524418 ?auto_2524419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524424 - SURFACE
      ?auto_2524425 - SURFACE
    )
    :vars
    (
      ?auto_2524427 - HOIST
      ?auto_2524426 - PLACE
      ?auto_2524428 - TRUCK
      ?auto_2524429 - PLACE
      ?auto_2524430 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524427 ?auto_2524426 ) ( SURFACE-AT ?auto_2524424 ?auto_2524426 ) ( CLEAR ?auto_2524424 ) ( IS-CRATE ?auto_2524425 ) ( not ( = ?auto_2524424 ?auto_2524425 ) ) ( AVAILABLE ?auto_2524427 ) ( TRUCK-AT ?auto_2524428 ?auto_2524429 ) ( not ( = ?auto_2524429 ?auto_2524426 ) ) ( HOIST-AT ?auto_2524430 ?auto_2524429 ) ( LIFTING ?auto_2524430 ?auto_2524425 ) ( not ( = ?auto_2524427 ?auto_2524430 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2524430 ?auto_2524425 ?auto_2524428 ?auto_2524429 )
      ( MAKE-1CRATE ?auto_2524424 ?auto_2524425 )
      ( MAKE-1CRATE-VERIFY ?auto_2524424 ?auto_2524425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524431 - SURFACE
      ?auto_2524432 - SURFACE
    )
    :vars
    (
      ?auto_2524435 - HOIST
      ?auto_2524434 - PLACE
      ?auto_2524437 - TRUCK
      ?auto_2524436 - PLACE
      ?auto_2524433 - HOIST
      ?auto_2524438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524435 ?auto_2524434 ) ( SURFACE-AT ?auto_2524431 ?auto_2524434 ) ( CLEAR ?auto_2524431 ) ( IS-CRATE ?auto_2524432 ) ( not ( = ?auto_2524431 ?auto_2524432 ) ) ( AVAILABLE ?auto_2524435 ) ( TRUCK-AT ?auto_2524437 ?auto_2524436 ) ( not ( = ?auto_2524436 ?auto_2524434 ) ) ( HOIST-AT ?auto_2524433 ?auto_2524436 ) ( not ( = ?auto_2524435 ?auto_2524433 ) ) ( AVAILABLE ?auto_2524433 ) ( SURFACE-AT ?auto_2524432 ?auto_2524436 ) ( ON ?auto_2524432 ?auto_2524438 ) ( CLEAR ?auto_2524432 ) ( not ( = ?auto_2524431 ?auto_2524438 ) ) ( not ( = ?auto_2524432 ?auto_2524438 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2524433 ?auto_2524432 ?auto_2524438 ?auto_2524436 )
      ( MAKE-1CRATE ?auto_2524431 ?auto_2524432 )
      ( MAKE-1CRATE-VERIFY ?auto_2524431 ?auto_2524432 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524439 - SURFACE
      ?auto_2524440 - SURFACE
    )
    :vars
    (
      ?auto_2524445 - HOIST
      ?auto_2524443 - PLACE
      ?auto_2524446 - PLACE
      ?auto_2524441 - HOIST
      ?auto_2524444 - SURFACE
      ?auto_2524442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524445 ?auto_2524443 ) ( SURFACE-AT ?auto_2524439 ?auto_2524443 ) ( CLEAR ?auto_2524439 ) ( IS-CRATE ?auto_2524440 ) ( not ( = ?auto_2524439 ?auto_2524440 ) ) ( AVAILABLE ?auto_2524445 ) ( not ( = ?auto_2524446 ?auto_2524443 ) ) ( HOIST-AT ?auto_2524441 ?auto_2524446 ) ( not ( = ?auto_2524445 ?auto_2524441 ) ) ( AVAILABLE ?auto_2524441 ) ( SURFACE-AT ?auto_2524440 ?auto_2524446 ) ( ON ?auto_2524440 ?auto_2524444 ) ( CLEAR ?auto_2524440 ) ( not ( = ?auto_2524439 ?auto_2524444 ) ) ( not ( = ?auto_2524440 ?auto_2524444 ) ) ( TRUCK-AT ?auto_2524442 ?auto_2524443 ) )
    :subtasks
    ( ( !DRIVE ?auto_2524442 ?auto_2524443 ?auto_2524446 )
      ( MAKE-1CRATE ?auto_2524439 ?auto_2524440 )
      ( MAKE-1CRATE-VERIFY ?auto_2524439 ?auto_2524440 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524456 - SURFACE
      ?auto_2524457 - SURFACE
      ?auto_2524458 - SURFACE
    )
    :vars
    (
      ?auto_2524460 - HOIST
      ?auto_2524459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524460 ?auto_2524459 ) ( SURFACE-AT ?auto_2524457 ?auto_2524459 ) ( CLEAR ?auto_2524457 ) ( LIFTING ?auto_2524460 ?auto_2524458 ) ( IS-CRATE ?auto_2524458 ) ( not ( = ?auto_2524457 ?auto_2524458 ) ) ( ON ?auto_2524457 ?auto_2524456 ) ( not ( = ?auto_2524456 ?auto_2524457 ) ) ( not ( = ?auto_2524456 ?auto_2524458 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524457 ?auto_2524458 )
      ( MAKE-2CRATE-VERIFY ?auto_2524456 ?auto_2524457 ?auto_2524458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524466 - SURFACE
      ?auto_2524467 - SURFACE
      ?auto_2524468 - SURFACE
    )
    :vars
    (
      ?auto_2524470 - HOIST
      ?auto_2524469 - PLACE
      ?auto_2524471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524470 ?auto_2524469 ) ( SURFACE-AT ?auto_2524467 ?auto_2524469 ) ( CLEAR ?auto_2524467 ) ( IS-CRATE ?auto_2524468 ) ( not ( = ?auto_2524467 ?auto_2524468 ) ) ( TRUCK-AT ?auto_2524471 ?auto_2524469 ) ( AVAILABLE ?auto_2524470 ) ( IN ?auto_2524468 ?auto_2524471 ) ( ON ?auto_2524467 ?auto_2524466 ) ( not ( = ?auto_2524466 ?auto_2524467 ) ) ( not ( = ?auto_2524466 ?auto_2524468 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524467 ?auto_2524468 )
      ( MAKE-2CRATE-VERIFY ?auto_2524466 ?auto_2524467 ?auto_2524468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524472 - SURFACE
      ?auto_2524473 - SURFACE
    )
    :vars
    (
      ?auto_2524475 - HOIST
      ?auto_2524476 - PLACE
      ?auto_2524474 - TRUCK
      ?auto_2524477 - SURFACE
      ?auto_2524478 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524475 ?auto_2524476 ) ( SURFACE-AT ?auto_2524472 ?auto_2524476 ) ( CLEAR ?auto_2524472 ) ( IS-CRATE ?auto_2524473 ) ( not ( = ?auto_2524472 ?auto_2524473 ) ) ( AVAILABLE ?auto_2524475 ) ( IN ?auto_2524473 ?auto_2524474 ) ( ON ?auto_2524472 ?auto_2524477 ) ( not ( = ?auto_2524477 ?auto_2524472 ) ) ( not ( = ?auto_2524477 ?auto_2524473 ) ) ( TRUCK-AT ?auto_2524474 ?auto_2524478 ) ( not ( = ?auto_2524478 ?auto_2524476 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2524474 ?auto_2524478 ?auto_2524476 )
      ( MAKE-2CRATE ?auto_2524477 ?auto_2524472 ?auto_2524473 )
      ( MAKE-1CRATE-VERIFY ?auto_2524472 ?auto_2524473 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524479 - SURFACE
      ?auto_2524480 - SURFACE
      ?auto_2524481 - SURFACE
    )
    :vars
    (
      ?auto_2524485 - HOIST
      ?auto_2524482 - PLACE
      ?auto_2524484 - TRUCK
      ?auto_2524483 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524485 ?auto_2524482 ) ( SURFACE-AT ?auto_2524480 ?auto_2524482 ) ( CLEAR ?auto_2524480 ) ( IS-CRATE ?auto_2524481 ) ( not ( = ?auto_2524480 ?auto_2524481 ) ) ( AVAILABLE ?auto_2524485 ) ( IN ?auto_2524481 ?auto_2524484 ) ( ON ?auto_2524480 ?auto_2524479 ) ( not ( = ?auto_2524479 ?auto_2524480 ) ) ( not ( = ?auto_2524479 ?auto_2524481 ) ) ( TRUCK-AT ?auto_2524484 ?auto_2524483 ) ( not ( = ?auto_2524483 ?auto_2524482 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524480 ?auto_2524481 )
      ( MAKE-2CRATE-VERIFY ?auto_2524479 ?auto_2524480 ?auto_2524481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524486 - SURFACE
      ?auto_2524487 - SURFACE
    )
    :vars
    (
      ?auto_2524490 - HOIST
      ?auto_2524489 - PLACE
      ?auto_2524488 - SURFACE
      ?auto_2524492 - TRUCK
      ?auto_2524491 - PLACE
      ?auto_2524493 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524490 ?auto_2524489 ) ( SURFACE-AT ?auto_2524486 ?auto_2524489 ) ( CLEAR ?auto_2524486 ) ( IS-CRATE ?auto_2524487 ) ( not ( = ?auto_2524486 ?auto_2524487 ) ) ( AVAILABLE ?auto_2524490 ) ( ON ?auto_2524486 ?auto_2524488 ) ( not ( = ?auto_2524488 ?auto_2524486 ) ) ( not ( = ?auto_2524488 ?auto_2524487 ) ) ( TRUCK-AT ?auto_2524492 ?auto_2524491 ) ( not ( = ?auto_2524491 ?auto_2524489 ) ) ( HOIST-AT ?auto_2524493 ?auto_2524491 ) ( LIFTING ?auto_2524493 ?auto_2524487 ) ( not ( = ?auto_2524490 ?auto_2524493 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2524493 ?auto_2524487 ?auto_2524492 ?auto_2524491 )
      ( MAKE-2CRATE ?auto_2524488 ?auto_2524486 ?auto_2524487 )
      ( MAKE-1CRATE-VERIFY ?auto_2524486 ?auto_2524487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524494 - SURFACE
      ?auto_2524495 - SURFACE
      ?auto_2524496 - SURFACE
    )
    :vars
    (
      ?auto_2524497 - HOIST
      ?auto_2524498 - PLACE
      ?auto_2524499 - TRUCK
      ?auto_2524500 - PLACE
      ?auto_2524501 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524497 ?auto_2524498 ) ( SURFACE-AT ?auto_2524495 ?auto_2524498 ) ( CLEAR ?auto_2524495 ) ( IS-CRATE ?auto_2524496 ) ( not ( = ?auto_2524495 ?auto_2524496 ) ) ( AVAILABLE ?auto_2524497 ) ( ON ?auto_2524495 ?auto_2524494 ) ( not ( = ?auto_2524494 ?auto_2524495 ) ) ( not ( = ?auto_2524494 ?auto_2524496 ) ) ( TRUCK-AT ?auto_2524499 ?auto_2524500 ) ( not ( = ?auto_2524500 ?auto_2524498 ) ) ( HOIST-AT ?auto_2524501 ?auto_2524500 ) ( LIFTING ?auto_2524501 ?auto_2524496 ) ( not ( = ?auto_2524497 ?auto_2524501 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524495 ?auto_2524496 )
      ( MAKE-2CRATE-VERIFY ?auto_2524494 ?auto_2524495 ?auto_2524496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524502 - SURFACE
      ?auto_2524503 - SURFACE
    )
    :vars
    (
      ?auto_2524504 - HOIST
      ?auto_2524505 - PLACE
      ?auto_2524507 - SURFACE
      ?auto_2524508 - TRUCK
      ?auto_2524509 - PLACE
      ?auto_2524506 - HOIST
      ?auto_2524510 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524504 ?auto_2524505 ) ( SURFACE-AT ?auto_2524502 ?auto_2524505 ) ( CLEAR ?auto_2524502 ) ( IS-CRATE ?auto_2524503 ) ( not ( = ?auto_2524502 ?auto_2524503 ) ) ( AVAILABLE ?auto_2524504 ) ( ON ?auto_2524502 ?auto_2524507 ) ( not ( = ?auto_2524507 ?auto_2524502 ) ) ( not ( = ?auto_2524507 ?auto_2524503 ) ) ( TRUCK-AT ?auto_2524508 ?auto_2524509 ) ( not ( = ?auto_2524509 ?auto_2524505 ) ) ( HOIST-AT ?auto_2524506 ?auto_2524509 ) ( not ( = ?auto_2524504 ?auto_2524506 ) ) ( AVAILABLE ?auto_2524506 ) ( SURFACE-AT ?auto_2524503 ?auto_2524509 ) ( ON ?auto_2524503 ?auto_2524510 ) ( CLEAR ?auto_2524503 ) ( not ( = ?auto_2524502 ?auto_2524510 ) ) ( not ( = ?auto_2524503 ?auto_2524510 ) ) ( not ( = ?auto_2524507 ?auto_2524510 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2524506 ?auto_2524503 ?auto_2524510 ?auto_2524509 )
      ( MAKE-2CRATE ?auto_2524507 ?auto_2524502 ?auto_2524503 )
      ( MAKE-1CRATE-VERIFY ?auto_2524502 ?auto_2524503 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524511 - SURFACE
      ?auto_2524512 - SURFACE
      ?auto_2524513 - SURFACE
    )
    :vars
    (
      ?auto_2524517 - HOIST
      ?auto_2524518 - PLACE
      ?auto_2524515 - TRUCK
      ?auto_2524514 - PLACE
      ?auto_2524516 - HOIST
      ?auto_2524519 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524517 ?auto_2524518 ) ( SURFACE-AT ?auto_2524512 ?auto_2524518 ) ( CLEAR ?auto_2524512 ) ( IS-CRATE ?auto_2524513 ) ( not ( = ?auto_2524512 ?auto_2524513 ) ) ( AVAILABLE ?auto_2524517 ) ( ON ?auto_2524512 ?auto_2524511 ) ( not ( = ?auto_2524511 ?auto_2524512 ) ) ( not ( = ?auto_2524511 ?auto_2524513 ) ) ( TRUCK-AT ?auto_2524515 ?auto_2524514 ) ( not ( = ?auto_2524514 ?auto_2524518 ) ) ( HOIST-AT ?auto_2524516 ?auto_2524514 ) ( not ( = ?auto_2524517 ?auto_2524516 ) ) ( AVAILABLE ?auto_2524516 ) ( SURFACE-AT ?auto_2524513 ?auto_2524514 ) ( ON ?auto_2524513 ?auto_2524519 ) ( CLEAR ?auto_2524513 ) ( not ( = ?auto_2524512 ?auto_2524519 ) ) ( not ( = ?auto_2524513 ?auto_2524519 ) ) ( not ( = ?auto_2524511 ?auto_2524519 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524512 ?auto_2524513 )
      ( MAKE-2CRATE-VERIFY ?auto_2524511 ?auto_2524512 ?auto_2524513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524520 - SURFACE
      ?auto_2524521 - SURFACE
    )
    :vars
    (
      ?auto_2524523 - HOIST
      ?auto_2524524 - PLACE
      ?auto_2524525 - SURFACE
      ?auto_2524527 - PLACE
      ?auto_2524522 - HOIST
      ?auto_2524528 - SURFACE
      ?auto_2524526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524523 ?auto_2524524 ) ( SURFACE-AT ?auto_2524520 ?auto_2524524 ) ( CLEAR ?auto_2524520 ) ( IS-CRATE ?auto_2524521 ) ( not ( = ?auto_2524520 ?auto_2524521 ) ) ( AVAILABLE ?auto_2524523 ) ( ON ?auto_2524520 ?auto_2524525 ) ( not ( = ?auto_2524525 ?auto_2524520 ) ) ( not ( = ?auto_2524525 ?auto_2524521 ) ) ( not ( = ?auto_2524527 ?auto_2524524 ) ) ( HOIST-AT ?auto_2524522 ?auto_2524527 ) ( not ( = ?auto_2524523 ?auto_2524522 ) ) ( AVAILABLE ?auto_2524522 ) ( SURFACE-AT ?auto_2524521 ?auto_2524527 ) ( ON ?auto_2524521 ?auto_2524528 ) ( CLEAR ?auto_2524521 ) ( not ( = ?auto_2524520 ?auto_2524528 ) ) ( not ( = ?auto_2524521 ?auto_2524528 ) ) ( not ( = ?auto_2524525 ?auto_2524528 ) ) ( TRUCK-AT ?auto_2524526 ?auto_2524524 ) )
    :subtasks
    ( ( !DRIVE ?auto_2524526 ?auto_2524524 ?auto_2524527 )
      ( MAKE-2CRATE ?auto_2524525 ?auto_2524520 ?auto_2524521 )
      ( MAKE-1CRATE-VERIFY ?auto_2524520 ?auto_2524521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524529 - SURFACE
      ?auto_2524530 - SURFACE
      ?auto_2524531 - SURFACE
    )
    :vars
    (
      ?auto_2524535 - HOIST
      ?auto_2524537 - PLACE
      ?auto_2524533 - PLACE
      ?auto_2524532 - HOIST
      ?auto_2524534 - SURFACE
      ?auto_2524536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524535 ?auto_2524537 ) ( SURFACE-AT ?auto_2524530 ?auto_2524537 ) ( CLEAR ?auto_2524530 ) ( IS-CRATE ?auto_2524531 ) ( not ( = ?auto_2524530 ?auto_2524531 ) ) ( AVAILABLE ?auto_2524535 ) ( ON ?auto_2524530 ?auto_2524529 ) ( not ( = ?auto_2524529 ?auto_2524530 ) ) ( not ( = ?auto_2524529 ?auto_2524531 ) ) ( not ( = ?auto_2524533 ?auto_2524537 ) ) ( HOIST-AT ?auto_2524532 ?auto_2524533 ) ( not ( = ?auto_2524535 ?auto_2524532 ) ) ( AVAILABLE ?auto_2524532 ) ( SURFACE-AT ?auto_2524531 ?auto_2524533 ) ( ON ?auto_2524531 ?auto_2524534 ) ( CLEAR ?auto_2524531 ) ( not ( = ?auto_2524530 ?auto_2524534 ) ) ( not ( = ?auto_2524531 ?auto_2524534 ) ) ( not ( = ?auto_2524529 ?auto_2524534 ) ) ( TRUCK-AT ?auto_2524536 ?auto_2524537 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524530 ?auto_2524531 )
      ( MAKE-2CRATE-VERIFY ?auto_2524529 ?auto_2524530 ?auto_2524531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524538 - SURFACE
      ?auto_2524539 - SURFACE
    )
    :vars
    (
      ?auto_2524540 - HOIST
      ?auto_2524543 - PLACE
      ?auto_2524545 - SURFACE
      ?auto_2524541 - PLACE
      ?auto_2524544 - HOIST
      ?auto_2524542 - SURFACE
      ?auto_2524546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524540 ?auto_2524543 ) ( IS-CRATE ?auto_2524539 ) ( not ( = ?auto_2524538 ?auto_2524539 ) ) ( not ( = ?auto_2524545 ?auto_2524538 ) ) ( not ( = ?auto_2524545 ?auto_2524539 ) ) ( not ( = ?auto_2524541 ?auto_2524543 ) ) ( HOIST-AT ?auto_2524544 ?auto_2524541 ) ( not ( = ?auto_2524540 ?auto_2524544 ) ) ( AVAILABLE ?auto_2524544 ) ( SURFACE-AT ?auto_2524539 ?auto_2524541 ) ( ON ?auto_2524539 ?auto_2524542 ) ( CLEAR ?auto_2524539 ) ( not ( = ?auto_2524538 ?auto_2524542 ) ) ( not ( = ?auto_2524539 ?auto_2524542 ) ) ( not ( = ?auto_2524545 ?auto_2524542 ) ) ( TRUCK-AT ?auto_2524546 ?auto_2524543 ) ( SURFACE-AT ?auto_2524545 ?auto_2524543 ) ( CLEAR ?auto_2524545 ) ( LIFTING ?auto_2524540 ?auto_2524538 ) ( IS-CRATE ?auto_2524538 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524545 ?auto_2524538 )
      ( MAKE-2CRATE ?auto_2524545 ?auto_2524538 ?auto_2524539 )
      ( MAKE-1CRATE-VERIFY ?auto_2524538 ?auto_2524539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524547 - SURFACE
      ?auto_2524548 - SURFACE
      ?auto_2524549 - SURFACE
    )
    :vars
    (
      ?auto_2524550 - HOIST
      ?auto_2524553 - PLACE
      ?auto_2524554 - PLACE
      ?auto_2524555 - HOIST
      ?auto_2524552 - SURFACE
      ?auto_2524551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524550 ?auto_2524553 ) ( IS-CRATE ?auto_2524549 ) ( not ( = ?auto_2524548 ?auto_2524549 ) ) ( not ( = ?auto_2524547 ?auto_2524548 ) ) ( not ( = ?auto_2524547 ?auto_2524549 ) ) ( not ( = ?auto_2524554 ?auto_2524553 ) ) ( HOIST-AT ?auto_2524555 ?auto_2524554 ) ( not ( = ?auto_2524550 ?auto_2524555 ) ) ( AVAILABLE ?auto_2524555 ) ( SURFACE-AT ?auto_2524549 ?auto_2524554 ) ( ON ?auto_2524549 ?auto_2524552 ) ( CLEAR ?auto_2524549 ) ( not ( = ?auto_2524548 ?auto_2524552 ) ) ( not ( = ?auto_2524549 ?auto_2524552 ) ) ( not ( = ?auto_2524547 ?auto_2524552 ) ) ( TRUCK-AT ?auto_2524551 ?auto_2524553 ) ( SURFACE-AT ?auto_2524547 ?auto_2524553 ) ( CLEAR ?auto_2524547 ) ( LIFTING ?auto_2524550 ?auto_2524548 ) ( IS-CRATE ?auto_2524548 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524548 ?auto_2524549 )
      ( MAKE-2CRATE-VERIFY ?auto_2524547 ?auto_2524548 ?auto_2524549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524556 - SURFACE
      ?auto_2524557 - SURFACE
    )
    :vars
    (
      ?auto_2524564 - HOIST
      ?auto_2524558 - PLACE
      ?auto_2524563 - SURFACE
      ?auto_2524559 - PLACE
      ?auto_2524561 - HOIST
      ?auto_2524560 - SURFACE
      ?auto_2524562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524564 ?auto_2524558 ) ( IS-CRATE ?auto_2524557 ) ( not ( = ?auto_2524556 ?auto_2524557 ) ) ( not ( = ?auto_2524563 ?auto_2524556 ) ) ( not ( = ?auto_2524563 ?auto_2524557 ) ) ( not ( = ?auto_2524559 ?auto_2524558 ) ) ( HOIST-AT ?auto_2524561 ?auto_2524559 ) ( not ( = ?auto_2524564 ?auto_2524561 ) ) ( AVAILABLE ?auto_2524561 ) ( SURFACE-AT ?auto_2524557 ?auto_2524559 ) ( ON ?auto_2524557 ?auto_2524560 ) ( CLEAR ?auto_2524557 ) ( not ( = ?auto_2524556 ?auto_2524560 ) ) ( not ( = ?auto_2524557 ?auto_2524560 ) ) ( not ( = ?auto_2524563 ?auto_2524560 ) ) ( TRUCK-AT ?auto_2524562 ?auto_2524558 ) ( SURFACE-AT ?auto_2524563 ?auto_2524558 ) ( CLEAR ?auto_2524563 ) ( IS-CRATE ?auto_2524556 ) ( AVAILABLE ?auto_2524564 ) ( IN ?auto_2524556 ?auto_2524562 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2524564 ?auto_2524556 ?auto_2524562 ?auto_2524558 )
      ( MAKE-2CRATE ?auto_2524563 ?auto_2524556 ?auto_2524557 )
      ( MAKE-1CRATE-VERIFY ?auto_2524556 ?auto_2524557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2524565 - SURFACE
      ?auto_2524566 - SURFACE
      ?auto_2524567 - SURFACE
    )
    :vars
    (
      ?auto_2524571 - HOIST
      ?auto_2524572 - PLACE
      ?auto_2524569 - PLACE
      ?auto_2524573 - HOIST
      ?auto_2524570 - SURFACE
      ?auto_2524568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524571 ?auto_2524572 ) ( IS-CRATE ?auto_2524567 ) ( not ( = ?auto_2524566 ?auto_2524567 ) ) ( not ( = ?auto_2524565 ?auto_2524566 ) ) ( not ( = ?auto_2524565 ?auto_2524567 ) ) ( not ( = ?auto_2524569 ?auto_2524572 ) ) ( HOIST-AT ?auto_2524573 ?auto_2524569 ) ( not ( = ?auto_2524571 ?auto_2524573 ) ) ( AVAILABLE ?auto_2524573 ) ( SURFACE-AT ?auto_2524567 ?auto_2524569 ) ( ON ?auto_2524567 ?auto_2524570 ) ( CLEAR ?auto_2524567 ) ( not ( = ?auto_2524566 ?auto_2524570 ) ) ( not ( = ?auto_2524567 ?auto_2524570 ) ) ( not ( = ?auto_2524565 ?auto_2524570 ) ) ( TRUCK-AT ?auto_2524568 ?auto_2524572 ) ( SURFACE-AT ?auto_2524565 ?auto_2524572 ) ( CLEAR ?auto_2524565 ) ( IS-CRATE ?auto_2524566 ) ( AVAILABLE ?auto_2524571 ) ( IN ?auto_2524566 ?auto_2524568 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524566 ?auto_2524567 )
      ( MAKE-2CRATE-VERIFY ?auto_2524565 ?auto_2524566 ?auto_2524567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2524610 - SURFACE
      ?auto_2524611 - SURFACE
    )
    :vars
    (
      ?auto_2524615 - HOIST
      ?auto_2524612 - PLACE
      ?auto_2524617 - SURFACE
      ?auto_2524614 - PLACE
      ?auto_2524618 - HOIST
      ?auto_2524613 - SURFACE
      ?auto_2524616 - TRUCK
      ?auto_2524619 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524615 ?auto_2524612 ) ( SURFACE-AT ?auto_2524610 ?auto_2524612 ) ( CLEAR ?auto_2524610 ) ( IS-CRATE ?auto_2524611 ) ( not ( = ?auto_2524610 ?auto_2524611 ) ) ( AVAILABLE ?auto_2524615 ) ( ON ?auto_2524610 ?auto_2524617 ) ( not ( = ?auto_2524617 ?auto_2524610 ) ) ( not ( = ?auto_2524617 ?auto_2524611 ) ) ( not ( = ?auto_2524614 ?auto_2524612 ) ) ( HOIST-AT ?auto_2524618 ?auto_2524614 ) ( not ( = ?auto_2524615 ?auto_2524618 ) ) ( AVAILABLE ?auto_2524618 ) ( SURFACE-AT ?auto_2524611 ?auto_2524614 ) ( ON ?auto_2524611 ?auto_2524613 ) ( CLEAR ?auto_2524611 ) ( not ( = ?auto_2524610 ?auto_2524613 ) ) ( not ( = ?auto_2524611 ?auto_2524613 ) ) ( not ( = ?auto_2524617 ?auto_2524613 ) ) ( TRUCK-AT ?auto_2524616 ?auto_2524619 ) ( not ( = ?auto_2524619 ?auto_2524612 ) ) ( not ( = ?auto_2524614 ?auto_2524619 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2524616 ?auto_2524619 ?auto_2524612 )
      ( MAKE-1CRATE ?auto_2524610 ?auto_2524611 )
      ( MAKE-1CRATE-VERIFY ?auto_2524610 ?auto_2524611 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524649 - SURFACE
      ?auto_2524650 - SURFACE
      ?auto_2524651 - SURFACE
      ?auto_2524652 - SURFACE
    )
    :vars
    (
      ?auto_2524653 - HOIST
      ?auto_2524654 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524653 ?auto_2524654 ) ( SURFACE-AT ?auto_2524651 ?auto_2524654 ) ( CLEAR ?auto_2524651 ) ( LIFTING ?auto_2524653 ?auto_2524652 ) ( IS-CRATE ?auto_2524652 ) ( not ( = ?auto_2524651 ?auto_2524652 ) ) ( ON ?auto_2524650 ?auto_2524649 ) ( ON ?auto_2524651 ?auto_2524650 ) ( not ( = ?auto_2524649 ?auto_2524650 ) ) ( not ( = ?auto_2524649 ?auto_2524651 ) ) ( not ( = ?auto_2524649 ?auto_2524652 ) ) ( not ( = ?auto_2524650 ?auto_2524651 ) ) ( not ( = ?auto_2524650 ?auto_2524652 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2524651 ?auto_2524652 )
      ( MAKE-3CRATE-VERIFY ?auto_2524649 ?auto_2524650 ?auto_2524651 ?auto_2524652 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524666 - SURFACE
      ?auto_2524667 - SURFACE
      ?auto_2524668 - SURFACE
      ?auto_2524669 - SURFACE
    )
    :vars
    (
      ?auto_2524670 - HOIST
      ?auto_2524672 - PLACE
      ?auto_2524671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524670 ?auto_2524672 ) ( SURFACE-AT ?auto_2524668 ?auto_2524672 ) ( CLEAR ?auto_2524668 ) ( IS-CRATE ?auto_2524669 ) ( not ( = ?auto_2524668 ?auto_2524669 ) ) ( TRUCK-AT ?auto_2524671 ?auto_2524672 ) ( AVAILABLE ?auto_2524670 ) ( IN ?auto_2524669 ?auto_2524671 ) ( ON ?auto_2524668 ?auto_2524667 ) ( not ( = ?auto_2524667 ?auto_2524668 ) ) ( not ( = ?auto_2524667 ?auto_2524669 ) ) ( ON ?auto_2524667 ?auto_2524666 ) ( not ( = ?auto_2524666 ?auto_2524667 ) ) ( not ( = ?auto_2524666 ?auto_2524668 ) ) ( not ( = ?auto_2524666 ?auto_2524669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524667 ?auto_2524668 ?auto_2524669 )
      ( MAKE-3CRATE-VERIFY ?auto_2524666 ?auto_2524667 ?auto_2524668 ?auto_2524669 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524687 - SURFACE
      ?auto_2524688 - SURFACE
      ?auto_2524689 - SURFACE
      ?auto_2524690 - SURFACE
    )
    :vars
    (
      ?auto_2524691 - HOIST
      ?auto_2524693 - PLACE
      ?auto_2524692 - TRUCK
      ?auto_2524694 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524691 ?auto_2524693 ) ( SURFACE-AT ?auto_2524689 ?auto_2524693 ) ( CLEAR ?auto_2524689 ) ( IS-CRATE ?auto_2524690 ) ( not ( = ?auto_2524689 ?auto_2524690 ) ) ( AVAILABLE ?auto_2524691 ) ( IN ?auto_2524690 ?auto_2524692 ) ( ON ?auto_2524689 ?auto_2524688 ) ( not ( = ?auto_2524688 ?auto_2524689 ) ) ( not ( = ?auto_2524688 ?auto_2524690 ) ) ( TRUCK-AT ?auto_2524692 ?auto_2524694 ) ( not ( = ?auto_2524694 ?auto_2524693 ) ) ( ON ?auto_2524688 ?auto_2524687 ) ( not ( = ?auto_2524687 ?auto_2524688 ) ) ( not ( = ?auto_2524687 ?auto_2524689 ) ) ( not ( = ?auto_2524687 ?auto_2524690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524688 ?auto_2524689 ?auto_2524690 )
      ( MAKE-3CRATE-VERIFY ?auto_2524687 ?auto_2524688 ?auto_2524689 ?auto_2524690 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524711 - SURFACE
      ?auto_2524712 - SURFACE
      ?auto_2524713 - SURFACE
      ?auto_2524714 - SURFACE
    )
    :vars
    (
      ?auto_2524715 - HOIST
      ?auto_2524717 - PLACE
      ?auto_2524719 - TRUCK
      ?auto_2524716 - PLACE
      ?auto_2524718 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524715 ?auto_2524717 ) ( SURFACE-AT ?auto_2524713 ?auto_2524717 ) ( CLEAR ?auto_2524713 ) ( IS-CRATE ?auto_2524714 ) ( not ( = ?auto_2524713 ?auto_2524714 ) ) ( AVAILABLE ?auto_2524715 ) ( ON ?auto_2524713 ?auto_2524712 ) ( not ( = ?auto_2524712 ?auto_2524713 ) ) ( not ( = ?auto_2524712 ?auto_2524714 ) ) ( TRUCK-AT ?auto_2524719 ?auto_2524716 ) ( not ( = ?auto_2524716 ?auto_2524717 ) ) ( HOIST-AT ?auto_2524718 ?auto_2524716 ) ( LIFTING ?auto_2524718 ?auto_2524714 ) ( not ( = ?auto_2524715 ?auto_2524718 ) ) ( ON ?auto_2524712 ?auto_2524711 ) ( not ( = ?auto_2524711 ?auto_2524712 ) ) ( not ( = ?auto_2524711 ?auto_2524713 ) ) ( not ( = ?auto_2524711 ?auto_2524714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524712 ?auto_2524713 ?auto_2524714 )
      ( MAKE-3CRATE-VERIFY ?auto_2524711 ?auto_2524712 ?auto_2524713 ?auto_2524714 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524738 - SURFACE
      ?auto_2524739 - SURFACE
      ?auto_2524740 - SURFACE
      ?auto_2524741 - SURFACE
    )
    :vars
    (
      ?auto_2524746 - HOIST
      ?auto_2524743 - PLACE
      ?auto_2524747 - TRUCK
      ?auto_2524744 - PLACE
      ?auto_2524742 - HOIST
      ?auto_2524745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524746 ?auto_2524743 ) ( SURFACE-AT ?auto_2524740 ?auto_2524743 ) ( CLEAR ?auto_2524740 ) ( IS-CRATE ?auto_2524741 ) ( not ( = ?auto_2524740 ?auto_2524741 ) ) ( AVAILABLE ?auto_2524746 ) ( ON ?auto_2524740 ?auto_2524739 ) ( not ( = ?auto_2524739 ?auto_2524740 ) ) ( not ( = ?auto_2524739 ?auto_2524741 ) ) ( TRUCK-AT ?auto_2524747 ?auto_2524744 ) ( not ( = ?auto_2524744 ?auto_2524743 ) ) ( HOIST-AT ?auto_2524742 ?auto_2524744 ) ( not ( = ?auto_2524746 ?auto_2524742 ) ) ( AVAILABLE ?auto_2524742 ) ( SURFACE-AT ?auto_2524741 ?auto_2524744 ) ( ON ?auto_2524741 ?auto_2524745 ) ( CLEAR ?auto_2524741 ) ( not ( = ?auto_2524740 ?auto_2524745 ) ) ( not ( = ?auto_2524741 ?auto_2524745 ) ) ( not ( = ?auto_2524739 ?auto_2524745 ) ) ( ON ?auto_2524739 ?auto_2524738 ) ( not ( = ?auto_2524738 ?auto_2524739 ) ) ( not ( = ?auto_2524738 ?auto_2524740 ) ) ( not ( = ?auto_2524738 ?auto_2524741 ) ) ( not ( = ?auto_2524738 ?auto_2524745 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524739 ?auto_2524740 ?auto_2524741 )
      ( MAKE-3CRATE-VERIFY ?auto_2524738 ?auto_2524739 ?auto_2524740 ?auto_2524741 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524766 - SURFACE
      ?auto_2524767 - SURFACE
      ?auto_2524768 - SURFACE
      ?auto_2524769 - SURFACE
    )
    :vars
    (
      ?auto_2524773 - HOIST
      ?auto_2524771 - PLACE
      ?auto_2524770 - PLACE
      ?auto_2524772 - HOIST
      ?auto_2524775 - SURFACE
      ?auto_2524774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524773 ?auto_2524771 ) ( SURFACE-AT ?auto_2524768 ?auto_2524771 ) ( CLEAR ?auto_2524768 ) ( IS-CRATE ?auto_2524769 ) ( not ( = ?auto_2524768 ?auto_2524769 ) ) ( AVAILABLE ?auto_2524773 ) ( ON ?auto_2524768 ?auto_2524767 ) ( not ( = ?auto_2524767 ?auto_2524768 ) ) ( not ( = ?auto_2524767 ?auto_2524769 ) ) ( not ( = ?auto_2524770 ?auto_2524771 ) ) ( HOIST-AT ?auto_2524772 ?auto_2524770 ) ( not ( = ?auto_2524773 ?auto_2524772 ) ) ( AVAILABLE ?auto_2524772 ) ( SURFACE-AT ?auto_2524769 ?auto_2524770 ) ( ON ?auto_2524769 ?auto_2524775 ) ( CLEAR ?auto_2524769 ) ( not ( = ?auto_2524768 ?auto_2524775 ) ) ( not ( = ?auto_2524769 ?auto_2524775 ) ) ( not ( = ?auto_2524767 ?auto_2524775 ) ) ( TRUCK-AT ?auto_2524774 ?auto_2524771 ) ( ON ?auto_2524767 ?auto_2524766 ) ( not ( = ?auto_2524766 ?auto_2524767 ) ) ( not ( = ?auto_2524766 ?auto_2524768 ) ) ( not ( = ?auto_2524766 ?auto_2524769 ) ) ( not ( = ?auto_2524766 ?auto_2524775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524767 ?auto_2524768 ?auto_2524769 )
      ( MAKE-3CRATE-VERIFY ?auto_2524766 ?auto_2524767 ?auto_2524768 ?auto_2524769 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524794 - SURFACE
      ?auto_2524795 - SURFACE
      ?auto_2524796 - SURFACE
      ?auto_2524797 - SURFACE
    )
    :vars
    (
      ?auto_2524802 - HOIST
      ?auto_2524803 - PLACE
      ?auto_2524799 - PLACE
      ?auto_2524798 - HOIST
      ?auto_2524801 - SURFACE
      ?auto_2524800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524802 ?auto_2524803 ) ( IS-CRATE ?auto_2524797 ) ( not ( = ?auto_2524796 ?auto_2524797 ) ) ( not ( = ?auto_2524795 ?auto_2524796 ) ) ( not ( = ?auto_2524795 ?auto_2524797 ) ) ( not ( = ?auto_2524799 ?auto_2524803 ) ) ( HOIST-AT ?auto_2524798 ?auto_2524799 ) ( not ( = ?auto_2524802 ?auto_2524798 ) ) ( AVAILABLE ?auto_2524798 ) ( SURFACE-AT ?auto_2524797 ?auto_2524799 ) ( ON ?auto_2524797 ?auto_2524801 ) ( CLEAR ?auto_2524797 ) ( not ( = ?auto_2524796 ?auto_2524801 ) ) ( not ( = ?auto_2524797 ?auto_2524801 ) ) ( not ( = ?auto_2524795 ?auto_2524801 ) ) ( TRUCK-AT ?auto_2524800 ?auto_2524803 ) ( SURFACE-AT ?auto_2524795 ?auto_2524803 ) ( CLEAR ?auto_2524795 ) ( LIFTING ?auto_2524802 ?auto_2524796 ) ( IS-CRATE ?auto_2524796 ) ( ON ?auto_2524795 ?auto_2524794 ) ( not ( = ?auto_2524794 ?auto_2524795 ) ) ( not ( = ?auto_2524794 ?auto_2524796 ) ) ( not ( = ?auto_2524794 ?auto_2524797 ) ) ( not ( = ?auto_2524794 ?auto_2524801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524795 ?auto_2524796 ?auto_2524797 )
      ( MAKE-3CRATE-VERIFY ?auto_2524794 ?auto_2524795 ?auto_2524796 ?auto_2524797 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2524822 - SURFACE
      ?auto_2524823 - SURFACE
      ?auto_2524824 - SURFACE
      ?auto_2524825 - SURFACE
    )
    :vars
    (
      ?auto_2524829 - HOIST
      ?auto_2524828 - PLACE
      ?auto_2524826 - PLACE
      ?auto_2524830 - HOIST
      ?auto_2524831 - SURFACE
      ?auto_2524827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524829 ?auto_2524828 ) ( IS-CRATE ?auto_2524825 ) ( not ( = ?auto_2524824 ?auto_2524825 ) ) ( not ( = ?auto_2524823 ?auto_2524824 ) ) ( not ( = ?auto_2524823 ?auto_2524825 ) ) ( not ( = ?auto_2524826 ?auto_2524828 ) ) ( HOIST-AT ?auto_2524830 ?auto_2524826 ) ( not ( = ?auto_2524829 ?auto_2524830 ) ) ( AVAILABLE ?auto_2524830 ) ( SURFACE-AT ?auto_2524825 ?auto_2524826 ) ( ON ?auto_2524825 ?auto_2524831 ) ( CLEAR ?auto_2524825 ) ( not ( = ?auto_2524824 ?auto_2524831 ) ) ( not ( = ?auto_2524825 ?auto_2524831 ) ) ( not ( = ?auto_2524823 ?auto_2524831 ) ) ( TRUCK-AT ?auto_2524827 ?auto_2524828 ) ( SURFACE-AT ?auto_2524823 ?auto_2524828 ) ( CLEAR ?auto_2524823 ) ( IS-CRATE ?auto_2524824 ) ( AVAILABLE ?auto_2524829 ) ( IN ?auto_2524824 ?auto_2524827 ) ( ON ?auto_2524823 ?auto_2524822 ) ( not ( = ?auto_2524822 ?auto_2524823 ) ) ( not ( = ?auto_2524822 ?auto_2524824 ) ) ( not ( = ?auto_2524822 ?auto_2524825 ) ) ( not ( = ?auto_2524822 ?auto_2524831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2524823 ?auto_2524824 ?auto_2524825 )
      ( MAKE-3CRATE-VERIFY ?auto_2524822 ?auto_2524823 ?auto_2524824 ?auto_2524825 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525113 - SURFACE
      ?auto_2525114 - SURFACE
      ?auto_2525115 - SURFACE
      ?auto_2525116 - SURFACE
      ?auto_2525117 - SURFACE
    )
    :vars
    (
      ?auto_2525119 - HOIST
      ?auto_2525118 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525119 ?auto_2525118 ) ( SURFACE-AT ?auto_2525116 ?auto_2525118 ) ( CLEAR ?auto_2525116 ) ( LIFTING ?auto_2525119 ?auto_2525117 ) ( IS-CRATE ?auto_2525117 ) ( not ( = ?auto_2525116 ?auto_2525117 ) ) ( ON ?auto_2525114 ?auto_2525113 ) ( ON ?auto_2525115 ?auto_2525114 ) ( ON ?auto_2525116 ?auto_2525115 ) ( not ( = ?auto_2525113 ?auto_2525114 ) ) ( not ( = ?auto_2525113 ?auto_2525115 ) ) ( not ( = ?auto_2525113 ?auto_2525116 ) ) ( not ( = ?auto_2525113 ?auto_2525117 ) ) ( not ( = ?auto_2525114 ?auto_2525115 ) ) ( not ( = ?auto_2525114 ?auto_2525116 ) ) ( not ( = ?auto_2525114 ?auto_2525117 ) ) ( not ( = ?auto_2525115 ?auto_2525116 ) ) ( not ( = ?auto_2525115 ?auto_2525117 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2525116 ?auto_2525117 )
      ( MAKE-4CRATE-VERIFY ?auto_2525113 ?auto_2525114 ?auto_2525115 ?auto_2525116 ?auto_2525117 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525138 - SURFACE
      ?auto_2525139 - SURFACE
      ?auto_2525140 - SURFACE
      ?auto_2525141 - SURFACE
      ?auto_2525142 - SURFACE
    )
    :vars
    (
      ?auto_2525143 - HOIST
      ?auto_2525145 - PLACE
      ?auto_2525144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525143 ?auto_2525145 ) ( SURFACE-AT ?auto_2525141 ?auto_2525145 ) ( CLEAR ?auto_2525141 ) ( IS-CRATE ?auto_2525142 ) ( not ( = ?auto_2525141 ?auto_2525142 ) ) ( TRUCK-AT ?auto_2525144 ?auto_2525145 ) ( AVAILABLE ?auto_2525143 ) ( IN ?auto_2525142 ?auto_2525144 ) ( ON ?auto_2525141 ?auto_2525140 ) ( not ( = ?auto_2525140 ?auto_2525141 ) ) ( not ( = ?auto_2525140 ?auto_2525142 ) ) ( ON ?auto_2525139 ?auto_2525138 ) ( ON ?auto_2525140 ?auto_2525139 ) ( not ( = ?auto_2525138 ?auto_2525139 ) ) ( not ( = ?auto_2525138 ?auto_2525140 ) ) ( not ( = ?auto_2525138 ?auto_2525141 ) ) ( not ( = ?auto_2525138 ?auto_2525142 ) ) ( not ( = ?auto_2525139 ?auto_2525140 ) ) ( not ( = ?auto_2525139 ?auto_2525141 ) ) ( not ( = ?auto_2525139 ?auto_2525142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525140 ?auto_2525141 ?auto_2525142 )
      ( MAKE-4CRATE-VERIFY ?auto_2525138 ?auto_2525139 ?auto_2525140 ?auto_2525141 ?auto_2525142 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525168 - SURFACE
      ?auto_2525169 - SURFACE
      ?auto_2525170 - SURFACE
      ?auto_2525171 - SURFACE
      ?auto_2525172 - SURFACE
    )
    :vars
    (
      ?auto_2525175 - HOIST
      ?auto_2525174 - PLACE
      ?auto_2525173 - TRUCK
      ?auto_2525176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525175 ?auto_2525174 ) ( SURFACE-AT ?auto_2525171 ?auto_2525174 ) ( CLEAR ?auto_2525171 ) ( IS-CRATE ?auto_2525172 ) ( not ( = ?auto_2525171 ?auto_2525172 ) ) ( AVAILABLE ?auto_2525175 ) ( IN ?auto_2525172 ?auto_2525173 ) ( ON ?auto_2525171 ?auto_2525170 ) ( not ( = ?auto_2525170 ?auto_2525171 ) ) ( not ( = ?auto_2525170 ?auto_2525172 ) ) ( TRUCK-AT ?auto_2525173 ?auto_2525176 ) ( not ( = ?auto_2525176 ?auto_2525174 ) ) ( ON ?auto_2525169 ?auto_2525168 ) ( ON ?auto_2525170 ?auto_2525169 ) ( not ( = ?auto_2525168 ?auto_2525169 ) ) ( not ( = ?auto_2525168 ?auto_2525170 ) ) ( not ( = ?auto_2525168 ?auto_2525171 ) ) ( not ( = ?auto_2525168 ?auto_2525172 ) ) ( not ( = ?auto_2525169 ?auto_2525170 ) ) ( not ( = ?auto_2525169 ?auto_2525171 ) ) ( not ( = ?auto_2525169 ?auto_2525172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525170 ?auto_2525171 ?auto_2525172 )
      ( MAKE-4CRATE-VERIFY ?auto_2525168 ?auto_2525169 ?auto_2525170 ?auto_2525171 ?auto_2525172 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525202 - SURFACE
      ?auto_2525203 - SURFACE
      ?auto_2525204 - SURFACE
      ?auto_2525205 - SURFACE
      ?auto_2525206 - SURFACE
    )
    :vars
    (
      ?auto_2525210 - HOIST
      ?auto_2525208 - PLACE
      ?auto_2525211 - TRUCK
      ?auto_2525207 - PLACE
      ?auto_2525209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525210 ?auto_2525208 ) ( SURFACE-AT ?auto_2525205 ?auto_2525208 ) ( CLEAR ?auto_2525205 ) ( IS-CRATE ?auto_2525206 ) ( not ( = ?auto_2525205 ?auto_2525206 ) ) ( AVAILABLE ?auto_2525210 ) ( ON ?auto_2525205 ?auto_2525204 ) ( not ( = ?auto_2525204 ?auto_2525205 ) ) ( not ( = ?auto_2525204 ?auto_2525206 ) ) ( TRUCK-AT ?auto_2525211 ?auto_2525207 ) ( not ( = ?auto_2525207 ?auto_2525208 ) ) ( HOIST-AT ?auto_2525209 ?auto_2525207 ) ( LIFTING ?auto_2525209 ?auto_2525206 ) ( not ( = ?auto_2525210 ?auto_2525209 ) ) ( ON ?auto_2525203 ?auto_2525202 ) ( ON ?auto_2525204 ?auto_2525203 ) ( not ( = ?auto_2525202 ?auto_2525203 ) ) ( not ( = ?auto_2525202 ?auto_2525204 ) ) ( not ( = ?auto_2525202 ?auto_2525205 ) ) ( not ( = ?auto_2525202 ?auto_2525206 ) ) ( not ( = ?auto_2525203 ?auto_2525204 ) ) ( not ( = ?auto_2525203 ?auto_2525205 ) ) ( not ( = ?auto_2525203 ?auto_2525206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525204 ?auto_2525205 ?auto_2525206 )
      ( MAKE-4CRATE-VERIFY ?auto_2525202 ?auto_2525203 ?auto_2525204 ?auto_2525205 ?auto_2525206 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525240 - SURFACE
      ?auto_2525241 - SURFACE
      ?auto_2525242 - SURFACE
      ?auto_2525243 - SURFACE
      ?auto_2525244 - SURFACE
    )
    :vars
    (
      ?auto_2525246 - HOIST
      ?auto_2525245 - PLACE
      ?auto_2525248 - TRUCK
      ?auto_2525249 - PLACE
      ?auto_2525247 - HOIST
      ?auto_2525250 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525246 ?auto_2525245 ) ( SURFACE-AT ?auto_2525243 ?auto_2525245 ) ( CLEAR ?auto_2525243 ) ( IS-CRATE ?auto_2525244 ) ( not ( = ?auto_2525243 ?auto_2525244 ) ) ( AVAILABLE ?auto_2525246 ) ( ON ?auto_2525243 ?auto_2525242 ) ( not ( = ?auto_2525242 ?auto_2525243 ) ) ( not ( = ?auto_2525242 ?auto_2525244 ) ) ( TRUCK-AT ?auto_2525248 ?auto_2525249 ) ( not ( = ?auto_2525249 ?auto_2525245 ) ) ( HOIST-AT ?auto_2525247 ?auto_2525249 ) ( not ( = ?auto_2525246 ?auto_2525247 ) ) ( AVAILABLE ?auto_2525247 ) ( SURFACE-AT ?auto_2525244 ?auto_2525249 ) ( ON ?auto_2525244 ?auto_2525250 ) ( CLEAR ?auto_2525244 ) ( not ( = ?auto_2525243 ?auto_2525250 ) ) ( not ( = ?auto_2525244 ?auto_2525250 ) ) ( not ( = ?auto_2525242 ?auto_2525250 ) ) ( ON ?auto_2525241 ?auto_2525240 ) ( ON ?auto_2525242 ?auto_2525241 ) ( not ( = ?auto_2525240 ?auto_2525241 ) ) ( not ( = ?auto_2525240 ?auto_2525242 ) ) ( not ( = ?auto_2525240 ?auto_2525243 ) ) ( not ( = ?auto_2525240 ?auto_2525244 ) ) ( not ( = ?auto_2525240 ?auto_2525250 ) ) ( not ( = ?auto_2525241 ?auto_2525242 ) ) ( not ( = ?auto_2525241 ?auto_2525243 ) ) ( not ( = ?auto_2525241 ?auto_2525244 ) ) ( not ( = ?auto_2525241 ?auto_2525250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525242 ?auto_2525243 ?auto_2525244 )
      ( MAKE-4CRATE-VERIFY ?auto_2525240 ?auto_2525241 ?auto_2525242 ?auto_2525243 ?auto_2525244 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525279 - SURFACE
      ?auto_2525280 - SURFACE
      ?auto_2525281 - SURFACE
      ?auto_2525282 - SURFACE
      ?auto_2525283 - SURFACE
    )
    :vars
    (
      ?auto_2525289 - HOIST
      ?auto_2525285 - PLACE
      ?auto_2525287 - PLACE
      ?auto_2525284 - HOIST
      ?auto_2525286 - SURFACE
      ?auto_2525288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525289 ?auto_2525285 ) ( SURFACE-AT ?auto_2525282 ?auto_2525285 ) ( CLEAR ?auto_2525282 ) ( IS-CRATE ?auto_2525283 ) ( not ( = ?auto_2525282 ?auto_2525283 ) ) ( AVAILABLE ?auto_2525289 ) ( ON ?auto_2525282 ?auto_2525281 ) ( not ( = ?auto_2525281 ?auto_2525282 ) ) ( not ( = ?auto_2525281 ?auto_2525283 ) ) ( not ( = ?auto_2525287 ?auto_2525285 ) ) ( HOIST-AT ?auto_2525284 ?auto_2525287 ) ( not ( = ?auto_2525289 ?auto_2525284 ) ) ( AVAILABLE ?auto_2525284 ) ( SURFACE-AT ?auto_2525283 ?auto_2525287 ) ( ON ?auto_2525283 ?auto_2525286 ) ( CLEAR ?auto_2525283 ) ( not ( = ?auto_2525282 ?auto_2525286 ) ) ( not ( = ?auto_2525283 ?auto_2525286 ) ) ( not ( = ?auto_2525281 ?auto_2525286 ) ) ( TRUCK-AT ?auto_2525288 ?auto_2525285 ) ( ON ?auto_2525280 ?auto_2525279 ) ( ON ?auto_2525281 ?auto_2525280 ) ( not ( = ?auto_2525279 ?auto_2525280 ) ) ( not ( = ?auto_2525279 ?auto_2525281 ) ) ( not ( = ?auto_2525279 ?auto_2525282 ) ) ( not ( = ?auto_2525279 ?auto_2525283 ) ) ( not ( = ?auto_2525279 ?auto_2525286 ) ) ( not ( = ?auto_2525280 ?auto_2525281 ) ) ( not ( = ?auto_2525280 ?auto_2525282 ) ) ( not ( = ?auto_2525280 ?auto_2525283 ) ) ( not ( = ?auto_2525280 ?auto_2525286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525281 ?auto_2525282 ?auto_2525283 )
      ( MAKE-4CRATE-VERIFY ?auto_2525279 ?auto_2525280 ?auto_2525281 ?auto_2525282 ?auto_2525283 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525318 - SURFACE
      ?auto_2525319 - SURFACE
      ?auto_2525320 - SURFACE
      ?auto_2525321 - SURFACE
      ?auto_2525322 - SURFACE
    )
    :vars
    (
      ?auto_2525326 - HOIST
      ?auto_2525327 - PLACE
      ?auto_2525328 - PLACE
      ?auto_2525325 - HOIST
      ?auto_2525323 - SURFACE
      ?auto_2525324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525326 ?auto_2525327 ) ( IS-CRATE ?auto_2525322 ) ( not ( = ?auto_2525321 ?auto_2525322 ) ) ( not ( = ?auto_2525320 ?auto_2525321 ) ) ( not ( = ?auto_2525320 ?auto_2525322 ) ) ( not ( = ?auto_2525328 ?auto_2525327 ) ) ( HOIST-AT ?auto_2525325 ?auto_2525328 ) ( not ( = ?auto_2525326 ?auto_2525325 ) ) ( AVAILABLE ?auto_2525325 ) ( SURFACE-AT ?auto_2525322 ?auto_2525328 ) ( ON ?auto_2525322 ?auto_2525323 ) ( CLEAR ?auto_2525322 ) ( not ( = ?auto_2525321 ?auto_2525323 ) ) ( not ( = ?auto_2525322 ?auto_2525323 ) ) ( not ( = ?auto_2525320 ?auto_2525323 ) ) ( TRUCK-AT ?auto_2525324 ?auto_2525327 ) ( SURFACE-AT ?auto_2525320 ?auto_2525327 ) ( CLEAR ?auto_2525320 ) ( LIFTING ?auto_2525326 ?auto_2525321 ) ( IS-CRATE ?auto_2525321 ) ( ON ?auto_2525319 ?auto_2525318 ) ( ON ?auto_2525320 ?auto_2525319 ) ( not ( = ?auto_2525318 ?auto_2525319 ) ) ( not ( = ?auto_2525318 ?auto_2525320 ) ) ( not ( = ?auto_2525318 ?auto_2525321 ) ) ( not ( = ?auto_2525318 ?auto_2525322 ) ) ( not ( = ?auto_2525318 ?auto_2525323 ) ) ( not ( = ?auto_2525319 ?auto_2525320 ) ) ( not ( = ?auto_2525319 ?auto_2525321 ) ) ( not ( = ?auto_2525319 ?auto_2525322 ) ) ( not ( = ?auto_2525319 ?auto_2525323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525320 ?auto_2525321 ?auto_2525322 )
      ( MAKE-4CRATE-VERIFY ?auto_2525318 ?auto_2525319 ?auto_2525320 ?auto_2525321 ?auto_2525322 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2525357 - SURFACE
      ?auto_2525358 - SURFACE
      ?auto_2525359 - SURFACE
      ?auto_2525360 - SURFACE
      ?auto_2525361 - SURFACE
    )
    :vars
    (
      ?auto_2525362 - HOIST
      ?auto_2525366 - PLACE
      ?auto_2525367 - PLACE
      ?auto_2525364 - HOIST
      ?auto_2525363 - SURFACE
      ?auto_2525365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525362 ?auto_2525366 ) ( IS-CRATE ?auto_2525361 ) ( not ( = ?auto_2525360 ?auto_2525361 ) ) ( not ( = ?auto_2525359 ?auto_2525360 ) ) ( not ( = ?auto_2525359 ?auto_2525361 ) ) ( not ( = ?auto_2525367 ?auto_2525366 ) ) ( HOIST-AT ?auto_2525364 ?auto_2525367 ) ( not ( = ?auto_2525362 ?auto_2525364 ) ) ( AVAILABLE ?auto_2525364 ) ( SURFACE-AT ?auto_2525361 ?auto_2525367 ) ( ON ?auto_2525361 ?auto_2525363 ) ( CLEAR ?auto_2525361 ) ( not ( = ?auto_2525360 ?auto_2525363 ) ) ( not ( = ?auto_2525361 ?auto_2525363 ) ) ( not ( = ?auto_2525359 ?auto_2525363 ) ) ( TRUCK-AT ?auto_2525365 ?auto_2525366 ) ( SURFACE-AT ?auto_2525359 ?auto_2525366 ) ( CLEAR ?auto_2525359 ) ( IS-CRATE ?auto_2525360 ) ( AVAILABLE ?auto_2525362 ) ( IN ?auto_2525360 ?auto_2525365 ) ( ON ?auto_2525358 ?auto_2525357 ) ( ON ?auto_2525359 ?auto_2525358 ) ( not ( = ?auto_2525357 ?auto_2525358 ) ) ( not ( = ?auto_2525357 ?auto_2525359 ) ) ( not ( = ?auto_2525357 ?auto_2525360 ) ) ( not ( = ?auto_2525357 ?auto_2525361 ) ) ( not ( = ?auto_2525357 ?auto_2525363 ) ) ( not ( = ?auto_2525358 ?auto_2525359 ) ) ( not ( = ?auto_2525358 ?auto_2525360 ) ) ( not ( = ?auto_2525358 ?auto_2525361 ) ) ( not ( = ?auto_2525358 ?auto_2525363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2525359 ?auto_2525360 ?auto_2525361 )
      ( MAKE-4CRATE-VERIFY ?auto_2525357 ?auto_2525358 ?auto_2525359 ?auto_2525360 ?auto_2525361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525630 - SURFACE
      ?auto_2525631 - SURFACE
    )
    :vars
    (
      ?auto_2525632 - HOIST
      ?auto_2525633 - PLACE
      ?auto_2525634 - SURFACE
      ?auto_2525638 - TRUCK
      ?auto_2525635 - PLACE
      ?auto_2525637 - HOIST
      ?auto_2525636 - SURFACE
      ?auto_2525639 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2525632 ?auto_2525633 ) ( SURFACE-AT ?auto_2525630 ?auto_2525633 ) ( CLEAR ?auto_2525630 ) ( IS-CRATE ?auto_2525631 ) ( not ( = ?auto_2525630 ?auto_2525631 ) ) ( AVAILABLE ?auto_2525632 ) ( ON ?auto_2525630 ?auto_2525634 ) ( not ( = ?auto_2525634 ?auto_2525630 ) ) ( not ( = ?auto_2525634 ?auto_2525631 ) ) ( TRUCK-AT ?auto_2525638 ?auto_2525635 ) ( not ( = ?auto_2525635 ?auto_2525633 ) ) ( HOIST-AT ?auto_2525637 ?auto_2525635 ) ( not ( = ?auto_2525632 ?auto_2525637 ) ) ( SURFACE-AT ?auto_2525631 ?auto_2525635 ) ( ON ?auto_2525631 ?auto_2525636 ) ( CLEAR ?auto_2525631 ) ( not ( = ?auto_2525630 ?auto_2525636 ) ) ( not ( = ?auto_2525631 ?auto_2525636 ) ) ( not ( = ?auto_2525634 ?auto_2525636 ) ) ( LIFTING ?auto_2525637 ?auto_2525639 ) ( IS-CRATE ?auto_2525639 ) ( not ( = ?auto_2525630 ?auto_2525639 ) ) ( not ( = ?auto_2525631 ?auto_2525639 ) ) ( not ( = ?auto_2525634 ?auto_2525639 ) ) ( not ( = ?auto_2525636 ?auto_2525639 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2525637 ?auto_2525639 ?auto_2525638 ?auto_2525635 )
      ( MAKE-1CRATE ?auto_2525630 ?auto_2525631 )
      ( MAKE-1CRATE-VERIFY ?auto_2525630 ?auto_2525631 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526016 - SURFACE
      ?auto_2526017 - SURFACE
      ?auto_2526018 - SURFACE
      ?auto_2526019 - SURFACE
      ?auto_2526020 - SURFACE
      ?auto_2526021 - SURFACE
    )
    :vars
    (
      ?auto_2526022 - HOIST
      ?auto_2526023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526022 ?auto_2526023 ) ( SURFACE-AT ?auto_2526020 ?auto_2526023 ) ( CLEAR ?auto_2526020 ) ( LIFTING ?auto_2526022 ?auto_2526021 ) ( IS-CRATE ?auto_2526021 ) ( not ( = ?auto_2526020 ?auto_2526021 ) ) ( ON ?auto_2526017 ?auto_2526016 ) ( ON ?auto_2526018 ?auto_2526017 ) ( ON ?auto_2526019 ?auto_2526018 ) ( ON ?auto_2526020 ?auto_2526019 ) ( not ( = ?auto_2526016 ?auto_2526017 ) ) ( not ( = ?auto_2526016 ?auto_2526018 ) ) ( not ( = ?auto_2526016 ?auto_2526019 ) ) ( not ( = ?auto_2526016 ?auto_2526020 ) ) ( not ( = ?auto_2526016 ?auto_2526021 ) ) ( not ( = ?auto_2526017 ?auto_2526018 ) ) ( not ( = ?auto_2526017 ?auto_2526019 ) ) ( not ( = ?auto_2526017 ?auto_2526020 ) ) ( not ( = ?auto_2526017 ?auto_2526021 ) ) ( not ( = ?auto_2526018 ?auto_2526019 ) ) ( not ( = ?auto_2526018 ?auto_2526020 ) ) ( not ( = ?auto_2526018 ?auto_2526021 ) ) ( not ( = ?auto_2526019 ?auto_2526020 ) ) ( not ( = ?auto_2526019 ?auto_2526021 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2526020 ?auto_2526021 )
      ( MAKE-5CRATE-VERIFY ?auto_2526016 ?auto_2526017 ?auto_2526018 ?auto_2526019 ?auto_2526020 ?auto_2526021 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526050 - SURFACE
      ?auto_2526051 - SURFACE
      ?auto_2526052 - SURFACE
      ?auto_2526053 - SURFACE
      ?auto_2526054 - SURFACE
      ?auto_2526055 - SURFACE
    )
    :vars
    (
      ?auto_2526056 - HOIST
      ?auto_2526058 - PLACE
      ?auto_2526057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526056 ?auto_2526058 ) ( SURFACE-AT ?auto_2526054 ?auto_2526058 ) ( CLEAR ?auto_2526054 ) ( IS-CRATE ?auto_2526055 ) ( not ( = ?auto_2526054 ?auto_2526055 ) ) ( TRUCK-AT ?auto_2526057 ?auto_2526058 ) ( AVAILABLE ?auto_2526056 ) ( IN ?auto_2526055 ?auto_2526057 ) ( ON ?auto_2526054 ?auto_2526053 ) ( not ( = ?auto_2526053 ?auto_2526054 ) ) ( not ( = ?auto_2526053 ?auto_2526055 ) ) ( ON ?auto_2526051 ?auto_2526050 ) ( ON ?auto_2526052 ?auto_2526051 ) ( ON ?auto_2526053 ?auto_2526052 ) ( not ( = ?auto_2526050 ?auto_2526051 ) ) ( not ( = ?auto_2526050 ?auto_2526052 ) ) ( not ( = ?auto_2526050 ?auto_2526053 ) ) ( not ( = ?auto_2526050 ?auto_2526054 ) ) ( not ( = ?auto_2526050 ?auto_2526055 ) ) ( not ( = ?auto_2526051 ?auto_2526052 ) ) ( not ( = ?auto_2526051 ?auto_2526053 ) ) ( not ( = ?auto_2526051 ?auto_2526054 ) ) ( not ( = ?auto_2526051 ?auto_2526055 ) ) ( not ( = ?auto_2526052 ?auto_2526053 ) ) ( not ( = ?auto_2526052 ?auto_2526054 ) ) ( not ( = ?auto_2526052 ?auto_2526055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526053 ?auto_2526054 ?auto_2526055 )
      ( MAKE-5CRATE-VERIFY ?auto_2526050 ?auto_2526051 ?auto_2526052 ?auto_2526053 ?auto_2526054 ?auto_2526055 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526090 - SURFACE
      ?auto_2526091 - SURFACE
      ?auto_2526092 - SURFACE
      ?auto_2526093 - SURFACE
      ?auto_2526094 - SURFACE
      ?auto_2526095 - SURFACE
    )
    :vars
    (
      ?auto_2526099 - HOIST
      ?auto_2526096 - PLACE
      ?auto_2526097 - TRUCK
      ?auto_2526098 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526099 ?auto_2526096 ) ( SURFACE-AT ?auto_2526094 ?auto_2526096 ) ( CLEAR ?auto_2526094 ) ( IS-CRATE ?auto_2526095 ) ( not ( = ?auto_2526094 ?auto_2526095 ) ) ( AVAILABLE ?auto_2526099 ) ( IN ?auto_2526095 ?auto_2526097 ) ( ON ?auto_2526094 ?auto_2526093 ) ( not ( = ?auto_2526093 ?auto_2526094 ) ) ( not ( = ?auto_2526093 ?auto_2526095 ) ) ( TRUCK-AT ?auto_2526097 ?auto_2526098 ) ( not ( = ?auto_2526098 ?auto_2526096 ) ) ( ON ?auto_2526091 ?auto_2526090 ) ( ON ?auto_2526092 ?auto_2526091 ) ( ON ?auto_2526093 ?auto_2526092 ) ( not ( = ?auto_2526090 ?auto_2526091 ) ) ( not ( = ?auto_2526090 ?auto_2526092 ) ) ( not ( = ?auto_2526090 ?auto_2526093 ) ) ( not ( = ?auto_2526090 ?auto_2526094 ) ) ( not ( = ?auto_2526090 ?auto_2526095 ) ) ( not ( = ?auto_2526091 ?auto_2526092 ) ) ( not ( = ?auto_2526091 ?auto_2526093 ) ) ( not ( = ?auto_2526091 ?auto_2526094 ) ) ( not ( = ?auto_2526091 ?auto_2526095 ) ) ( not ( = ?auto_2526092 ?auto_2526093 ) ) ( not ( = ?auto_2526092 ?auto_2526094 ) ) ( not ( = ?auto_2526092 ?auto_2526095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526093 ?auto_2526094 ?auto_2526095 )
      ( MAKE-5CRATE-VERIFY ?auto_2526090 ?auto_2526091 ?auto_2526092 ?auto_2526093 ?auto_2526094 ?auto_2526095 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526135 - SURFACE
      ?auto_2526136 - SURFACE
      ?auto_2526137 - SURFACE
      ?auto_2526138 - SURFACE
      ?auto_2526139 - SURFACE
      ?auto_2526140 - SURFACE
    )
    :vars
    (
      ?auto_2526141 - HOIST
      ?auto_2526143 - PLACE
      ?auto_2526142 - TRUCK
      ?auto_2526145 - PLACE
      ?auto_2526144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526141 ?auto_2526143 ) ( SURFACE-AT ?auto_2526139 ?auto_2526143 ) ( CLEAR ?auto_2526139 ) ( IS-CRATE ?auto_2526140 ) ( not ( = ?auto_2526139 ?auto_2526140 ) ) ( AVAILABLE ?auto_2526141 ) ( ON ?auto_2526139 ?auto_2526138 ) ( not ( = ?auto_2526138 ?auto_2526139 ) ) ( not ( = ?auto_2526138 ?auto_2526140 ) ) ( TRUCK-AT ?auto_2526142 ?auto_2526145 ) ( not ( = ?auto_2526145 ?auto_2526143 ) ) ( HOIST-AT ?auto_2526144 ?auto_2526145 ) ( LIFTING ?auto_2526144 ?auto_2526140 ) ( not ( = ?auto_2526141 ?auto_2526144 ) ) ( ON ?auto_2526136 ?auto_2526135 ) ( ON ?auto_2526137 ?auto_2526136 ) ( ON ?auto_2526138 ?auto_2526137 ) ( not ( = ?auto_2526135 ?auto_2526136 ) ) ( not ( = ?auto_2526135 ?auto_2526137 ) ) ( not ( = ?auto_2526135 ?auto_2526138 ) ) ( not ( = ?auto_2526135 ?auto_2526139 ) ) ( not ( = ?auto_2526135 ?auto_2526140 ) ) ( not ( = ?auto_2526136 ?auto_2526137 ) ) ( not ( = ?auto_2526136 ?auto_2526138 ) ) ( not ( = ?auto_2526136 ?auto_2526139 ) ) ( not ( = ?auto_2526136 ?auto_2526140 ) ) ( not ( = ?auto_2526137 ?auto_2526138 ) ) ( not ( = ?auto_2526137 ?auto_2526139 ) ) ( not ( = ?auto_2526137 ?auto_2526140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526138 ?auto_2526139 ?auto_2526140 )
      ( MAKE-5CRATE-VERIFY ?auto_2526135 ?auto_2526136 ?auto_2526137 ?auto_2526138 ?auto_2526139 ?auto_2526140 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526185 - SURFACE
      ?auto_2526186 - SURFACE
      ?auto_2526187 - SURFACE
      ?auto_2526188 - SURFACE
      ?auto_2526189 - SURFACE
      ?auto_2526190 - SURFACE
    )
    :vars
    (
      ?auto_2526191 - HOIST
      ?auto_2526192 - PLACE
      ?auto_2526194 - TRUCK
      ?auto_2526196 - PLACE
      ?auto_2526193 - HOIST
      ?auto_2526195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526191 ?auto_2526192 ) ( SURFACE-AT ?auto_2526189 ?auto_2526192 ) ( CLEAR ?auto_2526189 ) ( IS-CRATE ?auto_2526190 ) ( not ( = ?auto_2526189 ?auto_2526190 ) ) ( AVAILABLE ?auto_2526191 ) ( ON ?auto_2526189 ?auto_2526188 ) ( not ( = ?auto_2526188 ?auto_2526189 ) ) ( not ( = ?auto_2526188 ?auto_2526190 ) ) ( TRUCK-AT ?auto_2526194 ?auto_2526196 ) ( not ( = ?auto_2526196 ?auto_2526192 ) ) ( HOIST-AT ?auto_2526193 ?auto_2526196 ) ( not ( = ?auto_2526191 ?auto_2526193 ) ) ( AVAILABLE ?auto_2526193 ) ( SURFACE-AT ?auto_2526190 ?auto_2526196 ) ( ON ?auto_2526190 ?auto_2526195 ) ( CLEAR ?auto_2526190 ) ( not ( = ?auto_2526189 ?auto_2526195 ) ) ( not ( = ?auto_2526190 ?auto_2526195 ) ) ( not ( = ?auto_2526188 ?auto_2526195 ) ) ( ON ?auto_2526186 ?auto_2526185 ) ( ON ?auto_2526187 ?auto_2526186 ) ( ON ?auto_2526188 ?auto_2526187 ) ( not ( = ?auto_2526185 ?auto_2526186 ) ) ( not ( = ?auto_2526185 ?auto_2526187 ) ) ( not ( = ?auto_2526185 ?auto_2526188 ) ) ( not ( = ?auto_2526185 ?auto_2526189 ) ) ( not ( = ?auto_2526185 ?auto_2526190 ) ) ( not ( = ?auto_2526185 ?auto_2526195 ) ) ( not ( = ?auto_2526186 ?auto_2526187 ) ) ( not ( = ?auto_2526186 ?auto_2526188 ) ) ( not ( = ?auto_2526186 ?auto_2526189 ) ) ( not ( = ?auto_2526186 ?auto_2526190 ) ) ( not ( = ?auto_2526186 ?auto_2526195 ) ) ( not ( = ?auto_2526187 ?auto_2526188 ) ) ( not ( = ?auto_2526187 ?auto_2526189 ) ) ( not ( = ?auto_2526187 ?auto_2526190 ) ) ( not ( = ?auto_2526187 ?auto_2526195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526188 ?auto_2526189 ?auto_2526190 )
      ( MAKE-5CRATE-VERIFY ?auto_2526185 ?auto_2526186 ?auto_2526187 ?auto_2526188 ?auto_2526189 ?auto_2526190 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526236 - SURFACE
      ?auto_2526237 - SURFACE
      ?auto_2526238 - SURFACE
      ?auto_2526239 - SURFACE
      ?auto_2526240 - SURFACE
      ?auto_2526241 - SURFACE
    )
    :vars
    (
      ?auto_2526245 - HOIST
      ?auto_2526247 - PLACE
      ?auto_2526243 - PLACE
      ?auto_2526244 - HOIST
      ?auto_2526246 - SURFACE
      ?auto_2526242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526245 ?auto_2526247 ) ( SURFACE-AT ?auto_2526240 ?auto_2526247 ) ( CLEAR ?auto_2526240 ) ( IS-CRATE ?auto_2526241 ) ( not ( = ?auto_2526240 ?auto_2526241 ) ) ( AVAILABLE ?auto_2526245 ) ( ON ?auto_2526240 ?auto_2526239 ) ( not ( = ?auto_2526239 ?auto_2526240 ) ) ( not ( = ?auto_2526239 ?auto_2526241 ) ) ( not ( = ?auto_2526243 ?auto_2526247 ) ) ( HOIST-AT ?auto_2526244 ?auto_2526243 ) ( not ( = ?auto_2526245 ?auto_2526244 ) ) ( AVAILABLE ?auto_2526244 ) ( SURFACE-AT ?auto_2526241 ?auto_2526243 ) ( ON ?auto_2526241 ?auto_2526246 ) ( CLEAR ?auto_2526241 ) ( not ( = ?auto_2526240 ?auto_2526246 ) ) ( not ( = ?auto_2526241 ?auto_2526246 ) ) ( not ( = ?auto_2526239 ?auto_2526246 ) ) ( TRUCK-AT ?auto_2526242 ?auto_2526247 ) ( ON ?auto_2526237 ?auto_2526236 ) ( ON ?auto_2526238 ?auto_2526237 ) ( ON ?auto_2526239 ?auto_2526238 ) ( not ( = ?auto_2526236 ?auto_2526237 ) ) ( not ( = ?auto_2526236 ?auto_2526238 ) ) ( not ( = ?auto_2526236 ?auto_2526239 ) ) ( not ( = ?auto_2526236 ?auto_2526240 ) ) ( not ( = ?auto_2526236 ?auto_2526241 ) ) ( not ( = ?auto_2526236 ?auto_2526246 ) ) ( not ( = ?auto_2526237 ?auto_2526238 ) ) ( not ( = ?auto_2526237 ?auto_2526239 ) ) ( not ( = ?auto_2526237 ?auto_2526240 ) ) ( not ( = ?auto_2526237 ?auto_2526241 ) ) ( not ( = ?auto_2526237 ?auto_2526246 ) ) ( not ( = ?auto_2526238 ?auto_2526239 ) ) ( not ( = ?auto_2526238 ?auto_2526240 ) ) ( not ( = ?auto_2526238 ?auto_2526241 ) ) ( not ( = ?auto_2526238 ?auto_2526246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526239 ?auto_2526240 ?auto_2526241 )
      ( MAKE-5CRATE-VERIFY ?auto_2526236 ?auto_2526237 ?auto_2526238 ?auto_2526239 ?auto_2526240 ?auto_2526241 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526287 - SURFACE
      ?auto_2526288 - SURFACE
      ?auto_2526289 - SURFACE
      ?auto_2526290 - SURFACE
      ?auto_2526291 - SURFACE
      ?auto_2526292 - SURFACE
    )
    :vars
    (
      ?auto_2526298 - HOIST
      ?auto_2526297 - PLACE
      ?auto_2526295 - PLACE
      ?auto_2526296 - HOIST
      ?auto_2526294 - SURFACE
      ?auto_2526293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526298 ?auto_2526297 ) ( IS-CRATE ?auto_2526292 ) ( not ( = ?auto_2526291 ?auto_2526292 ) ) ( not ( = ?auto_2526290 ?auto_2526291 ) ) ( not ( = ?auto_2526290 ?auto_2526292 ) ) ( not ( = ?auto_2526295 ?auto_2526297 ) ) ( HOIST-AT ?auto_2526296 ?auto_2526295 ) ( not ( = ?auto_2526298 ?auto_2526296 ) ) ( AVAILABLE ?auto_2526296 ) ( SURFACE-AT ?auto_2526292 ?auto_2526295 ) ( ON ?auto_2526292 ?auto_2526294 ) ( CLEAR ?auto_2526292 ) ( not ( = ?auto_2526291 ?auto_2526294 ) ) ( not ( = ?auto_2526292 ?auto_2526294 ) ) ( not ( = ?auto_2526290 ?auto_2526294 ) ) ( TRUCK-AT ?auto_2526293 ?auto_2526297 ) ( SURFACE-AT ?auto_2526290 ?auto_2526297 ) ( CLEAR ?auto_2526290 ) ( LIFTING ?auto_2526298 ?auto_2526291 ) ( IS-CRATE ?auto_2526291 ) ( ON ?auto_2526288 ?auto_2526287 ) ( ON ?auto_2526289 ?auto_2526288 ) ( ON ?auto_2526290 ?auto_2526289 ) ( not ( = ?auto_2526287 ?auto_2526288 ) ) ( not ( = ?auto_2526287 ?auto_2526289 ) ) ( not ( = ?auto_2526287 ?auto_2526290 ) ) ( not ( = ?auto_2526287 ?auto_2526291 ) ) ( not ( = ?auto_2526287 ?auto_2526292 ) ) ( not ( = ?auto_2526287 ?auto_2526294 ) ) ( not ( = ?auto_2526288 ?auto_2526289 ) ) ( not ( = ?auto_2526288 ?auto_2526290 ) ) ( not ( = ?auto_2526288 ?auto_2526291 ) ) ( not ( = ?auto_2526288 ?auto_2526292 ) ) ( not ( = ?auto_2526288 ?auto_2526294 ) ) ( not ( = ?auto_2526289 ?auto_2526290 ) ) ( not ( = ?auto_2526289 ?auto_2526291 ) ) ( not ( = ?auto_2526289 ?auto_2526292 ) ) ( not ( = ?auto_2526289 ?auto_2526294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526290 ?auto_2526291 ?auto_2526292 )
      ( MAKE-5CRATE-VERIFY ?auto_2526287 ?auto_2526288 ?auto_2526289 ?auto_2526290 ?auto_2526291 ?auto_2526292 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2526338 - SURFACE
      ?auto_2526339 - SURFACE
      ?auto_2526340 - SURFACE
      ?auto_2526341 - SURFACE
      ?auto_2526342 - SURFACE
      ?auto_2526343 - SURFACE
    )
    :vars
    (
      ?auto_2526344 - HOIST
      ?auto_2526347 - PLACE
      ?auto_2526345 - PLACE
      ?auto_2526349 - HOIST
      ?auto_2526348 - SURFACE
      ?auto_2526346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2526344 ?auto_2526347 ) ( IS-CRATE ?auto_2526343 ) ( not ( = ?auto_2526342 ?auto_2526343 ) ) ( not ( = ?auto_2526341 ?auto_2526342 ) ) ( not ( = ?auto_2526341 ?auto_2526343 ) ) ( not ( = ?auto_2526345 ?auto_2526347 ) ) ( HOIST-AT ?auto_2526349 ?auto_2526345 ) ( not ( = ?auto_2526344 ?auto_2526349 ) ) ( AVAILABLE ?auto_2526349 ) ( SURFACE-AT ?auto_2526343 ?auto_2526345 ) ( ON ?auto_2526343 ?auto_2526348 ) ( CLEAR ?auto_2526343 ) ( not ( = ?auto_2526342 ?auto_2526348 ) ) ( not ( = ?auto_2526343 ?auto_2526348 ) ) ( not ( = ?auto_2526341 ?auto_2526348 ) ) ( TRUCK-AT ?auto_2526346 ?auto_2526347 ) ( SURFACE-AT ?auto_2526341 ?auto_2526347 ) ( CLEAR ?auto_2526341 ) ( IS-CRATE ?auto_2526342 ) ( AVAILABLE ?auto_2526344 ) ( IN ?auto_2526342 ?auto_2526346 ) ( ON ?auto_2526339 ?auto_2526338 ) ( ON ?auto_2526340 ?auto_2526339 ) ( ON ?auto_2526341 ?auto_2526340 ) ( not ( = ?auto_2526338 ?auto_2526339 ) ) ( not ( = ?auto_2526338 ?auto_2526340 ) ) ( not ( = ?auto_2526338 ?auto_2526341 ) ) ( not ( = ?auto_2526338 ?auto_2526342 ) ) ( not ( = ?auto_2526338 ?auto_2526343 ) ) ( not ( = ?auto_2526338 ?auto_2526348 ) ) ( not ( = ?auto_2526339 ?auto_2526340 ) ) ( not ( = ?auto_2526339 ?auto_2526341 ) ) ( not ( = ?auto_2526339 ?auto_2526342 ) ) ( not ( = ?auto_2526339 ?auto_2526343 ) ) ( not ( = ?auto_2526339 ?auto_2526348 ) ) ( not ( = ?auto_2526340 ?auto_2526341 ) ) ( not ( = ?auto_2526340 ?auto_2526342 ) ) ( not ( = ?auto_2526340 ?auto_2526343 ) ) ( not ( = ?auto_2526340 ?auto_2526348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2526341 ?auto_2526342 ?auto_2526343 )
      ( MAKE-5CRATE-VERIFY ?auto_2526338 ?auto_2526339 ?auto_2526340 ?auto_2526341 ?auto_2526342 ?auto_2526343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2527018 - SURFACE
      ?auto_2527019 - SURFACE
    )
    :vars
    (
      ?auto_2527024 - HOIST
      ?auto_2527022 - PLACE
      ?auto_2527021 - SURFACE
      ?auto_2527023 - PLACE
      ?auto_2527025 - HOIST
      ?auto_2527020 - SURFACE
      ?auto_2527026 - TRUCK
      ?auto_2527027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527024 ?auto_2527022 ) ( SURFACE-AT ?auto_2527018 ?auto_2527022 ) ( CLEAR ?auto_2527018 ) ( IS-CRATE ?auto_2527019 ) ( not ( = ?auto_2527018 ?auto_2527019 ) ) ( ON ?auto_2527018 ?auto_2527021 ) ( not ( = ?auto_2527021 ?auto_2527018 ) ) ( not ( = ?auto_2527021 ?auto_2527019 ) ) ( not ( = ?auto_2527023 ?auto_2527022 ) ) ( HOIST-AT ?auto_2527025 ?auto_2527023 ) ( not ( = ?auto_2527024 ?auto_2527025 ) ) ( AVAILABLE ?auto_2527025 ) ( SURFACE-AT ?auto_2527019 ?auto_2527023 ) ( ON ?auto_2527019 ?auto_2527020 ) ( CLEAR ?auto_2527019 ) ( not ( = ?auto_2527018 ?auto_2527020 ) ) ( not ( = ?auto_2527019 ?auto_2527020 ) ) ( not ( = ?auto_2527021 ?auto_2527020 ) ) ( TRUCK-AT ?auto_2527026 ?auto_2527022 ) ( LIFTING ?auto_2527024 ?auto_2527027 ) ( IS-CRATE ?auto_2527027 ) ( not ( = ?auto_2527018 ?auto_2527027 ) ) ( not ( = ?auto_2527019 ?auto_2527027 ) ) ( not ( = ?auto_2527021 ?auto_2527027 ) ) ( not ( = ?auto_2527020 ?auto_2527027 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2527024 ?auto_2527027 ?auto_2527026 ?auto_2527022 )
      ( MAKE-1CRATE ?auto_2527018 ?auto_2527019 )
      ( MAKE-1CRATE-VERIFY ?auto_2527018 ?auto_2527019 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527544 - SURFACE
      ?auto_2527545 - SURFACE
      ?auto_2527546 - SURFACE
      ?auto_2527547 - SURFACE
      ?auto_2527548 - SURFACE
      ?auto_2527549 - SURFACE
      ?auto_2527550 - SURFACE
    )
    :vars
    (
      ?auto_2527552 - HOIST
      ?auto_2527551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527552 ?auto_2527551 ) ( SURFACE-AT ?auto_2527549 ?auto_2527551 ) ( CLEAR ?auto_2527549 ) ( LIFTING ?auto_2527552 ?auto_2527550 ) ( IS-CRATE ?auto_2527550 ) ( not ( = ?auto_2527549 ?auto_2527550 ) ) ( ON ?auto_2527545 ?auto_2527544 ) ( ON ?auto_2527546 ?auto_2527545 ) ( ON ?auto_2527547 ?auto_2527546 ) ( ON ?auto_2527548 ?auto_2527547 ) ( ON ?auto_2527549 ?auto_2527548 ) ( not ( = ?auto_2527544 ?auto_2527545 ) ) ( not ( = ?auto_2527544 ?auto_2527546 ) ) ( not ( = ?auto_2527544 ?auto_2527547 ) ) ( not ( = ?auto_2527544 ?auto_2527548 ) ) ( not ( = ?auto_2527544 ?auto_2527549 ) ) ( not ( = ?auto_2527544 ?auto_2527550 ) ) ( not ( = ?auto_2527545 ?auto_2527546 ) ) ( not ( = ?auto_2527545 ?auto_2527547 ) ) ( not ( = ?auto_2527545 ?auto_2527548 ) ) ( not ( = ?auto_2527545 ?auto_2527549 ) ) ( not ( = ?auto_2527545 ?auto_2527550 ) ) ( not ( = ?auto_2527546 ?auto_2527547 ) ) ( not ( = ?auto_2527546 ?auto_2527548 ) ) ( not ( = ?auto_2527546 ?auto_2527549 ) ) ( not ( = ?auto_2527546 ?auto_2527550 ) ) ( not ( = ?auto_2527547 ?auto_2527548 ) ) ( not ( = ?auto_2527547 ?auto_2527549 ) ) ( not ( = ?auto_2527547 ?auto_2527550 ) ) ( not ( = ?auto_2527548 ?auto_2527549 ) ) ( not ( = ?auto_2527548 ?auto_2527550 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2527549 ?auto_2527550 )
      ( MAKE-6CRATE-VERIFY ?auto_2527544 ?auto_2527545 ?auto_2527546 ?auto_2527547 ?auto_2527548 ?auto_2527549 ?auto_2527550 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527588 - SURFACE
      ?auto_2527589 - SURFACE
      ?auto_2527590 - SURFACE
      ?auto_2527591 - SURFACE
      ?auto_2527592 - SURFACE
      ?auto_2527593 - SURFACE
      ?auto_2527594 - SURFACE
    )
    :vars
    (
      ?auto_2527595 - HOIST
      ?auto_2527597 - PLACE
      ?auto_2527596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527595 ?auto_2527597 ) ( SURFACE-AT ?auto_2527593 ?auto_2527597 ) ( CLEAR ?auto_2527593 ) ( IS-CRATE ?auto_2527594 ) ( not ( = ?auto_2527593 ?auto_2527594 ) ) ( TRUCK-AT ?auto_2527596 ?auto_2527597 ) ( AVAILABLE ?auto_2527595 ) ( IN ?auto_2527594 ?auto_2527596 ) ( ON ?auto_2527593 ?auto_2527592 ) ( not ( = ?auto_2527592 ?auto_2527593 ) ) ( not ( = ?auto_2527592 ?auto_2527594 ) ) ( ON ?auto_2527589 ?auto_2527588 ) ( ON ?auto_2527590 ?auto_2527589 ) ( ON ?auto_2527591 ?auto_2527590 ) ( ON ?auto_2527592 ?auto_2527591 ) ( not ( = ?auto_2527588 ?auto_2527589 ) ) ( not ( = ?auto_2527588 ?auto_2527590 ) ) ( not ( = ?auto_2527588 ?auto_2527591 ) ) ( not ( = ?auto_2527588 ?auto_2527592 ) ) ( not ( = ?auto_2527588 ?auto_2527593 ) ) ( not ( = ?auto_2527588 ?auto_2527594 ) ) ( not ( = ?auto_2527589 ?auto_2527590 ) ) ( not ( = ?auto_2527589 ?auto_2527591 ) ) ( not ( = ?auto_2527589 ?auto_2527592 ) ) ( not ( = ?auto_2527589 ?auto_2527593 ) ) ( not ( = ?auto_2527589 ?auto_2527594 ) ) ( not ( = ?auto_2527590 ?auto_2527591 ) ) ( not ( = ?auto_2527590 ?auto_2527592 ) ) ( not ( = ?auto_2527590 ?auto_2527593 ) ) ( not ( = ?auto_2527590 ?auto_2527594 ) ) ( not ( = ?auto_2527591 ?auto_2527592 ) ) ( not ( = ?auto_2527591 ?auto_2527593 ) ) ( not ( = ?auto_2527591 ?auto_2527594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527592 ?auto_2527593 ?auto_2527594 )
      ( MAKE-6CRATE-VERIFY ?auto_2527588 ?auto_2527589 ?auto_2527590 ?auto_2527591 ?auto_2527592 ?auto_2527593 ?auto_2527594 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527639 - SURFACE
      ?auto_2527640 - SURFACE
      ?auto_2527641 - SURFACE
      ?auto_2527642 - SURFACE
      ?auto_2527643 - SURFACE
      ?auto_2527644 - SURFACE
      ?auto_2527645 - SURFACE
    )
    :vars
    (
      ?auto_2527648 - HOIST
      ?auto_2527647 - PLACE
      ?auto_2527649 - TRUCK
      ?auto_2527646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527648 ?auto_2527647 ) ( SURFACE-AT ?auto_2527644 ?auto_2527647 ) ( CLEAR ?auto_2527644 ) ( IS-CRATE ?auto_2527645 ) ( not ( = ?auto_2527644 ?auto_2527645 ) ) ( AVAILABLE ?auto_2527648 ) ( IN ?auto_2527645 ?auto_2527649 ) ( ON ?auto_2527644 ?auto_2527643 ) ( not ( = ?auto_2527643 ?auto_2527644 ) ) ( not ( = ?auto_2527643 ?auto_2527645 ) ) ( TRUCK-AT ?auto_2527649 ?auto_2527646 ) ( not ( = ?auto_2527646 ?auto_2527647 ) ) ( ON ?auto_2527640 ?auto_2527639 ) ( ON ?auto_2527641 ?auto_2527640 ) ( ON ?auto_2527642 ?auto_2527641 ) ( ON ?auto_2527643 ?auto_2527642 ) ( not ( = ?auto_2527639 ?auto_2527640 ) ) ( not ( = ?auto_2527639 ?auto_2527641 ) ) ( not ( = ?auto_2527639 ?auto_2527642 ) ) ( not ( = ?auto_2527639 ?auto_2527643 ) ) ( not ( = ?auto_2527639 ?auto_2527644 ) ) ( not ( = ?auto_2527639 ?auto_2527645 ) ) ( not ( = ?auto_2527640 ?auto_2527641 ) ) ( not ( = ?auto_2527640 ?auto_2527642 ) ) ( not ( = ?auto_2527640 ?auto_2527643 ) ) ( not ( = ?auto_2527640 ?auto_2527644 ) ) ( not ( = ?auto_2527640 ?auto_2527645 ) ) ( not ( = ?auto_2527641 ?auto_2527642 ) ) ( not ( = ?auto_2527641 ?auto_2527643 ) ) ( not ( = ?auto_2527641 ?auto_2527644 ) ) ( not ( = ?auto_2527641 ?auto_2527645 ) ) ( not ( = ?auto_2527642 ?auto_2527643 ) ) ( not ( = ?auto_2527642 ?auto_2527644 ) ) ( not ( = ?auto_2527642 ?auto_2527645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527643 ?auto_2527644 ?auto_2527645 )
      ( MAKE-6CRATE-VERIFY ?auto_2527639 ?auto_2527640 ?auto_2527641 ?auto_2527642 ?auto_2527643 ?auto_2527644 ?auto_2527645 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527696 - SURFACE
      ?auto_2527697 - SURFACE
      ?auto_2527698 - SURFACE
      ?auto_2527699 - SURFACE
      ?auto_2527700 - SURFACE
      ?auto_2527701 - SURFACE
      ?auto_2527702 - SURFACE
    )
    :vars
    (
      ?auto_2527707 - HOIST
      ?auto_2527705 - PLACE
      ?auto_2527703 - TRUCK
      ?auto_2527706 - PLACE
      ?auto_2527704 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527707 ?auto_2527705 ) ( SURFACE-AT ?auto_2527701 ?auto_2527705 ) ( CLEAR ?auto_2527701 ) ( IS-CRATE ?auto_2527702 ) ( not ( = ?auto_2527701 ?auto_2527702 ) ) ( AVAILABLE ?auto_2527707 ) ( ON ?auto_2527701 ?auto_2527700 ) ( not ( = ?auto_2527700 ?auto_2527701 ) ) ( not ( = ?auto_2527700 ?auto_2527702 ) ) ( TRUCK-AT ?auto_2527703 ?auto_2527706 ) ( not ( = ?auto_2527706 ?auto_2527705 ) ) ( HOIST-AT ?auto_2527704 ?auto_2527706 ) ( LIFTING ?auto_2527704 ?auto_2527702 ) ( not ( = ?auto_2527707 ?auto_2527704 ) ) ( ON ?auto_2527697 ?auto_2527696 ) ( ON ?auto_2527698 ?auto_2527697 ) ( ON ?auto_2527699 ?auto_2527698 ) ( ON ?auto_2527700 ?auto_2527699 ) ( not ( = ?auto_2527696 ?auto_2527697 ) ) ( not ( = ?auto_2527696 ?auto_2527698 ) ) ( not ( = ?auto_2527696 ?auto_2527699 ) ) ( not ( = ?auto_2527696 ?auto_2527700 ) ) ( not ( = ?auto_2527696 ?auto_2527701 ) ) ( not ( = ?auto_2527696 ?auto_2527702 ) ) ( not ( = ?auto_2527697 ?auto_2527698 ) ) ( not ( = ?auto_2527697 ?auto_2527699 ) ) ( not ( = ?auto_2527697 ?auto_2527700 ) ) ( not ( = ?auto_2527697 ?auto_2527701 ) ) ( not ( = ?auto_2527697 ?auto_2527702 ) ) ( not ( = ?auto_2527698 ?auto_2527699 ) ) ( not ( = ?auto_2527698 ?auto_2527700 ) ) ( not ( = ?auto_2527698 ?auto_2527701 ) ) ( not ( = ?auto_2527698 ?auto_2527702 ) ) ( not ( = ?auto_2527699 ?auto_2527700 ) ) ( not ( = ?auto_2527699 ?auto_2527701 ) ) ( not ( = ?auto_2527699 ?auto_2527702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527700 ?auto_2527701 ?auto_2527702 )
      ( MAKE-6CRATE-VERIFY ?auto_2527696 ?auto_2527697 ?auto_2527698 ?auto_2527699 ?auto_2527700 ?auto_2527701 ?auto_2527702 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527759 - SURFACE
      ?auto_2527760 - SURFACE
      ?auto_2527761 - SURFACE
      ?auto_2527762 - SURFACE
      ?auto_2527763 - SURFACE
      ?auto_2527764 - SURFACE
      ?auto_2527765 - SURFACE
    )
    :vars
    (
      ?auto_2527770 - HOIST
      ?auto_2527768 - PLACE
      ?auto_2527767 - TRUCK
      ?auto_2527771 - PLACE
      ?auto_2527769 - HOIST
      ?auto_2527766 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527770 ?auto_2527768 ) ( SURFACE-AT ?auto_2527764 ?auto_2527768 ) ( CLEAR ?auto_2527764 ) ( IS-CRATE ?auto_2527765 ) ( not ( = ?auto_2527764 ?auto_2527765 ) ) ( AVAILABLE ?auto_2527770 ) ( ON ?auto_2527764 ?auto_2527763 ) ( not ( = ?auto_2527763 ?auto_2527764 ) ) ( not ( = ?auto_2527763 ?auto_2527765 ) ) ( TRUCK-AT ?auto_2527767 ?auto_2527771 ) ( not ( = ?auto_2527771 ?auto_2527768 ) ) ( HOIST-AT ?auto_2527769 ?auto_2527771 ) ( not ( = ?auto_2527770 ?auto_2527769 ) ) ( AVAILABLE ?auto_2527769 ) ( SURFACE-AT ?auto_2527765 ?auto_2527771 ) ( ON ?auto_2527765 ?auto_2527766 ) ( CLEAR ?auto_2527765 ) ( not ( = ?auto_2527764 ?auto_2527766 ) ) ( not ( = ?auto_2527765 ?auto_2527766 ) ) ( not ( = ?auto_2527763 ?auto_2527766 ) ) ( ON ?auto_2527760 ?auto_2527759 ) ( ON ?auto_2527761 ?auto_2527760 ) ( ON ?auto_2527762 ?auto_2527761 ) ( ON ?auto_2527763 ?auto_2527762 ) ( not ( = ?auto_2527759 ?auto_2527760 ) ) ( not ( = ?auto_2527759 ?auto_2527761 ) ) ( not ( = ?auto_2527759 ?auto_2527762 ) ) ( not ( = ?auto_2527759 ?auto_2527763 ) ) ( not ( = ?auto_2527759 ?auto_2527764 ) ) ( not ( = ?auto_2527759 ?auto_2527765 ) ) ( not ( = ?auto_2527759 ?auto_2527766 ) ) ( not ( = ?auto_2527760 ?auto_2527761 ) ) ( not ( = ?auto_2527760 ?auto_2527762 ) ) ( not ( = ?auto_2527760 ?auto_2527763 ) ) ( not ( = ?auto_2527760 ?auto_2527764 ) ) ( not ( = ?auto_2527760 ?auto_2527765 ) ) ( not ( = ?auto_2527760 ?auto_2527766 ) ) ( not ( = ?auto_2527761 ?auto_2527762 ) ) ( not ( = ?auto_2527761 ?auto_2527763 ) ) ( not ( = ?auto_2527761 ?auto_2527764 ) ) ( not ( = ?auto_2527761 ?auto_2527765 ) ) ( not ( = ?auto_2527761 ?auto_2527766 ) ) ( not ( = ?auto_2527762 ?auto_2527763 ) ) ( not ( = ?auto_2527762 ?auto_2527764 ) ) ( not ( = ?auto_2527762 ?auto_2527765 ) ) ( not ( = ?auto_2527762 ?auto_2527766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527763 ?auto_2527764 ?auto_2527765 )
      ( MAKE-6CRATE-VERIFY ?auto_2527759 ?auto_2527760 ?auto_2527761 ?auto_2527762 ?auto_2527763 ?auto_2527764 ?auto_2527765 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527823 - SURFACE
      ?auto_2527824 - SURFACE
      ?auto_2527825 - SURFACE
      ?auto_2527826 - SURFACE
      ?auto_2527827 - SURFACE
      ?auto_2527828 - SURFACE
      ?auto_2527829 - SURFACE
    )
    :vars
    (
      ?auto_2527834 - HOIST
      ?auto_2527832 - PLACE
      ?auto_2527833 - PLACE
      ?auto_2527830 - HOIST
      ?auto_2527831 - SURFACE
      ?auto_2527835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527834 ?auto_2527832 ) ( SURFACE-AT ?auto_2527828 ?auto_2527832 ) ( CLEAR ?auto_2527828 ) ( IS-CRATE ?auto_2527829 ) ( not ( = ?auto_2527828 ?auto_2527829 ) ) ( AVAILABLE ?auto_2527834 ) ( ON ?auto_2527828 ?auto_2527827 ) ( not ( = ?auto_2527827 ?auto_2527828 ) ) ( not ( = ?auto_2527827 ?auto_2527829 ) ) ( not ( = ?auto_2527833 ?auto_2527832 ) ) ( HOIST-AT ?auto_2527830 ?auto_2527833 ) ( not ( = ?auto_2527834 ?auto_2527830 ) ) ( AVAILABLE ?auto_2527830 ) ( SURFACE-AT ?auto_2527829 ?auto_2527833 ) ( ON ?auto_2527829 ?auto_2527831 ) ( CLEAR ?auto_2527829 ) ( not ( = ?auto_2527828 ?auto_2527831 ) ) ( not ( = ?auto_2527829 ?auto_2527831 ) ) ( not ( = ?auto_2527827 ?auto_2527831 ) ) ( TRUCK-AT ?auto_2527835 ?auto_2527832 ) ( ON ?auto_2527824 ?auto_2527823 ) ( ON ?auto_2527825 ?auto_2527824 ) ( ON ?auto_2527826 ?auto_2527825 ) ( ON ?auto_2527827 ?auto_2527826 ) ( not ( = ?auto_2527823 ?auto_2527824 ) ) ( not ( = ?auto_2527823 ?auto_2527825 ) ) ( not ( = ?auto_2527823 ?auto_2527826 ) ) ( not ( = ?auto_2527823 ?auto_2527827 ) ) ( not ( = ?auto_2527823 ?auto_2527828 ) ) ( not ( = ?auto_2527823 ?auto_2527829 ) ) ( not ( = ?auto_2527823 ?auto_2527831 ) ) ( not ( = ?auto_2527824 ?auto_2527825 ) ) ( not ( = ?auto_2527824 ?auto_2527826 ) ) ( not ( = ?auto_2527824 ?auto_2527827 ) ) ( not ( = ?auto_2527824 ?auto_2527828 ) ) ( not ( = ?auto_2527824 ?auto_2527829 ) ) ( not ( = ?auto_2527824 ?auto_2527831 ) ) ( not ( = ?auto_2527825 ?auto_2527826 ) ) ( not ( = ?auto_2527825 ?auto_2527827 ) ) ( not ( = ?auto_2527825 ?auto_2527828 ) ) ( not ( = ?auto_2527825 ?auto_2527829 ) ) ( not ( = ?auto_2527825 ?auto_2527831 ) ) ( not ( = ?auto_2527826 ?auto_2527827 ) ) ( not ( = ?auto_2527826 ?auto_2527828 ) ) ( not ( = ?auto_2527826 ?auto_2527829 ) ) ( not ( = ?auto_2527826 ?auto_2527831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527827 ?auto_2527828 ?auto_2527829 )
      ( MAKE-6CRATE-VERIFY ?auto_2527823 ?auto_2527824 ?auto_2527825 ?auto_2527826 ?auto_2527827 ?auto_2527828 ?auto_2527829 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527887 - SURFACE
      ?auto_2527888 - SURFACE
      ?auto_2527889 - SURFACE
      ?auto_2527890 - SURFACE
      ?auto_2527891 - SURFACE
      ?auto_2527892 - SURFACE
      ?auto_2527893 - SURFACE
    )
    :vars
    (
      ?auto_2527899 - HOIST
      ?auto_2527895 - PLACE
      ?auto_2527896 - PLACE
      ?auto_2527898 - HOIST
      ?auto_2527897 - SURFACE
      ?auto_2527894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527899 ?auto_2527895 ) ( IS-CRATE ?auto_2527893 ) ( not ( = ?auto_2527892 ?auto_2527893 ) ) ( not ( = ?auto_2527891 ?auto_2527892 ) ) ( not ( = ?auto_2527891 ?auto_2527893 ) ) ( not ( = ?auto_2527896 ?auto_2527895 ) ) ( HOIST-AT ?auto_2527898 ?auto_2527896 ) ( not ( = ?auto_2527899 ?auto_2527898 ) ) ( AVAILABLE ?auto_2527898 ) ( SURFACE-AT ?auto_2527893 ?auto_2527896 ) ( ON ?auto_2527893 ?auto_2527897 ) ( CLEAR ?auto_2527893 ) ( not ( = ?auto_2527892 ?auto_2527897 ) ) ( not ( = ?auto_2527893 ?auto_2527897 ) ) ( not ( = ?auto_2527891 ?auto_2527897 ) ) ( TRUCK-AT ?auto_2527894 ?auto_2527895 ) ( SURFACE-AT ?auto_2527891 ?auto_2527895 ) ( CLEAR ?auto_2527891 ) ( LIFTING ?auto_2527899 ?auto_2527892 ) ( IS-CRATE ?auto_2527892 ) ( ON ?auto_2527888 ?auto_2527887 ) ( ON ?auto_2527889 ?auto_2527888 ) ( ON ?auto_2527890 ?auto_2527889 ) ( ON ?auto_2527891 ?auto_2527890 ) ( not ( = ?auto_2527887 ?auto_2527888 ) ) ( not ( = ?auto_2527887 ?auto_2527889 ) ) ( not ( = ?auto_2527887 ?auto_2527890 ) ) ( not ( = ?auto_2527887 ?auto_2527891 ) ) ( not ( = ?auto_2527887 ?auto_2527892 ) ) ( not ( = ?auto_2527887 ?auto_2527893 ) ) ( not ( = ?auto_2527887 ?auto_2527897 ) ) ( not ( = ?auto_2527888 ?auto_2527889 ) ) ( not ( = ?auto_2527888 ?auto_2527890 ) ) ( not ( = ?auto_2527888 ?auto_2527891 ) ) ( not ( = ?auto_2527888 ?auto_2527892 ) ) ( not ( = ?auto_2527888 ?auto_2527893 ) ) ( not ( = ?auto_2527888 ?auto_2527897 ) ) ( not ( = ?auto_2527889 ?auto_2527890 ) ) ( not ( = ?auto_2527889 ?auto_2527891 ) ) ( not ( = ?auto_2527889 ?auto_2527892 ) ) ( not ( = ?auto_2527889 ?auto_2527893 ) ) ( not ( = ?auto_2527889 ?auto_2527897 ) ) ( not ( = ?auto_2527890 ?auto_2527891 ) ) ( not ( = ?auto_2527890 ?auto_2527892 ) ) ( not ( = ?auto_2527890 ?auto_2527893 ) ) ( not ( = ?auto_2527890 ?auto_2527897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527891 ?auto_2527892 ?auto_2527893 )
      ( MAKE-6CRATE-VERIFY ?auto_2527887 ?auto_2527888 ?auto_2527889 ?auto_2527890 ?auto_2527891 ?auto_2527892 ?auto_2527893 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2527951 - SURFACE
      ?auto_2527952 - SURFACE
      ?auto_2527953 - SURFACE
      ?auto_2527954 - SURFACE
      ?auto_2527955 - SURFACE
      ?auto_2527956 - SURFACE
      ?auto_2527957 - SURFACE
    )
    :vars
    (
      ?auto_2527961 - HOIST
      ?auto_2527959 - PLACE
      ?auto_2527960 - PLACE
      ?auto_2527962 - HOIST
      ?auto_2527963 - SURFACE
      ?auto_2527958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2527961 ?auto_2527959 ) ( IS-CRATE ?auto_2527957 ) ( not ( = ?auto_2527956 ?auto_2527957 ) ) ( not ( = ?auto_2527955 ?auto_2527956 ) ) ( not ( = ?auto_2527955 ?auto_2527957 ) ) ( not ( = ?auto_2527960 ?auto_2527959 ) ) ( HOIST-AT ?auto_2527962 ?auto_2527960 ) ( not ( = ?auto_2527961 ?auto_2527962 ) ) ( AVAILABLE ?auto_2527962 ) ( SURFACE-AT ?auto_2527957 ?auto_2527960 ) ( ON ?auto_2527957 ?auto_2527963 ) ( CLEAR ?auto_2527957 ) ( not ( = ?auto_2527956 ?auto_2527963 ) ) ( not ( = ?auto_2527957 ?auto_2527963 ) ) ( not ( = ?auto_2527955 ?auto_2527963 ) ) ( TRUCK-AT ?auto_2527958 ?auto_2527959 ) ( SURFACE-AT ?auto_2527955 ?auto_2527959 ) ( CLEAR ?auto_2527955 ) ( IS-CRATE ?auto_2527956 ) ( AVAILABLE ?auto_2527961 ) ( IN ?auto_2527956 ?auto_2527958 ) ( ON ?auto_2527952 ?auto_2527951 ) ( ON ?auto_2527953 ?auto_2527952 ) ( ON ?auto_2527954 ?auto_2527953 ) ( ON ?auto_2527955 ?auto_2527954 ) ( not ( = ?auto_2527951 ?auto_2527952 ) ) ( not ( = ?auto_2527951 ?auto_2527953 ) ) ( not ( = ?auto_2527951 ?auto_2527954 ) ) ( not ( = ?auto_2527951 ?auto_2527955 ) ) ( not ( = ?auto_2527951 ?auto_2527956 ) ) ( not ( = ?auto_2527951 ?auto_2527957 ) ) ( not ( = ?auto_2527951 ?auto_2527963 ) ) ( not ( = ?auto_2527952 ?auto_2527953 ) ) ( not ( = ?auto_2527952 ?auto_2527954 ) ) ( not ( = ?auto_2527952 ?auto_2527955 ) ) ( not ( = ?auto_2527952 ?auto_2527956 ) ) ( not ( = ?auto_2527952 ?auto_2527957 ) ) ( not ( = ?auto_2527952 ?auto_2527963 ) ) ( not ( = ?auto_2527953 ?auto_2527954 ) ) ( not ( = ?auto_2527953 ?auto_2527955 ) ) ( not ( = ?auto_2527953 ?auto_2527956 ) ) ( not ( = ?auto_2527953 ?auto_2527957 ) ) ( not ( = ?auto_2527953 ?auto_2527963 ) ) ( not ( = ?auto_2527954 ?auto_2527955 ) ) ( not ( = ?auto_2527954 ?auto_2527956 ) ) ( not ( = ?auto_2527954 ?auto_2527957 ) ) ( not ( = ?auto_2527954 ?auto_2527963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2527955 ?auto_2527956 ?auto_2527957 )
      ( MAKE-6CRATE-VERIFY ?auto_2527951 ?auto_2527952 ?auto_2527953 ?auto_2527954 ?auto_2527955 ?auto_2527956 ?auto_2527957 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2529907 - SURFACE
      ?auto_2529908 - SURFACE
      ?auto_2529909 - SURFACE
      ?auto_2529910 - SURFACE
      ?auto_2529911 - SURFACE
      ?auto_2529912 - SURFACE
      ?auto_2529913 - SURFACE
      ?auto_2529914 - SURFACE
    )
    :vars
    (
      ?auto_2529916 - HOIST
      ?auto_2529915 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2529916 ?auto_2529915 ) ( SURFACE-AT ?auto_2529913 ?auto_2529915 ) ( CLEAR ?auto_2529913 ) ( LIFTING ?auto_2529916 ?auto_2529914 ) ( IS-CRATE ?auto_2529914 ) ( not ( = ?auto_2529913 ?auto_2529914 ) ) ( ON ?auto_2529908 ?auto_2529907 ) ( ON ?auto_2529909 ?auto_2529908 ) ( ON ?auto_2529910 ?auto_2529909 ) ( ON ?auto_2529911 ?auto_2529910 ) ( ON ?auto_2529912 ?auto_2529911 ) ( ON ?auto_2529913 ?auto_2529912 ) ( not ( = ?auto_2529907 ?auto_2529908 ) ) ( not ( = ?auto_2529907 ?auto_2529909 ) ) ( not ( = ?auto_2529907 ?auto_2529910 ) ) ( not ( = ?auto_2529907 ?auto_2529911 ) ) ( not ( = ?auto_2529907 ?auto_2529912 ) ) ( not ( = ?auto_2529907 ?auto_2529913 ) ) ( not ( = ?auto_2529907 ?auto_2529914 ) ) ( not ( = ?auto_2529908 ?auto_2529909 ) ) ( not ( = ?auto_2529908 ?auto_2529910 ) ) ( not ( = ?auto_2529908 ?auto_2529911 ) ) ( not ( = ?auto_2529908 ?auto_2529912 ) ) ( not ( = ?auto_2529908 ?auto_2529913 ) ) ( not ( = ?auto_2529908 ?auto_2529914 ) ) ( not ( = ?auto_2529909 ?auto_2529910 ) ) ( not ( = ?auto_2529909 ?auto_2529911 ) ) ( not ( = ?auto_2529909 ?auto_2529912 ) ) ( not ( = ?auto_2529909 ?auto_2529913 ) ) ( not ( = ?auto_2529909 ?auto_2529914 ) ) ( not ( = ?auto_2529910 ?auto_2529911 ) ) ( not ( = ?auto_2529910 ?auto_2529912 ) ) ( not ( = ?auto_2529910 ?auto_2529913 ) ) ( not ( = ?auto_2529910 ?auto_2529914 ) ) ( not ( = ?auto_2529911 ?auto_2529912 ) ) ( not ( = ?auto_2529911 ?auto_2529913 ) ) ( not ( = ?auto_2529911 ?auto_2529914 ) ) ( not ( = ?auto_2529912 ?auto_2529913 ) ) ( not ( = ?auto_2529912 ?auto_2529914 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2529913 ?auto_2529914 )
      ( MAKE-7CRATE-VERIFY ?auto_2529907 ?auto_2529908 ?auto_2529909 ?auto_2529910 ?auto_2529911 ?auto_2529912 ?auto_2529913 ?auto_2529914 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2529962 - SURFACE
      ?auto_2529963 - SURFACE
      ?auto_2529964 - SURFACE
      ?auto_2529965 - SURFACE
      ?auto_2529966 - SURFACE
      ?auto_2529967 - SURFACE
      ?auto_2529968 - SURFACE
      ?auto_2529969 - SURFACE
    )
    :vars
    (
      ?auto_2529972 - HOIST
      ?auto_2529971 - PLACE
      ?auto_2529970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2529972 ?auto_2529971 ) ( SURFACE-AT ?auto_2529968 ?auto_2529971 ) ( CLEAR ?auto_2529968 ) ( IS-CRATE ?auto_2529969 ) ( not ( = ?auto_2529968 ?auto_2529969 ) ) ( TRUCK-AT ?auto_2529970 ?auto_2529971 ) ( AVAILABLE ?auto_2529972 ) ( IN ?auto_2529969 ?auto_2529970 ) ( ON ?auto_2529968 ?auto_2529967 ) ( not ( = ?auto_2529967 ?auto_2529968 ) ) ( not ( = ?auto_2529967 ?auto_2529969 ) ) ( ON ?auto_2529963 ?auto_2529962 ) ( ON ?auto_2529964 ?auto_2529963 ) ( ON ?auto_2529965 ?auto_2529964 ) ( ON ?auto_2529966 ?auto_2529965 ) ( ON ?auto_2529967 ?auto_2529966 ) ( not ( = ?auto_2529962 ?auto_2529963 ) ) ( not ( = ?auto_2529962 ?auto_2529964 ) ) ( not ( = ?auto_2529962 ?auto_2529965 ) ) ( not ( = ?auto_2529962 ?auto_2529966 ) ) ( not ( = ?auto_2529962 ?auto_2529967 ) ) ( not ( = ?auto_2529962 ?auto_2529968 ) ) ( not ( = ?auto_2529962 ?auto_2529969 ) ) ( not ( = ?auto_2529963 ?auto_2529964 ) ) ( not ( = ?auto_2529963 ?auto_2529965 ) ) ( not ( = ?auto_2529963 ?auto_2529966 ) ) ( not ( = ?auto_2529963 ?auto_2529967 ) ) ( not ( = ?auto_2529963 ?auto_2529968 ) ) ( not ( = ?auto_2529963 ?auto_2529969 ) ) ( not ( = ?auto_2529964 ?auto_2529965 ) ) ( not ( = ?auto_2529964 ?auto_2529966 ) ) ( not ( = ?auto_2529964 ?auto_2529967 ) ) ( not ( = ?auto_2529964 ?auto_2529968 ) ) ( not ( = ?auto_2529964 ?auto_2529969 ) ) ( not ( = ?auto_2529965 ?auto_2529966 ) ) ( not ( = ?auto_2529965 ?auto_2529967 ) ) ( not ( = ?auto_2529965 ?auto_2529968 ) ) ( not ( = ?auto_2529965 ?auto_2529969 ) ) ( not ( = ?auto_2529966 ?auto_2529967 ) ) ( not ( = ?auto_2529966 ?auto_2529968 ) ) ( not ( = ?auto_2529966 ?auto_2529969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2529967 ?auto_2529968 ?auto_2529969 )
      ( MAKE-7CRATE-VERIFY ?auto_2529962 ?auto_2529963 ?auto_2529964 ?auto_2529965 ?auto_2529966 ?auto_2529967 ?auto_2529968 ?auto_2529969 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530025 - SURFACE
      ?auto_2530026 - SURFACE
      ?auto_2530027 - SURFACE
      ?auto_2530028 - SURFACE
      ?auto_2530029 - SURFACE
      ?auto_2530030 - SURFACE
      ?auto_2530031 - SURFACE
      ?auto_2530032 - SURFACE
    )
    :vars
    (
      ?auto_2530034 - HOIST
      ?auto_2530035 - PLACE
      ?auto_2530036 - TRUCK
      ?auto_2530033 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530034 ?auto_2530035 ) ( SURFACE-AT ?auto_2530031 ?auto_2530035 ) ( CLEAR ?auto_2530031 ) ( IS-CRATE ?auto_2530032 ) ( not ( = ?auto_2530031 ?auto_2530032 ) ) ( AVAILABLE ?auto_2530034 ) ( IN ?auto_2530032 ?auto_2530036 ) ( ON ?auto_2530031 ?auto_2530030 ) ( not ( = ?auto_2530030 ?auto_2530031 ) ) ( not ( = ?auto_2530030 ?auto_2530032 ) ) ( TRUCK-AT ?auto_2530036 ?auto_2530033 ) ( not ( = ?auto_2530033 ?auto_2530035 ) ) ( ON ?auto_2530026 ?auto_2530025 ) ( ON ?auto_2530027 ?auto_2530026 ) ( ON ?auto_2530028 ?auto_2530027 ) ( ON ?auto_2530029 ?auto_2530028 ) ( ON ?auto_2530030 ?auto_2530029 ) ( not ( = ?auto_2530025 ?auto_2530026 ) ) ( not ( = ?auto_2530025 ?auto_2530027 ) ) ( not ( = ?auto_2530025 ?auto_2530028 ) ) ( not ( = ?auto_2530025 ?auto_2530029 ) ) ( not ( = ?auto_2530025 ?auto_2530030 ) ) ( not ( = ?auto_2530025 ?auto_2530031 ) ) ( not ( = ?auto_2530025 ?auto_2530032 ) ) ( not ( = ?auto_2530026 ?auto_2530027 ) ) ( not ( = ?auto_2530026 ?auto_2530028 ) ) ( not ( = ?auto_2530026 ?auto_2530029 ) ) ( not ( = ?auto_2530026 ?auto_2530030 ) ) ( not ( = ?auto_2530026 ?auto_2530031 ) ) ( not ( = ?auto_2530026 ?auto_2530032 ) ) ( not ( = ?auto_2530027 ?auto_2530028 ) ) ( not ( = ?auto_2530027 ?auto_2530029 ) ) ( not ( = ?auto_2530027 ?auto_2530030 ) ) ( not ( = ?auto_2530027 ?auto_2530031 ) ) ( not ( = ?auto_2530027 ?auto_2530032 ) ) ( not ( = ?auto_2530028 ?auto_2530029 ) ) ( not ( = ?auto_2530028 ?auto_2530030 ) ) ( not ( = ?auto_2530028 ?auto_2530031 ) ) ( not ( = ?auto_2530028 ?auto_2530032 ) ) ( not ( = ?auto_2530029 ?auto_2530030 ) ) ( not ( = ?auto_2530029 ?auto_2530031 ) ) ( not ( = ?auto_2530029 ?auto_2530032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530030 ?auto_2530031 ?auto_2530032 )
      ( MAKE-7CRATE-VERIFY ?auto_2530025 ?auto_2530026 ?auto_2530027 ?auto_2530028 ?auto_2530029 ?auto_2530030 ?auto_2530031 ?auto_2530032 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530095 - SURFACE
      ?auto_2530096 - SURFACE
      ?auto_2530097 - SURFACE
      ?auto_2530098 - SURFACE
      ?auto_2530099 - SURFACE
      ?auto_2530100 - SURFACE
      ?auto_2530101 - SURFACE
      ?auto_2530102 - SURFACE
    )
    :vars
    (
      ?auto_2530106 - HOIST
      ?auto_2530107 - PLACE
      ?auto_2530103 - TRUCK
      ?auto_2530104 - PLACE
      ?auto_2530105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530106 ?auto_2530107 ) ( SURFACE-AT ?auto_2530101 ?auto_2530107 ) ( CLEAR ?auto_2530101 ) ( IS-CRATE ?auto_2530102 ) ( not ( = ?auto_2530101 ?auto_2530102 ) ) ( AVAILABLE ?auto_2530106 ) ( ON ?auto_2530101 ?auto_2530100 ) ( not ( = ?auto_2530100 ?auto_2530101 ) ) ( not ( = ?auto_2530100 ?auto_2530102 ) ) ( TRUCK-AT ?auto_2530103 ?auto_2530104 ) ( not ( = ?auto_2530104 ?auto_2530107 ) ) ( HOIST-AT ?auto_2530105 ?auto_2530104 ) ( LIFTING ?auto_2530105 ?auto_2530102 ) ( not ( = ?auto_2530106 ?auto_2530105 ) ) ( ON ?auto_2530096 ?auto_2530095 ) ( ON ?auto_2530097 ?auto_2530096 ) ( ON ?auto_2530098 ?auto_2530097 ) ( ON ?auto_2530099 ?auto_2530098 ) ( ON ?auto_2530100 ?auto_2530099 ) ( not ( = ?auto_2530095 ?auto_2530096 ) ) ( not ( = ?auto_2530095 ?auto_2530097 ) ) ( not ( = ?auto_2530095 ?auto_2530098 ) ) ( not ( = ?auto_2530095 ?auto_2530099 ) ) ( not ( = ?auto_2530095 ?auto_2530100 ) ) ( not ( = ?auto_2530095 ?auto_2530101 ) ) ( not ( = ?auto_2530095 ?auto_2530102 ) ) ( not ( = ?auto_2530096 ?auto_2530097 ) ) ( not ( = ?auto_2530096 ?auto_2530098 ) ) ( not ( = ?auto_2530096 ?auto_2530099 ) ) ( not ( = ?auto_2530096 ?auto_2530100 ) ) ( not ( = ?auto_2530096 ?auto_2530101 ) ) ( not ( = ?auto_2530096 ?auto_2530102 ) ) ( not ( = ?auto_2530097 ?auto_2530098 ) ) ( not ( = ?auto_2530097 ?auto_2530099 ) ) ( not ( = ?auto_2530097 ?auto_2530100 ) ) ( not ( = ?auto_2530097 ?auto_2530101 ) ) ( not ( = ?auto_2530097 ?auto_2530102 ) ) ( not ( = ?auto_2530098 ?auto_2530099 ) ) ( not ( = ?auto_2530098 ?auto_2530100 ) ) ( not ( = ?auto_2530098 ?auto_2530101 ) ) ( not ( = ?auto_2530098 ?auto_2530102 ) ) ( not ( = ?auto_2530099 ?auto_2530100 ) ) ( not ( = ?auto_2530099 ?auto_2530101 ) ) ( not ( = ?auto_2530099 ?auto_2530102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530100 ?auto_2530101 ?auto_2530102 )
      ( MAKE-7CRATE-VERIFY ?auto_2530095 ?auto_2530096 ?auto_2530097 ?auto_2530098 ?auto_2530099 ?auto_2530100 ?auto_2530101 ?auto_2530102 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530172 - SURFACE
      ?auto_2530173 - SURFACE
      ?auto_2530174 - SURFACE
      ?auto_2530175 - SURFACE
      ?auto_2530176 - SURFACE
      ?auto_2530177 - SURFACE
      ?auto_2530178 - SURFACE
      ?auto_2530179 - SURFACE
    )
    :vars
    (
      ?auto_2530181 - HOIST
      ?auto_2530182 - PLACE
      ?auto_2530185 - TRUCK
      ?auto_2530183 - PLACE
      ?auto_2530184 - HOIST
      ?auto_2530180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530181 ?auto_2530182 ) ( SURFACE-AT ?auto_2530178 ?auto_2530182 ) ( CLEAR ?auto_2530178 ) ( IS-CRATE ?auto_2530179 ) ( not ( = ?auto_2530178 ?auto_2530179 ) ) ( AVAILABLE ?auto_2530181 ) ( ON ?auto_2530178 ?auto_2530177 ) ( not ( = ?auto_2530177 ?auto_2530178 ) ) ( not ( = ?auto_2530177 ?auto_2530179 ) ) ( TRUCK-AT ?auto_2530185 ?auto_2530183 ) ( not ( = ?auto_2530183 ?auto_2530182 ) ) ( HOIST-AT ?auto_2530184 ?auto_2530183 ) ( not ( = ?auto_2530181 ?auto_2530184 ) ) ( AVAILABLE ?auto_2530184 ) ( SURFACE-AT ?auto_2530179 ?auto_2530183 ) ( ON ?auto_2530179 ?auto_2530180 ) ( CLEAR ?auto_2530179 ) ( not ( = ?auto_2530178 ?auto_2530180 ) ) ( not ( = ?auto_2530179 ?auto_2530180 ) ) ( not ( = ?auto_2530177 ?auto_2530180 ) ) ( ON ?auto_2530173 ?auto_2530172 ) ( ON ?auto_2530174 ?auto_2530173 ) ( ON ?auto_2530175 ?auto_2530174 ) ( ON ?auto_2530176 ?auto_2530175 ) ( ON ?auto_2530177 ?auto_2530176 ) ( not ( = ?auto_2530172 ?auto_2530173 ) ) ( not ( = ?auto_2530172 ?auto_2530174 ) ) ( not ( = ?auto_2530172 ?auto_2530175 ) ) ( not ( = ?auto_2530172 ?auto_2530176 ) ) ( not ( = ?auto_2530172 ?auto_2530177 ) ) ( not ( = ?auto_2530172 ?auto_2530178 ) ) ( not ( = ?auto_2530172 ?auto_2530179 ) ) ( not ( = ?auto_2530172 ?auto_2530180 ) ) ( not ( = ?auto_2530173 ?auto_2530174 ) ) ( not ( = ?auto_2530173 ?auto_2530175 ) ) ( not ( = ?auto_2530173 ?auto_2530176 ) ) ( not ( = ?auto_2530173 ?auto_2530177 ) ) ( not ( = ?auto_2530173 ?auto_2530178 ) ) ( not ( = ?auto_2530173 ?auto_2530179 ) ) ( not ( = ?auto_2530173 ?auto_2530180 ) ) ( not ( = ?auto_2530174 ?auto_2530175 ) ) ( not ( = ?auto_2530174 ?auto_2530176 ) ) ( not ( = ?auto_2530174 ?auto_2530177 ) ) ( not ( = ?auto_2530174 ?auto_2530178 ) ) ( not ( = ?auto_2530174 ?auto_2530179 ) ) ( not ( = ?auto_2530174 ?auto_2530180 ) ) ( not ( = ?auto_2530175 ?auto_2530176 ) ) ( not ( = ?auto_2530175 ?auto_2530177 ) ) ( not ( = ?auto_2530175 ?auto_2530178 ) ) ( not ( = ?auto_2530175 ?auto_2530179 ) ) ( not ( = ?auto_2530175 ?auto_2530180 ) ) ( not ( = ?auto_2530176 ?auto_2530177 ) ) ( not ( = ?auto_2530176 ?auto_2530178 ) ) ( not ( = ?auto_2530176 ?auto_2530179 ) ) ( not ( = ?auto_2530176 ?auto_2530180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530177 ?auto_2530178 ?auto_2530179 )
      ( MAKE-7CRATE-VERIFY ?auto_2530172 ?auto_2530173 ?auto_2530174 ?auto_2530175 ?auto_2530176 ?auto_2530177 ?auto_2530178 ?auto_2530179 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530250 - SURFACE
      ?auto_2530251 - SURFACE
      ?auto_2530252 - SURFACE
      ?auto_2530253 - SURFACE
      ?auto_2530254 - SURFACE
      ?auto_2530255 - SURFACE
      ?auto_2530256 - SURFACE
      ?auto_2530257 - SURFACE
    )
    :vars
    (
      ?auto_2530260 - HOIST
      ?auto_2530263 - PLACE
      ?auto_2530262 - PLACE
      ?auto_2530258 - HOIST
      ?auto_2530261 - SURFACE
      ?auto_2530259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530260 ?auto_2530263 ) ( SURFACE-AT ?auto_2530256 ?auto_2530263 ) ( CLEAR ?auto_2530256 ) ( IS-CRATE ?auto_2530257 ) ( not ( = ?auto_2530256 ?auto_2530257 ) ) ( AVAILABLE ?auto_2530260 ) ( ON ?auto_2530256 ?auto_2530255 ) ( not ( = ?auto_2530255 ?auto_2530256 ) ) ( not ( = ?auto_2530255 ?auto_2530257 ) ) ( not ( = ?auto_2530262 ?auto_2530263 ) ) ( HOIST-AT ?auto_2530258 ?auto_2530262 ) ( not ( = ?auto_2530260 ?auto_2530258 ) ) ( AVAILABLE ?auto_2530258 ) ( SURFACE-AT ?auto_2530257 ?auto_2530262 ) ( ON ?auto_2530257 ?auto_2530261 ) ( CLEAR ?auto_2530257 ) ( not ( = ?auto_2530256 ?auto_2530261 ) ) ( not ( = ?auto_2530257 ?auto_2530261 ) ) ( not ( = ?auto_2530255 ?auto_2530261 ) ) ( TRUCK-AT ?auto_2530259 ?auto_2530263 ) ( ON ?auto_2530251 ?auto_2530250 ) ( ON ?auto_2530252 ?auto_2530251 ) ( ON ?auto_2530253 ?auto_2530252 ) ( ON ?auto_2530254 ?auto_2530253 ) ( ON ?auto_2530255 ?auto_2530254 ) ( not ( = ?auto_2530250 ?auto_2530251 ) ) ( not ( = ?auto_2530250 ?auto_2530252 ) ) ( not ( = ?auto_2530250 ?auto_2530253 ) ) ( not ( = ?auto_2530250 ?auto_2530254 ) ) ( not ( = ?auto_2530250 ?auto_2530255 ) ) ( not ( = ?auto_2530250 ?auto_2530256 ) ) ( not ( = ?auto_2530250 ?auto_2530257 ) ) ( not ( = ?auto_2530250 ?auto_2530261 ) ) ( not ( = ?auto_2530251 ?auto_2530252 ) ) ( not ( = ?auto_2530251 ?auto_2530253 ) ) ( not ( = ?auto_2530251 ?auto_2530254 ) ) ( not ( = ?auto_2530251 ?auto_2530255 ) ) ( not ( = ?auto_2530251 ?auto_2530256 ) ) ( not ( = ?auto_2530251 ?auto_2530257 ) ) ( not ( = ?auto_2530251 ?auto_2530261 ) ) ( not ( = ?auto_2530252 ?auto_2530253 ) ) ( not ( = ?auto_2530252 ?auto_2530254 ) ) ( not ( = ?auto_2530252 ?auto_2530255 ) ) ( not ( = ?auto_2530252 ?auto_2530256 ) ) ( not ( = ?auto_2530252 ?auto_2530257 ) ) ( not ( = ?auto_2530252 ?auto_2530261 ) ) ( not ( = ?auto_2530253 ?auto_2530254 ) ) ( not ( = ?auto_2530253 ?auto_2530255 ) ) ( not ( = ?auto_2530253 ?auto_2530256 ) ) ( not ( = ?auto_2530253 ?auto_2530257 ) ) ( not ( = ?auto_2530253 ?auto_2530261 ) ) ( not ( = ?auto_2530254 ?auto_2530255 ) ) ( not ( = ?auto_2530254 ?auto_2530256 ) ) ( not ( = ?auto_2530254 ?auto_2530257 ) ) ( not ( = ?auto_2530254 ?auto_2530261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530255 ?auto_2530256 ?auto_2530257 )
      ( MAKE-7CRATE-VERIFY ?auto_2530250 ?auto_2530251 ?auto_2530252 ?auto_2530253 ?auto_2530254 ?auto_2530255 ?auto_2530256 ?auto_2530257 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530328 - SURFACE
      ?auto_2530329 - SURFACE
      ?auto_2530330 - SURFACE
      ?auto_2530331 - SURFACE
      ?auto_2530332 - SURFACE
      ?auto_2530333 - SURFACE
      ?auto_2530334 - SURFACE
      ?auto_2530335 - SURFACE
    )
    :vars
    (
      ?auto_2530341 - HOIST
      ?auto_2530339 - PLACE
      ?auto_2530338 - PLACE
      ?auto_2530340 - HOIST
      ?auto_2530337 - SURFACE
      ?auto_2530336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530341 ?auto_2530339 ) ( IS-CRATE ?auto_2530335 ) ( not ( = ?auto_2530334 ?auto_2530335 ) ) ( not ( = ?auto_2530333 ?auto_2530334 ) ) ( not ( = ?auto_2530333 ?auto_2530335 ) ) ( not ( = ?auto_2530338 ?auto_2530339 ) ) ( HOIST-AT ?auto_2530340 ?auto_2530338 ) ( not ( = ?auto_2530341 ?auto_2530340 ) ) ( AVAILABLE ?auto_2530340 ) ( SURFACE-AT ?auto_2530335 ?auto_2530338 ) ( ON ?auto_2530335 ?auto_2530337 ) ( CLEAR ?auto_2530335 ) ( not ( = ?auto_2530334 ?auto_2530337 ) ) ( not ( = ?auto_2530335 ?auto_2530337 ) ) ( not ( = ?auto_2530333 ?auto_2530337 ) ) ( TRUCK-AT ?auto_2530336 ?auto_2530339 ) ( SURFACE-AT ?auto_2530333 ?auto_2530339 ) ( CLEAR ?auto_2530333 ) ( LIFTING ?auto_2530341 ?auto_2530334 ) ( IS-CRATE ?auto_2530334 ) ( ON ?auto_2530329 ?auto_2530328 ) ( ON ?auto_2530330 ?auto_2530329 ) ( ON ?auto_2530331 ?auto_2530330 ) ( ON ?auto_2530332 ?auto_2530331 ) ( ON ?auto_2530333 ?auto_2530332 ) ( not ( = ?auto_2530328 ?auto_2530329 ) ) ( not ( = ?auto_2530328 ?auto_2530330 ) ) ( not ( = ?auto_2530328 ?auto_2530331 ) ) ( not ( = ?auto_2530328 ?auto_2530332 ) ) ( not ( = ?auto_2530328 ?auto_2530333 ) ) ( not ( = ?auto_2530328 ?auto_2530334 ) ) ( not ( = ?auto_2530328 ?auto_2530335 ) ) ( not ( = ?auto_2530328 ?auto_2530337 ) ) ( not ( = ?auto_2530329 ?auto_2530330 ) ) ( not ( = ?auto_2530329 ?auto_2530331 ) ) ( not ( = ?auto_2530329 ?auto_2530332 ) ) ( not ( = ?auto_2530329 ?auto_2530333 ) ) ( not ( = ?auto_2530329 ?auto_2530334 ) ) ( not ( = ?auto_2530329 ?auto_2530335 ) ) ( not ( = ?auto_2530329 ?auto_2530337 ) ) ( not ( = ?auto_2530330 ?auto_2530331 ) ) ( not ( = ?auto_2530330 ?auto_2530332 ) ) ( not ( = ?auto_2530330 ?auto_2530333 ) ) ( not ( = ?auto_2530330 ?auto_2530334 ) ) ( not ( = ?auto_2530330 ?auto_2530335 ) ) ( not ( = ?auto_2530330 ?auto_2530337 ) ) ( not ( = ?auto_2530331 ?auto_2530332 ) ) ( not ( = ?auto_2530331 ?auto_2530333 ) ) ( not ( = ?auto_2530331 ?auto_2530334 ) ) ( not ( = ?auto_2530331 ?auto_2530335 ) ) ( not ( = ?auto_2530331 ?auto_2530337 ) ) ( not ( = ?auto_2530332 ?auto_2530333 ) ) ( not ( = ?auto_2530332 ?auto_2530334 ) ) ( not ( = ?auto_2530332 ?auto_2530335 ) ) ( not ( = ?auto_2530332 ?auto_2530337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530333 ?auto_2530334 ?auto_2530335 )
      ( MAKE-7CRATE-VERIFY ?auto_2530328 ?auto_2530329 ?auto_2530330 ?auto_2530331 ?auto_2530332 ?auto_2530333 ?auto_2530334 ?auto_2530335 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2530406 - SURFACE
      ?auto_2530407 - SURFACE
      ?auto_2530408 - SURFACE
      ?auto_2530409 - SURFACE
      ?auto_2530410 - SURFACE
      ?auto_2530411 - SURFACE
      ?auto_2530412 - SURFACE
      ?auto_2530413 - SURFACE
    )
    :vars
    (
      ?auto_2530415 - HOIST
      ?auto_2530418 - PLACE
      ?auto_2530417 - PLACE
      ?auto_2530416 - HOIST
      ?auto_2530414 - SURFACE
      ?auto_2530419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2530415 ?auto_2530418 ) ( IS-CRATE ?auto_2530413 ) ( not ( = ?auto_2530412 ?auto_2530413 ) ) ( not ( = ?auto_2530411 ?auto_2530412 ) ) ( not ( = ?auto_2530411 ?auto_2530413 ) ) ( not ( = ?auto_2530417 ?auto_2530418 ) ) ( HOIST-AT ?auto_2530416 ?auto_2530417 ) ( not ( = ?auto_2530415 ?auto_2530416 ) ) ( AVAILABLE ?auto_2530416 ) ( SURFACE-AT ?auto_2530413 ?auto_2530417 ) ( ON ?auto_2530413 ?auto_2530414 ) ( CLEAR ?auto_2530413 ) ( not ( = ?auto_2530412 ?auto_2530414 ) ) ( not ( = ?auto_2530413 ?auto_2530414 ) ) ( not ( = ?auto_2530411 ?auto_2530414 ) ) ( TRUCK-AT ?auto_2530419 ?auto_2530418 ) ( SURFACE-AT ?auto_2530411 ?auto_2530418 ) ( CLEAR ?auto_2530411 ) ( IS-CRATE ?auto_2530412 ) ( AVAILABLE ?auto_2530415 ) ( IN ?auto_2530412 ?auto_2530419 ) ( ON ?auto_2530407 ?auto_2530406 ) ( ON ?auto_2530408 ?auto_2530407 ) ( ON ?auto_2530409 ?auto_2530408 ) ( ON ?auto_2530410 ?auto_2530409 ) ( ON ?auto_2530411 ?auto_2530410 ) ( not ( = ?auto_2530406 ?auto_2530407 ) ) ( not ( = ?auto_2530406 ?auto_2530408 ) ) ( not ( = ?auto_2530406 ?auto_2530409 ) ) ( not ( = ?auto_2530406 ?auto_2530410 ) ) ( not ( = ?auto_2530406 ?auto_2530411 ) ) ( not ( = ?auto_2530406 ?auto_2530412 ) ) ( not ( = ?auto_2530406 ?auto_2530413 ) ) ( not ( = ?auto_2530406 ?auto_2530414 ) ) ( not ( = ?auto_2530407 ?auto_2530408 ) ) ( not ( = ?auto_2530407 ?auto_2530409 ) ) ( not ( = ?auto_2530407 ?auto_2530410 ) ) ( not ( = ?auto_2530407 ?auto_2530411 ) ) ( not ( = ?auto_2530407 ?auto_2530412 ) ) ( not ( = ?auto_2530407 ?auto_2530413 ) ) ( not ( = ?auto_2530407 ?auto_2530414 ) ) ( not ( = ?auto_2530408 ?auto_2530409 ) ) ( not ( = ?auto_2530408 ?auto_2530410 ) ) ( not ( = ?auto_2530408 ?auto_2530411 ) ) ( not ( = ?auto_2530408 ?auto_2530412 ) ) ( not ( = ?auto_2530408 ?auto_2530413 ) ) ( not ( = ?auto_2530408 ?auto_2530414 ) ) ( not ( = ?auto_2530409 ?auto_2530410 ) ) ( not ( = ?auto_2530409 ?auto_2530411 ) ) ( not ( = ?auto_2530409 ?auto_2530412 ) ) ( not ( = ?auto_2530409 ?auto_2530413 ) ) ( not ( = ?auto_2530409 ?auto_2530414 ) ) ( not ( = ?auto_2530410 ?auto_2530411 ) ) ( not ( = ?auto_2530410 ?auto_2530412 ) ) ( not ( = ?auto_2530410 ?auto_2530413 ) ) ( not ( = ?auto_2530410 ?auto_2530414 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2530411 ?auto_2530412 ?auto_2530413 )
      ( MAKE-7CRATE-VERIFY ?auto_2530406 ?auto_2530407 ?auto_2530408 ?auto_2530409 ?auto_2530410 ?auto_2530411 ?auto_2530412 ?auto_2530413 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533325 - SURFACE
      ?auto_2533326 - SURFACE
      ?auto_2533327 - SURFACE
      ?auto_2533328 - SURFACE
      ?auto_2533329 - SURFACE
      ?auto_2533330 - SURFACE
      ?auto_2533331 - SURFACE
      ?auto_2533332 - SURFACE
      ?auto_2533333 - SURFACE
    )
    :vars
    (
      ?auto_2533335 - HOIST
      ?auto_2533334 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533335 ?auto_2533334 ) ( SURFACE-AT ?auto_2533332 ?auto_2533334 ) ( CLEAR ?auto_2533332 ) ( LIFTING ?auto_2533335 ?auto_2533333 ) ( IS-CRATE ?auto_2533333 ) ( not ( = ?auto_2533332 ?auto_2533333 ) ) ( ON ?auto_2533326 ?auto_2533325 ) ( ON ?auto_2533327 ?auto_2533326 ) ( ON ?auto_2533328 ?auto_2533327 ) ( ON ?auto_2533329 ?auto_2533328 ) ( ON ?auto_2533330 ?auto_2533329 ) ( ON ?auto_2533331 ?auto_2533330 ) ( ON ?auto_2533332 ?auto_2533331 ) ( not ( = ?auto_2533325 ?auto_2533326 ) ) ( not ( = ?auto_2533325 ?auto_2533327 ) ) ( not ( = ?auto_2533325 ?auto_2533328 ) ) ( not ( = ?auto_2533325 ?auto_2533329 ) ) ( not ( = ?auto_2533325 ?auto_2533330 ) ) ( not ( = ?auto_2533325 ?auto_2533331 ) ) ( not ( = ?auto_2533325 ?auto_2533332 ) ) ( not ( = ?auto_2533325 ?auto_2533333 ) ) ( not ( = ?auto_2533326 ?auto_2533327 ) ) ( not ( = ?auto_2533326 ?auto_2533328 ) ) ( not ( = ?auto_2533326 ?auto_2533329 ) ) ( not ( = ?auto_2533326 ?auto_2533330 ) ) ( not ( = ?auto_2533326 ?auto_2533331 ) ) ( not ( = ?auto_2533326 ?auto_2533332 ) ) ( not ( = ?auto_2533326 ?auto_2533333 ) ) ( not ( = ?auto_2533327 ?auto_2533328 ) ) ( not ( = ?auto_2533327 ?auto_2533329 ) ) ( not ( = ?auto_2533327 ?auto_2533330 ) ) ( not ( = ?auto_2533327 ?auto_2533331 ) ) ( not ( = ?auto_2533327 ?auto_2533332 ) ) ( not ( = ?auto_2533327 ?auto_2533333 ) ) ( not ( = ?auto_2533328 ?auto_2533329 ) ) ( not ( = ?auto_2533328 ?auto_2533330 ) ) ( not ( = ?auto_2533328 ?auto_2533331 ) ) ( not ( = ?auto_2533328 ?auto_2533332 ) ) ( not ( = ?auto_2533328 ?auto_2533333 ) ) ( not ( = ?auto_2533329 ?auto_2533330 ) ) ( not ( = ?auto_2533329 ?auto_2533331 ) ) ( not ( = ?auto_2533329 ?auto_2533332 ) ) ( not ( = ?auto_2533329 ?auto_2533333 ) ) ( not ( = ?auto_2533330 ?auto_2533331 ) ) ( not ( = ?auto_2533330 ?auto_2533332 ) ) ( not ( = ?auto_2533330 ?auto_2533333 ) ) ( not ( = ?auto_2533331 ?auto_2533332 ) ) ( not ( = ?auto_2533331 ?auto_2533333 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2533332 ?auto_2533333 )
      ( MAKE-8CRATE-VERIFY ?auto_2533325 ?auto_2533326 ?auto_2533327 ?auto_2533328 ?auto_2533329 ?auto_2533330 ?auto_2533331 ?auto_2533332 ?auto_2533333 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533392 - SURFACE
      ?auto_2533393 - SURFACE
      ?auto_2533394 - SURFACE
      ?auto_2533395 - SURFACE
      ?auto_2533396 - SURFACE
      ?auto_2533397 - SURFACE
      ?auto_2533398 - SURFACE
      ?auto_2533399 - SURFACE
      ?auto_2533400 - SURFACE
    )
    :vars
    (
      ?auto_2533403 - HOIST
      ?auto_2533401 - PLACE
      ?auto_2533402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533403 ?auto_2533401 ) ( SURFACE-AT ?auto_2533399 ?auto_2533401 ) ( CLEAR ?auto_2533399 ) ( IS-CRATE ?auto_2533400 ) ( not ( = ?auto_2533399 ?auto_2533400 ) ) ( TRUCK-AT ?auto_2533402 ?auto_2533401 ) ( AVAILABLE ?auto_2533403 ) ( IN ?auto_2533400 ?auto_2533402 ) ( ON ?auto_2533399 ?auto_2533398 ) ( not ( = ?auto_2533398 ?auto_2533399 ) ) ( not ( = ?auto_2533398 ?auto_2533400 ) ) ( ON ?auto_2533393 ?auto_2533392 ) ( ON ?auto_2533394 ?auto_2533393 ) ( ON ?auto_2533395 ?auto_2533394 ) ( ON ?auto_2533396 ?auto_2533395 ) ( ON ?auto_2533397 ?auto_2533396 ) ( ON ?auto_2533398 ?auto_2533397 ) ( not ( = ?auto_2533392 ?auto_2533393 ) ) ( not ( = ?auto_2533392 ?auto_2533394 ) ) ( not ( = ?auto_2533392 ?auto_2533395 ) ) ( not ( = ?auto_2533392 ?auto_2533396 ) ) ( not ( = ?auto_2533392 ?auto_2533397 ) ) ( not ( = ?auto_2533392 ?auto_2533398 ) ) ( not ( = ?auto_2533392 ?auto_2533399 ) ) ( not ( = ?auto_2533392 ?auto_2533400 ) ) ( not ( = ?auto_2533393 ?auto_2533394 ) ) ( not ( = ?auto_2533393 ?auto_2533395 ) ) ( not ( = ?auto_2533393 ?auto_2533396 ) ) ( not ( = ?auto_2533393 ?auto_2533397 ) ) ( not ( = ?auto_2533393 ?auto_2533398 ) ) ( not ( = ?auto_2533393 ?auto_2533399 ) ) ( not ( = ?auto_2533393 ?auto_2533400 ) ) ( not ( = ?auto_2533394 ?auto_2533395 ) ) ( not ( = ?auto_2533394 ?auto_2533396 ) ) ( not ( = ?auto_2533394 ?auto_2533397 ) ) ( not ( = ?auto_2533394 ?auto_2533398 ) ) ( not ( = ?auto_2533394 ?auto_2533399 ) ) ( not ( = ?auto_2533394 ?auto_2533400 ) ) ( not ( = ?auto_2533395 ?auto_2533396 ) ) ( not ( = ?auto_2533395 ?auto_2533397 ) ) ( not ( = ?auto_2533395 ?auto_2533398 ) ) ( not ( = ?auto_2533395 ?auto_2533399 ) ) ( not ( = ?auto_2533395 ?auto_2533400 ) ) ( not ( = ?auto_2533396 ?auto_2533397 ) ) ( not ( = ?auto_2533396 ?auto_2533398 ) ) ( not ( = ?auto_2533396 ?auto_2533399 ) ) ( not ( = ?auto_2533396 ?auto_2533400 ) ) ( not ( = ?auto_2533397 ?auto_2533398 ) ) ( not ( = ?auto_2533397 ?auto_2533399 ) ) ( not ( = ?auto_2533397 ?auto_2533400 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2533398 ?auto_2533399 ?auto_2533400 )
      ( MAKE-8CRATE-VERIFY ?auto_2533392 ?auto_2533393 ?auto_2533394 ?auto_2533395 ?auto_2533396 ?auto_2533397 ?auto_2533398 ?auto_2533399 ?auto_2533400 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533468 - SURFACE
      ?auto_2533469 - SURFACE
      ?auto_2533470 - SURFACE
      ?auto_2533471 - SURFACE
      ?auto_2533472 - SURFACE
      ?auto_2533473 - SURFACE
      ?auto_2533474 - SURFACE
      ?auto_2533475 - SURFACE
      ?auto_2533476 - SURFACE
    )
    :vars
    (
      ?auto_2533478 - HOIST
      ?auto_2533480 - PLACE
      ?auto_2533477 - TRUCK
      ?auto_2533479 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533478 ?auto_2533480 ) ( SURFACE-AT ?auto_2533475 ?auto_2533480 ) ( CLEAR ?auto_2533475 ) ( IS-CRATE ?auto_2533476 ) ( not ( = ?auto_2533475 ?auto_2533476 ) ) ( AVAILABLE ?auto_2533478 ) ( IN ?auto_2533476 ?auto_2533477 ) ( ON ?auto_2533475 ?auto_2533474 ) ( not ( = ?auto_2533474 ?auto_2533475 ) ) ( not ( = ?auto_2533474 ?auto_2533476 ) ) ( TRUCK-AT ?auto_2533477 ?auto_2533479 ) ( not ( = ?auto_2533479 ?auto_2533480 ) ) ( ON ?auto_2533469 ?auto_2533468 ) ( ON ?auto_2533470 ?auto_2533469 ) ( ON ?auto_2533471 ?auto_2533470 ) ( ON ?auto_2533472 ?auto_2533471 ) ( ON ?auto_2533473 ?auto_2533472 ) ( ON ?auto_2533474 ?auto_2533473 ) ( not ( = ?auto_2533468 ?auto_2533469 ) ) ( not ( = ?auto_2533468 ?auto_2533470 ) ) ( not ( = ?auto_2533468 ?auto_2533471 ) ) ( not ( = ?auto_2533468 ?auto_2533472 ) ) ( not ( = ?auto_2533468 ?auto_2533473 ) ) ( not ( = ?auto_2533468 ?auto_2533474 ) ) ( not ( = ?auto_2533468 ?auto_2533475 ) ) ( not ( = ?auto_2533468 ?auto_2533476 ) ) ( not ( = ?auto_2533469 ?auto_2533470 ) ) ( not ( = ?auto_2533469 ?auto_2533471 ) ) ( not ( = ?auto_2533469 ?auto_2533472 ) ) ( not ( = ?auto_2533469 ?auto_2533473 ) ) ( not ( = ?auto_2533469 ?auto_2533474 ) ) ( not ( = ?auto_2533469 ?auto_2533475 ) ) ( not ( = ?auto_2533469 ?auto_2533476 ) ) ( not ( = ?auto_2533470 ?auto_2533471 ) ) ( not ( = ?auto_2533470 ?auto_2533472 ) ) ( not ( = ?auto_2533470 ?auto_2533473 ) ) ( not ( = ?auto_2533470 ?auto_2533474 ) ) ( not ( = ?auto_2533470 ?auto_2533475 ) ) ( not ( = ?auto_2533470 ?auto_2533476 ) ) ( not ( = ?auto_2533471 ?auto_2533472 ) ) ( not ( = ?auto_2533471 ?auto_2533473 ) ) ( not ( = ?auto_2533471 ?auto_2533474 ) ) ( not ( = ?auto_2533471 ?auto_2533475 ) ) ( not ( = ?auto_2533471 ?auto_2533476 ) ) ( not ( = ?auto_2533472 ?auto_2533473 ) ) ( not ( = ?auto_2533472 ?auto_2533474 ) ) ( not ( = ?auto_2533472 ?auto_2533475 ) ) ( not ( = ?auto_2533472 ?auto_2533476 ) ) ( not ( = ?auto_2533473 ?auto_2533474 ) ) ( not ( = ?auto_2533473 ?auto_2533475 ) ) ( not ( = ?auto_2533473 ?auto_2533476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2533474 ?auto_2533475 ?auto_2533476 )
      ( MAKE-8CRATE-VERIFY ?auto_2533468 ?auto_2533469 ?auto_2533470 ?auto_2533471 ?auto_2533472 ?auto_2533473 ?auto_2533474 ?auto_2533475 ?auto_2533476 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533552 - SURFACE
      ?auto_2533553 - SURFACE
      ?auto_2533554 - SURFACE
      ?auto_2533555 - SURFACE
      ?auto_2533556 - SURFACE
      ?auto_2533557 - SURFACE
      ?auto_2533558 - SURFACE
      ?auto_2533559 - SURFACE
      ?auto_2533560 - SURFACE
    )
    :vars
    (
      ?auto_2533565 - HOIST
      ?auto_2533563 - PLACE
      ?auto_2533561 - TRUCK
      ?auto_2533564 - PLACE
      ?auto_2533562 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533565 ?auto_2533563 ) ( SURFACE-AT ?auto_2533559 ?auto_2533563 ) ( CLEAR ?auto_2533559 ) ( IS-CRATE ?auto_2533560 ) ( not ( = ?auto_2533559 ?auto_2533560 ) ) ( AVAILABLE ?auto_2533565 ) ( ON ?auto_2533559 ?auto_2533558 ) ( not ( = ?auto_2533558 ?auto_2533559 ) ) ( not ( = ?auto_2533558 ?auto_2533560 ) ) ( TRUCK-AT ?auto_2533561 ?auto_2533564 ) ( not ( = ?auto_2533564 ?auto_2533563 ) ) ( HOIST-AT ?auto_2533562 ?auto_2533564 ) ( LIFTING ?auto_2533562 ?auto_2533560 ) ( not ( = ?auto_2533565 ?auto_2533562 ) ) ( ON ?auto_2533553 ?auto_2533552 ) ( ON ?auto_2533554 ?auto_2533553 ) ( ON ?auto_2533555 ?auto_2533554 ) ( ON ?auto_2533556 ?auto_2533555 ) ( ON ?auto_2533557 ?auto_2533556 ) ( ON ?auto_2533558 ?auto_2533557 ) ( not ( = ?auto_2533552 ?auto_2533553 ) ) ( not ( = ?auto_2533552 ?auto_2533554 ) ) ( not ( = ?auto_2533552 ?auto_2533555 ) ) ( not ( = ?auto_2533552 ?auto_2533556 ) ) ( not ( = ?auto_2533552 ?auto_2533557 ) ) ( not ( = ?auto_2533552 ?auto_2533558 ) ) ( not ( = ?auto_2533552 ?auto_2533559 ) ) ( not ( = ?auto_2533552 ?auto_2533560 ) ) ( not ( = ?auto_2533553 ?auto_2533554 ) ) ( not ( = ?auto_2533553 ?auto_2533555 ) ) ( not ( = ?auto_2533553 ?auto_2533556 ) ) ( not ( = ?auto_2533553 ?auto_2533557 ) ) ( not ( = ?auto_2533553 ?auto_2533558 ) ) ( not ( = ?auto_2533553 ?auto_2533559 ) ) ( not ( = ?auto_2533553 ?auto_2533560 ) ) ( not ( = ?auto_2533554 ?auto_2533555 ) ) ( not ( = ?auto_2533554 ?auto_2533556 ) ) ( not ( = ?auto_2533554 ?auto_2533557 ) ) ( not ( = ?auto_2533554 ?auto_2533558 ) ) ( not ( = ?auto_2533554 ?auto_2533559 ) ) ( not ( = ?auto_2533554 ?auto_2533560 ) ) ( not ( = ?auto_2533555 ?auto_2533556 ) ) ( not ( = ?auto_2533555 ?auto_2533557 ) ) ( not ( = ?auto_2533555 ?auto_2533558 ) ) ( not ( = ?auto_2533555 ?auto_2533559 ) ) ( not ( = ?auto_2533555 ?auto_2533560 ) ) ( not ( = ?auto_2533556 ?auto_2533557 ) ) ( not ( = ?auto_2533556 ?auto_2533558 ) ) ( not ( = ?auto_2533556 ?auto_2533559 ) ) ( not ( = ?auto_2533556 ?auto_2533560 ) ) ( not ( = ?auto_2533557 ?auto_2533558 ) ) ( not ( = ?auto_2533557 ?auto_2533559 ) ) ( not ( = ?auto_2533557 ?auto_2533560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2533558 ?auto_2533559 ?auto_2533560 )
      ( MAKE-8CRATE-VERIFY ?auto_2533552 ?auto_2533553 ?auto_2533554 ?auto_2533555 ?auto_2533556 ?auto_2533557 ?auto_2533558 ?auto_2533559 ?auto_2533560 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533644 - SURFACE
      ?auto_2533645 - SURFACE
      ?auto_2533646 - SURFACE
      ?auto_2533647 - SURFACE
      ?auto_2533648 - SURFACE
      ?auto_2533649 - SURFACE
      ?auto_2533650 - SURFACE
      ?auto_2533651 - SURFACE
      ?auto_2533652 - SURFACE
    )
    :vars
    (
      ?auto_2533658 - HOIST
      ?auto_2533657 - PLACE
      ?auto_2533655 - TRUCK
      ?auto_2533654 - PLACE
      ?auto_2533653 - HOIST
      ?auto_2533656 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533658 ?auto_2533657 ) ( SURFACE-AT ?auto_2533651 ?auto_2533657 ) ( CLEAR ?auto_2533651 ) ( IS-CRATE ?auto_2533652 ) ( not ( = ?auto_2533651 ?auto_2533652 ) ) ( AVAILABLE ?auto_2533658 ) ( ON ?auto_2533651 ?auto_2533650 ) ( not ( = ?auto_2533650 ?auto_2533651 ) ) ( not ( = ?auto_2533650 ?auto_2533652 ) ) ( TRUCK-AT ?auto_2533655 ?auto_2533654 ) ( not ( = ?auto_2533654 ?auto_2533657 ) ) ( HOIST-AT ?auto_2533653 ?auto_2533654 ) ( not ( = ?auto_2533658 ?auto_2533653 ) ) ( AVAILABLE ?auto_2533653 ) ( SURFACE-AT ?auto_2533652 ?auto_2533654 ) ( ON ?auto_2533652 ?auto_2533656 ) ( CLEAR ?auto_2533652 ) ( not ( = ?auto_2533651 ?auto_2533656 ) ) ( not ( = ?auto_2533652 ?auto_2533656 ) ) ( not ( = ?auto_2533650 ?auto_2533656 ) ) ( ON ?auto_2533645 ?auto_2533644 ) ( ON ?auto_2533646 ?auto_2533645 ) ( ON ?auto_2533647 ?auto_2533646 ) ( ON ?auto_2533648 ?auto_2533647 ) ( ON ?auto_2533649 ?auto_2533648 ) ( ON ?auto_2533650 ?auto_2533649 ) ( not ( = ?auto_2533644 ?auto_2533645 ) ) ( not ( = ?auto_2533644 ?auto_2533646 ) ) ( not ( = ?auto_2533644 ?auto_2533647 ) ) ( not ( = ?auto_2533644 ?auto_2533648 ) ) ( not ( = ?auto_2533644 ?auto_2533649 ) ) ( not ( = ?auto_2533644 ?auto_2533650 ) ) ( not ( = ?auto_2533644 ?auto_2533651 ) ) ( not ( = ?auto_2533644 ?auto_2533652 ) ) ( not ( = ?auto_2533644 ?auto_2533656 ) ) ( not ( = ?auto_2533645 ?auto_2533646 ) ) ( not ( = ?auto_2533645 ?auto_2533647 ) ) ( not ( = ?auto_2533645 ?auto_2533648 ) ) ( not ( = ?auto_2533645 ?auto_2533649 ) ) ( not ( = ?auto_2533645 ?auto_2533650 ) ) ( not ( = ?auto_2533645 ?auto_2533651 ) ) ( not ( = ?auto_2533645 ?auto_2533652 ) ) ( not ( = ?auto_2533645 ?auto_2533656 ) ) ( not ( = ?auto_2533646 ?auto_2533647 ) ) ( not ( = ?auto_2533646 ?auto_2533648 ) ) ( not ( = ?auto_2533646 ?auto_2533649 ) ) ( not ( = ?auto_2533646 ?auto_2533650 ) ) ( not ( = ?auto_2533646 ?auto_2533651 ) ) ( not ( = ?auto_2533646 ?auto_2533652 ) ) ( not ( = ?auto_2533646 ?auto_2533656 ) ) ( not ( = ?auto_2533647 ?auto_2533648 ) ) ( not ( = ?auto_2533647 ?auto_2533649 ) ) ( not ( = ?auto_2533647 ?auto_2533650 ) ) ( not ( = ?auto_2533647 ?auto_2533651 ) ) ( not ( = ?auto_2533647 ?auto_2533652 ) ) ( not ( = ?auto_2533647 ?auto_2533656 ) ) ( not ( = ?auto_2533648 ?auto_2533649 ) ) ( not ( = ?auto_2533648 ?auto_2533650 ) ) ( not ( = ?auto_2533648 ?auto_2533651 ) ) ( not ( = ?auto_2533648 ?auto_2533652 ) ) ( not ( = ?auto_2533648 ?auto_2533656 ) ) ( not ( = ?auto_2533649 ?auto_2533650 ) ) ( not ( = ?auto_2533649 ?auto_2533651 ) ) ( not ( = ?auto_2533649 ?auto_2533652 ) ) ( not ( = ?auto_2533649 ?auto_2533656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2533650 ?auto_2533651 ?auto_2533652 )
      ( MAKE-8CRATE-VERIFY ?auto_2533644 ?auto_2533645 ?auto_2533646 ?auto_2533647 ?auto_2533648 ?auto_2533649 ?auto_2533650 ?auto_2533651 ?auto_2533652 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533737 - SURFACE
      ?auto_2533738 - SURFACE
      ?auto_2533739 - SURFACE
      ?auto_2533740 - SURFACE
      ?auto_2533741 - SURFACE
      ?auto_2533742 - SURFACE
      ?auto_2533743 - SURFACE
      ?auto_2533744 - SURFACE
      ?auto_2533745 - SURFACE
    )
    :vars
    (
      ?auto_2533747 - HOIST
      ?auto_2533748 - PLACE
      ?auto_2533749 - PLACE
      ?auto_2533750 - HOIST
      ?auto_2533751 - SURFACE
      ?auto_2533746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533747 ?auto_2533748 ) ( SURFACE-AT ?auto_2533744 ?auto_2533748 ) ( CLEAR ?auto_2533744 ) ( IS-CRATE ?auto_2533745 ) ( not ( = ?auto_2533744 ?auto_2533745 ) ) ( AVAILABLE ?auto_2533747 ) ( ON ?auto_2533744 ?auto_2533743 ) ( not ( = ?auto_2533743 ?auto_2533744 ) ) ( not ( = ?auto_2533743 ?auto_2533745 ) ) ( not ( = ?auto_2533749 ?auto_2533748 ) ) ( HOIST-AT ?auto_2533750 ?auto_2533749 ) ( not ( = ?auto_2533747 ?auto_2533750 ) ) ( AVAILABLE ?auto_2533750 ) ( SURFACE-AT ?auto_2533745 ?auto_2533749 ) ( ON ?auto_2533745 ?auto_2533751 ) ( CLEAR ?auto_2533745 ) ( not ( = ?auto_2533744 ?auto_2533751 ) ) ( not ( = ?auto_2533745 ?auto_2533751 ) ) ( not ( = ?auto_2533743 ?auto_2533751 ) ) ( TRUCK-AT ?auto_2533746 ?auto_2533748 ) ( ON ?auto_2533738 ?auto_2533737 ) ( ON ?auto_2533739 ?auto_2533738 ) ( ON ?auto_2533740 ?auto_2533739 ) ( ON ?auto_2533741 ?auto_2533740 ) ( ON ?auto_2533742 ?auto_2533741 ) ( ON ?auto_2533743 ?auto_2533742 ) ( not ( = ?auto_2533737 ?auto_2533738 ) ) ( not ( = ?auto_2533737 ?auto_2533739 ) ) ( not ( = ?auto_2533737 ?auto_2533740 ) ) ( not ( = ?auto_2533737 ?auto_2533741 ) ) ( not ( = ?auto_2533737 ?auto_2533742 ) ) ( not ( = ?auto_2533737 ?auto_2533743 ) ) ( not ( = ?auto_2533737 ?auto_2533744 ) ) ( not ( = ?auto_2533737 ?auto_2533745 ) ) ( not ( = ?auto_2533737 ?auto_2533751 ) ) ( not ( = ?auto_2533738 ?auto_2533739 ) ) ( not ( = ?auto_2533738 ?auto_2533740 ) ) ( not ( = ?auto_2533738 ?auto_2533741 ) ) ( not ( = ?auto_2533738 ?auto_2533742 ) ) ( not ( = ?auto_2533738 ?auto_2533743 ) ) ( not ( = ?auto_2533738 ?auto_2533744 ) ) ( not ( = ?auto_2533738 ?auto_2533745 ) ) ( not ( = ?auto_2533738 ?auto_2533751 ) ) ( not ( = ?auto_2533739 ?auto_2533740 ) ) ( not ( = ?auto_2533739 ?auto_2533741 ) ) ( not ( = ?auto_2533739 ?auto_2533742 ) ) ( not ( = ?auto_2533739 ?auto_2533743 ) ) ( not ( = ?auto_2533739 ?auto_2533744 ) ) ( not ( = ?auto_2533739 ?auto_2533745 ) ) ( not ( = ?auto_2533739 ?auto_2533751 ) ) ( not ( = ?auto_2533740 ?auto_2533741 ) ) ( not ( = ?auto_2533740 ?auto_2533742 ) ) ( not ( = ?auto_2533740 ?auto_2533743 ) ) ( not ( = ?auto_2533740 ?auto_2533744 ) ) ( not ( = ?auto_2533740 ?auto_2533745 ) ) ( not ( = ?auto_2533740 ?auto_2533751 ) ) ( not ( = ?auto_2533741 ?auto_2533742 ) ) ( not ( = ?auto_2533741 ?auto_2533743 ) ) ( not ( = ?auto_2533741 ?auto_2533744 ) ) ( not ( = ?auto_2533741 ?auto_2533745 ) ) ( not ( = ?auto_2533741 ?auto_2533751 ) ) ( not ( = ?auto_2533742 ?auto_2533743 ) ) ( not ( = ?auto_2533742 ?auto_2533744 ) ) ( not ( = ?auto_2533742 ?auto_2533745 ) ) ( not ( = ?auto_2533742 ?auto_2533751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2533743 ?auto_2533744 ?auto_2533745 )
      ( MAKE-8CRATE-VERIFY ?auto_2533737 ?auto_2533738 ?auto_2533739 ?auto_2533740 ?auto_2533741 ?auto_2533742 ?auto_2533743 ?auto_2533744 ?auto_2533745 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533830 - SURFACE
      ?auto_2533831 - SURFACE
      ?auto_2533832 - SURFACE
      ?auto_2533833 - SURFACE
      ?auto_2533834 - SURFACE
      ?auto_2533835 - SURFACE
      ?auto_2533836 - SURFACE
      ?auto_2533837 - SURFACE
      ?auto_2533838 - SURFACE
    )
    :vars
    (
      ?auto_2533844 - HOIST
      ?auto_2533840 - PLACE
      ?auto_2533843 - PLACE
      ?auto_2533839 - HOIST
      ?auto_2533842 - SURFACE
      ?auto_2533841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533844 ?auto_2533840 ) ( IS-CRATE ?auto_2533838 ) ( not ( = ?auto_2533837 ?auto_2533838 ) ) ( not ( = ?auto_2533836 ?auto_2533837 ) ) ( not ( = ?auto_2533836 ?auto_2533838 ) ) ( not ( = ?auto_2533843 ?auto_2533840 ) ) ( HOIST-AT ?auto_2533839 ?auto_2533843 ) ( not ( = ?auto_2533844 ?auto_2533839 ) ) ( AVAILABLE ?auto_2533839 ) ( SURFACE-AT ?auto_2533838 ?auto_2533843 ) ( ON ?auto_2533838 ?auto_2533842 ) ( CLEAR ?auto_2533838 ) ( not ( = ?auto_2533837 ?auto_2533842 ) ) ( not ( = ?auto_2533838 ?auto_2533842 ) ) ( not ( = ?auto_2533836 ?auto_2533842 ) ) ( TRUCK-AT ?auto_2533841 ?auto_2533840 ) ( SURFACE-AT ?auto_2533836 ?auto_2533840 ) ( CLEAR ?auto_2533836 ) ( LIFTING ?auto_2533844 ?auto_2533837 ) ( IS-CRATE ?auto_2533837 ) ( ON ?auto_2533831 ?auto_2533830 ) ( ON ?auto_2533832 ?auto_2533831 ) ( ON ?auto_2533833 ?auto_2533832 ) ( ON ?auto_2533834 ?auto_2533833 ) ( ON ?auto_2533835 ?auto_2533834 ) ( ON ?auto_2533836 ?auto_2533835 ) ( not ( = ?auto_2533830 ?auto_2533831 ) ) ( not ( = ?auto_2533830 ?auto_2533832 ) ) ( not ( = ?auto_2533830 ?auto_2533833 ) ) ( not ( = ?auto_2533830 ?auto_2533834 ) ) ( not ( = ?auto_2533830 ?auto_2533835 ) ) ( not ( = ?auto_2533830 ?auto_2533836 ) ) ( not ( = ?auto_2533830 ?auto_2533837 ) ) ( not ( = ?auto_2533830 ?auto_2533838 ) ) ( not ( = ?auto_2533830 ?auto_2533842 ) ) ( not ( = ?auto_2533831 ?auto_2533832 ) ) ( not ( = ?auto_2533831 ?auto_2533833 ) ) ( not ( = ?auto_2533831 ?auto_2533834 ) ) ( not ( = ?auto_2533831 ?auto_2533835 ) ) ( not ( = ?auto_2533831 ?auto_2533836 ) ) ( not ( = ?auto_2533831 ?auto_2533837 ) ) ( not ( = ?auto_2533831 ?auto_2533838 ) ) ( not ( = ?auto_2533831 ?auto_2533842 ) ) ( not ( = ?auto_2533832 ?auto_2533833 ) ) ( not ( = ?auto_2533832 ?auto_2533834 ) ) ( not ( = ?auto_2533832 ?auto_2533835 ) ) ( not ( = ?auto_2533832 ?auto_2533836 ) ) ( not ( = ?auto_2533832 ?auto_2533837 ) ) ( not ( = ?auto_2533832 ?auto_2533838 ) ) ( not ( = ?auto_2533832 ?auto_2533842 ) ) ( not ( = ?auto_2533833 ?auto_2533834 ) ) ( not ( = ?auto_2533833 ?auto_2533835 ) ) ( not ( = ?auto_2533833 ?auto_2533836 ) ) ( not ( = ?auto_2533833 ?auto_2533837 ) ) ( not ( = ?auto_2533833 ?auto_2533838 ) ) ( not ( = ?auto_2533833 ?auto_2533842 ) ) ( not ( = ?auto_2533834 ?auto_2533835 ) ) ( not ( = ?auto_2533834 ?auto_2533836 ) ) ( not ( = ?auto_2533834 ?auto_2533837 ) ) ( not ( = ?auto_2533834 ?auto_2533838 ) ) ( not ( = ?auto_2533834 ?auto_2533842 ) ) ( not ( = ?auto_2533835 ?auto_2533836 ) ) ( not ( = ?auto_2533835 ?auto_2533837 ) ) ( not ( = ?auto_2533835 ?auto_2533838 ) ) ( not ( = ?auto_2533835 ?auto_2533842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2533836 ?auto_2533837 ?auto_2533838 )
      ( MAKE-8CRATE-VERIFY ?auto_2533830 ?auto_2533831 ?auto_2533832 ?auto_2533833 ?auto_2533834 ?auto_2533835 ?auto_2533836 ?auto_2533837 ?auto_2533838 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2533923 - SURFACE
      ?auto_2533924 - SURFACE
      ?auto_2533925 - SURFACE
      ?auto_2533926 - SURFACE
      ?auto_2533927 - SURFACE
      ?auto_2533928 - SURFACE
      ?auto_2533929 - SURFACE
      ?auto_2533930 - SURFACE
      ?auto_2533931 - SURFACE
    )
    :vars
    (
      ?auto_2533935 - HOIST
      ?auto_2533937 - PLACE
      ?auto_2533932 - PLACE
      ?auto_2533934 - HOIST
      ?auto_2533936 - SURFACE
      ?auto_2533933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533935 ?auto_2533937 ) ( IS-CRATE ?auto_2533931 ) ( not ( = ?auto_2533930 ?auto_2533931 ) ) ( not ( = ?auto_2533929 ?auto_2533930 ) ) ( not ( = ?auto_2533929 ?auto_2533931 ) ) ( not ( = ?auto_2533932 ?auto_2533937 ) ) ( HOIST-AT ?auto_2533934 ?auto_2533932 ) ( not ( = ?auto_2533935 ?auto_2533934 ) ) ( AVAILABLE ?auto_2533934 ) ( SURFACE-AT ?auto_2533931 ?auto_2533932 ) ( ON ?auto_2533931 ?auto_2533936 ) ( CLEAR ?auto_2533931 ) ( not ( = ?auto_2533930 ?auto_2533936 ) ) ( not ( = ?auto_2533931 ?auto_2533936 ) ) ( not ( = ?auto_2533929 ?auto_2533936 ) ) ( TRUCK-AT ?auto_2533933 ?auto_2533937 ) ( SURFACE-AT ?auto_2533929 ?auto_2533937 ) ( CLEAR ?auto_2533929 ) ( IS-CRATE ?auto_2533930 ) ( AVAILABLE ?auto_2533935 ) ( IN ?auto_2533930 ?auto_2533933 ) ( ON ?auto_2533924 ?auto_2533923 ) ( ON ?auto_2533925 ?auto_2533924 ) ( ON ?auto_2533926 ?auto_2533925 ) ( ON ?auto_2533927 ?auto_2533926 ) ( ON ?auto_2533928 ?auto_2533927 ) ( ON ?auto_2533929 ?auto_2533928 ) ( not ( = ?auto_2533923 ?auto_2533924 ) ) ( not ( = ?auto_2533923 ?auto_2533925 ) ) ( not ( = ?auto_2533923 ?auto_2533926 ) ) ( not ( = ?auto_2533923 ?auto_2533927 ) ) ( not ( = ?auto_2533923 ?auto_2533928 ) ) ( not ( = ?auto_2533923 ?auto_2533929 ) ) ( not ( = ?auto_2533923 ?auto_2533930 ) ) ( not ( = ?auto_2533923 ?auto_2533931 ) ) ( not ( = ?auto_2533923 ?auto_2533936 ) ) ( not ( = ?auto_2533924 ?auto_2533925 ) ) ( not ( = ?auto_2533924 ?auto_2533926 ) ) ( not ( = ?auto_2533924 ?auto_2533927 ) ) ( not ( = ?auto_2533924 ?auto_2533928 ) ) ( not ( = ?auto_2533924 ?auto_2533929 ) ) ( not ( = ?auto_2533924 ?auto_2533930 ) ) ( not ( = ?auto_2533924 ?auto_2533931 ) ) ( not ( = ?auto_2533924 ?auto_2533936 ) ) ( not ( = ?auto_2533925 ?auto_2533926 ) ) ( not ( = ?auto_2533925 ?auto_2533927 ) ) ( not ( = ?auto_2533925 ?auto_2533928 ) ) ( not ( = ?auto_2533925 ?auto_2533929 ) ) ( not ( = ?auto_2533925 ?auto_2533930 ) ) ( not ( = ?auto_2533925 ?auto_2533931 ) ) ( not ( = ?auto_2533925 ?auto_2533936 ) ) ( not ( = ?auto_2533926 ?auto_2533927 ) ) ( not ( = ?auto_2533926 ?auto_2533928 ) ) ( not ( = ?auto_2533926 ?auto_2533929 ) ) ( not ( = ?auto_2533926 ?auto_2533930 ) ) ( not ( = ?auto_2533926 ?auto_2533931 ) ) ( not ( = ?auto_2533926 ?auto_2533936 ) ) ( not ( = ?auto_2533927 ?auto_2533928 ) ) ( not ( = ?auto_2533927 ?auto_2533929 ) ) ( not ( = ?auto_2533927 ?auto_2533930 ) ) ( not ( = ?auto_2533927 ?auto_2533931 ) ) ( not ( = ?auto_2533927 ?auto_2533936 ) ) ( not ( = ?auto_2533928 ?auto_2533929 ) ) ( not ( = ?auto_2533928 ?auto_2533930 ) ) ( not ( = ?auto_2533928 ?auto_2533931 ) ) ( not ( = ?auto_2533928 ?auto_2533936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2533929 ?auto_2533930 ?auto_2533931 )
      ( MAKE-8CRATE-VERIFY ?auto_2533923 ?auto_2533924 ?auto_2533925 ?auto_2533926 ?auto_2533927 ?auto_2533928 ?auto_2533929 ?auto_2533930 ?auto_2533931 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538039 - SURFACE
      ?auto_2538040 - SURFACE
      ?auto_2538041 - SURFACE
      ?auto_2538042 - SURFACE
      ?auto_2538043 - SURFACE
      ?auto_2538044 - SURFACE
      ?auto_2538045 - SURFACE
      ?auto_2538046 - SURFACE
      ?auto_2538047 - SURFACE
      ?auto_2538048 - SURFACE
    )
    :vars
    (
      ?auto_2538049 - HOIST
      ?auto_2538050 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538049 ?auto_2538050 ) ( SURFACE-AT ?auto_2538047 ?auto_2538050 ) ( CLEAR ?auto_2538047 ) ( LIFTING ?auto_2538049 ?auto_2538048 ) ( IS-CRATE ?auto_2538048 ) ( not ( = ?auto_2538047 ?auto_2538048 ) ) ( ON ?auto_2538040 ?auto_2538039 ) ( ON ?auto_2538041 ?auto_2538040 ) ( ON ?auto_2538042 ?auto_2538041 ) ( ON ?auto_2538043 ?auto_2538042 ) ( ON ?auto_2538044 ?auto_2538043 ) ( ON ?auto_2538045 ?auto_2538044 ) ( ON ?auto_2538046 ?auto_2538045 ) ( ON ?auto_2538047 ?auto_2538046 ) ( not ( = ?auto_2538039 ?auto_2538040 ) ) ( not ( = ?auto_2538039 ?auto_2538041 ) ) ( not ( = ?auto_2538039 ?auto_2538042 ) ) ( not ( = ?auto_2538039 ?auto_2538043 ) ) ( not ( = ?auto_2538039 ?auto_2538044 ) ) ( not ( = ?auto_2538039 ?auto_2538045 ) ) ( not ( = ?auto_2538039 ?auto_2538046 ) ) ( not ( = ?auto_2538039 ?auto_2538047 ) ) ( not ( = ?auto_2538039 ?auto_2538048 ) ) ( not ( = ?auto_2538040 ?auto_2538041 ) ) ( not ( = ?auto_2538040 ?auto_2538042 ) ) ( not ( = ?auto_2538040 ?auto_2538043 ) ) ( not ( = ?auto_2538040 ?auto_2538044 ) ) ( not ( = ?auto_2538040 ?auto_2538045 ) ) ( not ( = ?auto_2538040 ?auto_2538046 ) ) ( not ( = ?auto_2538040 ?auto_2538047 ) ) ( not ( = ?auto_2538040 ?auto_2538048 ) ) ( not ( = ?auto_2538041 ?auto_2538042 ) ) ( not ( = ?auto_2538041 ?auto_2538043 ) ) ( not ( = ?auto_2538041 ?auto_2538044 ) ) ( not ( = ?auto_2538041 ?auto_2538045 ) ) ( not ( = ?auto_2538041 ?auto_2538046 ) ) ( not ( = ?auto_2538041 ?auto_2538047 ) ) ( not ( = ?auto_2538041 ?auto_2538048 ) ) ( not ( = ?auto_2538042 ?auto_2538043 ) ) ( not ( = ?auto_2538042 ?auto_2538044 ) ) ( not ( = ?auto_2538042 ?auto_2538045 ) ) ( not ( = ?auto_2538042 ?auto_2538046 ) ) ( not ( = ?auto_2538042 ?auto_2538047 ) ) ( not ( = ?auto_2538042 ?auto_2538048 ) ) ( not ( = ?auto_2538043 ?auto_2538044 ) ) ( not ( = ?auto_2538043 ?auto_2538045 ) ) ( not ( = ?auto_2538043 ?auto_2538046 ) ) ( not ( = ?auto_2538043 ?auto_2538047 ) ) ( not ( = ?auto_2538043 ?auto_2538048 ) ) ( not ( = ?auto_2538044 ?auto_2538045 ) ) ( not ( = ?auto_2538044 ?auto_2538046 ) ) ( not ( = ?auto_2538044 ?auto_2538047 ) ) ( not ( = ?auto_2538044 ?auto_2538048 ) ) ( not ( = ?auto_2538045 ?auto_2538046 ) ) ( not ( = ?auto_2538045 ?auto_2538047 ) ) ( not ( = ?auto_2538045 ?auto_2538048 ) ) ( not ( = ?auto_2538046 ?auto_2538047 ) ) ( not ( = ?auto_2538046 ?auto_2538048 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2538047 ?auto_2538048 )
      ( MAKE-9CRATE-VERIFY ?auto_2538039 ?auto_2538040 ?auto_2538041 ?auto_2538042 ?auto_2538043 ?auto_2538044 ?auto_2538045 ?auto_2538046 ?auto_2538047 ?auto_2538048 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538119 - SURFACE
      ?auto_2538120 - SURFACE
      ?auto_2538121 - SURFACE
      ?auto_2538122 - SURFACE
      ?auto_2538123 - SURFACE
      ?auto_2538124 - SURFACE
      ?auto_2538125 - SURFACE
      ?auto_2538126 - SURFACE
      ?auto_2538127 - SURFACE
      ?auto_2538128 - SURFACE
    )
    :vars
    (
      ?auto_2538130 - HOIST
      ?auto_2538129 - PLACE
      ?auto_2538131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538130 ?auto_2538129 ) ( SURFACE-AT ?auto_2538127 ?auto_2538129 ) ( CLEAR ?auto_2538127 ) ( IS-CRATE ?auto_2538128 ) ( not ( = ?auto_2538127 ?auto_2538128 ) ) ( TRUCK-AT ?auto_2538131 ?auto_2538129 ) ( AVAILABLE ?auto_2538130 ) ( IN ?auto_2538128 ?auto_2538131 ) ( ON ?auto_2538127 ?auto_2538126 ) ( not ( = ?auto_2538126 ?auto_2538127 ) ) ( not ( = ?auto_2538126 ?auto_2538128 ) ) ( ON ?auto_2538120 ?auto_2538119 ) ( ON ?auto_2538121 ?auto_2538120 ) ( ON ?auto_2538122 ?auto_2538121 ) ( ON ?auto_2538123 ?auto_2538122 ) ( ON ?auto_2538124 ?auto_2538123 ) ( ON ?auto_2538125 ?auto_2538124 ) ( ON ?auto_2538126 ?auto_2538125 ) ( not ( = ?auto_2538119 ?auto_2538120 ) ) ( not ( = ?auto_2538119 ?auto_2538121 ) ) ( not ( = ?auto_2538119 ?auto_2538122 ) ) ( not ( = ?auto_2538119 ?auto_2538123 ) ) ( not ( = ?auto_2538119 ?auto_2538124 ) ) ( not ( = ?auto_2538119 ?auto_2538125 ) ) ( not ( = ?auto_2538119 ?auto_2538126 ) ) ( not ( = ?auto_2538119 ?auto_2538127 ) ) ( not ( = ?auto_2538119 ?auto_2538128 ) ) ( not ( = ?auto_2538120 ?auto_2538121 ) ) ( not ( = ?auto_2538120 ?auto_2538122 ) ) ( not ( = ?auto_2538120 ?auto_2538123 ) ) ( not ( = ?auto_2538120 ?auto_2538124 ) ) ( not ( = ?auto_2538120 ?auto_2538125 ) ) ( not ( = ?auto_2538120 ?auto_2538126 ) ) ( not ( = ?auto_2538120 ?auto_2538127 ) ) ( not ( = ?auto_2538120 ?auto_2538128 ) ) ( not ( = ?auto_2538121 ?auto_2538122 ) ) ( not ( = ?auto_2538121 ?auto_2538123 ) ) ( not ( = ?auto_2538121 ?auto_2538124 ) ) ( not ( = ?auto_2538121 ?auto_2538125 ) ) ( not ( = ?auto_2538121 ?auto_2538126 ) ) ( not ( = ?auto_2538121 ?auto_2538127 ) ) ( not ( = ?auto_2538121 ?auto_2538128 ) ) ( not ( = ?auto_2538122 ?auto_2538123 ) ) ( not ( = ?auto_2538122 ?auto_2538124 ) ) ( not ( = ?auto_2538122 ?auto_2538125 ) ) ( not ( = ?auto_2538122 ?auto_2538126 ) ) ( not ( = ?auto_2538122 ?auto_2538127 ) ) ( not ( = ?auto_2538122 ?auto_2538128 ) ) ( not ( = ?auto_2538123 ?auto_2538124 ) ) ( not ( = ?auto_2538123 ?auto_2538125 ) ) ( not ( = ?auto_2538123 ?auto_2538126 ) ) ( not ( = ?auto_2538123 ?auto_2538127 ) ) ( not ( = ?auto_2538123 ?auto_2538128 ) ) ( not ( = ?auto_2538124 ?auto_2538125 ) ) ( not ( = ?auto_2538124 ?auto_2538126 ) ) ( not ( = ?auto_2538124 ?auto_2538127 ) ) ( not ( = ?auto_2538124 ?auto_2538128 ) ) ( not ( = ?auto_2538125 ?auto_2538126 ) ) ( not ( = ?auto_2538125 ?auto_2538127 ) ) ( not ( = ?auto_2538125 ?auto_2538128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538126 ?auto_2538127 ?auto_2538128 )
      ( MAKE-9CRATE-VERIFY ?auto_2538119 ?auto_2538120 ?auto_2538121 ?auto_2538122 ?auto_2538123 ?auto_2538124 ?auto_2538125 ?auto_2538126 ?auto_2538127 ?auto_2538128 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538209 - SURFACE
      ?auto_2538210 - SURFACE
      ?auto_2538211 - SURFACE
      ?auto_2538212 - SURFACE
      ?auto_2538213 - SURFACE
      ?auto_2538214 - SURFACE
      ?auto_2538215 - SURFACE
      ?auto_2538216 - SURFACE
      ?auto_2538217 - SURFACE
      ?auto_2538218 - SURFACE
    )
    :vars
    (
      ?auto_2538219 - HOIST
      ?auto_2538221 - PLACE
      ?auto_2538220 - TRUCK
      ?auto_2538222 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538219 ?auto_2538221 ) ( SURFACE-AT ?auto_2538217 ?auto_2538221 ) ( CLEAR ?auto_2538217 ) ( IS-CRATE ?auto_2538218 ) ( not ( = ?auto_2538217 ?auto_2538218 ) ) ( AVAILABLE ?auto_2538219 ) ( IN ?auto_2538218 ?auto_2538220 ) ( ON ?auto_2538217 ?auto_2538216 ) ( not ( = ?auto_2538216 ?auto_2538217 ) ) ( not ( = ?auto_2538216 ?auto_2538218 ) ) ( TRUCK-AT ?auto_2538220 ?auto_2538222 ) ( not ( = ?auto_2538222 ?auto_2538221 ) ) ( ON ?auto_2538210 ?auto_2538209 ) ( ON ?auto_2538211 ?auto_2538210 ) ( ON ?auto_2538212 ?auto_2538211 ) ( ON ?auto_2538213 ?auto_2538212 ) ( ON ?auto_2538214 ?auto_2538213 ) ( ON ?auto_2538215 ?auto_2538214 ) ( ON ?auto_2538216 ?auto_2538215 ) ( not ( = ?auto_2538209 ?auto_2538210 ) ) ( not ( = ?auto_2538209 ?auto_2538211 ) ) ( not ( = ?auto_2538209 ?auto_2538212 ) ) ( not ( = ?auto_2538209 ?auto_2538213 ) ) ( not ( = ?auto_2538209 ?auto_2538214 ) ) ( not ( = ?auto_2538209 ?auto_2538215 ) ) ( not ( = ?auto_2538209 ?auto_2538216 ) ) ( not ( = ?auto_2538209 ?auto_2538217 ) ) ( not ( = ?auto_2538209 ?auto_2538218 ) ) ( not ( = ?auto_2538210 ?auto_2538211 ) ) ( not ( = ?auto_2538210 ?auto_2538212 ) ) ( not ( = ?auto_2538210 ?auto_2538213 ) ) ( not ( = ?auto_2538210 ?auto_2538214 ) ) ( not ( = ?auto_2538210 ?auto_2538215 ) ) ( not ( = ?auto_2538210 ?auto_2538216 ) ) ( not ( = ?auto_2538210 ?auto_2538217 ) ) ( not ( = ?auto_2538210 ?auto_2538218 ) ) ( not ( = ?auto_2538211 ?auto_2538212 ) ) ( not ( = ?auto_2538211 ?auto_2538213 ) ) ( not ( = ?auto_2538211 ?auto_2538214 ) ) ( not ( = ?auto_2538211 ?auto_2538215 ) ) ( not ( = ?auto_2538211 ?auto_2538216 ) ) ( not ( = ?auto_2538211 ?auto_2538217 ) ) ( not ( = ?auto_2538211 ?auto_2538218 ) ) ( not ( = ?auto_2538212 ?auto_2538213 ) ) ( not ( = ?auto_2538212 ?auto_2538214 ) ) ( not ( = ?auto_2538212 ?auto_2538215 ) ) ( not ( = ?auto_2538212 ?auto_2538216 ) ) ( not ( = ?auto_2538212 ?auto_2538217 ) ) ( not ( = ?auto_2538212 ?auto_2538218 ) ) ( not ( = ?auto_2538213 ?auto_2538214 ) ) ( not ( = ?auto_2538213 ?auto_2538215 ) ) ( not ( = ?auto_2538213 ?auto_2538216 ) ) ( not ( = ?auto_2538213 ?auto_2538217 ) ) ( not ( = ?auto_2538213 ?auto_2538218 ) ) ( not ( = ?auto_2538214 ?auto_2538215 ) ) ( not ( = ?auto_2538214 ?auto_2538216 ) ) ( not ( = ?auto_2538214 ?auto_2538217 ) ) ( not ( = ?auto_2538214 ?auto_2538218 ) ) ( not ( = ?auto_2538215 ?auto_2538216 ) ) ( not ( = ?auto_2538215 ?auto_2538217 ) ) ( not ( = ?auto_2538215 ?auto_2538218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538216 ?auto_2538217 ?auto_2538218 )
      ( MAKE-9CRATE-VERIFY ?auto_2538209 ?auto_2538210 ?auto_2538211 ?auto_2538212 ?auto_2538213 ?auto_2538214 ?auto_2538215 ?auto_2538216 ?auto_2538217 ?auto_2538218 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538308 - SURFACE
      ?auto_2538309 - SURFACE
      ?auto_2538310 - SURFACE
      ?auto_2538311 - SURFACE
      ?auto_2538312 - SURFACE
      ?auto_2538313 - SURFACE
      ?auto_2538314 - SURFACE
      ?auto_2538315 - SURFACE
      ?auto_2538316 - SURFACE
      ?auto_2538317 - SURFACE
    )
    :vars
    (
      ?auto_2538320 - HOIST
      ?auto_2538321 - PLACE
      ?auto_2538318 - TRUCK
      ?auto_2538322 - PLACE
      ?auto_2538319 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538320 ?auto_2538321 ) ( SURFACE-AT ?auto_2538316 ?auto_2538321 ) ( CLEAR ?auto_2538316 ) ( IS-CRATE ?auto_2538317 ) ( not ( = ?auto_2538316 ?auto_2538317 ) ) ( AVAILABLE ?auto_2538320 ) ( ON ?auto_2538316 ?auto_2538315 ) ( not ( = ?auto_2538315 ?auto_2538316 ) ) ( not ( = ?auto_2538315 ?auto_2538317 ) ) ( TRUCK-AT ?auto_2538318 ?auto_2538322 ) ( not ( = ?auto_2538322 ?auto_2538321 ) ) ( HOIST-AT ?auto_2538319 ?auto_2538322 ) ( LIFTING ?auto_2538319 ?auto_2538317 ) ( not ( = ?auto_2538320 ?auto_2538319 ) ) ( ON ?auto_2538309 ?auto_2538308 ) ( ON ?auto_2538310 ?auto_2538309 ) ( ON ?auto_2538311 ?auto_2538310 ) ( ON ?auto_2538312 ?auto_2538311 ) ( ON ?auto_2538313 ?auto_2538312 ) ( ON ?auto_2538314 ?auto_2538313 ) ( ON ?auto_2538315 ?auto_2538314 ) ( not ( = ?auto_2538308 ?auto_2538309 ) ) ( not ( = ?auto_2538308 ?auto_2538310 ) ) ( not ( = ?auto_2538308 ?auto_2538311 ) ) ( not ( = ?auto_2538308 ?auto_2538312 ) ) ( not ( = ?auto_2538308 ?auto_2538313 ) ) ( not ( = ?auto_2538308 ?auto_2538314 ) ) ( not ( = ?auto_2538308 ?auto_2538315 ) ) ( not ( = ?auto_2538308 ?auto_2538316 ) ) ( not ( = ?auto_2538308 ?auto_2538317 ) ) ( not ( = ?auto_2538309 ?auto_2538310 ) ) ( not ( = ?auto_2538309 ?auto_2538311 ) ) ( not ( = ?auto_2538309 ?auto_2538312 ) ) ( not ( = ?auto_2538309 ?auto_2538313 ) ) ( not ( = ?auto_2538309 ?auto_2538314 ) ) ( not ( = ?auto_2538309 ?auto_2538315 ) ) ( not ( = ?auto_2538309 ?auto_2538316 ) ) ( not ( = ?auto_2538309 ?auto_2538317 ) ) ( not ( = ?auto_2538310 ?auto_2538311 ) ) ( not ( = ?auto_2538310 ?auto_2538312 ) ) ( not ( = ?auto_2538310 ?auto_2538313 ) ) ( not ( = ?auto_2538310 ?auto_2538314 ) ) ( not ( = ?auto_2538310 ?auto_2538315 ) ) ( not ( = ?auto_2538310 ?auto_2538316 ) ) ( not ( = ?auto_2538310 ?auto_2538317 ) ) ( not ( = ?auto_2538311 ?auto_2538312 ) ) ( not ( = ?auto_2538311 ?auto_2538313 ) ) ( not ( = ?auto_2538311 ?auto_2538314 ) ) ( not ( = ?auto_2538311 ?auto_2538315 ) ) ( not ( = ?auto_2538311 ?auto_2538316 ) ) ( not ( = ?auto_2538311 ?auto_2538317 ) ) ( not ( = ?auto_2538312 ?auto_2538313 ) ) ( not ( = ?auto_2538312 ?auto_2538314 ) ) ( not ( = ?auto_2538312 ?auto_2538315 ) ) ( not ( = ?auto_2538312 ?auto_2538316 ) ) ( not ( = ?auto_2538312 ?auto_2538317 ) ) ( not ( = ?auto_2538313 ?auto_2538314 ) ) ( not ( = ?auto_2538313 ?auto_2538315 ) ) ( not ( = ?auto_2538313 ?auto_2538316 ) ) ( not ( = ?auto_2538313 ?auto_2538317 ) ) ( not ( = ?auto_2538314 ?auto_2538315 ) ) ( not ( = ?auto_2538314 ?auto_2538316 ) ) ( not ( = ?auto_2538314 ?auto_2538317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538315 ?auto_2538316 ?auto_2538317 )
      ( MAKE-9CRATE-VERIFY ?auto_2538308 ?auto_2538309 ?auto_2538310 ?auto_2538311 ?auto_2538312 ?auto_2538313 ?auto_2538314 ?auto_2538315 ?auto_2538316 ?auto_2538317 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538416 - SURFACE
      ?auto_2538417 - SURFACE
      ?auto_2538418 - SURFACE
      ?auto_2538419 - SURFACE
      ?auto_2538420 - SURFACE
      ?auto_2538421 - SURFACE
      ?auto_2538422 - SURFACE
      ?auto_2538423 - SURFACE
      ?auto_2538424 - SURFACE
      ?auto_2538425 - SURFACE
    )
    :vars
    (
      ?auto_2538429 - HOIST
      ?auto_2538430 - PLACE
      ?auto_2538427 - TRUCK
      ?auto_2538428 - PLACE
      ?auto_2538431 - HOIST
      ?auto_2538426 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538429 ?auto_2538430 ) ( SURFACE-AT ?auto_2538424 ?auto_2538430 ) ( CLEAR ?auto_2538424 ) ( IS-CRATE ?auto_2538425 ) ( not ( = ?auto_2538424 ?auto_2538425 ) ) ( AVAILABLE ?auto_2538429 ) ( ON ?auto_2538424 ?auto_2538423 ) ( not ( = ?auto_2538423 ?auto_2538424 ) ) ( not ( = ?auto_2538423 ?auto_2538425 ) ) ( TRUCK-AT ?auto_2538427 ?auto_2538428 ) ( not ( = ?auto_2538428 ?auto_2538430 ) ) ( HOIST-AT ?auto_2538431 ?auto_2538428 ) ( not ( = ?auto_2538429 ?auto_2538431 ) ) ( AVAILABLE ?auto_2538431 ) ( SURFACE-AT ?auto_2538425 ?auto_2538428 ) ( ON ?auto_2538425 ?auto_2538426 ) ( CLEAR ?auto_2538425 ) ( not ( = ?auto_2538424 ?auto_2538426 ) ) ( not ( = ?auto_2538425 ?auto_2538426 ) ) ( not ( = ?auto_2538423 ?auto_2538426 ) ) ( ON ?auto_2538417 ?auto_2538416 ) ( ON ?auto_2538418 ?auto_2538417 ) ( ON ?auto_2538419 ?auto_2538418 ) ( ON ?auto_2538420 ?auto_2538419 ) ( ON ?auto_2538421 ?auto_2538420 ) ( ON ?auto_2538422 ?auto_2538421 ) ( ON ?auto_2538423 ?auto_2538422 ) ( not ( = ?auto_2538416 ?auto_2538417 ) ) ( not ( = ?auto_2538416 ?auto_2538418 ) ) ( not ( = ?auto_2538416 ?auto_2538419 ) ) ( not ( = ?auto_2538416 ?auto_2538420 ) ) ( not ( = ?auto_2538416 ?auto_2538421 ) ) ( not ( = ?auto_2538416 ?auto_2538422 ) ) ( not ( = ?auto_2538416 ?auto_2538423 ) ) ( not ( = ?auto_2538416 ?auto_2538424 ) ) ( not ( = ?auto_2538416 ?auto_2538425 ) ) ( not ( = ?auto_2538416 ?auto_2538426 ) ) ( not ( = ?auto_2538417 ?auto_2538418 ) ) ( not ( = ?auto_2538417 ?auto_2538419 ) ) ( not ( = ?auto_2538417 ?auto_2538420 ) ) ( not ( = ?auto_2538417 ?auto_2538421 ) ) ( not ( = ?auto_2538417 ?auto_2538422 ) ) ( not ( = ?auto_2538417 ?auto_2538423 ) ) ( not ( = ?auto_2538417 ?auto_2538424 ) ) ( not ( = ?auto_2538417 ?auto_2538425 ) ) ( not ( = ?auto_2538417 ?auto_2538426 ) ) ( not ( = ?auto_2538418 ?auto_2538419 ) ) ( not ( = ?auto_2538418 ?auto_2538420 ) ) ( not ( = ?auto_2538418 ?auto_2538421 ) ) ( not ( = ?auto_2538418 ?auto_2538422 ) ) ( not ( = ?auto_2538418 ?auto_2538423 ) ) ( not ( = ?auto_2538418 ?auto_2538424 ) ) ( not ( = ?auto_2538418 ?auto_2538425 ) ) ( not ( = ?auto_2538418 ?auto_2538426 ) ) ( not ( = ?auto_2538419 ?auto_2538420 ) ) ( not ( = ?auto_2538419 ?auto_2538421 ) ) ( not ( = ?auto_2538419 ?auto_2538422 ) ) ( not ( = ?auto_2538419 ?auto_2538423 ) ) ( not ( = ?auto_2538419 ?auto_2538424 ) ) ( not ( = ?auto_2538419 ?auto_2538425 ) ) ( not ( = ?auto_2538419 ?auto_2538426 ) ) ( not ( = ?auto_2538420 ?auto_2538421 ) ) ( not ( = ?auto_2538420 ?auto_2538422 ) ) ( not ( = ?auto_2538420 ?auto_2538423 ) ) ( not ( = ?auto_2538420 ?auto_2538424 ) ) ( not ( = ?auto_2538420 ?auto_2538425 ) ) ( not ( = ?auto_2538420 ?auto_2538426 ) ) ( not ( = ?auto_2538421 ?auto_2538422 ) ) ( not ( = ?auto_2538421 ?auto_2538423 ) ) ( not ( = ?auto_2538421 ?auto_2538424 ) ) ( not ( = ?auto_2538421 ?auto_2538425 ) ) ( not ( = ?auto_2538421 ?auto_2538426 ) ) ( not ( = ?auto_2538422 ?auto_2538423 ) ) ( not ( = ?auto_2538422 ?auto_2538424 ) ) ( not ( = ?auto_2538422 ?auto_2538425 ) ) ( not ( = ?auto_2538422 ?auto_2538426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538423 ?auto_2538424 ?auto_2538425 )
      ( MAKE-9CRATE-VERIFY ?auto_2538416 ?auto_2538417 ?auto_2538418 ?auto_2538419 ?auto_2538420 ?auto_2538421 ?auto_2538422 ?auto_2538423 ?auto_2538424 ?auto_2538425 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538525 - SURFACE
      ?auto_2538526 - SURFACE
      ?auto_2538527 - SURFACE
      ?auto_2538528 - SURFACE
      ?auto_2538529 - SURFACE
      ?auto_2538530 - SURFACE
      ?auto_2538531 - SURFACE
      ?auto_2538532 - SURFACE
      ?auto_2538533 - SURFACE
      ?auto_2538534 - SURFACE
    )
    :vars
    (
      ?auto_2538536 - HOIST
      ?auto_2538537 - PLACE
      ?auto_2538538 - PLACE
      ?auto_2538539 - HOIST
      ?auto_2538540 - SURFACE
      ?auto_2538535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538536 ?auto_2538537 ) ( SURFACE-AT ?auto_2538533 ?auto_2538537 ) ( CLEAR ?auto_2538533 ) ( IS-CRATE ?auto_2538534 ) ( not ( = ?auto_2538533 ?auto_2538534 ) ) ( AVAILABLE ?auto_2538536 ) ( ON ?auto_2538533 ?auto_2538532 ) ( not ( = ?auto_2538532 ?auto_2538533 ) ) ( not ( = ?auto_2538532 ?auto_2538534 ) ) ( not ( = ?auto_2538538 ?auto_2538537 ) ) ( HOIST-AT ?auto_2538539 ?auto_2538538 ) ( not ( = ?auto_2538536 ?auto_2538539 ) ) ( AVAILABLE ?auto_2538539 ) ( SURFACE-AT ?auto_2538534 ?auto_2538538 ) ( ON ?auto_2538534 ?auto_2538540 ) ( CLEAR ?auto_2538534 ) ( not ( = ?auto_2538533 ?auto_2538540 ) ) ( not ( = ?auto_2538534 ?auto_2538540 ) ) ( not ( = ?auto_2538532 ?auto_2538540 ) ) ( TRUCK-AT ?auto_2538535 ?auto_2538537 ) ( ON ?auto_2538526 ?auto_2538525 ) ( ON ?auto_2538527 ?auto_2538526 ) ( ON ?auto_2538528 ?auto_2538527 ) ( ON ?auto_2538529 ?auto_2538528 ) ( ON ?auto_2538530 ?auto_2538529 ) ( ON ?auto_2538531 ?auto_2538530 ) ( ON ?auto_2538532 ?auto_2538531 ) ( not ( = ?auto_2538525 ?auto_2538526 ) ) ( not ( = ?auto_2538525 ?auto_2538527 ) ) ( not ( = ?auto_2538525 ?auto_2538528 ) ) ( not ( = ?auto_2538525 ?auto_2538529 ) ) ( not ( = ?auto_2538525 ?auto_2538530 ) ) ( not ( = ?auto_2538525 ?auto_2538531 ) ) ( not ( = ?auto_2538525 ?auto_2538532 ) ) ( not ( = ?auto_2538525 ?auto_2538533 ) ) ( not ( = ?auto_2538525 ?auto_2538534 ) ) ( not ( = ?auto_2538525 ?auto_2538540 ) ) ( not ( = ?auto_2538526 ?auto_2538527 ) ) ( not ( = ?auto_2538526 ?auto_2538528 ) ) ( not ( = ?auto_2538526 ?auto_2538529 ) ) ( not ( = ?auto_2538526 ?auto_2538530 ) ) ( not ( = ?auto_2538526 ?auto_2538531 ) ) ( not ( = ?auto_2538526 ?auto_2538532 ) ) ( not ( = ?auto_2538526 ?auto_2538533 ) ) ( not ( = ?auto_2538526 ?auto_2538534 ) ) ( not ( = ?auto_2538526 ?auto_2538540 ) ) ( not ( = ?auto_2538527 ?auto_2538528 ) ) ( not ( = ?auto_2538527 ?auto_2538529 ) ) ( not ( = ?auto_2538527 ?auto_2538530 ) ) ( not ( = ?auto_2538527 ?auto_2538531 ) ) ( not ( = ?auto_2538527 ?auto_2538532 ) ) ( not ( = ?auto_2538527 ?auto_2538533 ) ) ( not ( = ?auto_2538527 ?auto_2538534 ) ) ( not ( = ?auto_2538527 ?auto_2538540 ) ) ( not ( = ?auto_2538528 ?auto_2538529 ) ) ( not ( = ?auto_2538528 ?auto_2538530 ) ) ( not ( = ?auto_2538528 ?auto_2538531 ) ) ( not ( = ?auto_2538528 ?auto_2538532 ) ) ( not ( = ?auto_2538528 ?auto_2538533 ) ) ( not ( = ?auto_2538528 ?auto_2538534 ) ) ( not ( = ?auto_2538528 ?auto_2538540 ) ) ( not ( = ?auto_2538529 ?auto_2538530 ) ) ( not ( = ?auto_2538529 ?auto_2538531 ) ) ( not ( = ?auto_2538529 ?auto_2538532 ) ) ( not ( = ?auto_2538529 ?auto_2538533 ) ) ( not ( = ?auto_2538529 ?auto_2538534 ) ) ( not ( = ?auto_2538529 ?auto_2538540 ) ) ( not ( = ?auto_2538530 ?auto_2538531 ) ) ( not ( = ?auto_2538530 ?auto_2538532 ) ) ( not ( = ?auto_2538530 ?auto_2538533 ) ) ( not ( = ?auto_2538530 ?auto_2538534 ) ) ( not ( = ?auto_2538530 ?auto_2538540 ) ) ( not ( = ?auto_2538531 ?auto_2538532 ) ) ( not ( = ?auto_2538531 ?auto_2538533 ) ) ( not ( = ?auto_2538531 ?auto_2538534 ) ) ( not ( = ?auto_2538531 ?auto_2538540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538532 ?auto_2538533 ?auto_2538534 )
      ( MAKE-9CRATE-VERIFY ?auto_2538525 ?auto_2538526 ?auto_2538527 ?auto_2538528 ?auto_2538529 ?auto_2538530 ?auto_2538531 ?auto_2538532 ?auto_2538533 ?auto_2538534 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538634 - SURFACE
      ?auto_2538635 - SURFACE
      ?auto_2538636 - SURFACE
      ?auto_2538637 - SURFACE
      ?auto_2538638 - SURFACE
      ?auto_2538639 - SURFACE
      ?auto_2538640 - SURFACE
      ?auto_2538641 - SURFACE
      ?auto_2538642 - SURFACE
      ?auto_2538643 - SURFACE
    )
    :vars
    (
      ?auto_2538647 - HOIST
      ?auto_2538644 - PLACE
      ?auto_2538646 - PLACE
      ?auto_2538648 - HOIST
      ?auto_2538649 - SURFACE
      ?auto_2538645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538647 ?auto_2538644 ) ( IS-CRATE ?auto_2538643 ) ( not ( = ?auto_2538642 ?auto_2538643 ) ) ( not ( = ?auto_2538641 ?auto_2538642 ) ) ( not ( = ?auto_2538641 ?auto_2538643 ) ) ( not ( = ?auto_2538646 ?auto_2538644 ) ) ( HOIST-AT ?auto_2538648 ?auto_2538646 ) ( not ( = ?auto_2538647 ?auto_2538648 ) ) ( AVAILABLE ?auto_2538648 ) ( SURFACE-AT ?auto_2538643 ?auto_2538646 ) ( ON ?auto_2538643 ?auto_2538649 ) ( CLEAR ?auto_2538643 ) ( not ( = ?auto_2538642 ?auto_2538649 ) ) ( not ( = ?auto_2538643 ?auto_2538649 ) ) ( not ( = ?auto_2538641 ?auto_2538649 ) ) ( TRUCK-AT ?auto_2538645 ?auto_2538644 ) ( SURFACE-AT ?auto_2538641 ?auto_2538644 ) ( CLEAR ?auto_2538641 ) ( LIFTING ?auto_2538647 ?auto_2538642 ) ( IS-CRATE ?auto_2538642 ) ( ON ?auto_2538635 ?auto_2538634 ) ( ON ?auto_2538636 ?auto_2538635 ) ( ON ?auto_2538637 ?auto_2538636 ) ( ON ?auto_2538638 ?auto_2538637 ) ( ON ?auto_2538639 ?auto_2538638 ) ( ON ?auto_2538640 ?auto_2538639 ) ( ON ?auto_2538641 ?auto_2538640 ) ( not ( = ?auto_2538634 ?auto_2538635 ) ) ( not ( = ?auto_2538634 ?auto_2538636 ) ) ( not ( = ?auto_2538634 ?auto_2538637 ) ) ( not ( = ?auto_2538634 ?auto_2538638 ) ) ( not ( = ?auto_2538634 ?auto_2538639 ) ) ( not ( = ?auto_2538634 ?auto_2538640 ) ) ( not ( = ?auto_2538634 ?auto_2538641 ) ) ( not ( = ?auto_2538634 ?auto_2538642 ) ) ( not ( = ?auto_2538634 ?auto_2538643 ) ) ( not ( = ?auto_2538634 ?auto_2538649 ) ) ( not ( = ?auto_2538635 ?auto_2538636 ) ) ( not ( = ?auto_2538635 ?auto_2538637 ) ) ( not ( = ?auto_2538635 ?auto_2538638 ) ) ( not ( = ?auto_2538635 ?auto_2538639 ) ) ( not ( = ?auto_2538635 ?auto_2538640 ) ) ( not ( = ?auto_2538635 ?auto_2538641 ) ) ( not ( = ?auto_2538635 ?auto_2538642 ) ) ( not ( = ?auto_2538635 ?auto_2538643 ) ) ( not ( = ?auto_2538635 ?auto_2538649 ) ) ( not ( = ?auto_2538636 ?auto_2538637 ) ) ( not ( = ?auto_2538636 ?auto_2538638 ) ) ( not ( = ?auto_2538636 ?auto_2538639 ) ) ( not ( = ?auto_2538636 ?auto_2538640 ) ) ( not ( = ?auto_2538636 ?auto_2538641 ) ) ( not ( = ?auto_2538636 ?auto_2538642 ) ) ( not ( = ?auto_2538636 ?auto_2538643 ) ) ( not ( = ?auto_2538636 ?auto_2538649 ) ) ( not ( = ?auto_2538637 ?auto_2538638 ) ) ( not ( = ?auto_2538637 ?auto_2538639 ) ) ( not ( = ?auto_2538637 ?auto_2538640 ) ) ( not ( = ?auto_2538637 ?auto_2538641 ) ) ( not ( = ?auto_2538637 ?auto_2538642 ) ) ( not ( = ?auto_2538637 ?auto_2538643 ) ) ( not ( = ?auto_2538637 ?auto_2538649 ) ) ( not ( = ?auto_2538638 ?auto_2538639 ) ) ( not ( = ?auto_2538638 ?auto_2538640 ) ) ( not ( = ?auto_2538638 ?auto_2538641 ) ) ( not ( = ?auto_2538638 ?auto_2538642 ) ) ( not ( = ?auto_2538638 ?auto_2538643 ) ) ( not ( = ?auto_2538638 ?auto_2538649 ) ) ( not ( = ?auto_2538639 ?auto_2538640 ) ) ( not ( = ?auto_2538639 ?auto_2538641 ) ) ( not ( = ?auto_2538639 ?auto_2538642 ) ) ( not ( = ?auto_2538639 ?auto_2538643 ) ) ( not ( = ?auto_2538639 ?auto_2538649 ) ) ( not ( = ?auto_2538640 ?auto_2538641 ) ) ( not ( = ?auto_2538640 ?auto_2538642 ) ) ( not ( = ?auto_2538640 ?auto_2538643 ) ) ( not ( = ?auto_2538640 ?auto_2538649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538641 ?auto_2538642 ?auto_2538643 )
      ( MAKE-9CRATE-VERIFY ?auto_2538634 ?auto_2538635 ?auto_2538636 ?auto_2538637 ?auto_2538638 ?auto_2538639 ?auto_2538640 ?auto_2538641 ?auto_2538642 ?auto_2538643 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2538743 - SURFACE
      ?auto_2538744 - SURFACE
      ?auto_2538745 - SURFACE
      ?auto_2538746 - SURFACE
      ?auto_2538747 - SURFACE
      ?auto_2538748 - SURFACE
      ?auto_2538749 - SURFACE
      ?auto_2538750 - SURFACE
      ?auto_2538751 - SURFACE
      ?auto_2538752 - SURFACE
    )
    :vars
    (
      ?auto_2538757 - HOIST
      ?auto_2538754 - PLACE
      ?auto_2538755 - PLACE
      ?auto_2538756 - HOIST
      ?auto_2538758 - SURFACE
      ?auto_2538753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2538757 ?auto_2538754 ) ( IS-CRATE ?auto_2538752 ) ( not ( = ?auto_2538751 ?auto_2538752 ) ) ( not ( = ?auto_2538750 ?auto_2538751 ) ) ( not ( = ?auto_2538750 ?auto_2538752 ) ) ( not ( = ?auto_2538755 ?auto_2538754 ) ) ( HOIST-AT ?auto_2538756 ?auto_2538755 ) ( not ( = ?auto_2538757 ?auto_2538756 ) ) ( AVAILABLE ?auto_2538756 ) ( SURFACE-AT ?auto_2538752 ?auto_2538755 ) ( ON ?auto_2538752 ?auto_2538758 ) ( CLEAR ?auto_2538752 ) ( not ( = ?auto_2538751 ?auto_2538758 ) ) ( not ( = ?auto_2538752 ?auto_2538758 ) ) ( not ( = ?auto_2538750 ?auto_2538758 ) ) ( TRUCK-AT ?auto_2538753 ?auto_2538754 ) ( SURFACE-AT ?auto_2538750 ?auto_2538754 ) ( CLEAR ?auto_2538750 ) ( IS-CRATE ?auto_2538751 ) ( AVAILABLE ?auto_2538757 ) ( IN ?auto_2538751 ?auto_2538753 ) ( ON ?auto_2538744 ?auto_2538743 ) ( ON ?auto_2538745 ?auto_2538744 ) ( ON ?auto_2538746 ?auto_2538745 ) ( ON ?auto_2538747 ?auto_2538746 ) ( ON ?auto_2538748 ?auto_2538747 ) ( ON ?auto_2538749 ?auto_2538748 ) ( ON ?auto_2538750 ?auto_2538749 ) ( not ( = ?auto_2538743 ?auto_2538744 ) ) ( not ( = ?auto_2538743 ?auto_2538745 ) ) ( not ( = ?auto_2538743 ?auto_2538746 ) ) ( not ( = ?auto_2538743 ?auto_2538747 ) ) ( not ( = ?auto_2538743 ?auto_2538748 ) ) ( not ( = ?auto_2538743 ?auto_2538749 ) ) ( not ( = ?auto_2538743 ?auto_2538750 ) ) ( not ( = ?auto_2538743 ?auto_2538751 ) ) ( not ( = ?auto_2538743 ?auto_2538752 ) ) ( not ( = ?auto_2538743 ?auto_2538758 ) ) ( not ( = ?auto_2538744 ?auto_2538745 ) ) ( not ( = ?auto_2538744 ?auto_2538746 ) ) ( not ( = ?auto_2538744 ?auto_2538747 ) ) ( not ( = ?auto_2538744 ?auto_2538748 ) ) ( not ( = ?auto_2538744 ?auto_2538749 ) ) ( not ( = ?auto_2538744 ?auto_2538750 ) ) ( not ( = ?auto_2538744 ?auto_2538751 ) ) ( not ( = ?auto_2538744 ?auto_2538752 ) ) ( not ( = ?auto_2538744 ?auto_2538758 ) ) ( not ( = ?auto_2538745 ?auto_2538746 ) ) ( not ( = ?auto_2538745 ?auto_2538747 ) ) ( not ( = ?auto_2538745 ?auto_2538748 ) ) ( not ( = ?auto_2538745 ?auto_2538749 ) ) ( not ( = ?auto_2538745 ?auto_2538750 ) ) ( not ( = ?auto_2538745 ?auto_2538751 ) ) ( not ( = ?auto_2538745 ?auto_2538752 ) ) ( not ( = ?auto_2538745 ?auto_2538758 ) ) ( not ( = ?auto_2538746 ?auto_2538747 ) ) ( not ( = ?auto_2538746 ?auto_2538748 ) ) ( not ( = ?auto_2538746 ?auto_2538749 ) ) ( not ( = ?auto_2538746 ?auto_2538750 ) ) ( not ( = ?auto_2538746 ?auto_2538751 ) ) ( not ( = ?auto_2538746 ?auto_2538752 ) ) ( not ( = ?auto_2538746 ?auto_2538758 ) ) ( not ( = ?auto_2538747 ?auto_2538748 ) ) ( not ( = ?auto_2538747 ?auto_2538749 ) ) ( not ( = ?auto_2538747 ?auto_2538750 ) ) ( not ( = ?auto_2538747 ?auto_2538751 ) ) ( not ( = ?auto_2538747 ?auto_2538752 ) ) ( not ( = ?auto_2538747 ?auto_2538758 ) ) ( not ( = ?auto_2538748 ?auto_2538749 ) ) ( not ( = ?auto_2538748 ?auto_2538750 ) ) ( not ( = ?auto_2538748 ?auto_2538751 ) ) ( not ( = ?auto_2538748 ?auto_2538752 ) ) ( not ( = ?auto_2538748 ?auto_2538758 ) ) ( not ( = ?auto_2538749 ?auto_2538750 ) ) ( not ( = ?auto_2538749 ?auto_2538751 ) ) ( not ( = ?auto_2538749 ?auto_2538752 ) ) ( not ( = ?auto_2538749 ?auto_2538758 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2538750 ?auto_2538751 ?auto_2538752 )
      ( MAKE-9CRATE-VERIFY ?auto_2538743 ?auto_2538744 ?auto_2538745 ?auto_2538746 ?auto_2538747 ?auto_2538748 ?auto_2538749 ?auto_2538750 ?auto_2538751 ?auto_2538752 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544290 - SURFACE
      ?auto_2544291 - SURFACE
      ?auto_2544292 - SURFACE
      ?auto_2544293 - SURFACE
      ?auto_2544294 - SURFACE
      ?auto_2544295 - SURFACE
      ?auto_2544296 - SURFACE
      ?auto_2544297 - SURFACE
      ?auto_2544298 - SURFACE
      ?auto_2544299 - SURFACE
      ?auto_2544300 - SURFACE
    )
    :vars
    (
      ?auto_2544302 - HOIST
      ?auto_2544301 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544302 ?auto_2544301 ) ( SURFACE-AT ?auto_2544299 ?auto_2544301 ) ( CLEAR ?auto_2544299 ) ( LIFTING ?auto_2544302 ?auto_2544300 ) ( IS-CRATE ?auto_2544300 ) ( not ( = ?auto_2544299 ?auto_2544300 ) ) ( ON ?auto_2544291 ?auto_2544290 ) ( ON ?auto_2544292 ?auto_2544291 ) ( ON ?auto_2544293 ?auto_2544292 ) ( ON ?auto_2544294 ?auto_2544293 ) ( ON ?auto_2544295 ?auto_2544294 ) ( ON ?auto_2544296 ?auto_2544295 ) ( ON ?auto_2544297 ?auto_2544296 ) ( ON ?auto_2544298 ?auto_2544297 ) ( ON ?auto_2544299 ?auto_2544298 ) ( not ( = ?auto_2544290 ?auto_2544291 ) ) ( not ( = ?auto_2544290 ?auto_2544292 ) ) ( not ( = ?auto_2544290 ?auto_2544293 ) ) ( not ( = ?auto_2544290 ?auto_2544294 ) ) ( not ( = ?auto_2544290 ?auto_2544295 ) ) ( not ( = ?auto_2544290 ?auto_2544296 ) ) ( not ( = ?auto_2544290 ?auto_2544297 ) ) ( not ( = ?auto_2544290 ?auto_2544298 ) ) ( not ( = ?auto_2544290 ?auto_2544299 ) ) ( not ( = ?auto_2544290 ?auto_2544300 ) ) ( not ( = ?auto_2544291 ?auto_2544292 ) ) ( not ( = ?auto_2544291 ?auto_2544293 ) ) ( not ( = ?auto_2544291 ?auto_2544294 ) ) ( not ( = ?auto_2544291 ?auto_2544295 ) ) ( not ( = ?auto_2544291 ?auto_2544296 ) ) ( not ( = ?auto_2544291 ?auto_2544297 ) ) ( not ( = ?auto_2544291 ?auto_2544298 ) ) ( not ( = ?auto_2544291 ?auto_2544299 ) ) ( not ( = ?auto_2544291 ?auto_2544300 ) ) ( not ( = ?auto_2544292 ?auto_2544293 ) ) ( not ( = ?auto_2544292 ?auto_2544294 ) ) ( not ( = ?auto_2544292 ?auto_2544295 ) ) ( not ( = ?auto_2544292 ?auto_2544296 ) ) ( not ( = ?auto_2544292 ?auto_2544297 ) ) ( not ( = ?auto_2544292 ?auto_2544298 ) ) ( not ( = ?auto_2544292 ?auto_2544299 ) ) ( not ( = ?auto_2544292 ?auto_2544300 ) ) ( not ( = ?auto_2544293 ?auto_2544294 ) ) ( not ( = ?auto_2544293 ?auto_2544295 ) ) ( not ( = ?auto_2544293 ?auto_2544296 ) ) ( not ( = ?auto_2544293 ?auto_2544297 ) ) ( not ( = ?auto_2544293 ?auto_2544298 ) ) ( not ( = ?auto_2544293 ?auto_2544299 ) ) ( not ( = ?auto_2544293 ?auto_2544300 ) ) ( not ( = ?auto_2544294 ?auto_2544295 ) ) ( not ( = ?auto_2544294 ?auto_2544296 ) ) ( not ( = ?auto_2544294 ?auto_2544297 ) ) ( not ( = ?auto_2544294 ?auto_2544298 ) ) ( not ( = ?auto_2544294 ?auto_2544299 ) ) ( not ( = ?auto_2544294 ?auto_2544300 ) ) ( not ( = ?auto_2544295 ?auto_2544296 ) ) ( not ( = ?auto_2544295 ?auto_2544297 ) ) ( not ( = ?auto_2544295 ?auto_2544298 ) ) ( not ( = ?auto_2544295 ?auto_2544299 ) ) ( not ( = ?auto_2544295 ?auto_2544300 ) ) ( not ( = ?auto_2544296 ?auto_2544297 ) ) ( not ( = ?auto_2544296 ?auto_2544298 ) ) ( not ( = ?auto_2544296 ?auto_2544299 ) ) ( not ( = ?auto_2544296 ?auto_2544300 ) ) ( not ( = ?auto_2544297 ?auto_2544298 ) ) ( not ( = ?auto_2544297 ?auto_2544299 ) ) ( not ( = ?auto_2544297 ?auto_2544300 ) ) ( not ( = ?auto_2544298 ?auto_2544299 ) ) ( not ( = ?auto_2544298 ?auto_2544300 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2544299 ?auto_2544300 )
      ( MAKE-10CRATE-VERIFY ?auto_2544290 ?auto_2544291 ?auto_2544292 ?auto_2544293 ?auto_2544294 ?auto_2544295 ?auto_2544296 ?auto_2544297 ?auto_2544298 ?auto_2544299 ?auto_2544300 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544384 - SURFACE
      ?auto_2544385 - SURFACE
      ?auto_2544386 - SURFACE
      ?auto_2544387 - SURFACE
      ?auto_2544388 - SURFACE
      ?auto_2544389 - SURFACE
      ?auto_2544390 - SURFACE
      ?auto_2544391 - SURFACE
      ?auto_2544392 - SURFACE
      ?auto_2544393 - SURFACE
      ?auto_2544394 - SURFACE
    )
    :vars
    (
      ?auto_2544397 - HOIST
      ?auto_2544395 - PLACE
      ?auto_2544396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544397 ?auto_2544395 ) ( SURFACE-AT ?auto_2544393 ?auto_2544395 ) ( CLEAR ?auto_2544393 ) ( IS-CRATE ?auto_2544394 ) ( not ( = ?auto_2544393 ?auto_2544394 ) ) ( TRUCK-AT ?auto_2544396 ?auto_2544395 ) ( AVAILABLE ?auto_2544397 ) ( IN ?auto_2544394 ?auto_2544396 ) ( ON ?auto_2544393 ?auto_2544392 ) ( not ( = ?auto_2544392 ?auto_2544393 ) ) ( not ( = ?auto_2544392 ?auto_2544394 ) ) ( ON ?auto_2544385 ?auto_2544384 ) ( ON ?auto_2544386 ?auto_2544385 ) ( ON ?auto_2544387 ?auto_2544386 ) ( ON ?auto_2544388 ?auto_2544387 ) ( ON ?auto_2544389 ?auto_2544388 ) ( ON ?auto_2544390 ?auto_2544389 ) ( ON ?auto_2544391 ?auto_2544390 ) ( ON ?auto_2544392 ?auto_2544391 ) ( not ( = ?auto_2544384 ?auto_2544385 ) ) ( not ( = ?auto_2544384 ?auto_2544386 ) ) ( not ( = ?auto_2544384 ?auto_2544387 ) ) ( not ( = ?auto_2544384 ?auto_2544388 ) ) ( not ( = ?auto_2544384 ?auto_2544389 ) ) ( not ( = ?auto_2544384 ?auto_2544390 ) ) ( not ( = ?auto_2544384 ?auto_2544391 ) ) ( not ( = ?auto_2544384 ?auto_2544392 ) ) ( not ( = ?auto_2544384 ?auto_2544393 ) ) ( not ( = ?auto_2544384 ?auto_2544394 ) ) ( not ( = ?auto_2544385 ?auto_2544386 ) ) ( not ( = ?auto_2544385 ?auto_2544387 ) ) ( not ( = ?auto_2544385 ?auto_2544388 ) ) ( not ( = ?auto_2544385 ?auto_2544389 ) ) ( not ( = ?auto_2544385 ?auto_2544390 ) ) ( not ( = ?auto_2544385 ?auto_2544391 ) ) ( not ( = ?auto_2544385 ?auto_2544392 ) ) ( not ( = ?auto_2544385 ?auto_2544393 ) ) ( not ( = ?auto_2544385 ?auto_2544394 ) ) ( not ( = ?auto_2544386 ?auto_2544387 ) ) ( not ( = ?auto_2544386 ?auto_2544388 ) ) ( not ( = ?auto_2544386 ?auto_2544389 ) ) ( not ( = ?auto_2544386 ?auto_2544390 ) ) ( not ( = ?auto_2544386 ?auto_2544391 ) ) ( not ( = ?auto_2544386 ?auto_2544392 ) ) ( not ( = ?auto_2544386 ?auto_2544393 ) ) ( not ( = ?auto_2544386 ?auto_2544394 ) ) ( not ( = ?auto_2544387 ?auto_2544388 ) ) ( not ( = ?auto_2544387 ?auto_2544389 ) ) ( not ( = ?auto_2544387 ?auto_2544390 ) ) ( not ( = ?auto_2544387 ?auto_2544391 ) ) ( not ( = ?auto_2544387 ?auto_2544392 ) ) ( not ( = ?auto_2544387 ?auto_2544393 ) ) ( not ( = ?auto_2544387 ?auto_2544394 ) ) ( not ( = ?auto_2544388 ?auto_2544389 ) ) ( not ( = ?auto_2544388 ?auto_2544390 ) ) ( not ( = ?auto_2544388 ?auto_2544391 ) ) ( not ( = ?auto_2544388 ?auto_2544392 ) ) ( not ( = ?auto_2544388 ?auto_2544393 ) ) ( not ( = ?auto_2544388 ?auto_2544394 ) ) ( not ( = ?auto_2544389 ?auto_2544390 ) ) ( not ( = ?auto_2544389 ?auto_2544391 ) ) ( not ( = ?auto_2544389 ?auto_2544392 ) ) ( not ( = ?auto_2544389 ?auto_2544393 ) ) ( not ( = ?auto_2544389 ?auto_2544394 ) ) ( not ( = ?auto_2544390 ?auto_2544391 ) ) ( not ( = ?auto_2544390 ?auto_2544392 ) ) ( not ( = ?auto_2544390 ?auto_2544393 ) ) ( not ( = ?auto_2544390 ?auto_2544394 ) ) ( not ( = ?auto_2544391 ?auto_2544392 ) ) ( not ( = ?auto_2544391 ?auto_2544393 ) ) ( not ( = ?auto_2544391 ?auto_2544394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2544392 ?auto_2544393 ?auto_2544394 )
      ( MAKE-10CRATE-VERIFY ?auto_2544384 ?auto_2544385 ?auto_2544386 ?auto_2544387 ?auto_2544388 ?auto_2544389 ?auto_2544390 ?auto_2544391 ?auto_2544392 ?auto_2544393 ?auto_2544394 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544489 - SURFACE
      ?auto_2544490 - SURFACE
      ?auto_2544491 - SURFACE
      ?auto_2544492 - SURFACE
      ?auto_2544493 - SURFACE
      ?auto_2544494 - SURFACE
      ?auto_2544495 - SURFACE
      ?auto_2544496 - SURFACE
      ?auto_2544497 - SURFACE
      ?auto_2544498 - SURFACE
      ?auto_2544499 - SURFACE
    )
    :vars
    (
      ?auto_2544503 - HOIST
      ?auto_2544502 - PLACE
      ?auto_2544500 - TRUCK
      ?auto_2544501 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544503 ?auto_2544502 ) ( SURFACE-AT ?auto_2544498 ?auto_2544502 ) ( CLEAR ?auto_2544498 ) ( IS-CRATE ?auto_2544499 ) ( not ( = ?auto_2544498 ?auto_2544499 ) ) ( AVAILABLE ?auto_2544503 ) ( IN ?auto_2544499 ?auto_2544500 ) ( ON ?auto_2544498 ?auto_2544497 ) ( not ( = ?auto_2544497 ?auto_2544498 ) ) ( not ( = ?auto_2544497 ?auto_2544499 ) ) ( TRUCK-AT ?auto_2544500 ?auto_2544501 ) ( not ( = ?auto_2544501 ?auto_2544502 ) ) ( ON ?auto_2544490 ?auto_2544489 ) ( ON ?auto_2544491 ?auto_2544490 ) ( ON ?auto_2544492 ?auto_2544491 ) ( ON ?auto_2544493 ?auto_2544492 ) ( ON ?auto_2544494 ?auto_2544493 ) ( ON ?auto_2544495 ?auto_2544494 ) ( ON ?auto_2544496 ?auto_2544495 ) ( ON ?auto_2544497 ?auto_2544496 ) ( not ( = ?auto_2544489 ?auto_2544490 ) ) ( not ( = ?auto_2544489 ?auto_2544491 ) ) ( not ( = ?auto_2544489 ?auto_2544492 ) ) ( not ( = ?auto_2544489 ?auto_2544493 ) ) ( not ( = ?auto_2544489 ?auto_2544494 ) ) ( not ( = ?auto_2544489 ?auto_2544495 ) ) ( not ( = ?auto_2544489 ?auto_2544496 ) ) ( not ( = ?auto_2544489 ?auto_2544497 ) ) ( not ( = ?auto_2544489 ?auto_2544498 ) ) ( not ( = ?auto_2544489 ?auto_2544499 ) ) ( not ( = ?auto_2544490 ?auto_2544491 ) ) ( not ( = ?auto_2544490 ?auto_2544492 ) ) ( not ( = ?auto_2544490 ?auto_2544493 ) ) ( not ( = ?auto_2544490 ?auto_2544494 ) ) ( not ( = ?auto_2544490 ?auto_2544495 ) ) ( not ( = ?auto_2544490 ?auto_2544496 ) ) ( not ( = ?auto_2544490 ?auto_2544497 ) ) ( not ( = ?auto_2544490 ?auto_2544498 ) ) ( not ( = ?auto_2544490 ?auto_2544499 ) ) ( not ( = ?auto_2544491 ?auto_2544492 ) ) ( not ( = ?auto_2544491 ?auto_2544493 ) ) ( not ( = ?auto_2544491 ?auto_2544494 ) ) ( not ( = ?auto_2544491 ?auto_2544495 ) ) ( not ( = ?auto_2544491 ?auto_2544496 ) ) ( not ( = ?auto_2544491 ?auto_2544497 ) ) ( not ( = ?auto_2544491 ?auto_2544498 ) ) ( not ( = ?auto_2544491 ?auto_2544499 ) ) ( not ( = ?auto_2544492 ?auto_2544493 ) ) ( not ( = ?auto_2544492 ?auto_2544494 ) ) ( not ( = ?auto_2544492 ?auto_2544495 ) ) ( not ( = ?auto_2544492 ?auto_2544496 ) ) ( not ( = ?auto_2544492 ?auto_2544497 ) ) ( not ( = ?auto_2544492 ?auto_2544498 ) ) ( not ( = ?auto_2544492 ?auto_2544499 ) ) ( not ( = ?auto_2544493 ?auto_2544494 ) ) ( not ( = ?auto_2544493 ?auto_2544495 ) ) ( not ( = ?auto_2544493 ?auto_2544496 ) ) ( not ( = ?auto_2544493 ?auto_2544497 ) ) ( not ( = ?auto_2544493 ?auto_2544498 ) ) ( not ( = ?auto_2544493 ?auto_2544499 ) ) ( not ( = ?auto_2544494 ?auto_2544495 ) ) ( not ( = ?auto_2544494 ?auto_2544496 ) ) ( not ( = ?auto_2544494 ?auto_2544497 ) ) ( not ( = ?auto_2544494 ?auto_2544498 ) ) ( not ( = ?auto_2544494 ?auto_2544499 ) ) ( not ( = ?auto_2544495 ?auto_2544496 ) ) ( not ( = ?auto_2544495 ?auto_2544497 ) ) ( not ( = ?auto_2544495 ?auto_2544498 ) ) ( not ( = ?auto_2544495 ?auto_2544499 ) ) ( not ( = ?auto_2544496 ?auto_2544497 ) ) ( not ( = ?auto_2544496 ?auto_2544498 ) ) ( not ( = ?auto_2544496 ?auto_2544499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2544497 ?auto_2544498 ?auto_2544499 )
      ( MAKE-10CRATE-VERIFY ?auto_2544489 ?auto_2544490 ?auto_2544491 ?auto_2544492 ?auto_2544493 ?auto_2544494 ?auto_2544495 ?auto_2544496 ?auto_2544497 ?auto_2544498 ?auto_2544499 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544604 - SURFACE
      ?auto_2544605 - SURFACE
      ?auto_2544606 - SURFACE
      ?auto_2544607 - SURFACE
      ?auto_2544608 - SURFACE
      ?auto_2544609 - SURFACE
      ?auto_2544610 - SURFACE
      ?auto_2544611 - SURFACE
      ?auto_2544612 - SURFACE
      ?auto_2544613 - SURFACE
      ?auto_2544614 - SURFACE
    )
    :vars
    (
      ?auto_2544616 - HOIST
      ?auto_2544615 - PLACE
      ?auto_2544618 - TRUCK
      ?auto_2544617 - PLACE
      ?auto_2544619 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544616 ?auto_2544615 ) ( SURFACE-AT ?auto_2544613 ?auto_2544615 ) ( CLEAR ?auto_2544613 ) ( IS-CRATE ?auto_2544614 ) ( not ( = ?auto_2544613 ?auto_2544614 ) ) ( AVAILABLE ?auto_2544616 ) ( ON ?auto_2544613 ?auto_2544612 ) ( not ( = ?auto_2544612 ?auto_2544613 ) ) ( not ( = ?auto_2544612 ?auto_2544614 ) ) ( TRUCK-AT ?auto_2544618 ?auto_2544617 ) ( not ( = ?auto_2544617 ?auto_2544615 ) ) ( HOIST-AT ?auto_2544619 ?auto_2544617 ) ( LIFTING ?auto_2544619 ?auto_2544614 ) ( not ( = ?auto_2544616 ?auto_2544619 ) ) ( ON ?auto_2544605 ?auto_2544604 ) ( ON ?auto_2544606 ?auto_2544605 ) ( ON ?auto_2544607 ?auto_2544606 ) ( ON ?auto_2544608 ?auto_2544607 ) ( ON ?auto_2544609 ?auto_2544608 ) ( ON ?auto_2544610 ?auto_2544609 ) ( ON ?auto_2544611 ?auto_2544610 ) ( ON ?auto_2544612 ?auto_2544611 ) ( not ( = ?auto_2544604 ?auto_2544605 ) ) ( not ( = ?auto_2544604 ?auto_2544606 ) ) ( not ( = ?auto_2544604 ?auto_2544607 ) ) ( not ( = ?auto_2544604 ?auto_2544608 ) ) ( not ( = ?auto_2544604 ?auto_2544609 ) ) ( not ( = ?auto_2544604 ?auto_2544610 ) ) ( not ( = ?auto_2544604 ?auto_2544611 ) ) ( not ( = ?auto_2544604 ?auto_2544612 ) ) ( not ( = ?auto_2544604 ?auto_2544613 ) ) ( not ( = ?auto_2544604 ?auto_2544614 ) ) ( not ( = ?auto_2544605 ?auto_2544606 ) ) ( not ( = ?auto_2544605 ?auto_2544607 ) ) ( not ( = ?auto_2544605 ?auto_2544608 ) ) ( not ( = ?auto_2544605 ?auto_2544609 ) ) ( not ( = ?auto_2544605 ?auto_2544610 ) ) ( not ( = ?auto_2544605 ?auto_2544611 ) ) ( not ( = ?auto_2544605 ?auto_2544612 ) ) ( not ( = ?auto_2544605 ?auto_2544613 ) ) ( not ( = ?auto_2544605 ?auto_2544614 ) ) ( not ( = ?auto_2544606 ?auto_2544607 ) ) ( not ( = ?auto_2544606 ?auto_2544608 ) ) ( not ( = ?auto_2544606 ?auto_2544609 ) ) ( not ( = ?auto_2544606 ?auto_2544610 ) ) ( not ( = ?auto_2544606 ?auto_2544611 ) ) ( not ( = ?auto_2544606 ?auto_2544612 ) ) ( not ( = ?auto_2544606 ?auto_2544613 ) ) ( not ( = ?auto_2544606 ?auto_2544614 ) ) ( not ( = ?auto_2544607 ?auto_2544608 ) ) ( not ( = ?auto_2544607 ?auto_2544609 ) ) ( not ( = ?auto_2544607 ?auto_2544610 ) ) ( not ( = ?auto_2544607 ?auto_2544611 ) ) ( not ( = ?auto_2544607 ?auto_2544612 ) ) ( not ( = ?auto_2544607 ?auto_2544613 ) ) ( not ( = ?auto_2544607 ?auto_2544614 ) ) ( not ( = ?auto_2544608 ?auto_2544609 ) ) ( not ( = ?auto_2544608 ?auto_2544610 ) ) ( not ( = ?auto_2544608 ?auto_2544611 ) ) ( not ( = ?auto_2544608 ?auto_2544612 ) ) ( not ( = ?auto_2544608 ?auto_2544613 ) ) ( not ( = ?auto_2544608 ?auto_2544614 ) ) ( not ( = ?auto_2544609 ?auto_2544610 ) ) ( not ( = ?auto_2544609 ?auto_2544611 ) ) ( not ( = ?auto_2544609 ?auto_2544612 ) ) ( not ( = ?auto_2544609 ?auto_2544613 ) ) ( not ( = ?auto_2544609 ?auto_2544614 ) ) ( not ( = ?auto_2544610 ?auto_2544611 ) ) ( not ( = ?auto_2544610 ?auto_2544612 ) ) ( not ( = ?auto_2544610 ?auto_2544613 ) ) ( not ( = ?auto_2544610 ?auto_2544614 ) ) ( not ( = ?auto_2544611 ?auto_2544612 ) ) ( not ( = ?auto_2544611 ?auto_2544613 ) ) ( not ( = ?auto_2544611 ?auto_2544614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2544612 ?auto_2544613 ?auto_2544614 )
      ( MAKE-10CRATE-VERIFY ?auto_2544604 ?auto_2544605 ?auto_2544606 ?auto_2544607 ?auto_2544608 ?auto_2544609 ?auto_2544610 ?auto_2544611 ?auto_2544612 ?auto_2544613 ?auto_2544614 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544729 - SURFACE
      ?auto_2544730 - SURFACE
      ?auto_2544731 - SURFACE
      ?auto_2544732 - SURFACE
      ?auto_2544733 - SURFACE
      ?auto_2544734 - SURFACE
      ?auto_2544735 - SURFACE
      ?auto_2544736 - SURFACE
      ?auto_2544737 - SURFACE
      ?auto_2544738 - SURFACE
      ?auto_2544739 - SURFACE
    )
    :vars
    (
      ?auto_2544745 - HOIST
      ?auto_2544744 - PLACE
      ?auto_2544743 - TRUCK
      ?auto_2544740 - PLACE
      ?auto_2544742 - HOIST
      ?auto_2544741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544745 ?auto_2544744 ) ( SURFACE-AT ?auto_2544738 ?auto_2544744 ) ( CLEAR ?auto_2544738 ) ( IS-CRATE ?auto_2544739 ) ( not ( = ?auto_2544738 ?auto_2544739 ) ) ( AVAILABLE ?auto_2544745 ) ( ON ?auto_2544738 ?auto_2544737 ) ( not ( = ?auto_2544737 ?auto_2544738 ) ) ( not ( = ?auto_2544737 ?auto_2544739 ) ) ( TRUCK-AT ?auto_2544743 ?auto_2544740 ) ( not ( = ?auto_2544740 ?auto_2544744 ) ) ( HOIST-AT ?auto_2544742 ?auto_2544740 ) ( not ( = ?auto_2544745 ?auto_2544742 ) ) ( AVAILABLE ?auto_2544742 ) ( SURFACE-AT ?auto_2544739 ?auto_2544740 ) ( ON ?auto_2544739 ?auto_2544741 ) ( CLEAR ?auto_2544739 ) ( not ( = ?auto_2544738 ?auto_2544741 ) ) ( not ( = ?auto_2544739 ?auto_2544741 ) ) ( not ( = ?auto_2544737 ?auto_2544741 ) ) ( ON ?auto_2544730 ?auto_2544729 ) ( ON ?auto_2544731 ?auto_2544730 ) ( ON ?auto_2544732 ?auto_2544731 ) ( ON ?auto_2544733 ?auto_2544732 ) ( ON ?auto_2544734 ?auto_2544733 ) ( ON ?auto_2544735 ?auto_2544734 ) ( ON ?auto_2544736 ?auto_2544735 ) ( ON ?auto_2544737 ?auto_2544736 ) ( not ( = ?auto_2544729 ?auto_2544730 ) ) ( not ( = ?auto_2544729 ?auto_2544731 ) ) ( not ( = ?auto_2544729 ?auto_2544732 ) ) ( not ( = ?auto_2544729 ?auto_2544733 ) ) ( not ( = ?auto_2544729 ?auto_2544734 ) ) ( not ( = ?auto_2544729 ?auto_2544735 ) ) ( not ( = ?auto_2544729 ?auto_2544736 ) ) ( not ( = ?auto_2544729 ?auto_2544737 ) ) ( not ( = ?auto_2544729 ?auto_2544738 ) ) ( not ( = ?auto_2544729 ?auto_2544739 ) ) ( not ( = ?auto_2544729 ?auto_2544741 ) ) ( not ( = ?auto_2544730 ?auto_2544731 ) ) ( not ( = ?auto_2544730 ?auto_2544732 ) ) ( not ( = ?auto_2544730 ?auto_2544733 ) ) ( not ( = ?auto_2544730 ?auto_2544734 ) ) ( not ( = ?auto_2544730 ?auto_2544735 ) ) ( not ( = ?auto_2544730 ?auto_2544736 ) ) ( not ( = ?auto_2544730 ?auto_2544737 ) ) ( not ( = ?auto_2544730 ?auto_2544738 ) ) ( not ( = ?auto_2544730 ?auto_2544739 ) ) ( not ( = ?auto_2544730 ?auto_2544741 ) ) ( not ( = ?auto_2544731 ?auto_2544732 ) ) ( not ( = ?auto_2544731 ?auto_2544733 ) ) ( not ( = ?auto_2544731 ?auto_2544734 ) ) ( not ( = ?auto_2544731 ?auto_2544735 ) ) ( not ( = ?auto_2544731 ?auto_2544736 ) ) ( not ( = ?auto_2544731 ?auto_2544737 ) ) ( not ( = ?auto_2544731 ?auto_2544738 ) ) ( not ( = ?auto_2544731 ?auto_2544739 ) ) ( not ( = ?auto_2544731 ?auto_2544741 ) ) ( not ( = ?auto_2544732 ?auto_2544733 ) ) ( not ( = ?auto_2544732 ?auto_2544734 ) ) ( not ( = ?auto_2544732 ?auto_2544735 ) ) ( not ( = ?auto_2544732 ?auto_2544736 ) ) ( not ( = ?auto_2544732 ?auto_2544737 ) ) ( not ( = ?auto_2544732 ?auto_2544738 ) ) ( not ( = ?auto_2544732 ?auto_2544739 ) ) ( not ( = ?auto_2544732 ?auto_2544741 ) ) ( not ( = ?auto_2544733 ?auto_2544734 ) ) ( not ( = ?auto_2544733 ?auto_2544735 ) ) ( not ( = ?auto_2544733 ?auto_2544736 ) ) ( not ( = ?auto_2544733 ?auto_2544737 ) ) ( not ( = ?auto_2544733 ?auto_2544738 ) ) ( not ( = ?auto_2544733 ?auto_2544739 ) ) ( not ( = ?auto_2544733 ?auto_2544741 ) ) ( not ( = ?auto_2544734 ?auto_2544735 ) ) ( not ( = ?auto_2544734 ?auto_2544736 ) ) ( not ( = ?auto_2544734 ?auto_2544737 ) ) ( not ( = ?auto_2544734 ?auto_2544738 ) ) ( not ( = ?auto_2544734 ?auto_2544739 ) ) ( not ( = ?auto_2544734 ?auto_2544741 ) ) ( not ( = ?auto_2544735 ?auto_2544736 ) ) ( not ( = ?auto_2544735 ?auto_2544737 ) ) ( not ( = ?auto_2544735 ?auto_2544738 ) ) ( not ( = ?auto_2544735 ?auto_2544739 ) ) ( not ( = ?auto_2544735 ?auto_2544741 ) ) ( not ( = ?auto_2544736 ?auto_2544737 ) ) ( not ( = ?auto_2544736 ?auto_2544738 ) ) ( not ( = ?auto_2544736 ?auto_2544739 ) ) ( not ( = ?auto_2544736 ?auto_2544741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2544737 ?auto_2544738 ?auto_2544739 )
      ( MAKE-10CRATE-VERIFY ?auto_2544729 ?auto_2544730 ?auto_2544731 ?auto_2544732 ?auto_2544733 ?auto_2544734 ?auto_2544735 ?auto_2544736 ?auto_2544737 ?auto_2544738 ?auto_2544739 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544855 - SURFACE
      ?auto_2544856 - SURFACE
      ?auto_2544857 - SURFACE
      ?auto_2544858 - SURFACE
      ?auto_2544859 - SURFACE
      ?auto_2544860 - SURFACE
      ?auto_2544861 - SURFACE
      ?auto_2544862 - SURFACE
      ?auto_2544863 - SURFACE
      ?auto_2544864 - SURFACE
      ?auto_2544865 - SURFACE
    )
    :vars
    (
      ?auto_2544871 - HOIST
      ?auto_2544867 - PLACE
      ?auto_2544870 - PLACE
      ?auto_2544866 - HOIST
      ?auto_2544869 - SURFACE
      ?auto_2544868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544871 ?auto_2544867 ) ( SURFACE-AT ?auto_2544864 ?auto_2544867 ) ( CLEAR ?auto_2544864 ) ( IS-CRATE ?auto_2544865 ) ( not ( = ?auto_2544864 ?auto_2544865 ) ) ( AVAILABLE ?auto_2544871 ) ( ON ?auto_2544864 ?auto_2544863 ) ( not ( = ?auto_2544863 ?auto_2544864 ) ) ( not ( = ?auto_2544863 ?auto_2544865 ) ) ( not ( = ?auto_2544870 ?auto_2544867 ) ) ( HOIST-AT ?auto_2544866 ?auto_2544870 ) ( not ( = ?auto_2544871 ?auto_2544866 ) ) ( AVAILABLE ?auto_2544866 ) ( SURFACE-AT ?auto_2544865 ?auto_2544870 ) ( ON ?auto_2544865 ?auto_2544869 ) ( CLEAR ?auto_2544865 ) ( not ( = ?auto_2544864 ?auto_2544869 ) ) ( not ( = ?auto_2544865 ?auto_2544869 ) ) ( not ( = ?auto_2544863 ?auto_2544869 ) ) ( TRUCK-AT ?auto_2544868 ?auto_2544867 ) ( ON ?auto_2544856 ?auto_2544855 ) ( ON ?auto_2544857 ?auto_2544856 ) ( ON ?auto_2544858 ?auto_2544857 ) ( ON ?auto_2544859 ?auto_2544858 ) ( ON ?auto_2544860 ?auto_2544859 ) ( ON ?auto_2544861 ?auto_2544860 ) ( ON ?auto_2544862 ?auto_2544861 ) ( ON ?auto_2544863 ?auto_2544862 ) ( not ( = ?auto_2544855 ?auto_2544856 ) ) ( not ( = ?auto_2544855 ?auto_2544857 ) ) ( not ( = ?auto_2544855 ?auto_2544858 ) ) ( not ( = ?auto_2544855 ?auto_2544859 ) ) ( not ( = ?auto_2544855 ?auto_2544860 ) ) ( not ( = ?auto_2544855 ?auto_2544861 ) ) ( not ( = ?auto_2544855 ?auto_2544862 ) ) ( not ( = ?auto_2544855 ?auto_2544863 ) ) ( not ( = ?auto_2544855 ?auto_2544864 ) ) ( not ( = ?auto_2544855 ?auto_2544865 ) ) ( not ( = ?auto_2544855 ?auto_2544869 ) ) ( not ( = ?auto_2544856 ?auto_2544857 ) ) ( not ( = ?auto_2544856 ?auto_2544858 ) ) ( not ( = ?auto_2544856 ?auto_2544859 ) ) ( not ( = ?auto_2544856 ?auto_2544860 ) ) ( not ( = ?auto_2544856 ?auto_2544861 ) ) ( not ( = ?auto_2544856 ?auto_2544862 ) ) ( not ( = ?auto_2544856 ?auto_2544863 ) ) ( not ( = ?auto_2544856 ?auto_2544864 ) ) ( not ( = ?auto_2544856 ?auto_2544865 ) ) ( not ( = ?auto_2544856 ?auto_2544869 ) ) ( not ( = ?auto_2544857 ?auto_2544858 ) ) ( not ( = ?auto_2544857 ?auto_2544859 ) ) ( not ( = ?auto_2544857 ?auto_2544860 ) ) ( not ( = ?auto_2544857 ?auto_2544861 ) ) ( not ( = ?auto_2544857 ?auto_2544862 ) ) ( not ( = ?auto_2544857 ?auto_2544863 ) ) ( not ( = ?auto_2544857 ?auto_2544864 ) ) ( not ( = ?auto_2544857 ?auto_2544865 ) ) ( not ( = ?auto_2544857 ?auto_2544869 ) ) ( not ( = ?auto_2544858 ?auto_2544859 ) ) ( not ( = ?auto_2544858 ?auto_2544860 ) ) ( not ( = ?auto_2544858 ?auto_2544861 ) ) ( not ( = ?auto_2544858 ?auto_2544862 ) ) ( not ( = ?auto_2544858 ?auto_2544863 ) ) ( not ( = ?auto_2544858 ?auto_2544864 ) ) ( not ( = ?auto_2544858 ?auto_2544865 ) ) ( not ( = ?auto_2544858 ?auto_2544869 ) ) ( not ( = ?auto_2544859 ?auto_2544860 ) ) ( not ( = ?auto_2544859 ?auto_2544861 ) ) ( not ( = ?auto_2544859 ?auto_2544862 ) ) ( not ( = ?auto_2544859 ?auto_2544863 ) ) ( not ( = ?auto_2544859 ?auto_2544864 ) ) ( not ( = ?auto_2544859 ?auto_2544865 ) ) ( not ( = ?auto_2544859 ?auto_2544869 ) ) ( not ( = ?auto_2544860 ?auto_2544861 ) ) ( not ( = ?auto_2544860 ?auto_2544862 ) ) ( not ( = ?auto_2544860 ?auto_2544863 ) ) ( not ( = ?auto_2544860 ?auto_2544864 ) ) ( not ( = ?auto_2544860 ?auto_2544865 ) ) ( not ( = ?auto_2544860 ?auto_2544869 ) ) ( not ( = ?auto_2544861 ?auto_2544862 ) ) ( not ( = ?auto_2544861 ?auto_2544863 ) ) ( not ( = ?auto_2544861 ?auto_2544864 ) ) ( not ( = ?auto_2544861 ?auto_2544865 ) ) ( not ( = ?auto_2544861 ?auto_2544869 ) ) ( not ( = ?auto_2544862 ?auto_2544863 ) ) ( not ( = ?auto_2544862 ?auto_2544864 ) ) ( not ( = ?auto_2544862 ?auto_2544865 ) ) ( not ( = ?auto_2544862 ?auto_2544869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2544863 ?auto_2544864 ?auto_2544865 )
      ( MAKE-10CRATE-VERIFY ?auto_2544855 ?auto_2544856 ?auto_2544857 ?auto_2544858 ?auto_2544859 ?auto_2544860 ?auto_2544861 ?auto_2544862 ?auto_2544863 ?auto_2544864 ?auto_2544865 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2544981 - SURFACE
      ?auto_2544982 - SURFACE
      ?auto_2544983 - SURFACE
      ?auto_2544984 - SURFACE
      ?auto_2544985 - SURFACE
      ?auto_2544986 - SURFACE
      ?auto_2544987 - SURFACE
      ?auto_2544988 - SURFACE
      ?auto_2544989 - SURFACE
      ?auto_2544990 - SURFACE
      ?auto_2544991 - SURFACE
    )
    :vars
    (
      ?auto_2544992 - HOIST
      ?auto_2544996 - PLACE
      ?auto_2544995 - PLACE
      ?auto_2544997 - HOIST
      ?auto_2544994 - SURFACE
      ?auto_2544993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544992 ?auto_2544996 ) ( IS-CRATE ?auto_2544991 ) ( not ( = ?auto_2544990 ?auto_2544991 ) ) ( not ( = ?auto_2544989 ?auto_2544990 ) ) ( not ( = ?auto_2544989 ?auto_2544991 ) ) ( not ( = ?auto_2544995 ?auto_2544996 ) ) ( HOIST-AT ?auto_2544997 ?auto_2544995 ) ( not ( = ?auto_2544992 ?auto_2544997 ) ) ( AVAILABLE ?auto_2544997 ) ( SURFACE-AT ?auto_2544991 ?auto_2544995 ) ( ON ?auto_2544991 ?auto_2544994 ) ( CLEAR ?auto_2544991 ) ( not ( = ?auto_2544990 ?auto_2544994 ) ) ( not ( = ?auto_2544991 ?auto_2544994 ) ) ( not ( = ?auto_2544989 ?auto_2544994 ) ) ( TRUCK-AT ?auto_2544993 ?auto_2544996 ) ( SURFACE-AT ?auto_2544989 ?auto_2544996 ) ( CLEAR ?auto_2544989 ) ( LIFTING ?auto_2544992 ?auto_2544990 ) ( IS-CRATE ?auto_2544990 ) ( ON ?auto_2544982 ?auto_2544981 ) ( ON ?auto_2544983 ?auto_2544982 ) ( ON ?auto_2544984 ?auto_2544983 ) ( ON ?auto_2544985 ?auto_2544984 ) ( ON ?auto_2544986 ?auto_2544985 ) ( ON ?auto_2544987 ?auto_2544986 ) ( ON ?auto_2544988 ?auto_2544987 ) ( ON ?auto_2544989 ?auto_2544988 ) ( not ( = ?auto_2544981 ?auto_2544982 ) ) ( not ( = ?auto_2544981 ?auto_2544983 ) ) ( not ( = ?auto_2544981 ?auto_2544984 ) ) ( not ( = ?auto_2544981 ?auto_2544985 ) ) ( not ( = ?auto_2544981 ?auto_2544986 ) ) ( not ( = ?auto_2544981 ?auto_2544987 ) ) ( not ( = ?auto_2544981 ?auto_2544988 ) ) ( not ( = ?auto_2544981 ?auto_2544989 ) ) ( not ( = ?auto_2544981 ?auto_2544990 ) ) ( not ( = ?auto_2544981 ?auto_2544991 ) ) ( not ( = ?auto_2544981 ?auto_2544994 ) ) ( not ( = ?auto_2544982 ?auto_2544983 ) ) ( not ( = ?auto_2544982 ?auto_2544984 ) ) ( not ( = ?auto_2544982 ?auto_2544985 ) ) ( not ( = ?auto_2544982 ?auto_2544986 ) ) ( not ( = ?auto_2544982 ?auto_2544987 ) ) ( not ( = ?auto_2544982 ?auto_2544988 ) ) ( not ( = ?auto_2544982 ?auto_2544989 ) ) ( not ( = ?auto_2544982 ?auto_2544990 ) ) ( not ( = ?auto_2544982 ?auto_2544991 ) ) ( not ( = ?auto_2544982 ?auto_2544994 ) ) ( not ( = ?auto_2544983 ?auto_2544984 ) ) ( not ( = ?auto_2544983 ?auto_2544985 ) ) ( not ( = ?auto_2544983 ?auto_2544986 ) ) ( not ( = ?auto_2544983 ?auto_2544987 ) ) ( not ( = ?auto_2544983 ?auto_2544988 ) ) ( not ( = ?auto_2544983 ?auto_2544989 ) ) ( not ( = ?auto_2544983 ?auto_2544990 ) ) ( not ( = ?auto_2544983 ?auto_2544991 ) ) ( not ( = ?auto_2544983 ?auto_2544994 ) ) ( not ( = ?auto_2544984 ?auto_2544985 ) ) ( not ( = ?auto_2544984 ?auto_2544986 ) ) ( not ( = ?auto_2544984 ?auto_2544987 ) ) ( not ( = ?auto_2544984 ?auto_2544988 ) ) ( not ( = ?auto_2544984 ?auto_2544989 ) ) ( not ( = ?auto_2544984 ?auto_2544990 ) ) ( not ( = ?auto_2544984 ?auto_2544991 ) ) ( not ( = ?auto_2544984 ?auto_2544994 ) ) ( not ( = ?auto_2544985 ?auto_2544986 ) ) ( not ( = ?auto_2544985 ?auto_2544987 ) ) ( not ( = ?auto_2544985 ?auto_2544988 ) ) ( not ( = ?auto_2544985 ?auto_2544989 ) ) ( not ( = ?auto_2544985 ?auto_2544990 ) ) ( not ( = ?auto_2544985 ?auto_2544991 ) ) ( not ( = ?auto_2544985 ?auto_2544994 ) ) ( not ( = ?auto_2544986 ?auto_2544987 ) ) ( not ( = ?auto_2544986 ?auto_2544988 ) ) ( not ( = ?auto_2544986 ?auto_2544989 ) ) ( not ( = ?auto_2544986 ?auto_2544990 ) ) ( not ( = ?auto_2544986 ?auto_2544991 ) ) ( not ( = ?auto_2544986 ?auto_2544994 ) ) ( not ( = ?auto_2544987 ?auto_2544988 ) ) ( not ( = ?auto_2544987 ?auto_2544989 ) ) ( not ( = ?auto_2544987 ?auto_2544990 ) ) ( not ( = ?auto_2544987 ?auto_2544991 ) ) ( not ( = ?auto_2544987 ?auto_2544994 ) ) ( not ( = ?auto_2544988 ?auto_2544989 ) ) ( not ( = ?auto_2544988 ?auto_2544990 ) ) ( not ( = ?auto_2544988 ?auto_2544991 ) ) ( not ( = ?auto_2544988 ?auto_2544994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2544989 ?auto_2544990 ?auto_2544991 )
      ( MAKE-10CRATE-VERIFY ?auto_2544981 ?auto_2544982 ?auto_2544983 ?auto_2544984 ?auto_2544985 ?auto_2544986 ?auto_2544987 ?auto_2544988 ?auto_2544989 ?auto_2544990 ?auto_2544991 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2545107 - SURFACE
      ?auto_2545108 - SURFACE
      ?auto_2545109 - SURFACE
      ?auto_2545110 - SURFACE
      ?auto_2545111 - SURFACE
      ?auto_2545112 - SURFACE
      ?auto_2545113 - SURFACE
      ?auto_2545114 - SURFACE
      ?auto_2545115 - SURFACE
      ?auto_2545116 - SURFACE
      ?auto_2545117 - SURFACE
    )
    :vars
    (
      ?auto_2545118 - HOIST
      ?auto_2545121 - PLACE
      ?auto_2545120 - PLACE
      ?auto_2545123 - HOIST
      ?auto_2545122 - SURFACE
      ?auto_2545119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545118 ?auto_2545121 ) ( IS-CRATE ?auto_2545117 ) ( not ( = ?auto_2545116 ?auto_2545117 ) ) ( not ( = ?auto_2545115 ?auto_2545116 ) ) ( not ( = ?auto_2545115 ?auto_2545117 ) ) ( not ( = ?auto_2545120 ?auto_2545121 ) ) ( HOIST-AT ?auto_2545123 ?auto_2545120 ) ( not ( = ?auto_2545118 ?auto_2545123 ) ) ( AVAILABLE ?auto_2545123 ) ( SURFACE-AT ?auto_2545117 ?auto_2545120 ) ( ON ?auto_2545117 ?auto_2545122 ) ( CLEAR ?auto_2545117 ) ( not ( = ?auto_2545116 ?auto_2545122 ) ) ( not ( = ?auto_2545117 ?auto_2545122 ) ) ( not ( = ?auto_2545115 ?auto_2545122 ) ) ( TRUCK-AT ?auto_2545119 ?auto_2545121 ) ( SURFACE-AT ?auto_2545115 ?auto_2545121 ) ( CLEAR ?auto_2545115 ) ( IS-CRATE ?auto_2545116 ) ( AVAILABLE ?auto_2545118 ) ( IN ?auto_2545116 ?auto_2545119 ) ( ON ?auto_2545108 ?auto_2545107 ) ( ON ?auto_2545109 ?auto_2545108 ) ( ON ?auto_2545110 ?auto_2545109 ) ( ON ?auto_2545111 ?auto_2545110 ) ( ON ?auto_2545112 ?auto_2545111 ) ( ON ?auto_2545113 ?auto_2545112 ) ( ON ?auto_2545114 ?auto_2545113 ) ( ON ?auto_2545115 ?auto_2545114 ) ( not ( = ?auto_2545107 ?auto_2545108 ) ) ( not ( = ?auto_2545107 ?auto_2545109 ) ) ( not ( = ?auto_2545107 ?auto_2545110 ) ) ( not ( = ?auto_2545107 ?auto_2545111 ) ) ( not ( = ?auto_2545107 ?auto_2545112 ) ) ( not ( = ?auto_2545107 ?auto_2545113 ) ) ( not ( = ?auto_2545107 ?auto_2545114 ) ) ( not ( = ?auto_2545107 ?auto_2545115 ) ) ( not ( = ?auto_2545107 ?auto_2545116 ) ) ( not ( = ?auto_2545107 ?auto_2545117 ) ) ( not ( = ?auto_2545107 ?auto_2545122 ) ) ( not ( = ?auto_2545108 ?auto_2545109 ) ) ( not ( = ?auto_2545108 ?auto_2545110 ) ) ( not ( = ?auto_2545108 ?auto_2545111 ) ) ( not ( = ?auto_2545108 ?auto_2545112 ) ) ( not ( = ?auto_2545108 ?auto_2545113 ) ) ( not ( = ?auto_2545108 ?auto_2545114 ) ) ( not ( = ?auto_2545108 ?auto_2545115 ) ) ( not ( = ?auto_2545108 ?auto_2545116 ) ) ( not ( = ?auto_2545108 ?auto_2545117 ) ) ( not ( = ?auto_2545108 ?auto_2545122 ) ) ( not ( = ?auto_2545109 ?auto_2545110 ) ) ( not ( = ?auto_2545109 ?auto_2545111 ) ) ( not ( = ?auto_2545109 ?auto_2545112 ) ) ( not ( = ?auto_2545109 ?auto_2545113 ) ) ( not ( = ?auto_2545109 ?auto_2545114 ) ) ( not ( = ?auto_2545109 ?auto_2545115 ) ) ( not ( = ?auto_2545109 ?auto_2545116 ) ) ( not ( = ?auto_2545109 ?auto_2545117 ) ) ( not ( = ?auto_2545109 ?auto_2545122 ) ) ( not ( = ?auto_2545110 ?auto_2545111 ) ) ( not ( = ?auto_2545110 ?auto_2545112 ) ) ( not ( = ?auto_2545110 ?auto_2545113 ) ) ( not ( = ?auto_2545110 ?auto_2545114 ) ) ( not ( = ?auto_2545110 ?auto_2545115 ) ) ( not ( = ?auto_2545110 ?auto_2545116 ) ) ( not ( = ?auto_2545110 ?auto_2545117 ) ) ( not ( = ?auto_2545110 ?auto_2545122 ) ) ( not ( = ?auto_2545111 ?auto_2545112 ) ) ( not ( = ?auto_2545111 ?auto_2545113 ) ) ( not ( = ?auto_2545111 ?auto_2545114 ) ) ( not ( = ?auto_2545111 ?auto_2545115 ) ) ( not ( = ?auto_2545111 ?auto_2545116 ) ) ( not ( = ?auto_2545111 ?auto_2545117 ) ) ( not ( = ?auto_2545111 ?auto_2545122 ) ) ( not ( = ?auto_2545112 ?auto_2545113 ) ) ( not ( = ?auto_2545112 ?auto_2545114 ) ) ( not ( = ?auto_2545112 ?auto_2545115 ) ) ( not ( = ?auto_2545112 ?auto_2545116 ) ) ( not ( = ?auto_2545112 ?auto_2545117 ) ) ( not ( = ?auto_2545112 ?auto_2545122 ) ) ( not ( = ?auto_2545113 ?auto_2545114 ) ) ( not ( = ?auto_2545113 ?auto_2545115 ) ) ( not ( = ?auto_2545113 ?auto_2545116 ) ) ( not ( = ?auto_2545113 ?auto_2545117 ) ) ( not ( = ?auto_2545113 ?auto_2545122 ) ) ( not ( = ?auto_2545114 ?auto_2545115 ) ) ( not ( = ?auto_2545114 ?auto_2545116 ) ) ( not ( = ?auto_2545114 ?auto_2545117 ) ) ( not ( = ?auto_2545114 ?auto_2545122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2545115 ?auto_2545116 ?auto_2545117 )
      ( MAKE-10CRATE-VERIFY ?auto_2545107 ?auto_2545108 ?auto_2545109 ?auto_2545110 ?auto_2545111 ?auto_2545112 ?auto_2545113 ?auto_2545114 ?auto_2545115 ?auto_2545116 ?auto_2545117 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2552357 - SURFACE
      ?auto_2552358 - SURFACE
      ?auto_2552359 - SURFACE
      ?auto_2552360 - SURFACE
      ?auto_2552361 - SURFACE
      ?auto_2552362 - SURFACE
      ?auto_2552363 - SURFACE
      ?auto_2552364 - SURFACE
      ?auto_2552365 - SURFACE
      ?auto_2552366 - SURFACE
      ?auto_2552367 - SURFACE
      ?auto_2552368 - SURFACE
    )
    :vars
    (
      ?auto_2552370 - HOIST
      ?auto_2552369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2552370 ?auto_2552369 ) ( SURFACE-AT ?auto_2552367 ?auto_2552369 ) ( CLEAR ?auto_2552367 ) ( LIFTING ?auto_2552370 ?auto_2552368 ) ( IS-CRATE ?auto_2552368 ) ( not ( = ?auto_2552367 ?auto_2552368 ) ) ( ON ?auto_2552358 ?auto_2552357 ) ( ON ?auto_2552359 ?auto_2552358 ) ( ON ?auto_2552360 ?auto_2552359 ) ( ON ?auto_2552361 ?auto_2552360 ) ( ON ?auto_2552362 ?auto_2552361 ) ( ON ?auto_2552363 ?auto_2552362 ) ( ON ?auto_2552364 ?auto_2552363 ) ( ON ?auto_2552365 ?auto_2552364 ) ( ON ?auto_2552366 ?auto_2552365 ) ( ON ?auto_2552367 ?auto_2552366 ) ( not ( = ?auto_2552357 ?auto_2552358 ) ) ( not ( = ?auto_2552357 ?auto_2552359 ) ) ( not ( = ?auto_2552357 ?auto_2552360 ) ) ( not ( = ?auto_2552357 ?auto_2552361 ) ) ( not ( = ?auto_2552357 ?auto_2552362 ) ) ( not ( = ?auto_2552357 ?auto_2552363 ) ) ( not ( = ?auto_2552357 ?auto_2552364 ) ) ( not ( = ?auto_2552357 ?auto_2552365 ) ) ( not ( = ?auto_2552357 ?auto_2552366 ) ) ( not ( = ?auto_2552357 ?auto_2552367 ) ) ( not ( = ?auto_2552357 ?auto_2552368 ) ) ( not ( = ?auto_2552358 ?auto_2552359 ) ) ( not ( = ?auto_2552358 ?auto_2552360 ) ) ( not ( = ?auto_2552358 ?auto_2552361 ) ) ( not ( = ?auto_2552358 ?auto_2552362 ) ) ( not ( = ?auto_2552358 ?auto_2552363 ) ) ( not ( = ?auto_2552358 ?auto_2552364 ) ) ( not ( = ?auto_2552358 ?auto_2552365 ) ) ( not ( = ?auto_2552358 ?auto_2552366 ) ) ( not ( = ?auto_2552358 ?auto_2552367 ) ) ( not ( = ?auto_2552358 ?auto_2552368 ) ) ( not ( = ?auto_2552359 ?auto_2552360 ) ) ( not ( = ?auto_2552359 ?auto_2552361 ) ) ( not ( = ?auto_2552359 ?auto_2552362 ) ) ( not ( = ?auto_2552359 ?auto_2552363 ) ) ( not ( = ?auto_2552359 ?auto_2552364 ) ) ( not ( = ?auto_2552359 ?auto_2552365 ) ) ( not ( = ?auto_2552359 ?auto_2552366 ) ) ( not ( = ?auto_2552359 ?auto_2552367 ) ) ( not ( = ?auto_2552359 ?auto_2552368 ) ) ( not ( = ?auto_2552360 ?auto_2552361 ) ) ( not ( = ?auto_2552360 ?auto_2552362 ) ) ( not ( = ?auto_2552360 ?auto_2552363 ) ) ( not ( = ?auto_2552360 ?auto_2552364 ) ) ( not ( = ?auto_2552360 ?auto_2552365 ) ) ( not ( = ?auto_2552360 ?auto_2552366 ) ) ( not ( = ?auto_2552360 ?auto_2552367 ) ) ( not ( = ?auto_2552360 ?auto_2552368 ) ) ( not ( = ?auto_2552361 ?auto_2552362 ) ) ( not ( = ?auto_2552361 ?auto_2552363 ) ) ( not ( = ?auto_2552361 ?auto_2552364 ) ) ( not ( = ?auto_2552361 ?auto_2552365 ) ) ( not ( = ?auto_2552361 ?auto_2552366 ) ) ( not ( = ?auto_2552361 ?auto_2552367 ) ) ( not ( = ?auto_2552361 ?auto_2552368 ) ) ( not ( = ?auto_2552362 ?auto_2552363 ) ) ( not ( = ?auto_2552362 ?auto_2552364 ) ) ( not ( = ?auto_2552362 ?auto_2552365 ) ) ( not ( = ?auto_2552362 ?auto_2552366 ) ) ( not ( = ?auto_2552362 ?auto_2552367 ) ) ( not ( = ?auto_2552362 ?auto_2552368 ) ) ( not ( = ?auto_2552363 ?auto_2552364 ) ) ( not ( = ?auto_2552363 ?auto_2552365 ) ) ( not ( = ?auto_2552363 ?auto_2552366 ) ) ( not ( = ?auto_2552363 ?auto_2552367 ) ) ( not ( = ?auto_2552363 ?auto_2552368 ) ) ( not ( = ?auto_2552364 ?auto_2552365 ) ) ( not ( = ?auto_2552364 ?auto_2552366 ) ) ( not ( = ?auto_2552364 ?auto_2552367 ) ) ( not ( = ?auto_2552364 ?auto_2552368 ) ) ( not ( = ?auto_2552365 ?auto_2552366 ) ) ( not ( = ?auto_2552365 ?auto_2552367 ) ) ( not ( = ?auto_2552365 ?auto_2552368 ) ) ( not ( = ?auto_2552366 ?auto_2552367 ) ) ( not ( = ?auto_2552366 ?auto_2552368 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2552367 ?auto_2552368 )
      ( MAKE-11CRATE-VERIFY ?auto_2552357 ?auto_2552358 ?auto_2552359 ?auto_2552360 ?auto_2552361 ?auto_2552362 ?auto_2552363 ?auto_2552364 ?auto_2552365 ?auto_2552366 ?auto_2552367 ?auto_2552368 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2552466 - SURFACE
      ?auto_2552467 - SURFACE
      ?auto_2552468 - SURFACE
      ?auto_2552469 - SURFACE
      ?auto_2552470 - SURFACE
      ?auto_2552471 - SURFACE
      ?auto_2552472 - SURFACE
      ?auto_2552473 - SURFACE
      ?auto_2552474 - SURFACE
      ?auto_2552475 - SURFACE
      ?auto_2552476 - SURFACE
      ?auto_2552477 - SURFACE
    )
    :vars
    (
      ?auto_2552479 - HOIST
      ?auto_2552478 - PLACE
      ?auto_2552480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2552479 ?auto_2552478 ) ( SURFACE-AT ?auto_2552476 ?auto_2552478 ) ( CLEAR ?auto_2552476 ) ( IS-CRATE ?auto_2552477 ) ( not ( = ?auto_2552476 ?auto_2552477 ) ) ( TRUCK-AT ?auto_2552480 ?auto_2552478 ) ( AVAILABLE ?auto_2552479 ) ( IN ?auto_2552477 ?auto_2552480 ) ( ON ?auto_2552476 ?auto_2552475 ) ( not ( = ?auto_2552475 ?auto_2552476 ) ) ( not ( = ?auto_2552475 ?auto_2552477 ) ) ( ON ?auto_2552467 ?auto_2552466 ) ( ON ?auto_2552468 ?auto_2552467 ) ( ON ?auto_2552469 ?auto_2552468 ) ( ON ?auto_2552470 ?auto_2552469 ) ( ON ?auto_2552471 ?auto_2552470 ) ( ON ?auto_2552472 ?auto_2552471 ) ( ON ?auto_2552473 ?auto_2552472 ) ( ON ?auto_2552474 ?auto_2552473 ) ( ON ?auto_2552475 ?auto_2552474 ) ( not ( = ?auto_2552466 ?auto_2552467 ) ) ( not ( = ?auto_2552466 ?auto_2552468 ) ) ( not ( = ?auto_2552466 ?auto_2552469 ) ) ( not ( = ?auto_2552466 ?auto_2552470 ) ) ( not ( = ?auto_2552466 ?auto_2552471 ) ) ( not ( = ?auto_2552466 ?auto_2552472 ) ) ( not ( = ?auto_2552466 ?auto_2552473 ) ) ( not ( = ?auto_2552466 ?auto_2552474 ) ) ( not ( = ?auto_2552466 ?auto_2552475 ) ) ( not ( = ?auto_2552466 ?auto_2552476 ) ) ( not ( = ?auto_2552466 ?auto_2552477 ) ) ( not ( = ?auto_2552467 ?auto_2552468 ) ) ( not ( = ?auto_2552467 ?auto_2552469 ) ) ( not ( = ?auto_2552467 ?auto_2552470 ) ) ( not ( = ?auto_2552467 ?auto_2552471 ) ) ( not ( = ?auto_2552467 ?auto_2552472 ) ) ( not ( = ?auto_2552467 ?auto_2552473 ) ) ( not ( = ?auto_2552467 ?auto_2552474 ) ) ( not ( = ?auto_2552467 ?auto_2552475 ) ) ( not ( = ?auto_2552467 ?auto_2552476 ) ) ( not ( = ?auto_2552467 ?auto_2552477 ) ) ( not ( = ?auto_2552468 ?auto_2552469 ) ) ( not ( = ?auto_2552468 ?auto_2552470 ) ) ( not ( = ?auto_2552468 ?auto_2552471 ) ) ( not ( = ?auto_2552468 ?auto_2552472 ) ) ( not ( = ?auto_2552468 ?auto_2552473 ) ) ( not ( = ?auto_2552468 ?auto_2552474 ) ) ( not ( = ?auto_2552468 ?auto_2552475 ) ) ( not ( = ?auto_2552468 ?auto_2552476 ) ) ( not ( = ?auto_2552468 ?auto_2552477 ) ) ( not ( = ?auto_2552469 ?auto_2552470 ) ) ( not ( = ?auto_2552469 ?auto_2552471 ) ) ( not ( = ?auto_2552469 ?auto_2552472 ) ) ( not ( = ?auto_2552469 ?auto_2552473 ) ) ( not ( = ?auto_2552469 ?auto_2552474 ) ) ( not ( = ?auto_2552469 ?auto_2552475 ) ) ( not ( = ?auto_2552469 ?auto_2552476 ) ) ( not ( = ?auto_2552469 ?auto_2552477 ) ) ( not ( = ?auto_2552470 ?auto_2552471 ) ) ( not ( = ?auto_2552470 ?auto_2552472 ) ) ( not ( = ?auto_2552470 ?auto_2552473 ) ) ( not ( = ?auto_2552470 ?auto_2552474 ) ) ( not ( = ?auto_2552470 ?auto_2552475 ) ) ( not ( = ?auto_2552470 ?auto_2552476 ) ) ( not ( = ?auto_2552470 ?auto_2552477 ) ) ( not ( = ?auto_2552471 ?auto_2552472 ) ) ( not ( = ?auto_2552471 ?auto_2552473 ) ) ( not ( = ?auto_2552471 ?auto_2552474 ) ) ( not ( = ?auto_2552471 ?auto_2552475 ) ) ( not ( = ?auto_2552471 ?auto_2552476 ) ) ( not ( = ?auto_2552471 ?auto_2552477 ) ) ( not ( = ?auto_2552472 ?auto_2552473 ) ) ( not ( = ?auto_2552472 ?auto_2552474 ) ) ( not ( = ?auto_2552472 ?auto_2552475 ) ) ( not ( = ?auto_2552472 ?auto_2552476 ) ) ( not ( = ?auto_2552472 ?auto_2552477 ) ) ( not ( = ?auto_2552473 ?auto_2552474 ) ) ( not ( = ?auto_2552473 ?auto_2552475 ) ) ( not ( = ?auto_2552473 ?auto_2552476 ) ) ( not ( = ?auto_2552473 ?auto_2552477 ) ) ( not ( = ?auto_2552474 ?auto_2552475 ) ) ( not ( = ?auto_2552474 ?auto_2552476 ) ) ( not ( = ?auto_2552474 ?auto_2552477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2552475 ?auto_2552476 ?auto_2552477 )
      ( MAKE-11CRATE-VERIFY ?auto_2552466 ?auto_2552467 ?auto_2552468 ?auto_2552469 ?auto_2552470 ?auto_2552471 ?auto_2552472 ?auto_2552473 ?auto_2552474 ?auto_2552475 ?auto_2552476 ?auto_2552477 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2552587 - SURFACE
      ?auto_2552588 - SURFACE
      ?auto_2552589 - SURFACE
      ?auto_2552590 - SURFACE
      ?auto_2552591 - SURFACE
      ?auto_2552592 - SURFACE
      ?auto_2552593 - SURFACE
      ?auto_2552594 - SURFACE
      ?auto_2552595 - SURFACE
      ?auto_2552596 - SURFACE
      ?auto_2552597 - SURFACE
      ?auto_2552598 - SURFACE
    )
    :vars
    (
      ?auto_2552601 - HOIST
      ?auto_2552599 - PLACE
      ?auto_2552602 - TRUCK
      ?auto_2552600 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2552601 ?auto_2552599 ) ( SURFACE-AT ?auto_2552597 ?auto_2552599 ) ( CLEAR ?auto_2552597 ) ( IS-CRATE ?auto_2552598 ) ( not ( = ?auto_2552597 ?auto_2552598 ) ) ( AVAILABLE ?auto_2552601 ) ( IN ?auto_2552598 ?auto_2552602 ) ( ON ?auto_2552597 ?auto_2552596 ) ( not ( = ?auto_2552596 ?auto_2552597 ) ) ( not ( = ?auto_2552596 ?auto_2552598 ) ) ( TRUCK-AT ?auto_2552602 ?auto_2552600 ) ( not ( = ?auto_2552600 ?auto_2552599 ) ) ( ON ?auto_2552588 ?auto_2552587 ) ( ON ?auto_2552589 ?auto_2552588 ) ( ON ?auto_2552590 ?auto_2552589 ) ( ON ?auto_2552591 ?auto_2552590 ) ( ON ?auto_2552592 ?auto_2552591 ) ( ON ?auto_2552593 ?auto_2552592 ) ( ON ?auto_2552594 ?auto_2552593 ) ( ON ?auto_2552595 ?auto_2552594 ) ( ON ?auto_2552596 ?auto_2552595 ) ( not ( = ?auto_2552587 ?auto_2552588 ) ) ( not ( = ?auto_2552587 ?auto_2552589 ) ) ( not ( = ?auto_2552587 ?auto_2552590 ) ) ( not ( = ?auto_2552587 ?auto_2552591 ) ) ( not ( = ?auto_2552587 ?auto_2552592 ) ) ( not ( = ?auto_2552587 ?auto_2552593 ) ) ( not ( = ?auto_2552587 ?auto_2552594 ) ) ( not ( = ?auto_2552587 ?auto_2552595 ) ) ( not ( = ?auto_2552587 ?auto_2552596 ) ) ( not ( = ?auto_2552587 ?auto_2552597 ) ) ( not ( = ?auto_2552587 ?auto_2552598 ) ) ( not ( = ?auto_2552588 ?auto_2552589 ) ) ( not ( = ?auto_2552588 ?auto_2552590 ) ) ( not ( = ?auto_2552588 ?auto_2552591 ) ) ( not ( = ?auto_2552588 ?auto_2552592 ) ) ( not ( = ?auto_2552588 ?auto_2552593 ) ) ( not ( = ?auto_2552588 ?auto_2552594 ) ) ( not ( = ?auto_2552588 ?auto_2552595 ) ) ( not ( = ?auto_2552588 ?auto_2552596 ) ) ( not ( = ?auto_2552588 ?auto_2552597 ) ) ( not ( = ?auto_2552588 ?auto_2552598 ) ) ( not ( = ?auto_2552589 ?auto_2552590 ) ) ( not ( = ?auto_2552589 ?auto_2552591 ) ) ( not ( = ?auto_2552589 ?auto_2552592 ) ) ( not ( = ?auto_2552589 ?auto_2552593 ) ) ( not ( = ?auto_2552589 ?auto_2552594 ) ) ( not ( = ?auto_2552589 ?auto_2552595 ) ) ( not ( = ?auto_2552589 ?auto_2552596 ) ) ( not ( = ?auto_2552589 ?auto_2552597 ) ) ( not ( = ?auto_2552589 ?auto_2552598 ) ) ( not ( = ?auto_2552590 ?auto_2552591 ) ) ( not ( = ?auto_2552590 ?auto_2552592 ) ) ( not ( = ?auto_2552590 ?auto_2552593 ) ) ( not ( = ?auto_2552590 ?auto_2552594 ) ) ( not ( = ?auto_2552590 ?auto_2552595 ) ) ( not ( = ?auto_2552590 ?auto_2552596 ) ) ( not ( = ?auto_2552590 ?auto_2552597 ) ) ( not ( = ?auto_2552590 ?auto_2552598 ) ) ( not ( = ?auto_2552591 ?auto_2552592 ) ) ( not ( = ?auto_2552591 ?auto_2552593 ) ) ( not ( = ?auto_2552591 ?auto_2552594 ) ) ( not ( = ?auto_2552591 ?auto_2552595 ) ) ( not ( = ?auto_2552591 ?auto_2552596 ) ) ( not ( = ?auto_2552591 ?auto_2552597 ) ) ( not ( = ?auto_2552591 ?auto_2552598 ) ) ( not ( = ?auto_2552592 ?auto_2552593 ) ) ( not ( = ?auto_2552592 ?auto_2552594 ) ) ( not ( = ?auto_2552592 ?auto_2552595 ) ) ( not ( = ?auto_2552592 ?auto_2552596 ) ) ( not ( = ?auto_2552592 ?auto_2552597 ) ) ( not ( = ?auto_2552592 ?auto_2552598 ) ) ( not ( = ?auto_2552593 ?auto_2552594 ) ) ( not ( = ?auto_2552593 ?auto_2552595 ) ) ( not ( = ?auto_2552593 ?auto_2552596 ) ) ( not ( = ?auto_2552593 ?auto_2552597 ) ) ( not ( = ?auto_2552593 ?auto_2552598 ) ) ( not ( = ?auto_2552594 ?auto_2552595 ) ) ( not ( = ?auto_2552594 ?auto_2552596 ) ) ( not ( = ?auto_2552594 ?auto_2552597 ) ) ( not ( = ?auto_2552594 ?auto_2552598 ) ) ( not ( = ?auto_2552595 ?auto_2552596 ) ) ( not ( = ?auto_2552595 ?auto_2552597 ) ) ( not ( = ?auto_2552595 ?auto_2552598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2552596 ?auto_2552597 ?auto_2552598 )
      ( MAKE-11CRATE-VERIFY ?auto_2552587 ?auto_2552588 ?auto_2552589 ?auto_2552590 ?auto_2552591 ?auto_2552592 ?auto_2552593 ?auto_2552594 ?auto_2552595 ?auto_2552596 ?auto_2552597 ?auto_2552598 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2552719 - SURFACE
      ?auto_2552720 - SURFACE
      ?auto_2552721 - SURFACE
      ?auto_2552722 - SURFACE
      ?auto_2552723 - SURFACE
      ?auto_2552724 - SURFACE
      ?auto_2552725 - SURFACE
      ?auto_2552726 - SURFACE
      ?auto_2552727 - SURFACE
      ?auto_2552728 - SURFACE
      ?auto_2552729 - SURFACE
      ?auto_2552730 - SURFACE
    )
    :vars
    (
      ?auto_2552734 - HOIST
      ?auto_2552732 - PLACE
      ?auto_2552735 - TRUCK
      ?auto_2552733 - PLACE
      ?auto_2552731 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2552734 ?auto_2552732 ) ( SURFACE-AT ?auto_2552729 ?auto_2552732 ) ( CLEAR ?auto_2552729 ) ( IS-CRATE ?auto_2552730 ) ( not ( = ?auto_2552729 ?auto_2552730 ) ) ( AVAILABLE ?auto_2552734 ) ( ON ?auto_2552729 ?auto_2552728 ) ( not ( = ?auto_2552728 ?auto_2552729 ) ) ( not ( = ?auto_2552728 ?auto_2552730 ) ) ( TRUCK-AT ?auto_2552735 ?auto_2552733 ) ( not ( = ?auto_2552733 ?auto_2552732 ) ) ( HOIST-AT ?auto_2552731 ?auto_2552733 ) ( LIFTING ?auto_2552731 ?auto_2552730 ) ( not ( = ?auto_2552734 ?auto_2552731 ) ) ( ON ?auto_2552720 ?auto_2552719 ) ( ON ?auto_2552721 ?auto_2552720 ) ( ON ?auto_2552722 ?auto_2552721 ) ( ON ?auto_2552723 ?auto_2552722 ) ( ON ?auto_2552724 ?auto_2552723 ) ( ON ?auto_2552725 ?auto_2552724 ) ( ON ?auto_2552726 ?auto_2552725 ) ( ON ?auto_2552727 ?auto_2552726 ) ( ON ?auto_2552728 ?auto_2552727 ) ( not ( = ?auto_2552719 ?auto_2552720 ) ) ( not ( = ?auto_2552719 ?auto_2552721 ) ) ( not ( = ?auto_2552719 ?auto_2552722 ) ) ( not ( = ?auto_2552719 ?auto_2552723 ) ) ( not ( = ?auto_2552719 ?auto_2552724 ) ) ( not ( = ?auto_2552719 ?auto_2552725 ) ) ( not ( = ?auto_2552719 ?auto_2552726 ) ) ( not ( = ?auto_2552719 ?auto_2552727 ) ) ( not ( = ?auto_2552719 ?auto_2552728 ) ) ( not ( = ?auto_2552719 ?auto_2552729 ) ) ( not ( = ?auto_2552719 ?auto_2552730 ) ) ( not ( = ?auto_2552720 ?auto_2552721 ) ) ( not ( = ?auto_2552720 ?auto_2552722 ) ) ( not ( = ?auto_2552720 ?auto_2552723 ) ) ( not ( = ?auto_2552720 ?auto_2552724 ) ) ( not ( = ?auto_2552720 ?auto_2552725 ) ) ( not ( = ?auto_2552720 ?auto_2552726 ) ) ( not ( = ?auto_2552720 ?auto_2552727 ) ) ( not ( = ?auto_2552720 ?auto_2552728 ) ) ( not ( = ?auto_2552720 ?auto_2552729 ) ) ( not ( = ?auto_2552720 ?auto_2552730 ) ) ( not ( = ?auto_2552721 ?auto_2552722 ) ) ( not ( = ?auto_2552721 ?auto_2552723 ) ) ( not ( = ?auto_2552721 ?auto_2552724 ) ) ( not ( = ?auto_2552721 ?auto_2552725 ) ) ( not ( = ?auto_2552721 ?auto_2552726 ) ) ( not ( = ?auto_2552721 ?auto_2552727 ) ) ( not ( = ?auto_2552721 ?auto_2552728 ) ) ( not ( = ?auto_2552721 ?auto_2552729 ) ) ( not ( = ?auto_2552721 ?auto_2552730 ) ) ( not ( = ?auto_2552722 ?auto_2552723 ) ) ( not ( = ?auto_2552722 ?auto_2552724 ) ) ( not ( = ?auto_2552722 ?auto_2552725 ) ) ( not ( = ?auto_2552722 ?auto_2552726 ) ) ( not ( = ?auto_2552722 ?auto_2552727 ) ) ( not ( = ?auto_2552722 ?auto_2552728 ) ) ( not ( = ?auto_2552722 ?auto_2552729 ) ) ( not ( = ?auto_2552722 ?auto_2552730 ) ) ( not ( = ?auto_2552723 ?auto_2552724 ) ) ( not ( = ?auto_2552723 ?auto_2552725 ) ) ( not ( = ?auto_2552723 ?auto_2552726 ) ) ( not ( = ?auto_2552723 ?auto_2552727 ) ) ( not ( = ?auto_2552723 ?auto_2552728 ) ) ( not ( = ?auto_2552723 ?auto_2552729 ) ) ( not ( = ?auto_2552723 ?auto_2552730 ) ) ( not ( = ?auto_2552724 ?auto_2552725 ) ) ( not ( = ?auto_2552724 ?auto_2552726 ) ) ( not ( = ?auto_2552724 ?auto_2552727 ) ) ( not ( = ?auto_2552724 ?auto_2552728 ) ) ( not ( = ?auto_2552724 ?auto_2552729 ) ) ( not ( = ?auto_2552724 ?auto_2552730 ) ) ( not ( = ?auto_2552725 ?auto_2552726 ) ) ( not ( = ?auto_2552725 ?auto_2552727 ) ) ( not ( = ?auto_2552725 ?auto_2552728 ) ) ( not ( = ?auto_2552725 ?auto_2552729 ) ) ( not ( = ?auto_2552725 ?auto_2552730 ) ) ( not ( = ?auto_2552726 ?auto_2552727 ) ) ( not ( = ?auto_2552726 ?auto_2552728 ) ) ( not ( = ?auto_2552726 ?auto_2552729 ) ) ( not ( = ?auto_2552726 ?auto_2552730 ) ) ( not ( = ?auto_2552727 ?auto_2552728 ) ) ( not ( = ?auto_2552727 ?auto_2552729 ) ) ( not ( = ?auto_2552727 ?auto_2552730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2552728 ?auto_2552729 ?auto_2552730 )
      ( MAKE-11CRATE-VERIFY ?auto_2552719 ?auto_2552720 ?auto_2552721 ?auto_2552722 ?auto_2552723 ?auto_2552724 ?auto_2552725 ?auto_2552726 ?auto_2552727 ?auto_2552728 ?auto_2552729 ?auto_2552730 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2552862 - SURFACE
      ?auto_2552863 - SURFACE
      ?auto_2552864 - SURFACE
      ?auto_2552865 - SURFACE
      ?auto_2552866 - SURFACE
      ?auto_2552867 - SURFACE
      ?auto_2552868 - SURFACE
      ?auto_2552869 - SURFACE
      ?auto_2552870 - SURFACE
      ?auto_2552871 - SURFACE
      ?auto_2552872 - SURFACE
      ?auto_2552873 - SURFACE
    )
    :vars
    (
      ?auto_2552878 - HOIST
      ?auto_2552875 - PLACE
      ?auto_2552877 - TRUCK
      ?auto_2552879 - PLACE
      ?auto_2552874 - HOIST
      ?auto_2552876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2552878 ?auto_2552875 ) ( SURFACE-AT ?auto_2552872 ?auto_2552875 ) ( CLEAR ?auto_2552872 ) ( IS-CRATE ?auto_2552873 ) ( not ( = ?auto_2552872 ?auto_2552873 ) ) ( AVAILABLE ?auto_2552878 ) ( ON ?auto_2552872 ?auto_2552871 ) ( not ( = ?auto_2552871 ?auto_2552872 ) ) ( not ( = ?auto_2552871 ?auto_2552873 ) ) ( TRUCK-AT ?auto_2552877 ?auto_2552879 ) ( not ( = ?auto_2552879 ?auto_2552875 ) ) ( HOIST-AT ?auto_2552874 ?auto_2552879 ) ( not ( = ?auto_2552878 ?auto_2552874 ) ) ( AVAILABLE ?auto_2552874 ) ( SURFACE-AT ?auto_2552873 ?auto_2552879 ) ( ON ?auto_2552873 ?auto_2552876 ) ( CLEAR ?auto_2552873 ) ( not ( = ?auto_2552872 ?auto_2552876 ) ) ( not ( = ?auto_2552873 ?auto_2552876 ) ) ( not ( = ?auto_2552871 ?auto_2552876 ) ) ( ON ?auto_2552863 ?auto_2552862 ) ( ON ?auto_2552864 ?auto_2552863 ) ( ON ?auto_2552865 ?auto_2552864 ) ( ON ?auto_2552866 ?auto_2552865 ) ( ON ?auto_2552867 ?auto_2552866 ) ( ON ?auto_2552868 ?auto_2552867 ) ( ON ?auto_2552869 ?auto_2552868 ) ( ON ?auto_2552870 ?auto_2552869 ) ( ON ?auto_2552871 ?auto_2552870 ) ( not ( = ?auto_2552862 ?auto_2552863 ) ) ( not ( = ?auto_2552862 ?auto_2552864 ) ) ( not ( = ?auto_2552862 ?auto_2552865 ) ) ( not ( = ?auto_2552862 ?auto_2552866 ) ) ( not ( = ?auto_2552862 ?auto_2552867 ) ) ( not ( = ?auto_2552862 ?auto_2552868 ) ) ( not ( = ?auto_2552862 ?auto_2552869 ) ) ( not ( = ?auto_2552862 ?auto_2552870 ) ) ( not ( = ?auto_2552862 ?auto_2552871 ) ) ( not ( = ?auto_2552862 ?auto_2552872 ) ) ( not ( = ?auto_2552862 ?auto_2552873 ) ) ( not ( = ?auto_2552862 ?auto_2552876 ) ) ( not ( = ?auto_2552863 ?auto_2552864 ) ) ( not ( = ?auto_2552863 ?auto_2552865 ) ) ( not ( = ?auto_2552863 ?auto_2552866 ) ) ( not ( = ?auto_2552863 ?auto_2552867 ) ) ( not ( = ?auto_2552863 ?auto_2552868 ) ) ( not ( = ?auto_2552863 ?auto_2552869 ) ) ( not ( = ?auto_2552863 ?auto_2552870 ) ) ( not ( = ?auto_2552863 ?auto_2552871 ) ) ( not ( = ?auto_2552863 ?auto_2552872 ) ) ( not ( = ?auto_2552863 ?auto_2552873 ) ) ( not ( = ?auto_2552863 ?auto_2552876 ) ) ( not ( = ?auto_2552864 ?auto_2552865 ) ) ( not ( = ?auto_2552864 ?auto_2552866 ) ) ( not ( = ?auto_2552864 ?auto_2552867 ) ) ( not ( = ?auto_2552864 ?auto_2552868 ) ) ( not ( = ?auto_2552864 ?auto_2552869 ) ) ( not ( = ?auto_2552864 ?auto_2552870 ) ) ( not ( = ?auto_2552864 ?auto_2552871 ) ) ( not ( = ?auto_2552864 ?auto_2552872 ) ) ( not ( = ?auto_2552864 ?auto_2552873 ) ) ( not ( = ?auto_2552864 ?auto_2552876 ) ) ( not ( = ?auto_2552865 ?auto_2552866 ) ) ( not ( = ?auto_2552865 ?auto_2552867 ) ) ( not ( = ?auto_2552865 ?auto_2552868 ) ) ( not ( = ?auto_2552865 ?auto_2552869 ) ) ( not ( = ?auto_2552865 ?auto_2552870 ) ) ( not ( = ?auto_2552865 ?auto_2552871 ) ) ( not ( = ?auto_2552865 ?auto_2552872 ) ) ( not ( = ?auto_2552865 ?auto_2552873 ) ) ( not ( = ?auto_2552865 ?auto_2552876 ) ) ( not ( = ?auto_2552866 ?auto_2552867 ) ) ( not ( = ?auto_2552866 ?auto_2552868 ) ) ( not ( = ?auto_2552866 ?auto_2552869 ) ) ( not ( = ?auto_2552866 ?auto_2552870 ) ) ( not ( = ?auto_2552866 ?auto_2552871 ) ) ( not ( = ?auto_2552866 ?auto_2552872 ) ) ( not ( = ?auto_2552866 ?auto_2552873 ) ) ( not ( = ?auto_2552866 ?auto_2552876 ) ) ( not ( = ?auto_2552867 ?auto_2552868 ) ) ( not ( = ?auto_2552867 ?auto_2552869 ) ) ( not ( = ?auto_2552867 ?auto_2552870 ) ) ( not ( = ?auto_2552867 ?auto_2552871 ) ) ( not ( = ?auto_2552867 ?auto_2552872 ) ) ( not ( = ?auto_2552867 ?auto_2552873 ) ) ( not ( = ?auto_2552867 ?auto_2552876 ) ) ( not ( = ?auto_2552868 ?auto_2552869 ) ) ( not ( = ?auto_2552868 ?auto_2552870 ) ) ( not ( = ?auto_2552868 ?auto_2552871 ) ) ( not ( = ?auto_2552868 ?auto_2552872 ) ) ( not ( = ?auto_2552868 ?auto_2552873 ) ) ( not ( = ?auto_2552868 ?auto_2552876 ) ) ( not ( = ?auto_2552869 ?auto_2552870 ) ) ( not ( = ?auto_2552869 ?auto_2552871 ) ) ( not ( = ?auto_2552869 ?auto_2552872 ) ) ( not ( = ?auto_2552869 ?auto_2552873 ) ) ( not ( = ?auto_2552869 ?auto_2552876 ) ) ( not ( = ?auto_2552870 ?auto_2552871 ) ) ( not ( = ?auto_2552870 ?auto_2552872 ) ) ( not ( = ?auto_2552870 ?auto_2552873 ) ) ( not ( = ?auto_2552870 ?auto_2552876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2552871 ?auto_2552872 ?auto_2552873 )
      ( MAKE-11CRATE-VERIFY ?auto_2552862 ?auto_2552863 ?auto_2552864 ?auto_2552865 ?auto_2552866 ?auto_2552867 ?auto_2552868 ?auto_2552869 ?auto_2552870 ?auto_2552871 ?auto_2552872 ?auto_2552873 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553006 - SURFACE
      ?auto_2553007 - SURFACE
      ?auto_2553008 - SURFACE
      ?auto_2553009 - SURFACE
      ?auto_2553010 - SURFACE
      ?auto_2553011 - SURFACE
      ?auto_2553012 - SURFACE
      ?auto_2553013 - SURFACE
      ?auto_2553014 - SURFACE
      ?auto_2553015 - SURFACE
      ?auto_2553016 - SURFACE
      ?auto_2553017 - SURFACE
    )
    :vars
    (
      ?auto_2553020 - HOIST
      ?auto_2553023 - PLACE
      ?auto_2553018 - PLACE
      ?auto_2553019 - HOIST
      ?auto_2553022 - SURFACE
      ?auto_2553021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553020 ?auto_2553023 ) ( SURFACE-AT ?auto_2553016 ?auto_2553023 ) ( CLEAR ?auto_2553016 ) ( IS-CRATE ?auto_2553017 ) ( not ( = ?auto_2553016 ?auto_2553017 ) ) ( AVAILABLE ?auto_2553020 ) ( ON ?auto_2553016 ?auto_2553015 ) ( not ( = ?auto_2553015 ?auto_2553016 ) ) ( not ( = ?auto_2553015 ?auto_2553017 ) ) ( not ( = ?auto_2553018 ?auto_2553023 ) ) ( HOIST-AT ?auto_2553019 ?auto_2553018 ) ( not ( = ?auto_2553020 ?auto_2553019 ) ) ( AVAILABLE ?auto_2553019 ) ( SURFACE-AT ?auto_2553017 ?auto_2553018 ) ( ON ?auto_2553017 ?auto_2553022 ) ( CLEAR ?auto_2553017 ) ( not ( = ?auto_2553016 ?auto_2553022 ) ) ( not ( = ?auto_2553017 ?auto_2553022 ) ) ( not ( = ?auto_2553015 ?auto_2553022 ) ) ( TRUCK-AT ?auto_2553021 ?auto_2553023 ) ( ON ?auto_2553007 ?auto_2553006 ) ( ON ?auto_2553008 ?auto_2553007 ) ( ON ?auto_2553009 ?auto_2553008 ) ( ON ?auto_2553010 ?auto_2553009 ) ( ON ?auto_2553011 ?auto_2553010 ) ( ON ?auto_2553012 ?auto_2553011 ) ( ON ?auto_2553013 ?auto_2553012 ) ( ON ?auto_2553014 ?auto_2553013 ) ( ON ?auto_2553015 ?auto_2553014 ) ( not ( = ?auto_2553006 ?auto_2553007 ) ) ( not ( = ?auto_2553006 ?auto_2553008 ) ) ( not ( = ?auto_2553006 ?auto_2553009 ) ) ( not ( = ?auto_2553006 ?auto_2553010 ) ) ( not ( = ?auto_2553006 ?auto_2553011 ) ) ( not ( = ?auto_2553006 ?auto_2553012 ) ) ( not ( = ?auto_2553006 ?auto_2553013 ) ) ( not ( = ?auto_2553006 ?auto_2553014 ) ) ( not ( = ?auto_2553006 ?auto_2553015 ) ) ( not ( = ?auto_2553006 ?auto_2553016 ) ) ( not ( = ?auto_2553006 ?auto_2553017 ) ) ( not ( = ?auto_2553006 ?auto_2553022 ) ) ( not ( = ?auto_2553007 ?auto_2553008 ) ) ( not ( = ?auto_2553007 ?auto_2553009 ) ) ( not ( = ?auto_2553007 ?auto_2553010 ) ) ( not ( = ?auto_2553007 ?auto_2553011 ) ) ( not ( = ?auto_2553007 ?auto_2553012 ) ) ( not ( = ?auto_2553007 ?auto_2553013 ) ) ( not ( = ?auto_2553007 ?auto_2553014 ) ) ( not ( = ?auto_2553007 ?auto_2553015 ) ) ( not ( = ?auto_2553007 ?auto_2553016 ) ) ( not ( = ?auto_2553007 ?auto_2553017 ) ) ( not ( = ?auto_2553007 ?auto_2553022 ) ) ( not ( = ?auto_2553008 ?auto_2553009 ) ) ( not ( = ?auto_2553008 ?auto_2553010 ) ) ( not ( = ?auto_2553008 ?auto_2553011 ) ) ( not ( = ?auto_2553008 ?auto_2553012 ) ) ( not ( = ?auto_2553008 ?auto_2553013 ) ) ( not ( = ?auto_2553008 ?auto_2553014 ) ) ( not ( = ?auto_2553008 ?auto_2553015 ) ) ( not ( = ?auto_2553008 ?auto_2553016 ) ) ( not ( = ?auto_2553008 ?auto_2553017 ) ) ( not ( = ?auto_2553008 ?auto_2553022 ) ) ( not ( = ?auto_2553009 ?auto_2553010 ) ) ( not ( = ?auto_2553009 ?auto_2553011 ) ) ( not ( = ?auto_2553009 ?auto_2553012 ) ) ( not ( = ?auto_2553009 ?auto_2553013 ) ) ( not ( = ?auto_2553009 ?auto_2553014 ) ) ( not ( = ?auto_2553009 ?auto_2553015 ) ) ( not ( = ?auto_2553009 ?auto_2553016 ) ) ( not ( = ?auto_2553009 ?auto_2553017 ) ) ( not ( = ?auto_2553009 ?auto_2553022 ) ) ( not ( = ?auto_2553010 ?auto_2553011 ) ) ( not ( = ?auto_2553010 ?auto_2553012 ) ) ( not ( = ?auto_2553010 ?auto_2553013 ) ) ( not ( = ?auto_2553010 ?auto_2553014 ) ) ( not ( = ?auto_2553010 ?auto_2553015 ) ) ( not ( = ?auto_2553010 ?auto_2553016 ) ) ( not ( = ?auto_2553010 ?auto_2553017 ) ) ( not ( = ?auto_2553010 ?auto_2553022 ) ) ( not ( = ?auto_2553011 ?auto_2553012 ) ) ( not ( = ?auto_2553011 ?auto_2553013 ) ) ( not ( = ?auto_2553011 ?auto_2553014 ) ) ( not ( = ?auto_2553011 ?auto_2553015 ) ) ( not ( = ?auto_2553011 ?auto_2553016 ) ) ( not ( = ?auto_2553011 ?auto_2553017 ) ) ( not ( = ?auto_2553011 ?auto_2553022 ) ) ( not ( = ?auto_2553012 ?auto_2553013 ) ) ( not ( = ?auto_2553012 ?auto_2553014 ) ) ( not ( = ?auto_2553012 ?auto_2553015 ) ) ( not ( = ?auto_2553012 ?auto_2553016 ) ) ( not ( = ?auto_2553012 ?auto_2553017 ) ) ( not ( = ?auto_2553012 ?auto_2553022 ) ) ( not ( = ?auto_2553013 ?auto_2553014 ) ) ( not ( = ?auto_2553013 ?auto_2553015 ) ) ( not ( = ?auto_2553013 ?auto_2553016 ) ) ( not ( = ?auto_2553013 ?auto_2553017 ) ) ( not ( = ?auto_2553013 ?auto_2553022 ) ) ( not ( = ?auto_2553014 ?auto_2553015 ) ) ( not ( = ?auto_2553014 ?auto_2553016 ) ) ( not ( = ?auto_2553014 ?auto_2553017 ) ) ( not ( = ?auto_2553014 ?auto_2553022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553015 ?auto_2553016 ?auto_2553017 )
      ( MAKE-11CRATE-VERIFY ?auto_2553006 ?auto_2553007 ?auto_2553008 ?auto_2553009 ?auto_2553010 ?auto_2553011 ?auto_2553012 ?auto_2553013 ?auto_2553014 ?auto_2553015 ?auto_2553016 ?auto_2553017 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553150 - SURFACE
      ?auto_2553151 - SURFACE
      ?auto_2553152 - SURFACE
      ?auto_2553153 - SURFACE
      ?auto_2553154 - SURFACE
      ?auto_2553155 - SURFACE
      ?auto_2553156 - SURFACE
      ?auto_2553157 - SURFACE
      ?auto_2553158 - SURFACE
      ?auto_2553159 - SURFACE
      ?auto_2553160 - SURFACE
      ?auto_2553161 - SURFACE
    )
    :vars
    (
      ?auto_2553167 - HOIST
      ?auto_2553165 - PLACE
      ?auto_2553166 - PLACE
      ?auto_2553162 - HOIST
      ?auto_2553164 - SURFACE
      ?auto_2553163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553167 ?auto_2553165 ) ( IS-CRATE ?auto_2553161 ) ( not ( = ?auto_2553160 ?auto_2553161 ) ) ( not ( = ?auto_2553159 ?auto_2553160 ) ) ( not ( = ?auto_2553159 ?auto_2553161 ) ) ( not ( = ?auto_2553166 ?auto_2553165 ) ) ( HOIST-AT ?auto_2553162 ?auto_2553166 ) ( not ( = ?auto_2553167 ?auto_2553162 ) ) ( AVAILABLE ?auto_2553162 ) ( SURFACE-AT ?auto_2553161 ?auto_2553166 ) ( ON ?auto_2553161 ?auto_2553164 ) ( CLEAR ?auto_2553161 ) ( not ( = ?auto_2553160 ?auto_2553164 ) ) ( not ( = ?auto_2553161 ?auto_2553164 ) ) ( not ( = ?auto_2553159 ?auto_2553164 ) ) ( TRUCK-AT ?auto_2553163 ?auto_2553165 ) ( SURFACE-AT ?auto_2553159 ?auto_2553165 ) ( CLEAR ?auto_2553159 ) ( LIFTING ?auto_2553167 ?auto_2553160 ) ( IS-CRATE ?auto_2553160 ) ( ON ?auto_2553151 ?auto_2553150 ) ( ON ?auto_2553152 ?auto_2553151 ) ( ON ?auto_2553153 ?auto_2553152 ) ( ON ?auto_2553154 ?auto_2553153 ) ( ON ?auto_2553155 ?auto_2553154 ) ( ON ?auto_2553156 ?auto_2553155 ) ( ON ?auto_2553157 ?auto_2553156 ) ( ON ?auto_2553158 ?auto_2553157 ) ( ON ?auto_2553159 ?auto_2553158 ) ( not ( = ?auto_2553150 ?auto_2553151 ) ) ( not ( = ?auto_2553150 ?auto_2553152 ) ) ( not ( = ?auto_2553150 ?auto_2553153 ) ) ( not ( = ?auto_2553150 ?auto_2553154 ) ) ( not ( = ?auto_2553150 ?auto_2553155 ) ) ( not ( = ?auto_2553150 ?auto_2553156 ) ) ( not ( = ?auto_2553150 ?auto_2553157 ) ) ( not ( = ?auto_2553150 ?auto_2553158 ) ) ( not ( = ?auto_2553150 ?auto_2553159 ) ) ( not ( = ?auto_2553150 ?auto_2553160 ) ) ( not ( = ?auto_2553150 ?auto_2553161 ) ) ( not ( = ?auto_2553150 ?auto_2553164 ) ) ( not ( = ?auto_2553151 ?auto_2553152 ) ) ( not ( = ?auto_2553151 ?auto_2553153 ) ) ( not ( = ?auto_2553151 ?auto_2553154 ) ) ( not ( = ?auto_2553151 ?auto_2553155 ) ) ( not ( = ?auto_2553151 ?auto_2553156 ) ) ( not ( = ?auto_2553151 ?auto_2553157 ) ) ( not ( = ?auto_2553151 ?auto_2553158 ) ) ( not ( = ?auto_2553151 ?auto_2553159 ) ) ( not ( = ?auto_2553151 ?auto_2553160 ) ) ( not ( = ?auto_2553151 ?auto_2553161 ) ) ( not ( = ?auto_2553151 ?auto_2553164 ) ) ( not ( = ?auto_2553152 ?auto_2553153 ) ) ( not ( = ?auto_2553152 ?auto_2553154 ) ) ( not ( = ?auto_2553152 ?auto_2553155 ) ) ( not ( = ?auto_2553152 ?auto_2553156 ) ) ( not ( = ?auto_2553152 ?auto_2553157 ) ) ( not ( = ?auto_2553152 ?auto_2553158 ) ) ( not ( = ?auto_2553152 ?auto_2553159 ) ) ( not ( = ?auto_2553152 ?auto_2553160 ) ) ( not ( = ?auto_2553152 ?auto_2553161 ) ) ( not ( = ?auto_2553152 ?auto_2553164 ) ) ( not ( = ?auto_2553153 ?auto_2553154 ) ) ( not ( = ?auto_2553153 ?auto_2553155 ) ) ( not ( = ?auto_2553153 ?auto_2553156 ) ) ( not ( = ?auto_2553153 ?auto_2553157 ) ) ( not ( = ?auto_2553153 ?auto_2553158 ) ) ( not ( = ?auto_2553153 ?auto_2553159 ) ) ( not ( = ?auto_2553153 ?auto_2553160 ) ) ( not ( = ?auto_2553153 ?auto_2553161 ) ) ( not ( = ?auto_2553153 ?auto_2553164 ) ) ( not ( = ?auto_2553154 ?auto_2553155 ) ) ( not ( = ?auto_2553154 ?auto_2553156 ) ) ( not ( = ?auto_2553154 ?auto_2553157 ) ) ( not ( = ?auto_2553154 ?auto_2553158 ) ) ( not ( = ?auto_2553154 ?auto_2553159 ) ) ( not ( = ?auto_2553154 ?auto_2553160 ) ) ( not ( = ?auto_2553154 ?auto_2553161 ) ) ( not ( = ?auto_2553154 ?auto_2553164 ) ) ( not ( = ?auto_2553155 ?auto_2553156 ) ) ( not ( = ?auto_2553155 ?auto_2553157 ) ) ( not ( = ?auto_2553155 ?auto_2553158 ) ) ( not ( = ?auto_2553155 ?auto_2553159 ) ) ( not ( = ?auto_2553155 ?auto_2553160 ) ) ( not ( = ?auto_2553155 ?auto_2553161 ) ) ( not ( = ?auto_2553155 ?auto_2553164 ) ) ( not ( = ?auto_2553156 ?auto_2553157 ) ) ( not ( = ?auto_2553156 ?auto_2553158 ) ) ( not ( = ?auto_2553156 ?auto_2553159 ) ) ( not ( = ?auto_2553156 ?auto_2553160 ) ) ( not ( = ?auto_2553156 ?auto_2553161 ) ) ( not ( = ?auto_2553156 ?auto_2553164 ) ) ( not ( = ?auto_2553157 ?auto_2553158 ) ) ( not ( = ?auto_2553157 ?auto_2553159 ) ) ( not ( = ?auto_2553157 ?auto_2553160 ) ) ( not ( = ?auto_2553157 ?auto_2553161 ) ) ( not ( = ?auto_2553157 ?auto_2553164 ) ) ( not ( = ?auto_2553158 ?auto_2553159 ) ) ( not ( = ?auto_2553158 ?auto_2553160 ) ) ( not ( = ?auto_2553158 ?auto_2553161 ) ) ( not ( = ?auto_2553158 ?auto_2553164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553159 ?auto_2553160 ?auto_2553161 )
      ( MAKE-11CRATE-VERIFY ?auto_2553150 ?auto_2553151 ?auto_2553152 ?auto_2553153 ?auto_2553154 ?auto_2553155 ?auto_2553156 ?auto_2553157 ?auto_2553158 ?auto_2553159 ?auto_2553160 ?auto_2553161 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2553294 - SURFACE
      ?auto_2553295 - SURFACE
      ?auto_2553296 - SURFACE
      ?auto_2553297 - SURFACE
      ?auto_2553298 - SURFACE
      ?auto_2553299 - SURFACE
      ?auto_2553300 - SURFACE
      ?auto_2553301 - SURFACE
      ?auto_2553302 - SURFACE
      ?auto_2553303 - SURFACE
      ?auto_2553304 - SURFACE
      ?auto_2553305 - SURFACE
    )
    :vars
    (
      ?auto_2553307 - HOIST
      ?auto_2553308 - PLACE
      ?auto_2553311 - PLACE
      ?auto_2553310 - HOIST
      ?auto_2553306 - SURFACE
      ?auto_2553309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2553307 ?auto_2553308 ) ( IS-CRATE ?auto_2553305 ) ( not ( = ?auto_2553304 ?auto_2553305 ) ) ( not ( = ?auto_2553303 ?auto_2553304 ) ) ( not ( = ?auto_2553303 ?auto_2553305 ) ) ( not ( = ?auto_2553311 ?auto_2553308 ) ) ( HOIST-AT ?auto_2553310 ?auto_2553311 ) ( not ( = ?auto_2553307 ?auto_2553310 ) ) ( AVAILABLE ?auto_2553310 ) ( SURFACE-AT ?auto_2553305 ?auto_2553311 ) ( ON ?auto_2553305 ?auto_2553306 ) ( CLEAR ?auto_2553305 ) ( not ( = ?auto_2553304 ?auto_2553306 ) ) ( not ( = ?auto_2553305 ?auto_2553306 ) ) ( not ( = ?auto_2553303 ?auto_2553306 ) ) ( TRUCK-AT ?auto_2553309 ?auto_2553308 ) ( SURFACE-AT ?auto_2553303 ?auto_2553308 ) ( CLEAR ?auto_2553303 ) ( IS-CRATE ?auto_2553304 ) ( AVAILABLE ?auto_2553307 ) ( IN ?auto_2553304 ?auto_2553309 ) ( ON ?auto_2553295 ?auto_2553294 ) ( ON ?auto_2553296 ?auto_2553295 ) ( ON ?auto_2553297 ?auto_2553296 ) ( ON ?auto_2553298 ?auto_2553297 ) ( ON ?auto_2553299 ?auto_2553298 ) ( ON ?auto_2553300 ?auto_2553299 ) ( ON ?auto_2553301 ?auto_2553300 ) ( ON ?auto_2553302 ?auto_2553301 ) ( ON ?auto_2553303 ?auto_2553302 ) ( not ( = ?auto_2553294 ?auto_2553295 ) ) ( not ( = ?auto_2553294 ?auto_2553296 ) ) ( not ( = ?auto_2553294 ?auto_2553297 ) ) ( not ( = ?auto_2553294 ?auto_2553298 ) ) ( not ( = ?auto_2553294 ?auto_2553299 ) ) ( not ( = ?auto_2553294 ?auto_2553300 ) ) ( not ( = ?auto_2553294 ?auto_2553301 ) ) ( not ( = ?auto_2553294 ?auto_2553302 ) ) ( not ( = ?auto_2553294 ?auto_2553303 ) ) ( not ( = ?auto_2553294 ?auto_2553304 ) ) ( not ( = ?auto_2553294 ?auto_2553305 ) ) ( not ( = ?auto_2553294 ?auto_2553306 ) ) ( not ( = ?auto_2553295 ?auto_2553296 ) ) ( not ( = ?auto_2553295 ?auto_2553297 ) ) ( not ( = ?auto_2553295 ?auto_2553298 ) ) ( not ( = ?auto_2553295 ?auto_2553299 ) ) ( not ( = ?auto_2553295 ?auto_2553300 ) ) ( not ( = ?auto_2553295 ?auto_2553301 ) ) ( not ( = ?auto_2553295 ?auto_2553302 ) ) ( not ( = ?auto_2553295 ?auto_2553303 ) ) ( not ( = ?auto_2553295 ?auto_2553304 ) ) ( not ( = ?auto_2553295 ?auto_2553305 ) ) ( not ( = ?auto_2553295 ?auto_2553306 ) ) ( not ( = ?auto_2553296 ?auto_2553297 ) ) ( not ( = ?auto_2553296 ?auto_2553298 ) ) ( not ( = ?auto_2553296 ?auto_2553299 ) ) ( not ( = ?auto_2553296 ?auto_2553300 ) ) ( not ( = ?auto_2553296 ?auto_2553301 ) ) ( not ( = ?auto_2553296 ?auto_2553302 ) ) ( not ( = ?auto_2553296 ?auto_2553303 ) ) ( not ( = ?auto_2553296 ?auto_2553304 ) ) ( not ( = ?auto_2553296 ?auto_2553305 ) ) ( not ( = ?auto_2553296 ?auto_2553306 ) ) ( not ( = ?auto_2553297 ?auto_2553298 ) ) ( not ( = ?auto_2553297 ?auto_2553299 ) ) ( not ( = ?auto_2553297 ?auto_2553300 ) ) ( not ( = ?auto_2553297 ?auto_2553301 ) ) ( not ( = ?auto_2553297 ?auto_2553302 ) ) ( not ( = ?auto_2553297 ?auto_2553303 ) ) ( not ( = ?auto_2553297 ?auto_2553304 ) ) ( not ( = ?auto_2553297 ?auto_2553305 ) ) ( not ( = ?auto_2553297 ?auto_2553306 ) ) ( not ( = ?auto_2553298 ?auto_2553299 ) ) ( not ( = ?auto_2553298 ?auto_2553300 ) ) ( not ( = ?auto_2553298 ?auto_2553301 ) ) ( not ( = ?auto_2553298 ?auto_2553302 ) ) ( not ( = ?auto_2553298 ?auto_2553303 ) ) ( not ( = ?auto_2553298 ?auto_2553304 ) ) ( not ( = ?auto_2553298 ?auto_2553305 ) ) ( not ( = ?auto_2553298 ?auto_2553306 ) ) ( not ( = ?auto_2553299 ?auto_2553300 ) ) ( not ( = ?auto_2553299 ?auto_2553301 ) ) ( not ( = ?auto_2553299 ?auto_2553302 ) ) ( not ( = ?auto_2553299 ?auto_2553303 ) ) ( not ( = ?auto_2553299 ?auto_2553304 ) ) ( not ( = ?auto_2553299 ?auto_2553305 ) ) ( not ( = ?auto_2553299 ?auto_2553306 ) ) ( not ( = ?auto_2553300 ?auto_2553301 ) ) ( not ( = ?auto_2553300 ?auto_2553302 ) ) ( not ( = ?auto_2553300 ?auto_2553303 ) ) ( not ( = ?auto_2553300 ?auto_2553304 ) ) ( not ( = ?auto_2553300 ?auto_2553305 ) ) ( not ( = ?auto_2553300 ?auto_2553306 ) ) ( not ( = ?auto_2553301 ?auto_2553302 ) ) ( not ( = ?auto_2553301 ?auto_2553303 ) ) ( not ( = ?auto_2553301 ?auto_2553304 ) ) ( not ( = ?auto_2553301 ?auto_2553305 ) ) ( not ( = ?auto_2553301 ?auto_2553306 ) ) ( not ( = ?auto_2553302 ?auto_2553303 ) ) ( not ( = ?auto_2553302 ?auto_2553304 ) ) ( not ( = ?auto_2553302 ?auto_2553305 ) ) ( not ( = ?auto_2553302 ?auto_2553306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2553303 ?auto_2553304 ?auto_2553305 )
      ( MAKE-11CRATE-VERIFY ?auto_2553294 ?auto_2553295 ?auto_2553296 ?auto_2553297 ?auto_2553298 ?auto_2553299 ?auto_2553300 ?auto_2553301 ?auto_2553302 ?auto_2553303 ?auto_2553304 ?auto_2553305 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2562569 - SURFACE
      ?auto_2562570 - SURFACE
      ?auto_2562571 - SURFACE
      ?auto_2562572 - SURFACE
      ?auto_2562573 - SURFACE
      ?auto_2562574 - SURFACE
      ?auto_2562575 - SURFACE
      ?auto_2562576 - SURFACE
      ?auto_2562577 - SURFACE
      ?auto_2562578 - SURFACE
      ?auto_2562579 - SURFACE
      ?auto_2562580 - SURFACE
      ?auto_2562581 - SURFACE
    )
    :vars
    (
      ?auto_2562583 - HOIST
      ?auto_2562582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562583 ?auto_2562582 ) ( SURFACE-AT ?auto_2562580 ?auto_2562582 ) ( CLEAR ?auto_2562580 ) ( LIFTING ?auto_2562583 ?auto_2562581 ) ( IS-CRATE ?auto_2562581 ) ( not ( = ?auto_2562580 ?auto_2562581 ) ) ( ON ?auto_2562570 ?auto_2562569 ) ( ON ?auto_2562571 ?auto_2562570 ) ( ON ?auto_2562572 ?auto_2562571 ) ( ON ?auto_2562573 ?auto_2562572 ) ( ON ?auto_2562574 ?auto_2562573 ) ( ON ?auto_2562575 ?auto_2562574 ) ( ON ?auto_2562576 ?auto_2562575 ) ( ON ?auto_2562577 ?auto_2562576 ) ( ON ?auto_2562578 ?auto_2562577 ) ( ON ?auto_2562579 ?auto_2562578 ) ( ON ?auto_2562580 ?auto_2562579 ) ( not ( = ?auto_2562569 ?auto_2562570 ) ) ( not ( = ?auto_2562569 ?auto_2562571 ) ) ( not ( = ?auto_2562569 ?auto_2562572 ) ) ( not ( = ?auto_2562569 ?auto_2562573 ) ) ( not ( = ?auto_2562569 ?auto_2562574 ) ) ( not ( = ?auto_2562569 ?auto_2562575 ) ) ( not ( = ?auto_2562569 ?auto_2562576 ) ) ( not ( = ?auto_2562569 ?auto_2562577 ) ) ( not ( = ?auto_2562569 ?auto_2562578 ) ) ( not ( = ?auto_2562569 ?auto_2562579 ) ) ( not ( = ?auto_2562569 ?auto_2562580 ) ) ( not ( = ?auto_2562569 ?auto_2562581 ) ) ( not ( = ?auto_2562570 ?auto_2562571 ) ) ( not ( = ?auto_2562570 ?auto_2562572 ) ) ( not ( = ?auto_2562570 ?auto_2562573 ) ) ( not ( = ?auto_2562570 ?auto_2562574 ) ) ( not ( = ?auto_2562570 ?auto_2562575 ) ) ( not ( = ?auto_2562570 ?auto_2562576 ) ) ( not ( = ?auto_2562570 ?auto_2562577 ) ) ( not ( = ?auto_2562570 ?auto_2562578 ) ) ( not ( = ?auto_2562570 ?auto_2562579 ) ) ( not ( = ?auto_2562570 ?auto_2562580 ) ) ( not ( = ?auto_2562570 ?auto_2562581 ) ) ( not ( = ?auto_2562571 ?auto_2562572 ) ) ( not ( = ?auto_2562571 ?auto_2562573 ) ) ( not ( = ?auto_2562571 ?auto_2562574 ) ) ( not ( = ?auto_2562571 ?auto_2562575 ) ) ( not ( = ?auto_2562571 ?auto_2562576 ) ) ( not ( = ?auto_2562571 ?auto_2562577 ) ) ( not ( = ?auto_2562571 ?auto_2562578 ) ) ( not ( = ?auto_2562571 ?auto_2562579 ) ) ( not ( = ?auto_2562571 ?auto_2562580 ) ) ( not ( = ?auto_2562571 ?auto_2562581 ) ) ( not ( = ?auto_2562572 ?auto_2562573 ) ) ( not ( = ?auto_2562572 ?auto_2562574 ) ) ( not ( = ?auto_2562572 ?auto_2562575 ) ) ( not ( = ?auto_2562572 ?auto_2562576 ) ) ( not ( = ?auto_2562572 ?auto_2562577 ) ) ( not ( = ?auto_2562572 ?auto_2562578 ) ) ( not ( = ?auto_2562572 ?auto_2562579 ) ) ( not ( = ?auto_2562572 ?auto_2562580 ) ) ( not ( = ?auto_2562572 ?auto_2562581 ) ) ( not ( = ?auto_2562573 ?auto_2562574 ) ) ( not ( = ?auto_2562573 ?auto_2562575 ) ) ( not ( = ?auto_2562573 ?auto_2562576 ) ) ( not ( = ?auto_2562573 ?auto_2562577 ) ) ( not ( = ?auto_2562573 ?auto_2562578 ) ) ( not ( = ?auto_2562573 ?auto_2562579 ) ) ( not ( = ?auto_2562573 ?auto_2562580 ) ) ( not ( = ?auto_2562573 ?auto_2562581 ) ) ( not ( = ?auto_2562574 ?auto_2562575 ) ) ( not ( = ?auto_2562574 ?auto_2562576 ) ) ( not ( = ?auto_2562574 ?auto_2562577 ) ) ( not ( = ?auto_2562574 ?auto_2562578 ) ) ( not ( = ?auto_2562574 ?auto_2562579 ) ) ( not ( = ?auto_2562574 ?auto_2562580 ) ) ( not ( = ?auto_2562574 ?auto_2562581 ) ) ( not ( = ?auto_2562575 ?auto_2562576 ) ) ( not ( = ?auto_2562575 ?auto_2562577 ) ) ( not ( = ?auto_2562575 ?auto_2562578 ) ) ( not ( = ?auto_2562575 ?auto_2562579 ) ) ( not ( = ?auto_2562575 ?auto_2562580 ) ) ( not ( = ?auto_2562575 ?auto_2562581 ) ) ( not ( = ?auto_2562576 ?auto_2562577 ) ) ( not ( = ?auto_2562576 ?auto_2562578 ) ) ( not ( = ?auto_2562576 ?auto_2562579 ) ) ( not ( = ?auto_2562576 ?auto_2562580 ) ) ( not ( = ?auto_2562576 ?auto_2562581 ) ) ( not ( = ?auto_2562577 ?auto_2562578 ) ) ( not ( = ?auto_2562577 ?auto_2562579 ) ) ( not ( = ?auto_2562577 ?auto_2562580 ) ) ( not ( = ?auto_2562577 ?auto_2562581 ) ) ( not ( = ?auto_2562578 ?auto_2562579 ) ) ( not ( = ?auto_2562578 ?auto_2562580 ) ) ( not ( = ?auto_2562578 ?auto_2562581 ) ) ( not ( = ?auto_2562579 ?auto_2562580 ) ) ( not ( = ?auto_2562579 ?auto_2562581 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2562580 ?auto_2562581 )
      ( MAKE-12CRATE-VERIFY ?auto_2562569 ?auto_2562570 ?auto_2562571 ?auto_2562572 ?auto_2562573 ?auto_2562574 ?auto_2562575 ?auto_2562576 ?auto_2562577 ?auto_2562578 ?auto_2562579 ?auto_2562580 ?auto_2562581 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2562694 - SURFACE
      ?auto_2562695 - SURFACE
      ?auto_2562696 - SURFACE
      ?auto_2562697 - SURFACE
      ?auto_2562698 - SURFACE
      ?auto_2562699 - SURFACE
      ?auto_2562700 - SURFACE
      ?auto_2562701 - SURFACE
      ?auto_2562702 - SURFACE
      ?auto_2562703 - SURFACE
      ?auto_2562704 - SURFACE
      ?auto_2562705 - SURFACE
      ?auto_2562706 - SURFACE
    )
    :vars
    (
      ?auto_2562709 - HOIST
      ?auto_2562707 - PLACE
      ?auto_2562708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562709 ?auto_2562707 ) ( SURFACE-AT ?auto_2562705 ?auto_2562707 ) ( CLEAR ?auto_2562705 ) ( IS-CRATE ?auto_2562706 ) ( not ( = ?auto_2562705 ?auto_2562706 ) ) ( TRUCK-AT ?auto_2562708 ?auto_2562707 ) ( AVAILABLE ?auto_2562709 ) ( IN ?auto_2562706 ?auto_2562708 ) ( ON ?auto_2562705 ?auto_2562704 ) ( not ( = ?auto_2562704 ?auto_2562705 ) ) ( not ( = ?auto_2562704 ?auto_2562706 ) ) ( ON ?auto_2562695 ?auto_2562694 ) ( ON ?auto_2562696 ?auto_2562695 ) ( ON ?auto_2562697 ?auto_2562696 ) ( ON ?auto_2562698 ?auto_2562697 ) ( ON ?auto_2562699 ?auto_2562698 ) ( ON ?auto_2562700 ?auto_2562699 ) ( ON ?auto_2562701 ?auto_2562700 ) ( ON ?auto_2562702 ?auto_2562701 ) ( ON ?auto_2562703 ?auto_2562702 ) ( ON ?auto_2562704 ?auto_2562703 ) ( not ( = ?auto_2562694 ?auto_2562695 ) ) ( not ( = ?auto_2562694 ?auto_2562696 ) ) ( not ( = ?auto_2562694 ?auto_2562697 ) ) ( not ( = ?auto_2562694 ?auto_2562698 ) ) ( not ( = ?auto_2562694 ?auto_2562699 ) ) ( not ( = ?auto_2562694 ?auto_2562700 ) ) ( not ( = ?auto_2562694 ?auto_2562701 ) ) ( not ( = ?auto_2562694 ?auto_2562702 ) ) ( not ( = ?auto_2562694 ?auto_2562703 ) ) ( not ( = ?auto_2562694 ?auto_2562704 ) ) ( not ( = ?auto_2562694 ?auto_2562705 ) ) ( not ( = ?auto_2562694 ?auto_2562706 ) ) ( not ( = ?auto_2562695 ?auto_2562696 ) ) ( not ( = ?auto_2562695 ?auto_2562697 ) ) ( not ( = ?auto_2562695 ?auto_2562698 ) ) ( not ( = ?auto_2562695 ?auto_2562699 ) ) ( not ( = ?auto_2562695 ?auto_2562700 ) ) ( not ( = ?auto_2562695 ?auto_2562701 ) ) ( not ( = ?auto_2562695 ?auto_2562702 ) ) ( not ( = ?auto_2562695 ?auto_2562703 ) ) ( not ( = ?auto_2562695 ?auto_2562704 ) ) ( not ( = ?auto_2562695 ?auto_2562705 ) ) ( not ( = ?auto_2562695 ?auto_2562706 ) ) ( not ( = ?auto_2562696 ?auto_2562697 ) ) ( not ( = ?auto_2562696 ?auto_2562698 ) ) ( not ( = ?auto_2562696 ?auto_2562699 ) ) ( not ( = ?auto_2562696 ?auto_2562700 ) ) ( not ( = ?auto_2562696 ?auto_2562701 ) ) ( not ( = ?auto_2562696 ?auto_2562702 ) ) ( not ( = ?auto_2562696 ?auto_2562703 ) ) ( not ( = ?auto_2562696 ?auto_2562704 ) ) ( not ( = ?auto_2562696 ?auto_2562705 ) ) ( not ( = ?auto_2562696 ?auto_2562706 ) ) ( not ( = ?auto_2562697 ?auto_2562698 ) ) ( not ( = ?auto_2562697 ?auto_2562699 ) ) ( not ( = ?auto_2562697 ?auto_2562700 ) ) ( not ( = ?auto_2562697 ?auto_2562701 ) ) ( not ( = ?auto_2562697 ?auto_2562702 ) ) ( not ( = ?auto_2562697 ?auto_2562703 ) ) ( not ( = ?auto_2562697 ?auto_2562704 ) ) ( not ( = ?auto_2562697 ?auto_2562705 ) ) ( not ( = ?auto_2562697 ?auto_2562706 ) ) ( not ( = ?auto_2562698 ?auto_2562699 ) ) ( not ( = ?auto_2562698 ?auto_2562700 ) ) ( not ( = ?auto_2562698 ?auto_2562701 ) ) ( not ( = ?auto_2562698 ?auto_2562702 ) ) ( not ( = ?auto_2562698 ?auto_2562703 ) ) ( not ( = ?auto_2562698 ?auto_2562704 ) ) ( not ( = ?auto_2562698 ?auto_2562705 ) ) ( not ( = ?auto_2562698 ?auto_2562706 ) ) ( not ( = ?auto_2562699 ?auto_2562700 ) ) ( not ( = ?auto_2562699 ?auto_2562701 ) ) ( not ( = ?auto_2562699 ?auto_2562702 ) ) ( not ( = ?auto_2562699 ?auto_2562703 ) ) ( not ( = ?auto_2562699 ?auto_2562704 ) ) ( not ( = ?auto_2562699 ?auto_2562705 ) ) ( not ( = ?auto_2562699 ?auto_2562706 ) ) ( not ( = ?auto_2562700 ?auto_2562701 ) ) ( not ( = ?auto_2562700 ?auto_2562702 ) ) ( not ( = ?auto_2562700 ?auto_2562703 ) ) ( not ( = ?auto_2562700 ?auto_2562704 ) ) ( not ( = ?auto_2562700 ?auto_2562705 ) ) ( not ( = ?auto_2562700 ?auto_2562706 ) ) ( not ( = ?auto_2562701 ?auto_2562702 ) ) ( not ( = ?auto_2562701 ?auto_2562703 ) ) ( not ( = ?auto_2562701 ?auto_2562704 ) ) ( not ( = ?auto_2562701 ?auto_2562705 ) ) ( not ( = ?auto_2562701 ?auto_2562706 ) ) ( not ( = ?auto_2562702 ?auto_2562703 ) ) ( not ( = ?auto_2562702 ?auto_2562704 ) ) ( not ( = ?auto_2562702 ?auto_2562705 ) ) ( not ( = ?auto_2562702 ?auto_2562706 ) ) ( not ( = ?auto_2562703 ?auto_2562704 ) ) ( not ( = ?auto_2562703 ?auto_2562705 ) ) ( not ( = ?auto_2562703 ?auto_2562706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2562704 ?auto_2562705 ?auto_2562706 )
      ( MAKE-12CRATE-VERIFY ?auto_2562694 ?auto_2562695 ?auto_2562696 ?auto_2562697 ?auto_2562698 ?auto_2562699 ?auto_2562700 ?auto_2562701 ?auto_2562702 ?auto_2562703 ?auto_2562704 ?auto_2562705 ?auto_2562706 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2562832 - SURFACE
      ?auto_2562833 - SURFACE
      ?auto_2562834 - SURFACE
      ?auto_2562835 - SURFACE
      ?auto_2562836 - SURFACE
      ?auto_2562837 - SURFACE
      ?auto_2562838 - SURFACE
      ?auto_2562839 - SURFACE
      ?auto_2562840 - SURFACE
      ?auto_2562841 - SURFACE
      ?auto_2562842 - SURFACE
      ?auto_2562843 - SURFACE
      ?auto_2562844 - SURFACE
    )
    :vars
    (
      ?auto_2562847 - HOIST
      ?auto_2562846 - PLACE
      ?auto_2562848 - TRUCK
      ?auto_2562845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562847 ?auto_2562846 ) ( SURFACE-AT ?auto_2562843 ?auto_2562846 ) ( CLEAR ?auto_2562843 ) ( IS-CRATE ?auto_2562844 ) ( not ( = ?auto_2562843 ?auto_2562844 ) ) ( AVAILABLE ?auto_2562847 ) ( IN ?auto_2562844 ?auto_2562848 ) ( ON ?auto_2562843 ?auto_2562842 ) ( not ( = ?auto_2562842 ?auto_2562843 ) ) ( not ( = ?auto_2562842 ?auto_2562844 ) ) ( TRUCK-AT ?auto_2562848 ?auto_2562845 ) ( not ( = ?auto_2562845 ?auto_2562846 ) ) ( ON ?auto_2562833 ?auto_2562832 ) ( ON ?auto_2562834 ?auto_2562833 ) ( ON ?auto_2562835 ?auto_2562834 ) ( ON ?auto_2562836 ?auto_2562835 ) ( ON ?auto_2562837 ?auto_2562836 ) ( ON ?auto_2562838 ?auto_2562837 ) ( ON ?auto_2562839 ?auto_2562838 ) ( ON ?auto_2562840 ?auto_2562839 ) ( ON ?auto_2562841 ?auto_2562840 ) ( ON ?auto_2562842 ?auto_2562841 ) ( not ( = ?auto_2562832 ?auto_2562833 ) ) ( not ( = ?auto_2562832 ?auto_2562834 ) ) ( not ( = ?auto_2562832 ?auto_2562835 ) ) ( not ( = ?auto_2562832 ?auto_2562836 ) ) ( not ( = ?auto_2562832 ?auto_2562837 ) ) ( not ( = ?auto_2562832 ?auto_2562838 ) ) ( not ( = ?auto_2562832 ?auto_2562839 ) ) ( not ( = ?auto_2562832 ?auto_2562840 ) ) ( not ( = ?auto_2562832 ?auto_2562841 ) ) ( not ( = ?auto_2562832 ?auto_2562842 ) ) ( not ( = ?auto_2562832 ?auto_2562843 ) ) ( not ( = ?auto_2562832 ?auto_2562844 ) ) ( not ( = ?auto_2562833 ?auto_2562834 ) ) ( not ( = ?auto_2562833 ?auto_2562835 ) ) ( not ( = ?auto_2562833 ?auto_2562836 ) ) ( not ( = ?auto_2562833 ?auto_2562837 ) ) ( not ( = ?auto_2562833 ?auto_2562838 ) ) ( not ( = ?auto_2562833 ?auto_2562839 ) ) ( not ( = ?auto_2562833 ?auto_2562840 ) ) ( not ( = ?auto_2562833 ?auto_2562841 ) ) ( not ( = ?auto_2562833 ?auto_2562842 ) ) ( not ( = ?auto_2562833 ?auto_2562843 ) ) ( not ( = ?auto_2562833 ?auto_2562844 ) ) ( not ( = ?auto_2562834 ?auto_2562835 ) ) ( not ( = ?auto_2562834 ?auto_2562836 ) ) ( not ( = ?auto_2562834 ?auto_2562837 ) ) ( not ( = ?auto_2562834 ?auto_2562838 ) ) ( not ( = ?auto_2562834 ?auto_2562839 ) ) ( not ( = ?auto_2562834 ?auto_2562840 ) ) ( not ( = ?auto_2562834 ?auto_2562841 ) ) ( not ( = ?auto_2562834 ?auto_2562842 ) ) ( not ( = ?auto_2562834 ?auto_2562843 ) ) ( not ( = ?auto_2562834 ?auto_2562844 ) ) ( not ( = ?auto_2562835 ?auto_2562836 ) ) ( not ( = ?auto_2562835 ?auto_2562837 ) ) ( not ( = ?auto_2562835 ?auto_2562838 ) ) ( not ( = ?auto_2562835 ?auto_2562839 ) ) ( not ( = ?auto_2562835 ?auto_2562840 ) ) ( not ( = ?auto_2562835 ?auto_2562841 ) ) ( not ( = ?auto_2562835 ?auto_2562842 ) ) ( not ( = ?auto_2562835 ?auto_2562843 ) ) ( not ( = ?auto_2562835 ?auto_2562844 ) ) ( not ( = ?auto_2562836 ?auto_2562837 ) ) ( not ( = ?auto_2562836 ?auto_2562838 ) ) ( not ( = ?auto_2562836 ?auto_2562839 ) ) ( not ( = ?auto_2562836 ?auto_2562840 ) ) ( not ( = ?auto_2562836 ?auto_2562841 ) ) ( not ( = ?auto_2562836 ?auto_2562842 ) ) ( not ( = ?auto_2562836 ?auto_2562843 ) ) ( not ( = ?auto_2562836 ?auto_2562844 ) ) ( not ( = ?auto_2562837 ?auto_2562838 ) ) ( not ( = ?auto_2562837 ?auto_2562839 ) ) ( not ( = ?auto_2562837 ?auto_2562840 ) ) ( not ( = ?auto_2562837 ?auto_2562841 ) ) ( not ( = ?auto_2562837 ?auto_2562842 ) ) ( not ( = ?auto_2562837 ?auto_2562843 ) ) ( not ( = ?auto_2562837 ?auto_2562844 ) ) ( not ( = ?auto_2562838 ?auto_2562839 ) ) ( not ( = ?auto_2562838 ?auto_2562840 ) ) ( not ( = ?auto_2562838 ?auto_2562841 ) ) ( not ( = ?auto_2562838 ?auto_2562842 ) ) ( not ( = ?auto_2562838 ?auto_2562843 ) ) ( not ( = ?auto_2562838 ?auto_2562844 ) ) ( not ( = ?auto_2562839 ?auto_2562840 ) ) ( not ( = ?auto_2562839 ?auto_2562841 ) ) ( not ( = ?auto_2562839 ?auto_2562842 ) ) ( not ( = ?auto_2562839 ?auto_2562843 ) ) ( not ( = ?auto_2562839 ?auto_2562844 ) ) ( not ( = ?auto_2562840 ?auto_2562841 ) ) ( not ( = ?auto_2562840 ?auto_2562842 ) ) ( not ( = ?auto_2562840 ?auto_2562843 ) ) ( not ( = ?auto_2562840 ?auto_2562844 ) ) ( not ( = ?auto_2562841 ?auto_2562842 ) ) ( not ( = ?auto_2562841 ?auto_2562843 ) ) ( not ( = ?auto_2562841 ?auto_2562844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2562842 ?auto_2562843 ?auto_2562844 )
      ( MAKE-12CRATE-VERIFY ?auto_2562832 ?auto_2562833 ?auto_2562834 ?auto_2562835 ?auto_2562836 ?auto_2562837 ?auto_2562838 ?auto_2562839 ?auto_2562840 ?auto_2562841 ?auto_2562842 ?auto_2562843 ?auto_2562844 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2562982 - SURFACE
      ?auto_2562983 - SURFACE
      ?auto_2562984 - SURFACE
      ?auto_2562985 - SURFACE
      ?auto_2562986 - SURFACE
      ?auto_2562987 - SURFACE
      ?auto_2562988 - SURFACE
      ?auto_2562989 - SURFACE
      ?auto_2562990 - SURFACE
      ?auto_2562991 - SURFACE
      ?auto_2562992 - SURFACE
      ?auto_2562993 - SURFACE
      ?auto_2562994 - SURFACE
    )
    :vars
    (
      ?auto_2562996 - HOIST
      ?auto_2562997 - PLACE
      ?auto_2562995 - TRUCK
      ?auto_2562998 - PLACE
      ?auto_2562999 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562996 ?auto_2562997 ) ( SURFACE-AT ?auto_2562993 ?auto_2562997 ) ( CLEAR ?auto_2562993 ) ( IS-CRATE ?auto_2562994 ) ( not ( = ?auto_2562993 ?auto_2562994 ) ) ( AVAILABLE ?auto_2562996 ) ( ON ?auto_2562993 ?auto_2562992 ) ( not ( = ?auto_2562992 ?auto_2562993 ) ) ( not ( = ?auto_2562992 ?auto_2562994 ) ) ( TRUCK-AT ?auto_2562995 ?auto_2562998 ) ( not ( = ?auto_2562998 ?auto_2562997 ) ) ( HOIST-AT ?auto_2562999 ?auto_2562998 ) ( LIFTING ?auto_2562999 ?auto_2562994 ) ( not ( = ?auto_2562996 ?auto_2562999 ) ) ( ON ?auto_2562983 ?auto_2562982 ) ( ON ?auto_2562984 ?auto_2562983 ) ( ON ?auto_2562985 ?auto_2562984 ) ( ON ?auto_2562986 ?auto_2562985 ) ( ON ?auto_2562987 ?auto_2562986 ) ( ON ?auto_2562988 ?auto_2562987 ) ( ON ?auto_2562989 ?auto_2562988 ) ( ON ?auto_2562990 ?auto_2562989 ) ( ON ?auto_2562991 ?auto_2562990 ) ( ON ?auto_2562992 ?auto_2562991 ) ( not ( = ?auto_2562982 ?auto_2562983 ) ) ( not ( = ?auto_2562982 ?auto_2562984 ) ) ( not ( = ?auto_2562982 ?auto_2562985 ) ) ( not ( = ?auto_2562982 ?auto_2562986 ) ) ( not ( = ?auto_2562982 ?auto_2562987 ) ) ( not ( = ?auto_2562982 ?auto_2562988 ) ) ( not ( = ?auto_2562982 ?auto_2562989 ) ) ( not ( = ?auto_2562982 ?auto_2562990 ) ) ( not ( = ?auto_2562982 ?auto_2562991 ) ) ( not ( = ?auto_2562982 ?auto_2562992 ) ) ( not ( = ?auto_2562982 ?auto_2562993 ) ) ( not ( = ?auto_2562982 ?auto_2562994 ) ) ( not ( = ?auto_2562983 ?auto_2562984 ) ) ( not ( = ?auto_2562983 ?auto_2562985 ) ) ( not ( = ?auto_2562983 ?auto_2562986 ) ) ( not ( = ?auto_2562983 ?auto_2562987 ) ) ( not ( = ?auto_2562983 ?auto_2562988 ) ) ( not ( = ?auto_2562983 ?auto_2562989 ) ) ( not ( = ?auto_2562983 ?auto_2562990 ) ) ( not ( = ?auto_2562983 ?auto_2562991 ) ) ( not ( = ?auto_2562983 ?auto_2562992 ) ) ( not ( = ?auto_2562983 ?auto_2562993 ) ) ( not ( = ?auto_2562983 ?auto_2562994 ) ) ( not ( = ?auto_2562984 ?auto_2562985 ) ) ( not ( = ?auto_2562984 ?auto_2562986 ) ) ( not ( = ?auto_2562984 ?auto_2562987 ) ) ( not ( = ?auto_2562984 ?auto_2562988 ) ) ( not ( = ?auto_2562984 ?auto_2562989 ) ) ( not ( = ?auto_2562984 ?auto_2562990 ) ) ( not ( = ?auto_2562984 ?auto_2562991 ) ) ( not ( = ?auto_2562984 ?auto_2562992 ) ) ( not ( = ?auto_2562984 ?auto_2562993 ) ) ( not ( = ?auto_2562984 ?auto_2562994 ) ) ( not ( = ?auto_2562985 ?auto_2562986 ) ) ( not ( = ?auto_2562985 ?auto_2562987 ) ) ( not ( = ?auto_2562985 ?auto_2562988 ) ) ( not ( = ?auto_2562985 ?auto_2562989 ) ) ( not ( = ?auto_2562985 ?auto_2562990 ) ) ( not ( = ?auto_2562985 ?auto_2562991 ) ) ( not ( = ?auto_2562985 ?auto_2562992 ) ) ( not ( = ?auto_2562985 ?auto_2562993 ) ) ( not ( = ?auto_2562985 ?auto_2562994 ) ) ( not ( = ?auto_2562986 ?auto_2562987 ) ) ( not ( = ?auto_2562986 ?auto_2562988 ) ) ( not ( = ?auto_2562986 ?auto_2562989 ) ) ( not ( = ?auto_2562986 ?auto_2562990 ) ) ( not ( = ?auto_2562986 ?auto_2562991 ) ) ( not ( = ?auto_2562986 ?auto_2562992 ) ) ( not ( = ?auto_2562986 ?auto_2562993 ) ) ( not ( = ?auto_2562986 ?auto_2562994 ) ) ( not ( = ?auto_2562987 ?auto_2562988 ) ) ( not ( = ?auto_2562987 ?auto_2562989 ) ) ( not ( = ?auto_2562987 ?auto_2562990 ) ) ( not ( = ?auto_2562987 ?auto_2562991 ) ) ( not ( = ?auto_2562987 ?auto_2562992 ) ) ( not ( = ?auto_2562987 ?auto_2562993 ) ) ( not ( = ?auto_2562987 ?auto_2562994 ) ) ( not ( = ?auto_2562988 ?auto_2562989 ) ) ( not ( = ?auto_2562988 ?auto_2562990 ) ) ( not ( = ?auto_2562988 ?auto_2562991 ) ) ( not ( = ?auto_2562988 ?auto_2562992 ) ) ( not ( = ?auto_2562988 ?auto_2562993 ) ) ( not ( = ?auto_2562988 ?auto_2562994 ) ) ( not ( = ?auto_2562989 ?auto_2562990 ) ) ( not ( = ?auto_2562989 ?auto_2562991 ) ) ( not ( = ?auto_2562989 ?auto_2562992 ) ) ( not ( = ?auto_2562989 ?auto_2562993 ) ) ( not ( = ?auto_2562989 ?auto_2562994 ) ) ( not ( = ?auto_2562990 ?auto_2562991 ) ) ( not ( = ?auto_2562990 ?auto_2562992 ) ) ( not ( = ?auto_2562990 ?auto_2562993 ) ) ( not ( = ?auto_2562990 ?auto_2562994 ) ) ( not ( = ?auto_2562991 ?auto_2562992 ) ) ( not ( = ?auto_2562991 ?auto_2562993 ) ) ( not ( = ?auto_2562991 ?auto_2562994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2562992 ?auto_2562993 ?auto_2562994 )
      ( MAKE-12CRATE-VERIFY ?auto_2562982 ?auto_2562983 ?auto_2562984 ?auto_2562985 ?auto_2562986 ?auto_2562987 ?auto_2562988 ?auto_2562989 ?auto_2562990 ?auto_2562991 ?auto_2562992 ?auto_2562993 ?auto_2562994 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563144 - SURFACE
      ?auto_2563145 - SURFACE
      ?auto_2563146 - SURFACE
      ?auto_2563147 - SURFACE
      ?auto_2563148 - SURFACE
      ?auto_2563149 - SURFACE
      ?auto_2563150 - SURFACE
      ?auto_2563151 - SURFACE
      ?auto_2563152 - SURFACE
      ?auto_2563153 - SURFACE
      ?auto_2563154 - SURFACE
      ?auto_2563155 - SURFACE
      ?auto_2563156 - SURFACE
    )
    :vars
    (
      ?auto_2563161 - HOIST
      ?auto_2563159 - PLACE
      ?auto_2563158 - TRUCK
      ?auto_2563157 - PLACE
      ?auto_2563162 - HOIST
      ?auto_2563160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563161 ?auto_2563159 ) ( SURFACE-AT ?auto_2563155 ?auto_2563159 ) ( CLEAR ?auto_2563155 ) ( IS-CRATE ?auto_2563156 ) ( not ( = ?auto_2563155 ?auto_2563156 ) ) ( AVAILABLE ?auto_2563161 ) ( ON ?auto_2563155 ?auto_2563154 ) ( not ( = ?auto_2563154 ?auto_2563155 ) ) ( not ( = ?auto_2563154 ?auto_2563156 ) ) ( TRUCK-AT ?auto_2563158 ?auto_2563157 ) ( not ( = ?auto_2563157 ?auto_2563159 ) ) ( HOIST-AT ?auto_2563162 ?auto_2563157 ) ( not ( = ?auto_2563161 ?auto_2563162 ) ) ( AVAILABLE ?auto_2563162 ) ( SURFACE-AT ?auto_2563156 ?auto_2563157 ) ( ON ?auto_2563156 ?auto_2563160 ) ( CLEAR ?auto_2563156 ) ( not ( = ?auto_2563155 ?auto_2563160 ) ) ( not ( = ?auto_2563156 ?auto_2563160 ) ) ( not ( = ?auto_2563154 ?auto_2563160 ) ) ( ON ?auto_2563145 ?auto_2563144 ) ( ON ?auto_2563146 ?auto_2563145 ) ( ON ?auto_2563147 ?auto_2563146 ) ( ON ?auto_2563148 ?auto_2563147 ) ( ON ?auto_2563149 ?auto_2563148 ) ( ON ?auto_2563150 ?auto_2563149 ) ( ON ?auto_2563151 ?auto_2563150 ) ( ON ?auto_2563152 ?auto_2563151 ) ( ON ?auto_2563153 ?auto_2563152 ) ( ON ?auto_2563154 ?auto_2563153 ) ( not ( = ?auto_2563144 ?auto_2563145 ) ) ( not ( = ?auto_2563144 ?auto_2563146 ) ) ( not ( = ?auto_2563144 ?auto_2563147 ) ) ( not ( = ?auto_2563144 ?auto_2563148 ) ) ( not ( = ?auto_2563144 ?auto_2563149 ) ) ( not ( = ?auto_2563144 ?auto_2563150 ) ) ( not ( = ?auto_2563144 ?auto_2563151 ) ) ( not ( = ?auto_2563144 ?auto_2563152 ) ) ( not ( = ?auto_2563144 ?auto_2563153 ) ) ( not ( = ?auto_2563144 ?auto_2563154 ) ) ( not ( = ?auto_2563144 ?auto_2563155 ) ) ( not ( = ?auto_2563144 ?auto_2563156 ) ) ( not ( = ?auto_2563144 ?auto_2563160 ) ) ( not ( = ?auto_2563145 ?auto_2563146 ) ) ( not ( = ?auto_2563145 ?auto_2563147 ) ) ( not ( = ?auto_2563145 ?auto_2563148 ) ) ( not ( = ?auto_2563145 ?auto_2563149 ) ) ( not ( = ?auto_2563145 ?auto_2563150 ) ) ( not ( = ?auto_2563145 ?auto_2563151 ) ) ( not ( = ?auto_2563145 ?auto_2563152 ) ) ( not ( = ?auto_2563145 ?auto_2563153 ) ) ( not ( = ?auto_2563145 ?auto_2563154 ) ) ( not ( = ?auto_2563145 ?auto_2563155 ) ) ( not ( = ?auto_2563145 ?auto_2563156 ) ) ( not ( = ?auto_2563145 ?auto_2563160 ) ) ( not ( = ?auto_2563146 ?auto_2563147 ) ) ( not ( = ?auto_2563146 ?auto_2563148 ) ) ( not ( = ?auto_2563146 ?auto_2563149 ) ) ( not ( = ?auto_2563146 ?auto_2563150 ) ) ( not ( = ?auto_2563146 ?auto_2563151 ) ) ( not ( = ?auto_2563146 ?auto_2563152 ) ) ( not ( = ?auto_2563146 ?auto_2563153 ) ) ( not ( = ?auto_2563146 ?auto_2563154 ) ) ( not ( = ?auto_2563146 ?auto_2563155 ) ) ( not ( = ?auto_2563146 ?auto_2563156 ) ) ( not ( = ?auto_2563146 ?auto_2563160 ) ) ( not ( = ?auto_2563147 ?auto_2563148 ) ) ( not ( = ?auto_2563147 ?auto_2563149 ) ) ( not ( = ?auto_2563147 ?auto_2563150 ) ) ( not ( = ?auto_2563147 ?auto_2563151 ) ) ( not ( = ?auto_2563147 ?auto_2563152 ) ) ( not ( = ?auto_2563147 ?auto_2563153 ) ) ( not ( = ?auto_2563147 ?auto_2563154 ) ) ( not ( = ?auto_2563147 ?auto_2563155 ) ) ( not ( = ?auto_2563147 ?auto_2563156 ) ) ( not ( = ?auto_2563147 ?auto_2563160 ) ) ( not ( = ?auto_2563148 ?auto_2563149 ) ) ( not ( = ?auto_2563148 ?auto_2563150 ) ) ( not ( = ?auto_2563148 ?auto_2563151 ) ) ( not ( = ?auto_2563148 ?auto_2563152 ) ) ( not ( = ?auto_2563148 ?auto_2563153 ) ) ( not ( = ?auto_2563148 ?auto_2563154 ) ) ( not ( = ?auto_2563148 ?auto_2563155 ) ) ( not ( = ?auto_2563148 ?auto_2563156 ) ) ( not ( = ?auto_2563148 ?auto_2563160 ) ) ( not ( = ?auto_2563149 ?auto_2563150 ) ) ( not ( = ?auto_2563149 ?auto_2563151 ) ) ( not ( = ?auto_2563149 ?auto_2563152 ) ) ( not ( = ?auto_2563149 ?auto_2563153 ) ) ( not ( = ?auto_2563149 ?auto_2563154 ) ) ( not ( = ?auto_2563149 ?auto_2563155 ) ) ( not ( = ?auto_2563149 ?auto_2563156 ) ) ( not ( = ?auto_2563149 ?auto_2563160 ) ) ( not ( = ?auto_2563150 ?auto_2563151 ) ) ( not ( = ?auto_2563150 ?auto_2563152 ) ) ( not ( = ?auto_2563150 ?auto_2563153 ) ) ( not ( = ?auto_2563150 ?auto_2563154 ) ) ( not ( = ?auto_2563150 ?auto_2563155 ) ) ( not ( = ?auto_2563150 ?auto_2563156 ) ) ( not ( = ?auto_2563150 ?auto_2563160 ) ) ( not ( = ?auto_2563151 ?auto_2563152 ) ) ( not ( = ?auto_2563151 ?auto_2563153 ) ) ( not ( = ?auto_2563151 ?auto_2563154 ) ) ( not ( = ?auto_2563151 ?auto_2563155 ) ) ( not ( = ?auto_2563151 ?auto_2563156 ) ) ( not ( = ?auto_2563151 ?auto_2563160 ) ) ( not ( = ?auto_2563152 ?auto_2563153 ) ) ( not ( = ?auto_2563152 ?auto_2563154 ) ) ( not ( = ?auto_2563152 ?auto_2563155 ) ) ( not ( = ?auto_2563152 ?auto_2563156 ) ) ( not ( = ?auto_2563152 ?auto_2563160 ) ) ( not ( = ?auto_2563153 ?auto_2563154 ) ) ( not ( = ?auto_2563153 ?auto_2563155 ) ) ( not ( = ?auto_2563153 ?auto_2563156 ) ) ( not ( = ?auto_2563153 ?auto_2563160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563154 ?auto_2563155 ?auto_2563156 )
      ( MAKE-12CRATE-VERIFY ?auto_2563144 ?auto_2563145 ?auto_2563146 ?auto_2563147 ?auto_2563148 ?auto_2563149 ?auto_2563150 ?auto_2563151 ?auto_2563152 ?auto_2563153 ?auto_2563154 ?auto_2563155 ?auto_2563156 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563307 - SURFACE
      ?auto_2563308 - SURFACE
      ?auto_2563309 - SURFACE
      ?auto_2563310 - SURFACE
      ?auto_2563311 - SURFACE
      ?auto_2563312 - SURFACE
      ?auto_2563313 - SURFACE
      ?auto_2563314 - SURFACE
      ?auto_2563315 - SURFACE
      ?auto_2563316 - SURFACE
      ?auto_2563317 - SURFACE
      ?auto_2563318 - SURFACE
      ?auto_2563319 - SURFACE
    )
    :vars
    (
      ?auto_2563325 - HOIST
      ?auto_2563321 - PLACE
      ?auto_2563324 - PLACE
      ?auto_2563320 - HOIST
      ?auto_2563323 - SURFACE
      ?auto_2563322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563325 ?auto_2563321 ) ( SURFACE-AT ?auto_2563318 ?auto_2563321 ) ( CLEAR ?auto_2563318 ) ( IS-CRATE ?auto_2563319 ) ( not ( = ?auto_2563318 ?auto_2563319 ) ) ( AVAILABLE ?auto_2563325 ) ( ON ?auto_2563318 ?auto_2563317 ) ( not ( = ?auto_2563317 ?auto_2563318 ) ) ( not ( = ?auto_2563317 ?auto_2563319 ) ) ( not ( = ?auto_2563324 ?auto_2563321 ) ) ( HOIST-AT ?auto_2563320 ?auto_2563324 ) ( not ( = ?auto_2563325 ?auto_2563320 ) ) ( AVAILABLE ?auto_2563320 ) ( SURFACE-AT ?auto_2563319 ?auto_2563324 ) ( ON ?auto_2563319 ?auto_2563323 ) ( CLEAR ?auto_2563319 ) ( not ( = ?auto_2563318 ?auto_2563323 ) ) ( not ( = ?auto_2563319 ?auto_2563323 ) ) ( not ( = ?auto_2563317 ?auto_2563323 ) ) ( TRUCK-AT ?auto_2563322 ?auto_2563321 ) ( ON ?auto_2563308 ?auto_2563307 ) ( ON ?auto_2563309 ?auto_2563308 ) ( ON ?auto_2563310 ?auto_2563309 ) ( ON ?auto_2563311 ?auto_2563310 ) ( ON ?auto_2563312 ?auto_2563311 ) ( ON ?auto_2563313 ?auto_2563312 ) ( ON ?auto_2563314 ?auto_2563313 ) ( ON ?auto_2563315 ?auto_2563314 ) ( ON ?auto_2563316 ?auto_2563315 ) ( ON ?auto_2563317 ?auto_2563316 ) ( not ( = ?auto_2563307 ?auto_2563308 ) ) ( not ( = ?auto_2563307 ?auto_2563309 ) ) ( not ( = ?auto_2563307 ?auto_2563310 ) ) ( not ( = ?auto_2563307 ?auto_2563311 ) ) ( not ( = ?auto_2563307 ?auto_2563312 ) ) ( not ( = ?auto_2563307 ?auto_2563313 ) ) ( not ( = ?auto_2563307 ?auto_2563314 ) ) ( not ( = ?auto_2563307 ?auto_2563315 ) ) ( not ( = ?auto_2563307 ?auto_2563316 ) ) ( not ( = ?auto_2563307 ?auto_2563317 ) ) ( not ( = ?auto_2563307 ?auto_2563318 ) ) ( not ( = ?auto_2563307 ?auto_2563319 ) ) ( not ( = ?auto_2563307 ?auto_2563323 ) ) ( not ( = ?auto_2563308 ?auto_2563309 ) ) ( not ( = ?auto_2563308 ?auto_2563310 ) ) ( not ( = ?auto_2563308 ?auto_2563311 ) ) ( not ( = ?auto_2563308 ?auto_2563312 ) ) ( not ( = ?auto_2563308 ?auto_2563313 ) ) ( not ( = ?auto_2563308 ?auto_2563314 ) ) ( not ( = ?auto_2563308 ?auto_2563315 ) ) ( not ( = ?auto_2563308 ?auto_2563316 ) ) ( not ( = ?auto_2563308 ?auto_2563317 ) ) ( not ( = ?auto_2563308 ?auto_2563318 ) ) ( not ( = ?auto_2563308 ?auto_2563319 ) ) ( not ( = ?auto_2563308 ?auto_2563323 ) ) ( not ( = ?auto_2563309 ?auto_2563310 ) ) ( not ( = ?auto_2563309 ?auto_2563311 ) ) ( not ( = ?auto_2563309 ?auto_2563312 ) ) ( not ( = ?auto_2563309 ?auto_2563313 ) ) ( not ( = ?auto_2563309 ?auto_2563314 ) ) ( not ( = ?auto_2563309 ?auto_2563315 ) ) ( not ( = ?auto_2563309 ?auto_2563316 ) ) ( not ( = ?auto_2563309 ?auto_2563317 ) ) ( not ( = ?auto_2563309 ?auto_2563318 ) ) ( not ( = ?auto_2563309 ?auto_2563319 ) ) ( not ( = ?auto_2563309 ?auto_2563323 ) ) ( not ( = ?auto_2563310 ?auto_2563311 ) ) ( not ( = ?auto_2563310 ?auto_2563312 ) ) ( not ( = ?auto_2563310 ?auto_2563313 ) ) ( not ( = ?auto_2563310 ?auto_2563314 ) ) ( not ( = ?auto_2563310 ?auto_2563315 ) ) ( not ( = ?auto_2563310 ?auto_2563316 ) ) ( not ( = ?auto_2563310 ?auto_2563317 ) ) ( not ( = ?auto_2563310 ?auto_2563318 ) ) ( not ( = ?auto_2563310 ?auto_2563319 ) ) ( not ( = ?auto_2563310 ?auto_2563323 ) ) ( not ( = ?auto_2563311 ?auto_2563312 ) ) ( not ( = ?auto_2563311 ?auto_2563313 ) ) ( not ( = ?auto_2563311 ?auto_2563314 ) ) ( not ( = ?auto_2563311 ?auto_2563315 ) ) ( not ( = ?auto_2563311 ?auto_2563316 ) ) ( not ( = ?auto_2563311 ?auto_2563317 ) ) ( not ( = ?auto_2563311 ?auto_2563318 ) ) ( not ( = ?auto_2563311 ?auto_2563319 ) ) ( not ( = ?auto_2563311 ?auto_2563323 ) ) ( not ( = ?auto_2563312 ?auto_2563313 ) ) ( not ( = ?auto_2563312 ?auto_2563314 ) ) ( not ( = ?auto_2563312 ?auto_2563315 ) ) ( not ( = ?auto_2563312 ?auto_2563316 ) ) ( not ( = ?auto_2563312 ?auto_2563317 ) ) ( not ( = ?auto_2563312 ?auto_2563318 ) ) ( not ( = ?auto_2563312 ?auto_2563319 ) ) ( not ( = ?auto_2563312 ?auto_2563323 ) ) ( not ( = ?auto_2563313 ?auto_2563314 ) ) ( not ( = ?auto_2563313 ?auto_2563315 ) ) ( not ( = ?auto_2563313 ?auto_2563316 ) ) ( not ( = ?auto_2563313 ?auto_2563317 ) ) ( not ( = ?auto_2563313 ?auto_2563318 ) ) ( not ( = ?auto_2563313 ?auto_2563319 ) ) ( not ( = ?auto_2563313 ?auto_2563323 ) ) ( not ( = ?auto_2563314 ?auto_2563315 ) ) ( not ( = ?auto_2563314 ?auto_2563316 ) ) ( not ( = ?auto_2563314 ?auto_2563317 ) ) ( not ( = ?auto_2563314 ?auto_2563318 ) ) ( not ( = ?auto_2563314 ?auto_2563319 ) ) ( not ( = ?auto_2563314 ?auto_2563323 ) ) ( not ( = ?auto_2563315 ?auto_2563316 ) ) ( not ( = ?auto_2563315 ?auto_2563317 ) ) ( not ( = ?auto_2563315 ?auto_2563318 ) ) ( not ( = ?auto_2563315 ?auto_2563319 ) ) ( not ( = ?auto_2563315 ?auto_2563323 ) ) ( not ( = ?auto_2563316 ?auto_2563317 ) ) ( not ( = ?auto_2563316 ?auto_2563318 ) ) ( not ( = ?auto_2563316 ?auto_2563319 ) ) ( not ( = ?auto_2563316 ?auto_2563323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563317 ?auto_2563318 ?auto_2563319 )
      ( MAKE-12CRATE-VERIFY ?auto_2563307 ?auto_2563308 ?auto_2563309 ?auto_2563310 ?auto_2563311 ?auto_2563312 ?auto_2563313 ?auto_2563314 ?auto_2563315 ?auto_2563316 ?auto_2563317 ?auto_2563318 ?auto_2563319 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563470 - SURFACE
      ?auto_2563471 - SURFACE
      ?auto_2563472 - SURFACE
      ?auto_2563473 - SURFACE
      ?auto_2563474 - SURFACE
      ?auto_2563475 - SURFACE
      ?auto_2563476 - SURFACE
      ?auto_2563477 - SURFACE
      ?auto_2563478 - SURFACE
      ?auto_2563479 - SURFACE
      ?auto_2563480 - SURFACE
      ?auto_2563481 - SURFACE
      ?auto_2563482 - SURFACE
    )
    :vars
    (
      ?auto_2563484 - HOIST
      ?auto_2563487 - PLACE
      ?auto_2563488 - PLACE
      ?auto_2563483 - HOIST
      ?auto_2563486 - SURFACE
      ?auto_2563485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563484 ?auto_2563487 ) ( IS-CRATE ?auto_2563482 ) ( not ( = ?auto_2563481 ?auto_2563482 ) ) ( not ( = ?auto_2563480 ?auto_2563481 ) ) ( not ( = ?auto_2563480 ?auto_2563482 ) ) ( not ( = ?auto_2563488 ?auto_2563487 ) ) ( HOIST-AT ?auto_2563483 ?auto_2563488 ) ( not ( = ?auto_2563484 ?auto_2563483 ) ) ( AVAILABLE ?auto_2563483 ) ( SURFACE-AT ?auto_2563482 ?auto_2563488 ) ( ON ?auto_2563482 ?auto_2563486 ) ( CLEAR ?auto_2563482 ) ( not ( = ?auto_2563481 ?auto_2563486 ) ) ( not ( = ?auto_2563482 ?auto_2563486 ) ) ( not ( = ?auto_2563480 ?auto_2563486 ) ) ( TRUCK-AT ?auto_2563485 ?auto_2563487 ) ( SURFACE-AT ?auto_2563480 ?auto_2563487 ) ( CLEAR ?auto_2563480 ) ( LIFTING ?auto_2563484 ?auto_2563481 ) ( IS-CRATE ?auto_2563481 ) ( ON ?auto_2563471 ?auto_2563470 ) ( ON ?auto_2563472 ?auto_2563471 ) ( ON ?auto_2563473 ?auto_2563472 ) ( ON ?auto_2563474 ?auto_2563473 ) ( ON ?auto_2563475 ?auto_2563474 ) ( ON ?auto_2563476 ?auto_2563475 ) ( ON ?auto_2563477 ?auto_2563476 ) ( ON ?auto_2563478 ?auto_2563477 ) ( ON ?auto_2563479 ?auto_2563478 ) ( ON ?auto_2563480 ?auto_2563479 ) ( not ( = ?auto_2563470 ?auto_2563471 ) ) ( not ( = ?auto_2563470 ?auto_2563472 ) ) ( not ( = ?auto_2563470 ?auto_2563473 ) ) ( not ( = ?auto_2563470 ?auto_2563474 ) ) ( not ( = ?auto_2563470 ?auto_2563475 ) ) ( not ( = ?auto_2563470 ?auto_2563476 ) ) ( not ( = ?auto_2563470 ?auto_2563477 ) ) ( not ( = ?auto_2563470 ?auto_2563478 ) ) ( not ( = ?auto_2563470 ?auto_2563479 ) ) ( not ( = ?auto_2563470 ?auto_2563480 ) ) ( not ( = ?auto_2563470 ?auto_2563481 ) ) ( not ( = ?auto_2563470 ?auto_2563482 ) ) ( not ( = ?auto_2563470 ?auto_2563486 ) ) ( not ( = ?auto_2563471 ?auto_2563472 ) ) ( not ( = ?auto_2563471 ?auto_2563473 ) ) ( not ( = ?auto_2563471 ?auto_2563474 ) ) ( not ( = ?auto_2563471 ?auto_2563475 ) ) ( not ( = ?auto_2563471 ?auto_2563476 ) ) ( not ( = ?auto_2563471 ?auto_2563477 ) ) ( not ( = ?auto_2563471 ?auto_2563478 ) ) ( not ( = ?auto_2563471 ?auto_2563479 ) ) ( not ( = ?auto_2563471 ?auto_2563480 ) ) ( not ( = ?auto_2563471 ?auto_2563481 ) ) ( not ( = ?auto_2563471 ?auto_2563482 ) ) ( not ( = ?auto_2563471 ?auto_2563486 ) ) ( not ( = ?auto_2563472 ?auto_2563473 ) ) ( not ( = ?auto_2563472 ?auto_2563474 ) ) ( not ( = ?auto_2563472 ?auto_2563475 ) ) ( not ( = ?auto_2563472 ?auto_2563476 ) ) ( not ( = ?auto_2563472 ?auto_2563477 ) ) ( not ( = ?auto_2563472 ?auto_2563478 ) ) ( not ( = ?auto_2563472 ?auto_2563479 ) ) ( not ( = ?auto_2563472 ?auto_2563480 ) ) ( not ( = ?auto_2563472 ?auto_2563481 ) ) ( not ( = ?auto_2563472 ?auto_2563482 ) ) ( not ( = ?auto_2563472 ?auto_2563486 ) ) ( not ( = ?auto_2563473 ?auto_2563474 ) ) ( not ( = ?auto_2563473 ?auto_2563475 ) ) ( not ( = ?auto_2563473 ?auto_2563476 ) ) ( not ( = ?auto_2563473 ?auto_2563477 ) ) ( not ( = ?auto_2563473 ?auto_2563478 ) ) ( not ( = ?auto_2563473 ?auto_2563479 ) ) ( not ( = ?auto_2563473 ?auto_2563480 ) ) ( not ( = ?auto_2563473 ?auto_2563481 ) ) ( not ( = ?auto_2563473 ?auto_2563482 ) ) ( not ( = ?auto_2563473 ?auto_2563486 ) ) ( not ( = ?auto_2563474 ?auto_2563475 ) ) ( not ( = ?auto_2563474 ?auto_2563476 ) ) ( not ( = ?auto_2563474 ?auto_2563477 ) ) ( not ( = ?auto_2563474 ?auto_2563478 ) ) ( not ( = ?auto_2563474 ?auto_2563479 ) ) ( not ( = ?auto_2563474 ?auto_2563480 ) ) ( not ( = ?auto_2563474 ?auto_2563481 ) ) ( not ( = ?auto_2563474 ?auto_2563482 ) ) ( not ( = ?auto_2563474 ?auto_2563486 ) ) ( not ( = ?auto_2563475 ?auto_2563476 ) ) ( not ( = ?auto_2563475 ?auto_2563477 ) ) ( not ( = ?auto_2563475 ?auto_2563478 ) ) ( not ( = ?auto_2563475 ?auto_2563479 ) ) ( not ( = ?auto_2563475 ?auto_2563480 ) ) ( not ( = ?auto_2563475 ?auto_2563481 ) ) ( not ( = ?auto_2563475 ?auto_2563482 ) ) ( not ( = ?auto_2563475 ?auto_2563486 ) ) ( not ( = ?auto_2563476 ?auto_2563477 ) ) ( not ( = ?auto_2563476 ?auto_2563478 ) ) ( not ( = ?auto_2563476 ?auto_2563479 ) ) ( not ( = ?auto_2563476 ?auto_2563480 ) ) ( not ( = ?auto_2563476 ?auto_2563481 ) ) ( not ( = ?auto_2563476 ?auto_2563482 ) ) ( not ( = ?auto_2563476 ?auto_2563486 ) ) ( not ( = ?auto_2563477 ?auto_2563478 ) ) ( not ( = ?auto_2563477 ?auto_2563479 ) ) ( not ( = ?auto_2563477 ?auto_2563480 ) ) ( not ( = ?auto_2563477 ?auto_2563481 ) ) ( not ( = ?auto_2563477 ?auto_2563482 ) ) ( not ( = ?auto_2563477 ?auto_2563486 ) ) ( not ( = ?auto_2563478 ?auto_2563479 ) ) ( not ( = ?auto_2563478 ?auto_2563480 ) ) ( not ( = ?auto_2563478 ?auto_2563481 ) ) ( not ( = ?auto_2563478 ?auto_2563482 ) ) ( not ( = ?auto_2563478 ?auto_2563486 ) ) ( not ( = ?auto_2563479 ?auto_2563480 ) ) ( not ( = ?auto_2563479 ?auto_2563481 ) ) ( not ( = ?auto_2563479 ?auto_2563482 ) ) ( not ( = ?auto_2563479 ?auto_2563486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563480 ?auto_2563481 ?auto_2563482 )
      ( MAKE-12CRATE-VERIFY ?auto_2563470 ?auto_2563471 ?auto_2563472 ?auto_2563473 ?auto_2563474 ?auto_2563475 ?auto_2563476 ?auto_2563477 ?auto_2563478 ?auto_2563479 ?auto_2563480 ?auto_2563481 ?auto_2563482 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2563633 - SURFACE
      ?auto_2563634 - SURFACE
      ?auto_2563635 - SURFACE
      ?auto_2563636 - SURFACE
      ?auto_2563637 - SURFACE
      ?auto_2563638 - SURFACE
      ?auto_2563639 - SURFACE
      ?auto_2563640 - SURFACE
      ?auto_2563641 - SURFACE
      ?auto_2563642 - SURFACE
      ?auto_2563643 - SURFACE
      ?auto_2563644 - SURFACE
      ?auto_2563645 - SURFACE
    )
    :vars
    (
      ?auto_2563650 - HOIST
      ?auto_2563648 - PLACE
      ?auto_2563647 - PLACE
      ?auto_2563651 - HOIST
      ?auto_2563649 - SURFACE
      ?auto_2563646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563650 ?auto_2563648 ) ( IS-CRATE ?auto_2563645 ) ( not ( = ?auto_2563644 ?auto_2563645 ) ) ( not ( = ?auto_2563643 ?auto_2563644 ) ) ( not ( = ?auto_2563643 ?auto_2563645 ) ) ( not ( = ?auto_2563647 ?auto_2563648 ) ) ( HOIST-AT ?auto_2563651 ?auto_2563647 ) ( not ( = ?auto_2563650 ?auto_2563651 ) ) ( AVAILABLE ?auto_2563651 ) ( SURFACE-AT ?auto_2563645 ?auto_2563647 ) ( ON ?auto_2563645 ?auto_2563649 ) ( CLEAR ?auto_2563645 ) ( not ( = ?auto_2563644 ?auto_2563649 ) ) ( not ( = ?auto_2563645 ?auto_2563649 ) ) ( not ( = ?auto_2563643 ?auto_2563649 ) ) ( TRUCK-AT ?auto_2563646 ?auto_2563648 ) ( SURFACE-AT ?auto_2563643 ?auto_2563648 ) ( CLEAR ?auto_2563643 ) ( IS-CRATE ?auto_2563644 ) ( AVAILABLE ?auto_2563650 ) ( IN ?auto_2563644 ?auto_2563646 ) ( ON ?auto_2563634 ?auto_2563633 ) ( ON ?auto_2563635 ?auto_2563634 ) ( ON ?auto_2563636 ?auto_2563635 ) ( ON ?auto_2563637 ?auto_2563636 ) ( ON ?auto_2563638 ?auto_2563637 ) ( ON ?auto_2563639 ?auto_2563638 ) ( ON ?auto_2563640 ?auto_2563639 ) ( ON ?auto_2563641 ?auto_2563640 ) ( ON ?auto_2563642 ?auto_2563641 ) ( ON ?auto_2563643 ?auto_2563642 ) ( not ( = ?auto_2563633 ?auto_2563634 ) ) ( not ( = ?auto_2563633 ?auto_2563635 ) ) ( not ( = ?auto_2563633 ?auto_2563636 ) ) ( not ( = ?auto_2563633 ?auto_2563637 ) ) ( not ( = ?auto_2563633 ?auto_2563638 ) ) ( not ( = ?auto_2563633 ?auto_2563639 ) ) ( not ( = ?auto_2563633 ?auto_2563640 ) ) ( not ( = ?auto_2563633 ?auto_2563641 ) ) ( not ( = ?auto_2563633 ?auto_2563642 ) ) ( not ( = ?auto_2563633 ?auto_2563643 ) ) ( not ( = ?auto_2563633 ?auto_2563644 ) ) ( not ( = ?auto_2563633 ?auto_2563645 ) ) ( not ( = ?auto_2563633 ?auto_2563649 ) ) ( not ( = ?auto_2563634 ?auto_2563635 ) ) ( not ( = ?auto_2563634 ?auto_2563636 ) ) ( not ( = ?auto_2563634 ?auto_2563637 ) ) ( not ( = ?auto_2563634 ?auto_2563638 ) ) ( not ( = ?auto_2563634 ?auto_2563639 ) ) ( not ( = ?auto_2563634 ?auto_2563640 ) ) ( not ( = ?auto_2563634 ?auto_2563641 ) ) ( not ( = ?auto_2563634 ?auto_2563642 ) ) ( not ( = ?auto_2563634 ?auto_2563643 ) ) ( not ( = ?auto_2563634 ?auto_2563644 ) ) ( not ( = ?auto_2563634 ?auto_2563645 ) ) ( not ( = ?auto_2563634 ?auto_2563649 ) ) ( not ( = ?auto_2563635 ?auto_2563636 ) ) ( not ( = ?auto_2563635 ?auto_2563637 ) ) ( not ( = ?auto_2563635 ?auto_2563638 ) ) ( not ( = ?auto_2563635 ?auto_2563639 ) ) ( not ( = ?auto_2563635 ?auto_2563640 ) ) ( not ( = ?auto_2563635 ?auto_2563641 ) ) ( not ( = ?auto_2563635 ?auto_2563642 ) ) ( not ( = ?auto_2563635 ?auto_2563643 ) ) ( not ( = ?auto_2563635 ?auto_2563644 ) ) ( not ( = ?auto_2563635 ?auto_2563645 ) ) ( not ( = ?auto_2563635 ?auto_2563649 ) ) ( not ( = ?auto_2563636 ?auto_2563637 ) ) ( not ( = ?auto_2563636 ?auto_2563638 ) ) ( not ( = ?auto_2563636 ?auto_2563639 ) ) ( not ( = ?auto_2563636 ?auto_2563640 ) ) ( not ( = ?auto_2563636 ?auto_2563641 ) ) ( not ( = ?auto_2563636 ?auto_2563642 ) ) ( not ( = ?auto_2563636 ?auto_2563643 ) ) ( not ( = ?auto_2563636 ?auto_2563644 ) ) ( not ( = ?auto_2563636 ?auto_2563645 ) ) ( not ( = ?auto_2563636 ?auto_2563649 ) ) ( not ( = ?auto_2563637 ?auto_2563638 ) ) ( not ( = ?auto_2563637 ?auto_2563639 ) ) ( not ( = ?auto_2563637 ?auto_2563640 ) ) ( not ( = ?auto_2563637 ?auto_2563641 ) ) ( not ( = ?auto_2563637 ?auto_2563642 ) ) ( not ( = ?auto_2563637 ?auto_2563643 ) ) ( not ( = ?auto_2563637 ?auto_2563644 ) ) ( not ( = ?auto_2563637 ?auto_2563645 ) ) ( not ( = ?auto_2563637 ?auto_2563649 ) ) ( not ( = ?auto_2563638 ?auto_2563639 ) ) ( not ( = ?auto_2563638 ?auto_2563640 ) ) ( not ( = ?auto_2563638 ?auto_2563641 ) ) ( not ( = ?auto_2563638 ?auto_2563642 ) ) ( not ( = ?auto_2563638 ?auto_2563643 ) ) ( not ( = ?auto_2563638 ?auto_2563644 ) ) ( not ( = ?auto_2563638 ?auto_2563645 ) ) ( not ( = ?auto_2563638 ?auto_2563649 ) ) ( not ( = ?auto_2563639 ?auto_2563640 ) ) ( not ( = ?auto_2563639 ?auto_2563641 ) ) ( not ( = ?auto_2563639 ?auto_2563642 ) ) ( not ( = ?auto_2563639 ?auto_2563643 ) ) ( not ( = ?auto_2563639 ?auto_2563644 ) ) ( not ( = ?auto_2563639 ?auto_2563645 ) ) ( not ( = ?auto_2563639 ?auto_2563649 ) ) ( not ( = ?auto_2563640 ?auto_2563641 ) ) ( not ( = ?auto_2563640 ?auto_2563642 ) ) ( not ( = ?auto_2563640 ?auto_2563643 ) ) ( not ( = ?auto_2563640 ?auto_2563644 ) ) ( not ( = ?auto_2563640 ?auto_2563645 ) ) ( not ( = ?auto_2563640 ?auto_2563649 ) ) ( not ( = ?auto_2563641 ?auto_2563642 ) ) ( not ( = ?auto_2563641 ?auto_2563643 ) ) ( not ( = ?auto_2563641 ?auto_2563644 ) ) ( not ( = ?auto_2563641 ?auto_2563645 ) ) ( not ( = ?auto_2563641 ?auto_2563649 ) ) ( not ( = ?auto_2563642 ?auto_2563643 ) ) ( not ( = ?auto_2563642 ?auto_2563644 ) ) ( not ( = ?auto_2563642 ?auto_2563645 ) ) ( not ( = ?auto_2563642 ?auto_2563649 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2563643 ?auto_2563644 ?auto_2563645 )
      ( MAKE-12CRATE-VERIFY ?auto_2563633 ?auto_2563634 ?auto_2563635 ?auto_2563636 ?auto_2563637 ?auto_2563638 ?auto_2563639 ?auto_2563640 ?auto_2563641 ?auto_2563642 ?auto_2563643 ?auto_2563644 ?auto_2563645 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2575189 - SURFACE
      ?auto_2575190 - SURFACE
      ?auto_2575191 - SURFACE
      ?auto_2575192 - SURFACE
      ?auto_2575193 - SURFACE
      ?auto_2575194 - SURFACE
      ?auto_2575195 - SURFACE
      ?auto_2575196 - SURFACE
      ?auto_2575197 - SURFACE
      ?auto_2575198 - SURFACE
      ?auto_2575199 - SURFACE
      ?auto_2575200 - SURFACE
      ?auto_2575201 - SURFACE
      ?auto_2575202 - SURFACE
    )
    :vars
    (
      ?auto_2575204 - HOIST
      ?auto_2575203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575204 ?auto_2575203 ) ( SURFACE-AT ?auto_2575201 ?auto_2575203 ) ( CLEAR ?auto_2575201 ) ( LIFTING ?auto_2575204 ?auto_2575202 ) ( IS-CRATE ?auto_2575202 ) ( not ( = ?auto_2575201 ?auto_2575202 ) ) ( ON ?auto_2575190 ?auto_2575189 ) ( ON ?auto_2575191 ?auto_2575190 ) ( ON ?auto_2575192 ?auto_2575191 ) ( ON ?auto_2575193 ?auto_2575192 ) ( ON ?auto_2575194 ?auto_2575193 ) ( ON ?auto_2575195 ?auto_2575194 ) ( ON ?auto_2575196 ?auto_2575195 ) ( ON ?auto_2575197 ?auto_2575196 ) ( ON ?auto_2575198 ?auto_2575197 ) ( ON ?auto_2575199 ?auto_2575198 ) ( ON ?auto_2575200 ?auto_2575199 ) ( ON ?auto_2575201 ?auto_2575200 ) ( not ( = ?auto_2575189 ?auto_2575190 ) ) ( not ( = ?auto_2575189 ?auto_2575191 ) ) ( not ( = ?auto_2575189 ?auto_2575192 ) ) ( not ( = ?auto_2575189 ?auto_2575193 ) ) ( not ( = ?auto_2575189 ?auto_2575194 ) ) ( not ( = ?auto_2575189 ?auto_2575195 ) ) ( not ( = ?auto_2575189 ?auto_2575196 ) ) ( not ( = ?auto_2575189 ?auto_2575197 ) ) ( not ( = ?auto_2575189 ?auto_2575198 ) ) ( not ( = ?auto_2575189 ?auto_2575199 ) ) ( not ( = ?auto_2575189 ?auto_2575200 ) ) ( not ( = ?auto_2575189 ?auto_2575201 ) ) ( not ( = ?auto_2575189 ?auto_2575202 ) ) ( not ( = ?auto_2575190 ?auto_2575191 ) ) ( not ( = ?auto_2575190 ?auto_2575192 ) ) ( not ( = ?auto_2575190 ?auto_2575193 ) ) ( not ( = ?auto_2575190 ?auto_2575194 ) ) ( not ( = ?auto_2575190 ?auto_2575195 ) ) ( not ( = ?auto_2575190 ?auto_2575196 ) ) ( not ( = ?auto_2575190 ?auto_2575197 ) ) ( not ( = ?auto_2575190 ?auto_2575198 ) ) ( not ( = ?auto_2575190 ?auto_2575199 ) ) ( not ( = ?auto_2575190 ?auto_2575200 ) ) ( not ( = ?auto_2575190 ?auto_2575201 ) ) ( not ( = ?auto_2575190 ?auto_2575202 ) ) ( not ( = ?auto_2575191 ?auto_2575192 ) ) ( not ( = ?auto_2575191 ?auto_2575193 ) ) ( not ( = ?auto_2575191 ?auto_2575194 ) ) ( not ( = ?auto_2575191 ?auto_2575195 ) ) ( not ( = ?auto_2575191 ?auto_2575196 ) ) ( not ( = ?auto_2575191 ?auto_2575197 ) ) ( not ( = ?auto_2575191 ?auto_2575198 ) ) ( not ( = ?auto_2575191 ?auto_2575199 ) ) ( not ( = ?auto_2575191 ?auto_2575200 ) ) ( not ( = ?auto_2575191 ?auto_2575201 ) ) ( not ( = ?auto_2575191 ?auto_2575202 ) ) ( not ( = ?auto_2575192 ?auto_2575193 ) ) ( not ( = ?auto_2575192 ?auto_2575194 ) ) ( not ( = ?auto_2575192 ?auto_2575195 ) ) ( not ( = ?auto_2575192 ?auto_2575196 ) ) ( not ( = ?auto_2575192 ?auto_2575197 ) ) ( not ( = ?auto_2575192 ?auto_2575198 ) ) ( not ( = ?auto_2575192 ?auto_2575199 ) ) ( not ( = ?auto_2575192 ?auto_2575200 ) ) ( not ( = ?auto_2575192 ?auto_2575201 ) ) ( not ( = ?auto_2575192 ?auto_2575202 ) ) ( not ( = ?auto_2575193 ?auto_2575194 ) ) ( not ( = ?auto_2575193 ?auto_2575195 ) ) ( not ( = ?auto_2575193 ?auto_2575196 ) ) ( not ( = ?auto_2575193 ?auto_2575197 ) ) ( not ( = ?auto_2575193 ?auto_2575198 ) ) ( not ( = ?auto_2575193 ?auto_2575199 ) ) ( not ( = ?auto_2575193 ?auto_2575200 ) ) ( not ( = ?auto_2575193 ?auto_2575201 ) ) ( not ( = ?auto_2575193 ?auto_2575202 ) ) ( not ( = ?auto_2575194 ?auto_2575195 ) ) ( not ( = ?auto_2575194 ?auto_2575196 ) ) ( not ( = ?auto_2575194 ?auto_2575197 ) ) ( not ( = ?auto_2575194 ?auto_2575198 ) ) ( not ( = ?auto_2575194 ?auto_2575199 ) ) ( not ( = ?auto_2575194 ?auto_2575200 ) ) ( not ( = ?auto_2575194 ?auto_2575201 ) ) ( not ( = ?auto_2575194 ?auto_2575202 ) ) ( not ( = ?auto_2575195 ?auto_2575196 ) ) ( not ( = ?auto_2575195 ?auto_2575197 ) ) ( not ( = ?auto_2575195 ?auto_2575198 ) ) ( not ( = ?auto_2575195 ?auto_2575199 ) ) ( not ( = ?auto_2575195 ?auto_2575200 ) ) ( not ( = ?auto_2575195 ?auto_2575201 ) ) ( not ( = ?auto_2575195 ?auto_2575202 ) ) ( not ( = ?auto_2575196 ?auto_2575197 ) ) ( not ( = ?auto_2575196 ?auto_2575198 ) ) ( not ( = ?auto_2575196 ?auto_2575199 ) ) ( not ( = ?auto_2575196 ?auto_2575200 ) ) ( not ( = ?auto_2575196 ?auto_2575201 ) ) ( not ( = ?auto_2575196 ?auto_2575202 ) ) ( not ( = ?auto_2575197 ?auto_2575198 ) ) ( not ( = ?auto_2575197 ?auto_2575199 ) ) ( not ( = ?auto_2575197 ?auto_2575200 ) ) ( not ( = ?auto_2575197 ?auto_2575201 ) ) ( not ( = ?auto_2575197 ?auto_2575202 ) ) ( not ( = ?auto_2575198 ?auto_2575199 ) ) ( not ( = ?auto_2575198 ?auto_2575200 ) ) ( not ( = ?auto_2575198 ?auto_2575201 ) ) ( not ( = ?auto_2575198 ?auto_2575202 ) ) ( not ( = ?auto_2575199 ?auto_2575200 ) ) ( not ( = ?auto_2575199 ?auto_2575201 ) ) ( not ( = ?auto_2575199 ?auto_2575202 ) ) ( not ( = ?auto_2575200 ?auto_2575201 ) ) ( not ( = ?auto_2575200 ?auto_2575202 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2575201 ?auto_2575202 )
      ( MAKE-13CRATE-VERIFY ?auto_2575189 ?auto_2575190 ?auto_2575191 ?auto_2575192 ?auto_2575193 ?auto_2575194 ?auto_2575195 ?auto_2575196 ?auto_2575197 ?auto_2575198 ?auto_2575199 ?auto_2575200 ?auto_2575201 ?auto_2575202 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2575331 - SURFACE
      ?auto_2575332 - SURFACE
      ?auto_2575333 - SURFACE
      ?auto_2575334 - SURFACE
      ?auto_2575335 - SURFACE
      ?auto_2575336 - SURFACE
      ?auto_2575337 - SURFACE
      ?auto_2575338 - SURFACE
      ?auto_2575339 - SURFACE
      ?auto_2575340 - SURFACE
      ?auto_2575341 - SURFACE
      ?auto_2575342 - SURFACE
      ?auto_2575343 - SURFACE
      ?auto_2575344 - SURFACE
    )
    :vars
    (
      ?auto_2575347 - HOIST
      ?auto_2575346 - PLACE
      ?auto_2575345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575347 ?auto_2575346 ) ( SURFACE-AT ?auto_2575343 ?auto_2575346 ) ( CLEAR ?auto_2575343 ) ( IS-CRATE ?auto_2575344 ) ( not ( = ?auto_2575343 ?auto_2575344 ) ) ( TRUCK-AT ?auto_2575345 ?auto_2575346 ) ( AVAILABLE ?auto_2575347 ) ( IN ?auto_2575344 ?auto_2575345 ) ( ON ?auto_2575343 ?auto_2575342 ) ( not ( = ?auto_2575342 ?auto_2575343 ) ) ( not ( = ?auto_2575342 ?auto_2575344 ) ) ( ON ?auto_2575332 ?auto_2575331 ) ( ON ?auto_2575333 ?auto_2575332 ) ( ON ?auto_2575334 ?auto_2575333 ) ( ON ?auto_2575335 ?auto_2575334 ) ( ON ?auto_2575336 ?auto_2575335 ) ( ON ?auto_2575337 ?auto_2575336 ) ( ON ?auto_2575338 ?auto_2575337 ) ( ON ?auto_2575339 ?auto_2575338 ) ( ON ?auto_2575340 ?auto_2575339 ) ( ON ?auto_2575341 ?auto_2575340 ) ( ON ?auto_2575342 ?auto_2575341 ) ( not ( = ?auto_2575331 ?auto_2575332 ) ) ( not ( = ?auto_2575331 ?auto_2575333 ) ) ( not ( = ?auto_2575331 ?auto_2575334 ) ) ( not ( = ?auto_2575331 ?auto_2575335 ) ) ( not ( = ?auto_2575331 ?auto_2575336 ) ) ( not ( = ?auto_2575331 ?auto_2575337 ) ) ( not ( = ?auto_2575331 ?auto_2575338 ) ) ( not ( = ?auto_2575331 ?auto_2575339 ) ) ( not ( = ?auto_2575331 ?auto_2575340 ) ) ( not ( = ?auto_2575331 ?auto_2575341 ) ) ( not ( = ?auto_2575331 ?auto_2575342 ) ) ( not ( = ?auto_2575331 ?auto_2575343 ) ) ( not ( = ?auto_2575331 ?auto_2575344 ) ) ( not ( = ?auto_2575332 ?auto_2575333 ) ) ( not ( = ?auto_2575332 ?auto_2575334 ) ) ( not ( = ?auto_2575332 ?auto_2575335 ) ) ( not ( = ?auto_2575332 ?auto_2575336 ) ) ( not ( = ?auto_2575332 ?auto_2575337 ) ) ( not ( = ?auto_2575332 ?auto_2575338 ) ) ( not ( = ?auto_2575332 ?auto_2575339 ) ) ( not ( = ?auto_2575332 ?auto_2575340 ) ) ( not ( = ?auto_2575332 ?auto_2575341 ) ) ( not ( = ?auto_2575332 ?auto_2575342 ) ) ( not ( = ?auto_2575332 ?auto_2575343 ) ) ( not ( = ?auto_2575332 ?auto_2575344 ) ) ( not ( = ?auto_2575333 ?auto_2575334 ) ) ( not ( = ?auto_2575333 ?auto_2575335 ) ) ( not ( = ?auto_2575333 ?auto_2575336 ) ) ( not ( = ?auto_2575333 ?auto_2575337 ) ) ( not ( = ?auto_2575333 ?auto_2575338 ) ) ( not ( = ?auto_2575333 ?auto_2575339 ) ) ( not ( = ?auto_2575333 ?auto_2575340 ) ) ( not ( = ?auto_2575333 ?auto_2575341 ) ) ( not ( = ?auto_2575333 ?auto_2575342 ) ) ( not ( = ?auto_2575333 ?auto_2575343 ) ) ( not ( = ?auto_2575333 ?auto_2575344 ) ) ( not ( = ?auto_2575334 ?auto_2575335 ) ) ( not ( = ?auto_2575334 ?auto_2575336 ) ) ( not ( = ?auto_2575334 ?auto_2575337 ) ) ( not ( = ?auto_2575334 ?auto_2575338 ) ) ( not ( = ?auto_2575334 ?auto_2575339 ) ) ( not ( = ?auto_2575334 ?auto_2575340 ) ) ( not ( = ?auto_2575334 ?auto_2575341 ) ) ( not ( = ?auto_2575334 ?auto_2575342 ) ) ( not ( = ?auto_2575334 ?auto_2575343 ) ) ( not ( = ?auto_2575334 ?auto_2575344 ) ) ( not ( = ?auto_2575335 ?auto_2575336 ) ) ( not ( = ?auto_2575335 ?auto_2575337 ) ) ( not ( = ?auto_2575335 ?auto_2575338 ) ) ( not ( = ?auto_2575335 ?auto_2575339 ) ) ( not ( = ?auto_2575335 ?auto_2575340 ) ) ( not ( = ?auto_2575335 ?auto_2575341 ) ) ( not ( = ?auto_2575335 ?auto_2575342 ) ) ( not ( = ?auto_2575335 ?auto_2575343 ) ) ( not ( = ?auto_2575335 ?auto_2575344 ) ) ( not ( = ?auto_2575336 ?auto_2575337 ) ) ( not ( = ?auto_2575336 ?auto_2575338 ) ) ( not ( = ?auto_2575336 ?auto_2575339 ) ) ( not ( = ?auto_2575336 ?auto_2575340 ) ) ( not ( = ?auto_2575336 ?auto_2575341 ) ) ( not ( = ?auto_2575336 ?auto_2575342 ) ) ( not ( = ?auto_2575336 ?auto_2575343 ) ) ( not ( = ?auto_2575336 ?auto_2575344 ) ) ( not ( = ?auto_2575337 ?auto_2575338 ) ) ( not ( = ?auto_2575337 ?auto_2575339 ) ) ( not ( = ?auto_2575337 ?auto_2575340 ) ) ( not ( = ?auto_2575337 ?auto_2575341 ) ) ( not ( = ?auto_2575337 ?auto_2575342 ) ) ( not ( = ?auto_2575337 ?auto_2575343 ) ) ( not ( = ?auto_2575337 ?auto_2575344 ) ) ( not ( = ?auto_2575338 ?auto_2575339 ) ) ( not ( = ?auto_2575338 ?auto_2575340 ) ) ( not ( = ?auto_2575338 ?auto_2575341 ) ) ( not ( = ?auto_2575338 ?auto_2575342 ) ) ( not ( = ?auto_2575338 ?auto_2575343 ) ) ( not ( = ?auto_2575338 ?auto_2575344 ) ) ( not ( = ?auto_2575339 ?auto_2575340 ) ) ( not ( = ?auto_2575339 ?auto_2575341 ) ) ( not ( = ?auto_2575339 ?auto_2575342 ) ) ( not ( = ?auto_2575339 ?auto_2575343 ) ) ( not ( = ?auto_2575339 ?auto_2575344 ) ) ( not ( = ?auto_2575340 ?auto_2575341 ) ) ( not ( = ?auto_2575340 ?auto_2575342 ) ) ( not ( = ?auto_2575340 ?auto_2575343 ) ) ( not ( = ?auto_2575340 ?auto_2575344 ) ) ( not ( = ?auto_2575341 ?auto_2575342 ) ) ( not ( = ?auto_2575341 ?auto_2575343 ) ) ( not ( = ?auto_2575341 ?auto_2575344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2575342 ?auto_2575343 ?auto_2575344 )
      ( MAKE-13CRATE-VERIFY ?auto_2575331 ?auto_2575332 ?auto_2575333 ?auto_2575334 ?auto_2575335 ?auto_2575336 ?auto_2575337 ?auto_2575338 ?auto_2575339 ?auto_2575340 ?auto_2575341 ?auto_2575342 ?auto_2575343 ?auto_2575344 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2575487 - SURFACE
      ?auto_2575488 - SURFACE
      ?auto_2575489 - SURFACE
      ?auto_2575490 - SURFACE
      ?auto_2575491 - SURFACE
      ?auto_2575492 - SURFACE
      ?auto_2575493 - SURFACE
      ?auto_2575494 - SURFACE
      ?auto_2575495 - SURFACE
      ?auto_2575496 - SURFACE
      ?auto_2575497 - SURFACE
      ?auto_2575498 - SURFACE
      ?auto_2575499 - SURFACE
      ?auto_2575500 - SURFACE
    )
    :vars
    (
      ?auto_2575503 - HOIST
      ?auto_2575504 - PLACE
      ?auto_2575501 - TRUCK
      ?auto_2575502 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575503 ?auto_2575504 ) ( SURFACE-AT ?auto_2575499 ?auto_2575504 ) ( CLEAR ?auto_2575499 ) ( IS-CRATE ?auto_2575500 ) ( not ( = ?auto_2575499 ?auto_2575500 ) ) ( AVAILABLE ?auto_2575503 ) ( IN ?auto_2575500 ?auto_2575501 ) ( ON ?auto_2575499 ?auto_2575498 ) ( not ( = ?auto_2575498 ?auto_2575499 ) ) ( not ( = ?auto_2575498 ?auto_2575500 ) ) ( TRUCK-AT ?auto_2575501 ?auto_2575502 ) ( not ( = ?auto_2575502 ?auto_2575504 ) ) ( ON ?auto_2575488 ?auto_2575487 ) ( ON ?auto_2575489 ?auto_2575488 ) ( ON ?auto_2575490 ?auto_2575489 ) ( ON ?auto_2575491 ?auto_2575490 ) ( ON ?auto_2575492 ?auto_2575491 ) ( ON ?auto_2575493 ?auto_2575492 ) ( ON ?auto_2575494 ?auto_2575493 ) ( ON ?auto_2575495 ?auto_2575494 ) ( ON ?auto_2575496 ?auto_2575495 ) ( ON ?auto_2575497 ?auto_2575496 ) ( ON ?auto_2575498 ?auto_2575497 ) ( not ( = ?auto_2575487 ?auto_2575488 ) ) ( not ( = ?auto_2575487 ?auto_2575489 ) ) ( not ( = ?auto_2575487 ?auto_2575490 ) ) ( not ( = ?auto_2575487 ?auto_2575491 ) ) ( not ( = ?auto_2575487 ?auto_2575492 ) ) ( not ( = ?auto_2575487 ?auto_2575493 ) ) ( not ( = ?auto_2575487 ?auto_2575494 ) ) ( not ( = ?auto_2575487 ?auto_2575495 ) ) ( not ( = ?auto_2575487 ?auto_2575496 ) ) ( not ( = ?auto_2575487 ?auto_2575497 ) ) ( not ( = ?auto_2575487 ?auto_2575498 ) ) ( not ( = ?auto_2575487 ?auto_2575499 ) ) ( not ( = ?auto_2575487 ?auto_2575500 ) ) ( not ( = ?auto_2575488 ?auto_2575489 ) ) ( not ( = ?auto_2575488 ?auto_2575490 ) ) ( not ( = ?auto_2575488 ?auto_2575491 ) ) ( not ( = ?auto_2575488 ?auto_2575492 ) ) ( not ( = ?auto_2575488 ?auto_2575493 ) ) ( not ( = ?auto_2575488 ?auto_2575494 ) ) ( not ( = ?auto_2575488 ?auto_2575495 ) ) ( not ( = ?auto_2575488 ?auto_2575496 ) ) ( not ( = ?auto_2575488 ?auto_2575497 ) ) ( not ( = ?auto_2575488 ?auto_2575498 ) ) ( not ( = ?auto_2575488 ?auto_2575499 ) ) ( not ( = ?auto_2575488 ?auto_2575500 ) ) ( not ( = ?auto_2575489 ?auto_2575490 ) ) ( not ( = ?auto_2575489 ?auto_2575491 ) ) ( not ( = ?auto_2575489 ?auto_2575492 ) ) ( not ( = ?auto_2575489 ?auto_2575493 ) ) ( not ( = ?auto_2575489 ?auto_2575494 ) ) ( not ( = ?auto_2575489 ?auto_2575495 ) ) ( not ( = ?auto_2575489 ?auto_2575496 ) ) ( not ( = ?auto_2575489 ?auto_2575497 ) ) ( not ( = ?auto_2575489 ?auto_2575498 ) ) ( not ( = ?auto_2575489 ?auto_2575499 ) ) ( not ( = ?auto_2575489 ?auto_2575500 ) ) ( not ( = ?auto_2575490 ?auto_2575491 ) ) ( not ( = ?auto_2575490 ?auto_2575492 ) ) ( not ( = ?auto_2575490 ?auto_2575493 ) ) ( not ( = ?auto_2575490 ?auto_2575494 ) ) ( not ( = ?auto_2575490 ?auto_2575495 ) ) ( not ( = ?auto_2575490 ?auto_2575496 ) ) ( not ( = ?auto_2575490 ?auto_2575497 ) ) ( not ( = ?auto_2575490 ?auto_2575498 ) ) ( not ( = ?auto_2575490 ?auto_2575499 ) ) ( not ( = ?auto_2575490 ?auto_2575500 ) ) ( not ( = ?auto_2575491 ?auto_2575492 ) ) ( not ( = ?auto_2575491 ?auto_2575493 ) ) ( not ( = ?auto_2575491 ?auto_2575494 ) ) ( not ( = ?auto_2575491 ?auto_2575495 ) ) ( not ( = ?auto_2575491 ?auto_2575496 ) ) ( not ( = ?auto_2575491 ?auto_2575497 ) ) ( not ( = ?auto_2575491 ?auto_2575498 ) ) ( not ( = ?auto_2575491 ?auto_2575499 ) ) ( not ( = ?auto_2575491 ?auto_2575500 ) ) ( not ( = ?auto_2575492 ?auto_2575493 ) ) ( not ( = ?auto_2575492 ?auto_2575494 ) ) ( not ( = ?auto_2575492 ?auto_2575495 ) ) ( not ( = ?auto_2575492 ?auto_2575496 ) ) ( not ( = ?auto_2575492 ?auto_2575497 ) ) ( not ( = ?auto_2575492 ?auto_2575498 ) ) ( not ( = ?auto_2575492 ?auto_2575499 ) ) ( not ( = ?auto_2575492 ?auto_2575500 ) ) ( not ( = ?auto_2575493 ?auto_2575494 ) ) ( not ( = ?auto_2575493 ?auto_2575495 ) ) ( not ( = ?auto_2575493 ?auto_2575496 ) ) ( not ( = ?auto_2575493 ?auto_2575497 ) ) ( not ( = ?auto_2575493 ?auto_2575498 ) ) ( not ( = ?auto_2575493 ?auto_2575499 ) ) ( not ( = ?auto_2575493 ?auto_2575500 ) ) ( not ( = ?auto_2575494 ?auto_2575495 ) ) ( not ( = ?auto_2575494 ?auto_2575496 ) ) ( not ( = ?auto_2575494 ?auto_2575497 ) ) ( not ( = ?auto_2575494 ?auto_2575498 ) ) ( not ( = ?auto_2575494 ?auto_2575499 ) ) ( not ( = ?auto_2575494 ?auto_2575500 ) ) ( not ( = ?auto_2575495 ?auto_2575496 ) ) ( not ( = ?auto_2575495 ?auto_2575497 ) ) ( not ( = ?auto_2575495 ?auto_2575498 ) ) ( not ( = ?auto_2575495 ?auto_2575499 ) ) ( not ( = ?auto_2575495 ?auto_2575500 ) ) ( not ( = ?auto_2575496 ?auto_2575497 ) ) ( not ( = ?auto_2575496 ?auto_2575498 ) ) ( not ( = ?auto_2575496 ?auto_2575499 ) ) ( not ( = ?auto_2575496 ?auto_2575500 ) ) ( not ( = ?auto_2575497 ?auto_2575498 ) ) ( not ( = ?auto_2575497 ?auto_2575499 ) ) ( not ( = ?auto_2575497 ?auto_2575500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2575498 ?auto_2575499 ?auto_2575500 )
      ( MAKE-13CRATE-VERIFY ?auto_2575487 ?auto_2575488 ?auto_2575489 ?auto_2575490 ?auto_2575491 ?auto_2575492 ?auto_2575493 ?auto_2575494 ?auto_2575495 ?auto_2575496 ?auto_2575497 ?auto_2575498 ?auto_2575499 ?auto_2575500 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2575656 - SURFACE
      ?auto_2575657 - SURFACE
      ?auto_2575658 - SURFACE
      ?auto_2575659 - SURFACE
      ?auto_2575660 - SURFACE
      ?auto_2575661 - SURFACE
      ?auto_2575662 - SURFACE
      ?auto_2575663 - SURFACE
      ?auto_2575664 - SURFACE
      ?auto_2575665 - SURFACE
      ?auto_2575666 - SURFACE
      ?auto_2575667 - SURFACE
      ?auto_2575668 - SURFACE
      ?auto_2575669 - SURFACE
    )
    :vars
    (
      ?auto_2575670 - HOIST
      ?auto_2575673 - PLACE
      ?auto_2575671 - TRUCK
      ?auto_2575674 - PLACE
      ?auto_2575672 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575670 ?auto_2575673 ) ( SURFACE-AT ?auto_2575668 ?auto_2575673 ) ( CLEAR ?auto_2575668 ) ( IS-CRATE ?auto_2575669 ) ( not ( = ?auto_2575668 ?auto_2575669 ) ) ( AVAILABLE ?auto_2575670 ) ( ON ?auto_2575668 ?auto_2575667 ) ( not ( = ?auto_2575667 ?auto_2575668 ) ) ( not ( = ?auto_2575667 ?auto_2575669 ) ) ( TRUCK-AT ?auto_2575671 ?auto_2575674 ) ( not ( = ?auto_2575674 ?auto_2575673 ) ) ( HOIST-AT ?auto_2575672 ?auto_2575674 ) ( LIFTING ?auto_2575672 ?auto_2575669 ) ( not ( = ?auto_2575670 ?auto_2575672 ) ) ( ON ?auto_2575657 ?auto_2575656 ) ( ON ?auto_2575658 ?auto_2575657 ) ( ON ?auto_2575659 ?auto_2575658 ) ( ON ?auto_2575660 ?auto_2575659 ) ( ON ?auto_2575661 ?auto_2575660 ) ( ON ?auto_2575662 ?auto_2575661 ) ( ON ?auto_2575663 ?auto_2575662 ) ( ON ?auto_2575664 ?auto_2575663 ) ( ON ?auto_2575665 ?auto_2575664 ) ( ON ?auto_2575666 ?auto_2575665 ) ( ON ?auto_2575667 ?auto_2575666 ) ( not ( = ?auto_2575656 ?auto_2575657 ) ) ( not ( = ?auto_2575656 ?auto_2575658 ) ) ( not ( = ?auto_2575656 ?auto_2575659 ) ) ( not ( = ?auto_2575656 ?auto_2575660 ) ) ( not ( = ?auto_2575656 ?auto_2575661 ) ) ( not ( = ?auto_2575656 ?auto_2575662 ) ) ( not ( = ?auto_2575656 ?auto_2575663 ) ) ( not ( = ?auto_2575656 ?auto_2575664 ) ) ( not ( = ?auto_2575656 ?auto_2575665 ) ) ( not ( = ?auto_2575656 ?auto_2575666 ) ) ( not ( = ?auto_2575656 ?auto_2575667 ) ) ( not ( = ?auto_2575656 ?auto_2575668 ) ) ( not ( = ?auto_2575656 ?auto_2575669 ) ) ( not ( = ?auto_2575657 ?auto_2575658 ) ) ( not ( = ?auto_2575657 ?auto_2575659 ) ) ( not ( = ?auto_2575657 ?auto_2575660 ) ) ( not ( = ?auto_2575657 ?auto_2575661 ) ) ( not ( = ?auto_2575657 ?auto_2575662 ) ) ( not ( = ?auto_2575657 ?auto_2575663 ) ) ( not ( = ?auto_2575657 ?auto_2575664 ) ) ( not ( = ?auto_2575657 ?auto_2575665 ) ) ( not ( = ?auto_2575657 ?auto_2575666 ) ) ( not ( = ?auto_2575657 ?auto_2575667 ) ) ( not ( = ?auto_2575657 ?auto_2575668 ) ) ( not ( = ?auto_2575657 ?auto_2575669 ) ) ( not ( = ?auto_2575658 ?auto_2575659 ) ) ( not ( = ?auto_2575658 ?auto_2575660 ) ) ( not ( = ?auto_2575658 ?auto_2575661 ) ) ( not ( = ?auto_2575658 ?auto_2575662 ) ) ( not ( = ?auto_2575658 ?auto_2575663 ) ) ( not ( = ?auto_2575658 ?auto_2575664 ) ) ( not ( = ?auto_2575658 ?auto_2575665 ) ) ( not ( = ?auto_2575658 ?auto_2575666 ) ) ( not ( = ?auto_2575658 ?auto_2575667 ) ) ( not ( = ?auto_2575658 ?auto_2575668 ) ) ( not ( = ?auto_2575658 ?auto_2575669 ) ) ( not ( = ?auto_2575659 ?auto_2575660 ) ) ( not ( = ?auto_2575659 ?auto_2575661 ) ) ( not ( = ?auto_2575659 ?auto_2575662 ) ) ( not ( = ?auto_2575659 ?auto_2575663 ) ) ( not ( = ?auto_2575659 ?auto_2575664 ) ) ( not ( = ?auto_2575659 ?auto_2575665 ) ) ( not ( = ?auto_2575659 ?auto_2575666 ) ) ( not ( = ?auto_2575659 ?auto_2575667 ) ) ( not ( = ?auto_2575659 ?auto_2575668 ) ) ( not ( = ?auto_2575659 ?auto_2575669 ) ) ( not ( = ?auto_2575660 ?auto_2575661 ) ) ( not ( = ?auto_2575660 ?auto_2575662 ) ) ( not ( = ?auto_2575660 ?auto_2575663 ) ) ( not ( = ?auto_2575660 ?auto_2575664 ) ) ( not ( = ?auto_2575660 ?auto_2575665 ) ) ( not ( = ?auto_2575660 ?auto_2575666 ) ) ( not ( = ?auto_2575660 ?auto_2575667 ) ) ( not ( = ?auto_2575660 ?auto_2575668 ) ) ( not ( = ?auto_2575660 ?auto_2575669 ) ) ( not ( = ?auto_2575661 ?auto_2575662 ) ) ( not ( = ?auto_2575661 ?auto_2575663 ) ) ( not ( = ?auto_2575661 ?auto_2575664 ) ) ( not ( = ?auto_2575661 ?auto_2575665 ) ) ( not ( = ?auto_2575661 ?auto_2575666 ) ) ( not ( = ?auto_2575661 ?auto_2575667 ) ) ( not ( = ?auto_2575661 ?auto_2575668 ) ) ( not ( = ?auto_2575661 ?auto_2575669 ) ) ( not ( = ?auto_2575662 ?auto_2575663 ) ) ( not ( = ?auto_2575662 ?auto_2575664 ) ) ( not ( = ?auto_2575662 ?auto_2575665 ) ) ( not ( = ?auto_2575662 ?auto_2575666 ) ) ( not ( = ?auto_2575662 ?auto_2575667 ) ) ( not ( = ?auto_2575662 ?auto_2575668 ) ) ( not ( = ?auto_2575662 ?auto_2575669 ) ) ( not ( = ?auto_2575663 ?auto_2575664 ) ) ( not ( = ?auto_2575663 ?auto_2575665 ) ) ( not ( = ?auto_2575663 ?auto_2575666 ) ) ( not ( = ?auto_2575663 ?auto_2575667 ) ) ( not ( = ?auto_2575663 ?auto_2575668 ) ) ( not ( = ?auto_2575663 ?auto_2575669 ) ) ( not ( = ?auto_2575664 ?auto_2575665 ) ) ( not ( = ?auto_2575664 ?auto_2575666 ) ) ( not ( = ?auto_2575664 ?auto_2575667 ) ) ( not ( = ?auto_2575664 ?auto_2575668 ) ) ( not ( = ?auto_2575664 ?auto_2575669 ) ) ( not ( = ?auto_2575665 ?auto_2575666 ) ) ( not ( = ?auto_2575665 ?auto_2575667 ) ) ( not ( = ?auto_2575665 ?auto_2575668 ) ) ( not ( = ?auto_2575665 ?auto_2575669 ) ) ( not ( = ?auto_2575666 ?auto_2575667 ) ) ( not ( = ?auto_2575666 ?auto_2575668 ) ) ( not ( = ?auto_2575666 ?auto_2575669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2575667 ?auto_2575668 ?auto_2575669 )
      ( MAKE-13CRATE-VERIFY ?auto_2575656 ?auto_2575657 ?auto_2575658 ?auto_2575659 ?auto_2575660 ?auto_2575661 ?auto_2575662 ?auto_2575663 ?auto_2575664 ?auto_2575665 ?auto_2575666 ?auto_2575667 ?auto_2575668 ?auto_2575669 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2575838 - SURFACE
      ?auto_2575839 - SURFACE
      ?auto_2575840 - SURFACE
      ?auto_2575841 - SURFACE
      ?auto_2575842 - SURFACE
      ?auto_2575843 - SURFACE
      ?auto_2575844 - SURFACE
      ?auto_2575845 - SURFACE
      ?auto_2575846 - SURFACE
      ?auto_2575847 - SURFACE
      ?auto_2575848 - SURFACE
      ?auto_2575849 - SURFACE
      ?auto_2575850 - SURFACE
      ?auto_2575851 - SURFACE
    )
    :vars
    (
      ?auto_2575855 - HOIST
      ?auto_2575854 - PLACE
      ?auto_2575856 - TRUCK
      ?auto_2575857 - PLACE
      ?auto_2575852 - HOIST
      ?auto_2575853 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575855 ?auto_2575854 ) ( SURFACE-AT ?auto_2575850 ?auto_2575854 ) ( CLEAR ?auto_2575850 ) ( IS-CRATE ?auto_2575851 ) ( not ( = ?auto_2575850 ?auto_2575851 ) ) ( AVAILABLE ?auto_2575855 ) ( ON ?auto_2575850 ?auto_2575849 ) ( not ( = ?auto_2575849 ?auto_2575850 ) ) ( not ( = ?auto_2575849 ?auto_2575851 ) ) ( TRUCK-AT ?auto_2575856 ?auto_2575857 ) ( not ( = ?auto_2575857 ?auto_2575854 ) ) ( HOIST-AT ?auto_2575852 ?auto_2575857 ) ( not ( = ?auto_2575855 ?auto_2575852 ) ) ( AVAILABLE ?auto_2575852 ) ( SURFACE-AT ?auto_2575851 ?auto_2575857 ) ( ON ?auto_2575851 ?auto_2575853 ) ( CLEAR ?auto_2575851 ) ( not ( = ?auto_2575850 ?auto_2575853 ) ) ( not ( = ?auto_2575851 ?auto_2575853 ) ) ( not ( = ?auto_2575849 ?auto_2575853 ) ) ( ON ?auto_2575839 ?auto_2575838 ) ( ON ?auto_2575840 ?auto_2575839 ) ( ON ?auto_2575841 ?auto_2575840 ) ( ON ?auto_2575842 ?auto_2575841 ) ( ON ?auto_2575843 ?auto_2575842 ) ( ON ?auto_2575844 ?auto_2575843 ) ( ON ?auto_2575845 ?auto_2575844 ) ( ON ?auto_2575846 ?auto_2575845 ) ( ON ?auto_2575847 ?auto_2575846 ) ( ON ?auto_2575848 ?auto_2575847 ) ( ON ?auto_2575849 ?auto_2575848 ) ( not ( = ?auto_2575838 ?auto_2575839 ) ) ( not ( = ?auto_2575838 ?auto_2575840 ) ) ( not ( = ?auto_2575838 ?auto_2575841 ) ) ( not ( = ?auto_2575838 ?auto_2575842 ) ) ( not ( = ?auto_2575838 ?auto_2575843 ) ) ( not ( = ?auto_2575838 ?auto_2575844 ) ) ( not ( = ?auto_2575838 ?auto_2575845 ) ) ( not ( = ?auto_2575838 ?auto_2575846 ) ) ( not ( = ?auto_2575838 ?auto_2575847 ) ) ( not ( = ?auto_2575838 ?auto_2575848 ) ) ( not ( = ?auto_2575838 ?auto_2575849 ) ) ( not ( = ?auto_2575838 ?auto_2575850 ) ) ( not ( = ?auto_2575838 ?auto_2575851 ) ) ( not ( = ?auto_2575838 ?auto_2575853 ) ) ( not ( = ?auto_2575839 ?auto_2575840 ) ) ( not ( = ?auto_2575839 ?auto_2575841 ) ) ( not ( = ?auto_2575839 ?auto_2575842 ) ) ( not ( = ?auto_2575839 ?auto_2575843 ) ) ( not ( = ?auto_2575839 ?auto_2575844 ) ) ( not ( = ?auto_2575839 ?auto_2575845 ) ) ( not ( = ?auto_2575839 ?auto_2575846 ) ) ( not ( = ?auto_2575839 ?auto_2575847 ) ) ( not ( = ?auto_2575839 ?auto_2575848 ) ) ( not ( = ?auto_2575839 ?auto_2575849 ) ) ( not ( = ?auto_2575839 ?auto_2575850 ) ) ( not ( = ?auto_2575839 ?auto_2575851 ) ) ( not ( = ?auto_2575839 ?auto_2575853 ) ) ( not ( = ?auto_2575840 ?auto_2575841 ) ) ( not ( = ?auto_2575840 ?auto_2575842 ) ) ( not ( = ?auto_2575840 ?auto_2575843 ) ) ( not ( = ?auto_2575840 ?auto_2575844 ) ) ( not ( = ?auto_2575840 ?auto_2575845 ) ) ( not ( = ?auto_2575840 ?auto_2575846 ) ) ( not ( = ?auto_2575840 ?auto_2575847 ) ) ( not ( = ?auto_2575840 ?auto_2575848 ) ) ( not ( = ?auto_2575840 ?auto_2575849 ) ) ( not ( = ?auto_2575840 ?auto_2575850 ) ) ( not ( = ?auto_2575840 ?auto_2575851 ) ) ( not ( = ?auto_2575840 ?auto_2575853 ) ) ( not ( = ?auto_2575841 ?auto_2575842 ) ) ( not ( = ?auto_2575841 ?auto_2575843 ) ) ( not ( = ?auto_2575841 ?auto_2575844 ) ) ( not ( = ?auto_2575841 ?auto_2575845 ) ) ( not ( = ?auto_2575841 ?auto_2575846 ) ) ( not ( = ?auto_2575841 ?auto_2575847 ) ) ( not ( = ?auto_2575841 ?auto_2575848 ) ) ( not ( = ?auto_2575841 ?auto_2575849 ) ) ( not ( = ?auto_2575841 ?auto_2575850 ) ) ( not ( = ?auto_2575841 ?auto_2575851 ) ) ( not ( = ?auto_2575841 ?auto_2575853 ) ) ( not ( = ?auto_2575842 ?auto_2575843 ) ) ( not ( = ?auto_2575842 ?auto_2575844 ) ) ( not ( = ?auto_2575842 ?auto_2575845 ) ) ( not ( = ?auto_2575842 ?auto_2575846 ) ) ( not ( = ?auto_2575842 ?auto_2575847 ) ) ( not ( = ?auto_2575842 ?auto_2575848 ) ) ( not ( = ?auto_2575842 ?auto_2575849 ) ) ( not ( = ?auto_2575842 ?auto_2575850 ) ) ( not ( = ?auto_2575842 ?auto_2575851 ) ) ( not ( = ?auto_2575842 ?auto_2575853 ) ) ( not ( = ?auto_2575843 ?auto_2575844 ) ) ( not ( = ?auto_2575843 ?auto_2575845 ) ) ( not ( = ?auto_2575843 ?auto_2575846 ) ) ( not ( = ?auto_2575843 ?auto_2575847 ) ) ( not ( = ?auto_2575843 ?auto_2575848 ) ) ( not ( = ?auto_2575843 ?auto_2575849 ) ) ( not ( = ?auto_2575843 ?auto_2575850 ) ) ( not ( = ?auto_2575843 ?auto_2575851 ) ) ( not ( = ?auto_2575843 ?auto_2575853 ) ) ( not ( = ?auto_2575844 ?auto_2575845 ) ) ( not ( = ?auto_2575844 ?auto_2575846 ) ) ( not ( = ?auto_2575844 ?auto_2575847 ) ) ( not ( = ?auto_2575844 ?auto_2575848 ) ) ( not ( = ?auto_2575844 ?auto_2575849 ) ) ( not ( = ?auto_2575844 ?auto_2575850 ) ) ( not ( = ?auto_2575844 ?auto_2575851 ) ) ( not ( = ?auto_2575844 ?auto_2575853 ) ) ( not ( = ?auto_2575845 ?auto_2575846 ) ) ( not ( = ?auto_2575845 ?auto_2575847 ) ) ( not ( = ?auto_2575845 ?auto_2575848 ) ) ( not ( = ?auto_2575845 ?auto_2575849 ) ) ( not ( = ?auto_2575845 ?auto_2575850 ) ) ( not ( = ?auto_2575845 ?auto_2575851 ) ) ( not ( = ?auto_2575845 ?auto_2575853 ) ) ( not ( = ?auto_2575846 ?auto_2575847 ) ) ( not ( = ?auto_2575846 ?auto_2575848 ) ) ( not ( = ?auto_2575846 ?auto_2575849 ) ) ( not ( = ?auto_2575846 ?auto_2575850 ) ) ( not ( = ?auto_2575846 ?auto_2575851 ) ) ( not ( = ?auto_2575846 ?auto_2575853 ) ) ( not ( = ?auto_2575847 ?auto_2575848 ) ) ( not ( = ?auto_2575847 ?auto_2575849 ) ) ( not ( = ?auto_2575847 ?auto_2575850 ) ) ( not ( = ?auto_2575847 ?auto_2575851 ) ) ( not ( = ?auto_2575847 ?auto_2575853 ) ) ( not ( = ?auto_2575848 ?auto_2575849 ) ) ( not ( = ?auto_2575848 ?auto_2575850 ) ) ( not ( = ?auto_2575848 ?auto_2575851 ) ) ( not ( = ?auto_2575848 ?auto_2575853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2575849 ?auto_2575850 ?auto_2575851 )
      ( MAKE-13CRATE-VERIFY ?auto_2575838 ?auto_2575839 ?auto_2575840 ?auto_2575841 ?auto_2575842 ?auto_2575843 ?auto_2575844 ?auto_2575845 ?auto_2575846 ?auto_2575847 ?auto_2575848 ?auto_2575849 ?auto_2575850 ?auto_2575851 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576021 - SURFACE
      ?auto_2576022 - SURFACE
      ?auto_2576023 - SURFACE
      ?auto_2576024 - SURFACE
      ?auto_2576025 - SURFACE
      ?auto_2576026 - SURFACE
      ?auto_2576027 - SURFACE
      ?auto_2576028 - SURFACE
      ?auto_2576029 - SURFACE
      ?auto_2576030 - SURFACE
      ?auto_2576031 - SURFACE
      ?auto_2576032 - SURFACE
      ?auto_2576033 - SURFACE
      ?auto_2576034 - SURFACE
    )
    :vars
    (
      ?auto_2576035 - HOIST
      ?auto_2576039 - PLACE
      ?auto_2576037 - PLACE
      ?auto_2576040 - HOIST
      ?auto_2576038 - SURFACE
      ?auto_2576036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576035 ?auto_2576039 ) ( SURFACE-AT ?auto_2576033 ?auto_2576039 ) ( CLEAR ?auto_2576033 ) ( IS-CRATE ?auto_2576034 ) ( not ( = ?auto_2576033 ?auto_2576034 ) ) ( AVAILABLE ?auto_2576035 ) ( ON ?auto_2576033 ?auto_2576032 ) ( not ( = ?auto_2576032 ?auto_2576033 ) ) ( not ( = ?auto_2576032 ?auto_2576034 ) ) ( not ( = ?auto_2576037 ?auto_2576039 ) ) ( HOIST-AT ?auto_2576040 ?auto_2576037 ) ( not ( = ?auto_2576035 ?auto_2576040 ) ) ( AVAILABLE ?auto_2576040 ) ( SURFACE-AT ?auto_2576034 ?auto_2576037 ) ( ON ?auto_2576034 ?auto_2576038 ) ( CLEAR ?auto_2576034 ) ( not ( = ?auto_2576033 ?auto_2576038 ) ) ( not ( = ?auto_2576034 ?auto_2576038 ) ) ( not ( = ?auto_2576032 ?auto_2576038 ) ) ( TRUCK-AT ?auto_2576036 ?auto_2576039 ) ( ON ?auto_2576022 ?auto_2576021 ) ( ON ?auto_2576023 ?auto_2576022 ) ( ON ?auto_2576024 ?auto_2576023 ) ( ON ?auto_2576025 ?auto_2576024 ) ( ON ?auto_2576026 ?auto_2576025 ) ( ON ?auto_2576027 ?auto_2576026 ) ( ON ?auto_2576028 ?auto_2576027 ) ( ON ?auto_2576029 ?auto_2576028 ) ( ON ?auto_2576030 ?auto_2576029 ) ( ON ?auto_2576031 ?auto_2576030 ) ( ON ?auto_2576032 ?auto_2576031 ) ( not ( = ?auto_2576021 ?auto_2576022 ) ) ( not ( = ?auto_2576021 ?auto_2576023 ) ) ( not ( = ?auto_2576021 ?auto_2576024 ) ) ( not ( = ?auto_2576021 ?auto_2576025 ) ) ( not ( = ?auto_2576021 ?auto_2576026 ) ) ( not ( = ?auto_2576021 ?auto_2576027 ) ) ( not ( = ?auto_2576021 ?auto_2576028 ) ) ( not ( = ?auto_2576021 ?auto_2576029 ) ) ( not ( = ?auto_2576021 ?auto_2576030 ) ) ( not ( = ?auto_2576021 ?auto_2576031 ) ) ( not ( = ?auto_2576021 ?auto_2576032 ) ) ( not ( = ?auto_2576021 ?auto_2576033 ) ) ( not ( = ?auto_2576021 ?auto_2576034 ) ) ( not ( = ?auto_2576021 ?auto_2576038 ) ) ( not ( = ?auto_2576022 ?auto_2576023 ) ) ( not ( = ?auto_2576022 ?auto_2576024 ) ) ( not ( = ?auto_2576022 ?auto_2576025 ) ) ( not ( = ?auto_2576022 ?auto_2576026 ) ) ( not ( = ?auto_2576022 ?auto_2576027 ) ) ( not ( = ?auto_2576022 ?auto_2576028 ) ) ( not ( = ?auto_2576022 ?auto_2576029 ) ) ( not ( = ?auto_2576022 ?auto_2576030 ) ) ( not ( = ?auto_2576022 ?auto_2576031 ) ) ( not ( = ?auto_2576022 ?auto_2576032 ) ) ( not ( = ?auto_2576022 ?auto_2576033 ) ) ( not ( = ?auto_2576022 ?auto_2576034 ) ) ( not ( = ?auto_2576022 ?auto_2576038 ) ) ( not ( = ?auto_2576023 ?auto_2576024 ) ) ( not ( = ?auto_2576023 ?auto_2576025 ) ) ( not ( = ?auto_2576023 ?auto_2576026 ) ) ( not ( = ?auto_2576023 ?auto_2576027 ) ) ( not ( = ?auto_2576023 ?auto_2576028 ) ) ( not ( = ?auto_2576023 ?auto_2576029 ) ) ( not ( = ?auto_2576023 ?auto_2576030 ) ) ( not ( = ?auto_2576023 ?auto_2576031 ) ) ( not ( = ?auto_2576023 ?auto_2576032 ) ) ( not ( = ?auto_2576023 ?auto_2576033 ) ) ( not ( = ?auto_2576023 ?auto_2576034 ) ) ( not ( = ?auto_2576023 ?auto_2576038 ) ) ( not ( = ?auto_2576024 ?auto_2576025 ) ) ( not ( = ?auto_2576024 ?auto_2576026 ) ) ( not ( = ?auto_2576024 ?auto_2576027 ) ) ( not ( = ?auto_2576024 ?auto_2576028 ) ) ( not ( = ?auto_2576024 ?auto_2576029 ) ) ( not ( = ?auto_2576024 ?auto_2576030 ) ) ( not ( = ?auto_2576024 ?auto_2576031 ) ) ( not ( = ?auto_2576024 ?auto_2576032 ) ) ( not ( = ?auto_2576024 ?auto_2576033 ) ) ( not ( = ?auto_2576024 ?auto_2576034 ) ) ( not ( = ?auto_2576024 ?auto_2576038 ) ) ( not ( = ?auto_2576025 ?auto_2576026 ) ) ( not ( = ?auto_2576025 ?auto_2576027 ) ) ( not ( = ?auto_2576025 ?auto_2576028 ) ) ( not ( = ?auto_2576025 ?auto_2576029 ) ) ( not ( = ?auto_2576025 ?auto_2576030 ) ) ( not ( = ?auto_2576025 ?auto_2576031 ) ) ( not ( = ?auto_2576025 ?auto_2576032 ) ) ( not ( = ?auto_2576025 ?auto_2576033 ) ) ( not ( = ?auto_2576025 ?auto_2576034 ) ) ( not ( = ?auto_2576025 ?auto_2576038 ) ) ( not ( = ?auto_2576026 ?auto_2576027 ) ) ( not ( = ?auto_2576026 ?auto_2576028 ) ) ( not ( = ?auto_2576026 ?auto_2576029 ) ) ( not ( = ?auto_2576026 ?auto_2576030 ) ) ( not ( = ?auto_2576026 ?auto_2576031 ) ) ( not ( = ?auto_2576026 ?auto_2576032 ) ) ( not ( = ?auto_2576026 ?auto_2576033 ) ) ( not ( = ?auto_2576026 ?auto_2576034 ) ) ( not ( = ?auto_2576026 ?auto_2576038 ) ) ( not ( = ?auto_2576027 ?auto_2576028 ) ) ( not ( = ?auto_2576027 ?auto_2576029 ) ) ( not ( = ?auto_2576027 ?auto_2576030 ) ) ( not ( = ?auto_2576027 ?auto_2576031 ) ) ( not ( = ?auto_2576027 ?auto_2576032 ) ) ( not ( = ?auto_2576027 ?auto_2576033 ) ) ( not ( = ?auto_2576027 ?auto_2576034 ) ) ( not ( = ?auto_2576027 ?auto_2576038 ) ) ( not ( = ?auto_2576028 ?auto_2576029 ) ) ( not ( = ?auto_2576028 ?auto_2576030 ) ) ( not ( = ?auto_2576028 ?auto_2576031 ) ) ( not ( = ?auto_2576028 ?auto_2576032 ) ) ( not ( = ?auto_2576028 ?auto_2576033 ) ) ( not ( = ?auto_2576028 ?auto_2576034 ) ) ( not ( = ?auto_2576028 ?auto_2576038 ) ) ( not ( = ?auto_2576029 ?auto_2576030 ) ) ( not ( = ?auto_2576029 ?auto_2576031 ) ) ( not ( = ?auto_2576029 ?auto_2576032 ) ) ( not ( = ?auto_2576029 ?auto_2576033 ) ) ( not ( = ?auto_2576029 ?auto_2576034 ) ) ( not ( = ?auto_2576029 ?auto_2576038 ) ) ( not ( = ?auto_2576030 ?auto_2576031 ) ) ( not ( = ?auto_2576030 ?auto_2576032 ) ) ( not ( = ?auto_2576030 ?auto_2576033 ) ) ( not ( = ?auto_2576030 ?auto_2576034 ) ) ( not ( = ?auto_2576030 ?auto_2576038 ) ) ( not ( = ?auto_2576031 ?auto_2576032 ) ) ( not ( = ?auto_2576031 ?auto_2576033 ) ) ( not ( = ?auto_2576031 ?auto_2576034 ) ) ( not ( = ?auto_2576031 ?auto_2576038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576032 ?auto_2576033 ?auto_2576034 )
      ( MAKE-13CRATE-VERIFY ?auto_2576021 ?auto_2576022 ?auto_2576023 ?auto_2576024 ?auto_2576025 ?auto_2576026 ?auto_2576027 ?auto_2576028 ?auto_2576029 ?auto_2576030 ?auto_2576031 ?auto_2576032 ?auto_2576033 ?auto_2576034 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576204 - SURFACE
      ?auto_2576205 - SURFACE
      ?auto_2576206 - SURFACE
      ?auto_2576207 - SURFACE
      ?auto_2576208 - SURFACE
      ?auto_2576209 - SURFACE
      ?auto_2576210 - SURFACE
      ?auto_2576211 - SURFACE
      ?auto_2576212 - SURFACE
      ?auto_2576213 - SURFACE
      ?auto_2576214 - SURFACE
      ?auto_2576215 - SURFACE
      ?auto_2576216 - SURFACE
      ?auto_2576217 - SURFACE
    )
    :vars
    (
      ?auto_2576219 - HOIST
      ?auto_2576221 - PLACE
      ?auto_2576222 - PLACE
      ?auto_2576218 - HOIST
      ?auto_2576220 - SURFACE
      ?auto_2576223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576219 ?auto_2576221 ) ( IS-CRATE ?auto_2576217 ) ( not ( = ?auto_2576216 ?auto_2576217 ) ) ( not ( = ?auto_2576215 ?auto_2576216 ) ) ( not ( = ?auto_2576215 ?auto_2576217 ) ) ( not ( = ?auto_2576222 ?auto_2576221 ) ) ( HOIST-AT ?auto_2576218 ?auto_2576222 ) ( not ( = ?auto_2576219 ?auto_2576218 ) ) ( AVAILABLE ?auto_2576218 ) ( SURFACE-AT ?auto_2576217 ?auto_2576222 ) ( ON ?auto_2576217 ?auto_2576220 ) ( CLEAR ?auto_2576217 ) ( not ( = ?auto_2576216 ?auto_2576220 ) ) ( not ( = ?auto_2576217 ?auto_2576220 ) ) ( not ( = ?auto_2576215 ?auto_2576220 ) ) ( TRUCK-AT ?auto_2576223 ?auto_2576221 ) ( SURFACE-AT ?auto_2576215 ?auto_2576221 ) ( CLEAR ?auto_2576215 ) ( LIFTING ?auto_2576219 ?auto_2576216 ) ( IS-CRATE ?auto_2576216 ) ( ON ?auto_2576205 ?auto_2576204 ) ( ON ?auto_2576206 ?auto_2576205 ) ( ON ?auto_2576207 ?auto_2576206 ) ( ON ?auto_2576208 ?auto_2576207 ) ( ON ?auto_2576209 ?auto_2576208 ) ( ON ?auto_2576210 ?auto_2576209 ) ( ON ?auto_2576211 ?auto_2576210 ) ( ON ?auto_2576212 ?auto_2576211 ) ( ON ?auto_2576213 ?auto_2576212 ) ( ON ?auto_2576214 ?auto_2576213 ) ( ON ?auto_2576215 ?auto_2576214 ) ( not ( = ?auto_2576204 ?auto_2576205 ) ) ( not ( = ?auto_2576204 ?auto_2576206 ) ) ( not ( = ?auto_2576204 ?auto_2576207 ) ) ( not ( = ?auto_2576204 ?auto_2576208 ) ) ( not ( = ?auto_2576204 ?auto_2576209 ) ) ( not ( = ?auto_2576204 ?auto_2576210 ) ) ( not ( = ?auto_2576204 ?auto_2576211 ) ) ( not ( = ?auto_2576204 ?auto_2576212 ) ) ( not ( = ?auto_2576204 ?auto_2576213 ) ) ( not ( = ?auto_2576204 ?auto_2576214 ) ) ( not ( = ?auto_2576204 ?auto_2576215 ) ) ( not ( = ?auto_2576204 ?auto_2576216 ) ) ( not ( = ?auto_2576204 ?auto_2576217 ) ) ( not ( = ?auto_2576204 ?auto_2576220 ) ) ( not ( = ?auto_2576205 ?auto_2576206 ) ) ( not ( = ?auto_2576205 ?auto_2576207 ) ) ( not ( = ?auto_2576205 ?auto_2576208 ) ) ( not ( = ?auto_2576205 ?auto_2576209 ) ) ( not ( = ?auto_2576205 ?auto_2576210 ) ) ( not ( = ?auto_2576205 ?auto_2576211 ) ) ( not ( = ?auto_2576205 ?auto_2576212 ) ) ( not ( = ?auto_2576205 ?auto_2576213 ) ) ( not ( = ?auto_2576205 ?auto_2576214 ) ) ( not ( = ?auto_2576205 ?auto_2576215 ) ) ( not ( = ?auto_2576205 ?auto_2576216 ) ) ( not ( = ?auto_2576205 ?auto_2576217 ) ) ( not ( = ?auto_2576205 ?auto_2576220 ) ) ( not ( = ?auto_2576206 ?auto_2576207 ) ) ( not ( = ?auto_2576206 ?auto_2576208 ) ) ( not ( = ?auto_2576206 ?auto_2576209 ) ) ( not ( = ?auto_2576206 ?auto_2576210 ) ) ( not ( = ?auto_2576206 ?auto_2576211 ) ) ( not ( = ?auto_2576206 ?auto_2576212 ) ) ( not ( = ?auto_2576206 ?auto_2576213 ) ) ( not ( = ?auto_2576206 ?auto_2576214 ) ) ( not ( = ?auto_2576206 ?auto_2576215 ) ) ( not ( = ?auto_2576206 ?auto_2576216 ) ) ( not ( = ?auto_2576206 ?auto_2576217 ) ) ( not ( = ?auto_2576206 ?auto_2576220 ) ) ( not ( = ?auto_2576207 ?auto_2576208 ) ) ( not ( = ?auto_2576207 ?auto_2576209 ) ) ( not ( = ?auto_2576207 ?auto_2576210 ) ) ( not ( = ?auto_2576207 ?auto_2576211 ) ) ( not ( = ?auto_2576207 ?auto_2576212 ) ) ( not ( = ?auto_2576207 ?auto_2576213 ) ) ( not ( = ?auto_2576207 ?auto_2576214 ) ) ( not ( = ?auto_2576207 ?auto_2576215 ) ) ( not ( = ?auto_2576207 ?auto_2576216 ) ) ( not ( = ?auto_2576207 ?auto_2576217 ) ) ( not ( = ?auto_2576207 ?auto_2576220 ) ) ( not ( = ?auto_2576208 ?auto_2576209 ) ) ( not ( = ?auto_2576208 ?auto_2576210 ) ) ( not ( = ?auto_2576208 ?auto_2576211 ) ) ( not ( = ?auto_2576208 ?auto_2576212 ) ) ( not ( = ?auto_2576208 ?auto_2576213 ) ) ( not ( = ?auto_2576208 ?auto_2576214 ) ) ( not ( = ?auto_2576208 ?auto_2576215 ) ) ( not ( = ?auto_2576208 ?auto_2576216 ) ) ( not ( = ?auto_2576208 ?auto_2576217 ) ) ( not ( = ?auto_2576208 ?auto_2576220 ) ) ( not ( = ?auto_2576209 ?auto_2576210 ) ) ( not ( = ?auto_2576209 ?auto_2576211 ) ) ( not ( = ?auto_2576209 ?auto_2576212 ) ) ( not ( = ?auto_2576209 ?auto_2576213 ) ) ( not ( = ?auto_2576209 ?auto_2576214 ) ) ( not ( = ?auto_2576209 ?auto_2576215 ) ) ( not ( = ?auto_2576209 ?auto_2576216 ) ) ( not ( = ?auto_2576209 ?auto_2576217 ) ) ( not ( = ?auto_2576209 ?auto_2576220 ) ) ( not ( = ?auto_2576210 ?auto_2576211 ) ) ( not ( = ?auto_2576210 ?auto_2576212 ) ) ( not ( = ?auto_2576210 ?auto_2576213 ) ) ( not ( = ?auto_2576210 ?auto_2576214 ) ) ( not ( = ?auto_2576210 ?auto_2576215 ) ) ( not ( = ?auto_2576210 ?auto_2576216 ) ) ( not ( = ?auto_2576210 ?auto_2576217 ) ) ( not ( = ?auto_2576210 ?auto_2576220 ) ) ( not ( = ?auto_2576211 ?auto_2576212 ) ) ( not ( = ?auto_2576211 ?auto_2576213 ) ) ( not ( = ?auto_2576211 ?auto_2576214 ) ) ( not ( = ?auto_2576211 ?auto_2576215 ) ) ( not ( = ?auto_2576211 ?auto_2576216 ) ) ( not ( = ?auto_2576211 ?auto_2576217 ) ) ( not ( = ?auto_2576211 ?auto_2576220 ) ) ( not ( = ?auto_2576212 ?auto_2576213 ) ) ( not ( = ?auto_2576212 ?auto_2576214 ) ) ( not ( = ?auto_2576212 ?auto_2576215 ) ) ( not ( = ?auto_2576212 ?auto_2576216 ) ) ( not ( = ?auto_2576212 ?auto_2576217 ) ) ( not ( = ?auto_2576212 ?auto_2576220 ) ) ( not ( = ?auto_2576213 ?auto_2576214 ) ) ( not ( = ?auto_2576213 ?auto_2576215 ) ) ( not ( = ?auto_2576213 ?auto_2576216 ) ) ( not ( = ?auto_2576213 ?auto_2576217 ) ) ( not ( = ?auto_2576213 ?auto_2576220 ) ) ( not ( = ?auto_2576214 ?auto_2576215 ) ) ( not ( = ?auto_2576214 ?auto_2576216 ) ) ( not ( = ?auto_2576214 ?auto_2576217 ) ) ( not ( = ?auto_2576214 ?auto_2576220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576215 ?auto_2576216 ?auto_2576217 )
      ( MAKE-13CRATE-VERIFY ?auto_2576204 ?auto_2576205 ?auto_2576206 ?auto_2576207 ?auto_2576208 ?auto_2576209 ?auto_2576210 ?auto_2576211 ?auto_2576212 ?auto_2576213 ?auto_2576214 ?auto_2576215 ?auto_2576216 ?auto_2576217 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2576387 - SURFACE
      ?auto_2576388 - SURFACE
      ?auto_2576389 - SURFACE
      ?auto_2576390 - SURFACE
      ?auto_2576391 - SURFACE
      ?auto_2576392 - SURFACE
      ?auto_2576393 - SURFACE
      ?auto_2576394 - SURFACE
      ?auto_2576395 - SURFACE
      ?auto_2576396 - SURFACE
      ?auto_2576397 - SURFACE
      ?auto_2576398 - SURFACE
      ?auto_2576399 - SURFACE
      ?auto_2576400 - SURFACE
    )
    :vars
    (
      ?auto_2576401 - HOIST
      ?auto_2576403 - PLACE
      ?auto_2576404 - PLACE
      ?auto_2576402 - HOIST
      ?auto_2576406 - SURFACE
      ?auto_2576405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2576401 ?auto_2576403 ) ( IS-CRATE ?auto_2576400 ) ( not ( = ?auto_2576399 ?auto_2576400 ) ) ( not ( = ?auto_2576398 ?auto_2576399 ) ) ( not ( = ?auto_2576398 ?auto_2576400 ) ) ( not ( = ?auto_2576404 ?auto_2576403 ) ) ( HOIST-AT ?auto_2576402 ?auto_2576404 ) ( not ( = ?auto_2576401 ?auto_2576402 ) ) ( AVAILABLE ?auto_2576402 ) ( SURFACE-AT ?auto_2576400 ?auto_2576404 ) ( ON ?auto_2576400 ?auto_2576406 ) ( CLEAR ?auto_2576400 ) ( not ( = ?auto_2576399 ?auto_2576406 ) ) ( not ( = ?auto_2576400 ?auto_2576406 ) ) ( not ( = ?auto_2576398 ?auto_2576406 ) ) ( TRUCK-AT ?auto_2576405 ?auto_2576403 ) ( SURFACE-AT ?auto_2576398 ?auto_2576403 ) ( CLEAR ?auto_2576398 ) ( IS-CRATE ?auto_2576399 ) ( AVAILABLE ?auto_2576401 ) ( IN ?auto_2576399 ?auto_2576405 ) ( ON ?auto_2576388 ?auto_2576387 ) ( ON ?auto_2576389 ?auto_2576388 ) ( ON ?auto_2576390 ?auto_2576389 ) ( ON ?auto_2576391 ?auto_2576390 ) ( ON ?auto_2576392 ?auto_2576391 ) ( ON ?auto_2576393 ?auto_2576392 ) ( ON ?auto_2576394 ?auto_2576393 ) ( ON ?auto_2576395 ?auto_2576394 ) ( ON ?auto_2576396 ?auto_2576395 ) ( ON ?auto_2576397 ?auto_2576396 ) ( ON ?auto_2576398 ?auto_2576397 ) ( not ( = ?auto_2576387 ?auto_2576388 ) ) ( not ( = ?auto_2576387 ?auto_2576389 ) ) ( not ( = ?auto_2576387 ?auto_2576390 ) ) ( not ( = ?auto_2576387 ?auto_2576391 ) ) ( not ( = ?auto_2576387 ?auto_2576392 ) ) ( not ( = ?auto_2576387 ?auto_2576393 ) ) ( not ( = ?auto_2576387 ?auto_2576394 ) ) ( not ( = ?auto_2576387 ?auto_2576395 ) ) ( not ( = ?auto_2576387 ?auto_2576396 ) ) ( not ( = ?auto_2576387 ?auto_2576397 ) ) ( not ( = ?auto_2576387 ?auto_2576398 ) ) ( not ( = ?auto_2576387 ?auto_2576399 ) ) ( not ( = ?auto_2576387 ?auto_2576400 ) ) ( not ( = ?auto_2576387 ?auto_2576406 ) ) ( not ( = ?auto_2576388 ?auto_2576389 ) ) ( not ( = ?auto_2576388 ?auto_2576390 ) ) ( not ( = ?auto_2576388 ?auto_2576391 ) ) ( not ( = ?auto_2576388 ?auto_2576392 ) ) ( not ( = ?auto_2576388 ?auto_2576393 ) ) ( not ( = ?auto_2576388 ?auto_2576394 ) ) ( not ( = ?auto_2576388 ?auto_2576395 ) ) ( not ( = ?auto_2576388 ?auto_2576396 ) ) ( not ( = ?auto_2576388 ?auto_2576397 ) ) ( not ( = ?auto_2576388 ?auto_2576398 ) ) ( not ( = ?auto_2576388 ?auto_2576399 ) ) ( not ( = ?auto_2576388 ?auto_2576400 ) ) ( not ( = ?auto_2576388 ?auto_2576406 ) ) ( not ( = ?auto_2576389 ?auto_2576390 ) ) ( not ( = ?auto_2576389 ?auto_2576391 ) ) ( not ( = ?auto_2576389 ?auto_2576392 ) ) ( not ( = ?auto_2576389 ?auto_2576393 ) ) ( not ( = ?auto_2576389 ?auto_2576394 ) ) ( not ( = ?auto_2576389 ?auto_2576395 ) ) ( not ( = ?auto_2576389 ?auto_2576396 ) ) ( not ( = ?auto_2576389 ?auto_2576397 ) ) ( not ( = ?auto_2576389 ?auto_2576398 ) ) ( not ( = ?auto_2576389 ?auto_2576399 ) ) ( not ( = ?auto_2576389 ?auto_2576400 ) ) ( not ( = ?auto_2576389 ?auto_2576406 ) ) ( not ( = ?auto_2576390 ?auto_2576391 ) ) ( not ( = ?auto_2576390 ?auto_2576392 ) ) ( not ( = ?auto_2576390 ?auto_2576393 ) ) ( not ( = ?auto_2576390 ?auto_2576394 ) ) ( not ( = ?auto_2576390 ?auto_2576395 ) ) ( not ( = ?auto_2576390 ?auto_2576396 ) ) ( not ( = ?auto_2576390 ?auto_2576397 ) ) ( not ( = ?auto_2576390 ?auto_2576398 ) ) ( not ( = ?auto_2576390 ?auto_2576399 ) ) ( not ( = ?auto_2576390 ?auto_2576400 ) ) ( not ( = ?auto_2576390 ?auto_2576406 ) ) ( not ( = ?auto_2576391 ?auto_2576392 ) ) ( not ( = ?auto_2576391 ?auto_2576393 ) ) ( not ( = ?auto_2576391 ?auto_2576394 ) ) ( not ( = ?auto_2576391 ?auto_2576395 ) ) ( not ( = ?auto_2576391 ?auto_2576396 ) ) ( not ( = ?auto_2576391 ?auto_2576397 ) ) ( not ( = ?auto_2576391 ?auto_2576398 ) ) ( not ( = ?auto_2576391 ?auto_2576399 ) ) ( not ( = ?auto_2576391 ?auto_2576400 ) ) ( not ( = ?auto_2576391 ?auto_2576406 ) ) ( not ( = ?auto_2576392 ?auto_2576393 ) ) ( not ( = ?auto_2576392 ?auto_2576394 ) ) ( not ( = ?auto_2576392 ?auto_2576395 ) ) ( not ( = ?auto_2576392 ?auto_2576396 ) ) ( not ( = ?auto_2576392 ?auto_2576397 ) ) ( not ( = ?auto_2576392 ?auto_2576398 ) ) ( not ( = ?auto_2576392 ?auto_2576399 ) ) ( not ( = ?auto_2576392 ?auto_2576400 ) ) ( not ( = ?auto_2576392 ?auto_2576406 ) ) ( not ( = ?auto_2576393 ?auto_2576394 ) ) ( not ( = ?auto_2576393 ?auto_2576395 ) ) ( not ( = ?auto_2576393 ?auto_2576396 ) ) ( not ( = ?auto_2576393 ?auto_2576397 ) ) ( not ( = ?auto_2576393 ?auto_2576398 ) ) ( not ( = ?auto_2576393 ?auto_2576399 ) ) ( not ( = ?auto_2576393 ?auto_2576400 ) ) ( not ( = ?auto_2576393 ?auto_2576406 ) ) ( not ( = ?auto_2576394 ?auto_2576395 ) ) ( not ( = ?auto_2576394 ?auto_2576396 ) ) ( not ( = ?auto_2576394 ?auto_2576397 ) ) ( not ( = ?auto_2576394 ?auto_2576398 ) ) ( not ( = ?auto_2576394 ?auto_2576399 ) ) ( not ( = ?auto_2576394 ?auto_2576400 ) ) ( not ( = ?auto_2576394 ?auto_2576406 ) ) ( not ( = ?auto_2576395 ?auto_2576396 ) ) ( not ( = ?auto_2576395 ?auto_2576397 ) ) ( not ( = ?auto_2576395 ?auto_2576398 ) ) ( not ( = ?auto_2576395 ?auto_2576399 ) ) ( not ( = ?auto_2576395 ?auto_2576400 ) ) ( not ( = ?auto_2576395 ?auto_2576406 ) ) ( not ( = ?auto_2576396 ?auto_2576397 ) ) ( not ( = ?auto_2576396 ?auto_2576398 ) ) ( not ( = ?auto_2576396 ?auto_2576399 ) ) ( not ( = ?auto_2576396 ?auto_2576400 ) ) ( not ( = ?auto_2576396 ?auto_2576406 ) ) ( not ( = ?auto_2576397 ?auto_2576398 ) ) ( not ( = ?auto_2576397 ?auto_2576399 ) ) ( not ( = ?auto_2576397 ?auto_2576400 ) ) ( not ( = ?auto_2576397 ?auto_2576406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2576398 ?auto_2576399 ?auto_2576400 )
      ( MAKE-13CRATE-VERIFY ?auto_2576387 ?auto_2576388 ?auto_2576389 ?auto_2576390 ?auto_2576391 ?auto_2576392 ?auto_2576393 ?auto_2576394 ?auto_2576395 ?auto_2576396 ?auto_2576397 ?auto_2576398 ?auto_2576399 ?auto_2576400 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2590576 - SURFACE
      ?auto_2590577 - SURFACE
      ?auto_2590578 - SURFACE
      ?auto_2590579 - SURFACE
      ?auto_2590580 - SURFACE
      ?auto_2590581 - SURFACE
      ?auto_2590582 - SURFACE
      ?auto_2590583 - SURFACE
      ?auto_2590584 - SURFACE
      ?auto_2590585 - SURFACE
      ?auto_2590586 - SURFACE
      ?auto_2590587 - SURFACE
      ?auto_2590588 - SURFACE
      ?auto_2590589 - SURFACE
      ?auto_2590590 - SURFACE
    )
    :vars
    (
      ?auto_2590592 - HOIST
      ?auto_2590591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590592 ?auto_2590591 ) ( SURFACE-AT ?auto_2590589 ?auto_2590591 ) ( CLEAR ?auto_2590589 ) ( LIFTING ?auto_2590592 ?auto_2590590 ) ( IS-CRATE ?auto_2590590 ) ( not ( = ?auto_2590589 ?auto_2590590 ) ) ( ON ?auto_2590577 ?auto_2590576 ) ( ON ?auto_2590578 ?auto_2590577 ) ( ON ?auto_2590579 ?auto_2590578 ) ( ON ?auto_2590580 ?auto_2590579 ) ( ON ?auto_2590581 ?auto_2590580 ) ( ON ?auto_2590582 ?auto_2590581 ) ( ON ?auto_2590583 ?auto_2590582 ) ( ON ?auto_2590584 ?auto_2590583 ) ( ON ?auto_2590585 ?auto_2590584 ) ( ON ?auto_2590586 ?auto_2590585 ) ( ON ?auto_2590587 ?auto_2590586 ) ( ON ?auto_2590588 ?auto_2590587 ) ( ON ?auto_2590589 ?auto_2590588 ) ( not ( = ?auto_2590576 ?auto_2590577 ) ) ( not ( = ?auto_2590576 ?auto_2590578 ) ) ( not ( = ?auto_2590576 ?auto_2590579 ) ) ( not ( = ?auto_2590576 ?auto_2590580 ) ) ( not ( = ?auto_2590576 ?auto_2590581 ) ) ( not ( = ?auto_2590576 ?auto_2590582 ) ) ( not ( = ?auto_2590576 ?auto_2590583 ) ) ( not ( = ?auto_2590576 ?auto_2590584 ) ) ( not ( = ?auto_2590576 ?auto_2590585 ) ) ( not ( = ?auto_2590576 ?auto_2590586 ) ) ( not ( = ?auto_2590576 ?auto_2590587 ) ) ( not ( = ?auto_2590576 ?auto_2590588 ) ) ( not ( = ?auto_2590576 ?auto_2590589 ) ) ( not ( = ?auto_2590576 ?auto_2590590 ) ) ( not ( = ?auto_2590577 ?auto_2590578 ) ) ( not ( = ?auto_2590577 ?auto_2590579 ) ) ( not ( = ?auto_2590577 ?auto_2590580 ) ) ( not ( = ?auto_2590577 ?auto_2590581 ) ) ( not ( = ?auto_2590577 ?auto_2590582 ) ) ( not ( = ?auto_2590577 ?auto_2590583 ) ) ( not ( = ?auto_2590577 ?auto_2590584 ) ) ( not ( = ?auto_2590577 ?auto_2590585 ) ) ( not ( = ?auto_2590577 ?auto_2590586 ) ) ( not ( = ?auto_2590577 ?auto_2590587 ) ) ( not ( = ?auto_2590577 ?auto_2590588 ) ) ( not ( = ?auto_2590577 ?auto_2590589 ) ) ( not ( = ?auto_2590577 ?auto_2590590 ) ) ( not ( = ?auto_2590578 ?auto_2590579 ) ) ( not ( = ?auto_2590578 ?auto_2590580 ) ) ( not ( = ?auto_2590578 ?auto_2590581 ) ) ( not ( = ?auto_2590578 ?auto_2590582 ) ) ( not ( = ?auto_2590578 ?auto_2590583 ) ) ( not ( = ?auto_2590578 ?auto_2590584 ) ) ( not ( = ?auto_2590578 ?auto_2590585 ) ) ( not ( = ?auto_2590578 ?auto_2590586 ) ) ( not ( = ?auto_2590578 ?auto_2590587 ) ) ( not ( = ?auto_2590578 ?auto_2590588 ) ) ( not ( = ?auto_2590578 ?auto_2590589 ) ) ( not ( = ?auto_2590578 ?auto_2590590 ) ) ( not ( = ?auto_2590579 ?auto_2590580 ) ) ( not ( = ?auto_2590579 ?auto_2590581 ) ) ( not ( = ?auto_2590579 ?auto_2590582 ) ) ( not ( = ?auto_2590579 ?auto_2590583 ) ) ( not ( = ?auto_2590579 ?auto_2590584 ) ) ( not ( = ?auto_2590579 ?auto_2590585 ) ) ( not ( = ?auto_2590579 ?auto_2590586 ) ) ( not ( = ?auto_2590579 ?auto_2590587 ) ) ( not ( = ?auto_2590579 ?auto_2590588 ) ) ( not ( = ?auto_2590579 ?auto_2590589 ) ) ( not ( = ?auto_2590579 ?auto_2590590 ) ) ( not ( = ?auto_2590580 ?auto_2590581 ) ) ( not ( = ?auto_2590580 ?auto_2590582 ) ) ( not ( = ?auto_2590580 ?auto_2590583 ) ) ( not ( = ?auto_2590580 ?auto_2590584 ) ) ( not ( = ?auto_2590580 ?auto_2590585 ) ) ( not ( = ?auto_2590580 ?auto_2590586 ) ) ( not ( = ?auto_2590580 ?auto_2590587 ) ) ( not ( = ?auto_2590580 ?auto_2590588 ) ) ( not ( = ?auto_2590580 ?auto_2590589 ) ) ( not ( = ?auto_2590580 ?auto_2590590 ) ) ( not ( = ?auto_2590581 ?auto_2590582 ) ) ( not ( = ?auto_2590581 ?auto_2590583 ) ) ( not ( = ?auto_2590581 ?auto_2590584 ) ) ( not ( = ?auto_2590581 ?auto_2590585 ) ) ( not ( = ?auto_2590581 ?auto_2590586 ) ) ( not ( = ?auto_2590581 ?auto_2590587 ) ) ( not ( = ?auto_2590581 ?auto_2590588 ) ) ( not ( = ?auto_2590581 ?auto_2590589 ) ) ( not ( = ?auto_2590581 ?auto_2590590 ) ) ( not ( = ?auto_2590582 ?auto_2590583 ) ) ( not ( = ?auto_2590582 ?auto_2590584 ) ) ( not ( = ?auto_2590582 ?auto_2590585 ) ) ( not ( = ?auto_2590582 ?auto_2590586 ) ) ( not ( = ?auto_2590582 ?auto_2590587 ) ) ( not ( = ?auto_2590582 ?auto_2590588 ) ) ( not ( = ?auto_2590582 ?auto_2590589 ) ) ( not ( = ?auto_2590582 ?auto_2590590 ) ) ( not ( = ?auto_2590583 ?auto_2590584 ) ) ( not ( = ?auto_2590583 ?auto_2590585 ) ) ( not ( = ?auto_2590583 ?auto_2590586 ) ) ( not ( = ?auto_2590583 ?auto_2590587 ) ) ( not ( = ?auto_2590583 ?auto_2590588 ) ) ( not ( = ?auto_2590583 ?auto_2590589 ) ) ( not ( = ?auto_2590583 ?auto_2590590 ) ) ( not ( = ?auto_2590584 ?auto_2590585 ) ) ( not ( = ?auto_2590584 ?auto_2590586 ) ) ( not ( = ?auto_2590584 ?auto_2590587 ) ) ( not ( = ?auto_2590584 ?auto_2590588 ) ) ( not ( = ?auto_2590584 ?auto_2590589 ) ) ( not ( = ?auto_2590584 ?auto_2590590 ) ) ( not ( = ?auto_2590585 ?auto_2590586 ) ) ( not ( = ?auto_2590585 ?auto_2590587 ) ) ( not ( = ?auto_2590585 ?auto_2590588 ) ) ( not ( = ?auto_2590585 ?auto_2590589 ) ) ( not ( = ?auto_2590585 ?auto_2590590 ) ) ( not ( = ?auto_2590586 ?auto_2590587 ) ) ( not ( = ?auto_2590586 ?auto_2590588 ) ) ( not ( = ?auto_2590586 ?auto_2590589 ) ) ( not ( = ?auto_2590586 ?auto_2590590 ) ) ( not ( = ?auto_2590587 ?auto_2590588 ) ) ( not ( = ?auto_2590587 ?auto_2590589 ) ) ( not ( = ?auto_2590587 ?auto_2590590 ) ) ( not ( = ?auto_2590588 ?auto_2590589 ) ) ( not ( = ?auto_2590588 ?auto_2590590 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2590589 ?auto_2590590 )
      ( MAKE-14CRATE-VERIFY ?auto_2590576 ?auto_2590577 ?auto_2590578 ?auto_2590579 ?auto_2590580 ?auto_2590581 ?auto_2590582 ?auto_2590583 ?auto_2590584 ?auto_2590585 ?auto_2590586 ?auto_2590587 ?auto_2590588 ?auto_2590589 ?auto_2590590 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2590736 - SURFACE
      ?auto_2590737 - SURFACE
      ?auto_2590738 - SURFACE
      ?auto_2590739 - SURFACE
      ?auto_2590740 - SURFACE
      ?auto_2590741 - SURFACE
      ?auto_2590742 - SURFACE
      ?auto_2590743 - SURFACE
      ?auto_2590744 - SURFACE
      ?auto_2590745 - SURFACE
      ?auto_2590746 - SURFACE
      ?auto_2590747 - SURFACE
      ?auto_2590748 - SURFACE
      ?auto_2590749 - SURFACE
      ?auto_2590750 - SURFACE
    )
    :vars
    (
      ?auto_2590753 - HOIST
      ?auto_2590751 - PLACE
      ?auto_2590752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590753 ?auto_2590751 ) ( SURFACE-AT ?auto_2590749 ?auto_2590751 ) ( CLEAR ?auto_2590749 ) ( IS-CRATE ?auto_2590750 ) ( not ( = ?auto_2590749 ?auto_2590750 ) ) ( TRUCK-AT ?auto_2590752 ?auto_2590751 ) ( AVAILABLE ?auto_2590753 ) ( IN ?auto_2590750 ?auto_2590752 ) ( ON ?auto_2590749 ?auto_2590748 ) ( not ( = ?auto_2590748 ?auto_2590749 ) ) ( not ( = ?auto_2590748 ?auto_2590750 ) ) ( ON ?auto_2590737 ?auto_2590736 ) ( ON ?auto_2590738 ?auto_2590737 ) ( ON ?auto_2590739 ?auto_2590738 ) ( ON ?auto_2590740 ?auto_2590739 ) ( ON ?auto_2590741 ?auto_2590740 ) ( ON ?auto_2590742 ?auto_2590741 ) ( ON ?auto_2590743 ?auto_2590742 ) ( ON ?auto_2590744 ?auto_2590743 ) ( ON ?auto_2590745 ?auto_2590744 ) ( ON ?auto_2590746 ?auto_2590745 ) ( ON ?auto_2590747 ?auto_2590746 ) ( ON ?auto_2590748 ?auto_2590747 ) ( not ( = ?auto_2590736 ?auto_2590737 ) ) ( not ( = ?auto_2590736 ?auto_2590738 ) ) ( not ( = ?auto_2590736 ?auto_2590739 ) ) ( not ( = ?auto_2590736 ?auto_2590740 ) ) ( not ( = ?auto_2590736 ?auto_2590741 ) ) ( not ( = ?auto_2590736 ?auto_2590742 ) ) ( not ( = ?auto_2590736 ?auto_2590743 ) ) ( not ( = ?auto_2590736 ?auto_2590744 ) ) ( not ( = ?auto_2590736 ?auto_2590745 ) ) ( not ( = ?auto_2590736 ?auto_2590746 ) ) ( not ( = ?auto_2590736 ?auto_2590747 ) ) ( not ( = ?auto_2590736 ?auto_2590748 ) ) ( not ( = ?auto_2590736 ?auto_2590749 ) ) ( not ( = ?auto_2590736 ?auto_2590750 ) ) ( not ( = ?auto_2590737 ?auto_2590738 ) ) ( not ( = ?auto_2590737 ?auto_2590739 ) ) ( not ( = ?auto_2590737 ?auto_2590740 ) ) ( not ( = ?auto_2590737 ?auto_2590741 ) ) ( not ( = ?auto_2590737 ?auto_2590742 ) ) ( not ( = ?auto_2590737 ?auto_2590743 ) ) ( not ( = ?auto_2590737 ?auto_2590744 ) ) ( not ( = ?auto_2590737 ?auto_2590745 ) ) ( not ( = ?auto_2590737 ?auto_2590746 ) ) ( not ( = ?auto_2590737 ?auto_2590747 ) ) ( not ( = ?auto_2590737 ?auto_2590748 ) ) ( not ( = ?auto_2590737 ?auto_2590749 ) ) ( not ( = ?auto_2590737 ?auto_2590750 ) ) ( not ( = ?auto_2590738 ?auto_2590739 ) ) ( not ( = ?auto_2590738 ?auto_2590740 ) ) ( not ( = ?auto_2590738 ?auto_2590741 ) ) ( not ( = ?auto_2590738 ?auto_2590742 ) ) ( not ( = ?auto_2590738 ?auto_2590743 ) ) ( not ( = ?auto_2590738 ?auto_2590744 ) ) ( not ( = ?auto_2590738 ?auto_2590745 ) ) ( not ( = ?auto_2590738 ?auto_2590746 ) ) ( not ( = ?auto_2590738 ?auto_2590747 ) ) ( not ( = ?auto_2590738 ?auto_2590748 ) ) ( not ( = ?auto_2590738 ?auto_2590749 ) ) ( not ( = ?auto_2590738 ?auto_2590750 ) ) ( not ( = ?auto_2590739 ?auto_2590740 ) ) ( not ( = ?auto_2590739 ?auto_2590741 ) ) ( not ( = ?auto_2590739 ?auto_2590742 ) ) ( not ( = ?auto_2590739 ?auto_2590743 ) ) ( not ( = ?auto_2590739 ?auto_2590744 ) ) ( not ( = ?auto_2590739 ?auto_2590745 ) ) ( not ( = ?auto_2590739 ?auto_2590746 ) ) ( not ( = ?auto_2590739 ?auto_2590747 ) ) ( not ( = ?auto_2590739 ?auto_2590748 ) ) ( not ( = ?auto_2590739 ?auto_2590749 ) ) ( not ( = ?auto_2590739 ?auto_2590750 ) ) ( not ( = ?auto_2590740 ?auto_2590741 ) ) ( not ( = ?auto_2590740 ?auto_2590742 ) ) ( not ( = ?auto_2590740 ?auto_2590743 ) ) ( not ( = ?auto_2590740 ?auto_2590744 ) ) ( not ( = ?auto_2590740 ?auto_2590745 ) ) ( not ( = ?auto_2590740 ?auto_2590746 ) ) ( not ( = ?auto_2590740 ?auto_2590747 ) ) ( not ( = ?auto_2590740 ?auto_2590748 ) ) ( not ( = ?auto_2590740 ?auto_2590749 ) ) ( not ( = ?auto_2590740 ?auto_2590750 ) ) ( not ( = ?auto_2590741 ?auto_2590742 ) ) ( not ( = ?auto_2590741 ?auto_2590743 ) ) ( not ( = ?auto_2590741 ?auto_2590744 ) ) ( not ( = ?auto_2590741 ?auto_2590745 ) ) ( not ( = ?auto_2590741 ?auto_2590746 ) ) ( not ( = ?auto_2590741 ?auto_2590747 ) ) ( not ( = ?auto_2590741 ?auto_2590748 ) ) ( not ( = ?auto_2590741 ?auto_2590749 ) ) ( not ( = ?auto_2590741 ?auto_2590750 ) ) ( not ( = ?auto_2590742 ?auto_2590743 ) ) ( not ( = ?auto_2590742 ?auto_2590744 ) ) ( not ( = ?auto_2590742 ?auto_2590745 ) ) ( not ( = ?auto_2590742 ?auto_2590746 ) ) ( not ( = ?auto_2590742 ?auto_2590747 ) ) ( not ( = ?auto_2590742 ?auto_2590748 ) ) ( not ( = ?auto_2590742 ?auto_2590749 ) ) ( not ( = ?auto_2590742 ?auto_2590750 ) ) ( not ( = ?auto_2590743 ?auto_2590744 ) ) ( not ( = ?auto_2590743 ?auto_2590745 ) ) ( not ( = ?auto_2590743 ?auto_2590746 ) ) ( not ( = ?auto_2590743 ?auto_2590747 ) ) ( not ( = ?auto_2590743 ?auto_2590748 ) ) ( not ( = ?auto_2590743 ?auto_2590749 ) ) ( not ( = ?auto_2590743 ?auto_2590750 ) ) ( not ( = ?auto_2590744 ?auto_2590745 ) ) ( not ( = ?auto_2590744 ?auto_2590746 ) ) ( not ( = ?auto_2590744 ?auto_2590747 ) ) ( not ( = ?auto_2590744 ?auto_2590748 ) ) ( not ( = ?auto_2590744 ?auto_2590749 ) ) ( not ( = ?auto_2590744 ?auto_2590750 ) ) ( not ( = ?auto_2590745 ?auto_2590746 ) ) ( not ( = ?auto_2590745 ?auto_2590747 ) ) ( not ( = ?auto_2590745 ?auto_2590748 ) ) ( not ( = ?auto_2590745 ?auto_2590749 ) ) ( not ( = ?auto_2590745 ?auto_2590750 ) ) ( not ( = ?auto_2590746 ?auto_2590747 ) ) ( not ( = ?auto_2590746 ?auto_2590748 ) ) ( not ( = ?auto_2590746 ?auto_2590749 ) ) ( not ( = ?auto_2590746 ?auto_2590750 ) ) ( not ( = ?auto_2590747 ?auto_2590748 ) ) ( not ( = ?auto_2590747 ?auto_2590749 ) ) ( not ( = ?auto_2590747 ?auto_2590750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2590748 ?auto_2590749 ?auto_2590750 )
      ( MAKE-14CRATE-VERIFY ?auto_2590736 ?auto_2590737 ?auto_2590738 ?auto_2590739 ?auto_2590740 ?auto_2590741 ?auto_2590742 ?auto_2590743 ?auto_2590744 ?auto_2590745 ?auto_2590746 ?auto_2590747 ?auto_2590748 ?auto_2590749 ?auto_2590750 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2590911 - SURFACE
      ?auto_2590912 - SURFACE
      ?auto_2590913 - SURFACE
      ?auto_2590914 - SURFACE
      ?auto_2590915 - SURFACE
      ?auto_2590916 - SURFACE
      ?auto_2590917 - SURFACE
      ?auto_2590918 - SURFACE
      ?auto_2590919 - SURFACE
      ?auto_2590920 - SURFACE
      ?auto_2590921 - SURFACE
      ?auto_2590922 - SURFACE
      ?auto_2590923 - SURFACE
      ?auto_2590924 - SURFACE
      ?auto_2590925 - SURFACE
    )
    :vars
    (
      ?auto_2590927 - HOIST
      ?auto_2590928 - PLACE
      ?auto_2590926 - TRUCK
      ?auto_2590929 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2590927 ?auto_2590928 ) ( SURFACE-AT ?auto_2590924 ?auto_2590928 ) ( CLEAR ?auto_2590924 ) ( IS-CRATE ?auto_2590925 ) ( not ( = ?auto_2590924 ?auto_2590925 ) ) ( AVAILABLE ?auto_2590927 ) ( IN ?auto_2590925 ?auto_2590926 ) ( ON ?auto_2590924 ?auto_2590923 ) ( not ( = ?auto_2590923 ?auto_2590924 ) ) ( not ( = ?auto_2590923 ?auto_2590925 ) ) ( TRUCK-AT ?auto_2590926 ?auto_2590929 ) ( not ( = ?auto_2590929 ?auto_2590928 ) ) ( ON ?auto_2590912 ?auto_2590911 ) ( ON ?auto_2590913 ?auto_2590912 ) ( ON ?auto_2590914 ?auto_2590913 ) ( ON ?auto_2590915 ?auto_2590914 ) ( ON ?auto_2590916 ?auto_2590915 ) ( ON ?auto_2590917 ?auto_2590916 ) ( ON ?auto_2590918 ?auto_2590917 ) ( ON ?auto_2590919 ?auto_2590918 ) ( ON ?auto_2590920 ?auto_2590919 ) ( ON ?auto_2590921 ?auto_2590920 ) ( ON ?auto_2590922 ?auto_2590921 ) ( ON ?auto_2590923 ?auto_2590922 ) ( not ( = ?auto_2590911 ?auto_2590912 ) ) ( not ( = ?auto_2590911 ?auto_2590913 ) ) ( not ( = ?auto_2590911 ?auto_2590914 ) ) ( not ( = ?auto_2590911 ?auto_2590915 ) ) ( not ( = ?auto_2590911 ?auto_2590916 ) ) ( not ( = ?auto_2590911 ?auto_2590917 ) ) ( not ( = ?auto_2590911 ?auto_2590918 ) ) ( not ( = ?auto_2590911 ?auto_2590919 ) ) ( not ( = ?auto_2590911 ?auto_2590920 ) ) ( not ( = ?auto_2590911 ?auto_2590921 ) ) ( not ( = ?auto_2590911 ?auto_2590922 ) ) ( not ( = ?auto_2590911 ?auto_2590923 ) ) ( not ( = ?auto_2590911 ?auto_2590924 ) ) ( not ( = ?auto_2590911 ?auto_2590925 ) ) ( not ( = ?auto_2590912 ?auto_2590913 ) ) ( not ( = ?auto_2590912 ?auto_2590914 ) ) ( not ( = ?auto_2590912 ?auto_2590915 ) ) ( not ( = ?auto_2590912 ?auto_2590916 ) ) ( not ( = ?auto_2590912 ?auto_2590917 ) ) ( not ( = ?auto_2590912 ?auto_2590918 ) ) ( not ( = ?auto_2590912 ?auto_2590919 ) ) ( not ( = ?auto_2590912 ?auto_2590920 ) ) ( not ( = ?auto_2590912 ?auto_2590921 ) ) ( not ( = ?auto_2590912 ?auto_2590922 ) ) ( not ( = ?auto_2590912 ?auto_2590923 ) ) ( not ( = ?auto_2590912 ?auto_2590924 ) ) ( not ( = ?auto_2590912 ?auto_2590925 ) ) ( not ( = ?auto_2590913 ?auto_2590914 ) ) ( not ( = ?auto_2590913 ?auto_2590915 ) ) ( not ( = ?auto_2590913 ?auto_2590916 ) ) ( not ( = ?auto_2590913 ?auto_2590917 ) ) ( not ( = ?auto_2590913 ?auto_2590918 ) ) ( not ( = ?auto_2590913 ?auto_2590919 ) ) ( not ( = ?auto_2590913 ?auto_2590920 ) ) ( not ( = ?auto_2590913 ?auto_2590921 ) ) ( not ( = ?auto_2590913 ?auto_2590922 ) ) ( not ( = ?auto_2590913 ?auto_2590923 ) ) ( not ( = ?auto_2590913 ?auto_2590924 ) ) ( not ( = ?auto_2590913 ?auto_2590925 ) ) ( not ( = ?auto_2590914 ?auto_2590915 ) ) ( not ( = ?auto_2590914 ?auto_2590916 ) ) ( not ( = ?auto_2590914 ?auto_2590917 ) ) ( not ( = ?auto_2590914 ?auto_2590918 ) ) ( not ( = ?auto_2590914 ?auto_2590919 ) ) ( not ( = ?auto_2590914 ?auto_2590920 ) ) ( not ( = ?auto_2590914 ?auto_2590921 ) ) ( not ( = ?auto_2590914 ?auto_2590922 ) ) ( not ( = ?auto_2590914 ?auto_2590923 ) ) ( not ( = ?auto_2590914 ?auto_2590924 ) ) ( not ( = ?auto_2590914 ?auto_2590925 ) ) ( not ( = ?auto_2590915 ?auto_2590916 ) ) ( not ( = ?auto_2590915 ?auto_2590917 ) ) ( not ( = ?auto_2590915 ?auto_2590918 ) ) ( not ( = ?auto_2590915 ?auto_2590919 ) ) ( not ( = ?auto_2590915 ?auto_2590920 ) ) ( not ( = ?auto_2590915 ?auto_2590921 ) ) ( not ( = ?auto_2590915 ?auto_2590922 ) ) ( not ( = ?auto_2590915 ?auto_2590923 ) ) ( not ( = ?auto_2590915 ?auto_2590924 ) ) ( not ( = ?auto_2590915 ?auto_2590925 ) ) ( not ( = ?auto_2590916 ?auto_2590917 ) ) ( not ( = ?auto_2590916 ?auto_2590918 ) ) ( not ( = ?auto_2590916 ?auto_2590919 ) ) ( not ( = ?auto_2590916 ?auto_2590920 ) ) ( not ( = ?auto_2590916 ?auto_2590921 ) ) ( not ( = ?auto_2590916 ?auto_2590922 ) ) ( not ( = ?auto_2590916 ?auto_2590923 ) ) ( not ( = ?auto_2590916 ?auto_2590924 ) ) ( not ( = ?auto_2590916 ?auto_2590925 ) ) ( not ( = ?auto_2590917 ?auto_2590918 ) ) ( not ( = ?auto_2590917 ?auto_2590919 ) ) ( not ( = ?auto_2590917 ?auto_2590920 ) ) ( not ( = ?auto_2590917 ?auto_2590921 ) ) ( not ( = ?auto_2590917 ?auto_2590922 ) ) ( not ( = ?auto_2590917 ?auto_2590923 ) ) ( not ( = ?auto_2590917 ?auto_2590924 ) ) ( not ( = ?auto_2590917 ?auto_2590925 ) ) ( not ( = ?auto_2590918 ?auto_2590919 ) ) ( not ( = ?auto_2590918 ?auto_2590920 ) ) ( not ( = ?auto_2590918 ?auto_2590921 ) ) ( not ( = ?auto_2590918 ?auto_2590922 ) ) ( not ( = ?auto_2590918 ?auto_2590923 ) ) ( not ( = ?auto_2590918 ?auto_2590924 ) ) ( not ( = ?auto_2590918 ?auto_2590925 ) ) ( not ( = ?auto_2590919 ?auto_2590920 ) ) ( not ( = ?auto_2590919 ?auto_2590921 ) ) ( not ( = ?auto_2590919 ?auto_2590922 ) ) ( not ( = ?auto_2590919 ?auto_2590923 ) ) ( not ( = ?auto_2590919 ?auto_2590924 ) ) ( not ( = ?auto_2590919 ?auto_2590925 ) ) ( not ( = ?auto_2590920 ?auto_2590921 ) ) ( not ( = ?auto_2590920 ?auto_2590922 ) ) ( not ( = ?auto_2590920 ?auto_2590923 ) ) ( not ( = ?auto_2590920 ?auto_2590924 ) ) ( not ( = ?auto_2590920 ?auto_2590925 ) ) ( not ( = ?auto_2590921 ?auto_2590922 ) ) ( not ( = ?auto_2590921 ?auto_2590923 ) ) ( not ( = ?auto_2590921 ?auto_2590924 ) ) ( not ( = ?auto_2590921 ?auto_2590925 ) ) ( not ( = ?auto_2590922 ?auto_2590923 ) ) ( not ( = ?auto_2590922 ?auto_2590924 ) ) ( not ( = ?auto_2590922 ?auto_2590925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2590923 ?auto_2590924 ?auto_2590925 )
      ( MAKE-14CRATE-VERIFY ?auto_2590911 ?auto_2590912 ?auto_2590913 ?auto_2590914 ?auto_2590915 ?auto_2590916 ?auto_2590917 ?auto_2590918 ?auto_2590919 ?auto_2590920 ?auto_2590921 ?auto_2590922 ?auto_2590923 ?auto_2590924 ?auto_2590925 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591100 - SURFACE
      ?auto_2591101 - SURFACE
      ?auto_2591102 - SURFACE
      ?auto_2591103 - SURFACE
      ?auto_2591104 - SURFACE
      ?auto_2591105 - SURFACE
      ?auto_2591106 - SURFACE
      ?auto_2591107 - SURFACE
      ?auto_2591108 - SURFACE
      ?auto_2591109 - SURFACE
      ?auto_2591110 - SURFACE
      ?auto_2591111 - SURFACE
      ?auto_2591112 - SURFACE
      ?auto_2591113 - SURFACE
      ?auto_2591114 - SURFACE
    )
    :vars
    (
      ?auto_2591118 - HOIST
      ?auto_2591119 - PLACE
      ?auto_2591116 - TRUCK
      ?auto_2591117 - PLACE
      ?auto_2591115 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591118 ?auto_2591119 ) ( SURFACE-AT ?auto_2591113 ?auto_2591119 ) ( CLEAR ?auto_2591113 ) ( IS-CRATE ?auto_2591114 ) ( not ( = ?auto_2591113 ?auto_2591114 ) ) ( AVAILABLE ?auto_2591118 ) ( ON ?auto_2591113 ?auto_2591112 ) ( not ( = ?auto_2591112 ?auto_2591113 ) ) ( not ( = ?auto_2591112 ?auto_2591114 ) ) ( TRUCK-AT ?auto_2591116 ?auto_2591117 ) ( not ( = ?auto_2591117 ?auto_2591119 ) ) ( HOIST-AT ?auto_2591115 ?auto_2591117 ) ( LIFTING ?auto_2591115 ?auto_2591114 ) ( not ( = ?auto_2591118 ?auto_2591115 ) ) ( ON ?auto_2591101 ?auto_2591100 ) ( ON ?auto_2591102 ?auto_2591101 ) ( ON ?auto_2591103 ?auto_2591102 ) ( ON ?auto_2591104 ?auto_2591103 ) ( ON ?auto_2591105 ?auto_2591104 ) ( ON ?auto_2591106 ?auto_2591105 ) ( ON ?auto_2591107 ?auto_2591106 ) ( ON ?auto_2591108 ?auto_2591107 ) ( ON ?auto_2591109 ?auto_2591108 ) ( ON ?auto_2591110 ?auto_2591109 ) ( ON ?auto_2591111 ?auto_2591110 ) ( ON ?auto_2591112 ?auto_2591111 ) ( not ( = ?auto_2591100 ?auto_2591101 ) ) ( not ( = ?auto_2591100 ?auto_2591102 ) ) ( not ( = ?auto_2591100 ?auto_2591103 ) ) ( not ( = ?auto_2591100 ?auto_2591104 ) ) ( not ( = ?auto_2591100 ?auto_2591105 ) ) ( not ( = ?auto_2591100 ?auto_2591106 ) ) ( not ( = ?auto_2591100 ?auto_2591107 ) ) ( not ( = ?auto_2591100 ?auto_2591108 ) ) ( not ( = ?auto_2591100 ?auto_2591109 ) ) ( not ( = ?auto_2591100 ?auto_2591110 ) ) ( not ( = ?auto_2591100 ?auto_2591111 ) ) ( not ( = ?auto_2591100 ?auto_2591112 ) ) ( not ( = ?auto_2591100 ?auto_2591113 ) ) ( not ( = ?auto_2591100 ?auto_2591114 ) ) ( not ( = ?auto_2591101 ?auto_2591102 ) ) ( not ( = ?auto_2591101 ?auto_2591103 ) ) ( not ( = ?auto_2591101 ?auto_2591104 ) ) ( not ( = ?auto_2591101 ?auto_2591105 ) ) ( not ( = ?auto_2591101 ?auto_2591106 ) ) ( not ( = ?auto_2591101 ?auto_2591107 ) ) ( not ( = ?auto_2591101 ?auto_2591108 ) ) ( not ( = ?auto_2591101 ?auto_2591109 ) ) ( not ( = ?auto_2591101 ?auto_2591110 ) ) ( not ( = ?auto_2591101 ?auto_2591111 ) ) ( not ( = ?auto_2591101 ?auto_2591112 ) ) ( not ( = ?auto_2591101 ?auto_2591113 ) ) ( not ( = ?auto_2591101 ?auto_2591114 ) ) ( not ( = ?auto_2591102 ?auto_2591103 ) ) ( not ( = ?auto_2591102 ?auto_2591104 ) ) ( not ( = ?auto_2591102 ?auto_2591105 ) ) ( not ( = ?auto_2591102 ?auto_2591106 ) ) ( not ( = ?auto_2591102 ?auto_2591107 ) ) ( not ( = ?auto_2591102 ?auto_2591108 ) ) ( not ( = ?auto_2591102 ?auto_2591109 ) ) ( not ( = ?auto_2591102 ?auto_2591110 ) ) ( not ( = ?auto_2591102 ?auto_2591111 ) ) ( not ( = ?auto_2591102 ?auto_2591112 ) ) ( not ( = ?auto_2591102 ?auto_2591113 ) ) ( not ( = ?auto_2591102 ?auto_2591114 ) ) ( not ( = ?auto_2591103 ?auto_2591104 ) ) ( not ( = ?auto_2591103 ?auto_2591105 ) ) ( not ( = ?auto_2591103 ?auto_2591106 ) ) ( not ( = ?auto_2591103 ?auto_2591107 ) ) ( not ( = ?auto_2591103 ?auto_2591108 ) ) ( not ( = ?auto_2591103 ?auto_2591109 ) ) ( not ( = ?auto_2591103 ?auto_2591110 ) ) ( not ( = ?auto_2591103 ?auto_2591111 ) ) ( not ( = ?auto_2591103 ?auto_2591112 ) ) ( not ( = ?auto_2591103 ?auto_2591113 ) ) ( not ( = ?auto_2591103 ?auto_2591114 ) ) ( not ( = ?auto_2591104 ?auto_2591105 ) ) ( not ( = ?auto_2591104 ?auto_2591106 ) ) ( not ( = ?auto_2591104 ?auto_2591107 ) ) ( not ( = ?auto_2591104 ?auto_2591108 ) ) ( not ( = ?auto_2591104 ?auto_2591109 ) ) ( not ( = ?auto_2591104 ?auto_2591110 ) ) ( not ( = ?auto_2591104 ?auto_2591111 ) ) ( not ( = ?auto_2591104 ?auto_2591112 ) ) ( not ( = ?auto_2591104 ?auto_2591113 ) ) ( not ( = ?auto_2591104 ?auto_2591114 ) ) ( not ( = ?auto_2591105 ?auto_2591106 ) ) ( not ( = ?auto_2591105 ?auto_2591107 ) ) ( not ( = ?auto_2591105 ?auto_2591108 ) ) ( not ( = ?auto_2591105 ?auto_2591109 ) ) ( not ( = ?auto_2591105 ?auto_2591110 ) ) ( not ( = ?auto_2591105 ?auto_2591111 ) ) ( not ( = ?auto_2591105 ?auto_2591112 ) ) ( not ( = ?auto_2591105 ?auto_2591113 ) ) ( not ( = ?auto_2591105 ?auto_2591114 ) ) ( not ( = ?auto_2591106 ?auto_2591107 ) ) ( not ( = ?auto_2591106 ?auto_2591108 ) ) ( not ( = ?auto_2591106 ?auto_2591109 ) ) ( not ( = ?auto_2591106 ?auto_2591110 ) ) ( not ( = ?auto_2591106 ?auto_2591111 ) ) ( not ( = ?auto_2591106 ?auto_2591112 ) ) ( not ( = ?auto_2591106 ?auto_2591113 ) ) ( not ( = ?auto_2591106 ?auto_2591114 ) ) ( not ( = ?auto_2591107 ?auto_2591108 ) ) ( not ( = ?auto_2591107 ?auto_2591109 ) ) ( not ( = ?auto_2591107 ?auto_2591110 ) ) ( not ( = ?auto_2591107 ?auto_2591111 ) ) ( not ( = ?auto_2591107 ?auto_2591112 ) ) ( not ( = ?auto_2591107 ?auto_2591113 ) ) ( not ( = ?auto_2591107 ?auto_2591114 ) ) ( not ( = ?auto_2591108 ?auto_2591109 ) ) ( not ( = ?auto_2591108 ?auto_2591110 ) ) ( not ( = ?auto_2591108 ?auto_2591111 ) ) ( not ( = ?auto_2591108 ?auto_2591112 ) ) ( not ( = ?auto_2591108 ?auto_2591113 ) ) ( not ( = ?auto_2591108 ?auto_2591114 ) ) ( not ( = ?auto_2591109 ?auto_2591110 ) ) ( not ( = ?auto_2591109 ?auto_2591111 ) ) ( not ( = ?auto_2591109 ?auto_2591112 ) ) ( not ( = ?auto_2591109 ?auto_2591113 ) ) ( not ( = ?auto_2591109 ?auto_2591114 ) ) ( not ( = ?auto_2591110 ?auto_2591111 ) ) ( not ( = ?auto_2591110 ?auto_2591112 ) ) ( not ( = ?auto_2591110 ?auto_2591113 ) ) ( not ( = ?auto_2591110 ?auto_2591114 ) ) ( not ( = ?auto_2591111 ?auto_2591112 ) ) ( not ( = ?auto_2591111 ?auto_2591113 ) ) ( not ( = ?auto_2591111 ?auto_2591114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591112 ?auto_2591113 ?auto_2591114 )
      ( MAKE-14CRATE-VERIFY ?auto_2591100 ?auto_2591101 ?auto_2591102 ?auto_2591103 ?auto_2591104 ?auto_2591105 ?auto_2591106 ?auto_2591107 ?auto_2591108 ?auto_2591109 ?auto_2591110 ?auto_2591111 ?auto_2591112 ?auto_2591113 ?auto_2591114 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591303 - SURFACE
      ?auto_2591304 - SURFACE
      ?auto_2591305 - SURFACE
      ?auto_2591306 - SURFACE
      ?auto_2591307 - SURFACE
      ?auto_2591308 - SURFACE
      ?auto_2591309 - SURFACE
      ?auto_2591310 - SURFACE
      ?auto_2591311 - SURFACE
      ?auto_2591312 - SURFACE
      ?auto_2591313 - SURFACE
      ?auto_2591314 - SURFACE
      ?auto_2591315 - SURFACE
      ?auto_2591316 - SURFACE
      ?auto_2591317 - SURFACE
    )
    :vars
    (
      ?auto_2591322 - HOIST
      ?auto_2591319 - PLACE
      ?auto_2591318 - TRUCK
      ?auto_2591320 - PLACE
      ?auto_2591323 - HOIST
      ?auto_2591321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591322 ?auto_2591319 ) ( SURFACE-AT ?auto_2591316 ?auto_2591319 ) ( CLEAR ?auto_2591316 ) ( IS-CRATE ?auto_2591317 ) ( not ( = ?auto_2591316 ?auto_2591317 ) ) ( AVAILABLE ?auto_2591322 ) ( ON ?auto_2591316 ?auto_2591315 ) ( not ( = ?auto_2591315 ?auto_2591316 ) ) ( not ( = ?auto_2591315 ?auto_2591317 ) ) ( TRUCK-AT ?auto_2591318 ?auto_2591320 ) ( not ( = ?auto_2591320 ?auto_2591319 ) ) ( HOIST-AT ?auto_2591323 ?auto_2591320 ) ( not ( = ?auto_2591322 ?auto_2591323 ) ) ( AVAILABLE ?auto_2591323 ) ( SURFACE-AT ?auto_2591317 ?auto_2591320 ) ( ON ?auto_2591317 ?auto_2591321 ) ( CLEAR ?auto_2591317 ) ( not ( = ?auto_2591316 ?auto_2591321 ) ) ( not ( = ?auto_2591317 ?auto_2591321 ) ) ( not ( = ?auto_2591315 ?auto_2591321 ) ) ( ON ?auto_2591304 ?auto_2591303 ) ( ON ?auto_2591305 ?auto_2591304 ) ( ON ?auto_2591306 ?auto_2591305 ) ( ON ?auto_2591307 ?auto_2591306 ) ( ON ?auto_2591308 ?auto_2591307 ) ( ON ?auto_2591309 ?auto_2591308 ) ( ON ?auto_2591310 ?auto_2591309 ) ( ON ?auto_2591311 ?auto_2591310 ) ( ON ?auto_2591312 ?auto_2591311 ) ( ON ?auto_2591313 ?auto_2591312 ) ( ON ?auto_2591314 ?auto_2591313 ) ( ON ?auto_2591315 ?auto_2591314 ) ( not ( = ?auto_2591303 ?auto_2591304 ) ) ( not ( = ?auto_2591303 ?auto_2591305 ) ) ( not ( = ?auto_2591303 ?auto_2591306 ) ) ( not ( = ?auto_2591303 ?auto_2591307 ) ) ( not ( = ?auto_2591303 ?auto_2591308 ) ) ( not ( = ?auto_2591303 ?auto_2591309 ) ) ( not ( = ?auto_2591303 ?auto_2591310 ) ) ( not ( = ?auto_2591303 ?auto_2591311 ) ) ( not ( = ?auto_2591303 ?auto_2591312 ) ) ( not ( = ?auto_2591303 ?auto_2591313 ) ) ( not ( = ?auto_2591303 ?auto_2591314 ) ) ( not ( = ?auto_2591303 ?auto_2591315 ) ) ( not ( = ?auto_2591303 ?auto_2591316 ) ) ( not ( = ?auto_2591303 ?auto_2591317 ) ) ( not ( = ?auto_2591303 ?auto_2591321 ) ) ( not ( = ?auto_2591304 ?auto_2591305 ) ) ( not ( = ?auto_2591304 ?auto_2591306 ) ) ( not ( = ?auto_2591304 ?auto_2591307 ) ) ( not ( = ?auto_2591304 ?auto_2591308 ) ) ( not ( = ?auto_2591304 ?auto_2591309 ) ) ( not ( = ?auto_2591304 ?auto_2591310 ) ) ( not ( = ?auto_2591304 ?auto_2591311 ) ) ( not ( = ?auto_2591304 ?auto_2591312 ) ) ( not ( = ?auto_2591304 ?auto_2591313 ) ) ( not ( = ?auto_2591304 ?auto_2591314 ) ) ( not ( = ?auto_2591304 ?auto_2591315 ) ) ( not ( = ?auto_2591304 ?auto_2591316 ) ) ( not ( = ?auto_2591304 ?auto_2591317 ) ) ( not ( = ?auto_2591304 ?auto_2591321 ) ) ( not ( = ?auto_2591305 ?auto_2591306 ) ) ( not ( = ?auto_2591305 ?auto_2591307 ) ) ( not ( = ?auto_2591305 ?auto_2591308 ) ) ( not ( = ?auto_2591305 ?auto_2591309 ) ) ( not ( = ?auto_2591305 ?auto_2591310 ) ) ( not ( = ?auto_2591305 ?auto_2591311 ) ) ( not ( = ?auto_2591305 ?auto_2591312 ) ) ( not ( = ?auto_2591305 ?auto_2591313 ) ) ( not ( = ?auto_2591305 ?auto_2591314 ) ) ( not ( = ?auto_2591305 ?auto_2591315 ) ) ( not ( = ?auto_2591305 ?auto_2591316 ) ) ( not ( = ?auto_2591305 ?auto_2591317 ) ) ( not ( = ?auto_2591305 ?auto_2591321 ) ) ( not ( = ?auto_2591306 ?auto_2591307 ) ) ( not ( = ?auto_2591306 ?auto_2591308 ) ) ( not ( = ?auto_2591306 ?auto_2591309 ) ) ( not ( = ?auto_2591306 ?auto_2591310 ) ) ( not ( = ?auto_2591306 ?auto_2591311 ) ) ( not ( = ?auto_2591306 ?auto_2591312 ) ) ( not ( = ?auto_2591306 ?auto_2591313 ) ) ( not ( = ?auto_2591306 ?auto_2591314 ) ) ( not ( = ?auto_2591306 ?auto_2591315 ) ) ( not ( = ?auto_2591306 ?auto_2591316 ) ) ( not ( = ?auto_2591306 ?auto_2591317 ) ) ( not ( = ?auto_2591306 ?auto_2591321 ) ) ( not ( = ?auto_2591307 ?auto_2591308 ) ) ( not ( = ?auto_2591307 ?auto_2591309 ) ) ( not ( = ?auto_2591307 ?auto_2591310 ) ) ( not ( = ?auto_2591307 ?auto_2591311 ) ) ( not ( = ?auto_2591307 ?auto_2591312 ) ) ( not ( = ?auto_2591307 ?auto_2591313 ) ) ( not ( = ?auto_2591307 ?auto_2591314 ) ) ( not ( = ?auto_2591307 ?auto_2591315 ) ) ( not ( = ?auto_2591307 ?auto_2591316 ) ) ( not ( = ?auto_2591307 ?auto_2591317 ) ) ( not ( = ?auto_2591307 ?auto_2591321 ) ) ( not ( = ?auto_2591308 ?auto_2591309 ) ) ( not ( = ?auto_2591308 ?auto_2591310 ) ) ( not ( = ?auto_2591308 ?auto_2591311 ) ) ( not ( = ?auto_2591308 ?auto_2591312 ) ) ( not ( = ?auto_2591308 ?auto_2591313 ) ) ( not ( = ?auto_2591308 ?auto_2591314 ) ) ( not ( = ?auto_2591308 ?auto_2591315 ) ) ( not ( = ?auto_2591308 ?auto_2591316 ) ) ( not ( = ?auto_2591308 ?auto_2591317 ) ) ( not ( = ?auto_2591308 ?auto_2591321 ) ) ( not ( = ?auto_2591309 ?auto_2591310 ) ) ( not ( = ?auto_2591309 ?auto_2591311 ) ) ( not ( = ?auto_2591309 ?auto_2591312 ) ) ( not ( = ?auto_2591309 ?auto_2591313 ) ) ( not ( = ?auto_2591309 ?auto_2591314 ) ) ( not ( = ?auto_2591309 ?auto_2591315 ) ) ( not ( = ?auto_2591309 ?auto_2591316 ) ) ( not ( = ?auto_2591309 ?auto_2591317 ) ) ( not ( = ?auto_2591309 ?auto_2591321 ) ) ( not ( = ?auto_2591310 ?auto_2591311 ) ) ( not ( = ?auto_2591310 ?auto_2591312 ) ) ( not ( = ?auto_2591310 ?auto_2591313 ) ) ( not ( = ?auto_2591310 ?auto_2591314 ) ) ( not ( = ?auto_2591310 ?auto_2591315 ) ) ( not ( = ?auto_2591310 ?auto_2591316 ) ) ( not ( = ?auto_2591310 ?auto_2591317 ) ) ( not ( = ?auto_2591310 ?auto_2591321 ) ) ( not ( = ?auto_2591311 ?auto_2591312 ) ) ( not ( = ?auto_2591311 ?auto_2591313 ) ) ( not ( = ?auto_2591311 ?auto_2591314 ) ) ( not ( = ?auto_2591311 ?auto_2591315 ) ) ( not ( = ?auto_2591311 ?auto_2591316 ) ) ( not ( = ?auto_2591311 ?auto_2591317 ) ) ( not ( = ?auto_2591311 ?auto_2591321 ) ) ( not ( = ?auto_2591312 ?auto_2591313 ) ) ( not ( = ?auto_2591312 ?auto_2591314 ) ) ( not ( = ?auto_2591312 ?auto_2591315 ) ) ( not ( = ?auto_2591312 ?auto_2591316 ) ) ( not ( = ?auto_2591312 ?auto_2591317 ) ) ( not ( = ?auto_2591312 ?auto_2591321 ) ) ( not ( = ?auto_2591313 ?auto_2591314 ) ) ( not ( = ?auto_2591313 ?auto_2591315 ) ) ( not ( = ?auto_2591313 ?auto_2591316 ) ) ( not ( = ?auto_2591313 ?auto_2591317 ) ) ( not ( = ?auto_2591313 ?auto_2591321 ) ) ( not ( = ?auto_2591314 ?auto_2591315 ) ) ( not ( = ?auto_2591314 ?auto_2591316 ) ) ( not ( = ?auto_2591314 ?auto_2591317 ) ) ( not ( = ?auto_2591314 ?auto_2591321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591315 ?auto_2591316 ?auto_2591317 )
      ( MAKE-14CRATE-VERIFY ?auto_2591303 ?auto_2591304 ?auto_2591305 ?auto_2591306 ?auto_2591307 ?auto_2591308 ?auto_2591309 ?auto_2591310 ?auto_2591311 ?auto_2591312 ?auto_2591313 ?auto_2591314 ?auto_2591315 ?auto_2591316 ?auto_2591317 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591507 - SURFACE
      ?auto_2591508 - SURFACE
      ?auto_2591509 - SURFACE
      ?auto_2591510 - SURFACE
      ?auto_2591511 - SURFACE
      ?auto_2591512 - SURFACE
      ?auto_2591513 - SURFACE
      ?auto_2591514 - SURFACE
      ?auto_2591515 - SURFACE
      ?auto_2591516 - SURFACE
      ?auto_2591517 - SURFACE
      ?auto_2591518 - SURFACE
      ?auto_2591519 - SURFACE
      ?auto_2591520 - SURFACE
      ?auto_2591521 - SURFACE
    )
    :vars
    (
      ?auto_2591524 - HOIST
      ?auto_2591522 - PLACE
      ?auto_2591523 - PLACE
      ?auto_2591525 - HOIST
      ?auto_2591526 - SURFACE
      ?auto_2591527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591524 ?auto_2591522 ) ( SURFACE-AT ?auto_2591520 ?auto_2591522 ) ( CLEAR ?auto_2591520 ) ( IS-CRATE ?auto_2591521 ) ( not ( = ?auto_2591520 ?auto_2591521 ) ) ( AVAILABLE ?auto_2591524 ) ( ON ?auto_2591520 ?auto_2591519 ) ( not ( = ?auto_2591519 ?auto_2591520 ) ) ( not ( = ?auto_2591519 ?auto_2591521 ) ) ( not ( = ?auto_2591523 ?auto_2591522 ) ) ( HOIST-AT ?auto_2591525 ?auto_2591523 ) ( not ( = ?auto_2591524 ?auto_2591525 ) ) ( AVAILABLE ?auto_2591525 ) ( SURFACE-AT ?auto_2591521 ?auto_2591523 ) ( ON ?auto_2591521 ?auto_2591526 ) ( CLEAR ?auto_2591521 ) ( not ( = ?auto_2591520 ?auto_2591526 ) ) ( not ( = ?auto_2591521 ?auto_2591526 ) ) ( not ( = ?auto_2591519 ?auto_2591526 ) ) ( TRUCK-AT ?auto_2591527 ?auto_2591522 ) ( ON ?auto_2591508 ?auto_2591507 ) ( ON ?auto_2591509 ?auto_2591508 ) ( ON ?auto_2591510 ?auto_2591509 ) ( ON ?auto_2591511 ?auto_2591510 ) ( ON ?auto_2591512 ?auto_2591511 ) ( ON ?auto_2591513 ?auto_2591512 ) ( ON ?auto_2591514 ?auto_2591513 ) ( ON ?auto_2591515 ?auto_2591514 ) ( ON ?auto_2591516 ?auto_2591515 ) ( ON ?auto_2591517 ?auto_2591516 ) ( ON ?auto_2591518 ?auto_2591517 ) ( ON ?auto_2591519 ?auto_2591518 ) ( not ( = ?auto_2591507 ?auto_2591508 ) ) ( not ( = ?auto_2591507 ?auto_2591509 ) ) ( not ( = ?auto_2591507 ?auto_2591510 ) ) ( not ( = ?auto_2591507 ?auto_2591511 ) ) ( not ( = ?auto_2591507 ?auto_2591512 ) ) ( not ( = ?auto_2591507 ?auto_2591513 ) ) ( not ( = ?auto_2591507 ?auto_2591514 ) ) ( not ( = ?auto_2591507 ?auto_2591515 ) ) ( not ( = ?auto_2591507 ?auto_2591516 ) ) ( not ( = ?auto_2591507 ?auto_2591517 ) ) ( not ( = ?auto_2591507 ?auto_2591518 ) ) ( not ( = ?auto_2591507 ?auto_2591519 ) ) ( not ( = ?auto_2591507 ?auto_2591520 ) ) ( not ( = ?auto_2591507 ?auto_2591521 ) ) ( not ( = ?auto_2591507 ?auto_2591526 ) ) ( not ( = ?auto_2591508 ?auto_2591509 ) ) ( not ( = ?auto_2591508 ?auto_2591510 ) ) ( not ( = ?auto_2591508 ?auto_2591511 ) ) ( not ( = ?auto_2591508 ?auto_2591512 ) ) ( not ( = ?auto_2591508 ?auto_2591513 ) ) ( not ( = ?auto_2591508 ?auto_2591514 ) ) ( not ( = ?auto_2591508 ?auto_2591515 ) ) ( not ( = ?auto_2591508 ?auto_2591516 ) ) ( not ( = ?auto_2591508 ?auto_2591517 ) ) ( not ( = ?auto_2591508 ?auto_2591518 ) ) ( not ( = ?auto_2591508 ?auto_2591519 ) ) ( not ( = ?auto_2591508 ?auto_2591520 ) ) ( not ( = ?auto_2591508 ?auto_2591521 ) ) ( not ( = ?auto_2591508 ?auto_2591526 ) ) ( not ( = ?auto_2591509 ?auto_2591510 ) ) ( not ( = ?auto_2591509 ?auto_2591511 ) ) ( not ( = ?auto_2591509 ?auto_2591512 ) ) ( not ( = ?auto_2591509 ?auto_2591513 ) ) ( not ( = ?auto_2591509 ?auto_2591514 ) ) ( not ( = ?auto_2591509 ?auto_2591515 ) ) ( not ( = ?auto_2591509 ?auto_2591516 ) ) ( not ( = ?auto_2591509 ?auto_2591517 ) ) ( not ( = ?auto_2591509 ?auto_2591518 ) ) ( not ( = ?auto_2591509 ?auto_2591519 ) ) ( not ( = ?auto_2591509 ?auto_2591520 ) ) ( not ( = ?auto_2591509 ?auto_2591521 ) ) ( not ( = ?auto_2591509 ?auto_2591526 ) ) ( not ( = ?auto_2591510 ?auto_2591511 ) ) ( not ( = ?auto_2591510 ?auto_2591512 ) ) ( not ( = ?auto_2591510 ?auto_2591513 ) ) ( not ( = ?auto_2591510 ?auto_2591514 ) ) ( not ( = ?auto_2591510 ?auto_2591515 ) ) ( not ( = ?auto_2591510 ?auto_2591516 ) ) ( not ( = ?auto_2591510 ?auto_2591517 ) ) ( not ( = ?auto_2591510 ?auto_2591518 ) ) ( not ( = ?auto_2591510 ?auto_2591519 ) ) ( not ( = ?auto_2591510 ?auto_2591520 ) ) ( not ( = ?auto_2591510 ?auto_2591521 ) ) ( not ( = ?auto_2591510 ?auto_2591526 ) ) ( not ( = ?auto_2591511 ?auto_2591512 ) ) ( not ( = ?auto_2591511 ?auto_2591513 ) ) ( not ( = ?auto_2591511 ?auto_2591514 ) ) ( not ( = ?auto_2591511 ?auto_2591515 ) ) ( not ( = ?auto_2591511 ?auto_2591516 ) ) ( not ( = ?auto_2591511 ?auto_2591517 ) ) ( not ( = ?auto_2591511 ?auto_2591518 ) ) ( not ( = ?auto_2591511 ?auto_2591519 ) ) ( not ( = ?auto_2591511 ?auto_2591520 ) ) ( not ( = ?auto_2591511 ?auto_2591521 ) ) ( not ( = ?auto_2591511 ?auto_2591526 ) ) ( not ( = ?auto_2591512 ?auto_2591513 ) ) ( not ( = ?auto_2591512 ?auto_2591514 ) ) ( not ( = ?auto_2591512 ?auto_2591515 ) ) ( not ( = ?auto_2591512 ?auto_2591516 ) ) ( not ( = ?auto_2591512 ?auto_2591517 ) ) ( not ( = ?auto_2591512 ?auto_2591518 ) ) ( not ( = ?auto_2591512 ?auto_2591519 ) ) ( not ( = ?auto_2591512 ?auto_2591520 ) ) ( not ( = ?auto_2591512 ?auto_2591521 ) ) ( not ( = ?auto_2591512 ?auto_2591526 ) ) ( not ( = ?auto_2591513 ?auto_2591514 ) ) ( not ( = ?auto_2591513 ?auto_2591515 ) ) ( not ( = ?auto_2591513 ?auto_2591516 ) ) ( not ( = ?auto_2591513 ?auto_2591517 ) ) ( not ( = ?auto_2591513 ?auto_2591518 ) ) ( not ( = ?auto_2591513 ?auto_2591519 ) ) ( not ( = ?auto_2591513 ?auto_2591520 ) ) ( not ( = ?auto_2591513 ?auto_2591521 ) ) ( not ( = ?auto_2591513 ?auto_2591526 ) ) ( not ( = ?auto_2591514 ?auto_2591515 ) ) ( not ( = ?auto_2591514 ?auto_2591516 ) ) ( not ( = ?auto_2591514 ?auto_2591517 ) ) ( not ( = ?auto_2591514 ?auto_2591518 ) ) ( not ( = ?auto_2591514 ?auto_2591519 ) ) ( not ( = ?auto_2591514 ?auto_2591520 ) ) ( not ( = ?auto_2591514 ?auto_2591521 ) ) ( not ( = ?auto_2591514 ?auto_2591526 ) ) ( not ( = ?auto_2591515 ?auto_2591516 ) ) ( not ( = ?auto_2591515 ?auto_2591517 ) ) ( not ( = ?auto_2591515 ?auto_2591518 ) ) ( not ( = ?auto_2591515 ?auto_2591519 ) ) ( not ( = ?auto_2591515 ?auto_2591520 ) ) ( not ( = ?auto_2591515 ?auto_2591521 ) ) ( not ( = ?auto_2591515 ?auto_2591526 ) ) ( not ( = ?auto_2591516 ?auto_2591517 ) ) ( not ( = ?auto_2591516 ?auto_2591518 ) ) ( not ( = ?auto_2591516 ?auto_2591519 ) ) ( not ( = ?auto_2591516 ?auto_2591520 ) ) ( not ( = ?auto_2591516 ?auto_2591521 ) ) ( not ( = ?auto_2591516 ?auto_2591526 ) ) ( not ( = ?auto_2591517 ?auto_2591518 ) ) ( not ( = ?auto_2591517 ?auto_2591519 ) ) ( not ( = ?auto_2591517 ?auto_2591520 ) ) ( not ( = ?auto_2591517 ?auto_2591521 ) ) ( not ( = ?auto_2591517 ?auto_2591526 ) ) ( not ( = ?auto_2591518 ?auto_2591519 ) ) ( not ( = ?auto_2591518 ?auto_2591520 ) ) ( not ( = ?auto_2591518 ?auto_2591521 ) ) ( not ( = ?auto_2591518 ?auto_2591526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591519 ?auto_2591520 ?auto_2591521 )
      ( MAKE-14CRATE-VERIFY ?auto_2591507 ?auto_2591508 ?auto_2591509 ?auto_2591510 ?auto_2591511 ?auto_2591512 ?auto_2591513 ?auto_2591514 ?auto_2591515 ?auto_2591516 ?auto_2591517 ?auto_2591518 ?auto_2591519 ?auto_2591520 ?auto_2591521 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591711 - SURFACE
      ?auto_2591712 - SURFACE
      ?auto_2591713 - SURFACE
      ?auto_2591714 - SURFACE
      ?auto_2591715 - SURFACE
      ?auto_2591716 - SURFACE
      ?auto_2591717 - SURFACE
      ?auto_2591718 - SURFACE
      ?auto_2591719 - SURFACE
      ?auto_2591720 - SURFACE
      ?auto_2591721 - SURFACE
      ?auto_2591722 - SURFACE
      ?auto_2591723 - SURFACE
      ?auto_2591724 - SURFACE
      ?auto_2591725 - SURFACE
    )
    :vars
    (
      ?auto_2591730 - HOIST
      ?auto_2591727 - PLACE
      ?auto_2591726 - PLACE
      ?auto_2591731 - HOIST
      ?auto_2591728 - SURFACE
      ?auto_2591729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591730 ?auto_2591727 ) ( IS-CRATE ?auto_2591725 ) ( not ( = ?auto_2591724 ?auto_2591725 ) ) ( not ( = ?auto_2591723 ?auto_2591724 ) ) ( not ( = ?auto_2591723 ?auto_2591725 ) ) ( not ( = ?auto_2591726 ?auto_2591727 ) ) ( HOIST-AT ?auto_2591731 ?auto_2591726 ) ( not ( = ?auto_2591730 ?auto_2591731 ) ) ( AVAILABLE ?auto_2591731 ) ( SURFACE-AT ?auto_2591725 ?auto_2591726 ) ( ON ?auto_2591725 ?auto_2591728 ) ( CLEAR ?auto_2591725 ) ( not ( = ?auto_2591724 ?auto_2591728 ) ) ( not ( = ?auto_2591725 ?auto_2591728 ) ) ( not ( = ?auto_2591723 ?auto_2591728 ) ) ( TRUCK-AT ?auto_2591729 ?auto_2591727 ) ( SURFACE-AT ?auto_2591723 ?auto_2591727 ) ( CLEAR ?auto_2591723 ) ( LIFTING ?auto_2591730 ?auto_2591724 ) ( IS-CRATE ?auto_2591724 ) ( ON ?auto_2591712 ?auto_2591711 ) ( ON ?auto_2591713 ?auto_2591712 ) ( ON ?auto_2591714 ?auto_2591713 ) ( ON ?auto_2591715 ?auto_2591714 ) ( ON ?auto_2591716 ?auto_2591715 ) ( ON ?auto_2591717 ?auto_2591716 ) ( ON ?auto_2591718 ?auto_2591717 ) ( ON ?auto_2591719 ?auto_2591718 ) ( ON ?auto_2591720 ?auto_2591719 ) ( ON ?auto_2591721 ?auto_2591720 ) ( ON ?auto_2591722 ?auto_2591721 ) ( ON ?auto_2591723 ?auto_2591722 ) ( not ( = ?auto_2591711 ?auto_2591712 ) ) ( not ( = ?auto_2591711 ?auto_2591713 ) ) ( not ( = ?auto_2591711 ?auto_2591714 ) ) ( not ( = ?auto_2591711 ?auto_2591715 ) ) ( not ( = ?auto_2591711 ?auto_2591716 ) ) ( not ( = ?auto_2591711 ?auto_2591717 ) ) ( not ( = ?auto_2591711 ?auto_2591718 ) ) ( not ( = ?auto_2591711 ?auto_2591719 ) ) ( not ( = ?auto_2591711 ?auto_2591720 ) ) ( not ( = ?auto_2591711 ?auto_2591721 ) ) ( not ( = ?auto_2591711 ?auto_2591722 ) ) ( not ( = ?auto_2591711 ?auto_2591723 ) ) ( not ( = ?auto_2591711 ?auto_2591724 ) ) ( not ( = ?auto_2591711 ?auto_2591725 ) ) ( not ( = ?auto_2591711 ?auto_2591728 ) ) ( not ( = ?auto_2591712 ?auto_2591713 ) ) ( not ( = ?auto_2591712 ?auto_2591714 ) ) ( not ( = ?auto_2591712 ?auto_2591715 ) ) ( not ( = ?auto_2591712 ?auto_2591716 ) ) ( not ( = ?auto_2591712 ?auto_2591717 ) ) ( not ( = ?auto_2591712 ?auto_2591718 ) ) ( not ( = ?auto_2591712 ?auto_2591719 ) ) ( not ( = ?auto_2591712 ?auto_2591720 ) ) ( not ( = ?auto_2591712 ?auto_2591721 ) ) ( not ( = ?auto_2591712 ?auto_2591722 ) ) ( not ( = ?auto_2591712 ?auto_2591723 ) ) ( not ( = ?auto_2591712 ?auto_2591724 ) ) ( not ( = ?auto_2591712 ?auto_2591725 ) ) ( not ( = ?auto_2591712 ?auto_2591728 ) ) ( not ( = ?auto_2591713 ?auto_2591714 ) ) ( not ( = ?auto_2591713 ?auto_2591715 ) ) ( not ( = ?auto_2591713 ?auto_2591716 ) ) ( not ( = ?auto_2591713 ?auto_2591717 ) ) ( not ( = ?auto_2591713 ?auto_2591718 ) ) ( not ( = ?auto_2591713 ?auto_2591719 ) ) ( not ( = ?auto_2591713 ?auto_2591720 ) ) ( not ( = ?auto_2591713 ?auto_2591721 ) ) ( not ( = ?auto_2591713 ?auto_2591722 ) ) ( not ( = ?auto_2591713 ?auto_2591723 ) ) ( not ( = ?auto_2591713 ?auto_2591724 ) ) ( not ( = ?auto_2591713 ?auto_2591725 ) ) ( not ( = ?auto_2591713 ?auto_2591728 ) ) ( not ( = ?auto_2591714 ?auto_2591715 ) ) ( not ( = ?auto_2591714 ?auto_2591716 ) ) ( not ( = ?auto_2591714 ?auto_2591717 ) ) ( not ( = ?auto_2591714 ?auto_2591718 ) ) ( not ( = ?auto_2591714 ?auto_2591719 ) ) ( not ( = ?auto_2591714 ?auto_2591720 ) ) ( not ( = ?auto_2591714 ?auto_2591721 ) ) ( not ( = ?auto_2591714 ?auto_2591722 ) ) ( not ( = ?auto_2591714 ?auto_2591723 ) ) ( not ( = ?auto_2591714 ?auto_2591724 ) ) ( not ( = ?auto_2591714 ?auto_2591725 ) ) ( not ( = ?auto_2591714 ?auto_2591728 ) ) ( not ( = ?auto_2591715 ?auto_2591716 ) ) ( not ( = ?auto_2591715 ?auto_2591717 ) ) ( not ( = ?auto_2591715 ?auto_2591718 ) ) ( not ( = ?auto_2591715 ?auto_2591719 ) ) ( not ( = ?auto_2591715 ?auto_2591720 ) ) ( not ( = ?auto_2591715 ?auto_2591721 ) ) ( not ( = ?auto_2591715 ?auto_2591722 ) ) ( not ( = ?auto_2591715 ?auto_2591723 ) ) ( not ( = ?auto_2591715 ?auto_2591724 ) ) ( not ( = ?auto_2591715 ?auto_2591725 ) ) ( not ( = ?auto_2591715 ?auto_2591728 ) ) ( not ( = ?auto_2591716 ?auto_2591717 ) ) ( not ( = ?auto_2591716 ?auto_2591718 ) ) ( not ( = ?auto_2591716 ?auto_2591719 ) ) ( not ( = ?auto_2591716 ?auto_2591720 ) ) ( not ( = ?auto_2591716 ?auto_2591721 ) ) ( not ( = ?auto_2591716 ?auto_2591722 ) ) ( not ( = ?auto_2591716 ?auto_2591723 ) ) ( not ( = ?auto_2591716 ?auto_2591724 ) ) ( not ( = ?auto_2591716 ?auto_2591725 ) ) ( not ( = ?auto_2591716 ?auto_2591728 ) ) ( not ( = ?auto_2591717 ?auto_2591718 ) ) ( not ( = ?auto_2591717 ?auto_2591719 ) ) ( not ( = ?auto_2591717 ?auto_2591720 ) ) ( not ( = ?auto_2591717 ?auto_2591721 ) ) ( not ( = ?auto_2591717 ?auto_2591722 ) ) ( not ( = ?auto_2591717 ?auto_2591723 ) ) ( not ( = ?auto_2591717 ?auto_2591724 ) ) ( not ( = ?auto_2591717 ?auto_2591725 ) ) ( not ( = ?auto_2591717 ?auto_2591728 ) ) ( not ( = ?auto_2591718 ?auto_2591719 ) ) ( not ( = ?auto_2591718 ?auto_2591720 ) ) ( not ( = ?auto_2591718 ?auto_2591721 ) ) ( not ( = ?auto_2591718 ?auto_2591722 ) ) ( not ( = ?auto_2591718 ?auto_2591723 ) ) ( not ( = ?auto_2591718 ?auto_2591724 ) ) ( not ( = ?auto_2591718 ?auto_2591725 ) ) ( not ( = ?auto_2591718 ?auto_2591728 ) ) ( not ( = ?auto_2591719 ?auto_2591720 ) ) ( not ( = ?auto_2591719 ?auto_2591721 ) ) ( not ( = ?auto_2591719 ?auto_2591722 ) ) ( not ( = ?auto_2591719 ?auto_2591723 ) ) ( not ( = ?auto_2591719 ?auto_2591724 ) ) ( not ( = ?auto_2591719 ?auto_2591725 ) ) ( not ( = ?auto_2591719 ?auto_2591728 ) ) ( not ( = ?auto_2591720 ?auto_2591721 ) ) ( not ( = ?auto_2591720 ?auto_2591722 ) ) ( not ( = ?auto_2591720 ?auto_2591723 ) ) ( not ( = ?auto_2591720 ?auto_2591724 ) ) ( not ( = ?auto_2591720 ?auto_2591725 ) ) ( not ( = ?auto_2591720 ?auto_2591728 ) ) ( not ( = ?auto_2591721 ?auto_2591722 ) ) ( not ( = ?auto_2591721 ?auto_2591723 ) ) ( not ( = ?auto_2591721 ?auto_2591724 ) ) ( not ( = ?auto_2591721 ?auto_2591725 ) ) ( not ( = ?auto_2591721 ?auto_2591728 ) ) ( not ( = ?auto_2591722 ?auto_2591723 ) ) ( not ( = ?auto_2591722 ?auto_2591724 ) ) ( not ( = ?auto_2591722 ?auto_2591725 ) ) ( not ( = ?auto_2591722 ?auto_2591728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591723 ?auto_2591724 ?auto_2591725 )
      ( MAKE-14CRATE-VERIFY ?auto_2591711 ?auto_2591712 ?auto_2591713 ?auto_2591714 ?auto_2591715 ?auto_2591716 ?auto_2591717 ?auto_2591718 ?auto_2591719 ?auto_2591720 ?auto_2591721 ?auto_2591722 ?auto_2591723 ?auto_2591724 ?auto_2591725 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2591915 - SURFACE
      ?auto_2591916 - SURFACE
      ?auto_2591917 - SURFACE
      ?auto_2591918 - SURFACE
      ?auto_2591919 - SURFACE
      ?auto_2591920 - SURFACE
      ?auto_2591921 - SURFACE
      ?auto_2591922 - SURFACE
      ?auto_2591923 - SURFACE
      ?auto_2591924 - SURFACE
      ?auto_2591925 - SURFACE
      ?auto_2591926 - SURFACE
      ?auto_2591927 - SURFACE
      ?auto_2591928 - SURFACE
      ?auto_2591929 - SURFACE
    )
    :vars
    (
      ?auto_2591930 - HOIST
      ?auto_2591934 - PLACE
      ?auto_2591932 - PLACE
      ?auto_2591935 - HOIST
      ?auto_2591933 - SURFACE
      ?auto_2591931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2591930 ?auto_2591934 ) ( IS-CRATE ?auto_2591929 ) ( not ( = ?auto_2591928 ?auto_2591929 ) ) ( not ( = ?auto_2591927 ?auto_2591928 ) ) ( not ( = ?auto_2591927 ?auto_2591929 ) ) ( not ( = ?auto_2591932 ?auto_2591934 ) ) ( HOIST-AT ?auto_2591935 ?auto_2591932 ) ( not ( = ?auto_2591930 ?auto_2591935 ) ) ( AVAILABLE ?auto_2591935 ) ( SURFACE-AT ?auto_2591929 ?auto_2591932 ) ( ON ?auto_2591929 ?auto_2591933 ) ( CLEAR ?auto_2591929 ) ( not ( = ?auto_2591928 ?auto_2591933 ) ) ( not ( = ?auto_2591929 ?auto_2591933 ) ) ( not ( = ?auto_2591927 ?auto_2591933 ) ) ( TRUCK-AT ?auto_2591931 ?auto_2591934 ) ( SURFACE-AT ?auto_2591927 ?auto_2591934 ) ( CLEAR ?auto_2591927 ) ( IS-CRATE ?auto_2591928 ) ( AVAILABLE ?auto_2591930 ) ( IN ?auto_2591928 ?auto_2591931 ) ( ON ?auto_2591916 ?auto_2591915 ) ( ON ?auto_2591917 ?auto_2591916 ) ( ON ?auto_2591918 ?auto_2591917 ) ( ON ?auto_2591919 ?auto_2591918 ) ( ON ?auto_2591920 ?auto_2591919 ) ( ON ?auto_2591921 ?auto_2591920 ) ( ON ?auto_2591922 ?auto_2591921 ) ( ON ?auto_2591923 ?auto_2591922 ) ( ON ?auto_2591924 ?auto_2591923 ) ( ON ?auto_2591925 ?auto_2591924 ) ( ON ?auto_2591926 ?auto_2591925 ) ( ON ?auto_2591927 ?auto_2591926 ) ( not ( = ?auto_2591915 ?auto_2591916 ) ) ( not ( = ?auto_2591915 ?auto_2591917 ) ) ( not ( = ?auto_2591915 ?auto_2591918 ) ) ( not ( = ?auto_2591915 ?auto_2591919 ) ) ( not ( = ?auto_2591915 ?auto_2591920 ) ) ( not ( = ?auto_2591915 ?auto_2591921 ) ) ( not ( = ?auto_2591915 ?auto_2591922 ) ) ( not ( = ?auto_2591915 ?auto_2591923 ) ) ( not ( = ?auto_2591915 ?auto_2591924 ) ) ( not ( = ?auto_2591915 ?auto_2591925 ) ) ( not ( = ?auto_2591915 ?auto_2591926 ) ) ( not ( = ?auto_2591915 ?auto_2591927 ) ) ( not ( = ?auto_2591915 ?auto_2591928 ) ) ( not ( = ?auto_2591915 ?auto_2591929 ) ) ( not ( = ?auto_2591915 ?auto_2591933 ) ) ( not ( = ?auto_2591916 ?auto_2591917 ) ) ( not ( = ?auto_2591916 ?auto_2591918 ) ) ( not ( = ?auto_2591916 ?auto_2591919 ) ) ( not ( = ?auto_2591916 ?auto_2591920 ) ) ( not ( = ?auto_2591916 ?auto_2591921 ) ) ( not ( = ?auto_2591916 ?auto_2591922 ) ) ( not ( = ?auto_2591916 ?auto_2591923 ) ) ( not ( = ?auto_2591916 ?auto_2591924 ) ) ( not ( = ?auto_2591916 ?auto_2591925 ) ) ( not ( = ?auto_2591916 ?auto_2591926 ) ) ( not ( = ?auto_2591916 ?auto_2591927 ) ) ( not ( = ?auto_2591916 ?auto_2591928 ) ) ( not ( = ?auto_2591916 ?auto_2591929 ) ) ( not ( = ?auto_2591916 ?auto_2591933 ) ) ( not ( = ?auto_2591917 ?auto_2591918 ) ) ( not ( = ?auto_2591917 ?auto_2591919 ) ) ( not ( = ?auto_2591917 ?auto_2591920 ) ) ( not ( = ?auto_2591917 ?auto_2591921 ) ) ( not ( = ?auto_2591917 ?auto_2591922 ) ) ( not ( = ?auto_2591917 ?auto_2591923 ) ) ( not ( = ?auto_2591917 ?auto_2591924 ) ) ( not ( = ?auto_2591917 ?auto_2591925 ) ) ( not ( = ?auto_2591917 ?auto_2591926 ) ) ( not ( = ?auto_2591917 ?auto_2591927 ) ) ( not ( = ?auto_2591917 ?auto_2591928 ) ) ( not ( = ?auto_2591917 ?auto_2591929 ) ) ( not ( = ?auto_2591917 ?auto_2591933 ) ) ( not ( = ?auto_2591918 ?auto_2591919 ) ) ( not ( = ?auto_2591918 ?auto_2591920 ) ) ( not ( = ?auto_2591918 ?auto_2591921 ) ) ( not ( = ?auto_2591918 ?auto_2591922 ) ) ( not ( = ?auto_2591918 ?auto_2591923 ) ) ( not ( = ?auto_2591918 ?auto_2591924 ) ) ( not ( = ?auto_2591918 ?auto_2591925 ) ) ( not ( = ?auto_2591918 ?auto_2591926 ) ) ( not ( = ?auto_2591918 ?auto_2591927 ) ) ( not ( = ?auto_2591918 ?auto_2591928 ) ) ( not ( = ?auto_2591918 ?auto_2591929 ) ) ( not ( = ?auto_2591918 ?auto_2591933 ) ) ( not ( = ?auto_2591919 ?auto_2591920 ) ) ( not ( = ?auto_2591919 ?auto_2591921 ) ) ( not ( = ?auto_2591919 ?auto_2591922 ) ) ( not ( = ?auto_2591919 ?auto_2591923 ) ) ( not ( = ?auto_2591919 ?auto_2591924 ) ) ( not ( = ?auto_2591919 ?auto_2591925 ) ) ( not ( = ?auto_2591919 ?auto_2591926 ) ) ( not ( = ?auto_2591919 ?auto_2591927 ) ) ( not ( = ?auto_2591919 ?auto_2591928 ) ) ( not ( = ?auto_2591919 ?auto_2591929 ) ) ( not ( = ?auto_2591919 ?auto_2591933 ) ) ( not ( = ?auto_2591920 ?auto_2591921 ) ) ( not ( = ?auto_2591920 ?auto_2591922 ) ) ( not ( = ?auto_2591920 ?auto_2591923 ) ) ( not ( = ?auto_2591920 ?auto_2591924 ) ) ( not ( = ?auto_2591920 ?auto_2591925 ) ) ( not ( = ?auto_2591920 ?auto_2591926 ) ) ( not ( = ?auto_2591920 ?auto_2591927 ) ) ( not ( = ?auto_2591920 ?auto_2591928 ) ) ( not ( = ?auto_2591920 ?auto_2591929 ) ) ( not ( = ?auto_2591920 ?auto_2591933 ) ) ( not ( = ?auto_2591921 ?auto_2591922 ) ) ( not ( = ?auto_2591921 ?auto_2591923 ) ) ( not ( = ?auto_2591921 ?auto_2591924 ) ) ( not ( = ?auto_2591921 ?auto_2591925 ) ) ( not ( = ?auto_2591921 ?auto_2591926 ) ) ( not ( = ?auto_2591921 ?auto_2591927 ) ) ( not ( = ?auto_2591921 ?auto_2591928 ) ) ( not ( = ?auto_2591921 ?auto_2591929 ) ) ( not ( = ?auto_2591921 ?auto_2591933 ) ) ( not ( = ?auto_2591922 ?auto_2591923 ) ) ( not ( = ?auto_2591922 ?auto_2591924 ) ) ( not ( = ?auto_2591922 ?auto_2591925 ) ) ( not ( = ?auto_2591922 ?auto_2591926 ) ) ( not ( = ?auto_2591922 ?auto_2591927 ) ) ( not ( = ?auto_2591922 ?auto_2591928 ) ) ( not ( = ?auto_2591922 ?auto_2591929 ) ) ( not ( = ?auto_2591922 ?auto_2591933 ) ) ( not ( = ?auto_2591923 ?auto_2591924 ) ) ( not ( = ?auto_2591923 ?auto_2591925 ) ) ( not ( = ?auto_2591923 ?auto_2591926 ) ) ( not ( = ?auto_2591923 ?auto_2591927 ) ) ( not ( = ?auto_2591923 ?auto_2591928 ) ) ( not ( = ?auto_2591923 ?auto_2591929 ) ) ( not ( = ?auto_2591923 ?auto_2591933 ) ) ( not ( = ?auto_2591924 ?auto_2591925 ) ) ( not ( = ?auto_2591924 ?auto_2591926 ) ) ( not ( = ?auto_2591924 ?auto_2591927 ) ) ( not ( = ?auto_2591924 ?auto_2591928 ) ) ( not ( = ?auto_2591924 ?auto_2591929 ) ) ( not ( = ?auto_2591924 ?auto_2591933 ) ) ( not ( = ?auto_2591925 ?auto_2591926 ) ) ( not ( = ?auto_2591925 ?auto_2591927 ) ) ( not ( = ?auto_2591925 ?auto_2591928 ) ) ( not ( = ?auto_2591925 ?auto_2591929 ) ) ( not ( = ?auto_2591925 ?auto_2591933 ) ) ( not ( = ?auto_2591926 ?auto_2591927 ) ) ( not ( = ?auto_2591926 ?auto_2591928 ) ) ( not ( = ?auto_2591926 ?auto_2591929 ) ) ( not ( = ?auto_2591926 ?auto_2591933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2591927 ?auto_2591928 ?auto_2591929 )
      ( MAKE-14CRATE-VERIFY ?auto_2591915 ?auto_2591916 ?auto_2591917 ?auto_2591918 ?auto_2591919 ?auto_2591920 ?auto_2591921 ?auto_2591922 ?auto_2591923 ?auto_2591924 ?auto_2591925 ?auto_2591926 ?auto_2591927 ?auto_2591928 ?auto_2591929 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609135 - SURFACE
      ?auto_2609136 - SURFACE
      ?auto_2609137 - SURFACE
      ?auto_2609138 - SURFACE
      ?auto_2609139 - SURFACE
      ?auto_2609140 - SURFACE
      ?auto_2609141 - SURFACE
      ?auto_2609142 - SURFACE
      ?auto_2609143 - SURFACE
      ?auto_2609144 - SURFACE
      ?auto_2609145 - SURFACE
      ?auto_2609146 - SURFACE
      ?auto_2609147 - SURFACE
      ?auto_2609148 - SURFACE
      ?auto_2609149 - SURFACE
      ?auto_2609150 - SURFACE
    )
    :vars
    (
      ?auto_2609151 - HOIST
      ?auto_2609152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609151 ?auto_2609152 ) ( SURFACE-AT ?auto_2609149 ?auto_2609152 ) ( CLEAR ?auto_2609149 ) ( LIFTING ?auto_2609151 ?auto_2609150 ) ( IS-CRATE ?auto_2609150 ) ( not ( = ?auto_2609149 ?auto_2609150 ) ) ( ON ?auto_2609136 ?auto_2609135 ) ( ON ?auto_2609137 ?auto_2609136 ) ( ON ?auto_2609138 ?auto_2609137 ) ( ON ?auto_2609139 ?auto_2609138 ) ( ON ?auto_2609140 ?auto_2609139 ) ( ON ?auto_2609141 ?auto_2609140 ) ( ON ?auto_2609142 ?auto_2609141 ) ( ON ?auto_2609143 ?auto_2609142 ) ( ON ?auto_2609144 ?auto_2609143 ) ( ON ?auto_2609145 ?auto_2609144 ) ( ON ?auto_2609146 ?auto_2609145 ) ( ON ?auto_2609147 ?auto_2609146 ) ( ON ?auto_2609148 ?auto_2609147 ) ( ON ?auto_2609149 ?auto_2609148 ) ( not ( = ?auto_2609135 ?auto_2609136 ) ) ( not ( = ?auto_2609135 ?auto_2609137 ) ) ( not ( = ?auto_2609135 ?auto_2609138 ) ) ( not ( = ?auto_2609135 ?auto_2609139 ) ) ( not ( = ?auto_2609135 ?auto_2609140 ) ) ( not ( = ?auto_2609135 ?auto_2609141 ) ) ( not ( = ?auto_2609135 ?auto_2609142 ) ) ( not ( = ?auto_2609135 ?auto_2609143 ) ) ( not ( = ?auto_2609135 ?auto_2609144 ) ) ( not ( = ?auto_2609135 ?auto_2609145 ) ) ( not ( = ?auto_2609135 ?auto_2609146 ) ) ( not ( = ?auto_2609135 ?auto_2609147 ) ) ( not ( = ?auto_2609135 ?auto_2609148 ) ) ( not ( = ?auto_2609135 ?auto_2609149 ) ) ( not ( = ?auto_2609135 ?auto_2609150 ) ) ( not ( = ?auto_2609136 ?auto_2609137 ) ) ( not ( = ?auto_2609136 ?auto_2609138 ) ) ( not ( = ?auto_2609136 ?auto_2609139 ) ) ( not ( = ?auto_2609136 ?auto_2609140 ) ) ( not ( = ?auto_2609136 ?auto_2609141 ) ) ( not ( = ?auto_2609136 ?auto_2609142 ) ) ( not ( = ?auto_2609136 ?auto_2609143 ) ) ( not ( = ?auto_2609136 ?auto_2609144 ) ) ( not ( = ?auto_2609136 ?auto_2609145 ) ) ( not ( = ?auto_2609136 ?auto_2609146 ) ) ( not ( = ?auto_2609136 ?auto_2609147 ) ) ( not ( = ?auto_2609136 ?auto_2609148 ) ) ( not ( = ?auto_2609136 ?auto_2609149 ) ) ( not ( = ?auto_2609136 ?auto_2609150 ) ) ( not ( = ?auto_2609137 ?auto_2609138 ) ) ( not ( = ?auto_2609137 ?auto_2609139 ) ) ( not ( = ?auto_2609137 ?auto_2609140 ) ) ( not ( = ?auto_2609137 ?auto_2609141 ) ) ( not ( = ?auto_2609137 ?auto_2609142 ) ) ( not ( = ?auto_2609137 ?auto_2609143 ) ) ( not ( = ?auto_2609137 ?auto_2609144 ) ) ( not ( = ?auto_2609137 ?auto_2609145 ) ) ( not ( = ?auto_2609137 ?auto_2609146 ) ) ( not ( = ?auto_2609137 ?auto_2609147 ) ) ( not ( = ?auto_2609137 ?auto_2609148 ) ) ( not ( = ?auto_2609137 ?auto_2609149 ) ) ( not ( = ?auto_2609137 ?auto_2609150 ) ) ( not ( = ?auto_2609138 ?auto_2609139 ) ) ( not ( = ?auto_2609138 ?auto_2609140 ) ) ( not ( = ?auto_2609138 ?auto_2609141 ) ) ( not ( = ?auto_2609138 ?auto_2609142 ) ) ( not ( = ?auto_2609138 ?auto_2609143 ) ) ( not ( = ?auto_2609138 ?auto_2609144 ) ) ( not ( = ?auto_2609138 ?auto_2609145 ) ) ( not ( = ?auto_2609138 ?auto_2609146 ) ) ( not ( = ?auto_2609138 ?auto_2609147 ) ) ( not ( = ?auto_2609138 ?auto_2609148 ) ) ( not ( = ?auto_2609138 ?auto_2609149 ) ) ( not ( = ?auto_2609138 ?auto_2609150 ) ) ( not ( = ?auto_2609139 ?auto_2609140 ) ) ( not ( = ?auto_2609139 ?auto_2609141 ) ) ( not ( = ?auto_2609139 ?auto_2609142 ) ) ( not ( = ?auto_2609139 ?auto_2609143 ) ) ( not ( = ?auto_2609139 ?auto_2609144 ) ) ( not ( = ?auto_2609139 ?auto_2609145 ) ) ( not ( = ?auto_2609139 ?auto_2609146 ) ) ( not ( = ?auto_2609139 ?auto_2609147 ) ) ( not ( = ?auto_2609139 ?auto_2609148 ) ) ( not ( = ?auto_2609139 ?auto_2609149 ) ) ( not ( = ?auto_2609139 ?auto_2609150 ) ) ( not ( = ?auto_2609140 ?auto_2609141 ) ) ( not ( = ?auto_2609140 ?auto_2609142 ) ) ( not ( = ?auto_2609140 ?auto_2609143 ) ) ( not ( = ?auto_2609140 ?auto_2609144 ) ) ( not ( = ?auto_2609140 ?auto_2609145 ) ) ( not ( = ?auto_2609140 ?auto_2609146 ) ) ( not ( = ?auto_2609140 ?auto_2609147 ) ) ( not ( = ?auto_2609140 ?auto_2609148 ) ) ( not ( = ?auto_2609140 ?auto_2609149 ) ) ( not ( = ?auto_2609140 ?auto_2609150 ) ) ( not ( = ?auto_2609141 ?auto_2609142 ) ) ( not ( = ?auto_2609141 ?auto_2609143 ) ) ( not ( = ?auto_2609141 ?auto_2609144 ) ) ( not ( = ?auto_2609141 ?auto_2609145 ) ) ( not ( = ?auto_2609141 ?auto_2609146 ) ) ( not ( = ?auto_2609141 ?auto_2609147 ) ) ( not ( = ?auto_2609141 ?auto_2609148 ) ) ( not ( = ?auto_2609141 ?auto_2609149 ) ) ( not ( = ?auto_2609141 ?auto_2609150 ) ) ( not ( = ?auto_2609142 ?auto_2609143 ) ) ( not ( = ?auto_2609142 ?auto_2609144 ) ) ( not ( = ?auto_2609142 ?auto_2609145 ) ) ( not ( = ?auto_2609142 ?auto_2609146 ) ) ( not ( = ?auto_2609142 ?auto_2609147 ) ) ( not ( = ?auto_2609142 ?auto_2609148 ) ) ( not ( = ?auto_2609142 ?auto_2609149 ) ) ( not ( = ?auto_2609142 ?auto_2609150 ) ) ( not ( = ?auto_2609143 ?auto_2609144 ) ) ( not ( = ?auto_2609143 ?auto_2609145 ) ) ( not ( = ?auto_2609143 ?auto_2609146 ) ) ( not ( = ?auto_2609143 ?auto_2609147 ) ) ( not ( = ?auto_2609143 ?auto_2609148 ) ) ( not ( = ?auto_2609143 ?auto_2609149 ) ) ( not ( = ?auto_2609143 ?auto_2609150 ) ) ( not ( = ?auto_2609144 ?auto_2609145 ) ) ( not ( = ?auto_2609144 ?auto_2609146 ) ) ( not ( = ?auto_2609144 ?auto_2609147 ) ) ( not ( = ?auto_2609144 ?auto_2609148 ) ) ( not ( = ?auto_2609144 ?auto_2609149 ) ) ( not ( = ?auto_2609144 ?auto_2609150 ) ) ( not ( = ?auto_2609145 ?auto_2609146 ) ) ( not ( = ?auto_2609145 ?auto_2609147 ) ) ( not ( = ?auto_2609145 ?auto_2609148 ) ) ( not ( = ?auto_2609145 ?auto_2609149 ) ) ( not ( = ?auto_2609145 ?auto_2609150 ) ) ( not ( = ?auto_2609146 ?auto_2609147 ) ) ( not ( = ?auto_2609146 ?auto_2609148 ) ) ( not ( = ?auto_2609146 ?auto_2609149 ) ) ( not ( = ?auto_2609146 ?auto_2609150 ) ) ( not ( = ?auto_2609147 ?auto_2609148 ) ) ( not ( = ?auto_2609147 ?auto_2609149 ) ) ( not ( = ?auto_2609147 ?auto_2609150 ) ) ( not ( = ?auto_2609148 ?auto_2609149 ) ) ( not ( = ?auto_2609148 ?auto_2609150 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2609149 ?auto_2609150 )
      ( MAKE-15CRATE-VERIFY ?auto_2609135 ?auto_2609136 ?auto_2609137 ?auto_2609138 ?auto_2609139 ?auto_2609140 ?auto_2609141 ?auto_2609142 ?auto_2609143 ?auto_2609144 ?auto_2609145 ?auto_2609146 ?auto_2609147 ?auto_2609148 ?auto_2609149 ?auto_2609150 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609314 - SURFACE
      ?auto_2609315 - SURFACE
      ?auto_2609316 - SURFACE
      ?auto_2609317 - SURFACE
      ?auto_2609318 - SURFACE
      ?auto_2609319 - SURFACE
      ?auto_2609320 - SURFACE
      ?auto_2609321 - SURFACE
      ?auto_2609322 - SURFACE
      ?auto_2609323 - SURFACE
      ?auto_2609324 - SURFACE
      ?auto_2609325 - SURFACE
      ?auto_2609326 - SURFACE
      ?auto_2609327 - SURFACE
      ?auto_2609328 - SURFACE
      ?auto_2609329 - SURFACE
    )
    :vars
    (
      ?auto_2609330 - HOIST
      ?auto_2609331 - PLACE
      ?auto_2609332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609330 ?auto_2609331 ) ( SURFACE-AT ?auto_2609328 ?auto_2609331 ) ( CLEAR ?auto_2609328 ) ( IS-CRATE ?auto_2609329 ) ( not ( = ?auto_2609328 ?auto_2609329 ) ) ( TRUCK-AT ?auto_2609332 ?auto_2609331 ) ( AVAILABLE ?auto_2609330 ) ( IN ?auto_2609329 ?auto_2609332 ) ( ON ?auto_2609328 ?auto_2609327 ) ( not ( = ?auto_2609327 ?auto_2609328 ) ) ( not ( = ?auto_2609327 ?auto_2609329 ) ) ( ON ?auto_2609315 ?auto_2609314 ) ( ON ?auto_2609316 ?auto_2609315 ) ( ON ?auto_2609317 ?auto_2609316 ) ( ON ?auto_2609318 ?auto_2609317 ) ( ON ?auto_2609319 ?auto_2609318 ) ( ON ?auto_2609320 ?auto_2609319 ) ( ON ?auto_2609321 ?auto_2609320 ) ( ON ?auto_2609322 ?auto_2609321 ) ( ON ?auto_2609323 ?auto_2609322 ) ( ON ?auto_2609324 ?auto_2609323 ) ( ON ?auto_2609325 ?auto_2609324 ) ( ON ?auto_2609326 ?auto_2609325 ) ( ON ?auto_2609327 ?auto_2609326 ) ( not ( = ?auto_2609314 ?auto_2609315 ) ) ( not ( = ?auto_2609314 ?auto_2609316 ) ) ( not ( = ?auto_2609314 ?auto_2609317 ) ) ( not ( = ?auto_2609314 ?auto_2609318 ) ) ( not ( = ?auto_2609314 ?auto_2609319 ) ) ( not ( = ?auto_2609314 ?auto_2609320 ) ) ( not ( = ?auto_2609314 ?auto_2609321 ) ) ( not ( = ?auto_2609314 ?auto_2609322 ) ) ( not ( = ?auto_2609314 ?auto_2609323 ) ) ( not ( = ?auto_2609314 ?auto_2609324 ) ) ( not ( = ?auto_2609314 ?auto_2609325 ) ) ( not ( = ?auto_2609314 ?auto_2609326 ) ) ( not ( = ?auto_2609314 ?auto_2609327 ) ) ( not ( = ?auto_2609314 ?auto_2609328 ) ) ( not ( = ?auto_2609314 ?auto_2609329 ) ) ( not ( = ?auto_2609315 ?auto_2609316 ) ) ( not ( = ?auto_2609315 ?auto_2609317 ) ) ( not ( = ?auto_2609315 ?auto_2609318 ) ) ( not ( = ?auto_2609315 ?auto_2609319 ) ) ( not ( = ?auto_2609315 ?auto_2609320 ) ) ( not ( = ?auto_2609315 ?auto_2609321 ) ) ( not ( = ?auto_2609315 ?auto_2609322 ) ) ( not ( = ?auto_2609315 ?auto_2609323 ) ) ( not ( = ?auto_2609315 ?auto_2609324 ) ) ( not ( = ?auto_2609315 ?auto_2609325 ) ) ( not ( = ?auto_2609315 ?auto_2609326 ) ) ( not ( = ?auto_2609315 ?auto_2609327 ) ) ( not ( = ?auto_2609315 ?auto_2609328 ) ) ( not ( = ?auto_2609315 ?auto_2609329 ) ) ( not ( = ?auto_2609316 ?auto_2609317 ) ) ( not ( = ?auto_2609316 ?auto_2609318 ) ) ( not ( = ?auto_2609316 ?auto_2609319 ) ) ( not ( = ?auto_2609316 ?auto_2609320 ) ) ( not ( = ?auto_2609316 ?auto_2609321 ) ) ( not ( = ?auto_2609316 ?auto_2609322 ) ) ( not ( = ?auto_2609316 ?auto_2609323 ) ) ( not ( = ?auto_2609316 ?auto_2609324 ) ) ( not ( = ?auto_2609316 ?auto_2609325 ) ) ( not ( = ?auto_2609316 ?auto_2609326 ) ) ( not ( = ?auto_2609316 ?auto_2609327 ) ) ( not ( = ?auto_2609316 ?auto_2609328 ) ) ( not ( = ?auto_2609316 ?auto_2609329 ) ) ( not ( = ?auto_2609317 ?auto_2609318 ) ) ( not ( = ?auto_2609317 ?auto_2609319 ) ) ( not ( = ?auto_2609317 ?auto_2609320 ) ) ( not ( = ?auto_2609317 ?auto_2609321 ) ) ( not ( = ?auto_2609317 ?auto_2609322 ) ) ( not ( = ?auto_2609317 ?auto_2609323 ) ) ( not ( = ?auto_2609317 ?auto_2609324 ) ) ( not ( = ?auto_2609317 ?auto_2609325 ) ) ( not ( = ?auto_2609317 ?auto_2609326 ) ) ( not ( = ?auto_2609317 ?auto_2609327 ) ) ( not ( = ?auto_2609317 ?auto_2609328 ) ) ( not ( = ?auto_2609317 ?auto_2609329 ) ) ( not ( = ?auto_2609318 ?auto_2609319 ) ) ( not ( = ?auto_2609318 ?auto_2609320 ) ) ( not ( = ?auto_2609318 ?auto_2609321 ) ) ( not ( = ?auto_2609318 ?auto_2609322 ) ) ( not ( = ?auto_2609318 ?auto_2609323 ) ) ( not ( = ?auto_2609318 ?auto_2609324 ) ) ( not ( = ?auto_2609318 ?auto_2609325 ) ) ( not ( = ?auto_2609318 ?auto_2609326 ) ) ( not ( = ?auto_2609318 ?auto_2609327 ) ) ( not ( = ?auto_2609318 ?auto_2609328 ) ) ( not ( = ?auto_2609318 ?auto_2609329 ) ) ( not ( = ?auto_2609319 ?auto_2609320 ) ) ( not ( = ?auto_2609319 ?auto_2609321 ) ) ( not ( = ?auto_2609319 ?auto_2609322 ) ) ( not ( = ?auto_2609319 ?auto_2609323 ) ) ( not ( = ?auto_2609319 ?auto_2609324 ) ) ( not ( = ?auto_2609319 ?auto_2609325 ) ) ( not ( = ?auto_2609319 ?auto_2609326 ) ) ( not ( = ?auto_2609319 ?auto_2609327 ) ) ( not ( = ?auto_2609319 ?auto_2609328 ) ) ( not ( = ?auto_2609319 ?auto_2609329 ) ) ( not ( = ?auto_2609320 ?auto_2609321 ) ) ( not ( = ?auto_2609320 ?auto_2609322 ) ) ( not ( = ?auto_2609320 ?auto_2609323 ) ) ( not ( = ?auto_2609320 ?auto_2609324 ) ) ( not ( = ?auto_2609320 ?auto_2609325 ) ) ( not ( = ?auto_2609320 ?auto_2609326 ) ) ( not ( = ?auto_2609320 ?auto_2609327 ) ) ( not ( = ?auto_2609320 ?auto_2609328 ) ) ( not ( = ?auto_2609320 ?auto_2609329 ) ) ( not ( = ?auto_2609321 ?auto_2609322 ) ) ( not ( = ?auto_2609321 ?auto_2609323 ) ) ( not ( = ?auto_2609321 ?auto_2609324 ) ) ( not ( = ?auto_2609321 ?auto_2609325 ) ) ( not ( = ?auto_2609321 ?auto_2609326 ) ) ( not ( = ?auto_2609321 ?auto_2609327 ) ) ( not ( = ?auto_2609321 ?auto_2609328 ) ) ( not ( = ?auto_2609321 ?auto_2609329 ) ) ( not ( = ?auto_2609322 ?auto_2609323 ) ) ( not ( = ?auto_2609322 ?auto_2609324 ) ) ( not ( = ?auto_2609322 ?auto_2609325 ) ) ( not ( = ?auto_2609322 ?auto_2609326 ) ) ( not ( = ?auto_2609322 ?auto_2609327 ) ) ( not ( = ?auto_2609322 ?auto_2609328 ) ) ( not ( = ?auto_2609322 ?auto_2609329 ) ) ( not ( = ?auto_2609323 ?auto_2609324 ) ) ( not ( = ?auto_2609323 ?auto_2609325 ) ) ( not ( = ?auto_2609323 ?auto_2609326 ) ) ( not ( = ?auto_2609323 ?auto_2609327 ) ) ( not ( = ?auto_2609323 ?auto_2609328 ) ) ( not ( = ?auto_2609323 ?auto_2609329 ) ) ( not ( = ?auto_2609324 ?auto_2609325 ) ) ( not ( = ?auto_2609324 ?auto_2609326 ) ) ( not ( = ?auto_2609324 ?auto_2609327 ) ) ( not ( = ?auto_2609324 ?auto_2609328 ) ) ( not ( = ?auto_2609324 ?auto_2609329 ) ) ( not ( = ?auto_2609325 ?auto_2609326 ) ) ( not ( = ?auto_2609325 ?auto_2609327 ) ) ( not ( = ?auto_2609325 ?auto_2609328 ) ) ( not ( = ?auto_2609325 ?auto_2609329 ) ) ( not ( = ?auto_2609326 ?auto_2609327 ) ) ( not ( = ?auto_2609326 ?auto_2609328 ) ) ( not ( = ?auto_2609326 ?auto_2609329 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2609327 ?auto_2609328 ?auto_2609329 )
      ( MAKE-15CRATE-VERIFY ?auto_2609314 ?auto_2609315 ?auto_2609316 ?auto_2609317 ?auto_2609318 ?auto_2609319 ?auto_2609320 ?auto_2609321 ?auto_2609322 ?auto_2609323 ?auto_2609324 ?auto_2609325 ?auto_2609326 ?auto_2609327 ?auto_2609328 ?auto_2609329 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609509 - SURFACE
      ?auto_2609510 - SURFACE
      ?auto_2609511 - SURFACE
      ?auto_2609512 - SURFACE
      ?auto_2609513 - SURFACE
      ?auto_2609514 - SURFACE
      ?auto_2609515 - SURFACE
      ?auto_2609516 - SURFACE
      ?auto_2609517 - SURFACE
      ?auto_2609518 - SURFACE
      ?auto_2609519 - SURFACE
      ?auto_2609520 - SURFACE
      ?auto_2609521 - SURFACE
      ?auto_2609522 - SURFACE
      ?auto_2609523 - SURFACE
      ?auto_2609524 - SURFACE
    )
    :vars
    (
      ?auto_2609525 - HOIST
      ?auto_2609528 - PLACE
      ?auto_2609526 - TRUCK
      ?auto_2609527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609525 ?auto_2609528 ) ( SURFACE-AT ?auto_2609523 ?auto_2609528 ) ( CLEAR ?auto_2609523 ) ( IS-CRATE ?auto_2609524 ) ( not ( = ?auto_2609523 ?auto_2609524 ) ) ( AVAILABLE ?auto_2609525 ) ( IN ?auto_2609524 ?auto_2609526 ) ( ON ?auto_2609523 ?auto_2609522 ) ( not ( = ?auto_2609522 ?auto_2609523 ) ) ( not ( = ?auto_2609522 ?auto_2609524 ) ) ( TRUCK-AT ?auto_2609526 ?auto_2609527 ) ( not ( = ?auto_2609527 ?auto_2609528 ) ) ( ON ?auto_2609510 ?auto_2609509 ) ( ON ?auto_2609511 ?auto_2609510 ) ( ON ?auto_2609512 ?auto_2609511 ) ( ON ?auto_2609513 ?auto_2609512 ) ( ON ?auto_2609514 ?auto_2609513 ) ( ON ?auto_2609515 ?auto_2609514 ) ( ON ?auto_2609516 ?auto_2609515 ) ( ON ?auto_2609517 ?auto_2609516 ) ( ON ?auto_2609518 ?auto_2609517 ) ( ON ?auto_2609519 ?auto_2609518 ) ( ON ?auto_2609520 ?auto_2609519 ) ( ON ?auto_2609521 ?auto_2609520 ) ( ON ?auto_2609522 ?auto_2609521 ) ( not ( = ?auto_2609509 ?auto_2609510 ) ) ( not ( = ?auto_2609509 ?auto_2609511 ) ) ( not ( = ?auto_2609509 ?auto_2609512 ) ) ( not ( = ?auto_2609509 ?auto_2609513 ) ) ( not ( = ?auto_2609509 ?auto_2609514 ) ) ( not ( = ?auto_2609509 ?auto_2609515 ) ) ( not ( = ?auto_2609509 ?auto_2609516 ) ) ( not ( = ?auto_2609509 ?auto_2609517 ) ) ( not ( = ?auto_2609509 ?auto_2609518 ) ) ( not ( = ?auto_2609509 ?auto_2609519 ) ) ( not ( = ?auto_2609509 ?auto_2609520 ) ) ( not ( = ?auto_2609509 ?auto_2609521 ) ) ( not ( = ?auto_2609509 ?auto_2609522 ) ) ( not ( = ?auto_2609509 ?auto_2609523 ) ) ( not ( = ?auto_2609509 ?auto_2609524 ) ) ( not ( = ?auto_2609510 ?auto_2609511 ) ) ( not ( = ?auto_2609510 ?auto_2609512 ) ) ( not ( = ?auto_2609510 ?auto_2609513 ) ) ( not ( = ?auto_2609510 ?auto_2609514 ) ) ( not ( = ?auto_2609510 ?auto_2609515 ) ) ( not ( = ?auto_2609510 ?auto_2609516 ) ) ( not ( = ?auto_2609510 ?auto_2609517 ) ) ( not ( = ?auto_2609510 ?auto_2609518 ) ) ( not ( = ?auto_2609510 ?auto_2609519 ) ) ( not ( = ?auto_2609510 ?auto_2609520 ) ) ( not ( = ?auto_2609510 ?auto_2609521 ) ) ( not ( = ?auto_2609510 ?auto_2609522 ) ) ( not ( = ?auto_2609510 ?auto_2609523 ) ) ( not ( = ?auto_2609510 ?auto_2609524 ) ) ( not ( = ?auto_2609511 ?auto_2609512 ) ) ( not ( = ?auto_2609511 ?auto_2609513 ) ) ( not ( = ?auto_2609511 ?auto_2609514 ) ) ( not ( = ?auto_2609511 ?auto_2609515 ) ) ( not ( = ?auto_2609511 ?auto_2609516 ) ) ( not ( = ?auto_2609511 ?auto_2609517 ) ) ( not ( = ?auto_2609511 ?auto_2609518 ) ) ( not ( = ?auto_2609511 ?auto_2609519 ) ) ( not ( = ?auto_2609511 ?auto_2609520 ) ) ( not ( = ?auto_2609511 ?auto_2609521 ) ) ( not ( = ?auto_2609511 ?auto_2609522 ) ) ( not ( = ?auto_2609511 ?auto_2609523 ) ) ( not ( = ?auto_2609511 ?auto_2609524 ) ) ( not ( = ?auto_2609512 ?auto_2609513 ) ) ( not ( = ?auto_2609512 ?auto_2609514 ) ) ( not ( = ?auto_2609512 ?auto_2609515 ) ) ( not ( = ?auto_2609512 ?auto_2609516 ) ) ( not ( = ?auto_2609512 ?auto_2609517 ) ) ( not ( = ?auto_2609512 ?auto_2609518 ) ) ( not ( = ?auto_2609512 ?auto_2609519 ) ) ( not ( = ?auto_2609512 ?auto_2609520 ) ) ( not ( = ?auto_2609512 ?auto_2609521 ) ) ( not ( = ?auto_2609512 ?auto_2609522 ) ) ( not ( = ?auto_2609512 ?auto_2609523 ) ) ( not ( = ?auto_2609512 ?auto_2609524 ) ) ( not ( = ?auto_2609513 ?auto_2609514 ) ) ( not ( = ?auto_2609513 ?auto_2609515 ) ) ( not ( = ?auto_2609513 ?auto_2609516 ) ) ( not ( = ?auto_2609513 ?auto_2609517 ) ) ( not ( = ?auto_2609513 ?auto_2609518 ) ) ( not ( = ?auto_2609513 ?auto_2609519 ) ) ( not ( = ?auto_2609513 ?auto_2609520 ) ) ( not ( = ?auto_2609513 ?auto_2609521 ) ) ( not ( = ?auto_2609513 ?auto_2609522 ) ) ( not ( = ?auto_2609513 ?auto_2609523 ) ) ( not ( = ?auto_2609513 ?auto_2609524 ) ) ( not ( = ?auto_2609514 ?auto_2609515 ) ) ( not ( = ?auto_2609514 ?auto_2609516 ) ) ( not ( = ?auto_2609514 ?auto_2609517 ) ) ( not ( = ?auto_2609514 ?auto_2609518 ) ) ( not ( = ?auto_2609514 ?auto_2609519 ) ) ( not ( = ?auto_2609514 ?auto_2609520 ) ) ( not ( = ?auto_2609514 ?auto_2609521 ) ) ( not ( = ?auto_2609514 ?auto_2609522 ) ) ( not ( = ?auto_2609514 ?auto_2609523 ) ) ( not ( = ?auto_2609514 ?auto_2609524 ) ) ( not ( = ?auto_2609515 ?auto_2609516 ) ) ( not ( = ?auto_2609515 ?auto_2609517 ) ) ( not ( = ?auto_2609515 ?auto_2609518 ) ) ( not ( = ?auto_2609515 ?auto_2609519 ) ) ( not ( = ?auto_2609515 ?auto_2609520 ) ) ( not ( = ?auto_2609515 ?auto_2609521 ) ) ( not ( = ?auto_2609515 ?auto_2609522 ) ) ( not ( = ?auto_2609515 ?auto_2609523 ) ) ( not ( = ?auto_2609515 ?auto_2609524 ) ) ( not ( = ?auto_2609516 ?auto_2609517 ) ) ( not ( = ?auto_2609516 ?auto_2609518 ) ) ( not ( = ?auto_2609516 ?auto_2609519 ) ) ( not ( = ?auto_2609516 ?auto_2609520 ) ) ( not ( = ?auto_2609516 ?auto_2609521 ) ) ( not ( = ?auto_2609516 ?auto_2609522 ) ) ( not ( = ?auto_2609516 ?auto_2609523 ) ) ( not ( = ?auto_2609516 ?auto_2609524 ) ) ( not ( = ?auto_2609517 ?auto_2609518 ) ) ( not ( = ?auto_2609517 ?auto_2609519 ) ) ( not ( = ?auto_2609517 ?auto_2609520 ) ) ( not ( = ?auto_2609517 ?auto_2609521 ) ) ( not ( = ?auto_2609517 ?auto_2609522 ) ) ( not ( = ?auto_2609517 ?auto_2609523 ) ) ( not ( = ?auto_2609517 ?auto_2609524 ) ) ( not ( = ?auto_2609518 ?auto_2609519 ) ) ( not ( = ?auto_2609518 ?auto_2609520 ) ) ( not ( = ?auto_2609518 ?auto_2609521 ) ) ( not ( = ?auto_2609518 ?auto_2609522 ) ) ( not ( = ?auto_2609518 ?auto_2609523 ) ) ( not ( = ?auto_2609518 ?auto_2609524 ) ) ( not ( = ?auto_2609519 ?auto_2609520 ) ) ( not ( = ?auto_2609519 ?auto_2609521 ) ) ( not ( = ?auto_2609519 ?auto_2609522 ) ) ( not ( = ?auto_2609519 ?auto_2609523 ) ) ( not ( = ?auto_2609519 ?auto_2609524 ) ) ( not ( = ?auto_2609520 ?auto_2609521 ) ) ( not ( = ?auto_2609520 ?auto_2609522 ) ) ( not ( = ?auto_2609520 ?auto_2609523 ) ) ( not ( = ?auto_2609520 ?auto_2609524 ) ) ( not ( = ?auto_2609521 ?auto_2609522 ) ) ( not ( = ?auto_2609521 ?auto_2609523 ) ) ( not ( = ?auto_2609521 ?auto_2609524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2609522 ?auto_2609523 ?auto_2609524 )
      ( MAKE-15CRATE-VERIFY ?auto_2609509 ?auto_2609510 ?auto_2609511 ?auto_2609512 ?auto_2609513 ?auto_2609514 ?auto_2609515 ?auto_2609516 ?auto_2609517 ?auto_2609518 ?auto_2609519 ?auto_2609520 ?auto_2609521 ?auto_2609522 ?auto_2609523 ?auto_2609524 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609719 - SURFACE
      ?auto_2609720 - SURFACE
      ?auto_2609721 - SURFACE
      ?auto_2609722 - SURFACE
      ?auto_2609723 - SURFACE
      ?auto_2609724 - SURFACE
      ?auto_2609725 - SURFACE
      ?auto_2609726 - SURFACE
      ?auto_2609727 - SURFACE
      ?auto_2609728 - SURFACE
      ?auto_2609729 - SURFACE
      ?auto_2609730 - SURFACE
      ?auto_2609731 - SURFACE
      ?auto_2609732 - SURFACE
      ?auto_2609733 - SURFACE
      ?auto_2609734 - SURFACE
    )
    :vars
    (
      ?auto_2609736 - HOIST
      ?auto_2609737 - PLACE
      ?auto_2609735 - TRUCK
      ?auto_2609739 - PLACE
      ?auto_2609738 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609736 ?auto_2609737 ) ( SURFACE-AT ?auto_2609733 ?auto_2609737 ) ( CLEAR ?auto_2609733 ) ( IS-CRATE ?auto_2609734 ) ( not ( = ?auto_2609733 ?auto_2609734 ) ) ( AVAILABLE ?auto_2609736 ) ( ON ?auto_2609733 ?auto_2609732 ) ( not ( = ?auto_2609732 ?auto_2609733 ) ) ( not ( = ?auto_2609732 ?auto_2609734 ) ) ( TRUCK-AT ?auto_2609735 ?auto_2609739 ) ( not ( = ?auto_2609739 ?auto_2609737 ) ) ( HOIST-AT ?auto_2609738 ?auto_2609739 ) ( LIFTING ?auto_2609738 ?auto_2609734 ) ( not ( = ?auto_2609736 ?auto_2609738 ) ) ( ON ?auto_2609720 ?auto_2609719 ) ( ON ?auto_2609721 ?auto_2609720 ) ( ON ?auto_2609722 ?auto_2609721 ) ( ON ?auto_2609723 ?auto_2609722 ) ( ON ?auto_2609724 ?auto_2609723 ) ( ON ?auto_2609725 ?auto_2609724 ) ( ON ?auto_2609726 ?auto_2609725 ) ( ON ?auto_2609727 ?auto_2609726 ) ( ON ?auto_2609728 ?auto_2609727 ) ( ON ?auto_2609729 ?auto_2609728 ) ( ON ?auto_2609730 ?auto_2609729 ) ( ON ?auto_2609731 ?auto_2609730 ) ( ON ?auto_2609732 ?auto_2609731 ) ( not ( = ?auto_2609719 ?auto_2609720 ) ) ( not ( = ?auto_2609719 ?auto_2609721 ) ) ( not ( = ?auto_2609719 ?auto_2609722 ) ) ( not ( = ?auto_2609719 ?auto_2609723 ) ) ( not ( = ?auto_2609719 ?auto_2609724 ) ) ( not ( = ?auto_2609719 ?auto_2609725 ) ) ( not ( = ?auto_2609719 ?auto_2609726 ) ) ( not ( = ?auto_2609719 ?auto_2609727 ) ) ( not ( = ?auto_2609719 ?auto_2609728 ) ) ( not ( = ?auto_2609719 ?auto_2609729 ) ) ( not ( = ?auto_2609719 ?auto_2609730 ) ) ( not ( = ?auto_2609719 ?auto_2609731 ) ) ( not ( = ?auto_2609719 ?auto_2609732 ) ) ( not ( = ?auto_2609719 ?auto_2609733 ) ) ( not ( = ?auto_2609719 ?auto_2609734 ) ) ( not ( = ?auto_2609720 ?auto_2609721 ) ) ( not ( = ?auto_2609720 ?auto_2609722 ) ) ( not ( = ?auto_2609720 ?auto_2609723 ) ) ( not ( = ?auto_2609720 ?auto_2609724 ) ) ( not ( = ?auto_2609720 ?auto_2609725 ) ) ( not ( = ?auto_2609720 ?auto_2609726 ) ) ( not ( = ?auto_2609720 ?auto_2609727 ) ) ( not ( = ?auto_2609720 ?auto_2609728 ) ) ( not ( = ?auto_2609720 ?auto_2609729 ) ) ( not ( = ?auto_2609720 ?auto_2609730 ) ) ( not ( = ?auto_2609720 ?auto_2609731 ) ) ( not ( = ?auto_2609720 ?auto_2609732 ) ) ( not ( = ?auto_2609720 ?auto_2609733 ) ) ( not ( = ?auto_2609720 ?auto_2609734 ) ) ( not ( = ?auto_2609721 ?auto_2609722 ) ) ( not ( = ?auto_2609721 ?auto_2609723 ) ) ( not ( = ?auto_2609721 ?auto_2609724 ) ) ( not ( = ?auto_2609721 ?auto_2609725 ) ) ( not ( = ?auto_2609721 ?auto_2609726 ) ) ( not ( = ?auto_2609721 ?auto_2609727 ) ) ( not ( = ?auto_2609721 ?auto_2609728 ) ) ( not ( = ?auto_2609721 ?auto_2609729 ) ) ( not ( = ?auto_2609721 ?auto_2609730 ) ) ( not ( = ?auto_2609721 ?auto_2609731 ) ) ( not ( = ?auto_2609721 ?auto_2609732 ) ) ( not ( = ?auto_2609721 ?auto_2609733 ) ) ( not ( = ?auto_2609721 ?auto_2609734 ) ) ( not ( = ?auto_2609722 ?auto_2609723 ) ) ( not ( = ?auto_2609722 ?auto_2609724 ) ) ( not ( = ?auto_2609722 ?auto_2609725 ) ) ( not ( = ?auto_2609722 ?auto_2609726 ) ) ( not ( = ?auto_2609722 ?auto_2609727 ) ) ( not ( = ?auto_2609722 ?auto_2609728 ) ) ( not ( = ?auto_2609722 ?auto_2609729 ) ) ( not ( = ?auto_2609722 ?auto_2609730 ) ) ( not ( = ?auto_2609722 ?auto_2609731 ) ) ( not ( = ?auto_2609722 ?auto_2609732 ) ) ( not ( = ?auto_2609722 ?auto_2609733 ) ) ( not ( = ?auto_2609722 ?auto_2609734 ) ) ( not ( = ?auto_2609723 ?auto_2609724 ) ) ( not ( = ?auto_2609723 ?auto_2609725 ) ) ( not ( = ?auto_2609723 ?auto_2609726 ) ) ( not ( = ?auto_2609723 ?auto_2609727 ) ) ( not ( = ?auto_2609723 ?auto_2609728 ) ) ( not ( = ?auto_2609723 ?auto_2609729 ) ) ( not ( = ?auto_2609723 ?auto_2609730 ) ) ( not ( = ?auto_2609723 ?auto_2609731 ) ) ( not ( = ?auto_2609723 ?auto_2609732 ) ) ( not ( = ?auto_2609723 ?auto_2609733 ) ) ( not ( = ?auto_2609723 ?auto_2609734 ) ) ( not ( = ?auto_2609724 ?auto_2609725 ) ) ( not ( = ?auto_2609724 ?auto_2609726 ) ) ( not ( = ?auto_2609724 ?auto_2609727 ) ) ( not ( = ?auto_2609724 ?auto_2609728 ) ) ( not ( = ?auto_2609724 ?auto_2609729 ) ) ( not ( = ?auto_2609724 ?auto_2609730 ) ) ( not ( = ?auto_2609724 ?auto_2609731 ) ) ( not ( = ?auto_2609724 ?auto_2609732 ) ) ( not ( = ?auto_2609724 ?auto_2609733 ) ) ( not ( = ?auto_2609724 ?auto_2609734 ) ) ( not ( = ?auto_2609725 ?auto_2609726 ) ) ( not ( = ?auto_2609725 ?auto_2609727 ) ) ( not ( = ?auto_2609725 ?auto_2609728 ) ) ( not ( = ?auto_2609725 ?auto_2609729 ) ) ( not ( = ?auto_2609725 ?auto_2609730 ) ) ( not ( = ?auto_2609725 ?auto_2609731 ) ) ( not ( = ?auto_2609725 ?auto_2609732 ) ) ( not ( = ?auto_2609725 ?auto_2609733 ) ) ( not ( = ?auto_2609725 ?auto_2609734 ) ) ( not ( = ?auto_2609726 ?auto_2609727 ) ) ( not ( = ?auto_2609726 ?auto_2609728 ) ) ( not ( = ?auto_2609726 ?auto_2609729 ) ) ( not ( = ?auto_2609726 ?auto_2609730 ) ) ( not ( = ?auto_2609726 ?auto_2609731 ) ) ( not ( = ?auto_2609726 ?auto_2609732 ) ) ( not ( = ?auto_2609726 ?auto_2609733 ) ) ( not ( = ?auto_2609726 ?auto_2609734 ) ) ( not ( = ?auto_2609727 ?auto_2609728 ) ) ( not ( = ?auto_2609727 ?auto_2609729 ) ) ( not ( = ?auto_2609727 ?auto_2609730 ) ) ( not ( = ?auto_2609727 ?auto_2609731 ) ) ( not ( = ?auto_2609727 ?auto_2609732 ) ) ( not ( = ?auto_2609727 ?auto_2609733 ) ) ( not ( = ?auto_2609727 ?auto_2609734 ) ) ( not ( = ?auto_2609728 ?auto_2609729 ) ) ( not ( = ?auto_2609728 ?auto_2609730 ) ) ( not ( = ?auto_2609728 ?auto_2609731 ) ) ( not ( = ?auto_2609728 ?auto_2609732 ) ) ( not ( = ?auto_2609728 ?auto_2609733 ) ) ( not ( = ?auto_2609728 ?auto_2609734 ) ) ( not ( = ?auto_2609729 ?auto_2609730 ) ) ( not ( = ?auto_2609729 ?auto_2609731 ) ) ( not ( = ?auto_2609729 ?auto_2609732 ) ) ( not ( = ?auto_2609729 ?auto_2609733 ) ) ( not ( = ?auto_2609729 ?auto_2609734 ) ) ( not ( = ?auto_2609730 ?auto_2609731 ) ) ( not ( = ?auto_2609730 ?auto_2609732 ) ) ( not ( = ?auto_2609730 ?auto_2609733 ) ) ( not ( = ?auto_2609730 ?auto_2609734 ) ) ( not ( = ?auto_2609731 ?auto_2609732 ) ) ( not ( = ?auto_2609731 ?auto_2609733 ) ) ( not ( = ?auto_2609731 ?auto_2609734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2609732 ?auto_2609733 ?auto_2609734 )
      ( MAKE-15CRATE-VERIFY ?auto_2609719 ?auto_2609720 ?auto_2609721 ?auto_2609722 ?auto_2609723 ?auto_2609724 ?auto_2609725 ?auto_2609726 ?auto_2609727 ?auto_2609728 ?auto_2609729 ?auto_2609730 ?auto_2609731 ?auto_2609732 ?auto_2609733 ?auto_2609734 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2609944 - SURFACE
      ?auto_2609945 - SURFACE
      ?auto_2609946 - SURFACE
      ?auto_2609947 - SURFACE
      ?auto_2609948 - SURFACE
      ?auto_2609949 - SURFACE
      ?auto_2609950 - SURFACE
      ?auto_2609951 - SURFACE
      ?auto_2609952 - SURFACE
      ?auto_2609953 - SURFACE
      ?auto_2609954 - SURFACE
      ?auto_2609955 - SURFACE
      ?auto_2609956 - SURFACE
      ?auto_2609957 - SURFACE
      ?auto_2609958 - SURFACE
      ?auto_2609959 - SURFACE
    )
    :vars
    (
      ?auto_2609965 - HOIST
      ?auto_2609961 - PLACE
      ?auto_2609960 - TRUCK
      ?auto_2609962 - PLACE
      ?auto_2609964 - HOIST
      ?auto_2609963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2609965 ?auto_2609961 ) ( SURFACE-AT ?auto_2609958 ?auto_2609961 ) ( CLEAR ?auto_2609958 ) ( IS-CRATE ?auto_2609959 ) ( not ( = ?auto_2609958 ?auto_2609959 ) ) ( AVAILABLE ?auto_2609965 ) ( ON ?auto_2609958 ?auto_2609957 ) ( not ( = ?auto_2609957 ?auto_2609958 ) ) ( not ( = ?auto_2609957 ?auto_2609959 ) ) ( TRUCK-AT ?auto_2609960 ?auto_2609962 ) ( not ( = ?auto_2609962 ?auto_2609961 ) ) ( HOIST-AT ?auto_2609964 ?auto_2609962 ) ( not ( = ?auto_2609965 ?auto_2609964 ) ) ( AVAILABLE ?auto_2609964 ) ( SURFACE-AT ?auto_2609959 ?auto_2609962 ) ( ON ?auto_2609959 ?auto_2609963 ) ( CLEAR ?auto_2609959 ) ( not ( = ?auto_2609958 ?auto_2609963 ) ) ( not ( = ?auto_2609959 ?auto_2609963 ) ) ( not ( = ?auto_2609957 ?auto_2609963 ) ) ( ON ?auto_2609945 ?auto_2609944 ) ( ON ?auto_2609946 ?auto_2609945 ) ( ON ?auto_2609947 ?auto_2609946 ) ( ON ?auto_2609948 ?auto_2609947 ) ( ON ?auto_2609949 ?auto_2609948 ) ( ON ?auto_2609950 ?auto_2609949 ) ( ON ?auto_2609951 ?auto_2609950 ) ( ON ?auto_2609952 ?auto_2609951 ) ( ON ?auto_2609953 ?auto_2609952 ) ( ON ?auto_2609954 ?auto_2609953 ) ( ON ?auto_2609955 ?auto_2609954 ) ( ON ?auto_2609956 ?auto_2609955 ) ( ON ?auto_2609957 ?auto_2609956 ) ( not ( = ?auto_2609944 ?auto_2609945 ) ) ( not ( = ?auto_2609944 ?auto_2609946 ) ) ( not ( = ?auto_2609944 ?auto_2609947 ) ) ( not ( = ?auto_2609944 ?auto_2609948 ) ) ( not ( = ?auto_2609944 ?auto_2609949 ) ) ( not ( = ?auto_2609944 ?auto_2609950 ) ) ( not ( = ?auto_2609944 ?auto_2609951 ) ) ( not ( = ?auto_2609944 ?auto_2609952 ) ) ( not ( = ?auto_2609944 ?auto_2609953 ) ) ( not ( = ?auto_2609944 ?auto_2609954 ) ) ( not ( = ?auto_2609944 ?auto_2609955 ) ) ( not ( = ?auto_2609944 ?auto_2609956 ) ) ( not ( = ?auto_2609944 ?auto_2609957 ) ) ( not ( = ?auto_2609944 ?auto_2609958 ) ) ( not ( = ?auto_2609944 ?auto_2609959 ) ) ( not ( = ?auto_2609944 ?auto_2609963 ) ) ( not ( = ?auto_2609945 ?auto_2609946 ) ) ( not ( = ?auto_2609945 ?auto_2609947 ) ) ( not ( = ?auto_2609945 ?auto_2609948 ) ) ( not ( = ?auto_2609945 ?auto_2609949 ) ) ( not ( = ?auto_2609945 ?auto_2609950 ) ) ( not ( = ?auto_2609945 ?auto_2609951 ) ) ( not ( = ?auto_2609945 ?auto_2609952 ) ) ( not ( = ?auto_2609945 ?auto_2609953 ) ) ( not ( = ?auto_2609945 ?auto_2609954 ) ) ( not ( = ?auto_2609945 ?auto_2609955 ) ) ( not ( = ?auto_2609945 ?auto_2609956 ) ) ( not ( = ?auto_2609945 ?auto_2609957 ) ) ( not ( = ?auto_2609945 ?auto_2609958 ) ) ( not ( = ?auto_2609945 ?auto_2609959 ) ) ( not ( = ?auto_2609945 ?auto_2609963 ) ) ( not ( = ?auto_2609946 ?auto_2609947 ) ) ( not ( = ?auto_2609946 ?auto_2609948 ) ) ( not ( = ?auto_2609946 ?auto_2609949 ) ) ( not ( = ?auto_2609946 ?auto_2609950 ) ) ( not ( = ?auto_2609946 ?auto_2609951 ) ) ( not ( = ?auto_2609946 ?auto_2609952 ) ) ( not ( = ?auto_2609946 ?auto_2609953 ) ) ( not ( = ?auto_2609946 ?auto_2609954 ) ) ( not ( = ?auto_2609946 ?auto_2609955 ) ) ( not ( = ?auto_2609946 ?auto_2609956 ) ) ( not ( = ?auto_2609946 ?auto_2609957 ) ) ( not ( = ?auto_2609946 ?auto_2609958 ) ) ( not ( = ?auto_2609946 ?auto_2609959 ) ) ( not ( = ?auto_2609946 ?auto_2609963 ) ) ( not ( = ?auto_2609947 ?auto_2609948 ) ) ( not ( = ?auto_2609947 ?auto_2609949 ) ) ( not ( = ?auto_2609947 ?auto_2609950 ) ) ( not ( = ?auto_2609947 ?auto_2609951 ) ) ( not ( = ?auto_2609947 ?auto_2609952 ) ) ( not ( = ?auto_2609947 ?auto_2609953 ) ) ( not ( = ?auto_2609947 ?auto_2609954 ) ) ( not ( = ?auto_2609947 ?auto_2609955 ) ) ( not ( = ?auto_2609947 ?auto_2609956 ) ) ( not ( = ?auto_2609947 ?auto_2609957 ) ) ( not ( = ?auto_2609947 ?auto_2609958 ) ) ( not ( = ?auto_2609947 ?auto_2609959 ) ) ( not ( = ?auto_2609947 ?auto_2609963 ) ) ( not ( = ?auto_2609948 ?auto_2609949 ) ) ( not ( = ?auto_2609948 ?auto_2609950 ) ) ( not ( = ?auto_2609948 ?auto_2609951 ) ) ( not ( = ?auto_2609948 ?auto_2609952 ) ) ( not ( = ?auto_2609948 ?auto_2609953 ) ) ( not ( = ?auto_2609948 ?auto_2609954 ) ) ( not ( = ?auto_2609948 ?auto_2609955 ) ) ( not ( = ?auto_2609948 ?auto_2609956 ) ) ( not ( = ?auto_2609948 ?auto_2609957 ) ) ( not ( = ?auto_2609948 ?auto_2609958 ) ) ( not ( = ?auto_2609948 ?auto_2609959 ) ) ( not ( = ?auto_2609948 ?auto_2609963 ) ) ( not ( = ?auto_2609949 ?auto_2609950 ) ) ( not ( = ?auto_2609949 ?auto_2609951 ) ) ( not ( = ?auto_2609949 ?auto_2609952 ) ) ( not ( = ?auto_2609949 ?auto_2609953 ) ) ( not ( = ?auto_2609949 ?auto_2609954 ) ) ( not ( = ?auto_2609949 ?auto_2609955 ) ) ( not ( = ?auto_2609949 ?auto_2609956 ) ) ( not ( = ?auto_2609949 ?auto_2609957 ) ) ( not ( = ?auto_2609949 ?auto_2609958 ) ) ( not ( = ?auto_2609949 ?auto_2609959 ) ) ( not ( = ?auto_2609949 ?auto_2609963 ) ) ( not ( = ?auto_2609950 ?auto_2609951 ) ) ( not ( = ?auto_2609950 ?auto_2609952 ) ) ( not ( = ?auto_2609950 ?auto_2609953 ) ) ( not ( = ?auto_2609950 ?auto_2609954 ) ) ( not ( = ?auto_2609950 ?auto_2609955 ) ) ( not ( = ?auto_2609950 ?auto_2609956 ) ) ( not ( = ?auto_2609950 ?auto_2609957 ) ) ( not ( = ?auto_2609950 ?auto_2609958 ) ) ( not ( = ?auto_2609950 ?auto_2609959 ) ) ( not ( = ?auto_2609950 ?auto_2609963 ) ) ( not ( = ?auto_2609951 ?auto_2609952 ) ) ( not ( = ?auto_2609951 ?auto_2609953 ) ) ( not ( = ?auto_2609951 ?auto_2609954 ) ) ( not ( = ?auto_2609951 ?auto_2609955 ) ) ( not ( = ?auto_2609951 ?auto_2609956 ) ) ( not ( = ?auto_2609951 ?auto_2609957 ) ) ( not ( = ?auto_2609951 ?auto_2609958 ) ) ( not ( = ?auto_2609951 ?auto_2609959 ) ) ( not ( = ?auto_2609951 ?auto_2609963 ) ) ( not ( = ?auto_2609952 ?auto_2609953 ) ) ( not ( = ?auto_2609952 ?auto_2609954 ) ) ( not ( = ?auto_2609952 ?auto_2609955 ) ) ( not ( = ?auto_2609952 ?auto_2609956 ) ) ( not ( = ?auto_2609952 ?auto_2609957 ) ) ( not ( = ?auto_2609952 ?auto_2609958 ) ) ( not ( = ?auto_2609952 ?auto_2609959 ) ) ( not ( = ?auto_2609952 ?auto_2609963 ) ) ( not ( = ?auto_2609953 ?auto_2609954 ) ) ( not ( = ?auto_2609953 ?auto_2609955 ) ) ( not ( = ?auto_2609953 ?auto_2609956 ) ) ( not ( = ?auto_2609953 ?auto_2609957 ) ) ( not ( = ?auto_2609953 ?auto_2609958 ) ) ( not ( = ?auto_2609953 ?auto_2609959 ) ) ( not ( = ?auto_2609953 ?auto_2609963 ) ) ( not ( = ?auto_2609954 ?auto_2609955 ) ) ( not ( = ?auto_2609954 ?auto_2609956 ) ) ( not ( = ?auto_2609954 ?auto_2609957 ) ) ( not ( = ?auto_2609954 ?auto_2609958 ) ) ( not ( = ?auto_2609954 ?auto_2609959 ) ) ( not ( = ?auto_2609954 ?auto_2609963 ) ) ( not ( = ?auto_2609955 ?auto_2609956 ) ) ( not ( = ?auto_2609955 ?auto_2609957 ) ) ( not ( = ?auto_2609955 ?auto_2609958 ) ) ( not ( = ?auto_2609955 ?auto_2609959 ) ) ( not ( = ?auto_2609955 ?auto_2609963 ) ) ( not ( = ?auto_2609956 ?auto_2609957 ) ) ( not ( = ?auto_2609956 ?auto_2609958 ) ) ( not ( = ?auto_2609956 ?auto_2609959 ) ) ( not ( = ?auto_2609956 ?auto_2609963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2609957 ?auto_2609958 ?auto_2609959 )
      ( MAKE-15CRATE-VERIFY ?auto_2609944 ?auto_2609945 ?auto_2609946 ?auto_2609947 ?auto_2609948 ?auto_2609949 ?auto_2609950 ?auto_2609951 ?auto_2609952 ?auto_2609953 ?auto_2609954 ?auto_2609955 ?auto_2609956 ?auto_2609957 ?auto_2609958 ?auto_2609959 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610170 - SURFACE
      ?auto_2610171 - SURFACE
      ?auto_2610172 - SURFACE
      ?auto_2610173 - SURFACE
      ?auto_2610174 - SURFACE
      ?auto_2610175 - SURFACE
      ?auto_2610176 - SURFACE
      ?auto_2610177 - SURFACE
      ?auto_2610178 - SURFACE
      ?auto_2610179 - SURFACE
      ?auto_2610180 - SURFACE
      ?auto_2610181 - SURFACE
      ?auto_2610182 - SURFACE
      ?auto_2610183 - SURFACE
      ?auto_2610184 - SURFACE
      ?auto_2610185 - SURFACE
    )
    :vars
    (
      ?auto_2610191 - HOIST
      ?auto_2610190 - PLACE
      ?auto_2610187 - PLACE
      ?auto_2610186 - HOIST
      ?auto_2610189 - SURFACE
      ?auto_2610188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610191 ?auto_2610190 ) ( SURFACE-AT ?auto_2610184 ?auto_2610190 ) ( CLEAR ?auto_2610184 ) ( IS-CRATE ?auto_2610185 ) ( not ( = ?auto_2610184 ?auto_2610185 ) ) ( AVAILABLE ?auto_2610191 ) ( ON ?auto_2610184 ?auto_2610183 ) ( not ( = ?auto_2610183 ?auto_2610184 ) ) ( not ( = ?auto_2610183 ?auto_2610185 ) ) ( not ( = ?auto_2610187 ?auto_2610190 ) ) ( HOIST-AT ?auto_2610186 ?auto_2610187 ) ( not ( = ?auto_2610191 ?auto_2610186 ) ) ( AVAILABLE ?auto_2610186 ) ( SURFACE-AT ?auto_2610185 ?auto_2610187 ) ( ON ?auto_2610185 ?auto_2610189 ) ( CLEAR ?auto_2610185 ) ( not ( = ?auto_2610184 ?auto_2610189 ) ) ( not ( = ?auto_2610185 ?auto_2610189 ) ) ( not ( = ?auto_2610183 ?auto_2610189 ) ) ( TRUCK-AT ?auto_2610188 ?auto_2610190 ) ( ON ?auto_2610171 ?auto_2610170 ) ( ON ?auto_2610172 ?auto_2610171 ) ( ON ?auto_2610173 ?auto_2610172 ) ( ON ?auto_2610174 ?auto_2610173 ) ( ON ?auto_2610175 ?auto_2610174 ) ( ON ?auto_2610176 ?auto_2610175 ) ( ON ?auto_2610177 ?auto_2610176 ) ( ON ?auto_2610178 ?auto_2610177 ) ( ON ?auto_2610179 ?auto_2610178 ) ( ON ?auto_2610180 ?auto_2610179 ) ( ON ?auto_2610181 ?auto_2610180 ) ( ON ?auto_2610182 ?auto_2610181 ) ( ON ?auto_2610183 ?auto_2610182 ) ( not ( = ?auto_2610170 ?auto_2610171 ) ) ( not ( = ?auto_2610170 ?auto_2610172 ) ) ( not ( = ?auto_2610170 ?auto_2610173 ) ) ( not ( = ?auto_2610170 ?auto_2610174 ) ) ( not ( = ?auto_2610170 ?auto_2610175 ) ) ( not ( = ?auto_2610170 ?auto_2610176 ) ) ( not ( = ?auto_2610170 ?auto_2610177 ) ) ( not ( = ?auto_2610170 ?auto_2610178 ) ) ( not ( = ?auto_2610170 ?auto_2610179 ) ) ( not ( = ?auto_2610170 ?auto_2610180 ) ) ( not ( = ?auto_2610170 ?auto_2610181 ) ) ( not ( = ?auto_2610170 ?auto_2610182 ) ) ( not ( = ?auto_2610170 ?auto_2610183 ) ) ( not ( = ?auto_2610170 ?auto_2610184 ) ) ( not ( = ?auto_2610170 ?auto_2610185 ) ) ( not ( = ?auto_2610170 ?auto_2610189 ) ) ( not ( = ?auto_2610171 ?auto_2610172 ) ) ( not ( = ?auto_2610171 ?auto_2610173 ) ) ( not ( = ?auto_2610171 ?auto_2610174 ) ) ( not ( = ?auto_2610171 ?auto_2610175 ) ) ( not ( = ?auto_2610171 ?auto_2610176 ) ) ( not ( = ?auto_2610171 ?auto_2610177 ) ) ( not ( = ?auto_2610171 ?auto_2610178 ) ) ( not ( = ?auto_2610171 ?auto_2610179 ) ) ( not ( = ?auto_2610171 ?auto_2610180 ) ) ( not ( = ?auto_2610171 ?auto_2610181 ) ) ( not ( = ?auto_2610171 ?auto_2610182 ) ) ( not ( = ?auto_2610171 ?auto_2610183 ) ) ( not ( = ?auto_2610171 ?auto_2610184 ) ) ( not ( = ?auto_2610171 ?auto_2610185 ) ) ( not ( = ?auto_2610171 ?auto_2610189 ) ) ( not ( = ?auto_2610172 ?auto_2610173 ) ) ( not ( = ?auto_2610172 ?auto_2610174 ) ) ( not ( = ?auto_2610172 ?auto_2610175 ) ) ( not ( = ?auto_2610172 ?auto_2610176 ) ) ( not ( = ?auto_2610172 ?auto_2610177 ) ) ( not ( = ?auto_2610172 ?auto_2610178 ) ) ( not ( = ?auto_2610172 ?auto_2610179 ) ) ( not ( = ?auto_2610172 ?auto_2610180 ) ) ( not ( = ?auto_2610172 ?auto_2610181 ) ) ( not ( = ?auto_2610172 ?auto_2610182 ) ) ( not ( = ?auto_2610172 ?auto_2610183 ) ) ( not ( = ?auto_2610172 ?auto_2610184 ) ) ( not ( = ?auto_2610172 ?auto_2610185 ) ) ( not ( = ?auto_2610172 ?auto_2610189 ) ) ( not ( = ?auto_2610173 ?auto_2610174 ) ) ( not ( = ?auto_2610173 ?auto_2610175 ) ) ( not ( = ?auto_2610173 ?auto_2610176 ) ) ( not ( = ?auto_2610173 ?auto_2610177 ) ) ( not ( = ?auto_2610173 ?auto_2610178 ) ) ( not ( = ?auto_2610173 ?auto_2610179 ) ) ( not ( = ?auto_2610173 ?auto_2610180 ) ) ( not ( = ?auto_2610173 ?auto_2610181 ) ) ( not ( = ?auto_2610173 ?auto_2610182 ) ) ( not ( = ?auto_2610173 ?auto_2610183 ) ) ( not ( = ?auto_2610173 ?auto_2610184 ) ) ( not ( = ?auto_2610173 ?auto_2610185 ) ) ( not ( = ?auto_2610173 ?auto_2610189 ) ) ( not ( = ?auto_2610174 ?auto_2610175 ) ) ( not ( = ?auto_2610174 ?auto_2610176 ) ) ( not ( = ?auto_2610174 ?auto_2610177 ) ) ( not ( = ?auto_2610174 ?auto_2610178 ) ) ( not ( = ?auto_2610174 ?auto_2610179 ) ) ( not ( = ?auto_2610174 ?auto_2610180 ) ) ( not ( = ?auto_2610174 ?auto_2610181 ) ) ( not ( = ?auto_2610174 ?auto_2610182 ) ) ( not ( = ?auto_2610174 ?auto_2610183 ) ) ( not ( = ?auto_2610174 ?auto_2610184 ) ) ( not ( = ?auto_2610174 ?auto_2610185 ) ) ( not ( = ?auto_2610174 ?auto_2610189 ) ) ( not ( = ?auto_2610175 ?auto_2610176 ) ) ( not ( = ?auto_2610175 ?auto_2610177 ) ) ( not ( = ?auto_2610175 ?auto_2610178 ) ) ( not ( = ?auto_2610175 ?auto_2610179 ) ) ( not ( = ?auto_2610175 ?auto_2610180 ) ) ( not ( = ?auto_2610175 ?auto_2610181 ) ) ( not ( = ?auto_2610175 ?auto_2610182 ) ) ( not ( = ?auto_2610175 ?auto_2610183 ) ) ( not ( = ?auto_2610175 ?auto_2610184 ) ) ( not ( = ?auto_2610175 ?auto_2610185 ) ) ( not ( = ?auto_2610175 ?auto_2610189 ) ) ( not ( = ?auto_2610176 ?auto_2610177 ) ) ( not ( = ?auto_2610176 ?auto_2610178 ) ) ( not ( = ?auto_2610176 ?auto_2610179 ) ) ( not ( = ?auto_2610176 ?auto_2610180 ) ) ( not ( = ?auto_2610176 ?auto_2610181 ) ) ( not ( = ?auto_2610176 ?auto_2610182 ) ) ( not ( = ?auto_2610176 ?auto_2610183 ) ) ( not ( = ?auto_2610176 ?auto_2610184 ) ) ( not ( = ?auto_2610176 ?auto_2610185 ) ) ( not ( = ?auto_2610176 ?auto_2610189 ) ) ( not ( = ?auto_2610177 ?auto_2610178 ) ) ( not ( = ?auto_2610177 ?auto_2610179 ) ) ( not ( = ?auto_2610177 ?auto_2610180 ) ) ( not ( = ?auto_2610177 ?auto_2610181 ) ) ( not ( = ?auto_2610177 ?auto_2610182 ) ) ( not ( = ?auto_2610177 ?auto_2610183 ) ) ( not ( = ?auto_2610177 ?auto_2610184 ) ) ( not ( = ?auto_2610177 ?auto_2610185 ) ) ( not ( = ?auto_2610177 ?auto_2610189 ) ) ( not ( = ?auto_2610178 ?auto_2610179 ) ) ( not ( = ?auto_2610178 ?auto_2610180 ) ) ( not ( = ?auto_2610178 ?auto_2610181 ) ) ( not ( = ?auto_2610178 ?auto_2610182 ) ) ( not ( = ?auto_2610178 ?auto_2610183 ) ) ( not ( = ?auto_2610178 ?auto_2610184 ) ) ( not ( = ?auto_2610178 ?auto_2610185 ) ) ( not ( = ?auto_2610178 ?auto_2610189 ) ) ( not ( = ?auto_2610179 ?auto_2610180 ) ) ( not ( = ?auto_2610179 ?auto_2610181 ) ) ( not ( = ?auto_2610179 ?auto_2610182 ) ) ( not ( = ?auto_2610179 ?auto_2610183 ) ) ( not ( = ?auto_2610179 ?auto_2610184 ) ) ( not ( = ?auto_2610179 ?auto_2610185 ) ) ( not ( = ?auto_2610179 ?auto_2610189 ) ) ( not ( = ?auto_2610180 ?auto_2610181 ) ) ( not ( = ?auto_2610180 ?auto_2610182 ) ) ( not ( = ?auto_2610180 ?auto_2610183 ) ) ( not ( = ?auto_2610180 ?auto_2610184 ) ) ( not ( = ?auto_2610180 ?auto_2610185 ) ) ( not ( = ?auto_2610180 ?auto_2610189 ) ) ( not ( = ?auto_2610181 ?auto_2610182 ) ) ( not ( = ?auto_2610181 ?auto_2610183 ) ) ( not ( = ?auto_2610181 ?auto_2610184 ) ) ( not ( = ?auto_2610181 ?auto_2610185 ) ) ( not ( = ?auto_2610181 ?auto_2610189 ) ) ( not ( = ?auto_2610182 ?auto_2610183 ) ) ( not ( = ?auto_2610182 ?auto_2610184 ) ) ( not ( = ?auto_2610182 ?auto_2610185 ) ) ( not ( = ?auto_2610182 ?auto_2610189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610183 ?auto_2610184 ?auto_2610185 )
      ( MAKE-15CRATE-VERIFY ?auto_2610170 ?auto_2610171 ?auto_2610172 ?auto_2610173 ?auto_2610174 ?auto_2610175 ?auto_2610176 ?auto_2610177 ?auto_2610178 ?auto_2610179 ?auto_2610180 ?auto_2610181 ?auto_2610182 ?auto_2610183 ?auto_2610184 ?auto_2610185 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610396 - SURFACE
      ?auto_2610397 - SURFACE
      ?auto_2610398 - SURFACE
      ?auto_2610399 - SURFACE
      ?auto_2610400 - SURFACE
      ?auto_2610401 - SURFACE
      ?auto_2610402 - SURFACE
      ?auto_2610403 - SURFACE
      ?auto_2610404 - SURFACE
      ?auto_2610405 - SURFACE
      ?auto_2610406 - SURFACE
      ?auto_2610407 - SURFACE
      ?auto_2610408 - SURFACE
      ?auto_2610409 - SURFACE
      ?auto_2610410 - SURFACE
      ?auto_2610411 - SURFACE
    )
    :vars
    (
      ?auto_2610414 - HOIST
      ?auto_2610417 - PLACE
      ?auto_2610416 - PLACE
      ?auto_2610413 - HOIST
      ?auto_2610412 - SURFACE
      ?auto_2610415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610414 ?auto_2610417 ) ( IS-CRATE ?auto_2610411 ) ( not ( = ?auto_2610410 ?auto_2610411 ) ) ( not ( = ?auto_2610409 ?auto_2610410 ) ) ( not ( = ?auto_2610409 ?auto_2610411 ) ) ( not ( = ?auto_2610416 ?auto_2610417 ) ) ( HOIST-AT ?auto_2610413 ?auto_2610416 ) ( not ( = ?auto_2610414 ?auto_2610413 ) ) ( AVAILABLE ?auto_2610413 ) ( SURFACE-AT ?auto_2610411 ?auto_2610416 ) ( ON ?auto_2610411 ?auto_2610412 ) ( CLEAR ?auto_2610411 ) ( not ( = ?auto_2610410 ?auto_2610412 ) ) ( not ( = ?auto_2610411 ?auto_2610412 ) ) ( not ( = ?auto_2610409 ?auto_2610412 ) ) ( TRUCK-AT ?auto_2610415 ?auto_2610417 ) ( SURFACE-AT ?auto_2610409 ?auto_2610417 ) ( CLEAR ?auto_2610409 ) ( LIFTING ?auto_2610414 ?auto_2610410 ) ( IS-CRATE ?auto_2610410 ) ( ON ?auto_2610397 ?auto_2610396 ) ( ON ?auto_2610398 ?auto_2610397 ) ( ON ?auto_2610399 ?auto_2610398 ) ( ON ?auto_2610400 ?auto_2610399 ) ( ON ?auto_2610401 ?auto_2610400 ) ( ON ?auto_2610402 ?auto_2610401 ) ( ON ?auto_2610403 ?auto_2610402 ) ( ON ?auto_2610404 ?auto_2610403 ) ( ON ?auto_2610405 ?auto_2610404 ) ( ON ?auto_2610406 ?auto_2610405 ) ( ON ?auto_2610407 ?auto_2610406 ) ( ON ?auto_2610408 ?auto_2610407 ) ( ON ?auto_2610409 ?auto_2610408 ) ( not ( = ?auto_2610396 ?auto_2610397 ) ) ( not ( = ?auto_2610396 ?auto_2610398 ) ) ( not ( = ?auto_2610396 ?auto_2610399 ) ) ( not ( = ?auto_2610396 ?auto_2610400 ) ) ( not ( = ?auto_2610396 ?auto_2610401 ) ) ( not ( = ?auto_2610396 ?auto_2610402 ) ) ( not ( = ?auto_2610396 ?auto_2610403 ) ) ( not ( = ?auto_2610396 ?auto_2610404 ) ) ( not ( = ?auto_2610396 ?auto_2610405 ) ) ( not ( = ?auto_2610396 ?auto_2610406 ) ) ( not ( = ?auto_2610396 ?auto_2610407 ) ) ( not ( = ?auto_2610396 ?auto_2610408 ) ) ( not ( = ?auto_2610396 ?auto_2610409 ) ) ( not ( = ?auto_2610396 ?auto_2610410 ) ) ( not ( = ?auto_2610396 ?auto_2610411 ) ) ( not ( = ?auto_2610396 ?auto_2610412 ) ) ( not ( = ?auto_2610397 ?auto_2610398 ) ) ( not ( = ?auto_2610397 ?auto_2610399 ) ) ( not ( = ?auto_2610397 ?auto_2610400 ) ) ( not ( = ?auto_2610397 ?auto_2610401 ) ) ( not ( = ?auto_2610397 ?auto_2610402 ) ) ( not ( = ?auto_2610397 ?auto_2610403 ) ) ( not ( = ?auto_2610397 ?auto_2610404 ) ) ( not ( = ?auto_2610397 ?auto_2610405 ) ) ( not ( = ?auto_2610397 ?auto_2610406 ) ) ( not ( = ?auto_2610397 ?auto_2610407 ) ) ( not ( = ?auto_2610397 ?auto_2610408 ) ) ( not ( = ?auto_2610397 ?auto_2610409 ) ) ( not ( = ?auto_2610397 ?auto_2610410 ) ) ( not ( = ?auto_2610397 ?auto_2610411 ) ) ( not ( = ?auto_2610397 ?auto_2610412 ) ) ( not ( = ?auto_2610398 ?auto_2610399 ) ) ( not ( = ?auto_2610398 ?auto_2610400 ) ) ( not ( = ?auto_2610398 ?auto_2610401 ) ) ( not ( = ?auto_2610398 ?auto_2610402 ) ) ( not ( = ?auto_2610398 ?auto_2610403 ) ) ( not ( = ?auto_2610398 ?auto_2610404 ) ) ( not ( = ?auto_2610398 ?auto_2610405 ) ) ( not ( = ?auto_2610398 ?auto_2610406 ) ) ( not ( = ?auto_2610398 ?auto_2610407 ) ) ( not ( = ?auto_2610398 ?auto_2610408 ) ) ( not ( = ?auto_2610398 ?auto_2610409 ) ) ( not ( = ?auto_2610398 ?auto_2610410 ) ) ( not ( = ?auto_2610398 ?auto_2610411 ) ) ( not ( = ?auto_2610398 ?auto_2610412 ) ) ( not ( = ?auto_2610399 ?auto_2610400 ) ) ( not ( = ?auto_2610399 ?auto_2610401 ) ) ( not ( = ?auto_2610399 ?auto_2610402 ) ) ( not ( = ?auto_2610399 ?auto_2610403 ) ) ( not ( = ?auto_2610399 ?auto_2610404 ) ) ( not ( = ?auto_2610399 ?auto_2610405 ) ) ( not ( = ?auto_2610399 ?auto_2610406 ) ) ( not ( = ?auto_2610399 ?auto_2610407 ) ) ( not ( = ?auto_2610399 ?auto_2610408 ) ) ( not ( = ?auto_2610399 ?auto_2610409 ) ) ( not ( = ?auto_2610399 ?auto_2610410 ) ) ( not ( = ?auto_2610399 ?auto_2610411 ) ) ( not ( = ?auto_2610399 ?auto_2610412 ) ) ( not ( = ?auto_2610400 ?auto_2610401 ) ) ( not ( = ?auto_2610400 ?auto_2610402 ) ) ( not ( = ?auto_2610400 ?auto_2610403 ) ) ( not ( = ?auto_2610400 ?auto_2610404 ) ) ( not ( = ?auto_2610400 ?auto_2610405 ) ) ( not ( = ?auto_2610400 ?auto_2610406 ) ) ( not ( = ?auto_2610400 ?auto_2610407 ) ) ( not ( = ?auto_2610400 ?auto_2610408 ) ) ( not ( = ?auto_2610400 ?auto_2610409 ) ) ( not ( = ?auto_2610400 ?auto_2610410 ) ) ( not ( = ?auto_2610400 ?auto_2610411 ) ) ( not ( = ?auto_2610400 ?auto_2610412 ) ) ( not ( = ?auto_2610401 ?auto_2610402 ) ) ( not ( = ?auto_2610401 ?auto_2610403 ) ) ( not ( = ?auto_2610401 ?auto_2610404 ) ) ( not ( = ?auto_2610401 ?auto_2610405 ) ) ( not ( = ?auto_2610401 ?auto_2610406 ) ) ( not ( = ?auto_2610401 ?auto_2610407 ) ) ( not ( = ?auto_2610401 ?auto_2610408 ) ) ( not ( = ?auto_2610401 ?auto_2610409 ) ) ( not ( = ?auto_2610401 ?auto_2610410 ) ) ( not ( = ?auto_2610401 ?auto_2610411 ) ) ( not ( = ?auto_2610401 ?auto_2610412 ) ) ( not ( = ?auto_2610402 ?auto_2610403 ) ) ( not ( = ?auto_2610402 ?auto_2610404 ) ) ( not ( = ?auto_2610402 ?auto_2610405 ) ) ( not ( = ?auto_2610402 ?auto_2610406 ) ) ( not ( = ?auto_2610402 ?auto_2610407 ) ) ( not ( = ?auto_2610402 ?auto_2610408 ) ) ( not ( = ?auto_2610402 ?auto_2610409 ) ) ( not ( = ?auto_2610402 ?auto_2610410 ) ) ( not ( = ?auto_2610402 ?auto_2610411 ) ) ( not ( = ?auto_2610402 ?auto_2610412 ) ) ( not ( = ?auto_2610403 ?auto_2610404 ) ) ( not ( = ?auto_2610403 ?auto_2610405 ) ) ( not ( = ?auto_2610403 ?auto_2610406 ) ) ( not ( = ?auto_2610403 ?auto_2610407 ) ) ( not ( = ?auto_2610403 ?auto_2610408 ) ) ( not ( = ?auto_2610403 ?auto_2610409 ) ) ( not ( = ?auto_2610403 ?auto_2610410 ) ) ( not ( = ?auto_2610403 ?auto_2610411 ) ) ( not ( = ?auto_2610403 ?auto_2610412 ) ) ( not ( = ?auto_2610404 ?auto_2610405 ) ) ( not ( = ?auto_2610404 ?auto_2610406 ) ) ( not ( = ?auto_2610404 ?auto_2610407 ) ) ( not ( = ?auto_2610404 ?auto_2610408 ) ) ( not ( = ?auto_2610404 ?auto_2610409 ) ) ( not ( = ?auto_2610404 ?auto_2610410 ) ) ( not ( = ?auto_2610404 ?auto_2610411 ) ) ( not ( = ?auto_2610404 ?auto_2610412 ) ) ( not ( = ?auto_2610405 ?auto_2610406 ) ) ( not ( = ?auto_2610405 ?auto_2610407 ) ) ( not ( = ?auto_2610405 ?auto_2610408 ) ) ( not ( = ?auto_2610405 ?auto_2610409 ) ) ( not ( = ?auto_2610405 ?auto_2610410 ) ) ( not ( = ?auto_2610405 ?auto_2610411 ) ) ( not ( = ?auto_2610405 ?auto_2610412 ) ) ( not ( = ?auto_2610406 ?auto_2610407 ) ) ( not ( = ?auto_2610406 ?auto_2610408 ) ) ( not ( = ?auto_2610406 ?auto_2610409 ) ) ( not ( = ?auto_2610406 ?auto_2610410 ) ) ( not ( = ?auto_2610406 ?auto_2610411 ) ) ( not ( = ?auto_2610406 ?auto_2610412 ) ) ( not ( = ?auto_2610407 ?auto_2610408 ) ) ( not ( = ?auto_2610407 ?auto_2610409 ) ) ( not ( = ?auto_2610407 ?auto_2610410 ) ) ( not ( = ?auto_2610407 ?auto_2610411 ) ) ( not ( = ?auto_2610407 ?auto_2610412 ) ) ( not ( = ?auto_2610408 ?auto_2610409 ) ) ( not ( = ?auto_2610408 ?auto_2610410 ) ) ( not ( = ?auto_2610408 ?auto_2610411 ) ) ( not ( = ?auto_2610408 ?auto_2610412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610409 ?auto_2610410 ?auto_2610411 )
      ( MAKE-15CRATE-VERIFY ?auto_2610396 ?auto_2610397 ?auto_2610398 ?auto_2610399 ?auto_2610400 ?auto_2610401 ?auto_2610402 ?auto_2610403 ?auto_2610404 ?auto_2610405 ?auto_2610406 ?auto_2610407 ?auto_2610408 ?auto_2610409 ?auto_2610410 ?auto_2610411 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2610622 - SURFACE
      ?auto_2610623 - SURFACE
      ?auto_2610624 - SURFACE
      ?auto_2610625 - SURFACE
      ?auto_2610626 - SURFACE
      ?auto_2610627 - SURFACE
      ?auto_2610628 - SURFACE
      ?auto_2610629 - SURFACE
      ?auto_2610630 - SURFACE
      ?auto_2610631 - SURFACE
      ?auto_2610632 - SURFACE
      ?auto_2610633 - SURFACE
      ?auto_2610634 - SURFACE
      ?auto_2610635 - SURFACE
      ?auto_2610636 - SURFACE
      ?auto_2610637 - SURFACE
    )
    :vars
    (
      ?auto_2610642 - HOIST
      ?auto_2610640 - PLACE
      ?auto_2610643 - PLACE
      ?auto_2610638 - HOIST
      ?auto_2610639 - SURFACE
      ?auto_2610641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610642 ?auto_2610640 ) ( IS-CRATE ?auto_2610637 ) ( not ( = ?auto_2610636 ?auto_2610637 ) ) ( not ( = ?auto_2610635 ?auto_2610636 ) ) ( not ( = ?auto_2610635 ?auto_2610637 ) ) ( not ( = ?auto_2610643 ?auto_2610640 ) ) ( HOIST-AT ?auto_2610638 ?auto_2610643 ) ( not ( = ?auto_2610642 ?auto_2610638 ) ) ( AVAILABLE ?auto_2610638 ) ( SURFACE-AT ?auto_2610637 ?auto_2610643 ) ( ON ?auto_2610637 ?auto_2610639 ) ( CLEAR ?auto_2610637 ) ( not ( = ?auto_2610636 ?auto_2610639 ) ) ( not ( = ?auto_2610637 ?auto_2610639 ) ) ( not ( = ?auto_2610635 ?auto_2610639 ) ) ( TRUCK-AT ?auto_2610641 ?auto_2610640 ) ( SURFACE-AT ?auto_2610635 ?auto_2610640 ) ( CLEAR ?auto_2610635 ) ( IS-CRATE ?auto_2610636 ) ( AVAILABLE ?auto_2610642 ) ( IN ?auto_2610636 ?auto_2610641 ) ( ON ?auto_2610623 ?auto_2610622 ) ( ON ?auto_2610624 ?auto_2610623 ) ( ON ?auto_2610625 ?auto_2610624 ) ( ON ?auto_2610626 ?auto_2610625 ) ( ON ?auto_2610627 ?auto_2610626 ) ( ON ?auto_2610628 ?auto_2610627 ) ( ON ?auto_2610629 ?auto_2610628 ) ( ON ?auto_2610630 ?auto_2610629 ) ( ON ?auto_2610631 ?auto_2610630 ) ( ON ?auto_2610632 ?auto_2610631 ) ( ON ?auto_2610633 ?auto_2610632 ) ( ON ?auto_2610634 ?auto_2610633 ) ( ON ?auto_2610635 ?auto_2610634 ) ( not ( = ?auto_2610622 ?auto_2610623 ) ) ( not ( = ?auto_2610622 ?auto_2610624 ) ) ( not ( = ?auto_2610622 ?auto_2610625 ) ) ( not ( = ?auto_2610622 ?auto_2610626 ) ) ( not ( = ?auto_2610622 ?auto_2610627 ) ) ( not ( = ?auto_2610622 ?auto_2610628 ) ) ( not ( = ?auto_2610622 ?auto_2610629 ) ) ( not ( = ?auto_2610622 ?auto_2610630 ) ) ( not ( = ?auto_2610622 ?auto_2610631 ) ) ( not ( = ?auto_2610622 ?auto_2610632 ) ) ( not ( = ?auto_2610622 ?auto_2610633 ) ) ( not ( = ?auto_2610622 ?auto_2610634 ) ) ( not ( = ?auto_2610622 ?auto_2610635 ) ) ( not ( = ?auto_2610622 ?auto_2610636 ) ) ( not ( = ?auto_2610622 ?auto_2610637 ) ) ( not ( = ?auto_2610622 ?auto_2610639 ) ) ( not ( = ?auto_2610623 ?auto_2610624 ) ) ( not ( = ?auto_2610623 ?auto_2610625 ) ) ( not ( = ?auto_2610623 ?auto_2610626 ) ) ( not ( = ?auto_2610623 ?auto_2610627 ) ) ( not ( = ?auto_2610623 ?auto_2610628 ) ) ( not ( = ?auto_2610623 ?auto_2610629 ) ) ( not ( = ?auto_2610623 ?auto_2610630 ) ) ( not ( = ?auto_2610623 ?auto_2610631 ) ) ( not ( = ?auto_2610623 ?auto_2610632 ) ) ( not ( = ?auto_2610623 ?auto_2610633 ) ) ( not ( = ?auto_2610623 ?auto_2610634 ) ) ( not ( = ?auto_2610623 ?auto_2610635 ) ) ( not ( = ?auto_2610623 ?auto_2610636 ) ) ( not ( = ?auto_2610623 ?auto_2610637 ) ) ( not ( = ?auto_2610623 ?auto_2610639 ) ) ( not ( = ?auto_2610624 ?auto_2610625 ) ) ( not ( = ?auto_2610624 ?auto_2610626 ) ) ( not ( = ?auto_2610624 ?auto_2610627 ) ) ( not ( = ?auto_2610624 ?auto_2610628 ) ) ( not ( = ?auto_2610624 ?auto_2610629 ) ) ( not ( = ?auto_2610624 ?auto_2610630 ) ) ( not ( = ?auto_2610624 ?auto_2610631 ) ) ( not ( = ?auto_2610624 ?auto_2610632 ) ) ( not ( = ?auto_2610624 ?auto_2610633 ) ) ( not ( = ?auto_2610624 ?auto_2610634 ) ) ( not ( = ?auto_2610624 ?auto_2610635 ) ) ( not ( = ?auto_2610624 ?auto_2610636 ) ) ( not ( = ?auto_2610624 ?auto_2610637 ) ) ( not ( = ?auto_2610624 ?auto_2610639 ) ) ( not ( = ?auto_2610625 ?auto_2610626 ) ) ( not ( = ?auto_2610625 ?auto_2610627 ) ) ( not ( = ?auto_2610625 ?auto_2610628 ) ) ( not ( = ?auto_2610625 ?auto_2610629 ) ) ( not ( = ?auto_2610625 ?auto_2610630 ) ) ( not ( = ?auto_2610625 ?auto_2610631 ) ) ( not ( = ?auto_2610625 ?auto_2610632 ) ) ( not ( = ?auto_2610625 ?auto_2610633 ) ) ( not ( = ?auto_2610625 ?auto_2610634 ) ) ( not ( = ?auto_2610625 ?auto_2610635 ) ) ( not ( = ?auto_2610625 ?auto_2610636 ) ) ( not ( = ?auto_2610625 ?auto_2610637 ) ) ( not ( = ?auto_2610625 ?auto_2610639 ) ) ( not ( = ?auto_2610626 ?auto_2610627 ) ) ( not ( = ?auto_2610626 ?auto_2610628 ) ) ( not ( = ?auto_2610626 ?auto_2610629 ) ) ( not ( = ?auto_2610626 ?auto_2610630 ) ) ( not ( = ?auto_2610626 ?auto_2610631 ) ) ( not ( = ?auto_2610626 ?auto_2610632 ) ) ( not ( = ?auto_2610626 ?auto_2610633 ) ) ( not ( = ?auto_2610626 ?auto_2610634 ) ) ( not ( = ?auto_2610626 ?auto_2610635 ) ) ( not ( = ?auto_2610626 ?auto_2610636 ) ) ( not ( = ?auto_2610626 ?auto_2610637 ) ) ( not ( = ?auto_2610626 ?auto_2610639 ) ) ( not ( = ?auto_2610627 ?auto_2610628 ) ) ( not ( = ?auto_2610627 ?auto_2610629 ) ) ( not ( = ?auto_2610627 ?auto_2610630 ) ) ( not ( = ?auto_2610627 ?auto_2610631 ) ) ( not ( = ?auto_2610627 ?auto_2610632 ) ) ( not ( = ?auto_2610627 ?auto_2610633 ) ) ( not ( = ?auto_2610627 ?auto_2610634 ) ) ( not ( = ?auto_2610627 ?auto_2610635 ) ) ( not ( = ?auto_2610627 ?auto_2610636 ) ) ( not ( = ?auto_2610627 ?auto_2610637 ) ) ( not ( = ?auto_2610627 ?auto_2610639 ) ) ( not ( = ?auto_2610628 ?auto_2610629 ) ) ( not ( = ?auto_2610628 ?auto_2610630 ) ) ( not ( = ?auto_2610628 ?auto_2610631 ) ) ( not ( = ?auto_2610628 ?auto_2610632 ) ) ( not ( = ?auto_2610628 ?auto_2610633 ) ) ( not ( = ?auto_2610628 ?auto_2610634 ) ) ( not ( = ?auto_2610628 ?auto_2610635 ) ) ( not ( = ?auto_2610628 ?auto_2610636 ) ) ( not ( = ?auto_2610628 ?auto_2610637 ) ) ( not ( = ?auto_2610628 ?auto_2610639 ) ) ( not ( = ?auto_2610629 ?auto_2610630 ) ) ( not ( = ?auto_2610629 ?auto_2610631 ) ) ( not ( = ?auto_2610629 ?auto_2610632 ) ) ( not ( = ?auto_2610629 ?auto_2610633 ) ) ( not ( = ?auto_2610629 ?auto_2610634 ) ) ( not ( = ?auto_2610629 ?auto_2610635 ) ) ( not ( = ?auto_2610629 ?auto_2610636 ) ) ( not ( = ?auto_2610629 ?auto_2610637 ) ) ( not ( = ?auto_2610629 ?auto_2610639 ) ) ( not ( = ?auto_2610630 ?auto_2610631 ) ) ( not ( = ?auto_2610630 ?auto_2610632 ) ) ( not ( = ?auto_2610630 ?auto_2610633 ) ) ( not ( = ?auto_2610630 ?auto_2610634 ) ) ( not ( = ?auto_2610630 ?auto_2610635 ) ) ( not ( = ?auto_2610630 ?auto_2610636 ) ) ( not ( = ?auto_2610630 ?auto_2610637 ) ) ( not ( = ?auto_2610630 ?auto_2610639 ) ) ( not ( = ?auto_2610631 ?auto_2610632 ) ) ( not ( = ?auto_2610631 ?auto_2610633 ) ) ( not ( = ?auto_2610631 ?auto_2610634 ) ) ( not ( = ?auto_2610631 ?auto_2610635 ) ) ( not ( = ?auto_2610631 ?auto_2610636 ) ) ( not ( = ?auto_2610631 ?auto_2610637 ) ) ( not ( = ?auto_2610631 ?auto_2610639 ) ) ( not ( = ?auto_2610632 ?auto_2610633 ) ) ( not ( = ?auto_2610632 ?auto_2610634 ) ) ( not ( = ?auto_2610632 ?auto_2610635 ) ) ( not ( = ?auto_2610632 ?auto_2610636 ) ) ( not ( = ?auto_2610632 ?auto_2610637 ) ) ( not ( = ?auto_2610632 ?auto_2610639 ) ) ( not ( = ?auto_2610633 ?auto_2610634 ) ) ( not ( = ?auto_2610633 ?auto_2610635 ) ) ( not ( = ?auto_2610633 ?auto_2610636 ) ) ( not ( = ?auto_2610633 ?auto_2610637 ) ) ( not ( = ?auto_2610633 ?auto_2610639 ) ) ( not ( = ?auto_2610634 ?auto_2610635 ) ) ( not ( = ?auto_2610634 ?auto_2610636 ) ) ( not ( = ?auto_2610634 ?auto_2610637 ) ) ( not ( = ?auto_2610634 ?auto_2610639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2610635 ?auto_2610636 ?auto_2610637 )
      ( MAKE-15CRATE-VERIFY ?auto_2610622 ?auto_2610623 ?auto_2610624 ?auto_2610625 ?auto_2610626 ?auto_2610627 ?auto_2610628 ?auto_2610629 ?auto_2610630 ?auto_2610631 ?auto_2610632 ?auto_2610633 ?auto_2610634 ?auto_2610635 ?auto_2610636 ?auto_2610637 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2631181 - SURFACE
      ?auto_2631182 - SURFACE
      ?auto_2631183 - SURFACE
      ?auto_2631184 - SURFACE
      ?auto_2631185 - SURFACE
      ?auto_2631186 - SURFACE
      ?auto_2631187 - SURFACE
      ?auto_2631188 - SURFACE
      ?auto_2631189 - SURFACE
      ?auto_2631190 - SURFACE
      ?auto_2631191 - SURFACE
      ?auto_2631192 - SURFACE
      ?auto_2631193 - SURFACE
      ?auto_2631194 - SURFACE
      ?auto_2631195 - SURFACE
      ?auto_2631196 - SURFACE
      ?auto_2631197 - SURFACE
    )
    :vars
    (
      ?auto_2631198 - HOIST
      ?auto_2631199 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2631198 ?auto_2631199 ) ( SURFACE-AT ?auto_2631196 ?auto_2631199 ) ( CLEAR ?auto_2631196 ) ( LIFTING ?auto_2631198 ?auto_2631197 ) ( IS-CRATE ?auto_2631197 ) ( not ( = ?auto_2631196 ?auto_2631197 ) ) ( ON ?auto_2631182 ?auto_2631181 ) ( ON ?auto_2631183 ?auto_2631182 ) ( ON ?auto_2631184 ?auto_2631183 ) ( ON ?auto_2631185 ?auto_2631184 ) ( ON ?auto_2631186 ?auto_2631185 ) ( ON ?auto_2631187 ?auto_2631186 ) ( ON ?auto_2631188 ?auto_2631187 ) ( ON ?auto_2631189 ?auto_2631188 ) ( ON ?auto_2631190 ?auto_2631189 ) ( ON ?auto_2631191 ?auto_2631190 ) ( ON ?auto_2631192 ?auto_2631191 ) ( ON ?auto_2631193 ?auto_2631192 ) ( ON ?auto_2631194 ?auto_2631193 ) ( ON ?auto_2631195 ?auto_2631194 ) ( ON ?auto_2631196 ?auto_2631195 ) ( not ( = ?auto_2631181 ?auto_2631182 ) ) ( not ( = ?auto_2631181 ?auto_2631183 ) ) ( not ( = ?auto_2631181 ?auto_2631184 ) ) ( not ( = ?auto_2631181 ?auto_2631185 ) ) ( not ( = ?auto_2631181 ?auto_2631186 ) ) ( not ( = ?auto_2631181 ?auto_2631187 ) ) ( not ( = ?auto_2631181 ?auto_2631188 ) ) ( not ( = ?auto_2631181 ?auto_2631189 ) ) ( not ( = ?auto_2631181 ?auto_2631190 ) ) ( not ( = ?auto_2631181 ?auto_2631191 ) ) ( not ( = ?auto_2631181 ?auto_2631192 ) ) ( not ( = ?auto_2631181 ?auto_2631193 ) ) ( not ( = ?auto_2631181 ?auto_2631194 ) ) ( not ( = ?auto_2631181 ?auto_2631195 ) ) ( not ( = ?auto_2631181 ?auto_2631196 ) ) ( not ( = ?auto_2631181 ?auto_2631197 ) ) ( not ( = ?auto_2631182 ?auto_2631183 ) ) ( not ( = ?auto_2631182 ?auto_2631184 ) ) ( not ( = ?auto_2631182 ?auto_2631185 ) ) ( not ( = ?auto_2631182 ?auto_2631186 ) ) ( not ( = ?auto_2631182 ?auto_2631187 ) ) ( not ( = ?auto_2631182 ?auto_2631188 ) ) ( not ( = ?auto_2631182 ?auto_2631189 ) ) ( not ( = ?auto_2631182 ?auto_2631190 ) ) ( not ( = ?auto_2631182 ?auto_2631191 ) ) ( not ( = ?auto_2631182 ?auto_2631192 ) ) ( not ( = ?auto_2631182 ?auto_2631193 ) ) ( not ( = ?auto_2631182 ?auto_2631194 ) ) ( not ( = ?auto_2631182 ?auto_2631195 ) ) ( not ( = ?auto_2631182 ?auto_2631196 ) ) ( not ( = ?auto_2631182 ?auto_2631197 ) ) ( not ( = ?auto_2631183 ?auto_2631184 ) ) ( not ( = ?auto_2631183 ?auto_2631185 ) ) ( not ( = ?auto_2631183 ?auto_2631186 ) ) ( not ( = ?auto_2631183 ?auto_2631187 ) ) ( not ( = ?auto_2631183 ?auto_2631188 ) ) ( not ( = ?auto_2631183 ?auto_2631189 ) ) ( not ( = ?auto_2631183 ?auto_2631190 ) ) ( not ( = ?auto_2631183 ?auto_2631191 ) ) ( not ( = ?auto_2631183 ?auto_2631192 ) ) ( not ( = ?auto_2631183 ?auto_2631193 ) ) ( not ( = ?auto_2631183 ?auto_2631194 ) ) ( not ( = ?auto_2631183 ?auto_2631195 ) ) ( not ( = ?auto_2631183 ?auto_2631196 ) ) ( not ( = ?auto_2631183 ?auto_2631197 ) ) ( not ( = ?auto_2631184 ?auto_2631185 ) ) ( not ( = ?auto_2631184 ?auto_2631186 ) ) ( not ( = ?auto_2631184 ?auto_2631187 ) ) ( not ( = ?auto_2631184 ?auto_2631188 ) ) ( not ( = ?auto_2631184 ?auto_2631189 ) ) ( not ( = ?auto_2631184 ?auto_2631190 ) ) ( not ( = ?auto_2631184 ?auto_2631191 ) ) ( not ( = ?auto_2631184 ?auto_2631192 ) ) ( not ( = ?auto_2631184 ?auto_2631193 ) ) ( not ( = ?auto_2631184 ?auto_2631194 ) ) ( not ( = ?auto_2631184 ?auto_2631195 ) ) ( not ( = ?auto_2631184 ?auto_2631196 ) ) ( not ( = ?auto_2631184 ?auto_2631197 ) ) ( not ( = ?auto_2631185 ?auto_2631186 ) ) ( not ( = ?auto_2631185 ?auto_2631187 ) ) ( not ( = ?auto_2631185 ?auto_2631188 ) ) ( not ( = ?auto_2631185 ?auto_2631189 ) ) ( not ( = ?auto_2631185 ?auto_2631190 ) ) ( not ( = ?auto_2631185 ?auto_2631191 ) ) ( not ( = ?auto_2631185 ?auto_2631192 ) ) ( not ( = ?auto_2631185 ?auto_2631193 ) ) ( not ( = ?auto_2631185 ?auto_2631194 ) ) ( not ( = ?auto_2631185 ?auto_2631195 ) ) ( not ( = ?auto_2631185 ?auto_2631196 ) ) ( not ( = ?auto_2631185 ?auto_2631197 ) ) ( not ( = ?auto_2631186 ?auto_2631187 ) ) ( not ( = ?auto_2631186 ?auto_2631188 ) ) ( not ( = ?auto_2631186 ?auto_2631189 ) ) ( not ( = ?auto_2631186 ?auto_2631190 ) ) ( not ( = ?auto_2631186 ?auto_2631191 ) ) ( not ( = ?auto_2631186 ?auto_2631192 ) ) ( not ( = ?auto_2631186 ?auto_2631193 ) ) ( not ( = ?auto_2631186 ?auto_2631194 ) ) ( not ( = ?auto_2631186 ?auto_2631195 ) ) ( not ( = ?auto_2631186 ?auto_2631196 ) ) ( not ( = ?auto_2631186 ?auto_2631197 ) ) ( not ( = ?auto_2631187 ?auto_2631188 ) ) ( not ( = ?auto_2631187 ?auto_2631189 ) ) ( not ( = ?auto_2631187 ?auto_2631190 ) ) ( not ( = ?auto_2631187 ?auto_2631191 ) ) ( not ( = ?auto_2631187 ?auto_2631192 ) ) ( not ( = ?auto_2631187 ?auto_2631193 ) ) ( not ( = ?auto_2631187 ?auto_2631194 ) ) ( not ( = ?auto_2631187 ?auto_2631195 ) ) ( not ( = ?auto_2631187 ?auto_2631196 ) ) ( not ( = ?auto_2631187 ?auto_2631197 ) ) ( not ( = ?auto_2631188 ?auto_2631189 ) ) ( not ( = ?auto_2631188 ?auto_2631190 ) ) ( not ( = ?auto_2631188 ?auto_2631191 ) ) ( not ( = ?auto_2631188 ?auto_2631192 ) ) ( not ( = ?auto_2631188 ?auto_2631193 ) ) ( not ( = ?auto_2631188 ?auto_2631194 ) ) ( not ( = ?auto_2631188 ?auto_2631195 ) ) ( not ( = ?auto_2631188 ?auto_2631196 ) ) ( not ( = ?auto_2631188 ?auto_2631197 ) ) ( not ( = ?auto_2631189 ?auto_2631190 ) ) ( not ( = ?auto_2631189 ?auto_2631191 ) ) ( not ( = ?auto_2631189 ?auto_2631192 ) ) ( not ( = ?auto_2631189 ?auto_2631193 ) ) ( not ( = ?auto_2631189 ?auto_2631194 ) ) ( not ( = ?auto_2631189 ?auto_2631195 ) ) ( not ( = ?auto_2631189 ?auto_2631196 ) ) ( not ( = ?auto_2631189 ?auto_2631197 ) ) ( not ( = ?auto_2631190 ?auto_2631191 ) ) ( not ( = ?auto_2631190 ?auto_2631192 ) ) ( not ( = ?auto_2631190 ?auto_2631193 ) ) ( not ( = ?auto_2631190 ?auto_2631194 ) ) ( not ( = ?auto_2631190 ?auto_2631195 ) ) ( not ( = ?auto_2631190 ?auto_2631196 ) ) ( not ( = ?auto_2631190 ?auto_2631197 ) ) ( not ( = ?auto_2631191 ?auto_2631192 ) ) ( not ( = ?auto_2631191 ?auto_2631193 ) ) ( not ( = ?auto_2631191 ?auto_2631194 ) ) ( not ( = ?auto_2631191 ?auto_2631195 ) ) ( not ( = ?auto_2631191 ?auto_2631196 ) ) ( not ( = ?auto_2631191 ?auto_2631197 ) ) ( not ( = ?auto_2631192 ?auto_2631193 ) ) ( not ( = ?auto_2631192 ?auto_2631194 ) ) ( not ( = ?auto_2631192 ?auto_2631195 ) ) ( not ( = ?auto_2631192 ?auto_2631196 ) ) ( not ( = ?auto_2631192 ?auto_2631197 ) ) ( not ( = ?auto_2631193 ?auto_2631194 ) ) ( not ( = ?auto_2631193 ?auto_2631195 ) ) ( not ( = ?auto_2631193 ?auto_2631196 ) ) ( not ( = ?auto_2631193 ?auto_2631197 ) ) ( not ( = ?auto_2631194 ?auto_2631195 ) ) ( not ( = ?auto_2631194 ?auto_2631196 ) ) ( not ( = ?auto_2631194 ?auto_2631197 ) ) ( not ( = ?auto_2631195 ?auto_2631196 ) ) ( not ( = ?auto_2631195 ?auto_2631197 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2631196 ?auto_2631197 )
      ( MAKE-16CRATE-VERIFY ?auto_2631181 ?auto_2631182 ?auto_2631183 ?auto_2631184 ?auto_2631185 ?auto_2631186 ?auto_2631187 ?auto_2631188 ?auto_2631189 ?auto_2631190 ?auto_2631191 ?auto_2631192 ?auto_2631193 ?auto_2631194 ?auto_2631195 ?auto_2631196 ?auto_2631197 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2631380 - SURFACE
      ?auto_2631381 - SURFACE
      ?auto_2631382 - SURFACE
      ?auto_2631383 - SURFACE
      ?auto_2631384 - SURFACE
      ?auto_2631385 - SURFACE
      ?auto_2631386 - SURFACE
      ?auto_2631387 - SURFACE
      ?auto_2631388 - SURFACE
      ?auto_2631389 - SURFACE
      ?auto_2631390 - SURFACE
      ?auto_2631391 - SURFACE
      ?auto_2631392 - SURFACE
      ?auto_2631393 - SURFACE
      ?auto_2631394 - SURFACE
      ?auto_2631395 - SURFACE
      ?auto_2631396 - SURFACE
    )
    :vars
    (
      ?auto_2631399 - HOIST
      ?auto_2631398 - PLACE
      ?auto_2631397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2631399 ?auto_2631398 ) ( SURFACE-AT ?auto_2631395 ?auto_2631398 ) ( CLEAR ?auto_2631395 ) ( IS-CRATE ?auto_2631396 ) ( not ( = ?auto_2631395 ?auto_2631396 ) ) ( TRUCK-AT ?auto_2631397 ?auto_2631398 ) ( AVAILABLE ?auto_2631399 ) ( IN ?auto_2631396 ?auto_2631397 ) ( ON ?auto_2631395 ?auto_2631394 ) ( not ( = ?auto_2631394 ?auto_2631395 ) ) ( not ( = ?auto_2631394 ?auto_2631396 ) ) ( ON ?auto_2631381 ?auto_2631380 ) ( ON ?auto_2631382 ?auto_2631381 ) ( ON ?auto_2631383 ?auto_2631382 ) ( ON ?auto_2631384 ?auto_2631383 ) ( ON ?auto_2631385 ?auto_2631384 ) ( ON ?auto_2631386 ?auto_2631385 ) ( ON ?auto_2631387 ?auto_2631386 ) ( ON ?auto_2631388 ?auto_2631387 ) ( ON ?auto_2631389 ?auto_2631388 ) ( ON ?auto_2631390 ?auto_2631389 ) ( ON ?auto_2631391 ?auto_2631390 ) ( ON ?auto_2631392 ?auto_2631391 ) ( ON ?auto_2631393 ?auto_2631392 ) ( ON ?auto_2631394 ?auto_2631393 ) ( not ( = ?auto_2631380 ?auto_2631381 ) ) ( not ( = ?auto_2631380 ?auto_2631382 ) ) ( not ( = ?auto_2631380 ?auto_2631383 ) ) ( not ( = ?auto_2631380 ?auto_2631384 ) ) ( not ( = ?auto_2631380 ?auto_2631385 ) ) ( not ( = ?auto_2631380 ?auto_2631386 ) ) ( not ( = ?auto_2631380 ?auto_2631387 ) ) ( not ( = ?auto_2631380 ?auto_2631388 ) ) ( not ( = ?auto_2631380 ?auto_2631389 ) ) ( not ( = ?auto_2631380 ?auto_2631390 ) ) ( not ( = ?auto_2631380 ?auto_2631391 ) ) ( not ( = ?auto_2631380 ?auto_2631392 ) ) ( not ( = ?auto_2631380 ?auto_2631393 ) ) ( not ( = ?auto_2631380 ?auto_2631394 ) ) ( not ( = ?auto_2631380 ?auto_2631395 ) ) ( not ( = ?auto_2631380 ?auto_2631396 ) ) ( not ( = ?auto_2631381 ?auto_2631382 ) ) ( not ( = ?auto_2631381 ?auto_2631383 ) ) ( not ( = ?auto_2631381 ?auto_2631384 ) ) ( not ( = ?auto_2631381 ?auto_2631385 ) ) ( not ( = ?auto_2631381 ?auto_2631386 ) ) ( not ( = ?auto_2631381 ?auto_2631387 ) ) ( not ( = ?auto_2631381 ?auto_2631388 ) ) ( not ( = ?auto_2631381 ?auto_2631389 ) ) ( not ( = ?auto_2631381 ?auto_2631390 ) ) ( not ( = ?auto_2631381 ?auto_2631391 ) ) ( not ( = ?auto_2631381 ?auto_2631392 ) ) ( not ( = ?auto_2631381 ?auto_2631393 ) ) ( not ( = ?auto_2631381 ?auto_2631394 ) ) ( not ( = ?auto_2631381 ?auto_2631395 ) ) ( not ( = ?auto_2631381 ?auto_2631396 ) ) ( not ( = ?auto_2631382 ?auto_2631383 ) ) ( not ( = ?auto_2631382 ?auto_2631384 ) ) ( not ( = ?auto_2631382 ?auto_2631385 ) ) ( not ( = ?auto_2631382 ?auto_2631386 ) ) ( not ( = ?auto_2631382 ?auto_2631387 ) ) ( not ( = ?auto_2631382 ?auto_2631388 ) ) ( not ( = ?auto_2631382 ?auto_2631389 ) ) ( not ( = ?auto_2631382 ?auto_2631390 ) ) ( not ( = ?auto_2631382 ?auto_2631391 ) ) ( not ( = ?auto_2631382 ?auto_2631392 ) ) ( not ( = ?auto_2631382 ?auto_2631393 ) ) ( not ( = ?auto_2631382 ?auto_2631394 ) ) ( not ( = ?auto_2631382 ?auto_2631395 ) ) ( not ( = ?auto_2631382 ?auto_2631396 ) ) ( not ( = ?auto_2631383 ?auto_2631384 ) ) ( not ( = ?auto_2631383 ?auto_2631385 ) ) ( not ( = ?auto_2631383 ?auto_2631386 ) ) ( not ( = ?auto_2631383 ?auto_2631387 ) ) ( not ( = ?auto_2631383 ?auto_2631388 ) ) ( not ( = ?auto_2631383 ?auto_2631389 ) ) ( not ( = ?auto_2631383 ?auto_2631390 ) ) ( not ( = ?auto_2631383 ?auto_2631391 ) ) ( not ( = ?auto_2631383 ?auto_2631392 ) ) ( not ( = ?auto_2631383 ?auto_2631393 ) ) ( not ( = ?auto_2631383 ?auto_2631394 ) ) ( not ( = ?auto_2631383 ?auto_2631395 ) ) ( not ( = ?auto_2631383 ?auto_2631396 ) ) ( not ( = ?auto_2631384 ?auto_2631385 ) ) ( not ( = ?auto_2631384 ?auto_2631386 ) ) ( not ( = ?auto_2631384 ?auto_2631387 ) ) ( not ( = ?auto_2631384 ?auto_2631388 ) ) ( not ( = ?auto_2631384 ?auto_2631389 ) ) ( not ( = ?auto_2631384 ?auto_2631390 ) ) ( not ( = ?auto_2631384 ?auto_2631391 ) ) ( not ( = ?auto_2631384 ?auto_2631392 ) ) ( not ( = ?auto_2631384 ?auto_2631393 ) ) ( not ( = ?auto_2631384 ?auto_2631394 ) ) ( not ( = ?auto_2631384 ?auto_2631395 ) ) ( not ( = ?auto_2631384 ?auto_2631396 ) ) ( not ( = ?auto_2631385 ?auto_2631386 ) ) ( not ( = ?auto_2631385 ?auto_2631387 ) ) ( not ( = ?auto_2631385 ?auto_2631388 ) ) ( not ( = ?auto_2631385 ?auto_2631389 ) ) ( not ( = ?auto_2631385 ?auto_2631390 ) ) ( not ( = ?auto_2631385 ?auto_2631391 ) ) ( not ( = ?auto_2631385 ?auto_2631392 ) ) ( not ( = ?auto_2631385 ?auto_2631393 ) ) ( not ( = ?auto_2631385 ?auto_2631394 ) ) ( not ( = ?auto_2631385 ?auto_2631395 ) ) ( not ( = ?auto_2631385 ?auto_2631396 ) ) ( not ( = ?auto_2631386 ?auto_2631387 ) ) ( not ( = ?auto_2631386 ?auto_2631388 ) ) ( not ( = ?auto_2631386 ?auto_2631389 ) ) ( not ( = ?auto_2631386 ?auto_2631390 ) ) ( not ( = ?auto_2631386 ?auto_2631391 ) ) ( not ( = ?auto_2631386 ?auto_2631392 ) ) ( not ( = ?auto_2631386 ?auto_2631393 ) ) ( not ( = ?auto_2631386 ?auto_2631394 ) ) ( not ( = ?auto_2631386 ?auto_2631395 ) ) ( not ( = ?auto_2631386 ?auto_2631396 ) ) ( not ( = ?auto_2631387 ?auto_2631388 ) ) ( not ( = ?auto_2631387 ?auto_2631389 ) ) ( not ( = ?auto_2631387 ?auto_2631390 ) ) ( not ( = ?auto_2631387 ?auto_2631391 ) ) ( not ( = ?auto_2631387 ?auto_2631392 ) ) ( not ( = ?auto_2631387 ?auto_2631393 ) ) ( not ( = ?auto_2631387 ?auto_2631394 ) ) ( not ( = ?auto_2631387 ?auto_2631395 ) ) ( not ( = ?auto_2631387 ?auto_2631396 ) ) ( not ( = ?auto_2631388 ?auto_2631389 ) ) ( not ( = ?auto_2631388 ?auto_2631390 ) ) ( not ( = ?auto_2631388 ?auto_2631391 ) ) ( not ( = ?auto_2631388 ?auto_2631392 ) ) ( not ( = ?auto_2631388 ?auto_2631393 ) ) ( not ( = ?auto_2631388 ?auto_2631394 ) ) ( not ( = ?auto_2631388 ?auto_2631395 ) ) ( not ( = ?auto_2631388 ?auto_2631396 ) ) ( not ( = ?auto_2631389 ?auto_2631390 ) ) ( not ( = ?auto_2631389 ?auto_2631391 ) ) ( not ( = ?auto_2631389 ?auto_2631392 ) ) ( not ( = ?auto_2631389 ?auto_2631393 ) ) ( not ( = ?auto_2631389 ?auto_2631394 ) ) ( not ( = ?auto_2631389 ?auto_2631395 ) ) ( not ( = ?auto_2631389 ?auto_2631396 ) ) ( not ( = ?auto_2631390 ?auto_2631391 ) ) ( not ( = ?auto_2631390 ?auto_2631392 ) ) ( not ( = ?auto_2631390 ?auto_2631393 ) ) ( not ( = ?auto_2631390 ?auto_2631394 ) ) ( not ( = ?auto_2631390 ?auto_2631395 ) ) ( not ( = ?auto_2631390 ?auto_2631396 ) ) ( not ( = ?auto_2631391 ?auto_2631392 ) ) ( not ( = ?auto_2631391 ?auto_2631393 ) ) ( not ( = ?auto_2631391 ?auto_2631394 ) ) ( not ( = ?auto_2631391 ?auto_2631395 ) ) ( not ( = ?auto_2631391 ?auto_2631396 ) ) ( not ( = ?auto_2631392 ?auto_2631393 ) ) ( not ( = ?auto_2631392 ?auto_2631394 ) ) ( not ( = ?auto_2631392 ?auto_2631395 ) ) ( not ( = ?auto_2631392 ?auto_2631396 ) ) ( not ( = ?auto_2631393 ?auto_2631394 ) ) ( not ( = ?auto_2631393 ?auto_2631395 ) ) ( not ( = ?auto_2631393 ?auto_2631396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2631394 ?auto_2631395 ?auto_2631396 )
      ( MAKE-16CRATE-VERIFY ?auto_2631380 ?auto_2631381 ?auto_2631382 ?auto_2631383 ?auto_2631384 ?auto_2631385 ?auto_2631386 ?auto_2631387 ?auto_2631388 ?auto_2631389 ?auto_2631390 ?auto_2631391 ?auto_2631392 ?auto_2631393 ?auto_2631394 ?auto_2631395 ?auto_2631396 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2631596 - SURFACE
      ?auto_2631597 - SURFACE
      ?auto_2631598 - SURFACE
      ?auto_2631599 - SURFACE
      ?auto_2631600 - SURFACE
      ?auto_2631601 - SURFACE
      ?auto_2631602 - SURFACE
      ?auto_2631603 - SURFACE
      ?auto_2631604 - SURFACE
      ?auto_2631605 - SURFACE
      ?auto_2631606 - SURFACE
      ?auto_2631607 - SURFACE
      ?auto_2631608 - SURFACE
      ?auto_2631609 - SURFACE
      ?auto_2631610 - SURFACE
      ?auto_2631611 - SURFACE
      ?auto_2631612 - SURFACE
    )
    :vars
    (
      ?auto_2631613 - HOIST
      ?auto_2631616 - PLACE
      ?auto_2631614 - TRUCK
      ?auto_2631615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2631613 ?auto_2631616 ) ( SURFACE-AT ?auto_2631611 ?auto_2631616 ) ( CLEAR ?auto_2631611 ) ( IS-CRATE ?auto_2631612 ) ( not ( = ?auto_2631611 ?auto_2631612 ) ) ( AVAILABLE ?auto_2631613 ) ( IN ?auto_2631612 ?auto_2631614 ) ( ON ?auto_2631611 ?auto_2631610 ) ( not ( = ?auto_2631610 ?auto_2631611 ) ) ( not ( = ?auto_2631610 ?auto_2631612 ) ) ( TRUCK-AT ?auto_2631614 ?auto_2631615 ) ( not ( = ?auto_2631615 ?auto_2631616 ) ) ( ON ?auto_2631597 ?auto_2631596 ) ( ON ?auto_2631598 ?auto_2631597 ) ( ON ?auto_2631599 ?auto_2631598 ) ( ON ?auto_2631600 ?auto_2631599 ) ( ON ?auto_2631601 ?auto_2631600 ) ( ON ?auto_2631602 ?auto_2631601 ) ( ON ?auto_2631603 ?auto_2631602 ) ( ON ?auto_2631604 ?auto_2631603 ) ( ON ?auto_2631605 ?auto_2631604 ) ( ON ?auto_2631606 ?auto_2631605 ) ( ON ?auto_2631607 ?auto_2631606 ) ( ON ?auto_2631608 ?auto_2631607 ) ( ON ?auto_2631609 ?auto_2631608 ) ( ON ?auto_2631610 ?auto_2631609 ) ( not ( = ?auto_2631596 ?auto_2631597 ) ) ( not ( = ?auto_2631596 ?auto_2631598 ) ) ( not ( = ?auto_2631596 ?auto_2631599 ) ) ( not ( = ?auto_2631596 ?auto_2631600 ) ) ( not ( = ?auto_2631596 ?auto_2631601 ) ) ( not ( = ?auto_2631596 ?auto_2631602 ) ) ( not ( = ?auto_2631596 ?auto_2631603 ) ) ( not ( = ?auto_2631596 ?auto_2631604 ) ) ( not ( = ?auto_2631596 ?auto_2631605 ) ) ( not ( = ?auto_2631596 ?auto_2631606 ) ) ( not ( = ?auto_2631596 ?auto_2631607 ) ) ( not ( = ?auto_2631596 ?auto_2631608 ) ) ( not ( = ?auto_2631596 ?auto_2631609 ) ) ( not ( = ?auto_2631596 ?auto_2631610 ) ) ( not ( = ?auto_2631596 ?auto_2631611 ) ) ( not ( = ?auto_2631596 ?auto_2631612 ) ) ( not ( = ?auto_2631597 ?auto_2631598 ) ) ( not ( = ?auto_2631597 ?auto_2631599 ) ) ( not ( = ?auto_2631597 ?auto_2631600 ) ) ( not ( = ?auto_2631597 ?auto_2631601 ) ) ( not ( = ?auto_2631597 ?auto_2631602 ) ) ( not ( = ?auto_2631597 ?auto_2631603 ) ) ( not ( = ?auto_2631597 ?auto_2631604 ) ) ( not ( = ?auto_2631597 ?auto_2631605 ) ) ( not ( = ?auto_2631597 ?auto_2631606 ) ) ( not ( = ?auto_2631597 ?auto_2631607 ) ) ( not ( = ?auto_2631597 ?auto_2631608 ) ) ( not ( = ?auto_2631597 ?auto_2631609 ) ) ( not ( = ?auto_2631597 ?auto_2631610 ) ) ( not ( = ?auto_2631597 ?auto_2631611 ) ) ( not ( = ?auto_2631597 ?auto_2631612 ) ) ( not ( = ?auto_2631598 ?auto_2631599 ) ) ( not ( = ?auto_2631598 ?auto_2631600 ) ) ( not ( = ?auto_2631598 ?auto_2631601 ) ) ( not ( = ?auto_2631598 ?auto_2631602 ) ) ( not ( = ?auto_2631598 ?auto_2631603 ) ) ( not ( = ?auto_2631598 ?auto_2631604 ) ) ( not ( = ?auto_2631598 ?auto_2631605 ) ) ( not ( = ?auto_2631598 ?auto_2631606 ) ) ( not ( = ?auto_2631598 ?auto_2631607 ) ) ( not ( = ?auto_2631598 ?auto_2631608 ) ) ( not ( = ?auto_2631598 ?auto_2631609 ) ) ( not ( = ?auto_2631598 ?auto_2631610 ) ) ( not ( = ?auto_2631598 ?auto_2631611 ) ) ( not ( = ?auto_2631598 ?auto_2631612 ) ) ( not ( = ?auto_2631599 ?auto_2631600 ) ) ( not ( = ?auto_2631599 ?auto_2631601 ) ) ( not ( = ?auto_2631599 ?auto_2631602 ) ) ( not ( = ?auto_2631599 ?auto_2631603 ) ) ( not ( = ?auto_2631599 ?auto_2631604 ) ) ( not ( = ?auto_2631599 ?auto_2631605 ) ) ( not ( = ?auto_2631599 ?auto_2631606 ) ) ( not ( = ?auto_2631599 ?auto_2631607 ) ) ( not ( = ?auto_2631599 ?auto_2631608 ) ) ( not ( = ?auto_2631599 ?auto_2631609 ) ) ( not ( = ?auto_2631599 ?auto_2631610 ) ) ( not ( = ?auto_2631599 ?auto_2631611 ) ) ( not ( = ?auto_2631599 ?auto_2631612 ) ) ( not ( = ?auto_2631600 ?auto_2631601 ) ) ( not ( = ?auto_2631600 ?auto_2631602 ) ) ( not ( = ?auto_2631600 ?auto_2631603 ) ) ( not ( = ?auto_2631600 ?auto_2631604 ) ) ( not ( = ?auto_2631600 ?auto_2631605 ) ) ( not ( = ?auto_2631600 ?auto_2631606 ) ) ( not ( = ?auto_2631600 ?auto_2631607 ) ) ( not ( = ?auto_2631600 ?auto_2631608 ) ) ( not ( = ?auto_2631600 ?auto_2631609 ) ) ( not ( = ?auto_2631600 ?auto_2631610 ) ) ( not ( = ?auto_2631600 ?auto_2631611 ) ) ( not ( = ?auto_2631600 ?auto_2631612 ) ) ( not ( = ?auto_2631601 ?auto_2631602 ) ) ( not ( = ?auto_2631601 ?auto_2631603 ) ) ( not ( = ?auto_2631601 ?auto_2631604 ) ) ( not ( = ?auto_2631601 ?auto_2631605 ) ) ( not ( = ?auto_2631601 ?auto_2631606 ) ) ( not ( = ?auto_2631601 ?auto_2631607 ) ) ( not ( = ?auto_2631601 ?auto_2631608 ) ) ( not ( = ?auto_2631601 ?auto_2631609 ) ) ( not ( = ?auto_2631601 ?auto_2631610 ) ) ( not ( = ?auto_2631601 ?auto_2631611 ) ) ( not ( = ?auto_2631601 ?auto_2631612 ) ) ( not ( = ?auto_2631602 ?auto_2631603 ) ) ( not ( = ?auto_2631602 ?auto_2631604 ) ) ( not ( = ?auto_2631602 ?auto_2631605 ) ) ( not ( = ?auto_2631602 ?auto_2631606 ) ) ( not ( = ?auto_2631602 ?auto_2631607 ) ) ( not ( = ?auto_2631602 ?auto_2631608 ) ) ( not ( = ?auto_2631602 ?auto_2631609 ) ) ( not ( = ?auto_2631602 ?auto_2631610 ) ) ( not ( = ?auto_2631602 ?auto_2631611 ) ) ( not ( = ?auto_2631602 ?auto_2631612 ) ) ( not ( = ?auto_2631603 ?auto_2631604 ) ) ( not ( = ?auto_2631603 ?auto_2631605 ) ) ( not ( = ?auto_2631603 ?auto_2631606 ) ) ( not ( = ?auto_2631603 ?auto_2631607 ) ) ( not ( = ?auto_2631603 ?auto_2631608 ) ) ( not ( = ?auto_2631603 ?auto_2631609 ) ) ( not ( = ?auto_2631603 ?auto_2631610 ) ) ( not ( = ?auto_2631603 ?auto_2631611 ) ) ( not ( = ?auto_2631603 ?auto_2631612 ) ) ( not ( = ?auto_2631604 ?auto_2631605 ) ) ( not ( = ?auto_2631604 ?auto_2631606 ) ) ( not ( = ?auto_2631604 ?auto_2631607 ) ) ( not ( = ?auto_2631604 ?auto_2631608 ) ) ( not ( = ?auto_2631604 ?auto_2631609 ) ) ( not ( = ?auto_2631604 ?auto_2631610 ) ) ( not ( = ?auto_2631604 ?auto_2631611 ) ) ( not ( = ?auto_2631604 ?auto_2631612 ) ) ( not ( = ?auto_2631605 ?auto_2631606 ) ) ( not ( = ?auto_2631605 ?auto_2631607 ) ) ( not ( = ?auto_2631605 ?auto_2631608 ) ) ( not ( = ?auto_2631605 ?auto_2631609 ) ) ( not ( = ?auto_2631605 ?auto_2631610 ) ) ( not ( = ?auto_2631605 ?auto_2631611 ) ) ( not ( = ?auto_2631605 ?auto_2631612 ) ) ( not ( = ?auto_2631606 ?auto_2631607 ) ) ( not ( = ?auto_2631606 ?auto_2631608 ) ) ( not ( = ?auto_2631606 ?auto_2631609 ) ) ( not ( = ?auto_2631606 ?auto_2631610 ) ) ( not ( = ?auto_2631606 ?auto_2631611 ) ) ( not ( = ?auto_2631606 ?auto_2631612 ) ) ( not ( = ?auto_2631607 ?auto_2631608 ) ) ( not ( = ?auto_2631607 ?auto_2631609 ) ) ( not ( = ?auto_2631607 ?auto_2631610 ) ) ( not ( = ?auto_2631607 ?auto_2631611 ) ) ( not ( = ?auto_2631607 ?auto_2631612 ) ) ( not ( = ?auto_2631608 ?auto_2631609 ) ) ( not ( = ?auto_2631608 ?auto_2631610 ) ) ( not ( = ?auto_2631608 ?auto_2631611 ) ) ( not ( = ?auto_2631608 ?auto_2631612 ) ) ( not ( = ?auto_2631609 ?auto_2631610 ) ) ( not ( = ?auto_2631609 ?auto_2631611 ) ) ( not ( = ?auto_2631609 ?auto_2631612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2631610 ?auto_2631611 ?auto_2631612 )
      ( MAKE-16CRATE-VERIFY ?auto_2631596 ?auto_2631597 ?auto_2631598 ?auto_2631599 ?auto_2631600 ?auto_2631601 ?auto_2631602 ?auto_2631603 ?auto_2631604 ?auto_2631605 ?auto_2631606 ?auto_2631607 ?auto_2631608 ?auto_2631609 ?auto_2631610 ?auto_2631611 ?auto_2631612 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2631828 - SURFACE
      ?auto_2631829 - SURFACE
      ?auto_2631830 - SURFACE
      ?auto_2631831 - SURFACE
      ?auto_2631832 - SURFACE
      ?auto_2631833 - SURFACE
      ?auto_2631834 - SURFACE
      ?auto_2631835 - SURFACE
      ?auto_2631836 - SURFACE
      ?auto_2631837 - SURFACE
      ?auto_2631838 - SURFACE
      ?auto_2631839 - SURFACE
      ?auto_2631840 - SURFACE
      ?auto_2631841 - SURFACE
      ?auto_2631842 - SURFACE
      ?auto_2631843 - SURFACE
      ?auto_2631844 - SURFACE
    )
    :vars
    (
      ?auto_2631846 - HOIST
      ?auto_2631849 - PLACE
      ?auto_2631845 - TRUCK
      ?auto_2631847 - PLACE
      ?auto_2631848 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2631846 ?auto_2631849 ) ( SURFACE-AT ?auto_2631843 ?auto_2631849 ) ( CLEAR ?auto_2631843 ) ( IS-CRATE ?auto_2631844 ) ( not ( = ?auto_2631843 ?auto_2631844 ) ) ( AVAILABLE ?auto_2631846 ) ( ON ?auto_2631843 ?auto_2631842 ) ( not ( = ?auto_2631842 ?auto_2631843 ) ) ( not ( = ?auto_2631842 ?auto_2631844 ) ) ( TRUCK-AT ?auto_2631845 ?auto_2631847 ) ( not ( = ?auto_2631847 ?auto_2631849 ) ) ( HOIST-AT ?auto_2631848 ?auto_2631847 ) ( LIFTING ?auto_2631848 ?auto_2631844 ) ( not ( = ?auto_2631846 ?auto_2631848 ) ) ( ON ?auto_2631829 ?auto_2631828 ) ( ON ?auto_2631830 ?auto_2631829 ) ( ON ?auto_2631831 ?auto_2631830 ) ( ON ?auto_2631832 ?auto_2631831 ) ( ON ?auto_2631833 ?auto_2631832 ) ( ON ?auto_2631834 ?auto_2631833 ) ( ON ?auto_2631835 ?auto_2631834 ) ( ON ?auto_2631836 ?auto_2631835 ) ( ON ?auto_2631837 ?auto_2631836 ) ( ON ?auto_2631838 ?auto_2631837 ) ( ON ?auto_2631839 ?auto_2631838 ) ( ON ?auto_2631840 ?auto_2631839 ) ( ON ?auto_2631841 ?auto_2631840 ) ( ON ?auto_2631842 ?auto_2631841 ) ( not ( = ?auto_2631828 ?auto_2631829 ) ) ( not ( = ?auto_2631828 ?auto_2631830 ) ) ( not ( = ?auto_2631828 ?auto_2631831 ) ) ( not ( = ?auto_2631828 ?auto_2631832 ) ) ( not ( = ?auto_2631828 ?auto_2631833 ) ) ( not ( = ?auto_2631828 ?auto_2631834 ) ) ( not ( = ?auto_2631828 ?auto_2631835 ) ) ( not ( = ?auto_2631828 ?auto_2631836 ) ) ( not ( = ?auto_2631828 ?auto_2631837 ) ) ( not ( = ?auto_2631828 ?auto_2631838 ) ) ( not ( = ?auto_2631828 ?auto_2631839 ) ) ( not ( = ?auto_2631828 ?auto_2631840 ) ) ( not ( = ?auto_2631828 ?auto_2631841 ) ) ( not ( = ?auto_2631828 ?auto_2631842 ) ) ( not ( = ?auto_2631828 ?auto_2631843 ) ) ( not ( = ?auto_2631828 ?auto_2631844 ) ) ( not ( = ?auto_2631829 ?auto_2631830 ) ) ( not ( = ?auto_2631829 ?auto_2631831 ) ) ( not ( = ?auto_2631829 ?auto_2631832 ) ) ( not ( = ?auto_2631829 ?auto_2631833 ) ) ( not ( = ?auto_2631829 ?auto_2631834 ) ) ( not ( = ?auto_2631829 ?auto_2631835 ) ) ( not ( = ?auto_2631829 ?auto_2631836 ) ) ( not ( = ?auto_2631829 ?auto_2631837 ) ) ( not ( = ?auto_2631829 ?auto_2631838 ) ) ( not ( = ?auto_2631829 ?auto_2631839 ) ) ( not ( = ?auto_2631829 ?auto_2631840 ) ) ( not ( = ?auto_2631829 ?auto_2631841 ) ) ( not ( = ?auto_2631829 ?auto_2631842 ) ) ( not ( = ?auto_2631829 ?auto_2631843 ) ) ( not ( = ?auto_2631829 ?auto_2631844 ) ) ( not ( = ?auto_2631830 ?auto_2631831 ) ) ( not ( = ?auto_2631830 ?auto_2631832 ) ) ( not ( = ?auto_2631830 ?auto_2631833 ) ) ( not ( = ?auto_2631830 ?auto_2631834 ) ) ( not ( = ?auto_2631830 ?auto_2631835 ) ) ( not ( = ?auto_2631830 ?auto_2631836 ) ) ( not ( = ?auto_2631830 ?auto_2631837 ) ) ( not ( = ?auto_2631830 ?auto_2631838 ) ) ( not ( = ?auto_2631830 ?auto_2631839 ) ) ( not ( = ?auto_2631830 ?auto_2631840 ) ) ( not ( = ?auto_2631830 ?auto_2631841 ) ) ( not ( = ?auto_2631830 ?auto_2631842 ) ) ( not ( = ?auto_2631830 ?auto_2631843 ) ) ( not ( = ?auto_2631830 ?auto_2631844 ) ) ( not ( = ?auto_2631831 ?auto_2631832 ) ) ( not ( = ?auto_2631831 ?auto_2631833 ) ) ( not ( = ?auto_2631831 ?auto_2631834 ) ) ( not ( = ?auto_2631831 ?auto_2631835 ) ) ( not ( = ?auto_2631831 ?auto_2631836 ) ) ( not ( = ?auto_2631831 ?auto_2631837 ) ) ( not ( = ?auto_2631831 ?auto_2631838 ) ) ( not ( = ?auto_2631831 ?auto_2631839 ) ) ( not ( = ?auto_2631831 ?auto_2631840 ) ) ( not ( = ?auto_2631831 ?auto_2631841 ) ) ( not ( = ?auto_2631831 ?auto_2631842 ) ) ( not ( = ?auto_2631831 ?auto_2631843 ) ) ( not ( = ?auto_2631831 ?auto_2631844 ) ) ( not ( = ?auto_2631832 ?auto_2631833 ) ) ( not ( = ?auto_2631832 ?auto_2631834 ) ) ( not ( = ?auto_2631832 ?auto_2631835 ) ) ( not ( = ?auto_2631832 ?auto_2631836 ) ) ( not ( = ?auto_2631832 ?auto_2631837 ) ) ( not ( = ?auto_2631832 ?auto_2631838 ) ) ( not ( = ?auto_2631832 ?auto_2631839 ) ) ( not ( = ?auto_2631832 ?auto_2631840 ) ) ( not ( = ?auto_2631832 ?auto_2631841 ) ) ( not ( = ?auto_2631832 ?auto_2631842 ) ) ( not ( = ?auto_2631832 ?auto_2631843 ) ) ( not ( = ?auto_2631832 ?auto_2631844 ) ) ( not ( = ?auto_2631833 ?auto_2631834 ) ) ( not ( = ?auto_2631833 ?auto_2631835 ) ) ( not ( = ?auto_2631833 ?auto_2631836 ) ) ( not ( = ?auto_2631833 ?auto_2631837 ) ) ( not ( = ?auto_2631833 ?auto_2631838 ) ) ( not ( = ?auto_2631833 ?auto_2631839 ) ) ( not ( = ?auto_2631833 ?auto_2631840 ) ) ( not ( = ?auto_2631833 ?auto_2631841 ) ) ( not ( = ?auto_2631833 ?auto_2631842 ) ) ( not ( = ?auto_2631833 ?auto_2631843 ) ) ( not ( = ?auto_2631833 ?auto_2631844 ) ) ( not ( = ?auto_2631834 ?auto_2631835 ) ) ( not ( = ?auto_2631834 ?auto_2631836 ) ) ( not ( = ?auto_2631834 ?auto_2631837 ) ) ( not ( = ?auto_2631834 ?auto_2631838 ) ) ( not ( = ?auto_2631834 ?auto_2631839 ) ) ( not ( = ?auto_2631834 ?auto_2631840 ) ) ( not ( = ?auto_2631834 ?auto_2631841 ) ) ( not ( = ?auto_2631834 ?auto_2631842 ) ) ( not ( = ?auto_2631834 ?auto_2631843 ) ) ( not ( = ?auto_2631834 ?auto_2631844 ) ) ( not ( = ?auto_2631835 ?auto_2631836 ) ) ( not ( = ?auto_2631835 ?auto_2631837 ) ) ( not ( = ?auto_2631835 ?auto_2631838 ) ) ( not ( = ?auto_2631835 ?auto_2631839 ) ) ( not ( = ?auto_2631835 ?auto_2631840 ) ) ( not ( = ?auto_2631835 ?auto_2631841 ) ) ( not ( = ?auto_2631835 ?auto_2631842 ) ) ( not ( = ?auto_2631835 ?auto_2631843 ) ) ( not ( = ?auto_2631835 ?auto_2631844 ) ) ( not ( = ?auto_2631836 ?auto_2631837 ) ) ( not ( = ?auto_2631836 ?auto_2631838 ) ) ( not ( = ?auto_2631836 ?auto_2631839 ) ) ( not ( = ?auto_2631836 ?auto_2631840 ) ) ( not ( = ?auto_2631836 ?auto_2631841 ) ) ( not ( = ?auto_2631836 ?auto_2631842 ) ) ( not ( = ?auto_2631836 ?auto_2631843 ) ) ( not ( = ?auto_2631836 ?auto_2631844 ) ) ( not ( = ?auto_2631837 ?auto_2631838 ) ) ( not ( = ?auto_2631837 ?auto_2631839 ) ) ( not ( = ?auto_2631837 ?auto_2631840 ) ) ( not ( = ?auto_2631837 ?auto_2631841 ) ) ( not ( = ?auto_2631837 ?auto_2631842 ) ) ( not ( = ?auto_2631837 ?auto_2631843 ) ) ( not ( = ?auto_2631837 ?auto_2631844 ) ) ( not ( = ?auto_2631838 ?auto_2631839 ) ) ( not ( = ?auto_2631838 ?auto_2631840 ) ) ( not ( = ?auto_2631838 ?auto_2631841 ) ) ( not ( = ?auto_2631838 ?auto_2631842 ) ) ( not ( = ?auto_2631838 ?auto_2631843 ) ) ( not ( = ?auto_2631838 ?auto_2631844 ) ) ( not ( = ?auto_2631839 ?auto_2631840 ) ) ( not ( = ?auto_2631839 ?auto_2631841 ) ) ( not ( = ?auto_2631839 ?auto_2631842 ) ) ( not ( = ?auto_2631839 ?auto_2631843 ) ) ( not ( = ?auto_2631839 ?auto_2631844 ) ) ( not ( = ?auto_2631840 ?auto_2631841 ) ) ( not ( = ?auto_2631840 ?auto_2631842 ) ) ( not ( = ?auto_2631840 ?auto_2631843 ) ) ( not ( = ?auto_2631840 ?auto_2631844 ) ) ( not ( = ?auto_2631841 ?auto_2631842 ) ) ( not ( = ?auto_2631841 ?auto_2631843 ) ) ( not ( = ?auto_2631841 ?auto_2631844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2631842 ?auto_2631843 ?auto_2631844 )
      ( MAKE-16CRATE-VERIFY ?auto_2631828 ?auto_2631829 ?auto_2631830 ?auto_2631831 ?auto_2631832 ?auto_2631833 ?auto_2631834 ?auto_2631835 ?auto_2631836 ?auto_2631837 ?auto_2631838 ?auto_2631839 ?auto_2631840 ?auto_2631841 ?auto_2631842 ?auto_2631843 ?auto_2631844 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632076 - SURFACE
      ?auto_2632077 - SURFACE
      ?auto_2632078 - SURFACE
      ?auto_2632079 - SURFACE
      ?auto_2632080 - SURFACE
      ?auto_2632081 - SURFACE
      ?auto_2632082 - SURFACE
      ?auto_2632083 - SURFACE
      ?auto_2632084 - SURFACE
      ?auto_2632085 - SURFACE
      ?auto_2632086 - SURFACE
      ?auto_2632087 - SURFACE
      ?auto_2632088 - SURFACE
      ?auto_2632089 - SURFACE
      ?auto_2632090 - SURFACE
      ?auto_2632091 - SURFACE
      ?auto_2632092 - SURFACE
    )
    :vars
    (
      ?auto_2632093 - HOIST
      ?auto_2632096 - PLACE
      ?auto_2632098 - TRUCK
      ?auto_2632097 - PLACE
      ?auto_2632095 - HOIST
      ?auto_2632094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632093 ?auto_2632096 ) ( SURFACE-AT ?auto_2632091 ?auto_2632096 ) ( CLEAR ?auto_2632091 ) ( IS-CRATE ?auto_2632092 ) ( not ( = ?auto_2632091 ?auto_2632092 ) ) ( AVAILABLE ?auto_2632093 ) ( ON ?auto_2632091 ?auto_2632090 ) ( not ( = ?auto_2632090 ?auto_2632091 ) ) ( not ( = ?auto_2632090 ?auto_2632092 ) ) ( TRUCK-AT ?auto_2632098 ?auto_2632097 ) ( not ( = ?auto_2632097 ?auto_2632096 ) ) ( HOIST-AT ?auto_2632095 ?auto_2632097 ) ( not ( = ?auto_2632093 ?auto_2632095 ) ) ( AVAILABLE ?auto_2632095 ) ( SURFACE-AT ?auto_2632092 ?auto_2632097 ) ( ON ?auto_2632092 ?auto_2632094 ) ( CLEAR ?auto_2632092 ) ( not ( = ?auto_2632091 ?auto_2632094 ) ) ( not ( = ?auto_2632092 ?auto_2632094 ) ) ( not ( = ?auto_2632090 ?auto_2632094 ) ) ( ON ?auto_2632077 ?auto_2632076 ) ( ON ?auto_2632078 ?auto_2632077 ) ( ON ?auto_2632079 ?auto_2632078 ) ( ON ?auto_2632080 ?auto_2632079 ) ( ON ?auto_2632081 ?auto_2632080 ) ( ON ?auto_2632082 ?auto_2632081 ) ( ON ?auto_2632083 ?auto_2632082 ) ( ON ?auto_2632084 ?auto_2632083 ) ( ON ?auto_2632085 ?auto_2632084 ) ( ON ?auto_2632086 ?auto_2632085 ) ( ON ?auto_2632087 ?auto_2632086 ) ( ON ?auto_2632088 ?auto_2632087 ) ( ON ?auto_2632089 ?auto_2632088 ) ( ON ?auto_2632090 ?auto_2632089 ) ( not ( = ?auto_2632076 ?auto_2632077 ) ) ( not ( = ?auto_2632076 ?auto_2632078 ) ) ( not ( = ?auto_2632076 ?auto_2632079 ) ) ( not ( = ?auto_2632076 ?auto_2632080 ) ) ( not ( = ?auto_2632076 ?auto_2632081 ) ) ( not ( = ?auto_2632076 ?auto_2632082 ) ) ( not ( = ?auto_2632076 ?auto_2632083 ) ) ( not ( = ?auto_2632076 ?auto_2632084 ) ) ( not ( = ?auto_2632076 ?auto_2632085 ) ) ( not ( = ?auto_2632076 ?auto_2632086 ) ) ( not ( = ?auto_2632076 ?auto_2632087 ) ) ( not ( = ?auto_2632076 ?auto_2632088 ) ) ( not ( = ?auto_2632076 ?auto_2632089 ) ) ( not ( = ?auto_2632076 ?auto_2632090 ) ) ( not ( = ?auto_2632076 ?auto_2632091 ) ) ( not ( = ?auto_2632076 ?auto_2632092 ) ) ( not ( = ?auto_2632076 ?auto_2632094 ) ) ( not ( = ?auto_2632077 ?auto_2632078 ) ) ( not ( = ?auto_2632077 ?auto_2632079 ) ) ( not ( = ?auto_2632077 ?auto_2632080 ) ) ( not ( = ?auto_2632077 ?auto_2632081 ) ) ( not ( = ?auto_2632077 ?auto_2632082 ) ) ( not ( = ?auto_2632077 ?auto_2632083 ) ) ( not ( = ?auto_2632077 ?auto_2632084 ) ) ( not ( = ?auto_2632077 ?auto_2632085 ) ) ( not ( = ?auto_2632077 ?auto_2632086 ) ) ( not ( = ?auto_2632077 ?auto_2632087 ) ) ( not ( = ?auto_2632077 ?auto_2632088 ) ) ( not ( = ?auto_2632077 ?auto_2632089 ) ) ( not ( = ?auto_2632077 ?auto_2632090 ) ) ( not ( = ?auto_2632077 ?auto_2632091 ) ) ( not ( = ?auto_2632077 ?auto_2632092 ) ) ( not ( = ?auto_2632077 ?auto_2632094 ) ) ( not ( = ?auto_2632078 ?auto_2632079 ) ) ( not ( = ?auto_2632078 ?auto_2632080 ) ) ( not ( = ?auto_2632078 ?auto_2632081 ) ) ( not ( = ?auto_2632078 ?auto_2632082 ) ) ( not ( = ?auto_2632078 ?auto_2632083 ) ) ( not ( = ?auto_2632078 ?auto_2632084 ) ) ( not ( = ?auto_2632078 ?auto_2632085 ) ) ( not ( = ?auto_2632078 ?auto_2632086 ) ) ( not ( = ?auto_2632078 ?auto_2632087 ) ) ( not ( = ?auto_2632078 ?auto_2632088 ) ) ( not ( = ?auto_2632078 ?auto_2632089 ) ) ( not ( = ?auto_2632078 ?auto_2632090 ) ) ( not ( = ?auto_2632078 ?auto_2632091 ) ) ( not ( = ?auto_2632078 ?auto_2632092 ) ) ( not ( = ?auto_2632078 ?auto_2632094 ) ) ( not ( = ?auto_2632079 ?auto_2632080 ) ) ( not ( = ?auto_2632079 ?auto_2632081 ) ) ( not ( = ?auto_2632079 ?auto_2632082 ) ) ( not ( = ?auto_2632079 ?auto_2632083 ) ) ( not ( = ?auto_2632079 ?auto_2632084 ) ) ( not ( = ?auto_2632079 ?auto_2632085 ) ) ( not ( = ?auto_2632079 ?auto_2632086 ) ) ( not ( = ?auto_2632079 ?auto_2632087 ) ) ( not ( = ?auto_2632079 ?auto_2632088 ) ) ( not ( = ?auto_2632079 ?auto_2632089 ) ) ( not ( = ?auto_2632079 ?auto_2632090 ) ) ( not ( = ?auto_2632079 ?auto_2632091 ) ) ( not ( = ?auto_2632079 ?auto_2632092 ) ) ( not ( = ?auto_2632079 ?auto_2632094 ) ) ( not ( = ?auto_2632080 ?auto_2632081 ) ) ( not ( = ?auto_2632080 ?auto_2632082 ) ) ( not ( = ?auto_2632080 ?auto_2632083 ) ) ( not ( = ?auto_2632080 ?auto_2632084 ) ) ( not ( = ?auto_2632080 ?auto_2632085 ) ) ( not ( = ?auto_2632080 ?auto_2632086 ) ) ( not ( = ?auto_2632080 ?auto_2632087 ) ) ( not ( = ?auto_2632080 ?auto_2632088 ) ) ( not ( = ?auto_2632080 ?auto_2632089 ) ) ( not ( = ?auto_2632080 ?auto_2632090 ) ) ( not ( = ?auto_2632080 ?auto_2632091 ) ) ( not ( = ?auto_2632080 ?auto_2632092 ) ) ( not ( = ?auto_2632080 ?auto_2632094 ) ) ( not ( = ?auto_2632081 ?auto_2632082 ) ) ( not ( = ?auto_2632081 ?auto_2632083 ) ) ( not ( = ?auto_2632081 ?auto_2632084 ) ) ( not ( = ?auto_2632081 ?auto_2632085 ) ) ( not ( = ?auto_2632081 ?auto_2632086 ) ) ( not ( = ?auto_2632081 ?auto_2632087 ) ) ( not ( = ?auto_2632081 ?auto_2632088 ) ) ( not ( = ?auto_2632081 ?auto_2632089 ) ) ( not ( = ?auto_2632081 ?auto_2632090 ) ) ( not ( = ?auto_2632081 ?auto_2632091 ) ) ( not ( = ?auto_2632081 ?auto_2632092 ) ) ( not ( = ?auto_2632081 ?auto_2632094 ) ) ( not ( = ?auto_2632082 ?auto_2632083 ) ) ( not ( = ?auto_2632082 ?auto_2632084 ) ) ( not ( = ?auto_2632082 ?auto_2632085 ) ) ( not ( = ?auto_2632082 ?auto_2632086 ) ) ( not ( = ?auto_2632082 ?auto_2632087 ) ) ( not ( = ?auto_2632082 ?auto_2632088 ) ) ( not ( = ?auto_2632082 ?auto_2632089 ) ) ( not ( = ?auto_2632082 ?auto_2632090 ) ) ( not ( = ?auto_2632082 ?auto_2632091 ) ) ( not ( = ?auto_2632082 ?auto_2632092 ) ) ( not ( = ?auto_2632082 ?auto_2632094 ) ) ( not ( = ?auto_2632083 ?auto_2632084 ) ) ( not ( = ?auto_2632083 ?auto_2632085 ) ) ( not ( = ?auto_2632083 ?auto_2632086 ) ) ( not ( = ?auto_2632083 ?auto_2632087 ) ) ( not ( = ?auto_2632083 ?auto_2632088 ) ) ( not ( = ?auto_2632083 ?auto_2632089 ) ) ( not ( = ?auto_2632083 ?auto_2632090 ) ) ( not ( = ?auto_2632083 ?auto_2632091 ) ) ( not ( = ?auto_2632083 ?auto_2632092 ) ) ( not ( = ?auto_2632083 ?auto_2632094 ) ) ( not ( = ?auto_2632084 ?auto_2632085 ) ) ( not ( = ?auto_2632084 ?auto_2632086 ) ) ( not ( = ?auto_2632084 ?auto_2632087 ) ) ( not ( = ?auto_2632084 ?auto_2632088 ) ) ( not ( = ?auto_2632084 ?auto_2632089 ) ) ( not ( = ?auto_2632084 ?auto_2632090 ) ) ( not ( = ?auto_2632084 ?auto_2632091 ) ) ( not ( = ?auto_2632084 ?auto_2632092 ) ) ( not ( = ?auto_2632084 ?auto_2632094 ) ) ( not ( = ?auto_2632085 ?auto_2632086 ) ) ( not ( = ?auto_2632085 ?auto_2632087 ) ) ( not ( = ?auto_2632085 ?auto_2632088 ) ) ( not ( = ?auto_2632085 ?auto_2632089 ) ) ( not ( = ?auto_2632085 ?auto_2632090 ) ) ( not ( = ?auto_2632085 ?auto_2632091 ) ) ( not ( = ?auto_2632085 ?auto_2632092 ) ) ( not ( = ?auto_2632085 ?auto_2632094 ) ) ( not ( = ?auto_2632086 ?auto_2632087 ) ) ( not ( = ?auto_2632086 ?auto_2632088 ) ) ( not ( = ?auto_2632086 ?auto_2632089 ) ) ( not ( = ?auto_2632086 ?auto_2632090 ) ) ( not ( = ?auto_2632086 ?auto_2632091 ) ) ( not ( = ?auto_2632086 ?auto_2632092 ) ) ( not ( = ?auto_2632086 ?auto_2632094 ) ) ( not ( = ?auto_2632087 ?auto_2632088 ) ) ( not ( = ?auto_2632087 ?auto_2632089 ) ) ( not ( = ?auto_2632087 ?auto_2632090 ) ) ( not ( = ?auto_2632087 ?auto_2632091 ) ) ( not ( = ?auto_2632087 ?auto_2632092 ) ) ( not ( = ?auto_2632087 ?auto_2632094 ) ) ( not ( = ?auto_2632088 ?auto_2632089 ) ) ( not ( = ?auto_2632088 ?auto_2632090 ) ) ( not ( = ?auto_2632088 ?auto_2632091 ) ) ( not ( = ?auto_2632088 ?auto_2632092 ) ) ( not ( = ?auto_2632088 ?auto_2632094 ) ) ( not ( = ?auto_2632089 ?auto_2632090 ) ) ( not ( = ?auto_2632089 ?auto_2632091 ) ) ( not ( = ?auto_2632089 ?auto_2632092 ) ) ( not ( = ?auto_2632089 ?auto_2632094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632090 ?auto_2632091 ?auto_2632092 )
      ( MAKE-16CRATE-VERIFY ?auto_2632076 ?auto_2632077 ?auto_2632078 ?auto_2632079 ?auto_2632080 ?auto_2632081 ?auto_2632082 ?auto_2632083 ?auto_2632084 ?auto_2632085 ?auto_2632086 ?auto_2632087 ?auto_2632088 ?auto_2632089 ?auto_2632090 ?auto_2632091 ?auto_2632092 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632325 - SURFACE
      ?auto_2632326 - SURFACE
      ?auto_2632327 - SURFACE
      ?auto_2632328 - SURFACE
      ?auto_2632329 - SURFACE
      ?auto_2632330 - SURFACE
      ?auto_2632331 - SURFACE
      ?auto_2632332 - SURFACE
      ?auto_2632333 - SURFACE
      ?auto_2632334 - SURFACE
      ?auto_2632335 - SURFACE
      ?auto_2632336 - SURFACE
      ?auto_2632337 - SURFACE
      ?auto_2632338 - SURFACE
      ?auto_2632339 - SURFACE
      ?auto_2632340 - SURFACE
      ?auto_2632341 - SURFACE
    )
    :vars
    (
      ?auto_2632346 - HOIST
      ?auto_2632345 - PLACE
      ?auto_2632344 - PLACE
      ?auto_2632343 - HOIST
      ?auto_2632342 - SURFACE
      ?auto_2632347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632346 ?auto_2632345 ) ( SURFACE-AT ?auto_2632340 ?auto_2632345 ) ( CLEAR ?auto_2632340 ) ( IS-CRATE ?auto_2632341 ) ( not ( = ?auto_2632340 ?auto_2632341 ) ) ( AVAILABLE ?auto_2632346 ) ( ON ?auto_2632340 ?auto_2632339 ) ( not ( = ?auto_2632339 ?auto_2632340 ) ) ( not ( = ?auto_2632339 ?auto_2632341 ) ) ( not ( = ?auto_2632344 ?auto_2632345 ) ) ( HOIST-AT ?auto_2632343 ?auto_2632344 ) ( not ( = ?auto_2632346 ?auto_2632343 ) ) ( AVAILABLE ?auto_2632343 ) ( SURFACE-AT ?auto_2632341 ?auto_2632344 ) ( ON ?auto_2632341 ?auto_2632342 ) ( CLEAR ?auto_2632341 ) ( not ( = ?auto_2632340 ?auto_2632342 ) ) ( not ( = ?auto_2632341 ?auto_2632342 ) ) ( not ( = ?auto_2632339 ?auto_2632342 ) ) ( TRUCK-AT ?auto_2632347 ?auto_2632345 ) ( ON ?auto_2632326 ?auto_2632325 ) ( ON ?auto_2632327 ?auto_2632326 ) ( ON ?auto_2632328 ?auto_2632327 ) ( ON ?auto_2632329 ?auto_2632328 ) ( ON ?auto_2632330 ?auto_2632329 ) ( ON ?auto_2632331 ?auto_2632330 ) ( ON ?auto_2632332 ?auto_2632331 ) ( ON ?auto_2632333 ?auto_2632332 ) ( ON ?auto_2632334 ?auto_2632333 ) ( ON ?auto_2632335 ?auto_2632334 ) ( ON ?auto_2632336 ?auto_2632335 ) ( ON ?auto_2632337 ?auto_2632336 ) ( ON ?auto_2632338 ?auto_2632337 ) ( ON ?auto_2632339 ?auto_2632338 ) ( not ( = ?auto_2632325 ?auto_2632326 ) ) ( not ( = ?auto_2632325 ?auto_2632327 ) ) ( not ( = ?auto_2632325 ?auto_2632328 ) ) ( not ( = ?auto_2632325 ?auto_2632329 ) ) ( not ( = ?auto_2632325 ?auto_2632330 ) ) ( not ( = ?auto_2632325 ?auto_2632331 ) ) ( not ( = ?auto_2632325 ?auto_2632332 ) ) ( not ( = ?auto_2632325 ?auto_2632333 ) ) ( not ( = ?auto_2632325 ?auto_2632334 ) ) ( not ( = ?auto_2632325 ?auto_2632335 ) ) ( not ( = ?auto_2632325 ?auto_2632336 ) ) ( not ( = ?auto_2632325 ?auto_2632337 ) ) ( not ( = ?auto_2632325 ?auto_2632338 ) ) ( not ( = ?auto_2632325 ?auto_2632339 ) ) ( not ( = ?auto_2632325 ?auto_2632340 ) ) ( not ( = ?auto_2632325 ?auto_2632341 ) ) ( not ( = ?auto_2632325 ?auto_2632342 ) ) ( not ( = ?auto_2632326 ?auto_2632327 ) ) ( not ( = ?auto_2632326 ?auto_2632328 ) ) ( not ( = ?auto_2632326 ?auto_2632329 ) ) ( not ( = ?auto_2632326 ?auto_2632330 ) ) ( not ( = ?auto_2632326 ?auto_2632331 ) ) ( not ( = ?auto_2632326 ?auto_2632332 ) ) ( not ( = ?auto_2632326 ?auto_2632333 ) ) ( not ( = ?auto_2632326 ?auto_2632334 ) ) ( not ( = ?auto_2632326 ?auto_2632335 ) ) ( not ( = ?auto_2632326 ?auto_2632336 ) ) ( not ( = ?auto_2632326 ?auto_2632337 ) ) ( not ( = ?auto_2632326 ?auto_2632338 ) ) ( not ( = ?auto_2632326 ?auto_2632339 ) ) ( not ( = ?auto_2632326 ?auto_2632340 ) ) ( not ( = ?auto_2632326 ?auto_2632341 ) ) ( not ( = ?auto_2632326 ?auto_2632342 ) ) ( not ( = ?auto_2632327 ?auto_2632328 ) ) ( not ( = ?auto_2632327 ?auto_2632329 ) ) ( not ( = ?auto_2632327 ?auto_2632330 ) ) ( not ( = ?auto_2632327 ?auto_2632331 ) ) ( not ( = ?auto_2632327 ?auto_2632332 ) ) ( not ( = ?auto_2632327 ?auto_2632333 ) ) ( not ( = ?auto_2632327 ?auto_2632334 ) ) ( not ( = ?auto_2632327 ?auto_2632335 ) ) ( not ( = ?auto_2632327 ?auto_2632336 ) ) ( not ( = ?auto_2632327 ?auto_2632337 ) ) ( not ( = ?auto_2632327 ?auto_2632338 ) ) ( not ( = ?auto_2632327 ?auto_2632339 ) ) ( not ( = ?auto_2632327 ?auto_2632340 ) ) ( not ( = ?auto_2632327 ?auto_2632341 ) ) ( not ( = ?auto_2632327 ?auto_2632342 ) ) ( not ( = ?auto_2632328 ?auto_2632329 ) ) ( not ( = ?auto_2632328 ?auto_2632330 ) ) ( not ( = ?auto_2632328 ?auto_2632331 ) ) ( not ( = ?auto_2632328 ?auto_2632332 ) ) ( not ( = ?auto_2632328 ?auto_2632333 ) ) ( not ( = ?auto_2632328 ?auto_2632334 ) ) ( not ( = ?auto_2632328 ?auto_2632335 ) ) ( not ( = ?auto_2632328 ?auto_2632336 ) ) ( not ( = ?auto_2632328 ?auto_2632337 ) ) ( not ( = ?auto_2632328 ?auto_2632338 ) ) ( not ( = ?auto_2632328 ?auto_2632339 ) ) ( not ( = ?auto_2632328 ?auto_2632340 ) ) ( not ( = ?auto_2632328 ?auto_2632341 ) ) ( not ( = ?auto_2632328 ?auto_2632342 ) ) ( not ( = ?auto_2632329 ?auto_2632330 ) ) ( not ( = ?auto_2632329 ?auto_2632331 ) ) ( not ( = ?auto_2632329 ?auto_2632332 ) ) ( not ( = ?auto_2632329 ?auto_2632333 ) ) ( not ( = ?auto_2632329 ?auto_2632334 ) ) ( not ( = ?auto_2632329 ?auto_2632335 ) ) ( not ( = ?auto_2632329 ?auto_2632336 ) ) ( not ( = ?auto_2632329 ?auto_2632337 ) ) ( not ( = ?auto_2632329 ?auto_2632338 ) ) ( not ( = ?auto_2632329 ?auto_2632339 ) ) ( not ( = ?auto_2632329 ?auto_2632340 ) ) ( not ( = ?auto_2632329 ?auto_2632341 ) ) ( not ( = ?auto_2632329 ?auto_2632342 ) ) ( not ( = ?auto_2632330 ?auto_2632331 ) ) ( not ( = ?auto_2632330 ?auto_2632332 ) ) ( not ( = ?auto_2632330 ?auto_2632333 ) ) ( not ( = ?auto_2632330 ?auto_2632334 ) ) ( not ( = ?auto_2632330 ?auto_2632335 ) ) ( not ( = ?auto_2632330 ?auto_2632336 ) ) ( not ( = ?auto_2632330 ?auto_2632337 ) ) ( not ( = ?auto_2632330 ?auto_2632338 ) ) ( not ( = ?auto_2632330 ?auto_2632339 ) ) ( not ( = ?auto_2632330 ?auto_2632340 ) ) ( not ( = ?auto_2632330 ?auto_2632341 ) ) ( not ( = ?auto_2632330 ?auto_2632342 ) ) ( not ( = ?auto_2632331 ?auto_2632332 ) ) ( not ( = ?auto_2632331 ?auto_2632333 ) ) ( not ( = ?auto_2632331 ?auto_2632334 ) ) ( not ( = ?auto_2632331 ?auto_2632335 ) ) ( not ( = ?auto_2632331 ?auto_2632336 ) ) ( not ( = ?auto_2632331 ?auto_2632337 ) ) ( not ( = ?auto_2632331 ?auto_2632338 ) ) ( not ( = ?auto_2632331 ?auto_2632339 ) ) ( not ( = ?auto_2632331 ?auto_2632340 ) ) ( not ( = ?auto_2632331 ?auto_2632341 ) ) ( not ( = ?auto_2632331 ?auto_2632342 ) ) ( not ( = ?auto_2632332 ?auto_2632333 ) ) ( not ( = ?auto_2632332 ?auto_2632334 ) ) ( not ( = ?auto_2632332 ?auto_2632335 ) ) ( not ( = ?auto_2632332 ?auto_2632336 ) ) ( not ( = ?auto_2632332 ?auto_2632337 ) ) ( not ( = ?auto_2632332 ?auto_2632338 ) ) ( not ( = ?auto_2632332 ?auto_2632339 ) ) ( not ( = ?auto_2632332 ?auto_2632340 ) ) ( not ( = ?auto_2632332 ?auto_2632341 ) ) ( not ( = ?auto_2632332 ?auto_2632342 ) ) ( not ( = ?auto_2632333 ?auto_2632334 ) ) ( not ( = ?auto_2632333 ?auto_2632335 ) ) ( not ( = ?auto_2632333 ?auto_2632336 ) ) ( not ( = ?auto_2632333 ?auto_2632337 ) ) ( not ( = ?auto_2632333 ?auto_2632338 ) ) ( not ( = ?auto_2632333 ?auto_2632339 ) ) ( not ( = ?auto_2632333 ?auto_2632340 ) ) ( not ( = ?auto_2632333 ?auto_2632341 ) ) ( not ( = ?auto_2632333 ?auto_2632342 ) ) ( not ( = ?auto_2632334 ?auto_2632335 ) ) ( not ( = ?auto_2632334 ?auto_2632336 ) ) ( not ( = ?auto_2632334 ?auto_2632337 ) ) ( not ( = ?auto_2632334 ?auto_2632338 ) ) ( not ( = ?auto_2632334 ?auto_2632339 ) ) ( not ( = ?auto_2632334 ?auto_2632340 ) ) ( not ( = ?auto_2632334 ?auto_2632341 ) ) ( not ( = ?auto_2632334 ?auto_2632342 ) ) ( not ( = ?auto_2632335 ?auto_2632336 ) ) ( not ( = ?auto_2632335 ?auto_2632337 ) ) ( not ( = ?auto_2632335 ?auto_2632338 ) ) ( not ( = ?auto_2632335 ?auto_2632339 ) ) ( not ( = ?auto_2632335 ?auto_2632340 ) ) ( not ( = ?auto_2632335 ?auto_2632341 ) ) ( not ( = ?auto_2632335 ?auto_2632342 ) ) ( not ( = ?auto_2632336 ?auto_2632337 ) ) ( not ( = ?auto_2632336 ?auto_2632338 ) ) ( not ( = ?auto_2632336 ?auto_2632339 ) ) ( not ( = ?auto_2632336 ?auto_2632340 ) ) ( not ( = ?auto_2632336 ?auto_2632341 ) ) ( not ( = ?auto_2632336 ?auto_2632342 ) ) ( not ( = ?auto_2632337 ?auto_2632338 ) ) ( not ( = ?auto_2632337 ?auto_2632339 ) ) ( not ( = ?auto_2632337 ?auto_2632340 ) ) ( not ( = ?auto_2632337 ?auto_2632341 ) ) ( not ( = ?auto_2632337 ?auto_2632342 ) ) ( not ( = ?auto_2632338 ?auto_2632339 ) ) ( not ( = ?auto_2632338 ?auto_2632340 ) ) ( not ( = ?auto_2632338 ?auto_2632341 ) ) ( not ( = ?auto_2632338 ?auto_2632342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632339 ?auto_2632340 ?auto_2632341 )
      ( MAKE-16CRATE-VERIFY ?auto_2632325 ?auto_2632326 ?auto_2632327 ?auto_2632328 ?auto_2632329 ?auto_2632330 ?auto_2632331 ?auto_2632332 ?auto_2632333 ?auto_2632334 ?auto_2632335 ?auto_2632336 ?auto_2632337 ?auto_2632338 ?auto_2632339 ?auto_2632340 ?auto_2632341 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632574 - SURFACE
      ?auto_2632575 - SURFACE
      ?auto_2632576 - SURFACE
      ?auto_2632577 - SURFACE
      ?auto_2632578 - SURFACE
      ?auto_2632579 - SURFACE
      ?auto_2632580 - SURFACE
      ?auto_2632581 - SURFACE
      ?auto_2632582 - SURFACE
      ?auto_2632583 - SURFACE
      ?auto_2632584 - SURFACE
      ?auto_2632585 - SURFACE
      ?auto_2632586 - SURFACE
      ?auto_2632587 - SURFACE
      ?auto_2632588 - SURFACE
      ?auto_2632589 - SURFACE
      ?auto_2632590 - SURFACE
    )
    :vars
    (
      ?auto_2632595 - HOIST
      ?auto_2632594 - PLACE
      ?auto_2632592 - PLACE
      ?auto_2632596 - HOIST
      ?auto_2632591 - SURFACE
      ?auto_2632593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632595 ?auto_2632594 ) ( IS-CRATE ?auto_2632590 ) ( not ( = ?auto_2632589 ?auto_2632590 ) ) ( not ( = ?auto_2632588 ?auto_2632589 ) ) ( not ( = ?auto_2632588 ?auto_2632590 ) ) ( not ( = ?auto_2632592 ?auto_2632594 ) ) ( HOIST-AT ?auto_2632596 ?auto_2632592 ) ( not ( = ?auto_2632595 ?auto_2632596 ) ) ( AVAILABLE ?auto_2632596 ) ( SURFACE-AT ?auto_2632590 ?auto_2632592 ) ( ON ?auto_2632590 ?auto_2632591 ) ( CLEAR ?auto_2632590 ) ( not ( = ?auto_2632589 ?auto_2632591 ) ) ( not ( = ?auto_2632590 ?auto_2632591 ) ) ( not ( = ?auto_2632588 ?auto_2632591 ) ) ( TRUCK-AT ?auto_2632593 ?auto_2632594 ) ( SURFACE-AT ?auto_2632588 ?auto_2632594 ) ( CLEAR ?auto_2632588 ) ( LIFTING ?auto_2632595 ?auto_2632589 ) ( IS-CRATE ?auto_2632589 ) ( ON ?auto_2632575 ?auto_2632574 ) ( ON ?auto_2632576 ?auto_2632575 ) ( ON ?auto_2632577 ?auto_2632576 ) ( ON ?auto_2632578 ?auto_2632577 ) ( ON ?auto_2632579 ?auto_2632578 ) ( ON ?auto_2632580 ?auto_2632579 ) ( ON ?auto_2632581 ?auto_2632580 ) ( ON ?auto_2632582 ?auto_2632581 ) ( ON ?auto_2632583 ?auto_2632582 ) ( ON ?auto_2632584 ?auto_2632583 ) ( ON ?auto_2632585 ?auto_2632584 ) ( ON ?auto_2632586 ?auto_2632585 ) ( ON ?auto_2632587 ?auto_2632586 ) ( ON ?auto_2632588 ?auto_2632587 ) ( not ( = ?auto_2632574 ?auto_2632575 ) ) ( not ( = ?auto_2632574 ?auto_2632576 ) ) ( not ( = ?auto_2632574 ?auto_2632577 ) ) ( not ( = ?auto_2632574 ?auto_2632578 ) ) ( not ( = ?auto_2632574 ?auto_2632579 ) ) ( not ( = ?auto_2632574 ?auto_2632580 ) ) ( not ( = ?auto_2632574 ?auto_2632581 ) ) ( not ( = ?auto_2632574 ?auto_2632582 ) ) ( not ( = ?auto_2632574 ?auto_2632583 ) ) ( not ( = ?auto_2632574 ?auto_2632584 ) ) ( not ( = ?auto_2632574 ?auto_2632585 ) ) ( not ( = ?auto_2632574 ?auto_2632586 ) ) ( not ( = ?auto_2632574 ?auto_2632587 ) ) ( not ( = ?auto_2632574 ?auto_2632588 ) ) ( not ( = ?auto_2632574 ?auto_2632589 ) ) ( not ( = ?auto_2632574 ?auto_2632590 ) ) ( not ( = ?auto_2632574 ?auto_2632591 ) ) ( not ( = ?auto_2632575 ?auto_2632576 ) ) ( not ( = ?auto_2632575 ?auto_2632577 ) ) ( not ( = ?auto_2632575 ?auto_2632578 ) ) ( not ( = ?auto_2632575 ?auto_2632579 ) ) ( not ( = ?auto_2632575 ?auto_2632580 ) ) ( not ( = ?auto_2632575 ?auto_2632581 ) ) ( not ( = ?auto_2632575 ?auto_2632582 ) ) ( not ( = ?auto_2632575 ?auto_2632583 ) ) ( not ( = ?auto_2632575 ?auto_2632584 ) ) ( not ( = ?auto_2632575 ?auto_2632585 ) ) ( not ( = ?auto_2632575 ?auto_2632586 ) ) ( not ( = ?auto_2632575 ?auto_2632587 ) ) ( not ( = ?auto_2632575 ?auto_2632588 ) ) ( not ( = ?auto_2632575 ?auto_2632589 ) ) ( not ( = ?auto_2632575 ?auto_2632590 ) ) ( not ( = ?auto_2632575 ?auto_2632591 ) ) ( not ( = ?auto_2632576 ?auto_2632577 ) ) ( not ( = ?auto_2632576 ?auto_2632578 ) ) ( not ( = ?auto_2632576 ?auto_2632579 ) ) ( not ( = ?auto_2632576 ?auto_2632580 ) ) ( not ( = ?auto_2632576 ?auto_2632581 ) ) ( not ( = ?auto_2632576 ?auto_2632582 ) ) ( not ( = ?auto_2632576 ?auto_2632583 ) ) ( not ( = ?auto_2632576 ?auto_2632584 ) ) ( not ( = ?auto_2632576 ?auto_2632585 ) ) ( not ( = ?auto_2632576 ?auto_2632586 ) ) ( not ( = ?auto_2632576 ?auto_2632587 ) ) ( not ( = ?auto_2632576 ?auto_2632588 ) ) ( not ( = ?auto_2632576 ?auto_2632589 ) ) ( not ( = ?auto_2632576 ?auto_2632590 ) ) ( not ( = ?auto_2632576 ?auto_2632591 ) ) ( not ( = ?auto_2632577 ?auto_2632578 ) ) ( not ( = ?auto_2632577 ?auto_2632579 ) ) ( not ( = ?auto_2632577 ?auto_2632580 ) ) ( not ( = ?auto_2632577 ?auto_2632581 ) ) ( not ( = ?auto_2632577 ?auto_2632582 ) ) ( not ( = ?auto_2632577 ?auto_2632583 ) ) ( not ( = ?auto_2632577 ?auto_2632584 ) ) ( not ( = ?auto_2632577 ?auto_2632585 ) ) ( not ( = ?auto_2632577 ?auto_2632586 ) ) ( not ( = ?auto_2632577 ?auto_2632587 ) ) ( not ( = ?auto_2632577 ?auto_2632588 ) ) ( not ( = ?auto_2632577 ?auto_2632589 ) ) ( not ( = ?auto_2632577 ?auto_2632590 ) ) ( not ( = ?auto_2632577 ?auto_2632591 ) ) ( not ( = ?auto_2632578 ?auto_2632579 ) ) ( not ( = ?auto_2632578 ?auto_2632580 ) ) ( not ( = ?auto_2632578 ?auto_2632581 ) ) ( not ( = ?auto_2632578 ?auto_2632582 ) ) ( not ( = ?auto_2632578 ?auto_2632583 ) ) ( not ( = ?auto_2632578 ?auto_2632584 ) ) ( not ( = ?auto_2632578 ?auto_2632585 ) ) ( not ( = ?auto_2632578 ?auto_2632586 ) ) ( not ( = ?auto_2632578 ?auto_2632587 ) ) ( not ( = ?auto_2632578 ?auto_2632588 ) ) ( not ( = ?auto_2632578 ?auto_2632589 ) ) ( not ( = ?auto_2632578 ?auto_2632590 ) ) ( not ( = ?auto_2632578 ?auto_2632591 ) ) ( not ( = ?auto_2632579 ?auto_2632580 ) ) ( not ( = ?auto_2632579 ?auto_2632581 ) ) ( not ( = ?auto_2632579 ?auto_2632582 ) ) ( not ( = ?auto_2632579 ?auto_2632583 ) ) ( not ( = ?auto_2632579 ?auto_2632584 ) ) ( not ( = ?auto_2632579 ?auto_2632585 ) ) ( not ( = ?auto_2632579 ?auto_2632586 ) ) ( not ( = ?auto_2632579 ?auto_2632587 ) ) ( not ( = ?auto_2632579 ?auto_2632588 ) ) ( not ( = ?auto_2632579 ?auto_2632589 ) ) ( not ( = ?auto_2632579 ?auto_2632590 ) ) ( not ( = ?auto_2632579 ?auto_2632591 ) ) ( not ( = ?auto_2632580 ?auto_2632581 ) ) ( not ( = ?auto_2632580 ?auto_2632582 ) ) ( not ( = ?auto_2632580 ?auto_2632583 ) ) ( not ( = ?auto_2632580 ?auto_2632584 ) ) ( not ( = ?auto_2632580 ?auto_2632585 ) ) ( not ( = ?auto_2632580 ?auto_2632586 ) ) ( not ( = ?auto_2632580 ?auto_2632587 ) ) ( not ( = ?auto_2632580 ?auto_2632588 ) ) ( not ( = ?auto_2632580 ?auto_2632589 ) ) ( not ( = ?auto_2632580 ?auto_2632590 ) ) ( not ( = ?auto_2632580 ?auto_2632591 ) ) ( not ( = ?auto_2632581 ?auto_2632582 ) ) ( not ( = ?auto_2632581 ?auto_2632583 ) ) ( not ( = ?auto_2632581 ?auto_2632584 ) ) ( not ( = ?auto_2632581 ?auto_2632585 ) ) ( not ( = ?auto_2632581 ?auto_2632586 ) ) ( not ( = ?auto_2632581 ?auto_2632587 ) ) ( not ( = ?auto_2632581 ?auto_2632588 ) ) ( not ( = ?auto_2632581 ?auto_2632589 ) ) ( not ( = ?auto_2632581 ?auto_2632590 ) ) ( not ( = ?auto_2632581 ?auto_2632591 ) ) ( not ( = ?auto_2632582 ?auto_2632583 ) ) ( not ( = ?auto_2632582 ?auto_2632584 ) ) ( not ( = ?auto_2632582 ?auto_2632585 ) ) ( not ( = ?auto_2632582 ?auto_2632586 ) ) ( not ( = ?auto_2632582 ?auto_2632587 ) ) ( not ( = ?auto_2632582 ?auto_2632588 ) ) ( not ( = ?auto_2632582 ?auto_2632589 ) ) ( not ( = ?auto_2632582 ?auto_2632590 ) ) ( not ( = ?auto_2632582 ?auto_2632591 ) ) ( not ( = ?auto_2632583 ?auto_2632584 ) ) ( not ( = ?auto_2632583 ?auto_2632585 ) ) ( not ( = ?auto_2632583 ?auto_2632586 ) ) ( not ( = ?auto_2632583 ?auto_2632587 ) ) ( not ( = ?auto_2632583 ?auto_2632588 ) ) ( not ( = ?auto_2632583 ?auto_2632589 ) ) ( not ( = ?auto_2632583 ?auto_2632590 ) ) ( not ( = ?auto_2632583 ?auto_2632591 ) ) ( not ( = ?auto_2632584 ?auto_2632585 ) ) ( not ( = ?auto_2632584 ?auto_2632586 ) ) ( not ( = ?auto_2632584 ?auto_2632587 ) ) ( not ( = ?auto_2632584 ?auto_2632588 ) ) ( not ( = ?auto_2632584 ?auto_2632589 ) ) ( not ( = ?auto_2632584 ?auto_2632590 ) ) ( not ( = ?auto_2632584 ?auto_2632591 ) ) ( not ( = ?auto_2632585 ?auto_2632586 ) ) ( not ( = ?auto_2632585 ?auto_2632587 ) ) ( not ( = ?auto_2632585 ?auto_2632588 ) ) ( not ( = ?auto_2632585 ?auto_2632589 ) ) ( not ( = ?auto_2632585 ?auto_2632590 ) ) ( not ( = ?auto_2632585 ?auto_2632591 ) ) ( not ( = ?auto_2632586 ?auto_2632587 ) ) ( not ( = ?auto_2632586 ?auto_2632588 ) ) ( not ( = ?auto_2632586 ?auto_2632589 ) ) ( not ( = ?auto_2632586 ?auto_2632590 ) ) ( not ( = ?auto_2632586 ?auto_2632591 ) ) ( not ( = ?auto_2632587 ?auto_2632588 ) ) ( not ( = ?auto_2632587 ?auto_2632589 ) ) ( not ( = ?auto_2632587 ?auto_2632590 ) ) ( not ( = ?auto_2632587 ?auto_2632591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632588 ?auto_2632589 ?auto_2632590 )
      ( MAKE-16CRATE-VERIFY ?auto_2632574 ?auto_2632575 ?auto_2632576 ?auto_2632577 ?auto_2632578 ?auto_2632579 ?auto_2632580 ?auto_2632581 ?auto_2632582 ?auto_2632583 ?auto_2632584 ?auto_2632585 ?auto_2632586 ?auto_2632587 ?auto_2632588 ?auto_2632589 ?auto_2632590 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2632823 - SURFACE
      ?auto_2632824 - SURFACE
      ?auto_2632825 - SURFACE
      ?auto_2632826 - SURFACE
      ?auto_2632827 - SURFACE
      ?auto_2632828 - SURFACE
      ?auto_2632829 - SURFACE
      ?auto_2632830 - SURFACE
      ?auto_2632831 - SURFACE
      ?auto_2632832 - SURFACE
      ?auto_2632833 - SURFACE
      ?auto_2632834 - SURFACE
      ?auto_2632835 - SURFACE
      ?auto_2632836 - SURFACE
      ?auto_2632837 - SURFACE
      ?auto_2632838 - SURFACE
      ?auto_2632839 - SURFACE
    )
    :vars
    (
      ?auto_2632844 - HOIST
      ?auto_2632845 - PLACE
      ?auto_2632841 - PLACE
      ?auto_2632840 - HOIST
      ?auto_2632843 - SURFACE
      ?auto_2632842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632844 ?auto_2632845 ) ( IS-CRATE ?auto_2632839 ) ( not ( = ?auto_2632838 ?auto_2632839 ) ) ( not ( = ?auto_2632837 ?auto_2632838 ) ) ( not ( = ?auto_2632837 ?auto_2632839 ) ) ( not ( = ?auto_2632841 ?auto_2632845 ) ) ( HOIST-AT ?auto_2632840 ?auto_2632841 ) ( not ( = ?auto_2632844 ?auto_2632840 ) ) ( AVAILABLE ?auto_2632840 ) ( SURFACE-AT ?auto_2632839 ?auto_2632841 ) ( ON ?auto_2632839 ?auto_2632843 ) ( CLEAR ?auto_2632839 ) ( not ( = ?auto_2632838 ?auto_2632843 ) ) ( not ( = ?auto_2632839 ?auto_2632843 ) ) ( not ( = ?auto_2632837 ?auto_2632843 ) ) ( TRUCK-AT ?auto_2632842 ?auto_2632845 ) ( SURFACE-AT ?auto_2632837 ?auto_2632845 ) ( CLEAR ?auto_2632837 ) ( IS-CRATE ?auto_2632838 ) ( AVAILABLE ?auto_2632844 ) ( IN ?auto_2632838 ?auto_2632842 ) ( ON ?auto_2632824 ?auto_2632823 ) ( ON ?auto_2632825 ?auto_2632824 ) ( ON ?auto_2632826 ?auto_2632825 ) ( ON ?auto_2632827 ?auto_2632826 ) ( ON ?auto_2632828 ?auto_2632827 ) ( ON ?auto_2632829 ?auto_2632828 ) ( ON ?auto_2632830 ?auto_2632829 ) ( ON ?auto_2632831 ?auto_2632830 ) ( ON ?auto_2632832 ?auto_2632831 ) ( ON ?auto_2632833 ?auto_2632832 ) ( ON ?auto_2632834 ?auto_2632833 ) ( ON ?auto_2632835 ?auto_2632834 ) ( ON ?auto_2632836 ?auto_2632835 ) ( ON ?auto_2632837 ?auto_2632836 ) ( not ( = ?auto_2632823 ?auto_2632824 ) ) ( not ( = ?auto_2632823 ?auto_2632825 ) ) ( not ( = ?auto_2632823 ?auto_2632826 ) ) ( not ( = ?auto_2632823 ?auto_2632827 ) ) ( not ( = ?auto_2632823 ?auto_2632828 ) ) ( not ( = ?auto_2632823 ?auto_2632829 ) ) ( not ( = ?auto_2632823 ?auto_2632830 ) ) ( not ( = ?auto_2632823 ?auto_2632831 ) ) ( not ( = ?auto_2632823 ?auto_2632832 ) ) ( not ( = ?auto_2632823 ?auto_2632833 ) ) ( not ( = ?auto_2632823 ?auto_2632834 ) ) ( not ( = ?auto_2632823 ?auto_2632835 ) ) ( not ( = ?auto_2632823 ?auto_2632836 ) ) ( not ( = ?auto_2632823 ?auto_2632837 ) ) ( not ( = ?auto_2632823 ?auto_2632838 ) ) ( not ( = ?auto_2632823 ?auto_2632839 ) ) ( not ( = ?auto_2632823 ?auto_2632843 ) ) ( not ( = ?auto_2632824 ?auto_2632825 ) ) ( not ( = ?auto_2632824 ?auto_2632826 ) ) ( not ( = ?auto_2632824 ?auto_2632827 ) ) ( not ( = ?auto_2632824 ?auto_2632828 ) ) ( not ( = ?auto_2632824 ?auto_2632829 ) ) ( not ( = ?auto_2632824 ?auto_2632830 ) ) ( not ( = ?auto_2632824 ?auto_2632831 ) ) ( not ( = ?auto_2632824 ?auto_2632832 ) ) ( not ( = ?auto_2632824 ?auto_2632833 ) ) ( not ( = ?auto_2632824 ?auto_2632834 ) ) ( not ( = ?auto_2632824 ?auto_2632835 ) ) ( not ( = ?auto_2632824 ?auto_2632836 ) ) ( not ( = ?auto_2632824 ?auto_2632837 ) ) ( not ( = ?auto_2632824 ?auto_2632838 ) ) ( not ( = ?auto_2632824 ?auto_2632839 ) ) ( not ( = ?auto_2632824 ?auto_2632843 ) ) ( not ( = ?auto_2632825 ?auto_2632826 ) ) ( not ( = ?auto_2632825 ?auto_2632827 ) ) ( not ( = ?auto_2632825 ?auto_2632828 ) ) ( not ( = ?auto_2632825 ?auto_2632829 ) ) ( not ( = ?auto_2632825 ?auto_2632830 ) ) ( not ( = ?auto_2632825 ?auto_2632831 ) ) ( not ( = ?auto_2632825 ?auto_2632832 ) ) ( not ( = ?auto_2632825 ?auto_2632833 ) ) ( not ( = ?auto_2632825 ?auto_2632834 ) ) ( not ( = ?auto_2632825 ?auto_2632835 ) ) ( not ( = ?auto_2632825 ?auto_2632836 ) ) ( not ( = ?auto_2632825 ?auto_2632837 ) ) ( not ( = ?auto_2632825 ?auto_2632838 ) ) ( not ( = ?auto_2632825 ?auto_2632839 ) ) ( not ( = ?auto_2632825 ?auto_2632843 ) ) ( not ( = ?auto_2632826 ?auto_2632827 ) ) ( not ( = ?auto_2632826 ?auto_2632828 ) ) ( not ( = ?auto_2632826 ?auto_2632829 ) ) ( not ( = ?auto_2632826 ?auto_2632830 ) ) ( not ( = ?auto_2632826 ?auto_2632831 ) ) ( not ( = ?auto_2632826 ?auto_2632832 ) ) ( not ( = ?auto_2632826 ?auto_2632833 ) ) ( not ( = ?auto_2632826 ?auto_2632834 ) ) ( not ( = ?auto_2632826 ?auto_2632835 ) ) ( not ( = ?auto_2632826 ?auto_2632836 ) ) ( not ( = ?auto_2632826 ?auto_2632837 ) ) ( not ( = ?auto_2632826 ?auto_2632838 ) ) ( not ( = ?auto_2632826 ?auto_2632839 ) ) ( not ( = ?auto_2632826 ?auto_2632843 ) ) ( not ( = ?auto_2632827 ?auto_2632828 ) ) ( not ( = ?auto_2632827 ?auto_2632829 ) ) ( not ( = ?auto_2632827 ?auto_2632830 ) ) ( not ( = ?auto_2632827 ?auto_2632831 ) ) ( not ( = ?auto_2632827 ?auto_2632832 ) ) ( not ( = ?auto_2632827 ?auto_2632833 ) ) ( not ( = ?auto_2632827 ?auto_2632834 ) ) ( not ( = ?auto_2632827 ?auto_2632835 ) ) ( not ( = ?auto_2632827 ?auto_2632836 ) ) ( not ( = ?auto_2632827 ?auto_2632837 ) ) ( not ( = ?auto_2632827 ?auto_2632838 ) ) ( not ( = ?auto_2632827 ?auto_2632839 ) ) ( not ( = ?auto_2632827 ?auto_2632843 ) ) ( not ( = ?auto_2632828 ?auto_2632829 ) ) ( not ( = ?auto_2632828 ?auto_2632830 ) ) ( not ( = ?auto_2632828 ?auto_2632831 ) ) ( not ( = ?auto_2632828 ?auto_2632832 ) ) ( not ( = ?auto_2632828 ?auto_2632833 ) ) ( not ( = ?auto_2632828 ?auto_2632834 ) ) ( not ( = ?auto_2632828 ?auto_2632835 ) ) ( not ( = ?auto_2632828 ?auto_2632836 ) ) ( not ( = ?auto_2632828 ?auto_2632837 ) ) ( not ( = ?auto_2632828 ?auto_2632838 ) ) ( not ( = ?auto_2632828 ?auto_2632839 ) ) ( not ( = ?auto_2632828 ?auto_2632843 ) ) ( not ( = ?auto_2632829 ?auto_2632830 ) ) ( not ( = ?auto_2632829 ?auto_2632831 ) ) ( not ( = ?auto_2632829 ?auto_2632832 ) ) ( not ( = ?auto_2632829 ?auto_2632833 ) ) ( not ( = ?auto_2632829 ?auto_2632834 ) ) ( not ( = ?auto_2632829 ?auto_2632835 ) ) ( not ( = ?auto_2632829 ?auto_2632836 ) ) ( not ( = ?auto_2632829 ?auto_2632837 ) ) ( not ( = ?auto_2632829 ?auto_2632838 ) ) ( not ( = ?auto_2632829 ?auto_2632839 ) ) ( not ( = ?auto_2632829 ?auto_2632843 ) ) ( not ( = ?auto_2632830 ?auto_2632831 ) ) ( not ( = ?auto_2632830 ?auto_2632832 ) ) ( not ( = ?auto_2632830 ?auto_2632833 ) ) ( not ( = ?auto_2632830 ?auto_2632834 ) ) ( not ( = ?auto_2632830 ?auto_2632835 ) ) ( not ( = ?auto_2632830 ?auto_2632836 ) ) ( not ( = ?auto_2632830 ?auto_2632837 ) ) ( not ( = ?auto_2632830 ?auto_2632838 ) ) ( not ( = ?auto_2632830 ?auto_2632839 ) ) ( not ( = ?auto_2632830 ?auto_2632843 ) ) ( not ( = ?auto_2632831 ?auto_2632832 ) ) ( not ( = ?auto_2632831 ?auto_2632833 ) ) ( not ( = ?auto_2632831 ?auto_2632834 ) ) ( not ( = ?auto_2632831 ?auto_2632835 ) ) ( not ( = ?auto_2632831 ?auto_2632836 ) ) ( not ( = ?auto_2632831 ?auto_2632837 ) ) ( not ( = ?auto_2632831 ?auto_2632838 ) ) ( not ( = ?auto_2632831 ?auto_2632839 ) ) ( not ( = ?auto_2632831 ?auto_2632843 ) ) ( not ( = ?auto_2632832 ?auto_2632833 ) ) ( not ( = ?auto_2632832 ?auto_2632834 ) ) ( not ( = ?auto_2632832 ?auto_2632835 ) ) ( not ( = ?auto_2632832 ?auto_2632836 ) ) ( not ( = ?auto_2632832 ?auto_2632837 ) ) ( not ( = ?auto_2632832 ?auto_2632838 ) ) ( not ( = ?auto_2632832 ?auto_2632839 ) ) ( not ( = ?auto_2632832 ?auto_2632843 ) ) ( not ( = ?auto_2632833 ?auto_2632834 ) ) ( not ( = ?auto_2632833 ?auto_2632835 ) ) ( not ( = ?auto_2632833 ?auto_2632836 ) ) ( not ( = ?auto_2632833 ?auto_2632837 ) ) ( not ( = ?auto_2632833 ?auto_2632838 ) ) ( not ( = ?auto_2632833 ?auto_2632839 ) ) ( not ( = ?auto_2632833 ?auto_2632843 ) ) ( not ( = ?auto_2632834 ?auto_2632835 ) ) ( not ( = ?auto_2632834 ?auto_2632836 ) ) ( not ( = ?auto_2632834 ?auto_2632837 ) ) ( not ( = ?auto_2632834 ?auto_2632838 ) ) ( not ( = ?auto_2632834 ?auto_2632839 ) ) ( not ( = ?auto_2632834 ?auto_2632843 ) ) ( not ( = ?auto_2632835 ?auto_2632836 ) ) ( not ( = ?auto_2632835 ?auto_2632837 ) ) ( not ( = ?auto_2632835 ?auto_2632838 ) ) ( not ( = ?auto_2632835 ?auto_2632839 ) ) ( not ( = ?auto_2632835 ?auto_2632843 ) ) ( not ( = ?auto_2632836 ?auto_2632837 ) ) ( not ( = ?auto_2632836 ?auto_2632838 ) ) ( not ( = ?auto_2632836 ?auto_2632839 ) ) ( not ( = ?auto_2632836 ?auto_2632843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2632837 ?auto_2632838 ?auto_2632839 )
      ( MAKE-16CRATE-VERIFY ?auto_2632823 ?auto_2632824 ?auto_2632825 ?auto_2632826 ?auto_2632827 ?auto_2632828 ?auto_2632829 ?auto_2632830 ?auto_2632831 ?auto_2632832 ?auto_2632833 ?auto_2632834 ?auto_2632835 ?auto_2632836 ?auto_2632837 ?auto_2632838 ?auto_2632839 ) )
  )

)

