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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18485 - SURFACE
      ?auto_18486 - SURFACE
    )
    :vars
    (
      ?auto_18487 - HOIST
      ?auto_18488 - PLACE
      ?auto_18490 - PLACE
      ?auto_18491 - HOIST
      ?auto_18492 - SURFACE
      ?auto_18489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18487 ?auto_18488 ) ( SURFACE-AT ?auto_18485 ?auto_18488 ) ( CLEAR ?auto_18485 ) ( IS-CRATE ?auto_18486 ) ( AVAILABLE ?auto_18487 ) ( not ( = ?auto_18490 ?auto_18488 ) ) ( HOIST-AT ?auto_18491 ?auto_18490 ) ( AVAILABLE ?auto_18491 ) ( SURFACE-AT ?auto_18486 ?auto_18490 ) ( ON ?auto_18486 ?auto_18492 ) ( CLEAR ?auto_18486 ) ( TRUCK-AT ?auto_18489 ?auto_18488 ) ( not ( = ?auto_18485 ?auto_18486 ) ) ( not ( = ?auto_18485 ?auto_18492 ) ) ( not ( = ?auto_18486 ?auto_18492 ) ) ( not ( = ?auto_18487 ?auto_18491 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18489 ?auto_18488 ?auto_18490 )
      ( !LIFT ?auto_18491 ?auto_18486 ?auto_18492 ?auto_18490 )
      ( !LOAD ?auto_18491 ?auto_18486 ?auto_18489 ?auto_18490 )
      ( !DRIVE ?auto_18489 ?auto_18490 ?auto_18488 )
      ( !UNLOAD ?auto_18487 ?auto_18486 ?auto_18489 ?auto_18488 )
      ( !DROP ?auto_18487 ?auto_18486 ?auto_18485 ?auto_18488 )
      ( MAKE-1CRATE-VERIFY ?auto_18485 ?auto_18486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18495 - SURFACE
      ?auto_18496 - SURFACE
    )
    :vars
    (
      ?auto_18497 - HOIST
      ?auto_18498 - PLACE
      ?auto_18500 - PLACE
      ?auto_18501 - HOIST
      ?auto_18502 - SURFACE
      ?auto_18499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18497 ?auto_18498 ) ( SURFACE-AT ?auto_18495 ?auto_18498 ) ( CLEAR ?auto_18495 ) ( IS-CRATE ?auto_18496 ) ( AVAILABLE ?auto_18497 ) ( not ( = ?auto_18500 ?auto_18498 ) ) ( HOIST-AT ?auto_18501 ?auto_18500 ) ( AVAILABLE ?auto_18501 ) ( SURFACE-AT ?auto_18496 ?auto_18500 ) ( ON ?auto_18496 ?auto_18502 ) ( CLEAR ?auto_18496 ) ( TRUCK-AT ?auto_18499 ?auto_18498 ) ( not ( = ?auto_18495 ?auto_18496 ) ) ( not ( = ?auto_18495 ?auto_18502 ) ) ( not ( = ?auto_18496 ?auto_18502 ) ) ( not ( = ?auto_18497 ?auto_18501 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18499 ?auto_18498 ?auto_18500 )
      ( !LIFT ?auto_18501 ?auto_18496 ?auto_18502 ?auto_18500 )
      ( !LOAD ?auto_18501 ?auto_18496 ?auto_18499 ?auto_18500 )
      ( !DRIVE ?auto_18499 ?auto_18500 ?auto_18498 )
      ( !UNLOAD ?auto_18497 ?auto_18496 ?auto_18499 ?auto_18498 )
      ( !DROP ?auto_18497 ?auto_18496 ?auto_18495 ?auto_18498 )
      ( MAKE-1CRATE-VERIFY ?auto_18495 ?auto_18496 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18506 - SURFACE
      ?auto_18507 - SURFACE
      ?auto_18508 - SURFACE
    )
    :vars
    (
      ?auto_18509 - HOIST
      ?auto_18514 - PLACE
      ?auto_18513 - PLACE
      ?auto_18512 - HOIST
      ?auto_18511 - SURFACE
      ?auto_18516 - PLACE
      ?auto_18515 - HOIST
      ?auto_18517 - SURFACE
      ?auto_18510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18509 ?auto_18514 ) ( IS-CRATE ?auto_18508 ) ( not ( = ?auto_18513 ?auto_18514 ) ) ( HOIST-AT ?auto_18512 ?auto_18513 ) ( AVAILABLE ?auto_18512 ) ( SURFACE-AT ?auto_18508 ?auto_18513 ) ( ON ?auto_18508 ?auto_18511 ) ( CLEAR ?auto_18508 ) ( not ( = ?auto_18507 ?auto_18508 ) ) ( not ( = ?auto_18507 ?auto_18511 ) ) ( not ( = ?auto_18508 ?auto_18511 ) ) ( not ( = ?auto_18509 ?auto_18512 ) ) ( SURFACE-AT ?auto_18506 ?auto_18514 ) ( CLEAR ?auto_18506 ) ( IS-CRATE ?auto_18507 ) ( AVAILABLE ?auto_18509 ) ( not ( = ?auto_18516 ?auto_18514 ) ) ( HOIST-AT ?auto_18515 ?auto_18516 ) ( AVAILABLE ?auto_18515 ) ( SURFACE-AT ?auto_18507 ?auto_18516 ) ( ON ?auto_18507 ?auto_18517 ) ( CLEAR ?auto_18507 ) ( TRUCK-AT ?auto_18510 ?auto_18514 ) ( not ( = ?auto_18506 ?auto_18507 ) ) ( not ( = ?auto_18506 ?auto_18517 ) ) ( not ( = ?auto_18507 ?auto_18517 ) ) ( not ( = ?auto_18509 ?auto_18515 ) ) ( not ( = ?auto_18506 ?auto_18508 ) ) ( not ( = ?auto_18506 ?auto_18511 ) ) ( not ( = ?auto_18508 ?auto_18517 ) ) ( not ( = ?auto_18513 ?auto_18516 ) ) ( not ( = ?auto_18512 ?auto_18515 ) ) ( not ( = ?auto_18511 ?auto_18517 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18506 ?auto_18507 )
      ( MAKE-1CRATE ?auto_18507 ?auto_18508 )
      ( MAKE-2CRATE-VERIFY ?auto_18506 ?auto_18507 ?auto_18508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18520 - SURFACE
      ?auto_18521 - SURFACE
    )
    :vars
    (
      ?auto_18522 - HOIST
      ?auto_18523 - PLACE
      ?auto_18525 - PLACE
      ?auto_18526 - HOIST
      ?auto_18527 - SURFACE
      ?auto_18524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18522 ?auto_18523 ) ( SURFACE-AT ?auto_18520 ?auto_18523 ) ( CLEAR ?auto_18520 ) ( IS-CRATE ?auto_18521 ) ( AVAILABLE ?auto_18522 ) ( not ( = ?auto_18525 ?auto_18523 ) ) ( HOIST-AT ?auto_18526 ?auto_18525 ) ( AVAILABLE ?auto_18526 ) ( SURFACE-AT ?auto_18521 ?auto_18525 ) ( ON ?auto_18521 ?auto_18527 ) ( CLEAR ?auto_18521 ) ( TRUCK-AT ?auto_18524 ?auto_18523 ) ( not ( = ?auto_18520 ?auto_18521 ) ) ( not ( = ?auto_18520 ?auto_18527 ) ) ( not ( = ?auto_18521 ?auto_18527 ) ) ( not ( = ?auto_18522 ?auto_18526 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18524 ?auto_18523 ?auto_18525 )
      ( !LIFT ?auto_18526 ?auto_18521 ?auto_18527 ?auto_18525 )
      ( !LOAD ?auto_18526 ?auto_18521 ?auto_18524 ?auto_18525 )
      ( !DRIVE ?auto_18524 ?auto_18525 ?auto_18523 )
      ( !UNLOAD ?auto_18522 ?auto_18521 ?auto_18524 ?auto_18523 )
      ( !DROP ?auto_18522 ?auto_18521 ?auto_18520 ?auto_18523 )
      ( MAKE-1CRATE-VERIFY ?auto_18520 ?auto_18521 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18532 - SURFACE
      ?auto_18533 - SURFACE
      ?auto_18534 - SURFACE
      ?auto_18535 - SURFACE
    )
    :vars
    (
      ?auto_18537 - HOIST
      ?auto_18541 - PLACE
      ?auto_18540 - PLACE
      ?auto_18539 - HOIST
      ?auto_18538 - SURFACE
      ?auto_18546 - PLACE
      ?auto_18542 - HOIST
      ?auto_18545 - SURFACE
      ?auto_18544 - PLACE
      ?auto_18547 - HOIST
      ?auto_18543 - SURFACE
      ?auto_18536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18537 ?auto_18541 ) ( IS-CRATE ?auto_18535 ) ( not ( = ?auto_18540 ?auto_18541 ) ) ( HOIST-AT ?auto_18539 ?auto_18540 ) ( AVAILABLE ?auto_18539 ) ( SURFACE-AT ?auto_18535 ?auto_18540 ) ( ON ?auto_18535 ?auto_18538 ) ( CLEAR ?auto_18535 ) ( not ( = ?auto_18534 ?auto_18535 ) ) ( not ( = ?auto_18534 ?auto_18538 ) ) ( not ( = ?auto_18535 ?auto_18538 ) ) ( not ( = ?auto_18537 ?auto_18539 ) ) ( IS-CRATE ?auto_18534 ) ( not ( = ?auto_18546 ?auto_18541 ) ) ( HOIST-AT ?auto_18542 ?auto_18546 ) ( AVAILABLE ?auto_18542 ) ( SURFACE-AT ?auto_18534 ?auto_18546 ) ( ON ?auto_18534 ?auto_18545 ) ( CLEAR ?auto_18534 ) ( not ( = ?auto_18533 ?auto_18534 ) ) ( not ( = ?auto_18533 ?auto_18545 ) ) ( not ( = ?auto_18534 ?auto_18545 ) ) ( not ( = ?auto_18537 ?auto_18542 ) ) ( SURFACE-AT ?auto_18532 ?auto_18541 ) ( CLEAR ?auto_18532 ) ( IS-CRATE ?auto_18533 ) ( AVAILABLE ?auto_18537 ) ( not ( = ?auto_18544 ?auto_18541 ) ) ( HOIST-AT ?auto_18547 ?auto_18544 ) ( AVAILABLE ?auto_18547 ) ( SURFACE-AT ?auto_18533 ?auto_18544 ) ( ON ?auto_18533 ?auto_18543 ) ( CLEAR ?auto_18533 ) ( TRUCK-AT ?auto_18536 ?auto_18541 ) ( not ( = ?auto_18532 ?auto_18533 ) ) ( not ( = ?auto_18532 ?auto_18543 ) ) ( not ( = ?auto_18533 ?auto_18543 ) ) ( not ( = ?auto_18537 ?auto_18547 ) ) ( not ( = ?auto_18532 ?auto_18534 ) ) ( not ( = ?auto_18532 ?auto_18545 ) ) ( not ( = ?auto_18534 ?auto_18543 ) ) ( not ( = ?auto_18546 ?auto_18544 ) ) ( not ( = ?auto_18542 ?auto_18547 ) ) ( not ( = ?auto_18545 ?auto_18543 ) ) ( not ( = ?auto_18532 ?auto_18535 ) ) ( not ( = ?auto_18532 ?auto_18538 ) ) ( not ( = ?auto_18533 ?auto_18535 ) ) ( not ( = ?auto_18533 ?auto_18538 ) ) ( not ( = ?auto_18535 ?auto_18545 ) ) ( not ( = ?auto_18535 ?auto_18543 ) ) ( not ( = ?auto_18540 ?auto_18546 ) ) ( not ( = ?auto_18540 ?auto_18544 ) ) ( not ( = ?auto_18539 ?auto_18542 ) ) ( not ( = ?auto_18539 ?auto_18547 ) ) ( not ( = ?auto_18538 ?auto_18545 ) ) ( not ( = ?auto_18538 ?auto_18543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18532 ?auto_18533 ?auto_18534 )
      ( MAKE-1CRATE ?auto_18534 ?auto_18535 )
      ( MAKE-3CRATE-VERIFY ?auto_18532 ?auto_18533 ?auto_18534 ?auto_18535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18550 - SURFACE
      ?auto_18551 - SURFACE
    )
    :vars
    (
      ?auto_18552 - HOIST
      ?auto_18553 - PLACE
      ?auto_18555 - PLACE
      ?auto_18556 - HOIST
      ?auto_18557 - SURFACE
      ?auto_18554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18552 ?auto_18553 ) ( SURFACE-AT ?auto_18550 ?auto_18553 ) ( CLEAR ?auto_18550 ) ( IS-CRATE ?auto_18551 ) ( AVAILABLE ?auto_18552 ) ( not ( = ?auto_18555 ?auto_18553 ) ) ( HOIST-AT ?auto_18556 ?auto_18555 ) ( AVAILABLE ?auto_18556 ) ( SURFACE-AT ?auto_18551 ?auto_18555 ) ( ON ?auto_18551 ?auto_18557 ) ( CLEAR ?auto_18551 ) ( TRUCK-AT ?auto_18554 ?auto_18553 ) ( not ( = ?auto_18550 ?auto_18551 ) ) ( not ( = ?auto_18550 ?auto_18557 ) ) ( not ( = ?auto_18551 ?auto_18557 ) ) ( not ( = ?auto_18552 ?auto_18556 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18554 ?auto_18553 ?auto_18555 )
      ( !LIFT ?auto_18556 ?auto_18551 ?auto_18557 ?auto_18555 )
      ( !LOAD ?auto_18556 ?auto_18551 ?auto_18554 ?auto_18555 )
      ( !DRIVE ?auto_18554 ?auto_18555 ?auto_18553 )
      ( !UNLOAD ?auto_18552 ?auto_18551 ?auto_18554 ?auto_18553 )
      ( !DROP ?auto_18552 ?auto_18551 ?auto_18550 ?auto_18553 )
      ( MAKE-1CRATE-VERIFY ?auto_18550 ?auto_18551 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18563 - SURFACE
      ?auto_18564 - SURFACE
      ?auto_18565 - SURFACE
      ?auto_18566 - SURFACE
      ?auto_18567 - SURFACE
    )
    :vars
    (
      ?auto_18569 - HOIST
      ?auto_18573 - PLACE
      ?auto_18570 - PLACE
      ?auto_18568 - HOIST
      ?auto_18571 - SURFACE
      ?auto_18574 - SURFACE
      ?auto_18579 - PLACE
      ?auto_18580 - HOIST
      ?auto_18577 - SURFACE
      ?auto_18578 - PLACE
      ?auto_18576 - HOIST
      ?auto_18575 - SURFACE
      ?auto_18572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18569 ?auto_18573 ) ( IS-CRATE ?auto_18567 ) ( not ( = ?auto_18570 ?auto_18573 ) ) ( HOIST-AT ?auto_18568 ?auto_18570 ) ( SURFACE-AT ?auto_18567 ?auto_18570 ) ( ON ?auto_18567 ?auto_18571 ) ( CLEAR ?auto_18567 ) ( not ( = ?auto_18566 ?auto_18567 ) ) ( not ( = ?auto_18566 ?auto_18571 ) ) ( not ( = ?auto_18567 ?auto_18571 ) ) ( not ( = ?auto_18569 ?auto_18568 ) ) ( IS-CRATE ?auto_18566 ) ( AVAILABLE ?auto_18568 ) ( SURFACE-AT ?auto_18566 ?auto_18570 ) ( ON ?auto_18566 ?auto_18574 ) ( CLEAR ?auto_18566 ) ( not ( = ?auto_18565 ?auto_18566 ) ) ( not ( = ?auto_18565 ?auto_18574 ) ) ( not ( = ?auto_18566 ?auto_18574 ) ) ( IS-CRATE ?auto_18565 ) ( not ( = ?auto_18579 ?auto_18573 ) ) ( HOIST-AT ?auto_18580 ?auto_18579 ) ( AVAILABLE ?auto_18580 ) ( SURFACE-AT ?auto_18565 ?auto_18579 ) ( ON ?auto_18565 ?auto_18577 ) ( CLEAR ?auto_18565 ) ( not ( = ?auto_18564 ?auto_18565 ) ) ( not ( = ?auto_18564 ?auto_18577 ) ) ( not ( = ?auto_18565 ?auto_18577 ) ) ( not ( = ?auto_18569 ?auto_18580 ) ) ( SURFACE-AT ?auto_18563 ?auto_18573 ) ( CLEAR ?auto_18563 ) ( IS-CRATE ?auto_18564 ) ( AVAILABLE ?auto_18569 ) ( not ( = ?auto_18578 ?auto_18573 ) ) ( HOIST-AT ?auto_18576 ?auto_18578 ) ( AVAILABLE ?auto_18576 ) ( SURFACE-AT ?auto_18564 ?auto_18578 ) ( ON ?auto_18564 ?auto_18575 ) ( CLEAR ?auto_18564 ) ( TRUCK-AT ?auto_18572 ?auto_18573 ) ( not ( = ?auto_18563 ?auto_18564 ) ) ( not ( = ?auto_18563 ?auto_18575 ) ) ( not ( = ?auto_18564 ?auto_18575 ) ) ( not ( = ?auto_18569 ?auto_18576 ) ) ( not ( = ?auto_18563 ?auto_18565 ) ) ( not ( = ?auto_18563 ?auto_18577 ) ) ( not ( = ?auto_18565 ?auto_18575 ) ) ( not ( = ?auto_18579 ?auto_18578 ) ) ( not ( = ?auto_18580 ?auto_18576 ) ) ( not ( = ?auto_18577 ?auto_18575 ) ) ( not ( = ?auto_18563 ?auto_18566 ) ) ( not ( = ?auto_18563 ?auto_18574 ) ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( not ( = ?auto_18564 ?auto_18574 ) ) ( not ( = ?auto_18566 ?auto_18577 ) ) ( not ( = ?auto_18566 ?auto_18575 ) ) ( not ( = ?auto_18570 ?auto_18579 ) ) ( not ( = ?auto_18570 ?auto_18578 ) ) ( not ( = ?auto_18568 ?auto_18580 ) ) ( not ( = ?auto_18568 ?auto_18576 ) ) ( not ( = ?auto_18574 ?auto_18577 ) ) ( not ( = ?auto_18574 ?auto_18575 ) ) ( not ( = ?auto_18563 ?auto_18567 ) ) ( not ( = ?auto_18563 ?auto_18571 ) ) ( not ( = ?auto_18564 ?auto_18567 ) ) ( not ( = ?auto_18564 ?auto_18571 ) ) ( not ( = ?auto_18565 ?auto_18567 ) ) ( not ( = ?auto_18565 ?auto_18571 ) ) ( not ( = ?auto_18567 ?auto_18574 ) ) ( not ( = ?auto_18567 ?auto_18577 ) ) ( not ( = ?auto_18567 ?auto_18575 ) ) ( not ( = ?auto_18571 ?auto_18574 ) ) ( not ( = ?auto_18571 ?auto_18577 ) ) ( not ( = ?auto_18571 ?auto_18575 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_18563 ?auto_18564 ?auto_18565 ?auto_18566 )
      ( MAKE-1CRATE ?auto_18566 ?auto_18567 )
      ( MAKE-4CRATE-VERIFY ?auto_18563 ?auto_18564 ?auto_18565 ?auto_18566 ?auto_18567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18583 - SURFACE
      ?auto_18584 - SURFACE
    )
    :vars
    (
      ?auto_18585 - HOIST
      ?auto_18586 - PLACE
      ?auto_18588 - PLACE
      ?auto_18589 - HOIST
      ?auto_18590 - SURFACE
      ?auto_18587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18585 ?auto_18586 ) ( SURFACE-AT ?auto_18583 ?auto_18586 ) ( CLEAR ?auto_18583 ) ( IS-CRATE ?auto_18584 ) ( AVAILABLE ?auto_18585 ) ( not ( = ?auto_18588 ?auto_18586 ) ) ( HOIST-AT ?auto_18589 ?auto_18588 ) ( AVAILABLE ?auto_18589 ) ( SURFACE-AT ?auto_18584 ?auto_18588 ) ( ON ?auto_18584 ?auto_18590 ) ( CLEAR ?auto_18584 ) ( TRUCK-AT ?auto_18587 ?auto_18586 ) ( not ( = ?auto_18583 ?auto_18584 ) ) ( not ( = ?auto_18583 ?auto_18590 ) ) ( not ( = ?auto_18584 ?auto_18590 ) ) ( not ( = ?auto_18585 ?auto_18589 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18587 ?auto_18586 ?auto_18588 )
      ( !LIFT ?auto_18589 ?auto_18584 ?auto_18590 ?auto_18588 )
      ( !LOAD ?auto_18589 ?auto_18584 ?auto_18587 ?auto_18588 )
      ( !DRIVE ?auto_18587 ?auto_18588 ?auto_18586 )
      ( !UNLOAD ?auto_18585 ?auto_18584 ?auto_18587 ?auto_18586 )
      ( !DROP ?auto_18585 ?auto_18584 ?auto_18583 ?auto_18586 )
      ( MAKE-1CRATE-VERIFY ?auto_18583 ?auto_18584 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18597 - SURFACE
      ?auto_18598 - SURFACE
      ?auto_18599 - SURFACE
      ?auto_18600 - SURFACE
      ?auto_18601 - SURFACE
      ?auto_18602 - SURFACE
    )
    :vars
    (
      ?auto_18606 - HOIST
      ?auto_18605 - PLACE
      ?auto_18607 - PLACE
      ?auto_18608 - HOIST
      ?auto_18604 - SURFACE
      ?auto_18610 - SURFACE
      ?auto_18616 - SURFACE
      ?auto_18614 - PLACE
      ?auto_18611 - HOIST
      ?auto_18615 - SURFACE
      ?auto_18609 - PLACE
      ?auto_18613 - HOIST
      ?auto_18612 - SURFACE
      ?auto_18603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18606 ?auto_18605 ) ( IS-CRATE ?auto_18602 ) ( not ( = ?auto_18607 ?auto_18605 ) ) ( HOIST-AT ?auto_18608 ?auto_18607 ) ( SURFACE-AT ?auto_18602 ?auto_18607 ) ( ON ?auto_18602 ?auto_18604 ) ( CLEAR ?auto_18602 ) ( not ( = ?auto_18601 ?auto_18602 ) ) ( not ( = ?auto_18601 ?auto_18604 ) ) ( not ( = ?auto_18602 ?auto_18604 ) ) ( not ( = ?auto_18606 ?auto_18608 ) ) ( IS-CRATE ?auto_18601 ) ( SURFACE-AT ?auto_18601 ?auto_18607 ) ( ON ?auto_18601 ?auto_18610 ) ( CLEAR ?auto_18601 ) ( not ( = ?auto_18600 ?auto_18601 ) ) ( not ( = ?auto_18600 ?auto_18610 ) ) ( not ( = ?auto_18601 ?auto_18610 ) ) ( IS-CRATE ?auto_18600 ) ( AVAILABLE ?auto_18608 ) ( SURFACE-AT ?auto_18600 ?auto_18607 ) ( ON ?auto_18600 ?auto_18616 ) ( CLEAR ?auto_18600 ) ( not ( = ?auto_18599 ?auto_18600 ) ) ( not ( = ?auto_18599 ?auto_18616 ) ) ( not ( = ?auto_18600 ?auto_18616 ) ) ( IS-CRATE ?auto_18599 ) ( not ( = ?auto_18614 ?auto_18605 ) ) ( HOIST-AT ?auto_18611 ?auto_18614 ) ( AVAILABLE ?auto_18611 ) ( SURFACE-AT ?auto_18599 ?auto_18614 ) ( ON ?auto_18599 ?auto_18615 ) ( CLEAR ?auto_18599 ) ( not ( = ?auto_18598 ?auto_18599 ) ) ( not ( = ?auto_18598 ?auto_18615 ) ) ( not ( = ?auto_18599 ?auto_18615 ) ) ( not ( = ?auto_18606 ?auto_18611 ) ) ( SURFACE-AT ?auto_18597 ?auto_18605 ) ( CLEAR ?auto_18597 ) ( IS-CRATE ?auto_18598 ) ( AVAILABLE ?auto_18606 ) ( not ( = ?auto_18609 ?auto_18605 ) ) ( HOIST-AT ?auto_18613 ?auto_18609 ) ( AVAILABLE ?auto_18613 ) ( SURFACE-AT ?auto_18598 ?auto_18609 ) ( ON ?auto_18598 ?auto_18612 ) ( CLEAR ?auto_18598 ) ( TRUCK-AT ?auto_18603 ?auto_18605 ) ( not ( = ?auto_18597 ?auto_18598 ) ) ( not ( = ?auto_18597 ?auto_18612 ) ) ( not ( = ?auto_18598 ?auto_18612 ) ) ( not ( = ?auto_18606 ?auto_18613 ) ) ( not ( = ?auto_18597 ?auto_18599 ) ) ( not ( = ?auto_18597 ?auto_18615 ) ) ( not ( = ?auto_18599 ?auto_18612 ) ) ( not ( = ?auto_18614 ?auto_18609 ) ) ( not ( = ?auto_18611 ?auto_18613 ) ) ( not ( = ?auto_18615 ?auto_18612 ) ) ( not ( = ?auto_18597 ?auto_18600 ) ) ( not ( = ?auto_18597 ?auto_18616 ) ) ( not ( = ?auto_18598 ?auto_18600 ) ) ( not ( = ?auto_18598 ?auto_18616 ) ) ( not ( = ?auto_18600 ?auto_18615 ) ) ( not ( = ?auto_18600 ?auto_18612 ) ) ( not ( = ?auto_18607 ?auto_18614 ) ) ( not ( = ?auto_18607 ?auto_18609 ) ) ( not ( = ?auto_18608 ?auto_18611 ) ) ( not ( = ?auto_18608 ?auto_18613 ) ) ( not ( = ?auto_18616 ?auto_18615 ) ) ( not ( = ?auto_18616 ?auto_18612 ) ) ( not ( = ?auto_18597 ?auto_18601 ) ) ( not ( = ?auto_18597 ?auto_18610 ) ) ( not ( = ?auto_18598 ?auto_18601 ) ) ( not ( = ?auto_18598 ?auto_18610 ) ) ( not ( = ?auto_18599 ?auto_18601 ) ) ( not ( = ?auto_18599 ?auto_18610 ) ) ( not ( = ?auto_18601 ?auto_18616 ) ) ( not ( = ?auto_18601 ?auto_18615 ) ) ( not ( = ?auto_18601 ?auto_18612 ) ) ( not ( = ?auto_18610 ?auto_18616 ) ) ( not ( = ?auto_18610 ?auto_18615 ) ) ( not ( = ?auto_18610 ?auto_18612 ) ) ( not ( = ?auto_18597 ?auto_18602 ) ) ( not ( = ?auto_18597 ?auto_18604 ) ) ( not ( = ?auto_18598 ?auto_18602 ) ) ( not ( = ?auto_18598 ?auto_18604 ) ) ( not ( = ?auto_18599 ?auto_18602 ) ) ( not ( = ?auto_18599 ?auto_18604 ) ) ( not ( = ?auto_18600 ?auto_18602 ) ) ( not ( = ?auto_18600 ?auto_18604 ) ) ( not ( = ?auto_18602 ?auto_18610 ) ) ( not ( = ?auto_18602 ?auto_18616 ) ) ( not ( = ?auto_18602 ?auto_18615 ) ) ( not ( = ?auto_18602 ?auto_18612 ) ) ( not ( = ?auto_18604 ?auto_18610 ) ) ( not ( = ?auto_18604 ?auto_18616 ) ) ( not ( = ?auto_18604 ?auto_18615 ) ) ( not ( = ?auto_18604 ?auto_18612 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_18597 ?auto_18598 ?auto_18599 ?auto_18600 ?auto_18601 )
      ( MAKE-1CRATE ?auto_18601 ?auto_18602 )
      ( MAKE-5CRATE-VERIFY ?auto_18597 ?auto_18598 ?auto_18599 ?auto_18600 ?auto_18601 ?auto_18602 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18619 - SURFACE
      ?auto_18620 - SURFACE
    )
    :vars
    (
      ?auto_18621 - HOIST
      ?auto_18622 - PLACE
      ?auto_18624 - PLACE
      ?auto_18625 - HOIST
      ?auto_18626 - SURFACE
      ?auto_18623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18621 ?auto_18622 ) ( SURFACE-AT ?auto_18619 ?auto_18622 ) ( CLEAR ?auto_18619 ) ( IS-CRATE ?auto_18620 ) ( AVAILABLE ?auto_18621 ) ( not ( = ?auto_18624 ?auto_18622 ) ) ( HOIST-AT ?auto_18625 ?auto_18624 ) ( AVAILABLE ?auto_18625 ) ( SURFACE-AT ?auto_18620 ?auto_18624 ) ( ON ?auto_18620 ?auto_18626 ) ( CLEAR ?auto_18620 ) ( TRUCK-AT ?auto_18623 ?auto_18622 ) ( not ( = ?auto_18619 ?auto_18620 ) ) ( not ( = ?auto_18619 ?auto_18626 ) ) ( not ( = ?auto_18620 ?auto_18626 ) ) ( not ( = ?auto_18621 ?auto_18625 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18623 ?auto_18622 ?auto_18624 )
      ( !LIFT ?auto_18625 ?auto_18620 ?auto_18626 ?auto_18624 )
      ( !LOAD ?auto_18625 ?auto_18620 ?auto_18623 ?auto_18624 )
      ( !DRIVE ?auto_18623 ?auto_18624 ?auto_18622 )
      ( !UNLOAD ?auto_18621 ?auto_18620 ?auto_18623 ?auto_18622 )
      ( !DROP ?auto_18621 ?auto_18620 ?auto_18619 ?auto_18622 )
      ( MAKE-1CRATE-VERIFY ?auto_18619 ?auto_18620 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_18634 - SURFACE
      ?auto_18635 - SURFACE
      ?auto_18636 - SURFACE
      ?auto_18637 - SURFACE
      ?auto_18638 - SURFACE
      ?auto_18639 - SURFACE
      ?auto_18640 - SURFACE
    )
    :vars
    (
      ?auto_18644 - HOIST
      ?auto_18643 - PLACE
      ?auto_18642 - PLACE
      ?auto_18646 - HOIST
      ?auto_18641 - SURFACE
      ?auto_18647 - PLACE
      ?auto_18648 - HOIST
      ?auto_18650 - SURFACE
      ?auto_18655 - SURFACE
      ?auto_18654 - SURFACE
      ?auto_18652 - SURFACE
      ?auto_18649 - PLACE
      ?auto_18653 - HOIST
      ?auto_18651 - SURFACE
      ?auto_18645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18644 ?auto_18643 ) ( IS-CRATE ?auto_18640 ) ( not ( = ?auto_18642 ?auto_18643 ) ) ( HOIST-AT ?auto_18646 ?auto_18642 ) ( SURFACE-AT ?auto_18640 ?auto_18642 ) ( ON ?auto_18640 ?auto_18641 ) ( CLEAR ?auto_18640 ) ( not ( = ?auto_18639 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18641 ) ) ( not ( = ?auto_18640 ?auto_18641 ) ) ( not ( = ?auto_18644 ?auto_18646 ) ) ( IS-CRATE ?auto_18639 ) ( not ( = ?auto_18647 ?auto_18643 ) ) ( HOIST-AT ?auto_18648 ?auto_18647 ) ( SURFACE-AT ?auto_18639 ?auto_18647 ) ( ON ?auto_18639 ?auto_18650 ) ( CLEAR ?auto_18639 ) ( not ( = ?auto_18638 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18650 ) ) ( not ( = ?auto_18639 ?auto_18650 ) ) ( not ( = ?auto_18644 ?auto_18648 ) ) ( IS-CRATE ?auto_18638 ) ( SURFACE-AT ?auto_18638 ?auto_18647 ) ( ON ?auto_18638 ?auto_18655 ) ( CLEAR ?auto_18638 ) ( not ( = ?auto_18637 ?auto_18638 ) ) ( not ( = ?auto_18637 ?auto_18655 ) ) ( not ( = ?auto_18638 ?auto_18655 ) ) ( IS-CRATE ?auto_18637 ) ( AVAILABLE ?auto_18648 ) ( SURFACE-AT ?auto_18637 ?auto_18647 ) ( ON ?auto_18637 ?auto_18654 ) ( CLEAR ?auto_18637 ) ( not ( = ?auto_18636 ?auto_18637 ) ) ( not ( = ?auto_18636 ?auto_18654 ) ) ( not ( = ?auto_18637 ?auto_18654 ) ) ( IS-CRATE ?auto_18636 ) ( AVAILABLE ?auto_18646 ) ( SURFACE-AT ?auto_18636 ?auto_18642 ) ( ON ?auto_18636 ?auto_18652 ) ( CLEAR ?auto_18636 ) ( not ( = ?auto_18635 ?auto_18636 ) ) ( not ( = ?auto_18635 ?auto_18652 ) ) ( not ( = ?auto_18636 ?auto_18652 ) ) ( SURFACE-AT ?auto_18634 ?auto_18643 ) ( CLEAR ?auto_18634 ) ( IS-CRATE ?auto_18635 ) ( AVAILABLE ?auto_18644 ) ( not ( = ?auto_18649 ?auto_18643 ) ) ( HOIST-AT ?auto_18653 ?auto_18649 ) ( AVAILABLE ?auto_18653 ) ( SURFACE-AT ?auto_18635 ?auto_18649 ) ( ON ?auto_18635 ?auto_18651 ) ( CLEAR ?auto_18635 ) ( TRUCK-AT ?auto_18645 ?auto_18643 ) ( not ( = ?auto_18634 ?auto_18635 ) ) ( not ( = ?auto_18634 ?auto_18651 ) ) ( not ( = ?auto_18635 ?auto_18651 ) ) ( not ( = ?auto_18644 ?auto_18653 ) ) ( not ( = ?auto_18634 ?auto_18636 ) ) ( not ( = ?auto_18634 ?auto_18652 ) ) ( not ( = ?auto_18636 ?auto_18651 ) ) ( not ( = ?auto_18642 ?auto_18649 ) ) ( not ( = ?auto_18646 ?auto_18653 ) ) ( not ( = ?auto_18652 ?auto_18651 ) ) ( not ( = ?auto_18634 ?auto_18637 ) ) ( not ( = ?auto_18634 ?auto_18654 ) ) ( not ( = ?auto_18635 ?auto_18637 ) ) ( not ( = ?auto_18635 ?auto_18654 ) ) ( not ( = ?auto_18637 ?auto_18652 ) ) ( not ( = ?auto_18637 ?auto_18651 ) ) ( not ( = ?auto_18647 ?auto_18642 ) ) ( not ( = ?auto_18647 ?auto_18649 ) ) ( not ( = ?auto_18648 ?auto_18646 ) ) ( not ( = ?auto_18648 ?auto_18653 ) ) ( not ( = ?auto_18654 ?auto_18652 ) ) ( not ( = ?auto_18654 ?auto_18651 ) ) ( not ( = ?auto_18634 ?auto_18638 ) ) ( not ( = ?auto_18634 ?auto_18655 ) ) ( not ( = ?auto_18635 ?auto_18638 ) ) ( not ( = ?auto_18635 ?auto_18655 ) ) ( not ( = ?auto_18636 ?auto_18638 ) ) ( not ( = ?auto_18636 ?auto_18655 ) ) ( not ( = ?auto_18638 ?auto_18654 ) ) ( not ( = ?auto_18638 ?auto_18652 ) ) ( not ( = ?auto_18638 ?auto_18651 ) ) ( not ( = ?auto_18655 ?auto_18654 ) ) ( not ( = ?auto_18655 ?auto_18652 ) ) ( not ( = ?auto_18655 ?auto_18651 ) ) ( not ( = ?auto_18634 ?auto_18639 ) ) ( not ( = ?auto_18634 ?auto_18650 ) ) ( not ( = ?auto_18635 ?auto_18639 ) ) ( not ( = ?auto_18635 ?auto_18650 ) ) ( not ( = ?auto_18636 ?auto_18639 ) ) ( not ( = ?auto_18636 ?auto_18650 ) ) ( not ( = ?auto_18637 ?auto_18639 ) ) ( not ( = ?auto_18637 ?auto_18650 ) ) ( not ( = ?auto_18639 ?auto_18655 ) ) ( not ( = ?auto_18639 ?auto_18654 ) ) ( not ( = ?auto_18639 ?auto_18652 ) ) ( not ( = ?auto_18639 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18655 ) ) ( not ( = ?auto_18650 ?auto_18654 ) ) ( not ( = ?auto_18650 ?auto_18652 ) ) ( not ( = ?auto_18650 ?auto_18651 ) ) ( not ( = ?auto_18634 ?auto_18640 ) ) ( not ( = ?auto_18634 ?auto_18641 ) ) ( not ( = ?auto_18635 ?auto_18640 ) ) ( not ( = ?auto_18635 ?auto_18641 ) ) ( not ( = ?auto_18636 ?auto_18640 ) ) ( not ( = ?auto_18636 ?auto_18641 ) ) ( not ( = ?auto_18637 ?auto_18640 ) ) ( not ( = ?auto_18637 ?auto_18641 ) ) ( not ( = ?auto_18638 ?auto_18640 ) ) ( not ( = ?auto_18638 ?auto_18641 ) ) ( not ( = ?auto_18640 ?auto_18650 ) ) ( not ( = ?auto_18640 ?auto_18655 ) ) ( not ( = ?auto_18640 ?auto_18654 ) ) ( not ( = ?auto_18640 ?auto_18652 ) ) ( not ( = ?auto_18640 ?auto_18651 ) ) ( not ( = ?auto_18641 ?auto_18650 ) ) ( not ( = ?auto_18641 ?auto_18655 ) ) ( not ( = ?auto_18641 ?auto_18654 ) ) ( not ( = ?auto_18641 ?auto_18652 ) ) ( not ( = ?auto_18641 ?auto_18651 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_18634 ?auto_18635 ?auto_18636 ?auto_18637 ?auto_18638 ?auto_18639 )
      ( MAKE-1CRATE ?auto_18639 ?auto_18640 )
      ( MAKE-6CRATE-VERIFY ?auto_18634 ?auto_18635 ?auto_18636 ?auto_18637 ?auto_18638 ?auto_18639 ?auto_18640 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18658 - SURFACE
      ?auto_18659 - SURFACE
    )
    :vars
    (
      ?auto_18660 - HOIST
      ?auto_18661 - PLACE
      ?auto_18663 - PLACE
      ?auto_18664 - HOIST
      ?auto_18665 - SURFACE
      ?auto_18662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18660 ?auto_18661 ) ( SURFACE-AT ?auto_18658 ?auto_18661 ) ( CLEAR ?auto_18658 ) ( IS-CRATE ?auto_18659 ) ( AVAILABLE ?auto_18660 ) ( not ( = ?auto_18663 ?auto_18661 ) ) ( HOIST-AT ?auto_18664 ?auto_18663 ) ( AVAILABLE ?auto_18664 ) ( SURFACE-AT ?auto_18659 ?auto_18663 ) ( ON ?auto_18659 ?auto_18665 ) ( CLEAR ?auto_18659 ) ( TRUCK-AT ?auto_18662 ?auto_18661 ) ( not ( = ?auto_18658 ?auto_18659 ) ) ( not ( = ?auto_18658 ?auto_18665 ) ) ( not ( = ?auto_18659 ?auto_18665 ) ) ( not ( = ?auto_18660 ?auto_18664 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18662 ?auto_18661 ?auto_18663 )
      ( !LIFT ?auto_18664 ?auto_18659 ?auto_18665 ?auto_18663 )
      ( !LOAD ?auto_18664 ?auto_18659 ?auto_18662 ?auto_18663 )
      ( !DRIVE ?auto_18662 ?auto_18663 ?auto_18661 )
      ( !UNLOAD ?auto_18660 ?auto_18659 ?auto_18662 ?auto_18661 )
      ( !DROP ?auto_18660 ?auto_18659 ?auto_18658 ?auto_18661 )
      ( MAKE-1CRATE-VERIFY ?auto_18658 ?auto_18659 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_18674 - SURFACE
      ?auto_18675 - SURFACE
      ?auto_18676 - SURFACE
      ?auto_18677 - SURFACE
      ?auto_18678 - SURFACE
      ?auto_18679 - SURFACE
      ?auto_18681 - SURFACE
      ?auto_18680 - SURFACE
    )
    :vars
    (
      ?auto_18687 - HOIST
      ?auto_18684 - PLACE
      ?auto_18685 - PLACE
      ?auto_18686 - HOIST
      ?auto_18683 - SURFACE
      ?auto_18694 - SURFACE
      ?auto_18689 - PLACE
      ?auto_18688 - HOIST
      ?auto_18696 - SURFACE
      ?auto_18693 - SURFACE
      ?auto_18692 - SURFACE
      ?auto_18690 - SURFACE
      ?auto_18697 - PLACE
      ?auto_18691 - HOIST
      ?auto_18695 - SURFACE
      ?auto_18682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18687 ?auto_18684 ) ( IS-CRATE ?auto_18680 ) ( not ( = ?auto_18685 ?auto_18684 ) ) ( HOIST-AT ?auto_18686 ?auto_18685 ) ( SURFACE-AT ?auto_18680 ?auto_18685 ) ( ON ?auto_18680 ?auto_18683 ) ( CLEAR ?auto_18680 ) ( not ( = ?auto_18681 ?auto_18680 ) ) ( not ( = ?auto_18681 ?auto_18683 ) ) ( not ( = ?auto_18680 ?auto_18683 ) ) ( not ( = ?auto_18687 ?auto_18686 ) ) ( IS-CRATE ?auto_18681 ) ( SURFACE-AT ?auto_18681 ?auto_18685 ) ( ON ?auto_18681 ?auto_18694 ) ( CLEAR ?auto_18681 ) ( not ( = ?auto_18679 ?auto_18681 ) ) ( not ( = ?auto_18679 ?auto_18694 ) ) ( not ( = ?auto_18681 ?auto_18694 ) ) ( IS-CRATE ?auto_18679 ) ( not ( = ?auto_18689 ?auto_18684 ) ) ( HOIST-AT ?auto_18688 ?auto_18689 ) ( SURFACE-AT ?auto_18679 ?auto_18689 ) ( ON ?auto_18679 ?auto_18696 ) ( CLEAR ?auto_18679 ) ( not ( = ?auto_18678 ?auto_18679 ) ) ( not ( = ?auto_18678 ?auto_18696 ) ) ( not ( = ?auto_18679 ?auto_18696 ) ) ( not ( = ?auto_18687 ?auto_18688 ) ) ( IS-CRATE ?auto_18678 ) ( SURFACE-AT ?auto_18678 ?auto_18689 ) ( ON ?auto_18678 ?auto_18693 ) ( CLEAR ?auto_18678 ) ( not ( = ?auto_18677 ?auto_18678 ) ) ( not ( = ?auto_18677 ?auto_18693 ) ) ( not ( = ?auto_18678 ?auto_18693 ) ) ( IS-CRATE ?auto_18677 ) ( AVAILABLE ?auto_18688 ) ( SURFACE-AT ?auto_18677 ?auto_18689 ) ( ON ?auto_18677 ?auto_18692 ) ( CLEAR ?auto_18677 ) ( not ( = ?auto_18676 ?auto_18677 ) ) ( not ( = ?auto_18676 ?auto_18692 ) ) ( not ( = ?auto_18677 ?auto_18692 ) ) ( IS-CRATE ?auto_18676 ) ( AVAILABLE ?auto_18686 ) ( SURFACE-AT ?auto_18676 ?auto_18685 ) ( ON ?auto_18676 ?auto_18690 ) ( CLEAR ?auto_18676 ) ( not ( = ?auto_18675 ?auto_18676 ) ) ( not ( = ?auto_18675 ?auto_18690 ) ) ( not ( = ?auto_18676 ?auto_18690 ) ) ( SURFACE-AT ?auto_18674 ?auto_18684 ) ( CLEAR ?auto_18674 ) ( IS-CRATE ?auto_18675 ) ( AVAILABLE ?auto_18687 ) ( not ( = ?auto_18697 ?auto_18684 ) ) ( HOIST-AT ?auto_18691 ?auto_18697 ) ( AVAILABLE ?auto_18691 ) ( SURFACE-AT ?auto_18675 ?auto_18697 ) ( ON ?auto_18675 ?auto_18695 ) ( CLEAR ?auto_18675 ) ( TRUCK-AT ?auto_18682 ?auto_18684 ) ( not ( = ?auto_18674 ?auto_18675 ) ) ( not ( = ?auto_18674 ?auto_18695 ) ) ( not ( = ?auto_18675 ?auto_18695 ) ) ( not ( = ?auto_18687 ?auto_18691 ) ) ( not ( = ?auto_18674 ?auto_18676 ) ) ( not ( = ?auto_18674 ?auto_18690 ) ) ( not ( = ?auto_18676 ?auto_18695 ) ) ( not ( = ?auto_18685 ?auto_18697 ) ) ( not ( = ?auto_18686 ?auto_18691 ) ) ( not ( = ?auto_18690 ?auto_18695 ) ) ( not ( = ?auto_18674 ?auto_18677 ) ) ( not ( = ?auto_18674 ?auto_18692 ) ) ( not ( = ?auto_18675 ?auto_18677 ) ) ( not ( = ?auto_18675 ?auto_18692 ) ) ( not ( = ?auto_18677 ?auto_18690 ) ) ( not ( = ?auto_18677 ?auto_18695 ) ) ( not ( = ?auto_18689 ?auto_18685 ) ) ( not ( = ?auto_18689 ?auto_18697 ) ) ( not ( = ?auto_18688 ?auto_18686 ) ) ( not ( = ?auto_18688 ?auto_18691 ) ) ( not ( = ?auto_18692 ?auto_18690 ) ) ( not ( = ?auto_18692 ?auto_18695 ) ) ( not ( = ?auto_18674 ?auto_18678 ) ) ( not ( = ?auto_18674 ?auto_18693 ) ) ( not ( = ?auto_18675 ?auto_18678 ) ) ( not ( = ?auto_18675 ?auto_18693 ) ) ( not ( = ?auto_18676 ?auto_18678 ) ) ( not ( = ?auto_18676 ?auto_18693 ) ) ( not ( = ?auto_18678 ?auto_18692 ) ) ( not ( = ?auto_18678 ?auto_18690 ) ) ( not ( = ?auto_18678 ?auto_18695 ) ) ( not ( = ?auto_18693 ?auto_18692 ) ) ( not ( = ?auto_18693 ?auto_18690 ) ) ( not ( = ?auto_18693 ?auto_18695 ) ) ( not ( = ?auto_18674 ?auto_18679 ) ) ( not ( = ?auto_18674 ?auto_18696 ) ) ( not ( = ?auto_18675 ?auto_18679 ) ) ( not ( = ?auto_18675 ?auto_18696 ) ) ( not ( = ?auto_18676 ?auto_18679 ) ) ( not ( = ?auto_18676 ?auto_18696 ) ) ( not ( = ?auto_18677 ?auto_18679 ) ) ( not ( = ?auto_18677 ?auto_18696 ) ) ( not ( = ?auto_18679 ?auto_18693 ) ) ( not ( = ?auto_18679 ?auto_18692 ) ) ( not ( = ?auto_18679 ?auto_18690 ) ) ( not ( = ?auto_18679 ?auto_18695 ) ) ( not ( = ?auto_18696 ?auto_18693 ) ) ( not ( = ?auto_18696 ?auto_18692 ) ) ( not ( = ?auto_18696 ?auto_18690 ) ) ( not ( = ?auto_18696 ?auto_18695 ) ) ( not ( = ?auto_18674 ?auto_18681 ) ) ( not ( = ?auto_18674 ?auto_18694 ) ) ( not ( = ?auto_18675 ?auto_18681 ) ) ( not ( = ?auto_18675 ?auto_18694 ) ) ( not ( = ?auto_18676 ?auto_18681 ) ) ( not ( = ?auto_18676 ?auto_18694 ) ) ( not ( = ?auto_18677 ?auto_18681 ) ) ( not ( = ?auto_18677 ?auto_18694 ) ) ( not ( = ?auto_18678 ?auto_18681 ) ) ( not ( = ?auto_18678 ?auto_18694 ) ) ( not ( = ?auto_18681 ?auto_18696 ) ) ( not ( = ?auto_18681 ?auto_18693 ) ) ( not ( = ?auto_18681 ?auto_18692 ) ) ( not ( = ?auto_18681 ?auto_18690 ) ) ( not ( = ?auto_18681 ?auto_18695 ) ) ( not ( = ?auto_18694 ?auto_18696 ) ) ( not ( = ?auto_18694 ?auto_18693 ) ) ( not ( = ?auto_18694 ?auto_18692 ) ) ( not ( = ?auto_18694 ?auto_18690 ) ) ( not ( = ?auto_18694 ?auto_18695 ) ) ( not ( = ?auto_18674 ?auto_18680 ) ) ( not ( = ?auto_18674 ?auto_18683 ) ) ( not ( = ?auto_18675 ?auto_18680 ) ) ( not ( = ?auto_18675 ?auto_18683 ) ) ( not ( = ?auto_18676 ?auto_18680 ) ) ( not ( = ?auto_18676 ?auto_18683 ) ) ( not ( = ?auto_18677 ?auto_18680 ) ) ( not ( = ?auto_18677 ?auto_18683 ) ) ( not ( = ?auto_18678 ?auto_18680 ) ) ( not ( = ?auto_18678 ?auto_18683 ) ) ( not ( = ?auto_18679 ?auto_18680 ) ) ( not ( = ?auto_18679 ?auto_18683 ) ) ( not ( = ?auto_18680 ?auto_18694 ) ) ( not ( = ?auto_18680 ?auto_18696 ) ) ( not ( = ?auto_18680 ?auto_18693 ) ) ( not ( = ?auto_18680 ?auto_18692 ) ) ( not ( = ?auto_18680 ?auto_18690 ) ) ( not ( = ?auto_18680 ?auto_18695 ) ) ( not ( = ?auto_18683 ?auto_18694 ) ) ( not ( = ?auto_18683 ?auto_18696 ) ) ( not ( = ?auto_18683 ?auto_18693 ) ) ( not ( = ?auto_18683 ?auto_18692 ) ) ( not ( = ?auto_18683 ?auto_18690 ) ) ( not ( = ?auto_18683 ?auto_18695 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_18674 ?auto_18675 ?auto_18676 ?auto_18677 ?auto_18678 ?auto_18679 ?auto_18681 )
      ( MAKE-1CRATE ?auto_18681 ?auto_18680 )
      ( MAKE-7CRATE-VERIFY ?auto_18674 ?auto_18675 ?auto_18676 ?auto_18677 ?auto_18678 ?auto_18679 ?auto_18681 ?auto_18680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18700 - SURFACE
      ?auto_18701 - SURFACE
    )
    :vars
    (
      ?auto_18702 - HOIST
      ?auto_18703 - PLACE
      ?auto_18705 - PLACE
      ?auto_18706 - HOIST
      ?auto_18707 - SURFACE
      ?auto_18704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18702 ?auto_18703 ) ( SURFACE-AT ?auto_18700 ?auto_18703 ) ( CLEAR ?auto_18700 ) ( IS-CRATE ?auto_18701 ) ( AVAILABLE ?auto_18702 ) ( not ( = ?auto_18705 ?auto_18703 ) ) ( HOIST-AT ?auto_18706 ?auto_18705 ) ( AVAILABLE ?auto_18706 ) ( SURFACE-AT ?auto_18701 ?auto_18705 ) ( ON ?auto_18701 ?auto_18707 ) ( CLEAR ?auto_18701 ) ( TRUCK-AT ?auto_18704 ?auto_18703 ) ( not ( = ?auto_18700 ?auto_18701 ) ) ( not ( = ?auto_18700 ?auto_18707 ) ) ( not ( = ?auto_18701 ?auto_18707 ) ) ( not ( = ?auto_18702 ?auto_18706 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18704 ?auto_18703 ?auto_18705 )
      ( !LIFT ?auto_18706 ?auto_18701 ?auto_18707 ?auto_18705 )
      ( !LOAD ?auto_18706 ?auto_18701 ?auto_18704 ?auto_18705 )
      ( !DRIVE ?auto_18704 ?auto_18705 ?auto_18703 )
      ( !UNLOAD ?auto_18702 ?auto_18701 ?auto_18704 ?auto_18703 )
      ( !DROP ?auto_18702 ?auto_18701 ?auto_18700 ?auto_18703 )
      ( MAKE-1CRATE-VERIFY ?auto_18700 ?auto_18701 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_18717 - SURFACE
      ?auto_18718 - SURFACE
      ?auto_18719 - SURFACE
      ?auto_18720 - SURFACE
      ?auto_18721 - SURFACE
      ?auto_18722 - SURFACE
      ?auto_18725 - SURFACE
      ?auto_18724 - SURFACE
      ?auto_18723 - SURFACE
    )
    :vars
    (
      ?auto_18729 - HOIST
      ?auto_18731 - PLACE
      ?auto_18727 - PLACE
      ?auto_18726 - HOIST
      ?auto_18728 - SURFACE
      ?auto_18739 - PLACE
      ?auto_18742 - HOIST
      ?auto_18744 - SURFACE
      ?auto_18737 - SURFACE
      ?auto_18736 - PLACE
      ?auto_18732 - HOIST
      ?auto_18733 - SURFACE
      ?auto_18741 - SURFACE
      ?auto_18738 - SURFACE
      ?auto_18740 - SURFACE
      ?auto_18734 - PLACE
      ?auto_18743 - HOIST
      ?auto_18735 - SURFACE
      ?auto_18730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18729 ?auto_18731 ) ( IS-CRATE ?auto_18723 ) ( not ( = ?auto_18727 ?auto_18731 ) ) ( HOIST-AT ?auto_18726 ?auto_18727 ) ( AVAILABLE ?auto_18726 ) ( SURFACE-AT ?auto_18723 ?auto_18727 ) ( ON ?auto_18723 ?auto_18728 ) ( CLEAR ?auto_18723 ) ( not ( = ?auto_18724 ?auto_18723 ) ) ( not ( = ?auto_18724 ?auto_18728 ) ) ( not ( = ?auto_18723 ?auto_18728 ) ) ( not ( = ?auto_18729 ?auto_18726 ) ) ( IS-CRATE ?auto_18724 ) ( not ( = ?auto_18739 ?auto_18731 ) ) ( HOIST-AT ?auto_18742 ?auto_18739 ) ( SURFACE-AT ?auto_18724 ?auto_18739 ) ( ON ?auto_18724 ?auto_18744 ) ( CLEAR ?auto_18724 ) ( not ( = ?auto_18725 ?auto_18724 ) ) ( not ( = ?auto_18725 ?auto_18744 ) ) ( not ( = ?auto_18724 ?auto_18744 ) ) ( not ( = ?auto_18729 ?auto_18742 ) ) ( IS-CRATE ?auto_18725 ) ( SURFACE-AT ?auto_18725 ?auto_18739 ) ( ON ?auto_18725 ?auto_18737 ) ( CLEAR ?auto_18725 ) ( not ( = ?auto_18722 ?auto_18725 ) ) ( not ( = ?auto_18722 ?auto_18737 ) ) ( not ( = ?auto_18725 ?auto_18737 ) ) ( IS-CRATE ?auto_18722 ) ( not ( = ?auto_18736 ?auto_18731 ) ) ( HOIST-AT ?auto_18732 ?auto_18736 ) ( SURFACE-AT ?auto_18722 ?auto_18736 ) ( ON ?auto_18722 ?auto_18733 ) ( CLEAR ?auto_18722 ) ( not ( = ?auto_18721 ?auto_18722 ) ) ( not ( = ?auto_18721 ?auto_18733 ) ) ( not ( = ?auto_18722 ?auto_18733 ) ) ( not ( = ?auto_18729 ?auto_18732 ) ) ( IS-CRATE ?auto_18721 ) ( SURFACE-AT ?auto_18721 ?auto_18736 ) ( ON ?auto_18721 ?auto_18741 ) ( CLEAR ?auto_18721 ) ( not ( = ?auto_18720 ?auto_18721 ) ) ( not ( = ?auto_18720 ?auto_18741 ) ) ( not ( = ?auto_18721 ?auto_18741 ) ) ( IS-CRATE ?auto_18720 ) ( AVAILABLE ?auto_18732 ) ( SURFACE-AT ?auto_18720 ?auto_18736 ) ( ON ?auto_18720 ?auto_18738 ) ( CLEAR ?auto_18720 ) ( not ( = ?auto_18719 ?auto_18720 ) ) ( not ( = ?auto_18719 ?auto_18738 ) ) ( not ( = ?auto_18720 ?auto_18738 ) ) ( IS-CRATE ?auto_18719 ) ( AVAILABLE ?auto_18742 ) ( SURFACE-AT ?auto_18719 ?auto_18739 ) ( ON ?auto_18719 ?auto_18740 ) ( CLEAR ?auto_18719 ) ( not ( = ?auto_18718 ?auto_18719 ) ) ( not ( = ?auto_18718 ?auto_18740 ) ) ( not ( = ?auto_18719 ?auto_18740 ) ) ( SURFACE-AT ?auto_18717 ?auto_18731 ) ( CLEAR ?auto_18717 ) ( IS-CRATE ?auto_18718 ) ( AVAILABLE ?auto_18729 ) ( not ( = ?auto_18734 ?auto_18731 ) ) ( HOIST-AT ?auto_18743 ?auto_18734 ) ( AVAILABLE ?auto_18743 ) ( SURFACE-AT ?auto_18718 ?auto_18734 ) ( ON ?auto_18718 ?auto_18735 ) ( CLEAR ?auto_18718 ) ( TRUCK-AT ?auto_18730 ?auto_18731 ) ( not ( = ?auto_18717 ?auto_18718 ) ) ( not ( = ?auto_18717 ?auto_18735 ) ) ( not ( = ?auto_18718 ?auto_18735 ) ) ( not ( = ?auto_18729 ?auto_18743 ) ) ( not ( = ?auto_18717 ?auto_18719 ) ) ( not ( = ?auto_18717 ?auto_18740 ) ) ( not ( = ?auto_18719 ?auto_18735 ) ) ( not ( = ?auto_18739 ?auto_18734 ) ) ( not ( = ?auto_18742 ?auto_18743 ) ) ( not ( = ?auto_18740 ?auto_18735 ) ) ( not ( = ?auto_18717 ?auto_18720 ) ) ( not ( = ?auto_18717 ?auto_18738 ) ) ( not ( = ?auto_18718 ?auto_18720 ) ) ( not ( = ?auto_18718 ?auto_18738 ) ) ( not ( = ?auto_18720 ?auto_18740 ) ) ( not ( = ?auto_18720 ?auto_18735 ) ) ( not ( = ?auto_18736 ?auto_18739 ) ) ( not ( = ?auto_18736 ?auto_18734 ) ) ( not ( = ?auto_18732 ?auto_18742 ) ) ( not ( = ?auto_18732 ?auto_18743 ) ) ( not ( = ?auto_18738 ?auto_18740 ) ) ( not ( = ?auto_18738 ?auto_18735 ) ) ( not ( = ?auto_18717 ?auto_18721 ) ) ( not ( = ?auto_18717 ?auto_18741 ) ) ( not ( = ?auto_18718 ?auto_18721 ) ) ( not ( = ?auto_18718 ?auto_18741 ) ) ( not ( = ?auto_18719 ?auto_18721 ) ) ( not ( = ?auto_18719 ?auto_18741 ) ) ( not ( = ?auto_18721 ?auto_18738 ) ) ( not ( = ?auto_18721 ?auto_18740 ) ) ( not ( = ?auto_18721 ?auto_18735 ) ) ( not ( = ?auto_18741 ?auto_18738 ) ) ( not ( = ?auto_18741 ?auto_18740 ) ) ( not ( = ?auto_18741 ?auto_18735 ) ) ( not ( = ?auto_18717 ?auto_18722 ) ) ( not ( = ?auto_18717 ?auto_18733 ) ) ( not ( = ?auto_18718 ?auto_18722 ) ) ( not ( = ?auto_18718 ?auto_18733 ) ) ( not ( = ?auto_18719 ?auto_18722 ) ) ( not ( = ?auto_18719 ?auto_18733 ) ) ( not ( = ?auto_18720 ?auto_18722 ) ) ( not ( = ?auto_18720 ?auto_18733 ) ) ( not ( = ?auto_18722 ?auto_18741 ) ) ( not ( = ?auto_18722 ?auto_18738 ) ) ( not ( = ?auto_18722 ?auto_18740 ) ) ( not ( = ?auto_18722 ?auto_18735 ) ) ( not ( = ?auto_18733 ?auto_18741 ) ) ( not ( = ?auto_18733 ?auto_18738 ) ) ( not ( = ?auto_18733 ?auto_18740 ) ) ( not ( = ?auto_18733 ?auto_18735 ) ) ( not ( = ?auto_18717 ?auto_18725 ) ) ( not ( = ?auto_18717 ?auto_18737 ) ) ( not ( = ?auto_18718 ?auto_18725 ) ) ( not ( = ?auto_18718 ?auto_18737 ) ) ( not ( = ?auto_18719 ?auto_18725 ) ) ( not ( = ?auto_18719 ?auto_18737 ) ) ( not ( = ?auto_18720 ?auto_18725 ) ) ( not ( = ?auto_18720 ?auto_18737 ) ) ( not ( = ?auto_18721 ?auto_18725 ) ) ( not ( = ?auto_18721 ?auto_18737 ) ) ( not ( = ?auto_18725 ?auto_18733 ) ) ( not ( = ?auto_18725 ?auto_18741 ) ) ( not ( = ?auto_18725 ?auto_18738 ) ) ( not ( = ?auto_18725 ?auto_18740 ) ) ( not ( = ?auto_18725 ?auto_18735 ) ) ( not ( = ?auto_18737 ?auto_18733 ) ) ( not ( = ?auto_18737 ?auto_18741 ) ) ( not ( = ?auto_18737 ?auto_18738 ) ) ( not ( = ?auto_18737 ?auto_18740 ) ) ( not ( = ?auto_18737 ?auto_18735 ) ) ( not ( = ?auto_18717 ?auto_18724 ) ) ( not ( = ?auto_18717 ?auto_18744 ) ) ( not ( = ?auto_18718 ?auto_18724 ) ) ( not ( = ?auto_18718 ?auto_18744 ) ) ( not ( = ?auto_18719 ?auto_18724 ) ) ( not ( = ?auto_18719 ?auto_18744 ) ) ( not ( = ?auto_18720 ?auto_18724 ) ) ( not ( = ?auto_18720 ?auto_18744 ) ) ( not ( = ?auto_18721 ?auto_18724 ) ) ( not ( = ?auto_18721 ?auto_18744 ) ) ( not ( = ?auto_18722 ?auto_18724 ) ) ( not ( = ?auto_18722 ?auto_18744 ) ) ( not ( = ?auto_18724 ?auto_18737 ) ) ( not ( = ?auto_18724 ?auto_18733 ) ) ( not ( = ?auto_18724 ?auto_18741 ) ) ( not ( = ?auto_18724 ?auto_18738 ) ) ( not ( = ?auto_18724 ?auto_18740 ) ) ( not ( = ?auto_18724 ?auto_18735 ) ) ( not ( = ?auto_18744 ?auto_18737 ) ) ( not ( = ?auto_18744 ?auto_18733 ) ) ( not ( = ?auto_18744 ?auto_18741 ) ) ( not ( = ?auto_18744 ?auto_18738 ) ) ( not ( = ?auto_18744 ?auto_18740 ) ) ( not ( = ?auto_18744 ?auto_18735 ) ) ( not ( = ?auto_18717 ?auto_18723 ) ) ( not ( = ?auto_18717 ?auto_18728 ) ) ( not ( = ?auto_18718 ?auto_18723 ) ) ( not ( = ?auto_18718 ?auto_18728 ) ) ( not ( = ?auto_18719 ?auto_18723 ) ) ( not ( = ?auto_18719 ?auto_18728 ) ) ( not ( = ?auto_18720 ?auto_18723 ) ) ( not ( = ?auto_18720 ?auto_18728 ) ) ( not ( = ?auto_18721 ?auto_18723 ) ) ( not ( = ?auto_18721 ?auto_18728 ) ) ( not ( = ?auto_18722 ?auto_18723 ) ) ( not ( = ?auto_18722 ?auto_18728 ) ) ( not ( = ?auto_18725 ?auto_18723 ) ) ( not ( = ?auto_18725 ?auto_18728 ) ) ( not ( = ?auto_18723 ?auto_18744 ) ) ( not ( = ?auto_18723 ?auto_18737 ) ) ( not ( = ?auto_18723 ?auto_18733 ) ) ( not ( = ?auto_18723 ?auto_18741 ) ) ( not ( = ?auto_18723 ?auto_18738 ) ) ( not ( = ?auto_18723 ?auto_18740 ) ) ( not ( = ?auto_18723 ?auto_18735 ) ) ( not ( = ?auto_18727 ?auto_18739 ) ) ( not ( = ?auto_18727 ?auto_18736 ) ) ( not ( = ?auto_18727 ?auto_18734 ) ) ( not ( = ?auto_18726 ?auto_18742 ) ) ( not ( = ?auto_18726 ?auto_18732 ) ) ( not ( = ?auto_18726 ?auto_18743 ) ) ( not ( = ?auto_18728 ?auto_18744 ) ) ( not ( = ?auto_18728 ?auto_18737 ) ) ( not ( = ?auto_18728 ?auto_18733 ) ) ( not ( = ?auto_18728 ?auto_18741 ) ) ( not ( = ?auto_18728 ?auto_18738 ) ) ( not ( = ?auto_18728 ?auto_18740 ) ) ( not ( = ?auto_18728 ?auto_18735 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18717 ?auto_18718 ?auto_18719 ?auto_18720 ?auto_18721 ?auto_18722 ?auto_18725 ?auto_18724 )
      ( MAKE-1CRATE ?auto_18724 ?auto_18723 )
      ( MAKE-8CRATE-VERIFY ?auto_18717 ?auto_18718 ?auto_18719 ?auto_18720 ?auto_18721 ?auto_18722 ?auto_18725 ?auto_18724 ?auto_18723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18747 - SURFACE
      ?auto_18748 - SURFACE
    )
    :vars
    (
      ?auto_18749 - HOIST
      ?auto_18750 - PLACE
      ?auto_18752 - PLACE
      ?auto_18753 - HOIST
      ?auto_18754 - SURFACE
      ?auto_18751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18749 ?auto_18750 ) ( SURFACE-AT ?auto_18747 ?auto_18750 ) ( CLEAR ?auto_18747 ) ( IS-CRATE ?auto_18748 ) ( AVAILABLE ?auto_18749 ) ( not ( = ?auto_18752 ?auto_18750 ) ) ( HOIST-AT ?auto_18753 ?auto_18752 ) ( AVAILABLE ?auto_18753 ) ( SURFACE-AT ?auto_18748 ?auto_18752 ) ( ON ?auto_18748 ?auto_18754 ) ( CLEAR ?auto_18748 ) ( TRUCK-AT ?auto_18751 ?auto_18750 ) ( not ( = ?auto_18747 ?auto_18748 ) ) ( not ( = ?auto_18747 ?auto_18754 ) ) ( not ( = ?auto_18748 ?auto_18754 ) ) ( not ( = ?auto_18749 ?auto_18753 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18751 ?auto_18750 ?auto_18752 )
      ( !LIFT ?auto_18753 ?auto_18748 ?auto_18754 ?auto_18752 )
      ( !LOAD ?auto_18753 ?auto_18748 ?auto_18751 ?auto_18752 )
      ( !DRIVE ?auto_18751 ?auto_18752 ?auto_18750 )
      ( !UNLOAD ?auto_18749 ?auto_18748 ?auto_18751 ?auto_18750 )
      ( !DROP ?auto_18749 ?auto_18748 ?auto_18747 ?auto_18750 )
      ( MAKE-1CRATE-VERIFY ?auto_18747 ?auto_18748 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_18765 - SURFACE
      ?auto_18766 - SURFACE
      ?auto_18767 - SURFACE
      ?auto_18768 - SURFACE
      ?auto_18769 - SURFACE
      ?auto_18770 - SURFACE
      ?auto_18773 - SURFACE
      ?auto_18772 - SURFACE
      ?auto_18771 - SURFACE
      ?auto_18774 - SURFACE
    )
    :vars
    (
      ?auto_18775 - HOIST
      ?auto_18780 - PLACE
      ?auto_18778 - PLACE
      ?auto_18779 - HOIST
      ?auto_18777 - SURFACE
      ?auto_18782 - PLACE
      ?auto_18783 - HOIST
      ?auto_18785 - SURFACE
      ?auto_18793 - PLACE
      ?auto_18789 - HOIST
      ?auto_18792 - SURFACE
      ?auto_18795 - SURFACE
      ?auto_18781 - PLACE
      ?auto_18787 - HOIST
      ?auto_18786 - SURFACE
      ?auto_18790 - SURFACE
      ?auto_18794 - SURFACE
      ?auto_18788 - SURFACE
      ?auto_18784 - PLACE
      ?auto_18791 - HOIST
      ?auto_18796 - SURFACE
      ?auto_18776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18775 ?auto_18780 ) ( IS-CRATE ?auto_18774 ) ( not ( = ?auto_18778 ?auto_18780 ) ) ( HOIST-AT ?auto_18779 ?auto_18778 ) ( AVAILABLE ?auto_18779 ) ( SURFACE-AT ?auto_18774 ?auto_18778 ) ( ON ?auto_18774 ?auto_18777 ) ( CLEAR ?auto_18774 ) ( not ( = ?auto_18771 ?auto_18774 ) ) ( not ( = ?auto_18771 ?auto_18777 ) ) ( not ( = ?auto_18774 ?auto_18777 ) ) ( not ( = ?auto_18775 ?auto_18779 ) ) ( IS-CRATE ?auto_18771 ) ( not ( = ?auto_18782 ?auto_18780 ) ) ( HOIST-AT ?auto_18783 ?auto_18782 ) ( AVAILABLE ?auto_18783 ) ( SURFACE-AT ?auto_18771 ?auto_18782 ) ( ON ?auto_18771 ?auto_18785 ) ( CLEAR ?auto_18771 ) ( not ( = ?auto_18772 ?auto_18771 ) ) ( not ( = ?auto_18772 ?auto_18785 ) ) ( not ( = ?auto_18771 ?auto_18785 ) ) ( not ( = ?auto_18775 ?auto_18783 ) ) ( IS-CRATE ?auto_18772 ) ( not ( = ?auto_18793 ?auto_18780 ) ) ( HOIST-AT ?auto_18789 ?auto_18793 ) ( SURFACE-AT ?auto_18772 ?auto_18793 ) ( ON ?auto_18772 ?auto_18792 ) ( CLEAR ?auto_18772 ) ( not ( = ?auto_18773 ?auto_18772 ) ) ( not ( = ?auto_18773 ?auto_18792 ) ) ( not ( = ?auto_18772 ?auto_18792 ) ) ( not ( = ?auto_18775 ?auto_18789 ) ) ( IS-CRATE ?auto_18773 ) ( SURFACE-AT ?auto_18773 ?auto_18793 ) ( ON ?auto_18773 ?auto_18795 ) ( CLEAR ?auto_18773 ) ( not ( = ?auto_18770 ?auto_18773 ) ) ( not ( = ?auto_18770 ?auto_18795 ) ) ( not ( = ?auto_18773 ?auto_18795 ) ) ( IS-CRATE ?auto_18770 ) ( not ( = ?auto_18781 ?auto_18780 ) ) ( HOIST-AT ?auto_18787 ?auto_18781 ) ( SURFACE-AT ?auto_18770 ?auto_18781 ) ( ON ?auto_18770 ?auto_18786 ) ( CLEAR ?auto_18770 ) ( not ( = ?auto_18769 ?auto_18770 ) ) ( not ( = ?auto_18769 ?auto_18786 ) ) ( not ( = ?auto_18770 ?auto_18786 ) ) ( not ( = ?auto_18775 ?auto_18787 ) ) ( IS-CRATE ?auto_18769 ) ( SURFACE-AT ?auto_18769 ?auto_18781 ) ( ON ?auto_18769 ?auto_18790 ) ( CLEAR ?auto_18769 ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18790 ) ) ( not ( = ?auto_18769 ?auto_18790 ) ) ( IS-CRATE ?auto_18768 ) ( AVAILABLE ?auto_18787 ) ( SURFACE-AT ?auto_18768 ?auto_18781 ) ( ON ?auto_18768 ?auto_18794 ) ( CLEAR ?auto_18768 ) ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18767 ?auto_18794 ) ) ( not ( = ?auto_18768 ?auto_18794 ) ) ( IS-CRATE ?auto_18767 ) ( AVAILABLE ?auto_18789 ) ( SURFACE-AT ?auto_18767 ?auto_18793 ) ( ON ?auto_18767 ?auto_18788 ) ( CLEAR ?auto_18767 ) ( not ( = ?auto_18766 ?auto_18767 ) ) ( not ( = ?auto_18766 ?auto_18788 ) ) ( not ( = ?auto_18767 ?auto_18788 ) ) ( SURFACE-AT ?auto_18765 ?auto_18780 ) ( CLEAR ?auto_18765 ) ( IS-CRATE ?auto_18766 ) ( AVAILABLE ?auto_18775 ) ( not ( = ?auto_18784 ?auto_18780 ) ) ( HOIST-AT ?auto_18791 ?auto_18784 ) ( AVAILABLE ?auto_18791 ) ( SURFACE-AT ?auto_18766 ?auto_18784 ) ( ON ?auto_18766 ?auto_18796 ) ( CLEAR ?auto_18766 ) ( TRUCK-AT ?auto_18776 ?auto_18780 ) ( not ( = ?auto_18765 ?auto_18766 ) ) ( not ( = ?auto_18765 ?auto_18796 ) ) ( not ( = ?auto_18766 ?auto_18796 ) ) ( not ( = ?auto_18775 ?auto_18791 ) ) ( not ( = ?auto_18765 ?auto_18767 ) ) ( not ( = ?auto_18765 ?auto_18788 ) ) ( not ( = ?auto_18767 ?auto_18796 ) ) ( not ( = ?auto_18793 ?auto_18784 ) ) ( not ( = ?auto_18789 ?auto_18791 ) ) ( not ( = ?auto_18788 ?auto_18796 ) ) ( not ( = ?auto_18765 ?auto_18768 ) ) ( not ( = ?auto_18765 ?auto_18794 ) ) ( not ( = ?auto_18766 ?auto_18768 ) ) ( not ( = ?auto_18766 ?auto_18794 ) ) ( not ( = ?auto_18768 ?auto_18788 ) ) ( not ( = ?auto_18768 ?auto_18796 ) ) ( not ( = ?auto_18781 ?auto_18793 ) ) ( not ( = ?auto_18781 ?auto_18784 ) ) ( not ( = ?auto_18787 ?auto_18789 ) ) ( not ( = ?auto_18787 ?auto_18791 ) ) ( not ( = ?auto_18794 ?auto_18788 ) ) ( not ( = ?auto_18794 ?auto_18796 ) ) ( not ( = ?auto_18765 ?auto_18769 ) ) ( not ( = ?auto_18765 ?auto_18790 ) ) ( not ( = ?auto_18766 ?auto_18769 ) ) ( not ( = ?auto_18766 ?auto_18790 ) ) ( not ( = ?auto_18767 ?auto_18769 ) ) ( not ( = ?auto_18767 ?auto_18790 ) ) ( not ( = ?auto_18769 ?auto_18794 ) ) ( not ( = ?auto_18769 ?auto_18788 ) ) ( not ( = ?auto_18769 ?auto_18796 ) ) ( not ( = ?auto_18790 ?auto_18794 ) ) ( not ( = ?auto_18790 ?auto_18788 ) ) ( not ( = ?auto_18790 ?auto_18796 ) ) ( not ( = ?auto_18765 ?auto_18770 ) ) ( not ( = ?auto_18765 ?auto_18786 ) ) ( not ( = ?auto_18766 ?auto_18770 ) ) ( not ( = ?auto_18766 ?auto_18786 ) ) ( not ( = ?auto_18767 ?auto_18770 ) ) ( not ( = ?auto_18767 ?auto_18786 ) ) ( not ( = ?auto_18768 ?auto_18770 ) ) ( not ( = ?auto_18768 ?auto_18786 ) ) ( not ( = ?auto_18770 ?auto_18790 ) ) ( not ( = ?auto_18770 ?auto_18794 ) ) ( not ( = ?auto_18770 ?auto_18788 ) ) ( not ( = ?auto_18770 ?auto_18796 ) ) ( not ( = ?auto_18786 ?auto_18790 ) ) ( not ( = ?auto_18786 ?auto_18794 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18796 ) ) ( not ( = ?auto_18765 ?auto_18773 ) ) ( not ( = ?auto_18765 ?auto_18795 ) ) ( not ( = ?auto_18766 ?auto_18773 ) ) ( not ( = ?auto_18766 ?auto_18795 ) ) ( not ( = ?auto_18767 ?auto_18773 ) ) ( not ( = ?auto_18767 ?auto_18795 ) ) ( not ( = ?auto_18768 ?auto_18773 ) ) ( not ( = ?auto_18768 ?auto_18795 ) ) ( not ( = ?auto_18769 ?auto_18773 ) ) ( not ( = ?auto_18769 ?auto_18795 ) ) ( not ( = ?auto_18773 ?auto_18786 ) ) ( not ( = ?auto_18773 ?auto_18790 ) ) ( not ( = ?auto_18773 ?auto_18794 ) ) ( not ( = ?auto_18773 ?auto_18788 ) ) ( not ( = ?auto_18773 ?auto_18796 ) ) ( not ( = ?auto_18795 ?auto_18786 ) ) ( not ( = ?auto_18795 ?auto_18790 ) ) ( not ( = ?auto_18795 ?auto_18794 ) ) ( not ( = ?auto_18795 ?auto_18788 ) ) ( not ( = ?auto_18795 ?auto_18796 ) ) ( not ( = ?auto_18765 ?auto_18772 ) ) ( not ( = ?auto_18765 ?auto_18792 ) ) ( not ( = ?auto_18766 ?auto_18772 ) ) ( not ( = ?auto_18766 ?auto_18792 ) ) ( not ( = ?auto_18767 ?auto_18772 ) ) ( not ( = ?auto_18767 ?auto_18792 ) ) ( not ( = ?auto_18768 ?auto_18772 ) ) ( not ( = ?auto_18768 ?auto_18792 ) ) ( not ( = ?auto_18769 ?auto_18772 ) ) ( not ( = ?auto_18769 ?auto_18792 ) ) ( not ( = ?auto_18770 ?auto_18772 ) ) ( not ( = ?auto_18770 ?auto_18792 ) ) ( not ( = ?auto_18772 ?auto_18795 ) ) ( not ( = ?auto_18772 ?auto_18786 ) ) ( not ( = ?auto_18772 ?auto_18790 ) ) ( not ( = ?auto_18772 ?auto_18794 ) ) ( not ( = ?auto_18772 ?auto_18788 ) ) ( not ( = ?auto_18772 ?auto_18796 ) ) ( not ( = ?auto_18792 ?auto_18795 ) ) ( not ( = ?auto_18792 ?auto_18786 ) ) ( not ( = ?auto_18792 ?auto_18790 ) ) ( not ( = ?auto_18792 ?auto_18794 ) ) ( not ( = ?auto_18792 ?auto_18788 ) ) ( not ( = ?auto_18792 ?auto_18796 ) ) ( not ( = ?auto_18765 ?auto_18771 ) ) ( not ( = ?auto_18765 ?auto_18785 ) ) ( not ( = ?auto_18766 ?auto_18771 ) ) ( not ( = ?auto_18766 ?auto_18785 ) ) ( not ( = ?auto_18767 ?auto_18771 ) ) ( not ( = ?auto_18767 ?auto_18785 ) ) ( not ( = ?auto_18768 ?auto_18771 ) ) ( not ( = ?auto_18768 ?auto_18785 ) ) ( not ( = ?auto_18769 ?auto_18771 ) ) ( not ( = ?auto_18769 ?auto_18785 ) ) ( not ( = ?auto_18770 ?auto_18771 ) ) ( not ( = ?auto_18770 ?auto_18785 ) ) ( not ( = ?auto_18773 ?auto_18771 ) ) ( not ( = ?auto_18773 ?auto_18785 ) ) ( not ( = ?auto_18771 ?auto_18792 ) ) ( not ( = ?auto_18771 ?auto_18795 ) ) ( not ( = ?auto_18771 ?auto_18786 ) ) ( not ( = ?auto_18771 ?auto_18790 ) ) ( not ( = ?auto_18771 ?auto_18794 ) ) ( not ( = ?auto_18771 ?auto_18788 ) ) ( not ( = ?auto_18771 ?auto_18796 ) ) ( not ( = ?auto_18782 ?auto_18793 ) ) ( not ( = ?auto_18782 ?auto_18781 ) ) ( not ( = ?auto_18782 ?auto_18784 ) ) ( not ( = ?auto_18783 ?auto_18789 ) ) ( not ( = ?auto_18783 ?auto_18787 ) ) ( not ( = ?auto_18783 ?auto_18791 ) ) ( not ( = ?auto_18785 ?auto_18792 ) ) ( not ( = ?auto_18785 ?auto_18795 ) ) ( not ( = ?auto_18785 ?auto_18786 ) ) ( not ( = ?auto_18785 ?auto_18790 ) ) ( not ( = ?auto_18785 ?auto_18794 ) ) ( not ( = ?auto_18785 ?auto_18788 ) ) ( not ( = ?auto_18785 ?auto_18796 ) ) ( not ( = ?auto_18765 ?auto_18774 ) ) ( not ( = ?auto_18765 ?auto_18777 ) ) ( not ( = ?auto_18766 ?auto_18774 ) ) ( not ( = ?auto_18766 ?auto_18777 ) ) ( not ( = ?auto_18767 ?auto_18774 ) ) ( not ( = ?auto_18767 ?auto_18777 ) ) ( not ( = ?auto_18768 ?auto_18774 ) ) ( not ( = ?auto_18768 ?auto_18777 ) ) ( not ( = ?auto_18769 ?auto_18774 ) ) ( not ( = ?auto_18769 ?auto_18777 ) ) ( not ( = ?auto_18770 ?auto_18774 ) ) ( not ( = ?auto_18770 ?auto_18777 ) ) ( not ( = ?auto_18773 ?auto_18774 ) ) ( not ( = ?auto_18773 ?auto_18777 ) ) ( not ( = ?auto_18772 ?auto_18774 ) ) ( not ( = ?auto_18772 ?auto_18777 ) ) ( not ( = ?auto_18774 ?auto_18785 ) ) ( not ( = ?auto_18774 ?auto_18792 ) ) ( not ( = ?auto_18774 ?auto_18795 ) ) ( not ( = ?auto_18774 ?auto_18786 ) ) ( not ( = ?auto_18774 ?auto_18790 ) ) ( not ( = ?auto_18774 ?auto_18794 ) ) ( not ( = ?auto_18774 ?auto_18788 ) ) ( not ( = ?auto_18774 ?auto_18796 ) ) ( not ( = ?auto_18778 ?auto_18782 ) ) ( not ( = ?auto_18778 ?auto_18793 ) ) ( not ( = ?auto_18778 ?auto_18781 ) ) ( not ( = ?auto_18778 ?auto_18784 ) ) ( not ( = ?auto_18779 ?auto_18783 ) ) ( not ( = ?auto_18779 ?auto_18789 ) ) ( not ( = ?auto_18779 ?auto_18787 ) ) ( not ( = ?auto_18779 ?auto_18791 ) ) ( not ( = ?auto_18777 ?auto_18785 ) ) ( not ( = ?auto_18777 ?auto_18792 ) ) ( not ( = ?auto_18777 ?auto_18795 ) ) ( not ( = ?auto_18777 ?auto_18786 ) ) ( not ( = ?auto_18777 ?auto_18790 ) ) ( not ( = ?auto_18777 ?auto_18794 ) ) ( not ( = ?auto_18777 ?auto_18788 ) ) ( not ( = ?auto_18777 ?auto_18796 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18765 ?auto_18766 ?auto_18767 ?auto_18768 ?auto_18769 ?auto_18770 ?auto_18773 ?auto_18772 ?auto_18771 )
      ( MAKE-1CRATE ?auto_18771 ?auto_18774 )
      ( MAKE-9CRATE-VERIFY ?auto_18765 ?auto_18766 ?auto_18767 ?auto_18768 ?auto_18769 ?auto_18770 ?auto_18773 ?auto_18772 ?auto_18771 ?auto_18774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18799 - SURFACE
      ?auto_18800 - SURFACE
    )
    :vars
    (
      ?auto_18801 - HOIST
      ?auto_18802 - PLACE
      ?auto_18804 - PLACE
      ?auto_18805 - HOIST
      ?auto_18806 - SURFACE
      ?auto_18803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18801 ?auto_18802 ) ( SURFACE-AT ?auto_18799 ?auto_18802 ) ( CLEAR ?auto_18799 ) ( IS-CRATE ?auto_18800 ) ( AVAILABLE ?auto_18801 ) ( not ( = ?auto_18804 ?auto_18802 ) ) ( HOIST-AT ?auto_18805 ?auto_18804 ) ( AVAILABLE ?auto_18805 ) ( SURFACE-AT ?auto_18800 ?auto_18804 ) ( ON ?auto_18800 ?auto_18806 ) ( CLEAR ?auto_18800 ) ( TRUCK-AT ?auto_18803 ?auto_18802 ) ( not ( = ?auto_18799 ?auto_18800 ) ) ( not ( = ?auto_18799 ?auto_18806 ) ) ( not ( = ?auto_18800 ?auto_18806 ) ) ( not ( = ?auto_18801 ?auto_18805 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18803 ?auto_18802 ?auto_18804 )
      ( !LIFT ?auto_18805 ?auto_18800 ?auto_18806 ?auto_18804 )
      ( !LOAD ?auto_18805 ?auto_18800 ?auto_18803 ?auto_18804 )
      ( !DRIVE ?auto_18803 ?auto_18804 ?auto_18802 )
      ( !UNLOAD ?auto_18801 ?auto_18800 ?auto_18803 ?auto_18802 )
      ( !DROP ?auto_18801 ?auto_18800 ?auto_18799 ?auto_18802 )
      ( MAKE-1CRATE-VERIFY ?auto_18799 ?auto_18800 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_18818 - SURFACE
      ?auto_18819 - SURFACE
      ?auto_18820 - SURFACE
      ?auto_18821 - SURFACE
      ?auto_18822 - SURFACE
      ?auto_18823 - SURFACE
      ?auto_18826 - SURFACE
      ?auto_18825 - SURFACE
      ?auto_18824 - SURFACE
      ?auto_18827 - SURFACE
      ?auto_18828 - SURFACE
    )
    :vars
    (
      ?auto_18834 - HOIST
      ?auto_18832 - PLACE
      ?auto_18831 - PLACE
      ?auto_18830 - HOIST
      ?auto_18833 - SURFACE
      ?auto_18837 - PLACE
      ?auto_18836 - HOIST
      ?auto_18853 - SURFACE
      ?auto_18848 - PLACE
      ?auto_18851 - HOIST
      ?auto_18846 - SURFACE
      ?auto_18841 - PLACE
      ?auto_18839 - HOIST
      ?auto_18850 - SURFACE
      ?auto_18835 - SURFACE
      ?auto_18847 - PLACE
      ?auto_18844 - HOIST
      ?auto_18845 - SURFACE
      ?auto_18840 - SURFACE
      ?auto_18842 - SURFACE
      ?auto_18849 - SURFACE
      ?auto_18852 - PLACE
      ?auto_18838 - HOIST
      ?auto_18843 - SURFACE
      ?auto_18829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18834 ?auto_18832 ) ( IS-CRATE ?auto_18828 ) ( not ( = ?auto_18831 ?auto_18832 ) ) ( HOIST-AT ?auto_18830 ?auto_18831 ) ( AVAILABLE ?auto_18830 ) ( SURFACE-AT ?auto_18828 ?auto_18831 ) ( ON ?auto_18828 ?auto_18833 ) ( CLEAR ?auto_18828 ) ( not ( = ?auto_18827 ?auto_18828 ) ) ( not ( = ?auto_18827 ?auto_18833 ) ) ( not ( = ?auto_18828 ?auto_18833 ) ) ( not ( = ?auto_18834 ?auto_18830 ) ) ( IS-CRATE ?auto_18827 ) ( not ( = ?auto_18837 ?auto_18832 ) ) ( HOIST-AT ?auto_18836 ?auto_18837 ) ( AVAILABLE ?auto_18836 ) ( SURFACE-AT ?auto_18827 ?auto_18837 ) ( ON ?auto_18827 ?auto_18853 ) ( CLEAR ?auto_18827 ) ( not ( = ?auto_18824 ?auto_18827 ) ) ( not ( = ?auto_18824 ?auto_18853 ) ) ( not ( = ?auto_18827 ?auto_18853 ) ) ( not ( = ?auto_18834 ?auto_18836 ) ) ( IS-CRATE ?auto_18824 ) ( not ( = ?auto_18848 ?auto_18832 ) ) ( HOIST-AT ?auto_18851 ?auto_18848 ) ( AVAILABLE ?auto_18851 ) ( SURFACE-AT ?auto_18824 ?auto_18848 ) ( ON ?auto_18824 ?auto_18846 ) ( CLEAR ?auto_18824 ) ( not ( = ?auto_18825 ?auto_18824 ) ) ( not ( = ?auto_18825 ?auto_18846 ) ) ( not ( = ?auto_18824 ?auto_18846 ) ) ( not ( = ?auto_18834 ?auto_18851 ) ) ( IS-CRATE ?auto_18825 ) ( not ( = ?auto_18841 ?auto_18832 ) ) ( HOIST-AT ?auto_18839 ?auto_18841 ) ( SURFACE-AT ?auto_18825 ?auto_18841 ) ( ON ?auto_18825 ?auto_18850 ) ( CLEAR ?auto_18825 ) ( not ( = ?auto_18826 ?auto_18825 ) ) ( not ( = ?auto_18826 ?auto_18850 ) ) ( not ( = ?auto_18825 ?auto_18850 ) ) ( not ( = ?auto_18834 ?auto_18839 ) ) ( IS-CRATE ?auto_18826 ) ( SURFACE-AT ?auto_18826 ?auto_18841 ) ( ON ?auto_18826 ?auto_18835 ) ( CLEAR ?auto_18826 ) ( not ( = ?auto_18823 ?auto_18826 ) ) ( not ( = ?auto_18823 ?auto_18835 ) ) ( not ( = ?auto_18826 ?auto_18835 ) ) ( IS-CRATE ?auto_18823 ) ( not ( = ?auto_18847 ?auto_18832 ) ) ( HOIST-AT ?auto_18844 ?auto_18847 ) ( SURFACE-AT ?auto_18823 ?auto_18847 ) ( ON ?auto_18823 ?auto_18845 ) ( CLEAR ?auto_18823 ) ( not ( = ?auto_18822 ?auto_18823 ) ) ( not ( = ?auto_18822 ?auto_18845 ) ) ( not ( = ?auto_18823 ?auto_18845 ) ) ( not ( = ?auto_18834 ?auto_18844 ) ) ( IS-CRATE ?auto_18822 ) ( SURFACE-AT ?auto_18822 ?auto_18847 ) ( ON ?auto_18822 ?auto_18840 ) ( CLEAR ?auto_18822 ) ( not ( = ?auto_18821 ?auto_18822 ) ) ( not ( = ?auto_18821 ?auto_18840 ) ) ( not ( = ?auto_18822 ?auto_18840 ) ) ( IS-CRATE ?auto_18821 ) ( AVAILABLE ?auto_18844 ) ( SURFACE-AT ?auto_18821 ?auto_18847 ) ( ON ?auto_18821 ?auto_18842 ) ( CLEAR ?auto_18821 ) ( not ( = ?auto_18820 ?auto_18821 ) ) ( not ( = ?auto_18820 ?auto_18842 ) ) ( not ( = ?auto_18821 ?auto_18842 ) ) ( IS-CRATE ?auto_18820 ) ( AVAILABLE ?auto_18839 ) ( SURFACE-AT ?auto_18820 ?auto_18841 ) ( ON ?auto_18820 ?auto_18849 ) ( CLEAR ?auto_18820 ) ( not ( = ?auto_18819 ?auto_18820 ) ) ( not ( = ?auto_18819 ?auto_18849 ) ) ( not ( = ?auto_18820 ?auto_18849 ) ) ( SURFACE-AT ?auto_18818 ?auto_18832 ) ( CLEAR ?auto_18818 ) ( IS-CRATE ?auto_18819 ) ( AVAILABLE ?auto_18834 ) ( not ( = ?auto_18852 ?auto_18832 ) ) ( HOIST-AT ?auto_18838 ?auto_18852 ) ( AVAILABLE ?auto_18838 ) ( SURFACE-AT ?auto_18819 ?auto_18852 ) ( ON ?auto_18819 ?auto_18843 ) ( CLEAR ?auto_18819 ) ( TRUCK-AT ?auto_18829 ?auto_18832 ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( not ( = ?auto_18818 ?auto_18843 ) ) ( not ( = ?auto_18819 ?auto_18843 ) ) ( not ( = ?auto_18834 ?auto_18838 ) ) ( not ( = ?auto_18818 ?auto_18820 ) ) ( not ( = ?auto_18818 ?auto_18849 ) ) ( not ( = ?auto_18820 ?auto_18843 ) ) ( not ( = ?auto_18841 ?auto_18852 ) ) ( not ( = ?auto_18839 ?auto_18838 ) ) ( not ( = ?auto_18849 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18821 ) ) ( not ( = ?auto_18818 ?auto_18842 ) ) ( not ( = ?auto_18819 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18842 ) ) ( not ( = ?auto_18821 ?auto_18849 ) ) ( not ( = ?auto_18821 ?auto_18843 ) ) ( not ( = ?auto_18847 ?auto_18841 ) ) ( not ( = ?auto_18847 ?auto_18852 ) ) ( not ( = ?auto_18844 ?auto_18839 ) ) ( not ( = ?auto_18844 ?auto_18838 ) ) ( not ( = ?auto_18842 ?auto_18849 ) ) ( not ( = ?auto_18842 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18822 ) ) ( not ( = ?auto_18818 ?auto_18840 ) ) ( not ( = ?auto_18819 ?auto_18822 ) ) ( not ( = ?auto_18819 ?auto_18840 ) ) ( not ( = ?auto_18820 ?auto_18822 ) ) ( not ( = ?auto_18820 ?auto_18840 ) ) ( not ( = ?auto_18822 ?auto_18842 ) ) ( not ( = ?auto_18822 ?auto_18849 ) ) ( not ( = ?auto_18822 ?auto_18843 ) ) ( not ( = ?auto_18840 ?auto_18842 ) ) ( not ( = ?auto_18840 ?auto_18849 ) ) ( not ( = ?auto_18840 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18823 ) ) ( not ( = ?auto_18818 ?auto_18845 ) ) ( not ( = ?auto_18819 ?auto_18823 ) ) ( not ( = ?auto_18819 ?auto_18845 ) ) ( not ( = ?auto_18820 ?auto_18823 ) ) ( not ( = ?auto_18820 ?auto_18845 ) ) ( not ( = ?auto_18821 ?auto_18823 ) ) ( not ( = ?auto_18821 ?auto_18845 ) ) ( not ( = ?auto_18823 ?auto_18840 ) ) ( not ( = ?auto_18823 ?auto_18842 ) ) ( not ( = ?auto_18823 ?auto_18849 ) ) ( not ( = ?auto_18823 ?auto_18843 ) ) ( not ( = ?auto_18845 ?auto_18840 ) ) ( not ( = ?auto_18845 ?auto_18842 ) ) ( not ( = ?auto_18845 ?auto_18849 ) ) ( not ( = ?auto_18845 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18826 ) ) ( not ( = ?auto_18818 ?auto_18835 ) ) ( not ( = ?auto_18819 ?auto_18826 ) ) ( not ( = ?auto_18819 ?auto_18835 ) ) ( not ( = ?auto_18820 ?auto_18826 ) ) ( not ( = ?auto_18820 ?auto_18835 ) ) ( not ( = ?auto_18821 ?auto_18826 ) ) ( not ( = ?auto_18821 ?auto_18835 ) ) ( not ( = ?auto_18822 ?auto_18826 ) ) ( not ( = ?auto_18822 ?auto_18835 ) ) ( not ( = ?auto_18826 ?auto_18845 ) ) ( not ( = ?auto_18826 ?auto_18840 ) ) ( not ( = ?auto_18826 ?auto_18842 ) ) ( not ( = ?auto_18826 ?auto_18849 ) ) ( not ( = ?auto_18826 ?auto_18843 ) ) ( not ( = ?auto_18835 ?auto_18845 ) ) ( not ( = ?auto_18835 ?auto_18840 ) ) ( not ( = ?auto_18835 ?auto_18842 ) ) ( not ( = ?auto_18835 ?auto_18849 ) ) ( not ( = ?auto_18835 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18825 ) ) ( not ( = ?auto_18818 ?auto_18850 ) ) ( not ( = ?auto_18819 ?auto_18825 ) ) ( not ( = ?auto_18819 ?auto_18850 ) ) ( not ( = ?auto_18820 ?auto_18825 ) ) ( not ( = ?auto_18820 ?auto_18850 ) ) ( not ( = ?auto_18821 ?auto_18825 ) ) ( not ( = ?auto_18821 ?auto_18850 ) ) ( not ( = ?auto_18822 ?auto_18825 ) ) ( not ( = ?auto_18822 ?auto_18850 ) ) ( not ( = ?auto_18823 ?auto_18825 ) ) ( not ( = ?auto_18823 ?auto_18850 ) ) ( not ( = ?auto_18825 ?auto_18835 ) ) ( not ( = ?auto_18825 ?auto_18845 ) ) ( not ( = ?auto_18825 ?auto_18840 ) ) ( not ( = ?auto_18825 ?auto_18842 ) ) ( not ( = ?auto_18825 ?auto_18849 ) ) ( not ( = ?auto_18825 ?auto_18843 ) ) ( not ( = ?auto_18850 ?auto_18835 ) ) ( not ( = ?auto_18850 ?auto_18845 ) ) ( not ( = ?auto_18850 ?auto_18840 ) ) ( not ( = ?auto_18850 ?auto_18842 ) ) ( not ( = ?auto_18850 ?auto_18849 ) ) ( not ( = ?auto_18850 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18824 ) ) ( not ( = ?auto_18818 ?auto_18846 ) ) ( not ( = ?auto_18819 ?auto_18824 ) ) ( not ( = ?auto_18819 ?auto_18846 ) ) ( not ( = ?auto_18820 ?auto_18824 ) ) ( not ( = ?auto_18820 ?auto_18846 ) ) ( not ( = ?auto_18821 ?auto_18824 ) ) ( not ( = ?auto_18821 ?auto_18846 ) ) ( not ( = ?auto_18822 ?auto_18824 ) ) ( not ( = ?auto_18822 ?auto_18846 ) ) ( not ( = ?auto_18823 ?auto_18824 ) ) ( not ( = ?auto_18823 ?auto_18846 ) ) ( not ( = ?auto_18826 ?auto_18824 ) ) ( not ( = ?auto_18826 ?auto_18846 ) ) ( not ( = ?auto_18824 ?auto_18850 ) ) ( not ( = ?auto_18824 ?auto_18835 ) ) ( not ( = ?auto_18824 ?auto_18845 ) ) ( not ( = ?auto_18824 ?auto_18840 ) ) ( not ( = ?auto_18824 ?auto_18842 ) ) ( not ( = ?auto_18824 ?auto_18849 ) ) ( not ( = ?auto_18824 ?auto_18843 ) ) ( not ( = ?auto_18848 ?auto_18841 ) ) ( not ( = ?auto_18848 ?auto_18847 ) ) ( not ( = ?auto_18848 ?auto_18852 ) ) ( not ( = ?auto_18851 ?auto_18839 ) ) ( not ( = ?auto_18851 ?auto_18844 ) ) ( not ( = ?auto_18851 ?auto_18838 ) ) ( not ( = ?auto_18846 ?auto_18850 ) ) ( not ( = ?auto_18846 ?auto_18835 ) ) ( not ( = ?auto_18846 ?auto_18845 ) ) ( not ( = ?auto_18846 ?auto_18840 ) ) ( not ( = ?auto_18846 ?auto_18842 ) ) ( not ( = ?auto_18846 ?auto_18849 ) ) ( not ( = ?auto_18846 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18827 ) ) ( not ( = ?auto_18818 ?auto_18853 ) ) ( not ( = ?auto_18819 ?auto_18827 ) ) ( not ( = ?auto_18819 ?auto_18853 ) ) ( not ( = ?auto_18820 ?auto_18827 ) ) ( not ( = ?auto_18820 ?auto_18853 ) ) ( not ( = ?auto_18821 ?auto_18827 ) ) ( not ( = ?auto_18821 ?auto_18853 ) ) ( not ( = ?auto_18822 ?auto_18827 ) ) ( not ( = ?auto_18822 ?auto_18853 ) ) ( not ( = ?auto_18823 ?auto_18827 ) ) ( not ( = ?auto_18823 ?auto_18853 ) ) ( not ( = ?auto_18826 ?auto_18827 ) ) ( not ( = ?auto_18826 ?auto_18853 ) ) ( not ( = ?auto_18825 ?auto_18827 ) ) ( not ( = ?auto_18825 ?auto_18853 ) ) ( not ( = ?auto_18827 ?auto_18846 ) ) ( not ( = ?auto_18827 ?auto_18850 ) ) ( not ( = ?auto_18827 ?auto_18835 ) ) ( not ( = ?auto_18827 ?auto_18845 ) ) ( not ( = ?auto_18827 ?auto_18840 ) ) ( not ( = ?auto_18827 ?auto_18842 ) ) ( not ( = ?auto_18827 ?auto_18849 ) ) ( not ( = ?auto_18827 ?auto_18843 ) ) ( not ( = ?auto_18837 ?auto_18848 ) ) ( not ( = ?auto_18837 ?auto_18841 ) ) ( not ( = ?auto_18837 ?auto_18847 ) ) ( not ( = ?auto_18837 ?auto_18852 ) ) ( not ( = ?auto_18836 ?auto_18851 ) ) ( not ( = ?auto_18836 ?auto_18839 ) ) ( not ( = ?auto_18836 ?auto_18844 ) ) ( not ( = ?auto_18836 ?auto_18838 ) ) ( not ( = ?auto_18853 ?auto_18846 ) ) ( not ( = ?auto_18853 ?auto_18850 ) ) ( not ( = ?auto_18853 ?auto_18835 ) ) ( not ( = ?auto_18853 ?auto_18845 ) ) ( not ( = ?auto_18853 ?auto_18840 ) ) ( not ( = ?auto_18853 ?auto_18842 ) ) ( not ( = ?auto_18853 ?auto_18849 ) ) ( not ( = ?auto_18853 ?auto_18843 ) ) ( not ( = ?auto_18818 ?auto_18828 ) ) ( not ( = ?auto_18818 ?auto_18833 ) ) ( not ( = ?auto_18819 ?auto_18828 ) ) ( not ( = ?auto_18819 ?auto_18833 ) ) ( not ( = ?auto_18820 ?auto_18828 ) ) ( not ( = ?auto_18820 ?auto_18833 ) ) ( not ( = ?auto_18821 ?auto_18828 ) ) ( not ( = ?auto_18821 ?auto_18833 ) ) ( not ( = ?auto_18822 ?auto_18828 ) ) ( not ( = ?auto_18822 ?auto_18833 ) ) ( not ( = ?auto_18823 ?auto_18828 ) ) ( not ( = ?auto_18823 ?auto_18833 ) ) ( not ( = ?auto_18826 ?auto_18828 ) ) ( not ( = ?auto_18826 ?auto_18833 ) ) ( not ( = ?auto_18825 ?auto_18828 ) ) ( not ( = ?auto_18825 ?auto_18833 ) ) ( not ( = ?auto_18824 ?auto_18828 ) ) ( not ( = ?auto_18824 ?auto_18833 ) ) ( not ( = ?auto_18828 ?auto_18853 ) ) ( not ( = ?auto_18828 ?auto_18846 ) ) ( not ( = ?auto_18828 ?auto_18850 ) ) ( not ( = ?auto_18828 ?auto_18835 ) ) ( not ( = ?auto_18828 ?auto_18845 ) ) ( not ( = ?auto_18828 ?auto_18840 ) ) ( not ( = ?auto_18828 ?auto_18842 ) ) ( not ( = ?auto_18828 ?auto_18849 ) ) ( not ( = ?auto_18828 ?auto_18843 ) ) ( not ( = ?auto_18831 ?auto_18837 ) ) ( not ( = ?auto_18831 ?auto_18848 ) ) ( not ( = ?auto_18831 ?auto_18841 ) ) ( not ( = ?auto_18831 ?auto_18847 ) ) ( not ( = ?auto_18831 ?auto_18852 ) ) ( not ( = ?auto_18830 ?auto_18836 ) ) ( not ( = ?auto_18830 ?auto_18851 ) ) ( not ( = ?auto_18830 ?auto_18839 ) ) ( not ( = ?auto_18830 ?auto_18844 ) ) ( not ( = ?auto_18830 ?auto_18838 ) ) ( not ( = ?auto_18833 ?auto_18853 ) ) ( not ( = ?auto_18833 ?auto_18846 ) ) ( not ( = ?auto_18833 ?auto_18850 ) ) ( not ( = ?auto_18833 ?auto_18835 ) ) ( not ( = ?auto_18833 ?auto_18845 ) ) ( not ( = ?auto_18833 ?auto_18840 ) ) ( not ( = ?auto_18833 ?auto_18842 ) ) ( not ( = ?auto_18833 ?auto_18849 ) ) ( not ( = ?auto_18833 ?auto_18843 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18818 ?auto_18819 ?auto_18820 ?auto_18821 ?auto_18822 ?auto_18823 ?auto_18826 ?auto_18825 ?auto_18824 ?auto_18827 )
      ( MAKE-1CRATE ?auto_18827 ?auto_18828 )
      ( MAKE-10CRATE-VERIFY ?auto_18818 ?auto_18819 ?auto_18820 ?auto_18821 ?auto_18822 ?auto_18823 ?auto_18826 ?auto_18825 ?auto_18824 ?auto_18827 ?auto_18828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18856 - SURFACE
      ?auto_18857 - SURFACE
    )
    :vars
    (
      ?auto_18858 - HOIST
      ?auto_18859 - PLACE
      ?auto_18861 - PLACE
      ?auto_18862 - HOIST
      ?auto_18863 - SURFACE
      ?auto_18860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18858 ?auto_18859 ) ( SURFACE-AT ?auto_18856 ?auto_18859 ) ( CLEAR ?auto_18856 ) ( IS-CRATE ?auto_18857 ) ( AVAILABLE ?auto_18858 ) ( not ( = ?auto_18861 ?auto_18859 ) ) ( HOIST-AT ?auto_18862 ?auto_18861 ) ( AVAILABLE ?auto_18862 ) ( SURFACE-AT ?auto_18857 ?auto_18861 ) ( ON ?auto_18857 ?auto_18863 ) ( CLEAR ?auto_18857 ) ( TRUCK-AT ?auto_18860 ?auto_18859 ) ( not ( = ?auto_18856 ?auto_18857 ) ) ( not ( = ?auto_18856 ?auto_18863 ) ) ( not ( = ?auto_18857 ?auto_18863 ) ) ( not ( = ?auto_18858 ?auto_18862 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18860 ?auto_18859 ?auto_18861 )
      ( !LIFT ?auto_18862 ?auto_18857 ?auto_18863 ?auto_18861 )
      ( !LOAD ?auto_18862 ?auto_18857 ?auto_18860 ?auto_18861 )
      ( !DRIVE ?auto_18860 ?auto_18861 ?auto_18859 )
      ( !UNLOAD ?auto_18858 ?auto_18857 ?auto_18860 ?auto_18859 )
      ( !DROP ?auto_18858 ?auto_18857 ?auto_18856 ?auto_18859 )
      ( MAKE-1CRATE-VERIFY ?auto_18856 ?auto_18857 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_18876 - SURFACE
      ?auto_18877 - SURFACE
      ?auto_18878 - SURFACE
      ?auto_18879 - SURFACE
      ?auto_18880 - SURFACE
      ?auto_18881 - SURFACE
      ?auto_18884 - SURFACE
      ?auto_18883 - SURFACE
      ?auto_18882 - SURFACE
      ?auto_18885 - SURFACE
      ?auto_18887 - SURFACE
      ?auto_18886 - SURFACE
    )
    :vars
    (
      ?auto_18893 - HOIST
      ?auto_18888 - PLACE
      ?auto_18890 - PLACE
      ?auto_18889 - HOIST
      ?auto_18891 - SURFACE
      ?auto_18913 - PLACE
      ?auto_18912 - HOIST
      ?auto_18907 - SURFACE
      ?auto_18898 - SURFACE
      ?auto_18911 - PLACE
      ?auto_18900 - HOIST
      ?auto_18901 - SURFACE
      ?auto_18906 - PLACE
      ?auto_18903 - HOIST
      ?auto_18909 - SURFACE
      ?auto_18897 - SURFACE
      ?auto_18908 - PLACE
      ?auto_18904 - HOIST
      ?auto_18894 - SURFACE
      ?auto_18896 - SURFACE
      ?auto_18910 - SURFACE
      ?auto_18905 - SURFACE
      ?auto_18902 - PLACE
      ?auto_18899 - HOIST
      ?auto_18895 - SURFACE
      ?auto_18892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18893 ?auto_18888 ) ( IS-CRATE ?auto_18886 ) ( not ( = ?auto_18890 ?auto_18888 ) ) ( HOIST-AT ?auto_18889 ?auto_18890 ) ( SURFACE-AT ?auto_18886 ?auto_18890 ) ( ON ?auto_18886 ?auto_18891 ) ( CLEAR ?auto_18886 ) ( not ( = ?auto_18887 ?auto_18886 ) ) ( not ( = ?auto_18887 ?auto_18891 ) ) ( not ( = ?auto_18886 ?auto_18891 ) ) ( not ( = ?auto_18893 ?auto_18889 ) ) ( IS-CRATE ?auto_18887 ) ( not ( = ?auto_18913 ?auto_18888 ) ) ( HOIST-AT ?auto_18912 ?auto_18913 ) ( AVAILABLE ?auto_18912 ) ( SURFACE-AT ?auto_18887 ?auto_18913 ) ( ON ?auto_18887 ?auto_18907 ) ( CLEAR ?auto_18887 ) ( not ( = ?auto_18885 ?auto_18887 ) ) ( not ( = ?auto_18885 ?auto_18907 ) ) ( not ( = ?auto_18887 ?auto_18907 ) ) ( not ( = ?auto_18893 ?auto_18912 ) ) ( IS-CRATE ?auto_18885 ) ( AVAILABLE ?auto_18889 ) ( SURFACE-AT ?auto_18885 ?auto_18890 ) ( ON ?auto_18885 ?auto_18898 ) ( CLEAR ?auto_18885 ) ( not ( = ?auto_18882 ?auto_18885 ) ) ( not ( = ?auto_18882 ?auto_18898 ) ) ( not ( = ?auto_18885 ?auto_18898 ) ) ( IS-CRATE ?auto_18882 ) ( not ( = ?auto_18911 ?auto_18888 ) ) ( HOIST-AT ?auto_18900 ?auto_18911 ) ( AVAILABLE ?auto_18900 ) ( SURFACE-AT ?auto_18882 ?auto_18911 ) ( ON ?auto_18882 ?auto_18901 ) ( CLEAR ?auto_18882 ) ( not ( = ?auto_18883 ?auto_18882 ) ) ( not ( = ?auto_18883 ?auto_18901 ) ) ( not ( = ?auto_18882 ?auto_18901 ) ) ( not ( = ?auto_18893 ?auto_18900 ) ) ( IS-CRATE ?auto_18883 ) ( not ( = ?auto_18906 ?auto_18888 ) ) ( HOIST-AT ?auto_18903 ?auto_18906 ) ( SURFACE-AT ?auto_18883 ?auto_18906 ) ( ON ?auto_18883 ?auto_18909 ) ( CLEAR ?auto_18883 ) ( not ( = ?auto_18884 ?auto_18883 ) ) ( not ( = ?auto_18884 ?auto_18909 ) ) ( not ( = ?auto_18883 ?auto_18909 ) ) ( not ( = ?auto_18893 ?auto_18903 ) ) ( IS-CRATE ?auto_18884 ) ( SURFACE-AT ?auto_18884 ?auto_18906 ) ( ON ?auto_18884 ?auto_18897 ) ( CLEAR ?auto_18884 ) ( not ( = ?auto_18881 ?auto_18884 ) ) ( not ( = ?auto_18881 ?auto_18897 ) ) ( not ( = ?auto_18884 ?auto_18897 ) ) ( IS-CRATE ?auto_18881 ) ( not ( = ?auto_18908 ?auto_18888 ) ) ( HOIST-AT ?auto_18904 ?auto_18908 ) ( SURFACE-AT ?auto_18881 ?auto_18908 ) ( ON ?auto_18881 ?auto_18894 ) ( CLEAR ?auto_18881 ) ( not ( = ?auto_18880 ?auto_18881 ) ) ( not ( = ?auto_18880 ?auto_18894 ) ) ( not ( = ?auto_18881 ?auto_18894 ) ) ( not ( = ?auto_18893 ?auto_18904 ) ) ( IS-CRATE ?auto_18880 ) ( SURFACE-AT ?auto_18880 ?auto_18908 ) ( ON ?auto_18880 ?auto_18896 ) ( CLEAR ?auto_18880 ) ( not ( = ?auto_18879 ?auto_18880 ) ) ( not ( = ?auto_18879 ?auto_18896 ) ) ( not ( = ?auto_18880 ?auto_18896 ) ) ( IS-CRATE ?auto_18879 ) ( AVAILABLE ?auto_18904 ) ( SURFACE-AT ?auto_18879 ?auto_18908 ) ( ON ?auto_18879 ?auto_18910 ) ( CLEAR ?auto_18879 ) ( not ( = ?auto_18878 ?auto_18879 ) ) ( not ( = ?auto_18878 ?auto_18910 ) ) ( not ( = ?auto_18879 ?auto_18910 ) ) ( IS-CRATE ?auto_18878 ) ( AVAILABLE ?auto_18903 ) ( SURFACE-AT ?auto_18878 ?auto_18906 ) ( ON ?auto_18878 ?auto_18905 ) ( CLEAR ?auto_18878 ) ( not ( = ?auto_18877 ?auto_18878 ) ) ( not ( = ?auto_18877 ?auto_18905 ) ) ( not ( = ?auto_18878 ?auto_18905 ) ) ( SURFACE-AT ?auto_18876 ?auto_18888 ) ( CLEAR ?auto_18876 ) ( IS-CRATE ?auto_18877 ) ( AVAILABLE ?auto_18893 ) ( not ( = ?auto_18902 ?auto_18888 ) ) ( HOIST-AT ?auto_18899 ?auto_18902 ) ( AVAILABLE ?auto_18899 ) ( SURFACE-AT ?auto_18877 ?auto_18902 ) ( ON ?auto_18877 ?auto_18895 ) ( CLEAR ?auto_18877 ) ( TRUCK-AT ?auto_18892 ?auto_18888 ) ( not ( = ?auto_18876 ?auto_18877 ) ) ( not ( = ?auto_18876 ?auto_18895 ) ) ( not ( = ?auto_18877 ?auto_18895 ) ) ( not ( = ?auto_18893 ?auto_18899 ) ) ( not ( = ?auto_18876 ?auto_18878 ) ) ( not ( = ?auto_18876 ?auto_18905 ) ) ( not ( = ?auto_18878 ?auto_18895 ) ) ( not ( = ?auto_18906 ?auto_18902 ) ) ( not ( = ?auto_18903 ?auto_18899 ) ) ( not ( = ?auto_18905 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18879 ) ) ( not ( = ?auto_18876 ?auto_18910 ) ) ( not ( = ?auto_18877 ?auto_18879 ) ) ( not ( = ?auto_18877 ?auto_18910 ) ) ( not ( = ?auto_18879 ?auto_18905 ) ) ( not ( = ?auto_18879 ?auto_18895 ) ) ( not ( = ?auto_18908 ?auto_18906 ) ) ( not ( = ?auto_18908 ?auto_18902 ) ) ( not ( = ?auto_18904 ?auto_18903 ) ) ( not ( = ?auto_18904 ?auto_18899 ) ) ( not ( = ?auto_18910 ?auto_18905 ) ) ( not ( = ?auto_18910 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18880 ) ) ( not ( = ?auto_18876 ?auto_18896 ) ) ( not ( = ?auto_18877 ?auto_18880 ) ) ( not ( = ?auto_18877 ?auto_18896 ) ) ( not ( = ?auto_18878 ?auto_18880 ) ) ( not ( = ?auto_18878 ?auto_18896 ) ) ( not ( = ?auto_18880 ?auto_18910 ) ) ( not ( = ?auto_18880 ?auto_18905 ) ) ( not ( = ?auto_18880 ?auto_18895 ) ) ( not ( = ?auto_18896 ?auto_18910 ) ) ( not ( = ?auto_18896 ?auto_18905 ) ) ( not ( = ?auto_18896 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18881 ) ) ( not ( = ?auto_18876 ?auto_18894 ) ) ( not ( = ?auto_18877 ?auto_18881 ) ) ( not ( = ?auto_18877 ?auto_18894 ) ) ( not ( = ?auto_18878 ?auto_18881 ) ) ( not ( = ?auto_18878 ?auto_18894 ) ) ( not ( = ?auto_18879 ?auto_18881 ) ) ( not ( = ?auto_18879 ?auto_18894 ) ) ( not ( = ?auto_18881 ?auto_18896 ) ) ( not ( = ?auto_18881 ?auto_18910 ) ) ( not ( = ?auto_18881 ?auto_18905 ) ) ( not ( = ?auto_18881 ?auto_18895 ) ) ( not ( = ?auto_18894 ?auto_18896 ) ) ( not ( = ?auto_18894 ?auto_18910 ) ) ( not ( = ?auto_18894 ?auto_18905 ) ) ( not ( = ?auto_18894 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18884 ) ) ( not ( = ?auto_18876 ?auto_18897 ) ) ( not ( = ?auto_18877 ?auto_18884 ) ) ( not ( = ?auto_18877 ?auto_18897 ) ) ( not ( = ?auto_18878 ?auto_18884 ) ) ( not ( = ?auto_18878 ?auto_18897 ) ) ( not ( = ?auto_18879 ?auto_18884 ) ) ( not ( = ?auto_18879 ?auto_18897 ) ) ( not ( = ?auto_18880 ?auto_18884 ) ) ( not ( = ?auto_18880 ?auto_18897 ) ) ( not ( = ?auto_18884 ?auto_18894 ) ) ( not ( = ?auto_18884 ?auto_18896 ) ) ( not ( = ?auto_18884 ?auto_18910 ) ) ( not ( = ?auto_18884 ?auto_18905 ) ) ( not ( = ?auto_18884 ?auto_18895 ) ) ( not ( = ?auto_18897 ?auto_18894 ) ) ( not ( = ?auto_18897 ?auto_18896 ) ) ( not ( = ?auto_18897 ?auto_18910 ) ) ( not ( = ?auto_18897 ?auto_18905 ) ) ( not ( = ?auto_18897 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18883 ) ) ( not ( = ?auto_18876 ?auto_18909 ) ) ( not ( = ?auto_18877 ?auto_18883 ) ) ( not ( = ?auto_18877 ?auto_18909 ) ) ( not ( = ?auto_18878 ?auto_18883 ) ) ( not ( = ?auto_18878 ?auto_18909 ) ) ( not ( = ?auto_18879 ?auto_18883 ) ) ( not ( = ?auto_18879 ?auto_18909 ) ) ( not ( = ?auto_18880 ?auto_18883 ) ) ( not ( = ?auto_18880 ?auto_18909 ) ) ( not ( = ?auto_18881 ?auto_18883 ) ) ( not ( = ?auto_18881 ?auto_18909 ) ) ( not ( = ?auto_18883 ?auto_18897 ) ) ( not ( = ?auto_18883 ?auto_18894 ) ) ( not ( = ?auto_18883 ?auto_18896 ) ) ( not ( = ?auto_18883 ?auto_18910 ) ) ( not ( = ?auto_18883 ?auto_18905 ) ) ( not ( = ?auto_18883 ?auto_18895 ) ) ( not ( = ?auto_18909 ?auto_18897 ) ) ( not ( = ?auto_18909 ?auto_18894 ) ) ( not ( = ?auto_18909 ?auto_18896 ) ) ( not ( = ?auto_18909 ?auto_18910 ) ) ( not ( = ?auto_18909 ?auto_18905 ) ) ( not ( = ?auto_18909 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18882 ) ) ( not ( = ?auto_18876 ?auto_18901 ) ) ( not ( = ?auto_18877 ?auto_18882 ) ) ( not ( = ?auto_18877 ?auto_18901 ) ) ( not ( = ?auto_18878 ?auto_18882 ) ) ( not ( = ?auto_18878 ?auto_18901 ) ) ( not ( = ?auto_18879 ?auto_18882 ) ) ( not ( = ?auto_18879 ?auto_18901 ) ) ( not ( = ?auto_18880 ?auto_18882 ) ) ( not ( = ?auto_18880 ?auto_18901 ) ) ( not ( = ?auto_18881 ?auto_18882 ) ) ( not ( = ?auto_18881 ?auto_18901 ) ) ( not ( = ?auto_18884 ?auto_18882 ) ) ( not ( = ?auto_18884 ?auto_18901 ) ) ( not ( = ?auto_18882 ?auto_18909 ) ) ( not ( = ?auto_18882 ?auto_18897 ) ) ( not ( = ?auto_18882 ?auto_18894 ) ) ( not ( = ?auto_18882 ?auto_18896 ) ) ( not ( = ?auto_18882 ?auto_18910 ) ) ( not ( = ?auto_18882 ?auto_18905 ) ) ( not ( = ?auto_18882 ?auto_18895 ) ) ( not ( = ?auto_18911 ?auto_18906 ) ) ( not ( = ?auto_18911 ?auto_18908 ) ) ( not ( = ?auto_18911 ?auto_18902 ) ) ( not ( = ?auto_18900 ?auto_18903 ) ) ( not ( = ?auto_18900 ?auto_18904 ) ) ( not ( = ?auto_18900 ?auto_18899 ) ) ( not ( = ?auto_18901 ?auto_18909 ) ) ( not ( = ?auto_18901 ?auto_18897 ) ) ( not ( = ?auto_18901 ?auto_18894 ) ) ( not ( = ?auto_18901 ?auto_18896 ) ) ( not ( = ?auto_18901 ?auto_18910 ) ) ( not ( = ?auto_18901 ?auto_18905 ) ) ( not ( = ?auto_18901 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18885 ) ) ( not ( = ?auto_18876 ?auto_18898 ) ) ( not ( = ?auto_18877 ?auto_18885 ) ) ( not ( = ?auto_18877 ?auto_18898 ) ) ( not ( = ?auto_18878 ?auto_18885 ) ) ( not ( = ?auto_18878 ?auto_18898 ) ) ( not ( = ?auto_18879 ?auto_18885 ) ) ( not ( = ?auto_18879 ?auto_18898 ) ) ( not ( = ?auto_18880 ?auto_18885 ) ) ( not ( = ?auto_18880 ?auto_18898 ) ) ( not ( = ?auto_18881 ?auto_18885 ) ) ( not ( = ?auto_18881 ?auto_18898 ) ) ( not ( = ?auto_18884 ?auto_18885 ) ) ( not ( = ?auto_18884 ?auto_18898 ) ) ( not ( = ?auto_18883 ?auto_18885 ) ) ( not ( = ?auto_18883 ?auto_18898 ) ) ( not ( = ?auto_18885 ?auto_18901 ) ) ( not ( = ?auto_18885 ?auto_18909 ) ) ( not ( = ?auto_18885 ?auto_18897 ) ) ( not ( = ?auto_18885 ?auto_18894 ) ) ( not ( = ?auto_18885 ?auto_18896 ) ) ( not ( = ?auto_18885 ?auto_18910 ) ) ( not ( = ?auto_18885 ?auto_18905 ) ) ( not ( = ?auto_18885 ?auto_18895 ) ) ( not ( = ?auto_18890 ?auto_18911 ) ) ( not ( = ?auto_18890 ?auto_18906 ) ) ( not ( = ?auto_18890 ?auto_18908 ) ) ( not ( = ?auto_18890 ?auto_18902 ) ) ( not ( = ?auto_18889 ?auto_18900 ) ) ( not ( = ?auto_18889 ?auto_18903 ) ) ( not ( = ?auto_18889 ?auto_18904 ) ) ( not ( = ?auto_18889 ?auto_18899 ) ) ( not ( = ?auto_18898 ?auto_18901 ) ) ( not ( = ?auto_18898 ?auto_18909 ) ) ( not ( = ?auto_18898 ?auto_18897 ) ) ( not ( = ?auto_18898 ?auto_18894 ) ) ( not ( = ?auto_18898 ?auto_18896 ) ) ( not ( = ?auto_18898 ?auto_18910 ) ) ( not ( = ?auto_18898 ?auto_18905 ) ) ( not ( = ?auto_18898 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18887 ) ) ( not ( = ?auto_18876 ?auto_18907 ) ) ( not ( = ?auto_18877 ?auto_18887 ) ) ( not ( = ?auto_18877 ?auto_18907 ) ) ( not ( = ?auto_18878 ?auto_18887 ) ) ( not ( = ?auto_18878 ?auto_18907 ) ) ( not ( = ?auto_18879 ?auto_18887 ) ) ( not ( = ?auto_18879 ?auto_18907 ) ) ( not ( = ?auto_18880 ?auto_18887 ) ) ( not ( = ?auto_18880 ?auto_18907 ) ) ( not ( = ?auto_18881 ?auto_18887 ) ) ( not ( = ?auto_18881 ?auto_18907 ) ) ( not ( = ?auto_18884 ?auto_18887 ) ) ( not ( = ?auto_18884 ?auto_18907 ) ) ( not ( = ?auto_18883 ?auto_18887 ) ) ( not ( = ?auto_18883 ?auto_18907 ) ) ( not ( = ?auto_18882 ?auto_18887 ) ) ( not ( = ?auto_18882 ?auto_18907 ) ) ( not ( = ?auto_18887 ?auto_18898 ) ) ( not ( = ?auto_18887 ?auto_18901 ) ) ( not ( = ?auto_18887 ?auto_18909 ) ) ( not ( = ?auto_18887 ?auto_18897 ) ) ( not ( = ?auto_18887 ?auto_18894 ) ) ( not ( = ?auto_18887 ?auto_18896 ) ) ( not ( = ?auto_18887 ?auto_18910 ) ) ( not ( = ?auto_18887 ?auto_18905 ) ) ( not ( = ?auto_18887 ?auto_18895 ) ) ( not ( = ?auto_18913 ?auto_18890 ) ) ( not ( = ?auto_18913 ?auto_18911 ) ) ( not ( = ?auto_18913 ?auto_18906 ) ) ( not ( = ?auto_18913 ?auto_18908 ) ) ( not ( = ?auto_18913 ?auto_18902 ) ) ( not ( = ?auto_18912 ?auto_18889 ) ) ( not ( = ?auto_18912 ?auto_18900 ) ) ( not ( = ?auto_18912 ?auto_18903 ) ) ( not ( = ?auto_18912 ?auto_18904 ) ) ( not ( = ?auto_18912 ?auto_18899 ) ) ( not ( = ?auto_18907 ?auto_18898 ) ) ( not ( = ?auto_18907 ?auto_18901 ) ) ( not ( = ?auto_18907 ?auto_18909 ) ) ( not ( = ?auto_18907 ?auto_18897 ) ) ( not ( = ?auto_18907 ?auto_18894 ) ) ( not ( = ?auto_18907 ?auto_18896 ) ) ( not ( = ?auto_18907 ?auto_18910 ) ) ( not ( = ?auto_18907 ?auto_18905 ) ) ( not ( = ?auto_18907 ?auto_18895 ) ) ( not ( = ?auto_18876 ?auto_18886 ) ) ( not ( = ?auto_18876 ?auto_18891 ) ) ( not ( = ?auto_18877 ?auto_18886 ) ) ( not ( = ?auto_18877 ?auto_18891 ) ) ( not ( = ?auto_18878 ?auto_18886 ) ) ( not ( = ?auto_18878 ?auto_18891 ) ) ( not ( = ?auto_18879 ?auto_18886 ) ) ( not ( = ?auto_18879 ?auto_18891 ) ) ( not ( = ?auto_18880 ?auto_18886 ) ) ( not ( = ?auto_18880 ?auto_18891 ) ) ( not ( = ?auto_18881 ?auto_18886 ) ) ( not ( = ?auto_18881 ?auto_18891 ) ) ( not ( = ?auto_18884 ?auto_18886 ) ) ( not ( = ?auto_18884 ?auto_18891 ) ) ( not ( = ?auto_18883 ?auto_18886 ) ) ( not ( = ?auto_18883 ?auto_18891 ) ) ( not ( = ?auto_18882 ?auto_18886 ) ) ( not ( = ?auto_18882 ?auto_18891 ) ) ( not ( = ?auto_18885 ?auto_18886 ) ) ( not ( = ?auto_18885 ?auto_18891 ) ) ( not ( = ?auto_18886 ?auto_18907 ) ) ( not ( = ?auto_18886 ?auto_18898 ) ) ( not ( = ?auto_18886 ?auto_18901 ) ) ( not ( = ?auto_18886 ?auto_18909 ) ) ( not ( = ?auto_18886 ?auto_18897 ) ) ( not ( = ?auto_18886 ?auto_18894 ) ) ( not ( = ?auto_18886 ?auto_18896 ) ) ( not ( = ?auto_18886 ?auto_18910 ) ) ( not ( = ?auto_18886 ?auto_18905 ) ) ( not ( = ?auto_18886 ?auto_18895 ) ) ( not ( = ?auto_18891 ?auto_18907 ) ) ( not ( = ?auto_18891 ?auto_18898 ) ) ( not ( = ?auto_18891 ?auto_18901 ) ) ( not ( = ?auto_18891 ?auto_18909 ) ) ( not ( = ?auto_18891 ?auto_18897 ) ) ( not ( = ?auto_18891 ?auto_18894 ) ) ( not ( = ?auto_18891 ?auto_18896 ) ) ( not ( = ?auto_18891 ?auto_18910 ) ) ( not ( = ?auto_18891 ?auto_18905 ) ) ( not ( = ?auto_18891 ?auto_18895 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18876 ?auto_18877 ?auto_18878 ?auto_18879 ?auto_18880 ?auto_18881 ?auto_18884 ?auto_18883 ?auto_18882 ?auto_18885 ?auto_18887 )
      ( MAKE-1CRATE ?auto_18887 ?auto_18886 )
      ( MAKE-11CRATE-VERIFY ?auto_18876 ?auto_18877 ?auto_18878 ?auto_18879 ?auto_18880 ?auto_18881 ?auto_18884 ?auto_18883 ?auto_18882 ?auto_18885 ?auto_18887 ?auto_18886 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18916 - SURFACE
      ?auto_18917 - SURFACE
    )
    :vars
    (
      ?auto_18918 - HOIST
      ?auto_18919 - PLACE
      ?auto_18921 - PLACE
      ?auto_18922 - HOIST
      ?auto_18923 - SURFACE
      ?auto_18920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18918 ?auto_18919 ) ( SURFACE-AT ?auto_18916 ?auto_18919 ) ( CLEAR ?auto_18916 ) ( IS-CRATE ?auto_18917 ) ( AVAILABLE ?auto_18918 ) ( not ( = ?auto_18921 ?auto_18919 ) ) ( HOIST-AT ?auto_18922 ?auto_18921 ) ( AVAILABLE ?auto_18922 ) ( SURFACE-AT ?auto_18917 ?auto_18921 ) ( ON ?auto_18917 ?auto_18923 ) ( CLEAR ?auto_18917 ) ( TRUCK-AT ?auto_18920 ?auto_18919 ) ( not ( = ?auto_18916 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18923 ) ) ( not ( = ?auto_18917 ?auto_18923 ) ) ( not ( = ?auto_18918 ?auto_18922 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18920 ?auto_18919 ?auto_18921 )
      ( !LIFT ?auto_18922 ?auto_18917 ?auto_18923 ?auto_18921 )
      ( !LOAD ?auto_18922 ?auto_18917 ?auto_18920 ?auto_18921 )
      ( !DRIVE ?auto_18920 ?auto_18921 ?auto_18919 )
      ( !UNLOAD ?auto_18918 ?auto_18917 ?auto_18920 ?auto_18919 )
      ( !DROP ?auto_18918 ?auto_18917 ?auto_18916 ?auto_18919 )
      ( MAKE-1CRATE-VERIFY ?auto_18916 ?auto_18917 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_18937 - SURFACE
      ?auto_18938 - SURFACE
      ?auto_18939 - SURFACE
      ?auto_18940 - SURFACE
      ?auto_18941 - SURFACE
      ?auto_18942 - SURFACE
      ?auto_18945 - SURFACE
      ?auto_18944 - SURFACE
      ?auto_18943 - SURFACE
      ?auto_18946 - SURFACE
      ?auto_18948 - SURFACE
      ?auto_18947 - SURFACE
      ?auto_18949 - SURFACE
    )
    :vars
    (
      ?auto_18950 - HOIST
      ?auto_18952 - PLACE
      ?auto_18954 - PLACE
      ?auto_18955 - HOIST
      ?auto_18951 - SURFACE
      ?auto_18978 - PLACE
      ?auto_18961 - HOIST
      ?auto_18963 - SURFACE
      ?auto_18959 - PLACE
      ?auto_18975 - HOIST
      ?auto_18956 - SURFACE
      ?auto_18958 - SURFACE
      ?auto_18969 - PLACE
      ?auto_18970 - HOIST
      ?auto_18971 - SURFACE
      ?auto_18972 - PLACE
      ?auto_18966 - HOIST
      ?auto_18957 - SURFACE
      ?auto_18976 - SURFACE
      ?auto_18974 - PLACE
      ?auto_18965 - HOIST
      ?auto_18977 - SURFACE
      ?auto_18967 - SURFACE
      ?auto_18968 - SURFACE
      ?auto_18962 - SURFACE
      ?auto_18964 - PLACE
      ?auto_18960 - HOIST
      ?auto_18973 - SURFACE
      ?auto_18953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18950 ?auto_18952 ) ( IS-CRATE ?auto_18949 ) ( not ( = ?auto_18954 ?auto_18952 ) ) ( HOIST-AT ?auto_18955 ?auto_18954 ) ( AVAILABLE ?auto_18955 ) ( SURFACE-AT ?auto_18949 ?auto_18954 ) ( ON ?auto_18949 ?auto_18951 ) ( CLEAR ?auto_18949 ) ( not ( = ?auto_18947 ?auto_18949 ) ) ( not ( = ?auto_18947 ?auto_18951 ) ) ( not ( = ?auto_18949 ?auto_18951 ) ) ( not ( = ?auto_18950 ?auto_18955 ) ) ( IS-CRATE ?auto_18947 ) ( not ( = ?auto_18978 ?auto_18952 ) ) ( HOIST-AT ?auto_18961 ?auto_18978 ) ( SURFACE-AT ?auto_18947 ?auto_18978 ) ( ON ?auto_18947 ?auto_18963 ) ( CLEAR ?auto_18947 ) ( not ( = ?auto_18948 ?auto_18947 ) ) ( not ( = ?auto_18948 ?auto_18963 ) ) ( not ( = ?auto_18947 ?auto_18963 ) ) ( not ( = ?auto_18950 ?auto_18961 ) ) ( IS-CRATE ?auto_18948 ) ( not ( = ?auto_18959 ?auto_18952 ) ) ( HOIST-AT ?auto_18975 ?auto_18959 ) ( AVAILABLE ?auto_18975 ) ( SURFACE-AT ?auto_18948 ?auto_18959 ) ( ON ?auto_18948 ?auto_18956 ) ( CLEAR ?auto_18948 ) ( not ( = ?auto_18946 ?auto_18948 ) ) ( not ( = ?auto_18946 ?auto_18956 ) ) ( not ( = ?auto_18948 ?auto_18956 ) ) ( not ( = ?auto_18950 ?auto_18975 ) ) ( IS-CRATE ?auto_18946 ) ( AVAILABLE ?auto_18961 ) ( SURFACE-AT ?auto_18946 ?auto_18978 ) ( ON ?auto_18946 ?auto_18958 ) ( CLEAR ?auto_18946 ) ( not ( = ?auto_18943 ?auto_18946 ) ) ( not ( = ?auto_18943 ?auto_18958 ) ) ( not ( = ?auto_18946 ?auto_18958 ) ) ( IS-CRATE ?auto_18943 ) ( not ( = ?auto_18969 ?auto_18952 ) ) ( HOIST-AT ?auto_18970 ?auto_18969 ) ( AVAILABLE ?auto_18970 ) ( SURFACE-AT ?auto_18943 ?auto_18969 ) ( ON ?auto_18943 ?auto_18971 ) ( CLEAR ?auto_18943 ) ( not ( = ?auto_18944 ?auto_18943 ) ) ( not ( = ?auto_18944 ?auto_18971 ) ) ( not ( = ?auto_18943 ?auto_18971 ) ) ( not ( = ?auto_18950 ?auto_18970 ) ) ( IS-CRATE ?auto_18944 ) ( not ( = ?auto_18972 ?auto_18952 ) ) ( HOIST-AT ?auto_18966 ?auto_18972 ) ( SURFACE-AT ?auto_18944 ?auto_18972 ) ( ON ?auto_18944 ?auto_18957 ) ( CLEAR ?auto_18944 ) ( not ( = ?auto_18945 ?auto_18944 ) ) ( not ( = ?auto_18945 ?auto_18957 ) ) ( not ( = ?auto_18944 ?auto_18957 ) ) ( not ( = ?auto_18950 ?auto_18966 ) ) ( IS-CRATE ?auto_18945 ) ( SURFACE-AT ?auto_18945 ?auto_18972 ) ( ON ?auto_18945 ?auto_18976 ) ( CLEAR ?auto_18945 ) ( not ( = ?auto_18942 ?auto_18945 ) ) ( not ( = ?auto_18942 ?auto_18976 ) ) ( not ( = ?auto_18945 ?auto_18976 ) ) ( IS-CRATE ?auto_18942 ) ( not ( = ?auto_18974 ?auto_18952 ) ) ( HOIST-AT ?auto_18965 ?auto_18974 ) ( SURFACE-AT ?auto_18942 ?auto_18974 ) ( ON ?auto_18942 ?auto_18977 ) ( CLEAR ?auto_18942 ) ( not ( = ?auto_18941 ?auto_18942 ) ) ( not ( = ?auto_18941 ?auto_18977 ) ) ( not ( = ?auto_18942 ?auto_18977 ) ) ( not ( = ?auto_18950 ?auto_18965 ) ) ( IS-CRATE ?auto_18941 ) ( SURFACE-AT ?auto_18941 ?auto_18974 ) ( ON ?auto_18941 ?auto_18967 ) ( CLEAR ?auto_18941 ) ( not ( = ?auto_18940 ?auto_18941 ) ) ( not ( = ?auto_18940 ?auto_18967 ) ) ( not ( = ?auto_18941 ?auto_18967 ) ) ( IS-CRATE ?auto_18940 ) ( AVAILABLE ?auto_18965 ) ( SURFACE-AT ?auto_18940 ?auto_18974 ) ( ON ?auto_18940 ?auto_18968 ) ( CLEAR ?auto_18940 ) ( not ( = ?auto_18939 ?auto_18940 ) ) ( not ( = ?auto_18939 ?auto_18968 ) ) ( not ( = ?auto_18940 ?auto_18968 ) ) ( IS-CRATE ?auto_18939 ) ( AVAILABLE ?auto_18966 ) ( SURFACE-AT ?auto_18939 ?auto_18972 ) ( ON ?auto_18939 ?auto_18962 ) ( CLEAR ?auto_18939 ) ( not ( = ?auto_18938 ?auto_18939 ) ) ( not ( = ?auto_18938 ?auto_18962 ) ) ( not ( = ?auto_18939 ?auto_18962 ) ) ( SURFACE-AT ?auto_18937 ?auto_18952 ) ( CLEAR ?auto_18937 ) ( IS-CRATE ?auto_18938 ) ( AVAILABLE ?auto_18950 ) ( not ( = ?auto_18964 ?auto_18952 ) ) ( HOIST-AT ?auto_18960 ?auto_18964 ) ( AVAILABLE ?auto_18960 ) ( SURFACE-AT ?auto_18938 ?auto_18964 ) ( ON ?auto_18938 ?auto_18973 ) ( CLEAR ?auto_18938 ) ( TRUCK-AT ?auto_18953 ?auto_18952 ) ( not ( = ?auto_18937 ?auto_18938 ) ) ( not ( = ?auto_18937 ?auto_18973 ) ) ( not ( = ?auto_18938 ?auto_18973 ) ) ( not ( = ?auto_18950 ?auto_18960 ) ) ( not ( = ?auto_18937 ?auto_18939 ) ) ( not ( = ?auto_18937 ?auto_18962 ) ) ( not ( = ?auto_18939 ?auto_18973 ) ) ( not ( = ?auto_18972 ?auto_18964 ) ) ( not ( = ?auto_18966 ?auto_18960 ) ) ( not ( = ?auto_18962 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18940 ) ) ( not ( = ?auto_18937 ?auto_18968 ) ) ( not ( = ?auto_18938 ?auto_18940 ) ) ( not ( = ?auto_18938 ?auto_18968 ) ) ( not ( = ?auto_18940 ?auto_18962 ) ) ( not ( = ?auto_18940 ?auto_18973 ) ) ( not ( = ?auto_18974 ?auto_18972 ) ) ( not ( = ?auto_18974 ?auto_18964 ) ) ( not ( = ?auto_18965 ?auto_18966 ) ) ( not ( = ?auto_18965 ?auto_18960 ) ) ( not ( = ?auto_18968 ?auto_18962 ) ) ( not ( = ?auto_18968 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18941 ) ) ( not ( = ?auto_18937 ?auto_18967 ) ) ( not ( = ?auto_18938 ?auto_18941 ) ) ( not ( = ?auto_18938 ?auto_18967 ) ) ( not ( = ?auto_18939 ?auto_18941 ) ) ( not ( = ?auto_18939 ?auto_18967 ) ) ( not ( = ?auto_18941 ?auto_18968 ) ) ( not ( = ?auto_18941 ?auto_18962 ) ) ( not ( = ?auto_18941 ?auto_18973 ) ) ( not ( = ?auto_18967 ?auto_18968 ) ) ( not ( = ?auto_18967 ?auto_18962 ) ) ( not ( = ?auto_18967 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18942 ) ) ( not ( = ?auto_18937 ?auto_18977 ) ) ( not ( = ?auto_18938 ?auto_18942 ) ) ( not ( = ?auto_18938 ?auto_18977 ) ) ( not ( = ?auto_18939 ?auto_18942 ) ) ( not ( = ?auto_18939 ?auto_18977 ) ) ( not ( = ?auto_18940 ?auto_18942 ) ) ( not ( = ?auto_18940 ?auto_18977 ) ) ( not ( = ?auto_18942 ?auto_18967 ) ) ( not ( = ?auto_18942 ?auto_18968 ) ) ( not ( = ?auto_18942 ?auto_18962 ) ) ( not ( = ?auto_18942 ?auto_18973 ) ) ( not ( = ?auto_18977 ?auto_18967 ) ) ( not ( = ?auto_18977 ?auto_18968 ) ) ( not ( = ?auto_18977 ?auto_18962 ) ) ( not ( = ?auto_18977 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18945 ) ) ( not ( = ?auto_18937 ?auto_18976 ) ) ( not ( = ?auto_18938 ?auto_18945 ) ) ( not ( = ?auto_18938 ?auto_18976 ) ) ( not ( = ?auto_18939 ?auto_18945 ) ) ( not ( = ?auto_18939 ?auto_18976 ) ) ( not ( = ?auto_18940 ?auto_18945 ) ) ( not ( = ?auto_18940 ?auto_18976 ) ) ( not ( = ?auto_18941 ?auto_18945 ) ) ( not ( = ?auto_18941 ?auto_18976 ) ) ( not ( = ?auto_18945 ?auto_18977 ) ) ( not ( = ?auto_18945 ?auto_18967 ) ) ( not ( = ?auto_18945 ?auto_18968 ) ) ( not ( = ?auto_18945 ?auto_18962 ) ) ( not ( = ?auto_18945 ?auto_18973 ) ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18967 ) ) ( not ( = ?auto_18976 ?auto_18968 ) ) ( not ( = ?auto_18976 ?auto_18962 ) ) ( not ( = ?auto_18976 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18944 ) ) ( not ( = ?auto_18937 ?auto_18957 ) ) ( not ( = ?auto_18938 ?auto_18944 ) ) ( not ( = ?auto_18938 ?auto_18957 ) ) ( not ( = ?auto_18939 ?auto_18944 ) ) ( not ( = ?auto_18939 ?auto_18957 ) ) ( not ( = ?auto_18940 ?auto_18944 ) ) ( not ( = ?auto_18940 ?auto_18957 ) ) ( not ( = ?auto_18941 ?auto_18944 ) ) ( not ( = ?auto_18941 ?auto_18957 ) ) ( not ( = ?auto_18942 ?auto_18944 ) ) ( not ( = ?auto_18942 ?auto_18957 ) ) ( not ( = ?auto_18944 ?auto_18976 ) ) ( not ( = ?auto_18944 ?auto_18977 ) ) ( not ( = ?auto_18944 ?auto_18967 ) ) ( not ( = ?auto_18944 ?auto_18968 ) ) ( not ( = ?auto_18944 ?auto_18962 ) ) ( not ( = ?auto_18944 ?auto_18973 ) ) ( not ( = ?auto_18957 ?auto_18976 ) ) ( not ( = ?auto_18957 ?auto_18977 ) ) ( not ( = ?auto_18957 ?auto_18967 ) ) ( not ( = ?auto_18957 ?auto_18968 ) ) ( not ( = ?auto_18957 ?auto_18962 ) ) ( not ( = ?auto_18957 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18943 ) ) ( not ( = ?auto_18937 ?auto_18971 ) ) ( not ( = ?auto_18938 ?auto_18943 ) ) ( not ( = ?auto_18938 ?auto_18971 ) ) ( not ( = ?auto_18939 ?auto_18943 ) ) ( not ( = ?auto_18939 ?auto_18971 ) ) ( not ( = ?auto_18940 ?auto_18943 ) ) ( not ( = ?auto_18940 ?auto_18971 ) ) ( not ( = ?auto_18941 ?auto_18943 ) ) ( not ( = ?auto_18941 ?auto_18971 ) ) ( not ( = ?auto_18942 ?auto_18943 ) ) ( not ( = ?auto_18942 ?auto_18971 ) ) ( not ( = ?auto_18945 ?auto_18943 ) ) ( not ( = ?auto_18945 ?auto_18971 ) ) ( not ( = ?auto_18943 ?auto_18957 ) ) ( not ( = ?auto_18943 ?auto_18976 ) ) ( not ( = ?auto_18943 ?auto_18977 ) ) ( not ( = ?auto_18943 ?auto_18967 ) ) ( not ( = ?auto_18943 ?auto_18968 ) ) ( not ( = ?auto_18943 ?auto_18962 ) ) ( not ( = ?auto_18943 ?auto_18973 ) ) ( not ( = ?auto_18969 ?auto_18972 ) ) ( not ( = ?auto_18969 ?auto_18974 ) ) ( not ( = ?auto_18969 ?auto_18964 ) ) ( not ( = ?auto_18970 ?auto_18966 ) ) ( not ( = ?auto_18970 ?auto_18965 ) ) ( not ( = ?auto_18970 ?auto_18960 ) ) ( not ( = ?auto_18971 ?auto_18957 ) ) ( not ( = ?auto_18971 ?auto_18976 ) ) ( not ( = ?auto_18971 ?auto_18977 ) ) ( not ( = ?auto_18971 ?auto_18967 ) ) ( not ( = ?auto_18971 ?auto_18968 ) ) ( not ( = ?auto_18971 ?auto_18962 ) ) ( not ( = ?auto_18971 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18946 ) ) ( not ( = ?auto_18937 ?auto_18958 ) ) ( not ( = ?auto_18938 ?auto_18946 ) ) ( not ( = ?auto_18938 ?auto_18958 ) ) ( not ( = ?auto_18939 ?auto_18946 ) ) ( not ( = ?auto_18939 ?auto_18958 ) ) ( not ( = ?auto_18940 ?auto_18946 ) ) ( not ( = ?auto_18940 ?auto_18958 ) ) ( not ( = ?auto_18941 ?auto_18946 ) ) ( not ( = ?auto_18941 ?auto_18958 ) ) ( not ( = ?auto_18942 ?auto_18946 ) ) ( not ( = ?auto_18942 ?auto_18958 ) ) ( not ( = ?auto_18945 ?auto_18946 ) ) ( not ( = ?auto_18945 ?auto_18958 ) ) ( not ( = ?auto_18944 ?auto_18946 ) ) ( not ( = ?auto_18944 ?auto_18958 ) ) ( not ( = ?auto_18946 ?auto_18971 ) ) ( not ( = ?auto_18946 ?auto_18957 ) ) ( not ( = ?auto_18946 ?auto_18976 ) ) ( not ( = ?auto_18946 ?auto_18977 ) ) ( not ( = ?auto_18946 ?auto_18967 ) ) ( not ( = ?auto_18946 ?auto_18968 ) ) ( not ( = ?auto_18946 ?auto_18962 ) ) ( not ( = ?auto_18946 ?auto_18973 ) ) ( not ( = ?auto_18978 ?auto_18969 ) ) ( not ( = ?auto_18978 ?auto_18972 ) ) ( not ( = ?auto_18978 ?auto_18974 ) ) ( not ( = ?auto_18978 ?auto_18964 ) ) ( not ( = ?auto_18961 ?auto_18970 ) ) ( not ( = ?auto_18961 ?auto_18966 ) ) ( not ( = ?auto_18961 ?auto_18965 ) ) ( not ( = ?auto_18961 ?auto_18960 ) ) ( not ( = ?auto_18958 ?auto_18971 ) ) ( not ( = ?auto_18958 ?auto_18957 ) ) ( not ( = ?auto_18958 ?auto_18976 ) ) ( not ( = ?auto_18958 ?auto_18977 ) ) ( not ( = ?auto_18958 ?auto_18967 ) ) ( not ( = ?auto_18958 ?auto_18968 ) ) ( not ( = ?auto_18958 ?auto_18962 ) ) ( not ( = ?auto_18958 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18948 ) ) ( not ( = ?auto_18937 ?auto_18956 ) ) ( not ( = ?auto_18938 ?auto_18948 ) ) ( not ( = ?auto_18938 ?auto_18956 ) ) ( not ( = ?auto_18939 ?auto_18948 ) ) ( not ( = ?auto_18939 ?auto_18956 ) ) ( not ( = ?auto_18940 ?auto_18948 ) ) ( not ( = ?auto_18940 ?auto_18956 ) ) ( not ( = ?auto_18941 ?auto_18948 ) ) ( not ( = ?auto_18941 ?auto_18956 ) ) ( not ( = ?auto_18942 ?auto_18948 ) ) ( not ( = ?auto_18942 ?auto_18956 ) ) ( not ( = ?auto_18945 ?auto_18948 ) ) ( not ( = ?auto_18945 ?auto_18956 ) ) ( not ( = ?auto_18944 ?auto_18948 ) ) ( not ( = ?auto_18944 ?auto_18956 ) ) ( not ( = ?auto_18943 ?auto_18948 ) ) ( not ( = ?auto_18943 ?auto_18956 ) ) ( not ( = ?auto_18948 ?auto_18958 ) ) ( not ( = ?auto_18948 ?auto_18971 ) ) ( not ( = ?auto_18948 ?auto_18957 ) ) ( not ( = ?auto_18948 ?auto_18976 ) ) ( not ( = ?auto_18948 ?auto_18977 ) ) ( not ( = ?auto_18948 ?auto_18967 ) ) ( not ( = ?auto_18948 ?auto_18968 ) ) ( not ( = ?auto_18948 ?auto_18962 ) ) ( not ( = ?auto_18948 ?auto_18973 ) ) ( not ( = ?auto_18959 ?auto_18978 ) ) ( not ( = ?auto_18959 ?auto_18969 ) ) ( not ( = ?auto_18959 ?auto_18972 ) ) ( not ( = ?auto_18959 ?auto_18974 ) ) ( not ( = ?auto_18959 ?auto_18964 ) ) ( not ( = ?auto_18975 ?auto_18961 ) ) ( not ( = ?auto_18975 ?auto_18970 ) ) ( not ( = ?auto_18975 ?auto_18966 ) ) ( not ( = ?auto_18975 ?auto_18965 ) ) ( not ( = ?auto_18975 ?auto_18960 ) ) ( not ( = ?auto_18956 ?auto_18958 ) ) ( not ( = ?auto_18956 ?auto_18971 ) ) ( not ( = ?auto_18956 ?auto_18957 ) ) ( not ( = ?auto_18956 ?auto_18976 ) ) ( not ( = ?auto_18956 ?auto_18977 ) ) ( not ( = ?auto_18956 ?auto_18967 ) ) ( not ( = ?auto_18956 ?auto_18968 ) ) ( not ( = ?auto_18956 ?auto_18962 ) ) ( not ( = ?auto_18956 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18947 ) ) ( not ( = ?auto_18937 ?auto_18963 ) ) ( not ( = ?auto_18938 ?auto_18947 ) ) ( not ( = ?auto_18938 ?auto_18963 ) ) ( not ( = ?auto_18939 ?auto_18947 ) ) ( not ( = ?auto_18939 ?auto_18963 ) ) ( not ( = ?auto_18940 ?auto_18947 ) ) ( not ( = ?auto_18940 ?auto_18963 ) ) ( not ( = ?auto_18941 ?auto_18947 ) ) ( not ( = ?auto_18941 ?auto_18963 ) ) ( not ( = ?auto_18942 ?auto_18947 ) ) ( not ( = ?auto_18942 ?auto_18963 ) ) ( not ( = ?auto_18945 ?auto_18947 ) ) ( not ( = ?auto_18945 ?auto_18963 ) ) ( not ( = ?auto_18944 ?auto_18947 ) ) ( not ( = ?auto_18944 ?auto_18963 ) ) ( not ( = ?auto_18943 ?auto_18947 ) ) ( not ( = ?auto_18943 ?auto_18963 ) ) ( not ( = ?auto_18946 ?auto_18947 ) ) ( not ( = ?auto_18946 ?auto_18963 ) ) ( not ( = ?auto_18947 ?auto_18956 ) ) ( not ( = ?auto_18947 ?auto_18958 ) ) ( not ( = ?auto_18947 ?auto_18971 ) ) ( not ( = ?auto_18947 ?auto_18957 ) ) ( not ( = ?auto_18947 ?auto_18976 ) ) ( not ( = ?auto_18947 ?auto_18977 ) ) ( not ( = ?auto_18947 ?auto_18967 ) ) ( not ( = ?auto_18947 ?auto_18968 ) ) ( not ( = ?auto_18947 ?auto_18962 ) ) ( not ( = ?auto_18947 ?auto_18973 ) ) ( not ( = ?auto_18963 ?auto_18956 ) ) ( not ( = ?auto_18963 ?auto_18958 ) ) ( not ( = ?auto_18963 ?auto_18971 ) ) ( not ( = ?auto_18963 ?auto_18957 ) ) ( not ( = ?auto_18963 ?auto_18976 ) ) ( not ( = ?auto_18963 ?auto_18977 ) ) ( not ( = ?auto_18963 ?auto_18967 ) ) ( not ( = ?auto_18963 ?auto_18968 ) ) ( not ( = ?auto_18963 ?auto_18962 ) ) ( not ( = ?auto_18963 ?auto_18973 ) ) ( not ( = ?auto_18937 ?auto_18949 ) ) ( not ( = ?auto_18937 ?auto_18951 ) ) ( not ( = ?auto_18938 ?auto_18949 ) ) ( not ( = ?auto_18938 ?auto_18951 ) ) ( not ( = ?auto_18939 ?auto_18949 ) ) ( not ( = ?auto_18939 ?auto_18951 ) ) ( not ( = ?auto_18940 ?auto_18949 ) ) ( not ( = ?auto_18940 ?auto_18951 ) ) ( not ( = ?auto_18941 ?auto_18949 ) ) ( not ( = ?auto_18941 ?auto_18951 ) ) ( not ( = ?auto_18942 ?auto_18949 ) ) ( not ( = ?auto_18942 ?auto_18951 ) ) ( not ( = ?auto_18945 ?auto_18949 ) ) ( not ( = ?auto_18945 ?auto_18951 ) ) ( not ( = ?auto_18944 ?auto_18949 ) ) ( not ( = ?auto_18944 ?auto_18951 ) ) ( not ( = ?auto_18943 ?auto_18949 ) ) ( not ( = ?auto_18943 ?auto_18951 ) ) ( not ( = ?auto_18946 ?auto_18949 ) ) ( not ( = ?auto_18946 ?auto_18951 ) ) ( not ( = ?auto_18948 ?auto_18949 ) ) ( not ( = ?auto_18948 ?auto_18951 ) ) ( not ( = ?auto_18949 ?auto_18963 ) ) ( not ( = ?auto_18949 ?auto_18956 ) ) ( not ( = ?auto_18949 ?auto_18958 ) ) ( not ( = ?auto_18949 ?auto_18971 ) ) ( not ( = ?auto_18949 ?auto_18957 ) ) ( not ( = ?auto_18949 ?auto_18976 ) ) ( not ( = ?auto_18949 ?auto_18977 ) ) ( not ( = ?auto_18949 ?auto_18967 ) ) ( not ( = ?auto_18949 ?auto_18968 ) ) ( not ( = ?auto_18949 ?auto_18962 ) ) ( not ( = ?auto_18949 ?auto_18973 ) ) ( not ( = ?auto_18954 ?auto_18978 ) ) ( not ( = ?auto_18954 ?auto_18959 ) ) ( not ( = ?auto_18954 ?auto_18969 ) ) ( not ( = ?auto_18954 ?auto_18972 ) ) ( not ( = ?auto_18954 ?auto_18974 ) ) ( not ( = ?auto_18954 ?auto_18964 ) ) ( not ( = ?auto_18955 ?auto_18961 ) ) ( not ( = ?auto_18955 ?auto_18975 ) ) ( not ( = ?auto_18955 ?auto_18970 ) ) ( not ( = ?auto_18955 ?auto_18966 ) ) ( not ( = ?auto_18955 ?auto_18965 ) ) ( not ( = ?auto_18955 ?auto_18960 ) ) ( not ( = ?auto_18951 ?auto_18963 ) ) ( not ( = ?auto_18951 ?auto_18956 ) ) ( not ( = ?auto_18951 ?auto_18958 ) ) ( not ( = ?auto_18951 ?auto_18971 ) ) ( not ( = ?auto_18951 ?auto_18957 ) ) ( not ( = ?auto_18951 ?auto_18976 ) ) ( not ( = ?auto_18951 ?auto_18977 ) ) ( not ( = ?auto_18951 ?auto_18967 ) ) ( not ( = ?auto_18951 ?auto_18968 ) ) ( not ( = ?auto_18951 ?auto_18962 ) ) ( not ( = ?auto_18951 ?auto_18973 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18937 ?auto_18938 ?auto_18939 ?auto_18940 ?auto_18941 ?auto_18942 ?auto_18945 ?auto_18944 ?auto_18943 ?auto_18946 ?auto_18948 ?auto_18947 )
      ( MAKE-1CRATE ?auto_18947 ?auto_18949 )
      ( MAKE-12CRATE-VERIFY ?auto_18937 ?auto_18938 ?auto_18939 ?auto_18940 ?auto_18941 ?auto_18942 ?auto_18945 ?auto_18944 ?auto_18943 ?auto_18946 ?auto_18948 ?auto_18947 ?auto_18949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18981 - SURFACE
      ?auto_18982 - SURFACE
    )
    :vars
    (
      ?auto_18983 - HOIST
      ?auto_18984 - PLACE
      ?auto_18986 - PLACE
      ?auto_18987 - HOIST
      ?auto_18988 - SURFACE
      ?auto_18985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18983 ?auto_18984 ) ( SURFACE-AT ?auto_18981 ?auto_18984 ) ( CLEAR ?auto_18981 ) ( IS-CRATE ?auto_18982 ) ( AVAILABLE ?auto_18983 ) ( not ( = ?auto_18986 ?auto_18984 ) ) ( HOIST-AT ?auto_18987 ?auto_18986 ) ( AVAILABLE ?auto_18987 ) ( SURFACE-AT ?auto_18982 ?auto_18986 ) ( ON ?auto_18982 ?auto_18988 ) ( CLEAR ?auto_18982 ) ( TRUCK-AT ?auto_18985 ?auto_18984 ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_18988 ) ) ( not ( = ?auto_18982 ?auto_18988 ) ) ( not ( = ?auto_18983 ?auto_18987 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18985 ?auto_18984 ?auto_18986 )
      ( !LIFT ?auto_18987 ?auto_18982 ?auto_18988 ?auto_18986 )
      ( !LOAD ?auto_18987 ?auto_18982 ?auto_18985 ?auto_18986 )
      ( !DRIVE ?auto_18985 ?auto_18986 ?auto_18984 )
      ( !UNLOAD ?auto_18983 ?auto_18982 ?auto_18985 ?auto_18984 )
      ( !DROP ?auto_18983 ?auto_18982 ?auto_18981 ?auto_18984 )
      ( MAKE-1CRATE-VERIFY ?auto_18981 ?auto_18982 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_19003 - SURFACE
      ?auto_19004 - SURFACE
      ?auto_19005 - SURFACE
      ?auto_19006 - SURFACE
      ?auto_19007 - SURFACE
      ?auto_19008 - SURFACE
      ?auto_19011 - SURFACE
      ?auto_19010 - SURFACE
      ?auto_19009 - SURFACE
      ?auto_19012 - SURFACE
      ?auto_19014 - SURFACE
      ?auto_19013 - SURFACE
      ?auto_19015 - SURFACE
      ?auto_19016 - SURFACE
    )
    :vars
    (
      ?auto_19020 - HOIST
      ?auto_19017 - PLACE
      ?auto_19021 - PLACE
      ?auto_19019 - HOIST
      ?auto_19018 - SURFACE
      ?auto_19033 - PLACE
      ?auto_19040 - HOIST
      ?auto_19024 - SURFACE
      ?auto_19036 - PLACE
      ?auto_19046 - HOIST
      ?auto_19023 - SURFACE
      ?auto_19045 - PLACE
      ?auto_19037 - HOIST
      ?auto_19044 - SURFACE
      ?auto_19047 - SURFACE
      ?auto_19038 - PLACE
      ?auto_19035 - HOIST
      ?auto_19028 - SURFACE
      ?auto_19042 - PLACE
      ?auto_19041 - HOIST
      ?auto_19031 - SURFACE
      ?auto_19029 - SURFACE
      ?auto_19043 - PLACE
      ?auto_19048 - HOIST
      ?auto_19025 - SURFACE
      ?auto_19027 - SURFACE
      ?auto_19039 - SURFACE
      ?auto_19032 - SURFACE
      ?auto_19030 - PLACE
      ?auto_19026 - HOIST
      ?auto_19034 - SURFACE
      ?auto_19022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19020 ?auto_19017 ) ( IS-CRATE ?auto_19016 ) ( not ( = ?auto_19021 ?auto_19017 ) ) ( HOIST-AT ?auto_19019 ?auto_19021 ) ( AVAILABLE ?auto_19019 ) ( SURFACE-AT ?auto_19016 ?auto_19021 ) ( ON ?auto_19016 ?auto_19018 ) ( CLEAR ?auto_19016 ) ( not ( = ?auto_19015 ?auto_19016 ) ) ( not ( = ?auto_19015 ?auto_19018 ) ) ( not ( = ?auto_19016 ?auto_19018 ) ) ( not ( = ?auto_19020 ?auto_19019 ) ) ( IS-CRATE ?auto_19015 ) ( not ( = ?auto_19033 ?auto_19017 ) ) ( HOIST-AT ?auto_19040 ?auto_19033 ) ( AVAILABLE ?auto_19040 ) ( SURFACE-AT ?auto_19015 ?auto_19033 ) ( ON ?auto_19015 ?auto_19024 ) ( CLEAR ?auto_19015 ) ( not ( = ?auto_19013 ?auto_19015 ) ) ( not ( = ?auto_19013 ?auto_19024 ) ) ( not ( = ?auto_19015 ?auto_19024 ) ) ( not ( = ?auto_19020 ?auto_19040 ) ) ( IS-CRATE ?auto_19013 ) ( not ( = ?auto_19036 ?auto_19017 ) ) ( HOIST-AT ?auto_19046 ?auto_19036 ) ( SURFACE-AT ?auto_19013 ?auto_19036 ) ( ON ?auto_19013 ?auto_19023 ) ( CLEAR ?auto_19013 ) ( not ( = ?auto_19014 ?auto_19013 ) ) ( not ( = ?auto_19014 ?auto_19023 ) ) ( not ( = ?auto_19013 ?auto_19023 ) ) ( not ( = ?auto_19020 ?auto_19046 ) ) ( IS-CRATE ?auto_19014 ) ( not ( = ?auto_19045 ?auto_19017 ) ) ( HOIST-AT ?auto_19037 ?auto_19045 ) ( AVAILABLE ?auto_19037 ) ( SURFACE-AT ?auto_19014 ?auto_19045 ) ( ON ?auto_19014 ?auto_19044 ) ( CLEAR ?auto_19014 ) ( not ( = ?auto_19012 ?auto_19014 ) ) ( not ( = ?auto_19012 ?auto_19044 ) ) ( not ( = ?auto_19014 ?auto_19044 ) ) ( not ( = ?auto_19020 ?auto_19037 ) ) ( IS-CRATE ?auto_19012 ) ( AVAILABLE ?auto_19046 ) ( SURFACE-AT ?auto_19012 ?auto_19036 ) ( ON ?auto_19012 ?auto_19047 ) ( CLEAR ?auto_19012 ) ( not ( = ?auto_19009 ?auto_19012 ) ) ( not ( = ?auto_19009 ?auto_19047 ) ) ( not ( = ?auto_19012 ?auto_19047 ) ) ( IS-CRATE ?auto_19009 ) ( not ( = ?auto_19038 ?auto_19017 ) ) ( HOIST-AT ?auto_19035 ?auto_19038 ) ( AVAILABLE ?auto_19035 ) ( SURFACE-AT ?auto_19009 ?auto_19038 ) ( ON ?auto_19009 ?auto_19028 ) ( CLEAR ?auto_19009 ) ( not ( = ?auto_19010 ?auto_19009 ) ) ( not ( = ?auto_19010 ?auto_19028 ) ) ( not ( = ?auto_19009 ?auto_19028 ) ) ( not ( = ?auto_19020 ?auto_19035 ) ) ( IS-CRATE ?auto_19010 ) ( not ( = ?auto_19042 ?auto_19017 ) ) ( HOIST-AT ?auto_19041 ?auto_19042 ) ( SURFACE-AT ?auto_19010 ?auto_19042 ) ( ON ?auto_19010 ?auto_19031 ) ( CLEAR ?auto_19010 ) ( not ( = ?auto_19011 ?auto_19010 ) ) ( not ( = ?auto_19011 ?auto_19031 ) ) ( not ( = ?auto_19010 ?auto_19031 ) ) ( not ( = ?auto_19020 ?auto_19041 ) ) ( IS-CRATE ?auto_19011 ) ( SURFACE-AT ?auto_19011 ?auto_19042 ) ( ON ?auto_19011 ?auto_19029 ) ( CLEAR ?auto_19011 ) ( not ( = ?auto_19008 ?auto_19011 ) ) ( not ( = ?auto_19008 ?auto_19029 ) ) ( not ( = ?auto_19011 ?auto_19029 ) ) ( IS-CRATE ?auto_19008 ) ( not ( = ?auto_19043 ?auto_19017 ) ) ( HOIST-AT ?auto_19048 ?auto_19043 ) ( SURFACE-AT ?auto_19008 ?auto_19043 ) ( ON ?auto_19008 ?auto_19025 ) ( CLEAR ?auto_19008 ) ( not ( = ?auto_19007 ?auto_19008 ) ) ( not ( = ?auto_19007 ?auto_19025 ) ) ( not ( = ?auto_19008 ?auto_19025 ) ) ( not ( = ?auto_19020 ?auto_19048 ) ) ( IS-CRATE ?auto_19007 ) ( SURFACE-AT ?auto_19007 ?auto_19043 ) ( ON ?auto_19007 ?auto_19027 ) ( CLEAR ?auto_19007 ) ( not ( = ?auto_19006 ?auto_19007 ) ) ( not ( = ?auto_19006 ?auto_19027 ) ) ( not ( = ?auto_19007 ?auto_19027 ) ) ( IS-CRATE ?auto_19006 ) ( AVAILABLE ?auto_19048 ) ( SURFACE-AT ?auto_19006 ?auto_19043 ) ( ON ?auto_19006 ?auto_19039 ) ( CLEAR ?auto_19006 ) ( not ( = ?auto_19005 ?auto_19006 ) ) ( not ( = ?auto_19005 ?auto_19039 ) ) ( not ( = ?auto_19006 ?auto_19039 ) ) ( IS-CRATE ?auto_19005 ) ( AVAILABLE ?auto_19041 ) ( SURFACE-AT ?auto_19005 ?auto_19042 ) ( ON ?auto_19005 ?auto_19032 ) ( CLEAR ?auto_19005 ) ( not ( = ?auto_19004 ?auto_19005 ) ) ( not ( = ?auto_19004 ?auto_19032 ) ) ( not ( = ?auto_19005 ?auto_19032 ) ) ( SURFACE-AT ?auto_19003 ?auto_19017 ) ( CLEAR ?auto_19003 ) ( IS-CRATE ?auto_19004 ) ( AVAILABLE ?auto_19020 ) ( not ( = ?auto_19030 ?auto_19017 ) ) ( HOIST-AT ?auto_19026 ?auto_19030 ) ( AVAILABLE ?auto_19026 ) ( SURFACE-AT ?auto_19004 ?auto_19030 ) ( ON ?auto_19004 ?auto_19034 ) ( CLEAR ?auto_19004 ) ( TRUCK-AT ?auto_19022 ?auto_19017 ) ( not ( = ?auto_19003 ?auto_19004 ) ) ( not ( = ?auto_19003 ?auto_19034 ) ) ( not ( = ?auto_19004 ?auto_19034 ) ) ( not ( = ?auto_19020 ?auto_19026 ) ) ( not ( = ?auto_19003 ?auto_19005 ) ) ( not ( = ?auto_19003 ?auto_19032 ) ) ( not ( = ?auto_19005 ?auto_19034 ) ) ( not ( = ?auto_19042 ?auto_19030 ) ) ( not ( = ?auto_19041 ?auto_19026 ) ) ( not ( = ?auto_19032 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19006 ) ) ( not ( = ?auto_19003 ?auto_19039 ) ) ( not ( = ?auto_19004 ?auto_19006 ) ) ( not ( = ?auto_19004 ?auto_19039 ) ) ( not ( = ?auto_19006 ?auto_19032 ) ) ( not ( = ?auto_19006 ?auto_19034 ) ) ( not ( = ?auto_19043 ?auto_19042 ) ) ( not ( = ?auto_19043 ?auto_19030 ) ) ( not ( = ?auto_19048 ?auto_19041 ) ) ( not ( = ?auto_19048 ?auto_19026 ) ) ( not ( = ?auto_19039 ?auto_19032 ) ) ( not ( = ?auto_19039 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19007 ) ) ( not ( = ?auto_19003 ?auto_19027 ) ) ( not ( = ?auto_19004 ?auto_19007 ) ) ( not ( = ?auto_19004 ?auto_19027 ) ) ( not ( = ?auto_19005 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_19027 ) ) ( not ( = ?auto_19007 ?auto_19039 ) ) ( not ( = ?auto_19007 ?auto_19032 ) ) ( not ( = ?auto_19007 ?auto_19034 ) ) ( not ( = ?auto_19027 ?auto_19039 ) ) ( not ( = ?auto_19027 ?auto_19032 ) ) ( not ( = ?auto_19027 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19008 ) ) ( not ( = ?auto_19003 ?auto_19025 ) ) ( not ( = ?auto_19004 ?auto_19008 ) ) ( not ( = ?auto_19004 ?auto_19025 ) ) ( not ( = ?auto_19005 ?auto_19008 ) ) ( not ( = ?auto_19005 ?auto_19025 ) ) ( not ( = ?auto_19006 ?auto_19008 ) ) ( not ( = ?auto_19006 ?auto_19025 ) ) ( not ( = ?auto_19008 ?auto_19027 ) ) ( not ( = ?auto_19008 ?auto_19039 ) ) ( not ( = ?auto_19008 ?auto_19032 ) ) ( not ( = ?auto_19008 ?auto_19034 ) ) ( not ( = ?auto_19025 ?auto_19027 ) ) ( not ( = ?auto_19025 ?auto_19039 ) ) ( not ( = ?auto_19025 ?auto_19032 ) ) ( not ( = ?auto_19025 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19011 ) ) ( not ( = ?auto_19003 ?auto_19029 ) ) ( not ( = ?auto_19004 ?auto_19011 ) ) ( not ( = ?auto_19004 ?auto_19029 ) ) ( not ( = ?auto_19005 ?auto_19011 ) ) ( not ( = ?auto_19005 ?auto_19029 ) ) ( not ( = ?auto_19006 ?auto_19011 ) ) ( not ( = ?auto_19006 ?auto_19029 ) ) ( not ( = ?auto_19007 ?auto_19011 ) ) ( not ( = ?auto_19007 ?auto_19029 ) ) ( not ( = ?auto_19011 ?auto_19025 ) ) ( not ( = ?auto_19011 ?auto_19027 ) ) ( not ( = ?auto_19011 ?auto_19039 ) ) ( not ( = ?auto_19011 ?auto_19032 ) ) ( not ( = ?auto_19011 ?auto_19034 ) ) ( not ( = ?auto_19029 ?auto_19025 ) ) ( not ( = ?auto_19029 ?auto_19027 ) ) ( not ( = ?auto_19029 ?auto_19039 ) ) ( not ( = ?auto_19029 ?auto_19032 ) ) ( not ( = ?auto_19029 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19010 ) ) ( not ( = ?auto_19003 ?auto_19031 ) ) ( not ( = ?auto_19004 ?auto_19010 ) ) ( not ( = ?auto_19004 ?auto_19031 ) ) ( not ( = ?auto_19005 ?auto_19010 ) ) ( not ( = ?auto_19005 ?auto_19031 ) ) ( not ( = ?auto_19006 ?auto_19010 ) ) ( not ( = ?auto_19006 ?auto_19031 ) ) ( not ( = ?auto_19007 ?auto_19010 ) ) ( not ( = ?auto_19007 ?auto_19031 ) ) ( not ( = ?auto_19008 ?auto_19010 ) ) ( not ( = ?auto_19008 ?auto_19031 ) ) ( not ( = ?auto_19010 ?auto_19029 ) ) ( not ( = ?auto_19010 ?auto_19025 ) ) ( not ( = ?auto_19010 ?auto_19027 ) ) ( not ( = ?auto_19010 ?auto_19039 ) ) ( not ( = ?auto_19010 ?auto_19032 ) ) ( not ( = ?auto_19010 ?auto_19034 ) ) ( not ( = ?auto_19031 ?auto_19029 ) ) ( not ( = ?auto_19031 ?auto_19025 ) ) ( not ( = ?auto_19031 ?auto_19027 ) ) ( not ( = ?auto_19031 ?auto_19039 ) ) ( not ( = ?auto_19031 ?auto_19032 ) ) ( not ( = ?auto_19031 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19009 ) ) ( not ( = ?auto_19003 ?auto_19028 ) ) ( not ( = ?auto_19004 ?auto_19009 ) ) ( not ( = ?auto_19004 ?auto_19028 ) ) ( not ( = ?auto_19005 ?auto_19009 ) ) ( not ( = ?auto_19005 ?auto_19028 ) ) ( not ( = ?auto_19006 ?auto_19009 ) ) ( not ( = ?auto_19006 ?auto_19028 ) ) ( not ( = ?auto_19007 ?auto_19009 ) ) ( not ( = ?auto_19007 ?auto_19028 ) ) ( not ( = ?auto_19008 ?auto_19009 ) ) ( not ( = ?auto_19008 ?auto_19028 ) ) ( not ( = ?auto_19011 ?auto_19009 ) ) ( not ( = ?auto_19011 ?auto_19028 ) ) ( not ( = ?auto_19009 ?auto_19031 ) ) ( not ( = ?auto_19009 ?auto_19029 ) ) ( not ( = ?auto_19009 ?auto_19025 ) ) ( not ( = ?auto_19009 ?auto_19027 ) ) ( not ( = ?auto_19009 ?auto_19039 ) ) ( not ( = ?auto_19009 ?auto_19032 ) ) ( not ( = ?auto_19009 ?auto_19034 ) ) ( not ( = ?auto_19038 ?auto_19042 ) ) ( not ( = ?auto_19038 ?auto_19043 ) ) ( not ( = ?auto_19038 ?auto_19030 ) ) ( not ( = ?auto_19035 ?auto_19041 ) ) ( not ( = ?auto_19035 ?auto_19048 ) ) ( not ( = ?auto_19035 ?auto_19026 ) ) ( not ( = ?auto_19028 ?auto_19031 ) ) ( not ( = ?auto_19028 ?auto_19029 ) ) ( not ( = ?auto_19028 ?auto_19025 ) ) ( not ( = ?auto_19028 ?auto_19027 ) ) ( not ( = ?auto_19028 ?auto_19039 ) ) ( not ( = ?auto_19028 ?auto_19032 ) ) ( not ( = ?auto_19028 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19012 ) ) ( not ( = ?auto_19003 ?auto_19047 ) ) ( not ( = ?auto_19004 ?auto_19012 ) ) ( not ( = ?auto_19004 ?auto_19047 ) ) ( not ( = ?auto_19005 ?auto_19012 ) ) ( not ( = ?auto_19005 ?auto_19047 ) ) ( not ( = ?auto_19006 ?auto_19012 ) ) ( not ( = ?auto_19006 ?auto_19047 ) ) ( not ( = ?auto_19007 ?auto_19012 ) ) ( not ( = ?auto_19007 ?auto_19047 ) ) ( not ( = ?auto_19008 ?auto_19012 ) ) ( not ( = ?auto_19008 ?auto_19047 ) ) ( not ( = ?auto_19011 ?auto_19012 ) ) ( not ( = ?auto_19011 ?auto_19047 ) ) ( not ( = ?auto_19010 ?auto_19012 ) ) ( not ( = ?auto_19010 ?auto_19047 ) ) ( not ( = ?auto_19012 ?auto_19028 ) ) ( not ( = ?auto_19012 ?auto_19031 ) ) ( not ( = ?auto_19012 ?auto_19029 ) ) ( not ( = ?auto_19012 ?auto_19025 ) ) ( not ( = ?auto_19012 ?auto_19027 ) ) ( not ( = ?auto_19012 ?auto_19039 ) ) ( not ( = ?auto_19012 ?auto_19032 ) ) ( not ( = ?auto_19012 ?auto_19034 ) ) ( not ( = ?auto_19036 ?auto_19038 ) ) ( not ( = ?auto_19036 ?auto_19042 ) ) ( not ( = ?auto_19036 ?auto_19043 ) ) ( not ( = ?auto_19036 ?auto_19030 ) ) ( not ( = ?auto_19046 ?auto_19035 ) ) ( not ( = ?auto_19046 ?auto_19041 ) ) ( not ( = ?auto_19046 ?auto_19048 ) ) ( not ( = ?auto_19046 ?auto_19026 ) ) ( not ( = ?auto_19047 ?auto_19028 ) ) ( not ( = ?auto_19047 ?auto_19031 ) ) ( not ( = ?auto_19047 ?auto_19029 ) ) ( not ( = ?auto_19047 ?auto_19025 ) ) ( not ( = ?auto_19047 ?auto_19027 ) ) ( not ( = ?auto_19047 ?auto_19039 ) ) ( not ( = ?auto_19047 ?auto_19032 ) ) ( not ( = ?auto_19047 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19014 ) ) ( not ( = ?auto_19003 ?auto_19044 ) ) ( not ( = ?auto_19004 ?auto_19014 ) ) ( not ( = ?auto_19004 ?auto_19044 ) ) ( not ( = ?auto_19005 ?auto_19014 ) ) ( not ( = ?auto_19005 ?auto_19044 ) ) ( not ( = ?auto_19006 ?auto_19014 ) ) ( not ( = ?auto_19006 ?auto_19044 ) ) ( not ( = ?auto_19007 ?auto_19014 ) ) ( not ( = ?auto_19007 ?auto_19044 ) ) ( not ( = ?auto_19008 ?auto_19014 ) ) ( not ( = ?auto_19008 ?auto_19044 ) ) ( not ( = ?auto_19011 ?auto_19014 ) ) ( not ( = ?auto_19011 ?auto_19044 ) ) ( not ( = ?auto_19010 ?auto_19014 ) ) ( not ( = ?auto_19010 ?auto_19044 ) ) ( not ( = ?auto_19009 ?auto_19014 ) ) ( not ( = ?auto_19009 ?auto_19044 ) ) ( not ( = ?auto_19014 ?auto_19047 ) ) ( not ( = ?auto_19014 ?auto_19028 ) ) ( not ( = ?auto_19014 ?auto_19031 ) ) ( not ( = ?auto_19014 ?auto_19029 ) ) ( not ( = ?auto_19014 ?auto_19025 ) ) ( not ( = ?auto_19014 ?auto_19027 ) ) ( not ( = ?auto_19014 ?auto_19039 ) ) ( not ( = ?auto_19014 ?auto_19032 ) ) ( not ( = ?auto_19014 ?auto_19034 ) ) ( not ( = ?auto_19045 ?auto_19036 ) ) ( not ( = ?auto_19045 ?auto_19038 ) ) ( not ( = ?auto_19045 ?auto_19042 ) ) ( not ( = ?auto_19045 ?auto_19043 ) ) ( not ( = ?auto_19045 ?auto_19030 ) ) ( not ( = ?auto_19037 ?auto_19046 ) ) ( not ( = ?auto_19037 ?auto_19035 ) ) ( not ( = ?auto_19037 ?auto_19041 ) ) ( not ( = ?auto_19037 ?auto_19048 ) ) ( not ( = ?auto_19037 ?auto_19026 ) ) ( not ( = ?auto_19044 ?auto_19047 ) ) ( not ( = ?auto_19044 ?auto_19028 ) ) ( not ( = ?auto_19044 ?auto_19031 ) ) ( not ( = ?auto_19044 ?auto_19029 ) ) ( not ( = ?auto_19044 ?auto_19025 ) ) ( not ( = ?auto_19044 ?auto_19027 ) ) ( not ( = ?auto_19044 ?auto_19039 ) ) ( not ( = ?auto_19044 ?auto_19032 ) ) ( not ( = ?auto_19044 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19013 ) ) ( not ( = ?auto_19003 ?auto_19023 ) ) ( not ( = ?auto_19004 ?auto_19013 ) ) ( not ( = ?auto_19004 ?auto_19023 ) ) ( not ( = ?auto_19005 ?auto_19013 ) ) ( not ( = ?auto_19005 ?auto_19023 ) ) ( not ( = ?auto_19006 ?auto_19013 ) ) ( not ( = ?auto_19006 ?auto_19023 ) ) ( not ( = ?auto_19007 ?auto_19013 ) ) ( not ( = ?auto_19007 ?auto_19023 ) ) ( not ( = ?auto_19008 ?auto_19013 ) ) ( not ( = ?auto_19008 ?auto_19023 ) ) ( not ( = ?auto_19011 ?auto_19013 ) ) ( not ( = ?auto_19011 ?auto_19023 ) ) ( not ( = ?auto_19010 ?auto_19013 ) ) ( not ( = ?auto_19010 ?auto_19023 ) ) ( not ( = ?auto_19009 ?auto_19013 ) ) ( not ( = ?auto_19009 ?auto_19023 ) ) ( not ( = ?auto_19012 ?auto_19013 ) ) ( not ( = ?auto_19012 ?auto_19023 ) ) ( not ( = ?auto_19013 ?auto_19044 ) ) ( not ( = ?auto_19013 ?auto_19047 ) ) ( not ( = ?auto_19013 ?auto_19028 ) ) ( not ( = ?auto_19013 ?auto_19031 ) ) ( not ( = ?auto_19013 ?auto_19029 ) ) ( not ( = ?auto_19013 ?auto_19025 ) ) ( not ( = ?auto_19013 ?auto_19027 ) ) ( not ( = ?auto_19013 ?auto_19039 ) ) ( not ( = ?auto_19013 ?auto_19032 ) ) ( not ( = ?auto_19013 ?auto_19034 ) ) ( not ( = ?auto_19023 ?auto_19044 ) ) ( not ( = ?auto_19023 ?auto_19047 ) ) ( not ( = ?auto_19023 ?auto_19028 ) ) ( not ( = ?auto_19023 ?auto_19031 ) ) ( not ( = ?auto_19023 ?auto_19029 ) ) ( not ( = ?auto_19023 ?auto_19025 ) ) ( not ( = ?auto_19023 ?auto_19027 ) ) ( not ( = ?auto_19023 ?auto_19039 ) ) ( not ( = ?auto_19023 ?auto_19032 ) ) ( not ( = ?auto_19023 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19015 ) ) ( not ( = ?auto_19003 ?auto_19024 ) ) ( not ( = ?auto_19004 ?auto_19015 ) ) ( not ( = ?auto_19004 ?auto_19024 ) ) ( not ( = ?auto_19005 ?auto_19015 ) ) ( not ( = ?auto_19005 ?auto_19024 ) ) ( not ( = ?auto_19006 ?auto_19015 ) ) ( not ( = ?auto_19006 ?auto_19024 ) ) ( not ( = ?auto_19007 ?auto_19015 ) ) ( not ( = ?auto_19007 ?auto_19024 ) ) ( not ( = ?auto_19008 ?auto_19015 ) ) ( not ( = ?auto_19008 ?auto_19024 ) ) ( not ( = ?auto_19011 ?auto_19015 ) ) ( not ( = ?auto_19011 ?auto_19024 ) ) ( not ( = ?auto_19010 ?auto_19015 ) ) ( not ( = ?auto_19010 ?auto_19024 ) ) ( not ( = ?auto_19009 ?auto_19015 ) ) ( not ( = ?auto_19009 ?auto_19024 ) ) ( not ( = ?auto_19012 ?auto_19015 ) ) ( not ( = ?auto_19012 ?auto_19024 ) ) ( not ( = ?auto_19014 ?auto_19015 ) ) ( not ( = ?auto_19014 ?auto_19024 ) ) ( not ( = ?auto_19015 ?auto_19023 ) ) ( not ( = ?auto_19015 ?auto_19044 ) ) ( not ( = ?auto_19015 ?auto_19047 ) ) ( not ( = ?auto_19015 ?auto_19028 ) ) ( not ( = ?auto_19015 ?auto_19031 ) ) ( not ( = ?auto_19015 ?auto_19029 ) ) ( not ( = ?auto_19015 ?auto_19025 ) ) ( not ( = ?auto_19015 ?auto_19027 ) ) ( not ( = ?auto_19015 ?auto_19039 ) ) ( not ( = ?auto_19015 ?auto_19032 ) ) ( not ( = ?auto_19015 ?auto_19034 ) ) ( not ( = ?auto_19033 ?auto_19036 ) ) ( not ( = ?auto_19033 ?auto_19045 ) ) ( not ( = ?auto_19033 ?auto_19038 ) ) ( not ( = ?auto_19033 ?auto_19042 ) ) ( not ( = ?auto_19033 ?auto_19043 ) ) ( not ( = ?auto_19033 ?auto_19030 ) ) ( not ( = ?auto_19040 ?auto_19046 ) ) ( not ( = ?auto_19040 ?auto_19037 ) ) ( not ( = ?auto_19040 ?auto_19035 ) ) ( not ( = ?auto_19040 ?auto_19041 ) ) ( not ( = ?auto_19040 ?auto_19048 ) ) ( not ( = ?auto_19040 ?auto_19026 ) ) ( not ( = ?auto_19024 ?auto_19023 ) ) ( not ( = ?auto_19024 ?auto_19044 ) ) ( not ( = ?auto_19024 ?auto_19047 ) ) ( not ( = ?auto_19024 ?auto_19028 ) ) ( not ( = ?auto_19024 ?auto_19031 ) ) ( not ( = ?auto_19024 ?auto_19029 ) ) ( not ( = ?auto_19024 ?auto_19025 ) ) ( not ( = ?auto_19024 ?auto_19027 ) ) ( not ( = ?auto_19024 ?auto_19039 ) ) ( not ( = ?auto_19024 ?auto_19032 ) ) ( not ( = ?auto_19024 ?auto_19034 ) ) ( not ( = ?auto_19003 ?auto_19016 ) ) ( not ( = ?auto_19003 ?auto_19018 ) ) ( not ( = ?auto_19004 ?auto_19016 ) ) ( not ( = ?auto_19004 ?auto_19018 ) ) ( not ( = ?auto_19005 ?auto_19016 ) ) ( not ( = ?auto_19005 ?auto_19018 ) ) ( not ( = ?auto_19006 ?auto_19016 ) ) ( not ( = ?auto_19006 ?auto_19018 ) ) ( not ( = ?auto_19007 ?auto_19016 ) ) ( not ( = ?auto_19007 ?auto_19018 ) ) ( not ( = ?auto_19008 ?auto_19016 ) ) ( not ( = ?auto_19008 ?auto_19018 ) ) ( not ( = ?auto_19011 ?auto_19016 ) ) ( not ( = ?auto_19011 ?auto_19018 ) ) ( not ( = ?auto_19010 ?auto_19016 ) ) ( not ( = ?auto_19010 ?auto_19018 ) ) ( not ( = ?auto_19009 ?auto_19016 ) ) ( not ( = ?auto_19009 ?auto_19018 ) ) ( not ( = ?auto_19012 ?auto_19016 ) ) ( not ( = ?auto_19012 ?auto_19018 ) ) ( not ( = ?auto_19014 ?auto_19016 ) ) ( not ( = ?auto_19014 ?auto_19018 ) ) ( not ( = ?auto_19013 ?auto_19016 ) ) ( not ( = ?auto_19013 ?auto_19018 ) ) ( not ( = ?auto_19016 ?auto_19024 ) ) ( not ( = ?auto_19016 ?auto_19023 ) ) ( not ( = ?auto_19016 ?auto_19044 ) ) ( not ( = ?auto_19016 ?auto_19047 ) ) ( not ( = ?auto_19016 ?auto_19028 ) ) ( not ( = ?auto_19016 ?auto_19031 ) ) ( not ( = ?auto_19016 ?auto_19029 ) ) ( not ( = ?auto_19016 ?auto_19025 ) ) ( not ( = ?auto_19016 ?auto_19027 ) ) ( not ( = ?auto_19016 ?auto_19039 ) ) ( not ( = ?auto_19016 ?auto_19032 ) ) ( not ( = ?auto_19016 ?auto_19034 ) ) ( not ( = ?auto_19021 ?auto_19033 ) ) ( not ( = ?auto_19021 ?auto_19036 ) ) ( not ( = ?auto_19021 ?auto_19045 ) ) ( not ( = ?auto_19021 ?auto_19038 ) ) ( not ( = ?auto_19021 ?auto_19042 ) ) ( not ( = ?auto_19021 ?auto_19043 ) ) ( not ( = ?auto_19021 ?auto_19030 ) ) ( not ( = ?auto_19019 ?auto_19040 ) ) ( not ( = ?auto_19019 ?auto_19046 ) ) ( not ( = ?auto_19019 ?auto_19037 ) ) ( not ( = ?auto_19019 ?auto_19035 ) ) ( not ( = ?auto_19019 ?auto_19041 ) ) ( not ( = ?auto_19019 ?auto_19048 ) ) ( not ( = ?auto_19019 ?auto_19026 ) ) ( not ( = ?auto_19018 ?auto_19024 ) ) ( not ( = ?auto_19018 ?auto_19023 ) ) ( not ( = ?auto_19018 ?auto_19044 ) ) ( not ( = ?auto_19018 ?auto_19047 ) ) ( not ( = ?auto_19018 ?auto_19028 ) ) ( not ( = ?auto_19018 ?auto_19031 ) ) ( not ( = ?auto_19018 ?auto_19029 ) ) ( not ( = ?auto_19018 ?auto_19025 ) ) ( not ( = ?auto_19018 ?auto_19027 ) ) ( not ( = ?auto_19018 ?auto_19039 ) ) ( not ( = ?auto_19018 ?auto_19032 ) ) ( not ( = ?auto_19018 ?auto_19034 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19003 ?auto_19004 ?auto_19005 ?auto_19006 ?auto_19007 ?auto_19008 ?auto_19011 ?auto_19010 ?auto_19009 ?auto_19012 ?auto_19014 ?auto_19013 ?auto_19015 )
      ( MAKE-1CRATE ?auto_19015 ?auto_19016 )
      ( MAKE-13CRATE-VERIFY ?auto_19003 ?auto_19004 ?auto_19005 ?auto_19006 ?auto_19007 ?auto_19008 ?auto_19011 ?auto_19010 ?auto_19009 ?auto_19012 ?auto_19014 ?auto_19013 ?auto_19015 ?auto_19016 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19051 - SURFACE
      ?auto_19052 - SURFACE
    )
    :vars
    (
      ?auto_19053 - HOIST
      ?auto_19054 - PLACE
      ?auto_19056 - PLACE
      ?auto_19057 - HOIST
      ?auto_19058 - SURFACE
      ?auto_19055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19053 ?auto_19054 ) ( SURFACE-AT ?auto_19051 ?auto_19054 ) ( CLEAR ?auto_19051 ) ( IS-CRATE ?auto_19052 ) ( AVAILABLE ?auto_19053 ) ( not ( = ?auto_19056 ?auto_19054 ) ) ( HOIST-AT ?auto_19057 ?auto_19056 ) ( AVAILABLE ?auto_19057 ) ( SURFACE-AT ?auto_19052 ?auto_19056 ) ( ON ?auto_19052 ?auto_19058 ) ( CLEAR ?auto_19052 ) ( TRUCK-AT ?auto_19055 ?auto_19054 ) ( not ( = ?auto_19051 ?auto_19052 ) ) ( not ( = ?auto_19051 ?auto_19058 ) ) ( not ( = ?auto_19052 ?auto_19058 ) ) ( not ( = ?auto_19053 ?auto_19057 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19055 ?auto_19054 ?auto_19056 )
      ( !LIFT ?auto_19057 ?auto_19052 ?auto_19058 ?auto_19056 )
      ( !LOAD ?auto_19057 ?auto_19052 ?auto_19055 ?auto_19056 )
      ( !DRIVE ?auto_19055 ?auto_19056 ?auto_19054 )
      ( !UNLOAD ?auto_19053 ?auto_19052 ?auto_19055 ?auto_19054 )
      ( !DROP ?auto_19053 ?auto_19052 ?auto_19051 ?auto_19054 )
      ( MAKE-1CRATE-VERIFY ?auto_19051 ?auto_19052 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_19074 - SURFACE
      ?auto_19075 - SURFACE
      ?auto_19076 - SURFACE
      ?auto_19077 - SURFACE
      ?auto_19078 - SURFACE
      ?auto_19079 - SURFACE
      ?auto_19082 - SURFACE
      ?auto_19081 - SURFACE
      ?auto_19080 - SURFACE
      ?auto_19083 - SURFACE
      ?auto_19085 - SURFACE
      ?auto_19084 - SURFACE
      ?auto_19086 - SURFACE
      ?auto_19088 - SURFACE
      ?auto_19087 - SURFACE
    )
    :vars
    (
      ?auto_19089 - HOIST
      ?auto_19090 - PLACE
      ?auto_19092 - PLACE
      ?auto_19094 - HOIST
      ?auto_19093 - SURFACE
      ?auto_19119 - PLACE
      ?auto_19109 - HOIST
      ?auto_19104 - SURFACE
      ?auto_19099 - SURFACE
      ?auto_19101 - PLACE
      ?auto_19121 - HOIST
      ?auto_19103 - SURFACE
      ?auto_19118 - PLACE
      ?auto_19097 - HOIST
      ?auto_19111 - SURFACE
      ?auto_19106 - SURFACE
      ?auto_19113 - PLACE
      ?auto_19114 - HOIST
      ?auto_19117 - SURFACE
      ?auto_19115 - PLACE
      ?auto_19105 - HOIST
      ?auto_19116 - SURFACE
      ?auto_19110 - SURFACE
      ?auto_19107 - PLACE
      ?auto_19095 - HOIST
      ?auto_19108 - SURFACE
      ?auto_19098 - SURFACE
      ?auto_19112 - SURFACE
      ?auto_19120 - SURFACE
      ?auto_19096 - PLACE
      ?auto_19100 - HOIST
      ?auto_19102 - SURFACE
      ?auto_19091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19089 ?auto_19090 ) ( IS-CRATE ?auto_19087 ) ( not ( = ?auto_19092 ?auto_19090 ) ) ( HOIST-AT ?auto_19094 ?auto_19092 ) ( SURFACE-AT ?auto_19087 ?auto_19092 ) ( ON ?auto_19087 ?auto_19093 ) ( CLEAR ?auto_19087 ) ( not ( = ?auto_19088 ?auto_19087 ) ) ( not ( = ?auto_19088 ?auto_19093 ) ) ( not ( = ?auto_19087 ?auto_19093 ) ) ( not ( = ?auto_19089 ?auto_19094 ) ) ( IS-CRATE ?auto_19088 ) ( not ( = ?auto_19119 ?auto_19090 ) ) ( HOIST-AT ?auto_19109 ?auto_19119 ) ( AVAILABLE ?auto_19109 ) ( SURFACE-AT ?auto_19088 ?auto_19119 ) ( ON ?auto_19088 ?auto_19104 ) ( CLEAR ?auto_19088 ) ( not ( = ?auto_19086 ?auto_19088 ) ) ( not ( = ?auto_19086 ?auto_19104 ) ) ( not ( = ?auto_19088 ?auto_19104 ) ) ( not ( = ?auto_19089 ?auto_19109 ) ) ( IS-CRATE ?auto_19086 ) ( AVAILABLE ?auto_19094 ) ( SURFACE-AT ?auto_19086 ?auto_19092 ) ( ON ?auto_19086 ?auto_19099 ) ( CLEAR ?auto_19086 ) ( not ( = ?auto_19084 ?auto_19086 ) ) ( not ( = ?auto_19084 ?auto_19099 ) ) ( not ( = ?auto_19086 ?auto_19099 ) ) ( IS-CRATE ?auto_19084 ) ( not ( = ?auto_19101 ?auto_19090 ) ) ( HOIST-AT ?auto_19121 ?auto_19101 ) ( SURFACE-AT ?auto_19084 ?auto_19101 ) ( ON ?auto_19084 ?auto_19103 ) ( CLEAR ?auto_19084 ) ( not ( = ?auto_19085 ?auto_19084 ) ) ( not ( = ?auto_19085 ?auto_19103 ) ) ( not ( = ?auto_19084 ?auto_19103 ) ) ( not ( = ?auto_19089 ?auto_19121 ) ) ( IS-CRATE ?auto_19085 ) ( not ( = ?auto_19118 ?auto_19090 ) ) ( HOIST-AT ?auto_19097 ?auto_19118 ) ( AVAILABLE ?auto_19097 ) ( SURFACE-AT ?auto_19085 ?auto_19118 ) ( ON ?auto_19085 ?auto_19111 ) ( CLEAR ?auto_19085 ) ( not ( = ?auto_19083 ?auto_19085 ) ) ( not ( = ?auto_19083 ?auto_19111 ) ) ( not ( = ?auto_19085 ?auto_19111 ) ) ( not ( = ?auto_19089 ?auto_19097 ) ) ( IS-CRATE ?auto_19083 ) ( AVAILABLE ?auto_19121 ) ( SURFACE-AT ?auto_19083 ?auto_19101 ) ( ON ?auto_19083 ?auto_19106 ) ( CLEAR ?auto_19083 ) ( not ( = ?auto_19080 ?auto_19083 ) ) ( not ( = ?auto_19080 ?auto_19106 ) ) ( not ( = ?auto_19083 ?auto_19106 ) ) ( IS-CRATE ?auto_19080 ) ( not ( = ?auto_19113 ?auto_19090 ) ) ( HOIST-AT ?auto_19114 ?auto_19113 ) ( AVAILABLE ?auto_19114 ) ( SURFACE-AT ?auto_19080 ?auto_19113 ) ( ON ?auto_19080 ?auto_19117 ) ( CLEAR ?auto_19080 ) ( not ( = ?auto_19081 ?auto_19080 ) ) ( not ( = ?auto_19081 ?auto_19117 ) ) ( not ( = ?auto_19080 ?auto_19117 ) ) ( not ( = ?auto_19089 ?auto_19114 ) ) ( IS-CRATE ?auto_19081 ) ( not ( = ?auto_19115 ?auto_19090 ) ) ( HOIST-AT ?auto_19105 ?auto_19115 ) ( SURFACE-AT ?auto_19081 ?auto_19115 ) ( ON ?auto_19081 ?auto_19116 ) ( CLEAR ?auto_19081 ) ( not ( = ?auto_19082 ?auto_19081 ) ) ( not ( = ?auto_19082 ?auto_19116 ) ) ( not ( = ?auto_19081 ?auto_19116 ) ) ( not ( = ?auto_19089 ?auto_19105 ) ) ( IS-CRATE ?auto_19082 ) ( SURFACE-AT ?auto_19082 ?auto_19115 ) ( ON ?auto_19082 ?auto_19110 ) ( CLEAR ?auto_19082 ) ( not ( = ?auto_19079 ?auto_19082 ) ) ( not ( = ?auto_19079 ?auto_19110 ) ) ( not ( = ?auto_19082 ?auto_19110 ) ) ( IS-CRATE ?auto_19079 ) ( not ( = ?auto_19107 ?auto_19090 ) ) ( HOIST-AT ?auto_19095 ?auto_19107 ) ( SURFACE-AT ?auto_19079 ?auto_19107 ) ( ON ?auto_19079 ?auto_19108 ) ( CLEAR ?auto_19079 ) ( not ( = ?auto_19078 ?auto_19079 ) ) ( not ( = ?auto_19078 ?auto_19108 ) ) ( not ( = ?auto_19079 ?auto_19108 ) ) ( not ( = ?auto_19089 ?auto_19095 ) ) ( IS-CRATE ?auto_19078 ) ( SURFACE-AT ?auto_19078 ?auto_19107 ) ( ON ?auto_19078 ?auto_19098 ) ( CLEAR ?auto_19078 ) ( not ( = ?auto_19077 ?auto_19078 ) ) ( not ( = ?auto_19077 ?auto_19098 ) ) ( not ( = ?auto_19078 ?auto_19098 ) ) ( IS-CRATE ?auto_19077 ) ( AVAILABLE ?auto_19095 ) ( SURFACE-AT ?auto_19077 ?auto_19107 ) ( ON ?auto_19077 ?auto_19112 ) ( CLEAR ?auto_19077 ) ( not ( = ?auto_19076 ?auto_19077 ) ) ( not ( = ?auto_19076 ?auto_19112 ) ) ( not ( = ?auto_19077 ?auto_19112 ) ) ( IS-CRATE ?auto_19076 ) ( AVAILABLE ?auto_19105 ) ( SURFACE-AT ?auto_19076 ?auto_19115 ) ( ON ?auto_19076 ?auto_19120 ) ( CLEAR ?auto_19076 ) ( not ( = ?auto_19075 ?auto_19076 ) ) ( not ( = ?auto_19075 ?auto_19120 ) ) ( not ( = ?auto_19076 ?auto_19120 ) ) ( SURFACE-AT ?auto_19074 ?auto_19090 ) ( CLEAR ?auto_19074 ) ( IS-CRATE ?auto_19075 ) ( AVAILABLE ?auto_19089 ) ( not ( = ?auto_19096 ?auto_19090 ) ) ( HOIST-AT ?auto_19100 ?auto_19096 ) ( AVAILABLE ?auto_19100 ) ( SURFACE-AT ?auto_19075 ?auto_19096 ) ( ON ?auto_19075 ?auto_19102 ) ( CLEAR ?auto_19075 ) ( TRUCK-AT ?auto_19091 ?auto_19090 ) ( not ( = ?auto_19074 ?auto_19075 ) ) ( not ( = ?auto_19074 ?auto_19102 ) ) ( not ( = ?auto_19075 ?auto_19102 ) ) ( not ( = ?auto_19089 ?auto_19100 ) ) ( not ( = ?auto_19074 ?auto_19076 ) ) ( not ( = ?auto_19074 ?auto_19120 ) ) ( not ( = ?auto_19076 ?auto_19102 ) ) ( not ( = ?auto_19115 ?auto_19096 ) ) ( not ( = ?auto_19105 ?auto_19100 ) ) ( not ( = ?auto_19120 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19077 ) ) ( not ( = ?auto_19074 ?auto_19112 ) ) ( not ( = ?auto_19075 ?auto_19077 ) ) ( not ( = ?auto_19075 ?auto_19112 ) ) ( not ( = ?auto_19077 ?auto_19120 ) ) ( not ( = ?auto_19077 ?auto_19102 ) ) ( not ( = ?auto_19107 ?auto_19115 ) ) ( not ( = ?auto_19107 ?auto_19096 ) ) ( not ( = ?auto_19095 ?auto_19105 ) ) ( not ( = ?auto_19095 ?auto_19100 ) ) ( not ( = ?auto_19112 ?auto_19120 ) ) ( not ( = ?auto_19112 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19078 ) ) ( not ( = ?auto_19074 ?auto_19098 ) ) ( not ( = ?auto_19075 ?auto_19078 ) ) ( not ( = ?auto_19075 ?auto_19098 ) ) ( not ( = ?auto_19076 ?auto_19078 ) ) ( not ( = ?auto_19076 ?auto_19098 ) ) ( not ( = ?auto_19078 ?auto_19112 ) ) ( not ( = ?auto_19078 ?auto_19120 ) ) ( not ( = ?auto_19078 ?auto_19102 ) ) ( not ( = ?auto_19098 ?auto_19112 ) ) ( not ( = ?auto_19098 ?auto_19120 ) ) ( not ( = ?auto_19098 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19079 ) ) ( not ( = ?auto_19074 ?auto_19108 ) ) ( not ( = ?auto_19075 ?auto_19079 ) ) ( not ( = ?auto_19075 ?auto_19108 ) ) ( not ( = ?auto_19076 ?auto_19079 ) ) ( not ( = ?auto_19076 ?auto_19108 ) ) ( not ( = ?auto_19077 ?auto_19079 ) ) ( not ( = ?auto_19077 ?auto_19108 ) ) ( not ( = ?auto_19079 ?auto_19098 ) ) ( not ( = ?auto_19079 ?auto_19112 ) ) ( not ( = ?auto_19079 ?auto_19120 ) ) ( not ( = ?auto_19079 ?auto_19102 ) ) ( not ( = ?auto_19108 ?auto_19098 ) ) ( not ( = ?auto_19108 ?auto_19112 ) ) ( not ( = ?auto_19108 ?auto_19120 ) ) ( not ( = ?auto_19108 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19082 ) ) ( not ( = ?auto_19074 ?auto_19110 ) ) ( not ( = ?auto_19075 ?auto_19082 ) ) ( not ( = ?auto_19075 ?auto_19110 ) ) ( not ( = ?auto_19076 ?auto_19082 ) ) ( not ( = ?auto_19076 ?auto_19110 ) ) ( not ( = ?auto_19077 ?auto_19082 ) ) ( not ( = ?auto_19077 ?auto_19110 ) ) ( not ( = ?auto_19078 ?auto_19082 ) ) ( not ( = ?auto_19078 ?auto_19110 ) ) ( not ( = ?auto_19082 ?auto_19108 ) ) ( not ( = ?auto_19082 ?auto_19098 ) ) ( not ( = ?auto_19082 ?auto_19112 ) ) ( not ( = ?auto_19082 ?auto_19120 ) ) ( not ( = ?auto_19082 ?auto_19102 ) ) ( not ( = ?auto_19110 ?auto_19108 ) ) ( not ( = ?auto_19110 ?auto_19098 ) ) ( not ( = ?auto_19110 ?auto_19112 ) ) ( not ( = ?auto_19110 ?auto_19120 ) ) ( not ( = ?auto_19110 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19081 ) ) ( not ( = ?auto_19074 ?auto_19116 ) ) ( not ( = ?auto_19075 ?auto_19081 ) ) ( not ( = ?auto_19075 ?auto_19116 ) ) ( not ( = ?auto_19076 ?auto_19081 ) ) ( not ( = ?auto_19076 ?auto_19116 ) ) ( not ( = ?auto_19077 ?auto_19081 ) ) ( not ( = ?auto_19077 ?auto_19116 ) ) ( not ( = ?auto_19078 ?auto_19081 ) ) ( not ( = ?auto_19078 ?auto_19116 ) ) ( not ( = ?auto_19079 ?auto_19081 ) ) ( not ( = ?auto_19079 ?auto_19116 ) ) ( not ( = ?auto_19081 ?auto_19110 ) ) ( not ( = ?auto_19081 ?auto_19108 ) ) ( not ( = ?auto_19081 ?auto_19098 ) ) ( not ( = ?auto_19081 ?auto_19112 ) ) ( not ( = ?auto_19081 ?auto_19120 ) ) ( not ( = ?auto_19081 ?auto_19102 ) ) ( not ( = ?auto_19116 ?auto_19110 ) ) ( not ( = ?auto_19116 ?auto_19108 ) ) ( not ( = ?auto_19116 ?auto_19098 ) ) ( not ( = ?auto_19116 ?auto_19112 ) ) ( not ( = ?auto_19116 ?auto_19120 ) ) ( not ( = ?auto_19116 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19080 ) ) ( not ( = ?auto_19074 ?auto_19117 ) ) ( not ( = ?auto_19075 ?auto_19080 ) ) ( not ( = ?auto_19075 ?auto_19117 ) ) ( not ( = ?auto_19076 ?auto_19080 ) ) ( not ( = ?auto_19076 ?auto_19117 ) ) ( not ( = ?auto_19077 ?auto_19080 ) ) ( not ( = ?auto_19077 ?auto_19117 ) ) ( not ( = ?auto_19078 ?auto_19080 ) ) ( not ( = ?auto_19078 ?auto_19117 ) ) ( not ( = ?auto_19079 ?auto_19080 ) ) ( not ( = ?auto_19079 ?auto_19117 ) ) ( not ( = ?auto_19082 ?auto_19080 ) ) ( not ( = ?auto_19082 ?auto_19117 ) ) ( not ( = ?auto_19080 ?auto_19116 ) ) ( not ( = ?auto_19080 ?auto_19110 ) ) ( not ( = ?auto_19080 ?auto_19108 ) ) ( not ( = ?auto_19080 ?auto_19098 ) ) ( not ( = ?auto_19080 ?auto_19112 ) ) ( not ( = ?auto_19080 ?auto_19120 ) ) ( not ( = ?auto_19080 ?auto_19102 ) ) ( not ( = ?auto_19113 ?auto_19115 ) ) ( not ( = ?auto_19113 ?auto_19107 ) ) ( not ( = ?auto_19113 ?auto_19096 ) ) ( not ( = ?auto_19114 ?auto_19105 ) ) ( not ( = ?auto_19114 ?auto_19095 ) ) ( not ( = ?auto_19114 ?auto_19100 ) ) ( not ( = ?auto_19117 ?auto_19116 ) ) ( not ( = ?auto_19117 ?auto_19110 ) ) ( not ( = ?auto_19117 ?auto_19108 ) ) ( not ( = ?auto_19117 ?auto_19098 ) ) ( not ( = ?auto_19117 ?auto_19112 ) ) ( not ( = ?auto_19117 ?auto_19120 ) ) ( not ( = ?auto_19117 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19083 ) ) ( not ( = ?auto_19074 ?auto_19106 ) ) ( not ( = ?auto_19075 ?auto_19083 ) ) ( not ( = ?auto_19075 ?auto_19106 ) ) ( not ( = ?auto_19076 ?auto_19083 ) ) ( not ( = ?auto_19076 ?auto_19106 ) ) ( not ( = ?auto_19077 ?auto_19083 ) ) ( not ( = ?auto_19077 ?auto_19106 ) ) ( not ( = ?auto_19078 ?auto_19083 ) ) ( not ( = ?auto_19078 ?auto_19106 ) ) ( not ( = ?auto_19079 ?auto_19083 ) ) ( not ( = ?auto_19079 ?auto_19106 ) ) ( not ( = ?auto_19082 ?auto_19083 ) ) ( not ( = ?auto_19082 ?auto_19106 ) ) ( not ( = ?auto_19081 ?auto_19083 ) ) ( not ( = ?auto_19081 ?auto_19106 ) ) ( not ( = ?auto_19083 ?auto_19117 ) ) ( not ( = ?auto_19083 ?auto_19116 ) ) ( not ( = ?auto_19083 ?auto_19110 ) ) ( not ( = ?auto_19083 ?auto_19108 ) ) ( not ( = ?auto_19083 ?auto_19098 ) ) ( not ( = ?auto_19083 ?auto_19112 ) ) ( not ( = ?auto_19083 ?auto_19120 ) ) ( not ( = ?auto_19083 ?auto_19102 ) ) ( not ( = ?auto_19101 ?auto_19113 ) ) ( not ( = ?auto_19101 ?auto_19115 ) ) ( not ( = ?auto_19101 ?auto_19107 ) ) ( not ( = ?auto_19101 ?auto_19096 ) ) ( not ( = ?auto_19121 ?auto_19114 ) ) ( not ( = ?auto_19121 ?auto_19105 ) ) ( not ( = ?auto_19121 ?auto_19095 ) ) ( not ( = ?auto_19121 ?auto_19100 ) ) ( not ( = ?auto_19106 ?auto_19117 ) ) ( not ( = ?auto_19106 ?auto_19116 ) ) ( not ( = ?auto_19106 ?auto_19110 ) ) ( not ( = ?auto_19106 ?auto_19108 ) ) ( not ( = ?auto_19106 ?auto_19098 ) ) ( not ( = ?auto_19106 ?auto_19112 ) ) ( not ( = ?auto_19106 ?auto_19120 ) ) ( not ( = ?auto_19106 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19085 ) ) ( not ( = ?auto_19074 ?auto_19111 ) ) ( not ( = ?auto_19075 ?auto_19085 ) ) ( not ( = ?auto_19075 ?auto_19111 ) ) ( not ( = ?auto_19076 ?auto_19085 ) ) ( not ( = ?auto_19076 ?auto_19111 ) ) ( not ( = ?auto_19077 ?auto_19085 ) ) ( not ( = ?auto_19077 ?auto_19111 ) ) ( not ( = ?auto_19078 ?auto_19085 ) ) ( not ( = ?auto_19078 ?auto_19111 ) ) ( not ( = ?auto_19079 ?auto_19085 ) ) ( not ( = ?auto_19079 ?auto_19111 ) ) ( not ( = ?auto_19082 ?auto_19085 ) ) ( not ( = ?auto_19082 ?auto_19111 ) ) ( not ( = ?auto_19081 ?auto_19085 ) ) ( not ( = ?auto_19081 ?auto_19111 ) ) ( not ( = ?auto_19080 ?auto_19085 ) ) ( not ( = ?auto_19080 ?auto_19111 ) ) ( not ( = ?auto_19085 ?auto_19106 ) ) ( not ( = ?auto_19085 ?auto_19117 ) ) ( not ( = ?auto_19085 ?auto_19116 ) ) ( not ( = ?auto_19085 ?auto_19110 ) ) ( not ( = ?auto_19085 ?auto_19108 ) ) ( not ( = ?auto_19085 ?auto_19098 ) ) ( not ( = ?auto_19085 ?auto_19112 ) ) ( not ( = ?auto_19085 ?auto_19120 ) ) ( not ( = ?auto_19085 ?auto_19102 ) ) ( not ( = ?auto_19118 ?auto_19101 ) ) ( not ( = ?auto_19118 ?auto_19113 ) ) ( not ( = ?auto_19118 ?auto_19115 ) ) ( not ( = ?auto_19118 ?auto_19107 ) ) ( not ( = ?auto_19118 ?auto_19096 ) ) ( not ( = ?auto_19097 ?auto_19121 ) ) ( not ( = ?auto_19097 ?auto_19114 ) ) ( not ( = ?auto_19097 ?auto_19105 ) ) ( not ( = ?auto_19097 ?auto_19095 ) ) ( not ( = ?auto_19097 ?auto_19100 ) ) ( not ( = ?auto_19111 ?auto_19106 ) ) ( not ( = ?auto_19111 ?auto_19117 ) ) ( not ( = ?auto_19111 ?auto_19116 ) ) ( not ( = ?auto_19111 ?auto_19110 ) ) ( not ( = ?auto_19111 ?auto_19108 ) ) ( not ( = ?auto_19111 ?auto_19098 ) ) ( not ( = ?auto_19111 ?auto_19112 ) ) ( not ( = ?auto_19111 ?auto_19120 ) ) ( not ( = ?auto_19111 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19084 ) ) ( not ( = ?auto_19074 ?auto_19103 ) ) ( not ( = ?auto_19075 ?auto_19084 ) ) ( not ( = ?auto_19075 ?auto_19103 ) ) ( not ( = ?auto_19076 ?auto_19084 ) ) ( not ( = ?auto_19076 ?auto_19103 ) ) ( not ( = ?auto_19077 ?auto_19084 ) ) ( not ( = ?auto_19077 ?auto_19103 ) ) ( not ( = ?auto_19078 ?auto_19084 ) ) ( not ( = ?auto_19078 ?auto_19103 ) ) ( not ( = ?auto_19079 ?auto_19084 ) ) ( not ( = ?auto_19079 ?auto_19103 ) ) ( not ( = ?auto_19082 ?auto_19084 ) ) ( not ( = ?auto_19082 ?auto_19103 ) ) ( not ( = ?auto_19081 ?auto_19084 ) ) ( not ( = ?auto_19081 ?auto_19103 ) ) ( not ( = ?auto_19080 ?auto_19084 ) ) ( not ( = ?auto_19080 ?auto_19103 ) ) ( not ( = ?auto_19083 ?auto_19084 ) ) ( not ( = ?auto_19083 ?auto_19103 ) ) ( not ( = ?auto_19084 ?auto_19111 ) ) ( not ( = ?auto_19084 ?auto_19106 ) ) ( not ( = ?auto_19084 ?auto_19117 ) ) ( not ( = ?auto_19084 ?auto_19116 ) ) ( not ( = ?auto_19084 ?auto_19110 ) ) ( not ( = ?auto_19084 ?auto_19108 ) ) ( not ( = ?auto_19084 ?auto_19098 ) ) ( not ( = ?auto_19084 ?auto_19112 ) ) ( not ( = ?auto_19084 ?auto_19120 ) ) ( not ( = ?auto_19084 ?auto_19102 ) ) ( not ( = ?auto_19103 ?auto_19111 ) ) ( not ( = ?auto_19103 ?auto_19106 ) ) ( not ( = ?auto_19103 ?auto_19117 ) ) ( not ( = ?auto_19103 ?auto_19116 ) ) ( not ( = ?auto_19103 ?auto_19110 ) ) ( not ( = ?auto_19103 ?auto_19108 ) ) ( not ( = ?auto_19103 ?auto_19098 ) ) ( not ( = ?auto_19103 ?auto_19112 ) ) ( not ( = ?auto_19103 ?auto_19120 ) ) ( not ( = ?auto_19103 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19086 ) ) ( not ( = ?auto_19074 ?auto_19099 ) ) ( not ( = ?auto_19075 ?auto_19086 ) ) ( not ( = ?auto_19075 ?auto_19099 ) ) ( not ( = ?auto_19076 ?auto_19086 ) ) ( not ( = ?auto_19076 ?auto_19099 ) ) ( not ( = ?auto_19077 ?auto_19086 ) ) ( not ( = ?auto_19077 ?auto_19099 ) ) ( not ( = ?auto_19078 ?auto_19086 ) ) ( not ( = ?auto_19078 ?auto_19099 ) ) ( not ( = ?auto_19079 ?auto_19086 ) ) ( not ( = ?auto_19079 ?auto_19099 ) ) ( not ( = ?auto_19082 ?auto_19086 ) ) ( not ( = ?auto_19082 ?auto_19099 ) ) ( not ( = ?auto_19081 ?auto_19086 ) ) ( not ( = ?auto_19081 ?auto_19099 ) ) ( not ( = ?auto_19080 ?auto_19086 ) ) ( not ( = ?auto_19080 ?auto_19099 ) ) ( not ( = ?auto_19083 ?auto_19086 ) ) ( not ( = ?auto_19083 ?auto_19099 ) ) ( not ( = ?auto_19085 ?auto_19086 ) ) ( not ( = ?auto_19085 ?auto_19099 ) ) ( not ( = ?auto_19086 ?auto_19103 ) ) ( not ( = ?auto_19086 ?auto_19111 ) ) ( not ( = ?auto_19086 ?auto_19106 ) ) ( not ( = ?auto_19086 ?auto_19117 ) ) ( not ( = ?auto_19086 ?auto_19116 ) ) ( not ( = ?auto_19086 ?auto_19110 ) ) ( not ( = ?auto_19086 ?auto_19108 ) ) ( not ( = ?auto_19086 ?auto_19098 ) ) ( not ( = ?auto_19086 ?auto_19112 ) ) ( not ( = ?auto_19086 ?auto_19120 ) ) ( not ( = ?auto_19086 ?auto_19102 ) ) ( not ( = ?auto_19092 ?auto_19101 ) ) ( not ( = ?auto_19092 ?auto_19118 ) ) ( not ( = ?auto_19092 ?auto_19113 ) ) ( not ( = ?auto_19092 ?auto_19115 ) ) ( not ( = ?auto_19092 ?auto_19107 ) ) ( not ( = ?auto_19092 ?auto_19096 ) ) ( not ( = ?auto_19094 ?auto_19121 ) ) ( not ( = ?auto_19094 ?auto_19097 ) ) ( not ( = ?auto_19094 ?auto_19114 ) ) ( not ( = ?auto_19094 ?auto_19105 ) ) ( not ( = ?auto_19094 ?auto_19095 ) ) ( not ( = ?auto_19094 ?auto_19100 ) ) ( not ( = ?auto_19099 ?auto_19103 ) ) ( not ( = ?auto_19099 ?auto_19111 ) ) ( not ( = ?auto_19099 ?auto_19106 ) ) ( not ( = ?auto_19099 ?auto_19117 ) ) ( not ( = ?auto_19099 ?auto_19116 ) ) ( not ( = ?auto_19099 ?auto_19110 ) ) ( not ( = ?auto_19099 ?auto_19108 ) ) ( not ( = ?auto_19099 ?auto_19098 ) ) ( not ( = ?auto_19099 ?auto_19112 ) ) ( not ( = ?auto_19099 ?auto_19120 ) ) ( not ( = ?auto_19099 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19088 ) ) ( not ( = ?auto_19074 ?auto_19104 ) ) ( not ( = ?auto_19075 ?auto_19088 ) ) ( not ( = ?auto_19075 ?auto_19104 ) ) ( not ( = ?auto_19076 ?auto_19088 ) ) ( not ( = ?auto_19076 ?auto_19104 ) ) ( not ( = ?auto_19077 ?auto_19088 ) ) ( not ( = ?auto_19077 ?auto_19104 ) ) ( not ( = ?auto_19078 ?auto_19088 ) ) ( not ( = ?auto_19078 ?auto_19104 ) ) ( not ( = ?auto_19079 ?auto_19088 ) ) ( not ( = ?auto_19079 ?auto_19104 ) ) ( not ( = ?auto_19082 ?auto_19088 ) ) ( not ( = ?auto_19082 ?auto_19104 ) ) ( not ( = ?auto_19081 ?auto_19088 ) ) ( not ( = ?auto_19081 ?auto_19104 ) ) ( not ( = ?auto_19080 ?auto_19088 ) ) ( not ( = ?auto_19080 ?auto_19104 ) ) ( not ( = ?auto_19083 ?auto_19088 ) ) ( not ( = ?auto_19083 ?auto_19104 ) ) ( not ( = ?auto_19085 ?auto_19088 ) ) ( not ( = ?auto_19085 ?auto_19104 ) ) ( not ( = ?auto_19084 ?auto_19088 ) ) ( not ( = ?auto_19084 ?auto_19104 ) ) ( not ( = ?auto_19088 ?auto_19099 ) ) ( not ( = ?auto_19088 ?auto_19103 ) ) ( not ( = ?auto_19088 ?auto_19111 ) ) ( not ( = ?auto_19088 ?auto_19106 ) ) ( not ( = ?auto_19088 ?auto_19117 ) ) ( not ( = ?auto_19088 ?auto_19116 ) ) ( not ( = ?auto_19088 ?auto_19110 ) ) ( not ( = ?auto_19088 ?auto_19108 ) ) ( not ( = ?auto_19088 ?auto_19098 ) ) ( not ( = ?auto_19088 ?auto_19112 ) ) ( not ( = ?auto_19088 ?auto_19120 ) ) ( not ( = ?auto_19088 ?auto_19102 ) ) ( not ( = ?auto_19119 ?auto_19092 ) ) ( not ( = ?auto_19119 ?auto_19101 ) ) ( not ( = ?auto_19119 ?auto_19118 ) ) ( not ( = ?auto_19119 ?auto_19113 ) ) ( not ( = ?auto_19119 ?auto_19115 ) ) ( not ( = ?auto_19119 ?auto_19107 ) ) ( not ( = ?auto_19119 ?auto_19096 ) ) ( not ( = ?auto_19109 ?auto_19094 ) ) ( not ( = ?auto_19109 ?auto_19121 ) ) ( not ( = ?auto_19109 ?auto_19097 ) ) ( not ( = ?auto_19109 ?auto_19114 ) ) ( not ( = ?auto_19109 ?auto_19105 ) ) ( not ( = ?auto_19109 ?auto_19095 ) ) ( not ( = ?auto_19109 ?auto_19100 ) ) ( not ( = ?auto_19104 ?auto_19099 ) ) ( not ( = ?auto_19104 ?auto_19103 ) ) ( not ( = ?auto_19104 ?auto_19111 ) ) ( not ( = ?auto_19104 ?auto_19106 ) ) ( not ( = ?auto_19104 ?auto_19117 ) ) ( not ( = ?auto_19104 ?auto_19116 ) ) ( not ( = ?auto_19104 ?auto_19110 ) ) ( not ( = ?auto_19104 ?auto_19108 ) ) ( not ( = ?auto_19104 ?auto_19098 ) ) ( not ( = ?auto_19104 ?auto_19112 ) ) ( not ( = ?auto_19104 ?auto_19120 ) ) ( not ( = ?auto_19104 ?auto_19102 ) ) ( not ( = ?auto_19074 ?auto_19087 ) ) ( not ( = ?auto_19074 ?auto_19093 ) ) ( not ( = ?auto_19075 ?auto_19087 ) ) ( not ( = ?auto_19075 ?auto_19093 ) ) ( not ( = ?auto_19076 ?auto_19087 ) ) ( not ( = ?auto_19076 ?auto_19093 ) ) ( not ( = ?auto_19077 ?auto_19087 ) ) ( not ( = ?auto_19077 ?auto_19093 ) ) ( not ( = ?auto_19078 ?auto_19087 ) ) ( not ( = ?auto_19078 ?auto_19093 ) ) ( not ( = ?auto_19079 ?auto_19087 ) ) ( not ( = ?auto_19079 ?auto_19093 ) ) ( not ( = ?auto_19082 ?auto_19087 ) ) ( not ( = ?auto_19082 ?auto_19093 ) ) ( not ( = ?auto_19081 ?auto_19087 ) ) ( not ( = ?auto_19081 ?auto_19093 ) ) ( not ( = ?auto_19080 ?auto_19087 ) ) ( not ( = ?auto_19080 ?auto_19093 ) ) ( not ( = ?auto_19083 ?auto_19087 ) ) ( not ( = ?auto_19083 ?auto_19093 ) ) ( not ( = ?auto_19085 ?auto_19087 ) ) ( not ( = ?auto_19085 ?auto_19093 ) ) ( not ( = ?auto_19084 ?auto_19087 ) ) ( not ( = ?auto_19084 ?auto_19093 ) ) ( not ( = ?auto_19086 ?auto_19087 ) ) ( not ( = ?auto_19086 ?auto_19093 ) ) ( not ( = ?auto_19087 ?auto_19104 ) ) ( not ( = ?auto_19087 ?auto_19099 ) ) ( not ( = ?auto_19087 ?auto_19103 ) ) ( not ( = ?auto_19087 ?auto_19111 ) ) ( not ( = ?auto_19087 ?auto_19106 ) ) ( not ( = ?auto_19087 ?auto_19117 ) ) ( not ( = ?auto_19087 ?auto_19116 ) ) ( not ( = ?auto_19087 ?auto_19110 ) ) ( not ( = ?auto_19087 ?auto_19108 ) ) ( not ( = ?auto_19087 ?auto_19098 ) ) ( not ( = ?auto_19087 ?auto_19112 ) ) ( not ( = ?auto_19087 ?auto_19120 ) ) ( not ( = ?auto_19087 ?auto_19102 ) ) ( not ( = ?auto_19093 ?auto_19104 ) ) ( not ( = ?auto_19093 ?auto_19099 ) ) ( not ( = ?auto_19093 ?auto_19103 ) ) ( not ( = ?auto_19093 ?auto_19111 ) ) ( not ( = ?auto_19093 ?auto_19106 ) ) ( not ( = ?auto_19093 ?auto_19117 ) ) ( not ( = ?auto_19093 ?auto_19116 ) ) ( not ( = ?auto_19093 ?auto_19110 ) ) ( not ( = ?auto_19093 ?auto_19108 ) ) ( not ( = ?auto_19093 ?auto_19098 ) ) ( not ( = ?auto_19093 ?auto_19112 ) ) ( not ( = ?auto_19093 ?auto_19120 ) ) ( not ( = ?auto_19093 ?auto_19102 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19074 ?auto_19075 ?auto_19076 ?auto_19077 ?auto_19078 ?auto_19079 ?auto_19082 ?auto_19081 ?auto_19080 ?auto_19083 ?auto_19085 ?auto_19084 ?auto_19086 ?auto_19088 )
      ( MAKE-1CRATE ?auto_19088 ?auto_19087 )
      ( MAKE-14CRATE-VERIFY ?auto_19074 ?auto_19075 ?auto_19076 ?auto_19077 ?auto_19078 ?auto_19079 ?auto_19082 ?auto_19081 ?auto_19080 ?auto_19083 ?auto_19085 ?auto_19084 ?auto_19086 ?auto_19088 ?auto_19087 ) )
  )

)

