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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3326 - BLOCK
    )
    :vars
    (
      ?auto_3327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3326 ?auto_3327 ) ( CLEAR ?auto_3326 ) ( HAND-EMPTY ) ( not ( = ?auto_3326 ?auto_3327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3326 ?auto_3327 )
      ( !PUTDOWN ?auto_3326 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3329 - BLOCK
    )
    :vars
    (
      ?auto_3330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3329 ?auto_3330 ) ( CLEAR ?auto_3329 ) ( HAND-EMPTY ) ( not ( = ?auto_3329 ?auto_3330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3329 ?auto_3330 )
      ( !PUTDOWN ?auto_3329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3333 - BLOCK
      ?auto_3334 - BLOCK
    )
    :vars
    (
      ?auto_3335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3333 ) ( ON ?auto_3334 ?auto_3335 ) ( CLEAR ?auto_3334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3333 ) ( not ( = ?auto_3333 ?auto_3334 ) ) ( not ( = ?auto_3333 ?auto_3335 ) ) ( not ( = ?auto_3334 ?auto_3335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3334 ?auto_3335 )
      ( !STACK ?auto_3334 ?auto_3333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3338 - BLOCK
      ?auto_3339 - BLOCK
    )
    :vars
    (
      ?auto_3340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3338 ) ( ON ?auto_3339 ?auto_3340 ) ( CLEAR ?auto_3339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3338 ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( not ( = ?auto_3338 ?auto_3340 ) ) ( not ( = ?auto_3339 ?auto_3340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3339 ?auto_3340 )
      ( !STACK ?auto_3339 ?auto_3338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3343 - BLOCK
      ?auto_3344 - BLOCK
    )
    :vars
    (
      ?auto_3345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3344 ?auto_3345 ) ( not ( = ?auto_3343 ?auto_3344 ) ) ( not ( = ?auto_3343 ?auto_3345 ) ) ( not ( = ?auto_3344 ?auto_3345 ) ) ( ON ?auto_3343 ?auto_3344 ) ( CLEAR ?auto_3343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3343 )
      ( MAKE-2PILE ?auto_3343 ?auto_3344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3348 - BLOCK
      ?auto_3349 - BLOCK
    )
    :vars
    (
      ?auto_3350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3349 ?auto_3350 ) ( not ( = ?auto_3348 ?auto_3349 ) ) ( not ( = ?auto_3348 ?auto_3350 ) ) ( not ( = ?auto_3349 ?auto_3350 ) ) ( ON ?auto_3348 ?auto_3349 ) ( CLEAR ?auto_3348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3348 )
      ( MAKE-2PILE ?auto_3348 ?auto_3349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3354 - BLOCK
      ?auto_3355 - BLOCK
      ?auto_3356 - BLOCK
    )
    :vars
    (
      ?auto_3357 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3355 ) ( ON ?auto_3356 ?auto_3357 ) ( CLEAR ?auto_3356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3354 ) ( ON ?auto_3355 ?auto_3354 ) ( not ( = ?auto_3354 ?auto_3355 ) ) ( not ( = ?auto_3354 ?auto_3356 ) ) ( not ( = ?auto_3354 ?auto_3357 ) ) ( not ( = ?auto_3355 ?auto_3356 ) ) ( not ( = ?auto_3355 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3357 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3356 ?auto_3357 )
      ( !STACK ?auto_3356 ?auto_3355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3361 - BLOCK
      ?auto_3362 - BLOCK
      ?auto_3363 - BLOCK
    )
    :vars
    (
      ?auto_3364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3362 ) ( ON ?auto_3363 ?auto_3364 ) ( CLEAR ?auto_3363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3361 ) ( ON ?auto_3362 ?auto_3361 ) ( not ( = ?auto_3361 ?auto_3362 ) ) ( not ( = ?auto_3361 ?auto_3363 ) ) ( not ( = ?auto_3361 ?auto_3364 ) ) ( not ( = ?auto_3362 ?auto_3363 ) ) ( not ( = ?auto_3362 ?auto_3364 ) ) ( not ( = ?auto_3363 ?auto_3364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3363 ?auto_3364 )
      ( !STACK ?auto_3363 ?auto_3362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3368 - BLOCK
      ?auto_3369 - BLOCK
      ?auto_3370 - BLOCK
    )
    :vars
    (
      ?auto_3371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3370 ?auto_3371 ) ( ON-TABLE ?auto_3368 ) ( not ( = ?auto_3368 ?auto_3369 ) ) ( not ( = ?auto_3368 ?auto_3370 ) ) ( not ( = ?auto_3368 ?auto_3371 ) ) ( not ( = ?auto_3369 ?auto_3370 ) ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( not ( = ?auto_3370 ?auto_3371 ) ) ( CLEAR ?auto_3368 ) ( ON ?auto_3369 ?auto_3370 ) ( CLEAR ?auto_3369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3368 ?auto_3369 )
      ( MAKE-3PILE ?auto_3368 ?auto_3369 ?auto_3370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3375 - BLOCK
      ?auto_3376 - BLOCK
      ?auto_3377 - BLOCK
    )
    :vars
    (
      ?auto_3378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3377 ?auto_3378 ) ( ON-TABLE ?auto_3375 ) ( not ( = ?auto_3375 ?auto_3376 ) ) ( not ( = ?auto_3375 ?auto_3377 ) ) ( not ( = ?auto_3375 ?auto_3378 ) ) ( not ( = ?auto_3376 ?auto_3377 ) ) ( not ( = ?auto_3376 ?auto_3378 ) ) ( not ( = ?auto_3377 ?auto_3378 ) ) ( CLEAR ?auto_3375 ) ( ON ?auto_3376 ?auto_3377 ) ( CLEAR ?auto_3376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3375 ?auto_3376 )
      ( MAKE-3PILE ?auto_3375 ?auto_3376 ?auto_3377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3382 - BLOCK
      ?auto_3383 - BLOCK
      ?auto_3384 - BLOCK
    )
    :vars
    (
      ?auto_3385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3384 ?auto_3385 ) ( not ( = ?auto_3382 ?auto_3383 ) ) ( not ( = ?auto_3382 ?auto_3384 ) ) ( not ( = ?auto_3382 ?auto_3385 ) ) ( not ( = ?auto_3383 ?auto_3384 ) ) ( not ( = ?auto_3383 ?auto_3385 ) ) ( not ( = ?auto_3384 ?auto_3385 ) ) ( ON ?auto_3383 ?auto_3384 ) ( ON ?auto_3382 ?auto_3383 ) ( CLEAR ?auto_3382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3382 )
      ( MAKE-3PILE ?auto_3382 ?auto_3383 ?auto_3384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3389 - BLOCK
      ?auto_3390 - BLOCK
      ?auto_3391 - BLOCK
    )
    :vars
    (
      ?auto_3392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3391 ?auto_3392 ) ( not ( = ?auto_3389 ?auto_3390 ) ) ( not ( = ?auto_3389 ?auto_3391 ) ) ( not ( = ?auto_3389 ?auto_3392 ) ) ( not ( = ?auto_3390 ?auto_3391 ) ) ( not ( = ?auto_3390 ?auto_3392 ) ) ( not ( = ?auto_3391 ?auto_3392 ) ) ( ON ?auto_3390 ?auto_3391 ) ( ON ?auto_3389 ?auto_3390 ) ( CLEAR ?auto_3389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3389 )
      ( MAKE-3PILE ?auto_3389 ?auto_3390 ?auto_3391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3397 - BLOCK
      ?auto_3398 - BLOCK
      ?auto_3399 - BLOCK
      ?auto_3400 - BLOCK
    )
    :vars
    (
      ?auto_3401 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3399 ) ( ON ?auto_3400 ?auto_3401 ) ( CLEAR ?auto_3400 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3397 ) ( ON ?auto_3398 ?auto_3397 ) ( ON ?auto_3399 ?auto_3398 ) ( not ( = ?auto_3397 ?auto_3398 ) ) ( not ( = ?auto_3397 ?auto_3399 ) ) ( not ( = ?auto_3397 ?auto_3400 ) ) ( not ( = ?auto_3397 ?auto_3401 ) ) ( not ( = ?auto_3398 ?auto_3399 ) ) ( not ( = ?auto_3398 ?auto_3400 ) ) ( not ( = ?auto_3398 ?auto_3401 ) ) ( not ( = ?auto_3399 ?auto_3400 ) ) ( not ( = ?auto_3399 ?auto_3401 ) ) ( not ( = ?auto_3400 ?auto_3401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3400 ?auto_3401 )
      ( !STACK ?auto_3400 ?auto_3399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3406 - BLOCK
      ?auto_3407 - BLOCK
      ?auto_3408 - BLOCK
      ?auto_3409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3408 ) ( ON-TABLE ?auto_3409 ) ( CLEAR ?auto_3409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3406 ) ( ON ?auto_3407 ?auto_3406 ) ( ON ?auto_3408 ?auto_3407 ) ( not ( = ?auto_3406 ?auto_3407 ) ) ( not ( = ?auto_3406 ?auto_3408 ) ) ( not ( = ?auto_3406 ?auto_3409 ) ) ( not ( = ?auto_3407 ?auto_3408 ) ) ( not ( = ?auto_3407 ?auto_3409 ) ) ( not ( = ?auto_3408 ?auto_3409 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_3409 )
      ( !STACK ?auto_3409 ?auto_3408 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3414 - BLOCK
      ?auto_3415 - BLOCK
      ?auto_3416 - BLOCK
      ?auto_3417 - BLOCK
    )
    :vars
    (
      ?auto_3418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3417 ?auto_3418 ) ( ON-TABLE ?auto_3414 ) ( ON ?auto_3415 ?auto_3414 ) ( not ( = ?auto_3414 ?auto_3415 ) ) ( not ( = ?auto_3414 ?auto_3416 ) ) ( not ( = ?auto_3414 ?auto_3417 ) ) ( not ( = ?auto_3414 ?auto_3418 ) ) ( not ( = ?auto_3415 ?auto_3416 ) ) ( not ( = ?auto_3415 ?auto_3417 ) ) ( not ( = ?auto_3415 ?auto_3418 ) ) ( not ( = ?auto_3416 ?auto_3417 ) ) ( not ( = ?auto_3416 ?auto_3418 ) ) ( not ( = ?auto_3417 ?auto_3418 ) ) ( CLEAR ?auto_3415 ) ( ON ?auto_3416 ?auto_3417 ) ( CLEAR ?auto_3416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3414 ?auto_3415 ?auto_3416 )
      ( MAKE-4PILE ?auto_3414 ?auto_3415 ?auto_3416 ?auto_3417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3423 - BLOCK
      ?auto_3424 - BLOCK
      ?auto_3425 - BLOCK
      ?auto_3426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3426 ) ( ON-TABLE ?auto_3423 ) ( ON ?auto_3424 ?auto_3423 ) ( not ( = ?auto_3423 ?auto_3424 ) ) ( not ( = ?auto_3423 ?auto_3425 ) ) ( not ( = ?auto_3423 ?auto_3426 ) ) ( not ( = ?auto_3424 ?auto_3425 ) ) ( not ( = ?auto_3424 ?auto_3426 ) ) ( not ( = ?auto_3425 ?auto_3426 ) ) ( CLEAR ?auto_3424 ) ( ON ?auto_3425 ?auto_3426 ) ( CLEAR ?auto_3425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3423 ?auto_3424 ?auto_3425 )
      ( MAKE-4PILE ?auto_3423 ?auto_3424 ?auto_3425 ?auto_3426 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3431 - BLOCK
      ?auto_3432 - BLOCK
      ?auto_3433 - BLOCK
      ?auto_3434 - BLOCK
    )
    :vars
    (
      ?auto_3435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3434 ?auto_3435 ) ( ON-TABLE ?auto_3431 ) ( not ( = ?auto_3431 ?auto_3432 ) ) ( not ( = ?auto_3431 ?auto_3433 ) ) ( not ( = ?auto_3431 ?auto_3434 ) ) ( not ( = ?auto_3431 ?auto_3435 ) ) ( not ( = ?auto_3432 ?auto_3433 ) ) ( not ( = ?auto_3432 ?auto_3434 ) ) ( not ( = ?auto_3432 ?auto_3435 ) ) ( not ( = ?auto_3433 ?auto_3434 ) ) ( not ( = ?auto_3433 ?auto_3435 ) ) ( not ( = ?auto_3434 ?auto_3435 ) ) ( ON ?auto_3433 ?auto_3434 ) ( CLEAR ?auto_3431 ) ( ON ?auto_3432 ?auto_3433 ) ( CLEAR ?auto_3432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3431 ?auto_3432 )
      ( MAKE-4PILE ?auto_3431 ?auto_3432 ?auto_3433 ?auto_3434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3440 - BLOCK
      ?auto_3441 - BLOCK
      ?auto_3442 - BLOCK
      ?auto_3443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3443 ) ( ON-TABLE ?auto_3440 ) ( not ( = ?auto_3440 ?auto_3441 ) ) ( not ( = ?auto_3440 ?auto_3442 ) ) ( not ( = ?auto_3440 ?auto_3443 ) ) ( not ( = ?auto_3441 ?auto_3442 ) ) ( not ( = ?auto_3441 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( ON ?auto_3442 ?auto_3443 ) ( CLEAR ?auto_3440 ) ( ON ?auto_3441 ?auto_3442 ) ( CLEAR ?auto_3441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3440 ?auto_3441 )
      ( MAKE-4PILE ?auto_3440 ?auto_3441 ?auto_3442 ?auto_3443 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3448 - BLOCK
      ?auto_3449 - BLOCK
      ?auto_3450 - BLOCK
      ?auto_3451 - BLOCK
    )
    :vars
    (
      ?auto_3452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3451 ?auto_3452 ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3448 ?auto_3450 ) ) ( not ( = ?auto_3448 ?auto_3451 ) ) ( not ( = ?auto_3448 ?auto_3452 ) ) ( not ( = ?auto_3449 ?auto_3450 ) ) ( not ( = ?auto_3449 ?auto_3451 ) ) ( not ( = ?auto_3449 ?auto_3452 ) ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( not ( = ?auto_3450 ?auto_3452 ) ) ( not ( = ?auto_3451 ?auto_3452 ) ) ( ON ?auto_3450 ?auto_3451 ) ( ON ?auto_3449 ?auto_3450 ) ( ON ?auto_3448 ?auto_3449 ) ( CLEAR ?auto_3448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3448 )
      ( MAKE-4PILE ?auto_3448 ?auto_3449 ?auto_3450 ?auto_3451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3457 - BLOCK
      ?auto_3458 - BLOCK
      ?auto_3459 - BLOCK
      ?auto_3460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3460 ) ( not ( = ?auto_3457 ?auto_3458 ) ) ( not ( = ?auto_3457 ?auto_3459 ) ) ( not ( = ?auto_3457 ?auto_3460 ) ) ( not ( = ?auto_3458 ?auto_3459 ) ) ( not ( = ?auto_3458 ?auto_3460 ) ) ( not ( = ?auto_3459 ?auto_3460 ) ) ( ON ?auto_3459 ?auto_3460 ) ( ON ?auto_3458 ?auto_3459 ) ( ON ?auto_3457 ?auto_3458 ) ( CLEAR ?auto_3457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3457 )
      ( MAKE-4PILE ?auto_3457 ?auto_3458 ?auto_3459 ?auto_3460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_3465 - BLOCK
      ?auto_3466 - BLOCK
      ?auto_3467 - BLOCK
      ?auto_3468 - BLOCK
    )
    :vars
    (
      ?auto_3469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3465 ?auto_3466 ) ) ( not ( = ?auto_3465 ?auto_3467 ) ) ( not ( = ?auto_3465 ?auto_3468 ) ) ( not ( = ?auto_3466 ?auto_3467 ) ) ( not ( = ?auto_3466 ?auto_3468 ) ) ( not ( = ?auto_3467 ?auto_3468 ) ) ( ON ?auto_3465 ?auto_3469 ) ( not ( = ?auto_3468 ?auto_3469 ) ) ( not ( = ?auto_3467 ?auto_3469 ) ) ( not ( = ?auto_3466 ?auto_3469 ) ) ( not ( = ?auto_3465 ?auto_3469 ) ) ( ON ?auto_3466 ?auto_3465 ) ( ON ?auto_3467 ?auto_3466 ) ( ON ?auto_3468 ?auto_3467 ) ( CLEAR ?auto_3468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_3468 ?auto_3467 ?auto_3466 ?auto_3465 )
      ( MAKE-4PILE ?auto_3465 ?auto_3466 ?auto_3467 ?auto_3468 ) )
  )

)

