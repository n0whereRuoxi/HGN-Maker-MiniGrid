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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3401 - SURFACE
      ?auto_3402 - SURFACE
    )
    :vars
    (
      ?auto_3403 - HOIST
      ?auto_3404 - PLACE
      ?auto_3406 - PLACE
      ?auto_3407 - HOIST
      ?auto_3408 - SURFACE
      ?auto_3405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3403 ?auto_3404 ) ( SURFACE-AT ?auto_3401 ?auto_3404 ) ( CLEAR ?auto_3401 ) ( IS-CRATE ?auto_3402 ) ( AVAILABLE ?auto_3403 ) ( not ( = ?auto_3406 ?auto_3404 ) ) ( HOIST-AT ?auto_3407 ?auto_3406 ) ( AVAILABLE ?auto_3407 ) ( SURFACE-AT ?auto_3402 ?auto_3406 ) ( ON ?auto_3402 ?auto_3408 ) ( CLEAR ?auto_3402 ) ( TRUCK-AT ?auto_3405 ?auto_3404 ) ( not ( = ?auto_3401 ?auto_3402 ) ) ( not ( = ?auto_3401 ?auto_3408 ) ) ( not ( = ?auto_3402 ?auto_3408 ) ) ( not ( = ?auto_3403 ?auto_3407 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3405 ?auto_3404 ?auto_3406 )
      ( !LIFT ?auto_3407 ?auto_3402 ?auto_3408 ?auto_3406 )
      ( !LOAD ?auto_3407 ?auto_3402 ?auto_3405 ?auto_3406 )
      ( !DRIVE ?auto_3405 ?auto_3406 ?auto_3404 )
      ( !UNLOAD ?auto_3403 ?auto_3402 ?auto_3405 ?auto_3404 )
      ( !DROP ?auto_3403 ?auto_3402 ?auto_3401 ?auto_3404 )
      ( MAKE-1CRATE-VERIFY ?auto_3401 ?auto_3402 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3422 - SURFACE
      ?auto_3423 - SURFACE
      ?auto_3424 - SURFACE
    )
    :vars
    (
      ?auto_3427 - HOIST
      ?auto_3430 - PLACE
      ?auto_3425 - PLACE
      ?auto_3426 - HOIST
      ?auto_3429 - SURFACE
      ?auto_3431 - PLACE
      ?auto_3432 - HOIST
      ?auto_3433 - SURFACE
      ?auto_3428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3427 ?auto_3430 ) ( IS-CRATE ?auto_3424 ) ( not ( = ?auto_3425 ?auto_3430 ) ) ( HOIST-AT ?auto_3426 ?auto_3425 ) ( AVAILABLE ?auto_3426 ) ( SURFACE-AT ?auto_3424 ?auto_3425 ) ( ON ?auto_3424 ?auto_3429 ) ( CLEAR ?auto_3424 ) ( not ( = ?auto_3423 ?auto_3424 ) ) ( not ( = ?auto_3423 ?auto_3429 ) ) ( not ( = ?auto_3424 ?auto_3429 ) ) ( not ( = ?auto_3427 ?auto_3426 ) ) ( SURFACE-AT ?auto_3422 ?auto_3430 ) ( CLEAR ?auto_3422 ) ( IS-CRATE ?auto_3423 ) ( AVAILABLE ?auto_3427 ) ( not ( = ?auto_3431 ?auto_3430 ) ) ( HOIST-AT ?auto_3432 ?auto_3431 ) ( AVAILABLE ?auto_3432 ) ( SURFACE-AT ?auto_3423 ?auto_3431 ) ( ON ?auto_3423 ?auto_3433 ) ( CLEAR ?auto_3423 ) ( TRUCK-AT ?auto_3428 ?auto_3430 ) ( not ( = ?auto_3422 ?auto_3423 ) ) ( not ( = ?auto_3422 ?auto_3433 ) ) ( not ( = ?auto_3423 ?auto_3433 ) ) ( not ( = ?auto_3427 ?auto_3432 ) ) ( not ( = ?auto_3422 ?auto_3424 ) ) ( not ( = ?auto_3422 ?auto_3429 ) ) ( not ( = ?auto_3424 ?auto_3433 ) ) ( not ( = ?auto_3425 ?auto_3431 ) ) ( not ( = ?auto_3426 ?auto_3432 ) ) ( not ( = ?auto_3429 ?auto_3433 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3422 ?auto_3423 )
      ( MAKE-1CRATE ?auto_3423 ?auto_3424 )
      ( MAKE-2CRATE-VERIFY ?auto_3422 ?auto_3423 ?auto_3424 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3448 - SURFACE
      ?auto_3449 - SURFACE
      ?auto_3450 - SURFACE
      ?auto_3451 - SURFACE
    )
    :vars
    (
      ?auto_3457 - HOIST
      ?auto_3454 - PLACE
      ?auto_3455 - PLACE
      ?auto_3453 - HOIST
      ?auto_3452 - SURFACE
      ?auto_3458 - PLACE
      ?auto_3459 - HOIST
      ?auto_3462 - SURFACE
      ?auto_3463 - PLACE
      ?auto_3461 - HOIST
      ?auto_3460 - SURFACE
      ?auto_3456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3457 ?auto_3454 ) ( IS-CRATE ?auto_3451 ) ( not ( = ?auto_3455 ?auto_3454 ) ) ( HOIST-AT ?auto_3453 ?auto_3455 ) ( AVAILABLE ?auto_3453 ) ( SURFACE-AT ?auto_3451 ?auto_3455 ) ( ON ?auto_3451 ?auto_3452 ) ( CLEAR ?auto_3451 ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( not ( = ?auto_3450 ?auto_3452 ) ) ( not ( = ?auto_3451 ?auto_3452 ) ) ( not ( = ?auto_3457 ?auto_3453 ) ) ( IS-CRATE ?auto_3450 ) ( not ( = ?auto_3458 ?auto_3454 ) ) ( HOIST-AT ?auto_3459 ?auto_3458 ) ( AVAILABLE ?auto_3459 ) ( SURFACE-AT ?auto_3450 ?auto_3458 ) ( ON ?auto_3450 ?auto_3462 ) ( CLEAR ?auto_3450 ) ( not ( = ?auto_3449 ?auto_3450 ) ) ( not ( = ?auto_3449 ?auto_3462 ) ) ( not ( = ?auto_3450 ?auto_3462 ) ) ( not ( = ?auto_3457 ?auto_3459 ) ) ( SURFACE-AT ?auto_3448 ?auto_3454 ) ( CLEAR ?auto_3448 ) ( IS-CRATE ?auto_3449 ) ( AVAILABLE ?auto_3457 ) ( not ( = ?auto_3463 ?auto_3454 ) ) ( HOIST-AT ?auto_3461 ?auto_3463 ) ( AVAILABLE ?auto_3461 ) ( SURFACE-AT ?auto_3449 ?auto_3463 ) ( ON ?auto_3449 ?auto_3460 ) ( CLEAR ?auto_3449 ) ( TRUCK-AT ?auto_3456 ?auto_3454 ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3448 ?auto_3460 ) ) ( not ( = ?auto_3449 ?auto_3460 ) ) ( not ( = ?auto_3457 ?auto_3461 ) ) ( not ( = ?auto_3448 ?auto_3450 ) ) ( not ( = ?auto_3448 ?auto_3462 ) ) ( not ( = ?auto_3450 ?auto_3460 ) ) ( not ( = ?auto_3458 ?auto_3463 ) ) ( not ( = ?auto_3459 ?auto_3461 ) ) ( not ( = ?auto_3462 ?auto_3460 ) ) ( not ( = ?auto_3448 ?auto_3451 ) ) ( not ( = ?auto_3448 ?auto_3452 ) ) ( not ( = ?auto_3449 ?auto_3451 ) ) ( not ( = ?auto_3449 ?auto_3452 ) ) ( not ( = ?auto_3451 ?auto_3462 ) ) ( not ( = ?auto_3451 ?auto_3460 ) ) ( not ( = ?auto_3455 ?auto_3458 ) ) ( not ( = ?auto_3455 ?auto_3463 ) ) ( not ( = ?auto_3453 ?auto_3459 ) ) ( not ( = ?auto_3453 ?auto_3461 ) ) ( not ( = ?auto_3452 ?auto_3462 ) ) ( not ( = ?auto_3452 ?auto_3460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3448 ?auto_3449 ?auto_3450 )
      ( MAKE-1CRATE ?auto_3450 ?auto_3451 )
      ( MAKE-3CRATE-VERIFY ?auto_3448 ?auto_3449 ?auto_3450 ?auto_3451 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3479 - SURFACE
      ?auto_3480 - SURFACE
      ?auto_3481 - SURFACE
      ?auto_3482 - SURFACE
      ?auto_3483 - SURFACE
    )
    :vars
    (
      ?auto_3485 - HOIST
      ?auto_3489 - PLACE
      ?auto_3484 - PLACE
      ?auto_3486 - HOIST
      ?auto_3487 - SURFACE
      ?auto_3492 - PLACE
      ?auto_3491 - HOIST
      ?auto_3493 - SURFACE
      ?auto_3495 - PLACE
      ?auto_3494 - HOIST
      ?auto_3490 - SURFACE
      ?auto_3498 - PLACE
      ?auto_3497 - HOIST
      ?auto_3496 - SURFACE
      ?auto_3488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3485 ?auto_3489 ) ( IS-CRATE ?auto_3483 ) ( not ( = ?auto_3484 ?auto_3489 ) ) ( HOIST-AT ?auto_3486 ?auto_3484 ) ( AVAILABLE ?auto_3486 ) ( SURFACE-AT ?auto_3483 ?auto_3484 ) ( ON ?auto_3483 ?auto_3487 ) ( CLEAR ?auto_3483 ) ( not ( = ?auto_3482 ?auto_3483 ) ) ( not ( = ?auto_3482 ?auto_3487 ) ) ( not ( = ?auto_3483 ?auto_3487 ) ) ( not ( = ?auto_3485 ?auto_3486 ) ) ( IS-CRATE ?auto_3482 ) ( not ( = ?auto_3492 ?auto_3489 ) ) ( HOIST-AT ?auto_3491 ?auto_3492 ) ( AVAILABLE ?auto_3491 ) ( SURFACE-AT ?auto_3482 ?auto_3492 ) ( ON ?auto_3482 ?auto_3493 ) ( CLEAR ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3482 ) ) ( not ( = ?auto_3481 ?auto_3493 ) ) ( not ( = ?auto_3482 ?auto_3493 ) ) ( not ( = ?auto_3485 ?auto_3491 ) ) ( IS-CRATE ?auto_3481 ) ( not ( = ?auto_3495 ?auto_3489 ) ) ( HOIST-AT ?auto_3494 ?auto_3495 ) ( AVAILABLE ?auto_3494 ) ( SURFACE-AT ?auto_3481 ?auto_3495 ) ( ON ?auto_3481 ?auto_3490 ) ( CLEAR ?auto_3481 ) ( not ( = ?auto_3480 ?auto_3481 ) ) ( not ( = ?auto_3480 ?auto_3490 ) ) ( not ( = ?auto_3481 ?auto_3490 ) ) ( not ( = ?auto_3485 ?auto_3494 ) ) ( SURFACE-AT ?auto_3479 ?auto_3489 ) ( CLEAR ?auto_3479 ) ( IS-CRATE ?auto_3480 ) ( AVAILABLE ?auto_3485 ) ( not ( = ?auto_3498 ?auto_3489 ) ) ( HOIST-AT ?auto_3497 ?auto_3498 ) ( AVAILABLE ?auto_3497 ) ( SURFACE-AT ?auto_3480 ?auto_3498 ) ( ON ?auto_3480 ?auto_3496 ) ( CLEAR ?auto_3480 ) ( TRUCK-AT ?auto_3488 ?auto_3489 ) ( not ( = ?auto_3479 ?auto_3480 ) ) ( not ( = ?auto_3479 ?auto_3496 ) ) ( not ( = ?auto_3480 ?auto_3496 ) ) ( not ( = ?auto_3485 ?auto_3497 ) ) ( not ( = ?auto_3479 ?auto_3481 ) ) ( not ( = ?auto_3479 ?auto_3490 ) ) ( not ( = ?auto_3481 ?auto_3496 ) ) ( not ( = ?auto_3495 ?auto_3498 ) ) ( not ( = ?auto_3494 ?auto_3497 ) ) ( not ( = ?auto_3490 ?auto_3496 ) ) ( not ( = ?auto_3479 ?auto_3482 ) ) ( not ( = ?auto_3479 ?auto_3493 ) ) ( not ( = ?auto_3480 ?auto_3482 ) ) ( not ( = ?auto_3480 ?auto_3493 ) ) ( not ( = ?auto_3482 ?auto_3490 ) ) ( not ( = ?auto_3482 ?auto_3496 ) ) ( not ( = ?auto_3492 ?auto_3495 ) ) ( not ( = ?auto_3492 ?auto_3498 ) ) ( not ( = ?auto_3491 ?auto_3494 ) ) ( not ( = ?auto_3491 ?auto_3497 ) ) ( not ( = ?auto_3493 ?auto_3490 ) ) ( not ( = ?auto_3493 ?auto_3496 ) ) ( not ( = ?auto_3479 ?auto_3483 ) ) ( not ( = ?auto_3479 ?auto_3487 ) ) ( not ( = ?auto_3480 ?auto_3483 ) ) ( not ( = ?auto_3480 ?auto_3487 ) ) ( not ( = ?auto_3481 ?auto_3483 ) ) ( not ( = ?auto_3481 ?auto_3487 ) ) ( not ( = ?auto_3483 ?auto_3493 ) ) ( not ( = ?auto_3483 ?auto_3490 ) ) ( not ( = ?auto_3483 ?auto_3496 ) ) ( not ( = ?auto_3484 ?auto_3492 ) ) ( not ( = ?auto_3484 ?auto_3495 ) ) ( not ( = ?auto_3484 ?auto_3498 ) ) ( not ( = ?auto_3486 ?auto_3491 ) ) ( not ( = ?auto_3486 ?auto_3494 ) ) ( not ( = ?auto_3486 ?auto_3497 ) ) ( not ( = ?auto_3487 ?auto_3493 ) ) ( not ( = ?auto_3487 ?auto_3490 ) ) ( not ( = ?auto_3487 ?auto_3496 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3479 ?auto_3480 ?auto_3481 ?auto_3482 )
      ( MAKE-1CRATE ?auto_3482 ?auto_3483 )
      ( MAKE-4CRATE-VERIFY ?auto_3479 ?auto_3480 ?auto_3481 ?auto_3482 ?auto_3483 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3515 - SURFACE
      ?auto_3516 - SURFACE
      ?auto_3517 - SURFACE
      ?auto_3518 - SURFACE
      ?auto_3519 - SURFACE
      ?auto_3520 - SURFACE
    )
    :vars
    (
      ?auto_3521 - HOIST
      ?auto_3522 - PLACE
      ?auto_3524 - PLACE
      ?auto_3523 - HOIST
      ?auto_3525 - SURFACE
      ?auto_3533 - PLACE
      ?auto_3534 - HOIST
      ?auto_3532 - SURFACE
      ?auto_3530 - PLACE
      ?auto_3529 - HOIST
      ?auto_3538 - SURFACE
      ?auto_3536 - PLACE
      ?auto_3535 - HOIST
      ?auto_3531 - SURFACE
      ?auto_3528 - PLACE
      ?auto_3527 - HOIST
      ?auto_3537 - SURFACE
      ?auto_3526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3521 ?auto_3522 ) ( IS-CRATE ?auto_3520 ) ( not ( = ?auto_3524 ?auto_3522 ) ) ( HOIST-AT ?auto_3523 ?auto_3524 ) ( AVAILABLE ?auto_3523 ) ( SURFACE-AT ?auto_3520 ?auto_3524 ) ( ON ?auto_3520 ?auto_3525 ) ( CLEAR ?auto_3520 ) ( not ( = ?auto_3519 ?auto_3520 ) ) ( not ( = ?auto_3519 ?auto_3525 ) ) ( not ( = ?auto_3520 ?auto_3525 ) ) ( not ( = ?auto_3521 ?auto_3523 ) ) ( IS-CRATE ?auto_3519 ) ( not ( = ?auto_3533 ?auto_3522 ) ) ( HOIST-AT ?auto_3534 ?auto_3533 ) ( AVAILABLE ?auto_3534 ) ( SURFACE-AT ?auto_3519 ?auto_3533 ) ( ON ?auto_3519 ?auto_3532 ) ( CLEAR ?auto_3519 ) ( not ( = ?auto_3518 ?auto_3519 ) ) ( not ( = ?auto_3518 ?auto_3532 ) ) ( not ( = ?auto_3519 ?auto_3532 ) ) ( not ( = ?auto_3521 ?auto_3534 ) ) ( IS-CRATE ?auto_3518 ) ( not ( = ?auto_3530 ?auto_3522 ) ) ( HOIST-AT ?auto_3529 ?auto_3530 ) ( AVAILABLE ?auto_3529 ) ( SURFACE-AT ?auto_3518 ?auto_3530 ) ( ON ?auto_3518 ?auto_3538 ) ( CLEAR ?auto_3518 ) ( not ( = ?auto_3517 ?auto_3518 ) ) ( not ( = ?auto_3517 ?auto_3538 ) ) ( not ( = ?auto_3518 ?auto_3538 ) ) ( not ( = ?auto_3521 ?auto_3529 ) ) ( IS-CRATE ?auto_3517 ) ( not ( = ?auto_3536 ?auto_3522 ) ) ( HOIST-AT ?auto_3535 ?auto_3536 ) ( AVAILABLE ?auto_3535 ) ( SURFACE-AT ?auto_3517 ?auto_3536 ) ( ON ?auto_3517 ?auto_3531 ) ( CLEAR ?auto_3517 ) ( not ( = ?auto_3516 ?auto_3517 ) ) ( not ( = ?auto_3516 ?auto_3531 ) ) ( not ( = ?auto_3517 ?auto_3531 ) ) ( not ( = ?auto_3521 ?auto_3535 ) ) ( SURFACE-AT ?auto_3515 ?auto_3522 ) ( CLEAR ?auto_3515 ) ( IS-CRATE ?auto_3516 ) ( AVAILABLE ?auto_3521 ) ( not ( = ?auto_3528 ?auto_3522 ) ) ( HOIST-AT ?auto_3527 ?auto_3528 ) ( AVAILABLE ?auto_3527 ) ( SURFACE-AT ?auto_3516 ?auto_3528 ) ( ON ?auto_3516 ?auto_3537 ) ( CLEAR ?auto_3516 ) ( TRUCK-AT ?auto_3526 ?auto_3522 ) ( not ( = ?auto_3515 ?auto_3516 ) ) ( not ( = ?auto_3515 ?auto_3537 ) ) ( not ( = ?auto_3516 ?auto_3537 ) ) ( not ( = ?auto_3521 ?auto_3527 ) ) ( not ( = ?auto_3515 ?auto_3517 ) ) ( not ( = ?auto_3515 ?auto_3531 ) ) ( not ( = ?auto_3517 ?auto_3537 ) ) ( not ( = ?auto_3536 ?auto_3528 ) ) ( not ( = ?auto_3535 ?auto_3527 ) ) ( not ( = ?auto_3531 ?auto_3537 ) ) ( not ( = ?auto_3515 ?auto_3518 ) ) ( not ( = ?auto_3515 ?auto_3538 ) ) ( not ( = ?auto_3516 ?auto_3518 ) ) ( not ( = ?auto_3516 ?auto_3538 ) ) ( not ( = ?auto_3518 ?auto_3531 ) ) ( not ( = ?auto_3518 ?auto_3537 ) ) ( not ( = ?auto_3530 ?auto_3536 ) ) ( not ( = ?auto_3530 ?auto_3528 ) ) ( not ( = ?auto_3529 ?auto_3535 ) ) ( not ( = ?auto_3529 ?auto_3527 ) ) ( not ( = ?auto_3538 ?auto_3531 ) ) ( not ( = ?auto_3538 ?auto_3537 ) ) ( not ( = ?auto_3515 ?auto_3519 ) ) ( not ( = ?auto_3515 ?auto_3532 ) ) ( not ( = ?auto_3516 ?auto_3519 ) ) ( not ( = ?auto_3516 ?auto_3532 ) ) ( not ( = ?auto_3517 ?auto_3519 ) ) ( not ( = ?auto_3517 ?auto_3532 ) ) ( not ( = ?auto_3519 ?auto_3538 ) ) ( not ( = ?auto_3519 ?auto_3531 ) ) ( not ( = ?auto_3519 ?auto_3537 ) ) ( not ( = ?auto_3533 ?auto_3530 ) ) ( not ( = ?auto_3533 ?auto_3536 ) ) ( not ( = ?auto_3533 ?auto_3528 ) ) ( not ( = ?auto_3534 ?auto_3529 ) ) ( not ( = ?auto_3534 ?auto_3535 ) ) ( not ( = ?auto_3534 ?auto_3527 ) ) ( not ( = ?auto_3532 ?auto_3538 ) ) ( not ( = ?auto_3532 ?auto_3531 ) ) ( not ( = ?auto_3532 ?auto_3537 ) ) ( not ( = ?auto_3515 ?auto_3520 ) ) ( not ( = ?auto_3515 ?auto_3525 ) ) ( not ( = ?auto_3516 ?auto_3520 ) ) ( not ( = ?auto_3516 ?auto_3525 ) ) ( not ( = ?auto_3517 ?auto_3520 ) ) ( not ( = ?auto_3517 ?auto_3525 ) ) ( not ( = ?auto_3518 ?auto_3520 ) ) ( not ( = ?auto_3518 ?auto_3525 ) ) ( not ( = ?auto_3520 ?auto_3532 ) ) ( not ( = ?auto_3520 ?auto_3538 ) ) ( not ( = ?auto_3520 ?auto_3531 ) ) ( not ( = ?auto_3520 ?auto_3537 ) ) ( not ( = ?auto_3524 ?auto_3533 ) ) ( not ( = ?auto_3524 ?auto_3530 ) ) ( not ( = ?auto_3524 ?auto_3536 ) ) ( not ( = ?auto_3524 ?auto_3528 ) ) ( not ( = ?auto_3523 ?auto_3534 ) ) ( not ( = ?auto_3523 ?auto_3529 ) ) ( not ( = ?auto_3523 ?auto_3535 ) ) ( not ( = ?auto_3523 ?auto_3527 ) ) ( not ( = ?auto_3525 ?auto_3532 ) ) ( not ( = ?auto_3525 ?auto_3538 ) ) ( not ( = ?auto_3525 ?auto_3531 ) ) ( not ( = ?auto_3525 ?auto_3537 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3515 ?auto_3516 ?auto_3517 ?auto_3518 ?auto_3519 )
      ( MAKE-1CRATE ?auto_3519 ?auto_3520 )
      ( MAKE-5CRATE-VERIFY ?auto_3515 ?auto_3516 ?auto_3517 ?auto_3518 ?auto_3519 ?auto_3520 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3556 - SURFACE
      ?auto_3557 - SURFACE
      ?auto_3558 - SURFACE
      ?auto_3559 - SURFACE
      ?auto_3560 - SURFACE
      ?auto_3561 - SURFACE
      ?auto_3562 - SURFACE
    )
    :vars
    (
      ?auto_3567 - HOIST
      ?auto_3563 - PLACE
      ?auto_3565 - PLACE
      ?auto_3566 - HOIST
      ?auto_3564 - SURFACE
      ?auto_3579 - PLACE
      ?auto_3580 - HOIST
      ?auto_3578 - SURFACE
      ?auto_3574 - PLACE
      ?auto_3576 - HOIST
      ?auto_3575 - SURFACE
      ?auto_3572 - PLACE
      ?auto_3570 - HOIST
      ?auto_3569 - SURFACE
      ?auto_3582 - PLACE
      ?auto_3577 - HOIST
      ?auto_3573 - SURFACE
      ?auto_3583 - PLACE
      ?auto_3571 - HOIST
      ?auto_3581 - SURFACE
      ?auto_3568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3567 ?auto_3563 ) ( IS-CRATE ?auto_3562 ) ( not ( = ?auto_3565 ?auto_3563 ) ) ( HOIST-AT ?auto_3566 ?auto_3565 ) ( AVAILABLE ?auto_3566 ) ( SURFACE-AT ?auto_3562 ?auto_3565 ) ( ON ?auto_3562 ?auto_3564 ) ( CLEAR ?auto_3562 ) ( not ( = ?auto_3561 ?auto_3562 ) ) ( not ( = ?auto_3561 ?auto_3564 ) ) ( not ( = ?auto_3562 ?auto_3564 ) ) ( not ( = ?auto_3567 ?auto_3566 ) ) ( IS-CRATE ?auto_3561 ) ( not ( = ?auto_3579 ?auto_3563 ) ) ( HOIST-AT ?auto_3580 ?auto_3579 ) ( AVAILABLE ?auto_3580 ) ( SURFACE-AT ?auto_3561 ?auto_3579 ) ( ON ?auto_3561 ?auto_3578 ) ( CLEAR ?auto_3561 ) ( not ( = ?auto_3560 ?auto_3561 ) ) ( not ( = ?auto_3560 ?auto_3578 ) ) ( not ( = ?auto_3561 ?auto_3578 ) ) ( not ( = ?auto_3567 ?auto_3580 ) ) ( IS-CRATE ?auto_3560 ) ( not ( = ?auto_3574 ?auto_3563 ) ) ( HOIST-AT ?auto_3576 ?auto_3574 ) ( AVAILABLE ?auto_3576 ) ( SURFACE-AT ?auto_3560 ?auto_3574 ) ( ON ?auto_3560 ?auto_3575 ) ( CLEAR ?auto_3560 ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( not ( = ?auto_3559 ?auto_3575 ) ) ( not ( = ?auto_3560 ?auto_3575 ) ) ( not ( = ?auto_3567 ?auto_3576 ) ) ( IS-CRATE ?auto_3559 ) ( not ( = ?auto_3572 ?auto_3563 ) ) ( HOIST-AT ?auto_3570 ?auto_3572 ) ( AVAILABLE ?auto_3570 ) ( SURFACE-AT ?auto_3559 ?auto_3572 ) ( ON ?auto_3559 ?auto_3569 ) ( CLEAR ?auto_3559 ) ( not ( = ?auto_3558 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3569 ) ) ( not ( = ?auto_3559 ?auto_3569 ) ) ( not ( = ?auto_3567 ?auto_3570 ) ) ( IS-CRATE ?auto_3558 ) ( not ( = ?auto_3582 ?auto_3563 ) ) ( HOIST-AT ?auto_3577 ?auto_3582 ) ( AVAILABLE ?auto_3577 ) ( SURFACE-AT ?auto_3558 ?auto_3582 ) ( ON ?auto_3558 ?auto_3573 ) ( CLEAR ?auto_3558 ) ( not ( = ?auto_3557 ?auto_3558 ) ) ( not ( = ?auto_3557 ?auto_3573 ) ) ( not ( = ?auto_3558 ?auto_3573 ) ) ( not ( = ?auto_3567 ?auto_3577 ) ) ( SURFACE-AT ?auto_3556 ?auto_3563 ) ( CLEAR ?auto_3556 ) ( IS-CRATE ?auto_3557 ) ( AVAILABLE ?auto_3567 ) ( not ( = ?auto_3583 ?auto_3563 ) ) ( HOIST-AT ?auto_3571 ?auto_3583 ) ( AVAILABLE ?auto_3571 ) ( SURFACE-AT ?auto_3557 ?auto_3583 ) ( ON ?auto_3557 ?auto_3581 ) ( CLEAR ?auto_3557 ) ( TRUCK-AT ?auto_3568 ?auto_3563 ) ( not ( = ?auto_3556 ?auto_3557 ) ) ( not ( = ?auto_3556 ?auto_3581 ) ) ( not ( = ?auto_3557 ?auto_3581 ) ) ( not ( = ?auto_3567 ?auto_3571 ) ) ( not ( = ?auto_3556 ?auto_3558 ) ) ( not ( = ?auto_3556 ?auto_3573 ) ) ( not ( = ?auto_3558 ?auto_3581 ) ) ( not ( = ?auto_3582 ?auto_3583 ) ) ( not ( = ?auto_3577 ?auto_3571 ) ) ( not ( = ?auto_3573 ?auto_3581 ) ) ( not ( = ?auto_3556 ?auto_3559 ) ) ( not ( = ?auto_3556 ?auto_3569 ) ) ( not ( = ?auto_3557 ?auto_3559 ) ) ( not ( = ?auto_3557 ?auto_3569 ) ) ( not ( = ?auto_3559 ?auto_3573 ) ) ( not ( = ?auto_3559 ?auto_3581 ) ) ( not ( = ?auto_3572 ?auto_3582 ) ) ( not ( = ?auto_3572 ?auto_3583 ) ) ( not ( = ?auto_3570 ?auto_3577 ) ) ( not ( = ?auto_3570 ?auto_3571 ) ) ( not ( = ?auto_3569 ?auto_3573 ) ) ( not ( = ?auto_3569 ?auto_3581 ) ) ( not ( = ?auto_3556 ?auto_3560 ) ) ( not ( = ?auto_3556 ?auto_3575 ) ) ( not ( = ?auto_3557 ?auto_3560 ) ) ( not ( = ?auto_3557 ?auto_3575 ) ) ( not ( = ?auto_3558 ?auto_3560 ) ) ( not ( = ?auto_3558 ?auto_3575 ) ) ( not ( = ?auto_3560 ?auto_3569 ) ) ( not ( = ?auto_3560 ?auto_3573 ) ) ( not ( = ?auto_3560 ?auto_3581 ) ) ( not ( = ?auto_3574 ?auto_3572 ) ) ( not ( = ?auto_3574 ?auto_3582 ) ) ( not ( = ?auto_3574 ?auto_3583 ) ) ( not ( = ?auto_3576 ?auto_3570 ) ) ( not ( = ?auto_3576 ?auto_3577 ) ) ( not ( = ?auto_3576 ?auto_3571 ) ) ( not ( = ?auto_3575 ?auto_3569 ) ) ( not ( = ?auto_3575 ?auto_3573 ) ) ( not ( = ?auto_3575 ?auto_3581 ) ) ( not ( = ?auto_3556 ?auto_3561 ) ) ( not ( = ?auto_3556 ?auto_3578 ) ) ( not ( = ?auto_3557 ?auto_3561 ) ) ( not ( = ?auto_3557 ?auto_3578 ) ) ( not ( = ?auto_3558 ?auto_3561 ) ) ( not ( = ?auto_3558 ?auto_3578 ) ) ( not ( = ?auto_3559 ?auto_3561 ) ) ( not ( = ?auto_3559 ?auto_3578 ) ) ( not ( = ?auto_3561 ?auto_3575 ) ) ( not ( = ?auto_3561 ?auto_3569 ) ) ( not ( = ?auto_3561 ?auto_3573 ) ) ( not ( = ?auto_3561 ?auto_3581 ) ) ( not ( = ?auto_3579 ?auto_3574 ) ) ( not ( = ?auto_3579 ?auto_3572 ) ) ( not ( = ?auto_3579 ?auto_3582 ) ) ( not ( = ?auto_3579 ?auto_3583 ) ) ( not ( = ?auto_3580 ?auto_3576 ) ) ( not ( = ?auto_3580 ?auto_3570 ) ) ( not ( = ?auto_3580 ?auto_3577 ) ) ( not ( = ?auto_3580 ?auto_3571 ) ) ( not ( = ?auto_3578 ?auto_3575 ) ) ( not ( = ?auto_3578 ?auto_3569 ) ) ( not ( = ?auto_3578 ?auto_3573 ) ) ( not ( = ?auto_3578 ?auto_3581 ) ) ( not ( = ?auto_3556 ?auto_3562 ) ) ( not ( = ?auto_3556 ?auto_3564 ) ) ( not ( = ?auto_3557 ?auto_3562 ) ) ( not ( = ?auto_3557 ?auto_3564 ) ) ( not ( = ?auto_3558 ?auto_3562 ) ) ( not ( = ?auto_3558 ?auto_3564 ) ) ( not ( = ?auto_3559 ?auto_3562 ) ) ( not ( = ?auto_3559 ?auto_3564 ) ) ( not ( = ?auto_3560 ?auto_3562 ) ) ( not ( = ?auto_3560 ?auto_3564 ) ) ( not ( = ?auto_3562 ?auto_3578 ) ) ( not ( = ?auto_3562 ?auto_3575 ) ) ( not ( = ?auto_3562 ?auto_3569 ) ) ( not ( = ?auto_3562 ?auto_3573 ) ) ( not ( = ?auto_3562 ?auto_3581 ) ) ( not ( = ?auto_3565 ?auto_3579 ) ) ( not ( = ?auto_3565 ?auto_3574 ) ) ( not ( = ?auto_3565 ?auto_3572 ) ) ( not ( = ?auto_3565 ?auto_3582 ) ) ( not ( = ?auto_3565 ?auto_3583 ) ) ( not ( = ?auto_3566 ?auto_3580 ) ) ( not ( = ?auto_3566 ?auto_3576 ) ) ( not ( = ?auto_3566 ?auto_3570 ) ) ( not ( = ?auto_3566 ?auto_3577 ) ) ( not ( = ?auto_3566 ?auto_3571 ) ) ( not ( = ?auto_3564 ?auto_3578 ) ) ( not ( = ?auto_3564 ?auto_3575 ) ) ( not ( = ?auto_3564 ?auto_3569 ) ) ( not ( = ?auto_3564 ?auto_3573 ) ) ( not ( = ?auto_3564 ?auto_3581 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3556 ?auto_3557 ?auto_3558 ?auto_3559 ?auto_3560 ?auto_3561 )
      ( MAKE-1CRATE ?auto_3561 ?auto_3562 )
      ( MAKE-6CRATE-VERIFY ?auto_3556 ?auto_3557 ?auto_3558 ?auto_3559 ?auto_3560 ?auto_3561 ?auto_3562 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3602 - SURFACE
      ?auto_3603 - SURFACE
      ?auto_3604 - SURFACE
      ?auto_3605 - SURFACE
      ?auto_3606 - SURFACE
      ?auto_3607 - SURFACE
      ?auto_3608 - SURFACE
      ?auto_3609 - SURFACE
    )
    :vars
    (
      ?auto_3611 - HOIST
      ?auto_3610 - PLACE
      ?auto_3612 - PLACE
      ?auto_3613 - HOIST
      ?auto_3614 - SURFACE
      ?auto_3631 - PLACE
      ?auto_3620 - HOIST
      ?auto_3616 - SURFACE
      ?auto_3619 - PLACE
      ?auto_3630 - HOIST
      ?auto_3625 - SURFACE
      ?auto_3618 - PLACE
      ?auto_3617 - HOIST
      ?auto_3633 - SURFACE
      ?auto_3628 - PLACE
      ?auto_3624 - HOIST
      ?auto_3622 - SURFACE
      ?auto_3621 - PLACE
      ?auto_3623 - HOIST
      ?auto_3632 - SURFACE
      ?auto_3627 - PLACE
      ?auto_3626 - HOIST
      ?auto_3629 - SURFACE
      ?auto_3615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3611 ?auto_3610 ) ( IS-CRATE ?auto_3609 ) ( not ( = ?auto_3612 ?auto_3610 ) ) ( HOIST-AT ?auto_3613 ?auto_3612 ) ( AVAILABLE ?auto_3613 ) ( SURFACE-AT ?auto_3609 ?auto_3612 ) ( ON ?auto_3609 ?auto_3614 ) ( CLEAR ?auto_3609 ) ( not ( = ?auto_3608 ?auto_3609 ) ) ( not ( = ?auto_3608 ?auto_3614 ) ) ( not ( = ?auto_3609 ?auto_3614 ) ) ( not ( = ?auto_3611 ?auto_3613 ) ) ( IS-CRATE ?auto_3608 ) ( not ( = ?auto_3631 ?auto_3610 ) ) ( HOIST-AT ?auto_3620 ?auto_3631 ) ( AVAILABLE ?auto_3620 ) ( SURFACE-AT ?auto_3608 ?auto_3631 ) ( ON ?auto_3608 ?auto_3616 ) ( CLEAR ?auto_3608 ) ( not ( = ?auto_3607 ?auto_3608 ) ) ( not ( = ?auto_3607 ?auto_3616 ) ) ( not ( = ?auto_3608 ?auto_3616 ) ) ( not ( = ?auto_3611 ?auto_3620 ) ) ( IS-CRATE ?auto_3607 ) ( not ( = ?auto_3619 ?auto_3610 ) ) ( HOIST-AT ?auto_3630 ?auto_3619 ) ( AVAILABLE ?auto_3630 ) ( SURFACE-AT ?auto_3607 ?auto_3619 ) ( ON ?auto_3607 ?auto_3625 ) ( CLEAR ?auto_3607 ) ( not ( = ?auto_3606 ?auto_3607 ) ) ( not ( = ?auto_3606 ?auto_3625 ) ) ( not ( = ?auto_3607 ?auto_3625 ) ) ( not ( = ?auto_3611 ?auto_3630 ) ) ( IS-CRATE ?auto_3606 ) ( not ( = ?auto_3618 ?auto_3610 ) ) ( HOIST-AT ?auto_3617 ?auto_3618 ) ( AVAILABLE ?auto_3617 ) ( SURFACE-AT ?auto_3606 ?auto_3618 ) ( ON ?auto_3606 ?auto_3633 ) ( CLEAR ?auto_3606 ) ( not ( = ?auto_3605 ?auto_3606 ) ) ( not ( = ?auto_3605 ?auto_3633 ) ) ( not ( = ?auto_3606 ?auto_3633 ) ) ( not ( = ?auto_3611 ?auto_3617 ) ) ( IS-CRATE ?auto_3605 ) ( not ( = ?auto_3628 ?auto_3610 ) ) ( HOIST-AT ?auto_3624 ?auto_3628 ) ( AVAILABLE ?auto_3624 ) ( SURFACE-AT ?auto_3605 ?auto_3628 ) ( ON ?auto_3605 ?auto_3622 ) ( CLEAR ?auto_3605 ) ( not ( = ?auto_3604 ?auto_3605 ) ) ( not ( = ?auto_3604 ?auto_3622 ) ) ( not ( = ?auto_3605 ?auto_3622 ) ) ( not ( = ?auto_3611 ?auto_3624 ) ) ( IS-CRATE ?auto_3604 ) ( not ( = ?auto_3621 ?auto_3610 ) ) ( HOIST-AT ?auto_3623 ?auto_3621 ) ( AVAILABLE ?auto_3623 ) ( SURFACE-AT ?auto_3604 ?auto_3621 ) ( ON ?auto_3604 ?auto_3632 ) ( CLEAR ?auto_3604 ) ( not ( = ?auto_3603 ?auto_3604 ) ) ( not ( = ?auto_3603 ?auto_3632 ) ) ( not ( = ?auto_3604 ?auto_3632 ) ) ( not ( = ?auto_3611 ?auto_3623 ) ) ( SURFACE-AT ?auto_3602 ?auto_3610 ) ( CLEAR ?auto_3602 ) ( IS-CRATE ?auto_3603 ) ( AVAILABLE ?auto_3611 ) ( not ( = ?auto_3627 ?auto_3610 ) ) ( HOIST-AT ?auto_3626 ?auto_3627 ) ( AVAILABLE ?auto_3626 ) ( SURFACE-AT ?auto_3603 ?auto_3627 ) ( ON ?auto_3603 ?auto_3629 ) ( CLEAR ?auto_3603 ) ( TRUCK-AT ?auto_3615 ?auto_3610 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3629 ) ) ( not ( = ?auto_3603 ?auto_3629 ) ) ( not ( = ?auto_3611 ?auto_3626 ) ) ( not ( = ?auto_3602 ?auto_3604 ) ) ( not ( = ?auto_3602 ?auto_3632 ) ) ( not ( = ?auto_3604 ?auto_3629 ) ) ( not ( = ?auto_3621 ?auto_3627 ) ) ( not ( = ?auto_3623 ?auto_3626 ) ) ( not ( = ?auto_3632 ?auto_3629 ) ) ( not ( = ?auto_3602 ?auto_3605 ) ) ( not ( = ?auto_3602 ?auto_3622 ) ) ( not ( = ?auto_3603 ?auto_3605 ) ) ( not ( = ?auto_3603 ?auto_3622 ) ) ( not ( = ?auto_3605 ?auto_3632 ) ) ( not ( = ?auto_3605 ?auto_3629 ) ) ( not ( = ?auto_3628 ?auto_3621 ) ) ( not ( = ?auto_3628 ?auto_3627 ) ) ( not ( = ?auto_3624 ?auto_3623 ) ) ( not ( = ?auto_3624 ?auto_3626 ) ) ( not ( = ?auto_3622 ?auto_3632 ) ) ( not ( = ?auto_3622 ?auto_3629 ) ) ( not ( = ?auto_3602 ?auto_3606 ) ) ( not ( = ?auto_3602 ?auto_3633 ) ) ( not ( = ?auto_3603 ?auto_3606 ) ) ( not ( = ?auto_3603 ?auto_3633 ) ) ( not ( = ?auto_3604 ?auto_3606 ) ) ( not ( = ?auto_3604 ?auto_3633 ) ) ( not ( = ?auto_3606 ?auto_3622 ) ) ( not ( = ?auto_3606 ?auto_3632 ) ) ( not ( = ?auto_3606 ?auto_3629 ) ) ( not ( = ?auto_3618 ?auto_3628 ) ) ( not ( = ?auto_3618 ?auto_3621 ) ) ( not ( = ?auto_3618 ?auto_3627 ) ) ( not ( = ?auto_3617 ?auto_3624 ) ) ( not ( = ?auto_3617 ?auto_3623 ) ) ( not ( = ?auto_3617 ?auto_3626 ) ) ( not ( = ?auto_3633 ?auto_3622 ) ) ( not ( = ?auto_3633 ?auto_3632 ) ) ( not ( = ?auto_3633 ?auto_3629 ) ) ( not ( = ?auto_3602 ?auto_3607 ) ) ( not ( = ?auto_3602 ?auto_3625 ) ) ( not ( = ?auto_3603 ?auto_3607 ) ) ( not ( = ?auto_3603 ?auto_3625 ) ) ( not ( = ?auto_3604 ?auto_3607 ) ) ( not ( = ?auto_3604 ?auto_3625 ) ) ( not ( = ?auto_3605 ?auto_3607 ) ) ( not ( = ?auto_3605 ?auto_3625 ) ) ( not ( = ?auto_3607 ?auto_3633 ) ) ( not ( = ?auto_3607 ?auto_3622 ) ) ( not ( = ?auto_3607 ?auto_3632 ) ) ( not ( = ?auto_3607 ?auto_3629 ) ) ( not ( = ?auto_3619 ?auto_3618 ) ) ( not ( = ?auto_3619 ?auto_3628 ) ) ( not ( = ?auto_3619 ?auto_3621 ) ) ( not ( = ?auto_3619 ?auto_3627 ) ) ( not ( = ?auto_3630 ?auto_3617 ) ) ( not ( = ?auto_3630 ?auto_3624 ) ) ( not ( = ?auto_3630 ?auto_3623 ) ) ( not ( = ?auto_3630 ?auto_3626 ) ) ( not ( = ?auto_3625 ?auto_3633 ) ) ( not ( = ?auto_3625 ?auto_3622 ) ) ( not ( = ?auto_3625 ?auto_3632 ) ) ( not ( = ?auto_3625 ?auto_3629 ) ) ( not ( = ?auto_3602 ?auto_3608 ) ) ( not ( = ?auto_3602 ?auto_3616 ) ) ( not ( = ?auto_3603 ?auto_3608 ) ) ( not ( = ?auto_3603 ?auto_3616 ) ) ( not ( = ?auto_3604 ?auto_3608 ) ) ( not ( = ?auto_3604 ?auto_3616 ) ) ( not ( = ?auto_3605 ?auto_3608 ) ) ( not ( = ?auto_3605 ?auto_3616 ) ) ( not ( = ?auto_3606 ?auto_3608 ) ) ( not ( = ?auto_3606 ?auto_3616 ) ) ( not ( = ?auto_3608 ?auto_3625 ) ) ( not ( = ?auto_3608 ?auto_3633 ) ) ( not ( = ?auto_3608 ?auto_3622 ) ) ( not ( = ?auto_3608 ?auto_3632 ) ) ( not ( = ?auto_3608 ?auto_3629 ) ) ( not ( = ?auto_3631 ?auto_3619 ) ) ( not ( = ?auto_3631 ?auto_3618 ) ) ( not ( = ?auto_3631 ?auto_3628 ) ) ( not ( = ?auto_3631 ?auto_3621 ) ) ( not ( = ?auto_3631 ?auto_3627 ) ) ( not ( = ?auto_3620 ?auto_3630 ) ) ( not ( = ?auto_3620 ?auto_3617 ) ) ( not ( = ?auto_3620 ?auto_3624 ) ) ( not ( = ?auto_3620 ?auto_3623 ) ) ( not ( = ?auto_3620 ?auto_3626 ) ) ( not ( = ?auto_3616 ?auto_3625 ) ) ( not ( = ?auto_3616 ?auto_3633 ) ) ( not ( = ?auto_3616 ?auto_3622 ) ) ( not ( = ?auto_3616 ?auto_3632 ) ) ( not ( = ?auto_3616 ?auto_3629 ) ) ( not ( = ?auto_3602 ?auto_3609 ) ) ( not ( = ?auto_3602 ?auto_3614 ) ) ( not ( = ?auto_3603 ?auto_3609 ) ) ( not ( = ?auto_3603 ?auto_3614 ) ) ( not ( = ?auto_3604 ?auto_3609 ) ) ( not ( = ?auto_3604 ?auto_3614 ) ) ( not ( = ?auto_3605 ?auto_3609 ) ) ( not ( = ?auto_3605 ?auto_3614 ) ) ( not ( = ?auto_3606 ?auto_3609 ) ) ( not ( = ?auto_3606 ?auto_3614 ) ) ( not ( = ?auto_3607 ?auto_3609 ) ) ( not ( = ?auto_3607 ?auto_3614 ) ) ( not ( = ?auto_3609 ?auto_3616 ) ) ( not ( = ?auto_3609 ?auto_3625 ) ) ( not ( = ?auto_3609 ?auto_3633 ) ) ( not ( = ?auto_3609 ?auto_3622 ) ) ( not ( = ?auto_3609 ?auto_3632 ) ) ( not ( = ?auto_3609 ?auto_3629 ) ) ( not ( = ?auto_3612 ?auto_3631 ) ) ( not ( = ?auto_3612 ?auto_3619 ) ) ( not ( = ?auto_3612 ?auto_3618 ) ) ( not ( = ?auto_3612 ?auto_3628 ) ) ( not ( = ?auto_3612 ?auto_3621 ) ) ( not ( = ?auto_3612 ?auto_3627 ) ) ( not ( = ?auto_3613 ?auto_3620 ) ) ( not ( = ?auto_3613 ?auto_3630 ) ) ( not ( = ?auto_3613 ?auto_3617 ) ) ( not ( = ?auto_3613 ?auto_3624 ) ) ( not ( = ?auto_3613 ?auto_3623 ) ) ( not ( = ?auto_3613 ?auto_3626 ) ) ( not ( = ?auto_3614 ?auto_3616 ) ) ( not ( = ?auto_3614 ?auto_3625 ) ) ( not ( = ?auto_3614 ?auto_3633 ) ) ( not ( = ?auto_3614 ?auto_3622 ) ) ( not ( = ?auto_3614 ?auto_3632 ) ) ( not ( = ?auto_3614 ?auto_3629 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3602 ?auto_3603 ?auto_3604 ?auto_3605 ?auto_3606 ?auto_3607 ?auto_3608 )
      ( MAKE-1CRATE ?auto_3608 ?auto_3609 )
      ( MAKE-7CRATE-VERIFY ?auto_3602 ?auto_3603 ?auto_3604 ?auto_3605 ?auto_3606 ?auto_3607 ?auto_3608 ?auto_3609 ) )
  )

)

