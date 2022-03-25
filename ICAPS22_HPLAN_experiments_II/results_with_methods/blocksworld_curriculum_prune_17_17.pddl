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
      ?auto_717289 - BLOCK
    )
    :vars
    (
      ?auto_717290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717289 ?auto_717290 ) ( CLEAR ?auto_717289 ) ( HAND-EMPTY ) ( not ( = ?auto_717289 ?auto_717290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717289 ?auto_717290 )
      ( !PUTDOWN ?auto_717289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_717296 - BLOCK
      ?auto_717297 - BLOCK
    )
    :vars
    (
      ?auto_717298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_717296 ) ( ON ?auto_717297 ?auto_717298 ) ( CLEAR ?auto_717297 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_717296 ) ( not ( = ?auto_717296 ?auto_717297 ) ) ( not ( = ?auto_717296 ?auto_717298 ) ) ( not ( = ?auto_717297 ?auto_717298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717297 ?auto_717298 )
      ( !STACK ?auto_717297 ?auto_717296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_717306 - BLOCK
      ?auto_717307 - BLOCK
    )
    :vars
    (
      ?auto_717308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717307 ?auto_717308 ) ( not ( = ?auto_717306 ?auto_717307 ) ) ( not ( = ?auto_717306 ?auto_717308 ) ) ( not ( = ?auto_717307 ?auto_717308 ) ) ( ON ?auto_717306 ?auto_717307 ) ( CLEAR ?auto_717306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717306 )
      ( MAKE-2PILE ?auto_717306 ?auto_717307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_717317 - BLOCK
      ?auto_717318 - BLOCK
      ?auto_717319 - BLOCK
    )
    :vars
    (
      ?auto_717320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_717318 ) ( ON ?auto_717319 ?auto_717320 ) ( CLEAR ?auto_717319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_717317 ) ( ON ?auto_717318 ?auto_717317 ) ( not ( = ?auto_717317 ?auto_717318 ) ) ( not ( = ?auto_717317 ?auto_717319 ) ) ( not ( = ?auto_717317 ?auto_717320 ) ) ( not ( = ?auto_717318 ?auto_717319 ) ) ( not ( = ?auto_717318 ?auto_717320 ) ) ( not ( = ?auto_717319 ?auto_717320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717319 ?auto_717320 )
      ( !STACK ?auto_717319 ?auto_717318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_717331 - BLOCK
      ?auto_717332 - BLOCK
      ?auto_717333 - BLOCK
    )
    :vars
    (
      ?auto_717334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717333 ?auto_717334 ) ( ON-TABLE ?auto_717331 ) ( not ( = ?auto_717331 ?auto_717332 ) ) ( not ( = ?auto_717331 ?auto_717333 ) ) ( not ( = ?auto_717331 ?auto_717334 ) ) ( not ( = ?auto_717332 ?auto_717333 ) ) ( not ( = ?auto_717332 ?auto_717334 ) ) ( not ( = ?auto_717333 ?auto_717334 ) ) ( CLEAR ?auto_717331 ) ( ON ?auto_717332 ?auto_717333 ) ( CLEAR ?auto_717332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_717331 ?auto_717332 )
      ( MAKE-3PILE ?auto_717331 ?auto_717332 ?auto_717333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_717345 - BLOCK
      ?auto_717346 - BLOCK
      ?auto_717347 - BLOCK
    )
    :vars
    (
      ?auto_717348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717347 ?auto_717348 ) ( not ( = ?auto_717345 ?auto_717346 ) ) ( not ( = ?auto_717345 ?auto_717347 ) ) ( not ( = ?auto_717345 ?auto_717348 ) ) ( not ( = ?auto_717346 ?auto_717347 ) ) ( not ( = ?auto_717346 ?auto_717348 ) ) ( not ( = ?auto_717347 ?auto_717348 ) ) ( ON ?auto_717346 ?auto_717347 ) ( ON ?auto_717345 ?auto_717346 ) ( CLEAR ?auto_717345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717345 )
      ( MAKE-3PILE ?auto_717345 ?auto_717346 ?auto_717347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_717360 - BLOCK
      ?auto_717361 - BLOCK
      ?auto_717362 - BLOCK
      ?auto_717363 - BLOCK
    )
    :vars
    (
      ?auto_717364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_717362 ) ( ON ?auto_717363 ?auto_717364 ) ( CLEAR ?auto_717363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_717360 ) ( ON ?auto_717361 ?auto_717360 ) ( ON ?auto_717362 ?auto_717361 ) ( not ( = ?auto_717360 ?auto_717361 ) ) ( not ( = ?auto_717360 ?auto_717362 ) ) ( not ( = ?auto_717360 ?auto_717363 ) ) ( not ( = ?auto_717360 ?auto_717364 ) ) ( not ( = ?auto_717361 ?auto_717362 ) ) ( not ( = ?auto_717361 ?auto_717363 ) ) ( not ( = ?auto_717361 ?auto_717364 ) ) ( not ( = ?auto_717362 ?auto_717363 ) ) ( not ( = ?auto_717362 ?auto_717364 ) ) ( not ( = ?auto_717363 ?auto_717364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717363 ?auto_717364 )
      ( !STACK ?auto_717363 ?auto_717362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_717378 - BLOCK
      ?auto_717379 - BLOCK
      ?auto_717380 - BLOCK
      ?auto_717381 - BLOCK
    )
    :vars
    (
      ?auto_717382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717381 ?auto_717382 ) ( ON-TABLE ?auto_717378 ) ( ON ?auto_717379 ?auto_717378 ) ( not ( = ?auto_717378 ?auto_717379 ) ) ( not ( = ?auto_717378 ?auto_717380 ) ) ( not ( = ?auto_717378 ?auto_717381 ) ) ( not ( = ?auto_717378 ?auto_717382 ) ) ( not ( = ?auto_717379 ?auto_717380 ) ) ( not ( = ?auto_717379 ?auto_717381 ) ) ( not ( = ?auto_717379 ?auto_717382 ) ) ( not ( = ?auto_717380 ?auto_717381 ) ) ( not ( = ?auto_717380 ?auto_717382 ) ) ( not ( = ?auto_717381 ?auto_717382 ) ) ( CLEAR ?auto_717379 ) ( ON ?auto_717380 ?auto_717381 ) ( CLEAR ?auto_717380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_717378 ?auto_717379 ?auto_717380 )
      ( MAKE-4PILE ?auto_717378 ?auto_717379 ?auto_717380 ?auto_717381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_717396 - BLOCK
      ?auto_717397 - BLOCK
      ?auto_717398 - BLOCK
      ?auto_717399 - BLOCK
    )
    :vars
    (
      ?auto_717400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717399 ?auto_717400 ) ( ON-TABLE ?auto_717396 ) ( not ( = ?auto_717396 ?auto_717397 ) ) ( not ( = ?auto_717396 ?auto_717398 ) ) ( not ( = ?auto_717396 ?auto_717399 ) ) ( not ( = ?auto_717396 ?auto_717400 ) ) ( not ( = ?auto_717397 ?auto_717398 ) ) ( not ( = ?auto_717397 ?auto_717399 ) ) ( not ( = ?auto_717397 ?auto_717400 ) ) ( not ( = ?auto_717398 ?auto_717399 ) ) ( not ( = ?auto_717398 ?auto_717400 ) ) ( not ( = ?auto_717399 ?auto_717400 ) ) ( ON ?auto_717398 ?auto_717399 ) ( CLEAR ?auto_717396 ) ( ON ?auto_717397 ?auto_717398 ) ( CLEAR ?auto_717397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_717396 ?auto_717397 )
      ( MAKE-4PILE ?auto_717396 ?auto_717397 ?auto_717398 ?auto_717399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_717414 - BLOCK
      ?auto_717415 - BLOCK
      ?auto_717416 - BLOCK
      ?auto_717417 - BLOCK
    )
    :vars
    (
      ?auto_717418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717417 ?auto_717418 ) ( not ( = ?auto_717414 ?auto_717415 ) ) ( not ( = ?auto_717414 ?auto_717416 ) ) ( not ( = ?auto_717414 ?auto_717417 ) ) ( not ( = ?auto_717414 ?auto_717418 ) ) ( not ( = ?auto_717415 ?auto_717416 ) ) ( not ( = ?auto_717415 ?auto_717417 ) ) ( not ( = ?auto_717415 ?auto_717418 ) ) ( not ( = ?auto_717416 ?auto_717417 ) ) ( not ( = ?auto_717416 ?auto_717418 ) ) ( not ( = ?auto_717417 ?auto_717418 ) ) ( ON ?auto_717416 ?auto_717417 ) ( ON ?auto_717415 ?auto_717416 ) ( ON ?auto_717414 ?auto_717415 ) ( CLEAR ?auto_717414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717414 )
      ( MAKE-4PILE ?auto_717414 ?auto_717415 ?auto_717416 ?auto_717417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_717433 - BLOCK
      ?auto_717434 - BLOCK
      ?auto_717435 - BLOCK
      ?auto_717436 - BLOCK
      ?auto_717437 - BLOCK
    )
    :vars
    (
      ?auto_717438 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_717436 ) ( ON ?auto_717437 ?auto_717438 ) ( CLEAR ?auto_717437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_717433 ) ( ON ?auto_717434 ?auto_717433 ) ( ON ?auto_717435 ?auto_717434 ) ( ON ?auto_717436 ?auto_717435 ) ( not ( = ?auto_717433 ?auto_717434 ) ) ( not ( = ?auto_717433 ?auto_717435 ) ) ( not ( = ?auto_717433 ?auto_717436 ) ) ( not ( = ?auto_717433 ?auto_717437 ) ) ( not ( = ?auto_717433 ?auto_717438 ) ) ( not ( = ?auto_717434 ?auto_717435 ) ) ( not ( = ?auto_717434 ?auto_717436 ) ) ( not ( = ?auto_717434 ?auto_717437 ) ) ( not ( = ?auto_717434 ?auto_717438 ) ) ( not ( = ?auto_717435 ?auto_717436 ) ) ( not ( = ?auto_717435 ?auto_717437 ) ) ( not ( = ?auto_717435 ?auto_717438 ) ) ( not ( = ?auto_717436 ?auto_717437 ) ) ( not ( = ?auto_717436 ?auto_717438 ) ) ( not ( = ?auto_717437 ?auto_717438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717437 ?auto_717438 )
      ( !STACK ?auto_717437 ?auto_717436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_717455 - BLOCK
      ?auto_717456 - BLOCK
      ?auto_717457 - BLOCK
      ?auto_717458 - BLOCK
      ?auto_717459 - BLOCK
    )
    :vars
    (
      ?auto_717460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717459 ?auto_717460 ) ( ON-TABLE ?auto_717455 ) ( ON ?auto_717456 ?auto_717455 ) ( ON ?auto_717457 ?auto_717456 ) ( not ( = ?auto_717455 ?auto_717456 ) ) ( not ( = ?auto_717455 ?auto_717457 ) ) ( not ( = ?auto_717455 ?auto_717458 ) ) ( not ( = ?auto_717455 ?auto_717459 ) ) ( not ( = ?auto_717455 ?auto_717460 ) ) ( not ( = ?auto_717456 ?auto_717457 ) ) ( not ( = ?auto_717456 ?auto_717458 ) ) ( not ( = ?auto_717456 ?auto_717459 ) ) ( not ( = ?auto_717456 ?auto_717460 ) ) ( not ( = ?auto_717457 ?auto_717458 ) ) ( not ( = ?auto_717457 ?auto_717459 ) ) ( not ( = ?auto_717457 ?auto_717460 ) ) ( not ( = ?auto_717458 ?auto_717459 ) ) ( not ( = ?auto_717458 ?auto_717460 ) ) ( not ( = ?auto_717459 ?auto_717460 ) ) ( CLEAR ?auto_717457 ) ( ON ?auto_717458 ?auto_717459 ) ( CLEAR ?auto_717458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_717455 ?auto_717456 ?auto_717457 ?auto_717458 )
      ( MAKE-5PILE ?auto_717455 ?auto_717456 ?auto_717457 ?auto_717458 ?auto_717459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_717477 - BLOCK
      ?auto_717478 - BLOCK
      ?auto_717479 - BLOCK
      ?auto_717480 - BLOCK
      ?auto_717481 - BLOCK
    )
    :vars
    (
      ?auto_717482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717481 ?auto_717482 ) ( ON-TABLE ?auto_717477 ) ( ON ?auto_717478 ?auto_717477 ) ( not ( = ?auto_717477 ?auto_717478 ) ) ( not ( = ?auto_717477 ?auto_717479 ) ) ( not ( = ?auto_717477 ?auto_717480 ) ) ( not ( = ?auto_717477 ?auto_717481 ) ) ( not ( = ?auto_717477 ?auto_717482 ) ) ( not ( = ?auto_717478 ?auto_717479 ) ) ( not ( = ?auto_717478 ?auto_717480 ) ) ( not ( = ?auto_717478 ?auto_717481 ) ) ( not ( = ?auto_717478 ?auto_717482 ) ) ( not ( = ?auto_717479 ?auto_717480 ) ) ( not ( = ?auto_717479 ?auto_717481 ) ) ( not ( = ?auto_717479 ?auto_717482 ) ) ( not ( = ?auto_717480 ?auto_717481 ) ) ( not ( = ?auto_717480 ?auto_717482 ) ) ( not ( = ?auto_717481 ?auto_717482 ) ) ( ON ?auto_717480 ?auto_717481 ) ( CLEAR ?auto_717478 ) ( ON ?auto_717479 ?auto_717480 ) ( CLEAR ?auto_717479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_717477 ?auto_717478 ?auto_717479 )
      ( MAKE-5PILE ?auto_717477 ?auto_717478 ?auto_717479 ?auto_717480 ?auto_717481 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_717499 - BLOCK
      ?auto_717500 - BLOCK
      ?auto_717501 - BLOCK
      ?auto_717502 - BLOCK
      ?auto_717503 - BLOCK
    )
    :vars
    (
      ?auto_717504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717503 ?auto_717504 ) ( ON-TABLE ?auto_717499 ) ( not ( = ?auto_717499 ?auto_717500 ) ) ( not ( = ?auto_717499 ?auto_717501 ) ) ( not ( = ?auto_717499 ?auto_717502 ) ) ( not ( = ?auto_717499 ?auto_717503 ) ) ( not ( = ?auto_717499 ?auto_717504 ) ) ( not ( = ?auto_717500 ?auto_717501 ) ) ( not ( = ?auto_717500 ?auto_717502 ) ) ( not ( = ?auto_717500 ?auto_717503 ) ) ( not ( = ?auto_717500 ?auto_717504 ) ) ( not ( = ?auto_717501 ?auto_717502 ) ) ( not ( = ?auto_717501 ?auto_717503 ) ) ( not ( = ?auto_717501 ?auto_717504 ) ) ( not ( = ?auto_717502 ?auto_717503 ) ) ( not ( = ?auto_717502 ?auto_717504 ) ) ( not ( = ?auto_717503 ?auto_717504 ) ) ( ON ?auto_717502 ?auto_717503 ) ( ON ?auto_717501 ?auto_717502 ) ( CLEAR ?auto_717499 ) ( ON ?auto_717500 ?auto_717501 ) ( CLEAR ?auto_717500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_717499 ?auto_717500 )
      ( MAKE-5PILE ?auto_717499 ?auto_717500 ?auto_717501 ?auto_717502 ?auto_717503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_717521 - BLOCK
      ?auto_717522 - BLOCK
      ?auto_717523 - BLOCK
      ?auto_717524 - BLOCK
      ?auto_717525 - BLOCK
    )
    :vars
    (
      ?auto_717526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717525 ?auto_717526 ) ( not ( = ?auto_717521 ?auto_717522 ) ) ( not ( = ?auto_717521 ?auto_717523 ) ) ( not ( = ?auto_717521 ?auto_717524 ) ) ( not ( = ?auto_717521 ?auto_717525 ) ) ( not ( = ?auto_717521 ?auto_717526 ) ) ( not ( = ?auto_717522 ?auto_717523 ) ) ( not ( = ?auto_717522 ?auto_717524 ) ) ( not ( = ?auto_717522 ?auto_717525 ) ) ( not ( = ?auto_717522 ?auto_717526 ) ) ( not ( = ?auto_717523 ?auto_717524 ) ) ( not ( = ?auto_717523 ?auto_717525 ) ) ( not ( = ?auto_717523 ?auto_717526 ) ) ( not ( = ?auto_717524 ?auto_717525 ) ) ( not ( = ?auto_717524 ?auto_717526 ) ) ( not ( = ?auto_717525 ?auto_717526 ) ) ( ON ?auto_717524 ?auto_717525 ) ( ON ?auto_717523 ?auto_717524 ) ( ON ?auto_717522 ?auto_717523 ) ( ON ?auto_717521 ?auto_717522 ) ( CLEAR ?auto_717521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717521 )
      ( MAKE-5PILE ?auto_717521 ?auto_717522 ?auto_717523 ?auto_717524 ?auto_717525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_717544 - BLOCK
      ?auto_717545 - BLOCK
      ?auto_717546 - BLOCK
      ?auto_717547 - BLOCK
      ?auto_717548 - BLOCK
      ?auto_717549 - BLOCK
    )
    :vars
    (
      ?auto_717550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_717548 ) ( ON ?auto_717549 ?auto_717550 ) ( CLEAR ?auto_717549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_717544 ) ( ON ?auto_717545 ?auto_717544 ) ( ON ?auto_717546 ?auto_717545 ) ( ON ?auto_717547 ?auto_717546 ) ( ON ?auto_717548 ?auto_717547 ) ( not ( = ?auto_717544 ?auto_717545 ) ) ( not ( = ?auto_717544 ?auto_717546 ) ) ( not ( = ?auto_717544 ?auto_717547 ) ) ( not ( = ?auto_717544 ?auto_717548 ) ) ( not ( = ?auto_717544 ?auto_717549 ) ) ( not ( = ?auto_717544 ?auto_717550 ) ) ( not ( = ?auto_717545 ?auto_717546 ) ) ( not ( = ?auto_717545 ?auto_717547 ) ) ( not ( = ?auto_717545 ?auto_717548 ) ) ( not ( = ?auto_717545 ?auto_717549 ) ) ( not ( = ?auto_717545 ?auto_717550 ) ) ( not ( = ?auto_717546 ?auto_717547 ) ) ( not ( = ?auto_717546 ?auto_717548 ) ) ( not ( = ?auto_717546 ?auto_717549 ) ) ( not ( = ?auto_717546 ?auto_717550 ) ) ( not ( = ?auto_717547 ?auto_717548 ) ) ( not ( = ?auto_717547 ?auto_717549 ) ) ( not ( = ?auto_717547 ?auto_717550 ) ) ( not ( = ?auto_717548 ?auto_717549 ) ) ( not ( = ?auto_717548 ?auto_717550 ) ) ( not ( = ?auto_717549 ?auto_717550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717549 ?auto_717550 )
      ( !STACK ?auto_717549 ?auto_717548 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_717570 - BLOCK
      ?auto_717571 - BLOCK
      ?auto_717572 - BLOCK
      ?auto_717573 - BLOCK
      ?auto_717574 - BLOCK
      ?auto_717575 - BLOCK
    )
    :vars
    (
      ?auto_717576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717575 ?auto_717576 ) ( ON-TABLE ?auto_717570 ) ( ON ?auto_717571 ?auto_717570 ) ( ON ?auto_717572 ?auto_717571 ) ( ON ?auto_717573 ?auto_717572 ) ( not ( = ?auto_717570 ?auto_717571 ) ) ( not ( = ?auto_717570 ?auto_717572 ) ) ( not ( = ?auto_717570 ?auto_717573 ) ) ( not ( = ?auto_717570 ?auto_717574 ) ) ( not ( = ?auto_717570 ?auto_717575 ) ) ( not ( = ?auto_717570 ?auto_717576 ) ) ( not ( = ?auto_717571 ?auto_717572 ) ) ( not ( = ?auto_717571 ?auto_717573 ) ) ( not ( = ?auto_717571 ?auto_717574 ) ) ( not ( = ?auto_717571 ?auto_717575 ) ) ( not ( = ?auto_717571 ?auto_717576 ) ) ( not ( = ?auto_717572 ?auto_717573 ) ) ( not ( = ?auto_717572 ?auto_717574 ) ) ( not ( = ?auto_717572 ?auto_717575 ) ) ( not ( = ?auto_717572 ?auto_717576 ) ) ( not ( = ?auto_717573 ?auto_717574 ) ) ( not ( = ?auto_717573 ?auto_717575 ) ) ( not ( = ?auto_717573 ?auto_717576 ) ) ( not ( = ?auto_717574 ?auto_717575 ) ) ( not ( = ?auto_717574 ?auto_717576 ) ) ( not ( = ?auto_717575 ?auto_717576 ) ) ( CLEAR ?auto_717573 ) ( ON ?auto_717574 ?auto_717575 ) ( CLEAR ?auto_717574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_717570 ?auto_717571 ?auto_717572 ?auto_717573 ?auto_717574 )
      ( MAKE-6PILE ?auto_717570 ?auto_717571 ?auto_717572 ?auto_717573 ?auto_717574 ?auto_717575 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_717596 - BLOCK
      ?auto_717597 - BLOCK
      ?auto_717598 - BLOCK
      ?auto_717599 - BLOCK
      ?auto_717600 - BLOCK
      ?auto_717601 - BLOCK
    )
    :vars
    (
      ?auto_717602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717601 ?auto_717602 ) ( ON-TABLE ?auto_717596 ) ( ON ?auto_717597 ?auto_717596 ) ( ON ?auto_717598 ?auto_717597 ) ( not ( = ?auto_717596 ?auto_717597 ) ) ( not ( = ?auto_717596 ?auto_717598 ) ) ( not ( = ?auto_717596 ?auto_717599 ) ) ( not ( = ?auto_717596 ?auto_717600 ) ) ( not ( = ?auto_717596 ?auto_717601 ) ) ( not ( = ?auto_717596 ?auto_717602 ) ) ( not ( = ?auto_717597 ?auto_717598 ) ) ( not ( = ?auto_717597 ?auto_717599 ) ) ( not ( = ?auto_717597 ?auto_717600 ) ) ( not ( = ?auto_717597 ?auto_717601 ) ) ( not ( = ?auto_717597 ?auto_717602 ) ) ( not ( = ?auto_717598 ?auto_717599 ) ) ( not ( = ?auto_717598 ?auto_717600 ) ) ( not ( = ?auto_717598 ?auto_717601 ) ) ( not ( = ?auto_717598 ?auto_717602 ) ) ( not ( = ?auto_717599 ?auto_717600 ) ) ( not ( = ?auto_717599 ?auto_717601 ) ) ( not ( = ?auto_717599 ?auto_717602 ) ) ( not ( = ?auto_717600 ?auto_717601 ) ) ( not ( = ?auto_717600 ?auto_717602 ) ) ( not ( = ?auto_717601 ?auto_717602 ) ) ( ON ?auto_717600 ?auto_717601 ) ( CLEAR ?auto_717598 ) ( ON ?auto_717599 ?auto_717600 ) ( CLEAR ?auto_717599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_717596 ?auto_717597 ?auto_717598 ?auto_717599 )
      ( MAKE-6PILE ?auto_717596 ?auto_717597 ?auto_717598 ?auto_717599 ?auto_717600 ?auto_717601 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_717622 - BLOCK
      ?auto_717623 - BLOCK
      ?auto_717624 - BLOCK
      ?auto_717625 - BLOCK
      ?auto_717626 - BLOCK
      ?auto_717627 - BLOCK
    )
    :vars
    (
      ?auto_717628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717627 ?auto_717628 ) ( ON-TABLE ?auto_717622 ) ( ON ?auto_717623 ?auto_717622 ) ( not ( = ?auto_717622 ?auto_717623 ) ) ( not ( = ?auto_717622 ?auto_717624 ) ) ( not ( = ?auto_717622 ?auto_717625 ) ) ( not ( = ?auto_717622 ?auto_717626 ) ) ( not ( = ?auto_717622 ?auto_717627 ) ) ( not ( = ?auto_717622 ?auto_717628 ) ) ( not ( = ?auto_717623 ?auto_717624 ) ) ( not ( = ?auto_717623 ?auto_717625 ) ) ( not ( = ?auto_717623 ?auto_717626 ) ) ( not ( = ?auto_717623 ?auto_717627 ) ) ( not ( = ?auto_717623 ?auto_717628 ) ) ( not ( = ?auto_717624 ?auto_717625 ) ) ( not ( = ?auto_717624 ?auto_717626 ) ) ( not ( = ?auto_717624 ?auto_717627 ) ) ( not ( = ?auto_717624 ?auto_717628 ) ) ( not ( = ?auto_717625 ?auto_717626 ) ) ( not ( = ?auto_717625 ?auto_717627 ) ) ( not ( = ?auto_717625 ?auto_717628 ) ) ( not ( = ?auto_717626 ?auto_717627 ) ) ( not ( = ?auto_717626 ?auto_717628 ) ) ( not ( = ?auto_717627 ?auto_717628 ) ) ( ON ?auto_717626 ?auto_717627 ) ( ON ?auto_717625 ?auto_717626 ) ( CLEAR ?auto_717623 ) ( ON ?auto_717624 ?auto_717625 ) ( CLEAR ?auto_717624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_717622 ?auto_717623 ?auto_717624 )
      ( MAKE-6PILE ?auto_717622 ?auto_717623 ?auto_717624 ?auto_717625 ?auto_717626 ?auto_717627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_717648 - BLOCK
      ?auto_717649 - BLOCK
      ?auto_717650 - BLOCK
      ?auto_717651 - BLOCK
      ?auto_717652 - BLOCK
      ?auto_717653 - BLOCK
    )
    :vars
    (
      ?auto_717654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717653 ?auto_717654 ) ( ON-TABLE ?auto_717648 ) ( not ( = ?auto_717648 ?auto_717649 ) ) ( not ( = ?auto_717648 ?auto_717650 ) ) ( not ( = ?auto_717648 ?auto_717651 ) ) ( not ( = ?auto_717648 ?auto_717652 ) ) ( not ( = ?auto_717648 ?auto_717653 ) ) ( not ( = ?auto_717648 ?auto_717654 ) ) ( not ( = ?auto_717649 ?auto_717650 ) ) ( not ( = ?auto_717649 ?auto_717651 ) ) ( not ( = ?auto_717649 ?auto_717652 ) ) ( not ( = ?auto_717649 ?auto_717653 ) ) ( not ( = ?auto_717649 ?auto_717654 ) ) ( not ( = ?auto_717650 ?auto_717651 ) ) ( not ( = ?auto_717650 ?auto_717652 ) ) ( not ( = ?auto_717650 ?auto_717653 ) ) ( not ( = ?auto_717650 ?auto_717654 ) ) ( not ( = ?auto_717651 ?auto_717652 ) ) ( not ( = ?auto_717651 ?auto_717653 ) ) ( not ( = ?auto_717651 ?auto_717654 ) ) ( not ( = ?auto_717652 ?auto_717653 ) ) ( not ( = ?auto_717652 ?auto_717654 ) ) ( not ( = ?auto_717653 ?auto_717654 ) ) ( ON ?auto_717652 ?auto_717653 ) ( ON ?auto_717651 ?auto_717652 ) ( ON ?auto_717650 ?auto_717651 ) ( CLEAR ?auto_717648 ) ( ON ?auto_717649 ?auto_717650 ) ( CLEAR ?auto_717649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_717648 ?auto_717649 )
      ( MAKE-6PILE ?auto_717648 ?auto_717649 ?auto_717650 ?auto_717651 ?auto_717652 ?auto_717653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_717674 - BLOCK
      ?auto_717675 - BLOCK
      ?auto_717676 - BLOCK
      ?auto_717677 - BLOCK
      ?auto_717678 - BLOCK
      ?auto_717679 - BLOCK
    )
    :vars
    (
      ?auto_717680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717679 ?auto_717680 ) ( not ( = ?auto_717674 ?auto_717675 ) ) ( not ( = ?auto_717674 ?auto_717676 ) ) ( not ( = ?auto_717674 ?auto_717677 ) ) ( not ( = ?auto_717674 ?auto_717678 ) ) ( not ( = ?auto_717674 ?auto_717679 ) ) ( not ( = ?auto_717674 ?auto_717680 ) ) ( not ( = ?auto_717675 ?auto_717676 ) ) ( not ( = ?auto_717675 ?auto_717677 ) ) ( not ( = ?auto_717675 ?auto_717678 ) ) ( not ( = ?auto_717675 ?auto_717679 ) ) ( not ( = ?auto_717675 ?auto_717680 ) ) ( not ( = ?auto_717676 ?auto_717677 ) ) ( not ( = ?auto_717676 ?auto_717678 ) ) ( not ( = ?auto_717676 ?auto_717679 ) ) ( not ( = ?auto_717676 ?auto_717680 ) ) ( not ( = ?auto_717677 ?auto_717678 ) ) ( not ( = ?auto_717677 ?auto_717679 ) ) ( not ( = ?auto_717677 ?auto_717680 ) ) ( not ( = ?auto_717678 ?auto_717679 ) ) ( not ( = ?auto_717678 ?auto_717680 ) ) ( not ( = ?auto_717679 ?auto_717680 ) ) ( ON ?auto_717678 ?auto_717679 ) ( ON ?auto_717677 ?auto_717678 ) ( ON ?auto_717676 ?auto_717677 ) ( ON ?auto_717675 ?auto_717676 ) ( ON ?auto_717674 ?auto_717675 ) ( CLEAR ?auto_717674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717674 )
      ( MAKE-6PILE ?auto_717674 ?auto_717675 ?auto_717676 ?auto_717677 ?auto_717678 ?auto_717679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_717701 - BLOCK
      ?auto_717702 - BLOCK
      ?auto_717703 - BLOCK
      ?auto_717704 - BLOCK
      ?auto_717705 - BLOCK
      ?auto_717706 - BLOCK
      ?auto_717707 - BLOCK
    )
    :vars
    (
      ?auto_717708 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_717706 ) ( ON ?auto_717707 ?auto_717708 ) ( CLEAR ?auto_717707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_717701 ) ( ON ?auto_717702 ?auto_717701 ) ( ON ?auto_717703 ?auto_717702 ) ( ON ?auto_717704 ?auto_717703 ) ( ON ?auto_717705 ?auto_717704 ) ( ON ?auto_717706 ?auto_717705 ) ( not ( = ?auto_717701 ?auto_717702 ) ) ( not ( = ?auto_717701 ?auto_717703 ) ) ( not ( = ?auto_717701 ?auto_717704 ) ) ( not ( = ?auto_717701 ?auto_717705 ) ) ( not ( = ?auto_717701 ?auto_717706 ) ) ( not ( = ?auto_717701 ?auto_717707 ) ) ( not ( = ?auto_717701 ?auto_717708 ) ) ( not ( = ?auto_717702 ?auto_717703 ) ) ( not ( = ?auto_717702 ?auto_717704 ) ) ( not ( = ?auto_717702 ?auto_717705 ) ) ( not ( = ?auto_717702 ?auto_717706 ) ) ( not ( = ?auto_717702 ?auto_717707 ) ) ( not ( = ?auto_717702 ?auto_717708 ) ) ( not ( = ?auto_717703 ?auto_717704 ) ) ( not ( = ?auto_717703 ?auto_717705 ) ) ( not ( = ?auto_717703 ?auto_717706 ) ) ( not ( = ?auto_717703 ?auto_717707 ) ) ( not ( = ?auto_717703 ?auto_717708 ) ) ( not ( = ?auto_717704 ?auto_717705 ) ) ( not ( = ?auto_717704 ?auto_717706 ) ) ( not ( = ?auto_717704 ?auto_717707 ) ) ( not ( = ?auto_717704 ?auto_717708 ) ) ( not ( = ?auto_717705 ?auto_717706 ) ) ( not ( = ?auto_717705 ?auto_717707 ) ) ( not ( = ?auto_717705 ?auto_717708 ) ) ( not ( = ?auto_717706 ?auto_717707 ) ) ( not ( = ?auto_717706 ?auto_717708 ) ) ( not ( = ?auto_717707 ?auto_717708 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717707 ?auto_717708 )
      ( !STACK ?auto_717707 ?auto_717706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_717731 - BLOCK
      ?auto_717732 - BLOCK
      ?auto_717733 - BLOCK
      ?auto_717734 - BLOCK
      ?auto_717735 - BLOCK
      ?auto_717736 - BLOCK
      ?auto_717737 - BLOCK
    )
    :vars
    (
      ?auto_717738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717737 ?auto_717738 ) ( ON-TABLE ?auto_717731 ) ( ON ?auto_717732 ?auto_717731 ) ( ON ?auto_717733 ?auto_717732 ) ( ON ?auto_717734 ?auto_717733 ) ( ON ?auto_717735 ?auto_717734 ) ( not ( = ?auto_717731 ?auto_717732 ) ) ( not ( = ?auto_717731 ?auto_717733 ) ) ( not ( = ?auto_717731 ?auto_717734 ) ) ( not ( = ?auto_717731 ?auto_717735 ) ) ( not ( = ?auto_717731 ?auto_717736 ) ) ( not ( = ?auto_717731 ?auto_717737 ) ) ( not ( = ?auto_717731 ?auto_717738 ) ) ( not ( = ?auto_717732 ?auto_717733 ) ) ( not ( = ?auto_717732 ?auto_717734 ) ) ( not ( = ?auto_717732 ?auto_717735 ) ) ( not ( = ?auto_717732 ?auto_717736 ) ) ( not ( = ?auto_717732 ?auto_717737 ) ) ( not ( = ?auto_717732 ?auto_717738 ) ) ( not ( = ?auto_717733 ?auto_717734 ) ) ( not ( = ?auto_717733 ?auto_717735 ) ) ( not ( = ?auto_717733 ?auto_717736 ) ) ( not ( = ?auto_717733 ?auto_717737 ) ) ( not ( = ?auto_717733 ?auto_717738 ) ) ( not ( = ?auto_717734 ?auto_717735 ) ) ( not ( = ?auto_717734 ?auto_717736 ) ) ( not ( = ?auto_717734 ?auto_717737 ) ) ( not ( = ?auto_717734 ?auto_717738 ) ) ( not ( = ?auto_717735 ?auto_717736 ) ) ( not ( = ?auto_717735 ?auto_717737 ) ) ( not ( = ?auto_717735 ?auto_717738 ) ) ( not ( = ?auto_717736 ?auto_717737 ) ) ( not ( = ?auto_717736 ?auto_717738 ) ) ( not ( = ?auto_717737 ?auto_717738 ) ) ( CLEAR ?auto_717735 ) ( ON ?auto_717736 ?auto_717737 ) ( CLEAR ?auto_717736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_717731 ?auto_717732 ?auto_717733 ?auto_717734 ?auto_717735 ?auto_717736 )
      ( MAKE-7PILE ?auto_717731 ?auto_717732 ?auto_717733 ?auto_717734 ?auto_717735 ?auto_717736 ?auto_717737 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_717761 - BLOCK
      ?auto_717762 - BLOCK
      ?auto_717763 - BLOCK
      ?auto_717764 - BLOCK
      ?auto_717765 - BLOCK
      ?auto_717766 - BLOCK
      ?auto_717767 - BLOCK
    )
    :vars
    (
      ?auto_717768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717767 ?auto_717768 ) ( ON-TABLE ?auto_717761 ) ( ON ?auto_717762 ?auto_717761 ) ( ON ?auto_717763 ?auto_717762 ) ( ON ?auto_717764 ?auto_717763 ) ( not ( = ?auto_717761 ?auto_717762 ) ) ( not ( = ?auto_717761 ?auto_717763 ) ) ( not ( = ?auto_717761 ?auto_717764 ) ) ( not ( = ?auto_717761 ?auto_717765 ) ) ( not ( = ?auto_717761 ?auto_717766 ) ) ( not ( = ?auto_717761 ?auto_717767 ) ) ( not ( = ?auto_717761 ?auto_717768 ) ) ( not ( = ?auto_717762 ?auto_717763 ) ) ( not ( = ?auto_717762 ?auto_717764 ) ) ( not ( = ?auto_717762 ?auto_717765 ) ) ( not ( = ?auto_717762 ?auto_717766 ) ) ( not ( = ?auto_717762 ?auto_717767 ) ) ( not ( = ?auto_717762 ?auto_717768 ) ) ( not ( = ?auto_717763 ?auto_717764 ) ) ( not ( = ?auto_717763 ?auto_717765 ) ) ( not ( = ?auto_717763 ?auto_717766 ) ) ( not ( = ?auto_717763 ?auto_717767 ) ) ( not ( = ?auto_717763 ?auto_717768 ) ) ( not ( = ?auto_717764 ?auto_717765 ) ) ( not ( = ?auto_717764 ?auto_717766 ) ) ( not ( = ?auto_717764 ?auto_717767 ) ) ( not ( = ?auto_717764 ?auto_717768 ) ) ( not ( = ?auto_717765 ?auto_717766 ) ) ( not ( = ?auto_717765 ?auto_717767 ) ) ( not ( = ?auto_717765 ?auto_717768 ) ) ( not ( = ?auto_717766 ?auto_717767 ) ) ( not ( = ?auto_717766 ?auto_717768 ) ) ( not ( = ?auto_717767 ?auto_717768 ) ) ( ON ?auto_717766 ?auto_717767 ) ( CLEAR ?auto_717764 ) ( ON ?auto_717765 ?auto_717766 ) ( CLEAR ?auto_717765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_717761 ?auto_717762 ?auto_717763 ?auto_717764 ?auto_717765 )
      ( MAKE-7PILE ?auto_717761 ?auto_717762 ?auto_717763 ?auto_717764 ?auto_717765 ?auto_717766 ?auto_717767 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_717791 - BLOCK
      ?auto_717792 - BLOCK
      ?auto_717793 - BLOCK
      ?auto_717794 - BLOCK
      ?auto_717795 - BLOCK
      ?auto_717796 - BLOCK
      ?auto_717797 - BLOCK
    )
    :vars
    (
      ?auto_717798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717797 ?auto_717798 ) ( ON-TABLE ?auto_717791 ) ( ON ?auto_717792 ?auto_717791 ) ( ON ?auto_717793 ?auto_717792 ) ( not ( = ?auto_717791 ?auto_717792 ) ) ( not ( = ?auto_717791 ?auto_717793 ) ) ( not ( = ?auto_717791 ?auto_717794 ) ) ( not ( = ?auto_717791 ?auto_717795 ) ) ( not ( = ?auto_717791 ?auto_717796 ) ) ( not ( = ?auto_717791 ?auto_717797 ) ) ( not ( = ?auto_717791 ?auto_717798 ) ) ( not ( = ?auto_717792 ?auto_717793 ) ) ( not ( = ?auto_717792 ?auto_717794 ) ) ( not ( = ?auto_717792 ?auto_717795 ) ) ( not ( = ?auto_717792 ?auto_717796 ) ) ( not ( = ?auto_717792 ?auto_717797 ) ) ( not ( = ?auto_717792 ?auto_717798 ) ) ( not ( = ?auto_717793 ?auto_717794 ) ) ( not ( = ?auto_717793 ?auto_717795 ) ) ( not ( = ?auto_717793 ?auto_717796 ) ) ( not ( = ?auto_717793 ?auto_717797 ) ) ( not ( = ?auto_717793 ?auto_717798 ) ) ( not ( = ?auto_717794 ?auto_717795 ) ) ( not ( = ?auto_717794 ?auto_717796 ) ) ( not ( = ?auto_717794 ?auto_717797 ) ) ( not ( = ?auto_717794 ?auto_717798 ) ) ( not ( = ?auto_717795 ?auto_717796 ) ) ( not ( = ?auto_717795 ?auto_717797 ) ) ( not ( = ?auto_717795 ?auto_717798 ) ) ( not ( = ?auto_717796 ?auto_717797 ) ) ( not ( = ?auto_717796 ?auto_717798 ) ) ( not ( = ?auto_717797 ?auto_717798 ) ) ( ON ?auto_717796 ?auto_717797 ) ( ON ?auto_717795 ?auto_717796 ) ( CLEAR ?auto_717793 ) ( ON ?auto_717794 ?auto_717795 ) ( CLEAR ?auto_717794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_717791 ?auto_717792 ?auto_717793 ?auto_717794 )
      ( MAKE-7PILE ?auto_717791 ?auto_717792 ?auto_717793 ?auto_717794 ?auto_717795 ?auto_717796 ?auto_717797 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_717821 - BLOCK
      ?auto_717822 - BLOCK
      ?auto_717823 - BLOCK
      ?auto_717824 - BLOCK
      ?auto_717825 - BLOCK
      ?auto_717826 - BLOCK
      ?auto_717827 - BLOCK
    )
    :vars
    (
      ?auto_717828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717827 ?auto_717828 ) ( ON-TABLE ?auto_717821 ) ( ON ?auto_717822 ?auto_717821 ) ( not ( = ?auto_717821 ?auto_717822 ) ) ( not ( = ?auto_717821 ?auto_717823 ) ) ( not ( = ?auto_717821 ?auto_717824 ) ) ( not ( = ?auto_717821 ?auto_717825 ) ) ( not ( = ?auto_717821 ?auto_717826 ) ) ( not ( = ?auto_717821 ?auto_717827 ) ) ( not ( = ?auto_717821 ?auto_717828 ) ) ( not ( = ?auto_717822 ?auto_717823 ) ) ( not ( = ?auto_717822 ?auto_717824 ) ) ( not ( = ?auto_717822 ?auto_717825 ) ) ( not ( = ?auto_717822 ?auto_717826 ) ) ( not ( = ?auto_717822 ?auto_717827 ) ) ( not ( = ?auto_717822 ?auto_717828 ) ) ( not ( = ?auto_717823 ?auto_717824 ) ) ( not ( = ?auto_717823 ?auto_717825 ) ) ( not ( = ?auto_717823 ?auto_717826 ) ) ( not ( = ?auto_717823 ?auto_717827 ) ) ( not ( = ?auto_717823 ?auto_717828 ) ) ( not ( = ?auto_717824 ?auto_717825 ) ) ( not ( = ?auto_717824 ?auto_717826 ) ) ( not ( = ?auto_717824 ?auto_717827 ) ) ( not ( = ?auto_717824 ?auto_717828 ) ) ( not ( = ?auto_717825 ?auto_717826 ) ) ( not ( = ?auto_717825 ?auto_717827 ) ) ( not ( = ?auto_717825 ?auto_717828 ) ) ( not ( = ?auto_717826 ?auto_717827 ) ) ( not ( = ?auto_717826 ?auto_717828 ) ) ( not ( = ?auto_717827 ?auto_717828 ) ) ( ON ?auto_717826 ?auto_717827 ) ( ON ?auto_717825 ?auto_717826 ) ( ON ?auto_717824 ?auto_717825 ) ( CLEAR ?auto_717822 ) ( ON ?auto_717823 ?auto_717824 ) ( CLEAR ?auto_717823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_717821 ?auto_717822 ?auto_717823 )
      ( MAKE-7PILE ?auto_717821 ?auto_717822 ?auto_717823 ?auto_717824 ?auto_717825 ?auto_717826 ?auto_717827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_717851 - BLOCK
      ?auto_717852 - BLOCK
      ?auto_717853 - BLOCK
      ?auto_717854 - BLOCK
      ?auto_717855 - BLOCK
      ?auto_717856 - BLOCK
      ?auto_717857 - BLOCK
    )
    :vars
    (
      ?auto_717858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717857 ?auto_717858 ) ( ON-TABLE ?auto_717851 ) ( not ( = ?auto_717851 ?auto_717852 ) ) ( not ( = ?auto_717851 ?auto_717853 ) ) ( not ( = ?auto_717851 ?auto_717854 ) ) ( not ( = ?auto_717851 ?auto_717855 ) ) ( not ( = ?auto_717851 ?auto_717856 ) ) ( not ( = ?auto_717851 ?auto_717857 ) ) ( not ( = ?auto_717851 ?auto_717858 ) ) ( not ( = ?auto_717852 ?auto_717853 ) ) ( not ( = ?auto_717852 ?auto_717854 ) ) ( not ( = ?auto_717852 ?auto_717855 ) ) ( not ( = ?auto_717852 ?auto_717856 ) ) ( not ( = ?auto_717852 ?auto_717857 ) ) ( not ( = ?auto_717852 ?auto_717858 ) ) ( not ( = ?auto_717853 ?auto_717854 ) ) ( not ( = ?auto_717853 ?auto_717855 ) ) ( not ( = ?auto_717853 ?auto_717856 ) ) ( not ( = ?auto_717853 ?auto_717857 ) ) ( not ( = ?auto_717853 ?auto_717858 ) ) ( not ( = ?auto_717854 ?auto_717855 ) ) ( not ( = ?auto_717854 ?auto_717856 ) ) ( not ( = ?auto_717854 ?auto_717857 ) ) ( not ( = ?auto_717854 ?auto_717858 ) ) ( not ( = ?auto_717855 ?auto_717856 ) ) ( not ( = ?auto_717855 ?auto_717857 ) ) ( not ( = ?auto_717855 ?auto_717858 ) ) ( not ( = ?auto_717856 ?auto_717857 ) ) ( not ( = ?auto_717856 ?auto_717858 ) ) ( not ( = ?auto_717857 ?auto_717858 ) ) ( ON ?auto_717856 ?auto_717857 ) ( ON ?auto_717855 ?auto_717856 ) ( ON ?auto_717854 ?auto_717855 ) ( ON ?auto_717853 ?auto_717854 ) ( CLEAR ?auto_717851 ) ( ON ?auto_717852 ?auto_717853 ) ( CLEAR ?auto_717852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_717851 ?auto_717852 )
      ( MAKE-7PILE ?auto_717851 ?auto_717852 ?auto_717853 ?auto_717854 ?auto_717855 ?auto_717856 ?auto_717857 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_717881 - BLOCK
      ?auto_717882 - BLOCK
      ?auto_717883 - BLOCK
      ?auto_717884 - BLOCK
      ?auto_717885 - BLOCK
      ?auto_717886 - BLOCK
      ?auto_717887 - BLOCK
    )
    :vars
    (
      ?auto_717888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717887 ?auto_717888 ) ( not ( = ?auto_717881 ?auto_717882 ) ) ( not ( = ?auto_717881 ?auto_717883 ) ) ( not ( = ?auto_717881 ?auto_717884 ) ) ( not ( = ?auto_717881 ?auto_717885 ) ) ( not ( = ?auto_717881 ?auto_717886 ) ) ( not ( = ?auto_717881 ?auto_717887 ) ) ( not ( = ?auto_717881 ?auto_717888 ) ) ( not ( = ?auto_717882 ?auto_717883 ) ) ( not ( = ?auto_717882 ?auto_717884 ) ) ( not ( = ?auto_717882 ?auto_717885 ) ) ( not ( = ?auto_717882 ?auto_717886 ) ) ( not ( = ?auto_717882 ?auto_717887 ) ) ( not ( = ?auto_717882 ?auto_717888 ) ) ( not ( = ?auto_717883 ?auto_717884 ) ) ( not ( = ?auto_717883 ?auto_717885 ) ) ( not ( = ?auto_717883 ?auto_717886 ) ) ( not ( = ?auto_717883 ?auto_717887 ) ) ( not ( = ?auto_717883 ?auto_717888 ) ) ( not ( = ?auto_717884 ?auto_717885 ) ) ( not ( = ?auto_717884 ?auto_717886 ) ) ( not ( = ?auto_717884 ?auto_717887 ) ) ( not ( = ?auto_717884 ?auto_717888 ) ) ( not ( = ?auto_717885 ?auto_717886 ) ) ( not ( = ?auto_717885 ?auto_717887 ) ) ( not ( = ?auto_717885 ?auto_717888 ) ) ( not ( = ?auto_717886 ?auto_717887 ) ) ( not ( = ?auto_717886 ?auto_717888 ) ) ( not ( = ?auto_717887 ?auto_717888 ) ) ( ON ?auto_717886 ?auto_717887 ) ( ON ?auto_717885 ?auto_717886 ) ( ON ?auto_717884 ?auto_717885 ) ( ON ?auto_717883 ?auto_717884 ) ( ON ?auto_717882 ?auto_717883 ) ( ON ?auto_717881 ?auto_717882 ) ( CLEAR ?auto_717881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717881 )
      ( MAKE-7PILE ?auto_717881 ?auto_717882 ?auto_717883 ?auto_717884 ?auto_717885 ?auto_717886 ?auto_717887 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_717912 - BLOCK
      ?auto_717913 - BLOCK
      ?auto_717914 - BLOCK
      ?auto_717915 - BLOCK
      ?auto_717916 - BLOCK
      ?auto_717917 - BLOCK
      ?auto_717918 - BLOCK
      ?auto_717919 - BLOCK
    )
    :vars
    (
      ?auto_717920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_717918 ) ( ON ?auto_717919 ?auto_717920 ) ( CLEAR ?auto_717919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_717912 ) ( ON ?auto_717913 ?auto_717912 ) ( ON ?auto_717914 ?auto_717913 ) ( ON ?auto_717915 ?auto_717914 ) ( ON ?auto_717916 ?auto_717915 ) ( ON ?auto_717917 ?auto_717916 ) ( ON ?auto_717918 ?auto_717917 ) ( not ( = ?auto_717912 ?auto_717913 ) ) ( not ( = ?auto_717912 ?auto_717914 ) ) ( not ( = ?auto_717912 ?auto_717915 ) ) ( not ( = ?auto_717912 ?auto_717916 ) ) ( not ( = ?auto_717912 ?auto_717917 ) ) ( not ( = ?auto_717912 ?auto_717918 ) ) ( not ( = ?auto_717912 ?auto_717919 ) ) ( not ( = ?auto_717912 ?auto_717920 ) ) ( not ( = ?auto_717913 ?auto_717914 ) ) ( not ( = ?auto_717913 ?auto_717915 ) ) ( not ( = ?auto_717913 ?auto_717916 ) ) ( not ( = ?auto_717913 ?auto_717917 ) ) ( not ( = ?auto_717913 ?auto_717918 ) ) ( not ( = ?auto_717913 ?auto_717919 ) ) ( not ( = ?auto_717913 ?auto_717920 ) ) ( not ( = ?auto_717914 ?auto_717915 ) ) ( not ( = ?auto_717914 ?auto_717916 ) ) ( not ( = ?auto_717914 ?auto_717917 ) ) ( not ( = ?auto_717914 ?auto_717918 ) ) ( not ( = ?auto_717914 ?auto_717919 ) ) ( not ( = ?auto_717914 ?auto_717920 ) ) ( not ( = ?auto_717915 ?auto_717916 ) ) ( not ( = ?auto_717915 ?auto_717917 ) ) ( not ( = ?auto_717915 ?auto_717918 ) ) ( not ( = ?auto_717915 ?auto_717919 ) ) ( not ( = ?auto_717915 ?auto_717920 ) ) ( not ( = ?auto_717916 ?auto_717917 ) ) ( not ( = ?auto_717916 ?auto_717918 ) ) ( not ( = ?auto_717916 ?auto_717919 ) ) ( not ( = ?auto_717916 ?auto_717920 ) ) ( not ( = ?auto_717917 ?auto_717918 ) ) ( not ( = ?auto_717917 ?auto_717919 ) ) ( not ( = ?auto_717917 ?auto_717920 ) ) ( not ( = ?auto_717918 ?auto_717919 ) ) ( not ( = ?auto_717918 ?auto_717920 ) ) ( not ( = ?auto_717919 ?auto_717920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_717919 ?auto_717920 )
      ( !STACK ?auto_717919 ?auto_717918 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_717946 - BLOCK
      ?auto_717947 - BLOCK
      ?auto_717948 - BLOCK
      ?auto_717949 - BLOCK
      ?auto_717950 - BLOCK
      ?auto_717951 - BLOCK
      ?auto_717952 - BLOCK
      ?auto_717953 - BLOCK
    )
    :vars
    (
      ?auto_717954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717953 ?auto_717954 ) ( ON-TABLE ?auto_717946 ) ( ON ?auto_717947 ?auto_717946 ) ( ON ?auto_717948 ?auto_717947 ) ( ON ?auto_717949 ?auto_717948 ) ( ON ?auto_717950 ?auto_717949 ) ( ON ?auto_717951 ?auto_717950 ) ( not ( = ?auto_717946 ?auto_717947 ) ) ( not ( = ?auto_717946 ?auto_717948 ) ) ( not ( = ?auto_717946 ?auto_717949 ) ) ( not ( = ?auto_717946 ?auto_717950 ) ) ( not ( = ?auto_717946 ?auto_717951 ) ) ( not ( = ?auto_717946 ?auto_717952 ) ) ( not ( = ?auto_717946 ?auto_717953 ) ) ( not ( = ?auto_717946 ?auto_717954 ) ) ( not ( = ?auto_717947 ?auto_717948 ) ) ( not ( = ?auto_717947 ?auto_717949 ) ) ( not ( = ?auto_717947 ?auto_717950 ) ) ( not ( = ?auto_717947 ?auto_717951 ) ) ( not ( = ?auto_717947 ?auto_717952 ) ) ( not ( = ?auto_717947 ?auto_717953 ) ) ( not ( = ?auto_717947 ?auto_717954 ) ) ( not ( = ?auto_717948 ?auto_717949 ) ) ( not ( = ?auto_717948 ?auto_717950 ) ) ( not ( = ?auto_717948 ?auto_717951 ) ) ( not ( = ?auto_717948 ?auto_717952 ) ) ( not ( = ?auto_717948 ?auto_717953 ) ) ( not ( = ?auto_717948 ?auto_717954 ) ) ( not ( = ?auto_717949 ?auto_717950 ) ) ( not ( = ?auto_717949 ?auto_717951 ) ) ( not ( = ?auto_717949 ?auto_717952 ) ) ( not ( = ?auto_717949 ?auto_717953 ) ) ( not ( = ?auto_717949 ?auto_717954 ) ) ( not ( = ?auto_717950 ?auto_717951 ) ) ( not ( = ?auto_717950 ?auto_717952 ) ) ( not ( = ?auto_717950 ?auto_717953 ) ) ( not ( = ?auto_717950 ?auto_717954 ) ) ( not ( = ?auto_717951 ?auto_717952 ) ) ( not ( = ?auto_717951 ?auto_717953 ) ) ( not ( = ?auto_717951 ?auto_717954 ) ) ( not ( = ?auto_717952 ?auto_717953 ) ) ( not ( = ?auto_717952 ?auto_717954 ) ) ( not ( = ?auto_717953 ?auto_717954 ) ) ( CLEAR ?auto_717951 ) ( ON ?auto_717952 ?auto_717953 ) ( CLEAR ?auto_717952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_717946 ?auto_717947 ?auto_717948 ?auto_717949 ?auto_717950 ?auto_717951 ?auto_717952 )
      ( MAKE-8PILE ?auto_717946 ?auto_717947 ?auto_717948 ?auto_717949 ?auto_717950 ?auto_717951 ?auto_717952 ?auto_717953 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_717980 - BLOCK
      ?auto_717981 - BLOCK
      ?auto_717982 - BLOCK
      ?auto_717983 - BLOCK
      ?auto_717984 - BLOCK
      ?auto_717985 - BLOCK
      ?auto_717986 - BLOCK
      ?auto_717987 - BLOCK
    )
    :vars
    (
      ?auto_717988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717987 ?auto_717988 ) ( ON-TABLE ?auto_717980 ) ( ON ?auto_717981 ?auto_717980 ) ( ON ?auto_717982 ?auto_717981 ) ( ON ?auto_717983 ?auto_717982 ) ( ON ?auto_717984 ?auto_717983 ) ( not ( = ?auto_717980 ?auto_717981 ) ) ( not ( = ?auto_717980 ?auto_717982 ) ) ( not ( = ?auto_717980 ?auto_717983 ) ) ( not ( = ?auto_717980 ?auto_717984 ) ) ( not ( = ?auto_717980 ?auto_717985 ) ) ( not ( = ?auto_717980 ?auto_717986 ) ) ( not ( = ?auto_717980 ?auto_717987 ) ) ( not ( = ?auto_717980 ?auto_717988 ) ) ( not ( = ?auto_717981 ?auto_717982 ) ) ( not ( = ?auto_717981 ?auto_717983 ) ) ( not ( = ?auto_717981 ?auto_717984 ) ) ( not ( = ?auto_717981 ?auto_717985 ) ) ( not ( = ?auto_717981 ?auto_717986 ) ) ( not ( = ?auto_717981 ?auto_717987 ) ) ( not ( = ?auto_717981 ?auto_717988 ) ) ( not ( = ?auto_717982 ?auto_717983 ) ) ( not ( = ?auto_717982 ?auto_717984 ) ) ( not ( = ?auto_717982 ?auto_717985 ) ) ( not ( = ?auto_717982 ?auto_717986 ) ) ( not ( = ?auto_717982 ?auto_717987 ) ) ( not ( = ?auto_717982 ?auto_717988 ) ) ( not ( = ?auto_717983 ?auto_717984 ) ) ( not ( = ?auto_717983 ?auto_717985 ) ) ( not ( = ?auto_717983 ?auto_717986 ) ) ( not ( = ?auto_717983 ?auto_717987 ) ) ( not ( = ?auto_717983 ?auto_717988 ) ) ( not ( = ?auto_717984 ?auto_717985 ) ) ( not ( = ?auto_717984 ?auto_717986 ) ) ( not ( = ?auto_717984 ?auto_717987 ) ) ( not ( = ?auto_717984 ?auto_717988 ) ) ( not ( = ?auto_717985 ?auto_717986 ) ) ( not ( = ?auto_717985 ?auto_717987 ) ) ( not ( = ?auto_717985 ?auto_717988 ) ) ( not ( = ?auto_717986 ?auto_717987 ) ) ( not ( = ?auto_717986 ?auto_717988 ) ) ( not ( = ?auto_717987 ?auto_717988 ) ) ( ON ?auto_717986 ?auto_717987 ) ( CLEAR ?auto_717984 ) ( ON ?auto_717985 ?auto_717986 ) ( CLEAR ?auto_717985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_717980 ?auto_717981 ?auto_717982 ?auto_717983 ?auto_717984 ?auto_717985 )
      ( MAKE-8PILE ?auto_717980 ?auto_717981 ?auto_717982 ?auto_717983 ?auto_717984 ?auto_717985 ?auto_717986 ?auto_717987 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_718014 - BLOCK
      ?auto_718015 - BLOCK
      ?auto_718016 - BLOCK
      ?auto_718017 - BLOCK
      ?auto_718018 - BLOCK
      ?auto_718019 - BLOCK
      ?auto_718020 - BLOCK
      ?auto_718021 - BLOCK
    )
    :vars
    (
      ?auto_718022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718021 ?auto_718022 ) ( ON-TABLE ?auto_718014 ) ( ON ?auto_718015 ?auto_718014 ) ( ON ?auto_718016 ?auto_718015 ) ( ON ?auto_718017 ?auto_718016 ) ( not ( = ?auto_718014 ?auto_718015 ) ) ( not ( = ?auto_718014 ?auto_718016 ) ) ( not ( = ?auto_718014 ?auto_718017 ) ) ( not ( = ?auto_718014 ?auto_718018 ) ) ( not ( = ?auto_718014 ?auto_718019 ) ) ( not ( = ?auto_718014 ?auto_718020 ) ) ( not ( = ?auto_718014 ?auto_718021 ) ) ( not ( = ?auto_718014 ?auto_718022 ) ) ( not ( = ?auto_718015 ?auto_718016 ) ) ( not ( = ?auto_718015 ?auto_718017 ) ) ( not ( = ?auto_718015 ?auto_718018 ) ) ( not ( = ?auto_718015 ?auto_718019 ) ) ( not ( = ?auto_718015 ?auto_718020 ) ) ( not ( = ?auto_718015 ?auto_718021 ) ) ( not ( = ?auto_718015 ?auto_718022 ) ) ( not ( = ?auto_718016 ?auto_718017 ) ) ( not ( = ?auto_718016 ?auto_718018 ) ) ( not ( = ?auto_718016 ?auto_718019 ) ) ( not ( = ?auto_718016 ?auto_718020 ) ) ( not ( = ?auto_718016 ?auto_718021 ) ) ( not ( = ?auto_718016 ?auto_718022 ) ) ( not ( = ?auto_718017 ?auto_718018 ) ) ( not ( = ?auto_718017 ?auto_718019 ) ) ( not ( = ?auto_718017 ?auto_718020 ) ) ( not ( = ?auto_718017 ?auto_718021 ) ) ( not ( = ?auto_718017 ?auto_718022 ) ) ( not ( = ?auto_718018 ?auto_718019 ) ) ( not ( = ?auto_718018 ?auto_718020 ) ) ( not ( = ?auto_718018 ?auto_718021 ) ) ( not ( = ?auto_718018 ?auto_718022 ) ) ( not ( = ?auto_718019 ?auto_718020 ) ) ( not ( = ?auto_718019 ?auto_718021 ) ) ( not ( = ?auto_718019 ?auto_718022 ) ) ( not ( = ?auto_718020 ?auto_718021 ) ) ( not ( = ?auto_718020 ?auto_718022 ) ) ( not ( = ?auto_718021 ?auto_718022 ) ) ( ON ?auto_718020 ?auto_718021 ) ( ON ?auto_718019 ?auto_718020 ) ( CLEAR ?auto_718017 ) ( ON ?auto_718018 ?auto_718019 ) ( CLEAR ?auto_718018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_718014 ?auto_718015 ?auto_718016 ?auto_718017 ?auto_718018 )
      ( MAKE-8PILE ?auto_718014 ?auto_718015 ?auto_718016 ?auto_718017 ?auto_718018 ?auto_718019 ?auto_718020 ?auto_718021 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_718048 - BLOCK
      ?auto_718049 - BLOCK
      ?auto_718050 - BLOCK
      ?auto_718051 - BLOCK
      ?auto_718052 - BLOCK
      ?auto_718053 - BLOCK
      ?auto_718054 - BLOCK
      ?auto_718055 - BLOCK
    )
    :vars
    (
      ?auto_718056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718055 ?auto_718056 ) ( ON-TABLE ?auto_718048 ) ( ON ?auto_718049 ?auto_718048 ) ( ON ?auto_718050 ?auto_718049 ) ( not ( = ?auto_718048 ?auto_718049 ) ) ( not ( = ?auto_718048 ?auto_718050 ) ) ( not ( = ?auto_718048 ?auto_718051 ) ) ( not ( = ?auto_718048 ?auto_718052 ) ) ( not ( = ?auto_718048 ?auto_718053 ) ) ( not ( = ?auto_718048 ?auto_718054 ) ) ( not ( = ?auto_718048 ?auto_718055 ) ) ( not ( = ?auto_718048 ?auto_718056 ) ) ( not ( = ?auto_718049 ?auto_718050 ) ) ( not ( = ?auto_718049 ?auto_718051 ) ) ( not ( = ?auto_718049 ?auto_718052 ) ) ( not ( = ?auto_718049 ?auto_718053 ) ) ( not ( = ?auto_718049 ?auto_718054 ) ) ( not ( = ?auto_718049 ?auto_718055 ) ) ( not ( = ?auto_718049 ?auto_718056 ) ) ( not ( = ?auto_718050 ?auto_718051 ) ) ( not ( = ?auto_718050 ?auto_718052 ) ) ( not ( = ?auto_718050 ?auto_718053 ) ) ( not ( = ?auto_718050 ?auto_718054 ) ) ( not ( = ?auto_718050 ?auto_718055 ) ) ( not ( = ?auto_718050 ?auto_718056 ) ) ( not ( = ?auto_718051 ?auto_718052 ) ) ( not ( = ?auto_718051 ?auto_718053 ) ) ( not ( = ?auto_718051 ?auto_718054 ) ) ( not ( = ?auto_718051 ?auto_718055 ) ) ( not ( = ?auto_718051 ?auto_718056 ) ) ( not ( = ?auto_718052 ?auto_718053 ) ) ( not ( = ?auto_718052 ?auto_718054 ) ) ( not ( = ?auto_718052 ?auto_718055 ) ) ( not ( = ?auto_718052 ?auto_718056 ) ) ( not ( = ?auto_718053 ?auto_718054 ) ) ( not ( = ?auto_718053 ?auto_718055 ) ) ( not ( = ?auto_718053 ?auto_718056 ) ) ( not ( = ?auto_718054 ?auto_718055 ) ) ( not ( = ?auto_718054 ?auto_718056 ) ) ( not ( = ?auto_718055 ?auto_718056 ) ) ( ON ?auto_718054 ?auto_718055 ) ( ON ?auto_718053 ?auto_718054 ) ( ON ?auto_718052 ?auto_718053 ) ( CLEAR ?auto_718050 ) ( ON ?auto_718051 ?auto_718052 ) ( CLEAR ?auto_718051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_718048 ?auto_718049 ?auto_718050 ?auto_718051 )
      ( MAKE-8PILE ?auto_718048 ?auto_718049 ?auto_718050 ?auto_718051 ?auto_718052 ?auto_718053 ?auto_718054 ?auto_718055 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_718082 - BLOCK
      ?auto_718083 - BLOCK
      ?auto_718084 - BLOCK
      ?auto_718085 - BLOCK
      ?auto_718086 - BLOCK
      ?auto_718087 - BLOCK
      ?auto_718088 - BLOCK
      ?auto_718089 - BLOCK
    )
    :vars
    (
      ?auto_718090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718089 ?auto_718090 ) ( ON-TABLE ?auto_718082 ) ( ON ?auto_718083 ?auto_718082 ) ( not ( = ?auto_718082 ?auto_718083 ) ) ( not ( = ?auto_718082 ?auto_718084 ) ) ( not ( = ?auto_718082 ?auto_718085 ) ) ( not ( = ?auto_718082 ?auto_718086 ) ) ( not ( = ?auto_718082 ?auto_718087 ) ) ( not ( = ?auto_718082 ?auto_718088 ) ) ( not ( = ?auto_718082 ?auto_718089 ) ) ( not ( = ?auto_718082 ?auto_718090 ) ) ( not ( = ?auto_718083 ?auto_718084 ) ) ( not ( = ?auto_718083 ?auto_718085 ) ) ( not ( = ?auto_718083 ?auto_718086 ) ) ( not ( = ?auto_718083 ?auto_718087 ) ) ( not ( = ?auto_718083 ?auto_718088 ) ) ( not ( = ?auto_718083 ?auto_718089 ) ) ( not ( = ?auto_718083 ?auto_718090 ) ) ( not ( = ?auto_718084 ?auto_718085 ) ) ( not ( = ?auto_718084 ?auto_718086 ) ) ( not ( = ?auto_718084 ?auto_718087 ) ) ( not ( = ?auto_718084 ?auto_718088 ) ) ( not ( = ?auto_718084 ?auto_718089 ) ) ( not ( = ?auto_718084 ?auto_718090 ) ) ( not ( = ?auto_718085 ?auto_718086 ) ) ( not ( = ?auto_718085 ?auto_718087 ) ) ( not ( = ?auto_718085 ?auto_718088 ) ) ( not ( = ?auto_718085 ?auto_718089 ) ) ( not ( = ?auto_718085 ?auto_718090 ) ) ( not ( = ?auto_718086 ?auto_718087 ) ) ( not ( = ?auto_718086 ?auto_718088 ) ) ( not ( = ?auto_718086 ?auto_718089 ) ) ( not ( = ?auto_718086 ?auto_718090 ) ) ( not ( = ?auto_718087 ?auto_718088 ) ) ( not ( = ?auto_718087 ?auto_718089 ) ) ( not ( = ?auto_718087 ?auto_718090 ) ) ( not ( = ?auto_718088 ?auto_718089 ) ) ( not ( = ?auto_718088 ?auto_718090 ) ) ( not ( = ?auto_718089 ?auto_718090 ) ) ( ON ?auto_718088 ?auto_718089 ) ( ON ?auto_718087 ?auto_718088 ) ( ON ?auto_718086 ?auto_718087 ) ( ON ?auto_718085 ?auto_718086 ) ( CLEAR ?auto_718083 ) ( ON ?auto_718084 ?auto_718085 ) ( CLEAR ?auto_718084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_718082 ?auto_718083 ?auto_718084 )
      ( MAKE-8PILE ?auto_718082 ?auto_718083 ?auto_718084 ?auto_718085 ?auto_718086 ?auto_718087 ?auto_718088 ?auto_718089 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_718116 - BLOCK
      ?auto_718117 - BLOCK
      ?auto_718118 - BLOCK
      ?auto_718119 - BLOCK
      ?auto_718120 - BLOCK
      ?auto_718121 - BLOCK
      ?auto_718122 - BLOCK
      ?auto_718123 - BLOCK
    )
    :vars
    (
      ?auto_718124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718123 ?auto_718124 ) ( ON-TABLE ?auto_718116 ) ( not ( = ?auto_718116 ?auto_718117 ) ) ( not ( = ?auto_718116 ?auto_718118 ) ) ( not ( = ?auto_718116 ?auto_718119 ) ) ( not ( = ?auto_718116 ?auto_718120 ) ) ( not ( = ?auto_718116 ?auto_718121 ) ) ( not ( = ?auto_718116 ?auto_718122 ) ) ( not ( = ?auto_718116 ?auto_718123 ) ) ( not ( = ?auto_718116 ?auto_718124 ) ) ( not ( = ?auto_718117 ?auto_718118 ) ) ( not ( = ?auto_718117 ?auto_718119 ) ) ( not ( = ?auto_718117 ?auto_718120 ) ) ( not ( = ?auto_718117 ?auto_718121 ) ) ( not ( = ?auto_718117 ?auto_718122 ) ) ( not ( = ?auto_718117 ?auto_718123 ) ) ( not ( = ?auto_718117 ?auto_718124 ) ) ( not ( = ?auto_718118 ?auto_718119 ) ) ( not ( = ?auto_718118 ?auto_718120 ) ) ( not ( = ?auto_718118 ?auto_718121 ) ) ( not ( = ?auto_718118 ?auto_718122 ) ) ( not ( = ?auto_718118 ?auto_718123 ) ) ( not ( = ?auto_718118 ?auto_718124 ) ) ( not ( = ?auto_718119 ?auto_718120 ) ) ( not ( = ?auto_718119 ?auto_718121 ) ) ( not ( = ?auto_718119 ?auto_718122 ) ) ( not ( = ?auto_718119 ?auto_718123 ) ) ( not ( = ?auto_718119 ?auto_718124 ) ) ( not ( = ?auto_718120 ?auto_718121 ) ) ( not ( = ?auto_718120 ?auto_718122 ) ) ( not ( = ?auto_718120 ?auto_718123 ) ) ( not ( = ?auto_718120 ?auto_718124 ) ) ( not ( = ?auto_718121 ?auto_718122 ) ) ( not ( = ?auto_718121 ?auto_718123 ) ) ( not ( = ?auto_718121 ?auto_718124 ) ) ( not ( = ?auto_718122 ?auto_718123 ) ) ( not ( = ?auto_718122 ?auto_718124 ) ) ( not ( = ?auto_718123 ?auto_718124 ) ) ( ON ?auto_718122 ?auto_718123 ) ( ON ?auto_718121 ?auto_718122 ) ( ON ?auto_718120 ?auto_718121 ) ( ON ?auto_718119 ?auto_718120 ) ( ON ?auto_718118 ?auto_718119 ) ( CLEAR ?auto_718116 ) ( ON ?auto_718117 ?auto_718118 ) ( CLEAR ?auto_718117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_718116 ?auto_718117 )
      ( MAKE-8PILE ?auto_718116 ?auto_718117 ?auto_718118 ?auto_718119 ?auto_718120 ?auto_718121 ?auto_718122 ?auto_718123 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_718150 - BLOCK
      ?auto_718151 - BLOCK
      ?auto_718152 - BLOCK
      ?auto_718153 - BLOCK
      ?auto_718154 - BLOCK
      ?auto_718155 - BLOCK
      ?auto_718156 - BLOCK
      ?auto_718157 - BLOCK
    )
    :vars
    (
      ?auto_718158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718157 ?auto_718158 ) ( not ( = ?auto_718150 ?auto_718151 ) ) ( not ( = ?auto_718150 ?auto_718152 ) ) ( not ( = ?auto_718150 ?auto_718153 ) ) ( not ( = ?auto_718150 ?auto_718154 ) ) ( not ( = ?auto_718150 ?auto_718155 ) ) ( not ( = ?auto_718150 ?auto_718156 ) ) ( not ( = ?auto_718150 ?auto_718157 ) ) ( not ( = ?auto_718150 ?auto_718158 ) ) ( not ( = ?auto_718151 ?auto_718152 ) ) ( not ( = ?auto_718151 ?auto_718153 ) ) ( not ( = ?auto_718151 ?auto_718154 ) ) ( not ( = ?auto_718151 ?auto_718155 ) ) ( not ( = ?auto_718151 ?auto_718156 ) ) ( not ( = ?auto_718151 ?auto_718157 ) ) ( not ( = ?auto_718151 ?auto_718158 ) ) ( not ( = ?auto_718152 ?auto_718153 ) ) ( not ( = ?auto_718152 ?auto_718154 ) ) ( not ( = ?auto_718152 ?auto_718155 ) ) ( not ( = ?auto_718152 ?auto_718156 ) ) ( not ( = ?auto_718152 ?auto_718157 ) ) ( not ( = ?auto_718152 ?auto_718158 ) ) ( not ( = ?auto_718153 ?auto_718154 ) ) ( not ( = ?auto_718153 ?auto_718155 ) ) ( not ( = ?auto_718153 ?auto_718156 ) ) ( not ( = ?auto_718153 ?auto_718157 ) ) ( not ( = ?auto_718153 ?auto_718158 ) ) ( not ( = ?auto_718154 ?auto_718155 ) ) ( not ( = ?auto_718154 ?auto_718156 ) ) ( not ( = ?auto_718154 ?auto_718157 ) ) ( not ( = ?auto_718154 ?auto_718158 ) ) ( not ( = ?auto_718155 ?auto_718156 ) ) ( not ( = ?auto_718155 ?auto_718157 ) ) ( not ( = ?auto_718155 ?auto_718158 ) ) ( not ( = ?auto_718156 ?auto_718157 ) ) ( not ( = ?auto_718156 ?auto_718158 ) ) ( not ( = ?auto_718157 ?auto_718158 ) ) ( ON ?auto_718156 ?auto_718157 ) ( ON ?auto_718155 ?auto_718156 ) ( ON ?auto_718154 ?auto_718155 ) ( ON ?auto_718153 ?auto_718154 ) ( ON ?auto_718152 ?auto_718153 ) ( ON ?auto_718151 ?auto_718152 ) ( ON ?auto_718150 ?auto_718151 ) ( CLEAR ?auto_718150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_718150 )
      ( MAKE-8PILE ?auto_718150 ?auto_718151 ?auto_718152 ?auto_718153 ?auto_718154 ?auto_718155 ?auto_718156 ?auto_718157 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718185 - BLOCK
      ?auto_718186 - BLOCK
      ?auto_718187 - BLOCK
      ?auto_718188 - BLOCK
      ?auto_718189 - BLOCK
      ?auto_718190 - BLOCK
      ?auto_718191 - BLOCK
      ?auto_718192 - BLOCK
      ?auto_718193 - BLOCK
    )
    :vars
    (
      ?auto_718194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_718192 ) ( ON ?auto_718193 ?auto_718194 ) ( CLEAR ?auto_718193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_718185 ) ( ON ?auto_718186 ?auto_718185 ) ( ON ?auto_718187 ?auto_718186 ) ( ON ?auto_718188 ?auto_718187 ) ( ON ?auto_718189 ?auto_718188 ) ( ON ?auto_718190 ?auto_718189 ) ( ON ?auto_718191 ?auto_718190 ) ( ON ?auto_718192 ?auto_718191 ) ( not ( = ?auto_718185 ?auto_718186 ) ) ( not ( = ?auto_718185 ?auto_718187 ) ) ( not ( = ?auto_718185 ?auto_718188 ) ) ( not ( = ?auto_718185 ?auto_718189 ) ) ( not ( = ?auto_718185 ?auto_718190 ) ) ( not ( = ?auto_718185 ?auto_718191 ) ) ( not ( = ?auto_718185 ?auto_718192 ) ) ( not ( = ?auto_718185 ?auto_718193 ) ) ( not ( = ?auto_718185 ?auto_718194 ) ) ( not ( = ?auto_718186 ?auto_718187 ) ) ( not ( = ?auto_718186 ?auto_718188 ) ) ( not ( = ?auto_718186 ?auto_718189 ) ) ( not ( = ?auto_718186 ?auto_718190 ) ) ( not ( = ?auto_718186 ?auto_718191 ) ) ( not ( = ?auto_718186 ?auto_718192 ) ) ( not ( = ?auto_718186 ?auto_718193 ) ) ( not ( = ?auto_718186 ?auto_718194 ) ) ( not ( = ?auto_718187 ?auto_718188 ) ) ( not ( = ?auto_718187 ?auto_718189 ) ) ( not ( = ?auto_718187 ?auto_718190 ) ) ( not ( = ?auto_718187 ?auto_718191 ) ) ( not ( = ?auto_718187 ?auto_718192 ) ) ( not ( = ?auto_718187 ?auto_718193 ) ) ( not ( = ?auto_718187 ?auto_718194 ) ) ( not ( = ?auto_718188 ?auto_718189 ) ) ( not ( = ?auto_718188 ?auto_718190 ) ) ( not ( = ?auto_718188 ?auto_718191 ) ) ( not ( = ?auto_718188 ?auto_718192 ) ) ( not ( = ?auto_718188 ?auto_718193 ) ) ( not ( = ?auto_718188 ?auto_718194 ) ) ( not ( = ?auto_718189 ?auto_718190 ) ) ( not ( = ?auto_718189 ?auto_718191 ) ) ( not ( = ?auto_718189 ?auto_718192 ) ) ( not ( = ?auto_718189 ?auto_718193 ) ) ( not ( = ?auto_718189 ?auto_718194 ) ) ( not ( = ?auto_718190 ?auto_718191 ) ) ( not ( = ?auto_718190 ?auto_718192 ) ) ( not ( = ?auto_718190 ?auto_718193 ) ) ( not ( = ?auto_718190 ?auto_718194 ) ) ( not ( = ?auto_718191 ?auto_718192 ) ) ( not ( = ?auto_718191 ?auto_718193 ) ) ( not ( = ?auto_718191 ?auto_718194 ) ) ( not ( = ?auto_718192 ?auto_718193 ) ) ( not ( = ?auto_718192 ?auto_718194 ) ) ( not ( = ?auto_718193 ?auto_718194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_718193 ?auto_718194 )
      ( !STACK ?auto_718193 ?auto_718192 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718223 - BLOCK
      ?auto_718224 - BLOCK
      ?auto_718225 - BLOCK
      ?auto_718226 - BLOCK
      ?auto_718227 - BLOCK
      ?auto_718228 - BLOCK
      ?auto_718229 - BLOCK
      ?auto_718230 - BLOCK
      ?auto_718231 - BLOCK
    )
    :vars
    (
      ?auto_718232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718231 ?auto_718232 ) ( ON-TABLE ?auto_718223 ) ( ON ?auto_718224 ?auto_718223 ) ( ON ?auto_718225 ?auto_718224 ) ( ON ?auto_718226 ?auto_718225 ) ( ON ?auto_718227 ?auto_718226 ) ( ON ?auto_718228 ?auto_718227 ) ( ON ?auto_718229 ?auto_718228 ) ( not ( = ?auto_718223 ?auto_718224 ) ) ( not ( = ?auto_718223 ?auto_718225 ) ) ( not ( = ?auto_718223 ?auto_718226 ) ) ( not ( = ?auto_718223 ?auto_718227 ) ) ( not ( = ?auto_718223 ?auto_718228 ) ) ( not ( = ?auto_718223 ?auto_718229 ) ) ( not ( = ?auto_718223 ?auto_718230 ) ) ( not ( = ?auto_718223 ?auto_718231 ) ) ( not ( = ?auto_718223 ?auto_718232 ) ) ( not ( = ?auto_718224 ?auto_718225 ) ) ( not ( = ?auto_718224 ?auto_718226 ) ) ( not ( = ?auto_718224 ?auto_718227 ) ) ( not ( = ?auto_718224 ?auto_718228 ) ) ( not ( = ?auto_718224 ?auto_718229 ) ) ( not ( = ?auto_718224 ?auto_718230 ) ) ( not ( = ?auto_718224 ?auto_718231 ) ) ( not ( = ?auto_718224 ?auto_718232 ) ) ( not ( = ?auto_718225 ?auto_718226 ) ) ( not ( = ?auto_718225 ?auto_718227 ) ) ( not ( = ?auto_718225 ?auto_718228 ) ) ( not ( = ?auto_718225 ?auto_718229 ) ) ( not ( = ?auto_718225 ?auto_718230 ) ) ( not ( = ?auto_718225 ?auto_718231 ) ) ( not ( = ?auto_718225 ?auto_718232 ) ) ( not ( = ?auto_718226 ?auto_718227 ) ) ( not ( = ?auto_718226 ?auto_718228 ) ) ( not ( = ?auto_718226 ?auto_718229 ) ) ( not ( = ?auto_718226 ?auto_718230 ) ) ( not ( = ?auto_718226 ?auto_718231 ) ) ( not ( = ?auto_718226 ?auto_718232 ) ) ( not ( = ?auto_718227 ?auto_718228 ) ) ( not ( = ?auto_718227 ?auto_718229 ) ) ( not ( = ?auto_718227 ?auto_718230 ) ) ( not ( = ?auto_718227 ?auto_718231 ) ) ( not ( = ?auto_718227 ?auto_718232 ) ) ( not ( = ?auto_718228 ?auto_718229 ) ) ( not ( = ?auto_718228 ?auto_718230 ) ) ( not ( = ?auto_718228 ?auto_718231 ) ) ( not ( = ?auto_718228 ?auto_718232 ) ) ( not ( = ?auto_718229 ?auto_718230 ) ) ( not ( = ?auto_718229 ?auto_718231 ) ) ( not ( = ?auto_718229 ?auto_718232 ) ) ( not ( = ?auto_718230 ?auto_718231 ) ) ( not ( = ?auto_718230 ?auto_718232 ) ) ( not ( = ?auto_718231 ?auto_718232 ) ) ( CLEAR ?auto_718229 ) ( ON ?auto_718230 ?auto_718231 ) ( CLEAR ?auto_718230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_718223 ?auto_718224 ?auto_718225 ?auto_718226 ?auto_718227 ?auto_718228 ?auto_718229 ?auto_718230 )
      ( MAKE-9PILE ?auto_718223 ?auto_718224 ?auto_718225 ?auto_718226 ?auto_718227 ?auto_718228 ?auto_718229 ?auto_718230 ?auto_718231 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718261 - BLOCK
      ?auto_718262 - BLOCK
      ?auto_718263 - BLOCK
      ?auto_718264 - BLOCK
      ?auto_718265 - BLOCK
      ?auto_718266 - BLOCK
      ?auto_718267 - BLOCK
      ?auto_718268 - BLOCK
      ?auto_718269 - BLOCK
    )
    :vars
    (
      ?auto_718270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718269 ?auto_718270 ) ( ON-TABLE ?auto_718261 ) ( ON ?auto_718262 ?auto_718261 ) ( ON ?auto_718263 ?auto_718262 ) ( ON ?auto_718264 ?auto_718263 ) ( ON ?auto_718265 ?auto_718264 ) ( ON ?auto_718266 ?auto_718265 ) ( not ( = ?auto_718261 ?auto_718262 ) ) ( not ( = ?auto_718261 ?auto_718263 ) ) ( not ( = ?auto_718261 ?auto_718264 ) ) ( not ( = ?auto_718261 ?auto_718265 ) ) ( not ( = ?auto_718261 ?auto_718266 ) ) ( not ( = ?auto_718261 ?auto_718267 ) ) ( not ( = ?auto_718261 ?auto_718268 ) ) ( not ( = ?auto_718261 ?auto_718269 ) ) ( not ( = ?auto_718261 ?auto_718270 ) ) ( not ( = ?auto_718262 ?auto_718263 ) ) ( not ( = ?auto_718262 ?auto_718264 ) ) ( not ( = ?auto_718262 ?auto_718265 ) ) ( not ( = ?auto_718262 ?auto_718266 ) ) ( not ( = ?auto_718262 ?auto_718267 ) ) ( not ( = ?auto_718262 ?auto_718268 ) ) ( not ( = ?auto_718262 ?auto_718269 ) ) ( not ( = ?auto_718262 ?auto_718270 ) ) ( not ( = ?auto_718263 ?auto_718264 ) ) ( not ( = ?auto_718263 ?auto_718265 ) ) ( not ( = ?auto_718263 ?auto_718266 ) ) ( not ( = ?auto_718263 ?auto_718267 ) ) ( not ( = ?auto_718263 ?auto_718268 ) ) ( not ( = ?auto_718263 ?auto_718269 ) ) ( not ( = ?auto_718263 ?auto_718270 ) ) ( not ( = ?auto_718264 ?auto_718265 ) ) ( not ( = ?auto_718264 ?auto_718266 ) ) ( not ( = ?auto_718264 ?auto_718267 ) ) ( not ( = ?auto_718264 ?auto_718268 ) ) ( not ( = ?auto_718264 ?auto_718269 ) ) ( not ( = ?auto_718264 ?auto_718270 ) ) ( not ( = ?auto_718265 ?auto_718266 ) ) ( not ( = ?auto_718265 ?auto_718267 ) ) ( not ( = ?auto_718265 ?auto_718268 ) ) ( not ( = ?auto_718265 ?auto_718269 ) ) ( not ( = ?auto_718265 ?auto_718270 ) ) ( not ( = ?auto_718266 ?auto_718267 ) ) ( not ( = ?auto_718266 ?auto_718268 ) ) ( not ( = ?auto_718266 ?auto_718269 ) ) ( not ( = ?auto_718266 ?auto_718270 ) ) ( not ( = ?auto_718267 ?auto_718268 ) ) ( not ( = ?auto_718267 ?auto_718269 ) ) ( not ( = ?auto_718267 ?auto_718270 ) ) ( not ( = ?auto_718268 ?auto_718269 ) ) ( not ( = ?auto_718268 ?auto_718270 ) ) ( not ( = ?auto_718269 ?auto_718270 ) ) ( ON ?auto_718268 ?auto_718269 ) ( CLEAR ?auto_718266 ) ( ON ?auto_718267 ?auto_718268 ) ( CLEAR ?auto_718267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_718261 ?auto_718262 ?auto_718263 ?auto_718264 ?auto_718265 ?auto_718266 ?auto_718267 )
      ( MAKE-9PILE ?auto_718261 ?auto_718262 ?auto_718263 ?auto_718264 ?auto_718265 ?auto_718266 ?auto_718267 ?auto_718268 ?auto_718269 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718299 - BLOCK
      ?auto_718300 - BLOCK
      ?auto_718301 - BLOCK
      ?auto_718302 - BLOCK
      ?auto_718303 - BLOCK
      ?auto_718304 - BLOCK
      ?auto_718305 - BLOCK
      ?auto_718306 - BLOCK
      ?auto_718307 - BLOCK
    )
    :vars
    (
      ?auto_718308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718307 ?auto_718308 ) ( ON-TABLE ?auto_718299 ) ( ON ?auto_718300 ?auto_718299 ) ( ON ?auto_718301 ?auto_718300 ) ( ON ?auto_718302 ?auto_718301 ) ( ON ?auto_718303 ?auto_718302 ) ( not ( = ?auto_718299 ?auto_718300 ) ) ( not ( = ?auto_718299 ?auto_718301 ) ) ( not ( = ?auto_718299 ?auto_718302 ) ) ( not ( = ?auto_718299 ?auto_718303 ) ) ( not ( = ?auto_718299 ?auto_718304 ) ) ( not ( = ?auto_718299 ?auto_718305 ) ) ( not ( = ?auto_718299 ?auto_718306 ) ) ( not ( = ?auto_718299 ?auto_718307 ) ) ( not ( = ?auto_718299 ?auto_718308 ) ) ( not ( = ?auto_718300 ?auto_718301 ) ) ( not ( = ?auto_718300 ?auto_718302 ) ) ( not ( = ?auto_718300 ?auto_718303 ) ) ( not ( = ?auto_718300 ?auto_718304 ) ) ( not ( = ?auto_718300 ?auto_718305 ) ) ( not ( = ?auto_718300 ?auto_718306 ) ) ( not ( = ?auto_718300 ?auto_718307 ) ) ( not ( = ?auto_718300 ?auto_718308 ) ) ( not ( = ?auto_718301 ?auto_718302 ) ) ( not ( = ?auto_718301 ?auto_718303 ) ) ( not ( = ?auto_718301 ?auto_718304 ) ) ( not ( = ?auto_718301 ?auto_718305 ) ) ( not ( = ?auto_718301 ?auto_718306 ) ) ( not ( = ?auto_718301 ?auto_718307 ) ) ( not ( = ?auto_718301 ?auto_718308 ) ) ( not ( = ?auto_718302 ?auto_718303 ) ) ( not ( = ?auto_718302 ?auto_718304 ) ) ( not ( = ?auto_718302 ?auto_718305 ) ) ( not ( = ?auto_718302 ?auto_718306 ) ) ( not ( = ?auto_718302 ?auto_718307 ) ) ( not ( = ?auto_718302 ?auto_718308 ) ) ( not ( = ?auto_718303 ?auto_718304 ) ) ( not ( = ?auto_718303 ?auto_718305 ) ) ( not ( = ?auto_718303 ?auto_718306 ) ) ( not ( = ?auto_718303 ?auto_718307 ) ) ( not ( = ?auto_718303 ?auto_718308 ) ) ( not ( = ?auto_718304 ?auto_718305 ) ) ( not ( = ?auto_718304 ?auto_718306 ) ) ( not ( = ?auto_718304 ?auto_718307 ) ) ( not ( = ?auto_718304 ?auto_718308 ) ) ( not ( = ?auto_718305 ?auto_718306 ) ) ( not ( = ?auto_718305 ?auto_718307 ) ) ( not ( = ?auto_718305 ?auto_718308 ) ) ( not ( = ?auto_718306 ?auto_718307 ) ) ( not ( = ?auto_718306 ?auto_718308 ) ) ( not ( = ?auto_718307 ?auto_718308 ) ) ( ON ?auto_718306 ?auto_718307 ) ( ON ?auto_718305 ?auto_718306 ) ( CLEAR ?auto_718303 ) ( ON ?auto_718304 ?auto_718305 ) ( CLEAR ?auto_718304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_718299 ?auto_718300 ?auto_718301 ?auto_718302 ?auto_718303 ?auto_718304 )
      ( MAKE-9PILE ?auto_718299 ?auto_718300 ?auto_718301 ?auto_718302 ?auto_718303 ?auto_718304 ?auto_718305 ?auto_718306 ?auto_718307 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718337 - BLOCK
      ?auto_718338 - BLOCK
      ?auto_718339 - BLOCK
      ?auto_718340 - BLOCK
      ?auto_718341 - BLOCK
      ?auto_718342 - BLOCK
      ?auto_718343 - BLOCK
      ?auto_718344 - BLOCK
      ?auto_718345 - BLOCK
    )
    :vars
    (
      ?auto_718346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718345 ?auto_718346 ) ( ON-TABLE ?auto_718337 ) ( ON ?auto_718338 ?auto_718337 ) ( ON ?auto_718339 ?auto_718338 ) ( ON ?auto_718340 ?auto_718339 ) ( not ( = ?auto_718337 ?auto_718338 ) ) ( not ( = ?auto_718337 ?auto_718339 ) ) ( not ( = ?auto_718337 ?auto_718340 ) ) ( not ( = ?auto_718337 ?auto_718341 ) ) ( not ( = ?auto_718337 ?auto_718342 ) ) ( not ( = ?auto_718337 ?auto_718343 ) ) ( not ( = ?auto_718337 ?auto_718344 ) ) ( not ( = ?auto_718337 ?auto_718345 ) ) ( not ( = ?auto_718337 ?auto_718346 ) ) ( not ( = ?auto_718338 ?auto_718339 ) ) ( not ( = ?auto_718338 ?auto_718340 ) ) ( not ( = ?auto_718338 ?auto_718341 ) ) ( not ( = ?auto_718338 ?auto_718342 ) ) ( not ( = ?auto_718338 ?auto_718343 ) ) ( not ( = ?auto_718338 ?auto_718344 ) ) ( not ( = ?auto_718338 ?auto_718345 ) ) ( not ( = ?auto_718338 ?auto_718346 ) ) ( not ( = ?auto_718339 ?auto_718340 ) ) ( not ( = ?auto_718339 ?auto_718341 ) ) ( not ( = ?auto_718339 ?auto_718342 ) ) ( not ( = ?auto_718339 ?auto_718343 ) ) ( not ( = ?auto_718339 ?auto_718344 ) ) ( not ( = ?auto_718339 ?auto_718345 ) ) ( not ( = ?auto_718339 ?auto_718346 ) ) ( not ( = ?auto_718340 ?auto_718341 ) ) ( not ( = ?auto_718340 ?auto_718342 ) ) ( not ( = ?auto_718340 ?auto_718343 ) ) ( not ( = ?auto_718340 ?auto_718344 ) ) ( not ( = ?auto_718340 ?auto_718345 ) ) ( not ( = ?auto_718340 ?auto_718346 ) ) ( not ( = ?auto_718341 ?auto_718342 ) ) ( not ( = ?auto_718341 ?auto_718343 ) ) ( not ( = ?auto_718341 ?auto_718344 ) ) ( not ( = ?auto_718341 ?auto_718345 ) ) ( not ( = ?auto_718341 ?auto_718346 ) ) ( not ( = ?auto_718342 ?auto_718343 ) ) ( not ( = ?auto_718342 ?auto_718344 ) ) ( not ( = ?auto_718342 ?auto_718345 ) ) ( not ( = ?auto_718342 ?auto_718346 ) ) ( not ( = ?auto_718343 ?auto_718344 ) ) ( not ( = ?auto_718343 ?auto_718345 ) ) ( not ( = ?auto_718343 ?auto_718346 ) ) ( not ( = ?auto_718344 ?auto_718345 ) ) ( not ( = ?auto_718344 ?auto_718346 ) ) ( not ( = ?auto_718345 ?auto_718346 ) ) ( ON ?auto_718344 ?auto_718345 ) ( ON ?auto_718343 ?auto_718344 ) ( ON ?auto_718342 ?auto_718343 ) ( CLEAR ?auto_718340 ) ( ON ?auto_718341 ?auto_718342 ) ( CLEAR ?auto_718341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_718337 ?auto_718338 ?auto_718339 ?auto_718340 ?auto_718341 )
      ( MAKE-9PILE ?auto_718337 ?auto_718338 ?auto_718339 ?auto_718340 ?auto_718341 ?auto_718342 ?auto_718343 ?auto_718344 ?auto_718345 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718375 - BLOCK
      ?auto_718376 - BLOCK
      ?auto_718377 - BLOCK
      ?auto_718378 - BLOCK
      ?auto_718379 - BLOCK
      ?auto_718380 - BLOCK
      ?auto_718381 - BLOCK
      ?auto_718382 - BLOCK
      ?auto_718383 - BLOCK
    )
    :vars
    (
      ?auto_718384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718383 ?auto_718384 ) ( ON-TABLE ?auto_718375 ) ( ON ?auto_718376 ?auto_718375 ) ( ON ?auto_718377 ?auto_718376 ) ( not ( = ?auto_718375 ?auto_718376 ) ) ( not ( = ?auto_718375 ?auto_718377 ) ) ( not ( = ?auto_718375 ?auto_718378 ) ) ( not ( = ?auto_718375 ?auto_718379 ) ) ( not ( = ?auto_718375 ?auto_718380 ) ) ( not ( = ?auto_718375 ?auto_718381 ) ) ( not ( = ?auto_718375 ?auto_718382 ) ) ( not ( = ?auto_718375 ?auto_718383 ) ) ( not ( = ?auto_718375 ?auto_718384 ) ) ( not ( = ?auto_718376 ?auto_718377 ) ) ( not ( = ?auto_718376 ?auto_718378 ) ) ( not ( = ?auto_718376 ?auto_718379 ) ) ( not ( = ?auto_718376 ?auto_718380 ) ) ( not ( = ?auto_718376 ?auto_718381 ) ) ( not ( = ?auto_718376 ?auto_718382 ) ) ( not ( = ?auto_718376 ?auto_718383 ) ) ( not ( = ?auto_718376 ?auto_718384 ) ) ( not ( = ?auto_718377 ?auto_718378 ) ) ( not ( = ?auto_718377 ?auto_718379 ) ) ( not ( = ?auto_718377 ?auto_718380 ) ) ( not ( = ?auto_718377 ?auto_718381 ) ) ( not ( = ?auto_718377 ?auto_718382 ) ) ( not ( = ?auto_718377 ?auto_718383 ) ) ( not ( = ?auto_718377 ?auto_718384 ) ) ( not ( = ?auto_718378 ?auto_718379 ) ) ( not ( = ?auto_718378 ?auto_718380 ) ) ( not ( = ?auto_718378 ?auto_718381 ) ) ( not ( = ?auto_718378 ?auto_718382 ) ) ( not ( = ?auto_718378 ?auto_718383 ) ) ( not ( = ?auto_718378 ?auto_718384 ) ) ( not ( = ?auto_718379 ?auto_718380 ) ) ( not ( = ?auto_718379 ?auto_718381 ) ) ( not ( = ?auto_718379 ?auto_718382 ) ) ( not ( = ?auto_718379 ?auto_718383 ) ) ( not ( = ?auto_718379 ?auto_718384 ) ) ( not ( = ?auto_718380 ?auto_718381 ) ) ( not ( = ?auto_718380 ?auto_718382 ) ) ( not ( = ?auto_718380 ?auto_718383 ) ) ( not ( = ?auto_718380 ?auto_718384 ) ) ( not ( = ?auto_718381 ?auto_718382 ) ) ( not ( = ?auto_718381 ?auto_718383 ) ) ( not ( = ?auto_718381 ?auto_718384 ) ) ( not ( = ?auto_718382 ?auto_718383 ) ) ( not ( = ?auto_718382 ?auto_718384 ) ) ( not ( = ?auto_718383 ?auto_718384 ) ) ( ON ?auto_718382 ?auto_718383 ) ( ON ?auto_718381 ?auto_718382 ) ( ON ?auto_718380 ?auto_718381 ) ( ON ?auto_718379 ?auto_718380 ) ( CLEAR ?auto_718377 ) ( ON ?auto_718378 ?auto_718379 ) ( CLEAR ?auto_718378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_718375 ?auto_718376 ?auto_718377 ?auto_718378 )
      ( MAKE-9PILE ?auto_718375 ?auto_718376 ?auto_718377 ?auto_718378 ?auto_718379 ?auto_718380 ?auto_718381 ?auto_718382 ?auto_718383 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718413 - BLOCK
      ?auto_718414 - BLOCK
      ?auto_718415 - BLOCK
      ?auto_718416 - BLOCK
      ?auto_718417 - BLOCK
      ?auto_718418 - BLOCK
      ?auto_718419 - BLOCK
      ?auto_718420 - BLOCK
      ?auto_718421 - BLOCK
    )
    :vars
    (
      ?auto_718422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718421 ?auto_718422 ) ( ON-TABLE ?auto_718413 ) ( ON ?auto_718414 ?auto_718413 ) ( not ( = ?auto_718413 ?auto_718414 ) ) ( not ( = ?auto_718413 ?auto_718415 ) ) ( not ( = ?auto_718413 ?auto_718416 ) ) ( not ( = ?auto_718413 ?auto_718417 ) ) ( not ( = ?auto_718413 ?auto_718418 ) ) ( not ( = ?auto_718413 ?auto_718419 ) ) ( not ( = ?auto_718413 ?auto_718420 ) ) ( not ( = ?auto_718413 ?auto_718421 ) ) ( not ( = ?auto_718413 ?auto_718422 ) ) ( not ( = ?auto_718414 ?auto_718415 ) ) ( not ( = ?auto_718414 ?auto_718416 ) ) ( not ( = ?auto_718414 ?auto_718417 ) ) ( not ( = ?auto_718414 ?auto_718418 ) ) ( not ( = ?auto_718414 ?auto_718419 ) ) ( not ( = ?auto_718414 ?auto_718420 ) ) ( not ( = ?auto_718414 ?auto_718421 ) ) ( not ( = ?auto_718414 ?auto_718422 ) ) ( not ( = ?auto_718415 ?auto_718416 ) ) ( not ( = ?auto_718415 ?auto_718417 ) ) ( not ( = ?auto_718415 ?auto_718418 ) ) ( not ( = ?auto_718415 ?auto_718419 ) ) ( not ( = ?auto_718415 ?auto_718420 ) ) ( not ( = ?auto_718415 ?auto_718421 ) ) ( not ( = ?auto_718415 ?auto_718422 ) ) ( not ( = ?auto_718416 ?auto_718417 ) ) ( not ( = ?auto_718416 ?auto_718418 ) ) ( not ( = ?auto_718416 ?auto_718419 ) ) ( not ( = ?auto_718416 ?auto_718420 ) ) ( not ( = ?auto_718416 ?auto_718421 ) ) ( not ( = ?auto_718416 ?auto_718422 ) ) ( not ( = ?auto_718417 ?auto_718418 ) ) ( not ( = ?auto_718417 ?auto_718419 ) ) ( not ( = ?auto_718417 ?auto_718420 ) ) ( not ( = ?auto_718417 ?auto_718421 ) ) ( not ( = ?auto_718417 ?auto_718422 ) ) ( not ( = ?auto_718418 ?auto_718419 ) ) ( not ( = ?auto_718418 ?auto_718420 ) ) ( not ( = ?auto_718418 ?auto_718421 ) ) ( not ( = ?auto_718418 ?auto_718422 ) ) ( not ( = ?auto_718419 ?auto_718420 ) ) ( not ( = ?auto_718419 ?auto_718421 ) ) ( not ( = ?auto_718419 ?auto_718422 ) ) ( not ( = ?auto_718420 ?auto_718421 ) ) ( not ( = ?auto_718420 ?auto_718422 ) ) ( not ( = ?auto_718421 ?auto_718422 ) ) ( ON ?auto_718420 ?auto_718421 ) ( ON ?auto_718419 ?auto_718420 ) ( ON ?auto_718418 ?auto_718419 ) ( ON ?auto_718417 ?auto_718418 ) ( ON ?auto_718416 ?auto_718417 ) ( CLEAR ?auto_718414 ) ( ON ?auto_718415 ?auto_718416 ) ( CLEAR ?auto_718415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_718413 ?auto_718414 ?auto_718415 )
      ( MAKE-9PILE ?auto_718413 ?auto_718414 ?auto_718415 ?auto_718416 ?auto_718417 ?auto_718418 ?auto_718419 ?auto_718420 ?auto_718421 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718451 - BLOCK
      ?auto_718452 - BLOCK
      ?auto_718453 - BLOCK
      ?auto_718454 - BLOCK
      ?auto_718455 - BLOCK
      ?auto_718456 - BLOCK
      ?auto_718457 - BLOCK
      ?auto_718458 - BLOCK
      ?auto_718459 - BLOCK
    )
    :vars
    (
      ?auto_718460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718459 ?auto_718460 ) ( ON-TABLE ?auto_718451 ) ( not ( = ?auto_718451 ?auto_718452 ) ) ( not ( = ?auto_718451 ?auto_718453 ) ) ( not ( = ?auto_718451 ?auto_718454 ) ) ( not ( = ?auto_718451 ?auto_718455 ) ) ( not ( = ?auto_718451 ?auto_718456 ) ) ( not ( = ?auto_718451 ?auto_718457 ) ) ( not ( = ?auto_718451 ?auto_718458 ) ) ( not ( = ?auto_718451 ?auto_718459 ) ) ( not ( = ?auto_718451 ?auto_718460 ) ) ( not ( = ?auto_718452 ?auto_718453 ) ) ( not ( = ?auto_718452 ?auto_718454 ) ) ( not ( = ?auto_718452 ?auto_718455 ) ) ( not ( = ?auto_718452 ?auto_718456 ) ) ( not ( = ?auto_718452 ?auto_718457 ) ) ( not ( = ?auto_718452 ?auto_718458 ) ) ( not ( = ?auto_718452 ?auto_718459 ) ) ( not ( = ?auto_718452 ?auto_718460 ) ) ( not ( = ?auto_718453 ?auto_718454 ) ) ( not ( = ?auto_718453 ?auto_718455 ) ) ( not ( = ?auto_718453 ?auto_718456 ) ) ( not ( = ?auto_718453 ?auto_718457 ) ) ( not ( = ?auto_718453 ?auto_718458 ) ) ( not ( = ?auto_718453 ?auto_718459 ) ) ( not ( = ?auto_718453 ?auto_718460 ) ) ( not ( = ?auto_718454 ?auto_718455 ) ) ( not ( = ?auto_718454 ?auto_718456 ) ) ( not ( = ?auto_718454 ?auto_718457 ) ) ( not ( = ?auto_718454 ?auto_718458 ) ) ( not ( = ?auto_718454 ?auto_718459 ) ) ( not ( = ?auto_718454 ?auto_718460 ) ) ( not ( = ?auto_718455 ?auto_718456 ) ) ( not ( = ?auto_718455 ?auto_718457 ) ) ( not ( = ?auto_718455 ?auto_718458 ) ) ( not ( = ?auto_718455 ?auto_718459 ) ) ( not ( = ?auto_718455 ?auto_718460 ) ) ( not ( = ?auto_718456 ?auto_718457 ) ) ( not ( = ?auto_718456 ?auto_718458 ) ) ( not ( = ?auto_718456 ?auto_718459 ) ) ( not ( = ?auto_718456 ?auto_718460 ) ) ( not ( = ?auto_718457 ?auto_718458 ) ) ( not ( = ?auto_718457 ?auto_718459 ) ) ( not ( = ?auto_718457 ?auto_718460 ) ) ( not ( = ?auto_718458 ?auto_718459 ) ) ( not ( = ?auto_718458 ?auto_718460 ) ) ( not ( = ?auto_718459 ?auto_718460 ) ) ( ON ?auto_718458 ?auto_718459 ) ( ON ?auto_718457 ?auto_718458 ) ( ON ?auto_718456 ?auto_718457 ) ( ON ?auto_718455 ?auto_718456 ) ( ON ?auto_718454 ?auto_718455 ) ( ON ?auto_718453 ?auto_718454 ) ( CLEAR ?auto_718451 ) ( ON ?auto_718452 ?auto_718453 ) ( CLEAR ?auto_718452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_718451 ?auto_718452 )
      ( MAKE-9PILE ?auto_718451 ?auto_718452 ?auto_718453 ?auto_718454 ?auto_718455 ?auto_718456 ?auto_718457 ?auto_718458 ?auto_718459 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_718489 - BLOCK
      ?auto_718490 - BLOCK
      ?auto_718491 - BLOCK
      ?auto_718492 - BLOCK
      ?auto_718493 - BLOCK
      ?auto_718494 - BLOCK
      ?auto_718495 - BLOCK
      ?auto_718496 - BLOCK
      ?auto_718497 - BLOCK
    )
    :vars
    (
      ?auto_718498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718497 ?auto_718498 ) ( not ( = ?auto_718489 ?auto_718490 ) ) ( not ( = ?auto_718489 ?auto_718491 ) ) ( not ( = ?auto_718489 ?auto_718492 ) ) ( not ( = ?auto_718489 ?auto_718493 ) ) ( not ( = ?auto_718489 ?auto_718494 ) ) ( not ( = ?auto_718489 ?auto_718495 ) ) ( not ( = ?auto_718489 ?auto_718496 ) ) ( not ( = ?auto_718489 ?auto_718497 ) ) ( not ( = ?auto_718489 ?auto_718498 ) ) ( not ( = ?auto_718490 ?auto_718491 ) ) ( not ( = ?auto_718490 ?auto_718492 ) ) ( not ( = ?auto_718490 ?auto_718493 ) ) ( not ( = ?auto_718490 ?auto_718494 ) ) ( not ( = ?auto_718490 ?auto_718495 ) ) ( not ( = ?auto_718490 ?auto_718496 ) ) ( not ( = ?auto_718490 ?auto_718497 ) ) ( not ( = ?auto_718490 ?auto_718498 ) ) ( not ( = ?auto_718491 ?auto_718492 ) ) ( not ( = ?auto_718491 ?auto_718493 ) ) ( not ( = ?auto_718491 ?auto_718494 ) ) ( not ( = ?auto_718491 ?auto_718495 ) ) ( not ( = ?auto_718491 ?auto_718496 ) ) ( not ( = ?auto_718491 ?auto_718497 ) ) ( not ( = ?auto_718491 ?auto_718498 ) ) ( not ( = ?auto_718492 ?auto_718493 ) ) ( not ( = ?auto_718492 ?auto_718494 ) ) ( not ( = ?auto_718492 ?auto_718495 ) ) ( not ( = ?auto_718492 ?auto_718496 ) ) ( not ( = ?auto_718492 ?auto_718497 ) ) ( not ( = ?auto_718492 ?auto_718498 ) ) ( not ( = ?auto_718493 ?auto_718494 ) ) ( not ( = ?auto_718493 ?auto_718495 ) ) ( not ( = ?auto_718493 ?auto_718496 ) ) ( not ( = ?auto_718493 ?auto_718497 ) ) ( not ( = ?auto_718493 ?auto_718498 ) ) ( not ( = ?auto_718494 ?auto_718495 ) ) ( not ( = ?auto_718494 ?auto_718496 ) ) ( not ( = ?auto_718494 ?auto_718497 ) ) ( not ( = ?auto_718494 ?auto_718498 ) ) ( not ( = ?auto_718495 ?auto_718496 ) ) ( not ( = ?auto_718495 ?auto_718497 ) ) ( not ( = ?auto_718495 ?auto_718498 ) ) ( not ( = ?auto_718496 ?auto_718497 ) ) ( not ( = ?auto_718496 ?auto_718498 ) ) ( not ( = ?auto_718497 ?auto_718498 ) ) ( ON ?auto_718496 ?auto_718497 ) ( ON ?auto_718495 ?auto_718496 ) ( ON ?auto_718494 ?auto_718495 ) ( ON ?auto_718493 ?auto_718494 ) ( ON ?auto_718492 ?auto_718493 ) ( ON ?auto_718491 ?auto_718492 ) ( ON ?auto_718490 ?auto_718491 ) ( ON ?auto_718489 ?auto_718490 ) ( CLEAR ?auto_718489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_718489 )
      ( MAKE-9PILE ?auto_718489 ?auto_718490 ?auto_718491 ?auto_718492 ?auto_718493 ?auto_718494 ?auto_718495 ?auto_718496 ?auto_718497 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718528 - BLOCK
      ?auto_718529 - BLOCK
      ?auto_718530 - BLOCK
      ?auto_718531 - BLOCK
      ?auto_718532 - BLOCK
      ?auto_718533 - BLOCK
      ?auto_718534 - BLOCK
      ?auto_718535 - BLOCK
      ?auto_718536 - BLOCK
      ?auto_718537 - BLOCK
    )
    :vars
    (
      ?auto_718538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_718536 ) ( ON ?auto_718537 ?auto_718538 ) ( CLEAR ?auto_718537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_718528 ) ( ON ?auto_718529 ?auto_718528 ) ( ON ?auto_718530 ?auto_718529 ) ( ON ?auto_718531 ?auto_718530 ) ( ON ?auto_718532 ?auto_718531 ) ( ON ?auto_718533 ?auto_718532 ) ( ON ?auto_718534 ?auto_718533 ) ( ON ?auto_718535 ?auto_718534 ) ( ON ?auto_718536 ?auto_718535 ) ( not ( = ?auto_718528 ?auto_718529 ) ) ( not ( = ?auto_718528 ?auto_718530 ) ) ( not ( = ?auto_718528 ?auto_718531 ) ) ( not ( = ?auto_718528 ?auto_718532 ) ) ( not ( = ?auto_718528 ?auto_718533 ) ) ( not ( = ?auto_718528 ?auto_718534 ) ) ( not ( = ?auto_718528 ?auto_718535 ) ) ( not ( = ?auto_718528 ?auto_718536 ) ) ( not ( = ?auto_718528 ?auto_718537 ) ) ( not ( = ?auto_718528 ?auto_718538 ) ) ( not ( = ?auto_718529 ?auto_718530 ) ) ( not ( = ?auto_718529 ?auto_718531 ) ) ( not ( = ?auto_718529 ?auto_718532 ) ) ( not ( = ?auto_718529 ?auto_718533 ) ) ( not ( = ?auto_718529 ?auto_718534 ) ) ( not ( = ?auto_718529 ?auto_718535 ) ) ( not ( = ?auto_718529 ?auto_718536 ) ) ( not ( = ?auto_718529 ?auto_718537 ) ) ( not ( = ?auto_718529 ?auto_718538 ) ) ( not ( = ?auto_718530 ?auto_718531 ) ) ( not ( = ?auto_718530 ?auto_718532 ) ) ( not ( = ?auto_718530 ?auto_718533 ) ) ( not ( = ?auto_718530 ?auto_718534 ) ) ( not ( = ?auto_718530 ?auto_718535 ) ) ( not ( = ?auto_718530 ?auto_718536 ) ) ( not ( = ?auto_718530 ?auto_718537 ) ) ( not ( = ?auto_718530 ?auto_718538 ) ) ( not ( = ?auto_718531 ?auto_718532 ) ) ( not ( = ?auto_718531 ?auto_718533 ) ) ( not ( = ?auto_718531 ?auto_718534 ) ) ( not ( = ?auto_718531 ?auto_718535 ) ) ( not ( = ?auto_718531 ?auto_718536 ) ) ( not ( = ?auto_718531 ?auto_718537 ) ) ( not ( = ?auto_718531 ?auto_718538 ) ) ( not ( = ?auto_718532 ?auto_718533 ) ) ( not ( = ?auto_718532 ?auto_718534 ) ) ( not ( = ?auto_718532 ?auto_718535 ) ) ( not ( = ?auto_718532 ?auto_718536 ) ) ( not ( = ?auto_718532 ?auto_718537 ) ) ( not ( = ?auto_718532 ?auto_718538 ) ) ( not ( = ?auto_718533 ?auto_718534 ) ) ( not ( = ?auto_718533 ?auto_718535 ) ) ( not ( = ?auto_718533 ?auto_718536 ) ) ( not ( = ?auto_718533 ?auto_718537 ) ) ( not ( = ?auto_718533 ?auto_718538 ) ) ( not ( = ?auto_718534 ?auto_718535 ) ) ( not ( = ?auto_718534 ?auto_718536 ) ) ( not ( = ?auto_718534 ?auto_718537 ) ) ( not ( = ?auto_718534 ?auto_718538 ) ) ( not ( = ?auto_718535 ?auto_718536 ) ) ( not ( = ?auto_718535 ?auto_718537 ) ) ( not ( = ?auto_718535 ?auto_718538 ) ) ( not ( = ?auto_718536 ?auto_718537 ) ) ( not ( = ?auto_718536 ?auto_718538 ) ) ( not ( = ?auto_718537 ?auto_718538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_718537 ?auto_718538 )
      ( !STACK ?auto_718537 ?auto_718536 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718570 - BLOCK
      ?auto_718571 - BLOCK
      ?auto_718572 - BLOCK
      ?auto_718573 - BLOCK
      ?auto_718574 - BLOCK
      ?auto_718575 - BLOCK
      ?auto_718576 - BLOCK
      ?auto_718577 - BLOCK
      ?auto_718578 - BLOCK
      ?auto_718579 - BLOCK
    )
    :vars
    (
      ?auto_718580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718579 ?auto_718580 ) ( ON-TABLE ?auto_718570 ) ( ON ?auto_718571 ?auto_718570 ) ( ON ?auto_718572 ?auto_718571 ) ( ON ?auto_718573 ?auto_718572 ) ( ON ?auto_718574 ?auto_718573 ) ( ON ?auto_718575 ?auto_718574 ) ( ON ?auto_718576 ?auto_718575 ) ( ON ?auto_718577 ?auto_718576 ) ( not ( = ?auto_718570 ?auto_718571 ) ) ( not ( = ?auto_718570 ?auto_718572 ) ) ( not ( = ?auto_718570 ?auto_718573 ) ) ( not ( = ?auto_718570 ?auto_718574 ) ) ( not ( = ?auto_718570 ?auto_718575 ) ) ( not ( = ?auto_718570 ?auto_718576 ) ) ( not ( = ?auto_718570 ?auto_718577 ) ) ( not ( = ?auto_718570 ?auto_718578 ) ) ( not ( = ?auto_718570 ?auto_718579 ) ) ( not ( = ?auto_718570 ?auto_718580 ) ) ( not ( = ?auto_718571 ?auto_718572 ) ) ( not ( = ?auto_718571 ?auto_718573 ) ) ( not ( = ?auto_718571 ?auto_718574 ) ) ( not ( = ?auto_718571 ?auto_718575 ) ) ( not ( = ?auto_718571 ?auto_718576 ) ) ( not ( = ?auto_718571 ?auto_718577 ) ) ( not ( = ?auto_718571 ?auto_718578 ) ) ( not ( = ?auto_718571 ?auto_718579 ) ) ( not ( = ?auto_718571 ?auto_718580 ) ) ( not ( = ?auto_718572 ?auto_718573 ) ) ( not ( = ?auto_718572 ?auto_718574 ) ) ( not ( = ?auto_718572 ?auto_718575 ) ) ( not ( = ?auto_718572 ?auto_718576 ) ) ( not ( = ?auto_718572 ?auto_718577 ) ) ( not ( = ?auto_718572 ?auto_718578 ) ) ( not ( = ?auto_718572 ?auto_718579 ) ) ( not ( = ?auto_718572 ?auto_718580 ) ) ( not ( = ?auto_718573 ?auto_718574 ) ) ( not ( = ?auto_718573 ?auto_718575 ) ) ( not ( = ?auto_718573 ?auto_718576 ) ) ( not ( = ?auto_718573 ?auto_718577 ) ) ( not ( = ?auto_718573 ?auto_718578 ) ) ( not ( = ?auto_718573 ?auto_718579 ) ) ( not ( = ?auto_718573 ?auto_718580 ) ) ( not ( = ?auto_718574 ?auto_718575 ) ) ( not ( = ?auto_718574 ?auto_718576 ) ) ( not ( = ?auto_718574 ?auto_718577 ) ) ( not ( = ?auto_718574 ?auto_718578 ) ) ( not ( = ?auto_718574 ?auto_718579 ) ) ( not ( = ?auto_718574 ?auto_718580 ) ) ( not ( = ?auto_718575 ?auto_718576 ) ) ( not ( = ?auto_718575 ?auto_718577 ) ) ( not ( = ?auto_718575 ?auto_718578 ) ) ( not ( = ?auto_718575 ?auto_718579 ) ) ( not ( = ?auto_718575 ?auto_718580 ) ) ( not ( = ?auto_718576 ?auto_718577 ) ) ( not ( = ?auto_718576 ?auto_718578 ) ) ( not ( = ?auto_718576 ?auto_718579 ) ) ( not ( = ?auto_718576 ?auto_718580 ) ) ( not ( = ?auto_718577 ?auto_718578 ) ) ( not ( = ?auto_718577 ?auto_718579 ) ) ( not ( = ?auto_718577 ?auto_718580 ) ) ( not ( = ?auto_718578 ?auto_718579 ) ) ( not ( = ?auto_718578 ?auto_718580 ) ) ( not ( = ?auto_718579 ?auto_718580 ) ) ( CLEAR ?auto_718577 ) ( ON ?auto_718578 ?auto_718579 ) ( CLEAR ?auto_718578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_718570 ?auto_718571 ?auto_718572 ?auto_718573 ?auto_718574 ?auto_718575 ?auto_718576 ?auto_718577 ?auto_718578 )
      ( MAKE-10PILE ?auto_718570 ?auto_718571 ?auto_718572 ?auto_718573 ?auto_718574 ?auto_718575 ?auto_718576 ?auto_718577 ?auto_718578 ?auto_718579 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718612 - BLOCK
      ?auto_718613 - BLOCK
      ?auto_718614 - BLOCK
      ?auto_718615 - BLOCK
      ?auto_718616 - BLOCK
      ?auto_718617 - BLOCK
      ?auto_718618 - BLOCK
      ?auto_718619 - BLOCK
      ?auto_718620 - BLOCK
      ?auto_718621 - BLOCK
    )
    :vars
    (
      ?auto_718622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718621 ?auto_718622 ) ( ON-TABLE ?auto_718612 ) ( ON ?auto_718613 ?auto_718612 ) ( ON ?auto_718614 ?auto_718613 ) ( ON ?auto_718615 ?auto_718614 ) ( ON ?auto_718616 ?auto_718615 ) ( ON ?auto_718617 ?auto_718616 ) ( ON ?auto_718618 ?auto_718617 ) ( not ( = ?auto_718612 ?auto_718613 ) ) ( not ( = ?auto_718612 ?auto_718614 ) ) ( not ( = ?auto_718612 ?auto_718615 ) ) ( not ( = ?auto_718612 ?auto_718616 ) ) ( not ( = ?auto_718612 ?auto_718617 ) ) ( not ( = ?auto_718612 ?auto_718618 ) ) ( not ( = ?auto_718612 ?auto_718619 ) ) ( not ( = ?auto_718612 ?auto_718620 ) ) ( not ( = ?auto_718612 ?auto_718621 ) ) ( not ( = ?auto_718612 ?auto_718622 ) ) ( not ( = ?auto_718613 ?auto_718614 ) ) ( not ( = ?auto_718613 ?auto_718615 ) ) ( not ( = ?auto_718613 ?auto_718616 ) ) ( not ( = ?auto_718613 ?auto_718617 ) ) ( not ( = ?auto_718613 ?auto_718618 ) ) ( not ( = ?auto_718613 ?auto_718619 ) ) ( not ( = ?auto_718613 ?auto_718620 ) ) ( not ( = ?auto_718613 ?auto_718621 ) ) ( not ( = ?auto_718613 ?auto_718622 ) ) ( not ( = ?auto_718614 ?auto_718615 ) ) ( not ( = ?auto_718614 ?auto_718616 ) ) ( not ( = ?auto_718614 ?auto_718617 ) ) ( not ( = ?auto_718614 ?auto_718618 ) ) ( not ( = ?auto_718614 ?auto_718619 ) ) ( not ( = ?auto_718614 ?auto_718620 ) ) ( not ( = ?auto_718614 ?auto_718621 ) ) ( not ( = ?auto_718614 ?auto_718622 ) ) ( not ( = ?auto_718615 ?auto_718616 ) ) ( not ( = ?auto_718615 ?auto_718617 ) ) ( not ( = ?auto_718615 ?auto_718618 ) ) ( not ( = ?auto_718615 ?auto_718619 ) ) ( not ( = ?auto_718615 ?auto_718620 ) ) ( not ( = ?auto_718615 ?auto_718621 ) ) ( not ( = ?auto_718615 ?auto_718622 ) ) ( not ( = ?auto_718616 ?auto_718617 ) ) ( not ( = ?auto_718616 ?auto_718618 ) ) ( not ( = ?auto_718616 ?auto_718619 ) ) ( not ( = ?auto_718616 ?auto_718620 ) ) ( not ( = ?auto_718616 ?auto_718621 ) ) ( not ( = ?auto_718616 ?auto_718622 ) ) ( not ( = ?auto_718617 ?auto_718618 ) ) ( not ( = ?auto_718617 ?auto_718619 ) ) ( not ( = ?auto_718617 ?auto_718620 ) ) ( not ( = ?auto_718617 ?auto_718621 ) ) ( not ( = ?auto_718617 ?auto_718622 ) ) ( not ( = ?auto_718618 ?auto_718619 ) ) ( not ( = ?auto_718618 ?auto_718620 ) ) ( not ( = ?auto_718618 ?auto_718621 ) ) ( not ( = ?auto_718618 ?auto_718622 ) ) ( not ( = ?auto_718619 ?auto_718620 ) ) ( not ( = ?auto_718619 ?auto_718621 ) ) ( not ( = ?auto_718619 ?auto_718622 ) ) ( not ( = ?auto_718620 ?auto_718621 ) ) ( not ( = ?auto_718620 ?auto_718622 ) ) ( not ( = ?auto_718621 ?auto_718622 ) ) ( ON ?auto_718620 ?auto_718621 ) ( CLEAR ?auto_718618 ) ( ON ?auto_718619 ?auto_718620 ) ( CLEAR ?auto_718619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_718612 ?auto_718613 ?auto_718614 ?auto_718615 ?auto_718616 ?auto_718617 ?auto_718618 ?auto_718619 )
      ( MAKE-10PILE ?auto_718612 ?auto_718613 ?auto_718614 ?auto_718615 ?auto_718616 ?auto_718617 ?auto_718618 ?auto_718619 ?auto_718620 ?auto_718621 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718654 - BLOCK
      ?auto_718655 - BLOCK
      ?auto_718656 - BLOCK
      ?auto_718657 - BLOCK
      ?auto_718658 - BLOCK
      ?auto_718659 - BLOCK
      ?auto_718660 - BLOCK
      ?auto_718661 - BLOCK
      ?auto_718662 - BLOCK
      ?auto_718663 - BLOCK
    )
    :vars
    (
      ?auto_718664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718663 ?auto_718664 ) ( ON-TABLE ?auto_718654 ) ( ON ?auto_718655 ?auto_718654 ) ( ON ?auto_718656 ?auto_718655 ) ( ON ?auto_718657 ?auto_718656 ) ( ON ?auto_718658 ?auto_718657 ) ( ON ?auto_718659 ?auto_718658 ) ( not ( = ?auto_718654 ?auto_718655 ) ) ( not ( = ?auto_718654 ?auto_718656 ) ) ( not ( = ?auto_718654 ?auto_718657 ) ) ( not ( = ?auto_718654 ?auto_718658 ) ) ( not ( = ?auto_718654 ?auto_718659 ) ) ( not ( = ?auto_718654 ?auto_718660 ) ) ( not ( = ?auto_718654 ?auto_718661 ) ) ( not ( = ?auto_718654 ?auto_718662 ) ) ( not ( = ?auto_718654 ?auto_718663 ) ) ( not ( = ?auto_718654 ?auto_718664 ) ) ( not ( = ?auto_718655 ?auto_718656 ) ) ( not ( = ?auto_718655 ?auto_718657 ) ) ( not ( = ?auto_718655 ?auto_718658 ) ) ( not ( = ?auto_718655 ?auto_718659 ) ) ( not ( = ?auto_718655 ?auto_718660 ) ) ( not ( = ?auto_718655 ?auto_718661 ) ) ( not ( = ?auto_718655 ?auto_718662 ) ) ( not ( = ?auto_718655 ?auto_718663 ) ) ( not ( = ?auto_718655 ?auto_718664 ) ) ( not ( = ?auto_718656 ?auto_718657 ) ) ( not ( = ?auto_718656 ?auto_718658 ) ) ( not ( = ?auto_718656 ?auto_718659 ) ) ( not ( = ?auto_718656 ?auto_718660 ) ) ( not ( = ?auto_718656 ?auto_718661 ) ) ( not ( = ?auto_718656 ?auto_718662 ) ) ( not ( = ?auto_718656 ?auto_718663 ) ) ( not ( = ?auto_718656 ?auto_718664 ) ) ( not ( = ?auto_718657 ?auto_718658 ) ) ( not ( = ?auto_718657 ?auto_718659 ) ) ( not ( = ?auto_718657 ?auto_718660 ) ) ( not ( = ?auto_718657 ?auto_718661 ) ) ( not ( = ?auto_718657 ?auto_718662 ) ) ( not ( = ?auto_718657 ?auto_718663 ) ) ( not ( = ?auto_718657 ?auto_718664 ) ) ( not ( = ?auto_718658 ?auto_718659 ) ) ( not ( = ?auto_718658 ?auto_718660 ) ) ( not ( = ?auto_718658 ?auto_718661 ) ) ( not ( = ?auto_718658 ?auto_718662 ) ) ( not ( = ?auto_718658 ?auto_718663 ) ) ( not ( = ?auto_718658 ?auto_718664 ) ) ( not ( = ?auto_718659 ?auto_718660 ) ) ( not ( = ?auto_718659 ?auto_718661 ) ) ( not ( = ?auto_718659 ?auto_718662 ) ) ( not ( = ?auto_718659 ?auto_718663 ) ) ( not ( = ?auto_718659 ?auto_718664 ) ) ( not ( = ?auto_718660 ?auto_718661 ) ) ( not ( = ?auto_718660 ?auto_718662 ) ) ( not ( = ?auto_718660 ?auto_718663 ) ) ( not ( = ?auto_718660 ?auto_718664 ) ) ( not ( = ?auto_718661 ?auto_718662 ) ) ( not ( = ?auto_718661 ?auto_718663 ) ) ( not ( = ?auto_718661 ?auto_718664 ) ) ( not ( = ?auto_718662 ?auto_718663 ) ) ( not ( = ?auto_718662 ?auto_718664 ) ) ( not ( = ?auto_718663 ?auto_718664 ) ) ( ON ?auto_718662 ?auto_718663 ) ( ON ?auto_718661 ?auto_718662 ) ( CLEAR ?auto_718659 ) ( ON ?auto_718660 ?auto_718661 ) ( CLEAR ?auto_718660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_718654 ?auto_718655 ?auto_718656 ?auto_718657 ?auto_718658 ?auto_718659 ?auto_718660 )
      ( MAKE-10PILE ?auto_718654 ?auto_718655 ?auto_718656 ?auto_718657 ?auto_718658 ?auto_718659 ?auto_718660 ?auto_718661 ?auto_718662 ?auto_718663 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718696 - BLOCK
      ?auto_718697 - BLOCK
      ?auto_718698 - BLOCK
      ?auto_718699 - BLOCK
      ?auto_718700 - BLOCK
      ?auto_718701 - BLOCK
      ?auto_718702 - BLOCK
      ?auto_718703 - BLOCK
      ?auto_718704 - BLOCK
      ?auto_718705 - BLOCK
    )
    :vars
    (
      ?auto_718706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718705 ?auto_718706 ) ( ON-TABLE ?auto_718696 ) ( ON ?auto_718697 ?auto_718696 ) ( ON ?auto_718698 ?auto_718697 ) ( ON ?auto_718699 ?auto_718698 ) ( ON ?auto_718700 ?auto_718699 ) ( not ( = ?auto_718696 ?auto_718697 ) ) ( not ( = ?auto_718696 ?auto_718698 ) ) ( not ( = ?auto_718696 ?auto_718699 ) ) ( not ( = ?auto_718696 ?auto_718700 ) ) ( not ( = ?auto_718696 ?auto_718701 ) ) ( not ( = ?auto_718696 ?auto_718702 ) ) ( not ( = ?auto_718696 ?auto_718703 ) ) ( not ( = ?auto_718696 ?auto_718704 ) ) ( not ( = ?auto_718696 ?auto_718705 ) ) ( not ( = ?auto_718696 ?auto_718706 ) ) ( not ( = ?auto_718697 ?auto_718698 ) ) ( not ( = ?auto_718697 ?auto_718699 ) ) ( not ( = ?auto_718697 ?auto_718700 ) ) ( not ( = ?auto_718697 ?auto_718701 ) ) ( not ( = ?auto_718697 ?auto_718702 ) ) ( not ( = ?auto_718697 ?auto_718703 ) ) ( not ( = ?auto_718697 ?auto_718704 ) ) ( not ( = ?auto_718697 ?auto_718705 ) ) ( not ( = ?auto_718697 ?auto_718706 ) ) ( not ( = ?auto_718698 ?auto_718699 ) ) ( not ( = ?auto_718698 ?auto_718700 ) ) ( not ( = ?auto_718698 ?auto_718701 ) ) ( not ( = ?auto_718698 ?auto_718702 ) ) ( not ( = ?auto_718698 ?auto_718703 ) ) ( not ( = ?auto_718698 ?auto_718704 ) ) ( not ( = ?auto_718698 ?auto_718705 ) ) ( not ( = ?auto_718698 ?auto_718706 ) ) ( not ( = ?auto_718699 ?auto_718700 ) ) ( not ( = ?auto_718699 ?auto_718701 ) ) ( not ( = ?auto_718699 ?auto_718702 ) ) ( not ( = ?auto_718699 ?auto_718703 ) ) ( not ( = ?auto_718699 ?auto_718704 ) ) ( not ( = ?auto_718699 ?auto_718705 ) ) ( not ( = ?auto_718699 ?auto_718706 ) ) ( not ( = ?auto_718700 ?auto_718701 ) ) ( not ( = ?auto_718700 ?auto_718702 ) ) ( not ( = ?auto_718700 ?auto_718703 ) ) ( not ( = ?auto_718700 ?auto_718704 ) ) ( not ( = ?auto_718700 ?auto_718705 ) ) ( not ( = ?auto_718700 ?auto_718706 ) ) ( not ( = ?auto_718701 ?auto_718702 ) ) ( not ( = ?auto_718701 ?auto_718703 ) ) ( not ( = ?auto_718701 ?auto_718704 ) ) ( not ( = ?auto_718701 ?auto_718705 ) ) ( not ( = ?auto_718701 ?auto_718706 ) ) ( not ( = ?auto_718702 ?auto_718703 ) ) ( not ( = ?auto_718702 ?auto_718704 ) ) ( not ( = ?auto_718702 ?auto_718705 ) ) ( not ( = ?auto_718702 ?auto_718706 ) ) ( not ( = ?auto_718703 ?auto_718704 ) ) ( not ( = ?auto_718703 ?auto_718705 ) ) ( not ( = ?auto_718703 ?auto_718706 ) ) ( not ( = ?auto_718704 ?auto_718705 ) ) ( not ( = ?auto_718704 ?auto_718706 ) ) ( not ( = ?auto_718705 ?auto_718706 ) ) ( ON ?auto_718704 ?auto_718705 ) ( ON ?auto_718703 ?auto_718704 ) ( ON ?auto_718702 ?auto_718703 ) ( CLEAR ?auto_718700 ) ( ON ?auto_718701 ?auto_718702 ) ( CLEAR ?auto_718701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_718696 ?auto_718697 ?auto_718698 ?auto_718699 ?auto_718700 ?auto_718701 )
      ( MAKE-10PILE ?auto_718696 ?auto_718697 ?auto_718698 ?auto_718699 ?auto_718700 ?auto_718701 ?auto_718702 ?auto_718703 ?auto_718704 ?auto_718705 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718738 - BLOCK
      ?auto_718739 - BLOCK
      ?auto_718740 - BLOCK
      ?auto_718741 - BLOCK
      ?auto_718742 - BLOCK
      ?auto_718743 - BLOCK
      ?auto_718744 - BLOCK
      ?auto_718745 - BLOCK
      ?auto_718746 - BLOCK
      ?auto_718747 - BLOCK
    )
    :vars
    (
      ?auto_718748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718747 ?auto_718748 ) ( ON-TABLE ?auto_718738 ) ( ON ?auto_718739 ?auto_718738 ) ( ON ?auto_718740 ?auto_718739 ) ( ON ?auto_718741 ?auto_718740 ) ( not ( = ?auto_718738 ?auto_718739 ) ) ( not ( = ?auto_718738 ?auto_718740 ) ) ( not ( = ?auto_718738 ?auto_718741 ) ) ( not ( = ?auto_718738 ?auto_718742 ) ) ( not ( = ?auto_718738 ?auto_718743 ) ) ( not ( = ?auto_718738 ?auto_718744 ) ) ( not ( = ?auto_718738 ?auto_718745 ) ) ( not ( = ?auto_718738 ?auto_718746 ) ) ( not ( = ?auto_718738 ?auto_718747 ) ) ( not ( = ?auto_718738 ?auto_718748 ) ) ( not ( = ?auto_718739 ?auto_718740 ) ) ( not ( = ?auto_718739 ?auto_718741 ) ) ( not ( = ?auto_718739 ?auto_718742 ) ) ( not ( = ?auto_718739 ?auto_718743 ) ) ( not ( = ?auto_718739 ?auto_718744 ) ) ( not ( = ?auto_718739 ?auto_718745 ) ) ( not ( = ?auto_718739 ?auto_718746 ) ) ( not ( = ?auto_718739 ?auto_718747 ) ) ( not ( = ?auto_718739 ?auto_718748 ) ) ( not ( = ?auto_718740 ?auto_718741 ) ) ( not ( = ?auto_718740 ?auto_718742 ) ) ( not ( = ?auto_718740 ?auto_718743 ) ) ( not ( = ?auto_718740 ?auto_718744 ) ) ( not ( = ?auto_718740 ?auto_718745 ) ) ( not ( = ?auto_718740 ?auto_718746 ) ) ( not ( = ?auto_718740 ?auto_718747 ) ) ( not ( = ?auto_718740 ?auto_718748 ) ) ( not ( = ?auto_718741 ?auto_718742 ) ) ( not ( = ?auto_718741 ?auto_718743 ) ) ( not ( = ?auto_718741 ?auto_718744 ) ) ( not ( = ?auto_718741 ?auto_718745 ) ) ( not ( = ?auto_718741 ?auto_718746 ) ) ( not ( = ?auto_718741 ?auto_718747 ) ) ( not ( = ?auto_718741 ?auto_718748 ) ) ( not ( = ?auto_718742 ?auto_718743 ) ) ( not ( = ?auto_718742 ?auto_718744 ) ) ( not ( = ?auto_718742 ?auto_718745 ) ) ( not ( = ?auto_718742 ?auto_718746 ) ) ( not ( = ?auto_718742 ?auto_718747 ) ) ( not ( = ?auto_718742 ?auto_718748 ) ) ( not ( = ?auto_718743 ?auto_718744 ) ) ( not ( = ?auto_718743 ?auto_718745 ) ) ( not ( = ?auto_718743 ?auto_718746 ) ) ( not ( = ?auto_718743 ?auto_718747 ) ) ( not ( = ?auto_718743 ?auto_718748 ) ) ( not ( = ?auto_718744 ?auto_718745 ) ) ( not ( = ?auto_718744 ?auto_718746 ) ) ( not ( = ?auto_718744 ?auto_718747 ) ) ( not ( = ?auto_718744 ?auto_718748 ) ) ( not ( = ?auto_718745 ?auto_718746 ) ) ( not ( = ?auto_718745 ?auto_718747 ) ) ( not ( = ?auto_718745 ?auto_718748 ) ) ( not ( = ?auto_718746 ?auto_718747 ) ) ( not ( = ?auto_718746 ?auto_718748 ) ) ( not ( = ?auto_718747 ?auto_718748 ) ) ( ON ?auto_718746 ?auto_718747 ) ( ON ?auto_718745 ?auto_718746 ) ( ON ?auto_718744 ?auto_718745 ) ( ON ?auto_718743 ?auto_718744 ) ( CLEAR ?auto_718741 ) ( ON ?auto_718742 ?auto_718743 ) ( CLEAR ?auto_718742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_718738 ?auto_718739 ?auto_718740 ?auto_718741 ?auto_718742 )
      ( MAKE-10PILE ?auto_718738 ?auto_718739 ?auto_718740 ?auto_718741 ?auto_718742 ?auto_718743 ?auto_718744 ?auto_718745 ?auto_718746 ?auto_718747 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718780 - BLOCK
      ?auto_718781 - BLOCK
      ?auto_718782 - BLOCK
      ?auto_718783 - BLOCK
      ?auto_718784 - BLOCK
      ?auto_718785 - BLOCK
      ?auto_718786 - BLOCK
      ?auto_718787 - BLOCK
      ?auto_718788 - BLOCK
      ?auto_718789 - BLOCK
    )
    :vars
    (
      ?auto_718790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718789 ?auto_718790 ) ( ON-TABLE ?auto_718780 ) ( ON ?auto_718781 ?auto_718780 ) ( ON ?auto_718782 ?auto_718781 ) ( not ( = ?auto_718780 ?auto_718781 ) ) ( not ( = ?auto_718780 ?auto_718782 ) ) ( not ( = ?auto_718780 ?auto_718783 ) ) ( not ( = ?auto_718780 ?auto_718784 ) ) ( not ( = ?auto_718780 ?auto_718785 ) ) ( not ( = ?auto_718780 ?auto_718786 ) ) ( not ( = ?auto_718780 ?auto_718787 ) ) ( not ( = ?auto_718780 ?auto_718788 ) ) ( not ( = ?auto_718780 ?auto_718789 ) ) ( not ( = ?auto_718780 ?auto_718790 ) ) ( not ( = ?auto_718781 ?auto_718782 ) ) ( not ( = ?auto_718781 ?auto_718783 ) ) ( not ( = ?auto_718781 ?auto_718784 ) ) ( not ( = ?auto_718781 ?auto_718785 ) ) ( not ( = ?auto_718781 ?auto_718786 ) ) ( not ( = ?auto_718781 ?auto_718787 ) ) ( not ( = ?auto_718781 ?auto_718788 ) ) ( not ( = ?auto_718781 ?auto_718789 ) ) ( not ( = ?auto_718781 ?auto_718790 ) ) ( not ( = ?auto_718782 ?auto_718783 ) ) ( not ( = ?auto_718782 ?auto_718784 ) ) ( not ( = ?auto_718782 ?auto_718785 ) ) ( not ( = ?auto_718782 ?auto_718786 ) ) ( not ( = ?auto_718782 ?auto_718787 ) ) ( not ( = ?auto_718782 ?auto_718788 ) ) ( not ( = ?auto_718782 ?auto_718789 ) ) ( not ( = ?auto_718782 ?auto_718790 ) ) ( not ( = ?auto_718783 ?auto_718784 ) ) ( not ( = ?auto_718783 ?auto_718785 ) ) ( not ( = ?auto_718783 ?auto_718786 ) ) ( not ( = ?auto_718783 ?auto_718787 ) ) ( not ( = ?auto_718783 ?auto_718788 ) ) ( not ( = ?auto_718783 ?auto_718789 ) ) ( not ( = ?auto_718783 ?auto_718790 ) ) ( not ( = ?auto_718784 ?auto_718785 ) ) ( not ( = ?auto_718784 ?auto_718786 ) ) ( not ( = ?auto_718784 ?auto_718787 ) ) ( not ( = ?auto_718784 ?auto_718788 ) ) ( not ( = ?auto_718784 ?auto_718789 ) ) ( not ( = ?auto_718784 ?auto_718790 ) ) ( not ( = ?auto_718785 ?auto_718786 ) ) ( not ( = ?auto_718785 ?auto_718787 ) ) ( not ( = ?auto_718785 ?auto_718788 ) ) ( not ( = ?auto_718785 ?auto_718789 ) ) ( not ( = ?auto_718785 ?auto_718790 ) ) ( not ( = ?auto_718786 ?auto_718787 ) ) ( not ( = ?auto_718786 ?auto_718788 ) ) ( not ( = ?auto_718786 ?auto_718789 ) ) ( not ( = ?auto_718786 ?auto_718790 ) ) ( not ( = ?auto_718787 ?auto_718788 ) ) ( not ( = ?auto_718787 ?auto_718789 ) ) ( not ( = ?auto_718787 ?auto_718790 ) ) ( not ( = ?auto_718788 ?auto_718789 ) ) ( not ( = ?auto_718788 ?auto_718790 ) ) ( not ( = ?auto_718789 ?auto_718790 ) ) ( ON ?auto_718788 ?auto_718789 ) ( ON ?auto_718787 ?auto_718788 ) ( ON ?auto_718786 ?auto_718787 ) ( ON ?auto_718785 ?auto_718786 ) ( ON ?auto_718784 ?auto_718785 ) ( CLEAR ?auto_718782 ) ( ON ?auto_718783 ?auto_718784 ) ( CLEAR ?auto_718783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_718780 ?auto_718781 ?auto_718782 ?auto_718783 )
      ( MAKE-10PILE ?auto_718780 ?auto_718781 ?auto_718782 ?auto_718783 ?auto_718784 ?auto_718785 ?auto_718786 ?auto_718787 ?auto_718788 ?auto_718789 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718822 - BLOCK
      ?auto_718823 - BLOCK
      ?auto_718824 - BLOCK
      ?auto_718825 - BLOCK
      ?auto_718826 - BLOCK
      ?auto_718827 - BLOCK
      ?auto_718828 - BLOCK
      ?auto_718829 - BLOCK
      ?auto_718830 - BLOCK
      ?auto_718831 - BLOCK
    )
    :vars
    (
      ?auto_718832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718831 ?auto_718832 ) ( ON-TABLE ?auto_718822 ) ( ON ?auto_718823 ?auto_718822 ) ( not ( = ?auto_718822 ?auto_718823 ) ) ( not ( = ?auto_718822 ?auto_718824 ) ) ( not ( = ?auto_718822 ?auto_718825 ) ) ( not ( = ?auto_718822 ?auto_718826 ) ) ( not ( = ?auto_718822 ?auto_718827 ) ) ( not ( = ?auto_718822 ?auto_718828 ) ) ( not ( = ?auto_718822 ?auto_718829 ) ) ( not ( = ?auto_718822 ?auto_718830 ) ) ( not ( = ?auto_718822 ?auto_718831 ) ) ( not ( = ?auto_718822 ?auto_718832 ) ) ( not ( = ?auto_718823 ?auto_718824 ) ) ( not ( = ?auto_718823 ?auto_718825 ) ) ( not ( = ?auto_718823 ?auto_718826 ) ) ( not ( = ?auto_718823 ?auto_718827 ) ) ( not ( = ?auto_718823 ?auto_718828 ) ) ( not ( = ?auto_718823 ?auto_718829 ) ) ( not ( = ?auto_718823 ?auto_718830 ) ) ( not ( = ?auto_718823 ?auto_718831 ) ) ( not ( = ?auto_718823 ?auto_718832 ) ) ( not ( = ?auto_718824 ?auto_718825 ) ) ( not ( = ?auto_718824 ?auto_718826 ) ) ( not ( = ?auto_718824 ?auto_718827 ) ) ( not ( = ?auto_718824 ?auto_718828 ) ) ( not ( = ?auto_718824 ?auto_718829 ) ) ( not ( = ?auto_718824 ?auto_718830 ) ) ( not ( = ?auto_718824 ?auto_718831 ) ) ( not ( = ?auto_718824 ?auto_718832 ) ) ( not ( = ?auto_718825 ?auto_718826 ) ) ( not ( = ?auto_718825 ?auto_718827 ) ) ( not ( = ?auto_718825 ?auto_718828 ) ) ( not ( = ?auto_718825 ?auto_718829 ) ) ( not ( = ?auto_718825 ?auto_718830 ) ) ( not ( = ?auto_718825 ?auto_718831 ) ) ( not ( = ?auto_718825 ?auto_718832 ) ) ( not ( = ?auto_718826 ?auto_718827 ) ) ( not ( = ?auto_718826 ?auto_718828 ) ) ( not ( = ?auto_718826 ?auto_718829 ) ) ( not ( = ?auto_718826 ?auto_718830 ) ) ( not ( = ?auto_718826 ?auto_718831 ) ) ( not ( = ?auto_718826 ?auto_718832 ) ) ( not ( = ?auto_718827 ?auto_718828 ) ) ( not ( = ?auto_718827 ?auto_718829 ) ) ( not ( = ?auto_718827 ?auto_718830 ) ) ( not ( = ?auto_718827 ?auto_718831 ) ) ( not ( = ?auto_718827 ?auto_718832 ) ) ( not ( = ?auto_718828 ?auto_718829 ) ) ( not ( = ?auto_718828 ?auto_718830 ) ) ( not ( = ?auto_718828 ?auto_718831 ) ) ( not ( = ?auto_718828 ?auto_718832 ) ) ( not ( = ?auto_718829 ?auto_718830 ) ) ( not ( = ?auto_718829 ?auto_718831 ) ) ( not ( = ?auto_718829 ?auto_718832 ) ) ( not ( = ?auto_718830 ?auto_718831 ) ) ( not ( = ?auto_718830 ?auto_718832 ) ) ( not ( = ?auto_718831 ?auto_718832 ) ) ( ON ?auto_718830 ?auto_718831 ) ( ON ?auto_718829 ?auto_718830 ) ( ON ?auto_718828 ?auto_718829 ) ( ON ?auto_718827 ?auto_718828 ) ( ON ?auto_718826 ?auto_718827 ) ( ON ?auto_718825 ?auto_718826 ) ( CLEAR ?auto_718823 ) ( ON ?auto_718824 ?auto_718825 ) ( CLEAR ?auto_718824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_718822 ?auto_718823 ?auto_718824 )
      ( MAKE-10PILE ?auto_718822 ?auto_718823 ?auto_718824 ?auto_718825 ?auto_718826 ?auto_718827 ?auto_718828 ?auto_718829 ?auto_718830 ?auto_718831 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718864 - BLOCK
      ?auto_718865 - BLOCK
      ?auto_718866 - BLOCK
      ?auto_718867 - BLOCK
      ?auto_718868 - BLOCK
      ?auto_718869 - BLOCK
      ?auto_718870 - BLOCK
      ?auto_718871 - BLOCK
      ?auto_718872 - BLOCK
      ?auto_718873 - BLOCK
    )
    :vars
    (
      ?auto_718874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718873 ?auto_718874 ) ( ON-TABLE ?auto_718864 ) ( not ( = ?auto_718864 ?auto_718865 ) ) ( not ( = ?auto_718864 ?auto_718866 ) ) ( not ( = ?auto_718864 ?auto_718867 ) ) ( not ( = ?auto_718864 ?auto_718868 ) ) ( not ( = ?auto_718864 ?auto_718869 ) ) ( not ( = ?auto_718864 ?auto_718870 ) ) ( not ( = ?auto_718864 ?auto_718871 ) ) ( not ( = ?auto_718864 ?auto_718872 ) ) ( not ( = ?auto_718864 ?auto_718873 ) ) ( not ( = ?auto_718864 ?auto_718874 ) ) ( not ( = ?auto_718865 ?auto_718866 ) ) ( not ( = ?auto_718865 ?auto_718867 ) ) ( not ( = ?auto_718865 ?auto_718868 ) ) ( not ( = ?auto_718865 ?auto_718869 ) ) ( not ( = ?auto_718865 ?auto_718870 ) ) ( not ( = ?auto_718865 ?auto_718871 ) ) ( not ( = ?auto_718865 ?auto_718872 ) ) ( not ( = ?auto_718865 ?auto_718873 ) ) ( not ( = ?auto_718865 ?auto_718874 ) ) ( not ( = ?auto_718866 ?auto_718867 ) ) ( not ( = ?auto_718866 ?auto_718868 ) ) ( not ( = ?auto_718866 ?auto_718869 ) ) ( not ( = ?auto_718866 ?auto_718870 ) ) ( not ( = ?auto_718866 ?auto_718871 ) ) ( not ( = ?auto_718866 ?auto_718872 ) ) ( not ( = ?auto_718866 ?auto_718873 ) ) ( not ( = ?auto_718866 ?auto_718874 ) ) ( not ( = ?auto_718867 ?auto_718868 ) ) ( not ( = ?auto_718867 ?auto_718869 ) ) ( not ( = ?auto_718867 ?auto_718870 ) ) ( not ( = ?auto_718867 ?auto_718871 ) ) ( not ( = ?auto_718867 ?auto_718872 ) ) ( not ( = ?auto_718867 ?auto_718873 ) ) ( not ( = ?auto_718867 ?auto_718874 ) ) ( not ( = ?auto_718868 ?auto_718869 ) ) ( not ( = ?auto_718868 ?auto_718870 ) ) ( not ( = ?auto_718868 ?auto_718871 ) ) ( not ( = ?auto_718868 ?auto_718872 ) ) ( not ( = ?auto_718868 ?auto_718873 ) ) ( not ( = ?auto_718868 ?auto_718874 ) ) ( not ( = ?auto_718869 ?auto_718870 ) ) ( not ( = ?auto_718869 ?auto_718871 ) ) ( not ( = ?auto_718869 ?auto_718872 ) ) ( not ( = ?auto_718869 ?auto_718873 ) ) ( not ( = ?auto_718869 ?auto_718874 ) ) ( not ( = ?auto_718870 ?auto_718871 ) ) ( not ( = ?auto_718870 ?auto_718872 ) ) ( not ( = ?auto_718870 ?auto_718873 ) ) ( not ( = ?auto_718870 ?auto_718874 ) ) ( not ( = ?auto_718871 ?auto_718872 ) ) ( not ( = ?auto_718871 ?auto_718873 ) ) ( not ( = ?auto_718871 ?auto_718874 ) ) ( not ( = ?auto_718872 ?auto_718873 ) ) ( not ( = ?auto_718872 ?auto_718874 ) ) ( not ( = ?auto_718873 ?auto_718874 ) ) ( ON ?auto_718872 ?auto_718873 ) ( ON ?auto_718871 ?auto_718872 ) ( ON ?auto_718870 ?auto_718871 ) ( ON ?auto_718869 ?auto_718870 ) ( ON ?auto_718868 ?auto_718869 ) ( ON ?auto_718867 ?auto_718868 ) ( ON ?auto_718866 ?auto_718867 ) ( CLEAR ?auto_718864 ) ( ON ?auto_718865 ?auto_718866 ) ( CLEAR ?auto_718865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_718864 ?auto_718865 )
      ( MAKE-10PILE ?auto_718864 ?auto_718865 ?auto_718866 ?auto_718867 ?auto_718868 ?auto_718869 ?auto_718870 ?auto_718871 ?auto_718872 ?auto_718873 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_718906 - BLOCK
      ?auto_718907 - BLOCK
      ?auto_718908 - BLOCK
      ?auto_718909 - BLOCK
      ?auto_718910 - BLOCK
      ?auto_718911 - BLOCK
      ?auto_718912 - BLOCK
      ?auto_718913 - BLOCK
      ?auto_718914 - BLOCK
      ?auto_718915 - BLOCK
    )
    :vars
    (
      ?auto_718916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_718915 ?auto_718916 ) ( not ( = ?auto_718906 ?auto_718907 ) ) ( not ( = ?auto_718906 ?auto_718908 ) ) ( not ( = ?auto_718906 ?auto_718909 ) ) ( not ( = ?auto_718906 ?auto_718910 ) ) ( not ( = ?auto_718906 ?auto_718911 ) ) ( not ( = ?auto_718906 ?auto_718912 ) ) ( not ( = ?auto_718906 ?auto_718913 ) ) ( not ( = ?auto_718906 ?auto_718914 ) ) ( not ( = ?auto_718906 ?auto_718915 ) ) ( not ( = ?auto_718906 ?auto_718916 ) ) ( not ( = ?auto_718907 ?auto_718908 ) ) ( not ( = ?auto_718907 ?auto_718909 ) ) ( not ( = ?auto_718907 ?auto_718910 ) ) ( not ( = ?auto_718907 ?auto_718911 ) ) ( not ( = ?auto_718907 ?auto_718912 ) ) ( not ( = ?auto_718907 ?auto_718913 ) ) ( not ( = ?auto_718907 ?auto_718914 ) ) ( not ( = ?auto_718907 ?auto_718915 ) ) ( not ( = ?auto_718907 ?auto_718916 ) ) ( not ( = ?auto_718908 ?auto_718909 ) ) ( not ( = ?auto_718908 ?auto_718910 ) ) ( not ( = ?auto_718908 ?auto_718911 ) ) ( not ( = ?auto_718908 ?auto_718912 ) ) ( not ( = ?auto_718908 ?auto_718913 ) ) ( not ( = ?auto_718908 ?auto_718914 ) ) ( not ( = ?auto_718908 ?auto_718915 ) ) ( not ( = ?auto_718908 ?auto_718916 ) ) ( not ( = ?auto_718909 ?auto_718910 ) ) ( not ( = ?auto_718909 ?auto_718911 ) ) ( not ( = ?auto_718909 ?auto_718912 ) ) ( not ( = ?auto_718909 ?auto_718913 ) ) ( not ( = ?auto_718909 ?auto_718914 ) ) ( not ( = ?auto_718909 ?auto_718915 ) ) ( not ( = ?auto_718909 ?auto_718916 ) ) ( not ( = ?auto_718910 ?auto_718911 ) ) ( not ( = ?auto_718910 ?auto_718912 ) ) ( not ( = ?auto_718910 ?auto_718913 ) ) ( not ( = ?auto_718910 ?auto_718914 ) ) ( not ( = ?auto_718910 ?auto_718915 ) ) ( not ( = ?auto_718910 ?auto_718916 ) ) ( not ( = ?auto_718911 ?auto_718912 ) ) ( not ( = ?auto_718911 ?auto_718913 ) ) ( not ( = ?auto_718911 ?auto_718914 ) ) ( not ( = ?auto_718911 ?auto_718915 ) ) ( not ( = ?auto_718911 ?auto_718916 ) ) ( not ( = ?auto_718912 ?auto_718913 ) ) ( not ( = ?auto_718912 ?auto_718914 ) ) ( not ( = ?auto_718912 ?auto_718915 ) ) ( not ( = ?auto_718912 ?auto_718916 ) ) ( not ( = ?auto_718913 ?auto_718914 ) ) ( not ( = ?auto_718913 ?auto_718915 ) ) ( not ( = ?auto_718913 ?auto_718916 ) ) ( not ( = ?auto_718914 ?auto_718915 ) ) ( not ( = ?auto_718914 ?auto_718916 ) ) ( not ( = ?auto_718915 ?auto_718916 ) ) ( ON ?auto_718914 ?auto_718915 ) ( ON ?auto_718913 ?auto_718914 ) ( ON ?auto_718912 ?auto_718913 ) ( ON ?auto_718911 ?auto_718912 ) ( ON ?auto_718910 ?auto_718911 ) ( ON ?auto_718909 ?auto_718910 ) ( ON ?auto_718908 ?auto_718909 ) ( ON ?auto_718907 ?auto_718908 ) ( ON ?auto_718906 ?auto_718907 ) ( CLEAR ?auto_718906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_718906 )
      ( MAKE-10PILE ?auto_718906 ?auto_718907 ?auto_718908 ?auto_718909 ?auto_718910 ?auto_718911 ?auto_718912 ?auto_718913 ?auto_718914 ?auto_718915 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_718949 - BLOCK
      ?auto_718950 - BLOCK
      ?auto_718951 - BLOCK
      ?auto_718952 - BLOCK
      ?auto_718953 - BLOCK
      ?auto_718954 - BLOCK
      ?auto_718955 - BLOCK
      ?auto_718956 - BLOCK
      ?auto_718957 - BLOCK
      ?auto_718958 - BLOCK
      ?auto_718959 - BLOCK
    )
    :vars
    (
      ?auto_718960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_718958 ) ( ON ?auto_718959 ?auto_718960 ) ( CLEAR ?auto_718959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_718949 ) ( ON ?auto_718950 ?auto_718949 ) ( ON ?auto_718951 ?auto_718950 ) ( ON ?auto_718952 ?auto_718951 ) ( ON ?auto_718953 ?auto_718952 ) ( ON ?auto_718954 ?auto_718953 ) ( ON ?auto_718955 ?auto_718954 ) ( ON ?auto_718956 ?auto_718955 ) ( ON ?auto_718957 ?auto_718956 ) ( ON ?auto_718958 ?auto_718957 ) ( not ( = ?auto_718949 ?auto_718950 ) ) ( not ( = ?auto_718949 ?auto_718951 ) ) ( not ( = ?auto_718949 ?auto_718952 ) ) ( not ( = ?auto_718949 ?auto_718953 ) ) ( not ( = ?auto_718949 ?auto_718954 ) ) ( not ( = ?auto_718949 ?auto_718955 ) ) ( not ( = ?auto_718949 ?auto_718956 ) ) ( not ( = ?auto_718949 ?auto_718957 ) ) ( not ( = ?auto_718949 ?auto_718958 ) ) ( not ( = ?auto_718949 ?auto_718959 ) ) ( not ( = ?auto_718949 ?auto_718960 ) ) ( not ( = ?auto_718950 ?auto_718951 ) ) ( not ( = ?auto_718950 ?auto_718952 ) ) ( not ( = ?auto_718950 ?auto_718953 ) ) ( not ( = ?auto_718950 ?auto_718954 ) ) ( not ( = ?auto_718950 ?auto_718955 ) ) ( not ( = ?auto_718950 ?auto_718956 ) ) ( not ( = ?auto_718950 ?auto_718957 ) ) ( not ( = ?auto_718950 ?auto_718958 ) ) ( not ( = ?auto_718950 ?auto_718959 ) ) ( not ( = ?auto_718950 ?auto_718960 ) ) ( not ( = ?auto_718951 ?auto_718952 ) ) ( not ( = ?auto_718951 ?auto_718953 ) ) ( not ( = ?auto_718951 ?auto_718954 ) ) ( not ( = ?auto_718951 ?auto_718955 ) ) ( not ( = ?auto_718951 ?auto_718956 ) ) ( not ( = ?auto_718951 ?auto_718957 ) ) ( not ( = ?auto_718951 ?auto_718958 ) ) ( not ( = ?auto_718951 ?auto_718959 ) ) ( not ( = ?auto_718951 ?auto_718960 ) ) ( not ( = ?auto_718952 ?auto_718953 ) ) ( not ( = ?auto_718952 ?auto_718954 ) ) ( not ( = ?auto_718952 ?auto_718955 ) ) ( not ( = ?auto_718952 ?auto_718956 ) ) ( not ( = ?auto_718952 ?auto_718957 ) ) ( not ( = ?auto_718952 ?auto_718958 ) ) ( not ( = ?auto_718952 ?auto_718959 ) ) ( not ( = ?auto_718952 ?auto_718960 ) ) ( not ( = ?auto_718953 ?auto_718954 ) ) ( not ( = ?auto_718953 ?auto_718955 ) ) ( not ( = ?auto_718953 ?auto_718956 ) ) ( not ( = ?auto_718953 ?auto_718957 ) ) ( not ( = ?auto_718953 ?auto_718958 ) ) ( not ( = ?auto_718953 ?auto_718959 ) ) ( not ( = ?auto_718953 ?auto_718960 ) ) ( not ( = ?auto_718954 ?auto_718955 ) ) ( not ( = ?auto_718954 ?auto_718956 ) ) ( not ( = ?auto_718954 ?auto_718957 ) ) ( not ( = ?auto_718954 ?auto_718958 ) ) ( not ( = ?auto_718954 ?auto_718959 ) ) ( not ( = ?auto_718954 ?auto_718960 ) ) ( not ( = ?auto_718955 ?auto_718956 ) ) ( not ( = ?auto_718955 ?auto_718957 ) ) ( not ( = ?auto_718955 ?auto_718958 ) ) ( not ( = ?auto_718955 ?auto_718959 ) ) ( not ( = ?auto_718955 ?auto_718960 ) ) ( not ( = ?auto_718956 ?auto_718957 ) ) ( not ( = ?auto_718956 ?auto_718958 ) ) ( not ( = ?auto_718956 ?auto_718959 ) ) ( not ( = ?auto_718956 ?auto_718960 ) ) ( not ( = ?auto_718957 ?auto_718958 ) ) ( not ( = ?auto_718957 ?auto_718959 ) ) ( not ( = ?auto_718957 ?auto_718960 ) ) ( not ( = ?auto_718958 ?auto_718959 ) ) ( not ( = ?auto_718958 ?auto_718960 ) ) ( not ( = ?auto_718959 ?auto_718960 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_718959 ?auto_718960 )
      ( !STACK ?auto_718959 ?auto_718958 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_718995 - BLOCK
      ?auto_718996 - BLOCK
      ?auto_718997 - BLOCK
      ?auto_718998 - BLOCK
      ?auto_718999 - BLOCK
      ?auto_719000 - BLOCK
      ?auto_719001 - BLOCK
      ?auto_719002 - BLOCK
      ?auto_719003 - BLOCK
      ?auto_719004 - BLOCK
      ?auto_719005 - BLOCK
    )
    :vars
    (
      ?auto_719006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719005 ?auto_719006 ) ( ON-TABLE ?auto_718995 ) ( ON ?auto_718996 ?auto_718995 ) ( ON ?auto_718997 ?auto_718996 ) ( ON ?auto_718998 ?auto_718997 ) ( ON ?auto_718999 ?auto_718998 ) ( ON ?auto_719000 ?auto_718999 ) ( ON ?auto_719001 ?auto_719000 ) ( ON ?auto_719002 ?auto_719001 ) ( ON ?auto_719003 ?auto_719002 ) ( not ( = ?auto_718995 ?auto_718996 ) ) ( not ( = ?auto_718995 ?auto_718997 ) ) ( not ( = ?auto_718995 ?auto_718998 ) ) ( not ( = ?auto_718995 ?auto_718999 ) ) ( not ( = ?auto_718995 ?auto_719000 ) ) ( not ( = ?auto_718995 ?auto_719001 ) ) ( not ( = ?auto_718995 ?auto_719002 ) ) ( not ( = ?auto_718995 ?auto_719003 ) ) ( not ( = ?auto_718995 ?auto_719004 ) ) ( not ( = ?auto_718995 ?auto_719005 ) ) ( not ( = ?auto_718995 ?auto_719006 ) ) ( not ( = ?auto_718996 ?auto_718997 ) ) ( not ( = ?auto_718996 ?auto_718998 ) ) ( not ( = ?auto_718996 ?auto_718999 ) ) ( not ( = ?auto_718996 ?auto_719000 ) ) ( not ( = ?auto_718996 ?auto_719001 ) ) ( not ( = ?auto_718996 ?auto_719002 ) ) ( not ( = ?auto_718996 ?auto_719003 ) ) ( not ( = ?auto_718996 ?auto_719004 ) ) ( not ( = ?auto_718996 ?auto_719005 ) ) ( not ( = ?auto_718996 ?auto_719006 ) ) ( not ( = ?auto_718997 ?auto_718998 ) ) ( not ( = ?auto_718997 ?auto_718999 ) ) ( not ( = ?auto_718997 ?auto_719000 ) ) ( not ( = ?auto_718997 ?auto_719001 ) ) ( not ( = ?auto_718997 ?auto_719002 ) ) ( not ( = ?auto_718997 ?auto_719003 ) ) ( not ( = ?auto_718997 ?auto_719004 ) ) ( not ( = ?auto_718997 ?auto_719005 ) ) ( not ( = ?auto_718997 ?auto_719006 ) ) ( not ( = ?auto_718998 ?auto_718999 ) ) ( not ( = ?auto_718998 ?auto_719000 ) ) ( not ( = ?auto_718998 ?auto_719001 ) ) ( not ( = ?auto_718998 ?auto_719002 ) ) ( not ( = ?auto_718998 ?auto_719003 ) ) ( not ( = ?auto_718998 ?auto_719004 ) ) ( not ( = ?auto_718998 ?auto_719005 ) ) ( not ( = ?auto_718998 ?auto_719006 ) ) ( not ( = ?auto_718999 ?auto_719000 ) ) ( not ( = ?auto_718999 ?auto_719001 ) ) ( not ( = ?auto_718999 ?auto_719002 ) ) ( not ( = ?auto_718999 ?auto_719003 ) ) ( not ( = ?auto_718999 ?auto_719004 ) ) ( not ( = ?auto_718999 ?auto_719005 ) ) ( not ( = ?auto_718999 ?auto_719006 ) ) ( not ( = ?auto_719000 ?auto_719001 ) ) ( not ( = ?auto_719000 ?auto_719002 ) ) ( not ( = ?auto_719000 ?auto_719003 ) ) ( not ( = ?auto_719000 ?auto_719004 ) ) ( not ( = ?auto_719000 ?auto_719005 ) ) ( not ( = ?auto_719000 ?auto_719006 ) ) ( not ( = ?auto_719001 ?auto_719002 ) ) ( not ( = ?auto_719001 ?auto_719003 ) ) ( not ( = ?auto_719001 ?auto_719004 ) ) ( not ( = ?auto_719001 ?auto_719005 ) ) ( not ( = ?auto_719001 ?auto_719006 ) ) ( not ( = ?auto_719002 ?auto_719003 ) ) ( not ( = ?auto_719002 ?auto_719004 ) ) ( not ( = ?auto_719002 ?auto_719005 ) ) ( not ( = ?auto_719002 ?auto_719006 ) ) ( not ( = ?auto_719003 ?auto_719004 ) ) ( not ( = ?auto_719003 ?auto_719005 ) ) ( not ( = ?auto_719003 ?auto_719006 ) ) ( not ( = ?auto_719004 ?auto_719005 ) ) ( not ( = ?auto_719004 ?auto_719006 ) ) ( not ( = ?auto_719005 ?auto_719006 ) ) ( CLEAR ?auto_719003 ) ( ON ?auto_719004 ?auto_719005 ) ( CLEAR ?auto_719004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_718995 ?auto_718996 ?auto_718997 ?auto_718998 ?auto_718999 ?auto_719000 ?auto_719001 ?auto_719002 ?auto_719003 ?auto_719004 )
      ( MAKE-11PILE ?auto_718995 ?auto_718996 ?auto_718997 ?auto_718998 ?auto_718999 ?auto_719000 ?auto_719001 ?auto_719002 ?auto_719003 ?auto_719004 ?auto_719005 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719041 - BLOCK
      ?auto_719042 - BLOCK
      ?auto_719043 - BLOCK
      ?auto_719044 - BLOCK
      ?auto_719045 - BLOCK
      ?auto_719046 - BLOCK
      ?auto_719047 - BLOCK
      ?auto_719048 - BLOCK
      ?auto_719049 - BLOCK
      ?auto_719050 - BLOCK
      ?auto_719051 - BLOCK
    )
    :vars
    (
      ?auto_719052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719051 ?auto_719052 ) ( ON-TABLE ?auto_719041 ) ( ON ?auto_719042 ?auto_719041 ) ( ON ?auto_719043 ?auto_719042 ) ( ON ?auto_719044 ?auto_719043 ) ( ON ?auto_719045 ?auto_719044 ) ( ON ?auto_719046 ?auto_719045 ) ( ON ?auto_719047 ?auto_719046 ) ( ON ?auto_719048 ?auto_719047 ) ( not ( = ?auto_719041 ?auto_719042 ) ) ( not ( = ?auto_719041 ?auto_719043 ) ) ( not ( = ?auto_719041 ?auto_719044 ) ) ( not ( = ?auto_719041 ?auto_719045 ) ) ( not ( = ?auto_719041 ?auto_719046 ) ) ( not ( = ?auto_719041 ?auto_719047 ) ) ( not ( = ?auto_719041 ?auto_719048 ) ) ( not ( = ?auto_719041 ?auto_719049 ) ) ( not ( = ?auto_719041 ?auto_719050 ) ) ( not ( = ?auto_719041 ?auto_719051 ) ) ( not ( = ?auto_719041 ?auto_719052 ) ) ( not ( = ?auto_719042 ?auto_719043 ) ) ( not ( = ?auto_719042 ?auto_719044 ) ) ( not ( = ?auto_719042 ?auto_719045 ) ) ( not ( = ?auto_719042 ?auto_719046 ) ) ( not ( = ?auto_719042 ?auto_719047 ) ) ( not ( = ?auto_719042 ?auto_719048 ) ) ( not ( = ?auto_719042 ?auto_719049 ) ) ( not ( = ?auto_719042 ?auto_719050 ) ) ( not ( = ?auto_719042 ?auto_719051 ) ) ( not ( = ?auto_719042 ?auto_719052 ) ) ( not ( = ?auto_719043 ?auto_719044 ) ) ( not ( = ?auto_719043 ?auto_719045 ) ) ( not ( = ?auto_719043 ?auto_719046 ) ) ( not ( = ?auto_719043 ?auto_719047 ) ) ( not ( = ?auto_719043 ?auto_719048 ) ) ( not ( = ?auto_719043 ?auto_719049 ) ) ( not ( = ?auto_719043 ?auto_719050 ) ) ( not ( = ?auto_719043 ?auto_719051 ) ) ( not ( = ?auto_719043 ?auto_719052 ) ) ( not ( = ?auto_719044 ?auto_719045 ) ) ( not ( = ?auto_719044 ?auto_719046 ) ) ( not ( = ?auto_719044 ?auto_719047 ) ) ( not ( = ?auto_719044 ?auto_719048 ) ) ( not ( = ?auto_719044 ?auto_719049 ) ) ( not ( = ?auto_719044 ?auto_719050 ) ) ( not ( = ?auto_719044 ?auto_719051 ) ) ( not ( = ?auto_719044 ?auto_719052 ) ) ( not ( = ?auto_719045 ?auto_719046 ) ) ( not ( = ?auto_719045 ?auto_719047 ) ) ( not ( = ?auto_719045 ?auto_719048 ) ) ( not ( = ?auto_719045 ?auto_719049 ) ) ( not ( = ?auto_719045 ?auto_719050 ) ) ( not ( = ?auto_719045 ?auto_719051 ) ) ( not ( = ?auto_719045 ?auto_719052 ) ) ( not ( = ?auto_719046 ?auto_719047 ) ) ( not ( = ?auto_719046 ?auto_719048 ) ) ( not ( = ?auto_719046 ?auto_719049 ) ) ( not ( = ?auto_719046 ?auto_719050 ) ) ( not ( = ?auto_719046 ?auto_719051 ) ) ( not ( = ?auto_719046 ?auto_719052 ) ) ( not ( = ?auto_719047 ?auto_719048 ) ) ( not ( = ?auto_719047 ?auto_719049 ) ) ( not ( = ?auto_719047 ?auto_719050 ) ) ( not ( = ?auto_719047 ?auto_719051 ) ) ( not ( = ?auto_719047 ?auto_719052 ) ) ( not ( = ?auto_719048 ?auto_719049 ) ) ( not ( = ?auto_719048 ?auto_719050 ) ) ( not ( = ?auto_719048 ?auto_719051 ) ) ( not ( = ?auto_719048 ?auto_719052 ) ) ( not ( = ?auto_719049 ?auto_719050 ) ) ( not ( = ?auto_719049 ?auto_719051 ) ) ( not ( = ?auto_719049 ?auto_719052 ) ) ( not ( = ?auto_719050 ?auto_719051 ) ) ( not ( = ?auto_719050 ?auto_719052 ) ) ( not ( = ?auto_719051 ?auto_719052 ) ) ( ON ?auto_719050 ?auto_719051 ) ( CLEAR ?auto_719048 ) ( ON ?auto_719049 ?auto_719050 ) ( CLEAR ?auto_719049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_719041 ?auto_719042 ?auto_719043 ?auto_719044 ?auto_719045 ?auto_719046 ?auto_719047 ?auto_719048 ?auto_719049 )
      ( MAKE-11PILE ?auto_719041 ?auto_719042 ?auto_719043 ?auto_719044 ?auto_719045 ?auto_719046 ?auto_719047 ?auto_719048 ?auto_719049 ?auto_719050 ?auto_719051 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719087 - BLOCK
      ?auto_719088 - BLOCK
      ?auto_719089 - BLOCK
      ?auto_719090 - BLOCK
      ?auto_719091 - BLOCK
      ?auto_719092 - BLOCK
      ?auto_719093 - BLOCK
      ?auto_719094 - BLOCK
      ?auto_719095 - BLOCK
      ?auto_719096 - BLOCK
      ?auto_719097 - BLOCK
    )
    :vars
    (
      ?auto_719098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719097 ?auto_719098 ) ( ON-TABLE ?auto_719087 ) ( ON ?auto_719088 ?auto_719087 ) ( ON ?auto_719089 ?auto_719088 ) ( ON ?auto_719090 ?auto_719089 ) ( ON ?auto_719091 ?auto_719090 ) ( ON ?auto_719092 ?auto_719091 ) ( ON ?auto_719093 ?auto_719092 ) ( not ( = ?auto_719087 ?auto_719088 ) ) ( not ( = ?auto_719087 ?auto_719089 ) ) ( not ( = ?auto_719087 ?auto_719090 ) ) ( not ( = ?auto_719087 ?auto_719091 ) ) ( not ( = ?auto_719087 ?auto_719092 ) ) ( not ( = ?auto_719087 ?auto_719093 ) ) ( not ( = ?auto_719087 ?auto_719094 ) ) ( not ( = ?auto_719087 ?auto_719095 ) ) ( not ( = ?auto_719087 ?auto_719096 ) ) ( not ( = ?auto_719087 ?auto_719097 ) ) ( not ( = ?auto_719087 ?auto_719098 ) ) ( not ( = ?auto_719088 ?auto_719089 ) ) ( not ( = ?auto_719088 ?auto_719090 ) ) ( not ( = ?auto_719088 ?auto_719091 ) ) ( not ( = ?auto_719088 ?auto_719092 ) ) ( not ( = ?auto_719088 ?auto_719093 ) ) ( not ( = ?auto_719088 ?auto_719094 ) ) ( not ( = ?auto_719088 ?auto_719095 ) ) ( not ( = ?auto_719088 ?auto_719096 ) ) ( not ( = ?auto_719088 ?auto_719097 ) ) ( not ( = ?auto_719088 ?auto_719098 ) ) ( not ( = ?auto_719089 ?auto_719090 ) ) ( not ( = ?auto_719089 ?auto_719091 ) ) ( not ( = ?auto_719089 ?auto_719092 ) ) ( not ( = ?auto_719089 ?auto_719093 ) ) ( not ( = ?auto_719089 ?auto_719094 ) ) ( not ( = ?auto_719089 ?auto_719095 ) ) ( not ( = ?auto_719089 ?auto_719096 ) ) ( not ( = ?auto_719089 ?auto_719097 ) ) ( not ( = ?auto_719089 ?auto_719098 ) ) ( not ( = ?auto_719090 ?auto_719091 ) ) ( not ( = ?auto_719090 ?auto_719092 ) ) ( not ( = ?auto_719090 ?auto_719093 ) ) ( not ( = ?auto_719090 ?auto_719094 ) ) ( not ( = ?auto_719090 ?auto_719095 ) ) ( not ( = ?auto_719090 ?auto_719096 ) ) ( not ( = ?auto_719090 ?auto_719097 ) ) ( not ( = ?auto_719090 ?auto_719098 ) ) ( not ( = ?auto_719091 ?auto_719092 ) ) ( not ( = ?auto_719091 ?auto_719093 ) ) ( not ( = ?auto_719091 ?auto_719094 ) ) ( not ( = ?auto_719091 ?auto_719095 ) ) ( not ( = ?auto_719091 ?auto_719096 ) ) ( not ( = ?auto_719091 ?auto_719097 ) ) ( not ( = ?auto_719091 ?auto_719098 ) ) ( not ( = ?auto_719092 ?auto_719093 ) ) ( not ( = ?auto_719092 ?auto_719094 ) ) ( not ( = ?auto_719092 ?auto_719095 ) ) ( not ( = ?auto_719092 ?auto_719096 ) ) ( not ( = ?auto_719092 ?auto_719097 ) ) ( not ( = ?auto_719092 ?auto_719098 ) ) ( not ( = ?auto_719093 ?auto_719094 ) ) ( not ( = ?auto_719093 ?auto_719095 ) ) ( not ( = ?auto_719093 ?auto_719096 ) ) ( not ( = ?auto_719093 ?auto_719097 ) ) ( not ( = ?auto_719093 ?auto_719098 ) ) ( not ( = ?auto_719094 ?auto_719095 ) ) ( not ( = ?auto_719094 ?auto_719096 ) ) ( not ( = ?auto_719094 ?auto_719097 ) ) ( not ( = ?auto_719094 ?auto_719098 ) ) ( not ( = ?auto_719095 ?auto_719096 ) ) ( not ( = ?auto_719095 ?auto_719097 ) ) ( not ( = ?auto_719095 ?auto_719098 ) ) ( not ( = ?auto_719096 ?auto_719097 ) ) ( not ( = ?auto_719096 ?auto_719098 ) ) ( not ( = ?auto_719097 ?auto_719098 ) ) ( ON ?auto_719096 ?auto_719097 ) ( ON ?auto_719095 ?auto_719096 ) ( CLEAR ?auto_719093 ) ( ON ?auto_719094 ?auto_719095 ) ( CLEAR ?auto_719094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_719087 ?auto_719088 ?auto_719089 ?auto_719090 ?auto_719091 ?auto_719092 ?auto_719093 ?auto_719094 )
      ( MAKE-11PILE ?auto_719087 ?auto_719088 ?auto_719089 ?auto_719090 ?auto_719091 ?auto_719092 ?auto_719093 ?auto_719094 ?auto_719095 ?auto_719096 ?auto_719097 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719133 - BLOCK
      ?auto_719134 - BLOCK
      ?auto_719135 - BLOCK
      ?auto_719136 - BLOCK
      ?auto_719137 - BLOCK
      ?auto_719138 - BLOCK
      ?auto_719139 - BLOCK
      ?auto_719140 - BLOCK
      ?auto_719141 - BLOCK
      ?auto_719142 - BLOCK
      ?auto_719143 - BLOCK
    )
    :vars
    (
      ?auto_719144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719143 ?auto_719144 ) ( ON-TABLE ?auto_719133 ) ( ON ?auto_719134 ?auto_719133 ) ( ON ?auto_719135 ?auto_719134 ) ( ON ?auto_719136 ?auto_719135 ) ( ON ?auto_719137 ?auto_719136 ) ( ON ?auto_719138 ?auto_719137 ) ( not ( = ?auto_719133 ?auto_719134 ) ) ( not ( = ?auto_719133 ?auto_719135 ) ) ( not ( = ?auto_719133 ?auto_719136 ) ) ( not ( = ?auto_719133 ?auto_719137 ) ) ( not ( = ?auto_719133 ?auto_719138 ) ) ( not ( = ?auto_719133 ?auto_719139 ) ) ( not ( = ?auto_719133 ?auto_719140 ) ) ( not ( = ?auto_719133 ?auto_719141 ) ) ( not ( = ?auto_719133 ?auto_719142 ) ) ( not ( = ?auto_719133 ?auto_719143 ) ) ( not ( = ?auto_719133 ?auto_719144 ) ) ( not ( = ?auto_719134 ?auto_719135 ) ) ( not ( = ?auto_719134 ?auto_719136 ) ) ( not ( = ?auto_719134 ?auto_719137 ) ) ( not ( = ?auto_719134 ?auto_719138 ) ) ( not ( = ?auto_719134 ?auto_719139 ) ) ( not ( = ?auto_719134 ?auto_719140 ) ) ( not ( = ?auto_719134 ?auto_719141 ) ) ( not ( = ?auto_719134 ?auto_719142 ) ) ( not ( = ?auto_719134 ?auto_719143 ) ) ( not ( = ?auto_719134 ?auto_719144 ) ) ( not ( = ?auto_719135 ?auto_719136 ) ) ( not ( = ?auto_719135 ?auto_719137 ) ) ( not ( = ?auto_719135 ?auto_719138 ) ) ( not ( = ?auto_719135 ?auto_719139 ) ) ( not ( = ?auto_719135 ?auto_719140 ) ) ( not ( = ?auto_719135 ?auto_719141 ) ) ( not ( = ?auto_719135 ?auto_719142 ) ) ( not ( = ?auto_719135 ?auto_719143 ) ) ( not ( = ?auto_719135 ?auto_719144 ) ) ( not ( = ?auto_719136 ?auto_719137 ) ) ( not ( = ?auto_719136 ?auto_719138 ) ) ( not ( = ?auto_719136 ?auto_719139 ) ) ( not ( = ?auto_719136 ?auto_719140 ) ) ( not ( = ?auto_719136 ?auto_719141 ) ) ( not ( = ?auto_719136 ?auto_719142 ) ) ( not ( = ?auto_719136 ?auto_719143 ) ) ( not ( = ?auto_719136 ?auto_719144 ) ) ( not ( = ?auto_719137 ?auto_719138 ) ) ( not ( = ?auto_719137 ?auto_719139 ) ) ( not ( = ?auto_719137 ?auto_719140 ) ) ( not ( = ?auto_719137 ?auto_719141 ) ) ( not ( = ?auto_719137 ?auto_719142 ) ) ( not ( = ?auto_719137 ?auto_719143 ) ) ( not ( = ?auto_719137 ?auto_719144 ) ) ( not ( = ?auto_719138 ?auto_719139 ) ) ( not ( = ?auto_719138 ?auto_719140 ) ) ( not ( = ?auto_719138 ?auto_719141 ) ) ( not ( = ?auto_719138 ?auto_719142 ) ) ( not ( = ?auto_719138 ?auto_719143 ) ) ( not ( = ?auto_719138 ?auto_719144 ) ) ( not ( = ?auto_719139 ?auto_719140 ) ) ( not ( = ?auto_719139 ?auto_719141 ) ) ( not ( = ?auto_719139 ?auto_719142 ) ) ( not ( = ?auto_719139 ?auto_719143 ) ) ( not ( = ?auto_719139 ?auto_719144 ) ) ( not ( = ?auto_719140 ?auto_719141 ) ) ( not ( = ?auto_719140 ?auto_719142 ) ) ( not ( = ?auto_719140 ?auto_719143 ) ) ( not ( = ?auto_719140 ?auto_719144 ) ) ( not ( = ?auto_719141 ?auto_719142 ) ) ( not ( = ?auto_719141 ?auto_719143 ) ) ( not ( = ?auto_719141 ?auto_719144 ) ) ( not ( = ?auto_719142 ?auto_719143 ) ) ( not ( = ?auto_719142 ?auto_719144 ) ) ( not ( = ?auto_719143 ?auto_719144 ) ) ( ON ?auto_719142 ?auto_719143 ) ( ON ?auto_719141 ?auto_719142 ) ( ON ?auto_719140 ?auto_719141 ) ( CLEAR ?auto_719138 ) ( ON ?auto_719139 ?auto_719140 ) ( CLEAR ?auto_719139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_719133 ?auto_719134 ?auto_719135 ?auto_719136 ?auto_719137 ?auto_719138 ?auto_719139 )
      ( MAKE-11PILE ?auto_719133 ?auto_719134 ?auto_719135 ?auto_719136 ?auto_719137 ?auto_719138 ?auto_719139 ?auto_719140 ?auto_719141 ?auto_719142 ?auto_719143 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719179 - BLOCK
      ?auto_719180 - BLOCK
      ?auto_719181 - BLOCK
      ?auto_719182 - BLOCK
      ?auto_719183 - BLOCK
      ?auto_719184 - BLOCK
      ?auto_719185 - BLOCK
      ?auto_719186 - BLOCK
      ?auto_719187 - BLOCK
      ?auto_719188 - BLOCK
      ?auto_719189 - BLOCK
    )
    :vars
    (
      ?auto_719190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719189 ?auto_719190 ) ( ON-TABLE ?auto_719179 ) ( ON ?auto_719180 ?auto_719179 ) ( ON ?auto_719181 ?auto_719180 ) ( ON ?auto_719182 ?auto_719181 ) ( ON ?auto_719183 ?auto_719182 ) ( not ( = ?auto_719179 ?auto_719180 ) ) ( not ( = ?auto_719179 ?auto_719181 ) ) ( not ( = ?auto_719179 ?auto_719182 ) ) ( not ( = ?auto_719179 ?auto_719183 ) ) ( not ( = ?auto_719179 ?auto_719184 ) ) ( not ( = ?auto_719179 ?auto_719185 ) ) ( not ( = ?auto_719179 ?auto_719186 ) ) ( not ( = ?auto_719179 ?auto_719187 ) ) ( not ( = ?auto_719179 ?auto_719188 ) ) ( not ( = ?auto_719179 ?auto_719189 ) ) ( not ( = ?auto_719179 ?auto_719190 ) ) ( not ( = ?auto_719180 ?auto_719181 ) ) ( not ( = ?auto_719180 ?auto_719182 ) ) ( not ( = ?auto_719180 ?auto_719183 ) ) ( not ( = ?auto_719180 ?auto_719184 ) ) ( not ( = ?auto_719180 ?auto_719185 ) ) ( not ( = ?auto_719180 ?auto_719186 ) ) ( not ( = ?auto_719180 ?auto_719187 ) ) ( not ( = ?auto_719180 ?auto_719188 ) ) ( not ( = ?auto_719180 ?auto_719189 ) ) ( not ( = ?auto_719180 ?auto_719190 ) ) ( not ( = ?auto_719181 ?auto_719182 ) ) ( not ( = ?auto_719181 ?auto_719183 ) ) ( not ( = ?auto_719181 ?auto_719184 ) ) ( not ( = ?auto_719181 ?auto_719185 ) ) ( not ( = ?auto_719181 ?auto_719186 ) ) ( not ( = ?auto_719181 ?auto_719187 ) ) ( not ( = ?auto_719181 ?auto_719188 ) ) ( not ( = ?auto_719181 ?auto_719189 ) ) ( not ( = ?auto_719181 ?auto_719190 ) ) ( not ( = ?auto_719182 ?auto_719183 ) ) ( not ( = ?auto_719182 ?auto_719184 ) ) ( not ( = ?auto_719182 ?auto_719185 ) ) ( not ( = ?auto_719182 ?auto_719186 ) ) ( not ( = ?auto_719182 ?auto_719187 ) ) ( not ( = ?auto_719182 ?auto_719188 ) ) ( not ( = ?auto_719182 ?auto_719189 ) ) ( not ( = ?auto_719182 ?auto_719190 ) ) ( not ( = ?auto_719183 ?auto_719184 ) ) ( not ( = ?auto_719183 ?auto_719185 ) ) ( not ( = ?auto_719183 ?auto_719186 ) ) ( not ( = ?auto_719183 ?auto_719187 ) ) ( not ( = ?auto_719183 ?auto_719188 ) ) ( not ( = ?auto_719183 ?auto_719189 ) ) ( not ( = ?auto_719183 ?auto_719190 ) ) ( not ( = ?auto_719184 ?auto_719185 ) ) ( not ( = ?auto_719184 ?auto_719186 ) ) ( not ( = ?auto_719184 ?auto_719187 ) ) ( not ( = ?auto_719184 ?auto_719188 ) ) ( not ( = ?auto_719184 ?auto_719189 ) ) ( not ( = ?auto_719184 ?auto_719190 ) ) ( not ( = ?auto_719185 ?auto_719186 ) ) ( not ( = ?auto_719185 ?auto_719187 ) ) ( not ( = ?auto_719185 ?auto_719188 ) ) ( not ( = ?auto_719185 ?auto_719189 ) ) ( not ( = ?auto_719185 ?auto_719190 ) ) ( not ( = ?auto_719186 ?auto_719187 ) ) ( not ( = ?auto_719186 ?auto_719188 ) ) ( not ( = ?auto_719186 ?auto_719189 ) ) ( not ( = ?auto_719186 ?auto_719190 ) ) ( not ( = ?auto_719187 ?auto_719188 ) ) ( not ( = ?auto_719187 ?auto_719189 ) ) ( not ( = ?auto_719187 ?auto_719190 ) ) ( not ( = ?auto_719188 ?auto_719189 ) ) ( not ( = ?auto_719188 ?auto_719190 ) ) ( not ( = ?auto_719189 ?auto_719190 ) ) ( ON ?auto_719188 ?auto_719189 ) ( ON ?auto_719187 ?auto_719188 ) ( ON ?auto_719186 ?auto_719187 ) ( ON ?auto_719185 ?auto_719186 ) ( CLEAR ?auto_719183 ) ( ON ?auto_719184 ?auto_719185 ) ( CLEAR ?auto_719184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_719179 ?auto_719180 ?auto_719181 ?auto_719182 ?auto_719183 ?auto_719184 )
      ( MAKE-11PILE ?auto_719179 ?auto_719180 ?auto_719181 ?auto_719182 ?auto_719183 ?auto_719184 ?auto_719185 ?auto_719186 ?auto_719187 ?auto_719188 ?auto_719189 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719225 - BLOCK
      ?auto_719226 - BLOCK
      ?auto_719227 - BLOCK
      ?auto_719228 - BLOCK
      ?auto_719229 - BLOCK
      ?auto_719230 - BLOCK
      ?auto_719231 - BLOCK
      ?auto_719232 - BLOCK
      ?auto_719233 - BLOCK
      ?auto_719234 - BLOCK
      ?auto_719235 - BLOCK
    )
    :vars
    (
      ?auto_719236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719235 ?auto_719236 ) ( ON-TABLE ?auto_719225 ) ( ON ?auto_719226 ?auto_719225 ) ( ON ?auto_719227 ?auto_719226 ) ( ON ?auto_719228 ?auto_719227 ) ( not ( = ?auto_719225 ?auto_719226 ) ) ( not ( = ?auto_719225 ?auto_719227 ) ) ( not ( = ?auto_719225 ?auto_719228 ) ) ( not ( = ?auto_719225 ?auto_719229 ) ) ( not ( = ?auto_719225 ?auto_719230 ) ) ( not ( = ?auto_719225 ?auto_719231 ) ) ( not ( = ?auto_719225 ?auto_719232 ) ) ( not ( = ?auto_719225 ?auto_719233 ) ) ( not ( = ?auto_719225 ?auto_719234 ) ) ( not ( = ?auto_719225 ?auto_719235 ) ) ( not ( = ?auto_719225 ?auto_719236 ) ) ( not ( = ?auto_719226 ?auto_719227 ) ) ( not ( = ?auto_719226 ?auto_719228 ) ) ( not ( = ?auto_719226 ?auto_719229 ) ) ( not ( = ?auto_719226 ?auto_719230 ) ) ( not ( = ?auto_719226 ?auto_719231 ) ) ( not ( = ?auto_719226 ?auto_719232 ) ) ( not ( = ?auto_719226 ?auto_719233 ) ) ( not ( = ?auto_719226 ?auto_719234 ) ) ( not ( = ?auto_719226 ?auto_719235 ) ) ( not ( = ?auto_719226 ?auto_719236 ) ) ( not ( = ?auto_719227 ?auto_719228 ) ) ( not ( = ?auto_719227 ?auto_719229 ) ) ( not ( = ?auto_719227 ?auto_719230 ) ) ( not ( = ?auto_719227 ?auto_719231 ) ) ( not ( = ?auto_719227 ?auto_719232 ) ) ( not ( = ?auto_719227 ?auto_719233 ) ) ( not ( = ?auto_719227 ?auto_719234 ) ) ( not ( = ?auto_719227 ?auto_719235 ) ) ( not ( = ?auto_719227 ?auto_719236 ) ) ( not ( = ?auto_719228 ?auto_719229 ) ) ( not ( = ?auto_719228 ?auto_719230 ) ) ( not ( = ?auto_719228 ?auto_719231 ) ) ( not ( = ?auto_719228 ?auto_719232 ) ) ( not ( = ?auto_719228 ?auto_719233 ) ) ( not ( = ?auto_719228 ?auto_719234 ) ) ( not ( = ?auto_719228 ?auto_719235 ) ) ( not ( = ?auto_719228 ?auto_719236 ) ) ( not ( = ?auto_719229 ?auto_719230 ) ) ( not ( = ?auto_719229 ?auto_719231 ) ) ( not ( = ?auto_719229 ?auto_719232 ) ) ( not ( = ?auto_719229 ?auto_719233 ) ) ( not ( = ?auto_719229 ?auto_719234 ) ) ( not ( = ?auto_719229 ?auto_719235 ) ) ( not ( = ?auto_719229 ?auto_719236 ) ) ( not ( = ?auto_719230 ?auto_719231 ) ) ( not ( = ?auto_719230 ?auto_719232 ) ) ( not ( = ?auto_719230 ?auto_719233 ) ) ( not ( = ?auto_719230 ?auto_719234 ) ) ( not ( = ?auto_719230 ?auto_719235 ) ) ( not ( = ?auto_719230 ?auto_719236 ) ) ( not ( = ?auto_719231 ?auto_719232 ) ) ( not ( = ?auto_719231 ?auto_719233 ) ) ( not ( = ?auto_719231 ?auto_719234 ) ) ( not ( = ?auto_719231 ?auto_719235 ) ) ( not ( = ?auto_719231 ?auto_719236 ) ) ( not ( = ?auto_719232 ?auto_719233 ) ) ( not ( = ?auto_719232 ?auto_719234 ) ) ( not ( = ?auto_719232 ?auto_719235 ) ) ( not ( = ?auto_719232 ?auto_719236 ) ) ( not ( = ?auto_719233 ?auto_719234 ) ) ( not ( = ?auto_719233 ?auto_719235 ) ) ( not ( = ?auto_719233 ?auto_719236 ) ) ( not ( = ?auto_719234 ?auto_719235 ) ) ( not ( = ?auto_719234 ?auto_719236 ) ) ( not ( = ?auto_719235 ?auto_719236 ) ) ( ON ?auto_719234 ?auto_719235 ) ( ON ?auto_719233 ?auto_719234 ) ( ON ?auto_719232 ?auto_719233 ) ( ON ?auto_719231 ?auto_719232 ) ( ON ?auto_719230 ?auto_719231 ) ( CLEAR ?auto_719228 ) ( ON ?auto_719229 ?auto_719230 ) ( CLEAR ?auto_719229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_719225 ?auto_719226 ?auto_719227 ?auto_719228 ?auto_719229 )
      ( MAKE-11PILE ?auto_719225 ?auto_719226 ?auto_719227 ?auto_719228 ?auto_719229 ?auto_719230 ?auto_719231 ?auto_719232 ?auto_719233 ?auto_719234 ?auto_719235 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719271 - BLOCK
      ?auto_719272 - BLOCK
      ?auto_719273 - BLOCK
      ?auto_719274 - BLOCK
      ?auto_719275 - BLOCK
      ?auto_719276 - BLOCK
      ?auto_719277 - BLOCK
      ?auto_719278 - BLOCK
      ?auto_719279 - BLOCK
      ?auto_719280 - BLOCK
      ?auto_719281 - BLOCK
    )
    :vars
    (
      ?auto_719282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719281 ?auto_719282 ) ( ON-TABLE ?auto_719271 ) ( ON ?auto_719272 ?auto_719271 ) ( ON ?auto_719273 ?auto_719272 ) ( not ( = ?auto_719271 ?auto_719272 ) ) ( not ( = ?auto_719271 ?auto_719273 ) ) ( not ( = ?auto_719271 ?auto_719274 ) ) ( not ( = ?auto_719271 ?auto_719275 ) ) ( not ( = ?auto_719271 ?auto_719276 ) ) ( not ( = ?auto_719271 ?auto_719277 ) ) ( not ( = ?auto_719271 ?auto_719278 ) ) ( not ( = ?auto_719271 ?auto_719279 ) ) ( not ( = ?auto_719271 ?auto_719280 ) ) ( not ( = ?auto_719271 ?auto_719281 ) ) ( not ( = ?auto_719271 ?auto_719282 ) ) ( not ( = ?auto_719272 ?auto_719273 ) ) ( not ( = ?auto_719272 ?auto_719274 ) ) ( not ( = ?auto_719272 ?auto_719275 ) ) ( not ( = ?auto_719272 ?auto_719276 ) ) ( not ( = ?auto_719272 ?auto_719277 ) ) ( not ( = ?auto_719272 ?auto_719278 ) ) ( not ( = ?auto_719272 ?auto_719279 ) ) ( not ( = ?auto_719272 ?auto_719280 ) ) ( not ( = ?auto_719272 ?auto_719281 ) ) ( not ( = ?auto_719272 ?auto_719282 ) ) ( not ( = ?auto_719273 ?auto_719274 ) ) ( not ( = ?auto_719273 ?auto_719275 ) ) ( not ( = ?auto_719273 ?auto_719276 ) ) ( not ( = ?auto_719273 ?auto_719277 ) ) ( not ( = ?auto_719273 ?auto_719278 ) ) ( not ( = ?auto_719273 ?auto_719279 ) ) ( not ( = ?auto_719273 ?auto_719280 ) ) ( not ( = ?auto_719273 ?auto_719281 ) ) ( not ( = ?auto_719273 ?auto_719282 ) ) ( not ( = ?auto_719274 ?auto_719275 ) ) ( not ( = ?auto_719274 ?auto_719276 ) ) ( not ( = ?auto_719274 ?auto_719277 ) ) ( not ( = ?auto_719274 ?auto_719278 ) ) ( not ( = ?auto_719274 ?auto_719279 ) ) ( not ( = ?auto_719274 ?auto_719280 ) ) ( not ( = ?auto_719274 ?auto_719281 ) ) ( not ( = ?auto_719274 ?auto_719282 ) ) ( not ( = ?auto_719275 ?auto_719276 ) ) ( not ( = ?auto_719275 ?auto_719277 ) ) ( not ( = ?auto_719275 ?auto_719278 ) ) ( not ( = ?auto_719275 ?auto_719279 ) ) ( not ( = ?auto_719275 ?auto_719280 ) ) ( not ( = ?auto_719275 ?auto_719281 ) ) ( not ( = ?auto_719275 ?auto_719282 ) ) ( not ( = ?auto_719276 ?auto_719277 ) ) ( not ( = ?auto_719276 ?auto_719278 ) ) ( not ( = ?auto_719276 ?auto_719279 ) ) ( not ( = ?auto_719276 ?auto_719280 ) ) ( not ( = ?auto_719276 ?auto_719281 ) ) ( not ( = ?auto_719276 ?auto_719282 ) ) ( not ( = ?auto_719277 ?auto_719278 ) ) ( not ( = ?auto_719277 ?auto_719279 ) ) ( not ( = ?auto_719277 ?auto_719280 ) ) ( not ( = ?auto_719277 ?auto_719281 ) ) ( not ( = ?auto_719277 ?auto_719282 ) ) ( not ( = ?auto_719278 ?auto_719279 ) ) ( not ( = ?auto_719278 ?auto_719280 ) ) ( not ( = ?auto_719278 ?auto_719281 ) ) ( not ( = ?auto_719278 ?auto_719282 ) ) ( not ( = ?auto_719279 ?auto_719280 ) ) ( not ( = ?auto_719279 ?auto_719281 ) ) ( not ( = ?auto_719279 ?auto_719282 ) ) ( not ( = ?auto_719280 ?auto_719281 ) ) ( not ( = ?auto_719280 ?auto_719282 ) ) ( not ( = ?auto_719281 ?auto_719282 ) ) ( ON ?auto_719280 ?auto_719281 ) ( ON ?auto_719279 ?auto_719280 ) ( ON ?auto_719278 ?auto_719279 ) ( ON ?auto_719277 ?auto_719278 ) ( ON ?auto_719276 ?auto_719277 ) ( ON ?auto_719275 ?auto_719276 ) ( CLEAR ?auto_719273 ) ( ON ?auto_719274 ?auto_719275 ) ( CLEAR ?auto_719274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_719271 ?auto_719272 ?auto_719273 ?auto_719274 )
      ( MAKE-11PILE ?auto_719271 ?auto_719272 ?auto_719273 ?auto_719274 ?auto_719275 ?auto_719276 ?auto_719277 ?auto_719278 ?auto_719279 ?auto_719280 ?auto_719281 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719317 - BLOCK
      ?auto_719318 - BLOCK
      ?auto_719319 - BLOCK
      ?auto_719320 - BLOCK
      ?auto_719321 - BLOCK
      ?auto_719322 - BLOCK
      ?auto_719323 - BLOCK
      ?auto_719324 - BLOCK
      ?auto_719325 - BLOCK
      ?auto_719326 - BLOCK
      ?auto_719327 - BLOCK
    )
    :vars
    (
      ?auto_719328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719327 ?auto_719328 ) ( ON-TABLE ?auto_719317 ) ( ON ?auto_719318 ?auto_719317 ) ( not ( = ?auto_719317 ?auto_719318 ) ) ( not ( = ?auto_719317 ?auto_719319 ) ) ( not ( = ?auto_719317 ?auto_719320 ) ) ( not ( = ?auto_719317 ?auto_719321 ) ) ( not ( = ?auto_719317 ?auto_719322 ) ) ( not ( = ?auto_719317 ?auto_719323 ) ) ( not ( = ?auto_719317 ?auto_719324 ) ) ( not ( = ?auto_719317 ?auto_719325 ) ) ( not ( = ?auto_719317 ?auto_719326 ) ) ( not ( = ?auto_719317 ?auto_719327 ) ) ( not ( = ?auto_719317 ?auto_719328 ) ) ( not ( = ?auto_719318 ?auto_719319 ) ) ( not ( = ?auto_719318 ?auto_719320 ) ) ( not ( = ?auto_719318 ?auto_719321 ) ) ( not ( = ?auto_719318 ?auto_719322 ) ) ( not ( = ?auto_719318 ?auto_719323 ) ) ( not ( = ?auto_719318 ?auto_719324 ) ) ( not ( = ?auto_719318 ?auto_719325 ) ) ( not ( = ?auto_719318 ?auto_719326 ) ) ( not ( = ?auto_719318 ?auto_719327 ) ) ( not ( = ?auto_719318 ?auto_719328 ) ) ( not ( = ?auto_719319 ?auto_719320 ) ) ( not ( = ?auto_719319 ?auto_719321 ) ) ( not ( = ?auto_719319 ?auto_719322 ) ) ( not ( = ?auto_719319 ?auto_719323 ) ) ( not ( = ?auto_719319 ?auto_719324 ) ) ( not ( = ?auto_719319 ?auto_719325 ) ) ( not ( = ?auto_719319 ?auto_719326 ) ) ( not ( = ?auto_719319 ?auto_719327 ) ) ( not ( = ?auto_719319 ?auto_719328 ) ) ( not ( = ?auto_719320 ?auto_719321 ) ) ( not ( = ?auto_719320 ?auto_719322 ) ) ( not ( = ?auto_719320 ?auto_719323 ) ) ( not ( = ?auto_719320 ?auto_719324 ) ) ( not ( = ?auto_719320 ?auto_719325 ) ) ( not ( = ?auto_719320 ?auto_719326 ) ) ( not ( = ?auto_719320 ?auto_719327 ) ) ( not ( = ?auto_719320 ?auto_719328 ) ) ( not ( = ?auto_719321 ?auto_719322 ) ) ( not ( = ?auto_719321 ?auto_719323 ) ) ( not ( = ?auto_719321 ?auto_719324 ) ) ( not ( = ?auto_719321 ?auto_719325 ) ) ( not ( = ?auto_719321 ?auto_719326 ) ) ( not ( = ?auto_719321 ?auto_719327 ) ) ( not ( = ?auto_719321 ?auto_719328 ) ) ( not ( = ?auto_719322 ?auto_719323 ) ) ( not ( = ?auto_719322 ?auto_719324 ) ) ( not ( = ?auto_719322 ?auto_719325 ) ) ( not ( = ?auto_719322 ?auto_719326 ) ) ( not ( = ?auto_719322 ?auto_719327 ) ) ( not ( = ?auto_719322 ?auto_719328 ) ) ( not ( = ?auto_719323 ?auto_719324 ) ) ( not ( = ?auto_719323 ?auto_719325 ) ) ( not ( = ?auto_719323 ?auto_719326 ) ) ( not ( = ?auto_719323 ?auto_719327 ) ) ( not ( = ?auto_719323 ?auto_719328 ) ) ( not ( = ?auto_719324 ?auto_719325 ) ) ( not ( = ?auto_719324 ?auto_719326 ) ) ( not ( = ?auto_719324 ?auto_719327 ) ) ( not ( = ?auto_719324 ?auto_719328 ) ) ( not ( = ?auto_719325 ?auto_719326 ) ) ( not ( = ?auto_719325 ?auto_719327 ) ) ( not ( = ?auto_719325 ?auto_719328 ) ) ( not ( = ?auto_719326 ?auto_719327 ) ) ( not ( = ?auto_719326 ?auto_719328 ) ) ( not ( = ?auto_719327 ?auto_719328 ) ) ( ON ?auto_719326 ?auto_719327 ) ( ON ?auto_719325 ?auto_719326 ) ( ON ?auto_719324 ?auto_719325 ) ( ON ?auto_719323 ?auto_719324 ) ( ON ?auto_719322 ?auto_719323 ) ( ON ?auto_719321 ?auto_719322 ) ( ON ?auto_719320 ?auto_719321 ) ( CLEAR ?auto_719318 ) ( ON ?auto_719319 ?auto_719320 ) ( CLEAR ?auto_719319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_719317 ?auto_719318 ?auto_719319 )
      ( MAKE-11PILE ?auto_719317 ?auto_719318 ?auto_719319 ?auto_719320 ?auto_719321 ?auto_719322 ?auto_719323 ?auto_719324 ?auto_719325 ?auto_719326 ?auto_719327 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719363 - BLOCK
      ?auto_719364 - BLOCK
      ?auto_719365 - BLOCK
      ?auto_719366 - BLOCK
      ?auto_719367 - BLOCK
      ?auto_719368 - BLOCK
      ?auto_719369 - BLOCK
      ?auto_719370 - BLOCK
      ?auto_719371 - BLOCK
      ?auto_719372 - BLOCK
      ?auto_719373 - BLOCK
    )
    :vars
    (
      ?auto_719374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719373 ?auto_719374 ) ( ON-TABLE ?auto_719363 ) ( not ( = ?auto_719363 ?auto_719364 ) ) ( not ( = ?auto_719363 ?auto_719365 ) ) ( not ( = ?auto_719363 ?auto_719366 ) ) ( not ( = ?auto_719363 ?auto_719367 ) ) ( not ( = ?auto_719363 ?auto_719368 ) ) ( not ( = ?auto_719363 ?auto_719369 ) ) ( not ( = ?auto_719363 ?auto_719370 ) ) ( not ( = ?auto_719363 ?auto_719371 ) ) ( not ( = ?auto_719363 ?auto_719372 ) ) ( not ( = ?auto_719363 ?auto_719373 ) ) ( not ( = ?auto_719363 ?auto_719374 ) ) ( not ( = ?auto_719364 ?auto_719365 ) ) ( not ( = ?auto_719364 ?auto_719366 ) ) ( not ( = ?auto_719364 ?auto_719367 ) ) ( not ( = ?auto_719364 ?auto_719368 ) ) ( not ( = ?auto_719364 ?auto_719369 ) ) ( not ( = ?auto_719364 ?auto_719370 ) ) ( not ( = ?auto_719364 ?auto_719371 ) ) ( not ( = ?auto_719364 ?auto_719372 ) ) ( not ( = ?auto_719364 ?auto_719373 ) ) ( not ( = ?auto_719364 ?auto_719374 ) ) ( not ( = ?auto_719365 ?auto_719366 ) ) ( not ( = ?auto_719365 ?auto_719367 ) ) ( not ( = ?auto_719365 ?auto_719368 ) ) ( not ( = ?auto_719365 ?auto_719369 ) ) ( not ( = ?auto_719365 ?auto_719370 ) ) ( not ( = ?auto_719365 ?auto_719371 ) ) ( not ( = ?auto_719365 ?auto_719372 ) ) ( not ( = ?auto_719365 ?auto_719373 ) ) ( not ( = ?auto_719365 ?auto_719374 ) ) ( not ( = ?auto_719366 ?auto_719367 ) ) ( not ( = ?auto_719366 ?auto_719368 ) ) ( not ( = ?auto_719366 ?auto_719369 ) ) ( not ( = ?auto_719366 ?auto_719370 ) ) ( not ( = ?auto_719366 ?auto_719371 ) ) ( not ( = ?auto_719366 ?auto_719372 ) ) ( not ( = ?auto_719366 ?auto_719373 ) ) ( not ( = ?auto_719366 ?auto_719374 ) ) ( not ( = ?auto_719367 ?auto_719368 ) ) ( not ( = ?auto_719367 ?auto_719369 ) ) ( not ( = ?auto_719367 ?auto_719370 ) ) ( not ( = ?auto_719367 ?auto_719371 ) ) ( not ( = ?auto_719367 ?auto_719372 ) ) ( not ( = ?auto_719367 ?auto_719373 ) ) ( not ( = ?auto_719367 ?auto_719374 ) ) ( not ( = ?auto_719368 ?auto_719369 ) ) ( not ( = ?auto_719368 ?auto_719370 ) ) ( not ( = ?auto_719368 ?auto_719371 ) ) ( not ( = ?auto_719368 ?auto_719372 ) ) ( not ( = ?auto_719368 ?auto_719373 ) ) ( not ( = ?auto_719368 ?auto_719374 ) ) ( not ( = ?auto_719369 ?auto_719370 ) ) ( not ( = ?auto_719369 ?auto_719371 ) ) ( not ( = ?auto_719369 ?auto_719372 ) ) ( not ( = ?auto_719369 ?auto_719373 ) ) ( not ( = ?auto_719369 ?auto_719374 ) ) ( not ( = ?auto_719370 ?auto_719371 ) ) ( not ( = ?auto_719370 ?auto_719372 ) ) ( not ( = ?auto_719370 ?auto_719373 ) ) ( not ( = ?auto_719370 ?auto_719374 ) ) ( not ( = ?auto_719371 ?auto_719372 ) ) ( not ( = ?auto_719371 ?auto_719373 ) ) ( not ( = ?auto_719371 ?auto_719374 ) ) ( not ( = ?auto_719372 ?auto_719373 ) ) ( not ( = ?auto_719372 ?auto_719374 ) ) ( not ( = ?auto_719373 ?auto_719374 ) ) ( ON ?auto_719372 ?auto_719373 ) ( ON ?auto_719371 ?auto_719372 ) ( ON ?auto_719370 ?auto_719371 ) ( ON ?auto_719369 ?auto_719370 ) ( ON ?auto_719368 ?auto_719369 ) ( ON ?auto_719367 ?auto_719368 ) ( ON ?auto_719366 ?auto_719367 ) ( ON ?auto_719365 ?auto_719366 ) ( CLEAR ?auto_719363 ) ( ON ?auto_719364 ?auto_719365 ) ( CLEAR ?auto_719364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_719363 ?auto_719364 )
      ( MAKE-11PILE ?auto_719363 ?auto_719364 ?auto_719365 ?auto_719366 ?auto_719367 ?auto_719368 ?auto_719369 ?auto_719370 ?auto_719371 ?auto_719372 ?auto_719373 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_719409 - BLOCK
      ?auto_719410 - BLOCK
      ?auto_719411 - BLOCK
      ?auto_719412 - BLOCK
      ?auto_719413 - BLOCK
      ?auto_719414 - BLOCK
      ?auto_719415 - BLOCK
      ?auto_719416 - BLOCK
      ?auto_719417 - BLOCK
      ?auto_719418 - BLOCK
      ?auto_719419 - BLOCK
    )
    :vars
    (
      ?auto_719420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719419 ?auto_719420 ) ( not ( = ?auto_719409 ?auto_719410 ) ) ( not ( = ?auto_719409 ?auto_719411 ) ) ( not ( = ?auto_719409 ?auto_719412 ) ) ( not ( = ?auto_719409 ?auto_719413 ) ) ( not ( = ?auto_719409 ?auto_719414 ) ) ( not ( = ?auto_719409 ?auto_719415 ) ) ( not ( = ?auto_719409 ?auto_719416 ) ) ( not ( = ?auto_719409 ?auto_719417 ) ) ( not ( = ?auto_719409 ?auto_719418 ) ) ( not ( = ?auto_719409 ?auto_719419 ) ) ( not ( = ?auto_719409 ?auto_719420 ) ) ( not ( = ?auto_719410 ?auto_719411 ) ) ( not ( = ?auto_719410 ?auto_719412 ) ) ( not ( = ?auto_719410 ?auto_719413 ) ) ( not ( = ?auto_719410 ?auto_719414 ) ) ( not ( = ?auto_719410 ?auto_719415 ) ) ( not ( = ?auto_719410 ?auto_719416 ) ) ( not ( = ?auto_719410 ?auto_719417 ) ) ( not ( = ?auto_719410 ?auto_719418 ) ) ( not ( = ?auto_719410 ?auto_719419 ) ) ( not ( = ?auto_719410 ?auto_719420 ) ) ( not ( = ?auto_719411 ?auto_719412 ) ) ( not ( = ?auto_719411 ?auto_719413 ) ) ( not ( = ?auto_719411 ?auto_719414 ) ) ( not ( = ?auto_719411 ?auto_719415 ) ) ( not ( = ?auto_719411 ?auto_719416 ) ) ( not ( = ?auto_719411 ?auto_719417 ) ) ( not ( = ?auto_719411 ?auto_719418 ) ) ( not ( = ?auto_719411 ?auto_719419 ) ) ( not ( = ?auto_719411 ?auto_719420 ) ) ( not ( = ?auto_719412 ?auto_719413 ) ) ( not ( = ?auto_719412 ?auto_719414 ) ) ( not ( = ?auto_719412 ?auto_719415 ) ) ( not ( = ?auto_719412 ?auto_719416 ) ) ( not ( = ?auto_719412 ?auto_719417 ) ) ( not ( = ?auto_719412 ?auto_719418 ) ) ( not ( = ?auto_719412 ?auto_719419 ) ) ( not ( = ?auto_719412 ?auto_719420 ) ) ( not ( = ?auto_719413 ?auto_719414 ) ) ( not ( = ?auto_719413 ?auto_719415 ) ) ( not ( = ?auto_719413 ?auto_719416 ) ) ( not ( = ?auto_719413 ?auto_719417 ) ) ( not ( = ?auto_719413 ?auto_719418 ) ) ( not ( = ?auto_719413 ?auto_719419 ) ) ( not ( = ?auto_719413 ?auto_719420 ) ) ( not ( = ?auto_719414 ?auto_719415 ) ) ( not ( = ?auto_719414 ?auto_719416 ) ) ( not ( = ?auto_719414 ?auto_719417 ) ) ( not ( = ?auto_719414 ?auto_719418 ) ) ( not ( = ?auto_719414 ?auto_719419 ) ) ( not ( = ?auto_719414 ?auto_719420 ) ) ( not ( = ?auto_719415 ?auto_719416 ) ) ( not ( = ?auto_719415 ?auto_719417 ) ) ( not ( = ?auto_719415 ?auto_719418 ) ) ( not ( = ?auto_719415 ?auto_719419 ) ) ( not ( = ?auto_719415 ?auto_719420 ) ) ( not ( = ?auto_719416 ?auto_719417 ) ) ( not ( = ?auto_719416 ?auto_719418 ) ) ( not ( = ?auto_719416 ?auto_719419 ) ) ( not ( = ?auto_719416 ?auto_719420 ) ) ( not ( = ?auto_719417 ?auto_719418 ) ) ( not ( = ?auto_719417 ?auto_719419 ) ) ( not ( = ?auto_719417 ?auto_719420 ) ) ( not ( = ?auto_719418 ?auto_719419 ) ) ( not ( = ?auto_719418 ?auto_719420 ) ) ( not ( = ?auto_719419 ?auto_719420 ) ) ( ON ?auto_719418 ?auto_719419 ) ( ON ?auto_719417 ?auto_719418 ) ( ON ?auto_719416 ?auto_719417 ) ( ON ?auto_719415 ?auto_719416 ) ( ON ?auto_719414 ?auto_719415 ) ( ON ?auto_719413 ?auto_719414 ) ( ON ?auto_719412 ?auto_719413 ) ( ON ?auto_719411 ?auto_719412 ) ( ON ?auto_719410 ?auto_719411 ) ( ON ?auto_719409 ?auto_719410 ) ( CLEAR ?auto_719409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_719409 )
      ( MAKE-11PILE ?auto_719409 ?auto_719410 ?auto_719411 ?auto_719412 ?auto_719413 ?auto_719414 ?auto_719415 ?auto_719416 ?auto_719417 ?auto_719418 ?auto_719419 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719456 - BLOCK
      ?auto_719457 - BLOCK
      ?auto_719458 - BLOCK
      ?auto_719459 - BLOCK
      ?auto_719460 - BLOCK
      ?auto_719461 - BLOCK
      ?auto_719462 - BLOCK
      ?auto_719463 - BLOCK
      ?auto_719464 - BLOCK
      ?auto_719465 - BLOCK
      ?auto_719466 - BLOCK
      ?auto_719467 - BLOCK
    )
    :vars
    (
      ?auto_719468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_719466 ) ( ON ?auto_719467 ?auto_719468 ) ( CLEAR ?auto_719467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_719456 ) ( ON ?auto_719457 ?auto_719456 ) ( ON ?auto_719458 ?auto_719457 ) ( ON ?auto_719459 ?auto_719458 ) ( ON ?auto_719460 ?auto_719459 ) ( ON ?auto_719461 ?auto_719460 ) ( ON ?auto_719462 ?auto_719461 ) ( ON ?auto_719463 ?auto_719462 ) ( ON ?auto_719464 ?auto_719463 ) ( ON ?auto_719465 ?auto_719464 ) ( ON ?auto_719466 ?auto_719465 ) ( not ( = ?auto_719456 ?auto_719457 ) ) ( not ( = ?auto_719456 ?auto_719458 ) ) ( not ( = ?auto_719456 ?auto_719459 ) ) ( not ( = ?auto_719456 ?auto_719460 ) ) ( not ( = ?auto_719456 ?auto_719461 ) ) ( not ( = ?auto_719456 ?auto_719462 ) ) ( not ( = ?auto_719456 ?auto_719463 ) ) ( not ( = ?auto_719456 ?auto_719464 ) ) ( not ( = ?auto_719456 ?auto_719465 ) ) ( not ( = ?auto_719456 ?auto_719466 ) ) ( not ( = ?auto_719456 ?auto_719467 ) ) ( not ( = ?auto_719456 ?auto_719468 ) ) ( not ( = ?auto_719457 ?auto_719458 ) ) ( not ( = ?auto_719457 ?auto_719459 ) ) ( not ( = ?auto_719457 ?auto_719460 ) ) ( not ( = ?auto_719457 ?auto_719461 ) ) ( not ( = ?auto_719457 ?auto_719462 ) ) ( not ( = ?auto_719457 ?auto_719463 ) ) ( not ( = ?auto_719457 ?auto_719464 ) ) ( not ( = ?auto_719457 ?auto_719465 ) ) ( not ( = ?auto_719457 ?auto_719466 ) ) ( not ( = ?auto_719457 ?auto_719467 ) ) ( not ( = ?auto_719457 ?auto_719468 ) ) ( not ( = ?auto_719458 ?auto_719459 ) ) ( not ( = ?auto_719458 ?auto_719460 ) ) ( not ( = ?auto_719458 ?auto_719461 ) ) ( not ( = ?auto_719458 ?auto_719462 ) ) ( not ( = ?auto_719458 ?auto_719463 ) ) ( not ( = ?auto_719458 ?auto_719464 ) ) ( not ( = ?auto_719458 ?auto_719465 ) ) ( not ( = ?auto_719458 ?auto_719466 ) ) ( not ( = ?auto_719458 ?auto_719467 ) ) ( not ( = ?auto_719458 ?auto_719468 ) ) ( not ( = ?auto_719459 ?auto_719460 ) ) ( not ( = ?auto_719459 ?auto_719461 ) ) ( not ( = ?auto_719459 ?auto_719462 ) ) ( not ( = ?auto_719459 ?auto_719463 ) ) ( not ( = ?auto_719459 ?auto_719464 ) ) ( not ( = ?auto_719459 ?auto_719465 ) ) ( not ( = ?auto_719459 ?auto_719466 ) ) ( not ( = ?auto_719459 ?auto_719467 ) ) ( not ( = ?auto_719459 ?auto_719468 ) ) ( not ( = ?auto_719460 ?auto_719461 ) ) ( not ( = ?auto_719460 ?auto_719462 ) ) ( not ( = ?auto_719460 ?auto_719463 ) ) ( not ( = ?auto_719460 ?auto_719464 ) ) ( not ( = ?auto_719460 ?auto_719465 ) ) ( not ( = ?auto_719460 ?auto_719466 ) ) ( not ( = ?auto_719460 ?auto_719467 ) ) ( not ( = ?auto_719460 ?auto_719468 ) ) ( not ( = ?auto_719461 ?auto_719462 ) ) ( not ( = ?auto_719461 ?auto_719463 ) ) ( not ( = ?auto_719461 ?auto_719464 ) ) ( not ( = ?auto_719461 ?auto_719465 ) ) ( not ( = ?auto_719461 ?auto_719466 ) ) ( not ( = ?auto_719461 ?auto_719467 ) ) ( not ( = ?auto_719461 ?auto_719468 ) ) ( not ( = ?auto_719462 ?auto_719463 ) ) ( not ( = ?auto_719462 ?auto_719464 ) ) ( not ( = ?auto_719462 ?auto_719465 ) ) ( not ( = ?auto_719462 ?auto_719466 ) ) ( not ( = ?auto_719462 ?auto_719467 ) ) ( not ( = ?auto_719462 ?auto_719468 ) ) ( not ( = ?auto_719463 ?auto_719464 ) ) ( not ( = ?auto_719463 ?auto_719465 ) ) ( not ( = ?auto_719463 ?auto_719466 ) ) ( not ( = ?auto_719463 ?auto_719467 ) ) ( not ( = ?auto_719463 ?auto_719468 ) ) ( not ( = ?auto_719464 ?auto_719465 ) ) ( not ( = ?auto_719464 ?auto_719466 ) ) ( not ( = ?auto_719464 ?auto_719467 ) ) ( not ( = ?auto_719464 ?auto_719468 ) ) ( not ( = ?auto_719465 ?auto_719466 ) ) ( not ( = ?auto_719465 ?auto_719467 ) ) ( not ( = ?auto_719465 ?auto_719468 ) ) ( not ( = ?auto_719466 ?auto_719467 ) ) ( not ( = ?auto_719466 ?auto_719468 ) ) ( not ( = ?auto_719467 ?auto_719468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_719467 ?auto_719468 )
      ( !STACK ?auto_719467 ?auto_719466 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719506 - BLOCK
      ?auto_719507 - BLOCK
      ?auto_719508 - BLOCK
      ?auto_719509 - BLOCK
      ?auto_719510 - BLOCK
      ?auto_719511 - BLOCK
      ?auto_719512 - BLOCK
      ?auto_719513 - BLOCK
      ?auto_719514 - BLOCK
      ?auto_719515 - BLOCK
      ?auto_719516 - BLOCK
      ?auto_719517 - BLOCK
    )
    :vars
    (
      ?auto_719518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719517 ?auto_719518 ) ( ON-TABLE ?auto_719506 ) ( ON ?auto_719507 ?auto_719506 ) ( ON ?auto_719508 ?auto_719507 ) ( ON ?auto_719509 ?auto_719508 ) ( ON ?auto_719510 ?auto_719509 ) ( ON ?auto_719511 ?auto_719510 ) ( ON ?auto_719512 ?auto_719511 ) ( ON ?auto_719513 ?auto_719512 ) ( ON ?auto_719514 ?auto_719513 ) ( ON ?auto_719515 ?auto_719514 ) ( not ( = ?auto_719506 ?auto_719507 ) ) ( not ( = ?auto_719506 ?auto_719508 ) ) ( not ( = ?auto_719506 ?auto_719509 ) ) ( not ( = ?auto_719506 ?auto_719510 ) ) ( not ( = ?auto_719506 ?auto_719511 ) ) ( not ( = ?auto_719506 ?auto_719512 ) ) ( not ( = ?auto_719506 ?auto_719513 ) ) ( not ( = ?auto_719506 ?auto_719514 ) ) ( not ( = ?auto_719506 ?auto_719515 ) ) ( not ( = ?auto_719506 ?auto_719516 ) ) ( not ( = ?auto_719506 ?auto_719517 ) ) ( not ( = ?auto_719506 ?auto_719518 ) ) ( not ( = ?auto_719507 ?auto_719508 ) ) ( not ( = ?auto_719507 ?auto_719509 ) ) ( not ( = ?auto_719507 ?auto_719510 ) ) ( not ( = ?auto_719507 ?auto_719511 ) ) ( not ( = ?auto_719507 ?auto_719512 ) ) ( not ( = ?auto_719507 ?auto_719513 ) ) ( not ( = ?auto_719507 ?auto_719514 ) ) ( not ( = ?auto_719507 ?auto_719515 ) ) ( not ( = ?auto_719507 ?auto_719516 ) ) ( not ( = ?auto_719507 ?auto_719517 ) ) ( not ( = ?auto_719507 ?auto_719518 ) ) ( not ( = ?auto_719508 ?auto_719509 ) ) ( not ( = ?auto_719508 ?auto_719510 ) ) ( not ( = ?auto_719508 ?auto_719511 ) ) ( not ( = ?auto_719508 ?auto_719512 ) ) ( not ( = ?auto_719508 ?auto_719513 ) ) ( not ( = ?auto_719508 ?auto_719514 ) ) ( not ( = ?auto_719508 ?auto_719515 ) ) ( not ( = ?auto_719508 ?auto_719516 ) ) ( not ( = ?auto_719508 ?auto_719517 ) ) ( not ( = ?auto_719508 ?auto_719518 ) ) ( not ( = ?auto_719509 ?auto_719510 ) ) ( not ( = ?auto_719509 ?auto_719511 ) ) ( not ( = ?auto_719509 ?auto_719512 ) ) ( not ( = ?auto_719509 ?auto_719513 ) ) ( not ( = ?auto_719509 ?auto_719514 ) ) ( not ( = ?auto_719509 ?auto_719515 ) ) ( not ( = ?auto_719509 ?auto_719516 ) ) ( not ( = ?auto_719509 ?auto_719517 ) ) ( not ( = ?auto_719509 ?auto_719518 ) ) ( not ( = ?auto_719510 ?auto_719511 ) ) ( not ( = ?auto_719510 ?auto_719512 ) ) ( not ( = ?auto_719510 ?auto_719513 ) ) ( not ( = ?auto_719510 ?auto_719514 ) ) ( not ( = ?auto_719510 ?auto_719515 ) ) ( not ( = ?auto_719510 ?auto_719516 ) ) ( not ( = ?auto_719510 ?auto_719517 ) ) ( not ( = ?auto_719510 ?auto_719518 ) ) ( not ( = ?auto_719511 ?auto_719512 ) ) ( not ( = ?auto_719511 ?auto_719513 ) ) ( not ( = ?auto_719511 ?auto_719514 ) ) ( not ( = ?auto_719511 ?auto_719515 ) ) ( not ( = ?auto_719511 ?auto_719516 ) ) ( not ( = ?auto_719511 ?auto_719517 ) ) ( not ( = ?auto_719511 ?auto_719518 ) ) ( not ( = ?auto_719512 ?auto_719513 ) ) ( not ( = ?auto_719512 ?auto_719514 ) ) ( not ( = ?auto_719512 ?auto_719515 ) ) ( not ( = ?auto_719512 ?auto_719516 ) ) ( not ( = ?auto_719512 ?auto_719517 ) ) ( not ( = ?auto_719512 ?auto_719518 ) ) ( not ( = ?auto_719513 ?auto_719514 ) ) ( not ( = ?auto_719513 ?auto_719515 ) ) ( not ( = ?auto_719513 ?auto_719516 ) ) ( not ( = ?auto_719513 ?auto_719517 ) ) ( not ( = ?auto_719513 ?auto_719518 ) ) ( not ( = ?auto_719514 ?auto_719515 ) ) ( not ( = ?auto_719514 ?auto_719516 ) ) ( not ( = ?auto_719514 ?auto_719517 ) ) ( not ( = ?auto_719514 ?auto_719518 ) ) ( not ( = ?auto_719515 ?auto_719516 ) ) ( not ( = ?auto_719515 ?auto_719517 ) ) ( not ( = ?auto_719515 ?auto_719518 ) ) ( not ( = ?auto_719516 ?auto_719517 ) ) ( not ( = ?auto_719516 ?auto_719518 ) ) ( not ( = ?auto_719517 ?auto_719518 ) ) ( CLEAR ?auto_719515 ) ( ON ?auto_719516 ?auto_719517 ) ( CLEAR ?auto_719516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_719506 ?auto_719507 ?auto_719508 ?auto_719509 ?auto_719510 ?auto_719511 ?auto_719512 ?auto_719513 ?auto_719514 ?auto_719515 ?auto_719516 )
      ( MAKE-12PILE ?auto_719506 ?auto_719507 ?auto_719508 ?auto_719509 ?auto_719510 ?auto_719511 ?auto_719512 ?auto_719513 ?auto_719514 ?auto_719515 ?auto_719516 ?auto_719517 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719556 - BLOCK
      ?auto_719557 - BLOCK
      ?auto_719558 - BLOCK
      ?auto_719559 - BLOCK
      ?auto_719560 - BLOCK
      ?auto_719561 - BLOCK
      ?auto_719562 - BLOCK
      ?auto_719563 - BLOCK
      ?auto_719564 - BLOCK
      ?auto_719565 - BLOCK
      ?auto_719566 - BLOCK
      ?auto_719567 - BLOCK
    )
    :vars
    (
      ?auto_719568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719567 ?auto_719568 ) ( ON-TABLE ?auto_719556 ) ( ON ?auto_719557 ?auto_719556 ) ( ON ?auto_719558 ?auto_719557 ) ( ON ?auto_719559 ?auto_719558 ) ( ON ?auto_719560 ?auto_719559 ) ( ON ?auto_719561 ?auto_719560 ) ( ON ?auto_719562 ?auto_719561 ) ( ON ?auto_719563 ?auto_719562 ) ( ON ?auto_719564 ?auto_719563 ) ( not ( = ?auto_719556 ?auto_719557 ) ) ( not ( = ?auto_719556 ?auto_719558 ) ) ( not ( = ?auto_719556 ?auto_719559 ) ) ( not ( = ?auto_719556 ?auto_719560 ) ) ( not ( = ?auto_719556 ?auto_719561 ) ) ( not ( = ?auto_719556 ?auto_719562 ) ) ( not ( = ?auto_719556 ?auto_719563 ) ) ( not ( = ?auto_719556 ?auto_719564 ) ) ( not ( = ?auto_719556 ?auto_719565 ) ) ( not ( = ?auto_719556 ?auto_719566 ) ) ( not ( = ?auto_719556 ?auto_719567 ) ) ( not ( = ?auto_719556 ?auto_719568 ) ) ( not ( = ?auto_719557 ?auto_719558 ) ) ( not ( = ?auto_719557 ?auto_719559 ) ) ( not ( = ?auto_719557 ?auto_719560 ) ) ( not ( = ?auto_719557 ?auto_719561 ) ) ( not ( = ?auto_719557 ?auto_719562 ) ) ( not ( = ?auto_719557 ?auto_719563 ) ) ( not ( = ?auto_719557 ?auto_719564 ) ) ( not ( = ?auto_719557 ?auto_719565 ) ) ( not ( = ?auto_719557 ?auto_719566 ) ) ( not ( = ?auto_719557 ?auto_719567 ) ) ( not ( = ?auto_719557 ?auto_719568 ) ) ( not ( = ?auto_719558 ?auto_719559 ) ) ( not ( = ?auto_719558 ?auto_719560 ) ) ( not ( = ?auto_719558 ?auto_719561 ) ) ( not ( = ?auto_719558 ?auto_719562 ) ) ( not ( = ?auto_719558 ?auto_719563 ) ) ( not ( = ?auto_719558 ?auto_719564 ) ) ( not ( = ?auto_719558 ?auto_719565 ) ) ( not ( = ?auto_719558 ?auto_719566 ) ) ( not ( = ?auto_719558 ?auto_719567 ) ) ( not ( = ?auto_719558 ?auto_719568 ) ) ( not ( = ?auto_719559 ?auto_719560 ) ) ( not ( = ?auto_719559 ?auto_719561 ) ) ( not ( = ?auto_719559 ?auto_719562 ) ) ( not ( = ?auto_719559 ?auto_719563 ) ) ( not ( = ?auto_719559 ?auto_719564 ) ) ( not ( = ?auto_719559 ?auto_719565 ) ) ( not ( = ?auto_719559 ?auto_719566 ) ) ( not ( = ?auto_719559 ?auto_719567 ) ) ( not ( = ?auto_719559 ?auto_719568 ) ) ( not ( = ?auto_719560 ?auto_719561 ) ) ( not ( = ?auto_719560 ?auto_719562 ) ) ( not ( = ?auto_719560 ?auto_719563 ) ) ( not ( = ?auto_719560 ?auto_719564 ) ) ( not ( = ?auto_719560 ?auto_719565 ) ) ( not ( = ?auto_719560 ?auto_719566 ) ) ( not ( = ?auto_719560 ?auto_719567 ) ) ( not ( = ?auto_719560 ?auto_719568 ) ) ( not ( = ?auto_719561 ?auto_719562 ) ) ( not ( = ?auto_719561 ?auto_719563 ) ) ( not ( = ?auto_719561 ?auto_719564 ) ) ( not ( = ?auto_719561 ?auto_719565 ) ) ( not ( = ?auto_719561 ?auto_719566 ) ) ( not ( = ?auto_719561 ?auto_719567 ) ) ( not ( = ?auto_719561 ?auto_719568 ) ) ( not ( = ?auto_719562 ?auto_719563 ) ) ( not ( = ?auto_719562 ?auto_719564 ) ) ( not ( = ?auto_719562 ?auto_719565 ) ) ( not ( = ?auto_719562 ?auto_719566 ) ) ( not ( = ?auto_719562 ?auto_719567 ) ) ( not ( = ?auto_719562 ?auto_719568 ) ) ( not ( = ?auto_719563 ?auto_719564 ) ) ( not ( = ?auto_719563 ?auto_719565 ) ) ( not ( = ?auto_719563 ?auto_719566 ) ) ( not ( = ?auto_719563 ?auto_719567 ) ) ( not ( = ?auto_719563 ?auto_719568 ) ) ( not ( = ?auto_719564 ?auto_719565 ) ) ( not ( = ?auto_719564 ?auto_719566 ) ) ( not ( = ?auto_719564 ?auto_719567 ) ) ( not ( = ?auto_719564 ?auto_719568 ) ) ( not ( = ?auto_719565 ?auto_719566 ) ) ( not ( = ?auto_719565 ?auto_719567 ) ) ( not ( = ?auto_719565 ?auto_719568 ) ) ( not ( = ?auto_719566 ?auto_719567 ) ) ( not ( = ?auto_719566 ?auto_719568 ) ) ( not ( = ?auto_719567 ?auto_719568 ) ) ( ON ?auto_719566 ?auto_719567 ) ( CLEAR ?auto_719564 ) ( ON ?auto_719565 ?auto_719566 ) ( CLEAR ?auto_719565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_719556 ?auto_719557 ?auto_719558 ?auto_719559 ?auto_719560 ?auto_719561 ?auto_719562 ?auto_719563 ?auto_719564 ?auto_719565 )
      ( MAKE-12PILE ?auto_719556 ?auto_719557 ?auto_719558 ?auto_719559 ?auto_719560 ?auto_719561 ?auto_719562 ?auto_719563 ?auto_719564 ?auto_719565 ?auto_719566 ?auto_719567 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719606 - BLOCK
      ?auto_719607 - BLOCK
      ?auto_719608 - BLOCK
      ?auto_719609 - BLOCK
      ?auto_719610 - BLOCK
      ?auto_719611 - BLOCK
      ?auto_719612 - BLOCK
      ?auto_719613 - BLOCK
      ?auto_719614 - BLOCK
      ?auto_719615 - BLOCK
      ?auto_719616 - BLOCK
      ?auto_719617 - BLOCK
    )
    :vars
    (
      ?auto_719618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719617 ?auto_719618 ) ( ON-TABLE ?auto_719606 ) ( ON ?auto_719607 ?auto_719606 ) ( ON ?auto_719608 ?auto_719607 ) ( ON ?auto_719609 ?auto_719608 ) ( ON ?auto_719610 ?auto_719609 ) ( ON ?auto_719611 ?auto_719610 ) ( ON ?auto_719612 ?auto_719611 ) ( ON ?auto_719613 ?auto_719612 ) ( not ( = ?auto_719606 ?auto_719607 ) ) ( not ( = ?auto_719606 ?auto_719608 ) ) ( not ( = ?auto_719606 ?auto_719609 ) ) ( not ( = ?auto_719606 ?auto_719610 ) ) ( not ( = ?auto_719606 ?auto_719611 ) ) ( not ( = ?auto_719606 ?auto_719612 ) ) ( not ( = ?auto_719606 ?auto_719613 ) ) ( not ( = ?auto_719606 ?auto_719614 ) ) ( not ( = ?auto_719606 ?auto_719615 ) ) ( not ( = ?auto_719606 ?auto_719616 ) ) ( not ( = ?auto_719606 ?auto_719617 ) ) ( not ( = ?auto_719606 ?auto_719618 ) ) ( not ( = ?auto_719607 ?auto_719608 ) ) ( not ( = ?auto_719607 ?auto_719609 ) ) ( not ( = ?auto_719607 ?auto_719610 ) ) ( not ( = ?auto_719607 ?auto_719611 ) ) ( not ( = ?auto_719607 ?auto_719612 ) ) ( not ( = ?auto_719607 ?auto_719613 ) ) ( not ( = ?auto_719607 ?auto_719614 ) ) ( not ( = ?auto_719607 ?auto_719615 ) ) ( not ( = ?auto_719607 ?auto_719616 ) ) ( not ( = ?auto_719607 ?auto_719617 ) ) ( not ( = ?auto_719607 ?auto_719618 ) ) ( not ( = ?auto_719608 ?auto_719609 ) ) ( not ( = ?auto_719608 ?auto_719610 ) ) ( not ( = ?auto_719608 ?auto_719611 ) ) ( not ( = ?auto_719608 ?auto_719612 ) ) ( not ( = ?auto_719608 ?auto_719613 ) ) ( not ( = ?auto_719608 ?auto_719614 ) ) ( not ( = ?auto_719608 ?auto_719615 ) ) ( not ( = ?auto_719608 ?auto_719616 ) ) ( not ( = ?auto_719608 ?auto_719617 ) ) ( not ( = ?auto_719608 ?auto_719618 ) ) ( not ( = ?auto_719609 ?auto_719610 ) ) ( not ( = ?auto_719609 ?auto_719611 ) ) ( not ( = ?auto_719609 ?auto_719612 ) ) ( not ( = ?auto_719609 ?auto_719613 ) ) ( not ( = ?auto_719609 ?auto_719614 ) ) ( not ( = ?auto_719609 ?auto_719615 ) ) ( not ( = ?auto_719609 ?auto_719616 ) ) ( not ( = ?auto_719609 ?auto_719617 ) ) ( not ( = ?auto_719609 ?auto_719618 ) ) ( not ( = ?auto_719610 ?auto_719611 ) ) ( not ( = ?auto_719610 ?auto_719612 ) ) ( not ( = ?auto_719610 ?auto_719613 ) ) ( not ( = ?auto_719610 ?auto_719614 ) ) ( not ( = ?auto_719610 ?auto_719615 ) ) ( not ( = ?auto_719610 ?auto_719616 ) ) ( not ( = ?auto_719610 ?auto_719617 ) ) ( not ( = ?auto_719610 ?auto_719618 ) ) ( not ( = ?auto_719611 ?auto_719612 ) ) ( not ( = ?auto_719611 ?auto_719613 ) ) ( not ( = ?auto_719611 ?auto_719614 ) ) ( not ( = ?auto_719611 ?auto_719615 ) ) ( not ( = ?auto_719611 ?auto_719616 ) ) ( not ( = ?auto_719611 ?auto_719617 ) ) ( not ( = ?auto_719611 ?auto_719618 ) ) ( not ( = ?auto_719612 ?auto_719613 ) ) ( not ( = ?auto_719612 ?auto_719614 ) ) ( not ( = ?auto_719612 ?auto_719615 ) ) ( not ( = ?auto_719612 ?auto_719616 ) ) ( not ( = ?auto_719612 ?auto_719617 ) ) ( not ( = ?auto_719612 ?auto_719618 ) ) ( not ( = ?auto_719613 ?auto_719614 ) ) ( not ( = ?auto_719613 ?auto_719615 ) ) ( not ( = ?auto_719613 ?auto_719616 ) ) ( not ( = ?auto_719613 ?auto_719617 ) ) ( not ( = ?auto_719613 ?auto_719618 ) ) ( not ( = ?auto_719614 ?auto_719615 ) ) ( not ( = ?auto_719614 ?auto_719616 ) ) ( not ( = ?auto_719614 ?auto_719617 ) ) ( not ( = ?auto_719614 ?auto_719618 ) ) ( not ( = ?auto_719615 ?auto_719616 ) ) ( not ( = ?auto_719615 ?auto_719617 ) ) ( not ( = ?auto_719615 ?auto_719618 ) ) ( not ( = ?auto_719616 ?auto_719617 ) ) ( not ( = ?auto_719616 ?auto_719618 ) ) ( not ( = ?auto_719617 ?auto_719618 ) ) ( ON ?auto_719616 ?auto_719617 ) ( ON ?auto_719615 ?auto_719616 ) ( CLEAR ?auto_719613 ) ( ON ?auto_719614 ?auto_719615 ) ( CLEAR ?auto_719614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_719606 ?auto_719607 ?auto_719608 ?auto_719609 ?auto_719610 ?auto_719611 ?auto_719612 ?auto_719613 ?auto_719614 )
      ( MAKE-12PILE ?auto_719606 ?auto_719607 ?auto_719608 ?auto_719609 ?auto_719610 ?auto_719611 ?auto_719612 ?auto_719613 ?auto_719614 ?auto_719615 ?auto_719616 ?auto_719617 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719656 - BLOCK
      ?auto_719657 - BLOCK
      ?auto_719658 - BLOCK
      ?auto_719659 - BLOCK
      ?auto_719660 - BLOCK
      ?auto_719661 - BLOCK
      ?auto_719662 - BLOCK
      ?auto_719663 - BLOCK
      ?auto_719664 - BLOCK
      ?auto_719665 - BLOCK
      ?auto_719666 - BLOCK
      ?auto_719667 - BLOCK
    )
    :vars
    (
      ?auto_719668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719667 ?auto_719668 ) ( ON-TABLE ?auto_719656 ) ( ON ?auto_719657 ?auto_719656 ) ( ON ?auto_719658 ?auto_719657 ) ( ON ?auto_719659 ?auto_719658 ) ( ON ?auto_719660 ?auto_719659 ) ( ON ?auto_719661 ?auto_719660 ) ( ON ?auto_719662 ?auto_719661 ) ( not ( = ?auto_719656 ?auto_719657 ) ) ( not ( = ?auto_719656 ?auto_719658 ) ) ( not ( = ?auto_719656 ?auto_719659 ) ) ( not ( = ?auto_719656 ?auto_719660 ) ) ( not ( = ?auto_719656 ?auto_719661 ) ) ( not ( = ?auto_719656 ?auto_719662 ) ) ( not ( = ?auto_719656 ?auto_719663 ) ) ( not ( = ?auto_719656 ?auto_719664 ) ) ( not ( = ?auto_719656 ?auto_719665 ) ) ( not ( = ?auto_719656 ?auto_719666 ) ) ( not ( = ?auto_719656 ?auto_719667 ) ) ( not ( = ?auto_719656 ?auto_719668 ) ) ( not ( = ?auto_719657 ?auto_719658 ) ) ( not ( = ?auto_719657 ?auto_719659 ) ) ( not ( = ?auto_719657 ?auto_719660 ) ) ( not ( = ?auto_719657 ?auto_719661 ) ) ( not ( = ?auto_719657 ?auto_719662 ) ) ( not ( = ?auto_719657 ?auto_719663 ) ) ( not ( = ?auto_719657 ?auto_719664 ) ) ( not ( = ?auto_719657 ?auto_719665 ) ) ( not ( = ?auto_719657 ?auto_719666 ) ) ( not ( = ?auto_719657 ?auto_719667 ) ) ( not ( = ?auto_719657 ?auto_719668 ) ) ( not ( = ?auto_719658 ?auto_719659 ) ) ( not ( = ?auto_719658 ?auto_719660 ) ) ( not ( = ?auto_719658 ?auto_719661 ) ) ( not ( = ?auto_719658 ?auto_719662 ) ) ( not ( = ?auto_719658 ?auto_719663 ) ) ( not ( = ?auto_719658 ?auto_719664 ) ) ( not ( = ?auto_719658 ?auto_719665 ) ) ( not ( = ?auto_719658 ?auto_719666 ) ) ( not ( = ?auto_719658 ?auto_719667 ) ) ( not ( = ?auto_719658 ?auto_719668 ) ) ( not ( = ?auto_719659 ?auto_719660 ) ) ( not ( = ?auto_719659 ?auto_719661 ) ) ( not ( = ?auto_719659 ?auto_719662 ) ) ( not ( = ?auto_719659 ?auto_719663 ) ) ( not ( = ?auto_719659 ?auto_719664 ) ) ( not ( = ?auto_719659 ?auto_719665 ) ) ( not ( = ?auto_719659 ?auto_719666 ) ) ( not ( = ?auto_719659 ?auto_719667 ) ) ( not ( = ?auto_719659 ?auto_719668 ) ) ( not ( = ?auto_719660 ?auto_719661 ) ) ( not ( = ?auto_719660 ?auto_719662 ) ) ( not ( = ?auto_719660 ?auto_719663 ) ) ( not ( = ?auto_719660 ?auto_719664 ) ) ( not ( = ?auto_719660 ?auto_719665 ) ) ( not ( = ?auto_719660 ?auto_719666 ) ) ( not ( = ?auto_719660 ?auto_719667 ) ) ( not ( = ?auto_719660 ?auto_719668 ) ) ( not ( = ?auto_719661 ?auto_719662 ) ) ( not ( = ?auto_719661 ?auto_719663 ) ) ( not ( = ?auto_719661 ?auto_719664 ) ) ( not ( = ?auto_719661 ?auto_719665 ) ) ( not ( = ?auto_719661 ?auto_719666 ) ) ( not ( = ?auto_719661 ?auto_719667 ) ) ( not ( = ?auto_719661 ?auto_719668 ) ) ( not ( = ?auto_719662 ?auto_719663 ) ) ( not ( = ?auto_719662 ?auto_719664 ) ) ( not ( = ?auto_719662 ?auto_719665 ) ) ( not ( = ?auto_719662 ?auto_719666 ) ) ( not ( = ?auto_719662 ?auto_719667 ) ) ( not ( = ?auto_719662 ?auto_719668 ) ) ( not ( = ?auto_719663 ?auto_719664 ) ) ( not ( = ?auto_719663 ?auto_719665 ) ) ( not ( = ?auto_719663 ?auto_719666 ) ) ( not ( = ?auto_719663 ?auto_719667 ) ) ( not ( = ?auto_719663 ?auto_719668 ) ) ( not ( = ?auto_719664 ?auto_719665 ) ) ( not ( = ?auto_719664 ?auto_719666 ) ) ( not ( = ?auto_719664 ?auto_719667 ) ) ( not ( = ?auto_719664 ?auto_719668 ) ) ( not ( = ?auto_719665 ?auto_719666 ) ) ( not ( = ?auto_719665 ?auto_719667 ) ) ( not ( = ?auto_719665 ?auto_719668 ) ) ( not ( = ?auto_719666 ?auto_719667 ) ) ( not ( = ?auto_719666 ?auto_719668 ) ) ( not ( = ?auto_719667 ?auto_719668 ) ) ( ON ?auto_719666 ?auto_719667 ) ( ON ?auto_719665 ?auto_719666 ) ( ON ?auto_719664 ?auto_719665 ) ( CLEAR ?auto_719662 ) ( ON ?auto_719663 ?auto_719664 ) ( CLEAR ?auto_719663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_719656 ?auto_719657 ?auto_719658 ?auto_719659 ?auto_719660 ?auto_719661 ?auto_719662 ?auto_719663 )
      ( MAKE-12PILE ?auto_719656 ?auto_719657 ?auto_719658 ?auto_719659 ?auto_719660 ?auto_719661 ?auto_719662 ?auto_719663 ?auto_719664 ?auto_719665 ?auto_719666 ?auto_719667 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719706 - BLOCK
      ?auto_719707 - BLOCK
      ?auto_719708 - BLOCK
      ?auto_719709 - BLOCK
      ?auto_719710 - BLOCK
      ?auto_719711 - BLOCK
      ?auto_719712 - BLOCK
      ?auto_719713 - BLOCK
      ?auto_719714 - BLOCK
      ?auto_719715 - BLOCK
      ?auto_719716 - BLOCK
      ?auto_719717 - BLOCK
    )
    :vars
    (
      ?auto_719718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719717 ?auto_719718 ) ( ON-TABLE ?auto_719706 ) ( ON ?auto_719707 ?auto_719706 ) ( ON ?auto_719708 ?auto_719707 ) ( ON ?auto_719709 ?auto_719708 ) ( ON ?auto_719710 ?auto_719709 ) ( ON ?auto_719711 ?auto_719710 ) ( not ( = ?auto_719706 ?auto_719707 ) ) ( not ( = ?auto_719706 ?auto_719708 ) ) ( not ( = ?auto_719706 ?auto_719709 ) ) ( not ( = ?auto_719706 ?auto_719710 ) ) ( not ( = ?auto_719706 ?auto_719711 ) ) ( not ( = ?auto_719706 ?auto_719712 ) ) ( not ( = ?auto_719706 ?auto_719713 ) ) ( not ( = ?auto_719706 ?auto_719714 ) ) ( not ( = ?auto_719706 ?auto_719715 ) ) ( not ( = ?auto_719706 ?auto_719716 ) ) ( not ( = ?auto_719706 ?auto_719717 ) ) ( not ( = ?auto_719706 ?auto_719718 ) ) ( not ( = ?auto_719707 ?auto_719708 ) ) ( not ( = ?auto_719707 ?auto_719709 ) ) ( not ( = ?auto_719707 ?auto_719710 ) ) ( not ( = ?auto_719707 ?auto_719711 ) ) ( not ( = ?auto_719707 ?auto_719712 ) ) ( not ( = ?auto_719707 ?auto_719713 ) ) ( not ( = ?auto_719707 ?auto_719714 ) ) ( not ( = ?auto_719707 ?auto_719715 ) ) ( not ( = ?auto_719707 ?auto_719716 ) ) ( not ( = ?auto_719707 ?auto_719717 ) ) ( not ( = ?auto_719707 ?auto_719718 ) ) ( not ( = ?auto_719708 ?auto_719709 ) ) ( not ( = ?auto_719708 ?auto_719710 ) ) ( not ( = ?auto_719708 ?auto_719711 ) ) ( not ( = ?auto_719708 ?auto_719712 ) ) ( not ( = ?auto_719708 ?auto_719713 ) ) ( not ( = ?auto_719708 ?auto_719714 ) ) ( not ( = ?auto_719708 ?auto_719715 ) ) ( not ( = ?auto_719708 ?auto_719716 ) ) ( not ( = ?auto_719708 ?auto_719717 ) ) ( not ( = ?auto_719708 ?auto_719718 ) ) ( not ( = ?auto_719709 ?auto_719710 ) ) ( not ( = ?auto_719709 ?auto_719711 ) ) ( not ( = ?auto_719709 ?auto_719712 ) ) ( not ( = ?auto_719709 ?auto_719713 ) ) ( not ( = ?auto_719709 ?auto_719714 ) ) ( not ( = ?auto_719709 ?auto_719715 ) ) ( not ( = ?auto_719709 ?auto_719716 ) ) ( not ( = ?auto_719709 ?auto_719717 ) ) ( not ( = ?auto_719709 ?auto_719718 ) ) ( not ( = ?auto_719710 ?auto_719711 ) ) ( not ( = ?auto_719710 ?auto_719712 ) ) ( not ( = ?auto_719710 ?auto_719713 ) ) ( not ( = ?auto_719710 ?auto_719714 ) ) ( not ( = ?auto_719710 ?auto_719715 ) ) ( not ( = ?auto_719710 ?auto_719716 ) ) ( not ( = ?auto_719710 ?auto_719717 ) ) ( not ( = ?auto_719710 ?auto_719718 ) ) ( not ( = ?auto_719711 ?auto_719712 ) ) ( not ( = ?auto_719711 ?auto_719713 ) ) ( not ( = ?auto_719711 ?auto_719714 ) ) ( not ( = ?auto_719711 ?auto_719715 ) ) ( not ( = ?auto_719711 ?auto_719716 ) ) ( not ( = ?auto_719711 ?auto_719717 ) ) ( not ( = ?auto_719711 ?auto_719718 ) ) ( not ( = ?auto_719712 ?auto_719713 ) ) ( not ( = ?auto_719712 ?auto_719714 ) ) ( not ( = ?auto_719712 ?auto_719715 ) ) ( not ( = ?auto_719712 ?auto_719716 ) ) ( not ( = ?auto_719712 ?auto_719717 ) ) ( not ( = ?auto_719712 ?auto_719718 ) ) ( not ( = ?auto_719713 ?auto_719714 ) ) ( not ( = ?auto_719713 ?auto_719715 ) ) ( not ( = ?auto_719713 ?auto_719716 ) ) ( not ( = ?auto_719713 ?auto_719717 ) ) ( not ( = ?auto_719713 ?auto_719718 ) ) ( not ( = ?auto_719714 ?auto_719715 ) ) ( not ( = ?auto_719714 ?auto_719716 ) ) ( not ( = ?auto_719714 ?auto_719717 ) ) ( not ( = ?auto_719714 ?auto_719718 ) ) ( not ( = ?auto_719715 ?auto_719716 ) ) ( not ( = ?auto_719715 ?auto_719717 ) ) ( not ( = ?auto_719715 ?auto_719718 ) ) ( not ( = ?auto_719716 ?auto_719717 ) ) ( not ( = ?auto_719716 ?auto_719718 ) ) ( not ( = ?auto_719717 ?auto_719718 ) ) ( ON ?auto_719716 ?auto_719717 ) ( ON ?auto_719715 ?auto_719716 ) ( ON ?auto_719714 ?auto_719715 ) ( ON ?auto_719713 ?auto_719714 ) ( CLEAR ?auto_719711 ) ( ON ?auto_719712 ?auto_719713 ) ( CLEAR ?auto_719712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_719706 ?auto_719707 ?auto_719708 ?auto_719709 ?auto_719710 ?auto_719711 ?auto_719712 )
      ( MAKE-12PILE ?auto_719706 ?auto_719707 ?auto_719708 ?auto_719709 ?auto_719710 ?auto_719711 ?auto_719712 ?auto_719713 ?auto_719714 ?auto_719715 ?auto_719716 ?auto_719717 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719756 - BLOCK
      ?auto_719757 - BLOCK
      ?auto_719758 - BLOCK
      ?auto_719759 - BLOCK
      ?auto_719760 - BLOCK
      ?auto_719761 - BLOCK
      ?auto_719762 - BLOCK
      ?auto_719763 - BLOCK
      ?auto_719764 - BLOCK
      ?auto_719765 - BLOCK
      ?auto_719766 - BLOCK
      ?auto_719767 - BLOCK
    )
    :vars
    (
      ?auto_719768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719767 ?auto_719768 ) ( ON-TABLE ?auto_719756 ) ( ON ?auto_719757 ?auto_719756 ) ( ON ?auto_719758 ?auto_719757 ) ( ON ?auto_719759 ?auto_719758 ) ( ON ?auto_719760 ?auto_719759 ) ( not ( = ?auto_719756 ?auto_719757 ) ) ( not ( = ?auto_719756 ?auto_719758 ) ) ( not ( = ?auto_719756 ?auto_719759 ) ) ( not ( = ?auto_719756 ?auto_719760 ) ) ( not ( = ?auto_719756 ?auto_719761 ) ) ( not ( = ?auto_719756 ?auto_719762 ) ) ( not ( = ?auto_719756 ?auto_719763 ) ) ( not ( = ?auto_719756 ?auto_719764 ) ) ( not ( = ?auto_719756 ?auto_719765 ) ) ( not ( = ?auto_719756 ?auto_719766 ) ) ( not ( = ?auto_719756 ?auto_719767 ) ) ( not ( = ?auto_719756 ?auto_719768 ) ) ( not ( = ?auto_719757 ?auto_719758 ) ) ( not ( = ?auto_719757 ?auto_719759 ) ) ( not ( = ?auto_719757 ?auto_719760 ) ) ( not ( = ?auto_719757 ?auto_719761 ) ) ( not ( = ?auto_719757 ?auto_719762 ) ) ( not ( = ?auto_719757 ?auto_719763 ) ) ( not ( = ?auto_719757 ?auto_719764 ) ) ( not ( = ?auto_719757 ?auto_719765 ) ) ( not ( = ?auto_719757 ?auto_719766 ) ) ( not ( = ?auto_719757 ?auto_719767 ) ) ( not ( = ?auto_719757 ?auto_719768 ) ) ( not ( = ?auto_719758 ?auto_719759 ) ) ( not ( = ?auto_719758 ?auto_719760 ) ) ( not ( = ?auto_719758 ?auto_719761 ) ) ( not ( = ?auto_719758 ?auto_719762 ) ) ( not ( = ?auto_719758 ?auto_719763 ) ) ( not ( = ?auto_719758 ?auto_719764 ) ) ( not ( = ?auto_719758 ?auto_719765 ) ) ( not ( = ?auto_719758 ?auto_719766 ) ) ( not ( = ?auto_719758 ?auto_719767 ) ) ( not ( = ?auto_719758 ?auto_719768 ) ) ( not ( = ?auto_719759 ?auto_719760 ) ) ( not ( = ?auto_719759 ?auto_719761 ) ) ( not ( = ?auto_719759 ?auto_719762 ) ) ( not ( = ?auto_719759 ?auto_719763 ) ) ( not ( = ?auto_719759 ?auto_719764 ) ) ( not ( = ?auto_719759 ?auto_719765 ) ) ( not ( = ?auto_719759 ?auto_719766 ) ) ( not ( = ?auto_719759 ?auto_719767 ) ) ( not ( = ?auto_719759 ?auto_719768 ) ) ( not ( = ?auto_719760 ?auto_719761 ) ) ( not ( = ?auto_719760 ?auto_719762 ) ) ( not ( = ?auto_719760 ?auto_719763 ) ) ( not ( = ?auto_719760 ?auto_719764 ) ) ( not ( = ?auto_719760 ?auto_719765 ) ) ( not ( = ?auto_719760 ?auto_719766 ) ) ( not ( = ?auto_719760 ?auto_719767 ) ) ( not ( = ?auto_719760 ?auto_719768 ) ) ( not ( = ?auto_719761 ?auto_719762 ) ) ( not ( = ?auto_719761 ?auto_719763 ) ) ( not ( = ?auto_719761 ?auto_719764 ) ) ( not ( = ?auto_719761 ?auto_719765 ) ) ( not ( = ?auto_719761 ?auto_719766 ) ) ( not ( = ?auto_719761 ?auto_719767 ) ) ( not ( = ?auto_719761 ?auto_719768 ) ) ( not ( = ?auto_719762 ?auto_719763 ) ) ( not ( = ?auto_719762 ?auto_719764 ) ) ( not ( = ?auto_719762 ?auto_719765 ) ) ( not ( = ?auto_719762 ?auto_719766 ) ) ( not ( = ?auto_719762 ?auto_719767 ) ) ( not ( = ?auto_719762 ?auto_719768 ) ) ( not ( = ?auto_719763 ?auto_719764 ) ) ( not ( = ?auto_719763 ?auto_719765 ) ) ( not ( = ?auto_719763 ?auto_719766 ) ) ( not ( = ?auto_719763 ?auto_719767 ) ) ( not ( = ?auto_719763 ?auto_719768 ) ) ( not ( = ?auto_719764 ?auto_719765 ) ) ( not ( = ?auto_719764 ?auto_719766 ) ) ( not ( = ?auto_719764 ?auto_719767 ) ) ( not ( = ?auto_719764 ?auto_719768 ) ) ( not ( = ?auto_719765 ?auto_719766 ) ) ( not ( = ?auto_719765 ?auto_719767 ) ) ( not ( = ?auto_719765 ?auto_719768 ) ) ( not ( = ?auto_719766 ?auto_719767 ) ) ( not ( = ?auto_719766 ?auto_719768 ) ) ( not ( = ?auto_719767 ?auto_719768 ) ) ( ON ?auto_719766 ?auto_719767 ) ( ON ?auto_719765 ?auto_719766 ) ( ON ?auto_719764 ?auto_719765 ) ( ON ?auto_719763 ?auto_719764 ) ( ON ?auto_719762 ?auto_719763 ) ( CLEAR ?auto_719760 ) ( ON ?auto_719761 ?auto_719762 ) ( CLEAR ?auto_719761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_719756 ?auto_719757 ?auto_719758 ?auto_719759 ?auto_719760 ?auto_719761 )
      ( MAKE-12PILE ?auto_719756 ?auto_719757 ?auto_719758 ?auto_719759 ?auto_719760 ?auto_719761 ?auto_719762 ?auto_719763 ?auto_719764 ?auto_719765 ?auto_719766 ?auto_719767 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719806 - BLOCK
      ?auto_719807 - BLOCK
      ?auto_719808 - BLOCK
      ?auto_719809 - BLOCK
      ?auto_719810 - BLOCK
      ?auto_719811 - BLOCK
      ?auto_719812 - BLOCK
      ?auto_719813 - BLOCK
      ?auto_719814 - BLOCK
      ?auto_719815 - BLOCK
      ?auto_719816 - BLOCK
      ?auto_719817 - BLOCK
    )
    :vars
    (
      ?auto_719818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719817 ?auto_719818 ) ( ON-TABLE ?auto_719806 ) ( ON ?auto_719807 ?auto_719806 ) ( ON ?auto_719808 ?auto_719807 ) ( ON ?auto_719809 ?auto_719808 ) ( not ( = ?auto_719806 ?auto_719807 ) ) ( not ( = ?auto_719806 ?auto_719808 ) ) ( not ( = ?auto_719806 ?auto_719809 ) ) ( not ( = ?auto_719806 ?auto_719810 ) ) ( not ( = ?auto_719806 ?auto_719811 ) ) ( not ( = ?auto_719806 ?auto_719812 ) ) ( not ( = ?auto_719806 ?auto_719813 ) ) ( not ( = ?auto_719806 ?auto_719814 ) ) ( not ( = ?auto_719806 ?auto_719815 ) ) ( not ( = ?auto_719806 ?auto_719816 ) ) ( not ( = ?auto_719806 ?auto_719817 ) ) ( not ( = ?auto_719806 ?auto_719818 ) ) ( not ( = ?auto_719807 ?auto_719808 ) ) ( not ( = ?auto_719807 ?auto_719809 ) ) ( not ( = ?auto_719807 ?auto_719810 ) ) ( not ( = ?auto_719807 ?auto_719811 ) ) ( not ( = ?auto_719807 ?auto_719812 ) ) ( not ( = ?auto_719807 ?auto_719813 ) ) ( not ( = ?auto_719807 ?auto_719814 ) ) ( not ( = ?auto_719807 ?auto_719815 ) ) ( not ( = ?auto_719807 ?auto_719816 ) ) ( not ( = ?auto_719807 ?auto_719817 ) ) ( not ( = ?auto_719807 ?auto_719818 ) ) ( not ( = ?auto_719808 ?auto_719809 ) ) ( not ( = ?auto_719808 ?auto_719810 ) ) ( not ( = ?auto_719808 ?auto_719811 ) ) ( not ( = ?auto_719808 ?auto_719812 ) ) ( not ( = ?auto_719808 ?auto_719813 ) ) ( not ( = ?auto_719808 ?auto_719814 ) ) ( not ( = ?auto_719808 ?auto_719815 ) ) ( not ( = ?auto_719808 ?auto_719816 ) ) ( not ( = ?auto_719808 ?auto_719817 ) ) ( not ( = ?auto_719808 ?auto_719818 ) ) ( not ( = ?auto_719809 ?auto_719810 ) ) ( not ( = ?auto_719809 ?auto_719811 ) ) ( not ( = ?auto_719809 ?auto_719812 ) ) ( not ( = ?auto_719809 ?auto_719813 ) ) ( not ( = ?auto_719809 ?auto_719814 ) ) ( not ( = ?auto_719809 ?auto_719815 ) ) ( not ( = ?auto_719809 ?auto_719816 ) ) ( not ( = ?auto_719809 ?auto_719817 ) ) ( not ( = ?auto_719809 ?auto_719818 ) ) ( not ( = ?auto_719810 ?auto_719811 ) ) ( not ( = ?auto_719810 ?auto_719812 ) ) ( not ( = ?auto_719810 ?auto_719813 ) ) ( not ( = ?auto_719810 ?auto_719814 ) ) ( not ( = ?auto_719810 ?auto_719815 ) ) ( not ( = ?auto_719810 ?auto_719816 ) ) ( not ( = ?auto_719810 ?auto_719817 ) ) ( not ( = ?auto_719810 ?auto_719818 ) ) ( not ( = ?auto_719811 ?auto_719812 ) ) ( not ( = ?auto_719811 ?auto_719813 ) ) ( not ( = ?auto_719811 ?auto_719814 ) ) ( not ( = ?auto_719811 ?auto_719815 ) ) ( not ( = ?auto_719811 ?auto_719816 ) ) ( not ( = ?auto_719811 ?auto_719817 ) ) ( not ( = ?auto_719811 ?auto_719818 ) ) ( not ( = ?auto_719812 ?auto_719813 ) ) ( not ( = ?auto_719812 ?auto_719814 ) ) ( not ( = ?auto_719812 ?auto_719815 ) ) ( not ( = ?auto_719812 ?auto_719816 ) ) ( not ( = ?auto_719812 ?auto_719817 ) ) ( not ( = ?auto_719812 ?auto_719818 ) ) ( not ( = ?auto_719813 ?auto_719814 ) ) ( not ( = ?auto_719813 ?auto_719815 ) ) ( not ( = ?auto_719813 ?auto_719816 ) ) ( not ( = ?auto_719813 ?auto_719817 ) ) ( not ( = ?auto_719813 ?auto_719818 ) ) ( not ( = ?auto_719814 ?auto_719815 ) ) ( not ( = ?auto_719814 ?auto_719816 ) ) ( not ( = ?auto_719814 ?auto_719817 ) ) ( not ( = ?auto_719814 ?auto_719818 ) ) ( not ( = ?auto_719815 ?auto_719816 ) ) ( not ( = ?auto_719815 ?auto_719817 ) ) ( not ( = ?auto_719815 ?auto_719818 ) ) ( not ( = ?auto_719816 ?auto_719817 ) ) ( not ( = ?auto_719816 ?auto_719818 ) ) ( not ( = ?auto_719817 ?auto_719818 ) ) ( ON ?auto_719816 ?auto_719817 ) ( ON ?auto_719815 ?auto_719816 ) ( ON ?auto_719814 ?auto_719815 ) ( ON ?auto_719813 ?auto_719814 ) ( ON ?auto_719812 ?auto_719813 ) ( ON ?auto_719811 ?auto_719812 ) ( CLEAR ?auto_719809 ) ( ON ?auto_719810 ?auto_719811 ) ( CLEAR ?auto_719810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_719806 ?auto_719807 ?auto_719808 ?auto_719809 ?auto_719810 )
      ( MAKE-12PILE ?auto_719806 ?auto_719807 ?auto_719808 ?auto_719809 ?auto_719810 ?auto_719811 ?auto_719812 ?auto_719813 ?auto_719814 ?auto_719815 ?auto_719816 ?auto_719817 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719856 - BLOCK
      ?auto_719857 - BLOCK
      ?auto_719858 - BLOCK
      ?auto_719859 - BLOCK
      ?auto_719860 - BLOCK
      ?auto_719861 - BLOCK
      ?auto_719862 - BLOCK
      ?auto_719863 - BLOCK
      ?auto_719864 - BLOCK
      ?auto_719865 - BLOCK
      ?auto_719866 - BLOCK
      ?auto_719867 - BLOCK
    )
    :vars
    (
      ?auto_719868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719867 ?auto_719868 ) ( ON-TABLE ?auto_719856 ) ( ON ?auto_719857 ?auto_719856 ) ( ON ?auto_719858 ?auto_719857 ) ( not ( = ?auto_719856 ?auto_719857 ) ) ( not ( = ?auto_719856 ?auto_719858 ) ) ( not ( = ?auto_719856 ?auto_719859 ) ) ( not ( = ?auto_719856 ?auto_719860 ) ) ( not ( = ?auto_719856 ?auto_719861 ) ) ( not ( = ?auto_719856 ?auto_719862 ) ) ( not ( = ?auto_719856 ?auto_719863 ) ) ( not ( = ?auto_719856 ?auto_719864 ) ) ( not ( = ?auto_719856 ?auto_719865 ) ) ( not ( = ?auto_719856 ?auto_719866 ) ) ( not ( = ?auto_719856 ?auto_719867 ) ) ( not ( = ?auto_719856 ?auto_719868 ) ) ( not ( = ?auto_719857 ?auto_719858 ) ) ( not ( = ?auto_719857 ?auto_719859 ) ) ( not ( = ?auto_719857 ?auto_719860 ) ) ( not ( = ?auto_719857 ?auto_719861 ) ) ( not ( = ?auto_719857 ?auto_719862 ) ) ( not ( = ?auto_719857 ?auto_719863 ) ) ( not ( = ?auto_719857 ?auto_719864 ) ) ( not ( = ?auto_719857 ?auto_719865 ) ) ( not ( = ?auto_719857 ?auto_719866 ) ) ( not ( = ?auto_719857 ?auto_719867 ) ) ( not ( = ?auto_719857 ?auto_719868 ) ) ( not ( = ?auto_719858 ?auto_719859 ) ) ( not ( = ?auto_719858 ?auto_719860 ) ) ( not ( = ?auto_719858 ?auto_719861 ) ) ( not ( = ?auto_719858 ?auto_719862 ) ) ( not ( = ?auto_719858 ?auto_719863 ) ) ( not ( = ?auto_719858 ?auto_719864 ) ) ( not ( = ?auto_719858 ?auto_719865 ) ) ( not ( = ?auto_719858 ?auto_719866 ) ) ( not ( = ?auto_719858 ?auto_719867 ) ) ( not ( = ?auto_719858 ?auto_719868 ) ) ( not ( = ?auto_719859 ?auto_719860 ) ) ( not ( = ?auto_719859 ?auto_719861 ) ) ( not ( = ?auto_719859 ?auto_719862 ) ) ( not ( = ?auto_719859 ?auto_719863 ) ) ( not ( = ?auto_719859 ?auto_719864 ) ) ( not ( = ?auto_719859 ?auto_719865 ) ) ( not ( = ?auto_719859 ?auto_719866 ) ) ( not ( = ?auto_719859 ?auto_719867 ) ) ( not ( = ?auto_719859 ?auto_719868 ) ) ( not ( = ?auto_719860 ?auto_719861 ) ) ( not ( = ?auto_719860 ?auto_719862 ) ) ( not ( = ?auto_719860 ?auto_719863 ) ) ( not ( = ?auto_719860 ?auto_719864 ) ) ( not ( = ?auto_719860 ?auto_719865 ) ) ( not ( = ?auto_719860 ?auto_719866 ) ) ( not ( = ?auto_719860 ?auto_719867 ) ) ( not ( = ?auto_719860 ?auto_719868 ) ) ( not ( = ?auto_719861 ?auto_719862 ) ) ( not ( = ?auto_719861 ?auto_719863 ) ) ( not ( = ?auto_719861 ?auto_719864 ) ) ( not ( = ?auto_719861 ?auto_719865 ) ) ( not ( = ?auto_719861 ?auto_719866 ) ) ( not ( = ?auto_719861 ?auto_719867 ) ) ( not ( = ?auto_719861 ?auto_719868 ) ) ( not ( = ?auto_719862 ?auto_719863 ) ) ( not ( = ?auto_719862 ?auto_719864 ) ) ( not ( = ?auto_719862 ?auto_719865 ) ) ( not ( = ?auto_719862 ?auto_719866 ) ) ( not ( = ?auto_719862 ?auto_719867 ) ) ( not ( = ?auto_719862 ?auto_719868 ) ) ( not ( = ?auto_719863 ?auto_719864 ) ) ( not ( = ?auto_719863 ?auto_719865 ) ) ( not ( = ?auto_719863 ?auto_719866 ) ) ( not ( = ?auto_719863 ?auto_719867 ) ) ( not ( = ?auto_719863 ?auto_719868 ) ) ( not ( = ?auto_719864 ?auto_719865 ) ) ( not ( = ?auto_719864 ?auto_719866 ) ) ( not ( = ?auto_719864 ?auto_719867 ) ) ( not ( = ?auto_719864 ?auto_719868 ) ) ( not ( = ?auto_719865 ?auto_719866 ) ) ( not ( = ?auto_719865 ?auto_719867 ) ) ( not ( = ?auto_719865 ?auto_719868 ) ) ( not ( = ?auto_719866 ?auto_719867 ) ) ( not ( = ?auto_719866 ?auto_719868 ) ) ( not ( = ?auto_719867 ?auto_719868 ) ) ( ON ?auto_719866 ?auto_719867 ) ( ON ?auto_719865 ?auto_719866 ) ( ON ?auto_719864 ?auto_719865 ) ( ON ?auto_719863 ?auto_719864 ) ( ON ?auto_719862 ?auto_719863 ) ( ON ?auto_719861 ?auto_719862 ) ( ON ?auto_719860 ?auto_719861 ) ( CLEAR ?auto_719858 ) ( ON ?auto_719859 ?auto_719860 ) ( CLEAR ?auto_719859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_719856 ?auto_719857 ?auto_719858 ?auto_719859 )
      ( MAKE-12PILE ?auto_719856 ?auto_719857 ?auto_719858 ?auto_719859 ?auto_719860 ?auto_719861 ?auto_719862 ?auto_719863 ?auto_719864 ?auto_719865 ?auto_719866 ?auto_719867 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719906 - BLOCK
      ?auto_719907 - BLOCK
      ?auto_719908 - BLOCK
      ?auto_719909 - BLOCK
      ?auto_719910 - BLOCK
      ?auto_719911 - BLOCK
      ?auto_719912 - BLOCK
      ?auto_719913 - BLOCK
      ?auto_719914 - BLOCK
      ?auto_719915 - BLOCK
      ?auto_719916 - BLOCK
      ?auto_719917 - BLOCK
    )
    :vars
    (
      ?auto_719918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719917 ?auto_719918 ) ( ON-TABLE ?auto_719906 ) ( ON ?auto_719907 ?auto_719906 ) ( not ( = ?auto_719906 ?auto_719907 ) ) ( not ( = ?auto_719906 ?auto_719908 ) ) ( not ( = ?auto_719906 ?auto_719909 ) ) ( not ( = ?auto_719906 ?auto_719910 ) ) ( not ( = ?auto_719906 ?auto_719911 ) ) ( not ( = ?auto_719906 ?auto_719912 ) ) ( not ( = ?auto_719906 ?auto_719913 ) ) ( not ( = ?auto_719906 ?auto_719914 ) ) ( not ( = ?auto_719906 ?auto_719915 ) ) ( not ( = ?auto_719906 ?auto_719916 ) ) ( not ( = ?auto_719906 ?auto_719917 ) ) ( not ( = ?auto_719906 ?auto_719918 ) ) ( not ( = ?auto_719907 ?auto_719908 ) ) ( not ( = ?auto_719907 ?auto_719909 ) ) ( not ( = ?auto_719907 ?auto_719910 ) ) ( not ( = ?auto_719907 ?auto_719911 ) ) ( not ( = ?auto_719907 ?auto_719912 ) ) ( not ( = ?auto_719907 ?auto_719913 ) ) ( not ( = ?auto_719907 ?auto_719914 ) ) ( not ( = ?auto_719907 ?auto_719915 ) ) ( not ( = ?auto_719907 ?auto_719916 ) ) ( not ( = ?auto_719907 ?auto_719917 ) ) ( not ( = ?auto_719907 ?auto_719918 ) ) ( not ( = ?auto_719908 ?auto_719909 ) ) ( not ( = ?auto_719908 ?auto_719910 ) ) ( not ( = ?auto_719908 ?auto_719911 ) ) ( not ( = ?auto_719908 ?auto_719912 ) ) ( not ( = ?auto_719908 ?auto_719913 ) ) ( not ( = ?auto_719908 ?auto_719914 ) ) ( not ( = ?auto_719908 ?auto_719915 ) ) ( not ( = ?auto_719908 ?auto_719916 ) ) ( not ( = ?auto_719908 ?auto_719917 ) ) ( not ( = ?auto_719908 ?auto_719918 ) ) ( not ( = ?auto_719909 ?auto_719910 ) ) ( not ( = ?auto_719909 ?auto_719911 ) ) ( not ( = ?auto_719909 ?auto_719912 ) ) ( not ( = ?auto_719909 ?auto_719913 ) ) ( not ( = ?auto_719909 ?auto_719914 ) ) ( not ( = ?auto_719909 ?auto_719915 ) ) ( not ( = ?auto_719909 ?auto_719916 ) ) ( not ( = ?auto_719909 ?auto_719917 ) ) ( not ( = ?auto_719909 ?auto_719918 ) ) ( not ( = ?auto_719910 ?auto_719911 ) ) ( not ( = ?auto_719910 ?auto_719912 ) ) ( not ( = ?auto_719910 ?auto_719913 ) ) ( not ( = ?auto_719910 ?auto_719914 ) ) ( not ( = ?auto_719910 ?auto_719915 ) ) ( not ( = ?auto_719910 ?auto_719916 ) ) ( not ( = ?auto_719910 ?auto_719917 ) ) ( not ( = ?auto_719910 ?auto_719918 ) ) ( not ( = ?auto_719911 ?auto_719912 ) ) ( not ( = ?auto_719911 ?auto_719913 ) ) ( not ( = ?auto_719911 ?auto_719914 ) ) ( not ( = ?auto_719911 ?auto_719915 ) ) ( not ( = ?auto_719911 ?auto_719916 ) ) ( not ( = ?auto_719911 ?auto_719917 ) ) ( not ( = ?auto_719911 ?auto_719918 ) ) ( not ( = ?auto_719912 ?auto_719913 ) ) ( not ( = ?auto_719912 ?auto_719914 ) ) ( not ( = ?auto_719912 ?auto_719915 ) ) ( not ( = ?auto_719912 ?auto_719916 ) ) ( not ( = ?auto_719912 ?auto_719917 ) ) ( not ( = ?auto_719912 ?auto_719918 ) ) ( not ( = ?auto_719913 ?auto_719914 ) ) ( not ( = ?auto_719913 ?auto_719915 ) ) ( not ( = ?auto_719913 ?auto_719916 ) ) ( not ( = ?auto_719913 ?auto_719917 ) ) ( not ( = ?auto_719913 ?auto_719918 ) ) ( not ( = ?auto_719914 ?auto_719915 ) ) ( not ( = ?auto_719914 ?auto_719916 ) ) ( not ( = ?auto_719914 ?auto_719917 ) ) ( not ( = ?auto_719914 ?auto_719918 ) ) ( not ( = ?auto_719915 ?auto_719916 ) ) ( not ( = ?auto_719915 ?auto_719917 ) ) ( not ( = ?auto_719915 ?auto_719918 ) ) ( not ( = ?auto_719916 ?auto_719917 ) ) ( not ( = ?auto_719916 ?auto_719918 ) ) ( not ( = ?auto_719917 ?auto_719918 ) ) ( ON ?auto_719916 ?auto_719917 ) ( ON ?auto_719915 ?auto_719916 ) ( ON ?auto_719914 ?auto_719915 ) ( ON ?auto_719913 ?auto_719914 ) ( ON ?auto_719912 ?auto_719913 ) ( ON ?auto_719911 ?auto_719912 ) ( ON ?auto_719910 ?auto_719911 ) ( ON ?auto_719909 ?auto_719910 ) ( CLEAR ?auto_719907 ) ( ON ?auto_719908 ?auto_719909 ) ( CLEAR ?auto_719908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_719906 ?auto_719907 ?auto_719908 )
      ( MAKE-12PILE ?auto_719906 ?auto_719907 ?auto_719908 ?auto_719909 ?auto_719910 ?auto_719911 ?auto_719912 ?auto_719913 ?auto_719914 ?auto_719915 ?auto_719916 ?auto_719917 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_719956 - BLOCK
      ?auto_719957 - BLOCK
      ?auto_719958 - BLOCK
      ?auto_719959 - BLOCK
      ?auto_719960 - BLOCK
      ?auto_719961 - BLOCK
      ?auto_719962 - BLOCK
      ?auto_719963 - BLOCK
      ?auto_719964 - BLOCK
      ?auto_719965 - BLOCK
      ?auto_719966 - BLOCK
      ?auto_719967 - BLOCK
    )
    :vars
    (
      ?auto_719968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_719967 ?auto_719968 ) ( ON-TABLE ?auto_719956 ) ( not ( = ?auto_719956 ?auto_719957 ) ) ( not ( = ?auto_719956 ?auto_719958 ) ) ( not ( = ?auto_719956 ?auto_719959 ) ) ( not ( = ?auto_719956 ?auto_719960 ) ) ( not ( = ?auto_719956 ?auto_719961 ) ) ( not ( = ?auto_719956 ?auto_719962 ) ) ( not ( = ?auto_719956 ?auto_719963 ) ) ( not ( = ?auto_719956 ?auto_719964 ) ) ( not ( = ?auto_719956 ?auto_719965 ) ) ( not ( = ?auto_719956 ?auto_719966 ) ) ( not ( = ?auto_719956 ?auto_719967 ) ) ( not ( = ?auto_719956 ?auto_719968 ) ) ( not ( = ?auto_719957 ?auto_719958 ) ) ( not ( = ?auto_719957 ?auto_719959 ) ) ( not ( = ?auto_719957 ?auto_719960 ) ) ( not ( = ?auto_719957 ?auto_719961 ) ) ( not ( = ?auto_719957 ?auto_719962 ) ) ( not ( = ?auto_719957 ?auto_719963 ) ) ( not ( = ?auto_719957 ?auto_719964 ) ) ( not ( = ?auto_719957 ?auto_719965 ) ) ( not ( = ?auto_719957 ?auto_719966 ) ) ( not ( = ?auto_719957 ?auto_719967 ) ) ( not ( = ?auto_719957 ?auto_719968 ) ) ( not ( = ?auto_719958 ?auto_719959 ) ) ( not ( = ?auto_719958 ?auto_719960 ) ) ( not ( = ?auto_719958 ?auto_719961 ) ) ( not ( = ?auto_719958 ?auto_719962 ) ) ( not ( = ?auto_719958 ?auto_719963 ) ) ( not ( = ?auto_719958 ?auto_719964 ) ) ( not ( = ?auto_719958 ?auto_719965 ) ) ( not ( = ?auto_719958 ?auto_719966 ) ) ( not ( = ?auto_719958 ?auto_719967 ) ) ( not ( = ?auto_719958 ?auto_719968 ) ) ( not ( = ?auto_719959 ?auto_719960 ) ) ( not ( = ?auto_719959 ?auto_719961 ) ) ( not ( = ?auto_719959 ?auto_719962 ) ) ( not ( = ?auto_719959 ?auto_719963 ) ) ( not ( = ?auto_719959 ?auto_719964 ) ) ( not ( = ?auto_719959 ?auto_719965 ) ) ( not ( = ?auto_719959 ?auto_719966 ) ) ( not ( = ?auto_719959 ?auto_719967 ) ) ( not ( = ?auto_719959 ?auto_719968 ) ) ( not ( = ?auto_719960 ?auto_719961 ) ) ( not ( = ?auto_719960 ?auto_719962 ) ) ( not ( = ?auto_719960 ?auto_719963 ) ) ( not ( = ?auto_719960 ?auto_719964 ) ) ( not ( = ?auto_719960 ?auto_719965 ) ) ( not ( = ?auto_719960 ?auto_719966 ) ) ( not ( = ?auto_719960 ?auto_719967 ) ) ( not ( = ?auto_719960 ?auto_719968 ) ) ( not ( = ?auto_719961 ?auto_719962 ) ) ( not ( = ?auto_719961 ?auto_719963 ) ) ( not ( = ?auto_719961 ?auto_719964 ) ) ( not ( = ?auto_719961 ?auto_719965 ) ) ( not ( = ?auto_719961 ?auto_719966 ) ) ( not ( = ?auto_719961 ?auto_719967 ) ) ( not ( = ?auto_719961 ?auto_719968 ) ) ( not ( = ?auto_719962 ?auto_719963 ) ) ( not ( = ?auto_719962 ?auto_719964 ) ) ( not ( = ?auto_719962 ?auto_719965 ) ) ( not ( = ?auto_719962 ?auto_719966 ) ) ( not ( = ?auto_719962 ?auto_719967 ) ) ( not ( = ?auto_719962 ?auto_719968 ) ) ( not ( = ?auto_719963 ?auto_719964 ) ) ( not ( = ?auto_719963 ?auto_719965 ) ) ( not ( = ?auto_719963 ?auto_719966 ) ) ( not ( = ?auto_719963 ?auto_719967 ) ) ( not ( = ?auto_719963 ?auto_719968 ) ) ( not ( = ?auto_719964 ?auto_719965 ) ) ( not ( = ?auto_719964 ?auto_719966 ) ) ( not ( = ?auto_719964 ?auto_719967 ) ) ( not ( = ?auto_719964 ?auto_719968 ) ) ( not ( = ?auto_719965 ?auto_719966 ) ) ( not ( = ?auto_719965 ?auto_719967 ) ) ( not ( = ?auto_719965 ?auto_719968 ) ) ( not ( = ?auto_719966 ?auto_719967 ) ) ( not ( = ?auto_719966 ?auto_719968 ) ) ( not ( = ?auto_719967 ?auto_719968 ) ) ( ON ?auto_719966 ?auto_719967 ) ( ON ?auto_719965 ?auto_719966 ) ( ON ?auto_719964 ?auto_719965 ) ( ON ?auto_719963 ?auto_719964 ) ( ON ?auto_719962 ?auto_719963 ) ( ON ?auto_719961 ?auto_719962 ) ( ON ?auto_719960 ?auto_719961 ) ( ON ?auto_719959 ?auto_719960 ) ( ON ?auto_719958 ?auto_719959 ) ( CLEAR ?auto_719956 ) ( ON ?auto_719957 ?auto_719958 ) ( CLEAR ?auto_719957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_719956 ?auto_719957 )
      ( MAKE-12PILE ?auto_719956 ?auto_719957 ?auto_719958 ?auto_719959 ?auto_719960 ?auto_719961 ?auto_719962 ?auto_719963 ?auto_719964 ?auto_719965 ?auto_719966 ?auto_719967 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_720006 - BLOCK
      ?auto_720007 - BLOCK
      ?auto_720008 - BLOCK
      ?auto_720009 - BLOCK
      ?auto_720010 - BLOCK
      ?auto_720011 - BLOCK
      ?auto_720012 - BLOCK
      ?auto_720013 - BLOCK
      ?auto_720014 - BLOCK
      ?auto_720015 - BLOCK
      ?auto_720016 - BLOCK
      ?auto_720017 - BLOCK
    )
    :vars
    (
      ?auto_720018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720017 ?auto_720018 ) ( not ( = ?auto_720006 ?auto_720007 ) ) ( not ( = ?auto_720006 ?auto_720008 ) ) ( not ( = ?auto_720006 ?auto_720009 ) ) ( not ( = ?auto_720006 ?auto_720010 ) ) ( not ( = ?auto_720006 ?auto_720011 ) ) ( not ( = ?auto_720006 ?auto_720012 ) ) ( not ( = ?auto_720006 ?auto_720013 ) ) ( not ( = ?auto_720006 ?auto_720014 ) ) ( not ( = ?auto_720006 ?auto_720015 ) ) ( not ( = ?auto_720006 ?auto_720016 ) ) ( not ( = ?auto_720006 ?auto_720017 ) ) ( not ( = ?auto_720006 ?auto_720018 ) ) ( not ( = ?auto_720007 ?auto_720008 ) ) ( not ( = ?auto_720007 ?auto_720009 ) ) ( not ( = ?auto_720007 ?auto_720010 ) ) ( not ( = ?auto_720007 ?auto_720011 ) ) ( not ( = ?auto_720007 ?auto_720012 ) ) ( not ( = ?auto_720007 ?auto_720013 ) ) ( not ( = ?auto_720007 ?auto_720014 ) ) ( not ( = ?auto_720007 ?auto_720015 ) ) ( not ( = ?auto_720007 ?auto_720016 ) ) ( not ( = ?auto_720007 ?auto_720017 ) ) ( not ( = ?auto_720007 ?auto_720018 ) ) ( not ( = ?auto_720008 ?auto_720009 ) ) ( not ( = ?auto_720008 ?auto_720010 ) ) ( not ( = ?auto_720008 ?auto_720011 ) ) ( not ( = ?auto_720008 ?auto_720012 ) ) ( not ( = ?auto_720008 ?auto_720013 ) ) ( not ( = ?auto_720008 ?auto_720014 ) ) ( not ( = ?auto_720008 ?auto_720015 ) ) ( not ( = ?auto_720008 ?auto_720016 ) ) ( not ( = ?auto_720008 ?auto_720017 ) ) ( not ( = ?auto_720008 ?auto_720018 ) ) ( not ( = ?auto_720009 ?auto_720010 ) ) ( not ( = ?auto_720009 ?auto_720011 ) ) ( not ( = ?auto_720009 ?auto_720012 ) ) ( not ( = ?auto_720009 ?auto_720013 ) ) ( not ( = ?auto_720009 ?auto_720014 ) ) ( not ( = ?auto_720009 ?auto_720015 ) ) ( not ( = ?auto_720009 ?auto_720016 ) ) ( not ( = ?auto_720009 ?auto_720017 ) ) ( not ( = ?auto_720009 ?auto_720018 ) ) ( not ( = ?auto_720010 ?auto_720011 ) ) ( not ( = ?auto_720010 ?auto_720012 ) ) ( not ( = ?auto_720010 ?auto_720013 ) ) ( not ( = ?auto_720010 ?auto_720014 ) ) ( not ( = ?auto_720010 ?auto_720015 ) ) ( not ( = ?auto_720010 ?auto_720016 ) ) ( not ( = ?auto_720010 ?auto_720017 ) ) ( not ( = ?auto_720010 ?auto_720018 ) ) ( not ( = ?auto_720011 ?auto_720012 ) ) ( not ( = ?auto_720011 ?auto_720013 ) ) ( not ( = ?auto_720011 ?auto_720014 ) ) ( not ( = ?auto_720011 ?auto_720015 ) ) ( not ( = ?auto_720011 ?auto_720016 ) ) ( not ( = ?auto_720011 ?auto_720017 ) ) ( not ( = ?auto_720011 ?auto_720018 ) ) ( not ( = ?auto_720012 ?auto_720013 ) ) ( not ( = ?auto_720012 ?auto_720014 ) ) ( not ( = ?auto_720012 ?auto_720015 ) ) ( not ( = ?auto_720012 ?auto_720016 ) ) ( not ( = ?auto_720012 ?auto_720017 ) ) ( not ( = ?auto_720012 ?auto_720018 ) ) ( not ( = ?auto_720013 ?auto_720014 ) ) ( not ( = ?auto_720013 ?auto_720015 ) ) ( not ( = ?auto_720013 ?auto_720016 ) ) ( not ( = ?auto_720013 ?auto_720017 ) ) ( not ( = ?auto_720013 ?auto_720018 ) ) ( not ( = ?auto_720014 ?auto_720015 ) ) ( not ( = ?auto_720014 ?auto_720016 ) ) ( not ( = ?auto_720014 ?auto_720017 ) ) ( not ( = ?auto_720014 ?auto_720018 ) ) ( not ( = ?auto_720015 ?auto_720016 ) ) ( not ( = ?auto_720015 ?auto_720017 ) ) ( not ( = ?auto_720015 ?auto_720018 ) ) ( not ( = ?auto_720016 ?auto_720017 ) ) ( not ( = ?auto_720016 ?auto_720018 ) ) ( not ( = ?auto_720017 ?auto_720018 ) ) ( ON ?auto_720016 ?auto_720017 ) ( ON ?auto_720015 ?auto_720016 ) ( ON ?auto_720014 ?auto_720015 ) ( ON ?auto_720013 ?auto_720014 ) ( ON ?auto_720012 ?auto_720013 ) ( ON ?auto_720011 ?auto_720012 ) ( ON ?auto_720010 ?auto_720011 ) ( ON ?auto_720009 ?auto_720010 ) ( ON ?auto_720008 ?auto_720009 ) ( ON ?auto_720007 ?auto_720008 ) ( ON ?auto_720006 ?auto_720007 ) ( CLEAR ?auto_720006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_720006 )
      ( MAKE-12PILE ?auto_720006 ?auto_720007 ?auto_720008 ?auto_720009 ?auto_720010 ?auto_720011 ?auto_720012 ?auto_720013 ?auto_720014 ?auto_720015 ?auto_720016 ?auto_720017 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720057 - BLOCK
      ?auto_720058 - BLOCK
      ?auto_720059 - BLOCK
      ?auto_720060 - BLOCK
      ?auto_720061 - BLOCK
      ?auto_720062 - BLOCK
      ?auto_720063 - BLOCK
      ?auto_720064 - BLOCK
      ?auto_720065 - BLOCK
      ?auto_720066 - BLOCK
      ?auto_720067 - BLOCK
      ?auto_720068 - BLOCK
      ?auto_720069 - BLOCK
    )
    :vars
    (
      ?auto_720070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_720068 ) ( ON ?auto_720069 ?auto_720070 ) ( CLEAR ?auto_720069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_720057 ) ( ON ?auto_720058 ?auto_720057 ) ( ON ?auto_720059 ?auto_720058 ) ( ON ?auto_720060 ?auto_720059 ) ( ON ?auto_720061 ?auto_720060 ) ( ON ?auto_720062 ?auto_720061 ) ( ON ?auto_720063 ?auto_720062 ) ( ON ?auto_720064 ?auto_720063 ) ( ON ?auto_720065 ?auto_720064 ) ( ON ?auto_720066 ?auto_720065 ) ( ON ?auto_720067 ?auto_720066 ) ( ON ?auto_720068 ?auto_720067 ) ( not ( = ?auto_720057 ?auto_720058 ) ) ( not ( = ?auto_720057 ?auto_720059 ) ) ( not ( = ?auto_720057 ?auto_720060 ) ) ( not ( = ?auto_720057 ?auto_720061 ) ) ( not ( = ?auto_720057 ?auto_720062 ) ) ( not ( = ?auto_720057 ?auto_720063 ) ) ( not ( = ?auto_720057 ?auto_720064 ) ) ( not ( = ?auto_720057 ?auto_720065 ) ) ( not ( = ?auto_720057 ?auto_720066 ) ) ( not ( = ?auto_720057 ?auto_720067 ) ) ( not ( = ?auto_720057 ?auto_720068 ) ) ( not ( = ?auto_720057 ?auto_720069 ) ) ( not ( = ?auto_720057 ?auto_720070 ) ) ( not ( = ?auto_720058 ?auto_720059 ) ) ( not ( = ?auto_720058 ?auto_720060 ) ) ( not ( = ?auto_720058 ?auto_720061 ) ) ( not ( = ?auto_720058 ?auto_720062 ) ) ( not ( = ?auto_720058 ?auto_720063 ) ) ( not ( = ?auto_720058 ?auto_720064 ) ) ( not ( = ?auto_720058 ?auto_720065 ) ) ( not ( = ?auto_720058 ?auto_720066 ) ) ( not ( = ?auto_720058 ?auto_720067 ) ) ( not ( = ?auto_720058 ?auto_720068 ) ) ( not ( = ?auto_720058 ?auto_720069 ) ) ( not ( = ?auto_720058 ?auto_720070 ) ) ( not ( = ?auto_720059 ?auto_720060 ) ) ( not ( = ?auto_720059 ?auto_720061 ) ) ( not ( = ?auto_720059 ?auto_720062 ) ) ( not ( = ?auto_720059 ?auto_720063 ) ) ( not ( = ?auto_720059 ?auto_720064 ) ) ( not ( = ?auto_720059 ?auto_720065 ) ) ( not ( = ?auto_720059 ?auto_720066 ) ) ( not ( = ?auto_720059 ?auto_720067 ) ) ( not ( = ?auto_720059 ?auto_720068 ) ) ( not ( = ?auto_720059 ?auto_720069 ) ) ( not ( = ?auto_720059 ?auto_720070 ) ) ( not ( = ?auto_720060 ?auto_720061 ) ) ( not ( = ?auto_720060 ?auto_720062 ) ) ( not ( = ?auto_720060 ?auto_720063 ) ) ( not ( = ?auto_720060 ?auto_720064 ) ) ( not ( = ?auto_720060 ?auto_720065 ) ) ( not ( = ?auto_720060 ?auto_720066 ) ) ( not ( = ?auto_720060 ?auto_720067 ) ) ( not ( = ?auto_720060 ?auto_720068 ) ) ( not ( = ?auto_720060 ?auto_720069 ) ) ( not ( = ?auto_720060 ?auto_720070 ) ) ( not ( = ?auto_720061 ?auto_720062 ) ) ( not ( = ?auto_720061 ?auto_720063 ) ) ( not ( = ?auto_720061 ?auto_720064 ) ) ( not ( = ?auto_720061 ?auto_720065 ) ) ( not ( = ?auto_720061 ?auto_720066 ) ) ( not ( = ?auto_720061 ?auto_720067 ) ) ( not ( = ?auto_720061 ?auto_720068 ) ) ( not ( = ?auto_720061 ?auto_720069 ) ) ( not ( = ?auto_720061 ?auto_720070 ) ) ( not ( = ?auto_720062 ?auto_720063 ) ) ( not ( = ?auto_720062 ?auto_720064 ) ) ( not ( = ?auto_720062 ?auto_720065 ) ) ( not ( = ?auto_720062 ?auto_720066 ) ) ( not ( = ?auto_720062 ?auto_720067 ) ) ( not ( = ?auto_720062 ?auto_720068 ) ) ( not ( = ?auto_720062 ?auto_720069 ) ) ( not ( = ?auto_720062 ?auto_720070 ) ) ( not ( = ?auto_720063 ?auto_720064 ) ) ( not ( = ?auto_720063 ?auto_720065 ) ) ( not ( = ?auto_720063 ?auto_720066 ) ) ( not ( = ?auto_720063 ?auto_720067 ) ) ( not ( = ?auto_720063 ?auto_720068 ) ) ( not ( = ?auto_720063 ?auto_720069 ) ) ( not ( = ?auto_720063 ?auto_720070 ) ) ( not ( = ?auto_720064 ?auto_720065 ) ) ( not ( = ?auto_720064 ?auto_720066 ) ) ( not ( = ?auto_720064 ?auto_720067 ) ) ( not ( = ?auto_720064 ?auto_720068 ) ) ( not ( = ?auto_720064 ?auto_720069 ) ) ( not ( = ?auto_720064 ?auto_720070 ) ) ( not ( = ?auto_720065 ?auto_720066 ) ) ( not ( = ?auto_720065 ?auto_720067 ) ) ( not ( = ?auto_720065 ?auto_720068 ) ) ( not ( = ?auto_720065 ?auto_720069 ) ) ( not ( = ?auto_720065 ?auto_720070 ) ) ( not ( = ?auto_720066 ?auto_720067 ) ) ( not ( = ?auto_720066 ?auto_720068 ) ) ( not ( = ?auto_720066 ?auto_720069 ) ) ( not ( = ?auto_720066 ?auto_720070 ) ) ( not ( = ?auto_720067 ?auto_720068 ) ) ( not ( = ?auto_720067 ?auto_720069 ) ) ( not ( = ?auto_720067 ?auto_720070 ) ) ( not ( = ?auto_720068 ?auto_720069 ) ) ( not ( = ?auto_720068 ?auto_720070 ) ) ( not ( = ?auto_720069 ?auto_720070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_720069 ?auto_720070 )
      ( !STACK ?auto_720069 ?auto_720068 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720111 - BLOCK
      ?auto_720112 - BLOCK
      ?auto_720113 - BLOCK
      ?auto_720114 - BLOCK
      ?auto_720115 - BLOCK
      ?auto_720116 - BLOCK
      ?auto_720117 - BLOCK
      ?auto_720118 - BLOCK
      ?auto_720119 - BLOCK
      ?auto_720120 - BLOCK
      ?auto_720121 - BLOCK
      ?auto_720122 - BLOCK
      ?auto_720123 - BLOCK
    )
    :vars
    (
      ?auto_720124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720123 ?auto_720124 ) ( ON-TABLE ?auto_720111 ) ( ON ?auto_720112 ?auto_720111 ) ( ON ?auto_720113 ?auto_720112 ) ( ON ?auto_720114 ?auto_720113 ) ( ON ?auto_720115 ?auto_720114 ) ( ON ?auto_720116 ?auto_720115 ) ( ON ?auto_720117 ?auto_720116 ) ( ON ?auto_720118 ?auto_720117 ) ( ON ?auto_720119 ?auto_720118 ) ( ON ?auto_720120 ?auto_720119 ) ( ON ?auto_720121 ?auto_720120 ) ( not ( = ?auto_720111 ?auto_720112 ) ) ( not ( = ?auto_720111 ?auto_720113 ) ) ( not ( = ?auto_720111 ?auto_720114 ) ) ( not ( = ?auto_720111 ?auto_720115 ) ) ( not ( = ?auto_720111 ?auto_720116 ) ) ( not ( = ?auto_720111 ?auto_720117 ) ) ( not ( = ?auto_720111 ?auto_720118 ) ) ( not ( = ?auto_720111 ?auto_720119 ) ) ( not ( = ?auto_720111 ?auto_720120 ) ) ( not ( = ?auto_720111 ?auto_720121 ) ) ( not ( = ?auto_720111 ?auto_720122 ) ) ( not ( = ?auto_720111 ?auto_720123 ) ) ( not ( = ?auto_720111 ?auto_720124 ) ) ( not ( = ?auto_720112 ?auto_720113 ) ) ( not ( = ?auto_720112 ?auto_720114 ) ) ( not ( = ?auto_720112 ?auto_720115 ) ) ( not ( = ?auto_720112 ?auto_720116 ) ) ( not ( = ?auto_720112 ?auto_720117 ) ) ( not ( = ?auto_720112 ?auto_720118 ) ) ( not ( = ?auto_720112 ?auto_720119 ) ) ( not ( = ?auto_720112 ?auto_720120 ) ) ( not ( = ?auto_720112 ?auto_720121 ) ) ( not ( = ?auto_720112 ?auto_720122 ) ) ( not ( = ?auto_720112 ?auto_720123 ) ) ( not ( = ?auto_720112 ?auto_720124 ) ) ( not ( = ?auto_720113 ?auto_720114 ) ) ( not ( = ?auto_720113 ?auto_720115 ) ) ( not ( = ?auto_720113 ?auto_720116 ) ) ( not ( = ?auto_720113 ?auto_720117 ) ) ( not ( = ?auto_720113 ?auto_720118 ) ) ( not ( = ?auto_720113 ?auto_720119 ) ) ( not ( = ?auto_720113 ?auto_720120 ) ) ( not ( = ?auto_720113 ?auto_720121 ) ) ( not ( = ?auto_720113 ?auto_720122 ) ) ( not ( = ?auto_720113 ?auto_720123 ) ) ( not ( = ?auto_720113 ?auto_720124 ) ) ( not ( = ?auto_720114 ?auto_720115 ) ) ( not ( = ?auto_720114 ?auto_720116 ) ) ( not ( = ?auto_720114 ?auto_720117 ) ) ( not ( = ?auto_720114 ?auto_720118 ) ) ( not ( = ?auto_720114 ?auto_720119 ) ) ( not ( = ?auto_720114 ?auto_720120 ) ) ( not ( = ?auto_720114 ?auto_720121 ) ) ( not ( = ?auto_720114 ?auto_720122 ) ) ( not ( = ?auto_720114 ?auto_720123 ) ) ( not ( = ?auto_720114 ?auto_720124 ) ) ( not ( = ?auto_720115 ?auto_720116 ) ) ( not ( = ?auto_720115 ?auto_720117 ) ) ( not ( = ?auto_720115 ?auto_720118 ) ) ( not ( = ?auto_720115 ?auto_720119 ) ) ( not ( = ?auto_720115 ?auto_720120 ) ) ( not ( = ?auto_720115 ?auto_720121 ) ) ( not ( = ?auto_720115 ?auto_720122 ) ) ( not ( = ?auto_720115 ?auto_720123 ) ) ( not ( = ?auto_720115 ?auto_720124 ) ) ( not ( = ?auto_720116 ?auto_720117 ) ) ( not ( = ?auto_720116 ?auto_720118 ) ) ( not ( = ?auto_720116 ?auto_720119 ) ) ( not ( = ?auto_720116 ?auto_720120 ) ) ( not ( = ?auto_720116 ?auto_720121 ) ) ( not ( = ?auto_720116 ?auto_720122 ) ) ( not ( = ?auto_720116 ?auto_720123 ) ) ( not ( = ?auto_720116 ?auto_720124 ) ) ( not ( = ?auto_720117 ?auto_720118 ) ) ( not ( = ?auto_720117 ?auto_720119 ) ) ( not ( = ?auto_720117 ?auto_720120 ) ) ( not ( = ?auto_720117 ?auto_720121 ) ) ( not ( = ?auto_720117 ?auto_720122 ) ) ( not ( = ?auto_720117 ?auto_720123 ) ) ( not ( = ?auto_720117 ?auto_720124 ) ) ( not ( = ?auto_720118 ?auto_720119 ) ) ( not ( = ?auto_720118 ?auto_720120 ) ) ( not ( = ?auto_720118 ?auto_720121 ) ) ( not ( = ?auto_720118 ?auto_720122 ) ) ( not ( = ?auto_720118 ?auto_720123 ) ) ( not ( = ?auto_720118 ?auto_720124 ) ) ( not ( = ?auto_720119 ?auto_720120 ) ) ( not ( = ?auto_720119 ?auto_720121 ) ) ( not ( = ?auto_720119 ?auto_720122 ) ) ( not ( = ?auto_720119 ?auto_720123 ) ) ( not ( = ?auto_720119 ?auto_720124 ) ) ( not ( = ?auto_720120 ?auto_720121 ) ) ( not ( = ?auto_720120 ?auto_720122 ) ) ( not ( = ?auto_720120 ?auto_720123 ) ) ( not ( = ?auto_720120 ?auto_720124 ) ) ( not ( = ?auto_720121 ?auto_720122 ) ) ( not ( = ?auto_720121 ?auto_720123 ) ) ( not ( = ?auto_720121 ?auto_720124 ) ) ( not ( = ?auto_720122 ?auto_720123 ) ) ( not ( = ?auto_720122 ?auto_720124 ) ) ( not ( = ?auto_720123 ?auto_720124 ) ) ( CLEAR ?auto_720121 ) ( ON ?auto_720122 ?auto_720123 ) ( CLEAR ?auto_720122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_720111 ?auto_720112 ?auto_720113 ?auto_720114 ?auto_720115 ?auto_720116 ?auto_720117 ?auto_720118 ?auto_720119 ?auto_720120 ?auto_720121 ?auto_720122 )
      ( MAKE-13PILE ?auto_720111 ?auto_720112 ?auto_720113 ?auto_720114 ?auto_720115 ?auto_720116 ?auto_720117 ?auto_720118 ?auto_720119 ?auto_720120 ?auto_720121 ?auto_720122 ?auto_720123 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720165 - BLOCK
      ?auto_720166 - BLOCK
      ?auto_720167 - BLOCK
      ?auto_720168 - BLOCK
      ?auto_720169 - BLOCK
      ?auto_720170 - BLOCK
      ?auto_720171 - BLOCK
      ?auto_720172 - BLOCK
      ?auto_720173 - BLOCK
      ?auto_720174 - BLOCK
      ?auto_720175 - BLOCK
      ?auto_720176 - BLOCK
      ?auto_720177 - BLOCK
    )
    :vars
    (
      ?auto_720178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720177 ?auto_720178 ) ( ON-TABLE ?auto_720165 ) ( ON ?auto_720166 ?auto_720165 ) ( ON ?auto_720167 ?auto_720166 ) ( ON ?auto_720168 ?auto_720167 ) ( ON ?auto_720169 ?auto_720168 ) ( ON ?auto_720170 ?auto_720169 ) ( ON ?auto_720171 ?auto_720170 ) ( ON ?auto_720172 ?auto_720171 ) ( ON ?auto_720173 ?auto_720172 ) ( ON ?auto_720174 ?auto_720173 ) ( not ( = ?auto_720165 ?auto_720166 ) ) ( not ( = ?auto_720165 ?auto_720167 ) ) ( not ( = ?auto_720165 ?auto_720168 ) ) ( not ( = ?auto_720165 ?auto_720169 ) ) ( not ( = ?auto_720165 ?auto_720170 ) ) ( not ( = ?auto_720165 ?auto_720171 ) ) ( not ( = ?auto_720165 ?auto_720172 ) ) ( not ( = ?auto_720165 ?auto_720173 ) ) ( not ( = ?auto_720165 ?auto_720174 ) ) ( not ( = ?auto_720165 ?auto_720175 ) ) ( not ( = ?auto_720165 ?auto_720176 ) ) ( not ( = ?auto_720165 ?auto_720177 ) ) ( not ( = ?auto_720165 ?auto_720178 ) ) ( not ( = ?auto_720166 ?auto_720167 ) ) ( not ( = ?auto_720166 ?auto_720168 ) ) ( not ( = ?auto_720166 ?auto_720169 ) ) ( not ( = ?auto_720166 ?auto_720170 ) ) ( not ( = ?auto_720166 ?auto_720171 ) ) ( not ( = ?auto_720166 ?auto_720172 ) ) ( not ( = ?auto_720166 ?auto_720173 ) ) ( not ( = ?auto_720166 ?auto_720174 ) ) ( not ( = ?auto_720166 ?auto_720175 ) ) ( not ( = ?auto_720166 ?auto_720176 ) ) ( not ( = ?auto_720166 ?auto_720177 ) ) ( not ( = ?auto_720166 ?auto_720178 ) ) ( not ( = ?auto_720167 ?auto_720168 ) ) ( not ( = ?auto_720167 ?auto_720169 ) ) ( not ( = ?auto_720167 ?auto_720170 ) ) ( not ( = ?auto_720167 ?auto_720171 ) ) ( not ( = ?auto_720167 ?auto_720172 ) ) ( not ( = ?auto_720167 ?auto_720173 ) ) ( not ( = ?auto_720167 ?auto_720174 ) ) ( not ( = ?auto_720167 ?auto_720175 ) ) ( not ( = ?auto_720167 ?auto_720176 ) ) ( not ( = ?auto_720167 ?auto_720177 ) ) ( not ( = ?auto_720167 ?auto_720178 ) ) ( not ( = ?auto_720168 ?auto_720169 ) ) ( not ( = ?auto_720168 ?auto_720170 ) ) ( not ( = ?auto_720168 ?auto_720171 ) ) ( not ( = ?auto_720168 ?auto_720172 ) ) ( not ( = ?auto_720168 ?auto_720173 ) ) ( not ( = ?auto_720168 ?auto_720174 ) ) ( not ( = ?auto_720168 ?auto_720175 ) ) ( not ( = ?auto_720168 ?auto_720176 ) ) ( not ( = ?auto_720168 ?auto_720177 ) ) ( not ( = ?auto_720168 ?auto_720178 ) ) ( not ( = ?auto_720169 ?auto_720170 ) ) ( not ( = ?auto_720169 ?auto_720171 ) ) ( not ( = ?auto_720169 ?auto_720172 ) ) ( not ( = ?auto_720169 ?auto_720173 ) ) ( not ( = ?auto_720169 ?auto_720174 ) ) ( not ( = ?auto_720169 ?auto_720175 ) ) ( not ( = ?auto_720169 ?auto_720176 ) ) ( not ( = ?auto_720169 ?auto_720177 ) ) ( not ( = ?auto_720169 ?auto_720178 ) ) ( not ( = ?auto_720170 ?auto_720171 ) ) ( not ( = ?auto_720170 ?auto_720172 ) ) ( not ( = ?auto_720170 ?auto_720173 ) ) ( not ( = ?auto_720170 ?auto_720174 ) ) ( not ( = ?auto_720170 ?auto_720175 ) ) ( not ( = ?auto_720170 ?auto_720176 ) ) ( not ( = ?auto_720170 ?auto_720177 ) ) ( not ( = ?auto_720170 ?auto_720178 ) ) ( not ( = ?auto_720171 ?auto_720172 ) ) ( not ( = ?auto_720171 ?auto_720173 ) ) ( not ( = ?auto_720171 ?auto_720174 ) ) ( not ( = ?auto_720171 ?auto_720175 ) ) ( not ( = ?auto_720171 ?auto_720176 ) ) ( not ( = ?auto_720171 ?auto_720177 ) ) ( not ( = ?auto_720171 ?auto_720178 ) ) ( not ( = ?auto_720172 ?auto_720173 ) ) ( not ( = ?auto_720172 ?auto_720174 ) ) ( not ( = ?auto_720172 ?auto_720175 ) ) ( not ( = ?auto_720172 ?auto_720176 ) ) ( not ( = ?auto_720172 ?auto_720177 ) ) ( not ( = ?auto_720172 ?auto_720178 ) ) ( not ( = ?auto_720173 ?auto_720174 ) ) ( not ( = ?auto_720173 ?auto_720175 ) ) ( not ( = ?auto_720173 ?auto_720176 ) ) ( not ( = ?auto_720173 ?auto_720177 ) ) ( not ( = ?auto_720173 ?auto_720178 ) ) ( not ( = ?auto_720174 ?auto_720175 ) ) ( not ( = ?auto_720174 ?auto_720176 ) ) ( not ( = ?auto_720174 ?auto_720177 ) ) ( not ( = ?auto_720174 ?auto_720178 ) ) ( not ( = ?auto_720175 ?auto_720176 ) ) ( not ( = ?auto_720175 ?auto_720177 ) ) ( not ( = ?auto_720175 ?auto_720178 ) ) ( not ( = ?auto_720176 ?auto_720177 ) ) ( not ( = ?auto_720176 ?auto_720178 ) ) ( not ( = ?auto_720177 ?auto_720178 ) ) ( ON ?auto_720176 ?auto_720177 ) ( CLEAR ?auto_720174 ) ( ON ?auto_720175 ?auto_720176 ) ( CLEAR ?auto_720175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_720165 ?auto_720166 ?auto_720167 ?auto_720168 ?auto_720169 ?auto_720170 ?auto_720171 ?auto_720172 ?auto_720173 ?auto_720174 ?auto_720175 )
      ( MAKE-13PILE ?auto_720165 ?auto_720166 ?auto_720167 ?auto_720168 ?auto_720169 ?auto_720170 ?auto_720171 ?auto_720172 ?auto_720173 ?auto_720174 ?auto_720175 ?auto_720176 ?auto_720177 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720219 - BLOCK
      ?auto_720220 - BLOCK
      ?auto_720221 - BLOCK
      ?auto_720222 - BLOCK
      ?auto_720223 - BLOCK
      ?auto_720224 - BLOCK
      ?auto_720225 - BLOCK
      ?auto_720226 - BLOCK
      ?auto_720227 - BLOCK
      ?auto_720228 - BLOCK
      ?auto_720229 - BLOCK
      ?auto_720230 - BLOCK
      ?auto_720231 - BLOCK
    )
    :vars
    (
      ?auto_720232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720231 ?auto_720232 ) ( ON-TABLE ?auto_720219 ) ( ON ?auto_720220 ?auto_720219 ) ( ON ?auto_720221 ?auto_720220 ) ( ON ?auto_720222 ?auto_720221 ) ( ON ?auto_720223 ?auto_720222 ) ( ON ?auto_720224 ?auto_720223 ) ( ON ?auto_720225 ?auto_720224 ) ( ON ?auto_720226 ?auto_720225 ) ( ON ?auto_720227 ?auto_720226 ) ( not ( = ?auto_720219 ?auto_720220 ) ) ( not ( = ?auto_720219 ?auto_720221 ) ) ( not ( = ?auto_720219 ?auto_720222 ) ) ( not ( = ?auto_720219 ?auto_720223 ) ) ( not ( = ?auto_720219 ?auto_720224 ) ) ( not ( = ?auto_720219 ?auto_720225 ) ) ( not ( = ?auto_720219 ?auto_720226 ) ) ( not ( = ?auto_720219 ?auto_720227 ) ) ( not ( = ?auto_720219 ?auto_720228 ) ) ( not ( = ?auto_720219 ?auto_720229 ) ) ( not ( = ?auto_720219 ?auto_720230 ) ) ( not ( = ?auto_720219 ?auto_720231 ) ) ( not ( = ?auto_720219 ?auto_720232 ) ) ( not ( = ?auto_720220 ?auto_720221 ) ) ( not ( = ?auto_720220 ?auto_720222 ) ) ( not ( = ?auto_720220 ?auto_720223 ) ) ( not ( = ?auto_720220 ?auto_720224 ) ) ( not ( = ?auto_720220 ?auto_720225 ) ) ( not ( = ?auto_720220 ?auto_720226 ) ) ( not ( = ?auto_720220 ?auto_720227 ) ) ( not ( = ?auto_720220 ?auto_720228 ) ) ( not ( = ?auto_720220 ?auto_720229 ) ) ( not ( = ?auto_720220 ?auto_720230 ) ) ( not ( = ?auto_720220 ?auto_720231 ) ) ( not ( = ?auto_720220 ?auto_720232 ) ) ( not ( = ?auto_720221 ?auto_720222 ) ) ( not ( = ?auto_720221 ?auto_720223 ) ) ( not ( = ?auto_720221 ?auto_720224 ) ) ( not ( = ?auto_720221 ?auto_720225 ) ) ( not ( = ?auto_720221 ?auto_720226 ) ) ( not ( = ?auto_720221 ?auto_720227 ) ) ( not ( = ?auto_720221 ?auto_720228 ) ) ( not ( = ?auto_720221 ?auto_720229 ) ) ( not ( = ?auto_720221 ?auto_720230 ) ) ( not ( = ?auto_720221 ?auto_720231 ) ) ( not ( = ?auto_720221 ?auto_720232 ) ) ( not ( = ?auto_720222 ?auto_720223 ) ) ( not ( = ?auto_720222 ?auto_720224 ) ) ( not ( = ?auto_720222 ?auto_720225 ) ) ( not ( = ?auto_720222 ?auto_720226 ) ) ( not ( = ?auto_720222 ?auto_720227 ) ) ( not ( = ?auto_720222 ?auto_720228 ) ) ( not ( = ?auto_720222 ?auto_720229 ) ) ( not ( = ?auto_720222 ?auto_720230 ) ) ( not ( = ?auto_720222 ?auto_720231 ) ) ( not ( = ?auto_720222 ?auto_720232 ) ) ( not ( = ?auto_720223 ?auto_720224 ) ) ( not ( = ?auto_720223 ?auto_720225 ) ) ( not ( = ?auto_720223 ?auto_720226 ) ) ( not ( = ?auto_720223 ?auto_720227 ) ) ( not ( = ?auto_720223 ?auto_720228 ) ) ( not ( = ?auto_720223 ?auto_720229 ) ) ( not ( = ?auto_720223 ?auto_720230 ) ) ( not ( = ?auto_720223 ?auto_720231 ) ) ( not ( = ?auto_720223 ?auto_720232 ) ) ( not ( = ?auto_720224 ?auto_720225 ) ) ( not ( = ?auto_720224 ?auto_720226 ) ) ( not ( = ?auto_720224 ?auto_720227 ) ) ( not ( = ?auto_720224 ?auto_720228 ) ) ( not ( = ?auto_720224 ?auto_720229 ) ) ( not ( = ?auto_720224 ?auto_720230 ) ) ( not ( = ?auto_720224 ?auto_720231 ) ) ( not ( = ?auto_720224 ?auto_720232 ) ) ( not ( = ?auto_720225 ?auto_720226 ) ) ( not ( = ?auto_720225 ?auto_720227 ) ) ( not ( = ?auto_720225 ?auto_720228 ) ) ( not ( = ?auto_720225 ?auto_720229 ) ) ( not ( = ?auto_720225 ?auto_720230 ) ) ( not ( = ?auto_720225 ?auto_720231 ) ) ( not ( = ?auto_720225 ?auto_720232 ) ) ( not ( = ?auto_720226 ?auto_720227 ) ) ( not ( = ?auto_720226 ?auto_720228 ) ) ( not ( = ?auto_720226 ?auto_720229 ) ) ( not ( = ?auto_720226 ?auto_720230 ) ) ( not ( = ?auto_720226 ?auto_720231 ) ) ( not ( = ?auto_720226 ?auto_720232 ) ) ( not ( = ?auto_720227 ?auto_720228 ) ) ( not ( = ?auto_720227 ?auto_720229 ) ) ( not ( = ?auto_720227 ?auto_720230 ) ) ( not ( = ?auto_720227 ?auto_720231 ) ) ( not ( = ?auto_720227 ?auto_720232 ) ) ( not ( = ?auto_720228 ?auto_720229 ) ) ( not ( = ?auto_720228 ?auto_720230 ) ) ( not ( = ?auto_720228 ?auto_720231 ) ) ( not ( = ?auto_720228 ?auto_720232 ) ) ( not ( = ?auto_720229 ?auto_720230 ) ) ( not ( = ?auto_720229 ?auto_720231 ) ) ( not ( = ?auto_720229 ?auto_720232 ) ) ( not ( = ?auto_720230 ?auto_720231 ) ) ( not ( = ?auto_720230 ?auto_720232 ) ) ( not ( = ?auto_720231 ?auto_720232 ) ) ( ON ?auto_720230 ?auto_720231 ) ( ON ?auto_720229 ?auto_720230 ) ( CLEAR ?auto_720227 ) ( ON ?auto_720228 ?auto_720229 ) ( CLEAR ?auto_720228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_720219 ?auto_720220 ?auto_720221 ?auto_720222 ?auto_720223 ?auto_720224 ?auto_720225 ?auto_720226 ?auto_720227 ?auto_720228 )
      ( MAKE-13PILE ?auto_720219 ?auto_720220 ?auto_720221 ?auto_720222 ?auto_720223 ?auto_720224 ?auto_720225 ?auto_720226 ?auto_720227 ?auto_720228 ?auto_720229 ?auto_720230 ?auto_720231 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720273 - BLOCK
      ?auto_720274 - BLOCK
      ?auto_720275 - BLOCK
      ?auto_720276 - BLOCK
      ?auto_720277 - BLOCK
      ?auto_720278 - BLOCK
      ?auto_720279 - BLOCK
      ?auto_720280 - BLOCK
      ?auto_720281 - BLOCK
      ?auto_720282 - BLOCK
      ?auto_720283 - BLOCK
      ?auto_720284 - BLOCK
      ?auto_720285 - BLOCK
    )
    :vars
    (
      ?auto_720286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720285 ?auto_720286 ) ( ON-TABLE ?auto_720273 ) ( ON ?auto_720274 ?auto_720273 ) ( ON ?auto_720275 ?auto_720274 ) ( ON ?auto_720276 ?auto_720275 ) ( ON ?auto_720277 ?auto_720276 ) ( ON ?auto_720278 ?auto_720277 ) ( ON ?auto_720279 ?auto_720278 ) ( ON ?auto_720280 ?auto_720279 ) ( not ( = ?auto_720273 ?auto_720274 ) ) ( not ( = ?auto_720273 ?auto_720275 ) ) ( not ( = ?auto_720273 ?auto_720276 ) ) ( not ( = ?auto_720273 ?auto_720277 ) ) ( not ( = ?auto_720273 ?auto_720278 ) ) ( not ( = ?auto_720273 ?auto_720279 ) ) ( not ( = ?auto_720273 ?auto_720280 ) ) ( not ( = ?auto_720273 ?auto_720281 ) ) ( not ( = ?auto_720273 ?auto_720282 ) ) ( not ( = ?auto_720273 ?auto_720283 ) ) ( not ( = ?auto_720273 ?auto_720284 ) ) ( not ( = ?auto_720273 ?auto_720285 ) ) ( not ( = ?auto_720273 ?auto_720286 ) ) ( not ( = ?auto_720274 ?auto_720275 ) ) ( not ( = ?auto_720274 ?auto_720276 ) ) ( not ( = ?auto_720274 ?auto_720277 ) ) ( not ( = ?auto_720274 ?auto_720278 ) ) ( not ( = ?auto_720274 ?auto_720279 ) ) ( not ( = ?auto_720274 ?auto_720280 ) ) ( not ( = ?auto_720274 ?auto_720281 ) ) ( not ( = ?auto_720274 ?auto_720282 ) ) ( not ( = ?auto_720274 ?auto_720283 ) ) ( not ( = ?auto_720274 ?auto_720284 ) ) ( not ( = ?auto_720274 ?auto_720285 ) ) ( not ( = ?auto_720274 ?auto_720286 ) ) ( not ( = ?auto_720275 ?auto_720276 ) ) ( not ( = ?auto_720275 ?auto_720277 ) ) ( not ( = ?auto_720275 ?auto_720278 ) ) ( not ( = ?auto_720275 ?auto_720279 ) ) ( not ( = ?auto_720275 ?auto_720280 ) ) ( not ( = ?auto_720275 ?auto_720281 ) ) ( not ( = ?auto_720275 ?auto_720282 ) ) ( not ( = ?auto_720275 ?auto_720283 ) ) ( not ( = ?auto_720275 ?auto_720284 ) ) ( not ( = ?auto_720275 ?auto_720285 ) ) ( not ( = ?auto_720275 ?auto_720286 ) ) ( not ( = ?auto_720276 ?auto_720277 ) ) ( not ( = ?auto_720276 ?auto_720278 ) ) ( not ( = ?auto_720276 ?auto_720279 ) ) ( not ( = ?auto_720276 ?auto_720280 ) ) ( not ( = ?auto_720276 ?auto_720281 ) ) ( not ( = ?auto_720276 ?auto_720282 ) ) ( not ( = ?auto_720276 ?auto_720283 ) ) ( not ( = ?auto_720276 ?auto_720284 ) ) ( not ( = ?auto_720276 ?auto_720285 ) ) ( not ( = ?auto_720276 ?auto_720286 ) ) ( not ( = ?auto_720277 ?auto_720278 ) ) ( not ( = ?auto_720277 ?auto_720279 ) ) ( not ( = ?auto_720277 ?auto_720280 ) ) ( not ( = ?auto_720277 ?auto_720281 ) ) ( not ( = ?auto_720277 ?auto_720282 ) ) ( not ( = ?auto_720277 ?auto_720283 ) ) ( not ( = ?auto_720277 ?auto_720284 ) ) ( not ( = ?auto_720277 ?auto_720285 ) ) ( not ( = ?auto_720277 ?auto_720286 ) ) ( not ( = ?auto_720278 ?auto_720279 ) ) ( not ( = ?auto_720278 ?auto_720280 ) ) ( not ( = ?auto_720278 ?auto_720281 ) ) ( not ( = ?auto_720278 ?auto_720282 ) ) ( not ( = ?auto_720278 ?auto_720283 ) ) ( not ( = ?auto_720278 ?auto_720284 ) ) ( not ( = ?auto_720278 ?auto_720285 ) ) ( not ( = ?auto_720278 ?auto_720286 ) ) ( not ( = ?auto_720279 ?auto_720280 ) ) ( not ( = ?auto_720279 ?auto_720281 ) ) ( not ( = ?auto_720279 ?auto_720282 ) ) ( not ( = ?auto_720279 ?auto_720283 ) ) ( not ( = ?auto_720279 ?auto_720284 ) ) ( not ( = ?auto_720279 ?auto_720285 ) ) ( not ( = ?auto_720279 ?auto_720286 ) ) ( not ( = ?auto_720280 ?auto_720281 ) ) ( not ( = ?auto_720280 ?auto_720282 ) ) ( not ( = ?auto_720280 ?auto_720283 ) ) ( not ( = ?auto_720280 ?auto_720284 ) ) ( not ( = ?auto_720280 ?auto_720285 ) ) ( not ( = ?auto_720280 ?auto_720286 ) ) ( not ( = ?auto_720281 ?auto_720282 ) ) ( not ( = ?auto_720281 ?auto_720283 ) ) ( not ( = ?auto_720281 ?auto_720284 ) ) ( not ( = ?auto_720281 ?auto_720285 ) ) ( not ( = ?auto_720281 ?auto_720286 ) ) ( not ( = ?auto_720282 ?auto_720283 ) ) ( not ( = ?auto_720282 ?auto_720284 ) ) ( not ( = ?auto_720282 ?auto_720285 ) ) ( not ( = ?auto_720282 ?auto_720286 ) ) ( not ( = ?auto_720283 ?auto_720284 ) ) ( not ( = ?auto_720283 ?auto_720285 ) ) ( not ( = ?auto_720283 ?auto_720286 ) ) ( not ( = ?auto_720284 ?auto_720285 ) ) ( not ( = ?auto_720284 ?auto_720286 ) ) ( not ( = ?auto_720285 ?auto_720286 ) ) ( ON ?auto_720284 ?auto_720285 ) ( ON ?auto_720283 ?auto_720284 ) ( ON ?auto_720282 ?auto_720283 ) ( CLEAR ?auto_720280 ) ( ON ?auto_720281 ?auto_720282 ) ( CLEAR ?auto_720281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_720273 ?auto_720274 ?auto_720275 ?auto_720276 ?auto_720277 ?auto_720278 ?auto_720279 ?auto_720280 ?auto_720281 )
      ( MAKE-13PILE ?auto_720273 ?auto_720274 ?auto_720275 ?auto_720276 ?auto_720277 ?auto_720278 ?auto_720279 ?auto_720280 ?auto_720281 ?auto_720282 ?auto_720283 ?auto_720284 ?auto_720285 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720327 - BLOCK
      ?auto_720328 - BLOCK
      ?auto_720329 - BLOCK
      ?auto_720330 - BLOCK
      ?auto_720331 - BLOCK
      ?auto_720332 - BLOCK
      ?auto_720333 - BLOCK
      ?auto_720334 - BLOCK
      ?auto_720335 - BLOCK
      ?auto_720336 - BLOCK
      ?auto_720337 - BLOCK
      ?auto_720338 - BLOCK
      ?auto_720339 - BLOCK
    )
    :vars
    (
      ?auto_720340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720339 ?auto_720340 ) ( ON-TABLE ?auto_720327 ) ( ON ?auto_720328 ?auto_720327 ) ( ON ?auto_720329 ?auto_720328 ) ( ON ?auto_720330 ?auto_720329 ) ( ON ?auto_720331 ?auto_720330 ) ( ON ?auto_720332 ?auto_720331 ) ( ON ?auto_720333 ?auto_720332 ) ( not ( = ?auto_720327 ?auto_720328 ) ) ( not ( = ?auto_720327 ?auto_720329 ) ) ( not ( = ?auto_720327 ?auto_720330 ) ) ( not ( = ?auto_720327 ?auto_720331 ) ) ( not ( = ?auto_720327 ?auto_720332 ) ) ( not ( = ?auto_720327 ?auto_720333 ) ) ( not ( = ?auto_720327 ?auto_720334 ) ) ( not ( = ?auto_720327 ?auto_720335 ) ) ( not ( = ?auto_720327 ?auto_720336 ) ) ( not ( = ?auto_720327 ?auto_720337 ) ) ( not ( = ?auto_720327 ?auto_720338 ) ) ( not ( = ?auto_720327 ?auto_720339 ) ) ( not ( = ?auto_720327 ?auto_720340 ) ) ( not ( = ?auto_720328 ?auto_720329 ) ) ( not ( = ?auto_720328 ?auto_720330 ) ) ( not ( = ?auto_720328 ?auto_720331 ) ) ( not ( = ?auto_720328 ?auto_720332 ) ) ( not ( = ?auto_720328 ?auto_720333 ) ) ( not ( = ?auto_720328 ?auto_720334 ) ) ( not ( = ?auto_720328 ?auto_720335 ) ) ( not ( = ?auto_720328 ?auto_720336 ) ) ( not ( = ?auto_720328 ?auto_720337 ) ) ( not ( = ?auto_720328 ?auto_720338 ) ) ( not ( = ?auto_720328 ?auto_720339 ) ) ( not ( = ?auto_720328 ?auto_720340 ) ) ( not ( = ?auto_720329 ?auto_720330 ) ) ( not ( = ?auto_720329 ?auto_720331 ) ) ( not ( = ?auto_720329 ?auto_720332 ) ) ( not ( = ?auto_720329 ?auto_720333 ) ) ( not ( = ?auto_720329 ?auto_720334 ) ) ( not ( = ?auto_720329 ?auto_720335 ) ) ( not ( = ?auto_720329 ?auto_720336 ) ) ( not ( = ?auto_720329 ?auto_720337 ) ) ( not ( = ?auto_720329 ?auto_720338 ) ) ( not ( = ?auto_720329 ?auto_720339 ) ) ( not ( = ?auto_720329 ?auto_720340 ) ) ( not ( = ?auto_720330 ?auto_720331 ) ) ( not ( = ?auto_720330 ?auto_720332 ) ) ( not ( = ?auto_720330 ?auto_720333 ) ) ( not ( = ?auto_720330 ?auto_720334 ) ) ( not ( = ?auto_720330 ?auto_720335 ) ) ( not ( = ?auto_720330 ?auto_720336 ) ) ( not ( = ?auto_720330 ?auto_720337 ) ) ( not ( = ?auto_720330 ?auto_720338 ) ) ( not ( = ?auto_720330 ?auto_720339 ) ) ( not ( = ?auto_720330 ?auto_720340 ) ) ( not ( = ?auto_720331 ?auto_720332 ) ) ( not ( = ?auto_720331 ?auto_720333 ) ) ( not ( = ?auto_720331 ?auto_720334 ) ) ( not ( = ?auto_720331 ?auto_720335 ) ) ( not ( = ?auto_720331 ?auto_720336 ) ) ( not ( = ?auto_720331 ?auto_720337 ) ) ( not ( = ?auto_720331 ?auto_720338 ) ) ( not ( = ?auto_720331 ?auto_720339 ) ) ( not ( = ?auto_720331 ?auto_720340 ) ) ( not ( = ?auto_720332 ?auto_720333 ) ) ( not ( = ?auto_720332 ?auto_720334 ) ) ( not ( = ?auto_720332 ?auto_720335 ) ) ( not ( = ?auto_720332 ?auto_720336 ) ) ( not ( = ?auto_720332 ?auto_720337 ) ) ( not ( = ?auto_720332 ?auto_720338 ) ) ( not ( = ?auto_720332 ?auto_720339 ) ) ( not ( = ?auto_720332 ?auto_720340 ) ) ( not ( = ?auto_720333 ?auto_720334 ) ) ( not ( = ?auto_720333 ?auto_720335 ) ) ( not ( = ?auto_720333 ?auto_720336 ) ) ( not ( = ?auto_720333 ?auto_720337 ) ) ( not ( = ?auto_720333 ?auto_720338 ) ) ( not ( = ?auto_720333 ?auto_720339 ) ) ( not ( = ?auto_720333 ?auto_720340 ) ) ( not ( = ?auto_720334 ?auto_720335 ) ) ( not ( = ?auto_720334 ?auto_720336 ) ) ( not ( = ?auto_720334 ?auto_720337 ) ) ( not ( = ?auto_720334 ?auto_720338 ) ) ( not ( = ?auto_720334 ?auto_720339 ) ) ( not ( = ?auto_720334 ?auto_720340 ) ) ( not ( = ?auto_720335 ?auto_720336 ) ) ( not ( = ?auto_720335 ?auto_720337 ) ) ( not ( = ?auto_720335 ?auto_720338 ) ) ( not ( = ?auto_720335 ?auto_720339 ) ) ( not ( = ?auto_720335 ?auto_720340 ) ) ( not ( = ?auto_720336 ?auto_720337 ) ) ( not ( = ?auto_720336 ?auto_720338 ) ) ( not ( = ?auto_720336 ?auto_720339 ) ) ( not ( = ?auto_720336 ?auto_720340 ) ) ( not ( = ?auto_720337 ?auto_720338 ) ) ( not ( = ?auto_720337 ?auto_720339 ) ) ( not ( = ?auto_720337 ?auto_720340 ) ) ( not ( = ?auto_720338 ?auto_720339 ) ) ( not ( = ?auto_720338 ?auto_720340 ) ) ( not ( = ?auto_720339 ?auto_720340 ) ) ( ON ?auto_720338 ?auto_720339 ) ( ON ?auto_720337 ?auto_720338 ) ( ON ?auto_720336 ?auto_720337 ) ( ON ?auto_720335 ?auto_720336 ) ( CLEAR ?auto_720333 ) ( ON ?auto_720334 ?auto_720335 ) ( CLEAR ?auto_720334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_720327 ?auto_720328 ?auto_720329 ?auto_720330 ?auto_720331 ?auto_720332 ?auto_720333 ?auto_720334 )
      ( MAKE-13PILE ?auto_720327 ?auto_720328 ?auto_720329 ?auto_720330 ?auto_720331 ?auto_720332 ?auto_720333 ?auto_720334 ?auto_720335 ?auto_720336 ?auto_720337 ?auto_720338 ?auto_720339 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720381 - BLOCK
      ?auto_720382 - BLOCK
      ?auto_720383 - BLOCK
      ?auto_720384 - BLOCK
      ?auto_720385 - BLOCK
      ?auto_720386 - BLOCK
      ?auto_720387 - BLOCK
      ?auto_720388 - BLOCK
      ?auto_720389 - BLOCK
      ?auto_720390 - BLOCK
      ?auto_720391 - BLOCK
      ?auto_720392 - BLOCK
      ?auto_720393 - BLOCK
    )
    :vars
    (
      ?auto_720394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720393 ?auto_720394 ) ( ON-TABLE ?auto_720381 ) ( ON ?auto_720382 ?auto_720381 ) ( ON ?auto_720383 ?auto_720382 ) ( ON ?auto_720384 ?auto_720383 ) ( ON ?auto_720385 ?auto_720384 ) ( ON ?auto_720386 ?auto_720385 ) ( not ( = ?auto_720381 ?auto_720382 ) ) ( not ( = ?auto_720381 ?auto_720383 ) ) ( not ( = ?auto_720381 ?auto_720384 ) ) ( not ( = ?auto_720381 ?auto_720385 ) ) ( not ( = ?auto_720381 ?auto_720386 ) ) ( not ( = ?auto_720381 ?auto_720387 ) ) ( not ( = ?auto_720381 ?auto_720388 ) ) ( not ( = ?auto_720381 ?auto_720389 ) ) ( not ( = ?auto_720381 ?auto_720390 ) ) ( not ( = ?auto_720381 ?auto_720391 ) ) ( not ( = ?auto_720381 ?auto_720392 ) ) ( not ( = ?auto_720381 ?auto_720393 ) ) ( not ( = ?auto_720381 ?auto_720394 ) ) ( not ( = ?auto_720382 ?auto_720383 ) ) ( not ( = ?auto_720382 ?auto_720384 ) ) ( not ( = ?auto_720382 ?auto_720385 ) ) ( not ( = ?auto_720382 ?auto_720386 ) ) ( not ( = ?auto_720382 ?auto_720387 ) ) ( not ( = ?auto_720382 ?auto_720388 ) ) ( not ( = ?auto_720382 ?auto_720389 ) ) ( not ( = ?auto_720382 ?auto_720390 ) ) ( not ( = ?auto_720382 ?auto_720391 ) ) ( not ( = ?auto_720382 ?auto_720392 ) ) ( not ( = ?auto_720382 ?auto_720393 ) ) ( not ( = ?auto_720382 ?auto_720394 ) ) ( not ( = ?auto_720383 ?auto_720384 ) ) ( not ( = ?auto_720383 ?auto_720385 ) ) ( not ( = ?auto_720383 ?auto_720386 ) ) ( not ( = ?auto_720383 ?auto_720387 ) ) ( not ( = ?auto_720383 ?auto_720388 ) ) ( not ( = ?auto_720383 ?auto_720389 ) ) ( not ( = ?auto_720383 ?auto_720390 ) ) ( not ( = ?auto_720383 ?auto_720391 ) ) ( not ( = ?auto_720383 ?auto_720392 ) ) ( not ( = ?auto_720383 ?auto_720393 ) ) ( not ( = ?auto_720383 ?auto_720394 ) ) ( not ( = ?auto_720384 ?auto_720385 ) ) ( not ( = ?auto_720384 ?auto_720386 ) ) ( not ( = ?auto_720384 ?auto_720387 ) ) ( not ( = ?auto_720384 ?auto_720388 ) ) ( not ( = ?auto_720384 ?auto_720389 ) ) ( not ( = ?auto_720384 ?auto_720390 ) ) ( not ( = ?auto_720384 ?auto_720391 ) ) ( not ( = ?auto_720384 ?auto_720392 ) ) ( not ( = ?auto_720384 ?auto_720393 ) ) ( not ( = ?auto_720384 ?auto_720394 ) ) ( not ( = ?auto_720385 ?auto_720386 ) ) ( not ( = ?auto_720385 ?auto_720387 ) ) ( not ( = ?auto_720385 ?auto_720388 ) ) ( not ( = ?auto_720385 ?auto_720389 ) ) ( not ( = ?auto_720385 ?auto_720390 ) ) ( not ( = ?auto_720385 ?auto_720391 ) ) ( not ( = ?auto_720385 ?auto_720392 ) ) ( not ( = ?auto_720385 ?auto_720393 ) ) ( not ( = ?auto_720385 ?auto_720394 ) ) ( not ( = ?auto_720386 ?auto_720387 ) ) ( not ( = ?auto_720386 ?auto_720388 ) ) ( not ( = ?auto_720386 ?auto_720389 ) ) ( not ( = ?auto_720386 ?auto_720390 ) ) ( not ( = ?auto_720386 ?auto_720391 ) ) ( not ( = ?auto_720386 ?auto_720392 ) ) ( not ( = ?auto_720386 ?auto_720393 ) ) ( not ( = ?auto_720386 ?auto_720394 ) ) ( not ( = ?auto_720387 ?auto_720388 ) ) ( not ( = ?auto_720387 ?auto_720389 ) ) ( not ( = ?auto_720387 ?auto_720390 ) ) ( not ( = ?auto_720387 ?auto_720391 ) ) ( not ( = ?auto_720387 ?auto_720392 ) ) ( not ( = ?auto_720387 ?auto_720393 ) ) ( not ( = ?auto_720387 ?auto_720394 ) ) ( not ( = ?auto_720388 ?auto_720389 ) ) ( not ( = ?auto_720388 ?auto_720390 ) ) ( not ( = ?auto_720388 ?auto_720391 ) ) ( not ( = ?auto_720388 ?auto_720392 ) ) ( not ( = ?auto_720388 ?auto_720393 ) ) ( not ( = ?auto_720388 ?auto_720394 ) ) ( not ( = ?auto_720389 ?auto_720390 ) ) ( not ( = ?auto_720389 ?auto_720391 ) ) ( not ( = ?auto_720389 ?auto_720392 ) ) ( not ( = ?auto_720389 ?auto_720393 ) ) ( not ( = ?auto_720389 ?auto_720394 ) ) ( not ( = ?auto_720390 ?auto_720391 ) ) ( not ( = ?auto_720390 ?auto_720392 ) ) ( not ( = ?auto_720390 ?auto_720393 ) ) ( not ( = ?auto_720390 ?auto_720394 ) ) ( not ( = ?auto_720391 ?auto_720392 ) ) ( not ( = ?auto_720391 ?auto_720393 ) ) ( not ( = ?auto_720391 ?auto_720394 ) ) ( not ( = ?auto_720392 ?auto_720393 ) ) ( not ( = ?auto_720392 ?auto_720394 ) ) ( not ( = ?auto_720393 ?auto_720394 ) ) ( ON ?auto_720392 ?auto_720393 ) ( ON ?auto_720391 ?auto_720392 ) ( ON ?auto_720390 ?auto_720391 ) ( ON ?auto_720389 ?auto_720390 ) ( ON ?auto_720388 ?auto_720389 ) ( CLEAR ?auto_720386 ) ( ON ?auto_720387 ?auto_720388 ) ( CLEAR ?auto_720387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_720381 ?auto_720382 ?auto_720383 ?auto_720384 ?auto_720385 ?auto_720386 ?auto_720387 )
      ( MAKE-13PILE ?auto_720381 ?auto_720382 ?auto_720383 ?auto_720384 ?auto_720385 ?auto_720386 ?auto_720387 ?auto_720388 ?auto_720389 ?auto_720390 ?auto_720391 ?auto_720392 ?auto_720393 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720435 - BLOCK
      ?auto_720436 - BLOCK
      ?auto_720437 - BLOCK
      ?auto_720438 - BLOCK
      ?auto_720439 - BLOCK
      ?auto_720440 - BLOCK
      ?auto_720441 - BLOCK
      ?auto_720442 - BLOCK
      ?auto_720443 - BLOCK
      ?auto_720444 - BLOCK
      ?auto_720445 - BLOCK
      ?auto_720446 - BLOCK
      ?auto_720447 - BLOCK
    )
    :vars
    (
      ?auto_720448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720447 ?auto_720448 ) ( ON-TABLE ?auto_720435 ) ( ON ?auto_720436 ?auto_720435 ) ( ON ?auto_720437 ?auto_720436 ) ( ON ?auto_720438 ?auto_720437 ) ( ON ?auto_720439 ?auto_720438 ) ( not ( = ?auto_720435 ?auto_720436 ) ) ( not ( = ?auto_720435 ?auto_720437 ) ) ( not ( = ?auto_720435 ?auto_720438 ) ) ( not ( = ?auto_720435 ?auto_720439 ) ) ( not ( = ?auto_720435 ?auto_720440 ) ) ( not ( = ?auto_720435 ?auto_720441 ) ) ( not ( = ?auto_720435 ?auto_720442 ) ) ( not ( = ?auto_720435 ?auto_720443 ) ) ( not ( = ?auto_720435 ?auto_720444 ) ) ( not ( = ?auto_720435 ?auto_720445 ) ) ( not ( = ?auto_720435 ?auto_720446 ) ) ( not ( = ?auto_720435 ?auto_720447 ) ) ( not ( = ?auto_720435 ?auto_720448 ) ) ( not ( = ?auto_720436 ?auto_720437 ) ) ( not ( = ?auto_720436 ?auto_720438 ) ) ( not ( = ?auto_720436 ?auto_720439 ) ) ( not ( = ?auto_720436 ?auto_720440 ) ) ( not ( = ?auto_720436 ?auto_720441 ) ) ( not ( = ?auto_720436 ?auto_720442 ) ) ( not ( = ?auto_720436 ?auto_720443 ) ) ( not ( = ?auto_720436 ?auto_720444 ) ) ( not ( = ?auto_720436 ?auto_720445 ) ) ( not ( = ?auto_720436 ?auto_720446 ) ) ( not ( = ?auto_720436 ?auto_720447 ) ) ( not ( = ?auto_720436 ?auto_720448 ) ) ( not ( = ?auto_720437 ?auto_720438 ) ) ( not ( = ?auto_720437 ?auto_720439 ) ) ( not ( = ?auto_720437 ?auto_720440 ) ) ( not ( = ?auto_720437 ?auto_720441 ) ) ( not ( = ?auto_720437 ?auto_720442 ) ) ( not ( = ?auto_720437 ?auto_720443 ) ) ( not ( = ?auto_720437 ?auto_720444 ) ) ( not ( = ?auto_720437 ?auto_720445 ) ) ( not ( = ?auto_720437 ?auto_720446 ) ) ( not ( = ?auto_720437 ?auto_720447 ) ) ( not ( = ?auto_720437 ?auto_720448 ) ) ( not ( = ?auto_720438 ?auto_720439 ) ) ( not ( = ?auto_720438 ?auto_720440 ) ) ( not ( = ?auto_720438 ?auto_720441 ) ) ( not ( = ?auto_720438 ?auto_720442 ) ) ( not ( = ?auto_720438 ?auto_720443 ) ) ( not ( = ?auto_720438 ?auto_720444 ) ) ( not ( = ?auto_720438 ?auto_720445 ) ) ( not ( = ?auto_720438 ?auto_720446 ) ) ( not ( = ?auto_720438 ?auto_720447 ) ) ( not ( = ?auto_720438 ?auto_720448 ) ) ( not ( = ?auto_720439 ?auto_720440 ) ) ( not ( = ?auto_720439 ?auto_720441 ) ) ( not ( = ?auto_720439 ?auto_720442 ) ) ( not ( = ?auto_720439 ?auto_720443 ) ) ( not ( = ?auto_720439 ?auto_720444 ) ) ( not ( = ?auto_720439 ?auto_720445 ) ) ( not ( = ?auto_720439 ?auto_720446 ) ) ( not ( = ?auto_720439 ?auto_720447 ) ) ( not ( = ?auto_720439 ?auto_720448 ) ) ( not ( = ?auto_720440 ?auto_720441 ) ) ( not ( = ?auto_720440 ?auto_720442 ) ) ( not ( = ?auto_720440 ?auto_720443 ) ) ( not ( = ?auto_720440 ?auto_720444 ) ) ( not ( = ?auto_720440 ?auto_720445 ) ) ( not ( = ?auto_720440 ?auto_720446 ) ) ( not ( = ?auto_720440 ?auto_720447 ) ) ( not ( = ?auto_720440 ?auto_720448 ) ) ( not ( = ?auto_720441 ?auto_720442 ) ) ( not ( = ?auto_720441 ?auto_720443 ) ) ( not ( = ?auto_720441 ?auto_720444 ) ) ( not ( = ?auto_720441 ?auto_720445 ) ) ( not ( = ?auto_720441 ?auto_720446 ) ) ( not ( = ?auto_720441 ?auto_720447 ) ) ( not ( = ?auto_720441 ?auto_720448 ) ) ( not ( = ?auto_720442 ?auto_720443 ) ) ( not ( = ?auto_720442 ?auto_720444 ) ) ( not ( = ?auto_720442 ?auto_720445 ) ) ( not ( = ?auto_720442 ?auto_720446 ) ) ( not ( = ?auto_720442 ?auto_720447 ) ) ( not ( = ?auto_720442 ?auto_720448 ) ) ( not ( = ?auto_720443 ?auto_720444 ) ) ( not ( = ?auto_720443 ?auto_720445 ) ) ( not ( = ?auto_720443 ?auto_720446 ) ) ( not ( = ?auto_720443 ?auto_720447 ) ) ( not ( = ?auto_720443 ?auto_720448 ) ) ( not ( = ?auto_720444 ?auto_720445 ) ) ( not ( = ?auto_720444 ?auto_720446 ) ) ( not ( = ?auto_720444 ?auto_720447 ) ) ( not ( = ?auto_720444 ?auto_720448 ) ) ( not ( = ?auto_720445 ?auto_720446 ) ) ( not ( = ?auto_720445 ?auto_720447 ) ) ( not ( = ?auto_720445 ?auto_720448 ) ) ( not ( = ?auto_720446 ?auto_720447 ) ) ( not ( = ?auto_720446 ?auto_720448 ) ) ( not ( = ?auto_720447 ?auto_720448 ) ) ( ON ?auto_720446 ?auto_720447 ) ( ON ?auto_720445 ?auto_720446 ) ( ON ?auto_720444 ?auto_720445 ) ( ON ?auto_720443 ?auto_720444 ) ( ON ?auto_720442 ?auto_720443 ) ( ON ?auto_720441 ?auto_720442 ) ( CLEAR ?auto_720439 ) ( ON ?auto_720440 ?auto_720441 ) ( CLEAR ?auto_720440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_720435 ?auto_720436 ?auto_720437 ?auto_720438 ?auto_720439 ?auto_720440 )
      ( MAKE-13PILE ?auto_720435 ?auto_720436 ?auto_720437 ?auto_720438 ?auto_720439 ?auto_720440 ?auto_720441 ?auto_720442 ?auto_720443 ?auto_720444 ?auto_720445 ?auto_720446 ?auto_720447 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720489 - BLOCK
      ?auto_720490 - BLOCK
      ?auto_720491 - BLOCK
      ?auto_720492 - BLOCK
      ?auto_720493 - BLOCK
      ?auto_720494 - BLOCK
      ?auto_720495 - BLOCK
      ?auto_720496 - BLOCK
      ?auto_720497 - BLOCK
      ?auto_720498 - BLOCK
      ?auto_720499 - BLOCK
      ?auto_720500 - BLOCK
      ?auto_720501 - BLOCK
    )
    :vars
    (
      ?auto_720502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720501 ?auto_720502 ) ( ON-TABLE ?auto_720489 ) ( ON ?auto_720490 ?auto_720489 ) ( ON ?auto_720491 ?auto_720490 ) ( ON ?auto_720492 ?auto_720491 ) ( not ( = ?auto_720489 ?auto_720490 ) ) ( not ( = ?auto_720489 ?auto_720491 ) ) ( not ( = ?auto_720489 ?auto_720492 ) ) ( not ( = ?auto_720489 ?auto_720493 ) ) ( not ( = ?auto_720489 ?auto_720494 ) ) ( not ( = ?auto_720489 ?auto_720495 ) ) ( not ( = ?auto_720489 ?auto_720496 ) ) ( not ( = ?auto_720489 ?auto_720497 ) ) ( not ( = ?auto_720489 ?auto_720498 ) ) ( not ( = ?auto_720489 ?auto_720499 ) ) ( not ( = ?auto_720489 ?auto_720500 ) ) ( not ( = ?auto_720489 ?auto_720501 ) ) ( not ( = ?auto_720489 ?auto_720502 ) ) ( not ( = ?auto_720490 ?auto_720491 ) ) ( not ( = ?auto_720490 ?auto_720492 ) ) ( not ( = ?auto_720490 ?auto_720493 ) ) ( not ( = ?auto_720490 ?auto_720494 ) ) ( not ( = ?auto_720490 ?auto_720495 ) ) ( not ( = ?auto_720490 ?auto_720496 ) ) ( not ( = ?auto_720490 ?auto_720497 ) ) ( not ( = ?auto_720490 ?auto_720498 ) ) ( not ( = ?auto_720490 ?auto_720499 ) ) ( not ( = ?auto_720490 ?auto_720500 ) ) ( not ( = ?auto_720490 ?auto_720501 ) ) ( not ( = ?auto_720490 ?auto_720502 ) ) ( not ( = ?auto_720491 ?auto_720492 ) ) ( not ( = ?auto_720491 ?auto_720493 ) ) ( not ( = ?auto_720491 ?auto_720494 ) ) ( not ( = ?auto_720491 ?auto_720495 ) ) ( not ( = ?auto_720491 ?auto_720496 ) ) ( not ( = ?auto_720491 ?auto_720497 ) ) ( not ( = ?auto_720491 ?auto_720498 ) ) ( not ( = ?auto_720491 ?auto_720499 ) ) ( not ( = ?auto_720491 ?auto_720500 ) ) ( not ( = ?auto_720491 ?auto_720501 ) ) ( not ( = ?auto_720491 ?auto_720502 ) ) ( not ( = ?auto_720492 ?auto_720493 ) ) ( not ( = ?auto_720492 ?auto_720494 ) ) ( not ( = ?auto_720492 ?auto_720495 ) ) ( not ( = ?auto_720492 ?auto_720496 ) ) ( not ( = ?auto_720492 ?auto_720497 ) ) ( not ( = ?auto_720492 ?auto_720498 ) ) ( not ( = ?auto_720492 ?auto_720499 ) ) ( not ( = ?auto_720492 ?auto_720500 ) ) ( not ( = ?auto_720492 ?auto_720501 ) ) ( not ( = ?auto_720492 ?auto_720502 ) ) ( not ( = ?auto_720493 ?auto_720494 ) ) ( not ( = ?auto_720493 ?auto_720495 ) ) ( not ( = ?auto_720493 ?auto_720496 ) ) ( not ( = ?auto_720493 ?auto_720497 ) ) ( not ( = ?auto_720493 ?auto_720498 ) ) ( not ( = ?auto_720493 ?auto_720499 ) ) ( not ( = ?auto_720493 ?auto_720500 ) ) ( not ( = ?auto_720493 ?auto_720501 ) ) ( not ( = ?auto_720493 ?auto_720502 ) ) ( not ( = ?auto_720494 ?auto_720495 ) ) ( not ( = ?auto_720494 ?auto_720496 ) ) ( not ( = ?auto_720494 ?auto_720497 ) ) ( not ( = ?auto_720494 ?auto_720498 ) ) ( not ( = ?auto_720494 ?auto_720499 ) ) ( not ( = ?auto_720494 ?auto_720500 ) ) ( not ( = ?auto_720494 ?auto_720501 ) ) ( not ( = ?auto_720494 ?auto_720502 ) ) ( not ( = ?auto_720495 ?auto_720496 ) ) ( not ( = ?auto_720495 ?auto_720497 ) ) ( not ( = ?auto_720495 ?auto_720498 ) ) ( not ( = ?auto_720495 ?auto_720499 ) ) ( not ( = ?auto_720495 ?auto_720500 ) ) ( not ( = ?auto_720495 ?auto_720501 ) ) ( not ( = ?auto_720495 ?auto_720502 ) ) ( not ( = ?auto_720496 ?auto_720497 ) ) ( not ( = ?auto_720496 ?auto_720498 ) ) ( not ( = ?auto_720496 ?auto_720499 ) ) ( not ( = ?auto_720496 ?auto_720500 ) ) ( not ( = ?auto_720496 ?auto_720501 ) ) ( not ( = ?auto_720496 ?auto_720502 ) ) ( not ( = ?auto_720497 ?auto_720498 ) ) ( not ( = ?auto_720497 ?auto_720499 ) ) ( not ( = ?auto_720497 ?auto_720500 ) ) ( not ( = ?auto_720497 ?auto_720501 ) ) ( not ( = ?auto_720497 ?auto_720502 ) ) ( not ( = ?auto_720498 ?auto_720499 ) ) ( not ( = ?auto_720498 ?auto_720500 ) ) ( not ( = ?auto_720498 ?auto_720501 ) ) ( not ( = ?auto_720498 ?auto_720502 ) ) ( not ( = ?auto_720499 ?auto_720500 ) ) ( not ( = ?auto_720499 ?auto_720501 ) ) ( not ( = ?auto_720499 ?auto_720502 ) ) ( not ( = ?auto_720500 ?auto_720501 ) ) ( not ( = ?auto_720500 ?auto_720502 ) ) ( not ( = ?auto_720501 ?auto_720502 ) ) ( ON ?auto_720500 ?auto_720501 ) ( ON ?auto_720499 ?auto_720500 ) ( ON ?auto_720498 ?auto_720499 ) ( ON ?auto_720497 ?auto_720498 ) ( ON ?auto_720496 ?auto_720497 ) ( ON ?auto_720495 ?auto_720496 ) ( ON ?auto_720494 ?auto_720495 ) ( CLEAR ?auto_720492 ) ( ON ?auto_720493 ?auto_720494 ) ( CLEAR ?auto_720493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_720489 ?auto_720490 ?auto_720491 ?auto_720492 ?auto_720493 )
      ( MAKE-13PILE ?auto_720489 ?auto_720490 ?auto_720491 ?auto_720492 ?auto_720493 ?auto_720494 ?auto_720495 ?auto_720496 ?auto_720497 ?auto_720498 ?auto_720499 ?auto_720500 ?auto_720501 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720543 - BLOCK
      ?auto_720544 - BLOCK
      ?auto_720545 - BLOCK
      ?auto_720546 - BLOCK
      ?auto_720547 - BLOCK
      ?auto_720548 - BLOCK
      ?auto_720549 - BLOCK
      ?auto_720550 - BLOCK
      ?auto_720551 - BLOCK
      ?auto_720552 - BLOCK
      ?auto_720553 - BLOCK
      ?auto_720554 - BLOCK
      ?auto_720555 - BLOCK
    )
    :vars
    (
      ?auto_720556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720555 ?auto_720556 ) ( ON-TABLE ?auto_720543 ) ( ON ?auto_720544 ?auto_720543 ) ( ON ?auto_720545 ?auto_720544 ) ( not ( = ?auto_720543 ?auto_720544 ) ) ( not ( = ?auto_720543 ?auto_720545 ) ) ( not ( = ?auto_720543 ?auto_720546 ) ) ( not ( = ?auto_720543 ?auto_720547 ) ) ( not ( = ?auto_720543 ?auto_720548 ) ) ( not ( = ?auto_720543 ?auto_720549 ) ) ( not ( = ?auto_720543 ?auto_720550 ) ) ( not ( = ?auto_720543 ?auto_720551 ) ) ( not ( = ?auto_720543 ?auto_720552 ) ) ( not ( = ?auto_720543 ?auto_720553 ) ) ( not ( = ?auto_720543 ?auto_720554 ) ) ( not ( = ?auto_720543 ?auto_720555 ) ) ( not ( = ?auto_720543 ?auto_720556 ) ) ( not ( = ?auto_720544 ?auto_720545 ) ) ( not ( = ?auto_720544 ?auto_720546 ) ) ( not ( = ?auto_720544 ?auto_720547 ) ) ( not ( = ?auto_720544 ?auto_720548 ) ) ( not ( = ?auto_720544 ?auto_720549 ) ) ( not ( = ?auto_720544 ?auto_720550 ) ) ( not ( = ?auto_720544 ?auto_720551 ) ) ( not ( = ?auto_720544 ?auto_720552 ) ) ( not ( = ?auto_720544 ?auto_720553 ) ) ( not ( = ?auto_720544 ?auto_720554 ) ) ( not ( = ?auto_720544 ?auto_720555 ) ) ( not ( = ?auto_720544 ?auto_720556 ) ) ( not ( = ?auto_720545 ?auto_720546 ) ) ( not ( = ?auto_720545 ?auto_720547 ) ) ( not ( = ?auto_720545 ?auto_720548 ) ) ( not ( = ?auto_720545 ?auto_720549 ) ) ( not ( = ?auto_720545 ?auto_720550 ) ) ( not ( = ?auto_720545 ?auto_720551 ) ) ( not ( = ?auto_720545 ?auto_720552 ) ) ( not ( = ?auto_720545 ?auto_720553 ) ) ( not ( = ?auto_720545 ?auto_720554 ) ) ( not ( = ?auto_720545 ?auto_720555 ) ) ( not ( = ?auto_720545 ?auto_720556 ) ) ( not ( = ?auto_720546 ?auto_720547 ) ) ( not ( = ?auto_720546 ?auto_720548 ) ) ( not ( = ?auto_720546 ?auto_720549 ) ) ( not ( = ?auto_720546 ?auto_720550 ) ) ( not ( = ?auto_720546 ?auto_720551 ) ) ( not ( = ?auto_720546 ?auto_720552 ) ) ( not ( = ?auto_720546 ?auto_720553 ) ) ( not ( = ?auto_720546 ?auto_720554 ) ) ( not ( = ?auto_720546 ?auto_720555 ) ) ( not ( = ?auto_720546 ?auto_720556 ) ) ( not ( = ?auto_720547 ?auto_720548 ) ) ( not ( = ?auto_720547 ?auto_720549 ) ) ( not ( = ?auto_720547 ?auto_720550 ) ) ( not ( = ?auto_720547 ?auto_720551 ) ) ( not ( = ?auto_720547 ?auto_720552 ) ) ( not ( = ?auto_720547 ?auto_720553 ) ) ( not ( = ?auto_720547 ?auto_720554 ) ) ( not ( = ?auto_720547 ?auto_720555 ) ) ( not ( = ?auto_720547 ?auto_720556 ) ) ( not ( = ?auto_720548 ?auto_720549 ) ) ( not ( = ?auto_720548 ?auto_720550 ) ) ( not ( = ?auto_720548 ?auto_720551 ) ) ( not ( = ?auto_720548 ?auto_720552 ) ) ( not ( = ?auto_720548 ?auto_720553 ) ) ( not ( = ?auto_720548 ?auto_720554 ) ) ( not ( = ?auto_720548 ?auto_720555 ) ) ( not ( = ?auto_720548 ?auto_720556 ) ) ( not ( = ?auto_720549 ?auto_720550 ) ) ( not ( = ?auto_720549 ?auto_720551 ) ) ( not ( = ?auto_720549 ?auto_720552 ) ) ( not ( = ?auto_720549 ?auto_720553 ) ) ( not ( = ?auto_720549 ?auto_720554 ) ) ( not ( = ?auto_720549 ?auto_720555 ) ) ( not ( = ?auto_720549 ?auto_720556 ) ) ( not ( = ?auto_720550 ?auto_720551 ) ) ( not ( = ?auto_720550 ?auto_720552 ) ) ( not ( = ?auto_720550 ?auto_720553 ) ) ( not ( = ?auto_720550 ?auto_720554 ) ) ( not ( = ?auto_720550 ?auto_720555 ) ) ( not ( = ?auto_720550 ?auto_720556 ) ) ( not ( = ?auto_720551 ?auto_720552 ) ) ( not ( = ?auto_720551 ?auto_720553 ) ) ( not ( = ?auto_720551 ?auto_720554 ) ) ( not ( = ?auto_720551 ?auto_720555 ) ) ( not ( = ?auto_720551 ?auto_720556 ) ) ( not ( = ?auto_720552 ?auto_720553 ) ) ( not ( = ?auto_720552 ?auto_720554 ) ) ( not ( = ?auto_720552 ?auto_720555 ) ) ( not ( = ?auto_720552 ?auto_720556 ) ) ( not ( = ?auto_720553 ?auto_720554 ) ) ( not ( = ?auto_720553 ?auto_720555 ) ) ( not ( = ?auto_720553 ?auto_720556 ) ) ( not ( = ?auto_720554 ?auto_720555 ) ) ( not ( = ?auto_720554 ?auto_720556 ) ) ( not ( = ?auto_720555 ?auto_720556 ) ) ( ON ?auto_720554 ?auto_720555 ) ( ON ?auto_720553 ?auto_720554 ) ( ON ?auto_720552 ?auto_720553 ) ( ON ?auto_720551 ?auto_720552 ) ( ON ?auto_720550 ?auto_720551 ) ( ON ?auto_720549 ?auto_720550 ) ( ON ?auto_720548 ?auto_720549 ) ( ON ?auto_720547 ?auto_720548 ) ( CLEAR ?auto_720545 ) ( ON ?auto_720546 ?auto_720547 ) ( CLEAR ?auto_720546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_720543 ?auto_720544 ?auto_720545 ?auto_720546 )
      ( MAKE-13PILE ?auto_720543 ?auto_720544 ?auto_720545 ?auto_720546 ?auto_720547 ?auto_720548 ?auto_720549 ?auto_720550 ?auto_720551 ?auto_720552 ?auto_720553 ?auto_720554 ?auto_720555 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720597 - BLOCK
      ?auto_720598 - BLOCK
      ?auto_720599 - BLOCK
      ?auto_720600 - BLOCK
      ?auto_720601 - BLOCK
      ?auto_720602 - BLOCK
      ?auto_720603 - BLOCK
      ?auto_720604 - BLOCK
      ?auto_720605 - BLOCK
      ?auto_720606 - BLOCK
      ?auto_720607 - BLOCK
      ?auto_720608 - BLOCK
      ?auto_720609 - BLOCK
    )
    :vars
    (
      ?auto_720610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720609 ?auto_720610 ) ( ON-TABLE ?auto_720597 ) ( ON ?auto_720598 ?auto_720597 ) ( not ( = ?auto_720597 ?auto_720598 ) ) ( not ( = ?auto_720597 ?auto_720599 ) ) ( not ( = ?auto_720597 ?auto_720600 ) ) ( not ( = ?auto_720597 ?auto_720601 ) ) ( not ( = ?auto_720597 ?auto_720602 ) ) ( not ( = ?auto_720597 ?auto_720603 ) ) ( not ( = ?auto_720597 ?auto_720604 ) ) ( not ( = ?auto_720597 ?auto_720605 ) ) ( not ( = ?auto_720597 ?auto_720606 ) ) ( not ( = ?auto_720597 ?auto_720607 ) ) ( not ( = ?auto_720597 ?auto_720608 ) ) ( not ( = ?auto_720597 ?auto_720609 ) ) ( not ( = ?auto_720597 ?auto_720610 ) ) ( not ( = ?auto_720598 ?auto_720599 ) ) ( not ( = ?auto_720598 ?auto_720600 ) ) ( not ( = ?auto_720598 ?auto_720601 ) ) ( not ( = ?auto_720598 ?auto_720602 ) ) ( not ( = ?auto_720598 ?auto_720603 ) ) ( not ( = ?auto_720598 ?auto_720604 ) ) ( not ( = ?auto_720598 ?auto_720605 ) ) ( not ( = ?auto_720598 ?auto_720606 ) ) ( not ( = ?auto_720598 ?auto_720607 ) ) ( not ( = ?auto_720598 ?auto_720608 ) ) ( not ( = ?auto_720598 ?auto_720609 ) ) ( not ( = ?auto_720598 ?auto_720610 ) ) ( not ( = ?auto_720599 ?auto_720600 ) ) ( not ( = ?auto_720599 ?auto_720601 ) ) ( not ( = ?auto_720599 ?auto_720602 ) ) ( not ( = ?auto_720599 ?auto_720603 ) ) ( not ( = ?auto_720599 ?auto_720604 ) ) ( not ( = ?auto_720599 ?auto_720605 ) ) ( not ( = ?auto_720599 ?auto_720606 ) ) ( not ( = ?auto_720599 ?auto_720607 ) ) ( not ( = ?auto_720599 ?auto_720608 ) ) ( not ( = ?auto_720599 ?auto_720609 ) ) ( not ( = ?auto_720599 ?auto_720610 ) ) ( not ( = ?auto_720600 ?auto_720601 ) ) ( not ( = ?auto_720600 ?auto_720602 ) ) ( not ( = ?auto_720600 ?auto_720603 ) ) ( not ( = ?auto_720600 ?auto_720604 ) ) ( not ( = ?auto_720600 ?auto_720605 ) ) ( not ( = ?auto_720600 ?auto_720606 ) ) ( not ( = ?auto_720600 ?auto_720607 ) ) ( not ( = ?auto_720600 ?auto_720608 ) ) ( not ( = ?auto_720600 ?auto_720609 ) ) ( not ( = ?auto_720600 ?auto_720610 ) ) ( not ( = ?auto_720601 ?auto_720602 ) ) ( not ( = ?auto_720601 ?auto_720603 ) ) ( not ( = ?auto_720601 ?auto_720604 ) ) ( not ( = ?auto_720601 ?auto_720605 ) ) ( not ( = ?auto_720601 ?auto_720606 ) ) ( not ( = ?auto_720601 ?auto_720607 ) ) ( not ( = ?auto_720601 ?auto_720608 ) ) ( not ( = ?auto_720601 ?auto_720609 ) ) ( not ( = ?auto_720601 ?auto_720610 ) ) ( not ( = ?auto_720602 ?auto_720603 ) ) ( not ( = ?auto_720602 ?auto_720604 ) ) ( not ( = ?auto_720602 ?auto_720605 ) ) ( not ( = ?auto_720602 ?auto_720606 ) ) ( not ( = ?auto_720602 ?auto_720607 ) ) ( not ( = ?auto_720602 ?auto_720608 ) ) ( not ( = ?auto_720602 ?auto_720609 ) ) ( not ( = ?auto_720602 ?auto_720610 ) ) ( not ( = ?auto_720603 ?auto_720604 ) ) ( not ( = ?auto_720603 ?auto_720605 ) ) ( not ( = ?auto_720603 ?auto_720606 ) ) ( not ( = ?auto_720603 ?auto_720607 ) ) ( not ( = ?auto_720603 ?auto_720608 ) ) ( not ( = ?auto_720603 ?auto_720609 ) ) ( not ( = ?auto_720603 ?auto_720610 ) ) ( not ( = ?auto_720604 ?auto_720605 ) ) ( not ( = ?auto_720604 ?auto_720606 ) ) ( not ( = ?auto_720604 ?auto_720607 ) ) ( not ( = ?auto_720604 ?auto_720608 ) ) ( not ( = ?auto_720604 ?auto_720609 ) ) ( not ( = ?auto_720604 ?auto_720610 ) ) ( not ( = ?auto_720605 ?auto_720606 ) ) ( not ( = ?auto_720605 ?auto_720607 ) ) ( not ( = ?auto_720605 ?auto_720608 ) ) ( not ( = ?auto_720605 ?auto_720609 ) ) ( not ( = ?auto_720605 ?auto_720610 ) ) ( not ( = ?auto_720606 ?auto_720607 ) ) ( not ( = ?auto_720606 ?auto_720608 ) ) ( not ( = ?auto_720606 ?auto_720609 ) ) ( not ( = ?auto_720606 ?auto_720610 ) ) ( not ( = ?auto_720607 ?auto_720608 ) ) ( not ( = ?auto_720607 ?auto_720609 ) ) ( not ( = ?auto_720607 ?auto_720610 ) ) ( not ( = ?auto_720608 ?auto_720609 ) ) ( not ( = ?auto_720608 ?auto_720610 ) ) ( not ( = ?auto_720609 ?auto_720610 ) ) ( ON ?auto_720608 ?auto_720609 ) ( ON ?auto_720607 ?auto_720608 ) ( ON ?auto_720606 ?auto_720607 ) ( ON ?auto_720605 ?auto_720606 ) ( ON ?auto_720604 ?auto_720605 ) ( ON ?auto_720603 ?auto_720604 ) ( ON ?auto_720602 ?auto_720603 ) ( ON ?auto_720601 ?auto_720602 ) ( ON ?auto_720600 ?auto_720601 ) ( CLEAR ?auto_720598 ) ( ON ?auto_720599 ?auto_720600 ) ( CLEAR ?auto_720599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_720597 ?auto_720598 ?auto_720599 )
      ( MAKE-13PILE ?auto_720597 ?auto_720598 ?auto_720599 ?auto_720600 ?auto_720601 ?auto_720602 ?auto_720603 ?auto_720604 ?auto_720605 ?auto_720606 ?auto_720607 ?auto_720608 ?auto_720609 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720651 - BLOCK
      ?auto_720652 - BLOCK
      ?auto_720653 - BLOCK
      ?auto_720654 - BLOCK
      ?auto_720655 - BLOCK
      ?auto_720656 - BLOCK
      ?auto_720657 - BLOCK
      ?auto_720658 - BLOCK
      ?auto_720659 - BLOCK
      ?auto_720660 - BLOCK
      ?auto_720661 - BLOCK
      ?auto_720662 - BLOCK
      ?auto_720663 - BLOCK
    )
    :vars
    (
      ?auto_720664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720663 ?auto_720664 ) ( ON-TABLE ?auto_720651 ) ( not ( = ?auto_720651 ?auto_720652 ) ) ( not ( = ?auto_720651 ?auto_720653 ) ) ( not ( = ?auto_720651 ?auto_720654 ) ) ( not ( = ?auto_720651 ?auto_720655 ) ) ( not ( = ?auto_720651 ?auto_720656 ) ) ( not ( = ?auto_720651 ?auto_720657 ) ) ( not ( = ?auto_720651 ?auto_720658 ) ) ( not ( = ?auto_720651 ?auto_720659 ) ) ( not ( = ?auto_720651 ?auto_720660 ) ) ( not ( = ?auto_720651 ?auto_720661 ) ) ( not ( = ?auto_720651 ?auto_720662 ) ) ( not ( = ?auto_720651 ?auto_720663 ) ) ( not ( = ?auto_720651 ?auto_720664 ) ) ( not ( = ?auto_720652 ?auto_720653 ) ) ( not ( = ?auto_720652 ?auto_720654 ) ) ( not ( = ?auto_720652 ?auto_720655 ) ) ( not ( = ?auto_720652 ?auto_720656 ) ) ( not ( = ?auto_720652 ?auto_720657 ) ) ( not ( = ?auto_720652 ?auto_720658 ) ) ( not ( = ?auto_720652 ?auto_720659 ) ) ( not ( = ?auto_720652 ?auto_720660 ) ) ( not ( = ?auto_720652 ?auto_720661 ) ) ( not ( = ?auto_720652 ?auto_720662 ) ) ( not ( = ?auto_720652 ?auto_720663 ) ) ( not ( = ?auto_720652 ?auto_720664 ) ) ( not ( = ?auto_720653 ?auto_720654 ) ) ( not ( = ?auto_720653 ?auto_720655 ) ) ( not ( = ?auto_720653 ?auto_720656 ) ) ( not ( = ?auto_720653 ?auto_720657 ) ) ( not ( = ?auto_720653 ?auto_720658 ) ) ( not ( = ?auto_720653 ?auto_720659 ) ) ( not ( = ?auto_720653 ?auto_720660 ) ) ( not ( = ?auto_720653 ?auto_720661 ) ) ( not ( = ?auto_720653 ?auto_720662 ) ) ( not ( = ?auto_720653 ?auto_720663 ) ) ( not ( = ?auto_720653 ?auto_720664 ) ) ( not ( = ?auto_720654 ?auto_720655 ) ) ( not ( = ?auto_720654 ?auto_720656 ) ) ( not ( = ?auto_720654 ?auto_720657 ) ) ( not ( = ?auto_720654 ?auto_720658 ) ) ( not ( = ?auto_720654 ?auto_720659 ) ) ( not ( = ?auto_720654 ?auto_720660 ) ) ( not ( = ?auto_720654 ?auto_720661 ) ) ( not ( = ?auto_720654 ?auto_720662 ) ) ( not ( = ?auto_720654 ?auto_720663 ) ) ( not ( = ?auto_720654 ?auto_720664 ) ) ( not ( = ?auto_720655 ?auto_720656 ) ) ( not ( = ?auto_720655 ?auto_720657 ) ) ( not ( = ?auto_720655 ?auto_720658 ) ) ( not ( = ?auto_720655 ?auto_720659 ) ) ( not ( = ?auto_720655 ?auto_720660 ) ) ( not ( = ?auto_720655 ?auto_720661 ) ) ( not ( = ?auto_720655 ?auto_720662 ) ) ( not ( = ?auto_720655 ?auto_720663 ) ) ( not ( = ?auto_720655 ?auto_720664 ) ) ( not ( = ?auto_720656 ?auto_720657 ) ) ( not ( = ?auto_720656 ?auto_720658 ) ) ( not ( = ?auto_720656 ?auto_720659 ) ) ( not ( = ?auto_720656 ?auto_720660 ) ) ( not ( = ?auto_720656 ?auto_720661 ) ) ( not ( = ?auto_720656 ?auto_720662 ) ) ( not ( = ?auto_720656 ?auto_720663 ) ) ( not ( = ?auto_720656 ?auto_720664 ) ) ( not ( = ?auto_720657 ?auto_720658 ) ) ( not ( = ?auto_720657 ?auto_720659 ) ) ( not ( = ?auto_720657 ?auto_720660 ) ) ( not ( = ?auto_720657 ?auto_720661 ) ) ( not ( = ?auto_720657 ?auto_720662 ) ) ( not ( = ?auto_720657 ?auto_720663 ) ) ( not ( = ?auto_720657 ?auto_720664 ) ) ( not ( = ?auto_720658 ?auto_720659 ) ) ( not ( = ?auto_720658 ?auto_720660 ) ) ( not ( = ?auto_720658 ?auto_720661 ) ) ( not ( = ?auto_720658 ?auto_720662 ) ) ( not ( = ?auto_720658 ?auto_720663 ) ) ( not ( = ?auto_720658 ?auto_720664 ) ) ( not ( = ?auto_720659 ?auto_720660 ) ) ( not ( = ?auto_720659 ?auto_720661 ) ) ( not ( = ?auto_720659 ?auto_720662 ) ) ( not ( = ?auto_720659 ?auto_720663 ) ) ( not ( = ?auto_720659 ?auto_720664 ) ) ( not ( = ?auto_720660 ?auto_720661 ) ) ( not ( = ?auto_720660 ?auto_720662 ) ) ( not ( = ?auto_720660 ?auto_720663 ) ) ( not ( = ?auto_720660 ?auto_720664 ) ) ( not ( = ?auto_720661 ?auto_720662 ) ) ( not ( = ?auto_720661 ?auto_720663 ) ) ( not ( = ?auto_720661 ?auto_720664 ) ) ( not ( = ?auto_720662 ?auto_720663 ) ) ( not ( = ?auto_720662 ?auto_720664 ) ) ( not ( = ?auto_720663 ?auto_720664 ) ) ( ON ?auto_720662 ?auto_720663 ) ( ON ?auto_720661 ?auto_720662 ) ( ON ?auto_720660 ?auto_720661 ) ( ON ?auto_720659 ?auto_720660 ) ( ON ?auto_720658 ?auto_720659 ) ( ON ?auto_720657 ?auto_720658 ) ( ON ?auto_720656 ?auto_720657 ) ( ON ?auto_720655 ?auto_720656 ) ( ON ?auto_720654 ?auto_720655 ) ( ON ?auto_720653 ?auto_720654 ) ( CLEAR ?auto_720651 ) ( ON ?auto_720652 ?auto_720653 ) ( CLEAR ?auto_720652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_720651 ?auto_720652 )
      ( MAKE-13PILE ?auto_720651 ?auto_720652 ?auto_720653 ?auto_720654 ?auto_720655 ?auto_720656 ?auto_720657 ?auto_720658 ?auto_720659 ?auto_720660 ?auto_720661 ?auto_720662 ?auto_720663 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_720705 - BLOCK
      ?auto_720706 - BLOCK
      ?auto_720707 - BLOCK
      ?auto_720708 - BLOCK
      ?auto_720709 - BLOCK
      ?auto_720710 - BLOCK
      ?auto_720711 - BLOCK
      ?auto_720712 - BLOCK
      ?auto_720713 - BLOCK
      ?auto_720714 - BLOCK
      ?auto_720715 - BLOCK
      ?auto_720716 - BLOCK
      ?auto_720717 - BLOCK
    )
    :vars
    (
      ?auto_720718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720717 ?auto_720718 ) ( not ( = ?auto_720705 ?auto_720706 ) ) ( not ( = ?auto_720705 ?auto_720707 ) ) ( not ( = ?auto_720705 ?auto_720708 ) ) ( not ( = ?auto_720705 ?auto_720709 ) ) ( not ( = ?auto_720705 ?auto_720710 ) ) ( not ( = ?auto_720705 ?auto_720711 ) ) ( not ( = ?auto_720705 ?auto_720712 ) ) ( not ( = ?auto_720705 ?auto_720713 ) ) ( not ( = ?auto_720705 ?auto_720714 ) ) ( not ( = ?auto_720705 ?auto_720715 ) ) ( not ( = ?auto_720705 ?auto_720716 ) ) ( not ( = ?auto_720705 ?auto_720717 ) ) ( not ( = ?auto_720705 ?auto_720718 ) ) ( not ( = ?auto_720706 ?auto_720707 ) ) ( not ( = ?auto_720706 ?auto_720708 ) ) ( not ( = ?auto_720706 ?auto_720709 ) ) ( not ( = ?auto_720706 ?auto_720710 ) ) ( not ( = ?auto_720706 ?auto_720711 ) ) ( not ( = ?auto_720706 ?auto_720712 ) ) ( not ( = ?auto_720706 ?auto_720713 ) ) ( not ( = ?auto_720706 ?auto_720714 ) ) ( not ( = ?auto_720706 ?auto_720715 ) ) ( not ( = ?auto_720706 ?auto_720716 ) ) ( not ( = ?auto_720706 ?auto_720717 ) ) ( not ( = ?auto_720706 ?auto_720718 ) ) ( not ( = ?auto_720707 ?auto_720708 ) ) ( not ( = ?auto_720707 ?auto_720709 ) ) ( not ( = ?auto_720707 ?auto_720710 ) ) ( not ( = ?auto_720707 ?auto_720711 ) ) ( not ( = ?auto_720707 ?auto_720712 ) ) ( not ( = ?auto_720707 ?auto_720713 ) ) ( not ( = ?auto_720707 ?auto_720714 ) ) ( not ( = ?auto_720707 ?auto_720715 ) ) ( not ( = ?auto_720707 ?auto_720716 ) ) ( not ( = ?auto_720707 ?auto_720717 ) ) ( not ( = ?auto_720707 ?auto_720718 ) ) ( not ( = ?auto_720708 ?auto_720709 ) ) ( not ( = ?auto_720708 ?auto_720710 ) ) ( not ( = ?auto_720708 ?auto_720711 ) ) ( not ( = ?auto_720708 ?auto_720712 ) ) ( not ( = ?auto_720708 ?auto_720713 ) ) ( not ( = ?auto_720708 ?auto_720714 ) ) ( not ( = ?auto_720708 ?auto_720715 ) ) ( not ( = ?auto_720708 ?auto_720716 ) ) ( not ( = ?auto_720708 ?auto_720717 ) ) ( not ( = ?auto_720708 ?auto_720718 ) ) ( not ( = ?auto_720709 ?auto_720710 ) ) ( not ( = ?auto_720709 ?auto_720711 ) ) ( not ( = ?auto_720709 ?auto_720712 ) ) ( not ( = ?auto_720709 ?auto_720713 ) ) ( not ( = ?auto_720709 ?auto_720714 ) ) ( not ( = ?auto_720709 ?auto_720715 ) ) ( not ( = ?auto_720709 ?auto_720716 ) ) ( not ( = ?auto_720709 ?auto_720717 ) ) ( not ( = ?auto_720709 ?auto_720718 ) ) ( not ( = ?auto_720710 ?auto_720711 ) ) ( not ( = ?auto_720710 ?auto_720712 ) ) ( not ( = ?auto_720710 ?auto_720713 ) ) ( not ( = ?auto_720710 ?auto_720714 ) ) ( not ( = ?auto_720710 ?auto_720715 ) ) ( not ( = ?auto_720710 ?auto_720716 ) ) ( not ( = ?auto_720710 ?auto_720717 ) ) ( not ( = ?auto_720710 ?auto_720718 ) ) ( not ( = ?auto_720711 ?auto_720712 ) ) ( not ( = ?auto_720711 ?auto_720713 ) ) ( not ( = ?auto_720711 ?auto_720714 ) ) ( not ( = ?auto_720711 ?auto_720715 ) ) ( not ( = ?auto_720711 ?auto_720716 ) ) ( not ( = ?auto_720711 ?auto_720717 ) ) ( not ( = ?auto_720711 ?auto_720718 ) ) ( not ( = ?auto_720712 ?auto_720713 ) ) ( not ( = ?auto_720712 ?auto_720714 ) ) ( not ( = ?auto_720712 ?auto_720715 ) ) ( not ( = ?auto_720712 ?auto_720716 ) ) ( not ( = ?auto_720712 ?auto_720717 ) ) ( not ( = ?auto_720712 ?auto_720718 ) ) ( not ( = ?auto_720713 ?auto_720714 ) ) ( not ( = ?auto_720713 ?auto_720715 ) ) ( not ( = ?auto_720713 ?auto_720716 ) ) ( not ( = ?auto_720713 ?auto_720717 ) ) ( not ( = ?auto_720713 ?auto_720718 ) ) ( not ( = ?auto_720714 ?auto_720715 ) ) ( not ( = ?auto_720714 ?auto_720716 ) ) ( not ( = ?auto_720714 ?auto_720717 ) ) ( not ( = ?auto_720714 ?auto_720718 ) ) ( not ( = ?auto_720715 ?auto_720716 ) ) ( not ( = ?auto_720715 ?auto_720717 ) ) ( not ( = ?auto_720715 ?auto_720718 ) ) ( not ( = ?auto_720716 ?auto_720717 ) ) ( not ( = ?auto_720716 ?auto_720718 ) ) ( not ( = ?auto_720717 ?auto_720718 ) ) ( ON ?auto_720716 ?auto_720717 ) ( ON ?auto_720715 ?auto_720716 ) ( ON ?auto_720714 ?auto_720715 ) ( ON ?auto_720713 ?auto_720714 ) ( ON ?auto_720712 ?auto_720713 ) ( ON ?auto_720711 ?auto_720712 ) ( ON ?auto_720710 ?auto_720711 ) ( ON ?auto_720709 ?auto_720710 ) ( ON ?auto_720708 ?auto_720709 ) ( ON ?auto_720707 ?auto_720708 ) ( ON ?auto_720706 ?auto_720707 ) ( ON ?auto_720705 ?auto_720706 ) ( CLEAR ?auto_720705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_720705 )
      ( MAKE-13PILE ?auto_720705 ?auto_720706 ?auto_720707 ?auto_720708 ?auto_720709 ?auto_720710 ?auto_720711 ?auto_720712 ?auto_720713 ?auto_720714 ?auto_720715 ?auto_720716 ?auto_720717 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_720760 - BLOCK
      ?auto_720761 - BLOCK
      ?auto_720762 - BLOCK
      ?auto_720763 - BLOCK
      ?auto_720764 - BLOCK
      ?auto_720765 - BLOCK
      ?auto_720766 - BLOCK
      ?auto_720767 - BLOCK
      ?auto_720768 - BLOCK
      ?auto_720769 - BLOCK
      ?auto_720770 - BLOCK
      ?auto_720771 - BLOCK
      ?auto_720772 - BLOCK
      ?auto_720773 - BLOCK
    )
    :vars
    (
      ?auto_720774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_720772 ) ( ON ?auto_720773 ?auto_720774 ) ( CLEAR ?auto_720773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_720760 ) ( ON ?auto_720761 ?auto_720760 ) ( ON ?auto_720762 ?auto_720761 ) ( ON ?auto_720763 ?auto_720762 ) ( ON ?auto_720764 ?auto_720763 ) ( ON ?auto_720765 ?auto_720764 ) ( ON ?auto_720766 ?auto_720765 ) ( ON ?auto_720767 ?auto_720766 ) ( ON ?auto_720768 ?auto_720767 ) ( ON ?auto_720769 ?auto_720768 ) ( ON ?auto_720770 ?auto_720769 ) ( ON ?auto_720771 ?auto_720770 ) ( ON ?auto_720772 ?auto_720771 ) ( not ( = ?auto_720760 ?auto_720761 ) ) ( not ( = ?auto_720760 ?auto_720762 ) ) ( not ( = ?auto_720760 ?auto_720763 ) ) ( not ( = ?auto_720760 ?auto_720764 ) ) ( not ( = ?auto_720760 ?auto_720765 ) ) ( not ( = ?auto_720760 ?auto_720766 ) ) ( not ( = ?auto_720760 ?auto_720767 ) ) ( not ( = ?auto_720760 ?auto_720768 ) ) ( not ( = ?auto_720760 ?auto_720769 ) ) ( not ( = ?auto_720760 ?auto_720770 ) ) ( not ( = ?auto_720760 ?auto_720771 ) ) ( not ( = ?auto_720760 ?auto_720772 ) ) ( not ( = ?auto_720760 ?auto_720773 ) ) ( not ( = ?auto_720760 ?auto_720774 ) ) ( not ( = ?auto_720761 ?auto_720762 ) ) ( not ( = ?auto_720761 ?auto_720763 ) ) ( not ( = ?auto_720761 ?auto_720764 ) ) ( not ( = ?auto_720761 ?auto_720765 ) ) ( not ( = ?auto_720761 ?auto_720766 ) ) ( not ( = ?auto_720761 ?auto_720767 ) ) ( not ( = ?auto_720761 ?auto_720768 ) ) ( not ( = ?auto_720761 ?auto_720769 ) ) ( not ( = ?auto_720761 ?auto_720770 ) ) ( not ( = ?auto_720761 ?auto_720771 ) ) ( not ( = ?auto_720761 ?auto_720772 ) ) ( not ( = ?auto_720761 ?auto_720773 ) ) ( not ( = ?auto_720761 ?auto_720774 ) ) ( not ( = ?auto_720762 ?auto_720763 ) ) ( not ( = ?auto_720762 ?auto_720764 ) ) ( not ( = ?auto_720762 ?auto_720765 ) ) ( not ( = ?auto_720762 ?auto_720766 ) ) ( not ( = ?auto_720762 ?auto_720767 ) ) ( not ( = ?auto_720762 ?auto_720768 ) ) ( not ( = ?auto_720762 ?auto_720769 ) ) ( not ( = ?auto_720762 ?auto_720770 ) ) ( not ( = ?auto_720762 ?auto_720771 ) ) ( not ( = ?auto_720762 ?auto_720772 ) ) ( not ( = ?auto_720762 ?auto_720773 ) ) ( not ( = ?auto_720762 ?auto_720774 ) ) ( not ( = ?auto_720763 ?auto_720764 ) ) ( not ( = ?auto_720763 ?auto_720765 ) ) ( not ( = ?auto_720763 ?auto_720766 ) ) ( not ( = ?auto_720763 ?auto_720767 ) ) ( not ( = ?auto_720763 ?auto_720768 ) ) ( not ( = ?auto_720763 ?auto_720769 ) ) ( not ( = ?auto_720763 ?auto_720770 ) ) ( not ( = ?auto_720763 ?auto_720771 ) ) ( not ( = ?auto_720763 ?auto_720772 ) ) ( not ( = ?auto_720763 ?auto_720773 ) ) ( not ( = ?auto_720763 ?auto_720774 ) ) ( not ( = ?auto_720764 ?auto_720765 ) ) ( not ( = ?auto_720764 ?auto_720766 ) ) ( not ( = ?auto_720764 ?auto_720767 ) ) ( not ( = ?auto_720764 ?auto_720768 ) ) ( not ( = ?auto_720764 ?auto_720769 ) ) ( not ( = ?auto_720764 ?auto_720770 ) ) ( not ( = ?auto_720764 ?auto_720771 ) ) ( not ( = ?auto_720764 ?auto_720772 ) ) ( not ( = ?auto_720764 ?auto_720773 ) ) ( not ( = ?auto_720764 ?auto_720774 ) ) ( not ( = ?auto_720765 ?auto_720766 ) ) ( not ( = ?auto_720765 ?auto_720767 ) ) ( not ( = ?auto_720765 ?auto_720768 ) ) ( not ( = ?auto_720765 ?auto_720769 ) ) ( not ( = ?auto_720765 ?auto_720770 ) ) ( not ( = ?auto_720765 ?auto_720771 ) ) ( not ( = ?auto_720765 ?auto_720772 ) ) ( not ( = ?auto_720765 ?auto_720773 ) ) ( not ( = ?auto_720765 ?auto_720774 ) ) ( not ( = ?auto_720766 ?auto_720767 ) ) ( not ( = ?auto_720766 ?auto_720768 ) ) ( not ( = ?auto_720766 ?auto_720769 ) ) ( not ( = ?auto_720766 ?auto_720770 ) ) ( not ( = ?auto_720766 ?auto_720771 ) ) ( not ( = ?auto_720766 ?auto_720772 ) ) ( not ( = ?auto_720766 ?auto_720773 ) ) ( not ( = ?auto_720766 ?auto_720774 ) ) ( not ( = ?auto_720767 ?auto_720768 ) ) ( not ( = ?auto_720767 ?auto_720769 ) ) ( not ( = ?auto_720767 ?auto_720770 ) ) ( not ( = ?auto_720767 ?auto_720771 ) ) ( not ( = ?auto_720767 ?auto_720772 ) ) ( not ( = ?auto_720767 ?auto_720773 ) ) ( not ( = ?auto_720767 ?auto_720774 ) ) ( not ( = ?auto_720768 ?auto_720769 ) ) ( not ( = ?auto_720768 ?auto_720770 ) ) ( not ( = ?auto_720768 ?auto_720771 ) ) ( not ( = ?auto_720768 ?auto_720772 ) ) ( not ( = ?auto_720768 ?auto_720773 ) ) ( not ( = ?auto_720768 ?auto_720774 ) ) ( not ( = ?auto_720769 ?auto_720770 ) ) ( not ( = ?auto_720769 ?auto_720771 ) ) ( not ( = ?auto_720769 ?auto_720772 ) ) ( not ( = ?auto_720769 ?auto_720773 ) ) ( not ( = ?auto_720769 ?auto_720774 ) ) ( not ( = ?auto_720770 ?auto_720771 ) ) ( not ( = ?auto_720770 ?auto_720772 ) ) ( not ( = ?auto_720770 ?auto_720773 ) ) ( not ( = ?auto_720770 ?auto_720774 ) ) ( not ( = ?auto_720771 ?auto_720772 ) ) ( not ( = ?auto_720771 ?auto_720773 ) ) ( not ( = ?auto_720771 ?auto_720774 ) ) ( not ( = ?auto_720772 ?auto_720773 ) ) ( not ( = ?auto_720772 ?auto_720774 ) ) ( not ( = ?auto_720773 ?auto_720774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_720773 ?auto_720774 )
      ( !STACK ?auto_720773 ?auto_720772 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_720818 - BLOCK
      ?auto_720819 - BLOCK
      ?auto_720820 - BLOCK
      ?auto_720821 - BLOCK
      ?auto_720822 - BLOCK
      ?auto_720823 - BLOCK
      ?auto_720824 - BLOCK
      ?auto_720825 - BLOCK
      ?auto_720826 - BLOCK
      ?auto_720827 - BLOCK
      ?auto_720828 - BLOCK
      ?auto_720829 - BLOCK
      ?auto_720830 - BLOCK
      ?auto_720831 - BLOCK
    )
    :vars
    (
      ?auto_720832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720831 ?auto_720832 ) ( ON-TABLE ?auto_720818 ) ( ON ?auto_720819 ?auto_720818 ) ( ON ?auto_720820 ?auto_720819 ) ( ON ?auto_720821 ?auto_720820 ) ( ON ?auto_720822 ?auto_720821 ) ( ON ?auto_720823 ?auto_720822 ) ( ON ?auto_720824 ?auto_720823 ) ( ON ?auto_720825 ?auto_720824 ) ( ON ?auto_720826 ?auto_720825 ) ( ON ?auto_720827 ?auto_720826 ) ( ON ?auto_720828 ?auto_720827 ) ( ON ?auto_720829 ?auto_720828 ) ( not ( = ?auto_720818 ?auto_720819 ) ) ( not ( = ?auto_720818 ?auto_720820 ) ) ( not ( = ?auto_720818 ?auto_720821 ) ) ( not ( = ?auto_720818 ?auto_720822 ) ) ( not ( = ?auto_720818 ?auto_720823 ) ) ( not ( = ?auto_720818 ?auto_720824 ) ) ( not ( = ?auto_720818 ?auto_720825 ) ) ( not ( = ?auto_720818 ?auto_720826 ) ) ( not ( = ?auto_720818 ?auto_720827 ) ) ( not ( = ?auto_720818 ?auto_720828 ) ) ( not ( = ?auto_720818 ?auto_720829 ) ) ( not ( = ?auto_720818 ?auto_720830 ) ) ( not ( = ?auto_720818 ?auto_720831 ) ) ( not ( = ?auto_720818 ?auto_720832 ) ) ( not ( = ?auto_720819 ?auto_720820 ) ) ( not ( = ?auto_720819 ?auto_720821 ) ) ( not ( = ?auto_720819 ?auto_720822 ) ) ( not ( = ?auto_720819 ?auto_720823 ) ) ( not ( = ?auto_720819 ?auto_720824 ) ) ( not ( = ?auto_720819 ?auto_720825 ) ) ( not ( = ?auto_720819 ?auto_720826 ) ) ( not ( = ?auto_720819 ?auto_720827 ) ) ( not ( = ?auto_720819 ?auto_720828 ) ) ( not ( = ?auto_720819 ?auto_720829 ) ) ( not ( = ?auto_720819 ?auto_720830 ) ) ( not ( = ?auto_720819 ?auto_720831 ) ) ( not ( = ?auto_720819 ?auto_720832 ) ) ( not ( = ?auto_720820 ?auto_720821 ) ) ( not ( = ?auto_720820 ?auto_720822 ) ) ( not ( = ?auto_720820 ?auto_720823 ) ) ( not ( = ?auto_720820 ?auto_720824 ) ) ( not ( = ?auto_720820 ?auto_720825 ) ) ( not ( = ?auto_720820 ?auto_720826 ) ) ( not ( = ?auto_720820 ?auto_720827 ) ) ( not ( = ?auto_720820 ?auto_720828 ) ) ( not ( = ?auto_720820 ?auto_720829 ) ) ( not ( = ?auto_720820 ?auto_720830 ) ) ( not ( = ?auto_720820 ?auto_720831 ) ) ( not ( = ?auto_720820 ?auto_720832 ) ) ( not ( = ?auto_720821 ?auto_720822 ) ) ( not ( = ?auto_720821 ?auto_720823 ) ) ( not ( = ?auto_720821 ?auto_720824 ) ) ( not ( = ?auto_720821 ?auto_720825 ) ) ( not ( = ?auto_720821 ?auto_720826 ) ) ( not ( = ?auto_720821 ?auto_720827 ) ) ( not ( = ?auto_720821 ?auto_720828 ) ) ( not ( = ?auto_720821 ?auto_720829 ) ) ( not ( = ?auto_720821 ?auto_720830 ) ) ( not ( = ?auto_720821 ?auto_720831 ) ) ( not ( = ?auto_720821 ?auto_720832 ) ) ( not ( = ?auto_720822 ?auto_720823 ) ) ( not ( = ?auto_720822 ?auto_720824 ) ) ( not ( = ?auto_720822 ?auto_720825 ) ) ( not ( = ?auto_720822 ?auto_720826 ) ) ( not ( = ?auto_720822 ?auto_720827 ) ) ( not ( = ?auto_720822 ?auto_720828 ) ) ( not ( = ?auto_720822 ?auto_720829 ) ) ( not ( = ?auto_720822 ?auto_720830 ) ) ( not ( = ?auto_720822 ?auto_720831 ) ) ( not ( = ?auto_720822 ?auto_720832 ) ) ( not ( = ?auto_720823 ?auto_720824 ) ) ( not ( = ?auto_720823 ?auto_720825 ) ) ( not ( = ?auto_720823 ?auto_720826 ) ) ( not ( = ?auto_720823 ?auto_720827 ) ) ( not ( = ?auto_720823 ?auto_720828 ) ) ( not ( = ?auto_720823 ?auto_720829 ) ) ( not ( = ?auto_720823 ?auto_720830 ) ) ( not ( = ?auto_720823 ?auto_720831 ) ) ( not ( = ?auto_720823 ?auto_720832 ) ) ( not ( = ?auto_720824 ?auto_720825 ) ) ( not ( = ?auto_720824 ?auto_720826 ) ) ( not ( = ?auto_720824 ?auto_720827 ) ) ( not ( = ?auto_720824 ?auto_720828 ) ) ( not ( = ?auto_720824 ?auto_720829 ) ) ( not ( = ?auto_720824 ?auto_720830 ) ) ( not ( = ?auto_720824 ?auto_720831 ) ) ( not ( = ?auto_720824 ?auto_720832 ) ) ( not ( = ?auto_720825 ?auto_720826 ) ) ( not ( = ?auto_720825 ?auto_720827 ) ) ( not ( = ?auto_720825 ?auto_720828 ) ) ( not ( = ?auto_720825 ?auto_720829 ) ) ( not ( = ?auto_720825 ?auto_720830 ) ) ( not ( = ?auto_720825 ?auto_720831 ) ) ( not ( = ?auto_720825 ?auto_720832 ) ) ( not ( = ?auto_720826 ?auto_720827 ) ) ( not ( = ?auto_720826 ?auto_720828 ) ) ( not ( = ?auto_720826 ?auto_720829 ) ) ( not ( = ?auto_720826 ?auto_720830 ) ) ( not ( = ?auto_720826 ?auto_720831 ) ) ( not ( = ?auto_720826 ?auto_720832 ) ) ( not ( = ?auto_720827 ?auto_720828 ) ) ( not ( = ?auto_720827 ?auto_720829 ) ) ( not ( = ?auto_720827 ?auto_720830 ) ) ( not ( = ?auto_720827 ?auto_720831 ) ) ( not ( = ?auto_720827 ?auto_720832 ) ) ( not ( = ?auto_720828 ?auto_720829 ) ) ( not ( = ?auto_720828 ?auto_720830 ) ) ( not ( = ?auto_720828 ?auto_720831 ) ) ( not ( = ?auto_720828 ?auto_720832 ) ) ( not ( = ?auto_720829 ?auto_720830 ) ) ( not ( = ?auto_720829 ?auto_720831 ) ) ( not ( = ?auto_720829 ?auto_720832 ) ) ( not ( = ?auto_720830 ?auto_720831 ) ) ( not ( = ?auto_720830 ?auto_720832 ) ) ( not ( = ?auto_720831 ?auto_720832 ) ) ( CLEAR ?auto_720829 ) ( ON ?auto_720830 ?auto_720831 ) ( CLEAR ?auto_720830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_720818 ?auto_720819 ?auto_720820 ?auto_720821 ?auto_720822 ?auto_720823 ?auto_720824 ?auto_720825 ?auto_720826 ?auto_720827 ?auto_720828 ?auto_720829 ?auto_720830 )
      ( MAKE-14PILE ?auto_720818 ?auto_720819 ?auto_720820 ?auto_720821 ?auto_720822 ?auto_720823 ?auto_720824 ?auto_720825 ?auto_720826 ?auto_720827 ?auto_720828 ?auto_720829 ?auto_720830 ?auto_720831 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_720876 - BLOCK
      ?auto_720877 - BLOCK
      ?auto_720878 - BLOCK
      ?auto_720879 - BLOCK
      ?auto_720880 - BLOCK
      ?auto_720881 - BLOCK
      ?auto_720882 - BLOCK
      ?auto_720883 - BLOCK
      ?auto_720884 - BLOCK
      ?auto_720885 - BLOCK
      ?auto_720886 - BLOCK
      ?auto_720887 - BLOCK
      ?auto_720888 - BLOCK
      ?auto_720889 - BLOCK
    )
    :vars
    (
      ?auto_720890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720889 ?auto_720890 ) ( ON-TABLE ?auto_720876 ) ( ON ?auto_720877 ?auto_720876 ) ( ON ?auto_720878 ?auto_720877 ) ( ON ?auto_720879 ?auto_720878 ) ( ON ?auto_720880 ?auto_720879 ) ( ON ?auto_720881 ?auto_720880 ) ( ON ?auto_720882 ?auto_720881 ) ( ON ?auto_720883 ?auto_720882 ) ( ON ?auto_720884 ?auto_720883 ) ( ON ?auto_720885 ?auto_720884 ) ( ON ?auto_720886 ?auto_720885 ) ( not ( = ?auto_720876 ?auto_720877 ) ) ( not ( = ?auto_720876 ?auto_720878 ) ) ( not ( = ?auto_720876 ?auto_720879 ) ) ( not ( = ?auto_720876 ?auto_720880 ) ) ( not ( = ?auto_720876 ?auto_720881 ) ) ( not ( = ?auto_720876 ?auto_720882 ) ) ( not ( = ?auto_720876 ?auto_720883 ) ) ( not ( = ?auto_720876 ?auto_720884 ) ) ( not ( = ?auto_720876 ?auto_720885 ) ) ( not ( = ?auto_720876 ?auto_720886 ) ) ( not ( = ?auto_720876 ?auto_720887 ) ) ( not ( = ?auto_720876 ?auto_720888 ) ) ( not ( = ?auto_720876 ?auto_720889 ) ) ( not ( = ?auto_720876 ?auto_720890 ) ) ( not ( = ?auto_720877 ?auto_720878 ) ) ( not ( = ?auto_720877 ?auto_720879 ) ) ( not ( = ?auto_720877 ?auto_720880 ) ) ( not ( = ?auto_720877 ?auto_720881 ) ) ( not ( = ?auto_720877 ?auto_720882 ) ) ( not ( = ?auto_720877 ?auto_720883 ) ) ( not ( = ?auto_720877 ?auto_720884 ) ) ( not ( = ?auto_720877 ?auto_720885 ) ) ( not ( = ?auto_720877 ?auto_720886 ) ) ( not ( = ?auto_720877 ?auto_720887 ) ) ( not ( = ?auto_720877 ?auto_720888 ) ) ( not ( = ?auto_720877 ?auto_720889 ) ) ( not ( = ?auto_720877 ?auto_720890 ) ) ( not ( = ?auto_720878 ?auto_720879 ) ) ( not ( = ?auto_720878 ?auto_720880 ) ) ( not ( = ?auto_720878 ?auto_720881 ) ) ( not ( = ?auto_720878 ?auto_720882 ) ) ( not ( = ?auto_720878 ?auto_720883 ) ) ( not ( = ?auto_720878 ?auto_720884 ) ) ( not ( = ?auto_720878 ?auto_720885 ) ) ( not ( = ?auto_720878 ?auto_720886 ) ) ( not ( = ?auto_720878 ?auto_720887 ) ) ( not ( = ?auto_720878 ?auto_720888 ) ) ( not ( = ?auto_720878 ?auto_720889 ) ) ( not ( = ?auto_720878 ?auto_720890 ) ) ( not ( = ?auto_720879 ?auto_720880 ) ) ( not ( = ?auto_720879 ?auto_720881 ) ) ( not ( = ?auto_720879 ?auto_720882 ) ) ( not ( = ?auto_720879 ?auto_720883 ) ) ( not ( = ?auto_720879 ?auto_720884 ) ) ( not ( = ?auto_720879 ?auto_720885 ) ) ( not ( = ?auto_720879 ?auto_720886 ) ) ( not ( = ?auto_720879 ?auto_720887 ) ) ( not ( = ?auto_720879 ?auto_720888 ) ) ( not ( = ?auto_720879 ?auto_720889 ) ) ( not ( = ?auto_720879 ?auto_720890 ) ) ( not ( = ?auto_720880 ?auto_720881 ) ) ( not ( = ?auto_720880 ?auto_720882 ) ) ( not ( = ?auto_720880 ?auto_720883 ) ) ( not ( = ?auto_720880 ?auto_720884 ) ) ( not ( = ?auto_720880 ?auto_720885 ) ) ( not ( = ?auto_720880 ?auto_720886 ) ) ( not ( = ?auto_720880 ?auto_720887 ) ) ( not ( = ?auto_720880 ?auto_720888 ) ) ( not ( = ?auto_720880 ?auto_720889 ) ) ( not ( = ?auto_720880 ?auto_720890 ) ) ( not ( = ?auto_720881 ?auto_720882 ) ) ( not ( = ?auto_720881 ?auto_720883 ) ) ( not ( = ?auto_720881 ?auto_720884 ) ) ( not ( = ?auto_720881 ?auto_720885 ) ) ( not ( = ?auto_720881 ?auto_720886 ) ) ( not ( = ?auto_720881 ?auto_720887 ) ) ( not ( = ?auto_720881 ?auto_720888 ) ) ( not ( = ?auto_720881 ?auto_720889 ) ) ( not ( = ?auto_720881 ?auto_720890 ) ) ( not ( = ?auto_720882 ?auto_720883 ) ) ( not ( = ?auto_720882 ?auto_720884 ) ) ( not ( = ?auto_720882 ?auto_720885 ) ) ( not ( = ?auto_720882 ?auto_720886 ) ) ( not ( = ?auto_720882 ?auto_720887 ) ) ( not ( = ?auto_720882 ?auto_720888 ) ) ( not ( = ?auto_720882 ?auto_720889 ) ) ( not ( = ?auto_720882 ?auto_720890 ) ) ( not ( = ?auto_720883 ?auto_720884 ) ) ( not ( = ?auto_720883 ?auto_720885 ) ) ( not ( = ?auto_720883 ?auto_720886 ) ) ( not ( = ?auto_720883 ?auto_720887 ) ) ( not ( = ?auto_720883 ?auto_720888 ) ) ( not ( = ?auto_720883 ?auto_720889 ) ) ( not ( = ?auto_720883 ?auto_720890 ) ) ( not ( = ?auto_720884 ?auto_720885 ) ) ( not ( = ?auto_720884 ?auto_720886 ) ) ( not ( = ?auto_720884 ?auto_720887 ) ) ( not ( = ?auto_720884 ?auto_720888 ) ) ( not ( = ?auto_720884 ?auto_720889 ) ) ( not ( = ?auto_720884 ?auto_720890 ) ) ( not ( = ?auto_720885 ?auto_720886 ) ) ( not ( = ?auto_720885 ?auto_720887 ) ) ( not ( = ?auto_720885 ?auto_720888 ) ) ( not ( = ?auto_720885 ?auto_720889 ) ) ( not ( = ?auto_720885 ?auto_720890 ) ) ( not ( = ?auto_720886 ?auto_720887 ) ) ( not ( = ?auto_720886 ?auto_720888 ) ) ( not ( = ?auto_720886 ?auto_720889 ) ) ( not ( = ?auto_720886 ?auto_720890 ) ) ( not ( = ?auto_720887 ?auto_720888 ) ) ( not ( = ?auto_720887 ?auto_720889 ) ) ( not ( = ?auto_720887 ?auto_720890 ) ) ( not ( = ?auto_720888 ?auto_720889 ) ) ( not ( = ?auto_720888 ?auto_720890 ) ) ( not ( = ?auto_720889 ?auto_720890 ) ) ( ON ?auto_720888 ?auto_720889 ) ( CLEAR ?auto_720886 ) ( ON ?auto_720887 ?auto_720888 ) ( CLEAR ?auto_720887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_720876 ?auto_720877 ?auto_720878 ?auto_720879 ?auto_720880 ?auto_720881 ?auto_720882 ?auto_720883 ?auto_720884 ?auto_720885 ?auto_720886 ?auto_720887 )
      ( MAKE-14PILE ?auto_720876 ?auto_720877 ?auto_720878 ?auto_720879 ?auto_720880 ?auto_720881 ?auto_720882 ?auto_720883 ?auto_720884 ?auto_720885 ?auto_720886 ?auto_720887 ?auto_720888 ?auto_720889 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_720934 - BLOCK
      ?auto_720935 - BLOCK
      ?auto_720936 - BLOCK
      ?auto_720937 - BLOCK
      ?auto_720938 - BLOCK
      ?auto_720939 - BLOCK
      ?auto_720940 - BLOCK
      ?auto_720941 - BLOCK
      ?auto_720942 - BLOCK
      ?auto_720943 - BLOCK
      ?auto_720944 - BLOCK
      ?auto_720945 - BLOCK
      ?auto_720946 - BLOCK
      ?auto_720947 - BLOCK
    )
    :vars
    (
      ?auto_720948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_720947 ?auto_720948 ) ( ON-TABLE ?auto_720934 ) ( ON ?auto_720935 ?auto_720934 ) ( ON ?auto_720936 ?auto_720935 ) ( ON ?auto_720937 ?auto_720936 ) ( ON ?auto_720938 ?auto_720937 ) ( ON ?auto_720939 ?auto_720938 ) ( ON ?auto_720940 ?auto_720939 ) ( ON ?auto_720941 ?auto_720940 ) ( ON ?auto_720942 ?auto_720941 ) ( ON ?auto_720943 ?auto_720942 ) ( not ( = ?auto_720934 ?auto_720935 ) ) ( not ( = ?auto_720934 ?auto_720936 ) ) ( not ( = ?auto_720934 ?auto_720937 ) ) ( not ( = ?auto_720934 ?auto_720938 ) ) ( not ( = ?auto_720934 ?auto_720939 ) ) ( not ( = ?auto_720934 ?auto_720940 ) ) ( not ( = ?auto_720934 ?auto_720941 ) ) ( not ( = ?auto_720934 ?auto_720942 ) ) ( not ( = ?auto_720934 ?auto_720943 ) ) ( not ( = ?auto_720934 ?auto_720944 ) ) ( not ( = ?auto_720934 ?auto_720945 ) ) ( not ( = ?auto_720934 ?auto_720946 ) ) ( not ( = ?auto_720934 ?auto_720947 ) ) ( not ( = ?auto_720934 ?auto_720948 ) ) ( not ( = ?auto_720935 ?auto_720936 ) ) ( not ( = ?auto_720935 ?auto_720937 ) ) ( not ( = ?auto_720935 ?auto_720938 ) ) ( not ( = ?auto_720935 ?auto_720939 ) ) ( not ( = ?auto_720935 ?auto_720940 ) ) ( not ( = ?auto_720935 ?auto_720941 ) ) ( not ( = ?auto_720935 ?auto_720942 ) ) ( not ( = ?auto_720935 ?auto_720943 ) ) ( not ( = ?auto_720935 ?auto_720944 ) ) ( not ( = ?auto_720935 ?auto_720945 ) ) ( not ( = ?auto_720935 ?auto_720946 ) ) ( not ( = ?auto_720935 ?auto_720947 ) ) ( not ( = ?auto_720935 ?auto_720948 ) ) ( not ( = ?auto_720936 ?auto_720937 ) ) ( not ( = ?auto_720936 ?auto_720938 ) ) ( not ( = ?auto_720936 ?auto_720939 ) ) ( not ( = ?auto_720936 ?auto_720940 ) ) ( not ( = ?auto_720936 ?auto_720941 ) ) ( not ( = ?auto_720936 ?auto_720942 ) ) ( not ( = ?auto_720936 ?auto_720943 ) ) ( not ( = ?auto_720936 ?auto_720944 ) ) ( not ( = ?auto_720936 ?auto_720945 ) ) ( not ( = ?auto_720936 ?auto_720946 ) ) ( not ( = ?auto_720936 ?auto_720947 ) ) ( not ( = ?auto_720936 ?auto_720948 ) ) ( not ( = ?auto_720937 ?auto_720938 ) ) ( not ( = ?auto_720937 ?auto_720939 ) ) ( not ( = ?auto_720937 ?auto_720940 ) ) ( not ( = ?auto_720937 ?auto_720941 ) ) ( not ( = ?auto_720937 ?auto_720942 ) ) ( not ( = ?auto_720937 ?auto_720943 ) ) ( not ( = ?auto_720937 ?auto_720944 ) ) ( not ( = ?auto_720937 ?auto_720945 ) ) ( not ( = ?auto_720937 ?auto_720946 ) ) ( not ( = ?auto_720937 ?auto_720947 ) ) ( not ( = ?auto_720937 ?auto_720948 ) ) ( not ( = ?auto_720938 ?auto_720939 ) ) ( not ( = ?auto_720938 ?auto_720940 ) ) ( not ( = ?auto_720938 ?auto_720941 ) ) ( not ( = ?auto_720938 ?auto_720942 ) ) ( not ( = ?auto_720938 ?auto_720943 ) ) ( not ( = ?auto_720938 ?auto_720944 ) ) ( not ( = ?auto_720938 ?auto_720945 ) ) ( not ( = ?auto_720938 ?auto_720946 ) ) ( not ( = ?auto_720938 ?auto_720947 ) ) ( not ( = ?auto_720938 ?auto_720948 ) ) ( not ( = ?auto_720939 ?auto_720940 ) ) ( not ( = ?auto_720939 ?auto_720941 ) ) ( not ( = ?auto_720939 ?auto_720942 ) ) ( not ( = ?auto_720939 ?auto_720943 ) ) ( not ( = ?auto_720939 ?auto_720944 ) ) ( not ( = ?auto_720939 ?auto_720945 ) ) ( not ( = ?auto_720939 ?auto_720946 ) ) ( not ( = ?auto_720939 ?auto_720947 ) ) ( not ( = ?auto_720939 ?auto_720948 ) ) ( not ( = ?auto_720940 ?auto_720941 ) ) ( not ( = ?auto_720940 ?auto_720942 ) ) ( not ( = ?auto_720940 ?auto_720943 ) ) ( not ( = ?auto_720940 ?auto_720944 ) ) ( not ( = ?auto_720940 ?auto_720945 ) ) ( not ( = ?auto_720940 ?auto_720946 ) ) ( not ( = ?auto_720940 ?auto_720947 ) ) ( not ( = ?auto_720940 ?auto_720948 ) ) ( not ( = ?auto_720941 ?auto_720942 ) ) ( not ( = ?auto_720941 ?auto_720943 ) ) ( not ( = ?auto_720941 ?auto_720944 ) ) ( not ( = ?auto_720941 ?auto_720945 ) ) ( not ( = ?auto_720941 ?auto_720946 ) ) ( not ( = ?auto_720941 ?auto_720947 ) ) ( not ( = ?auto_720941 ?auto_720948 ) ) ( not ( = ?auto_720942 ?auto_720943 ) ) ( not ( = ?auto_720942 ?auto_720944 ) ) ( not ( = ?auto_720942 ?auto_720945 ) ) ( not ( = ?auto_720942 ?auto_720946 ) ) ( not ( = ?auto_720942 ?auto_720947 ) ) ( not ( = ?auto_720942 ?auto_720948 ) ) ( not ( = ?auto_720943 ?auto_720944 ) ) ( not ( = ?auto_720943 ?auto_720945 ) ) ( not ( = ?auto_720943 ?auto_720946 ) ) ( not ( = ?auto_720943 ?auto_720947 ) ) ( not ( = ?auto_720943 ?auto_720948 ) ) ( not ( = ?auto_720944 ?auto_720945 ) ) ( not ( = ?auto_720944 ?auto_720946 ) ) ( not ( = ?auto_720944 ?auto_720947 ) ) ( not ( = ?auto_720944 ?auto_720948 ) ) ( not ( = ?auto_720945 ?auto_720946 ) ) ( not ( = ?auto_720945 ?auto_720947 ) ) ( not ( = ?auto_720945 ?auto_720948 ) ) ( not ( = ?auto_720946 ?auto_720947 ) ) ( not ( = ?auto_720946 ?auto_720948 ) ) ( not ( = ?auto_720947 ?auto_720948 ) ) ( ON ?auto_720946 ?auto_720947 ) ( ON ?auto_720945 ?auto_720946 ) ( CLEAR ?auto_720943 ) ( ON ?auto_720944 ?auto_720945 ) ( CLEAR ?auto_720944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_720934 ?auto_720935 ?auto_720936 ?auto_720937 ?auto_720938 ?auto_720939 ?auto_720940 ?auto_720941 ?auto_720942 ?auto_720943 ?auto_720944 )
      ( MAKE-14PILE ?auto_720934 ?auto_720935 ?auto_720936 ?auto_720937 ?auto_720938 ?auto_720939 ?auto_720940 ?auto_720941 ?auto_720942 ?auto_720943 ?auto_720944 ?auto_720945 ?auto_720946 ?auto_720947 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_720992 - BLOCK
      ?auto_720993 - BLOCK
      ?auto_720994 - BLOCK
      ?auto_720995 - BLOCK
      ?auto_720996 - BLOCK
      ?auto_720997 - BLOCK
      ?auto_720998 - BLOCK
      ?auto_720999 - BLOCK
      ?auto_721000 - BLOCK
      ?auto_721001 - BLOCK
      ?auto_721002 - BLOCK
      ?auto_721003 - BLOCK
      ?auto_721004 - BLOCK
      ?auto_721005 - BLOCK
    )
    :vars
    (
      ?auto_721006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721005 ?auto_721006 ) ( ON-TABLE ?auto_720992 ) ( ON ?auto_720993 ?auto_720992 ) ( ON ?auto_720994 ?auto_720993 ) ( ON ?auto_720995 ?auto_720994 ) ( ON ?auto_720996 ?auto_720995 ) ( ON ?auto_720997 ?auto_720996 ) ( ON ?auto_720998 ?auto_720997 ) ( ON ?auto_720999 ?auto_720998 ) ( ON ?auto_721000 ?auto_720999 ) ( not ( = ?auto_720992 ?auto_720993 ) ) ( not ( = ?auto_720992 ?auto_720994 ) ) ( not ( = ?auto_720992 ?auto_720995 ) ) ( not ( = ?auto_720992 ?auto_720996 ) ) ( not ( = ?auto_720992 ?auto_720997 ) ) ( not ( = ?auto_720992 ?auto_720998 ) ) ( not ( = ?auto_720992 ?auto_720999 ) ) ( not ( = ?auto_720992 ?auto_721000 ) ) ( not ( = ?auto_720992 ?auto_721001 ) ) ( not ( = ?auto_720992 ?auto_721002 ) ) ( not ( = ?auto_720992 ?auto_721003 ) ) ( not ( = ?auto_720992 ?auto_721004 ) ) ( not ( = ?auto_720992 ?auto_721005 ) ) ( not ( = ?auto_720992 ?auto_721006 ) ) ( not ( = ?auto_720993 ?auto_720994 ) ) ( not ( = ?auto_720993 ?auto_720995 ) ) ( not ( = ?auto_720993 ?auto_720996 ) ) ( not ( = ?auto_720993 ?auto_720997 ) ) ( not ( = ?auto_720993 ?auto_720998 ) ) ( not ( = ?auto_720993 ?auto_720999 ) ) ( not ( = ?auto_720993 ?auto_721000 ) ) ( not ( = ?auto_720993 ?auto_721001 ) ) ( not ( = ?auto_720993 ?auto_721002 ) ) ( not ( = ?auto_720993 ?auto_721003 ) ) ( not ( = ?auto_720993 ?auto_721004 ) ) ( not ( = ?auto_720993 ?auto_721005 ) ) ( not ( = ?auto_720993 ?auto_721006 ) ) ( not ( = ?auto_720994 ?auto_720995 ) ) ( not ( = ?auto_720994 ?auto_720996 ) ) ( not ( = ?auto_720994 ?auto_720997 ) ) ( not ( = ?auto_720994 ?auto_720998 ) ) ( not ( = ?auto_720994 ?auto_720999 ) ) ( not ( = ?auto_720994 ?auto_721000 ) ) ( not ( = ?auto_720994 ?auto_721001 ) ) ( not ( = ?auto_720994 ?auto_721002 ) ) ( not ( = ?auto_720994 ?auto_721003 ) ) ( not ( = ?auto_720994 ?auto_721004 ) ) ( not ( = ?auto_720994 ?auto_721005 ) ) ( not ( = ?auto_720994 ?auto_721006 ) ) ( not ( = ?auto_720995 ?auto_720996 ) ) ( not ( = ?auto_720995 ?auto_720997 ) ) ( not ( = ?auto_720995 ?auto_720998 ) ) ( not ( = ?auto_720995 ?auto_720999 ) ) ( not ( = ?auto_720995 ?auto_721000 ) ) ( not ( = ?auto_720995 ?auto_721001 ) ) ( not ( = ?auto_720995 ?auto_721002 ) ) ( not ( = ?auto_720995 ?auto_721003 ) ) ( not ( = ?auto_720995 ?auto_721004 ) ) ( not ( = ?auto_720995 ?auto_721005 ) ) ( not ( = ?auto_720995 ?auto_721006 ) ) ( not ( = ?auto_720996 ?auto_720997 ) ) ( not ( = ?auto_720996 ?auto_720998 ) ) ( not ( = ?auto_720996 ?auto_720999 ) ) ( not ( = ?auto_720996 ?auto_721000 ) ) ( not ( = ?auto_720996 ?auto_721001 ) ) ( not ( = ?auto_720996 ?auto_721002 ) ) ( not ( = ?auto_720996 ?auto_721003 ) ) ( not ( = ?auto_720996 ?auto_721004 ) ) ( not ( = ?auto_720996 ?auto_721005 ) ) ( not ( = ?auto_720996 ?auto_721006 ) ) ( not ( = ?auto_720997 ?auto_720998 ) ) ( not ( = ?auto_720997 ?auto_720999 ) ) ( not ( = ?auto_720997 ?auto_721000 ) ) ( not ( = ?auto_720997 ?auto_721001 ) ) ( not ( = ?auto_720997 ?auto_721002 ) ) ( not ( = ?auto_720997 ?auto_721003 ) ) ( not ( = ?auto_720997 ?auto_721004 ) ) ( not ( = ?auto_720997 ?auto_721005 ) ) ( not ( = ?auto_720997 ?auto_721006 ) ) ( not ( = ?auto_720998 ?auto_720999 ) ) ( not ( = ?auto_720998 ?auto_721000 ) ) ( not ( = ?auto_720998 ?auto_721001 ) ) ( not ( = ?auto_720998 ?auto_721002 ) ) ( not ( = ?auto_720998 ?auto_721003 ) ) ( not ( = ?auto_720998 ?auto_721004 ) ) ( not ( = ?auto_720998 ?auto_721005 ) ) ( not ( = ?auto_720998 ?auto_721006 ) ) ( not ( = ?auto_720999 ?auto_721000 ) ) ( not ( = ?auto_720999 ?auto_721001 ) ) ( not ( = ?auto_720999 ?auto_721002 ) ) ( not ( = ?auto_720999 ?auto_721003 ) ) ( not ( = ?auto_720999 ?auto_721004 ) ) ( not ( = ?auto_720999 ?auto_721005 ) ) ( not ( = ?auto_720999 ?auto_721006 ) ) ( not ( = ?auto_721000 ?auto_721001 ) ) ( not ( = ?auto_721000 ?auto_721002 ) ) ( not ( = ?auto_721000 ?auto_721003 ) ) ( not ( = ?auto_721000 ?auto_721004 ) ) ( not ( = ?auto_721000 ?auto_721005 ) ) ( not ( = ?auto_721000 ?auto_721006 ) ) ( not ( = ?auto_721001 ?auto_721002 ) ) ( not ( = ?auto_721001 ?auto_721003 ) ) ( not ( = ?auto_721001 ?auto_721004 ) ) ( not ( = ?auto_721001 ?auto_721005 ) ) ( not ( = ?auto_721001 ?auto_721006 ) ) ( not ( = ?auto_721002 ?auto_721003 ) ) ( not ( = ?auto_721002 ?auto_721004 ) ) ( not ( = ?auto_721002 ?auto_721005 ) ) ( not ( = ?auto_721002 ?auto_721006 ) ) ( not ( = ?auto_721003 ?auto_721004 ) ) ( not ( = ?auto_721003 ?auto_721005 ) ) ( not ( = ?auto_721003 ?auto_721006 ) ) ( not ( = ?auto_721004 ?auto_721005 ) ) ( not ( = ?auto_721004 ?auto_721006 ) ) ( not ( = ?auto_721005 ?auto_721006 ) ) ( ON ?auto_721004 ?auto_721005 ) ( ON ?auto_721003 ?auto_721004 ) ( ON ?auto_721002 ?auto_721003 ) ( CLEAR ?auto_721000 ) ( ON ?auto_721001 ?auto_721002 ) ( CLEAR ?auto_721001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_720992 ?auto_720993 ?auto_720994 ?auto_720995 ?auto_720996 ?auto_720997 ?auto_720998 ?auto_720999 ?auto_721000 ?auto_721001 )
      ( MAKE-14PILE ?auto_720992 ?auto_720993 ?auto_720994 ?auto_720995 ?auto_720996 ?auto_720997 ?auto_720998 ?auto_720999 ?auto_721000 ?auto_721001 ?auto_721002 ?auto_721003 ?auto_721004 ?auto_721005 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721050 - BLOCK
      ?auto_721051 - BLOCK
      ?auto_721052 - BLOCK
      ?auto_721053 - BLOCK
      ?auto_721054 - BLOCK
      ?auto_721055 - BLOCK
      ?auto_721056 - BLOCK
      ?auto_721057 - BLOCK
      ?auto_721058 - BLOCK
      ?auto_721059 - BLOCK
      ?auto_721060 - BLOCK
      ?auto_721061 - BLOCK
      ?auto_721062 - BLOCK
      ?auto_721063 - BLOCK
    )
    :vars
    (
      ?auto_721064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721063 ?auto_721064 ) ( ON-TABLE ?auto_721050 ) ( ON ?auto_721051 ?auto_721050 ) ( ON ?auto_721052 ?auto_721051 ) ( ON ?auto_721053 ?auto_721052 ) ( ON ?auto_721054 ?auto_721053 ) ( ON ?auto_721055 ?auto_721054 ) ( ON ?auto_721056 ?auto_721055 ) ( ON ?auto_721057 ?auto_721056 ) ( not ( = ?auto_721050 ?auto_721051 ) ) ( not ( = ?auto_721050 ?auto_721052 ) ) ( not ( = ?auto_721050 ?auto_721053 ) ) ( not ( = ?auto_721050 ?auto_721054 ) ) ( not ( = ?auto_721050 ?auto_721055 ) ) ( not ( = ?auto_721050 ?auto_721056 ) ) ( not ( = ?auto_721050 ?auto_721057 ) ) ( not ( = ?auto_721050 ?auto_721058 ) ) ( not ( = ?auto_721050 ?auto_721059 ) ) ( not ( = ?auto_721050 ?auto_721060 ) ) ( not ( = ?auto_721050 ?auto_721061 ) ) ( not ( = ?auto_721050 ?auto_721062 ) ) ( not ( = ?auto_721050 ?auto_721063 ) ) ( not ( = ?auto_721050 ?auto_721064 ) ) ( not ( = ?auto_721051 ?auto_721052 ) ) ( not ( = ?auto_721051 ?auto_721053 ) ) ( not ( = ?auto_721051 ?auto_721054 ) ) ( not ( = ?auto_721051 ?auto_721055 ) ) ( not ( = ?auto_721051 ?auto_721056 ) ) ( not ( = ?auto_721051 ?auto_721057 ) ) ( not ( = ?auto_721051 ?auto_721058 ) ) ( not ( = ?auto_721051 ?auto_721059 ) ) ( not ( = ?auto_721051 ?auto_721060 ) ) ( not ( = ?auto_721051 ?auto_721061 ) ) ( not ( = ?auto_721051 ?auto_721062 ) ) ( not ( = ?auto_721051 ?auto_721063 ) ) ( not ( = ?auto_721051 ?auto_721064 ) ) ( not ( = ?auto_721052 ?auto_721053 ) ) ( not ( = ?auto_721052 ?auto_721054 ) ) ( not ( = ?auto_721052 ?auto_721055 ) ) ( not ( = ?auto_721052 ?auto_721056 ) ) ( not ( = ?auto_721052 ?auto_721057 ) ) ( not ( = ?auto_721052 ?auto_721058 ) ) ( not ( = ?auto_721052 ?auto_721059 ) ) ( not ( = ?auto_721052 ?auto_721060 ) ) ( not ( = ?auto_721052 ?auto_721061 ) ) ( not ( = ?auto_721052 ?auto_721062 ) ) ( not ( = ?auto_721052 ?auto_721063 ) ) ( not ( = ?auto_721052 ?auto_721064 ) ) ( not ( = ?auto_721053 ?auto_721054 ) ) ( not ( = ?auto_721053 ?auto_721055 ) ) ( not ( = ?auto_721053 ?auto_721056 ) ) ( not ( = ?auto_721053 ?auto_721057 ) ) ( not ( = ?auto_721053 ?auto_721058 ) ) ( not ( = ?auto_721053 ?auto_721059 ) ) ( not ( = ?auto_721053 ?auto_721060 ) ) ( not ( = ?auto_721053 ?auto_721061 ) ) ( not ( = ?auto_721053 ?auto_721062 ) ) ( not ( = ?auto_721053 ?auto_721063 ) ) ( not ( = ?auto_721053 ?auto_721064 ) ) ( not ( = ?auto_721054 ?auto_721055 ) ) ( not ( = ?auto_721054 ?auto_721056 ) ) ( not ( = ?auto_721054 ?auto_721057 ) ) ( not ( = ?auto_721054 ?auto_721058 ) ) ( not ( = ?auto_721054 ?auto_721059 ) ) ( not ( = ?auto_721054 ?auto_721060 ) ) ( not ( = ?auto_721054 ?auto_721061 ) ) ( not ( = ?auto_721054 ?auto_721062 ) ) ( not ( = ?auto_721054 ?auto_721063 ) ) ( not ( = ?auto_721054 ?auto_721064 ) ) ( not ( = ?auto_721055 ?auto_721056 ) ) ( not ( = ?auto_721055 ?auto_721057 ) ) ( not ( = ?auto_721055 ?auto_721058 ) ) ( not ( = ?auto_721055 ?auto_721059 ) ) ( not ( = ?auto_721055 ?auto_721060 ) ) ( not ( = ?auto_721055 ?auto_721061 ) ) ( not ( = ?auto_721055 ?auto_721062 ) ) ( not ( = ?auto_721055 ?auto_721063 ) ) ( not ( = ?auto_721055 ?auto_721064 ) ) ( not ( = ?auto_721056 ?auto_721057 ) ) ( not ( = ?auto_721056 ?auto_721058 ) ) ( not ( = ?auto_721056 ?auto_721059 ) ) ( not ( = ?auto_721056 ?auto_721060 ) ) ( not ( = ?auto_721056 ?auto_721061 ) ) ( not ( = ?auto_721056 ?auto_721062 ) ) ( not ( = ?auto_721056 ?auto_721063 ) ) ( not ( = ?auto_721056 ?auto_721064 ) ) ( not ( = ?auto_721057 ?auto_721058 ) ) ( not ( = ?auto_721057 ?auto_721059 ) ) ( not ( = ?auto_721057 ?auto_721060 ) ) ( not ( = ?auto_721057 ?auto_721061 ) ) ( not ( = ?auto_721057 ?auto_721062 ) ) ( not ( = ?auto_721057 ?auto_721063 ) ) ( not ( = ?auto_721057 ?auto_721064 ) ) ( not ( = ?auto_721058 ?auto_721059 ) ) ( not ( = ?auto_721058 ?auto_721060 ) ) ( not ( = ?auto_721058 ?auto_721061 ) ) ( not ( = ?auto_721058 ?auto_721062 ) ) ( not ( = ?auto_721058 ?auto_721063 ) ) ( not ( = ?auto_721058 ?auto_721064 ) ) ( not ( = ?auto_721059 ?auto_721060 ) ) ( not ( = ?auto_721059 ?auto_721061 ) ) ( not ( = ?auto_721059 ?auto_721062 ) ) ( not ( = ?auto_721059 ?auto_721063 ) ) ( not ( = ?auto_721059 ?auto_721064 ) ) ( not ( = ?auto_721060 ?auto_721061 ) ) ( not ( = ?auto_721060 ?auto_721062 ) ) ( not ( = ?auto_721060 ?auto_721063 ) ) ( not ( = ?auto_721060 ?auto_721064 ) ) ( not ( = ?auto_721061 ?auto_721062 ) ) ( not ( = ?auto_721061 ?auto_721063 ) ) ( not ( = ?auto_721061 ?auto_721064 ) ) ( not ( = ?auto_721062 ?auto_721063 ) ) ( not ( = ?auto_721062 ?auto_721064 ) ) ( not ( = ?auto_721063 ?auto_721064 ) ) ( ON ?auto_721062 ?auto_721063 ) ( ON ?auto_721061 ?auto_721062 ) ( ON ?auto_721060 ?auto_721061 ) ( ON ?auto_721059 ?auto_721060 ) ( CLEAR ?auto_721057 ) ( ON ?auto_721058 ?auto_721059 ) ( CLEAR ?auto_721058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_721050 ?auto_721051 ?auto_721052 ?auto_721053 ?auto_721054 ?auto_721055 ?auto_721056 ?auto_721057 ?auto_721058 )
      ( MAKE-14PILE ?auto_721050 ?auto_721051 ?auto_721052 ?auto_721053 ?auto_721054 ?auto_721055 ?auto_721056 ?auto_721057 ?auto_721058 ?auto_721059 ?auto_721060 ?auto_721061 ?auto_721062 ?auto_721063 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721108 - BLOCK
      ?auto_721109 - BLOCK
      ?auto_721110 - BLOCK
      ?auto_721111 - BLOCK
      ?auto_721112 - BLOCK
      ?auto_721113 - BLOCK
      ?auto_721114 - BLOCK
      ?auto_721115 - BLOCK
      ?auto_721116 - BLOCK
      ?auto_721117 - BLOCK
      ?auto_721118 - BLOCK
      ?auto_721119 - BLOCK
      ?auto_721120 - BLOCK
      ?auto_721121 - BLOCK
    )
    :vars
    (
      ?auto_721122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721121 ?auto_721122 ) ( ON-TABLE ?auto_721108 ) ( ON ?auto_721109 ?auto_721108 ) ( ON ?auto_721110 ?auto_721109 ) ( ON ?auto_721111 ?auto_721110 ) ( ON ?auto_721112 ?auto_721111 ) ( ON ?auto_721113 ?auto_721112 ) ( ON ?auto_721114 ?auto_721113 ) ( not ( = ?auto_721108 ?auto_721109 ) ) ( not ( = ?auto_721108 ?auto_721110 ) ) ( not ( = ?auto_721108 ?auto_721111 ) ) ( not ( = ?auto_721108 ?auto_721112 ) ) ( not ( = ?auto_721108 ?auto_721113 ) ) ( not ( = ?auto_721108 ?auto_721114 ) ) ( not ( = ?auto_721108 ?auto_721115 ) ) ( not ( = ?auto_721108 ?auto_721116 ) ) ( not ( = ?auto_721108 ?auto_721117 ) ) ( not ( = ?auto_721108 ?auto_721118 ) ) ( not ( = ?auto_721108 ?auto_721119 ) ) ( not ( = ?auto_721108 ?auto_721120 ) ) ( not ( = ?auto_721108 ?auto_721121 ) ) ( not ( = ?auto_721108 ?auto_721122 ) ) ( not ( = ?auto_721109 ?auto_721110 ) ) ( not ( = ?auto_721109 ?auto_721111 ) ) ( not ( = ?auto_721109 ?auto_721112 ) ) ( not ( = ?auto_721109 ?auto_721113 ) ) ( not ( = ?auto_721109 ?auto_721114 ) ) ( not ( = ?auto_721109 ?auto_721115 ) ) ( not ( = ?auto_721109 ?auto_721116 ) ) ( not ( = ?auto_721109 ?auto_721117 ) ) ( not ( = ?auto_721109 ?auto_721118 ) ) ( not ( = ?auto_721109 ?auto_721119 ) ) ( not ( = ?auto_721109 ?auto_721120 ) ) ( not ( = ?auto_721109 ?auto_721121 ) ) ( not ( = ?auto_721109 ?auto_721122 ) ) ( not ( = ?auto_721110 ?auto_721111 ) ) ( not ( = ?auto_721110 ?auto_721112 ) ) ( not ( = ?auto_721110 ?auto_721113 ) ) ( not ( = ?auto_721110 ?auto_721114 ) ) ( not ( = ?auto_721110 ?auto_721115 ) ) ( not ( = ?auto_721110 ?auto_721116 ) ) ( not ( = ?auto_721110 ?auto_721117 ) ) ( not ( = ?auto_721110 ?auto_721118 ) ) ( not ( = ?auto_721110 ?auto_721119 ) ) ( not ( = ?auto_721110 ?auto_721120 ) ) ( not ( = ?auto_721110 ?auto_721121 ) ) ( not ( = ?auto_721110 ?auto_721122 ) ) ( not ( = ?auto_721111 ?auto_721112 ) ) ( not ( = ?auto_721111 ?auto_721113 ) ) ( not ( = ?auto_721111 ?auto_721114 ) ) ( not ( = ?auto_721111 ?auto_721115 ) ) ( not ( = ?auto_721111 ?auto_721116 ) ) ( not ( = ?auto_721111 ?auto_721117 ) ) ( not ( = ?auto_721111 ?auto_721118 ) ) ( not ( = ?auto_721111 ?auto_721119 ) ) ( not ( = ?auto_721111 ?auto_721120 ) ) ( not ( = ?auto_721111 ?auto_721121 ) ) ( not ( = ?auto_721111 ?auto_721122 ) ) ( not ( = ?auto_721112 ?auto_721113 ) ) ( not ( = ?auto_721112 ?auto_721114 ) ) ( not ( = ?auto_721112 ?auto_721115 ) ) ( not ( = ?auto_721112 ?auto_721116 ) ) ( not ( = ?auto_721112 ?auto_721117 ) ) ( not ( = ?auto_721112 ?auto_721118 ) ) ( not ( = ?auto_721112 ?auto_721119 ) ) ( not ( = ?auto_721112 ?auto_721120 ) ) ( not ( = ?auto_721112 ?auto_721121 ) ) ( not ( = ?auto_721112 ?auto_721122 ) ) ( not ( = ?auto_721113 ?auto_721114 ) ) ( not ( = ?auto_721113 ?auto_721115 ) ) ( not ( = ?auto_721113 ?auto_721116 ) ) ( not ( = ?auto_721113 ?auto_721117 ) ) ( not ( = ?auto_721113 ?auto_721118 ) ) ( not ( = ?auto_721113 ?auto_721119 ) ) ( not ( = ?auto_721113 ?auto_721120 ) ) ( not ( = ?auto_721113 ?auto_721121 ) ) ( not ( = ?auto_721113 ?auto_721122 ) ) ( not ( = ?auto_721114 ?auto_721115 ) ) ( not ( = ?auto_721114 ?auto_721116 ) ) ( not ( = ?auto_721114 ?auto_721117 ) ) ( not ( = ?auto_721114 ?auto_721118 ) ) ( not ( = ?auto_721114 ?auto_721119 ) ) ( not ( = ?auto_721114 ?auto_721120 ) ) ( not ( = ?auto_721114 ?auto_721121 ) ) ( not ( = ?auto_721114 ?auto_721122 ) ) ( not ( = ?auto_721115 ?auto_721116 ) ) ( not ( = ?auto_721115 ?auto_721117 ) ) ( not ( = ?auto_721115 ?auto_721118 ) ) ( not ( = ?auto_721115 ?auto_721119 ) ) ( not ( = ?auto_721115 ?auto_721120 ) ) ( not ( = ?auto_721115 ?auto_721121 ) ) ( not ( = ?auto_721115 ?auto_721122 ) ) ( not ( = ?auto_721116 ?auto_721117 ) ) ( not ( = ?auto_721116 ?auto_721118 ) ) ( not ( = ?auto_721116 ?auto_721119 ) ) ( not ( = ?auto_721116 ?auto_721120 ) ) ( not ( = ?auto_721116 ?auto_721121 ) ) ( not ( = ?auto_721116 ?auto_721122 ) ) ( not ( = ?auto_721117 ?auto_721118 ) ) ( not ( = ?auto_721117 ?auto_721119 ) ) ( not ( = ?auto_721117 ?auto_721120 ) ) ( not ( = ?auto_721117 ?auto_721121 ) ) ( not ( = ?auto_721117 ?auto_721122 ) ) ( not ( = ?auto_721118 ?auto_721119 ) ) ( not ( = ?auto_721118 ?auto_721120 ) ) ( not ( = ?auto_721118 ?auto_721121 ) ) ( not ( = ?auto_721118 ?auto_721122 ) ) ( not ( = ?auto_721119 ?auto_721120 ) ) ( not ( = ?auto_721119 ?auto_721121 ) ) ( not ( = ?auto_721119 ?auto_721122 ) ) ( not ( = ?auto_721120 ?auto_721121 ) ) ( not ( = ?auto_721120 ?auto_721122 ) ) ( not ( = ?auto_721121 ?auto_721122 ) ) ( ON ?auto_721120 ?auto_721121 ) ( ON ?auto_721119 ?auto_721120 ) ( ON ?auto_721118 ?auto_721119 ) ( ON ?auto_721117 ?auto_721118 ) ( ON ?auto_721116 ?auto_721117 ) ( CLEAR ?auto_721114 ) ( ON ?auto_721115 ?auto_721116 ) ( CLEAR ?auto_721115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_721108 ?auto_721109 ?auto_721110 ?auto_721111 ?auto_721112 ?auto_721113 ?auto_721114 ?auto_721115 )
      ( MAKE-14PILE ?auto_721108 ?auto_721109 ?auto_721110 ?auto_721111 ?auto_721112 ?auto_721113 ?auto_721114 ?auto_721115 ?auto_721116 ?auto_721117 ?auto_721118 ?auto_721119 ?auto_721120 ?auto_721121 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721166 - BLOCK
      ?auto_721167 - BLOCK
      ?auto_721168 - BLOCK
      ?auto_721169 - BLOCK
      ?auto_721170 - BLOCK
      ?auto_721171 - BLOCK
      ?auto_721172 - BLOCK
      ?auto_721173 - BLOCK
      ?auto_721174 - BLOCK
      ?auto_721175 - BLOCK
      ?auto_721176 - BLOCK
      ?auto_721177 - BLOCK
      ?auto_721178 - BLOCK
      ?auto_721179 - BLOCK
    )
    :vars
    (
      ?auto_721180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721179 ?auto_721180 ) ( ON-TABLE ?auto_721166 ) ( ON ?auto_721167 ?auto_721166 ) ( ON ?auto_721168 ?auto_721167 ) ( ON ?auto_721169 ?auto_721168 ) ( ON ?auto_721170 ?auto_721169 ) ( ON ?auto_721171 ?auto_721170 ) ( not ( = ?auto_721166 ?auto_721167 ) ) ( not ( = ?auto_721166 ?auto_721168 ) ) ( not ( = ?auto_721166 ?auto_721169 ) ) ( not ( = ?auto_721166 ?auto_721170 ) ) ( not ( = ?auto_721166 ?auto_721171 ) ) ( not ( = ?auto_721166 ?auto_721172 ) ) ( not ( = ?auto_721166 ?auto_721173 ) ) ( not ( = ?auto_721166 ?auto_721174 ) ) ( not ( = ?auto_721166 ?auto_721175 ) ) ( not ( = ?auto_721166 ?auto_721176 ) ) ( not ( = ?auto_721166 ?auto_721177 ) ) ( not ( = ?auto_721166 ?auto_721178 ) ) ( not ( = ?auto_721166 ?auto_721179 ) ) ( not ( = ?auto_721166 ?auto_721180 ) ) ( not ( = ?auto_721167 ?auto_721168 ) ) ( not ( = ?auto_721167 ?auto_721169 ) ) ( not ( = ?auto_721167 ?auto_721170 ) ) ( not ( = ?auto_721167 ?auto_721171 ) ) ( not ( = ?auto_721167 ?auto_721172 ) ) ( not ( = ?auto_721167 ?auto_721173 ) ) ( not ( = ?auto_721167 ?auto_721174 ) ) ( not ( = ?auto_721167 ?auto_721175 ) ) ( not ( = ?auto_721167 ?auto_721176 ) ) ( not ( = ?auto_721167 ?auto_721177 ) ) ( not ( = ?auto_721167 ?auto_721178 ) ) ( not ( = ?auto_721167 ?auto_721179 ) ) ( not ( = ?auto_721167 ?auto_721180 ) ) ( not ( = ?auto_721168 ?auto_721169 ) ) ( not ( = ?auto_721168 ?auto_721170 ) ) ( not ( = ?auto_721168 ?auto_721171 ) ) ( not ( = ?auto_721168 ?auto_721172 ) ) ( not ( = ?auto_721168 ?auto_721173 ) ) ( not ( = ?auto_721168 ?auto_721174 ) ) ( not ( = ?auto_721168 ?auto_721175 ) ) ( not ( = ?auto_721168 ?auto_721176 ) ) ( not ( = ?auto_721168 ?auto_721177 ) ) ( not ( = ?auto_721168 ?auto_721178 ) ) ( not ( = ?auto_721168 ?auto_721179 ) ) ( not ( = ?auto_721168 ?auto_721180 ) ) ( not ( = ?auto_721169 ?auto_721170 ) ) ( not ( = ?auto_721169 ?auto_721171 ) ) ( not ( = ?auto_721169 ?auto_721172 ) ) ( not ( = ?auto_721169 ?auto_721173 ) ) ( not ( = ?auto_721169 ?auto_721174 ) ) ( not ( = ?auto_721169 ?auto_721175 ) ) ( not ( = ?auto_721169 ?auto_721176 ) ) ( not ( = ?auto_721169 ?auto_721177 ) ) ( not ( = ?auto_721169 ?auto_721178 ) ) ( not ( = ?auto_721169 ?auto_721179 ) ) ( not ( = ?auto_721169 ?auto_721180 ) ) ( not ( = ?auto_721170 ?auto_721171 ) ) ( not ( = ?auto_721170 ?auto_721172 ) ) ( not ( = ?auto_721170 ?auto_721173 ) ) ( not ( = ?auto_721170 ?auto_721174 ) ) ( not ( = ?auto_721170 ?auto_721175 ) ) ( not ( = ?auto_721170 ?auto_721176 ) ) ( not ( = ?auto_721170 ?auto_721177 ) ) ( not ( = ?auto_721170 ?auto_721178 ) ) ( not ( = ?auto_721170 ?auto_721179 ) ) ( not ( = ?auto_721170 ?auto_721180 ) ) ( not ( = ?auto_721171 ?auto_721172 ) ) ( not ( = ?auto_721171 ?auto_721173 ) ) ( not ( = ?auto_721171 ?auto_721174 ) ) ( not ( = ?auto_721171 ?auto_721175 ) ) ( not ( = ?auto_721171 ?auto_721176 ) ) ( not ( = ?auto_721171 ?auto_721177 ) ) ( not ( = ?auto_721171 ?auto_721178 ) ) ( not ( = ?auto_721171 ?auto_721179 ) ) ( not ( = ?auto_721171 ?auto_721180 ) ) ( not ( = ?auto_721172 ?auto_721173 ) ) ( not ( = ?auto_721172 ?auto_721174 ) ) ( not ( = ?auto_721172 ?auto_721175 ) ) ( not ( = ?auto_721172 ?auto_721176 ) ) ( not ( = ?auto_721172 ?auto_721177 ) ) ( not ( = ?auto_721172 ?auto_721178 ) ) ( not ( = ?auto_721172 ?auto_721179 ) ) ( not ( = ?auto_721172 ?auto_721180 ) ) ( not ( = ?auto_721173 ?auto_721174 ) ) ( not ( = ?auto_721173 ?auto_721175 ) ) ( not ( = ?auto_721173 ?auto_721176 ) ) ( not ( = ?auto_721173 ?auto_721177 ) ) ( not ( = ?auto_721173 ?auto_721178 ) ) ( not ( = ?auto_721173 ?auto_721179 ) ) ( not ( = ?auto_721173 ?auto_721180 ) ) ( not ( = ?auto_721174 ?auto_721175 ) ) ( not ( = ?auto_721174 ?auto_721176 ) ) ( not ( = ?auto_721174 ?auto_721177 ) ) ( not ( = ?auto_721174 ?auto_721178 ) ) ( not ( = ?auto_721174 ?auto_721179 ) ) ( not ( = ?auto_721174 ?auto_721180 ) ) ( not ( = ?auto_721175 ?auto_721176 ) ) ( not ( = ?auto_721175 ?auto_721177 ) ) ( not ( = ?auto_721175 ?auto_721178 ) ) ( not ( = ?auto_721175 ?auto_721179 ) ) ( not ( = ?auto_721175 ?auto_721180 ) ) ( not ( = ?auto_721176 ?auto_721177 ) ) ( not ( = ?auto_721176 ?auto_721178 ) ) ( not ( = ?auto_721176 ?auto_721179 ) ) ( not ( = ?auto_721176 ?auto_721180 ) ) ( not ( = ?auto_721177 ?auto_721178 ) ) ( not ( = ?auto_721177 ?auto_721179 ) ) ( not ( = ?auto_721177 ?auto_721180 ) ) ( not ( = ?auto_721178 ?auto_721179 ) ) ( not ( = ?auto_721178 ?auto_721180 ) ) ( not ( = ?auto_721179 ?auto_721180 ) ) ( ON ?auto_721178 ?auto_721179 ) ( ON ?auto_721177 ?auto_721178 ) ( ON ?auto_721176 ?auto_721177 ) ( ON ?auto_721175 ?auto_721176 ) ( ON ?auto_721174 ?auto_721175 ) ( ON ?auto_721173 ?auto_721174 ) ( CLEAR ?auto_721171 ) ( ON ?auto_721172 ?auto_721173 ) ( CLEAR ?auto_721172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_721166 ?auto_721167 ?auto_721168 ?auto_721169 ?auto_721170 ?auto_721171 ?auto_721172 )
      ( MAKE-14PILE ?auto_721166 ?auto_721167 ?auto_721168 ?auto_721169 ?auto_721170 ?auto_721171 ?auto_721172 ?auto_721173 ?auto_721174 ?auto_721175 ?auto_721176 ?auto_721177 ?auto_721178 ?auto_721179 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721224 - BLOCK
      ?auto_721225 - BLOCK
      ?auto_721226 - BLOCK
      ?auto_721227 - BLOCK
      ?auto_721228 - BLOCK
      ?auto_721229 - BLOCK
      ?auto_721230 - BLOCK
      ?auto_721231 - BLOCK
      ?auto_721232 - BLOCK
      ?auto_721233 - BLOCK
      ?auto_721234 - BLOCK
      ?auto_721235 - BLOCK
      ?auto_721236 - BLOCK
      ?auto_721237 - BLOCK
    )
    :vars
    (
      ?auto_721238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721237 ?auto_721238 ) ( ON-TABLE ?auto_721224 ) ( ON ?auto_721225 ?auto_721224 ) ( ON ?auto_721226 ?auto_721225 ) ( ON ?auto_721227 ?auto_721226 ) ( ON ?auto_721228 ?auto_721227 ) ( not ( = ?auto_721224 ?auto_721225 ) ) ( not ( = ?auto_721224 ?auto_721226 ) ) ( not ( = ?auto_721224 ?auto_721227 ) ) ( not ( = ?auto_721224 ?auto_721228 ) ) ( not ( = ?auto_721224 ?auto_721229 ) ) ( not ( = ?auto_721224 ?auto_721230 ) ) ( not ( = ?auto_721224 ?auto_721231 ) ) ( not ( = ?auto_721224 ?auto_721232 ) ) ( not ( = ?auto_721224 ?auto_721233 ) ) ( not ( = ?auto_721224 ?auto_721234 ) ) ( not ( = ?auto_721224 ?auto_721235 ) ) ( not ( = ?auto_721224 ?auto_721236 ) ) ( not ( = ?auto_721224 ?auto_721237 ) ) ( not ( = ?auto_721224 ?auto_721238 ) ) ( not ( = ?auto_721225 ?auto_721226 ) ) ( not ( = ?auto_721225 ?auto_721227 ) ) ( not ( = ?auto_721225 ?auto_721228 ) ) ( not ( = ?auto_721225 ?auto_721229 ) ) ( not ( = ?auto_721225 ?auto_721230 ) ) ( not ( = ?auto_721225 ?auto_721231 ) ) ( not ( = ?auto_721225 ?auto_721232 ) ) ( not ( = ?auto_721225 ?auto_721233 ) ) ( not ( = ?auto_721225 ?auto_721234 ) ) ( not ( = ?auto_721225 ?auto_721235 ) ) ( not ( = ?auto_721225 ?auto_721236 ) ) ( not ( = ?auto_721225 ?auto_721237 ) ) ( not ( = ?auto_721225 ?auto_721238 ) ) ( not ( = ?auto_721226 ?auto_721227 ) ) ( not ( = ?auto_721226 ?auto_721228 ) ) ( not ( = ?auto_721226 ?auto_721229 ) ) ( not ( = ?auto_721226 ?auto_721230 ) ) ( not ( = ?auto_721226 ?auto_721231 ) ) ( not ( = ?auto_721226 ?auto_721232 ) ) ( not ( = ?auto_721226 ?auto_721233 ) ) ( not ( = ?auto_721226 ?auto_721234 ) ) ( not ( = ?auto_721226 ?auto_721235 ) ) ( not ( = ?auto_721226 ?auto_721236 ) ) ( not ( = ?auto_721226 ?auto_721237 ) ) ( not ( = ?auto_721226 ?auto_721238 ) ) ( not ( = ?auto_721227 ?auto_721228 ) ) ( not ( = ?auto_721227 ?auto_721229 ) ) ( not ( = ?auto_721227 ?auto_721230 ) ) ( not ( = ?auto_721227 ?auto_721231 ) ) ( not ( = ?auto_721227 ?auto_721232 ) ) ( not ( = ?auto_721227 ?auto_721233 ) ) ( not ( = ?auto_721227 ?auto_721234 ) ) ( not ( = ?auto_721227 ?auto_721235 ) ) ( not ( = ?auto_721227 ?auto_721236 ) ) ( not ( = ?auto_721227 ?auto_721237 ) ) ( not ( = ?auto_721227 ?auto_721238 ) ) ( not ( = ?auto_721228 ?auto_721229 ) ) ( not ( = ?auto_721228 ?auto_721230 ) ) ( not ( = ?auto_721228 ?auto_721231 ) ) ( not ( = ?auto_721228 ?auto_721232 ) ) ( not ( = ?auto_721228 ?auto_721233 ) ) ( not ( = ?auto_721228 ?auto_721234 ) ) ( not ( = ?auto_721228 ?auto_721235 ) ) ( not ( = ?auto_721228 ?auto_721236 ) ) ( not ( = ?auto_721228 ?auto_721237 ) ) ( not ( = ?auto_721228 ?auto_721238 ) ) ( not ( = ?auto_721229 ?auto_721230 ) ) ( not ( = ?auto_721229 ?auto_721231 ) ) ( not ( = ?auto_721229 ?auto_721232 ) ) ( not ( = ?auto_721229 ?auto_721233 ) ) ( not ( = ?auto_721229 ?auto_721234 ) ) ( not ( = ?auto_721229 ?auto_721235 ) ) ( not ( = ?auto_721229 ?auto_721236 ) ) ( not ( = ?auto_721229 ?auto_721237 ) ) ( not ( = ?auto_721229 ?auto_721238 ) ) ( not ( = ?auto_721230 ?auto_721231 ) ) ( not ( = ?auto_721230 ?auto_721232 ) ) ( not ( = ?auto_721230 ?auto_721233 ) ) ( not ( = ?auto_721230 ?auto_721234 ) ) ( not ( = ?auto_721230 ?auto_721235 ) ) ( not ( = ?auto_721230 ?auto_721236 ) ) ( not ( = ?auto_721230 ?auto_721237 ) ) ( not ( = ?auto_721230 ?auto_721238 ) ) ( not ( = ?auto_721231 ?auto_721232 ) ) ( not ( = ?auto_721231 ?auto_721233 ) ) ( not ( = ?auto_721231 ?auto_721234 ) ) ( not ( = ?auto_721231 ?auto_721235 ) ) ( not ( = ?auto_721231 ?auto_721236 ) ) ( not ( = ?auto_721231 ?auto_721237 ) ) ( not ( = ?auto_721231 ?auto_721238 ) ) ( not ( = ?auto_721232 ?auto_721233 ) ) ( not ( = ?auto_721232 ?auto_721234 ) ) ( not ( = ?auto_721232 ?auto_721235 ) ) ( not ( = ?auto_721232 ?auto_721236 ) ) ( not ( = ?auto_721232 ?auto_721237 ) ) ( not ( = ?auto_721232 ?auto_721238 ) ) ( not ( = ?auto_721233 ?auto_721234 ) ) ( not ( = ?auto_721233 ?auto_721235 ) ) ( not ( = ?auto_721233 ?auto_721236 ) ) ( not ( = ?auto_721233 ?auto_721237 ) ) ( not ( = ?auto_721233 ?auto_721238 ) ) ( not ( = ?auto_721234 ?auto_721235 ) ) ( not ( = ?auto_721234 ?auto_721236 ) ) ( not ( = ?auto_721234 ?auto_721237 ) ) ( not ( = ?auto_721234 ?auto_721238 ) ) ( not ( = ?auto_721235 ?auto_721236 ) ) ( not ( = ?auto_721235 ?auto_721237 ) ) ( not ( = ?auto_721235 ?auto_721238 ) ) ( not ( = ?auto_721236 ?auto_721237 ) ) ( not ( = ?auto_721236 ?auto_721238 ) ) ( not ( = ?auto_721237 ?auto_721238 ) ) ( ON ?auto_721236 ?auto_721237 ) ( ON ?auto_721235 ?auto_721236 ) ( ON ?auto_721234 ?auto_721235 ) ( ON ?auto_721233 ?auto_721234 ) ( ON ?auto_721232 ?auto_721233 ) ( ON ?auto_721231 ?auto_721232 ) ( ON ?auto_721230 ?auto_721231 ) ( CLEAR ?auto_721228 ) ( ON ?auto_721229 ?auto_721230 ) ( CLEAR ?auto_721229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_721224 ?auto_721225 ?auto_721226 ?auto_721227 ?auto_721228 ?auto_721229 )
      ( MAKE-14PILE ?auto_721224 ?auto_721225 ?auto_721226 ?auto_721227 ?auto_721228 ?auto_721229 ?auto_721230 ?auto_721231 ?auto_721232 ?auto_721233 ?auto_721234 ?auto_721235 ?auto_721236 ?auto_721237 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721282 - BLOCK
      ?auto_721283 - BLOCK
      ?auto_721284 - BLOCK
      ?auto_721285 - BLOCK
      ?auto_721286 - BLOCK
      ?auto_721287 - BLOCK
      ?auto_721288 - BLOCK
      ?auto_721289 - BLOCK
      ?auto_721290 - BLOCK
      ?auto_721291 - BLOCK
      ?auto_721292 - BLOCK
      ?auto_721293 - BLOCK
      ?auto_721294 - BLOCK
      ?auto_721295 - BLOCK
    )
    :vars
    (
      ?auto_721296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721295 ?auto_721296 ) ( ON-TABLE ?auto_721282 ) ( ON ?auto_721283 ?auto_721282 ) ( ON ?auto_721284 ?auto_721283 ) ( ON ?auto_721285 ?auto_721284 ) ( not ( = ?auto_721282 ?auto_721283 ) ) ( not ( = ?auto_721282 ?auto_721284 ) ) ( not ( = ?auto_721282 ?auto_721285 ) ) ( not ( = ?auto_721282 ?auto_721286 ) ) ( not ( = ?auto_721282 ?auto_721287 ) ) ( not ( = ?auto_721282 ?auto_721288 ) ) ( not ( = ?auto_721282 ?auto_721289 ) ) ( not ( = ?auto_721282 ?auto_721290 ) ) ( not ( = ?auto_721282 ?auto_721291 ) ) ( not ( = ?auto_721282 ?auto_721292 ) ) ( not ( = ?auto_721282 ?auto_721293 ) ) ( not ( = ?auto_721282 ?auto_721294 ) ) ( not ( = ?auto_721282 ?auto_721295 ) ) ( not ( = ?auto_721282 ?auto_721296 ) ) ( not ( = ?auto_721283 ?auto_721284 ) ) ( not ( = ?auto_721283 ?auto_721285 ) ) ( not ( = ?auto_721283 ?auto_721286 ) ) ( not ( = ?auto_721283 ?auto_721287 ) ) ( not ( = ?auto_721283 ?auto_721288 ) ) ( not ( = ?auto_721283 ?auto_721289 ) ) ( not ( = ?auto_721283 ?auto_721290 ) ) ( not ( = ?auto_721283 ?auto_721291 ) ) ( not ( = ?auto_721283 ?auto_721292 ) ) ( not ( = ?auto_721283 ?auto_721293 ) ) ( not ( = ?auto_721283 ?auto_721294 ) ) ( not ( = ?auto_721283 ?auto_721295 ) ) ( not ( = ?auto_721283 ?auto_721296 ) ) ( not ( = ?auto_721284 ?auto_721285 ) ) ( not ( = ?auto_721284 ?auto_721286 ) ) ( not ( = ?auto_721284 ?auto_721287 ) ) ( not ( = ?auto_721284 ?auto_721288 ) ) ( not ( = ?auto_721284 ?auto_721289 ) ) ( not ( = ?auto_721284 ?auto_721290 ) ) ( not ( = ?auto_721284 ?auto_721291 ) ) ( not ( = ?auto_721284 ?auto_721292 ) ) ( not ( = ?auto_721284 ?auto_721293 ) ) ( not ( = ?auto_721284 ?auto_721294 ) ) ( not ( = ?auto_721284 ?auto_721295 ) ) ( not ( = ?auto_721284 ?auto_721296 ) ) ( not ( = ?auto_721285 ?auto_721286 ) ) ( not ( = ?auto_721285 ?auto_721287 ) ) ( not ( = ?auto_721285 ?auto_721288 ) ) ( not ( = ?auto_721285 ?auto_721289 ) ) ( not ( = ?auto_721285 ?auto_721290 ) ) ( not ( = ?auto_721285 ?auto_721291 ) ) ( not ( = ?auto_721285 ?auto_721292 ) ) ( not ( = ?auto_721285 ?auto_721293 ) ) ( not ( = ?auto_721285 ?auto_721294 ) ) ( not ( = ?auto_721285 ?auto_721295 ) ) ( not ( = ?auto_721285 ?auto_721296 ) ) ( not ( = ?auto_721286 ?auto_721287 ) ) ( not ( = ?auto_721286 ?auto_721288 ) ) ( not ( = ?auto_721286 ?auto_721289 ) ) ( not ( = ?auto_721286 ?auto_721290 ) ) ( not ( = ?auto_721286 ?auto_721291 ) ) ( not ( = ?auto_721286 ?auto_721292 ) ) ( not ( = ?auto_721286 ?auto_721293 ) ) ( not ( = ?auto_721286 ?auto_721294 ) ) ( not ( = ?auto_721286 ?auto_721295 ) ) ( not ( = ?auto_721286 ?auto_721296 ) ) ( not ( = ?auto_721287 ?auto_721288 ) ) ( not ( = ?auto_721287 ?auto_721289 ) ) ( not ( = ?auto_721287 ?auto_721290 ) ) ( not ( = ?auto_721287 ?auto_721291 ) ) ( not ( = ?auto_721287 ?auto_721292 ) ) ( not ( = ?auto_721287 ?auto_721293 ) ) ( not ( = ?auto_721287 ?auto_721294 ) ) ( not ( = ?auto_721287 ?auto_721295 ) ) ( not ( = ?auto_721287 ?auto_721296 ) ) ( not ( = ?auto_721288 ?auto_721289 ) ) ( not ( = ?auto_721288 ?auto_721290 ) ) ( not ( = ?auto_721288 ?auto_721291 ) ) ( not ( = ?auto_721288 ?auto_721292 ) ) ( not ( = ?auto_721288 ?auto_721293 ) ) ( not ( = ?auto_721288 ?auto_721294 ) ) ( not ( = ?auto_721288 ?auto_721295 ) ) ( not ( = ?auto_721288 ?auto_721296 ) ) ( not ( = ?auto_721289 ?auto_721290 ) ) ( not ( = ?auto_721289 ?auto_721291 ) ) ( not ( = ?auto_721289 ?auto_721292 ) ) ( not ( = ?auto_721289 ?auto_721293 ) ) ( not ( = ?auto_721289 ?auto_721294 ) ) ( not ( = ?auto_721289 ?auto_721295 ) ) ( not ( = ?auto_721289 ?auto_721296 ) ) ( not ( = ?auto_721290 ?auto_721291 ) ) ( not ( = ?auto_721290 ?auto_721292 ) ) ( not ( = ?auto_721290 ?auto_721293 ) ) ( not ( = ?auto_721290 ?auto_721294 ) ) ( not ( = ?auto_721290 ?auto_721295 ) ) ( not ( = ?auto_721290 ?auto_721296 ) ) ( not ( = ?auto_721291 ?auto_721292 ) ) ( not ( = ?auto_721291 ?auto_721293 ) ) ( not ( = ?auto_721291 ?auto_721294 ) ) ( not ( = ?auto_721291 ?auto_721295 ) ) ( not ( = ?auto_721291 ?auto_721296 ) ) ( not ( = ?auto_721292 ?auto_721293 ) ) ( not ( = ?auto_721292 ?auto_721294 ) ) ( not ( = ?auto_721292 ?auto_721295 ) ) ( not ( = ?auto_721292 ?auto_721296 ) ) ( not ( = ?auto_721293 ?auto_721294 ) ) ( not ( = ?auto_721293 ?auto_721295 ) ) ( not ( = ?auto_721293 ?auto_721296 ) ) ( not ( = ?auto_721294 ?auto_721295 ) ) ( not ( = ?auto_721294 ?auto_721296 ) ) ( not ( = ?auto_721295 ?auto_721296 ) ) ( ON ?auto_721294 ?auto_721295 ) ( ON ?auto_721293 ?auto_721294 ) ( ON ?auto_721292 ?auto_721293 ) ( ON ?auto_721291 ?auto_721292 ) ( ON ?auto_721290 ?auto_721291 ) ( ON ?auto_721289 ?auto_721290 ) ( ON ?auto_721288 ?auto_721289 ) ( ON ?auto_721287 ?auto_721288 ) ( CLEAR ?auto_721285 ) ( ON ?auto_721286 ?auto_721287 ) ( CLEAR ?auto_721286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_721282 ?auto_721283 ?auto_721284 ?auto_721285 ?auto_721286 )
      ( MAKE-14PILE ?auto_721282 ?auto_721283 ?auto_721284 ?auto_721285 ?auto_721286 ?auto_721287 ?auto_721288 ?auto_721289 ?auto_721290 ?auto_721291 ?auto_721292 ?auto_721293 ?auto_721294 ?auto_721295 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721340 - BLOCK
      ?auto_721341 - BLOCK
      ?auto_721342 - BLOCK
      ?auto_721343 - BLOCK
      ?auto_721344 - BLOCK
      ?auto_721345 - BLOCK
      ?auto_721346 - BLOCK
      ?auto_721347 - BLOCK
      ?auto_721348 - BLOCK
      ?auto_721349 - BLOCK
      ?auto_721350 - BLOCK
      ?auto_721351 - BLOCK
      ?auto_721352 - BLOCK
      ?auto_721353 - BLOCK
    )
    :vars
    (
      ?auto_721354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721353 ?auto_721354 ) ( ON-TABLE ?auto_721340 ) ( ON ?auto_721341 ?auto_721340 ) ( ON ?auto_721342 ?auto_721341 ) ( not ( = ?auto_721340 ?auto_721341 ) ) ( not ( = ?auto_721340 ?auto_721342 ) ) ( not ( = ?auto_721340 ?auto_721343 ) ) ( not ( = ?auto_721340 ?auto_721344 ) ) ( not ( = ?auto_721340 ?auto_721345 ) ) ( not ( = ?auto_721340 ?auto_721346 ) ) ( not ( = ?auto_721340 ?auto_721347 ) ) ( not ( = ?auto_721340 ?auto_721348 ) ) ( not ( = ?auto_721340 ?auto_721349 ) ) ( not ( = ?auto_721340 ?auto_721350 ) ) ( not ( = ?auto_721340 ?auto_721351 ) ) ( not ( = ?auto_721340 ?auto_721352 ) ) ( not ( = ?auto_721340 ?auto_721353 ) ) ( not ( = ?auto_721340 ?auto_721354 ) ) ( not ( = ?auto_721341 ?auto_721342 ) ) ( not ( = ?auto_721341 ?auto_721343 ) ) ( not ( = ?auto_721341 ?auto_721344 ) ) ( not ( = ?auto_721341 ?auto_721345 ) ) ( not ( = ?auto_721341 ?auto_721346 ) ) ( not ( = ?auto_721341 ?auto_721347 ) ) ( not ( = ?auto_721341 ?auto_721348 ) ) ( not ( = ?auto_721341 ?auto_721349 ) ) ( not ( = ?auto_721341 ?auto_721350 ) ) ( not ( = ?auto_721341 ?auto_721351 ) ) ( not ( = ?auto_721341 ?auto_721352 ) ) ( not ( = ?auto_721341 ?auto_721353 ) ) ( not ( = ?auto_721341 ?auto_721354 ) ) ( not ( = ?auto_721342 ?auto_721343 ) ) ( not ( = ?auto_721342 ?auto_721344 ) ) ( not ( = ?auto_721342 ?auto_721345 ) ) ( not ( = ?auto_721342 ?auto_721346 ) ) ( not ( = ?auto_721342 ?auto_721347 ) ) ( not ( = ?auto_721342 ?auto_721348 ) ) ( not ( = ?auto_721342 ?auto_721349 ) ) ( not ( = ?auto_721342 ?auto_721350 ) ) ( not ( = ?auto_721342 ?auto_721351 ) ) ( not ( = ?auto_721342 ?auto_721352 ) ) ( not ( = ?auto_721342 ?auto_721353 ) ) ( not ( = ?auto_721342 ?auto_721354 ) ) ( not ( = ?auto_721343 ?auto_721344 ) ) ( not ( = ?auto_721343 ?auto_721345 ) ) ( not ( = ?auto_721343 ?auto_721346 ) ) ( not ( = ?auto_721343 ?auto_721347 ) ) ( not ( = ?auto_721343 ?auto_721348 ) ) ( not ( = ?auto_721343 ?auto_721349 ) ) ( not ( = ?auto_721343 ?auto_721350 ) ) ( not ( = ?auto_721343 ?auto_721351 ) ) ( not ( = ?auto_721343 ?auto_721352 ) ) ( not ( = ?auto_721343 ?auto_721353 ) ) ( not ( = ?auto_721343 ?auto_721354 ) ) ( not ( = ?auto_721344 ?auto_721345 ) ) ( not ( = ?auto_721344 ?auto_721346 ) ) ( not ( = ?auto_721344 ?auto_721347 ) ) ( not ( = ?auto_721344 ?auto_721348 ) ) ( not ( = ?auto_721344 ?auto_721349 ) ) ( not ( = ?auto_721344 ?auto_721350 ) ) ( not ( = ?auto_721344 ?auto_721351 ) ) ( not ( = ?auto_721344 ?auto_721352 ) ) ( not ( = ?auto_721344 ?auto_721353 ) ) ( not ( = ?auto_721344 ?auto_721354 ) ) ( not ( = ?auto_721345 ?auto_721346 ) ) ( not ( = ?auto_721345 ?auto_721347 ) ) ( not ( = ?auto_721345 ?auto_721348 ) ) ( not ( = ?auto_721345 ?auto_721349 ) ) ( not ( = ?auto_721345 ?auto_721350 ) ) ( not ( = ?auto_721345 ?auto_721351 ) ) ( not ( = ?auto_721345 ?auto_721352 ) ) ( not ( = ?auto_721345 ?auto_721353 ) ) ( not ( = ?auto_721345 ?auto_721354 ) ) ( not ( = ?auto_721346 ?auto_721347 ) ) ( not ( = ?auto_721346 ?auto_721348 ) ) ( not ( = ?auto_721346 ?auto_721349 ) ) ( not ( = ?auto_721346 ?auto_721350 ) ) ( not ( = ?auto_721346 ?auto_721351 ) ) ( not ( = ?auto_721346 ?auto_721352 ) ) ( not ( = ?auto_721346 ?auto_721353 ) ) ( not ( = ?auto_721346 ?auto_721354 ) ) ( not ( = ?auto_721347 ?auto_721348 ) ) ( not ( = ?auto_721347 ?auto_721349 ) ) ( not ( = ?auto_721347 ?auto_721350 ) ) ( not ( = ?auto_721347 ?auto_721351 ) ) ( not ( = ?auto_721347 ?auto_721352 ) ) ( not ( = ?auto_721347 ?auto_721353 ) ) ( not ( = ?auto_721347 ?auto_721354 ) ) ( not ( = ?auto_721348 ?auto_721349 ) ) ( not ( = ?auto_721348 ?auto_721350 ) ) ( not ( = ?auto_721348 ?auto_721351 ) ) ( not ( = ?auto_721348 ?auto_721352 ) ) ( not ( = ?auto_721348 ?auto_721353 ) ) ( not ( = ?auto_721348 ?auto_721354 ) ) ( not ( = ?auto_721349 ?auto_721350 ) ) ( not ( = ?auto_721349 ?auto_721351 ) ) ( not ( = ?auto_721349 ?auto_721352 ) ) ( not ( = ?auto_721349 ?auto_721353 ) ) ( not ( = ?auto_721349 ?auto_721354 ) ) ( not ( = ?auto_721350 ?auto_721351 ) ) ( not ( = ?auto_721350 ?auto_721352 ) ) ( not ( = ?auto_721350 ?auto_721353 ) ) ( not ( = ?auto_721350 ?auto_721354 ) ) ( not ( = ?auto_721351 ?auto_721352 ) ) ( not ( = ?auto_721351 ?auto_721353 ) ) ( not ( = ?auto_721351 ?auto_721354 ) ) ( not ( = ?auto_721352 ?auto_721353 ) ) ( not ( = ?auto_721352 ?auto_721354 ) ) ( not ( = ?auto_721353 ?auto_721354 ) ) ( ON ?auto_721352 ?auto_721353 ) ( ON ?auto_721351 ?auto_721352 ) ( ON ?auto_721350 ?auto_721351 ) ( ON ?auto_721349 ?auto_721350 ) ( ON ?auto_721348 ?auto_721349 ) ( ON ?auto_721347 ?auto_721348 ) ( ON ?auto_721346 ?auto_721347 ) ( ON ?auto_721345 ?auto_721346 ) ( ON ?auto_721344 ?auto_721345 ) ( CLEAR ?auto_721342 ) ( ON ?auto_721343 ?auto_721344 ) ( CLEAR ?auto_721343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_721340 ?auto_721341 ?auto_721342 ?auto_721343 )
      ( MAKE-14PILE ?auto_721340 ?auto_721341 ?auto_721342 ?auto_721343 ?auto_721344 ?auto_721345 ?auto_721346 ?auto_721347 ?auto_721348 ?auto_721349 ?auto_721350 ?auto_721351 ?auto_721352 ?auto_721353 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721398 - BLOCK
      ?auto_721399 - BLOCK
      ?auto_721400 - BLOCK
      ?auto_721401 - BLOCK
      ?auto_721402 - BLOCK
      ?auto_721403 - BLOCK
      ?auto_721404 - BLOCK
      ?auto_721405 - BLOCK
      ?auto_721406 - BLOCK
      ?auto_721407 - BLOCK
      ?auto_721408 - BLOCK
      ?auto_721409 - BLOCK
      ?auto_721410 - BLOCK
      ?auto_721411 - BLOCK
    )
    :vars
    (
      ?auto_721412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721411 ?auto_721412 ) ( ON-TABLE ?auto_721398 ) ( ON ?auto_721399 ?auto_721398 ) ( not ( = ?auto_721398 ?auto_721399 ) ) ( not ( = ?auto_721398 ?auto_721400 ) ) ( not ( = ?auto_721398 ?auto_721401 ) ) ( not ( = ?auto_721398 ?auto_721402 ) ) ( not ( = ?auto_721398 ?auto_721403 ) ) ( not ( = ?auto_721398 ?auto_721404 ) ) ( not ( = ?auto_721398 ?auto_721405 ) ) ( not ( = ?auto_721398 ?auto_721406 ) ) ( not ( = ?auto_721398 ?auto_721407 ) ) ( not ( = ?auto_721398 ?auto_721408 ) ) ( not ( = ?auto_721398 ?auto_721409 ) ) ( not ( = ?auto_721398 ?auto_721410 ) ) ( not ( = ?auto_721398 ?auto_721411 ) ) ( not ( = ?auto_721398 ?auto_721412 ) ) ( not ( = ?auto_721399 ?auto_721400 ) ) ( not ( = ?auto_721399 ?auto_721401 ) ) ( not ( = ?auto_721399 ?auto_721402 ) ) ( not ( = ?auto_721399 ?auto_721403 ) ) ( not ( = ?auto_721399 ?auto_721404 ) ) ( not ( = ?auto_721399 ?auto_721405 ) ) ( not ( = ?auto_721399 ?auto_721406 ) ) ( not ( = ?auto_721399 ?auto_721407 ) ) ( not ( = ?auto_721399 ?auto_721408 ) ) ( not ( = ?auto_721399 ?auto_721409 ) ) ( not ( = ?auto_721399 ?auto_721410 ) ) ( not ( = ?auto_721399 ?auto_721411 ) ) ( not ( = ?auto_721399 ?auto_721412 ) ) ( not ( = ?auto_721400 ?auto_721401 ) ) ( not ( = ?auto_721400 ?auto_721402 ) ) ( not ( = ?auto_721400 ?auto_721403 ) ) ( not ( = ?auto_721400 ?auto_721404 ) ) ( not ( = ?auto_721400 ?auto_721405 ) ) ( not ( = ?auto_721400 ?auto_721406 ) ) ( not ( = ?auto_721400 ?auto_721407 ) ) ( not ( = ?auto_721400 ?auto_721408 ) ) ( not ( = ?auto_721400 ?auto_721409 ) ) ( not ( = ?auto_721400 ?auto_721410 ) ) ( not ( = ?auto_721400 ?auto_721411 ) ) ( not ( = ?auto_721400 ?auto_721412 ) ) ( not ( = ?auto_721401 ?auto_721402 ) ) ( not ( = ?auto_721401 ?auto_721403 ) ) ( not ( = ?auto_721401 ?auto_721404 ) ) ( not ( = ?auto_721401 ?auto_721405 ) ) ( not ( = ?auto_721401 ?auto_721406 ) ) ( not ( = ?auto_721401 ?auto_721407 ) ) ( not ( = ?auto_721401 ?auto_721408 ) ) ( not ( = ?auto_721401 ?auto_721409 ) ) ( not ( = ?auto_721401 ?auto_721410 ) ) ( not ( = ?auto_721401 ?auto_721411 ) ) ( not ( = ?auto_721401 ?auto_721412 ) ) ( not ( = ?auto_721402 ?auto_721403 ) ) ( not ( = ?auto_721402 ?auto_721404 ) ) ( not ( = ?auto_721402 ?auto_721405 ) ) ( not ( = ?auto_721402 ?auto_721406 ) ) ( not ( = ?auto_721402 ?auto_721407 ) ) ( not ( = ?auto_721402 ?auto_721408 ) ) ( not ( = ?auto_721402 ?auto_721409 ) ) ( not ( = ?auto_721402 ?auto_721410 ) ) ( not ( = ?auto_721402 ?auto_721411 ) ) ( not ( = ?auto_721402 ?auto_721412 ) ) ( not ( = ?auto_721403 ?auto_721404 ) ) ( not ( = ?auto_721403 ?auto_721405 ) ) ( not ( = ?auto_721403 ?auto_721406 ) ) ( not ( = ?auto_721403 ?auto_721407 ) ) ( not ( = ?auto_721403 ?auto_721408 ) ) ( not ( = ?auto_721403 ?auto_721409 ) ) ( not ( = ?auto_721403 ?auto_721410 ) ) ( not ( = ?auto_721403 ?auto_721411 ) ) ( not ( = ?auto_721403 ?auto_721412 ) ) ( not ( = ?auto_721404 ?auto_721405 ) ) ( not ( = ?auto_721404 ?auto_721406 ) ) ( not ( = ?auto_721404 ?auto_721407 ) ) ( not ( = ?auto_721404 ?auto_721408 ) ) ( not ( = ?auto_721404 ?auto_721409 ) ) ( not ( = ?auto_721404 ?auto_721410 ) ) ( not ( = ?auto_721404 ?auto_721411 ) ) ( not ( = ?auto_721404 ?auto_721412 ) ) ( not ( = ?auto_721405 ?auto_721406 ) ) ( not ( = ?auto_721405 ?auto_721407 ) ) ( not ( = ?auto_721405 ?auto_721408 ) ) ( not ( = ?auto_721405 ?auto_721409 ) ) ( not ( = ?auto_721405 ?auto_721410 ) ) ( not ( = ?auto_721405 ?auto_721411 ) ) ( not ( = ?auto_721405 ?auto_721412 ) ) ( not ( = ?auto_721406 ?auto_721407 ) ) ( not ( = ?auto_721406 ?auto_721408 ) ) ( not ( = ?auto_721406 ?auto_721409 ) ) ( not ( = ?auto_721406 ?auto_721410 ) ) ( not ( = ?auto_721406 ?auto_721411 ) ) ( not ( = ?auto_721406 ?auto_721412 ) ) ( not ( = ?auto_721407 ?auto_721408 ) ) ( not ( = ?auto_721407 ?auto_721409 ) ) ( not ( = ?auto_721407 ?auto_721410 ) ) ( not ( = ?auto_721407 ?auto_721411 ) ) ( not ( = ?auto_721407 ?auto_721412 ) ) ( not ( = ?auto_721408 ?auto_721409 ) ) ( not ( = ?auto_721408 ?auto_721410 ) ) ( not ( = ?auto_721408 ?auto_721411 ) ) ( not ( = ?auto_721408 ?auto_721412 ) ) ( not ( = ?auto_721409 ?auto_721410 ) ) ( not ( = ?auto_721409 ?auto_721411 ) ) ( not ( = ?auto_721409 ?auto_721412 ) ) ( not ( = ?auto_721410 ?auto_721411 ) ) ( not ( = ?auto_721410 ?auto_721412 ) ) ( not ( = ?auto_721411 ?auto_721412 ) ) ( ON ?auto_721410 ?auto_721411 ) ( ON ?auto_721409 ?auto_721410 ) ( ON ?auto_721408 ?auto_721409 ) ( ON ?auto_721407 ?auto_721408 ) ( ON ?auto_721406 ?auto_721407 ) ( ON ?auto_721405 ?auto_721406 ) ( ON ?auto_721404 ?auto_721405 ) ( ON ?auto_721403 ?auto_721404 ) ( ON ?auto_721402 ?auto_721403 ) ( ON ?auto_721401 ?auto_721402 ) ( CLEAR ?auto_721399 ) ( ON ?auto_721400 ?auto_721401 ) ( CLEAR ?auto_721400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_721398 ?auto_721399 ?auto_721400 )
      ( MAKE-14PILE ?auto_721398 ?auto_721399 ?auto_721400 ?auto_721401 ?auto_721402 ?auto_721403 ?auto_721404 ?auto_721405 ?auto_721406 ?auto_721407 ?auto_721408 ?auto_721409 ?auto_721410 ?auto_721411 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721456 - BLOCK
      ?auto_721457 - BLOCK
      ?auto_721458 - BLOCK
      ?auto_721459 - BLOCK
      ?auto_721460 - BLOCK
      ?auto_721461 - BLOCK
      ?auto_721462 - BLOCK
      ?auto_721463 - BLOCK
      ?auto_721464 - BLOCK
      ?auto_721465 - BLOCK
      ?auto_721466 - BLOCK
      ?auto_721467 - BLOCK
      ?auto_721468 - BLOCK
      ?auto_721469 - BLOCK
    )
    :vars
    (
      ?auto_721470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721469 ?auto_721470 ) ( ON-TABLE ?auto_721456 ) ( not ( = ?auto_721456 ?auto_721457 ) ) ( not ( = ?auto_721456 ?auto_721458 ) ) ( not ( = ?auto_721456 ?auto_721459 ) ) ( not ( = ?auto_721456 ?auto_721460 ) ) ( not ( = ?auto_721456 ?auto_721461 ) ) ( not ( = ?auto_721456 ?auto_721462 ) ) ( not ( = ?auto_721456 ?auto_721463 ) ) ( not ( = ?auto_721456 ?auto_721464 ) ) ( not ( = ?auto_721456 ?auto_721465 ) ) ( not ( = ?auto_721456 ?auto_721466 ) ) ( not ( = ?auto_721456 ?auto_721467 ) ) ( not ( = ?auto_721456 ?auto_721468 ) ) ( not ( = ?auto_721456 ?auto_721469 ) ) ( not ( = ?auto_721456 ?auto_721470 ) ) ( not ( = ?auto_721457 ?auto_721458 ) ) ( not ( = ?auto_721457 ?auto_721459 ) ) ( not ( = ?auto_721457 ?auto_721460 ) ) ( not ( = ?auto_721457 ?auto_721461 ) ) ( not ( = ?auto_721457 ?auto_721462 ) ) ( not ( = ?auto_721457 ?auto_721463 ) ) ( not ( = ?auto_721457 ?auto_721464 ) ) ( not ( = ?auto_721457 ?auto_721465 ) ) ( not ( = ?auto_721457 ?auto_721466 ) ) ( not ( = ?auto_721457 ?auto_721467 ) ) ( not ( = ?auto_721457 ?auto_721468 ) ) ( not ( = ?auto_721457 ?auto_721469 ) ) ( not ( = ?auto_721457 ?auto_721470 ) ) ( not ( = ?auto_721458 ?auto_721459 ) ) ( not ( = ?auto_721458 ?auto_721460 ) ) ( not ( = ?auto_721458 ?auto_721461 ) ) ( not ( = ?auto_721458 ?auto_721462 ) ) ( not ( = ?auto_721458 ?auto_721463 ) ) ( not ( = ?auto_721458 ?auto_721464 ) ) ( not ( = ?auto_721458 ?auto_721465 ) ) ( not ( = ?auto_721458 ?auto_721466 ) ) ( not ( = ?auto_721458 ?auto_721467 ) ) ( not ( = ?auto_721458 ?auto_721468 ) ) ( not ( = ?auto_721458 ?auto_721469 ) ) ( not ( = ?auto_721458 ?auto_721470 ) ) ( not ( = ?auto_721459 ?auto_721460 ) ) ( not ( = ?auto_721459 ?auto_721461 ) ) ( not ( = ?auto_721459 ?auto_721462 ) ) ( not ( = ?auto_721459 ?auto_721463 ) ) ( not ( = ?auto_721459 ?auto_721464 ) ) ( not ( = ?auto_721459 ?auto_721465 ) ) ( not ( = ?auto_721459 ?auto_721466 ) ) ( not ( = ?auto_721459 ?auto_721467 ) ) ( not ( = ?auto_721459 ?auto_721468 ) ) ( not ( = ?auto_721459 ?auto_721469 ) ) ( not ( = ?auto_721459 ?auto_721470 ) ) ( not ( = ?auto_721460 ?auto_721461 ) ) ( not ( = ?auto_721460 ?auto_721462 ) ) ( not ( = ?auto_721460 ?auto_721463 ) ) ( not ( = ?auto_721460 ?auto_721464 ) ) ( not ( = ?auto_721460 ?auto_721465 ) ) ( not ( = ?auto_721460 ?auto_721466 ) ) ( not ( = ?auto_721460 ?auto_721467 ) ) ( not ( = ?auto_721460 ?auto_721468 ) ) ( not ( = ?auto_721460 ?auto_721469 ) ) ( not ( = ?auto_721460 ?auto_721470 ) ) ( not ( = ?auto_721461 ?auto_721462 ) ) ( not ( = ?auto_721461 ?auto_721463 ) ) ( not ( = ?auto_721461 ?auto_721464 ) ) ( not ( = ?auto_721461 ?auto_721465 ) ) ( not ( = ?auto_721461 ?auto_721466 ) ) ( not ( = ?auto_721461 ?auto_721467 ) ) ( not ( = ?auto_721461 ?auto_721468 ) ) ( not ( = ?auto_721461 ?auto_721469 ) ) ( not ( = ?auto_721461 ?auto_721470 ) ) ( not ( = ?auto_721462 ?auto_721463 ) ) ( not ( = ?auto_721462 ?auto_721464 ) ) ( not ( = ?auto_721462 ?auto_721465 ) ) ( not ( = ?auto_721462 ?auto_721466 ) ) ( not ( = ?auto_721462 ?auto_721467 ) ) ( not ( = ?auto_721462 ?auto_721468 ) ) ( not ( = ?auto_721462 ?auto_721469 ) ) ( not ( = ?auto_721462 ?auto_721470 ) ) ( not ( = ?auto_721463 ?auto_721464 ) ) ( not ( = ?auto_721463 ?auto_721465 ) ) ( not ( = ?auto_721463 ?auto_721466 ) ) ( not ( = ?auto_721463 ?auto_721467 ) ) ( not ( = ?auto_721463 ?auto_721468 ) ) ( not ( = ?auto_721463 ?auto_721469 ) ) ( not ( = ?auto_721463 ?auto_721470 ) ) ( not ( = ?auto_721464 ?auto_721465 ) ) ( not ( = ?auto_721464 ?auto_721466 ) ) ( not ( = ?auto_721464 ?auto_721467 ) ) ( not ( = ?auto_721464 ?auto_721468 ) ) ( not ( = ?auto_721464 ?auto_721469 ) ) ( not ( = ?auto_721464 ?auto_721470 ) ) ( not ( = ?auto_721465 ?auto_721466 ) ) ( not ( = ?auto_721465 ?auto_721467 ) ) ( not ( = ?auto_721465 ?auto_721468 ) ) ( not ( = ?auto_721465 ?auto_721469 ) ) ( not ( = ?auto_721465 ?auto_721470 ) ) ( not ( = ?auto_721466 ?auto_721467 ) ) ( not ( = ?auto_721466 ?auto_721468 ) ) ( not ( = ?auto_721466 ?auto_721469 ) ) ( not ( = ?auto_721466 ?auto_721470 ) ) ( not ( = ?auto_721467 ?auto_721468 ) ) ( not ( = ?auto_721467 ?auto_721469 ) ) ( not ( = ?auto_721467 ?auto_721470 ) ) ( not ( = ?auto_721468 ?auto_721469 ) ) ( not ( = ?auto_721468 ?auto_721470 ) ) ( not ( = ?auto_721469 ?auto_721470 ) ) ( ON ?auto_721468 ?auto_721469 ) ( ON ?auto_721467 ?auto_721468 ) ( ON ?auto_721466 ?auto_721467 ) ( ON ?auto_721465 ?auto_721466 ) ( ON ?auto_721464 ?auto_721465 ) ( ON ?auto_721463 ?auto_721464 ) ( ON ?auto_721462 ?auto_721463 ) ( ON ?auto_721461 ?auto_721462 ) ( ON ?auto_721460 ?auto_721461 ) ( ON ?auto_721459 ?auto_721460 ) ( ON ?auto_721458 ?auto_721459 ) ( CLEAR ?auto_721456 ) ( ON ?auto_721457 ?auto_721458 ) ( CLEAR ?auto_721457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_721456 ?auto_721457 )
      ( MAKE-14PILE ?auto_721456 ?auto_721457 ?auto_721458 ?auto_721459 ?auto_721460 ?auto_721461 ?auto_721462 ?auto_721463 ?auto_721464 ?auto_721465 ?auto_721466 ?auto_721467 ?auto_721468 ?auto_721469 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_721514 - BLOCK
      ?auto_721515 - BLOCK
      ?auto_721516 - BLOCK
      ?auto_721517 - BLOCK
      ?auto_721518 - BLOCK
      ?auto_721519 - BLOCK
      ?auto_721520 - BLOCK
      ?auto_721521 - BLOCK
      ?auto_721522 - BLOCK
      ?auto_721523 - BLOCK
      ?auto_721524 - BLOCK
      ?auto_721525 - BLOCK
      ?auto_721526 - BLOCK
      ?auto_721527 - BLOCK
    )
    :vars
    (
      ?auto_721528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721527 ?auto_721528 ) ( not ( = ?auto_721514 ?auto_721515 ) ) ( not ( = ?auto_721514 ?auto_721516 ) ) ( not ( = ?auto_721514 ?auto_721517 ) ) ( not ( = ?auto_721514 ?auto_721518 ) ) ( not ( = ?auto_721514 ?auto_721519 ) ) ( not ( = ?auto_721514 ?auto_721520 ) ) ( not ( = ?auto_721514 ?auto_721521 ) ) ( not ( = ?auto_721514 ?auto_721522 ) ) ( not ( = ?auto_721514 ?auto_721523 ) ) ( not ( = ?auto_721514 ?auto_721524 ) ) ( not ( = ?auto_721514 ?auto_721525 ) ) ( not ( = ?auto_721514 ?auto_721526 ) ) ( not ( = ?auto_721514 ?auto_721527 ) ) ( not ( = ?auto_721514 ?auto_721528 ) ) ( not ( = ?auto_721515 ?auto_721516 ) ) ( not ( = ?auto_721515 ?auto_721517 ) ) ( not ( = ?auto_721515 ?auto_721518 ) ) ( not ( = ?auto_721515 ?auto_721519 ) ) ( not ( = ?auto_721515 ?auto_721520 ) ) ( not ( = ?auto_721515 ?auto_721521 ) ) ( not ( = ?auto_721515 ?auto_721522 ) ) ( not ( = ?auto_721515 ?auto_721523 ) ) ( not ( = ?auto_721515 ?auto_721524 ) ) ( not ( = ?auto_721515 ?auto_721525 ) ) ( not ( = ?auto_721515 ?auto_721526 ) ) ( not ( = ?auto_721515 ?auto_721527 ) ) ( not ( = ?auto_721515 ?auto_721528 ) ) ( not ( = ?auto_721516 ?auto_721517 ) ) ( not ( = ?auto_721516 ?auto_721518 ) ) ( not ( = ?auto_721516 ?auto_721519 ) ) ( not ( = ?auto_721516 ?auto_721520 ) ) ( not ( = ?auto_721516 ?auto_721521 ) ) ( not ( = ?auto_721516 ?auto_721522 ) ) ( not ( = ?auto_721516 ?auto_721523 ) ) ( not ( = ?auto_721516 ?auto_721524 ) ) ( not ( = ?auto_721516 ?auto_721525 ) ) ( not ( = ?auto_721516 ?auto_721526 ) ) ( not ( = ?auto_721516 ?auto_721527 ) ) ( not ( = ?auto_721516 ?auto_721528 ) ) ( not ( = ?auto_721517 ?auto_721518 ) ) ( not ( = ?auto_721517 ?auto_721519 ) ) ( not ( = ?auto_721517 ?auto_721520 ) ) ( not ( = ?auto_721517 ?auto_721521 ) ) ( not ( = ?auto_721517 ?auto_721522 ) ) ( not ( = ?auto_721517 ?auto_721523 ) ) ( not ( = ?auto_721517 ?auto_721524 ) ) ( not ( = ?auto_721517 ?auto_721525 ) ) ( not ( = ?auto_721517 ?auto_721526 ) ) ( not ( = ?auto_721517 ?auto_721527 ) ) ( not ( = ?auto_721517 ?auto_721528 ) ) ( not ( = ?auto_721518 ?auto_721519 ) ) ( not ( = ?auto_721518 ?auto_721520 ) ) ( not ( = ?auto_721518 ?auto_721521 ) ) ( not ( = ?auto_721518 ?auto_721522 ) ) ( not ( = ?auto_721518 ?auto_721523 ) ) ( not ( = ?auto_721518 ?auto_721524 ) ) ( not ( = ?auto_721518 ?auto_721525 ) ) ( not ( = ?auto_721518 ?auto_721526 ) ) ( not ( = ?auto_721518 ?auto_721527 ) ) ( not ( = ?auto_721518 ?auto_721528 ) ) ( not ( = ?auto_721519 ?auto_721520 ) ) ( not ( = ?auto_721519 ?auto_721521 ) ) ( not ( = ?auto_721519 ?auto_721522 ) ) ( not ( = ?auto_721519 ?auto_721523 ) ) ( not ( = ?auto_721519 ?auto_721524 ) ) ( not ( = ?auto_721519 ?auto_721525 ) ) ( not ( = ?auto_721519 ?auto_721526 ) ) ( not ( = ?auto_721519 ?auto_721527 ) ) ( not ( = ?auto_721519 ?auto_721528 ) ) ( not ( = ?auto_721520 ?auto_721521 ) ) ( not ( = ?auto_721520 ?auto_721522 ) ) ( not ( = ?auto_721520 ?auto_721523 ) ) ( not ( = ?auto_721520 ?auto_721524 ) ) ( not ( = ?auto_721520 ?auto_721525 ) ) ( not ( = ?auto_721520 ?auto_721526 ) ) ( not ( = ?auto_721520 ?auto_721527 ) ) ( not ( = ?auto_721520 ?auto_721528 ) ) ( not ( = ?auto_721521 ?auto_721522 ) ) ( not ( = ?auto_721521 ?auto_721523 ) ) ( not ( = ?auto_721521 ?auto_721524 ) ) ( not ( = ?auto_721521 ?auto_721525 ) ) ( not ( = ?auto_721521 ?auto_721526 ) ) ( not ( = ?auto_721521 ?auto_721527 ) ) ( not ( = ?auto_721521 ?auto_721528 ) ) ( not ( = ?auto_721522 ?auto_721523 ) ) ( not ( = ?auto_721522 ?auto_721524 ) ) ( not ( = ?auto_721522 ?auto_721525 ) ) ( not ( = ?auto_721522 ?auto_721526 ) ) ( not ( = ?auto_721522 ?auto_721527 ) ) ( not ( = ?auto_721522 ?auto_721528 ) ) ( not ( = ?auto_721523 ?auto_721524 ) ) ( not ( = ?auto_721523 ?auto_721525 ) ) ( not ( = ?auto_721523 ?auto_721526 ) ) ( not ( = ?auto_721523 ?auto_721527 ) ) ( not ( = ?auto_721523 ?auto_721528 ) ) ( not ( = ?auto_721524 ?auto_721525 ) ) ( not ( = ?auto_721524 ?auto_721526 ) ) ( not ( = ?auto_721524 ?auto_721527 ) ) ( not ( = ?auto_721524 ?auto_721528 ) ) ( not ( = ?auto_721525 ?auto_721526 ) ) ( not ( = ?auto_721525 ?auto_721527 ) ) ( not ( = ?auto_721525 ?auto_721528 ) ) ( not ( = ?auto_721526 ?auto_721527 ) ) ( not ( = ?auto_721526 ?auto_721528 ) ) ( not ( = ?auto_721527 ?auto_721528 ) ) ( ON ?auto_721526 ?auto_721527 ) ( ON ?auto_721525 ?auto_721526 ) ( ON ?auto_721524 ?auto_721525 ) ( ON ?auto_721523 ?auto_721524 ) ( ON ?auto_721522 ?auto_721523 ) ( ON ?auto_721521 ?auto_721522 ) ( ON ?auto_721520 ?auto_721521 ) ( ON ?auto_721519 ?auto_721520 ) ( ON ?auto_721518 ?auto_721519 ) ( ON ?auto_721517 ?auto_721518 ) ( ON ?auto_721516 ?auto_721517 ) ( ON ?auto_721515 ?auto_721516 ) ( ON ?auto_721514 ?auto_721515 ) ( CLEAR ?auto_721514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_721514 )
      ( MAKE-14PILE ?auto_721514 ?auto_721515 ?auto_721516 ?auto_721517 ?auto_721518 ?auto_721519 ?auto_721520 ?auto_721521 ?auto_721522 ?auto_721523 ?auto_721524 ?auto_721525 ?auto_721526 ?auto_721527 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_721573 - BLOCK
      ?auto_721574 - BLOCK
      ?auto_721575 - BLOCK
      ?auto_721576 - BLOCK
      ?auto_721577 - BLOCK
      ?auto_721578 - BLOCK
      ?auto_721579 - BLOCK
      ?auto_721580 - BLOCK
      ?auto_721581 - BLOCK
      ?auto_721582 - BLOCK
      ?auto_721583 - BLOCK
      ?auto_721584 - BLOCK
      ?auto_721585 - BLOCK
      ?auto_721586 - BLOCK
      ?auto_721587 - BLOCK
    )
    :vars
    (
      ?auto_721588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_721586 ) ( ON ?auto_721587 ?auto_721588 ) ( CLEAR ?auto_721587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_721573 ) ( ON ?auto_721574 ?auto_721573 ) ( ON ?auto_721575 ?auto_721574 ) ( ON ?auto_721576 ?auto_721575 ) ( ON ?auto_721577 ?auto_721576 ) ( ON ?auto_721578 ?auto_721577 ) ( ON ?auto_721579 ?auto_721578 ) ( ON ?auto_721580 ?auto_721579 ) ( ON ?auto_721581 ?auto_721580 ) ( ON ?auto_721582 ?auto_721581 ) ( ON ?auto_721583 ?auto_721582 ) ( ON ?auto_721584 ?auto_721583 ) ( ON ?auto_721585 ?auto_721584 ) ( ON ?auto_721586 ?auto_721585 ) ( not ( = ?auto_721573 ?auto_721574 ) ) ( not ( = ?auto_721573 ?auto_721575 ) ) ( not ( = ?auto_721573 ?auto_721576 ) ) ( not ( = ?auto_721573 ?auto_721577 ) ) ( not ( = ?auto_721573 ?auto_721578 ) ) ( not ( = ?auto_721573 ?auto_721579 ) ) ( not ( = ?auto_721573 ?auto_721580 ) ) ( not ( = ?auto_721573 ?auto_721581 ) ) ( not ( = ?auto_721573 ?auto_721582 ) ) ( not ( = ?auto_721573 ?auto_721583 ) ) ( not ( = ?auto_721573 ?auto_721584 ) ) ( not ( = ?auto_721573 ?auto_721585 ) ) ( not ( = ?auto_721573 ?auto_721586 ) ) ( not ( = ?auto_721573 ?auto_721587 ) ) ( not ( = ?auto_721573 ?auto_721588 ) ) ( not ( = ?auto_721574 ?auto_721575 ) ) ( not ( = ?auto_721574 ?auto_721576 ) ) ( not ( = ?auto_721574 ?auto_721577 ) ) ( not ( = ?auto_721574 ?auto_721578 ) ) ( not ( = ?auto_721574 ?auto_721579 ) ) ( not ( = ?auto_721574 ?auto_721580 ) ) ( not ( = ?auto_721574 ?auto_721581 ) ) ( not ( = ?auto_721574 ?auto_721582 ) ) ( not ( = ?auto_721574 ?auto_721583 ) ) ( not ( = ?auto_721574 ?auto_721584 ) ) ( not ( = ?auto_721574 ?auto_721585 ) ) ( not ( = ?auto_721574 ?auto_721586 ) ) ( not ( = ?auto_721574 ?auto_721587 ) ) ( not ( = ?auto_721574 ?auto_721588 ) ) ( not ( = ?auto_721575 ?auto_721576 ) ) ( not ( = ?auto_721575 ?auto_721577 ) ) ( not ( = ?auto_721575 ?auto_721578 ) ) ( not ( = ?auto_721575 ?auto_721579 ) ) ( not ( = ?auto_721575 ?auto_721580 ) ) ( not ( = ?auto_721575 ?auto_721581 ) ) ( not ( = ?auto_721575 ?auto_721582 ) ) ( not ( = ?auto_721575 ?auto_721583 ) ) ( not ( = ?auto_721575 ?auto_721584 ) ) ( not ( = ?auto_721575 ?auto_721585 ) ) ( not ( = ?auto_721575 ?auto_721586 ) ) ( not ( = ?auto_721575 ?auto_721587 ) ) ( not ( = ?auto_721575 ?auto_721588 ) ) ( not ( = ?auto_721576 ?auto_721577 ) ) ( not ( = ?auto_721576 ?auto_721578 ) ) ( not ( = ?auto_721576 ?auto_721579 ) ) ( not ( = ?auto_721576 ?auto_721580 ) ) ( not ( = ?auto_721576 ?auto_721581 ) ) ( not ( = ?auto_721576 ?auto_721582 ) ) ( not ( = ?auto_721576 ?auto_721583 ) ) ( not ( = ?auto_721576 ?auto_721584 ) ) ( not ( = ?auto_721576 ?auto_721585 ) ) ( not ( = ?auto_721576 ?auto_721586 ) ) ( not ( = ?auto_721576 ?auto_721587 ) ) ( not ( = ?auto_721576 ?auto_721588 ) ) ( not ( = ?auto_721577 ?auto_721578 ) ) ( not ( = ?auto_721577 ?auto_721579 ) ) ( not ( = ?auto_721577 ?auto_721580 ) ) ( not ( = ?auto_721577 ?auto_721581 ) ) ( not ( = ?auto_721577 ?auto_721582 ) ) ( not ( = ?auto_721577 ?auto_721583 ) ) ( not ( = ?auto_721577 ?auto_721584 ) ) ( not ( = ?auto_721577 ?auto_721585 ) ) ( not ( = ?auto_721577 ?auto_721586 ) ) ( not ( = ?auto_721577 ?auto_721587 ) ) ( not ( = ?auto_721577 ?auto_721588 ) ) ( not ( = ?auto_721578 ?auto_721579 ) ) ( not ( = ?auto_721578 ?auto_721580 ) ) ( not ( = ?auto_721578 ?auto_721581 ) ) ( not ( = ?auto_721578 ?auto_721582 ) ) ( not ( = ?auto_721578 ?auto_721583 ) ) ( not ( = ?auto_721578 ?auto_721584 ) ) ( not ( = ?auto_721578 ?auto_721585 ) ) ( not ( = ?auto_721578 ?auto_721586 ) ) ( not ( = ?auto_721578 ?auto_721587 ) ) ( not ( = ?auto_721578 ?auto_721588 ) ) ( not ( = ?auto_721579 ?auto_721580 ) ) ( not ( = ?auto_721579 ?auto_721581 ) ) ( not ( = ?auto_721579 ?auto_721582 ) ) ( not ( = ?auto_721579 ?auto_721583 ) ) ( not ( = ?auto_721579 ?auto_721584 ) ) ( not ( = ?auto_721579 ?auto_721585 ) ) ( not ( = ?auto_721579 ?auto_721586 ) ) ( not ( = ?auto_721579 ?auto_721587 ) ) ( not ( = ?auto_721579 ?auto_721588 ) ) ( not ( = ?auto_721580 ?auto_721581 ) ) ( not ( = ?auto_721580 ?auto_721582 ) ) ( not ( = ?auto_721580 ?auto_721583 ) ) ( not ( = ?auto_721580 ?auto_721584 ) ) ( not ( = ?auto_721580 ?auto_721585 ) ) ( not ( = ?auto_721580 ?auto_721586 ) ) ( not ( = ?auto_721580 ?auto_721587 ) ) ( not ( = ?auto_721580 ?auto_721588 ) ) ( not ( = ?auto_721581 ?auto_721582 ) ) ( not ( = ?auto_721581 ?auto_721583 ) ) ( not ( = ?auto_721581 ?auto_721584 ) ) ( not ( = ?auto_721581 ?auto_721585 ) ) ( not ( = ?auto_721581 ?auto_721586 ) ) ( not ( = ?auto_721581 ?auto_721587 ) ) ( not ( = ?auto_721581 ?auto_721588 ) ) ( not ( = ?auto_721582 ?auto_721583 ) ) ( not ( = ?auto_721582 ?auto_721584 ) ) ( not ( = ?auto_721582 ?auto_721585 ) ) ( not ( = ?auto_721582 ?auto_721586 ) ) ( not ( = ?auto_721582 ?auto_721587 ) ) ( not ( = ?auto_721582 ?auto_721588 ) ) ( not ( = ?auto_721583 ?auto_721584 ) ) ( not ( = ?auto_721583 ?auto_721585 ) ) ( not ( = ?auto_721583 ?auto_721586 ) ) ( not ( = ?auto_721583 ?auto_721587 ) ) ( not ( = ?auto_721583 ?auto_721588 ) ) ( not ( = ?auto_721584 ?auto_721585 ) ) ( not ( = ?auto_721584 ?auto_721586 ) ) ( not ( = ?auto_721584 ?auto_721587 ) ) ( not ( = ?auto_721584 ?auto_721588 ) ) ( not ( = ?auto_721585 ?auto_721586 ) ) ( not ( = ?auto_721585 ?auto_721587 ) ) ( not ( = ?auto_721585 ?auto_721588 ) ) ( not ( = ?auto_721586 ?auto_721587 ) ) ( not ( = ?auto_721586 ?auto_721588 ) ) ( not ( = ?auto_721587 ?auto_721588 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_721587 ?auto_721588 )
      ( !STACK ?auto_721587 ?auto_721586 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_721635 - BLOCK
      ?auto_721636 - BLOCK
      ?auto_721637 - BLOCK
      ?auto_721638 - BLOCK
      ?auto_721639 - BLOCK
      ?auto_721640 - BLOCK
      ?auto_721641 - BLOCK
      ?auto_721642 - BLOCK
      ?auto_721643 - BLOCK
      ?auto_721644 - BLOCK
      ?auto_721645 - BLOCK
      ?auto_721646 - BLOCK
      ?auto_721647 - BLOCK
      ?auto_721648 - BLOCK
      ?auto_721649 - BLOCK
    )
    :vars
    (
      ?auto_721650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721649 ?auto_721650 ) ( ON-TABLE ?auto_721635 ) ( ON ?auto_721636 ?auto_721635 ) ( ON ?auto_721637 ?auto_721636 ) ( ON ?auto_721638 ?auto_721637 ) ( ON ?auto_721639 ?auto_721638 ) ( ON ?auto_721640 ?auto_721639 ) ( ON ?auto_721641 ?auto_721640 ) ( ON ?auto_721642 ?auto_721641 ) ( ON ?auto_721643 ?auto_721642 ) ( ON ?auto_721644 ?auto_721643 ) ( ON ?auto_721645 ?auto_721644 ) ( ON ?auto_721646 ?auto_721645 ) ( ON ?auto_721647 ?auto_721646 ) ( not ( = ?auto_721635 ?auto_721636 ) ) ( not ( = ?auto_721635 ?auto_721637 ) ) ( not ( = ?auto_721635 ?auto_721638 ) ) ( not ( = ?auto_721635 ?auto_721639 ) ) ( not ( = ?auto_721635 ?auto_721640 ) ) ( not ( = ?auto_721635 ?auto_721641 ) ) ( not ( = ?auto_721635 ?auto_721642 ) ) ( not ( = ?auto_721635 ?auto_721643 ) ) ( not ( = ?auto_721635 ?auto_721644 ) ) ( not ( = ?auto_721635 ?auto_721645 ) ) ( not ( = ?auto_721635 ?auto_721646 ) ) ( not ( = ?auto_721635 ?auto_721647 ) ) ( not ( = ?auto_721635 ?auto_721648 ) ) ( not ( = ?auto_721635 ?auto_721649 ) ) ( not ( = ?auto_721635 ?auto_721650 ) ) ( not ( = ?auto_721636 ?auto_721637 ) ) ( not ( = ?auto_721636 ?auto_721638 ) ) ( not ( = ?auto_721636 ?auto_721639 ) ) ( not ( = ?auto_721636 ?auto_721640 ) ) ( not ( = ?auto_721636 ?auto_721641 ) ) ( not ( = ?auto_721636 ?auto_721642 ) ) ( not ( = ?auto_721636 ?auto_721643 ) ) ( not ( = ?auto_721636 ?auto_721644 ) ) ( not ( = ?auto_721636 ?auto_721645 ) ) ( not ( = ?auto_721636 ?auto_721646 ) ) ( not ( = ?auto_721636 ?auto_721647 ) ) ( not ( = ?auto_721636 ?auto_721648 ) ) ( not ( = ?auto_721636 ?auto_721649 ) ) ( not ( = ?auto_721636 ?auto_721650 ) ) ( not ( = ?auto_721637 ?auto_721638 ) ) ( not ( = ?auto_721637 ?auto_721639 ) ) ( not ( = ?auto_721637 ?auto_721640 ) ) ( not ( = ?auto_721637 ?auto_721641 ) ) ( not ( = ?auto_721637 ?auto_721642 ) ) ( not ( = ?auto_721637 ?auto_721643 ) ) ( not ( = ?auto_721637 ?auto_721644 ) ) ( not ( = ?auto_721637 ?auto_721645 ) ) ( not ( = ?auto_721637 ?auto_721646 ) ) ( not ( = ?auto_721637 ?auto_721647 ) ) ( not ( = ?auto_721637 ?auto_721648 ) ) ( not ( = ?auto_721637 ?auto_721649 ) ) ( not ( = ?auto_721637 ?auto_721650 ) ) ( not ( = ?auto_721638 ?auto_721639 ) ) ( not ( = ?auto_721638 ?auto_721640 ) ) ( not ( = ?auto_721638 ?auto_721641 ) ) ( not ( = ?auto_721638 ?auto_721642 ) ) ( not ( = ?auto_721638 ?auto_721643 ) ) ( not ( = ?auto_721638 ?auto_721644 ) ) ( not ( = ?auto_721638 ?auto_721645 ) ) ( not ( = ?auto_721638 ?auto_721646 ) ) ( not ( = ?auto_721638 ?auto_721647 ) ) ( not ( = ?auto_721638 ?auto_721648 ) ) ( not ( = ?auto_721638 ?auto_721649 ) ) ( not ( = ?auto_721638 ?auto_721650 ) ) ( not ( = ?auto_721639 ?auto_721640 ) ) ( not ( = ?auto_721639 ?auto_721641 ) ) ( not ( = ?auto_721639 ?auto_721642 ) ) ( not ( = ?auto_721639 ?auto_721643 ) ) ( not ( = ?auto_721639 ?auto_721644 ) ) ( not ( = ?auto_721639 ?auto_721645 ) ) ( not ( = ?auto_721639 ?auto_721646 ) ) ( not ( = ?auto_721639 ?auto_721647 ) ) ( not ( = ?auto_721639 ?auto_721648 ) ) ( not ( = ?auto_721639 ?auto_721649 ) ) ( not ( = ?auto_721639 ?auto_721650 ) ) ( not ( = ?auto_721640 ?auto_721641 ) ) ( not ( = ?auto_721640 ?auto_721642 ) ) ( not ( = ?auto_721640 ?auto_721643 ) ) ( not ( = ?auto_721640 ?auto_721644 ) ) ( not ( = ?auto_721640 ?auto_721645 ) ) ( not ( = ?auto_721640 ?auto_721646 ) ) ( not ( = ?auto_721640 ?auto_721647 ) ) ( not ( = ?auto_721640 ?auto_721648 ) ) ( not ( = ?auto_721640 ?auto_721649 ) ) ( not ( = ?auto_721640 ?auto_721650 ) ) ( not ( = ?auto_721641 ?auto_721642 ) ) ( not ( = ?auto_721641 ?auto_721643 ) ) ( not ( = ?auto_721641 ?auto_721644 ) ) ( not ( = ?auto_721641 ?auto_721645 ) ) ( not ( = ?auto_721641 ?auto_721646 ) ) ( not ( = ?auto_721641 ?auto_721647 ) ) ( not ( = ?auto_721641 ?auto_721648 ) ) ( not ( = ?auto_721641 ?auto_721649 ) ) ( not ( = ?auto_721641 ?auto_721650 ) ) ( not ( = ?auto_721642 ?auto_721643 ) ) ( not ( = ?auto_721642 ?auto_721644 ) ) ( not ( = ?auto_721642 ?auto_721645 ) ) ( not ( = ?auto_721642 ?auto_721646 ) ) ( not ( = ?auto_721642 ?auto_721647 ) ) ( not ( = ?auto_721642 ?auto_721648 ) ) ( not ( = ?auto_721642 ?auto_721649 ) ) ( not ( = ?auto_721642 ?auto_721650 ) ) ( not ( = ?auto_721643 ?auto_721644 ) ) ( not ( = ?auto_721643 ?auto_721645 ) ) ( not ( = ?auto_721643 ?auto_721646 ) ) ( not ( = ?auto_721643 ?auto_721647 ) ) ( not ( = ?auto_721643 ?auto_721648 ) ) ( not ( = ?auto_721643 ?auto_721649 ) ) ( not ( = ?auto_721643 ?auto_721650 ) ) ( not ( = ?auto_721644 ?auto_721645 ) ) ( not ( = ?auto_721644 ?auto_721646 ) ) ( not ( = ?auto_721644 ?auto_721647 ) ) ( not ( = ?auto_721644 ?auto_721648 ) ) ( not ( = ?auto_721644 ?auto_721649 ) ) ( not ( = ?auto_721644 ?auto_721650 ) ) ( not ( = ?auto_721645 ?auto_721646 ) ) ( not ( = ?auto_721645 ?auto_721647 ) ) ( not ( = ?auto_721645 ?auto_721648 ) ) ( not ( = ?auto_721645 ?auto_721649 ) ) ( not ( = ?auto_721645 ?auto_721650 ) ) ( not ( = ?auto_721646 ?auto_721647 ) ) ( not ( = ?auto_721646 ?auto_721648 ) ) ( not ( = ?auto_721646 ?auto_721649 ) ) ( not ( = ?auto_721646 ?auto_721650 ) ) ( not ( = ?auto_721647 ?auto_721648 ) ) ( not ( = ?auto_721647 ?auto_721649 ) ) ( not ( = ?auto_721647 ?auto_721650 ) ) ( not ( = ?auto_721648 ?auto_721649 ) ) ( not ( = ?auto_721648 ?auto_721650 ) ) ( not ( = ?auto_721649 ?auto_721650 ) ) ( CLEAR ?auto_721647 ) ( ON ?auto_721648 ?auto_721649 ) ( CLEAR ?auto_721648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_721635 ?auto_721636 ?auto_721637 ?auto_721638 ?auto_721639 ?auto_721640 ?auto_721641 ?auto_721642 ?auto_721643 ?auto_721644 ?auto_721645 ?auto_721646 ?auto_721647 ?auto_721648 )
      ( MAKE-15PILE ?auto_721635 ?auto_721636 ?auto_721637 ?auto_721638 ?auto_721639 ?auto_721640 ?auto_721641 ?auto_721642 ?auto_721643 ?auto_721644 ?auto_721645 ?auto_721646 ?auto_721647 ?auto_721648 ?auto_721649 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_721697 - BLOCK
      ?auto_721698 - BLOCK
      ?auto_721699 - BLOCK
      ?auto_721700 - BLOCK
      ?auto_721701 - BLOCK
      ?auto_721702 - BLOCK
      ?auto_721703 - BLOCK
      ?auto_721704 - BLOCK
      ?auto_721705 - BLOCK
      ?auto_721706 - BLOCK
      ?auto_721707 - BLOCK
      ?auto_721708 - BLOCK
      ?auto_721709 - BLOCK
      ?auto_721710 - BLOCK
      ?auto_721711 - BLOCK
    )
    :vars
    (
      ?auto_721712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721711 ?auto_721712 ) ( ON-TABLE ?auto_721697 ) ( ON ?auto_721698 ?auto_721697 ) ( ON ?auto_721699 ?auto_721698 ) ( ON ?auto_721700 ?auto_721699 ) ( ON ?auto_721701 ?auto_721700 ) ( ON ?auto_721702 ?auto_721701 ) ( ON ?auto_721703 ?auto_721702 ) ( ON ?auto_721704 ?auto_721703 ) ( ON ?auto_721705 ?auto_721704 ) ( ON ?auto_721706 ?auto_721705 ) ( ON ?auto_721707 ?auto_721706 ) ( ON ?auto_721708 ?auto_721707 ) ( not ( = ?auto_721697 ?auto_721698 ) ) ( not ( = ?auto_721697 ?auto_721699 ) ) ( not ( = ?auto_721697 ?auto_721700 ) ) ( not ( = ?auto_721697 ?auto_721701 ) ) ( not ( = ?auto_721697 ?auto_721702 ) ) ( not ( = ?auto_721697 ?auto_721703 ) ) ( not ( = ?auto_721697 ?auto_721704 ) ) ( not ( = ?auto_721697 ?auto_721705 ) ) ( not ( = ?auto_721697 ?auto_721706 ) ) ( not ( = ?auto_721697 ?auto_721707 ) ) ( not ( = ?auto_721697 ?auto_721708 ) ) ( not ( = ?auto_721697 ?auto_721709 ) ) ( not ( = ?auto_721697 ?auto_721710 ) ) ( not ( = ?auto_721697 ?auto_721711 ) ) ( not ( = ?auto_721697 ?auto_721712 ) ) ( not ( = ?auto_721698 ?auto_721699 ) ) ( not ( = ?auto_721698 ?auto_721700 ) ) ( not ( = ?auto_721698 ?auto_721701 ) ) ( not ( = ?auto_721698 ?auto_721702 ) ) ( not ( = ?auto_721698 ?auto_721703 ) ) ( not ( = ?auto_721698 ?auto_721704 ) ) ( not ( = ?auto_721698 ?auto_721705 ) ) ( not ( = ?auto_721698 ?auto_721706 ) ) ( not ( = ?auto_721698 ?auto_721707 ) ) ( not ( = ?auto_721698 ?auto_721708 ) ) ( not ( = ?auto_721698 ?auto_721709 ) ) ( not ( = ?auto_721698 ?auto_721710 ) ) ( not ( = ?auto_721698 ?auto_721711 ) ) ( not ( = ?auto_721698 ?auto_721712 ) ) ( not ( = ?auto_721699 ?auto_721700 ) ) ( not ( = ?auto_721699 ?auto_721701 ) ) ( not ( = ?auto_721699 ?auto_721702 ) ) ( not ( = ?auto_721699 ?auto_721703 ) ) ( not ( = ?auto_721699 ?auto_721704 ) ) ( not ( = ?auto_721699 ?auto_721705 ) ) ( not ( = ?auto_721699 ?auto_721706 ) ) ( not ( = ?auto_721699 ?auto_721707 ) ) ( not ( = ?auto_721699 ?auto_721708 ) ) ( not ( = ?auto_721699 ?auto_721709 ) ) ( not ( = ?auto_721699 ?auto_721710 ) ) ( not ( = ?auto_721699 ?auto_721711 ) ) ( not ( = ?auto_721699 ?auto_721712 ) ) ( not ( = ?auto_721700 ?auto_721701 ) ) ( not ( = ?auto_721700 ?auto_721702 ) ) ( not ( = ?auto_721700 ?auto_721703 ) ) ( not ( = ?auto_721700 ?auto_721704 ) ) ( not ( = ?auto_721700 ?auto_721705 ) ) ( not ( = ?auto_721700 ?auto_721706 ) ) ( not ( = ?auto_721700 ?auto_721707 ) ) ( not ( = ?auto_721700 ?auto_721708 ) ) ( not ( = ?auto_721700 ?auto_721709 ) ) ( not ( = ?auto_721700 ?auto_721710 ) ) ( not ( = ?auto_721700 ?auto_721711 ) ) ( not ( = ?auto_721700 ?auto_721712 ) ) ( not ( = ?auto_721701 ?auto_721702 ) ) ( not ( = ?auto_721701 ?auto_721703 ) ) ( not ( = ?auto_721701 ?auto_721704 ) ) ( not ( = ?auto_721701 ?auto_721705 ) ) ( not ( = ?auto_721701 ?auto_721706 ) ) ( not ( = ?auto_721701 ?auto_721707 ) ) ( not ( = ?auto_721701 ?auto_721708 ) ) ( not ( = ?auto_721701 ?auto_721709 ) ) ( not ( = ?auto_721701 ?auto_721710 ) ) ( not ( = ?auto_721701 ?auto_721711 ) ) ( not ( = ?auto_721701 ?auto_721712 ) ) ( not ( = ?auto_721702 ?auto_721703 ) ) ( not ( = ?auto_721702 ?auto_721704 ) ) ( not ( = ?auto_721702 ?auto_721705 ) ) ( not ( = ?auto_721702 ?auto_721706 ) ) ( not ( = ?auto_721702 ?auto_721707 ) ) ( not ( = ?auto_721702 ?auto_721708 ) ) ( not ( = ?auto_721702 ?auto_721709 ) ) ( not ( = ?auto_721702 ?auto_721710 ) ) ( not ( = ?auto_721702 ?auto_721711 ) ) ( not ( = ?auto_721702 ?auto_721712 ) ) ( not ( = ?auto_721703 ?auto_721704 ) ) ( not ( = ?auto_721703 ?auto_721705 ) ) ( not ( = ?auto_721703 ?auto_721706 ) ) ( not ( = ?auto_721703 ?auto_721707 ) ) ( not ( = ?auto_721703 ?auto_721708 ) ) ( not ( = ?auto_721703 ?auto_721709 ) ) ( not ( = ?auto_721703 ?auto_721710 ) ) ( not ( = ?auto_721703 ?auto_721711 ) ) ( not ( = ?auto_721703 ?auto_721712 ) ) ( not ( = ?auto_721704 ?auto_721705 ) ) ( not ( = ?auto_721704 ?auto_721706 ) ) ( not ( = ?auto_721704 ?auto_721707 ) ) ( not ( = ?auto_721704 ?auto_721708 ) ) ( not ( = ?auto_721704 ?auto_721709 ) ) ( not ( = ?auto_721704 ?auto_721710 ) ) ( not ( = ?auto_721704 ?auto_721711 ) ) ( not ( = ?auto_721704 ?auto_721712 ) ) ( not ( = ?auto_721705 ?auto_721706 ) ) ( not ( = ?auto_721705 ?auto_721707 ) ) ( not ( = ?auto_721705 ?auto_721708 ) ) ( not ( = ?auto_721705 ?auto_721709 ) ) ( not ( = ?auto_721705 ?auto_721710 ) ) ( not ( = ?auto_721705 ?auto_721711 ) ) ( not ( = ?auto_721705 ?auto_721712 ) ) ( not ( = ?auto_721706 ?auto_721707 ) ) ( not ( = ?auto_721706 ?auto_721708 ) ) ( not ( = ?auto_721706 ?auto_721709 ) ) ( not ( = ?auto_721706 ?auto_721710 ) ) ( not ( = ?auto_721706 ?auto_721711 ) ) ( not ( = ?auto_721706 ?auto_721712 ) ) ( not ( = ?auto_721707 ?auto_721708 ) ) ( not ( = ?auto_721707 ?auto_721709 ) ) ( not ( = ?auto_721707 ?auto_721710 ) ) ( not ( = ?auto_721707 ?auto_721711 ) ) ( not ( = ?auto_721707 ?auto_721712 ) ) ( not ( = ?auto_721708 ?auto_721709 ) ) ( not ( = ?auto_721708 ?auto_721710 ) ) ( not ( = ?auto_721708 ?auto_721711 ) ) ( not ( = ?auto_721708 ?auto_721712 ) ) ( not ( = ?auto_721709 ?auto_721710 ) ) ( not ( = ?auto_721709 ?auto_721711 ) ) ( not ( = ?auto_721709 ?auto_721712 ) ) ( not ( = ?auto_721710 ?auto_721711 ) ) ( not ( = ?auto_721710 ?auto_721712 ) ) ( not ( = ?auto_721711 ?auto_721712 ) ) ( ON ?auto_721710 ?auto_721711 ) ( CLEAR ?auto_721708 ) ( ON ?auto_721709 ?auto_721710 ) ( CLEAR ?auto_721709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_721697 ?auto_721698 ?auto_721699 ?auto_721700 ?auto_721701 ?auto_721702 ?auto_721703 ?auto_721704 ?auto_721705 ?auto_721706 ?auto_721707 ?auto_721708 ?auto_721709 )
      ( MAKE-15PILE ?auto_721697 ?auto_721698 ?auto_721699 ?auto_721700 ?auto_721701 ?auto_721702 ?auto_721703 ?auto_721704 ?auto_721705 ?auto_721706 ?auto_721707 ?auto_721708 ?auto_721709 ?auto_721710 ?auto_721711 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_721759 - BLOCK
      ?auto_721760 - BLOCK
      ?auto_721761 - BLOCK
      ?auto_721762 - BLOCK
      ?auto_721763 - BLOCK
      ?auto_721764 - BLOCK
      ?auto_721765 - BLOCK
      ?auto_721766 - BLOCK
      ?auto_721767 - BLOCK
      ?auto_721768 - BLOCK
      ?auto_721769 - BLOCK
      ?auto_721770 - BLOCK
      ?auto_721771 - BLOCK
      ?auto_721772 - BLOCK
      ?auto_721773 - BLOCK
    )
    :vars
    (
      ?auto_721774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721773 ?auto_721774 ) ( ON-TABLE ?auto_721759 ) ( ON ?auto_721760 ?auto_721759 ) ( ON ?auto_721761 ?auto_721760 ) ( ON ?auto_721762 ?auto_721761 ) ( ON ?auto_721763 ?auto_721762 ) ( ON ?auto_721764 ?auto_721763 ) ( ON ?auto_721765 ?auto_721764 ) ( ON ?auto_721766 ?auto_721765 ) ( ON ?auto_721767 ?auto_721766 ) ( ON ?auto_721768 ?auto_721767 ) ( ON ?auto_721769 ?auto_721768 ) ( not ( = ?auto_721759 ?auto_721760 ) ) ( not ( = ?auto_721759 ?auto_721761 ) ) ( not ( = ?auto_721759 ?auto_721762 ) ) ( not ( = ?auto_721759 ?auto_721763 ) ) ( not ( = ?auto_721759 ?auto_721764 ) ) ( not ( = ?auto_721759 ?auto_721765 ) ) ( not ( = ?auto_721759 ?auto_721766 ) ) ( not ( = ?auto_721759 ?auto_721767 ) ) ( not ( = ?auto_721759 ?auto_721768 ) ) ( not ( = ?auto_721759 ?auto_721769 ) ) ( not ( = ?auto_721759 ?auto_721770 ) ) ( not ( = ?auto_721759 ?auto_721771 ) ) ( not ( = ?auto_721759 ?auto_721772 ) ) ( not ( = ?auto_721759 ?auto_721773 ) ) ( not ( = ?auto_721759 ?auto_721774 ) ) ( not ( = ?auto_721760 ?auto_721761 ) ) ( not ( = ?auto_721760 ?auto_721762 ) ) ( not ( = ?auto_721760 ?auto_721763 ) ) ( not ( = ?auto_721760 ?auto_721764 ) ) ( not ( = ?auto_721760 ?auto_721765 ) ) ( not ( = ?auto_721760 ?auto_721766 ) ) ( not ( = ?auto_721760 ?auto_721767 ) ) ( not ( = ?auto_721760 ?auto_721768 ) ) ( not ( = ?auto_721760 ?auto_721769 ) ) ( not ( = ?auto_721760 ?auto_721770 ) ) ( not ( = ?auto_721760 ?auto_721771 ) ) ( not ( = ?auto_721760 ?auto_721772 ) ) ( not ( = ?auto_721760 ?auto_721773 ) ) ( not ( = ?auto_721760 ?auto_721774 ) ) ( not ( = ?auto_721761 ?auto_721762 ) ) ( not ( = ?auto_721761 ?auto_721763 ) ) ( not ( = ?auto_721761 ?auto_721764 ) ) ( not ( = ?auto_721761 ?auto_721765 ) ) ( not ( = ?auto_721761 ?auto_721766 ) ) ( not ( = ?auto_721761 ?auto_721767 ) ) ( not ( = ?auto_721761 ?auto_721768 ) ) ( not ( = ?auto_721761 ?auto_721769 ) ) ( not ( = ?auto_721761 ?auto_721770 ) ) ( not ( = ?auto_721761 ?auto_721771 ) ) ( not ( = ?auto_721761 ?auto_721772 ) ) ( not ( = ?auto_721761 ?auto_721773 ) ) ( not ( = ?auto_721761 ?auto_721774 ) ) ( not ( = ?auto_721762 ?auto_721763 ) ) ( not ( = ?auto_721762 ?auto_721764 ) ) ( not ( = ?auto_721762 ?auto_721765 ) ) ( not ( = ?auto_721762 ?auto_721766 ) ) ( not ( = ?auto_721762 ?auto_721767 ) ) ( not ( = ?auto_721762 ?auto_721768 ) ) ( not ( = ?auto_721762 ?auto_721769 ) ) ( not ( = ?auto_721762 ?auto_721770 ) ) ( not ( = ?auto_721762 ?auto_721771 ) ) ( not ( = ?auto_721762 ?auto_721772 ) ) ( not ( = ?auto_721762 ?auto_721773 ) ) ( not ( = ?auto_721762 ?auto_721774 ) ) ( not ( = ?auto_721763 ?auto_721764 ) ) ( not ( = ?auto_721763 ?auto_721765 ) ) ( not ( = ?auto_721763 ?auto_721766 ) ) ( not ( = ?auto_721763 ?auto_721767 ) ) ( not ( = ?auto_721763 ?auto_721768 ) ) ( not ( = ?auto_721763 ?auto_721769 ) ) ( not ( = ?auto_721763 ?auto_721770 ) ) ( not ( = ?auto_721763 ?auto_721771 ) ) ( not ( = ?auto_721763 ?auto_721772 ) ) ( not ( = ?auto_721763 ?auto_721773 ) ) ( not ( = ?auto_721763 ?auto_721774 ) ) ( not ( = ?auto_721764 ?auto_721765 ) ) ( not ( = ?auto_721764 ?auto_721766 ) ) ( not ( = ?auto_721764 ?auto_721767 ) ) ( not ( = ?auto_721764 ?auto_721768 ) ) ( not ( = ?auto_721764 ?auto_721769 ) ) ( not ( = ?auto_721764 ?auto_721770 ) ) ( not ( = ?auto_721764 ?auto_721771 ) ) ( not ( = ?auto_721764 ?auto_721772 ) ) ( not ( = ?auto_721764 ?auto_721773 ) ) ( not ( = ?auto_721764 ?auto_721774 ) ) ( not ( = ?auto_721765 ?auto_721766 ) ) ( not ( = ?auto_721765 ?auto_721767 ) ) ( not ( = ?auto_721765 ?auto_721768 ) ) ( not ( = ?auto_721765 ?auto_721769 ) ) ( not ( = ?auto_721765 ?auto_721770 ) ) ( not ( = ?auto_721765 ?auto_721771 ) ) ( not ( = ?auto_721765 ?auto_721772 ) ) ( not ( = ?auto_721765 ?auto_721773 ) ) ( not ( = ?auto_721765 ?auto_721774 ) ) ( not ( = ?auto_721766 ?auto_721767 ) ) ( not ( = ?auto_721766 ?auto_721768 ) ) ( not ( = ?auto_721766 ?auto_721769 ) ) ( not ( = ?auto_721766 ?auto_721770 ) ) ( not ( = ?auto_721766 ?auto_721771 ) ) ( not ( = ?auto_721766 ?auto_721772 ) ) ( not ( = ?auto_721766 ?auto_721773 ) ) ( not ( = ?auto_721766 ?auto_721774 ) ) ( not ( = ?auto_721767 ?auto_721768 ) ) ( not ( = ?auto_721767 ?auto_721769 ) ) ( not ( = ?auto_721767 ?auto_721770 ) ) ( not ( = ?auto_721767 ?auto_721771 ) ) ( not ( = ?auto_721767 ?auto_721772 ) ) ( not ( = ?auto_721767 ?auto_721773 ) ) ( not ( = ?auto_721767 ?auto_721774 ) ) ( not ( = ?auto_721768 ?auto_721769 ) ) ( not ( = ?auto_721768 ?auto_721770 ) ) ( not ( = ?auto_721768 ?auto_721771 ) ) ( not ( = ?auto_721768 ?auto_721772 ) ) ( not ( = ?auto_721768 ?auto_721773 ) ) ( not ( = ?auto_721768 ?auto_721774 ) ) ( not ( = ?auto_721769 ?auto_721770 ) ) ( not ( = ?auto_721769 ?auto_721771 ) ) ( not ( = ?auto_721769 ?auto_721772 ) ) ( not ( = ?auto_721769 ?auto_721773 ) ) ( not ( = ?auto_721769 ?auto_721774 ) ) ( not ( = ?auto_721770 ?auto_721771 ) ) ( not ( = ?auto_721770 ?auto_721772 ) ) ( not ( = ?auto_721770 ?auto_721773 ) ) ( not ( = ?auto_721770 ?auto_721774 ) ) ( not ( = ?auto_721771 ?auto_721772 ) ) ( not ( = ?auto_721771 ?auto_721773 ) ) ( not ( = ?auto_721771 ?auto_721774 ) ) ( not ( = ?auto_721772 ?auto_721773 ) ) ( not ( = ?auto_721772 ?auto_721774 ) ) ( not ( = ?auto_721773 ?auto_721774 ) ) ( ON ?auto_721772 ?auto_721773 ) ( ON ?auto_721771 ?auto_721772 ) ( CLEAR ?auto_721769 ) ( ON ?auto_721770 ?auto_721771 ) ( CLEAR ?auto_721770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_721759 ?auto_721760 ?auto_721761 ?auto_721762 ?auto_721763 ?auto_721764 ?auto_721765 ?auto_721766 ?auto_721767 ?auto_721768 ?auto_721769 ?auto_721770 )
      ( MAKE-15PILE ?auto_721759 ?auto_721760 ?auto_721761 ?auto_721762 ?auto_721763 ?auto_721764 ?auto_721765 ?auto_721766 ?auto_721767 ?auto_721768 ?auto_721769 ?auto_721770 ?auto_721771 ?auto_721772 ?auto_721773 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_721821 - BLOCK
      ?auto_721822 - BLOCK
      ?auto_721823 - BLOCK
      ?auto_721824 - BLOCK
      ?auto_721825 - BLOCK
      ?auto_721826 - BLOCK
      ?auto_721827 - BLOCK
      ?auto_721828 - BLOCK
      ?auto_721829 - BLOCK
      ?auto_721830 - BLOCK
      ?auto_721831 - BLOCK
      ?auto_721832 - BLOCK
      ?auto_721833 - BLOCK
      ?auto_721834 - BLOCK
      ?auto_721835 - BLOCK
    )
    :vars
    (
      ?auto_721836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721835 ?auto_721836 ) ( ON-TABLE ?auto_721821 ) ( ON ?auto_721822 ?auto_721821 ) ( ON ?auto_721823 ?auto_721822 ) ( ON ?auto_721824 ?auto_721823 ) ( ON ?auto_721825 ?auto_721824 ) ( ON ?auto_721826 ?auto_721825 ) ( ON ?auto_721827 ?auto_721826 ) ( ON ?auto_721828 ?auto_721827 ) ( ON ?auto_721829 ?auto_721828 ) ( ON ?auto_721830 ?auto_721829 ) ( not ( = ?auto_721821 ?auto_721822 ) ) ( not ( = ?auto_721821 ?auto_721823 ) ) ( not ( = ?auto_721821 ?auto_721824 ) ) ( not ( = ?auto_721821 ?auto_721825 ) ) ( not ( = ?auto_721821 ?auto_721826 ) ) ( not ( = ?auto_721821 ?auto_721827 ) ) ( not ( = ?auto_721821 ?auto_721828 ) ) ( not ( = ?auto_721821 ?auto_721829 ) ) ( not ( = ?auto_721821 ?auto_721830 ) ) ( not ( = ?auto_721821 ?auto_721831 ) ) ( not ( = ?auto_721821 ?auto_721832 ) ) ( not ( = ?auto_721821 ?auto_721833 ) ) ( not ( = ?auto_721821 ?auto_721834 ) ) ( not ( = ?auto_721821 ?auto_721835 ) ) ( not ( = ?auto_721821 ?auto_721836 ) ) ( not ( = ?auto_721822 ?auto_721823 ) ) ( not ( = ?auto_721822 ?auto_721824 ) ) ( not ( = ?auto_721822 ?auto_721825 ) ) ( not ( = ?auto_721822 ?auto_721826 ) ) ( not ( = ?auto_721822 ?auto_721827 ) ) ( not ( = ?auto_721822 ?auto_721828 ) ) ( not ( = ?auto_721822 ?auto_721829 ) ) ( not ( = ?auto_721822 ?auto_721830 ) ) ( not ( = ?auto_721822 ?auto_721831 ) ) ( not ( = ?auto_721822 ?auto_721832 ) ) ( not ( = ?auto_721822 ?auto_721833 ) ) ( not ( = ?auto_721822 ?auto_721834 ) ) ( not ( = ?auto_721822 ?auto_721835 ) ) ( not ( = ?auto_721822 ?auto_721836 ) ) ( not ( = ?auto_721823 ?auto_721824 ) ) ( not ( = ?auto_721823 ?auto_721825 ) ) ( not ( = ?auto_721823 ?auto_721826 ) ) ( not ( = ?auto_721823 ?auto_721827 ) ) ( not ( = ?auto_721823 ?auto_721828 ) ) ( not ( = ?auto_721823 ?auto_721829 ) ) ( not ( = ?auto_721823 ?auto_721830 ) ) ( not ( = ?auto_721823 ?auto_721831 ) ) ( not ( = ?auto_721823 ?auto_721832 ) ) ( not ( = ?auto_721823 ?auto_721833 ) ) ( not ( = ?auto_721823 ?auto_721834 ) ) ( not ( = ?auto_721823 ?auto_721835 ) ) ( not ( = ?auto_721823 ?auto_721836 ) ) ( not ( = ?auto_721824 ?auto_721825 ) ) ( not ( = ?auto_721824 ?auto_721826 ) ) ( not ( = ?auto_721824 ?auto_721827 ) ) ( not ( = ?auto_721824 ?auto_721828 ) ) ( not ( = ?auto_721824 ?auto_721829 ) ) ( not ( = ?auto_721824 ?auto_721830 ) ) ( not ( = ?auto_721824 ?auto_721831 ) ) ( not ( = ?auto_721824 ?auto_721832 ) ) ( not ( = ?auto_721824 ?auto_721833 ) ) ( not ( = ?auto_721824 ?auto_721834 ) ) ( not ( = ?auto_721824 ?auto_721835 ) ) ( not ( = ?auto_721824 ?auto_721836 ) ) ( not ( = ?auto_721825 ?auto_721826 ) ) ( not ( = ?auto_721825 ?auto_721827 ) ) ( not ( = ?auto_721825 ?auto_721828 ) ) ( not ( = ?auto_721825 ?auto_721829 ) ) ( not ( = ?auto_721825 ?auto_721830 ) ) ( not ( = ?auto_721825 ?auto_721831 ) ) ( not ( = ?auto_721825 ?auto_721832 ) ) ( not ( = ?auto_721825 ?auto_721833 ) ) ( not ( = ?auto_721825 ?auto_721834 ) ) ( not ( = ?auto_721825 ?auto_721835 ) ) ( not ( = ?auto_721825 ?auto_721836 ) ) ( not ( = ?auto_721826 ?auto_721827 ) ) ( not ( = ?auto_721826 ?auto_721828 ) ) ( not ( = ?auto_721826 ?auto_721829 ) ) ( not ( = ?auto_721826 ?auto_721830 ) ) ( not ( = ?auto_721826 ?auto_721831 ) ) ( not ( = ?auto_721826 ?auto_721832 ) ) ( not ( = ?auto_721826 ?auto_721833 ) ) ( not ( = ?auto_721826 ?auto_721834 ) ) ( not ( = ?auto_721826 ?auto_721835 ) ) ( not ( = ?auto_721826 ?auto_721836 ) ) ( not ( = ?auto_721827 ?auto_721828 ) ) ( not ( = ?auto_721827 ?auto_721829 ) ) ( not ( = ?auto_721827 ?auto_721830 ) ) ( not ( = ?auto_721827 ?auto_721831 ) ) ( not ( = ?auto_721827 ?auto_721832 ) ) ( not ( = ?auto_721827 ?auto_721833 ) ) ( not ( = ?auto_721827 ?auto_721834 ) ) ( not ( = ?auto_721827 ?auto_721835 ) ) ( not ( = ?auto_721827 ?auto_721836 ) ) ( not ( = ?auto_721828 ?auto_721829 ) ) ( not ( = ?auto_721828 ?auto_721830 ) ) ( not ( = ?auto_721828 ?auto_721831 ) ) ( not ( = ?auto_721828 ?auto_721832 ) ) ( not ( = ?auto_721828 ?auto_721833 ) ) ( not ( = ?auto_721828 ?auto_721834 ) ) ( not ( = ?auto_721828 ?auto_721835 ) ) ( not ( = ?auto_721828 ?auto_721836 ) ) ( not ( = ?auto_721829 ?auto_721830 ) ) ( not ( = ?auto_721829 ?auto_721831 ) ) ( not ( = ?auto_721829 ?auto_721832 ) ) ( not ( = ?auto_721829 ?auto_721833 ) ) ( not ( = ?auto_721829 ?auto_721834 ) ) ( not ( = ?auto_721829 ?auto_721835 ) ) ( not ( = ?auto_721829 ?auto_721836 ) ) ( not ( = ?auto_721830 ?auto_721831 ) ) ( not ( = ?auto_721830 ?auto_721832 ) ) ( not ( = ?auto_721830 ?auto_721833 ) ) ( not ( = ?auto_721830 ?auto_721834 ) ) ( not ( = ?auto_721830 ?auto_721835 ) ) ( not ( = ?auto_721830 ?auto_721836 ) ) ( not ( = ?auto_721831 ?auto_721832 ) ) ( not ( = ?auto_721831 ?auto_721833 ) ) ( not ( = ?auto_721831 ?auto_721834 ) ) ( not ( = ?auto_721831 ?auto_721835 ) ) ( not ( = ?auto_721831 ?auto_721836 ) ) ( not ( = ?auto_721832 ?auto_721833 ) ) ( not ( = ?auto_721832 ?auto_721834 ) ) ( not ( = ?auto_721832 ?auto_721835 ) ) ( not ( = ?auto_721832 ?auto_721836 ) ) ( not ( = ?auto_721833 ?auto_721834 ) ) ( not ( = ?auto_721833 ?auto_721835 ) ) ( not ( = ?auto_721833 ?auto_721836 ) ) ( not ( = ?auto_721834 ?auto_721835 ) ) ( not ( = ?auto_721834 ?auto_721836 ) ) ( not ( = ?auto_721835 ?auto_721836 ) ) ( ON ?auto_721834 ?auto_721835 ) ( ON ?auto_721833 ?auto_721834 ) ( ON ?auto_721832 ?auto_721833 ) ( CLEAR ?auto_721830 ) ( ON ?auto_721831 ?auto_721832 ) ( CLEAR ?auto_721831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_721821 ?auto_721822 ?auto_721823 ?auto_721824 ?auto_721825 ?auto_721826 ?auto_721827 ?auto_721828 ?auto_721829 ?auto_721830 ?auto_721831 )
      ( MAKE-15PILE ?auto_721821 ?auto_721822 ?auto_721823 ?auto_721824 ?auto_721825 ?auto_721826 ?auto_721827 ?auto_721828 ?auto_721829 ?auto_721830 ?auto_721831 ?auto_721832 ?auto_721833 ?auto_721834 ?auto_721835 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_721883 - BLOCK
      ?auto_721884 - BLOCK
      ?auto_721885 - BLOCK
      ?auto_721886 - BLOCK
      ?auto_721887 - BLOCK
      ?auto_721888 - BLOCK
      ?auto_721889 - BLOCK
      ?auto_721890 - BLOCK
      ?auto_721891 - BLOCK
      ?auto_721892 - BLOCK
      ?auto_721893 - BLOCK
      ?auto_721894 - BLOCK
      ?auto_721895 - BLOCK
      ?auto_721896 - BLOCK
      ?auto_721897 - BLOCK
    )
    :vars
    (
      ?auto_721898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721897 ?auto_721898 ) ( ON-TABLE ?auto_721883 ) ( ON ?auto_721884 ?auto_721883 ) ( ON ?auto_721885 ?auto_721884 ) ( ON ?auto_721886 ?auto_721885 ) ( ON ?auto_721887 ?auto_721886 ) ( ON ?auto_721888 ?auto_721887 ) ( ON ?auto_721889 ?auto_721888 ) ( ON ?auto_721890 ?auto_721889 ) ( ON ?auto_721891 ?auto_721890 ) ( not ( = ?auto_721883 ?auto_721884 ) ) ( not ( = ?auto_721883 ?auto_721885 ) ) ( not ( = ?auto_721883 ?auto_721886 ) ) ( not ( = ?auto_721883 ?auto_721887 ) ) ( not ( = ?auto_721883 ?auto_721888 ) ) ( not ( = ?auto_721883 ?auto_721889 ) ) ( not ( = ?auto_721883 ?auto_721890 ) ) ( not ( = ?auto_721883 ?auto_721891 ) ) ( not ( = ?auto_721883 ?auto_721892 ) ) ( not ( = ?auto_721883 ?auto_721893 ) ) ( not ( = ?auto_721883 ?auto_721894 ) ) ( not ( = ?auto_721883 ?auto_721895 ) ) ( not ( = ?auto_721883 ?auto_721896 ) ) ( not ( = ?auto_721883 ?auto_721897 ) ) ( not ( = ?auto_721883 ?auto_721898 ) ) ( not ( = ?auto_721884 ?auto_721885 ) ) ( not ( = ?auto_721884 ?auto_721886 ) ) ( not ( = ?auto_721884 ?auto_721887 ) ) ( not ( = ?auto_721884 ?auto_721888 ) ) ( not ( = ?auto_721884 ?auto_721889 ) ) ( not ( = ?auto_721884 ?auto_721890 ) ) ( not ( = ?auto_721884 ?auto_721891 ) ) ( not ( = ?auto_721884 ?auto_721892 ) ) ( not ( = ?auto_721884 ?auto_721893 ) ) ( not ( = ?auto_721884 ?auto_721894 ) ) ( not ( = ?auto_721884 ?auto_721895 ) ) ( not ( = ?auto_721884 ?auto_721896 ) ) ( not ( = ?auto_721884 ?auto_721897 ) ) ( not ( = ?auto_721884 ?auto_721898 ) ) ( not ( = ?auto_721885 ?auto_721886 ) ) ( not ( = ?auto_721885 ?auto_721887 ) ) ( not ( = ?auto_721885 ?auto_721888 ) ) ( not ( = ?auto_721885 ?auto_721889 ) ) ( not ( = ?auto_721885 ?auto_721890 ) ) ( not ( = ?auto_721885 ?auto_721891 ) ) ( not ( = ?auto_721885 ?auto_721892 ) ) ( not ( = ?auto_721885 ?auto_721893 ) ) ( not ( = ?auto_721885 ?auto_721894 ) ) ( not ( = ?auto_721885 ?auto_721895 ) ) ( not ( = ?auto_721885 ?auto_721896 ) ) ( not ( = ?auto_721885 ?auto_721897 ) ) ( not ( = ?auto_721885 ?auto_721898 ) ) ( not ( = ?auto_721886 ?auto_721887 ) ) ( not ( = ?auto_721886 ?auto_721888 ) ) ( not ( = ?auto_721886 ?auto_721889 ) ) ( not ( = ?auto_721886 ?auto_721890 ) ) ( not ( = ?auto_721886 ?auto_721891 ) ) ( not ( = ?auto_721886 ?auto_721892 ) ) ( not ( = ?auto_721886 ?auto_721893 ) ) ( not ( = ?auto_721886 ?auto_721894 ) ) ( not ( = ?auto_721886 ?auto_721895 ) ) ( not ( = ?auto_721886 ?auto_721896 ) ) ( not ( = ?auto_721886 ?auto_721897 ) ) ( not ( = ?auto_721886 ?auto_721898 ) ) ( not ( = ?auto_721887 ?auto_721888 ) ) ( not ( = ?auto_721887 ?auto_721889 ) ) ( not ( = ?auto_721887 ?auto_721890 ) ) ( not ( = ?auto_721887 ?auto_721891 ) ) ( not ( = ?auto_721887 ?auto_721892 ) ) ( not ( = ?auto_721887 ?auto_721893 ) ) ( not ( = ?auto_721887 ?auto_721894 ) ) ( not ( = ?auto_721887 ?auto_721895 ) ) ( not ( = ?auto_721887 ?auto_721896 ) ) ( not ( = ?auto_721887 ?auto_721897 ) ) ( not ( = ?auto_721887 ?auto_721898 ) ) ( not ( = ?auto_721888 ?auto_721889 ) ) ( not ( = ?auto_721888 ?auto_721890 ) ) ( not ( = ?auto_721888 ?auto_721891 ) ) ( not ( = ?auto_721888 ?auto_721892 ) ) ( not ( = ?auto_721888 ?auto_721893 ) ) ( not ( = ?auto_721888 ?auto_721894 ) ) ( not ( = ?auto_721888 ?auto_721895 ) ) ( not ( = ?auto_721888 ?auto_721896 ) ) ( not ( = ?auto_721888 ?auto_721897 ) ) ( not ( = ?auto_721888 ?auto_721898 ) ) ( not ( = ?auto_721889 ?auto_721890 ) ) ( not ( = ?auto_721889 ?auto_721891 ) ) ( not ( = ?auto_721889 ?auto_721892 ) ) ( not ( = ?auto_721889 ?auto_721893 ) ) ( not ( = ?auto_721889 ?auto_721894 ) ) ( not ( = ?auto_721889 ?auto_721895 ) ) ( not ( = ?auto_721889 ?auto_721896 ) ) ( not ( = ?auto_721889 ?auto_721897 ) ) ( not ( = ?auto_721889 ?auto_721898 ) ) ( not ( = ?auto_721890 ?auto_721891 ) ) ( not ( = ?auto_721890 ?auto_721892 ) ) ( not ( = ?auto_721890 ?auto_721893 ) ) ( not ( = ?auto_721890 ?auto_721894 ) ) ( not ( = ?auto_721890 ?auto_721895 ) ) ( not ( = ?auto_721890 ?auto_721896 ) ) ( not ( = ?auto_721890 ?auto_721897 ) ) ( not ( = ?auto_721890 ?auto_721898 ) ) ( not ( = ?auto_721891 ?auto_721892 ) ) ( not ( = ?auto_721891 ?auto_721893 ) ) ( not ( = ?auto_721891 ?auto_721894 ) ) ( not ( = ?auto_721891 ?auto_721895 ) ) ( not ( = ?auto_721891 ?auto_721896 ) ) ( not ( = ?auto_721891 ?auto_721897 ) ) ( not ( = ?auto_721891 ?auto_721898 ) ) ( not ( = ?auto_721892 ?auto_721893 ) ) ( not ( = ?auto_721892 ?auto_721894 ) ) ( not ( = ?auto_721892 ?auto_721895 ) ) ( not ( = ?auto_721892 ?auto_721896 ) ) ( not ( = ?auto_721892 ?auto_721897 ) ) ( not ( = ?auto_721892 ?auto_721898 ) ) ( not ( = ?auto_721893 ?auto_721894 ) ) ( not ( = ?auto_721893 ?auto_721895 ) ) ( not ( = ?auto_721893 ?auto_721896 ) ) ( not ( = ?auto_721893 ?auto_721897 ) ) ( not ( = ?auto_721893 ?auto_721898 ) ) ( not ( = ?auto_721894 ?auto_721895 ) ) ( not ( = ?auto_721894 ?auto_721896 ) ) ( not ( = ?auto_721894 ?auto_721897 ) ) ( not ( = ?auto_721894 ?auto_721898 ) ) ( not ( = ?auto_721895 ?auto_721896 ) ) ( not ( = ?auto_721895 ?auto_721897 ) ) ( not ( = ?auto_721895 ?auto_721898 ) ) ( not ( = ?auto_721896 ?auto_721897 ) ) ( not ( = ?auto_721896 ?auto_721898 ) ) ( not ( = ?auto_721897 ?auto_721898 ) ) ( ON ?auto_721896 ?auto_721897 ) ( ON ?auto_721895 ?auto_721896 ) ( ON ?auto_721894 ?auto_721895 ) ( ON ?auto_721893 ?auto_721894 ) ( CLEAR ?auto_721891 ) ( ON ?auto_721892 ?auto_721893 ) ( CLEAR ?auto_721892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_721883 ?auto_721884 ?auto_721885 ?auto_721886 ?auto_721887 ?auto_721888 ?auto_721889 ?auto_721890 ?auto_721891 ?auto_721892 )
      ( MAKE-15PILE ?auto_721883 ?auto_721884 ?auto_721885 ?auto_721886 ?auto_721887 ?auto_721888 ?auto_721889 ?auto_721890 ?auto_721891 ?auto_721892 ?auto_721893 ?auto_721894 ?auto_721895 ?auto_721896 ?auto_721897 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_721945 - BLOCK
      ?auto_721946 - BLOCK
      ?auto_721947 - BLOCK
      ?auto_721948 - BLOCK
      ?auto_721949 - BLOCK
      ?auto_721950 - BLOCK
      ?auto_721951 - BLOCK
      ?auto_721952 - BLOCK
      ?auto_721953 - BLOCK
      ?auto_721954 - BLOCK
      ?auto_721955 - BLOCK
      ?auto_721956 - BLOCK
      ?auto_721957 - BLOCK
      ?auto_721958 - BLOCK
      ?auto_721959 - BLOCK
    )
    :vars
    (
      ?auto_721960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_721959 ?auto_721960 ) ( ON-TABLE ?auto_721945 ) ( ON ?auto_721946 ?auto_721945 ) ( ON ?auto_721947 ?auto_721946 ) ( ON ?auto_721948 ?auto_721947 ) ( ON ?auto_721949 ?auto_721948 ) ( ON ?auto_721950 ?auto_721949 ) ( ON ?auto_721951 ?auto_721950 ) ( ON ?auto_721952 ?auto_721951 ) ( not ( = ?auto_721945 ?auto_721946 ) ) ( not ( = ?auto_721945 ?auto_721947 ) ) ( not ( = ?auto_721945 ?auto_721948 ) ) ( not ( = ?auto_721945 ?auto_721949 ) ) ( not ( = ?auto_721945 ?auto_721950 ) ) ( not ( = ?auto_721945 ?auto_721951 ) ) ( not ( = ?auto_721945 ?auto_721952 ) ) ( not ( = ?auto_721945 ?auto_721953 ) ) ( not ( = ?auto_721945 ?auto_721954 ) ) ( not ( = ?auto_721945 ?auto_721955 ) ) ( not ( = ?auto_721945 ?auto_721956 ) ) ( not ( = ?auto_721945 ?auto_721957 ) ) ( not ( = ?auto_721945 ?auto_721958 ) ) ( not ( = ?auto_721945 ?auto_721959 ) ) ( not ( = ?auto_721945 ?auto_721960 ) ) ( not ( = ?auto_721946 ?auto_721947 ) ) ( not ( = ?auto_721946 ?auto_721948 ) ) ( not ( = ?auto_721946 ?auto_721949 ) ) ( not ( = ?auto_721946 ?auto_721950 ) ) ( not ( = ?auto_721946 ?auto_721951 ) ) ( not ( = ?auto_721946 ?auto_721952 ) ) ( not ( = ?auto_721946 ?auto_721953 ) ) ( not ( = ?auto_721946 ?auto_721954 ) ) ( not ( = ?auto_721946 ?auto_721955 ) ) ( not ( = ?auto_721946 ?auto_721956 ) ) ( not ( = ?auto_721946 ?auto_721957 ) ) ( not ( = ?auto_721946 ?auto_721958 ) ) ( not ( = ?auto_721946 ?auto_721959 ) ) ( not ( = ?auto_721946 ?auto_721960 ) ) ( not ( = ?auto_721947 ?auto_721948 ) ) ( not ( = ?auto_721947 ?auto_721949 ) ) ( not ( = ?auto_721947 ?auto_721950 ) ) ( not ( = ?auto_721947 ?auto_721951 ) ) ( not ( = ?auto_721947 ?auto_721952 ) ) ( not ( = ?auto_721947 ?auto_721953 ) ) ( not ( = ?auto_721947 ?auto_721954 ) ) ( not ( = ?auto_721947 ?auto_721955 ) ) ( not ( = ?auto_721947 ?auto_721956 ) ) ( not ( = ?auto_721947 ?auto_721957 ) ) ( not ( = ?auto_721947 ?auto_721958 ) ) ( not ( = ?auto_721947 ?auto_721959 ) ) ( not ( = ?auto_721947 ?auto_721960 ) ) ( not ( = ?auto_721948 ?auto_721949 ) ) ( not ( = ?auto_721948 ?auto_721950 ) ) ( not ( = ?auto_721948 ?auto_721951 ) ) ( not ( = ?auto_721948 ?auto_721952 ) ) ( not ( = ?auto_721948 ?auto_721953 ) ) ( not ( = ?auto_721948 ?auto_721954 ) ) ( not ( = ?auto_721948 ?auto_721955 ) ) ( not ( = ?auto_721948 ?auto_721956 ) ) ( not ( = ?auto_721948 ?auto_721957 ) ) ( not ( = ?auto_721948 ?auto_721958 ) ) ( not ( = ?auto_721948 ?auto_721959 ) ) ( not ( = ?auto_721948 ?auto_721960 ) ) ( not ( = ?auto_721949 ?auto_721950 ) ) ( not ( = ?auto_721949 ?auto_721951 ) ) ( not ( = ?auto_721949 ?auto_721952 ) ) ( not ( = ?auto_721949 ?auto_721953 ) ) ( not ( = ?auto_721949 ?auto_721954 ) ) ( not ( = ?auto_721949 ?auto_721955 ) ) ( not ( = ?auto_721949 ?auto_721956 ) ) ( not ( = ?auto_721949 ?auto_721957 ) ) ( not ( = ?auto_721949 ?auto_721958 ) ) ( not ( = ?auto_721949 ?auto_721959 ) ) ( not ( = ?auto_721949 ?auto_721960 ) ) ( not ( = ?auto_721950 ?auto_721951 ) ) ( not ( = ?auto_721950 ?auto_721952 ) ) ( not ( = ?auto_721950 ?auto_721953 ) ) ( not ( = ?auto_721950 ?auto_721954 ) ) ( not ( = ?auto_721950 ?auto_721955 ) ) ( not ( = ?auto_721950 ?auto_721956 ) ) ( not ( = ?auto_721950 ?auto_721957 ) ) ( not ( = ?auto_721950 ?auto_721958 ) ) ( not ( = ?auto_721950 ?auto_721959 ) ) ( not ( = ?auto_721950 ?auto_721960 ) ) ( not ( = ?auto_721951 ?auto_721952 ) ) ( not ( = ?auto_721951 ?auto_721953 ) ) ( not ( = ?auto_721951 ?auto_721954 ) ) ( not ( = ?auto_721951 ?auto_721955 ) ) ( not ( = ?auto_721951 ?auto_721956 ) ) ( not ( = ?auto_721951 ?auto_721957 ) ) ( not ( = ?auto_721951 ?auto_721958 ) ) ( not ( = ?auto_721951 ?auto_721959 ) ) ( not ( = ?auto_721951 ?auto_721960 ) ) ( not ( = ?auto_721952 ?auto_721953 ) ) ( not ( = ?auto_721952 ?auto_721954 ) ) ( not ( = ?auto_721952 ?auto_721955 ) ) ( not ( = ?auto_721952 ?auto_721956 ) ) ( not ( = ?auto_721952 ?auto_721957 ) ) ( not ( = ?auto_721952 ?auto_721958 ) ) ( not ( = ?auto_721952 ?auto_721959 ) ) ( not ( = ?auto_721952 ?auto_721960 ) ) ( not ( = ?auto_721953 ?auto_721954 ) ) ( not ( = ?auto_721953 ?auto_721955 ) ) ( not ( = ?auto_721953 ?auto_721956 ) ) ( not ( = ?auto_721953 ?auto_721957 ) ) ( not ( = ?auto_721953 ?auto_721958 ) ) ( not ( = ?auto_721953 ?auto_721959 ) ) ( not ( = ?auto_721953 ?auto_721960 ) ) ( not ( = ?auto_721954 ?auto_721955 ) ) ( not ( = ?auto_721954 ?auto_721956 ) ) ( not ( = ?auto_721954 ?auto_721957 ) ) ( not ( = ?auto_721954 ?auto_721958 ) ) ( not ( = ?auto_721954 ?auto_721959 ) ) ( not ( = ?auto_721954 ?auto_721960 ) ) ( not ( = ?auto_721955 ?auto_721956 ) ) ( not ( = ?auto_721955 ?auto_721957 ) ) ( not ( = ?auto_721955 ?auto_721958 ) ) ( not ( = ?auto_721955 ?auto_721959 ) ) ( not ( = ?auto_721955 ?auto_721960 ) ) ( not ( = ?auto_721956 ?auto_721957 ) ) ( not ( = ?auto_721956 ?auto_721958 ) ) ( not ( = ?auto_721956 ?auto_721959 ) ) ( not ( = ?auto_721956 ?auto_721960 ) ) ( not ( = ?auto_721957 ?auto_721958 ) ) ( not ( = ?auto_721957 ?auto_721959 ) ) ( not ( = ?auto_721957 ?auto_721960 ) ) ( not ( = ?auto_721958 ?auto_721959 ) ) ( not ( = ?auto_721958 ?auto_721960 ) ) ( not ( = ?auto_721959 ?auto_721960 ) ) ( ON ?auto_721958 ?auto_721959 ) ( ON ?auto_721957 ?auto_721958 ) ( ON ?auto_721956 ?auto_721957 ) ( ON ?auto_721955 ?auto_721956 ) ( ON ?auto_721954 ?auto_721955 ) ( CLEAR ?auto_721952 ) ( ON ?auto_721953 ?auto_721954 ) ( CLEAR ?auto_721953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_721945 ?auto_721946 ?auto_721947 ?auto_721948 ?auto_721949 ?auto_721950 ?auto_721951 ?auto_721952 ?auto_721953 )
      ( MAKE-15PILE ?auto_721945 ?auto_721946 ?auto_721947 ?auto_721948 ?auto_721949 ?auto_721950 ?auto_721951 ?auto_721952 ?auto_721953 ?auto_721954 ?auto_721955 ?auto_721956 ?auto_721957 ?auto_721958 ?auto_721959 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722007 - BLOCK
      ?auto_722008 - BLOCK
      ?auto_722009 - BLOCK
      ?auto_722010 - BLOCK
      ?auto_722011 - BLOCK
      ?auto_722012 - BLOCK
      ?auto_722013 - BLOCK
      ?auto_722014 - BLOCK
      ?auto_722015 - BLOCK
      ?auto_722016 - BLOCK
      ?auto_722017 - BLOCK
      ?auto_722018 - BLOCK
      ?auto_722019 - BLOCK
      ?auto_722020 - BLOCK
      ?auto_722021 - BLOCK
    )
    :vars
    (
      ?auto_722022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722021 ?auto_722022 ) ( ON-TABLE ?auto_722007 ) ( ON ?auto_722008 ?auto_722007 ) ( ON ?auto_722009 ?auto_722008 ) ( ON ?auto_722010 ?auto_722009 ) ( ON ?auto_722011 ?auto_722010 ) ( ON ?auto_722012 ?auto_722011 ) ( ON ?auto_722013 ?auto_722012 ) ( not ( = ?auto_722007 ?auto_722008 ) ) ( not ( = ?auto_722007 ?auto_722009 ) ) ( not ( = ?auto_722007 ?auto_722010 ) ) ( not ( = ?auto_722007 ?auto_722011 ) ) ( not ( = ?auto_722007 ?auto_722012 ) ) ( not ( = ?auto_722007 ?auto_722013 ) ) ( not ( = ?auto_722007 ?auto_722014 ) ) ( not ( = ?auto_722007 ?auto_722015 ) ) ( not ( = ?auto_722007 ?auto_722016 ) ) ( not ( = ?auto_722007 ?auto_722017 ) ) ( not ( = ?auto_722007 ?auto_722018 ) ) ( not ( = ?auto_722007 ?auto_722019 ) ) ( not ( = ?auto_722007 ?auto_722020 ) ) ( not ( = ?auto_722007 ?auto_722021 ) ) ( not ( = ?auto_722007 ?auto_722022 ) ) ( not ( = ?auto_722008 ?auto_722009 ) ) ( not ( = ?auto_722008 ?auto_722010 ) ) ( not ( = ?auto_722008 ?auto_722011 ) ) ( not ( = ?auto_722008 ?auto_722012 ) ) ( not ( = ?auto_722008 ?auto_722013 ) ) ( not ( = ?auto_722008 ?auto_722014 ) ) ( not ( = ?auto_722008 ?auto_722015 ) ) ( not ( = ?auto_722008 ?auto_722016 ) ) ( not ( = ?auto_722008 ?auto_722017 ) ) ( not ( = ?auto_722008 ?auto_722018 ) ) ( not ( = ?auto_722008 ?auto_722019 ) ) ( not ( = ?auto_722008 ?auto_722020 ) ) ( not ( = ?auto_722008 ?auto_722021 ) ) ( not ( = ?auto_722008 ?auto_722022 ) ) ( not ( = ?auto_722009 ?auto_722010 ) ) ( not ( = ?auto_722009 ?auto_722011 ) ) ( not ( = ?auto_722009 ?auto_722012 ) ) ( not ( = ?auto_722009 ?auto_722013 ) ) ( not ( = ?auto_722009 ?auto_722014 ) ) ( not ( = ?auto_722009 ?auto_722015 ) ) ( not ( = ?auto_722009 ?auto_722016 ) ) ( not ( = ?auto_722009 ?auto_722017 ) ) ( not ( = ?auto_722009 ?auto_722018 ) ) ( not ( = ?auto_722009 ?auto_722019 ) ) ( not ( = ?auto_722009 ?auto_722020 ) ) ( not ( = ?auto_722009 ?auto_722021 ) ) ( not ( = ?auto_722009 ?auto_722022 ) ) ( not ( = ?auto_722010 ?auto_722011 ) ) ( not ( = ?auto_722010 ?auto_722012 ) ) ( not ( = ?auto_722010 ?auto_722013 ) ) ( not ( = ?auto_722010 ?auto_722014 ) ) ( not ( = ?auto_722010 ?auto_722015 ) ) ( not ( = ?auto_722010 ?auto_722016 ) ) ( not ( = ?auto_722010 ?auto_722017 ) ) ( not ( = ?auto_722010 ?auto_722018 ) ) ( not ( = ?auto_722010 ?auto_722019 ) ) ( not ( = ?auto_722010 ?auto_722020 ) ) ( not ( = ?auto_722010 ?auto_722021 ) ) ( not ( = ?auto_722010 ?auto_722022 ) ) ( not ( = ?auto_722011 ?auto_722012 ) ) ( not ( = ?auto_722011 ?auto_722013 ) ) ( not ( = ?auto_722011 ?auto_722014 ) ) ( not ( = ?auto_722011 ?auto_722015 ) ) ( not ( = ?auto_722011 ?auto_722016 ) ) ( not ( = ?auto_722011 ?auto_722017 ) ) ( not ( = ?auto_722011 ?auto_722018 ) ) ( not ( = ?auto_722011 ?auto_722019 ) ) ( not ( = ?auto_722011 ?auto_722020 ) ) ( not ( = ?auto_722011 ?auto_722021 ) ) ( not ( = ?auto_722011 ?auto_722022 ) ) ( not ( = ?auto_722012 ?auto_722013 ) ) ( not ( = ?auto_722012 ?auto_722014 ) ) ( not ( = ?auto_722012 ?auto_722015 ) ) ( not ( = ?auto_722012 ?auto_722016 ) ) ( not ( = ?auto_722012 ?auto_722017 ) ) ( not ( = ?auto_722012 ?auto_722018 ) ) ( not ( = ?auto_722012 ?auto_722019 ) ) ( not ( = ?auto_722012 ?auto_722020 ) ) ( not ( = ?auto_722012 ?auto_722021 ) ) ( not ( = ?auto_722012 ?auto_722022 ) ) ( not ( = ?auto_722013 ?auto_722014 ) ) ( not ( = ?auto_722013 ?auto_722015 ) ) ( not ( = ?auto_722013 ?auto_722016 ) ) ( not ( = ?auto_722013 ?auto_722017 ) ) ( not ( = ?auto_722013 ?auto_722018 ) ) ( not ( = ?auto_722013 ?auto_722019 ) ) ( not ( = ?auto_722013 ?auto_722020 ) ) ( not ( = ?auto_722013 ?auto_722021 ) ) ( not ( = ?auto_722013 ?auto_722022 ) ) ( not ( = ?auto_722014 ?auto_722015 ) ) ( not ( = ?auto_722014 ?auto_722016 ) ) ( not ( = ?auto_722014 ?auto_722017 ) ) ( not ( = ?auto_722014 ?auto_722018 ) ) ( not ( = ?auto_722014 ?auto_722019 ) ) ( not ( = ?auto_722014 ?auto_722020 ) ) ( not ( = ?auto_722014 ?auto_722021 ) ) ( not ( = ?auto_722014 ?auto_722022 ) ) ( not ( = ?auto_722015 ?auto_722016 ) ) ( not ( = ?auto_722015 ?auto_722017 ) ) ( not ( = ?auto_722015 ?auto_722018 ) ) ( not ( = ?auto_722015 ?auto_722019 ) ) ( not ( = ?auto_722015 ?auto_722020 ) ) ( not ( = ?auto_722015 ?auto_722021 ) ) ( not ( = ?auto_722015 ?auto_722022 ) ) ( not ( = ?auto_722016 ?auto_722017 ) ) ( not ( = ?auto_722016 ?auto_722018 ) ) ( not ( = ?auto_722016 ?auto_722019 ) ) ( not ( = ?auto_722016 ?auto_722020 ) ) ( not ( = ?auto_722016 ?auto_722021 ) ) ( not ( = ?auto_722016 ?auto_722022 ) ) ( not ( = ?auto_722017 ?auto_722018 ) ) ( not ( = ?auto_722017 ?auto_722019 ) ) ( not ( = ?auto_722017 ?auto_722020 ) ) ( not ( = ?auto_722017 ?auto_722021 ) ) ( not ( = ?auto_722017 ?auto_722022 ) ) ( not ( = ?auto_722018 ?auto_722019 ) ) ( not ( = ?auto_722018 ?auto_722020 ) ) ( not ( = ?auto_722018 ?auto_722021 ) ) ( not ( = ?auto_722018 ?auto_722022 ) ) ( not ( = ?auto_722019 ?auto_722020 ) ) ( not ( = ?auto_722019 ?auto_722021 ) ) ( not ( = ?auto_722019 ?auto_722022 ) ) ( not ( = ?auto_722020 ?auto_722021 ) ) ( not ( = ?auto_722020 ?auto_722022 ) ) ( not ( = ?auto_722021 ?auto_722022 ) ) ( ON ?auto_722020 ?auto_722021 ) ( ON ?auto_722019 ?auto_722020 ) ( ON ?auto_722018 ?auto_722019 ) ( ON ?auto_722017 ?auto_722018 ) ( ON ?auto_722016 ?auto_722017 ) ( ON ?auto_722015 ?auto_722016 ) ( CLEAR ?auto_722013 ) ( ON ?auto_722014 ?auto_722015 ) ( CLEAR ?auto_722014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_722007 ?auto_722008 ?auto_722009 ?auto_722010 ?auto_722011 ?auto_722012 ?auto_722013 ?auto_722014 )
      ( MAKE-15PILE ?auto_722007 ?auto_722008 ?auto_722009 ?auto_722010 ?auto_722011 ?auto_722012 ?auto_722013 ?auto_722014 ?auto_722015 ?auto_722016 ?auto_722017 ?auto_722018 ?auto_722019 ?auto_722020 ?auto_722021 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722069 - BLOCK
      ?auto_722070 - BLOCK
      ?auto_722071 - BLOCK
      ?auto_722072 - BLOCK
      ?auto_722073 - BLOCK
      ?auto_722074 - BLOCK
      ?auto_722075 - BLOCK
      ?auto_722076 - BLOCK
      ?auto_722077 - BLOCK
      ?auto_722078 - BLOCK
      ?auto_722079 - BLOCK
      ?auto_722080 - BLOCK
      ?auto_722081 - BLOCK
      ?auto_722082 - BLOCK
      ?auto_722083 - BLOCK
    )
    :vars
    (
      ?auto_722084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722083 ?auto_722084 ) ( ON-TABLE ?auto_722069 ) ( ON ?auto_722070 ?auto_722069 ) ( ON ?auto_722071 ?auto_722070 ) ( ON ?auto_722072 ?auto_722071 ) ( ON ?auto_722073 ?auto_722072 ) ( ON ?auto_722074 ?auto_722073 ) ( not ( = ?auto_722069 ?auto_722070 ) ) ( not ( = ?auto_722069 ?auto_722071 ) ) ( not ( = ?auto_722069 ?auto_722072 ) ) ( not ( = ?auto_722069 ?auto_722073 ) ) ( not ( = ?auto_722069 ?auto_722074 ) ) ( not ( = ?auto_722069 ?auto_722075 ) ) ( not ( = ?auto_722069 ?auto_722076 ) ) ( not ( = ?auto_722069 ?auto_722077 ) ) ( not ( = ?auto_722069 ?auto_722078 ) ) ( not ( = ?auto_722069 ?auto_722079 ) ) ( not ( = ?auto_722069 ?auto_722080 ) ) ( not ( = ?auto_722069 ?auto_722081 ) ) ( not ( = ?auto_722069 ?auto_722082 ) ) ( not ( = ?auto_722069 ?auto_722083 ) ) ( not ( = ?auto_722069 ?auto_722084 ) ) ( not ( = ?auto_722070 ?auto_722071 ) ) ( not ( = ?auto_722070 ?auto_722072 ) ) ( not ( = ?auto_722070 ?auto_722073 ) ) ( not ( = ?auto_722070 ?auto_722074 ) ) ( not ( = ?auto_722070 ?auto_722075 ) ) ( not ( = ?auto_722070 ?auto_722076 ) ) ( not ( = ?auto_722070 ?auto_722077 ) ) ( not ( = ?auto_722070 ?auto_722078 ) ) ( not ( = ?auto_722070 ?auto_722079 ) ) ( not ( = ?auto_722070 ?auto_722080 ) ) ( not ( = ?auto_722070 ?auto_722081 ) ) ( not ( = ?auto_722070 ?auto_722082 ) ) ( not ( = ?auto_722070 ?auto_722083 ) ) ( not ( = ?auto_722070 ?auto_722084 ) ) ( not ( = ?auto_722071 ?auto_722072 ) ) ( not ( = ?auto_722071 ?auto_722073 ) ) ( not ( = ?auto_722071 ?auto_722074 ) ) ( not ( = ?auto_722071 ?auto_722075 ) ) ( not ( = ?auto_722071 ?auto_722076 ) ) ( not ( = ?auto_722071 ?auto_722077 ) ) ( not ( = ?auto_722071 ?auto_722078 ) ) ( not ( = ?auto_722071 ?auto_722079 ) ) ( not ( = ?auto_722071 ?auto_722080 ) ) ( not ( = ?auto_722071 ?auto_722081 ) ) ( not ( = ?auto_722071 ?auto_722082 ) ) ( not ( = ?auto_722071 ?auto_722083 ) ) ( not ( = ?auto_722071 ?auto_722084 ) ) ( not ( = ?auto_722072 ?auto_722073 ) ) ( not ( = ?auto_722072 ?auto_722074 ) ) ( not ( = ?auto_722072 ?auto_722075 ) ) ( not ( = ?auto_722072 ?auto_722076 ) ) ( not ( = ?auto_722072 ?auto_722077 ) ) ( not ( = ?auto_722072 ?auto_722078 ) ) ( not ( = ?auto_722072 ?auto_722079 ) ) ( not ( = ?auto_722072 ?auto_722080 ) ) ( not ( = ?auto_722072 ?auto_722081 ) ) ( not ( = ?auto_722072 ?auto_722082 ) ) ( not ( = ?auto_722072 ?auto_722083 ) ) ( not ( = ?auto_722072 ?auto_722084 ) ) ( not ( = ?auto_722073 ?auto_722074 ) ) ( not ( = ?auto_722073 ?auto_722075 ) ) ( not ( = ?auto_722073 ?auto_722076 ) ) ( not ( = ?auto_722073 ?auto_722077 ) ) ( not ( = ?auto_722073 ?auto_722078 ) ) ( not ( = ?auto_722073 ?auto_722079 ) ) ( not ( = ?auto_722073 ?auto_722080 ) ) ( not ( = ?auto_722073 ?auto_722081 ) ) ( not ( = ?auto_722073 ?auto_722082 ) ) ( not ( = ?auto_722073 ?auto_722083 ) ) ( not ( = ?auto_722073 ?auto_722084 ) ) ( not ( = ?auto_722074 ?auto_722075 ) ) ( not ( = ?auto_722074 ?auto_722076 ) ) ( not ( = ?auto_722074 ?auto_722077 ) ) ( not ( = ?auto_722074 ?auto_722078 ) ) ( not ( = ?auto_722074 ?auto_722079 ) ) ( not ( = ?auto_722074 ?auto_722080 ) ) ( not ( = ?auto_722074 ?auto_722081 ) ) ( not ( = ?auto_722074 ?auto_722082 ) ) ( not ( = ?auto_722074 ?auto_722083 ) ) ( not ( = ?auto_722074 ?auto_722084 ) ) ( not ( = ?auto_722075 ?auto_722076 ) ) ( not ( = ?auto_722075 ?auto_722077 ) ) ( not ( = ?auto_722075 ?auto_722078 ) ) ( not ( = ?auto_722075 ?auto_722079 ) ) ( not ( = ?auto_722075 ?auto_722080 ) ) ( not ( = ?auto_722075 ?auto_722081 ) ) ( not ( = ?auto_722075 ?auto_722082 ) ) ( not ( = ?auto_722075 ?auto_722083 ) ) ( not ( = ?auto_722075 ?auto_722084 ) ) ( not ( = ?auto_722076 ?auto_722077 ) ) ( not ( = ?auto_722076 ?auto_722078 ) ) ( not ( = ?auto_722076 ?auto_722079 ) ) ( not ( = ?auto_722076 ?auto_722080 ) ) ( not ( = ?auto_722076 ?auto_722081 ) ) ( not ( = ?auto_722076 ?auto_722082 ) ) ( not ( = ?auto_722076 ?auto_722083 ) ) ( not ( = ?auto_722076 ?auto_722084 ) ) ( not ( = ?auto_722077 ?auto_722078 ) ) ( not ( = ?auto_722077 ?auto_722079 ) ) ( not ( = ?auto_722077 ?auto_722080 ) ) ( not ( = ?auto_722077 ?auto_722081 ) ) ( not ( = ?auto_722077 ?auto_722082 ) ) ( not ( = ?auto_722077 ?auto_722083 ) ) ( not ( = ?auto_722077 ?auto_722084 ) ) ( not ( = ?auto_722078 ?auto_722079 ) ) ( not ( = ?auto_722078 ?auto_722080 ) ) ( not ( = ?auto_722078 ?auto_722081 ) ) ( not ( = ?auto_722078 ?auto_722082 ) ) ( not ( = ?auto_722078 ?auto_722083 ) ) ( not ( = ?auto_722078 ?auto_722084 ) ) ( not ( = ?auto_722079 ?auto_722080 ) ) ( not ( = ?auto_722079 ?auto_722081 ) ) ( not ( = ?auto_722079 ?auto_722082 ) ) ( not ( = ?auto_722079 ?auto_722083 ) ) ( not ( = ?auto_722079 ?auto_722084 ) ) ( not ( = ?auto_722080 ?auto_722081 ) ) ( not ( = ?auto_722080 ?auto_722082 ) ) ( not ( = ?auto_722080 ?auto_722083 ) ) ( not ( = ?auto_722080 ?auto_722084 ) ) ( not ( = ?auto_722081 ?auto_722082 ) ) ( not ( = ?auto_722081 ?auto_722083 ) ) ( not ( = ?auto_722081 ?auto_722084 ) ) ( not ( = ?auto_722082 ?auto_722083 ) ) ( not ( = ?auto_722082 ?auto_722084 ) ) ( not ( = ?auto_722083 ?auto_722084 ) ) ( ON ?auto_722082 ?auto_722083 ) ( ON ?auto_722081 ?auto_722082 ) ( ON ?auto_722080 ?auto_722081 ) ( ON ?auto_722079 ?auto_722080 ) ( ON ?auto_722078 ?auto_722079 ) ( ON ?auto_722077 ?auto_722078 ) ( ON ?auto_722076 ?auto_722077 ) ( CLEAR ?auto_722074 ) ( ON ?auto_722075 ?auto_722076 ) ( CLEAR ?auto_722075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_722069 ?auto_722070 ?auto_722071 ?auto_722072 ?auto_722073 ?auto_722074 ?auto_722075 )
      ( MAKE-15PILE ?auto_722069 ?auto_722070 ?auto_722071 ?auto_722072 ?auto_722073 ?auto_722074 ?auto_722075 ?auto_722076 ?auto_722077 ?auto_722078 ?auto_722079 ?auto_722080 ?auto_722081 ?auto_722082 ?auto_722083 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722131 - BLOCK
      ?auto_722132 - BLOCK
      ?auto_722133 - BLOCK
      ?auto_722134 - BLOCK
      ?auto_722135 - BLOCK
      ?auto_722136 - BLOCK
      ?auto_722137 - BLOCK
      ?auto_722138 - BLOCK
      ?auto_722139 - BLOCK
      ?auto_722140 - BLOCK
      ?auto_722141 - BLOCK
      ?auto_722142 - BLOCK
      ?auto_722143 - BLOCK
      ?auto_722144 - BLOCK
      ?auto_722145 - BLOCK
    )
    :vars
    (
      ?auto_722146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722145 ?auto_722146 ) ( ON-TABLE ?auto_722131 ) ( ON ?auto_722132 ?auto_722131 ) ( ON ?auto_722133 ?auto_722132 ) ( ON ?auto_722134 ?auto_722133 ) ( ON ?auto_722135 ?auto_722134 ) ( not ( = ?auto_722131 ?auto_722132 ) ) ( not ( = ?auto_722131 ?auto_722133 ) ) ( not ( = ?auto_722131 ?auto_722134 ) ) ( not ( = ?auto_722131 ?auto_722135 ) ) ( not ( = ?auto_722131 ?auto_722136 ) ) ( not ( = ?auto_722131 ?auto_722137 ) ) ( not ( = ?auto_722131 ?auto_722138 ) ) ( not ( = ?auto_722131 ?auto_722139 ) ) ( not ( = ?auto_722131 ?auto_722140 ) ) ( not ( = ?auto_722131 ?auto_722141 ) ) ( not ( = ?auto_722131 ?auto_722142 ) ) ( not ( = ?auto_722131 ?auto_722143 ) ) ( not ( = ?auto_722131 ?auto_722144 ) ) ( not ( = ?auto_722131 ?auto_722145 ) ) ( not ( = ?auto_722131 ?auto_722146 ) ) ( not ( = ?auto_722132 ?auto_722133 ) ) ( not ( = ?auto_722132 ?auto_722134 ) ) ( not ( = ?auto_722132 ?auto_722135 ) ) ( not ( = ?auto_722132 ?auto_722136 ) ) ( not ( = ?auto_722132 ?auto_722137 ) ) ( not ( = ?auto_722132 ?auto_722138 ) ) ( not ( = ?auto_722132 ?auto_722139 ) ) ( not ( = ?auto_722132 ?auto_722140 ) ) ( not ( = ?auto_722132 ?auto_722141 ) ) ( not ( = ?auto_722132 ?auto_722142 ) ) ( not ( = ?auto_722132 ?auto_722143 ) ) ( not ( = ?auto_722132 ?auto_722144 ) ) ( not ( = ?auto_722132 ?auto_722145 ) ) ( not ( = ?auto_722132 ?auto_722146 ) ) ( not ( = ?auto_722133 ?auto_722134 ) ) ( not ( = ?auto_722133 ?auto_722135 ) ) ( not ( = ?auto_722133 ?auto_722136 ) ) ( not ( = ?auto_722133 ?auto_722137 ) ) ( not ( = ?auto_722133 ?auto_722138 ) ) ( not ( = ?auto_722133 ?auto_722139 ) ) ( not ( = ?auto_722133 ?auto_722140 ) ) ( not ( = ?auto_722133 ?auto_722141 ) ) ( not ( = ?auto_722133 ?auto_722142 ) ) ( not ( = ?auto_722133 ?auto_722143 ) ) ( not ( = ?auto_722133 ?auto_722144 ) ) ( not ( = ?auto_722133 ?auto_722145 ) ) ( not ( = ?auto_722133 ?auto_722146 ) ) ( not ( = ?auto_722134 ?auto_722135 ) ) ( not ( = ?auto_722134 ?auto_722136 ) ) ( not ( = ?auto_722134 ?auto_722137 ) ) ( not ( = ?auto_722134 ?auto_722138 ) ) ( not ( = ?auto_722134 ?auto_722139 ) ) ( not ( = ?auto_722134 ?auto_722140 ) ) ( not ( = ?auto_722134 ?auto_722141 ) ) ( not ( = ?auto_722134 ?auto_722142 ) ) ( not ( = ?auto_722134 ?auto_722143 ) ) ( not ( = ?auto_722134 ?auto_722144 ) ) ( not ( = ?auto_722134 ?auto_722145 ) ) ( not ( = ?auto_722134 ?auto_722146 ) ) ( not ( = ?auto_722135 ?auto_722136 ) ) ( not ( = ?auto_722135 ?auto_722137 ) ) ( not ( = ?auto_722135 ?auto_722138 ) ) ( not ( = ?auto_722135 ?auto_722139 ) ) ( not ( = ?auto_722135 ?auto_722140 ) ) ( not ( = ?auto_722135 ?auto_722141 ) ) ( not ( = ?auto_722135 ?auto_722142 ) ) ( not ( = ?auto_722135 ?auto_722143 ) ) ( not ( = ?auto_722135 ?auto_722144 ) ) ( not ( = ?auto_722135 ?auto_722145 ) ) ( not ( = ?auto_722135 ?auto_722146 ) ) ( not ( = ?auto_722136 ?auto_722137 ) ) ( not ( = ?auto_722136 ?auto_722138 ) ) ( not ( = ?auto_722136 ?auto_722139 ) ) ( not ( = ?auto_722136 ?auto_722140 ) ) ( not ( = ?auto_722136 ?auto_722141 ) ) ( not ( = ?auto_722136 ?auto_722142 ) ) ( not ( = ?auto_722136 ?auto_722143 ) ) ( not ( = ?auto_722136 ?auto_722144 ) ) ( not ( = ?auto_722136 ?auto_722145 ) ) ( not ( = ?auto_722136 ?auto_722146 ) ) ( not ( = ?auto_722137 ?auto_722138 ) ) ( not ( = ?auto_722137 ?auto_722139 ) ) ( not ( = ?auto_722137 ?auto_722140 ) ) ( not ( = ?auto_722137 ?auto_722141 ) ) ( not ( = ?auto_722137 ?auto_722142 ) ) ( not ( = ?auto_722137 ?auto_722143 ) ) ( not ( = ?auto_722137 ?auto_722144 ) ) ( not ( = ?auto_722137 ?auto_722145 ) ) ( not ( = ?auto_722137 ?auto_722146 ) ) ( not ( = ?auto_722138 ?auto_722139 ) ) ( not ( = ?auto_722138 ?auto_722140 ) ) ( not ( = ?auto_722138 ?auto_722141 ) ) ( not ( = ?auto_722138 ?auto_722142 ) ) ( not ( = ?auto_722138 ?auto_722143 ) ) ( not ( = ?auto_722138 ?auto_722144 ) ) ( not ( = ?auto_722138 ?auto_722145 ) ) ( not ( = ?auto_722138 ?auto_722146 ) ) ( not ( = ?auto_722139 ?auto_722140 ) ) ( not ( = ?auto_722139 ?auto_722141 ) ) ( not ( = ?auto_722139 ?auto_722142 ) ) ( not ( = ?auto_722139 ?auto_722143 ) ) ( not ( = ?auto_722139 ?auto_722144 ) ) ( not ( = ?auto_722139 ?auto_722145 ) ) ( not ( = ?auto_722139 ?auto_722146 ) ) ( not ( = ?auto_722140 ?auto_722141 ) ) ( not ( = ?auto_722140 ?auto_722142 ) ) ( not ( = ?auto_722140 ?auto_722143 ) ) ( not ( = ?auto_722140 ?auto_722144 ) ) ( not ( = ?auto_722140 ?auto_722145 ) ) ( not ( = ?auto_722140 ?auto_722146 ) ) ( not ( = ?auto_722141 ?auto_722142 ) ) ( not ( = ?auto_722141 ?auto_722143 ) ) ( not ( = ?auto_722141 ?auto_722144 ) ) ( not ( = ?auto_722141 ?auto_722145 ) ) ( not ( = ?auto_722141 ?auto_722146 ) ) ( not ( = ?auto_722142 ?auto_722143 ) ) ( not ( = ?auto_722142 ?auto_722144 ) ) ( not ( = ?auto_722142 ?auto_722145 ) ) ( not ( = ?auto_722142 ?auto_722146 ) ) ( not ( = ?auto_722143 ?auto_722144 ) ) ( not ( = ?auto_722143 ?auto_722145 ) ) ( not ( = ?auto_722143 ?auto_722146 ) ) ( not ( = ?auto_722144 ?auto_722145 ) ) ( not ( = ?auto_722144 ?auto_722146 ) ) ( not ( = ?auto_722145 ?auto_722146 ) ) ( ON ?auto_722144 ?auto_722145 ) ( ON ?auto_722143 ?auto_722144 ) ( ON ?auto_722142 ?auto_722143 ) ( ON ?auto_722141 ?auto_722142 ) ( ON ?auto_722140 ?auto_722141 ) ( ON ?auto_722139 ?auto_722140 ) ( ON ?auto_722138 ?auto_722139 ) ( ON ?auto_722137 ?auto_722138 ) ( CLEAR ?auto_722135 ) ( ON ?auto_722136 ?auto_722137 ) ( CLEAR ?auto_722136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_722131 ?auto_722132 ?auto_722133 ?auto_722134 ?auto_722135 ?auto_722136 )
      ( MAKE-15PILE ?auto_722131 ?auto_722132 ?auto_722133 ?auto_722134 ?auto_722135 ?auto_722136 ?auto_722137 ?auto_722138 ?auto_722139 ?auto_722140 ?auto_722141 ?auto_722142 ?auto_722143 ?auto_722144 ?auto_722145 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722193 - BLOCK
      ?auto_722194 - BLOCK
      ?auto_722195 - BLOCK
      ?auto_722196 - BLOCK
      ?auto_722197 - BLOCK
      ?auto_722198 - BLOCK
      ?auto_722199 - BLOCK
      ?auto_722200 - BLOCK
      ?auto_722201 - BLOCK
      ?auto_722202 - BLOCK
      ?auto_722203 - BLOCK
      ?auto_722204 - BLOCK
      ?auto_722205 - BLOCK
      ?auto_722206 - BLOCK
      ?auto_722207 - BLOCK
    )
    :vars
    (
      ?auto_722208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722207 ?auto_722208 ) ( ON-TABLE ?auto_722193 ) ( ON ?auto_722194 ?auto_722193 ) ( ON ?auto_722195 ?auto_722194 ) ( ON ?auto_722196 ?auto_722195 ) ( not ( = ?auto_722193 ?auto_722194 ) ) ( not ( = ?auto_722193 ?auto_722195 ) ) ( not ( = ?auto_722193 ?auto_722196 ) ) ( not ( = ?auto_722193 ?auto_722197 ) ) ( not ( = ?auto_722193 ?auto_722198 ) ) ( not ( = ?auto_722193 ?auto_722199 ) ) ( not ( = ?auto_722193 ?auto_722200 ) ) ( not ( = ?auto_722193 ?auto_722201 ) ) ( not ( = ?auto_722193 ?auto_722202 ) ) ( not ( = ?auto_722193 ?auto_722203 ) ) ( not ( = ?auto_722193 ?auto_722204 ) ) ( not ( = ?auto_722193 ?auto_722205 ) ) ( not ( = ?auto_722193 ?auto_722206 ) ) ( not ( = ?auto_722193 ?auto_722207 ) ) ( not ( = ?auto_722193 ?auto_722208 ) ) ( not ( = ?auto_722194 ?auto_722195 ) ) ( not ( = ?auto_722194 ?auto_722196 ) ) ( not ( = ?auto_722194 ?auto_722197 ) ) ( not ( = ?auto_722194 ?auto_722198 ) ) ( not ( = ?auto_722194 ?auto_722199 ) ) ( not ( = ?auto_722194 ?auto_722200 ) ) ( not ( = ?auto_722194 ?auto_722201 ) ) ( not ( = ?auto_722194 ?auto_722202 ) ) ( not ( = ?auto_722194 ?auto_722203 ) ) ( not ( = ?auto_722194 ?auto_722204 ) ) ( not ( = ?auto_722194 ?auto_722205 ) ) ( not ( = ?auto_722194 ?auto_722206 ) ) ( not ( = ?auto_722194 ?auto_722207 ) ) ( not ( = ?auto_722194 ?auto_722208 ) ) ( not ( = ?auto_722195 ?auto_722196 ) ) ( not ( = ?auto_722195 ?auto_722197 ) ) ( not ( = ?auto_722195 ?auto_722198 ) ) ( not ( = ?auto_722195 ?auto_722199 ) ) ( not ( = ?auto_722195 ?auto_722200 ) ) ( not ( = ?auto_722195 ?auto_722201 ) ) ( not ( = ?auto_722195 ?auto_722202 ) ) ( not ( = ?auto_722195 ?auto_722203 ) ) ( not ( = ?auto_722195 ?auto_722204 ) ) ( not ( = ?auto_722195 ?auto_722205 ) ) ( not ( = ?auto_722195 ?auto_722206 ) ) ( not ( = ?auto_722195 ?auto_722207 ) ) ( not ( = ?auto_722195 ?auto_722208 ) ) ( not ( = ?auto_722196 ?auto_722197 ) ) ( not ( = ?auto_722196 ?auto_722198 ) ) ( not ( = ?auto_722196 ?auto_722199 ) ) ( not ( = ?auto_722196 ?auto_722200 ) ) ( not ( = ?auto_722196 ?auto_722201 ) ) ( not ( = ?auto_722196 ?auto_722202 ) ) ( not ( = ?auto_722196 ?auto_722203 ) ) ( not ( = ?auto_722196 ?auto_722204 ) ) ( not ( = ?auto_722196 ?auto_722205 ) ) ( not ( = ?auto_722196 ?auto_722206 ) ) ( not ( = ?auto_722196 ?auto_722207 ) ) ( not ( = ?auto_722196 ?auto_722208 ) ) ( not ( = ?auto_722197 ?auto_722198 ) ) ( not ( = ?auto_722197 ?auto_722199 ) ) ( not ( = ?auto_722197 ?auto_722200 ) ) ( not ( = ?auto_722197 ?auto_722201 ) ) ( not ( = ?auto_722197 ?auto_722202 ) ) ( not ( = ?auto_722197 ?auto_722203 ) ) ( not ( = ?auto_722197 ?auto_722204 ) ) ( not ( = ?auto_722197 ?auto_722205 ) ) ( not ( = ?auto_722197 ?auto_722206 ) ) ( not ( = ?auto_722197 ?auto_722207 ) ) ( not ( = ?auto_722197 ?auto_722208 ) ) ( not ( = ?auto_722198 ?auto_722199 ) ) ( not ( = ?auto_722198 ?auto_722200 ) ) ( not ( = ?auto_722198 ?auto_722201 ) ) ( not ( = ?auto_722198 ?auto_722202 ) ) ( not ( = ?auto_722198 ?auto_722203 ) ) ( not ( = ?auto_722198 ?auto_722204 ) ) ( not ( = ?auto_722198 ?auto_722205 ) ) ( not ( = ?auto_722198 ?auto_722206 ) ) ( not ( = ?auto_722198 ?auto_722207 ) ) ( not ( = ?auto_722198 ?auto_722208 ) ) ( not ( = ?auto_722199 ?auto_722200 ) ) ( not ( = ?auto_722199 ?auto_722201 ) ) ( not ( = ?auto_722199 ?auto_722202 ) ) ( not ( = ?auto_722199 ?auto_722203 ) ) ( not ( = ?auto_722199 ?auto_722204 ) ) ( not ( = ?auto_722199 ?auto_722205 ) ) ( not ( = ?auto_722199 ?auto_722206 ) ) ( not ( = ?auto_722199 ?auto_722207 ) ) ( not ( = ?auto_722199 ?auto_722208 ) ) ( not ( = ?auto_722200 ?auto_722201 ) ) ( not ( = ?auto_722200 ?auto_722202 ) ) ( not ( = ?auto_722200 ?auto_722203 ) ) ( not ( = ?auto_722200 ?auto_722204 ) ) ( not ( = ?auto_722200 ?auto_722205 ) ) ( not ( = ?auto_722200 ?auto_722206 ) ) ( not ( = ?auto_722200 ?auto_722207 ) ) ( not ( = ?auto_722200 ?auto_722208 ) ) ( not ( = ?auto_722201 ?auto_722202 ) ) ( not ( = ?auto_722201 ?auto_722203 ) ) ( not ( = ?auto_722201 ?auto_722204 ) ) ( not ( = ?auto_722201 ?auto_722205 ) ) ( not ( = ?auto_722201 ?auto_722206 ) ) ( not ( = ?auto_722201 ?auto_722207 ) ) ( not ( = ?auto_722201 ?auto_722208 ) ) ( not ( = ?auto_722202 ?auto_722203 ) ) ( not ( = ?auto_722202 ?auto_722204 ) ) ( not ( = ?auto_722202 ?auto_722205 ) ) ( not ( = ?auto_722202 ?auto_722206 ) ) ( not ( = ?auto_722202 ?auto_722207 ) ) ( not ( = ?auto_722202 ?auto_722208 ) ) ( not ( = ?auto_722203 ?auto_722204 ) ) ( not ( = ?auto_722203 ?auto_722205 ) ) ( not ( = ?auto_722203 ?auto_722206 ) ) ( not ( = ?auto_722203 ?auto_722207 ) ) ( not ( = ?auto_722203 ?auto_722208 ) ) ( not ( = ?auto_722204 ?auto_722205 ) ) ( not ( = ?auto_722204 ?auto_722206 ) ) ( not ( = ?auto_722204 ?auto_722207 ) ) ( not ( = ?auto_722204 ?auto_722208 ) ) ( not ( = ?auto_722205 ?auto_722206 ) ) ( not ( = ?auto_722205 ?auto_722207 ) ) ( not ( = ?auto_722205 ?auto_722208 ) ) ( not ( = ?auto_722206 ?auto_722207 ) ) ( not ( = ?auto_722206 ?auto_722208 ) ) ( not ( = ?auto_722207 ?auto_722208 ) ) ( ON ?auto_722206 ?auto_722207 ) ( ON ?auto_722205 ?auto_722206 ) ( ON ?auto_722204 ?auto_722205 ) ( ON ?auto_722203 ?auto_722204 ) ( ON ?auto_722202 ?auto_722203 ) ( ON ?auto_722201 ?auto_722202 ) ( ON ?auto_722200 ?auto_722201 ) ( ON ?auto_722199 ?auto_722200 ) ( ON ?auto_722198 ?auto_722199 ) ( CLEAR ?auto_722196 ) ( ON ?auto_722197 ?auto_722198 ) ( CLEAR ?auto_722197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_722193 ?auto_722194 ?auto_722195 ?auto_722196 ?auto_722197 )
      ( MAKE-15PILE ?auto_722193 ?auto_722194 ?auto_722195 ?auto_722196 ?auto_722197 ?auto_722198 ?auto_722199 ?auto_722200 ?auto_722201 ?auto_722202 ?auto_722203 ?auto_722204 ?auto_722205 ?auto_722206 ?auto_722207 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722255 - BLOCK
      ?auto_722256 - BLOCK
      ?auto_722257 - BLOCK
      ?auto_722258 - BLOCK
      ?auto_722259 - BLOCK
      ?auto_722260 - BLOCK
      ?auto_722261 - BLOCK
      ?auto_722262 - BLOCK
      ?auto_722263 - BLOCK
      ?auto_722264 - BLOCK
      ?auto_722265 - BLOCK
      ?auto_722266 - BLOCK
      ?auto_722267 - BLOCK
      ?auto_722268 - BLOCK
      ?auto_722269 - BLOCK
    )
    :vars
    (
      ?auto_722270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722269 ?auto_722270 ) ( ON-TABLE ?auto_722255 ) ( ON ?auto_722256 ?auto_722255 ) ( ON ?auto_722257 ?auto_722256 ) ( not ( = ?auto_722255 ?auto_722256 ) ) ( not ( = ?auto_722255 ?auto_722257 ) ) ( not ( = ?auto_722255 ?auto_722258 ) ) ( not ( = ?auto_722255 ?auto_722259 ) ) ( not ( = ?auto_722255 ?auto_722260 ) ) ( not ( = ?auto_722255 ?auto_722261 ) ) ( not ( = ?auto_722255 ?auto_722262 ) ) ( not ( = ?auto_722255 ?auto_722263 ) ) ( not ( = ?auto_722255 ?auto_722264 ) ) ( not ( = ?auto_722255 ?auto_722265 ) ) ( not ( = ?auto_722255 ?auto_722266 ) ) ( not ( = ?auto_722255 ?auto_722267 ) ) ( not ( = ?auto_722255 ?auto_722268 ) ) ( not ( = ?auto_722255 ?auto_722269 ) ) ( not ( = ?auto_722255 ?auto_722270 ) ) ( not ( = ?auto_722256 ?auto_722257 ) ) ( not ( = ?auto_722256 ?auto_722258 ) ) ( not ( = ?auto_722256 ?auto_722259 ) ) ( not ( = ?auto_722256 ?auto_722260 ) ) ( not ( = ?auto_722256 ?auto_722261 ) ) ( not ( = ?auto_722256 ?auto_722262 ) ) ( not ( = ?auto_722256 ?auto_722263 ) ) ( not ( = ?auto_722256 ?auto_722264 ) ) ( not ( = ?auto_722256 ?auto_722265 ) ) ( not ( = ?auto_722256 ?auto_722266 ) ) ( not ( = ?auto_722256 ?auto_722267 ) ) ( not ( = ?auto_722256 ?auto_722268 ) ) ( not ( = ?auto_722256 ?auto_722269 ) ) ( not ( = ?auto_722256 ?auto_722270 ) ) ( not ( = ?auto_722257 ?auto_722258 ) ) ( not ( = ?auto_722257 ?auto_722259 ) ) ( not ( = ?auto_722257 ?auto_722260 ) ) ( not ( = ?auto_722257 ?auto_722261 ) ) ( not ( = ?auto_722257 ?auto_722262 ) ) ( not ( = ?auto_722257 ?auto_722263 ) ) ( not ( = ?auto_722257 ?auto_722264 ) ) ( not ( = ?auto_722257 ?auto_722265 ) ) ( not ( = ?auto_722257 ?auto_722266 ) ) ( not ( = ?auto_722257 ?auto_722267 ) ) ( not ( = ?auto_722257 ?auto_722268 ) ) ( not ( = ?auto_722257 ?auto_722269 ) ) ( not ( = ?auto_722257 ?auto_722270 ) ) ( not ( = ?auto_722258 ?auto_722259 ) ) ( not ( = ?auto_722258 ?auto_722260 ) ) ( not ( = ?auto_722258 ?auto_722261 ) ) ( not ( = ?auto_722258 ?auto_722262 ) ) ( not ( = ?auto_722258 ?auto_722263 ) ) ( not ( = ?auto_722258 ?auto_722264 ) ) ( not ( = ?auto_722258 ?auto_722265 ) ) ( not ( = ?auto_722258 ?auto_722266 ) ) ( not ( = ?auto_722258 ?auto_722267 ) ) ( not ( = ?auto_722258 ?auto_722268 ) ) ( not ( = ?auto_722258 ?auto_722269 ) ) ( not ( = ?auto_722258 ?auto_722270 ) ) ( not ( = ?auto_722259 ?auto_722260 ) ) ( not ( = ?auto_722259 ?auto_722261 ) ) ( not ( = ?auto_722259 ?auto_722262 ) ) ( not ( = ?auto_722259 ?auto_722263 ) ) ( not ( = ?auto_722259 ?auto_722264 ) ) ( not ( = ?auto_722259 ?auto_722265 ) ) ( not ( = ?auto_722259 ?auto_722266 ) ) ( not ( = ?auto_722259 ?auto_722267 ) ) ( not ( = ?auto_722259 ?auto_722268 ) ) ( not ( = ?auto_722259 ?auto_722269 ) ) ( not ( = ?auto_722259 ?auto_722270 ) ) ( not ( = ?auto_722260 ?auto_722261 ) ) ( not ( = ?auto_722260 ?auto_722262 ) ) ( not ( = ?auto_722260 ?auto_722263 ) ) ( not ( = ?auto_722260 ?auto_722264 ) ) ( not ( = ?auto_722260 ?auto_722265 ) ) ( not ( = ?auto_722260 ?auto_722266 ) ) ( not ( = ?auto_722260 ?auto_722267 ) ) ( not ( = ?auto_722260 ?auto_722268 ) ) ( not ( = ?auto_722260 ?auto_722269 ) ) ( not ( = ?auto_722260 ?auto_722270 ) ) ( not ( = ?auto_722261 ?auto_722262 ) ) ( not ( = ?auto_722261 ?auto_722263 ) ) ( not ( = ?auto_722261 ?auto_722264 ) ) ( not ( = ?auto_722261 ?auto_722265 ) ) ( not ( = ?auto_722261 ?auto_722266 ) ) ( not ( = ?auto_722261 ?auto_722267 ) ) ( not ( = ?auto_722261 ?auto_722268 ) ) ( not ( = ?auto_722261 ?auto_722269 ) ) ( not ( = ?auto_722261 ?auto_722270 ) ) ( not ( = ?auto_722262 ?auto_722263 ) ) ( not ( = ?auto_722262 ?auto_722264 ) ) ( not ( = ?auto_722262 ?auto_722265 ) ) ( not ( = ?auto_722262 ?auto_722266 ) ) ( not ( = ?auto_722262 ?auto_722267 ) ) ( not ( = ?auto_722262 ?auto_722268 ) ) ( not ( = ?auto_722262 ?auto_722269 ) ) ( not ( = ?auto_722262 ?auto_722270 ) ) ( not ( = ?auto_722263 ?auto_722264 ) ) ( not ( = ?auto_722263 ?auto_722265 ) ) ( not ( = ?auto_722263 ?auto_722266 ) ) ( not ( = ?auto_722263 ?auto_722267 ) ) ( not ( = ?auto_722263 ?auto_722268 ) ) ( not ( = ?auto_722263 ?auto_722269 ) ) ( not ( = ?auto_722263 ?auto_722270 ) ) ( not ( = ?auto_722264 ?auto_722265 ) ) ( not ( = ?auto_722264 ?auto_722266 ) ) ( not ( = ?auto_722264 ?auto_722267 ) ) ( not ( = ?auto_722264 ?auto_722268 ) ) ( not ( = ?auto_722264 ?auto_722269 ) ) ( not ( = ?auto_722264 ?auto_722270 ) ) ( not ( = ?auto_722265 ?auto_722266 ) ) ( not ( = ?auto_722265 ?auto_722267 ) ) ( not ( = ?auto_722265 ?auto_722268 ) ) ( not ( = ?auto_722265 ?auto_722269 ) ) ( not ( = ?auto_722265 ?auto_722270 ) ) ( not ( = ?auto_722266 ?auto_722267 ) ) ( not ( = ?auto_722266 ?auto_722268 ) ) ( not ( = ?auto_722266 ?auto_722269 ) ) ( not ( = ?auto_722266 ?auto_722270 ) ) ( not ( = ?auto_722267 ?auto_722268 ) ) ( not ( = ?auto_722267 ?auto_722269 ) ) ( not ( = ?auto_722267 ?auto_722270 ) ) ( not ( = ?auto_722268 ?auto_722269 ) ) ( not ( = ?auto_722268 ?auto_722270 ) ) ( not ( = ?auto_722269 ?auto_722270 ) ) ( ON ?auto_722268 ?auto_722269 ) ( ON ?auto_722267 ?auto_722268 ) ( ON ?auto_722266 ?auto_722267 ) ( ON ?auto_722265 ?auto_722266 ) ( ON ?auto_722264 ?auto_722265 ) ( ON ?auto_722263 ?auto_722264 ) ( ON ?auto_722262 ?auto_722263 ) ( ON ?auto_722261 ?auto_722262 ) ( ON ?auto_722260 ?auto_722261 ) ( ON ?auto_722259 ?auto_722260 ) ( CLEAR ?auto_722257 ) ( ON ?auto_722258 ?auto_722259 ) ( CLEAR ?auto_722258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_722255 ?auto_722256 ?auto_722257 ?auto_722258 )
      ( MAKE-15PILE ?auto_722255 ?auto_722256 ?auto_722257 ?auto_722258 ?auto_722259 ?auto_722260 ?auto_722261 ?auto_722262 ?auto_722263 ?auto_722264 ?auto_722265 ?auto_722266 ?auto_722267 ?auto_722268 ?auto_722269 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722317 - BLOCK
      ?auto_722318 - BLOCK
      ?auto_722319 - BLOCK
      ?auto_722320 - BLOCK
      ?auto_722321 - BLOCK
      ?auto_722322 - BLOCK
      ?auto_722323 - BLOCK
      ?auto_722324 - BLOCK
      ?auto_722325 - BLOCK
      ?auto_722326 - BLOCK
      ?auto_722327 - BLOCK
      ?auto_722328 - BLOCK
      ?auto_722329 - BLOCK
      ?auto_722330 - BLOCK
      ?auto_722331 - BLOCK
    )
    :vars
    (
      ?auto_722332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722331 ?auto_722332 ) ( ON-TABLE ?auto_722317 ) ( ON ?auto_722318 ?auto_722317 ) ( not ( = ?auto_722317 ?auto_722318 ) ) ( not ( = ?auto_722317 ?auto_722319 ) ) ( not ( = ?auto_722317 ?auto_722320 ) ) ( not ( = ?auto_722317 ?auto_722321 ) ) ( not ( = ?auto_722317 ?auto_722322 ) ) ( not ( = ?auto_722317 ?auto_722323 ) ) ( not ( = ?auto_722317 ?auto_722324 ) ) ( not ( = ?auto_722317 ?auto_722325 ) ) ( not ( = ?auto_722317 ?auto_722326 ) ) ( not ( = ?auto_722317 ?auto_722327 ) ) ( not ( = ?auto_722317 ?auto_722328 ) ) ( not ( = ?auto_722317 ?auto_722329 ) ) ( not ( = ?auto_722317 ?auto_722330 ) ) ( not ( = ?auto_722317 ?auto_722331 ) ) ( not ( = ?auto_722317 ?auto_722332 ) ) ( not ( = ?auto_722318 ?auto_722319 ) ) ( not ( = ?auto_722318 ?auto_722320 ) ) ( not ( = ?auto_722318 ?auto_722321 ) ) ( not ( = ?auto_722318 ?auto_722322 ) ) ( not ( = ?auto_722318 ?auto_722323 ) ) ( not ( = ?auto_722318 ?auto_722324 ) ) ( not ( = ?auto_722318 ?auto_722325 ) ) ( not ( = ?auto_722318 ?auto_722326 ) ) ( not ( = ?auto_722318 ?auto_722327 ) ) ( not ( = ?auto_722318 ?auto_722328 ) ) ( not ( = ?auto_722318 ?auto_722329 ) ) ( not ( = ?auto_722318 ?auto_722330 ) ) ( not ( = ?auto_722318 ?auto_722331 ) ) ( not ( = ?auto_722318 ?auto_722332 ) ) ( not ( = ?auto_722319 ?auto_722320 ) ) ( not ( = ?auto_722319 ?auto_722321 ) ) ( not ( = ?auto_722319 ?auto_722322 ) ) ( not ( = ?auto_722319 ?auto_722323 ) ) ( not ( = ?auto_722319 ?auto_722324 ) ) ( not ( = ?auto_722319 ?auto_722325 ) ) ( not ( = ?auto_722319 ?auto_722326 ) ) ( not ( = ?auto_722319 ?auto_722327 ) ) ( not ( = ?auto_722319 ?auto_722328 ) ) ( not ( = ?auto_722319 ?auto_722329 ) ) ( not ( = ?auto_722319 ?auto_722330 ) ) ( not ( = ?auto_722319 ?auto_722331 ) ) ( not ( = ?auto_722319 ?auto_722332 ) ) ( not ( = ?auto_722320 ?auto_722321 ) ) ( not ( = ?auto_722320 ?auto_722322 ) ) ( not ( = ?auto_722320 ?auto_722323 ) ) ( not ( = ?auto_722320 ?auto_722324 ) ) ( not ( = ?auto_722320 ?auto_722325 ) ) ( not ( = ?auto_722320 ?auto_722326 ) ) ( not ( = ?auto_722320 ?auto_722327 ) ) ( not ( = ?auto_722320 ?auto_722328 ) ) ( not ( = ?auto_722320 ?auto_722329 ) ) ( not ( = ?auto_722320 ?auto_722330 ) ) ( not ( = ?auto_722320 ?auto_722331 ) ) ( not ( = ?auto_722320 ?auto_722332 ) ) ( not ( = ?auto_722321 ?auto_722322 ) ) ( not ( = ?auto_722321 ?auto_722323 ) ) ( not ( = ?auto_722321 ?auto_722324 ) ) ( not ( = ?auto_722321 ?auto_722325 ) ) ( not ( = ?auto_722321 ?auto_722326 ) ) ( not ( = ?auto_722321 ?auto_722327 ) ) ( not ( = ?auto_722321 ?auto_722328 ) ) ( not ( = ?auto_722321 ?auto_722329 ) ) ( not ( = ?auto_722321 ?auto_722330 ) ) ( not ( = ?auto_722321 ?auto_722331 ) ) ( not ( = ?auto_722321 ?auto_722332 ) ) ( not ( = ?auto_722322 ?auto_722323 ) ) ( not ( = ?auto_722322 ?auto_722324 ) ) ( not ( = ?auto_722322 ?auto_722325 ) ) ( not ( = ?auto_722322 ?auto_722326 ) ) ( not ( = ?auto_722322 ?auto_722327 ) ) ( not ( = ?auto_722322 ?auto_722328 ) ) ( not ( = ?auto_722322 ?auto_722329 ) ) ( not ( = ?auto_722322 ?auto_722330 ) ) ( not ( = ?auto_722322 ?auto_722331 ) ) ( not ( = ?auto_722322 ?auto_722332 ) ) ( not ( = ?auto_722323 ?auto_722324 ) ) ( not ( = ?auto_722323 ?auto_722325 ) ) ( not ( = ?auto_722323 ?auto_722326 ) ) ( not ( = ?auto_722323 ?auto_722327 ) ) ( not ( = ?auto_722323 ?auto_722328 ) ) ( not ( = ?auto_722323 ?auto_722329 ) ) ( not ( = ?auto_722323 ?auto_722330 ) ) ( not ( = ?auto_722323 ?auto_722331 ) ) ( not ( = ?auto_722323 ?auto_722332 ) ) ( not ( = ?auto_722324 ?auto_722325 ) ) ( not ( = ?auto_722324 ?auto_722326 ) ) ( not ( = ?auto_722324 ?auto_722327 ) ) ( not ( = ?auto_722324 ?auto_722328 ) ) ( not ( = ?auto_722324 ?auto_722329 ) ) ( not ( = ?auto_722324 ?auto_722330 ) ) ( not ( = ?auto_722324 ?auto_722331 ) ) ( not ( = ?auto_722324 ?auto_722332 ) ) ( not ( = ?auto_722325 ?auto_722326 ) ) ( not ( = ?auto_722325 ?auto_722327 ) ) ( not ( = ?auto_722325 ?auto_722328 ) ) ( not ( = ?auto_722325 ?auto_722329 ) ) ( not ( = ?auto_722325 ?auto_722330 ) ) ( not ( = ?auto_722325 ?auto_722331 ) ) ( not ( = ?auto_722325 ?auto_722332 ) ) ( not ( = ?auto_722326 ?auto_722327 ) ) ( not ( = ?auto_722326 ?auto_722328 ) ) ( not ( = ?auto_722326 ?auto_722329 ) ) ( not ( = ?auto_722326 ?auto_722330 ) ) ( not ( = ?auto_722326 ?auto_722331 ) ) ( not ( = ?auto_722326 ?auto_722332 ) ) ( not ( = ?auto_722327 ?auto_722328 ) ) ( not ( = ?auto_722327 ?auto_722329 ) ) ( not ( = ?auto_722327 ?auto_722330 ) ) ( not ( = ?auto_722327 ?auto_722331 ) ) ( not ( = ?auto_722327 ?auto_722332 ) ) ( not ( = ?auto_722328 ?auto_722329 ) ) ( not ( = ?auto_722328 ?auto_722330 ) ) ( not ( = ?auto_722328 ?auto_722331 ) ) ( not ( = ?auto_722328 ?auto_722332 ) ) ( not ( = ?auto_722329 ?auto_722330 ) ) ( not ( = ?auto_722329 ?auto_722331 ) ) ( not ( = ?auto_722329 ?auto_722332 ) ) ( not ( = ?auto_722330 ?auto_722331 ) ) ( not ( = ?auto_722330 ?auto_722332 ) ) ( not ( = ?auto_722331 ?auto_722332 ) ) ( ON ?auto_722330 ?auto_722331 ) ( ON ?auto_722329 ?auto_722330 ) ( ON ?auto_722328 ?auto_722329 ) ( ON ?auto_722327 ?auto_722328 ) ( ON ?auto_722326 ?auto_722327 ) ( ON ?auto_722325 ?auto_722326 ) ( ON ?auto_722324 ?auto_722325 ) ( ON ?auto_722323 ?auto_722324 ) ( ON ?auto_722322 ?auto_722323 ) ( ON ?auto_722321 ?auto_722322 ) ( ON ?auto_722320 ?auto_722321 ) ( CLEAR ?auto_722318 ) ( ON ?auto_722319 ?auto_722320 ) ( CLEAR ?auto_722319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_722317 ?auto_722318 ?auto_722319 )
      ( MAKE-15PILE ?auto_722317 ?auto_722318 ?auto_722319 ?auto_722320 ?auto_722321 ?auto_722322 ?auto_722323 ?auto_722324 ?auto_722325 ?auto_722326 ?auto_722327 ?auto_722328 ?auto_722329 ?auto_722330 ?auto_722331 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722379 - BLOCK
      ?auto_722380 - BLOCK
      ?auto_722381 - BLOCK
      ?auto_722382 - BLOCK
      ?auto_722383 - BLOCK
      ?auto_722384 - BLOCK
      ?auto_722385 - BLOCK
      ?auto_722386 - BLOCK
      ?auto_722387 - BLOCK
      ?auto_722388 - BLOCK
      ?auto_722389 - BLOCK
      ?auto_722390 - BLOCK
      ?auto_722391 - BLOCK
      ?auto_722392 - BLOCK
      ?auto_722393 - BLOCK
    )
    :vars
    (
      ?auto_722394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722393 ?auto_722394 ) ( ON-TABLE ?auto_722379 ) ( not ( = ?auto_722379 ?auto_722380 ) ) ( not ( = ?auto_722379 ?auto_722381 ) ) ( not ( = ?auto_722379 ?auto_722382 ) ) ( not ( = ?auto_722379 ?auto_722383 ) ) ( not ( = ?auto_722379 ?auto_722384 ) ) ( not ( = ?auto_722379 ?auto_722385 ) ) ( not ( = ?auto_722379 ?auto_722386 ) ) ( not ( = ?auto_722379 ?auto_722387 ) ) ( not ( = ?auto_722379 ?auto_722388 ) ) ( not ( = ?auto_722379 ?auto_722389 ) ) ( not ( = ?auto_722379 ?auto_722390 ) ) ( not ( = ?auto_722379 ?auto_722391 ) ) ( not ( = ?auto_722379 ?auto_722392 ) ) ( not ( = ?auto_722379 ?auto_722393 ) ) ( not ( = ?auto_722379 ?auto_722394 ) ) ( not ( = ?auto_722380 ?auto_722381 ) ) ( not ( = ?auto_722380 ?auto_722382 ) ) ( not ( = ?auto_722380 ?auto_722383 ) ) ( not ( = ?auto_722380 ?auto_722384 ) ) ( not ( = ?auto_722380 ?auto_722385 ) ) ( not ( = ?auto_722380 ?auto_722386 ) ) ( not ( = ?auto_722380 ?auto_722387 ) ) ( not ( = ?auto_722380 ?auto_722388 ) ) ( not ( = ?auto_722380 ?auto_722389 ) ) ( not ( = ?auto_722380 ?auto_722390 ) ) ( not ( = ?auto_722380 ?auto_722391 ) ) ( not ( = ?auto_722380 ?auto_722392 ) ) ( not ( = ?auto_722380 ?auto_722393 ) ) ( not ( = ?auto_722380 ?auto_722394 ) ) ( not ( = ?auto_722381 ?auto_722382 ) ) ( not ( = ?auto_722381 ?auto_722383 ) ) ( not ( = ?auto_722381 ?auto_722384 ) ) ( not ( = ?auto_722381 ?auto_722385 ) ) ( not ( = ?auto_722381 ?auto_722386 ) ) ( not ( = ?auto_722381 ?auto_722387 ) ) ( not ( = ?auto_722381 ?auto_722388 ) ) ( not ( = ?auto_722381 ?auto_722389 ) ) ( not ( = ?auto_722381 ?auto_722390 ) ) ( not ( = ?auto_722381 ?auto_722391 ) ) ( not ( = ?auto_722381 ?auto_722392 ) ) ( not ( = ?auto_722381 ?auto_722393 ) ) ( not ( = ?auto_722381 ?auto_722394 ) ) ( not ( = ?auto_722382 ?auto_722383 ) ) ( not ( = ?auto_722382 ?auto_722384 ) ) ( not ( = ?auto_722382 ?auto_722385 ) ) ( not ( = ?auto_722382 ?auto_722386 ) ) ( not ( = ?auto_722382 ?auto_722387 ) ) ( not ( = ?auto_722382 ?auto_722388 ) ) ( not ( = ?auto_722382 ?auto_722389 ) ) ( not ( = ?auto_722382 ?auto_722390 ) ) ( not ( = ?auto_722382 ?auto_722391 ) ) ( not ( = ?auto_722382 ?auto_722392 ) ) ( not ( = ?auto_722382 ?auto_722393 ) ) ( not ( = ?auto_722382 ?auto_722394 ) ) ( not ( = ?auto_722383 ?auto_722384 ) ) ( not ( = ?auto_722383 ?auto_722385 ) ) ( not ( = ?auto_722383 ?auto_722386 ) ) ( not ( = ?auto_722383 ?auto_722387 ) ) ( not ( = ?auto_722383 ?auto_722388 ) ) ( not ( = ?auto_722383 ?auto_722389 ) ) ( not ( = ?auto_722383 ?auto_722390 ) ) ( not ( = ?auto_722383 ?auto_722391 ) ) ( not ( = ?auto_722383 ?auto_722392 ) ) ( not ( = ?auto_722383 ?auto_722393 ) ) ( not ( = ?auto_722383 ?auto_722394 ) ) ( not ( = ?auto_722384 ?auto_722385 ) ) ( not ( = ?auto_722384 ?auto_722386 ) ) ( not ( = ?auto_722384 ?auto_722387 ) ) ( not ( = ?auto_722384 ?auto_722388 ) ) ( not ( = ?auto_722384 ?auto_722389 ) ) ( not ( = ?auto_722384 ?auto_722390 ) ) ( not ( = ?auto_722384 ?auto_722391 ) ) ( not ( = ?auto_722384 ?auto_722392 ) ) ( not ( = ?auto_722384 ?auto_722393 ) ) ( not ( = ?auto_722384 ?auto_722394 ) ) ( not ( = ?auto_722385 ?auto_722386 ) ) ( not ( = ?auto_722385 ?auto_722387 ) ) ( not ( = ?auto_722385 ?auto_722388 ) ) ( not ( = ?auto_722385 ?auto_722389 ) ) ( not ( = ?auto_722385 ?auto_722390 ) ) ( not ( = ?auto_722385 ?auto_722391 ) ) ( not ( = ?auto_722385 ?auto_722392 ) ) ( not ( = ?auto_722385 ?auto_722393 ) ) ( not ( = ?auto_722385 ?auto_722394 ) ) ( not ( = ?auto_722386 ?auto_722387 ) ) ( not ( = ?auto_722386 ?auto_722388 ) ) ( not ( = ?auto_722386 ?auto_722389 ) ) ( not ( = ?auto_722386 ?auto_722390 ) ) ( not ( = ?auto_722386 ?auto_722391 ) ) ( not ( = ?auto_722386 ?auto_722392 ) ) ( not ( = ?auto_722386 ?auto_722393 ) ) ( not ( = ?auto_722386 ?auto_722394 ) ) ( not ( = ?auto_722387 ?auto_722388 ) ) ( not ( = ?auto_722387 ?auto_722389 ) ) ( not ( = ?auto_722387 ?auto_722390 ) ) ( not ( = ?auto_722387 ?auto_722391 ) ) ( not ( = ?auto_722387 ?auto_722392 ) ) ( not ( = ?auto_722387 ?auto_722393 ) ) ( not ( = ?auto_722387 ?auto_722394 ) ) ( not ( = ?auto_722388 ?auto_722389 ) ) ( not ( = ?auto_722388 ?auto_722390 ) ) ( not ( = ?auto_722388 ?auto_722391 ) ) ( not ( = ?auto_722388 ?auto_722392 ) ) ( not ( = ?auto_722388 ?auto_722393 ) ) ( not ( = ?auto_722388 ?auto_722394 ) ) ( not ( = ?auto_722389 ?auto_722390 ) ) ( not ( = ?auto_722389 ?auto_722391 ) ) ( not ( = ?auto_722389 ?auto_722392 ) ) ( not ( = ?auto_722389 ?auto_722393 ) ) ( not ( = ?auto_722389 ?auto_722394 ) ) ( not ( = ?auto_722390 ?auto_722391 ) ) ( not ( = ?auto_722390 ?auto_722392 ) ) ( not ( = ?auto_722390 ?auto_722393 ) ) ( not ( = ?auto_722390 ?auto_722394 ) ) ( not ( = ?auto_722391 ?auto_722392 ) ) ( not ( = ?auto_722391 ?auto_722393 ) ) ( not ( = ?auto_722391 ?auto_722394 ) ) ( not ( = ?auto_722392 ?auto_722393 ) ) ( not ( = ?auto_722392 ?auto_722394 ) ) ( not ( = ?auto_722393 ?auto_722394 ) ) ( ON ?auto_722392 ?auto_722393 ) ( ON ?auto_722391 ?auto_722392 ) ( ON ?auto_722390 ?auto_722391 ) ( ON ?auto_722389 ?auto_722390 ) ( ON ?auto_722388 ?auto_722389 ) ( ON ?auto_722387 ?auto_722388 ) ( ON ?auto_722386 ?auto_722387 ) ( ON ?auto_722385 ?auto_722386 ) ( ON ?auto_722384 ?auto_722385 ) ( ON ?auto_722383 ?auto_722384 ) ( ON ?auto_722382 ?auto_722383 ) ( ON ?auto_722381 ?auto_722382 ) ( CLEAR ?auto_722379 ) ( ON ?auto_722380 ?auto_722381 ) ( CLEAR ?auto_722380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_722379 ?auto_722380 )
      ( MAKE-15PILE ?auto_722379 ?auto_722380 ?auto_722381 ?auto_722382 ?auto_722383 ?auto_722384 ?auto_722385 ?auto_722386 ?auto_722387 ?auto_722388 ?auto_722389 ?auto_722390 ?auto_722391 ?auto_722392 ?auto_722393 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_722441 - BLOCK
      ?auto_722442 - BLOCK
      ?auto_722443 - BLOCK
      ?auto_722444 - BLOCK
      ?auto_722445 - BLOCK
      ?auto_722446 - BLOCK
      ?auto_722447 - BLOCK
      ?auto_722448 - BLOCK
      ?auto_722449 - BLOCK
      ?auto_722450 - BLOCK
      ?auto_722451 - BLOCK
      ?auto_722452 - BLOCK
      ?auto_722453 - BLOCK
      ?auto_722454 - BLOCK
      ?auto_722455 - BLOCK
    )
    :vars
    (
      ?auto_722456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722455 ?auto_722456 ) ( not ( = ?auto_722441 ?auto_722442 ) ) ( not ( = ?auto_722441 ?auto_722443 ) ) ( not ( = ?auto_722441 ?auto_722444 ) ) ( not ( = ?auto_722441 ?auto_722445 ) ) ( not ( = ?auto_722441 ?auto_722446 ) ) ( not ( = ?auto_722441 ?auto_722447 ) ) ( not ( = ?auto_722441 ?auto_722448 ) ) ( not ( = ?auto_722441 ?auto_722449 ) ) ( not ( = ?auto_722441 ?auto_722450 ) ) ( not ( = ?auto_722441 ?auto_722451 ) ) ( not ( = ?auto_722441 ?auto_722452 ) ) ( not ( = ?auto_722441 ?auto_722453 ) ) ( not ( = ?auto_722441 ?auto_722454 ) ) ( not ( = ?auto_722441 ?auto_722455 ) ) ( not ( = ?auto_722441 ?auto_722456 ) ) ( not ( = ?auto_722442 ?auto_722443 ) ) ( not ( = ?auto_722442 ?auto_722444 ) ) ( not ( = ?auto_722442 ?auto_722445 ) ) ( not ( = ?auto_722442 ?auto_722446 ) ) ( not ( = ?auto_722442 ?auto_722447 ) ) ( not ( = ?auto_722442 ?auto_722448 ) ) ( not ( = ?auto_722442 ?auto_722449 ) ) ( not ( = ?auto_722442 ?auto_722450 ) ) ( not ( = ?auto_722442 ?auto_722451 ) ) ( not ( = ?auto_722442 ?auto_722452 ) ) ( not ( = ?auto_722442 ?auto_722453 ) ) ( not ( = ?auto_722442 ?auto_722454 ) ) ( not ( = ?auto_722442 ?auto_722455 ) ) ( not ( = ?auto_722442 ?auto_722456 ) ) ( not ( = ?auto_722443 ?auto_722444 ) ) ( not ( = ?auto_722443 ?auto_722445 ) ) ( not ( = ?auto_722443 ?auto_722446 ) ) ( not ( = ?auto_722443 ?auto_722447 ) ) ( not ( = ?auto_722443 ?auto_722448 ) ) ( not ( = ?auto_722443 ?auto_722449 ) ) ( not ( = ?auto_722443 ?auto_722450 ) ) ( not ( = ?auto_722443 ?auto_722451 ) ) ( not ( = ?auto_722443 ?auto_722452 ) ) ( not ( = ?auto_722443 ?auto_722453 ) ) ( not ( = ?auto_722443 ?auto_722454 ) ) ( not ( = ?auto_722443 ?auto_722455 ) ) ( not ( = ?auto_722443 ?auto_722456 ) ) ( not ( = ?auto_722444 ?auto_722445 ) ) ( not ( = ?auto_722444 ?auto_722446 ) ) ( not ( = ?auto_722444 ?auto_722447 ) ) ( not ( = ?auto_722444 ?auto_722448 ) ) ( not ( = ?auto_722444 ?auto_722449 ) ) ( not ( = ?auto_722444 ?auto_722450 ) ) ( not ( = ?auto_722444 ?auto_722451 ) ) ( not ( = ?auto_722444 ?auto_722452 ) ) ( not ( = ?auto_722444 ?auto_722453 ) ) ( not ( = ?auto_722444 ?auto_722454 ) ) ( not ( = ?auto_722444 ?auto_722455 ) ) ( not ( = ?auto_722444 ?auto_722456 ) ) ( not ( = ?auto_722445 ?auto_722446 ) ) ( not ( = ?auto_722445 ?auto_722447 ) ) ( not ( = ?auto_722445 ?auto_722448 ) ) ( not ( = ?auto_722445 ?auto_722449 ) ) ( not ( = ?auto_722445 ?auto_722450 ) ) ( not ( = ?auto_722445 ?auto_722451 ) ) ( not ( = ?auto_722445 ?auto_722452 ) ) ( not ( = ?auto_722445 ?auto_722453 ) ) ( not ( = ?auto_722445 ?auto_722454 ) ) ( not ( = ?auto_722445 ?auto_722455 ) ) ( not ( = ?auto_722445 ?auto_722456 ) ) ( not ( = ?auto_722446 ?auto_722447 ) ) ( not ( = ?auto_722446 ?auto_722448 ) ) ( not ( = ?auto_722446 ?auto_722449 ) ) ( not ( = ?auto_722446 ?auto_722450 ) ) ( not ( = ?auto_722446 ?auto_722451 ) ) ( not ( = ?auto_722446 ?auto_722452 ) ) ( not ( = ?auto_722446 ?auto_722453 ) ) ( not ( = ?auto_722446 ?auto_722454 ) ) ( not ( = ?auto_722446 ?auto_722455 ) ) ( not ( = ?auto_722446 ?auto_722456 ) ) ( not ( = ?auto_722447 ?auto_722448 ) ) ( not ( = ?auto_722447 ?auto_722449 ) ) ( not ( = ?auto_722447 ?auto_722450 ) ) ( not ( = ?auto_722447 ?auto_722451 ) ) ( not ( = ?auto_722447 ?auto_722452 ) ) ( not ( = ?auto_722447 ?auto_722453 ) ) ( not ( = ?auto_722447 ?auto_722454 ) ) ( not ( = ?auto_722447 ?auto_722455 ) ) ( not ( = ?auto_722447 ?auto_722456 ) ) ( not ( = ?auto_722448 ?auto_722449 ) ) ( not ( = ?auto_722448 ?auto_722450 ) ) ( not ( = ?auto_722448 ?auto_722451 ) ) ( not ( = ?auto_722448 ?auto_722452 ) ) ( not ( = ?auto_722448 ?auto_722453 ) ) ( not ( = ?auto_722448 ?auto_722454 ) ) ( not ( = ?auto_722448 ?auto_722455 ) ) ( not ( = ?auto_722448 ?auto_722456 ) ) ( not ( = ?auto_722449 ?auto_722450 ) ) ( not ( = ?auto_722449 ?auto_722451 ) ) ( not ( = ?auto_722449 ?auto_722452 ) ) ( not ( = ?auto_722449 ?auto_722453 ) ) ( not ( = ?auto_722449 ?auto_722454 ) ) ( not ( = ?auto_722449 ?auto_722455 ) ) ( not ( = ?auto_722449 ?auto_722456 ) ) ( not ( = ?auto_722450 ?auto_722451 ) ) ( not ( = ?auto_722450 ?auto_722452 ) ) ( not ( = ?auto_722450 ?auto_722453 ) ) ( not ( = ?auto_722450 ?auto_722454 ) ) ( not ( = ?auto_722450 ?auto_722455 ) ) ( not ( = ?auto_722450 ?auto_722456 ) ) ( not ( = ?auto_722451 ?auto_722452 ) ) ( not ( = ?auto_722451 ?auto_722453 ) ) ( not ( = ?auto_722451 ?auto_722454 ) ) ( not ( = ?auto_722451 ?auto_722455 ) ) ( not ( = ?auto_722451 ?auto_722456 ) ) ( not ( = ?auto_722452 ?auto_722453 ) ) ( not ( = ?auto_722452 ?auto_722454 ) ) ( not ( = ?auto_722452 ?auto_722455 ) ) ( not ( = ?auto_722452 ?auto_722456 ) ) ( not ( = ?auto_722453 ?auto_722454 ) ) ( not ( = ?auto_722453 ?auto_722455 ) ) ( not ( = ?auto_722453 ?auto_722456 ) ) ( not ( = ?auto_722454 ?auto_722455 ) ) ( not ( = ?auto_722454 ?auto_722456 ) ) ( not ( = ?auto_722455 ?auto_722456 ) ) ( ON ?auto_722454 ?auto_722455 ) ( ON ?auto_722453 ?auto_722454 ) ( ON ?auto_722452 ?auto_722453 ) ( ON ?auto_722451 ?auto_722452 ) ( ON ?auto_722450 ?auto_722451 ) ( ON ?auto_722449 ?auto_722450 ) ( ON ?auto_722448 ?auto_722449 ) ( ON ?auto_722447 ?auto_722448 ) ( ON ?auto_722446 ?auto_722447 ) ( ON ?auto_722445 ?auto_722446 ) ( ON ?auto_722444 ?auto_722445 ) ( ON ?auto_722443 ?auto_722444 ) ( ON ?auto_722442 ?auto_722443 ) ( ON ?auto_722441 ?auto_722442 ) ( CLEAR ?auto_722441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_722441 )
      ( MAKE-15PILE ?auto_722441 ?auto_722442 ?auto_722443 ?auto_722444 ?auto_722445 ?auto_722446 ?auto_722447 ?auto_722448 ?auto_722449 ?auto_722450 ?auto_722451 ?auto_722452 ?auto_722453 ?auto_722454 ?auto_722455 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722504 - BLOCK
      ?auto_722505 - BLOCK
      ?auto_722506 - BLOCK
      ?auto_722507 - BLOCK
      ?auto_722508 - BLOCK
      ?auto_722509 - BLOCK
      ?auto_722510 - BLOCK
      ?auto_722511 - BLOCK
      ?auto_722512 - BLOCK
      ?auto_722513 - BLOCK
      ?auto_722514 - BLOCK
      ?auto_722515 - BLOCK
      ?auto_722516 - BLOCK
      ?auto_722517 - BLOCK
      ?auto_722518 - BLOCK
      ?auto_722519 - BLOCK
    )
    :vars
    (
      ?auto_722520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_722518 ) ( ON ?auto_722519 ?auto_722520 ) ( CLEAR ?auto_722519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_722504 ) ( ON ?auto_722505 ?auto_722504 ) ( ON ?auto_722506 ?auto_722505 ) ( ON ?auto_722507 ?auto_722506 ) ( ON ?auto_722508 ?auto_722507 ) ( ON ?auto_722509 ?auto_722508 ) ( ON ?auto_722510 ?auto_722509 ) ( ON ?auto_722511 ?auto_722510 ) ( ON ?auto_722512 ?auto_722511 ) ( ON ?auto_722513 ?auto_722512 ) ( ON ?auto_722514 ?auto_722513 ) ( ON ?auto_722515 ?auto_722514 ) ( ON ?auto_722516 ?auto_722515 ) ( ON ?auto_722517 ?auto_722516 ) ( ON ?auto_722518 ?auto_722517 ) ( not ( = ?auto_722504 ?auto_722505 ) ) ( not ( = ?auto_722504 ?auto_722506 ) ) ( not ( = ?auto_722504 ?auto_722507 ) ) ( not ( = ?auto_722504 ?auto_722508 ) ) ( not ( = ?auto_722504 ?auto_722509 ) ) ( not ( = ?auto_722504 ?auto_722510 ) ) ( not ( = ?auto_722504 ?auto_722511 ) ) ( not ( = ?auto_722504 ?auto_722512 ) ) ( not ( = ?auto_722504 ?auto_722513 ) ) ( not ( = ?auto_722504 ?auto_722514 ) ) ( not ( = ?auto_722504 ?auto_722515 ) ) ( not ( = ?auto_722504 ?auto_722516 ) ) ( not ( = ?auto_722504 ?auto_722517 ) ) ( not ( = ?auto_722504 ?auto_722518 ) ) ( not ( = ?auto_722504 ?auto_722519 ) ) ( not ( = ?auto_722504 ?auto_722520 ) ) ( not ( = ?auto_722505 ?auto_722506 ) ) ( not ( = ?auto_722505 ?auto_722507 ) ) ( not ( = ?auto_722505 ?auto_722508 ) ) ( not ( = ?auto_722505 ?auto_722509 ) ) ( not ( = ?auto_722505 ?auto_722510 ) ) ( not ( = ?auto_722505 ?auto_722511 ) ) ( not ( = ?auto_722505 ?auto_722512 ) ) ( not ( = ?auto_722505 ?auto_722513 ) ) ( not ( = ?auto_722505 ?auto_722514 ) ) ( not ( = ?auto_722505 ?auto_722515 ) ) ( not ( = ?auto_722505 ?auto_722516 ) ) ( not ( = ?auto_722505 ?auto_722517 ) ) ( not ( = ?auto_722505 ?auto_722518 ) ) ( not ( = ?auto_722505 ?auto_722519 ) ) ( not ( = ?auto_722505 ?auto_722520 ) ) ( not ( = ?auto_722506 ?auto_722507 ) ) ( not ( = ?auto_722506 ?auto_722508 ) ) ( not ( = ?auto_722506 ?auto_722509 ) ) ( not ( = ?auto_722506 ?auto_722510 ) ) ( not ( = ?auto_722506 ?auto_722511 ) ) ( not ( = ?auto_722506 ?auto_722512 ) ) ( not ( = ?auto_722506 ?auto_722513 ) ) ( not ( = ?auto_722506 ?auto_722514 ) ) ( not ( = ?auto_722506 ?auto_722515 ) ) ( not ( = ?auto_722506 ?auto_722516 ) ) ( not ( = ?auto_722506 ?auto_722517 ) ) ( not ( = ?auto_722506 ?auto_722518 ) ) ( not ( = ?auto_722506 ?auto_722519 ) ) ( not ( = ?auto_722506 ?auto_722520 ) ) ( not ( = ?auto_722507 ?auto_722508 ) ) ( not ( = ?auto_722507 ?auto_722509 ) ) ( not ( = ?auto_722507 ?auto_722510 ) ) ( not ( = ?auto_722507 ?auto_722511 ) ) ( not ( = ?auto_722507 ?auto_722512 ) ) ( not ( = ?auto_722507 ?auto_722513 ) ) ( not ( = ?auto_722507 ?auto_722514 ) ) ( not ( = ?auto_722507 ?auto_722515 ) ) ( not ( = ?auto_722507 ?auto_722516 ) ) ( not ( = ?auto_722507 ?auto_722517 ) ) ( not ( = ?auto_722507 ?auto_722518 ) ) ( not ( = ?auto_722507 ?auto_722519 ) ) ( not ( = ?auto_722507 ?auto_722520 ) ) ( not ( = ?auto_722508 ?auto_722509 ) ) ( not ( = ?auto_722508 ?auto_722510 ) ) ( not ( = ?auto_722508 ?auto_722511 ) ) ( not ( = ?auto_722508 ?auto_722512 ) ) ( not ( = ?auto_722508 ?auto_722513 ) ) ( not ( = ?auto_722508 ?auto_722514 ) ) ( not ( = ?auto_722508 ?auto_722515 ) ) ( not ( = ?auto_722508 ?auto_722516 ) ) ( not ( = ?auto_722508 ?auto_722517 ) ) ( not ( = ?auto_722508 ?auto_722518 ) ) ( not ( = ?auto_722508 ?auto_722519 ) ) ( not ( = ?auto_722508 ?auto_722520 ) ) ( not ( = ?auto_722509 ?auto_722510 ) ) ( not ( = ?auto_722509 ?auto_722511 ) ) ( not ( = ?auto_722509 ?auto_722512 ) ) ( not ( = ?auto_722509 ?auto_722513 ) ) ( not ( = ?auto_722509 ?auto_722514 ) ) ( not ( = ?auto_722509 ?auto_722515 ) ) ( not ( = ?auto_722509 ?auto_722516 ) ) ( not ( = ?auto_722509 ?auto_722517 ) ) ( not ( = ?auto_722509 ?auto_722518 ) ) ( not ( = ?auto_722509 ?auto_722519 ) ) ( not ( = ?auto_722509 ?auto_722520 ) ) ( not ( = ?auto_722510 ?auto_722511 ) ) ( not ( = ?auto_722510 ?auto_722512 ) ) ( not ( = ?auto_722510 ?auto_722513 ) ) ( not ( = ?auto_722510 ?auto_722514 ) ) ( not ( = ?auto_722510 ?auto_722515 ) ) ( not ( = ?auto_722510 ?auto_722516 ) ) ( not ( = ?auto_722510 ?auto_722517 ) ) ( not ( = ?auto_722510 ?auto_722518 ) ) ( not ( = ?auto_722510 ?auto_722519 ) ) ( not ( = ?auto_722510 ?auto_722520 ) ) ( not ( = ?auto_722511 ?auto_722512 ) ) ( not ( = ?auto_722511 ?auto_722513 ) ) ( not ( = ?auto_722511 ?auto_722514 ) ) ( not ( = ?auto_722511 ?auto_722515 ) ) ( not ( = ?auto_722511 ?auto_722516 ) ) ( not ( = ?auto_722511 ?auto_722517 ) ) ( not ( = ?auto_722511 ?auto_722518 ) ) ( not ( = ?auto_722511 ?auto_722519 ) ) ( not ( = ?auto_722511 ?auto_722520 ) ) ( not ( = ?auto_722512 ?auto_722513 ) ) ( not ( = ?auto_722512 ?auto_722514 ) ) ( not ( = ?auto_722512 ?auto_722515 ) ) ( not ( = ?auto_722512 ?auto_722516 ) ) ( not ( = ?auto_722512 ?auto_722517 ) ) ( not ( = ?auto_722512 ?auto_722518 ) ) ( not ( = ?auto_722512 ?auto_722519 ) ) ( not ( = ?auto_722512 ?auto_722520 ) ) ( not ( = ?auto_722513 ?auto_722514 ) ) ( not ( = ?auto_722513 ?auto_722515 ) ) ( not ( = ?auto_722513 ?auto_722516 ) ) ( not ( = ?auto_722513 ?auto_722517 ) ) ( not ( = ?auto_722513 ?auto_722518 ) ) ( not ( = ?auto_722513 ?auto_722519 ) ) ( not ( = ?auto_722513 ?auto_722520 ) ) ( not ( = ?auto_722514 ?auto_722515 ) ) ( not ( = ?auto_722514 ?auto_722516 ) ) ( not ( = ?auto_722514 ?auto_722517 ) ) ( not ( = ?auto_722514 ?auto_722518 ) ) ( not ( = ?auto_722514 ?auto_722519 ) ) ( not ( = ?auto_722514 ?auto_722520 ) ) ( not ( = ?auto_722515 ?auto_722516 ) ) ( not ( = ?auto_722515 ?auto_722517 ) ) ( not ( = ?auto_722515 ?auto_722518 ) ) ( not ( = ?auto_722515 ?auto_722519 ) ) ( not ( = ?auto_722515 ?auto_722520 ) ) ( not ( = ?auto_722516 ?auto_722517 ) ) ( not ( = ?auto_722516 ?auto_722518 ) ) ( not ( = ?auto_722516 ?auto_722519 ) ) ( not ( = ?auto_722516 ?auto_722520 ) ) ( not ( = ?auto_722517 ?auto_722518 ) ) ( not ( = ?auto_722517 ?auto_722519 ) ) ( not ( = ?auto_722517 ?auto_722520 ) ) ( not ( = ?auto_722518 ?auto_722519 ) ) ( not ( = ?auto_722518 ?auto_722520 ) ) ( not ( = ?auto_722519 ?auto_722520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_722519 ?auto_722520 )
      ( !STACK ?auto_722519 ?auto_722518 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722570 - BLOCK
      ?auto_722571 - BLOCK
      ?auto_722572 - BLOCK
      ?auto_722573 - BLOCK
      ?auto_722574 - BLOCK
      ?auto_722575 - BLOCK
      ?auto_722576 - BLOCK
      ?auto_722577 - BLOCK
      ?auto_722578 - BLOCK
      ?auto_722579 - BLOCK
      ?auto_722580 - BLOCK
      ?auto_722581 - BLOCK
      ?auto_722582 - BLOCK
      ?auto_722583 - BLOCK
      ?auto_722584 - BLOCK
      ?auto_722585 - BLOCK
    )
    :vars
    (
      ?auto_722586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722585 ?auto_722586 ) ( ON-TABLE ?auto_722570 ) ( ON ?auto_722571 ?auto_722570 ) ( ON ?auto_722572 ?auto_722571 ) ( ON ?auto_722573 ?auto_722572 ) ( ON ?auto_722574 ?auto_722573 ) ( ON ?auto_722575 ?auto_722574 ) ( ON ?auto_722576 ?auto_722575 ) ( ON ?auto_722577 ?auto_722576 ) ( ON ?auto_722578 ?auto_722577 ) ( ON ?auto_722579 ?auto_722578 ) ( ON ?auto_722580 ?auto_722579 ) ( ON ?auto_722581 ?auto_722580 ) ( ON ?auto_722582 ?auto_722581 ) ( ON ?auto_722583 ?auto_722582 ) ( not ( = ?auto_722570 ?auto_722571 ) ) ( not ( = ?auto_722570 ?auto_722572 ) ) ( not ( = ?auto_722570 ?auto_722573 ) ) ( not ( = ?auto_722570 ?auto_722574 ) ) ( not ( = ?auto_722570 ?auto_722575 ) ) ( not ( = ?auto_722570 ?auto_722576 ) ) ( not ( = ?auto_722570 ?auto_722577 ) ) ( not ( = ?auto_722570 ?auto_722578 ) ) ( not ( = ?auto_722570 ?auto_722579 ) ) ( not ( = ?auto_722570 ?auto_722580 ) ) ( not ( = ?auto_722570 ?auto_722581 ) ) ( not ( = ?auto_722570 ?auto_722582 ) ) ( not ( = ?auto_722570 ?auto_722583 ) ) ( not ( = ?auto_722570 ?auto_722584 ) ) ( not ( = ?auto_722570 ?auto_722585 ) ) ( not ( = ?auto_722570 ?auto_722586 ) ) ( not ( = ?auto_722571 ?auto_722572 ) ) ( not ( = ?auto_722571 ?auto_722573 ) ) ( not ( = ?auto_722571 ?auto_722574 ) ) ( not ( = ?auto_722571 ?auto_722575 ) ) ( not ( = ?auto_722571 ?auto_722576 ) ) ( not ( = ?auto_722571 ?auto_722577 ) ) ( not ( = ?auto_722571 ?auto_722578 ) ) ( not ( = ?auto_722571 ?auto_722579 ) ) ( not ( = ?auto_722571 ?auto_722580 ) ) ( not ( = ?auto_722571 ?auto_722581 ) ) ( not ( = ?auto_722571 ?auto_722582 ) ) ( not ( = ?auto_722571 ?auto_722583 ) ) ( not ( = ?auto_722571 ?auto_722584 ) ) ( not ( = ?auto_722571 ?auto_722585 ) ) ( not ( = ?auto_722571 ?auto_722586 ) ) ( not ( = ?auto_722572 ?auto_722573 ) ) ( not ( = ?auto_722572 ?auto_722574 ) ) ( not ( = ?auto_722572 ?auto_722575 ) ) ( not ( = ?auto_722572 ?auto_722576 ) ) ( not ( = ?auto_722572 ?auto_722577 ) ) ( not ( = ?auto_722572 ?auto_722578 ) ) ( not ( = ?auto_722572 ?auto_722579 ) ) ( not ( = ?auto_722572 ?auto_722580 ) ) ( not ( = ?auto_722572 ?auto_722581 ) ) ( not ( = ?auto_722572 ?auto_722582 ) ) ( not ( = ?auto_722572 ?auto_722583 ) ) ( not ( = ?auto_722572 ?auto_722584 ) ) ( not ( = ?auto_722572 ?auto_722585 ) ) ( not ( = ?auto_722572 ?auto_722586 ) ) ( not ( = ?auto_722573 ?auto_722574 ) ) ( not ( = ?auto_722573 ?auto_722575 ) ) ( not ( = ?auto_722573 ?auto_722576 ) ) ( not ( = ?auto_722573 ?auto_722577 ) ) ( not ( = ?auto_722573 ?auto_722578 ) ) ( not ( = ?auto_722573 ?auto_722579 ) ) ( not ( = ?auto_722573 ?auto_722580 ) ) ( not ( = ?auto_722573 ?auto_722581 ) ) ( not ( = ?auto_722573 ?auto_722582 ) ) ( not ( = ?auto_722573 ?auto_722583 ) ) ( not ( = ?auto_722573 ?auto_722584 ) ) ( not ( = ?auto_722573 ?auto_722585 ) ) ( not ( = ?auto_722573 ?auto_722586 ) ) ( not ( = ?auto_722574 ?auto_722575 ) ) ( not ( = ?auto_722574 ?auto_722576 ) ) ( not ( = ?auto_722574 ?auto_722577 ) ) ( not ( = ?auto_722574 ?auto_722578 ) ) ( not ( = ?auto_722574 ?auto_722579 ) ) ( not ( = ?auto_722574 ?auto_722580 ) ) ( not ( = ?auto_722574 ?auto_722581 ) ) ( not ( = ?auto_722574 ?auto_722582 ) ) ( not ( = ?auto_722574 ?auto_722583 ) ) ( not ( = ?auto_722574 ?auto_722584 ) ) ( not ( = ?auto_722574 ?auto_722585 ) ) ( not ( = ?auto_722574 ?auto_722586 ) ) ( not ( = ?auto_722575 ?auto_722576 ) ) ( not ( = ?auto_722575 ?auto_722577 ) ) ( not ( = ?auto_722575 ?auto_722578 ) ) ( not ( = ?auto_722575 ?auto_722579 ) ) ( not ( = ?auto_722575 ?auto_722580 ) ) ( not ( = ?auto_722575 ?auto_722581 ) ) ( not ( = ?auto_722575 ?auto_722582 ) ) ( not ( = ?auto_722575 ?auto_722583 ) ) ( not ( = ?auto_722575 ?auto_722584 ) ) ( not ( = ?auto_722575 ?auto_722585 ) ) ( not ( = ?auto_722575 ?auto_722586 ) ) ( not ( = ?auto_722576 ?auto_722577 ) ) ( not ( = ?auto_722576 ?auto_722578 ) ) ( not ( = ?auto_722576 ?auto_722579 ) ) ( not ( = ?auto_722576 ?auto_722580 ) ) ( not ( = ?auto_722576 ?auto_722581 ) ) ( not ( = ?auto_722576 ?auto_722582 ) ) ( not ( = ?auto_722576 ?auto_722583 ) ) ( not ( = ?auto_722576 ?auto_722584 ) ) ( not ( = ?auto_722576 ?auto_722585 ) ) ( not ( = ?auto_722576 ?auto_722586 ) ) ( not ( = ?auto_722577 ?auto_722578 ) ) ( not ( = ?auto_722577 ?auto_722579 ) ) ( not ( = ?auto_722577 ?auto_722580 ) ) ( not ( = ?auto_722577 ?auto_722581 ) ) ( not ( = ?auto_722577 ?auto_722582 ) ) ( not ( = ?auto_722577 ?auto_722583 ) ) ( not ( = ?auto_722577 ?auto_722584 ) ) ( not ( = ?auto_722577 ?auto_722585 ) ) ( not ( = ?auto_722577 ?auto_722586 ) ) ( not ( = ?auto_722578 ?auto_722579 ) ) ( not ( = ?auto_722578 ?auto_722580 ) ) ( not ( = ?auto_722578 ?auto_722581 ) ) ( not ( = ?auto_722578 ?auto_722582 ) ) ( not ( = ?auto_722578 ?auto_722583 ) ) ( not ( = ?auto_722578 ?auto_722584 ) ) ( not ( = ?auto_722578 ?auto_722585 ) ) ( not ( = ?auto_722578 ?auto_722586 ) ) ( not ( = ?auto_722579 ?auto_722580 ) ) ( not ( = ?auto_722579 ?auto_722581 ) ) ( not ( = ?auto_722579 ?auto_722582 ) ) ( not ( = ?auto_722579 ?auto_722583 ) ) ( not ( = ?auto_722579 ?auto_722584 ) ) ( not ( = ?auto_722579 ?auto_722585 ) ) ( not ( = ?auto_722579 ?auto_722586 ) ) ( not ( = ?auto_722580 ?auto_722581 ) ) ( not ( = ?auto_722580 ?auto_722582 ) ) ( not ( = ?auto_722580 ?auto_722583 ) ) ( not ( = ?auto_722580 ?auto_722584 ) ) ( not ( = ?auto_722580 ?auto_722585 ) ) ( not ( = ?auto_722580 ?auto_722586 ) ) ( not ( = ?auto_722581 ?auto_722582 ) ) ( not ( = ?auto_722581 ?auto_722583 ) ) ( not ( = ?auto_722581 ?auto_722584 ) ) ( not ( = ?auto_722581 ?auto_722585 ) ) ( not ( = ?auto_722581 ?auto_722586 ) ) ( not ( = ?auto_722582 ?auto_722583 ) ) ( not ( = ?auto_722582 ?auto_722584 ) ) ( not ( = ?auto_722582 ?auto_722585 ) ) ( not ( = ?auto_722582 ?auto_722586 ) ) ( not ( = ?auto_722583 ?auto_722584 ) ) ( not ( = ?auto_722583 ?auto_722585 ) ) ( not ( = ?auto_722583 ?auto_722586 ) ) ( not ( = ?auto_722584 ?auto_722585 ) ) ( not ( = ?auto_722584 ?auto_722586 ) ) ( not ( = ?auto_722585 ?auto_722586 ) ) ( CLEAR ?auto_722583 ) ( ON ?auto_722584 ?auto_722585 ) ( CLEAR ?auto_722584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_722570 ?auto_722571 ?auto_722572 ?auto_722573 ?auto_722574 ?auto_722575 ?auto_722576 ?auto_722577 ?auto_722578 ?auto_722579 ?auto_722580 ?auto_722581 ?auto_722582 ?auto_722583 ?auto_722584 )
      ( MAKE-16PILE ?auto_722570 ?auto_722571 ?auto_722572 ?auto_722573 ?auto_722574 ?auto_722575 ?auto_722576 ?auto_722577 ?auto_722578 ?auto_722579 ?auto_722580 ?auto_722581 ?auto_722582 ?auto_722583 ?auto_722584 ?auto_722585 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722636 - BLOCK
      ?auto_722637 - BLOCK
      ?auto_722638 - BLOCK
      ?auto_722639 - BLOCK
      ?auto_722640 - BLOCK
      ?auto_722641 - BLOCK
      ?auto_722642 - BLOCK
      ?auto_722643 - BLOCK
      ?auto_722644 - BLOCK
      ?auto_722645 - BLOCK
      ?auto_722646 - BLOCK
      ?auto_722647 - BLOCK
      ?auto_722648 - BLOCK
      ?auto_722649 - BLOCK
      ?auto_722650 - BLOCK
      ?auto_722651 - BLOCK
    )
    :vars
    (
      ?auto_722652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722651 ?auto_722652 ) ( ON-TABLE ?auto_722636 ) ( ON ?auto_722637 ?auto_722636 ) ( ON ?auto_722638 ?auto_722637 ) ( ON ?auto_722639 ?auto_722638 ) ( ON ?auto_722640 ?auto_722639 ) ( ON ?auto_722641 ?auto_722640 ) ( ON ?auto_722642 ?auto_722641 ) ( ON ?auto_722643 ?auto_722642 ) ( ON ?auto_722644 ?auto_722643 ) ( ON ?auto_722645 ?auto_722644 ) ( ON ?auto_722646 ?auto_722645 ) ( ON ?auto_722647 ?auto_722646 ) ( ON ?auto_722648 ?auto_722647 ) ( not ( = ?auto_722636 ?auto_722637 ) ) ( not ( = ?auto_722636 ?auto_722638 ) ) ( not ( = ?auto_722636 ?auto_722639 ) ) ( not ( = ?auto_722636 ?auto_722640 ) ) ( not ( = ?auto_722636 ?auto_722641 ) ) ( not ( = ?auto_722636 ?auto_722642 ) ) ( not ( = ?auto_722636 ?auto_722643 ) ) ( not ( = ?auto_722636 ?auto_722644 ) ) ( not ( = ?auto_722636 ?auto_722645 ) ) ( not ( = ?auto_722636 ?auto_722646 ) ) ( not ( = ?auto_722636 ?auto_722647 ) ) ( not ( = ?auto_722636 ?auto_722648 ) ) ( not ( = ?auto_722636 ?auto_722649 ) ) ( not ( = ?auto_722636 ?auto_722650 ) ) ( not ( = ?auto_722636 ?auto_722651 ) ) ( not ( = ?auto_722636 ?auto_722652 ) ) ( not ( = ?auto_722637 ?auto_722638 ) ) ( not ( = ?auto_722637 ?auto_722639 ) ) ( not ( = ?auto_722637 ?auto_722640 ) ) ( not ( = ?auto_722637 ?auto_722641 ) ) ( not ( = ?auto_722637 ?auto_722642 ) ) ( not ( = ?auto_722637 ?auto_722643 ) ) ( not ( = ?auto_722637 ?auto_722644 ) ) ( not ( = ?auto_722637 ?auto_722645 ) ) ( not ( = ?auto_722637 ?auto_722646 ) ) ( not ( = ?auto_722637 ?auto_722647 ) ) ( not ( = ?auto_722637 ?auto_722648 ) ) ( not ( = ?auto_722637 ?auto_722649 ) ) ( not ( = ?auto_722637 ?auto_722650 ) ) ( not ( = ?auto_722637 ?auto_722651 ) ) ( not ( = ?auto_722637 ?auto_722652 ) ) ( not ( = ?auto_722638 ?auto_722639 ) ) ( not ( = ?auto_722638 ?auto_722640 ) ) ( not ( = ?auto_722638 ?auto_722641 ) ) ( not ( = ?auto_722638 ?auto_722642 ) ) ( not ( = ?auto_722638 ?auto_722643 ) ) ( not ( = ?auto_722638 ?auto_722644 ) ) ( not ( = ?auto_722638 ?auto_722645 ) ) ( not ( = ?auto_722638 ?auto_722646 ) ) ( not ( = ?auto_722638 ?auto_722647 ) ) ( not ( = ?auto_722638 ?auto_722648 ) ) ( not ( = ?auto_722638 ?auto_722649 ) ) ( not ( = ?auto_722638 ?auto_722650 ) ) ( not ( = ?auto_722638 ?auto_722651 ) ) ( not ( = ?auto_722638 ?auto_722652 ) ) ( not ( = ?auto_722639 ?auto_722640 ) ) ( not ( = ?auto_722639 ?auto_722641 ) ) ( not ( = ?auto_722639 ?auto_722642 ) ) ( not ( = ?auto_722639 ?auto_722643 ) ) ( not ( = ?auto_722639 ?auto_722644 ) ) ( not ( = ?auto_722639 ?auto_722645 ) ) ( not ( = ?auto_722639 ?auto_722646 ) ) ( not ( = ?auto_722639 ?auto_722647 ) ) ( not ( = ?auto_722639 ?auto_722648 ) ) ( not ( = ?auto_722639 ?auto_722649 ) ) ( not ( = ?auto_722639 ?auto_722650 ) ) ( not ( = ?auto_722639 ?auto_722651 ) ) ( not ( = ?auto_722639 ?auto_722652 ) ) ( not ( = ?auto_722640 ?auto_722641 ) ) ( not ( = ?auto_722640 ?auto_722642 ) ) ( not ( = ?auto_722640 ?auto_722643 ) ) ( not ( = ?auto_722640 ?auto_722644 ) ) ( not ( = ?auto_722640 ?auto_722645 ) ) ( not ( = ?auto_722640 ?auto_722646 ) ) ( not ( = ?auto_722640 ?auto_722647 ) ) ( not ( = ?auto_722640 ?auto_722648 ) ) ( not ( = ?auto_722640 ?auto_722649 ) ) ( not ( = ?auto_722640 ?auto_722650 ) ) ( not ( = ?auto_722640 ?auto_722651 ) ) ( not ( = ?auto_722640 ?auto_722652 ) ) ( not ( = ?auto_722641 ?auto_722642 ) ) ( not ( = ?auto_722641 ?auto_722643 ) ) ( not ( = ?auto_722641 ?auto_722644 ) ) ( not ( = ?auto_722641 ?auto_722645 ) ) ( not ( = ?auto_722641 ?auto_722646 ) ) ( not ( = ?auto_722641 ?auto_722647 ) ) ( not ( = ?auto_722641 ?auto_722648 ) ) ( not ( = ?auto_722641 ?auto_722649 ) ) ( not ( = ?auto_722641 ?auto_722650 ) ) ( not ( = ?auto_722641 ?auto_722651 ) ) ( not ( = ?auto_722641 ?auto_722652 ) ) ( not ( = ?auto_722642 ?auto_722643 ) ) ( not ( = ?auto_722642 ?auto_722644 ) ) ( not ( = ?auto_722642 ?auto_722645 ) ) ( not ( = ?auto_722642 ?auto_722646 ) ) ( not ( = ?auto_722642 ?auto_722647 ) ) ( not ( = ?auto_722642 ?auto_722648 ) ) ( not ( = ?auto_722642 ?auto_722649 ) ) ( not ( = ?auto_722642 ?auto_722650 ) ) ( not ( = ?auto_722642 ?auto_722651 ) ) ( not ( = ?auto_722642 ?auto_722652 ) ) ( not ( = ?auto_722643 ?auto_722644 ) ) ( not ( = ?auto_722643 ?auto_722645 ) ) ( not ( = ?auto_722643 ?auto_722646 ) ) ( not ( = ?auto_722643 ?auto_722647 ) ) ( not ( = ?auto_722643 ?auto_722648 ) ) ( not ( = ?auto_722643 ?auto_722649 ) ) ( not ( = ?auto_722643 ?auto_722650 ) ) ( not ( = ?auto_722643 ?auto_722651 ) ) ( not ( = ?auto_722643 ?auto_722652 ) ) ( not ( = ?auto_722644 ?auto_722645 ) ) ( not ( = ?auto_722644 ?auto_722646 ) ) ( not ( = ?auto_722644 ?auto_722647 ) ) ( not ( = ?auto_722644 ?auto_722648 ) ) ( not ( = ?auto_722644 ?auto_722649 ) ) ( not ( = ?auto_722644 ?auto_722650 ) ) ( not ( = ?auto_722644 ?auto_722651 ) ) ( not ( = ?auto_722644 ?auto_722652 ) ) ( not ( = ?auto_722645 ?auto_722646 ) ) ( not ( = ?auto_722645 ?auto_722647 ) ) ( not ( = ?auto_722645 ?auto_722648 ) ) ( not ( = ?auto_722645 ?auto_722649 ) ) ( not ( = ?auto_722645 ?auto_722650 ) ) ( not ( = ?auto_722645 ?auto_722651 ) ) ( not ( = ?auto_722645 ?auto_722652 ) ) ( not ( = ?auto_722646 ?auto_722647 ) ) ( not ( = ?auto_722646 ?auto_722648 ) ) ( not ( = ?auto_722646 ?auto_722649 ) ) ( not ( = ?auto_722646 ?auto_722650 ) ) ( not ( = ?auto_722646 ?auto_722651 ) ) ( not ( = ?auto_722646 ?auto_722652 ) ) ( not ( = ?auto_722647 ?auto_722648 ) ) ( not ( = ?auto_722647 ?auto_722649 ) ) ( not ( = ?auto_722647 ?auto_722650 ) ) ( not ( = ?auto_722647 ?auto_722651 ) ) ( not ( = ?auto_722647 ?auto_722652 ) ) ( not ( = ?auto_722648 ?auto_722649 ) ) ( not ( = ?auto_722648 ?auto_722650 ) ) ( not ( = ?auto_722648 ?auto_722651 ) ) ( not ( = ?auto_722648 ?auto_722652 ) ) ( not ( = ?auto_722649 ?auto_722650 ) ) ( not ( = ?auto_722649 ?auto_722651 ) ) ( not ( = ?auto_722649 ?auto_722652 ) ) ( not ( = ?auto_722650 ?auto_722651 ) ) ( not ( = ?auto_722650 ?auto_722652 ) ) ( not ( = ?auto_722651 ?auto_722652 ) ) ( ON ?auto_722650 ?auto_722651 ) ( CLEAR ?auto_722648 ) ( ON ?auto_722649 ?auto_722650 ) ( CLEAR ?auto_722649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_722636 ?auto_722637 ?auto_722638 ?auto_722639 ?auto_722640 ?auto_722641 ?auto_722642 ?auto_722643 ?auto_722644 ?auto_722645 ?auto_722646 ?auto_722647 ?auto_722648 ?auto_722649 )
      ( MAKE-16PILE ?auto_722636 ?auto_722637 ?auto_722638 ?auto_722639 ?auto_722640 ?auto_722641 ?auto_722642 ?auto_722643 ?auto_722644 ?auto_722645 ?auto_722646 ?auto_722647 ?auto_722648 ?auto_722649 ?auto_722650 ?auto_722651 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722702 - BLOCK
      ?auto_722703 - BLOCK
      ?auto_722704 - BLOCK
      ?auto_722705 - BLOCK
      ?auto_722706 - BLOCK
      ?auto_722707 - BLOCK
      ?auto_722708 - BLOCK
      ?auto_722709 - BLOCK
      ?auto_722710 - BLOCK
      ?auto_722711 - BLOCK
      ?auto_722712 - BLOCK
      ?auto_722713 - BLOCK
      ?auto_722714 - BLOCK
      ?auto_722715 - BLOCK
      ?auto_722716 - BLOCK
      ?auto_722717 - BLOCK
    )
    :vars
    (
      ?auto_722718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722717 ?auto_722718 ) ( ON-TABLE ?auto_722702 ) ( ON ?auto_722703 ?auto_722702 ) ( ON ?auto_722704 ?auto_722703 ) ( ON ?auto_722705 ?auto_722704 ) ( ON ?auto_722706 ?auto_722705 ) ( ON ?auto_722707 ?auto_722706 ) ( ON ?auto_722708 ?auto_722707 ) ( ON ?auto_722709 ?auto_722708 ) ( ON ?auto_722710 ?auto_722709 ) ( ON ?auto_722711 ?auto_722710 ) ( ON ?auto_722712 ?auto_722711 ) ( ON ?auto_722713 ?auto_722712 ) ( not ( = ?auto_722702 ?auto_722703 ) ) ( not ( = ?auto_722702 ?auto_722704 ) ) ( not ( = ?auto_722702 ?auto_722705 ) ) ( not ( = ?auto_722702 ?auto_722706 ) ) ( not ( = ?auto_722702 ?auto_722707 ) ) ( not ( = ?auto_722702 ?auto_722708 ) ) ( not ( = ?auto_722702 ?auto_722709 ) ) ( not ( = ?auto_722702 ?auto_722710 ) ) ( not ( = ?auto_722702 ?auto_722711 ) ) ( not ( = ?auto_722702 ?auto_722712 ) ) ( not ( = ?auto_722702 ?auto_722713 ) ) ( not ( = ?auto_722702 ?auto_722714 ) ) ( not ( = ?auto_722702 ?auto_722715 ) ) ( not ( = ?auto_722702 ?auto_722716 ) ) ( not ( = ?auto_722702 ?auto_722717 ) ) ( not ( = ?auto_722702 ?auto_722718 ) ) ( not ( = ?auto_722703 ?auto_722704 ) ) ( not ( = ?auto_722703 ?auto_722705 ) ) ( not ( = ?auto_722703 ?auto_722706 ) ) ( not ( = ?auto_722703 ?auto_722707 ) ) ( not ( = ?auto_722703 ?auto_722708 ) ) ( not ( = ?auto_722703 ?auto_722709 ) ) ( not ( = ?auto_722703 ?auto_722710 ) ) ( not ( = ?auto_722703 ?auto_722711 ) ) ( not ( = ?auto_722703 ?auto_722712 ) ) ( not ( = ?auto_722703 ?auto_722713 ) ) ( not ( = ?auto_722703 ?auto_722714 ) ) ( not ( = ?auto_722703 ?auto_722715 ) ) ( not ( = ?auto_722703 ?auto_722716 ) ) ( not ( = ?auto_722703 ?auto_722717 ) ) ( not ( = ?auto_722703 ?auto_722718 ) ) ( not ( = ?auto_722704 ?auto_722705 ) ) ( not ( = ?auto_722704 ?auto_722706 ) ) ( not ( = ?auto_722704 ?auto_722707 ) ) ( not ( = ?auto_722704 ?auto_722708 ) ) ( not ( = ?auto_722704 ?auto_722709 ) ) ( not ( = ?auto_722704 ?auto_722710 ) ) ( not ( = ?auto_722704 ?auto_722711 ) ) ( not ( = ?auto_722704 ?auto_722712 ) ) ( not ( = ?auto_722704 ?auto_722713 ) ) ( not ( = ?auto_722704 ?auto_722714 ) ) ( not ( = ?auto_722704 ?auto_722715 ) ) ( not ( = ?auto_722704 ?auto_722716 ) ) ( not ( = ?auto_722704 ?auto_722717 ) ) ( not ( = ?auto_722704 ?auto_722718 ) ) ( not ( = ?auto_722705 ?auto_722706 ) ) ( not ( = ?auto_722705 ?auto_722707 ) ) ( not ( = ?auto_722705 ?auto_722708 ) ) ( not ( = ?auto_722705 ?auto_722709 ) ) ( not ( = ?auto_722705 ?auto_722710 ) ) ( not ( = ?auto_722705 ?auto_722711 ) ) ( not ( = ?auto_722705 ?auto_722712 ) ) ( not ( = ?auto_722705 ?auto_722713 ) ) ( not ( = ?auto_722705 ?auto_722714 ) ) ( not ( = ?auto_722705 ?auto_722715 ) ) ( not ( = ?auto_722705 ?auto_722716 ) ) ( not ( = ?auto_722705 ?auto_722717 ) ) ( not ( = ?auto_722705 ?auto_722718 ) ) ( not ( = ?auto_722706 ?auto_722707 ) ) ( not ( = ?auto_722706 ?auto_722708 ) ) ( not ( = ?auto_722706 ?auto_722709 ) ) ( not ( = ?auto_722706 ?auto_722710 ) ) ( not ( = ?auto_722706 ?auto_722711 ) ) ( not ( = ?auto_722706 ?auto_722712 ) ) ( not ( = ?auto_722706 ?auto_722713 ) ) ( not ( = ?auto_722706 ?auto_722714 ) ) ( not ( = ?auto_722706 ?auto_722715 ) ) ( not ( = ?auto_722706 ?auto_722716 ) ) ( not ( = ?auto_722706 ?auto_722717 ) ) ( not ( = ?auto_722706 ?auto_722718 ) ) ( not ( = ?auto_722707 ?auto_722708 ) ) ( not ( = ?auto_722707 ?auto_722709 ) ) ( not ( = ?auto_722707 ?auto_722710 ) ) ( not ( = ?auto_722707 ?auto_722711 ) ) ( not ( = ?auto_722707 ?auto_722712 ) ) ( not ( = ?auto_722707 ?auto_722713 ) ) ( not ( = ?auto_722707 ?auto_722714 ) ) ( not ( = ?auto_722707 ?auto_722715 ) ) ( not ( = ?auto_722707 ?auto_722716 ) ) ( not ( = ?auto_722707 ?auto_722717 ) ) ( not ( = ?auto_722707 ?auto_722718 ) ) ( not ( = ?auto_722708 ?auto_722709 ) ) ( not ( = ?auto_722708 ?auto_722710 ) ) ( not ( = ?auto_722708 ?auto_722711 ) ) ( not ( = ?auto_722708 ?auto_722712 ) ) ( not ( = ?auto_722708 ?auto_722713 ) ) ( not ( = ?auto_722708 ?auto_722714 ) ) ( not ( = ?auto_722708 ?auto_722715 ) ) ( not ( = ?auto_722708 ?auto_722716 ) ) ( not ( = ?auto_722708 ?auto_722717 ) ) ( not ( = ?auto_722708 ?auto_722718 ) ) ( not ( = ?auto_722709 ?auto_722710 ) ) ( not ( = ?auto_722709 ?auto_722711 ) ) ( not ( = ?auto_722709 ?auto_722712 ) ) ( not ( = ?auto_722709 ?auto_722713 ) ) ( not ( = ?auto_722709 ?auto_722714 ) ) ( not ( = ?auto_722709 ?auto_722715 ) ) ( not ( = ?auto_722709 ?auto_722716 ) ) ( not ( = ?auto_722709 ?auto_722717 ) ) ( not ( = ?auto_722709 ?auto_722718 ) ) ( not ( = ?auto_722710 ?auto_722711 ) ) ( not ( = ?auto_722710 ?auto_722712 ) ) ( not ( = ?auto_722710 ?auto_722713 ) ) ( not ( = ?auto_722710 ?auto_722714 ) ) ( not ( = ?auto_722710 ?auto_722715 ) ) ( not ( = ?auto_722710 ?auto_722716 ) ) ( not ( = ?auto_722710 ?auto_722717 ) ) ( not ( = ?auto_722710 ?auto_722718 ) ) ( not ( = ?auto_722711 ?auto_722712 ) ) ( not ( = ?auto_722711 ?auto_722713 ) ) ( not ( = ?auto_722711 ?auto_722714 ) ) ( not ( = ?auto_722711 ?auto_722715 ) ) ( not ( = ?auto_722711 ?auto_722716 ) ) ( not ( = ?auto_722711 ?auto_722717 ) ) ( not ( = ?auto_722711 ?auto_722718 ) ) ( not ( = ?auto_722712 ?auto_722713 ) ) ( not ( = ?auto_722712 ?auto_722714 ) ) ( not ( = ?auto_722712 ?auto_722715 ) ) ( not ( = ?auto_722712 ?auto_722716 ) ) ( not ( = ?auto_722712 ?auto_722717 ) ) ( not ( = ?auto_722712 ?auto_722718 ) ) ( not ( = ?auto_722713 ?auto_722714 ) ) ( not ( = ?auto_722713 ?auto_722715 ) ) ( not ( = ?auto_722713 ?auto_722716 ) ) ( not ( = ?auto_722713 ?auto_722717 ) ) ( not ( = ?auto_722713 ?auto_722718 ) ) ( not ( = ?auto_722714 ?auto_722715 ) ) ( not ( = ?auto_722714 ?auto_722716 ) ) ( not ( = ?auto_722714 ?auto_722717 ) ) ( not ( = ?auto_722714 ?auto_722718 ) ) ( not ( = ?auto_722715 ?auto_722716 ) ) ( not ( = ?auto_722715 ?auto_722717 ) ) ( not ( = ?auto_722715 ?auto_722718 ) ) ( not ( = ?auto_722716 ?auto_722717 ) ) ( not ( = ?auto_722716 ?auto_722718 ) ) ( not ( = ?auto_722717 ?auto_722718 ) ) ( ON ?auto_722716 ?auto_722717 ) ( ON ?auto_722715 ?auto_722716 ) ( CLEAR ?auto_722713 ) ( ON ?auto_722714 ?auto_722715 ) ( CLEAR ?auto_722714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_722702 ?auto_722703 ?auto_722704 ?auto_722705 ?auto_722706 ?auto_722707 ?auto_722708 ?auto_722709 ?auto_722710 ?auto_722711 ?auto_722712 ?auto_722713 ?auto_722714 )
      ( MAKE-16PILE ?auto_722702 ?auto_722703 ?auto_722704 ?auto_722705 ?auto_722706 ?auto_722707 ?auto_722708 ?auto_722709 ?auto_722710 ?auto_722711 ?auto_722712 ?auto_722713 ?auto_722714 ?auto_722715 ?auto_722716 ?auto_722717 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722768 - BLOCK
      ?auto_722769 - BLOCK
      ?auto_722770 - BLOCK
      ?auto_722771 - BLOCK
      ?auto_722772 - BLOCK
      ?auto_722773 - BLOCK
      ?auto_722774 - BLOCK
      ?auto_722775 - BLOCK
      ?auto_722776 - BLOCK
      ?auto_722777 - BLOCK
      ?auto_722778 - BLOCK
      ?auto_722779 - BLOCK
      ?auto_722780 - BLOCK
      ?auto_722781 - BLOCK
      ?auto_722782 - BLOCK
      ?auto_722783 - BLOCK
    )
    :vars
    (
      ?auto_722784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722783 ?auto_722784 ) ( ON-TABLE ?auto_722768 ) ( ON ?auto_722769 ?auto_722768 ) ( ON ?auto_722770 ?auto_722769 ) ( ON ?auto_722771 ?auto_722770 ) ( ON ?auto_722772 ?auto_722771 ) ( ON ?auto_722773 ?auto_722772 ) ( ON ?auto_722774 ?auto_722773 ) ( ON ?auto_722775 ?auto_722774 ) ( ON ?auto_722776 ?auto_722775 ) ( ON ?auto_722777 ?auto_722776 ) ( ON ?auto_722778 ?auto_722777 ) ( not ( = ?auto_722768 ?auto_722769 ) ) ( not ( = ?auto_722768 ?auto_722770 ) ) ( not ( = ?auto_722768 ?auto_722771 ) ) ( not ( = ?auto_722768 ?auto_722772 ) ) ( not ( = ?auto_722768 ?auto_722773 ) ) ( not ( = ?auto_722768 ?auto_722774 ) ) ( not ( = ?auto_722768 ?auto_722775 ) ) ( not ( = ?auto_722768 ?auto_722776 ) ) ( not ( = ?auto_722768 ?auto_722777 ) ) ( not ( = ?auto_722768 ?auto_722778 ) ) ( not ( = ?auto_722768 ?auto_722779 ) ) ( not ( = ?auto_722768 ?auto_722780 ) ) ( not ( = ?auto_722768 ?auto_722781 ) ) ( not ( = ?auto_722768 ?auto_722782 ) ) ( not ( = ?auto_722768 ?auto_722783 ) ) ( not ( = ?auto_722768 ?auto_722784 ) ) ( not ( = ?auto_722769 ?auto_722770 ) ) ( not ( = ?auto_722769 ?auto_722771 ) ) ( not ( = ?auto_722769 ?auto_722772 ) ) ( not ( = ?auto_722769 ?auto_722773 ) ) ( not ( = ?auto_722769 ?auto_722774 ) ) ( not ( = ?auto_722769 ?auto_722775 ) ) ( not ( = ?auto_722769 ?auto_722776 ) ) ( not ( = ?auto_722769 ?auto_722777 ) ) ( not ( = ?auto_722769 ?auto_722778 ) ) ( not ( = ?auto_722769 ?auto_722779 ) ) ( not ( = ?auto_722769 ?auto_722780 ) ) ( not ( = ?auto_722769 ?auto_722781 ) ) ( not ( = ?auto_722769 ?auto_722782 ) ) ( not ( = ?auto_722769 ?auto_722783 ) ) ( not ( = ?auto_722769 ?auto_722784 ) ) ( not ( = ?auto_722770 ?auto_722771 ) ) ( not ( = ?auto_722770 ?auto_722772 ) ) ( not ( = ?auto_722770 ?auto_722773 ) ) ( not ( = ?auto_722770 ?auto_722774 ) ) ( not ( = ?auto_722770 ?auto_722775 ) ) ( not ( = ?auto_722770 ?auto_722776 ) ) ( not ( = ?auto_722770 ?auto_722777 ) ) ( not ( = ?auto_722770 ?auto_722778 ) ) ( not ( = ?auto_722770 ?auto_722779 ) ) ( not ( = ?auto_722770 ?auto_722780 ) ) ( not ( = ?auto_722770 ?auto_722781 ) ) ( not ( = ?auto_722770 ?auto_722782 ) ) ( not ( = ?auto_722770 ?auto_722783 ) ) ( not ( = ?auto_722770 ?auto_722784 ) ) ( not ( = ?auto_722771 ?auto_722772 ) ) ( not ( = ?auto_722771 ?auto_722773 ) ) ( not ( = ?auto_722771 ?auto_722774 ) ) ( not ( = ?auto_722771 ?auto_722775 ) ) ( not ( = ?auto_722771 ?auto_722776 ) ) ( not ( = ?auto_722771 ?auto_722777 ) ) ( not ( = ?auto_722771 ?auto_722778 ) ) ( not ( = ?auto_722771 ?auto_722779 ) ) ( not ( = ?auto_722771 ?auto_722780 ) ) ( not ( = ?auto_722771 ?auto_722781 ) ) ( not ( = ?auto_722771 ?auto_722782 ) ) ( not ( = ?auto_722771 ?auto_722783 ) ) ( not ( = ?auto_722771 ?auto_722784 ) ) ( not ( = ?auto_722772 ?auto_722773 ) ) ( not ( = ?auto_722772 ?auto_722774 ) ) ( not ( = ?auto_722772 ?auto_722775 ) ) ( not ( = ?auto_722772 ?auto_722776 ) ) ( not ( = ?auto_722772 ?auto_722777 ) ) ( not ( = ?auto_722772 ?auto_722778 ) ) ( not ( = ?auto_722772 ?auto_722779 ) ) ( not ( = ?auto_722772 ?auto_722780 ) ) ( not ( = ?auto_722772 ?auto_722781 ) ) ( not ( = ?auto_722772 ?auto_722782 ) ) ( not ( = ?auto_722772 ?auto_722783 ) ) ( not ( = ?auto_722772 ?auto_722784 ) ) ( not ( = ?auto_722773 ?auto_722774 ) ) ( not ( = ?auto_722773 ?auto_722775 ) ) ( not ( = ?auto_722773 ?auto_722776 ) ) ( not ( = ?auto_722773 ?auto_722777 ) ) ( not ( = ?auto_722773 ?auto_722778 ) ) ( not ( = ?auto_722773 ?auto_722779 ) ) ( not ( = ?auto_722773 ?auto_722780 ) ) ( not ( = ?auto_722773 ?auto_722781 ) ) ( not ( = ?auto_722773 ?auto_722782 ) ) ( not ( = ?auto_722773 ?auto_722783 ) ) ( not ( = ?auto_722773 ?auto_722784 ) ) ( not ( = ?auto_722774 ?auto_722775 ) ) ( not ( = ?auto_722774 ?auto_722776 ) ) ( not ( = ?auto_722774 ?auto_722777 ) ) ( not ( = ?auto_722774 ?auto_722778 ) ) ( not ( = ?auto_722774 ?auto_722779 ) ) ( not ( = ?auto_722774 ?auto_722780 ) ) ( not ( = ?auto_722774 ?auto_722781 ) ) ( not ( = ?auto_722774 ?auto_722782 ) ) ( not ( = ?auto_722774 ?auto_722783 ) ) ( not ( = ?auto_722774 ?auto_722784 ) ) ( not ( = ?auto_722775 ?auto_722776 ) ) ( not ( = ?auto_722775 ?auto_722777 ) ) ( not ( = ?auto_722775 ?auto_722778 ) ) ( not ( = ?auto_722775 ?auto_722779 ) ) ( not ( = ?auto_722775 ?auto_722780 ) ) ( not ( = ?auto_722775 ?auto_722781 ) ) ( not ( = ?auto_722775 ?auto_722782 ) ) ( not ( = ?auto_722775 ?auto_722783 ) ) ( not ( = ?auto_722775 ?auto_722784 ) ) ( not ( = ?auto_722776 ?auto_722777 ) ) ( not ( = ?auto_722776 ?auto_722778 ) ) ( not ( = ?auto_722776 ?auto_722779 ) ) ( not ( = ?auto_722776 ?auto_722780 ) ) ( not ( = ?auto_722776 ?auto_722781 ) ) ( not ( = ?auto_722776 ?auto_722782 ) ) ( not ( = ?auto_722776 ?auto_722783 ) ) ( not ( = ?auto_722776 ?auto_722784 ) ) ( not ( = ?auto_722777 ?auto_722778 ) ) ( not ( = ?auto_722777 ?auto_722779 ) ) ( not ( = ?auto_722777 ?auto_722780 ) ) ( not ( = ?auto_722777 ?auto_722781 ) ) ( not ( = ?auto_722777 ?auto_722782 ) ) ( not ( = ?auto_722777 ?auto_722783 ) ) ( not ( = ?auto_722777 ?auto_722784 ) ) ( not ( = ?auto_722778 ?auto_722779 ) ) ( not ( = ?auto_722778 ?auto_722780 ) ) ( not ( = ?auto_722778 ?auto_722781 ) ) ( not ( = ?auto_722778 ?auto_722782 ) ) ( not ( = ?auto_722778 ?auto_722783 ) ) ( not ( = ?auto_722778 ?auto_722784 ) ) ( not ( = ?auto_722779 ?auto_722780 ) ) ( not ( = ?auto_722779 ?auto_722781 ) ) ( not ( = ?auto_722779 ?auto_722782 ) ) ( not ( = ?auto_722779 ?auto_722783 ) ) ( not ( = ?auto_722779 ?auto_722784 ) ) ( not ( = ?auto_722780 ?auto_722781 ) ) ( not ( = ?auto_722780 ?auto_722782 ) ) ( not ( = ?auto_722780 ?auto_722783 ) ) ( not ( = ?auto_722780 ?auto_722784 ) ) ( not ( = ?auto_722781 ?auto_722782 ) ) ( not ( = ?auto_722781 ?auto_722783 ) ) ( not ( = ?auto_722781 ?auto_722784 ) ) ( not ( = ?auto_722782 ?auto_722783 ) ) ( not ( = ?auto_722782 ?auto_722784 ) ) ( not ( = ?auto_722783 ?auto_722784 ) ) ( ON ?auto_722782 ?auto_722783 ) ( ON ?auto_722781 ?auto_722782 ) ( ON ?auto_722780 ?auto_722781 ) ( CLEAR ?auto_722778 ) ( ON ?auto_722779 ?auto_722780 ) ( CLEAR ?auto_722779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_722768 ?auto_722769 ?auto_722770 ?auto_722771 ?auto_722772 ?auto_722773 ?auto_722774 ?auto_722775 ?auto_722776 ?auto_722777 ?auto_722778 ?auto_722779 )
      ( MAKE-16PILE ?auto_722768 ?auto_722769 ?auto_722770 ?auto_722771 ?auto_722772 ?auto_722773 ?auto_722774 ?auto_722775 ?auto_722776 ?auto_722777 ?auto_722778 ?auto_722779 ?auto_722780 ?auto_722781 ?auto_722782 ?auto_722783 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722834 - BLOCK
      ?auto_722835 - BLOCK
      ?auto_722836 - BLOCK
      ?auto_722837 - BLOCK
      ?auto_722838 - BLOCK
      ?auto_722839 - BLOCK
      ?auto_722840 - BLOCK
      ?auto_722841 - BLOCK
      ?auto_722842 - BLOCK
      ?auto_722843 - BLOCK
      ?auto_722844 - BLOCK
      ?auto_722845 - BLOCK
      ?auto_722846 - BLOCK
      ?auto_722847 - BLOCK
      ?auto_722848 - BLOCK
      ?auto_722849 - BLOCK
    )
    :vars
    (
      ?auto_722850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722849 ?auto_722850 ) ( ON-TABLE ?auto_722834 ) ( ON ?auto_722835 ?auto_722834 ) ( ON ?auto_722836 ?auto_722835 ) ( ON ?auto_722837 ?auto_722836 ) ( ON ?auto_722838 ?auto_722837 ) ( ON ?auto_722839 ?auto_722838 ) ( ON ?auto_722840 ?auto_722839 ) ( ON ?auto_722841 ?auto_722840 ) ( ON ?auto_722842 ?auto_722841 ) ( ON ?auto_722843 ?auto_722842 ) ( not ( = ?auto_722834 ?auto_722835 ) ) ( not ( = ?auto_722834 ?auto_722836 ) ) ( not ( = ?auto_722834 ?auto_722837 ) ) ( not ( = ?auto_722834 ?auto_722838 ) ) ( not ( = ?auto_722834 ?auto_722839 ) ) ( not ( = ?auto_722834 ?auto_722840 ) ) ( not ( = ?auto_722834 ?auto_722841 ) ) ( not ( = ?auto_722834 ?auto_722842 ) ) ( not ( = ?auto_722834 ?auto_722843 ) ) ( not ( = ?auto_722834 ?auto_722844 ) ) ( not ( = ?auto_722834 ?auto_722845 ) ) ( not ( = ?auto_722834 ?auto_722846 ) ) ( not ( = ?auto_722834 ?auto_722847 ) ) ( not ( = ?auto_722834 ?auto_722848 ) ) ( not ( = ?auto_722834 ?auto_722849 ) ) ( not ( = ?auto_722834 ?auto_722850 ) ) ( not ( = ?auto_722835 ?auto_722836 ) ) ( not ( = ?auto_722835 ?auto_722837 ) ) ( not ( = ?auto_722835 ?auto_722838 ) ) ( not ( = ?auto_722835 ?auto_722839 ) ) ( not ( = ?auto_722835 ?auto_722840 ) ) ( not ( = ?auto_722835 ?auto_722841 ) ) ( not ( = ?auto_722835 ?auto_722842 ) ) ( not ( = ?auto_722835 ?auto_722843 ) ) ( not ( = ?auto_722835 ?auto_722844 ) ) ( not ( = ?auto_722835 ?auto_722845 ) ) ( not ( = ?auto_722835 ?auto_722846 ) ) ( not ( = ?auto_722835 ?auto_722847 ) ) ( not ( = ?auto_722835 ?auto_722848 ) ) ( not ( = ?auto_722835 ?auto_722849 ) ) ( not ( = ?auto_722835 ?auto_722850 ) ) ( not ( = ?auto_722836 ?auto_722837 ) ) ( not ( = ?auto_722836 ?auto_722838 ) ) ( not ( = ?auto_722836 ?auto_722839 ) ) ( not ( = ?auto_722836 ?auto_722840 ) ) ( not ( = ?auto_722836 ?auto_722841 ) ) ( not ( = ?auto_722836 ?auto_722842 ) ) ( not ( = ?auto_722836 ?auto_722843 ) ) ( not ( = ?auto_722836 ?auto_722844 ) ) ( not ( = ?auto_722836 ?auto_722845 ) ) ( not ( = ?auto_722836 ?auto_722846 ) ) ( not ( = ?auto_722836 ?auto_722847 ) ) ( not ( = ?auto_722836 ?auto_722848 ) ) ( not ( = ?auto_722836 ?auto_722849 ) ) ( not ( = ?auto_722836 ?auto_722850 ) ) ( not ( = ?auto_722837 ?auto_722838 ) ) ( not ( = ?auto_722837 ?auto_722839 ) ) ( not ( = ?auto_722837 ?auto_722840 ) ) ( not ( = ?auto_722837 ?auto_722841 ) ) ( not ( = ?auto_722837 ?auto_722842 ) ) ( not ( = ?auto_722837 ?auto_722843 ) ) ( not ( = ?auto_722837 ?auto_722844 ) ) ( not ( = ?auto_722837 ?auto_722845 ) ) ( not ( = ?auto_722837 ?auto_722846 ) ) ( not ( = ?auto_722837 ?auto_722847 ) ) ( not ( = ?auto_722837 ?auto_722848 ) ) ( not ( = ?auto_722837 ?auto_722849 ) ) ( not ( = ?auto_722837 ?auto_722850 ) ) ( not ( = ?auto_722838 ?auto_722839 ) ) ( not ( = ?auto_722838 ?auto_722840 ) ) ( not ( = ?auto_722838 ?auto_722841 ) ) ( not ( = ?auto_722838 ?auto_722842 ) ) ( not ( = ?auto_722838 ?auto_722843 ) ) ( not ( = ?auto_722838 ?auto_722844 ) ) ( not ( = ?auto_722838 ?auto_722845 ) ) ( not ( = ?auto_722838 ?auto_722846 ) ) ( not ( = ?auto_722838 ?auto_722847 ) ) ( not ( = ?auto_722838 ?auto_722848 ) ) ( not ( = ?auto_722838 ?auto_722849 ) ) ( not ( = ?auto_722838 ?auto_722850 ) ) ( not ( = ?auto_722839 ?auto_722840 ) ) ( not ( = ?auto_722839 ?auto_722841 ) ) ( not ( = ?auto_722839 ?auto_722842 ) ) ( not ( = ?auto_722839 ?auto_722843 ) ) ( not ( = ?auto_722839 ?auto_722844 ) ) ( not ( = ?auto_722839 ?auto_722845 ) ) ( not ( = ?auto_722839 ?auto_722846 ) ) ( not ( = ?auto_722839 ?auto_722847 ) ) ( not ( = ?auto_722839 ?auto_722848 ) ) ( not ( = ?auto_722839 ?auto_722849 ) ) ( not ( = ?auto_722839 ?auto_722850 ) ) ( not ( = ?auto_722840 ?auto_722841 ) ) ( not ( = ?auto_722840 ?auto_722842 ) ) ( not ( = ?auto_722840 ?auto_722843 ) ) ( not ( = ?auto_722840 ?auto_722844 ) ) ( not ( = ?auto_722840 ?auto_722845 ) ) ( not ( = ?auto_722840 ?auto_722846 ) ) ( not ( = ?auto_722840 ?auto_722847 ) ) ( not ( = ?auto_722840 ?auto_722848 ) ) ( not ( = ?auto_722840 ?auto_722849 ) ) ( not ( = ?auto_722840 ?auto_722850 ) ) ( not ( = ?auto_722841 ?auto_722842 ) ) ( not ( = ?auto_722841 ?auto_722843 ) ) ( not ( = ?auto_722841 ?auto_722844 ) ) ( not ( = ?auto_722841 ?auto_722845 ) ) ( not ( = ?auto_722841 ?auto_722846 ) ) ( not ( = ?auto_722841 ?auto_722847 ) ) ( not ( = ?auto_722841 ?auto_722848 ) ) ( not ( = ?auto_722841 ?auto_722849 ) ) ( not ( = ?auto_722841 ?auto_722850 ) ) ( not ( = ?auto_722842 ?auto_722843 ) ) ( not ( = ?auto_722842 ?auto_722844 ) ) ( not ( = ?auto_722842 ?auto_722845 ) ) ( not ( = ?auto_722842 ?auto_722846 ) ) ( not ( = ?auto_722842 ?auto_722847 ) ) ( not ( = ?auto_722842 ?auto_722848 ) ) ( not ( = ?auto_722842 ?auto_722849 ) ) ( not ( = ?auto_722842 ?auto_722850 ) ) ( not ( = ?auto_722843 ?auto_722844 ) ) ( not ( = ?auto_722843 ?auto_722845 ) ) ( not ( = ?auto_722843 ?auto_722846 ) ) ( not ( = ?auto_722843 ?auto_722847 ) ) ( not ( = ?auto_722843 ?auto_722848 ) ) ( not ( = ?auto_722843 ?auto_722849 ) ) ( not ( = ?auto_722843 ?auto_722850 ) ) ( not ( = ?auto_722844 ?auto_722845 ) ) ( not ( = ?auto_722844 ?auto_722846 ) ) ( not ( = ?auto_722844 ?auto_722847 ) ) ( not ( = ?auto_722844 ?auto_722848 ) ) ( not ( = ?auto_722844 ?auto_722849 ) ) ( not ( = ?auto_722844 ?auto_722850 ) ) ( not ( = ?auto_722845 ?auto_722846 ) ) ( not ( = ?auto_722845 ?auto_722847 ) ) ( not ( = ?auto_722845 ?auto_722848 ) ) ( not ( = ?auto_722845 ?auto_722849 ) ) ( not ( = ?auto_722845 ?auto_722850 ) ) ( not ( = ?auto_722846 ?auto_722847 ) ) ( not ( = ?auto_722846 ?auto_722848 ) ) ( not ( = ?auto_722846 ?auto_722849 ) ) ( not ( = ?auto_722846 ?auto_722850 ) ) ( not ( = ?auto_722847 ?auto_722848 ) ) ( not ( = ?auto_722847 ?auto_722849 ) ) ( not ( = ?auto_722847 ?auto_722850 ) ) ( not ( = ?auto_722848 ?auto_722849 ) ) ( not ( = ?auto_722848 ?auto_722850 ) ) ( not ( = ?auto_722849 ?auto_722850 ) ) ( ON ?auto_722848 ?auto_722849 ) ( ON ?auto_722847 ?auto_722848 ) ( ON ?auto_722846 ?auto_722847 ) ( ON ?auto_722845 ?auto_722846 ) ( CLEAR ?auto_722843 ) ( ON ?auto_722844 ?auto_722845 ) ( CLEAR ?auto_722844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_722834 ?auto_722835 ?auto_722836 ?auto_722837 ?auto_722838 ?auto_722839 ?auto_722840 ?auto_722841 ?auto_722842 ?auto_722843 ?auto_722844 )
      ( MAKE-16PILE ?auto_722834 ?auto_722835 ?auto_722836 ?auto_722837 ?auto_722838 ?auto_722839 ?auto_722840 ?auto_722841 ?auto_722842 ?auto_722843 ?auto_722844 ?auto_722845 ?auto_722846 ?auto_722847 ?auto_722848 ?auto_722849 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722900 - BLOCK
      ?auto_722901 - BLOCK
      ?auto_722902 - BLOCK
      ?auto_722903 - BLOCK
      ?auto_722904 - BLOCK
      ?auto_722905 - BLOCK
      ?auto_722906 - BLOCK
      ?auto_722907 - BLOCK
      ?auto_722908 - BLOCK
      ?auto_722909 - BLOCK
      ?auto_722910 - BLOCK
      ?auto_722911 - BLOCK
      ?auto_722912 - BLOCK
      ?auto_722913 - BLOCK
      ?auto_722914 - BLOCK
      ?auto_722915 - BLOCK
    )
    :vars
    (
      ?auto_722916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722915 ?auto_722916 ) ( ON-TABLE ?auto_722900 ) ( ON ?auto_722901 ?auto_722900 ) ( ON ?auto_722902 ?auto_722901 ) ( ON ?auto_722903 ?auto_722902 ) ( ON ?auto_722904 ?auto_722903 ) ( ON ?auto_722905 ?auto_722904 ) ( ON ?auto_722906 ?auto_722905 ) ( ON ?auto_722907 ?auto_722906 ) ( ON ?auto_722908 ?auto_722907 ) ( not ( = ?auto_722900 ?auto_722901 ) ) ( not ( = ?auto_722900 ?auto_722902 ) ) ( not ( = ?auto_722900 ?auto_722903 ) ) ( not ( = ?auto_722900 ?auto_722904 ) ) ( not ( = ?auto_722900 ?auto_722905 ) ) ( not ( = ?auto_722900 ?auto_722906 ) ) ( not ( = ?auto_722900 ?auto_722907 ) ) ( not ( = ?auto_722900 ?auto_722908 ) ) ( not ( = ?auto_722900 ?auto_722909 ) ) ( not ( = ?auto_722900 ?auto_722910 ) ) ( not ( = ?auto_722900 ?auto_722911 ) ) ( not ( = ?auto_722900 ?auto_722912 ) ) ( not ( = ?auto_722900 ?auto_722913 ) ) ( not ( = ?auto_722900 ?auto_722914 ) ) ( not ( = ?auto_722900 ?auto_722915 ) ) ( not ( = ?auto_722900 ?auto_722916 ) ) ( not ( = ?auto_722901 ?auto_722902 ) ) ( not ( = ?auto_722901 ?auto_722903 ) ) ( not ( = ?auto_722901 ?auto_722904 ) ) ( not ( = ?auto_722901 ?auto_722905 ) ) ( not ( = ?auto_722901 ?auto_722906 ) ) ( not ( = ?auto_722901 ?auto_722907 ) ) ( not ( = ?auto_722901 ?auto_722908 ) ) ( not ( = ?auto_722901 ?auto_722909 ) ) ( not ( = ?auto_722901 ?auto_722910 ) ) ( not ( = ?auto_722901 ?auto_722911 ) ) ( not ( = ?auto_722901 ?auto_722912 ) ) ( not ( = ?auto_722901 ?auto_722913 ) ) ( not ( = ?auto_722901 ?auto_722914 ) ) ( not ( = ?auto_722901 ?auto_722915 ) ) ( not ( = ?auto_722901 ?auto_722916 ) ) ( not ( = ?auto_722902 ?auto_722903 ) ) ( not ( = ?auto_722902 ?auto_722904 ) ) ( not ( = ?auto_722902 ?auto_722905 ) ) ( not ( = ?auto_722902 ?auto_722906 ) ) ( not ( = ?auto_722902 ?auto_722907 ) ) ( not ( = ?auto_722902 ?auto_722908 ) ) ( not ( = ?auto_722902 ?auto_722909 ) ) ( not ( = ?auto_722902 ?auto_722910 ) ) ( not ( = ?auto_722902 ?auto_722911 ) ) ( not ( = ?auto_722902 ?auto_722912 ) ) ( not ( = ?auto_722902 ?auto_722913 ) ) ( not ( = ?auto_722902 ?auto_722914 ) ) ( not ( = ?auto_722902 ?auto_722915 ) ) ( not ( = ?auto_722902 ?auto_722916 ) ) ( not ( = ?auto_722903 ?auto_722904 ) ) ( not ( = ?auto_722903 ?auto_722905 ) ) ( not ( = ?auto_722903 ?auto_722906 ) ) ( not ( = ?auto_722903 ?auto_722907 ) ) ( not ( = ?auto_722903 ?auto_722908 ) ) ( not ( = ?auto_722903 ?auto_722909 ) ) ( not ( = ?auto_722903 ?auto_722910 ) ) ( not ( = ?auto_722903 ?auto_722911 ) ) ( not ( = ?auto_722903 ?auto_722912 ) ) ( not ( = ?auto_722903 ?auto_722913 ) ) ( not ( = ?auto_722903 ?auto_722914 ) ) ( not ( = ?auto_722903 ?auto_722915 ) ) ( not ( = ?auto_722903 ?auto_722916 ) ) ( not ( = ?auto_722904 ?auto_722905 ) ) ( not ( = ?auto_722904 ?auto_722906 ) ) ( not ( = ?auto_722904 ?auto_722907 ) ) ( not ( = ?auto_722904 ?auto_722908 ) ) ( not ( = ?auto_722904 ?auto_722909 ) ) ( not ( = ?auto_722904 ?auto_722910 ) ) ( not ( = ?auto_722904 ?auto_722911 ) ) ( not ( = ?auto_722904 ?auto_722912 ) ) ( not ( = ?auto_722904 ?auto_722913 ) ) ( not ( = ?auto_722904 ?auto_722914 ) ) ( not ( = ?auto_722904 ?auto_722915 ) ) ( not ( = ?auto_722904 ?auto_722916 ) ) ( not ( = ?auto_722905 ?auto_722906 ) ) ( not ( = ?auto_722905 ?auto_722907 ) ) ( not ( = ?auto_722905 ?auto_722908 ) ) ( not ( = ?auto_722905 ?auto_722909 ) ) ( not ( = ?auto_722905 ?auto_722910 ) ) ( not ( = ?auto_722905 ?auto_722911 ) ) ( not ( = ?auto_722905 ?auto_722912 ) ) ( not ( = ?auto_722905 ?auto_722913 ) ) ( not ( = ?auto_722905 ?auto_722914 ) ) ( not ( = ?auto_722905 ?auto_722915 ) ) ( not ( = ?auto_722905 ?auto_722916 ) ) ( not ( = ?auto_722906 ?auto_722907 ) ) ( not ( = ?auto_722906 ?auto_722908 ) ) ( not ( = ?auto_722906 ?auto_722909 ) ) ( not ( = ?auto_722906 ?auto_722910 ) ) ( not ( = ?auto_722906 ?auto_722911 ) ) ( not ( = ?auto_722906 ?auto_722912 ) ) ( not ( = ?auto_722906 ?auto_722913 ) ) ( not ( = ?auto_722906 ?auto_722914 ) ) ( not ( = ?auto_722906 ?auto_722915 ) ) ( not ( = ?auto_722906 ?auto_722916 ) ) ( not ( = ?auto_722907 ?auto_722908 ) ) ( not ( = ?auto_722907 ?auto_722909 ) ) ( not ( = ?auto_722907 ?auto_722910 ) ) ( not ( = ?auto_722907 ?auto_722911 ) ) ( not ( = ?auto_722907 ?auto_722912 ) ) ( not ( = ?auto_722907 ?auto_722913 ) ) ( not ( = ?auto_722907 ?auto_722914 ) ) ( not ( = ?auto_722907 ?auto_722915 ) ) ( not ( = ?auto_722907 ?auto_722916 ) ) ( not ( = ?auto_722908 ?auto_722909 ) ) ( not ( = ?auto_722908 ?auto_722910 ) ) ( not ( = ?auto_722908 ?auto_722911 ) ) ( not ( = ?auto_722908 ?auto_722912 ) ) ( not ( = ?auto_722908 ?auto_722913 ) ) ( not ( = ?auto_722908 ?auto_722914 ) ) ( not ( = ?auto_722908 ?auto_722915 ) ) ( not ( = ?auto_722908 ?auto_722916 ) ) ( not ( = ?auto_722909 ?auto_722910 ) ) ( not ( = ?auto_722909 ?auto_722911 ) ) ( not ( = ?auto_722909 ?auto_722912 ) ) ( not ( = ?auto_722909 ?auto_722913 ) ) ( not ( = ?auto_722909 ?auto_722914 ) ) ( not ( = ?auto_722909 ?auto_722915 ) ) ( not ( = ?auto_722909 ?auto_722916 ) ) ( not ( = ?auto_722910 ?auto_722911 ) ) ( not ( = ?auto_722910 ?auto_722912 ) ) ( not ( = ?auto_722910 ?auto_722913 ) ) ( not ( = ?auto_722910 ?auto_722914 ) ) ( not ( = ?auto_722910 ?auto_722915 ) ) ( not ( = ?auto_722910 ?auto_722916 ) ) ( not ( = ?auto_722911 ?auto_722912 ) ) ( not ( = ?auto_722911 ?auto_722913 ) ) ( not ( = ?auto_722911 ?auto_722914 ) ) ( not ( = ?auto_722911 ?auto_722915 ) ) ( not ( = ?auto_722911 ?auto_722916 ) ) ( not ( = ?auto_722912 ?auto_722913 ) ) ( not ( = ?auto_722912 ?auto_722914 ) ) ( not ( = ?auto_722912 ?auto_722915 ) ) ( not ( = ?auto_722912 ?auto_722916 ) ) ( not ( = ?auto_722913 ?auto_722914 ) ) ( not ( = ?auto_722913 ?auto_722915 ) ) ( not ( = ?auto_722913 ?auto_722916 ) ) ( not ( = ?auto_722914 ?auto_722915 ) ) ( not ( = ?auto_722914 ?auto_722916 ) ) ( not ( = ?auto_722915 ?auto_722916 ) ) ( ON ?auto_722914 ?auto_722915 ) ( ON ?auto_722913 ?auto_722914 ) ( ON ?auto_722912 ?auto_722913 ) ( ON ?auto_722911 ?auto_722912 ) ( ON ?auto_722910 ?auto_722911 ) ( CLEAR ?auto_722908 ) ( ON ?auto_722909 ?auto_722910 ) ( CLEAR ?auto_722909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_722900 ?auto_722901 ?auto_722902 ?auto_722903 ?auto_722904 ?auto_722905 ?auto_722906 ?auto_722907 ?auto_722908 ?auto_722909 )
      ( MAKE-16PILE ?auto_722900 ?auto_722901 ?auto_722902 ?auto_722903 ?auto_722904 ?auto_722905 ?auto_722906 ?auto_722907 ?auto_722908 ?auto_722909 ?auto_722910 ?auto_722911 ?auto_722912 ?auto_722913 ?auto_722914 ?auto_722915 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_722966 - BLOCK
      ?auto_722967 - BLOCK
      ?auto_722968 - BLOCK
      ?auto_722969 - BLOCK
      ?auto_722970 - BLOCK
      ?auto_722971 - BLOCK
      ?auto_722972 - BLOCK
      ?auto_722973 - BLOCK
      ?auto_722974 - BLOCK
      ?auto_722975 - BLOCK
      ?auto_722976 - BLOCK
      ?auto_722977 - BLOCK
      ?auto_722978 - BLOCK
      ?auto_722979 - BLOCK
      ?auto_722980 - BLOCK
      ?auto_722981 - BLOCK
    )
    :vars
    (
      ?auto_722982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_722981 ?auto_722982 ) ( ON-TABLE ?auto_722966 ) ( ON ?auto_722967 ?auto_722966 ) ( ON ?auto_722968 ?auto_722967 ) ( ON ?auto_722969 ?auto_722968 ) ( ON ?auto_722970 ?auto_722969 ) ( ON ?auto_722971 ?auto_722970 ) ( ON ?auto_722972 ?auto_722971 ) ( ON ?auto_722973 ?auto_722972 ) ( not ( = ?auto_722966 ?auto_722967 ) ) ( not ( = ?auto_722966 ?auto_722968 ) ) ( not ( = ?auto_722966 ?auto_722969 ) ) ( not ( = ?auto_722966 ?auto_722970 ) ) ( not ( = ?auto_722966 ?auto_722971 ) ) ( not ( = ?auto_722966 ?auto_722972 ) ) ( not ( = ?auto_722966 ?auto_722973 ) ) ( not ( = ?auto_722966 ?auto_722974 ) ) ( not ( = ?auto_722966 ?auto_722975 ) ) ( not ( = ?auto_722966 ?auto_722976 ) ) ( not ( = ?auto_722966 ?auto_722977 ) ) ( not ( = ?auto_722966 ?auto_722978 ) ) ( not ( = ?auto_722966 ?auto_722979 ) ) ( not ( = ?auto_722966 ?auto_722980 ) ) ( not ( = ?auto_722966 ?auto_722981 ) ) ( not ( = ?auto_722966 ?auto_722982 ) ) ( not ( = ?auto_722967 ?auto_722968 ) ) ( not ( = ?auto_722967 ?auto_722969 ) ) ( not ( = ?auto_722967 ?auto_722970 ) ) ( not ( = ?auto_722967 ?auto_722971 ) ) ( not ( = ?auto_722967 ?auto_722972 ) ) ( not ( = ?auto_722967 ?auto_722973 ) ) ( not ( = ?auto_722967 ?auto_722974 ) ) ( not ( = ?auto_722967 ?auto_722975 ) ) ( not ( = ?auto_722967 ?auto_722976 ) ) ( not ( = ?auto_722967 ?auto_722977 ) ) ( not ( = ?auto_722967 ?auto_722978 ) ) ( not ( = ?auto_722967 ?auto_722979 ) ) ( not ( = ?auto_722967 ?auto_722980 ) ) ( not ( = ?auto_722967 ?auto_722981 ) ) ( not ( = ?auto_722967 ?auto_722982 ) ) ( not ( = ?auto_722968 ?auto_722969 ) ) ( not ( = ?auto_722968 ?auto_722970 ) ) ( not ( = ?auto_722968 ?auto_722971 ) ) ( not ( = ?auto_722968 ?auto_722972 ) ) ( not ( = ?auto_722968 ?auto_722973 ) ) ( not ( = ?auto_722968 ?auto_722974 ) ) ( not ( = ?auto_722968 ?auto_722975 ) ) ( not ( = ?auto_722968 ?auto_722976 ) ) ( not ( = ?auto_722968 ?auto_722977 ) ) ( not ( = ?auto_722968 ?auto_722978 ) ) ( not ( = ?auto_722968 ?auto_722979 ) ) ( not ( = ?auto_722968 ?auto_722980 ) ) ( not ( = ?auto_722968 ?auto_722981 ) ) ( not ( = ?auto_722968 ?auto_722982 ) ) ( not ( = ?auto_722969 ?auto_722970 ) ) ( not ( = ?auto_722969 ?auto_722971 ) ) ( not ( = ?auto_722969 ?auto_722972 ) ) ( not ( = ?auto_722969 ?auto_722973 ) ) ( not ( = ?auto_722969 ?auto_722974 ) ) ( not ( = ?auto_722969 ?auto_722975 ) ) ( not ( = ?auto_722969 ?auto_722976 ) ) ( not ( = ?auto_722969 ?auto_722977 ) ) ( not ( = ?auto_722969 ?auto_722978 ) ) ( not ( = ?auto_722969 ?auto_722979 ) ) ( not ( = ?auto_722969 ?auto_722980 ) ) ( not ( = ?auto_722969 ?auto_722981 ) ) ( not ( = ?auto_722969 ?auto_722982 ) ) ( not ( = ?auto_722970 ?auto_722971 ) ) ( not ( = ?auto_722970 ?auto_722972 ) ) ( not ( = ?auto_722970 ?auto_722973 ) ) ( not ( = ?auto_722970 ?auto_722974 ) ) ( not ( = ?auto_722970 ?auto_722975 ) ) ( not ( = ?auto_722970 ?auto_722976 ) ) ( not ( = ?auto_722970 ?auto_722977 ) ) ( not ( = ?auto_722970 ?auto_722978 ) ) ( not ( = ?auto_722970 ?auto_722979 ) ) ( not ( = ?auto_722970 ?auto_722980 ) ) ( not ( = ?auto_722970 ?auto_722981 ) ) ( not ( = ?auto_722970 ?auto_722982 ) ) ( not ( = ?auto_722971 ?auto_722972 ) ) ( not ( = ?auto_722971 ?auto_722973 ) ) ( not ( = ?auto_722971 ?auto_722974 ) ) ( not ( = ?auto_722971 ?auto_722975 ) ) ( not ( = ?auto_722971 ?auto_722976 ) ) ( not ( = ?auto_722971 ?auto_722977 ) ) ( not ( = ?auto_722971 ?auto_722978 ) ) ( not ( = ?auto_722971 ?auto_722979 ) ) ( not ( = ?auto_722971 ?auto_722980 ) ) ( not ( = ?auto_722971 ?auto_722981 ) ) ( not ( = ?auto_722971 ?auto_722982 ) ) ( not ( = ?auto_722972 ?auto_722973 ) ) ( not ( = ?auto_722972 ?auto_722974 ) ) ( not ( = ?auto_722972 ?auto_722975 ) ) ( not ( = ?auto_722972 ?auto_722976 ) ) ( not ( = ?auto_722972 ?auto_722977 ) ) ( not ( = ?auto_722972 ?auto_722978 ) ) ( not ( = ?auto_722972 ?auto_722979 ) ) ( not ( = ?auto_722972 ?auto_722980 ) ) ( not ( = ?auto_722972 ?auto_722981 ) ) ( not ( = ?auto_722972 ?auto_722982 ) ) ( not ( = ?auto_722973 ?auto_722974 ) ) ( not ( = ?auto_722973 ?auto_722975 ) ) ( not ( = ?auto_722973 ?auto_722976 ) ) ( not ( = ?auto_722973 ?auto_722977 ) ) ( not ( = ?auto_722973 ?auto_722978 ) ) ( not ( = ?auto_722973 ?auto_722979 ) ) ( not ( = ?auto_722973 ?auto_722980 ) ) ( not ( = ?auto_722973 ?auto_722981 ) ) ( not ( = ?auto_722973 ?auto_722982 ) ) ( not ( = ?auto_722974 ?auto_722975 ) ) ( not ( = ?auto_722974 ?auto_722976 ) ) ( not ( = ?auto_722974 ?auto_722977 ) ) ( not ( = ?auto_722974 ?auto_722978 ) ) ( not ( = ?auto_722974 ?auto_722979 ) ) ( not ( = ?auto_722974 ?auto_722980 ) ) ( not ( = ?auto_722974 ?auto_722981 ) ) ( not ( = ?auto_722974 ?auto_722982 ) ) ( not ( = ?auto_722975 ?auto_722976 ) ) ( not ( = ?auto_722975 ?auto_722977 ) ) ( not ( = ?auto_722975 ?auto_722978 ) ) ( not ( = ?auto_722975 ?auto_722979 ) ) ( not ( = ?auto_722975 ?auto_722980 ) ) ( not ( = ?auto_722975 ?auto_722981 ) ) ( not ( = ?auto_722975 ?auto_722982 ) ) ( not ( = ?auto_722976 ?auto_722977 ) ) ( not ( = ?auto_722976 ?auto_722978 ) ) ( not ( = ?auto_722976 ?auto_722979 ) ) ( not ( = ?auto_722976 ?auto_722980 ) ) ( not ( = ?auto_722976 ?auto_722981 ) ) ( not ( = ?auto_722976 ?auto_722982 ) ) ( not ( = ?auto_722977 ?auto_722978 ) ) ( not ( = ?auto_722977 ?auto_722979 ) ) ( not ( = ?auto_722977 ?auto_722980 ) ) ( not ( = ?auto_722977 ?auto_722981 ) ) ( not ( = ?auto_722977 ?auto_722982 ) ) ( not ( = ?auto_722978 ?auto_722979 ) ) ( not ( = ?auto_722978 ?auto_722980 ) ) ( not ( = ?auto_722978 ?auto_722981 ) ) ( not ( = ?auto_722978 ?auto_722982 ) ) ( not ( = ?auto_722979 ?auto_722980 ) ) ( not ( = ?auto_722979 ?auto_722981 ) ) ( not ( = ?auto_722979 ?auto_722982 ) ) ( not ( = ?auto_722980 ?auto_722981 ) ) ( not ( = ?auto_722980 ?auto_722982 ) ) ( not ( = ?auto_722981 ?auto_722982 ) ) ( ON ?auto_722980 ?auto_722981 ) ( ON ?auto_722979 ?auto_722980 ) ( ON ?auto_722978 ?auto_722979 ) ( ON ?auto_722977 ?auto_722978 ) ( ON ?auto_722976 ?auto_722977 ) ( ON ?auto_722975 ?auto_722976 ) ( CLEAR ?auto_722973 ) ( ON ?auto_722974 ?auto_722975 ) ( CLEAR ?auto_722974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_722966 ?auto_722967 ?auto_722968 ?auto_722969 ?auto_722970 ?auto_722971 ?auto_722972 ?auto_722973 ?auto_722974 )
      ( MAKE-16PILE ?auto_722966 ?auto_722967 ?auto_722968 ?auto_722969 ?auto_722970 ?auto_722971 ?auto_722972 ?auto_722973 ?auto_722974 ?auto_722975 ?auto_722976 ?auto_722977 ?auto_722978 ?auto_722979 ?auto_722980 ?auto_722981 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723032 - BLOCK
      ?auto_723033 - BLOCK
      ?auto_723034 - BLOCK
      ?auto_723035 - BLOCK
      ?auto_723036 - BLOCK
      ?auto_723037 - BLOCK
      ?auto_723038 - BLOCK
      ?auto_723039 - BLOCK
      ?auto_723040 - BLOCK
      ?auto_723041 - BLOCK
      ?auto_723042 - BLOCK
      ?auto_723043 - BLOCK
      ?auto_723044 - BLOCK
      ?auto_723045 - BLOCK
      ?auto_723046 - BLOCK
      ?auto_723047 - BLOCK
    )
    :vars
    (
      ?auto_723048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723047 ?auto_723048 ) ( ON-TABLE ?auto_723032 ) ( ON ?auto_723033 ?auto_723032 ) ( ON ?auto_723034 ?auto_723033 ) ( ON ?auto_723035 ?auto_723034 ) ( ON ?auto_723036 ?auto_723035 ) ( ON ?auto_723037 ?auto_723036 ) ( ON ?auto_723038 ?auto_723037 ) ( not ( = ?auto_723032 ?auto_723033 ) ) ( not ( = ?auto_723032 ?auto_723034 ) ) ( not ( = ?auto_723032 ?auto_723035 ) ) ( not ( = ?auto_723032 ?auto_723036 ) ) ( not ( = ?auto_723032 ?auto_723037 ) ) ( not ( = ?auto_723032 ?auto_723038 ) ) ( not ( = ?auto_723032 ?auto_723039 ) ) ( not ( = ?auto_723032 ?auto_723040 ) ) ( not ( = ?auto_723032 ?auto_723041 ) ) ( not ( = ?auto_723032 ?auto_723042 ) ) ( not ( = ?auto_723032 ?auto_723043 ) ) ( not ( = ?auto_723032 ?auto_723044 ) ) ( not ( = ?auto_723032 ?auto_723045 ) ) ( not ( = ?auto_723032 ?auto_723046 ) ) ( not ( = ?auto_723032 ?auto_723047 ) ) ( not ( = ?auto_723032 ?auto_723048 ) ) ( not ( = ?auto_723033 ?auto_723034 ) ) ( not ( = ?auto_723033 ?auto_723035 ) ) ( not ( = ?auto_723033 ?auto_723036 ) ) ( not ( = ?auto_723033 ?auto_723037 ) ) ( not ( = ?auto_723033 ?auto_723038 ) ) ( not ( = ?auto_723033 ?auto_723039 ) ) ( not ( = ?auto_723033 ?auto_723040 ) ) ( not ( = ?auto_723033 ?auto_723041 ) ) ( not ( = ?auto_723033 ?auto_723042 ) ) ( not ( = ?auto_723033 ?auto_723043 ) ) ( not ( = ?auto_723033 ?auto_723044 ) ) ( not ( = ?auto_723033 ?auto_723045 ) ) ( not ( = ?auto_723033 ?auto_723046 ) ) ( not ( = ?auto_723033 ?auto_723047 ) ) ( not ( = ?auto_723033 ?auto_723048 ) ) ( not ( = ?auto_723034 ?auto_723035 ) ) ( not ( = ?auto_723034 ?auto_723036 ) ) ( not ( = ?auto_723034 ?auto_723037 ) ) ( not ( = ?auto_723034 ?auto_723038 ) ) ( not ( = ?auto_723034 ?auto_723039 ) ) ( not ( = ?auto_723034 ?auto_723040 ) ) ( not ( = ?auto_723034 ?auto_723041 ) ) ( not ( = ?auto_723034 ?auto_723042 ) ) ( not ( = ?auto_723034 ?auto_723043 ) ) ( not ( = ?auto_723034 ?auto_723044 ) ) ( not ( = ?auto_723034 ?auto_723045 ) ) ( not ( = ?auto_723034 ?auto_723046 ) ) ( not ( = ?auto_723034 ?auto_723047 ) ) ( not ( = ?auto_723034 ?auto_723048 ) ) ( not ( = ?auto_723035 ?auto_723036 ) ) ( not ( = ?auto_723035 ?auto_723037 ) ) ( not ( = ?auto_723035 ?auto_723038 ) ) ( not ( = ?auto_723035 ?auto_723039 ) ) ( not ( = ?auto_723035 ?auto_723040 ) ) ( not ( = ?auto_723035 ?auto_723041 ) ) ( not ( = ?auto_723035 ?auto_723042 ) ) ( not ( = ?auto_723035 ?auto_723043 ) ) ( not ( = ?auto_723035 ?auto_723044 ) ) ( not ( = ?auto_723035 ?auto_723045 ) ) ( not ( = ?auto_723035 ?auto_723046 ) ) ( not ( = ?auto_723035 ?auto_723047 ) ) ( not ( = ?auto_723035 ?auto_723048 ) ) ( not ( = ?auto_723036 ?auto_723037 ) ) ( not ( = ?auto_723036 ?auto_723038 ) ) ( not ( = ?auto_723036 ?auto_723039 ) ) ( not ( = ?auto_723036 ?auto_723040 ) ) ( not ( = ?auto_723036 ?auto_723041 ) ) ( not ( = ?auto_723036 ?auto_723042 ) ) ( not ( = ?auto_723036 ?auto_723043 ) ) ( not ( = ?auto_723036 ?auto_723044 ) ) ( not ( = ?auto_723036 ?auto_723045 ) ) ( not ( = ?auto_723036 ?auto_723046 ) ) ( not ( = ?auto_723036 ?auto_723047 ) ) ( not ( = ?auto_723036 ?auto_723048 ) ) ( not ( = ?auto_723037 ?auto_723038 ) ) ( not ( = ?auto_723037 ?auto_723039 ) ) ( not ( = ?auto_723037 ?auto_723040 ) ) ( not ( = ?auto_723037 ?auto_723041 ) ) ( not ( = ?auto_723037 ?auto_723042 ) ) ( not ( = ?auto_723037 ?auto_723043 ) ) ( not ( = ?auto_723037 ?auto_723044 ) ) ( not ( = ?auto_723037 ?auto_723045 ) ) ( not ( = ?auto_723037 ?auto_723046 ) ) ( not ( = ?auto_723037 ?auto_723047 ) ) ( not ( = ?auto_723037 ?auto_723048 ) ) ( not ( = ?auto_723038 ?auto_723039 ) ) ( not ( = ?auto_723038 ?auto_723040 ) ) ( not ( = ?auto_723038 ?auto_723041 ) ) ( not ( = ?auto_723038 ?auto_723042 ) ) ( not ( = ?auto_723038 ?auto_723043 ) ) ( not ( = ?auto_723038 ?auto_723044 ) ) ( not ( = ?auto_723038 ?auto_723045 ) ) ( not ( = ?auto_723038 ?auto_723046 ) ) ( not ( = ?auto_723038 ?auto_723047 ) ) ( not ( = ?auto_723038 ?auto_723048 ) ) ( not ( = ?auto_723039 ?auto_723040 ) ) ( not ( = ?auto_723039 ?auto_723041 ) ) ( not ( = ?auto_723039 ?auto_723042 ) ) ( not ( = ?auto_723039 ?auto_723043 ) ) ( not ( = ?auto_723039 ?auto_723044 ) ) ( not ( = ?auto_723039 ?auto_723045 ) ) ( not ( = ?auto_723039 ?auto_723046 ) ) ( not ( = ?auto_723039 ?auto_723047 ) ) ( not ( = ?auto_723039 ?auto_723048 ) ) ( not ( = ?auto_723040 ?auto_723041 ) ) ( not ( = ?auto_723040 ?auto_723042 ) ) ( not ( = ?auto_723040 ?auto_723043 ) ) ( not ( = ?auto_723040 ?auto_723044 ) ) ( not ( = ?auto_723040 ?auto_723045 ) ) ( not ( = ?auto_723040 ?auto_723046 ) ) ( not ( = ?auto_723040 ?auto_723047 ) ) ( not ( = ?auto_723040 ?auto_723048 ) ) ( not ( = ?auto_723041 ?auto_723042 ) ) ( not ( = ?auto_723041 ?auto_723043 ) ) ( not ( = ?auto_723041 ?auto_723044 ) ) ( not ( = ?auto_723041 ?auto_723045 ) ) ( not ( = ?auto_723041 ?auto_723046 ) ) ( not ( = ?auto_723041 ?auto_723047 ) ) ( not ( = ?auto_723041 ?auto_723048 ) ) ( not ( = ?auto_723042 ?auto_723043 ) ) ( not ( = ?auto_723042 ?auto_723044 ) ) ( not ( = ?auto_723042 ?auto_723045 ) ) ( not ( = ?auto_723042 ?auto_723046 ) ) ( not ( = ?auto_723042 ?auto_723047 ) ) ( not ( = ?auto_723042 ?auto_723048 ) ) ( not ( = ?auto_723043 ?auto_723044 ) ) ( not ( = ?auto_723043 ?auto_723045 ) ) ( not ( = ?auto_723043 ?auto_723046 ) ) ( not ( = ?auto_723043 ?auto_723047 ) ) ( not ( = ?auto_723043 ?auto_723048 ) ) ( not ( = ?auto_723044 ?auto_723045 ) ) ( not ( = ?auto_723044 ?auto_723046 ) ) ( not ( = ?auto_723044 ?auto_723047 ) ) ( not ( = ?auto_723044 ?auto_723048 ) ) ( not ( = ?auto_723045 ?auto_723046 ) ) ( not ( = ?auto_723045 ?auto_723047 ) ) ( not ( = ?auto_723045 ?auto_723048 ) ) ( not ( = ?auto_723046 ?auto_723047 ) ) ( not ( = ?auto_723046 ?auto_723048 ) ) ( not ( = ?auto_723047 ?auto_723048 ) ) ( ON ?auto_723046 ?auto_723047 ) ( ON ?auto_723045 ?auto_723046 ) ( ON ?auto_723044 ?auto_723045 ) ( ON ?auto_723043 ?auto_723044 ) ( ON ?auto_723042 ?auto_723043 ) ( ON ?auto_723041 ?auto_723042 ) ( ON ?auto_723040 ?auto_723041 ) ( CLEAR ?auto_723038 ) ( ON ?auto_723039 ?auto_723040 ) ( CLEAR ?auto_723039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_723032 ?auto_723033 ?auto_723034 ?auto_723035 ?auto_723036 ?auto_723037 ?auto_723038 ?auto_723039 )
      ( MAKE-16PILE ?auto_723032 ?auto_723033 ?auto_723034 ?auto_723035 ?auto_723036 ?auto_723037 ?auto_723038 ?auto_723039 ?auto_723040 ?auto_723041 ?auto_723042 ?auto_723043 ?auto_723044 ?auto_723045 ?auto_723046 ?auto_723047 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723098 - BLOCK
      ?auto_723099 - BLOCK
      ?auto_723100 - BLOCK
      ?auto_723101 - BLOCK
      ?auto_723102 - BLOCK
      ?auto_723103 - BLOCK
      ?auto_723104 - BLOCK
      ?auto_723105 - BLOCK
      ?auto_723106 - BLOCK
      ?auto_723107 - BLOCK
      ?auto_723108 - BLOCK
      ?auto_723109 - BLOCK
      ?auto_723110 - BLOCK
      ?auto_723111 - BLOCK
      ?auto_723112 - BLOCK
      ?auto_723113 - BLOCK
    )
    :vars
    (
      ?auto_723114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723113 ?auto_723114 ) ( ON-TABLE ?auto_723098 ) ( ON ?auto_723099 ?auto_723098 ) ( ON ?auto_723100 ?auto_723099 ) ( ON ?auto_723101 ?auto_723100 ) ( ON ?auto_723102 ?auto_723101 ) ( ON ?auto_723103 ?auto_723102 ) ( not ( = ?auto_723098 ?auto_723099 ) ) ( not ( = ?auto_723098 ?auto_723100 ) ) ( not ( = ?auto_723098 ?auto_723101 ) ) ( not ( = ?auto_723098 ?auto_723102 ) ) ( not ( = ?auto_723098 ?auto_723103 ) ) ( not ( = ?auto_723098 ?auto_723104 ) ) ( not ( = ?auto_723098 ?auto_723105 ) ) ( not ( = ?auto_723098 ?auto_723106 ) ) ( not ( = ?auto_723098 ?auto_723107 ) ) ( not ( = ?auto_723098 ?auto_723108 ) ) ( not ( = ?auto_723098 ?auto_723109 ) ) ( not ( = ?auto_723098 ?auto_723110 ) ) ( not ( = ?auto_723098 ?auto_723111 ) ) ( not ( = ?auto_723098 ?auto_723112 ) ) ( not ( = ?auto_723098 ?auto_723113 ) ) ( not ( = ?auto_723098 ?auto_723114 ) ) ( not ( = ?auto_723099 ?auto_723100 ) ) ( not ( = ?auto_723099 ?auto_723101 ) ) ( not ( = ?auto_723099 ?auto_723102 ) ) ( not ( = ?auto_723099 ?auto_723103 ) ) ( not ( = ?auto_723099 ?auto_723104 ) ) ( not ( = ?auto_723099 ?auto_723105 ) ) ( not ( = ?auto_723099 ?auto_723106 ) ) ( not ( = ?auto_723099 ?auto_723107 ) ) ( not ( = ?auto_723099 ?auto_723108 ) ) ( not ( = ?auto_723099 ?auto_723109 ) ) ( not ( = ?auto_723099 ?auto_723110 ) ) ( not ( = ?auto_723099 ?auto_723111 ) ) ( not ( = ?auto_723099 ?auto_723112 ) ) ( not ( = ?auto_723099 ?auto_723113 ) ) ( not ( = ?auto_723099 ?auto_723114 ) ) ( not ( = ?auto_723100 ?auto_723101 ) ) ( not ( = ?auto_723100 ?auto_723102 ) ) ( not ( = ?auto_723100 ?auto_723103 ) ) ( not ( = ?auto_723100 ?auto_723104 ) ) ( not ( = ?auto_723100 ?auto_723105 ) ) ( not ( = ?auto_723100 ?auto_723106 ) ) ( not ( = ?auto_723100 ?auto_723107 ) ) ( not ( = ?auto_723100 ?auto_723108 ) ) ( not ( = ?auto_723100 ?auto_723109 ) ) ( not ( = ?auto_723100 ?auto_723110 ) ) ( not ( = ?auto_723100 ?auto_723111 ) ) ( not ( = ?auto_723100 ?auto_723112 ) ) ( not ( = ?auto_723100 ?auto_723113 ) ) ( not ( = ?auto_723100 ?auto_723114 ) ) ( not ( = ?auto_723101 ?auto_723102 ) ) ( not ( = ?auto_723101 ?auto_723103 ) ) ( not ( = ?auto_723101 ?auto_723104 ) ) ( not ( = ?auto_723101 ?auto_723105 ) ) ( not ( = ?auto_723101 ?auto_723106 ) ) ( not ( = ?auto_723101 ?auto_723107 ) ) ( not ( = ?auto_723101 ?auto_723108 ) ) ( not ( = ?auto_723101 ?auto_723109 ) ) ( not ( = ?auto_723101 ?auto_723110 ) ) ( not ( = ?auto_723101 ?auto_723111 ) ) ( not ( = ?auto_723101 ?auto_723112 ) ) ( not ( = ?auto_723101 ?auto_723113 ) ) ( not ( = ?auto_723101 ?auto_723114 ) ) ( not ( = ?auto_723102 ?auto_723103 ) ) ( not ( = ?auto_723102 ?auto_723104 ) ) ( not ( = ?auto_723102 ?auto_723105 ) ) ( not ( = ?auto_723102 ?auto_723106 ) ) ( not ( = ?auto_723102 ?auto_723107 ) ) ( not ( = ?auto_723102 ?auto_723108 ) ) ( not ( = ?auto_723102 ?auto_723109 ) ) ( not ( = ?auto_723102 ?auto_723110 ) ) ( not ( = ?auto_723102 ?auto_723111 ) ) ( not ( = ?auto_723102 ?auto_723112 ) ) ( not ( = ?auto_723102 ?auto_723113 ) ) ( not ( = ?auto_723102 ?auto_723114 ) ) ( not ( = ?auto_723103 ?auto_723104 ) ) ( not ( = ?auto_723103 ?auto_723105 ) ) ( not ( = ?auto_723103 ?auto_723106 ) ) ( not ( = ?auto_723103 ?auto_723107 ) ) ( not ( = ?auto_723103 ?auto_723108 ) ) ( not ( = ?auto_723103 ?auto_723109 ) ) ( not ( = ?auto_723103 ?auto_723110 ) ) ( not ( = ?auto_723103 ?auto_723111 ) ) ( not ( = ?auto_723103 ?auto_723112 ) ) ( not ( = ?auto_723103 ?auto_723113 ) ) ( not ( = ?auto_723103 ?auto_723114 ) ) ( not ( = ?auto_723104 ?auto_723105 ) ) ( not ( = ?auto_723104 ?auto_723106 ) ) ( not ( = ?auto_723104 ?auto_723107 ) ) ( not ( = ?auto_723104 ?auto_723108 ) ) ( not ( = ?auto_723104 ?auto_723109 ) ) ( not ( = ?auto_723104 ?auto_723110 ) ) ( not ( = ?auto_723104 ?auto_723111 ) ) ( not ( = ?auto_723104 ?auto_723112 ) ) ( not ( = ?auto_723104 ?auto_723113 ) ) ( not ( = ?auto_723104 ?auto_723114 ) ) ( not ( = ?auto_723105 ?auto_723106 ) ) ( not ( = ?auto_723105 ?auto_723107 ) ) ( not ( = ?auto_723105 ?auto_723108 ) ) ( not ( = ?auto_723105 ?auto_723109 ) ) ( not ( = ?auto_723105 ?auto_723110 ) ) ( not ( = ?auto_723105 ?auto_723111 ) ) ( not ( = ?auto_723105 ?auto_723112 ) ) ( not ( = ?auto_723105 ?auto_723113 ) ) ( not ( = ?auto_723105 ?auto_723114 ) ) ( not ( = ?auto_723106 ?auto_723107 ) ) ( not ( = ?auto_723106 ?auto_723108 ) ) ( not ( = ?auto_723106 ?auto_723109 ) ) ( not ( = ?auto_723106 ?auto_723110 ) ) ( not ( = ?auto_723106 ?auto_723111 ) ) ( not ( = ?auto_723106 ?auto_723112 ) ) ( not ( = ?auto_723106 ?auto_723113 ) ) ( not ( = ?auto_723106 ?auto_723114 ) ) ( not ( = ?auto_723107 ?auto_723108 ) ) ( not ( = ?auto_723107 ?auto_723109 ) ) ( not ( = ?auto_723107 ?auto_723110 ) ) ( not ( = ?auto_723107 ?auto_723111 ) ) ( not ( = ?auto_723107 ?auto_723112 ) ) ( not ( = ?auto_723107 ?auto_723113 ) ) ( not ( = ?auto_723107 ?auto_723114 ) ) ( not ( = ?auto_723108 ?auto_723109 ) ) ( not ( = ?auto_723108 ?auto_723110 ) ) ( not ( = ?auto_723108 ?auto_723111 ) ) ( not ( = ?auto_723108 ?auto_723112 ) ) ( not ( = ?auto_723108 ?auto_723113 ) ) ( not ( = ?auto_723108 ?auto_723114 ) ) ( not ( = ?auto_723109 ?auto_723110 ) ) ( not ( = ?auto_723109 ?auto_723111 ) ) ( not ( = ?auto_723109 ?auto_723112 ) ) ( not ( = ?auto_723109 ?auto_723113 ) ) ( not ( = ?auto_723109 ?auto_723114 ) ) ( not ( = ?auto_723110 ?auto_723111 ) ) ( not ( = ?auto_723110 ?auto_723112 ) ) ( not ( = ?auto_723110 ?auto_723113 ) ) ( not ( = ?auto_723110 ?auto_723114 ) ) ( not ( = ?auto_723111 ?auto_723112 ) ) ( not ( = ?auto_723111 ?auto_723113 ) ) ( not ( = ?auto_723111 ?auto_723114 ) ) ( not ( = ?auto_723112 ?auto_723113 ) ) ( not ( = ?auto_723112 ?auto_723114 ) ) ( not ( = ?auto_723113 ?auto_723114 ) ) ( ON ?auto_723112 ?auto_723113 ) ( ON ?auto_723111 ?auto_723112 ) ( ON ?auto_723110 ?auto_723111 ) ( ON ?auto_723109 ?auto_723110 ) ( ON ?auto_723108 ?auto_723109 ) ( ON ?auto_723107 ?auto_723108 ) ( ON ?auto_723106 ?auto_723107 ) ( ON ?auto_723105 ?auto_723106 ) ( CLEAR ?auto_723103 ) ( ON ?auto_723104 ?auto_723105 ) ( CLEAR ?auto_723104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_723098 ?auto_723099 ?auto_723100 ?auto_723101 ?auto_723102 ?auto_723103 ?auto_723104 )
      ( MAKE-16PILE ?auto_723098 ?auto_723099 ?auto_723100 ?auto_723101 ?auto_723102 ?auto_723103 ?auto_723104 ?auto_723105 ?auto_723106 ?auto_723107 ?auto_723108 ?auto_723109 ?auto_723110 ?auto_723111 ?auto_723112 ?auto_723113 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723164 - BLOCK
      ?auto_723165 - BLOCK
      ?auto_723166 - BLOCK
      ?auto_723167 - BLOCK
      ?auto_723168 - BLOCK
      ?auto_723169 - BLOCK
      ?auto_723170 - BLOCK
      ?auto_723171 - BLOCK
      ?auto_723172 - BLOCK
      ?auto_723173 - BLOCK
      ?auto_723174 - BLOCK
      ?auto_723175 - BLOCK
      ?auto_723176 - BLOCK
      ?auto_723177 - BLOCK
      ?auto_723178 - BLOCK
      ?auto_723179 - BLOCK
    )
    :vars
    (
      ?auto_723180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723179 ?auto_723180 ) ( ON-TABLE ?auto_723164 ) ( ON ?auto_723165 ?auto_723164 ) ( ON ?auto_723166 ?auto_723165 ) ( ON ?auto_723167 ?auto_723166 ) ( ON ?auto_723168 ?auto_723167 ) ( not ( = ?auto_723164 ?auto_723165 ) ) ( not ( = ?auto_723164 ?auto_723166 ) ) ( not ( = ?auto_723164 ?auto_723167 ) ) ( not ( = ?auto_723164 ?auto_723168 ) ) ( not ( = ?auto_723164 ?auto_723169 ) ) ( not ( = ?auto_723164 ?auto_723170 ) ) ( not ( = ?auto_723164 ?auto_723171 ) ) ( not ( = ?auto_723164 ?auto_723172 ) ) ( not ( = ?auto_723164 ?auto_723173 ) ) ( not ( = ?auto_723164 ?auto_723174 ) ) ( not ( = ?auto_723164 ?auto_723175 ) ) ( not ( = ?auto_723164 ?auto_723176 ) ) ( not ( = ?auto_723164 ?auto_723177 ) ) ( not ( = ?auto_723164 ?auto_723178 ) ) ( not ( = ?auto_723164 ?auto_723179 ) ) ( not ( = ?auto_723164 ?auto_723180 ) ) ( not ( = ?auto_723165 ?auto_723166 ) ) ( not ( = ?auto_723165 ?auto_723167 ) ) ( not ( = ?auto_723165 ?auto_723168 ) ) ( not ( = ?auto_723165 ?auto_723169 ) ) ( not ( = ?auto_723165 ?auto_723170 ) ) ( not ( = ?auto_723165 ?auto_723171 ) ) ( not ( = ?auto_723165 ?auto_723172 ) ) ( not ( = ?auto_723165 ?auto_723173 ) ) ( not ( = ?auto_723165 ?auto_723174 ) ) ( not ( = ?auto_723165 ?auto_723175 ) ) ( not ( = ?auto_723165 ?auto_723176 ) ) ( not ( = ?auto_723165 ?auto_723177 ) ) ( not ( = ?auto_723165 ?auto_723178 ) ) ( not ( = ?auto_723165 ?auto_723179 ) ) ( not ( = ?auto_723165 ?auto_723180 ) ) ( not ( = ?auto_723166 ?auto_723167 ) ) ( not ( = ?auto_723166 ?auto_723168 ) ) ( not ( = ?auto_723166 ?auto_723169 ) ) ( not ( = ?auto_723166 ?auto_723170 ) ) ( not ( = ?auto_723166 ?auto_723171 ) ) ( not ( = ?auto_723166 ?auto_723172 ) ) ( not ( = ?auto_723166 ?auto_723173 ) ) ( not ( = ?auto_723166 ?auto_723174 ) ) ( not ( = ?auto_723166 ?auto_723175 ) ) ( not ( = ?auto_723166 ?auto_723176 ) ) ( not ( = ?auto_723166 ?auto_723177 ) ) ( not ( = ?auto_723166 ?auto_723178 ) ) ( not ( = ?auto_723166 ?auto_723179 ) ) ( not ( = ?auto_723166 ?auto_723180 ) ) ( not ( = ?auto_723167 ?auto_723168 ) ) ( not ( = ?auto_723167 ?auto_723169 ) ) ( not ( = ?auto_723167 ?auto_723170 ) ) ( not ( = ?auto_723167 ?auto_723171 ) ) ( not ( = ?auto_723167 ?auto_723172 ) ) ( not ( = ?auto_723167 ?auto_723173 ) ) ( not ( = ?auto_723167 ?auto_723174 ) ) ( not ( = ?auto_723167 ?auto_723175 ) ) ( not ( = ?auto_723167 ?auto_723176 ) ) ( not ( = ?auto_723167 ?auto_723177 ) ) ( not ( = ?auto_723167 ?auto_723178 ) ) ( not ( = ?auto_723167 ?auto_723179 ) ) ( not ( = ?auto_723167 ?auto_723180 ) ) ( not ( = ?auto_723168 ?auto_723169 ) ) ( not ( = ?auto_723168 ?auto_723170 ) ) ( not ( = ?auto_723168 ?auto_723171 ) ) ( not ( = ?auto_723168 ?auto_723172 ) ) ( not ( = ?auto_723168 ?auto_723173 ) ) ( not ( = ?auto_723168 ?auto_723174 ) ) ( not ( = ?auto_723168 ?auto_723175 ) ) ( not ( = ?auto_723168 ?auto_723176 ) ) ( not ( = ?auto_723168 ?auto_723177 ) ) ( not ( = ?auto_723168 ?auto_723178 ) ) ( not ( = ?auto_723168 ?auto_723179 ) ) ( not ( = ?auto_723168 ?auto_723180 ) ) ( not ( = ?auto_723169 ?auto_723170 ) ) ( not ( = ?auto_723169 ?auto_723171 ) ) ( not ( = ?auto_723169 ?auto_723172 ) ) ( not ( = ?auto_723169 ?auto_723173 ) ) ( not ( = ?auto_723169 ?auto_723174 ) ) ( not ( = ?auto_723169 ?auto_723175 ) ) ( not ( = ?auto_723169 ?auto_723176 ) ) ( not ( = ?auto_723169 ?auto_723177 ) ) ( not ( = ?auto_723169 ?auto_723178 ) ) ( not ( = ?auto_723169 ?auto_723179 ) ) ( not ( = ?auto_723169 ?auto_723180 ) ) ( not ( = ?auto_723170 ?auto_723171 ) ) ( not ( = ?auto_723170 ?auto_723172 ) ) ( not ( = ?auto_723170 ?auto_723173 ) ) ( not ( = ?auto_723170 ?auto_723174 ) ) ( not ( = ?auto_723170 ?auto_723175 ) ) ( not ( = ?auto_723170 ?auto_723176 ) ) ( not ( = ?auto_723170 ?auto_723177 ) ) ( not ( = ?auto_723170 ?auto_723178 ) ) ( not ( = ?auto_723170 ?auto_723179 ) ) ( not ( = ?auto_723170 ?auto_723180 ) ) ( not ( = ?auto_723171 ?auto_723172 ) ) ( not ( = ?auto_723171 ?auto_723173 ) ) ( not ( = ?auto_723171 ?auto_723174 ) ) ( not ( = ?auto_723171 ?auto_723175 ) ) ( not ( = ?auto_723171 ?auto_723176 ) ) ( not ( = ?auto_723171 ?auto_723177 ) ) ( not ( = ?auto_723171 ?auto_723178 ) ) ( not ( = ?auto_723171 ?auto_723179 ) ) ( not ( = ?auto_723171 ?auto_723180 ) ) ( not ( = ?auto_723172 ?auto_723173 ) ) ( not ( = ?auto_723172 ?auto_723174 ) ) ( not ( = ?auto_723172 ?auto_723175 ) ) ( not ( = ?auto_723172 ?auto_723176 ) ) ( not ( = ?auto_723172 ?auto_723177 ) ) ( not ( = ?auto_723172 ?auto_723178 ) ) ( not ( = ?auto_723172 ?auto_723179 ) ) ( not ( = ?auto_723172 ?auto_723180 ) ) ( not ( = ?auto_723173 ?auto_723174 ) ) ( not ( = ?auto_723173 ?auto_723175 ) ) ( not ( = ?auto_723173 ?auto_723176 ) ) ( not ( = ?auto_723173 ?auto_723177 ) ) ( not ( = ?auto_723173 ?auto_723178 ) ) ( not ( = ?auto_723173 ?auto_723179 ) ) ( not ( = ?auto_723173 ?auto_723180 ) ) ( not ( = ?auto_723174 ?auto_723175 ) ) ( not ( = ?auto_723174 ?auto_723176 ) ) ( not ( = ?auto_723174 ?auto_723177 ) ) ( not ( = ?auto_723174 ?auto_723178 ) ) ( not ( = ?auto_723174 ?auto_723179 ) ) ( not ( = ?auto_723174 ?auto_723180 ) ) ( not ( = ?auto_723175 ?auto_723176 ) ) ( not ( = ?auto_723175 ?auto_723177 ) ) ( not ( = ?auto_723175 ?auto_723178 ) ) ( not ( = ?auto_723175 ?auto_723179 ) ) ( not ( = ?auto_723175 ?auto_723180 ) ) ( not ( = ?auto_723176 ?auto_723177 ) ) ( not ( = ?auto_723176 ?auto_723178 ) ) ( not ( = ?auto_723176 ?auto_723179 ) ) ( not ( = ?auto_723176 ?auto_723180 ) ) ( not ( = ?auto_723177 ?auto_723178 ) ) ( not ( = ?auto_723177 ?auto_723179 ) ) ( not ( = ?auto_723177 ?auto_723180 ) ) ( not ( = ?auto_723178 ?auto_723179 ) ) ( not ( = ?auto_723178 ?auto_723180 ) ) ( not ( = ?auto_723179 ?auto_723180 ) ) ( ON ?auto_723178 ?auto_723179 ) ( ON ?auto_723177 ?auto_723178 ) ( ON ?auto_723176 ?auto_723177 ) ( ON ?auto_723175 ?auto_723176 ) ( ON ?auto_723174 ?auto_723175 ) ( ON ?auto_723173 ?auto_723174 ) ( ON ?auto_723172 ?auto_723173 ) ( ON ?auto_723171 ?auto_723172 ) ( ON ?auto_723170 ?auto_723171 ) ( CLEAR ?auto_723168 ) ( ON ?auto_723169 ?auto_723170 ) ( CLEAR ?auto_723169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_723164 ?auto_723165 ?auto_723166 ?auto_723167 ?auto_723168 ?auto_723169 )
      ( MAKE-16PILE ?auto_723164 ?auto_723165 ?auto_723166 ?auto_723167 ?auto_723168 ?auto_723169 ?auto_723170 ?auto_723171 ?auto_723172 ?auto_723173 ?auto_723174 ?auto_723175 ?auto_723176 ?auto_723177 ?auto_723178 ?auto_723179 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723230 - BLOCK
      ?auto_723231 - BLOCK
      ?auto_723232 - BLOCK
      ?auto_723233 - BLOCK
      ?auto_723234 - BLOCK
      ?auto_723235 - BLOCK
      ?auto_723236 - BLOCK
      ?auto_723237 - BLOCK
      ?auto_723238 - BLOCK
      ?auto_723239 - BLOCK
      ?auto_723240 - BLOCK
      ?auto_723241 - BLOCK
      ?auto_723242 - BLOCK
      ?auto_723243 - BLOCK
      ?auto_723244 - BLOCK
      ?auto_723245 - BLOCK
    )
    :vars
    (
      ?auto_723246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723245 ?auto_723246 ) ( ON-TABLE ?auto_723230 ) ( ON ?auto_723231 ?auto_723230 ) ( ON ?auto_723232 ?auto_723231 ) ( ON ?auto_723233 ?auto_723232 ) ( not ( = ?auto_723230 ?auto_723231 ) ) ( not ( = ?auto_723230 ?auto_723232 ) ) ( not ( = ?auto_723230 ?auto_723233 ) ) ( not ( = ?auto_723230 ?auto_723234 ) ) ( not ( = ?auto_723230 ?auto_723235 ) ) ( not ( = ?auto_723230 ?auto_723236 ) ) ( not ( = ?auto_723230 ?auto_723237 ) ) ( not ( = ?auto_723230 ?auto_723238 ) ) ( not ( = ?auto_723230 ?auto_723239 ) ) ( not ( = ?auto_723230 ?auto_723240 ) ) ( not ( = ?auto_723230 ?auto_723241 ) ) ( not ( = ?auto_723230 ?auto_723242 ) ) ( not ( = ?auto_723230 ?auto_723243 ) ) ( not ( = ?auto_723230 ?auto_723244 ) ) ( not ( = ?auto_723230 ?auto_723245 ) ) ( not ( = ?auto_723230 ?auto_723246 ) ) ( not ( = ?auto_723231 ?auto_723232 ) ) ( not ( = ?auto_723231 ?auto_723233 ) ) ( not ( = ?auto_723231 ?auto_723234 ) ) ( not ( = ?auto_723231 ?auto_723235 ) ) ( not ( = ?auto_723231 ?auto_723236 ) ) ( not ( = ?auto_723231 ?auto_723237 ) ) ( not ( = ?auto_723231 ?auto_723238 ) ) ( not ( = ?auto_723231 ?auto_723239 ) ) ( not ( = ?auto_723231 ?auto_723240 ) ) ( not ( = ?auto_723231 ?auto_723241 ) ) ( not ( = ?auto_723231 ?auto_723242 ) ) ( not ( = ?auto_723231 ?auto_723243 ) ) ( not ( = ?auto_723231 ?auto_723244 ) ) ( not ( = ?auto_723231 ?auto_723245 ) ) ( not ( = ?auto_723231 ?auto_723246 ) ) ( not ( = ?auto_723232 ?auto_723233 ) ) ( not ( = ?auto_723232 ?auto_723234 ) ) ( not ( = ?auto_723232 ?auto_723235 ) ) ( not ( = ?auto_723232 ?auto_723236 ) ) ( not ( = ?auto_723232 ?auto_723237 ) ) ( not ( = ?auto_723232 ?auto_723238 ) ) ( not ( = ?auto_723232 ?auto_723239 ) ) ( not ( = ?auto_723232 ?auto_723240 ) ) ( not ( = ?auto_723232 ?auto_723241 ) ) ( not ( = ?auto_723232 ?auto_723242 ) ) ( not ( = ?auto_723232 ?auto_723243 ) ) ( not ( = ?auto_723232 ?auto_723244 ) ) ( not ( = ?auto_723232 ?auto_723245 ) ) ( not ( = ?auto_723232 ?auto_723246 ) ) ( not ( = ?auto_723233 ?auto_723234 ) ) ( not ( = ?auto_723233 ?auto_723235 ) ) ( not ( = ?auto_723233 ?auto_723236 ) ) ( not ( = ?auto_723233 ?auto_723237 ) ) ( not ( = ?auto_723233 ?auto_723238 ) ) ( not ( = ?auto_723233 ?auto_723239 ) ) ( not ( = ?auto_723233 ?auto_723240 ) ) ( not ( = ?auto_723233 ?auto_723241 ) ) ( not ( = ?auto_723233 ?auto_723242 ) ) ( not ( = ?auto_723233 ?auto_723243 ) ) ( not ( = ?auto_723233 ?auto_723244 ) ) ( not ( = ?auto_723233 ?auto_723245 ) ) ( not ( = ?auto_723233 ?auto_723246 ) ) ( not ( = ?auto_723234 ?auto_723235 ) ) ( not ( = ?auto_723234 ?auto_723236 ) ) ( not ( = ?auto_723234 ?auto_723237 ) ) ( not ( = ?auto_723234 ?auto_723238 ) ) ( not ( = ?auto_723234 ?auto_723239 ) ) ( not ( = ?auto_723234 ?auto_723240 ) ) ( not ( = ?auto_723234 ?auto_723241 ) ) ( not ( = ?auto_723234 ?auto_723242 ) ) ( not ( = ?auto_723234 ?auto_723243 ) ) ( not ( = ?auto_723234 ?auto_723244 ) ) ( not ( = ?auto_723234 ?auto_723245 ) ) ( not ( = ?auto_723234 ?auto_723246 ) ) ( not ( = ?auto_723235 ?auto_723236 ) ) ( not ( = ?auto_723235 ?auto_723237 ) ) ( not ( = ?auto_723235 ?auto_723238 ) ) ( not ( = ?auto_723235 ?auto_723239 ) ) ( not ( = ?auto_723235 ?auto_723240 ) ) ( not ( = ?auto_723235 ?auto_723241 ) ) ( not ( = ?auto_723235 ?auto_723242 ) ) ( not ( = ?auto_723235 ?auto_723243 ) ) ( not ( = ?auto_723235 ?auto_723244 ) ) ( not ( = ?auto_723235 ?auto_723245 ) ) ( not ( = ?auto_723235 ?auto_723246 ) ) ( not ( = ?auto_723236 ?auto_723237 ) ) ( not ( = ?auto_723236 ?auto_723238 ) ) ( not ( = ?auto_723236 ?auto_723239 ) ) ( not ( = ?auto_723236 ?auto_723240 ) ) ( not ( = ?auto_723236 ?auto_723241 ) ) ( not ( = ?auto_723236 ?auto_723242 ) ) ( not ( = ?auto_723236 ?auto_723243 ) ) ( not ( = ?auto_723236 ?auto_723244 ) ) ( not ( = ?auto_723236 ?auto_723245 ) ) ( not ( = ?auto_723236 ?auto_723246 ) ) ( not ( = ?auto_723237 ?auto_723238 ) ) ( not ( = ?auto_723237 ?auto_723239 ) ) ( not ( = ?auto_723237 ?auto_723240 ) ) ( not ( = ?auto_723237 ?auto_723241 ) ) ( not ( = ?auto_723237 ?auto_723242 ) ) ( not ( = ?auto_723237 ?auto_723243 ) ) ( not ( = ?auto_723237 ?auto_723244 ) ) ( not ( = ?auto_723237 ?auto_723245 ) ) ( not ( = ?auto_723237 ?auto_723246 ) ) ( not ( = ?auto_723238 ?auto_723239 ) ) ( not ( = ?auto_723238 ?auto_723240 ) ) ( not ( = ?auto_723238 ?auto_723241 ) ) ( not ( = ?auto_723238 ?auto_723242 ) ) ( not ( = ?auto_723238 ?auto_723243 ) ) ( not ( = ?auto_723238 ?auto_723244 ) ) ( not ( = ?auto_723238 ?auto_723245 ) ) ( not ( = ?auto_723238 ?auto_723246 ) ) ( not ( = ?auto_723239 ?auto_723240 ) ) ( not ( = ?auto_723239 ?auto_723241 ) ) ( not ( = ?auto_723239 ?auto_723242 ) ) ( not ( = ?auto_723239 ?auto_723243 ) ) ( not ( = ?auto_723239 ?auto_723244 ) ) ( not ( = ?auto_723239 ?auto_723245 ) ) ( not ( = ?auto_723239 ?auto_723246 ) ) ( not ( = ?auto_723240 ?auto_723241 ) ) ( not ( = ?auto_723240 ?auto_723242 ) ) ( not ( = ?auto_723240 ?auto_723243 ) ) ( not ( = ?auto_723240 ?auto_723244 ) ) ( not ( = ?auto_723240 ?auto_723245 ) ) ( not ( = ?auto_723240 ?auto_723246 ) ) ( not ( = ?auto_723241 ?auto_723242 ) ) ( not ( = ?auto_723241 ?auto_723243 ) ) ( not ( = ?auto_723241 ?auto_723244 ) ) ( not ( = ?auto_723241 ?auto_723245 ) ) ( not ( = ?auto_723241 ?auto_723246 ) ) ( not ( = ?auto_723242 ?auto_723243 ) ) ( not ( = ?auto_723242 ?auto_723244 ) ) ( not ( = ?auto_723242 ?auto_723245 ) ) ( not ( = ?auto_723242 ?auto_723246 ) ) ( not ( = ?auto_723243 ?auto_723244 ) ) ( not ( = ?auto_723243 ?auto_723245 ) ) ( not ( = ?auto_723243 ?auto_723246 ) ) ( not ( = ?auto_723244 ?auto_723245 ) ) ( not ( = ?auto_723244 ?auto_723246 ) ) ( not ( = ?auto_723245 ?auto_723246 ) ) ( ON ?auto_723244 ?auto_723245 ) ( ON ?auto_723243 ?auto_723244 ) ( ON ?auto_723242 ?auto_723243 ) ( ON ?auto_723241 ?auto_723242 ) ( ON ?auto_723240 ?auto_723241 ) ( ON ?auto_723239 ?auto_723240 ) ( ON ?auto_723238 ?auto_723239 ) ( ON ?auto_723237 ?auto_723238 ) ( ON ?auto_723236 ?auto_723237 ) ( ON ?auto_723235 ?auto_723236 ) ( CLEAR ?auto_723233 ) ( ON ?auto_723234 ?auto_723235 ) ( CLEAR ?auto_723234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_723230 ?auto_723231 ?auto_723232 ?auto_723233 ?auto_723234 )
      ( MAKE-16PILE ?auto_723230 ?auto_723231 ?auto_723232 ?auto_723233 ?auto_723234 ?auto_723235 ?auto_723236 ?auto_723237 ?auto_723238 ?auto_723239 ?auto_723240 ?auto_723241 ?auto_723242 ?auto_723243 ?auto_723244 ?auto_723245 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723296 - BLOCK
      ?auto_723297 - BLOCK
      ?auto_723298 - BLOCK
      ?auto_723299 - BLOCK
      ?auto_723300 - BLOCK
      ?auto_723301 - BLOCK
      ?auto_723302 - BLOCK
      ?auto_723303 - BLOCK
      ?auto_723304 - BLOCK
      ?auto_723305 - BLOCK
      ?auto_723306 - BLOCK
      ?auto_723307 - BLOCK
      ?auto_723308 - BLOCK
      ?auto_723309 - BLOCK
      ?auto_723310 - BLOCK
      ?auto_723311 - BLOCK
    )
    :vars
    (
      ?auto_723312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723311 ?auto_723312 ) ( ON-TABLE ?auto_723296 ) ( ON ?auto_723297 ?auto_723296 ) ( ON ?auto_723298 ?auto_723297 ) ( not ( = ?auto_723296 ?auto_723297 ) ) ( not ( = ?auto_723296 ?auto_723298 ) ) ( not ( = ?auto_723296 ?auto_723299 ) ) ( not ( = ?auto_723296 ?auto_723300 ) ) ( not ( = ?auto_723296 ?auto_723301 ) ) ( not ( = ?auto_723296 ?auto_723302 ) ) ( not ( = ?auto_723296 ?auto_723303 ) ) ( not ( = ?auto_723296 ?auto_723304 ) ) ( not ( = ?auto_723296 ?auto_723305 ) ) ( not ( = ?auto_723296 ?auto_723306 ) ) ( not ( = ?auto_723296 ?auto_723307 ) ) ( not ( = ?auto_723296 ?auto_723308 ) ) ( not ( = ?auto_723296 ?auto_723309 ) ) ( not ( = ?auto_723296 ?auto_723310 ) ) ( not ( = ?auto_723296 ?auto_723311 ) ) ( not ( = ?auto_723296 ?auto_723312 ) ) ( not ( = ?auto_723297 ?auto_723298 ) ) ( not ( = ?auto_723297 ?auto_723299 ) ) ( not ( = ?auto_723297 ?auto_723300 ) ) ( not ( = ?auto_723297 ?auto_723301 ) ) ( not ( = ?auto_723297 ?auto_723302 ) ) ( not ( = ?auto_723297 ?auto_723303 ) ) ( not ( = ?auto_723297 ?auto_723304 ) ) ( not ( = ?auto_723297 ?auto_723305 ) ) ( not ( = ?auto_723297 ?auto_723306 ) ) ( not ( = ?auto_723297 ?auto_723307 ) ) ( not ( = ?auto_723297 ?auto_723308 ) ) ( not ( = ?auto_723297 ?auto_723309 ) ) ( not ( = ?auto_723297 ?auto_723310 ) ) ( not ( = ?auto_723297 ?auto_723311 ) ) ( not ( = ?auto_723297 ?auto_723312 ) ) ( not ( = ?auto_723298 ?auto_723299 ) ) ( not ( = ?auto_723298 ?auto_723300 ) ) ( not ( = ?auto_723298 ?auto_723301 ) ) ( not ( = ?auto_723298 ?auto_723302 ) ) ( not ( = ?auto_723298 ?auto_723303 ) ) ( not ( = ?auto_723298 ?auto_723304 ) ) ( not ( = ?auto_723298 ?auto_723305 ) ) ( not ( = ?auto_723298 ?auto_723306 ) ) ( not ( = ?auto_723298 ?auto_723307 ) ) ( not ( = ?auto_723298 ?auto_723308 ) ) ( not ( = ?auto_723298 ?auto_723309 ) ) ( not ( = ?auto_723298 ?auto_723310 ) ) ( not ( = ?auto_723298 ?auto_723311 ) ) ( not ( = ?auto_723298 ?auto_723312 ) ) ( not ( = ?auto_723299 ?auto_723300 ) ) ( not ( = ?auto_723299 ?auto_723301 ) ) ( not ( = ?auto_723299 ?auto_723302 ) ) ( not ( = ?auto_723299 ?auto_723303 ) ) ( not ( = ?auto_723299 ?auto_723304 ) ) ( not ( = ?auto_723299 ?auto_723305 ) ) ( not ( = ?auto_723299 ?auto_723306 ) ) ( not ( = ?auto_723299 ?auto_723307 ) ) ( not ( = ?auto_723299 ?auto_723308 ) ) ( not ( = ?auto_723299 ?auto_723309 ) ) ( not ( = ?auto_723299 ?auto_723310 ) ) ( not ( = ?auto_723299 ?auto_723311 ) ) ( not ( = ?auto_723299 ?auto_723312 ) ) ( not ( = ?auto_723300 ?auto_723301 ) ) ( not ( = ?auto_723300 ?auto_723302 ) ) ( not ( = ?auto_723300 ?auto_723303 ) ) ( not ( = ?auto_723300 ?auto_723304 ) ) ( not ( = ?auto_723300 ?auto_723305 ) ) ( not ( = ?auto_723300 ?auto_723306 ) ) ( not ( = ?auto_723300 ?auto_723307 ) ) ( not ( = ?auto_723300 ?auto_723308 ) ) ( not ( = ?auto_723300 ?auto_723309 ) ) ( not ( = ?auto_723300 ?auto_723310 ) ) ( not ( = ?auto_723300 ?auto_723311 ) ) ( not ( = ?auto_723300 ?auto_723312 ) ) ( not ( = ?auto_723301 ?auto_723302 ) ) ( not ( = ?auto_723301 ?auto_723303 ) ) ( not ( = ?auto_723301 ?auto_723304 ) ) ( not ( = ?auto_723301 ?auto_723305 ) ) ( not ( = ?auto_723301 ?auto_723306 ) ) ( not ( = ?auto_723301 ?auto_723307 ) ) ( not ( = ?auto_723301 ?auto_723308 ) ) ( not ( = ?auto_723301 ?auto_723309 ) ) ( not ( = ?auto_723301 ?auto_723310 ) ) ( not ( = ?auto_723301 ?auto_723311 ) ) ( not ( = ?auto_723301 ?auto_723312 ) ) ( not ( = ?auto_723302 ?auto_723303 ) ) ( not ( = ?auto_723302 ?auto_723304 ) ) ( not ( = ?auto_723302 ?auto_723305 ) ) ( not ( = ?auto_723302 ?auto_723306 ) ) ( not ( = ?auto_723302 ?auto_723307 ) ) ( not ( = ?auto_723302 ?auto_723308 ) ) ( not ( = ?auto_723302 ?auto_723309 ) ) ( not ( = ?auto_723302 ?auto_723310 ) ) ( not ( = ?auto_723302 ?auto_723311 ) ) ( not ( = ?auto_723302 ?auto_723312 ) ) ( not ( = ?auto_723303 ?auto_723304 ) ) ( not ( = ?auto_723303 ?auto_723305 ) ) ( not ( = ?auto_723303 ?auto_723306 ) ) ( not ( = ?auto_723303 ?auto_723307 ) ) ( not ( = ?auto_723303 ?auto_723308 ) ) ( not ( = ?auto_723303 ?auto_723309 ) ) ( not ( = ?auto_723303 ?auto_723310 ) ) ( not ( = ?auto_723303 ?auto_723311 ) ) ( not ( = ?auto_723303 ?auto_723312 ) ) ( not ( = ?auto_723304 ?auto_723305 ) ) ( not ( = ?auto_723304 ?auto_723306 ) ) ( not ( = ?auto_723304 ?auto_723307 ) ) ( not ( = ?auto_723304 ?auto_723308 ) ) ( not ( = ?auto_723304 ?auto_723309 ) ) ( not ( = ?auto_723304 ?auto_723310 ) ) ( not ( = ?auto_723304 ?auto_723311 ) ) ( not ( = ?auto_723304 ?auto_723312 ) ) ( not ( = ?auto_723305 ?auto_723306 ) ) ( not ( = ?auto_723305 ?auto_723307 ) ) ( not ( = ?auto_723305 ?auto_723308 ) ) ( not ( = ?auto_723305 ?auto_723309 ) ) ( not ( = ?auto_723305 ?auto_723310 ) ) ( not ( = ?auto_723305 ?auto_723311 ) ) ( not ( = ?auto_723305 ?auto_723312 ) ) ( not ( = ?auto_723306 ?auto_723307 ) ) ( not ( = ?auto_723306 ?auto_723308 ) ) ( not ( = ?auto_723306 ?auto_723309 ) ) ( not ( = ?auto_723306 ?auto_723310 ) ) ( not ( = ?auto_723306 ?auto_723311 ) ) ( not ( = ?auto_723306 ?auto_723312 ) ) ( not ( = ?auto_723307 ?auto_723308 ) ) ( not ( = ?auto_723307 ?auto_723309 ) ) ( not ( = ?auto_723307 ?auto_723310 ) ) ( not ( = ?auto_723307 ?auto_723311 ) ) ( not ( = ?auto_723307 ?auto_723312 ) ) ( not ( = ?auto_723308 ?auto_723309 ) ) ( not ( = ?auto_723308 ?auto_723310 ) ) ( not ( = ?auto_723308 ?auto_723311 ) ) ( not ( = ?auto_723308 ?auto_723312 ) ) ( not ( = ?auto_723309 ?auto_723310 ) ) ( not ( = ?auto_723309 ?auto_723311 ) ) ( not ( = ?auto_723309 ?auto_723312 ) ) ( not ( = ?auto_723310 ?auto_723311 ) ) ( not ( = ?auto_723310 ?auto_723312 ) ) ( not ( = ?auto_723311 ?auto_723312 ) ) ( ON ?auto_723310 ?auto_723311 ) ( ON ?auto_723309 ?auto_723310 ) ( ON ?auto_723308 ?auto_723309 ) ( ON ?auto_723307 ?auto_723308 ) ( ON ?auto_723306 ?auto_723307 ) ( ON ?auto_723305 ?auto_723306 ) ( ON ?auto_723304 ?auto_723305 ) ( ON ?auto_723303 ?auto_723304 ) ( ON ?auto_723302 ?auto_723303 ) ( ON ?auto_723301 ?auto_723302 ) ( ON ?auto_723300 ?auto_723301 ) ( CLEAR ?auto_723298 ) ( ON ?auto_723299 ?auto_723300 ) ( CLEAR ?auto_723299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_723296 ?auto_723297 ?auto_723298 ?auto_723299 )
      ( MAKE-16PILE ?auto_723296 ?auto_723297 ?auto_723298 ?auto_723299 ?auto_723300 ?auto_723301 ?auto_723302 ?auto_723303 ?auto_723304 ?auto_723305 ?auto_723306 ?auto_723307 ?auto_723308 ?auto_723309 ?auto_723310 ?auto_723311 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723362 - BLOCK
      ?auto_723363 - BLOCK
      ?auto_723364 - BLOCK
      ?auto_723365 - BLOCK
      ?auto_723366 - BLOCK
      ?auto_723367 - BLOCK
      ?auto_723368 - BLOCK
      ?auto_723369 - BLOCK
      ?auto_723370 - BLOCK
      ?auto_723371 - BLOCK
      ?auto_723372 - BLOCK
      ?auto_723373 - BLOCK
      ?auto_723374 - BLOCK
      ?auto_723375 - BLOCK
      ?auto_723376 - BLOCK
      ?auto_723377 - BLOCK
    )
    :vars
    (
      ?auto_723378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723377 ?auto_723378 ) ( ON-TABLE ?auto_723362 ) ( ON ?auto_723363 ?auto_723362 ) ( not ( = ?auto_723362 ?auto_723363 ) ) ( not ( = ?auto_723362 ?auto_723364 ) ) ( not ( = ?auto_723362 ?auto_723365 ) ) ( not ( = ?auto_723362 ?auto_723366 ) ) ( not ( = ?auto_723362 ?auto_723367 ) ) ( not ( = ?auto_723362 ?auto_723368 ) ) ( not ( = ?auto_723362 ?auto_723369 ) ) ( not ( = ?auto_723362 ?auto_723370 ) ) ( not ( = ?auto_723362 ?auto_723371 ) ) ( not ( = ?auto_723362 ?auto_723372 ) ) ( not ( = ?auto_723362 ?auto_723373 ) ) ( not ( = ?auto_723362 ?auto_723374 ) ) ( not ( = ?auto_723362 ?auto_723375 ) ) ( not ( = ?auto_723362 ?auto_723376 ) ) ( not ( = ?auto_723362 ?auto_723377 ) ) ( not ( = ?auto_723362 ?auto_723378 ) ) ( not ( = ?auto_723363 ?auto_723364 ) ) ( not ( = ?auto_723363 ?auto_723365 ) ) ( not ( = ?auto_723363 ?auto_723366 ) ) ( not ( = ?auto_723363 ?auto_723367 ) ) ( not ( = ?auto_723363 ?auto_723368 ) ) ( not ( = ?auto_723363 ?auto_723369 ) ) ( not ( = ?auto_723363 ?auto_723370 ) ) ( not ( = ?auto_723363 ?auto_723371 ) ) ( not ( = ?auto_723363 ?auto_723372 ) ) ( not ( = ?auto_723363 ?auto_723373 ) ) ( not ( = ?auto_723363 ?auto_723374 ) ) ( not ( = ?auto_723363 ?auto_723375 ) ) ( not ( = ?auto_723363 ?auto_723376 ) ) ( not ( = ?auto_723363 ?auto_723377 ) ) ( not ( = ?auto_723363 ?auto_723378 ) ) ( not ( = ?auto_723364 ?auto_723365 ) ) ( not ( = ?auto_723364 ?auto_723366 ) ) ( not ( = ?auto_723364 ?auto_723367 ) ) ( not ( = ?auto_723364 ?auto_723368 ) ) ( not ( = ?auto_723364 ?auto_723369 ) ) ( not ( = ?auto_723364 ?auto_723370 ) ) ( not ( = ?auto_723364 ?auto_723371 ) ) ( not ( = ?auto_723364 ?auto_723372 ) ) ( not ( = ?auto_723364 ?auto_723373 ) ) ( not ( = ?auto_723364 ?auto_723374 ) ) ( not ( = ?auto_723364 ?auto_723375 ) ) ( not ( = ?auto_723364 ?auto_723376 ) ) ( not ( = ?auto_723364 ?auto_723377 ) ) ( not ( = ?auto_723364 ?auto_723378 ) ) ( not ( = ?auto_723365 ?auto_723366 ) ) ( not ( = ?auto_723365 ?auto_723367 ) ) ( not ( = ?auto_723365 ?auto_723368 ) ) ( not ( = ?auto_723365 ?auto_723369 ) ) ( not ( = ?auto_723365 ?auto_723370 ) ) ( not ( = ?auto_723365 ?auto_723371 ) ) ( not ( = ?auto_723365 ?auto_723372 ) ) ( not ( = ?auto_723365 ?auto_723373 ) ) ( not ( = ?auto_723365 ?auto_723374 ) ) ( not ( = ?auto_723365 ?auto_723375 ) ) ( not ( = ?auto_723365 ?auto_723376 ) ) ( not ( = ?auto_723365 ?auto_723377 ) ) ( not ( = ?auto_723365 ?auto_723378 ) ) ( not ( = ?auto_723366 ?auto_723367 ) ) ( not ( = ?auto_723366 ?auto_723368 ) ) ( not ( = ?auto_723366 ?auto_723369 ) ) ( not ( = ?auto_723366 ?auto_723370 ) ) ( not ( = ?auto_723366 ?auto_723371 ) ) ( not ( = ?auto_723366 ?auto_723372 ) ) ( not ( = ?auto_723366 ?auto_723373 ) ) ( not ( = ?auto_723366 ?auto_723374 ) ) ( not ( = ?auto_723366 ?auto_723375 ) ) ( not ( = ?auto_723366 ?auto_723376 ) ) ( not ( = ?auto_723366 ?auto_723377 ) ) ( not ( = ?auto_723366 ?auto_723378 ) ) ( not ( = ?auto_723367 ?auto_723368 ) ) ( not ( = ?auto_723367 ?auto_723369 ) ) ( not ( = ?auto_723367 ?auto_723370 ) ) ( not ( = ?auto_723367 ?auto_723371 ) ) ( not ( = ?auto_723367 ?auto_723372 ) ) ( not ( = ?auto_723367 ?auto_723373 ) ) ( not ( = ?auto_723367 ?auto_723374 ) ) ( not ( = ?auto_723367 ?auto_723375 ) ) ( not ( = ?auto_723367 ?auto_723376 ) ) ( not ( = ?auto_723367 ?auto_723377 ) ) ( not ( = ?auto_723367 ?auto_723378 ) ) ( not ( = ?auto_723368 ?auto_723369 ) ) ( not ( = ?auto_723368 ?auto_723370 ) ) ( not ( = ?auto_723368 ?auto_723371 ) ) ( not ( = ?auto_723368 ?auto_723372 ) ) ( not ( = ?auto_723368 ?auto_723373 ) ) ( not ( = ?auto_723368 ?auto_723374 ) ) ( not ( = ?auto_723368 ?auto_723375 ) ) ( not ( = ?auto_723368 ?auto_723376 ) ) ( not ( = ?auto_723368 ?auto_723377 ) ) ( not ( = ?auto_723368 ?auto_723378 ) ) ( not ( = ?auto_723369 ?auto_723370 ) ) ( not ( = ?auto_723369 ?auto_723371 ) ) ( not ( = ?auto_723369 ?auto_723372 ) ) ( not ( = ?auto_723369 ?auto_723373 ) ) ( not ( = ?auto_723369 ?auto_723374 ) ) ( not ( = ?auto_723369 ?auto_723375 ) ) ( not ( = ?auto_723369 ?auto_723376 ) ) ( not ( = ?auto_723369 ?auto_723377 ) ) ( not ( = ?auto_723369 ?auto_723378 ) ) ( not ( = ?auto_723370 ?auto_723371 ) ) ( not ( = ?auto_723370 ?auto_723372 ) ) ( not ( = ?auto_723370 ?auto_723373 ) ) ( not ( = ?auto_723370 ?auto_723374 ) ) ( not ( = ?auto_723370 ?auto_723375 ) ) ( not ( = ?auto_723370 ?auto_723376 ) ) ( not ( = ?auto_723370 ?auto_723377 ) ) ( not ( = ?auto_723370 ?auto_723378 ) ) ( not ( = ?auto_723371 ?auto_723372 ) ) ( not ( = ?auto_723371 ?auto_723373 ) ) ( not ( = ?auto_723371 ?auto_723374 ) ) ( not ( = ?auto_723371 ?auto_723375 ) ) ( not ( = ?auto_723371 ?auto_723376 ) ) ( not ( = ?auto_723371 ?auto_723377 ) ) ( not ( = ?auto_723371 ?auto_723378 ) ) ( not ( = ?auto_723372 ?auto_723373 ) ) ( not ( = ?auto_723372 ?auto_723374 ) ) ( not ( = ?auto_723372 ?auto_723375 ) ) ( not ( = ?auto_723372 ?auto_723376 ) ) ( not ( = ?auto_723372 ?auto_723377 ) ) ( not ( = ?auto_723372 ?auto_723378 ) ) ( not ( = ?auto_723373 ?auto_723374 ) ) ( not ( = ?auto_723373 ?auto_723375 ) ) ( not ( = ?auto_723373 ?auto_723376 ) ) ( not ( = ?auto_723373 ?auto_723377 ) ) ( not ( = ?auto_723373 ?auto_723378 ) ) ( not ( = ?auto_723374 ?auto_723375 ) ) ( not ( = ?auto_723374 ?auto_723376 ) ) ( not ( = ?auto_723374 ?auto_723377 ) ) ( not ( = ?auto_723374 ?auto_723378 ) ) ( not ( = ?auto_723375 ?auto_723376 ) ) ( not ( = ?auto_723375 ?auto_723377 ) ) ( not ( = ?auto_723375 ?auto_723378 ) ) ( not ( = ?auto_723376 ?auto_723377 ) ) ( not ( = ?auto_723376 ?auto_723378 ) ) ( not ( = ?auto_723377 ?auto_723378 ) ) ( ON ?auto_723376 ?auto_723377 ) ( ON ?auto_723375 ?auto_723376 ) ( ON ?auto_723374 ?auto_723375 ) ( ON ?auto_723373 ?auto_723374 ) ( ON ?auto_723372 ?auto_723373 ) ( ON ?auto_723371 ?auto_723372 ) ( ON ?auto_723370 ?auto_723371 ) ( ON ?auto_723369 ?auto_723370 ) ( ON ?auto_723368 ?auto_723369 ) ( ON ?auto_723367 ?auto_723368 ) ( ON ?auto_723366 ?auto_723367 ) ( ON ?auto_723365 ?auto_723366 ) ( CLEAR ?auto_723363 ) ( ON ?auto_723364 ?auto_723365 ) ( CLEAR ?auto_723364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_723362 ?auto_723363 ?auto_723364 )
      ( MAKE-16PILE ?auto_723362 ?auto_723363 ?auto_723364 ?auto_723365 ?auto_723366 ?auto_723367 ?auto_723368 ?auto_723369 ?auto_723370 ?auto_723371 ?auto_723372 ?auto_723373 ?auto_723374 ?auto_723375 ?auto_723376 ?auto_723377 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723428 - BLOCK
      ?auto_723429 - BLOCK
      ?auto_723430 - BLOCK
      ?auto_723431 - BLOCK
      ?auto_723432 - BLOCK
      ?auto_723433 - BLOCK
      ?auto_723434 - BLOCK
      ?auto_723435 - BLOCK
      ?auto_723436 - BLOCK
      ?auto_723437 - BLOCK
      ?auto_723438 - BLOCK
      ?auto_723439 - BLOCK
      ?auto_723440 - BLOCK
      ?auto_723441 - BLOCK
      ?auto_723442 - BLOCK
      ?auto_723443 - BLOCK
    )
    :vars
    (
      ?auto_723444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723443 ?auto_723444 ) ( ON-TABLE ?auto_723428 ) ( not ( = ?auto_723428 ?auto_723429 ) ) ( not ( = ?auto_723428 ?auto_723430 ) ) ( not ( = ?auto_723428 ?auto_723431 ) ) ( not ( = ?auto_723428 ?auto_723432 ) ) ( not ( = ?auto_723428 ?auto_723433 ) ) ( not ( = ?auto_723428 ?auto_723434 ) ) ( not ( = ?auto_723428 ?auto_723435 ) ) ( not ( = ?auto_723428 ?auto_723436 ) ) ( not ( = ?auto_723428 ?auto_723437 ) ) ( not ( = ?auto_723428 ?auto_723438 ) ) ( not ( = ?auto_723428 ?auto_723439 ) ) ( not ( = ?auto_723428 ?auto_723440 ) ) ( not ( = ?auto_723428 ?auto_723441 ) ) ( not ( = ?auto_723428 ?auto_723442 ) ) ( not ( = ?auto_723428 ?auto_723443 ) ) ( not ( = ?auto_723428 ?auto_723444 ) ) ( not ( = ?auto_723429 ?auto_723430 ) ) ( not ( = ?auto_723429 ?auto_723431 ) ) ( not ( = ?auto_723429 ?auto_723432 ) ) ( not ( = ?auto_723429 ?auto_723433 ) ) ( not ( = ?auto_723429 ?auto_723434 ) ) ( not ( = ?auto_723429 ?auto_723435 ) ) ( not ( = ?auto_723429 ?auto_723436 ) ) ( not ( = ?auto_723429 ?auto_723437 ) ) ( not ( = ?auto_723429 ?auto_723438 ) ) ( not ( = ?auto_723429 ?auto_723439 ) ) ( not ( = ?auto_723429 ?auto_723440 ) ) ( not ( = ?auto_723429 ?auto_723441 ) ) ( not ( = ?auto_723429 ?auto_723442 ) ) ( not ( = ?auto_723429 ?auto_723443 ) ) ( not ( = ?auto_723429 ?auto_723444 ) ) ( not ( = ?auto_723430 ?auto_723431 ) ) ( not ( = ?auto_723430 ?auto_723432 ) ) ( not ( = ?auto_723430 ?auto_723433 ) ) ( not ( = ?auto_723430 ?auto_723434 ) ) ( not ( = ?auto_723430 ?auto_723435 ) ) ( not ( = ?auto_723430 ?auto_723436 ) ) ( not ( = ?auto_723430 ?auto_723437 ) ) ( not ( = ?auto_723430 ?auto_723438 ) ) ( not ( = ?auto_723430 ?auto_723439 ) ) ( not ( = ?auto_723430 ?auto_723440 ) ) ( not ( = ?auto_723430 ?auto_723441 ) ) ( not ( = ?auto_723430 ?auto_723442 ) ) ( not ( = ?auto_723430 ?auto_723443 ) ) ( not ( = ?auto_723430 ?auto_723444 ) ) ( not ( = ?auto_723431 ?auto_723432 ) ) ( not ( = ?auto_723431 ?auto_723433 ) ) ( not ( = ?auto_723431 ?auto_723434 ) ) ( not ( = ?auto_723431 ?auto_723435 ) ) ( not ( = ?auto_723431 ?auto_723436 ) ) ( not ( = ?auto_723431 ?auto_723437 ) ) ( not ( = ?auto_723431 ?auto_723438 ) ) ( not ( = ?auto_723431 ?auto_723439 ) ) ( not ( = ?auto_723431 ?auto_723440 ) ) ( not ( = ?auto_723431 ?auto_723441 ) ) ( not ( = ?auto_723431 ?auto_723442 ) ) ( not ( = ?auto_723431 ?auto_723443 ) ) ( not ( = ?auto_723431 ?auto_723444 ) ) ( not ( = ?auto_723432 ?auto_723433 ) ) ( not ( = ?auto_723432 ?auto_723434 ) ) ( not ( = ?auto_723432 ?auto_723435 ) ) ( not ( = ?auto_723432 ?auto_723436 ) ) ( not ( = ?auto_723432 ?auto_723437 ) ) ( not ( = ?auto_723432 ?auto_723438 ) ) ( not ( = ?auto_723432 ?auto_723439 ) ) ( not ( = ?auto_723432 ?auto_723440 ) ) ( not ( = ?auto_723432 ?auto_723441 ) ) ( not ( = ?auto_723432 ?auto_723442 ) ) ( not ( = ?auto_723432 ?auto_723443 ) ) ( not ( = ?auto_723432 ?auto_723444 ) ) ( not ( = ?auto_723433 ?auto_723434 ) ) ( not ( = ?auto_723433 ?auto_723435 ) ) ( not ( = ?auto_723433 ?auto_723436 ) ) ( not ( = ?auto_723433 ?auto_723437 ) ) ( not ( = ?auto_723433 ?auto_723438 ) ) ( not ( = ?auto_723433 ?auto_723439 ) ) ( not ( = ?auto_723433 ?auto_723440 ) ) ( not ( = ?auto_723433 ?auto_723441 ) ) ( not ( = ?auto_723433 ?auto_723442 ) ) ( not ( = ?auto_723433 ?auto_723443 ) ) ( not ( = ?auto_723433 ?auto_723444 ) ) ( not ( = ?auto_723434 ?auto_723435 ) ) ( not ( = ?auto_723434 ?auto_723436 ) ) ( not ( = ?auto_723434 ?auto_723437 ) ) ( not ( = ?auto_723434 ?auto_723438 ) ) ( not ( = ?auto_723434 ?auto_723439 ) ) ( not ( = ?auto_723434 ?auto_723440 ) ) ( not ( = ?auto_723434 ?auto_723441 ) ) ( not ( = ?auto_723434 ?auto_723442 ) ) ( not ( = ?auto_723434 ?auto_723443 ) ) ( not ( = ?auto_723434 ?auto_723444 ) ) ( not ( = ?auto_723435 ?auto_723436 ) ) ( not ( = ?auto_723435 ?auto_723437 ) ) ( not ( = ?auto_723435 ?auto_723438 ) ) ( not ( = ?auto_723435 ?auto_723439 ) ) ( not ( = ?auto_723435 ?auto_723440 ) ) ( not ( = ?auto_723435 ?auto_723441 ) ) ( not ( = ?auto_723435 ?auto_723442 ) ) ( not ( = ?auto_723435 ?auto_723443 ) ) ( not ( = ?auto_723435 ?auto_723444 ) ) ( not ( = ?auto_723436 ?auto_723437 ) ) ( not ( = ?auto_723436 ?auto_723438 ) ) ( not ( = ?auto_723436 ?auto_723439 ) ) ( not ( = ?auto_723436 ?auto_723440 ) ) ( not ( = ?auto_723436 ?auto_723441 ) ) ( not ( = ?auto_723436 ?auto_723442 ) ) ( not ( = ?auto_723436 ?auto_723443 ) ) ( not ( = ?auto_723436 ?auto_723444 ) ) ( not ( = ?auto_723437 ?auto_723438 ) ) ( not ( = ?auto_723437 ?auto_723439 ) ) ( not ( = ?auto_723437 ?auto_723440 ) ) ( not ( = ?auto_723437 ?auto_723441 ) ) ( not ( = ?auto_723437 ?auto_723442 ) ) ( not ( = ?auto_723437 ?auto_723443 ) ) ( not ( = ?auto_723437 ?auto_723444 ) ) ( not ( = ?auto_723438 ?auto_723439 ) ) ( not ( = ?auto_723438 ?auto_723440 ) ) ( not ( = ?auto_723438 ?auto_723441 ) ) ( not ( = ?auto_723438 ?auto_723442 ) ) ( not ( = ?auto_723438 ?auto_723443 ) ) ( not ( = ?auto_723438 ?auto_723444 ) ) ( not ( = ?auto_723439 ?auto_723440 ) ) ( not ( = ?auto_723439 ?auto_723441 ) ) ( not ( = ?auto_723439 ?auto_723442 ) ) ( not ( = ?auto_723439 ?auto_723443 ) ) ( not ( = ?auto_723439 ?auto_723444 ) ) ( not ( = ?auto_723440 ?auto_723441 ) ) ( not ( = ?auto_723440 ?auto_723442 ) ) ( not ( = ?auto_723440 ?auto_723443 ) ) ( not ( = ?auto_723440 ?auto_723444 ) ) ( not ( = ?auto_723441 ?auto_723442 ) ) ( not ( = ?auto_723441 ?auto_723443 ) ) ( not ( = ?auto_723441 ?auto_723444 ) ) ( not ( = ?auto_723442 ?auto_723443 ) ) ( not ( = ?auto_723442 ?auto_723444 ) ) ( not ( = ?auto_723443 ?auto_723444 ) ) ( ON ?auto_723442 ?auto_723443 ) ( ON ?auto_723441 ?auto_723442 ) ( ON ?auto_723440 ?auto_723441 ) ( ON ?auto_723439 ?auto_723440 ) ( ON ?auto_723438 ?auto_723439 ) ( ON ?auto_723437 ?auto_723438 ) ( ON ?auto_723436 ?auto_723437 ) ( ON ?auto_723435 ?auto_723436 ) ( ON ?auto_723434 ?auto_723435 ) ( ON ?auto_723433 ?auto_723434 ) ( ON ?auto_723432 ?auto_723433 ) ( ON ?auto_723431 ?auto_723432 ) ( ON ?auto_723430 ?auto_723431 ) ( CLEAR ?auto_723428 ) ( ON ?auto_723429 ?auto_723430 ) ( CLEAR ?auto_723429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_723428 ?auto_723429 )
      ( MAKE-16PILE ?auto_723428 ?auto_723429 ?auto_723430 ?auto_723431 ?auto_723432 ?auto_723433 ?auto_723434 ?auto_723435 ?auto_723436 ?auto_723437 ?auto_723438 ?auto_723439 ?auto_723440 ?auto_723441 ?auto_723442 ?auto_723443 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_723494 - BLOCK
      ?auto_723495 - BLOCK
      ?auto_723496 - BLOCK
      ?auto_723497 - BLOCK
      ?auto_723498 - BLOCK
      ?auto_723499 - BLOCK
      ?auto_723500 - BLOCK
      ?auto_723501 - BLOCK
      ?auto_723502 - BLOCK
      ?auto_723503 - BLOCK
      ?auto_723504 - BLOCK
      ?auto_723505 - BLOCK
      ?auto_723506 - BLOCK
      ?auto_723507 - BLOCK
      ?auto_723508 - BLOCK
      ?auto_723509 - BLOCK
    )
    :vars
    (
      ?auto_723510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723509 ?auto_723510 ) ( not ( = ?auto_723494 ?auto_723495 ) ) ( not ( = ?auto_723494 ?auto_723496 ) ) ( not ( = ?auto_723494 ?auto_723497 ) ) ( not ( = ?auto_723494 ?auto_723498 ) ) ( not ( = ?auto_723494 ?auto_723499 ) ) ( not ( = ?auto_723494 ?auto_723500 ) ) ( not ( = ?auto_723494 ?auto_723501 ) ) ( not ( = ?auto_723494 ?auto_723502 ) ) ( not ( = ?auto_723494 ?auto_723503 ) ) ( not ( = ?auto_723494 ?auto_723504 ) ) ( not ( = ?auto_723494 ?auto_723505 ) ) ( not ( = ?auto_723494 ?auto_723506 ) ) ( not ( = ?auto_723494 ?auto_723507 ) ) ( not ( = ?auto_723494 ?auto_723508 ) ) ( not ( = ?auto_723494 ?auto_723509 ) ) ( not ( = ?auto_723494 ?auto_723510 ) ) ( not ( = ?auto_723495 ?auto_723496 ) ) ( not ( = ?auto_723495 ?auto_723497 ) ) ( not ( = ?auto_723495 ?auto_723498 ) ) ( not ( = ?auto_723495 ?auto_723499 ) ) ( not ( = ?auto_723495 ?auto_723500 ) ) ( not ( = ?auto_723495 ?auto_723501 ) ) ( not ( = ?auto_723495 ?auto_723502 ) ) ( not ( = ?auto_723495 ?auto_723503 ) ) ( not ( = ?auto_723495 ?auto_723504 ) ) ( not ( = ?auto_723495 ?auto_723505 ) ) ( not ( = ?auto_723495 ?auto_723506 ) ) ( not ( = ?auto_723495 ?auto_723507 ) ) ( not ( = ?auto_723495 ?auto_723508 ) ) ( not ( = ?auto_723495 ?auto_723509 ) ) ( not ( = ?auto_723495 ?auto_723510 ) ) ( not ( = ?auto_723496 ?auto_723497 ) ) ( not ( = ?auto_723496 ?auto_723498 ) ) ( not ( = ?auto_723496 ?auto_723499 ) ) ( not ( = ?auto_723496 ?auto_723500 ) ) ( not ( = ?auto_723496 ?auto_723501 ) ) ( not ( = ?auto_723496 ?auto_723502 ) ) ( not ( = ?auto_723496 ?auto_723503 ) ) ( not ( = ?auto_723496 ?auto_723504 ) ) ( not ( = ?auto_723496 ?auto_723505 ) ) ( not ( = ?auto_723496 ?auto_723506 ) ) ( not ( = ?auto_723496 ?auto_723507 ) ) ( not ( = ?auto_723496 ?auto_723508 ) ) ( not ( = ?auto_723496 ?auto_723509 ) ) ( not ( = ?auto_723496 ?auto_723510 ) ) ( not ( = ?auto_723497 ?auto_723498 ) ) ( not ( = ?auto_723497 ?auto_723499 ) ) ( not ( = ?auto_723497 ?auto_723500 ) ) ( not ( = ?auto_723497 ?auto_723501 ) ) ( not ( = ?auto_723497 ?auto_723502 ) ) ( not ( = ?auto_723497 ?auto_723503 ) ) ( not ( = ?auto_723497 ?auto_723504 ) ) ( not ( = ?auto_723497 ?auto_723505 ) ) ( not ( = ?auto_723497 ?auto_723506 ) ) ( not ( = ?auto_723497 ?auto_723507 ) ) ( not ( = ?auto_723497 ?auto_723508 ) ) ( not ( = ?auto_723497 ?auto_723509 ) ) ( not ( = ?auto_723497 ?auto_723510 ) ) ( not ( = ?auto_723498 ?auto_723499 ) ) ( not ( = ?auto_723498 ?auto_723500 ) ) ( not ( = ?auto_723498 ?auto_723501 ) ) ( not ( = ?auto_723498 ?auto_723502 ) ) ( not ( = ?auto_723498 ?auto_723503 ) ) ( not ( = ?auto_723498 ?auto_723504 ) ) ( not ( = ?auto_723498 ?auto_723505 ) ) ( not ( = ?auto_723498 ?auto_723506 ) ) ( not ( = ?auto_723498 ?auto_723507 ) ) ( not ( = ?auto_723498 ?auto_723508 ) ) ( not ( = ?auto_723498 ?auto_723509 ) ) ( not ( = ?auto_723498 ?auto_723510 ) ) ( not ( = ?auto_723499 ?auto_723500 ) ) ( not ( = ?auto_723499 ?auto_723501 ) ) ( not ( = ?auto_723499 ?auto_723502 ) ) ( not ( = ?auto_723499 ?auto_723503 ) ) ( not ( = ?auto_723499 ?auto_723504 ) ) ( not ( = ?auto_723499 ?auto_723505 ) ) ( not ( = ?auto_723499 ?auto_723506 ) ) ( not ( = ?auto_723499 ?auto_723507 ) ) ( not ( = ?auto_723499 ?auto_723508 ) ) ( not ( = ?auto_723499 ?auto_723509 ) ) ( not ( = ?auto_723499 ?auto_723510 ) ) ( not ( = ?auto_723500 ?auto_723501 ) ) ( not ( = ?auto_723500 ?auto_723502 ) ) ( not ( = ?auto_723500 ?auto_723503 ) ) ( not ( = ?auto_723500 ?auto_723504 ) ) ( not ( = ?auto_723500 ?auto_723505 ) ) ( not ( = ?auto_723500 ?auto_723506 ) ) ( not ( = ?auto_723500 ?auto_723507 ) ) ( not ( = ?auto_723500 ?auto_723508 ) ) ( not ( = ?auto_723500 ?auto_723509 ) ) ( not ( = ?auto_723500 ?auto_723510 ) ) ( not ( = ?auto_723501 ?auto_723502 ) ) ( not ( = ?auto_723501 ?auto_723503 ) ) ( not ( = ?auto_723501 ?auto_723504 ) ) ( not ( = ?auto_723501 ?auto_723505 ) ) ( not ( = ?auto_723501 ?auto_723506 ) ) ( not ( = ?auto_723501 ?auto_723507 ) ) ( not ( = ?auto_723501 ?auto_723508 ) ) ( not ( = ?auto_723501 ?auto_723509 ) ) ( not ( = ?auto_723501 ?auto_723510 ) ) ( not ( = ?auto_723502 ?auto_723503 ) ) ( not ( = ?auto_723502 ?auto_723504 ) ) ( not ( = ?auto_723502 ?auto_723505 ) ) ( not ( = ?auto_723502 ?auto_723506 ) ) ( not ( = ?auto_723502 ?auto_723507 ) ) ( not ( = ?auto_723502 ?auto_723508 ) ) ( not ( = ?auto_723502 ?auto_723509 ) ) ( not ( = ?auto_723502 ?auto_723510 ) ) ( not ( = ?auto_723503 ?auto_723504 ) ) ( not ( = ?auto_723503 ?auto_723505 ) ) ( not ( = ?auto_723503 ?auto_723506 ) ) ( not ( = ?auto_723503 ?auto_723507 ) ) ( not ( = ?auto_723503 ?auto_723508 ) ) ( not ( = ?auto_723503 ?auto_723509 ) ) ( not ( = ?auto_723503 ?auto_723510 ) ) ( not ( = ?auto_723504 ?auto_723505 ) ) ( not ( = ?auto_723504 ?auto_723506 ) ) ( not ( = ?auto_723504 ?auto_723507 ) ) ( not ( = ?auto_723504 ?auto_723508 ) ) ( not ( = ?auto_723504 ?auto_723509 ) ) ( not ( = ?auto_723504 ?auto_723510 ) ) ( not ( = ?auto_723505 ?auto_723506 ) ) ( not ( = ?auto_723505 ?auto_723507 ) ) ( not ( = ?auto_723505 ?auto_723508 ) ) ( not ( = ?auto_723505 ?auto_723509 ) ) ( not ( = ?auto_723505 ?auto_723510 ) ) ( not ( = ?auto_723506 ?auto_723507 ) ) ( not ( = ?auto_723506 ?auto_723508 ) ) ( not ( = ?auto_723506 ?auto_723509 ) ) ( not ( = ?auto_723506 ?auto_723510 ) ) ( not ( = ?auto_723507 ?auto_723508 ) ) ( not ( = ?auto_723507 ?auto_723509 ) ) ( not ( = ?auto_723507 ?auto_723510 ) ) ( not ( = ?auto_723508 ?auto_723509 ) ) ( not ( = ?auto_723508 ?auto_723510 ) ) ( not ( = ?auto_723509 ?auto_723510 ) ) ( ON ?auto_723508 ?auto_723509 ) ( ON ?auto_723507 ?auto_723508 ) ( ON ?auto_723506 ?auto_723507 ) ( ON ?auto_723505 ?auto_723506 ) ( ON ?auto_723504 ?auto_723505 ) ( ON ?auto_723503 ?auto_723504 ) ( ON ?auto_723502 ?auto_723503 ) ( ON ?auto_723501 ?auto_723502 ) ( ON ?auto_723500 ?auto_723501 ) ( ON ?auto_723499 ?auto_723500 ) ( ON ?auto_723498 ?auto_723499 ) ( ON ?auto_723497 ?auto_723498 ) ( ON ?auto_723496 ?auto_723497 ) ( ON ?auto_723495 ?auto_723496 ) ( ON ?auto_723494 ?auto_723495 ) ( CLEAR ?auto_723494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_723494 )
      ( MAKE-16PILE ?auto_723494 ?auto_723495 ?auto_723496 ?auto_723497 ?auto_723498 ?auto_723499 ?auto_723500 ?auto_723501 ?auto_723502 ?auto_723503 ?auto_723504 ?auto_723505 ?auto_723506 ?auto_723507 ?auto_723508 ?auto_723509 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723561 - BLOCK
      ?auto_723562 - BLOCK
      ?auto_723563 - BLOCK
      ?auto_723564 - BLOCK
      ?auto_723565 - BLOCK
      ?auto_723566 - BLOCK
      ?auto_723567 - BLOCK
      ?auto_723568 - BLOCK
      ?auto_723569 - BLOCK
      ?auto_723570 - BLOCK
      ?auto_723571 - BLOCK
      ?auto_723572 - BLOCK
      ?auto_723573 - BLOCK
      ?auto_723574 - BLOCK
      ?auto_723575 - BLOCK
      ?auto_723576 - BLOCK
      ?auto_723577 - BLOCK
    )
    :vars
    (
      ?auto_723578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_723576 ) ( ON ?auto_723577 ?auto_723578 ) ( CLEAR ?auto_723577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_723561 ) ( ON ?auto_723562 ?auto_723561 ) ( ON ?auto_723563 ?auto_723562 ) ( ON ?auto_723564 ?auto_723563 ) ( ON ?auto_723565 ?auto_723564 ) ( ON ?auto_723566 ?auto_723565 ) ( ON ?auto_723567 ?auto_723566 ) ( ON ?auto_723568 ?auto_723567 ) ( ON ?auto_723569 ?auto_723568 ) ( ON ?auto_723570 ?auto_723569 ) ( ON ?auto_723571 ?auto_723570 ) ( ON ?auto_723572 ?auto_723571 ) ( ON ?auto_723573 ?auto_723572 ) ( ON ?auto_723574 ?auto_723573 ) ( ON ?auto_723575 ?auto_723574 ) ( ON ?auto_723576 ?auto_723575 ) ( not ( = ?auto_723561 ?auto_723562 ) ) ( not ( = ?auto_723561 ?auto_723563 ) ) ( not ( = ?auto_723561 ?auto_723564 ) ) ( not ( = ?auto_723561 ?auto_723565 ) ) ( not ( = ?auto_723561 ?auto_723566 ) ) ( not ( = ?auto_723561 ?auto_723567 ) ) ( not ( = ?auto_723561 ?auto_723568 ) ) ( not ( = ?auto_723561 ?auto_723569 ) ) ( not ( = ?auto_723561 ?auto_723570 ) ) ( not ( = ?auto_723561 ?auto_723571 ) ) ( not ( = ?auto_723561 ?auto_723572 ) ) ( not ( = ?auto_723561 ?auto_723573 ) ) ( not ( = ?auto_723561 ?auto_723574 ) ) ( not ( = ?auto_723561 ?auto_723575 ) ) ( not ( = ?auto_723561 ?auto_723576 ) ) ( not ( = ?auto_723561 ?auto_723577 ) ) ( not ( = ?auto_723561 ?auto_723578 ) ) ( not ( = ?auto_723562 ?auto_723563 ) ) ( not ( = ?auto_723562 ?auto_723564 ) ) ( not ( = ?auto_723562 ?auto_723565 ) ) ( not ( = ?auto_723562 ?auto_723566 ) ) ( not ( = ?auto_723562 ?auto_723567 ) ) ( not ( = ?auto_723562 ?auto_723568 ) ) ( not ( = ?auto_723562 ?auto_723569 ) ) ( not ( = ?auto_723562 ?auto_723570 ) ) ( not ( = ?auto_723562 ?auto_723571 ) ) ( not ( = ?auto_723562 ?auto_723572 ) ) ( not ( = ?auto_723562 ?auto_723573 ) ) ( not ( = ?auto_723562 ?auto_723574 ) ) ( not ( = ?auto_723562 ?auto_723575 ) ) ( not ( = ?auto_723562 ?auto_723576 ) ) ( not ( = ?auto_723562 ?auto_723577 ) ) ( not ( = ?auto_723562 ?auto_723578 ) ) ( not ( = ?auto_723563 ?auto_723564 ) ) ( not ( = ?auto_723563 ?auto_723565 ) ) ( not ( = ?auto_723563 ?auto_723566 ) ) ( not ( = ?auto_723563 ?auto_723567 ) ) ( not ( = ?auto_723563 ?auto_723568 ) ) ( not ( = ?auto_723563 ?auto_723569 ) ) ( not ( = ?auto_723563 ?auto_723570 ) ) ( not ( = ?auto_723563 ?auto_723571 ) ) ( not ( = ?auto_723563 ?auto_723572 ) ) ( not ( = ?auto_723563 ?auto_723573 ) ) ( not ( = ?auto_723563 ?auto_723574 ) ) ( not ( = ?auto_723563 ?auto_723575 ) ) ( not ( = ?auto_723563 ?auto_723576 ) ) ( not ( = ?auto_723563 ?auto_723577 ) ) ( not ( = ?auto_723563 ?auto_723578 ) ) ( not ( = ?auto_723564 ?auto_723565 ) ) ( not ( = ?auto_723564 ?auto_723566 ) ) ( not ( = ?auto_723564 ?auto_723567 ) ) ( not ( = ?auto_723564 ?auto_723568 ) ) ( not ( = ?auto_723564 ?auto_723569 ) ) ( not ( = ?auto_723564 ?auto_723570 ) ) ( not ( = ?auto_723564 ?auto_723571 ) ) ( not ( = ?auto_723564 ?auto_723572 ) ) ( not ( = ?auto_723564 ?auto_723573 ) ) ( not ( = ?auto_723564 ?auto_723574 ) ) ( not ( = ?auto_723564 ?auto_723575 ) ) ( not ( = ?auto_723564 ?auto_723576 ) ) ( not ( = ?auto_723564 ?auto_723577 ) ) ( not ( = ?auto_723564 ?auto_723578 ) ) ( not ( = ?auto_723565 ?auto_723566 ) ) ( not ( = ?auto_723565 ?auto_723567 ) ) ( not ( = ?auto_723565 ?auto_723568 ) ) ( not ( = ?auto_723565 ?auto_723569 ) ) ( not ( = ?auto_723565 ?auto_723570 ) ) ( not ( = ?auto_723565 ?auto_723571 ) ) ( not ( = ?auto_723565 ?auto_723572 ) ) ( not ( = ?auto_723565 ?auto_723573 ) ) ( not ( = ?auto_723565 ?auto_723574 ) ) ( not ( = ?auto_723565 ?auto_723575 ) ) ( not ( = ?auto_723565 ?auto_723576 ) ) ( not ( = ?auto_723565 ?auto_723577 ) ) ( not ( = ?auto_723565 ?auto_723578 ) ) ( not ( = ?auto_723566 ?auto_723567 ) ) ( not ( = ?auto_723566 ?auto_723568 ) ) ( not ( = ?auto_723566 ?auto_723569 ) ) ( not ( = ?auto_723566 ?auto_723570 ) ) ( not ( = ?auto_723566 ?auto_723571 ) ) ( not ( = ?auto_723566 ?auto_723572 ) ) ( not ( = ?auto_723566 ?auto_723573 ) ) ( not ( = ?auto_723566 ?auto_723574 ) ) ( not ( = ?auto_723566 ?auto_723575 ) ) ( not ( = ?auto_723566 ?auto_723576 ) ) ( not ( = ?auto_723566 ?auto_723577 ) ) ( not ( = ?auto_723566 ?auto_723578 ) ) ( not ( = ?auto_723567 ?auto_723568 ) ) ( not ( = ?auto_723567 ?auto_723569 ) ) ( not ( = ?auto_723567 ?auto_723570 ) ) ( not ( = ?auto_723567 ?auto_723571 ) ) ( not ( = ?auto_723567 ?auto_723572 ) ) ( not ( = ?auto_723567 ?auto_723573 ) ) ( not ( = ?auto_723567 ?auto_723574 ) ) ( not ( = ?auto_723567 ?auto_723575 ) ) ( not ( = ?auto_723567 ?auto_723576 ) ) ( not ( = ?auto_723567 ?auto_723577 ) ) ( not ( = ?auto_723567 ?auto_723578 ) ) ( not ( = ?auto_723568 ?auto_723569 ) ) ( not ( = ?auto_723568 ?auto_723570 ) ) ( not ( = ?auto_723568 ?auto_723571 ) ) ( not ( = ?auto_723568 ?auto_723572 ) ) ( not ( = ?auto_723568 ?auto_723573 ) ) ( not ( = ?auto_723568 ?auto_723574 ) ) ( not ( = ?auto_723568 ?auto_723575 ) ) ( not ( = ?auto_723568 ?auto_723576 ) ) ( not ( = ?auto_723568 ?auto_723577 ) ) ( not ( = ?auto_723568 ?auto_723578 ) ) ( not ( = ?auto_723569 ?auto_723570 ) ) ( not ( = ?auto_723569 ?auto_723571 ) ) ( not ( = ?auto_723569 ?auto_723572 ) ) ( not ( = ?auto_723569 ?auto_723573 ) ) ( not ( = ?auto_723569 ?auto_723574 ) ) ( not ( = ?auto_723569 ?auto_723575 ) ) ( not ( = ?auto_723569 ?auto_723576 ) ) ( not ( = ?auto_723569 ?auto_723577 ) ) ( not ( = ?auto_723569 ?auto_723578 ) ) ( not ( = ?auto_723570 ?auto_723571 ) ) ( not ( = ?auto_723570 ?auto_723572 ) ) ( not ( = ?auto_723570 ?auto_723573 ) ) ( not ( = ?auto_723570 ?auto_723574 ) ) ( not ( = ?auto_723570 ?auto_723575 ) ) ( not ( = ?auto_723570 ?auto_723576 ) ) ( not ( = ?auto_723570 ?auto_723577 ) ) ( not ( = ?auto_723570 ?auto_723578 ) ) ( not ( = ?auto_723571 ?auto_723572 ) ) ( not ( = ?auto_723571 ?auto_723573 ) ) ( not ( = ?auto_723571 ?auto_723574 ) ) ( not ( = ?auto_723571 ?auto_723575 ) ) ( not ( = ?auto_723571 ?auto_723576 ) ) ( not ( = ?auto_723571 ?auto_723577 ) ) ( not ( = ?auto_723571 ?auto_723578 ) ) ( not ( = ?auto_723572 ?auto_723573 ) ) ( not ( = ?auto_723572 ?auto_723574 ) ) ( not ( = ?auto_723572 ?auto_723575 ) ) ( not ( = ?auto_723572 ?auto_723576 ) ) ( not ( = ?auto_723572 ?auto_723577 ) ) ( not ( = ?auto_723572 ?auto_723578 ) ) ( not ( = ?auto_723573 ?auto_723574 ) ) ( not ( = ?auto_723573 ?auto_723575 ) ) ( not ( = ?auto_723573 ?auto_723576 ) ) ( not ( = ?auto_723573 ?auto_723577 ) ) ( not ( = ?auto_723573 ?auto_723578 ) ) ( not ( = ?auto_723574 ?auto_723575 ) ) ( not ( = ?auto_723574 ?auto_723576 ) ) ( not ( = ?auto_723574 ?auto_723577 ) ) ( not ( = ?auto_723574 ?auto_723578 ) ) ( not ( = ?auto_723575 ?auto_723576 ) ) ( not ( = ?auto_723575 ?auto_723577 ) ) ( not ( = ?auto_723575 ?auto_723578 ) ) ( not ( = ?auto_723576 ?auto_723577 ) ) ( not ( = ?auto_723576 ?auto_723578 ) ) ( not ( = ?auto_723577 ?auto_723578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_723577 ?auto_723578 )
      ( !STACK ?auto_723577 ?auto_723576 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723596 - BLOCK
      ?auto_723597 - BLOCK
      ?auto_723598 - BLOCK
      ?auto_723599 - BLOCK
      ?auto_723600 - BLOCK
      ?auto_723601 - BLOCK
      ?auto_723602 - BLOCK
      ?auto_723603 - BLOCK
      ?auto_723604 - BLOCK
      ?auto_723605 - BLOCK
      ?auto_723606 - BLOCK
      ?auto_723607 - BLOCK
      ?auto_723608 - BLOCK
      ?auto_723609 - BLOCK
      ?auto_723610 - BLOCK
      ?auto_723611 - BLOCK
      ?auto_723612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_723611 ) ( ON-TABLE ?auto_723612 ) ( CLEAR ?auto_723612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_723596 ) ( ON ?auto_723597 ?auto_723596 ) ( ON ?auto_723598 ?auto_723597 ) ( ON ?auto_723599 ?auto_723598 ) ( ON ?auto_723600 ?auto_723599 ) ( ON ?auto_723601 ?auto_723600 ) ( ON ?auto_723602 ?auto_723601 ) ( ON ?auto_723603 ?auto_723602 ) ( ON ?auto_723604 ?auto_723603 ) ( ON ?auto_723605 ?auto_723604 ) ( ON ?auto_723606 ?auto_723605 ) ( ON ?auto_723607 ?auto_723606 ) ( ON ?auto_723608 ?auto_723607 ) ( ON ?auto_723609 ?auto_723608 ) ( ON ?auto_723610 ?auto_723609 ) ( ON ?auto_723611 ?auto_723610 ) ( not ( = ?auto_723596 ?auto_723597 ) ) ( not ( = ?auto_723596 ?auto_723598 ) ) ( not ( = ?auto_723596 ?auto_723599 ) ) ( not ( = ?auto_723596 ?auto_723600 ) ) ( not ( = ?auto_723596 ?auto_723601 ) ) ( not ( = ?auto_723596 ?auto_723602 ) ) ( not ( = ?auto_723596 ?auto_723603 ) ) ( not ( = ?auto_723596 ?auto_723604 ) ) ( not ( = ?auto_723596 ?auto_723605 ) ) ( not ( = ?auto_723596 ?auto_723606 ) ) ( not ( = ?auto_723596 ?auto_723607 ) ) ( not ( = ?auto_723596 ?auto_723608 ) ) ( not ( = ?auto_723596 ?auto_723609 ) ) ( not ( = ?auto_723596 ?auto_723610 ) ) ( not ( = ?auto_723596 ?auto_723611 ) ) ( not ( = ?auto_723596 ?auto_723612 ) ) ( not ( = ?auto_723597 ?auto_723598 ) ) ( not ( = ?auto_723597 ?auto_723599 ) ) ( not ( = ?auto_723597 ?auto_723600 ) ) ( not ( = ?auto_723597 ?auto_723601 ) ) ( not ( = ?auto_723597 ?auto_723602 ) ) ( not ( = ?auto_723597 ?auto_723603 ) ) ( not ( = ?auto_723597 ?auto_723604 ) ) ( not ( = ?auto_723597 ?auto_723605 ) ) ( not ( = ?auto_723597 ?auto_723606 ) ) ( not ( = ?auto_723597 ?auto_723607 ) ) ( not ( = ?auto_723597 ?auto_723608 ) ) ( not ( = ?auto_723597 ?auto_723609 ) ) ( not ( = ?auto_723597 ?auto_723610 ) ) ( not ( = ?auto_723597 ?auto_723611 ) ) ( not ( = ?auto_723597 ?auto_723612 ) ) ( not ( = ?auto_723598 ?auto_723599 ) ) ( not ( = ?auto_723598 ?auto_723600 ) ) ( not ( = ?auto_723598 ?auto_723601 ) ) ( not ( = ?auto_723598 ?auto_723602 ) ) ( not ( = ?auto_723598 ?auto_723603 ) ) ( not ( = ?auto_723598 ?auto_723604 ) ) ( not ( = ?auto_723598 ?auto_723605 ) ) ( not ( = ?auto_723598 ?auto_723606 ) ) ( not ( = ?auto_723598 ?auto_723607 ) ) ( not ( = ?auto_723598 ?auto_723608 ) ) ( not ( = ?auto_723598 ?auto_723609 ) ) ( not ( = ?auto_723598 ?auto_723610 ) ) ( not ( = ?auto_723598 ?auto_723611 ) ) ( not ( = ?auto_723598 ?auto_723612 ) ) ( not ( = ?auto_723599 ?auto_723600 ) ) ( not ( = ?auto_723599 ?auto_723601 ) ) ( not ( = ?auto_723599 ?auto_723602 ) ) ( not ( = ?auto_723599 ?auto_723603 ) ) ( not ( = ?auto_723599 ?auto_723604 ) ) ( not ( = ?auto_723599 ?auto_723605 ) ) ( not ( = ?auto_723599 ?auto_723606 ) ) ( not ( = ?auto_723599 ?auto_723607 ) ) ( not ( = ?auto_723599 ?auto_723608 ) ) ( not ( = ?auto_723599 ?auto_723609 ) ) ( not ( = ?auto_723599 ?auto_723610 ) ) ( not ( = ?auto_723599 ?auto_723611 ) ) ( not ( = ?auto_723599 ?auto_723612 ) ) ( not ( = ?auto_723600 ?auto_723601 ) ) ( not ( = ?auto_723600 ?auto_723602 ) ) ( not ( = ?auto_723600 ?auto_723603 ) ) ( not ( = ?auto_723600 ?auto_723604 ) ) ( not ( = ?auto_723600 ?auto_723605 ) ) ( not ( = ?auto_723600 ?auto_723606 ) ) ( not ( = ?auto_723600 ?auto_723607 ) ) ( not ( = ?auto_723600 ?auto_723608 ) ) ( not ( = ?auto_723600 ?auto_723609 ) ) ( not ( = ?auto_723600 ?auto_723610 ) ) ( not ( = ?auto_723600 ?auto_723611 ) ) ( not ( = ?auto_723600 ?auto_723612 ) ) ( not ( = ?auto_723601 ?auto_723602 ) ) ( not ( = ?auto_723601 ?auto_723603 ) ) ( not ( = ?auto_723601 ?auto_723604 ) ) ( not ( = ?auto_723601 ?auto_723605 ) ) ( not ( = ?auto_723601 ?auto_723606 ) ) ( not ( = ?auto_723601 ?auto_723607 ) ) ( not ( = ?auto_723601 ?auto_723608 ) ) ( not ( = ?auto_723601 ?auto_723609 ) ) ( not ( = ?auto_723601 ?auto_723610 ) ) ( not ( = ?auto_723601 ?auto_723611 ) ) ( not ( = ?auto_723601 ?auto_723612 ) ) ( not ( = ?auto_723602 ?auto_723603 ) ) ( not ( = ?auto_723602 ?auto_723604 ) ) ( not ( = ?auto_723602 ?auto_723605 ) ) ( not ( = ?auto_723602 ?auto_723606 ) ) ( not ( = ?auto_723602 ?auto_723607 ) ) ( not ( = ?auto_723602 ?auto_723608 ) ) ( not ( = ?auto_723602 ?auto_723609 ) ) ( not ( = ?auto_723602 ?auto_723610 ) ) ( not ( = ?auto_723602 ?auto_723611 ) ) ( not ( = ?auto_723602 ?auto_723612 ) ) ( not ( = ?auto_723603 ?auto_723604 ) ) ( not ( = ?auto_723603 ?auto_723605 ) ) ( not ( = ?auto_723603 ?auto_723606 ) ) ( not ( = ?auto_723603 ?auto_723607 ) ) ( not ( = ?auto_723603 ?auto_723608 ) ) ( not ( = ?auto_723603 ?auto_723609 ) ) ( not ( = ?auto_723603 ?auto_723610 ) ) ( not ( = ?auto_723603 ?auto_723611 ) ) ( not ( = ?auto_723603 ?auto_723612 ) ) ( not ( = ?auto_723604 ?auto_723605 ) ) ( not ( = ?auto_723604 ?auto_723606 ) ) ( not ( = ?auto_723604 ?auto_723607 ) ) ( not ( = ?auto_723604 ?auto_723608 ) ) ( not ( = ?auto_723604 ?auto_723609 ) ) ( not ( = ?auto_723604 ?auto_723610 ) ) ( not ( = ?auto_723604 ?auto_723611 ) ) ( not ( = ?auto_723604 ?auto_723612 ) ) ( not ( = ?auto_723605 ?auto_723606 ) ) ( not ( = ?auto_723605 ?auto_723607 ) ) ( not ( = ?auto_723605 ?auto_723608 ) ) ( not ( = ?auto_723605 ?auto_723609 ) ) ( not ( = ?auto_723605 ?auto_723610 ) ) ( not ( = ?auto_723605 ?auto_723611 ) ) ( not ( = ?auto_723605 ?auto_723612 ) ) ( not ( = ?auto_723606 ?auto_723607 ) ) ( not ( = ?auto_723606 ?auto_723608 ) ) ( not ( = ?auto_723606 ?auto_723609 ) ) ( not ( = ?auto_723606 ?auto_723610 ) ) ( not ( = ?auto_723606 ?auto_723611 ) ) ( not ( = ?auto_723606 ?auto_723612 ) ) ( not ( = ?auto_723607 ?auto_723608 ) ) ( not ( = ?auto_723607 ?auto_723609 ) ) ( not ( = ?auto_723607 ?auto_723610 ) ) ( not ( = ?auto_723607 ?auto_723611 ) ) ( not ( = ?auto_723607 ?auto_723612 ) ) ( not ( = ?auto_723608 ?auto_723609 ) ) ( not ( = ?auto_723608 ?auto_723610 ) ) ( not ( = ?auto_723608 ?auto_723611 ) ) ( not ( = ?auto_723608 ?auto_723612 ) ) ( not ( = ?auto_723609 ?auto_723610 ) ) ( not ( = ?auto_723609 ?auto_723611 ) ) ( not ( = ?auto_723609 ?auto_723612 ) ) ( not ( = ?auto_723610 ?auto_723611 ) ) ( not ( = ?auto_723610 ?auto_723612 ) ) ( not ( = ?auto_723611 ?auto_723612 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_723612 )
      ( !STACK ?auto_723612 ?auto_723611 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723630 - BLOCK
      ?auto_723631 - BLOCK
      ?auto_723632 - BLOCK
      ?auto_723633 - BLOCK
      ?auto_723634 - BLOCK
      ?auto_723635 - BLOCK
      ?auto_723636 - BLOCK
      ?auto_723637 - BLOCK
      ?auto_723638 - BLOCK
      ?auto_723639 - BLOCK
      ?auto_723640 - BLOCK
      ?auto_723641 - BLOCK
      ?auto_723642 - BLOCK
      ?auto_723643 - BLOCK
      ?auto_723644 - BLOCK
      ?auto_723645 - BLOCK
      ?auto_723646 - BLOCK
    )
    :vars
    (
      ?auto_723647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723646 ?auto_723647 ) ( ON-TABLE ?auto_723630 ) ( ON ?auto_723631 ?auto_723630 ) ( ON ?auto_723632 ?auto_723631 ) ( ON ?auto_723633 ?auto_723632 ) ( ON ?auto_723634 ?auto_723633 ) ( ON ?auto_723635 ?auto_723634 ) ( ON ?auto_723636 ?auto_723635 ) ( ON ?auto_723637 ?auto_723636 ) ( ON ?auto_723638 ?auto_723637 ) ( ON ?auto_723639 ?auto_723638 ) ( ON ?auto_723640 ?auto_723639 ) ( ON ?auto_723641 ?auto_723640 ) ( ON ?auto_723642 ?auto_723641 ) ( ON ?auto_723643 ?auto_723642 ) ( ON ?auto_723644 ?auto_723643 ) ( not ( = ?auto_723630 ?auto_723631 ) ) ( not ( = ?auto_723630 ?auto_723632 ) ) ( not ( = ?auto_723630 ?auto_723633 ) ) ( not ( = ?auto_723630 ?auto_723634 ) ) ( not ( = ?auto_723630 ?auto_723635 ) ) ( not ( = ?auto_723630 ?auto_723636 ) ) ( not ( = ?auto_723630 ?auto_723637 ) ) ( not ( = ?auto_723630 ?auto_723638 ) ) ( not ( = ?auto_723630 ?auto_723639 ) ) ( not ( = ?auto_723630 ?auto_723640 ) ) ( not ( = ?auto_723630 ?auto_723641 ) ) ( not ( = ?auto_723630 ?auto_723642 ) ) ( not ( = ?auto_723630 ?auto_723643 ) ) ( not ( = ?auto_723630 ?auto_723644 ) ) ( not ( = ?auto_723630 ?auto_723645 ) ) ( not ( = ?auto_723630 ?auto_723646 ) ) ( not ( = ?auto_723630 ?auto_723647 ) ) ( not ( = ?auto_723631 ?auto_723632 ) ) ( not ( = ?auto_723631 ?auto_723633 ) ) ( not ( = ?auto_723631 ?auto_723634 ) ) ( not ( = ?auto_723631 ?auto_723635 ) ) ( not ( = ?auto_723631 ?auto_723636 ) ) ( not ( = ?auto_723631 ?auto_723637 ) ) ( not ( = ?auto_723631 ?auto_723638 ) ) ( not ( = ?auto_723631 ?auto_723639 ) ) ( not ( = ?auto_723631 ?auto_723640 ) ) ( not ( = ?auto_723631 ?auto_723641 ) ) ( not ( = ?auto_723631 ?auto_723642 ) ) ( not ( = ?auto_723631 ?auto_723643 ) ) ( not ( = ?auto_723631 ?auto_723644 ) ) ( not ( = ?auto_723631 ?auto_723645 ) ) ( not ( = ?auto_723631 ?auto_723646 ) ) ( not ( = ?auto_723631 ?auto_723647 ) ) ( not ( = ?auto_723632 ?auto_723633 ) ) ( not ( = ?auto_723632 ?auto_723634 ) ) ( not ( = ?auto_723632 ?auto_723635 ) ) ( not ( = ?auto_723632 ?auto_723636 ) ) ( not ( = ?auto_723632 ?auto_723637 ) ) ( not ( = ?auto_723632 ?auto_723638 ) ) ( not ( = ?auto_723632 ?auto_723639 ) ) ( not ( = ?auto_723632 ?auto_723640 ) ) ( not ( = ?auto_723632 ?auto_723641 ) ) ( not ( = ?auto_723632 ?auto_723642 ) ) ( not ( = ?auto_723632 ?auto_723643 ) ) ( not ( = ?auto_723632 ?auto_723644 ) ) ( not ( = ?auto_723632 ?auto_723645 ) ) ( not ( = ?auto_723632 ?auto_723646 ) ) ( not ( = ?auto_723632 ?auto_723647 ) ) ( not ( = ?auto_723633 ?auto_723634 ) ) ( not ( = ?auto_723633 ?auto_723635 ) ) ( not ( = ?auto_723633 ?auto_723636 ) ) ( not ( = ?auto_723633 ?auto_723637 ) ) ( not ( = ?auto_723633 ?auto_723638 ) ) ( not ( = ?auto_723633 ?auto_723639 ) ) ( not ( = ?auto_723633 ?auto_723640 ) ) ( not ( = ?auto_723633 ?auto_723641 ) ) ( not ( = ?auto_723633 ?auto_723642 ) ) ( not ( = ?auto_723633 ?auto_723643 ) ) ( not ( = ?auto_723633 ?auto_723644 ) ) ( not ( = ?auto_723633 ?auto_723645 ) ) ( not ( = ?auto_723633 ?auto_723646 ) ) ( not ( = ?auto_723633 ?auto_723647 ) ) ( not ( = ?auto_723634 ?auto_723635 ) ) ( not ( = ?auto_723634 ?auto_723636 ) ) ( not ( = ?auto_723634 ?auto_723637 ) ) ( not ( = ?auto_723634 ?auto_723638 ) ) ( not ( = ?auto_723634 ?auto_723639 ) ) ( not ( = ?auto_723634 ?auto_723640 ) ) ( not ( = ?auto_723634 ?auto_723641 ) ) ( not ( = ?auto_723634 ?auto_723642 ) ) ( not ( = ?auto_723634 ?auto_723643 ) ) ( not ( = ?auto_723634 ?auto_723644 ) ) ( not ( = ?auto_723634 ?auto_723645 ) ) ( not ( = ?auto_723634 ?auto_723646 ) ) ( not ( = ?auto_723634 ?auto_723647 ) ) ( not ( = ?auto_723635 ?auto_723636 ) ) ( not ( = ?auto_723635 ?auto_723637 ) ) ( not ( = ?auto_723635 ?auto_723638 ) ) ( not ( = ?auto_723635 ?auto_723639 ) ) ( not ( = ?auto_723635 ?auto_723640 ) ) ( not ( = ?auto_723635 ?auto_723641 ) ) ( not ( = ?auto_723635 ?auto_723642 ) ) ( not ( = ?auto_723635 ?auto_723643 ) ) ( not ( = ?auto_723635 ?auto_723644 ) ) ( not ( = ?auto_723635 ?auto_723645 ) ) ( not ( = ?auto_723635 ?auto_723646 ) ) ( not ( = ?auto_723635 ?auto_723647 ) ) ( not ( = ?auto_723636 ?auto_723637 ) ) ( not ( = ?auto_723636 ?auto_723638 ) ) ( not ( = ?auto_723636 ?auto_723639 ) ) ( not ( = ?auto_723636 ?auto_723640 ) ) ( not ( = ?auto_723636 ?auto_723641 ) ) ( not ( = ?auto_723636 ?auto_723642 ) ) ( not ( = ?auto_723636 ?auto_723643 ) ) ( not ( = ?auto_723636 ?auto_723644 ) ) ( not ( = ?auto_723636 ?auto_723645 ) ) ( not ( = ?auto_723636 ?auto_723646 ) ) ( not ( = ?auto_723636 ?auto_723647 ) ) ( not ( = ?auto_723637 ?auto_723638 ) ) ( not ( = ?auto_723637 ?auto_723639 ) ) ( not ( = ?auto_723637 ?auto_723640 ) ) ( not ( = ?auto_723637 ?auto_723641 ) ) ( not ( = ?auto_723637 ?auto_723642 ) ) ( not ( = ?auto_723637 ?auto_723643 ) ) ( not ( = ?auto_723637 ?auto_723644 ) ) ( not ( = ?auto_723637 ?auto_723645 ) ) ( not ( = ?auto_723637 ?auto_723646 ) ) ( not ( = ?auto_723637 ?auto_723647 ) ) ( not ( = ?auto_723638 ?auto_723639 ) ) ( not ( = ?auto_723638 ?auto_723640 ) ) ( not ( = ?auto_723638 ?auto_723641 ) ) ( not ( = ?auto_723638 ?auto_723642 ) ) ( not ( = ?auto_723638 ?auto_723643 ) ) ( not ( = ?auto_723638 ?auto_723644 ) ) ( not ( = ?auto_723638 ?auto_723645 ) ) ( not ( = ?auto_723638 ?auto_723646 ) ) ( not ( = ?auto_723638 ?auto_723647 ) ) ( not ( = ?auto_723639 ?auto_723640 ) ) ( not ( = ?auto_723639 ?auto_723641 ) ) ( not ( = ?auto_723639 ?auto_723642 ) ) ( not ( = ?auto_723639 ?auto_723643 ) ) ( not ( = ?auto_723639 ?auto_723644 ) ) ( not ( = ?auto_723639 ?auto_723645 ) ) ( not ( = ?auto_723639 ?auto_723646 ) ) ( not ( = ?auto_723639 ?auto_723647 ) ) ( not ( = ?auto_723640 ?auto_723641 ) ) ( not ( = ?auto_723640 ?auto_723642 ) ) ( not ( = ?auto_723640 ?auto_723643 ) ) ( not ( = ?auto_723640 ?auto_723644 ) ) ( not ( = ?auto_723640 ?auto_723645 ) ) ( not ( = ?auto_723640 ?auto_723646 ) ) ( not ( = ?auto_723640 ?auto_723647 ) ) ( not ( = ?auto_723641 ?auto_723642 ) ) ( not ( = ?auto_723641 ?auto_723643 ) ) ( not ( = ?auto_723641 ?auto_723644 ) ) ( not ( = ?auto_723641 ?auto_723645 ) ) ( not ( = ?auto_723641 ?auto_723646 ) ) ( not ( = ?auto_723641 ?auto_723647 ) ) ( not ( = ?auto_723642 ?auto_723643 ) ) ( not ( = ?auto_723642 ?auto_723644 ) ) ( not ( = ?auto_723642 ?auto_723645 ) ) ( not ( = ?auto_723642 ?auto_723646 ) ) ( not ( = ?auto_723642 ?auto_723647 ) ) ( not ( = ?auto_723643 ?auto_723644 ) ) ( not ( = ?auto_723643 ?auto_723645 ) ) ( not ( = ?auto_723643 ?auto_723646 ) ) ( not ( = ?auto_723643 ?auto_723647 ) ) ( not ( = ?auto_723644 ?auto_723645 ) ) ( not ( = ?auto_723644 ?auto_723646 ) ) ( not ( = ?auto_723644 ?auto_723647 ) ) ( not ( = ?auto_723645 ?auto_723646 ) ) ( not ( = ?auto_723645 ?auto_723647 ) ) ( not ( = ?auto_723646 ?auto_723647 ) ) ( CLEAR ?auto_723644 ) ( ON ?auto_723645 ?auto_723646 ) ( CLEAR ?auto_723645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_723630 ?auto_723631 ?auto_723632 ?auto_723633 ?auto_723634 ?auto_723635 ?auto_723636 ?auto_723637 ?auto_723638 ?auto_723639 ?auto_723640 ?auto_723641 ?auto_723642 ?auto_723643 ?auto_723644 ?auto_723645 )
      ( MAKE-17PILE ?auto_723630 ?auto_723631 ?auto_723632 ?auto_723633 ?auto_723634 ?auto_723635 ?auto_723636 ?auto_723637 ?auto_723638 ?auto_723639 ?auto_723640 ?auto_723641 ?auto_723642 ?auto_723643 ?auto_723644 ?auto_723645 ?auto_723646 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723665 - BLOCK
      ?auto_723666 - BLOCK
      ?auto_723667 - BLOCK
      ?auto_723668 - BLOCK
      ?auto_723669 - BLOCK
      ?auto_723670 - BLOCK
      ?auto_723671 - BLOCK
      ?auto_723672 - BLOCK
      ?auto_723673 - BLOCK
      ?auto_723674 - BLOCK
      ?auto_723675 - BLOCK
      ?auto_723676 - BLOCK
      ?auto_723677 - BLOCK
      ?auto_723678 - BLOCK
      ?auto_723679 - BLOCK
      ?auto_723680 - BLOCK
      ?auto_723681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_723681 ) ( ON-TABLE ?auto_723665 ) ( ON ?auto_723666 ?auto_723665 ) ( ON ?auto_723667 ?auto_723666 ) ( ON ?auto_723668 ?auto_723667 ) ( ON ?auto_723669 ?auto_723668 ) ( ON ?auto_723670 ?auto_723669 ) ( ON ?auto_723671 ?auto_723670 ) ( ON ?auto_723672 ?auto_723671 ) ( ON ?auto_723673 ?auto_723672 ) ( ON ?auto_723674 ?auto_723673 ) ( ON ?auto_723675 ?auto_723674 ) ( ON ?auto_723676 ?auto_723675 ) ( ON ?auto_723677 ?auto_723676 ) ( ON ?auto_723678 ?auto_723677 ) ( ON ?auto_723679 ?auto_723678 ) ( not ( = ?auto_723665 ?auto_723666 ) ) ( not ( = ?auto_723665 ?auto_723667 ) ) ( not ( = ?auto_723665 ?auto_723668 ) ) ( not ( = ?auto_723665 ?auto_723669 ) ) ( not ( = ?auto_723665 ?auto_723670 ) ) ( not ( = ?auto_723665 ?auto_723671 ) ) ( not ( = ?auto_723665 ?auto_723672 ) ) ( not ( = ?auto_723665 ?auto_723673 ) ) ( not ( = ?auto_723665 ?auto_723674 ) ) ( not ( = ?auto_723665 ?auto_723675 ) ) ( not ( = ?auto_723665 ?auto_723676 ) ) ( not ( = ?auto_723665 ?auto_723677 ) ) ( not ( = ?auto_723665 ?auto_723678 ) ) ( not ( = ?auto_723665 ?auto_723679 ) ) ( not ( = ?auto_723665 ?auto_723680 ) ) ( not ( = ?auto_723665 ?auto_723681 ) ) ( not ( = ?auto_723666 ?auto_723667 ) ) ( not ( = ?auto_723666 ?auto_723668 ) ) ( not ( = ?auto_723666 ?auto_723669 ) ) ( not ( = ?auto_723666 ?auto_723670 ) ) ( not ( = ?auto_723666 ?auto_723671 ) ) ( not ( = ?auto_723666 ?auto_723672 ) ) ( not ( = ?auto_723666 ?auto_723673 ) ) ( not ( = ?auto_723666 ?auto_723674 ) ) ( not ( = ?auto_723666 ?auto_723675 ) ) ( not ( = ?auto_723666 ?auto_723676 ) ) ( not ( = ?auto_723666 ?auto_723677 ) ) ( not ( = ?auto_723666 ?auto_723678 ) ) ( not ( = ?auto_723666 ?auto_723679 ) ) ( not ( = ?auto_723666 ?auto_723680 ) ) ( not ( = ?auto_723666 ?auto_723681 ) ) ( not ( = ?auto_723667 ?auto_723668 ) ) ( not ( = ?auto_723667 ?auto_723669 ) ) ( not ( = ?auto_723667 ?auto_723670 ) ) ( not ( = ?auto_723667 ?auto_723671 ) ) ( not ( = ?auto_723667 ?auto_723672 ) ) ( not ( = ?auto_723667 ?auto_723673 ) ) ( not ( = ?auto_723667 ?auto_723674 ) ) ( not ( = ?auto_723667 ?auto_723675 ) ) ( not ( = ?auto_723667 ?auto_723676 ) ) ( not ( = ?auto_723667 ?auto_723677 ) ) ( not ( = ?auto_723667 ?auto_723678 ) ) ( not ( = ?auto_723667 ?auto_723679 ) ) ( not ( = ?auto_723667 ?auto_723680 ) ) ( not ( = ?auto_723667 ?auto_723681 ) ) ( not ( = ?auto_723668 ?auto_723669 ) ) ( not ( = ?auto_723668 ?auto_723670 ) ) ( not ( = ?auto_723668 ?auto_723671 ) ) ( not ( = ?auto_723668 ?auto_723672 ) ) ( not ( = ?auto_723668 ?auto_723673 ) ) ( not ( = ?auto_723668 ?auto_723674 ) ) ( not ( = ?auto_723668 ?auto_723675 ) ) ( not ( = ?auto_723668 ?auto_723676 ) ) ( not ( = ?auto_723668 ?auto_723677 ) ) ( not ( = ?auto_723668 ?auto_723678 ) ) ( not ( = ?auto_723668 ?auto_723679 ) ) ( not ( = ?auto_723668 ?auto_723680 ) ) ( not ( = ?auto_723668 ?auto_723681 ) ) ( not ( = ?auto_723669 ?auto_723670 ) ) ( not ( = ?auto_723669 ?auto_723671 ) ) ( not ( = ?auto_723669 ?auto_723672 ) ) ( not ( = ?auto_723669 ?auto_723673 ) ) ( not ( = ?auto_723669 ?auto_723674 ) ) ( not ( = ?auto_723669 ?auto_723675 ) ) ( not ( = ?auto_723669 ?auto_723676 ) ) ( not ( = ?auto_723669 ?auto_723677 ) ) ( not ( = ?auto_723669 ?auto_723678 ) ) ( not ( = ?auto_723669 ?auto_723679 ) ) ( not ( = ?auto_723669 ?auto_723680 ) ) ( not ( = ?auto_723669 ?auto_723681 ) ) ( not ( = ?auto_723670 ?auto_723671 ) ) ( not ( = ?auto_723670 ?auto_723672 ) ) ( not ( = ?auto_723670 ?auto_723673 ) ) ( not ( = ?auto_723670 ?auto_723674 ) ) ( not ( = ?auto_723670 ?auto_723675 ) ) ( not ( = ?auto_723670 ?auto_723676 ) ) ( not ( = ?auto_723670 ?auto_723677 ) ) ( not ( = ?auto_723670 ?auto_723678 ) ) ( not ( = ?auto_723670 ?auto_723679 ) ) ( not ( = ?auto_723670 ?auto_723680 ) ) ( not ( = ?auto_723670 ?auto_723681 ) ) ( not ( = ?auto_723671 ?auto_723672 ) ) ( not ( = ?auto_723671 ?auto_723673 ) ) ( not ( = ?auto_723671 ?auto_723674 ) ) ( not ( = ?auto_723671 ?auto_723675 ) ) ( not ( = ?auto_723671 ?auto_723676 ) ) ( not ( = ?auto_723671 ?auto_723677 ) ) ( not ( = ?auto_723671 ?auto_723678 ) ) ( not ( = ?auto_723671 ?auto_723679 ) ) ( not ( = ?auto_723671 ?auto_723680 ) ) ( not ( = ?auto_723671 ?auto_723681 ) ) ( not ( = ?auto_723672 ?auto_723673 ) ) ( not ( = ?auto_723672 ?auto_723674 ) ) ( not ( = ?auto_723672 ?auto_723675 ) ) ( not ( = ?auto_723672 ?auto_723676 ) ) ( not ( = ?auto_723672 ?auto_723677 ) ) ( not ( = ?auto_723672 ?auto_723678 ) ) ( not ( = ?auto_723672 ?auto_723679 ) ) ( not ( = ?auto_723672 ?auto_723680 ) ) ( not ( = ?auto_723672 ?auto_723681 ) ) ( not ( = ?auto_723673 ?auto_723674 ) ) ( not ( = ?auto_723673 ?auto_723675 ) ) ( not ( = ?auto_723673 ?auto_723676 ) ) ( not ( = ?auto_723673 ?auto_723677 ) ) ( not ( = ?auto_723673 ?auto_723678 ) ) ( not ( = ?auto_723673 ?auto_723679 ) ) ( not ( = ?auto_723673 ?auto_723680 ) ) ( not ( = ?auto_723673 ?auto_723681 ) ) ( not ( = ?auto_723674 ?auto_723675 ) ) ( not ( = ?auto_723674 ?auto_723676 ) ) ( not ( = ?auto_723674 ?auto_723677 ) ) ( not ( = ?auto_723674 ?auto_723678 ) ) ( not ( = ?auto_723674 ?auto_723679 ) ) ( not ( = ?auto_723674 ?auto_723680 ) ) ( not ( = ?auto_723674 ?auto_723681 ) ) ( not ( = ?auto_723675 ?auto_723676 ) ) ( not ( = ?auto_723675 ?auto_723677 ) ) ( not ( = ?auto_723675 ?auto_723678 ) ) ( not ( = ?auto_723675 ?auto_723679 ) ) ( not ( = ?auto_723675 ?auto_723680 ) ) ( not ( = ?auto_723675 ?auto_723681 ) ) ( not ( = ?auto_723676 ?auto_723677 ) ) ( not ( = ?auto_723676 ?auto_723678 ) ) ( not ( = ?auto_723676 ?auto_723679 ) ) ( not ( = ?auto_723676 ?auto_723680 ) ) ( not ( = ?auto_723676 ?auto_723681 ) ) ( not ( = ?auto_723677 ?auto_723678 ) ) ( not ( = ?auto_723677 ?auto_723679 ) ) ( not ( = ?auto_723677 ?auto_723680 ) ) ( not ( = ?auto_723677 ?auto_723681 ) ) ( not ( = ?auto_723678 ?auto_723679 ) ) ( not ( = ?auto_723678 ?auto_723680 ) ) ( not ( = ?auto_723678 ?auto_723681 ) ) ( not ( = ?auto_723679 ?auto_723680 ) ) ( not ( = ?auto_723679 ?auto_723681 ) ) ( not ( = ?auto_723680 ?auto_723681 ) ) ( CLEAR ?auto_723679 ) ( ON ?auto_723680 ?auto_723681 ) ( CLEAR ?auto_723680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_723665 ?auto_723666 ?auto_723667 ?auto_723668 ?auto_723669 ?auto_723670 ?auto_723671 ?auto_723672 ?auto_723673 ?auto_723674 ?auto_723675 ?auto_723676 ?auto_723677 ?auto_723678 ?auto_723679 ?auto_723680 )
      ( MAKE-17PILE ?auto_723665 ?auto_723666 ?auto_723667 ?auto_723668 ?auto_723669 ?auto_723670 ?auto_723671 ?auto_723672 ?auto_723673 ?auto_723674 ?auto_723675 ?auto_723676 ?auto_723677 ?auto_723678 ?auto_723679 ?auto_723680 ?auto_723681 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723699 - BLOCK
      ?auto_723700 - BLOCK
      ?auto_723701 - BLOCK
      ?auto_723702 - BLOCK
      ?auto_723703 - BLOCK
      ?auto_723704 - BLOCK
      ?auto_723705 - BLOCK
      ?auto_723706 - BLOCK
      ?auto_723707 - BLOCK
      ?auto_723708 - BLOCK
      ?auto_723709 - BLOCK
      ?auto_723710 - BLOCK
      ?auto_723711 - BLOCK
      ?auto_723712 - BLOCK
      ?auto_723713 - BLOCK
      ?auto_723714 - BLOCK
      ?auto_723715 - BLOCK
    )
    :vars
    (
      ?auto_723716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723715 ?auto_723716 ) ( ON-TABLE ?auto_723699 ) ( ON ?auto_723700 ?auto_723699 ) ( ON ?auto_723701 ?auto_723700 ) ( ON ?auto_723702 ?auto_723701 ) ( ON ?auto_723703 ?auto_723702 ) ( ON ?auto_723704 ?auto_723703 ) ( ON ?auto_723705 ?auto_723704 ) ( ON ?auto_723706 ?auto_723705 ) ( ON ?auto_723707 ?auto_723706 ) ( ON ?auto_723708 ?auto_723707 ) ( ON ?auto_723709 ?auto_723708 ) ( ON ?auto_723710 ?auto_723709 ) ( ON ?auto_723711 ?auto_723710 ) ( ON ?auto_723712 ?auto_723711 ) ( not ( = ?auto_723699 ?auto_723700 ) ) ( not ( = ?auto_723699 ?auto_723701 ) ) ( not ( = ?auto_723699 ?auto_723702 ) ) ( not ( = ?auto_723699 ?auto_723703 ) ) ( not ( = ?auto_723699 ?auto_723704 ) ) ( not ( = ?auto_723699 ?auto_723705 ) ) ( not ( = ?auto_723699 ?auto_723706 ) ) ( not ( = ?auto_723699 ?auto_723707 ) ) ( not ( = ?auto_723699 ?auto_723708 ) ) ( not ( = ?auto_723699 ?auto_723709 ) ) ( not ( = ?auto_723699 ?auto_723710 ) ) ( not ( = ?auto_723699 ?auto_723711 ) ) ( not ( = ?auto_723699 ?auto_723712 ) ) ( not ( = ?auto_723699 ?auto_723713 ) ) ( not ( = ?auto_723699 ?auto_723714 ) ) ( not ( = ?auto_723699 ?auto_723715 ) ) ( not ( = ?auto_723699 ?auto_723716 ) ) ( not ( = ?auto_723700 ?auto_723701 ) ) ( not ( = ?auto_723700 ?auto_723702 ) ) ( not ( = ?auto_723700 ?auto_723703 ) ) ( not ( = ?auto_723700 ?auto_723704 ) ) ( not ( = ?auto_723700 ?auto_723705 ) ) ( not ( = ?auto_723700 ?auto_723706 ) ) ( not ( = ?auto_723700 ?auto_723707 ) ) ( not ( = ?auto_723700 ?auto_723708 ) ) ( not ( = ?auto_723700 ?auto_723709 ) ) ( not ( = ?auto_723700 ?auto_723710 ) ) ( not ( = ?auto_723700 ?auto_723711 ) ) ( not ( = ?auto_723700 ?auto_723712 ) ) ( not ( = ?auto_723700 ?auto_723713 ) ) ( not ( = ?auto_723700 ?auto_723714 ) ) ( not ( = ?auto_723700 ?auto_723715 ) ) ( not ( = ?auto_723700 ?auto_723716 ) ) ( not ( = ?auto_723701 ?auto_723702 ) ) ( not ( = ?auto_723701 ?auto_723703 ) ) ( not ( = ?auto_723701 ?auto_723704 ) ) ( not ( = ?auto_723701 ?auto_723705 ) ) ( not ( = ?auto_723701 ?auto_723706 ) ) ( not ( = ?auto_723701 ?auto_723707 ) ) ( not ( = ?auto_723701 ?auto_723708 ) ) ( not ( = ?auto_723701 ?auto_723709 ) ) ( not ( = ?auto_723701 ?auto_723710 ) ) ( not ( = ?auto_723701 ?auto_723711 ) ) ( not ( = ?auto_723701 ?auto_723712 ) ) ( not ( = ?auto_723701 ?auto_723713 ) ) ( not ( = ?auto_723701 ?auto_723714 ) ) ( not ( = ?auto_723701 ?auto_723715 ) ) ( not ( = ?auto_723701 ?auto_723716 ) ) ( not ( = ?auto_723702 ?auto_723703 ) ) ( not ( = ?auto_723702 ?auto_723704 ) ) ( not ( = ?auto_723702 ?auto_723705 ) ) ( not ( = ?auto_723702 ?auto_723706 ) ) ( not ( = ?auto_723702 ?auto_723707 ) ) ( not ( = ?auto_723702 ?auto_723708 ) ) ( not ( = ?auto_723702 ?auto_723709 ) ) ( not ( = ?auto_723702 ?auto_723710 ) ) ( not ( = ?auto_723702 ?auto_723711 ) ) ( not ( = ?auto_723702 ?auto_723712 ) ) ( not ( = ?auto_723702 ?auto_723713 ) ) ( not ( = ?auto_723702 ?auto_723714 ) ) ( not ( = ?auto_723702 ?auto_723715 ) ) ( not ( = ?auto_723702 ?auto_723716 ) ) ( not ( = ?auto_723703 ?auto_723704 ) ) ( not ( = ?auto_723703 ?auto_723705 ) ) ( not ( = ?auto_723703 ?auto_723706 ) ) ( not ( = ?auto_723703 ?auto_723707 ) ) ( not ( = ?auto_723703 ?auto_723708 ) ) ( not ( = ?auto_723703 ?auto_723709 ) ) ( not ( = ?auto_723703 ?auto_723710 ) ) ( not ( = ?auto_723703 ?auto_723711 ) ) ( not ( = ?auto_723703 ?auto_723712 ) ) ( not ( = ?auto_723703 ?auto_723713 ) ) ( not ( = ?auto_723703 ?auto_723714 ) ) ( not ( = ?auto_723703 ?auto_723715 ) ) ( not ( = ?auto_723703 ?auto_723716 ) ) ( not ( = ?auto_723704 ?auto_723705 ) ) ( not ( = ?auto_723704 ?auto_723706 ) ) ( not ( = ?auto_723704 ?auto_723707 ) ) ( not ( = ?auto_723704 ?auto_723708 ) ) ( not ( = ?auto_723704 ?auto_723709 ) ) ( not ( = ?auto_723704 ?auto_723710 ) ) ( not ( = ?auto_723704 ?auto_723711 ) ) ( not ( = ?auto_723704 ?auto_723712 ) ) ( not ( = ?auto_723704 ?auto_723713 ) ) ( not ( = ?auto_723704 ?auto_723714 ) ) ( not ( = ?auto_723704 ?auto_723715 ) ) ( not ( = ?auto_723704 ?auto_723716 ) ) ( not ( = ?auto_723705 ?auto_723706 ) ) ( not ( = ?auto_723705 ?auto_723707 ) ) ( not ( = ?auto_723705 ?auto_723708 ) ) ( not ( = ?auto_723705 ?auto_723709 ) ) ( not ( = ?auto_723705 ?auto_723710 ) ) ( not ( = ?auto_723705 ?auto_723711 ) ) ( not ( = ?auto_723705 ?auto_723712 ) ) ( not ( = ?auto_723705 ?auto_723713 ) ) ( not ( = ?auto_723705 ?auto_723714 ) ) ( not ( = ?auto_723705 ?auto_723715 ) ) ( not ( = ?auto_723705 ?auto_723716 ) ) ( not ( = ?auto_723706 ?auto_723707 ) ) ( not ( = ?auto_723706 ?auto_723708 ) ) ( not ( = ?auto_723706 ?auto_723709 ) ) ( not ( = ?auto_723706 ?auto_723710 ) ) ( not ( = ?auto_723706 ?auto_723711 ) ) ( not ( = ?auto_723706 ?auto_723712 ) ) ( not ( = ?auto_723706 ?auto_723713 ) ) ( not ( = ?auto_723706 ?auto_723714 ) ) ( not ( = ?auto_723706 ?auto_723715 ) ) ( not ( = ?auto_723706 ?auto_723716 ) ) ( not ( = ?auto_723707 ?auto_723708 ) ) ( not ( = ?auto_723707 ?auto_723709 ) ) ( not ( = ?auto_723707 ?auto_723710 ) ) ( not ( = ?auto_723707 ?auto_723711 ) ) ( not ( = ?auto_723707 ?auto_723712 ) ) ( not ( = ?auto_723707 ?auto_723713 ) ) ( not ( = ?auto_723707 ?auto_723714 ) ) ( not ( = ?auto_723707 ?auto_723715 ) ) ( not ( = ?auto_723707 ?auto_723716 ) ) ( not ( = ?auto_723708 ?auto_723709 ) ) ( not ( = ?auto_723708 ?auto_723710 ) ) ( not ( = ?auto_723708 ?auto_723711 ) ) ( not ( = ?auto_723708 ?auto_723712 ) ) ( not ( = ?auto_723708 ?auto_723713 ) ) ( not ( = ?auto_723708 ?auto_723714 ) ) ( not ( = ?auto_723708 ?auto_723715 ) ) ( not ( = ?auto_723708 ?auto_723716 ) ) ( not ( = ?auto_723709 ?auto_723710 ) ) ( not ( = ?auto_723709 ?auto_723711 ) ) ( not ( = ?auto_723709 ?auto_723712 ) ) ( not ( = ?auto_723709 ?auto_723713 ) ) ( not ( = ?auto_723709 ?auto_723714 ) ) ( not ( = ?auto_723709 ?auto_723715 ) ) ( not ( = ?auto_723709 ?auto_723716 ) ) ( not ( = ?auto_723710 ?auto_723711 ) ) ( not ( = ?auto_723710 ?auto_723712 ) ) ( not ( = ?auto_723710 ?auto_723713 ) ) ( not ( = ?auto_723710 ?auto_723714 ) ) ( not ( = ?auto_723710 ?auto_723715 ) ) ( not ( = ?auto_723710 ?auto_723716 ) ) ( not ( = ?auto_723711 ?auto_723712 ) ) ( not ( = ?auto_723711 ?auto_723713 ) ) ( not ( = ?auto_723711 ?auto_723714 ) ) ( not ( = ?auto_723711 ?auto_723715 ) ) ( not ( = ?auto_723711 ?auto_723716 ) ) ( not ( = ?auto_723712 ?auto_723713 ) ) ( not ( = ?auto_723712 ?auto_723714 ) ) ( not ( = ?auto_723712 ?auto_723715 ) ) ( not ( = ?auto_723712 ?auto_723716 ) ) ( not ( = ?auto_723713 ?auto_723714 ) ) ( not ( = ?auto_723713 ?auto_723715 ) ) ( not ( = ?auto_723713 ?auto_723716 ) ) ( not ( = ?auto_723714 ?auto_723715 ) ) ( not ( = ?auto_723714 ?auto_723716 ) ) ( not ( = ?auto_723715 ?auto_723716 ) ) ( ON ?auto_723714 ?auto_723715 ) ( CLEAR ?auto_723712 ) ( ON ?auto_723713 ?auto_723714 ) ( CLEAR ?auto_723713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_723699 ?auto_723700 ?auto_723701 ?auto_723702 ?auto_723703 ?auto_723704 ?auto_723705 ?auto_723706 ?auto_723707 ?auto_723708 ?auto_723709 ?auto_723710 ?auto_723711 ?auto_723712 ?auto_723713 )
      ( MAKE-17PILE ?auto_723699 ?auto_723700 ?auto_723701 ?auto_723702 ?auto_723703 ?auto_723704 ?auto_723705 ?auto_723706 ?auto_723707 ?auto_723708 ?auto_723709 ?auto_723710 ?auto_723711 ?auto_723712 ?auto_723713 ?auto_723714 ?auto_723715 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723734 - BLOCK
      ?auto_723735 - BLOCK
      ?auto_723736 - BLOCK
      ?auto_723737 - BLOCK
      ?auto_723738 - BLOCK
      ?auto_723739 - BLOCK
      ?auto_723740 - BLOCK
      ?auto_723741 - BLOCK
      ?auto_723742 - BLOCK
      ?auto_723743 - BLOCK
      ?auto_723744 - BLOCK
      ?auto_723745 - BLOCK
      ?auto_723746 - BLOCK
      ?auto_723747 - BLOCK
      ?auto_723748 - BLOCK
      ?auto_723749 - BLOCK
      ?auto_723750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_723750 ) ( ON-TABLE ?auto_723734 ) ( ON ?auto_723735 ?auto_723734 ) ( ON ?auto_723736 ?auto_723735 ) ( ON ?auto_723737 ?auto_723736 ) ( ON ?auto_723738 ?auto_723737 ) ( ON ?auto_723739 ?auto_723738 ) ( ON ?auto_723740 ?auto_723739 ) ( ON ?auto_723741 ?auto_723740 ) ( ON ?auto_723742 ?auto_723741 ) ( ON ?auto_723743 ?auto_723742 ) ( ON ?auto_723744 ?auto_723743 ) ( ON ?auto_723745 ?auto_723744 ) ( ON ?auto_723746 ?auto_723745 ) ( ON ?auto_723747 ?auto_723746 ) ( not ( = ?auto_723734 ?auto_723735 ) ) ( not ( = ?auto_723734 ?auto_723736 ) ) ( not ( = ?auto_723734 ?auto_723737 ) ) ( not ( = ?auto_723734 ?auto_723738 ) ) ( not ( = ?auto_723734 ?auto_723739 ) ) ( not ( = ?auto_723734 ?auto_723740 ) ) ( not ( = ?auto_723734 ?auto_723741 ) ) ( not ( = ?auto_723734 ?auto_723742 ) ) ( not ( = ?auto_723734 ?auto_723743 ) ) ( not ( = ?auto_723734 ?auto_723744 ) ) ( not ( = ?auto_723734 ?auto_723745 ) ) ( not ( = ?auto_723734 ?auto_723746 ) ) ( not ( = ?auto_723734 ?auto_723747 ) ) ( not ( = ?auto_723734 ?auto_723748 ) ) ( not ( = ?auto_723734 ?auto_723749 ) ) ( not ( = ?auto_723734 ?auto_723750 ) ) ( not ( = ?auto_723735 ?auto_723736 ) ) ( not ( = ?auto_723735 ?auto_723737 ) ) ( not ( = ?auto_723735 ?auto_723738 ) ) ( not ( = ?auto_723735 ?auto_723739 ) ) ( not ( = ?auto_723735 ?auto_723740 ) ) ( not ( = ?auto_723735 ?auto_723741 ) ) ( not ( = ?auto_723735 ?auto_723742 ) ) ( not ( = ?auto_723735 ?auto_723743 ) ) ( not ( = ?auto_723735 ?auto_723744 ) ) ( not ( = ?auto_723735 ?auto_723745 ) ) ( not ( = ?auto_723735 ?auto_723746 ) ) ( not ( = ?auto_723735 ?auto_723747 ) ) ( not ( = ?auto_723735 ?auto_723748 ) ) ( not ( = ?auto_723735 ?auto_723749 ) ) ( not ( = ?auto_723735 ?auto_723750 ) ) ( not ( = ?auto_723736 ?auto_723737 ) ) ( not ( = ?auto_723736 ?auto_723738 ) ) ( not ( = ?auto_723736 ?auto_723739 ) ) ( not ( = ?auto_723736 ?auto_723740 ) ) ( not ( = ?auto_723736 ?auto_723741 ) ) ( not ( = ?auto_723736 ?auto_723742 ) ) ( not ( = ?auto_723736 ?auto_723743 ) ) ( not ( = ?auto_723736 ?auto_723744 ) ) ( not ( = ?auto_723736 ?auto_723745 ) ) ( not ( = ?auto_723736 ?auto_723746 ) ) ( not ( = ?auto_723736 ?auto_723747 ) ) ( not ( = ?auto_723736 ?auto_723748 ) ) ( not ( = ?auto_723736 ?auto_723749 ) ) ( not ( = ?auto_723736 ?auto_723750 ) ) ( not ( = ?auto_723737 ?auto_723738 ) ) ( not ( = ?auto_723737 ?auto_723739 ) ) ( not ( = ?auto_723737 ?auto_723740 ) ) ( not ( = ?auto_723737 ?auto_723741 ) ) ( not ( = ?auto_723737 ?auto_723742 ) ) ( not ( = ?auto_723737 ?auto_723743 ) ) ( not ( = ?auto_723737 ?auto_723744 ) ) ( not ( = ?auto_723737 ?auto_723745 ) ) ( not ( = ?auto_723737 ?auto_723746 ) ) ( not ( = ?auto_723737 ?auto_723747 ) ) ( not ( = ?auto_723737 ?auto_723748 ) ) ( not ( = ?auto_723737 ?auto_723749 ) ) ( not ( = ?auto_723737 ?auto_723750 ) ) ( not ( = ?auto_723738 ?auto_723739 ) ) ( not ( = ?auto_723738 ?auto_723740 ) ) ( not ( = ?auto_723738 ?auto_723741 ) ) ( not ( = ?auto_723738 ?auto_723742 ) ) ( not ( = ?auto_723738 ?auto_723743 ) ) ( not ( = ?auto_723738 ?auto_723744 ) ) ( not ( = ?auto_723738 ?auto_723745 ) ) ( not ( = ?auto_723738 ?auto_723746 ) ) ( not ( = ?auto_723738 ?auto_723747 ) ) ( not ( = ?auto_723738 ?auto_723748 ) ) ( not ( = ?auto_723738 ?auto_723749 ) ) ( not ( = ?auto_723738 ?auto_723750 ) ) ( not ( = ?auto_723739 ?auto_723740 ) ) ( not ( = ?auto_723739 ?auto_723741 ) ) ( not ( = ?auto_723739 ?auto_723742 ) ) ( not ( = ?auto_723739 ?auto_723743 ) ) ( not ( = ?auto_723739 ?auto_723744 ) ) ( not ( = ?auto_723739 ?auto_723745 ) ) ( not ( = ?auto_723739 ?auto_723746 ) ) ( not ( = ?auto_723739 ?auto_723747 ) ) ( not ( = ?auto_723739 ?auto_723748 ) ) ( not ( = ?auto_723739 ?auto_723749 ) ) ( not ( = ?auto_723739 ?auto_723750 ) ) ( not ( = ?auto_723740 ?auto_723741 ) ) ( not ( = ?auto_723740 ?auto_723742 ) ) ( not ( = ?auto_723740 ?auto_723743 ) ) ( not ( = ?auto_723740 ?auto_723744 ) ) ( not ( = ?auto_723740 ?auto_723745 ) ) ( not ( = ?auto_723740 ?auto_723746 ) ) ( not ( = ?auto_723740 ?auto_723747 ) ) ( not ( = ?auto_723740 ?auto_723748 ) ) ( not ( = ?auto_723740 ?auto_723749 ) ) ( not ( = ?auto_723740 ?auto_723750 ) ) ( not ( = ?auto_723741 ?auto_723742 ) ) ( not ( = ?auto_723741 ?auto_723743 ) ) ( not ( = ?auto_723741 ?auto_723744 ) ) ( not ( = ?auto_723741 ?auto_723745 ) ) ( not ( = ?auto_723741 ?auto_723746 ) ) ( not ( = ?auto_723741 ?auto_723747 ) ) ( not ( = ?auto_723741 ?auto_723748 ) ) ( not ( = ?auto_723741 ?auto_723749 ) ) ( not ( = ?auto_723741 ?auto_723750 ) ) ( not ( = ?auto_723742 ?auto_723743 ) ) ( not ( = ?auto_723742 ?auto_723744 ) ) ( not ( = ?auto_723742 ?auto_723745 ) ) ( not ( = ?auto_723742 ?auto_723746 ) ) ( not ( = ?auto_723742 ?auto_723747 ) ) ( not ( = ?auto_723742 ?auto_723748 ) ) ( not ( = ?auto_723742 ?auto_723749 ) ) ( not ( = ?auto_723742 ?auto_723750 ) ) ( not ( = ?auto_723743 ?auto_723744 ) ) ( not ( = ?auto_723743 ?auto_723745 ) ) ( not ( = ?auto_723743 ?auto_723746 ) ) ( not ( = ?auto_723743 ?auto_723747 ) ) ( not ( = ?auto_723743 ?auto_723748 ) ) ( not ( = ?auto_723743 ?auto_723749 ) ) ( not ( = ?auto_723743 ?auto_723750 ) ) ( not ( = ?auto_723744 ?auto_723745 ) ) ( not ( = ?auto_723744 ?auto_723746 ) ) ( not ( = ?auto_723744 ?auto_723747 ) ) ( not ( = ?auto_723744 ?auto_723748 ) ) ( not ( = ?auto_723744 ?auto_723749 ) ) ( not ( = ?auto_723744 ?auto_723750 ) ) ( not ( = ?auto_723745 ?auto_723746 ) ) ( not ( = ?auto_723745 ?auto_723747 ) ) ( not ( = ?auto_723745 ?auto_723748 ) ) ( not ( = ?auto_723745 ?auto_723749 ) ) ( not ( = ?auto_723745 ?auto_723750 ) ) ( not ( = ?auto_723746 ?auto_723747 ) ) ( not ( = ?auto_723746 ?auto_723748 ) ) ( not ( = ?auto_723746 ?auto_723749 ) ) ( not ( = ?auto_723746 ?auto_723750 ) ) ( not ( = ?auto_723747 ?auto_723748 ) ) ( not ( = ?auto_723747 ?auto_723749 ) ) ( not ( = ?auto_723747 ?auto_723750 ) ) ( not ( = ?auto_723748 ?auto_723749 ) ) ( not ( = ?auto_723748 ?auto_723750 ) ) ( not ( = ?auto_723749 ?auto_723750 ) ) ( ON ?auto_723749 ?auto_723750 ) ( CLEAR ?auto_723747 ) ( ON ?auto_723748 ?auto_723749 ) ( CLEAR ?auto_723748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_723734 ?auto_723735 ?auto_723736 ?auto_723737 ?auto_723738 ?auto_723739 ?auto_723740 ?auto_723741 ?auto_723742 ?auto_723743 ?auto_723744 ?auto_723745 ?auto_723746 ?auto_723747 ?auto_723748 )
      ( MAKE-17PILE ?auto_723734 ?auto_723735 ?auto_723736 ?auto_723737 ?auto_723738 ?auto_723739 ?auto_723740 ?auto_723741 ?auto_723742 ?auto_723743 ?auto_723744 ?auto_723745 ?auto_723746 ?auto_723747 ?auto_723748 ?auto_723749 ?auto_723750 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723768 - BLOCK
      ?auto_723769 - BLOCK
      ?auto_723770 - BLOCK
      ?auto_723771 - BLOCK
      ?auto_723772 - BLOCK
      ?auto_723773 - BLOCK
      ?auto_723774 - BLOCK
      ?auto_723775 - BLOCK
      ?auto_723776 - BLOCK
      ?auto_723777 - BLOCK
      ?auto_723778 - BLOCK
      ?auto_723779 - BLOCK
      ?auto_723780 - BLOCK
      ?auto_723781 - BLOCK
      ?auto_723782 - BLOCK
      ?auto_723783 - BLOCK
      ?auto_723784 - BLOCK
    )
    :vars
    (
      ?auto_723785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723784 ?auto_723785 ) ( ON-TABLE ?auto_723768 ) ( ON ?auto_723769 ?auto_723768 ) ( ON ?auto_723770 ?auto_723769 ) ( ON ?auto_723771 ?auto_723770 ) ( ON ?auto_723772 ?auto_723771 ) ( ON ?auto_723773 ?auto_723772 ) ( ON ?auto_723774 ?auto_723773 ) ( ON ?auto_723775 ?auto_723774 ) ( ON ?auto_723776 ?auto_723775 ) ( ON ?auto_723777 ?auto_723776 ) ( ON ?auto_723778 ?auto_723777 ) ( ON ?auto_723779 ?auto_723778 ) ( ON ?auto_723780 ?auto_723779 ) ( not ( = ?auto_723768 ?auto_723769 ) ) ( not ( = ?auto_723768 ?auto_723770 ) ) ( not ( = ?auto_723768 ?auto_723771 ) ) ( not ( = ?auto_723768 ?auto_723772 ) ) ( not ( = ?auto_723768 ?auto_723773 ) ) ( not ( = ?auto_723768 ?auto_723774 ) ) ( not ( = ?auto_723768 ?auto_723775 ) ) ( not ( = ?auto_723768 ?auto_723776 ) ) ( not ( = ?auto_723768 ?auto_723777 ) ) ( not ( = ?auto_723768 ?auto_723778 ) ) ( not ( = ?auto_723768 ?auto_723779 ) ) ( not ( = ?auto_723768 ?auto_723780 ) ) ( not ( = ?auto_723768 ?auto_723781 ) ) ( not ( = ?auto_723768 ?auto_723782 ) ) ( not ( = ?auto_723768 ?auto_723783 ) ) ( not ( = ?auto_723768 ?auto_723784 ) ) ( not ( = ?auto_723768 ?auto_723785 ) ) ( not ( = ?auto_723769 ?auto_723770 ) ) ( not ( = ?auto_723769 ?auto_723771 ) ) ( not ( = ?auto_723769 ?auto_723772 ) ) ( not ( = ?auto_723769 ?auto_723773 ) ) ( not ( = ?auto_723769 ?auto_723774 ) ) ( not ( = ?auto_723769 ?auto_723775 ) ) ( not ( = ?auto_723769 ?auto_723776 ) ) ( not ( = ?auto_723769 ?auto_723777 ) ) ( not ( = ?auto_723769 ?auto_723778 ) ) ( not ( = ?auto_723769 ?auto_723779 ) ) ( not ( = ?auto_723769 ?auto_723780 ) ) ( not ( = ?auto_723769 ?auto_723781 ) ) ( not ( = ?auto_723769 ?auto_723782 ) ) ( not ( = ?auto_723769 ?auto_723783 ) ) ( not ( = ?auto_723769 ?auto_723784 ) ) ( not ( = ?auto_723769 ?auto_723785 ) ) ( not ( = ?auto_723770 ?auto_723771 ) ) ( not ( = ?auto_723770 ?auto_723772 ) ) ( not ( = ?auto_723770 ?auto_723773 ) ) ( not ( = ?auto_723770 ?auto_723774 ) ) ( not ( = ?auto_723770 ?auto_723775 ) ) ( not ( = ?auto_723770 ?auto_723776 ) ) ( not ( = ?auto_723770 ?auto_723777 ) ) ( not ( = ?auto_723770 ?auto_723778 ) ) ( not ( = ?auto_723770 ?auto_723779 ) ) ( not ( = ?auto_723770 ?auto_723780 ) ) ( not ( = ?auto_723770 ?auto_723781 ) ) ( not ( = ?auto_723770 ?auto_723782 ) ) ( not ( = ?auto_723770 ?auto_723783 ) ) ( not ( = ?auto_723770 ?auto_723784 ) ) ( not ( = ?auto_723770 ?auto_723785 ) ) ( not ( = ?auto_723771 ?auto_723772 ) ) ( not ( = ?auto_723771 ?auto_723773 ) ) ( not ( = ?auto_723771 ?auto_723774 ) ) ( not ( = ?auto_723771 ?auto_723775 ) ) ( not ( = ?auto_723771 ?auto_723776 ) ) ( not ( = ?auto_723771 ?auto_723777 ) ) ( not ( = ?auto_723771 ?auto_723778 ) ) ( not ( = ?auto_723771 ?auto_723779 ) ) ( not ( = ?auto_723771 ?auto_723780 ) ) ( not ( = ?auto_723771 ?auto_723781 ) ) ( not ( = ?auto_723771 ?auto_723782 ) ) ( not ( = ?auto_723771 ?auto_723783 ) ) ( not ( = ?auto_723771 ?auto_723784 ) ) ( not ( = ?auto_723771 ?auto_723785 ) ) ( not ( = ?auto_723772 ?auto_723773 ) ) ( not ( = ?auto_723772 ?auto_723774 ) ) ( not ( = ?auto_723772 ?auto_723775 ) ) ( not ( = ?auto_723772 ?auto_723776 ) ) ( not ( = ?auto_723772 ?auto_723777 ) ) ( not ( = ?auto_723772 ?auto_723778 ) ) ( not ( = ?auto_723772 ?auto_723779 ) ) ( not ( = ?auto_723772 ?auto_723780 ) ) ( not ( = ?auto_723772 ?auto_723781 ) ) ( not ( = ?auto_723772 ?auto_723782 ) ) ( not ( = ?auto_723772 ?auto_723783 ) ) ( not ( = ?auto_723772 ?auto_723784 ) ) ( not ( = ?auto_723772 ?auto_723785 ) ) ( not ( = ?auto_723773 ?auto_723774 ) ) ( not ( = ?auto_723773 ?auto_723775 ) ) ( not ( = ?auto_723773 ?auto_723776 ) ) ( not ( = ?auto_723773 ?auto_723777 ) ) ( not ( = ?auto_723773 ?auto_723778 ) ) ( not ( = ?auto_723773 ?auto_723779 ) ) ( not ( = ?auto_723773 ?auto_723780 ) ) ( not ( = ?auto_723773 ?auto_723781 ) ) ( not ( = ?auto_723773 ?auto_723782 ) ) ( not ( = ?auto_723773 ?auto_723783 ) ) ( not ( = ?auto_723773 ?auto_723784 ) ) ( not ( = ?auto_723773 ?auto_723785 ) ) ( not ( = ?auto_723774 ?auto_723775 ) ) ( not ( = ?auto_723774 ?auto_723776 ) ) ( not ( = ?auto_723774 ?auto_723777 ) ) ( not ( = ?auto_723774 ?auto_723778 ) ) ( not ( = ?auto_723774 ?auto_723779 ) ) ( not ( = ?auto_723774 ?auto_723780 ) ) ( not ( = ?auto_723774 ?auto_723781 ) ) ( not ( = ?auto_723774 ?auto_723782 ) ) ( not ( = ?auto_723774 ?auto_723783 ) ) ( not ( = ?auto_723774 ?auto_723784 ) ) ( not ( = ?auto_723774 ?auto_723785 ) ) ( not ( = ?auto_723775 ?auto_723776 ) ) ( not ( = ?auto_723775 ?auto_723777 ) ) ( not ( = ?auto_723775 ?auto_723778 ) ) ( not ( = ?auto_723775 ?auto_723779 ) ) ( not ( = ?auto_723775 ?auto_723780 ) ) ( not ( = ?auto_723775 ?auto_723781 ) ) ( not ( = ?auto_723775 ?auto_723782 ) ) ( not ( = ?auto_723775 ?auto_723783 ) ) ( not ( = ?auto_723775 ?auto_723784 ) ) ( not ( = ?auto_723775 ?auto_723785 ) ) ( not ( = ?auto_723776 ?auto_723777 ) ) ( not ( = ?auto_723776 ?auto_723778 ) ) ( not ( = ?auto_723776 ?auto_723779 ) ) ( not ( = ?auto_723776 ?auto_723780 ) ) ( not ( = ?auto_723776 ?auto_723781 ) ) ( not ( = ?auto_723776 ?auto_723782 ) ) ( not ( = ?auto_723776 ?auto_723783 ) ) ( not ( = ?auto_723776 ?auto_723784 ) ) ( not ( = ?auto_723776 ?auto_723785 ) ) ( not ( = ?auto_723777 ?auto_723778 ) ) ( not ( = ?auto_723777 ?auto_723779 ) ) ( not ( = ?auto_723777 ?auto_723780 ) ) ( not ( = ?auto_723777 ?auto_723781 ) ) ( not ( = ?auto_723777 ?auto_723782 ) ) ( not ( = ?auto_723777 ?auto_723783 ) ) ( not ( = ?auto_723777 ?auto_723784 ) ) ( not ( = ?auto_723777 ?auto_723785 ) ) ( not ( = ?auto_723778 ?auto_723779 ) ) ( not ( = ?auto_723778 ?auto_723780 ) ) ( not ( = ?auto_723778 ?auto_723781 ) ) ( not ( = ?auto_723778 ?auto_723782 ) ) ( not ( = ?auto_723778 ?auto_723783 ) ) ( not ( = ?auto_723778 ?auto_723784 ) ) ( not ( = ?auto_723778 ?auto_723785 ) ) ( not ( = ?auto_723779 ?auto_723780 ) ) ( not ( = ?auto_723779 ?auto_723781 ) ) ( not ( = ?auto_723779 ?auto_723782 ) ) ( not ( = ?auto_723779 ?auto_723783 ) ) ( not ( = ?auto_723779 ?auto_723784 ) ) ( not ( = ?auto_723779 ?auto_723785 ) ) ( not ( = ?auto_723780 ?auto_723781 ) ) ( not ( = ?auto_723780 ?auto_723782 ) ) ( not ( = ?auto_723780 ?auto_723783 ) ) ( not ( = ?auto_723780 ?auto_723784 ) ) ( not ( = ?auto_723780 ?auto_723785 ) ) ( not ( = ?auto_723781 ?auto_723782 ) ) ( not ( = ?auto_723781 ?auto_723783 ) ) ( not ( = ?auto_723781 ?auto_723784 ) ) ( not ( = ?auto_723781 ?auto_723785 ) ) ( not ( = ?auto_723782 ?auto_723783 ) ) ( not ( = ?auto_723782 ?auto_723784 ) ) ( not ( = ?auto_723782 ?auto_723785 ) ) ( not ( = ?auto_723783 ?auto_723784 ) ) ( not ( = ?auto_723783 ?auto_723785 ) ) ( not ( = ?auto_723784 ?auto_723785 ) ) ( ON ?auto_723783 ?auto_723784 ) ( ON ?auto_723782 ?auto_723783 ) ( CLEAR ?auto_723780 ) ( ON ?auto_723781 ?auto_723782 ) ( CLEAR ?auto_723781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_723768 ?auto_723769 ?auto_723770 ?auto_723771 ?auto_723772 ?auto_723773 ?auto_723774 ?auto_723775 ?auto_723776 ?auto_723777 ?auto_723778 ?auto_723779 ?auto_723780 ?auto_723781 )
      ( MAKE-17PILE ?auto_723768 ?auto_723769 ?auto_723770 ?auto_723771 ?auto_723772 ?auto_723773 ?auto_723774 ?auto_723775 ?auto_723776 ?auto_723777 ?auto_723778 ?auto_723779 ?auto_723780 ?auto_723781 ?auto_723782 ?auto_723783 ?auto_723784 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723803 - BLOCK
      ?auto_723804 - BLOCK
      ?auto_723805 - BLOCK
      ?auto_723806 - BLOCK
      ?auto_723807 - BLOCK
      ?auto_723808 - BLOCK
      ?auto_723809 - BLOCK
      ?auto_723810 - BLOCK
      ?auto_723811 - BLOCK
      ?auto_723812 - BLOCK
      ?auto_723813 - BLOCK
      ?auto_723814 - BLOCK
      ?auto_723815 - BLOCK
      ?auto_723816 - BLOCK
      ?auto_723817 - BLOCK
      ?auto_723818 - BLOCK
      ?auto_723819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_723819 ) ( ON-TABLE ?auto_723803 ) ( ON ?auto_723804 ?auto_723803 ) ( ON ?auto_723805 ?auto_723804 ) ( ON ?auto_723806 ?auto_723805 ) ( ON ?auto_723807 ?auto_723806 ) ( ON ?auto_723808 ?auto_723807 ) ( ON ?auto_723809 ?auto_723808 ) ( ON ?auto_723810 ?auto_723809 ) ( ON ?auto_723811 ?auto_723810 ) ( ON ?auto_723812 ?auto_723811 ) ( ON ?auto_723813 ?auto_723812 ) ( ON ?auto_723814 ?auto_723813 ) ( ON ?auto_723815 ?auto_723814 ) ( not ( = ?auto_723803 ?auto_723804 ) ) ( not ( = ?auto_723803 ?auto_723805 ) ) ( not ( = ?auto_723803 ?auto_723806 ) ) ( not ( = ?auto_723803 ?auto_723807 ) ) ( not ( = ?auto_723803 ?auto_723808 ) ) ( not ( = ?auto_723803 ?auto_723809 ) ) ( not ( = ?auto_723803 ?auto_723810 ) ) ( not ( = ?auto_723803 ?auto_723811 ) ) ( not ( = ?auto_723803 ?auto_723812 ) ) ( not ( = ?auto_723803 ?auto_723813 ) ) ( not ( = ?auto_723803 ?auto_723814 ) ) ( not ( = ?auto_723803 ?auto_723815 ) ) ( not ( = ?auto_723803 ?auto_723816 ) ) ( not ( = ?auto_723803 ?auto_723817 ) ) ( not ( = ?auto_723803 ?auto_723818 ) ) ( not ( = ?auto_723803 ?auto_723819 ) ) ( not ( = ?auto_723804 ?auto_723805 ) ) ( not ( = ?auto_723804 ?auto_723806 ) ) ( not ( = ?auto_723804 ?auto_723807 ) ) ( not ( = ?auto_723804 ?auto_723808 ) ) ( not ( = ?auto_723804 ?auto_723809 ) ) ( not ( = ?auto_723804 ?auto_723810 ) ) ( not ( = ?auto_723804 ?auto_723811 ) ) ( not ( = ?auto_723804 ?auto_723812 ) ) ( not ( = ?auto_723804 ?auto_723813 ) ) ( not ( = ?auto_723804 ?auto_723814 ) ) ( not ( = ?auto_723804 ?auto_723815 ) ) ( not ( = ?auto_723804 ?auto_723816 ) ) ( not ( = ?auto_723804 ?auto_723817 ) ) ( not ( = ?auto_723804 ?auto_723818 ) ) ( not ( = ?auto_723804 ?auto_723819 ) ) ( not ( = ?auto_723805 ?auto_723806 ) ) ( not ( = ?auto_723805 ?auto_723807 ) ) ( not ( = ?auto_723805 ?auto_723808 ) ) ( not ( = ?auto_723805 ?auto_723809 ) ) ( not ( = ?auto_723805 ?auto_723810 ) ) ( not ( = ?auto_723805 ?auto_723811 ) ) ( not ( = ?auto_723805 ?auto_723812 ) ) ( not ( = ?auto_723805 ?auto_723813 ) ) ( not ( = ?auto_723805 ?auto_723814 ) ) ( not ( = ?auto_723805 ?auto_723815 ) ) ( not ( = ?auto_723805 ?auto_723816 ) ) ( not ( = ?auto_723805 ?auto_723817 ) ) ( not ( = ?auto_723805 ?auto_723818 ) ) ( not ( = ?auto_723805 ?auto_723819 ) ) ( not ( = ?auto_723806 ?auto_723807 ) ) ( not ( = ?auto_723806 ?auto_723808 ) ) ( not ( = ?auto_723806 ?auto_723809 ) ) ( not ( = ?auto_723806 ?auto_723810 ) ) ( not ( = ?auto_723806 ?auto_723811 ) ) ( not ( = ?auto_723806 ?auto_723812 ) ) ( not ( = ?auto_723806 ?auto_723813 ) ) ( not ( = ?auto_723806 ?auto_723814 ) ) ( not ( = ?auto_723806 ?auto_723815 ) ) ( not ( = ?auto_723806 ?auto_723816 ) ) ( not ( = ?auto_723806 ?auto_723817 ) ) ( not ( = ?auto_723806 ?auto_723818 ) ) ( not ( = ?auto_723806 ?auto_723819 ) ) ( not ( = ?auto_723807 ?auto_723808 ) ) ( not ( = ?auto_723807 ?auto_723809 ) ) ( not ( = ?auto_723807 ?auto_723810 ) ) ( not ( = ?auto_723807 ?auto_723811 ) ) ( not ( = ?auto_723807 ?auto_723812 ) ) ( not ( = ?auto_723807 ?auto_723813 ) ) ( not ( = ?auto_723807 ?auto_723814 ) ) ( not ( = ?auto_723807 ?auto_723815 ) ) ( not ( = ?auto_723807 ?auto_723816 ) ) ( not ( = ?auto_723807 ?auto_723817 ) ) ( not ( = ?auto_723807 ?auto_723818 ) ) ( not ( = ?auto_723807 ?auto_723819 ) ) ( not ( = ?auto_723808 ?auto_723809 ) ) ( not ( = ?auto_723808 ?auto_723810 ) ) ( not ( = ?auto_723808 ?auto_723811 ) ) ( not ( = ?auto_723808 ?auto_723812 ) ) ( not ( = ?auto_723808 ?auto_723813 ) ) ( not ( = ?auto_723808 ?auto_723814 ) ) ( not ( = ?auto_723808 ?auto_723815 ) ) ( not ( = ?auto_723808 ?auto_723816 ) ) ( not ( = ?auto_723808 ?auto_723817 ) ) ( not ( = ?auto_723808 ?auto_723818 ) ) ( not ( = ?auto_723808 ?auto_723819 ) ) ( not ( = ?auto_723809 ?auto_723810 ) ) ( not ( = ?auto_723809 ?auto_723811 ) ) ( not ( = ?auto_723809 ?auto_723812 ) ) ( not ( = ?auto_723809 ?auto_723813 ) ) ( not ( = ?auto_723809 ?auto_723814 ) ) ( not ( = ?auto_723809 ?auto_723815 ) ) ( not ( = ?auto_723809 ?auto_723816 ) ) ( not ( = ?auto_723809 ?auto_723817 ) ) ( not ( = ?auto_723809 ?auto_723818 ) ) ( not ( = ?auto_723809 ?auto_723819 ) ) ( not ( = ?auto_723810 ?auto_723811 ) ) ( not ( = ?auto_723810 ?auto_723812 ) ) ( not ( = ?auto_723810 ?auto_723813 ) ) ( not ( = ?auto_723810 ?auto_723814 ) ) ( not ( = ?auto_723810 ?auto_723815 ) ) ( not ( = ?auto_723810 ?auto_723816 ) ) ( not ( = ?auto_723810 ?auto_723817 ) ) ( not ( = ?auto_723810 ?auto_723818 ) ) ( not ( = ?auto_723810 ?auto_723819 ) ) ( not ( = ?auto_723811 ?auto_723812 ) ) ( not ( = ?auto_723811 ?auto_723813 ) ) ( not ( = ?auto_723811 ?auto_723814 ) ) ( not ( = ?auto_723811 ?auto_723815 ) ) ( not ( = ?auto_723811 ?auto_723816 ) ) ( not ( = ?auto_723811 ?auto_723817 ) ) ( not ( = ?auto_723811 ?auto_723818 ) ) ( not ( = ?auto_723811 ?auto_723819 ) ) ( not ( = ?auto_723812 ?auto_723813 ) ) ( not ( = ?auto_723812 ?auto_723814 ) ) ( not ( = ?auto_723812 ?auto_723815 ) ) ( not ( = ?auto_723812 ?auto_723816 ) ) ( not ( = ?auto_723812 ?auto_723817 ) ) ( not ( = ?auto_723812 ?auto_723818 ) ) ( not ( = ?auto_723812 ?auto_723819 ) ) ( not ( = ?auto_723813 ?auto_723814 ) ) ( not ( = ?auto_723813 ?auto_723815 ) ) ( not ( = ?auto_723813 ?auto_723816 ) ) ( not ( = ?auto_723813 ?auto_723817 ) ) ( not ( = ?auto_723813 ?auto_723818 ) ) ( not ( = ?auto_723813 ?auto_723819 ) ) ( not ( = ?auto_723814 ?auto_723815 ) ) ( not ( = ?auto_723814 ?auto_723816 ) ) ( not ( = ?auto_723814 ?auto_723817 ) ) ( not ( = ?auto_723814 ?auto_723818 ) ) ( not ( = ?auto_723814 ?auto_723819 ) ) ( not ( = ?auto_723815 ?auto_723816 ) ) ( not ( = ?auto_723815 ?auto_723817 ) ) ( not ( = ?auto_723815 ?auto_723818 ) ) ( not ( = ?auto_723815 ?auto_723819 ) ) ( not ( = ?auto_723816 ?auto_723817 ) ) ( not ( = ?auto_723816 ?auto_723818 ) ) ( not ( = ?auto_723816 ?auto_723819 ) ) ( not ( = ?auto_723817 ?auto_723818 ) ) ( not ( = ?auto_723817 ?auto_723819 ) ) ( not ( = ?auto_723818 ?auto_723819 ) ) ( ON ?auto_723818 ?auto_723819 ) ( ON ?auto_723817 ?auto_723818 ) ( CLEAR ?auto_723815 ) ( ON ?auto_723816 ?auto_723817 ) ( CLEAR ?auto_723816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_723803 ?auto_723804 ?auto_723805 ?auto_723806 ?auto_723807 ?auto_723808 ?auto_723809 ?auto_723810 ?auto_723811 ?auto_723812 ?auto_723813 ?auto_723814 ?auto_723815 ?auto_723816 )
      ( MAKE-17PILE ?auto_723803 ?auto_723804 ?auto_723805 ?auto_723806 ?auto_723807 ?auto_723808 ?auto_723809 ?auto_723810 ?auto_723811 ?auto_723812 ?auto_723813 ?auto_723814 ?auto_723815 ?auto_723816 ?auto_723817 ?auto_723818 ?auto_723819 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723837 - BLOCK
      ?auto_723838 - BLOCK
      ?auto_723839 - BLOCK
      ?auto_723840 - BLOCK
      ?auto_723841 - BLOCK
      ?auto_723842 - BLOCK
      ?auto_723843 - BLOCK
      ?auto_723844 - BLOCK
      ?auto_723845 - BLOCK
      ?auto_723846 - BLOCK
      ?auto_723847 - BLOCK
      ?auto_723848 - BLOCK
      ?auto_723849 - BLOCK
      ?auto_723850 - BLOCK
      ?auto_723851 - BLOCK
      ?auto_723852 - BLOCK
      ?auto_723853 - BLOCK
    )
    :vars
    (
      ?auto_723854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723853 ?auto_723854 ) ( ON-TABLE ?auto_723837 ) ( ON ?auto_723838 ?auto_723837 ) ( ON ?auto_723839 ?auto_723838 ) ( ON ?auto_723840 ?auto_723839 ) ( ON ?auto_723841 ?auto_723840 ) ( ON ?auto_723842 ?auto_723841 ) ( ON ?auto_723843 ?auto_723842 ) ( ON ?auto_723844 ?auto_723843 ) ( ON ?auto_723845 ?auto_723844 ) ( ON ?auto_723846 ?auto_723845 ) ( ON ?auto_723847 ?auto_723846 ) ( ON ?auto_723848 ?auto_723847 ) ( not ( = ?auto_723837 ?auto_723838 ) ) ( not ( = ?auto_723837 ?auto_723839 ) ) ( not ( = ?auto_723837 ?auto_723840 ) ) ( not ( = ?auto_723837 ?auto_723841 ) ) ( not ( = ?auto_723837 ?auto_723842 ) ) ( not ( = ?auto_723837 ?auto_723843 ) ) ( not ( = ?auto_723837 ?auto_723844 ) ) ( not ( = ?auto_723837 ?auto_723845 ) ) ( not ( = ?auto_723837 ?auto_723846 ) ) ( not ( = ?auto_723837 ?auto_723847 ) ) ( not ( = ?auto_723837 ?auto_723848 ) ) ( not ( = ?auto_723837 ?auto_723849 ) ) ( not ( = ?auto_723837 ?auto_723850 ) ) ( not ( = ?auto_723837 ?auto_723851 ) ) ( not ( = ?auto_723837 ?auto_723852 ) ) ( not ( = ?auto_723837 ?auto_723853 ) ) ( not ( = ?auto_723837 ?auto_723854 ) ) ( not ( = ?auto_723838 ?auto_723839 ) ) ( not ( = ?auto_723838 ?auto_723840 ) ) ( not ( = ?auto_723838 ?auto_723841 ) ) ( not ( = ?auto_723838 ?auto_723842 ) ) ( not ( = ?auto_723838 ?auto_723843 ) ) ( not ( = ?auto_723838 ?auto_723844 ) ) ( not ( = ?auto_723838 ?auto_723845 ) ) ( not ( = ?auto_723838 ?auto_723846 ) ) ( not ( = ?auto_723838 ?auto_723847 ) ) ( not ( = ?auto_723838 ?auto_723848 ) ) ( not ( = ?auto_723838 ?auto_723849 ) ) ( not ( = ?auto_723838 ?auto_723850 ) ) ( not ( = ?auto_723838 ?auto_723851 ) ) ( not ( = ?auto_723838 ?auto_723852 ) ) ( not ( = ?auto_723838 ?auto_723853 ) ) ( not ( = ?auto_723838 ?auto_723854 ) ) ( not ( = ?auto_723839 ?auto_723840 ) ) ( not ( = ?auto_723839 ?auto_723841 ) ) ( not ( = ?auto_723839 ?auto_723842 ) ) ( not ( = ?auto_723839 ?auto_723843 ) ) ( not ( = ?auto_723839 ?auto_723844 ) ) ( not ( = ?auto_723839 ?auto_723845 ) ) ( not ( = ?auto_723839 ?auto_723846 ) ) ( not ( = ?auto_723839 ?auto_723847 ) ) ( not ( = ?auto_723839 ?auto_723848 ) ) ( not ( = ?auto_723839 ?auto_723849 ) ) ( not ( = ?auto_723839 ?auto_723850 ) ) ( not ( = ?auto_723839 ?auto_723851 ) ) ( not ( = ?auto_723839 ?auto_723852 ) ) ( not ( = ?auto_723839 ?auto_723853 ) ) ( not ( = ?auto_723839 ?auto_723854 ) ) ( not ( = ?auto_723840 ?auto_723841 ) ) ( not ( = ?auto_723840 ?auto_723842 ) ) ( not ( = ?auto_723840 ?auto_723843 ) ) ( not ( = ?auto_723840 ?auto_723844 ) ) ( not ( = ?auto_723840 ?auto_723845 ) ) ( not ( = ?auto_723840 ?auto_723846 ) ) ( not ( = ?auto_723840 ?auto_723847 ) ) ( not ( = ?auto_723840 ?auto_723848 ) ) ( not ( = ?auto_723840 ?auto_723849 ) ) ( not ( = ?auto_723840 ?auto_723850 ) ) ( not ( = ?auto_723840 ?auto_723851 ) ) ( not ( = ?auto_723840 ?auto_723852 ) ) ( not ( = ?auto_723840 ?auto_723853 ) ) ( not ( = ?auto_723840 ?auto_723854 ) ) ( not ( = ?auto_723841 ?auto_723842 ) ) ( not ( = ?auto_723841 ?auto_723843 ) ) ( not ( = ?auto_723841 ?auto_723844 ) ) ( not ( = ?auto_723841 ?auto_723845 ) ) ( not ( = ?auto_723841 ?auto_723846 ) ) ( not ( = ?auto_723841 ?auto_723847 ) ) ( not ( = ?auto_723841 ?auto_723848 ) ) ( not ( = ?auto_723841 ?auto_723849 ) ) ( not ( = ?auto_723841 ?auto_723850 ) ) ( not ( = ?auto_723841 ?auto_723851 ) ) ( not ( = ?auto_723841 ?auto_723852 ) ) ( not ( = ?auto_723841 ?auto_723853 ) ) ( not ( = ?auto_723841 ?auto_723854 ) ) ( not ( = ?auto_723842 ?auto_723843 ) ) ( not ( = ?auto_723842 ?auto_723844 ) ) ( not ( = ?auto_723842 ?auto_723845 ) ) ( not ( = ?auto_723842 ?auto_723846 ) ) ( not ( = ?auto_723842 ?auto_723847 ) ) ( not ( = ?auto_723842 ?auto_723848 ) ) ( not ( = ?auto_723842 ?auto_723849 ) ) ( not ( = ?auto_723842 ?auto_723850 ) ) ( not ( = ?auto_723842 ?auto_723851 ) ) ( not ( = ?auto_723842 ?auto_723852 ) ) ( not ( = ?auto_723842 ?auto_723853 ) ) ( not ( = ?auto_723842 ?auto_723854 ) ) ( not ( = ?auto_723843 ?auto_723844 ) ) ( not ( = ?auto_723843 ?auto_723845 ) ) ( not ( = ?auto_723843 ?auto_723846 ) ) ( not ( = ?auto_723843 ?auto_723847 ) ) ( not ( = ?auto_723843 ?auto_723848 ) ) ( not ( = ?auto_723843 ?auto_723849 ) ) ( not ( = ?auto_723843 ?auto_723850 ) ) ( not ( = ?auto_723843 ?auto_723851 ) ) ( not ( = ?auto_723843 ?auto_723852 ) ) ( not ( = ?auto_723843 ?auto_723853 ) ) ( not ( = ?auto_723843 ?auto_723854 ) ) ( not ( = ?auto_723844 ?auto_723845 ) ) ( not ( = ?auto_723844 ?auto_723846 ) ) ( not ( = ?auto_723844 ?auto_723847 ) ) ( not ( = ?auto_723844 ?auto_723848 ) ) ( not ( = ?auto_723844 ?auto_723849 ) ) ( not ( = ?auto_723844 ?auto_723850 ) ) ( not ( = ?auto_723844 ?auto_723851 ) ) ( not ( = ?auto_723844 ?auto_723852 ) ) ( not ( = ?auto_723844 ?auto_723853 ) ) ( not ( = ?auto_723844 ?auto_723854 ) ) ( not ( = ?auto_723845 ?auto_723846 ) ) ( not ( = ?auto_723845 ?auto_723847 ) ) ( not ( = ?auto_723845 ?auto_723848 ) ) ( not ( = ?auto_723845 ?auto_723849 ) ) ( not ( = ?auto_723845 ?auto_723850 ) ) ( not ( = ?auto_723845 ?auto_723851 ) ) ( not ( = ?auto_723845 ?auto_723852 ) ) ( not ( = ?auto_723845 ?auto_723853 ) ) ( not ( = ?auto_723845 ?auto_723854 ) ) ( not ( = ?auto_723846 ?auto_723847 ) ) ( not ( = ?auto_723846 ?auto_723848 ) ) ( not ( = ?auto_723846 ?auto_723849 ) ) ( not ( = ?auto_723846 ?auto_723850 ) ) ( not ( = ?auto_723846 ?auto_723851 ) ) ( not ( = ?auto_723846 ?auto_723852 ) ) ( not ( = ?auto_723846 ?auto_723853 ) ) ( not ( = ?auto_723846 ?auto_723854 ) ) ( not ( = ?auto_723847 ?auto_723848 ) ) ( not ( = ?auto_723847 ?auto_723849 ) ) ( not ( = ?auto_723847 ?auto_723850 ) ) ( not ( = ?auto_723847 ?auto_723851 ) ) ( not ( = ?auto_723847 ?auto_723852 ) ) ( not ( = ?auto_723847 ?auto_723853 ) ) ( not ( = ?auto_723847 ?auto_723854 ) ) ( not ( = ?auto_723848 ?auto_723849 ) ) ( not ( = ?auto_723848 ?auto_723850 ) ) ( not ( = ?auto_723848 ?auto_723851 ) ) ( not ( = ?auto_723848 ?auto_723852 ) ) ( not ( = ?auto_723848 ?auto_723853 ) ) ( not ( = ?auto_723848 ?auto_723854 ) ) ( not ( = ?auto_723849 ?auto_723850 ) ) ( not ( = ?auto_723849 ?auto_723851 ) ) ( not ( = ?auto_723849 ?auto_723852 ) ) ( not ( = ?auto_723849 ?auto_723853 ) ) ( not ( = ?auto_723849 ?auto_723854 ) ) ( not ( = ?auto_723850 ?auto_723851 ) ) ( not ( = ?auto_723850 ?auto_723852 ) ) ( not ( = ?auto_723850 ?auto_723853 ) ) ( not ( = ?auto_723850 ?auto_723854 ) ) ( not ( = ?auto_723851 ?auto_723852 ) ) ( not ( = ?auto_723851 ?auto_723853 ) ) ( not ( = ?auto_723851 ?auto_723854 ) ) ( not ( = ?auto_723852 ?auto_723853 ) ) ( not ( = ?auto_723852 ?auto_723854 ) ) ( not ( = ?auto_723853 ?auto_723854 ) ) ( ON ?auto_723852 ?auto_723853 ) ( ON ?auto_723851 ?auto_723852 ) ( ON ?auto_723850 ?auto_723851 ) ( CLEAR ?auto_723848 ) ( ON ?auto_723849 ?auto_723850 ) ( CLEAR ?auto_723849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_723837 ?auto_723838 ?auto_723839 ?auto_723840 ?auto_723841 ?auto_723842 ?auto_723843 ?auto_723844 ?auto_723845 ?auto_723846 ?auto_723847 ?auto_723848 ?auto_723849 )
      ( MAKE-17PILE ?auto_723837 ?auto_723838 ?auto_723839 ?auto_723840 ?auto_723841 ?auto_723842 ?auto_723843 ?auto_723844 ?auto_723845 ?auto_723846 ?auto_723847 ?auto_723848 ?auto_723849 ?auto_723850 ?auto_723851 ?auto_723852 ?auto_723853 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723872 - BLOCK
      ?auto_723873 - BLOCK
      ?auto_723874 - BLOCK
      ?auto_723875 - BLOCK
      ?auto_723876 - BLOCK
      ?auto_723877 - BLOCK
      ?auto_723878 - BLOCK
      ?auto_723879 - BLOCK
      ?auto_723880 - BLOCK
      ?auto_723881 - BLOCK
      ?auto_723882 - BLOCK
      ?auto_723883 - BLOCK
      ?auto_723884 - BLOCK
      ?auto_723885 - BLOCK
      ?auto_723886 - BLOCK
      ?auto_723887 - BLOCK
      ?auto_723888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_723888 ) ( ON-TABLE ?auto_723872 ) ( ON ?auto_723873 ?auto_723872 ) ( ON ?auto_723874 ?auto_723873 ) ( ON ?auto_723875 ?auto_723874 ) ( ON ?auto_723876 ?auto_723875 ) ( ON ?auto_723877 ?auto_723876 ) ( ON ?auto_723878 ?auto_723877 ) ( ON ?auto_723879 ?auto_723878 ) ( ON ?auto_723880 ?auto_723879 ) ( ON ?auto_723881 ?auto_723880 ) ( ON ?auto_723882 ?auto_723881 ) ( ON ?auto_723883 ?auto_723882 ) ( not ( = ?auto_723872 ?auto_723873 ) ) ( not ( = ?auto_723872 ?auto_723874 ) ) ( not ( = ?auto_723872 ?auto_723875 ) ) ( not ( = ?auto_723872 ?auto_723876 ) ) ( not ( = ?auto_723872 ?auto_723877 ) ) ( not ( = ?auto_723872 ?auto_723878 ) ) ( not ( = ?auto_723872 ?auto_723879 ) ) ( not ( = ?auto_723872 ?auto_723880 ) ) ( not ( = ?auto_723872 ?auto_723881 ) ) ( not ( = ?auto_723872 ?auto_723882 ) ) ( not ( = ?auto_723872 ?auto_723883 ) ) ( not ( = ?auto_723872 ?auto_723884 ) ) ( not ( = ?auto_723872 ?auto_723885 ) ) ( not ( = ?auto_723872 ?auto_723886 ) ) ( not ( = ?auto_723872 ?auto_723887 ) ) ( not ( = ?auto_723872 ?auto_723888 ) ) ( not ( = ?auto_723873 ?auto_723874 ) ) ( not ( = ?auto_723873 ?auto_723875 ) ) ( not ( = ?auto_723873 ?auto_723876 ) ) ( not ( = ?auto_723873 ?auto_723877 ) ) ( not ( = ?auto_723873 ?auto_723878 ) ) ( not ( = ?auto_723873 ?auto_723879 ) ) ( not ( = ?auto_723873 ?auto_723880 ) ) ( not ( = ?auto_723873 ?auto_723881 ) ) ( not ( = ?auto_723873 ?auto_723882 ) ) ( not ( = ?auto_723873 ?auto_723883 ) ) ( not ( = ?auto_723873 ?auto_723884 ) ) ( not ( = ?auto_723873 ?auto_723885 ) ) ( not ( = ?auto_723873 ?auto_723886 ) ) ( not ( = ?auto_723873 ?auto_723887 ) ) ( not ( = ?auto_723873 ?auto_723888 ) ) ( not ( = ?auto_723874 ?auto_723875 ) ) ( not ( = ?auto_723874 ?auto_723876 ) ) ( not ( = ?auto_723874 ?auto_723877 ) ) ( not ( = ?auto_723874 ?auto_723878 ) ) ( not ( = ?auto_723874 ?auto_723879 ) ) ( not ( = ?auto_723874 ?auto_723880 ) ) ( not ( = ?auto_723874 ?auto_723881 ) ) ( not ( = ?auto_723874 ?auto_723882 ) ) ( not ( = ?auto_723874 ?auto_723883 ) ) ( not ( = ?auto_723874 ?auto_723884 ) ) ( not ( = ?auto_723874 ?auto_723885 ) ) ( not ( = ?auto_723874 ?auto_723886 ) ) ( not ( = ?auto_723874 ?auto_723887 ) ) ( not ( = ?auto_723874 ?auto_723888 ) ) ( not ( = ?auto_723875 ?auto_723876 ) ) ( not ( = ?auto_723875 ?auto_723877 ) ) ( not ( = ?auto_723875 ?auto_723878 ) ) ( not ( = ?auto_723875 ?auto_723879 ) ) ( not ( = ?auto_723875 ?auto_723880 ) ) ( not ( = ?auto_723875 ?auto_723881 ) ) ( not ( = ?auto_723875 ?auto_723882 ) ) ( not ( = ?auto_723875 ?auto_723883 ) ) ( not ( = ?auto_723875 ?auto_723884 ) ) ( not ( = ?auto_723875 ?auto_723885 ) ) ( not ( = ?auto_723875 ?auto_723886 ) ) ( not ( = ?auto_723875 ?auto_723887 ) ) ( not ( = ?auto_723875 ?auto_723888 ) ) ( not ( = ?auto_723876 ?auto_723877 ) ) ( not ( = ?auto_723876 ?auto_723878 ) ) ( not ( = ?auto_723876 ?auto_723879 ) ) ( not ( = ?auto_723876 ?auto_723880 ) ) ( not ( = ?auto_723876 ?auto_723881 ) ) ( not ( = ?auto_723876 ?auto_723882 ) ) ( not ( = ?auto_723876 ?auto_723883 ) ) ( not ( = ?auto_723876 ?auto_723884 ) ) ( not ( = ?auto_723876 ?auto_723885 ) ) ( not ( = ?auto_723876 ?auto_723886 ) ) ( not ( = ?auto_723876 ?auto_723887 ) ) ( not ( = ?auto_723876 ?auto_723888 ) ) ( not ( = ?auto_723877 ?auto_723878 ) ) ( not ( = ?auto_723877 ?auto_723879 ) ) ( not ( = ?auto_723877 ?auto_723880 ) ) ( not ( = ?auto_723877 ?auto_723881 ) ) ( not ( = ?auto_723877 ?auto_723882 ) ) ( not ( = ?auto_723877 ?auto_723883 ) ) ( not ( = ?auto_723877 ?auto_723884 ) ) ( not ( = ?auto_723877 ?auto_723885 ) ) ( not ( = ?auto_723877 ?auto_723886 ) ) ( not ( = ?auto_723877 ?auto_723887 ) ) ( not ( = ?auto_723877 ?auto_723888 ) ) ( not ( = ?auto_723878 ?auto_723879 ) ) ( not ( = ?auto_723878 ?auto_723880 ) ) ( not ( = ?auto_723878 ?auto_723881 ) ) ( not ( = ?auto_723878 ?auto_723882 ) ) ( not ( = ?auto_723878 ?auto_723883 ) ) ( not ( = ?auto_723878 ?auto_723884 ) ) ( not ( = ?auto_723878 ?auto_723885 ) ) ( not ( = ?auto_723878 ?auto_723886 ) ) ( not ( = ?auto_723878 ?auto_723887 ) ) ( not ( = ?auto_723878 ?auto_723888 ) ) ( not ( = ?auto_723879 ?auto_723880 ) ) ( not ( = ?auto_723879 ?auto_723881 ) ) ( not ( = ?auto_723879 ?auto_723882 ) ) ( not ( = ?auto_723879 ?auto_723883 ) ) ( not ( = ?auto_723879 ?auto_723884 ) ) ( not ( = ?auto_723879 ?auto_723885 ) ) ( not ( = ?auto_723879 ?auto_723886 ) ) ( not ( = ?auto_723879 ?auto_723887 ) ) ( not ( = ?auto_723879 ?auto_723888 ) ) ( not ( = ?auto_723880 ?auto_723881 ) ) ( not ( = ?auto_723880 ?auto_723882 ) ) ( not ( = ?auto_723880 ?auto_723883 ) ) ( not ( = ?auto_723880 ?auto_723884 ) ) ( not ( = ?auto_723880 ?auto_723885 ) ) ( not ( = ?auto_723880 ?auto_723886 ) ) ( not ( = ?auto_723880 ?auto_723887 ) ) ( not ( = ?auto_723880 ?auto_723888 ) ) ( not ( = ?auto_723881 ?auto_723882 ) ) ( not ( = ?auto_723881 ?auto_723883 ) ) ( not ( = ?auto_723881 ?auto_723884 ) ) ( not ( = ?auto_723881 ?auto_723885 ) ) ( not ( = ?auto_723881 ?auto_723886 ) ) ( not ( = ?auto_723881 ?auto_723887 ) ) ( not ( = ?auto_723881 ?auto_723888 ) ) ( not ( = ?auto_723882 ?auto_723883 ) ) ( not ( = ?auto_723882 ?auto_723884 ) ) ( not ( = ?auto_723882 ?auto_723885 ) ) ( not ( = ?auto_723882 ?auto_723886 ) ) ( not ( = ?auto_723882 ?auto_723887 ) ) ( not ( = ?auto_723882 ?auto_723888 ) ) ( not ( = ?auto_723883 ?auto_723884 ) ) ( not ( = ?auto_723883 ?auto_723885 ) ) ( not ( = ?auto_723883 ?auto_723886 ) ) ( not ( = ?auto_723883 ?auto_723887 ) ) ( not ( = ?auto_723883 ?auto_723888 ) ) ( not ( = ?auto_723884 ?auto_723885 ) ) ( not ( = ?auto_723884 ?auto_723886 ) ) ( not ( = ?auto_723884 ?auto_723887 ) ) ( not ( = ?auto_723884 ?auto_723888 ) ) ( not ( = ?auto_723885 ?auto_723886 ) ) ( not ( = ?auto_723885 ?auto_723887 ) ) ( not ( = ?auto_723885 ?auto_723888 ) ) ( not ( = ?auto_723886 ?auto_723887 ) ) ( not ( = ?auto_723886 ?auto_723888 ) ) ( not ( = ?auto_723887 ?auto_723888 ) ) ( ON ?auto_723887 ?auto_723888 ) ( ON ?auto_723886 ?auto_723887 ) ( ON ?auto_723885 ?auto_723886 ) ( CLEAR ?auto_723883 ) ( ON ?auto_723884 ?auto_723885 ) ( CLEAR ?auto_723884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_723872 ?auto_723873 ?auto_723874 ?auto_723875 ?auto_723876 ?auto_723877 ?auto_723878 ?auto_723879 ?auto_723880 ?auto_723881 ?auto_723882 ?auto_723883 ?auto_723884 )
      ( MAKE-17PILE ?auto_723872 ?auto_723873 ?auto_723874 ?auto_723875 ?auto_723876 ?auto_723877 ?auto_723878 ?auto_723879 ?auto_723880 ?auto_723881 ?auto_723882 ?auto_723883 ?auto_723884 ?auto_723885 ?auto_723886 ?auto_723887 ?auto_723888 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723906 - BLOCK
      ?auto_723907 - BLOCK
      ?auto_723908 - BLOCK
      ?auto_723909 - BLOCK
      ?auto_723910 - BLOCK
      ?auto_723911 - BLOCK
      ?auto_723912 - BLOCK
      ?auto_723913 - BLOCK
      ?auto_723914 - BLOCK
      ?auto_723915 - BLOCK
      ?auto_723916 - BLOCK
      ?auto_723917 - BLOCK
      ?auto_723918 - BLOCK
      ?auto_723919 - BLOCK
      ?auto_723920 - BLOCK
      ?auto_723921 - BLOCK
      ?auto_723922 - BLOCK
    )
    :vars
    (
      ?auto_723923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723922 ?auto_723923 ) ( ON-TABLE ?auto_723906 ) ( ON ?auto_723907 ?auto_723906 ) ( ON ?auto_723908 ?auto_723907 ) ( ON ?auto_723909 ?auto_723908 ) ( ON ?auto_723910 ?auto_723909 ) ( ON ?auto_723911 ?auto_723910 ) ( ON ?auto_723912 ?auto_723911 ) ( ON ?auto_723913 ?auto_723912 ) ( ON ?auto_723914 ?auto_723913 ) ( ON ?auto_723915 ?auto_723914 ) ( ON ?auto_723916 ?auto_723915 ) ( not ( = ?auto_723906 ?auto_723907 ) ) ( not ( = ?auto_723906 ?auto_723908 ) ) ( not ( = ?auto_723906 ?auto_723909 ) ) ( not ( = ?auto_723906 ?auto_723910 ) ) ( not ( = ?auto_723906 ?auto_723911 ) ) ( not ( = ?auto_723906 ?auto_723912 ) ) ( not ( = ?auto_723906 ?auto_723913 ) ) ( not ( = ?auto_723906 ?auto_723914 ) ) ( not ( = ?auto_723906 ?auto_723915 ) ) ( not ( = ?auto_723906 ?auto_723916 ) ) ( not ( = ?auto_723906 ?auto_723917 ) ) ( not ( = ?auto_723906 ?auto_723918 ) ) ( not ( = ?auto_723906 ?auto_723919 ) ) ( not ( = ?auto_723906 ?auto_723920 ) ) ( not ( = ?auto_723906 ?auto_723921 ) ) ( not ( = ?auto_723906 ?auto_723922 ) ) ( not ( = ?auto_723906 ?auto_723923 ) ) ( not ( = ?auto_723907 ?auto_723908 ) ) ( not ( = ?auto_723907 ?auto_723909 ) ) ( not ( = ?auto_723907 ?auto_723910 ) ) ( not ( = ?auto_723907 ?auto_723911 ) ) ( not ( = ?auto_723907 ?auto_723912 ) ) ( not ( = ?auto_723907 ?auto_723913 ) ) ( not ( = ?auto_723907 ?auto_723914 ) ) ( not ( = ?auto_723907 ?auto_723915 ) ) ( not ( = ?auto_723907 ?auto_723916 ) ) ( not ( = ?auto_723907 ?auto_723917 ) ) ( not ( = ?auto_723907 ?auto_723918 ) ) ( not ( = ?auto_723907 ?auto_723919 ) ) ( not ( = ?auto_723907 ?auto_723920 ) ) ( not ( = ?auto_723907 ?auto_723921 ) ) ( not ( = ?auto_723907 ?auto_723922 ) ) ( not ( = ?auto_723907 ?auto_723923 ) ) ( not ( = ?auto_723908 ?auto_723909 ) ) ( not ( = ?auto_723908 ?auto_723910 ) ) ( not ( = ?auto_723908 ?auto_723911 ) ) ( not ( = ?auto_723908 ?auto_723912 ) ) ( not ( = ?auto_723908 ?auto_723913 ) ) ( not ( = ?auto_723908 ?auto_723914 ) ) ( not ( = ?auto_723908 ?auto_723915 ) ) ( not ( = ?auto_723908 ?auto_723916 ) ) ( not ( = ?auto_723908 ?auto_723917 ) ) ( not ( = ?auto_723908 ?auto_723918 ) ) ( not ( = ?auto_723908 ?auto_723919 ) ) ( not ( = ?auto_723908 ?auto_723920 ) ) ( not ( = ?auto_723908 ?auto_723921 ) ) ( not ( = ?auto_723908 ?auto_723922 ) ) ( not ( = ?auto_723908 ?auto_723923 ) ) ( not ( = ?auto_723909 ?auto_723910 ) ) ( not ( = ?auto_723909 ?auto_723911 ) ) ( not ( = ?auto_723909 ?auto_723912 ) ) ( not ( = ?auto_723909 ?auto_723913 ) ) ( not ( = ?auto_723909 ?auto_723914 ) ) ( not ( = ?auto_723909 ?auto_723915 ) ) ( not ( = ?auto_723909 ?auto_723916 ) ) ( not ( = ?auto_723909 ?auto_723917 ) ) ( not ( = ?auto_723909 ?auto_723918 ) ) ( not ( = ?auto_723909 ?auto_723919 ) ) ( not ( = ?auto_723909 ?auto_723920 ) ) ( not ( = ?auto_723909 ?auto_723921 ) ) ( not ( = ?auto_723909 ?auto_723922 ) ) ( not ( = ?auto_723909 ?auto_723923 ) ) ( not ( = ?auto_723910 ?auto_723911 ) ) ( not ( = ?auto_723910 ?auto_723912 ) ) ( not ( = ?auto_723910 ?auto_723913 ) ) ( not ( = ?auto_723910 ?auto_723914 ) ) ( not ( = ?auto_723910 ?auto_723915 ) ) ( not ( = ?auto_723910 ?auto_723916 ) ) ( not ( = ?auto_723910 ?auto_723917 ) ) ( not ( = ?auto_723910 ?auto_723918 ) ) ( not ( = ?auto_723910 ?auto_723919 ) ) ( not ( = ?auto_723910 ?auto_723920 ) ) ( not ( = ?auto_723910 ?auto_723921 ) ) ( not ( = ?auto_723910 ?auto_723922 ) ) ( not ( = ?auto_723910 ?auto_723923 ) ) ( not ( = ?auto_723911 ?auto_723912 ) ) ( not ( = ?auto_723911 ?auto_723913 ) ) ( not ( = ?auto_723911 ?auto_723914 ) ) ( not ( = ?auto_723911 ?auto_723915 ) ) ( not ( = ?auto_723911 ?auto_723916 ) ) ( not ( = ?auto_723911 ?auto_723917 ) ) ( not ( = ?auto_723911 ?auto_723918 ) ) ( not ( = ?auto_723911 ?auto_723919 ) ) ( not ( = ?auto_723911 ?auto_723920 ) ) ( not ( = ?auto_723911 ?auto_723921 ) ) ( not ( = ?auto_723911 ?auto_723922 ) ) ( not ( = ?auto_723911 ?auto_723923 ) ) ( not ( = ?auto_723912 ?auto_723913 ) ) ( not ( = ?auto_723912 ?auto_723914 ) ) ( not ( = ?auto_723912 ?auto_723915 ) ) ( not ( = ?auto_723912 ?auto_723916 ) ) ( not ( = ?auto_723912 ?auto_723917 ) ) ( not ( = ?auto_723912 ?auto_723918 ) ) ( not ( = ?auto_723912 ?auto_723919 ) ) ( not ( = ?auto_723912 ?auto_723920 ) ) ( not ( = ?auto_723912 ?auto_723921 ) ) ( not ( = ?auto_723912 ?auto_723922 ) ) ( not ( = ?auto_723912 ?auto_723923 ) ) ( not ( = ?auto_723913 ?auto_723914 ) ) ( not ( = ?auto_723913 ?auto_723915 ) ) ( not ( = ?auto_723913 ?auto_723916 ) ) ( not ( = ?auto_723913 ?auto_723917 ) ) ( not ( = ?auto_723913 ?auto_723918 ) ) ( not ( = ?auto_723913 ?auto_723919 ) ) ( not ( = ?auto_723913 ?auto_723920 ) ) ( not ( = ?auto_723913 ?auto_723921 ) ) ( not ( = ?auto_723913 ?auto_723922 ) ) ( not ( = ?auto_723913 ?auto_723923 ) ) ( not ( = ?auto_723914 ?auto_723915 ) ) ( not ( = ?auto_723914 ?auto_723916 ) ) ( not ( = ?auto_723914 ?auto_723917 ) ) ( not ( = ?auto_723914 ?auto_723918 ) ) ( not ( = ?auto_723914 ?auto_723919 ) ) ( not ( = ?auto_723914 ?auto_723920 ) ) ( not ( = ?auto_723914 ?auto_723921 ) ) ( not ( = ?auto_723914 ?auto_723922 ) ) ( not ( = ?auto_723914 ?auto_723923 ) ) ( not ( = ?auto_723915 ?auto_723916 ) ) ( not ( = ?auto_723915 ?auto_723917 ) ) ( not ( = ?auto_723915 ?auto_723918 ) ) ( not ( = ?auto_723915 ?auto_723919 ) ) ( not ( = ?auto_723915 ?auto_723920 ) ) ( not ( = ?auto_723915 ?auto_723921 ) ) ( not ( = ?auto_723915 ?auto_723922 ) ) ( not ( = ?auto_723915 ?auto_723923 ) ) ( not ( = ?auto_723916 ?auto_723917 ) ) ( not ( = ?auto_723916 ?auto_723918 ) ) ( not ( = ?auto_723916 ?auto_723919 ) ) ( not ( = ?auto_723916 ?auto_723920 ) ) ( not ( = ?auto_723916 ?auto_723921 ) ) ( not ( = ?auto_723916 ?auto_723922 ) ) ( not ( = ?auto_723916 ?auto_723923 ) ) ( not ( = ?auto_723917 ?auto_723918 ) ) ( not ( = ?auto_723917 ?auto_723919 ) ) ( not ( = ?auto_723917 ?auto_723920 ) ) ( not ( = ?auto_723917 ?auto_723921 ) ) ( not ( = ?auto_723917 ?auto_723922 ) ) ( not ( = ?auto_723917 ?auto_723923 ) ) ( not ( = ?auto_723918 ?auto_723919 ) ) ( not ( = ?auto_723918 ?auto_723920 ) ) ( not ( = ?auto_723918 ?auto_723921 ) ) ( not ( = ?auto_723918 ?auto_723922 ) ) ( not ( = ?auto_723918 ?auto_723923 ) ) ( not ( = ?auto_723919 ?auto_723920 ) ) ( not ( = ?auto_723919 ?auto_723921 ) ) ( not ( = ?auto_723919 ?auto_723922 ) ) ( not ( = ?auto_723919 ?auto_723923 ) ) ( not ( = ?auto_723920 ?auto_723921 ) ) ( not ( = ?auto_723920 ?auto_723922 ) ) ( not ( = ?auto_723920 ?auto_723923 ) ) ( not ( = ?auto_723921 ?auto_723922 ) ) ( not ( = ?auto_723921 ?auto_723923 ) ) ( not ( = ?auto_723922 ?auto_723923 ) ) ( ON ?auto_723921 ?auto_723922 ) ( ON ?auto_723920 ?auto_723921 ) ( ON ?auto_723919 ?auto_723920 ) ( ON ?auto_723918 ?auto_723919 ) ( CLEAR ?auto_723916 ) ( ON ?auto_723917 ?auto_723918 ) ( CLEAR ?auto_723917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_723906 ?auto_723907 ?auto_723908 ?auto_723909 ?auto_723910 ?auto_723911 ?auto_723912 ?auto_723913 ?auto_723914 ?auto_723915 ?auto_723916 ?auto_723917 )
      ( MAKE-17PILE ?auto_723906 ?auto_723907 ?auto_723908 ?auto_723909 ?auto_723910 ?auto_723911 ?auto_723912 ?auto_723913 ?auto_723914 ?auto_723915 ?auto_723916 ?auto_723917 ?auto_723918 ?auto_723919 ?auto_723920 ?auto_723921 ?auto_723922 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723941 - BLOCK
      ?auto_723942 - BLOCK
      ?auto_723943 - BLOCK
      ?auto_723944 - BLOCK
      ?auto_723945 - BLOCK
      ?auto_723946 - BLOCK
      ?auto_723947 - BLOCK
      ?auto_723948 - BLOCK
      ?auto_723949 - BLOCK
      ?auto_723950 - BLOCK
      ?auto_723951 - BLOCK
      ?auto_723952 - BLOCK
      ?auto_723953 - BLOCK
      ?auto_723954 - BLOCK
      ?auto_723955 - BLOCK
      ?auto_723956 - BLOCK
      ?auto_723957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_723957 ) ( ON-TABLE ?auto_723941 ) ( ON ?auto_723942 ?auto_723941 ) ( ON ?auto_723943 ?auto_723942 ) ( ON ?auto_723944 ?auto_723943 ) ( ON ?auto_723945 ?auto_723944 ) ( ON ?auto_723946 ?auto_723945 ) ( ON ?auto_723947 ?auto_723946 ) ( ON ?auto_723948 ?auto_723947 ) ( ON ?auto_723949 ?auto_723948 ) ( ON ?auto_723950 ?auto_723949 ) ( ON ?auto_723951 ?auto_723950 ) ( not ( = ?auto_723941 ?auto_723942 ) ) ( not ( = ?auto_723941 ?auto_723943 ) ) ( not ( = ?auto_723941 ?auto_723944 ) ) ( not ( = ?auto_723941 ?auto_723945 ) ) ( not ( = ?auto_723941 ?auto_723946 ) ) ( not ( = ?auto_723941 ?auto_723947 ) ) ( not ( = ?auto_723941 ?auto_723948 ) ) ( not ( = ?auto_723941 ?auto_723949 ) ) ( not ( = ?auto_723941 ?auto_723950 ) ) ( not ( = ?auto_723941 ?auto_723951 ) ) ( not ( = ?auto_723941 ?auto_723952 ) ) ( not ( = ?auto_723941 ?auto_723953 ) ) ( not ( = ?auto_723941 ?auto_723954 ) ) ( not ( = ?auto_723941 ?auto_723955 ) ) ( not ( = ?auto_723941 ?auto_723956 ) ) ( not ( = ?auto_723941 ?auto_723957 ) ) ( not ( = ?auto_723942 ?auto_723943 ) ) ( not ( = ?auto_723942 ?auto_723944 ) ) ( not ( = ?auto_723942 ?auto_723945 ) ) ( not ( = ?auto_723942 ?auto_723946 ) ) ( not ( = ?auto_723942 ?auto_723947 ) ) ( not ( = ?auto_723942 ?auto_723948 ) ) ( not ( = ?auto_723942 ?auto_723949 ) ) ( not ( = ?auto_723942 ?auto_723950 ) ) ( not ( = ?auto_723942 ?auto_723951 ) ) ( not ( = ?auto_723942 ?auto_723952 ) ) ( not ( = ?auto_723942 ?auto_723953 ) ) ( not ( = ?auto_723942 ?auto_723954 ) ) ( not ( = ?auto_723942 ?auto_723955 ) ) ( not ( = ?auto_723942 ?auto_723956 ) ) ( not ( = ?auto_723942 ?auto_723957 ) ) ( not ( = ?auto_723943 ?auto_723944 ) ) ( not ( = ?auto_723943 ?auto_723945 ) ) ( not ( = ?auto_723943 ?auto_723946 ) ) ( not ( = ?auto_723943 ?auto_723947 ) ) ( not ( = ?auto_723943 ?auto_723948 ) ) ( not ( = ?auto_723943 ?auto_723949 ) ) ( not ( = ?auto_723943 ?auto_723950 ) ) ( not ( = ?auto_723943 ?auto_723951 ) ) ( not ( = ?auto_723943 ?auto_723952 ) ) ( not ( = ?auto_723943 ?auto_723953 ) ) ( not ( = ?auto_723943 ?auto_723954 ) ) ( not ( = ?auto_723943 ?auto_723955 ) ) ( not ( = ?auto_723943 ?auto_723956 ) ) ( not ( = ?auto_723943 ?auto_723957 ) ) ( not ( = ?auto_723944 ?auto_723945 ) ) ( not ( = ?auto_723944 ?auto_723946 ) ) ( not ( = ?auto_723944 ?auto_723947 ) ) ( not ( = ?auto_723944 ?auto_723948 ) ) ( not ( = ?auto_723944 ?auto_723949 ) ) ( not ( = ?auto_723944 ?auto_723950 ) ) ( not ( = ?auto_723944 ?auto_723951 ) ) ( not ( = ?auto_723944 ?auto_723952 ) ) ( not ( = ?auto_723944 ?auto_723953 ) ) ( not ( = ?auto_723944 ?auto_723954 ) ) ( not ( = ?auto_723944 ?auto_723955 ) ) ( not ( = ?auto_723944 ?auto_723956 ) ) ( not ( = ?auto_723944 ?auto_723957 ) ) ( not ( = ?auto_723945 ?auto_723946 ) ) ( not ( = ?auto_723945 ?auto_723947 ) ) ( not ( = ?auto_723945 ?auto_723948 ) ) ( not ( = ?auto_723945 ?auto_723949 ) ) ( not ( = ?auto_723945 ?auto_723950 ) ) ( not ( = ?auto_723945 ?auto_723951 ) ) ( not ( = ?auto_723945 ?auto_723952 ) ) ( not ( = ?auto_723945 ?auto_723953 ) ) ( not ( = ?auto_723945 ?auto_723954 ) ) ( not ( = ?auto_723945 ?auto_723955 ) ) ( not ( = ?auto_723945 ?auto_723956 ) ) ( not ( = ?auto_723945 ?auto_723957 ) ) ( not ( = ?auto_723946 ?auto_723947 ) ) ( not ( = ?auto_723946 ?auto_723948 ) ) ( not ( = ?auto_723946 ?auto_723949 ) ) ( not ( = ?auto_723946 ?auto_723950 ) ) ( not ( = ?auto_723946 ?auto_723951 ) ) ( not ( = ?auto_723946 ?auto_723952 ) ) ( not ( = ?auto_723946 ?auto_723953 ) ) ( not ( = ?auto_723946 ?auto_723954 ) ) ( not ( = ?auto_723946 ?auto_723955 ) ) ( not ( = ?auto_723946 ?auto_723956 ) ) ( not ( = ?auto_723946 ?auto_723957 ) ) ( not ( = ?auto_723947 ?auto_723948 ) ) ( not ( = ?auto_723947 ?auto_723949 ) ) ( not ( = ?auto_723947 ?auto_723950 ) ) ( not ( = ?auto_723947 ?auto_723951 ) ) ( not ( = ?auto_723947 ?auto_723952 ) ) ( not ( = ?auto_723947 ?auto_723953 ) ) ( not ( = ?auto_723947 ?auto_723954 ) ) ( not ( = ?auto_723947 ?auto_723955 ) ) ( not ( = ?auto_723947 ?auto_723956 ) ) ( not ( = ?auto_723947 ?auto_723957 ) ) ( not ( = ?auto_723948 ?auto_723949 ) ) ( not ( = ?auto_723948 ?auto_723950 ) ) ( not ( = ?auto_723948 ?auto_723951 ) ) ( not ( = ?auto_723948 ?auto_723952 ) ) ( not ( = ?auto_723948 ?auto_723953 ) ) ( not ( = ?auto_723948 ?auto_723954 ) ) ( not ( = ?auto_723948 ?auto_723955 ) ) ( not ( = ?auto_723948 ?auto_723956 ) ) ( not ( = ?auto_723948 ?auto_723957 ) ) ( not ( = ?auto_723949 ?auto_723950 ) ) ( not ( = ?auto_723949 ?auto_723951 ) ) ( not ( = ?auto_723949 ?auto_723952 ) ) ( not ( = ?auto_723949 ?auto_723953 ) ) ( not ( = ?auto_723949 ?auto_723954 ) ) ( not ( = ?auto_723949 ?auto_723955 ) ) ( not ( = ?auto_723949 ?auto_723956 ) ) ( not ( = ?auto_723949 ?auto_723957 ) ) ( not ( = ?auto_723950 ?auto_723951 ) ) ( not ( = ?auto_723950 ?auto_723952 ) ) ( not ( = ?auto_723950 ?auto_723953 ) ) ( not ( = ?auto_723950 ?auto_723954 ) ) ( not ( = ?auto_723950 ?auto_723955 ) ) ( not ( = ?auto_723950 ?auto_723956 ) ) ( not ( = ?auto_723950 ?auto_723957 ) ) ( not ( = ?auto_723951 ?auto_723952 ) ) ( not ( = ?auto_723951 ?auto_723953 ) ) ( not ( = ?auto_723951 ?auto_723954 ) ) ( not ( = ?auto_723951 ?auto_723955 ) ) ( not ( = ?auto_723951 ?auto_723956 ) ) ( not ( = ?auto_723951 ?auto_723957 ) ) ( not ( = ?auto_723952 ?auto_723953 ) ) ( not ( = ?auto_723952 ?auto_723954 ) ) ( not ( = ?auto_723952 ?auto_723955 ) ) ( not ( = ?auto_723952 ?auto_723956 ) ) ( not ( = ?auto_723952 ?auto_723957 ) ) ( not ( = ?auto_723953 ?auto_723954 ) ) ( not ( = ?auto_723953 ?auto_723955 ) ) ( not ( = ?auto_723953 ?auto_723956 ) ) ( not ( = ?auto_723953 ?auto_723957 ) ) ( not ( = ?auto_723954 ?auto_723955 ) ) ( not ( = ?auto_723954 ?auto_723956 ) ) ( not ( = ?auto_723954 ?auto_723957 ) ) ( not ( = ?auto_723955 ?auto_723956 ) ) ( not ( = ?auto_723955 ?auto_723957 ) ) ( not ( = ?auto_723956 ?auto_723957 ) ) ( ON ?auto_723956 ?auto_723957 ) ( ON ?auto_723955 ?auto_723956 ) ( ON ?auto_723954 ?auto_723955 ) ( ON ?auto_723953 ?auto_723954 ) ( CLEAR ?auto_723951 ) ( ON ?auto_723952 ?auto_723953 ) ( CLEAR ?auto_723952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_723941 ?auto_723942 ?auto_723943 ?auto_723944 ?auto_723945 ?auto_723946 ?auto_723947 ?auto_723948 ?auto_723949 ?auto_723950 ?auto_723951 ?auto_723952 )
      ( MAKE-17PILE ?auto_723941 ?auto_723942 ?auto_723943 ?auto_723944 ?auto_723945 ?auto_723946 ?auto_723947 ?auto_723948 ?auto_723949 ?auto_723950 ?auto_723951 ?auto_723952 ?auto_723953 ?auto_723954 ?auto_723955 ?auto_723956 ?auto_723957 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_723975 - BLOCK
      ?auto_723976 - BLOCK
      ?auto_723977 - BLOCK
      ?auto_723978 - BLOCK
      ?auto_723979 - BLOCK
      ?auto_723980 - BLOCK
      ?auto_723981 - BLOCK
      ?auto_723982 - BLOCK
      ?auto_723983 - BLOCK
      ?auto_723984 - BLOCK
      ?auto_723985 - BLOCK
      ?auto_723986 - BLOCK
      ?auto_723987 - BLOCK
      ?auto_723988 - BLOCK
      ?auto_723989 - BLOCK
      ?auto_723990 - BLOCK
      ?auto_723991 - BLOCK
    )
    :vars
    (
      ?auto_723992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_723991 ?auto_723992 ) ( ON-TABLE ?auto_723975 ) ( ON ?auto_723976 ?auto_723975 ) ( ON ?auto_723977 ?auto_723976 ) ( ON ?auto_723978 ?auto_723977 ) ( ON ?auto_723979 ?auto_723978 ) ( ON ?auto_723980 ?auto_723979 ) ( ON ?auto_723981 ?auto_723980 ) ( ON ?auto_723982 ?auto_723981 ) ( ON ?auto_723983 ?auto_723982 ) ( ON ?auto_723984 ?auto_723983 ) ( not ( = ?auto_723975 ?auto_723976 ) ) ( not ( = ?auto_723975 ?auto_723977 ) ) ( not ( = ?auto_723975 ?auto_723978 ) ) ( not ( = ?auto_723975 ?auto_723979 ) ) ( not ( = ?auto_723975 ?auto_723980 ) ) ( not ( = ?auto_723975 ?auto_723981 ) ) ( not ( = ?auto_723975 ?auto_723982 ) ) ( not ( = ?auto_723975 ?auto_723983 ) ) ( not ( = ?auto_723975 ?auto_723984 ) ) ( not ( = ?auto_723975 ?auto_723985 ) ) ( not ( = ?auto_723975 ?auto_723986 ) ) ( not ( = ?auto_723975 ?auto_723987 ) ) ( not ( = ?auto_723975 ?auto_723988 ) ) ( not ( = ?auto_723975 ?auto_723989 ) ) ( not ( = ?auto_723975 ?auto_723990 ) ) ( not ( = ?auto_723975 ?auto_723991 ) ) ( not ( = ?auto_723975 ?auto_723992 ) ) ( not ( = ?auto_723976 ?auto_723977 ) ) ( not ( = ?auto_723976 ?auto_723978 ) ) ( not ( = ?auto_723976 ?auto_723979 ) ) ( not ( = ?auto_723976 ?auto_723980 ) ) ( not ( = ?auto_723976 ?auto_723981 ) ) ( not ( = ?auto_723976 ?auto_723982 ) ) ( not ( = ?auto_723976 ?auto_723983 ) ) ( not ( = ?auto_723976 ?auto_723984 ) ) ( not ( = ?auto_723976 ?auto_723985 ) ) ( not ( = ?auto_723976 ?auto_723986 ) ) ( not ( = ?auto_723976 ?auto_723987 ) ) ( not ( = ?auto_723976 ?auto_723988 ) ) ( not ( = ?auto_723976 ?auto_723989 ) ) ( not ( = ?auto_723976 ?auto_723990 ) ) ( not ( = ?auto_723976 ?auto_723991 ) ) ( not ( = ?auto_723976 ?auto_723992 ) ) ( not ( = ?auto_723977 ?auto_723978 ) ) ( not ( = ?auto_723977 ?auto_723979 ) ) ( not ( = ?auto_723977 ?auto_723980 ) ) ( not ( = ?auto_723977 ?auto_723981 ) ) ( not ( = ?auto_723977 ?auto_723982 ) ) ( not ( = ?auto_723977 ?auto_723983 ) ) ( not ( = ?auto_723977 ?auto_723984 ) ) ( not ( = ?auto_723977 ?auto_723985 ) ) ( not ( = ?auto_723977 ?auto_723986 ) ) ( not ( = ?auto_723977 ?auto_723987 ) ) ( not ( = ?auto_723977 ?auto_723988 ) ) ( not ( = ?auto_723977 ?auto_723989 ) ) ( not ( = ?auto_723977 ?auto_723990 ) ) ( not ( = ?auto_723977 ?auto_723991 ) ) ( not ( = ?auto_723977 ?auto_723992 ) ) ( not ( = ?auto_723978 ?auto_723979 ) ) ( not ( = ?auto_723978 ?auto_723980 ) ) ( not ( = ?auto_723978 ?auto_723981 ) ) ( not ( = ?auto_723978 ?auto_723982 ) ) ( not ( = ?auto_723978 ?auto_723983 ) ) ( not ( = ?auto_723978 ?auto_723984 ) ) ( not ( = ?auto_723978 ?auto_723985 ) ) ( not ( = ?auto_723978 ?auto_723986 ) ) ( not ( = ?auto_723978 ?auto_723987 ) ) ( not ( = ?auto_723978 ?auto_723988 ) ) ( not ( = ?auto_723978 ?auto_723989 ) ) ( not ( = ?auto_723978 ?auto_723990 ) ) ( not ( = ?auto_723978 ?auto_723991 ) ) ( not ( = ?auto_723978 ?auto_723992 ) ) ( not ( = ?auto_723979 ?auto_723980 ) ) ( not ( = ?auto_723979 ?auto_723981 ) ) ( not ( = ?auto_723979 ?auto_723982 ) ) ( not ( = ?auto_723979 ?auto_723983 ) ) ( not ( = ?auto_723979 ?auto_723984 ) ) ( not ( = ?auto_723979 ?auto_723985 ) ) ( not ( = ?auto_723979 ?auto_723986 ) ) ( not ( = ?auto_723979 ?auto_723987 ) ) ( not ( = ?auto_723979 ?auto_723988 ) ) ( not ( = ?auto_723979 ?auto_723989 ) ) ( not ( = ?auto_723979 ?auto_723990 ) ) ( not ( = ?auto_723979 ?auto_723991 ) ) ( not ( = ?auto_723979 ?auto_723992 ) ) ( not ( = ?auto_723980 ?auto_723981 ) ) ( not ( = ?auto_723980 ?auto_723982 ) ) ( not ( = ?auto_723980 ?auto_723983 ) ) ( not ( = ?auto_723980 ?auto_723984 ) ) ( not ( = ?auto_723980 ?auto_723985 ) ) ( not ( = ?auto_723980 ?auto_723986 ) ) ( not ( = ?auto_723980 ?auto_723987 ) ) ( not ( = ?auto_723980 ?auto_723988 ) ) ( not ( = ?auto_723980 ?auto_723989 ) ) ( not ( = ?auto_723980 ?auto_723990 ) ) ( not ( = ?auto_723980 ?auto_723991 ) ) ( not ( = ?auto_723980 ?auto_723992 ) ) ( not ( = ?auto_723981 ?auto_723982 ) ) ( not ( = ?auto_723981 ?auto_723983 ) ) ( not ( = ?auto_723981 ?auto_723984 ) ) ( not ( = ?auto_723981 ?auto_723985 ) ) ( not ( = ?auto_723981 ?auto_723986 ) ) ( not ( = ?auto_723981 ?auto_723987 ) ) ( not ( = ?auto_723981 ?auto_723988 ) ) ( not ( = ?auto_723981 ?auto_723989 ) ) ( not ( = ?auto_723981 ?auto_723990 ) ) ( not ( = ?auto_723981 ?auto_723991 ) ) ( not ( = ?auto_723981 ?auto_723992 ) ) ( not ( = ?auto_723982 ?auto_723983 ) ) ( not ( = ?auto_723982 ?auto_723984 ) ) ( not ( = ?auto_723982 ?auto_723985 ) ) ( not ( = ?auto_723982 ?auto_723986 ) ) ( not ( = ?auto_723982 ?auto_723987 ) ) ( not ( = ?auto_723982 ?auto_723988 ) ) ( not ( = ?auto_723982 ?auto_723989 ) ) ( not ( = ?auto_723982 ?auto_723990 ) ) ( not ( = ?auto_723982 ?auto_723991 ) ) ( not ( = ?auto_723982 ?auto_723992 ) ) ( not ( = ?auto_723983 ?auto_723984 ) ) ( not ( = ?auto_723983 ?auto_723985 ) ) ( not ( = ?auto_723983 ?auto_723986 ) ) ( not ( = ?auto_723983 ?auto_723987 ) ) ( not ( = ?auto_723983 ?auto_723988 ) ) ( not ( = ?auto_723983 ?auto_723989 ) ) ( not ( = ?auto_723983 ?auto_723990 ) ) ( not ( = ?auto_723983 ?auto_723991 ) ) ( not ( = ?auto_723983 ?auto_723992 ) ) ( not ( = ?auto_723984 ?auto_723985 ) ) ( not ( = ?auto_723984 ?auto_723986 ) ) ( not ( = ?auto_723984 ?auto_723987 ) ) ( not ( = ?auto_723984 ?auto_723988 ) ) ( not ( = ?auto_723984 ?auto_723989 ) ) ( not ( = ?auto_723984 ?auto_723990 ) ) ( not ( = ?auto_723984 ?auto_723991 ) ) ( not ( = ?auto_723984 ?auto_723992 ) ) ( not ( = ?auto_723985 ?auto_723986 ) ) ( not ( = ?auto_723985 ?auto_723987 ) ) ( not ( = ?auto_723985 ?auto_723988 ) ) ( not ( = ?auto_723985 ?auto_723989 ) ) ( not ( = ?auto_723985 ?auto_723990 ) ) ( not ( = ?auto_723985 ?auto_723991 ) ) ( not ( = ?auto_723985 ?auto_723992 ) ) ( not ( = ?auto_723986 ?auto_723987 ) ) ( not ( = ?auto_723986 ?auto_723988 ) ) ( not ( = ?auto_723986 ?auto_723989 ) ) ( not ( = ?auto_723986 ?auto_723990 ) ) ( not ( = ?auto_723986 ?auto_723991 ) ) ( not ( = ?auto_723986 ?auto_723992 ) ) ( not ( = ?auto_723987 ?auto_723988 ) ) ( not ( = ?auto_723987 ?auto_723989 ) ) ( not ( = ?auto_723987 ?auto_723990 ) ) ( not ( = ?auto_723987 ?auto_723991 ) ) ( not ( = ?auto_723987 ?auto_723992 ) ) ( not ( = ?auto_723988 ?auto_723989 ) ) ( not ( = ?auto_723988 ?auto_723990 ) ) ( not ( = ?auto_723988 ?auto_723991 ) ) ( not ( = ?auto_723988 ?auto_723992 ) ) ( not ( = ?auto_723989 ?auto_723990 ) ) ( not ( = ?auto_723989 ?auto_723991 ) ) ( not ( = ?auto_723989 ?auto_723992 ) ) ( not ( = ?auto_723990 ?auto_723991 ) ) ( not ( = ?auto_723990 ?auto_723992 ) ) ( not ( = ?auto_723991 ?auto_723992 ) ) ( ON ?auto_723990 ?auto_723991 ) ( ON ?auto_723989 ?auto_723990 ) ( ON ?auto_723988 ?auto_723989 ) ( ON ?auto_723987 ?auto_723988 ) ( ON ?auto_723986 ?auto_723987 ) ( CLEAR ?auto_723984 ) ( ON ?auto_723985 ?auto_723986 ) ( CLEAR ?auto_723985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_723975 ?auto_723976 ?auto_723977 ?auto_723978 ?auto_723979 ?auto_723980 ?auto_723981 ?auto_723982 ?auto_723983 ?auto_723984 ?auto_723985 )
      ( MAKE-17PILE ?auto_723975 ?auto_723976 ?auto_723977 ?auto_723978 ?auto_723979 ?auto_723980 ?auto_723981 ?auto_723982 ?auto_723983 ?auto_723984 ?auto_723985 ?auto_723986 ?auto_723987 ?auto_723988 ?auto_723989 ?auto_723990 ?auto_723991 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724010 - BLOCK
      ?auto_724011 - BLOCK
      ?auto_724012 - BLOCK
      ?auto_724013 - BLOCK
      ?auto_724014 - BLOCK
      ?auto_724015 - BLOCK
      ?auto_724016 - BLOCK
      ?auto_724017 - BLOCK
      ?auto_724018 - BLOCK
      ?auto_724019 - BLOCK
      ?auto_724020 - BLOCK
      ?auto_724021 - BLOCK
      ?auto_724022 - BLOCK
      ?auto_724023 - BLOCK
      ?auto_724024 - BLOCK
      ?auto_724025 - BLOCK
      ?auto_724026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724026 ) ( ON-TABLE ?auto_724010 ) ( ON ?auto_724011 ?auto_724010 ) ( ON ?auto_724012 ?auto_724011 ) ( ON ?auto_724013 ?auto_724012 ) ( ON ?auto_724014 ?auto_724013 ) ( ON ?auto_724015 ?auto_724014 ) ( ON ?auto_724016 ?auto_724015 ) ( ON ?auto_724017 ?auto_724016 ) ( ON ?auto_724018 ?auto_724017 ) ( ON ?auto_724019 ?auto_724018 ) ( not ( = ?auto_724010 ?auto_724011 ) ) ( not ( = ?auto_724010 ?auto_724012 ) ) ( not ( = ?auto_724010 ?auto_724013 ) ) ( not ( = ?auto_724010 ?auto_724014 ) ) ( not ( = ?auto_724010 ?auto_724015 ) ) ( not ( = ?auto_724010 ?auto_724016 ) ) ( not ( = ?auto_724010 ?auto_724017 ) ) ( not ( = ?auto_724010 ?auto_724018 ) ) ( not ( = ?auto_724010 ?auto_724019 ) ) ( not ( = ?auto_724010 ?auto_724020 ) ) ( not ( = ?auto_724010 ?auto_724021 ) ) ( not ( = ?auto_724010 ?auto_724022 ) ) ( not ( = ?auto_724010 ?auto_724023 ) ) ( not ( = ?auto_724010 ?auto_724024 ) ) ( not ( = ?auto_724010 ?auto_724025 ) ) ( not ( = ?auto_724010 ?auto_724026 ) ) ( not ( = ?auto_724011 ?auto_724012 ) ) ( not ( = ?auto_724011 ?auto_724013 ) ) ( not ( = ?auto_724011 ?auto_724014 ) ) ( not ( = ?auto_724011 ?auto_724015 ) ) ( not ( = ?auto_724011 ?auto_724016 ) ) ( not ( = ?auto_724011 ?auto_724017 ) ) ( not ( = ?auto_724011 ?auto_724018 ) ) ( not ( = ?auto_724011 ?auto_724019 ) ) ( not ( = ?auto_724011 ?auto_724020 ) ) ( not ( = ?auto_724011 ?auto_724021 ) ) ( not ( = ?auto_724011 ?auto_724022 ) ) ( not ( = ?auto_724011 ?auto_724023 ) ) ( not ( = ?auto_724011 ?auto_724024 ) ) ( not ( = ?auto_724011 ?auto_724025 ) ) ( not ( = ?auto_724011 ?auto_724026 ) ) ( not ( = ?auto_724012 ?auto_724013 ) ) ( not ( = ?auto_724012 ?auto_724014 ) ) ( not ( = ?auto_724012 ?auto_724015 ) ) ( not ( = ?auto_724012 ?auto_724016 ) ) ( not ( = ?auto_724012 ?auto_724017 ) ) ( not ( = ?auto_724012 ?auto_724018 ) ) ( not ( = ?auto_724012 ?auto_724019 ) ) ( not ( = ?auto_724012 ?auto_724020 ) ) ( not ( = ?auto_724012 ?auto_724021 ) ) ( not ( = ?auto_724012 ?auto_724022 ) ) ( not ( = ?auto_724012 ?auto_724023 ) ) ( not ( = ?auto_724012 ?auto_724024 ) ) ( not ( = ?auto_724012 ?auto_724025 ) ) ( not ( = ?auto_724012 ?auto_724026 ) ) ( not ( = ?auto_724013 ?auto_724014 ) ) ( not ( = ?auto_724013 ?auto_724015 ) ) ( not ( = ?auto_724013 ?auto_724016 ) ) ( not ( = ?auto_724013 ?auto_724017 ) ) ( not ( = ?auto_724013 ?auto_724018 ) ) ( not ( = ?auto_724013 ?auto_724019 ) ) ( not ( = ?auto_724013 ?auto_724020 ) ) ( not ( = ?auto_724013 ?auto_724021 ) ) ( not ( = ?auto_724013 ?auto_724022 ) ) ( not ( = ?auto_724013 ?auto_724023 ) ) ( not ( = ?auto_724013 ?auto_724024 ) ) ( not ( = ?auto_724013 ?auto_724025 ) ) ( not ( = ?auto_724013 ?auto_724026 ) ) ( not ( = ?auto_724014 ?auto_724015 ) ) ( not ( = ?auto_724014 ?auto_724016 ) ) ( not ( = ?auto_724014 ?auto_724017 ) ) ( not ( = ?auto_724014 ?auto_724018 ) ) ( not ( = ?auto_724014 ?auto_724019 ) ) ( not ( = ?auto_724014 ?auto_724020 ) ) ( not ( = ?auto_724014 ?auto_724021 ) ) ( not ( = ?auto_724014 ?auto_724022 ) ) ( not ( = ?auto_724014 ?auto_724023 ) ) ( not ( = ?auto_724014 ?auto_724024 ) ) ( not ( = ?auto_724014 ?auto_724025 ) ) ( not ( = ?auto_724014 ?auto_724026 ) ) ( not ( = ?auto_724015 ?auto_724016 ) ) ( not ( = ?auto_724015 ?auto_724017 ) ) ( not ( = ?auto_724015 ?auto_724018 ) ) ( not ( = ?auto_724015 ?auto_724019 ) ) ( not ( = ?auto_724015 ?auto_724020 ) ) ( not ( = ?auto_724015 ?auto_724021 ) ) ( not ( = ?auto_724015 ?auto_724022 ) ) ( not ( = ?auto_724015 ?auto_724023 ) ) ( not ( = ?auto_724015 ?auto_724024 ) ) ( not ( = ?auto_724015 ?auto_724025 ) ) ( not ( = ?auto_724015 ?auto_724026 ) ) ( not ( = ?auto_724016 ?auto_724017 ) ) ( not ( = ?auto_724016 ?auto_724018 ) ) ( not ( = ?auto_724016 ?auto_724019 ) ) ( not ( = ?auto_724016 ?auto_724020 ) ) ( not ( = ?auto_724016 ?auto_724021 ) ) ( not ( = ?auto_724016 ?auto_724022 ) ) ( not ( = ?auto_724016 ?auto_724023 ) ) ( not ( = ?auto_724016 ?auto_724024 ) ) ( not ( = ?auto_724016 ?auto_724025 ) ) ( not ( = ?auto_724016 ?auto_724026 ) ) ( not ( = ?auto_724017 ?auto_724018 ) ) ( not ( = ?auto_724017 ?auto_724019 ) ) ( not ( = ?auto_724017 ?auto_724020 ) ) ( not ( = ?auto_724017 ?auto_724021 ) ) ( not ( = ?auto_724017 ?auto_724022 ) ) ( not ( = ?auto_724017 ?auto_724023 ) ) ( not ( = ?auto_724017 ?auto_724024 ) ) ( not ( = ?auto_724017 ?auto_724025 ) ) ( not ( = ?auto_724017 ?auto_724026 ) ) ( not ( = ?auto_724018 ?auto_724019 ) ) ( not ( = ?auto_724018 ?auto_724020 ) ) ( not ( = ?auto_724018 ?auto_724021 ) ) ( not ( = ?auto_724018 ?auto_724022 ) ) ( not ( = ?auto_724018 ?auto_724023 ) ) ( not ( = ?auto_724018 ?auto_724024 ) ) ( not ( = ?auto_724018 ?auto_724025 ) ) ( not ( = ?auto_724018 ?auto_724026 ) ) ( not ( = ?auto_724019 ?auto_724020 ) ) ( not ( = ?auto_724019 ?auto_724021 ) ) ( not ( = ?auto_724019 ?auto_724022 ) ) ( not ( = ?auto_724019 ?auto_724023 ) ) ( not ( = ?auto_724019 ?auto_724024 ) ) ( not ( = ?auto_724019 ?auto_724025 ) ) ( not ( = ?auto_724019 ?auto_724026 ) ) ( not ( = ?auto_724020 ?auto_724021 ) ) ( not ( = ?auto_724020 ?auto_724022 ) ) ( not ( = ?auto_724020 ?auto_724023 ) ) ( not ( = ?auto_724020 ?auto_724024 ) ) ( not ( = ?auto_724020 ?auto_724025 ) ) ( not ( = ?auto_724020 ?auto_724026 ) ) ( not ( = ?auto_724021 ?auto_724022 ) ) ( not ( = ?auto_724021 ?auto_724023 ) ) ( not ( = ?auto_724021 ?auto_724024 ) ) ( not ( = ?auto_724021 ?auto_724025 ) ) ( not ( = ?auto_724021 ?auto_724026 ) ) ( not ( = ?auto_724022 ?auto_724023 ) ) ( not ( = ?auto_724022 ?auto_724024 ) ) ( not ( = ?auto_724022 ?auto_724025 ) ) ( not ( = ?auto_724022 ?auto_724026 ) ) ( not ( = ?auto_724023 ?auto_724024 ) ) ( not ( = ?auto_724023 ?auto_724025 ) ) ( not ( = ?auto_724023 ?auto_724026 ) ) ( not ( = ?auto_724024 ?auto_724025 ) ) ( not ( = ?auto_724024 ?auto_724026 ) ) ( not ( = ?auto_724025 ?auto_724026 ) ) ( ON ?auto_724025 ?auto_724026 ) ( ON ?auto_724024 ?auto_724025 ) ( ON ?auto_724023 ?auto_724024 ) ( ON ?auto_724022 ?auto_724023 ) ( ON ?auto_724021 ?auto_724022 ) ( CLEAR ?auto_724019 ) ( ON ?auto_724020 ?auto_724021 ) ( CLEAR ?auto_724020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_724010 ?auto_724011 ?auto_724012 ?auto_724013 ?auto_724014 ?auto_724015 ?auto_724016 ?auto_724017 ?auto_724018 ?auto_724019 ?auto_724020 )
      ( MAKE-17PILE ?auto_724010 ?auto_724011 ?auto_724012 ?auto_724013 ?auto_724014 ?auto_724015 ?auto_724016 ?auto_724017 ?auto_724018 ?auto_724019 ?auto_724020 ?auto_724021 ?auto_724022 ?auto_724023 ?auto_724024 ?auto_724025 ?auto_724026 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724044 - BLOCK
      ?auto_724045 - BLOCK
      ?auto_724046 - BLOCK
      ?auto_724047 - BLOCK
      ?auto_724048 - BLOCK
      ?auto_724049 - BLOCK
      ?auto_724050 - BLOCK
      ?auto_724051 - BLOCK
      ?auto_724052 - BLOCK
      ?auto_724053 - BLOCK
      ?auto_724054 - BLOCK
      ?auto_724055 - BLOCK
      ?auto_724056 - BLOCK
      ?auto_724057 - BLOCK
      ?auto_724058 - BLOCK
      ?auto_724059 - BLOCK
      ?auto_724060 - BLOCK
    )
    :vars
    (
      ?auto_724061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724060 ?auto_724061 ) ( ON-TABLE ?auto_724044 ) ( ON ?auto_724045 ?auto_724044 ) ( ON ?auto_724046 ?auto_724045 ) ( ON ?auto_724047 ?auto_724046 ) ( ON ?auto_724048 ?auto_724047 ) ( ON ?auto_724049 ?auto_724048 ) ( ON ?auto_724050 ?auto_724049 ) ( ON ?auto_724051 ?auto_724050 ) ( ON ?auto_724052 ?auto_724051 ) ( not ( = ?auto_724044 ?auto_724045 ) ) ( not ( = ?auto_724044 ?auto_724046 ) ) ( not ( = ?auto_724044 ?auto_724047 ) ) ( not ( = ?auto_724044 ?auto_724048 ) ) ( not ( = ?auto_724044 ?auto_724049 ) ) ( not ( = ?auto_724044 ?auto_724050 ) ) ( not ( = ?auto_724044 ?auto_724051 ) ) ( not ( = ?auto_724044 ?auto_724052 ) ) ( not ( = ?auto_724044 ?auto_724053 ) ) ( not ( = ?auto_724044 ?auto_724054 ) ) ( not ( = ?auto_724044 ?auto_724055 ) ) ( not ( = ?auto_724044 ?auto_724056 ) ) ( not ( = ?auto_724044 ?auto_724057 ) ) ( not ( = ?auto_724044 ?auto_724058 ) ) ( not ( = ?auto_724044 ?auto_724059 ) ) ( not ( = ?auto_724044 ?auto_724060 ) ) ( not ( = ?auto_724044 ?auto_724061 ) ) ( not ( = ?auto_724045 ?auto_724046 ) ) ( not ( = ?auto_724045 ?auto_724047 ) ) ( not ( = ?auto_724045 ?auto_724048 ) ) ( not ( = ?auto_724045 ?auto_724049 ) ) ( not ( = ?auto_724045 ?auto_724050 ) ) ( not ( = ?auto_724045 ?auto_724051 ) ) ( not ( = ?auto_724045 ?auto_724052 ) ) ( not ( = ?auto_724045 ?auto_724053 ) ) ( not ( = ?auto_724045 ?auto_724054 ) ) ( not ( = ?auto_724045 ?auto_724055 ) ) ( not ( = ?auto_724045 ?auto_724056 ) ) ( not ( = ?auto_724045 ?auto_724057 ) ) ( not ( = ?auto_724045 ?auto_724058 ) ) ( not ( = ?auto_724045 ?auto_724059 ) ) ( not ( = ?auto_724045 ?auto_724060 ) ) ( not ( = ?auto_724045 ?auto_724061 ) ) ( not ( = ?auto_724046 ?auto_724047 ) ) ( not ( = ?auto_724046 ?auto_724048 ) ) ( not ( = ?auto_724046 ?auto_724049 ) ) ( not ( = ?auto_724046 ?auto_724050 ) ) ( not ( = ?auto_724046 ?auto_724051 ) ) ( not ( = ?auto_724046 ?auto_724052 ) ) ( not ( = ?auto_724046 ?auto_724053 ) ) ( not ( = ?auto_724046 ?auto_724054 ) ) ( not ( = ?auto_724046 ?auto_724055 ) ) ( not ( = ?auto_724046 ?auto_724056 ) ) ( not ( = ?auto_724046 ?auto_724057 ) ) ( not ( = ?auto_724046 ?auto_724058 ) ) ( not ( = ?auto_724046 ?auto_724059 ) ) ( not ( = ?auto_724046 ?auto_724060 ) ) ( not ( = ?auto_724046 ?auto_724061 ) ) ( not ( = ?auto_724047 ?auto_724048 ) ) ( not ( = ?auto_724047 ?auto_724049 ) ) ( not ( = ?auto_724047 ?auto_724050 ) ) ( not ( = ?auto_724047 ?auto_724051 ) ) ( not ( = ?auto_724047 ?auto_724052 ) ) ( not ( = ?auto_724047 ?auto_724053 ) ) ( not ( = ?auto_724047 ?auto_724054 ) ) ( not ( = ?auto_724047 ?auto_724055 ) ) ( not ( = ?auto_724047 ?auto_724056 ) ) ( not ( = ?auto_724047 ?auto_724057 ) ) ( not ( = ?auto_724047 ?auto_724058 ) ) ( not ( = ?auto_724047 ?auto_724059 ) ) ( not ( = ?auto_724047 ?auto_724060 ) ) ( not ( = ?auto_724047 ?auto_724061 ) ) ( not ( = ?auto_724048 ?auto_724049 ) ) ( not ( = ?auto_724048 ?auto_724050 ) ) ( not ( = ?auto_724048 ?auto_724051 ) ) ( not ( = ?auto_724048 ?auto_724052 ) ) ( not ( = ?auto_724048 ?auto_724053 ) ) ( not ( = ?auto_724048 ?auto_724054 ) ) ( not ( = ?auto_724048 ?auto_724055 ) ) ( not ( = ?auto_724048 ?auto_724056 ) ) ( not ( = ?auto_724048 ?auto_724057 ) ) ( not ( = ?auto_724048 ?auto_724058 ) ) ( not ( = ?auto_724048 ?auto_724059 ) ) ( not ( = ?auto_724048 ?auto_724060 ) ) ( not ( = ?auto_724048 ?auto_724061 ) ) ( not ( = ?auto_724049 ?auto_724050 ) ) ( not ( = ?auto_724049 ?auto_724051 ) ) ( not ( = ?auto_724049 ?auto_724052 ) ) ( not ( = ?auto_724049 ?auto_724053 ) ) ( not ( = ?auto_724049 ?auto_724054 ) ) ( not ( = ?auto_724049 ?auto_724055 ) ) ( not ( = ?auto_724049 ?auto_724056 ) ) ( not ( = ?auto_724049 ?auto_724057 ) ) ( not ( = ?auto_724049 ?auto_724058 ) ) ( not ( = ?auto_724049 ?auto_724059 ) ) ( not ( = ?auto_724049 ?auto_724060 ) ) ( not ( = ?auto_724049 ?auto_724061 ) ) ( not ( = ?auto_724050 ?auto_724051 ) ) ( not ( = ?auto_724050 ?auto_724052 ) ) ( not ( = ?auto_724050 ?auto_724053 ) ) ( not ( = ?auto_724050 ?auto_724054 ) ) ( not ( = ?auto_724050 ?auto_724055 ) ) ( not ( = ?auto_724050 ?auto_724056 ) ) ( not ( = ?auto_724050 ?auto_724057 ) ) ( not ( = ?auto_724050 ?auto_724058 ) ) ( not ( = ?auto_724050 ?auto_724059 ) ) ( not ( = ?auto_724050 ?auto_724060 ) ) ( not ( = ?auto_724050 ?auto_724061 ) ) ( not ( = ?auto_724051 ?auto_724052 ) ) ( not ( = ?auto_724051 ?auto_724053 ) ) ( not ( = ?auto_724051 ?auto_724054 ) ) ( not ( = ?auto_724051 ?auto_724055 ) ) ( not ( = ?auto_724051 ?auto_724056 ) ) ( not ( = ?auto_724051 ?auto_724057 ) ) ( not ( = ?auto_724051 ?auto_724058 ) ) ( not ( = ?auto_724051 ?auto_724059 ) ) ( not ( = ?auto_724051 ?auto_724060 ) ) ( not ( = ?auto_724051 ?auto_724061 ) ) ( not ( = ?auto_724052 ?auto_724053 ) ) ( not ( = ?auto_724052 ?auto_724054 ) ) ( not ( = ?auto_724052 ?auto_724055 ) ) ( not ( = ?auto_724052 ?auto_724056 ) ) ( not ( = ?auto_724052 ?auto_724057 ) ) ( not ( = ?auto_724052 ?auto_724058 ) ) ( not ( = ?auto_724052 ?auto_724059 ) ) ( not ( = ?auto_724052 ?auto_724060 ) ) ( not ( = ?auto_724052 ?auto_724061 ) ) ( not ( = ?auto_724053 ?auto_724054 ) ) ( not ( = ?auto_724053 ?auto_724055 ) ) ( not ( = ?auto_724053 ?auto_724056 ) ) ( not ( = ?auto_724053 ?auto_724057 ) ) ( not ( = ?auto_724053 ?auto_724058 ) ) ( not ( = ?auto_724053 ?auto_724059 ) ) ( not ( = ?auto_724053 ?auto_724060 ) ) ( not ( = ?auto_724053 ?auto_724061 ) ) ( not ( = ?auto_724054 ?auto_724055 ) ) ( not ( = ?auto_724054 ?auto_724056 ) ) ( not ( = ?auto_724054 ?auto_724057 ) ) ( not ( = ?auto_724054 ?auto_724058 ) ) ( not ( = ?auto_724054 ?auto_724059 ) ) ( not ( = ?auto_724054 ?auto_724060 ) ) ( not ( = ?auto_724054 ?auto_724061 ) ) ( not ( = ?auto_724055 ?auto_724056 ) ) ( not ( = ?auto_724055 ?auto_724057 ) ) ( not ( = ?auto_724055 ?auto_724058 ) ) ( not ( = ?auto_724055 ?auto_724059 ) ) ( not ( = ?auto_724055 ?auto_724060 ) ) ( not ( = ?auto_724055 ?auto_724061 ) ) ( not ( = ?auto_724056 ?auto_724057 ) ) ( not ( = ?auto_724056 ?auto_724058 ) ) ( not ( = ?auto_724056 ?auto_724059 ) ) ( not ( = ?auto_724056 ?auto_724060 ) ) ( not ( = ?auto_724056 ?auto_724061 ) ) ( not ( = ?auto_724057 ?auto_724058 ) ) ( not ( = ?auto_724057 ?auto_724059 ) ) ( not ( = ?auto_724057 ?auto_724060 ) ) ( not ( = ?auto_724057 ?auto_724061 ) ) ( not ( = ?auto_724058 ?auto_724059 ) ) ( not ( = ?auto_724058 ?auto_724060 ) ) ( not ( = ?auto_724058 ?auto_724061 ) ) ( not ( = ?auto_724059 ?auto_724060 ) ) ( not ( = ?auto_724059 ?auto_724061 ) ) ( not ( = ?auto_724060 ?auto_724061 ) ) ( ON ?auto_724059 ?auto_724060 ) ( ON ?auto_724058 ?auto_724059 ) ( ON ?auto_724057 ?auto_724058 ) ( ON ?auto_724056 ?auto_724057 ) ( ON ?auto_724055 ?auto_724056 ) ( ON ?auto_724054 ?auto_724055 ) ( CLEAR ?auto_724052 ) ( ON ?auto_724053 ?auto_724054 ) ( CLEAR ?auto_724053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_724044 ?auto_724045 ?auto_724046 ?auto_724047 ?auto_724048 ?auto_724049 ?auto_724050 ?auto_724051 ?auto_724052 ?auto_724053 )
      ( MAKE-17PILE ?auto_724044 ?auto_724045 ?auto_724046 ?auto_724047 ?auto_724048 ?auto_724049 ?auto_724050 ?auto_724051 ?auto_724052 ?auto_724053 ?auto_724054 ?auto_724055 ?auto_724056 ?auto_724057 ?auto_724058 ?auto_724059 ?auto_724060 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724079 - BLOCK
      ?auto_724080 - BLOCK
      ?auto_724081 - BLOCK
      ?auto_724082 - BLOCK
      ?auto_724083 - BLOCK
      ?auto_724084 - BLOCK
      ?auto_724085 - BLOCK
      ?auto_724086 - BLOCK
      ?auto_724087 - BLOCK
      ?auto_724088 - BLOCK
      ?auto_724089 - BLOCK
      ?auto_724090 - BLOCK
      ?auto_724091 - BLOCK
      ?auto_724092 - BLOCK
      ?auto_724093 - BLOCK
      ?auto_724094 - BLOCK
      ?auto_724095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724095 ) ( ON-TABLE ?auto_724079 ) ( ON ?auto_724080 ?auto_724079 ) ( ON ?auto_724081 ?auto_724080 ) ( ON ?auto_724082 ?auto_724081 ) ( ON ?auto_724083 ?auto_724082 ) ( ON ?auto_724084 ?auto_724083 ) ( ON ?auto_724085 ?auto_724084 ) ( ON ?auto_724086 ?auto_724085 ) ( ON ?auto_724087 ?auto_724086 ) ( not ( = ?auto_724079 ?auto_724080 ) ) ( not ( = ?auto_724079 ?auto_724081 ) ) ( not ( = ?auto_724079 ?auto_724082 ) ) ( not ( = ?auto_724079 ?auto_724083 ) ) ( not ( = ?auto_724079 ?auto_724084 ) ) ( not ( = ?auto_724079 ?auto_724085 ) ) ( not ( = ?auto_724079 ?auto_724086 ) ) ( not ( = ?auto_724079 ?auto_724087 ) ) ( not ( = ?auto_724079 ?auto_724088 ) ) ( not ( = ?auto_724079 ?auto_724089 ) ) ( not ( = ?auto_724079 ?auto_724090 ) ) ( not ( = ?auto_724079 ?auto_724091 ) ) ( not ( = ?auto_724079 ?auto_724092 ) ) ( not ( = ?auto_724079 ?auto_724093 ) ) ( not ( = ?auto_724079 ?auto_724094 ) ) ( not ( = ?auto_724079 ?auto_724095 ) ) ( not ( = ?auto_724080 ?auto_724081 ) ) ( not ( = ?auto_724080 ?auto_724082 ) ) ( not ( = ?auto_724080 ?auto_724083 ) ) ( not ( = ?auto_724080 ?auto_724084 ) ) ( not ( = ?auto_724080 ?auto_724085 ) ) ( not ( = ?auto_724080 ?auto_724086 ) ) ( not ( = ?auto_724080 ?auto_724087 ) ) ( not ( = ?auto_724080 ?auto_724088 ) ) ( not ( = ?auto_724080 ?auto_724089 ) ) ( not ( = ?auto_724080 ?auto_724090 ) ) ( not ( = ?auto_724080 ?auto_724091 ) ) ( not ( = ?auto_724080 ?auto_724092 ) ) ( not ( = ?auto_724080 ?auto_724093 ) ) ( not ( = ?auto_724080 ?auto_724094 ) ) ( not ( = ?auto_724080 ?auto_724095 ) ) ( not ( = ?auto_724081 ?auto_724082 ) ) ( not ( = ?auto_724081 ?auto_724083 ) ) ( not ( = ?auto_724081 ?auto_724084 ) ) ( not ( = ?auto_724081 ?auto_724085 ) ) ( not ( = ?auto_724081 ?auto_724086 ) ) ( not ( = ?auto_724081 ?auto_724087 ) ) ( not ( = ?auto_724081 ?auto_724088 ) ) ( not ( = ?auto_724081 ?auto_724089 ) ) ( not ( = ?auto_724081 ?auto_724090 ) ) ( not ( = ?auto_724081 ?auto_724091 ) ) ( not ( = ?auto_724081 ?auto_724092 ) ) ( not ( = ?auto_724081 ?auto_724093 ) ) ( not ( = ?auto_724081 ?auto_724094 ) ) ( not ( = ?auto_724081 ?auto_724095 ) ) ( not ( = ?auto_724082 ?auto_724083 ) ) ( not ( = ?auto_724082 ?auto_724084 ) ) ( not ( = ?auto_724082 ?auto_724085 ) ) ( not ( = ?auto_724082 ?auto_724086 ) ) ( not ( = ?auto_724082 ?auto_724087 ) ) ( not ( = ?auto_724082 ?auto_724088 ) ) ( not ( = ?auto_724082 ?auto_724089 ) ) ( not ( = ?auto_724082 ?auto_724090 ) ) ( not ( = ?auto_724082 ?auto_724091 ) ) ( not ( = ?auto_724082 ?auto_724092 ) ) ( not ( = ?auto_724082 ?auto_724093 ) ) ( not ( = ?auto_724082 ?auto_724094 ) ) ( not ( = ?auto_724082 ?auto_724095 ) ) ( not ( = ?auto_724083 ?auto_724084 ) ) ( not ( = ?auto_724083 ?auto_724085 ) ) ( not ( = ?auto_724083 ?auto_724086 ) ) ( not ( = ?auto_724083 ?auto_724087 ) ) ( not ( = ?auto_724083 ?auto_724088 ) ) ( not ( = ?auto_724083 ?auto_724089 ) ) ( not ( = ?auto_724083 ?auto_724090 ) ) ( not ( = ?auto_724083 ?auto_724091 ) ) ( not ( = ?auto_724083 ?auto_724092 ) ) ( not ( = ?auto_724083 ?auto_724093 ) ) ( not ( = ?auto_724083 ?auto_724094 ) ) ( not ( = ?auto_724083 ?auto_724095 ) ) ( not ( = ?auto_724084 ?auto_724085 ) ) ( not ( = ?auto_724084 ?auto_724086 ) ) ( not ( = ?auto_724084 ?auto_724087 ) ) ( not ( = ?auto_724084 ?auto_724088 ) ) ( not ( = ?auto_724084 ?auto_724089 ) ) ( not ( = ?auto_724084 ?auto_724090 ) ) ( not ( = ?auto_724084 ?auto_724091 ) ) ( not ( = ?auto_724084 ?auto_724092 ) ) ( not ( = ?auto_724084 ?auto_724093 ) ) ( not ( = ?auto_724084 ?auto_724094 ) ) ( not ( = ?auto_724084 ?auto_724095 ) ) ( not ( = ?auto_724085 ?auto_724086 ) ) ( not ( = ?auto_724085 ?auto_724087 ) ) ( not ( = ?auto_724085 ?auto_724088 ) ) ( not ( = ?auto_724085 ?auto_724089 ) ) ( not ( = ?auto_724085 ?auto_724090 ) ) ( not ( = ?auto_724085 ?auto_724091 ) ) ( not ( = ?auto_724085 ?auto_724092 ) ) ( not ( = ?auto_724085 ?auto_724093 ) ) ( not ( = ?auto_724085 ?auto_724094 ) ) ( not ( = ?auto_724085 ?auto_724095 ) ) ( not ( = ?auto_724086 ?auto_724087 ) ) ( not ( = ?auto_724086 ?auto_724088 ) ) ( not ( = ?auto_724086 ?auto_724089 ) ) ( not ( = ?auto_724086 ?auto_724090 ) ) ( not ( = ?auto_724086 ?auto_724091 ) ) ( not ( = ?auto_724086 ?auto_724092 ) ) ( not ( = ?auto_724086 ?auto_724093 ) ) ( not ( = ?auto_724086 ?auto_724094 ) ) ( not ( = ?auto_724086 ?auto_724095 ) ) ( not ( = ?auto_724087 ?auto_724088 ) ) ( not ( = ?auto_724087 ?auto_724089 ) ) ( not ( = ?auto_724087 ?auto_724090 ) ) ( not ( = ?auto_724087 ?auto_724091 ) ) ( not ( = ?auto_724087 ?auto_724092 ) ) ( not ( = ?auto_724087 ?auto_724093 ) ) ( not ( = ?auto_724087 ?auto_724094 ) ) ( not ( = ?auto_724087 ?auto_724095 ) ) ( not ( = ?auto_724088 ?auto_724089 ) ) ( not ( = ?auto_724088 ?auto_724090 ) ) ( not ( = ?auto_724088 ?auto_724091 ) ) ( not ( = ?auto_724088 ?auto_724092 ) ) ( not ( = ?auto_724088 ?auto_724093 ) ) ( not ( = ?auto_724088 ?auto_724094 ) ) ( not ( = ?auto_724088 ?auto_724095 ) ) ( not ( = ?auto_724089 ?auto_724090 ) ) ( not ( = ?auto_724089 ?auto_724091 ) ) ( not ( = ?auto_724089 ?auto_724092 ) ) ( not ( = ?auto_724089 ?auto_724093 ) ) ( not ( = ?auto_724089 ?auto_724094 ) ) ( not ( = ?auto_724089 ?auto_724095 ) ) ( not ( = ?auto_724090 ?auto_724091 ) ) ( not ( = ?auto_724090 ?auto_724092 ) ) ( not ( = ?auto_724090 ?auto_724093 ) ) ( not ( = ?auto_724090 ?auto_724094 ) ) ( not ( = ?auto_724090 ?auto_724095 ) ) ( not ( = ?auto_724091 ?auto_724092 ) ) ( not ( = ?auto_724091 ?auto_724093 ) ) ( not ( = ?auto_724091 ?auto_724094 ) ) ( not ( = ?auto_724091 ?auto_724095 ) ) ( not ( = ?auto_724092 ?auto_724093 ) ) ( not ( = ?auto_724092 ?auto_724094 ) ) ( not ( = ?auto_724092 ?auto_724095 ) ) ( not ( = ?auto_724093 ?auto_724094 ) ) ( not ( = ?auto_724093 ?auto_724095 ) ) ( not ( = ?auto_724094 ?auto_724095 ) ) ( ON ?auto_724094 ?auto_724095 ) ( ON ?auto_724093 ?auto_724094 ) ( ON ?auto_724092 ?auto_724093 ) ( ON ?auto_724091 ?auto_724092 ) ( ON ?auto_724090 ?auto_724091 ) ( ON ?auto_724089 ?auto_724090 ) ( CLEAR ?auto_724087 ) ( ON ?auto_724088 ?auto_724089 ) ( CLEAR ?auto_724088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_724079 ?auto_724080 ?auto_724081 ?auto_724082 ?auto_724083 ?auto_724084 ?auto_724085 ?auto_724086 ?auto_724087 ?auto_724088 )
      ( MAKE-17PILE ?auto_724079 ?auto_724080 ?auto_724081 ?auto_724082 ?auto_724083 ?auto_724084 ?auto_724085 ?auto_724086 ?auto_724087 ?auto_724088 ?auto_724089 ?auto_724090 ?auto_724091 ?auto_724092 ?auto_724093 ?auto_724094 ?auto_724095 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724113 - BLOCK
      ?auto_724114 - BLOCK
      ?auto_724115 - BLOCK
      ?auto_724116 - BLOCK
      ?auto_724117 - BLOCK
      ?auto_724118 - BLOCK
      ?auto_724119 - BLOCK
      ?auto_724120 - BLOCK
      ?auto_724121 - BLOCK
      ?auto_724122 - BLOCK
      ?auto_724123 - BLOCK
      ?auto_724124 - BLOCK
      ?auto_724125 - BLOCK
      ?auto_724126 - BLOCK
      ?auto_724127 - BLOCK
      ?auto_724128 - BLOCK
      ?auto_724129 - BLOCK
    )
    :vars
    (
      ?auto_724130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724129 ?auto_724130 ) ( ON-TABLE ?auto_724113 ) ( ON ?auto_724114 ?auto_724113 ) ( ON ?auto_724115 ?auto_724114 ) ( ON ?auto_724116 ?auto_724115 ) ( ON ?auto_724117 ?auto_724116 ) ( ON ?auto_724118 ?auto_724117 ) ( ON ?auto_724119 ?auto_724118 ) ( ON ?auto_724120 ?auto_724119 ) ( not ( = ?auto_724113 ?auto_724114 ) ) ( not ( = ?auto_724113 ?auto_724115 ) ) ( not ( = ?auto_724113 ?auto_724116 ) ) ( not ( = ?auto_724113 ?auto_724117 ) ) ( not ( = ?auto_724113 ?auto_724118 ) ) ( not ( = ?auto_724113 ?auto_724119 ) ) ( not ( = ?auto_724113 ?auto_724120 ) ) ( not ( = ?auto_724113 ?auto_724121 ) ) ( not ( = ?auto_724113 ?auto_724122 ) ) ( not ( = ?auto_724113 ?auto_724123 ) ) ( not ( = ?auto_724113 ?auto_724124 ) ) ( not ( = ?auto_724113 ?auto_724125 ) ) ( not ( = ?auto_724113 ?auto_724126 ) ) ( not ( = ?auto_724113 ?auto_724127 ) ) ( not ( = ?auto_724113 ?auto_724128 ) ) ( not ( = ?auto_724113 ?auto_724129 ) ) ( not ( = ?auto_724113 ?auto_724130 ) ) ( not ( = ?auto_724114 ?auto_724115 ) ) ( not ( = ?auto_724114 ?auto_724116 ) ) ( not ( = ?auto_724114 ?auto_724117 ) ) ( not ( = ?auto_724114 ?auto_724118 ) ) ( not ( = ?auto_724114 ?auto_724119 ) ) ( not ( = ?auto_724114 ?auto_724120 ) ) ( not ( = ?auto_724114 ?auto_724121 ) ) ( not ( = ?auto_724114 ?auto_724122 ) ) ( not ( = ?auto_724114 ?auto_724123 ) ) ( not ( = ?auto_724114 ?auto_724124 ) ) ( not ( = ?auto_724114 ?auto_724125 ) ) ( not ( = ?auto_724114 ?auto_724126 ) ) ( not ( = ?auto_724114 ?auto_724127 ) ) ( not ( = ?auto_724114 ?auto_724128 ) ) ( not ( = ?auto_724114 ?auto_724129 ) ) ( not ( = ?auto_724114 ?auto_724130 ) ) ( not ( = ?auto_724115 ?auto_724116 ) ) ( not ( = ?auto_724115 ?auto_724117 ) ) ( not ( = ?auto_724115 ?auto_724118 ) ) ( not ( = ?auto_724115 ?auto_724119 ) ) ( not ( = ?auto_724115 ?auto_724120 ) ) ( not ( = ?auto_724115 ?auto_724121 ) ) ( not ( = ?auto_724115 ?auto_724122 ) ) ( not ( = ?auto_724115 ?auto_724123 ) ) ( not ( = ?auto_724115 ?auto_724124 ) ) ( not ( = ?auto_724115 ?auto_724125 ) ) ( not ( = ?auto_724115 ?auto_724126 ) ) ( not ( = ?auto_724115 ?auto_724127 ) ) ( not ( = ?auto_724115 ?auto_724128 ) ) ( not ( = ?auto_724115 ?auto_724129 ) ) ( not ( = ?auto_724115 ?auto_724130 ) ) ( not ( = ?auto_724116 ?auto_724117 ) ) ( not ( = ?auto_724116 ?auto_724118 ) ) ( not ( = ?auto_724116 ?auto_724119 ) ) ( not ( = ?auto_724116 ?auto_724120 ) ) ( not ( = ?auto_724116 ?auto_724121 ) ) ( not ( = ?auto_724116 ?auto_724122 ) ) ( not ( = ?auto_724116 ?auto_724123 ) ) ( not ( = ?auto_724116 ?auto_724124 ) ) ( not ( = ?auto_724116 ?auto_724125 ) ) ( not ( = ?auto_724116 ?auto_724126 ) ) ( not ( = ?auto_724116 ?auto_724127 ) ) ( not ( = ?auto_724116 ?auto_724128 ) ) ( not ( = ?auto_724116 ?auto_724129 ) ) ( not ( = ?auto_724116 ?auto_724130 ) ) ( not ( = ?auto_724117 ?auto_724118 ) ) ( not ( = ?auto_724117 ?auto_724119 ) ) ( not ( = ?auto_724117 ?auto_724120 ) ) ( not ( = ?auto_724117 ?auto_724121 ) ) ( not ( = ?auto_724117 ?auto_724122 ) ) ( not ( = ?auto_724117 ?auto_724123 ) ) ( not ( = ?auto_724117 ?auto_724124 ) ) ( not ( = ?auto_724117 ?auto_724125 ) ) ( not ( = ?auto_724117 ?auto_724126 ) ) ( not ( = ?auto_724117 ?auto_724127 ) ) ( not ( = ?auto_724117 ?auto_724128 ) ) ( not ( = ?auto_724117 ?auto_724129 ) ) ( not ( = ?auto_724117 ?auto_724130 ) ) ( not ( = ?auto_724118 ?auto_724119 ) ) ( not ( = ?auto_724118 ?auto_724120 ) ) ( not ( = ?auto_724118 ?auto_724121 ) ) ( not ( = ?auto_724118 ?auto_724122 ) ) ( not ( = ?auto_724118 ?auto_724123 ) ) ( not ( = ?auto_724118 ?auto_724124 ) ) ( not ( = ?auto_724118 ?auto_724125 ) ) ( not ( = ?auto_724118 ?auto_724126 ) ) ( not ( = ?auto_724118 ?auto_724127 ) ) ( not ( = ?auto_724118 ?auto_724128 ) ) ( not ( = ?auto_724118 ?auto_724129 ) ) ( not ( = ?auto_724118 ?auto_724130 ) ) ( not ( = ?auto_724119 ?auto_724120 ) ) ( not ( = ?auto_724119 ?auto_724121 ) ) ( not ( = ?auto_724119 ?auto_724122 ) ) ( not ( = ?auto_724119 ?auto_724123 ) ) ( not ( = ?auto_724119 ?auto_724124 ) ) ( not ( = ?auto_724119 ?auto_724125 ) ) ( not ( = ?auto_724119 ?auto_724126 ) ) ( not ( = ?auto_724119 ?auto_724127 ) ) ( not ( = ?auto_724119 ?auto_724128 ) ) ( not ( = ?auto_724119 ?auto_724129 ) ) ( not ( = ?auto_724119 ?auto_724130 ) ) ( not ( = ?auto_724120 ?auto_724121 ) ) ( not ( = ?auto_724120 ?auto_724122 ) ) ( not ( = ?auto_724120 ?auto_724123 ) ) ( not ( = ?auto_724120 ?auto_724124 ) ) ( not ( = ?auto_724120 ?auto_724125 ) ) ( not ( = ?auto_724120 ?auto_724126 ) ) ( not ( = ?auto_724120 ?auto_724127 ) ) ( not ( = ?auto_724120 ?auto_724128 ) ) ( not ( = ?auto_724120 ?auto_724129 ) ) ( not ( = ?auto_724120 ?auto_724130 ) ) ( not ( = ?auto_724121 ?auto_724122 ) ) ( not ( = ?auto_724121 ?auto_724123 ) ) ( not ( = ?auto_724121 ?auto_724124 ) ) ( not ( = ?auto_724121 ?auto_724125 ) ) ( not ( = ?auto_724121 ?auto_724126 ) ) ( not ( = ?auto_724121 ?auto_724127 ) ) ( not ( = ?auto_724121 ?auto_724128 ) ) ( not ( = ?auto_724121 ?auto_724129 ) ) ( not ( = ?auto_724121 ?auto_724130 ) ) ( not ( = ?auto_724122 ?auto_724123 ) ) ( not ( = ?auto_724122 ?auto_724124 ) ) ( not ( = ?auto_724122 ?auto_724125 ) ) ( not ( = ?auto_724122 ?auto_724126 ) ) ( not ( = ?auto_724122 ?auto_724127 ) ) ( not ( = ?auto_724122 ?auto_724128 ) ) ( not ( = ?auto_724122 ?auto_724129 ) ) ( not ( = ?auto_724122 ?auto_724130 ) ) ( not ( = ?auto_724123 ?auto_724124 ) ) ( not ( = ?auto_724123 ?auto_724125 ) ) ( not ( = ?auto_724123 ?auto_724126 ) ) ( not ( = ?auto_724123 ?auto_724127 ) ) ( not ( = ?auto_724123 ?auto_724128 ) ) ( not ( = ?auto_724123 ?auto_724129 ) ) ( not ( = ?auto_724123 ?auto_724130 ) ) ( not ( = ?auto_724124 ?auto_724125 ) ) ( not ( = ?auto_724124 ?auto_724126 ) ) ( not ( = ?auto_724124 ?auto_724127 ) ) ( not ( = ?auto_724124 ?auto_724128 ) ) ( not ( = ?auto_724124 ?auto_724129 ) ) ( not ( = ?auto_724124 ?auto_724130 ) ) ( not ( = ?auto_724125 ?auto_724126 ) ) ( not ( = ?auto_724125 ?auto_724127 ) ) ( not ( = ?auto_724125 ?auto_724128 ) ) ( not ( = ?auto_724125 ?auto_724129 ) ) ( not ( = ?auto_724125 ?auto_724130 ) ) ( not ( = ?auto_724126 ?auto_724127 ) ) ( not ( = ?auto_724126 ?auto_724128 ) ) ( not ( = ?auto_724126 ?auto_724129 ) ) ( not ( = ?auto_724126 ?auto_724130 ) ) ( not ( = ?auto_724127 ?auto_724128 ) ) ( not ( = ?auto_724127 ?auto_724129 ) ) ( not ( = ?auto_724127 ?auto_724130 ) ) ( not ( = ?auto_724128 ?auto_724129 ) ) ( not ( = ?auto_724128 ?auto_724130 ) ) ( not ( = ?auto_724129 ?auto_724130 ) ) ( ON ?auto_724128 ?auto_724129 ) ( ON ?auto_724127 ?auto_724128 ) ( ON ?auto_724126 ?auto_724127 ) ( ON ?auto_724125 ?auto_724126 ) ( ON ?auto_724124 ?auto_724125 ) ( ON ?auto_724123 ?auto_724124 ) ( ON ?auto_724122 ?auto_724123 ) ( CLEAR ?auto_724120 ) ( ON ?auto_724121 ?auto_724122 ) ( CLEAR ?auto_724121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_724113 ?auto_724114 ?auto_724115 ?auto_724116 ?auto_724117 ?auto_724118 ?auto_724119 ?auto_724120 ?auto_724121 )
      ( MAKE-17PILE ?auto_724113 ?auto_724114 ?auto_724115 ?auto_724116 ?auto_724117 ?auto_724118 ?auto_724119 ?auto_724120 ?auto_724121 ?auto_724122 ?auto_724123 ?auto_724124 ?auto_724125 ?auto_724126 ?auto_724127 ?auto_724128 ?auto_724129 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724148 - BLOCK
      ?auto_724149 - BLOCK
      ?auto_724150 - BLOCK
      ?auto_724151 - BLOCK
      ?auto_724152 - BLOCK
      ?auto_724153 - BLOCK
      ?auto_724154 - BLOCK
      ?auto_724155 - BLOCK
      ?auto_724156 - BLOCK
      ?auto_724157 - BLOCK
      ?auto_724158 - BLOCK
      ?auto_724159 - BLOCK
      ?auto_724160 - BLOCK
      ?auto_724161 - BLOCK
      ?auto_724162 - BLOCK
      ?auto_724163 - BLOCK
      ?auto_724164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724164 ) ( ON-TABLE ?auto_724148 ) ( ON ?auto_724149 ?auto_724148 ) ( ON ?auto_724150 ?auto_724149 ) ( ON ?auto_724151 ?auto_724150 ) ( ON ?auto_724152 ?auto_724151 ) ( ON ?auto_724153 ?auto_724152 ) ( ON ?auto_724154 ?auto_724153 ) ( ON ?auto_724155 ?auto_724154 ) ( not ( = ?auto_724148 ?auto_724149 ) ) ( not ( = ?auto_724148 ?auto_724150 ) ) ( not ( = ?auto_724148 ?auto_724151 ) ) ( not ( = ?auto_724148 ?auto_724152 ) ) ( not ( = ?auto_724148 ?auto_724153 ) ) ( not ( = ?auto_724148 ?auto_724154 ) ) ( not ( = ?auto_724148 ?auto_724155 ) ) ( not ( = ?auto_724148 ?auto_724156 ) ) ( not ( = ?auto_724148 ?auto_724157 ) ) ( not ( = ?auto_724148 ?auto_724158 ) ) ( not ( = ?auto_724148 ?auto_724159 ) ) ( not ( = ?auto_724148 ?auto_724160 ) ) ( not ( = ?auto_724148 ?auto_724161 ) ) ( not ( = ?auto_724148 ?auto_724162 ) ) ( not ( = ?auto_724148 ?auto_724163 ) ) ( not ( = ?auto_724148 ?auto_724164 ) ) ( not ( = ?auto_724149 ?auto_724150 ) ) ( not ( = ?auto_724149 ?auto_724151 ) ) ( not ( = ?auto_724149 ?auto_724152 ) ) ( not ( = ?auto_724149 ?auto_724153 ) ) ( not ( = ?auto_724149 ?auto_724154 ) ) ( not ( = ?auto_724149 ?auto_724155 ) ) ( not ( = ?auto_724149 ?auto_724156 ) ) ( not ( = ?auto_724149 ?auto_724157 ) ) ( not ( = ?auto_724149 ?auto_724158 ) ) ( not ( = ?auto_724149 ?auto_724159 ) ) ( not ( = ?auto_724149 ?auto_724160 ) ) ( not ( = ?auto_724149 ?auto_724161 ) ) ( not ( = ?auto_724149 ?auto_724162 ) ) ( not ( = ?auto_724149 ?auto_724163 ) ) ( not ( = ?auto_724149 ?auto_724164 ) ) ( not ( = ?auto_724150 ?auto_724151 ) ) ( not ( = ?auto_724150 ?auto_724152 ) ) ( not ( = ?auto_724150 ?auto_724153 ) ) ( not ( = ?auto_724150 ?auto_724154 ) ) ( not ( = ?auto_724150 ?auto_724155 ) ) ( not ( = ?auto_724150 ?auto_724156 ) ) ( not ( = ?auto_724150 ?auto_724157 ) ) ( not ( = ?auto_724150 ?auto_724158 ) ) ( not ( = ?auto_724150 ?auto_724159 ) ) ( not ( = ?auto_724150 ?auto_724160 ) ) ( not ( = ?auto_724150 ?auto_724161 ) ) ( not ( = ?auto_724150 ?auto_724162 ) ) ( not ( = ?auto_724150 ?auto_724163 ) ) ( not ( = ?auto_724150 ?auto_724164 ) ) ( not ( = ?auto_724151 ?auto_724152 ) ) ( not ( = ?auto_724151 ?auto_724153 ) ) ( not ( = ?auto_724151 ?auto_724154 ) ) ( not ( = ?auto_724151 ?auto_724155 ) ) ( not ( = ?auto_724151 ?auto_724156 ) ) ( not ( = ?auto_724151 ?auto_724157 ) ) ( not ( = ?auto_724151 ?auto_724158 ) ) ( not ( = ?auto_724151 ?auto_724159 ) ) ( not ( = ?auto_724151 ?auto_724160 ) ) ( not ( = ?auto_724151 ?auto_724161 ) ) ( not ( = ?auto_724151 ?auto_724162 ) ) ( not ( = ?auto_724151 ?auto_724163 ) ) ( not ( = ?auto_724151 ?auto_724164 ) ) ( not ( = ?auto_724152 ?auto_724153 ) ) ( not ( = ?auto_724152 ?auto_724154 ) ) ( not ( = ?auto_724152 ?auto_724155 ) ) ( not ( = ?auto_724152 ?auto_724156 ) ) ( not ( = ?auto_724152 ?auto_724157 ) ) ( not ( = ?auto_724152 ?auto_724158 ) ) ( not ( = ?auto_724152 ?auto_724159 ) ) ( not ( = ?auto_724152 ?auto_724160 ) ) ( not ( = ?auto_724152 ?auto_724161 ) ) ( not ( = ?auto_724152 ?auto_724162 ) ) ( not ( = ?auto_724152 ?auto_724163 ) ) ( not ( = ?auto_724152 ?auto_724164 ) ) ( not ( = ?auto_724153 ?auto_724154 ) ) ( not ( = ?auto_724153 ?auto_724155 ) ) ( not ( = ?auto_724153 ?auto_724156 ) ) ( not ( = ?auto_724153 ?auto_724157 ) ) ( not ( = ?auto_724153 ?auto_724158 ) ) ( not ( = ?auto_724153 ?auto_724159 ) ) ( not ( = ?auto_724153 ?auto_724160 ) ) ( not ( = ?auto_724153 ?auto_724161 ) ) ( not ( = ?auto_724153 ?auto_724162 ) ) ( not ( = ?auto_724153 ?auto_724163 ) ) ( not ( = ?auto_724153 ?auto_724164 ) ) ( not ( = ?auto_724154 ?auto_724155 ) ) ( not ( = ?auto_724154 ?auto_724156 ) ) ( not ( = ?auto_724154 ?auto_724157 ) ) ( not ( = ?auto_724154 ?auto_724158 ) ) ( not ( = ?auto_724154 ?auto_724159 ) ) ( not ( = ?auto_724154 ?auto_724160 ) ) ( not ( = ?auto_724154 ?auto_724161 ) ) ( not ( = ?auto_724154 ?auto_724162 ) ) ( not ( = ?auto_724154 ?auto_724163 ) ) ( not ( = ?auto_724154 ?auto_724164 ) ) ( not ( = ?auto_724155 ?auto_724156 ) ) ( not ( = ?auto_724155 ?auto_724157 ) ) ( not ( = ?auto_724155 ?auto_724158 ) ) ( not ( = ?auto_724155 ?auto_724159 ) ) ( not ( = ?auto_724155 ?auto_724160 ) ) ( not ( = ?auto_724155 ?auto_724161 ) ) ( not ( = ?auto_724155 ?auto_724162 ) ) ( not ( = ?auto_724155 ?auto_724163 ) ) ( not ( = ?auto_724155 ?auto_724164 ) ) ( not ( = ?auto_724156 ?auto_724157 ) ) ( not ( = ?auto_724156 ?auto_724158 ) ) ( not ( = ?auto_724156 ?auto_724159 ) ) ( not ( = ?auto_724156 ?auto_724160 ) ) ( not ( = ?auto_724156 ?auto_724161 ) ) ( not ( = ?auto_724156 ?auto_724162 ) ) ( not ( = ?auto_724156 ?auto_724163 ) ) ( not ( = ?auto_724156 ?auto_724164 ) ) ( not ( = ?auto_724157 ?auto_724158 ) ) ( not ( = ?auto_724157 ?auto_724159 ) ) ( not ( = ?auto_724157 ?auto_724160 ) ) ( not ( = ?auto_724157 ?auto_724161 ) ) ( not ( = ?auto_724157 ?auto_724162 ) ) ( not ( = ?auto_724157 ?auto_724163 ) ) ( not ( = ?auto_724157 ?auto_724164 ) ) ( not ( = ?auto_724158 ?auto_724159 ) ) ( not ( = ?auto_724158 ?auto_724160 ) ) ( not ( = ?auto_724158 ?auto_724161 ) ) ( not ( = ?auto_724158 ?auto_724162 ) ) ( not ( = ?auto_724158 ?auto_724163 ) ) ( not ( = ?auto_724158 ?auto_724164 ) ) ( not ( = ?auto_724159 ?auto_724160 ) ) ( not ( = ?auto_724159 ?auto_724161 ) ) ( not ( = ?auto_724159 ?auto_724162 ) ) ( not ( = ?auto_724159 ?auto_724163 ) ) ( not ( = ?auto_724159 ?auto_724164 ) ) ( not ( = ?auto_724160 ?auto_724161 ) ) ( not ( = ?auto_724160 ?auto_724162 ) ) ( not ( = ?auto_724160 ?auto_724163 ) ) ( not ( = ?auto_724160 ?auto_724164 ) ) ( not ( = ?auto_724161 ?auto_724162 ) ) ( not ( = ?auto_724161 ?auto_724163 ) ) ( not ( = ?auto_724161 ?auto_724164 ) ) ( not ( = ?auto_724162 ?auto_724163 ) ) ( not ( = ?auto_724162 ?auto_724164 ) ) ( not ( = ?auto_724163 ?auto_724164 ) ) ( ON ?auto_724163 ?auto_724164 ) ( ON ?auto_724162 ?auto_724163 ) ( ON ?auto_724161 ?auto_724162 ) ( ON ?auto_724160 ?auto_724161 ) ( ON ?auto_724159 ?auto_724160 ) ( ON ?auto_724158 ?auto_724159 ) ( ON ?auto_724157 ?auto_724158 ) ( CLEAR ?auto_724155 ) ( ON ?auto_724156 ?auto_724157 ) ( CLEAR ?auto_724156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_724148 ?auto_724149 ?auto_724150 ?auto_724151 ?auto_724152 ?auto_724153 ?auto_724154 ?auto_724155 ?auto_724156 )
      ( MAKE-17PILE ?auto_724148 ?auto_724149 ?auto_724150 ?auto_724151 ?auto_724152 ?auto_724153 ?auto_724154 ?auto_724155 ?auto_724156 ?auto_724157 ?auto_724158 ?auto_724159 ?auto_724160 ?auto_724161 ?auto_724162 ?auto_724163 ?auto_724164 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724182 - BLOCK
      ?auto_724183 - BLOCK
      ?auto_724184 - BLOCK
      ?auto_724185 - BLOCK
      ?auto_724186 - BLOCK
      ?auto_724187 - BLOCK
      ?auto_724188 - BLOCK
      ?auto_724189 - BLOCK
      ?auto_724190 - BLOCK
      ?auto_724191 - BLOCK
      ?auto_724192 - BLOCK
      ?auto_724193 - BLOCK
      ?auto_724194 - BLOCK
      ?auto_724195 - BLOCK
      ?auto_724196 - BLOCK
      ?auto_724197 - BLOCK
      ?auto_724198 - BLOCK
    )
    :vars
    (
      ?auto_724199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724198 ?auto_724199 ) ( ON-TABLE ?auto_724182 ) ( ON ?auto_724183 ?auto_724182 ) ( ON ?auto_724184 ?auto_724183 ) ( ON ?auto_724185 ?auto_724184 ) ( ON ?auto_724186 ?auto_724185 ) ( ON ?auto_724187 ?auto_724186 ) ( ON ?auto_724188 ?auto_724187 ) ( not ( = ?auto_724182 ?auto_724183 ) ) ( not ( = ?auto_724182 ?auto_724184 ) ) ( not ( = ?auto_724182 ?auto_724185 ) ) ( not ( = ?auto_724182 ?auto_724186 ) ) ( not ( = ?auto_724182 ?auto_724187 ) ) ( not ( = ?auto_724182 ?auto_724188 ) ) ( not ( = ?auto_724182 ?auto_724189 ) ) ( not ( = ?auto_724182 ?auto_724190 ) ) ( not ( = ?auto_724182 ?auto_724191 ) ) ( not ( = ?auto_724182 ?auto_724192 ) ) ( not ( = ?auto_724182 ?auto_724193 ) ) ( not ( = ?auto_724182 ?auto_724194 ) ) ( not ( = ?auto_724182 ?auto_724195 ) ) ( not ( = ?auto_724182 ?auto_724196 ) ) ( not ( = ?auto_724182 ?auto_724197 ) ) ( not ( = ?auto_724182 ?auto_724198 ) ) ( not ( = ?auto_724182 ?auto_724199 ) ) ( not ( = ?auto_724183 ?auto_724184 ) ) ( not ( = ?auto_724183 ?auto_724185 ) ) ( not ( = ?auto_724183 ?auto_724186 ) ) ( not ( = ?auto_724183 ?auto_724187 ) ) ( not ( = ?auto_724183 ?auto_724188 ) ) ( not ( = ?auto_724183 ?auto_724189 ) ) ( not ( = ?auto_724183 ?auto_724190 ) ) ( not ( = ?auto_724183 ?auto_724191 ) ) ( not ( = ?auto_724183 ?auto_724192 ) ) ( not ( = ?auto_724183 ?auto_724193 ) ) ( not ( = ?auto_724183 ?auto_724194 ) ) ( not ( = ?auto_724183 ?auto_724195 ) ) ( not ( = ?auto_724183 ?auto_724196 ) ) ( not ( = ?auto_724183 ?auto_724197 ) ) ( not ( = ?auto_724183 ?auto_724198 ) ) ( not ( = ?auto_724183 ?auto_724199 ) ) ( not ( = ?auto_724184 ?auto_724185 ) ) ( not ( = ?auto_724184 ?auto_724186 ) ) ( not ( = ?auto_724184 ?auto_724187 ) ) ( not ( = ?auto_724184 ?auto_724188 ) ) ( not ( = ?auto_724184 ?auto_724189 ) ) ( not ( = ?auto_724184 ?auto_724190 ) ) ( not ( = ?auto_724184 ?auto_724191 ) ) ( not ( = ?auto_724184 ?auto_724192 ) ) ( not ( = ?auto_724184 ?auto_724193 ) ) ( not ( = ?auto_724184 ?auto_724194 ) ) ( not ( = ?auto_724184 ?auto_724195 ) ) ( not ( = ?auto_724184 ?auto_724196 ) ) ( not ( = ?auto_724184 ?auto_724197 ) ) ( not ( = ?auto_724184 ?auto_724198 ) ) ( not ( = ?auto_724184 ?auto_724199 ) ) ( not ( = ?auto_724185 ?auto_724186 ) ) ( not ( = ?auto_724185 ?auto_724187 ) ) ( not ( = ?auto_724185 ?auto_724188 ) ) ( not ( = ?auto_724185 ?auto_724189 ) ) ( not ( = ?auto_724185 ?auto_724190 ) ) ( not ( = ?auto_724185 ?auto_724191 ) ) ( not ( = ?auto_724185 ?auto_724192 ) ) ( not ( = ?auto_724185 ?auto_724193 ) ) ( not ( = ?auto_724185 ?auto_724194 ) ) ( not ( = ?auto_724185 ?auto_724195 ) ) ( not ( = ?auto_724185 ?auto_724196 ) ) ( not ( = ?auto_724185 ?auto_724197 ) ) ( not ( = ?auto_724185 ?auto_724198 ) ) ( not ( = ?auto_724185 ?auto_724199 ) ) ( not ( = ?auto_724186 ?auto_724187 ) ) ( not ( = ?auto_724186 ?auto_724188 ) ) ( not ( = ?auto_724186 ?auto_724189 ) ) ( not ( = ?auto_724186 ?auto_724190 ) ) ( not ( = ?auto_724186 ?auto_724191 ) ) ( not ( = ?auto_724186 ?auto_724192 ) ) ( not ( = ?auto_724186 ?auto_724193 ) ) ( not ( = ?auto_724186 ?auto_724194 ) ) ( not ( = ?auto_724186 ?auto_724195 ) ) ( not ( = ?auto_724186 ?auto_724196 ) ) ( not ( = ?auto_724186 ?auto_724197 ) ) ( not ( = ?auto_724186 ?auto_724198 ) ) ( not ( = ?auto_724186 ?auto_724199 ) ) ( not ( = ?auto_724187 ?auto_724188 ) ) ( not ( = ?auto_724187 ?auto_724189 ) ) ( not ( = ?auto_724187 ?auto_724190 ) ) ( not ( = ?auto_724187 ?auto_724191 ) ) ( not ( = ?auto_724187 ?auto_724192 ) ) ( not ( = ?auto_724187 ?auto_724193 ) ) ( not ( = ?auto_724187 ?auto_724194 ) ) ( not ( = ?auto_724187 ?auto_724195 ) ) ( not ( = ?auto_724187 ?auto_724196 ) ) ( not ( = ?auto_724187 ?auto_724197 ) ) ( not ( = ?auto_724187 ?auto_724198 ) ) ( not ( = ?auto_724187 ?auto_724199 ) ) ( not ( = ?auto_724188 ?auto_724189 ) ) ( not ( = ?auto_724188 ?auto_724190 ) ) ( not ( = ?auto_724188 ?auto_724191 ) ) ( not ( = ?auto_724188 ?auto_724192 ) ) ( not ( = ?auto_724188 ?auto_724193 ) ) ( not ( = ?auto_724188 ?auto_724194 ) ) ( not ( = ?auto_724188 ?auto_724195 ) ) ( not ( = ?auto_724188 ?auto_724196 ) ) ( not ( = ?auto_724188 ?auto_724197 ) ) ( not ( = ?auto_724188 ?auto_724198 ) ) ( not ( = ?auto_724188 ?auto_724199 ) ) ( not ( = ?auto_724189 ?auto_724190 ) ) ( not ( = ?auto_724189 ?auto_724191 ) ) ( not ( = ?auto_724189 ?auto_724192 ) ) ( not ( = ?auto_724189 ?auto_724193 ) ) ( not ( = ?auto_724189 ?auto_724194 ) ) ( not ( = ?auto_724189 ?auto_724195 ) ) ( not ( = ?auto_724189 ?auto_724196 ) ) ( not ( = ?auto_724189 ?auto_724197 ) ) ( not ( = ?auto_724189 ?auto_724198 ) ) ( not ( = ?auto_724189 ?auto_724199 ) ) ( not ( = ?auto_724190 ?auto_724191 ) ) ( not ( = ?auto_724190 ?auto_724192 ) ) ( not ( = ?auto_724190 ?auto_724193 ) ) ( not ( = ?auto_724190 ?auto_724194 ) ) ( not ( = ?auto_724190 ?auto_724195 ) ) ( not ( = ?auto_724190 ?auto_724196 ) ) ( not ( = ?auto_724190 ?auto_724197 ) ) ( not ( = ?auto_724190 ?auto_724198 ) ) ( not ( = ?auto_724190 ?auto_724199 ) ) ( not ( = ?auto_724191 ?auto_724192 ) ) ( not ( = ?auto_724191 ?auto_724193 ) ) ( not ( = ?auto_724191 ?auto_724194 ) ) ( not ( = ?auto_724191 ?auto_724195 ) ) ( not ( = ?auto_724191 ?auto_724196 ) ) ( not ( = ?auto_724191 ?auto_724197 ) ) ( not ( = ?auto_724191 ?auto_724198 ) ) ( not ( = ?auto_724191 ?auto_724199 ) ) ( not ( = ?auto_724192 ?auto_724193 ) ) ( not ( = ?auto_724192 ?auto_724194 ) ) ( not ( = ?auto_724192 ?auto_724195 ) ) ( not ( = ?auto_724192 ?auto_724196 ) ) ( not ( = ?auto_724192 ?auto_724197 ) ) ( not ( = ?auto_724192 ?auto_724198 ) ) ( not ( = ?auto_724192 ?auto_724199 ) ) ( not ( = ?auto_724193 ?auto_724194 ) ) ( not ( = ?auto_724193 ?auto_724195 ) ) ( not ( = ?auto_724193 ?auto_724196 ) ) ( not ( = ?auto_724193 ?auto_724197 ) ) ( not ( = ?auto_724193 ?auto_724198 ) ) ( not ( = ?auto_724193 ?auto_724199 ) ) ( not ( = ?auto_724194 ?auto_724195 ) ) ( not ( = ?auto_724194 ?auto_724196 ) ) ( not ( = ?auto_724194 ?auto_724197 ) ) ( not ( = ?auto_724194 ?auto_724198 ) ) ( not ( = ?auto_724194 ?auto_724199 ) ) ( not ( = ?auto_724195 ?auto_724196 ) ) ( not ( = ?auto_724195 ?auto_724197 ) ) ( not ( = ?auto_724195 ?auto_724198 ) ) ( not ( = ?auto_724195 ?auto_724199 ) ) ( not ( = ?auto_724196 ?auto_724197 ) ) ( not ( = ?auto_724196 ?auto_724198 ) ) ( not ( = ?auto_724196 ?auto_724199 ) ) ( not ( = ?auto_724197 ?auto_724198 ) ) ( not ( = ?auto_724197 ?auto_724199 ) ) ( not ( = ?auto_724198 ?auto_724199 ) ) ( ON ?auto_724197 ?auto_724198 ) ( ON ?auto_724196 ?auto_724197 ) ( ON ?auto_724195 ?auto_724196 ) ( ON ?auto_724194 ?auto_724195 ) ( ON ?auto_724193 ?auto_724194 ) ( ON ?auto_724192 ?auto_724193 ) ( ON ?auto_724191 ?auto_724192 ) ( ON ?auto_724190 ?auto_724191 ) ( CLEAR ?auto_724188 ) ( ON ?auto_724189 ?auto_724190 ) ( CLEAR ?auto_724189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_724182 ?auto_724183 ?auto_724184 ?auto_724185 ?auto_724186 ?auto_724187 ?auto_724188 ?auto_724189 )
      ( MAKE-17PILE ?auto_724182 ?auto_724183 ?auto_724184 ?auto_724185 ?auto_724186 ?auto_724187 ?auto_724188 ?auto_724189 ?auto_724190 ?auto_724191 ?auto_724192 ?auto_724193 ?auto_724194 ?auto_724195 ?auto_724196 ?auto_724197 ?auto_724198 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724217 - BLOCK
      ?auto_724218 - BLOCK
      ?auto_724219 - BLOCK
      ?auto_724220 - BLOCK
      ?auto_724221 - BLOCK
      ?auto_724222 - BLOCK
      ?auto_724223 - BLOCK
      ?auto_724224 - BLOCK
      ?auto_724225 - BLOCK
      ?auto_724226 - BLOCK
      ?auto_724227 - BLOCK
      ?auto_724228 - BLOCK
      ?auto_724229 - BLOCK
      ?auto_724230 - BLOCK
      ?auto_724231 - BLOCK
      ?auto_724232 - BLOCK
      ?auto_724233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724233 ) ( ON-TABLE ?auto_724217 ) ( ON ?auto_724218 ?auto_724217 ) ( ON ?auto_724219 ?auto_724218 ) ( ON ?auto_724220 ?auto_724219 ) ( ON ?auto_724221 ?auto_724220 ) ( ON ?auto_724222 ?auto_724221 ) ( ON ?auto_724223 ?auto_724222 ) ( not ( = ?auto_724217 ?auto_724218 ) ) ( not ( = ?auto_724217 ?auto_724219 ) ) ( not ( = ?auto_724217 ?auto_724220 ) ) ( not ( = ?auto_724217 ?auto_724221 ) ) ( not ( = ?auto_724217 ?auto_724222 ) ) ( not ( = ?auto_724217 ?auto_724223 ) ) ( not ( = ?auto_724217 ?auto_724224 ) ) ( not ( = ?auto_724217 ?auto_724225 ) ) ( not ( = ?auto_724217 ?auto_724226 ) ) ( not ( = ?auto_724217 ?auto_724227 ) ) ( not ( = ?auto_724217 ?auto_724228 ) ) ( not ( = ?auto_724217 ?auto_724229 ) ) ( not ( = ?auto_724217 ?auto_724230 ) ) ( not ( = ?auto_724217 ?auto_724231 ) ) ( not ( = ?auto_724217 ?auto_724232 ) ) ( not ( = ?auto_724217 ?auto_724233 ) ) ( not ( = ?auto_724218 ?auto_724219 ) ) ( not ( = ?auto_724218 ?auto_724220 ) ) ( not ( = ?auto_724218 ?auto_724221 ) ) ( not ( = ?auto_724218 ?auto_724222 ) ) ( not ( = ?auto_724218 ?auto_724223 ) ) ( not ( = ?auto_724218 ?auto_724224 ) ) ( not ( = ?auto_724218 ?auto_724225 ) ) ( not ( = ?auto_724218 ?auto_724226 ) ) ( not ( = ?auto_724218 ?auto_724227 ) ) ( not ( = ?auto_724218 ?auto_724228 ) ) ( not ( = ?auto_724218 ?auto_724229 ) ) ( not ( = ?auto_724218 ?auto_724230 ) ) ( not ( = ?auto_724218 ?auto_724231 ) ) ( not ( = ?auto_724218 ?auto_724232 ) ) ( not ( = ?auto_724218 ?auto_724233 ) ) ( not ( = ?auto_724219 ?auto_724220 ) ) ( not ( = ?auto_724219 ?auto_724221 ) ) ( not ( = ?auto_724219 ?auto_724222 ) ) ( not ( = ?auto_724219 ?auto_724223 ) ) ( not ( = ?auto_724219 ?auto_724224 ) ) ( not ( = ?auto_724219 ?auto_724225 ) ) ( not ( = ?auto_724219 ?auto_724226 ) ) ( not ( = ?auto_724219 ?auto_724227 ) ) ( not ( = ?auto_724219 ?auto_724228 ) ) ( not ( = ?auto_724219 ?auto_724229 ) ) ( not ( = ?auto_724219 ?auto_724230 ) ) ( not ( = ?auto_724219 ?auto_724231 ) ) ( not ( = ?auto_724219 ?auto_724232 ) ) ( not ( = ?auto_724219 ?auto_724233 ) ) ( not ( = ?auto_724220 ?auto_724221 ) ) ( not ( = ?auto_724220 ?auto_724222 ) ) ( not ( = ?auto_724220 ?auto_724223 ) ) ( not ( = ?auto_724220 ?auto_724224 ) ) ( not ( = ?auto_724220 ?auto_724225 ) ) ( not ( = ?auto_724220 ?auto_724226 ) ) ( not ( = ?auto_724220 ?auto_724227 ) ) ( not ( = ?auto_724220 ?auto_724228 ) ) ( not ( = ?auto_724220 ?auto_724229 ) ) ( not ( = ?auto_724220 ?auto_724230 ) ) ( not ( = ?auto_724220 ?auto_724231 ) ) ( not ( = ?auto_724220 ?auto_724232 ) ) ( not ( = ?auto_724220 ?auto_724233 ) ) ( not ( = ?auto_724221 ?auto_724222 ) ) ( not ( = ?auto_724221 ?auto_724223 ) ) ( not ( = ?auto_724221 ?auto_724224 ) ) ( not ( = ?auto_724221 ?auto_724225 ) ) ( not ( = ?auto_724221 ?auto_724226 ) ) ( not ( = ?auto_724221 ?auto_724227 ) ) ( not ( = ?auto_724221 ?auto_724228 ) ) ( not ( = ?auto_724221 ?auto_724229 ) ) ( not ( = ?auto_724221 ?auto_724230 ) ) ( not ( = ?auto_724221 ?auto_724231 ) ) ( not ( = ?auto_724221 ?auto_724232 ) ) ( not ( = ?auto_724221 ?auto_724233 ) ) ( not ( = ?auto_724222 ?auto_724223 ) ) ( not ( = ?auto_724222 ?auto_724224 ) ) ( not ( = ?auto_724222 ?auto_724225 ) ) ( not ( = ?auto_724222 ?auto_724226 ) ) ( not ( = ?auto_724222 ?auto_724227 ) ) ( not ( = ?auto_724222 ?auto_724228 ) ) ( not ( = ?auto_724222 ?auto_724229 ) ) ( not ( = ?auto_724222 ?auto_724230 ) ) ( not ( = ?auto_724222 ?auto_724231 ) ) ( not ( = ?auto_724222 ?auto_724232 ) ) ( not ( = ?auto_724222 ?auto_724233 ) ) ( not ( = ?auto_724223 ?auto_724224 ) ) ( not ( = ?auto_724223 ?auto_724225 ) ) ( not ( = ?auto_724223 ?auto_724226 ) ) ( not ( = ?auto_724223 ?auto_724227 ) ) ( not ( = ?auto_724223 ?auto_724228 ) ) ( not ( = ?auto_724223 ?auto_724229 ) ) ( not ( = ?auto_724223 ?auto_724230 ) ) ( not ( = ?auto_724223 ?auto_724231 ) ) ( not ( = ?auto_724223 ?auto_724232 ) ) ( not ( = ?auto_724223 ?auto_724233 ) ) ( not ( = ?auto_724224 ?auto_724225 ) ) ( not ( = ?auto_724224 ?auto_724226 ) ) ( not ( = ?auto_724224 ?auto_724227 ) ) ( not ( = ?auto_724224 ?auto_724228 ) ) ( not ( = ?auto_724224 ?auto_724229 ) ) ( not ( = ?auto_724224 ?auto_724230 ) ) ( not ( = ?auto_724224 ?auto_724231 ) ) ( not ( = ?auto_724224 ?auto_724232 ) ) ( not ( = ?auto_724224 ?auto_724233 ) ) ( not ( = ?auto_724225 ?auto_724226 ) ) ( not ( = ?auto_724225 ?auto_724227 ) ) ( not ( = ?auto_724225 ?auto_724228 ) ) ( not ( = ?auto_724225 ?auto_724229 ) ) ( not ( = ?auto_724225 ?auto_724230 ) ) ( not ( = ?auto_724225 ?auto_724231 ) ) ( not ( = ?auto_724225 ?auto_724232 ) ) ( not ( = ?auto_724225 ?auto_724233 ) ) ( not ( = ?auto_724226 ?auto_724227 ) ) ( not ( = ?auto_724226 ?auto_724228 ) ) ( not ( = ?auto_724226 ?auto_724229 ) ) ( not ( = ?auto_724226 ?auto_724230 ) ) ( not ( = ?auto_724226 ?auto_724231 ) ) ( not ( = ?auto_724226 ?auto_724232 ) ) ( not ( = ?auto_724226 ?auto_724233 ) ) ( not ( = ?auto_724227 ?auto_724228 ) ) ( not ( = ?auto_724227 ?auto_724229 ) ) ( not ( = ?auto_724227 ?auto_724230 ) ) ( not ( = ?auto_724227 ?auto_724231 ) ) ( not ( = ?auto_724227 ?auto_724232 ) ) ( not ( = ?auto_724227 ?auto_724233 ) ) ( not ( = ?auto_724228 ?auto_724229 ) ) ( not ( = ?auto_724228 ?auto_724230 ) ) ( not ( = ?auto_724228 ?auto_724231 ) ) ( not ( = ?auto_724228 ?auto_724232 ) ) ( not ( = ?auto_724228 ?auto_724233 ) ) ( not ( = ?auto_724229 ?auto_724230 ) ) ( not ( = ?auto_724229 ?auto_724231 ) ) ( not ( = ?auto_724229 ?auto_724232 ) ) ( not ( = ?auto_724229 ?auto_724233 ) ) ( not ( = ?auto_724230 ?auto_724231 ) ) ( not ( = ?auto_724230 ?auto_724232 ) ) ( not ( = ?auto_724230 ?auto_724233 ) ) ( not ( = ?auto_724231 ?auto_724232 ) ) ( not ( = ?auto_724231 ?auto_724233 ) ) ( not ( = ?auto_724232 ?auto_724233 ) ) ( ON ?auto_724232 ?auto_724233 ) ( ON ?auto_724231 ?auto_724232 ) ( ON ?auto_724230 ?auto_724231 ) ( ON ?auto_724229 ?auto_724230 ) ( ON ?auto_724228 ?auto_724229 ) ( ON ?auto_724227 ?auto_724228 ) ( ON ?auto_724226 ?auto_724227 ) ( ON ?auto_724225 ?auto_724226 ) ( CLEAR ?auto_724223 ) ( ON ?auto_724224 ?auto_724225 ) ( CLEAR ?auto_724224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_724217 ?auto_724218 ?auto_724219 ?auto_724220 ?auto_724221 ?auto_724222 ?auto_724223 ?auto_724224 )
      ( MAKE-17PILE ?auto_724217 ?auto_724218 ?auto_724219 ?auto_724220 ?auto_724221 ?auto_724222 ?auto_724223 ?auto_724224 ?auto_724225 ?auto_724226 ?auto_724227 ?auto_724228 ?auto_724229 ?auto_724230 ?auto_724231 ?auto_724232 ?auto_724233 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724251 - BLOCK
      ?auto_724252 - BLOCK
      ?auto_724253 - BLOCK
      ?auto_724254 - BLOCK
      ?auto_724255 - BLOCK
      ?auto_724256 - BLOCK
      ?auto_724257 - BLOCK
      ?auto_724258 - BLOCK
      ?auto_724259 - BLOCK
      ?auto_724260 - BLOCK
      ?auto_724261 - BLOCK
      ?auto_724262 - BLOCK
      ?auto_724263 - BLOCK
      ?auto_724264 - BLOCK
      ?auto_724265 - BLOCK
      ?auto_724266 - BLOCK
      ?auto_724267 - BLOCK
    )
    :vars
    (
      ?auto_724268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724267 ?auto_724268 ) ( ON-TABLE ?auto_724251 ) ( ON ?auto_724252 ?auto_724251 ) ( ON ?auto_724253 ?auto_724252 ) ( ON ?auto_724254 ?auto_724253 ) ( ON ?auto_724255 ?auto_724254 ) ( ON ?auto_724256 ?auto_724255 ) ( not ( = ?auto_724251 ?auto_724252 ) ) ( not ( = ?auto_724251 ?auto_724253 ) ) ( not ( = ?auto_724251 ?auto_724254 ) ) ( not ( = ?auto_724251 ?auto_724255 ) ) ( not ( = ?auto_724251 ?auto_724256 ) ) ( not ( = ?auto_724251 ?auto_724257 ) ) ( not ( = ?auto_724251 ?auto_724258 ) ) ( not ( = ?auto_724251 ?auto_724259 ) ) ( not ( = ?auto_724251 ?auto_724260 ) ) ( not ( = ?auto_724251 ?auto_724261 ) ) ( not ( = ?auto_724251 ?auto_724262 ) ) ( not ( = ?auto_724251 ?auto_724263 ) ) ( not ( = ?auto_724251 ?auto_724264 ) ) ( not ( = ?auto_724251 ?auto_724265 ) ) ( not ( = ?auto_724251 ?auto_724266 ) ) ( not ( = ?auto_724251 ?auto_724267 ) ) ( not ( = ?auto_724251 ?auto_724268 ) ) ( not ( = ?auto_724252 ?auto_724253 ) ) ( not ( = ?auto_724252 ?auto_724254 ) ) ( not ( = ?auto_724252 ?auto_724255 ) ) ( not ( = ?auto_724252 ?auto_724256 ) ) ( not ( = ?auto_724252 ?auto_724257 ) ) ( not ( = ?auto_724252 ?auto_724258 ) ) ( not ( = ?auto_724252 ?auto_724259 ) ) ( not ( = ?auto_724252 ?auto_724260 ) ) ( not ( = ?auto_724252 ?auto_724261 ) ) ( not ( = ?auto_724252 ?auto_724262 ) ) ( not ( = ?auto_724252 ?auto_724263 ) ) ( not ( = ?auto_724252 ?auto_724264 ) ) ( not ( = ?auto_724252 ?auto_724265 ) ) ( not ( = ?auto_724252 ?auto_724266 ) ) ( not ( = ?auto_724252 ?auto_724267 ) ) ( not ( = ?auto_724252 ?auto_724268 ) ) ( not ( = ?auto_724253 ?auto_724254 ) ) ( not ( = ?auto_724253 ?auto_724255 ) ) ( not ( = ?auto_724253 ?auto_724256 ) ) ( not ( = ?auto_724253 ?auto_724257 ) ) ( not ( = ?auto_724253 ?auto_724258 ) ) ( not ( = ?auto_724253 ?auto_724259 ) ) ( not ( = ?auto_724253 ?auto_724260 ) ) ( not ( = ?auto_724253 ?auto_724261 ) ) ( not ( = ?auto_724253 ?auto_724262 ) ) ( not ( = ?auto_724253 ?auto_724263 ) ) ( not ( = ?auto_724253 ?auto_724264 ) ) ( not ( = ?auto_724253 ?auto_724265 ) ) ( not ( = ?auto_724253 ?auto_724266 ) ) ( not ( = ?auto_724253 ?auto_724267 ) ) ( not ( = ?auto_724253 ?auto_724268 ) ) ( not ( = ?auto_724254 ?auto_724255 ) ) ( not ( = ?auto_724254 ?auto_724256 ) ) ( not ( = ?auto_724254 ?auto_724257 ) ) ( not ( = ?auto_724254 ?auto_724258 ) ) ( not ( = ?auto_724254 ?auto_724259 ) ) ( not ( = ?auto_724254 ?auto_724260 ) ) ( not ( = ?auto_724254 ?auto_724261 ) ) ( not ( = ?auto_724254 ?auto_724262 ) ) ( not ( = ?auto_724254 ?auto_724263 ) ) ( not ( = ?auto_724254 ?auto_724264 ) ) ( not ( = ?auto_724254 ?auto_724265 ) ) ( not ( = ?auto_724254 ?auto_724266 ) ) ( not ( = ?auto_724254 ?auto_724267 ) ) ( not ( = ?auto_724254 ?auto_724268 ) ) ( not ( = ?auto_724255 ?auto_724256 ) ) ( not ( = ?auto_724255 ?auto_724257 ) ) ( not ( = ?auto_724255 ?auto_724258 ) ) ( not ( = ?auto_724255 ?auto_724259 ) ) ( not ( = ?auto_724255 ?auto_724260 ) ) ( not ( = ?auto_724255 ?auto_724261 ) ) ( not ( = ?auto_724255 ?auto_724262 ) ) ( not ( = ?auto_724255 ?auto_724263 ) ) ( not ( = ?auto_724255 ?auto_724264 ) ) ( not ( = ?auto_724255 ?auto_724265 ) ) ( not ( = ?auto_724255 ?auto_724266 ) ) ( not ( = ?auto_724255 ?auto_724267 ) ) ( not ( = ?auto_724255 ?auto_724268 ) ) ( not ( = ?auto_724256 ?auto_724257 ) ) ( not ( = ?auto_724256 ?auto_724258 ) ) ( not ( = ?auto_724256 ?auto_724259 ) ) ( not ( = ?auto_724256 ?auto_724260 ) ) ( not ( = ?auto_724256 ?auto_724261 ) ) ( not ( = ?auto_724256 ?auto_724262 ) ) ( not ( = ?auto_724256 ?auto_724263 ) ) ( not ( = ?auto_724256 ?auto_724264 ) ) ( not ( = ?auto_724256 ?auto_724265 ) ) ( not ( = ?auto_724256 ?auto_724266 ) ) ( not ( = ?auto_724256 ?auto_724267 ) ) ( not ( = ?auto_724256 ?auto_724268 ) ) ( not ( = ?auto_724257 ?auto_724258 ) ) ( not ( = ?auto_724257 ?auto_724259 ) ) ( not ( = ?auto_724257 ?auto_724260 ) ) ( not ( = ?auto_724257 ?auto_724261 ) ) ( not ( = ?auto_724257 ?auto_724262 ) ) ( not ( = ?auto_724257 ?auto_724263 ) ) ( not ( = ?auto_724257 ?auto_724264 ) ) ( not ( = ?auto_724257 ?auto_724265 ) ) ( not ( = ?auto_724257 ?auto_724266 ) ) ( not ( = ?auto_724257 ?auto_724267 ) ) ( not ( = ?auto_724257 ?auto_724268 ) ) ( not ( = ?auto_724258 ?auto_724259 ) ) ( not ( = ?auto_724258 ?auto_724260 ) ) ( not ( = ?auto_724258 ?auto_724261 ) ) ( not ( = ?auto_724258 ?auto_724262 ) ) ( not ( = ?auto_724258 ?auto_724263 ) ) ( not ( = ?auto_724258 ?auto_724264 ) ) ( not ( = ?auto_724258 ?auto_724265 ) ) ( not ( = ?auto_724258 ?auto_724266 ) ) ( not ( = ?auto_724258 ?auto_724267 ) ) ( not ( = ?auto_724258 ?auto_724268 ) ) ( not ( = ?auto_724259 ?auto_724260 ) ) ( not ( = ?auto_724259 ?auto_724261 ) ) ( not ( = ?auto_724259 ?auto_724262 ) ) ( not ( = ?auto_724259 ?auto_724263 ) ) ( not ( = ?auto_724259 ?auto_724264 ) ) ( not ( = ?auto_724259 ?auto_724265 ) ) ( not ( = ?auto_724259 ?auto_724266 ) ) ( not ( = ?auto_724259 ?auto_724267 ) ) ( not ( = ?auto_724259 ?auto_724268 ) ) ( not ( = ?auto_724260 ?auto_724261 ) ) ( not ( = ?auto_724260 ?auto_724262 ) ) ( not ( = ?auto_724260 ?auto_724263 ) ) ( not ( = ?auto_724260 ?auto_724264 ) ) ( not ( = ?auto_724260 ?auto_724265 ) ) ( not ( = ?auto_724260 ?auto_724266 ) ) ( not ( = ?auto_724260 ?auto_724267 ) ) ( not ( = ?auto_724260 ?auto_724268 ) ) ( not ( = ?auto_724261 ?auto_724262 ) ) ( not ( = ?auto_724261 ?auto_724263 ) ) ( not ( = ?auto_724261 ?auto_724264 ) ) ( not ( = ?auto_724261 ?auto_724265 ) ) ( not ( = ?auto_724261 ?auto_724266 ) ) ( not ( = ?auto_724261 ?auto_724267 ) ) ( not ( = ?auto_724261 ?auto_724268 ) ) ( not ( = ?auto_724262 ?auto_724263 ) ) ( not ( = ?auto_724262 ?auto_724264 ) ) ( not ( = ?auto_724262 ?auto_724265 ) ) ( not ( = ?auto_724262 ?auto_724266 ) ) ( not ( = ?auto_724262 ?auto_724267 ) ) ( not ( = ?auto_724262 ?auto_724268 ) ) ( not ( = ?auto_724263 ?auto_724264 ) ) ( not ( = ?auto_724263 ?auto_724265 ) ) ( not ( = ?auto_724263 ?auto_724266 ) ) ( not ( = ?auto_724263 ?auto_724267 ) ) ( not ( = ?auto_724263 ?auto_724268 ) ) ( not ( = ?auto_724264 ?auto_724265 ) ) ( not ( = ?auto_724264 ?auto_724266 ) ) ( not ( = ?auto_724264 ?auto_724267 ) ) ( not ( = ?auto_724264 ?auto_724268 ) ) ( not ( = ?auto_724265 ?auto_724266 ) ) ( not ( = ?auto_724265 ?auto_724267 ) ) ( not ( = ?auto_724265 ?auto_724268 ) ) ( not ( = ?auto_724266 ?auto_724267 ) ) ( not ( = ?auto_724266 ?auto_724268 ) ) ( not ( = ?auto_724267 ?auto_724268 ) ) ( ON ?auto_724266 ?auto_724267 ) ( ON ?auto_724265 ?auto_724266 ) ( ON ?auto_724264 ?auto_724265 ) ( ON ?auto_724263 ?auto_724264 ) ( ON ?auto_724262 ?auto_724263 ) ( ON ?auto_724261 ?auto_724262 ) ( ON ?auto_724260 ?auto_724261 ) ( ON ?auto_724259 ?auto_724260 ) ( ON ?auto_724258 ?auto_724259 ) ( CLEAR ?auto_724256 ) ( ON ?auto_724257 ?auto_724258 ) ( CLEAR ?auto_724257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_724251 ?auto_724252 ?auto_724253 ?auto_724254 ?auto_724255 ?auto_724256 ?auto_724257 )
      ( MAKE-17PILE ?auto_724251 ?auto_724252 ?auto_724253 ?auto_724254 ?auto_724255 ?auto_724256 ?auto_724257 ?auto_724258 ?auto_724259 ?auto_724260 ?auto_724261 ?auto_724262 ?auto_724263 ?auto_724264 ?auto_724265 ?auto_724266 ?auto_724267 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724286 - BLOCK
      ?auto_724287 - BLOCK
      ?auto_724288 - BLOCK
      ?auto_724289 - BLOCK
      ?auto_724290 - BLOCK
      ?auto_724291 - BLOCK
      ?auto_724292 - BLOCK
      ?auto_724293 - BLOCK
      ?auto_724294 - BLOCK
      ?auto_724295 - BLOCK
      ?auto_724296 - BLOCK
      ?auto_724297 - BLOCK
      ?auto_724298 - BLOCK
      ?auto_724299 - BLOCK
      ?auto_724300 - BLOCK
      ?auto_724301 - BLOCK
      ?auto_724302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724302 ) ( ON-TABLE ?auto_724286 ) ( ON ?auto_724287 ?auto_724286 ) ( ON ?auto_724288 ?auto_724287 ) ( ON ?auto_724289 ?auto_724288 ) ( ON ?auto_724290 ?auto_724289 ) ( ON ?auto_724291 ?auto_724290 ) ( not ( = ?auto_724286 ?auto_724287 ) ) ( not ( = ?auto_724286 ?auto_724288 ) ) ( not ( = ?auto_724286 ?auto_724289 ) ) ( not ( = ?auto_724286 ?auto_724290 ) ) ( not ( = ?auto_724286 ?auto_724291 ) ) ( not ( = ?auto_724286 ?auto_724292 ) ) ( not ( = ?auto_724286 ?auto_724293 ) ) ( not ( = ?auto_724286 ?auto_724294 ) ) ( not ( = ?auto_724286 ?auto_724295 ) ) ( not ( = ?auto_724286 ?auto_724296 ) ) ( not ( = ?auto_724286 ?auto_724297 ) ) ( not ( = ?auto_724286 ?auto_724298 ) ) ( not ( = ?auto_724286 ?auto_724299 ) ) ( not ( = ?auto_724286 ?auto_724300 ) ) ( not ( = ?auto_724286 ?auto_724301 ) ) ( not ( = ?auto_724286 ?auto_724302 ) ) ( not ( = ?auto_724287 ?auto_724288 ) ) ( not ( = ?auto_724287 ?auto_724289 ) ) ( not ( = ?auto_724287 ?auto_724290 ) ) ( not ( = ?auto_724287 ?auto_724291 ) ) ( not ( = ?auto_724287 ?auto_724292 ) ) ( not ( = ?auto_724287 ?auto_724293 ) ) ( not ( = ?auto_724287 ?auto_724294 ) ) ( not ( = ?auto_724287 ?auto_724295 ) ) ( not ( = ?auto_724287 ?auto_724296 ) ) ( not ( = ?auto_724287 ?auto_724297 ) ) ( not ( = ?auto_724287 ?auto_724298 ) ) ( not ( = ?auto_724287 ?auto_724299 ) ) ( not ( = ?auto_724287 ?auto_724300 ) ) ( not ( = ?auto_724287 ?auto_724301 ) ) ( not ( = ?auto_724287 ?auto_724302 ) ) ( not ( = ?auto_724288 ?auto_724289 ) ) ( not ( = ?auto_724288 ?auto_724290 ) ) ( not ( = ?auto_724288 ?auto_724291 ) ) ( not ( = ?auto_724288 ?auto_724292 ) ) ( not ( = ?auto_724288 ?auto_724293 ) ) ( not ( = ?auto_724288 ?auto_724294 ) ) ( not ( = ?auto_724288 ?auto_724295 ) ) ( not ( = ?auto_724288 ?auto_724296 ) ) ( not ( = ?auto_724288 ?auto_724297 ) ) ( not ( = ?auto_724288 ?auto_724298 ) ) ( not ( = ?auto_724288 ?auto_724299 ) ) ( not ( = ?auto_724288 ?auto_724300 ) ) ( not ( = ?auto_724288 ?auto_724301 ) ) ( not ( = ?auto_724288 ?auto_724302 ) ) ( not ( = ?auto_724289 ?auto_724290 ) ) ( not ( = ?auto_724289 ?auto_724291 ) ) ( not ( = ?auto_724289 ?auto_724292 ) ) ( not ( = ?auto_724289 ?auto_724293 ) ) ( not ( = ?auto_724289 ?auto_724294 ) ) ( not ( = ?auto_724289 ?auto_724295 ) ) ( not ( = ?auto_724289 ?auto_724296 ) ) ( not ( = ?auto_724289 ?auto_724297 ) ) ( not ( = ?auto_724289 ?auto_724298 ) ) ( not ( = ?auto_724289 ?auto_724299 ) ) ( not ( = ?auto_724289 ?auto_724300 ) ) ( not ( = ?auto_724289 ?auto_724301 ) ) ( not ( = ?auto_724289 ?auto_724302 ) ) ( not ( = ?auto_724290 ?auto_724291 ) ) ( not ( = ?auto_724290 ?auto_724292 ) ) ( not ( = ?auto_724290 ?auto_724293 ) ) ( not ( = ?auto_724290 ?auto_724294 ) ) ( not ( = ?auto_724290 ?auto_724295 ) ) ( not ( = ?auto_724290 ?auto_724296 ) ) ( not ( = ?auto_724290 ?auto_724297 ) ) ( not ( = ?auto_724290 ?auto_724298 ) ) ( not ( = ?auto_724290 ?auto_724299 ) ) ( not ( = ?auto_724290 ?auto_724300 ) ) ( not ( = ?auto_724290 ?auto_724301 ) ) ( not ( = ?auto_724290 ?auto_724302 ) ) ( not ( = ?auto_724291 ?auto_724292 ) ) ( not ( = ?auto_724291 ?auto_724293 ) ) ( not ( = ?auto_724291 ?auto_724294 ) ) ( not ( = ?auto_724291 ?auto_724295 ) ) ( not ( = ?auto_724291 ?auto_724296 ) ) ( not ( = ?auto_724291 ?auto_724297 ) ) ( not ( = ?auto_724291 ?auto_724298 ) ) ( not ( = ?auto_724291 ?auto_724299 ) ) ( not ( = ?auto_724291 ?auto_724300 ) ) ( not ( = ?auto_724291 ?auto_724301 ) ) ( not ( = ?auto_724291 ?auto_724302 ) ) ( not ( = ?auto_724292 ?auto_724293 ) ) ( not ( = ?auto_724292 ?auto_724294 ) ) ( not ( = ?auto_724292 ?auto_724295 ) ) ( not ( = ?auto_724292 ?auto_724296 ) ) ( not ( = ?auto_724292 ?auto_724297 ) ) ( not ( = ?auto_724292 ?auto_724298 ) ) ( not ( = ?auto_724292 ?auto_724299 ) ) ( not ( = ?auto_724292 ?auto_724300 ) ) ( not ( = ?auto_724292 ?auto_724301 ) ) ( not ( = ?auto_724292 ?auto_724302 ) ) ( not ( = ?auto_724293 ?auto_724294 ) ) ( not ( = ?auto_724293 ?auto_724295 ) ) ( not ( = ?auto_724293 ?auto_724296 ) ) ( not ( = ?auto_724293 ?auto_724297 ) ) ( not ( = ?auto_724293 ?auto_724298 ) ) ( not ( = ?auto_724293 ?auto_724299 ) ) ( not ( = ?auto_724293 ?auto_724300 ) ) ( not ( = ?auto_724293 ?auto_724301 ) ) ( not ( = ?auto_724293 ?auto_724302 ) ) ( not ( = ?auto_724294 ?auto_724295 ) ) ( not ( = ?auto_724294 ?auto_724296 ) ) ( not ( = ?auto_724294 ?auto_724297 ) ) ( not ( = ?auto_724294 ?auto_724298 ) ) ( not ( = ?auto_724294 ?auto_724299 ) ) ( not ( = ?auto_724294 ?auto_724300 ) ) ( not ( = ?auto_724294 ?auto_724301 ) ) ( not ( = ?auto_724294 ?auto_724302 ) ) ( not ( = ?auto_724295 ?auto_724296 ) ) ( not ( = ?auto_724295 ?auto_724297 ) ) ( not ( = ?auto_724295 ?auto_724298 ) ) ( not ( = ?auto_724295 ?auto_724299 ) ) ( not ( = ?auto_724295 ?auto_724300 ) ) ( not ( = ?auto_724295 ?auto_724301 ) ) ( not ( = ?auto_724295 ?auto_724302 ) ) ( not ( = ?auto_724296 ?auto_724297 ) ) ( not ( = ?auto_724296 ?auto_724298 ) ) ( not ( = ?auto_724296 ?auto_724299 ) ) ( not ( = ?auto_724296 ?auto_724300 ) ) ( not ( = ?auto_724296 ?auto_724301 ) ) ( not ( = ?auto_724296 ?auto_724302 ) ) ( not ( = ?auto_724297 ?auto_724298 ) ) ( not ( = ?auto_724297 ?auto_724299 ) ) ( not ( = ?auto_724297 ?auto_724300 ) ) ( not ( = ?auto_724297 ?auto_724301 ) ) ( not ( = ?auto_724297 ?auto_724302 ) ) ( not ( = ?auto_724298 ?auto_724299 ) ) ( not ( = ?auto_724298 ?auto_724300 ) ) ( not ( = ?auto_724298 ?auto_724301 ) ) ( not ( = ?auto_724298 ?auto_724302 ) ) ( not ( = ?auto_724299 ?auto_724300 ) ) ( not ( = ?auto_724299 ?auto_724301 ) ) ( not ( = ?auto_724299 ?auto_724302 ) ) ( not ( = ?auto_724300 ?auto_724301 ) ) ( not ( = ?auto_724300 ?auto_724302 ) ) ( not ( = ?auto_724301 ?auto_724302 ) ) ( ON ?auto_724301 ?auto_724302 ) ( ON ?auto_724300 ?auto_724301 ) ( ON ?auto_724299 ?auto_724300 ) ( ON ?auto_724298 ?auto_724299 ) ( ON ?auto_724297 ?auto_724298 ) ( ON ?auto_724296 ?auto_724297 ) ( ON ?auto_724295 ?auto_724296 ) ( ON ?auto_724294 ?auto_724295 ) ( ON ?auto_724293 ?auto_724294 ) ( CLEAR ?auto_724291 ) ( ON ?auto_724292 ?auto_724293 ) ( CLEAR ?auto_724292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_724286 ?auto_724287 ?auto_724288 ?auto_724289 ?auto_724290 ?auto_724291 ?auto_724292 )
      ( MAKE-17PILE ?auto_724286 ?auto_724287 ?auto_724288 ?auto_724289 ?auto_724290 ?auto_724291 ?auto_724292 ?auto_724293 ?auto_724294 ?auto_724295 ?auto_724296 ?auto_724297 ?auto_724298 ?auto_724299 ?auto_724300 ?auto_724301 ?auto_724302 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724320 - BLOCK
      ?auto_724321 - BLOCK
      ?auto_724322 - BLOCK
      ?auto_724323 - BLOCK
      ?auto_724324 - BLOCK
      ?auto_724325 - BLOCK
      ?auto_724326 - BLOCK
      ?auto_724327 - BLOCK
      ?auto_724328 - BLOCK
      ?auto_724329 - BLOCK
      ?auto_724330 - BLOCK
      ?auto_724331 - BLOCK
      ?auto_724332 - BLOCK
      ?auto_724333 - BLOCK
      ?auto_724334 - BLOCK
      ?auto_724335 - BLOCK
      ?auto_724336 - BLOCK
    )
    :vars
    (
      ?auto_724337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724336 ?auto_724337 ) ( ON-TABLE ?auto_724320 ) ( ON ?auto_724321 ?auto_724320 ) ( ON ?auto_724322 ?auto_724321 ) ( ON ?auto_724323 ?auto_724322 ) ( ON ?auto_724324 ?auto_724323 ) ( not ( = ?auto_724320 ?auto_724321 ) ) ( not ( = ?auto_724320 ?auto_724322 ) ) ( not ( = ?auto_724320 ?auto_724323 ) ) ( not ( = ?auto_724320 ?auto_724324 ) ) ( not ( = ?auto_724320 ?auto_724325 ) ) ( not ( = ?auto_724320 ?auto_724326 ) ) ( not ( = ?auto_724320 ?auto_724327 ) ) ( not ( = ?auto_724320 ?auto_724328 ) ) ( not ( = ?auto_724320 ?auto_724329 ) ) ( not ( = ?auto_724320 ?auto_724330 ) ) ( not ( = ?auto_724320 ?auto_724331 ) ) ( not ( = ?auto_724320 ?auto_724332 ) ) ( not ( = ?auto_724320 ?auto_724333 ) ) ( not ( = ?auto_724320 ?auto_724334 ) ) ( not ( = ?auto_724320 ?auto_724335 ) ) ( not ( = ?auto_724320 ?auto_724336 ) ) ( not ( = ?auto_724320 ?auto_724337 ) ) ( not ( = ?auto_724321 ?auto_724322 ) ) ( not ( = ?auto_724321 ?auto_724323 ) ) ( not ( = ?auto_724321 ?auto_724324 ) ) ( not ( = ?auto_724321 ?auto_724325 ) ) ( not ( = ?auto_724321 ?auto_724326 ) ) ( not ( = ?auto_724321 ?auto_724327 ) ) ( not ( = ?auto_724321 ?auto_724328 ) ) ( not ( = ?auto_724321 ?auto_724329 ) ) ( not ( = ?auto_724321 ?auto_724330 ) ) ( not ( = ?auto_724321 ?auto_724331 ) ) ( not ( = ?auto_724321 ?auto_724332 ) ) ( not ( = ?auto_724321 ?auto_724333 ) ) ( not ( = ?auto_724321 ?auto_724334 ) ) ( not ( = ?auto_724321 ?auto_724335 ) ) ( not ( = ?auto_724321 ?auto_724336 ) ) ( not ( = ?auto_724321 ?auto_724337 ) ) ( not ( = ?auto_724322 ?auto_724323 ) ) ( not ( = ?auto_724322 ?auto_724324 ) ) ( not ( = ?auto_724322 ?auto_724325 ) ) ( not ( = ?auto_724322 ?auto_724326 ) ) ( not ( = ?auto_724322 ?auto_724327 ) ) ( not ( = ?auto_724322 ?auto_724328 ) ) ( not ( = ?auto_724322 ?auto_724329 ) ) ( not ( = ?auto_724322 ?auto_724330 ) ) ( not ( = ?auto_724322 ?auto_724331 ) ) ( not ( = ?auto_724322 ?auto_724332 ) ) ( not ( = ?auto_724322 ?auto_724333 ) ) ( not ( = ?auto_724322 ?auto_724334 ) ) ( not ( = ?auto_724322 ?auto_724335 ) ) ( not ( = ?auto_724322 ?auto_724336 ) ) ( not ( = ?auto_724322 ?auto_724337 ) ) ( not ( = ?auto_724323 ?auto_724324 ) ) ( not ( = ?auto_724323 ?auto_724325 ) ) ( not ( = ?auto_724323 ?auto_724326 ) ) ( not ( = ?auto_724323 ?auto_724327 ) ) ( not ( = ?auto_724323 ?auto_724328 ) ) ( not ( = ?auto_724323 ?auto_724329 ) ) ( not ( = ?auto_724323 ?auto_724330 ) ) ( not ( = ?auto_724323 ?auto_724331 ) ) ( not ( = ?auto_724323 ?auto_724332 ) ) ( not ( = ?auto_724323 ?auto_724333 ) ) ( not ( = ?auto_724323 ?auto_724334 ) ) ( not ( = ?auto_724323 ?auto_724335 ) ) ( not ( = ?auto_724323 ?auto_724336 ) ) ( not ( = ?auto_724323 ?auto_724337 ) ) ( not ( = ?auto_724324 ?auto_724325 ) ) ( not ( = ?auto_724324 ?auto_724326 ) ) ( not ( = ?auto_724324 ?auto_724327 ) ) ( not ( = ?auto_724324 ?auto_724328 ) ) ( not ( = ?auto_724324 ?auto_724329 ) ) ( not ( = ?auto_724324 ?auto_724330 ) ) ( not ( = ?auto_724324 ?auto_724331 ) ) ( not ( = ?auto_724324 ?auto_724332 ) ) ( not ( = ?auto_724324 ?auto_724333 ) ) ( not ( = ?auto_724324 ?auto_724334 ) ) ( not ( = ?auto_724324 ?auto_724335 ) ) ( not ( = ?auto_724324 ?auto_724336 ) ) ( not ( = ?auto_724324 ?auto_724337 ) ) ( not ( = ?auto_724325 ?auto_724326 ) ) ( not ( = ?auto_724325 ?auto_724327 ) ) ( not ( = ?auto_724325 ?auto_724328 ) ) ( not ( = ?auto_724325 ?auto_724329 ) ) ( not ( = ?auto_724325 ?auto_724330 ) ) ( not ( = ?auto_724325 ?auto_724331 ) ) ( not ( = ?auto_724325 ?auto_724332 ) ) ( not ( = ?auto_724325 ?auto_724333 ) ) ( not ( = ?auto_724325 ?auto_724334 ) ) ( not ( = ?auto_724325 ?auto_724335 ) ) ( not ( = ?auto_724325 ?auto_724336 ) ) ( not ( = ?auto_724325 ?auto_724337 ) ) ( not ( = ?auto_724326 ?auto_724327 ) ) ( not ( = ?auto_724326 ?auto_724328 ) ) ( not ( = ?auto_724326 ?auto_724329 ) ) ( not ( = ?auto_724326 ?auto_724330 ) ) ( not ( = ?auto_724326 ?auto_724331 ) ) ( not ( = ?auto_724326 ?auto_724332 ) ) ( not ( = ?auto_724326 ?auto_724333 ) ) ( not ( = ?auto_724326 ?auto_724334 ) ) ( not ( = ?auto_724326 ?auto_724335 ) ) ( not ( = ?auto_724326 ?auto_724336 ) ) ( not ( = ?auto_724326 ?auto_724337 ) ) ( not ( = ?auto_724327 ?auto_724328 ) ) ( not ( = ?auto_724327 ?auto_724329 ) ) ( not ( = ?auto_724327 ?auto_724330 ) ) ( not ( = ?auto_724327 ?auto_724331 ) ) ( not ( = ?auto_724327 ?auto_724332 ) ) ( not ( = ?auto_724327 ?auto_724333 ) ) ( not ( = ?auto_724327 ?auto_724334 ) ) ( not ( = ?auto_724327 ?auto_724335 ) ) ( not ( = ?auto_724327 ?auto_724336 ) ) ( not ( = ?auto_724327 ?auto_724337 ) ) ( not ( = ?auto_724328 ?auto_724329 ) ) ( not ( = ?auto_724328 ?auto_724330 ) ) ( not ( = ?auto_724328 ?auto_724331 ) ) ( not ( = ?auto_724328 ?auto_724332 ) ) ( not ( = ?auto_724328 ?auto_724333 ) ) ( not ( = ?auto_724328 ?auto_724334 ) ) ( not ( = ?auto_724328 ?auto_724335 ) ) ( not ( = ?auto_724328 ?auto_724336 ) ) ( not ( = ?auto_724328 ?auto_724337 ) ) ( not ( = ?auto_724329 ?auto_724330 ) ) ( not ( = ?auto_724329 ?auto_724331 ) ) ( not ( = ?auto_724329 ?auto_724332 ) ) ( not ( = ?auto_724329 ?auto_724333 ) ) ( not ( = ?auto_724329 ?auto_724334 ) ) ( not ( = ?auto_724329 ?auto_724335 ) ) ( not ( = ?auto_724329 ?auto_724336 ) ) ( not ( = ?auto_724329 ?auto_724337 ) ) ( not ( = ?auto_724330 ?auto_724331 ) ) ( not ( = ?auto_724330 ?auto_724332 ) ) ( not ( = ?auto_724330 ?auto_724333 ) ) ( not ( = ?auto_724330 ?auto_724334 ) ) ( not ( = ?auto_724330 ?auto_724335 ) ) ( not ( = ?auto_724330 ?auto_724336 ) ) ( not ( = ?auto_724330 ?auto_724337 ) ) ( not ( = ?auto_724331 ?auto_724332 ) ) ( not ( = ?auto_724331 ?auto_724333 ) ) ( not ( = ?auto_724331 ?auto_724334 ) ) ( not ( = ?auto_724331 ?auto_724335 ) ) ( not ( = ?auto_724331 ?auto_724336 ) ) ( not ( = ?auto_724331 ?auto_724337 ) ) ( not ( = ?auto_724332 ?auto_724333 ) ) ( not ( = ?auto_724332 ?auto_724334 ) ) ( not ( = ?auto_724332 ?auto_724335 ) ) ( not ( = ?auto_724332 ?auto_724336 ) ) ( not ( = ?auto_724332 ?auto_724337 ) ) ( not ( = ?auto_724333 ?auto_724334 ) ) ( not ( = ?auto_724333 ?auto_724335 ) ) ( not ( = ?auto_724333 ?auto_724336 ) ) ( not ( = ?auto_724333 ?auto_724337 ) ) ( not ( = ?auto_724334 ?auto_724335 ) ) ( not ( = ?auto_724334 ?auto_724336 ) ) ( not ( = ?auto_724334 ?auto_724337 ) ) ( not ( = ?auto_724335 ?auto_724336 ) ) ( not ( = ?auto_724335 ?auto_724337 ) ) ( not ( = ?auto_724336 ?auto_724337 ) ) ( ON ?auto_724335 ?auto_724336 ) ( ON ?auto_724334 ?auto_724335 ) ( ON ?auto_724333 ?auto_724334 ) ( ON ?auto_724332 ?auto_724333 ) ( ON ?auto_724331 ?auto_724332 ) ( ON ?auto_724330 ?auto_724331 ) ( ON ?auto_724329 ?auto_724330 ) ( ON ?auto_724328 ?auto_724329 ) ( ON ?auto_724327 ?auto_724328 ) ( ON ?auto_724326 ?auto_724327 ) ( CLEAR ?auto_724324 ) ( ON ?auto_724325 ?auto_724326 ) ( CLEAR ?auto_724325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_724320 ?auto_724321 ?auto_724322 ?auto_724323 ?auto_724324 ?auto_724325 )
      ( MAKE-17PILE ?auto_724320 ?auto_724321 ?auto_724322 ?auto_724323 ?auto_724324 ?auto_724325 ?auto_724326 ?auto_724327 ?auto_724328 ?auto_724329 ?auto_724330 ?auto_724331 ?auto_724332 ?auto_724333 ?auto_724334 ?auto_724335 ?auto_724336 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724355 - BLOCK
      ?auto_724356 - BLOCK
      ?auto_724357 - BLOCK
      ?auto_724358 - BLOCK
      ?auto_724359 - BLOCK
      ?auto_724360 - BLOCK
      ?auto_724361 - BLOCK
      ?auto_724362 - BLOCK
      ?auto_724363 - BLOCK
      ?auto_724364 - BLOCK
      ?auto_724365 - BLOCK
      ?auto_724366 - BLOCK
      ?auto_724367 - BLOCK
      ?auto_724368 - BLOCK
      ?auto_724369 - BLOCK
      ?auto_724370 - BLOCK
      ?auto_724371 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724371 ) ( ON-TABLE ?auto_724355 ) ( ON ?auto_724356 ?auto_724355 ) ( ON ?auto_724357 ?auto_724356 ) ( ON ?auto_724358 ?auto_724357 ) ( ON ?auto_724359 ?auto_724358 ) ( not ( = ?auto_724355 ?auto_724356 ) ) ( not ( = ?auto_724355 ?auto_724357 ) ) ( not ( = ?auto_724355 ?auto_724358 ) ) ( not ( = ?auto_724355 ?auto_724359 ) ) ( not ( = ?auto_724355 ?auto_724360 ) ) ( not ( = ?auto_724355 ?auto_724361 ) ) ( not ( = ?auto_724355 ?auto_724362 ) ) ( not ( = ?auto_724355 ?auto_724363 ) ) ( not ( = ?auto_724355 ?auto_724364 ) ) ( not ( = ?auto_724355 ?auto_724365 ) ) ( not ( = ?auto_724355 ?auto_724366 ) ) ( not ( = ?auto_724355 ?auto_724367 ) ) ( not ( = ?auto_724355 ?auto_724368 ) ) ( not ( = ?auto_724355 ?auto_724369 ) ) ( not ( = ?auto_724355 ?auto_724370 ) ) ( not ( = ?auto_724355 ?auto_724371 ) ) ( not ( = ?auto_724356 ?auto_724357 ) ) ( not ( = ?auto_724356 ?auto_724358 ) ) ( not ( = ?auto_724356 ?auto_724359 ) ) ( not ( = ?auto_724356 ?auto_724360 ) ) ( not ( = ?auto_724356 ?auto_724361 ) ) ( not ( = ?auto_724356 ?auto_724362 ) ) ( not ( = ?auto_724356 ?auto_724363 ) ) ( not ( = ?auto_724356 ?auto_724364 ) ) ( not ( = ?auto_724356 ?auto_724365 ) ) ( not ( = ?auto_724356 ?auto_724366 ) ) ( not ( = ?auto_724356 ?auto_724367 ) ) ( not ( = ?auto_724356 ?auto_724368 ) ) ( not ( = ?auto_724356 ?auto_724369 ) ) ( not ( = ?auto_724356 ?auto_724370 ) ) ( not ( = ?auto_724356 ?auto_724371 ) ) ( not ( = ?auto_724357 ?auto_724358 ) ) ( not ( = ?auto_724357 ?auto_724359 ) ) ( not ( = ?auto_724357 ?auto_724360 ) ) ( not ( = ?auto_724357 ?auto_724361 ) ) ( not ( = ?auto_724357 ?auto_724362 ) ) ( not ( = ?auto_724357 ?auto_724363 ) ) ( not ( = ?auto_724357 ?auto_724364 ) ) ( not ( = ?auto_724357 ?auto_724365 ) ) ( not ( = ?auto_724357 ?auto_724366 ) ) ( not ( = ?auto_724357 ?auto_724367 ) ) ( not ( = ?auto_724357 ?auto_724368 ) ) ( not ( = ?auto_724357 ?auto_724369 ) ) ( not ( = ?auto_724357 ?auto_724370 ) ) ( not ( = ?auto_724357 ?auto_724371 ) ) ( not ( = ?auto_724358 ?auto_724359 ) ) ( not ( = ?auto_724358 ?auto_724360 ) ) ( not ( = ?auto_724358 ?auto_724361 ) ) ( not ( = ?auto_724358 ?auto_724362 ) ) ( not ( = ?auto_724358 ?auto_724363 ) ) ( not ( = ?auto_724358 ?auto_724364 ) ) ( not ( = ?auto_724358 ?auto_724365 ) ) ( not ( = ?auto_724358 ?auto_724366 ) ) ( not ( = ?auto_724358 ?auto_724367 ) ) ( not ( = ?auto_724358 ?auto_724368 ) ) ( not ( = ?auto_724358 ?auto_724369 ) ) ( not ( = ?auto_724358 ?auto_724370 ) ) ( not ( = ?auto_724358 ?auto_724371 ) ) ( not ( = ?auto_724359 ?auto_724360 ) ) ( not ( = ?auto_724359 ?auto_724361 ) ) ( not ( = ?auto_724359 ?auto_724362 ) ) ( not ( = ?auto_724359 ?auto_724363 ) ) ( not ( = ?auto_724359 ?auto_724364 ) ) ( not ( = ?auto_724359 ?auto_724365 ) ) ( not ( = ?auto_724359 ?auto_724366 ) ) ( not ( = ?auto_724359 ?auto_724367 ) ) ( not ( = ?auto_724359 ?auto_724368 ) ) ( not ( = ?auto_724359 ?auto_724369 ) ) ( not ( = ?auto_724359 ?auto_724370 ) ) ( not ( = ?auto_724359 ?auto_724371 ) ) ( not ( = ?auto_724360 ?auto_724361 ) ) ( not ( = ?auto_724360 ?auto_724362 ) ) ( not ( = ?auto_724360 ?auto_724363 ) ) ( not ( = ?auto_724360 ?auto_724364 ) ) ( not ( = ?auto_724360 ?auto_724365 ) ) ( not ( = ?auto_724360 ?auto_724366 ) ) ( not ( = ?auto_724360 ?auto_724367 ) ) ( not ( = ?auto_724360 ?auto_724368 ) ) ( not ( = ?auto_724360 ?auto_724369 ) ) ( not ( = ?auto_724360 ?auto_724370 ) ) ( not ( = ?auto_724360 ?auto_724371 ) ) ( not ( = ?auto_724361 ?auto_724362 ) ) ( not ( = ?auto_724361 ?auto_724363 ) ) ( not ( = ?auto_724361 ?auto_724364 ) ) ( not ( = ?auto_724361 ?auto_724365 ) ) ( not ( = ?auto_724361 ?auto_724366 ) ) ( not ( = ?auto_724361 ?auto_724367 ) ) ( not ( = ?auto_724361 ?auto_724368 ) ) ( not ( = ?auto_724361 ?auto_724369 ) ) ( not ( = ?auto_724361 ?auto_724370 ) ) ( not ( = ?auto_724361 ?auto_724371 ) ) ( not ( = ?auto_724362 ?auto_724363 ) ) ( not ( = ?auto_724362 ?auto_724364 ) ) ( not ( = ?auto_724362 ?auto_724365 ) ) ( not ( = ?auto_724362 ?auto_724366 ) ) ( not ( = ?auto_724362 ?auto_724367 ) ) ( not ( = ?auto_724362 ?auto_724368 ) ) ( not ( = ?auto_724362 ?auto_724369 ) ) ( not ( = ?auto_724362 ?auto_724370 ) ) ( not ( = ?auto_724362 ?auto_724371 ) ) ( not ( = ?auto_724363 ?auto_724364 ) ) ( not ( = ?auto_724363 ?auto_724365 ) ) ( not ( = ?auto_724363 ?auto_724366 ) ) ( not ( = ?auto_724363 ?auto_724367 ) ) ( not ( = ?auto_724363 ?auto_724368 ) ) ( not ( = ?auto_724363 ?auto_724369 ) ) ( not ( = ?auto_724363 ?auto_724370 ) ) ( not ( = ?auto_724363 ?auto_724371 ) ) ( not ( = ?auto_724364 ?auto_724365 ) ) ( not ( = ?auto_724364 ?auto_724366 ) ) ( not ( = ?auto_724364 ?auto_724367 ) ) ( not ( = ?auto_724364 ?auto_724368 ) ) ( not ( = ?auto_724364 ?auto_724369 ) ) ( not ( = ?auto_724364 ?auto_724370 ) ) ( not ( = ?auto_724364 ?auto_724371 ) ) ( not ( = ?auto_724365 ?auto_724366 ) ) ( not ( = ?auto_724365 ?auto_724367 ) ) ( not ( = ?auto_724365 ?auto_724368 ) ) ( not ( = ?auto_724365 ?auto_724369 ) ) ( not ( = ?auto_724365 ?auto_724370 ) ) ( not ( = ?auto_724365 ?auto_724371 ) ) ( not ( = ?auto_724366 ?auto_724367 ) ) ( not ( = ?auto_724366 ?auto_724368 ) ) ( not ( = ?auto_724366 ?auto_724369 ) ) ( not ( = ?auto_724366 ?auto_724370 ) ) ( not ( = ?auto_724366 ?auto_724371 ) ) ( not ( = ?auto_724367 ?auto_724368 ) ) ( not ( = ?auto_724367 ?auto_724369 ) ) ( not ( = ?auto_724367 ?auto_724370 ) ) ( not ( = ?auto_724367 ?auto_724371 ) ) ( not ( = ?auto_724368 ?auto_724369 ) ) ( not ( = ?auto_724368 ?auto_724370 ) ) ( not ( = ?auto_724368 ?auto_724371 ) ) ( not ( = ?auto_724369 ?auto_724370 ) ) ( not ( = ?auto_724369 ?auto_724371 ) ) ( not ( = ?auto_724370 ?auto_724371 ) ) ( ON ?auto_724370 ?auto_724371 ) ( ON ?auto_724369 ?auto_724370 ) ( ON ?auto_724368 ?auto_724369 ) ( ON ?auto_724367 ?auto_724368 ) ( ON ?auto_724366 ?auto_724367 ) ( ON ?auto_724365 ?auto_724366 ) ( ON ?auto_724364 ?auto_724365 ) ( ON ?auto_724363 ?auto_724364 ) ( ON ?auto_724362 ?auto_724363 ) ( ON ?auto_724361 ?auto_724362 ) ( CLEAR ?auto_724359 ) ( ON ?auto_724360 ?auto_724361 ) ( CLEAR ?auto_724360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_724355 ?auto_724356 ?auto_724357 ?auto_724358 ?auto_724359 ?auto_724360 )
      ( MAKE-17PILE ?auto_724355 ?auto_724356 ?auto_724357 ?auto_724358 ?auto_724359 ?auto_724360 ?auto_724361 ?auto_724362 ?auto_724363 ?auto_724364 ?auto_724365 ?auto_724366 ?auto_724367 ?auto_724368 ?auto_724369 ?auto_724370 ?auto_724371 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724389 - BLOCK
      ?auto_724390 - BLOCK
      ?auto_724391 - BLOCK
      ?auto_724392 - BLOCK
      ?auto_724393 - BLOCK
      ?auto_724394 - BLOCK
      ?auto_724395 - BLOCK
      ?auto_724396 - BLOCK
      ?auto_724397 - BLOCK
      ?auto_724398 - BLOCK
      ?auto_724399 - BLOCK
      ?auto_724400 - BLOCK
      ?auto_724401 - BLOCK
      ?auto_724402 - BLOCK
      ?auto_724403 - BLOCK
      ?auto_724404 - BLOCK
      ?auto_724405 - BLOCK
    )
    :vars
    (
      ?auto_724406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724405 ?auto_724406 ) ( ON-TABLE ?auto_724389 ) ( ON ?auto_724390 ?auto_724389 ) ( ON ?auto_724391 ?auto_724390 ) ( ON ?auto_724392 ?auto_724391 ) ( not ( = ?auto_724389 ?auto_724390 ) ) ( not ( = ?auto_724389 ?auto_724391 ) ) ( not ( = ?auto_724389 ?auto_724392 ) ) ( not ( = ?auto_724389 ?auto_724393 ) ) ( not ( = ?auto_724389 ?auto_724394 ) ) ( not ( = ?auto_724389 ?auto_724395 ) ) ( not ( = ?auto_724389 ?auto_724396 ) ) ( not ( = ?auto_724389 ?auto_724397 ) ) ( not ( = ?auto_724389 ?auto_724398 ) ) ( not ( = ?auto_724389 ?auto_724399 ) ) ( not ( = ?auto_724389 ?auto_724400 ) ) ( not ( = ?auto_724389 ?auto_724401 ) ) ( not ( = ?auto_724389 ?auto_724402 ) ) ( not ( = ?auto_724389 ?auto_724403 ) ) ( not ( = ?auto_724389 ?auto_724404 ) ) ( not ( = ?auto_724389 ?auto_724405 ) ) ( not ( = ?auto_724389 ?auto_724406 ) ) ( not ( = ?auto_724390 ?auto_724391 ) ) ( not ( = ?auto_724390 ?auto_724392 ) ) ( not ( = ?auto_724390 ?auto_724393 ) ) ( not ( = ?auto_724390 ?auto_724394 ) ) ( not ( = ?auto_724390 ?auto_724395 ) ) ( not ( = ?auto_724390 ?auto_724396 ) ) ( not ( = ?auto_724390 ?auto_724397 ) ) ( not ( = ?auto_724390 ?auto_724398 ) ) ( not ( = ?auto_724390 ?auto_724399 ) ) ( not ( = ?auto_724390 ?auto_724400 ) ) ( not ( = ?auto_724390 ?auto_724401 ) ) ( not ( = ?auto_724390 ?auto_724402 ) ) ( not ( = ?auto_724390 ?auto_724403 ) ) ( not ( = ?auto_724390 ?auto_724404 ) ) ( not ( = ?auto_724390 ?auto_724405 ) ) ( not ( = ?auto_724390 ?auto_724406 ) ) ( not ( = ?auto_724391 ?auto_724392 ) ) ( not ( = ?auto_724391 ?auto_724393 ) ) ( not ( = ?auto_724391 ?auto_724394 ) ) ( not ( = ?auto_724391 ?auto_724395 ) ) ( not ( = ?auto_724391 ?auto_724396 ) ) ( not ( = ?auto_724391 ?auto_724397 ) ) ( not ( = ?auto_724391 ?auto_724398 ) ) ( not ( = ?auto_724391 ?auto_724399 ) ) ( not ( = ?auto_724391 ?auto_724400 ) ) ( not ( = ?auto_724391 ?auto_724401 ) ) ( not ( = ?auto_724391 ?auto_724402 ) ) ( not ( = ?auto_724391 ?auto_724403 ) ) ( not ( = ?auto_724391 ?auto_724404 ) ) ( not ( = ?auto_724391 ?auto_724405 ) ) ( not ( = ?auto_724391 ?auto_724406 ) ) ( not ( = ?auto_724392 ?auto_724393 ) ) ( not ( = ?auto_724392 ?auto_724394 ) ) ( not ( = ?auto_724392 ?auto_724395 ) ) ( not ( = ?auto_724392 ?auto_724396 ) ) ( not ( = ?auto_724392 ?auto_724397 ) ) ( not ( = ?auto_724392 ?auto_724398 ) ) ( not ( = ?auto_724392 ?auto_724399 ) ) ( not ( = ?auto_724392 ?auto_724400 ) ) ( not ( = ?auto_724392 ?auto_724401 ) ) ( not ( = ?auto_724392 ?auto_724402 ) ) ( not ( = ?auto_724392 ?auto_724403 ) ) ( not ( = ?auto_724392 ?auto_724404 ) ) ( not ( = ?auto_724392 ?auto_724405 ) ) ( not ( = ?auto_724392 ?auto_724406 ) ) ( not ( = ?auto_724393 ?auto_724394 ) ) ( not ( = ?auto_724393 ?auto_724395 ) ) ( not ( = ?auto_724393 ?auto_724396 ) ) ( not ( = ?auto_724393 ?auto_724397 ) ) ( not ( = ?auto_724393 ?auto_724398 ) ) ( not ( = ?auto_724393 ?auto_724399 ) ) ( not ( = ?auto_724393 ?auto_724400 ) ) ( not ( = ?auto_724393 ?auto_724401 ) ) ( not ( = ?auto_724393 ?auto_724402 ) ) ( not ( = ?auto_724393 ?auto_724403 ) ) ( not ( = ?auto_724393 ?auto_724404 ) ) ( not ( = ?auto_724393 ?auto_724405 ) ) ( not ( = ?auto_724393 ?auto_724406 ) ) ( not ( = ?auto_724394 ?auto_724395 ) ) ( not ( = ?auto_724394 ?auto_724396 ) ) ( not ( = ?auto_724394 ?auto_724397 ) ) ( not ( = ?auto_724394 ?auto_724398 ) ) ( not ( = ?auto_724394 ?auto_724399 ) ) ( not ( = ?auto_724394 ?auto_724400 ) ) ( not ( = ?auto_724394 ?auto_724401 ) ) ( not ( = ?auto_724394 ?auto_724402 ) ) ( not ( = ?auto_724394 ?auto_724403 ) ) ( not ( = ?auto_724394 ?auto_724404 ) ) ( not ( = ?auto_724394 ?auto_724405 ) ) ( not ( = ?auto_724394 ?auto_724406 ) ) ( not ( = ?auto_724395 ?auto_724396 ) ) ( not ( = ?auto_724395 ?auto_724397 ) ) ( not ( = ?auto_724395 ?auto_724398 ) ) ( not ( = ?auto_724395 ?auto_724399 ) ) ( not ( = ?auto_724395 ?auto_724400 ) ) ( not ( = ?auto_724395 ?auto_724401 ) ) ( not ( = ?auto_724395 ?auto_724402 ) ) ( not ( = ?auto_724395 ?auto_724403 ) ) ( not ( = ?auto_724395 ?auto_724404 ) ) ( not ( = ?auto_724395 ?auto_724405 ) ) ( not ( = ?auto_724395 ?auto_724406 ) ) ( not ( = ?auto_724396 ?auto_724397 ) ) ( not ( = ?auto_724396 ?auto_724398 ) ) ( not ( = ?auto_724396 ?auto_724399 ) ) ( not ( = ?auto_724396 ?auto_724400 ) ) ( not ( = ?auto_724396 ?auto_724401 ) ) ( not ( = ?auto_724396 ?auto_724402 ) ) ( not ( = ?auto_724396 ?auto_724403 ) ) ( not ( = ?auto_724396 ?auto_724404 ) ) ( not ( = ?auto_724396 ?auto_724405 ) ) ( not ( = ?auto_724396 ?auto_724406 ) ) ( not ( = ?auto_724397 ?auto_724398 ) ) ( not ( = ?auto_724397 ?auto_724399 ) ) ( not ( = ?auto_724397 ?auto_724400 ) ) ( not ( = ?auto_724397 ?auto_724401 ) ) ( not ( = ?auto_724397 ?auto_724402 ) ) ( not ( = ?auto_724397 ?auto_724403 ) ) ( not ( = ?auto_724397 ?auto_724404 ) ) ( not ( = ?auto_724397 ?auto_724405 ) ) ( not ( = ?auto_724397 ?auto_724406 ) ) ( not ( = ?auto_724398 ?auto_724399 ) ) ( not ( = ?auto_724398 ?auto_724400 ) ) ( not ( = ?auto_724398 ?auto_724401 ) ) ( not ( = ?auto_724398 ?auto_724402 ) ) ( not ( = ?auto_724398 ?auto_724403 ) ) ( not ( = ?auto_724398 ?auto_724404 ) ) ( not ( = ?auto_724398 ?auto_724405 ) ) ( not ( = ?auto_724398 ?auto_724406 ) ) ( not ( = ?auto_724399 ?auto_724400 ) ) ( not ( = ?auto_724399 ?auto_724401 ) ) ( not ( = ?auto_724399 ?auto_724402 ) ) ( not ( = ?auto_724399 ?auto_724403 ) ) ( not ( = ?auto_724399 ?auto_724404 ) ) ( not ( = ?auto_724399 ?auto_724405 ) ) ( not ( = ?auto_724399 ?auto_724406 ) ) ( not ( = ?auto_724400 ?auto_724401 ) ) ( not ( = ?auto_724400 ?auto_724402 ) ) ( not ( = ?auto_724400 ?auto_724403 ) ) ( not ( = ?auto_724400 ?auto_724404 ) ) ( not ( = ?auto_724400 ?auto_724405 ) ) ( not ( = ?auto_724400 ?auto_724406 ) ) ( not ( = ?auto_724401 ?auto_724402 ) ) ( not ( = ?auto_724401 ?auto_724403 ) ) ( not ( = ?auto_724401 ?auto_724404 ) ) ( not ( = ?auto_724401 ?auto_724405 ) ) ( not ( = ?auto_724401 ?auto_724406 ) ) ( not ( = ?auto_724402 ?auto_724403 ) ) ( not ( = ?auto_724402 ?auto_724404 ) ) ( not ( = ?auto_724402 ?auto_724405 ) ) ( not ( = ?auto_724402 ?auto_724406 ) ) ( not ( = ?auto_724403 ?auto_724404 ) ) ( not ( = ?auto_724403 ?auto_724405 ) ) ( not ( = ?auto_724403 ?auto_724406 ) ) ( not ( = ?auto_724404 ?auto_724405 ) ) ( not ( = ?auto_724404 ?auto_724406 ) ) ( not ( = ?auto_724405 ?auto_724406 ) ) ( ON ?auto_724404 ?auto_724405 ) ( ON ?auto_724403 ?auto_724404 ) ( ON ?auto_724402 ?auto_724403 ) ( ON ?auto_724401 ?auto_724402 ) ( ON ?auto_724400 ?auto_724401 ) ( ON ?auto_724399 ?auto_724400 ) ( ON ?auto_724398 ?auto_724399 ) ( ON ?auto_724397 ?auto_724398 ) ( ON ?auto_724396 ?auto_724397 ) ( ON ?auto_724395 ?auto_724396 ) ( ON ?auto_724394 ?auto_724395 ) ( CLEAR ?auto_724392 ) ( ON ?auto_724393 ?auto_724394 ) ( CLEAR ?auto_724393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_724389 ?auto_724390 ?auto_724391 ?auto_724392 ?auto_724393 )
      ( MAKE-17PILE ?auto_724389 ?auto_724390 ?auto_724391 ?auto_724392 ?auto_724393 ?auto_724394 ?auto_724395 ?auto_724396 ?auto_724397 ?auto_724398 ?auto_724399 ?auto_724400 ?auto_724401 ?auto_724402 ?auto_724403 ?auto_724404 ?auto_724405 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724424 - BLOCK
      ?auto_724425 - BLOCK
      ?auto_724426 - BLOCK
      ?auto_724427 - BLOCK
      ?auto_724428 - BLOCK
      ?auto_724429 - BLOCK
      ?auto_724430 - BLOCK
      ?auto_724431 - BLOCK
      ?auto_724432 - BLOCK
      ?auto_724433 - BLOCK
      ?auto_724434 - BLOCK
      ?auto_724435 - BLOCK
      ?auto_724436 - BLOCK
      ?auto_724437 - BLOCK
      ?auto_724438 - BLOCK
      ?auto_724439 - BLOCK
      ?auto_724440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724440 ) ( ON-TABLE ?auto_724424 ) ( ON ?auto_724425 ?auto_724424 ) ( ON ?auto_724426 ?auto_724425 ) ( ON ?auto_724427 ?auto_724426 ) ( not ( = ?auto_724424 ?auto_724425 ) ) ( not ( = ?auto_724424 ?auto_724426 ) ) ( not ( = ?auto_724424 ?auto_724427 ) ) ( not ( = ?auto_724424 ?auto_724428 ) ) ( not ( = ?auto_724424 ?auto_724429 ) ) ( not ( = ?auto_724424 ?auto_724430 ) ) ( not ( = ?auto_724424 ?auto_724431 ) ) ( not ( = ?auto_724424 ?auto_724432 ) ) ( not ( = ?auto_724424 ?auto_724433 ) ) ( not ( = ?auto_724424 ?auto_724434 ) ) ( not ( = ?auto_724424 ?auto_724435 ) ) ( not ( = ?auto_724424 ?auto_724436 ) ) ( not ( = ?auto_724424 ?auto_724437 ) ) ( not ( = ?auto_724424 ?auto_724438 ) ) ( not ( = ?auto_724424 ?auto_724439 ) ) ( not ( = ?auto_724424 ?auto_724440 ) ) ( not ( = ?auto_724425 ?auto_724426 ) ) ( not ( = ?auto_724425 ?auto_724427 ) ) ( not ( = ?auto_724425 ?auto_724428 ) ) ( not ( = ?auto_724425 ?auto_724429 ) ) ( not ( = ?auto_724425 ?auto_724430 ) ) ( not ( = ?auto_724425 ?auto_724431 ) ) ( not ( = ?auto_724425 ?auto_724432 ) ) ( not ( = ?auto_724425 ?auto_724433 ) ) ( not ( = ?auto_724425 ?auto_724434 ) ) ( not ( = ?auto_724425 ?auto_724435 ) ) ( not ( = ?auto_724425 ?auto_724436 ) ) ( not ( = ?auto_724425 ?auto_724437 ) ) ( not ( = ?auto_724425 ?auto_724438 ) ) ( not ( = ?auto_724425 ?auto_724439 ) ) ( not ( = ?auto_724425 ?auto_724440 ) ) ( not ( = ?auto_724426 ?auto_724427 ) ) ( not ( = ?auto_724426 ?auto_724428 ) ) ( not ( = ?auto_724426 ?auto_724429 ) ) ( not ( = ?auto_724426 ?auto_724430 ) ) ( not ( = ?auto_724426 ?auto_724431 ) ) ( not ( = ?auto_724426 ?auto_724432 ) ) ( not ( = ?auto_724426 ?auto_724433 ) ) ( not ( = ?auto_724426 ?auto_724434 ) ) ( not ( = ?auto_724426 ?auto_724435 ) ) ( not ( = ?auto_724426 ?auto_724436 ) ) ( not ( = ?auto_724426 ?auto_724437 ) ) ( not ( = ?auto_724426 ?auto_724438 ) ) ( not ( = ?auto_724426 ?auto_724439 ) ) ( not ( = ?auto_724426 ?auto_724440 ) ) ( not ( = ?auto_724427 ?auto_724428 ) ) ( not ( = ?auto_724427 ?auto_724429 ) ) ( not ( = ?auto_724427 ?auto_724430 ) ) ( not ( = ?auto_724427 ?auto_724431 ) ) ( not ( = ?auto_724427 ?auto_724432 ) ) ( not ( = ?auto_724427 ?auto_724433 ) ) ( not ( = ?auto_724427 ?auto_724434 ) ) ( not ( = ?auto_724427 ?auto_724435 ) ) ( not ( = ?auto_724427 ?auto_724436 ) ) ( not ( = ?auto_724427 ?auto_724437 ) ) ( not ( = ?auto_724427 ?auto_724438 ) ) ( not ( = ?auto_724427 ?auto_724439 ) ) ( not ( = ?auto_724427 ?auto_724440 ) ) ( not ( = ?auto_724428 ?auto_724429 ) ) ( not ( = ?auto_724428 ?auto_724430 ) ) ( not ( = ?auto_724428 ?auto_724431 ) ) ( not ( = ?auto_724428 ?auto_724432 ) ) ( not ( = ?auto_724428 ?auto_724433 ) ) ( not ( = ?auto_724428 ?auto_724434 ) ) ( not ( = ?auto_724428 ?auto_724435 ) ) ( not ( = ?auto_724428 ?auto_724436 ) ) ( not ( = ?auto_724428 ?auto_724437 ) ) ( not ( = ?auto_724428 ?auto_724438 ) ) ( not ( = ?auto_724428 ?auto_724439 ) ) ( not ( = ?auto_724428 ?auto_724440 ) ) ( not ( = ?auto_724429 ?auto_724430 ) ) ( not ( = ?auto_724429 ?auto_724431 ) ) ( not ( = ?auto_724429 ?auto_724432 ) ) ( not ( = ?auto_724429 ?auto_724433 ) ) ( not ( = ?auto_724429 ?auto_724434 ) ) ( not ( = ?auto_724429 ?auto_724435 ) ) ( not ( = ?auto_724429 ?auto_724436 ) ) ( not ( = ?auto_724429 ?auto_724437 ) ) ( not ( = ?auto_724429 ?auto_724438 ) ) ( not ( = ?auto_724429 ?auto_724439 ) ) ( not ( = ?auto_724429 ?auto_724440 ) ) ( not ( = ?auto_724430 ?auto_724431 ) ) ( not ( = ?auto_724430 ?auto_724432 ) ) ( not ( = ?auto_724430 ?auto_724433 ) ) ( not ( = ?auto_724430 ?auto_724434 ) ) ( not ( = ?auto_724430 ?auto_724435 ) ) ( not ( = ?auto_724430 ?auto_724436 ) ) ( not ( = ?auto_724430 ?auto_724437 ) ) ( not ( = ?auto_724430 ?auto_724438 ) ) ( not ( = ?auto_724430 ?auto_724439 ) ) ( not ( = ?auto_724430 ?auto_724440 ) ) ( not ( = ?auto_724431 ?auto_724432 ) ) ( not ( = ?auto_724431 ?auto_724433 ) ) ( not ( = ?auto_724431 ?auto_724434 ) ) ( not ( = ?auto_724431 ?auto_724435 ) ) ( not ( = ?auto_724431 ?auto_724436 ) ) ( not ( = ?auto_724431 ?auto_724437 ) ) ( not ( = ?auto_724431 ?auto_724438 ) ) ( not ( = ?auto_724431 ?auto_724439 ) ) ( not ( = ?auto_724431 ?auto_724440 ) ) ( not ( = ?auto_724432 ?auto_724433 ) ) ( not ( = ?auto_724432 ?auto_724434 ) ) ( not ( = ?auto_724432 ?auto_724435 ) ) ( not ( = ?auto_724432 ?auto_724436 ) ) ( not ( = ?auto_724432 ?auto_724437 ) ) ( not ( = ?auto_724432 ?auto_724438 ) ) ( not ( = ?auto_724432 ?auto_724439 ) ) ( not ( = ?auto_724432 ?auto_724440 ) ) ( not ( = ?auto_724433 ?auto_724434 ) ) ( not ( = ?auto_724433 ?auto_724435 ) ) ( not ( = ?auto_724433 ?auto_724436 ) ) ( not ( = ?auto_724433 ?auto_724437 ) ) ( not ( = ?auto_724433 ?auto_724438 ) ) ( not ( = ?auto_724433 ?auto_724439 ) ) ( not ( = ?auto_724433 ?auto_724440 ) ) ( not ( = ?auto_724434 ?auto_724435 ) ) ( not ( = ?auto_724434 ?auto_724436 ) ) ( not ( = ?auto_724434 ?auto_724437 ) ) ( not ( = ?auto_724434 ?auto_724438 ) ) ( not ( = ?auto_724434 ?auto_724439 ) ) ( not ( = ?auto_724434 ?auto_724440 ) ) ( not ( = ?auto_724435 ?auto_724436 ) ) ( not ( = ?auto_724435 ?auto_724437 ) ) ( not ( = ?auto_724435 ?auto_724438 ) ) ( not ( = ?auto_724435 ?auto_724439 ) ) ( not ( = ?auto_724435 ?auto_724440 ) ) ( not ( = ?auto_724436 ?auto_724437 ) ) ( not ( = ?auto_724436 ?auto_724438 ) ) ( not ( = ?auto_724436 ?auto_724439 ) ) ( not ( = ?auto_724436 ?auto_724440 ) ) ( not ( = ?auto_724437 ?auto_724438 ) ) ( not ( = ?auto_724437 ?auto_724439 ) ) ( not ( = ?auto_724437 ?auto_724440 ) ) ( not ( = ?auto_724438 ?auto_724439 ) ) ( not ( = ?auto_724438 ?auto_724440 ) ) ( not ( = ?auto_724439 ?auto_724440 ) ) ( ON ?auto_724439 ?auto_724440 ) ( ON ?auto_724438 ?auto_724439 ) ( ON ?auto_724437 ?auto_724438 ) ( ON ?auto_724436 ?auto_724437 ) ( ON ?auto_724435 ?auto_724436 ) ( ON ?auto_724434 ?auto_724435 ) ( ON ?auto_724433 ?auto_724434 ) ( ON ?auto_724432 ?auto_724433 ) ( ON ?auto_724431 ?auto_724432 ) ( ON ?auto_724430 ?auto_724431 ) ( ON ?auto_724429 ?auto_724430 ) ( CLEAR ?auto_724427 ) ( ON ?auto_724428 ?auto_724429 ) ( CLEAR ?auto_724428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_724424 ?auto_724425 ?auto_724426 ?auto_724427 ?auto_724428 )
      ( MAKE-17PILE ?auto_724424 ?auto_724425 ?auto_724426 ?auto_724427 ?auto_724428 ?auto_724429 ?auto_724430 ?auto_724431 ?auto_724432 ?auto_724433 ?auto_724434 ?auto_724435 ?auto_724436 ?auto_724437 ?auto_724438 ?auto_724439 ?auto_724440 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724458 - BLOCK
      ?auto_724459 - BLOCK
      ?auto_724460 - BLOCK
      ?auto_724461 - BLOCK
      ?auto_724462 - BLOCK
      ?auto_724463 - BLOCK
      ?auto_724464 - BLOCK
      ?auto_724465 - BLOCK
      ?auto_724466 - BLOCK
      ?auto_724467 - BLOCK
      ?auto_724468 - BLOCK
      ?auto_724469 - BLOCK
      ?auto_724470 - BLOCK
      ?auto_724471 - BLOCK
      ?auto_724472 - BLOCK
      ?auto_724473 - BLOCK
      ?auto_724474 - BLOCK
    )
    :vars
    (
      ?auto_724475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724474 ?auto_724475 ) ( ON-TABLE ?auto_724458 ) ( ON ?auto_724459 ?auto_724458 ) ( ON ?auto_724460 ?auto_724459 ) ( not ( = ?auto_724458 ?auto_724459 ) ) ( not ( = ?auto_724458 ?auto_724460 ) ) ( not ( = ?auto_724458 ?auto_724461 ) ) ( not ( = ?auto_724458 ?auto_724462 ) ) ( not ( = ?auto_724458 ?auto_724463 ) ) ( not ( = ?auto_724458 ?auto_724464 ) ) ( not ( = ?auto_724458 ?auto_724465 ) ) ( not ( = ?auto_724458 ?auto_724466 ) ) ( not ( = ?auto_724458 ?auto_724467 ) ) ( not ( = ?auto_724458 ?auto_724468 ) ) ( not ( = ?auto_724458 ?auto_724469 ) ) ( not ( = ?auto_724458 ?auto_724470 ) ) ( not ( = ?auto_724458 ?auto_724471 ) ) ( not ( = ?auto_724458 ?auto_724472 ) ) ( not ( = ?auto_724458 ?auto_724473 ) ) ( not ( = ?auto_724458 ?auto_724474 ) ) ( not ( = ?auto_724458 ?auto_724475 ) ) ( not ( = ?auto_724459 ?auto_724460 ) ) ( not ( = ?auto_724459 ?auto_724461 ) ) ( not ( = ?auto_724459 ?auto_724462 ) ) ( not ( = ?auto_724459 ?auto_724463 ) ) ( not ( = ?auto_724459 ?auto_724464 ) ) ( not ( = ?auto_724459 ?auto_724465 ) ) ( not ( = ?auto_724459 ?auto_724466 ) ) ( not ( = ?auto_724459 ?auto_724467 ) ) ( not ( = ?auto_724459 ?auto_724468 ) ) ( not ( = ?auto_724459 ?auto_724469 ) ) ( not ( = ?auto_724459 ?auto_724470 ) ) ( not ( = ?auto_724459 ?auto_724471 ) ) ( not ( = ?auto_724459 ?auto_724472 ) ) ( not ( = ?auto_724459 ?auto_724473 ) ) ( not ( = ?auto_724459 ?auto_724474 ) ) ( not ( = ?auto_724459 ?auto_724475 ) ) ( not ( = ?auto_724460 ?auto_724461 ) ) ( not ( = ?auto_724460 ?auto_724462 ) ) ( not ( = ?auto_724460 ?auto_724463 ) ) ( not ( = ?auto_724460 ?auto_724464 ) ) ( not ( = ?auto_724460 ?auto_724465 ) ) ( not ( = ?auto_724460 ?auto_724466 ) ) ( not ( = ?auto_724460 ?auto_724467 ) ) ( not ( = ?auto_724460 ?auto_724468 ) ) ( not ( = ?auto_724460 ?auto_724469 ) ) ( not ( = ?auto_724460 ?auto_724470 ) ) ( not ( = ?auto_724460 ?auto_724471 ) ) ( not ( = ?auto_724460 ?auto_724472 ) ) ( not ( = ?auto_724460 ?auto_724473 ) ) ( not ( = ?auto_724460 ?auto_724474 ) ) ( not ( = ?auto_724460 ?auto_724475 ) ) ( not ( = ?auto_724461 ?auto_724462 ) ) ( not ( = ?auto_724461 ?auto_724463 ) ) ( not ( = ?auto_724461 ?auto_724464 ) ) ( not ( = ?auto_724461 ?auto_724465 ) ) ( not ( = ?auto_724461 ?auto_724466 ) ) ( not ( = ?auto_724461 ?auto_724467 ) ) ( not ( = ?auto_724461 ?auto_724468 ) ) ( not ( = ?auto_724461 ?auto_724469 ) ) ( not ( = ?auto_724461 ?auto_724470 ) ) ( not ( = ?auto_724461 ?auto_724471 ) ) ( not ( = ?auto_724461 ?auto_724472 ) ) ( not ( = ?auto_724461 ?auto_724473 ) ) ( not ( = ?auto_724461 ?auto_724474 ) ) ( not ( = ?auto_724461 ?auto_724475 ) ) ( not ( = ?auto_724462 ?auto_724463 ) ) ( not ( = ?auto_724462 ?auto_724464 ) ) ( not ( = ?auto_724462 ?auto_724465 ) ) ( not ( = ?auto_724462 ?auto_724466 ) ) ( not ( = ?auto_724462 ?auto_724467 ) ) ( not ( = ?auto_724462 ?auto_724468 ) ) ( not ( = ?auto_724462 ?auto_724469 ) ) ( not ( = ?auto_724462 ?auto_724470 ) ) ( not ( = ?auto_724462 ?auto_724471 ) ) ( not ( = ?auto_724462 ?auto_724472 ) ) ( not ( = ?auto_724462 ?auto_724473 ) ) ( not ( = ?auto_724462 ?auto_724474 ) ) ( not ( = ?auto_724462 ?auto_724475 ) ) ( not ( = ?auto_724463 ?auto_724464 ) ) ( not ( = ?auto_724463 ?auto_724465 ) ) ( not ( = ?auto_724463 ?auto_724466 ) ) ( not ( = ?auto_724463 ?auto_724467 ) ) ( not ( = ?auto_724463 ?auto_724468 ) ) ( not ( = ?auto_724463 ?auto_724469 ) ) ( not ( = ?auto_724463 ?auto_724470 ) ) ( not ( = ?auto_724463 ?auto_724471 ) ) ( not ( = ?auto_724463 ?auto_724472 ) ) ( not ( = ?auto_724463 ?auto_724473 ) ) ( not ( = ?auto_724463 ?auto_724474 ) ) ( not ( = ?auto_724463 ?auto_724475 ) ) ( not ( = ?auto_724464 ?auto_724465 ) ) ( not ( = ?auto_724464 ?auto_724466 ) ) ( not ( = ?auto_724464 ?auto_724467 ) ) ( not ( = ?auto_724464 ?auto_724468 ) ) ( not ( = ?auto_724464 ?auto_724469 ) ) ( not ( = ?auto_724464 ?auto_724470 ) ) ( not ( = ?auto_724464 ?auto_724471 ) ) ( not ( = ?auto_724464 ?auto_724472 ) ) ( not ( = ?auto_724464 ?auto_724473 ) ) ( not ( = ?auto_724464 ?auto_724474 ) ) ( not ( = ?auto_724464 ?auto_724475 ) ) ( not ( = ?auto_724465 ?auto_724466 ) ) ( not ( = ?auto_724465 ?auto_724467 ) ) ( not ( = ?auto_724465 ?auto_724468 ) ) ( not ( = ?auto_724465 ?auto_724469 ) ) ( not ( = ?auto_724465 ?auto_724470 ) ) ( not ( = ?auto_724465 ?auto_724471 ) ) ( not ( = ?auto_724465 ?auto_724472 ) ) ( not ( = ?auto_724465 ?auto_724473 ) ) ( not ( = ?auto_724465 ?auto_724474 ) ) ( not ( = ?auto_724465 ?auto_724475 ) ) ( not ( = ?auto_724466 ?auto_724467 ) ) ( not ( = ?auto_724466 ?auto_724468 ) ) ( not ( = ?auto_724466 ?auto_724469 ) ) ( not ( = ?auto_724466 ?auto_724470 ) ) ( not ( = ?auto_724466 ?auto_724471 ) ) ( not ( = ?auto_724466 ?auto_724472 ) ) ( not ( = ?auto_724466 ?auto_724473 ) ) ( not ( = ?auto_724466 ?auto_724474 ) ) ( not ( = ?auto_724466 ?auto_724475 ) ) ( not ( = ?auto_724467 ?auto_724468 ) ) ( not ( = ?auto_724467 ?auto_724469 ) ) ( not ( = ?auto_724467 ?auto_724470 ) ) ( not ( = ?auto_724467 ?auto_724471 ) ) ( not ( = ?auto_724467 ?auto_724472 ) ) ( not ( = ?auto_724467 ?auto_724473 ) ) ( not ( = ?auto_724467 ?auto_724474 ) ) ( not ( = ?auto_724467 ?auto_724475 ) ) ( not ( = ?auto_724468 ?auto_724469 ) ) ( not ( = ?auto_724468 ?auto_724470 ) ) ( not ( = ?auto_724468 ?auto_724471 ) ) ( not ( = ?auto_724468 ?auto_724472 ) ) ( not ( = ?auto_724468 ?auto_724473 ) ) ( not ( = ?auto_724468 ?auto_724474 ) ) ( not ( = ?auto_724468 ?auto_724475 ) ) ( not ( = ?auto_724469 ?auto_724470 ) ) ( not ( = ?auto_724469 ?auto_724471 ) ) ( not ( = ?auto_724469 ?auto_724472 ) ) ( not ( = ?auto_724469 ?auto_724473 ) ) ( not ( = ?auto_724469 ?auto_724474 ) ) ( not ( = ?auto_724469 ?auto_724475 ) ) ( not ( = ?auto_724470 ?auto_724471 ) ) ( not ( = ?auto_724470 ?auto_724472 ) ) ( not ( = ?auto_724470 ?auto_724473 ) ) ( not ( = ?auto_724470 ?auto_724474 ) ) ( not ( = ?auto_724470 ?auto_724475 ) ) ( not ( = ?auto_724471 ?auto_724472 ) ) ( not ( = ?auto_724471 ?auto_724473 ) ) ( not ( = ?auto_724471 ?auto_724474 ) ) ( not ( = ?auto_724471 ?auto_724475 ) ) ( not ( = ?auto_724472 ?auto_724473 ) ) ( not ( = ?auto_724472 ?auto_724474 ) ) ( not ( = ?auto_724472 ?auto_724475 ) ) ( not ( = ?auto_724473 ?auto_724474 ) ) ( not ( = ?auto_724473 ?auto_724475 ) ) ( not ( = ?auto_724474 ?auto_724475 ) ) ( ON ?auto_724473 ?auto_724474 ) ( ON ?auto_724472 ?auto_724473 ) ( ON ?auto_724471 ?auto_724472 ) ( ON ?auto_724470 ?auto_724471 ) ( ON ?auto_724469 ?auto_724470 ) ( ON ?auto_724468 ?auto_724469 ) ( ON ?auto_724467 ?auto_724468 ) ( ON ?auto_724466 ?auto_724467 ) ( ON ?auto_724465 ?auto_724466 ) ( ON ?auto_724464 ?auto_724465 ) ( ON ?auto_724463 ?auto_724464 ) ( ON ?auto_724462 ?auto_724463 ) ( CLEAR ?auto_724460 ) ( ON ?auto_724461 ?auto_724462 ) ( CLEAR ?auto_724461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_724458 ?auto_724459 ?auto_724460 ?auto_724461 )
      ( MAKE-17PILE ?auto_724458 ?auto_724459 ?auto_724460 ?auto_724461 ?auto_724462 ?auto_724463 ?auto_724464 ?auto_724465 ?auto_724466 ?auto_724467 ?auto_724468 ?auto_724469 ?auto_724470 ?auto_724471 ?auto_724472 ?auto_724473 ?auto_724474 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724493 - BLOCK
      ?auto_724494 - BLOCK
      ?auto_724495 - BLOCK
      ?auto_724496 - BLOCK
      ?auto_724497 - BLOCK
      ?auto_724498 - BLOCK
      ?auto_724499 - BLOCK
      ?auto_724500 - BLOCK
      ?auto_724501 - BLOCK
      ?auto_724502 - BLOCK
      ?auto_724503 - BLOCK
      ?auto_724504 - BLOCK
      ?auto_724505 - BLOCK
      ?auto_724506 - BLOCK
      ?auto_724507 - BLOCK
      ?auto_724508 - BLOCK
      ?auto_724509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724509 ) ( ON-TABLE ?auto_724493 ) ( ON ?auto_724494 ?auto_724493 ) ( ON ?auto_724495 ?auto_724494 ) ( not ( = ?auto_724493 ?auto_724494 ) ) ( not ( = ?auto_724493 ?auto_724495 ) ) ( not ( = ?auto_724493 ?auto_724496 ) ) ( not ( = ?auto_724493 ?auto_724497 ) ) ( not ( = ?auto_724493 ?auto_724498 ) ) ( not ( = ?auto_724493 ?auto_724499 ) ) ( not ( = ?auto_724493 ?auto_724500 ) ) ( not ( = ?auto_724493 ?auto_724501 ) ) ( not ( = ?auto_724493 ?auto_724502 ) ) ( not ( = ?auto_724493 ?auto_724503 ) ) ( not ( = ?auto_724493 ?auto_724504 ) ) ( not ( = ?auto_724493 ?auto_724505 ) ) ( not ( = ?auto_724493 ?auto_724506 ) ) ( not ( = ?auto_724493 ?auto_724507 ) ) ( not ( = ?auto_724493 ?auto_724508 ) ) ( not ( = ?auto_724493 ?auto_724509 ) ) ( not ( = ?auto_724494 ?auto_724495 ) ) ( not ( = ?auto_724494 ?auto_724496 ) ) ( not ( = ?auto_724494 ?auto_724497 ) ) ( not ( = ?auto_724494 ?auto_724498 ) ) ( not ( = ?auto_724494 ?auto_724499 ) ) ( not ( = ?auto_724494 ?auto_724500 ) ) ( not ( = ?auto_724494 ?auto_724501 ) ) ( not ( = ?auto_724494 ?auto_724502 ) ) ( not ( = ?auto_724494 ?auto_724503 ) ) ( not ( = ?auto_724494 ?auto_724504 ) ) ( not ( = ?auto_724494 ?auto_724505 ) ) ( not ( = ?auto_724494 ?auto_724506 ) ) ( not ( = ?auto_724494 ?auto_724507 ) ) ( not ( = ?auto_724494 ?auto_724508 ) ) ( not ( = ?auto_724494 ?auto_724509 ) ) ( not ( = ?auto_724495 ?auto_724496 ) ) ( not ( = ?auto_724495 ?auto_724497 ) ) ( not ( = ?auto_724495 ?auto_724498 ) ) ( not ( = ?auto_724495 ?auto_724499 ) ) ( not ( = ?auto_724495 ?auto_724500 ) ) ( not ( = ?auto_724495 ?auto_724501 ) ) ( not ( = ?auto_724495 ?auto_724502 ) ) ( not ( = ?auto_724495 ?auto_724503 ) ) ( not ( = ?auto_724495 ?auto_724504 ) ) ( not ( = ?auto_724495 ?auto_724505 ) ) ( not ( = ?auto_724495 ?auto_724506 ) ) ( not ( = ?auto_724495 ?auto_724507 ) ) ( not ( = ?auto_724495 ?auto_724508 ) ) ( not ( = ?auto_724495 ?auto_724509 ) ) ( not ( = ?auto_724496 ?auto_724497 ) ) ( not ( = ?auto_724496 ?auto_724498 ) ) ( not ( = ?auto_724496 ?auto_724499 ) ) ( not ( = ?auto_724496 ?auto_724500 ) ) ( not ( = ?auto_724496 ?auto_724501 ) ) ( not ( = ?auto_724496 ?auto_724502 ) ) ( not ( = ?auto_724496 ?auto_724503 ) ) ( not ( = ?auto_724496 ?auto_724504 ) ) ( not ( = ?auto_724496 ?auto_724505 ) ) ( not ( = ?auto_724496 ?auto_724506 ) ) ( not ( = ?auto_724496 ?auto_724507 ) ) ( not ( = ?auto_724496 ?auto_724508 ) ) ( not ( = ?auto_724496 ?auto_724509 ) ) ( not ( = ?auto_724497 ?auto_724498 ) ) ( not ( = ?auto_724497 ?auto_724499 ) ) ( not ( = ?auto_724497 ?auto_724500 ) ) ( not ( = ?auto_724497 ?auto_724501 ) ) ( not ( = ?auto_724497 ?auto_724502 ) ) ( not ( = ?auto_724497 ?auto_724503 ) ) ( not ( = ?auto_724497 ?auto_724504 ) ) ( not ( = ?auto_724497 ?auto_724505 ) ) ( not ( = ?auto_724497 ?auto_724506 ) ) ( not ( = ?auto_724497 ?auto_724507 ) ) ( not ( = ?auto_724497 ?auto_724508 ) ) ( not ( = ?auto_724497 ?auto_724509 ) ) ( not ( = ?auto_724498 ?auto_724499 ) ) ( not ( = ?auto_724498 ?auto_724500 ) ) ( not ( = ?auto_724498 ?auto_724501 ) ) ( not ( = ?auto_724498 ?auto_724502 ) ) ( not ( = ?auto_724498 ?auto_724503 ) ) ( not ( = ?auto_724498 ?auto_724504 ) ) ( not ( = ?auto_724498 ?auto_724505 ) ) ( not ( = ?auto_724498 ?auto_724506 ) ) ( not ( = ?auto_724498 ?auto_724507 ) ) ( not ( = ?auto_724498 ?auto_724508 ) ) ( not ( = ?auto_724498 ?auto_724509 ) ) ( not ( = ?auto_724499 ?auto_724500 ) ) ( not ( = ?auto_724499 ?auto_724501 ) ) ( not ( = ?auto_724499 ?auto_724502 ) ) ( not ( = ?auto_724499 ?auto_724503 ) ) ( not ( = ?auto_724499 ?auto_724504 ) ) ( not ( = ?auto_724499 ?auto_724505 ) ) ( not ( = ?auto_724499 ?auto_724506 ) ) ( not ( = ?auto_724499 ?auto_724507 ) ) ( not ( = ?auto_724499 ?auto_724508 ) ) ( not ( = ?auto_724499 ?auto_724509 ) ) ( not ( = ?auto_724500 ?auto_724501 ) ) ( not ( = ?auto_724500 ?auto_724502 ) ) ( not ( = ?auto_724500 ?auto_724503 ) ) ( not ( = ?auto_724500 ?auto_724504 ) ) ( not ( = ?auto_724500 ?auto_724505 ) ) ( not ( = ?auto_724500 ?auto_724506 ) ) ( not ( = ?auto_724500 ?auto_724507 ) ) ( not ( = ?auto_724500 ?auto_724508 ) ) ( not ( = ?auto_724500 ?auto_724509 ) ) ( not ( = ?auto_724501 ?auto_724502 ) ) ( not ( = ?auto_724501 ?auto_724503 ) ) ( not ( = ?auto_724501 ?auto_724504 ) ) ( not ( = ?auto_724501 ?auto_724505 ) ) ( not ( = ?auto_724501 ?auto_724506 ) ) ( not ( = ?auto_724501 ?auto_724507 ) ) ( not ( = ?auto_724501 ?auto_724508 ) ) ( not ( = ?auto_724501 ?auto_724509 ) ) ( not ( = ?auto_724502 ?auto_724503 ) ) ( not ( = ?auto_724502 ?auto_724504 ) ) ( not ( = ?auto_724502 ?auto_724505 ) ) ( not ( = ?auto_724502 ?auto_724506 ) ) ( not ( = ?auto_724502 ?auto_724507 ) ) ( not ( = ?auto_724502 ?auto_724508 ) ) ( not ( = ?auto_724502 ?auto_724509 ) ) ( not ( = ?auto_724503 ?auto_724504 ) ) ( not ( = ?auto_724503 ?auto_724505 ) ) ( not ( = ?auto_724503 ?auto_724506 ) ) ( not ( = ?auto_724503 ?auto_724507 ) ) ( not ( = ?auto_724503 ?auto_724508 ) ) ( not ( = ?auto_724503 ?auto_724509 ) ) ( not ( = ?auto_724504 ?auto_724505 ) ) ( not ( = ?auto_724504 ?auto_724506 ) ) ( not ( = ?auto_724504 ?auto_724507 ) ) ( not ( = ?auto_724504 ?auto_724508 ) ) ( not ( = ?auto_724504 ?auto_724509 ) ) ( not ( = ?auto_724505 ?auto_724506 ) ) ( not ( = ?auto_724505 ?auto_724507 ) ) ( not ( = ?auto_724505 ?auto_724508 ) ) ( not ( = ?auto_724505 ?auto_724509 ) ) ( not ( = ?auto_724506 ?auto_724507 ) ) ( not ( = ?auto_724506 ?auto_724508 ) ) ( not ( = ?auto_724506 ?auto_724509 ) ) ( not ( = ?auto_724507 ?auto_724508 ) ) ( not ( = ?auto_724507 ?auto_724509 ) ) ( not ( = ?auto_724508 ?auto_724509 ) ) ( ON ?auto_724508 ?auto_724509 ) ( ON ?auto_724507 ?auto_724508 ) ( ON ?auto_724506 ?auto_724507 ) ( ON ?auto_724505 ?auto_724506 ) ( ON ?auto_724504 ?auto_724505 ) ( ON ?auto_724503 ?auto_724504 ) ( ON ?auto_724502 ?auto_724503 ) ( ON ?auto_724501 ?auto_724502 ) ( ON ?auto_724500 ?auto_724501 ) ( ON ?auto_724499 ?auto_724500 ) ( ON ?auto_724498 ?auto_724499 ) ( ON ?auto_724497 ?auto_724498 ) ( CLEAR ?auto_724495 ) ( ON ?auto_724496 ?auto_724497 ) ( CLEAR ?auto_724496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_724493 ?auto_724494 ?auto_724495 ?auto_724496 )
      ( MAKE-17PILE ?auto_724493 ?auto_724494 ?auto_724495 ?auto_724496 ?auto_724497 ?auto_724498 ?auto_724499 ?auto_724500 ?auto_724501 ?auto_724502 ?auto_724503 ?auto_724504 ?auto_724505 ?auto_724506 ?auto_724507 ?auto_724508 ?auto_724509 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724527 - BLOCK
      ?auto_724528 - BLOCK
      ?auto_724529 - BLOCK
      ?auto_724530 - BLOCK
      ?auto_724531 - BLOCK
      ?auto_724532 - BLOCK
      ?auto_724533 - BLOCK
      ?auto_724534 - BLOCK
      ?auto_724535 - BLOCK
      ?auto_724536 - BLOCK
      ?auto_724537 - BLOCK
      ?auto_724538 - BLOCK
      ?auto_724539 - BLOCK
      ?auto_724540 - BLOCK
      ?auto_724541 - BLOCK
      ?auto_724542 - BLOCK
      ?auto_724543 - BLOCK
    )
    :vars
    (
      ?auto_724544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724543 ?auto_724544 ) ( ON-TABLE ?auto_724527 ) ( ON ?auto_724528 ?auto_724527 ) ( not ( = ?auto_724527 ?auto_724528 ) ) ( not ( = ?auto_724527 ?auto_724529 ) ) ( not ( = ?auto_724527 ?auto_724530 ) ) ( not ( = ?auto_724527 ?auto_724531 ) ) ( not ( = ?auto_724527 ?auto_724532 ) ) ( not ( = ?auto_724527 ?auto_724533 ) ) ( not ( = ?auto_724527 ?auto_724534 ) ) ( not ( = ?auto_724527 ?auto_724535 ) ) ( not ( = ?auto_724527 ?auto_724536 ) ) ( not ( = ?auto_724527 ?auto_724537 ) ) ( not ( = ?auto_724527 ?auto_724538 ) ) ( not ( = ?auto_724527 ?auto_724539 ) ) ( not ( = ?auto_724527 ?auto_724540 ) ) ( not ( = ?auto_724527 ?auto_724541 ) ) ( not ( = ?auto_724527 ?auto_724542 ) ) ( not ( = ?auto_724527 ?auto_724543 ) ) ( not ( = ?auto_724527 ?auto_724544 ) ) ( not ( = ?auto_724528 ?auto_724529 ) ) ( not ( = ?auto_724528 ?auto_724530 ) ) ( not ( = ?auto_724528 ?auto_724531 ) ) ( not ( = ?auto_724528 ?auto_724532 ) ) ( not ( = ?auto_724528 ?auto_724533 ) ) ( not ( = ?auto_724528 ?auto_724534 ) ) ( not ( = ?auto_724528 ?auto_724535 ) ) ( not ( = ?auto_724528 ?auto_724536 ) ) ( not ( = ?auto_724528 ?auto_724537 ) ) ( not ( = ?auto_724528 ?auto_724538 ) ) ( not ( = ?auto_724528 ?auto_724539 ) ) ( not ( = ?auto_724528 ?auto_724540 ) ) ( not ( = ?auto_724528 ?auto_724541 ) ) ( not ( = ?auto_724528 ?auto_724542 ) ) ( not ( = ?auto_724528 ?auto_724543 ) ) ( not ( = ?auto_724528 ?auto_724544 ) ) ( not ( = ?auto_724529 ?auto_724530 ) ) ( not ( = ?auto_724529 ?auto_724531 ) ) ( not ( = ?auto_724529 ?auto_724532 ) ) ( not ( = ?auto_724529 ?auto_724533 ) ) ( not ( = ?auto_724529 ?auto_724534 ) ) ( not ( = ?auto_724529 ?auto_724535 ) ) ( not ( = ?auto_724529 ?auto_724536 ) ) ( not ( = ?auto_724529 ?auto_724537 ) ) ( not ( = ?auto_724529 ?auto_724538 ) ) ( not ( = ?auto_724529 ?auto_724539 ) ) ( not ( = ?auto_724529 ?auto_724540 ) ) ( not ( = ?auto_724529 ?auto_724541 ) ) ( not ( = ?auto_724529 ?auto_724542 ) ) ( not ( = ?auto_724529 ?auto_724543 ) ) ( not ( = ?auto_724529 ?auto_724544 ) ) ( not ( = ?auto_724530 ?auto_724531 ) ) ( not ( = ?auto_724530 ?auto_724532 ) ) ( not ( = ?auto_724530 ?auto_724533 ) ) ( not ( = ?auto_724530 ?auto_724534 ) ) ( not ( = ?auto_724530 ?auto_724535 ) ) ( not ( = ?auto_724530 ?auto_724536 ) ) ( not ( = ?auto_724530 ?auto_724537 ) ) ( not ( = ?auto_724530 ?auto_724538 ) ) ( not ( = ?auto_724530 ?auto_724539 ) ) ( not ( = ?auto_724530 ?auto_724540 ) ) ( not ( = ?auto_724530 ?auto_724541 ) ) ( not ( = ?auto_724530 ?auto_724542 ) ) ( not ( = ?auto_724530 ?auto_724543 ) ) ( not ( = ?auto_724530 ?auto_724544 ) ) ( not ( = ?auto_724531 ?auto_724532 ) ) ( not ( = ?auto_724531 ?auto_724533 ) ) ( not ( = ?auto_724531 ?auto_724534 ) ) ( not ( = ?auto_724531 ?auto_724535 ) ) ( not ( = ?auto_724531 ?auto_724536 ) ) ( not ( = ?auto_724531 ?auto_724537 ) ) ( not ( = ?auto_724531 ?auto_724538 ) ) ( not ( = ?auto_724531 ?auto_724539 ) ) ( not ( = ?auto_724531 ?auto_724540 ) ) ( not ( = ?auto_724531 ?auto_724541 ) ) ( not ( = ?auto_724531 ?auto_724542 ) ) ( not ( = ?auto_724531 ?auto_724543 ) ) ( not ( = ?auto_724531 ?auto_724544 ) ) ( not ( = ?auto_724532 ?auto_724533 ) ) ( not ( = ?auto_724532 ?auto_724534 ) ) ( not ( = ?auto_724532 ?auto_724535 ) ) ( not ( = ?auto_724532 ?auto_724536 ) ) ( not ( = ?auto_724532 ?auto_724537 ) ) ( not ( = ?auto_724532 ?auto_724538 ) ) ( not ( = ?auto_724532 ?auto_724539 ) ) ( not ( = ?auto_724532 ?auto_724540 ) ) ( not ( = ?auto_724532 ?auto_724541 ) ) ( not ( = ?auto_724532 ?auto_724542 ) ) ( not ( = ?auto_724532 ?auto_724543 ) ) ( not ( = ?auto_724532 ?auto_724544 ) ) ( not ( = ?auto_724533 ?auto_724534 ) ) ( not ( = ?auto_724533 ?auto_724535 ) ) ( not ( = ?auto_724533 ?auto_724536 ) ) ( not ( = ?auto_724533 ?auto_724537 ) ) ( not ( = ?auto_724533 ?auto_724538 ) ) ( not ( = ?auto_724533 ?auto_724539 ) ) ( not ( = ?auto_724533 ?auto_724540 ) ) ( not ( = ?auto_724533 ?auto_724541 ) ) ( not ( = ?auto_724533 ?auto_724542 ) ) ( not ( = ?auto_724533 ?auto_724543 ) ) ( not ( = ?auto_724533 ?auto_724544 ) ) ( not ( = ?auto_724534 ?auto_724535 ) ) ( not ( = ?auto_724534 ?auto_724536 ) ) ( not ( = ?auto_724534 ?auto_724537 ) ) ( not ( = ?auto_724534 ?auto_724538 ) ) ( not ( = ?auto_724534 ?auto_724539 ) ) ( not ( = ?auto_724534 ?auto_724540 ) ) ( not ( = ?auto_724534 ?auto_724541 ) ) ( not ( = ?auto_724534 ?auto_724542 ) ) ( not ( = ?auto_724534 ?auto_724543 ) ) ( not ( = ?auto_724534 ?auto_724544 ) ) ( not ( = ?auto_724535 ?auto_724536 ) ) ( not ( = ?auto_724535 ?auto_724537 ) ) ( not ( = ?auto_724535 ?auto_724538 ) ) ( not ( = ?auto_724535 ?auto_724539 ) ) ( not ( = ?auto_724535 ?auto_724540 ) ) ( not ( = ?auto_724535 ?auto_724541 ) ) ( not ( = ?auto_724535 ?auto_724542 ) ) ( not ( = ?auto_724535 ?auto_724543 ) ) ( not ( = ?auto_724535 ?auto_724544 ) ) ( not ( = ?auto_724536 ?auto_724537 ) ) ( not ( = ?auto_724536 ?auto_724538 ) ) ( not ( = ?auto_724536 ?auto_724539 ) ) ( not ( = ?auto_724536 ?auto_724540 ) ) ( not ( = ?auto_724536 ?auto_724541 ) ) ( not ( = ?auto_724536 ?auto_724542 ) ) ( not ( = ?auto_724536 ?auto_724543 ) ) ( not ( = ?auto_724536 ?auto_724544 ) ) ( not ( = ?auto_724537 ?auto_724538 ) ) ( not ( = ?auto_724537 ?auto_724539 ) ) ( not ( = ?auto_724537 ?auto_724540 ) ) ( not ( = ?auto_724537 ?auto_724541 ) ) ( not ( = ?auto_724537 ?auto_724542 ) ) ( not ( = ?auto_724537 ?auto_724543 ) ) ( not ( = ?auto_724537 ?auto_724544 ) ) ( not ( = ?auto_724538 ?auto_724539 ) ) ( not ( = ?auto_724538 ?auto_724540 ) ) ( not ( = ?auto_724538 ?auto_724541 ) ) ( not ( = ?auto_724538 ?auto_724542 ) ) ( not ( = ?auto_724538 ?auto_724543 ) ) ( not ( = ?auto_724538 ?auto_724544 ) ) ( not ( = ?auto_724539 ?auto_724540 ) ) ( not ( = ?auto_724539 ?auto_724541 ) ) ( not ( = ?auto_724539 ?auto_724542 ) ) ( not ( = ?auto_724539 ?auto_724543 ) ) ( not ( = ?auto_724539 ?auto_724544 ) ) ( not ( = ?auto_724540 ?auto_724541 ) ) ( not ( = ?auto_724540 ?auto_724542 ) ) ( not ( = ?auto_724540 ?auto_724543 ) ) ( not ( = ?auto_724540 ?auto_724544 ) ) ( not ( = ?auto_724541 ?auto_724542 ) ) ( not ( = ?auto_724541 ?auto_724543 ) ) ( not ( = ?auto_724541 ?auto_724544 ) ) ( not ( = ?auto_724542 ?auto_724543 ) ) ( not ( = ?auto_724542 ?auto_724544 ) ) ( not ( = ?auto_724543 ?auto_724544 ) ) ( ON ?auto_724542 ?auto_724543 ) ( ON ?auto_724541 ?auto_724542 ) ( ON ?auto_724540 ?auto_724541 ) ( ON ?auto_724539 ?auto_724540 ) ( ON ?auto_724538 ?auto_724539 ) ( ON ?auto_724537 ?auto_724538 ) ( ON ?auto_724536 ?auto_724537 ) ( ON ?auto_724535 ?auto_724536 ) ( ON ?auto_724534 ?auto_724535 ) ( ON ?auto_724533 ?auto_724534 ) ( ON ?auto_724532 ?auto_724533 ) ( ON ?auto_724531 ?auto_724532 ) ( ON ?auto_724530 ?auto_724531 ) ( CLEAR ?auto_724528 ) ( ON ?auto_724529 ?auto_724530 ) ( CLEAR ?auto_724529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_724527 ?auto_724528 ?auto_724529 )
      ( MAKE-17PILE ?auto_724527 ?auto_724528 ?auto_724529 ?auto_724530 ?auto_724531 ?auto_724532 ?auto_724533 ?auto_724534 ?auto_724535 ?auto_724536 ?auto_724537 ?auto_724538 ?auto_724539 ?auto_724540 ?auto_724541 ?auto_724542 ?auto_724543 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724562 - BLOCK
      ?auto_724563 - BLOCK
      ?auto_724564 - BLOCK
      ?auto_724565 - BLOCK
      ?auto_724566 - BLOCK
      ?auto_724567 - BLOCK
      ?auto_724568 - BLOCK
      ?auto_724569 - BLOCK
      ?auto_724570 - BLOCK
      ?auto_724571 - BLOCK
      ?auto_724572 - BLOCK
      ?auto_724573 - BLOCK
      ?auto_724574 - BLOCK
      ?auto_724575 - BLOCK
      ?auto_724576 - BLOCK
      ?auto_724577 - BLOCK
      ?auto_724578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724578 ) ( ON-TABLE ?auto_724562 ) ( ON ?auto_724563 ?auto_724562 ) ( not ( = ?auto_724562 ?auto_724563 ) ) ( not ( = ?auto_724562 ?auto_724564 ) ) ( not ( = ?auto_724562 ?auto_724565 ) ) ( not ( = ?auto_724562 ?auto_724566 ) ) ( not ( = ?auto_724562 ?auto_724567 ) ) ( not ( = ?auto_724562 ?auto_724568 ) ) ( not ( = ?auto_724562 ?auto_724569 ) ) ( not ( = ?auto_724562 ?auto_724570 ) ) ( not ( = ?auto_724562 ?auto_724571 ) ) ( not ( = ?auto_724562 ?auto_724572 ) ) ( not ( = ?auto_724562 ?auto_724573 ) ) ( not ( = ?auto_724562 ?auto_724574 ) ) ( not ( = ?auto_724562 ?auto_724575 ) ) ( not ( = ?auto_724562 ?auto_724576 ) ) ( not ( = ?auto_724562 ?auto_724577 ) ) ( not ( = ?auto_724562 ?auto_724578 ) ) ( not ( = ?auto_724563 ?auto_724564 ) ) ( not ( = ?auto_724563 ?auto_724565 ) ) ( not ( = ?auto_724563 ?auto_724566 ) ) ( not ( = ?auto_724563 ?auto_724567 ) ) ( not ( = ?auto_724563 ?auto_724568 ) ) ( not ( = ?auto_724563 ?auto_724569 ) ) ( not ( = ?auto_724563 ?auto_724570 ) ) ( not ( = ?auto_724563 ?auto_724571 ) ) ( not ( = ?auto_724563 ?auto_724572 ) ) ( not ( = ?auto_724563 ?auto_724573 ) ) ( not ( = ?auto_724563 ?auto_724574 ) ) ( not ( = ?auto_724563 ?auto_724575 ) ) ( not ( = ?auto_724563 ?auto_724576 ) ) ( not ( = ?auto_724563 ?auto_724577 ) ) ( not ( = ?auto_724563 ?auto_724578 ) ) ( not ( = ?auto_724564 ?auto_724565 ) ) ( not ( = ?auto_724564 ?auto_724566 ) ) ( not ( = ?auto_724564 ?auto_724567 ) ) ( not ( = ?auto_724564 ?auto_724568 ) ) ( not ( = ?auto_724564 ?auto_724569 ) ) ( not ( = ?auto_724564 ?auto_724570 ) ) ( not ( = ?auto_724564 ?auto_724571 ) ) ( not ( = ?auto_724564 ?auto_724572 ) ) ( not ( = ?auto_724564 ?auto_724573 ) ) ( not ( = ?auto_724564 ?auto_724574 ) ) ( not ( = ?auto_724564 ?auto_724575 ) ) ( not ( = ?auto_724564 ?auto_724576 ) ) ( not ( = ?auto_724564 ?auto_724577 ) ) ( not ( = ?auto_724564 ?auto_724578 ) ) ( not ( = ?auto_724565 ?auto_724566 ) ) ( not ( = ?auto_724565 ?auto_724567 ) ) ( not ( = ?auto_724565 ?auto_724568 ) ) ( not ( = ?auto_724565 ?auto_724569 ) ) ( not ( = ?auto_724565 ?auto_724570 ) ) ( not ( = ?auto_724565 ?auto_724571 ) ) ( not ( = ?auto_724565 ?auto_724572 ) ) ( not ( = ?auto_724565 ?auto_724573 ) ) ( not ( = ?auto_724565 ?auto_724574 ) ) ( not ( = ?auto_724565 ?auto_724575 ) ) ( not ( = ?auto_724565 ?auto_724576 ) ) ( not ( = ?auto_724565 ?auto_724577 ) ) ( not ( = ?auto_724565 ?auto_724578 ) ) ( not ( = ?auto_724566 ?auto_724567 ) ) ( not ( = ?auto_724566 ?auto_724568 ) ) ( not ( = ?auto_724566 ?auto_724569 ) ) ( not ( = ?auto_724566 ?auto_724570 ) ) ( not ( = ?auto_724566 ?auto_724571 ) ) ( not ( = ?auto_724566 ?auto_724572 ) ) ( not ( = ?auto_724566 ?auto_724573 ) ) ( not ( = ?auto_724566 ?auto_724574 ) ) ( not ( = ?auto_724566 ?auto_724575 ) ) ( not ( = ?auto_724566 ?auto_724576 ) ) ( not ( = ?auto_724566 ?auto_724577 ) ) ( not ( = ?auto_724566 ?auto_724578 ) ) ( not ( = ?auto_724567 ?auto_724568 ) ) ( not ( = ?auto_724567 ?auto_724569 ) ) ( not ( = ?auto_724567 ?auto_724570 ) ) ( not ( = ?auto_724567 ?auto_724571 ) ) ( not ( = ?auto_724567 ?auto_724572 ) ) ( not ( = ?auto_724567 ?auto_724573 ) ) ( not ( = ?auto_724567 ?auto_724574 ) ) ( not ( = ?auto_724567 ?auto_724575 ) ) ( not ( = ?auto_724567 ?auto_724576 ) ) ( not ( = ?auto_724567 ?auto_724577 ) ) ( not ( = ?auto_724567 ?auto_724578 ) ) ( not ( = ?auto_724568 ?auto_724569 ) ) ( not ( = ?auto_724568 ?auto_724570 ) ) ( not ( = ?auto_724568 ?auto_724571 ) ) ( not ( = ?auto_724568 ?auto_724572 ) ) ( not ( = ?auto_724568 ?auto_724573 ) ) ( not ( = ?auto_724568 ?auto_724574 ) ) ( not ( = ?auto_724568 ?auto_724575 ) ) ( not ( = ?auto_724568 ?auto_724576 ) ) ( not ( = ?auto_724568 ?auto_724577 ) ) ( not ( = ?auto_724568 ?auto_724578 ) ) ( not ( = ?auto_724569 ?auto_724570 ) ) ( not ( = ?auto_724569 ?auto_724571 ) ) ( not ( = ?auto_724569 ?auto_724572 ) ) ( not ( = ?auto_724569 ?auto_724573 ) ) ( not ( = ?auto_724569 ?auto_724574 ) ) ( not ( = ?auto_724569 ?auto_724575 ) ) ( not ( = ?auto_724569 ?auto_724576 ) ) ( not ( = ?auto_724569 ?auto_724577 ) ) ( not ( = ?auto_724569 ?auto_724578 ) ) ( not ( = ?auto_724570 ?auto_724571 ) ) ( not ( = ?auto_724570 ?auto_724572 ) ) ( not ( = ?auto_724570 ?auto_724573 ) ) ( not ( = ?auto_724570 ?auto_724574 ) ) ( not ( = ?auto_724570 ?auto_724575 ) ) ( not ( = ?auto_724570 ?auto_724576 ) ) ( not ( = ?auto_724570 ?auto_724577 ) ) ( not ( = ?auto_724570 ?auto_724578 ) ) ( not ( = ?auto_724571 ?auto_724572 ) ) ( not ( = ?auto_724571 ?auto_724573 ) ) ( not ( = ?auto_724571 ?auto_724574 ) ) ( not ( = ?auto_724571 ?auto_724575 ) ) ( not ( = ?auto_724571 ?auto_724576 ) ) ( not ( = ?auto_724571 ?auto_724577 ) ) ( not ( = ?auto_724571 ?auto_724578 ) ) ( not ( = ?auto_724572 ?auto_724573 ) ) ( not ( = ?auto_724572 ?auto_724574 ) ) ( not ( = ?auto_724572 ?auto_724575 ) ) ( not ( = ?auto_724572 ?auto_724576 ) ) ( not ( = ?auto_724572 ?auto_724577 ) ) ( not ( = ?auto_724572 ?auto_724578 ) ) ( not ( = ?auto_724573 ?auto_724574 ) ) ( not ( = ?auto_724573 ?auto_724575 ) ) ( not ( = ?auto_724573 ?auto_724576 ) ) ( not ( = ?auto_724573 ?auto_724577 ) ) ( not ( = ?auto_724573 ?auto_724578 ) ) ( not ( = ?auto_724574 ?auto_724575 ) ) ( not ( = ?auto_724574 ?auto_724576 ) ) ( not ( = ?auto_724574 ?auto_724577 ) ) ( not ( = ?auto_724574 ?auto_724578 ) ) ( not ( = ?auto_724575 ?auto_724576 ) ) ( not ( = ?auto_724575 ?auto_724577 ) ) ( not ( = ?auto_724575 ?auto_724578 ) ) ( not ( = ?auto_724576 ?auto_724577 ) ) ( not ( = ?auto_724576 ?auto_724578 ) ) ( not ( = ?auto_724577 ?auto_724578 ) ) ( ON ?auto_724577 ?auto_724578 ) ( ON ?auto_724576 ?auto_724577 ) ( ON ?auto_724575 ?auto_724576 ) ( ON ?auto_724574 ?auto_724575 ) ( ON ?auto_724573 ?auto_724574 ) ( ON ?auto_724572 ?auto_724573 ) ( ON ?auto_724571 ?auto_724572 ) ( ON ?auto_724570 ?auto_724571 ) ( ON ?auto_724569 ?auto_724570 ) ( ON ?auto_724568 ?auto_724569 ) ( ON ?auto_724567 ?auto_724568 ) ( ON ?auto_724566 ?auto_724567 ) ( ON ?auto_724565 ?auto_724566 ) ( CLEAR ?auto_724563 ) ( ON ?auto_724564 ?auto_724565 ) ( CLEAR ?auto_724564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_724562 ?auto_724563 ?auto_724564 )
      ( MAKE-17PILE ?auto_724562 ?auto_724563 ?auto_724564 ?auto_724565 ?auto_724566 ?auto_724567 ?auto_724568 ?auto_724569 ?auto_724570 ?auto_724571 ?auto_724572 ?auto_724573 ?auto_724574 ?auto_724575 ?auto_724576 ?auto_724577 ?auto_724578 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724596 - BLOCK
      ?auto_724597 - BLOCK
      ?auto_724598 - BLOCK
      ?auto_724599 - BLOCK
      ?auto_724600 - BLOCK
      ?auto_724601 - BLOCK
      ?auto_724602 - BLOCK
      ?auto_724603 - BLOCK
      ?auto_724604 - BLOCK
      ?auto_724605 - BLOCK
      ?auto_724606 - BLOCK
      ?auto_724607 - BLOCK
      ?auto_724608 - BLOCK
      ?auto_724609 - BLOCK
      ?auto_724610 - BLOCK
      ?auto_724611 - BLOCK
      ?auto_724612 - BLOCK
    )
    :vars
    (
      ?auto_724613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724612 ?auto_724613 ) ( ON-TABLE ?auto_724596 ) ( not ( = ?auto_724596 ?auto_724597 ) ) ( not ( = ?auto_724596 ?auto_724598 ) ) ( not ( = ?auto_724596 ?auto_724599 ) ) ( not ( = ?auto_724596 ?auto_724600 ) ) ( not ( = ?auto_724596 ?auto_724601 ) ) ( not ( = ?auto_724596 ?auto_724602 ) ) ( not ( = ?auto_724596 ?auto_724603 ) ) ( not ( = ?auto_724596 ?auto_724604 ) ) ( not ( = ?auto_724596 ?auto_724605 ) ) ( not ( = ?auto_724596 ?auto_724606 ) ) ( not ( = ?auto_724596 ?auto_724607 ) ) ( not ( = ?auto_724596 ?auto_724608 ) ) ( not ( = ?auto_724596 ?auto_724609 ) ) ( not ( = ?auto_724596 ?auto_724610 ) ) ( not ( = ?auto_724596 ?auto_724611 ) ) ( not ( = ?auto_724596 ?auto_724612 ) ) ( not ( = ?auto_724596 ?auto_724613 ) ) ( not ( = ?auto_724597 ?auto_724598 ) ) ( not ( = ?auto_724597 ?auto_724599 ) ) ( not ( = ?auto_724597 ?auto_724600 ) ) ( not ( = ?auto_724597 ?auto_724601 ) ) ( not ( = ?auto_724597 ?auto_724602 ) ) ( not ( = ?auto_724597 ?auto_724603 ) ) ( not ( = ?auto_724597 ?auto_724604 ) ) ( not ( = ?auto_724597 ?auto_724605 ) ) ( not ( = ?auto_724597 ?auto_724606 ) ) ( not ( = ?auto_724597 ?auto_724607 ) ) ( not ( = ?auto_724597 ?auto_724608 ) ) ( not ( = ?auto_724597 ?auto_724609 ) ) ( not ( = ?auto_724597 ?auto_724610 ) ) ( not ( = ?auto_724597 ?auto_724611 ) ) ( not ( = ?auto_724597 ?auto_724612 ) ) ( not ( = ?auto_724597 ?auto_724613 ) ) ( not ( = ?auto_724598 ?auto_724599 ) ) ( not ( = ?auto_724598 ?auto_724600 ) ) ( not ( = ?auto_724598 ?auto_724601 ) ) ( not ( = ?auto_724598 ?auto_724602 ) ) ( not ( = ?auto_724598 ?auto_724603 ) ) ( not ( = ?auto_724598 ?auto_724604 ) ) ( not ( = ?auto_724598 ?auto_724605 ) ) ( not ( = ?auto_724598 ?auto_724606 ) ) ( not ( = ?auto_724598 ?auto_724607 ) ) ( not ( = ?auto_724598 ?auto_724608 ) ) ( not ( = ?auto_724598 ?auto_724609 ) ) ( not ( = ?auto_724598 ?auto_724610 ) ) ( not ( = ?auto_724598 ?auto_724611 ) ) ( not ( = ?auto_724598 ?auto_724612 ) ) ( not ( = ?auto_724598 ?auto_724613 ) ) ( not ( = ?auto_724599 ?auto_724600 ) ) ( not ( = ?auto_724599 ?auto_724601 ) ) ( not ( = ?auto_724599 ?auto_724602 ) ) ( not ( = ?auto_724599 ?auto_724603 ) ) ( not ( = ?auto_724599 ?auto_724604 ) ) ( not ( = ?auto_724599 ?auto_724605 ) ) ( not ( = ?auto_724599 ?auto_724606 ) ) ( not ( = ?auto_724599 ?auto_724607 ) ) ( not ( = ?auto_724599 ?auto_724608 ) ) ( not ( = ?auto_724599 ?auto_724609 ) ) ( not ( = ?auto_724599 ?auto_724610 ) ) ( not ( = ?auto_724599 ?auto_724611 ) ) ( not ( = ?auto_724599 ?auto_724612 ) ) ( not ( = ?auto_724599 ?auto_724613 ) ) ( not ( = ?auto_724600 ?auto_724601 ) ) ( not ( = ?auto_724600 ?auto_724602 ) ) ( not ( = ?auto_724600 ?auto_724603 ) ) ( not ( = ?auto_724600 ?auto_724604 ) ) ( not ( = ?auto_724600 ?auto_724605 ) ) ( not ( = ?auto_724600 ?auto_724606 ) ) ( not ( = ?auto_724600 ?auto_724607 ) ) ( not ( = ?auto_724600 ?auto_724608 ) ) ( not ( = ?auto_724600 ?auto_724609 ) ) ( not ( = ?auto_724600 ?auto_724610 ) ) ( not ( = ?auto_724600 ?auto_724611 ) ) ( not ( = ?auto_724600 ?auto_724612 ) ) ( not ( = ?auto_724600 ?auto_724613 ) ) ( not ( = ?auto_724601 ?auto_724602 ) ) ( not ( = ?auto_724601 ?auto_724603 ) ) ( not ( = ?auto_724601 ?auto_724604 ) ) ( not ( = ?auto_724601 ?auto_724605 ) ) ( not ( = ?auto_724601 ?auto_724606 ) ) ( not ( = ?auto_724601 ?auto_724607 ) ) ( not ( = ?auto_724601 ?auto_724608 ) ) ( not ( = ?auto_724601 ?auto_724609 ) ) ( not ( = ?auto_724601 ?auto_724610 ) ) ( not ( = ?auto_724601 ?auto_724611 ) ) ( not ( = ?auto_724601 ?auto_724612 ) ) ( not ( = ?auto_724601 ?auto_724613 ) ) ( not ( = ?auto_724602 ?auto_724603 ) ) ( not ( = ?auto_724602 ?auto_724604 ) ) ( not ( = ?auto_724602 ?auto_724605 ) ) ( not ( = ?auto_724602 ?auto_724606 ) ) ( not ( = ?auto_724602 ?auto_724607 ) ) ( not ( = ?auto_724602 ?auto_724608 ) ) ( not ( = ?auto_724602 ?auto_724609 ) ) ( not ( = ?auto_724602 ?auto_724610 ) ) ( not ( = ?auto_724602 ?auto_724611 ) ) ( not ( = ?auto_724602 ?auto_724612 ) ) ( not ( = ?auto_724602 ?auto_724613 ) ) ( not ( = ?auto_724603 ?auto_724604 ) ) ( not ( = ?auto_724603 ?auto_724605 ) ) ( not ( = ?auto_724603 ?auto_724606 ) ) ( not ( = ?auto_724603 ?auto_724607 ) ) ( not ( = ?auto_724603 ?auto_724608 ) ) ( not ( = ?auto_724603 ?auto_724609 ) ) ( not ( = ?auto_724603 ?auto_724610 ) ) ( not ( = ?auto_724603 ?auto_724611 ) ) ( not ( = ?auto_724603 ?auto_724612 ) ) ( not ( = ?auto_724603 ?auto_724613 ) ) ( not ( = ?auto_724604 ?auto_724605 ) ) ( not ( = ?auto_724604 ?auto_724606 ) ) ( not ( = ?auto_724604 ?auto_724607 ) ) ( not ( = ?auto_724604 ?auto_724608 ) ) ( not ( = ?auto_724604 ?auto_724609 ) ) ( not ( = ?auto_724604 ?auto_724610 ) ) ( not ( = ?auto_724604 ?auto_724611 ) ) ( not ( = ?auto_724604 ?auto_724612 ) ) ( not ( = ?auto_724604 ?auto_724613 ) ) ( not ( = ?auto_724605 ?auto_724606 ) ) ( not ( = ?auto_724605 ?auto_724607 ) ) ( not ( = ?auto_724605 ?auto_724608 ) ) ( not ( = ?auto_724605 ?auto_724609 ) ) ( not ( = ?auto_724605 ?auto_724610 ) ) ( not ( = ?auto_724605 ?auto_724611 ) ) ( not ( = ?auto_724605 ?auto_724612 ) ) ( not ( = ?auto_724605 ?auto_724613 ) ) ( not ( = ?auto_724606 ?auto_724607 ) ) ( not ( = ?auto_724606 ?auto_724608 ) ) ( not ( = ?auto_724606 ?auto_724609 ) ) ( not ( = ?auto_724606 ?auto_724610 ) ) ( not ( = ?auto_724606 ?auto_724611 ) ) ( not ( = ?auto_724606 ?auto_724612 ) ) ( not ( = ?auto_724606 ?auto_724613 ) ) ( not ( = ?auto_724607 ?auto_724608 ) ) ( not ( = ?auto_724607 ?auto_724609 ) ) ( not ( = ?auto_724607 ?auto_724610 ) ) ( not ( = ?auto_724607 ?auto_724611 ) ) ( not ( = ?auto_724607 ?auto_724612 ) ) ( not ( = ?auto_724607 ?auto_724613 ) ) ( not ( = ?auto_724608 ?auto_724609 ) ) ( not ( = ?auto_724608 ?auto_724610 ) ) ( not ( = ?auto_724608 ?auto_724611 ) ) ( not ( = ?auto_724608 ?auto_724612 ) ) ( not ( = ?auto_724608 ?auto_724613 ) ) ( not ( = ?auto_724609 ?auto_724610 ) ) ( not ( = ?auto_724609 ?auto_724611 ) ) ( not ( = ?auto_724609 ?auto_724612 ) ) ( not ( = ?auto_724609 ?auto_724613 ) ) ( not ( = ?auto_724610 ?auto_724611 ) ) ( not ( = ?auto_724610 ?auto_724612 ) ) ( not ( = ?auto_724610 ?auto_724613 ) ) ( not ( = ?auto_724611 ?auto_724612 ) ) ( not ( = ?auto_724611 ?auto_724613 ) ) ( not ( = ?auto_724612 ?auto_724613 ) ) ( ON ?auto_724611 ?auto_724612 ) ( ON ?auto_724610 ?auto_724611 ) ( ON ?auto_724609 ?auto_724610 ) ( ON ?auto_724608 ?auto_724609 ) ( ON ?auto_724607 ?auto_724608 ) ( ON ?auto_724606 ?auto_724607 ) ( ON ?auto_724605 ?auto_724606 ) ( ON ?auto_724604 ?auto_724605 ) ( ON ?auto_724603 ?auto_724604 ) ( ON ?auto_724602 ?auto_724603 ) ( ON ?auto_724601 ?auto_724602 ) ( ON ?auto_724600 ?auto_724601 ) ( ON ?auto_724599 ?auto_724600 ) ( ON ?auto_724598 ?auto_724599 ) ( CLEAR ?auto_724596 ) ( ON ?auto_724597 ?auto_724598 ) ( CLEAR ?auto_724597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_724596 ?auto_724597 )
      ( MAKE-17PILE ?auto_724596 ?auto_724597 ?auto_724598 ?auto_724599 ?auto_724600 ?auto_724601 ?auto_724602 ?auto_724603 ?auto_724604 ?auto_724605 ?auto_724606 ?auto_724607 ?auto_724608 ?auto_724609 ?auto_724610 ?auto_724611 ?auto_724612 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724631 - BLOCK
      ?auto_724632 - BLOCK
      ?auto_724633 - BLOCK
      ?auto_724634 - BLOCK
      ?auto_724635 - BLOCK
      ?auto_724636 - BLOCK
      ?auto_724637 - BLOCK
      ?auto_724638 - BLOCK
      ?auto_724639 - BLOCK
      ?auto_724640 - BLOCK
      ?auto_724641 - BLOCK
      ?auto_724642 - BLOCK
      ?auto_724643 - BLOCK
      ?auto_724644 - BLOCK
      ?auto_724645 - BLOCK
      ?auto_724646 - BLOCK
      ?auto_724647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724647 ) ( ON-TABLE ?auto_724631 ) ( not ( = ?auto_724631 ?auto_724632 ) ) ( not ( = ?auto_724631 ?auto_724633 ) ) ( not ( = ?auto_724631 ?auto_724634 ) ) ( not ( = ?auto_724631 ?auto_724635 ) ) ( not ( = ?auto_724631 ?auto_724636 ) ) ( not ( = ?auto_724631 ?auto_724637 ) ) ( not ( = ?auto_724631 ?auto_724638 ) ) ( not ( = ?auto_724631 ?auto_724639 ) ) ( not ( = ?auto_724631 ?auto_724640 ) ) ( not ( = ?auto_724631 ?auto_724641 ) ) ( not ( = ?auto_724631 ?auto_724642 ) ) ( not ( = ?auto_724631 ?auto_724643 ) ) ( not ( = ?auto_724631 ?auto_724644 ) ) ( not ( = ?auto_724631 ?auto_724645 ) ) ( not ( = ?auto_724631 ?auto_724646 ) ) ( not ( = ?auto_724631 ?auto_724647 ) ) ( not ( = ?auto_724632 ?auto_724633 ) ) ( not ( = ?auto_724632 ?auto_724634 ) ) ( not ( = ?auto_724632 ?auto_724635 ) ) ( not ( = ?auto_724632 ?auto_724636 ) ) ( not ( = ?auto_724632 ?auto_724637 ) ) ( not ( = ?auto_724632 ?auto_724638 ) ) ( not ( = ?auto_724632 ?auto_724639 ) ) ( not ( = ?auto_724632 ?auto_724640 ) ) ( not ( = ?auto_724632 ?auto_724641 ) ) ( not ( = ?auto_724632 ?auto_724642 ) ) ( not ( = ?auto_724632 ?auto_724643 ) ) ( not ( = ?auto_724632 ?auto_724644 ) ) ( not ( = ?auto_724632 ?auto_724645 ) ) ( not ( = ?auto_724632 ?auto_724646 ) ) ( not ( = ?auto_724632 ?auto_724647 ) ) ( not ( = ?auto_724633 ?auto_724634 ) ) ( not ( = ?auto_724633 ?auto_724635 ) ) ( not ( = ?auto_724633 ?auto_724636 ) ) ( not ( = ?auto_724633 ?auto_724637 ) ) ( not ( = ?auto_724633 ?auto_724638 ) ) ( not ( = ?auto_724633 ?auto_724639 ) ) ( not ( = ?auto_724633 ?auto_724640 ) ) ( not ( = ?auto_724633 ?auto_724641 ) ) ( not ( = ?auto_724633 ?auto_724642 ) ) ( not ( = ?auto_724633 ?auto_724643 ) ) ( not ( = ?auto_724633 ?auto_724644 ) ) ( not ( = ?auto_724633 ?auto_724645 ) ) ( not ( = ?auto_724633 ?auto_724646 ) ) ( not ( = ?auto_724633 ?auto_724647 ) ) ( not ( = ?auto_724634 ?auto_724635 ) ) ( not ( = ?auto_724634 ?auto_724636 ) ) ( not ( = ?auto_724634 ?auto_724637 ) ) ( not ( = ?auto_724634 ?auto_724638 ) ) ( not ( = ?auto_724634 ?auto_724639 ) ) ( not ( = ?auto_724634 ?auto_724640 ) ) ( not ( = ?auto_724634 ?auto_724641 ) ) ( not ( = ?auto_724634 ?auto_724642 ) ) ( not ( = ?auto_724634 ?auto_724643 ) ) ( not ( = ?auto_724634 ?auto_724644 ) ) ( not ( = ?auto_724634 ?auto_724645 ) ) ( not ( = ?auto_724634 ?auto_724646 ) ) ( not ( = ?auto_724634 ?auto_724647 ) ) ( not ( = ?auto_724635 ?auto_724636 ) ) ( not ( = ?auto_724635 ?auto_724637 ) ) ( not ( = ?auto_724635 ?auto_724638 ) ) ( not ( = ?auto_724635 ?auto_724639 ) ) ( not ( = ?auto_724635 ?auto_724640 ) ) ( not ( = ?auto_724635 ?auto_724641 ) ) ( not ( = ?auto_724635 ?auto_724642 ) ) ( not ( = ?auto_724635 ?auto_724643 ) ) ( not ( = ?auto_724635 ?auto_724644 ) ) ( not ( = ?auto_724635 ?auto_724645 ) ) ( not ( = ?auto_724635 ?auto_724646 ) ) ( not ( = ?auto_724635 ?auto_724647 ) ) ( not ( = ?auto_724636 ?auto_724637 ) ) ( not ( = ?auto_724636 ?auto_724638 ) ) ( not ( = ?auto_724636 ?auto_724639 ) ) ( not ( = ?auto_724636 ?auto_724640 ) ) ( not ( = ?auto_724636 ?auto_724641 ) ) ( not ( = ?auto_724636 ?auto_724642 ) ) ( not ( = ?auto_724636 ?auto_724643 ) ) ( not ( = ?auto_724636 ?auto_724644 ) ) ( not ( = ?auto_724636 ?auto_724645 ) ) ( not ( = ?auto_724636 ?auto_724646 ) ) ( not ( = ?auto_724636 ?auto_724647 ) ) ( not ( = ?auto_724637 ?auto_724638 ) ) ( not ( = ?auto_724637 ?auto_724639 ) ) ( not ( = ?auto_724637 ?auto_724640 ) ) ( not ( = ?auto_724637 ?auto_724641 ) ) ( not ( = ?auto_724637 ?auto_724642 ) ) ( not ( = ?auto_724637 ?auto_724643 ) ) ( not ( = ?auto_724637 ?auto_724644 ) ) ( not ( = ?auto_724637 ?auto_724645 ) ) ( not ( = ?auto_724637 ?auto_724646 ) ) ( not ( = ?auto_724637 ?auto_724647 ) ) ( not ( = ?auto_724638 ?auto_724639 ) ) ( not ( = ?auto_724638 ?auto_724640 ) ) ( not ( = ?auto_724638 ?auto_724641 ) ) ( not ( = ?auto_724638 ?auto_724642 ) ) ( not ( = ?auto_724638 ?auto_724643 ) ) ( not ( = ?auto_724638 ?auto_724644 ) ) ( not ( = ?auto_724638 ?auto_724645 ) ) ( not ( = ?auto_724638 ?auto_724646 ) ) ( not ( = ?auto_724638 ?auto_724647 ) ) ( not ( = ?auto_724639 ?auto_724640 ) ) ( not ( = ?auto_724639 ?auto_724641 ) ) ( not ( = ?auto_724639 ?auto_724642 ) ) ( not ( = ?auto_724639 ?auto_724643 ) ) ( not ( = ?auto_724639 ?auto_724644 ) ) ( not ( = ?auto_724639 ?auto_724645 ) ) ( not ( = ?auto_724639 ?auto_724646 ) ) ( not ( = ?auto_724639 ?auto_724647 ) ) ( not ( = ?auto_724640 ?auto_724641 ) ) ( not ( = ?auto_724640 ?auto_724642 ) ) ( not ( = ?auto_724640 ?auto_724643 ) ) ( not ( = ?auto_724640 ?auto_724644 ) ) ( not ( = ?auto_724640 ?auto_724645 ) ) ( not ( = ?auto_724640 ?auto_724646 ) ) ( not ( = ?auto_724640 ?auto_724647 ) ) ( not ( = ?auto_724641 ?auto_724642 ) ) ( not ( = ?auto_724641 ?auto_724643 ) ) ( not ( = ?auto_724641 ?auto_724644 ) ) ( not ( = ?auto_724641 ?auto_724645 ) ) ( not ( = ?auto_724641 ?auto_724646 ) ) ( not ( = ?auto_724641 ?auto_724647 ) ) ( not ( = ?auto_724642 ?auto_724643 ) ) ( not ( = ?auto_724642 ?auto_724644 ) ) ( not ( = ?auto_724642 ?auto_724645 ) ) ( not ( = ?auto_724642 ?auto_724646 ) ) ( not ( = ?auto_724642 ?auto_724647 ) ) ( not ( = ?auto_724643 ?auto_724644 ) ) ( not ( = ?auto_724643 ?auto_724645 ) ) ( not ( = ?auto_724643 ?auto_724646 ) ) ( not ( = ?auto_724643 ?auto_724647 ) ) ( not ( = ?auto_724644 ?auto_724645 ) ) ( not ( = ?auto_724644 ?auto_724646 ) ) ( not ( = ?auto_724644 ?auto_724647 ) ) ( not ( = ?auto_724645 ?auto_724646 ) ) ( not ( = ?auto_724645 ?auto_724647 ) ) ( not ( = ?auto_724646 ?auto_724647 ) ) ( ON ?auto_724646 ?auto_724647 ) ( ON ?auto_724645 ?auto_724646 ) ( ON ?auto_724644 ?auto_724645 ) ( ON ?auto_724643 ?auto_724644 ) ( ON ?auto_724642 ?auto_724643 ) ( ON ?auto_724641 ?auto_724642 ) ( ON ?auto_724640 ?auto_724641 ) ( ON ?auto_724639 ?auto_724640 ) ( ON ?auto_724638 ?auto_724639 ) ( ON ?auto_724637 ?auto_724638 ) ( ON ?auto_724636 ?auto_724637 ) ( ON ?auto_724635 ?auto_724636 ) ( ON ?auto_724634 ?auto_724635 ) ( ON ?auto_724633 ?auto_724634 ) ( CLEAR ?auto_724631 ) ( ON ?auto_724632 ?auto_724633 ) ( CLEAR ?auto_724632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_724631 ?auto_724632 )
      ( MAKE-17PILE ?auto_724631 ?auto_724632 ?auto_724633 ?auto_724634 ?auto_724635 ?auto_724636 ?auto_724637 ?auto_724638 ?auto_724639 ?auto_724640 ?auto_724641 ?auto_724642 ?auto_724643 ?auto_724644 ?auto_724645 ?auto_724646 ?auto_724647 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724665 - BLOCK
      ?auto_724666 - BLOCK
      ?auto_724667 - BLOCK
      ?auto_724668 - BLOCK
      ?auto_724669 - BLOCK
      ?auto_724670 - BLOCK
      ?auto_724671 - BLOCK
      ?auto_724672 - BLOCK
      ?auto_724673 - BLOCK
      ?auto_724674 - BLOCK
      ?auto_724675 - BLOCK
      ?auto_724676 - BLOCK
      ?auto_724677 - BLOCK
      ?auto_724678 - BLOCK
      ?auto_724679 - BLOCK
      ?auto_724680 - BLOCK
      ?auto_724681 - BLOCK
    )
    :vars
    (
      ?auto_724682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724681 ?auto_724682 ) ( not ( = ?auto_724665 ?auto_724666 ) ) ( not ( = ?auto_724665 ?auto_724667 ) ) ( not ( = ?auto_724665 ?auto_724668 ) ) ( not ( = ?auto_724665 ?auto_724669 ) ) ( not ( = ?auto_724665 ?auto_724670 ) ) ( not ( = ?auto_724665 ?auto_724671 ) ) ( not ( = ?auto_724665 ?auto_724672 ) ) ( not ( = ?auto_724665 ?auto_724673 ) ) ( not ( = ?auto_724665 ?auto_724674 ) ) ( not ( = ?auto_724665 ?auto_724675 ) ) ( not ( = ?auto_724665 ?auto_724676 ) ) ( not ( = ?auto_724665 ?auto_724677 ) ) ( not ( = ?auto_724665 ?auto_724678 ) ) ( not ( = ?auto_724665 ?auto_724679 ) ) ( not ( = ?auto_724665 ?auto_724680 ) ) ( not ( = ?auto_724665 ?auto_724681 ) ) ( not ( = ?auto_724665 ?auto_724682 ) ) ( not ( = ?auto_724666 ?auto_724667 ) ) ( not ( = ?auto_724666 ?auto_724668 ) ) ( not ( = ?auto_724666 ?auto_724669 ) ) ( not ( = ?auto_724666 ?auto_724670 ) ) ( not ( = ?auto_724666 ?auto_724671 ) ) ( not ( = ?auto_724666 ?auto_724672 ) ) ( not ( = ?auto_724666 ?auto_724673 ) ) ( not ( = ?auto_724666 ?auto_724674 ) ) ( not ( = ?auto_724666 ?auto_724675 ) ) ( not ( = ?auto_724666 ?auto_724676 ) ) ( not ( = ?auto_724666 ?auto_724677 ) ) ( not ( = ?auto_724666 ?auto_724678 ) ) ( not ( = ?auto_724666 ?auto_724679 ) ) ( not ( = ?auto_724666 ?auto_724680 ) ) ( not ( = ?auto_724666 ?auto_724681 ) ) ( not ( = ?auto_724666 ?auto_724682 ) ) ( not ( = ?auto_724667 ?auto_724668 ) ) ( not ( = ?auto_724667 ?auto_724669 ) ) ( not ( = ?auto_724667 ?auto_724670 ) ) ( not ( = ?auto_724667 ?auto_724671 ) ) ( not ( = ?auto_724667 ?auto_724672 ) ) ( not ( = ?auto_724667 ?auto_724673 ) ) ( not ( = ?auto_724667 ?auto_724674 ) ) ( not ( = ?auto_724667 ?auto_724675 ) ) ( not ( = ?auto_724667 ?auto_724676 ) ) ( not ( = ?auto_724667 ?auto_724677 ) ) ( not ( = ?auto_724667 ?auto_724678 ) ) ( not ( = ?auto_724667 ?auto_724679 ) ) ( not ( = ?auto_724667 ?auto_724680 ) ) ( not ( = ?auto_724667 ?auto_724681 ) ) ( not ( = ?auto_724667 ?auto_724682 ) ) ( not ( = ?auto_724668 ?auto_724669 ) ) ( not ( = ?auto_724668 ?auto_724670 ) ) ( not ( = ?auto_724668 ?auto_724671 ) ) ( not ( = ?auto_724668 ?auto_724672 ) ) ( not ( = ?auto_724668 ?auto_724673 ) ) ( not ( = ?auto_724668 ?auto_724674 ) ) ( not ( = ?auto_724668 ?auto_724675 ) ) ( not ( = ?auto_724668 ?auto_724676 ) ) ( not ( = ?auto_724668 ?auto_724677 ) ) ( not ( = ?auto_724668 ?auto_724678 ) ) ( not ( = ?auto_724668 ?auto_724679 ) ) ( not ( = ?auto_724668 ?auto_724680 ) ) ( not ( = ?auto_724668 ?auto_724681 ) ) ( not ( = ?auto_724668 ?auto_724682 ) ) ( not ( = ?auto_724669 ?auto_724670 ) ) ( not ( = ?auto_724669 ?auto_724671 ) ) ( not ( = ?auto_724669 ?auto_724672 ) ) ( not ( = ?auto_724669 ?auto_724673 ) ) ( not ( = ?auto_724669 ?auto_724674 ) ) ( not ( = ?auto_724669 ?auto_724675 ) ) ( not ( = ?auto_724669 ?auto_724676 ) ) ( not ( = ?auto_724669 ?auto_724677 ) ) ( not ( = ?auto_724669 ?auto_724678 ) ) ( not ( = ?auto_724669 ?auto_724679 ) ) ( not ( = ?auto_724669 ?auto_724680 ) ) ( not ( = ?auto_724669 ?auto_724681 ) ) ( not ( = ?auto_724669 ?auto_724682 ) ) ( not ( = ?auto_724670 ?auto_724671 ) ) ( not ( = ?auto_724670 ?auto_724672 ) ) ( not ( = ?auto_724670 ?auto_724673 ) ) ( not ( = ?auto_724670 ?auto_724674 ) ) ( not ( = ?auto_724670 ?auto_724675 ) ) ( not ( = ?auto_724670 ?auto_724676 ) ) ( not ( = ?auto_724670 ?auto_724677 ) ) ( not ( = ?auto_724670 ?auto_724678 ) ) ( not ( = ?auto_724670 ?auto_724679 ) ) ( not ( = ?auto_724670 ?auto_724680 ) ) ( not ( = ?auto_724670 ?auto_724681 ) ) ( not ( = ?auto_724670 ?auto_724682 ) ) ( not ( = ?auto_724671 ?auto_724672 ) ) ( not ( = ?auto_724671 ?auto_724673 ) ) ( not ( = ?auto_724671 ?auto_724674 ) ) ( not ( = ?auto_724671 ?auto_724675 ) ) ( not ( = ?auto_724671 ?auto_724676 ) ) ( not ( = ?auto_724671 ?auto_724677 ) ) ( not ( = ?auto_724671 ?auto_724678 ) ) ( not ( = ?auto_724671 ?auto_724679 ) ) ( not ( = ?auto_724671 ?auto_724680 ) ) ( not ( = ?auto_724671 ?auto_724681 ) ) ( not ( = ?auto_724671 ?auto_724682 ) ) ( not ( = ?auto_724672 ?auto_724673 ) ) ( not ( = ?auto_724672 ?auto_724674 ) ) ( not ( = ?auto_724672 ?auto_724675 ) ) ( not ( = ?auto_724672 ?auto_724676 ) ) ( not ( = ?auto_724672 ?auto_724677 ) ) ( not ( = ?auto_724672 ?auto_724678 ) ) ( not ( = ?auto_724672 ?auto_724679 ) ) ( not ( = ?auto_724672 ?auto_724680 ) ) ( not ( = ?auto_724672 ?auto_724681 ) ) ( not ( = ?auto_724672 ?auto_724682 ) ) ( not ( = ?auto_724673 ?auto_724674 ) ) ( not ( = ?auto_724673 ?auto_724675 ) ) ( not ( = ?auto_724673 ?auto_724676 ) ) ( not ( = ?auto_724673 ?auto_724677 ) ) ( not ( = ?auto_724673 ?auto_724678 ) ) ( not ( = ?auto_724673 ?auto_724679 ) ) ( not ( = ?auto_724673 ?auto_724680 ) ) ( not ( = ?auto_724673 ?auto_724681 ) ) ( not ( = ?auto_724673 ?auto_724682 ) ) ( not ( = ?auto_724674 ?auto_724675 ) ) ( not ( = ?auto_724674 ?auto_724676 ) ) ( not ( = ?auto_724674 ?auto_724677 ) ) ( not ( = ?auto_724674 ?auto_724678 ) ) ( not ( = ?auto_724674 ?auto_724679 ) ) ( not ( = ?auto_724674 ?auto_724680 ) ) ( not ( = ?auto_724674 ?auto_724681 ) ) ( not ( = ?auto_724674 ?auto_724682 ) ) ( not ( = ?auto_724675 ?auto_724676 ) ) ( not ( = ?auto_724675 ?auto_724677 ) ) ( not ( = ?auto_724675 ?auto_724678 ) ) ( not ( = ?auto_724675 ?auto_724679 ) ) ( not ( = ?auto_724675 ?auto_724680 ) ) ( not ( = ?auto_724675 ?auto_724681 ) ) ( not ( = ?auto_724675 ?auto_724682 ) ) ( not ( = ?auto_724676 ?auto_724677 ) ) ( not ( = ?auto_724676 ?auto_724678 ) ) ( not ( = ?auto_724676 ?auto_724679 ) ) ( not ( = ?auto_724676 ?auto_724680 ) ) ( not ( = ?auto_724676 ?auto_724681 ) ) ( not ( = ?auto_724676 ?auto_724682 ) ) ( not ( = ?auto_724677 ?auto_724678 ) ) ( not ( = ?auto_724677 ?auto_724679 ) ) ( not ( = ?auto_724677 ?auto_724680 ) ) ( not ( = ?auto_724677 ?auto_724681 ) ) ( not ( = ?auto_724677 ?auto_724682 ) ) ( not ( = ?auto_724678 ?auto_724679 ) ) ( not ( = ?auto_724678 ?auto_724680 ) ) ( not ( = ?auto_724678 ?auto_724681 ) ) ( not ( = ?auto_724678 ?auto_724682 ) ) ( not ( = ?auto_724679 ?auto_724680 ) ) ( not ( = ?auto_724679 ?auto_724681 ) ) ( not ( = ?auto_724679 ?auto_724682 ) ) ( not ( = ?auto_724680 ?auto_724681 ) ) ( not ( = ?auto_724680 ?auto_724682 ) ) ( not ( = ?auto_724681 ?auto_724682 ) ) ( ON ?auto_724680 ?auto_724681 ) ( ON ?auto_724679 ?auto_724680 ) ( ON ?auto_724678 ?auto_724679 ) ( ON ?auto_724677 ?auto_724678 ) ( ON ?auto_724676 ?auto_724677 ) ( ON ?auto_724675 ?auto_724676 ) ( ON ?auto_724674 ?auto_724675 ) ( ON ?auto_724673 ?auto_724674 ) ( ON ?auto_724672 ?auto_724673 ) ( ON ?auto_724671 ?auto_724672 ) ( ON ?auto_724670 ?auto_724671 ) ( ON ?auto_724669 ?auto_724670 ) ( ON ?auto_724668 ?auto_724669 ) ( ON ?auto_724667 ?auto_724668 ) ( ON ?auto_724666 ?auto_724667 ) ( ON ?auto_724665 ?auto_724666 ) ( CLEAR ?auto_724665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_724665 )
      ( MAKE-17PILE ?auto_724665 ?auto_724666 ?auto_724667 ?auto_724668 ?auto_724669 ?auto_724670 ?auto_724671 ?auto_724672 ?auto_724673 ?auto_724674 ?auto_724675 ?auto_724676 ?auto_724677 ?auto_724678 ?auto_724679 ?auto_724680 ?auto_724681 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724700 - BLOCK
      ?auto_724701 - BLOCK
      ?auto_724702 - BLOCK
      ?auto_724703 - BLOCK
      ?auto_724704 - BLOCK
      ?auto_724705 - BLOCK
      ?auto_724706 - BLOCK
      ?auto_724707 - BLOCK
      ?auto_724708 - BLOCK
      ?auto_724709 - BLOCK
      ?auto_724710 - BLOCK
      ?auto_724711 - BLOCK
      ?auto_724712 - BLOCK
      ?auto_724713 - BLOCK
      ?auto_724714 - BLOCK
      ?auto_724715 - BLOCK
      ?auto_724716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_724716 ) ( not ( = ?auto_724700 ?auto_724701 ) ) ( not ( = ?auto_724700 ?auto_724702 ) ) ( not ( = ?auto_724700 ?auto_724703 ) ) ( not ( = ?auto_724700 ?auto_724704 ) ) ( not ( = ?auto_724700 ?auto_724705 ) ) ( not ( = ?auto_724700 ?auto_724706 ) ) ( not ( = ?auto_724700 ?auto_724707 ) ) ( not ( = ?auto_724700 ?auto_724708 ) ) ( not ( = ?auto_724700 ?auto_724709 ) ) ( not ( = ?auto_724700 ?auto_724710 ) ) ( not ( = ?auto_724700 ?auto_724711 ) ) ( not ( = ?auto_724700 ?auto_724712 ) ) ( not ( = ?auto_724700 ?auto_724713 ) ) ( not ( = ?auto_724700 ?auto_724714 ) ) ( not ( = ?auto_724700 ?auto_724715 ) ) ( not ( = ?auto_724700 ?auto_724716 ) ) ( not ( = ?auto_724701 ?auto_724702 ) ) ( not ( = ?auto_724701 ?auto_724703 ) ) ( not ( = ?auto_724701 ?auto_724704 ) ) ( not ( = ?auto_724701 ?auto_724705 ) ) ( not ( = ?auto_724701 ?auto_724706 ) ) ( not ( = ?auto_724701 ?auto_724707 ) ) ( not ( = ?auto_724701 ?auto_724708 ) ) ( not ( = ?auto_724701 ?auto_724709 ) ) ( not ( = ?auto_724701 ?auto_724710 ) ) ( not ( = ?auto_724701 ?auto_724711 ) ) ( not ( = ?auto_724701 ?auto_724712 ) ) ( not ( = ?auto_724701 ?auto_724713 ) ) ( not ( = ?auto_724701 ?auto_724714 ) ) ( not ( = ?auto_724701 ?auto_724715 ) ) ( not ( = ?auto_724701 ?auto_724716 ) ) ( not ( = ?auto_724702 ?auto_724703 ) ) ( not ( = ?auto_724702 ?auto_724704 ) ) ( not ( = ?auto_724702 ?auto_724705 ) ) ( not ( = ?auto_724702 ?auto_724706 ) ) ( not ( = ?auto_724702 ?auto_724707 ) ) ( not ( = ?auto_724702 ?auto_724708 ) ) ( not ( = ?auto_724702 ?auto_724709 ) ) ( not ( = ?auto_724702 ?auto_724710 ) ) ( not ( = ?auto_724702 ?auto_724711 ) ) ( not ( = ?auto_724702 ?auto_724712 ) ) ( not ( = ?auto_724702 ?auto_724713 ) ) ( not ( = ?auto_724702 ?auto_724714 ) ) ( not ( = ?auto_724702 ?auto_724715 ) ) ( not ( = ?auto_724702 ?auto_724716 ) ) ( not ( = ?auto_724703 ?auto_724704 ) ) ( not ( = ?auto_724703 ?auto_724705 ) ) ( not ( = ?auto_724703 ?auto_724706 ) ) ( not ( = ?auto_724703 ?auto_724707 ) ) ( not ( = ?auto_724703 ?auto_724708 ) ) ( not ( = ?auto_724703 ?auto_724709 ) ) ( not ( = ?auto_724703 ?auto_724710 ) ) ( not ( = ?auto_724703 ?auto_724711 ) ) ( not ( = ?auto_724703 ?auto_724712 ) ) ( not ( = ?auto_724703 ?auto_724713 ) ) ( not ( = ?auto_724703 ?auto_724714 ) ) ( not ( = ?auto_724703 ?auto_724715 ) ) ( not ( = ?auto_724703 ?auto_724716 ) ) ( not ( = ?auto_724704 ?auto_724705 ) ) ( not ( = ?auto_724704 ?auto_724706 ) ) ( not ( = ?auto_724704 ?auto_724707 ) ) ( not ( = ?auto_724704 ?auto_724708 ) ) ( not ( = ?auto_724704 ?auto_724709 ) ) ( not ( = ?auto_724704 ?auto_724710 ) ) ( not ( = ?auto_724704 ?auto_724711 ) ) ( not ( = ?auto_724704 ?auto_724712 ) ) ( not ( = ?auto_724704 ?auto_724713 ) ) ( not ( = ?auto_724704 ?auto_724714 ) ) ( not ( = ?auto_724704 ?auto_724715 ) ) ( not ( = ?auto_724704 ?auto_724716 ) ) ( not ( = ?auto_724705 ?auto_724706 ) ) ( not ( = ?auto_724705 ?auto_724707 ) ) ( not ( = ?auto_724705 ?auto_724708 ) ) ( not ( = ?auto_724705 ?auto_724709 ) ) ( not ( = ?auto_724705 ?auto_724710 ) ) ( not ( = ?auto_724705 ?auto_724711 ) ) ( not ( = ?auto_724705 ?auto_724712 ) ) ( not ( = ?auto_724705 ?auto_724713 ) ) ( not ( = ?auto_724705 ?auto_724714 ) ) ( not ( = ?auto_724705 ?auto_724715 ) ) ( not ( = ?auto_724705 ?auto_724716 ) ) ( not ( = ?auto_724706 ?auto_724707 ) ) ( not ( = ?auto_724706 ?auto_724708 ) ) ( not ( = ?auto_724706 ?auto_724709 ) ) ( not ( = ?auto_724706 ?auto_724710 ) ) ( not ( = ?auto_724706 ?auto_724711 ) ) ( not ( = ?auto_724706 ?auto_724712 ) ) ( not ( = ?auto_724706 ?auto_724713 ) ) ( not ( = ?auto_724706 ?auto_724714 ) ) ( not ( = ?auto_724706 ?auto_724715 ) ) ( not ( = ?auto_724706 ?auto_724716 ) ) ( not ( = ?auto_724707 ?auto_724708 ) ) ( not ( = ?auto_724707 ?auto_724709 ) ) ( not ( = ?auto_724707 ?auto_724710 ) ) ( not ( = ?auto_724707 ?auto_724711 ) ) ( not ( = ?auto_724707 ?auto_724712 ) ) ( not ( = ?auto_724707 ?auto_724713 ) ) ( not ( = ?auto_724707 ?auto_724714 ) ) ( not ( = ?auto_724707 ?auto_724715 ) ) ( not ( = ?auto_724707 ?auto_724716 ) ) ( not ( = ?auto_724708 ?auto_724709 ) ) ( not ( = ?auto_724708 ?auto_724710 ) ) ( not ( = ?auto_724708 ?auto_724711 ) ) ( not ( = ?auto_724708 ?auto_724712 ) ) ( not ( = ?auto_724708 ?auto_724713 ) ) ( not ( = ?auto_724708 ?auto_724714 ) ) ( not ( = ?auto_724708 ?auto_724715 ) ) ( not ( = ?auto_724708 ?auto_724716 ) ) ( not ( = ?auto_724709 ?auto_724710 ) ) ( not ( = ?auto_724709 ?auto_724711 ) ) ( not ( = ?auto_724709 ?auto_724712 ) ) ( not ( = ?auto_724709 ?auto_724713 ) ) ( not ( = ?auto_724709 ?auto_724714 ) ) ( not ( = ?auto_724709 ?auto_724715 ) ) ( not ( = ?auto_724709 ?auto_724716 ) ) ( not ( = ?auto_724710 ?auto_724711 ) ) ( not ( = ?auto_724710 ?auto_724712 ) ) ( not ( = ?auto_724710 ?auto_724713 ) ) ( not ( = ?auto_724710 ?auto_724714 ) ) ( not ( = ?auto_724710 ?auto_724715 ) ) ( not ( = ?auto_724710 ?auto_724716 ) ) ( not ( = ?auto_724711 ?auto_724712 ) ) ( not ( = ?auto_724711 ?auto_724713 ) ) ( not ( = ?auto_724711 ?auto_724714 ) ) ( not ( = ?auto_724711 ?auto_724715 ) ) ( not ( = ?auto_724711 ?auto_724716 ) ) ( not ( = ?auto_724712 ?auto_724713 ) ) ( not ( = ?auto_724712 ?auto_724714 ) ) ( not ( = ?auto_724712 ?auto_724715 ) ) ( not ( = ?auto_724712 ?auto_724716 ) ) ( not ( = ?auto_724713 ?auto_724714 ) ) ( not ( = ?auto_724713 ?auto_724715 ) ) ( not ( = ?auto_724713 ?auto_724716 ) ) ( not ( = ?auto_724714 ?auto_724715 ) ) ( not ( = ?auto_724714 ?auto_724716 ) ) ( not ( = ?auto_724715 ?auto_724716 ) ) ( ON ?auto_724715 ?auto_724716 ) ( ON ?auto_724714 ?auto_724715 ) ( ON ?auto_724713 ?auto_724714 ) ( ON ?auto_724712 ?auto_724713 ) ( ON ?auto_724711 ?auto_724712 ) ( ON ?auto_724710 ?auto_724711 ) ( ON ?auto_724709 ?auto_724710 ) ( ON ?auto_724708 ?auto_724709 ) ( ON ?auto_724707 ?auto_724708 ) ( ON ?auto_724706 ?auto_724707 ) ( ON ?auto_724705 ?auto_724706 ) ( ON ?auto_724704 ?auto_724705 ) ( ON ?auto_724703 ?auto_724704 ) ( ON ?auto_724702 ?auto_724703 ) ( ON ?auto_724701 ?auto_724702 ) ( ON ?auto_724700 ?auto_724701 ) ( CLEAR ?auto_724700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_724700 )
      ( MAKE-17PILE ?auto_724700 ?auto_724701 ?auto_724702 ?auto_724703 ?auto_724704 ?auto_724705 ?auto_724706 ?auto_724707 ?auto_724708 ?auto_724709 ?auto_724710 ?auto_724711 ?auto_724712 ?auto_724713 ?auto_724714 ?auto_724715 ?auto_724716 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_724734 - BLOCK
      ?auto_724735 - BLOCK
      ?auto_724736 - BLOCK
      ?auto_724737 - BLOCK
      ?auto_724738 - BLOCK
      ?auto_724739 - BLOCK
      ?auto_724740 - BLOCK
      ?auto_724741 - BLOCK
      ?auto_724742 - BLOCK
      ?auto_724743 - BLOCK
      ?auto_724744 - BLOCK
      ?auto_724745 - BLOCK
      ?auto_724746 - BLOCK
      ?auto_724747 - BLOCK
      ?auto_724748 - BLOCK
      ?auto_724749 - BLOCK
      ?auto_724750 - BLOCK
    )
    :vars
    (
      ?auto_724751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_724734 ?auto_724735 ) ) ( not ( = ?auto_724734 ?auto_724736 ) ) ( not ( = ?auto_724734 ?auto_724737 ) ) ( not ( = ?auto_724734 ?auto_724738 ) ) ( not ( = ?auto_724734 ?auto_724739 ) ) ( not ( = ?auto_724734 ?auto_724740 ) ) ( not ( = ?auto_724734 ?auto_724741 ) ) ( not ( = ?auto_724734 ?auto_724742 ) ) ( not ( = ?auto_724734 ?auto_724743 ) ) ( not ( = ?auto_724734 ?auto_724744 ) ) ( not ( = ?auto_724734 ?auto_724745 ) ) ( not ( = ?auto_724734 ?auto_724746 ) ) ( not ( = ?auto_724734 ?auto_724747 ) ) ( not ( = ?auto_724734 ?auto_724748 ) ) ( not ( = ?auto_724734 ?auto_724749 ) ) ( not ( = ?auto_724734 ?auto_724750 ) ) ( not ( = ?auto_724735 ?auto_724736 ) ) ( not ( = ?auto_724735 ?auto_724737 ) ) ( not ( = ?auto_724735 ?auto_724738 ) ) ( not ( = ?auto_724735 ?auto_724739 ) ) ( not ( = ?auto_724735 ?auto_724740 ) ) ( not ( = ?auto_724735 ?auto_724741 ) ) ( not ( = ?auto_724735 ?auto_724742 ) ) ( not ( = ?auto_724735 ?auto_724743 ) ) ( not ( = ?auto_724735 ?auto_724744 ) ) ( not ( = ?auto_724735 ?auto_724745 ) ) ( not ( = ?auto_724735 ?auto_724746 ) ) ( not ( = ?auto_724735 ?auto_724747 ) ) ( not ( = ?auto_724735 ?auto_724748 ) ) ( not ( = ?auto_724735 ?auto_724749 ) ) ( not ( = ?auto_724735 ?auto_724750 ) ) ( not ( = ?auto_724736 ?auto_724737 ) ) ( not ( = ?auto_724736 ?auto_724738 ) ) ( not ( = ?auto_724736 ?auto_724739 ) ) ( not ( = ?auto_724736 ?auto_724740 ) ) ( not ( = ?auto_724736 ?auto_724741 ) ) ( not ( = ?auto_724736 ?auto_724742 ) ) ( not ( = ?auto_724736 ?auto_724743 ) ) ( not ( = ?auto_724736 ?auto_724744 ) ) ( not ( = ?auto_724736 ?auto_724745 ) ) ( not ( = ?auto_724736 ?auto_724746 ) ) ( not ( = ?auto_724736 ?auto_724747 ) ) ( not ( = ?auto_724736 ?auto_724748 ) ) ( not ( = ?auto_724736 ?auto_724749 ) ) ( not ( = ?auto_724736 ?auto_724750 ) ) ( not ( = ?auto_724737 ?auto_724738 ) ) ( not ( = ?auto_724737 ?auto_724739 ) ) ( not ( = ?auto_724737 ?auto_724740 ) ) ( not ( = ?auto_724737 ?auto_724741 ) ) ( not ( = ?auto_724737 ?auto_724742 ) ) ( not ( = ?auto_724737 ?auto_724743 ) ) ( not ( = ?auto_724737 ?auto_724744 ) ) ( not ( = ?auto_724737 ?auto_724745 ) ) ( not ( = ?auto_724737 ?auto_724746 ) ) ( not ( = ?auto_724737 ?auto_724747 ) ) ( not ( = ?auto_724737 ?auto_724748 ) ) ( not ( = ?auto_724737 ?auto_724749 ) ) ( not ( = ?auto_724737 ?auto_724750 ) ) ( not ( = ?auto_724738 ?auto_724739 ) ) ( not ( = ?auto_724738 ?auto_724740 ) ) ( not ( = ?auto_724738 ?auto_724741 ) ) ( not ( = ?auto_724738 ?auto_724742 ) ) ( not ( = ?auto_724738 ?auto_724743 ) ) ( not ( = ?auto_724738 ?auto_724744 ) ) ( not ( = ?auto_724738 ?auto_724745 ) ) ( not ( = ?auto_724738 ?auto_724746 ) ) ( not ( = ?auto_724738 ?auto_724747 ) ) ( not ( = ?auto_724738 ?auto_724748 ) ) ( not ( = ?auto_724738 ?auto_724749 ) ) ( not ( = ?auto_724738 ?auto_724750 ) ) ( not ( = ?auto_724739 ?auto_724740 ) ) ( not ( = ?auto_724739 ?auto_724741 ) ) ( not ( = ?auto_724739 ?auto_724742 ) ) ( not ( = ?auto_724739 ?auto_724743 ) ) ( not ( = ?auto_724739 ?auto_724744 ) ) ( not ( = ?auto_724739 ?auto_724745 ) ) ( not ( = ?auto_724739 ?auto_724746 ) ) ( not ( = ?auto_724739 ?auto_724747 ) ) ( not ( = ?auto_724739 ?auto_724748 ) ) ( not ( = ?auto_724739 ?auto_724749 ) ) ( not ( = ?auto_724739 ?auto_724750 ) ) ( not ( = ?auto_724740 ?auto_724741 ) ) ( not ( = ?auto_724740 ?auto_724742 ) ) ( not ( = ?auto_724740 ?auto_724743 ) ) ( not ( = ?auto_724740 ?auto_724744 ) ) ( not ( = ?auto_724740 ?auto_724745 ) ) ( not ( = ?auto_724740 ?auto_724746 ) ) ( not ( = ?auto_724740 ?auto_724747 ) ) ( not ( = ?auto_724740 ?auto_724748 ) ) ( not ( = ?auto_724740 ?auto_724749 ) ) ( not ( = ?auto_724740 ?auto_724750 ) ) ( not ( = ?auto_724741 ?auto_724742 ) ) ( not ( = ?auto_724741 ?auto_724743 ) ) ( not ( = ?auto_724741 ?auto_724744 ) ) ( not ( = ?auto_724741 ?auto_724745 ) ) ( not ( = ?auto_724741 ?auto_724746 ) ) ( not ( = ?auto_724741 ?auto_724747 ) ) ( not ( = ?auto_724741 ?auto_724748 ) ) ( not ( = ?auto_724741 ?auto_724749 ) ) ( not ( = ?auto_724741 ?auto_724750 ) ) ( not ( = ?auto_724742 ?auto_724743 ) ) ( not ( = ?auto_724742 ?auto_724744 ) ) ( not ( = ?auto_724742 ?auto_724745 ) ) ( not ( = ?auto_724742 ?auto_724746 ) ) ( not ( = ?auto_724742 ?auto_724747 ) ) ( not ( = ?auto_724742 ?auto_724748 ) ) ( not ( = ?auto_724742 ?auto_724749 ) ) ( not ( = ?auto_724742 ?auto_724750 ) ) ( not ( = ?auto_724743 ?auto_724744 ) ) ( not ( = ?auto_724743 ?auto_724745 ) ) ( not ( = ?auto_724743 ?auto_724746 ) ) ( not ( = ?auto_724743 ?auto_724747 ) ) ( not ( = ?auto_724743 ?auto_724748 ) ) ( not ( = ?auto_724743 ?auto_724749 ) ) ( not ( = ?auto_724743 ?auto_724750 ) ) ( not ( = ?auto_724744 ?auto_724745 ) ) ( not ( = ?auto_724744 ?auto_724746 ) ) ( not ( = ?auto_724744 ?auto_724747 ) ) ( not ( = ?auto_724744 ?auto_724748 ) ) ( not ( = ?auto_724744 ?auto_724749 ) ) ( not ( = ?auto_724744 ?auto_724750 ) ) ( not ( = ?auto_724745 ?auto_724746 ) ) ( not ( = ?auto_724745 ?auto_724747 ) ) ( not ( = ?auto_724745 ?auto_724748 ) ) ( not ( = ?auto_724745 ?auto_724749 ) ) ( not ( = ?auto_724745 ?auto_724750 ) ) ( not ( = ?auto_724746 ?auto_724747 ) ) ( not ( = ?auto_724746 ?auto_724748 ) ) ( not ( = ?auto_724746 ?auto_724749 ) ) ( not ( = ?auto_724746 ?auto_724750 ) ) ( not ( = ?auto_724747 ?auto_724748 ) ) ( not ( = ?auto_724747 ?auto_724749 ) ) ( not ( = ?auto_724747 ?auto_724750 ) ) ( not ( = ?auto_724748 ?auto_724749 ) ) ( not ( = ?auto_724748 ?auto_724750 ) ) ( not ( = ?auto_724749 ?auto_724750 ) ) ( ON ?auto_724734 ?auto_724751 ) ( not ( = ?auto_724750 ?auto_724751 ) ) ( not ( = ?auto_724749 ?auto_724751 ) ) ( not ( = ?auto_724748 ?auto_724751 ) ) ( not ( = ?auto_724747 ?auto_724751 ) ) ( not ( = ?auto_724746 ?auto_724751 ) ) ( not ( = ?auto_724745 ?auto_724751 ) ) ( not ( = ?auto_724744 ?auto_724751 ) ) ( not ( = ?auto_724743 ?auto_724751 ) ) ( not ( = ?auto_724742 ?auto_724751 ) ) ( not ( = ?auto_724741 ?auto_724751 ) ) ( not ( = ?auto_724740 ?auto_724751 ) ) ( not ( = ?auto_724739 ?auto_724751 ) ) ( not ( = ?auto_724738 ?auto_724751 ) ) ( not ( = ?auto_724737 ?auto_724751 ) ) ( not ( = ?auto_724736 ?auto_724751 ) ) ( not ( = ?auto_724735 ?auto_724751 ) ) ( not ( = ?auto_724734 ?auto_724751 ) ) ( ON ?auto_724735 ?auto_724734 ) ( ON ?auto_724736 ?auto_724735 ) ( ON ?auto_724737 ?auto_724736 ) ( ON ?auto_724738 ?auto_724737 ) ( ON ?auto_724739 ?auto_724738 ) ( ON ?auto_724740 ?auto_724739 ) ( ON ?auto_724741 ?auto_724740 ) ( ON ?auto_724742 ?auto_724741 ) ( ON ?auto_724743 ?auto_724742 ) ( ON ?auto_724744 ?auto_724743 ) ( ON ?auto_724745 ?auto_724744 ) ( ON ?auto_724746 ?auto_724745 ) ( ON ?auto_724747 ?auto_724746 ) ( ON ?auto_724748 ?auto_724747 ) ( ON ?auto_724749 ?auto_724748 ) ( ON ?auto_724750 ?auto_724749 ) ( CLEAR ?auto_724750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_724750 ?auto_724749 ?auto_724748 ?auto_724747 ?auto_724746 ?auto_724745 ?auto_724744 ?auto_724743 ?auto_724742 ?auto_724741 ?auto_724740 ?auto_724739 ?auto_724738 ?auto_724737 ?auto_724736 ?auto_724735 ?auto_724734 )
      ( MAKE-17PILE ?auto_724734 ?auto_724735 ?auto_724736 ?auto_724737 ?auto_724738 ?auto_724739 ?auto_724740 ?auto_724741 ?auto_724742 ?auto_724743 ?auto_724744 ?auto_724745 ?auto_724746 ?auto_724747 ?auto_724748 ?auto_724749 ?auto_724750 ) )
  )

)
