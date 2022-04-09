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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3393 - SURFACE
      ?auto_3394 - SURFACE
    )
    :vars
    (
      ?auto_3395 - HOIST
      ?auto_3396 - PLACE
      ?auto_3398 - PLACE
      ?auto_3399 - HOIST
      ?auto_3400 - SURFACE
      ?auto_3397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3395 ?auto_3396 ) ( SURFACE-AT ?auto_3393 ?auto_3396 ) ( CLEAR ?auto_3393 ) ( IS-CRATE ?auto_3394 ) ( AVAILABLE ?auto_3395 ) ( not ( = ?auto_3398 ?auto_3396 ) ) ( HOIST-AT ?auto_3399 ?auto_3398 ) ( AVAILABLE ?auto_3399 ) ( SURFACE-AT ?auto_3394 ?auto_3398 ) ( ON ?auto_3394 ?auto_3400 ) ( CLEAR ?auto_3394 ) ( TRUCK-AT ?auto_3397 ?auto_3396 ) ( not ( = ?auto_3393 ?auto_3394 ) ) ( not ( = ?auto_3393 ?auto_3400 ) ) ( not ( = ?auto_3394 ?auto_3400 ) ) ( not ( = ?auto_3395 ?auto_3399 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3397 ?auto_3396 ?auto_3398 )
      ( !LIFT ?auto_3399 ?auto_3394 ?auto_3400 ?auto_3398 )
      ( !LOAD ?auto_3399 ?auto_3394 ?auto_3397 ?auto_3398 )
      ( !DRIVE ?auto_3397 ?auto_3398 ?auto_3396 )
      ( !UNLOAD ?auto_3395 ?auto_3394 ?auto_3397 ?auto_3396 )
      ( !DROP ?auto_3395 ?auto_3394 ?auto_3393 ?auto_3396 )
      ( MAKE-1CRATE-VERIFY ?auto_3393 ?auto_3394 ) )
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
      ?auto_3410 - HOIST
      ?auto_3407 - PLACE
      ?auto_3409 - PLACE
      ?auto_3412 - HOIST
      ?auto_3411 - SURFACE
      ?auto_3413 - PLACE
      ?auto_3414 - HOIST
      ?auto_3415 - SURFACE
      ?auto_3408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3410 ?auto_3407 ) ( IS-CRATE ?auto_3406 ) ( not ( = ?auto_3409 ?auto_3407 ) ) ( HOIST-AT ?auto_3412 ?auto_3409 ) ( AVAILABLE ?auto_3412 ) ( SURFACE-AT ?auto_3406 ?auto_3409 ) ( ON ?auto_3406 ?auto_3411 ) ( CLEAR ?auto_3406 ) ( not ( = ?auto_3405 ?auto_3406 ) ) ( not ( = ?auto_3405 ?auto_3411 ) ) ( not ( = ?auto_3406 ?auto_3411 ) ) ( not ( = ?auto_3410 ?auto_3412 ) ) ( SURFACE-AT ?auto_3404 ?auto_3407 ) ( CLEAR ?auto_3404 ) ( IS-CRATE ?auto_3405 ) ( AVAILABLE ?auto_3410 ) ( not ( = ?auto_3413 ?auto_3407 ) ) ( HOIST-AT ?auto_3414 ?auto_3413 ) ( AVAILABLE ?auto_3414 ) ( SURFACE-AT ?auto_3405 ?auto_3413 ) ( ON ?auto_3405 ?auto_3415 ) ( CLEAR ?auto_3405 ) ( TRUCK-AT ?auto_3408 ?auto_3407 ) ( not ( = ?auto_3404 ?auto_3405 ) ) ( not ( = ?auto_3404 ?auto_3415 ) ) ( not ( = ?auto_3405 ?auto_3415 ) ) ( not ( = ?auto_3410 ?auto_3414 ) ) ( not ( = ?auto_3404 ?auto_3406 ) ) ( not ( = ?auto_3404 ?auto_3411 ) ) ( not ( = ?auto_3406 ?auto_3415 ) ) ( not ( = ?auto_3409 ?auto_3413 ) ) ( not ( = ?auto_3412 ?auto_3414 ) ) ( not ( = ?auto_3411 ?auto_3415 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3404 ?auto_3405 )
      ( MAKE-1CRATE ?auto_3405 ?auto_3406 )
      ( MAKE-2CRATE-VERIFY ?auto_3404 ?auto_3405 ?auto_3406 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3418 - SURFACE
      ?auto_3419 - SURFACE
    )
    :vars
    (
      ?auto_3420 - HOIST
      ?auto_3421 - PLACE
      ?auto_3423 - PLACE
      ?auto_3424 - HOIST
      ?auto_3425 - SURFACE
      ?auto_3422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3420 ?auto_3421 ) ( SURFACE-AT ?auto_3418 ?auto_3421 ) ( CLEAR ?auto_3418 ) ( IS-CRATE ?auto_3419 ) ( AVAILABLE ?auto_3420 ) ( not ( = ?auto_3423 ?auto_3421 ) ) ( HOIST-AT ?auto_3424 ?auto_3423 ) ( AVAILABLE ?auto_3424 ) ( SURFACE-AT ?auto_3419 ?auto_3423 ) ( ON ?auto_3419 ?auto_3425 ) ( CLEAR ?auto_3419 ) ( TRUCK-AT ?auto_3422 ?auto_3421 ) ( not ( = ?auto_3418 ?auto_3419 ) ) ( not ( = ?auto_3418 ?auto_3425 ) ) ( not ( = ?auto_3419 ?auto_3425 ) ) ( not ( = ?auto_3420 ?auto_3424 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3422 ?auto_3421 ?auto_3423 )
      ( !LIFT ?auto_3424 ?auto_3419 ?auto_3425 ?auto_3423 )
      ( !LOAD ?auto_3424 ?auto_3419 ?auto_3422 ?auto_3423 )
      ( !DRIVE ?auto_3422 ?auto_3423 ?auto_3421 )
      ( !UNLOAD ?auto_3420 ?auto_3419 ?auto_3422 ?auto_3421 )
      ( !DROP ?auto_3420 ?auto_3419 ?auto_3418 ?auto_3421 )
      ( MAKE-1CRATE-VERIFY ?auto_3418 ?auto_3419 ) )
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
      ?auto_3437 - PLACE
      ?auto_3434 - HOIST
      ?auto_3436 - SURFACE
      ?auto_3442 - PLACE
      ?auto_3441 - HOIST
      ?auto_3443 - SURFACE
      ?auto_3445 - PLACE
      ?auto_3444 - HOIST
      ?auto_3440 - SURFACE
      ?auto_3439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3435 ?auto_3438 ) ( IS-CRATE ?auto_3433 ) ( not ( = ?auto_3437 ?auto_3438 ) ) ( HOIST-AT ?auto_3434 ?auto_3437 ) ( AVAILABLE ?auto_3434 ) ( SURFACE-AT ?auto_3433 ?auto_3437 ) ( ON ?auto_3433 ?auto_3436 ) ( CLEAR ?auto_3433 ) ( not ( = ?auto_3432 ?auto_3433 ) ) ( not ( = ?auto_3432 ?auto_3436 ) ) ( not ( = ?auto_3433 ?auto_3436 ) ) ( not ( = ?auto_3435 ?auto_3434 ) ) ( IS-CRATE ?auto_3432 ) ( not ( = ?auto_3442 ?auto_3438 ) ) ( HOIST-AT ?auto_3441 ?auto_3442 ) ( AVAILABLE ?auto_3441 ) ( SURFACE-AT ?auto_3432 ?auto_3442 ) ( ON ?auto_3432 ?auto_3443 ) ( CLEAR ?auto_3432 ) ( not ( = ?auto_3431 ?auto_3432 ) ) ( not ( = ?auto_3431 ?auto_3443 ) ) ( not ( = ?auto_3432 ?auto_3443 ) ) ( not ( = ?auto_3435 ?auto_3441 ) ) ( SURFACE-AT ?auto_3430 ?auto_3438 ) ( CLEAR ?auto_3430 ) ( IS-CRATE ?auto_3431 ) ( AVAILABLE ?auto_3435 ) ( not ( = ?auto_3445 ?auto_3438 ) ) ( HOIST-AT ?auto_3444 ?auto_3445 ) ( AVAILABLE ?auto_3444 ) ( SURFACE-AT ?auto_3431 ?auto_3445 ) ( ON ?auto_3431 ?auto_3440 ) ( CLEAR ?auto_3431 ) ( TRUCK-AT ?auto_3439 ?auto_3438 ) ( not ( = ?auto_3430 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3440 ) ) ( not ( = ?auto_3431 ?auto_3440 ) ) ( not ( = ?auto_3435 ?auto_3444 ) ) ( not ( = ?auto_3430 ?auto_3432 ) ) ( not ( = ?auto_3430 ?auto_3443 ) ) ( not ( = ?auto_3432 ?auto_3440 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3441 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3440 ) ) ( not ( = ?auto_3430 ?auto_3433 ) ) ( not ( = ?auto_3430 ?auto_3436 ) ) ( not ( = ?auto_3431 ?auto_3433 ) ) ( not ( = ?auto_3431 ?auto_3436 ) ) ( not ( = ?auto_3433 ?auto_3443 ) ) ( not ( = ?auto_3433 ?auto_3440 ) ) ( not ( = ?auto_3437 ?auto_3442 ) ) ( not ( = ?auto_3437 ?auto_3445 ) ) ( not ( = ?auto_3434 ?auto_3441 ) ) ( not ( = ?auto_3434 ?auto_3444 ) ) ( not ( = ?auto_3436 ?auto_3443 ) ) ( not ( = ?auto_3436 ?auto_3440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3430 ?auto_3431 ?auto_3432 )
      ( MAKE-1CRATE ?auto_3432 ?auto_3433 )
      ( MAKE-3CRATE-VERIFY ?auto_3430 ?auto_3431 ?auto_3432 ?auto_3433 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3448 - SURFACE
      ?auto_3449 - SURFACE
    )
    :vars
    (
      ?auto_3450 - HOIST
      ?auto_3451 - PLACE
      ?auto_3453 - PLACE
      ?auto_3454 - HOIST
      ?auto_3455 - SURFACE
      ?auto_3452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3450 ?auto_3451 ) ( SURFACE-AT ?auto_3448 ?auto_3451 ) ( CLEAR ?auto_3448 ) ( IS-CRATE ?auto_3449 ) ( AVAILABLE ?auto_3450 ) ( not ( = ?auto_3453 ?auto_3451 ) ) ( HOIST-AT ?auto_3454 ?auto_3453 ) ( AVAILABLE ?auto_3454 ) ( SURFACE-AT ?auto_3449 ?auto_3453 ) ( ON ?auto_3449 ?auto_3455 ) ( CLEAR ?auto_3449 ) ( TRUCK-AT ?auto_3452 ?auto_3451 ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3448 ?auto_3455 ) ) ( not ( = ?auto_3449 ?auto_3455 ) ) ( not ( = ?auto_3450 ?auto_3454 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3452 ?auto_3451 ?auto_3453 )
      ( !LIFT ?auto_3454 ?auto_3449 ?auto_3455 ?auto_3453 )
      ( !LOAD ?auto_3454 ?auto_3449 ?auto_3452 ?auto_3453 )
      ( !DRIVE ?auto_3452 ?auto_3453 ?auto_3451 )
      ( !UNLOAD ?auto_3450 ?auto_3449 ?auto_3452 ?auto_3451 )
      ( !DROP ?auto_3450 ?auto_3449 ?auto_3448 ?auto_3451 )
      ( MAKE-1CRATE-VERIFY ?auto_3448 ?auto_3449 ) )
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
      ?auto_3471 - HOIST
      ?auto_3469 - PLACE
      ?auto_3467 - PLACE
      ?auto_3466 - HOIST
      ?auto_3468 - SURFACE
      ?auto_3474 - PLACE
      ?auto_3475 - HOIST
      ?auto_3476 - SURFACE
      ?auto_3479 - PLACE
      ?auto_3473 - HOIST
      ?auto_3477 - SURFACE
      ?auto_3480 - PLACE
      ?auto_3478 - HOIST
      ?auto_3472 - SURFACE
      ?auto_3470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3471 ?auto_3469 ) ( IS-CRATE ?auto_3465 ) ( not ( = ?auto_3467 ?auto_3469 ) ) ( HOIST-AT ?auto_3466 ?auto_3467 ) ( AVAILABLE ?auto_3466 ) ( SURFACE-AT ?auto_3465 ?auto_3467 ) ( ON ?auto_3465 ?auto_3468 ) ( CLEAR ?auto_3465 ) ( not ( = ?auto_3464 ?auto_3465 ) ) ( not ( = ?auto_3464 ?auto_3468 ) ) ( not ( = ?auto_3465 ?auto_3468 ) ) ( not ( = ?auto_3471 ?auto_3466 ) ) ( IS-CRATE ?auto_3464 ) ( not ( = ?auto_3474 ?auto_3469 ) ) ( HOIST-AT ?auto_3475 ?auto_3474 ) ( AVAILABLE ?auto_3475 ) ( SURFACE-AT ?auto_3464 ?auto_3474 ) ( ON ?auto_3464 ?auto_3476 ) ( CLEAR ?auto_3464 ) ( not ( = ?auto_3463 ?auto_3464 ) ) ( not ( = ?auto_3463 ?auto_3476 ) ) ( not ( = ?auto_3464 ?auto_3476 ) ) ( not ( = ?auto_3471 ?auto_3475 ) ) ( IS-CRATE ?auto_3463 ) ( not ( = ?auto_3479 ?auto_3469 ) ) ( HOIST-AT ?auto_3473 ?auto_3479 ) ( AVAILABLE ?auto_3473 ) ( SURFACE-AT ?auto_3463 ?auto_3479 ) ( ON ?auto_3463 ?auto_3477 ) ( CLEAR ?auto_3463 ) ( not ( = ?auto_3462 ?auto_3463 ) ) ( not ( = ?auto_3462 ?auto_3477 ) ) ( not ( = ?auto_3463 ?auto_3477 ) ) ( not ( = ?auto_3471 ?auto_3473 ) ) ( SURFACE-AT ?auto_3461 ?auto_3469 ) ( CLEAR ?auto_3461 ) ( IS-CRATE ?auto_3462 ) ( AVAILABLE ?auto_3471 ) ( not ( = ?auto_3480 ?auto_3469 ) ) ( HOIST-AT ?auto_3478 ?auto_3480 ) ( AVAILABLE ?auto_3478 ) ( SURFACE-AT ?auto_3462 ?auto_3480 ) ( ON ?auto_3462 ?auto_3472 ) ( CLEAR ?auto_3462 ) ( TRUCK-AT ?auto_3470 ?auto_3469 ) ( not ( = ?auto_3461 ?auto_3462 ) ) ( not ( = ?auto_3461 ?auto_3472 ) ) ( not ( = ?auto_3462 ?auto_3472 ) ) ( not ( = ?auto_3471 ?auto_3478 ) ) ( not ( = ?auto_3461 ?auto_3463 ) ) ( not ( = ?auto_3461 ?auto_3477 ) ) ( not ( = ?auto_3463 ?auto_3472 ) ) ( not ( = ?auto_3479 ?auto_3480 ) ) ( not ( = ?auto_3473 ?auto_3478 ) ) ( not ( = ?auto_3477 ?auto_3472 ) ) ( not ( = ?auto_3461 ?auto_3464 ) ) ( not ( = ?auto_3461 ?auto_3476 ) ) ( not ( = ?auto_3462 ?auto_3464 ) ) ( not ( = ?auto_3462 ?auto_3476 ) ) ( not ( = ?auto_3464 ?auto_3477 ) ) ( not ( = ?auto_3464 ?auto_3472 ) ) ( not ( = ?auto_3474 ?auto_3479 ) ) ( not ( = ?auto_3474 ?auto_3480 ) ) ( not ( = ?auto_3475 ?auto_3473 ) ) ( not ( = ?auto_3475 ?auto_3478 ) ) ( not ( = ?auto_3476 ?auto_3477 ) ) ( not ( = ?auto_3476 ?auto_3472 ) ) ( not ( = ?auto_3461 ?auto_3465 ) ) ( not ( = ?auto_3461 ?auto_3468 ) ) ( not ( = ?auto_3462 ?auto_3465 ) ) ( not ( = ?auto_3462 ?auto_3468 ) ) ( not ( = ?auto_3463 ?auto_3465 ) ) ( not ( = ?auto_3463 ?auto_3468 ) ) ( not ( = ?auto_3465 ?auto_3476 ) ) ( not ( = ?auto_3465 ?auto_3477 ) ) ( not ( = ?auto_3465 ?auto_3472 ) ) ( not ( = ?auto_3467 ?auto_3474 ) ) ( not ( = ?auto_3467 ?auto_3479 ) ) ( not ( = ?auto_3467 ?auto_3480 ) ) ( not ( = ?auto_3466 ?auto_3475 ) ) ( not ( = ?auto_3466 ?auto_3473 ) ) ( not ( = ?auto_3466 ?auto_3478 ) ) ( not ( = ?auto_3468 ?auto_3476 ) ) ( not ( = ?auto_3468 ?auto_3477 ) ) ( not ( = ?auto_3468 ?auto_3472 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3461 ?auto_3462 ?auto_3463 ?auto_3464 )
      ( MAKE-1CRATE ?auto_3464 ?auto_3465 )
      ( MAKE-4CRATE-VERIFY ?auto_3461 ?auto_3462 ?auto_3463 ?auto_3464 ?auto_3465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3483 - SURFACE
      ?auto_3484 - SURFACE
    )
    :vars
    (
      ?auto_3485 - HOIST
      ?auto_3486 - PLACE
      ?auto_3488 - PLACE
      ?auto_3489 - HOIST
      ?auto_3490 - SURFACE
      ?auto_3487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3485 ?auto_3486 ) ( SURFACE-AT ?auto_3483 ?auto_3486 ) ( CLEAR ?auto_3483 ) ( IS-CRATE ?auto_3484 ) ( AVAILABLE ?auto_3485 ) ( not ( = ?auto_3488 ?auto_3486 ) ) ( HOIST-AT ?auto_3489 ?auto_3488 ) ( AVAILABLE ?auto_3489 ) ( SURFACE-AT ?auto_3484 ?auto_3488 ) ( ON ?auto_3484 ?auto_3490 ) ( CLEAR ?auto_3484 ) ( TRUCK-AT ?auto_3487 ?auto_3486 ) ( not ( = ?auto_3483 ?auto_3484 ) ) ( not ( = ?auto_3483 ?auto_3490 ) ) ( not ( = ?auto_3484 ?auto_3490 ) ) ( not ( = ?auto_3485 ?auto_3489 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3487 ?auto_3486 ?auto_3488 )
      ( !LIFT ?auto_3489 ?auto_3484 ?auto_3490 ?auto_3488 )
      ( !LOAD ?auto_3489 ?auto_3484 ?auto_3487 ?auto_3488 )
      ( !DRIVE ?auto_3487 ?auto_3488 ?auto_3486 )
      ( !UNLOAD ?auto_3485 ?auto_3484 ?auto_3487 ?auto_3486 )
      ( !DROP ?auto_3485 ?auto_3484 ?auto_3483 ?auto_3486 )
      ( MAKE-1CRATE-VERIFY ?auto_3483 ?auto_3484 ) )
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
      ?auto_3508 - HOIST
      ?auto_3505 - PLACE
      ?auto_3503 - PLACE
      ?auto_3506 - HOIST
      ?auto_3507 - SURFACE
      ?auto_3520 - PLACE
      ?auto_3511 - HOIST
      ?auto_3510 - SURFACE
      ?auto_3513 - PLACE
      ?auto_3516 - HOIST
      ?auto_3517 - SURFACE
      ?auto_3509 - PLACE
      ?auto_3515 - HOIST
      ?auto_3518 - SURFACE
      ?auto_3514 - PLACE
      ?auto_3519 - HOIST
      ?auto_3512 - SURFACE
      ?auto_3504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3508 ?auto_3505 ) ( IS-CRATE ?auto_3502 ) ( not ( = ?auto_3503 ?auto_3505 ) ) ( HOIST-AT ?auto_3506 ?auto_3503 ) ( AVAILABLE ?auto_3506 ) ( SURFACE-AT ?auto_3502 ?auto_3503 ) ( ON ?auto_3502 ?auto_3507 ) ( CLEAR ?auto_3502 ) ( not ( = ?auto_3501 ?auto_3502 ) ) ( not ( = ?auto_3501 ?auto_3507 ) ) ( not ( = ?auto_3502 ?auto_3507 ) ) ( not ( = ?auto_3508 ?auto_3506 ) ) ( IS-CRATE ?auto_3501 ) ( not ( = ?auto_3520 ?auto_3505 ) ) ( HOIST-AT ?auto_3511 ?auto_3520 ) ( AVAILABLE ?auto_3511 ) ( SURFACE-AT ?auto_3501 ?auto_3520 ) ( ON ?auto_3501 ?auto_3510 ) ( CLEAR ?auto_3501 ) ( not ( = ?auto_3500 ?auto_3501 ) ) ( not ( = ?auto_3500 ?auto_3510 ) ) ( not ( = ?auto_3501 ?auto_3510 ) ) ( not ( = ?auto_3508 ?auto_3511 ) ) ( IS-CRATE ?auto_3500 ) ( not ( = ?auto_3513 ?auto_3505 ) ) ( HOIST-AT ?auto_3516 ?auto_3513 ) ( AVAILABLE ?auto_3516 ) ( SURFACE-AT ?auto_3500 ?auto_3513 ) ( ON ?auto_3500 ?auto_3517 ) ( CLEAR ?auto_3500 ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3499 ?auto_3517 ) ) ( not ( = ?auto_3500 ?auto_3517 ) ) ( not ( = ?auto_3508 ?auto_3516 ) ) ( IS-CRATE ?auto_3499 ) ( not ( = ?auto_3509 ?auto_3505 ) ) ( HOIST-AT ?auto_3515 ?auto_3509 ) ( AVAILABLE ?auto_3515 ) ( SURFACE-AT ?auto_3499 ?auto_3509 ) ( ON ?auto_3499 ?auto_3518 ) ( CLEAR ?auto_3499 ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3518 ) ) ( not ( = ?auto_3499 ?auto_3518 ) ) ( not ( = ?auto_3508 ?auto_3515 ) ) ( SURFACE-AT ?auto_3497 ?auto_3505 ) ( CLEAR ?auto_3497 ) ( IS-CRATE ?auto_3498 ) ( AVAILABLE ?auto_3508 ) ( not ( = ?auto_3514 ?auto_3505 ) ) ( HOIST-AT ?auto_3519 ?auto_3514 ) ( AVAILABLE ?auto_3519 ) ( SURFACE-AT ?auto_3498 ?auto_3514 ) ( ON ?auto_3498 ?auto_3512 ) ( CLEAR ?auto_3498 ) ( TRUCK-AT ?auto_3504 ?auto_3505 ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( not ( = ?auto_3497 ?auto_3512 ) ) ( not ( = ?auto_3498 ?auto_3512 ) ) ( not ( = ?auto_3508 ?auto_3519 ) ) ( not ( = ?auto_3497 ?auto_3499 ) ) ( not ( = ?auto_3497 ?auto_3518 ) ) ( not ( = ?auto_3499 ?auto_3512 ) ) ( not ( = ?auto_3509 ?auto_3514 ) ) ( not ( = ?auto_3515 ?auto_3519 ) ) ( not ( = ?auto_3518 ?auto_3512 ) ) ( not ( = ?auto_3497 ?auto_3500 ) ) ( not ( = ?auto_3497 ?auto_3517 ) ) ( not ( = ?auto_3498 ?auto_3500 ) ) ( not ( = ?auto_3498 ?auto_3517 ) ) ( not ( = ?auto_3500 ?auto_3518 ) ) ( not ( = ?auto_3500 ?auto_3512 ) ) ( not ( = ?auto_3513 ?auto_3509 ) ) ( not ( = ?auto_3513 ?auto_3514 ) ) ( not ( = ?auto_3516 ?auto_3515 ) ) ( not ( = ?auto_3516 ?auto_3519 ) ) ( not ( = ?auto_3517 ?auto_3518 ) ) ( not ( = ?auto_3517 ?auto_3512 ) ) ( not ( = ?auto_3497 ?auto_3501 ) ) ( not ( = ?auto_3497 ?auto_3510 ) ) ( not ( = ?auto_3498 ?auto_3501 ) ) ( not ( = ?auto_3498 ?auto_3510 ) ) ( not ( = ?auto_3499 ?auto_3501 ) ) ( not ( = ?auto_3499 ?auto_3510 ) ) ( not ( = ?auto_3501 ?auto_3517 ) ) ( not ( = ?auto_3501 ?auto_3518 ) ) ( not ( = ?auto_3501 ?auto_3512 ) ) ( not ( = ?auto_3520 ?auto_3513 ) ) ( not ( = ?auto_3520 ?auto_3509 ) ) ( not ( = ?auto_3520 ?auto_3514 ) ) ( not ( = ?auto_3511 ?auto_3516 ) ) ( not ( = ?auto_3511 ?auto_3515 ) ) ( not ( = ?auto_3511 ?auto_3519 ) ) ( not ( = ?auto_3510 ?auto_3517 ) ) ( not ( = ?auto_3510 ?auto_3518 ) ) ( not ( = ?auto_3510 ?auto_3512 ) ) ( not ( = ?auto_3497 ?auto_3502 ) ) ( not ( = ?auto_3497 ?auto_3507 ) ) ( not ( = ?auto_3498 ?auto_3502 ) ) ( not ( = ?auto_3498 ?auto_3507 ) ) ( not ( = ?auto_3499 ?auto_3502 ) ) ( not ( = ?auto_3499 ?auto_3507 ) ) ( not ( = ?auto_3500 ?auto_3502 ) ) ( not ( = ?auto_3500 ?auto_3507 ) ) ( not ( = ?auto_3502 ?auto_3510 ) ) ( not ( = ?auto_3502 ?auto_3517 ) ) ( not ( = ?auto_3502 ?auto_3518 ) ) ( not ( = ?auto_3502 ?auto_3512 ) ) ( not ( = ?auto_3503 ?auto_3520 ) ) ( not ( = ?auto_3503 ?auto_3513 ) ) ( not ( = ?auto_3503 ?auto_3509 ) ) ( not ( = ?auto_3503 ?auto_3514 ) ) ( not ( = ?auto_3506 ?auto_3511 ) ) ( not ( = ?auto_3506 ?auto_3516 ) ) ( not ( = ?auto_3506 ?auto_3515 ) ) ( not ( = ?auto_3506 ?auto_3519 ) ) ( not ( = ?auto_3507 ?auto_3510 ) ) ( not ( = ?auto_3507 ?auto_3517 ) ) ( not ( = ?auto_3507 ?auto_3518 ) ) ( not ( = ?auto_3507 ?auto_3512 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3500 ?auto_3501 )
      ( MAKE-1CRATE ?auto_3501 ?auto_3502 )
      ( MAKE-5CRATE-VERIFY ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3500 ?auto_3501 ?auto_3502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3523 - SURFACE
      ?auto_3524 - SURFACE
    )
    :vars
    (
      ?auto_3525 - HOIST
      ?auto_3526 - PLACE
      ?auto_3528 - PLACE
      ?auto_3529 - HOIST
      ?auto_3530 - SURFACE
      ?auto_3527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3525 ?auto_3526 ) ( SURFACE-AT ?auto_3523 ?auto_3526 ) ( CLEAR ?auto_3523 ) ( IS-CRATE ?auto_3524 ) ( AVAILABLE ?auto_3525 ) ( not ( = ?auto_3528 ?auto_3526 ) ) ( HOIST-AT ?auto_3529 ?auto_3528 ) ( AVAILABLE ?auto_3529 ) ( SURFACE-AT ?auto_3524 ?auto_3528 ) ( ON ?auto_3524 ?auto_3530 ) ( CLEAR ?auto_3524 ) ( TRUCK-AT ?auto_3527 ?auto_3526 ) ( not ( = ?auto_3523 ?auto_3524 ) ) ( not ( = ?auto_3523 ?auto_3530 ) ) ( not ( = ?auto_3524 ?auto_3530 ) ) ( not ( = ?auto_3525 ?auto_3529 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3527 ?auto_3526 ?auto_3528 )
      ( !LIFT ?auto_3529 ?auto_3524 ?auto_3530 ?auto_3528 )
      ( !LOAD ?auto_3529 ?auto_3524 ?auto_3527 ?auto_3528 )
      ( !DRIVE ?auto_3527 ?auto_3528 ?auto_3526 )
      ( !UNLOAD ?auto_3525 ?auto_3524 ?auto_3527 ?auto_3526 )
      ( !DROP ?auto_3525 ?auto_3524 ?auto_3523 ?auto_3526 )
      ( MAKE-1CRATE-VERIFY ?auto_3523 ?auto_3524 ) )
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
      ?auto_3547 - HOIST
      ?auto_3548 - PLACE
      ?auto_3550 - PLACE
      ?auto_3546 - HOIST
      ?auto_3549 - SURFACE
      ?auto_3555 - PLACE
      ?auto_3564 - HOIST
      ?auto_3556 - SURFACE
      ?auto_3554 - PLACE
      ?auto_3551 - HOIST
      ?auto_3558 - SURFACE
      ?auto_3562 - PLACE
      ?auto_3553 - HOIST
      ?auto_3552 - SURFACE
      ?auto_3557 - PLACE
      ?auto_3561 - HOIST
      ?auto_3559 - SURFACE
      ?auto_3560 - PLACE
      ?auto_3563 - HOIST
      ?auto_3565 - SURFACE
      ?auto_3545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3547 ?auto_3548 ) ( IS-CRATE ?auto_3544 ) ( not ( = ?auto_3550 ?auto_3548 ) ) ( HOIST-AT ?auto_3546 ?auto_3550 ) ( AVAILABLE ?auto_3546 ) ( SURFACE-AT ?auto_3544 ?auto_3550 ) ( ON ?auto_3544 ?auto_3549 ) ( CLEAR ?auto_3544 ) ( not ( = ?auto_3543 ?auto_3544 ) ) ( not ( = ?auto_3543 ?auto_3549 ) ) ( not ( = ?auto_3544 ?auto_3549 ) ) ( not ( = ?auto_3547 ?auto_3546 ) ) ( IS-CRATE ?auto_3543 ) ( not ( = ?auto_3555 ?auto_3548 ) ) ( HOIST-AT ?auto_3564 ?auto_3555 ) ( AVAILABLE ?auto_3564 ) ( SURFACE-AT ?auto_3543 ?auto_3555 ) ( ON ?auto_3543 ?auto_3556 ) ( CLEAR ?auto_3543 ) ( not ( = ?auto_3542 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3556 ) ) ( not ( = ?auto_3543 ?auto_3556 ) ) ( not ( = ?auto_3547 ?auto_3564 ) ) ( IS-CRATE ?auto_3542 ) ( not ( = ?auto_3554 ?auto_3548 ) ) ( HOIST-AT ?auto_3551 ?auto_3554 ) ( AVAILABLE ?auto_3551 ) ( SURFACE-AT ?auto_3542 ?auto_3554 ) ( ON ?auto_3542 ?auto_3558 ) ( CLEAR ?auto_3542 ) ( not ( = ?auto_3541 ?auto_3542 ) ) ( not ( = ?auto_3541 ?auto_3558 ) ) ( not ( = ?auto_3542 ?auto_3558 ) ) ( not ( = ?auto_3547 ?auto_3551 ) ) ( IS-CRATE ?auto_3541 ) ( not ( = ?auto_3562 ?auto_3548 ) ) ( HOIST-AT ?auto_3553 ?auto_3562 ) ( AVAILABLE ?auto_3553 ) ( SURFACE-AT ?auto_3541 ?auto_3562 ) ( ON ?auto_3541 ?auto_3552 ) ( CLEAR ?auto_3541 ) ( not ( = ?auto_3540 ?auto_3541 ) ) ( not ( = ?auto_3540 ?auto_3552 ) ) ( not ( = ?auto_3541 ?auto_3552 ) ) ( not ( = ?auto_3547 ?auto_3553 ) ) ( IS-CRATE ?auto_3540 ) ( not ( = ?auto_3557 ?auto_3548 ) ) ( HOIST-AT ?auto_3561 ?auto_3557 ) ( AVAILABLE ?auto_3561 ) ( SURFACE-AT ?auto_3540 ?auto_3557 ) ( ON ?auto_3540 ?auto_3559 ) ( CLEAR ?auto_3540 ) ( not ( = ?auto_3539 ?auto_3540 ) ) ( not ( = ?auto_3539 ?auto_3559 ) ) ( not ( = ?auto_3540 ?auto_3559 ) ) ( not ( = ?auto_3547 ?auto_3561 ) ) ( SURFACE-AT ?auto_3538 ?auto_3548 ) ( CLEAR ?auto_3538 ) ( IS-CRATE ?auto_3539 ) ( AVAILABLE ?auto_3547 ) ( not ( = ?auto_3560 ?auto_3548 ) ) ( HOIST-AT ?auto_3563 ?auto_3560 ) ( AVAILABLE ?auto_3563 ) ( SURFACE-AT ?auto_3539 ?auto_3560 ) ( ON ?auto_3539 ?auto_3565 ) ( CLEAR ?auto_3539 ) ( TRUCK-AT ?auto_3545 ?auto_3548 ) ( not ( = ?auto_3538 ?auto_3539 ) ) ( not ( = ?auto_3538 ?auto_3565 ) ) ( not ( = ?auto_3539 ?auto_3565 ) ) ( not ( = ?auto_3547 ?auto_3563 ) ) ( not ( = ?auto_3538 ?auto_3540 ) ) ( not ( = ?auto_3538 ?auto_3559 ) ) ( not ( = ?auto_3540 ?auto_3565 ) ) ( not ( = ?auto_3557 ?auto_3560 ) ) ( not ( = ?auto_3561 ?auto_3563 ) ) ( not ( = ?auto_3559 ?auto_3565 ) ) ( not ( = ?auto_3538 ?auto_3541 ) ) ( not ( = ?auto_3538 ?auto_3552 ) ) ( not ( = ?auto_3539 ?auto_3541 ) ) ( not ( = ?auto_3539 ?auto_3552 ) ) ( not ( = ?auto_3541 ?auto_3559 ) ) ( not ( = ?auto_3541 ?auto_3565 ) ) ( not ( = ?auto_3562 ?auto_3557 ) ) ( not ( = ?auto_3562 ?auto_3560 ) ) ( not ( = ?auto_3553 ?auto_3561 ) ) ( not ( = ?auto_3553 ?auto_3563 ) ) ( not ( = ?auto_3552 ?auto_3559 ) ) ( not ( = ?auto_3552 ?auto_3565 ) ) ( not ( = ?auto_3538 ?auto_3542 ) ) ( not ( = ?auto_3538 ?auto_3558 ) ) ( not ( = ?auto_3539 ?auto_3542 ) ) ( not ( = ?auto_3539 ?auto_3558 ) ) ( not ( = ?auto_3540 ?auto_3542 ) ) ( not ( = ?auto_3540 ?auto_3558 ) ) ( not ( = ?auto_3542 ?auto_3552 ) ) ( not ( = ?auto_3542 ?auto_3559 ) ) ( not ( = ?auto_3542 ?auto_3565 ) ) ( not ( = ?auto_3554 ?auto_3562 ) ) ( not ( = ?auto_3554 ?auto_3557 ) ) ( not ( = ?auto_3554 ?auto_3560 ) ) ( not ( = ?auto_3551 ?auto_3553 ) ) ( not ( = ?auto_3551 ?auto_3561 ) ) ( not ( = ?auto_3551 ?auto_3563 ) ) ( not ( = ?auto_3558 ?auto_3552 ) ) ( not ( = ?auto_3558 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3565 ) ) ( not ( = ?auto_3538 ?auto_3543 ) ) ( not ( = ?auto_3538 ?auto_3556 ) ) ( not ( = ?auto_3539 ?auto_3543 ) ) ( not ( = ?auto_3539 ?auto_3556 ) ) ( not ( = ?auto_3540 ?auto_3543 ) ) ( not ( = ?auto_3540 ?auto_3556 ) ) ( not ( = ?auto_3541 ?auto_3543 ) ) ( not ( = ?auto_3541 ?auto_3556 ) ) ( not ( = ?auto_3543 ?auto_3558 ) ) ( not ( = ?auto_3543 ?auto_3552 ) ) ( not ( = ?auto_3543 ?auto_3559 ) ) ( not ( = ?auto_3543 ?auto_3565 ) ) ( not ( = ?auto_3555 ?auto_3554 ) ) ( not ( = ?auto_3555 ?auto_3562 ) ) ( not ( = ?auto_3555 ?auto_3557 ) ) ( not ( = ?auto_3555 ?auto_3560 ) ) ( not ( = ?auto_3564 ?auto_3551 ) ) ( not ( = ?auto_3564 ?auto_3553 ) ) ( not ( = ?auto_3564 ?auto_3561 ) ) ( not ( = ?auto_3564 ?auto_3563 ) ) ( not ( = ?auto_3556 ?auto_3558 ) ) ( not ( = ?auto_3556 ?auto_3552 ) ) ( not ( = ?auto_3556 ?auto_3559 ) ) ( not ( = ?auto_3556 ?auto_3565 ) ) ( not ( = ?auto_3538 ?auto_3544 ) ) ( not ( = ?auto_3538 ?auto_3549 ) ) ( not ( = ?auto_3539 ?auto_3544 ) ) ( not ( = ?auto_3539 ?auto_3549 ) ) ( not ( = ?auto_3540 ?auto_3544 ) ) ( not ( = ?auto_3540 ?auto_3549 ) ) ( not ( = ?auto_3541 ?auto_3544 ) ) ( not ( = ?auto_3541 ?auto_3549 ) ) ( not ( = ?auto_3542 ?auto_3544 ) ) ( not ( = ?auto_3542 ?auto_3549 ) ) ( not ( = ?auto_3544 ?auto_3556 ) ) ( not ( = ?auto_3544 ?auto_3558 ) ) ( not ( = ?auto_3544 ?auto_3552 ) ) ( not ( = ?auto_3544 ?auto_3559 ) ) ( not ( = ?auto_3544 ?auto_3565 ) ) ( not ( = ?auto_3550 ?auto_3555 ) ) ( not ( = ?auto_3550 ?auto_3554 ) ) ( not ( = ?auto_3550 ?auto_3562 ) ) ( not ( = ?auto_3550 ?auto_3557 ) ) ( not ( = ?auto_3550 ?auto_3560 ) ) ( not ( = ?auto_3546 ?auto_3564 ) ) ( not ( = ?auto_3546 ?auto_3551 ) ) ( not ( = ?auto_3546 ?auto_3553 ) ) ( not ( = ?auto_3546 ?auto_3561 ) ) ( not ( = ?auto_3546 ?auto_3563 ) ) ( not ( = ?auto_3549 ?auto_3556 ) ) ( not ( = ?auto_3549 ?auto_3558 ) ) ( not ( = ?auto_3549 ?auto_3552 ) ) ( not ( = ?auto_3549 ?auto_3559 ) ) ( not ( = ?auto_3549 ?auto_3565 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3538 ?auto_3539 ?auto_3540 ?auto_3541 ?auto_3542 ?auto_3543 )
      ( MAKE-1CRATE ?auto_3543 ?auto_3544 )
      ( MAKE-6CRATE-VERIFY ?auto_3538 ?auto_3539 ?auto_3540 ?auto_3541 ?auto_3542 ?auto_3543 ?auto_3544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3568 - SURFACE
      ?auto_3569 - SURFACE
    )
    :vars
    (
      ?auto_3570 - HOIST
      ?auto_3571 - PLACE
      ?auto_3573 - PLACE
      ?auto_3574 - HOIST
      ?auto_3575 - SURFACE
      ?auto_3572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3570 ?auto_3571 ) ( SURFACE-AT ?auto_3568 ?auto_3571 ) ( CLEAR ?auto_3568 ) ( IS-CRATE ?auto_3569 ) ( AVAILABLE ?auto_3570 ) ( not ( = ?auto_3573 ?auto_3571 ) ) ( HOIST-AT ?auto_3574 ?auto_3573 ) ( AVAILABLE ?auto_3574 ) ( SURFACE-AT ?auto_3569 ?auto_3573 ) ( ON ?auto_3569 ?auto_3575 ) ( CLEAR ?auto_3569 ) ( TRUCK-AT ?auto_3572 ?auto_3571 ) ( not ( = ?auto_3568 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3575 ) ) ( not ( = ?auto_3569 ?auto_3575 ) ) ( not ( = ?auto_3570 ?auto_3574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3572 ?auto_3571 ?auto_3573 )
      ( !LIFT ?auto_3574 ?auto_3569 ?auto_3575 ?auto_3573 )
      ( !LOAD ?auto_3574 ?auto_3569 ?auto_3572 ?auto_3573 )
      ( !DRIVE ?auto_3572 ?auto_3573 ?auto_3571 )
      ( !UNLOAD ?auto_3570 ?auto_3569 ?auto_3572 ?auto_3571 )
      ( !DROP ?auto_3570 ?auto_3569 ?auto_3568 ?auto_3571 )
      ( MAKE-1CRATE-VERIFY ?auto_3568 ?auto_3569 ) )
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
      ?auto_3592 - HOIST
      ?auto_3593 - PLACE
      ?auto_3594 - PLACE
      ?auto_3596 - HOIST
      ?auto_3597 - SURFACE
      ?auto_3607 - SURFACE
      ?auto_3609 - PLACE
      ?auto_3611 - HOIST
      ?auto_3610 - SURFACE
      ?auto_3600 - PLACE
      ?auto_3602 - HOIST
      ?auto_3612 - SURFACE
      ?auto_3603 - PLACE
      ?auto_3599 - HOIST
      ?auto_3601 - SURFACE
      ?auto_3608 - PLACE
      ?auto_3604 - HOIST
      ?auto_3606 - SURFACE
      ?auto_3598 - PLACE
      ?auto_3605 - HOIST
      ?auto_3613 - SURFACE
      ?auto_3595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3592 ?auto_3593 ) ( IS-CRATE ?auto_3591 ) ( not ( = ?auto_3594 ?auto_3593 ) ) ( HOIST-AT ?auto_3596 ?auto_3594 ) ( SURFACE-AT ?auto_3591 ?auto_3594 ) ( ON ?auto_3591 ?auto_3597 ) ( CLEAR ?auto_3591 ) ( not ( = ?auto_3590 ?auto_3591 ) ) ( not ( = ?auto_3590 ?auto_3597 ) ) ( not ( = ?auto_3591 ?auto_3597 ) ) ( not ( = ?auto_3592 ?auto_3596 ) ) ( IS-CRATE ?auto_3590 ) ( AVAILABLE ?auto_3596 ) ( SURFACE-AT ?auto_3590 ?auto_3594 ) ( ON ?auto_3590 ?auto_3607 ) ( CLEAR ?auto_3590 ) ( not ( = ?auto_3589 ?auto_3590 ) ) ( not ( = ?auto_3589 ?auto_3607 ) ) ( not ( = ?auto_3590 ?auto_3607 ) ) ( IS-CRATE ?auto_3589 ) ( not ( = ?auto_3609 ?auto_3593 ) ) ( HOIST-AT ?auto_3611 ?auto_3609 ) ( AVAILABLE ?auto_3611 ) ( SURFACE-AT ?auto_3589 ?auto_3609 ) ( ON ?auto_3589 ?auto_3610 ) ( CLEAR ?auto_3589 ) ( not ( = ?auto_3588 ?auto_3589 ) ) ( not ( = ?auto_3588 ?auto_3610 ) ) ( not ( = ?auto_3589 ?auto_3610 ) ) ( not ( = ?auto_3592 ?auto_3611 ) ) ( IS-CRATE ?auto_3588 ) ( not ( = ?auto_3600 ?auto_3593 ) ) ( HOIST-AT ?auto_3602 ?auto_3600 ) ( AVAILABLE ?auto_3602 ) ( SURFACE-AT ?auto_3588 ?auto_3600 ) ( ON ?auto_3588 ?auto_3612 ) ( CLEAR ?auto_3588 ) ( not ( = ?auto_3587 ?auto_3588 ) ) ( not ( = ?auto_3587 ?auto_3612 ) ) ( not ( = ?auto_3588 ?auto_3612 ) ) ( not ( = ?auto_3592 ?auto_3602 ) ) ( IS-CRATE ?auto_3587 ) ( not ( = ?auto_3603 ?auto_3593 ) ) ( HOIST-AT ?auto_3599 ?auto_3603 ) ( AVAILABLE ?auto_3599 ) ( SURFACE-AT ?auto_3587 ?auto_3603 ) ( ON ?auto_3587 ?auto_3601 ) ( CLEAR ?auto_3587 ) ( not ( = ?auto_3586 ?auto_3587 ) ) ( not ( = ?auto_3586 ?auto_3601 ) ) ( not ( = ?auto_3587 ?auto_3601 ) ) ( not ( = ?auto_3592 ?auto_3599 ) ) ( IS-CRATE ?auto_3586 ) ( not ( = ?auto_3608 ?auto_3593 ) ) ( HOIST-AT ?auto_3604 ?auto_3608 ) ( AVAILABLE ?auto_3604 ) ( SURFACE-AT ?auto_3586 ?auto_3608 ) ( ON ?auto_3586 ?auto_3606 ) ( CLEAR ?auto_3586 ) ( not ( = ?auto_3585 ?auto_3586 ) ) ( not ( = ?auto_3585 ?auto_3606 ) ) ( not ( = ?auto_3586 ?auto_3606 ) ) ( not ( = ?auto_3592 ?auto_3604 ) ) ( SURFACE-AT ?auto_3584 ?auto_3593 ) ( CLEAR ?auto_3584 ) ( IS-CRATE ?auto_3585 ) ( AVAILABLE ?auto_3592 ) ( not ( = ?auto_3598 ?auto_3593 ) ) ( HOIST-AT ?auto_3605 ?auto_3598 ) ( AVAILABLE ?auto_3605 ) ( SURFACE-AT ?auto_3585 ?auto_3598 ) ( ON ?auto_3585 ?auto_3613 ) ( CLEAR ?auto_3585 ) ( TRUCK-AT ?auto_3595 ?auto_3593 ) ( not ( = ?auto_3584 ?auto_3585 ) ) ( not ( = ?auto_3584 ?auto_3613 ) ) ( not ( = ?auto_3585 ?auto_3613 ) ) ( not ( = ?auto_3592 ?auto_3605 ) ) ( not ( = ?auto_3584 ?auto_3586 ) ) ( not ( = ?auto_3584 ?auto_3606 ) ) ( not ( = ?auto_3586 ?auto_3613 ) ) ( not ( = ?auto_3608 ?auto_3598 ) ) ( not ( = ?auto_3604 ?auto_3605 ) ) ( not ( = ?auto_3606 ?auto_3613 ) ) ( not ( = ?auto_3584 ?auto_3587 ) ) ( not ( = ?auto_3584 ?auto_3601 ) ) ( not ( = ?auto_3585 ?auto_3587 ) ) ( not ( = ?auto_3585 ?auto_3601 ) ) ( not ( = ?auto_3587 ?auto_3606 ) ) ( not ( = ?auto_3587 ?auto_3613 ) ) ( not ( = ?auto_3603 ?auto_3608 ) ) ( not ( = ?auto_3603 ?auto_3598 ) ) ( not ( = ?auto_3599 ?auto_3604 ) ) ( not ( = ?auto_3599 ?auto_3605 ) ) ( not ( = ?auto_3601 ?auto_3606 ) ) ( not ( = ?auto_3601 ?auto_3613 ) ) ( not ( = ?auto_3584 ?auto_3588 ) ) ( not ( = ?auto_3584 ?auto_3612 ) ) ( not ( = ?auto_3585 ?auto_3588 ) ) ( not ( = ?auto_3585 ?auto_3612 ) ) ( not ( = ?auto_3586 ?auto_3588 ) ) ( not ( = ?auto_3586 ?auto_3612 ) ) ( not ( = ?auto_3588 ?auto_3601 ) ) ( not ( = ?auto_3588 ?auto_3606 ) ) ( not ( = ?auto_3588 ?auto_3613 ) ) ( not ( = ?auto_3600 ?auto_3603 ) ) ( not ( = ?auto_3600 ?auto_3608 ) ) ( not ( = ?auto_3600 ?auto_3598 ) ) ( not ( = ?auto_3602 ?auto_3599 ) ) ( not ( = ?auto_3602 ?auto_3604 ) ) ( not ( = ?auto_3602 ?auto_3605 ) ) ( not ( = ?auto_3612 ?auto_3601 ) ) ( not ( = ?auto_3612 ?auto_3606 ) ) ( not ( = ?auto_3612 ?auto_3613 ) ) ( not ( = ?auto_3584 ?auto_3589 ) ) ( not ( = ?auto_3584 ?auto_3610 ) ) ( not ( = ?auto_3585 ?auto_3589 ) ) ( not ( = ?auto_3585 ?auto_3610 ) ) ( not ( = ?auto_3586 ?auto_3589 ) ) ( not ( = ?auto_3586 ?auto_3610 ) ) ( not ( = ?auto_3587 ?auto_3589 ) ) ( not ( = ?auto_3587 ?auto_3610 ) ) ( not ( = ?auto_3589 ?auto_3612 ) ) ( not ( = ?auto_3589 ?auto_3601 ) ) ( not ( = ?auto_3589 ?auto_3606 ) ) ( not ( = ?auto_3589 ?auto_3613 ) ) ( not ( = ?auto_3609 ?auto_3600 ) ) ( not ( = ?auto_3609 ?auto_3603 ) ) ( not ( = ?auto_3609 ?auto_3608 ) ) ( not ( = ?auto_3609 ?auto_3598 ) ) ( not ( = ?auto_3611 ?auto_3602 ) ) ( not ( = ?auto_3611 ?auto_3599 ) ) ( not ( = ?auto_3611 ?auto_3604 ) ) ( not ( = ?auto_3611 ?auto_3605 ) ) ( not ( = ?auto_3610 ?auto_3612 ) ) ( not ( = ?auto_3610 ?auto_3601 ) ) ( not ( = ?auto_3610 ?auto_3606 ) ) ( not ( = ?auto_3610 ?auto_3613 ) ) ( not ( = ?auto_3584 ?auto_3590 ) ) ( not ( = ?auto_3584 ?auto_3607 ) ) ( not ( = ?auto_3585 ?auto_3590 ) ) ( not ( = ?auto_3585 ?auto_3607 ) ) ( not ( = ?auto_3586 ?auto_3590 ) ) ( not ( = ?auto_3586 ?auto_3607 ) ) ( not ( = ?auto_3587 ?auto_3590 ) ) ( not ( = ?auto_3587 ?auto_3607 ) ) ( not ( = ?auto_3588 ?auto_3590 ) ) ( not ( = ?auto_3588 ?auto_3607 ) ) ( not ( = ?auto_3590 ?auto_3610 ) ) ( not ( = ?auto_3590 ?auto_3612 ) ) ( not ( = ?auto_3590 ?auto_3601 ) ) ( not ( = ?auto_3590 ?auto_3606 ) ) ( not ( = ?auto_3590 ?auto_3613 ) ) ( not ( = ?auto_3594 ?auto_3609 ) ) ( not ( = ?auto_3594 ?auto_3600 ) ) ( not ( = ?auto_3594 ?auto_3603 ) ) ( not ( = ?auto_3594 ?auto_3608 ) ) ( not ( = ?auto_3594 ?auto_3598 ) ) ( not ( = ?auto_3596 ?auto_3611 ) ) ( not ( = ?auto_3596 ?auto_3602 ) ) ( not ( = ?auto_3596 ?auto_3599 ) ) ( not ( = ?auto_3596 ?auto_3604 ) ) ( not ( = ?auto_3596 ?auto_3605 ) ) ( not ( = ?auto_3607 ?auto_3610 ) ) ( not ( = ?auto_3607 ?auto_3612 ) ) ( not ( = ?auto_3607 ?auto_3601 ) ) ( not ( = ?auto_3607 ?auto_3606 ) ) ( not ( = ?auto_3607 ?auto_3613 ) ) ( not ( = ?auto_3584 ?auto_3591 ) ) ( not ( = ?auto_3584 ?auto_3597 ) ) ( not ( = ?auto_3585 ?auto_3591 ) ) ( not ( = ?auto_3585 ?auto_3597 ) ) ( not ( = ?auto_3586 ?auto_3591 ) ) ( not ( = ?auto_3586 ?auto_3597 ) ) ( not ( = ?auto_3587 ?auto_3591 ) ) ( not ( = ?auto_3587 ?auto_3597 ) ) ( not ( = ?auto_3588 ?auto_3591 ) ) ( not ( = ?auto_3588 ?auto_3597 ) ) ( not ( = ?auto_3589 ?auto_3591 ) ) ( not ( = ?auto_3589 ?auto_3597 ) ) ( not ( = ?auto_3591 ?auto_3607 ) ) ( not ( = ?auto_3591 ?auto_3610 ) ) ( not ( = ?auto_3591 ?auto_3612 ) ) ( not ( = ?auto_3591 ?auto_3601 ) ) ( not ( = ?auto_3591 ?auto_3606 ) ) ( not ( = ?auto_3591 ?auto_3613 ) ) ( not ( = ?auto_3597 ?auto_3607 ) ) ( not ( = ?auto_3597 ?auto_3610 ) ) ( not ( = ?auto_3597 ?auto_3612 ) ) ( not ( = ?auto_3597 ?auto_3601 ) ) ( not ( = ?auto_3597 ?auto_3606 ) ) ( not ( = ?auto_3597 ?auto_3613 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3584 ?auto_3585 ?auto_3586 ?auto_3587 ?auto_3588 ?auto_3589 ?auto_3590 )
      ( MAKE-1CRATE ?auto_3590 ?auto_3591 )
      ( MAKE-7CRATE-VERIFY ?auto_3584 ?auto_3585 ?auto_3586 ?auto_3587 ?auto_3588 ?auto_3589 ?auto_3590 ?auto_3591 ) )
  )

)

