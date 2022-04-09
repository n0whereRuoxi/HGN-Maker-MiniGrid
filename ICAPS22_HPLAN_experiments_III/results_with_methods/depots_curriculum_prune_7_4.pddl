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
      ?auto_3383 - SURFACE
      ?auto_3384 - SURFACE
    )
    :vars
    (
      ?auto_3385 - HOIST
      ?auto_3386 - PLACE
      ?auto_3388 - PLACE
      ?auto_3389 - HOIST
      ?auto_3390 - SURFACE
      ?auto_3387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3385 ?auto_3386 ) ( SURFACE-AT ?auto_3383 ?auto_3386 ) ( CLEAR ?auto_3383 ) ( IS-CRATE ?auto_3384 ) ( AVAILABLE ?auto_3385 ) ( not ( = ?auto_3388 ?auto_3386 ) ) ( HOIST-AT ?auto_3389 ?auto_3388 ) ( AVAILABLE ?auto_3389 ) ( SURFACE-AT ?auto_3384 ?auto_3388 ) ( ON ?auto_3384 ?auto_3390 ) ( CLEAR ?auto_3384 ) ( TRUCK-AT ?auto_3387 ?auto_3386 ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( not ( = ?auto_3383 ?auto_3390 ) ) ( not ( = ?auto_3384 ?auto_3390 ) ) ( not ( = ?auto_3385 ?auto_3389 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3387 ?auto_3386 ?auto_3388 )
      ( !LIFT ?auto_3389 ?auto_3384 ?auto_3390 ?auto_3388 )
      ( !LOAD ?auto_3389 ?auto_3384 ?auto_3387 ?auto_3388 )
      ( !DRIVE ?auto_3387 ?auto_3388 ?auto_3386 )
      ( !UNLOAD ?auto_3385 ?auto_3384 ?auto_3387 ?auto_3386 )
      ( !DROP ?auto_3385 ?auto_3384 ?auto_3383 ?auto_3386 )
      ( MAKE-1CRATE-VERIFY ?auto_3383 ?auto_3384 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3404 - SURFACE
      ?auto_3405 - SURFACE
      ?auto_3406 - SURFACE
    )
    :vars
    (
      ?auto_3409 - HOIST
      ?auto_3412 - PLACE
      ?auto_3411 - PLACE
      ?auto_3410 - HOIST
      ?auto_3407 - SURFACE
      ?auto_3414 - PLACE
      ?auto_3413 - HOIST
      ?auto_3415 - SURFACE
      ?auto_3408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3409 ?auto_3412 ) ( IS-CRATE ?auto_3406 ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( HOIST-AT ?auto_3410 ?auto_3411 ) ( AVAILABLE ?auto_3410 ) ( SURFACE-AT ?auto_3406 ?auto_3411 ) ( ON ?auto_3406 ?auto_3407 ) ( CLEAR ?auto_3406 ) ( not ( = ?auto_3405 ?auto_3406 ) ) ( not ( = ?auto_3405 ?auto_3407 ) ) ( not ( = ?auto_3406 ?auto_3407 ) ) ( not ( = ?auto_3409 ?auto_3410 ) ) ( SURFACE-AT ?auto_3404 ?auto_3412 ) ( CLEAR ?auto_3404 ) ( IS-CRATE ?auto_3405 ) ( AVAILABLE ?auto_3409 ) ( not ( = ?auto_3414 ?auto_3412 ) ) ( HOIST-AT ?auto_3413 ?auto_3414 ) ( AVAILABLE ?auto_3413 ) ( SURFACE-AT ?auto_3405 ?auto_3414 ) ( ON ?auto_3405 ?auto_3415 ) ( CLEAR ?auto_3405 ) ( TRUCK-AT ?auto_3408 ?auto_3412 ) ( not ( = ?auto_3404 ?auto_3405 ) ) ( not ( = ?auto_3404 ?auto_3415 ) ) ( not ( = ?auto_3405 ?auto_3415 ) ) ( not ( = ?auto_3409 ?auto_3413 ) ) ( not ( = ?auto_3404 ?auto_3406 ) ) ( not ( = ?auto_3404 ?auto_3407 ) ) ( not ( = ?auto_3406 ?auto_3415 ) ) ( not ( = ?auto_3411 ?auto_3414 ) ) ( not ( = ?auto_3410 ?auto_3413 ) ) ( not ( = ?auto_3407 ?auto_3415 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3404 ?auto_3405 )
      ( MAKE-1CRATE ?auto_3405 ?auto_3406 )
      ( MAKE-2CRATE-VERIFY ?auto_3404 ?auto_3405 ?auto_3406 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3430 - SURFACE
      ?auto_3431 - SURFACE
      ?auto_3432 - SURFACE
      ?auto_3433 - SURFACE
    )
    :vars
    (
      ?auto_3435 - HOIST
      ?auto_3438 - PLACE
      ?auto_3439 - PLACE
      ?auto_3436 - HOIST
      ?auto_3437 - SURFACE
      ?auto_3441 - PLACE
      ?auto_3442 - HOIST
      ?auto_3444 - SURFACE
      ?auto_3443 - PLACE
      ?auto_3445 - HOIST
      ?auto_3440 - SURFACE
      ?auto_3434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3435 ?auto_3438 ) ( IS-CRATE ?auto_3433 ) ( not ( = ?auto_3439 ?auto_3438 ) ) ( HOIST-AT ?auto_3436 ?auto_3439 ) ( AVAILABLE ?auto_3436 ) ( SURFACE-AT ?auto_3433 ?auto_3439 ) ( ON ?auto_3433 ?auto_3437 ) ( CLEAR ?auto_3433 ) ( not ( = ?auto_3432 ?auto_3433 ) ) ( not ( = ?auto_3432 ?auto_3437 ) ) ( not ( = ?auto_3433 ?auto_3437 ) ) ( not ( = ?auto_3435 ?auto_3436 ) ) ( IS-CRATE ?auto_3432 ) ( not ( = ?auto_3441 ?auto_3438 ) ) ( HOIST-AT ?auto_3442 ?auto_3441 ) ( AVAILABLE ?auto_3442 ) ( SURFACE-AT ?auto_3432 ?auto_3441 ) ( ON ?auto_3432 ?auto_3444 ) ( CLEAR ?auto_3432 ) ( not ( = ?auto_3431 ?auto_3432 ) ) ( not ( = ?auto_3431 ?auto_3444 ) ) ( not ( = ?auto_3432 ?auto_3444 ) ) ( not ( = ?auto_3435 ?auto_3442 ) ) ( SURFACE-AT ?auto_3430 ?auto_3438 ) ( CLEAR ?auto_3430 ) ( IS-CRATE ?auto_3431 ) ( AVAILABLE ?auto_3435 ) ( not ( = ?auto_3443 ?auto_3438 ) ) ( HOIST-AT ?auto_3445 ?auto_3443 ) ( AVAILABLE ?auto_3445 ) ( SURFACE-AT ?auto_3431 ?auto_3443 ) ( ON ?auto_3431 ?auto_3440 ) ( CLEAR ?auto_3431 ) ( TRUCK-AT ?auto_3434 ?auto_3438 ) ( not ( = ?auto_3430 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3440 ) ) ( not ( = ?auto_3431 ?auto_3440 ) ) ( not ( = ?auto_3435 ?auto_3445 ) ) ( not ( = ?auto_3430 ?auto_3432 ) ) ( not ( = ?auto_3430 ?auto_3444 ) ) ( not ( = ?auto_3432 ?auto_3440 ) ) ( not ( = ?auto_3441 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3444 ?auto_3440 ) ) ( not ( = ?auto_3430 ?auto_3433 ) ) ( not ( = ?auto_3430 ?auto_3437 ) ) ( not ( = ?auto_3431 ?auto_3433 ) ) ( not ( = ?auto_3431 ?auto_3437 ) ) ( not ( = ?auto_3433 ?auto_3444 ) ) ( not ( = ?auto_3433 ?auto_3440 ) ) ( not ( = ?auto_3439 ?auto_3441 ) ) ( not ( = ?auto_3439 ?auto_3443 ) ) ( not ( = ?auto_3436 ?auto_3442 ) ) ( not ( = ?auto_3436 ?auto_3445 ) ) ( not ( = ?auto_3437 ?auto_3444 ) ) ( not ( = ?auto_3437 ?auto_3440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3430 ?auto_3431 ?auto_3432 )
      ( MAKE-1CRATE ?auto_3432 ?auto_3433 )
      ( MAKE-3CRATE-VERIFY ?auto_3430 ?auto_3431 ?auto_3432 ?auto_3433 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3461 - SURFACE
      ?auto_3462 - SURFACE
      ?auto_3463 - SURFACE
      ?auto_3464 - SURFACE
      ?auto_3465 - SURFACE
    )
    :vars
    (
      ?auto_3469 - HOIST
      ?auto_3466 - PLACE
      ?auto_3468 - PLACE
      ?auto_3470 - HOIST
      ?auto_3467 - SURFACE
      ?auto_3479 - PLACE
      ?auto_3480 - HOIST
      ?auto_3477 - SURFACE
      ?auto_3478 - PLACE
      ?auto_3473 - HOIST
      ?auto_3474 - SURFACE
      ?auto_3475 - PLACE
      ?auto_3472 - HOIST
      ?auto_3476 - SURFACE
      ?auto_3471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3469 ?auto_3466 ) ( IS-CRATE ?auto_3465 ) ( not ( = ?auto_3468 ?auto_3466 ) ) ( HOIST-AT ?auto_3470 ?auto_3468 ) ( AVAILABLE ?auto_3470 ) ( SURFACE-AT ?auto_3465 ?auto_3468 ) ( ON ?auto_3465 ?auto_3467 ) ( CLEAR ?auto_3465 ) ( not ( = ?auto_3464 ?auto_3465 ) ) ( not ( = ?auto_3464 ?auto_3467 ) ) ( not ( = ?auto_3465 ?auto_3467 ) ) ( not ( = ?auto_3469 ?auto_3470 ) ) ( IS-CRATE ?auto_3464 ) ( not ( = ?auto_3479 ?auto_3466 ) ) ( HOIST-AT ?auto_3480 ?auto_3479 ) ( AVAILABLE ?auto_3480 ) ( SURFACE-AT ?auto_3464 ?auto_3479 ) ( ON ?auto_3464 ?auto_3477 ) ( CLEAR ?auto_3464 ) ( not ( = ?auto_3463 ?auto_3464 ) ) ( not ( = ?auto_3463 ?auto_3477 ) ) ( not ( = ?auto_3464 ?auto_3477 ) ) ( not ( = ?auto_3469 ?auto_3480 ) ) ( IS-CRATE ?auto_3463 ) ( not ( = ?auto_3478 ?auto_3466 ) ) ( HOIST-AT ?auto_3473 ?auto_3478 ) ( AVAILABLE ?auto_3473 ) ( SURFACE-AT ?auto_3463 ?auto_3478 ) ( ON ?auto_3463 ?auto_3474 ) ( CLEAR ?auto_3463 ) ( not ( = ?auto_3462 ?auto_3463 ) ) ( not ( = ?auto_3462 ?auto_3474 ) ) ( not ( = ?auto_3463 ?auto_3474 ) ) ( not ( = ?auto_3469 ?auto_3473 ) ) ( SURFACE-AT ?auto_3461 ?auto_3466 ) ( CLEAR ?auto_3461 ) ( IS-CRATE ?auto_3462 ) ( AVAILABLE ?auto_3469 ) ( not ( = ?auto_3475 ?auto_3466 ) ) ( HOIST-AT ?auto_3472 ?auto_3475 ) ( AVAILABLE ?auto_3472 ) ( SURFACE-AT ?auto_3462 ?auto_3475 ) ( ON ?auto_3462 ?auto_3476 ) ( CLEAR ?auto_3462 ) ( TRUCK-AT ?auto_3471 ?auto_3466 ) ( not ( = ?auto_3461 ?auto_3462 ) ) ( not ( = ?auto_3461 ?auto_3476 ) ) ( not ( = ?auto_3462 ?auto_3476 ) ) ( not ( = ?auto_3469 ?auto_3472 ) ) ( not ( = ?auto_3461 ?auto_3463 ) ) ( not ( = ?auto_3461 ?auto_3474 ) ) ( not ( = ?auto_3463 ?auto_3476 ) ) ( not ( = ?auto_3478 ?auto_3475 ) ) ( not ( = ?auto_3473 ?auto_3472 ) ) ( not ( = ?auto_3474 ?auto_3476 ) ) ( not ( = ?auto_3461 ?auto_3464 ) ) ( not ( = ?auto_3461 ?auto_3477 ) ) ( not ( = ?auto_3462 ?auto_3464 ) ) ( not ( = ?auto_3462 ?auto_3477 ) ) ( not ( = ?auto_3464 ?auto_3474 ) ) ( not ( = ?auto_3464 ?auto_3476 ) ) ( not ( = ?auto_3479 ?auto_3478 ) ) ( not ( = ?auto_3479 ?auto_3475 ) ) ( not ( = ?auto_3480 ?auto_3473 ) ) ( not ( = ?auto_3480 ?auto_3472 ) ) ( not ( = ?auto_3477 ?auto_3474 ) ) ( not ( = ?auto_3477 ?auto_3476 ) ) ( not ( = ?auto_3461 ?auto_3465 ) ) ( not ( = ?auto_3461 ?auto_3467 ) ) ( not ( = ?auto_3462 ?auto_3465 ) ) ( not ( = ?auto_3462 ?auto_3467 ) ) ( not ( = ?auto_3463 ?auto_3465 ) ) ( not ( = ?auto_3463 ?auto_3467 ) ) ( not ( = ?auto_3465 ?auto_3477 ) ) ( not ( = ?auto_3465 ?auto_3474 ) ) ( not ( = ?auto_3465 ?auto_3476 ) ) ( not ( = ?auto_3468 ?auto_3479 ) ) ( not ( = ?auto_3468 ?auto_3478 ) ) ( not ( = ?auto_3468 ?auto_3475 ) ) ( not ( = ?auto_3470 ?auto_3480 ) ) ( not ( = ?auto_3470 ?auto_3473 ) ) ( not ( = ?auto_3470 ?auto_3472 ) ) ( not ( = ?auto_3467 ?auto_3477 ) ) ( not ( = ?auto_3467 ?auto_3474 ) ) ( not ( = ?auto_3467 ?auto_3476 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3461 ?auto_3462 ?auto_3463 ?auto_3464 )
      ( MAKE-1CRATE ?auto_3464 ?auto_3465 )
      ( MAKE-4CRATE-VERIFY ?auto_3461 ?auto_3462 ?auto_3463 ?auto_3464 ?auto_3465 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3497 - SURFACE
      ?auto_3498 - SURFACE
      ?auto_3499 - SURFACE
      ?auto_3500 - SURFACE
      ?auto_3501 - SURFACE
      ?auto_3502 - SURFACE
    )
    :vars
    (
      ?auto_3505 - HOIST
      ?auto_3504 - PLACE
      ?auto_3503 - PLACE
      ?auto_3506 - HOIST
      ?auto_3508 - SURFACE
      ?auto_3509 - PLACE
      ?auto_3510 - HOIST
      ?auto_3520 - SURFACE
      ?auto_3519 - PLACE
      ?auto_3516 - HOIST
      ?auto_3513 - SURFACE
      ?auto_3514 - PLACE
      ?auto_3518 - HOIST
      ?auto_3517 - SURFACE
      ?auto_3511 - PLACE
      ?auto_3515 - HOIST
      ?auto_3512 - SURFACE
      ?auto_3507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3505 ?auto_3504 ) ( IS-CRATE ?auto_3502 ) ( not ( = ?auto_3503 ?auto_3504 ) ) ( HOIST-AT ?auto_3506 ?auto_3503 ) ( AVAILABLE ?auto_3506 ) ( SURFACE-AT ?auto_3502 ?auto_3503 ) ( ON ?auto_3502 ?auto_3508 ) ( CLEAR ?auto_3502 ) ( not ( = ?auto_3501 ?auto_3502 ) ) ( not ( = ?auto_3501 ?auto_3508 ) ) ( not ( = ?auto_3502 ?auto_3508 ) ) ( not ( = ?auto_3505 ?auto_3506 ) ) ( IS-CRATE ?auto_3501 ) ( not ( = ?auto_3509 ?auto_3504 ) ) ( HOIST-AT ?auto_3510 ?auto_3509 ) ( AVAILABLE ?auto_3510 ) ( SURFACE-AT ?auto_3501 ?auto_3509 ) ( ON ?auto_3501 ?auto_3520 ) ( CLEAR ?auto_3501 ) ( not ( = ?auto_3500 ?auto_3501 ) ) ( not ( = ?auto_3500 ?auto_3520 ) ) ( not ( = ?auto_3501 ?auto_3520 ) ) ( not ( = ?auto_3505 ?auto_3510 ) ) ( IS-CRATE ?auto_3500 ) ( not ( = ?auto_3519 ?auto_3504 ) ) ( HOIST-AT ?auto_3516 ?auto_3519 ) ( AVAILABLE ?auto_3516 ) ( SURFACE-AT ?auto_3500 ?auto_3519 ) ( ON ?auto_3500 ?auto_3513 ) ( CLEAR ?auto_3500 ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3499 ?auto_3513 ) ) ( not ( = ?auto_3500 ?auto_3513 ) ) ( not ( = ?auto_3505 ?auto_3516 ) ) ( IS-CRATE ?auto_3499 ) ( not ( = ?auto_3514 ?auto_3504 ) ) ( HOIST-AT ?auto_3518 ?auto_3514 ) ( AVAILABLE ?auto_3518 ) ( SURFACE-AT ?auto_3499 ?auto_3514 ) ( ON ?auto_3499 ?auto_3517 ) ( CLEAR ?auto_3499 ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3517 ) ) ( not ( = ?auto_3499 ?auto_3517 ) ) ( not ( = ?auto_3505 ?auto_3518 ) ) ( SURFACE-AT ?auto_3497 ?auto_3504 ) ( CLEAR ?auto_3497 ) ( IS-CRATE ?auto_3498 ) ( AVAILABLE ?auto_3505 ) ( not ( = ?auto_3511 ?auto_3504 ) ) ( HOIST-AT ?auto_3515 ?auto_3511 ) ( AVAILABLE ?auto_3515 ) ( SURFACE-AT ?auto_3498 ?auto_3511 ) ( ON ?auto_3498 ?auto_3512 ) ( CLEAR ?auto_3498 ) ( TRUCK-AT ?auto_3507 ?auto_3504 ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( not ( = ?auto_3497 ?auto_3512 ) ) ( not ( = ?auto_3498 ?auto_3512 ) ) ( not ( = ?auto_3505 ?auto_3515 ) ) ( not ( = ?auto_3497 ?auto_3499 ) ) ( not ( = ?auto_3497 ?auto_3517 ) ) ( not ( = ?auto_3499 ?auto_3512 ) ) ( not ( = ?auto_3514 ?auto_3511 ) ) ( not ( = ?auto_3518 ?auto_3515 ) ) ( not ( = ?auto_3517 ?auto_3512 ) ) ( not ( = ?auto_3497 ?auto_3500 ) ) ( not ( = ?auto_3497 ?auto_3513 ) ) ( not ( = ?auto_3498 ?auto_3500 ) ) ( not ( = ?auto_3498 ?auto_3513 ) ) ( not ( = ?auto_3500 ?auto_3517 ) ) ( not ( = ?auto_3500 ?auto_3512 ) ) ( not ( = ?auto_3519 ?auto_3514 ) ) ( not ( = ?auto_3519 ?auto_3511 ) ) ( not ( = ?auto_3516 ?auto_3518 ) ) ( not ( = ?auto_3516 ?auto_3515 ) ) ( not ( = ?auto_3513 ?auto_3517 ) ) ( not ( = ?auto_3513 ?auto_3512 ) ) ( not ( = ?auto_3497 ?auto_3501 ) ) ( not ( = ?auto_3497 ?auto_3520 ) ) ( not ( = ?auto_3498 ?auto_3501 ) ) ( not ( = ?auto_3498 ?auto_3520 ) ) ( not ( = ?auto_3499 ?auto_3501 ) ) ( not ( = ?auto_3499 ?auto_3520 ) ) ( not ( = ?auto_3501 ?auto_3513 ) ) ( not ( = ?auto_3501 ?auto_3517 ) ) ( not ( = ?auto_3501 ?auto_3512 ) ) ( not ( = ?auto_3509 ?auto_3519 ) ) ( not ( = ?auto_3509 ?auto_3514 ) ) ( not ( = ?auto_3509 ?auto_3511 ) ) ( not ( = ?auto_3510 ?auto_3516 ) ) ( not ( = ?auto_3510 ?auto_3518 ) ) ( not ( = ?auto_3510 ?auto_3515 ) ) ( not ( = ?auto_3520 ?auto_3513 ) ) ( not ( = ?auto_3520 ?auto_3517 ) ) ( not ( = ?auto_3520 ?auto_3512 ) ) ( not ( = ?auto_3497 ?auto_3502 ) ) ( not ( = ?auto_3497 ?auto_3508 ) ) ( not ( = ?auto_3498 ?auto_3502 ) ) ( not ( = ?auto_3498 ?auto_3508 ) ) ( not ( = ?auto_3499 ?auto_3502 ) ) ( not ( = ?auto_3499 ?auto_3508 ) ) ( not ( = ?auto_3500 ?auto_3502 ) ) ( not ( = ?auto_3500 ?auto_3508 ) ) ( not ( = ?auto_3502 ?auto_3520 ) ) ( not ( = ?auto_3502 ?auto_3513 ) ) ( not ( = ?auto_3502 ?auto_3517 ) ) ( not ( = ?auto_3502 ?auto_3512 ) ) ( not ( = ?auto_3503 ?auto_3509 ) ) ( not ( = ?auto_3503 ?auto_3519 ) ) ( not ( = ?auto_3503 ?auto_3514 ) ) ( not ( = ?auto_3503 ?auto_3511 ) ) ( not ( = ?auto_3506 ?auto_3510 ) ) ( not ( = ?auto_3506 ?auto_3516 ) ) ( not ( = ?auto_3506 ?auto_3518 ) ) ( not ( = ?auto_3506 ?auto_3515 ) ) ( not ( = ?auto_3508 ?auto_3520 ) ) ( not ( = ?auto_3508 ?auto_3513 ) ) ( not ( = ?auto_3508 ?auto_3517 ) ) ( not ( = ?auto_3508 ?auto_3512 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3500 ?auto_3501 )
      ( MAKE-1CRATE ?auto_3501 ?auto_3502 )
      ( MAKE-5CRATE-VERIFY ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3500 ?auto_3501 ?auto_3502 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3538 - SURFACE
      ?auto_3539 - SURFACE
      ?auto_3540 - SURFACE
      ?auto_3541 - SURFACE
      ?auto_3542 - SURFACE
      ?auto_3543 - SURFACE
      ?auto_3544 - SURFACE
    )
    :vars
    (
      ?auto_3545 - HOIST
      ?auto_3550 - PLACE
      ?auto_3546 - PLACE
      ?auto_3547 - HOIST
      ?auto_3548 - SURFACE
      ?auto_3551 - PLACE
      ?auto_3564 - HOIST
      ?auto_3552 - SURFACE
      ?auto_3559 - PLACE
      ?auto_3557 - HOIST
      ?auto_3565 - SURFACE
      ?auto_3553 - PLACE
      ?auto_3554 - HOIST
      ?auto_3561 - SURFACE
      ?auto_3563 - PLACE
      ?auto_3556 - HOIST
      ?auto_3555 - SURFACE
      ?auto_3558 - PLACE
      ?auto_3562 - HOIST
      ?auto_3560 - SURFACE
      ?auto_3549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3545 ?auto_3550 ) ( IS-CRATE ?auto_3544 ) ( not ( = ?auto_3546 ?auto_3550 ) ) ( HOIST-AT ?auto_3547 ?auto_3546 ) ( AVAILABLE ?auto_3547 ) ( SURFACE-AT ?auto_3544 ?auto_3546 ) ( ON ?auto_3544 ?auto_3548 ) ( CLEAR ?auto_3544 ) ( not ( = ?auto_3543 ?auto_3544 ) ) ( not ( = ?auto_3543 ?auto_3548 ) ) ( not ( = ?auto_3544 ?auto_3548 ) ) ( not ( = ?auto_3545 ?auto_3547 ) ) ( IS-CRATE ?auto_3543 ) ( not ( = ?auto_3551 ?auto_3550 ) ) ( HOIST-AT ?auto_3564 ?auto_3551 ) ( AVAILABLE ?auto_3564 ) ( SURFACE-AT ?auto_3543 ?auto_3551 ) ( ON ?auto_3543 ?auto_3552 ) ( CLEAR ?auto_3543 ) ( not ( = ?auto_3542 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3552 ) ) ( not ( = ?auto_3543 ?auto_3552 ) ) ( not ( = ?auto_3545 ?auto_3564 ) ) ( IS-CRATE ?auto_3542 ) ( not ( = ?auto_3559 ?auto_3550 ) ) ( HOIST-AT ?auto_3557 ?auto_3559 ) ( AVAILABLE ?auto_3557 ) ( SURFACE-AT ?auto_3542 ?auto_3559 ) ( ON ?auto_3542 ?auto_3565 ) ( CLEAR ?auto_3542 ) ( not ( = ?auto_3541 ?auto_3542 ) ) ( not ( = ?auto_3541 ?auto_3565 ) ) ( not ( = ?auto_3542 ?auto_3565 ) ) ( not ( = ?auto_3545 ?auto_3557 ) ) ( IS-CRATE ?auto_3541 ) ( not ( = ?auto_3553 ?auto_3550 ) ) ( HOIST-AT ?auto_3554 ?auto_3553 ) ( AVAILABLE ?auto_3554 ) ( SURFACE-AT ?auto_3541 ?auto_3553 ) ( ON ?auto_3541 ?auto_3561 ) ( CLEAR ?auto_3541 ) ( not ( = ?auto_3540 ?auto_3541 ) ) ( not ( = ?auto_3540 ?auto_3561 ) ) ( not ( = ?auto_3541 ?auto_3561 ) ) ( not ( = ?auto_3545 ?auto_3554 ) ) ( IS-CRATE ?auto_3540 ) ( not ( = ?auto_3563 ?auto_3550 ) ) ( HOIST-AT ?auto_3556 ?auto_3563 ) ( AVAILABLE ?auto_3556 ) ( SURFACE-AT ?auto_3540 ?auto_3563 ) ( ON ?auto_3540 ?auto_3555 ) ( CLEAR ?auto_3540 ) ( not ( = ?auto_3539 ?auto_3540 ) ) ( not ( = ?auto_3539 ?auto_3555 ) ) ( not ( = ?auto_3540 ?auto_3555 ) ) ( not ( = ?auto_3545 ?auto_3556 ) ) ( SURFACE-AT ?auto_3538 ?auto_3550 ) ( CLEAR ?auto_3538 ) ( IS-CRATE ?auto_3539 ) ( AVAILABLE ?auto_3545 ) ( not ( = ?auto_3558 ?auto_3550 ) ) ( HOIST-AT ?auto_3562 ?auto_3558 ) ( AVAILABLE ?auto_3562 ) ( SURFACE-AT ?auto_3539 ?auto_3558 ) ( ON ?auto_3539 ?auto_3560 ) ( CLEAR ?auto_3539 ) ( TRUCK-AT ?auto_3549 ?auto_3550 ) ( not ( = ?auto_3538 ?auto_3539 ) ) ( not ( = ?auto_3538 ?auto_3560 ) ) ( not ( = ?auto_3539 ?auto_3560 ) ) ( not ( = ?auto_3545 ?auto_3562 ) ) ( not ( = ?auto_3538 ?auto_3540 ) ) ( not ( = ?auto_3538 ?auto_3555 ) ) ( not ( = ?auto_3540 ?auto_3560 ) ) ( not ( = ?auto_3563 ?auto_3558 ) ) ( not ( = ?auto_3556 ?auto_3562 ) ) ( not ( = ?auto_3555 ?auto_3560 ) ) ( not ( = ?auto_3538 ?auto_3541 ) ) ( not ( = ?auto_3538 ?auto_3561 ) ) ( not ( = ?auto_3539 ?auto_3541 ) ) ( not ( = ?auto_3539 ?auto_3561 ) ) ( not ( = ?auto_3541 ?auto_3555 ) ) ( not ( = ?auto_3541 ?auto_3560 ) ) ( not ( = ?auto_3553 ?auto_3563 ) ) ( not ( = ?auto_3553 ?auto_3558 ) ) ( not ( = ?auto_3554 ?auto_3556 ) ) ( not ( = ?auto_3554 ?auto_3562 ) ) ( not ( = ?auto_3561 ?auto_3555 ) ) ( not ( = ?auto_3561 ?auto_3560 ) ) ( not ( = ?auto_3538 ?auto_3542 ) ) ( not ( = ?auto_3538 ?auto_3565 ) ) ( not ( = ?auto_3539 ?auto_3542 ) ) ( not ( = ?auto_3539 ?auto_3565 ) ) ( not ( = ?auto_3540 ?auto_3542 ) ) ( not ( = ?auto_3540 ?auto_3565 ) ) ( not ( = ?auto_3542 ?auto_3561 ) ) ( not ( = ?auto_3542 ?auto_3555 ) ) ( not ( = ?auto_3542 ?auto_3560 ) ) ( not ( = ?auto_3559 ?auto_3553 ) ) ( not ( = ?auto_3559 ?auto_3563 ) ) ( not ( = ?auto_3559 ?auto_3558 ) ) ( not ( = ?auto_3557 ?auto_3554 ) ) ( not ( = ?auto_3557 ?auto_3556 ) ) ( not ( = ?auto_3557 ?auto_3562 ) ) ( not ( = ?auto_3565 ?auto_3561 ) ) ( not ( = ?auto_3565 ?auto_3555 ) ) ( not ( = ?auto_3565 ?auto_3560 ) ) ( not ( = ?auto_3538 ?auto_3543 ) ) ( not ( = ?auto_3538 ?auto_3552 ) ) ( not ( = ?auto_3539 ?auto_3543 ) ) ( not ( = ?auto_3539 ?auto_3552 ) ) ( not ( = ?auto_3540 ?auto_3543 ) ) ( not ( = ?auto_3540 ?auto_3552 ) ) ( not ( = ?auto_3541 ?auto_3543 ) ) ( not ( = ?auto_3541 ?auto_3552 ) ) ( not ( = ?auto_3543 ?auto_3565 ) ) ( not ( = ?auto_3543 ?auto_3561 ) ) ( not ( = ?auto_3543 ?auto_3555 ) ) ( not ( = ?auto_3543 ?auto_3560 ) ) ( not ( = ?auto_3551 ?auto_3559 ) ) ( not ( = ?auto_3551 ?auto_3553 ) ) ( not ( = ?auto_3551 ?auto_3563 ) ) ( not ( = ?auto_3551 ?auto_3558 ) ) ( not ( = ?auto_3564 ?auto_3557 ) ) ( not ( = ?auto_3564 ?auto_3554 ) ) ( not ( = ?auto_3564 ?auto_3556 ) ) ( not ( = ?auto_3564 ?auto_3562 ) ) ( not ( = ?auto_3552 ?auto_3565 ) ) ( not ( = ?auto_3552 ?auto_3561 ) ) ( not ( = ?auto_3552 ?auto_3555 ) ) ( not ( = ?auto_3552 ?auto_3560 ) ) ( not ( = ?auto_3538 ?auto_3544 ) ) ( not ( = ?auto_3538 ?auto_3548 ) ) ( not ( = ?auto_3539 ?auto_3544 ) ) ( not ( = ?auto_3539 ?auto_3548 ) ) ( not ( = ?auto_3540 ?auto_3544 ) ) ( not ( = ?auto_3540 ?auto_3548 ) ) ( not ( = ?auto_3541 ?auto_3544 ) ) ( not ( = ?auto_3541 ?auto_3548 ) ) ( not ( = ?auto_3542 ?auto_3544 ) ) ( not ( = ?auto_3542 ?auto_3548 ) ) ( not ( = ?auto_3544 ?auto_3552 ) ) ( not ( = ?auto_3544 ?auto_3565 ) ) ( not ( = ?auto_3544 ?auto_3561 ) ) ( not ( = ?auto_3544 ?auto_3555 ) ) ( not ( = ?auto_3544 ?auto_3560 ) ) ( not ( = ?auto_3546 ?auto_3551 ) ) ( not ( = ?auto_3546 ?auto_3559 ) ) ( not ( = ?auto_3546 ?auto_3553 ) ) ( not ( = ?auto_3546 ?auto_3563 ) ) ( not ( = ?auto_3546 ?auto_3558 ) ) ( not ( = ?auto_3547 ?auto_3564 ) ) ( not ( = ?auto_3547 ?auto_3557 ) ) ( not ( = ?auto_3547 ?auto_3554 ) ) ( not ( = ?auto_3547 ?auto_3556 ) ) ( not ( = ?auto_3547 ?auto_3562 ) ) ( not ( = ?auto_3548 ?auto_3552 ) ) ( not ( = ?auto_3548 ?auto_3565 ) ) ( not ( = ?auto_3548 ?auto_3561 ) ) ( not ( = ?auto_3548 ?auto_3555 ) ) ( not ( = ?auto_3548 ?auto_3560 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3538 ?auto_3539 ?auto_3540 ?auto_3541 ?auto_3542 ?auto_3543 )
      ( MAKE-1CRATE ?auto_3543 ?auto_3544 )
      ( MAKE-6CRATE-VERIFY ?auto_3538 ?auto_3539 ?auto_3540 ?auto_3541 ?auto_3542 ?auto_3543 ?auto_3544 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3584 - SURFACE
      ?auto_3585 - SURFACE
      ?auto_3586 - SURFACE
      ?auto_3587 - SURFACE
      ?auto_3588 - SURFACE
      ?auto_3589 - SURFACE
      ?auto_3590 - SURFACE
      ?auto_3591 - SURFACE
    )
    :vars
    (
      ?auto_3594 - HOIST
      ?auto_3593 - PLACE
      ?auto_3592 - PLACE
      ?auto_3595 - HOIST
      ?auto_3596 - SURFACE
      ?auto_3611 - SURFACE
      ?auto_3602 - PLACE
      ?auto_3599 - HOIST
      ?auto_3601 - SURFACE
      ?auto_3613 - PLACE
      ?auto_3606 - HOIST
      ?auto_3604 - SURFACE
      ?auto_3603 - PLACE
      ?auto_3605 - HOIST
      ?auto_3598 - SURFACE
      ?auto_3612 - PLACE
      ?auto_3610 - HOIST
      ?auto_3609 - SURFACE
      ?auto_3608 - PLACE
      ?auto_3607 - HOIST
      ?auto_3600 - SURFACE
      ?auto_3597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3594 ?auto_3593 ) ( IS-CRATE ?auto_3591 ) ( not ( = ?auto_3592 ?auto_3593 ) ) ( HOIST-AT ?auto_3595 ?auto_3592 ) ( SURFACE-AT ?auto_3591 ?auto_3592 ) ( ON ?auto_3591 ?auto_3596 ) ( CLEAR ?auto_3591 ) ( not ( = ?auto_3590 ?auto_3591 ) ) ( not ( = ?auto_3590 ?auto_3596 ) ) ( not ( = ?auto_3591 ?auto_3596 ) ) ( not ( = ?auto_3594 ?auto_3595 ) ) ( IS-CRATE ?auto_3590 ) ( AVAILABLE ?auto_3595 ) ( SURFACE-AT ?auto_3590 ?auto_3592 ) ( ON ?auto_3590 ?auto_3611 ) ( CLEAR ?auto_3590 ) ( not ( = ?auto_3589 ?auto_3590 ) ) ( not ( = ?auto_3589 ?auto_3611 ) ) ( not ( = ?auto_3590 ?auto_3611 ) ) ( IS-CRATE ?auto_3589 ) ( not ( = ?auto_3602 ?auto_3593 ) ) ( HOIST-AT ?auto_3599 ?auto_3602 ) ( AVAILABLE ?auto_3599 ) ( SURFACE-AT ?auto_3589 ?auto_3602 ) ( ON ?auto_3589 ?auto_3601 ) ( CLEAR ?auto_3589 ) ( not ( = ?auto_3588 ?auto_3589 ) ) ( not ( = ?auto_3588 ?auto_3601 ) ) ( not ( = ?auto_3589 ?auto_3601 ) ) ( not ( = ?auto_3594 ?auto_3599 ) ) ( IS-CRATE ?auto_3588 ) ( not ( = ?auto_3613 ?auto_3593 ) ) ( HOIST-AT ?auto_3606 ?auto_3613 ) ( AVAILABLE ?auto_3606 ) ( SURFACE-AT ?auto_3588 ?auto_3613 ) ( ON ?auto_3588 ?auto_3604 ) ( CLEAR ?auto_3588 ) ( not ( = ?auto_3587 ?auto_3588 ) ) ( not ( = ?auto_3587 ?auto_3604 ) ) ( not ( = ?auto_3588 ?auto_3604 ) ) ( not ( = ?auto_3594 ?auto_3606 ) ) ( IS-CRATE ?auto_3587 ) ( not ( = ?auto_3603 ?auto_3593 ) ) ( HOIST-AT ?auto_3605 ?auto_3603 ) ( AVAILABLE ?auto_3605 ) ( SURFACE-AT ?auto_3587 ?auto_3603 ) ( ON ?auto_3587 ?auto_3598 ) ( CLEAR ?auto_3587 ) ( not ( = ?auto_3586 ?auto_3587 ) ) ( not ( = ?auto_3586 ?auto_3598 ) ) ( not ( = ?auto_3587 ?auto_3598 ) ) ( not ( = ?auto_3594 ?auto_3605 ) ) ( IS-CRATE ?auto_3586 ) ( not ( = ?auto_3612 ?auto_3593 ) ) ( HOIST-AT ?auto_3610 ?auto_3612 ) ( AVAILABLE ?auto_3610 ) ( SURFACE-AT ?auto_3586 ?auto_3612 ) ( ON ?auto_3586 ?auto_3609 ) ( CLEAR ?auto_3586 ) ( not ( = ?auto_3585 ?auto_3586 ) ) ( not ( = ?auto_3585 ?auto_3609 ) ) ( not ( = ?auto_3586 ?auto_3609 ) ) ( not ( = ?auto_3594 ?auto_3610 ) ) ( SURFACE-AT ?auto_3584 ?auto_3593 ) ( CLEAR ?auto_3584 ) ( IS-CRATE ?auto_3585 ) ( AVAILABLE ?auto_3594 ) ( not ( = ?auto_3608 ?auto_3593 ) ) ( HOIST-AT ?auto_3607 ?auto_3608 ) ( AVAILABLE ?auto_3607 ) ( SURFACE-AT ?auto_3585 ?auto_3608 ) ( ON ?auto_3585 ?auto_3600 ) ( CLEAR ?auto_3585 ) ( TRUCK-AT ?auto_3597 ?auto_3593 ) ( not ( = ?auto_3584 ?auto_3585 ) ) ( not ( = ?auto_3584 ?auto_3600 ) ) ( not ( = ?auto_3585 ?auto_3600 ) ) ( not ( = ?auto_3594 ?auto_3607 ) ) ( not ( = ?auto_3584 ?auto_3586 ) ) ( not ( = ?auto_3584 ?auto_3609 ) ) ( not ( = ?auto_3586 ?auto_3600 ) ) ( not ( = ?auto_3612 ?auto_3608 ) ) ( not ( = ?auto_3610 ?auto_3607 ) ) ( not ( = ?auto_3609 ?auto_3600 ) ) ( not ( = ?auto_3584 ?auto_3587 ) ) ( not ( = ?auto_3584 ?auto_3598 ) ) ( not ( = ?auto_3585 ?auto_3587 ) ) ( not ( = ?auto_3585 ?auto_3598 ) ) ( not ( = ?auto_3587 ?auto_3609 ) ) ( not ( = ?auto_3587 ?auto_3600 ) ) ( not ( = ?auto_3603 ?auto_3612 ) ) ( not ( = ?auto_3603 ?auto_3608 ) ) ( not ( = ?auto_3605 ?auto_3610 ) ) ( not ( = ?auto_3605 ?auto_3607 ) ) ( not ( = ?auto_3598 ?auto_3609 ) ) ( not ( = ?auto_3598 ?auto_3600 ) ) ( not ( = ?auto_3584 ?auto_3588 ) ) ( not ( = ?auto_3584 ?auto_3604 ) ) ( not ( = ?auto_3585 ?auto_3588 ) ) ( not ( = ?auto_3585 ?auto_3604 ) ) ( not ( = ?auto_3586 ?auto_3588 ) ) ( not ( = ?auto_3586 ?auto_3604 ) ) ( not ( = ?auto_3588 ?auto_3598 ) ) ( not ( = ?auto_3588 ?auto_3609 ) ) ( not ( = ?auto_3588 ?auto_3600 ) ) ( not ( = ?auto_3613 ?auto_3603 ) ) ( not ( = ?auto_3613 ?auto_3612 ) ) ( not ( = ?auto_3613 ?auto_3608 ) ) ( not ( = ?auto_3606 ?auto_3605 ) ) ( not ( = ?auto_3606 ?auto_3610 ) ) ( not ( = ?auto_3606 ?auto_3607 ) ) ( not ( = ?auto_3604 ?auto_3598 ) ) ( not ( = ?auto_3604 ?auto_3609 ) ) ( not ( = ?auto_3604 ?auto_3600 ) ) ( not ( = ?auto_3584 ?auto_3589 ) ) ( not ( = ?auto_3584 ?auto_3601 ) ) ( not ( = ?auto_3585 ?auto_3589 ) ) ( not ( = ?auto_3585 ?auto_3601 ) ) ( not ( = ?auto_3586 ?auto_3589 ) ) ( not ( = ?auto_3586 ?auto_3601 ) ) ( not ( = ?auto_3587 ?auto_3589 ) ) ( not ( = ?auto_3587 ?auto_3601 ) ) ( not ( = ?auto_3589 ?auto_3604 ) ) ( not ( = ?auto_3589 ?auto_3598 ) ) ( not ( = ?auto_3589 ?auto_3609 ) ) ( not ( = ?auto_3589 ?auto_3600 ) ) ( not ( = ?auto_3602 ?auto_3613 ) ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3612 ) ) ( not ( = ?auto_3602 ?auto_3608 ) ) ( not ( = ?auto_3599 ?auto_3606 ) ) ( not ( = ?auto_3599 ?auto_3605 ) ) ( not ( = ?auto_3599 ?auto_3610 ) ) ( not ( = ?auto_3599 ?auto_3607 ) ) ( not ( = ?auto_3601 ?auto_3604 ) ) ( not ( = ?auto_3601 ?auto_3598 ) ) ( not ( = ?auto_3601 ?auto_3609 ) ) ( not ( = ?auto_3601 ?auto_3600 ) ) ( not ( = ?auto_3584 ?auto_3590 ) ) ( not ( = ?auto_3584 ?auto_3611 ) ) ( not ( = ?auto_3585 ?auto_3590 ) ) ( not ( = ?auto_3585 ?auto_3611 ) ) ( not ( = ?auto_3586 ?auto_3590 ) ) ( not ( = ?auto_3586 ?auto_3611 ) ) ( not ( = ?auto_3587 ?auto_3590 ) ) ( not ( = ?auto_3587 ?auto_3611 ) ) ( not ( = ?auto_3588 ?auto_3590 ) ) ( not ( = ?auto_3588 ?auto_3611 ) ) ( not ( = ?auto_3590 ?auto_3601 ) ) ( not ( = ?auto_3590 ?auto_3604 ) ) ( not ( = ?auto_3590 ?auto_3598 ) ) ( not ( = ?auto_3590 ?auto_3609 ) ) ( not ( = ?auto_3590 ?auto_3600 ) ) ( not ( = ?auto_3592 ?auto_3602 ) ) ( not ( = ?auto_3592 ?auto_3613 ) ) ( not ( = ?auto_3592 ?auto_3603 ) ) ( not ( = ?auto_3592 ?auto_3612 ) ) ( not ( = ?auto_3592 ?auto_3608 ) ) ( not ( = ?auto_3595 ?auto_3599 ) ) ( not ( = ?auto_3595 ?auto_3606 ) ) ( not ( = ?auto_3595 ?auto_3605 ) ) ( not ( = ?auto_3595 ?auto_3610 ) ) ( not ( = ?auto_3595 ?auto_3607 ) ) ( not ( = ?auto_3611 ?auto_3601 ) ) ( not ( = ?auto_3611 ?auto_3604 ) ) ( not ( = ?auto_3611 ?auto_3598 ) ) ( not ( = ?auto_3611 ?auto_3609 ) ) ( not ( = ?auto_3611 ?auto_3600 ) ) ( not ( = ?auto_3584 ?auto_3591 ) ) ( not ( = ?auto_3584 ?auto_3596 ) ) ( not ( = ?auto_3585 ?auto_3591 ) ) ( not ( = ?auto_3585 ?auto_3596 ) ) ( not ( = ?auto_3586 ?auto_3591 ) ) ( not ( = ?auto_3586 ?auto_3596 ) ) ( not ( = ?auto_3587 ?auto_3591 ) ) ( not ( = ?auto_3587 ?auto_3596 ) ) ( not ( = ?auto_3588 ?auto_3591 ) ) ( not ( = ?auto_3588 ?auto_3596 ) ) ( not ( = ?auto_3589 ?auto_3591 ) ) ( not ( = ?auto_3589 ?auto_3596 ) ) ( not ( = ?auto_3591 ?auto_3611 ) ) ( not ( = ?auto_3591 ?auto_3601 ) ) ( not ( = ?auto_3591 ?auto_3604 ) ) ( not ( = ?auto_3591 ?auto_3598 ) ) ( not ( = ?auto_3591 ?auto_3609 ) ) ( not ( = ?auto_3591 ?auto_3600 ) ) ( not ( = ?auto_3596 ?auto_3611 ) ) ( not ( = ?auto_3596 ?auto_3601 ) ) ( not ( = ?auto_3596 ?auto_3604 ) ) ( not ( = ?auto_3596 ?auto_3598 ) ) ( not ( = ?auto_3596 ?auto_3609 ) ) ( not ( = ?auto_3596 ?auto_3600 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3584 ?auto_3585 ?auto_3586 ?auto_3587 ?auto_3588 ?auto_3589 ?auto_3590 )
      ( MAKE-1CRATE ?auto_3590 ?auto_3591 )
      ( MAKE-7CRATE-VERIFY ?auto_3584 ?auto_3585 ?auto_3586 ?auto_3587 ?auto_3588 ?auto_3589 ?auto_3590 ?auto_3591 ) )
  )

)

