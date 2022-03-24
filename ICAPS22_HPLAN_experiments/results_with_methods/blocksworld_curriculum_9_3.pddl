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
      ?auto_52441 - BLOCK
    )
    :vars
    (
      ?auto_52442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52441 ?auto_52442 ) ( CLEAR ?auto_52441 ) ( HAND-EMPTY ) ( not ( = ?auto_52441 ?auto_52442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52441 ?auto_52442 )
      ( !PUTDOWN ?auto_52441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52444 - BLOCK
    )
    :vars
    (
      ?auto_52445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52444 ?auto_52445 ) ( CLEAR ?auto_52444 ) ( HAND-EMPTY ) ( not ( = ?auto_52444 ?auto_52445 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52444 ?auto_52445 )
      ( !PUTDOWN ?auto_52444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52448 - BLOCK
      ?auto_52449 - BLOCK
    )
    :vars
    (
      ?auto_52450 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52448 ) ( ON ?auto_52449 ?auto_52450 ) ( CLEAR ?auto_52449 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52448 ) ( not ( = ?auto_52448 ?auto_52449 ) ) ( not ( = ?auto_52448 ?auto_52450 ) ) ( not ( = ?auto_52449 ?auto_52450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52449 ?auto_52450 )
      ( !STACK ?auto_52449 ?auto_52448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52453 - BLOCK
      ?auto_52454 - BLOCK
    )
    :vars
    (
      ?auto_52455 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52453 ) ( ON ?auto_52454 ?auto_52455 ) ( CLEAR ?auto_52454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52453 ) ( not ( = ?auto_52453 ?auto_52454 ) ) ( not ( = ?auto_52453 ?auto_52455 ) ) ( not ( = ?auto_52454 ?auto_52455 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52454 ?auto_52455 )
      ( !STACK ?auto_52454 ?auto_52453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52458 - BLOCK
      ?auto_52459 - BLOCK
    )
    :vars
    (
      ?auto_52460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52459 ?auto_52460 ) ( not ( = ?auto_52458 ?auto_52459 ) ) ( not ( = ?auto_52458 ?auto_52460 ) ) ( not ( = ?auto_52459 ?auto_52460 ) ) ( ON ?auto_52458 ?auto_52459 ) ( CLEAR ?auto_52458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52458 )
      ( MAKE-2PILE ?auto_52458 ?auto_52459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52463 - BLOCK
      ?auto_52464 - BLOCK
    )
    :vars
    (
      ?auto_52465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52464 ?auto_52465 ) ( not ( = ?auto_52463 ?auto_52464 ) ) ( not ( = ?auto_52463 ?auto_52465 ) ) ( not ( = ?auto_52464 ?auto_52465 ) ) ( ON ?auto_52463 ?auto_52464 ) ( CLEAR ?auto_52463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52463 )
      ( MAKE-2PILE ?auto_52463 ?auto_52464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52469 - BLOCK
      ?auto_52470 - BLOCK
      ?auto_52471 - BLOCK
    )
    :vars
    (
      ?auto_52472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52470 ) ( ON ?auto_52471 ?auto_52472 ) ( CLEAR ?auto_52471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52469 ) ( ON ?auto_52470 ?auto_52469 ) ( not ( = ?auto_52469 ?auto_52470 ) ) ( not ( = ?auto_52469 ?auto_52471 ) ) ( not ( = ?auto_52469 ?auto_52472 ) ) ( not ( = ?auto_52470 ?auto_52471 ) ) ( not ( = ?auto_52470 ?auto_52472 ) ) ( not ( = ?auto_52471 ?auto_52472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52471 ?auto_52472 )
      ( !STACK ?auto_52471 ?auto_52470 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52476 - BLOCK
      ?auto_52477 - BLOCK
      ?auto_52478 - BLOCK
    )
    :vars
    (
      ?auto_52479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52477 ) ( ON ?auto_52478 ?auto_52479 ) ( CLEAR ?auto_52478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52476 ) ( ON ?auto_52477 ?auto_52476 ) ( not ( = ?auto_52476 ?auto_52477 ) ) ( not ( = ?auto_52476 ?auto_52478 ) ) ( not ( = ?auto_52476 ?auto_52479 ) ) ( not ( = ?auto_52477 ?auto_52478 ) ) ( not ( = ?auto_52477 ?auto_52479 ) ) ( not ( = ?auto_52478 ?auto_52479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52478 ?auto_52479 )
      ( !STACK ?auto_52478 ?auto_52477 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52483 - BLOCK
      ?auto_52484 - BLOCK
      ?auto_52485 - BLOCK
    )
    :vars
    (
      ?auto_52486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52485 ?auto_52486 ) ( ON-TABLE ?auto_52483 ) ( not ( = ?auto_52483 ?auto_52484 ) ) ( not ( = ?auto_52483 ?auto_52485 ) ) ( not ( = ?auto_52483 ?auto_52486 ) ) ( not ( = ?auto_52484 ?auto_52485 ) ) ( not ( = ?auto_52484 ?auto_52486 ) ) ( not ( = ?auto_52485 ?auto_52486 ) ) ( CLEAR ?auto_52483 ) ( ON ?auto_52484 ?auto_52485 ) ( CLEAR ?auto_52484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52483 ?auto_52484 )
      ( MAKE-3PILE ?auto_52483 ?auto_52484 ?auto_52485 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52490 - BLOCK
      ?auto_52491 - BLOCK
      ?auto_52492 - BLOCK
    )
    :vars
    (
      ?auto_52493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52492 ?auto_52493 ) ( ON-TABLE ?auto_52490 ) ( not ( = ?auto_52490 ?auto_52491 ) ) ( not ( = ?auto_52490 ?auto_52492 ) ) ( not ( = ?auto_52490 ?auto_52493 ) ) ( not ( = ?auto_52491 ?auto_52492 ) ) ( not ( = ?auto_52491 ?auto_52493 ) ) ( not ( = ?auto_52492 ?auto_52493 ) ) ( CLEAR ?auto_52490 ) ( ON ?auto_52491 ?auto_52492 ) ( CLEAR ?auto_52491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52490 ?auto_52491 )
      ( MAKE-3PILE ?auto_52490 ?auto_52491 ?auto_52492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52497 - BLOCK
      ?auto_52498 - BLOCK
      ?auto_52499 - BLOCK
    )
    :vars
    (
      ?auto_52500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52499 ?auto_52500 ) ( not ( = ?auto_52497 ?auto_52498 ) ) ( not ( = ?auto_52497 ?auto_52499 ) ) ( not ( = ?auto_52497 ?auto_52500 ) ) ( not ( = ?auto_52498 ?auto_52499 ) ) ( not ( = ?auto_52498 ?auto_52500 ) ) ( not ( = ?auto_52499 ?auto_52500 ) ) ( ON ?auto_52498 ?auto_52499 ) ( ON ?auto_52497 ?auto_52498 ) ( CLEAR ?auto_52497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52497 )
      ( MAKE-3PILE ?auto_52497 ?auto_52498 ?auto_52499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52504 - BLOCK
      ?auto_52505 - BLOCK
      ?auto_52506 - BLOCK
    )
    :vars
    (
      ?auto_52507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52506 ?auto_52507 ) ( not ( = ?auto_52504 ?auto_52505 ) ) ( not ( = ?auto_52504 ?auto_52506 ) ) ( not ( = ?auto_52504 ?auto_52507 ) ) ( not ( = ?auto_52505 ?auto_52506 ) ) ( not ( = ?auto_52505 ?auto_52507 ) ) ( not ( = ?auto_52506 ?auto_52507 ) ) ( ON ?auto_52505 ?auto_52506 ) ( ON ?auto_52504 ?auto_52505 ) ( CLEAR ?auto_52504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52504 )
      ( MAKE-3PILE ?auto_52504 ?auto_52505 ?auto_52506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52512 - BLOCK
      ?auto_52513 - BLOCK
      ?auto_52514 - BLOCK
      ?auto_52515 - BLOCK
    )
    :vars
    (
      ?auto_52516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52514 ) ( ON ?auto_52515 ?auto_52516 ) ( CLEAR ?auto_52515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52512 ) ( ON ?auto_52513 ?auto_52512 ) ( ON ?auto_52514 ?auto_52513 ) ( not ( = ?auto_52512 ?auto_52513 ) ) ( not ( = ?auto_52512 ?auto_52514 ) ) ( not ( = ?auto_52512 ?auto_52515 ) ) ( not ( = ?auto_52512 ?auto_52516 ) ) ( not ( = ?auto_52513 ?auto_52514 ) ) ( not ( = ?auto_52513 ?auto_52515 ) ) ( not ( = ?auto_52513 ?auto_52516 ) ) ( not ( = ?auto_52514 ?auto_52515 ) ) ( not ( = ?auto_52514 ?auto_52516 ) ) ( not ( = ?auto_52515 ?auto_52516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52515 ?auto_52516 )
      ( !STACK ?auto_52515 ?auto_52514 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52521 - BLOCK
      ?auto_52522 - BLOCK
      ?auto_52523 - BLOCK
      ?auto_52524 - BLOCK
    )
    :vars
    (
      ?auto_52525 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52523 ) ( ON ?auto_52524 ?auto_52525 ) ( CLEAR ?auto_52524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52521 ) ( ON ?auto_52522 ?auto_52521 ) ( ON ?auto_52523 ?auto_52522 ) ( not ( = ?auto_52521 ?auto_52522 ) ) ( not ( = ?auto_52521 ?auto_52523 ) ) ( not ( = ?auto_52521 ?auto_52524 ) ) ( not ( = ?auto_52521 ?auto_52525 ) ) ( not ( = ?auto_52522 ?auto_52523 ) ) ( not ( = ?auto_52522 ?auto_52524 ) ) ( not ( = ?auto_52522 ?auto_52525 ) ) ( not ( = ?auto_52523 ?auto_52524 ) ) ( not ( = ?auto_52523 ?auto_52525 ) ) ( not ( = ?auto_52524 ?auto_52525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52524 ?auto_52525 )
      ( !STACK ?auto_52524 ?auto_52523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52530 - BLOCK
      ?auto_52531 - BLOCK
      ?auto_52532 - BLOCK
      ?auto_52533 - BLOCK
    )
    :vars
    (
      ?auto_52534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52533 ?auto_52534 ) ( ON-TABLE ?auto_52530 ) ( ON ?auto_52531 ?auto_52530 ) ( not ( = ?auto_52530 ?auto_52531 ) ) ( not ( = ?auto_52530 ?auto_52532 ) ) ( not ( = ?auto_52530 ?auto_52533 ) ) ( not ( = ?auto_52530 ?auto_52534 ) ) ( not ( = ?auto_52531 ?auto_52532 ) ) ( not ( = ?auto_52531 ?auto_52533 ) ) ( not ( = ?auto_52531 ?auto_52534 ) ) ( not ( = ?auto_52532 ?auto_52533 ) ) ( not ( = ?auto_52532 ?auto_52534 ) ) ( not ( = ?auto_52533 ?auto_52534 ) ) ( CLEAR ?auto_52531 ) ( ON ?auto_52532 ?auto_52533 ) ( CLEAR ?auto_52532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52530 ?auto_52531 ?auto_52532 )
      ( MAKE-4PILE ?auto_52530 ?auto_52531 ?auto_52532 ?auto_52533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52539 - BLOCK
      ?auto_52540 - BLOCK
      ?auto_52541 - BLOCK
      ?auto_52542 - BLOCK
    )
    :vars
    (
      ?auto_52543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52542 ?auto_52543 ) ( ON-TABLE ?auto_52539 ) ( ON ?auto_52540 ?auto_52539 ) ( not ( = ?auto_52539 ?auto_52540 ) ) ( not ( = ?auto_52539 ?auto_52541 ) ) ( not ( = ?auto_52539 ?auto_52542 ) ) ( not ( = ?auto_52539 ?auto_52543 ) ) ( not ( = ?auto_52540 ?auto_52541 ) ) ( not ( = ?auto_52540 ?auto_52542 ) ) ( not ( = ?auto_52540 ?auto_52543 ) ) ( not ( = ?auto_52541 ?auto_52542 ) ) ( not ( = ?auto_52541 ?auto_52543 ) ) ( not ( = ?auto_52542 ?auto_52543 ) ) ( CLEAR ?auto_52540 ) ( ON ?auto_52541 ?auto_52542 ) ( CLEAR ?auto_52541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52539 ?auto_52540 ?auto_52541 )
      ( MAKE-4PILE ?auto_52539 ?auto_52540 ?auto_52541 ?auto_52542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52548 - BLOCK
      ?auto_52549 - BLOCK
      ?auto_52550 - BLOCK
      ?auto_52551 - BLOCK
    )
    :vars
    (
      ?auto_52552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52551 ?auto_52552 ) ( ON-TABLE ?auto_52548 ) ( not ( = ?auto_52548 ?auto_52549 ) ) ( not ( = ?auto_52548 ?auto_52550 ) ) ( not ( = ?auto_52548 ?auto_52551 ) ) ( not ( = ?auto_52548 ?auto_52552 ) ) ( not ( = ?auto_52549 ?auto_52550 ) ) ( not ( = ?auto_52549 ?auto_52551 ) ) ( not ( = ?auto_52549 ?auto_52552 ) ) ( not ( = ?auto_52550 ?auto_52551 ) ) ( not ( = ?auto_52550 ?auto_52552 ) ) ( not ( = ?auto_52551 ?auto_52552 ) ) ( ON ?auto_52550 ?auto_52551 ) ( CLEAR ?auto_52548 ) ( ON ?auto_52549 ?auto_52550 ) ( CLEAR ?auto_52549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52548 ?auto_52549 )
      ( MAKE-4PILE ?auto_52548 ?auto_52549 ?auto_52550 ?auto_52551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52557 - BLOCK
      ?auto_52558 - BLOCK
      ?auto_52559 - BLOCK
      ?auto_52560 - BLOCK
    )
    :vars
    (
      ?auto_52561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52560 ?auto_52561 ) ( ON-TABLE ?auto_52557 ) ( not ( = ?auto_52557 ?auto_52558 ) ) ( not ( = ?auto_52557 ?auto_52559 ) ) ( not ( = ?auto_52557 ?auto_52560 ) ) ( not ( = ?auto_52557 ?auto_52561 ) ) ( not ( = ?auto_52558 ?auto_52559 ) ) ( not ( = ?auto_52558 ?auto_52560 ) ) ( not ( = ?auto_52558 ?auto_52561 ) ) ( not ( = ?auto_52559 ?auto_52560 ) ) ( not ( = ?auto_52559 ?auto_52561 ) ) ( not ( = ?auto_52560 ?auto_52561 ) ) ( ON ?auto_52559 ?auto_52560 ) ( CLEAR ?auto_52557 ) ( ON ?auto_52558 ?auto_52559 ) ( CLEAR ?auto_52558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52557 ?auto_52558 )
      ( MAKE-4PILE ?auto_52557 ?auto_52558 ?auto_52559 ?auto_52560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52566 - BLOCK
      ?auto_52567 - BLOCK
      ?auto_52568 - BLOCK
      ?auto_52569 - BLOCK
    )
    :vars
    (
      ?auto_52570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52569 ?auto_52570 ) ( not ( = ?auto_52566 ?auto_52567 ) ) ( not ( = ?auto_52566 ?auto_52568 ) ) ( not ( = ?auto_52566 ?auto_52569 ) ) ( not ( = ?auto_52566 ?auto_52570 ) ) ( not ( = ?auto_52567 ?auto_52568 ) ) ( not ( = ?auto_52567 ?auto_52569 ) ) ( not ( = ?auto_52567 ?auto_52570 ) ) ( not ( = ?auto_52568 ?auto_52569 ) ) ( not ( = ?auto_52568 ?auto_52570 ) ) ( not ( = ?auto_52569 ?auto_52570 ) ) ( ON ?auto_52568 ?auto_52569 ) ( ON ?auto_52567 ?auto_52568 ) ( ON ?auto_52566 ?auto_52567 ) ( CLEAR ?auto_52566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52566 )
      ( MAKE-4PILE ?auto_52566 ?auto_52567 ?auto_52568 ?auto_52569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52575 - BLOCK
      ?auto_52576 - BLOCK
      ?auto_52577 - BLOCK
      ?auto_52578 - BLOCK
    )
    :vars
    (
      ?auto_52579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52578 ?auto_52579 ) ( not ( = ?auto_52575 ?auto_52576 ) ) ( not ( = ?auto_52575 ?auto_52577 ) ) ( not ( = ?auto_52575 ?auto_52578 ) ) ( not ( = ?auto_52575 ?auto_52579 ) ) ( not ( = ?auto_52576 ?auto_52577 ) ) ( not ( = ?auto_52576 ?auto_52578 ) ) ( not ( = ?auto_52576 ?auto_52579 ) ) ( not ( = ?auto_52577 ?auto_52578 ) ) ( not ( = ?auto_52577 ?auto_52579 ) ) ( not ( = ?auto_52578 ?auto_52579 ) ) ( ON ?auto_52577 ?auto_52578 ) ( ON ?auto_52576 ?auto_52577 ) ( ON ?auto_52575 ?auto_52576 ) ( CLEAR ?auto_52575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52575 )
      ( MAKE-4PILE ?auto_52575 ?auto_52576 ?auto_52577 ?auto_52578 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52585 - BLOCK
      ?auto_52586 - BLOCK
      ?auto_52587 - BLOCK
      ?auto_52588 - BLOCK
      ?auto_52589 - BLOCK
    )
    :vars
    (
      ?auto_52590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52588 ) ( ON ?auto_52589 ?auto_52590 ) ( CLEAR ?auto_52589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52585 ) ( ON ?auto_52586 ?auto_52585 ) ( ON ?auto_52587 ?auto_52586 ) ( ON ?auto_52588 ?auto_52587 ) ( not ( = ?auto_52585 ?auto_52586 ) ) ( not ( = ?auto_52585 ?auto_52587 ) ) ( not ( = ?auto_52585 ?auto_52588 ) ) ( not ( = ?auto_52585 ?auto_52589 ) ) ( not ( = ?auto_52585 ?auto_52590 ) ) ( not ( = ?auto_52586 ?auto_52587 ) ) ( not ( = ?auto_52586 ?auto_52588 ) ) ( not ( = ?auto_52586 ?auto_52589 ) ) ( not ( = ?auto_52586 ?auto_52590 ) ) ( not ( = ?auto_52587 ?auto_52588 ) ) ( not ( = ?auto_52587 ?auto_52589 ) ) ( not ( = ?auto_52587 ?auto_52590 ) ) ( not ( = ?auto_52588 ?auto_52589 ) ) ( not ( = ?auto_52588 ?auto_52590 ) ) ( not ( = ?auto_52589 ?auto_52590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52589 ?auto_52590 )
      ( !STACK ?auto_52589 ?auto_52588 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52596 - BLOCK
      ?auto_52597 - BLOCK
      ?auto_52598 - BLOCK
      ?auto_52599 - BLOCK
      ?auto_52600 - BLOCK
    )
    :vars
    (
      ?auto_52601 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52599 ) ( ON ?auto_52600 ?auto_52601 ) ( CLEAR ?auto_52600 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52596 ) ( ON ?auto_52597 ?auto_52596 ) ( ON ?auto_52598 ?auto_52597 ) ( ON ?auto_52599 ?auto_52598 ) ( not ( = ?auto_52596 ?auto_52597 ) ) ( not ( = ?auto_52596 ?auto_52598 ) ) ( not ( = ?auto_52596 ?auto_52599 ) ) ( not ( = ?auto_52596 ?auto_52600 ) ) ( not ( = ?auto_52596 ?auto_52601 ) ) ( not ( = ?auto_52597 ?auto_52598 ) ) ( not ( = ?auto_52597 ?auto_52599 ) ) ( not ( = ?auto_52597 ?auto_52600 ) ) ( not ( = ?auto_52597 ?auto_52601 ) ) ( not ( = ?auto_52598 ?auto_52599 ) ) ( not ( = ?auto_52598 ?auto_52600 ) ) ( not ( = ?auto_52598 ?auto_52601 ) ) ( not ( = ?auto_52599 ?auto_52600 ) ) ( not ( = ?auto_52599 ?auto_52601 ) ) ( not ( = ?auto_52600 ?auto_52601 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52600 ?auto_52601 )
      ( !STACK ?auto_52600 ?auto_52599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52607 - BLOCK
      ?auto_52608 - BLOCK
      ?auto_52609 - BLOCK
      ?auto_52610 - BLOCK
      ?auto_52611 - BLOCK
    )
    :vars
    (
      ?auto_52612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52611 ?auto_52612 ) ( ON-TABLE ?auto_52607 ) ( ON ?auto_52608 ?auto_52607 ) ( ON ?auto_52609 ?auto_52608 ) ( not ( = ?auto_52607 ?auto_52608 ) ) ( not ( = ?auto_52607 ?auto_52609 ) ) ( not ( = ?auto_52607 ?auto_52610 ) ) ( not ( = ?auto_52607 ?auto_52611 ) ) ( not ( = ?auto_52607 ?auto_52612 ) ) ( not ( = ?auto_52608 ?auto_52609 ) ) ( not ( = ?auto_52608 ?auto_52610 ) ) ( not ( = ?auto_52608 ?auto_52611 ) ) ( not ( = ?auto_52608 ?auto_52612 ) ) ( not ( = ?auto_52609 ?auto_52610 ) ) ( not ( = ?auto_52609 ?auto_52611 ) ) ( not ( = ?auto_52609 ?auto_52612 ) ) ( not ( = ?auto_52610 ?auto_52611 ) ) ( not ( = ?auto_52610 ?auto_52612 ) ) ( not ( = ?auto_52611 ?auto_52612 ) ) ( CLEAR ?auto_52609 ) ( ON ?auto_52610 ?auto_52611 ) ( CLEAR ?auto_52610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52607 ?auto_52608 ?auto_52609 ?auto_52610 )
      ( MAKE-5PILE ?auto_52607 ?auto_52608 ?auto_52609 ?auto_52610 ?auto_52611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52618 - BLOCK
      ?auto_52619 - BLOCK
      ?auto_52620 - BLOCK
      ?auto_52621 - BLOCK
      ?auto_52622 - BLOCK
    )
    :vars
    (
      ?auto_52623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52622 ?auto_52623 ) ( ON-TABLE ?auto_52618 ) ( ON ?auto_52619 ?auto_52618 ) ( ON ?auto_52620 ?auto_52619 ) ( not ( = ?auto_52618 ?auto_52619 ) ) ( not ( = ?auto_52618 ?auto_52620 ) ) ( not ( = ?auto_52618 ?auto_52621 ) ) ( not ( = ?auto_52618 ?auto_52622 ) ) ( not ( = ?auto_52618 ?auto_52623 ) ) ( not ( = ?auto_52619 ?auto_52620 ) ) ( not ( = ?auto_52619 ?auto_52621 ) ) ( not ( = ?auto_52619 ?auto_52622 ) ) ( not ( = ?auto_52619 ?auto_52623 ) ) ( not ( = ?auto_52620 ?auto_52621 ) ) ( not ( = ?auto_52620 ?auto_52622 ) ) ( not ( = ?auto_52620 ?auto_52623 ) ) ( not ( = ?auto_52621 ?auto_52622 ) ) ( not ( = ?auto_52621 ?auto_52623 ) ) ( not ( = ?auto_52622 ?auto_52623 ) ) ( CLEAR ?auto_52620 ) ( ON ?auto_52621 ?auto_52622 ) ( CLEAR ?auto_52621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52618 ?auto_52619 ?auto_52620 ?auto_52621 )
      ( MAKE-5PILE ?auto_52618 ?auto_52619 ?auto_52620 ?auto_52621 ?auto_52622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52629 - BLOCK
      ?auto_52630 - BLOCK
      ?auto_52631 - BLOCK
      ?auto_52632 - BLOCK
      ?auto_52633 - BLOCK
    )
    :vars
    (
      ?auto_52634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52633 ?auto_52634 ) ( ON-TABLE ?auto_52629 ) ( ON ?auto_52630 ?auto_52629 ) ( not ( = ?auto_52629 ?auto_52630 ) ) ( not ( = ?auto_52629 ?auto_52631 ) ) ( not ( = ?auto_52629 ?auto_52632 ) ) ( not ( = ?auto_52629 ?auto_52633 ) ) ( not ( = ?auto_52629 ?auto_52634 ) ) ( not ( = ?auto_52630 ?auto_52631 ) ) ( not ( = ?auto_52630 ?auto_52632 ) ) ( not ( = ?auto_52630 ?auto_52633 ) ) ( not ( = ?auto_52630 ?auto_52634 ) ) ( not ( = ?auto_52631 ?auto_52632 ) ) ( not ( = ?auto_52631 ?auto_52633 ) ) ( not ( = ?auto_52631 ?auto_52634 ) ) ( not ( = ?auto_52632 ?auto_52633 ) ) ( not ( = ?auto_52632 ?auto_52634 ) ) ( not ( = ?auto_52633 ?auto_52634 ) ) ( ON ?auto_52632 ?auto_52633 ) ( CLEAR ?auto_52630 ) ( ON ?auto_52631 ?auto_52632 ) ( CLEAR ?auto_52631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52629 ?auto_52630 ?auto_52631 )
      ( MAKE-5PILE ?auto_52629 ?auto_52630 ?auto_52631 ?auto_52632 ?auto_52633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52640 - BLOCK
      ?auto_52641 - BLOCK
      ?auto_52642 - BLOCK
      ?auto_52643 - BLOCK
      ?auto_52644 - BLOCK
    )
    :vars
    (
      ?auto_52645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52644 ?auto_52645 ) ( ON-TABLE ?auto_52640 ) ( ON ?auto_52641 ?auto_52640 ) ( not ( = ?auto_52640 ?auto_52641 ) ) ( not ( = ?auto_52640 ?auto_52642 ) ) ( not ( = ?auto_52640 ?auto_52643 ) ) ( not ( = ?auto_52640 ?auto_52644 ) ) ( not ( = ?auto_52640 ?auto_52645 ) ) ( not ( = ?auto_52641 ?auto_52642 ) ) ( not ( = ?auto_52641 ?auto_52643 ) ) ( not ( = ?auto_52641 ?auto_52644 ) ) ( not ( = ?auto_52641 ?auto_52645 ) ) ( not ( = ?auto_52642 ?auto_52643 ) ) ( not ( = ?auto_52642 ?auto_52644 ) ) ( not ( = ?auto_52642 ?auto_52645 ) ) ( not ( = ?auto_52643 ?auto_52644 ) ) ( not ( = ?auto_52643 ?auto_52645 ) ) ( not ( = ?auto_52644 ?auto_52645 ) ) ( ON ?auto_52643 ?auto_52644 ) ( CLEAR ?auto_52641 ) ( ON ?auto_52642 ?auto_52643 ) ( CLEAR ?auto_52642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52640 ?auto_52641 ?auto_52642 )
      ( MAKE-5PILE ?auto_52640 ?auto_52641 ?auto_52642 ?auto_52643 ?auto_52644 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52651 - BLOCK
      ?auto_52652 - BLOCK
      ?auto_52653 - BLOCK
      ?auto_52654 - BLOCK
      ?auto_52655 - BLOCK
    )
    :vars
    (
      ?auto_52656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52655 ?auto_52656 ) ( ON-TABLE ?auto_52651 ) ( not ( = ?auto_52651 ?auto_52652 ) ) ( not ( = ?auto_52651 ?auto_52653 ) ) ( not ( = ?auto_52651 ?auto_52654 ) ) ( not ( = ?auto_52651 ?auto_52655 ) ) ( not ( = ?auto_52651 ?auto_52656 ) ) ( not ( = ?auto_52652 ?auto_52653 ) ) ( not ( = ?auto_52652 ?auto_52654 ) ) ( not ( = ?auto_52652 ?auto_52655 ) ) ( not ( = ?auto_52652 ?auto_52656 ) ) ( not ( = ?auto_52653 ?auto_52654 ) ) ( not ( = ?auto_52653 ?auto_52655 ) ) ( not ( = ?auto_52653 ?auto_52656 ) ) ( not ( = ?auto_52654 ?auto_52655 ) ) ( not ( = ?auto_52654 ?auto_52656 ) ) ( not ( = ?auto_52655 ?auto_52656 ) ) ( ON ?auto_52654 ?auto_52655 ) ( ON ?auto_52653 ?auto_52654 ) ( CLEAR ?auto_52651 ) ( ON ?auto_52652 ?auto_52653 ) ( CLEAR ?auto_52652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52651 ?auto_52652 )
      ( MAKE-5PILE ?auto_52651 ?auto_52652 ?auto_52653 ?auto_52654 ?auto_52655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52662 - BLOCK
      ?auto_52663 - BLOCK
      ?auto_52664 - BLOCK
      ?auto_52665 - BLOCK
      ?auto_52666 - BLOCK
    )
    :vars
    (
      ?auto_52667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52666 ?auto_52667 ) ( ON-TABLE ?auto_52662 ) ( not ( = ?auto_52662 ?auto_52663 ) ) ( not ( = ?auto_52662 ?auto_52664 ) ) ( not ( = ?auto_52662 ?auto_52665 ) ) ( not ( = ?auto_52662 ?auto_52666 ) ) ( not ( = ?auto_52662 ?auto_52667 ) ) ( not ( = ?auto_52663 ?auto_52664 ) ) ( not ( = ?auto_52663 ?auto_52665 ) ) ( not ( = ?auto_52663 ?auto_52666 ) ) ( not ( = ?auto_52663 ?auto_52667 ) ) ( not ( = ?auto_52664 ?auto_52665 ) ) ( not ( = ?auto_52664 ?auto_52666 ) ) ( not ( = ?auto_52664 ?auto_52667 ) ) ( not ( = ?auto_52665 ?auto_52666 ) ) ( not ( = ?auto_52665 ?auto_52667 ) ) ( not ( = ?auto_52666 ?auto_52667 ) ) ( ON ?auto_52665 ?auto_52666 ) ( ON ?auto_52664 ?auto_52665 ) ( CLEAR ?auto_52662 ) ( ON ?auto_52663 ?auto_52664 ) ( CLEAR ?auto_52663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52662 ?auto_52663 )
      ( MAKE-5PILE ?auto_52662 ?auto_52663 ?auto_52664 ?auto_52665 ?auto_52666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52673 - BLOCK
      ?auto_52674 - BLOCK
      ?auto_52675 - BLOCK
      ?auto_52676 - BLOCK
      ?auto_52677 - BLOCK
    )
    :vars
    (
      ?auto_52678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52677 ?auto_52678 ) ( not ( = ?auto_52673 ?auto_52674 ) ) ( not ( = ?auto_52673 ?auto_52675 ) ) ( not ( = ?auto_52673 ?auto_52676 ) ) ( not ( = ?auto_52673 ?auto_52677 ) ) ( not ( = ?auto_52673 ?auto_52678 ) ) ( not ( = ?auto_52674 ?auto_52675 ) ) ( not ( = ?auto_52674 ?auto_52676 ) ) ( not ( = ?auto_52674 ?auto_52677 ) ) ( not ( = ?auto_52674 ?auto_52678 ) ) ( not ( = ?auto_52675 ?auto_52676 ) ) ( not ( = ?auto_52675 ?auto_52677 ) ) ( not ( = ?auto_52675 ?auto_52678 ) ) ( not ( = ?auto_52676 ?auto_52677 ) ) ( not ( = ?auto_52676 ?auto_52678 ) ) ( not ( = ?auto_52677 ?auto_52678 ) ) ( ON ?auto_52676 ?auto_52677 ) ( ON ?auto_52675 ?auto_52676 ) ( ON ?auto_52674 ?auto_52675 ) ( ON ?auto_52673 ?auto_52674 ) ( CLEAR ?auto_52673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52673 )
      ( MAKE-5PILE ?auto_52673 ?auto_52674 ?auto_52675 ?auto_52676 ?auto_52677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52684 - BLOCK
      ?auto_52685 - BLOCK
      ?auto_52686 - BLOCK
      ?auto_52687 - BLOCK
      ?auto_52688 - BLOCK
    )
    :vars
    (
      ?auto_52689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52688 ?auto_52689 ) ( not ( = ?auto_52684 ?auto_52685 ) ) ( not ( = ?auto_52684 ?auto_52686 ) ) ( not ( = ?auto_52684 ?auto_52687 ) ) ( not ( = ?auto_52684 ?auto_52688 ) ) ( not ( = ?auto_52684 ?auto_52689 ) ) ( not ( = ?auto_52685 ?auto_52686 ) ) ( not ( = ?auto_52685 ?auto_52687 ) ) ( not ( = ?auto_52685 ?auto_52688 ) ) ( not ( = ?auto_52685 ?auto_52689 ) ) ( not ( = ?auto_52686 ?auto_52687 ) ) ( not ( = ?auto_52686 ?auto_52688 ) ) ( not ( = ?auto_52686 ?auto_52689 ) ) ( not ( = ?auto_52687 ?auto_52688 ) ) ( not ( = ?auto_52687 ?auto_52689 ) ) ( not ( = ?auto_52688 ?auto_52689 ) ) ( ON ?auto_52687 ?auto_52688 ) ( ON ?auto_52686 ?auto_52687 ) ( ON ?auto_52685 ?auto_52686 ) ( ON ?auto_52684 ?auto_52685 ) ( CLEAR ?auto_52684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52684 )
      ( MAKE-5PILE ?auto_52684 ?auto_52685 ?auto_52686 ?auto_52687 ?auto_52688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52696 - BLOCK
      ?auto_52697 - BLOCK
      ?auto_52698 - BLOCK
      ?auto_52699 - BLOCK
      ?auto_52700 - BLOCK
      ?auto_52701 - BLOCK
    )
    :vars
    (
      ?auto_52702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52700 ) ( ON ?auto_52701 ?auto_52702 ) ( CLEAR ?auto_52701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52696 ) ( ON ?auto_52697 ?auto_52696 ) ( ON ?auto_52698 ?auto_52697 ) ( ON ?auto_52699 ?auto_52698 ) ( ON ?auto_52700 ?auto_52699 ) ( not ( = ?auto_52696 ?auto_52697 ) ) ( not ( = ?auto_52696 ?auto_52698 ) ) ( not ( = ?auto_52696 ?auto_52699 ) ) ( not ( = ?auto_52696 ?auto_52700 ) ) ( not ( = ?auto_52696 ?auto_52701 ) ) ( not ( = ?auto_52696 ?auto_52702 ) ) ( not ( = ?auto_52697 ?auto_52698 ) ) ( not ( = ?auto_52697 ?auto_52699 ) ) ( not ( = ?auto_52697 ?auto_52700 ) ) ( not ( = ?auto_52697 ?auto_52701 ) ) ( not ( = ?auto_52697 ?auto_52702 ) ) ( not ( = ?auto_52698 ?auto_52699 ) ) ( not ( = ?auto_52698 ?auto_52700 ) ) ( not ( = ?auto_52698 ?auto_52701 ) ) ( not ( = ?auto_52698 ?auto_52702 ) ) ( not ( = ?auto_52699 ?auto_52700 ) ) ( not ( = ?auto_52699 ?auto_52701 ) ) ( not ( = ?auto_52699 ?auto_52702 ) ) ( not ( = ?auto_52700 ?auto_52701 ) ) ( not ( = ?auto_52700 ?auto_52702 ) ) ( not ( = ?auto_52701 ?auto_52702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52701 ?auto_52702 )
      ( !STACK ?auto_52701 ?auto_52700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52709 - BLOCK
      ?auto_52710 - BLOCK
      ?auto_52711 - BLOCK
      ?auto_52712 - BLOCK
      ?auto_52713 - BLOCK
      ?auto_52714 - BLOCK
    )
    :vars
    (
      ?auto_52715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52713 ) ( ON ?auto_52714 ?auto_52715 ) ( CLEAR ?auto_52714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52709 ) ( ON ?auto_52710 ?auto_52709 ) ( ON ?auto_52711 ?auto_52710 ) ( ON ?auto_52712 ?auto_52711 ) ( ON ?auto_52713 ?auto_52712 ) ( not ( = ?auto_52709 ?auto_52710 ) ) ( not ( = ?auto_52709 ?auto_52711 ) ) ( not ( = ?auto_52709 ?auto_52712 ) ) ( not ( = ?auto_52709 ?auto_52713 ) ) ( not ( = ?auto_52709 ?auto_52714 ) ) ( not ( = ?auto_52709 ?auto_52715 ) ) ( not ( = ?auto_52710 ?auto_52711 ) ) ( not ( = ?auto_52710 ?auto_52712 ) ) ( not ( = ?auto_52710 ?auto_52713 ) ) ( not ( = ?auto_52710 ?auto_52714 ) ) ( not ( = ?auto_52710 ?auto_52715 ) ) ( not ( = ?auto_52711 ?auto_52712 ) ) ( not ( = ?auto_52711 ?auto_52713 ) ) ( not ( = ?auto_52711 ?auto_52714 ) ) ( not ( = ?auto_52711 ?auto_52715 ) ) ( not ( = ?auto_52712 ?auto_52713 ) ) ( not ( = ?auto_52712 ?auto_52714 ) ) ( not ( = ?auto_52712 ?auto_52715 ) ) ( not ( = ?auto_52713 ?auto_52714 ) ) ( not ( = ?auto_52713 ?auto_52715 ) ) ( not ( = ?auto_52714 ?auto_52715 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52714 ?auto_52715 )
      ( !STACK ?auto_52714 ?auto_52713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52722 - BLOCK
      ?auto_52723 - BLOCK
      ?auto_52724 - BLOCK
      ?auto_52725 - BLOCK
      ?auto_52726 - BLOCK
      ?auto_52727 - BLOCK
    )
    :vars
    (
      ?auto_52728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52727 ?auto_52728 ) ( ON-TABLE ?auto_52722 ) ( ON ?auto_52723 ?auto_52722 ) ( ON ?auto_52724 ?auto_52723 ) ( ON ?auto_52725 ?auto_52724 ) ( not ( = ?auto_52722 ?auto_52723 ) ) ( not ( = ?auto_52722 ?auto_52724 ) ) ( not ( = ?auto_52722 ?auto_52725 ) ) ( not ( = ?auto_52722 ?auto_52726 ) ) ( not ( = ?auto_52722 ?auto_52727 ) ) ( not ( = ?auto_52722 ?auto_52728 ) ) ( not ( = ?auto_52723 ?auto_52724 ) ) ( not ( = ?auto_52723 ?auto_52725 ) ) ( not ( = ?auto_52723 ?auto_52726 ) ) ( not ( = ?auto_52723 ?auto_52727 ) ) ( not ( = ?auto_52723 ?auto_52728 ) ) ( not ( = ?auto_52724 ?auto_52725 ) ) ( not ( = ?auto_52724 ?auto_52726 ) ) ( not ( = ?auto_52724 ?auto_52727 ) ) ( not ( = ?auto_52724 ?auto_52728 ) ) ( not ( = ?auto_52725 ?auto_52726 ) ) ( not ( = ?auto_52725 ?auto_52727 ) ) ( not ( = ?auto_52725 ?auto_52728 ) ) ( not ( = ?auto_52726 ?auto_52727 ) ) ( not ( = ?auto_52726 ?auto_52728 ) ) ( not ( = ?auto_52727 ?auto_52728 ) ) ( CLEAR ?auto_52725 ) ( ON ?auto_52726 ?auto_52727 ) ( CLEAR ?auto_52726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52722 ?auto_52723 ?auto_52724 ?auto_52725 ?auto_52726 )
      ( MAKE-6PILE ?auto_52722 ?auto_52723 ?auto_52724 ?auto_52725 ?auto_52726 ?auto_52727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52735 - BLOCK
      ?auto_52736 - BLOCK
      ?auto_52737 - BLOCK
      ?auto_52738 - BLOCK
      ?auto_52739 - BLOCK
      ?auto_52740 - BLOCK
    )
    :vars
    (
      ?auto_52741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52740 ?auto_52741 ) ( ON-TABLE ?auto_52735 ) ( ON ?auto_52736 ?auto_52735 ) ( ON ?auto_52737 ?auto_52736 ) ( ON ?auto_52738 ?auto_52737 ) ( not ( = ?auto_52735 ?auto_52736 ) ) ( not ( = ?auto_52735 ?auto_52737 ) ) ( not ( = ?auto_52735 ?auto_52738 ) ) ( not ( = ?auto_52735 ?auto_52739 ) ) ( not ( = ?auto_52735 ?auto_52740 ) ) ( not ( = ?auto_52735 ?auto_52741 ) ) ( not ( = ?auto_52736 ?auto_52737 ) ) ( not ( = ?auto_52736 ?auto_52738 ) ) ( not ( = ?auto_52736 ?auto_52739 ) ) ( not ( = ?auto_52736 ?auto_52740 ) ) ( not ( = ?auto_52736 ?auto_52741 ) ) ( not ( = ?auto_52737 ?auto_52738 ) ) ( not ( = ?auto_52737 ?auto_52739 ) ) ( not ( = ?auto_52737 ?auto_52740 ) ) ( not ( = ?auto_52737 ?auto_52741 ) ) ( not ( = ?auto_52738 ?auto_52739 ) ) ( not ( = ?auto_52738 ?auto_52740 ) ) ( not ( = ?auto_52738 ?auto_52741 ) ) ( not ( = ?auto_52739 ?auto_52740 ) ) ( not ( = ?auto_52739 ?auto_52741 ) ) ( not ( = ?auto_52740 ?auto_52741 ) ) ( CLEAR ?auto_52738 ) ( ON ?auto_52739 ?auto_52740 ) ( CLEAR ?auto_52739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52735 ?auto_52736 ?auto_52737 ?auto_52738 ?auto_52739 )
      ( MAKE-6PILE ?auto_52735 ?auto_52736 ?auto_52737 ?auto_52738 ?auto_52739 ?auto_52740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52748 - BLOCK
      ?auto_52749 - BLOCK
      ?auto_52750 - BLOCK
      ?auto_52751 - BLOCK
      ?auto_52752 - BLOCK
      ?auto_52753 - BLOCK
    )
    :vars
    (
      ?auto_52754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52753 ?auto_52754 ) ( ON-TABLE ?auto_52748 ) ( ON ?auto_52749 ?auto_52748 ) ( ON ?auto_52750 ?auto_52749 ) ( not ( = ?auto_52748 ?auto_52749 ) ) ( not ( = ?auto_52748 ?auto_52750 ) ) ( not ( = ?auto_52748 ?auto_52751 ) ) ( not ( = ?auto_52748 ?auto_52752 ) ) ( not ( = ?auto_52748 ?auto_52753 ) ) ( not ( = ?auto_52748 ?auto_52754 ) ) ( not ( = ?auto_52749 ?auto_52750 ) ) ( not ( = ?auto_52749 ?auto_52751 ) ) ( not ( = ?auto_52749 ?auto_52752 ) ) ( not ( = ?auto_52749 ?auto_52753 ) ) ( not ( = ?auto_52749 ?auto_52754 ) ) ( not ( = ?auto_52750 ?auto_52751 ) ) ( not ( = ?auto_52750 ?auto_52752 ) ) ( not ( = ?auto_52750 ?auto_52753 ) ) ( not ( = ?auto_52750 ?auto_52754 ) ) ( not ( = ?auto_52751 ?auto_52752 ) ) ( not ( = ?auto_52751 ?auto_52753 ) ) ( not ( = ?auto_52751 ?auto_52754 ) ) ( not ( = ?auto_52752 ?auto_52753 ) ) ( not ( = ?auto_52752 ?auto_52754 ) ) ( not ( = ?auto_52753 ?auto_52754 ) ) ( ON ?auto_52752 ?auto_52753 ) ( CLEAR ?auto_52750 ) ( ON ?auto_52751 ?auto_52752 ) ( CLEAR ?auto_52751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52748 ?auto_52749 ?auto_52750 ?auto_52751 )
      ( MAKE-6PILE ?auto_52748 ?auto_52749 ?auto_52750 ?auto_52751 ?auto_52752 ?auto_52753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52761 - BLOCK
      ?auto_52762 - BLOCK
      ?auto_52763 - BLOCK
      ?auto_52764 - BLOCK
      ?auto_52765 - BLOCK
      ?auto_52766 - BLOCK
    )
    :vars
    (
      ?auto_52767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52766 ?auto_52767 ) ( ON-TABLE ?auto_52761 ) ( ON ?auto_52762 ?auto_52761 ) ( ON ?auto_52763 ?auto_52762 ) ( not ( = ?auto_52761 ?auto_52762 ) ) ( not ( = ?auto_52761 ?auto_52763 ) ) ( not ( = ?auto_52761 ?auto_52764 ) ) ( not ( = ?auto_52761 ?auto_52765 ) ) ( not ( = ?auto_52761 ?auto_52766 ) ) ( not ( = ?auto_52761 ?auto_52767 ) ) ( not ( = ?auto_52762 ?auto_52763 ) ) ( not ( = ?auto_52762 ?auto_52764 ) ) ( not ( = ?auto_52762 ?auto_52765 ) ) ( not ( = ?auto_52762 ?auto_52766 ) ) ( not ( = ?auto_52762 ?auto_52767 ) ) ( not ( = ?auto_52763 ?auto_52764 ) ) ( not ( = ?auto_52763 ?auto_52765 ) ) ( not ( = ?auto_52763 ?auto_52766 ) ) ( not ( = ?auto_52763 ?auto_52767 ) ) ( not ( = ?auto_52764 ?auto_52765 ) ) ( not ( = ?auto_52764 ?auto_52766 ) ) ( not ( = ?auto_52764 ?auto_52767 ) ) ( not ( = ?auto_52765 ?auto_52766 ) ) ( not ( = ?auto_52765 ?auto_52767 ) ) ( not ( = ?auto_52766 ?auto_52767 ) ) ( ON ?auto_52765 ?auto_52766 ) ( CLEAR ?auto_52763 ) ( ON ?auto_52764 ?auto_52765 ) ( CLEAR ?auto_52764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52761 ?auto_52762 ?auto_52763 ?auto_52764 )
      ( MAKE-6PILE ?auto_52761 ?auto_52762 ?auto_52763 ?auto_52764 ?auto_52765 ?auto_52766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52774 - BLOCK
      ?auto_52775 - BLOCK
      ?auto_52776 - BLOCK
      ?auto_52777 - BLOCK
      ?auto_52778 - BLOCK
      ?auto_52779 - BLOCK
    )
    :vars
    (
      ?auto_52780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52779 ?auto_52780 ) ( ON-TABLE ?auto_52774 ) ( ON ?auto_52775 ?auto_52774 ) ( not ( = ?auto_52774 ?auto_52775 ) ) ( not ( = ?auto_52774 ?auto_52776 ) ) ( not ( = ?auto_52774 ?auto_52777 ) ) ( not ( = ?auto_52774 ?auto_52778 ) ) ( not ( = ?auto_52774 ?auto_52779 ) ) ( not ( = ?auto_52774 ?auto_52780 ) ) ( not ( = ?auto_52775 ?auto_52776 ) ) ( not ( = ?auto_52775 ?auto_52777 ) ) ( not ( = ?auto_52775 ?auto_52778 ) ) ( not ( = ?auto_52775 ?auto_52779 ) ) ( not ( = ?auto_52775 ?auto_52780 ) ) ( not ( = ?auto_52776 ?auto_52777 ) ) ( not ( = ?auto_52776 ?auto_52778 ) ) ( not ( = ?auto_52776 ?auto_52779 ) ) ( not ( = ?auto_52776 ?auto_52780 ) ) ( not ( = ?auto_52777 ?auto_52778 ) ) ( not ( = ?auto_52777 ?auto_52779 ) ) ( not ( = ?auto_52777 ?auto_52780 ) ) ( not ( = ?auto_52778 ?auto_52779 ) ) ( not ( = ?auto_52778 ?auto_52780 ) ) ( not ( = ?auto_52779 ?auto_52780 ) ) ( ON ?auto_52778 ?auto_52779 ) ( ON ?auto_52777 ?auto_52778 ) ( CLEAR ?auto_52775 ) ( ON ?auto_52776 ?auto_52777 ) ( CLEAR ?auto_52776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52774 ?auto_52775 ?auto_52776 )
      ( MAKE-6PILE ?auto_52774 ?auto_52775 ?auto_52776 ?auto_52777 ?auto_52778 ?auto_52779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52787 - BLOCK
      ?auto_52788 - BLOCK
      ?auto_52789 - BLOCK
      ?auto_52790 - BLOCK
      ?auto_52791 - BLOCK
      ?auto_52792 - BLOCK
    )
    :vars
    (
      ?auto_52793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52792 ?auto_52793 ) ( ON-TABLE ?auto_52787 ) ( ON ?auto_52788 ?auto_52787 ) ( not ( = ?auto_52787 ?auto_52788 ) ) ( not ( = ?auto_52787 ?auto_52789 ) ) ( not ( = ?auto_52787 ?auto_52790 ) ) ( not ( = ?auto_52787 ?auto_52791 ) ) ( not ( = ?auto_52787 ?auto_52792 ) ) ( not ( = ?auto_52787 ?auto_52793 ) ) ( not ( = ?auto_52788 ?auto_52789 ) ) ( not ( = ?auto_52788 ?auto_52790 ) ) ( not ( = ?auto_52788 ?auto_52791 ) ) ( not ( = ?auto_52788 ?auto_52792 ) ) ( not ( = ?auto_52788 ?auto_52793 ) ) ( not ( = ?auto_52789 ?auto_52790 ) ) ( not ( = ?auto_52789 ?auto_52791 ) ) ( not ( = ?auto_52789 ?auto_52792 ) ) ( not ( = ?auto_52789 ?auto_52793 ) ) ( not ( = ?auto_52790 ?auto_52791 ) ) ( not ( = ?auto_52790 ?auto_52792 ) ) ( not ( = ?auto_52790 ?auto_52793 ) ) ( not ( = ?auto_52791 ?auto_52792 ) ) ( not ( = ?auto_52791 ?auto_52793 ) ) ( not ( = ?auto_52792 ?auto_52793 ) ) ( ON ?auto_52791 ?auto_52792 ) ( ON ?auto_52790 ?auto_52791 ) ( CLEAR ?auto_52788 ) ( ON ?auto_52789 ?auto_52790 ) ( CLEAR ?auto_52789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52787 ?auto_52788 ?auto_52789 )
      ( MAKE-6PILE ?auto_52787 ?auto_52788 ?auto_52789 ?auto_52790 ?auto_52791 ?auto_52792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52800 - BLOCK
      ?auto_52801 - BLOCK
      ?auto_52802 - BLOCK
      ?auto_52803 - BLOCK
      ?auto_52804 - BLOCK
      ?auto_52805 - BLOCK
    )
    :vars
    (
      ?auto_52806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52805 ?auto_52806 ) ( ON-TABLE ?auto_52800 ) ( not ( = ?auto_52800 ?auto_52801 ) ) ( not ( = ?auto_52800 ?auto_52802 ) ) ( not ( = ?auto_52800 ?auto_52803 ) ) ( not ( = ?auto_52800 ?auto_52804 ) ) ( not ( = ?auto_52800 ?auto_52805 ) ) ( not ( = ?auto_52800 ?auto_52806 ) ) ( not ( = ?auto_52801 ?auto_52802 ) ) ( not ( = ?auto_52801 ?auto_52803 ) ) ( not ( = ?auto_52801 ?auto_52804 ) ) ( not ( = ?auto_52801 ?auto_52805 ) ) ( not ( = ?auto_52801 ?auto_52806 ) ) ( not ( = ?auto_52802 ?auto_52803 ) ) ( not ( = ?auto_52802 ?auto_52804 ) ) ( not ( = ?auto_52802 ?auto_52805 ) ) ( not ( = ?auto_52802 ?auto_52806 ) ) ( not ( = ?auto_52803 ?auto_52804 ) ) ( not ( = ?auto_52803 ?auto_52805 ) ) ( not ( = ?auto_52803 ?auto_52806 ) ) ( not ( = ?auto_52804 ?auto_52805 ) ) ( not ( = ?auto_52804 ?auto_52806 ) ) ( not ( = ?auto_52805 ?auto_52806 ) ) ( ON ?auto_52804 ?auto_52805 ) ( ON ?auto_52803 ?auto_52804 ) ( ON ?auto_52802 ?auto_52803 ) ( CLEAR ?auto_52800 ) ( ON ?auto_52801 ?auto_52802 ) ( CLEAR ?auto_52801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52800 ?auto_52801 )
      ( MAKE-6PILE ?auto_52800 ?auto_52801 ?auto_52802 ?auto_52803 ?auto_52804 ?auto_52805 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52813 - BLOCK
      ?auto_52814 - BLOCK
      ?auto_52815 - BLOCK
      ?auto_52816 - BLOCK
      ?auto_52817 - BLOCK
      ?auto_52818 - BLOCK
    )
    :vars
    (
      ?auto_52819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52818 ?auto_52819 ) ( ON-TABLE ?auto_52813 ) ( not ( = ?auto_52813 ?auto_52814 ) ) ( not ( = ?auto_52813 ?auto_52815 ) ) ( not ( = ?auto_52813 ?auto_52816 ) ) ( not ( = ?auto_52813 ?auto_52817 ) ) ( not ( = ?auto_52813 ?auto_52818 ) ) ( not ( = ?auto_52813 ?auto_52819 ) ) ( not ( = ?auto_52814 ?auto_52815 ) ) ( not ( = ?auto_52814 ?auto_52816 ) ) ( not ( = ?auto_52814 ?auto_52817 ) ) ( not ( = ?auto_52814 ?auto_52818 ) ) ( not ( = ?auto_52814 ?auto_52819 ) ) ( not ( = ?auto_52815 ?auto_52816 ) ) ( not ( = ?auto_52815 ?auto_52817 ) ) ( not ( = ?auto_52815 ?auto_52818 ) ) ( not ( = ?auto_52815 ?auto_52819 ) ) ( not ( = ?auto_52816 ?auto_52817 ) ) ( not ( = ?auto_52816 ?auto_52818 ) ) ( not ( = ?auto_52816 ?auto_52819 ) ) ( not ( = ?auto_52817 ?auto_52818 ) ) ( not ( = ?auto_52817 ?auto_52819 ) ) ( not ( = ?auto_52818 ?auto_52819 ) ) ( ON ?auto_52817 ?auto_52818 ) ( ON ?auto_52816 ?auto_52817 ) ( ON ?auto_52815 ?auto_52816 ) ( CLEAR ?auto_52813 ) ( ON ?auto_52814 ?auto_52815 ) ( CLEAR ?auto_52814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52813 ?auto_52814 )
      ( MAKE-6PILE ?auto_52813 ?auto_52814 ?auto_52815 ?auto_52816 ?auto_52817 ?auto_52818 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52826 - BLOCK
      ?auto_52827 - BLOCK
      ?auto_52828 - BLOCK
      ?auto_52829 - BLOCK
      ?auto_52830 - BLOCK
      ?auto_52831 - BLOCK
    )
    :vars
    (
      ?auto_52832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52831 ?auto_52832 ) ( not ( = ?auto_52826 ?auto_52827 ) ) ( not ( = ?auto_52826 ?auto_52828 ) ) ( not ( = ?auto_52826 ?auto_52829 ) ) ( not ( = ?auto_52826 ?auto_52830 ) ) ( not ( = ?auto_52826 ?auto_52831 ) ) ( not ( = ?auto_52826 ?auto_52832 ) ) ( not ( = ?auto_52827 ?auto_52828 ) ) ( not ( = ?auto_52827 ?auto_52829 ) ) ( not ( = ?auto_52827 ?auto_52830 ) ) ( not ( = ?auto_52827 ?auto_52831 ) ) ( not ( = ?auto_52827 ?auto_52832 ) ) ( not ( = ?auto_52828 ?auto_52829 ) ) ( not ( = ?auto_52828 ?auto_52830 ) ) ( not ( = ?auto_52828 ?auto_52831 ) ) ( not ( = ?auto_52828 ?auto_52832 ) ) ( not ( = ?auto_52829 ?auto_52830 ) ) ( not ( = ?auto_52829 ?auto_52831 ) ) ( not ( = ?auto_52829 ?auto_52832 ) ) ( not ( = ?auto_52830 ?auto_52831 ) ) ( not ( = ?auto_52830 ?auto_52832 ) ) ( not ( = ?auto_52831 ?auto_52832 ) ) ( ON ?auto_52830 ?auto_52831 ) ( ON ?auto_52829 ?auto_52830 ) ( ON ?auto_52828 ?auto_52829 ) ( ON ?auto_52827 ?auto_52828 ) ( ON ?auto_52826 ?auto_52827 ) ( CLEAR ?auto_52826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52826 )
      ( MAKE-6PILE ?auto_52826 ?auto_52827 ?auto_52828 ?auto_52829 ?auto_52830 ?auto_52831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52839 - BLOCK
      ?auto_52840 - BLOCK
      ?auto_52841 - BLOCK
      ?auto_52842 - BLOCK
      ?auto_52843 - BLOCK
      ?auto_52844 - BLOCK
    )
    :vars
    (
      ?auto_52845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52844 ?auto_52845 ) ( not ( = ?auto_52839 ?auto_52840 ) ) ( not ( = ?auto_52839 ?auto_52841 ) ) ( not ( = ?auto_52839 ?auto_52842 ) ) ( not ( = ?auto_52839 ?auto_52843 ) ) ( not ( = ?auto_52839 ?auto_52844 ) ) ( not ( = ?auto_52839 ?auto_52845 ) ) ( not ( = ?auto_52840 ?auto_52841 ) ) ( not ( = ?auto_52840 ?auto_52842 ) ) ( not ( = ?auto_52840 ?auto_52843 ) ) ( not ( = ?auto_52840 ?auto_52844 ) ) ( not ( = ?auto_52840 ?auto_52845 ) ) ( not ( = ?auto_52841 ?auto_52842 ) ) ( not ( = ?auto_52841 ?auto_52843 ) ) ( not ( = ?auto_52841 ?auto_52844 ) ) ( not ( = ?auto_52841 ?auto_52845 ) ) ( not ( = ?auto_52842 ?auto_52843 ) ) ( not ( = ?auto_52842 ?auto_52844 ) ) ( not ( = ?auto_52842 ?auto_52845 ) ) ( not ( = ?auto_52843 ?auto_52844 ) ) ( not ( = ?auto_52843 ?auto_52845 ) ) ( not ( = ?auto_52844 ?auto_52845 ) ) ( ON ?auto_52843 ?auto_52844 ) ( ON ?auto_52842 ?auto_52843 ) ( ON ?auto_52841 ?auto_52842 ) ( ON ?auto_52840 ?auto_52841 ) ( ON ?auto_52839 ?auto_52840 ) ( CLEAR ?auto_52839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52839 )
      ( MAKE-6PILE ?auto_52839 ?auto_52840 ?auto_52841 ?auto_52842 ?auto_52843 ?auto_52844 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52853 - BLOCK
      ?auto_52854 - BLOCK
      ?auto_52855 - BLOCK
      ?auto_52856 - BLOCK
      ?auto_52857 - BLOCK
      ?auto_52858 - BLOCK
      ?auto_52859 - BLOCK
    )
    :vars
    (
      ?auto_52860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52858 ) ( ON ?auto_52859 ?auto_52860 ) ( CLEAR ?auto_52859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52853 ) ( ON ?auto_52854 ?auto_52853 ) ( ON ?auto_52855 ?auto_52854 ) ( ON ?auto_52856 ?auto_52855 ) ( ON ?auto_52857 ?auto_52856 ) ( ON ?auto_52858 ?auto_52857 ) ( not ( = ?auto_52853 ?auto_52854 ) ) ( not ( = ?auto_52853 ?auto_52855 ) ) ( not ( = ?auto_52853 ?auto_52856 ) ) ( not ( = ?auto_52853 ?auto_52857 ) ) ( not ( = ?auto_52853 ?auto_52858 ) ) ( not ( = ?auto_52853 ?auto_52859 ) ) ( not ( = ?auto_52853 ?auto_52860 ) ) ( not ( = ?auto_52854 ?auto_52855 ) ) ( not ( = ?auto_52854 ?auto_52856 ) ) ( not ( = ?auto_52854 ?auto_52857 ) ) ( not ( = ?auto_52854 ?auto_52858 ) ) ( not ( = ?auto_52854 ?auto_52859 ) ) ( not ( = ?auto_52854 ?auto_52860 ) ) ( not ( = ?auto_52855 ?auto_52856 ) ) ( not ( = ?auto_52855 ?auto_52857 ) ) ( not ( = ?auto_52855 ?auto_52858 ) ) ( not ( = ?auto_52855 ?auto_52859 ) ) ( not ( = ?auto_52855 ?auto_52860 ) ) ( not ( = ?auto_52856 ?auto_52857 ) ) ( not ( = ?auto_52856 ?auto_52858 ) ) ( not ( = ?auto_52856 ?auto_52859 ) ) ( not ( = ?auto_52856 ?auto_52860 ) ) ( not ( = ?auto_52857 ?auto_52858 ) ) ( not ( = ?auto_52857 ?auto_52859 ) ) ( not ( = ?auto_52857 ?auto_52860 ) ) ( not ( = ?auto_52858 ?auto_52859 ) ) ( not ( = ?auto_52858 ?auto_52860 ) ) ( not ( = ?auto_52859 ?auto_52860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52859 ?auto_52860 )
      ( !STACK ?auto_52859 ?auto_52858 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52868 - BLOCK
      ?auto_52869 - BLOCK
      ?auto_52870 - BLOCK
      ?auto_52871 - BLOCK
      ?auto_52872 - BLOCK
      ?auto_52873 - BLOCK
      ?auto_52874 - BLOCK
    )
    :vars
    (
      ?auto_52875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52873 ) ( ON ?auto_52874 ?auto_52875 ) ( CLEAR ?auto_52874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52868 ) ( ON ?auto_52869 ?auto_52868 ) ( ON ?auto_52870 ?auto_52869 ) ( ON ?auto_52871 ?auto_52870 ) ( ON ?auto_52872 ?auto_52871 ) ( ON ?auto_52873 ?auto_52872 ) ( not ( = ?auto_52868 ?auto_52869 ) ) ( not ( = ?auto_52868 ?auto_52870 ) ) ( not ( = ?auto_52868 ?auto_52871 ) ) ( not ( = ?auto_52868 ?auto_52872 ) ) ( not ( = ?auto_52868 ?auto_52873 ) ) ( not ( = ?auto_52868 ?auto_52874 ) ) ( not ( = ?auto_52868 ?auto_52875 ) ) ( not ( = ?auto_52869 ?auto_52870 ) ) ( not ( = ?auto_52869 ?auto_52871 ) ) ( not ( = ?auto_52869 ?auto_52872 ) ) ( not ( = ?auto_52869 ?auto_52873 ) ) ( not ( = ?auto_52869 ?auto_52874 ) ) ( not ( = ?auto_52869 ?auto_52875 ) ) ( not ( = ?auto_52870 ?auto_52871 ) ) ( not ( = ?auto_52870 ?auto_52872 ) ) ( not ( = ?auto_52870 ?auto_52873 ) ) ( not ( = ?auto_52870 ?auto_52874 ) ) ( not ( = ?auto_52870 ?auto_52875 ) ) ( not ( = ?auto_52871 ?auto_52872 ) ) ( not ( = ?auto_52871 ?auto_52873 ) ) ( not ( = ?auto_52871 ?auto_52874 ) ) ( not ( = ?auto_52871 ?auto_52875 ) ) ( not ( = ?auto_52872 ?auto_52873 ) ) ( not ( = ?auto_52872 ?auto_52874 ) ) ( not ( = ?auto_52872 ?auto_52875 ) ) ( not ( = ?auto_52873 ?auto_52874 ) ) ( not ( = ?auto_52873 ?auto_52875 ) ) ( not ( = ?auto_52874 ?auto_52875 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52874 ?auto_52875 )
      ( !STACK ?auto_52874 ?auto_52873 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52883 - BLOCK
      ?auto_52884 - BLOCK
      ?auto_52885 - BLOCK
      ?auto_52886 - BLOCK
      ?auto_52887 - BLOCK
      ?auto_52888 - BLOCK
      ?auto_52889 - BLOCK
    )
    :vars
    (
      ?auto_52890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52889 ?auto_52890 ) ( ON-TABLE ?auto_52883 ) ( ON ?auto_52884 ?auto_52883 ) ( ON ?auto_52885 ?auto_52884 ) ( ON ?auto_52886 ?auto_52885 ) ( ON ?auto_52887 ?auto_52886 ) ( not ( = ?auto_52883 ?auto_52884 ) ) ( not ( = ?auto_52883 ?auto_52885 ) ) ( not ( = ?auto_52883 ?auto_52886 ) ) ( not ( = ?auto_52883 ?auto_52887 ) ) ( not ( = ?auto_52883 ?auto_52888 ) ) ( not ( = ?auto_52883 ?auto_52889 ) ) ( not ( = ?auto_52883 ?auto_52890 ) ) ( not ( = ?auto_52884 ?auto_52885 ) ) ( not ( = ?auto_52884 ?auto_52886 ) ) ( not ( = ?auto_52884 ?auto_52887 ) ) ( not ( = ?auto_52884 ?auto_52888 ) ) ( not ( = ?auto_52884 ?auto_52889 ) ) ( not ( = ?auto_52884 ?auto_52890 ) ) ( not ( = ?auto_52885 ?auto_52886 ) ) ( not ( = ?auto_52885 ?auto_52887 ) ) ( not ( = ?auto_52885 ?auto_52888 ) ) ( not ( = ?auto_52885 ?auto_52889 ) ) ( not ( = ?auto_52885 ?auto_52890 ) ) ( not ( = ?auto_52886 ?auto_52887 ) ) ( not ( = ?auto_52886 ?auto_52888 ) ) ( not ( = ?auto_52886 ?auto_52889 ) ) ( not ( = ?auto_52886 ?auto_52890 ) ) ( not ( = ?auto_52887 ?auto_52888 ) ) ( not ( = ?auto_52887 ?auto_52889 ) ) ( not ( = ?auto_52887 ?auto_52890 ) ) ( not ( = ?auto_52888 ?auto_52889 ) ) ( not ( = ?auto_52888 ?auto_52890 ) ) ( not ( = ?auto_52889 ?auto_52890 ) ) ( CLEAR ?auto_52887 ) ( ON ?auto_52888 ?auto_52889 ) ( CLEAR ?auto_52888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52883 ?auto_52884 ?auto_52885 ?auto_52886 ?auto_52887 ?auto_52888 )
      ( MAKE-7PILE ?auto_52883 ?auto_52884 ?auto_52885 ?auto_52886 ?auto_52887 ?auto_52888 ?auto_52889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52898 - BLOCK
      ?auto_52899 - BLOCK
      ?auto_52900 - BLOCK
      ?auto_52901 - BLOCK
      ?auto_52902 - BLOCK
      ?auto_52903 - BLOCK
      ?auto_52904 - BLOCK
    )
    :vars
    (
      ?auto_52905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52904 ?auto_52905 ) ( ON-TABLE ?auto_52898 ) ( ON ?auto_52899 ?auto_52898 ) ( ON ?auto_52900 ?auto_52899 ) ( ON ?auto_52901 ?auto_52900 ) ( ON ?auto_52902 ?auto_52901 ) ( not ( = ?auto_52898 ?auto_52899 ) ) ( not ( = ?auto_52898 ?auto_52900 ) ) ( not ( = ?auto_52898 ?auto_52901 ) ) ( not ( = ?auto_52898 ?auto_52902 ) ) ( not ( = ?auto_52898 ?auto_52903 ) ) ( not ( = ?auto_52898 ?auto_52904 ) ) ( not ( = ?auto_52898 ?auto_52905 ) ) ( not ( = ?auto_52899 ?auto_52900 ) ) ( not ( = ?auto_52899 ?auto_52901 ) ) ( not ( = ?auto_52899 ?auto_52902 ) ) ( not ( = ?auto_52899 ?auto_52903 ) ) ( not ( = ?auto_52899 ?auto_52904 ) ) ( not ( = ?auto_52899 ?auto_52905 ) ) ( not ( = ?auto_52900 ?auto_52901 ) ) ( not ( = ?auto_52900 ?auto_52902 ) ) ( not ( = ?auto_52900 ?auto_52903 ) ) ( not ( = ?auto_52900 ?auto_52904 ) ) ( not ( = ?auto_52900 ?auto_52905 ) ) ( not ( = ?auto_52901 ?auto_52902 ) ) ( not ( = ?auto_52901 ?auto_52903 ) ) ( not ( = ?auto_52901 ?auto_52904 ) ) ( not ( = ?auto_52901 ?auto_52905 ) ) ( not ( = ?auto_52902 ?auto_52903 ) ) ( not ( = ?auto_52902 ?auto_52904 ) ) ( not ( = ?auto_52902 ?auto_52905 ) ) ( not ( = ?auto_52903 ?auto_52904 ) ) ( not ( = ?auto_52903 ?auto_52905 ) ) ( not ( = ?auto_52904 ?auto_52905 ) ) ( CLEAR ?auto_52902 ) ( ON ?auto_52903 ?auto_52904 ) ( CLEAR ?auto_52903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52898 ?auto_52899 ?auto_52900 ?auto_52901 ?auto_52902 ?auto_52903 )
      ( MAKE-7PILE ?auto_52898 ?auto_52899 ?auto_52900 ?auto_52901 ?auto_52902 ?auto_52903 ?auto_52904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52913 - BLOCK
      ?auto_52914 - BLOCK
      ?auto_52915 - BLOCK
      ?auto_52916 - BLOCK
      ?auto_52917 - BLOCK
      ?auto_52918 - BLOCK
      ?auto_52919 - BLOCK
    )
    :vars
    (
      ?auto_52920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52919 ?auto_52920 ) ( ON-TABLE ?auto_52913 ) ( ON ?auto_52914 ?auto_52913 ) ( ON ?auto_52915 ?auto_52914 ) ( ON ?auto_52916 ?auto_52915 ) ( not ( = ?auto_52913 ?auto_52914 ) ) ( not ( = ?auto_52913 ?auto_52915 ) ) ( not ( = ?auto_52913 ?auto_52916 ) ) ( not ( = ?auto_52913 ?auto_52917 ) ) ( not ( = ?auto_52913 ?auto_52918 ) ) ( not ( = ?auto_52913 ?auto_52919 ) ) ( not ( = ?auto_52913 ?auto_52920 ) ) ( not ( = ?auto_52914 ?auto_52915 ) ) ( not ( = ?auto_52914 ?auto_52916 ) ) ( not ( = ?auto_52914 ?auto_52917 ) ) ( not ( = ?auto_52914 ?auto_52918 ) ) ( not ( = ?auto_52914 ?auto_52919 ) ) ( not ( = ?auto_52914 ?auto_52920 ) ) ( not ( = ?auto_52915 ?auto_52916 ) ) ( not ( = ?auto_52915 ?auto_52917 ) ) ( not ( = ?auto_52915 ?auto_52918 ) ) ( not ( = ?auto_52915 ?auto_52919 ) ) ( not ( = ?auto_52915 ?auto_52920 ) ) ( not ( = ?auto_52916 ?auto_52917 ) ) ( not ( = ?auto_52916 ?auto_52918 ) ) ( not ( = ?auto_52916 ?auto_52919 ) ) ( not ( = ?auto_52916 ?auto_52920 ) ) ( not ( = ?auto_52917 ?auto_52918 ) ) ( not ( = ?auto_52917 ?auto_52919 ) ) ( not ( = ?auto_52917 ?auto_52920 ) ) ( not ( = ?auto_52918 ?auto_52919 ) ) ( not ( = ?auto_52918 ?auto_52920 ) ) ( not ( = ?auto_52919 ?auto_52920 ) ) ( ON ?auto_52918 ?auto_52919 ) ( CLEAR ?auto_52916 ) ( ON ?auto_52917 ?auto_52918 ) ( CLEAR ?auto_52917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52913 ?auto_52914 ?auto_52915 ?auto_52916 ?auto_52917 )
      ( MAKE-7PILE ?auto_52913 ?auto_52914 ?auto_52915 ?auto_52916 ?auto_52917 ?auto_52918 ?auto_52919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52928 - BLOCK
      ?auto_52929 - BLOCK
      ?auto_52930 - BLOCK
      ?auto_52931 - BLOCK
      ?auto_52932 - BLOCK
      ?auto_52933 - BLOCK
      ?auto_52934 - BLOCK
    )
    :vars
    (
      ?auto_52935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52934 ?auto_52935 ) ( ON-TABLE ?auto_52928 ) ( ON ?auto_52929 ?auto_52928 ) ( ON ?auto_52930 ?auto_52929 ) ( ON ?auto_52931 ?auto_52930 ) ( not ( = ?auto_52928 ?auto_52929 ) ) ( not ( = ?auto_52928 ?auto_52930 ) ) ( not ( = ?auto_52928 ?auto_52931 ) ) ( not ( = ?auto_52928 ?auto_52932 ) ) ( not ( = ?auto_52928 ?auto_52933 ) ) ( not ( = ?auto_52928 ?auto_52934 ) ) ( not ( = ?auto_52928 ?auto_52935 ) ) ( not ( = ?auto_52929 ?auto_52930 ) ) ( not ( = ?auto_52929 ?auto_52931 ) ) ( not ( = ?auto_52929 ?auto_52932 ) ) ( not ( = ?auto_52929 ?auto_52933 ) ) ( not ( = ?auto_52929 ?auto_52934 ) ) ( not ( = ?auto_52929 ?auto_52935 ) ) ( not ( = ?auto_52930 ?auto_52931 ) ) ( not ( = ?auto_52930 ?auto_52932 ) ) ( not ( = ?auto_52930 ?auto_52933 ) ) ( not ( = ?auto_52930 ?auto_52934 ) ) ( not ( = ?auto_52930 ?auto_52935 ) ) ( not ( = ?auto_52931 ?auto_52932 ) ) ( not ( = ?auto_52931 ?auto_52933 ) ) ( not ( = ?auto_52931 ?auto_52934 ) ) ( not ( = ?auto_52931 ?auto_52935 ) ) ( not ( = ?auto_52932 ?auto_52933 ) ) ( not ( = ?auto_52932 ?auto_52934 ) ) ( not ( = ?auto_52932 ?auto_52935 ) ) ( not ( = ?auto_52933 ?auto_52934 ) ) ( not ( = ?auto_52933 ?auto_52935 ) ) ( not ( = ?auto_52934 ?auto_52935 ) ) ( ON ?auto_52933 ?auto_52934 ) ( CLEAR ?auto_52931 ) ( ON ?auto_52932 ?auto_52933 ) ( CLEAR ?auto_52932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52928 ?auto_52929 ?auto_52930 ?auto_52931 ?auto_52932 )
      ( MAKE-7PILE ?auto_52928 ?auto_52929 ?auto_52930 ?auto_52931 ?auto_52932 ?auto_52933 ?auto_52934 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52943 - BLOCK
      ?auto_52944 - BLOCK
      ?auto_52945 - BLOCK
      ?auto_52946 - BLOCK
      ?auto_52947 - BLOCK
      ?auto_52948 - BLOCK
      ?auto_52949 - BLOCK
    )
    :vars
    (
      ?auto_52950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52949 ?auto_52950 ) ( ON-TABLE ?auto_52943 ) ( ON ?auto_52944 ?auto_52943 ) ( ON ?auto_52945 ?auto_52944 ) ( not ( = ?auto_52943 ?auto_52944 ) ) ( not ( = ?auto_52943 ?auto_52945 ) ) ( not ( = ?auto_52943 ?auto_52946 ) ) ( not ( = ?auto_52943 ?auto_52947 ) ) ( not ( = ?auto_52943 ?auto_52948 ) ) ( not ( = ?auto_52943 ?auto_52949 ) ) ( not ( = ?auto_52943 ?auto_52950 ) ) ( not ( = ?auto_52944 ?auto_52945 ) ) ( not ( = ?auto_52944 ?auto_52946 ) ) ( not ( = ?auto_52944 ?auto_52947 ) ) ( not ( = ?auto_52944 ?auto_52948 ) ) ( not ( = ?auto_52944 ?auto_52949 ) ) ( not ( = ?auto_52944 ?auto_52950 ) ) ( not ( = ?auto_52945 ?auto_52946 ) ) ( not ( = ?auto_52945 ?auto_52947 ) ) ( not ( = ?auto_52945 ?auto_52948 ) ) ( not ( = ?auto_52945 ?auto_52949 ) ) ( not ( = ?auto_52945 ?auto_52950 ) ) ( not ( = ?auto_52946 ?auto_52947 ) ) ( not ( = ?auto_52946 ?auto_52948 ) ) ( not ( = ?auto_52946 ?auto_52949 ) ) ( not ( = ?auto_52946 ?auto_52950 ) ) ( not ( = ?auto_52947 ?auto_52948 ) ) ( not ( = ?auto_52947 ?auto_52949 ) ) ( not ( = ?auto_52947 ?auto_52950 ) ) ( not ( = ?auto_52948 ?auto_52949 ) ) ( not ( = ?auto_52948 ?auto_52950 ) ) ( not ( = ?auto_52949 ?auto_52950 ) ) ( ON ?auto_52948 ?auto_52949 ) ( ON ?auto_52947 ?auto_52948 ) ( CLEAR ?auto_52945 ) ( ON ?auto_52946 ?auto_52947 ) ( CLEAR ?auto_52946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52943 ?auto_52944 ?auto_52945 ?auto_52946 )
      ( MAKE-7PILE ?auto_52943 ?auto_52944 ?auto_52945 ?auto_52946 ?auto_52947 ?auto_52948 ?auto_52949 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52958 - BLOCK
      ?auto_52959 - BLOCK
      ?auto_52960 - BLOCK
      ?auto_52961 - BLOCK
      ?auto_52962 - BLOCK
      ?auto_52963 - BLOCK
      ?auto_52964 - BLOCK
    )
    :vars
    (
      ?auto_52965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52964 ?auto_52965 ) ( ON-TABLE ?auto_52958 ) ( ON ?auto_52959 ?auto_52958 ) ( ON ?auto_52960 ?auto_52959 ) ( not ( = ?auto_52958 ?auto_52959 ) ) ( not ( = ?auto_52958 ?auto_52960 ) ) ( not ( = ?auto_52958 ?auto_52961 ) ) ( not ( = ?auto_52958 ?auto_52962 ) ) ( not ( = ?auto_52958 ?auto_52963 ) ) ( not ( = ?auto_52958 ?auto_52964 ) ) ( not ( = ?auto_52958 ?auto_52965 ) ) ( not ( = ?auto_52959 ?auto_52960 ) ) ( not ( = ?auto_52959 ?auto_52961 ) ) ( not ( = ?auto_52959 ?auto_52962 ) ) ( not ( = ?auto_52959 ?auto_52963 ) ) ( not ( = ?auto_52959 ?auto_52964 ) ) ( not ( = ?auto_52959 ?auto_52965 ) ) ( not ( = ?auto_52960 ?auto_52961 ) ) ( not ( = ?auto_52960 ?auto_52962 ) ) ( not ( = ?auto_52960 ?auto_52963 ) ) ( not ( = ?auto_52960 ?auto_52964 ) ) ( not ( = ?auto_52960 ?auto_52965 ) ) ( not ( = ?auto_52961 ?auto_52962 ) ) ( not ( = ?auto_52961 ?auto_52963 ) ) ( not ( = ?auto_52961 ?auto_52964 ) ) ( not ( = ?auto_52961 ?auto_52965 ) ) ( not ( = ?auto_52962 ?auto_52963 ) ) ( not ( = ?auto_52962 ?auto_52964 ) ) ( not ( = ?auto_52962 ?auto_52965 ) ) ( not ( = ?auto_52963 ?auto_52964 ) ) ( not ( = ?auto_52963 ?auto_52965 ) ) ( not ( = ?auto_52964 ?auto_52965 ) ) ( ON ?auto_52963 ?auto_52964 ) ( ON ?auto_52962 ?auto_52963 ) ( CLEAR ?auto_52960 ) ( ON ?auto_52961 ?auto_52962 ) ( CLEAR ?auto_52961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52958 ?auto_52959 ?auto_52960 ?auto_52961 )
      ( MAKE-7PILE ?auto_52958 ?auto_52959 ?auto_52960 ?auto_52961 ?auto_52962 ?auto_52963 ?auto_52964 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52973 - BLOCK
      ?auto_52974 - BLOCK
      ?auto_52975 - BLOCK
      ?auto_52976 - BLOCK
      ?auto_52977 - BLOCK
      ?auto_52978 - BLOCK
      ?auto_52979 - BLOCK
    )
    :vars
    (
      ?auto_52980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52979 ?auto_52980 ) ( ON-TABLE ?auto_52973 ) ( ON ?auto_52974 ?auto_52973 ) ( not ( = ?auto_52973 ?auto_52974 ) ) ( not ( = ?auto_52973 ?auto_52975 ) ) ( not ( = ?auto_52973 ?auto_52976 ) ) ( not ( = ?auto_52973 ?auto_52977 ) ) ( not ( = ?auto_52973 ?auto_52978 ) ) ( not ( = ?auto_52973 ?auto_52979 ) ) ( not ( = ?auto_52973 ?auto_52980 ) ) ( not ( = ?auto_52974 ?auto_52975 ) ) ( not ( = ?auto_52974 ?auto_52976 ) ) ( not ( = ?auto_52974 ?auto_52977 ) ) ( not ( = ?auto_52974 ?auto_52978 ) ) ( not ( = ?auto_52974 ?auto_52979 ) ) ( not ( = ?auto_52974 ?auto_52980 ) ) ( not ( = ?auto_52975 ?auto_52976 ) ) ( not ( = ?auto_52975 ?auto_52977 ) ) ( not ( = ?auto_52975 ?auto_52978 ) ) ( not ( = ?auto_52975 ?auto_52979 ) ) ( not ( = ?auto_52975 ?auto_52980 ) ) ( not ( = ?auto_52976 ?auto_52977 ) ) ( not ( = ?auto_52976 ?auto_52978 ) ) ( not ( = ?auto_52976 ?auto_52979 ) ) ( not ( = ?auto_52976 ?auto_52980 ) ) ( not ( = ?auto_52977 ?auto_52978 ) ) ( not ( = ?auto_52977 ?auto_52979 ) ) ( not ( = ?auto_52977 ?auto_52980 ) ) ( not ( = ?auto_52978 ?auto_52979 ) ) ( not ( = ?auto_52978 ?auto_52980 ) ) ( not ( = ?auto_52979 ?auto_52980 ) ) ( ON ?auto_52978 ?auto_52979 ) ( ON ?auto_52977 ?auto_52978 ) ( ON ?auto_52976 ?auto_52977 ) ( CLEAR ?auto_52974 ) ( ON ?auto_52975 ?auto_52976 ) ( CLEAR ?auto_52975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52973 ?auto_52974 ?auto_52975 )
      ( MAKE-7PILE ?auto_52973 ?auto_52974 ?auto_52975 ?auto_52976 ?auto_52977 ?auto_52978 ?auto_52979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_52988 - BLOCK
      ?auto_52989 - BLOCK
      ?auto_52990 - BLOCK
      ?auto_52991 - BLOCK
      ?auto_52992 - BLOCK
      ?auto_52993 - BLOCK
      ?auto_52994 - BLOCK
    )
    :vars
    (
      ?auto_52995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52994 ?auto_52995 ) ( ON-TABLE ?auto_52988 ) ( ON ?auto_52989 ?auto_52988 ) ( not ( = ?auto_52988 ?auto_52989 ) ) ( not ( = ?auto_52988 ?auto_52990 ) ) ( not ( = ?auto_52988 ?auto_52991 ) ) ( not ( = ?auto_52988 ?auto_52992 ) ) ( not ( = ?auto_52988 ?auto_52993 ) ) ( not ( = ?auto_52988 ?auto_52994 ) ) ( not ( = ?auto_52988 ?auto_52995 ) ) ( not ( = ?auto_52989 ?auto_52990 ) ) ( not ( = ?auto_52989 ?auto_52991 ) ) ( not ( = ?auto_52989 ?auto_52992 ) ) ( not ( = ?auto_52989 ?auto_52993 ) ) ( not ( = ?auto_52989 ?auto_52994 ) ) ( not ( = ?auto_52989 ?auto_52995 ) ) ( not ( = ?auto_52990 ?auto_52991 ) ) ( not ( = ?auto_52990 ?auto_52992 ) ) ( not ( = ?auto_52990 ?auto_52993 ) ) ( not ( = ?auto_52990 ?auto_52994 ) ) ( not ( = ?auto_52990 ?auto_52995 ) ) ( not ( = ?auto_52991 ?auto_52992 ) ) ( not ( = ?auto_52991 ?auto_52993 ) ) ( not ( = ?auto_52991 ?auto_52994 ) ) ( not ( = ?auto_52991 ?auto_52995 ) ) ( not ( = ?auto_52992 ?auto_52993 ) ) ( not ( = ?auto_52992 ?auto_52994 ) ) ( not ( = ?auto_52992 ?auto_52995 ) ) ( not ( = ?auto_52993 ?auto_52994 ) ) ( not ( = ?auto_52993 ?auto_52995 ) ) ( not ( = ?auto_52994 ?auto_52995 ) ) ( ON ?auto_52993 ?auto_52994 ) ( ON ?auto_52992 ?auto_52993 ) ( ON ?auto_52991 ?auto_52992 ) ( CLEAR ?auto_52989 ) ( ON ?auto_52990 ?auto_52991 ) ( CLEAR ?auto_52990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52988 ?auto_52989 ?auto_52990 )
      ( MAKE-7PILE ?auto_52988 ?auto_52989 ?auto_52990 ?auto_52991 ?auto_52992 ?auto_52993 ?auto_52994 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_53003 - BLOCK
      ?auto_53004 - BLOCK
      ?auto_53005 - BLOCK
      ?auto_53006 - BLOCK
      ?auto_53007 - BLOCK
      ?auto_53008 - BLOCK
      ?auto_53009 - BLOCK
    )
    :vars
    (
      ?auto_53010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53009 ?auto_53010 ) ( ON-TABLE ?auto_53003 ) ( not ( = ?auto_53003 ?auto_53004 ) ) ( not ( = ?auto_53003 ?auto_53005 ) ) ( not ( = ?auto_53003 ?auto_53006 ) ) ( not ( = ?auto_53003 ?auto_53007 ) ) ( not ( = ?auto_53003 ?auto_53008 ) ) ( not ( = ?auto_53003 ?auto_53009 ) ) ( not ( = ?auto_53003 ?auto_53010 ) ) ( not ( = ?auto_53004 ?auto_53005 ) ) ( not ( = ?auto_53004 ?auto_53006 ) ) ( not ( = ?auto_53004 ?auto_53007 ) ) ( not ( = ?auto_53004 ?auto_53008 ) ) ( not ( = ?auto_53004 ?auto_53009 ) ) ( not ( = ?auto_53004 ?auto_53010 ) ) ( not ( = ?auto_53005 ?auto_53006 ) ) ( not ( = ?auto_53005 ?auto_53007 ) ) ( not ( = ?auto_53005 ?auto_53008 ) ) ( not ( = ?auto_53005 ?auto_53009 ) ) ( not ( = ?auto_53005 ?auto_53010 ) ) ( not ( = ?auto_53006 ?auto_53007 ) ) ( not ( = ?auto_53006 ?auto_53008 ) ) ( not ( = ?auto_53006 ?auto_53009 ) ) ( not ( = ?auto_53006 ?auto_53010 ) ) ( not ( = ?auto_53007 ?auto_53008 ) ) ( not ( = ?auto_53007 ?auto_53009 ) ) ( not ( = ?auto_53007 ?auto_53010 ) ) ( not ( = ?auto_53008 ?auto_53009 ) ) ( not ( = ?auto_53008 ?auto_53010 ) ) ( not ( = ?auto_53009 ?auto_53010 ) ) ( ON ?auto_53008 ?auto_53009 ) ( ON ?auto_53007 ?auto_53008 ) ( ON ?auto_53006 ?auto_53007 ) ( ON ?auto_53005 ?auto_53006 ) ( CLEAR ?auto_53003 ) ( ON ?auto_53004 ?auto_53005 ) ( CLEAR ?auto_53004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53003 ?auto_53004 )
      ( MAKE-7PILE ?auto_53003 ?auto_53004 ?auto_53005 ?auto_53006 ?auto_53007 ?auto_53008 ?auto_53009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_53018 - BLOCK
      ?auto_53019 - BLOCK
      ?auto_53020 - BLOCK
      ?auto_53021 - BLOCK
      ?auto_53022 - BLOCK
      ?auto_53023 - BLOCK
      ?auto_53024 - BLOCK
    )
    :vars
    (
      ?auto_53025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53024 ?auto_53025 ) ( ON-TABLE ?auto_53018 ) ( not ( = ?auto_53018 ?auto_53019 ) ) ( not ( = ?auto_53018 ?auto_53020 ) ) ( not ( = ?auto_53018 ?auto_53021 ) ) ( not ( = ?auto_53018 ?auto_53022 ) ) ( not ( = ?auto_53018 ?auto_53023 ) ) ( not ( = ?auto_53018 ?auto_53024 ) ) ( not ( = ?auto_53018 ?auto_53025 ) ) ( not ( = ?auto_53019 ?auto_53020 ) ) ( not ( = ?auto_53019 ?auto_53021 ) ) ( not ( = ?auto_53019 ?auto_53022 ) ) ( not ( = ?auto_53019 ?auto_53023 ) ) ( not ( = ?auto_53019 ?auto_53024 ) ) ( not ( = ?auto_53019 ?auto_53025 ) ) ( not ( = ?auto_53020 ?auto_53021 ) ) ( not ( = ?auto_53020 ?auto_53022 ) ) ( not ( = ?auto_53020 ?auto_53023 ) ) ( not ( = ?auto_53020 ?auto_53024 ) ) ( not ( = ?auto_53020 ?auto_53025 ) ) ( not ( = ?auto_53021 ?auto_53022 ) ) ( not ( = ?auto_53021 ?auto_53023 ) ) ( not ( = ?auto_53021 ?auto_53024 ) ) ( not ( = ?auto_53021 ?auto_53025 ) ) ( not ( = ?auto_53022 ?auto_53023 ) ) ( not ( = ?auto_53022 ?auto_53024 ) ) ( not ( = ?auto_53022 ?auto_53025 ) ) ( not ( = ?auto_53023 ?auto_53024 ) ) ( not ( = ?auto_53023 ?auto_53025 ) ) ( not ( = ?auto_53024 ?auto_53025 ) ) ( ON ?auto_53023 ?auto_53024 ) ( ON ?auto_53022 ?auto_53023 ) ( ON ?auto_53021 ?auto_53022 ) ( ON ?auto_53020 ?auto_53021 ) ( CLEAR ?auto_53018 ) ( ON ?auto_53019 ?auto_53020 ) ( CLEAR ?auto_53019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53018 ?auto_53019 )
      ( MAKE-7PILE ?auto_53018 ?auto_53019 ?auto_53020 ?auto_53021 ?auto_53022 ?auto_53023 ?auto_53024 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_53033 - BLOCK
      ?auto_53034 - BLOCK
      ?auto_53035 - BLOCK
      ?auto_53036 - BLOCK
      ?auto_53037 - BLOCK
      ?auto_53038 - BLOCK
      ?auto_53039 - BLOCK
    )
    :vars
    (
      ?auto_53040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53039 ?auto_53040 ) ( not ( = ?auto_53033 ?auto_53034 ) ) ( not ( = ?auto_53033 ?auto_53035 ) ) ( not ( = ?auto_53033 ?auto_53036 ) ) ( not ( = ?auto_53033 ?auto_53037 ) ) ( not ( = ?auto_53033 ?auto_53038 ) ) ( not ( = ?auto_53033 ?auto_53039 ) ) ( not ( = ?auto_53033 ?auto_53040 ) ) ( not ( = ?auto_53034 ?auto_53035 ) ) ( not ( = ?auto_53034 ?auto_53036 ) ) ( not ( = ?auto_53034 ?auto_53037 ) ) ( not ( = ?auto_53034 ?auto_53038 ) ) ( not ( = ?auto_53034 ?auto_53039 ) ) ( not ( = ?auto_53034 ?auto_53040 ) ) ( not ( = ?auto_53035 ?auto_53036 ) ) ( not ( = ?auto_53035 ?auto_53037 ) ) ( not ( = ?auto_53035 ?auto_53038 ) ) ( not ( = ?auto_53035 ?auto_53039 ) ) ( not ( = ?auto_53035 ?auto_53040 ) ) ( not ( = ?auto_53036 ?auto_53037 ) ) ( not ( = ?auto_53036 ?auto_53038 ) ) ( not ( = ?auto_53036 ?auto_53039 ) ) ( not ( = ?auto_53036 ?auto_53040 ) ) ( not ( = ?auto_53037 ?auto_53038 ) ) ( not ( = ?auto_53037 ?auto_53039 ) ) ( not ( = ?auto_53037 ?auto_53040 ) ) ( not ( = ?auto_53038 ?auto_53039 ) ) ( not ( = ?auto_53038 ?auto_53040 ) ) ( not ( = ?auto_53039 ?auto_53040 ) ) ( ON ?auto_53038 ?auto_53039 ) ( ON ?auto_53037 ?auto_53038 ) ( ON ?auto_53036 ?auto_53037 ) ( ON ?auto_53035 ?auto_53036 ) ( ON ?auto_53034 ?auto_53035 ) ( ON ?auto_53033 ?auto_53034 ) ( CLEAR ?auto_53033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53033 )
      ( MAKE-7PILE ?auto_53033 ?auto_53034 ?auto_53035 ?auto_53036 ?auto_53037 ?auto_53038 ?auto_53039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_53048 - BLOCK
      ?auto_53049 - BLOCK
      ?auto_53050 - BLOCK
      ?auto_53051 - BLOCK
      ?auto_53052 - BLOCK
      ?auto_53053 - BLOCK
      ?auto_53054 - BLOCK
    )
    :vars
    (
      ?auto_53055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53054 ?auto_53055 ) ( not ( = ?auto_53048 ?auto_53049 ) ) ( not ( = ?auto_53048 ?auto_53050 ) ) ( not ( = ?auto_53048 ?auto_53051 ) ) ( not ( = ?auto_53048 ?auto_53052 ) ) ( not ( = ?auto_53048 ?auto_53053 ) ) ( not ( = ?auto_53048 ?auto_53054 ) ) ( not ( = ?auto_53048 ?auto_53055 ) ) ( not ( = ?auto_53049 ?auto_53050 ) ) ( not ( = ?auto_53049 ?auto_53051 ) ) ( not ( = ?auto_53049 ?auto_53052 ) ) ( not ( = ?auto_53049 ?auto_53053 ) ) ( not ( = ?auto_53049 ?auto_53054 ) ) ( not ( = ?auto_53049 ?auto_53055 ) ) ( not ( = ?auto_53050 ?auto_53051 ) ) ( not ( = ?auto_53050 ?auto_53052 ) ) ( not ( = ?auto_53050 ?auto_53053 ) ) ( not ( = ?auto_53050 ?auto_53054 ) ) ( not ( = ?auto_53050 ?auto_53055 ) ) ( not ( = ?auto_53051 ?auto_53052 ) ) ( not ( = ?auto_53051 ?auto_53053 ) ) ( not ( = ?auto_53051 ?auto_53054 ) ) ( not ( = ?auto_53051 ?auto_53055 ) ) ( not ( = ?auto_53052 ?auto_53053 ) ) ( not ( = ?auto_53052 ?auto_53054 ) ) ( not ( = ?auto_53052 ?auto_53055 ) ) ( not ( = ?auto_53053 ?auto_53054 ) ) ( not ( = ?auto_53053 ?auto_53055 ) ) ( not ( = ?auto_53054 ?auto_53055 ) ) ( ON ?auto_53053 ?auto_53054 ) ( ON ?auto_53052 ?auto_53053 ) ( ON ?auto_53051 ?auto_53052 ) ( ON ?auto_53050 ?auto_53051 ) ( ON ?auto_53049 ?auto_53050 ) ( ON ?auto_53048 ?auto_53049 ) ( CLEAR ?auto_53048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53048 )
      ( MAKE-7PILE ?auto_53048 ?auto_53049 ?auto_53050 ?auto_53051 ?auto_53052 ?auto_53053 ?auto_53054 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53064 - BLOCK
      ?auto_53065 - BLOCK
      ?auto_53066 - BLOCK
      ?auto_53067 - BLOCK
      ?auto_53068 - BLOCK
      ?auto_53069 - BLOCK
      ?auto_53070 - BLOCK
      ?auto_53071 - BLOCK
    )
    :vars
    (
      ?auto_53072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53070 ) ( ON ?auto_53071 ?auto_53072 ) ( CLEAR ?auto_53071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53064 ) ( ON ?auto_53065 ?auto_53064 ) ( ON ?auto_53066 ?auto_53065 ) ( ON ?auto_53067 ?auto_53066 ) ( ON ?auto_53068 ?auto_53067 ) ( ON ?auto_53069 ?auto_53068 ) ( ON ?auto_53070 ?auto_53069 ) ( not ( = ?auto_53064 ?auto_53065 ) ) ( not ( = ?auto_53064 ?auto_53066 ) ) ( not ( = ?auto_53064 ?auto_53067 ) ) ( not ( = ?auto_53064 ?auto_53068 ) ) ( not ( = ?auto_53064 ?auto_53069 ) ) ( not ( = ?auto_53064 ?auto_53070 ) ) ( not ( = ?auto_53064 ?auto_53071 ) ) ( not ( = ?auto_53064 ?auto_53072 ) ) ( not ( = ?auto_53065 ?auto_53066 ) ) ( not ( = ?auto_53065 ?auto_53067 ) ) ( not ( = ?auto_53065 ?auto_53068 ) ) ( not ( = ?auto_53065 ?auto_53069 ) ) ( not ( = ?auto_53065 ?auto_53070 ) ) ( not ( = ?auto_53065 ?auto_53071 ) ) ( not ( = ?auto_53065 ?auto_53072 ) ) ( not ( = ?auto_53066 ?auto_53067 ) ) ( not ( = ?auto_53066 ?auto_53068 ) ) ( not ( = ?auto_53066 ?auto_53069 ) ) ( not ( = ?auto_53066 ?auto_53070 ) ) ( not ( = ?auto_53066 ?auto_53071 ) ) ( not ( = ?auto_53066 ?auto_53072 ) ) ( not ( = ?auto_53067 ?auto_53068 ) ) ( not ( = ?auto_53067 ?auto_53069 ) ) ( not ( = ?auto_53067 ?auto_53070 ) ) ( not ( = ?auto_53067 ?auto_53071 ) ) ( not ( = ?auto_53067 ?auto_53072 ) ) ( not ( = ?auto_53068 ?auto_53069 ) ) ( not ( = ?auto_53068 ?auto_53070 ) ) ( not ( = ?auto_53068 ?auto_53071 ) ) ( not ( = ?auto_53068 ?auto_53072 ) ) ( not ( = ?auto_53069 ?auto_53070 ) ) ( not ( = ?auto_53069 ?auto_53071 ) ) ( not ( = ?auto_53069 ?auto_53072 ) ) ( not ( = ?auto_53070 ?auto_53071 ) ) ( not ( = ?auto_53070 ?auto_53072 ) ) ( not ( = ?auto_53071 ?auto_53072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53071 ?auto_53072 )
      ( !STACK ?auto_53071 ?auto_53070 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53081 - BLOCK
      ?auto_53082 - BLOCK
      ?auto_53083 - BLOCK
      ?auto_53084 - BLOCK
      ?auto_53085 - BLOCK
      ?auto_53086 - BLOCK
      ?auto_53087 - BLOCK
      ?auto_53088 - BLOCK
    )
    :vars
    (
      ?auto_53089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53087 ) ( ON ?auto_53088 ?auto_53089 ) ( CLEAR ?auto_53088 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53081 ) ( ON ?auto_53082 ?auto_53081 ) ( ON ?auto_53083 ?auto_53082 ) ( ON ?auto_53084 ?auto_53083 ) ( ON ?auto_53085 ?auto_53084 ) ( ON ?auto_53086 ?auto_53085 ) ( ON ?auto_53087 ?auto_53086 ) ( not ( = ?auto_53081 ?auto_53082 ) ) ( not ( = ?auto_53081 ?auto_53083 ) ) ( not ( = ?auto_53081 ?auto_53084 ) ) ( not ( = ?auto_53081 ?auto_53085 ) ) ( not ( = ?auto_53081 ?auto_53086 ) ) ( not ( = ?auto_53081 ?auto_53087 ) ) ( not ( = ?auto_53081 ?auto_53088 ) ) ( not ( = ?auto_53081 ?auto_53089 ) ) ( not ( = ?auto_53082 ?auto_53083 ) ) ( not ( = ?auto_53082 ?auto_53084 ) ) ( not ( = ?auto_53082 ?auto_53085 ) ) ( not ( = ?auto_53082 ?auto_53086 ) ) ( not ( = ?auto_53082 ?auto_53087 ) ) ( not ( = ?auto_53082 ?auto_53088 ) ) ( not ( = ?auto_53082 ?auto_53089 ) ) ( not ( = ?auto_53083 ?auto_53084 ) ) ( not ( = ?auto_53083 ?auto_53085 ) ) ( not ( = ?auto_53083 ?auto_53086 ) ) ( not ( = ?auto_53083 ?auto_53087 ) ) ( not ( = ?auto_53083 ?auto_53088 ) ) ( not ( = ?auto_53083 ?auto_53089 ) ) ( not ( = ?auto_53084 ?auto_53085 ) ) ( not ( = ?auto_53084 ?auto_53086 ) ) ( not ( = ?auto_53084 ?auto_53087 ) ) ( not ( = ?auto_53084 ?auto_53088 ) ) ( not ( = ?auto_53084 ?auto_53089 ) ) ( not ( = ?auto_53085 ?auto_53086 ) ) ( not ( = ?auto_53085 ?auto_53087 ) ) ( not ( = ?auto_53085 ?auto_53088 ) ) ( not ( = ?auto_53085 ?auto_53089 ) ) ( not ( = ?auto_53086 ?auto_53087 ) ) ( not ( = ?auto_53086 ?auto_53088 ) ) ( not ( = ?auto_53086 ?auto_53089 ) ) ( not ( = ?auto_53087 ?auto_53088 ) ) ( not ( = ?auto_53087 ?auto_53089 ) ) ( not ( = ?auto_53088 ?auto_53089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53088 ?auto_53089 )
      ( !STACK ?auto_53088 ?auto_53087 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53098 - BLOCK
      ?auto_53099 - BLOCK
      ?auto_53100 - BLOCK
      ?auto_53101 - BLOCK
      ?auto_53102 - BLOCK
      ?auto_53103 - BLOCK
      ?auto_53104 - BLOCK
      ?auto_53105 - BLOCK
    )
    :vars
    (
      ?auto_53106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53105 ?auto_53106 ) ( ON-TABLE ?auto_53098 ) ( ON ?auto_53099 ?auto_53098 ) ( ON ?auto_53100 ?auto_53099 ) ( ON ?auto_53101 ?auto_53100 ) ( ON ?auto_53102 ?auto_53101 ) ( ON ?auto_53103 ?auto_53102 ) ( not ( = ?auto_53098 ?auto_53099 ) ) ( not ( = ?auto_53098 ?auto_53100 ) ) ( not ( = ?auto_53098 ?auto_53101 ) ) ( not ( = ?auto_53098 ?auto_53102 ) ) ( not ( = ?auto_53098 ?auto_53103 ) ) ( not ( = ?auto_53098 ?auto_53104 ) ) ( not ( = ?auto_53098 ?auto_53105 ) ) ( not ( = ?auto_53098 ?auto_53106 ) ) ( not ( = ?auto_53099 ?auto_53100 ) ) ( not ( = ?auto_53099 ?auto_53101 ) ) ( not ( = ?auto_53099 ?auto_53102 ) ) ( not ( = ?auto_53099 ?auto_53103 ) ) ( not ( = ?auto_53099 ?auto_53104 ) ) ( not ( = ?auto_53099 ?auto_53105 ) ) ( not ( = ?auto_53099 ?auto_53106 ) ) ( not ( = ?auto_53100 ?auto_53101 ) ) ( not ( = ?auto_53100 ?auto_53102 ) ) ( not ( = ?auto_53100 ?auto_53103 ) ) ( not ( = ?auto_53100 ?auto_53104 ) ) ( not ( = ?auto_53100 ?auto_53105 ) ) ( not ( = ?auto_53100 ?auto_53106 ) ) ( not ( = ?auto_53101 ?auto_53102 ) ) ( not ( = ?auto_53101 ?auto_53103 ) ) ( not ( = ?auto_53101 ?auto_53104 ) ) ( not ( = ?auto_53101 ?auto_53105 ) ) ( not ( = ?auto_53101 ?auto_53106 ) ) ( not ( = ?auto_53102 ?auto_53103 ) ) ( not ( = ?auto_53102 ?auto_53104 ) ) ( not ( = ?auto_53102 ?auto_53105 ) ) ( not ( = ?auto_53102 ?auto_53106 ) ) ( not ( = ?auto_53103 ?auto_53104 ) ) ( not ( = ?auto_53103 ?auto_53105 ) ) ( not ( = ?auto_53103 ?auto_53106 ) ) ( not ( = ?auto_53104 ?auto_53105 ) ) ( not ( = ?auto_53104 ?auto_53106 ) ) ( not ( = ?auto_53105 ?auto_53106 ) ) ( CLEAR ?auto_53103 ) ( ON ?auto_53104 ?auto_53105 ) ( CLEAR ?auto_53104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_53098 ?auto_53099 ?auto_53100 ?auto_53101 ?auto_53102 ?auto_53103 ?auto_53104 )
      ( MAKE-8PILE ?auto_53098 ?auto_53099 ?auto_53100 ?auto_53101 ?auto_53102 ?auto_53103 ?auto_53104 ?auto_53105 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53115 - BLOCK
      ?auto_53116 - BLOCK
      ?auto_53117 - BLOCK
      ?auto_53118 - BLOCK
      ?auto_53119 - BLOCK
      ?auto_53120 - BLOCK
      ?auto_53121 - BLOCK
      ?auto_53122 - BLOCK
    )
    :vars
    (
      ?auto_53123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53122 ?auto_53123 ) ( ON-TABLE ?auto_53115 ) ( ON ?auto_53116 ?auto_53115 ) ( ON ?auto_53117 ?auto_53116 ) ( ON ?auto_53118 ?auto_53117 ) ( ON ?auto_53119 ?auto_53118 ) ( ON ?auto_53120 ?auto_53119 ) ( not ( = ?auto_53115 ?auto_53116 ) ) ( not ( = ?auto_53115 ?auto_53117 ) ) ( not ( = ?auto_53115 ?auto_53118 ) ) ( not ( = ?auto_53115 ?auto_53119 ) ) ( not ( = ?auto_53115 ?auto_53120 ) ) ( not ( = ?auto_53115 ?auto_53121 ) ) ( not ( = ?auto_53115 ?auto_53122 ) ) ( not ( = ?auto_53115 ?auto_53123 ) ) ( not ( = ?auto_53116 ?auto_53117 ) ) ( not ( = ?auto_53116 ?auto_53118 ) ) ( not ( = ?auto_53116 ?auto_53119 ) ) ( not ( = ?auto_53116 ?auto_53120 ) ) ( not ( = ?auto_53116 ?auto_53121 ) ) ( not ( = ?auto_53116 ?auto_53122 ) ) ( not ( = ?auto_53116 ?auto_53123 ) ) ( not ( = ?auto_53117 ?auto_53118 ) ) ( not ( = ?auto_53117 ?auto_53119 ) ) ( not ( = ?auto_53117 ?auto_53120 ) ) ( not ( = ?auto_53117 ?auto_53121 ) ) ( not ( = ?auto_53117 ?auto_53122 ) ) ( not ( = ?auto_53117 ?auto_53123 ) ) ( not ( = ?auto_53118 ?auto_53119 ) ) ( not ( = ?auto_53118 ?auto_53120 ) ) ( not ( = ?auto_53118 ?auto_53121 ) ) ( not ( = ?auto_53118 ?auto_53122 ) ) ( not ( = ?auto_53118 ?auto_53123 ) ) ( not ( = ?auto_53119 ?auto_53120 ) ) ( not ( = ?auto_53119 ?auto_53121 ) ) ( not ( = ?auto_53119 ?auto_53122 ) ) ( not ( = ?auto_53119 ?auto_53123 ) ) ( not ( = ?auto_53120 ?auto_53121 ) ) ( not ( = ?auto_53120 ?auto_53122 ) ) ( not ( = ?auto_53120 ?auto_53123 ) ) ( not ( = ?auto_53121 ?auto_53122 ) ) ( not ( = ?auto_53121 ?auto_53123 ) ) ( not ( = ?auto_53122 ?auto_53123 ) ) ( CLEAR ?auto_53120 ) ( ON ?auto_53121 ?auto_53122 ) ( CLEAR ?auto_53121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_53115 ?auto_53116 ?auto_53117 ?auto_53118 ?auto_53119 ?auto_53120 ?auto_53121 )
      ( MAKE-8PILE ?auto_53115 ?auto_53116 ?auto_53117 ?auto_53118 ?auto_53119 ?auto_53120 ?auto_53121 ?auto_53122 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53132 - BLOCK
      ?auto_53133 - BLOCK
      ?auto_53134 - BLOCK
      ?auto_53135 - BLOCK
      ?auto_53136 - BLOCK
      ?auto_53137 - BLOCK
      ?auto_53138 - BLOCK
      ?auto_53139 - BLOCK
    )
    :vars
    (
      ?auto_53140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53139 ?auto_53140 ) ( ON-TABLE ?auto_53132 ) ( ON ?auto_53133 ?auto_53132 ) ( ON ?auto_53134 ?auto_53133 ) ( ON ?auto_53135 ?auto_53134 ) ( ON ?auto_53136 ?auto_53135 ) ( not ( = ?auto_53132 ?auto_53133 ) ) ( not ( = ?auto_53132 ?auto_53134 ) ) ( not ( = ?auto_53132 ?auto_53135 ) ) ( not ( = ?auto_53132 ?auto_53136 ) ) ( not ( = ?auto_53132 ?auto_53137 ) ) ( not ( = ?auto_53132 ?auto_53138 ) ) ( not ( = ?auto_53132 ?auto_53139 ) ) ( not ( = ?auto_53132 ?auto_53140 ) ) ( not ( = ?auto_53133 ?auto_53134 ) ) ( not ( = ?auto_53133 ?auto_53135 ) ) ( not ( = ?auto_53133 ?auto_53136 ) ) ( not ( = ?auto_53133 ?auto_53137 ) ) ( not ( = ?auto_53133 ?auto_53138 ) ) ( not ( = ?auto_53133 ?auto_53139 ) ) ( not ( = ?auto_53133 ?auto_53140 ) ) ( not ( = ?auto_53134 ?auto_53135 ) ) ( not ( = ?auto_53134 ?auto_53136 ) ) ( not ( = ?auto_53134 ?auto_53137 ) ) ( not ( = ?auto_53134 ?auto_53138 ) ) ( not ( = ?auto_53134 ?auto_53139 ) ) ( not ( = ?auto_53134 ?auto_53140 ) ) ( not ( = ?auto_53135 ?auto_53136 ) ) ( not ( = ?auto_53135 ?auto_53137 ) ) ( not ( = ?auto_53135 ?auto_53138 ) ) ( not ( = ?auto_53135 ?auto_53139 ) ) ( not ( = ?auto_53135 ?auto_53140 ) ) ( not ( = ?auto_53136 ?auto_53137 ) ) ( not ( = ?auto_53136 ?auto_53138 ) ) ( not ( = ?auto_53136 ?auto_53139 ) ) ( not ( = ?auto_53136 ?auto_53140 ) ) ( not ( = ?auto_53137 ?auto_53138 ) ) ( not ( = ?auto_53137 ?auto_53139 ) ) ( not ( = ?auto_53137 ?auto_53140 ) ) ( not ( = ?auto_53138 ?auto_53139 ) ) ( not ( = ?auto_53138 ?auto_53140 ) ) ( not ( = ?auto_53139 ?auto_53140 ) ) ( ON ?auto_53138 ?auto_53139 ) ( CLEAR ?auto_53136 ) ( ON ?auto_53137 ?auto_53138 ) ( CLEAR ?auto_53137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53132 ?auto_53133 ?auto_53134 ?auto_53135 ?auto_53136 ?auto_53137 )
      ( MAKE-8PILE ?auto_53132 ?auto_53133 ?auto_53134 ?auto_53135 ?auto_53136 ?auto_53137 ?auto_53138 ?auto_53139 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53149 - BLOCK
      ?auto_53150 - BLOCK
      ?auto_53151 - BLOCK
      ?auto_53152 - BLOCK
      ?auto_53153 - BLOCK
      ?auto_53154 - BLOCK
      ?auto_53155 - BLOCK
      ?auto_53156 - BLOCK
    )
    :vars
    (
      ?auto_53157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53156 ?auto_53157 ) ( ON-TABLE ?auto_53149 ) ( ON ?auto_53150 ?auto_53149 ) ( ON ?auto_53151 ?auto_53150 ) ( ON ?auto_53152 ?auto_53151 ) ( ON ?auto_53153 ?auto_53152 ) ( not ( = ?auto_53149 ?auto_53150 ) ) ( not ( = ?auto_53149 ?auto_53151 ) ) ( not ( = ?auto_53149 ?auto_53152 ) ) ( not ( = ?auto_53149 ?auto_53153 ) ) ( not ( = ?auto_53149 ?auto_53154 ) ) ( not ( = ?auto_53149 ?auto_53155 ) ) ( not ( = ?auto_53149 ?auto_53156 ) ) ( not ( = ?auto_53149 ?auto_53157 ) ) ( not ( = ?auto_53150 ?auto_53151 ) ) ( not ( = ?auto_53150 ?auto_53152 ) ) ( not ( = ?auto_53150 ?auto_53153 ) ) ( not ( = ?auto_53150 ?auto_53154 ) ) ( not ( = ?auto_53150 ?auto_53155 ) ) ( not ( = ?auto_53150 ?auto_53156 ) ) ( not ( = ?auto_53150 ?auto_53157 ) ) ( not ( = ?auto_53151 ?auto_53152 ) ) ( not ( = ?auto_53151 ?auto_53153 ) ) ( not ( = ?auto_53151 ?auto_53154 ) ) ( not ( = ?auto_53151 ?auto_53155 ) ) ( not ( = ?auto_53151 ?auto_53156 ) ) ( not ( = ?auto_53151 ?auto_53157 ) ) ( not ( = ?auto_53152 ?auto_53153 ) ) ( not ( = ?auto_53152 ?auto_53154 ) ) ( not ( = ?auto_53152 ?auto_53155 ) ) ( not ( = ?auto_53152 ?auto_53156 ) ) ( not ( = ?auto_53152 ?auto_53157 ) ) ( not ( = ?auto_53153 ?auto_53154 ) ) ( not ( = ?auto_53153 ?auto_53155 ) ) ( not ( = ?auto_53153 ?auto_53156 ) ) ( not ( = ?auto_53153 ?auto_53157 ) ) ( not ( = ?auto_53154 ?auto_53155 ) ) ( not ( = ?auto_53154 ?auto_53156 ) ) ( not ( = ?auto_53154 ?auto_53157 ) ) ( not ( = ?auto_53155 ?auto_53156 ) ) ( not ( = ?auto_53155 ?auto_53157 ) ) ( not ( = ?auto_53156 ?auto_53157 ) ) ( ON ?auto_53155 ?auto_53156 ) ( CLEAR ?auto_53153 ) ( ON ?auto_53154 ?auto_53155 ) ( CLEAR ?auto_53154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53149 ?auto_53150 ?auto_53151 ?auto_53152 ?auto_53153 ?auto_53154 )
      ( MAKE-8PILE ?auto_53149 ?auto_53150 ?auto_53151 ?auto_53152 ?auto_53153 ?auto_53154 ?auto_53155 ?auto_53156 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53166 - BLOCK
      ?auto_53167 - BLOCK
      ?auto_53168 - BLOCK
      ?auto_53169 - BLOCK
      ?auto_53170 - BLOCK
      ?auto_53171 - BLOCK
      ?auto_53172 - BLOCK
      ?auto_53173 - BLOCK
    )
    :vars
    (
      ?auto_53174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53173 ?auto_53174 ) ( ON-TABLE ?auto_53166 ) ( ON ?auto_53167 ?auto_53166 ) ( ON ?auto_53168 ?auto_53167 ) ( ON ?auto_53169 ?auto_53168 ) ( not ( = ?auto_53166 ?auto_53167 ) ) ( not ( = ?auto_53166 ?auto_53168 ) ) ( not ( = ?auto_53166 ?auto_53169 ) ) ( not ( = ?auto_53166 ?auto_53170 ) ) ( not ( = ?auto_53166 ?auto_53171 ) ) ( not ( = ?auto_53166 ?auto_53172 ) ) ( not ( = ?auto_53166 ?auto_53173 ) ) ( not ( = ?auto_53166 ?auto_53174 ) ) ( not ( = ?auto_53167 ?auto_53168 ) ) ( not ( = ?auto_53167 ?auto_53169 ) ) ( not ( = ?auto_53167 ?auto_53170 ) ) ( not ( = ?auto_53167 ?auto_53171 ) ) ( not ( = ?auto_53167 ?auto_53172 ) ) ( not ( = ?auto_53167 ?auto_53173 ) ) ( not ( = ?auto_53167 ?auto_53174 ) ) ( not ( = ?auto_53168 ?auto_53169 ) ) ( not ( = ?auto_53168 ?auto_53170 ) ) ( not ( = ?auto_53168 ?auto_53171 ) ) ( not ( = ?auto_53168 ?auto_53172 ) ) ( not ( = ?auto_53168 ?auto_53173 ) ) ( not ( = ?auto_53168 ?auto_53174 ) ) ( not ( = ?auto_53169 ?auto_53170 ) ) ( not ( = ?auto_53169 ?auto_53171 ) ) ( not ( = ?auto_53169 ?auto_53172 ) ) ( not ( = ?auto_53169 ?auto_53173 ) ) ( not ( = ?auto_53169 ?auto_53174 ) ) ( not ( = ?auto_53170 ?auto_53171 ) ) ( not ( = ?auto_53170 ?auto_53172 ) ) ( not ( = ?auto_53170 ?auto_53173 ) ) ( not ( = ?auto_53170 ?auto_53174 ) ) ( not ( = ?auto_53171 ?auto_53172 ) ) ( not ( = ?auto_53171 ?auto_53173 ) ) ( not ( = ?auto_53171 ?auto_53174 ) ) ( not ( = ?auto_53172 ?auto_53173 ) ) ( not ( = ?auto_53172 ?auto_53174 ) ) ( not ( = ?auto_53173 ?auto_53174 ) ) ( ON ?auto_53172 ?auto_53173 ) ( ON ?auto_53171 ?auto_53172 ) ( CLEAR ?auto_53169 ) ( ON ?auto_53170 ?auto_53171 ) ( CLEAR ?auto_53170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53166 ?auto_53167 ?auto_53168 ?auto_53169 ?auto_53170 )
      ( MAKE-8PILE ?auto_53166 ?auto_53167 ?auto_53168 ?auto_53169 ?auto_53170 ?auto_53171 ?auto_53172 ?auto_53173 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53183 - BLOCK
      ?auto_53184 - BLOCK
      ?auto_53185 - BLOCK
      ?auto_53186 - BLOCK
      ?auto_53187 - BLOCK
      ?auto_53188 - BLOCK
      ?auto_53189 - BLOCK
      ?auto_53190 - BLOCK
    )
    :vars
    (
      ?auto_53191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53190 ?auto_53191 ) ( ON-TABLE ?auto_53183 ) ( ON ?auto_53184 ?auto_53183 ) ( ON ?auto_53185 ?auto_53184 ) ( ON ?auto_53186 ?auto_53185 ) ( not ( = ?auto_53183 ?auto_53184 ) ) ( not ( = ?auto_53183 ?auto_53185 ) ) ( not ( = ?auto_53183 ?auto_53186 ) ) ( not ( = ?auto_53183 ?auto_53187 ) ) ( not ( = ?auto_53183 ?auto_53188 ) ) ( not ( = ?auto_53183 ?auto_53189 ) ) ( not ( = ?auto_53183 ?auto_53190 ) ) ( not ( = ?auto_53183 ?auto_53191 ) ) ( not ( = ?auto_53184 ?auto_53185 ) ) ( not ( = ?auto_53184 ?auto_53186 ) ) ( not ( = ?auto_53184 ?auto_53187 ) ) ( not ( = ?auto_53184 ?auto_53188 ) ) ( not ( = ?auto_53184 ?auto_53189 ) ) ( not ( = ?auto_53184 ?auto_53190 ) ) ( not ( = ?auto_53184 ?auto_53191 ) ) ( not ( = ?auto_53185 ?auto_53186 ) ) ( not ( = ?auto_53185 ?auto_53187 ) ) ( not ( = ?auto_53185 ?auto_53188 ) ) ( not ( = ?auto_53185 ?auto_53189 ) ) ( not ( = ?auto_53185 ?auto_53190 ) ) ( not ( = ?auto_53185 ?auto_53191 ) ) ( not ( = ?auto_53186 ?auto_53187 ) ) ( not ( = ?auto_53186 ?auto_53188 ) ) ( not ( = ?auto_53186 ?auto_53189 ) ) ( not ( = ?auto_53186 ?auto_53190 ) ) ( not ( = ?auto_53186 ?auto_53191 ) ) ( not ( = ?auto_53187 ?auto_53188 ) ) ( not ( = ?auto_53187 ?auto_53189 ) ) ( not ( = ?auto_53187 ?auto_53190 ) ) ( not ( = ?auto_53187 ?auto_53191 ) ) ( not ( = ?auto_53188 ?auto_53189 ) ) ( not ( = ?auto_53188 ?auto_53190 ) ) ( not ( = ?auto_53188 ?auto_53191 ) ) ( not ( = ?auto_53189 ?auto_53190 ) ) ( not ( = ?auto_53189 ?auto_53191 ) ) ( not ( = ?auto_53190 ?auto_53191 ) ) ( ON ?auto_53189 ?auto_53190 ) ( ON ?auto_53188 ?auto_53189 ) ( CLEAR ?auto_53186 ) ( ON ?auto_53187 ?auto_53188 ) ( CLEAR ?auto_53187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53183 ?auto_53184 ?auto_53185 ?auto_53186 ?auto_53187 )
      ( MAKE-8PILE ?auto_53183 ?auto_53184 ?auto_53185 ?auto_53186 ?auto_53187 ?auto_53188 ?auto_53189 ?auto_53190 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53200 - BLOCK
      ?auto_53201 - BLOCK
      ?auto_53202 - BLOCK
      ?auto_53203 - BLOCK
      ?auto_53204 - BLOCK
      ?auto_53205 - BLOCK
      ?auto_53206 - BLOCK
      ?auto_53207 - BLOCK
    )
    :vars
    (
      ?auto_53208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53207 ?auto_53208 ) ( ON-TABLE ?auto_53200 ) ( ON ?auto_53201 ?auto_53200 ) ( ON ?auto_53202 ?auto_53201 ) ( not ( = ?auto_53200 ?auto_53201 ) ) ( not ( = ?auto_53200 ?auto_53202 ) ) ( not ( = ?auto_53200 ?auto_53203 ) ) ( not ( = ?auto_53200 ?auto_53204 ) ) ( not ( = ?auto_53200 ?auto_53205 ) ) ( not ( = ?auto_53200 ?auto_53206 ) ) ( not ( = ?auto_53200 ?auto_53207 ) ) ( not ( = ?auto_53200 ?auto_53208 ) ) ( not ( = ?auto_53201 ?auto_53202 ) ) ( not ( = ?auto_53201 ?auto_53203 ) ) ( not ( = ?auto_53201 ?auto_53204 ) ) ( not ( = ?auto_53201 ?auto_53205 ) ) ( not ( = ?auto_53201 ?auto_53206 ) ) ( not ( = ?auto_53201 ?auto_53207 ) ) ( not ( = ?auto_53201 ?auto_53208 ) ) ( not ( = ?auto_53202 ?auto_53203 ) ) ( not ( = ?auto_53202 ?auto_53204 ) ) ( not ( = ?auto_53202 ?auto_53205 ) ) ( not ( = ?auto_53202 ?auto_53206 ) ) ( not ( = ?auto_53202 ?auto_53207 ) ) ( not ( = ?auto_53202 ?auto_53208 ) ) ( not ( = ?auto_53203 ?auto_53204 ) ) ( not ( = ?auto_53203 ?auto_53205 ) ) ( not ( = ?auto_53203 ?auto_53206 ) ) ( not ( = ?auto_53203 ?auto_53207 ) ) ( not ( = ?auto_53203 ?auto_53208 ) ) ( not ( = ?auto_53204 ?auto_53205 ) ) ( not ( = ?auto_53204 ?auto_53206 ) ) ( not ( = ?auto_53204 ?auto_53207 ) ) ( not ( = ?auto_53204 ?auto_53208 ) ) ( not ( = ?auto_53205 ?auto_53206 ) ) ( not ( = ?auto_53205 ?auto_53207 ) ) ( not ( = ?auto_53205 ?auto_53208 ) ) ( not ( = ?auto_53206 ?auto_53207 ) ) ( not ( = ?auto_53206 ?auto_53208 ) ) ( not ( = ?auto_53207 ?auto_53208 ) ) ( ON ?auto_53206 ?auto_53207 ) ( ON ?auto_53205 ?auto_53206 ) ( ON ?auto_53204 ?auto_53205 ) ( CLEAR ?auto_53202 ) ( ON ?auto_53203 ?auto_53204 ) ( CLEAR ?auto_53203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53200 ?auto_53201 ?auto_53202 ?auto_53203 )
      ( MAKE-8PILE ?auto_53200 ?auto_53201 ?auto_53202 ?auto_53203 ?auto_53204 ?auto_53205 ?auto_53206 ?auto_53207 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53217 - BLOCK
      ?auto_53218 - BLOCK
      ?auto_53219 - BLOCK
      ?auto_53220 - BLOCK
      ?auto_53221 - BLOCK
      ?auto_53222 - BLOCK
      ?auto_53223 - BLOCK
      ?auto_53224 - BLOCK
    )
    :vars
    (
      ?auto_53225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53224 ?auto_53225 ) ( ON-TABLE ?auto_53217 ) ( ON ?auto_53218 ?auto_53217 ) ( ON ?auto_53219 ?auto_53218 ) ( not ( = ?auto_53217 ?auto_53218 ) ) ( not ( = ?auto_53217 ?auto_53219 ) ) ( not ( = ?auto_53217 ?auto_53220 ) ) ( not ( = ?auto_53217 ?auto_53221 ) ) ( not ( = ?auto_53217 ?auto_53222 ) ) ( not ( = ?auto_53217 ?auto_53223 ) ) ( not ( = ?auto_53217 ?auto_53224 ) ) ( not ( = ?auto_53217 ?auto_53225 ) ) ( not ( = ?auto_53218 ?auto_53219 ) ) ( not ( = ?auto_53218 ?auto_53220 ) ) ( not ( = ?auto_53218 ?auto_53221 ) ) ( not ( = ?auto_53218 ?auto_53222 ) ) ( not ( = ?auto_53218 ?auto_53223 ) ) ( not ( = ?auto_53218 ?auto_53224 ) ) ( not ( = ?auto_53218 ?auto_53225 ) ) ( not ( = ?auto_53219 ?auto_53220 ) ) ( not ( = ?auto_53219 ?auto_53221 ) ) ( not ( = ?auto_53219 ?auto_53222 ) ) ( not ( = ?auto_53219 ?auto_53223 ) ) ( not ( = ?auto_53219 ?auto_53224 ) ) ( not ( = ?auto_53219 ?auto_53225 ) ) ( not ( = ?auto_53220 ?auto_53221 ) ) ( not ( = ?auto_53220 ?auto_53222 ) ) ( not ( = ?auto_53220 ?auto_53223 ) ) ( not ( = ?auto_53220 ?auto_53224 ) ) ( not ( = ?auto_53220 ?auto_53225 ) ) ( not ( = ?auto_53221 ?auto_53222 ) ) ( not ( = ?auto_53221 ?auto_53223 ) ) ( not ( = ?auto_53221 ?auto_53224 ) ) ( not ( = ?auto_53221 ?auto_53225 ) ) ( not ( = ?auto_53222 ?auto_53223 ) ) ( not ( = ?auto_53222 ?auto_53224 ) ) ( not ( = ?auto_53222 ?auto_53225 ) ) ( not ( = ?auto_53223 ?auto_53224 ) ) ( not ( = ?auto_53223 ?auto_53225 ) ) ( not ( = ?auto_53224 ?auto_53225 ) ) ( ON ?auto_53223 ?auto_53224 ) ( ON ?auto_53222 ?auto_53223 ) ( ON ?auto_53221 ?auto_53222 ) ( CLEAR ?auto_53219 ) ( ON ?auto_53220 ?auto_53221 ) ( CLEAR ?auto_53220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53217 ?auto_53218 ?auto_53219 ?auto_53220 )
      ( MAKE-8PILE ?auto_53217 ?auto_53218 ?auto_53219 ?auto_53220 ?auto_53221 ?auto_53222 ?auto_53223 ?auto_53224 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53234 - BLOCK
      ?auto_53235 - BLOCK
      ?auto_53236 - BLOCK
      ?auto_53237 - BLOCK
      ?auto_53238 - BLOCK
      ?auto_53239 - BLOCK
      ?auto_53240 - BLOCK
      ?auto_53241 - BLOCK
    )
    :vars
    (
      ?auto_53242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53241 ?auto_53242 ) ( ON-TABLE ?auto_53234 ) ( ON ?auto_53235 ?auto_53234 ) ( not ( = ?auto_53234 ?auto_53235 ) ) ( not ( = ?auto_53234 ?auto_53236 ) ) ( not ( = ?auto_53234 ?auto_53237 ) ) ( not ( = ?auto_53234 ?auto_53238 ) ) ( not ( = ?auto_53234 ?auto_53239 ) ) ( not ( = ?auto_53234 ?auto_53240 ) ) ( not ( = ?auto_53234 ?auto_53241 ) ) ( not ( = ?auto_53234 ?auto_53242 ) ) ( not ( = ?auto_53235 ?auto_53236 ) ) ( not ( = ?auto_53235 ?auto_53237 ) ) ( not ( = ?auto_53235 ?auto_53238 ) ) ( not ( = ?auto_53235 ?auto_53239 ) ) ( not ( = ?auto_53235 ?auto_53240 ) ) ( not ( = ?auto_53235 ?auto_53241 ) ) ( not ( = ?auto_53235 ?auto_53242 ) ) ( not ( = ?auto_53236 ?auto_53237 ) ) ( not ( = ?auto_53236 ?auto_53238 ) ) ( not ( = ?auto_53236 ?auto_53239 ) ) ( not ( = ?auto_53236 ?auto_53240 ) ) ( not ( = ?auto_53236 ?auto_53241 ) ) ( not ( = ?auto_53236 ?auto_53242 ) ) ( not ( = ?auto_53237 ?auto_53238 ) ) ( not ( = ?auto_53237 ?auto_53239 ) ) ( not ( = ?auto_53237 ?auto_53240 ) ) ( not ( = ?auto_53237 ?auto_53241 ) ) ( not ( = ?auto_53237 ?auto_53242 ) ) ( not ( = ?auto_53238 ?auto_53239 ) ) ( not ( = ?auto_53238 ?auto_53240 ) ) ( not ( = ?auto_53238 ?auto_53241 ) ) ( not ( = ?auto_53238 ?auto_53242 ) ) ( not ( = ?auto_53239 ?auto_53240 ) ) ( not ( = ?auto_53239 ?auto_53241 ) ) ( not ( = ?auto_53239 ?auto_53242 ) ) ( not ( = ?auto_53240 ?auto_53241 ) ) ( not ( = ?auto_53240 ?auto_53242 ) ) ( not ( = ?auto_53241 ?auto_53242 ) ) ( ON ?auto_53240 ?auto_53241 ) ( ON ?auto_53239 ?auto_53240 ) ( ON ?auto_53238 ?auto_53239 ) ( ON ?auto_53237 ?auto_53238 ) ( CLEAR ?auto_53235 ) ( ON ?auto_53236 ?auto_53237 ) ( CLEAR ?auto_53236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53234 ?auto_53235 ?auto_53236 )
      ( MAKE-8PILE ?auto_53234 ?auto_53235 ?auto_53236 ?auto_53237 ?auto_53238 ?auto_53239 ?auto_53240 ?auto_53241 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53251 - BLOCK
      ?auto_53252 - BLOCK
      ?auto_53253 - BLOCK
      ?auto_53254 - BLOCK
      ?auto_53255 - BLOCK
      ?auto_53256 - BLOCK
      ?auto_53257 - BLOCK
      ?auto_53258 - BLOCK
    )
    :vars
    (
      ?auto_53259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53258 ?auto_53259 ) ( ON-TABLE ?auto_53251 ) ( ON ?auto_53252 ?auto_53251 ) ( not ( = ?auto_53251 ?auto_53252 ) ) ( not ( = ?auto_53251 ?auto_53253 ) ) ( not ( = ?auto_53251 ?auto_53254 ) ) ( not ( = ?auto_53251 ?auto_53255 ) ) ( not ( = ?auto_53251 ?auto_53256 ) ) ( not ( = ?auto_53251 ?auto_53257 ) ) ( not ( = ?auto_53251 ?auto_53258 ) ) ( not ( = ?auto_53251 ?auto_53259 ) ) ( not ( = ?auto_53252 ?auto_53253 ) ) ( not ( = ?auto_53252 ?auto_53254 ) ) ( not ( = ?auto_53252 ?auto_53255 ) ) ( not ( = ?auto_53252 ?auto_53256 ) ) ( not ( = ?auto_53252 ?auto_53257 ) ) ( not ( = ?auto_53252 ?auto_53258 ) ) ( not ( = ?auto_53252 ?auto_53259 ) ) ( not ( = ?auto_53253 ?auto_53254 ) ) ( not ( = ?auto_53253 ?auto_53255 ) ) ( not ( = ?auto_53253 ?auto_53256 ) ) ( not ( = ?auto_53253 ?auto_53257 ) ) ( not ( = ?auto_53253 ?auto_53258 ) ) ( not ( = ?auto_53253 ?auto_53259 ) ) ( not ( = ?auto_53254 ?auto_53255 ) ) ( not ( = ?auto_53254 ?auto_53256 ) ) ( not ( = ?auto_53254 ?auto_53257 ) ) ( not ( = ?auto_53254 ?auto_53258 ) ) ( not ( = ?auto_53254 ?auto_53259 ) ) ( not ( = ?auto_53255 ?auto_53256 ) ) ( not ( = ?auto_53255 ?auto_53257 ) ) ( not ( = ?auto_53255 ?auto_53258 ) ) ( not ( = ?auto_53255 ?auto_53259 ) ) ( not ( = ?auto_53256 ?auto_53257 ) ) ( not ( = ?auto_53256 ?auto_53258 ) ) ( not ( = ?auto_53256 ?auto_53259 ) ) ( not ( = ?auto_53257 ?auto_53258 ) ) ( not ( = ?auto_53257 ?auto_53259 ) ) ( not ( = ?auto_53258 ?auto_53259 ) ) ( ON ?auto_53257 ?auto_53258 ) ( ON ?auto_53256 ?auto_53257 ) ( ON ?auto_53255 ?auto_53256 ) ( ON ?auto_53254 ?auto_53255 ) ( CLEAR ?auto_53252 ) ( ON ?auto_53253 ?auto_53254 ) ( CLEAR ?auto_53253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53251 ?auto_53252 ?auto_53253 )
      ( MAKE-8PILE ?auto_53251 ?auto_53252 ?auto_53253 ?auto_53254 ?auto_53255 ?auto_53256 ?auto_53257 ?auto_53258 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53268 - BLOCK
      ?auto_53269 - BLOCK
      ?auto_53270 - BLOCK
      ?auto_53271 - BLOCK
      ?auto_53272 - BLOCK
      ?auto_53273 - BLOCK
      ?auto_53274 - BLOCK
      ?auto_53275 - BLOCK
    )
    :vars
    (
      ?auto_53276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53275 ?auto_53276 ) ( ON-TABLE ?auto_53268 ) ( not ( = ?auto_53268 ?auto_53269 ) ) ( not ( = ?auto_53268 ?auto_53270 ) ) ( not ( = ?auto_53268 ?auto_53271 ) ) ( not ( = ?auto_53268 ?auto_53272 ) ) ( not ( = ?auto_53268 ?auto_53273 ) ) ( not ( = ?auto_53268 ?auto_53274 ) ) ( not ( = ?auto_53268 ?auto_53275 ) ) ( not ( = ?auto_53268 ?auto_53276 ) ) ( not ( = ?auto_53269 ?auto_53270 ) ) ( not ( = ?auto_53269 ?auto_53271 ) ) ( not ( = ?auto_53269 ?auto_53272 ) ) ( not ( = ?auto_53269 ?auto_53273 ) ) ( not ( = ?auto_53269 ?auto_53274 ) ) ( not ( = ?auto_53269 ?auto_53275 ) ) ( not ( = ?auto_53269 ?auto_53276 ) ) ( not ( = ?auto_53270 ?auto_53271 ) ) ( not ( = ?auto_53270 ?auto_53272 ) ) ( not ( = ?auto_53270 ?auto_53273 ) ) ( not ( = ?auto_53270 ?auto_53274 ) ) ( not ( = ?auto_53270 ?auto_53275 ) ) ( not ( = ?auto_53270 ?auto_53276 ) ) ( not ( = ?auto_53271 ?auto_53272 ) ) ( not ( = ?auto_53271 ?auto_53273 ) ) ( not ( = ?auto_53271 ?auto_53274 ) ) ( not ( = ?auto_53271 ?auto_53275 ) ) ( not ( = ?auto_53271 ?auto_53276 ) ) ( not ( = ?auto_53272 ?auto_53273 ) ) ( not ( = ?auto_53272 ?auto_53274 ) ) ( not ( = ?auto_53272 ?auto_53275 ) ) ( not ( = ?auto_53272 ?auto_53276 ) ) ( not ( = ?auto_53273 ?auto_53274 ) ) ( not ( = ?auto_53273 ?auto_53275 ) ) ( not ( = ?auto_53273 ?auto_53276 ) ) ( not ( = ?auto_53274 ?auto_53275 ) ) ( not ( = ?auto_53274 ?auto_53276 ) ) ( not ( = ?auto_53275 ?auto_53276 ) ) ( ON ?auto_53274 ?auto_53275 ) ( ON ?auto_53273 ?auto_53274 ) ( ON ?auto_53272 ?auto_53273 ) ( ON ?auto_53271 ?auto_53272 ) ( ON ?auto_53270 ?auto_53271 ) ( CLEAR ?auto_53268 ) ( ON ?auto_53269 ?auto_53270 ) ( CLEAR ?auto_53269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53268 ?auto_53269 )
      ( MAKE-8PILE ?auto_53268 ?auto_53269 ?auto_53270 ?auto_53271 ?auto_53272 ?auto_53273 ?auto_53274 ?auto_53275 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53285 - BLOCK
      ?auto_53286 - BLOCK
      ?auto_53287 - BLOCK
      ?auto_53288 - BLOCK
      ?auto_53289 - BLOCK
      ?auto_53290 - BLOCK
      ?auto_53291 - BLOCK
      ?auto_53292 - BLOCK
    )
    :vars
    (
      ?auto_53293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53292 ?auto_53293 ) ( ON-TABLE ?auto_53285 ) ( not ( = ?auto_53285 ?auto_53286 ) ) ( not ( = ?auto_53285 ?auto_53287 ) ) ( not ( = ?auto_53285 ?auto_53288 ) ) ( not ( = ?auto_53285 ?auto_53289 ) ) ( not ( = ?auto_53285 ?auto_53290 ) ) ( not ( = ?auto_53285 ?auto_53291 ) ) ( not ( = ?auto_53285 ?auto_53292 ) ) ( not ( = ?auto_53285 ?auto_53293 ) ) ( not ( = ?auto_53286 ?auto_53287 ) ) ( not ( = ?auto_53286 ?auto_53288 ) ) ( not ( = ?auto_53286 ?auto_53289 ) ) ( not ( = ?auto_53286 ?auto_53290 ) ) ( not ( = ?auto_53286 ?auto_53291 ) ) ( not ( = ?auto_53286 ?auto_53292 ) ) ( not ( = ?auto_53286 ?auto_53293 ) ) ( not ( = ?auto_53287 ?auto_53288 ) ) ( not ( = ?auto_53287 ?auto_53289 ) ) ( not ( = ?auto_53287 ?auto_53290 ) ) ( not ( = ?auto_53287 ?auto_53291 ) ) ( not ( = ?auto_53287 ?auto_53292 ) ) ( not ( = ?auto_53287 ?auto_53293 ) ) ( not ( = ?auto_53288 ?auto_53289 ) ) ( not ( = ?auto_53288 ?auto_53290 ) ) ( not ( = ?auto_53288 ?auto_53291 ) ) ( not ( = ?auto_53288 ?auto_53292 ) ) ( not ( = ?auto_53288 ?auto_53293 ) ) ( not ( = ?auto_53289 ?auto_53290 ) ) ( not ( = ?auto_53289 ?auto_53291 ) ) ( not ( = ?auto_53289 ?auto_53292 ) ) ( not ( = ?auto_53289 ?auto_53293 ) ) ( not ( = ?auto_53290 ?auto_53291 ) ) ( not ( = ?auto_53290 ?auto_53292 ) ) ( not ( = ?auto_53290 ?auto_53293 ) ) ( not ( = ?auto_53291 ?auto_53292 ) ) ( not ( = ?auto_53291 ?auto_53293 ) ) ( not ( = ?auto_53292 ?auto_53293 ) ) ( ON ?auto_53291 ?auto_53292 ) ( ON ?auto_53290 ?auto_53291 ) ( ON ?auto_53289 ?auto_53290 ) ( ON ?auto_53288 ?auto_53289 ) ( ON ?auto_53287 ?auto_53288 ) ( CLEAR ?auto_53285 ) ( ON ?auto_53286 ?auto_53287 ) ( CLEAR ?auto_53286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53285 ?auto_53286 )
      ( MAKE-8PILE ?auto_53285 ?auto_53286 ?auto_53287 ?auto_53288 ?auto_53289 ?auto_53290 ?auto_53291 ?auto_53292 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53302 - BLOCK
      ?auto_53303 - BLOCK
      ?auto_53304 - BLOCK
      ?auto_53305 - BLOCK
      ?auto_53306 - BLOCK
      ?auto_53307 - BLOCK
      ?auto_53308 - BLOCK
      ?auto_53309 - BLOCK
    )
    :vars
    (
      ?auto_53310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53309 ?auto_53310 ) ( not ( = ?auto_53302 ?auto_53303 ) ) ( not ( = ?auto_53302 ?auto_53304 ) ) ( not ( = ?auto_53302 ?auto_53305 ) ) ( not ( = ?auto_53302 ?auto_53306 ) ) ( not ( = ?auto_53302 ?auto_53307 ) ) ( not ( = ?auto_53302 ?auto_53308 ) ) ( not ( = ?auto_53302 ?auto_53309 ) ) ( not ( = ?auto_53302 ?auto_53310 ) ) ( not ( = ?auto_53303 ?auto_53304 ) ) ( not ( = ?auto_53303 ?auto_53305 ) ) ( not ( = ?auto_53303 ?auto_53306 ) ) ( not ( = ?auto_53303 ?auto_53307 ) ) ( not ( = ?auto_53303 ?auto_53308 ) ) ( not ( = ?auto_53303 ?auto_53309 ) ) ( not ( = ?auto_53303 ?auto_53310 ) ) ( not ( = ?auto_53304 ?auto_53305 ) ) ( not ( = ?auto_53304 ?auto_53306 ) ) ( not ( = ?auto_53304 ?auto_53307 ) ) ( not ( = ?auto_53304 ?auto_53308 ) ) ( not ( = ?auto_53304 ?auto_53309 ) ) ( not ( = ?auto_53304 ?auto_53310 ) ) ( not ( = ?auto_53305 ?auto_53306 ) ) ( not ( = ?auto_53305 ?auto_53307 ) ) ( not ( = ?auto_53305 ?auto_53308 ) ) ( not ( = ?auto_53305 ?auto_53309 ) ) ( not ( = ?auto_53305 ?auto_53310 ) ) ( not ( = ?auto_53306 ?auto_53307 ) ) ( not ( = ?auto_53306 ?auto_53308 ) ) ( not ( = ?auto_53306 ?auto_53309 ) ) ( not ( = ?auto_53306 ?auto_53310 ) ) ( not ( = ?auto_53307 ?auto_53308 ) ) ( not ( = ?auto_53307 ?auto_53309 ) ) ( not ( = ?auto_53307 ?auto_53310 ) ) ( not ( = ?auto_53308 ?auto_53309 ) ) ( not ( = ?auto_53308 ?auto_53310 ) ) ( not ( = ?auto_53309 ?auto_53310 ) ) ( ON ?auto_53308 ?auto_53309 ) ( ON ?auto_53307 ?auto_53308 ) ( ON ?auto_53306 ?auto_53307 ) ( ON ?auto_53305 ?auto_53306 ) ( ON ?auto_53304 ?auto_53305 ) ( ON ?auto_53303 ?auto_53304 ) ( ON ?auto_53302 ?auto_53303 ) ( CLEAR ?auto_53302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53302 )
      ( MAKE-8PILE ?auto_53302 ?auto_53303 ?auto_53304 ?auto_53305 ?auto_53306 ?auto_53307 ?auto_53308 ?auto_53309 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_53319 - BLOCK
      ?auto_53320 - BLOCK
      ?auto_53321 - BLOCK
      ?auto_53322 - BLOCK
      ?auto_53323 - BLOCK
      ?auto_53324 - BLOCK
      ?auto_53325 - BLOCK
      ?auto_53326 - BLOCK
    )
    :vars
    (
      ?auto_53327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53326 ?auto_53327 ) ( not ( = ?auto_53319 ?auto_53320 ) ) ( not ( = ?auto_53319 ?auto_53321 ) ) ( not ( = ?auto_53319 ?auto_53322 ) ) ( not ( = ?auto_53319 ?auto_53323 ) ) ( not ( = ?auto_53319 ?auto_53324 ) ) ( not ( = ?auto_53319 ?auto_53325 ) ) ( not ( = ?auto_53319 ?auto_53326 ) ) ( not ( = ?auto_53319 ?auto_53327 ) ) ( not ( = ?auto_53320 ?auto_53321 ) ) ( not ( = ?auto_53320 ?auto_53322 ) ) ( not ( = ?auto_53320 ?auto_53323 ) ) ( not ( = ?auto_53320 ?auto_53324 ) ) ( not ( = ?auto_53320 ?auto_53325 ) ) ( not ( = ?auto_53320 ?auto_53326 ) ) ( not ( = ?auto_53320 ?auto_53327 ) ) ( not ( = ?auto_53321 ?auto_53322 ) ) ( not ( = ?auto_53321 ?auto_53323 ) ) ( not ( = ?auto_53321 ?auto_53324 ) ) ( not ( = ?auto_53321 ?auto_53325 ) ) ( not ( = ?auto_53321 ?auto_53326 ) ) ( not ( = ?auto_53321 ?auto_53327 ) ) ( not ( = ?auto_53322 ?auto_53323 ) ) ( not ( = ?auto_53322 ?auto_53324 ) ) ( not ( = ?auto_53322 ?auto_53325 ) ) ( not ( = ?auto_53322 ?auto_53326 ) ) ( not ( = ?auto_53322 ?auto_53327 ) ) ( not ( = ?auto_53323 ?auto_53324 ) ) ( not ( = ?auto_53323 ?auto_53325 ) ) ( not ( = ?auto_53323 ?auto_53326 ) ) ( not ( = ?auto_53323 ?auto_53327 ) ) ( not ( = ?auto_53324 ?auto_53325 ) ) ( not ( = ?auto_53324 ?auto_53326 ) ) ( not ( = ?auto_53324 ?auto_53327 ) ) ( not ( = ?auto_53325 ?auto_53326 ) ) ( not ( = ?auto_53325 ?auto_53327 ) ) ( not ( = ?auto_53326 ?auto_53327 ) ) ( ON ?auto_53325 ?auto_53326 ) ( ON ?auto_53324 ?auto_53325 ) ( ON ?auto_53323 ?auto_53324 ) ( ON ?auto_53322 ?auto_53323 ) ( ON ?auto_53321 ?auto_53322 ) ( ON ?auto_53320 ?auto_53321 ) ( ON ?auto_53319 ?auto_53320 ) ( CLEAR ?auto_53319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53319 )
      ( MAKE-8PILE ?auto_53319 ?auto_53320 ?auto_53321 ?auto_53322 ?auto_53323 ?auto_53324 ?auto_53325 ?auto_53326 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53337 - BLOCK
      ?auto_53338 - BLOCK
      ?auto_53339 - BLOCK
      ?auto_53340 - BLOCK
      ?auto_53341 - BLOCK
      ?auto_53342 - BLOCK
      ?auto_53343 - BLOCK
      ?auto_53344 - BLOCK
      ?auto_53345 - BLOCK
    )
    :vars
    (
      ?auto_53346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53344 ) ( ON ?auto_53345 ?auto_53346 ) ( CLEAR ?auto_53345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53337 ) ( ON ?auto_53338 ?auto_53337 ) ( ON ?auto_53339 ?auto_53338 ) ( ON ?auto_53340 ?auto_53339 ) ( ON ?auto_53341 ?auto_53340 ) ( ON ?auto_53342 ?auto_53341 ) ( ON ?auto_53343 ?auto_53342 ) ( ON ?auto_53344 ?auto_53343 ) ( not ( = ?auto_53337 ?auto_53338 ) ) ( not ( = ?auto_53337 ?auto_53339 ) ) ( not ( = ?auto_53337 ?auto_53340 ) ) ( not ( = ?auto_53337 ?auto_53341 ) ) ( not ( = ?auto_53337 ?auto_53342 ) ) ( not ( = ?auto_53337 ?auto_53343 ) ) ( not ( = ?auto_53337 ?auto_53344 ) ) ( not ( = ?auto_53337 ?auto_53345 ) ) ( not ( = ?auto_53337 ?auto_53346 ) ) ( not ( = ?auto_53338 ?auto_53339 ) ) ( not ( = ?auto_53338 ?auto_53340 ) ) ( not ( = ?auto_53338 ?auto_53341 ) ) ( not ( = ?auto_53338 ?auto_53342 ) ) ( not ( = ?auto_53338 ?auto_53343 ) ) ( not ( = ?auto_53338 ?auto_53344 ) ) ( not ( = ?auto_53338 ?auto_53345 ) ) ( not ( = ?auto_53338 ?auto_53346 ) ) ( not ( = ?auto_53339 ?auto_53340 ) ) ( not ( = ?auto_53339 ?auto_53341 ) ) ( not ( = ?auto_53339 ?auto_53342 ) ) ( not ( = ?auto_53339 ?auto_53343 ) ) ( not ( = ?auto_53339 ?auto_53344 ) ) ( not ( = ?auto_53339 ?auto_53345 ) ) ( not ( = ?auto_53339 ?auto_53346 ) ) ( not ( = ?auto_53340 ?auto_53341 ) ) ( not ( = ?auto_53340 ?auto_53342 ) ) ( not ( = ?auto_53340 ?auto_53343 ) ) ( not ( = ?auto_53340 ?auto_53344 ) ) ( not ( = ?auto_53340 ?auto_53345 ) ) ( not ( = ?auto_53340 ?auto_53346 ) ) ( not ( = ?auto_53341 ?auto_53342 ) ) ( not ( = ?auto_53341 ?auto_53343 ) ) ( not ( = ?auto_53341 ?auto_53344 ) ) ( not ( = ?auto_53341 ?auto_53345 ) ) ( not ( = ?auto_53341 ?auto_53346 ) ) ( not ( = ?auto_53342 ?auto_53343 ) ) ( not ( = ?auto_53342 ?auto_53344 ) ) ( not ( = ?auto_53342 ?auto_53345 ) ) ( not ( = ?auto_53342 ?auto_53346 ) ) ( not ( = ?auto_53343 ?auto_53344 ) ) ( not ( = ?auto_53343 ?auto_53345 ) ) ( not ( = ?auto_53343 ?auto_53346 ) ) ( not ( = ?auto_53344 ?auto_53345 ) ) ( not ( = ?auto_53344 ?auto_53346 ) ) ( not ( = ?auto_53345 ?auto_53346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53345 ?auto_53346 )
      ( !STACK ?auto_53345 ?auto_53344 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53356 - BLOCK
      ?auto_53357 - BLOCK
      ?auto_53358 - BLOCK
      ?auto_53359 - BLOCK
      ?auto_53360 - BLOCK
      ?auto_53361 - BLOCK
      ?auto_53362 - BLOCK
      ?auto_53363 - BLOCK
      ?auto_53364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53363 ) ( ON-TABLE ?auto_53364 ) ( CLEAR ?auto_53364 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53356 ) ( ON ?auto_53357 ?auto_53356 ) ( ON ?auto_53358 ?auto_53357 ) ( ON ?auto_53359 ?auto_53358 ) ( ON ?auto_53360 ?auto_53359 ) ( ON ?auto_53361 ?auto_53360 ) ( ON ?auto_53362 ?auto_53361 ) ( ON ?auto_53363 ?auto_53362 ) ( not ( = ?auto_53356 ?auto_53357 ) ) ( not ( = ?auto_53356 ?auto_53358 ) ) ( not ( = ?auto_53356 ?auto_53359 ) ) ( not ( = ?auto_53356 ?auto_53360 ) ) ( not ( = ?auto_53356 ?auto_53361 ) ) ( not ( = ?auto_53356 ?auto_53362 ) ) ( not ( = ?auto_53356 ?auto_53363 ) ) ( not ( = ?auto_53356 ?auto_53364 ) ) ( not ( = ?auto_53357 ?auto_53358 ) ) ( not ( = ?auto_53357 ?auto_53359 ) ) ( not ( = ?auto_53357 ?auto_53360 ) ) ( not ( = ?auto_53357 ?auto_53361 ) ) ( not ( = ?auto_53357 ?auto_53362 ) ) ( not ( = ?auto_53357 ?auto_53363 ) ) ( not ( = ?auto_53357 ?auto_53364 ) ) ( not ( = ?auto_53358 ?auto_53359 ) ) ( not ( = ?auto_53358 ?auto_53360 ) ) ( not ( = ?auto_53358 ?auto_53361 ) ) ( not ( = ?auto_53358 ?auto_53362 ) ) ( not ( = ?auto_53358 ?auto_53363 ) ) ( not ( = ?auto_53358 ?auto_53364 ) ) ( not ( = ?auto_53359 ?auto_53360 ) ) ( not ( = ?auto_53359 ?auto_53361 ) ) ( not ( = ?auto_53359 ?auto_53362 ) ) ( not ( = ?auto_53359 ?auto_53363 ) ) ( not ( = ?auto_53359 ?auto_53364 ) ) ( not ( = ?auto_53360 ?auto_53361 ) ) ( not ( = ?auto_53360 ?auto_53362 ) ) ( not ( = ?auto_53360 ?auto_53363 ) ) ( not ( = ?auto_53360 ?auto_53364 ) ) ( not ( = ?auto_53361 ?auto_53362 ) ) ( not ( = ?auto_53361 ?auto_53363 ) ) ( not ( = ?auto_53361 ?auto_53364 ) ) ( not ( = ?auto_53362 ?auto_53363 ) ) ( not ( = ?auto_53362 ?auto_53364 ) ) ( not ( = ?auto_53363 ?auto_53364 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_53364 )
      ( !STACK ?auto_53364 ?auto_53363 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53374 - BLOCK
      ?auto_53375 - BLOCK
      ?auto_53376 - BLOCK
      ?auto_53377 - BLOCK
      ?auto_53378 - BLOCK
      ?auto_53379 - BLOCK
      ?auto_53380 - BLOCK
      ?auto_53381 - BLOCK
      ?auto_53382 - BLOCK
    )
    :vars
    (
      ?auto_53383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53382 ?auto_53383 ) ( ON-TABLE ?auto_53374 ) ( ON ?auto_53375 ?auto_53374 ) ( ON ?auto_53376 ?auto_53375 ) ( ON ?auto_53377 ?auto_53376 ) ( ON ?auto_53378 ?auto_53377 ) ( ON ?auto_53379 ?auto_53378 ) ( ON ?auto_53380 ?auto_53379 ) ( not ( = ?auto_53374 ?auto_53375 ) ) ( not ( = ?auto_53374 ?auto_53376 ) ) ( not ( = ?auto_53374 ?auto_53377 ) ) ( not ( = ?auto_53374 ?auto_53378 ) ) ( not ( = ?auto_53374 ?auto_53379 ) ) ( not ( = ?auto_53374 ?auto_53380 ) ) ( not ( = ?auto_53374 ?auto_53381 ) ) ( not ( = ?auto_53374 ?auto_53382 ) ) ( not ( = ?auto_53374 ?auto_53383 ) ) ( not ( = ?auto_53375 ?auto_53376 ) ) ( not ( = ?auto_53375 ?auto_53377 ) ) ( not ( = ?auto_53375 ?auto_53378 ) ) ( not ( = ?auto_53375 ?auto_53379 ) ) ( not ( = ?auto_53375 ?auto_53380 ) ) ( not ( = ?auto_53375 ?auto_53381 ) ) ( not ( = ?auto_53375 ?auto_53382 ) ) ( not ( = ?auto_53375 ?auto_53383 ) ) ( not ( = ?auto_53376 ?auto_53377 ) ) ( not ( = ?auto_53376 ?auto_53378 ) ) ( not ( = ?auto_53376 ?auto_53379 ) ) ( not ( = ?auto_53376 ?auto_53380 ) ) ( not ( = ?auto_53376 ?auto_53381 ) ) ( not ( = ?auto_53376 ?auto_53382 ) ) ( not ( = ?auto_53376 ?auto_53383 ) ) ( not ( = ?auto_53377 ?auto_53378 ) ) ( not ( = ?auto_53377 ?auto_53379 ) ) ( not ( = ?auto_53377 ?auto_53380 ) ) ( not ( = ?auto_53377 ?auto_53381 ) ) ( not ( = ?auto_53377 ?auto_53382 ) ) ( not ( = ?auto_53377 ?auto_53383 ) ) ( not ( = ?auto_53378 ?auto_53379 ) ) ( not ( = ?auto_53378 ?auto_53380 ) ) ( not ( = ?auto_53378 ?auto_53381 ) ) ( not ( = ?auto_53378 ?auto_53382 ) ) ( not ( = ?auto_53378 ?auto_53383 ) ) ( not ( = ?auto_53379 ?auto_53380 ) ) ( not ( = ?auto_53379 ?auto_53381 ) ) ( not ( = ?auto_53379 ?auto_53382 ) ) ( not ( = ?auto_53379 ?auto_53383 ) ) ( not ( = ?auto_53380 ?auto_53381 ) ) ( not ( = ?auto_53380 ?auto_53382 ) ) ( not ( = ?auto_53380 ?auto_53383 ) ) ( not ( = ?auto_53381 ?auto_53382 ) ) ( not ( = ?auto_53381 ?auto_53383 ) ) ( not ( = ?auto_53382 ?auto_53383 ) ) ( CLEAR ?auto_53380 ) ( ON ?auto_53381 ?auto_53382 ) ( CLEAR ?auto_53381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_53374 ?auto_53375 ?auto_53376 ?auto_53377 ?auto_53378 ?auto_53379 ?auto_53380 ?auto_53381 )
      ( MAKE-9PILE ?auto_53374 ?auto_53375 ?auto_53376 ?auto_53377 ?auto_53378 ?auto_53379 ?auto_53380 ?auto_53381 ?auto_53382 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53393 - BLOCK
      ?auto_53394 - BLOCK
      ?auto_53395 - BLOCK
      ?auto_53396 - BLOCK
      ?auto_53397 - BLOCK
      ?auto_53398 - BLOCK
      ?auto_53399 - BLOCK
      ?auto_53400 - BLOCK
      ?auto_53401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53401 ) ( ON-TABLE ?auto_53393 ) ( ON ?auto_53394 ?auto_53393 ) ( ON ?auto_53395 ?auto_53394 ) ( ON ?auto_53396 ?auto_53395 ) ( ON ?auto_53397 ?auto_53396 ) ( ON ?auto_53398 ?auto_53397 ) ( ON ?auto_53399 ?auto_53398 ) ( not ( = ?auto_53393 ?auto_53394 ) ) ( not ( = ?auto_53393 ?auto_53395 ) ) ( not ( = ?auto_53393 ?auto_53396 ) ) ( not ( = ?auto_53393 ?auto_53397 ) ) ( not ( = ?auto_53393 ?auto_53398 ) ) ( not ( = ?auto_53393 ?auto_53399 ) ) ( not ( = ?auto_53393 ?auto_53400 ) ) ( not ( = ?auto_53393 ?auto_53401 ) ) ( not ( = ?auto_53394 ?auto_53395 ) ) ( not ( = ?auto_53394 ?auto_53396 ) ) ( not ( = ?auto_53394 ?auto_53397 ) ) ( not ( = ?auto_53394 ?auto_53398 ) ) ( not ( = ?auto_53394 ?auto_53399 ) ) ( not ( = ?auto_53394 ?auto_53400 ) ) ( not ( = ?auto_53394 ?auto_53401 ) ) ( not ( = ?auto_53395 ?auto_53396 ) ) ( not ( = ?auto_53395 ?auto_53397 ) ) ( not ( = ?auto_53395 ?auto_53398 ) ) ( not ( = ?auto_53395 ?auto_53399 ) ) ( not ( = ?auto_53395 ?auto_53400 ) ) ( not ( = ?auto_53395 ?auto_53401 ) ) ( not ( = ?auto_53396 ?auto_53397 ) ) ( not ( = ?auto_53396 ?auto_53398 ) ) ( not ( = ?auto_53396 ?auto_53399 ) ) ( not ( = ?auto_53396 ?auto_53400 ) ) ( not ( = ?auto_53396 ?auto_53401 ) ) ( not ( = ?auto_53397 ?auto_53398 ) ) ( not ( = ?auto_53397 ?auto_53399 ) ) ( not ( = ?auto_53397 ?auto_53400 ) ) ( not ( = ?auto_53397 ?auto_53401 ) ) ( not ( = ?auto_53398 ?auto_53399 ) ) ( not ( = ?auto_53398 ?auto_53400 ) ) ( not ( = ?auto_53398 ?auto_53401 ) ) ( not ( = ?auto_53399 ?auto_53400 ) ) ( not ( = ?auto_53399 ?auto_53401 ) ) ( not ( = ?auto_53400 ?auto_53401 ) ) ( CLEAR ?auto_53399 ) ( ON ?auto_53400 ?auto_53401 ) ( CLEAR ?auto_53400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_53393 ?auto_53394 ?auto_53395 ?auto_53396 ?auto_53397 ?auto_53398 ?auto_53399 ?auto_53400 )
      ( MAKE-9PILE ?auto_53393 ?auto_53394 ?auto_53395 ?auto_53396 ?auto_53397 ?auto_53398 ?auto_53399 ?auto_53400 ?auto_53401 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53411 - BLOCK
      ?auto_53412 - BLOCK
      ?auto_53413 - BLOCK
      ?auto_53414 - BLOCK
      ?auto_53415 - BLOCK
      ?auto_53416 - BLOCK
      ?auto_53417 - BLOCK
      ?auto_53418 - BLOCK
      ?auto_53419 - BLOCK
    )
    :vars
    (
      ?auto_53420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53419 ?auto_53420 ) ( ON-TABLE ?auto_53411 ) ( ON ?auto_53412 ?auto_53411 ) ( ON ?auto_53413 ?auto_53412 ) ( ON ?auto_53414 ?auto_53413 ) ( ON ?auto_53415 ?auto_53414 ) ( ON ?auto_53416 ?auto_53415 ) ( not ( = ?auto_53411 ?auto_53412 ) ) ( not ( = ?auto_53411 ?auto_53413 ) ) ( not ( = ?auto_53411 ?auto_53414 ) ) ( not ( = ?auto_53411 ?auto_53415 ) ) ( not ( = ?auto_53411 ?auto_53416 ) ) ( not ( = ?auto_53411 ?auto_53417 ) ) ( not ( = ?auto_53411 ?auto_53418 ) ) ( not ( = ?auto_53411 ?auto_53419 ) ) ( not ( = ?auto_53411 ?auto_53420 ) ) ( not ( = ?auto_53412 ?auto_53413 ) ) ( not ( = ?auto_53412 ?auto_53414 ) ) ( not ( = ?auto_53412 ?auto_53415 ) ) ( not ( = ?auto_53412 ?auto_53416 ) ) ( not ( = ?auto_53412 ?auto_53417 ) ) ( not ( = ?auto_53412 ?auto_53418 ) ) ( not ( = ?auto_53412 ?auto_53419 ) ) ( not ( = ?auto_53412 ?auto_53420 ) ) ( not ( = ?auto_53413 ?auto_53414 ) ) ( not ( = ?auto_53413 ?auto_53415 ) ) ( not ( = ?auto_53413 ?auto_53416 ) ) ( not ( = ?auto_53413 ?auto_53417 ) ) ( not ( = ?auto_53413 ?auto_53418 ) ) ( not ( = ?auto_53413 ?auto_53419 ) ) ( not ( = ?auto_53413 ?auto_53420 ) ) ( not ( = ?auto_53414 ?auto_53415 ) ) ( not ( = ?auto_53414 ?auto_53416 ) ) ( not ( = ?auto_53414 ?auto_53417 ) ) ( not ( = ?auto_53414 ?auto_53418 ) ) ( not ( = ?auto_53414 ?auto_53419 ) ) ( not ( = ?auto_53414 ?auto_53420 ) ) ( not ( = ?auto_53415 ?auto_53416 ) ) ( not ( = ?auto_53415 ?auto_53417 ) ) ( not ( = ?auto_53415 ?auto_53418 ) ) ( not ( = ?auto_53415 ?auto_53419 ) ) ( not ( = ?auto_53415 ?auto_53420 ) ) ( not ( = ?auto_53416 ?auto_53417 ) ) ( not ( = ?auto_53416 ?auto_53418 ) ) ( not ( = ?auto_53416 ?auto_53419 ) ) ( not ( = ?auto_53416 ?auto_53420 ) ) ( not ( = ?auto_53417 ?auto_53418 ) ) ( not ( = ?auto_53417 ?auto_53419 ) ) ( not ( = ?auto_53417 ?auto_53420 ) ) ( not ( = ?auto_53418 ?auto_53419 ) ) ( not ( = ?auto_53418 ?auto_53420 ) ) ( not ( = ?auto_53419 ?auto_53420 ) ) ( ON ?auto_53418 ?auto_53419 ) ( CLEAR ?auto_53416 ) ( ON ?auto_53417 ?auto_53418 ) ( CLEAR ?auto_53417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_53411 ?auto_53412 ?auto_53413 ?auto_53414 ?auto_53415 ?auto_53416 ?auto_53417 )
      ( MAKE-9PILE ?auto_53411 ?auto_53412 ?auto_53413 ?auto_53414 ?auto_53415 ?auto_53416 ?auto_53417 ?auto_53418 ?auto_53419 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53430 - BLOCK
      ?auto_53431 - BLOCK
      ?auto_53432 - BLOCK
      ?auto_53433 - BLOCK
      ?auto_53434 - BLOCK
      ?auto_53435 - BLOCK
      ?auto_53436 - BLOCK
      ?auto_53437 - BLOCK
      ?auto_53438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53438 ) ( ON-TABLE ?auto_53430 ) ( ON ?auto_53431 ?auto_53430 ) ( ON ?auto_53432 ?auto_53431 ) ( ON ?auto_53433 ?auto_53432 ) ( ON ?auto_53434 ?auto_53433 ) ( ON ?auto_53435 ?auto_53434 ) ( not ( = ?auto_53430 ?auto_53431 ) ) ( not ( = ?auto_53430 ?auto_53432 ) ) ( not ( = ?auto_53430 ?auto_53433 ) ) ( not ( = ?auto_53430 ?auto_53434 ) ) ( not ( = ?auto_53430 ?auto_53435 ) ) ( not ( = ?auto_53430 ?auto_53436 ) ) ( not ( = ?auto_53430 ?auto_53437 ) ) ( not ( = ?auto_53430 ?auto_53438 ) ) ( not ( = ?auto_53431 ?auto_53432 ) ) ( not ( = ?auto_53431 ?auto_53433 ) ) ( not ( = ?auto_53431 ?auto_53434 ) ) ( not ( = ?auto_53431 ?auto_53435 ) ) ( not ( = ?auto_53431 ?auto_53436 ) ) ( not ( = ?auto_53431 ?auto_53437 ) ) ( not ( = ?auto_53431 ?auto_53438 ) ) ( not ( = ?auto_53432 ?auto_53433 ) ) ( not ( = ?auto_53432 ?auto_53434 ) ) ( not ( = ?auto_53432 ?auto_53435 ) ) ( not ( = ?auto_53432 ?auto_53436 ) ) ( not ( = ?auto_53432 ?auto_53437 ) ) ( not ( = ?auto_53432 ?auto_53438 ) ) ( not ( = ?auto_53433 ?auto_53434 ) ) ( not ( = ?auto_53433 ?auto_53435 ) ) ( not ( = ?auto_53433 ?auto_53436 ) ) ( not ( = ?auto_53433 ?auto_53437 ) ) ( not ( = ?auto_53433 ?auto_53438 ) ) ( not ( = ?auto_53434 ?auto_53435 ) ) ( not ( = ?auto_53434 ?auto_53436 ) ) ( not ( = ?auto_53434 ?auto_53437 ) ) ( not ( = ?auto_53434 ?auto_53438 ) ) ( not ( = ?auto_53435 ?auto_53436 ) ) ( not ( = ?auto_53435 ?auto_53437 ) ) ( not ( = ?auto_53435 ?auto_53438 ) ) ( not ( = ?auto_53436 ?auto_53437 ) ) ( not ( = ?auto_53436 ?auto_53438 ) ) ( not ( = ?auto_53437 ?auto_53438 ) ) ( ON ?auto_53437 ?auto_53438 ) ( CLEAR ?auto_53435 ) ( ON ?auto_53436 ?auto_53437 ) ( CLEAR ?auto_53436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_53430 ?auto_53431 ?auto_53432 ?auto_53433 ?auto_53434 ?auto_53435 ?auto_53436 )
      ( MAKE-9PILE ?auto_53430 ?auto_53431 ?auto_53432 ?auto_53433 ?auto_53434 ?auto_53435 ?auto_53436 ?auto_53437 ?auto_53438 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53448 - BLOCK
      ?auto_53449 - BLOCK
      ?auto_53450 - BLOCK
      ?auto_53451 - BLOCK
      ?auto_53452 - BLOCK
      ?auto_53453 - BLOCK
      ?auto_53454 - BLOCK
      ?auto_53455 - BLOCK
      ?auto_53456 - BLOCK
    )
    :vars
    (
      ?auto_53457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53456 ?auto_53457 ) ( ON-TABLE ?auto_53448 ) ( ON ?auto_53449 ?auto_53448 ) ( ON ?auto_53450 ?auto_53449 ) ( ON ?auto_53451 ?auto_53450 ) ( ON ?auto_53452 ?auto_53451 ) ( not ( = ?auto_53448 ?auto_53449 ) ) ( not ( = ?auto_53448 ?auto_53450 ) ) ( not ( = ?auto_53448 ?auto_53451 ) ) ( not ( = ?auto_53448 ?auto_53452 ) ) ( not ( = ?auto_53448 ?auto_53453 ) ) ( not ( = ?auto_53448 ?auto_53454 ) ) ( not ( = ?auto_53448 ?auto_53455 ) ) ( not ( = ?auto_53448 ?auto_53456 ) ) ( not ( = ?auto_53448 ?auto_53457 ) ) ( not ( = ?auto_53449 ?auto_53450 ) ) ( not ( = ?auto_53449 ?auto_53451 ) ) ( not ( = ?auto_53449 ?auto_53452 ) ) ( not ( = ?auto_53449 ?auto_53453 ) ) ( not ( = ?auto_53449 ?auto_53454 ) ) ( not ( = ?auto_53449 ?auto_53455 ) ) ( not ( = ?auto_53449 ?auto_53456 ) ) ( not ( = ?auto_53449 ?auto_53457 ) ) ( not ( = ?auto_53450 ?auto_53451 ) ) ( not ( = ?auto_53450 ?auto_53452 ) ) ( not ( = ?auto_53450 ?auto_53453 ) ) ( not ( = ?auto_53450 ?auto_53454 ) ) ( not ( = ?auto_53450 ?auto_53455 ) ) ( not ( = ?auto_53450 ?auto_53456 ) ) ( not ( = ?auto_53450 ?auto_53457 ) ) ( not ( = ?auto_53451 ?auto_53452 ) ) ( not ( = ?auto_53451 ?auto_53453 ) ) ( not ( = ?auto_53451 ?auto_53454 ) ) ( not ( = ?auto_53451 ?auto_53455 ) ) ( not ( = ?auto_53451 ?auto_53456 ) ) ( not ( = ?auto_53451 ?auto_53457 ) ) ( not ( = ?auto_53452 ?auto_53453 ) ) ( not ( = ?auto_53452 ?auto_53454 ) ) ( not ( = ?auto_53452 ?auto_53455 ) ) ( not ( = ?auto_53452 ?auto_53456 ) ) ( not ( = ?auto_53452 ?auto_53457 ) ) ( not ( = ?auto_53453 ?auto_53454 ) ) ( not ( = ?auto_53453 ?auto_53455 ) ) ( not ( = ?auto_53453 ?auto_53456 ) ) ( not ( = ?auto_53453 ?auto_53457 ) ) ( not ( = ?auto_53454 ?auto_53455 ) ) ( not ( = ?auto_53454 ?auto_53456 ) ) ( not ( = ?auto_53454 ?auto_53457 ) ) ( not ( = ?auto_53455 ?auto_53456 ) ) ( not ( = ?auto_53455 ?auto_53457 ) ) ( not ( = ?auto_53456 ?auto_53457 ) ) ( ON ?auto_53455 ?auto_53456 ) ( ON ?auto_53454 ?auto_53455 ) ( CLEAR ?auto_53452 ) ( ON ?auto_53453 ?auto_53454 ) ( CLEAR ?auto_53453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53448 ?auto_53449 ?auto_53450 ?auto_53451 ?auto_53452 ?auto_53453 )
      ( MAKE-9PILE ?auto_53448 ?auto_53449 ?auto_53450 ?auto_53451 ?auto_53452 ?auto_53453 ?auto_53454 ?auto_53455 ?auto_53456 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53467 - BLOCK
      ?auto_53468 - BLOCK
      ?auto_53469 - BLOCK
      ?auto_53470 - BLOCK
      ?auto_53471 - BLOCK
      ?auto_53472 - BLOCK
      ?auto_53473 - BLOCK
      ?auto_53474 - BLOCK
      ?auto_53475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53475 ) ( ON-TABLE ?auto_53467 ) ( ON ?auto_53468 ?auto_53467 ) ( ON ?auto_53469 ?auto_53468 ) ( ON ?auto_53470 ?auto_53469 ) ( ON ?auto_53471 ?auto_53470 ) ( not ( = ?auto_53467 ?auto_53468 ) ) ( not ( = ?auto_53467 ?auto_53469 ) ) ( not ( = ?auto_53467 ?auto_53470 ) ) ( not ( = ?auto_53467 ?auto_53471 ) ) ( not ( = ?auto_53467 ?auto_53472 ) ) ( not ( = ?auto_53467 ?auto_53473 ) ) ( not ( = ?auto_53467 ?auto_53474 ) ) ( not ( = ?auto_53467 ?auto_53475 ) ) ( not ( = ?auto_53468 ?auto_53469 ) ) ( not ( = ?auto_53468 ?auto_53470 ) ) ( not ( = ?auto_53468 ?auto_53471 ) ) ( not ( = ?auto_53468 ?auto_53472 ) ) ( not ( = ?auto_53468 ?auto_53473 ) ) ( not ( = ?auto_53468 ?auto_53474 ) ) ( not ( = ?auto_53468 ?auto_53475 ) ) ( not ( = ?auto_53469 ?auto_53470 ) ) ( not ( = ?auto_53469 ?auto_53471 ) ) ( not ( = ?auto_53469 ?auto_53472 ) ) ( not ( = ?auto_53469 ?auto_53473 ) ) ( not ( = ?auto_53469 ?auto_53474 ) ) ( not ( = ?auto_53469 ?auto_53475 ) ) ( not ( = ?auto_53470 ?auto_53471 ) ) ( not ( = ?auto_53470 ?auto_53472 ) ) ( not ( = ?auto_53470 ?auto_53473 ) ) ( not ( = ?auto_53470 ?auto_53474 ) ) ( not ( = ?auto_53470 ?auto_53475 ) ) ( not ( = ?auto_53471 ?auto_53472 ) ) ( not ( = ?auto_53471 ?auto_53473 ) ) ( not ( = ?auto_53471 ?auto_53474 ) ) ( not ( = ?auto_53471 ?auto_53475 ) ) ( not ( = ?auto_53472 ?auto_53473 ) ) ( not ( = ?auto_53472 ?auto_53474 ) ) ( not ( = ?auto_53472 ?auto_53475 ) ) ( not ( = ?auto_53473 ?auto_53474 ) ) ( not ( = ?auto_53473 ?auto_53475 ) ) ( not ( = ?auto_53474 ?auto_53475 ) ) ( ON ?auto_53474 ?auto_53475 ) ( ON ?auto_53473 ?auto_53474 ) ( CLEAR ?auto_53471 ) ( ON ?auto_53472 ?auto_53473 ) ( CLEAR ?auto_53472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53467 ?auto_53468 ?auto_53469 ?auto_53470 ?auto_53471 ?auto_53472 )
      ( MAKE-9PILE ?auto_53467 ?auto_53468 ?auto_53469 ?auto_53470 ?auto_53471 ?auto_53472 ?auto_53473 ?auto_53474 ?auto_53475 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53485 - BLOCK
      ?auto_53486 - BLOCK
      ?auto_53487 - BLOCK
      ?auto_53488 - BLOCK
      ?auto_53489 - BLOCK
      ?auto_53490 - BLOCK
      ?auto_53491 - BLOCK
      ?auto_53492 - BLOCK
      ?auto_53493 - BLOCK
    )
    :vars
    (
      ?auto_53494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53493 ?auto_53494 ) ( ON-TABLE ?auto_53485 ) ( ON ?auto_53486 ?auto_53485 ) ( ON ?auto_53487 ?auto_53486 ) ( ON ?auto_53488 ?auto_53487 ) ( not ( = ?auto_53485 ?auto_53486 ) ) ( not ( = ?auto_53485 ?auto_53487 ) ) ( not ( = ?auto_53485 ?auto_53488 ) ) ( not ( = ?auto_53485 ?auto_53489 ) ) ( not ( = ?auto_53485 ?auto_53490 ) ) ( not ( = ?auto_53485 ?auto_53491 ) ) ( not ( = ?auto_53485 ?auto_53492 ) ) ( not ( = ?auto_53485 ?auto_53493 ) ) ( not ( = ?auto_53485 ?auto_53494 ) ) ( not ( = ?auto_53486 ?auto_53487 ) ) ( not ( = ?auto_53486 ?auto_53488 ) ) ( not ( = ?auto_53486 ?auto_53489 ) ) ( not ( = ?auto_53486 ?auto_53490 ) ) ( not ( = ?auto_53486 ?auto_53491 ) ) ( not ( = ?auto_53486 ?auto_53492 ) ) ( not ( = ?auto_53486 ?auto_53493 ) ) ( not ( = ?auto_53486 ?auto_53494 ) ) ( not ( = ?auto_53487 ?auto_53488 ) ) ( not ( = ?auto_53487 ?auto_53489 ) ) ( not ( = ?auto_53487 ?auto_53490 ) ) ( not ( = ?auto_53487 ?auto_53491 ) ) ( not ( = ?auto_53487 ?auto_53492 ) ) ( not ( = ?auto_53487 ?auto_53493 ) ) ( not ( = ?auto_53487 ?auto_53494 ) ) ( not ( = ?auto_53488 ?auto_53489 ) ) ( not ( = ?auto_53488 ?auto_53490 ) ) ( not ( = ?auto_53488 ?auto_53491 ) ) ( not ( = ?auto_53488 ?auto_53492 ) ) ( not ( = ?auto_53488 ?auto_53493 ) ) ( not ( = ?auto_53488 ?auto_53494 ) ) ( not ( = ?auto_53489 ?auto_53490 ) ) ( not ( = ?auto_53489 ?auto_53491 ) ) ( not ( = ?auto_53489 ?auto_53492 ) ) ( not ( = ?auto_53489 ?auto_53493 ) ) ( not ( = ?auto_53489 ?auto_53494 ) ) ( not ( = ?auto_53490 ?auto_53491 ) ) ( not ( = ?auto_53490 ?auto_53492 ) ) ( not ( = ?auto_53490 ?auto_53493 ) ) ( not ( = ?auto_53490 ?auto_53494 ) ) ( not ( = ?auto_53491 ?auto_53492 ) ) ( not ( = ?auto_53491 ?auto_53493 ) ) ( not ( = ?auto_53491 ?auto_53494 ) ) ( not ( = ?auto_53492 ?auto_53493 ) ) ( not ( = ?auto_53492 ?auto_53494 ) ) ( not ( = ?auto_53493 ?auto_53494 ) ) ( ON ?auto_53492 ?auto_53493 ) ( ON ?auto_53491 ?auto_53492 ) ( ON ?auto_53490 ?auto_53491 ) ( CLEAR ?auto_53488 ) ( ON ?auto_53489 ?auto_53490 ) ( CLEAR ?auto_53489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53485 ?auto_53486 ?auto_53487 ?auto_53488 ?auto_53489 )
      ( MAKE-9PILE ?auto_53485 ?auto_53486 ?auto_53487 ?auto_53488 ?auto_53489 ?auto_53490 ?auto_53491 ?auto_53492 ?auto_53493 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53504 - BLOCK
      ?auto_53505 - BLOCK
      ?auto_53506 - BLOCK
      ?auto_53507 - BLOCK
      ?auto_53508 - BLOCK
      ?auto_53509 - BLOCK
      ?auto_53510 - BLOCK
      ?auto_53511 - BLOCK
      ?auto_53512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53512 ) ( ON-TABLE ?auto_53504 ) ( ON ?auto_53505 ?auto_53504 ) ( ON ?auto_53506 ?auto_53505 ) ( ON ?auto_53507 ?auto_53506 ) ( not ( = ?auto_53504 ?auto_53505 ) ) ( not ( = ?auto_53504 ?auto_53506 ) ) ( not ( = ?auto_53504 ?auto_53507 ) ) ( not ( = ?auto_53504 ?auto_53508 ) ) ( not ( = ?auto_53504 ?auto_53509 ) ) ( not ( = ?auto_53504 ?auto_53510 ) ) ( not ( = ?auto_53504 ?auto_53511 ) ) ( not ( = ?auto_53504 ?auto_53512 ) ) ( not ( = ?auto_53505 ?auto_53506 ) ) ( not ( = ?auto_53505 ?auto_53507 ) ) ( not ( = ?auto_53505 ?auto_53508 ) ) ( not ( = ?auto_53505 ?auto_53509 ) ) ( not ( = ?auto_53505 ?auto_53510 ) ) ( not ( = ?auto_53505 ?auto_53511 ) ) ( not ( = ?auto_53505 ?auto_53512 ) ) ( not ( = ?auto_53506 ?auto_53507 ) ) ( not ( = ?auto_53506 ?auto_53508 ) ) ( not ( = ?auto_53506 ?auto_53509 ) ) ( not ( = ?auto_53506 ?auto_53510 ) ) ( not ( = ?auto_53506 ?auto_53511 ) ) ( not ( = ?auto_53506 ?auto_53512 ) ) ( not ( = ?auto_53507 ?auto_53508 ) ) ( not ( = ?auto_53507 ?auto_53509 ) ) ( not ( = ?auto_53507 ?auto_53510 ) ) ( not ( = ?auto_53507 ?auto_53511 ) ) ( not ( = ?auto_53507 ?auto_53512 ) ) ( not ( = ?auto_53508 ?auto_53509 ) ) ( not ( = ?auto_53508 ?auto_53510 ) ) ( not ( = ?auto_53508 ?auto_53511 ) ) ( not ( = ?auto_53508 ?auto_53512 ) ) ( not ( = ?auto_53509 ?auto_53510 ) ) ( not ( = ?auto_53509 ?auto_53511 ) ) ( not ( = ?auto_53509 ?auto_53512 ) ) ( not ( = ?auto_53510 ?auto_53511 ) ) ( not ( = ?auto_53510 ?auto_53512 ) ) ( not ( = ?auto_53511 ?auto_53512 ) ) ( ON ?auto_53511 ?auto_53512 ) ( ON ?auto_53510 ?auto_53511 ) ( ON ?auto_53509 ?auto_53510 ) ( CLEAR ?auto_53507 ) ( ON ?auto_53508 ?auto_53509 ) ( CLEAR ?auto_53508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53504 ?auto_53505 ?auto_53506 ?auto_53507 ?auto_53508 )
      ( MAKE-9PILE ?auto_53504 ?auto_53505 ?auto_53506 ?auto_53507 ?auto_53508 ?auto_53509 ?auto_53510 ?auto_53511 ?auto_53512 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53522 - BLOCK
      ?auto_53523 - BLOCK
      ?auto_53524 - BLOCK
      ?auto_53525 - BLOCK
      ?auto_53526 - BLOCK
      ?auto_53527 - BLOCK
      ?auto_53528 - BLOCK
      ?auto_53529 - BLOCK
      ?auto_53530 - BLOCK
    )
    :vars
    (
      ?auto_53531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53530 ?auto_53531 ) ( ON-TABLE ?auto_53522 ) ( ON ?auto_53523 ?auto_53522 ) ( ON ?auto_53524 ?auto_53523 ) ( not ( = ?auto_53522 ?auto_53523 ) ) ( not ( = ?auto_53522 ?auto_53524 ) ) ( not ( = ?auto_53522 ?auto_53525 ) ) ( not ( = ?auto_53522 ?auto_53526 ) ) ( not ( = ?auto_53522 ?auto_53527 ) ) ( not ( = ?auto_53522 ?auto_53528 ) ) ( not ( = ?auto_53522 ?auto_53529 ) ) ( not ( = ?auto_53522 ?auto_53530 ) ) ( not ( = ?auto_53522 ?auto_53531 ) ) ( not ( = ?auto_53523 ?auto_53524 ) ) ( not ( = ?auto_53523 ?auto_53525 ) ) ( not ( = ?auto_53523 ?auto_53526 ) ) ( not ( = ?auto_53523 ?auto_53527 ) ) ( not ( = ?auto_53523 ?auto_53528 ) ) ( not ( = ?auto_53523 ?auto_53529 ) ) ( not ( = ?auto_53523 ?auto_53530 ) ) ( not ( = ?auto_53523 ?auto_53531 ) ) ( not ( = ?auto_53524 ?auto_53525 ) ) ( not ( = ?auto_53524 ?auto_53526 ) ) ( not ( = ?auto_53524 ?auto_53527 ) ) ( not ( = ?auto_53524 ?auto_53528 ) ) ( not ( = ?auto_53524 ?auto_53529 ) ) ( not ( = ?auto_53524 ?auto_53530 ) ) ( not ( = ?auto_53524 ?auto_53531 ) ) ( not ( = ?auto_53525 ?auto_53526 ) ) ( not ( = ?auto_53525 ?auto_53527 ) ) ( not ( = ?auto_53525 ?auto_53528 ) ) ( not ( = ?auto_53525 ?auto_53529 ) ) ( not ( = ?auto_53525 ?auto_53530 ) ) ( not ( = ?auto_53525 ?auto_53531 ) ) ( not ( = ?auto_53526 ?auto_53527 ) ) ( not ( = ?auto_53526 ?auto_53528 ) ) ( not ( = ?auto_53526 ?auto_53529 ) ) ( not ( = ?auto_53526 ?auto_53530 ) ) ( not ( = ?auto_53526 ?auto_53531 ) ) ( not ( = ?auto_53527 ?auto_53528 ) ) ( not ( = ?auto_53527 ?auto_53529 ) ) ( not ( = ?auto_53527 ?auto_53530 ) ) ( not ( = ?auto_53527 ?auto_53531 ) ) ( not ( = ?auto_53528 ?auto_53529 ) ) ( not ( = ?auto_53528 ?auto_53530 ) ) ( not ( = ?auto_53528 ?auto_53531 ) ) ( not ( = ?auto_53529 ?auto_53530 ) ) ( not ( = ?auto_53529 ?auto_53531 ) ) ( not ( = ?auto_53530 ?auto_53531 ) ) ( ON ?auto_53529 ?auto_53530 ) ( ON ?auto_53528 ?auto_53529 ) ( ON ?auto_53527 ?auto_53528 ) ( ON ?auto_53526 ?auto_53527 ) ( CLEAR ?auto_53524 ) ( ON ?auto_53525 ?auto_53526 ) ( CLEAR ?auto_53525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53522 ?auto_53523 ?auto_53524 ?auto_53525 )
      ( MAKE-9PILE ?auto_53522 ?auto_53523 ?auto_53524 ?auto_53525 ?auto_53526 ?auto_53527 ?auto_53528 ?auto_53529 ?auto_53530 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53541 - BLOCK
      ?auto_53542 - BLOCK
      ?auto_53543 - BLOCK
      ?auto_53544 - BLOCK
      ?auto_53545 - BLOCK
      ?auto_53546 - BLOCK
      ?auto_53547 - BLOCK
      ?auto_53548 - BLOCK
      ?auto_53549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53549 ) ( ON-TABLE ?auto_53541 ) ( ON ?auto_53542 ?auto_53541 ) ( ON ?auto_53543 ?auto_53542 ) ( not ( = ?auto_53541 ?auto_53542 ) ) ( not ( = ?auto_53541 ?auto_53543 ) ) ( not ( = ?auto_53541 ?auto_53544 ) ) ( not ( = ?auto_53541 ?auto_53545 ) ) ( not ( = ?auto_53541 ?auto_53546 ) ) ( not ( = ?auto_53541 ?auto_53547 ) ) ( not ( = ?auto_53541 ?auto_53548 ) ) ( not ( = ?auto_53541 ?auto_53549 ) ) ( not ( = ?auto_53542 ?auto_53543 ) ) ( not ( = ?auto_53542 ?auto_53544 ) ) ( not ( = ?auto_53542 ?auto_53545 ) ) ( not ( = ?auto_53542 ?auto_53546 ) ) ( not ( = ?auto_53542 ?auto_53547 ) ) ( not ( = ?auto_53542 ?auto_53548 ) ) ( not ( = ?auto_53542 ?auto_53549 ) ) ( not ( = ?auto_53543 ?auto_53544 ) ) ( not ( = ?auto_53543 ?auto_53545 ) ) ( not ( = ?auto_53543 ?auto_53546 ) ) ( not ( = ?auto_53543 ?auto_53547 ) ) ( not ( = ?auto_53543 ?auto_53548 ) ) ( not ( = ?auto_53543 ?auto_53549 ) ) ( not ( = ?auto_53544 ?auto_53545 ) ) ( not ( = ?auto_53544 ?auto_53546 ) ) ( not ( = ?auto_53544 ?auto_53547 ) ) ( not ( = ?auto_53544 ?auto_53548 ) ) ( not ( = ?auto_53544 ?auto_53549 ) ) ( not ( = ?auto_53545 ?auto_53546 ) ) ( not ( = ?auto_53545 ?auto_53547 ) ) ( not ( = ?auto_53545 ?auto_53548 ) ) ( not ( = ?auto_53545 ?auto_53549 ) ) ( not ( = ?auto_53546 ?auto_53547 ) ) ( not ( = ?auto_53546 ?auto_53548 ) ) ( not ( = ?auto_53546 ?auto_53549 ) ) ( not ( = ?auto_53547 ?auto_53548 ) ) ( not ( = ?auto_53547 ?auto_53549 ) ) ( not ( = ?auto_53548 ?auto_53549 ) ) ( ON ?auto_53548 ?auto_53549 ) ( ON ?auto_53547 ?auto_53548 ) ( ON ?auto_53546 ?auto_53547 ) ( ON ?auto_53545 ?auto_53546 ) ( CLEAR ?auto_53543 ) ( ON ?auto_53544 ?auto_53545 ) ( CLEAR ?auto_53544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53541 ?auto_53542 ?auto_53543 ?auto_53544 )
      ( MAKE-9PILE ?auto_53541 ?auto_53542 ?auto_53543 ?auto_53544 ?auto_53545 ?auto_53546 ?auto_53547 ?auto_53548 ?auto_53549 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53559 - BLOCK
      ?auto_53560 - BLOCK
      ?auto_53561 - BLOCK
      ?auto_53562 - BLOCK
      ?auto_53563 - BLOCK
      ?auto_53564 - BLOCK
      ?auto_53565 - BLOCK
      ?auto_53566 - BLOCK
      ?auto_53567 - BLOCK
    )
    :vars
    (
      ?auto_53568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53567 ?auto_53568 ) ( ON-TABLE ?auto_53559 ) ( ON ?auto_53560 ?auto_53559 ) ( not ( = ?auto_53559 ?auto_53560 ) ) ( not ( = ?auto_53559 ?auto_53561 ) ) ( not ( = ?auto_53559 ?auto_53562 ) ) ( not ( = ?auto_53559 ?auto_53563 ) ) ( not ( = ?auto_53559 ?auto_53564 ) ) ( not ( = ?auto_53559 ?auto_53565 ) ) ( not ( = ?auto_53559 ?auto_53566 ) ) ( not ( = ?auto_53559 ?auto_53567 ) ) ( not ( = ?auto_53559 ?auto_53568 ) ) ( not ( = ?auto_53560 ?auto_53561 ) ) ( not ( = ?auto_53560 ?auto_53562 ) ) ( not ( = ?auto_53560 ?auto_53563 ) ) ( not ( = ?auto_53560 ?auto_53564 ) ) ( not ( = ?auto_53560 ?auto_53565 ) ) ( not ( = ?auto_53560 ?auto_53566 ) ) ( not ( = ?auto_53560 ?auto_53567 ) ) ( not ( = ?auto_53560 ?auto_53568 ) ) ( not ( = ?auto_53561 ?auto_53562 ) ) ( not ( = ?auto_53561 ?auto_53563 ) ) ( not ( = ?auto_53561 ?auto_53564 ) ) ( not ( = ?auto_53561 ?auto_53565 ) ) ( not ( = ?auto_53561 ?auto_53566 ) ) ( not ( = ?auto_53561 ?auto_53567 ) ) ( not ( = ?auto_53561 ?auto_53568 ) ) ( not ( = ?auto_53562 ?auto_53563 ) ) ( not ( = ?auto_53562 ?auto_53564 ) ) ( not ( = ?auto_53562 ?auto_53565 ) ) ( not ( = ?auto_53562 ?auto_53566 ) ) ( not ( = ?auto_53562 ?auto_53567 ) ) ( not ( = ?auto_53562 ?auto_53568 ) ) ( not ( = ?auto_53563 ?auto_53564 ) ) ( not ( = ?auto_53563 ?auto_53565 ) ) ( not ( = ?auto_53563 ?auto_53566 ) ) ( not ( = ?auto_53563 ?auto_53567 ) ) ( not ( = ?auto_53563 ?auto_53568 ) ) ( not ( = ?auto_53564 ?auto_53565 ) ) ( not ( = ?auto_53564 ?auto_53566 ) ) ( not ( = ?auto_53564 ?auto_53567 ) ) ( not ( = ?auto_53564 ?auto_53568 ) ) ( not ( = ?auto_53565 ?auto_53566 ) ) ( not ( = ?auto_53565 ?auto_53567 ) ) ( not ( = ?auto_53565 ?auto_53568 ) ) ( not ( = ?auto_53566 ?auto_53567 ) ) ( not ( = ?auto_53566 ?auto_53568 ) ) ( not ( = ?auto_53567 ?auto_53568 ) ) ( ON ?auto_53566 ?auto_53567 ) ( ON ?auto_53565 ?auto_53566 ) ( ON ?auto_53564 ?auto_53565 ) ( ON ?auto_53563 ?auto_53564 ) ( ON ?auto_53562 ?auto_53563 ) ( CLEAR ?auto_53560 ) ( ON ?auto_53561 ?auto_53562 ) ( CLEAR ?auto_53561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53559 ?auto_53560 ?auto_53561 )
      ( MAKE-9PILE ?auto_53559 ?auto_53560 ?auto_53561 ?auto_53562 ?auto_53563 ?auto_53564 ?auto_53565 ?auto_53566 ?auto_53567 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53578 - BLOCK
      ?auto_53579 - BLOCK
      ?auto_53580 - BLOCK
      ?auto_53581 - BLOCK
      ?auto_53582 - BLOCK
      ?auto_53583 - BLOCK
      ?auto_53584 - BLOCK
      ?auto_53585 - BLOCK
      ?auto_53586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53586 ) ( ON-TABLE ?auto_53578 ) ( ON ?auto_53579 ?auto_53578 ) ( not ( = ?auto_53578 ?auto_53579 ) ) ( not ( = ?auto_53578 ?auto_53580 ) ) ( not ( = ?auto_53578 ?auto_53581 ) ) ( not ( = ?auto_53578 ?auto_53582 ) ) ( not ( = ?auto_53578 ?auto_53583 ) ) ( not ( = ?auto_53578 ?auto_53584 ) ) ( not ( = ?auto_53578 ?auto_53585 ) ) ( not ( = ?auto_53578 ?auto_53586 ) ) ( not ( = ?auto_53579 ?auto_53580 ) ) ( not ( = ?auto_53579 ?auto_53581 ) ) ( not ( = ?auto_53579 ?auto_53582 ) ) ( not ( = ?auto_53579 ?auto_53583 ) ) ( not ( = ?auto_53579 ?auto_53584 ) ) ( not ( = ?auto_53579 ?auto_53585 ) ) ( not ( = ?auto_53579 ?auto_53586 ) ) ( not ( = ?auto_53580 ?auto_53581 ) ) ( not ( = ?auto_53580 ?auto_53582 ) ) ( not ( = ?auto_53580 ?auto_53583 ) ) ( not ( = ?auto_53580 ?auto_53584 ) ) ( not ( = ?auto_53580 ?auto_53585 ) ) ( not ( = ?auto_53580 ?auto_53586 ) ) ( not ( = ?auto_53581 ?auto_53582 ) ) ( not ( = ?auto_53581 ?auto_53583 ) ) ( not ( = ?auto_53581 ?auto_53584 ) ) ( not ( = ?auto_53581 ?auto_53585 ) ) ( not ( = ?auto_53581 ?auto_53586 ) ) ( not ( = ?auto_53582 ?auto_53583 ) ) ( not ( = ?auto_53582 ?auto_53584 ) ) ( not ( = ?auto_53582 ?auto_53585 ) ) ( not ( = ?auto_53582 ?auto_53586 ) ) ( not ( = ?auto_53583 ?auto_53584 ) ) ( not ( = ?auto_53583 ?auto_53585 ) ) ( not ( = ?auto_53583 ?auto_53586 ) ) ( not ( = ?auto_53584 ?auto_53585 ) ) ( not ( = ?auto_53584 ?auto_53586 ) ) ( not ( = ?auto_53585 ?auto_53586 ) ) ( ON ?auto_53585 ?auto_53586 ) ( ON ?auto_53584 ?auto_53585 ) ( ON ?auto_53583 ?auto_53584 ) ( ON ?auto_53582 ?auto_53583 ) ( ON ?auto_53581 ?auto_53582 ) ( CLEAR ?auto_53579 ) ( ON ?auto_53580 ?auto_53581 ) ( CLEAR ?auto_53580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53578 ?auto_53579 ?auto_53580 )
      ( MAKE-9PILE ?auto_53578 ?auto_53579 ?auto_53580 ?auto_53581 ?auto_53582 ?auto_53583 ?auto_53584 ?auto_53585 ?auto_53586 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53596 - BLOCK
      ?auto_53597 - BLOCK
      ?auto_53598 - BLOCK
      ?auto_53599 - BLOCK
      ?auto_53600 - BLOCK
      ?auto_53601 - BLOCK
      ?auto_53602 - BLOCK
      ?auto_53603 - BLOCK
      ?auto_53604 - BLOCK
    )
    :vars
    (
      ?auto_53605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53604 ?auto_53605 ) ( ON-TABLE ?auto_53596 ) ( not ( = ?auto_53596 ?auto_53597 ) ) ( not ( = ?auto_53596 ?auto_53598 ) ) ( not ( = ?auto_53596 ?auto_53599 ) ) ( not ( = ?auto_53596 ?auto_53600 ) ) ( not ( = ?auto_53596 ?auto_53601 ) ) ( not ( = ?auto_53596 ?auto_53602 ) ) ( not ( = ?auto_53596 ?auto_53603 ) ) ( not ( = ?auto_53596 ?auto_53604 ) ) ( not ( = ?auto_53596 ?auto_53605 ) ) ( not ( = ?auto_53597 ?auto_53598 ) ) ( not ( = ?auto_53597 ?auto_53599 ) ) ( not ( = ?auto_53597 ?auto_53600 ) ) ( not ( = ?auto_53597 ?auto_53601 ) ) ( not ( = ?auto_53597 ?auto_53602 ) ) ( not ( = ?auto_53597 ?auto_53603 ) ) ( not ( = ?auto_53597 ?auto_53604 ) ) ( not ( = ?auto_53597 ?auto_53605 ) ) ( not ( = ?auto_53598 ?auto_53599 ) ) ( not ( = ?auto_53598 ?auto_53600 ) ) ( not ( = ?auto_53598 ?auto_53601 ) ) ( not ( = ?auto_53598 ?auto_53602 ) ) ( not ( = ?auto_53598 ?auto_53603 ) ) ( not ( = ?auto_53598 ?auto_53604 ) ) ( not ( = ?auto_53598 ?auto_53605 ) ) ( not ( = ?auto_53599 ?auto_53600 ) ) ( not ( = ?auto_53599 ?auto_53601 ) ) ( not ( = ?auto_53599 ?auto_53602 ) ) ( not ( = ?auto_53599 ?auto_53603 ) ) ( not ( = ?auto_53599 ?auto_53604 ) ) ( not ( = ?auto_53599 ?auto_53605 ) ) ( not ( = ?auto_53600 ?auto_53601 ) ) ( not ( = ?auto_53600 ?auto_53602 ) ) ( not ( = ?auto_53600 ?auto_53603 ) ) ( not ( = ?auto_53600 ?auto_53604 ) ) ( not ( = ?auto_53600 ?auto_53605 ) ) ( not ( = ?auto_53601 ?auto_53602 ) ) ( not ( = ?auto_53601 ?auto_53603 ) ) ( not ( = ?auto_53601 ?auto_53604 ) ) ( not ( = ?auto_53601 ?auto_53605 ) ) ( not ( = ?auto_53602 ?auto_53603 ) ) ( not ( = ?auto_53602 ?auto_53604 ) ) ( not ( = ?auto_53602 ?auto_53605 ) ) ( not ( = ?auto_53603 ?auto_53604 ) ) ( not ( = ?auto_53603 ?auto_53605 ) ) ( not ( = ?auto_53604 ?auto_53605 ) ) ( ON ?auto_53603 ?auto_53604 ) ( ON ?auto_53602 ?auto_53603 ) ( ON ?auto_53601 ?auto_53602 ) ( ON ?auto_53600 ?auto_53601 ) ( ON ?auto_53599 ?auto_53600 ) ( ON ?auto_53598 ?auto_53599 ) ( CLEAR ?auto_53596 ) ( ON ?auto_53597 ?auto_53598 ) ( CLEAR ?auto_53597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53596 ?auto_53597 )
      ( MAKE-9PILE ?auto_53596 ?auto_53597 ?auto_53598 ?auto_53599 ?auto_53600 ?auto_53601 ?auto_53602 ?auto_53603 ?auto_53604 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53615 - BLOCK
      ?auto_53616 - BLOCK
      ?auto_53617 - BLOCK
      ?auto_53618 - BLOCK
      ?auto_53619 - BLOCK
      ?auto_53620 - BLOCK
      ?auto_53621 - BLOCK
      ?auto_53622 - BLOCK
      ?auto_53623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53623 ) ( ON-TABLE ?auto_53615 ) ( not ( = ?auto_53615 ?auto_53616 ) ) ( not ( = ?auto_53615 ?auto_53617 ) ) ( not ( = ?auto_53615 ?auto_53618 ) ) ( not ( = ?auto_53615 ?auto_53619 ) ) ( not ( = ?auto_53615 ?auto_53620 ) ) ( not ( = ?auto_53615 ?auto_53621 ) ) ( not ( = ?auto_53615 ?auto_53622 ) ) ( not ( = ?auto_53615 ?auto_53623 ) ) ( not ( = ?auto_53616 ?auto_53617 ) ) ( not ( = ?auto_53616 ?auto_53618 ) ) ( not ( = ?auto_53616 ?auto_53619 ) ) ( not ( = ?auto_53616 ?auto_53620 ) ) ( not ( = ?auto_53616 ?auto_53621 ) ) ( not ( = ?auto_53616 ?auto_53622 ) ) ( not ( = ?auto_53616 ?auto_53623 ) ) ( not ( = ?auto_53617 ?auto_53618 ) ) ( not ( = ?auto_53617 ?auto_53619 ) ) ( not ( = ?auto_53617 ?auto_53620 ) ) ( not ( = ?auto_53617 ?auto_53621 ) ) ( not ( = ?auto_53617 ?auto_53622 ) ) ( not ( = ?auto_53617 ?auto_53623 ) ) ( not ( = ?auto_53618 ?auto_53619 ) ) ( not ( = ?auto_53618 ?auto_53620 ) ) ( not ( = ?auto_53618 ?auto_53621 ) ) ( not ( = ?auto_53618 ?auto_53622 ) ) ( not ( = ?auto_53618 ?auto_53623 ) ) ( not ( = ?auto_53619 ?auto_53620 ) ) ( not ( = ?auto_53619 ?auto_53621 ) ) ( not ( = ?auto_53619 ?auto_53622 ) ) ( not ( = ?auto_53619 ?auto_53623 ) ) ( not ( = ?auto_53620 ?auto_53621 ) ) ( not ( = ?auto_53620 ?auto_53622 ) ) ( not ( = ?auto_53620 ?auto_53623 ) ) ( not ( = ?auto_53621 ?auto_53622 ) ) ( not ( = ?auto_53621 ?auto_53623 ) ) ( not ( = ?auto_53622 ?auto_53623 ) ) ( ON ?auto_53622 ?auto_53623 ) ( ON ?auto_53621 ?auto_53622 ) ( ON ?auto_53620 ?auto_53621 ) ( ON ?auto_53619 ?auto_53620 ) ( ON ?auto_53618 ?auto_53619 ) ( ON ?auto_53617 ?auto_53618 ) ( CLEAR ?auto_53615 ) ( ON ?auto_53616 ?auto_53617 ) ( CLEAR ?auto_53616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53615 ?auto_53616 )
      ( MAKE-9PILE ?auto_53615 ?auto_53616 ?auto_53617 ?auto_53618 ?auto_53619 ?auto_53620 ?auto_53621 ?auto_53622 ?auto_53623 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53633 - BLOCK
      ?auto_53634 - BLOCK
      ?auto_53635 - BLOCK
      ?auto_53636 - BLOCK
      ?auto_53637 - BLOCK
      ?auto_53638 - BLOCK
      ?auto_53639 - BLOCK
      ?auto_53640 - BLOCK
      ?auto_53641 - BLOCK
    )
    :vars
    (
      ?auto_53642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53641 ?auto_53642 ) ( not ( = ?auto_53633 ?auto_53634 ) ) ( not ( = ?auto_53633 ?auto_53635 ) ) ( not ( = ?auto_53633 ?auto_53636 ) ) ( not ( = ?auto_53633 ?auto_53637 ) ) ( not ( = ?auto_53633 ?auto_53638 ) ) ( not ( = ?auto_53633 ?auto_53639 ) ) ( not ( = ?auto_53633 ?auto_53640 ) ) ( not ( = ?auto_53633 ?auto_53641 ) ) ( not ( = ?auto_53633 ?auto_53642 ) ) ( not ( = ?auto_53634 ?auto_53635 ) ) ( not ( = ?auto_53634 ?auto_53636 ) ) ( not ( = ?auto_53634 ?auto_53637 ) ) ( not ( = ?auto_53634 ?auto_53638 ) ) ( not ( = ?auto_53634 ?auto_53639 ) ) ( not ( = ?auto_53634 ?auto_53640 ) ) ( not ( = ?auto_53634 ?auto_53641 ) ) ( not ( = ?auto_53634 ?auto_53642 ) ) ( not ( = ?auto_53635 ?auto_53636 ) ) ( not ( = ?auto_53635 ?auto_53637 ) ) ( not ( = ?auto_53635 ?auto_53638 ) ) ( not ( = ?auto_53635 ?auto_53639 ) ) ( not ( = ?auto_53635 ?auto_53640 ) ) ( not ( = ?auto_53635 ?auto_53641 ) ) ( not ( = ?auto_53635 ?auto_53642 ) ) ( not ( = ?auto_53636 ?auto_53637 ) ) ( not ( = ?auto_53636 ?auto_53638 ) ) ( not ( = ?auto_53636 ?auto_53639 ) ) ( not ( = ?auto_53636 ?auto_53640 ) ) ( not ( = ?auto_53636 ?auto_53641 ) ) ( not ( = ?auto_53636 ?auto_53642 ) ) ( not ( = ?auto_53637 ?auto_53638 ) ) ( not ( = ?auto_53637 ?auto_53639 ) ) ( not ( = ?auto_53637 ?auto_53640 ) ) ( not ( = ?auto_53637 ?auto_53641 ) ) ( not ( = ?auto_53637 ?auto_53642 ) ) ( not ( = ?auto_53638 ?auto_53639 ) ) ( not ( = ?auto_53638 ?auto_53640 ) ) ( not ( = ?auto_53638 ?auto_53641 ) ) ( not ( = ?auto_53638 ?auto_53642 ) ) ( not ( = ?auto_53639 ?auto_53640 ) ) ( not ( = ?auto_53639 ?auto_53641 ) ) ( not ( = ?auto_53639 ?auto_53642 ) ) ( not ( = ?auto_53640 ?auto_53641 ) ) ( not ( = ?auto_53640 ?auto_53642 ) ) ( not ( = ?auto_53641 ?auto_53642 ) ) ( ON ?auto_53640 ?auto_53641 ) ( ON ?auto_53639 ?auto_53640 ) ( ON ?auto_53638 ?auto_53639 ) ( ON ?auto_53637 ?auto_53638 ) ( ON ?auto_53636 ?auto_53637 ) ( ON ?auto_53635 ?auto_53636 ) ( ON ?auto_53634 ?auto_53635 ) ( ON ?auto_53633 ?auto_53634 ) ( CLEAR ?auto_53633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53633 )
      ( MAKE-9PILE ?auto_53633 ?auto_53634 ?auto_53635 ?auto_53636 ?auto_53637 ?auto_53638 ?auto_53639 ?auto_53640 ?auto_53641 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53652 - BLOCK
      ?auto_53653 - BLOCK
      ?auto_53654 - BLOCK
      ?auto_53655 - BLOCK
      ?auto_53656 - BLOCK
      ?auto_53657 - BLOCK
      ?auto_53658 - BLOCK
      ?auto_53659 - BLOCK
      ?auto_53660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53660 ) ( not ( = ?auto_53652 ?auto_53653 ) ) ( not ( = ?auto_53652 ?auto_53654 ) ) ( not ( = ?auto_53652 ?auto_53655 ) ) ( not ( = ?auto_53652 ?auto_53656 ) ) ( not ( = ?auto_53652 ?auto_53657 ) ) ( not ( = ?auto_53652 ?auto_53658 ) ) ( not ( = ?auto_53652 ?auto_53659 ) ) ( not ( = ?auto_53652 ?auto_53660 ) ) ( not ( = ?auto_53653 ?auto_53654 ) ) ( not ( = ?auto_53653 ?auto_53655 ) ) ( not ( = ?auto_53653 ?auto_53656 ) ) ( not ( = ?auto_53653 ?auto_53657 ) ) ( not ( = ?auto_53653 ?auto_53658 ) ) ( not ( = ?auto_53653 ?auto_53659 ) ) ( not ( = ?auto_53653 ?auto_53660 ) ) ( not ( = ?auto_53654 ?auto_53655 ) ) ( not ( = ?auto_53654 ?auto_53656 ) ) ( not ( = ?auto_53654 ?auto_53657 ) ) ( not ( = ?auto_53654 ?auto_53658 ) ) ( not ( = ?auto_53654 ?auto_53659 ) ) ( not ( = ?auto_53654 ?auto_53660 ) ) ( not ( = ?auto_53655 ?auto_53656 ) ) ( not ( = ?auto_53655 ?auto_53657 ) ) ( not ( = ?auto_53655 ?auto_53658 ) ) ( not ( = ?auto_53655 ?auto_53659 ) ) ( not ( = ?auto_53655 ?auto_53660 ) ) ( not ( = ?auto_53656 ?auto_53657 ) ) ( not ( = ?auto_53656 ?auto_53658 ) ) ( not ( = ?auto_53656 ?auto_53659 ) ) ( not ( = ?auto_53656 ?auto_53660 ) ) ( not ( = ?auto_53657 ?auto_53658 ) ) ( not ( = ?auto_53657 ?auto_53659 ) ) ( not ( = ?auto_53657 ?auto_53660 ) ) ( not ( = ?auto_53658 ?auto_53659 ) ) ( not ( = ?auto_53658 ?auto_53660 ) ) ( not ( = ?auto_53659 ?auto_53660 ) ) ( ON ?auto_53659 ?auto_53660 ) ( ON ?auto_53658 ?auto_53659 ) ( ON ?auto_53657 ?auto_53658 ) ( ON ?auto_53656 ?auto_53657 ) ( ON ?auto_53655 ?auto_53656 ) ( ON ?auto_53654 ?auto_53655 ) ( ON ?auto_53653 ?auto_53654 ) ( ON ?auto_53652 ?auto_53653 ) ( CLEAR ?auto_53652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53652 )
      ( MAKE-9PILE ?auto_53652 ?auto_53653 ?auto_53654 ?auto_53655 ?auto_53656 ?auto_53657 ?auto_53658 ?auto_53659 ?auto_53660 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_53670 - BLOCK
      ?auto_53671 - BLOCK
      ?auto_53672 - BLOCK
      ?auto_53673 - BLOCK
      ?auto_53674 - BLOCK
      ?auto_53675 - BLOCK
      ?auto_53676 - BLOCK
      ?auto_53677 - BLOCK
      ?auto_53678 - BLOCK
    )
    :vars
    (
      ?auto_53679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53670 ?auto_53671 ) ) ( not ( = ?auto_53670 ?auto_53672 ) ) ( not ( = ?auto_53670 ?auto_53673 ) ) ( not ( = ?auto_53670 ?auto_53674 ) ) ( not ( = ?auto_53670 ?auto_53675 ) ) ( not ( = ?auto_53670 ?auto_53676 ) ) ( not ( = ?auto_53670 ?auto_53677 ) ) ( not ( = ?auto_53670 ?auto_53678 ) ) ( not ( = ?auto_53671 ?auto_53672 ) ) ( not ( = ?auto_53671 ?auto_53673 ) ) ( not ( = ?auto_53671 ?auto_53674 ) ) ( not ( = ?auto_53671 ?auto_53675 ) ) ( not ( = ?auto_53671 ?auto_53676 ) ) ( not ( = ?auto_53671 ?auto_53677 ) ) ( not ( = ?auto_53671 ?auto_53678 ) ) ( not ( = ?auto_53672 ?auto_53673 ) ) ( not ( = ?auto_53672 ?auto_53674 ) ) ( not ( = ?auto_53672 ?auto_53675 ) ) ( not ( = ?auto_53672 ?auto_53676 ) ) ( not ( = ?auto_53672 ?auto_53677 ) ) ( not ( = ?auto_53672 ?auto_53678 ) ) ( not ( = ?auto_53673 ?auto_53674 ) ) ( not ( = ?auto_53673 ?auto_53675 ) ) ( not ( = ?auto_53673 ?auto_53676 ) ) ( not ( = ?auto_53673 ?auto_53677 ) ) ( not ( = ?auto_53673 ?auto_53678 ) ) ( not ( = ?auto_53674 ?auto_53675 ) ) ( not ( = ?auto_53674 ?auto_53676 ) ) ( not ( = ?auto_53674 ?auto_53677 ) ) ( not ( = ?auto_53674 ?auto_53678 ) ) ( not ( = ?auto_53675 ?auto_53676 ) ) ( not ( = ?auto_53675 ?auto_53677 ) ) ( not ( = ?auto_53675 ?auto_53678 ) ) ( not ( = ?auto_53676 ?auto_53677 ) ) ( not ( = ?auto_53676 ?auto_53678 ) ) ( not ( = ?auto_53677 ?auto_53678 ) ) ( ON ?auto_53670 ?auto_53679 ) ( not ( = ?auto_53678 ?auto_53679 ) ) ( not ( = ?auto_53677 ?auto_53679 ) ) ( not ( = ?auto_53676 ?auto_53679 ) ) ( not ( = ?auto_53675 ?auto_53679 ) ) ( not ( = ?auto_53674 ?auto_53679 ) ) ( not ( = ?auto_53673 ?auto_53679 ) ) ( not ( = ?auto_53672 ?auto_53679 ) ) ( not ( = ?auto_53671 ?auto_53679 ) ) ( not ( = ?auto_53670 ?auto_53679 ) ) ( ON ?auto_53671 ?auto_53670 ) ( ON ?auto_53672 ?auto_53671 ) ( ON ?auto_53673 ?auto_53672 ) ( ON ?auto_53674 ?auto_53673 ) ( ON ?auto_53675 ?auto_53674 ) ( ON ?auto_53676 ?auto_53675 ) ( ON ?auto_53677 ?auto_53676 ) ( ON ?auto_53678 ?auto_53677 ) ( CLEAR ?auto_53678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_53678 ?auto_53677 ?auto_53676 ?auto_53675 ?auto_53674 ?auto_53673 ?auto_53672 ?auto_53671 ?auto_53670 )
      ( MAKE-9PILE ?auto_53670 ?auto_53671 ?auto_53672 ?auto_53673 ?auto_53674 ?auto_53675 ?auto_53676 ?auto_53677 ?auto_53678 ) )
  )

)

