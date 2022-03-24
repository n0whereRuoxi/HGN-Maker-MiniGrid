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
      ?auto_18301 - BLOCK
    )
    :vars
    (
      ?auto_18302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18301 ?auto_18302 ) ( CLEAR ?auto_18301 ) ( HAND-EMPTY ) ( not ( = ?auto_18301 ?auto_18302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18301 ?auto_18302 )
      ( !PUTDOWN ?auto_18301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18308 - BLOCK
      ?auto_18309 - BLOCK
    )
    :vars
    (
      ?auto_18310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18308 ) ( ON ?auto_18309 ?auto_18310 ) ( CLEAR ?auto_18309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18308 ) ( not ( = ?auto_18308 ?auto_18309 ) ) ( not ( = ?auto_18308 ?auto_18310 ) ) ( not ( = ?auto_18309 ?auto_18310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18309 ?auto_18310 )
      ( !STACK ?auto_18309 ?auto_18308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_18318 - BLOCK
      ?auto_18319 - BLOCK
    )
    :vars
    (
      ?auto_18320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18319 ?auto_18320 ) ( not ( = ?auto_18318 ?auto_18319 ) ) ( not ( = ?auto_18318 ?auto_18320 ) ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( ON ?auto_18318 ?auto_18319 ) ( CLEAR ?auto_18318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18318 )
      ( MAKE-2PILE ?auto_18318 ?auto_18319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18329 - BLOCK
      ?auto_18330 - BLOCK
      ?auto_18331 - BLOCK
    )
    :vars
    (
      ?auto_18332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18330 ) ( ON ?auto_18331 ?auto_18332 ) ( CLEAR ?auto_18331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18329 ) ( ON ?auto_18330 ?auto_18329 ) ( not ( = ?auto_18329 ?auto_18330 ) ) ( not ( = ?auto_18329 ?auto_18331 ) ) ( not ( = ?auto_18329 ?auto_18332 ) ) ( not ( = ?auto_18330 ?auto_18331 ) ) ( not ( = ?auto_18330 ?auto_18332 ) ) ( not ( = ?auto_18331 ?auto_18332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18331 ?auto_18332 )
      ( !STACK ?auto_18331 ?auto_18330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18343 - BLOCK
      ?auto_18344 - BLOCK
      ?auto_18345 - BLOCK
    )
    :vars
    (
      ?auto_18346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18345 ?auto_18346 ) ( ON-TABLE ?auto_18343 ) ( not ( = ?auto_18343 ?auto_18344 ) ) ( not ( = ?auto_18343 ?auto_18345 ) ) ( not ( = ?auto_18343 ?auto_18346 ) ) ( not ( = ?auto_18344 ?auto_18345 ) ) ( not ( = ?auto_18344 ?auto_18346 ) ) ( not ( = ?auto_18345 ?auto_18346 ) ) ( CLEAR ?auto_18343 ) ( ON ?auto_18344 ?auto_18345 ) ( CLEAR ?auto_18344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18343 ?auto_18344 )
      ( MAKE-3PILE ?auto_18343 ?auto_18344 ?auto_18345 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_18357 - BLOCK
      ?auto_18358 - BLOCK
      ?auto_18359 - BLOCK
    )
    :vars
    (
      ?auto_18360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18359 ?auto_18360 ) ( not ( = ?auto_18357 ?auto_18358 ) ) ( not ( = ?auto_18357 ?auto_18359 ) ) ( not ( = ?auto_18357 ?auto_18360 ) ) ( not ( = ?auto_18358 ?auto_18359 ) ) ( not ( = ?auto_18358 ?auto_18360 ) ) ( not ( = ?auto_18359 ?auto_18360 ) ) ( ON ?auto_18358 ?auto_18359 ) ( ON ?auto_18357 ?auto_18358 ) ( CLEAR ?auto_18357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18357 )
      ( MAKE-3PILE ?auto_18357 ?auto_18358 ?auto_18359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18372 - BLOCK
      ?auto_18373 - BLOCK
      ?auto_18374 - BLOCK
      ?auto_18375 - BLOCK
    )
    :vars
    (
      ?auto_18376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18374 ) ( ON ?auto_18375 ?auto_18376 ) ( CLEAR ?auto_18375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18372 ) ( ON ?auto_18373 ?auto_18372 ) ( ON ?auto_18374 ?auto_18373 ) ( not ( = ?auto_18372 ?auto_18373 ) ) ( not ( = ?auto_18372 ?auto_18374 ) ) ( not ( = ?auto_18372 ?auto_18375 ) ) ( not ( = ?auto_18372 ?auto_18376 ) ) ( not ( = ?auto_18373 ?auto_18374 ) ) ( not ( = ?auto_18373 ?auto_18375 ) ) ( not ( = ?auto_18373 ?auto_18376 ) ) ( not ( = ?auto_18374 ?auto_18375 ) ) ( not ( = ?auto_18374 ?auto_18376 ) ) ( not ( = ?auto_18375 ?auto_18376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18375 ?auto_18376 )
      ( !STACK ?auto_18375 ?auto_18374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18390 - BLOCK
      ?auto_18391 - BLOCK
      ?auto_18392 - BLOCK
      ?auto_18393 - BLOCK
    )
    :vars
    (
      ?auto_18394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18393 ?auto_18394 ) ( ON-TABLE ?auto_18390 ) ( ON ?auto_18391 ?auto_18390 ) ( not ( = ?auto_18390 ?auto_18391 ) ) ( not ( = ?auto_18390 ?auto_18392 ) ) ( not ( = ?auto_18390 ?auto_18393 ) ) ( not ( = ?auto_18390 ?auto_18394 ) ) ( not ( = ?auto_18391 ?auto_18392 ) ) ( not ( = ?auto_18391 ?auto_18393 ) ) ( not ( = ?auto_18391 ?auto_18394 ) ) ( not ( = ?auto_18392 ?auto_18393 ) ) ( not ( = ?auto_18392 ?auto_18394 ) ) ( not ( = ?auto_18393 ?auto_18394 ) ) ( CLEAR ?auto_18391 ) ( ON ?auto_18392 ?auto_18393 ) ( CLEAR ?auto_18392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18390 ?auto_18391 ?auto_18392 )
      ( MAKE-4PILE ?auto_18390 ?auto_18391 ?auto_18392 ?auto_18393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18408 - BLOCK
      ?auto_18409 - BLOCK
      ?auto_18410 - BLOCK
      ?auto_18411 - BLOCK
    )
    :vars
    (
      ?auto_18412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18411 ?auto_18412 ) ( ON-TABLE ?auto_18408 ) ( not ( = ?auto_18408 ?auto_18409 ) ) ( not ( = ?auto_18408 ?auto_18410 ) ) ( not ( = ?auto_18408 ?auto_18411 ) ) ( not ( = ?auto_18408 ?auto_18412 ) ) ( not ( = ?auto_18409 ?auto_18410 ) ) ( not ( = ?auto_18409 ?auto_18411 ) ) ( not ( = ?auto_18409 ?auto_18412 ) ) ( not ( = ?auto_18410 ?auto_18411 ) ) ( not ( = ?auto_18410 ?auto_18412 ) ) ( not ( = ?auto_18411 ?auto_18412 ) ) ( ON ?auto_18410 ?auto_18411 ) ( CLEAR ?auto_18408 ) ( ON ?auto_18409 ?auto_18410 ) ( CLEAR ?auto_18409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18408 ?auto_18409 )
      ( MAKE-4PILE ?auto_18408 ?auto_18409 ?auto_18410 ?auto_18411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18426 - BLOCK
      ?auto_18427 - BLOCK
      ?auto_18428 - BLOCK
      ?auto_18429 - BLOCK
    )
    :vars
    (
      ?auto_18430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18429 ?auto_18430 ) ( not ( = ?auto_18426 ?auto_18427 ) ) ( not ( = ?auto_18426 ?auto_18428 ) ) ( not ( = ?auto_18426 ?auto_18429 ) ) ( not ( = ?auto_18426 ?auto_18430 ) ) ( not ( = ?auto_18427 ?auto_18428 ) ) ( not ( = ?auto_18427 ?auto_18429 ) ) ( not ( = ?auto_18427 ?auto_18430 ) ) ( not ( = ?auto_18428 ?auto_18429 ) ) ( not ( = ?auto_18428 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( ON ?auto_18428 ?auto_18429 ) ( ON ?auto_18427 ?auto_18428 ) ( ON ?auto_18426 ?auto_18427 ) ( CLEAR ?auto_18426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18426 )
      ( MAKE-4PILE ?auto_18426 ?auto_18427 ?auto_18428 ?auto_18429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18445 - BLOCK
      ?auto_18446 - BLOCK
      ?auto_18447 - BLOCK
      ?auto_18448 - BLOCK
      ?auto_18449 - BLOCK
    )
    :vars
    (
      ?auto_18450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18448 ) ( ON ?auto_18449 ?auto_18450 ) ( CLEAR ?auto_18449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18445 ) ( ON ?auto_18446 ?auto_18445 ) ( ON ?auto_18447 ?auto_18446 ) ( ON ?auto_18448 ?auto_18447 ) ( not ( = ?auto_18445 ?auto_18446 ) ) ( not ( = ?auto_18445 ?auto_18447 ) ) ( not ( = ?auto_18445 ?auto_18448 ) ) ( not ( = ?auto_18445 ?auto_18449 ) ) ( not ( = ?auto_18445 ?auto_18450 ) ) ( not ( = ?auto_18446 ?auto_18447 ) ) ( not ( = ?auto_18446 ?auto_18448 ) ) ( not ( = ?auto_18446 ?auto_18449 ) ) ( not ( = ?auto_18446 ?auto_18450 ) ) ( not ( = ?auto_18447 ?auto_18448 ) ) ( not ( = ?auto_18447 ?auto_18449 ) ) ( not ( = ?auto_18447 ?auto_18450 ) ) ( not ( = ?auto_18448 ?auto_18449 ) ) ( not ( = ?auto_18448 ?auto_18450 ) ) ( not ( = ?auto_18449 ?auto_18450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18449 ?auto_18450 )
      ( !STACK ?auto_18449 ?auto_18448 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18467 - BLOCK
      ?auto_18468 - BLOCK
      ?auto_18469 - BLOCK
      ?auto_18470 - BLOCK
      ?auto_18471 - BLOCK
    )
    :vars
    (
      ?auto_18472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18471 ?auto_18472 ) ( ON-TABLE ?auto_18467 ) ( ON ?auto_18468 ?auto_18467 ) ( ON ?auto_18469 ?auto_18468 ) ( not ( = ?auto_18467 ?auto_18468 ) ) ( not ( = ?auto_18467 ?auto_18469 ) ) ( not ( = ?auto_18467 ?auto_18470 ) ) ( not ( = ?auto_18467 ?auto_18471 ) ) ( not ( = ?auto_18467 ?auto_18472 ) ) ( not ( = ?auto_18468 ?auto_18469 ) ) ( not ( = ?auto_18468 ?auto_18470 ) ) ( not ( = ?auto_18468 ?auto_18471 ) ) ( not ( = ?auto_18468 ?auto_18472 ) ) ( not ( = ?auto_18469 ?auto_18470 ) ) ( not ( = ?auto_18469 ?auto_18471 ) ) ( not ( = ?auto_18469 ?auto_18472 ) ) ( not ( = ?auto_18470 ?auto_18471 ) ) ( not ( = ?auto_18470 ?auto_18472 ) ) ( not ( = ?auto_18471 ?auto_18472 ) ) ( CLEAR ?auto_18469 ) ( ON ?auto_18470 ?auto_18471 ) ( CLEAR ?auto_18470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18467 ?auto_18468 ?auto_18469 ?auto_18470 )
      ( MAKE-5PILE ?auto_18467 ?auto_18468 ?auto_18469 ?auto_18470 ?auto_18471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18489 - BLOCK
      ?auto_18490 - BLOCK
      ?auto_18491 - BLOCK
      ?auto_18492 - BLOCK
      ?auto_18493 - BLOCK
    )
    :vars
    (
      ?auto_18494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18493 ?auto_18494 ) ( ON-TABLE ?auto_18489 ) ( ON ?auto_18490 ?auto_18489 ) ( not ( = ?auto_18489 ?auto_18490 ) ) ( not ( = ?auto_18489 ?auto_18491 ) ) ( not ( = ?auto_18489 ?auto_18492 ) ) ( not ( = ?auto_18489 ?auto_18493 ) ) ( not ( = ?auto_18489 ?auto_18494 ) ) ( not ( = ?auto_18490 ?auto_18491 ) ) ( not ( = ?auto_18490 ?auto_18492 ) ) ( not ( = ?auto_18490 ?auto_18493 ) ) ( not ( = ?auto_18490 ?auto_18494 ) ) ( not ( = ?auto_18491 ?auto_18492 ) ) ( not ( = ?auto_18491 ?auto_18493 ) ) ( not ( = ?auto_18491 ?auto_18494 ) ) ( not ( = ?auto_18492 ?auto_18493 ) ) ( not ( = ?auto_18492 ?auto_18494 ) ) ( not ( = ?auto_18493 ?auto_18494 ) ) ( ON ?auto_18492 ?auto_18493 ) ( CLEAR ?auto_18490 ) ( ON ?auto_18491 ?auto_18492 ) ( CLEAR ?auto_18491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18489 ?auto_18490 ?auto_18491 )
      ( MAKE-5PILE ?auto_18489 ?auto_18490 ?auto_18491 ?auto_18492 ?auto_18493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18511 - BLOCK
      ?auto_18512 - BLOCK
      ?auto_18513 - BLOCK
      ?auto_18514 - BLOCK
      ?auto_18515 - BLOCK
    )
    :vars
    (
      ?auto_18516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18515 ?auto_18516 ) ( ON-TABLE ?auto_18511 ) ( not ( = ?auto_18511 ?auto_18512 ) ) ( not ( = ?auto_18511 ?auto_18513 ) ) ( not ( = ?auto_18511 ?auto_18514 ) ) ( not ( = ?auto_18511 ?auto_18515 ) ) ( not ( = ?auto_18511 ?auto_18516 ) ) ( not ( = ?auto_18512 ?auto_18513 ) ) ( not ( = ?auto_18512 ?auto_18514 ) ) ( not ( = ?auto_18512 ?auto_18515 ) ) ( not ( = ?auto_18512 ?auto_18516 ) ) ( not ( = ?auto_18513 ?auto_18514 ) ) ( not ( = ?auto_18513 ?auto_18515 ) ) ( not ( = ?auto_18513 ?auto_18516 ) ) ( not ( = ?auto_18514 ?auto_18515 ) ) ( not ( = ?auto_18514 ?auto_18516 ) ) ( not ( = ?auto_18515 ?auto_18516 ) ) ( ON ?auto_18514 ?auto_18515 ) ( ON ?auto_18513 ?auto_18514 ) ( CLEAR ?auto_18511 ) ( ON ?auto_18512 ?auto_18513 ) ( CLEAR ?auto_18512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18511 ?auto_18512 )
      ( MAKE-5PILE ?auto_18511 ?auto_18512 ?auto_18513 ?auto_18514 ?auto_18515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18533 - BLOCK
      ?auto_18534 - BLOCK
      ?auto_18535 - BLOCK
      ?auto_18536 - BLOCK
      ?auto_18537 - BLOCK
    )
    :vars
    (
      ?auto_18538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18537 ?auto_18538 ) ( not ( = ?auto_18533 ?auto_18534 ) ) ( not ( = ?auto_18533 ?auto_18535 ) ) ( not ( = ?auto_18533 ?auto_18536 ) ) ( not ( = ?auto_18533 ?auto_18537 ) ) ( not ( = ?auto_18533 ?auto_18538 ) ) ( not ( = ?auto_18534 ?auto_18535 ) ) ( not ( = ?auto_18534 ?auto_18536 ) ) ( not ( = ?auto_18534 ?auto_18537 ) ) ( not ( = ?auto_18534 ?auto_18538 ) ) ( not ( = ?auto_18535 ?auto_18536 ) ) ( not ( = ?auto_18535 ?auto_18537 ) ) ( not ( = ?auto_18535 ?auto_18538 ) ) ( not ( = ?auto_18536 ?auto_18537 ) ) ( not ( = ?auto_18536 ?auto_18538 ) ) ( not ( = ?auto_18537 ?auto_18538 ) ) ( ON ?auto_18536 ?auto_18537 ) ( ON ?auto_18535 ?auto_18536 ) ( ON ?auto_18534 ?auto_18535 ) ( ON ?auto_18533 ?auto_18534 ) ( CLEAR ?auto_18533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18533 )
      ( MAKE-5PILE ?auto_18533 ?auto_18534 ?auto_18535 ?auto_18536 ?auto_18537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18556 - BLOCK
      ?auto_18557 - BLOCK
      ?auto_18558 - BLOCK
      ?auto_18559 - BLOCK
      ?auto_18560 - BLOCK
      ?auto_18561 - BLOCK
    )
    :vars
    (
      ?auto_18562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18560 ) ( ON ?auto_18561 ?auto_18562 ) ( CLEAR ?auto_18561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18556 ) ( ON ?auto_18557 ?auto_18556 ) ( ON ?auto_18558 ?auto_18557 ) ( ON ?auto_18559 ?auto_18558 ) ( ON ?auto_18560 ?auto_18559 ) ( not ( = ?auto_18556 ?auto_18557 ) ) ( not ( = ?auto_18556 ?auto_18558 ) ) ( not ( = ?auto_18556 ?auto_18559 ) ) ( not ( = ?auto_18556 ?auto_18560 ) ) ( not ( = ?auto_18556 ?auto_18561 ) ) ( not ( = ?auto_18556 ?auto_18562 ) ) ( not ( = ?auto_18557 ?auto_18558 ) ) ( not ( = ?auto_18557 ?auto_18559 ) ) ( not ( = ?auto_18557 ?auto_18560 ) ) ( not ( = ?auto_18557 ?auto_18561 ) ) ( not ( = ?auto_18557 ?auto_18562 ) ) ( not ( = ?auto_18558 ?auto_18559 ) ) ( not ( = ?auto_18558 ?auto_18560 ) ) ( not ( = ?auto_18558 ?auto_18561 ) ) ( not ( = ?auto_18558 ?auto_18562 ) ) ( not ( = ?auto_18559 ?auto_18560 ) ) ( not ( = ?auto_18559 ?auto_18561 ) ) ( not ( = ?auto_18559 ?auto_18562 ) ) ( not ( = ?auto_18560 ?auto_18561 ) ) ( not ( = ?auto_18560 ?auto_18562 ) ) ( not ( = ?auto_18561 ?auto_18562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18561 ?auto_18562 )
      ( !STACK ?auto_18561 ?auto_18560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18582 - BLOCK
      ?auto_18583 - BLOCK
      ?auto_18584 - BLOCK
      ?auto_18585 - BLOCK
      ?auto_18586 - BLOCK
      ?auto_18587 - BLOCK
    )
    :vars
    (
      ?auto_18588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18587 ?auto_18588 ) ( ON-TABLE ?auto_18582 ) ( ON ?auto_18583 ?auto_18582 ) ( ON ?auto_18584 ?auto_18583 ) ( ON ?auto_18585 ?auto_18584 ) ( not ( = ?auto_18582 ?auto_18583 ) ) ( not ( = ?auto_18582 ?auto_18584 ) ) ( not ( = ?auto_18582 ?auto_18585 ) ) ( not ( = ?auto_18582 ?auto_18586 ) ) ( not ( = ?auto_18582 ?auto_18587 ) ) ( not ( = ?auto_18582 ?auto_18588 ) ) ( not ( = ?auto_18583 ?auto_18584 ) ) ( not ( = ?auto_18583 ?auto_18585 ) ) ( not ( = ?auto_18583 ?auto_18586 ) ) ( not ( = ?auto_18583 ?auto_18587 ) ) ( not ( = ?auto_18583 ?auto_18588 ) ) ( not ( = ?auto_18584 ?auto_18585 ) ) ( not ( = ?auto_18584 ?auto_18586 ) ) ( not ( = ?auto_18584 ?auto_18587 ) ) ( not ( = ?auto_18584 ?auto_18588 ) ) ( not ( = ?auto_18585 ?auto_18586 ) ) ( not ( = ?auto_18585 ?auto_18587 ) ) ( not ( = ?auto_18585 ?auto_18588 ) ) ( not ( = ?auto_18586 ?auto_18587 ) ) ( not ( = ?auto_18586 ?auto_18588 ) ) ( not ( = ?auto_18587 ?auto_18588 ) ) ( CLEAR ?auto_18585 ) ( ON ?auto_18586 ?auto_18587 ) ( CLEAR ?auto_18586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18582 ?auto_18583 ?auto_18584 ?auto_18585 ?auto_18586 )
      ( MAKE-6PILE ?auto_18582 ?auto_18583 ?auto_18584 ?auto_18585 ?auto_18586 ?auto_18587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18608 - BLOCK
      ?auto_18609 - BLOCK
      ?auto_18610 - BLOCK
      ?auto_18611 - BLOCK
      ?auto_18612 - BLOCK
      ?auto_18613 - BLOCK
    )
    :vars
    (
      ?auto_18614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18613 ?auto_18614 ) ( ON-TABLE ?auto_18608 ) ( ON ?auto_18609 ?auto_18608 ) ( ON ?auto_18610 ?auto_18609 ) ( not ( = ?auto_18608 ?auto_18609 ) ) ( not ( = ?auto_18608 ?auto_18610 ) ) ( not ( = ?auto_18608 ?auto_18611 ) ) ( not ( = ?auto_18608 ?auto_18612 ) ) ( not ( = ?auto_18608 ?auto_18613 ) ) ( not ( = ?auto_18608 ?auto_18614 ) ) ( not ( = ?auto_18609 ?auto_18610 ) ) ( not ( = ?auto_18609 ?auto_18611 ) ) ( not ( = ?auto_18609 ?auto_18612 ) ) ( not ( = ?auto_18609 ?auto_18613 ) ) ( not ( = ?auto_18609 ?auto_18614 ) ) ( not ( = ?auto_18610 ?auto_18611 ) ) ( not ( = ?auto_18610 ?auto_18612 ) ) ( not ( = ?auto_18610 ?auto_18613 ) ) ( not ( = ?auto_18610 ?auto_18614 ) ) ( not ( = ?auto_18611 ?auto_18612 ) ) ( not ( = ?auto_18611 ?auto_18613 ) ) ( not ( = ?auto_18611 ?auto_18614 ) ) ( not ( = ?auto_18612 ?auto_18613 ) ) ( not ( = ?auto_18612 ?auto_18614 ) ) ( not ( = ?auto_18613 ?auto_18614 ) ) ( ON ?auto_18612 ?auto_18613 ) ( CLEAR ?auto_18610 ) ( ON ?auto_18611 ?auto_18612 ) ( CLEAR ?auto_18611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18608 ?auto_18609 ?auto_18610 ?auto_18611 )
      ( MAKE-6PILE ?auto_18608 ?auto_18609 ?auto_18610 ?auto_18611 ?auto_18612 ?auto_18613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18634 - BLOCK
      ?auto_18635 - BLOCK
      ?auto_18636 - BLOCK
      ?auto_18637 - BLOCK
      ?auto_18638 - BLOCK
      ?auto_18639 - BLOCK
    )
    :vars
    (
      ?auto_18640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18639 ?auto_18640 ) ( ON-TABLE ?auto_18634 ) ( ON ?auto_18635 ?auto_18634 ) ( not ( = ?auto_18634 ?auto_18635 ) ) ( not ( = ?auto_18634 ?auto_18636 ) ) ( not ( = ?auto_18634 ?auto_18637 ) ) ( not ( = ?auto_18634 ?auto_18638 ) ) ( not ( = ?auto_18634 ?auto_18639 ) ) ( not ( = ?auto_18634 ?auto_18640 ) ) ( not ( = ?auto_18635 ?auto_18636 ) ) ( not ( = ?auto_18635 ?auto_18637 ) ) ( not ( = ?auto_18635 ?auto_18638 ) ) ( not ( = ?auto_18635 ?auto_18639 ) ) ( not ( = ?auto_18635 ?auto_18640 ) ) ( not ( = ?auto_18636 ?auto_18637 ) ) ( not ( = ?auto_18636 ?auto_18638 ) ) ( not ( = ?auto_18636 ?auto_18639 ) ) ( not ( = ?auto_18636 ?auto_18640 ) ) ( not ( = ?auto_18637 ?auto_18638 ) ) ( not ( = ?auto_18637 ?auto_18639 ) ) ( not ( = ?auto_18637 ?auto_18640 ) ) ( not ( = ?auto_18638 ?auto_18639 ) ) ( not ( = ?auto_18638 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18640 ) ) ( ON ?auto_18638 ?auto_18639 ) ( ON ?auto_18637 ?auto_18638 ) ( CLEAR ?auto_18635 ) ( ON ?auto_18636 ?auto_18637 ) ( CLEAR ?auto_18636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18634 ?auto_18635 ?auto_18636 )
      ( MAKE-6PILE ?auto_18634 ?auto_18635 ?auto_18636 ?auto_18637 ?auto_18638 ?auto_18639 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18660 - BLOCK
      ?auto_18661 - BLOCK
      ?auto_18662 - BLOCK
      ?auto_18663 - BLOCK
      ?auto_18664 - BLOCK
      ?auto_18665 - BLOCK
    )
    :vars
    (
      ?auto_18666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18665 ?auto_18666 ) ( ON-TABLE ?auto_18660 ) ( not ( = ?auto_18660 ?auto_18661 ) ) ( not ( = ?auto_18660 ?auto_18662 ) ) ( not ( = ?auto_18660 ?auto_18663 ) ) ( not ( = ?auto_18660 ?auto_18664 ) ) ( not ( = ?auto_18660 ?auto_18665 ) ) ( not ( = ?auto_18660 ?auto_18666 ) ) ( not ( = ?auto_18661 ?auto_18662 ) ) ( not ( = ?auto_18661 ?auto_18663 ) ) ( not ( = ?auto_18661 ?auto_18664 ) ) ( not ( = ?auto_18661 ?auto_18665 ) ) ( not ( = ?auto_18661 ?auto_18666 ) ) ( not ( = ?auto_18662 ?auto_18663 ) ) ( not ( = ?auto_18662 ?auto_18664 ) ) ( not ( = ?auto_18662 ?auto_18665 ) ) ( not ( = ?auto_18662 ?auto_18666 ) ) ( not ( = ?auto_18663 ?auto_18664 ) ) ( not ( = ?auto_18663 ?auto_18665 ) ) ( not ( = ?auto_18663 ?auto_18666 ) ) ( not ( = ?auto_18664 ?auto_18665 ) ) ( not ( = ?auto_18664 ?auto_18666 ) ) ( not ( = ?auto_18665 ?auto_18666 ) ) ( ON ?auto_18664 ?auto_18665 ) ( ON ?auto_18663 ?auto_18664 ) ( ON ?auto_18662 ?auto_18663 ) ( CLEAR ?auto_18660 ) ( ON ?auto_18661 ?auto_18662 ) ( CLEAR ?auto_18661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18660 ?auto_18661 )
      ( MAKE-6PILE ?auto_18660 ?auto_18661 ?auto_18662 ?auto_18663 ?auto_18664 ?auto_18665 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18686 - BLOCK
      ?auto_18687 - BLOCK
      ?auto_18688 - BLOCK
      ?auto_18689 - BLOCK
      ?auto_18690 - BLOCK
      ?auto_18691 - BLOCK
    )
    :vars
    (
      ?auto_18692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18691 ?auto_18692 ) ( not ( = ?auto_18686 ?auto_18687 ) ) ( not ( = ?auto_18686 ?auto_18688 ) ) ( not ( = ?auto_18686 ?auto_18689 ) ) ( not ( = ?auto_18686 ?auto_18690 ) ) ( not ( = ?auto_18686 ?auto_18691 ) ) ( not ( = ?auto_18686 ?auto_18692 ) ) ( not ( = ?auto_18687 ?auto_18688 ) ) ( not ( = ?auto_18687 ?auto_18689 ) ) ( not ( = ?auto_18687 ?auto_18690 ) ) ( not ( = ?auto_18687 ?auto_18691 ) ) ( not ( = ?auto_18687 ?auto_18692 ) ) ( not ( = ?auto_18688 ?auto_18689 ) ) ( not ( = ?auto_18688 ?auto_18690 ) ) ( not ( = ?auto_18688 ?auto_18691 ) ) ( not ( = ?auto_18688 ?auto_18692 ) ) ( not ( = ?auto_18689 ?auto_18690 ) ) ( not ( = ?auto_18689 ?auto_18691 ) ) ( not ( = ?auto_18689 ?auto_18692 ) ) ( not ( = ?auto_18690 ?auto_18691 ) ) ( not ( = ?auto_18690 ?auto_18692 ) ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( ON ?auto_18690 ?auto_18691 ) ( ON ?auto_18689 ?auto_18690 ) ( ON ?auto_18688 ?auto_18689 ) ( ON ?auto_18687 ?auto_18688 ) ( ON ?auto_18686 ?auto_18687 ) ( CLEAR ?auto_18686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18686 )
      ( MAKE-6PILE ?auto_18686 ?auto_18687 ?auto_18688 ?auto_18689 ?auto_18690 ?auto_18691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18713 - BLOCK
      ?auto_18714 - BLOCK
      ?auto_18715 - BLOCK
      ?auto_18716 - BLOCK
      ?auto_18717 - BLOCK
      ?auto_18718 - BLOCK
      ?auto_18719 - BLOCK
    )
    :vars
    (
      ?auto_18720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18718 ) ( ON ?auto_18719 ?auto_18720 ) ( CLEAR ?auto_18719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18713 ) ( ON ?auto_18714 ?auto_18713 ) ( ON ?auto_18715 ?auto_18714 ) ( ON ?auto_18716 ?auto_18715 ) ( ON ?auto_18717 ?auto_18716 ) ( ON ?auto_18718 ?auto_18717 ) ( not ( = ?auto_18713 ?auto_18714 ) ) ( not ( = ?auto_18713 ?auto_18715 ) ) ( not ( = ?auto_18713 ?auto_18716 ) ) ( not ( = ?auto_18713 ?auto_18717 ) ) ( not ( = ?auto_18713 ?auto_18718 ) ) ( not ( = ?auto_18713 ?auto_18719 ) ) ( not ( = ?auto_18713 ?auto_18720 ) ) ( not ( = ?auto_18714 ?auto_18715 ) ) ( not ( = ?auto_18714 ?auto_18716 ) ) ( not ( = ?auto_18714 ?auto_18717 ) ) ( not ( = ?auto_18714 ?auto_18718 ) ) ( not ( = ?auto_18714 ?auto_18719 ) ) ( not ( = ?auto_18714 ?auto_18720 ) ) ( not ( = ?auto_18715 ?auto_18716 ) ) ( not ( = ?auto_18715 ?auto_18717 ) ) ( not ( = ?auto_18715 ?auto_18718 ) ) ( not ( = ?auto_18715 ?auto_18719 ) ) ( not ( = ?auto_18715 ?auto_18720 ) ) ( not ( = ?auto_18716 ?auto_18717 ) ) ( not ( = ?auto_18716 ?auto_18718 ) ) ( not ( = ?auto_18716 ?auto_18719 ) ) ( not ( = ?auto_18716 ?auto_18720 ) ) ( not ( = ?auto_18717 ?auto_18718 ) ) ( not ( = ?auto_18717 ?auto_18719 ) ) ( not ( = ?auto_18717 ?auto_18720 ) ) ( not ( = ?auto_18718 ?auto_18719 ) ) ( not ( = ?auto_18718 ?auto_18720 ) ) ( not ( = ?auto_18719 ?auto_18720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18719 ?auto_18720 )
      ( !STACK ?auto_18719 ?auto_18718 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18728 - BLOCK
      ?auto_18729 - BLOCK
      ?auto_18730 - BLOCK
      ?auto_18731 - BLOCK
      ?auto_18732 - BLOCK
      ?auto_18733 - BLOCK
      ?auto_18734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18733 ) ( ON-TABLE ?auto_18734 ) ( CLEAR ?auto_18734 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18728 ) ( ON ?auto_18729 ?auto_18728 ) ( ON ?auto_18730 ?auto_18729 ) ( ON ?auto_18731 ?auto_18730 ) ( ON ?auto_18732 ?auto_18731 ) ( ON ?auto_18733 ?auto_18732 ) ( not ( = ?auto_18728 ?auto_18729 ) ) ( not ( = ?auto_18728 ?auto_18730 ) ) ( not ( = ?auto_18728 ?auto_18731 ) ) ( not ( = ?auto_18728 ?auto_18732 ) ) ( not ( = ?auto_18728 ?auto_18733 ) ) ( not ( = ?auto_18728 ?auto_18734 ) ) ( not ( = ?auto_18729 ?auto_18730 ) ) ( not ( = ?auto_18729 ?auto_18731 ) ) ( not ( = ?auto_18729 ?auto_18732 ) ) ( not ( = ?auto_18729 ?auto_18733 ) ) ( not ( = ?auto_18729 ?auto_18734 ) ) ( not ( = ?auto_18730 ?auto_18731 ) ) ( not ( = ?auto_18730 ?auto_18732 ) ) ( not ( = ?auto_18730 ?auto_18733 ) ) ( not ( = ?auto_18730 ?auto_18734 ) ) ( not ( = ?auto_18731 ?auto_18732 ) ) ( not ( = ?auto_18731 ?auto_18733 ) ) ( not ( = ?auto_18731 ?auto_18734 ) ) ( not ( = ?auto_18732 ?auto_18733 ) ) ( not ( = ?auto_18732 ?auto_18734 ) ) ( not ( = ?auto_18733 ?auto_18734 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_18734 )
      ( !STACK ?auto_18734 ?auto_18733 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18742 - BLOCK
      ?auto_18743 - BLOCK
      ?auto_18744 - BLOCK
      ?auto_18745 - BLOCK
      ?auto_18746 - BLOCK
      ?auto_18747 - BLOCK
      ?auto_18748 - BLOCK
    )
    :vars
    (
      ?auto_18749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18748 ?auto_18749 ) ( ON-TABLE ?auto_18742 ) ( ON ?auto_18743 ?auto_18742 ) ( ON ?auto_18744 ?auto_18743 ) ( ON ?auto_18745 ?auto_18744 ) ( ON ?auto_18746 ?auto_18745 ) ( not ( = ?auto_18742 ?auto_18743 ) ) ( not ( = ?auto_18742 ?auto_18744 ) ) ( not ( = ?auto_18742 ?auto_18745 ) ) ( not ( = ?auto_18742 ?auto_18746 ) ) ( not ( = ?auto_18742 ?auto_18747 ) ) ( not ( = ?auto_18742 ?auto_18748 ) ) ( not ( = ?auto_18742 ?auto_18749 ) ) ( not ( = ?auto_18743 ?auto_18744 ) ) ( not ( = ?auto_18743 ?auto_18745 ) ) ( not ( = ?auto_18743 ?auto_18746 ) ) ( not ( = ?auto_18743 ?auto_18747 ) ) ( not ( = ?auto_18743 ?auto_18748 ) ) ( not ( = ?auto_18743 ?auto_18749 ) ) ( not ( = ?auto_18744 ?auto_18745 ) ) ( not ( = ?auto_18744 ?auto_18746 ) ) ( not ( = ?auto_18744 ?auto_18747 ) ) ( not ( = ?auto_18744 ?auto_18748 ) ) ( not ( = ?auto_18744 ?auto_18749 ) ) ( not ( = ?auto_18745 ?auto_18746 ) ) ( not ( = ?auto_18745 ?auto_18747 ) ) ( not ( = ?auto_18745 ?auto_18748 ) ) ( not ( = ?auto_18745 ?auto_18749 ) ) ( not ( = ?auto_18746 ?auto_18747 ) ) ( not ( = ?auto_18746 ?auto_18748 ) ) ( not ( = ?auto_18746 ?auto_18749 ) ) ( not ( = ?auto_18747 ?auto_18748 ) ) ( not ( = ?auto_18747 ?auto_18749 ) ) ( not ( = ?auto_18748 ?auto_18749 ) ) ( CLEAR ?auto_18746 ) ( ON ?auto_18747 ?auto_18748 ) ( CLEAR ?auto_18747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_18742 ?auto_18743 ?auto_18744 ?auto_18745 ?auto_18746 ?auto_18747 )
      ( MAKE-7PILE ?auto_18742 ?auto_18743 ?auto_18744 ?auto_18745 ?auto_18746 ?auto_18747 ?auto_18748 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18757 - BLOCK
      ?auto_18758 - BLOCK
      ?auto_18759 - BLOCK
      ?auto_18760 - BLOCK
      ?auto_18761 - BLOCK
      ?auto_18762 - BLOCK
      ?auto_18763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18763 ) ( ON-TABLE ?auto_18757 ) ( ON ?auto_18758 ?auto_18757 ) ( ON ?auto_18759 ?auto_18758 ) ( ON ?auto_18760 ?auto_18759 ) ( ON ?auto_18761 ?auto_18760 ) ( not ( = ?auto_18757 ?auto_18758 ) ) ( not ( = ?auto_18757 ?auto_18759 ) ) ( not ( = ?auto_18757 ?auto_18760 ) ) ( not ( = ?auto_18757 ?auto_18761 ) ) ( not ( = ?auto_18757 ?auto_18762 ) ) ( not ( = ?auto_18757 ?auto_18763 ) ) ( not ( = ?auto_18758 ?auto_18759 ) ) ( not ( = ?auto_18758 ?auto_18760 ) ) ( not ( = ?auto_18758 ?auto_18761 ) ) ( not ( = ?auto_18758 ?auto_18762 ) ) ( not ( = ?auto_18758 ?auto_18763 ) ) ( not ( = ?auto_18759 ?auto_18760 ) ) ( not ( = ?auto_18759 ?auto_18761 ) ) ( not ( = ?auto_18759 ?auto_18762 ) ) ( not ( = ?auto_18759 ?auto_18763 ) ) ( not ( = ?auto_18760 ?auto_18761 ) ) ( not ( = ?auto_18760 ?auto_18762 ) ) ( not ( = ?auto_18760 ?auto_18763 ) ) ( not ( = ?auto_18761 ?auto_18762 ) ) ( not ( = ?auto_18761 ?auto_18763 ) ) ( not ( = ?auto_18762 ?auto_18763 ) ) ( CLEAR ?auto_18761 ) ( ON ?auto_18762 ?auto_18763 ) ( CLEAR ?auto_18762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_18757 ?auto_18758 ?auto_18759 ?auto_18760 ?auto_18761 ?auto_18762 )
      ( MAKE-7PILE ?auto_18757 ?auto_18758 ?auto_18759 ?auto_18760 ?auto_18761 ?auto_18762 ?auto_18763 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18771 - BLOCK
      ?auto_18772 - BLOCK
      ?auto_18773 - BLOCK
      ?auto_18774 - BLOCK
      ?auto_18775 - BLOCK
      ?auto_18776 - BLOCK
      ?auto_18777 - BLOCK
    )
    :vars
    (
      ?auto_18778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18777 ?auto_18778 ) ( ON-TABLE ?auto_18771 ) ( ON ?auto_18772 ?auto_18771 ) ( ON ?auto_18773 ?auto_18772 ) ( ON ?auto_18774 ?auto_18773 ) ( not ( = ?auto_18771 ?auto_18772 ) ) ( not ( = ?auto_18771 ?auto_18773 ) ) ( not ( = ?auto_18771 ?auto_18774 ) ) ( not ( = ?auto_18771 ?auto_18775 ) ) ( not ( = ?auto_18771 ?auto_18776 ) ) ( not ( = ?auto_18771 ?auto_18777 ) ) ( not ( = ?auto_18771 ?auto_18778 ) ) ( not ( = ?auto_18772 ?auto_18773 ) ) ( not ( = ?auto_18772 ?auto_18774 ) ) ( not ( = ?auto_18772 ?auto_18775 ) ) ( not ( = ?auto_18772 ?auto_18776 ) ) ( not ( = ?auto_18772 ?auto_18777 ) ) ( not ( = ?auto_18772 ?auto_18778 ) ) ( not ( = ?auto_18773 ?auto_18774 ) ) ( not ( = ?auto_18773 ?auto_18775 ) ) ( not ( = ?auto_18773 ?auto_18776 ) ) ( not ( = ?auto_18773 ?auto_18777 ) ) ( not ( = ?auto_18773 ?auto_18778 ) ) ( not ( = ?auto_18774 ?auto_18775 ) ) ( not ( = ?auto_18774 ?auto_18776 ) ) ( not ( = ?auto_18774 ?auto_18777 ) ) ( not ( = ?auto_18774 ?auto_18778 ) ) ( not ( = ?auto_18775 ?auto_18776 ) ) ( not ( = ?auto_18775 ?auto_18777 ) ) ( not ( = ?auto_18775 ?auto_18778 ) ) ( not ( = ?auto_18776 ?auto_18777 ) ) ( not ( = ?auto_18776 ?auto_18778 ) ) ( not ( = ?auto_18777 ?auto_18778 ) ) ( ON ?auto_18776 ?auto_18777 ) ( CLEAR ?auto_18774 ) ( ON ?auto_18775 ?auto_18776 ) ( CLEAR ?auto_18775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18771 ?auto_18772 ?auto_18773 ?auto_18774 ?auto_18775 )
      ( MAKE-7PILE ?auto_18771 ?auto_18772 ?auto_18773 ?auto_18774 ?auto_18775 ?auto_18776 ?auto_18777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18786 - BLOCK
      ?auto_18787 - BLOCK
      ?auto_18788 - BLOCK
      ?auto_18789 - BLOCK
      ?auto_18790 - BLOCK
      ?auto_18791 - BLOCK
      ?auto_18792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18792 ) ( ON-TABLE ?auto_18786 ) ( ON ?auto_18787 ?auto_18786 ) ( ON ?auto_18788 ?auto_18787 ) ( ON ?auto_18789 ?auto_18788 ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18789 ) ) ( not ( = ?auto_18786 ?auto_18790 ) ) ( not ( = ?auto_18786 ?auto_18791 ) ) ( not ( = ?auto_18786 ?auto_18792 ) ) ( not ( = ?auto_18787 ?auto_18788 ) ) ( not ( = ?auto_18787 ?auto_18789 ) ) ( not ( = ?auto_18787 ?auto_18790 ) ) ( not ( = ?auto_18787 ?auto_18791 ) ) ( not ( = ?auto_18787 ?auto_18792 ) ) ( not ( = ?auto_18788 ?auto_18789 ) ) ( not ( = ?auto_18788 ?auto_18790 ) ) ( not ( = ?auto_18788 ?auto_18791 ) ) ( not ( = ?auto_18788 ?auto_18792 ) ) ( not ( = ?auto_18789 ?auto_18790 ) ) ( not ( = ?auto_18789 ?auto_18791 ) ) ( not ( = ?auto_18789 ?auto_18792 ) ) ( not ( = ?auto_18790 ?auto_18791 ) ) ( not ( = ?auto_18790 ?auto_18792 ) ) ( not ( = ?auto_18791 ?auto_18792 ) ) ( ON ?auto_18791 ?auto_18792 ) ( CLEAR ?auto_18789 ) ( ON ?auto_18790 ?auto_18791 ) ( CLEAR ?auto_18790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18786 ?auto_18787 ?auto_18788 ?auto_18789 ?auto_18790 )
      ( MAKE-7PILE ?auto_18786 ?auto_18787 ?auto_18788 ?auto_18789 ?auto_18790 ?auto_18791 ?auto_18792 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18800 - BLOCK
      ?auto_18801 - BLOCK
      ?auto_18802 - BLOCK
      ?auto_18803 - BLOCK
      ?auto_18804 - BLOCK
      ?auto_18805 - BLOCK
      ?auto_18806 - BLOCK
    )
    :vars
    (
      ?auto_18807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18806 ?auto_18807 ) ( ON-TABLE ?auto_18800 ) ( ON ?auto_18801 ?auto_18800 ) ( ON ?auto_18802 ?auto_18801 ) ( not ( = ?auto_18800 ?auto_18801 ) ) ( not ( = ?auto_18800 ?auto_18802 ) ) ( not ( = ?auto_18800 ?auto_18803 ) ) ( not ( = ?auto_18800 ?auto_18804 ) ) ( not ( = ?auto_18800 ?auto_18805 ) ) ( not ( = ?auto_18800 ?auto_18806 ) ) ( not ( = ?auto_18800 ?auto_18807 ) ) ( not ( = ?auto_18801 ?auto_18802 ) ) ( not ( = ?auto_18801 ?auto_18803 ) ) ( not ( = ?auto_18801 ?auto_18804 ) ) ( not ( = ?auto_18801 ?auto_18805 ) ) ( not ( = ?auto_18801 ?auto_18806 ) ) ( not ( = ?auto_18801 ?auto_18807 ) ) ( not ( = ?auto_18802 ?auto_18803 ) ) ( not ( = ?auto_18802 ?auto_18804 ) ) ( not ( = ?auto_18802 ?auto_18805 ) ) ( not ( = ?auto_18802 ?auto_18806 ) ) ( not ( = ?auto_18802 ?auto_18807 ) ) ( not ( = ?auto_18803 ?auto_18804 ) ) ( not ( = ?auto_18803 ?auto_18805 ) ) ( not ( = ?auto_18803 ?auto_18806 ) ) ( not ( = ?auto_18803 ?auto_18807 ) ) ( not ( = ?auto_18804 ?auto_18805 ) ) ( not ( = ?auto_18804 ?auto_18806 ) ) ( not ( = ?auto_18804 ?auto_18807 ) ) ( not ( = ?auto_18805 ?auto_18806 ) ) ( not ( = ?auto_18805 ?auto_18807 ) ) ( not ( = ?auto_18806 ?auto_18807 ) ) ( ON ?auto_18805 ?auto_18806 ) ( ON ?auto_18804 ?auto_18805 ) ( CLEAR ?auto_18802 ) ( ON ?auto_18803 ?auto_18804 ) ( CLEAR ?auto_18803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18800 ?auto_18801 ?auto_18802 ?auto_18803 )
      ( MAKE-7PILE ?auto_18800 ?auto_18801 ?auto_18802 ?auto_18803 ?auto_18804 ?auto_18805 ?auto_18806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18815 - BLOCK
      ?auto_18816 - BLOCK
      ?auto_18817 - BLOCK
      ?auto_18818 - BLOCK
      ?auto_18819 - BLOCK
      ?auto_18820 - BLOCK
      ?auto_18821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18821 ) ( ON-TABLE ?auto_18815 ) ( ON ?auto_18816 ?auto_18815 ) ( ON ?auto_18817 ?auto_18816 ) ( not ( = ?auto_18815 ?auto_18816 ) ) ( not ( = ?auto_18815 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( not ( = ?auto_18815 ?auto_18819 ) ) ( not ( = ?auto_18815 ?auto_18820 ) ) ( not ( = ?auto_18815 ?auto_18821 ) ) ( not ( = ?auto_18816 ?auto_18817 ) ) ( not ( = ?auto_18816 ?auto_18818 ) ) ( not ( = ?auto_18816 ?auto_18819 ) ) ( not ( = ?auto_18816 ?auto_18820 ) ) ( not ( = ?auto_18816 ?auto_18821 ) ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18820 ) ) ( not ( = ?auto_18817 ?auto_18821 ) ) ( not ( = ?auto_18818 ?auto_18819 ) ) ( not ( = ?auto_18818 ?auto_18820 ) ) ( not ( = ?auto_18818 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18820 ) ) ( not ( = ?auto_18819 ?auto_18821 ) ) ( not ( = ?auto_18820 ?auto_18821 ) ) ( ON ?auto_18820 ?auto_18821 ) ( ON ?auto_18819 ?auto_18820 ) ( CLEAR ?auto_18817 ) ( ON ?auto_18818 ?auto_18819 ) ( CLEAR ?auto_18818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 )
      ( MAKE-7PILE ?auto_18815 ?auto_18816 ?auto_18817 ?auto_18818 ?auto_18819 ?auto_18820 ?auto_18821 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18829 - BLOCK
      ?auto_18830 - BLOCK
      ?auto_18831 - BLOCK
      ?auto_18832 - BLOCK
      ?auto_18833 - BLOCK
      ?auto_18834 - BLOCK
      ?auto_18835 - BLOCK
    )
    :vars
    (
      ?auto_18836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18835 ?auto_18836 ) ( ON-TABLE ?auto_18829 ) ( ON ?auto_18830 ?auto_18829 ) ( not ( = ?auto_18829 ?auto_18830 ) ) ( not ( = ?auto_18829 ?auto_18831 ) ) ( not ( = ?auto_18829 ?auto_18832 ) ) ( not ( = ?auto_18829 ?auto_18833 ) ) ( not ( = ?auto_18829 ?auto_18834 ) ) ( not ( = ?auto_18829 ?auto_18835 ) ) ( not ( = ?auto_18829 ?auto_18836 ) ) ( not ( = ?auto_18830 ?auto_18831 ) ) ( not ( = ?auto_18830 ?auto_18832 ) ) ( not ( = ?auto_18830 ?auto_18833 ) ) ( not ( = ?auto_18830 ?auto_18834 ) ) ( not ( = ?auto_18830 ?auto_18835 ) ) ( not ( = ?auto_18830 ?auto_18836 ) ) ( not ( = ?auto_18831 ?auto_18832 ) ) ( not ( = ?auto_18831 ?auto_18833 ) ) ( not ( = ?auto_18831 ?auto_18834 ) ) ( not ( = ?auto_18831 ?auto_18835 ) ) ( not ( = ?auto_18831 ?auto_18836 ) ) ( not ( = ?auto_18832 ?auto_18833 ) ) ( not ( = ?auto_18832 ?auto_18834 ) ) ( not ( = ?auto_18832 ?auto_18835 ) ) ( not ( = ?auto_18832 ?auto_18836 ) ) ( not ( = ?auto_18833 ?auto_18834 ) ) ( not ( = ?auto_18833 ?auto_18835 ) ) ( not ( = ?auto_18833 ?auto_18836 ) ) ( not ( = ?auto_18834 ?auto_18835 ) ) ( not ( = ?auto_18834 ?auto_18836 ) ) ( not ( = ?auto_18835 ?auto_18836 ) ) ( ON ?auto_18834 ?auto_18835 ) ( ON ?auto_18833 ?auto_18834 ) ( ON ?auto_18832 ?auto_18833 ) ( CLEAR ?auto_18830 ) ( ON ?auto_18831 ?auto_18832 ) ( CLEAR ?auto_18831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18829 ?auto_18830 ?auto_18831 )
      ( MAKE-7PILE ?auto_18829 ?auto_18830 ?auto_18831 ?auto_18832 ?auto_18833 ?auto_18834 ?auto_18835 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18844 - BLOCK
      ?auto_18845 - BLOCK
      ?auto_18846 - BLOCK
      ?auto_18847 - BLOCK
      ?auto_18848 - BLOCK
      ?auto_18849 - BLOCK
      ?auto_18850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18850 ) ( ON-TABLE ?auto_18844 ) ( ON ?auto_18845 ?auto_18844 ) ( not ( = ?auto_18844 ?auto_18845 ) ) ( not ( = ?auto_18844 ?auto_18846 ) ) ( not ( = ?auto_18844 ?auto_18847 ) ) ( not ( = ?auto_18844 ?auto_18848 ) ) ( not ( = ?auto_18844 ?auto_18849 ) ) ( not ( = ?auto_18844 ?auto_18850 ) ) ( not ( = ?auto_18845 ?auto_18846 ) ) ( not ( = ?auto_18845 ?auto_18847 ) ) ( not ( = ?auto_18845 ?auto_18848 ) ) ( not ( = ?auto_18845 ?auto_18849 ) ) ( not ( = ?auto_18845 ?auto_18850 ) ) ( not ( = ?auto_18846 ?auto_18847 ) ) ( not ( = ?auto_18846 ?auto_18848 ) ) ( not ( = ?auto_18846 ?auto_18849 ) ) ( not ( = ?auto_18846 ?auto_18850 ) ) ( not ( = ?auto_18847 ?auto_18848 ) ) ( not ( = ?auto_18847 ?auto_18849 ) ) ( not ( = ?auto_18847 ?auto_18850 ) ) ( not ( = ?auto_18848 ?auto_18849 ) ) ( not ( = ?auto_18848 ?auto_18850 ) ) ( not ( = ?auto_18849 ?auto_18850 ) ) ( ON ?auto_18849 ?auto_18850 ) ( ON ?auto_18848 ?auto_18849 ) ( ON ?auto_18847 ?auto_18848 ) ( CLEAR ?auto_18845 ) ( ON ?auto_18846 ?auto_18847 ) ( CLEAR ?auto_18846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18844 ?auto_18845 ?auto_18846 )
      ( MAKE-7PILE ?auto_18844 ?auto_18845 ?auto_18846 ?auto_18847 ?auto_18848 ?auto_18849 ?auto_18850 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18858 - BLOCK
      ?auto_18859 - BLOCK
      ?auto_18860 - BLOCK
      ?auto_18861 - BLOCK
      ?auto_18862 - BLOCK
      ?auto_18863 - BLOCK
      ?auto_18864 - BLOCK
    )
    :vars
    (
      ?auto_18865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18864 ?auto_18865 ) ( ON-TABLE ?auto_18858 ) ( not ( = ?auto_18858 ?auto_18859 ) ) ( not ( = ?auto_18858 ?auto_18860 ) ) ( not ( = ?auto_18858 ?auto_18861 ) ) ( not ( = ?auto_18858 ?auto_18862 ) ) ( not ( = ?auto_18858 ?auto_18863 ) ) ( not ( = ?auto_18858 ?auto_18864 ) ) ( not ( = ?auto_18858 ?auto_18865 ) ) ( not ( = ?auto_18859 ?auto_18860 ) ) ( not ( = ?auto_18859 ?auto_18861 ) ) ( not ( = ?auto_18859 ?auto_18862 ) ) ( not ( = ?auto_18859 ?auto_18863 ) ) ( not ( = ?auto_18859 ?auto_18864 ) ) ( not ( = ?auto_18859 ?auto_18865 ) ) ( not ( = ?auto_18860 ?auto_18861 ) ) ( not ( = ?auto_18860 ?auto_18862 ) ) ( not ( = ?auto_18860 ?auto_18863 ) ) ( not ( = ?auto_18860 ?auto_18864 ) ) ( not ( = ?auto_18860 ?auto_18865 ) ) ( not ( = ?auto_18861 ?auto_18862 ) ) ( not ( = ?auto_18861 ?auto_18863 ) ) ( not ( = ?auto_18861 ?auto_18864 ) ) ( not ( = ?auto_18861 ?auto_18865 ) ) ( not ( = ?auto_18862 ?auto_18863 ) ) ( not ( = ?auto_18862 ?auto_18864 ) ) ( not ( = ?auto_18862 ?auto_18865 ) ) ( not ( = ?auto_18863 ?auto_18864 ) ) ( not ( = ?auto_18863 ?auto_18865 ) ) ( not ( = ?auto_18864 ?auto_18865 ) ) ( ON ?auto_18863 ?auto_18864 ) ( ON ?auto_18862 ?auto_18863 ) ( ON ?auto_18861 ?auto_18862 ) ( ON ?auto_18860 ?auto_18861 ) ( CLEAR ?auto_18858 ) ( ON ?auto_18859 ?auto_18860 ) ( CLEAR ?auto_18859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18858 ?auto_18859 )
      ( MAKE-7PILE ?auto_18858 ?auto_18859 ?auto_18860 ?auto_18861 ?auto_18862 ?auto_18863 ?auto_18864 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18873 - BLOCK
      ?auto_18874 - BLOCK
      ?auto_18875 - BLOCK
      ?auto_18876 - BLOCK
      ?auto_18877 - BLOCK
      ?auto_18878 - BLOCK
      ?auto_18879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18879 ) ( ON-TABLE ?auto_18873 ) ( not ( = ?auto_18873 ?auto_18874 ) ) ( not ( = ?auto_18873 ?auto_18875 ) ) ( not ( = ?auto_18873 ?auto_18876 ) ) ( not ( = ?auto_18873 ?auto_18877 ) ) ( not ( = ?auto_18873 ?auto_18878 ) ) ( not ( = ?auto_18873 ?auto_18879 ) ) ( not ( = ?auto_18874 ?auto_18875 ) ) ( not ( = ?auto_18874 ?auto_18876 ) ) ( not ( = ?auto_18874 ?auto_18877 ) ) ( not ( = ?auto_18874 ?auto_18878 ) ) ( not ( = ?auto_18874 ?auto_18879 ) ) ( not ( = ?auto_18875 ?auto_18876 ) ) ( not ( = ?auto_18875 ?auto_18877 ) ) ( not ( = ?auto_18875 ?auto_18878 ) ) ( not ( = ?auto_18875 ?auto_18879 ) ) ( not ( = ?auto_18876 ?auto_18877 ) ) ( not ( = ?auto_18876 ?auto_18878 ) ) ( not ( = ?auto_18876 ?auto_18879 ) ) ( not ( = ?auto_18877 ?auto_18878 ) ) ( not ( = ?auto_18877 ?auto_18879 ) ) ( not ( = ?auto_18878 ?auto_18879 ) ) ( ON ?auto_18878 ?auto_18879 ) ( ON ?auto_18877 ?auto_18878 ) ( ON ?auto_18876 ?auto_18877 ) ( ON ?auto_18875 ?auto_18876 ) ( CLEAR ?auto_18873 ) ( ON ?auto_18874 ?auto_18875 ) ( CLEAR ?auto_18874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18873 ?auto_18874 )
      ( MAKE-7PILE ?auto_18873 ?auto_18874 ?auto_18875 ?auto_18876 ?auto_18877 ?auto_18878 ?auto_18879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18887 - BLOCK
      ?auto_18888 - BLOCK
      ?auto_18889 - BLOCK
      ?auto_18890 - BLOCK
      ?auto_18891 - BLOCK
      ?auto_18892 - BLOCK
      ?auto_18893 - BLOCK
    )
    :vars
    (
      ?auto_18894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18893 ?auto_18894 ) ( not ( = ?auto_18887 ?auto_18888 ) ) ( not ( = ?auto_18887 ?auto_18889 ) ) ( not ( = ?auto_18887 ?auto_18890 ) ) ( not ( = ?auto_18887 ?auto_18891 ) ) ( not ( = ?auto_18887 ?auto_18892 ) ) ( not ( = ?auto_18887 ?auto_18893 ) ) ( not ( = ?auto_18887 ?auto_18894 ) ) ( not ( = ?auto_18888 ?auto_18889 ) ) ( not ( = ?auto_18888 ?auto_18890 ) ) ( not ( = ?auto_18888 ?auto_18891 ) ) ( not ( = ?auto_18888 ?auto_18892 ) ) ( not ( = ?auto_18888 ?auto_18893 ) ) ( not ( = ?auto_18888 ?auto_18894 ) ) ( not ( = ?auto_18889 ?auto_18890 ) ) ( not ( = ?auto_18889 ?auto_18891 ) ) ( not ( = ?auto_18889 ?auto_18892 ) ) ( not ( = ?auto_18889 ?auto_18893 ) ) ( not ( = ?auto_18889 ?auto_18894 ) ) ( not ( = ?auto_18890 ?auto_18891 ) ) ( not ( = ?auto_18890 ?auto_18892 ) ) ( not ( = ?auto_18890 ?auto_18893 ) ) ( not ( = ?auto_18890 ?auto_18894 ) ) ( not ( = ?auto_18891 ?auto_18892 ) ) ( not ( = ?auto_18891 ?auto_18893 ) ) ( not ( = ?auto_18891 ?auto_18894 ) ) ( not ( = ?auto_18892 ?auto_18893 ) ) ( not ( = ?auto_18892 ?auto_18894 ) ) ( not ( = ?auto_18893 ?auto_18894 ) ) ( ON ?auto_18892 ?auto_18893 ) ( ON ?auto_18891 ?auto_18892 ) ( ON ?auto_18890 ?auto_18891 ) ( ON ?auto_18889 ?auto_18890 ) ( ON ?auto_18888 ?auto_18889 ) ( ON ?auto_18887 ?auto_18888 ) ( CLEAR ?auto_18887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18887 )
      ( MAKE-7PILE ?auto_18887 ?auto_18888 ?auto_18889 ?auto_18890 ?auto_18891 ?auto_18892 ?auto_18893 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18902 - BLOCK
      ?auto_18903 - BLOCK
      ?auto_18904 - BLOCK
      ?auto_18905 - BLOCK
      ?auto_18906 - BLOCK
      ?auto_18907 - BLOCK
      ?auto_18908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18908 ) ( not ( = ?auto_18902 ?auto_18903 ) ) ( not ( = ?auto_18902 ?auto_18904 ) ) ( not ( = ?auto_18902 ?auto_18905 ) ) ( not ( = ?auto_18902 ?auto_18906 ) ) ( not ( = ?auto_18902 ?auto_18907 ) ) ( not ( = ?auto_18902 ?auto_18908 ) ) ( not ( = ?auto_18903 ?auto_18904 ) ) ( not ( = ?auto_18903 ?auto_18905 ) ) ( not ( = ?auto_18903 ?auto_18906 ) ) ( not ( = ?auto_18903 ?auto_18907 ) ) ( not ( = ?auto_18903 ?auto_18908 ) ) ( not ( = ?auto_18904 ?auto_18905 ) ) ( not ( = ?auto_18904 ?auto_18906 ) ) ( not ( = ?auto_18904 ?auto_18907 ) ) ( not ( = ?auto_18904 ?auto_18908 ) ) ( not ( = ?auto_18905 ?auto_18906 ) ) ( not ( = ?auto_18905 ?auto_18907 ) ) ( not ( = ?auto_18905 ?auto_18908 ) ) ( not ( = ?auto_18906 ?auto_18907 ) ) ( not ( = ?auto_18906 ?auto_18908 ) ) ( not ( = ?auto_18907 ?auto_18908 ) ) ( ON ?auto_18907 ?auto_18908 ) ( ON ?auto_18906 ?auto_18907 ) ( ON ?auto_18905 ?auto_18906 ) ( ON ?auto_18904 ?auto_18905 ) ( ON ?auto_18903 ?auto_18904 ) ( ON ?auto_18902 ?auto_18903 ) ( CLEAR ?auto_18902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18902 )
      ( MAKE-7PILE ?auto_18902 ?auto_18903 ?auto_18904 ?auto_18905 ?auto_18906 ?auto_18907 ?auto_18908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_18916 - BLOCK
      ?auto_18917 - BLOCK
      ?auto_18918 - BLOCK
      ?auto_18919 - BLOCK
      ?auto_18920 - BLOCK
      ?auto_18921 - BLOCK
      ?auto_18922 - BLOCK
    )
    :vars
    (
      ?auto_18923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18916 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18918 ) ) ( not ( = ?auto_18916 ?auto_18919 ) ) ( not ( = ?auto_18916 ?auto_18920 ) ) ( not ( = ?auto_18916 ?auto_18921 ) ) ( not ( = ?auto_18916 ?auto_18922 ) ) ( not ( = ?auto_18917 ?auto_18918 ) ) ( not ( = ?auto_18917 ?auto_18919 ) ) ( not ( = ?auto_18917 ?auto_18920 ) ) ( not ( = ?auto_18917 ?auto_18921 ) ) ( not ( = ?auto_18917 ?auto_18922 ) ) ( not ( = ?auto_18918 ?auto_18919 ) ) ( not ( = ?auto_18918 ?auto_18920 ) ) ( not ( = ?auto_18918 ?auto_18921 ) ) ( not ( = ?auto_18918 ?auto_18922 ) ) ( not ( = ?auto_18919 ?auto_18920 ) ) ( not ( = ?auto_18919 ?auto_18921 ) ) ( not ( = ?auto_18919 ?auto_18922 ) ) ( not ( = ?auto_18920 ?auto_18921 ) ) ( not ( = ?auto_18920 ?auto_18922 ) ) ( not ( = ?auto_18921 ?auto_18922 ) ) ( ON ?auto_18916 ?auto_18923 ) ( not ( = ?auto_18922 ?auto_18923 ) ) ( not ( = ?auto_18921 ?auto_18923 ) ) ( not ( = ?auto_18920 ?auto_18923 ) ) ( not ( = ?auto_18919 ?auto_18923 ) ) ( not ( = ?auto_18918 ?auto_18923 ) ) ( not ( = ?auto_18917 ?auto_18923 ) ) ( not ( = ?auto_18916 ?auto_18923 ) ) ( ON ?auto_18917 ?auto_18916 ) ( ON ?auto_18918 ?auto_18917 ) ( ON ?auto_18919 ?auto_18918 ) ( ON ?auto_18920 ?auto_18919 ) ( ON ?auto_18921 ?auto_18920 ) ( ON ?auto_18922 ?auto_18921 ) ( CLEAR ?auto_18922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_18922 ?auto_18921 ?auto_18920 ?auto_18919 ?auto_18918 ?auto_18917 ?auto_18916 )
      ( MAKE-7PILE ?auto_18916 ?auto_18917 ?auto_18918 ?auto_18919 ?auto_18920 ?auto_18921 ?auto_18922 ) )
  )

)

