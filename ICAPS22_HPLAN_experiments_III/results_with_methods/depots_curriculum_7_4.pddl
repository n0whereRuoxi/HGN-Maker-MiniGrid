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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3411 - SURFACE
      ?auto_3412 - SURFACE
    )
    :vars
    (
      ?auto_3413 - HOIST
      ?auto_3414 - PLACE
      ?auto_3416 - PLACE
      ?auto_3417 - HOIST
      ?auto_3418 - SURFACE
      ?auto_3415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3413 ?auto_3414 ) ( SURFACE-AT ?auto_3411 ?auto_3414 ) ( CLEAR ?auto_3411 ) ( IS-CRATE ?auto_3412 ) ( AVAILABLE ?auto_3413 ) ( not ( = ?auto_3416 ?auto_3414 ) ) ( HOIST-AT ?auto_3417 ?auto_3416 ) ( AVAILABLE ?auto_3417 ) ( SURFACE-AT ?auto_3412 ?auto_3416 ) ( ON ?auto_3412 ?auto_3418 ) ( CLEAR ?auto_3412 ) ( TRUCK-AT ?auto_3415 ?auto_3414 ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( not ( = ?auto_3411 ?auto_3418 ) ) ( not ( = ?auto_3412 ?auto_3418 ) ) ( not ( = ?auto_3413 ?auto_3417 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3415 ?auto_3414 ?auto_3416 )
      ( !LIFT ?auto_3417 ?auto_3412 ?auto_3418 ?auto_3416 )
      ( !LOAD ?auto_3417 ?auto_3412 ?auto_3415 ?auto_3416 )
      ( !DRIVE ?auto_3415 ?auto_3416 ?auto_3414 )
      ( !UNLOAD ?auto_3413 ?auto_3412 ?auto_3415 ?auto_3414 )
      ( !DROP ?auto_3413 ?auto_3412 ?auto_3411 ?auto_3414 )
      ( MAKE-1CRATE-VERIFY ?auto_3411 ?auto_3412 ) )
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
      ?auto_3430 - HOIST
      ?auto_3426 - PLACE
      ?auto_3425 - PLACE
      ?auto_3427 - HOIST
      ?auto_3429 - SURFACE
      ?auto_3433 - PLACE
      ?auto_3432 - HOIST
      ?auto_3431 - SURFACE
      ?auto_3428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3430 ?auto_3426 ) ( IS-CRATE ?auto_3424 ) ( not ( = ?auto_3425 ?auto_3426 ) ) ( HOIST-AT ?auto_3427 ?auto_3425 ) ( AVAILABLE ?auto_3427 ) ( SURFACE-AT ?auto_3424 ?auto_3425 ) ( ON ?auto_3424 ?auto_3429 ) ( CLEAR ?auto_3424 ) ( not ( = ?auto_3423 ?auto_3424 ) ) ( not ( = ?auto_3423 ?auto_3429 ) ) ( not ( = ?auto_3424 ?auto_3429 ) ) ( not ( = ?auto_3430 ?auto_3427 ) ) ( SURFACE-AT ?auto_3422 ?auto_3426 ) ( CLEAR ?auto_3422 ) ( IS-CRATE ?auto_3423 ) ( AVAILABLE ?auto_3430 ) ( not ( = ?auto_3433 ?auto_3426 ) ) ( HOIST-AT ?auto_3432 ?auto_3433 ) ( AVAILABLE ?auto_3432 ) ( SURFACE-AT ?auto_3423 ?auto_3433 ) ( ON ?auto_3423 ?auto_3431 ) ( CLEAR ?auto_3423 ) ( TRUCK-AT ?auto_3428 ?auto_3426 ) ( not ( = ?auto_3422 ?auto_3423 ) ) ( not ( = ?auto_3422 ?auto_3431 ) ) ( not ( = ?auto_3423 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3432 ) ) ( not ( = ?auto_3422 ?auto_3424 ) ) ( not ( = ?auto_3422 ?auto_3429 ) ) ( not ( = ?auto_3424 ?auto_3431 ) ) ( not ( = ?auto_3425 ?auto_3433 ) ) ( not ( = ?auto_3427 ?auto_3432 ) ) ( not ( = ?auto_3429 ?auto_3431 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3422 ?auto_3423 )
      ( MAKE-1CRATE ?auto_3423 ?auto_3424 )
      ( MAKE-2CRATE-VERIFY ?auto_3422 ?auto_3423 ?auto_3424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3436 - SURFACE
      ?auto_3437 - SURFACE
    )
    :vars
    (
      ?auto_3438 - HOIST
      ?auto_3439 - PLACE
      ?auto_3441 - PLACE
      ?auto_3442 - HOIST
      ?auto_3443 - SURFACE
      ?auto_3440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3438 ?auto_3439 ) ( SURFACE-AT ?auto_3436 ?auto_3439 ) ( CLEAR ?auto_3436 ) ( IS-CRATE ?auto_3437 ) ( AVAILABLE ?auto_3438 ) ( not ( = ?auto_3441 ?auto_3439 ) ) ( HOIST-AT ?auto_3442 ?auto_3441 ) ( AVAILABLE ?auto_3442 ) ( SURFACE-AT ?auto_3437 ?auto_3441 ) ( ON ?auto_3437 ?auto_3443 ) ( CLEAR ?auto_3437 ) ( TRUCK-AT ?auto_3440 ?auto_3439 ) ( not ( = ?auto_3436 ?auto_3437 ) ) ( not ( = ?auto_3436 ?auto_3443 ) ) ( not ( = ?auto_3437 ?auto_3443 ) ) ( not ( = ?auto_3438 ?auto_3442 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3440 ?auto_3439 ?auto_3441 )
      ( !LIFT ?auto_3442 ?auto_3437 ?auto_3443 ?auto_3441 )
      ( !LOAD ?auto_3442 ?auto_3437 ?auto_3440 ?auto_3441 )
      ( !DRIVE ?auto_3440 ?auto_3441 ?auto_3439 )
      ( !UNLOAD ?auto_3438 ?auto_3437 ?auto_3440 ?auto_3439 )
      ( !DROP ?auto_3438 ?auto_3437 ?auto_3436 ?auto_3439 )
      ( MAKE-1CRATE-VERIFY ?auto_3436 ?auto_3437 ) )
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
      ?auto_3452 - HOIST
      ?auto_3456 - PLACE
      ?auto_3454 - PLACE
      ?auto_3457 - HOIST
      ?auto_3453 - SURFACE
      ?auto_3458 - PLACE
      ?auto_3463 - HOIST
      ?auto_3460 - SURFACE
      ?auto_3462 - PLACE
      ?auto_3459 - HOIST
      ?auto_3461 - SURFACE
      ?auto_3455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3452 ?auto_3456 ) ( IS-CRATE ?auto_3451 ) ( not ( = ?auto_3454 ?auto_3456 ) ) ( HOIST-AT ?auto_3457 ?auto_3454 ) ( AVAILABLE ?auto_3457 ) ( SURFACE-AT ?auto_3451 ?auto_3454 ) ( ON ?auto_3451 ?auto_3453 ) ( CLEAR ?auto_3451 ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( not ( = ?auto_3450 ?auto_3453 ) ) ( not ( = ?auto_3451 ?auto_3453 ) ) ( not ( = ?auto_3452 ?auto_3457 ) ) ( IS-CRATE ?auto_3450 ) ( not ( = ?auto_3458 ?auto_3456 ) ) ( HOIST-AT ?auto_3463 ?auto_3458 ) ( AVAILABLE ?auto_3463 ) ( SURFACE-AT ?auto_3450 ?auto_3458 ) ( ON ?auto_3450 ?auto_3460 ) ( CLEAR ?auto_3450 ) ( not ( = ?auto_3449 ?auto_3450 ) ) ( not ( = ?auto_3449 ?auto_3460 ) ) ( not ( = ?auto_3450 ?auto_3460 ) ) ( not ( = ?auto_3452 ?auto_3463 ) ) ( SURFACE-AT ?auto_3448 ?auto_3456 ) ( CLEAR ?auto_3448 ) ( IS-CRATE ?auto_3449 ) ( AVAILABLE ?auto_3452 ) ( not ( = ?auto_3462 ?auto_3456 ) ) ( HOIST-AT ?auto_3459 ?auto_3462 ) ( AVAILABLE ?auto_3459 ) ( SURFACE-AT ?auto_3449 ?auto_3462 ) ( ON ?auto_3449 ?auto_3461 ) ( CLEAR ?auto_3449 ) ( TRUCK-AT ?auto_3455 ?auto_3456 ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3448 ?auto_3461 ) ) ( not ( = ?auto_3449 ?auto_3461 ) ) ( not ( = ?auto_3452 ?auto_3459 ) ) ( not ( = ?auto_3448 ?auto_3450 ) ) ( not ( = ?auto_3448 ?auto_3460 ) ) ( not ( = ?auto_3450 ?auto_3461 ) ) ( not ( = ?auto_3458 ?auto_3462 ) ) ( not ( = ?auto_3463 ?auto_3459 ) ) ( not ( = ?auto_3460 ?auto_3461 ) ) ( not ( = ?auto_3448 ?auto_3451 ) ) ( not ( = ?auto_3448 ?auto_3453 ) ) ( not ( = ?auto_3449 ?auto_3451 ) ) ( not ( = ?auto_3449 ?auto_3453 ) ) ( not ( = ?auto_3451 ?auto_3460 ) ) ( not ( = ?auto_3451 ?auto_3461 ) ) ( not ( = ?auto_3454 ?auto_3458 ) ) ( not ( = ?auto_3454 ?auto_3462 ) ) ( not ( = ?auto_3457 ?auto_3463 ) ) ( not ( = ?auto_3457 ?auto_3459 ) ) ( not ( = ?auto_3453 ?auto_3460 ) ) ( not ( = ?auto_3453 ?auto_3461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3448 ?auto_3449 ?auto_3450 )
      ( MAKE-1CRATE ?auto_3450 ?auto_3451 )
      ( MAKE-3CRATE-VERIFY ?auto_3448 ?auto_3449 ?auto_3450 ?auto_3451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3466 - SURFACE
      ?auto_3467 - SURFACE
    )
    :vars
    (
      ?auto_3468 - HOIST
      ?auto_3469 - PLACE
      ?auto_3471 - PLACE
      ?auto_3472 - HOIST
      ?auto_3473 - SURFACE
      ?auto_3470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3468 ?auto_3469 ) ( SURFACE-AT ?auto_3466 ?auto_3469 ) ( CLEAR ?auto_3466 ) ( IS-CRATE ?auto_3467 ) ( AVAILABLE ?auto_3468 ) ( not ( = ?auto_3471 ?auto_3469 ) ) ( HOIST-AT ?auto_3472 ?auto_3471 ) ( AVAILABLE ?auto_3472 ) ( SURFACE-AT ?auto_3467 ?auto_3471 ) ( ON ?auto_3467 ?auto_3473 ) ( CLEAR ?auto_3467 ) ( TRUCK-AT ?auto_3470 ?auto_3469 ) ( not ( = ?auto_3466 ?auto_3467 ) ) ( not ( = ?auto_3466 ?auto_3473 ) ) ( not ( = ?auto_3467 ?auto_3473 ) ) ( not ( = ?auto_3468 ?auto_3472 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3470 ?auto_3469 ?auto_3471 )
      ( !LIFT ?auto_3472 ?auto_3467 ?auto_3473 ?auto_3471 )
      ( !LOAD ?auto_3472 ?auto_3467 ?auto_3470 ?auto_3471 )
      ( !DRIVE ?auto_3470 ?auto_3471 ?auto_3469 )
      ( !UNLOAD ?auto_3468 ?auto_3467 ?auto_3470 ?auto_3469 )
      ( !DROP ?auto_3468 ?auto_3467 ?auto_3466 ?auto_3469 )
      ( MAKE-1CRATE-VERIFY ?auto_3466 ?auto_3467 ) )
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
      ?auto_3488 - PLACE
      ?auto_3489 - PLACE
      ?auto_3487 - HOIST
      ?auto_3486 - SURFACE
      ?auto_3494 - PLACE
      ?auto_3495 - HOIST
      ?auto_3496 - SURFACE
      ?auto_3498 - PLACE
      ?auto_3490 - HOIST
      ?auto_3491 - SURFACE
      ?auto_3492 - PLACE
      ?auto_3497 - HOIST
      ?auto_3493 - SURFACE
      ?auto_3484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3485 ?auto_3488 ) ( IS-CRATE ?auto_3483 ) ( not ( = ?auto_3489 ?auto_3488 ) ) ( HOIST-AT ?auto_3487 ?auto_3489 ) ( AVAILABLE ?auto_3487 ) ( SURFACE-AT ?auto_3483 ?auto_3489 ) ( ON ?auto_3483 ?auto_3486 ) ( CLEAR ?auto_3483 ) ( not ( = ?auto_3482 ?auto_3483 ) ) ( not ( = ?auto_3482 ?auto_3486 ) ) ( not ( = ?auto_3483 ?auto_3486 ) ) ( not ( = ?auto_3485 ?auto_3487 ) ) ( IS-CRATE ?auto_3482 ) ( not ( = ?auto_3494 ?auto_3488 ) ) ( HOIST-AT ?auto_3495 ?auto_3494 ) ( AVAILABLE ?auto_3495 ) ( SURFACE-AT ?auto_3482 ?auto_3494 ) ( ON ?auto_3482 ?auto_3496 ) ( CLEAR ?auto_3482 ) ( not ( = ?auto_3481 ?auto_3482 ) ) ( not ( = ?auto_3481 ?auto_3496 ) ) ( not ( = ?auto_3482 ?auto_3496 ) ) ( not ( = ?auto_3485 ?auto_3495 ) ) ( IS-CRATE ?auto_3481 ) ( not ( = ?auto_3498 ?auto_3488 ) ) ( HOIST-AT ?auto_3490 ?auto_3498 ) ( AVAILABLE ?auto_3490 ) ( SURFACE-AT ?auto_3481 ?auto_3498 ) ( ON ?auto_3481 ?auto_3491 ) ( CLEAR ?auto_3481 ) ( not ( = ?auto_3480 ?auto_3481 ) ) ( not ( = ?auto_3480 ?auto_3491 ) ) ( not ( = ?auto_3481 ?auto_3491 ) ) ( not ( = ?auto_3485 ?auto_3490 ) ) ( SURFACE-AT ?auto_3479 ?auto_3488 ) ( CLEAR ?auto_3479 ) ( IS-CRATE ?auto_3480 ) ( AVAILABLE ?auto_3485 ) ( not ( = ?auto_3492 ?auto_3488 ) ) ( HOIST-AT ?auto_3497 ?auto_3492 ) ( AVAILABLE ?auto_3497 ) ( SURFACE-AT ?auto_3480 ?auto_3492 ) ( ON ?auto_3480 ?auto_3493 ) ( CLEAR ?auto_3480 ) ( TRUCK-AT ?auto_3484 ?auto_3488 ) ( not ( = ?auto_3479 ?auto_3480 ) ) ( not ( = ?auto_3479 ?auto_3493 ) ) ( not ( = ?auto_3480 ?auto_3493 ) ) ( not ( = ?auto_3485 ?auto_3497 ) ) ( not ( = ?auto_3479 ?auto_3481 ) ) ( not ( = ?auto_3479 ?auto_3491 ) ) ( not ( = ?auto_3481 ?auto_3493 ) ) ( not ( = ?auto_3498 ?auto_3492 ) ) ( not ( = ?auto_3490 ?auto_3497 ) ) ( not ( = ?auto_3491 ?auto_3493 ) ) ( not ( = ?auto_3479 ?auto_3482 ) ) ( not ( = ?auto_3479 ?auto_3496 ) ) ( not ( = ?auto_3480 ?auto_3482 ) ) ( not ( = ?auto_3480 ?auto_3496 ) ) ( not ( = ?auto_3482 ?auto_3491 ) ) ( not ( = ?auto_3482 ?auto_3493 ) ) ( not ( = ?auto_3494 ?auto_3498 ) ) ( not ( = ?auto_3494 ?auto_3492 ) ) ( not ( = ?auto_3495 ?auto_3490 ) ) ( not ( = ?auto_3495 ?auto_3497 ) ) ( not ( = ?auto_3496 ?auto_3491 ) ) ( not ( = ?auto_3496 ?auto_3493 ) ) ( not ( = ?auto_3479 ?auto_3483 ) ) ( not ( = ?auto_3479 ?auto_3486 ) ) ( not ( = ?auto_3480 ?auto_3483 ) ) ( not ( = ?auto_3480 ?auto_3486 ) ) ( not ( = ?auto_3481 ?auto_3483 ) ) ( not ( = ?auto_3481 ?auto_3486 ) ) ( not ( = ?auto_3483 ?auto_3496 ) ) ( not ( = ?auto_3483 ?auto_3491 ) ) ( not ( = ?auto_3483 ?auto_3493 ) ) ( not ( = ?auto_3489 ?auto_3494 ) ) ( not ( = ?auto_3489 ?auto_3498 ) ) ( not ( = ?auto_3489 ?auto_3492 ) ) ( not ( = ?auto_3487 ?auto_3495 ) ) ( not ( = ?auto_3487 ?auto_3490 ) ) ( not ( = ?auto_3487 ?auto_3497 ) ) ( not ( = ?auto_3486 ?auto_3496 ) ) ( not ( = ?auto_3486 ?auto_3491 ) ) ( not ( = ?auto_3486 ?auto_3493 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3479 ?auto_3480 ?auto_3481 ?auto_3482 )
      ( MAKE-1CRATE ?auto_3482 ?auto_3483 )
      ( MAKE-4CRATE-VERIFY ?auto_3479 ?auto_3480 ?auto_3481 ?auto_3482 ?auto_3483 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3501 - SURFACE
      ?auto_3502 - SURFACE
    )
    :vars
    (
      ?auto_3503 - HOIST
      ?auto_3504 - PLACE
      ?auto_3506 - PLACE
      ?auto_3507 - HOIST
      ?auto_3508 - SURFACE
      ?auto_3505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3503 ?auto_3504 ) ( SURFACE-AT ?auto_3501 ?auto_3504 ) ( CLEAR ?auto_3501 ) ( IS-CRATE ?auto_3502 ) ( AVAILABLE ?auto_3503 ) ( not ( = ?auto_3506 ?auto_3504 ) ) ( HOIST-AT ?auto_3507 ?auto_3506 ) ( AVAILABLE ?auto_3507 ) ( SURFACE-AT ?auto_3502 ?auto_3506 ) ( ON ?auto_3502 ?auto_3508 ) ( CLEAR ?auto_3502 ) ( TRUCK-AT ?auto_3505 ?auto_3504 ) ( not ( = ?auto_3501 ?auto_3502 ) ) ( not ( = ?auto_3501 ?auto_3508 ) ) ( not ( = ?auto_3502 ?auto_3508 ) ) ( not ( = ?auto_3503 ?auto_3507 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3505 ?auto_3504 ?auto_3506 )
      ( !LIFT ?auto_3507 ?auto_3502 ?auto_3508 ?auto_3506 )
      ( !LOAD ?auto_3507 ?auto_3502 ?auto_3505 ?auto_3506 )
      ( !DRIVE ?auto_3505 ?auto_3506 ?auto_3504 )
      ( !UNLOAD ?auto_3503 ?auto_3502 ?auto_3505 ?auto_3504 )
      ( !DROP ?auto_3503 ?auto_3502 ?auto_3501 ?auto_3504 )
      ( MAKE-1CRATE-VERIFY ?auto_3501 ?auto_3502 ) )
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
      ?auto_3522 - HOIST
      ?auto_3521 - PLACE
      ?auto_3526 - PLACE
      ?auto_3523 - HOIST
      ?auto_3524 - SURFACE
      ?auto_3527 - PLACE
      ?auto_3528 - HOIST
      ?auto_3533 - SURFACE
      ?auto_3535 - PLACE
      ?auto_3536 - HOIST
      ?auto_3537 - SURFACE
      ?auto_3532 - PLACE
      ?auto_3529 - HOIST
      ?auto_3531 - SURFACE
      ?auto_3530 - PLACE
      ?auto_3538 - HOIST
      ?auto_3534 - SURFACE
      ?auto_3525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3522 ?auto_3521 ) ( IS-CRATE ?auto_3520 ) ( not ( = ?auto_3526 ?auto_3521 ) ) ( HOIST-AT ?auto_3523 ?auto_3526 ) ( AVAILABLE ?auto_3523 ) ( SURFACE-AT ?auto_3520 ?auto_3526 ) ( ON ?auto_3520 ?auto_3524 ) ( CLEAR ?auto_3520 ) ( not ( = ?auto_3519 ?auto_3520 ) ) ( not ( = ?auto_3519 ?auto_3524 ) ) ( not ( = ?auto_3520 ?auto_3524 ) ) ( not ( = ?auto_3522 ?auto_3523 ) ) ( IS-CRATE ?auto_3519 ) ( not ( = ?auto_3527 ?auto_3521 ) ) ( HOIST-AT ?auto_3528 ?auto_3527 ) ( AVAILABLE ?auto_3528 ) ( SURFACE-AT ?auto_3519 ?auto_3527 ) ( ON ?auto_3519 ?auto_3533 ) ( CLEAR ?auto_3519 ) ( not ( = ?auto_3518 ?auto_3519 ) ) ( not ( = ?auto_3518 ?auto_3533 ) ) ( not ( = ?auto_3519 ?auto_3533 ) ) ( not ( = ?auto_3522 ?auto_3528 ) ) ( IS-CRATE ?auto_3518 ) ( not ( = ?auto_3535 ?auto_3521 ) ) ( HOIST-AT ?auto_3536 ?auto_3535 ) ( AVAILABLE ?auto_3536 ) ( SURFACE-AT ?auto_3518 ?auto_3535 ) ( ON ?auto_3518 ?auto_3537 ) ( CLEAR ?auto_3518 ) ( not ( = ?auto_3517 ?auto_3518 ) ) ( not ( = ?auto_3517 ?auto_3537 ) ) ( not ( = ?auto_3518 ?auto_3537 ) ) ( not ( = ?auto_3522 ?auto_3536 ) ) ( IS-CRATE ?auto_3517 ) ( not ( = ?auto_3532 ?auto_3521 ) ) ( HOIST-AT ?auto_3529 ?auto_3532 ) ( AVAILABLE ?auto_3529 ) ( SURFACE-AT ?auto_3517 ?auto_3532 ) ( ON ?auto_3517 ?auto_3531 ) ( CLEAR ?auto_3517 ) ( not ( = ?auto_3516 ?auto_3517 ) ) ( not ( = ?auto_3516 ?auto_3531 ) ) ( not ( = ?auto_3517 ?auto_3531 ) ) ( not ( = ?auto_3522 ?auto_3529 ) ) ( SURFACE-AT ?auto_3515 ?auto_3521 ) ( CLEAR ?auto_3515 ) ( IS-CRATE ?auto_3516 ) ( AVAILABLE ?auto_3522 ) ( not ( = ?auto_3530 ?auto_3521 ) ) ( HOIST-AT ?auto_3538 ?auto_3530 ) ( AVAILABLE ?auto_3538 ) ( SURFACE-AT ?auto_3516 ?auto_3530 ) ( ON ?auto_3516 ?auto_3534 ) ( CLEAR ?auto_3516 ) ( TRUCK-AT ?auto_3525 ?auto_3521 ) ( not ( = ?auto_3515 ?auto_3516 ) ) ( not ( = ?auto_3515 ?auto_3534 ) ) ( not ( = ?auto_3516 ?auto_3534 ) ) ( not ( = ?auto_3522 ?auto_3538 ) ) ( not ( = ?auto_3515 ?auto_3517 ) ) ( not ( = ?auto_3515 ?auto_3531 ) ) ( not ( = ?auto_3517 ?auto_3534 ) ) ( not ( = ?auto_3532 ?auto_3530 ) ) ( not ( = ?auto_3529 ?auto_3538 ) ) ( not ( = ?auto_3531 ?auto_3534 ) ) ( not ( = ?auto_3515 ?auto_3518 ) ) ( not ( = ?auto_3515 ?auto_3537 ) ) ( not ( = ?auto_3516 ?auto_3518 ) ) ( not ( = ?auto_3516 ?auto_3537 ) ) ( not ( = ?auto_3518 ?auto_3531 ) ) ( not ( = ?auto_3518 ?auto_3534 ) ) ( not ( = ?auto_3535 ?auto_3532 ) ) ( not ( = ?auto_3535 ?auto_3530 ) ) ( not ( = ?auto_3536 ?auto_3529 ) ) ( not ( = ?auto_3536 ?auto_3538 ) ) ( not ( = ?auto_3537 ?auto_3531 ) ) ( not ( = ?auto_3537 ?auto_3534 ) ) ( not ( = ?auto_3515 ?auto_3519 ) ) ( not ( = ?auto_3515 ?auto_3533 ) ) ( not ( = ?auto_3516 ?auto_3519 ) ) ( not ( = ?auto_3516 ?auto_3533 ) ) ( not ( = ?auto_3517 ?auto_3519 ) ) ( not ( = ?auto_3517 ?auto_3533 ) ) ( not ( = ?auto_3519 ?auto_3537 ) ) ( not ( = ?auto_3519 ?auto_3531 ) ) ( not ( = ?auto_3519 ?auto_3534 ) ) ( not ( = ?auto_3527 ?auto_3535 ) ) ( not ( = ?auto_3527 ?auto_3532 ) ) ( not ( = ?auto_3527 ?auto_3530 ) ) ( not ( = ?auto_3528 ?auto_3536 ) ) ( not ( = ?auto_3528 ?auto_3529 ) ) ( not ( = ?auto_3528 ?auto_3538 ) ) ( not ( = ?auto_3533 ?auto_3537 ) ) ( not ( = ?auto_3533 ?auto_3531 ) ) ( not ( = ?auto_3533 ?auto_3534 ) ) ( not ( = ?auto_3515 ?auto_3520 ) ) ( not ( = ?auto_3515 ?auto_3524 ) ) ( not ( = ?auto_3516 ?auto_3520 ) ) ( not ( = ?auto_3516 ?auto_3524 ) ) ( not ( = ?auto_3517 ?auto_3520 ) ) ( not ( = ?auto_3517 ?auto_3524 ) ) ( not ( = ?auto_3518 ?auto_3520 ) ) ( not ( = ?auto_3518 ?auto_3524 ) ) ( not ( = ?auto_3520 ?auto_3533 ) ) ( not ( = ?auto_3520 ?auto_3537 ) ) ( not ( = ?auto_3520 ?auto_3531 ) ) ( not ( = ?auto_3520 ?auto_3534 ) ) ( not ( = ?auto_3526 ?auto_3527 ) ) ( not ( = ?auto_3526 ?auto_3535 ) ) ( not ( = ?auto_3526 ?auto_3532 ) ) ( not ( = ?auto_3526 ?auto_3530 ) ) ( not ( = ?auto_3523 ?auto_3528 ) ) ( not ( = ?auto_3523 ?auto_3536 ) ) ( not ( = ?auto_3523 ?auto_3529 ) ) ( not ( = ?auto_3523 ?auto_3538 ) ) ( not ( = ?auto_3524 ?auto_3533 ) ) ( not ( = ?auto_3524 ?auto_3537 ) ) ( not ( = ?auto_3524 ?auto_3531 ) ) ( not ( = ?auto_3524 ?auto_3534 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3515 ?auto_3516 ?auto_3517 ?auto_3518 ?auto_3519 )
      ( MAKE-1CRATE ?auto_3519 ?auto_3520 )
      ( MAKE-5CRATE-VERIFY ?auto_3515 ?auto_3516 ?auto_3517 ?auto_3518 ?auto_3519 ?auto_3520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3541 - SURFACE
      ?auto_3542 - SURFACE
    )
    :vars
    (
      ?auto_3543 - HOIST
      ?auto_3544 - PLACE
      ?auto_3546 - PLACE
      ?auto_3547 - HOIST
      ?auto_3548 - SURFACE
      ?auto_3545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3543 ?auto_3544 ) ( SURFACE-AT ?auto_3541 ?auto_3544 ) ( CLEAR ?auto_3541 ) ( IS-CRATE ?auto_3542 ) ( AVAILABLE ?auto_3543 ) ( not ( = ?auto_3546 ?auto_3544 ) ) ( HOIST-AT ?auto_3547 ?auto_3546 ) ( AVAILABLE ?auto_3547 ) ( SURFACE-AT ?auto_3542 ?auto_3546 ) ( ON ?auto_3542 ?auto_3548 ) ( CLEAR ?auto_3542 ) ( TRUCK-AT ?auto_3545 ?auto_3544 ) ( not ( = ?auto_3541 ?auto_3542 ) ) ( not ( = ?auto_3541 ?auto_3548 ) ) ( not ( = ?auto_3542 ?auto_3548 ) ) ( not ( = ?auto_3543 ?auto_3547 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3545 ?auto_3544 ?auto_3546 )
      ( !LIFT ?auto_3547 ?auto_3542 ?auto_3548 ?auto_3546 )
      ( !LOAD ?auto_3547 ?auto_3542 ?auto_3545 ?auto_3546 )
      ( !DRIVE ?auto_3545 ?auto_3546 ?auto_3544 )
      ( !UNLOAD ?auto_3543 ?auto_3542 ?auto_3545 ?auto_3544 )
      ( !DROP ?auto_3543 ?auto_3542 ?auto_3541 ?auto_3544 )
      ( MAKE-1CRATE-VERIFY ?auto_3541 ?auto_3542 ) )
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
      ?auto_3563 - HOIST
      ?auto_3568 - PLACE
      ?auto_3566 - PLACE
      ?auto_3567 - HOIST
      ?auto_3565 - SURFACE
      ?auto_3574 - PLACE
      ?auto_3583 - HOIST
      ?auto_3582 - SURFACE
      ?auto_3575 - PLACE
      ?auto_3576 - HOIST
      ?auto_3579 - SURFACE
      ?auto_3571 - PLACE
      ?auto_3577 - HOIST
      ?auto_3573 - SURFACE
      ?auto_3578 - PLACE
      ?auto_3570 - HOIST
      ?auto_3580 - SURFACE
      ?auto_3581 - PLACE
      ?auto_3572 - HOIST
      ?auto_3569 - SURFACE
      ?auto_3564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3563 ?auto_3568 ) ( IS-CRATE ?auto_3562 ) ( not ( = ?auto_3566 ?auto_3568 ) ) ( HOIST-AT ?auto_3567 ?auto_3566 ) ( AVAILABLE ?auto_3567 ) ( SURFACE-AT ?auto_3562 ?auto_3566 ) ( ON ?auto_3562 ?auto_3565 ) ( CLEAR ?auto_3562 ) ( not ( = ?auto_3561 ?auto_3562 ) ) ( not ( = ?auto_3561 ?auto_3565 ) ) ( not ( = ?auto_3562 ?auto_3565 ) ) ( not ( = ?auto_3563 ?auto_3567 ) ) ( IS-CRATE ?auto_3561 ) ( not ( = ?auto_3574 ?auto_3568 ) ) ( HOIST-AT ?auto_3583 ?auto_3574 ) ( AVAILABLE ?auto_3583 ) ( SURFACE-AT ?auto_3561 ?auto_3574 ) ( ON ?auto_3561 ?auto_3582 ) ( CLEAR ?auto_3561 ) ( not ( = ?auto_3560 ?auto_3561 ) ) ( not ( = ?auto_3560 ?auto_3582 ) ) ( not ( = ?auto_3561 ?auto_3582 ) ) ( not ( = ?auto_3563 ?auto_3583 ) ) ( IS-CRATE ?auto_3560 ) ( not ( = ?auto_3575 ?auto_3568 ) ) ( HOIST-AT ?auto_3576 ?auto_3575 ) ( AVAILABLE ?auto_3576 ) ( SURFACE-AT ?auto_3560 ?auto_3575 ) ( ON ?auto_3560 ?auto_3579 ) ( CLEAR ?auto_3560 ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( not ( = ?auto_3559 ?auto_3579 ) ) ( not ( = ?auto_3560 ?auto_3579 ) ) ( not ( = ?auto_3563 ?auto_3576 ) ) ( IS-CRATE ?auto_3559 ) ( not ( = ?auto_3571 ?auto_3568 ) ) ( HOIST-AT ?auto_3577 ?auto_3571 ) ( AVAILABLE ?auto_3577 ) ( SURFACE-AT ?auto_3559 ?auto_3571 ) ( ON ?auto_3559 ?auto_3573 ) ( CLEAR ?auto_3559 ) ( not ( = ?auto_3558 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3573 ) ) ( not ( = ?auto_3559 ?auto_3573 ) ) ( not ( = ?auto_3563 ?auto_3577 ) ) ( IS-CRATE ?auto_3558 ) ( not ( = ?auto_3578 ?auto_3568 ) ) ( HOIST-AT ?auto_3570 ?auto_3578 ) ( AVAILABLE ?auto_3570 ) ( SURFACE-AT ?auto_3558 ?auto_3578 ) ( ON ?auto_3558 ?auto_3580 ) ( CLEAR ?auto_3558 ) ( not ( = ?auto_3557 ?auto_3558 ) ) ( not ( = ?auto_3557 ?auto_3580 ) ) ( not ( = ?auto_3558 ?auto_3580 ) ) ( not ( = ?auto_3563 ?auto_3570 ) ) ( SURFACE-AT ?auto_3556 ?auto_3568 ) ( CLEAR ?auto_3556 ) ( IS-CRATE ?auto_3557 ) ( AVAILABLE ?auto_3563 ) ( not ( = ?auto_3581 ?auto_3568 ) ) ( HOIST-AT ?auto_3572 ?auto_3581 ) ( AVAILABLE ?auto_3572 ) ( SURFACE-AT ?auto_3557 ?auto_3581 ) ( ON ?auto_3557 ?auto_3569 ) ( CLEAR ?auto_3557 ) ( TRUCK-AT ?auto_3564 ?auto_3568 ) ( not ( = ?auto_3556 ?auto_3557 ) ) ( not ( = ?auto_3556 ?auto_3569 ) ) ( not ( = ?auto_3557 ?auto_3569 ) ) ( not ( = ?auto_3563 ?auto_3572 ) ) ( not ( = ?auto_3556 ?auto_3558 ) ) ( not ( = ?auto_3556 ?auto_3580 ) ) ( not ( = ?auto_3558 ?auto_3569 ) ) ( not ( = ?auto_3578 ?auto_3581 ) ) ( not ( = ?auto_3570 ?auto_3572 ) ) ( not ( = ?auto_3580 ?auto_3569 ) ) ( not ( = ?auto_3556 ?auto_3559 ) ) ( not ( = ?auto_3556 ?auto_3573 ) ) ( not ( = ?auto_3557 ?auto_3559 ) ) ( not ( = ?auto_3557 ?auto_3573 ) ) ( not ( = ?auto_3559 ?auto_3580 ) ) ( not ( = ?auto_3559 ?auto_3569 ) ) ( not ( = ?auto_3571 ?auto_3578 ) ) ( not ( = ?auto_3571 ?auto_3581 ) ) ( not ( = ?auto_3577 ?auto_3570 ) ) ( not ( = ?auto_3577 ?auto_3572 ) ) ( not ( = ?auto_3573 ?auto_3580 ) ) ( not ( = ?auto_3573 ?auto_3569 ) ) ( not ( = ?auto_3556 ?auto_3560 ) ) ( not ( = ?auto_3556 ?auto_3579 ) ) ( not ( = ?auto_3557 ?auto_3560 ) ) ( not ( = ?auto_3557 ?auto_3579 ) ) ( not ( = ?auto_3558 ?auto_3560 ) ) ( not ( = ?auto_3558 ?auto_3579 ) ) ( not ( = ?auto_3560 ?auto_3573 ) ) ( not ( = ?auto_3560 ?auto_3580 ) ) ( not ( = ?auto_3560 ?auto_3569 ) ) ( not ( = ?auto_3575 ?auto_3571 ) ) ( not ( = ?auto_3575 ?auto_3578 ) ) ( not ( = ?auto_3575 ?auto_3581 ) ) ( not ( = ?auto_3576 ?auto_3577 ) ) ( not ( = ?auto_3576 ?auto_3570 ) ) ( not ( = ?auto_3576 ?auto_3572 ) ) ( not ( = ?auto_3579 ?auto_3573 ) ) ( not ( = ?auto_3579 ?auto_3580 ) ) ( not ( = ?auto_3579 ?auto_3569 ) ) ( not ( = ?auto_3556 ?auto_3561 ) ) ( not ( = ?auto_3556 ?auto_3582 ) ) ( not ( = ?auto_3557 ?auto_3561 ) ) ( not ( = ?auto_3557 ?auto_3582 ) ) ( not ( = ?auto_3558 ?auto_3561 ) ) ( not ( = ?auto_3558 ?auto_3582 ) ) ( not ( = ?auto_3559 ?auto_3561 ) ) ( not ( = ?auto_3559 ?auto_3582 ) ) ( not ( = ?auto_3561 ?auto_3579 ) ) ( not ( = ?auto_3561 ?auto_3573 ) ) ( not ( = ?auto_3561 ?auto_3580 ) ) ( not ( = ?auto_3561 ?auto_3569 ) ) ( not ( = ?auto_3574 ?auto_3575 ) ) ( not ( = ?auto_3574 ?auto_3571 ) ) ( not ( = ?auto_3574 ?auto_3578 ) ) ( not ( = ?auto_3574 ?auto_3581 ) ) ( not ( = ?auto_3583 ?auto_3576 ) ) ( not ( = ?auto_3583 ?auto_3577 ) ) ( not ( = ?auto_3583 ?auto_3570 ) ) ( not ( = ?auto_3583 ?auto_3572 ) ) ( not ( = ?auto_3582 ?auto_3579 ) ) ( not ( = ?auto_3582 ?auto_3573 ) ) ( not ( = ?auto_3582 ?auto_3580 ) ) ( not ( = ?auto_3582 ?auto_3569 ) ) ( not ( = ?auto_3556 ?auto_3562 ) ) ( not ( = ?auto_3556 ?auto_3565 ) ) ( not ( = ?auto_3557 ?auto_3562 ) ) ( not ( = ?auto_3557 ?auto_3565 ) ) ( not ( = ?auto_3558 ?auto_3562 ) ) ( not ( = ?auto_3558 ?auto_3565 ) ) ( not ( = ?auto_3559 ?auto_3562 ) ) ( not ( = ?auto_3559 ?auto_3565 ) ) ( not ( = ?auto_3560 ?auto_3562 ) ) ( not ( = ?auto_3560 ?auto_3565 ) ) ( not ( = ?auto_3562 ?auto_3582 ) ) ( not ( = ?auto_3562 ?auto_3579 ) ) ( not ( = ?auto_3562 ?auto_3573 ) ) ( not ( = ?auto_3562 ?auto_3580 ) ) ( not ( = ?auto_3562 ?auto_3569 ) ) ( not ( = ?auto_3566 ?auto_3574 ) ) ( not ( = ?auto_3566 ?auto_3575 ) ) ( not ( = ?auto_3566 ?auto_3571 ) ) ( not ( = ?auto_3566 ?auto_3578 ) ) ( not ( = ?auto_3566 ?auto_3581 ) ) ( not ( = ?auto_3567 ?auto_3583 ) ) ( not ( = ?auto_3567 ?auto_3576 ) ) ( not ( = ?auto_3567 ?auto_3577 ) ) ( not ( = ?auto_3567 ?auto_3570 ) ) ( not ( = ?auto_3567 ?auto_3572 ) ) ( not ( = ?auto_3565 ?auto_3582 ) ) ( not ( = ?auto_3565 ?auto_3579 ) ) ( not ( = ?auto_3565 ?auto_3573 ) ) ( not ( = ?auto_3565 ?auto_3580 ) ) ( not ( = ?auto_3565 ?auto_3569 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3556 ?auto_3557 ?auto_3558 ?auto_3559 ?auto_3560 ?auto_3561 )
      ( MAKE-1CRATE ?auto_3561 ?auto_3562 )
      ( MAKE-6CRATE-VERIFY ?auto_3556 ?auto_3557 ?auto_3558 ?auto_3559 ?auto_3560 ?auto_3561 ?auto_3562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3586 - SURFACE
      ?auto_3587 - SURFACE
    )
    :vars
    (
      ?auto_3588 - HOIST
      ?auto_3589 - PLACE
      ?auto_3591 - PLACE
      ?auto_3592 - HOIST
      ?auto_3593 - SURFACE
      ?auto_3590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3588 ?auto_3589 ) ( SURFACE-AT ?auto_3586 ?auto_3589 ) ( CLEAR ?auto_3586 ) ( IS-CRATE ?auto_3587 ) ( AVAILABLE ?auto_3588 ) ( not ( = ?auto_3591 ?auto_3589 ) ) ( HOIST-AT ?auto_3592 ?auto_3591 ) ( AVAILABLE ?auto_3592 ) ( SURFACE-AT ?auto_3587 ?auto_3591 ) ( ON ?auto_3587 ?auto_3593 ) ( CLEAR ?auto_3587 ) ( TRUCK-AT ?auto_3590 ?auto_3589 ) ( not ( = ?auto_3586 ?auto_3587 ) ) ( not ( = ?auto_3586 ?auto_3593 ) ) ( not ( = ?auto_3587 ?auto_3593 ) ) ( not ( = ?auto_3588 ?auto_3592 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3590 ?auto_3589 ?auto_3591 )
      ( !LIFT ?auto_3592 ?auto_3587 ?auto_3593 ?auto_3591 )
      ( !LOAD ?auto_3592 ?auto_3587 ?auto_3590 ?auto_3591 )
      ( !DRIVE ?auto_3590 ?auto_3591 ?auto_3589 )
      ( !UNLOAD ?auto_3588 ?auto_3587 ?auto_3590 ?auto_3589 )
      ( !DROP ?auto_3588 ?auto_3587 ?auto_3586 ?auto_3589 )
      ( MAKE-1CRATE-VERIFY ?auto_3586 ?auto_3587 ) )
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
      ?auto_3609 - SURFACE
      ?auto_3608 - SURFACE
    )
    :vars
    (
      ?auto_3611 - HOIST
      ?auto_3610 - PLACE
      ?auto_3612 - PLACE
      ?auto_3615 - HOIST
      ?auto_3614 - SURFACE
      ?auto_3630 - PLACE
      ?auto_3633 - HOIST
      ?auto_3616 - SURFACE
      ?auto_3626 - PLACE
      ?auto_3631 - HOIST
      ?auto_3623 - SURFACE
      ?auto_3625 - PLACE
      ?auto_3624 - HOIST
      ?auto_3619 - SURFACE
      ?auto_3629 - PLACE
      ?auto_3618 - HOIST
      ?auto_3627 - SURFACE
      ?auto_3620 - PLACE
      ?auto_3632 - HOIST
      ?auto_3621 - SURFACE
      ?auto_3622 - PLACE
      ?auto_3617 - HOIST
      ?auto_3628 - SURFACE
      ?auto_3613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3611 ?auto_3610 ) ( IS-CRATE ?auto_3608 ) ( not ( = ?auto_3612 ?auto_3610 ) ) ( HOIST-AT ?auto_3615 ?auto_3612 ) ( AVAILABLE ?auto_3615 ) ( SURFACE-AT ?auto_3608 ?auto_3612 ) ( ON ?auto_3608 ?auto_3614 ) ( CLEAR ?auto_3608 ) ( not ( = ?auto_3609 ?auto_3608 ) ) ( not ( = ?auto_3609 ?auto_3614 ) ) ( not ( = ?auto_3608 ?auto_3614 ) ) ( not ( = ?auto_3611 ?auto_3615 ) ) ( IS-CRATE ?auto_3609 ) ( not ( = ?auto_3630 ?auto_3610 ) ) ( HOIST-AT ?auto_3633 ?auto_3630 ) ( AVAILABLE ?auto_3633 ) ( SURFACE-AT ?auto_3609 ?auto_3630 ) ( ON ?auto_3609 ?auto_3616 ) ( CLEAR ?auto_3609 ) ( not ( = ?auto_3607 ?auto_3609 ) ) ( not ( = ?auto_3607 ?auto_3616 ) ) ( not ( = ?auto_3609 ?auto_3616 ) ) ( not ( = ?auto_3611 ?auto_3633 ) ) ( IS-CRATE ?auto_3607 ) ( not ( = ?auto_3626 ?auto_3610 ) ) ( HOIST-AT ?auto_3631 ?auto_3626 ) ( AVAILABLE ?auto_3631 ) ( SURFACE-AT ?auto_3607 ?auto_3626 ) ( ON ?auto_3607 ?auto_3623 ) ( CLEAR ?auto_3607 ) ( not ( = ?auto_3606 ?auto_3607 ) ) ( not ( = ?auto_3606 ?auto_3623 ) ) ( not ( = ?auto_3607 ?auto_3623 ) ) ( not ( = ?auto_3611 ?auto_3631 ) ) ( IS-CRATE ?auto_3606 ) ( not ( = ?auto_3625 ?auto_3610 ) ) ( HOIST-AT ?auto_3624 ?auto_3625 ) ( AVAILABLE ?auto_3624 ) ( SURFACE-AT ?auto_3606 ?auto_3625 ) ( ON ?auto_3606 ?auto_3619 ) ( CLEAR ?auto_3606 ) ( not ( = ?auto_3605 ?auto_3606 ) ) ( not ( = ?auto_3605 ?auto_3619 ) ) ( not ( = ?auto_3606 ?auto_3619 ) ) ( not ( = ?auto_3611 ?auto_3624 ) ) ( IS-CRATE ?auto_3605 ) ( not ( = ?auto_3629 ?auto_3610 ) ) ( HOIST-AT ?auto_3618 ?auto_3629 ) ( AVAILABLE ?auto_3618 ) ( SURFACE-AT ?auto_3605 ?auto_3629 ) ( ON ?auto_3605 ?auto_3627 ) ( CLEAR ?auto_3605 ) ( not ( = ?auto_3604 ?auto_3605 ) ) ( not ( = ?auto_3604 ?auto_3627 ) ) ( not ( = ?auto_3605 ?auto_3627 ) ) ( not ( = ?auto_3611 ?auto_3618 ) ) ( IS-CRATE ?auto_3604 ) ( not ( = ?auto_3620 ?auto_3610 ) ) ( HOIST-AT ?auto_3632 ?auto_3620 ) ( AVAILABLE ?auto_3632 ) ( SURFACE-AT ?auto_3604 ?auto_3620 ) ( ON ?auto_3604 ?auto_3621 ) ( CLEAR ?auto_3604 ) ( not ( = ?auto_3603 ?auto_3604 ) ) ( not ( = ?auto_3603 ?auto_3621 ) ) ( not ( = ?auto_3604 ?auto_3621 ) ) ( not ( = ?auto_3611 ?auto_3632 ) ) ( SURFACE-AT ?auto_3602 ?auto_3610 ) ( CLEAR ?auto_3602 ) ( IS-CRATE ?auto_3603 ) ( AVAILABLE ?auto_3611 ) ( not ( = ?auto_3622 ?auto_3610 ) ) ( HOIST-AT ?auto_3617 ?auto_3622 ) ( AVAILABLE ?auto_3617 ) ( SURFACE-AT ?auto_3603 ?auto_3622 ) ( ON ?auto_3603 ?auto_3628 ) ( CLEAR ?auto_3603 ) ( TRUCK-AT ?auto_3613 ?auto_3610 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3628 ) ) ( not ( = ?auto_3603 ?auto_3628 ) ) ( not ( = ?auto_3611 ?auto_3617 ) ) ( not ( = ?auto_3602 ?auto_3604 ) ) ( not ( = ?auto_3602 ?auto_3621 ) ) ( not ( = ?auto_3604 ?auto_3628 ) ) ( not ( = ?auto_3620 ?auto_3622 ) ) ( not ( = ?auto_3632 ?auto_3617 ) ) ( not ( = ?auto_3621 ?auto_3628 ) ) ( not ( = ?auto_3602 ?auto_3605 ) ) ( not ( = ?auto_3602 ?auto_3627 ) ) ( not ( = ?auto_3603 ?auto_3605 ) ) ( not ( = ?auto_3603 ?auto_3627 ) ) ( not ( = ?auto_3605 ?auto_3621 ) ) ( not ( = ?auto_3605 ?auto_3628 ) ) ( not ( = ?auto_3629 ?auto_3620 ) ) ( not ( = ?auto_3629 ?auto_3622 ) ) ( not ( = ?auto_3618 ?auto_3632 ) ) ( not ( = ?auto_3618 ?auto_3617 ) ) ( not ( = ?auto_3627 ?auto_3621 ) ) ( not ( = ?auto_3627 ?auto_3628 ) ) ( not ( = ?auto_3602 ?auto_3606 ) ) ( not ( = ?auto_3602 ?auto_3619 ) ) ( not ( = ?auto_3603 ?auto_3606 ) ) ( not ( = ?auto_3603 ?auto_3619 ) ) ( not ( = ?auto_3604 ?auto_3606 ) ) ( not ( = ?auto_3604 ?auto_3619 ) ) ( not ( = ?auto_3606 ?auto_3627 ) ) ( not ( = ?auto_3606 ?auto_3621 ) ) ( not ( = ?auto_3606 ?auto_3628 ) ) ( not ( = ?auto_3625 ?auto_3629 ) ) ( not ( = ?auto_3625 ?auto_3620 ) ) ( not ( = ?auto_3625 ?auto_3622 ) ) ( not ( = ?auto_3624 ?auto_3618 ) ) ( not ( = ?auto_3624 ?auto_3632 ) ) ( not ( = ?auto_3624 ?auto_3617 ) ) ( not ( = ?auto_3619 ?auto_3627 ) ) ( not ( = ?auto_3619 ?auto_3621 ) ) ( not ( = ?auto_3619 ?auto_3628 ) ) ( not ( = ?auto_3602 ?auto_3607 ) ) ( not ( = ?auto_3602 ?auto_3623 ) ) ( not ( = ?auto_3603 ?auto_3607 ) ) ( not ( = ?auto_3603 ?auto_3623 ) ) ( not ( = ?auto_3604 ?auto_3607 ) ) ( not ( = ?auto_3604 ?auto_3623 ) ) ( not ( = ?auto_3605 ?auto_3607 ) ) ( not ( = ?auto_3605 ?auto_3623 ) ) ( not ( = ?auto_3607 ?auto_3619 ) ) ( not ( = ?auto_3607 ?auto_3627 ) ) ( not ( = ?auto_3607 ?auto_3621 ) ) ( not ( = ?auto_3607 ?auto_3628 ) ) ( not ( = ?auto_3626 ?auto_3625 ) ) ( not ( = ?auto_3626 ?auto_3629 ) ) ( not ( = ?auto_3626 ?auto_3620 ) ) ( not ( = ?auto_3626 ?auto_3622 ) ) ( not ( = ?auto_3631 ?auto_3624 ) ) ( not ( = ?auto_3631 ?auto_3618 ) ) ( not ( = ?auto_3631 ?auto_3632 ) ) ( not ( = ?auto_3631 ?auto_3617 ) ) ( not ( = ?auto_3623 ?auto_3619 ) ) ( not ( = ?auto_3623 ?auto_3627 ) ) ( not ( = ?auto_3623 ?auto_3621 ) ) ( not ( = ?auto_3623 ?auto_3628 ) ) ( not ( = ?auto_3602 ?auto_3609 ) ) ( not ( = ?auto_3602 ?auto_3616 ) ) ( not ( = ?auto_3603 ?auto_3609 ) ) ( not ( = ?auto_3603 ?auto_3616 ) ) ( not ( = ?auto_3604 ?auto_3609 ) ) ( not ( = ?auto_3604 ?auto_3616 ) ) ( not ( = ?auto_3605 ?auto_3609 ) ) ( not ( = ?auto_3605 ?auto_3616 ) ) ( not ( = ?auto_3606 ?auto_3609 ) ) ( not ( = ?auto_3606 ?auto_3616 ) ) ( not ( = ?auto_3609 ?auto_3623 ) ) ( not ( = ?auto_3609 ?auto_3619 ) ) ( not ( = ?auto_3609 ?auto_3627 ) ) ( not ( = ?auto_3609 ?auto_3621 ) ) ( not ( = ?auto_3609 ?auto_3628 ) ) ( not ( = ?auto_3630 ?auto_3626 ) ) ( not ( = ?auto_3630 ?auto_3625 ) ) ( not ( = ?auto_3630 ?auto_3629 ) ) ( not ( = ?auto_3630 ?auto_3620 ) ) ( not ( = ?auto_3630 ?auto_3622 ) ) ( not ( = ?auto_3633 ?auto_3631 ) ) ( not ( = ?auto_3633 ?auto_3624 ) ) ( not ( = ?auto_3633 ?auto_3618 ) ) ( not ( = ?auto_3633 ?auto_3632 ) ) ( not ( = ?auto_3633 ?auto_3617 ) ) ( not ( = ?auto_3616 ?auto_3623 ) ) ( not ( = ?auto_3616 ?auto_3619 ) ) ( not ( = ?auto_3616 ?auto_3627 ) ) ( not ( = ?auto_3616 ?auto_3621 ) ) ( not ( = ?auto_3616 ?auto_3628 ) ) ( not ( = ?auto_3602 ?auto_3608 ) ) ( not ( = ?auto_3602 ?auto_3614 ) ) ( not ( = ?auto_3603 ?auto_3608 ) ) ( not ( = ?auto_3603 ?auto_3614 ) ) ( not ( = ?auto_3604 ?auto_3608 ) ) ( not ( = ?auto_3604 ?auto_3614 ) ) ( not ( = ?auto_3605 ?auto_3608 ) ) ( not ( = ?auto_3605 ?auto_3614 ) ) ( not ( = ?auto_3606 ?auto_3608 ) ) ( not ( = ?auto_3606 ?auto_3614 ) ) ( not ( = ?auto_3607 ?auto_3608 ) ) ( not ( = ?auto_3607 ?auto_3614 ) ) ( not ( = ?auto_3608 ?auto_3616 ) ) ( not ( = ?auto_3608 ?auto_3623 ) ) ( not ( = ?auto_3608 ?auto_3619 ) ) ( not ( = ?auto_3608 ?auto_3627 ) ) ( not ( = ?auto_3608 ?auto_3621 ) ) ( not ( = ?auto_3608 ?auto_3628 ) ) ( not ( = ?auto_3612 ?auto_3630 ) ) ( not ( = ?auto_3612 ?auto_3626 ) ) ( not ( = ?auto_3612 ?auto_3625 ) ) ( not ( = ?auto_3612 ?auto_3629 ) ) ( not ( = ?auto_3612 ?auto_3620 ) ) ( not ( = ?auto_3612 ?auto_3622 ) ) ( not ( = ?auto_3615 ?auto_3633 ) ) ( not ( = ?auto_3615 ?auto_3631 ) ) ( not ( = ?auto_3615 ?auto_3624 ) ) ( not ( = ?auto_3615 ?auto_3618 ) ) ( not ( = ?auto_3615 ?auto_3632 ) ) ( not ( = ?auto_3615 ?auto_3617 ) ) ( not ( = ?auto_3614 ?auto_3616 ) ) ( not ( = ?auto_3614 ?auto_3623 ) ) ( not ( = ?auto_3614 ?auto_3619 ) ) ( not ( = ?auto_3614 ?auto_3627 ) ) ( not ( = ?auto_3614 ?auto_3621 ) ) ( not ( = ?auto_3614 ?auto_3628 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3602 ?auto_3603 ?auto_3604 ?auto_3605 ?auto_3606 ?auto_3607 ?auto_3609 )
      ( MAKE-1CRATE ?auto_3609 ?auto_3608 )
      ( MAKE-7CRATE-VERIFY ?auto_3602 ?auto_3603 ?auto_3604 ?auto_3605 ?auto_3606 ?auto_3607 ?auto_3609 ?auto_3608 ) )
  )

)

