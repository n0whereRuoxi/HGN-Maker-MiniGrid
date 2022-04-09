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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794448 - SURFACE
      ?auto_794449 - SURFACE
    )
    :vars
    (
      ?auto_794450 - HOIST
      ?auto_794451 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794450 ?auto_794451 ) ( SURFACE-AT ?auto_794448 ?auto_794451 ) ( CLEAR ?auto_794448 ) ( LIFTING ?auto_794450 ?auto_794449 ) ( IS-CRATE ?auto_794449 ) ( not ( = ?auto_794448 ?auto_794449 ) ) )
    :subtasks
    ( ( !DROP ?auto_794450 ?auto_794449 ?auto_794448 ?auto_794451 )
      ( MAKE-1CRATE-VERIFY ?auto_794448 ?auto_794449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794452 - SURFACE
      ?auto_794453 - SURFACE
    )
    :vars
    (
      ?auto_794454 - HOIST
      ?auto_794455 - PLACE
      ?auto_794456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794454 ?auto_794455 ) ( SURFACE-AT ?auto_794452 ?auto_794455 ) ( CLEAR ?auto_794452 ) ( IS-CRATE ?auto_794453 ) ( not ( = ?auto_794452 ?auto_794453 ) ) ( TRUCK-AT ?auto_794456 ?auto_794455 ) ( AVAILABLE ?auto_794454 ) ( IN ?auto_794453 ?auto_794456 ) )
    :subtasks
    ( ( !UNLOAD ?auto_794454 ?auto_794453 ?auto_794456 ?auto_794455 )
      ( MAKE-1CRATE ?auto_794452 ?auto_794453 )
      ( MAKE-1CRATE-VERIFY ?auto_794452 ?auto_794453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794457 - SURFACE
      ?auto_794458 - SURFACE
    )
    :vars
    (
      ?auto_794459 - HOIST
      ?auto_794461 - PLACE
      ?auto_794460 - TRUCK
      ?auto_794462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794459 ?auto_794461 ) ( SURFACE-AT ?auto_794457 ?auto_794461 ) ( CLEAR ?auto_794457 ) ( IS-CRATE ?auto_794458 ) ( not ( = ?auto_794457 ?auto_794458 ) ) ( AVAILABLE ?auto_794459 ) ( IN ?auto_794458 ?auto_794460 ) ( TRUCK-AT ?auto_794460 ?auto_794462 ) ( not ( = ?auto_794462 ?auto_794461 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_794460 ?auto_794462 ?auto_794461 )
      ( MAKE-1CRATE ?auto_794457 ?auto_794458 )
      ( MAKE-1CRATE-VERIFY ?auto_794457 ?auto_794458 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794463 - SURFACE
      ?auto_794464 - SURFACE
    )
    :vars
    (
      ?auto_794468 - HOIST
      ?auto_794467 - PLACE
      ?auto_794466 - TRUCK
      ?auto_794465 - PLACE
      ?auto_794469 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794468 ?auto_794467 ) ( SURFACE-AT ?auto_794463 ?auto_794467 ) ( CLEAR ?auto_794463 ) ( IS-CRATE ?auto_794464 ) ( not ( = ?auto_794463 ?auto_794464 ) ) ( AVAILABLE ?auto_794468 ) ( TRUCK-AT ?auto_794466 ?auto_794465 ) ( not ( = ?auto_794465 ?auto_794467 ) ) ( HOIST-AT ?auto_794469 ?auto_794465 ) ( LIFTING ?auto_794469 ?auto_794464 ) ( not ( = ?auto_794468 ?auto_794469 ) ) )
    :subtasks
    ( ( !LOAD ?auto_794469 ?auto_794464 ?auto_794466 ?auto_794465 )
      ( MAKE-1CRATE ?auto_794463 ?auto_794464 )
      ( MAKE-1CRATE-VERIFY ?auto_794463 ?auto_794464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794470 - SURFACE
      ?auto_794471 - SURFACE
    )
    :vars
    (
      ?auto_794472 - HOIST
      ?auto_794474 - PLACE
      ?auto_794476 - TRUCK
      ?auto_794473 - PLACE
      ?auto_794475 - HOIST
      ?auto_794477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794472 ?auto_794474 ) ( SURFACE-AT ?auto_794470 ?auto_794474 ) ( CLEAR ?auto_794470 ) ( IS-CRATE ?auto_794471 ) ( not ( = ?auto_794470 ?auto_794471 ) ) ( AVAILABLE ?auto_794472 ) ( TRUCK-AT ?auto_794476 ?auto_794473 ) ( not ( = ?auto_794473 ?auto_794474 ) ) ( HOIST-AT ?auto_794475 ?auto_794473 ) ( not ( = ?auto_794472 ?auto_794475 ) ) ( AVAILABLE ?auto_794475 ) ( SURFACE-AT ?auto_794471 ?auto_794473 ) ( ON ?auto_794471 ?auto_794477 ) ( CLEAR ?auto_794471 ) ( not ( = ?auto_794470 ?auto_794477 ) ) ( not ( = ?auto_794471 ?auto_794477 ) ) )
    :subtasks
    ( ( !LIFT ?auto_794475 ?auto_794471 ?auto_794477 ?auto_794473 )
      ( MAKE-1CRATE ?auto_794470 ?auto_794471 )
      ( MAKE-1CRATE-VERIFY ?auto_794470 ?auto_794471 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794478 - SURFACE
      ?auto_794479 - SURFACE
    )
    :vars
    (
      ?auto_794481 - HOIST
      ?auto_794483 - PLACE
      ?auto_794485 - PLACE
      ?auto_794482 - HOIST
      ?auto_794480 - SURFACE
      ?auto_794484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794481 ?auto_794483 ) ( SURFACE-AT ?auto_794478 ?auto_794483 ) ( CLEAR ?auto_794478 ) ( IS-CRATE ?auto_794479 ) ( not ( = ?auto_794478 ?auto_794479 ) ) ( AVAILABLE ?auto_794481 ) ( not ( = ?auto_794485 ?auto_794483 ) ) ( HOIST-AT ?auto_794482 ?auto_794485 ) ( not ( = ?auto_794481 ?auto_794482 ) ) ( AVAILABLE ?auto_794482 ) ( SURFACE-AT ?auto_794479 ?auto_794485 ) ( ON ?auto_794479 ?auto_794480 ) ( CLEAR ?auto_794479 ) ( not ( = ?auto_794478 ?auto_794480 ) ) ( not ( = ?auto_794479 ?auto_794480 ) ) ( TRUCK-AT ?auto_794484 ?auto_794483 ) )
    :subtasks
    ( ( !DRIVE ?auto_794484 ?auto_794483 ?auto_794485 )
      ( MAKE-1CRATE ?auto_794478 ?auto_794479 )
      ( MAKE-1CRATE-VERIFY ?auto_794478 ?auto_794479 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794495 - SURFACE
      ?auto_794496 - SURFACE
      ?auto_794497 - SURFACE
    )
    :vars
    (
      ?auto_794499 - HOIST
      ?auto_794498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794499 ?auto_794498 ) ( SURFACE-AT ?auto_794496 ?auto_794498 ) ( CLEAR ?auto_794496 ) ( LIFTING ?auto_794499 ?auto_794497 ) ( IS-CRATE ?auto_794497 ) ( not ( = ?auto_794496 ?auto_794497 ) ) ( ON ?auto_794496 ?auto_794495 ) ( not ( = ?auto_794495 ?auto_794496 ) ) ( not ( = ?auto_794495 ?auto_794497 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794496 ?auto_794497 )
      ( MAKE-2CRATE-VERIFY ?auto_794495 ?auto_794496 ?auto_794497 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794505 - SURFACE
      ?auto_794506 - SURFACE
      ?auto_794507 - SURFACE
    )
    :vars
    (
      ?auto_794508 - HOIST
      ?auto_794510 - PLACE
      ?auto_794509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794508 ?auto_794510 ) ( SURFACE-AT ?auto_794506 ?auto_794510 ) ( CLEAR ?auto_794506 ) ( IS-CRATE ?auto_794507 ) ( not ( = ?auto_794506 ?auto_794507 ) ) ( TRUCK-AT ?auto_794509 ?auto_794510 ) ( AVAILABLE ?auto_794508 ) ( IN ?auto_794507 ?auto_794509 ) ( ON ?auto_794506 ?auto_794505 ) ( not ( = ?auto_794505 ?auto_794506 ) ) ( not ( = ?auto_794505 ?auto_794507 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794506 ?auto_794507 )
      ( MAKE-2CRATE-VERIFY ?auto_794505 ?auto_794506 ?auto_794507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794511 - SURFACE
      ?auto_794512 - SURFACE
    )
    :vars
    (
      ?auto_794516 - HOIST
      ?auto_794514 - PLACE
      ?auto_794513 - TRUCK
      ?auto_794515 - SURFACE
      ?auto_794517 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794516 ?auto_794514 ) ( SURFACE-AT ?auto_794511 ?auto_794514 ) ( CLEAR ?auto_794511 ) ( IS-CRATE ?auto_794512 ) ( not ( = ?auto_794511 ?auto_794512 ) ) ( AVAILABLE ?auto_794516 ) ( IN ?auto_794512 ?auto_794513 ) ( ON ?auto_794511 ?auto_794515 ) ( not ( = ?auto_794515 ?auto_794511 ) ) ( not ( = ?auto_794515 ?auto_794512 ) ) ( TRUCK-AT ?auto_794513 ?auto_794517 ) ( not ( = ?auto_794517 ?auto_794514 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_794513 ?auto_794517 ?auto_794514 )
      ( MAKE-2CRATE ?auto_794515 ?auto_794511 ?auto_794512 )
      ( MAKE-1CRATE-VERIFY ?auto_794511 ?auto_794512 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794518 - SURFACE
      ?auto_794519 - SURFACE
      ?auto_794520 - SURFACE
    )
    :vars
    (
      ?auto_794521 - HOIST
      ?auto_794523 - PLACE
      ?auto_794524 - TRUCK
      ?auto_794522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794521 ?auto_794523 ) ( SURFACE-AT ?auto_794519 ?auto_794523 ) ( CLEAR ?auto_794519 ) ( IS-CRATE ?auto_794520 ) ( not ( = ?auto_794519 ?auto_794520 ) ) ( AVAILABLE ?auto_794521 ) ( IN ?auto_794520 ?auto_794524 ) ( ON ?auto_794519 ?auto_794518 ) ( not ( = ?auto_794518 ?auto_794519 ) ) ( not ( = ?auto_794518 ?auto_794520 ) ) ( TRUCK-AT ?auto_794524 ?auto_794522 ) ( not ( = ?auto_794522 ?auto_794523 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794519 ?auto_794520 )
      ( MAKE-2CRATE-VERIFY ?auto_794518 ?auto_794519 ?auto_794520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794525 - SURFACE
      ?auto_794526 - SURFACE
    )
    :vars
    (
      ?auto_794531 - HOIST
      ?auto_794529 - PLACE
      ?auto_794527 - SURFACE
      ?auto_794530 - TRUCK
      ?auto_794528 - PLACE
      ?auto_794532 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794531 ?auto_794529 ) ( SURFACE-AT ?auto_794525 ?auto_794529 ) ( CLEAR ?auto_794525 ) ( IS-CRATE ?auto_794526 ) ( not ( = ?auto_794525 ?auto_794526 ) ) ( AVAILABLE ?auto_794531 ) ( ON ?auto_794525 ?auto_794527 ) ( not ( = ?auto_794527 ?auto_794525 ) ) ( not ( = ?auto_794527 ?auto_794526 ) ) ( TRUCK-AT ?auto_794530 ?auto_794528 ) ( not ( = ?auto_794528 ?auto_794529 ) ) ( HOIST-AT ?auto_794532 ?auto_794528 ) ( LIFTING ?auto_794532 ?auto_794526 ) ( not ( = ?auto_794531 ?auto_794532 ) ) )
    :subtasks
    ( ( !LOAD ?auto_794532 ?auto_794526 ?auto_794530 ?auto_794528 )
      ( MAKE-2CRATE ?auto_794527 ?auto_794525 ?auto_794526 )
      ( MAKE-1CRATE-VERIFY ?auto_794525 ?auto_794526 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794533 - SURFACE
      ?auto_794534 - SURFACE
      ?auto_794535 - SURFACE
    )
    :vars
    (
      ?auto_794539 - HOIST
      ?auto_794540 - PLACE
      ?auto_794538 - TRUCK
      ?auto_794536 - PLACE
      ?auto_794537 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794539 ?auto_794540 ) ( SURFACE-AT ?auto_794534 ?auto_794540 ) ( CLEAR ?auto_794534 ) ( IS-CRATE ?auto_794535 ) ( not ( = ?auto_794534 ?auto_794535 ) ) ( AVAILABLE ?auto_794539 ) ( ON ?auto_794534 ?auto_794533 ) ( not ( = ?auto_794533 ?auto_794534 ) ) ( not ( = ?auto_794533 ?auto_794535 ) ) ( TRUCK-AT ?auto_794538 ?auto_794536 ) ( not ( = ?auto_794536 ?auto_794540 ) ) ( HOIST-AT ?auto_794537 ?auto_794536 ) ( LIFTING ?auto_794537 ?auto_794535 ) ( not ( = ?auto_794539 ?auto_794537 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794534 ?auto_794535 )
      ( MAKE-2CRATE-VERIFY ?auto_794533 ?auto_794534 ?auto_794535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794541 - SURFACE
      ?auto_794542 - SURFACE
    )
    :vars
    (
      ?auto_794546 - HOIST
      ?auto_794545 - PLACE
      ?auto_794544 - SURFACE
      ?auto_794543 - TRUCK
      ?auto_794548 - PLACE
      ?auto_794547 - HOIST
      ?auto_794549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794546 ?auto_794545 ) ( SURFACE-AT ?auto_794541 ?auto_794545 ) ( CLEAR ?auto_794541 ) ( IS-CRATE ?auto_794542 ) ( not ( = ?auto_794541 ?auto_794542 ) ) ( AVAILABLE ?auto_794546 ) ( ON ?auto_794541 ?auto_794544 ) ( not ( = ?auto_794544 ?auto_794541 ) ) ( not ( = ?auto_794544 ?auto_794542 ) ) ( TRUCK-AT ?auto_794543 ?auto_794548 ) ( not ( = ?auto_794548 ?auto_794545 ) ) ( HOIST-AT ?auto_794547 ?auto_794548 ) ( not ( = ?auto_794546 ?auto_794547 ) ) ( AVAILABLE ?auto_794547 ) ( SURFACE-AT ?auto_794542 ?auto_794548 ) ( ON ?auto_794542 ?auto_794549 ) ( CLEAR ?auto_794542 ) ( not ( = ?auto_794541 ?auto_794549 ) ) ( not ( = ?auto_794542 ?auto_794549 ) ) ( not ( = ?auto_794544 ?auto_794549 ) ) )
    :subtasks
    ( ( !LIFT ?auto_794547 ?auto_794542 ?auto_794549 ?auto_794548 )
      ( MAKE-2CRATE ?auto_794544 ?auto_794541 ?auto_794542 )
      ( MAKE-1CRATE-VERIFY ?auto_794541 ?auto_794542 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794550 - SURFACE
      ?auto_794551 - SURFACE
      ?auto_794552 - SURFACE
    )
    :vars
    (
      ?auto_794555 - HOIST
      ?auto_794558 - PLACE
      ?auto_794554 - TRUCK
      ?auto_794557 - PLACE
      ?auto_794556 - HOIST
      ?auto_794553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794555 ?auto_794558 ) ( SURFACE-AT ?auto_794551 ?auto_794558 ) ( CLEAR ?auto_794551 ) ( IS-CRATE ?auto_794552 ) ( not ( = ?auto_794551 ?auto_794552 ) ) ( AVAILABLE ?auto_794555 ) ( ON ?auto_794551 ?auto_794550 ) ( not ( = ?auto_794550 ?auto_794551 ) ) ( not ( = ?auto_794550 ?auto_794552 ) ) ( TRUCK-AT ?auto_794554 ?auto_794557 ) ( not ( = ?auto_794557 ?auto_794558 ) ) ( HOIST-AT ?auto_794556 ?auto_794557 ) ( not ( = ?auto_794555 ?auto_794556 ) ) ( AVAILABLE ?auto_794556 ) ( SURFACE-AT ?auto_794552 ?auto_794557 ) ( ON ?auto_794552 ?auto_794553 ) ( CLEAR ?auto_794552 ) ( not ( = ?auto_794551 ?auto_794553 ) ) ( not ( = ?auto_794552 ?auto_794553 ) ) ( not ( = ?auto_794550 ?auto_794553 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794551 ?auto_794552 )
      ( MAKE-2CRATE-VERIFY ?auto_794550 ?auto_794551 ?auto_794552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794559 - SURFACE
      ?auto_794560 - SURFACE
    )
    :vars
    (
      ?auto_794565 - HOIST
      ?auto_794566 - PLACE
      ?auto_794567 - SURFACE
      ?auto_794564 - PLACE
      ?auto_794563 - HOIST
      ?auto_794561 - SURFACE
      ?auto_794562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794565 ?auto_794566 ) ( SURFACE-AT ?auto_794559 ?auto_794566 ) ( CLEAR ?auto_794559 ) ( IS-CRATE ?auto_794560 ) ( not ( = ?auto_794559 ?auto_794560 ) ) ( AVAILABLE ?auto_794565 ) ( ON ?auto_794559 ?auto_794567 ) ( not ( = ?auto_794567 ?auto_794559 ) ) ( not ( = ?auto_794567 ?auto_794560 ) ) ( not ( = ?auto_794564 ?auto_794566 ) ) ( HOIST-AT ?auto_794563 ?auto_794564 ) ( not ( = ?auto_794565 ?auto_794563 ) ) ( AVAILABLE ?auto_794563 ) ( SURFACE-AT ?auto_794560 ?auto_794564 ) ( ON ?auto_794560 ?auto_794561 ) ( CLEAR ?auto_794560 ) ( not ( = ?auto_794559 ?auto_794561 ) ) ( not ( = ?auto_794560 ?auto_794561 ) ) ( not ( = ?auto_794567 ?auto_794561 ) ) ( TRUCK-AT ?auto_794562 ?auto_794566 ) )
    :subtasks
    ( ( !DRIVE ?auto_794562 ?auto_794566 ?auto_794564 )
      ( MAKE-2CRATE ?auto_794567 ?auto_794559 ?auto_794560 )
      ( MAKE-1CRATE-VERIFY ?auto_794559 ?auto_794560 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794568 - SURFACE
      ?auto_794569 - SURFACE
      ?auto_794570 - SURFACE
    )
    :vars
    (
      ?auto_794576 - HOIST
      ?auto_794574 - PLACE
      ?auto_794572 - PLACE
      ?auto_794571 - HOIST
      ?auto_794575 - SURFACE
      ?auto_794573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794576 ?auto_794574 ) ( SURFACE-AT ?auto_794569 ?auto_794574 ) ( CLEAR ?auto_794569 ) ( IS-CRATE ?auto_794570 ) ( not ( = ?auto_794569 ?auto_794570 ) ) ( AVAILABLE ?auto_794576 ) ( ON ?auto_794569 ?auto_794568 ) ( not ( = ?auto_794568 ?auto_794569 ) ) ( not ( = ?auto_794568 ?auto_794570 ) ) ( not ( = ?auto_794572 ?auto_794574 ) ) ( HOIST-AT ?auto_794571 ?auto_794572 ) ( not ( = ?auto_794576 ?auto_794571 ) ) ( AVAILABLE ?auto_794571 ) ( SURFACE-AT ?auto_794570 ?auto_794572 ) ( ON ?auto_794570 ?auto_794575 ) ( CLEAR ?auto_794570 ) ( not ( = ?auto_794569 ?auto_794575 ) ) ( not ( = ?auto_794570 ?auto_794575 ) ) ( not ( = ?auto_794568 ?auto_794575 ) ) ( TRUCK-AT ?auto_794573 ?auto_794574 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794569 ?auto_794570 )
      ( MAKE-2CRATE-VERIFY ?auto_794568 ?auto_794569 ?auto_794570 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794577 - SURFACE
      ?auto_794578 - SURFACE
    )
    :vars
    (
      ?auto_794580 - HOIST
      ?auto_794581 - PLACE
      ?auto_794585 - SURFACE
      ?auto_794579 - PLACE
      ?auto_794583 - HOIST
      ?auto_794582 - SURFACE
      ?auto_794584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794580 ?auto_794581 ) ( IS-CRATE ?auto_794578 ) ( not ( = ?auto_794577 ?auto_794578 ) ) ( not ( = ?auto_794585 ?auto_794577 ) ) ( not ( = ?auto_794585 ?auto_794578 ) ) ( not ( = ?auto_794579 ?auto_794581 ) ) ( HOIST-AT ?auto_794583 ?auto_794579 ) ( not ( = ?auto_794580 ?auto_794583 ) ) ( AVAILABLE ?auto_794583 ) ( SURFACE-AT ?auto_794578 ?auto_794579 ) ( ON ?auto_794578 ?auto_794582 ) ( CLEAR ?auto_794578 ) ( not ( = ?auto_794577 ?auto_794582 ) ) ( not ( = ?auto_794578 ?auto_794582 ) ) ( not ( = ?auto_794585 ?auto_794582 ) ) ( TRUCK-AT ?auto_794584 ?auto_794581 ) ( SURFACE-AT ?auto_794585 ?auto_794581 ) ( CLEAR ?auto_794585 ) ( LIFTING ?auto_794580 ?auto_794577 ) ( IS-CRATE ?auto_794577 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794585 ?auto_794577 )
      ( MAKE-2CRATE ?auto_794585 ?auto_794577 ?auto_794578 )
      ( MAKE-1CRATE-VERIFY ?auto_794577 ?auto_794578 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794586 - SURFACE
      ?auto_794587 - SURFACE
      ?auto_794588 - SURFACE
    )
    :vars
    (
      ?auto_794589 - HOIST
      ?auto_794591 - PLACE
      ?auto_794592 - PLACE
      ?auto_794590 - HOIST
      ?auto_794593 - SURFACE
      ?auto_794594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794589 ?auto_794591 ) ( IS-CRATE ?auto_794588 ) ( not ( = ?auto_794587 ?auto_794588 ) ) ( not ( = ?auto_794586 ?auto_794587 ) ) ( not ( = ?auto_794586 ?auto_794588 ) ) ( not ( = ?auto_794592 ?auto_794591 ) ) ( HOIST-AT ?auto_794590 ?auto_794592 ) ( not ( = ?auto_794589 ?auto_794590 ) ) ( AVAILABLE ?auto_794590 ) ( SURFACE-AT ?auto_794588 ?auto_794592 ) ( ON ?auto_794588 ?auto_794593 ) ( CLEAR ?auto_794588 ) ( not ( = ?auto_794587 ?auto_794593 ) ) ( not ( = ?auto_794588 ?auto_794593 ) ) ( not ( = ?auto_794586 ?auto_794593 ) ) ( TRUCK-AT ?auto_794594 ?auto_794591 ) ( SURFACE-AT ?auto_794586 ?auto_794591 ) ( CLEAR ?auto_794586 ) ( LIFTING ?auto_794589 ?auto_794587 ) ( IS-CRATE ?auto_794587 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794587 ?auto_794588 )
      ( MAKE-2CRATE-VERIFY ?auto_794586 ?auto_794587 ?auto_794588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794595 - SURFACE
      ?auto_794596 - SURFACE
    )
    :vars
    (
      ?auto_794602 - HOIST
      ?auto_794603 - PLACE
      ?auto_794601 - SURFACE
      ?auto_794599 - PLACE
      ?auto_794598 - HOIST
      ?auto_794597 - SURFACE
      ?auto_794600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794602 ?auto_794603 ) ( IS-CRATE ?auto_794596 ) ( not ( = ?auto_794595 ?auto_794596 ) ) ( not ( = ?auto_794601 ?auto_794595 ) ) ( not ( = ?auto_794601 ?auto_794596 ) ) ( not ( = ?auto_794599 ?auto_794603 ) ) ( HOIST-AT ?auto_794598 ?auto_794599 ) ( not ( = ?auto_794602 ?auto_794598 ) ) ( AVAILABLE ?auto_794598 ) ( SURFACE-AT ?auto_794596 ?auto_794599 ) ( ON ?auto_794596 ?auto_794597 ) ( CLEAR ?auto_794596 ) ( not ( = ?auto_794595 ?auto_794597 ) ) ( not ( = ?auto_794596 ?auto_794597 ) ) ( not ( = ?auto_794601 ?auto_794597 ) ) ( TRUCK-AT ?auto_794600 ?auto_794603 ) ( SURFACE-AT ?auto_794601 ?auto_794603 ) ( CLEAR ?auto_794601 ) ( IS-CRATE ?auto_794595 ) ( AVAILABLE ?auto_794602 ) ( IN ?auto_794595 ?auto_794600 ) )
    :subtasks
    ( ( !UNLOAD ?auto_794602 ?auto_794595 ?auto_794600 ?auto_794603 )
      ( MAKE-2CRATE ?auto_794601 ?auto_794595 ?auto_794596 )
      ( MAKE-1CRATE-VERIFY ?auto_794595 ?auto_794596 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_794604 - SURFACE
      ?auto_794605 - SURFACE
      ?auto_794606 - SURFACE
    )
    :vars
    (
      ?auto_794609 - HOIST
      ?auto_794612 - PLACE
      ?auto_794610 - PLACE
      ?auto_794608 - HOIST
      ?auto_794611 - SURFACE
      ?auto_794607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794609 ?auto_794612 ) ( IS-CRATE ?auto_794606 ) ( not ( = ?auto_794605 ?auto_794606 ) ) ( not ( = ?auto_794604 ?auto_794605 ) ) ( not ( = ?auto_794604 ?auto_794606 ) ) ( not ( = ?auto_794610 ?auto_794612 ) ) ( HOIST-AT ?auto_794608 ?auto_794610 ) ( not ( = ?auto_794609 ?auto_794608 ) ) ( AVAILABLE ?auto_794608 ) ( SURFACE-AT ?auto_794606 ?auto_794610 ) ( ON ?auto_794606 ?auto_794611 ) ( CLEAR ?auto_794606 ) ( not ( = ?auto_794605 ?auto_794611 ) ) ( not ( = ?auto_794606 ?auto_794611 ) ) ( not ( = ?auto_794604 ?auto_794611 ) ) ( TRUCK-AT ?auto_794607 ?auto_794612 ) ( SURFACE-AT ?auto_794604 ?auto_794612 ) ( CLEAR ?auto_794604 ) ( IS-CRATE ?auto_794605 ) ( AVAILABLE ?auto_794609 ) ( IN ?auto_794605 ?auto_794607 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794605 ?auto_794606 )
      ( MAKE-2CRATE-VERIFY ?auto_794604 ?auto_794605 ?auto_794606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_794649 - SURFACE
      ?auto_794650 - SURFACE
    )
    :vars
    (
      ?auto_794657 - HOIST
      ?auto_794652 - PLACE
      ?auto_794654 - SURFACE
      ?auto_794655 - PLACE
      ?auto_794653 - HOIST
      ?auto_794651 - SURFACE
      ?auto_794656 - TRUCK
      ?auto_794658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794657 ?auto_794652 ) ( SURFACE-AT ?auto_794649 ?auto_794652 ) ( CLEAR ?auto_794649 ) ( IS-CRATE ?auto_794650 ) ( not ( = ?auto_794649 ?auto_794650 ) ) ( AVAILABLE ?auto_794657 ) ( ON ?auto_794649 ?auto_794654 ) ( not ( = ?auto_794654 ?auto_794649 ) ) ( not ( = ?auto_794654 ?auto_794650 ) ) ( not ( = ?auto_794655 ?auto_794652 ) ) ( HOIST-AT ?auto_794653 ?auto_794655 ) ( not ( = ?auto_794657 ?auto_794653 ) ) ( AVAILABLE ?auto_794653 ) ( SURFACE-AT ?auto_794650 ?auto_794655 ) ( ON ?auto_794650 ?auto_794651 ) ( CLEAR ?auto_794650 ) ( not ( = ?auto_794649 ?auto_794651 ) ) ( not ( = ?auto_794650 ?auto_794651 ) ) ( not ( = ?auto_794654 ?auto_794651 ) ) ( TRUCK-AT ?auto_794656 ?auto_794658 ) ( not ( = ?auto_794658 ?auto_794652 ) ) ( not ( = ?auto_794655 ?auto_794658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_794656 ?auto_794658 ?auto_794652 )
      ( MAKE-1CRATE ?auto_794649 ?auto_794650 )
      ( MAKE-1CRATE-VERIFY ?auto_794649 ?auto_794650 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794688 - SURFACE
      ?auto_794689 - SURFACE
      ?auto_794690 - SURFACE
      ?auto_794691 - SURFACE
    )
    :vars
    (
      ?auto_794692 - HOIST
      ?auto_794693 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794692 ?auto_794693 ) ( SURFACE-AT ?auto_794690 ?auto_794693 ) ( CLEAR ?auto_794690 ) ( LIFTING ?auto_794692 ?auto_794691 ) ( IS-CRATE ?auto_794691 ) ( not ( = ?auto_794690 ?auto_794691 ) ) ( ON ?auto_794689 ?auto_794688 ) ( ON ?auto_794690 ?auto_794689 ) ( not ( = ?auto_794688 ?auto_794689 ) ) ( not ( = ?auto_794688 ?auto_794690 ) ) ( not ( = ?auto_794688 ?auto_794691 ) ) ( not ( = ?auto_794689 ?auto_794690 ) ) ( not ( = ?auto_794689 ?auto_794691 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_794690 ?auto_794691 )
      ( MAKE-3CRATE-VERIFY ?auto_794688 ?auto_794689 ?auto_794690 ?auto_794691 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794705 - SURFACE
      ?auto_794706 - SURFACE
      ?auto_794707 - SURFACE
      ?auto_794708 - SURFACE
    )
    :vars
    (
      ?auto_794711 - HOIST
      ?auto_794709 - PLACE
      ?auto_794710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794711 ?auto_794709 ) ( SURFACE-AT ?auto_794707 ?auto_794709 ) ( CLEAR ?auto_794707 ) ( IS-CRATE ?auto_794708 ) ( not ( = ?auto_794707 ?auto_794708 ) ) ( TRUCK-AT ?auto_794710 ?auto_794709 ) ( AVAILABLE ?auto_794711 ) ( IN ?auto_794708 ?auto_794710 ) ( ON ?auto_794707 ?auto_794706 ) ( not ( = ?auto_794706 ?auto_794707 ) ) ( not ( = ?auto_794706 ?auto_794708 ) ) ( ON ?auto_794706 ?auto_794705 ) ( not ( = ?auto_794705 ?auto_794706 ) ) ( not ( = ?auto_794705 ?auto_794707 ) ) ( not ( = ?auto_794705 ?auto_794708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_794706 ?auto_794707 ?auto_794708 )
      ( MAKE-3CRATE-VERIFY ?auto_794705 ?auto_794706 ?auto_794707 ?auto_794708 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794726 - SURFACE
      ?auto_794727 - SURFACE
      ?auto_794728 - SURFACE
      ?auto_794729 - SURFACE
    )
    :vars
    (
      ?auto_794731 - HOIST
      ?auto_794730 - PLACE
      ?auto_794732 - TRUCK
      ?auto_794733 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794731 ?auto_794730 ) ( SURFACE-AT ?auto_794728 ?auto_794730 ) ( CLEAR ?auto_794728 ) ( IS-CRATE ?auto_794729 ) ( not ( = ?auto_794728 ?auto_794729 ) ) ( AVAILABLE ?auto_794731 ) ( IN ?auto_794729 ?auto_794732 ) ( ON ?auto_794728 ?auto_794727 ) ( not ( = ?auto_794727 ?auto_794728 ) ) ( not ( = ?auto_794727 ?auto_794729 ) ) ( TRUCK-AT ?auto_794732 ?auto_794733 ) ( not ( = ?auto_794733 ?auto_794730 ) ) ( ON ?auto_794727 ?auto_794726 ) ( not ( = ?auto_794726 ?auto_794727 ) ) ( not ( = ?auto_794726 ?auto_794728 ) ) ( not ( = ?auto_794726 ?auto_794729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_794727 ?auto_794728 ?auto_794729 )
      ( MAKE-3CRATE-VERIFY ?auto_794726 ?auto_794727 ?auto_794728 ?auto_794729 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794750 - SURFACE
      ?auto_794751 - SURFACE
      ?auto_794752 - SURFACE
      ?auto_794753 - SURFACE
    )
    :vars
    (
      ?auto_794756 - HOIST
      ?auto_794755 - PLACE
      ?auto_794754 - TRUCK
      ?auto_794757 - PLACE
      ?auto_794758 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794756 ?auto_794755 ) ( SURFACE-AT ?auto_794752 ?auto_794755 ) ( CLEAR ?auto_794752 ) ( IS-CRATE ?auto_794753 ) ( not ( = ?auto_794752 ?auto_794753 ) ) ( AVAILABLE ?auto_794756 ) ( ON ?auto_794752 ?auto_794751 ) ( not ( = ?auto_794751 ?auto_794752 ) ) ( not ( = ?auto_794751 ?auto_794753 ) ) ( TRUCK-AT ?auto_794754 ?auto_794757 ) ( not ( = ?auto_794757 ?auto_794755 ) ) ( HOIST-AT ?auto_794758 ?auto_794757 ) ( LIFTING ?auto_794758 ?auto_794753 ) ( not ( = ?auto_794756 ?auto_794758 ) ) ( ON ?auto_794751 ?auto_794750 ) ( not ( = ?auto_794750 ?auto_794751 ) ) ( not ( = ?auto_794750 ?auto_794752 ) ) ( not ( = ?auto_794750 ?auto_794753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_794751 ?auto_794752 ?auto_794753 )
      ( MAKE-3CRATE-VERIFY ?auto_794750 ?auto_794751 ?auto_794752 ?auto_794753 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794777 - SURFACE
      ?auto_794778 - SURFACE
      ?auto_794779 - SURFACE
      ?auto_794780 - SURFACE
    )
    :vars
    (
      ?auto_794783 - HOIST
      ?auto_794785 - PLACE
      ?auto_794784 - TRUCK
      ?auto_794786 - PLACE
      ?auto_794781 - HOIST
      ?auto_794782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_794783 ?auto_794785 ) ( SURFACE-AT ?auto_794779 ?auto_794785 ) ( CLEAR ?auto_794779 ) ( IS-CRATE ?auto_794780 ) ( not ( = ?auto_794779 ?auto_794780 ) ) ( AVAILABLE ?auto_794783 ) ( ON ?auto_794779 ?auto_794778 ) ( not ( = ?auto_794778 ?auto_794779 ) ) ( not ( = ?auto_794778 ?auto_794780 ) ) ( TRUCK-AT ?auto_794784 ?auto_794786 ) ( not ( = ?auto_794786 ?auto_794785 ) ) ( HOIST-AT ?auto_794781 ?auto_794786 ) ( not ( = ?auto_794783 ?auto_794781 ) ) ( AVAILABLE ?auto_794781 ) ( SURFACE-AT ?auto_794780 ?auto_794786 ) ( ON ?auto_794780 ?auto_794782 ) ( CLEAR ?auto_794780 ) ( not ( = ?auto_794779 ?auto_794782 ) ) ( not ( = ?auto_794780 ?auto_794782 ) ) ( not ( = ?auto_794778 ?auto_794782 ) ) ( ON ?auto_794778 ?auto_794777 ) ( not ( = ?auto_794777 ?auto_794778 ) ) ( not ( = ?auto_794777 ?auto_794779 ) ) ( not ( = ?auto_794777 ?auto_794780 ) ) ( not ( = ?auto_794777 ?auto_794782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_794778 ?auto_794779 ?auto_794780 )
      ( MAKE-3CRATE-VERIFY ?auto_794777 ?auto_794778 ?auto_794779 ?auto_794780 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794805 - SURFACE
      ?auto_794806 - SURFACE
      ?auto_794807 - SURFACE
      ?auto_794808 - SURFACE
    )
    :vars
    (
      ?auto_794809 - HOIST
      ?auto_794813 - PLACE
      ?auto_794810 - PLACE
      ?auto_794811 - HOIST
      ?auto_794814 - SURFACE
      ?auto_794812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794809 ?auto_794813 ) ( SURFACE-AT ?auto_794807 ?auto_794813 ) ( CLEAR ?auto_794807 ) ( IS-CRATE ?auto_794808 ) ( not ( = ?auto_794807 ?auto_794808 ) ) ( AVAILABLE ?auto_794809 ) ( ON ?auto_794807 ?auto_794806 ) ( not ( = ?auto_794806 ?auto_794807 ) ) ( not ( = ?auto_794806 ?auto_794808 ) ) ( not ( = ?auto_794810 ?auto_794813 ) ) ( HOIST-AT ?auto_794811 ?auto_794810 ) ( not ( = ?auto_794809 ?auto_794811 ) ) ( AVAILABLE ?auto_794811 ) ( SURFACE-AT ?auto_794808 ?auto_794810 ) ( ON ?auto_794808 ?auto_794814 ) ( CLEAR ?auto_794808 ) ( not ( = ?auto_794807 ?auto_794814 ) ) ( not ( = ?auto_794808 ?auto_794814 ) ) ( not ( = ?auto_794806 ?auto_794814 ) ) ( TRUCK-AT ?auto_794812 ?auto_794813 ) ( ON ?auto_794806 ?auto_794805 ) ( not ( = ?auto_794805 ?auto_794806 ) ) ( not ( = ?auto_794805 ?auto_794807 ) ) ( not ( = ?auto_794805 ?auto_794808 ) ) ( not ( = ?auto_794805 ?auto_794814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_794806 ?auto_794807 ?auto_794808 )
      ( MAKE-3CRATE-VERIFY ?auto_794805 ?auto_794806 ?auto_794807 ?auto_794808 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794833 - SURFACE
      ?auto_794834 - SURFACE
      ?auto_794835 - SURFACE
      ?auto_794836 - SURFACE
    )
    :vars
    (
      ?auto_794842 - HOIST
      ?auto_794838 - PLACE
      ?auto_794839 - PLACE
      ?auto_794841 - HOIST
      ?auto_794840 - SURFACE
      ?auto_794837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794842 ?auto_794838 ) ( IS-CRATE ?auto_794836 ) ( not ( = ?auto_794835 ?auto_794836 ) ) ( not ( = ?auto_794834 ?auto_794835 ) ) ( not ( = ?auto_794834 ?auto_794836 ) ) ( not ( = ?auto_794839 ?auto_794838 ) ) ( HOIST-AT ?auto_794841 ?auto_794839 ) ( not ( = ?auto_794842 ?auto_794841 ) ) ( AVAILABLE ?auto_794841 ) ( SURFACE-AT ?auto_794836 ?auto_794839 ) ( ON ?auto_794836 ?auto_794840 ) ( CLEAR ?auto_794836 ) ( not ( = ?auto_794835 ?auto_794840 ) ) ( not ( = ?auto_794836 ?auto_794840 ) ) ( not ( = ?auto_794834 ?auto_794840 ) ) ( TRUCK-AT ?auto_794837 ?auto_794838 ) ( SURFACE-AT ?auto_794834 ?auto_794838 ) ( CLEAR ?auto_794834 ) ( LIFTING ?auto_794842 ?auto_794835 ) ( IS-CRATE ?auto_794835 ) ( ON ?auto_794834 ?auto_794833 ) ( not ( = ?auto_794833 ?auto_794834 ) ) ( not ( = ?auto_794833 ?auto_794835 ) ) ( not ( = ?auto_794833 ?auto_794836 ) ) ( not ( = ?auto_794833 ?auto_794840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_794834 ?auto_794835 ?auto_794836 )
      ( MAKE-3CRATE-VERIFY ?auto_794833 ?auto_794834 ?auto_794835 ?auto_794836 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_794861 - SURFACE
      ?auto_794862 - SURFACE
      ?auto_794863 - SURFACE
      ?auto_794864 - SURFACE
    )
    :vars
    (
      ?auto_794868 - HOIST
      ?auto_794869 - PLACE
      ?auto_794866 - PLACE
      ?auto_794870 - HOIST
      ?auto_794867 - SURFACE
      ?auto_794865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_794868 ?auto_794869 ) ( IS-CRATE ?auto_794864 ) ( not ( = ?auto_794863 ?auto_794864 ) ) ( not ( = ?auto_794862 ?auto_794863 ) ) ( not ( = ?auto_794862 ?auto_794864 ) ) ( not ( = ?auto_794866 ?auto_794869 ) ) ( HOIST-AT ?auto_794870 ?auto_794866 ) ( not ( = ?auto_794868 ?auto_794870 ) ) ( AVAILABLE ?auto_794870 ) ( SURFACE-AT ?auto_794864 ?auto_794866 ) ( ON ?auto_794864 ?auto_794867 ) ( CLEAR ?auto_794864 ) ( not ( = ?auto_794863 ?auto_794867 ) ) ( not ( = ?auto_794864 ?auto_794867 ) ) ( not ( = ?auto_794862 ?auto_794867 ) ) ( TRUCK-AT ?auto_794865 ?auto_794869 ) ( SURFACE-AT ?auto_794862 ?auto_794869 ) ( CLEAR ?auto_794862 ) ( IS-CRATE ?auto_794863 ) ( AVAILABLE ?auto_794868 ) ( IN ?auto_794863 ?auto_794865 ) ( ON ?auto_794862 ?auto_794861 ) ( not ( = ?auto_794861 ?auto_794862 ) ) ( not ( = ?auto_794861 ?auto_794863 ) ) ( not ( = ?auto_794861 ?auto_794864 ) ) ( not ( = ?auto_794861 ?auto_794867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_794862 ?auto_794863 ?auto_794864 )
      ( MAKE-3CRATE-VERIFY ?auto_794861 ?auto_794862 ?auto_794863 ?auto_794864 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795046 - SURFACE
      ?auto_795047 - SURFACE
    )
    :vars
    (
      ?auto_795049 - HOIST
      ?auto_795050 - PLACE
      ?auto_795053 - SURFACE
      ?auto_795052 - TRUCK
      ?auto_795051 - PLACE
      ?auto_795054 - HOIST
      ?auto_795048 - SURFACE
      ?auto_795055 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795049 ?auto_795050 ) ( SURFACE-AT ?auto_795046 ?auto_795050 ) ( CLEAR ?auto_795046 ) ( IS-CRATE ?auto_795047 ) ( not ( = ?auto_795046 ?auto_795047 ) ) ( AVAILABLE ?auto_795049 ) ( ON ?auto_795046 ?auto_795053 ) ( not ( = ?auto_795053 ?auto_795046 ) ) ( not ( = ?auto_795053 ?auto_795047 ) ) ( TRUCK-AT ?auto_795052 ?auto_795051 ) ( not ( = ?auto_795051 ?auto_795050 ) ) ( HOIST-AT ?auto_795054 ?auto_795051 ) ( not ( = ?auto_795049 ?auto_795054 ) ) ( SURFACE-AT ?auto_795047 ?auto_795051 ) ( ON ?auto_795047 ?auto_795048 ) ( CLEAR ?auto_795047 ) ( not ( = ?auto_795046 ?auto_795048 ) ) ( not ( = ?auto_795047 ?auto_795048 ) ) ( not ( = ?auto_795053 ?auto_795048 ) ) ( LIFTING ?auto_795054 ?auto_795055 ) ( IS-CRATE ?auto_795055 ) ( not ( = ?auto_795046 ?auto_795055 ) ) ( not ( = ?auto_795047 ?auto_795055 ) ) ( not ( = ?auto_795053 ?auto_795055 ) ) ( not ( = ?auto_795048 ?auto_795055 ) ) )
    :subtasks
    ( ( !LOAD ?auto_795054 ?auto_795055 ?auto_795052 ?auto_795051 )
      ( MAKE-1CRATE ?auto_795046 ?auto_795047 )
      ( MAKE-1CRATE-VERIFY ?auto_795046 ?auto_795047 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795154 - SURFACE
      ?auto_795155 - SURFACE
      ?auto_795156 - SURFACE
      ?auto_795158 - SURFACE
      ?auto_795157 - SURFACE
    )
    :vars
    (
      ?auto_795160 - HOIST
      ?auto_795159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795160 ?auto_795159 ) ( SURFACE-AT ?auto_795158 ?auto_795159 ) ( CLEAR ?auto_795158 ) ( LIFTING ?auto_795160 ?auto_795157 ) ( IS-CRATE ?auto_795157 ) ( not ( = ?auto_795158 ?auto_795157 ) ) ( ON ?auto_795155 ?auto_795154 ) ( ON ?auto_795156 ?auto_795155 ) ( ON ?auto_795158 ?auto_795156 ) ( not ( = ?auto_795154 ?auto_795155 ) ) ( not ( = ?auto_795154 ?auto_795156 ) ) ( not ( = ?auto_795154 ?auto_795158 ) ) ( not ( = ?auto_795154 ?auto_795157 ) ) ( not ( = ?auto_795155 ?auto_795156 ) ) ( not ( = ?auto_795155 ?auto_795158 ) ) ( not ( = ?auto_795155 ?auto_795157 ) ) ( not ( = ?auto_795156 ?auto_795158 ) ) ( not ( = ?auto_795156 ?auto_795157 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_795158 ?auto_795157 )
      ( MAKE-4CRATE-VERIFY ?auto_795154 ?auto_795155 ?auto_795156 ?auto_795158 ?auto_795157 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795179 - SURFACE
      ?auto_795180 - SURFACE
      ?auto_795181 - SURFACE
      ?auto_795183 - SURFACE
      ?auto_795182 - SURFACE
    )
    :vars
    (
      ?auto_795185 - HOIST
      ?auto_795184 - PLACE
      ?auto_795186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795185 ?auto_795184 ) ( SURFACE-AT ?auto_795183 ?auto_795184 ) ( CLEAR ?auto_795183 ) ( IS-CRATE ?auto_795182 ) ( not ( = ?auto_795183 ?auto_795182 ) ) ( TRUCK-AT ?auto_795186 ?auto_795184 ) ( AVAILABLE ?auto_795185 ) ( IN ?auto_795182 ?auto_795186 ) ( ON ?auto_795183 ?auto_795181 ) ( not ( = ?auto_795181 ?auto_795183 ) ) ( not ( = ?auto_795181 ?auto_795182 ) ) ( ON ?auto_795180 ?auto_795179 ) ( ON ?auto_795181 ?auto_795180 ) ( not ( = ?auto_795179 ?auto_795180 ) ) ( not ( = ?auto_795179 ?auto_795181 ) ) ( not ( = ?auto_795179 ?auto_795183 ) ) ( not ( = ?auto_795179 ?auto_795182 ) ) ( not ( = ?auto_795180 ?auto_795181 ) ) ( not ( = ?auto_795180 ?auto_795183 ) ) ( not ( = ?auto_795180 ?auto_795182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795181 ?auto_795183 ?auto_795182 )
      ( MAKE-4CRATE-VERIFY ?auto_795179 ?auto_795180 ?auto_795181 ?auto_795183 ?auto_795182 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795209 - SURFACE
      ?auto_795210 - SURFACE
      ?auto_795211 - SURFACE
      ?auto_795213 - SURFACE
      ?auto_795212 - SURFACE
    )
    :vars
    (
      ?auto_795216 - HOIST
      ?auto_795214 - PLACE
      ?auto_795215 - TRUCK
      ?auto_795217 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795216 ?auto_795214 ) ( SURFACE-AT ?auto_795213 ?auto_795214 ) ( CLEAR ?auto_795213 ) ( IS-CRATE ?auto_795212 ) ( not ( = ?auto_795213 ?auto_795212 ) ) ( AVAILABLE ?auto_795216 ) ( IN ?auto_795212 ?auto_795215 ) ( ON ?auto_795213 ?auto_795211 ) ( not ( = ?auto_795211 ?auto_795213 ) ) ( not ( = ?auto_795211 ?auto_795212 ) ) ( TRUCK-AT ?auto_795215 ?auto_795217 ) ( not ( = ?auto_795217 ?auto_795214 ) ) ( ON ?auto_795210 ?auto_795209 ) ( ON ?auto_795211 ?auto_795210 ) ( not ( = ?auto_795209 ?auto_795210 ) ) ( not ( = ?auto_795209 ?auto_795211 ) ) ( not ( = ?auto_795209 ?auto_795213 ) ) ( not ( = ?auto_795209 ?auto_795212 ) ) ( not ( = ?auto_795210 ?auto_795211 ) ) ( not ( = ?auto_795210 ?auto_795213 ) ) ( not ( = ?auto_795210 ?auto_795212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795211 ?auto_795213 ?auto_795212 )
      ( MAKE-4CRATE-VERIFY ?auto_795209 ?auto_795210 ?auto_795211 ?auto_795213 ?auto_795212 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795243 - SURFACE
      ?auto_795244 - SURFACE
      ?auto_795245 - SURFACE
      ?auto_795247 - SURFACE
      ?auto_795246 - SURFACE
    )
    :vars
    (
      ?auto_795248 - HOIST
      ?auto_795251 - PLACE
      ?auto_795252 - TRUCK
      ?auto_795250 - PLACE
      ?auto_795249 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_795248 ?auto_795251 ) ( SURFACE-AT ?auto_795247 ?auto_795251 ) ( CLEAR ?auto_795247 ) ( IS-CRATE ?auto_795246 ) ( not ( = ?auto_795247 ?auto_795246 ) ) ( AVAILABLE ?auto_795248 ) ( ON ?auto_795247 ?auto_795245 ) ( not ( = ?auto_795245 ?auto_795247 ) ) ( not ( = ?auto_795245 ?auto_795246 ) ) ( TRUCK-AT ?auto_795252 ?auto_795250 ) ( not ( = ?auto_795250 ?auto_795251 ) ) ( HOIST-AT ?auto_795249 ?auto_795250 ) ( LIFTING ?auto_795249 ?auto_795246 ) ( not ( = ?auto_795248 ?auto_795249 ) ) ( ON ?auto_795244 ?auto_795243 ) ( ON ?auto_795245 ?auto_795244 ) ( not ( = ?auto_795243 ?auto_795244 ) ) ( not ( = ?auto_795243 ?auto_795245 ) ) ( not ( = ?auto_795243 ?auto_795247 ) ) ( not ( = ?auto_795243 ?auto_795246 ) ) ( not ( = ?auto_795244 ?auto_795245 ) ) ( not ( = ?auto_795244 ?auto_795247 ) ) ( not ( = ?auto_795244 ?auto_795246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795245 ?auto_795247 ?auto_795246 )
      ( MAKE-4CRATE-VERIFY ?auto_795243 ?auto_795244 ?auto_795245 ?auto_795247 ?auto_795246 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795281 - SURFACE
      ?auto_795282 - SURFACE
      ?auto_795283 - SURFACE
      ?auto_795285 - SURFACE
      ?auto_795284 - SURFACE
    )
    :vars
    (
      ?auto_795288 - HOIST
      ?auto_795291 - PLACE
      ?auto_795290 - TRUCK
      ?auto_795289 - PLACE
      ?auto_795286 - HOIST
      ?auto_795287 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795288 ?auto_795291 ) ( SURFACE-AT ?auto_795285 ?auto_795291 ) ( CLEAR ?auto_795285 ) ( IS-CRATE ?auto_795284 ) ( not ( = ?auto_795285 ?auto_795284 ) ) ( AVAILABLE ?auto_795288 ) ( ON ?auto_795285 ?auto_795283 ) ( not ( = ?auto_795283 ?auto_795285 ) ) ( not ( = ?auto_795283 ?auto_795284 ) ) ( TRUCK-AT ?auto_795290 ?auto_795289 ) ( not ( = ?auto_795289 ?auto_795291 ) ) ( HOIST-AT ?auto_795286 ?auto_795289 ) ( not ( = ?auto_795288 ?auto_795286 ) ) ( AVAILABLE ?auto_795286 ) ( SURFACE-AT ?auto_795284 ?auto_795289 ) ( ON ?auto_795284 ?auto_795287 ) ( CLEAR ?auto_795284 ) ( not ( = ?auto_795285 ?auto_795287 ) ) ( not ( = ?auto_795284 ?auto_795287 ) ) ( not ( = ?auto_795283 ?auto_795287 ) ) ( ON ?auto_795282 ?auto_795281 ) ( ON ?auto_795283 ?auto_795282 ) ( not ( = ?auto_795281 ?auto_795282 ) ) ( not ( = ?auto_795281 ?auto_795283 ) ) ( not ( = ?auto_795281 ?auto_795285 ) ) ( not ( = ?auto_795281 ?auto_795284 ) ) ( not ( = ?auto_795281 ?auto_795287 ) ) ( not ( = ?auto_795282 ?auto_795283 ) ) ( not ( = ?auto_795282 ?auto_795285 ) ) ( not ( = ?auto_795282 ?auto_795284 ) ) ( not ( = ?auto_795282 ?auto_795287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795283 ?auto_795285 ?auto_795284 )
      ( MAKE-4CRATE-VERIFY ?auto_795281 ?auto_795282 ?auto_795283 ?auto_795285 ?auto_795284 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795320 - SURFACE
      ?auto_795321 - SURFACE
      ?auto_795322 - SURFACE
      ?auto_795324 - SURFACE
      ?auto_795323 - SURFACE
    )
    :vars
    (
      ?auto_795329 - HOIST
      ?auto_795325 - PLACE
      ?auto_795327 - PLACE
      ?auto_795328 - HOIST
      ?auto_795330 - SURFACE
      ?auto_795326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795329 ?auto_795325 ) ( SURFACE-AT ?auto_795324 ?auto_795325 ) ( CLEAR ?auto_795324 ) ( IS-CRATE ?auto_795323 ) ( not ( = ?auto_795324 ?auto_795323 ) ) ( AVAILABLE ?auto_795329 ) ( ON ?auto_795324 ?auto_795322 ) ( not ( = ?auto_795322 ?auto_795324 ) ) ( not ( = ?auto_795322 ?auto_795323 ) ) ( not ( = ?auto_795327 ?auto_795325 ) ) ( HOIST-AT ?auto_795328 ?auto_795327 ) ( not ( = ?auto_795329 ?auto_795328 ) ) ( AVAILABLE ?auto_795328 ) ( SURFACE-AT ?auto_795323 ?auto_795327 ) ( ON ?auto_795323 ?auto_795330 ) ( CLEAR ?auto_795323 ) ( not ( = ?auto_795324 ?auto_795330 ) ) ( not ( = ?auto_795323 ?auto_795330 ) ) ( not ( = ?auto_795322 ?auto_795330 ) ) ( TRUCK-AT ?auto_795326 ?auto_795325 ) ( ON ?auto_795321 ?auto_795320 ) ( ON ?auto_795322 ?auto_795321 ) ( not ( = ?auto_795320 ?auto_795321 ) ) ( not ( = ?auto_795320 ?auto_795322 ) ) ( not ( = ?auto_795320 ?auto_795324 ) ) ( not ( = ?auto_795320 ?auto_795323 ) ) ( not ( = ?auto_795320 ?auto_795330 ) ) ( not ( = ?auto_795321 ?auto_795322 ) ) ( not ( = ?auto_795321 ?auto_795324 ) ) ( not ( = ?auto_795321 ?auto_795323 ) ) ( not ( = ?auto_795321 ?auto_795330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795322 ?auto_795324 ?auto_795323 )
      ( MAKE-4CRATE-VERIFY ?auto_795320 ?auto_795321 ?auto_795322 ?auto_795324 ?auto_795323 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795359 - SURFACE
      ?auto_795360 - SURFACE
      ?auto_795361 - SURFACE
      ?auto_795363 - SURFACE
      ?auto_795362 - SURFACE
    )
    :vars
    (
      ?auto_795368 - HOIST
      ?auto_795364 - PLACE
      ?auto_795365 - PLACE
      ?auto_795369 - HOIST
      ?auto_795367 - SURFACE
      ?auto_795366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795368 ?auto_795364 ) ( IS-CRATE ?auto_795362 ) ( not ( = ?auto_795363 ?auto_795362 ) ) ( not ( = ?auto_795361 ?auto_795363 ) ) ( not ( = ?auto_795361 ?auto_795362 ) ) ( not ( = ?auto_795365 ?auto_795364 ) ) ( HOIST-AT ?auto_795369 ?auto_795365 ) ( not ( = ?auto_795368 ?auto_795369 ) ) ( AVAILABLE ?auto_795369 ) ( SURFACE-AT ?auto_795362 ?auto_795365 ) ( ON ?auto_795362 ?auto_795367 ) ( CLEAR ?auto_795362 ) ( not ( = ?auto_795363 ?auto_795367 ) ) ( not ( = ?auto_795362 ?auto_795367 ) ) ( not ( = ?auto_795361 ?auto_795367 ) ) ( TRUCK-AT ?auto_795366 ?auto_795364 ) ( SURFACE-AT ?auto_795361 ?auto_795364 ) ( CLEAR ?auto_795361 ) ( LIFTING ?auto_795368 ?auto_795363 ) ( IS-CRATE ?auto_795363 ) ( ON ?auto_795360 ?auto_795359 ) ( ON ?auto_795361 ?auto_795360 ) ( not ( = ?auto_795359 ?auto_795360 ) ) ( not ( = ?auto_795359 ?auto_795361 ) ) ( not ( = ?auto_795359 ?auto_795363 ) ) ( not ( = ?auto_795359 ?auto_795362 ) ) ( not ( = ?auto_795359 ?auto_795367 ) ) ( not ( = ?auto_795360 ?auto_795361 ) ) ( not ( = ?auto_795360 ?auto_795363 ) ) ( not ( = ?auto_795360 ?auto_795362 ) ) ( not ( = ?auto_795360 ?auto_795367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795361 ?auto_795363 ?auto_795362 )
      ( MAKE-4CRATE-VERIFY ?auto_795359 ?auto_795360 ?auto_795361 ?auto_795363 ?auto_795362 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_795398 - SURFACE
      ?auto_795399 - SURFACE
      ?auto_795400 - SURFACE
      ?auto_795402 - SURFACE
      ?auto_795401 - SURFACE
    )
    :vars
    (
      ?auto_795405 - HOIST
      ?auto_795407 - PLACE
      ?auto_795406 - PLACE
      ?auto_795403 - HOIST
      ?auto_795408 - SURFACE
      ?auto_795404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_795405 ?auto_795407 ) ( IS-CRATE ?auto_795401 ) ( not ( = ?auto_795402 ?auto_795401 ) ) ( not ( = ?auto_795400 ?auto_795402 ) ) ( not ( = ?auto_795400 ?auto_795401 ) ) ( not ( = ?auto_795406 ?auto_795407 ) ) ( HOIST-AT ?auto_795403 ?auto_795406 ) ( not ( = ?auto_795405 ?auto_795403 ) ) ( AVAILABLE ?auto_795403 ) ( SURFACE-AT ?auto_795401 ?auto_795406 ) ( ON ?auto_795401 ?auto_795408 ) ( CLEAR ?auto_795401 ) ( not ( = ?auto_795402 ?auto_795408 ) ) ( not ( = ?auto_795401 ?auto_795408 ) ) ( not ( = ?auto_795400 ?auto_795408 ) ) ( TRUCK-AT ?auto_795404 ?auto_795407 ) ( SURFACE-AT ?auto_795400 ?auto_795407 ) ( CLEAR ?auto_795400 ) ( IS-CRATE ?auto_795402 ) ( AVAILABLE ?auto_795405 ) ( IN ?auto_795402 ?auto_795404 ) ( ON ?auto_795399 ?auto_795398 ) ( ON ?auto_795400 ?auto_795399 ) ( not ( = ?auto_795398 ?auto_795399 ) ) ( not ( = ?auto_795398 ?auto_795400 ) ) ( not ( = ?auto_795398 ?auto_795402 ) ) ( not ( = ?auto_795398 ?auto_795401 ) ) ( not ( = ?auto_795398 ?auto_795408 ) ) ( not ( = ?auto_795399 ?auto_795400 ) ) ( not ( = ?auto_795399 ?auto_795402 ) ) ( not ( = ?auto_795399 ?auto_795401 ) ) ( not ( = ?auto_795399 ?auto_795408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_795400 ?auto_795402 ?auto_795401 )
      ( MAKE-4CRATE-VERIFY ?auto_795398 ?auto_795399 ?auto_795400 ?auto_795402 ?auto_795401 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_795899 - SURFACE
      ?auto_795900 - SURFACE
    )
    :vars
    (
      ?auto_795901 - HOIST
      ?auto_795905 - PLACE
      ?auto_795907 - SURFACE
      ?auto_795902 - PLACE
      ?auto_795904 - HOIST
      ?auto_795906 - SURFACE
      ?auto_795903 - TRUCK
      ?auto_795908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795901 ?auto_795905 ) ( SURFACE-AT ?auto_795899 ?auto_795905 ) ( CLEAR ?auto_795899 ) ( IS-CRATE ?auto_795900 ) ( not ( = ?auto_795899 ?auto_795900 ) ) ( ON ?auto_795899 ?auto_795907 ) ( not ( = ?auto_795907 ?auto_795899 ) ) ( not ( = ?auto_795907 ?auto_795900 ) ) ( not ( = ?auto_795902 ?auto_795905 ) ) ( HOIST-AT ?auto_795904 ?auto_795902 ) ( not ( = ?auto_795901 ?auto_795904 ) ) ( AVAILABLE ?auto_795904 ) ( SURFACE-AT ?auto_795900 ?auto_795902 ) ( ON ?auto_795900 ?auto_795906 ) ( CLEAR ?auto_795900 ) ( not ( = ?auto_795899 ?auto_795906 ) ) ( not ( = ?auto_795900 ?auto_795906 ) ) ( not ( = ?auto_795907 ?auto_795906 ) ) ( TRUCK-AT ?auto_795903 ?auto_795905 ) ( LIFTING ?auto_795901 ?auto_795908 ) ( IS-CRATE ?auto_795908 ) ( not ( = ?auto_795899 ?auto_795908 ) ) ( not ( = ?auto_795900 ?auto_795908 ) ) ( not ( = ?auto_795907 ?auto_795908 ) ) ( not ( = ?auto_795906 ?auto_795908 ) ) )
    :subtasks
    ( ( !LOAD ?auto_795901 ?auto_795908 ?auto_795903 ?auto_795905 )
      ( MAKE-1CRATE ?auto_795899 ?auto_795900 )
      ( MAKE-1CRATE-VERIFY ?auto_795899 ?auto_795900 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796058 - SURFACE
      ?auto_796059 - SURFACE
      ?auto_796060 - SURFACE
      ?auto_796062 - SURFACE
      ?auto_796061 - SURFACE
      ?auto_796063 - SURFACE
    )
    :vars
    (
      ?auto_796065 - HOIST
      ?auto_796064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796065 ?auto_796064 ) ( SURFACE-AT ?auto_796061 ?auto_796064 ) ( CLEAR ?auto_796061 ) ( LIFTING ?auto_796065 ?auto_796063 ) ( IS-CRATE ?auto_796063 ) ( not ( = ?auto_796061 ?auto_796063 ) ) ( ON ?auto_796059 ?auto_796058 ) ( ON ?auto_796060 ?auto_796059 ) ( ON ?auto_796062 ?auto_796060 ) ( ON ?auto_796061 ?auto_796062 ) ( not ( = ?auto_796058 ?auto_796059 ) ) ( not ( = ?auto_796058 ?auto_796060 ) ) ( not ( = ?auto_796058 ?auto_796062 ) ) ( not ( = ?auto_796058 ?auto_796061 ) ) ( not ( = ?auto_796058 ?auto_796063 ) ) ( not ( = ?auto_796059 ?auto_796060 ) ) ( not ( = ?auto_796059 ?auto_796062 ) ) ( not ( = ?auto_796059 ?auto_796061 ) ) ( not ( = ?auto_796059 ?auto_796063 ) ) ( not ( = ?auto_796060 ?auto_796062 ) ) ( not ( = ?auto_796060 ?auto_796061 ) ) ( not ( = ?auto_796060 ?auto_796063 ) ) ( not ( = ?auto_796062 ?auto_796061 ) ) ( not ( = ?auto_796062 ?auto_796063 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_796061 ?auto_796063 )
      ( MAKE-5CRATE-VERIFY ?auto_796058 ?auto_796059 ?auto_796060 ?auto_796062 ?auto_796061 ?auto_796063 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796092 - SURFACE
      ?auto_796093 - SURFACE
      ?auto_796094 - SURFACE
      ?auto_796096 - SURFACE
      ?auto_796095 - SURFACE
      ?auto_796097 - SURFACE
    )
    :vars
    (
      ?auto_796099 - HOIST
      ?auto_796098 - PLACE
      ?auto_796100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796099 ?auto_796098 ) ( SURFACE-AT ?auto_796095 ?auto_796098 ) ( CLEAR ?auto_796095 ) ( IS-CRATE ?auto_796097 ) ( not ( = ?auto_796095 ?auto_796097 ) ) ( TRUCK-AT ?auto_796100 ?auto_796098 ) ( AVAILABLE ?auto_796099 ) ( IN ?auto_796097 ?auto_796100 ) ( ON ?auto_796095 ?auto_796096 ) ( not ( = ?auto_796096 ?auto_796095 ) ) ( not ( = ?auto_796096 ?auto_796097 ) ) ( ON ?auto_796093 ?auto_796092 ) ( ON ?auto_796094 ?auto_796093 ) ( ON ?auto_796096 ?auto_796094 ) ( not ( = ?auto_796092 ?auto_796093 ) ) ( not ( = ?auto_796092 ?auto_796094 ) ) ( not ( = ?auto_796092 ?auto_796096 ) ) ( not ( = ?auto_796092 ?auto_796095 ) ) ( not ( = ?auto_796092 ?auto_796097 ) ) ( not ( = ?auto_796093 ?auto_796094 ) ) ( not ( = ?auto_796093 ?auto_796096 ) ) ( not ( = ?auto_796093 ?auto_796095 ) ) ( not ( = ?auto_796093 ?auto_796097 ) ) ( not ( = ?auto_796094 ?auto_796096 ) ) ( not ( = ?auto_796094 ?auto_796095 ) ) ( not ( = ?auto_796094 ?auto_796097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796096 ?auto_796095 ?auto_796097 )
      ( MAKE-5CRATE-VERIFY ?auto_796092 ?auto_796093 ?auto_796094 ?auto_796096 ?auto_796095 ?auto_796097 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796132 - SURFACE
      ?auto_796133 - SURFACE
      ?auto_796134 - SURFACE
      ?auto_796136 - SURFACE
      ?auto_796135 - SURFACE
      ?auto_796137 - SURFACE
    )
    :vars
    (
      ?auto_796139 - HOIST
      ?auto_796141 - PLACE
      ?auto_796140 - TRUCK
      ?auto_796138 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796139 ?auto_796141 ) ( SURFACE-AT ?auto_796135 ?auto_796141 ) ( CLEAR ?auto_796135 ) ( IS-CRATE ?auto_796137 ) ( not ( = ?auto_796135 ?auto_796137 ) ) ( AVAILABLE ?auto_796139 ) ( IN ?auto_796137 ?auto_796140 ) ( ON ?auto_796135 ?auto_796136 ) ( not ( = ?auto_796136 ?auto_796135 ) ) ( not ( = ?auto_796136 ?auto_796137 ) ) ( TRUCK-AT ?auto_796140 ?auto_796138 ) ( not ( = ?auto_796138 ?auto_796141 ) ) ( ON ?auto_796133 ?auto_796132 ) ( ON ?auto_796134 ?auto_796133 ) ( ON ?auto_796136 ?auto_796134 ) ( not ( = ?auto_796132 ?auto_796133 ) ) ( not ( = ?auto_796132 ?auto_796134 ) ) ( not ( = ?auto_796132 ?auto_796136 ) ) ( not ( = ?auto_796132 ?auto_796135 ) ) ( not ( = ?auto_796132 ?auto_796137 ) ) ( not ( = ?auto_796133 ?auto_796134 ) ) ( not ( = ?auto_796133 ?auto_796136 ) ) ( not ( = ?auto_796133 ?auto_796135 ) ) ( not ( = ?auto_796133 ?auto_796137 ) ) ( not ( = ?auto_796134 ?auto_796136 ) ) ( not ( = ?auto_796134 ?auto_796135 ) ) ( not ( = ?auto_796134 ?auto_796137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796136 ?auto_796135 ?auto_796137 )
      ( MAKE-5CRATE-VERIFY ?auto_796132 ?auto_796133 ?auto_796134 ?auto_796136 ?auto_796135 ?auto_796137 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796177 - SURFACE
      ?auto_796178 - SURFACE
      ?auto_796179 - SURFACE
      ?auto_796181 - SURFACE
      ?auto_796180 - SURFACE
      ?auto_796182 - SURFACE
    )
    :vars
    (
      ?auto_796187 - HOIST
      ?auto_796183 - PLACE
      ?auto_796186 - TRUCK
      ?auto_796185 - PLACE
      ?auto_796184 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_796187 ?auto_796183 ) ( SURFACE-AT ?auto_796180 ?auto_796183 ) ( CLEAR ?auto_796180 ) ( IS-CRATE ?auto_796182 ) ( not ( = ?auto_796180 ?auto_796182 ) ) ( AVAILABLE ?auto_796187 ) ( ON ?auto_796180 ?auto_796181 ) ( not ( = ?auto_796181 ?auto_796180 ) ) ( not ( = ?auto_796181 ?auto_796182 ) ) ( TRUCK-AT ?auto_796186 ?auto_796185 ) ( not ( = ?auto_796185 ?auto_796183 ) ) ( HOIST-AT ?auto_796184 ?auto_796185 ) ( LIFTING ?auto_796184 ?auto_796182 ) ( not ( = ?auto_796187 ?auto_796184 ) ) ( ON ?auto_796178 ?auto_796177 ) ( ON ?auto_796179 ?auto_796178 ) ( ON ?auto_796181 ?auto_796179 ) ( not ( = ?auto_796177 ?auto_796178 ) ) ( not ( = ?auto_796177 ?auto_796179 ) ) ( not ( = ?auto_796177 ?auto_796181 ) ) ( not ( = ?auto_796177 ?auto_796180 ) ) ( not ( = ?auto_796177 ?auto_796182 ) ) ( not ( = ?auto_796178 ?auto_796179 ) ) ( not ( = ?auto_796178 ?auto_796181 ) ) ( not ( = ?auto_796178 ?auto_796180 ) ) ( not ( = ?auto_796178 ?auto_796182 ) ) ( not ( = ?auto_796179 ?auto_796181 ) ) ( not ( = ?auto_796179 ?auto_796180 ) ) ( not ( = ?auto_796179 ?auto_796182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796181 ?auto_796180 ?auto_796182 )
      ( MAKE-5CRATE-VERIFY ?auto_796177 ?auto_796178 ?auto_796179 ?auto_796181 ?auto_796180 ?auto_796182 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796227 - SURFACE
      ?auto_796228 - SURFACE
      ?auto_796229 - SURFACE
      ?auto_796231 - SURFACE
      ?auto_796230 - SURFACE
      ?auto_796232 - SURFACE
    )
    :vars
    (
      ?auto_796234 - HOIST
      ?auto_796235 - PLACE
      ?auto_796233 - TRUCK
      ?auto_796238 - PLACE
      ?auto_796237 - HOIST
      ?auto_796236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796234 ?auto_796235 ) ( SURFACE-AT ?auto_796230 ?auto_796235 ) ( CLEAR ?auto_796230 ) ( IS-CRATE ?auto_796232 ) ( not ( = ?auto_796230 ?auto_796232 ) ) ( AVAILABLE ?auto_796234 ) ( ON ?auto_796230 ?auto_796231 ) ( not ( = ?auto_796231 ?auto_796230 ) ) ( not ( = ?auto_796231 ?auto_796232 ) ) ( TRUCK-AT ?auto_796233 ?auto_796238 ) ( not ( = ?auto_796238 ?auto_796235 ) ) ( HOIST-AT ?auto_796237 ?auto_796238 ) ( not ( = ?auto_796234 ?auto_796237 ) ) ( AVAILABLE ?auto_796237 ) ( SURFACE-AT ?auto_796232 ?auto_796238 ) ( ON ?auto_796232 ?auto_796236 ) ( CLEAR ?auto_796232 ) ( not ( = ?auto_796230 ?auto_796236 ) ) ( not ( = ?auto_796232 ?auto_796236 ) ) ( not ( = ?auto_796231 ?auto_796236 ) ) ( ON ?auto_796228 ?auto_796227 ) ( ON ?auto_796229 ?auto_796228 ) ( ON ?auto_796231 ?auto_796229 ) ( not ( = ?auto_796227 ?auto_796228 ) ) ( not ( = ?auto_796227 ?auto_796229 ) ) ( not ( = ?auto_796227 ?auto_796231 ) ) ( not ( = ?auto_796227 ?auto_796230 ) ) ( not ( = ?auto_796227 ?auto_796232 ) ) ( not ( = ?auto_796227 ?auto_796236 ) ) ( not ( = ?auto_796228 ?auto_796229 ) ) ( not ( = ?auto_796228 ?auto_796231 ) ) ( not ( = ?auto_796228 ?auto_796230 ) ) ( not ( = ?auto_796228 ?auto_796232 ) ) ( not ( = ?auto_796228 ?auto_796236 ) ) ( not ( = ?auto_796229 ?auto_796231 ) ) ( not ( = ?auto_796229 ?auto_796230 ) ) ( not ( = ?auto_796229 ?auto_796232 ) ) ( not ( = ?auto_796229 ?auto_796236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796231 ?auto_796230 ?auto_796232 )
      ( MAKE-5CRATE-VERIFY ?auto_796227 ?auto_796228 ?auto_796229 ?auto_796231 ?auto_796230 ?auto_796232 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796278 - SURFACE
      ?auto_796279 - SURFACE
      ?auto_796280 - SURFACE
      ?auto_796282 - SURFACE
      ?auto_796281 - SURFACE
      ?auto_796283 - SURFACE
    )
    :vars
    (
      ?auto_796286 - HOIST
      ?auto_796288 - PLACE
      ?auto_796287 - PLACE
      ?auto_796285 - HOIST
      ?auto_796284 - SURFACE
      ?auto_796289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796286 ?auto_796288 ) ( SURFACE-AT ?auto_796281 ?auto_796288 ) ( CLEAR ?auto_796281 ) ( IS-CRATE ?auto_796283 ) ( not ( = ?auto_796281 ?auto_796283 ) ) ( AVAILABLE ?auto_796286 ) ( ON ?auto_796281 ?auto_796282 ) ( not ( = ?auto_796282 ?auto_796281 ) ) ( not ( = ?auto_796282 ?auto_796283 ) ) ( not ( = ?auto_796287 ?auto_796288 ) ) ( HOIST-AT ?auto_796285 ?auto_796287 ) ( not ( = ?auto_796286 ?auto_796285 ) ) ( AVAILABLE ?auto_796285 ) ( SURFACE-AT ?auto_796283 ?auto_796287 ) ( ON ?auto_796283 ?auto_796284 ) ( CLEAR ?auto_796283 ) ( not ( = ?auto_796281 ?auto_796284 ) ) ( not ( = ?auto_796283 ?auto_796284 ) ) ( not ( = ?auto_796282 ?auto_796284 ) ) ( TRUCK-AT ?auto_796289 ?auto_796288 ) ( ON ?auto_796279 ?auto_796278 ) ( ON ?auto_796280 ?auto_796279 ) ( ON ?auto_796282 ?auto_796280 ) ( not ( = ?auto_796278 ?auto_796279 ) ) ( not ( = ?auto_796278 ?auto_796280 ) ) ( not ( = ?auto_796278 ?auto_796282 ) ) ( not ( = ?auto_796278 ?auto_796281 ) ) ( not ( = ?auto_796278 ?auto_796283 ) ) ( not ( = ?auto_796278 ?auto_796284 ) ) ( not ( = ?auto_796279 ?auto_796280 ) ) ( not ( = ?auto_796279 ?auto_796282 ) ) ( not ( = ?auto_796279 ?auto_796281 ) ) ( not ( = ?auto_796279 ?auto_796283 ) ) ( not ( = ?auto_796279 ?auto_796284 ) ) ( not ( = ?auto_796280 ?auto_796282 ) ) ( not ( = ?auto_796280 ?auto_796281 ) ) ( not ( = ?auto_796280 ?auto_796283 ) ) ( not ( = ?auto_796280 ?auto_796284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796282 ?auto_796281 ?auto_796283 )
      ( MAKE-5CRATE-VERIFY ?auto_796278 ?auto_796279 ?auto_796280 ?auto_796282 ?auto_796281 ?auto_796283 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796329 - SURFACE
      ?auto_796330 - SURFACE
      ?auto_796331 - SURFACE
      ?auto_796333 - SURFACE
      ?auto_796332 - SURFACE
      ?auto_796334 - SURFACE
    )
    :vars
    (
      ?auto_796339 - HOIST
      ?auto_796340 - PLACE
      ?auto_796335 - PLACE
      ?auto_796338 - HOIST
      ?auto_796336 - SURFACE
      ?auto_796337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796339 ?auto_796340 ) ( IS-CRATE ?auto_796334 ) ( not ( = ?auto_796332 ?auto_796334 ) ) ( not ( = ?auto_796333 ?auto_796332 ) ) ( not ( = ?auto_796333 ?auto_796334 ) ) ( not ( = ?auto_796335 ?auto_796340 ) ) ( HOIST-AT ?auto_796338 ?auto_796335 ) ( not ( = ?auto_796339 ?auto_796338 ) ) ( AVAILABLE ?auto_796338 ) ( SURFACE-AT ?auto_796334 ?auto_796335 ) ( ON ?auto_796334 ?auto_796336 ) ( CLEAR ?auto_796334 ) ( not ( = ?auto_796332 ?auto_796336 ) ) ( not ( = ?auto_796334 ?auto_796336 ) ) ( not ( = ?auto_796333 ?auto_796336 ) ) ( TRUCK-AT ?auto_796337 ?auto_796340 ) ( SURFACE-AT ?auto_796333 ?auto_796340 ) ( CLEAR ?auto_796333 ) ( LIFTING ?auto_796339 ?auto_796332 ) ( IS-CRATE ?auto_796332 ) ( ON ?auto_796330 ?auto_796329 ) ( ON ?auto_796331 ?auto_796330 ) ( ON ?auto_796333 ?auto_796331 ) ( not ( = ?auto_796329 ?auto_796330 ) ) ( not ( = ?auto_796329 ?auto_796331 ) ) ( not ( = ?auto_796329 ?auto_796333 ) ) ( not ( = ?auto_796329 ?auto_796332 ) ) ( not ( = ?auto_796329 ?auto_796334 ) ) ( not ( = ?auto_796329 ?auto_796336 ) ) ( not ( = ?auto_796330 ?auto_796331 ) ) ( not ( = ?auto_796330 ?auto_796333 ) ) ( not ( = ?auto_796330 ?auto_796332 ) ) ( not ( = ?auto_796330 ?auto_796334 ) ) ( not ( = ?auto_796330 ?auto_796336 ) ) ( not ( = ?auto_796331 ?auto_796333 ) ) ( not ( = ?auto_796331 ?auto_796332 ) ) ( not ( = ?auto_796331 ?auto_796334 ) ) ( not ( = ?auto_796331 ?auto_796336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796333 ?auto_796332 ?auto_796334 )
      ( MAKE-5CRATE-VERIFY ?auto_796329 ?auto_796330 ?auto_796331 ?auto_796333 ?auto_796332 ?auto_796334 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_796380 - SURFACE
      ?auto_796381 - SURFACE
      ?auto_796382 - SURFACE
      ?auto_796384 - SURFACE
      ?auto_796383 - SURFACE
      ?auto_796385 - SURFACE
    )
    :vars
    (
      ?auto_796390 - HOIST
      ?auto_796386 - PLACE
      ?auto_796387 - PLACE
      ?auto_796389 - HOIST
      ?auto_796391 - SURFACE
      ?auto_796388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796390 ?auto_796386 ) ( IS-CRATE ?auto_796385 ) ( not ( = ?auto_796383 ?auto_796385 ) ) ( not ( = ?auto_796384 ?auto_796383 ) ) ( not ( = ?auto_796384 ?auto_796385 ) ) ( not ( = ?auto_796387 ?auto_796386 ) ) ( HOIST-AT ?auto_796389 ?auto_796387 ) ( not ( = ?auto_796390 ?auto_796389 ) ) ( AVAILABLE ?auto_796389 ) ( SURFACE-AT ?auto_796385 ?auto_796387 ) ( ON ?auto_796385 ?auto_796391 ) ( CLEAR ?auto_796385 ) ( not ( = ?auto_796383 ?auto_796391 ) ) ( not ( = ?auto_796385 ?auto_796391 ) ) ( not ( = ?auto_796384 ?auto_796391 ) ) ( TRUCK-AT ?auto_796388 ?auto_796386 ) ( SURFACE-AT ?auto_796384 ?auto_796386 ) ( CLEAR ?auto_796384 ) ( IS-CRATE ?auto_796383 ) ( AVAILABLE ?auto_796390 ) ( IN ?auto_796383 ?auto_796388 ) ( ON ?auto_796381 ?auto_796380 ) ( ON ?auto_796382 ?auto_796381 ) ( ON ?auto_796384 ?auto_796382 ) ( not ( = ?auto_796380 ?auto_796381 ) ) ( not ( = ?auto_796380 ?auto_796382 ) ) ( not ( = ?auto_796380 ?auto_796384 ) ) ( not ( = ?auto_796380 ?auto_796383 ) ) ( not ( = ?auto_796380 ?auto_796385 ) ) ( not ( = ?auto_796380 ?auto_796391 ) ) ( not ( = ?auto_796381 ?auto_796382 ) ) ( not ( = ?auto_796381 ?auto_796384 ) ) ( not ( = ?auto_796381 ?auto_796383 ) ) ( not ( = ?auto_796381 ?auto_796385 ) ) ( not ( = ?auto_796381 ?auto_796391 ) ) ( not ( = ?auto_796382 ?auto_796384 ) ) ( not ( = ?auto_796382 ?auto_796383 ) ) ( not ( = ?auto_796382 ?auto_796385 ) ) ( not ( = ?auto_796382 ?auto_796391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_796384 ?auto_796383 ?auto_796385 )
      ( MAKE-5CRATE-VERIFY ?auto_796380 ?auto_796381 ?auto_796382 ?auto_796384 ?auto_796383 ?auto_796385 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797589 - SURFACE
      ?auto_797590 - SURFACE
      ?auto_797591 - SURFACE
      ?auto_797593 - SURFACE
      ?auto_797592 - SURFACE
      ?auto_797594 - SURFACE
      ?auto_797595 - SURFACE
    )
    :vars
    (
      ?auto_797597 - HOIST
      ?auto_797596 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_797597 ?auto_797596 ) ( SURFACE-AT ?auto_797594 ?auto_797596 ) ( CLEAR ?auto_797594 ) ( LIFTING ?auto_797597 ?auto_797595 ) ( IS-CRATE ?auto_797595 ) ( not ( = ?auto_797594 ?auto_797595 ) ) ( ON ?auto_797590 ?auto_797589 ) ( ON ?auto_797591 ?auto_797590 ) ( ON ?auto_797593 ?auto_797591 ) ( ON ?auto_797592 ?auto_797593 ) ( ON ?auto_797594 ?auto_797592 ) ( not ( = ?auto_797589 ?auto_797590 ) ) ( not ( = ?auto_797589 ?auto_797591 ) ) ( not ( = ?auto_797589 ?auto_797593 ) ) ( not ( = ?auto_797589 ?auto_797592 ) ) ( not ( = ?auto_797589 ?auto_797594 ) ) ( not ( = ?auto_797589 ?auto_797595 ) ) ( not ( = ?auto_797590 ?auto_797591 ) ) ( not ( = ?auto_797590 ?auto_797593 ) ) ( not ( = ?auto_797590 ?auto_797592 ) ) ( not ( = ?auto_797590 ?auto_797594 ) ) ( not ( = ?auto_797590 ?auto_797595 ) ) ( not ( = ?auto_797591 ?auto_797593 ) ) ( not ( = ?auto_797591 ?auto_797592 ) ) ( not ( = ?auto_797591 ?auto_797594 ) ) ( not ( = ?auto_797591 ?auto_797595 ) ) ( not ( = ?auto_797593 ?auto_797592 ) ) ( not ( = ?auto_797593 ?auto_797594 ) ) ( not ( = ?auto_797593 ?auto_797595 ) ) ( not ( = ?auto_797592 ?auto_797594 ) ) ( not ( = ?auto_797592 ?auto_797595 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_797594 ?auto_797595 )
      ( MAKE-6CRATE-VERIFY ?auto_797589 ?auto_797590 ?auto_797591 ?auto_797593 ?auto_797592 ?auto_797594 ?auto_797595 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797633 - SURFACE
      ?auto_797634 - SURFACE
      ?auto_797635 - SURFACE
      ?auto_797637 - SURFACE
      ?auto_797636 - SURFACE
      ?auto_797638 - SURFACE
      ?auto_797639 - SURFACE
    )
    :vars
    (
      ?auto_797640 - HOIST
      ?auto_797642 - PLACE
      ?auto_797641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_797640 ?auto_797642 ) ( SURFACE-AT ?auto_797638 ?auto_797642 ) ( CLEAR ?auto_797638 ) ( IS-CRATE ?auto_797639 ) ( not ( = ?auto_797638 ?auto_797639 ) ) ( TRUCK-AT ?auto_797641 ?auto_797642 ) ( AVAILABLE ?auto_797640 ) ( IN ?auto_797639 ?auto_797641 ) ( ON ?auto_797638 ?auto_797636 ) ( not ( = ?auto_797636 ?auto_797638 ) ) ( not ( = ?auto_797636 ?auto_797639 ) ) ( ON ?auto_797634 ?auto_797633 ) ( ON ?auto_797635 ?auto_797634 ) ( ON ?auto_797637 ?auto_797635 ) ( ON ?auto_797636 ?auto_797637 ) ( not ( = ?auto_797633 ?auto_797634 ) ) ( not ( = ?auto_797633 ?auto_797635 ) ) ( not ( = ?auto_797633 ?auto_797637 ) ) ( not ( = ?auto_797633 ?auto_797636 ) ) ( not ( = ?auto_797633 ?auto_797638 ) ) ( not ( = ?auto_797633 ?auto_797639 ) ) ( not ( = ?auto_797634 ?auto_797635 ) ) ( not ( = ?auto_797634 ?auto_797637 ) ) ( not ( = ?auto_797634 ?auto_797636 ) ) ( not ( = ?auto_797634 ?auto_797638 ) ) ( not ( = ?auto_797634 ?auto_797639 ) ) ( not ( = ?auto_797635 ?auto_797637 ) ) ( not ( = ?auto_797635 ?auto_797636 ) ) ( not ( = ?auto_797635 ?auto_797638 ) ) ( not ( = ?auto_797635 ?auto_797639 ) ) ( not ( = ?auto_797637 ?auto_797636 ) ) ( not ( = ?auto_797637 ?auto_797638 ) ) ( not ( = ?auto_797637 ?auto_797639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_797636 ?auto_797638 ?auto_797639 )
      ( MAKE-6CRATE-VERIFY ?auto_797633 ?auto_797634 ?auto_797635 ?auto_797637 ?auto_797636 ?auto_797638 ?auto_797639 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797684 - SURFACE
      ?auto_797685 - SURFACE
      ?auto_797686 - SURFACE
      ?auto_797688 - SURFACE
      ?auto_797687 - SURFACE
      ?auto_797689 - SURFACE
      ?auto_797690 - SURFACE
    )
    :vars
    (
      ?auto_797693 - HOIST
      ?auto_797694 - PLACE
      ?auto_797692 - TRUCK
      ?auto_797691 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_797693 ?auto_797694 ) ( SURFACE-AT ?auto_797689 ?auto_797694 ) ( CLEAR ?auto_797689 ) ( IS-CRATE ?auto_797690 ) ( not ( = ?auto_797689 ?auto_797690 ) ) ( AVAILABLE ?auto_797693 ) ( IN ?auto_797690 ?auto_797692 ) ( ON ?auto_797689 ?auto_797687 ) ( not ( = ?auto_797687 ?auto_797689 ) ) ( not ( = ?auto_797687 ?auto_797690 ) ) ( TRUCK-AT ?auto_797692 ?auto_797691 ) ( not ( = ?auto_797691 ?auto_797694 ) ) ( ON ?auto_797685 ?auto_797684 ) ( ON ?auto_797686 ?auto_797685 ) ( ON ?auto_797688 ?auto_797686 ) ( ON ?auto_797687 ?auto_797688 ) ( not ( = ?auto_797684 ?auto_797685 ) ) ( not ( = ?auto_797684 ?auto_797686 ) ) ( not ( = ?auto_797684 ?auto_797688 ) ) ( not ( = ?auto_797684 ?auto_797687 ) ) ( not ( = ?auto_797684 ?auto_797689 ) ) ( not ( = ?auto_797684 ?auto_797690 ) ) ( not ( = ?auto_797685 ?auto_797686 ) ) ( not ( = ?auto_797685 ?auto_797688 ) ) ( not ( = ?auto_797685 ?auto_797687 ) ) ( not ( = ?auto_797685 ?auto_797689 ) ) ( not ( = ?auto_797685 ?auto_797690 ) ) ( not ( = ?auto_797686 ?auto_797688 ) ) ( not ( = ?auto_797686 ?auto_797687 ) ) ( not ( = ?auto_797686 ?auto_797689 ) ) ( not ( = ?auto_797686 ?auto_797690 ) ) ( not ( = ?auto_797688 ?auto_797687 ) ) ( not ( = ?auto_797688 ?auto_797689 ) ) ( not ( = ?auto_797688 ?auto_797690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_797687 ?auto_797689 ?auto_797690 )
      ( MAKE-6CRATE-VERIFY ?auto_797684 ?auto_797685 ?auto_797686 ?auto_797688 ?auto_797687 ?auto_797689 ?auto_797690 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797741 - SURFACE
      ?auto_797742 - SURFACE
      ?auto_797743 - SURFACE
      ?auto_797745 - SURFACE
      ?auto_797744 - SURFACE
      ?auto_797746 - SURFACE
      ?auto_797747 - SURFACE
    )
    :vars
    (
      ?auto_797748 - HOIST
      ?auto_797749 - PLACE
      ?auto_797752 - TRUCK
      ?auto_797750 - PLACE
      ?auto_797751 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_797748 ?auto_797749 ) ( SURFACE-AT ?auto_797746 ?auto_797749 ) ( CLEAR ?auto_797746 ) ( IS-CRATE ?auto_797747 ) ( not ( = ?auto_797746 ?auto_797747 ) ) ( AVAILABLE ?auto_797748 ) ( ON ?auto_797746 ?auto_797744 ) ( not ( = ?auto_797744 ?auto_797746 ) ) ( not ( = ?auto_797744 ?auto_797747 ) ) ( TRUCK-AT ?auto_797752 ?auto_797750 ) ( not ( = ?auto_797750 ?auto_797749 ) ) ( HOIST-AT ?auto_797751 ?auto_797750 ) ( LIFTING ?auto_797751 ?auto_797747 ) ( not ( = ?auto_797748 ?auto_797751 ) ) ( ON ?auto_797742 ?auto_797741 ) ( ON ?auto_797743 ?auto_797742 ) ( ON ?auto_797745 ?auto_797743 ) ( ON ?auto_797744 ?auto_797745 ) ( not ( = ?auto_797741 ?auto_797742 ) ) ( not ( = ?auto_797741 ?auto_797743 ) ) ( not ( = ?auto_797741 ?auto_797745 ) ) ( not ( = ?auto_797741 ?auto_797744 ) ) ( not ( = ?auto_797741 ?auto_797746 ) ) ( not ( = ?auto_797741 ?auto_797747 ) ) ( not ( = ?auto_797742 ?auto_797743 ) ) ( not ( = ?auto_797742 ?auto_797745 ) ) ( not ( = ?auto_797742 ?auto_797744 ) ) ( not ( = ?auto_797742 ?auto_797746 ) ) ( not ( = ?auto_797742 ?auto_797747 ) ) ( not ( = ?auto_797743 ?auto_797745 ) ) ( not ( = ?auto_797743 ?auto_797744 ) ) ( not ( = ?auto_797743 ?auto_797746 ) ) ( not ( = ?auto_797743 ?auto_797747 ) ) ( not ( = ?auto_797745 ?auto_797744 ) ) ( not ( = ?auto_797745 ?auto_797746 ) ) ( not ( = ?auto_797745 ?auto_797747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_797744 ?auto_797746 ?auto_797747 )
      ( MAKE-6CRATE-VERIFY ?auto_797741 ?auto_797742 ?auto_797743 ?auto_797745 ?auto_797744 ?auto_797746 ?auto_797747 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797804 - SURFACE
      ?auto_797805 - SURFACE
      ?auto_797806 - SURFACE
      ?auto_797808 - SURFACE
      ?auto_797807 - SURFACE
      ?auto_797809 - SURFACE
      ?auto_797810 - SURFACE
    )
    :vars
    (
      ?auto_797812 - HOIST
      ?auto_797815 - PLACE
      ?auto_797816 - TRUCK
      ?auto_797814 - PLACE
      ?auto_797811 - HOIST
      ?auto_797813 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_797812 ?auto_797815 ) ( SURFACE-AT ?auto_797809 ?auto_797815 ) ( CLEAR ?auto_797809 ) ( IS-CRATE ?auto_797810 ) ( not ( = ?auto_797809 ?auto_797810 ) ) ( AVAILABLE ?auto_797812 ) ( ON ?auto_797809 ?auto_797807 ) ( not ( = ?auto_797807 ?auto_797809 ) ) ( not ( = ?auto_797807 ?auto_797810 ) ) ( TRUCK-AT ?auto_797816 ?auto_797814 ) ( not ( = ?auto_797814 ?auto_797815 ) ) ( HOIST-AT ?auto_797811 ?auto_797814 ) ( not ( = ?auto_797812 ?auto_797811 ) ) ( AVAILABLE ?auto_797811 ) ( SURFACE-AT ?auto_797810 ?auto_797814 ) ( ON ?auto_797810 ?auto_797813 ) ( CLEAR ?auto_797810 ) ( not ( = ?auto_797809 ?auto_797813 ) ) ( not ( = ?auto_797810 ?auto_797813 ) ) ( not ( = ?auto_797807 ?auto_797813 ) ) ( ON ?auto_797805 ?auto_797804 ) ( ON ?auto_797806 ?auto_797805 ) ( ON ?auto_797808 ?auto_797806 ) ( ON ?auto_797807 ?auto_797808 ) ( not ( = ?auto_797804 ?auto_797805 ) ) ( not ( = ?auto_797804 ?auto_797806 ) ) ( not ( = ?auto_797804 ?auto_797808 ) ) ( not ( = ?auto_797804 ?auto_797807 ) ) ( not ( = ?auto_797804 ?auto_797809 ) ) ( not ( = ?auto_797804 ?auto_797810 ) ) ( not ( = ?auto_797804 ?auto_797813 ) ) ( not ( = ?auto_797805 ?auto_797806 ) ) ( not ( = ?auto_797805 ?auto_797808 ) ) ( not ( = ?auto_797805 ?auto_797807 ) ) ( not ( = ?auto_797805 ?auto_797809 ) ) ( not ( = ?auto_797805 ?auto_797810 ) ) ( not ( = ?auto_797805 ?auto_797813 ) ) ( not ( = ?auto_797806 ?auto_797808 ) ) ( not ( = ?auto_797806 ?auto_797807 ) ) ( not ( = ?auto_797806 ?auto_797809 ) ) ( not ( = ?auto_797806 ?auto_797810 ) ) ( not ( = ?auto_797806 ?auto_797813 ) ) ( not ( = ?auto_797808 ?auto_797807 ) ) ( not ( = ?auto_797808 ?auto_797809 ) ) ( not ( = ?auto_797808 ?auto_797810 ) ) ( not ( = ?auto_797808 ?auto_797813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_797807 ?auto_797809 ?auto_797810 )
      ( MAKE-6CRATE-VERIFY ?auto_797804 ?auto_797805 ?auto_797806 ?auto_797808 ?auto_797807 ?auto_797809 ?auto_797810 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797868 - SURFACE
      ?auto_797869 - SURFACE
      ?auto_797870 - SURFACE
      ?auto_797872 - SURFACE
      ?auto_797871 - SURFACE
      ?auto_797873 - SURFACE
      ?auto_797874 - SURFACE
    )
    :vars
    (
      ?auto_797880 - HOIST
      ?auto_797878 - PLACE
      ?auto_797876 - PLACE
      ?auto_797875 - HOIST
      ?auto_797879 - SURFACE
      ?auto_797877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_797880 ?auto_797878 ) ( SURFACE-AT ?auto_797873 ?auto_797878 ) ( CLEAR ?auto_797873 ) ( IS-CRATE ?auto_797874 ) ( not ( = ?auto_797873 ?auto_797874 ) ) ( AVAILABLE ?auto_797880 ) ( ON ?auto_797873 ?auto_797871 ) ( not ( = ?auto_797871 ?auto_797873 ) ) ( not ( = ?auto_797871 ?auto_797874 ) ) ( not ( = ?auto_797876 ?auto_797878 ) ) ( HOIST-AT ?auto_797875 ?auto_797876 ) ( not ( = ?auto_797880 ?auto_797875 ) ) ( AVAILABLE ?auto_797875 ) ( SURFACE-AT ?auto_797874 ?auto_797876 ) ( ON ?auto_797874 ?auto_797879 ) ( CLEAR ?auto_797874 ) ( not ( = ?auto_797873 ?auto_797879 ) ) ( not ( = ?auto_797874 ?auto_797879 ) ) ( not ( = ?auto_797871 ?auto_797879 ) ) ( TRUCK-AT ?auto_797877 ?auto_797878 ) ( ON ?auto_797869 ?auto_797868 ) ( ON ?auto_797870 ?auto_797869 ) ( ON ?auto_797872 ?auto_797870 ) ( ON ?auto_797871 ?auto_797872 ) ( not ( = ?auto_797868 ?auto_797869 ) ) ( not ( = ?auto_797868 ?auto_797870 ) ) ( not ( = ?auto_797868 ?auto_797872 ) ) ( not ( = ?auto_797868 ?auto_797871 ) ) ( not ( = ?auto_797868 ?auto_797873 ) ) ( not ( = ?auto_797868 ?auto_797874 ) ) ( not ( = ?auto_797868 ?auto_797879 ) ) ( not ( = ?auto_797869 ?auto_797870 ) ) ( not ( = ?auto_797869 ?auto_797872 ) ) ( not ( = ?auto_797869 ?auto_797871 ) ) ( not ( = ?auto_797869 ?auto_797873 ) ) ( not ( = ?auto_797869 ?auto_797874 ) ) ( not ( = ?auto_797869 ?auto_797879 ) ) ( not ( = ?auto_797870 ?auto_797872 ) ) ( not ( = ?auto_797870 ?auto_797871 ) ) ( not ( = ?auto_797870 ?auto_797873 ) ) ( not ( = ?auto_797870 ?auto_797874 ) ) ( not ( = ?auto_797870 ?auto_797879 ) ) ( not ( = ?auto_797872 ?auto_797871 ) ) ( not ( = ?auto_797872 ?auto_797873 ) ) ( not ( = ?auto_797872 ?auto_797874 ) ) ( not ( = ?auto_797872 ?auto_797879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_797871 ?auto_797873 ?auto_797874 )
      ( MAKE-6CRATE-VERIFY ?auto_797868 ?auto_797869 ?auto_797870 ?auto_797872 ?auto_797871 ?auto_797873 ?auto_797874 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797932 - SURFACE
      ?auto_797933 - SURFACE
      ?auto_797934 - SURFACE
      ?auto_797936 - SURFACE
      ?auto_797935 - SURFACE
      ?auto_797937 - SURFACE
      ?auto_797938 - SURFACE
    )
    :vars
    (
      ?auto_797940 - HOIST
      ?auto_797943 - PLACE
      ?auto_797942 - PLACE
      ?auto_797941 - HOIST
      ?auto_797939 - SURFACE
      ?auto_797944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_797940 ?auto_797943 ) ( IS-CRATE ?auto_797938 ) ( not ( = ?auto_797937 ?auto_797938 ) ) ( not ( = ?auto_797935 ?auto_797937 ) ) ( not ( = ?auto_797935 ?auto_797938 ) ) ( not ( = ?auto_797942 ?auto_797943 ) ) ( HOIST-AT ?auto_797941 ?auto_797942 ) ( not ( = ?auto_797940 ?auto_797941 ) ) ( AVAILABLE ?auto_797941 ) ( SURFACE-AT ?auto_797938 ?auto_797942 ) ( ON ?auto_797938 ?auto_797939 ) ( CLEAR ?auto_797938 ) ( not ( = ?auto_797937 ?auto_797939 ) ) ( not ( = ?auto_797938 ?auto_797939 ) ) ( not ( = ?auto_797935 ?auto_797939 ) ) ( TRUCK-AT ?auto_797944 ?auto_797943 ) ( SURFACE-AT ?auto_797935 ?auto_797943 ) ( CLEAR ?auto_797935 ) ( LIFTING ?auto_797940 ?auto_797937 ) ( IS-CRATE ?auto_797937 ) ( ON ?auto_797933 ?auto_797932 ) ( ON ?auto_797934 ?auto_797933 ) ( ON ?auto_797936 ?auto_797934 ) ( ON ?auto_797935 ?auto_797936 ) ( not ( = ?auto_797932 ?auto_797933 ) ) ( not ( = ?auto_797932 ?auto_797934 ) ) ( not ( = ?auto_797932 ?auto_797936 ) ) ( not ( = ?auto_797932 ?auto_797935 ) ) ( not ( = ?auto_797932 ?auto_797937 ) ) ( not ( = ?auto_797932 ?auto_797938 ) ) ( not ( = ?auto_797932 ?auto_797939 ) ) ( not ( = ?auto_797933 ?auto_797934 ) ) ( not ( = ?auto_797933 ?auto_797936 ) ) ( not ( = ?auto_797933 ?auto_797935 ) ) ( not ( = ?auto_797933 ?auto_797937 ) ) ( not ( = ?auto_797933 ?auto_797938 ) ) ( not ( = ?auto_797933 ?auto_797939 ) ) ( not ( = ?auto_797934 ?auto_797936 ) ) ( not ( = ?auto_797934 ?auto_797935 ) ) ( not ( = ?auto_797934 ?auto_797937 ) ) ( not ( = ?auto_797934 ?auto_797938 ) ) ( not ( = ?auto_797934 ?auto_797939 ) ) ( not ( = ?auto_797936 ?auto_797935 ) ) ( not ( = ?auto_797936 ?auto_797937 ) ) ( not ( = ?auto_797936 ?auto_797938 ) ) ( not ( = ?auto_797936 ?auto_797939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_797935 ?auto_797937 ?auto_797938 )
      ( MAKE-6CRATE-VERIFY ?auto_797932 ?auto_797933 ?auto_797934 ?auto_797936 ?auto_797935 ?auto_797937 ?auto_797938 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_797996 - SURFACE
      ?auto_797997 - SURFACE
      ?auto_797998 - SURFACE
      ?auto_798000 - SURFACE
      ?auto_797999 - SURFACE
      ?auto_798001 - SURFACE
      ?auto_798002 - SURFACE
    )
    :vars
    (
      ?auto_798003 - HOIST
      ?auto_798004 - PLACE
      ?auto_798008 - PLACE
      ?auto_798006 - HOIST
      ?auto_798005 - SURFACE
      ?auto_798007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_798003 ?auto_798004 ) ( IS-CRATE ?auto_798002 ) ( not ( = ?auto_798001 ?auto_798002 ) ) ( not ( = ?auto_797999 ?auto_798001 ) ) ( not ( = ?auto_797999 ?auto_798002 ) ) ( not ( = ?auto_798008 ?auto_798004 ) ) ( HOIST-AT ?auto_798006 ?auto_798008 ) ( not ( = ?auto_798003 ?auto_798006 ) ) ( AVAILABLE ?auto_798006 ) ( SURFACE-AT ?auto_798002 ?auto_798008 ) ( ON ?auto_798002 ?auto_798005 ) ( CLEAR ?auto_798002 ) ( not ( = ?auto_798001 ?auto_798005 ) ) ( not ( = ?auto_798002 ?auto_798005 ) ) ( not ( = ?auto_797999 ?auto_798005 ) ) ( TRUCK-AT ?auto_798007 ?auto_798004 ) ( SURFACE-AT ?auto_797999 ?auto_798004 ) ( CLEAR ?auto_797999 ) ( IS-CRATE ?auto_798001 ) ( AVAILABLE ?auto_798003 ) ( IN ?auto_798001 ?auto_798007 ) ( ON ?auto_797997 ?auto_797996 ) ( ON ?auto_797998 ?auto_797997 ) ( ON ?auto_798000 ?auto_797998 ) ( ON ?auto_797999 ?auto_798000 ) ( not ( = ?auto_797996 ?auto_797997 ) ) ( not ( = ?auto_797996 ?auto_797998 ) ) ( not ( = ?auto_797996 ?auto_798000 ) ) ( not ( = ?auto_797996 ?auto_797999 ) ) ( not ( = ?auto_797996 ?auto_798001 ) ) ( not ( = ?auto_797996 ?auto_798002 ) ) ( not ( = ?auto_797996 ?auto_798005 ) ) ( not ( = ?auto_797997 ?auto_797998 ) ) ( not ( = ?auto_797997 ?auto_798000 ) ) ( not ( = ?auto_797997 ?auto_797999 ) ) ( not ( = ?auto_797997 ?auto_798001 ) ) ( not ( = ?auto_797997 ?auto_798002 ) ) ( not ( = ?auto_797997 ?auto_798005 ) ) ( not ( = ?auto_797998 ?auto_798000 ) ) ( not ( = ?auto_797998 ?auto_797999 ) ) ( not ( = ?auto_797998 ?auto_798001 ) ) ( not ( = ?auto_797998 ?auto_798002 ) ) ( not ( = ?auto_797998 ?auto_798005 ) ) ( not ( = ?auto_798000 ?auto_797999 ) ) ( not ( = ?auto_798000 ?auto_798001 ) ) ( not ( = ?auto_798000 ?auto_798002 ) ) ( not ( = ?auto_798000 ?auto_798005 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_797999 ?auto_798001 ?auto_798002 )
      ( MAKE-6CRATE-VERIFY ?auto_797996 ?auto_797997 ?auto_797998 ?auto_798000 ?auto_797999 ?auto_798001 ?auto_798002 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_799947 - SURFACE
      ?auto_799948 - SURFACE
      ?auto_799949 - SURFACE
      ?auto_799951 - SURFACE
      ?auto_799950 - SURFACE
      ?auto_799952 - SURFACE
      ?auto_799953 - SURFACE
      ?auto_799954 - SURFACE
    )
    :vars
    (
      ?auto_799955 - HOIST
      ?auto_799956 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_799955 ?auto_799956 ) ( SURFACE-AT ?auto_799953 ?auto_799956 ) ( CLEAR ?auto_799953 ) ( LIFTING ?auto_799955 ?auto_799954 ) ( IS-CRATE ?auto_799954 ) ( not ( = ?auto_799953 ?auto_799954 ) ) ( ON ?auto_799948 ?auto_799947 ) ( ON ?auto_799949 ?auto_799948 ) ( ON ?auto_799951 ?auto_799949 ) ( ON ?auto_799950 ?auto_799951 ) ( ON ?auto_799952 ?auto_799950 ) ( ON ?auto_799953 ?auto_799952 ) ( not ( = ?auto_799947 ?auto_799948 ) ) ( not ( = ?auto_799947 ?auto_799949 ) ) ( not ( = ?auto_799947 ?auto_799951 ) ) ( not ( = ?auto_799947 ?auto_799950 ) ) ( not ( = ?auto_799947 ?auto_799952 ) ) ( not ( = ?auto_799947 ?auto_799953 ) ) ( not ( = ?auto_799947 ?auto_799954 ) ) ( not ( = ?auto_799948 ?auto_799949 ) ) ( not ( = ?auto_799948 ?auto_799951 ) ) ( not ( = ?auto_799948 ?auto_799950 ) ) ( not ( = ?auto_799948 ?auto_799952 ) ) ( not ( = ?auto_799948 ?auto_799953 ) ) ( not ( = ?auto_799948 ?auto_799954 ) ) ( not ( = ?auto_799949 ?auto_799951 ) ) ( not ( = ?auto_799949 ?auto_799950 ) ) ( not ( = ?auto_799949 ?auto_799952 ) ) ( not ( = ?auto_799949 ?auto_799953 ) ) ( not ( = ?auto_799949 ?auto_799954 ) ) ( not ( = ?auto_799951 ?auto_799950 ) ) ( not ( = ?auto_799951 ?auto_799952 ) ) ( not ( = ?auto_799951 ?auto_799953 ) ) ( not ( = ?auto_799951 ?auto_799954 ) ) ( not ( = ?auto_799950 ?auto_799952 ) ) ( not ( = ?auto_799950 ?auto_799953 ) ) ( not ( = ?auto_799950 ?auto_799954 ) ) ( not ( = ?auto_799952 ?auto_799953 ) ) ( not ( = ?auto_799952 ?auto_799954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_799953 ?auto_799954 )
      ( MAKE-7CRATE-VERIFY ?auto_799947 ?auto_799948 ?auto_799949 ?auto_799951 ?auto_799950 ?auto_799952 ?auto_799953 ?auto_799954 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800002 - SURFACE
      ?auto_800003 - SURFACE
      ?auto_800004 - SURFACE
      ?auto_800006 - SURFACE
      ?auto_800005 - SURFACE
      ?auto_800007 - SURFACE
      ?auto_800008 - SURFACE
      ?auto_800009 - SURFACE
    )
    :vars
    (
      ?auto_800011 - HOIST
      ?auto_800010 - PLACE
      ?auto_800012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800011 ?auto_800010 ) ( SURFACE-AT ?auto_800008 ?auto_800010 ) ( CLEAR ?auto_800008 ) ( IS-CRATE ?auto_800009 ) ( not ( = ?auto_800008 ?auto_800009 ) ) ( TRUCK-AT ?auto_800012 ?auto_800010 ) ( AVAILABLE ?auto_800011 ) ( IN ?auto_800009 ?auto_800012 ) ( ON ?auto_800008 ?auto_800007 ) ( not ( = ?auto_800007 ?auto_800008 ) ) ( not ( = ?auto_800007 ?auto_800009 ) ) ( ON ?auto_800003 ?auto_800002 ) ( ON ?auto_800004 ?auto_800003 ) ( ON ?auto_800006 ?auto_800004 ) ( ON ?auto_800005 ?auto_800006 ) ( ON ?auto_800007 ?auto_800005 ) ( not ( = ?auto_800002 ?auto_800003 ) ) ( not ( = ?auto_800002 ?auto_800004 ) ) ( not ( = ?auto_800002 ?auto_800006 ) ) ( not ( = ?auto_800002 ?auto_800005 ) ) ( not ( = ?auto_800002 ?auto_800007 ) ) ( not ( = ?auto_800002 ?auto_800008 ) ) ( not ( = ?auto_800002 ?auto_800009 ) ) ( not ( = ?auto_800003 ?auto_800004 ) ) ( not ( = ?auto_800003 ?auto_800006 ) ) ( not ( = ?auto_800003 ?auto_800005 ) ) ( not ( = ?auto_800003 ?auto_800007 ) ) ( not ( = ?auto_800003 ?auto_800008 ) ) ( not ( = ?auto_800003 ?auto_800009 ) ) ( not ( = ?auto_800004 ?auto_800006 ) ) ( not ( = ?auto_800004 ?auto_800005 ) ) ( not ( = ?auto_800004 ?auto_800007 ) ) ( not ( = ?auto_800004 ?auto_800008 ) ) ( not ( = ?auto_800004 ?auto_800009 ) ) ( not ( = ?auto_800006 ?auto_800005 ) ) ( not ( = ?auto_800006 ?auto_800007 ) ) ( not ( = ?auto_800006 ?auto_800008 ) ) ( not ( = ?auto_800006 ?auto_800009 ) ) ( not ( = ?auto_800005 ?auto_800007 ) ) ( not ( = ?auto_800005 ?auto_800008 ) ) ( not ( = ?auto_800005 ?auto_800009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800007 ?auto_800008 ?auto_800009 )
      ( MAKE-7CRATE-VERIFY ?auto_800002 ?auto_800003 ?auto_800004 ?auto_800006 ?auto_800005 ?auto_800007 ?auto_800008 ?auto_800009 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800065 - SURFACE
      ?auto_800066 - SURFACE
      ?auto_800067 - SURFACE
      ?auto_800069 - SURFACE
      ?auto_800068 - SURFACE
      ?auto_800070 - SURFACE
      ?auto_800071 - SURFACE
      ?auto_800072 - SURFACE
    )
    :vars
    (
      ?auto_800076 - HOIST
      ?auto_800073 - PLACE
      ?auto_800075 - TRUCK
      ?auto_800074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800076 ?auto_800073 ) ( SURFACE-AT ?auto_800071 ?auto_800073 ) ( CLEAR ?auto_800071 ) ( IS-CRATE ?auto_800072 ) ( not ( = ?auto_800071 ?auto_800072 ) ) ( AVAILABLE ?auto_800076 ) ( IN ?auto_800072 ?auto_800075 ) ( ON ?auto_800071 ?auto_800070 ) ( not ( = ?auto_800070 ?auto_800071 ) ) ( not ( = ?auto_800070 ?auto_800072 ) ) ( TRUCK-AT ?auto_800075 ?auto_800074 ) ( not ( = ?auto_800074 ?auto_800073 ) ) ( ON ?auto_800066 ?auto_800065 ) ( ON ?auto_800067 ?auto_800066 ) ( ON ?auto_800069 ?auto_800067 ) ( ON ?auto_800068 ?auto_800069 ) ( ON ?auto_800070 ?auto_800068 ) ( not ( = ?auto_800065 ?auto_800066 ) ) ( not ( = ?auto_800065 ?auto_800067 ) ) ( not ( = ?auto_800065 ?auto_800069 ) ) ( not ( = ?auto_800065 ?auto_800068 ) ) ( not ( = ?auto_800065 ?auto_800070 ) ) ( not ( = ?auto_800065 ?auto_800071 ) ) ( not ( = ?auto_800065 ?auto_800072 ) ) ( not ( = ?auto_800066 ?auto_800067 ) ) ( not ( = ?auto_800066 ?auto_800069 ) ) ( not ( = ?auto_800066 ?auto_800068 ) ) ( not ( = ?auto_800066 ?auto_800070 ) ) ( not ( = ?auto_800066 ?auto_800071 ) ) ( not ( = ?auto_800066 ?auto_800072 ) ) ( not ( = ?auto_800067 ?auto_800069 ) ) ( not ( = ?auto_800067 ?auto_800068 ) ) ( not ( = ?auto_800067 ?auto_800070 ) ) ( not ( = ?auto_800067 ?auto_800071 ) ) ( not ( = ?auto_800067 ?auto_800072 ) ) ( not ( = ?auto_800069 ?auto_800068 ) ) ( not ( = ?auto_800069 ?auto_800070 ) ) ( not ( = ?auto_800069 ?auto_800071 ) ) ( not ( = ?auto_800069 ?auto_800072 ) ) ( not ( = ?auto_800068 ?auto_800070 ) ) ( not ( = ?auto_800068 ?auto_800071 ) ) ( not ( = ?auto_800068 ?auto_800072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800070 ?auto_800071 ?auto_800072 )
      ( MAKE-7CRATE-VERIFY ?auto_800065 ?auto_800066 ?auto_800067 ?auto_800069 ?auto_800068 ?auto_800070 ?auto_800071 ?auto_800072 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800135 - SURFACE
      ?auto_800136 - SURFACE
      ?auto_800137 - SURFACE
      ?auto_800139 - SURFACE
      ?auto_800138 - SURFACE
      ?auto_800140 - SURFACE
      ?auto_800141 - SURFACE
      ?auto_800142 - SURFACE
    )
    :vars
    (
      ?auto_800145 - HOIST
      ?auto_800143 - PLACE
      ?auto_800146 - TRUCK
      ?auto_800147 - PLACE
      ?auto_800144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_800145 ?auto_800143 ) ( SURFACE-AT ?auto_800141 ?auto_800143 ) ( CLEAR ?auto_800141 ) ( IS-CRATE ?auto_800142 ) ( not ( = ?auto_800141 ?auto_800142 ) ) ( AVAILABLE ?auto_800145 ) ( ON ?auto_800141 ?auto_800140 ) ( not ( = ?auto_800140 ?auto_800141 ) ) ( not ( = ?auto_800140 ?auto_800142 ) ) ( TRUCK-AT ?auto_800146 ?auto_800147 ) ( not ( = ?auto_800147 ?auto_800143 ) ) ( HOIST-AT ?auto_800144 ?auto_800147 ) ( LIFTING ?auto_800144 ?auto_800142 ) ( not ( = ?auto_800145 ?auto_800144 ) ) ( ON ?auto_800136 ?auto_800135 ) ( ON ?auto_800137 ?auto_800136 ) ( ON ?auto_800139 ?auto_800137 ) ( ON ?auto_800138 ?auto_800139 ) ( ON ?auto_800140 ?auto_800138 ) ( not ( = ?auto_800135 ?auto_800136 ) ) ( not ( = ?auto_800135 ?auto_800137 ) ) ( not ( = ?auto_800135 ?auto_800139 ) ) ( not ( = ?auto_800135 ?auto_800138 ) ) ( not ( = ?auto_800135 ?auto_800140 ) ) ( not ( = ?auto_800135 ?auto_800141 ) ) ( not ( = ?auto_800135 ?auto_800142 ) ) ( not ( = ?auto_800136 ?auto_800137 ) ) ( not ( = ?auto_800136 ?auto_800139 ) ) ( not ( = ?auto_800136 ?auto_800138 ) ) ( not ( = ?auto_800136 ?auto_800140 ) ) ( not ( = ?auto_800136 ?auto_800141 ) ) ( not ( = ?auto_800136 ?auto_800142 ) ) ( not ( = ?auto_800137 ?auto_800139 ) ) ( not ( = ?auto_800137 ?auto_800138 ) ) ( not ( = ?auto_800137 ?auto_800140 ) ) ( not ( = ?auto_800137 ?auto_800141 ) ) ( not ( = ?auto_800137 ?auto_800142 ) ) ( not ( = ?auto_800139 ?auto_800138 ) ) ( not ( = ?auto_800139 ?auto_800140 ) ) ( not ( = ?auto_800139 ?auto_800141 ) ) ( not ( = ?auto_800139 ?auto_800142 ) ) ( not ( = ?auto_800138 ?auto_800140 ) ) ( not ( = ?auto_800138 ?auto_800141 ) ) ( not ( = ?auto_800138 ?auto_800142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800140 ?auto_800141 ?auto_800142 )
      ( MAKE-7CRATE-VERIFY ?auto_800135 ?auto_800136 ?auto_800137 ?auto_800139 ?auto_800138 ?auto_800140 ?auto_800141 ?auto_800142 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800212 - SURFACE
      ?auto_800213 - SURFACE
      ?auto_800214 - SURFACE
      ?auto_800216 - SURFACE
      ?auto_800215 - SURFACE
      ?auto_800217 - SURFACE
      ?auto_800218 - SURFACE
      ?auto_800219 - SURFACE
    )
    :vars
    (
      ?auto_800225 - HOIST
      ?auto_800223 - PLACE
      ?auto_800220 - TRUCK
      ?auto_800222 - PLACE
      ?auto_800224 - HOIST
      ?auto_800221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800225 ?auto_800223 ) ( SURFACE-AT ?auto_800218 ?auto_800223 ) ( CLEAR ?auto_800218 ) ( IS-CRATE ?auto_800219 ) ( not ( = ?auto_800218 ?auto_800219 ) ) ( AVAILABLE ?auto_800225 ) ( ON ?auto_800218 ?auto_800217 ) ( not ( = ?auto_800217 ?auto_800218 ) ) ( not ( = ?auto_800217 ?auto_800219 ) ) ( TRUCK-AT ?auto_800220 ?auto_800222 ) ( not ( = ?auto_800222 ?auto_800223 ) ) ( HOIST-AT ?auto_800224 ?auto_800222 ) ( not ( = ?auto_800225 ?auto_800224 ) ) ( AVAILABLE ?auto_800224 ) ( SURFACE-AT ?auto_800219 ?auto_800222 ) ( ON ?auto_800219 ?auto_800221 ) ( CLEAR ?auto_800219 ) ( not ( = ?auto_800218 ?auto_800221 ) ) ( not ( = ?auto_800219 ?auto_800221 ) ) ( not ( = ?auto_800217 ?auto_800221 ) ) ( ON ?auto_800213 ?auto_800212 ) ( ON ?auto_800214 ?auto_800213 ) ( ON ?auto_800216 ?auto_800214 ) ( ON ?auto_800215 ?auto_800216 ) ( ON ?auto_800217 ?auto_800215 ) ( not ( = ?auto_800212 ?auto_800213 ) ) ( not ( = ?auto_800212 ?auto_800214 ) ) ( not ( = ?auto_800212 ?auto_800216 ) ) ( not ( = ?auto_800212 ?auto_800215 ) ) ( not ( = ?auto_800212 ?auto_800217 ) ) ( not ( = ?auto_800212 ?auto_800218 ) ) ( not ( = ?auto_800212 ?auto_800219 ) ) ( not ( = ?auto_800212 ?auto_800221 ) ) ( not ( = ?auto_800213 ?auto_800214 ) ) ( not ( = ?auto_800213 ?auto_800216 ) ) ( not ( = ?auto_800213 ?auto_800215 ) ) ( not ( = ?auto_800213 ?auto_800217 ) ) ( not ( = ?auto_800213 ?auto_800218 ) ) ( not ( = ?auto_800213 ?auto_800219 ) ) ( not ( = ?auto_800213 ?auto_800221 ) ) ( not ( = ?auto_800214 ?auto_800216 ) ) ( not ( = ?auto_800214 ?auto_800215 ) ) ( not ( = ?auto_800214 ?auto_800217 ) ) ( not ( = ?auto_800214 ?auto_800218 ) ) ( not ( = ?auto_800214 ?auto_800219 ) ) ( not ( = ?auto_800214 ?auto_800221 ) ) ( not ( = ?auto_800216 ?auto_800215 ) ) ( not ( = ?auto_800216 ?auto_800217 ) ) ( not ( = ?auto_800216 ?auto_800218 ) ) ( not ( = ?auto_800216 ?auto_800219 ) ) ( not ( = ?auto_800216 ?auto_800221 ) ) ( not ( = ?auto_800215 ?auto_800217 ) ) ( not ( = ?auto_800215 ?auto_800218 ) ) ( not ( = ?auto_800215 ?auto_800219 ) ) ( not ( = ?auto_800215 ?auto_800221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800217 ?auto_800218 ?auto_800219 )
      ( MAKE-7CRATE-VERIFY ?auto_800212 ?auto_800213 ?auto_800214 ?auto_800216 ?auto_800215 ?auto_800217 ?auto_800218 ?auto_800219 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800290 - SURFACE
      ?auto_800291 - SURFACE
      ?auto_800292 - SURFACE
      ?auto_800294 - SURFACE
      ?auto_800293 - SURFACE
      ?auto_800295 - SURFACE
      ?auto_800296 - SURFACE
      ?auto_800297 - SURFACE
    )
    :vars
    (
      ?auto_800299 - HOIST
      ?auto_800302 - PLACE
      ?auto_800298 - PLACE
      ?auto_800301 - HOIST
      ?auto_800303 - SURFACE
      ?auto_800300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800299 ?auto_800302 ) ( SURFACE-AT ?auto_800296 ?auto_800302 ) ( CLEAR ?auto_800296 ) ( IS-CRATE ?auto_800297 ) ( not ( = ?auto_800296 ?auto_800297 ) ) ( AVAILABLE ?auto_800299 ) ( ON ?auto_800296 ?auto_800295 ) ( not ( = ?auto_800295 ?auto_800296 ) ) ( not ( = ?auto_800295 ?auto_800297 ) ) ( not ( = ?auto_800298 ?auto_800302 ) ) ( HOIST-AT ?auto_800301 ?auto_800298 ) ( not ( = ?auto_800299 ?auto_800301 ) ) ( AVAILABLE ?auto_800301 ) ( SURFACE-AT ?auto_800297 ?auto_800298 ) ( ON ?auto_800297 ?auto_800303 ) ( CLEAR ?auto_800297 ) ( not ( = ?auto_800296 ?auto_800303 ) ) ( not ( = ?auto_800297 ?auto_800303 ) ) ( not ( = ?auto_800295 ?auto_800303 ) ) ( TRUCK-AT ?auto_800300 ?auto_800302 ) ( ON ?auto_800291 ?auto_800290 ) ( ON ?auto_800292 ?auto_800291 ) ( ON ?auto_800294 ?auto_800292 ) ( ON ?auto_800293 ?auto_800294 ) ( ON ?auto_800295 ?auto_800293 ) ( not ( = ?auto_800290 ?auto_800291 ) ) ( not ( = ?auto_800290 ?auto_800292 ) ) ( not ( = ?auto_800290 ?auto_800294 ) ) ( not ( = ?auto_800290 ?auto_800293 ) ) ( not ( = ?auto_800290 ?auto_800295 ) ) ( not ( = ?auto_800290 ?auto_800296 ) ) ( not ( = ?auto_800290 ?auto_800297 ) ) ( not ( = ?auto_800290 ?auto_800303 ) ) ( not ( = ?auto_800291 ?auto_800292 ) ) ( not ( = ?auto_800291 ?auto_800294 ) ) ( not ( = ?auto_800291 ?auto_800293 ) ) ( not ( = ?auto_800291 ?auto_800295 ) ) ( not ( = ?auto_800291 ?auto_800296 ) ) ( not ( = ?auto_800291 ?auto_800297 ) ) ( not ( = ?auto_800291 ?auto_800303 ) ) ( not ( = ?auto_800292 ?auto_800294 ) ) ( not ( = ?auto_800292 ?auto_800293 ) ) ( not ( = ?auto_800292 ?auto_800295 ) ) ( not ( = ?auto_800292 ?auto_800296 ) ) ( not ( = ?auto_800292 ?auto_800297 ) ) ( not ( = ?auto_800292 ?auto_800303 ) ) ( not ( = ?auto_800294 ?auto_800293 ) ) ( not ( = ?auto_800294 ?auto_800295 ) ) ( not ( = ?auto_800294 ?auto_800296 ) ) ( not ( = ?auto_800294 ?auto_800297 ) ) ( not ( = ?auto_800294 ?auto_800303 ) ) ( not ( = ?auto_800293 ?auto_800295 ) ) ( not ( = ?auto_800293 ?auto_800296 ) ) ( not ( = ?auto_800293 ?auto_800297 ) ) ( not ( = ?auto_800293 ?auto_800303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800295 ?auto_800296 ?auto_800297 )
      ( MAKE-7CRATE-VERIFY ?auto_800290 ?auto_800291 ?auto_800292 ?auto_800294 ?auto_800293 ?auto_800295 ?auto_800296 ?auto_800297 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800368 - SURFACE
      ?auto_800369 - SURFACE
      ?auto_800370 - SURFACE
      ?auto_800372 - SURFACE
      ?auto_800371 - SURFACE
      ?auto_800373 - SURFACE
      ?auto_800374 - SURFACE
      ?auto_800375 - SURFACE
    )
    :vars
    (
      ?auto_800377 - HOIST
      ?auto_800381 - PLACE
      ?auto_800378 - PLACE
      ?auto_800379 - HOIST
      ?auto_800380 - SURFACE
      ?auto_800376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800377 ?auto_800381 ) ( IS-CRATE ?auto_800375 ) ( not ( = ?auto_800374 ?auto_800375 ) ) ( not ( = ?auto_800373 ?auto_800374 ) ) ( not ( = ?auto_800373 ?auto_800375 ) ) ( not ( = ?auto_800378 ?auto_800381 ) ) ( HOIST-AT ?auto_800379 ?auto_800378 ) ( not ( = ?auto_800377 ?auto_800379 ) ) ( AVAILABLE ?auto_800379 ) ( SURFACE-AT ?auto_800375 ?auto_800378 ) ( ON ?auto_800375 ?auto_800380 ) ( CLEAR ?auto_800375 ) ( not ( = ?auto_800374 ?auto_800380 ) ) ( not ( = ?auto_800375 ?auto_800380 ) ) ( not ( = ?auto_800373 ?auto_800380 ) ) ( TRUCK-AT ?auto_800376 ?auto_800381 ) ( SURFACE-AT ?auto_800373 ?auto_800381 ) ( CLEAR ?auto_800373 ) ( LIFTING ?auto_800377 ?auto_800374 ) ( IS-CRATE ?auto_800374 ) ( ON ?auto_800369 ?auto_800368 ) ( ON ?auto_800370 ?auto_800369 ) ( ON ?auto_800372 ?auto_800370 ) ( ON ?auto_800371 ?auto_800372 ) ( ON ?auto_800373 ?auto_800371 ) ( not ( = ?auto_800368 ?auto_800369 ) ) ( not ( = ?auto_800368 ?auto_800370 ) ) ( not ( = ?auto_800368 ?auto_800372 ) ) ( not ( = ?auto_800368 ?auto_800371 ) ) ( not ( = ?auto_800368 ?auto_800373 ) ) ( not ( = ?auto_800368 ?auto_800374 ) ) ( not ( = ?auto_800368 ?auto_800375 ) ) ( not ( = ?auto_800368 ?auto_800380 ) ) ( not ( = ?auto_800369 ?auto_800370 ) ) ( not ( = ?auto_800369 ?auto_800372 ) ) ( not ( = ?auto_800369 ?auto_800371 ) ) ( not ( = ?auto_800369 ?auto_800373 ) ) ( not ( = ?auto_800369 ?auto_800374 ) ) ( not ( = ?auto_800369 ?auto_800375 ) ) ( not ( = ?auto_800369 ?auto_800380 ) ) ( not ( = ?auto_800370 ?auto_800372 ) ) ( not ( = ?auto_800370 ?auto_800371 ) ) ( not ( = ?auto_800370 ?auto_800373 ) ) ( not ( = ?auto_800370 ?auto_800374 ) ) ( not ( = ?auto_800370 ?auto_800375 ) ) ( not ( = ?auto_800370 ?auto_800380 ) ) ( not ( = ?auto_800372 ?auto_800371 ) ) ( not ( = ?auto_800372 ?auto_800373 ) ) ( not ( = ?auto_800372 ?auto_800374 ) ) ( not ( = ?auto_800372 ?auto_800375 ) ) ( not ( = ?auto_800372 ?auto_800380 ) ) ( not ( = ?auto_800371 ?auto_800373 ) ) ( not ( = ?auto_800371 ?auto_800374 ) ) ( not ( = ?auto_800371 ?auto_800375 ) ) ( not ( = ?auto_800371 ?auto_800380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800373 ?auto_800374 ?auto_800375 )
      ( MAKE-7CRATE-VERIFY ?auto_800368 ?auto_800369 ?auto_800370 ?auto_800372 ?auto_800371 ?auto_800373 ?auto_800374 ?auto_800375 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_800446 - SURFACE
      ?auto_800447 - SURFACE
      ?auto_800448 - SURFACE
      ?auto_800450 - SURFACE
      ?auto_800449 - SURFACE
      ?auto_800451 - SURFACE
      ?auto_800452 - SURFACE
      ?auto_800453 - SURFACE
    )
    :vars
    (
      ?auto_800455 - HOIST
      ?auto_800459 - PLACE
      ?auto_800454 - PLACE
      ?auto_800457 - HOIST
      ?auto_800456 - SURFACE
      ?auto_800458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800455 ?auto_800459 ) ( IS-CRATE ?auto_800453 ) ( not ( = ?auto_800452 ?auto_800453 ) ) ( not ( = ?auto_800451 ?auto_800452 ) ) ( not ( = ?auto_800451 ?auto_800453 ) ) ( not ( = ?auto_800454 ?auto_800459 ) ) ( HOIST-AT ?auto_800457 ?auto_800454 ) ( not ( = ?auto_800455 ?auto_800457 ) ) ( AVAILABLE ?auto_800457 ) ( SURFACE-AT ?auto_800453 ?auto_800454 ) ( ON ?auto_800453 ?auto_800456 ) ( CLEAR ?auto_800453 ) ( not ( = ?auto_800452 ?auto_800456 ) ) ( not ( = ?auto_800453 ?auto_800456 ) ) ( not ( = ?auto_800451 ?auto_800456 ) ) ( TRUCK-AT ?auto_800458 ?auto_800459 ) ( SURFACE-AT ?auto_800451 ?auto_800459 ) ( CLEAR ?auto_800451 ) ( IS-CRATE ?auto_800452 ) ( AVAILABLE ?auto_800455 ) ( IN ?auto_800452 ?auto_800458 ) ( ON ?auto_800447 ?auto_800446 ) ( ON ?auto_800448 ?auto_800447 ) ( ON ?auto_800450 ?auto_800448 ) ( ON ?auto_800449 ?auto_800450 ) ( ON ?auto_800451 ?auto_800449 ) ( not ( = ?auto_800446 ?auto_800447 ) ) ( not ( = ?auto_800446 ?auto_800448 ) ) ( not ( = ?auto_800446 ?auto_800450 ) ) ( not ( = ?auto_800446 ?auto_800449 ) ) ( not ( = ?auto_800446 ?auto_800451 ) ) ( not ( = ?auto_800446 ?auto_800452 ) ) ( not ( = ?auto_800446 ?auto_800453 ) ) ( not ( = ?auto_800446 ?auto_800456 ) ) ( not ( = ?auto_800447 ?auto_800448 ) ) ( not ( = ?auto_800447 ?auto_800450 ) ) ( not ( = ?auto_800447 ?auto_800449 ) ) ( not ( = ?auto_800447 ?auto_800451 ) ) ( not ( = ?auto_800447 ?auto_800452 ) ) ( not ( = ?auto_800447 ?auto_800453 ) ) ( not ( = ?auto_800447 ?auto_800456 ) ) ( not ( = ?auto_800448 ?auto_800450 ) ) ( not ( = ?auto_800448 ?auto_800449 ) ) ( not ( = ?auto_800448 ?auto_800451 ) ) ( not ( = ?auto_800448 ?auto_800452 ) ) ( not ( = ?auto_800448 ?auto_800453 ) ) ( not ( = ?auto_800448 ?auto_800456 ) ) ( not ( = ?auto_800450 ?auto_800449 ) ) ( not ( = ?auto_800450 ?auto_800451 ) ) ( not ( = ?auto_800450 ?auto_800452 ) ) ( not ( = ?auto_800450 ?auto_800453 ) ) ( not ( = ?auto_800450 ?auto_800456 ) ) ( not ( = ?auto_800449 ?auto_800451 ) ) ( not ( = ?auto_800449 ?auto_800452 ) ) ( not ( = ?auto_800449 ?auto_800453 ) ) ( not ( = ?auto_800449 ?auto_800456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_800451 ?auto_800452 ?auto_800453 )
      ( MAKE-7CRATE-VERIFY ?auto_800446 ?auto_800447 ?auto_800448 ?auto_800450 ?auto_800449 ?auto_800451 ?auto_800452 ?auto_800453 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803336 - SURFACE
      ?auto_803337 - SURFACE
      ?auto_803338 - SURFACE
      ?auto_803340 - SURFACE
      ?auto_803339 - SURFACE
      ?auto_803341 - SURFACE
      ?auto_803342 - SURFACE
      ?auto_803343 - SURFACE
      ?auto_803344 - SURFACE
    )
    :vars
    (
      ?auto_803345 - HOIST
      ?auto_803346 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_803345 ?auto_803346 ) ( SURFACE-AT ?auto_803343 ?auto_803346 ) ( CLEAR ?auto_803343 ) ( LIFTING ?auto_803345 ?auto_803344 ) ( IS-CRATE ?auto_803344 ) ( not ( = ?auto_803343 ?auto_803344 ) ) ( ON ?auto_803337 ?auto_803336 ) ( ON ?auto_803338 ?auto_803337 ) ( ON ?auto_803340 ?auto_803338 ) ( ON ?auto_803339 ?auto_803340 ) ( ON ?auto_803341 ?auto_803339 ) ( ON ?auto_803342 ?auto_803341 ) ( ON ?auto_803343 ?auto_803342 ) ( not ( = ?auto_803336 ?auto_803337 ) ) ( not ( = ?auto_803336 ?auto_803338 ) ) ( not ( = ?auto_803336 ?auto_803340 ) ) ( not ( = ?auto_803336 ?auto_803339 ) ) ( not ( = ?auto_803336 ?auto_803341 ) ) ( not ( = ?auto_803336 ?auto_803342 ) ) ( not ( = ?auto_803336 ?auto_803343 ) ) ( not ( = ?auto_803336 ?auto_803344 ) ) ( not ( = ?auto_803337 ?auto_803338 ) ) ( not ( = ?auto_803337 ?auto_803340 ) ) ( not ( = ?auto_803337 ?auto_803339 ) ) ( not ( = ?auto_803337 ?auto_803341 ) ) ( not ( = ?auto_803337 ?auto_803342 ) ) ( not ( = ?auto_803337 ?auto_803343 ) ) ( not ( = ?auto_803337 ?auto_803344 ) ) ( not ( = ?auto_803338 ?auto_803340 ) ) ( not ( = ?auto_803338 ?auto_803339 ) ) ( not ( = ?auto_803338 ?auto_803341 ) ) ( not ( = ?auto_803338 ?auto_803342 ) ) ( not ( = ?auto_803338 ?auto_803343 ) ) ( not ( = ?auto_803338 ?auto_803344 ) ) ( not ( = ?auto_803340 ?auto_803339 ) ) ( not ( = ?auto_803340 ?auto_803341 ) ) ( not ( = ?auto_803340 ?auto_803342 ) ) ( not ( = ?auto_803340 ?auto_803343 ) ) ( not ( = ?auto_803340 ?auto_803344 ) ) ( not ( = ?auto_803339 ?auto_803341 ) ) ( not ( = ?auto_803339 ?auto_803342 ) ) ( not ( = ?auto_803339 ?auto_803343 ) ) ( not ( = ?auto_803339 ?auto_803344 ) ) ( not ( = ?auto_803341 ?auto_803342 ) ) ( not ( = ?auto_803341 ?auto_803343 ) ) ( not ( = ?auto_803341 ?auto_803344 ) ) ( not ( = ?auto_803342 ?auto_803343 ) ) ( not ( = ?auto_803342 ?auto_803344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_803343 ?auto_803344 )
      ( MAKE-8CRATE-VERIFY ?auto_803336 ?auto_803337 ?auto_803338 ?auto_803340 ?auto_803339 ?auto_803341 ?auto_803342 ?auto_803343 ?auto_803344 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803403 - SURFACE
      ?auto_803404 - SURFACE
      ?auto_803405 - SURFACE
      ?auto_803407 - SURFACE
      ?auto_803406 - SURFACE
      ?auto_803408 - SURFACE
      ?auto_803409 - SURFACE
      ?auto_803410 - SURFACE
      ?auto_803411 - SURFACE
    )
    :vars
    (
      ?auto_803413 - HOIST
      ?auto_803414 - PLACE
      ?auto_803412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_803413 ?auto_803414 ) ( SURFACE-AT ?auto_803410 ?auto_803414 ) ( CLEAR ?auto_803410 ) ( IS-CRATE ?auto_803411 ) ( not ( = ?auto_803410 ?auto_803411 ) ) ( TRUCK-AT ?auto_803412 ?auto_803414 ) ( AVAILABLE ?auto_803413 ) ( IN ?auto_803411 ?auto_803412 ) ( ON ?auto_803410 ?auto_803409 ) ( not ( = ?auto_803409 ?auto_803410 ) ) ( not ( = ?auto_803409 ?auto_803411 ) ) ( ON ?auto_803404 ?auto_803403 ) ( ON ?auto_803405 ?auto_803404 ) ( ON ?auto_803407 ?auto_803405 ) ( ON ?auto_803406 ?auto_803407 ) ( ON ?auto_803408 ?auto_803406 ) ( ON ?auto_803409 ?auto_803408 ) ( not ( = ?auto_803403 ?auto_803404 ) ) ( not ( = ?auto_803403 ?auto_803405 ) ) ( not ( = ?auto_803403 ?auto_803407 ) ) ( not ( = ?auto_803403 ?auto_803406 ) ) ( not ( = ?auto_803403 ?auto_803408 ) ) ( not ( = ?auto_803403 ?auto_803409 ) ) ( not ( = ?auto_803403 ?auto_803410 ) ) ( not ( = ?auto_803403 ?auto_803411 ) ) ( not ( = ?auto_803404 ?auto_803405 ) ) ( not ( = ?auto_803404 ?auto_803407 ) ) ( not ( = ?auto_803404 ?auto_803406 ) ) ( not ( = ?auto_803404 ?auto_803408 ) ) ( not ( = ?auto_803404 ?auto_803409 ) ) ( not ( = ?auto_803404 ?auto_803410 ) ) ( not ( = ?auto_803404 ?auto_803411 ) ) ( not ( = ?auto_803405 ?auto_803407 ) ) ( not ( = ?auto_803405 ?auto_803406 ) ) ( not ( = ?auto_803405 ?auto_803408 ) ) ( not ( = ?auto_803405 ?auto_803409 ) ) ( not ( = ?auto_803405 ?auto_803410 ) ) ( not ( = ?auto_803405 ?auto_803411 ) ) ( not ( = ?auto_803407 ?auto_803406 ) ) ( not ( = ?auto_803407 ?auto_803408 ) ) ( not ( = ?auto_803407 ?auto_803409 ) ) ( not ( = ?auto_803407 ?auto_803410 ) ) ( not ( = ?auto_803407 ?auto_803411 ) ) ( not ( = ?auto_803406 ?auto_803408 ) ) ( not ( = ?auto_803406 ?auto_803409 ) ) ( not ( = ?auto_803406 ?auto_803410 ) ) ( not ( = ?auto_803406 ?auto_803411 ) ) ( not ( = ?auto_803408 ?auto_803409 ) ) ( not ( = ?auto_803408 ?auto_803410 ) ) ( not ( = ?auto_803408 ?auto_803411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803409 ?auto_803410 ?auto_803411 )
      ( MAKE-8CRATE-VERIFY ?auto_803403 ?auto_803404 ?auto_803405 ?auto_803407 ?auto_803406 ?auto_803408 ?auto_803409 ?auto_803410 ?auto_803411 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803479 - SURFACE
      ?auto_803480 - SURFACE
      ?auto_803481 - SURFACE
      ?auto_803483 - SURFACE
      ?auto_803482 - SURFACE
      ?auto_803484 - SURFACE
      ?auto_803485 - SURFACE
      ?auto_803486 - SURFACE
      ?auto_803487 - SURFACE
    )
    :vars
    (
      ?auto_803489 - HOIST
      ?auto_803488 - PLACE
      ?auto_803491 - TRUCK
      ?auto_803490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_803489 ?auto_803488 ) ( SURFACE-AT ?auto_803486 ?auto_803488 ) ( CLEAR ?auto_803486 ) ( IS-CRATE ?auto_803487 ) ( not ( = ?auto_803486 ?auto_803487 ) ) ( AVAILABLE ?auto_803489 ) ( IN ?auto_803487 ?auto_803491 ) ( ON ?auto_803486 ?auto_803485 ) ( not ( = ?auto_803485 ?auto_803486 ) ) ( not ( = ?auto_803485 ?auto_803487 ) ) ( TRUCK-AT ?auto_803491 ?auto_803490 ) ( not ( = ?auto_803490 ?auto_803488 ) ) ( ON ?auto_803480 ?auto_803479 ) ( ON ?auto_803481 ?auto_803480 ) ( ON ?auto_803483 ?auto_803481 ) ( ON ?auto_803482 ?auto_803483 ) ( ON ?auto_803484 ?auto_803482 ) ( ON ?auto_803485 ?auto_803484 ) ( not ( = ?auto_803479 ?auto_803480 ) ) ( not ( = ?auto_803479 ?auto_803481 ) ) ( not ( = ?auto_803479 ?auto_803483 ) ) ( not ( = ?auto_803479 ?auto_803482 ) ) ( not ( = ?auto_803479 ?auto_803484 ) ) ( not ( = ?auto_803479 ?auto_803485 ) ) ( not ( = ?auto_803479 ?auto_803486 ) ) ( not ( = ?auto_803479 ?auto_803487 ) ) ( not ( = ?auto_803480 ?auto_803481 ) ) ( not ( = ?auto_803480 ?auto_803483 ) ) ( not ( = ?auto_803480 ?auto_803482 ) ) ( not ( = ?auto_803480 ?auto_803484 ) ) ( not ( = ?auto_803480 ?auto_803485 ) ) ( not ( = ?auto_803480 ?auto_803486 ) ) ( not ( = ?auto_803480 ?auto_803487 ) ) ( not ( = ?auto_803481 ?auto_803483 ) ) ( not ( = ?auto_803481 ?auto_803482 ) ) ( not ( = ?auto_803481 ?auto_803484 ) ) ( not ( = ?auto_803481 ?auto_803485 ) ) ( not ( = ?auto_803481 ?auto_803486 ) ) ( not ( = ?auto_803481 ?auto_803487 ) ) ( not ( = ?auto_803483 ?auto_803482 ) ) ( not ( = ?auto_803483 ?auto_803484 ) ) ( not ( = ?auto_803483 ?auto_803485 ) ) ( not ( = ?auto_803483 ?auto_803486 ) ) ( not ( = ?auto_803483 ?auto_803487 ) ) ( not ( = ?auto_803482 ?auto_803484 ) ) ( not ( = ?auto_803482 ?auto_803485 ) ) ( not ( = ?auto_803482 ?auto_803486 ) ) ( not ( = ?auto_803482 ?auto_803487 ) ) ( not ( = ?auto_803484 ?auto_803485 ) ) ( not ( = ?auto_803484 ?auto_803486 ) ) ( not ( = ?auto_803484 ?auto_803487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803485 ?auto_803486 ?auto_803487 )
      ( MAKE-8CRATE-VERIFY ?auto_803479 ?auto_803480 ?auto_803481 ?auto_803483 ?auto_803482 ?auto_803484 ?auto_803485 ?auto_803486 ?auto_803487 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803563 - SURFACE
      ?auto_803564 - SURFACE
      ?auto_803565 - SURFACE
      ?auto_803567 - SURFACE
      ?auto_803566 - SURFACE
      ?auto_803568 - SURFACE
      ?auto_803569 - SURFACE
      ?auto_803570 - SURFACE
      ?auto_803571 - SURFACE
    )
    :vars
    (
      ?auto_803573 - HOIST
      ?auto_803575 - PLACE
      ?auto_803576 - TRUCK
      ?auto_803574 - PLACE
      ?auto_803572 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_803573 ?auto_803575 ) ( SURFACE-AT ?auto_803570 ?auto_803575 ) ( CLEAR ?auto_803570 ) ( IS-CRATE ?auto_803571 ) ( not ( = ?auto_803570 ?auto_803571 ) ) ( AVAILABLE ?auto_803573 ) ( ON ?auto_803570 ?auto_803569 ) ( not ( = ?auto_803569 ?auto_803570 ) ) ( not ( = ?auto_803569 ?auto_803571 ) ) ( TRUCK-AT ?auto_803576 ?auto_803574 ) ( not ( = ?auto_803574 ?auto_803575 ) ) ( HOIST-AT ?auto_803572 ?auto_803574 ) ( LIFTING ?auto_803572 ?auto_803571 ) ( not ( = ?auto_803573 ?auto_803572 ) ) ( ON ?auto_803564 ?auto_803563 ) ( ON ?auto_803565 ?auto_803564 ) ( ON ?auto_803567 ?auto_803565 ) ( ON ?auto_803566 ?auto_803567 ) ( ON ?auto_803568 ?auto_803566 ) ( ON ?auto_803569 ?auto_803568 ) ( not ( = ?auto_803563 ?auto_803564 ) ) ( not ( = ?auto_803563 ?auto_803565 ) ) ( not ( = ?auto_803563 ?auto_803567 ) ) ( not ( = ?auto_803563 ?auto_803566 ) ) ( not ( = ?auto_803563 ?auto_803568 ) ) ( not ( = ?auto_803563 ?auto_803569 ) ) ( not ( = ?auto_803563 ?auto_803570 ) ) ( not ( = ?auto_803563 ?auto_803571 ) ) ( not ( = ?auto_803564 ?auto_803565 ) ) ( not ( = ?auto_803564 ?auto_803567 ) ) ( not ( = ?auto_803564 ?auto_803566 ) ) ( not ( = ?auto_803564 ?auto_803568 ) ) ( not ( = ?auto_803564 ?auto_803569 ) ) ( not ( = ?auto_803564 ?auto_803570 ) ) ( not ( = ?auto_803564 ?auto_803571 ) ) ( not ( = ?auto_803565 ?auto_803567 ) ) ( not ( = ?auto_803565 ?auto_803566 ) ) ( not ( = ?auto_803565 ?auto_803568 ) ) ( not ( = ?auto_803565 ?auto_803569 ) ) ( not ( = ?auto_803565 ?auto_803570 ) ) ( not ( = ?auto_803565 ?auto_803571 ) ) ( not ( = ?auto_803567 ?auto_803566 ) ) ( not ( = ?auto_803567 ?auto_803568 ) ) ( not ( = ?auto_803567 ?auto_803569 ) ) ( not ( = ?auto_803567 ?auto_803570 ) ) ( not ( = ?auto_803567 ?auto_803571 ) ) ( not ( = ?auto_803566 ?auto_803568 ) ) ( not ( = ?auto_803566 ?auto_803569 ) ) ( not ( = ?auto_803566 ?auto_803570 ) ) ( not ( = ?auto_803566 ?auto_803571 ) ) ( not ( = ?auto_803568 ?auto_803569 ) ) ( not ( = ?auto_803568 ?auto_803570 ) ) ( not ( = ?auto_803568 ?auto_803571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803569 ?auto_803570 ?auto_803571 )
      ( MAKE-8CRATE-VERIFY ?auto_803563 ?auto_803564 ?auto_803565 ?auto_803567 ?auto_803566 ?auto_803568 ?auto_803569 ?auto_803570 ?auto_803571 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803655 - SURFACE
      ?auto_803656 - SURFACE
      ?auto_803657 - SURFACE
      ?auto_803659 - SURFACE
      ?auto_803658 - SURFACE
      ?auto_803660 - SURFACE
      ?auto_803661 - SURFACE
      ?auto_803662 - SURFACE
      ?auto_803663 - SURFACE
    )
    :vars
    (
      ?auto_803668 - HOIST
      ?auto_803664 - PLACE
      ?auto_803667 - TRUCK
      ?auto_803669 - PLACE
      ?auto_803666 - HOIST
      ?auto_803665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_803668 ?auto_803664 ) ( SURFACE-AT ?auto_803662 ?auto_803664 ) ( CLEAR ?auto_803662 ) ( IS-CRATE ?auto_803663 ) ( not ( = ?auto_803662 ?auto_803663 ) ) ( AVAILABLE ?auto_803668 ) ( ON ?auto_803662 ?auto_803661 ) ( not ( = ?auto_803661 ?auto_803662 ) ) ( not ( = ?auto_803661 ?auto_803663 ) ) ( TRUCK-AT ?auto_803667 ?auto_803669 ) ( not ( = ?auto_803669 ?auto_803664 ) ) ( HOIST-AT ?auto_803666 ?auto_803669 ) ( not ( = ?auto_803668 ?auto_803666 ) ) ( AVAILABLE ?auto_803666 ) ( SURFACE-AT ?auto_803663 ?auto_803669 ) ( ON ?auto_803663 ?auto_803665 ) ( CLEAR ?auto_803663 ) ( not ( = ?auto_803662 ?auto_803665 ) ) ( not ( = ?auto_803663 ?auto_803665 ) ) ( not ( = ?auto_803661 ?auto_803665 ) ) ( ON ?auto_803656 ?auto_803655 ) ( ON ?auto_803657 ?auto_803656 ) ( ON ?auto_803659 ?auto_803657 ) ( ON ?auto_803658 ?auto_803659 ) ( ON ?auto_803660 ?auto_803658 ) ( ON ?auto_803661 ?auto_803660 ) ( not ( = ?auto_803655 ?auto_803656 ) ) ( not ( = ?auto_803655 ?auto_803657 ) ) ( not ( = ?auto_803655 ?auto_803659 ) ) ( not ( = ?auto_803655 ?auto_803658 ) ) ( not ( = ?auto_803655 ?auto_803660 ) ) ( not ( = ?auto_803655 ?auto_803661 ) ) ( not ( = ?auto_803655 ?auto_803662 ) ) ( not ( = ?auto_803655 ?auto_803663 ) ) ( not ( = ?auto_803655 ?auto_803665 ) ) ( not ( = ?auto_803656 ?auto_803657 ) ) ( not ( = ?auto_803656 ?auto_803659 ) ) ( not ( = ?auto_803656 ?auto_803658 ) ) ( not ( = ?auto_803656 ?auto_803660 ) ) ( not ( = ?auto_803656 ?auto_803661 ) ) ( not ( = ?auto_803656 ?auto_803662 ) ) ( not ( = ?auto_803656 ?auto_803663 ) ) ( not ( = ?auto_803656 ?auto_803665 ) ) ( not ( = ?auto_803657 ?auto_803659 ) ) ( not ( = ?auto_803657 ?auto_803658 ) ) ( not ( = ?auto_803657 ?auto_803660 ) ) ( not ( = ?auto_803657 ?auto_803661 ) ) ( not ( = ?auto_803657 ?auto_803662 ) ) ( not ( = ?auto_803657 ?auto_803663 ) ) ( not ( = ?auto_803657 ?auto_803665 ) ) ( not ( = ?auto_803659 ?auto_803658 ) ) ( not ( = ?auto_803659 ?auto_803660 ) ) ( not ( = ?auto_803659 ?auto_803661 ) ) ( not ( = ?auto_803659 ?auto_803662 ) ) ( not ( = ?auto_803659 ?auto_803663 ) ) ( not ( = ?auto_803659 ?auto_803665 ) ) ( not ( = ?auto_803658 ?auto_803660 ) ) ( not ( = ?auto_803658 ?auto_803661 ) ) ( not ( = ?auto_803658 ?auto_803662 ) ) ( not ( = ?auto_803658 ?auto_803663 ) ) ( not ( = ?auto_803658 ?auto_803665 ) ) ( not ( = ?auto_803660 ?auto_803661 ) ) ( not ( = ?auto_803660 ?auto_803662 ) ) ( not ( = ?auto_803660 ?auto_803663 ) ) ( not ( = ?auto_803660 ?auto_803665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803661 ?auto_803662 ?auto_803663 )
      ( MAKE-8CRATE-VERIFY ?auto_803655 ?auto_803656 ?auto_803657 ?auto_803659 ?auto_803658 ?auto_803660 ?auto_803661 ?auto_803662 ?auto_803663 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803748 - SURFACE
      ?auto_803749 - SURFACE
      ?auto_803750 - SURFACE
      ?auto_803752 - SURFACE
      ?auto_803751 - SURFACE
      ?auto_803753 - SURFACE
      ?auto_803754 - SURFACE
      ?auto_803755 - SURFACE
      ?auto_803756 - SURFACE
    )
    :vars
    (
      ?auto_803761 - HOIST
      ?auto_803762 - PLACE
      ?auto_803759 - PLACE
      ?auto_803760 - HOIST
      ?auto_803757 - SURFACE
      ?auto_803758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_803761 ?auto_803762 ) ( SURFACE-AT ?auto_803755 ?auto_803762 ) ( CLEAR ?auto_803755 ) ( IS-CRATE ?auto_803756 ) ( not ( = ?auto_803755 ?auto_803756 ) ) ( AVAILABLE ?auto_803761 ) ( ON ?auto_803755 ?auto_803754 ) ( not ( = ?auto_803754 ?auto_803755 ) ) ( not ( = ?auto_803754 ?auto_803756 ) ) ( not ( = ?auto_803759 ?auto_803762 ) ) ( HOIST-AT ?auto_803760 ?auto_803759 ) ( not ( = ?auto_803761 ?auto_803760 ) ) ( AVAILABLE ?auto_803760 ) ( SURFACE-AT ?auto_803756 ?auto_803759 ) ( ON ?auto_803756 ?auto_803757 ) ( CLEAR ?auto_803756 ) ( not ( = ?auto_803755 ?auto_803757 ) ) ( not ( = ?auto_803756 ?auto_803757 ) ) ( not ( = ?auto_803754 ?auto_803757 ) ) ( TRUCK-AT ?auto_803758 ?auto_803762 ) ( ON ?auto_803749 ?auto_803748 ) ( ON ?auto_803750 ?auto_803749 ) ( ON ?auto_803752 ?auto_803750 ) ( ON ?auto_803751 ?auto_803752 ) ( ON ?auto_803753 ?auto_803751 ) ( ON ?auto_803754 ?auto_803753 ) ( not ( = ?auto_803748 ?auto_803749 ) ) ( not ( = ?auto_803748 ?auto_803750 ) ) ( not ( = ?auto_803748 ?auto_803752 ) ) ( not ( = ?auto_803748 ?auto_803751 ) ) ( not ( = ?auto_803748 ?auto_803753 ) ) ( not ( = ?auto_803748 ?auto_803754 ) ) ( not ( = ?auto_803748 ?auto_803755 ) ) ( not ( = ?auto_803748 ?auto_803756 ) ) ( not ( = ?auto_803748 ?auto_803757 ) ) ( not ( = ?auto_803749 ?auto_803750 ) ) ( not ( = ?auto_803749 ?auto_803752 ) ) ( not ( = ?auto_803749 ?auto_803751 ) ) ( not ( = ?auto_803749 ?auto_803753 ) ) ( not ( = ?auto_803749 ?auto_803754 ) ) ( not ( = ?auto_803749 ?auto_803755 ) ) ( not ( = ?auto_803749 ?auto_803756 ) ) ( not ( = ?auto_803749 ?auto_803757 ) ) ( not ( = ?auto_803750 ?auto_803752 ) ) ( not ( = ?auto_803750 ?auto_803751 ) ) ( not ( = ?auto_803750 ?auto_803753 ) ) ( not ( = ?auto_803750 ?auto_803754 ) ) ( not ( = ?auto_803750 ?auto_803755 ) ) ( not ( = ?auto_803750 ?auto_803756 ) ) ( not ( = ?auto_803750 ?auto_803757 ) ) ( not ( = ?auto_803752 ?auto_803751 ) ) ( not ( = ?auto_803752 ?auto_803753 ) ) ( not ( = ?auto_803752 ?auto_803754 ) ) ( not ( = ?auto_803752 ?auto_803755 ) ) ( not ( = ?auto_803752 ?auto_803756 ) ) ( not ( = ?auto_803752 ?auto_803757 ) ) ( not ( = ?auto_803751 ?auto_803753 ) ) ( not ( = ?auto_803751 ?auto_803754 ) ) ( not ( = ?auto_803751 ?auto_803755 ) ) ( not ( = ?auto_803751 ?auto_803756 ) ) ( not ( = ?auto_803751 ?auto_803757 ) ) ( not ( = ?auto_803753 ?auto_803754 ) ) ( not ( = ?auto_803753 ?auto_803755 ) ) ( not ( = ?auto_803753 ?auto_803756 ) ) ( not ( = ?auto_803753 ?auto_803757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803754 ?auto_803755 ?auto_803756 )
      ( MAKE-8CRATE-VERIFY ?auto_803748 ?auto_803749 ?auto_803750 ?auto_803752 ?auto_803751 ?auto_803753 ?auto_803754 ?auto_803755 ?auto_803756 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803841 - SURFACE
      ?auto_803842 - SURFACE
      ?auto_803843 - SURFACE
      ?auto_803845 - SURFACE
      ?auto_803844 - SURFACE
      ?auto_803846 - SURFACE
      ?auto_803847 - SURFACE
      ?auto_803848 - SURFACE
      ?auto_803849 - SURFACE
    )
    :vars
    (
      ?auto_803853 - HOIST
      ?auto_803854 - PLACE
      ?auto_803850 - PLACE
      ?auto_803851 - HOIST
      ?auto_803855 - SURFACE
      ?auto_803852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_803853 ?auto_803854 ) ( IS-CRATE ?auto_803849 ) ( not ( = ?auto_803848 ?auto_803849 ) ) ( not ( = ?auto_803847 ?auto_803848 ) ) ( not ( = ?auto_803847 ?auto_803849 ) ) ( not ( = ?auto_803850 ?auto_803854 ) ) ( HOIST-AT ?auto_803851 ?auto_803850 ) ( not ( = ?auto_803853 ?auto_803851 ) ) ( AVAILABLE ?auto_803851 ) ( SURFACE-AT ?auto_803849 ?auto_803850 ) ( ON ?auto_803849 ?auto_803855 ) ( CLEAR ?auto_803849 ) ( not ( = ?auto_803848 ?auto_803855 ) ) ( not ( = ?auto_803849 ?auto_803855 ) ) ( not ( = ?auto_803847 ?auto_803855 ) ) ( TRUCK-AT ?auto_803852 ?auto_803854 ) ( SURFACE-AT ?auto_803847 ?auto_803854 ) ( CLEAR ?auto_803847 ) ( LIFTING ?auto_803853 ?auto_803848 ) ( IS-CRATE ?auto_803848 ) ( ON ?auto_803842 ?auto_803841 ) ( ON ?auto_803843 ?auto_803842 ) ( ON ?auto_803845 ?auto_803843 ) ( ON ?auto_803844 ?auto_803845 ) ( ON ?auto_803846 ?auto_803844 ) ( ON ?auto_803847 ?auto_803846 ) ( not ( = ?auto_803841 ?auto_803842 ) ) ( not ( = ?auto_803841 ?auto_803843 ) ) ( not ( = ?auto_803841 ?auto_803845 ) ) ( not ( = ?auto_803841 ?auto_803844 ) ) ( not ( = ?auto_803841 ?auto_803846 ) ) ( not ( = ?auto_803841 ?auto_803847 ) ) ( not ( = ?auto_803841 ?auto_803848 ) ) ( not ( = ?auto_803841 ?auto_803849 ) ) ( not ( = ?auto_803841 ?auto_803855 ) ) ( not ( = ?auto_803842 ?auto_803843 ) ) ( not ( = ?auto_803842 ?auto_803845 ) ) ( not ( = ?auto_803842 ?auto_803844 ) ) ( not ( = ?auto_803842 ?auto_803846 ) ) ( not ( = ?auto_803842 ?auto_803847 ) ) ( not ( = ?auto_803842 ?auto_803848 ) ) ( not ( = ?auto_803842 ?auto_803849 ) ) ( not ( = ?auto_803842 ?auto_803855 ) ) ( not ( = ?auto_803843 ?auto_803845 ) ) ( not ( = ?auto_803843 ?auto_803844 ) ) ( not ( = ?auto_803843 ?auto_803846 ) ) ( not ( = ?auto_803843 ?auto_803847 ) ) ( not ( = ?auto_803843 ?auto_803848 ) ) ( not ( = ?auto_803843 ?auto_803849 ) ) ( not ( = ?auto_803843 ?auto_803855 ) ) ( not ( = ?auto_803845 ?auto_803844 ) ) ( not ( = ?auto_803845 ?auto_803846 ) ) ( not ( = ?auto_803845 ?auto_803847 ) ) ( not ( = ?auto_803845 ?auto_803848 ) ) ( not ( = ?auto_803845 ?auto_803849 ) ) ( not ( = ?auto_803845 ?auto_803855 ) ) ( not ( = ?auto_803844 ?auto_803846 ) ) ( not ( = ?auto_803844 ?auto_803847 ) ) ( not ( = ?auto_803844 ?auto_803848 ) ) ( not ( = ?auto_803844 ?auto_803849 ) ) ( not ( = ?auto_803844 ?auto_803855 ) ) ( not ( = ?auto_803846 ?auto_803847 ) ) ( not ( = ?auto_803846 ?auto_803848 ) ) ( not ( = ?auto_803846 ?auto_803849 ) ) ( not ( = ?auto_803846 ?auto_803855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803847 ?auto_803848 ?auto_803849 )
      ( MAKE-8CRATE-VERIFY ?auto_803841 ?auto_803842 ?auto_803843 ?auto_803845 ?auto_803844 ?auto_803846 ?auto_803847 ?auto_803848 ?auto_803849 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_803934 - SURFACE
      ?auto_803935 - SURFACE
      ?auto_803936 - SURFACE
      ?auto_803938 - SURFACE
      ?auto_803937 - SURFACE
      ?auto_803939 - SURFACE
      ?auto_803940 - SURFACE
      ?auto_803941 - SURFACE
      ?auto_803942 - SURFACE
    )
    :vars
    (
      ?auto_803947 - HOIST
      ?auto_803943 - PLACE
      ?auto_803945 - PLACE
      ?auto_803946 - HOIST
      ?auto_803944 - SURFACE
      ?auto_803948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_803947 ?auto_803943 ) ( IS-CRATE ?auto_803942 ) ( not ( = ?auto_803941 ?auto_803942 ) ) ( not ( = ?auto_803940 ?auto_803941 ) ) ( not ( = ?auto_803940 ?auto_803942 ) ) ( not ( = ?auto_803945 ?auto_803943 ) ) ( HOIST-AT ?auto_803946 ?auto_803945 ) ( not ( = ?auto_803947 ?auto_803946 ) ) ( AVAILABLE ?auto_803946 ) ( SURFACE-AT ?auto_803942 ?auto_803945 ) ( ON ?auto_803942 ?auto_803944 ) ( CLEAR ?auto_803942 ) ( not ( = ?auto_803941 ?auto_803944 ) ) ( not ( = ?auto_803942 ?auto_803944 ) ) ( not ( = ?auto_803940 ?auto_803944 ) ) ( TRUCK-AT ?auto_803948 ?auto_803943 ) ( SURFACE-AT ?auto_803940 ?auto_803943 ) ( CLEAR ?auto_803940 ) ( IS-CRATE ?auto_803941 ) ( AVAILABLE ?auto_803947 ) ( IN ?auto_803941 ?auto_803948 ) ( ON ?auto_803935 ?auto_803934 ) ( ON ?auto_803936 ?auto_803935 ) ( ON ?auto_803938 ?auto_803936 ) ( ON ?auto_803937 ?auto_803938 ) ( ON ?auto_803939 ?auto_803937 ) ( ON ?auto_803940 ?auto_803939 ) ( not ( = ?auto_803934 ?auto_803935 ) ) ( not ( = ?auto_803934 ?auto_803936 ) ) ( not ( = ?auto_803934 ?auto_803938 ) ) ( not ( = ?auto_803934 ?auto_803937 ) ) ( not ( = ?auto_803934 ?auto_803939 ) ) ( not ( = ?auto_803934 ?auto_803940 ) ) ( not ( = ?auto_803934 ?auto_803941 ) ) ( not ( = ?auto_803934 ?auto_803942 ) ) ( not ( = ?auto_803934 ?auto_803944 ) ) ( not ( = ?auto_803935 ?auto_803936 ) ) ( not ( = ?auto_803935 ?auto_803938 ) ) ( not ( = ?auto_803935 ?auto_803937 ) ) ( not ( = ?auto_803935 ?auto_803939 ) ) ( not ( = ?auto_803935 ?auto_803940 ) ) ( not ( = ?auto_803935 ?auto_803941 ) ) ( not ( = ?auto_803935 ?auto_803942 ) ) ( not ( = ?auto_803935 ?auto_803944 ) ) ( not ( = ?auto_803936 ?auto_803938 ) ) ( not ( = ?auto_803936 ?auto_803937 ) ) ( not ( = ?auto_803936 ?auto_803939 ) ) ( not ( = ?auto_803936 ?auto_803940 ) ) ( not ( = ?auto_803936 ?auto_803941 ) ) ( not ( = ?auto_803936 ?auto_803942 ) ) ( not ( = ?auto_803936 ?auto_803944 ) ) ( not ( = ?auto_803938 ?auto_803937 ) ) ( not ( = ?auto_803938 ?auto_803939 ) ) ( not ( = ?auto_803938 ?auto_803940 ) ) ( not ( = ?auto_803938 ?auto_803941 ) ) ( not ( = ?auto_803938 ?auto_803942 ) ) ( not ( = ?auto_803938 ?auto_803944 ) ) ( not ( = ?auto_803937 ?auto_803939 ) ) ( not ( = ?auto_803937 ?auto_803940 ) ) ( not ( = ?auto_803937 ?auto_803941 ) ) ( not ( = ?auto_803937 ?auto_803942 ) ) ( not ( = ?auto_803937 ?auto_803944 ) ) ( not ( = ?auto_803939 ?auto_803940 ) ) ( not ( = ?auto_803939 ?auto_803941 ) ) ( not ( = ?auto_803939 ?auto_803942 ) ) ( not ( = ?auto_803939 ?auto_803944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_803940 ?auto_803941 ?auto_803942 )
      ( MAKE-8CRATE-VERIFY ?auto_803934 ?auto_803935 ?auto_803936 ?auto_803938 ?auto_803937 ?auto_803939 ?auto_803940 ?auto_803941 ?auto_803942 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808012 - SURFACE
      ?auto_808013 - SURFACE
      ?auto_808014 - SURFACE
      ?auto_808016 - SURFACE
      ?auto_808015 - SURFACE
      ?auto_808017 - SURFACE
      ?auto_808018 - SURFACE
      ?auto_808019 - SURFACE
      ?auto_808020 - SURFACE
      ?auto_808021 - SURFACE
    )
    :vars
    (
      ?auto_808022 - HOIST
      ?auto_808023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808022 ?auto_808023 ) ( SURFACE-AT ?auto_808020 ?auto_808023 ) ( CLEAR ?auto_808020 ) ( LIFTING ?auto_808022 ?auto_808021 ) ( IS-CRATE ?auto_808021 ) ( not ( = ?auto_808020 ?auto_808021 ) ) ( ON ?auto_808013 ?auto_808012 ) ( ON ?auto_808014 ?auto_808013 ) ( ON ?auto_808016 ?auto_808014 ) ( ON ?auto_808015 ?auto_808016 ) ( ON ?auto_808017 ?auto_808015 ) ( ON ?auto_808018 ?auto_808017 ) ( ON ?auto_808019 ?auto_808018 ) ( ON ?auto_808020 ?auto_808019 ) ( not ( = ?auto_808012 ?auto_808013 ) ) ( not ( = ?auto_808012 ?auto_808014 ) ) ( not ( = ?auto_808012 ?auto_808016 ) ) ( not ( = ?auto_808012 ?auto_808015 ) ) ( not ( = ?auto_808012 ?auto_808017 ) ) ( not ( = ?auto_808012 ?auto_808018 ) ) ( not ( = ?auto_808012 ?auto_808019 ) ) ( not ( = ?auto_808012 ?auto_808020 ) ) ( not ( = ?auto_808012 ?auto_808021 ) ) ( not ( = ?auto_808013 ?auto_808014 ) ) ( not ( = ?auto_808013 ?auto_808016 ) ) ( not ( = ?auto_808013 ?auto_808015 ) ) ( not ( = ?auto_808013 ?auto_808017 ) ) ( not ( = ?auto_808013 ?auto_808018 ) ) ( not ( = ?auto_808013 ?auto_808019 ) ) ( not ( = ?auto_808013 ?auto_808020 ) ) ( not ( = ?auto_808013 ?auto_808021 ) ) ( not ( = ?auto_808014 ?auto_808016 ) ) ( not ( = ?auto_808014 ?auto_808015 ) ) ( not ( = ?auto_808014 ?auto_808017 ) ) ( not ( = ?auto_808014 ?auto_808018 ) ) ( not ( = ?auto_808014 ?auto_808019 ) ) ( not ( = ?auto_808014 ?auto_808020 ) ) ( not ( = ?auto_808014 ?auto_808021 ) ) ( not ( = ?auto_808016 ?auto_808015 ) ) ( not ( = ?auto_808016 ?auto_808017 ) ) ( not ( = ?auto_808016 ?auto_808018 ) ) ( not ( = ?auto_808016 ?auto_808019 ) ) ( not ( = ?auto_808016 ?auto_808020 ) ) ( not ( = ?auto_808016 ?auto_808021 ) ) ( not ( = ?auto_808015 ?auto_808017 ) ) ( not ( = ?auto_808015 ?auto_808018 ) ) ( not ( = ?auto_808015 ?auto_808019 ) ) ( not ( = ?auto_808015 ?auto_808020 ) ) ( not ( = ?auto_808015 ?auto_808021 ) ) ( not ( = ?auto_808017 ?auto_808018 ) ) ( not ( = ?auto_808017 ?auto_808019 ) ) ( not ( = ?auto_808017 ?auto_808020 ) ) ( not ( = ?auto_808017 ?auto_808021 ) ) ( not ( = ?auto_808018 ?auto_808019 ) ) ( not ( = ?auto_808018 ?auto_808020 ) ) ( not ( = ?auto_808018 ?auto_808021 ) ) ( not ( = ?auto_808019 ?auto_808020 ) ) ( not ( = ?auto_808019 ?auto_808021 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_808020 ?auto_808021 )
      ( MAKE-9CRATE-VERIFY ?auto_808012 ?auto_808013 ?auto_808014 ?auto_808016 ?auto_808015 ?auto_808017 ?auto_808018 ?auto_808019 ?auto_808020 ?auto_808021 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808092 - SURFACE
      ?auto_808093 - SURFACE
      ?auto_808094 - SURFACE
      ?auto_808096 - SURFACE
      ?auto_808095 - SURFACE
      ?auto_808097 - SURFACE
      ?auto_808098 - SURFACE
      ?auto_808099 - SURFACE
      ?auto_808100 - SURFACE
      ?auto_808101 - SURFACE
    )
    :vars
    (
      ?auto_808103 - HOIST
      ?auto_808102 - PLACE
      ?auto_808104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_808103 ?auto_808102 ) ( SURFACE-AT ?auto_808100 ?auto_808102 ) ( CLEAR ?auto_808100 ) ( IS-CRATE ?auto_808101 ) ( not ( = ?auto_808100 ?auto_808101 ) ) ( TRUCK-AT ?auto_808104 ?auto_808102 ) ( AVAILABLE ?auto_808103 ) ( IN ?auto_808101 ?auto_808104 ) ( ON ?auto_808100 ?auto_808099 ) ( not ( = ?auto_808099 ?auto_808100 ) ) ( not ( = ?auto_808099 ?auto_808101 ) ) ( ON ?auto_808093 ?auto_808092 ) ( ON ?auto_808094 ?auto_808093 ) ( ON ?auto_808096 ?auto_808094 ) ( ON ?auto_808095 ?auto_808096 ) ( ON ?auto_808097 ?auto_808095 ) ( ON ?auto_808098 ?auto_808097 ) ( ON ?auto_808099 ?auto_808098 ) ( not ( = ?auto_808092 ?auto_808093 ) ) ( not ( = ?auto_808092 ?auto_808094 ) ) ( not ( = ?auto_808092 ?auto_808096 ) ) ( not ( = ?auto_808092 ?auto_808095 ) ) ( not ( = ?auto_808092 ?auto_808097 ) ) ( not ( = ?auto_808092 ?auto_808098 ) ) ( not ( = ?auto_808092 ?auto_808099 ) ) ( not ( = ?auto_808092 ?auto_808100 ) ) ( not ( = ?auto_808092 ?auto_808101 ) ) ( not ( = ?auto_808093 ?auto_808094 ) ) ( not ( = ?auto_808093 ?auto_808096 ) ) ( not ( = ?auto_808093 ?auto_808095 ) ) ( not ( = ?auto_808093 ?auto_808097 ) ) ( not ( = ?auto_808093 ?auto_808098 ) ) ( not ( = ?auto_808093 ?auto_808099 ) ) ( not ( = ?auto_808093 ?auto_808100 ) ) ( not ( = ?auto_808093 ?auto_808101 ) ) ( not ( = ?auto_808094 ?auto_808096 ) ) ( not ( = ?auto_808094 ?auto_808095 ) ) ( not ( = ?auto_808094 ?auto_808097 ) ) ( not ( = ?auto_808094 ?auto_808098 ) ) ( not ( = ?auto_808094 ?auto_808099 ) ) ( not ( = ?auto_808094 ?auto_808100 ) ) ( not ( = ?auto_808094 ?auto_808101 ) ) ( not ( = ?auto_808096 ?auto_808095 ) ) ( not ( = ?auto_808096 ?auto_808097 ) ) ( not ( = ?auto_808096 ?auto_808098 ) ) ( not ( = ?auto_808096 ?auto_808099 ) ) ( not ( = ?auto_808096 ?auto_808100 ) ) ( not ( = ?auto_808096 ?auto_808101 ) ) ( not ( = ?auto_808095 ?auto_808097 ) ) ( not ( = ?auto_808095 ?auto_808098 ) ) ( not ( = ?auto_808095 ?auto_808099 ) ) ( not ( = ?auto_808095 ?auto_808100 ) ) ( not ( = ?auto_808095 ?auto_808101 ) ) ( not ( = ?auto_808097 ?auto_808098 ) ) ( not ( = ?auto_808097 ?auto_808099 ) ) ( not ( = ?auto_808097 ?auto_808100 ) ) ( not ( = ?auto_808097 ?auto_808101 ) ) ( not ( = ?auto_808098 ?auto_808099 ) ) ( not ( = ?auto_808098 ?auto_808100 ) ) ( not ( = ?auto_808098 ?auto_808101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808099 ?auto_808100 ?auto_808101 )
      ( MAKE-9CRATE-VERIFY ?auto_808092 ?auto_808093 ?auto_808094 ?auto_808096 ?auto_808095 ?auto_808097 ?auto_808098 ?auto_808099 ?auto_808100 ?auto_808101 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808182 - SURFACE
      ?auto_808183 - SURFACE
      ?auto_808184 - SURFACE
      ?auto_808186 - SURFACE
      ?auto_808185 - SURFACE
      ?auto_808187 - SURFACE
      ?auto_808188 - SURFACE
      ?auto_808189 - SURFACE
      ?auto_808190 - SURFACE
      ?auto_808191 - SURFACE
    )
    :vars
    (
      ?auto_808193 - HOIST
      ?auto_808192 - PLACE
      ?auto_808195 - TRUCK
      ?auto_808194 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808193 ?auto_808192 ) ( SURFACE-AT ?auto_808190 ?auto_808192 ) ( CLEAR ?auto_808190 ) ( IS-CRATE ?auto_808191 ) ( not ( = ?auto_808190 ?auto_808191 ) ) ( AVAILABLE ?auto_808193 ) ( IN ?auto_808191 ?auto_808195 ) ( ON ?auto_808190 ?auto_808189 ) ( not ( = ?auto_808189 ?auto_808190 ) ) ( not ( = ?auto_808189 ?auto_808191 ) ) ( TRUCK-AT ?auto_808195 ?auto_808194 ) ( not ( = ?auto_808194 ?auto_808192 ) ) ( ON ?auto_808183 ?auto_808182 ) ( ON ?auto_808184 ?auto_808183 ) ( ON ?auto_808186 ?auto_808184 ) ( ON ?auto_808185 ?auto_808186 ) ( ON ?auto_808187 ?auto_808185 ) ( ON ?auto_808188 ?auto_808187 ) ( ON ?auto_808189 ?auto_808188 ) ( not ( = ?auto_808182 ?auto_808183 ) ) ( not ( = ?auto_808182 ?auto_808184 ) ) ( not ( = ?auto_808182 ?auto_808186 ) ) ( not ( = ?auto_808182 ?auto_808185 ) ) ( not ( = ?auto_808182 ?auto_808187 ) ) ( not ( = ?auto_808182 ?auto_808188 ) ) ( not ( = ?auto_808182 ?auto_808189 ) ) ( not ( = ?auto_808182 ?auto_808190 ) ) ( not ( = ?auto_808182 ?auto_808191 ) ) ( not ( = ?auto_808183 ?auto_808184 ) ) ( not ( = ?auto_808183 ?auto_808186 ) ) ( not ( = ?auto_808183 ?auto_808185 ) ) ( not ( = ?auto_808183 ?auto_808187 ) ) ( not ( = ?auto_808183 ?auto_808188 ) ) ( not ( = ?auto_808183 ?auto_808189 ) ) ( not ( = ?auto_808183 ?auto_808190 ) ) ( not ( = ?auto_808183 ?auto_808191 ) ) ( not ( = ?auto_808184 ?auto_808186 ) ) ( not ( = ?auto_808184 ?auto_808185 ) ) ( not ( = ?auto_808184 ?auto_808187 ) ) ( not ( = ?auto_808184 ?auto_808188 ) ) ( not ( = ?auto_808184 ?auto_808189 ) ) ( not ( = ?auto_808184 ?auto_808190 ) ) ( not ( = ?auto_808184 ?auto_808191 ) ) ( not ( = ?auto_808186 ?auto_808185 ) ) ( not ( = ?auto_808186 ?auto_808187 ) ) ( not ( = ?auto_808186 ?auto_808188 ) ) ( not ( = ?auto_808186 ?auto_808189 ) ) ( not ( = ?auto_808186 ?auto_808190 ) ) ( not ( = ?auto_808186 ?auto_808191 ) ) ( not ( = ?auto_808185 ?auto_808187 ) ) ( not ( = ?auto_808185 ?auto_808188 ) ) ( not ( = ?auto_808185 ?auto_808189 ) ) ( not ( = ?auto_808185 ?auto_808190 ) ) ( not ( = ?auto_808185 ?auto_808191 ) ) ( not ( = ?auto_808187 ?auto_808188 ) ) ( not ( = ?auto_808187 ?auto_808189 ) ) ( not ( = ?auto_808187 ?auto_808190 ) ) ( not ( = ?auto_808187 ?auto_808191 ) ) ( not ( = ?auto_808188 ?auto_808189 ) ) ( not ( = ?auto_808188 ?auto_808190 ) ) ( not ( = ?auto_808188 ?auto_808191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808189 ?auto_808190 ?auto_808191 )
      ( MAKE-9CRATE-VERIFY ?auto_808182 ?auto_808183 ?auto_808184 ?auto_808186 ?auto_808185 ?auto_808187 ?auto_808188 ?auto_808189 ?auto_808190 ?auto_808191 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808281 - SURFACE
      ?auto_808282 - SURFACE
      ?auto_808283 - SURFACE
      ?auto_808285 - SURFACE
      ?auto_808284 - SURFACE
      ?auto_808286 - SURFACE
      ?auto_808287 - SURFACE
      ?auto_808288 - SURFACE
      ?auto_808289 - SURFACE
      ?auto_808290 - SURFACE
    )
    :vars
    (
      ?auto_808293 - HOIST
      ?auto_808292 - PLACE
      ?auto_808291 - TRUCK
      ?auto_808295 - PLACE
      ?auto_808294 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_808293 ?auto_808292 ) ( SURFACE-AT ?auto_808289 ?auto_808292 ) ( CLEAR ?auto_808289 ) ( IS-CRATE ?auto_808290 ) ( not ( = ?auto_808289 ?auto_808290 ) ) ( AVAILABLE ?auto_808293 ) ( ON ?auto_808289 ?auto_808288 ) ( not ( = ?auto_808288 ?auto_808289 ) ) ( not ( = ?auto_808288 ?auto_808290 ) ) ( TRUCK-AT ?auto_808291 ?auto_808295 ) ( not ( = ?auto_808295 ?auto_808292 ) ) ( HOIST-AT ?auto_808294 ?auto_808295 ) ( LIFTING ?auto_808294 ?auto_808290 ) ( not ( = ?auto_808293 ?auto_808294 ) ) ( ON ?auto_808282 ?auto_808281 ) ( ON ?auto_808283 ?auto_808282 ) ( ON ?auto_808285 ?auto_808283 ) ( ON ?auto_808284 ?auto_808285 ) ( ON ?auto_808286 ?auto_808284 ) ( ON ?auto_808287 ?auto_808286 ) ( ON ?auto_808288 ?auto_808287 ) ( not ( = ?auto_808281 ?auto_808282 ) ) ( not ( = ?auto_808281 ?auto_808283 ) ) ( not ( = ?auto_808281 ?auto_808285 ) ) ( not ( = ?auto_808281 ?auto_808284 ) ) ( not ( = ?auto_808281 ?auto_808286 ) ) ( not ( = ?auto_808281 ?auto_808287 ) ) ( not ( = ?auto_808281 ?auto_808288 ) ) ( not ( = ?auto_808281 ?auto_808289 ) ) ( not ( = ?auto_808281 ?auto_808290 ) ) ( not ( = ?auto_808282 ?auto_808283 ) ) ( not ( = ?auto_808282 ?auto_808285 ) ) ( not ( = ?auto_808282 ?auto_808284 ) ) ( not ( = ?auto_808282 ?auto_808286 ) ) ( not ( = ?auto_808282 ?auto_808287 ) ) ( not ( = ?auto_808282 ?auto_808288 ) ) ( not ( = ?auto_808282 ?auto_808289 ) ) ( not ( = ?auto_808282 ?auto_808290 ) ) ( not ( = ?auto_808283 ?auto_808285 ) ) ( not ( = ?auto_808283 ?auto_808284 ) ) ( not ( = ?auto_808283 ?auto_808286 ) ) ( not ( = ?auto_808283 ?auto_808287 ) ) ( not ( = ?auto_808283 ?auto_808288 ) ) ( not ( = ?auto_808283 ?auto_808289 ) ) ( not ( = ?auto_808283 ?auto_808290 ) ) ( not ( = ?auto_808285 ?auto_808284 ) ) ( not ( = ?auto_808285 ?auto_808286 ) ) ( not ( = ?auto_808285 ?auto_808287 ) ) ( not ( = ?auto_808285 ?auto_808288 ) ) ( not ( = ?auto_808285 ?auto_808289 ) ) ( not ( = ?auto_808285 ?auto_808290 ) ) ( not ( = ?auto_808284 ?auto_808286 ) ) ( not ( = ?auto_808284 ?auto_808287 ) ) ( not ( = ?auto_808284 ?auto_808288 ) ) ( not ( = ?auto_808284 ?auto_808289 ) ) ( not ( = ?auto_808284 ?auto_808290 ) ) ( not ( = ?auto_808286 ?auto_808287 ) ) ( not ( = ?auto_808286 ?auto_808288 ) ) ( not ( = ?auto_808286 ?auto_808289 ) ) ( not ( = ?auto_808286 ?auto_808290 ) ) ( not ( = ?auto_808287 ?auto_808288 ) ) ( not ( = ?auto_808287 ?auto_808289 ) ) ( not ( = ?auto_808287 ?auto_808290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808288 ?auto_808289 ?auto_808290 )
      ( MAKE-9CRATE-VERIFY ?auto_808281 ?auto_808282 ?auto_808283 ?auto_808285 ?auto_808284 ?auto_808286 ?auto_808287 ?auto_808288 ?auto_808289 ?auto_808290 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808389 - SURFACE
      ?auto_808390 - SURFACE
      ?auto_808391 - SURFACE
      ?auto_808393 - SURFACE
      ?auto_808392 - SURFACE
      ?auto_808394 - SURFACE
      ?auto_808395 - SURFACE
      ?auto_808396 - SURFACE
      ?auto_808397 - SURFACE
      ?auto_808398 - SURFACE
    )
    :vars
    (
      ?auto_808404 - HOIST
      ?auto_808400 - PLACE
      ?auto_808401 - TRUCK
      ?auto_808402 - PLACE
      ?auto_808399 - HOIST
      ?auto_808403 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_808404 ?auto_808400 ) ( SURFACE-AT ?auto_808397 ?auto_808400 ) ( CLEAR ?auto_808397 ) ( IS-CRATE ?auto_808398 ) ( not ( = ?auto_808397 ?auto_808398 ) ) ( AVAILABLE ?auto_808404 ) ( ON ?auto_808397 ?auto_808396 ) ( not ( = ?auto_808396 ?auto_808397 ) ) ( not ( = ?auto_808396 ?auto_808398 ) ) ( TRUCK-AT ?auto_808401 ?auto_808402 ) ( not ( = ?auto_808402 ?auto_808400 ) ) ( HOIST-AT ?auto_808399 ?auto_808402 ) ( not ( = ?auto_808404 ?auto_808399 ) ) ( AVAILABLE ?auto_808399 ) ( SURFACE-AT ?auto_808398 ?auto_808402 ) ( ON ?auto_808398 ?auto_808403 ) ( CLEAR ?auto_808398 ) ( not ( = ?auto_808397 ?auto_808403 ) ) ( not ( = ?auto_808398 ?auto_808403 ) ) ( not ( = ?auto_808396 ?auto_808403 ) ) ( ON ?auto_808390 ?auto_808389 ) ( ON ?auto_808391 ?auto_808390 ) ( ON ?auto_808393 ?auto_808391 ) ( ON ?auto_808392 ?auto_808393 ) ( ON ?auto_808394 ?auto_808392 ) ( ON ?auto_808395 ?auto_808394 ) ( ON ?auto_808396 ?auto_808395 ) ( not ( = ?auto_808389 ?auto_808390 ) ) ( not ( = ?auto_808389 ?auto_808391 ) ) ( not ( = ?auto_808389 ?auto_808393 ) ) ( not ( = ?auto_808389 ?auto_808392 ) ) ( not ( = ?auto_808389 ?auto_808394 ) ) ( not ( = ?auto_808389 ?auto_808395 ) ) ( not ( = ?auto_808389 ?auto_808396 ) ) ( not ( = ?auto_808389 ?auto_808397 ) ) ( not ( = ?auto_808389 ?auto_808398 ) ) ( not ( = ?auto_808389 ?auto_808403 ) ) ( not ( = ?auto_808390 ?auto_808391 ) ) ( not ( = ?auto_808390 ?auto_808393 ) ) ( not ( = ?auto_808390 ?auto_808392 ) ) ( not ( = ?auto_808390 ?auto_808394 ) ) ( not ( = ?auto_808390 ?auto_808395 ) ) ( not ( = ?auto_808390 ?auto_808396 ) ) ( not ( = ?auto_808390 ?auto_808397 ) ) ( not ( = ?auto_808390 ?auto_808398 ) ) ( not ( = ?auto_808390 ?auto_808403 ) ) ( not ( = ?auto_808391 ?auto_808393 ) ) ( not ( = ?auto_808391 ?auto_808392 ) ) ( not ( = ?auto_808391 ?auto_808394 ) ) ( not ( = ?auto_808391 ?auto_808395 ) ) ( not ( = ?auto_808391 ?auto_808396 ) ) ( not ( = ?auto_808391 ?auto_808397 ) ) ( not ( = ?auto_808391 ?auto_808398 ) ) ( not ( = ?auto_808391 ?auto_808403 ) ) ( not ( = ?auto_808393 ?auto_808392 ) ) ( not ( = ?auto_808393 ?auto_808394 ) ) ( not ( = ?auto_808393 ?auto_808395 ) ) ( not ( = ?auto_808393 ?auto_808396 ) ) ( not ( = ?auto_808393 ?auto_808397 ) ) ( not ( = ?auto_808393 ?auto_808398 ) ) ( not ( = ?auto_808393 ?auto_808403 ) ) ( not ( = ?auto_808392 ?auto_808394 ) ) ( not ( = ?auto_808392 ?auto_808395 ) ) ( not ( = ?auto_808392 ?auto_808396 ) ) ( not ( = ?auto_808392 ?auto_808397 ) ) ( not ( = ?auto_808392 ?auto_808398 ) ) ( not ( = ?auto_808392 ?auto_808403 ) ) ( not ( = ?auto_808394 ?auto_808395 ) ) ( not ( = ?auto_808394 ?auto_808396 ) ) ( not ( = ?auto_808394 ?auto_808397 ) ) ( not ( = ?auto_808394 ?auto_808398 ) ) ( not ( = ?auto_808394 ?auto_808403 ) ) ( not ( = ?auto_808395 ?auto_808396 ) ) ( not ( = ?auto_808395 ?auto_808397 ) ) ( not ( = ?auto_808395 ?auto_808398 ) ) ( not ( = ?auto_808395 ?auto_808403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808396 ?auto_808397 ?auto_808398 )
      ( MAKE-9CRATE-VERIFY ?auto_808389 ?auto_808390 ?auto_808391 ?auto_808393 ?auto_808392 ?auto_808394 ?auto_808395 ?auto_808396 ?auto_808397 ?auto_808398 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808498 - SURFACE
      ?auto_808499 - SURFACE
      ?auto_808500 - SURFACE
      ?auto_808502 - SURFACE
      ?auto_808501 - SURFACE
      ?auto_808503 - SURFACE
      ?auto_808504 - SURFACE
      ?auto_808505 - SURFACE
      ?auto_808506 - SURFACE
      ?auto_808507 - SURFACE
    )
    :vars
    (
      ?auto_808509 - HOIST
      ?auto_808512 - PLACE
      ?auto_808513 - PLACE
      ?auto_808511 - HOIST
      ?auto_808508 - SURFACE
      ?auto_808510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_808509 ?auto_808512 ) ( SURFACE-AT ?auto_808506 ?auto_808512 ) ( CLEAR ?auto_808506 ) ( IS-CRATE ?auto_808507 ) ( not ( = ?auto_808506 ?auto_808507 ) ) ( AVAILABLE ?auto_808509 ) ( ON ?auto_808506 ?auto_808505 ) ( not ( = ?auto_808505 ?auto_808506 ) ) ( not ( = ?auto_808505 ?auto_808507 ) ) ( not ( = ?auto_808513 ?auto_808512 ) ) ( HOIST-AT ?auto_808511 ?auto_808513 ) ( not ( = ?auto_808509 ?auto_808511 ) ) ( AVAILABLE ?auto_808511 ) ( SURFACE-AT ?auto_808507 ?auto_808513 ) ( ON ?auto_808507 ?auto_808508 ) ( CLEAR ?auto_808507 ) ( not ( = ?auto_808506 ?auto_808508 ) ) ( not ( = ?auto_808507 ?auto_808508 ) ) ( not ( = ?auto_808505 ?auto_808508 ) ) ( TRUCK-AT ?auto_808510 ?auto_808512 ) ( ON ?auto_808499 ?auto_808498 ) ( ON ?auto_808500 ?auto_808499 ) ( ON ?auto_808502 ?auto_808500 ) ( ON ?auto_808501 ?auto_808502 ) ( ON ?auto_808503 ?auto_808501 ) ( ON ?auto_808504 ?auto_808503 ) ( ON ?auto_808505 ?auto_808504 ) ( not ( = ?auto_808498 ?auto_808499 ) ) ( not ( = ?auto_808498 ?auto_808500 ) ) ( not ( = ?auto_808498 ?auto_808502 ) ) ( not ( = ?auto_808498 ?auto_808501 ) ) ( not ( = ?auto_808498 ?auto_808503 ) ) ( not ( = ?auto_808498 ?auto_808504 ) ) ( not ( = ?auto_808498 ?auto_808505 ) ) ( not ( = ?auto_808498 ?auto_808506 ) ) ( not ( = ?auto_808498 ?auto_808507 ) ) ( not ( = ?auto_808498 ?auto_808508 ) ) ( not ( = ?auto_808499 ?auto_808500 ) ) ( not ( = ?auto_808499 ?auto_808502 ) ) ( not ( = ?auto_808499 ?auto_808501 ) ) ( not ( = ?auto_808499 ?auto_808503 ) ) ( not ( = ?auto_808499 ?auto_808504 ) ) ( not ( = ?auto_808499 ?auto_808505 ) ) ( not ( = ?auto_808499 ?auto_808506 ) ) ( not ( = ?auto_808499 ?auto_808507 ) ) ( not ( = ?auto_808499 ?auto_808508 ) ) ( not ( = ?auto_808500 ?auto_808502 ) ) ( not ( = ?auto_808500 ?auto_808501 ) ) ( not ( = ?auto_808500 ?auto_808503 ) ) ( not ( = ?auto_808500 ?auto_808504 ) ) ( not ( = ?auto_808500 ?auto_808505 ) ) ( not ( = ?auto_808500 ?auto_808506 ) ) ( not ( = ?auto_808500 ?auto_808507 ) ) ( not ( = ?auto_808500 ?auto_808508 ) ) ( not ( = ?auto_808502 ?auto_808501 ) ) ( not ( = ?auto_808502 ?auto_808503 ) ) ( not ( = ?auto_808502 ?auto_808504 ) ) ( not ( = ?auto_808502 ?auto_808505 ) ) ( not ( = ?auto_808502 ?auto_808506 ) ) ( not ( = ?auto_808502 ?auto_808507 ) ) ( not ( = ?auto_808502 ?auto_808508 ) ) ( not ( = ?auto_808501 ?auto_808503 ) ) ( not ( = ?auto_808501 ?auto_808504 ) ) ( not ( = ?auto_808501 ?auto_808505 ) ) ( not ( = ?auto_808501 ?auto_808506 ) ) ( not ( = ?auto_808501 ?auto_808507 ) ) ( not ( = ?auto_808501 ?auto_808508 ) ) ( not ( = ?auto_808503 ?auto_808504 ) ) ( not ( = ?auto_808503 ?auto_808505 ) ) ( not ( = ?auto_808503 ?auto_808506 ) ) ( not ( = ?auto_808503 ?auto_808507 ) ) ( not ( = ?auto_808503 ?auto_808508 ) ) ( not ( = ?auto_808504 ?auto_808505 ) ) ( not ( = ?auto_808504 ?auto_808506 ) ) ( not ( = ?auto_808504 ?auto_808507 ) ) ( not ( = ?auto_808504 ?auto_808508 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808505 ?auto_808506 ?auto_808507 )
      ( MAKE-9CRATE-VERIFY ?auto_808498 ?auto_808499 ?auto_808500 ?auto_808502 ?auto_808501 ?auto_808503 ?auto_808504 ?auto_808505 ?auto_808506 ?auto_808507 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808607 - SURFACE
      ?auto_808608 - SURFACE
      ?auto_808609 - SURFACE
      ?auto_808611 - SURFACE
      ?auto_808610 - SURFACE
      ?auto_808612 - SURFACE
      ?auto_808613 - SURFACE
      ?auto_808614 - SURFACE
      ?auto_808615 - SURFACE
      ?auto_808616 - SURFACE
    )
    :vars
    (
      ?auto_808619 - HOIST
      ?auto_808617 - PLACE
      ?auto_808618 - PLACE
      ?auto_808621 - HOIST
      ?auto_808620 - SURFACE
      ?auto_808622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_808619 ?auto_808617 ) ( IS-CRATE ?auto_808616 ) ( not ( = ?auto_808615 ?auto_808616 ) ) ( not ( = ?auto_808614 ?auto_808615 ) ) ( not ( = ?auto_808614 ?auto_808616 ) ) ( not ( = ?auto_808618 ?auto_808617 ) ) ( HOIST-AT ?auto_808621 ?auto_808618 ) ( not ( = ?auto_808619 ?auto_808621 ) ) ( AVAILABLE ?auto_808621 ) ( SURFACE-AT ?auto_808616 ?auto_808618 ) ( ON ?auto_808616 ?auto_808620 ) ( CLEAR ?auto_808616 ) ( not ( = ?auto_808615 ?auto_808620 ) ) ( not ( = ?auto_808616 ?auto_808620 ) ) ( not ( = ?auto_808614 ?auto_808620 ) ) ( TRUCK-AT ?auto_808622 ?auto_808617 ) ( SURFACE-AT ?auto_808614 ?auto_808617 ) ( CLEAR ?auto_808614 ) ( LIFTING ?auto_808619 ?auto_808615 ) ( IS-CRATE ?auto_808615 ) ( ON ?auto_808608 ?auto_808607 ) ( ON ?auto_808609 ?auto_808608 ) ( ON ?auto_808611 ?auto_808609 ) ( ON ?auto_808610 ?auto_808611 ) ( ON ?auto_808612 ?auto_808610 ) ( ON ?auto_808613 ?auto_808612 ) ( ON ?auto_808614 ?auto_808613 ) ( not ( = ?auto_808607 ?auto_808608 ) ) ( not ( = ?auto_808607 ?auto_808609 ) ) ( not ( = ?auto_808607 ?auto_808611 ) ) ( not ( = ?auto_808607 ?auto_808610 ) ) ( not ( = ?auto_808607 ?auto_808612 ) ) ( not ( = ?auto_808607 ?auto_808613 ) ) ( not ( = ?auto_808607 ?auto_808614 ) ) ( not ( = ?auto_808607 ?auto_808615 ) ) ( not ( = ?auto_808607 ?auto_808616 ) ) ( not ( = ?auto_808607 ?auto_808620 ) ) ( not ( = ?auto_808608 ?auto_808609 ) ) ( not ( = ?auto_808608 ?auto_808611 ) ) ( not ( = ?auto_808608 ?auto_808610 ) ) ( not ( = ?auto_808608 ?auto_808612 ) ) ( not ( = ?auto_808608 ?auto_808613 ) ) ( not ( = ?auto_808608 ?auto_808614 ) ) ( not ( = ?auto_808608 ?auto_808615 ) ) ( not ( = ?auto_808608 ?auto_808616 ) ) ( not ( = ?auto_808608 ?auto_808620 ) ) ( not ( = ?auto_808609 ?auto_808611 ) ) ( not ( = ?auto_808609 ?auto_808610 ) ) ( not ( = ?auto_808609 ?auto_808612 ) ) ( not ( = ?auto_808609 ?auto_808613 ) ) ( not ( = ?auto_808609 ?auto_808614 ) ) ( not ( = ?auto_808609 ?auto_808615 ) ) ( not ( = ?auto_808609 ?auto_808616 ) ) ( not ( = ?auto_808609 ?auto_808620 ) ) ( not ( = ?auto_808611 ?auto_808610 ) ) ( not ( = ?auto_808611 ?auto_808612 ) ) ( not ( = ?auto_808611 ?auto_808613 ) ) ( not ( = ?auto_808611 ?auto_808614 ) ) ( not ( = ?auto_808611 ?auto_808615 ) ) ( not ( = ?auto_808611 ?auto_808616 ) ) ( not ( = ?auto_808611 ?auto_808620 ) ) ( not ( = ?auto_808610 ?auto_808612 ) ) ( not ( = ?auto_808610 ?auto_808613 ) ) ( not ( = ?auto_808610 ?auto_808614 ) ) ( not ( = ?auto_808610 ?auto_808615 ) ) ( not ( = ?auto_808610 ?auto_808616 ) ) ( not ( = ?auto_808610 ?auto_808620 ) ) ( not ( = ?auto_808612 ?auto_808613 ) ) ( not ( = ?auto_808612 ?auto_808614 ) ) ( not ( = ?auto_808612 ?auto_808615 ) ) ( not ( = ?auto_808612 ?auto_808616 ) ) ( not ( = ?auto_808612 ?auto_808620 ) ) ( not ( = ?auto_808613 ?auto_808614 ) ) ( not ( = ?auto_808613 ?auto_808615 ) ) ( not ( = ?auto_808613 ?auto_808616 ) ) ( not ( = ?auto_808613 ?auto_808620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808614 ?auto_808615 ?auto_808616 )
      ( MAKE-9CRATE-VERIFY ?auto_808607 ?auto_808608 ?auto_808609 ?auto_808611 ?auto_808610 ?auto_808612 ?auto_808613 ?auto_808614 ?auto_808615 ?auto_808616 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_808716 - SURFACE
      ?auto_808717 - SURFACE
      ?auto_808718 - SURFACE
      ?auto_808720 - SURFACE
      ?auto_808719 - SURFACE
      ?auto_808721 - SURFACE
      ?auto_808722 - SURFACE
      ?auto_808723 - SURFACE
      ?auto_808724 - SURFACE
      ?auto_808725 - SURFACE
    )
    :vars
    (
      ?auto_808728 - HOIST
      ?auto_808730 - PLACE
      ?auto_808727 - PLACE
      ?auto_808731 - HOIST
      ?auto_808729 - SURFACE
      ?auto_808726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_808728 ?auto_808730 ) ( IS-CRATE ?auto_808725 ) ( not ( = ?auto_808724 ?auto_808725 ) ) ( not ( = ?auto_808723 ?auto_808724 ) ) ( not ( = ?auto_808723 ?auto_808725 ) ) ( not ( = ?auto_808727 ?auto_808730 ) ) ( HOIST-AT ?auto_808731 ?auto_808727 ) ( not ( = ?auto_808728 ?auto_808731 ) ) ( AVAILABLE ?auto_808731 ) ( SURFACE-AT ?auto_808725 ?auto_808727 ) ( ON ?auto_808725 ?auto_808729 ) ( CLEAR ?auto_808725 ) ( not ( = ?auto_808724 ?auto_808729 ) ) ( not ( = ?auto_808725 ?auto_808729 ) ) ( not ( = ?auto_808723 ?auto_808729 ) ) ( TRUCK-AT ?auto_808726 ?auto_808730 ) ( SURFACE-AT ?auto_808723 ?auto_808730 ) ( CLEAR ?auto_808723 ) ( IS-CRATE ?auto_808724 ) ( AVAILABLE ?auto_808728 ) ( IN ?auto_808724 ?auto_808726 ) ( ON ?auto_808717 ?auto_808716 ) ( ON ?auto_808718 ?auto_808717 ) ( ON ?auto_808720 ?auto_808718 ) ( ON ?auto_808719 ?auto_808720 ) ( ON ?auto_808721 ?auto_808719 ) ( ON ?auto_808722 ?auto_808721 ) ( ON ?auto_808723 ?auto_808722 ) ( not ( = ?auto_808716 ?auto_808717 ) ) ( not ( = ?auto_808716 ?auto_808718 ) ) ( not ( = ?auto_808716 ?auto_808720 ) ) ( not ( = ?auto_808716 ?auto_808719 ) ) ( not ( = ?auto_808716 ?auto_808721 ) ) ( not ( = ?auto_808716 ?auto_808722 ) ) ( not ( = ?auto_808716 ?auto_808723 ) ) ( not ( = ?auto_808716 ?auto_808724 ) ) ( not ( = ?auto_808716 ?auto_808725 ) ) ( not ( = ?auto_808716 ?auto_808729 ) ) ( not ( = ?auto_808717 ?auto_808718 ) ) ( not ( = ?auto_808717 ?auto_808720 ) ) ( not ( = ?auto_808717 ?auto_808719 ) ) ( not ( = ?auto_808717 ?auto_808721 ) ) ( not ( = ?auto_808717 ?auto_808722 ) ) ( not ( = ?auto_808717 ?auto_808723 ) ) ( not ( = ?auto_808717 ?auto_808724 ) ) ( not ( = ?auto_808717 ?auto_808725 ) ) ( not ( = ?auto_808717 ?auto_808729 ) ) ( not ( = ?auto_808718 ?auto_808720 ) ) ( not ( = ?auto_808718 ?auto_808719 ) ) ( not ( = ?auto_808718 ?auto_808721 ) ) ( not ( = ?auto_808718 ?auto_808722 ) ) ( not ( = ?auto_808718 ?auto_808723 ) ) ( not ( = ?auto_808718 ?auto_808724 ) ) ( not ( = ?auto_808718 ?auto_808725 ) ) ( not ( = ?auto_808718 ?auto_808729 ) ) ( not ( = ?auto_808720 ?auto_808719 ) ) ( not ( = ?auto_808720 ?auto_808721 ) ) ( not ( = ?auto_808720 ?auto_808722 ) ) ( not ( = ?auto_808720 ?auto_808723 ) ) ( not ( = ?auto_808720 ?auto_808724 ) ) ( not ( = ?auto_808720 ?auto_808725 ) ) ( not ( = ?auto_808720 ?auto_808729 ) ) ( not ( = ?auto_808719 ?auto_808721 ) ) ( not ( = ?auto_808719 ?auto_808722 ) ) ( not ( = ?auto_808719 ?auto_808723 ) ) ( not ( = ?auto_808719 ?auto_808724 ) ) ( not ( = ?auto_808719 ?auto_808725 ) ) ( not ( = ?auto_808719 ?auto_808729 ) ) ( not ( = ?auto_808721 ?auto_808722 ) ) ( not ( = ?auto_808721 ?auto_808723 ) ) ( not ( = ?auto_808721 ?auto_808724 ) ) ( not ( = ?auto_808721 ?auto_808725 ) ) ( not ( = ?auto_808721 ?auto_808729 ) ) ( not ( = ?auto_808722 ?auto_808723 ) ) ( not ( = ?auto_808722 ?auto_808724 ) ) ( not ( = ?auto_808722 ?auto_808725 ) ) ( not ( = ?auto_808722 ?auto_808729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_808723 ?auto_808724 ?auto_808725 )
      ( MAKE-9CRATE-VERIFY ?auto_808716 ?auto_808717 ?auto_808718 ?auto_808720 ?auto_808719 ?auto_808721 ?auto_808722 ?auto_808723 ?auto_808724 ?auto_808725 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814213 - SURFACE
      ?auto_814214 - SURFACE
      ?auto_814215 - SURFACE
      ?auto_814217 - SURFACE
      ?auto_814216 - SURFACE
      ?auto_814218 - SURFACE
      ?auto_814219 - SURFACE
      ?auto_814220 - SURFACE
      ?auto_814221 - SURFACE
      ?auto_814222 - SURFACE
      ?auto_814223 - SURFACE
    )
    :vars
    (
      ?auto_814224 - HOIST
      ?auto_814225 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_814224 ?auto_814225 ) ( SURFACE-AT ?auto_814222 ?auto_814225 ) ( CLEAR ?auto_814222 ) ( LIFTING ?auto_814224 ?auto_814223 ) ( IS-CRATE ?auto_814223 ) ( not ( = ?auto_814222 ?auto_814223 ) ) ( ON ?auto_814214 ?auto_814213 ) ( ON ?auto_814215 ?auto_814214 ) ( ON ?auto_814217 ?auto_814215 ) ( ON ?auto_814216 ?auto_814217 ) ( ON ?auto_814218 ?auto_814216 ) ( ON ?auto_814219 ?auto_814218 ) ( ON ?auto_814220 ?auto_814219 ) ( ON ?auto_814221 ?auto_814220 ) ( ON ?auto_814222 ?auto_814221 ) ( not ( = ?auto_814213 ?auto_814214 ) ) ( not ( = ?auto_814213 ?auto_814215 ) ) ( not ( = ?auto_814213 ?auto_814217 ) ) ( not ( = ?auto_814213 ?auto_814216 ) ) ( not ( = ?auto_814213 ?auto_814218 ) ) ( not ( = ?auto_814213 ?auto_814219 ) ) ( not ( = ?auto_814213 ?auto_814220 ) ) ( not ( = ?auto_814213 ?auto_814221 ) ) ( not ( = ?auto_814213 ?auto_814222 ) ) ( not ( = ?auto_814213 ?auto_814223 ) ) ( not ( = ?auto_814214 ?auto_814215 ) ) ( not ( = ?auto_814214 ?auto_814217 ) ) ( not ( = ?auto_814214 ?auto_814216 ) ) ( not ( = ?auto_814214 ?auto_814218 ) ) ( not ( = ?auto_814214 ?auto_814219 ) ) ( not ( = ?auto_814214 ?auto_814220 ) ) ( not ( = ?auto_814214 ?auto_814221 ) ) ( not ( = ?auto_814214 ?auto_814222 ) ) ( not ( = ?auto_814214 ?auto_814223 ) ) ( not ( = ?auto_814215 ?auto_814217 ) ) ( not ( = ?auto_814215 ?auto_814216 ) ) ( not ( = ?auto_814215 ?auto_814218 ) ) ( not ( = ?auto_814215 ?auto_814219 ) ) ( not ( = ?auto_814215 ?auto_814220 ) ) ( not ( = ?auto_814215 ?auto_814221 ) ) ( not ( = ?auto_814215 ?auto_814222 ) ) ( not ( = ?auto_814215 ?auto_814223 ) ) ( not ( = ?auto_814217 ?auto_814216 ) ) ( not ( = ?auto_814217 ?auto_814218 ) ) ( not ( = ?auto_814217 ?auto_814219 ) ) ( not ( = ?auto_814217 ?auto_814220 ) ) ( not ( = ?auto_814217 ?auto_814221 ) ) ( not ( = ?auto_814217 ?auto_814222 ) ) ( not ( = ?auto_814217 ?auto_814223 ) ) ( not ( = ?auto_814216 ?auto_814218 ) ) ( not ( = ?auto_814216 ?auto_814219 ) ) ( not ( = ?auto_814216 ?auto_814220 ) ) ( not ( = ?auto_814216 ?auto_814221 ) ) ( not ( = ?auto_814216 ?auto_814222 ) ) ( not ( = ?auto_814216 ?auto_814223 ) ) ( not ( = ?auto_814218 ?auto_814219 ) ) ( not ( = ?auto_814218 ?auto_814220 ) ) ( not ( = ?auto_814218 ?auto_814221 ) ) ( not ( = ?auto_814218 ?auto_814222 ) ) ( not ( = ?auto_814218 ?auto_814223 ) ) ( not ( = ?auto_814219 ?auto_814220 ) ) ( not ( = ?auto_814219 ?auto_814221 ) ) ( not ( = ?auto_814219 ?auto_814222 ) ) ( not ( = ?auto_814219 ?auto_814223 ) ) ( not ( = ?auto_814220 ?auto_814221 ) ) ( not ( = ?auto_814220 ?auto_814222 ) ) ( not ( = ?auto_814220 ?auto_814223 ) ) ( not ( = ?auto_814221 ?auto_814222 ) ) ( not ( = ?auto_814221 ?auto_814223 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_814222 ?auto_814223 )
      ( MAKE-10CRATE-VERIFY ?auto_814213 ?auto_814214 ?auto_814215 ?auto_814217 ?auto_814216 ?auto_814218 ?auto_814219 ?auto_814220 ?auto_814221 ?auto_814222 ?auto_814223 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814307 - SURFACE
      ?auto_814308 - SURFACE
      ?auto_814309 - SURFACE
      ?auto_814311 - SURFACE
      ?auto_814310 - SURFACE
      ?auto_814312 - SURFACE
      ?auto_814313 - SURFACE
      ?auto_814314 - SURFACE
      ?auto_814315 - SURFACE
      ?auto_814316 - SURFACE
      ?auto_814317 - SURFACE
    )
    :vars
    (
      ?auto_814319 - HOIST
      ?auto_814318 - PLACE
      ?auto_814320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_814319 ?auto_814318 ) ( SURFACE-AT ?auto_814316 ?auto_814318 ) ( CLEAR ?auto_814316 ) ( IS-CRATE ?auto_814317 ) ( not ( = ?auto_814316 ?auto_814317 ) ) ( TRUCK-AT ?auto_814320 ?auto_814318 ) ( AVAILABLE ?auto_814319 ) ( IN ?auto_814317 ?auto_814320 ) ( ON ?auto_814316 ?auto_814315 ) ( not ( = ?auto_814315 ?auto_814316 ) ) ( not ( = ?auto_814315 ?auto_814317 ) ) ( ON ?auto_814308 ?auto_814307 ) ( ON ?auto_814309 ?auto_814308 ) ( ON ?auto_814311 ?auto_814309 ) ( ON ?auto_814310 ?auto_814311 ) ( ON ?auto_814312 ?auto_814310 ) ( ON ?auto_814313 ?auto_814312 ) ( ON ?auto_814314 ?auto_814313 ) ( ON ?auto_814315 ?auto_814314 ) ( not ( = ?auto_814307 ?auto_814308 ) ) ( not ( = ?auto_814307 ?auto_814309 ) ) ( not ( = ?auto_814307 ?auto_814311 ) ) ( not ( = ?auto_814307 ?auto_814310 ) ) ( not ( = ?auto_814307 ?auto_814312 ) ) ( not ( = ?auto_814307 ?auto_814313 ) ) ( not ( = ?auto_814307 ?auto_814314 ) ) ( not ( = ?auto_814307 ?auto_814315 ) ) ( not ( = ?auto_814307 ?auto_814316 ) ) ( not ( = ?auto_814307 ?auto_814317 ) ) ( not ( = ?auto_814308 ?auto_814309 ) ) ( not ( = ?auto_814308 ?auto_814311 ) ) ( not ( = ?auto_814308 ?auto_814310 ) ) ( not ( = ?auto_814308 ?auto_814312 ) ) ( not ( = ?auto_814308 ?auto_814313 ) ) ( not ( = ?auto_814308 ?auto_814314 ) ) ( not ( = ?auto_814308 ?auto_814315 ) ) ( not ( = ?auto_814308 ?auto_814316 ) ) ( not ( = ?auto_814308 ?auto_814317 ) ) ( not ( = ?auto_814309 ?auto_814311 ) ) ( not ( = ?auto_814309 ?auto_814310 ) ) ( not ( = ?auto_814309 ?auto_814312 ) ) ( not ( = ?auto_814309 ?auto_814313 ) ) ( not ( = ?auto_814309 ?auto_814314 ) ) ( not ( = ?auto_814309 ?auto_814315 ) ) ( not ( = ?auto_814309 ?auto_814316 ) ) ( not ( = ?auto_814309 ?auto_814317 ) ) ( not ( = ?auto_814311 ?auto_814310 ) ) ( not ( = ?auto_814311 ?auto_814312 ) ) ( not ( = ?auto_814311 ?auto_814313 ) ) ( not ( = ?auto_814311 ?auto_814314 ) ) ( not ( = ?auto_814311 ?auto_814315 ) ) ( not ( = ?auto_814311 ?auto_814316 ) ) ( not ( = ?auto_814311 ?auto_814317 ) ) ( not ( = ?auto_814310 ?auto_814312 ) ) ( not ( = ?auto_814310 ?auto_814313 ) ) ( not ( = ?auto_814310 ?auto_814314 ) ) ( not ( = ?auto_814310 ?auto_814315 ) ) ( not ( = ?auto_814310 ?auto_814316 ) ) ( not ( = ?auto_814310 ?auto_814317 ) ) ( not ( = ?auto_814312 ?auto_814313 ) ) ( not ( = ?auto_814312 ?auto_814314 ) ) ( not ( = ?auto_814312 ?auto_814315 ) ) ( not ( = ?auto_814312 ?auto_814316 ) ) ( not ( = ?auto_814312 ?auto_814317 ) ) ( not ( = ?auto_814313 ?auto_814314 ) ) ( not ( = ?auto_814313 ?auto_814315 ) ) ( not ( = ?auto_814313 ?auto_814316 ) ) ( not ( = ?auto_814313 ?auto_814317 ) ) ( not ( = ?auto_814314 ?auto_814315 ) ) ( not ( = ?auto_814314 ?auto_814316 ) ) ( not ( = ?auto_814314 ?auto_814317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814315 ?auto_814316 ?auto_814317 )
      ( MAKE-10CRATE-VERIFY ?auto_814307 ?auto_814308 ?auto_814309 ?auto_814311 ?auto_814310 ?auto_814312 ?auto_814313 ?auto_814314 ?auto_814315 ?auto_814316 ?auto_814317 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814412 - SURFACE
      ?auto_814413 - SURFACE
      ?auto_814414 - SURFACE
      ?auto_814416 - SURFACE
      ?auto_814415 - SURFACE
      ?auto_814417 - SURFACE
      ?auto_814418 - SURFACE
      ?auto_814419 - SURFACE
      ?auto_814420 - SURFACE
      ?auto_814421 - SURFACE
      ?auto_814422 - SURFACE
    )
    :vars
    (
      ?auto_814423 - HOIST
      ?auto_814424 - PLACE
      ?auto_814425 - TRUCK
      ?auto_814426 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_814423 ?auto_814424 ) ( SURFACE-AT ?auto_814421 ?auto_814424 ) ( CLEAR ?auto_814421 ) ( IS-CRATE ?auto_814422 ) ( not ( = ?auto_814421 ?auto_814422 ) ) ( AVAILABLE ?auto_814423 ) ( IN ?auto_814422 ?auto_814425 ) ( ON ?auto_814421 ?auto_814420 ) ( not ( = ?auto_814420 ?auto_814421 ) ) ( not ( = ?auto_814420 ?auto_814422 ) ) ( TRUCK-AT ?auto_814425 ?auto_814426 ) ( not ( = ?auto_814426 ?auto_814424 ) ) ( ON ?auto_814413 ?auto_814412 ) ( ON ?auto_814414 ?auto_814413 ) ( ON ?auto_814416 ?auto_814414 ) ( ON ?auto_814415 ?auto_814416 ) ( ON ?auto_814417 ?auto_814415 ) ( ON ?auto_814418 ?auto_814417 ) ( ON ?auto_814419 ?auto_814418 ) ( ON ?auto_814420 ?auto_814419 ) ( not ( = ?auto_814412 ?auto_814413 ) ) ( not ( = ?auto_814412 ?auto_814414 ) ) ( not ( = ?auto_814412 ?auto_814416 ) ) ( not ( = ?auto_814412 ?auto_814415 ) ) ( not ( = ?auto_814412 ?auto_814417 ) ) ( not ( = ?auto_814412 ?auto_814418 ) ) ( not ( = ?auto_814412 ?auto_814419 ) ) ( not ( = ?auto_814412 ?auto_814420 ) ) ( not ( = ?auto_814412 ?auto_814421 ) ) ( not ( = ?auto_814412 ?auto_814422 ) ) ( not ( = ?auto_814413 ?auto_814414 ) ) ( not ( = ?auto_814413 ?auto_814416 ) ) ( not ( = ?auto_814413 ?auto_814415 ) ) ( not ( = ?auto_814413 ?auto_814417 ) ) ( not ( = ?auto_814413 ?auto_814418 ) ) ( not ( = ?auto_814413 ?auto_814419 ) ) ( not ( = ?auto_814413 ?auto_814420 ) ) ( not ( = ?auto_814413 ?auto_814421 ) ) ( not ( = ?auto_814413 ?auto_814422 ) ) ( not ( = ?auto_814414 ?auto_814416 ) ) ( not ( = ?auto_814414 ?auto_814415 ) ) ( not ( = ?auto_814414 ?auto_814417 ) ) ( not ( = ?auto_814414 ?auto_814418 ) ) ( not ( = ?auto_814414 ?auto_814419 ) ) ( not ( = ?auto_814414 ?auto_814420 ) ) ( not ( = ?auto_814414 ?auto_814421 ) ) ( not ( = ?auto_814414 ?auto_814422 ) ) ( not ( = ?auto_814416 ?auto_814415 ) ) ( not ( = ?auto_814416 ?auto_814417 ) ) ( not ( = ?auto_814416 ?auto_814418 ) ) ( not ( = ?auto_814416 ?auto_814419 ) ) ( not ( = ?auto_814416 ?auto_814420 ) ) ( not ( = ?auto_814416 ?auto_814421 ) ) ( not ( = ?auto_814416 ?auto_814422 ) ) ( not ( = ?auto_814415 ?auto_814417 ) ) ( not ( = ?auto_814415 ?auto_814418 ) ) ( not ( = ?auto_814415 ?auto_814419 ) ) ( not ( = ?auto_814415 ?auto_814420 ) ) ( not ( = ?auto_814415 ?auto_814421 ) ) ( not ( = ?auto_814415 ?auto_814422 ) ) ( not ( = ?auto_814417 ?auto_814418 ) ) ( not ( = ?auto_814417 ?auto_814419 ) ) ( not ( = ?auto_814417 ?auto_814420 ) ) ( not ( = ?auto_814417 ?auto_814421 ) ) ( not ( = ?auto_814417 ?auto_814422 ) ) ( not ( = ?auto_814418 ?auto_814419 ) ) ( not ( = ?auto_814418 ?auto_814420 ) ) ( not ( = ?auto_814418 ?auto_814421 ) ) ( not ( = ?auto_814418 ?auto_814422 ) ) ( not ( = ?auto_814419 ?auto_814420 ) ) ( not ( = ?auto_814419 ?auto_814421 ) ) ( not ( = ?auto_814419 ?auto_814422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814420 ?auto_814421 ?auto_814422 )
      ( MAKE-10CRATE-VERIFY ?auto_814412 ?auto_814413 ?auto_814414 ?auto_814416 ?auto_814415 ?auto_814417 ?auto_814418 ?auto_814419 ?auto_814420 ?auto_814421 ?auto_814422 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814527 - SURFACE
      ?auto_814528 - SURFACE
      ?auto_814529 - SURFACE
      ?auto_814531 - SURFACE
      ?auto_814530 - SURFACE
      ?auto_814532 - SURFACE
      ?auto_814533 - SURFACE
      ?auto_814534 - SURFACE
      ?auto_814535 - SURFACE
      ?auto_814536 - SURFACE
      ?auto_814537 - SURFACE
    )
    :vars
    (
      ?auto_814538 - HOIST
      ?auto_814541 - PLACE
      ?auto_814539 - TRUCK
      ?auto_814542 - PLACE
      ?auto_814540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_814538 ?auto_814541 ) ( SURFACE-AT ?auto_814536 ?auto_814541 ) ( CLEAR ?auto_814536 ) ( IS-CRATE ?auto_814537 ) ( not ( = ?auto_814536 ?auto_814537 ) ) ( AVAILABLE ?auto_814538 ) ( ON ?auto_814536 ?auto_814535 ) ( not ( = ?auto_814535 ?auto_814536 ) ) ( not ( = ?auto_814535 ?auto_814537 ) ) ( TRUCK-AT ?auto_814539 ?auto_814542 ) ( not ( = ?auto_814542 ?auto_814541 ) ) ( HOIST-AT ?auto_814540 ?auto_814542 ) ( LIFTING ?auto_814540 ?auto_814537 ) ( not ( = ?auto_814538 ?auto_814540 ) ) ( ON ?auto_814528 ?auto_814527 ) ( ON ?auto_814529 ?auto_814528 ) ( ON ?auto_814531 ?auto_814529 ) ( ON ?auto_814530 ?auto_814531 ) ( ON ?auto_814532 ?auto_814530 ) ( ON ?auto_814533 ?auto_814532 ) ( ON ?auto_814534 ?auto_814533 ) ( ON ?auto_814535 ?auto_814534 ) ( not ( = ?auto_814527 ?auto_814528 ) ) ( not ( = ?auto_814527 ?auto_814529 ) ) ( not ( = ?auto_814527 ?auto_814531 ) ) ( not ( = ?auto_814527 ?auto_814530 ) ) ( not ( = ?auto_814527 ?auto_814532 ) ) ( not ( = ?auto_814527 ?auto_814533 ) ) ( not ( = ?auto_814527 ?auto_814534 ) ) ( not ( = ?auto_814527 ?auto_814535 ) ) ( not ( = ?auto_814527 ?auto_814536 ) ) ( not ( = ?auto_814527 ?auto_814537 ) ) ( not ( = ?auto_814528 ?auto_814529 ) ) ( not ( = ?auto_814528 ?auto_814531 ) ) ( not ( = ?auto_814528 ?auto_814530 ) ) ( not ( = ?auto_814528 ?auto_814532 ) ) ( not ( = ?auto_814528 ?auto_814533 ) ) ( not ( = ?auto_814528 ?auto_814534 ) ) ( not ( = ?auto_814528 ?auto_814535 ) ) ( not ( = ?auto_814528 ?auto_814536 ) ) ( not ( = ?auto_814528 ?auto_814537 ) ) ( not ( = ?auto_814529 ?auto_814531 ) ) ( not ( = ?auto_814529 ?auto_814530 ) ) ( not ( = ?auto_814529 ?auto_814532 ) ) ( not ( = ?auto_814529 ?auto_814533 ) ) ( not ( = ?auto_814529 ?auto_814534 ) ) ( not ( = ?auto_814529 ?auto_814535 ) ) ( not ( = ?auto_814529 ?auto_814536 ) ) ( not ( = ?auto_814529 ?auto_814537 ) ) ( not ( = ?auto_814531 ?auto_814530 ) ) ( not ( = ?auto_814531 ?auto_814532 ) ) ( not ( = ?auto_814531 ?auto_814533 ) ) ( not ( = ?auto_814531 ?auto_814534 ) ) ( not ( = ?auto_814531 ?auto_814535 ) ) ( not ( = ?auto_814531 ?auto_814536 ) ) ( not ( = ?auto_814531 ?auto_814537 ) ) ( not ( = ?auto_814530 ?auto_814532 ) ) ( not ( = ?auto_814530 ?auto_814533 ) ) ( not ( = ?auto_814530 ?auto_814534 ) ) ( not ( = ?auto_814530 ?auto_814535 ) ) ( not ( = ?auto_814530 ?auto_814536 ) ) ( not ( = ?auto_814530 ?auto_814537 ) ) ( not ( = ?auto_814532 ?auto_814533 ) ) ( not ( = ?auto_814532 ?auto_814534 ) ) ( not ( = ?auto_814532 ?auto_814535 ) ) ( not ( = ?auto_814532 ?auto_814536 ) ) ( not ( = ?auto_814532 ?auto_814537 ) ) ( not ( = ?auto_814533 ?auto_814534 ) ) ( not ( = ?auto_814533 ?auto_814535 ) ) ( not ( = ?auto_814533 ?auto_814536 ) ) ( not ( = ?auto_814533 ?auto_814537 ) ) ( not ( = ?auto_814534 ?auto_814535 ) ) ( not ( = ?auto_814534 ?auto_814536 ) ) ( not ( = ?auto_814534 ?auto_814537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814535 ?auto_814536 ?auto_814537 )
      ( MAKE-10CRATE-VERIFY ?auto_814527 ?auto_814528 ?auto_814529 ?auto_814531 ?auto_814530 ?auto_814532 ?auto_814533 ?auto_814534 ?auto_814535 ?auto_814536 ?auto_814537 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814652 - SURFACE
      ?auto_814653 - SURFACE
      ?auto_814654 - SURFACE
      ?auto_814656 - SURFACE
      ?auto_814655 - SURFACE
      ?auto_814657 - SURFACE
      ?auto_814658 - SURFACE
      ?auto_814659 - SURFACE
      ?auto_814660 - SURFACE
      ?auto_814661 - SURFACE
      ?auto_814662 - SURFACE
    )
    :vars
    (
      ?auto_814665 - HOIST
      ?auto_814667 - PLACE
      ?auto_814666 - TRUCK
      ?auto_814663 - PLACE
      ?auto_814664 - HOIST
      ?auto_814668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_814665 ?auto_814667 ) ( SURFACE-AT ?auto_814661 ?auto_814667 ) ( CLEAR ?auto_814661 ) ( IS-CRATE ?auto_814662 ) ( not ( = ?auto_814661 ?auto_814662 ) ) ( AVAILABLE ?auto_814665 ) ( ON ?auto_814661 ?auto_814660 ) ( not ( = ?auto_814660 ?auto_814661 ) ) ( not ( = ?auto_814660 ?auto_814662 ) ) ( TRUCK-AT ?auto_814666 ?auto_814663 ) ( not ( = ?auto_814663 ?auto_814667 ) ) ( HOIST-AT ?auto_814664 ?auto_814663 ) ( not ( = ?auto_814665 ?auto_814664 ) ) ( AVAILABLE ?auto_814664 ) ( SURFACE-AT ?auto_814662 ?auto_814663 ) ( ON ?auto_814662 ?auto_814668 ) ( CLEAR ?auto_814662 ) ( not ( = ?auto_814661 ?auto_814668 ) ) ( not ( = ?auto_814662 ?auto_814668 ) ) ( not ( = ?auto_814660 ?auto_814668 ) ) ( ON ?auto_814653 ?auto_814652 ) ( ON ?auto_814654 ?auto_814653 ) ( ON ?auto_814656 ?auto_814654 ) ( ON ?auto_814655 ?auto_814656 ) ( ON ?auto_814657 ?auto_814655 ) ( ON ?auto_814658 ?auto_814657 ) ( ON ?auto_814659 ?auto_814658 ) ( ON ?auto_814660 ?auto_814659 ) ( not ( = ?auto_814652 ?auto_814653 ) ) ( not ( = ?auto_814652 ?auto_814654 ) ) ( not ( = ?auto_814652 ?auto_814656 ) ) ( not ( = ?auto_814652 ?auto_814655 ) ) ( not ( = ?auto_814652 ?auto_814657 ) ) ( not ( = ?auto_814652 ?auto_814658 ) ) ( not ( = ?auto_814652 ?auto_814659 ) ) ( not ( = ?auto_814652 ?auto_814660 ) ) ( not ( = ?auto_814652 ?auto_814661 ) ) ( not ( = ?auto_814652 ?auto_814662 ) ) ( not ( = ?auto_814652 ?auto_814668 ) ) ( not ( = ?auto_814653 ?auto_814654 ) ) ( not ( = ?auto_814653 ?auto_814656 ) ) ( not ( = ?auto_814653 ?auto_814655 ) ) ( not ( = ?auto_814653 ?auto_814657 ) ) ( not ( = ?auto_814653 ?auto_814658 ) ) ( not ( = ?auto_814653 ?auto_814659 ) ) ( not ( = ?auto_814653 ?auto_814660 ) ) ( not ( = ?auto_814653 ?auto_814661 ) ) ( not ( = ?auto_814653 ?auto_814662 ) ) ( not ( = ?auto_814653 ?auto_814668 ) ) ( not ( = ?auto_814654 ?auto_814656 ) ) ( not ( = ?auto_814654 ?auto_814655 ) ) ( not ( = ?auto_814654 ?auto_814657 ) ) ( not ( = ?auto_814654 ?auto_814658 ) ) ( not ( = ?auto_814654 ?auto_814659 ) ) ( not ( = ?auto_814654 ?auto_814660 ) ) ( not ( = ?auto_814654 ?auto_814661 ) ) ( not ( = ?auto_814654 ?auto_814662 ) ) ( not ( = ?auto_814654 ?auto_814668 ) ) ( not ( = ?auto_814656 ?auto_814655 ) ) ( not ( = ?auto_814656 ?auto_814657 ) ) ( not ( = ?auto_814656 ?auto_814658 ) ) ( not ( = ?auto_814656 ?auto_814659 ) ) ( not ( = ?auto_814656 ?auto_814660 ) ) ( not ( = ?auto_814656 ?auto_814661 ) ) ( not ( = ?auto_814656 ?auto_814662 ) ) ( not ( = ?auto_814656 ?auto_814668 ) ) ( not ( = ?auto_814655 ?auto_814657 ) ) ( not ( = ?auto_814655 ?auto_814658 ) ) ( not ( = ?auto_814655 ?auto_814659 ) ) ( not ( = ?auto_814655 ?auto_814660 ) ) ( not ( = ?auto_814655 ?auto_814661 ) ) ( not ( = ?auto_814655 ?auto_814662 ) ) ( not ( = ?auto_814655 ?auto_814668 ) ) ( not ( = ?auto_814657 ?auto_814658 ) ) ( not ( = ?auto_814657 ?auto_814659 ) ) ( not ( = ?auto_814657 ?auto_814660 ) ) ( not ( = ?auto_814657 ?auto_814661 ) ) ( not ( = ?auto_814657 ?auto_814662 ) ) ( not ( = ?auto_814657 ?auto_814668 ) ) ( not ( = ?auto_814658 ?auto_814659 ) ) ( not ( = ?auto_814658 ?auto_814660 ) ) ( not ( = ?auto_814658 ?auto_814661 ) ) ( not ( = ?auto_814658 ?auto_814662 ) ) ( not ( = ?auto_814658 ?auto_814668 ) ) ( not ( = ?auto_814659 ?auto_814660 ) ) ( not ( = ?auto_814659 ?auto_814661 ) ) ( not ( = ?auto_814659 ?auto_814662 ) ) ( not ( = ?auto_814659 ?auto_814668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814660 ?auto_814661 ?auto_814662 )
      ( MAKE-10CRATE-VERIFY ?auto_814652 ?auto_814653 ?auto_814654 ?auto_814656 ?auto_814655 ?auto_814657 ?auto_814658 ?auto_814659 ?auto_814660 ?auto_814661 ?auto_814662 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814778 - SURFACE
      ?auto_814779 - SURFACE
      ?auto_814780 - SURFACE
      ?auto_814782 - SURFACE
      ?auto_814781 - SURFACE
      ?auto_814783 - SURFACE
      ?auto_814784 - SURFACE
      ?auto_814785 - SURFACE
      ?auto_814786 - SURFACE
      ?auto_814787 - SURFACE
      ?auto_814788 - SURFACE
    )
    :vars
    (
      ?auto_814794 - HOIST
      ?auto_814792 - PLACE
      ?auto_814791 - PLACE
      ?auto_814790 - HOIST
      ?auto_814789 - SURFACE
      ?auto_814793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_814794 ?auto_814792 ) ( SURFACE-AT ?auto_814787 ?auto_814792 ) ( CLEAR ?auto_814787 ) ( IS-CRATE ?auto_814788 ) ( not ( = ?auto_814787 ?auto_814788 ) ) ( AVAILABLE ?auto_814794 ) ( ON ?auto_814787 ?auto_814786 ) ( not ( = ?auto_814786 ?auto_814787 ) ) ( not ( = ?auto_814786 ?auto_814788 ) ) ( not ( = ?auto_814791 ?auto_814792 ) ) ( HOIST-AT ?auto_814790 ?auto_814791 ) ( not ( = ?auto_814794 ?auto_814790 ) ) ( AVAILABLE ?auto_814790 ) ( SURFACE-AT ?auto_814788 ?auto_814791 ) ( ON ?auto_814788 ?auto_814789 ) ( CLEAR ?auto_814788 ) ( not ( = ?auto_814787 ?auto_814789 ) ) ( not ( = ?auto_814788 ?auto_814789 ) ) ( not ( = ?auto_814786 ?auto_814789 ) ) ( TRUCK-AT ?auto_814793 ?auto_814792 ) ( ON ?auto_814779 ?auto_814778 ) ( ON ?auto_814780 ?auto_814779 ) ( ON ?auto_814782 ?auto_814780 ) ( ON ?auto_814781 ?auto_814782 ) ( ON ?auto_814783 ?auto_814781 ) ( ON ?auto_814784 ?auto_814783 ) ( ON ?auto_814785 ?auto_814784 ) ( ON ?auto_814786 ?auto_814785 ) ( not ( = ?auto_814778 ?auto_814779 ) ) ( not ( = ?auto_814778 ?auto_814780 ) ) ( not ( = ?auto_814778 ?auto_814782 ) ) ( not ( = ?auto_814778 ?auto_814781 ) ) ( not ( = ?auto_814778 ?auto_814783 ) ) ( not ( = ?auto_814778 ?auto_814784 ) ) ( not ( = ?auto_814778 ?auto_814785 ) ) ( not ( = ?auto_814778 ?auto_814786 ) ) ( not ( = ?auto_814778 ?auto_814787 ) ) ( not ( = ?auto_814778 ?auto_814788 ) ) ( not ( = ?auto_814778 ?auto_814789 ) ) ( not ( = ?auto_814779 ?auto_814780 ) ) ( not ( = ?auto_814779 ?auto_814782 ) ) ( not ( = ?auto_814779 ?auto_814781 ) ) ( not ( = ?auto_814779 ?auto_814783 ) ) ( not ( = ?auto_814779 ?auto_814784 ) ) ( not ( = ?auto_814779 ?auto_814785 ) ) ( not ( = ?auto_814779 ?auto_814786 ) ) ( not ( = ?auto_814779 ?auto_814787 ) ) ( not ( = ?auto_814779 ?auto_814788 ) ) ( not ( = ?auto_814779 ?auto_814789 ) ) ( not ( = ?auto_814780 ?auto_814782 ) ) ( not ( = ?auto_814780 ?auto_814781 ) ) ( not ( = ?auto_814780 ?auto_814783 ) ) ( not ( = ?auto_814780 ?auto_814784 ) ) ( not ( = ?auto_814780 ?auto_814785 ) ) ( not ( = ?auto_814780 ?auto_814786 ) ) ( not ( = ?auto_814780 ?auto_814787 ) ) ( not ( = ?auto_814780 ?auto_814788 ) ) ( not ( = ?auto_814780 ?auto_814789 ) ) ( not ( = ?auto_814782 ?auto_814781 ) ) ( not ( = ?auto_814782 ?auto_814783 ) ) ( not ( = ?auto_814782 ?auto_814784 ) ) ( not ( = ?auto_814782 ?auto_814785 ) ) ( not ( = ?auto_814782 ?auto_814786 ) ) ( not ( = ?auto_814782 ?auto_814787 ) ) ( not ( = ?auto_814782 ?auto_814788 ) ) ( not ( = ?auto_814782 ?auto_814789 ) ) ( not ( = ?auto_814781 ?auto_814783 ) ) ( not ( = ?auto_814781 ?auto_814784 ) ) ( not ( = ?auto_814781 ?auto_814785 ) ) ( not ( = ?auto_814781 ?auto_814786 ) ) ( not ( = ?auto_814781 ?auto_814787 ) ) ( not ( = ?auto_814781 ?auto_814788 ) ) ( not ( = ?auto_814781 ?auto_814789 ) ) ( not ( = ?auto_814783 ?auto_814784 ) ) ( not ( = ?auto_814783 ?auto_814785 ) ) ( not ( = ?auto_814783 ?auto_814786 ) ) ( not ( = ?auto_814783 ?auto_814787 ) ) ( not ( = ?auto_814783 ?auto_814788 ) ) ( not ( = ?auto_814783 ?auto_814789 ) ) ( not ( = ?auto_814784 ?auto_814785 ) ) ( not ( = ?auto_814784 ?auto_814786 ) ) ( not ( = ?auto_814784 ?auto_814787 ) ) ( not ( = ?auto_814784 ?auto_814788 ) ) ( not ( = ?auto_814784 ?auto_814789 ) ) ( not ( = ?auto_814785 ?auto_814786 ) ) ( not ( = ?auto_814785 ?auto_814787 ) ) ( not ( = ?auto_814785 ?auto_814788 ) ) ( not ( = ?auto_814785 ?auto_814789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814786 ?auto_814787 ?auto_814788 )
      ( MAKE-10CRATE-VERIFY ?auto_814778 ?auto_814779 ?auto_814780 ?auto_814782 ?auto_814781 ?auto_814783 ?auto_814784 ?auto_814785 ?auto_814786 ?auto_814787 ?auto_814788 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_814904 - SURFACE
      ?auto_814905 - SURFACE
      ?auto_814906 - SURFACE
      ?auto_814908 - SURFACE
      ?auto_814907 - SURFACE
      ?auto_814909 - SURFACE
      ?auto_814910 - SURFACE
      ?auto_814911 - SURFACE
      ?auto_814912 - SURFACE
      ?auto_814913 - SURFACE
      ?auto_814914 - SURFACE
    )
    :vars
    (
      ?auto_814916 - HOIST
      ?auto_814915 - PLACE
      ?auto_814918 - PLACE
      ?auto_814919 - HOIST
      ?auto_814920 - SURFACE
      ?auto_814917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_814916 ?auto_814915 ) ( IS-CRATE ?auto_814914 ) ( not ( = ?auto_814913 ?auto_814914 ) ) ( not ( = ?auto_814912 ?auto_814913 ) ) ( not ( = ?auto_814912 ?auto_814914 ) ) ( not ( = ?auto_814918 ?auto_814915 ) ) ( HOIST-AT ?auto_814919 ?auto_814918 ) ( not ( = ?auto_814916 ?auto_814919 ) ) ( AVAILABLE ?auto_814919 ) ( SURFACE-AT ?auto_814914 ?auto_814918 ) ( ON ?auto_814914 ?auto_814920 ) ( CLEAR ?auto_814914 ) ( not ( = ?auto_814913 ?auto_814920 ) ) ( not ( = ?auto_814914 ?auto_814920 ) ) ( not ( = ?auto_814912 ?auto_814920 ) ) ( TRUCK-AT ?auto_814917 ?auto_814915 ) ( SURFACE-AT ?auto_814912 ?auto_814915 ) ( CLEAR ?auto_814912 ) ( LIFTING ?auto_814916 ?auto_814913 ) ( IS-CRATE ?auto_814913 ) ( ON ?auto_814905 ?auto_814904 ) ( ON ?auto_814906 ?auto_814905 ) ( ON ?auto_814908 ?auto_814906 ) ( ON ?auto_814907 ?auto_814908 ) ( ON ?auto_814909 ?auto_814907 ) ( ON ?auto_814910 ?auto_814909 ) ( ON ?auto_814911 ?auto_814910 ) ( ON ?auto_814912 ?auto_814911 ) ( not ( = ?auto_814904 ?auto_814905 ) ) ( not ( = ?auto_814904 ?auto_814906 ) ) ( not ( = ?auto_814904 ?auto_814908 ) ) ( not ( = ?auto_814904 ?auto_814907 ) ) ( not ( = ?auto_814904 ?auto_814909 ) ) ( not ( = ?auto_814904 ?auto_814910 ) ) ( not ( = ?auto_814904 ?auto_814911 ) ) ( not ( = ?auto_814904 ?auto_814912 ) ) ( not ( = ?auto_814904 ?auto_814913 ) ) ( not ( = ?auto_814904 ?auto_814914 ) ) ( not ( = ?auto_814904 ?auto_814920 ) ) ( not ( = ?auto_814905 ?auto_814906 ) ) ( not ( = ?auto_814905 ?auto_814908 ) ) ( not ( = ?auto_814905 ?auto_814907 ) ) ( not ( = ?auto_814905 ?auto_814909 ) ) ( not ( = ?auto_814905 ?auto_814910 ) ) ( not ( = ?auto_814905 ?auto_814911 ) ) ( not ( = ?auto_814905 ?auto_814912 ) ) ( not ( = ?auto_814905 ?auto_814913 ) ) ( not ( = ?auto_814905 ?auto_814914 ) ) ( not ( = ?auto_814905 ?auto_814920 ) ) ( not ( = ?auto_814906 ?auto_814908 ) ) ( not ( = ?auto_814906 ?auto_814907 ) ) ( not ( = ?auto_814906 ?auto_814909 ) ) ( not ( = ?auto_814906 ?auto_814910 ) ) ( not ( = ?auto_814906 ?auto_814911 ) ) ( not ( = ?auto_814906 ?auto_814912 ) ) ( not ( = ?auto_814906 ?auto_814913 ) ) ( not ( = ?auto_814906 ?auto_814914 ) ) ( not ( = ?auto_814906 ?auto_814920 ) ) ( not ( = ?auto_814908 ?auto_814907 ) ) ( not ( = ?auto_814908 ?auto_814909 ) ) ( not ( = ?auto_814908 ?auto_814910 ) ) ( not ( = ?auto_814908 ?auto_814911 ) ) ( not ( = ?auto_814908 ?auto_814912 ) ) ( not ( = ?auto_814908 ?auto_814913 ) ) ( not ( = ?auto_814908 ?auto_814914 ) ) ( not ( = ?auto_814908 ?auto_814920 ) ) ( not ( = ?auto_814907 ?auto_814909 ) ) ( not ( = ?auto_814907 ?auto_814910 ) ) ( not ( = ?auto_814907 ?auto_814911 ) ) ( not ( = ?auto_814907 ?auto_814912 ) ) ( not ( = ?auto_814907 ?auto_814913 ) ) ( not ( = ?auto_814907 ?auto_814914 ) ) ( not ( = ?auto_814907 ?auto_814920 ) ) ( not ( = ?auto_814909 ?auto_814910 ) ) ( not ( = ?auto_814909 ?auto_814911 ) ) ( not ( = ?auto_814909 ?auto_814912 ) ) ( not ( = ?auto_814909 ?auto_814913 ) ) ( not ( = ?auto_814909 ?auto_814914 ) ) ( not ( = ?auto_814909 ?auto_814920 ) ) ( not ( = ?auto_814910 ?auto_814911 ) ) ( not ( = ?auto_814910 ?auto_814912 ) ) ( not ( = ?auto_814910 ?auto_814913 ) ) ( not ( = ?auto_814910 ?auto_814914 ) ) ( not ( = ?auto_814910 ?auto_814920 ) ) ( not ( = ?auto_814911 ?auto_814912 ) ) ( not ( = ?auto_814911 ?auto_814913 ) ) ( not ( = ?auto_814911 ?auto_814914 ) ) ( not ( = ?auto_814911 ?auto_814920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_814912 ?auto_814913 ?auto_814914 )
      ( MAKE-10CRATE-VERIFY ?auto_814904 ?auto_814905 ?auto_814906 ?auto_814908 ?auto_814907 ?auto_814909 ?auto_814910 ?auto_814911 ?auto_814912 ?auto_814913 ?auto_814914 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_815030 - SURFACE
      ?auto_815031 - SURFACE
      ?auto_815032 - SURFACE
      ?auto_815034 - SURFACE
      ?auto_815033 - SURFACE
      ?auto_815035 - SURFACE
      ?auto_815036 - SURFACE
      ?auto_815037 - SURFACE
      ?auto_815038 - SURFACE
      ?auto_815039 - SURFACE
      ?auto_815040 - SURFACE
    )
    :vars
    (
      ?auto_815043 - HOIST
      ?auto_815042 - PLACE
      ?auto_815045 - PLACE
      ?auto_815044 - HOIST
      ?auto_815046 - SURFACE
      ?auto_815041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_815043 ?auto_815042 ) ( IS-CRATE ?auto_815040 ) ( not ( = ?auto_815039 ?auto_815040 ) ) ( not ( = ?auto_815038 ?auto_815039 ) ) ( not ( = ?auto_815038 ?auto_815040 ) ) ( not ( = ?auto_815045 ?auto_815042 ) ) ( HOIST-AT ?auto_815044 ?auto_815045 ) ( not ( = ?auto_815043 ?auto_815044 ) ) ( AVAILABLE ?auto_815044 ) ( SURFACE-AT ?auto_815040 ?auto_815045 ) ( ON ?auto_815040 ?auto_815046 ) ( CLEAR ?auto_815040 ) ( not ( = ?auto_815039 ?auto_815046 ) ) ( not ( = ?auto_815040 ?auto_815046 ) ) ( not ( = ?auto_815038 ?auto_815046 ) ) ( TRUCK-AT ?auto_815041 ?auto_815042 ) ( SURFACE-AT ?auto_815038 ?auto_815042 ) ( CLEAR ?auto_815038 ) ( IS-CRATE ?auto_815039 ) ( AVAILABLE ?auto_815043 ) ( IN ?auto_815039 ?auto_815041 ) ( ON ?auto_815031 ?auto_815030 ) ( ON ?auto_815032 ?auto_815031 ) ( ON ?auto_815034 ?auto_815032 ) ( ON ?auto_815033 ?auto_815034 ) ( ON ?auto_815035 ?auto_815033 ) ( ON ?auto_815036 ?auto_815035 ) ( ON ?auto_815037 ?auto_815036 ) ( ON ?auto_815038 ?auto_815037 ) ( not ( = ?auto_815030 ?auto_815031 ) ) ( not ( = ?auto_815030 ?auto_815032 ) ) ( not ( = ?auto_815030 ?auto_815034 ) ) ( not ( = ?auto_815030 ?auto_815033 ) ) ( not ( = ?auto_815030 ?auto_815035 ) ) ( not ( = ?auto_815030 ?auto_815036 ) ) ( not ( = ?auto_815030 ?auto_815037 ) ) ( not ( = ?auto_815030 ?auto_815038 ) ) ( not ( = ?auto_815030 ?auto_815039 ) ) ( not ( = ?auto_815030 ?auto_815040 ) ) ( not ( = ?auto_815030 ?auto_815046 ) ) ( not ( = ?auto_815031 ?auto_815032 ) ) ( not ( = ?auto_815031 ?auto_815034 ) ) ( not ( = ?auto_815031 ?auto_815033 ) ) ( not ( = ?auto_815031 ?auto_815035 ) ) ( not ( = ?auto_815031 ?auto_815036 ) ) ( not ( = ?auto_815031 ?auto_815037 ) ) ( not ( = ?auto_815031 ?auto_815038 ) ) ( not ( = ?auto_815031 ?auto_815039 ) ) ( not ( = ?auto_815031 ?auto_815040 ) ) ( not ( = ?auto_815031 ?auto_815046 ) ) ( not ( = ?auto_815032 ?auto_815034 ) ) ( not ( = ?auto_815032 ?auto_815033 ) ) ( not ( = ?auto_815032 ?auto_815035 ) ) ( not ( = ?auto_815032 ?auto_815036 ) ) ( not ( = ?auto_815032 ?auto_815037 ) ) ( not ( = ?auto_815032 ?auto_815038 ) ) ( not ( = ?auto_815032 ?auto_815039 ) ) ( not ( = ?auto_815032 ?auto_815040 ) ) ( not ( = ?auto_815032 ?auto_815046 ) ) ( not ( = ?auto_815034 ?auto_815033 ) ) ( not ( = ?auto_815034 ?auto_815035 ) ) ( not ( = ?auto_815034 ?auto_815036 ) ) ( not ( = ?auto_815034 ?auto_815037 ) ) ( not ( = ?auto_815034 ?auto_815038 ) ) ( not ( = ?auto_815034 ?auto_815039 ) ) ( not ( = ?auto_815034 ?auto_815040 ) ) ( not ( = ?auto_815034 ?auto_815046 ) ) ( not ( = ?auto_815033 ?auto_815035 ) ) ( not ( = ?auto_815033 ?auto_815036 ) ) ( not ( = ?auto_815033 ?auto_815037 ) ) ( not ( = ?auto_815033 ?auto_815038 ) ) ( not ( = ?auto_815033 ?auto_815039 ) ) ( not ( = ?auto_815033 ?auto_815040 ) ) ( not ( = ?auto_815033 ?auto_815046 ) ) ( not ( = ?auto_815035 ?auto_815036 ) ) ( not ( = ?auto_815035 ?auto_815037 ) ) ( not ( = ?auto_815035 ?auto_815038 ) ) ( not ( = ?auto_815035 ?auto_815039 ) ) ( not ( = ?auto_815035 ?auto_815040 ) ) ( not ( = ?auto_815035 ?auto_815046 ) ) ( not ( = ?auto_815036 ?auto_815037 ) ) ( not ( = ?auto_815036 ?auto_815038 ) ) ( not ( = ?auto_815036 ?auto_815039 ) ) ( not ( = ?auto_815036 ?auto_815040 ) ) ( not ( = ?auto_815036 ?auto_815046 ) ) ( not ( = ?auto_815037 ?auto_815038 ) ) ( not ( = ?auto_815037 ?auto_815039 ) ) ( not ( = ?auto_815037 ?auto_815040 ) ) ( not ( = ?auto_815037 ?auto_815046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_815038 ?auto_815039 ?auto_815040 )
      ( MAKE-10CRATE-VERIFY ?auto_815030 ?auto_815031 ?auto_815032 ?auto_815034 ?auto_815033 ?auto_815035 ?auto_815036 ?auto_815037 ?auto_815038 ?auto_815039 ?auto_815040 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822254 - SURFACE
      ?auto_822255 - SURFACE
      ?auto_822256 - SURFACE
      ?auto_822258 - SURFACE
      ?auto_822257 - SURFACE
      ?auto_822259 - SURFACE
      ?auto_822260 - SURFACE
      ?auto_822261 - SURFACE
      ?auto_822262 - SURFACE
      ?auto_822263 - SURFACE
      ?auto_822264 - SURFACE
      ?auto_822265 - SURFACE
    )
    :vars
    (
      ?auto_822266 - HOIST
      ?auto_822267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_822266 ?auto_822267 ) ( SURFACE-AT ?auto_822264 ?auto_822267 ) ( CLEAR ?auto_822264 ) ( LIFTING ?auto_822266 ?auto_822265 ) ( IS-CRATE ?auto_822265 ) ( not ( = ?auto_822264 ?auto_822265 ) ) ( ON ?auto_822255 ?auto_822254 ) ( ON ?auto_822256 ?auto_822255 ) ( ON ?auto_822258 ?auto_822256 ) ( ON ?auto_822257 ?auto_822258 ) ( ON ?auto_822259 ?auto_822257 ) ( ON ?auto_822260 ?auto_822259 ) ( ON ?auto_822261 ?auto_822260 ) ( ON ?auto_822262 ?auto_822261 ) ( ON ?auto_822263 ?auto_822262 ) ( ON ?auto_822264 ?auto_822263 ) ( not ( = ?auto_822254 ?auto_822255 ) ) ( not ( = ?auto_822254 ?auto_822256 ) ) ( not ( = ?auto_822254 ?auto_822258 ) ) ( not ( = ?auto_822254 ?auto_822257 ) ) ( not ( = ?auto_822254 ?auto_822259 ) ) ( not ( = ?auto_822254 ?auto_822260 ) ) ( not ( = ?auto_822254 ?auto_822261 ) ) ( not ( = ?auto_822254 ?auto_822262 ) ) ( not ( = ?auto_822254 ?auto_822263 ) ) ( not ( = ?auto_822254 ?auto_822264 ) ) ( not ( = ?auto_822254 ?auto_822265 ) ) ( not ( = ?auto_822255 ?auto_822256 ) ) ( not ( = ?auto_822255 ?auto_822258 ) ) ( not ( = ?auto_822255 ?auto_822257 ) ) ( not ( = ?auto_822255 ?auto_822259 ) ) ( not ( = ?auto_822255 ?auto_822260 ) ) ( not ( = ?auto_822255 ?auto_822261 ) ) ( not ( = ?auto_822255 ?auto_822262 ) ) ( not ( = ?auto_822255 ?auto_822263 ) ) ( not ( = ?auto_822255 ?auto_822264 ) ) ( not ( = ?auto_822255 ?auto_822265 ) ) ( not ( = ?auto_822256 ?auto_822258 ) ) ( not ( = ?auto_822256 ?auto_822257 ) ) ( not ( = ?auto_822256 ?auto_822259 ) ) ( not ( = ?auto_822256 ?auto_822260 ) ) ( not ( = ?auto_822256 ?auto_822261 ) ) ( not ( = ?auto_822256 ?auto_822262 ) ) ( not ( = ?auto_822256 ?auto_822263 ) ) ( not ( = ?auto_822256 ?auto_822264 ) ) ( not ( = ?auto_822256 ?auto_822265 ) ) ( not ( = ?auto_822258 ?auto_822257 ) ) ( not ( = ?auto_822258 ?auto_822259 ) ) ( not ( = ?auto_822258 ?auto_822260 ) ) ( not ( = ?auto_822258 ?auto_822261 ) ) ( not ( = ?auto_822258 ?auto_822262 ) ) ( not ( = ?auto_822258 ?auto_822263 ) ) ( not ( = ?auto_822258 ?auto_822264 ) ) ( not ( = ?auto_822258 ?auto_822265 ) ) ( not ( = ?auto_822257 ?auto_822259 ) ) ( not ( = ?auto_822257 ?auto_822260 ) ) ( not ( = ?auto_822257 ?auto_822261 ) ) ( not ( = ?auto_822257 ?auto_822262 ) ) ( not ( = ?auto_822257 ?auto_822263 ) ) ( not ( = ?auto_822257 ?auto_822264 ) ) ( not ( = ?auto_822257 ?auto_822265 ) ) ( not ( = ?auto_822259 ?auto_822260 ) ) ( not ( = ?auto_822259 ?auto_822261 ) ) ( not ( = ?auto_822259 ?auto_822262 ) ) ( not ( = ?auto_822259 ?auto_822263 ) ) ( not ( = ?auto_822259 ?auto_822264 ) ) ( not ( = ?auto_822259 ?auto_822265 ) ) ( not ( = ?auto_822260 ?auto_822261 ) ) ( not ( = ?auto_822260 ?auto_822262 ) ) ( not ( = ?auto_822260 ?auto_822263 ) ) ( not ( = ?auto_822260 ?auto_822264 ) ) ( not ( = ?auto_822260 ?auto_822265 ) ) ( not ( = ?auto_822261 ?auto_822262 ) ) ( not ( = ?auto_822261 ?auto_822263 ) ) ( not ( = ?auto_822261 ?auto_822264 ) ) ( not ( = ?auto_822261 ?auto_822265 ) ) ( not ( = ?auto_822262 ?auto_822263 ) ) ( not ( = ?auto_822262 ?auto_822264 ) ) ( not ( = ?auto_822262 ?auto_822265 ) ) ( not ( = ?auto_822263 ?auto_822264 ) ) ( not ( = ?auto_822263 ?auto_822265 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_822264 ?auto_822265 )
      ( MAKE-11CRATE-VERIFY ?auto_822254 ?auto_822255 ?auto_822256 ?auto_822258 ?auto_822257 ?auto_822259 ?auto_822260 ?auto_822261 ?auto_822262 ?auto_822263 ?auto_822264 ?auto_822265 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822363 - SURFACE
      ?auto_822364 - SURFACE
      ?auto_822365 - SURFACE
      ?auto_822367 - SURFACE
      ?auto_822366 - SURFACE
      ?auto_822368 - SURFACE
      ?auto_822369 - SURFACE
      ?auto_822370 - SURFACE
      ?auto_822371 - SURFACE
      ?auto_822372 - SURFACE
      ?auto_822373 - SURFACE
      ?auto_822374 - SURFACE
    )
    :vars
    (
      ?auto_822375 - HOIST
      ?auto_822376 - PLACE
      ?auto_822377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_822375 ?auto_822376 ) ( SURFACE-AT ?auto_822373 ?auto_822376 ) ( CLEAR ?auto_822373 ) ( IS-CRATE ?auto_822374 ) ( not ( = ?auto_822373 ?auto_822374 ) ) ( TRUCK-AT ?auto_822377 ?auto_822376 ) ( AVAILABLE ?auto_822375 ) ( IN ?auto_822374 ?auto_822377 ) ( ON ?auto_822373 ?auto_822372 ) ( not ( = ?auto_822372 ?auto_822373 ) ) ( not ( = ?auto_822372 ?auto_822374 ) ) ( ON ?auto_822364 ?auto_822363 ) ( ON ?auto_822365 ?auto_822364 ) ( ON ?auto_822367 ?auto_822365 ) ( ON ?auto_822366 ?auto_822367 ) ( ON ?auto_822368 ?auto_822366 ) ( ON ?auto_822369 ?auto_822368 ) ( ON ?auto_822370 ?auto_822369 ) ( ON ?auto_822371 ?auto_822370 ) ( ON ?auto_822372 ?auto_822371 ) ( not ( = ?auto_822363 ?auto_822364 ) ) ( not ( = ?auto_822363 ?auto_822365 ) ) ( not ( = ?auto_822363 ?auto_822367 ) ) ( not ( = ?auto_822363 ?auto_822366 ) ) ( not ( = ?auto_822363 ?auto_822368 ) ) ( not ( = ?auto_822363 ?auto_822369 ) ) ( not ( = ?auto_822363 ?auto_822370 ) ) ( not ( = ?auto_822363 ?auto_822371 ) ) ( not ( = ?auto_822363 ?auto_822372 ) ) ( not ( = ?auto_822363 ?auto_822373 ) ) ( not ( = ?auto_822363 ?auto_822374 ) ) ( not ( = ?auto_822364 ?auto_822365 ) ) ( not ( = ?auto_822364 ?auto_822367 ) ) ( not ( = ?auto_822364 ?auto_822366 ) ) ( not ( = ?auto_822364 ?auto_822368 ) ) ( not ( = ?auto_822364 ?auto_822369 ) ) ( not ( = ?auto_822364 ?auto_822370 ) ) ( not ( = ?auto_822364 ?auto_822371 ) ) ( not ( = ?auto_822364 ?auto_822372 ) ) ( not ( = ?auto_822364 ?auto_822373 ) ) ( not ( = ?auto_822364 ?auto_822374 ) ) ( not ( = ?auto_822365 ?auto_822367 ) ) ( not ( = ?auto_822365 ?auto_822366 ) ) ( not ( = ?auto_822365 ?auto_822368 ) ) ( not ( = ?auto_822365 ?auto_822369 ) ) ( not ( = ?auto_822365 ?auto_822370 ) ) ( not ( = ?auto_822365 ?auto_822371 ) ) ( not ( = ?auto_822365 ?auto_822372 ) ) ( not ( = ?auto_822365 ?auto_822373 ) ) ( not ( = ?auto_822365 ?auto_822374 ) ) ( not ( = ?auto_822367 ?auto_822366 ) ) ( not ( = ?auto_822367 ?auto_822368 ) ) ( not ( = ?auto_822367 ?auto_822369 ) ) ( not ( = ?auto_822367 ?auto_822370 ) ) ( not ( = ?auto_822367 ?auto_822371 ) ) ( not ( = ?auto_822367 ?auto_822372 ) ) ( not ( = ?auto_822367 ?auto_822373 ) ) ( not ( = ?auto_822367 ?auto_822374 ) ) ( not ( = ?auto_822366 ?auto_822368 ) ) ( not ( = ?auto_822366 ?auto_822369 ) ) ( not ( = ?auto_822366 ?auto_822370 ) ) ( not ( = ?auto_822366 ?auto_822371 ) ) ( not ( = ?auto_822366 ?auto_822372 ) ) ( not ( = ?auto_822366 ?auto_822373 ) ) ( not ( = ?auto_822366 ?auto_822374 ) ) ( not ( = ?auto_822368 ?auto_822369 ) ) ( not ( = ?auto_822368 ?auto_822370 ) ) ( not ( = ?auto_822368 ?auto_822371 ) ) ( not ( = ?auto_822368 ?auto_822372 ) ) ( not ( = ?auto_822368 ?auto_822373 ) ) ( not ( = ?auto_822368 ?auto_822374 ) ) ( not ( = ?auto_822369 ?auto_822370 ) ) ( not ( = ?auto_822369 ?auto_822371 ) ) ( not ( = ?auto_822369 ?auto_822372 ) ) ( not ( = ?auto_822369 ?auto_822373 ) ) ( not ( = ?auto_822369 ?auto_822374 ) ) ( not ( = ?auto_822370 ?auto_822371 ) ) ( not ( = ?auto_822370 ?auto_822372 ) ) ( not ( = ?auto_822370 ?auto_822373 ) ) ( not ( = ?auto_822370 ?auto_822374 ) ) ( not ( = ?auto_822371 ?auto_822372 ) ) ( not ( = ?auto_822371 ?auto_822373 ) ) ( not ( = ?auto_822371 ?auto_822374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_822372 ?auto_822373 ?auto_822374 )
      ( MAKE-11CRATE-VERIFY ?auto_822363 ?auto_822364 ?auto_822365 ?auto_822367 ?auto_822366 ?auto_822368 ?auto_822369 ?auto_822370 ?auto_822371 ?auto_822372 ?auto_822373 ?auto_822374 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822484 - SURFACE
      ?auto_822485 - SURFACE
      ?auto_822486 - SURFACE
      ?auto_822488 - SURFACE
      ?auto_822487 - SURFACE
      ?auto_822489 - SURFACE
      ?auto_822490 - SURFACE
      ?auto_822491 - SURFACE
      ?auto_822492 - SURFACE
      ?auto_822493 - SURFACE
      ?auto_822494 - SURFACE
      ?auto_822495 - SURFACE
    )
    :vars
    (
      ?auto_822498 - HOIST
      ?auto_822499 - PLACE
      ?auto_822496 - TRUCK
      ?auto_822497 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_822498 ?auto_822499 ) ( SURFACE-AT ?auto_822494 ?auto_822499 ) ( CLEAR ?auto_822494 ) ( IS-CRATE ?auto_822495 ) ( not ( = ?auto_822494 ?auto_822495 ) ) ( AVAILABLE ?auto_822498 ) ( IN ?auto_822495 ?auto_822496 ) ( ON ?auto_822494 ?auto_822493 ) ( not ( = ?auto_822493 ?auto_822494 ) ) ( not ( = ?auto_822493 ?auto_822495 ) ) ( TRUCK-AT ?auto_822496 ?auto_822497 ) ( not ( = ?auto_822497 ?auto_822499 ) ) ( ON ?auto_822485 ?auto_822484 ) ( ON ?auto_822486 ?auto_822485 ) ( ON ?auto_822488 ?auto_822486 ) ( ON ?auto_822487 ?auto_822488 ) ( ON ?auto_822489 ?auto_822487 ) ( ON ?auto_822490 ?auto_822489 ) ( ON ?auto_822491 ?auto_822490 ) ( ON ?auto_822492 ?auto_822491 ) ( ON ?auto_822493 ?auto_822492 ) ( not ( = ?auto_822484 ?auto_822485 ) ) ( not ( = ?auto_822484 ?auto_822486 ) ) ( not ( = ?auto_822484 ?auto_822488 ) ) ( not ( = ?auto_822484 ?auto_822487 ) ) ( not ( = ?auto_822484 ?auto_822489 ) ) ( not ( = ?auto_822484 ?auto_822490 ) ) ( not ( = ?auto_822484 ?auto_822491 ) ) ( not ( = ?auto_822484 ?auto_822492 ) ) ( not ( = ?auto_822484 ?auto_822493 ) ) ( not ( = ?auto_822484 ?auto_822494 ) ) ( not ( = ?auto_822484 ?auto_822495 ) ) ( not ( = ?auto_822485 ?auto_822486 ) ) ( not ( = ?auto_822485 ?auto_822488 ) ) ( not ( = ?auto_822485 ?auto_822487 ) ) ( not ( = ?auto_822485 ?auto_822489 ) ) ( not ( = ?auto_822485 ?auto_822490 ) ) ( not ( = ?auto_822485 ?auto_822491 ) ) ( not ( = ?auto_822485 ?auto_822492 ) ) ( not ( = ?auto_822485 ?auto_822493 ) ) ( not ( = ?auto_822485 ?auto_822494 ) ) ( not ( = ?auto_822485 ?auto_822495 ) ) ( not ( = ?auto_822486 ?auto_822488 ) ) ( not ( = ?auto_822486 ?auto_822487 ) ) ( not ( = ?auto_822486 ?auto_822489 ) ) ( not ( = ?auto_822486 ?auto_822490 ) ) ( not ( = ?auto_822486 ?auto_822491 ) ) ( not ( = ?auto_822486 ?auto_822492 ) ) ( not ( = ?auto_822486 ?auto_822493 ) ) ( not ( = ?auto_822486 ?auto_822494 ) ) ( not ( = ?auto_822486 ?auto_822495 ) ) ( not ( = ?auto_822488 ?auto_822487 ) ) ( not ( = ?auto_822488 ?auto_822489 ) ) ( not ( = ?auto_822488 ?auto_822490 ) ) ( not ( = ?auto_822488 ?auto_822491 ) ) ( not ( = ?auto_822488 ?auto_822492 ) ) ( not ( = ?auto_822488 ?auto_822493 ) ) ( not ( = ?auto_822488 ?auto_822494 ) ) ( not ( = ?auto_822488 ?auto_822495 ) ) ( not ( = ?auto_822487 ?auto_822489 ) ) ( not ( = ?auto_822487 ?auto_822490 ) ) ( not ( = ?auto_822487 ?auto_822491 ) ) ( not ( = ?auto_822487 ?auto_822492 ) ) ( not ( = ?auto_822487 ?auto_822493 ) ) ( not ( = ?auto_822487 ?auto_822494 ) ) ( not ( = ?auto_822487 ?auto_822495 ) ) ( not ( = ?auto_822489 ?auto_822490 ) ) ( not ( = ?auto_822489 ?auto_822491 ) ) ( not ( = ?auto_822489 ?auto_822492 ) ) ( not ( = ?auto_822489 ?auto_822493 ) ) ( not ( = ?auto_822489 ?auto_822494 ) ) ( not ( = ?auto_822489 ?auto_822495 ) ) ( not ( = ?auto_822490 ?auto_822491 ) ) ( not ( = ?auto_822490 ?auto_822492 ) ) ( not ( = ?auto_822490 ?auto_822493 ) ) ( not ( = ?auto_822490 ?auto_822494 ) ) ( not ( = ?auto_822490 ?auto_822495 ) ) ( not ( = ?auto_822491 ?auto_822492 ) ) ( not ( = ?auto_822491 ?auto_822493 ) ) ( not ( = ?auto_822491 ?auto_822494 ) ) ( not ( = ?auto_822491 ?auto_822495 ) ) ( not ( = ?auto_822492 ?auto_822493 ) ) ( not ( = ?auto_822492 ?auto_822494 ) ) ( not ( = ?auto_822492 ?auto_822495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_822493 ?auto_822494 ?auto_822495 )
      ( MAKE-11CRATE-VERIFY ?auto_822484 ?auto_822485 ?auto_822486 ?auto_822488 ?auto_822487 ?auto_822489 ?auto_822490 ?auto_822491 ?auto_822492 ?auto_822493 ?auto_822494 ?auto_822495 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822616 - SURFACE
      ?auto_822617 - SURFACE
      ?auto_822618 - SURFACE
      ?auto_822620 - SURFACE
      ?auto_822619 - SURFACE
      ?auto_822621 - SURFACE
      ?auto_822622 - SURFACE
      ?auto_822623 - SURFACE
      ?auto_822624 - SURFACE
      ?auto_822625 - SURFACE
      ?auto_822626 - SURFACE
      ?auto_822627 - SURFACE
    )
    :vars
    (
      ?auto_822631 - HOIST
      ?auto_822629 - PLACE
      ?auto_822628 - TRUCK
      ?auto_822630 - PLACE
      ?auto_822632 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_822631 ?auto_822629 ) ( SURFACE-AT ?auto_822626 ?auto_822629 ) ( CLEAR ?auto_822626 ) ( IS-CRATE ?auto_822627 ) ( not ( = ?auto_822626 ?auto_822627 ) ) ( AVAILABLE ?auto_822631 ) ( ON ?auto_822626 ?auto_822625 ) ( not ( = ?auto_822625 ?auto_822626 ) ) ( not ( = ?auto_822625 ?auto_822627 ) ) ( TRUCK-AT ?auto_822628 ?auto_822630 ) ( not ( = ?auto_822630 ?auto_822629 ) ) ( HOIST-AT ?auto_822632 ?auto_822630 ) ( LIFTING ?auto_822632 ?auto_822627 ) ( not ( = ?auto_822631 ?auto_822632 ) ) ( ON ?auto_822617 ?auto_822616 ) ( ON ?auto_822618 ?auto_822617 ) ( ON ?auto_822620 ?auto_822618 ) ( ON ?auto_822619 ?auto_822620 ) ( ON ?auto_822621 ?auto_822619 ) ( ON ?auto_822622 ?auto_822621 ) ( ON ?auto_822623 ?auto_822622 ) ( ON ?auto_822624 ?auto_822623 ) ( ON ?auto_822625 ?auto_822624 ) ( not ( = ?auto_822616 ?auto_822617 ) ) ( not ( = ?auto_822616 ?auto_822618 ) ) ( not ( = ?auto_822616 ?auto_822620 ) ) ( not ( = ?auto_822616 ?auto_822619 ) ) ( not ( = ?auto_822616 ?auto_822621 ) ) ( not ( = ?auto_822616 ?auto_822622 ) ) ( not ( = ?auto_822616 ?auto_822623 ) ) ( not ( = ?auto_822616 ?auto_822624 ) ) ( not ( = ?auto_822616 ?auto_822625 ) ) ( not ( = ?auto_822616 ?auto_822626 ) ) ( not ( = ?auto_822616 ?auto_822627 ) ) ( not ( = ?auto_822617 ?auto_822618 ) ) ( not ( = ?auto_822617 ?auto_822620 ) ) ( not ( = ?auto_822617 ?auto_822619 ) ) ( not ( = ?auto_822617 ?auto_822621 ) ) ( not ( = ?auto_822617 ?auto_822622 ) ) ( not ( = ?auto_822617 ?auto_822623 ) ) ( not ( = ?auto_822617 ?auto_822624 ) ) ( not ( = ?auto_822617 ?auto_822625 ) ) ( not ( = ?auto_822617 ?auto_822626 ) ) ( not ( = ?auto_822617 ?auto_822627 ) ) ( not ( = ?auto_822618 ?auto_822620 ) ) ( not ( = ?auto_822618 ?auto_822619 ) ) ( not ( = ?auto_822618 ?auto_822621 ) ) ( not ( = ?auto_822618 ?auto_822622 ) ) ( not ( = ?auto_822618 ?auto_822623 ) ) ( not ( = ?auto_822618 ?auto_822624 ) ) ( not ( = ?auto_822618 ?auto_822625 ) ) ( not ( = ?auto_822618 ?auto_822626 ) ) ( not ( = ?auto_822618 ?auto_822627 ) ) ( not ( = ?auto_822620 ?auto_822619 ) ) ( not ( = ?auto_822620 ?auto_822621 ) ) ( not ( = ?auto_822620 ?auto_822622 ) ) ( not ( = ?auto_822620 ?auto_822623 ) ) ( not ( = ?auto_822620 ?auto_822624 ) ) ( not ( = ?auto_822620 ?auto_822625 ) ) ( not ( = ?auto_822620 ?auto_822626 ) ) ( not ( = ?auto_822620 ?auto_822627 ) ) ( not ( = ?auto_822619 ?auto_822621 ) ) ( not ( = ?auto_822619 ?auto_822622 ) ) ( not ( = ?auto_822619 ?auto_822623 ) ) ( not ( = ?auto_822619 ?auto_822624 ) ) ( not ( = ?auto_822619 ?auto_822625 ) ) ( not ( = ?auto_822619 ?auto_822626 ) ) ( not ( = ?auto_822619 ?auto_822627 ) ) ( not ( = ?auto_822621 ?auto_822622 ) ) ( not ( = ?auto_822621 ?auto_822623 ) ) ( not ( = ?auto_822621 ?auto_822624 ) ) ( not ( = ?auto_822621 ?auto_822625 ) ) ( not ( = ?auto_822621 ?auto_822626 ) ) ( not ( = ?auto_822621 ?auto_822627 ) ) ( not ( = ?auto_822622 ?auto_822623 ) ) ( not ( = ?auto_822622 ?auto_822624 ) ) ( not ( = ?auto_822622 ?auto_822625 ) ) ( not ( = ?auto_822622 ?auto_822626 ) ) ( not ( = ?auto_822622 ?auto_822627 ) ) ( not ( = ?auto_822623 ?auto_822624 ) ) ( not ( = ?auto_822623 ?auto_822625 ) ) ( not ( = ?auto_822623 ?auto_822626 ) ) ( not ( = ?auto_822623 ?auto_822627 ) ) ( not ( = ?auto_822624 ?auto_822625 ) ) ( not ( = ?auto_822624 ?auto_822626 ) ) ( not ( = ?auto_822624 ?auto_822627 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_822625 ?auto_822626 ?auto_822627 )
      ( MAKE-11CRATE-VERIFY ?auto_822616 ?auto_822617 ?auto_822618 ?auto_822620 ?auto_822619 ?auto_822621 ?auto_822622 ?auto_822623 ?auto_822624 ?auto_822625 ?auto_822626 ?auto_822627 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822759 - SURFACE
      ?auto_822760 - SURFACE
      ?auto_822761 - SURFACE
      ?auto_822763 - SURFACE
      ?auto_822762 - SURFACE
      ?auto_822764 - SURFACE
      ?auto_822765 - SURFACE
      ?auto_822766 - SURFACE
      ?auto_822767 - SURFACE
      ?auto_822768 - SURFACE
      ?auto_822769 - SURFACE
      ?auto_822770 - SURFACE
    )
    :vars
    (
      ?auto_822775 - HOIST
      ?auto_822771 - PLACE
      ?auto_822774 - TRUCK
      ?auto_822772 - PLACE
      ?auto_822776 - HOIST
      ?auto_822773 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_822775 ?auto_822771 ) ( SURFACE-AT ?auto_822769 ?auto_822771 ) ( CLEAR ?auto_822769 ) ( IS-CRATE ?auto_822770 ) ( not ( = ?auto_822769 ?auto_822770 ) ) ( AVAILABLE ?auto_822775 ) ( ON ?auto_822769 ?auto_822768 ) ( not ( = ?auto_822768 ?auto_822769 ) ) ( not ( = ?auto_822768 ?auto_822770 ) ) ( TRUCK-AT ?auto_822774 ?auto_822772 ) ( not ( = ?auto_822772 ?auto_822771 ) ) ( HOIST-AT ?auto_822776 ?auto_822772 ) ( not ( = ?auto_822775 ?auto_822776 ) ) ( AVAILABLE ?auto_822776 ) ( SURFACE-AT ?auto_822770 ?auto_822772 ) ( ON ?auto_822770 ?auto_822773 ) ( CLEAR ?auto_822770 ) ( not ( = ?auto_822769 ?auto_822773 ) ) ( not ( = ?auto_822770 ?auto_822773 ) ) ( not ( = ?auto_822768 ?auto_822773 ) ) ( ON ?auto_822760 ?auto_822759 ) ( ON ?auto_822761 ?auto_822760 ) ( ON ?auto_822763 ?auto_822761 ) ( ON ?auto_822762 ?auto_822763 ) ( ON ?auto_822764 ?auto_822762 ) ( ON ?auto_822765 ?auto_822764 ) ( ON ?auto_822766 ?auto_822765 ) ( ON ?auto_822767 ?auto_822766 ) ( ON ?auto_822768 ?auto_822767 ) ( not ( = ?auto_822759 ?auto_822760 ) ) ( not ( = ?auto_822759 ?auto_822761 ) ) ( not ( = ?auto_822759 ?auto_822763 ) ) ( not ( = ?auto_822759 ?auto_822762 ) ) ( not ( = ?auto_822759 ?auto_822764 ) ) ( not ( = ?auto_822759 ?auto_822765 ) ) ( not ( = ?auto_822759 ?auto_822766 ) ) ( not ( = ?auto_822759 ?auto_822767 ) ) ( not ( = ?auto_822759 ?auto_822768 ) ) ( not ( = ?auto_822759 ?auto_822769 ) ) ( not ( = ?auto_822759 ?auto_822770 ) ) ( not ( = ?auto_822759 ?auto_822773 ) ) ( not ( = ?auto_822760 ?auto_822761 ) ) ( not ( = ?auto_822760 ?auto_822763 ) ) ( not ( = ?auto_822760 ?auto_822762 ) ) ( not ( = ?auto_822760 ?auto_822764 ) ) ( not ( = ?auto_822760 ?auto_822765 ) ) ( not ( = ?auto_822760 ?auto_822766 ) ) ( not ( = ?auto_822760 ?auto_822767 ) ) ( not ( = ?auto_822760 ?auto_822768 ) ) ( not ( = ?auto_822760 ?auto_822769 ) ) ( not ( = ?auto_822760 ?auto_822770 ) ) ( not ( = ?auto_822760 ?auto_822773 ) ) ( not ( = ?auto_822761 ?auto_822763 ) ) ( not ( = ?auto_822761 ?auto_822762 ) ) ( not ( = ?auto_822761 ?auto_822764 ) ) ( not ( = ?auto_822761 ?auto_822765 ) ) ( not ( = ?auto_822761 ?auto_822766 ) ) ( not ( = ?auto_822761 ?auto_822767 ) ) ( not ( = ?auto_822761 ?auto_822768 ) ) ( not ( = ?auto_822761 ?auto_822769 ) ) ( not ( = ?auto_822761 ?auto_822770 ) ) ( not ( = ?auto_822761 ?auto_822773 ) ) ( not ( = ?auto_822763 ?auto_822762 ) ) ( not ( = ?auto_822763 ?auto_822764 ) ) ( not ( = ?auto_822763 ?auto_822765 ) ) ( not ( = ?auto_822763 ?auto_822766 ) ) ( not ( = ?auto_822763 ?auto_822767 ) ) ( not ( = ?auto_822763 ?auto_822768 ) ) ( not ( = ?auto_822763 ?auto_822769 ) ) ( not ( = ?auto_822763 ?auto_822770 ) ) ( not ( = ?auto_822763 ?auto_822773 ) ) ( not ( = ?auto_822762 ?auto_822764 ) ) ( not ( = ?auto_822762 ?auto_822765 ) ) ( not ( = ?auto_822762 ?auto_822766 ) ) ( not ( = ?auto_822762 ?auto_822767 ) ) ( not ( = ?auto_822762 ?auto_822768 ) ) ( not ( = ?auto_822762 ?auto_822769 ) ) ( not ( = ?auto_822762 ?auto_822770 ) ) ( not ( = ?auto_822762 ?auto_822773 ) ) ( not ( = ?auto_822764 ?auto_822765 ) ) ( not ( = ?auto_822764 ?auto_822766 ) ) ( not ( = ?auto_822764 ?auto_822767 ) ) ( not ( = ?auto_822764 ?auto_822768 ) ) ( not ( = ?auto_822764 ?auto_822769 ) ) ( not ( = ?auto_822764 ?auto_822770 ) ) ( not ( = ?auto_822764 ?auto_822773 ) ) ( not ( = ?auto_822765 ?auto_822766 ) ) ( not ( = ?auto_822765 ?auto_822767 ) ) ( not ( = ?auto_822765 ?auto_822768 ) ) ( not ( = ?auto_822765 ?auto_822769 ) ) ( not ( = ?auto_822765 ?auto_822770 ) ) ( not ( = ?auto_822765 ?auto_822773 ) ) ( not ( = ?auto_822766 ?auto_822767 ) ) ( not ( = ?auto_822766 ?auto_822768 ) ) ( not ( = ?auto_822766 ?auto_822769 ) ) ( not ( = ?auto_822766 ?auto_822770 ) ) ( not ( = ?auto_822766 ?auto_822773 ) ) ( not ( = ?auto_822767 ?auto_822768 ) ) ( not ( = ?auto_822767 ?auto_822769 ) ) ( not ( = ?auto_822767 ?auto_822770 ) ) ( not ( = ?auto_822767 ?auto_822773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_822768 ?auto_822769 ?auto_822770 )
      ( MAKE-11CRATE-VERIFY ?auto_822759 ?auto_822760 ?auto_822761 ?auto_822763 ?auto_822762 ?auto_822764 ?auto_822765 ?auto_822766 ?auto_822767 ?auto_822768 ?auto_822769 ?auto_822770 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_822903 - SURFACE
      ?auto_822904 - SURFACE
      ?auto_822905 - SURFACE
      ?auto_822907 - SURFACE
      ?auto_822906 - SURFACE
      ?auto_822908 - SURFACE
      ?auto_822909 - SURFACE
      ?auto_822910 - SURFACE
      ?auto_822911 - SURFACE
      ?auto_822912 - SURFACE
      ?auto_822913 - SURFACE
      ?auto_822914 - SURFACE
    )
    :vars
    (
      ?auto_822918 - HOIST
      ?auto_822919 - PLACE
      ?auto_822916 - PLACE
      ?auto_822920 - HOIST
      ?auto_822917 - SURFACE
      ?auto_822915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_822918 ?auto_822919 ) ( SURFACE-AT ?auto_822913 ?auto_822919 ) ( CLEAR ?auto_822913 ) ( IS-CRATE ?auto_822914 ) ( not ( = ?auto_822913 ?auto_822914 ) ) ( AVAILABLE ?auto_822918 ) ( ON ?auto_822913 ?auto_822912 ) ( not ( = ?auto_822912 ?auto_822913 ) ) ( not ( = ?auto_822912 ?auto_822914 ) ) ( not ( = ?auto_822916 ?auto_822919 ) ) ( HOIST-AT ?auto_822920 ?auto_822916 ) ( not ( = ?auto_822918 ?auto_822920 ) ) ( AVAILABLE ?auto_822920 ) ( SURFACE-AT ?auto_822914 ?auto_822916 ) ( ON ?auto_822914 ?auto_822917 ) ( CLEAR ?auto_822914 ) ( not ( = ?auto_822913 ?auto_822917 ) ) ( not ( = ?auto_822914 ?auto_822917 ) ) ( not ( = ?auto_822912 ?auto_822917 ) ) ( TRUCK-AT ?auto_822915 ?auto_822919 ) ( ON ?auto_822904 ?auto_822903 ) ( ON ?auto_822905 ?auto_822904 ) ( ON ?auto_822907 ?auto_822905 ) ( ON ?auto_822906 ?auto_822907 ) ( ON ?auto_822908 ?auto_822906 ) ( ON ?auto_822909 ?auto_822908 ) ( ON ?auto_822910 ?auto_822909 ) ( ON ?auto_822911 ?auto_822910 ) ( ON ?auto_822912 ?auto_822911 ) ( not ( = ?auto_822903 ?auto_822904 ) ) ( not ( = ?auto_822903 ?auto_822905 ) ) ( not ( = ?auto_822903 ?auto_822907 ) ) ( not ( = ?auto_822903 ?auto_822906 ) ) ( not ( = ?auto_822903 ?auto_822908 ) ) ( not ( = ?auto_822903 ?auto_822909 ) ) ( not ( = ?auto_822903 ?auto_822910 ) ) ( not ( = ?auto_822903 ?auto_822911 ) ) ( not ( = ?auto_822903 ?auto_822912 ) ) ( not ( = ?auto_822903 ?auto_822913 ) ) ( not ( = ?auto_822903 ?auto_822914 ) ) ( not ( = ?auto_822903 ?auto_822917 ) ) ( not ( = ?auto_822904 ?auto_822905 ) ) ( not ( = ?auto_822904 ?auto_822907 ) ) ( not ( = ?auto_822904 ?auto_822906 ) ) ( not ( = ?auto_822904 ?auto_822908 ) ) ( not ( = ?auto_822904 ?auto_822909 ) ) ( not ( = ?auto_822904 ?auto_822910 ) ) ( not ( = ?auto_822904 ?auto_822911 ) ) ( not ( = ?auto_822904 ?auto_822912 ) ) ( not ( = ?auto_822904 ?auto_822913 ) ) ( not ( = ?auto_822904 ?auto_822914 ) ) ( not ( = ?auto_822904 ?auto_822917 ) ) ( not ( = ?auto_822905 ?auto_822907 ) ) ( not ( = ?auto_822905 ?auto_822906 ) ) ( not ( = ?auto_822905 ?auto_822908 ) ) ( not ( = ?auto_822905 ?auto_822909 ) ) ( not ( = ?auto_822905 ?auto_822910 ) ) ( not ( = ?auto_822905 ?auto_822911 ) ) ( not ( = ?auto_822905 ?auto_822912 ) ) ( not ( = ?auto_822905 ?auto_822913 ) ) ( not ( = ?auto_822905 ?auto_822914 ) ) ( not ( = ?auto_822905 ?auto_822917 ) ) ( not ( = ?auto_822907 ?auto_822906 ) ) ( not ( = ?auto_822907 ?auto_822908 ) ) ( not ( = ?auto_822907 ?auto_822909 ) ) ( not ( = ?auto_822907 ?auto_822910 ) ) ( not ( = ?auto_822907 ?auto_822911 ) ) ( not ( = ?auto_822907 ?auto_822912 ) ) ( not ( = ?auto_822907 ?auto_822913 ) ) ( not ( = ?auto_822907 ?auto_822914 ) ) ( not ( = ?auto_822907 ?auto_822917 ) ) ( not ( = ?auto_822906 ?auto_822908 ) ) ( not ( = ?auto_822906 ?auto_822909 ) ) ( not ( = ?auto_822906 ?auto_822910 ) ) ( not ( = ?auto_822906 ?auto_822911 ) ) ( not ( = ?auto_822906 ?auto_822912 ) ) ( not ( = ?auto_822906 ?auto_822913 ) ) ( not ( = ?auto_822906 ?auto_822914 ) ) ( not ( = ?auto_822906 ?auto_822917 ) ) ( not ( = ?auto_822908 ?auto_822909 ) ) ( not ( = ?auto_822908 ?auto_822910 ) ) ( not ( = ?auto_822908 ?auto_822911 ) ) ( not ( = ?auto_822908 ?auto_822912 ) ) ( not ( = ?auto_822908 ?auto_822913 ) ) ( not ( = ?auto_822908 ?auto_822914 ) ) ( not ( = ?auto_822908 ?auto_822917 ) ) ( not ( = ?auto_822909 ?auto_822910 ) ) ( not ( = ?auto_822909 ?auto_822911 ) ) ( not ( = ?auto_822909 ?auto_822912 ) ) ( not ( = ?auto_822909 ?auto_822913 ) ) ( not ( = ?auto_822909 ?auto_822914 ) ) ( not ( = ?auto_822909 ?auto_822917 ) ) ( not ( = ?auto_822910 ?auto_822911 ) ) ( not ( = ?auto_822910 ?auto_822912 ) ) ( not ( = ?auto_822910 ?auto_822913 ) ) ( not ( = ?auto_822910 ?auto_822914 ) ) ( not ( = ?auto_822910 ?auto_822917 ) ) ( not ( = ?auto_822911 ?auto_822912 ) ) ( not ( = ?auto_822911 ?auto_822913 ) ) ( not ( = ?auto_822911 ?auto_822914 ) ) ( not ( = ?auto_822911 ?auto_822917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_822912 ?auto_822913 ?auto_822914 )
      ( MAKE-11CRATE-VERIFY ?auto_822903 ?auto_822904 ?auto_822905 ?auto_822907 ?auto_822906 ?auto_822908 ?auto_822909 ?auto_822910 ?auto_822911 ?auto_822912 ?auto_822913 ?auto_822914 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823047 - SURFACE
      ?auto_823048 - SURFACE
      ?auto_823049 - SURFACE
      ?auto_823051 - SURFACE
      ?auto_823050 - SURFACE
      ?auto_823052 - SURFACE
      ?auto_823053 - SURFACE
      ?auto_823054 - SURFACE
      ?auto_823055 - SURFACE
      ?auto_823056 - SURFACE
      ?auto_823057 - SURFACE
      ?auto_823058 - SURFACE
    )
    :vars
    (
      ?auto_823060 - HOIST
      ?auto_823062 - PLACE
      ?auto_823059 - PLACE
      ?auto_823061 - HOIST
      ?auto_823063 - SURFACE
      ?auto_823064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823060 ?auto_823062 ) ( IS-CRATE ?auto_823058 ) ( not ( = ?auto_823057 ?auto_823058 ) ) ( not ( = ?auto_823056 ?auto_823057 ) ) ( not ( = ?auto_823056 ?auto_823058 ) ) ( not ( = ?auto_823059 ?auto_823062 ) ) ( HOIST-AT ?auto_823061 ?auto_823059 ) ( not ( = ?auto_823060 ?auto_823061 ) ) ( AVAILABLE ?auto_823061 ) ( SURFACE-AT ?auto_823058 ?auto_823059 ) ( ON ?auto_823058 ?auto_823063 ) ( CLEAR ?auto_823058 ) ( not ( = ?auto_823057 ?auto_823063 ) ) ( not ( = ?auto_823058 ?auto_823063 ) ) ( not ( = ?auto_823056 ?auto_823063 ) ) ( TRUCK-AT ?auto_823064 ?auto_823062 ) ( SURFACE-AT ?auto_823056 ?auto_823062 ) ( CLEAR ?auto_823056 ) ( LIFTING ?auto_823060 ?auto_823057 ) ( IS-CRATE ?auto_823057 ) ( ON ?auto_823048 ?auto_823047 ) ( ON ?auto_823049 ?auto_823048 ) ( ON ?auto_823051 ?auto_823049 ) ( ON ?auto_823050 ?auto_823051 ) ( ON ?auto_823052 ?auto_823050 ) ( ON ?auto_823053 ?auto_823052 ) ( ON ?auto_823054 ?auto_823053 ) ( ON ?auto_823055 ?auto_823054 ) ( ON ?auto_823056 ?auto_823055 ) ( not ( = ?auto_823047 ?auto_823048 ) ) ( not ( = ?auto_823047 ?auto_823049 ) ) ( not ( = ?auto_823047 ?auto_823051 ) ) ( not ( = ?auto_823047 ?auto_823050 ) ) ( not ( = ?auto_823047 ?auto_823052 ) ) ( not ( = ?auto_823047 ?auto_823053 ) ) ( not ( = ?auto_823047 ?auto_823054 ) ) ( not ( = ?auto_823047 ?auto_823055 ) ) ( not ( = ?auto_823047 ?auto_823056 ) ) ( not ( = ?auto_823047 ?auto_823057 ) ) ( not ( = ?auto_823047 ?auto_823058 ) ) ( not ( = ?auto_823047 ?auto_823063 ) ) ( not ( = ?auto_823048 ?auto_823049 ) ) ( not ( = ?auto_823048 ?auto_823051 ) ) ( not ( = ?auto_823048 ?auto_823050 ) ) ( not ( = ?auto_823048 ?auto_823052 ) ) ( not ( = ?auto_823048 ?auto_823053 ) ) ( not ( = ?auto_823048 ?auto_823054 ) ) ( not ( = ?auto_823048 ?auto_823055 ) ) ( not ( = ?auto_823048 ?auto_823056 ) ) ( not ( = ?auto_823048 ?auto_823057 ) ) ( not ( = ?auto_823048 ?auto_823058 ) ) ( not ( = ?auto_823048 ?auto_823063 ) ) ( not ( = ?auto_823049 ?auto_823051 ) ) ( not ( = ?auto_823049 ?auto_823050 ) ) ( not ( = ?auto_823049 ?auto_823052 ) ) ( not ( = ?auto_823049 ?auto_823053 ) ) ( not ( = ?auto_823049 ?auto_823054 ) ) ( not ( = ?auto_823049 ?auto_823055 ) ) ( not ( = ?auto_823049 ?auto_823056 ) ) ( not ( = ?auto_823049 ?auto_823057 ) ) ( not ( = ?auto_823049 ?auto_823058 ) ) ( not ( = ?auto_823049 ?auto_823063 ) ) ( not ( = ?auto_823051 ?auto_823050 ) ) ( not ( = ?auto_823051 ?auto_823052 ) ) ( not ( = ?auto_823051 ?auto_823053 ) ) ( not ( = ?auto_823051 ?auto_823054 ) ) ( not ( = ?auto_823051 ?auto_823055 ) ) ( not ( = ?auto_823051 ?auto_823056 ) ) ( not ( = ?auto_823051 ?auto_823057 ) ) ( not ( = ?auto_823051 ?auto_823058 ) ) ( not ( = ?auto_823051 ?auto_823063 ) ) ( not ( = ?auto_823050 ?auto_823052 ) ) ( not ( = ?auto_823050 ?auto_823053 ) ) ( not ( = ?auto_823050 ?auto_823054 ) ) ( not ( = ?auto_823050 ?auto_823055 ) ) ( not ( = ?auto_823050 ?auto_823056 ) ) ( not ( = ?auto_823050 ?auto_823057 ) ) ( not ( = ?auto_823050 ?auto_823058 ) ) ( not ( = ?auto_823050 ?auto_823063 ) ) ( not ( = ?auto_823052 ?auto_823053 ) ) ( not ( = ?auto_823052 ?auto_823054 ) ) ( not ( = ?auto_823052 ?auto_823055 ) ) ( not ( = ?auto_823052 ?auto_823056 ) ) ( not ( = ?auto_823052 ?auto_823057 ) ) ( not ( = ?auto_823052 ?auto_823058 ) ) ( not ( = ?auto_823052 ?auto_823063 ) ) ( not ( = ?auto_823053 ?auto_823054 ) ) ( not ( = ?auto_823053 ?auto_823055 ) ) ( not ( = ?auto_823053 ?auto_823056 ) ) ( not ( = ?auto_823053 ?auto_823057 ) ) ( not ( = ?auto_823053 ?auto_823058 ) ) ( not ( = ?auto_823053 ?auto_823063 ) ) ( not ( = ?auto_823054 ?auto_823055 ) ) ( not ( = ?auto_823054 ?auto_823056 ) ) ( not ( = ?auto_823054 ?auto_823057 ) ) ( not ( = ?auto_823054 ?auto_823058 ) ) ( not ( = ?auto_823054 ?auto_823063 ) ) ( not ( = ?auto_823055 ?auto_823056 ) ) ( not ( = ?auto_823055 ?auto_823057 ) ) ( not ( = ?auto_823055 ?auto_823058 ) ) ( not ( = ?auto_823055 ?auto_823063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823056 ?auto_823057 ?auto_823058 )
      ( MAKE-11CRATE-VERIFY ?auto_823047 ?auto_823048 ?auto_823049 ?auto_823051 ?auto_823050 ?auto_823052 ?auto_823053 ?auto_823054 ?auto_823055 ?auto_823056 ?auto_823057 ?auto_823058 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_823191 - SURFACE
      ?auto_823192 - SURFACE
      ?auto_823193 - SURFACE
      ?auto_823195 - SURFACE
      ?auto_823194 - SURFACE
      ?auto_823196 - SURFACE
      ?auto_823197 - SURFACE
      ?auto_823198 - SURFACE
      ?auto_823199 - SURFACE
      ?auto_823200 - SURFACE
      ?auto_823201 - SURFACE
      ?auto_823202 - SURFACE
    )
    :vars
    (
      ?auto_823208 - HOIST
      ?auto_823204 - PLACE
      ?auto_823205 - PLACE
      ?auto_823206 - HOIST
      ?auto_823207 - SURFACE
      ?auto_823203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_823208 ?auto_823204 ) ( IS-CRATE ?auto_823202 ) ( not ( = ?auto_823201 ?auto_823202 ) ) ( not ( = ?auto_823200 ?auto_823201 ) ) ( not ( = ?auto_823200 ?auto_823202 ) ) ( not ( = ?auto_823205 ?auto_823204 ) ) ( HOIST-AT ?auto_823206 ?auto_823205 ) ( not ( = ?auto_823208 ?auto_823206 ) ) ( AVAILABLE ?auto_823206 ) ( SURFACE-AT ?auto_823202 ?auto_823205 ) ( ON ?auto_823202 ?auto_823207 ) ( CLEAR ?auto_823202 ) ( not ( = ?auto_823201 ?auto_823207 ) ) ( not ( = ?auto_823202 ?auto_823207 ) ) ( not ( = ?auto_823200 ?auto_823207 ) ) ( TRUCK-AT ?auto_823203 ?auto_823204 ) ( SURFACE-AT ?auto_823200 ?auto_823204 ) ( CLEAR ?auto_823200 ) ( IS-CRATE ?auto_823201 ) ( AVAILABLE ?auto_823208 ) ( IN ?auto_823201 ?auto_823203 ) ( ON ?auto_823192 ?auto_823191 ) ( ON ?auto_823193 ?auto_823192 ) ( ON ?auto_823195 ?auto_823193 ) ( ON ?auto_823194 ?auto_823195 ) ( ON ?auto_823196 ?auto_823194 ) ( ON ?auto_823197 ?auto_823196 ) ( ON ?auto_823198 ?auto_823197 ) ( ON ?auto_823199 ?auto_823198 ) ( ON ?auto_823200 ?auto_823199 ) ( not ( = ?auto_823191 ?auto_823192 ) ) ( not ( = ?auto_823191 ?auto_823193 ) ) ( not ( = ?auto_823191 ?auto_823195 ) ) ( not ( = ?auto_823191 ?auto_823194 ) ) ( not ( = ?auto_823191 ?auto_823196 ) ) ( not ( = ?auto_823191 ?auto_823197 ) ) ( not ( = ?auto_823191 ?auto_823198 ) ) ( not ( = ?auto_823191 ?auto_823199 ) ) ( not ( = ?auto_823191 ?auto_823200 ) ) ( not ( = ?auto_823191 ?auto_823201 ) ) ( not ( = ?auto_823191 ?auto_823202 ) ) ( not ( = ?auto_823191 ?auto_823207 ) ) ( not ( = ?auto_823192 ?auto_823193 ) ) ( not ( = ?auto_823192 ?auto_823195 ) ) ( not ( = ?auto_823192 ?auto_823194 ) ) ( not ( = ?auto_823192 ?auto_823196 ) ) ( not ( = ?auto_823192 ?auto_823197 ) ) ( not ( = ?auto_823192 ?auto_823198 ) ) ( not ( = ?auto_823192 ?auto_823199 ) ) ( not ( = ?auto_823192 ?auto_823200 ) ) ( not ( = ?auto_823192 ?auto_823201 ) ) ( not ( = ?auto_823192 ?auto_823202 ) ) ( not ( = ?auto_823192 ?auto_823207 ) ) ( not ( = ?auto_823193 ?auto_823195 ) ) ( not ( = ?auto_823193 ?auto_823194 ) ) ( not ( = ?auto_823193 ?auto_823196 ) ) ( not ( = ?auto_823193 ?auto_823197 ) ) ( not ( = ?auto_823193 ?auto_823198 ) ) ( not ( = ?auto_823193 ?auto_823199 ) ) ( not ( = ?auto_823193 ?auto_823200 ) ) ( not ( = ?auto_823193 ?auto_823201 ) ) ( not ( = ?auto_823193 ?auto_823202 ) ) ( not ( = ?auto_823193 ?auto_823207 ) ) ( not ( = ?auto_823195 ?auto_823194 ) ) ( not ( = ?auto_823195 ?auto_823196 ) ) ( not ( = ?auto_823195 ?auto_823197 ) ) ( not ( = ?auto_823195 ?auto_823198 ) ) ( not ( = ?auto_823195 ?auto_823199 ) ) ( not ( = ?auto_823195 ?auto_823200 ) ) ( not ( = ?auto_823195 ?auto_823201 ) ) ( not ( = ?auto_823195 ?auto_823202 ) ) ( not ( = ?auto_823195 ?auto_823207 ) ) ( not ( = ?auto_823194 ?auto_823196 ) ) ( not ( = ?auto_823194 ?auto_823197 ) ) ( not ( = ?auto_823194 ?auto_823198 ) ) ( not ( = ?auto_823194 ?auto_823199 ) ) ( not ( = ?auto_823194 ?auto_823200 ) ) ( not ( = ?auto_823194 ?auto_823201 ) ) ( not ( = ?auto_823194 ?auto_823202 ) ) ( not ( = ?auto_823194 ?auto_823207 ) ) ( not ( = ?auto_823196 ?auto_823197 ) ) ( not ( = ?auto_823196 ?auto_823198 ) ) ( not ( = ?auto_823196 ?auto_823199 ) ) ( not ( = ?auto_823196 ?auto_823200 ) ) ( not ( = ?auto_823196 ?auto_823201 ) ) ( not ( = ?auto_823196 ?auto_823202 ) ) ( not ( = ?auto_823196 ?auto_823207 ) ) ( not ( = ?auto_823197 ?auto_823198 ) ) ( not ( = ?auto_823197 ?auto_823199 ) ) ( not ( = ?auto_823197 ?auto_823200 ) ) ( not ( = ?auto_823197 ?auto_823201 ) ) ( not ( = ?auto_823197 ?auto_823202 ) ) ( not ( = ?auto_823197 ?auto_823207 ) ) ( not ( = ?auto_823198 ?auto_823199 ) ) ( not ( = ?auto_823198 ?auto_823200 ) ) ( not ( = ?auto_823198 ?auto_823201 ) ) ( not ( = ?auto_823198 ?auto_823202 ) ) ( not ( = ?auto_823198 ?auto_823207 ) ) ( not ( = ?auto_823199 ?auto_823200 ) ) ( not ( = ?auto_823199 ?auto_823201 ) ) ( not ( = ?auto_823199 ?auto_823202 ) ) ( not ( = ?auto_823199 ?auto_823207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823200 ?auto_823201 ?auto_823202 )
      ( MAKE-11CRATE-VERIFY ?auto_823191 ?auto_823192 ?auto_823193 ?auto_823195 ?auto_823194 ?auto_823196 ?auto_823197 ?auto_823198 ?auto_823199 ?auto_823200 ?auto_823201 ?auto_823202 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_832435 - SURFACE
      ?auto_832436 - SURFACE
      ?auto_832437 - SURFACE
      ?auto_832439 - SURFACE
      ?auto_832438 - SURFACE
      ?auto_832440 - SURFACE
      ?auto_832441 - SURFACE
      ?auto_832442 - SURFACE
      ?auto_832443 - SURFACE
      ?auto_832444 - SURFACE
      ?auto_832445 - SURFACE
      ?auto_832446 - SURFACE
      ?auto_832447 - SURFACE
    )
    :vars
    (
      ?auto_832448 - HOIST
      ?auto_832449 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_832448 ?auto_832449 ) ( SURFACE-AT ?auto_832446 ?auto_832449 ) ( CLEAR ?auto_832446 ) ( LIFTING ?auto_832448 ?auto_832447 ) ( IS-CRATE ?auto_832447 ) ( not ( = ?auto_832446 ?auto_832447 ) ) ( ON ?auto_832436 ?auto_832435 ) ( ON ?auto_832437 ?auto_832436 ) ( ON ?auto_832439 ?auto_832437 ) ( ON ?auto_832438 ?auto_832439 ) ( ON ?auto_832440 ?auto_832438 ) ( ON ?auto_832441 ?auto_832440 ) ( ON ?auto_832442 ?auto_832441 ) ( ON ?auto_832443 ?auto_832442 ) ( ON ?auto_832444 ?auto_832443 ) ( ON ?auto_832445 ?auto_832444 ) ( ON ?auto_832446 ?auto_832445 ) ( not ( = ?auto_832435 ?auto_832436 ) ) ( not ( = ?auto_832435 ?auto_832437 ) ) ( not ( = ?auto_832435 ?auto_832439 ) ) ( not ( = ?auto_832435 ?auto_832438 ) ) ( not ( = ?auto_832435 ?auto_832440 ) ) ( not ( = ?auto_832435 ?auto_832441 ) ) ( not ( = ?auto_832435 ?auto_832442 ) ) ( not ( = ?auto_832435 ?auto_832443 ) ) ( not ( = ?auto_832435 ?auto_832444 ) ) ( not ( = ?auto_832435 ?auto_832445 ) ) ( not ( = ?auto_832435 ?auto_832446 ) ) ( not ( = ?auto_832435 ?auto_832447 ) ) ( not ( = ?auto_832436 ?auto_832437 ) ) ( not ( = ?auto_832436 ?auto_832439 ) ) ( not ( = ?auto_832436 ?auto_832438 ) ) ( not ( = ?auto_832436 ?auto_832440 ) ) ( not ( = ?auto_832436 ?auto_832441 ) ) ( not ( = ?auto_832436 ?auto_832442 ) ) ( not ( = ?auto_832436 ?auto_832443 ) ) ( not ( = ?auto_832436 ?auto_832444 ) ) ( not ( = ?auto_832436 ?auto_832445 ) ) ( not ( = ?auto_832436 ?auto_832446 ) ) ( not ( = ?auto_832436 ?auto_832447 ) ) ( not ( = ?auto_832437 ?auto_832439 ) ) ( not ( = ?auto_832437 ?auto_832438 ) ) ( not ( = ?auto_832437 ?auto_832440 ) ) ( not ( = ?auto_832437 ?auto_832441 ) ) ( not ( = ?auto_832437 ?auto_832442 ) ) ( not ( = ?auto_832437 ?auto_832443 ) ) ( not ( = ?auto_832437 ?auto_832444 ) ) ( not ( = ?auto_832437 ?auto_832445 ) ) ( not ( = ?auto_832437 ?auto_832446 ) ) ( not ( = ?auto_832437 ?auto_832447 ) ) ( not ( = ?auto_832439 ?auto_832438 ) ) ( not ( = ?auto_832439 ?auto_832440 ) ) ( not ( = ?auto_832439 ?auto_832441 ) ) ( not ( = ?auto_832439 ?auto_832442 ) ) ( not ( = ?auto_832439 ?auto_832443 ) ) ( not ( = ?auto_832439 ?auto_832444 ) ) ( not ( = ?auto_832439 ?auto_832445 ) ) ( not ( = ?auto_832439 ?auto_832446 ) ) ( not ( = ?auto_832439 ?auto_832447 ) ) ( not ( = ?auto_832438 ?auto_832440 ) ) ( not ( = ?auto_832438 ?auto_832441 ) ) ( not ( = ?auto_832438 ?auto_832442 ) ) ( not ( = ?auto_832438 ?auto_832443 ) ) ( not ( = ?auto_832438 ?auto_832444 ) ) ( not ( = ?auto_832438 ?auto_832445 ) ) ( not ( = ?auto_832438 ?auto_832446 ) ) ( not ( = ?auto_832438 ?auto_832447 ) ) ( not ( = ?auto_832440 ?auto_832441 ) ) ( not ( = ?auto_832440 ?auto_832442 ) ) ( not ( = ?auto_832440 ?auto_832443 ) ) ( not ( = ?auto_832440 ?auto_832444 ) ) ( not ( = ?auto_832440 ?auto_832445 ) ) ( not ( = ?auto_832440 ?auto_832446 ) ) ( not ( = ?auto_832440 ?auto_832447 ) ) ( not ( = ?auto_832441 ?auto_832442 ) ) ( not ( = ?auto_832441 ?auto_832443 ) ) ( not ( = ?auto_832441 ?auto_832444 ) ) ( not ( = ?auto_832441 ?auto_832445 ) ) ( not ( = ?auto_832441 ?auto_832446 ) ) ( not ( = ?auto_832441 ?auto_832447 ) ) ( not ( = ?auto_832442 ?auto_832443 ) ) ( not ( = ?auto_832442 ?auto_832444 ) ) ( not ( = ?auto_832442 ?auto_832445 ) ) ( not ( = ?auto_832442 ?auto_832446 ) ) ( not ( = ?auto_832442 ?auto_832447 ) ) ( not ( = ?auto_832443 ?auto_832444 ) ) ( not ( = ?auto_832443 ?auto_832445 ) ) ( not ( = ?auto_832443 ?auto_832446 ) ) ( not ( = ?auto_832443 ?auto_832447 ) ) ( not ( = ?auto_832444 ?auto_832445 ) ) ( not ( = ?auto_832444 ?auto_832446 ) ) ( not ( = ?auto_832444 ?auto_832447 ) ) ( not ( = ?auto_832445 ?auto_832446 ) ) ( not ( = ?auto_832445 ?auto_832447 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_832446 ?auto_832447 )
      ( MAKE-12CRATE-VERIFY ?auto_832435 ?auto_832436 ?auto_832437 ?auto_832439 ?auto_832438 ?auto_832440 ?auto_832441 ?auto_832442 ?auto_832443 ?auto_832444 ?auto_832445 ?auto_832446 ?auto_832447 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_832560 - SURFACE
      ?auto_832561 - SURFACE
      ?auto_832562 - SURFACE
      ?auto_832564 - SURFACE
      ?auto_832563 - SURFACE
      ?auto_832565 - SURFACE
      ?auto_832566 - SURFACE
      ?auto_832567 - SURFACE
      ?auto_832568 - SURFACE
      ?auto_832569 - SURFACE
      ?auto_832570 - SURFACE
      ?auto_832571 - SURFACE
      ?auto_832572 - SURFACE
    )
    :vars
    (
      ?auto_832575 - HOIST
      ?auto_832574 - PLACE
      ?auto_832573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_832575 ?auto_832574 ) ( SURFACE-AT ?auto_832571 ?auto_832574 ) ( CLEAR ?auto_832571 ) ( IS-CRATE ?auto_832572 ) ( not ( = ?auto_832571 ?auto_832572 ) ) ( TRUCK-AT ?auto_832573 ?auto_832574 ) ( AVAILABLE ?auto_832575 ) ( IN ?auto_832572 ?auto_832573 ) ( ON ?auto_832571 ?auto_832570 ) ( not ( = ?auto_832570 ?auto_832571 ) ) ( not ( = ?auto_832570 ?auto_832572 ) ) ( ON ?auto_832561 ?auto_832560 ) ( ON ?auto_832562 ?auto_832561 ) ( ON ?auto_832564 ?auto_832562 ) ( ON ?auto_832563 ?auto_832564 ) ( ON ?auto_832565 ?auto_832563 ) ( ON ?auto_832566 ?auto_832565 ) ( ON ?auto_832567 ?auto_832566 ) ( ON ?auto_832568 ?auto_832567 ) ( ON ?auto_832569 ?auto_832568 ) ( ON ?auto_832570 ?auto_832569 ) ( not ( = ?auto_832560 ?auto_832561 ) ) ( not ( = ?auto_832560 ?auto_832562 ) ) ( not ( = ?auto_832560 ?auto_832564 ) ) ( not ( = ?auto_832560 ?auto_832563 ) ) ( not ( = ?auto_832560 ?auto_832565 ) ) ( not ( = ?auto_832560 ?auto_832566 ) ) ( not ( = ?auto_832560 ?auto_832567 ) ) ( not ( = ?auto_832560 ?auto_832568 ) ) ( not ( = ?auto_832560 ?auto_832569 ) ) ( not ( = ?auto_832560 ?auto_832570 ) ) ( not ( = ?auto_832560 ?auto_832571 ) ) ( not ( = ?auto_832560 ?auto_832572 ) ) ( not ( = ?auto_832561 ?auto_832562 ) ) ( not ( = ?auto_832561 ?auto_832564 ) ) ( not ( = ?auto_832561 ?auto_832563 ) ) ( not ( = ?auto_832561 ?auto_832565 ) ) ( not ( = ?auto_832561 ?auto_832566 ) ) ( not ( = ?auto_832561 ?auto_832567 ) ) ( not ( = ?auto_832561 ?auto_832568 ) ) ( not ( = ?auto_832561 ?auto_832569 ) ) ( not ( = ?auto_832561 ?auto_832570 ) ) ( not ( = ?auto_832561 ?auto_832571 ) ) ( not ( = ?auto_832561 ?auto_832572 ) ) ( not ( = ?auto_832562 ?auto_832564 ) ) ( not ( = ?auto_832562 ?auto_832563 ) ) ( not ( = ?auto_832562 ?auto_832565 ) ) ( not ( = ?auto_832562 ?auto_832566 ) ) ( not ( = ?auto_832562 ?auto_832567 ) ) ( not ( = ?auto_832562 ?auto_832568 ) ) ( not ( = ?auto_832562 ?auto_832569 ) ) ( not ( = ?auto_832562 ?auto_832570 ) ) ( not ( = ?auto_832562 ?auto_832571 ) ) ( not ( = ?auto_832562 ?auto_832572 ) ) ( not ( = ?auto_832564 ?auto_832563 ) ) ( not ( = ?auto_832564 ?auto_832565 ) ) ( not ( = ?auto_832564 ?auto_832566 ) ) ( not ( = ?auto_832564 ?auto_832567 ) ) ( not ( = ?auto_832564 ?auto_832568 ) ) ( not ( = ?auto_832564 ?auto_832569 ) ) ( not ( = ?auto_832564 ?auto_832570 ) ) ( not ( = ?auto_832564 ?auto_832571 ) ) ( not ( = ?auto_832564 ?auto_832572 ) ) ( not ( = ?auto_832563 ?auto_832565 ) ) ( not ( = ?auto_832563 ?auto_832566 ) ) ( not ( = ?auto_832563 ?auto_832567 ) ) ( not ( = ?auto_832563 ?auto_832568 ) ) ( not ( = ?auto_832563 ?auto_832569 ) ) ( not ( = ?auto_832563 ?auto_832570 ) ) ( not ( = ?auto_832563 ?auto_832571 ) ) ( not ( = ?auto_832563 ?auto_832572 ) ) ( not ( = ?auto_832565 ?auto_832566 ) ) ( not ( = ?auto_832565 ?auto_832567 ) ) ( not ( = ?auto_832565 ?auto_832568 ) ) ( not ( = ?auto_832565 ?auto_832569 ) ) ( not ( = ?auto_832565 ?auto_832570 ) ) ( not ( = ?auto_832565 ?auto_832571 ) ) ( not ( = ?auto_832565 ?auto_832572 ) ) ( not ( = ?auto_832566 ?auto_832567 ) ) ( not ( = ?auto_832566 ?auto_832568 ) ) ( not ( = ?auto_832566 ?auto_832569 ) ) ( not ( = ?auto_832566 ?auto_832570 ) ) ( not ( = ?auto_832566 ?auto_832571 ) ) ( not ( = ?auto_832566 ?auto_832572 ) ) ( not ( = ?auto_832567 ?auto_832568 ) ) ( not ( = ?auto_832567 ?auto_832569 ) ) ( not ( = ?auto_832567 ?auto_832570 ) ) ( not ( = ?auto_832567 ?auto_832571 ) ) ( not ( = ?auto_832567 ?auto_832572 ) ) ( not ( = ?auto_832568 ?auto_832569 ) ) ( not ( = ?auto_832568 ?auto_832570 ) ) ( not ( = ?auto_832568 ?auto_832571 ) ) ( not ( = ?auto_832568 ?auto_832572 ) ) ( not ( = ?auto_832569 ?auto_832570 ) ) ( not ( = ?auto_832569 ?auto_832571 ) ) ( not ( = ?auto_832569 ?auto_832572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_832570 ?auto_832571 ?auto_832572 )
      ( MAKE-12CRATE-VERIFY ?auto_832560 ?auto_832561 ?auto_832562 ?auto_832564 ?auto_832563 ?auto_832565 ?auto_832566 ?auto_832567 ?auto_832568 ?auto_832569 ?auto_832570 ?auto_832571 ?auto_832572 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_832698 - SURFACE
      ?auto_832699 - SURFACE
      ?auto_832700 - SURFACE
      ?auto_832702 - SURFACE
      ?auto_832701 - SURFACE
      ?auto_832703 - SURFACE
      ?auto_832704 - SURFACE
      ?auto_832705 - SURFACE
      ?auto_832706 - SURFACE
      ?auto_832707 - SURFACE
      ?auto_832708 - SURFACE
      ?auto_832709 - SURFACE
      ?auto_832710 - SURFACE
    )
    :vars
    (
      ?auto_832712 - HOIST
      ?auto_832711 - PLACE
      ?auto_832714 - TRUCK
      ?auto_832713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_832712 ?auto_832711 ) ( SURFACE-AT ?auto_832709 ?auto_832711 ) ( CLEAR ?auto_832709 ) ( IS-CRATE ?auto_832710 ) ( not ( = ?auto_832709 ?auto_832710 ) ) ( AVAILABLE ?auto_832712 ) ( IN ?auto_832710 ?auto_832714 ) ( ON ?auto_832709 ?auto_832708 ) ( not ( = ?auto_832708 ?auto_832709 ) ) ( not ( = ?auto_832708 ?auto_832710 ) ) ( TRUCK-AT ?auto_832714 ?auto_832713 ) ( not ( = ?auto_832713 ?auto_832711 ) ) ( ON ?auto_832699 ?auto_832698 ) ( ON ?auto_832700 ?auto_832699 ) ( ON ?auto_832702 ?auto_832700 ) ( ON ?auto_832701 ?auto_832702 ) ( ON ?auto_832703 ?auto_832701 ) ( ON ?auto_832704 ?auto_832703 ) ( ON ?auto_832705 ?auto_832704 ) ( ON ?auto_832706 ?auto_832705 ) ( ON ?auto_832707 ?auto_832706 ) ( ON ?auto_832708 ?auto_832707 ) ( not ( = ?auto_832698 ?auto_832699 ) ) ( not ( = ?auto_832698 ?auto_832700 ) ) ( not ( = ?auto_832698 ?auto_832702 ) ) ( not ( = ?auto_832698 ?auto_832701 ) ) ( not ( = ?auto_832698 ?auto_832703 ) ) ( not ( = ?auto_832698 ?auto_832704 ) ) ( not ( = ?auto_832698 ?auto_832705 ) ) ( not ( = ?auto_832698 ?auto_832706 ) ) ( not ( = ?auto_832698 ?auto_832707 ) ) ( not ( = ?auto_832698 ?auto_832708 ) ) ( not ( = ?auto_832698 ?auto_832709 ) ) ( not ( = ?auto_832698 ?auto_832710 ) ) ( not ( = ?auto_832699 ?auto_832700 ) ) ( not ( = ?auto_832699 ?auto_832702 ) ) ( not ( = ?auto_832699 ?auto_832701 ) ) ( not ( = ?auto_832699 ?auto_832703 ) ) ( not ( = ?auto_832699 ?auto_832704 ) ) ( not ( = ?auto_832699 ?auto_832705 ) ) ( not ( = ?auto_832699 ?auto_832706 ) ) ( not ( = ?auto_832699 ?auto_832707 ) ) ( not ( = ?auto_832699 ?auto_832708 ) ) ( not ( = ?auto_832699 ?auto_832709 ) ) ( not ( = ?auto_832699 ?auto_832710 ) ) ( not ( = ?auto_832700 ?auto_832702 ) ) ( not ( = ?auto_832700 ?auto_832701 ) ) ( not ( = ?auto_832700 ?auto_832703 ) ) ( not ( = ?auto_832700 ?auto_832704 ) ) ( not ( = ?auto_832700 ?auto_832705 ) ) ( not ( = ?auto_832700 ?auto_832706 ) ) ( not ( = ?auto_832700 ?auto_832707 ) ) ( not ( = ?auto_832700 ?auto_832708 ) ) ( not ( = ?auto_832700 ?auto_832709 ) ) ( not ( = ?auto_832700 ?auto_832710 ) ) ( not ( = ?auto_832702 ?auto_832701 ) ) ( not ( = ?auto_832702 ?auto_832703 ) ) ( not ( = ?auto_832702 ?auto_832704 ) ) ( not ( = ?auto_832702 ?auto_832705 ) ) ( not ( = ?auto_832702 ?auto_832706 ) ) ( not ( = ?auto_832702 ?auto_832707 ) ) ( not ( = ?auto_832702 ?auto_832708 ) ) ( not ( = ?auto_832702 ?auto_832709 ) ) ( not ( = ?auto_832702 ?auto_832710 ) ) ( not ( = ?auto_832701 ?auto_832703 ) ) ( not ( = ?auto_832701 ?auto_832704 ) ) ( not ( = ?auto_832701 ?auto_832705 ) ) ( not ( = ?auto_832701 ?auto_832706 ) ) ( not ( = ?auto_832701 ?auto_832707 ) ) ( not ( = ?auto_832701 ?auto_832708 ) ) ( not ( = ?auto_832701 ?auto_832709 ) ) ( not ( = ?auto_832701 ?auto_832710 ) ) ( not ( = ?auto_832703 ?auto_832704 ) ) ( not ( = ?auto_832703 ?auto_832705 ) ) ( not ( = ?auto_832703 ?auto_832706 ) ) ( not ( = ?auto_832703 ?auto_832707 ) ) ( not ( = ?auto_832703 ?auto_832708 ) ) ( not ( = ?auto_832703 ?auto_832709 ) ) ( not ( = ?auto_832703 ?auto_832710 ) ) ( not ( = ?auto_832704 ?auto_832705 ) ) ( not ( = ?auto_832704 ?auto_832706 ) ) ( not ( = ?auto_832704 ?auto_832707 ) ) ( not ( = ?auto_832704 ?auto_832708 ) ) ( not ( = ?auto_832704 ?auto_832709 ) ) ( not ( = ?auto_832704 ?auto_832710 ) ) ( not ( = ?auto_832705 ?auto_832706 ) ) ( not ( = ?auto_832705 ?auto_832707 ) ) ( not ( = ?auto_832705 ?auto_832708 ) ) ( not ( = ?auto_832705 ?auto_832709 ) ) ( not ( = ?auto_832705 ?auto_832710 ) ) ( not ( = ?auto_832706 ?auto_832707 ) ) ( not ( = ?auto_832706 ?auto_832708 ) ) ( not ( = ?auto_832706 ?auto_832709 ) ) ( not ( = ?auto_832706 ?auto_832710 ) ) ( not ( = ?auto_832707 ?auto_832708 ) ) ( not ( = ?auto_832707 ?auto_832709 ) ) ( not ( = ?auto_832707 ?auto_832710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_832708 ?auto_832709 ?auto_832710 )
      ( MAKE-12CRATE-VERIFY ?auto_832698 ?auto_832699 ?auto_832700 ?auto_832702 ?auto_832701 ?auto_832703 ?auto_832704 ?auto_832705 ?auto_832706 ?auto_832707 ?auto_832708 ?auto_832709 ?auto_832710 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_832848 - SURFACE
      ?auto_832849 - SURFACE
      ?auto_832850 - SURFACE
      ?auto_832852 - SURFACE
      ?auto_832851 - SURFACE
      ?auto_832853 - SURFACE
      ?auto_832854 - SURFACE
      ?auto_832855 - SURFACE
      ?auto_832856 - SURFACE
      ?auto_832857 - SURFACE
      ?auto_832858 - SURFACE
      ?auto_832859 - SURFACE
      ?auto_832860 - SURFACE
    )
    :vars
    (
      ?auto_832865 - HOIST
      ?auto_832863 - PLACE
      ?auto_832864 - TRUCK
      ?auto_832862 - PLACE
      ?auto_832861 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_832865 ?auto_832863 ) ( SURFACE-AT ?auto_832859 ?auto_832863 ) ( CLEAR ?auto_832859 ) ( IS-CRATE ?auto_832860 ) ( not ( = ?auto_832859 ?auto_832860 ) ) ( AVAILABLE ?auto_832865 ) ( ON ?auto_832859 ?auto_832858 ) ( not ( = ?auto_832858 ?auto_832859 ) ) ( not ( = ?auto_832858 ?auto_832860 ) ) ( TRUCK-AT ?auto_832864 ?auto_832862 ) ( not ( = ?auto_832862 ?auto_832863 ) ) ( HOIST-AT ?auto_832861 ?auto_832862 ) ( LIFTING ?auto_832861 ?auto_832860 ) ( not ( = ?auto_832865 ?auto_832861 ) ) ( ON ?auto_832849 ?auto_832848 ) ( ON ?auto_832850 ?auto_832849 ) ( ON ?auto_832852 ?auto_832850 ) ( ON ?auto_832851 ?auto_832852 ) ( ON ?auto_832853 ?auto_832851 ) ( ON ?auto_832854 ?auto_832853 ) ( ON ?auto_832855 ?auto_832854 ) ( ON ?auto_832856 ?auto_832855 ) ( ON ?auto_832857 ?auto_832856 ) ( ON ?auto_832858 ?auto_832857 ) ( not ( = ?auto_832848 ?auto_832849 ) ) ( not ( = ?auto_832848 ?auto_832850 ) ) ( not ( = ?auto_832848 ?auto_832852 ) ) ( not ( = ?auto_832848 ?auto_832851 ) ) ( not ( = ?auto_832848 ?auto_832853 ) ) ( not ( = ?auto_832848 ?auto_832854 ) ) ( not ( = ?auto_832848 ?auto_832855 ) ) ( not ( = ?auto_832848 ?auto_832856 ) ) ( not ( = ?auto_832848 ?auto_832857 ) ) ( not ( = ?auto_832848 ?auto_832858 ) ) ( not ( = ?auto_832848 ?auto_832859 ) ) ( not ( = ?auto_832848 ?auto_832860 ) ) ( not ( = ?auto_832849 ?auto_832850 ) ) ( not ( = ?auto_832849 ?auto_832852 ) ) ( not ( = ?auto_832849 ?auto_832851 ) ) ( not ( = ?auto_832849 ?auto_832853 ) ) ( not ( = ?auto_832849 ?auto_832854 ) ) ( not ( = ?auto_832849 ?auto_832855 ) ) ( not ( = ?auto_832849 ?auto_832856 ) ) ( not ( = ?auto_832849 ?auto_832857 ) ) ( not ( = ?auto_832849 ?auto_832858 ) ) ( not ( = ?auto_832849 ?auto_832859 ) ) ( not ( = ?auto_832849 ?auto_832860 ) ) ( not ( = ?auto_832850 ?auto_832852 ) ) ( not ( = ?auto_832850 ?auto_832851 ) ) ( not ( = ?auto_832850 ?auto_832853 ) ) ( not ( = ?auto_832850 ?auto_832854 ) ) ( not ( = ?auto_832850 ?auto_832855 ) ) ( not ( = ?auto_832850 ?auto_832856 ) ) ( not ( = ?auto_832850 ?auto_832857 ) ) ( not ( = ?auto_832850 ?auto_832858 ) ) ( not ( = ?auto_832850 ?auto_832859 ) ) ( not ( = ?auto_832850 ?auto_832860 ) ) ( not ( = ?auto_832852 ?auto_832851 ) ) ( not ( = ?auto_832852 ?auto_832853 ) ) ( not ( = ?auto_832852 ?auto_832854 ) ) ( not ( = ?auto_832852 ?auto_832855 ) ) ( not ( = ?auto_832852 ?auto_832856 ) ) ( not ( = ?auto_832852 ?auto_832857 ) ) ( not ( = ?auto_832852 ?auto_832858 ) ) ( not ( = ?auto_832852 ?auto_832859 ) ) ( not ( = ?auto_832852 ?auto_832860 ) ) ( not ( = ?auto_832851 ?auto_832853 ) ) ( not ( = ?auto_832851 ?auto_832854 ) ) ( not ( = ?auto_832851 ?auto_832855 ) ) ( not ( = ?auto_832851 ?auto_832856 ) ) ( not ( = ?auto_832851 ?auto_832857 ) ) ( not ( = ?auto_832851 ?auto_832858 ) ) ( not ( = ?auto_832851 ?auto_832859 ) ) ( not ( = ?auto_832851 ?auto_832860 ) ) ( not ( = ?auto_832853 ?auto_832854 ) ) ( not ( = ?auto_832853 ?auto_832855 ) ) ( not ( = ?auto_832853 ?auto_832856 ) ) ( not ( = ?auto_832853 ?auto_832857 ) ) ( not ( = ?auto_832853 ?auto_832858 ) ) ( not ( = ?auto_832853 ?auto_832859 ) ) ( not ( = ?auto_832853 ?auto_832860 ) ) ( not ( = ?auto_832854 ?auto_832855 ) ) ( not ( = ?auto_832854 ?auto_832856 ) ) ( not ( = ?auto_832854 ?auto_832857 ) ) ( not ( = ?auto_832854 ?auto_832858 ) ) ( not ( = ?auto_832854 ?auto_832859 ) ) ( not ( = ?auto_832854 ?auto_832860 ) ) ( not ( = ?auto_832855 ?auto_832856 ) ) ( not ( = ?auto_832855 ?auto_832857 ) ) ( not ( = ?auto_832855 ?auto_832858 ) ) ( not ( = ?auto_832855 ?auto_832859 ) ) ( not ( = ?auto_832855 ?auto_832860 ) ) ( not ( = ?auto_832856 ?auto_832857 ) ) ( not ( = ?auto_832856 ?auto_832858 ) ) ( not ( = ?auto_832856 ?auto_832859 ) ) ( not ( = ?auto_832856 ?auto_832860 ) ) ( not ( = ?auto_832857 ?auto_832858 ) ) ( not ( = ?auto_832857 ?auto_832859 ) ) ( not ( = ?auto_832857 ?auto_832860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_832858 ?auto_832859 ?auto_832860 )
      ( MAKE-12CRATE-VERIFY ?auto_832848 ?auto_832849 ?auto_832850 ?auto_832852 ?auto_832851 ?auto_832853 ?auto_832854 ?auto_832855 ?auto_832856 ?auto_832857 ?auto_832858 ?auto_832859 ?auto_832860 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833010 - SURFACE
      ?auto_833011 - SURFACE
      ?auto_833012 - SURFACE
      ?auto_833014 - SURFACE
      ?auto_833013 - SURFACE
      ?auto_833015 - SURFACE
      ?auto_833016 - SURFACE
      ?auto_833017 - SURFACE
      ?auto_833018 - SURFACE
      ?auto_833019 - SURFACE
      ?auto_833020 - SURFACE
      ?auto_833021 - SURFACE
      ?auto_833022 - SURFACE
    )
    :vars
    (
      ?auto_833027 - HOIST
      ?auto_833024 - PLACE
      ?auto_833026 - TRUCK
      ?auto_833023 - PLACE
      ?auto_833028 - HOIST
      ?auto_833025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_833027 ?auto_833024 ) ( SURFACE-AT ?auto_833021 ?auto_833024 ) ( CLEAR ?auto_833021 ) ( IS-CRATE ?auto_833022 ) ( not ( = ?auto_833021 ?auto_833022 ) ) ( AVAILABLE ?auto_833027 ) ( ON ?auto_833021 ?auto_833020 ) ( not ( = ?auto_833020 ?auto_833021 ) ) ( not ( = ?auto_833020 ?auto_833022 ) ) ( TRUCK-AT ?auto_833026 ?auto_833023 ) ( not ( = ?auto_833023 ?auto_833024 ) ) ( HOIST-AT ?auto_833028 ?auto_833023 ) ( not ( = ?auto_833027 ?auto_833028 ) ) ( AVAILABLE ?auto_833028 ) ( SURFACE-AT ?auto_833022 ?auto_833023 ) ( ON ?auto_833022 ?auto_833025 ) ( CLEAR ?auto_833022 ) ( not ( = ?auto_833021 ?auto_833025 ) ) ( not ( = ?auto_833022 ?auto_833025 ) ) ( not ( = ?auto_833020 ?auto_833025 ) ) ( ON ?auto_833011 ?auto_833010 ) ( ON ?auto_833012 ?auto_833011 ) ( ON ?auto_833014 ?auto_833012 ) ( ON ?auto_833013 ?auto_833014 ) ( ON ?auto_833015 ?auto_833013 ) ( ON ?auto_833016 ?auto_833015 ) ( ON ?auto_833017 ?auto_833016 ) ( ON ?auto_833018 ?auto_833017 ) ( ON ?auto_833019 ?auto_833018 ) ( ON ?auto_833020 ?auto_833019 ) ( not ( = ?auto_833010 ?auto_833011 ) ) ( not ( = ?auto_833010 ?auto_833012 ) ) ( not ( = ?auto_833010 ?auto_833014 ) ) ( not ( = ?auto_833010 ?auto_833013 ) ) ( not ( = ?auto_833010 ?auto_833015 ) ) ( not ( = ?auto_833010 ?auto_833016 ) ) ( not ( = ?auto_833010 ?auto_833017 ) ) ( not ( = ?auto_833010 ?auto_833018 ) ) ( not ( = ?auto_833010 ?auto_833019 ) ) ( not ( = ?auto_833010 ?auto_833020 ) ) ( not ( = ?auto_833010 ?auto_833021 ) ) ( not ( = ?auto_833010 ?auto_833022 ) ) ( not ( = ?auto_833010 ?auto_833025 ) ) ( not ( = ?auto_833011 ?auto_833012 ) ) ( not ( = ?auto_833011 ?auto_833014 ) ) ( not ( = ?auto_833011 ?auto_833013 ) ) ( not ( = ?auto_833011 ?auto_833015 ) ) ( not ( = ?auto_833011 ?auto_833016 ) ) ( not ( = ?auto_833011 ?auto_833017 ) ) ( not ( = ?auto_833011 ?auto_833018 ) ) ( not ( = ?auto_833011 ?auto_833019 ) ) ( not ( = ?auto_833011 ?auto_833020 ) ) ( not ( = ?auto_833011 ?auto_833021 ) ) ( not ( = ?auto_833011 ?auto_833022 ) ) ( not ( = ?auto_833011 ?auto_833025 ) ) ( not ( = ?auto_833012 ?auto_833014 ) ) ( not ( = ?auto_833012 ?auto_833013 ) ) ( not ( = ?auto_833012 ?auto_833015 ) ) ( not ( = ?auto_833012 ?auto_833016 ) ) ( not ( = ?auto_833012 ?auto_833017 ) ) ( not ( = ?auto_833012 ?auto_833018 ) ) ( not ( = ?auto_833012 ?auto_833019 ) ) ( not ( = ?auto_833012 ?auto_833020 ) ) ( not ( = ?auto_833012 ?auto_833021 ) ) ( not ( = ?auto_833012 ?auto_833022 ) ) ( not ( = ?auto_833012 ?auto_833025 ) ) ( not ( = ?auto_833014 ?auto_833013 ) ) ( not ( = ?auto_833014 ?auto_833015 ) ) ( not ( = ?auto_833014 ?auto_833016 ) ) ( not ( = ?auto_833014 ?auto_833017 ) ) ( not ( = ?auto_833014 ?auto_833018 ) ) ( not ( = ?auto_833014 ?auto_833019 ) ) ( not ( = ?auto_833014 ?auto_833020 ) ) ( not ( = ?auto_833014 ?auto_833021 ) ) ( not ( = ?auto_833014 ?auto_833022 ) ) ( not ( = ?auto_833014 ?auto_833025 ) ) ( not ( = ?auto_833013 ?auto_833015 ) ) ( not ( = ?auto_833013 ?auto_833016 ) ) ( not ( = ?auto_833013 ?auto_833017 ) ) ( not ( = ?auto_833013 ?auto_833018 ) ) ( not ( = ?auto_833013 ?auto_833019 ) ) ( not ( = ?auto_833013 ?auto_833020 ) ) ( not ( = ?auto_833013 ?auto_833021 ) ) ( not ( = ?auto_833013 ?auto_833022 ) ) ( not ( = ?auto_833013 ?auto_833025 ) ) ( not ( = ?auto_833015 ?auto_833016 ) ) ( not ( = ?auto_833015 ?auto_833017 ) ) ( not ( = ?auto_833015 ?auto_833018 ) ) ( not ( = ?auto_833015 ?auto_833019 ) ) ( not ( = ?auto_833015 ?auto_833020 ) ) ( not ( = ?auto_833015 ?auto_833021 ) ) ( not ( = ?auto_833015 ?auto_833022 ) ) ( not ( = ?auto_833015 ?auto_833025 ) ) ( not ( = ?auto_833016 ?auto_833017 ) ) ( not ( = ?auto_833016 ?auto_833018 ) ) ( not ( = ?auto_833016 ?auto_833019 ) ) ( not ( = ?auto_833016 ?auto_833020 ) ) ( not ( = ?auto_833016 ?auto_833021 ) ) ( not ( = ?auto_833016 ?auto_833022 ) ) ( not ( = ?auto_833016 ?auto_833025 ) ) ( not ( = ?auto_833017 ?auto_833018 ) ) ( not ( = ?auto_833017 ?auto_833019 ) ) ( not ( = ?auto_833017 ?auto_833020 ) ) ( not ( = ?auto_833017 ?auto_833021 ) ) ( not ( = ?auto_833017 ?auto_833022 ) ) ( not ( = ?auto_833017 ?auto_833025 ) ) ( not ( = ?auto_833018 ?auto_833019 ) ) ( not ( = ?auto_833018 ?auto_833020 ) ) ( not ( = ?auto_833018 ?auto_833021 ) ) ( not ( = ?auto_833018 ?auto_833022 ) ) ( not ( = ?auto_833018 ?auto_833025 ) ) ( not ( = ?auto_833019 ?auto_833020 ) ) ( not ( = ?auto_833019 ?auto_833021 ) ) ( not ( = ?auto_833019 ?auto_833022 ) ) ( not ( = ?auto_833019 ?auto_833025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833020 ?auto_833021 ?auto_833022 )
      ( MAKE-12CRATE-VERIFY ?auto_833010 ?auto_833011 ?auto_833012 ?auto_833014 ?auto_833013 ?auto_833015 ?auto_833016 ?auto_833017 ?auto_833018 ?auto_833019 ?auto_833020 ?auto_833021 ?auto_833022 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833173 - SURFACE
      ?auto_833174 - SURFACE
      ?auto_833175 - SURFACE
      ?auto_833177 - SURFACE
      ?auto_833176 - SURFACE
      ?auto_833178 - SURFACE
      ?auto_833179 - SURFACE
      ?auto_833180 - SURFACE
      ?auto_833181 - SURFACE
      ?auto_833182 - SURFACE
      ?auto_833183 - SURFACE
      ?auto_833184 - SURFACE
      ?auto_833185 - SURFACE
    )
    :vars
    (
      ?auto_833187 - HOIST
      ?auto_833186 - PLACE
      ?auto_833190 - PLACE
      ?auto_833191 - HOIST
      ?auto_833189 - SURFACE
      ?auto_833188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833187 ?auto_833186 ) ( SURFACE-AT ?auto_833184 ?auto_833186 ) ( CLEAR ?auto_833184 ) ( IS-CRATE ?auto_833185 ) ( not ( = ?auto_833184 ?auto_833185 ) ) ( AVAILABLE ?auto_833187 ) ( ON ?auto_833184 ?auto_833183 ) ( not ( = ?auto_833183 ?auto_833184 ) ) ( not ( = ?auto_833183 ?auto_833185 ) ) ( not ( = ?auto_833190 ?auto_833186 ) ) ( HOIST-AT ?auto_833191 ?auto_833190 ) ( not ( = ?auto_833187 ?auto_833191 ) ) ( AVAILABLE ?auto_833191 ) ( SURFACE-AT ?auto_833185 ?auto_833190 ) ( ON ?auto_833185 ?auto_833189 ) ( CLEAR ?auto_833185 ) ( not ( = ?auto_833184 ?auto_833189 ) ) ( not ( = ?auto_833185 ?auto_833189 ) ) ( not ( = ?auto_833183 ?auto_833189 ) ) ( TRUCK-AT ?auto_833188 ?auto_833186 ) ( ON ?auto_833174 ?auto_833173 ) ( ON ?auto_833175 ?auto_833174 ) ( ON ?auto_833177 ?auto_833175 ) ( ON ?auto_833176 ?auto_833177 ) ( ON ?auto_833178 ?auto_833176 ) ( ON ?auto_833179 ?auto_833178 ) ( ON ?auto_833180 ?auto_833179 ) ( ON ?auto_833181 ?auto_833180 ) ( ON ?auto_833182 ?auto_833181 ) ( ON ?auto_833183 ?auto_833182 ) ( not ( = ?auto_833173 ?auto_833174 ) ) ( not ( = ?auto_833173 ?auto_833175 ) ) ( not ( = ?auto_833173 ?auto_833177 ) ) ( not ( = ?auto_833173 ?auto_833176 ) ) ( not ( = ?auto_833173 ?auto_833178 ) ) ( not ( = ?auto_833173 ?auto_833179 ) ) ( not ( = ?auto_833173 ?auto_833180 ) ) ( not ( = ?auto_833173 ?auto_833181 ) ) ( not ( = ?auto_833173 ?auto_833182 ) ) ( not ( = ?auto_833173 ?auto_833183 ) ) ( not ( = ?auto_833173 ?auto_833184 ) ) ( not ( = ?auto_833173 ?auto_833185 ) ) ( not ( = ?auto_833173 ?auto_833189 ) ) ( not ( = ?auto_833174 ?auto_833175 ) ) ( not ( = ?auto_833174 ?auto_833177 ) ) ( not ( = ?auto_833174 ?auto_833176 ) ) ( not ( = ?auto_833174 ?auto_833178 ) ) ( not ( = ?auto_833174 ?auto_833179 ) ) ( not ( = ?auto_833174 ?auto_833180 ) ) ( not ( = ?auto_833174 ?auto_833181 ) ) ( not ( = ?auto_833174 ?auto_833182 ) ) ( not ( = ?auto_833174 ?auto_833183 ) ) ( not ( = ?auto_833174 ?auto_833184 ) ) ( not ( = ?auto_833174 ?auto_833185 ) ) ( not ( = ?auto_833174 ?auto_833189 ) ) ( not ( = ?auto_833175 ?auto_833177 ) ) ( not ( = ?auto_833175 ?auto_833176 ) ) ( not ( = ?auto_833175 ?auto_833178 ) ) ( not ( = ?auto_833175 ?auto_833179 ) ) ( not ( = ?auto_833175 ?auto_833180 ) ) ( not ( = ?auto_833175 ?auto_833181 ) ) ( not ( = ?auto_833175 ?auto_833182 ) ) ( not ( = ?auto_833175 ?auto_833183 ) ) ( not ( = ?auto_833175 ?auto_833184 ) ) ( not ( = ?auto_833175 ?auto_833185 ) ) ( not ( = ?auto_833175 ?auto_833189 ) ) ( not ( = ?auto_833177 ?auto_833176 ) ) ( not ( = ?auto_833177 ?auto_833178 ) ) ( not ( = ?auto_833177 ?auto_833179 ) ) ( not ( = ?auto_833177 ?auto_833180 ) ) ( not ( = ?auto_833177 ?auto_833181 ) ) ( not ( = ?auto_833177 ?auto_833182 ) ) ( not ( = ?auto_833177 ?auto_833183 ) ) ( not ( = ?auto_833177 ?auto_833184 ) ) ( not ( = ?auto_833177 ?auto_833185 ) ) ( not ( = ?auto_833177 ?auto_833189 ) ) ( not ( = ?auto_833176 ?auto_833178 ) ) ( not ( = ?auto_833176 ?auto_833179 ) ) ( not ( = ?auto_833176 ?auto_833180 ) ) ( not ( = ?auto_833176 ?auto_833181 ) ) ( not ( = ?auto_833176 ?auto_833182 ) ) ( not ( = ?auto_833176 ?auto_833183 ) ) ( not ( = ?auto_833176 ?auto_833184 ) ) ( not ( = ?auto_833176 ?auto_833185 ) ) ( not ( = ?auto_833176 ?auto_833189 ) ) ( not ( = ?auto_833178 ?auto_833179 ) ) ( not ( = ?auto_833178 ?auto_833180 ) ) ( not ( = ?auto_833178 ?auto_833181 ) ) ( not ( = ?auto_833178 ?auto_833182 ) ) ( not ( = ?auto_833178 ?auto_833183 ) ) ( not ( = ?auto_833178 ?auto_833184 ) ) ( not ( = ?auto_833178 ?auto_833185 ) ) ( not ( = ?auto_833178 ?auto_833189 ) ) ( not ( = ?auto_833179 ?auto_833180 ) ) ( not ( = ?auto_833179 ?auto_833181 ) ) ( not ( = ?auto_833179 ?auto_833182 ) ) ( not ( = ?auto_833179 ?auto_833183 ) ) ( not ( = ?auto_833179 ?auto_833184 ) ) ( not ( = ?auto_833179 ?auto_833185 ) ) ( not ( = ?auto_833179 ?auto_833189 ) ) ( not ( = ?auto_833180 ?auto_833181 ) ) ( not ( = ?auto_833180 ?auto_833182 ) ) ( not ( = ?auto_833180 ?auto_833183 ) ) ( not ( = ?auto_833180 ?auto_833184 ) ) ( not ( = ?auto_833180 ?auto_833185 ) ) ( not ( = ?auto_833180 ?auto_833189 ) ) ( not ( = ?auto_833181 ?auto_833182 ) ) ( not ( = ?auto_833181 ?auto_833183 ) ) ( not ( = ?auto_833181 ?auto_833184 ) ) ( not ( = ?auto_833181 ?auto_833185 ) ) ( not ( = ?auto_833181 ?auto_833189 ) ) ( not ( = ?auto_833182 ?auto_833183 ) ) ( not ( = ?auto_833182 ?auto_833184 ) ) ( not ( = ?auto_833182 ?auto_833185 ) ) ( not ( = ?auto_833182 ?auto_833189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833183 ?auto_833184 ?auto_833185 )
      ( MAKE-12CRATE-VERIFY ?auto_833173 ?auto_833174 ?auto_833175 ?auto_833177 ?auto_833176 ?auto_833178 ?auto_833179 ?auto_833180 ?auto_833181 ?auto_833182 ?auto_833183 ?auto_833184 ?auto_833185 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833336 - SURFACE
      ?auto_833337 - SURFACE
      ?auto_833338 - SURFACE
      ?auto_833340 - SURFACE
      ?auto_833339 - SURFACE
      ?auto_833341 - SURFACE
      ?auto_833342 - SURFACE
      ?auto_833343 - SURFACE
      ?auto_833344 - SURFACE
      ?auto_833345 - SURFACE
      ?auto_833346 - SURFACE
      ?auto_833347 - SURFACE
      ?auto_833348 - SURFACE
    )
    :vars
    (
      ?auto_833351 - HOIST
      ?auto_833353 - PLACE
      ?auto_833349 - PLACE
      ?auto_833354 - HOIST
      ?auto_833350 - SURFACE
      ?auto_833352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833351 ?auto_833353 ) ( IS-CRATE ?auto_833348 ) ( not ( = ?auto_833347 ?auto_833348 ) ) ( not ( = ?auto_833346 ?auto_833347 ) ) ( not ( = ?auto_833346 ?auto_833348 ) ) ( not ( = ?auto_833349 ?auto_833353 ) ) ( HOIST-AT ?auto_833354 ?auto_833349 ) ( not ( = ?auto_833351 ?auto_833354 ) ) ( AVAILABLE ?auto_833354 ) ( SURFACE-AT ?auto_833348 ?auto_833349 ) ( ON ?auto_833348 ?auto_833350 ) ( CLEAR ?auto_833348 ) ( not ( = ?auto_833347 ?auto_833350 ) ) ( not ( = ?auto_833348 ?auto_833350 ) ) ( not ( = ?auto_833346 ?auto_833350 ) ) ( TRUCK-AT ?auto_833352 ?auto_833353 ) ( SURFACE-AT ?auto_833346 ?auto_833353 ) ( CLEAR ?auto_833346 ) ( LIFTING ?auto_833351 ?auto_833347 ) ( IS-CRATE ?auto_833347 ) ( ON ?auto_833337 ?auto_833336 ) ( ON ?auto_833338 ?auto_833337 ) ( ON ?auto_833340 ?auto_833338 ) ( ON ?auto_833339 ?auto_833340 ) ( ON ?auto_833341 ?auto_833339 ) ( ON ?auto_833342 ?auto_833341 ) ( ON ?auto_833343 ?auto_833342 ) ( ON ?auto_833344 ?auto_833343 ) ( ON ?auto_833345 ?auto_833344 ) ( ON ?auto_833346 ?auto_833345 ) ( not ( = ?auto_833336 ?auto_833337 ) ) ( not ( = ?auto_833336 ?auto_833338 ) ) ( not ( = ?auto_833336 ?auto_833340 ) ) ( not ( = ?auto_833336 ?auto_833339 ) ) ( not ( = ?auto_833336 ?auto_833341 ) ) ( not ( = ?auto_833336 ?auto_833342 ) ) ( not ( = ?auto_833336 ?auto_833343 ) ) ( not ( = ?auto_833336 ?auto_833344 ) ) ( not ( = ?auto_833336 ?auto_833345 ) ) ( not ( = ?auto_833336 ?auto_833346 ) ) ( not ( = ?auto_833336 ?auto_833347 ) ) ( not ( = ?auto_833336 ?auto_833348 ) ) ( not ( = ?auto_833336 ?auto_833350 ) ) ( not ( = ?auto_833337 ?auto_833338 ) ) ( not ( = ?auto_833337 ?auto_833340 ) ) ( not ( = ?auto_833337 ?auto_833339 ) ) ( not ( = ?auto_833337 ?auto_833341 ) ) ( not ( = ?auto_833337 ?auto_833342 ) ) ( not ( = ?auto_833337 ?auto_833343 ) ) ( not ( = ?auto_833337 ?auto_833344 ) ) ( not ( = ?auto_833337 ?auto_833345 ) ) ( not ( = ?auto_833337 ?auto_833346 ) ) ( not ( = ?auto_833337 ?auto_833347 ) ) ( not ( = ?auto_833337 ?auto_833348 ) ) ( not ( = ?auto_833337 ?auto_833350 ) ) ( not ( = ?auto_833338 ?auto_833340 ) ) ( not ( = ?auto_833338 ?auto_833339 ) ) ( not ( = ?auto_833338 ?auto_833341 ) ) ( not ( = ?auto_833338 ?auto_833342 ) ) ( not ( = ?auto_833338 ?auto_833343 ) ) ( not ( = ?auto_833338 ?auto_833344 ) ) ( not ( = ?auto_833338 ?auto_833345 ) ) ( not ( = ?auto_833338 ?auto_833346 ) ) ( not ( = ?auto_833338 ?auto_833347 ) ) ( not ( = ?auto_833338 ?auto_833348 ) ) ( not ( = ?auto_833338 ?auto_833350 ) ) ( not ( = ?auto_833340 ?auto_833339 ) ) ( not ( = ?auto_833340 ?auto_833341 ) ) ( not ( = ?auto_833340 ?auto_833342 ) ) ( not ( = ?auto_833340 ?auto_833343 ) ) ( not ( = ?auto_833340 ?auto_833344 ) ) ( not ( = ?auto_833340 ?auto_833345 ) ) ( not ( = ?auto_833340 ?auto_833346 ) ) ( not ( = ?auto_833340 ?auto_833347 ) ) ( not ( = ?auto_833340 ?auto_833348 ) ) ( not ( = ?auto_833340 ?auto_833350 ) ) ( not ( = ?auto_833339 ?auto_833341 ) ) ( not ( = ?auto_833339 ?auto_833342 ) ) ( not ( = ?auto_833339 ?auto_833343 ) ) ( not ( = ?auto_833339 ?auto_833344 ) ) ( not ( = ?auto_833339 ?auto_833345 ) ) ( not ( = ?auto_833339 ?auto_833346 ) ) ( not ( = ?auto_833339 ?auto_833347 ) ) ( not ( = ?auto_833339 ?auto_833348 ) ) ( not ( = ?auto_833339 ?auto_833350 ) ) ( not ( = ?auto_833341 ?auto_833342 ) ) ( not ( = ?auto_833341 ?auto_833343 ) ) ( not ( = ?auto_833341 ?auto_833344 ) ) ( not ( = ?auto_833341 ?auto_833345 ) ) ( not ( = ?auto_833341 ?auto_833346 ) ) ( not ( = ?auto_833341 ?auto_833347 ) ) ( not ( = ?auto_833341 ?auto_833348 ) ) ( not ( = ?auto_833341 ?auto_833350 ) ) ( not ( = ?auto_833342 ?auto_833343 ) ) ( not ( = ?auto_833342 ?auto_833344 ) ) ( not ( = ?auto_833342 ?auto_833345 ) ) ( not ( = ?auto_833342 ?auto_833346 ) ) ( not ( = ?auto_833342 ?auto_833347 ) ) ( not ( = ?auto_833342 ?auto_833348 ) ) ( not ( = ?auto_833342 ?auto_833350 ) ) ( not ( = ?auto_833343 ?auto_833344 ) ) ( not ( = ?auto_833343 ?auto_833345 ) ) ( not ( = ?auto_833343 ?auto_833346 ) ) ( not ( = ?auto_833343 ?auto_833347 ) ) ( not ( = ?auto_833343 ?auto_833348 ) ) ( not ( = ?auto_833343 ?auto_833350 ) ) ( not ( = ?auto_833344 ?auto_833345 ) ) ( not ( = ?auto_833344 ?auto_833346 ) ) ( not ( = ?auto_833344 ?auto_833347 ) ) ( not ( = ?auto_833344 ?auto_833348 ) ) ( not ( = ?auto_833344 ?auto_833350 ) ) ( not ( = ?auto_833345 ?auto_833346 ) ) ( not ( = ?auto_833345 ?auto_833347 ) ) ( not ( = ?auto_833345 ?auto_833348 ) ) ( not ( = ?auto_833345 ?auto_833350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833346 ?auto_833347 ?auto_833348 )
      ( MAKE-12CRATE-VERIFY ?auto_833336 ?auto_833337 ?auto_833338 ?auto_833340 ?auto_833339 ?auto_833341 ?auto_833342 ?auto_833343 ?auto_833344 ?auto_833345 ?auto_833346 ?auto_833347 ?auto_833348 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_833499 - SURFACE
      ?auto_833500 - SURFACE
      ?auto_833501 - SURFACE
      ?auto_833503 - SURFACE
      ?auto_833502 - SURFACE
      ?auto_833504 - SURFACE
      ?auto_833505 - SURFACE
      ?auto_833506 - SURFACE
      ?auto_833507 - SURFACE
      ?auto_833508 - SURFACE
      ?auto_833509 - SURFACE
      ?auto_833510 - SURFACE
      ?auto_833511 - SURFACE
    )
    :vars
    (
      ?auto_833512 - HOIST
      ?auto_833513 - PLACE
      ?auto_833515 - PLACE
      ?auto_833517 - HOIST
      ?auto_833514 - SURFACE
      ?auto_833516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_833512 ?auto_833513 ) ( IS-CRATE ?auto_833511 ) ( not ( = ?auto_833510 ?auto_833511 ) ) ( not ( = ?auto_833509 ?auto_833510 ) ) ( not ( = ?auto_833509 ?auto_833511 ) ) ( not ( = ?auto_833515 ?auto_833513 ) ) ( HOIST-AT ?auto_833517 ?auto_833515 ) ( not ( = ?auto_833512 ?auto_833517 ) ) ( AVAILABLE ?auto_833517 ) ( SURFACE-AT ?auto_833511 ?auto_833515 ) ( ON ?auto_833511 ?auto_833514 ) ( CLEAR ?auto_833511 ) ( not ( = ?auto_833510 ?auto_833514 ) ) ( not ( = ?auto_833511 ?auto_833514 ) ) ( not ( = ?auto_833509 ?auto_833514 ) ) ( TRUCK-AT ?auto_833516 ?auto_833513 ) ( SURFACE-AT ?auto_833509 ?auto_833513 ) ( CLEAR ?auto_833509 ) ( IS-CRATE ?auto_833510 ) ( AVAILABLE ?auto_833512 ) ( IN ?auto_833510 ?auto_833516 ) ( ON ?auto_833500 ?auto_833499 ) ( ON ?auto_833501 ?auto_833500 ) ( ON ?auto_833503 ?auto_833501 ) ( ON ?auto_833502 ?auto_833503 ) ( ON ?auto_833504 ?auto_833502 ) ( ON ?auto_833505 ?auto_833504 ) ( ON ?auto_833506 ?auto_833505 ) ( ON ?auto_833507 ?auto_833506 ) ( ON ?auto_833508 ?auto_833507 ) ( ON ?auto_833509 ?auto_833508 ) ( not ( = ?auto_833499 ?auto_833500 ) ) ( not ( = ?auto_833499 ?auto_833501 ) ) ( not ( = ?auto_833499 ?auto_833503 ) ) ( not ( = ?auto_833499 ?auto_833502 ) ) ( not ( = ?auto_833499 ?auto_833504 ) ) ( not ( = ?auto_833499 ?auto_833505 ) ) ( not ( = ?auto_833499 ?auto_833506 ) ) ( not ( = ?auto_833499 ?auto_833507 ) ) ( not ( = ?auto_833499 ?auto_833508 ) ) ( not ( = ?auto_833499 ?auto_833509 ) ) ( not ( = ?auto_833499 ?auto_833510 ) ) ( not ( = ?auto_833499 ?auto_833511 ) ) ( not ( = ?auto_833499 ?auto_833514 ) ) ( not ( = ?auto_833500 ?auto_833501 ) ) ( not ( = ?auto_833500 ?auto_833503 ) ) ( not ( = ?auto_833500 ?auto_833502 ) ) ( not ( = ?auto_833500 ?auto_833504 ) ) ( not ( = ?auto_833500 ?auto_833505 ) ) ( not ( = ?auto_833500 ?auto_833506 ) ) ( not ( = ?auto_833500 ?auto_833507 ) ) ( not ( = ?auto_833500 ?auto_833508 ) ) ( not ( = ?auto_833500 ?auto_833509 ) ) ( not ( = ?auto_833500 ?auto_833510 ) ) ( not ( = ?auto_833500 ?auto_833511 ) ) ( not ( = ?auto_833500 ?auto_833514 ) ) ( not ( = ?auto_833501 ?auto_833503 ) ) ( not ( = ?auto_833501 ?auto_833502 ) ) ( not ( = ?auto_833501 ?auto_833504 ) ) ( not ( = ?auto_833501 ?auto_833505 ) ) ( not ( = ?auto_833501 ?auto_833506 ) ) ( not ( = ?auto_833501 ?auto_833507 ) ) ( not ( = ?auto_833501 ?auto_833508 ) ) ( not ( = ?auto_833501 ?auto_833509 ) ) ( not ( = ?auto_833501 ?auto_833510 ) ) ( not ( = ?auto_833501 ?auto_833511 ) ) ( not ( = ?auto_833501 ?auto_833514 ) ) ( not ( = ?auto_833503 ?auto_833502 ) ) ( not ( = ?auto_833503 ?auto_833504 ) ) ( not ( = ?auto_833503 ?auto_833505 ) ) ( not ( = ?auto_833503 ?auto_833506 ) ) ( not ( = ?auto_833503 ?auto_833507 ) ) ( not ( = ?auto_833503 ?auto_833508 ) ) ( not ( = ?auto_833503 ?auto_833509 ) ) ( not ( = ?auto_833503 ?auto_833510 ) ) ( not ( = ?auto_833503 ?auto_833511 ) ) ( not ( = ?auto_833503 ?auto_833514 ) ) ( not ( = ?auto_833502 ?auto_833504 ) ) ( not ( = ?auto_833502 ?auto_833505 ) ) ( not ( = ?auto_833502 ?auto_833506 ) ) ( not ( = ?auto_833502 ?auto_833507 ) ) ( not ( = ?auto_833502 ?auto_833508 ) ) ( not ( = ?auto_833502 ?auto_833509 ) ) ( not ( = ?auto_833502 ?auto_833510 ) ) ( not ( = ?auto_833502 ?auto_833511 ) ) ( not ( = ?auto_833502 ?auto_833514 ) ) ( not ( = ?auto_833504 ?auto_833505 ) ) ( not ( = ?auto_833504 ?auto_833506 ) ) ( not ( = ?auto_833504 ?auto_833507 ) ) ( not ( = ?auto_833504 ?auto_833508 ) ) ( not ( = ?auto_833504 ?auto_833509 ) ) ( not ( = ?auto_833504 ?auto_833510 ) ) ( not ( = ?auto_833504 ?auto_833511 ) ) ( not ( = ?auto_833504 ?auto_833514 ) ) ( not ( = ?auto_833505 ?auto_833506 ) ) ( not ( = ?auto_833505 ?auto_833507 ) ) ( not ( = ?auto_833505 ?auto_833508 ) ) ( not ( = ?auto_833505 ?auto_833509 ) ) ( not ( = ?auto_833505 ?auto_833510 ) ) ( not ( = ?auto_833505 ?auto_833511 ) ) ( not ( = ?auto_833505 ?auto_833514 ) ) ( not ( = ?auto_833506 ?auto_833507 ) ) ( not ( = ?auto_833506 ?auto_833508 ) ) ( not ( = ?auto_833506 ?auto_833509 ) ) ( not ( = ?auto_833506 ?auto_833510 ) ) ( not ( = ?auto_833506 ?auto_833511 ) ) ( not ( = ?auto_833506 ?auto_833514 ) ) ( not ( = ?auto_833507 ?auto_833508 ) ) ( not ( = ?auto_833507 ?auto_833509 ) ) ( not ( = ?auto_833507 ?auto_833510 ) ) ( not ( = ?auto_833507 ?auto_833511 ) ) ( not ( = ?auto_833507 ?auto_833514 ) ) ( not ( = ?auto_833508 ?auto_833509 ) ) ( not ( = ?auto_833508 ?auto_833510 ) ) ( not ( = ?auto_833508 ?auto_833511 ) ) ( not ( = ?auto_833508 ?auto_833514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_833509 ?auto_833510 ?auto_833511 )
      ( MAKE-12CRATE-VERIFY ?auto_833499 ?auto_833500 ?auto_833501 ?auto_833503 ?auto_833502 ?auto_833504 ?auto_833505 ?auto_833506 ?auto_833507 ?auto_833508 ?auto_833509 ?auto_833510 ?auto_833511 ) )
  )

)

