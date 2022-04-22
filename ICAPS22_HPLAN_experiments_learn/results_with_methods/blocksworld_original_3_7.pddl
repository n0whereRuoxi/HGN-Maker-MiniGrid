( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3373 - BLOCK
      ?auto_3374 - BLOCK
      ?auto_3375 - BLOCK
    )
    :vars
    (
      ?auto_3376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3376 ?auto_3375 ) ( CLEAR ?auto_3376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3373 ) ( ON ?auto_3374 ?auto_3373 ) ( ON ?auto_3375 ?auto_3374 ) ( not ( = ?auto_3373 ?auto_3374 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( not ( = ?auto_3373 ?auto_3376 ) ) ( not ( = ?auto_3374 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3376 ) ) ( not ( = ?auto_3375 ?auto_3376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3376 ?auto_3375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3378 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3378 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3379 - BLOCK
    )
    :vars
    (
      ?auto_3380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3379 ?auto_3380 ) ( CLEAR ?auto_3379 ) ( HAND-EMPTY ) ( not ( = ?auto_3379 ?auto_3380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3379 ?auto_3380 )
      ( MAKE-1PILE ?auto_3379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3383 - BLOCK
      ?auto_3384 - BLOCK
    )
    :vars
    (
      ?auto_3385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3385 ?auto_3384 ) ( CLEAR ?auto_3385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3383 ) ( ON ?auto_3384 ?auto_3383 ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( not ( = ?auto_3383 ?auto_3385 ) ) ( not ( = ?auto_3384 ?auto_3385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3385 ?auto_3384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3386 - BLOCK
      ?auto_3387 - BLOCK
    )
    :vars
    (
      ?auto_3388 - BLOCK
      ?auto_3389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3388 ?auto_3387 ) ( CLEAR ?auto_3388 ) ( ON-TABLE ?auto_3386 ) ( ON ?auto_3387 ?auto_3386 ) ( not ( = ?auto_3386 ?auto_3387 ) ) ( not ( = ?auto_3386 ?auto_3388 ) ) ( not ( = ?auto_3387 ?auto_3388 ) ) ( HOLDING ?auto_3389 ) ( not ( = ?auto_3386 ?auto_3389 ) ) ( not ( = ?auto_3387 ?auto_3389 ) ) ( not ( = ?auto_3388 ?auto_3389 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3389 )
      ( MAKE-2PILE ?auto_3386 ?auto_3387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3390 - BLOCK
      ?auto_3391 - BLOCK
    )
    :vars
    (
      ?auto_3392 - BLOCK
      ?auto_3393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3392 ?auto_3391 ) ( ON-TABLE ?auto_3390 ) ( ON ?auto_3391 ?auto_3390 ) ( not ( = ?auto_3390 ?auto_3391 ) ) ( not ( = ?auto_3390 ?auto_3392 ) ) ( not ( = ?auto_3391 ?auto_3392 ) ) ( not ( = ?auto_3390 ?auto_3393 ) ) ( not ( = ?auto_3391 ?auto_3393 ) ) ( not ( = ?auto_3392 ?auto_3393 ) ) ( ON ?auto_3393 ?auto_3392 ) ( CLEAR ?auto_3393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3390 ?auto_3391 ?auto_3392 )
      ( MAKE-2PILE ?auto_3390 ?auto_3391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3396 - BLOCK
      ?auto_3397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3397 ) ( CLEAR ?auto_3396 ) ( ON-TABLE ?auto_3396 ) ( not ( = ?auto_3396 ?auto_3397 ) ) )
    :subtasks
    ( ( !STACK ?auto_3397 ?auto_3396 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3398 - BLOCK
      ?auto_3399 - BLOCK
    )
    :vars
    (
      ?auto_3400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3398 ) ( ON-TABLE ?auto_3398 ) ( not ( = ?auto_3398 ?auto_3399 ) ) ( ON ?auto_3399 ?auto_3400 ) ( CLEAR ?auto_3399 ) ( HAND-EMPTY ) ( not ( = ?auto_3398 ?auto_3400 ) ) ( not ( = ?auto_3399 ?auto_3400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3399 ?auto_3400 )
      ( MAKE-2PILE ?auto_3398 ?auto_3399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3401 - BLOCK
      ?auto_3402 - BLOCK
    )
    :vars
    (
      ?auto_3403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3401 ?auto_3402 ) ) ( ON ?auto_3402 ?auto_3403 ) ( CLEAR ?auto_3402 ) ( not ( = ?auto_3401 ?auto_3403 ) ) ( not ( = ?auto_3402 ?auto_3403 ) ) ( HOLDING ?auto_3401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3401 )
      ( MAKE-2PILE ?auto_3401 ?auto_3402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3404 - BLOCK
      ?auto_3405 - BLOCK
    )
    :vars
    (
      ?auto_3406 - BLOCK
      ?auto_3407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3404 ?auto_3405 ) ) ( ON ?auto_3405 ?auto_3406 ) ( not ( = ?auto_3404 ?auto_3406 ) ) ( not ( = ?auto_3405 ?auto_3406 ) ) ( ON ?auto_3404 ?auto_3405 ) ( CLEAR ?auto_3404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3407 ) ( ON ?auto_3406 ?auto_3407 ) ( not ( = ?auto_3407 ?auto_3406 ) ) ( not ( = ?auto_3407 ?auto_3405 ) ) ( not ( = ?auto_3407 ?auto_3404 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3407 ?auto_3406 ?auto_3405 )
      ( MAKE-2PILE ?auto_3404 ?auto_3405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3409 - BLOCK
    )
    :vars
    (
      ?auto_3410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3410 ?auto_3409 ) ( CLEAR ?auto_3410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3409 ) ( not ( = ?auto_3409 ?auto_3410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3410 ?auto_3409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3411 - BLOCK
    )
    :vars
    (
      ?auto_3412 - BLOCK
      ?auto_3413 - BLOCK
      ?auto_3414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3412 ?auto_3411 ) ( CLEAR ?auto_3412 ) ( ON-TABLE ?auto_3411 ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( HOLDING ?auto_3413 ) ( CLEAR ?auto_3414 ) ( not ( = ?auto_3411 ?auto_3413 ) ) ( not ( = ?auto_3411 ?auto_3414 ) ) ( not ( = ?auto_3412 ?auto_3413 ) ) ( not ( = ?auto_3412 ?auto_3414 ) ) ( not ( = ?auto_3413 ?auto_3414 ) ) )
    :subtasks
    ( ( !STACK ?auto_3413 ?auto_3414 )
      ( MAKE-1PILE ?auto_3411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3415 - BLOCK
    )
    :vars
    (
      ?auto_3416 - BLOCK
      ?auto_3417 - BLOCK
      ?auto_3418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3416 ?auto_3415 ) ( ON-TABLE ?auto_3415 ) ( not ( = ?auto_3415 ?auto_3416 ) ) ( CLEAR ?auto_3417 ) ( not ( = ?auto_3415 ?auto_3418 ) ) ( not ( = ?auto_3415 ?auto_3417 ) ) ( not ( = ?auto_3416 ?auto_3418 ) ) ( not ( = ?auto_3416 ?auto_3417 ) ) ( not ( = ?auto_3418 ?auto_3417 ) ) ( ON ?auto_3418 ?auto_3416 ) ( CLEAR ?auto_3418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3415 ?auto_3416 )
      ( MAKE-1PILE ?auto_3415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3419 - BLOCK
    )
    :vars
    (
      ?auto_3420 - BLOCK
      ?auto_3421 - BLOCK
      ?auto_3422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3420 ?auto_3419 ) ( ON-TABLE ?auto_3419 ) ( not ( = ?auto_3419 ?auto_3420 ) ) ( not ( = ?auto_3419 ?auto_3421 ) ) ( not ( = ?auto_3419 ?auto_3422 ) ) ( not ( = ?auto_3420 ?auto_3421 ) ) ( not ( = ?auto_3420 ?auto_3422 ) ) ( not ( = ?auto_3421 ?auto_3422 ) ) ( ON ?auto_3421 ?auto_3420 ) ( CLEAR ?auto_3421 ) ( HOLDING ?auto_3422 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3422 )
      ( MAKE-1PILE ?auto_3419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3423 - BLOCK
    )
    :vars
    (
      ?auto_3426 - BLOCK
      ?auto_3425 - BLOCK
      ?auto_3424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3426 ?auto_3423 ) ( ON-TABLE ?auto_3423 ) ( not ( = ?auto_3423 ?auto_3426 ) ) ( not ( = ?auto_3423 ?auto_3425 ) ) ( not ( = ?auto_3423 ?auto_3424 ) ) ( not ( = ?auto_3426 ?auto_3425 ) ) ( not ( = ?auto_3426 ?auto_3424 ) ) ( not ( = ?auto_3425 ?auto_3424 ) ) ( ON ?auto_3425 ?auto_3426 ) ( ON ?auto_3424 ?auto_3425 ) ( CLEAR ?auto_3424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3423 ?auto_3426 ?auto_3425 )
      ( MAKE-1PILE ?auto_3423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3430 - BLOCK
      ?auto_3431 - BLOCK
      ?auto_3432 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3432 ) ( CLEAR ?auto_3431 ) ( ON-TABLE ?auto_3430 ) ( ON ?auto_3431 ?auto_3430 ) ( not ( = ?auto_3430 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3432 ) ) ( not ( = ?auto_3431 ?auto_3432 ) ) )
    :subtasks
    ( ( !STACK ?auto_3432 ?auto_3431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3433 - BLOCK
      ?auto_3434 - BLOCK
      ?auto_3435 - BLOCK
    )
    :vars
    (
      ?auto_3436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3434 ) ( ON-TABLE ?auto_3433 ) ( ON ?auto_3434 ?auto_3433 ) ( not ( = ?auto_3433 ?auto_3434 ) ) ( not ( = ?auto_3433 ?auto_3435 ) ) ( not ( = ?auto_3434 ?auto_3435 ) ) ( ON ?auto_3435 ?auto_3436 ) ( CLEAR ?auto_3435 ) ( HAND-EMPTY ) ( not ( = ?auto_3433 ?auto_3436 ) ) ( not ( = ?auto_3434 ?auto_3436 ) ) ( not ( = ?auto_3435 ?auto_3436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3435 ?auto_3436 )
      ( MAKE-3PILE ?auto_3433 ?auto_3434 ?auto_3435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3437 - BLOCK
      ?auto_3438 - BLOCK
      ?auto_3439 - BLOCK
    )
    :vars
    (
      ?auto_3440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3437 ) ( not ( = ?auto_3437 ?auto_3438 ) ) ( not ( = ?auto_3437 ?auto_3439 ) ) ( not ( = ?auto_3438 ?auto_3439 ) ) ( ON ?auto_3439 ?auto_3440 ) ( CLEAR ?auto_3439 ) ( not ( = ?auto_3437 ?auto_3440 ) ) ( not ( = ?auto_3438 ?auto_3440 ) ) ( not ( = ?auto_3439 ?auto_3440 ) ) ( HOLDING ?auto_3438 ) ( CLEAR ?auto_3437 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3437 ?auto_3438 )
      ( MAKE-3PILE ?auto_3437 ?auto_3438 ?auto_3439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3441 - BLOCK
      ?auto_3442 - BLOCK
      ?auto_3443 - BLOCK
    )
    :vars
    (
      ?auto_3444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3441 ) ( not ( = ?auto_3441 ?auto_3442 ) ) ( not ( = ?auto_3441 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( ON ?auto_3443 ?auto_3444 ) ( not ( = ?auto_3441 ?auto_3444 ) ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3444 ) ) ( CLEAR ?auto_3441 ) ( ON ?auto_3442 ?auto_3443 ) ( CLEAR ?auto_3442 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3444 ?auto_3443 )
      ( MAKE-3PILE ?auto_3441 ?auto_3442 ?auto_3443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3445 - BLOCK
      ?auto_3446 - BLOCK
      ?auto_3447 - BLOCK
    )
    :vars
    (
      ?auto_3448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3445 ?auto_3446 ) ) ( not ( = ?auto_3445 ?auto_3447 ) ) ( not ( = ?auto_3446 ?auto_3447 ) ) ( ON ?auto_3447 ?auto_3448 ) ( not ( = ?auto_3445 ?auto_3448 ) ) ( not ( = ?auto_3446 ?auto_3448 ) ) ( not ( = ?auto_3447 ?auto_3448 ) ) ( ON ?auto_3446 ?auto_3447 ) ( CLEAR ?auto_3446 ) ( ON-TABLE ?auto_3448 ) ( HOLDING ?auto_3445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3445 )
      ( MAKE-3PILE ?auto_3445 ?auto_3446 ?auto_3447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3449 - BLOCK
      ?auto_3450 - BLOCK
      ?auto_3451 - BLOCK
    )
    :vars
    (
      ?auto_3452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3449 ?auto_3450 ) ) ( not ( = ?auto_3449 ?auto_3451 ) ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( ON ?auto_3451 ?auto_3452 ) ( not ( = ?auto_3449 ?auto_3452 ) ) ( not ( = ?auto_3450 ?auto_3452 ) ) ( not ( = ?auto_3451 ?auto_3452 ) ) ( ON ?auto_3450 ?auto_3451 ) ( ON-TABLE ?auto_3452 ) ( ON ?auto_3449 ?auto_3450 ) ( CLEAR ?auto_3449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3452 ?auto_3451 ?auto_3450 )
      ( MAKE-3PILE ?auto_3449 ?auto_3450 ?auto_3451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3455 - BLOCK
      ?auto_3456 - BLOCK
    )
    :vars
    (
      ?auto_3457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3457 ?auto_3456 ) ( CLEAR ?auto_3457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3455 ) ( ON ?auto_3456 ?auto_3455 ) ( not ( = ?auto_3455 ?auto_3456 ) ) ( not ( = ?auto_3455 ?auto_3457 ) ) ( not ( = ?auto_3456 ?auto_3457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3457 ?auto_3456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3465 - BLOCK
      ?auto_3466 - BLOCK
    )
    :vars
    (
      ?auto_3467 - BLOCK
      ?auto_3468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3465 ) ( not ( = ?auto_3465 ?auto_3466 ) ) ( not ( = ?auto_3465 ?auto_3467 ) ) ( not ( = ?auto_3466 ?auto_3467 ) ) ( ON ?auto_3467 ?auto_3468 ) ( CLEAR ?auto_3467 ) ( not ( = ?auto_3465 ?auto_3468 ) ) ( not ( = ?auto_3466 ?auto_3468 ) ) ( not ( = ?auto_3467 ?auto_3468 ) ) ( HOLDING ?auto_3466 ) ( CLEAR ?auto_3465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3465 ?auto_3466 ?auto_3467 )
      ( MAKE-2PILE ?auto_3465 ?auto_3466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3469 - BLOCK
      ?auto_3470 - BLOCK
    )
    :vars
    (
      ?auto_3471 - BLOCK
      ?auto_3472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3469 ) ( not ( = ?auto_3469 ?auto_3470 ) ) ( not ( = ?auto_3469 ?auto_3471 ) ) ( not ( = ?auto_3470 ?auto_3471 ) ) ( ON ?auto_3471 ?auto_3472 ) ( not ( = ?auto_3469 ?auto_3472 ) ) ( not ( = ?auto_3470 ?auto_3472 ) ) ( not ( = ?auto_3471 ?auto_3472 ) ) ( CLEAR ?auto_3469 ) ( ON ?auto_3470 ?auto_3471 ) ( CLEAR ?auto_3470 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3472 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3472 ?auto_3471 )
      ( MAKE-2PILE ?auto_3469 ?auto_3470 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3473 - BLOCK
      ?auto_3474 - BLOCK
    )
    :vars
    (
      ?auto_3476 - BLOCK
      ?auto_3475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3473 ?auto_3474 ) ) ( not ( = ?auto_3473 ?auto_3476 ) ) ( not ( = ?auto_3474 ?auto_3476 ) ) ( ON ?auto_3476 ?auto_3475 ) ( not ( = ?auto_3473 ?auto_3475 ) ) ( not ( = ?auto_3474 ?auto_3475 ) ) ( not ( = ?auto_3476 ?auto_3475 ) ) ( ON ?auto_3474 ?auto_3476 ) ( CLEAR ?auto_3474 ) ( ON-TABLE ?auto_3475 ) ( HOLDING ?auto_3473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3473 )
      ( MAKE-2PILE ?auto_3473 ?auto_3474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3477 - BLOCK
      ?auto_3478 - BLOCK
    )
    :vars
    (
      ?auto_3480 - BLOCK
      ?auto_3479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3477 ?auto_3478 ) ) ( not ( = ?auto_3477 ?auto_3480 ) ) ( not ( = ?auto_3478 ?auto_3480 ) ) ( ON ?auto_3480 ?auto_3479 ) ( not ( = ?auto_3477 ?auto_3479 ) ) ( not ( = ?auto_3478 ?auto_3479 ) ) ( not ( = ?auto_3480 ?auto_3479 ) ) ( ON ?auto_3478 ?auto_3480 ) ( ON-TABLE ?auto_3479 ) ( ON ?auto_3477 ?auto_3478 ) ( CLEAR ?auto_3477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3479 ?auto_3480 ?auto_3478 )
      ( MAKE-2PILE ?auto_3477 ?auto_3478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3482 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3482 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3482 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3483 - BLOCK
    )
    :vars
    (
      ?auto_3484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3483 ?auto_3484 ) ( CLEAR ?auto_3483 ) ( HAND-EMPTY ) ( not ( = ?auto_3483 ?auto_3484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3483 ?auto_3484 )
      ( MAKE-1PILE ?auto_3483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3485 - BLOCK
    )
    :vars
    (
      ?auto_3486 - BLOCK
      ?auto_3487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3485 ?auto_3486 ) ) ( HOLDING ?auto_3485 ) ( CLEAR ?auto_3486 ) ( ON-TABLE ?auto_3487 ) ( ON ?auto_3486 ?auto_3487 ) ( not ( = ?auto_3487 ?auto_3486 ) ) ( not ( = ?auto_3487 ?auto_3485 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3487 ?auto_3486 ?auto_3485 )
      ( MAKE-1PILE ?auto_3485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3488 - BLOCK
    )
    :vars
    (
      ?auto_3490 - BLOCK
      ?auto_3489 - BLOCK
      ?auto_3491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3488 ?auto_3490 ) ) ( CLEAR ?auto_3490 ) ( ON-TABLE ?auto_3489 ) ( ON ?auto_3490 ?auto_3489 ) ( not ( = ?auto_3489 ?auto_3490 ) ) ( not ( = ?auto_3489 ?auto_3488 ) ) ( ON ?auto_3488 ?auto_3491 ) ( CLEAR ?auto_3488 ) ( HAND-EMPTY ) ( not ( = ?auto_3488 ?auto_3491 ) ) ( not ( = ?auto_3490 ?auto_3491 ) ) ( not ( = ?auto_3489 ?auto_3491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3488 ?auto_3491 )
      ( MAKE-1PILE ?auto_3488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3492 - BLOCK
    )
    :vars
    (
      ?auto_3494 - BLOCK
      ?auto_3493 - BLOCK
      ?auto_3495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3492 ?auto_3494 ) ) ( ON-TABLE ?auto_3493 ) ( not ( = ?auto_3493 ?auto_3494 ) ) ( not ( = ?auto_3493 ?auto_3492 ) ) ( ON ?auto_3492 ?auto_3495 ) ( CLEAR ?auto_3492 ) ( not ( = ?auto_3492 ?auto_3495 ) ) ( not ( = ?auto_3494 ?auto_3495 ) ) ( not ( = ?auto_3493 ?auto_3495 ) ) ( HOLDING ?auto_3494 ) ( CLEAR ?auto_3493 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3493 ?auto_3494 )
      ( MAKE-1PILE ?auto_3492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3496 - BLOCK
    )
    :vars
    (
      ?auto_3498 - BLOCK
      ?auto_3497 - BLOCK
      ?auto_3499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3496 ?auto_3498 ) ) ( ON-TABLE ?auto_3497 ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( not ( = ?auto_3497 ?auto_3496 ) ) ( ON ?auto_3496 ?auto_3499 ) ( not ( = ?auto_3496 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3497 ?auto_3499 ) ) ( CLEAR ?auto_3497 ) ( ON ?auto_3498 ?auto_3496 ) ( CLEAR ?auto_3498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3499 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3499 ?auto_3496 )
      ( MAKE-1PILE ?auto_3496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3500 - BLOCK
    )
    :vars
    (
      ?auto_3501 - BLOCK
      ?auto_3502 - BLOCK
      ?auto_3503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3500 ?auto_3501 ) ) ( not ( = ?auto_3502 ?auto_3501 ) ) ( not ( = ?auto_3502 ?auto_3500 ) ) ( ON ?auto_3500 ?auto_3503 ) ( not ( = ?auto_3500 ?auto_3503 ) ) ( not ( = ?auto_3501 ?auto_3503 ) ) ( not ( = ?auto_3502 ?auto_3503 ) ) ( ON ?auto_3501 ?auto_3500 ) ( CLEAR ?auto_3501 ) ( ON-TABLE ?auto_3503 ) ( HOLDING ?auto_3502 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3502 )
      ( MAKE-1PILE ?auto_3500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3504 - BLOCK
    )
    :vars
    (
      ?auto_3506 - BLOCK
      ?auto_3507 - BLOCK
      ?auto_3505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3504 ?auto_3506 ) ) ( not ( = ?auto_3507 ?auto_3506 ) ) ( not ( = ?auto_3507 ?auto_3504 ) ) ( ON ?auto_3504 ?auto_3505 ) ( not ( = ?auto_3504 ?auto_3505 ) ) ( not ( = ?auto_3506 ?auto_3505 ) ) ( not ( = ?auto_3507 ?auto_3505 ) ) ( ON ?auto_3506 ?auto_3504 ) ( ON-TABLE ?auto_3505 ) ( ON ?auto_3507 ?auto_3506 ) ( CLEAR ?auto_3507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3505 ?auto_3504 ?auto_3506 )
      ( MAKE-1PILE ?auto_3504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3509 - BLOCK
    )
    :vars
    (
      ?auto_3510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3510 ?auto_3509 ) ( CLEAR ?auto_3510 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3509 ) ( not ( = ?auto_3509 ?auto_3510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3510 ?auto_3509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3511 - BLOCK
    )
    :vars
    (
      ?auto_3512 - BLOCK
      ?auto_3513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3512 ?auto_3511 ) ( CLEAR ?auto_3512 ) ( ON-TABLE ?auto_3511 ) ( not ( = ?auto_3511 ?auto_3512 ) ) ( HOLDING ?auto_3513 ) ( not ( = ?auto_3511 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3513 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3513 )
      ( MAKE-1PILE ?auto_3511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3514 - BLOCK
    )
    :vars
    (
      ?auto_3515 - BLOCK
      ?auto_3516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3515 ?auto_3514 ) ( ON-TABLE ?auto_3514 ) ( not ( = ?auto_3514 ?auto_3515 ) ) ( not ( = ?auto_3514 ?auto_3516 ) ) ( not ( = ?auto_3515 ?auto_3516 ) ) ( ON ?auto_3516 ?auto_3515 ) ( CLEAR ?auto_3516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3514 ?auto_3515 )
      ( MAKE-1PILE ?auto_3514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3517 - BLOCK
    )
    :vars
    (
      ?auto_3519 - BLOCK
      ?auto_3518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3519 ?auto_3517 ) ( ON-TABLE ?auto_3517 ) ( not ( = ?auto_3517 ?auto_3519 ) ) ( not ( = ?auto_3517 ?auto_3518 ) ) ( not ( = ?auto_3519 ?auto_3518 ) ) ( HOLDING ?auto_3518 ) ( CLEAR ?auto_3519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3517 ?auto_3519 ?auto_3518 )
      ( MAKE-1PILE ?auto_3517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3520 - BLOCK
    )
    :vars
    (
      ?auto_3521 - BLOCK
      ?auto_3522 - BLOCK
      ?auto_3523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3521 ?auto_3520 ) ( ON-TABLE ?auto_3520 ) ( not ( = ?auto_3520 ?auto_3521 ) ) ( not ( = ?auto_3520 ?auto_3522 ) ) ( not ( = ?auto_3521 ?auto_3522 ) ) ( CLEAR ?auto_3521 ) ( ON ?auto_3522 ?auto_3523 ) ( CLEAR ?auto_3522 ) ( HAND-EMPTY ) ( not ( = ?auto_3520 ?auto_3523 ) ) ( not ( = ?auto_3521 ?auto_3523 ) ) ( not ( = ?auto_3522 ?auto_3523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3522 ?auto_3523 )
      ( MAKE-1PILE ?auto_3520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3532 - BLOCK
    )
    :vars
    (
      ?auto_3535 - BLOCK
      ?auto_3533 - BLOCK
      ?auto_3534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3532 ?auto_3535 ) ) ( not ( = ?auto_3532 ?auto_3533 ) ) ( not ( = ?auto_3535 ?auto_3533 ) ) ( ON ?auto_3533 ?auto_3534 ) ( not ( = ?auto_3532 ?auto_3534 ) ) ( not ( = ?auto_3535 ?auto_3534 ) ) ( not ( = ?auto_3533 ?auto_3534 ) ) ( ON ?auto_3535 ?auto_3533 ) ( CLEAR ?auto_3535 ) ( HOLDING ?auto_3532 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3532 ?auto_3535 )
      ( MAKE-1PILE ?auto_3532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3536 - BLOCK
    )
    :vars
    (
      ?auto_3537 - BLOCK
      ?auto_3538 - BLOCK
      ?auto_3539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3536 ?auto_3537 ) ) ( not ( = ?auto_3536 ?auto_3538 ) ) ( not ( = ?auto_3537 ?auto_3538 ) ) ( ON ?auto_3538 ?auto_3539 ) ( not ( = ?auto_3536 ?auto_3539 ) ) ( not ( = ?auto_3537 ?auto_3539 ) ) ( not ( = ?auto_3538 ?auto_3539 ) ) ( ON ?auto_3537 ?auto_3538 ) ( ON ?auto_3536 ?auto_3537 ) ( CLEAR ?auto_3536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3539 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3539 ?auto_3538 ?auto_3537 )
      ( MAKE-1PILE ?auto_3536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3542 - BLOCK
      ?auto_3543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3543 ) ( CLEAR ?auto_3542 ) ( ON-TABLE ?auto_3542 ) ( not ( = ?auto_3542 ?auto_3543 ) ) )
    :subtasks
    ( ( !STACK ?auto_3543 ?auto_3542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3544 - BLOCK
      ?auto_3545 - BLOCK
    )
    :vars
    (
      ?auto_3546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3544 ) ( ON-TABLE ?auto_3544 ) ( not ( = ?auto_3544 ?auto_3545 ) ) ( ON ?auto_3545 ?auto_3546 ) ( CLEAR ?auto_3545 ) ( HAND-EMPTY ) ( not ( = ?auto_3544 ?auto_3546 ) ) ( not ( = ?auto_3545 ?auto_3546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3545 ?auto_3546 )
      ( MAKE-2PILE ?auto_3544 ?auto_3545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3547 - BLOCK
      ?auto_3548 - BLOCK
    )
    :vars
    (
      ?auto_3549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3547 ?auto_3548 ) ) ( ON ?auto_3548 ?auto_3549 ) ( CLEAR ?auto_3548 ) ( not ( = ?auto_3547 ?auto_3549 ) ) ( not ( = ?auto_3548 ?auto_3549 ) ) ( HOLDING ?auto_3547 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3547 )
      ( MAKE-2PILE ?auto_3547 ?auto_3548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3550 - BLOCK
      ?auto_3551 - BLOCK
    )
    :vars
    (
      ?auto_3552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3550 ?auto_3551 ) ) ( ON ?auto_3551 ?auto_3552 ) ( not ( = ?auto_3550 ?auto_3552 ) ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( ON ?auto_3550 ?auto_3551 ) ( CLEAR ?auto_3550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3552 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3552 ?auto_3551 )
      ( MAKE-2PILE ?auto_3550 ?auto_3551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3553 - BLOCK
      ?auto_3554 - BLOCK
    )
    :vars
    (
      ?auto_3555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3553 ?auto_3554 ) ) ( ON ?auto_3554 ?auto_3555 ) ( not ( = ?auto_3553 ?auto_3555 ) ) ( not ( = ?auto_3554 ?auto_3555 ) ) ( ON-TABLE ?auto_3555 ) ( HOLDING ?auto_3553 ) ( CLEAR ?auto_3554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3555 ?auto_3554 ?auto_3553 )
      ( MAKE-2PILE ?auto_3553 ?auto_3554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3556 - BLOCK
      ?auto_3557 - BLOCK
    )
    :vars
    (
      ?auto_3558 - BLOCK
      ?auto_3559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3556 ?auto_3557 ) ) ( ON ?auto_3557 ?auto_3558 ) ( not ( = ?auto_3556 ?auto_3558 ) ) ( not ( = ?auto_3557 ?auto_3558 ) ) ( ON-TABLE ?auto_3558 ) ( CLEAR ?auto_3557 ) ( ON ?auto_3556 ?auto_3559 ) ( CLEAR ?auto_3556 ) ( HAND-EMPTY ) ( not ( = ?auto_3556 ?auto_3559 ) ) ( not ( = ?auto_3557 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3556 ?auto_3559 )
      ( MAKE-2PILE ?auto_3556 ?auto_3557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3560 - BLOCK
      ?auto_3561 - BLOCK
    )
    :vars
    (
      ?auto_3562 - BLOCK
      ?auto_3563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3560 ?auto_3561 ) ) ( not ( = ?auto_3560 ?auto_3562 ) ) ( not ( = ?auto_3561 ?auto_3562 ) ) ( ON-TABLE ?auto_3562 ) ( ON ?auto_3560 ?auto_3563 ) ( CLEAR ?auto_3560 ) ( not ( = ?auto_3560 ?auto_3563 ) ) ( not ( = ?auto_3561 ?auto_3563 ) ) ( not ( = ?auto_3562 ?auto_3563 ) ) ( HOLDING ?auto_3561 ) ( CLEAR ?auto_3562 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3562 ?auto_3561 )
      ( MAKE-2PILE ?auto_3560 ?auto_3561 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3564 - BLOCK
      ?auto_3565 - BLOCK
    )
    :vars
    (
      ?auto_3566 - BLOCK
      ?auto_3567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3564 ?auto_3565 ) ) ( not ( = ?auto_3564 ?auto_3566 ) ) ( not ( = ?auto_3565 ?auto_3566 ) ) ( ON-TABLE ?auto_3566 ) ( ON ?auto_3564 ?auto_3567 ) ( not ( = ?auto_3564 ?auto_3567 ) ) ( not ( = ?auto_3565 ?auto_3567 ) ) ( not ( = ?auto_3566 ?auto_3567 ) ) ( CLEAR ?auto_3566 ) ( ON ?auto_3565 ?auto_3564 ) ( CLEAR ?auto_3565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3567 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3567 ?auto_3564 )
      ( MAKE-2PILE ?auto_3564 ?auto_3565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3568 - BLOCK
      ?auto_3569 - BLOCK
    )
    :vars
    (
      ?auto_3570 - BLOCK
      ?auto_3571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3568 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3570 ) ) ( not ( = ?auto_3569 ?auto_3570 ) ) ( ON ?auto_3568 ?auto_3571 ) ( not ( = ?auto_3568 ?auto_3571 ) ) ( not ( = ?auto_3569 ?auto_3571 ) ) ( not ( = ?auto_3570 ?auto_3571 ) ) ( ON ?auto_3569 ?auto_3568 ) ( CLEAR ?auto_3569 ) ( ON-TABLE ?auto_3571 ) ( HOLDING ?auto_3570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3570 )
      ( MAKE-2PILE ?auto_3568 ?auto_3569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3572 - BLOCK
      ?auto_3573 - BLOCK
    )
    :vars
    (
      ?auto_3574 - BLOCK
      ?auto_3575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3572 ?auto_3573 ) ) ( not ( = ?auto_3572 ?auto_3574 ) ) ( not ( = ?auto_3573 ?auto_3574 ) ) ( ON ?auto_3572 ?auto_3575 ) ( not ( = ?auto_3572 ?auto_3575 ) ) ( not ( = ?auto_3573 ?auto_3575 ) ) ( not ( = ?auto_3574 ?auto_3575 ) ) ( ON ?auto_3573 ?auto_3572 ) ( ON-TABLE ?auto_3575 ) ( ON ?auto_3574 ?auto_3573 ) ( CLEAR ?auto_3574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3575 ?auto_3572 ?auto_3573 )
      ( MAKE-2PILE ?auto_3572 ?auto_3573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3579 - BLOCK
      ?auto_3580 - BLOCK
      ?auto_3581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3581 ) ( CLEAR ?auto_3580 ) ( ON-TABLE ?auto_3579 ) ( ON ?auto_3580 ?auto_3579 ) ( not ( = ?auto_3579 ?auto_3580 ) ) ( not ( = ?auto_3579 ?auto_3581 ) ) ( not ( = ?auto_3580 ?auto_3581 ) ) )
    :subtasks
    ( ( !STACK ?auto_3581 ?auto_3580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3582 - BLOCK
      ?auto_3583 - BLOCK
      ?auto_3584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3583 ) ( ON-TABLE ?auto_3582 ) ( ON ?auto_3583 ?auto_3582 ) ( not ( = ?auto_3582 ?auto_3583 ) ) ( not ( = ?auto_3582 ?auto_3584 ) ) ( not ( = ?auto_3583 ?auto_3584 ) ) ( ON-TABLE ?auto_3584 ) ( CLEAR ?auto_3584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3584 )
      ( MAKE-3PILE ?auto_3582 ?auto_3583 ?auto_3584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3585 - BLOCK
      ?auto_3586 - BLOCK
      ?auto_3587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3585 ) ( not ( = ?auto_3585 ?auto_3586 ) ) ( not ( = ?auto_3585 ?auto_3587 ) ) ( not ( = ?auto_3586 ?auto_3587 ) ) ( ON-TABLE ?auto_3587 ) ( CLEAR ?auto_3587 ) ( HOLDING ?auto_3586 ) ( CLEAR ?auto_3585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3585 ?auto_3586 )
      ( MAKE-3PILE ?auto_3585 ?auto_3586 ?auto_3587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3588 - BLOCK
      ?auto_3589 - BLOCK
      ?auto_3590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3588 ) ( not ( = ?auto_3588 ?auto_3589 ) ) ( not ( = ?auto_3588 ?auto_3590 ) ) ( not ( = ?auto_3589 ?auto_3590 ) ) ( ON-TABLE ?auto_3590 ) ( CLEAR ?auto_3588 ) ( ON ?auto_3589 ?auto_3590 ) ( CLEAR ?auto_3589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3590 )
      ( MAKE-3PILE ?auto_3588 ?auto_3589 ?auto_3590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3591 - BLOCK
      ?auto_3592 - BLOCK
      ?auto_3593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3591 ?auto_3592 ) ) ( not ( = ?auto_3591 ?auto_3593 ) ) ( not ( = ?auto_3592 ?auto_3593 ) ) ( ON-TABLE ?auto_3593 ) ( ON ?auto_3592 ?auto_3593 ) ( CLEAR ?auto_3592 ) ( HOLDING ?auto_3591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3591 )
      ( MAKE-3PILE ?auto_3591 ?auto_3592 ?auto_3593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3594 - BLOCK
      ?auto_3595 - BLOCK
      ?auto_3596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3594 ?auto_3595 ) ) ( not ( = ?auto_3594 ?auto_3596 ) ) ( not ( = ?auto_3595 ?auto_3596 ) ) ( ON-TABLE ?auto_3596 ) ( ON ?auto_3595 ?auto_3596 ) ( ON ?auto_3594 ?auto_3595 ) ( CLEAR ?auto_3594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3596 ?auto_3595 )
      ( MAKE-3PILE ?auto_3594 ?auto_3595 ?auto_3596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3597 - BLOCK
      ?auto_3598 - BLOCK
      ?auto_3599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3597 ?auto_3598 ) ) ( not ( = ?auto_3597 ?auto_3599 ) ) ( not ( = ?auto_3598 ?auto_3599 ) ) ( ON-TABLE ?auto_3599 ) ( ON ?auto_3598 ?auto_3599 ) ( HOLDING ?auto_3597 ) ( CLEAR ?auto_3598 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3599 ?auto_3598 ?auto_3597 )
      ( MAKE-3PILE ?auto_3597 ?auto_3598 ?auto_3599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3600 - BLOCK
      ?auto_3601 - BLOCK
      ?auto_3602 - BLOCK
    )
    :vars
    (
      ?auto_3603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3600 ?auto_3601 ) ) ( not ( = ?auto_3600 ?auto_3602 ) ) ( not ( = ?auto_3601 ?auto_3602 ) ) ( ON-TABLE ?auto_3602 ) ( ON ?auto_3601 ?auto_3602 ) ( CLEAR ?auto_3601 ) ( ON ?auto_3600 ?auto_3603 ) ( CLEAR ?auto_3600 ) ( HAND-EMPTY ) ( not ( = ?auto_3600 ?auto_3603 ) ) ( not ( = ?auto_3601 ?auto_3603 ) ) ( not ( = ?auto_3602 ?auto_3603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3600 ?auto_3603 )
      ( MAKE-3PILE ?auto_3600 ?auto_3601 ?auto_3602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3604 - BLOCK
      ?auto_3605 - BLOCK
      ?auto_3606 - BLOCK
    )
    :vars
    (
      ?auto_3607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3604 ?auto_3605 ) ) ( not ( = ?auto_3604 ?auto_3606 ) ) ( not ( = ?auto_3605 ?auto_3606 ) ) ( ON-TABLE ?auto_3606 ) ( ON ?auto_3604 ?auto_3607 ) ( CLEAR ?auto_3604 ) ( not ( = ?auto_3604 ?auto_3607 ) ) ( not ( = ?auto_3605 ?auto_3607 ) ) ( not ( = ?auto_3606 ?auto_3607 ) ) ( HOLDING ?auto_3605 ) ( CLEAR ?auto_3606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3606 ?auto_3605 )
      ( MAKE-3PILE ?auto_3604 ?auto_3605 ?auto_3606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3608 - BLOCK
      ?auto_3609 - BLOCK
      ?auto_3610 - BLOCK
    )
    :vars
    (
      ?auto_3611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3608 ?auto_3609 ) ) ( not ( = ?auto_3608 ?auto_3610 ) ) ( not ( = ?auto_3609 ?auto_3610 ) ) ( ON-TABLE ?auto_3610 ) ( ON ?auto_3608 ?auto_3611 ) ( not ( = ?auto_3608 ?auto_3611 ) ) ( not ( = ?auto_3609 ?auto_3611 ) ) ( not ( = ?auto_3610 ?auto_3611 ) ) ( CLEAR ?auto_3610 ) ( ON ?auto_3609 ?auto_3608 ) ( CLEAR ?auto_3609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3611 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3611 ?auto_3608 )
      ( MAKE-3PILE ?auto_3608 ?auto_3609 ?auto_3610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3612 - BLOCK
      ?auto_3613 - BLOCK
      ?auto_3614 - BLOCK
    )
    :vars
    (
      ?auto_3615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3612 ?auto_3613 ) ) ( not ( = ?auto_3612 ?auto_3614 ) ) ( not ( = ?auto_3613 ?auto_3614 ) ) ( ON ?auto_3612 ?auto_3615 ) ( not ( = ?auto_3612 ?auto_3615 ) ) ( not ( = ?auto_3613 ?auto_3615 ) ) ( not ( = ?auto_3614 ?auto_3615 ) ) ( ON ?auto_3613 ?auto_3612 ) ( CLEAR ?auto_3613 ) ( ON-TABLE ?auto_3615 ) ( HOLDING ?auto_3614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3614 )
      ( MAKE-3PILE ?auto_3612 ?auto_3613 ?auto_3614 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3616 - BLOCK
      ?auto_3617 - BLOCK
      ?auto_3618 - BLOCK
    )
    :vars
    (
      ?auto_3619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3616 ?auto_3617 ) ) ( not ( = ?auto_3616 ?auto_3618 ) ) ( not ( = ?auto_3617 ?auto_3618 ) ) ( ON ?auto_3616 ?auto_3619 ) ( not ( = ?auto_3616 ?auto_3619 ) ) ( not ( = ?auto_3617 ?auto_3619 ) ) ( not ( = ?auto_3618 ?auto_3619 ) ) ( ON ?auto_3617 ?auto_3616 ) ( ON-TABLE ?auto_3619 ) ( ON ?auto_3618 ?auto_3617 ) ( CLEAR ?auto_3618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3619 ?auto_3616 ?auto_3617 )
      ( MAKE-3PILE ?auto_3616 ?auto_3617 ?auto_3618 ) )
  )

)

