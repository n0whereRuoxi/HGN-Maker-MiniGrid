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
      ?auto_381485 - BLOCK
    )
    :vars
    (
      ?auto_381486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381485 ?auto_381486 ) ( CLEAR ?auto_381485 ) ( HAND-EMPTY ) ( not ( = ?auto_381485 ?auto_381486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381485 ?auto_381486 )
      ( !PUTDOWN ?auto_381485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_381488 - BLOCK
    )
    :vars
    (
      ?auto_381489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381488 ?auto_381489 ) ( CLEAR ?auto_381488 ) ( HAND-EMPTY ) ( not ( = ?auto_381488 ?auto_381489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381488 ?auto_381489 )
      ( !PUTDOWN ?auto_381488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_381492 - BLOCK
      ?auto_381493 - BLOCK
    )
    :vars
    (
      ?auto_381494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381492 ) ( ON ?auto_381493 ?auto_381494 ) ( CLEAR ?auto_381493 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381492 ) ( not ( = ?auto_381492 ?auto_381493 ) ) ( not ( = ?auto_381492 ?auto_381494 ) ) ( not ( = ?auto_381493 ?auto_381494 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381493 ?auto_381494 )
      ( !STACK ?auto_381493 ?auto_381492 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_381497 - BLOCK
      ?auto_381498 - BLOCK
    )
    :vars
    (
      ?auto_381499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381497 ) ( ON ?auto_381498 ?auto_381499 ) ( CLEAR ?auto_381498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381497 ) ( not ( = ?auto_381497 ?auto_381498 ) ) ( not ( = ?auto_381497 ?auto_381499 ) ) ( not ( = ?auto_381498 ?auto_381499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381498 ?auto_381499 )
      ( !STACK ?auto_381498 ?auto_381497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_381502 - BLOCK
      ?auto_381503 - BLOCK
    )
    :vars
    (
      ?auto_381504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381503 ?auto_381504 ) ( not ( = ?auto_381502 ?auto_381503 ) ) ( not ( = ?auto_381502 ?auto_381504 ) ) ( not ( = ?auto_381503 ?auto_381504 ) ) ( ON ?auto_381502 ?auto_381503 ) ( CLEAR ?auto_381502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381502 )
      ( MAKE-2PILE ?auto_381502 ?auto_381503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_381507 - BLOCK
      ?auto_381508 - BLOCK
    )
    :vars
    (
      ?auto_381509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381508 ?auto_381509 ) ( not ( = ?auto_381507 ?auto_381508 ) ) ( not ( = ?auto_381507 ?auto_381509 ) ) ( not ( = ?auto_381508 ?auto_381509 ) ) ( ON ?auto_381507 ?auto_381508 ) ( CLEAR ?auto_381507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381507 )
      ( MAKE-2PILE ?auto_381507 ?auto_381508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_381513 - BLOCK
      ?auto_381514 - BLOCK
      ?auto_381515 - BLOCK
    )
    :vars
    (
      ?auto_381516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381514 ) ( ON ?auto_381515 ?auto_381516 ) ( CLEAR ?auto_381515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381513 ) ( ON ?auto_381514 ?auto_381513 ) ( not ( = ?auto_381513 ?auto_381514 ) ) ( not ( = ?auto_381513 ?auto_381515 ) ) ( not ( = ?auto_381513 ?auto_381516 ) ) ( not ( = ?auto_381514 ?auto_381515 ) ) ( not ( = ?auto_381514 ?auto_381516 ) ) ( not ( = ?auto_381515 ?auto_381516 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381515 ?auto_381516 )
      ( !STACK ?auto_381515 ?auto_381514 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_381520 - BLOCK
      ?auto_381521 - BLOCK
      ?auto_381522 - BLOCK
    )
    :vars
    (
      ?auto_381523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381521 ) ( ON ?auto_381522 ?auto_381523 ) ( CLEAR ?auto_381522 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381520 ) ( ON ?auto_381521 ?auto_381520 ) ( not ( = ?auto_381520 ?auto_381521 ) ) ( not ( = ?auto_381520 ?auto_381522 ) ) ( not ( = ?auto_381520 ?auto_381523 ) ) ( not ( = ?auto_381521 ?auto_381522 ) ) ( not ( = ?auto_381521 ?auto_381523 ) ) ( not ( = ?auto_381522 ?auto_381523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381522 ?auto_381523 )
      ( !STACK ?auto_381522 ?auto_381521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_381527 - BLOCK
      ?auto_381528 - BLOCK
      ?auto_381529 - BLOCK
    )
    :vars
    (
      ?auto_381530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381529 ?auto_381530 ) ( ON-TABLE ?auto_381527 ) ( not ( = ?auto_381527 ?auto_381528 ) ) ( not ( = ?auto_381527 ?auto_381529 ) ) ( not ( = ?auto_381527 ?auto_381530 ) ) ( not ( = ?auto_381528 ?auto_381529 ) ) ( not ( = ?auto_381528 ?auto_381530 ) ) ( not ( = ?auto_381529 ?auto_381530 ) ) ( CLEAR ?auto_381527 ) ( ON ?auto_381528 ?auto_381529 ) ( CLEAR ?auto_381528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381527 ?auto_381528 )
      ( MAKE-3PILE ?auto_381527 ?auto_381528 ?auto_381529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_381534 - BLOCK
      ?auto_381535 - BLOCK
      ?auto_381536 - BLOCK
    )
    :vars
    (
      ?auto_381537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381536 ?auto_381537 ) ( ON-TABLE ?auto_381534 ) ( not ( = ?auto_381534 ?auto_381535 ) ) ( not ( = ?auto_381534 ?auto_381536 ) ) ( not ( = ?auto_381534 ?auto_381537 ) ) ( not ( = ?auto_381535 ?auto_381536 ) ) ( not ( = ?auto_381535 ?auto_381537 ) ) ( not ( = ?auto_381536 ?auto_381537 ) ) ( CLEAR ?auto_381534 ) ( ON ?auto_381535 ?auto_381536 ) ( CLEAR ?auto_381535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381534 ?auto_381535 )
      ( MAKE-3PILE ?auto_381534 ?auto_381535 ?auto_381536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_381541 - BLOCK
      ?auto_381542 - BLOCK
      ?auto_381543 - BLOCK
    )
    :vars
    (
      ?auto_381544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381543 ?auto_381544 ) ( not ( = ?auto_381541 ?auto_381542 ) ) ( not ( = ?auto_381541 ?auto_381543 ) ) ( not ( = ?auto_381541 ?auto_381544 ) ) ( not ( = ?auto_381542 ?auto_381543 ) ) ( not ( = ?auto_381542 ?auto_381544 ) ) ( not ( = ?auto_381543 ?auto_381544 ) ) ( ON ?auto_381542 ?auto_381543 ) ( ON ?auto_381541 ?auto_381542 ) ( CLEAR ?auto_381541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381541 )
      ( MAKE-3PILE ?auto_381541 ?auto_381542 ?auto_381543 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_381548 - BLOCK
      ?auto_381549 - BLOCK
      ?auto_381550 - BLOCK
    )
    :vars
    (
      ?auto_381551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381550 ?auto_381551 ) ( not ( = ?auto_381548 ?auto_381549 ) ) ( not ( = ?auto_381548 ?auto_381550 ) ) ( not ( = ?auto_381548 ?auto_381551 ) ) ( not ( = ?auto_381549 ?auto_381550 ) ) ( not ( = ?auto_381549 ?auto_381551 ) ) ( not ( = ?auto_381550 ?auto_381551 ) ) ( ON ?auto_381549 ?auto_381550 ) ( ON ?auto_381548 ?auto_381549 ) ( CLEAR ?auto_381548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381548 )
      ( MAKE-3PILE ?auto_381548 ?auto_381549 ?auto_381550 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381556 - BLOCK
      ?auto_381557 - BLOCK
      ?auto_381558 - BLOCK
      ?auto_381559 - BLOCK
    )
    :vars
    (
      ?auto_381560 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381558 ) ( ON ?auto_381559 ?auto_381560 ) ( CLEAR ?auto_381559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381556 ) ( ON ?auto_381557 ?auto_381556 ) ( ON ?auto_381558 ?auto_381557 ) ( not ( = ?auto_381556 ?auto_381557 ) ) ( not ( = ?auto_381556 ?auto_381558 ) ) ( not ( = ?auto_381556 ?auto_381559 ) ) ( not ( = ?auto_381556 ?auto_381560 ) ) ( not ( = ?auto_381557 ?auto_381558 ) ) ( not ( = ?auto_381557 ?auto_381559 ) ) ( not ( = ?auto_381557 ?auto_381560 ) ) ( not ( = ?auto_381558 ?auto_381559 ) ) ( not ( = ?auto_381558 ?auto_381560 ) ) ( not ( = ?auto_381559 ?auto_381560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381559 ?auto_381560 )
      ( !STACK ?auto_381559 ?auto_381558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381565 - BLOCK
      ?auto_381566 - BLOCK
      ?auto_381567 - BLOCK
      ?auto_381568 - BLOCK
    )
    :vars
    (
      ?auto_381569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381567 ) ( ON ?auto_381568 ?auto_381569 ) ( CLEAR ?auto_381568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381565 ) ( ON ?auto_381566 ?auto_381565 ) ( ON ?auto_381567 ?auto_381566 ) ( not ( = ?auto_381565 ?auto_381566 ) ) ( not ( = ?auto_381565 ?auto_381567 ) ) ( not ( = ?auto_381565 ?auto_381568 ) ) ( not ( = ?auto_381565 ?auto_381569 ) ) ( not ( = ?auto_381566 ?auto_381567 ) ) ( not ( = ?auto_381566 ?auto_381568 ) ) ( not ( = ?auto_381566 ?auto_381569 ) ) ( not ( = ?auto_381567 ?auto_381568 ) ) ( not ( = ?auto_381567 ?auto_381569 ) ) ( not ( = ?auto_381568 ?auto_381569 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381568 ?auto_381569 )
      ( !STACK ?auto_381568 ?auto_381567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381574 - BLOCK
      ?auto_381575 - BLOCK
      ?auto_381576 - BLOCK
      ?auto_381577 - BLOCK
    )
    :vars
    (
      ?auto_381578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381577 ?auto_381578 ) ( ON-TABLE ?auto_381574 ) ( ON ?auto_381575 ?auto_381574 ) ( not ( = ?auto_381574 ?auto_381575 ) ) ( not ( = ?auto_381574 ?auto_381576 ) ) ( not ( = ?auto_381574 ?auto_381577 ) ) ( not ( = ?auto_381574 ?auto_381578 ) ) ( not ( = ?auto_381575 ?auto_381576 ) ) ( not ( = ?auto_381575 ?auto_381577 ) ) ( not ( = ?auto_381575 ?auto_381578 ) ) ( not ( = ?auto_381576 ?auto_381577 ) ) ( not ( = ?auto_381576 ?auto_381578 ) ) ( not ( = ?auto_381577 ?auto_381578 ) ) ( CLEAR ?auto_381575 ) ( ON ?auto_381576 ?auto_381577 ) ( CLEAR ?auto_381576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381574 ?auto_381575 ?auto_381576 )
      ( MAKE-4PILE ?auto_381574 ?auto_381575 ?auto_381576 ?auto_381577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381583 - BLOCK
      ?auto_381584 - BLOCK
      ?auto_381585 - BLOCK
      ?auto_381586 - BLOCK
    )
    :vars
    (
      ?auto_381587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381586 ?auto_381587 ) ( ON-TABLE ?auto_381583 ) ( ON ?auto_381584 ?auto_381583 ) ( not ( = ?auto_381583 ?auto_381584 ) ) ( not ( = ?auto_381583 ?auto_381585 ) ) ( not ( = ?auto_381583 ?auto_381586 ) ) ( not ( = ?auto_381583 ?auto_381587 ) ) ( not ( = ?auto_381584 ?auto_381585 ) ) ( not ( = ?auto_381584 ?auto_381586 ) ) ( not ( = ?auto_381584 ?auto_381587 ) ) ( not ( = ?auto_381585 ?auto_381586 ) ) ( not ( = ?auto_381585 ?auto_381587 ) ) ( not ( = ?auto_381586 ?auto_381587 ) ) ( CLEAR ?auto_381584 ) ( ON ?auto_381585 ?auto_381586 ) ( CLEAR ?auto_381585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381583 ?auto_381584 ?auto_381585 )
      ( MAKE-4PILE ?auto_381583 ?auto_381584 ?auto_381585 ?auto_381586 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381592 - BLOCK
      ?auto_381593 - BLOCK
      ?auto_381594 - BLOCK
      ?auto_381595 - BLOCK
    )
    :vars
    (
      ?auto_381596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381595 ?auto_381596 ) ( ON-TABLE ?auto_381592 ) ( not ( = ?auto_381592 ?auto_381593 ) ) ( not ( = ?auto_381592 ?auto_381594 ) ) ( not ( = ?auto_381592 ?auto_381595 ) ) ( not ( = ?auto_381592 ?auto_381596 ) ) ( not ( = ?auto_381593 ?auto_381594 ) ) ( not ( = ?auto_381593 ?auto_381595 ) ) ( not ( = ?auto_381593 ?auto_381596 ) ) ( not ( = ?auto_381594 ?auto_381595 ) ) ( not ( = ?auto_381594 ?auto_381596 ) ) ( not ( = ?auto_381595 ?auto_381596 ) ) ( ON ?auto_381594 ?auto_381595 ) ( CLEAR ?auto_381592 ) ( ON ?auto_381593 ?auto_381594 ) ( CLEAR ?auto_381593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381592 ?auto_381593 )
      ( MAKE-4PILE ?auto_381592 ?auto_381593 ?auto_381594 ?auto_381595 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381601 - BLOCK
      ?auto_381602 - BLOCK
      ?auto_381603 - BLOCK
      ?auto_381604 - BLOCK
    )
    :vars
    (
      ?auto_381605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381604 ?auto_381605 ) ( ON-TABLE ?auto_381601 ) ( not ( = ?auto_381601 ?auto_381602 ) ) ( not ( = ?auto_381601 ?auto_381603 ) ) ( not ( = ?auto_381601 ?auto_381604 ) ) ( not ( = ?auto_381601 ?auto_381605 ) ) ( not ( = ?auto_381602 ?auto_381603 ) ) ( not ( = ?auto_381602 ?auto_381604 ) ) ( not ( = ?auto_381602 ?auto_381605 ) ) ( not ( = ?auto_381603 ?auto_381604 ) ) ( not ( = ?auto_381603 ?auto_381605 ) ) ( not ( = ?auto_381604 ?auto_381605 ) ) ( ON ?auto_381603 ?auto_381604 ) ( CLEAR ?auto_381601 ) ( ON ?auto_381602 ?auto_381603 ) ( CLEAR ?auto_381602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381601 ?auto_381602 )
      ( MAKE-4PILE ?auto_381601 ?auto_381602 ?auto_381603 ?auto_381604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381610 - BLOCK
      ?auto_381611 - BLOCK
      ?auto_381612 - BLOCK
      ?auto_381613 - BLOCK
    )
    :vars
    (
      ?auto_381614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381613 ?auto_381614 ) ( not ( = ?auto_381610 ?auto_381611 ) ) ( not ( = ?auto_381610 ?auto_381612 ) ) ( not ( = ?auto_381610 ?auto_381613 ) ) ( not ( = ?auto_381610 ?auto_381614 ) ) ( not ( = ?auto_381611 ?auto_381612 ) ) ( not ( = ?auto_381611 ?auto_381613 ) ) ( not ( = ?auto_381611 ?auto_381614 ) ) ( not ( = ?auto_381612 ?auto_381613 ) ) ( not ( = ?auto_381612 ?auto_381614 ) ) ( not ( = ?auto_381613 ?auto_381614 ) ) ( ON ?auto_381612 ?auto_381613 ) ( ON ?auto_381611 ?auto_381612 ) ( ON ?auto_381610 ?auto_381611 ) ( CLEAR ?auto_381610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381610 )
      ( MAKE-4PILE ?auto_381610 ?auto_381611 ?auto_381612 ?auto_381613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_381619 - BLOCK
      ?auto_381620 - BLOCK
      ?auto_381621 - BLOCK
      ?auto_381622 - BLOCK
    )
    :vars
    (
      ?auto_381623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381622 ?auto_381623 ) ( not ( = ?auto_381619 ?auto_381620 ) ) ( not ( = ?auto_381619 ?auto_381621 ) ) ( not ( = ?auto_381619 ?auto_381622 ) ) ( not ( = ?auto_381619 ?auto_381623 ) ) ( not ( = ?auto_381620 ?auto_381621 ) ) ( not ( = ?auto_381620 ?auto_381622 ) ) ( not ( = ?auto_381620 ?auto_381623 ) ) ( not ( = ?auto_381621 ?auto_381622 ) ) ( not ( = ?auto_381621 ?auto_381623 ) ) ( not ( = ?auto_381622 ?auto_381623 ) ) ( ON ?auto_381621 ?auto_381622 ) ( ON ?auto_381620 ?auto_381621 ) ( ON ?auto_381619 ?auto_381620 ) ( CLEAR ?auto_381619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381619 )
      ( MAKE-4PILE ?auto_381619 ?auto_381620 ?auto_381621 ?auto_381622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381629 - BLOCK
      ?auto_381630 - BLOCK
      ?auto_381631 - BLOCK
      ?auto_381632 - BLOCK
      ?auto_381633 - BLOCK
    )
    :vars
    (
      ?auto_381634 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381632 ) ( ON ?auto_381633 ?auto_381634 ) ( CLEAR ?auto_381633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381629 ) ( ON ?auto_381630 ?auto_381629 ) ( ON ?auto_381631 ?auto_381630 ) ( ON ?auto_381632 ?auto_381631 ) ( not ( = ?auto_381629 ?auto_381630 ) ) ( not ( = ?auto_381629 ?auto_381631 ) ) ( not ( = ?auto_381629 ?auto_381632 ) ) ( not ( = ?auto_381629 ?auto_381633 ) ) ( not ( = ?auto_381629 ?auto_381634 ) ) ( not ( = ?auto_381630 ?auto_381631 ) ) ( not ( = ?auto_381630 ?auto_381632 ) ) ( not ( = ?auto_381630 ?auto_381633 ) ) ( not ( = ?auto_381630 ?auto_381634 ) ) ( not ( = ?auto_381631 ?auto_381632 ) ) ( not ( = ?auto_381631 ?auto_381633 ) ) ( not ( = ?auto_381631 ?auto_381634 ) ) ( not ( = ?auto_381632 ?auto_381633 ) ) ( not ( = ?auto_381632 ?auto_381634 ) ) ( not ( = ?auto_381633 ?auto_381634 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381633 ?auto_381634 )
      ( !STACK ?auto_381633 ?auto_381632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381640 - BLOCK
      ?auto_381641 - BLOCK
      ?auto_381642 - BLOCK
      ?auto_381643 - BLOCK
      ?auto_381644 - BLOCK
    )
    :vars
    (
      ?auto_381645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381643 ) ( ON ?auto_381644 ?auto_381645 ) ( CLEAR ?auto_381644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381640 ) ( ON ?auto_381641 ?auto_381640 ) ( ON ?auto_381642 ?auto_381641 ) ( ON ?auto_381643 ?auto_381642 ) ( not ( = ?auto_381640 ?auto_381641 ) ) ( not ( = ?auto_381640 ?auto_381642 ) ) ( not ( = ?auto_381640 ?auto_381643 ) ) ( not ( = ?auto_381640 ?auto_381644 ) ) ( not ( = ?auto_381640 ?auto_381645 ) ) ( not ( = ?auto_381641 ?auto_381642 ) ) ( not ( = ?auto_381641 ?auto_381643 ) ) ( not ( = ?auto_381641 ?auto_381644 ) ) ( not ( = ?auto_381641 ?auto_381645 ) ) ( not ( = ?auto_381642 ?auto_381643 ) ) ( not ( = ?auto_381642 ?auto_381644 ) ) ( not ( = ?auto_381642 ?auto_381645 ) ) ( not ( = ?auto_381643 ?auto_381644 ) ) ( not ( = ?auto_381643 ?auto_381645 ) ) ( not ( = ?auto_381644 ?auto_381645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381644 ?auto_381645 )
      ( !STACK ?auto_381644 ?auto_381643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381651 - BLOCK
      ?auto_381652 - BLOCK
      ?auto_381653 - BLOCK
      ?auto_381654 - BLOCK
      ?auto_381655 - BLOCK
    )
    :vars
    (
      ?auto_381656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381655 ?auto_381656 ) ( ON-TABLE ?auto_381651 ) ( ON ?auto_381652 ?auto_381651 ) ( ON ?auto_381653 ?auto_381652 ) ( not ( = ?auto_381651 ?auto_381652 ) ) ( not ( = ?auto_381651 ?auto_381653 ) ) ( not ( = ?auto_381651 ?auto_381654 ) ) ( not ( = ?auto_381651 ?auto_381655 ) ) ( not ( = ?auto_381651 ?auto_381656 ) ) ( not ( = ?auto_381652 ?auto_381653 ) ) ( not ( = ?auto_381652 ?auto_381654 ) ) ( not ( = ?auto_381652 ?auto_381655 ) ) ( not ( = ?auto_381652 ?auto_381656 ) ) ( not ( = ?auto_381653 ?auto_381654 ) ) ( not ( = ?auto_381653 ?auto_381655 ) ) ( not ( = ?auto_381653 ?auto_381656 ) ) ( not ( = ?auto_381654 ?auto_381655 ) ) ( not ( = ?auto_381654 ?auto_381656 ) ) ( not ( = ?auto_381655 ?auto_381656 ) ) ( CLEAR ?auto_381653 ) ( ON ?auto_381654 ?auto_381655 ) ( CLEAR ?auto_381654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_381651 ?auto_381652 ?auto_381653 ?auto_381654 )
      ( MAKE-5PILE ?auto_381651 ?auto_381652 ?auto_381653 ?auto_381654 ?auto_381655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381662 - BLOCK
      ?auto_381663 - BLOCK
      ?auto_381664 - BLOCK
      ?auto_381665 - BLOCK
      ?auto_381666 - BLOCK
    )
    :vars
    (
      ?auto_381667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381666 ?auto_381667 ) ( ON-TABLE ?auto_381662 ) ( ON ?auto_381663 ?auto_381662 ) ( ON ?auto_381664 ?auto_381663 ) ( not ( = ?auto_381662 ?auto_381663 ) ) ( not ( = ?auto_381662 ?auto_381664 ) ) ( not ( = ?auto_381662 ?auto_381665 ) ) ( not ( = ?auto_381662 ?auto_381666 ) ) ( not ( = ?auto_381662 ?auto_381667 ) ) ( not ( = ?auto_381663 ?auto_381664 ) ) ( not ( = ?auto_381663 ?auto_381665 ) ) ( not ( = ?auto_381663 ?auto_381666 ) ) ( not ( = ?auto_381663 ?auto_381667 ) ) ( not ( = ?auto_381664 ?auto_381665 ) ) ( not ( = ?auto_381664 ?auto_381666 ) ) ( not ( = ?auto_381664 ?auto_381667 ) ) ( not ( = ?auto_381665 ?auto_381666 ) ) ( not ( = ?auto_381665 ?auto_381667 ) ) ( not ( = ?auto_381666 ?auto_381667 ) ) ( CLEAR ?auto_381664 ) ( ON ?auto_381665 ?auto_381666 ) ( CLEAR ?auto_381665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_381662 ?auto_381663 ?auto_381664 ?auto_381665 )
      ( MAKE-5PILE ?auto_381662 ?auto_381663 ?auto_381664 ?auto_381665 ?auto_381666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381673 - BLOCK
      ?auto_381674 - BLOCK
      ?auto_381675 - BLOCK
      ?auto_381676 - BLOCK
      ?auto_381677 - BLOCK
    )
    :vars
    (
      ?auto_381678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381677 ?auto_381678 ) ( ON-TABLE ?auto_381673 ) ( ON ?auto_381674 ?auto_381673 ) ( not ( = ?auto_381673 ?auto_381674 ) ) ( not ( = ?auto_381673 ?auto_381675 ) ) ( not ( = ?auto_381673 ?auto_381676 ) ) ( not ( = ?auto_381673 ?auto_381677 ) ) ( not ( = ?auto_381673 ?auto_381678 ) ) ( not ( = ?auto_381674 ?auto_381675 ) ) ( not ( = ?auto_381674 ?auto_381676 ) ) ( not ( = ?auto_381674 ?auto_381677 ) ) ( not ( = ?auto_381674 ?auto_381678 ) ) ( not ( = ?auto_381675 ?auto_381676 ) ) ( not ( = ?auto_381675 ?auto_381677 ) ) ( not ( = ?auto_381675 ?auto_381678 ) ) ( not ( = ?auto_381676 ?auto_381677 ) ) ( not ( = ?auto_381676 ?auto_381678 ) ) ( not ( = ?auto_381677 ?auto_381678 ) ) ( ON ?auto_381676 ?auto_381677 ) ( CLEAR ?auto_381674 ) ( ON ?auto_381675 ?auto_381676 ) ( CLEAR ?auto_381675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381673 ?auto_381674 ?auto_381675 )
      ( MAKE-5PILE ?auto_381673 ?auto_381674 ?auto_381675 ?auto_381676 ?auto_381677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381684 - BLOCK
      ?auto_381685 - BLOCK
      ?auto_381686 - BLOCK
      ?auto_381687 - BLOCK
      ?auto_381688 - BLOCK
    )
    :vars
    (
      ?auto_381689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381688 ?auto_381689 ) ( ON-TABLE ?auto_381684 ) ( ON ?auto_381685 ?auto_381684 ) ( not ( = ?auto_381684 ?auto_381685 ) ) ( not ( = ?auto_381684 ?auto_381686 ) ) ( not ( = ?auto_381684 ?auto_381687 ) ) ( not ( = ?auto_381684 ?auto_381688 ) ) ( not ( = ?auto_381684 ?auto_381689 ) ) ( not ( = ?auto_381685 ?auto_381686 ) ) ( not ( = ?auto_381685 ?auto_381687 ) ) ( not ( = ?auto_381685 ?auto_381688 ) ) ( not ( = ?auto_381685 ?auto_381689 ) ) ( not ( = ?auto_381686 ?auto_381687 ) ) ( not ( = ?auto_381686 ?auto_381688 ) ) ( not ( = ?auto_381686 ?auto_381689 ) ) ( not ( = ?auto_381687 ?auto_381688 ) ) ( not ( = ?auto_381687 ?auto_381689 ) ) ( not ( = ?auto_381688 ?auto_381689 ) ) ( ON ?auto_381687 ?auto_381688 ) ( CLEAR ?auto_381685 ) ( ON ?auto_381686 ?auto_381687 ) ( CLEAR ?auto_381686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381684 ?auto_381685 ?auto_381686 )
      ( MAKE-5PILE ?auto_381684 ?auto_381685 ?auto_381686 ?auto_381687 ?auto_381688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381695 - BLOCK
      ?auto_381696 - BLOCK
      ?auto_381697 - BLOCK
      ?auto_381698 - BLOCK
      ?auto_381699 - BLOCK
    )
    :vars
    (
      ?auto_381700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381699 ?auto_381700 ) ( ON-TABLE ?auto_381695 ) ( not ( = ?auto_381695 ?auto_381696 ) ) ( not ( = ?auto_381695 ?auto_381697 ) ) ( not ( = ?auto_381695 ?auto_381698 ) ) ( not ( = ?auto_381695 ?auto_381699 ) ) ( not ( = ?auto_381695 ?auto_381700 ) ) ( not ( = ?auto_381696 ?auto_381697 ) ) ( not ( = ?auto_381696 ?auto_381698 ) ) ( not ( = ?auto_381696 ?auto_381699 ) ) ( not ( = ?auto_381696 ?auto_381700 ) ) ( not ( = ?auto_381697 ?auto_381698 ) ) ( not ( = ?auto_381697 ?auto_381699 ) ) ( not ( = ?auto_381697 ?auto_381700 ) ) ( not ( = ?auto_381698 ?auto_381699 ) ) ( not ( = ?auto_381698 ?auto_381700 ) ) ( not ( = ?auto_381699 ?auto_381700 ) ) ( ON ?auto_381698 ?auto_381699 ) ( ON ?auto_381697 ?auto_381698 ) ( CLEAR ?auto_381695 ) ( ON ?auto_381696 ?auto_381697 ) ( CLEAR ?auto_381696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381695 ?auto_381696 )
      ( MAKE-5PILE ?auto_381695 ?auto_381696 ?auto_381697 ?auto_381698 ?auto_381699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381706 - BLOCK
      ?auto_381707 - BLOCK
      ?auto_381708 - BLOCK
      ?auto_381709 - BLOCK
      ?auto_381710 - BLOCK
    )
    :vars
    (
      ?auto_381711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381710 ?auto_381711 ) ( ON-TABLE ?auto_381706 ) ( not ( = ?auto_381706 ?auto_381707 ) ) ( not ( = ?auto_381706 ?auto_381708 ) ) ( not ( = ?auto_381706 ?auto_381709 ) ) ( not ( = ?auto_381706 ?auto_381710 ) ) ( not ( = ?auto_381706 ?auto_381711 ) ) ( not ( = ?auto_381707 ?auto_381708 ) ) ( not ( = ?auto_381707 ?auto_381709 ) ) ( not ( = ?auto_381707 ?auto_381710 ) ) ( not ( = ?auto_381707 ?auto_381711 ) ) ( not ( = ?auto_381708 ?auto_381709 ) ) ( not ( = ?auto_381708 ?auto_381710 ) ) ( not ( = ?auto_381708 ?auto_381711 ) ) ( not ( = ?auto_381709 ?auto_381710 ) ) ( not ( = ?auto_381709 ?auto_381711 ) ) ( not ( = ?auto_381710 ?auto_381711 ) ) ( ON ?auto_381709 ?auto_381710 ) ( ON ?auto_381708 ?auto_381709 ) ( CLEAR ?auto_381706 ) ( ON ?auto_381707 ?auto_381708 ) ( CLEAR ?auto_381707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381706 ?auto_381707 )
      ( MAKE-5PILE ?auto_381706 ?auto_381707 ?auto_381708 ?auto_381709 ?auto_381710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381717 - BLOCK
      ?auto_381718 - BLOCK
      ?auto_381719 - BLOCK
      ?auto_381720 - BLOCK
      ?auto_381721 - BLOCK
    )
    :vars
    (
      ?auto_381722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381721 ?auto_381722 ) ( not ( = ?auto_381717 ?auto_381718 ) ) ( not ( = ?auto_381717 ?auto_381719 ) ) ( not ( = ?auto_381717 ?auto_381720 ) ) ( not ( = ?auto_381717 ?auto_381721 ) ) ( not ( = ?auto_381717 ?auto_381722 ) ) ( not ( = ?auto_381718 ?auto_381719 ) ) ( not ( = ?auto_381718 ?auto_381720 ) ) ( not ( = ?auto_381718 ?auto_381721 ) ) ( not ( = ?auto_381718 ?auto_381722 ) ) ( not ( = ?auto_381719 ?auto_381720 ) ) ( not ( = ?auto_381719 ?auto_381721 ) ) ( not ( = ?auto_381719 ?auto_381722 ) ) ( not ( = ?auto_381720 ?auto_381721 ) ) ( not ( = ?auto_381720 ?auto_381722 ) ) ( not ( = ?auto_381721 ?auto_381722 ) ) ( ON ?auto_381720 ?auto_381721 ) ( ON ?auto_381719 ?auto_381720 ) ( ON ?auto_381718 ?auto_381719 ) ( ON ?auto_381717 ?auto_381718 ) ( CLEAR ?auto_381717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381717 )
      ( MAKE-5PILE ?auto_381717 ?auto_381718 ?auto_381719 ?auto_381720 ?auto_381721 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_381728 - BLOCK
      ?auto_381729 - BLOCK
      ?auto_381730 - BLOCK
      ?auto_381731 - BLOCK
      ?auto_381732 - BLOCK
    )
    :vars
    (
      ?auto_381733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381732 ?auto_381733 ) ( not ( = ?auto_381728 ?auto_381729 ) ) ( not ( = ?auto_381728 ?auto_381730 ) ) ( not ( = ?auto_381728 ?auto_381731 ) ) ( not ( = ?auto_381728 ?auto_381732 ) ) ( not ( = ?auto_381728 ?auto_381733 ) ) ( not ( = ?auto_381729 ?auto_381730 ) ) ( not ( = ?auto_381729 ?auto_381731 ) ) ( not ( = ?auto_381729 ?auto_381732 ) ) ( not ( = ?auto_381729 ?auto_381733 ) ) ( not ( = ?auto_381730 ?auto_381731 ) ) ( not ( = ?auto_381730 ?auto_381732 ) ) ( not ( = ?auto_381730 ?auto_381733 ) ) ( not ( = ?auto_381731 ?auto_381732 ) ) ( not ( = ?auto_381731 ?auto_381733 ) ) ( not ( = ?auto_381732 ?auto_381733 ) ) ( ON ?auto_381731 ?auto_381732 ) ( ON ?auto_381730 ?auto_381731 ) ( ON ?auto_381729 ?auto_381730 ) ( ON ?auto_381728 ?auto_381729 ) ( CLEAR ?auto_381728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381728 )
      ( MAKE-5PILE ?auto_381728 ?auto_381729 ?auto_381730 ?auto_381731 ?auto_381732 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381740 - BLOCK
      ?auto_381741 - BLOCK
      ?auto_381742 - BLOCK
      ?auto_381743 - BLOCK
      ?auto_381744 - BLOCK
      ?auto_381745 - BLOCK
    )
    :vars
    (
      ?auto_381746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381744 ) ( ON ?auto_381745 ?auto_381746 ) ( CLEAR ?auto_381745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381740 ) ( ON ?auto_381741 ?auto_381740 ) ( ON ?auto_381742 ?auto_381741 ) ( ON ?auto_381743 ?auto_381742 ) ( ON ?auto_381744 ?auto_381743 ) ( not ( = ?auto_381740 ?auto_381741 ) ) ( not ( = ?auto_381740 ?auto_381742 ) ) ( not ( = ?auto_381740 ?auto_381743 ) ) ( not ( = ?auto_381740 ?auto_381744 ) ) ( not ( = ?auto_381740 ?auto_381745 ) ) ( not ( = ?auto_381740 ?auto_381746 ) ) ( not ( = ?auto_381741 ?auto_381742 ) ) ( not ( = ?auto_381741 ?auto_381743 ) ) ( not ( = ?auto_381741 ?auto_381744 ) ) ( not ( = ?auto_381741 ?auto_381745 ) ) ( not ( = ?auto_381741 ?auto_381746 ) ) ( not ( = ?auto_381742 ?auto_381743 ) ) ( not ( = ?auto_381742 ?auto_381744 ) ) ( not ( = ?auto_381742 ?auto_381745 ) ) ( not ( = ?auto_381742 ?auto_381746 ) ) ( not ( = ?auto_381743 ?auto_381744 ) ) ( not ( = ?auto_381743 ?auto_381745 ) ) ( not ( = ?auto_381743 ?auto_381746 ) ) ( not ( = ?auto_381744 ?auto_381745 ) ) ( not ( = ?auto_381744 ?auto_381746 ) ) ( not ( = ?auto_381745 ?auto_381746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381745 ?auto_381746 )
      ( !STACK ?auto_381745 ?auto_381744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381753 - BLOCK
      ?auto_381754 - BLOCK
      ?auto_381755 - BLOCK
      ?auto_381756 - BLOCK
      ?auto_381757 - BLOCK
      ?auto_381758 - BLOCK
    )
    :vars
    (
      ?auto_381759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381757 ) ( ON ?auto_381758 ?auto_381759 ) ( CLEAR ?auto_381758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381753 ) ( ON ?auto_381754 ?auto_381753 ) ( ON ?auto_381755 ?auto_381754 ) ( ON ?auto_381756 ?auto_381755 ) ( ON ?auto_381757 ?auto_381756 ) ( not ( = ?auto_381753 ?auto_381754 ) ) ( not ( = ?auto_381753 ?auto_381755 ) ) ( not ( = ?auto_381753 ?auto_381756 ) ) ( not ( = ?auto_381753 ?auto_381757 ) ) ( not ( = ?auto_381753 ?auto_381758 ) ) ( not ( = ?auto_381753 ?auto_381759 ) ) ( not ( = ?auto_381754 ?auto_381755 ) ) ( not ( = ?auto_381754 ?auto_381756 ) ) ( not ( = ?auto_381754 ?auto_381757 ) ) ( not ( = ?auto_381754 ?auto_381758 ) ) ( not ( = ?auto_381754 ?auto_381759 ) ) ( not ( = ?auto_381755 ?auto_381756 ) ) ( not ( = ?auto_381755 ?auto_381757 ) ) ( not ( = ?auto_381755 ?auto_381758 ) ) ( not ( = ?auto_381755 ?auto_381759 ) ) ( not ( = ?auto_381756 ?auto_381757 ) ) ( not ( = ?auto_381756 ?auto_381758 ) ) ( not ( = ?auto_381756 ?auto_381759 ) ) ( not ( = ?auto_381757 ?auto_381758 ) ) ( not ( = ?auto_381757 ?auto_381759 ) ) ( not ( = ?auto_381758 ?auto_381759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381758 ?auto_381759 )
      ( !STACK ?auto_381758 ?auto_381757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381766 - BLOCK
      ?auto_381767 - BLOCK
      ?auto_381768 - BLOCK
      ?auto_381769 - BLOCK
      ?auto_381770 - BLOCK
      ?auto_381771 - BLOCK
    )
    :vars
    (
      ?auto_381772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381771 ?auto_381772 ) ( ON-TABLE ?auto_381766 ) ( ON ?auto_381767 ?auto_381766 ) ( ON ?auto_381768 ?auto_381767 ) ( ON ?auto_381769 ?auto_381768 ) ( not ( = ?auto_381766 ?auto_381767 ) ) ( not ( = ?auto_381766 ?auto_381768 ) ) ( not ( = ?auto_381766 ?auto_381769 ) ) ( not ( = ?auto_381766 ?auto_381770 ) ) ( not ( = ?auto_381766 ?auto_381771 ) ) ( not ( = ?auto_381766 ?auto_381772 ) ) ( not ( = ?auto_381767 ?auto_381768 ) ) ( not ( = ?auto_381767 ?auto_381769 ) ) ( not ( = ?auto_381767 ?auto_381770 ) ) ( not ( = ?auto_381767 ?auto_381771 ) ) ( not ( = ?auto_381767 ?auto_381772 ) ) ( not ( = ?auto_381768 ?auto_381769 ) ) ( not ( = ?auto_381768 ?auto_381770 ) ) ( not ( = ?auto_381768 ?auto_381771 ) ) ( not ( = ?auto_381768 ?auto_381772 ) ) ( not ( = ?auto_381769 ?auto_381770 ) ) ( not ( = ?auto_381769 ?auto_381771 ) ) ( not ( = ?auto_381769 ?auto_381772 ) ) ( not ( = ?auto_381770 ?auto_381771 ) ) ( not ( = ?auto_381770 ?auto_381772 ) ) ( not ( = ?auto_381771 ?auto_381772 ) ) ( CLEAR ?auto_381769 ) ( ON ?auto_381770 ?auto_381771 ) ( CLEAR ?auto_381770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_381766 ?auto_381767 ?auto_381768 ?auto_381769 ?auto_381770 )
      ( MAKE-6PILE ?auto_381766 ?auto_381767 ?auto_381768 ?auto_381769 ?auto_381770 ?auto_381771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381779 - BLOCK
      ?auto_381780 - BLOCK
      ?auto_381781 - BLOCK
      ?auto_381782 - BLOCK
      ?auto_381783 - BLOCK
      ?auto_381784 - BLOCK
    )
    :vars
    (
      ?auto_381785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381784 ?auto_381785 ) ( ON-TABLE ?auto_381779 ) ( ON ?auto_381780 ?auto_381779 ) ( ON ?auto_381781 ?auto_381780 ) ( ON ?auto_381782 ?auto_381781 ) ( not ( = ?auto_381779 ?auto_381780 ) ) ( not ( = ?auto_381779 ?auto_381781 ) ) ( not ( = ?auto_381779 ?auto_381782 ) ) ( not ( = ?auto_381779 ?auto_381783 ) ) ( not ( = ?auto_381779 ?auto_381784 ) ) ( not ( = ?auto_381779 ?auto_381785 ) ) ( not ( = ?auto_381780 ?auto_381781 ) ) ( not ( = ?auto_381780 ?auto_381782 ) ) ( not ( = ?auto_381780 ?auto_381783 ) ) ( not ( = ?auto_381780 ?auto_381784 ) ) ( not ( = ?auto_381780 ?auto_381785 ) ) ( not ( = ?auto_381781 ?auto_381782 ) ) ( not ( = ?auto_381781 ?auto_381783 ) ) ( not ( = ?auto_381781 ?auto_381784 ) ) ( not ( = ?auto_381781 ?auto_381785 ) ) ( not ( = ?auto_381782 ?auto_381783 ) ) ( not ( = ?auto_381782 ?auto_381784 ) ) ( not ( = ?auto_381782 ?auto_381785 ) ) ( not ( = ?auto_381783 ?auto_381784 ) ) ( not ( = ?auto_381783 ?auto_381785 ) ) ( not ( = ?auto_381784 ?auto_381785 ) ) ( CLEAR ?auto_381782 ) ( ON ?auto_381783 ?auto_381784 ) ( CLEAR ?auto_381783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_381779 ?auto_381780 ?auto_381781 ?auto_381782 ?auto_381783 )
      ( MAKE-6PILE ?auto_381779 ?auto_381780 ?auto_381781 ?auto_381782 ?auto_381783 ?auto_381784 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381792 - BLOCK
      ?auto_381793 - BLOCK
      ?auto_381794 - BLOCK
      ?auto_381795 - BLOCK
      ?auto_381796 - BLOCK
      ?auto_381797 - BLOCK
    )
    :vars
    (
      ?auto_381798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381797 ?auto_381798 ) ( ON-TABLE ?auto_381792 ) ( ON ?auto_381793 ?auto_381792 ) ( ON ?auto_381794 ?auto_381793 ) ( not ( = ?auto_381792 ?auto_381793 ) ) ( not ( = ?auto_381792 ?auto_381794 ) ) ( not ( = ?auto_381792 ?auto_381795 ) ) ( not ( = ?auto_381792 ?auto_381796 ) ) ( not ( = ?auto_381792 ?auto_381797 ) ) ( not ( = ?auto_381792 ?auto_381798 ) ) ( not ( = ?auto_381793 ?auto_381794 ) ) ( not ( = ?auto_381793 ?auto_381795 ) ) ( not ( = ?auto_381793 ?auto_381796 ) ) ( not ( = ?auto_381793 ?auto_381797 ) ) ( not ( = ?auto_381793 ?auto_381798 ) ) ( not ( = ?auto_381794 ?auto_381795 ) ) ( not ( = ?auto_381794 ?auto_381796 ) ) ( not ( = ?auto_381794 ?auto_381797 ) ) ( not ( = ?auto_381794 ?auto_381798 ) ) ( not ( = ?auto_381795 ?auto_381796 ) ) ( not ( = ?auto_381795 ?auto_381797 ) ) ( not ( = ?auto_381795 ?auto_381798 ) ) ( not ( = ?auto_381796 ?auto_381797 ) ) ( not ( = ?auto_381796 ?auto_381798 ) ) ( not ( = ?auto_381797 ?auto_381798 ) ) ( ON ?auto_381796 ?auto_381797 ) ( CLEAR ?auto_381794 ) ( ON ?auto_381795 ?auto_381796 ) ( CLEAR ?auto_381795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_381792 ?auto_381793 ?auto_381794 ?auto_381795 )
      ( MAKE-6PILE ?auto_381792 ?auto_381793 ?auto_381794 ?auto_381795 ?auto_381796 ?auto_381797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381805 - BLOCK
      ?auto_381806 - BLOCK
      ?auto_381807 - BLOCK
      ?auto_381808 - BLOCK
      ?auto_381809 - BLOCK
      ?auto_381810 - BLOCK
    )
    :vars
    (
      ?auto_381811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381810 ?auto_381811 ) ( ON-TABLE ?auto_381805 ) ( ON ?auto_381806 ?auto_381805 ) ( ON ?auto_381807 ?auto_381806 ) ( not ( = ?auto_381805 ?auto_381806 ) ) ( not ( = ?auto_381805 ?auto_381807 ) ) ( not ( = ?auto_381805 ?auto_381808 ) ) ( not ( = ?auto_381805 ?auto_381809 ) ) ( not ( = ?auto_381805 ?auto_381810 ) ) ( not ( = ?auto_381805 ?auto_381811 ) ) ( not ( = ?auto_381806 ?auto_381807 ) ) ( not ( = ?auto_381806 ?auto_381808 ) ) ( not ( = ?auto_381806 ?auto_381809 ) ) ( not ( = ?auto_381806 ?auto_381810 ) ) ( not ( = ?auto_381806 ?auto_381811 ) ) ( not ( = ?auto_381807 ?auto_381808 ) ) ( not ( = ?auto_381807 ?auto_381809 ) ) ( not ( = ?auto_381807 ?auto_381810 ) ) ( not ( = ?auto_381807 ?auto_381811 ) ) ( not ( = ?auto_381808 ?auto_381809 ) ) ( not ( = ?auto_381808 ?auto_381810 ) ) ( not ( = ?auto_381808 ?auto_381811 ) ) ( not ( = ?auto_381809 ?auto_381810 ) ) ( not ( = ?auto_381809 ?auto_381811 ) ) ( not ( = ?auto_381810 ?auto_381811 ) ) ( ON ?auto_381809 ?auto_381810 ) ( CLEAR ?auto_381807 ) ( ON ?auto_381808 ?auto_381809 ) ( CLEAR ?auto_381808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_381805 ?auto_381806 ?auto_381807 ?auto_381808 )
      ( MAKE-6PILE ?auto_381805 ?auto_381806 ?auto_381807 ?auto_381808 ?auto_381809 ?auto_381810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381818 - BLOCK
      ?auto_381819 - BLOCK
      ?auto_381820 - BLOCK
      ?auto_381821 - BLOCK
      ?auto_381822 - BLOCK
      ?auto_381823 - BLOCK
    )
    :vars
    (
      ?auto_381824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381823 ?auto_381824 ) ( ON-TABLE ?auto_381818 ) ( ON ?auto_381819 ?auto_381818 ) ( not ( = ?auto_381818 ?auto_381819 ) ) ( not ( = ?auto_381818 ?auto_381820 ) ) ( not ( = ?auto_381818 ?auto_381821 ) ) ( not ( = ?auto_381818 ?auto_381822 ) ) ( not ( = ?auto_381818 ?auto_381823 ) ) ( not ( = ?auto_381818 ?auto_381824 ) ) ( not ( = ?auto_381819 ?auto_381820 ) ) ( not ( = ?auto_381819 ?auto_381821 ) ) ( not ( = ?auto_381819 ?auto_381822 ) ) ( not ( = ?auto_381819 ?auto_381823 ) ) ( not ( = ?auto_381819 ?auto_381824 ) ) ( not ( = ?auto_381820 ?auto_381821 ) ) ( not ( = ?auto_381820 ?auto_381822 ) ) ( not ( = ?auto_381820 ?auto_381823 ) ) ( not ( = ?auto_381820 ?auto_381824 ) ) ( not ( = ?auto_381821 ?auto_381822 ) ) ( not ( = ?auto_381821 ?auto_381823 ) ) ( not ( = ?auto_381821 ?auto_381824 ) ) ( not ( = ?auto_381822 ?auto_381823 ) ) ( not ( = ?auto_381822 ?auto_381824 ) ) ( not ( = ?auto_381823 ?auto_381824 ) ) ( ON ?auto_381822 ?auto_381823 ) ( ON ?auto_381821 ?auto_381822 ) ( CLEAR ?auto_381819 ) ( ON ?auto_381820 ?auto_381821 ) ( CLEAR ?auto_381820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381818 ?auto_381819 ?auto_381820 )
      ( MAKE-6PILE ?auto_381818 ?auto_381819 ?auto_381820 ?auto_381821 ?auto_381822 ?auto_381823 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381831 - BLOCK
      ?auto_381832 - BLOCK
      ?auto_381833 - BLOCK
      ?auto_381834 - BLOCK
      ?auto_381835 - BLOCK
      ?auto_381836 - BLOCK
    )
    :vars
    (
      ?auto_381837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381836 ?auto_381837 ) ( ON-TABLE ?auto_381831 ) ( ON ?auto_381832 ?auto_381831 ) ( not ( = ?auto_381831 ?auto_381832 ) ) ( not ( = ?auto_381831 ?auto_381833 ) ) ( not ( = ?auto_381831 ?auto_381834 ) ) ( not ( = ?auto_381831 ?auto_381835 ) ) ( not ( = ?auto_381831 ?auto_381836 ) ) ( not ( = ?auto_381831 ?auto_381837 ) ) ( not ( = ?auto_381832 ?auto_381833 ) ) ( not ( = ?auto_381832 ?auto_381834 ) ) ( not ( = ?auto_381832 ?auto_381835 ) ) ( not ( = ?auto_381832 ?auto_381836 ) ) ( not ( = ?auto_381832 ?auto_381837 ) ) ( not ( = ?auto_381833 ?auto_381834 ) ) ( not ( = ?auto_381833 ?auto_381835 ) ) ( not ( = ?auto_381833 ?auto_381836 ) ) ( not ( = ?auto_381833 ?auto_381837 ) ) ( not ( = ?auto_381834 ?auto_381835 ) ) ( not ( = ?auto_381834 ?auto_381836 ) ) ( not ( = ?auto_381834 ?auto_381837 ) ) ( not ( = ?auto_381835 ?auto_381836 ) ) ( not ( = ?auto_381835 ?auto_381837 ) ) ( not ( = ?auto_381836 ?auto_381837 ) ) ( ON ?auto_381835 ?auto_381836 ) ( ON ?auto_381834 ?auto_381835 ) ( CLEAR ?auto_381832 ) ( ON ?auto_381833 ?auto_381834 ) ( CLEAR ?auto_381833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_381831 ?auto_381832 ?auto_381833 )
      ( MAKE-6PILE ?auto_381831 ?auto_381832 ?auto_381833 ?auto_381834 ?auto_381835 ?auto_381836 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381844 - BLOCK
      ?auto_381845 - BLOCK
      ?auto_381846 - BLOCK
      ?auto_381847 - BLOCK
      ?auto_381848 - BLOCK
      ?auto_381849 - BLOCK
    )
    :vars
    (
      ?auto_381850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381849 ?auto_381850 ) ( ON-TABLE ?auto_381844 ) ( not ( = ?auto_381844 ?auto_381845 ) ) ( not ( = ?auto_381844 ?auto_381846 ) ) ( not ( = ?auto_381844 ?auto_381847 ) ) ( not ( = ?auto_381844 ?auto_381848 ) ) ( not ( = ?auto_381844 ?auto_381849 ) ) ( not ( = ?auto_381844 ?auto_381850 ) ) ( not ( = ?auto_381845 ?auto_381846 ) ) ( not ( = ?auto_381845 ?auto_381847 ) ) ( not ( = ?auto_381845 ?auto_381848 ) ) ( not ( = ?auto_381845 ?auto_381849 ) ) ( not ( = ?auto_381845 ?auto_381850 ) ) ( not ( = ?auto_381846 ?auto_381847 ) ) ( not ( = ?auto_381846 ?auto_381848 ) ) ( not ( = ?auto_381846 ?auto_381849 ) ) ( not ( = ?auto_381846 ?auto_381850 ) ) ( not ( = ?auto_381847 ?auto_381848 ) ) ( not ( = ?auto_381847 ?auto_381849 ) ) ( not ( = ?auto_381847 ?auto_381850 ) ) ( not ( = ?auto_381848 ?auto_381849 ) ) ( not ( = ?auto_381848 ?auto_381850 ) ) ( not ( = ?auto_381849 ?auto_381850 ) ) ( ON ?auto_381848 ?auto_381849 ) ( ON ?auto_381847 ?auto_381848 ) ( ON ?auto_381846 ?auto_381847 ) ( CLEAR ?auto_381844 ) ( ON ?auto_381845 ?auto_381846 ) ( CLEAR ?auto_381845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381844 ?auto_381845 )
      ( MAKE-6PILE ?auto_381844 ?auto_381845 ?auto_381846 ?auto_381847 ?auto_381848 ?auto_381849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381857 - BLOCK
      ?auto_381858 - BLOCK
      ?auto_381859 - BLOCK
      ?auto_381860 - BLOCK
      ?auto_381861 - BLOCK
      ?auto_381862 - BLOCK
    )
    :vars
    (
      ?auto_381863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381862 ?auto_381863 ) ( ON-TABLE ?auto_381857 ) ( not ( = ?auto_381857 ?auto_381858 ) ) ( not ( = ?auto_381857 ?auto_381859 ) ) ( not ( = ?auto_381857 ?auto_381860 ) ) ( not ( = ?auto_381857 ?auto_381861 ) ) ( not ( = ?auto_381857 ?auto_381862 ) ) ( not ( = ?auto_381857 ?auto_381863 ) ) ( not ( = ?auto_381858 ?auto_381859 ) ) ( not ( = ?auto_381858 ?auto_381860 ) ) ( not ( = ?auto_381858 ?auto_381861 ) ) ( not ( = ?auto_381858 ?auto_381862 ) ) ( not ( = ?auto_381858 ?auto_381863 ) ) ( not ( = ?auto_381859 ?auto_381860 ) ) ( not ( = ?auto_381859 ?auto_381861 ) ) ( not ( = ?auto_381859 ?auto_381862 ) ) ( not ( = ?auto_381859 ?auto_381863 ) ) ( not ( = ?auto_381860 ?auto_381861 ) ) ( not ( = ?auto_381860 ?auto_381862 ) ) ( not ( = ?auto_381860 ?auto_381863 ) ) ( not ( = ?auto_381861 ?auto_381862 ) ) ( not ( = ?auto_381861 ?auto_381863 ) ) ( not ( = ?auto_381862 ?auto_381863 ) ) ( ON ?auto_381861 ?auto_381862 ) ( ON ?auto_381860 ?auto_381861 ) ( ON ?auto_381859 ?auto_381860 ) ( CLEAR ?auto_381857 ) ( ON ?auto_381858 ?auto_381859 ) ( CLEAR ?auto_381858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_381857 ?auto_381858 )
      ( MAKE-6PILE ?auto_381857 ?auto_381858 ?auto_381859 ?auto_381860 ?auto_381861 ?auto_381862 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381870 - BLOCK
      ?auto_381871 - BLOCK
      ?auto_381872 - BLOCK
      ?auto_381873 - BLOCK
      ?auto_381874 - BLOCK
      ?auto_381875 - BLOCK
    )
    :vars
    (
      ?auto_381876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381875 ?auto_381876 ) ( not ( = ?auto_381870 ?auto_381871 ) ) ( not ( = ?auto_381870 ?auto_381872 ) ) ( not ( = ?auto_381870 ?auto_381873 ) ) ( not ( = ?auto_381870 ?auto_381874 ) ) ( not ( = ?auto_381870 ?auto_381875 ) ) ( not ( = ?auto_381870 ?auto_381876 ) ) ( not ( = ?auto_381871 ?auto_381872 ) ) ( not ( = ?auto_381871 ?auto_381873 ) ) ( not ( = ?auto_381871 ?auto_381874 ) ) ( not ( = ?auto_381871 ?auto_381875 ) ) ( not ( = ?auto_381871 ?auto_381876 ) ) ( not ( = ?auto_381872 ?auto_381873 ) ) ( not ( = ?auto_381872 ?auto_381874 ) ) ( not ( = ?auto_381872 ?auto_381875 ) ) ( not ( = ?auto_381872 ?auto_381876 ) ) ( not ( = ?auto_381873 ?auto_381874 ) ) ( not ( = ?auto_381873 ?auto_381875 ) ) ( not ( = ?auto_381873 ?auto_381876 ) ) ( not ( = ?auto_381874 ?auto_381875 ) ) ( not ( = ?auto_381874 ?auto_381876 ) ) ( not ( = ?auto_381875 ?auto_381876 ) ) ( ON ?auto_381874 ?auto_381875 ) ( ON ?auto_381873 ?auto_381874 ) ( ON ?auto_381872 ?auto_381873 ) ( ON ?auto_381871 ?auto_381872 ) ( ON ?auto_381870 ?auto_381871 ) ( CLEAR ?auto_381870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381870 )
      ( MAKE-6PILE ?auto_381870 ?auto_381871 ?auto_381872 ?auto_381873 ?auto_381874 ?auto_381875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_381883 - BLOCK
      ?auto_381884 - BLOCK
      ?auto_381885 - BLOCK
      ?auto_381886 - BLOCK
      ?auto_381887 - BLOCK
      ?auto_381888 - BLOCK
    )
    :vars
    (
      ?auto_381889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381888 ?auto_381889 ) ( not ( = ?auto_381883 ?auto_381884 ) ) ( not ( = ?auto_381883 ?auto_381885 ) ) ( not ( = ?auto_381883 ?auto_381886 ) ) ( not ( = ?auto_381883 ?auto_381887 ) ) ( not ( = ?auto_381883 ?auto_381888 ) ) ( not ( = ?auto_381883 ?auto_381889 ) ) ( not ( = ?auto_381884 ?auto_381885 ) ) ( not ( = ?auto_381884 ?auto_381886 ) ) ( not ( = ?auto_381884 ?auto_381887 ) ) ( not ( = ?auto_381884 ?auto_381888 ) ) ( not ( = ?auto_381884 ?auto_381889 ) ) ( not ( = ?auto_381885 ?auto_381886 ) ) ( not ( = ?auto_381885 ?auto_381887 ) ) ( not ( = ?auto_381885 ?auto_381888 ) ) ( not ( = ?auto_381885 ?auto_381889 ) ) ( not ( = ?auto_381886 ?auto_381887 ) ) ( not ( = ?auto_381886 ?auto_381888 ) ) ( not ( = ?auto_381886 ?auto_381889 ) ) ( not ( = ?auto_381887 ?auto_381888 ) ) ( not ( = ?auto_381887 ?auto_381889 ) ) ( not ( = ?auto_381888 ?auto_381889 ) ) ( ON ?auto_381887 ?auto_381888 ) ( ON ?auto_381886 ?auto_381887 ) ( ON ?auto_381885 ?auto_381886 ) ( ON ?auto_381884 ?auto_381885 ) ( ON ?auto_381883 ?auto_381884 ) ( CLEAR ?auto_381883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_381883 )
      ( MAKE-6PILE ?auto_381883 ?auto_381884 ?auto_381885 ?auto_381886 ?auto_381887 ?auto_381888 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_381897 - BLOCK
      ?auto_381898 - BLOCK
      ?auto_381899 - BLOCK
      ?auto_381900 - BLOCK
      ?auto_381901 - BLOCK
      ?auto_381902 - BLOCK
      ?auto_381903 - BLOCK
    )
    :vars
    (
      ?auto_381904 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381902 ) ( ON ?auto_381903 ?auto_381904 ) ( CLEAR ?auto_381903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381897 ) ( ON ?auto_381898 ?auto_381897 ) ( ON ?auto_381899 ?auto_381898 ) ( ON ?auto_381900 ?auto_381899 ) ( ON ?auto_381901 ?auto_381900 ) ( ON ?auto_381902 ?auto_381901 ) ( not ( = ?auto_381897 ?auto_381898 ) ) ( not ( = ?auto_381897 ?auto_381899 ) ) ( not ( = ?auto_381897 ?auto_381900 ) ) ( not ( = ?auto_381897 ?auto_381901 ) ) ( not ( = ?auto_381897 ?auto_381902 ) ) ( not ( = ?auto_381897 ?auto_381903 ) ) ( not ( = ?auto_381897 ?auto_381904 ) ) ( not ( = ?auto_381898 ?auto_381899 ) ) ( not ( = ?auto_381898 ?auto_381900 ) ) ( not ( = ?auto_381898 ?auto_381901 ) ) ( not ( = ?auto_381898 ?auto_381902 ) ) ( not ( = ?auto_381898 ?auto_381903 ) ) ( not ( = ?auto_381898 ?auto_381904 ) ) ( not ( = ?auto_381899 ?auto_381900 ) ) ( not ( = ?auto_381899 ?auto_381901 ) ) ( not ( = ?auto_381899 ?auto_381902 ) ) ( not ( = ?auto_381899 ?auto_381903 ) ) ( not ( = ?auto_381899 ?auto_381904 ) ) ( not ( = ?auto_381900 ?auto_381901 ) ) ( not ( = ?auto_381900 ?auto_381902 ) ) ( not ( = ?auto_381900 ?auto_381903 ) ) ( not ( = ?auto_381900 ?auto_381904 ) ) ( not ( = ?auto_381901 ?auto_381902 ) ) ( not ( = ?auto_381901 ?auto_381903 ) ) ( not ( = ?auto_381901 ?auto_381904 ) ) ( not ( = ?auto_381902 ?auto_381903 ) ) ( not ( = ?auto_381902 ?auto_381904 ) ) ( not ( = ?auto_381903 ?auto_381904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381903 ?auto_381904 )
      ( !STACK ?auto_381903 ?auto_381902 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_381912 - BLOCK
      ?auto_381913 - BLOCK
      ?auto_381914 - BLOCK
      ?auto_381915 - BLOCK
      ?auto_381916 - BLOCK
      ?auto_381917 - BLOCK
      ?auto_381918 - BLOCK
    )
    :vars
    (
      ?auto_381919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_381917 ) ( ON ?auto_381918 ?auto_381919 ) ( CLEAR ?auto_381918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_381912 ) ( ON ?auto_381913 ?auto_381912 ) ( ON ?auto_381914 ?auto_381913 ) ( ON ?auto_381915 ?auto_381914 ) ( ON ?auto_381916 ?auto_381915 ) ( ON ?auto_381917 ?auto_381916 ) ( not ( = ?auto_381912 ?auto_381913 ) ) ( not ( = ?auto_381912 ?auto_381914 ) ) ( not ( = ?auto_381912 ?auto_381915 ) ) ( not ( = ?auto_381912 ?auto_381916 ) ) ( not ( = ?auto_381912 ?auto_381917 ) ) ( not ( = ?auto_381912 ?auto_381918 ) ) ( not ( = ?auto_381912 ?auto_381919 ) ) ( not ( = ?auto_381913 ?auto_381914 ) ) ( not ( = ?auto_381913 ?auto_381915 ) ) ( not ( = ?auto_381913 ?auto_381916 ) ) ( not ( = ?auto_381913 ?auto_381917 ) ) ( not ( = ?auto_381913 ?auto_381918 ) ) ( not ( = ?auto_381913 ?auto_381919 ) ) ( not ( = ?auto_381914 ?auto_381915 ) ) ( not ( = ?auto_381914 ?auto_381916 ) ) ( not ( = ?auto_381914 ?auto_381917 ) ) ( not ( = ?auto_381914 ?auto_381918 ) ) ( not ( = ?auto_381914 ?auto_381919 ) ) ( not ( = ?auto_381915 ?auto_381916 ) ) ( not ( = ?auto_381915 ?auto_381917 ) ) ( not ( = ?auto_381915 ?auto_381918 ) ) ( not ( = ?auto_381915 ?auto_381919 ) ) ( not ( = ?auto_381916 ?auto_381917 ) ) ( not ( = ?auto_381916 ?auto_381918 ) ) ( not ( = ?auto_381916 ?auto_381919 ) ) ( not ( = ?auto_381917 ?auto_381918 ) ) ( not ( = ?auto_381917 ?auto_381919 ) ) ( not ( = ?auto_381918 ?auto_381919 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_381918 ?auto_381919 )
      ( !STACK ?auto_381918 ?auto_381917 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_381927 - BLOCK
      ?auto_381928 - BLOCK
      ?auto_381929 - BLOCK
      ?auto_381930 - BLOCK
      ?auto_381931 - BLOCK
      ?auto_381932 - BLOCK
      ?auto_381933 - BLOCK
    )
    :vars
    (
      ?auto_381934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381933 ?auto_381934 ) ( ON-TABLE ?auto_381927 ) ( ON ?auto_381928 ?auto_381927 ) ( ON ?auto_381929 ?auto_381928 ) ( ON ?auto_381930 ?auto_381929 ) ( ON ?auto_381931 ?auto_381930 ) ( not ( = ?auto_381927 ?auto_381928 ) ) ( not ( = ?auto_381927 ?auto_381929 ) ) ( not ( = ?auto_381927 ?auto_381930 ) ) ( not ( = ?auto_381927 ?auto_381931 ) ) ( not ( = ?auto_381927 ?auto_381932 ) ) ( not ( = ?auto_381927 ?auto_381933 ) ) ( not ( = ?auto_381927 ?auto_381934 ) ) ( not ( = ?auto_381928 ?auto_381929 ) ) ( not ( = ?auto_381928 ?auto_381930 ) ) ( not ( = ?auto_381928 ?auto_381931 ) ) ( not ( = ?auto_381928 ?auto_381932 ) ) ( not ( = ?auto_381928 ?auto_381933 ) ) ( not ( = ?auto_381928 ?auto_381934 ) ) ( not ( = ?auto_381929 ?auto_381930 ) ) ( not ( = ?auto_381929 ?auto_381931 ) ) ( not ( = ?auto_381929 ?auto_381932 ) ) ( not ( = ?auto_381929 ?auto_381933 ) ) ( not ( = ?auto_381929 ?auto_381934 ) ) ( not ( = ?auto_381930 ?auto_381931 ) ) ( not ( = ?auto_381930 ?auto_381932 ) ) ( not ( = ?auto_381930 ?auto_381933 ) ) ( not ( = ?auto_381930 ?auto_381934 ) ) ( not ( = ?auto_381931 ?auto_381932 ) ) ( not ( = ?auto_381931 ?auto_381933 ) ) ( not ( = ?auto_381931 ?auto_381934 ) ) ( not ( = ?auto_381932 ?auto_381933 ) ) ( not ( = ?auto_381932 ?auto_381934 ) ) ( not ( = ?auto_381933 ?auto_381934 ) ) ( CLEAR ?auto_381931 ) ( ON ?auto_381932 ?auto_381933 ) ( CLEAR ?auto_381932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_381927 ?auto_381928 ?auto_381929 ?auto_381930 ?auto_381931 ?auto_381932 )
      ( MAKE-7PILE ?auto_381927 ?auto_381928 ?auto_381929 ?auto_381930 ?auto_381931 ?auto_381932 ?auto_381933 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_381942 - BLOCK
      ?auto_381943 - BLOCK
      ?auto_381944 - BLOCK
      ?auto_381945 - BLOCK
      ?auto_381946 - BLOCK
      ?auto_381947 - BLOCK
      ?auto_381948 - BLOCK
    )
    :vars
    (
      ?auto_381949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381948 ?auto_381949 ) ( ON-TABLE ?auto_381942 ) ( ON ?auto_381943 ?auto_381942 ) ( ON ?auto_381944 ?auto_381943 ) ( ON ?auto_381945 ?auto_381944 ) ( ON ?auto_381946 ?auto_381945 ) ( not ( = ?auto_381942 ?auto_381943 ) ) ( not ( = ?auto_381942 ?auto_381944 ) ) ( not ( = ?auto_381942 ?auto_381945 ) ) ( not ( = ?auto_381942 ?auto_381946 ) ) ( not ( = ?auto_381942 ?auto_381947 ) ) ( not ( = ?auto_381942 ?auto_381948 ) ) ( not ( = ?auto_381942 ?auto_381949 ) ) ( not ( = ?auto_381943 ?auto_381944 ) ) ( not ( = ?auto_381943 ?auto_381945 ) ) ( not ( = ?auto_381943 ?auto_381946 ) ) ( not ( = ?auto_381943 ?auto_381947 ) ) ( not ( = ?auto_381943 ?auto_381948 ) ) ( not ( = ?auto_381943 ?auto_381949 ) ) ( not ( = ?auto_381944 ?auto_381945 ) ) ( not ( = ?auto_381944 ?auto_381946 ) ) ( not ( = ?auto_381944 ?auto_381947 ) ) ( not ( = ?auto_381944 ?auto_381948 ) ) ( not ( = ?auto_381944 ?auto_381949 ) ) ( not ( = ?auto_381945 ?auto_381946 ) ) ( not ( = ?auto_381945 ?auto_381947 ) ) ( not ( = ?auto_381945 ?auto_381948 ) ) ( not ( = ?auto_381945 ?auto_381949 ) ) ( not ( = ?auto_381946 ?auto_381947 ) ) ( not ( = ?auto_381946 ?auto_381948 ) ) ( not ( = ?auto_381946 ?auto_381949 ) ) ( not ( = ?auto_381947 ?auto_381948 ) ) ( not ( = ?auto_381947 ?auto_381949 ) ) ( not ( = ?auto_381948 ?auto_381949 ) ) ( CLEAR ?auto_381946 ) ( ON ?auto_381947 ?auto_381948 ) ( CLEAR ?auto_381947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_381942 ?auto_381943 ?auto_381944 ?auto_381945 ?auto_381946 ?auto_381947 )
      ( MAKE-7PILE ?auto_381942 ?auto_381943 ?auto_381944 ?auto_381945 ?auto_381946 ?auto_381947 ?auto_381948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_381957 - BLOCK
      ?auto_381958 - BLOCK
      ?auto_381959 - BLOCK
      ?auto_381960 - BLOCK
      ?auto_381961 - BLOCK
      ?auto_381962 - BLOCK
      ?auto_381963 - BLOCK
    )
    :vars
    (
      ?auto_381964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381963 ?auto_381964 ) ( ON-TABLE ?auto_381957 ) ( ON ?auto_381958 ?auto_381957 ) ( ON ?auto_381959 ?auto_381958 ) ( ON ?auto_381960 ?auto_381959 ) ( not ( = ?auto_381957 ?auto_381958 ) ) ( not ( = ?auto_381957 ?auto_381959 ) ) ( not ( = ?auto_381957 ?auto_381960 ) ) ( not ( = ?auto_381957 ?auto_381961 ) ) ( not ( = ?auto_381957 ?auto_381962 ) ) ( not ( = ?auto_381957 ?auto_381963 ) ) ( not ( = ?auto_381957 ?auto_381964 ) ) ( not ( = ?auto_381958 ?auto_381959 ) ) ( not ( = ?auto_381958 ?auto_381960 ) ) ( not ( = ?auto_381958 ?auto_381961 ) ) ( not ( = ?auto_381958 ?auto_381962 ) ) ( not ( = ?auto_381958 ?auto_381963 ) ) ( not ( = ?auto_381958 ?auto_381964 ) ) ( not ( = ?auto_381959 ?auto_381960 ) ) ( not ( = ?auto_381959 ?auto_381961 ) ) ( not ( = ?auto_381959 ?auto_381962 ) ) ( not ( = ?auto_381959 ?auto_381963 ) ) ( not ( = ?auto_381959 ?auto_381964 ) ) ( not ( = ?auto_381960 ?auto_381961 ) ) ( not ( = ?auto_381960 ?auto_381962 ) ) ( not ( = ?auto_381960 ?auto_381963 ) ) ( not ( = ?auto_381960 ?auto_381964 ) ) ( not ( = ?auto_381961 ?auto_381962 ) ) ( not ( = ?auto_381961 ?auto_381963 ) ) ( not ( = ?auto_381961 ?auto_381964 ) ) ( not ( = ?auto_381962 ?auto_381963 ) ) ( not ( = ?auto_381962 ?auto_381964 ) ) ( not ( = ?auto_381963 ?auto_381964 ) ) ( ON ?auto_381962 ?auto_381963 ) ( CLEAR ?auto_381960 ) ( ON ?auto_381961 ?auto_381962 ) ( CLEAR ?auto_381961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_381957 ?auto_381958 ?auto_381959 ?auto_381960 ?auto_381961 )
      ( MAKE-7PILE ?auto_381957 ?auto_381958 ?auto_381959 ?auto_381960 ?auto_381961 ?auto_381962 ?auto_381963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_381972 - BLOCK
      ?auto_381973 - BLOCK
      ?auto_381974 - BLOCK
      ?auto_381975 - BLOCK
      ?auto_381976 - BLOCK
      ?auto_381977 - BLOCK
      ?auto_381978 - BLOCK
    )
    :vars
    (
      ?auto_381979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381978 ?auto_381979 ) ( ON-TABLE ?auto_381972 ) ( ON ?auto_381973 ?auto_381972 ) ( ON ?auto_381974 ?auto_381973 ) ( ON ?auto_381975 ?auto_381974 ) ( not ( = ?auto_381972 ?auto_381973 ) ) ( not ( = ?auto_381972 ?auto_381974 ) ) ( not ( = ?auto_381972 ?auto_381975 ) ) ( not ( = ?auto_381972 ?auto_381976 ) ) ( not ( = ?auto_381972 ?auto_381977 ) ) ( not ( = ?auto_381972 ?auto_381978 ) ) ( not ( = ?auto_381972 ?auto_381979 ) ) ( not ( = ?auto_381973 ?auto_381974 ) ) ( not ( = ?auto_381973 ?auto_381975 ) ) ( not ( = ?auto_381973 ?auto_381976 ) ) ( not ( = ?auto_381973 ?auto_381977 ) ) ( not ( = ?auto_381973 ?auto_381978 ) ) ( not ( = ?auto_381973 ?auto_381979 ) ) ( not ( = ?auto_381974 ?auto_381975 ) ) ( not ( = ?auto_381974 ?auto_381976 ) ) ( not ( = ?auto_381974 ?auto_381977 ) ) ( not ( = ?auto_381974 ?auto_381978 ) ) ( not ( = ?auto_381974 ?auto_381979 ) ) ( not ( = ?auto_381975 ?auto_381976 ) ) ( not ( = ?auto_381975 ?auto_381977 ) ) ( not ( = ?auto_381975 ?auto_381978 ) ) ( not ( = ?auto_381975 ?auto_381979 ) ) ( not ( = ?auto_381976 ?auto_381977 ) ) ( not ( = ?auto_381976 ?auto_381978 ) ) ( not ( = ?auto_381976 ?auto_381979 ) ) ( not ( = ?auto_381977 ?auto_381978 ) ) ( not ( = ?auto_381977 ?auto_381979 ) ) ( not ( = ?auto_381978 ?auto_381979 ) ) ( ON ?auto_381977 ?auto_381978 ) ( CLEAR ?auto_381975 ) ( ON ?auto_381976 ?auto_381977 ) ( CLEAR ?auto_381976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_381972 ?auto_381973 ?auto_381974 ?auto_381975 ?auto_381976 )
      ( MAKE-7PILE ?auto_381972 ?auto_381973 ?auto_381974 ?auto_381975 ?auto_381976 ?auto_381977 ?auto_381978 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_381987 - BLOCK
      ?auto_381988 - BLOCK
      ?auto_381989 - BLOCK
      ?auto_381990 - BLOCK
      ?auto_381991 - BLOCK
      ?auto_381992 - BLOCK
      ?auto_381993 - BLOCK
    )
    :vars
    (
      ?auto_381994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_381993 ?auto_381994 ) ( ON-TABLE ?auto_381987 ) ( ON ?auto_381988 ?auto_381987 ) ( ON ?auto_381989 ?auto_381988 ) ( not ( = ?auto_381987 ?auto_381988 ) ) ( not ( = ?auto_381987 ?auto_381989 ) ) ( not ( = ?auto_381987 ?auto_381990 ) ) ( not ( = ?auto_381987 ?auto_381991 ) ) ( not ( = ?auto_381987 ?auto_381992 ) ) ( not ( = ?auto_381987 ?auto_381993 ) ) ( not ( = ?auto_381987 ?auto_381994 ) ) ( not ( = ?auto_381988 ?auto_381989 ) ) ( not ( = ?auto_381988 ?auto_381990 ) ) ( not ( = ?auto_381988 ?auto_381991 ) ) ( not ( = ?auto_381988 ?auto_381992 ) ) ( not ( = ?auto_381988 ?auto_381993 ) ) ( not ( = ?auto_381988 ?auto_381994 ) ) ( not ( = ?auto_381989 ?auto_381990 ) ) ( not ( = ?auto_381989 ?auto_381991 ) ) ( not ( = ?auto_381989 ?auto_381992 ) ) ( not ( = ?auto_381989 ?auto_381993 ) ) ( not ( = ?auto_381989 ?auto_381994 ) ) ( not ( = ?auto_381990 ?auto_381991 ) ) ( not ( = ?auto_381990 ?auto_381992 ) ) ( not ( = ?auto_381990 ?auto_381993 ) ) ( not ( = ?auto_381990 ?auto_381994 ) ) ( not ( = ?auto_381991 ?auto_381992 ) ) ( not ( = ?auto_381991 ?auto_381993 ) ) ( not ( = ?auto_381991 ?auto_381994 ) ) ( not ( = ?auto_381992 ?auto_381993 ) ) ( not ( = ?auto_381992 ?auto_381994 ) ) ( not ( = ?auto_381993 ?auto_381994 ) ) ( ON ?auto_381992 ?auto_381993 ) ( ON ?auto_381991 ?auto_381992 ) ( CLEAR ?auto_381989 ) ( ON ?auto_381990 ?auto_381991 ) ( CLEAR ?auto_381990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_381987 ?auto_381988 ?auto_381989 ?auto_381990 )
      ( MAKE-7PILE ?auto_381987 ?auto_381988 ?auto_381989 ?auto_381990 ?auto_381991 ?auto_381992 ?auto_381993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_382002 - BLOCK
      ?auto_382003 - BLOCK
      ?auto_382004 - BLOCK
      ?auto_382005 - BLOCK
      ?auto_382006 - BLOCK
      ?auto_382007 - BLOCK
      ?auto_382008 - BLOCK
    )
    :vars
    (
      ?auto_382009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382008 ?auto_382009 ) ( ON-TABLE ?auto_382002 ) ( ON ?auto_382003 ?auto_382002 ) ( ON ?auto_382004 ?auto_382003 ) ( not ( = ?auto_382002 ?auto_382003 ) ) ( not ( = ?auto_382002 ?auto_382004 ) ) ( not ( = ?auto_382002 ?auto_382005 ) ) ( not ( = ?auto_382002 ?auto_382006 ) ) ( not ( = ?auto_382002 ?auto_382007 ) ) ( not ( = ?auto_382002 ?auto_382008 ) ) ( not ( = ?auto_382002 ?auto_382009 ) ) ( not ( = ?auto_382003 ?auto_382004 ) ) ( not ( = ?auto_382003 ?auto_382005 ) ) ( not ( = ?auto_382003 ?auto_382006 ) ) ( not ( = ?auto_382003 ?auto_382007 ) ) ( not ( = ?auto_382003 ?auto_382008 ) ) ( not ( = ?auto_382003 ?auto_382009 ) ) ( not ( = ?auto_382004 ?auto_382005 ) ) ( not ( = ?auto_382004 ?auto_382006 ) ) ( not ( = ?auto_382004 ?auto_382007 ) ) ( not ( = ?auto_382004 ?auto_382008 ) ) ( not ( = ?auto_382004 ?auto_382009 ) ) ( not ( = ?auto_382005 ?auto_382006 ) ) ( not ( = ?auto_382005 ?auto_382007 ) ) ( not ( = ?auto_382005 ?auto_382008 ) ) ( not ( = ?auto_382005 ?auto_382009 ) ) ( not ( = ?auto_382006 ?auto_382007 ) ) ( not ( = ?auto_382006 ?auto_382008 ) ) ( not ( = ?auto_382006 ?auto_382009 ) ) ( not ( = ?auto_382007 ?auto_382008 ) ) ( not ( = ?auto_382007 ?auto_382009 ) ) ( not ( = ?auto_382008 ?auto_382009 ) ) ( ON ?auto_382007 ?auto_382008 ) ( ON ?auto_382006 ?auto_382007 ) ( CLEAR ?auto_382004 ) ( ON ?auto_382005 ?auto_382006 ) ( CLEAR ?auto_382005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_382002 ?auto_382003 ?auto_382004 ?auto_382005 )
      ( MAKE-7PILE ?auto_382002 ?auto_382003 ?auto_382004 ?auto_382005 ?auto_382006 ?auto_382007 ?auto_382008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_382017 - BLOCK
      ?auto_382018 - BLOCK
      ?auto_382019 - BLOCK
      ?auto_382020 - BLOCK
      ?auto_382021 - BLOCK
      ?auto_382022 - BLOCK
      ?auto_382023 - BLOCK
    )
    :vars
    (
      ?auto_382024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382023 ?auto_382024 ) ( ON-TABLE ?auto_382017 ) ( ON ?auto_382018 ?auto_382017 ) ( not ( = ?auto_382017 ?auto_382018 ) ) ( not ( = ?auto_382017 ?auto_382019 ) ) ( not ( = ?auto_382017 ?auto_382020 ) ) ( not ( = ?auto_382017 ?auto_382021 ) ) ( not ( = ?auto_382017 ?auto_382022 ) ) ( not ( = ?auto_382017 ?auto_382023 ) ) ( not ( = ?auto_382017 ?auto_382024 ) ) ( not ( = ?auto_382018 ?auto_382019 ) ) ( not ( = ?auto_382018 ?auto_382020 ) ) ( not ( = ?auto_382018 ?auto_382021 ) ) ( not ( = ?auto_382018 ?auto_382022 ) ) ( not ( = ?auto_382018 ?auto_382023 ) ) ( not ( = ?auto_382018 ?auto_382024 ) ) ( not ( = ?auto_382019 ?auto_382020 ) ) ( not ( = ?auto_382019 ?auto_382021 ) ) ( not ( = ?auto_382019 ?auto_382022 ) ) ( not ( = ?auto_382019 ?auto_382023 ) ) ( not ( = ?auto_382019 ?auto_382024 ) ) ( not ( = ?auto_382020 ?auto_382021 ) ) ( not ( = ?auto_382020 ?auto_382022 ) ) ( not ( = ?auto_382020 ?auto_382023 ) ) ( not ( = ?auto_382020 ?auto_382024 ) ) ( not ( = ?auto_382021 ?auto_382022 ) ) ( not ( = ?auto_382021 ?auto_382023 ) ) ( not ( = ?auto_382021 ?auto_382024 ) ) ( not ( = ?auto_382022 ?auto_382023 ) ) ( not ( = ?auto_382022 ?auto_382024 ) ) ( not ( = ?auto_382023 ?auto_382024 ) ) ( ON ?auto_382022 ?auto_382023 ) ( ON ?auto_382021 ?auto_382022 ) ( ON ?auto_382020 ?auto_382021 ) ( CLEAR ?auto_382018 ) ( ON ?auto_382019 ?auto_382020 ) ( CLEAR ?auto_382019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_382017 ?auto_382018 ?auto_382019 )
      ( MAKE-7PILE ?auto_382017 ?auto_382018 ?auto_382019 ?auto_382020 ?auto_382021 ?auto_382022 ?auto_382023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_382032 - BLOCK
      ?auto_382033 - BLOCK
      ?auto_382034 - BLOCK
      ?auto_382035 - BLOCK
      ?auto_382036 - BLOCK
      ?auto_382037 - BLOCK
      ?auto_382038 - BLOCK
    )
    :vars
    (
      ?auto_382039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382038 ?auto_382039 ) ( ON-TABLE ?auto_382032 ) ( ON ?auto_382033 ?auto_382032 ) ( not ( = ?auto_382032 ?auto_382033 ) ) ( not ( = ?auto_382032 ?auto_382034 ) ) ( not ( = ?auto_382032 ?auto_382035 ) ) ( not ( = ?auto_382032 ?auto_382036 ) ) ( not ( = ?auto_382032 ?auto_382037 ) ) ( not ( = ?auto_382032 ?auto_382038 ) ) ( not ( = ?auto_382032 ?auto_382039 ) ) ( not ( = ?auto_382033 ?auto_382034 ) ) ( not ( = ?auto_382033 ?auto_382035 ) ) ( not ( = ?auto_382033 ?auto_382036 ) ) ( not ( = ?auto_382033 ?auto_382037 ) ) ( not ( = ?auto_382033 ?auto_382038 ) ) ( not ( = ?auto_382033 ?auto_382039 ) ) ( not ( = ?auto_382034 ?auto_382035 ) ) ( not ( = ?auto_382034 ?auto_382036 ) ) ( not ( = ?auto_382034 ?auto_382037 ) ) ( not ( = ?auto_382034 ?auto_382038 ) ) ( not ( = ?auto_382034 ?auto_382039 ) ) ( not ( = ?auto_382035 ?auto_382036 ) ) ( not ( = ?auto_382035 ?auto_382037 ) ) ( not ( = ?auto_382035 ?auto_382038 ) ) ( not ( = ?auto_382035 ?auto_382039 ) ) ( not ( = ?auto_382036 ?auto_382037 ) ) ( not ( = ?auto_382036 ?auto_382038 ) ) ( not ( = ?auto_382036 ?auto_382039 ) ) ( not ( = ?auto_382037 ?auto_382038 ) ) ( not ( = ?auto_382037 ?auto_382039 ) ) ( not ( = ?auto_382038 ?auto_382039 ) ) ( ON ?auto_382037 ?auto_382038 ) ( ON ?auto_382036 ?auto_382037 ) ( ON ?auto_382035 ?auto_382036 ) ( CLEAR ?auto_382033 ) ( ON ?auto_382034 ?auto_382035 ) ( CLEAR ?auto_382034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_382032 ?auto_382033 ?auto_382034 )
      ( MAKE-7PILE ?auto_382032 ?auto_382033 ?auto_382034 ?auto_382035 ?auto_382036 ?auto_382037 ?auto_382038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_382047 - BLOCK
      ?auto_382048 - BLOCK
      ?auto_382049 - BLOCK
      ?auto_382050 - BLOCK
      ?auto_382051 - BLOCK
      ?auto_382052 - BLOCK
      ?auto_382053 - BLOCK
    )
    :vars
    (
      ?auto_382054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382053 ?auto_382054 ) ( ON-TABLE ?auto_382047 ) ( not ( = ?auto_382047 ?auto_382048 ) ) ( not ( = ?auto_382047 ?auto_382049 ) ) ( not ( = ?auto_382047 ?auto_382050 ) ) ( not ( = ?auto_382047 ?auto_382051 ) ) ( not ( = ?auto_382047 ?auto_382052 ) ) ( not ( = ?auto_382047 ?auto_382053 ) ) ( not ( = ?auto_382047 ?auto_382054 ) ) ( not ( = ?auto_382048 ?auto_382049 ) ) ( not ( = ?auto_382048 ?auto_382050 ) ) ( not ( = ?auto_382048 ?auto_382051 ) ) ( not ( = ?auto_382048 ?auto_382052 ) ) ( not ( = ?auto_382048 ?auto_382053 ) ) ( not ( = ?auto_382048 ?auto_382054 ) ) ( not ( = ?auto_382049 ?auto_382050 ) ) ( not ( = ?auto_382049 ?auto_382051 ) ) ( not ( = ?auto_382049 ?auto_382052 ) ) ( not ( = ?auto_382049 ?auto_382053 ) ) ( not ( = ?auto_382049 ?auto_382054 ) ) ( not ( = ?auto_382050 ?auto_382051 ) ) ( not ( = ?auto_382050 ?auto_382052 ) ) ( not ( = ?auto_382050 ?auto_382053 ) ) ( not ( = ?auto_382050 ?auto_382054 ) ) ( not ( = ?auto_382051 ?auto_382052 ) ) ( not ( = ?auto_382051 ?auto_382053 ) ) ( not ( = ?auto_382051 ?auto_382054 ) ) ( not ( = ?auto_382052 ?auto_382053 ) ) ( not ( = ?auto_382052 ?auto_382054 ) ) ( not ( = ?auto_382053 ?auto_382054 ) ) ( ON ?auto_382052 ?auto_382053 ) ( ON ?auto_382051 ?auto_382052 ) ( ON ?auto_382050 ?auto_382051 ) ( ON ?auto_382049 ?auto_382050 ) ( CLEAR ?auto_382047 ) ( ON ?auto_382048 ?auto_382049 ) ( CLEAR ?auto_382048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_382047 ?auto_382048 )
      ( MAKE-7PILE ?auto_382047 ?auto_382048 ?auto_382049 ?auto_382050 ?auto_382051 ?auto_382052 ?auto_382053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_382062 - BLOCK
      ?auto_382063 - BLOCK
      ?auto_382064 - BLOCK
      ?auto_382065 - BLOCK
      ?auto_382066 - BLOCK
      ?auto_382067 - BLOCK
      ?auto_382068 - BLOCK
    )
    :vars
    (
      ?auto_382069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382068 ?auto_382069 ) ( ON-TABLE ?auto_382062 ) ( not ( = ?auto_382062 ?auto_382063 ) ) ( not ( = ?auto_382062 ?auto_382064 ) ) ( not ( = ?auto_382062 ?auto_382065 ) ) ( not ( = ?auto_382062 ?auto_382066 ) ) ( not ( = ?auto_382062 ?auto_382067 ) ) ( not ( = ?auto_382062 ?auto_382068 ) ) ( not ( = ?auto_382062 ?auto_382069 ) ) ( not ( = ?auto_382063 ?auto_382064 ) ) ( not ( = ?auto_382063 ?auto_382065 ) ) ( not ( = ?auto_382063 ?auto_382066 ) ) ( not ( = ?auto_382063 ?auto_382067 ) ) ( not ( = ?auto_382063 ?auto_382068 ) ) ( not ( = ?auto_382063 ?auto_382069 ) ) ( not ( = ?auto_382064 ?auto_382065 ) ) ( not ( = ?auto_382064 ?auto_382066 ) ) ( not ( = ?auto_382064 ?auto_382067 ) ) ( not ( = ?auto_382064 ?auto_382068 ) ) ( not ( = ?auto_382064 ?auto_382069 ) ) ( not ( = ?auto_382065 ?auto_382066 ) ) ( not ( = ?auto_382065 ?auto_382067 ) ) ( not ( = ?auto_382065 ?auto_382068 ) ) ( not ( = ?auto_382065 ?auto_382069 ) ) ( not ( = ?auto_382066 ?auto_382067 ) ) ( not ( = ?auto_382066 ?auto_382068 ) ) ( not ( = ?auto_382066 ?auto_382069 ) ) ( not ( = ?auto_382067 ?auto_382068 ) ) ( not ( = ?auto_382067 ?auto_382069 ) ) ( not ( = ?auto_382068 ?auto_382069 ) ) ( ON ?auto_382067 ?auto_382068 ) ( ON ?auto_382066 ?auto_382067 ) ( ON ?auto_382065 ?auto_382066 ) ( ON ?auto_382064 ?auto_382065 ) ( CLEAR ?auto_382062 ) ( ON ?auto_382063 ?auto_382064 ) ( CLEAR ?auto_382063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_382062 ?auto_382063 )
      ( MAKE-7PILE ?auto_382062 ?auto_382063 ?auto_382064 ?auto_382065 ?auto_382066 ?auto_382067 ?auto_382068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_382077 - BLOCK
      ?auto_382078 - BLOCK
      ?auto_382079 - BLOCK
      ?auto_382080 - BLOCK
      ?auto_382081 - BLOCK
      ?auto_382082 - BLOCK
      ?auto_382083 - BLOCK
    )
    :vars
    (
      ?auto_382084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382083 ?auto_382084 ) ( not ( = ?auto_382077 ?auto_382078 ) ) ( not ( = ?auto_382077 ?auto_382079 ) ) ( not ( = ?auto_382077 ?auto_382080 ) ) ( not ( = ?auto_382077 ?auto_382081 ) ) ( not ( = ?auto_382077 ?auto_382082 ) ) ( not ( = ?auto_382077 ?auto_382083 ) ) ( not ( = ?auto_382077 ?auto_382084 ) ) ( not ( = ?auto_382078 ?auto_382079 ) ) ( not ( = ?auto_382078 ?auto_382080 ) ) ( not ( = ?auto_382078 ?auto_382081 ) ) ( not ( = ?auto_382078 ?auto_382082 ) ) ( not ( = ?auto_382078 ?auto_382083 ) ) ( not ( = ?auto_382078 ?auto_382084 ) ) ( not ( = ?auto_382079 ?auto_382080 ) ) ( not ( = ?auto_382079 ?auto_382081 ) ) ( not ( = ?auto_382079 ?auto_382082 ) ) ( not ( = ?auto_382079 ?auto_382083 ) ) ( not ( = ?auto_382079 ?auto_382084 ) ) ( not ( = ?auto_382080 ?auto_382081 ) ) ( not ( = ?auto_382080 ?auto_382082 ) ) ( not ( = ?auto_382080 ?auto_382083 ) ) ( not ( = ?auto_382080 ?auto_382084 ) ) ( not ( = ?auto_382081 ?auto_382082 ) ) ( not ( = ?auto_382081 ?auto_382083 ) ) ( not ( = ?auto_382081 ?auto_382084 ) ) ( not ( = ?auto_382082 ?auto_382083 ) ) ( not ( = ?auto_382082 ?auto_382084 ) ) ( not ( = ?auto_382083 ?auto_382084 ) ) ( ON ?auto_382082 ?auto_382083 ) ( ON ?auto_382081 ?auto_382082 ) ( ON ?auto_382080 ?auto_382081 ) ( ON ?auto_382079 ?auto_382080 ) ( ON ?auto_382078 ?auto_382079 ) ( ON ?auto_382077 ?auto_382078 ) ( CLEAR ?auto_382077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_382077 )
      ( MAKE-7PILE ?auto_382077 ?auto_382078 ?auto_382079 ?auto_382080 ?auto_382081 ?auto_382082 ?auto_382083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_382092 - BLOCK
      ?auto_382093 - BLOCK
      ?auto_382094 - BLOCK
      ?auto_382095 - BLOCK
      ?auto_382096 - BLOCK
      ?auto_382097 - BLOCK
      ?auto_382098 - BLOCK
    )
    :vars
    (
      ?auto_382099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382098 ?auto_382099 ) ( not ( = ?auto_382092 ?auto_382093 ) ) ( not ( = ?auto_382092 ?auto_382094 ) ) ( not ( = ?auto_382092 ?auto_382095 ) ) ( not ( = ?auto_382092 ?auto_382096 ) ) ( not ( = ?auto_382092 ?auto_382097 ) ) ( not ( = ?auto_382092 ?auto_382098 ) ) ( not ( = ?auto_382092 ?auto_382099 ) ) ( not ( = ?auto_382093 ?auto_382094 ) ) ( not ( = ?auto_382093 ?auto_382095 ) ) ( not ( = ?auto_382093 ?auto_382096 ) ) ( not ( = ?auto_382093 ?auto_382097 ) ) ( not ( = ?auto_382093 ?auto_382098 ) ) ( not ( = ?auto_382093 ?auto_382099 ) ) ( not ( = ?auto_382094 ?auto_382095 ) ) ( not ( = ?auto_382094 ?auto_382096 ) ) ( not ( = ?auto_382094 ?auto_382097 ) ) ( not ( = ?auto_382094 ?auto_382098 ) ) ( not ( = ?auto_382094 ?auto_382099 ) ) ( not ( = ?auto_382095 ?auto_382096 ) ) ( not ( = ?auto_382095 ?auto_382097 ) ) ( not ( = ?auto_382095 ?auto_382098 ) ) ( not ( = ?auto_382095 ?auto_382099 ) ) ( not ( = ?auto_382096 ?auto_382097 ) ) ( not ( = ?auto_382096 ?auto_382098 ) ) ( not ( = ?auto_382096 ?auto_382099 ) ) ( not ( = ?auto_382097 ?auto_382098 ) ) ( not ( = ?auto_382097 ?auto_382099 ) ) ( not ( = ?auto_382098 ?auto_382099 ) ) ( ON ?auto_382097 ?auto_382098 ) ( ON ?auto_382096 ?auto_382097 ) ( ON ?auto_382095 ?auto_382096 ) ( ON ?auto_382094 ?auto_382095 ) ( ON ?auto_382093 ?auto_382094 ) ( ON ?auto_382092 ?auto_382093 ) ( CLEAR ?auto_382092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_382092 )
      ( MAKE-7PILE ?auto_382092 ?auto_382093 ?auto_382094 ?auto_382095 ?auto_382096 ?auto_382097 ?auto_382098 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382108 - BLOCK
      ?auto_382109 - BLOCK
      ?auto_382110 - BLOCK
      ?auto_382111 - BLOCK
      ?auto_382112 - BLOCK
      ?auto_382113 - BLOCK
      ?auto_382114 - BLOCK
      ?auto_382115 - BLOCK
    )
    :vars
    (
      ?auto_382116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_382114 ) ( ON ?auto_382115 ?auto_382116 ) ( CLEAR ?auto_382115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_382108 ) ( ON ?auto_382109 ?auto_382108 ) ( ON ?auto_382110 ?auto_382109 ) ( ON ?auto_382111 ?auto_382110 ) ( ON ?auto_382112 ?auto_382111 ) ( ON ?auto_382113 ?auto_382112 ) ( ON ?auto_382114 ?auto_382113 ) ( not ( = ?auto_382108 ?auto_382109 ) ) ( not ( = ?auto_382108 ?auto_382110 ) ) ( not ( = ?auto_382108 ?auto_382111 ) ) ( not ( = ?auto_382108 ?auto_382112 ) ) ( not ( = ?auto_382108 ?auto_382113 ) ) ( not ( = ?auto_382108 ?auto_382114 ) ) ( not ( = ?auto_382108 ?auto_382115 ) ) ( not ( = ?auto_382108 ?auto_382116 ) ) ( not ( = ?auto_382109 ?auto_382110 ) ) ( not ( = ?auto_382109 ?auto_382111 ) ) ( not ( = ?auto_382109 ?auto_382112 ) ) ( not ( = ?auto_382109 ?auto_382113 ) ) ( not ( = ?auto_382109 ?auto_382114 ) ) ( not ( = ?auto_382109 ?auto_382115 ) ) ( not ( = ?auto_382109 ?auto_382116 ) ) ( not ( = ?auto_382110 ?auto_382111 ) ) ( not ( = ?auto_382110 ?auto_382112 ) ) ( not ( = ?auto_382110 ?auto_382113 ) ) ( not ( = ?auto_382110 ?auto_382114 ) ) ( not ( = ?auto_382110 ?auto_382115 ) ) ( not ( = ?auto_382110 ?auto_382116 ) ) ( not ( = ?auto_382111 ?auto_382112 ) ) ( not ( = ?auto_382111 ?auto_382113 ) ) ( not ( = ?auto_382111 ?auto_382114 ) ) ( not ( = ?auto_382111 ?auto_382115 ) ) ( not ( = ?auto_382111 ?auto_382116 ) ) ( not ( = ?auto_382112 ?auto_382113 ) ) ( not ( = ?auto_382112 ?auto_382114 ) ) ( not ( = ?auto_382112 ?auto_382115 ) ) ( not ( = ?auto_382112 ?auto_382116 ) ) ( not ( = ?auto_382113 ?auto_382114 ) ) ( not ( = ?auto_382113 ?auto_382115 ) ) ( not ( = ?auto_382113 ?auto_382116 ) ) ( not ( = ?auto_382114 ?auto_382115 ) ) ( not ( = ?auto_382114 ?auto_382116 ) ) ( not ( = ?auto_382115 ?auto_382116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_382115 ?auto_382116 )
      ( !STACK ?auto_382115 ?auto_382114 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382125 - BLOCK
      ?auto_382126 - BLOCK
      ?auto_382127 - BLOCK
      ?auto_382128 - BLOCK
      ?auto_382129 - BLOCK
      ?auto_382130 - BLOCK
      ?auto_382131 - BLOCK
      ?auto_382132 - BLOCK
    )
    :vars
    (
      ?auto_382133 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_382131 ) ( ON ?auto_382132 ?auto_382133 ) ( CLEAR ?auto_382132 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_382125 ) ( ON ?auto_382126 ?auto_382125 ) ( ON ?auto_382127 ?auto_382126 ) ( ON ?auto_382128 ?auto_382127 ) ( ON ?auto_382129 ?auto_382128 ) ( ON ?auto_382130 ?auto_382129 ) ( ON ?auto_382131 ?auto_382130 ) ( not ( = ?auto_382125 ?auto_382126 ) ) ( not ( = ?auto_382125 ?auto_382127 ) ) ( not ( = ?auto_382125 ?auto_382128 ) ) ( not ( = ?auto_382125 ?auto_382129 ) ) ( not ( = ?auto_382125 ?auto_382130 ) ) ( not ( = ?auto_382125 ?auto_382131 ) ) ( not ( = ?auto_382125 ?auto_382132 ) ) ( not ( = ?auto_382125 ?auto_382133 ) ) ( not ( = ?auto_382126 ?auto_382127 ) ) ( not ( = ?auto_382126 ?auto_382128 ) ) ( not ( = ?auto_382126 ?auto_382129 ) ) ( not ( = ?auto_382126 ?auto_382130 ) ) ( not ( = ?auto_382126 ?auto_382131 ) ) ( not ( = ?auto_382126 ?auto_382132 ) ) ( not ( = ?auto_382126 ?auto_382133 ) ) ( not ( = ?auto_382127 ?auto_382128 ) ) ( not ( = ?auto_382127 ?auto_382129 ) ) ( not ( = ?auto_382127 ?auto_382130 ) ) ( not ( = ?auto_382127 ?auto_382131 ) ) ( not ( = ?auto_382127 ?auto_382132 ) ) ( not ( = ?auto_382127 ?auto_382133 ) ) ( not ( = ?auto_382128 ?auto_382129 ) ) ( not ( = ?auto_382128 ?auto_382130 ) ) ( not ( = ?auto_382128 ?auto_382131 ) ) ( not ( = ?auto_382128 ?auto_382132 ) ) ( not ( = ?auto_382128 ?auto_382133 ) ) ( not ( = ?auto_382129 ?auto_382130 ) ) ( not ( = ?auto_382129 ?auto_382131 ) ) ( not ( = ?auto_382129 ?auto_382132 ) ) ( not ( = ?auto_382129 ?auto_382133 ) ) ( not ( = ?auto_382130 ?auto_382131 ) ) ( not ( = ?auto_382130 ?auto_382132 ) ) ( not ( = ?auto_382130 ?auto_382133 ) ) ( not ( = ?auto_382131 ?auto_382132 ) ) ( not ( = ?auto_382131 ?auto_382133 ) ) ( not ( = ?auto_382132 ?auto_382133 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_382132 ?auto_382133 )
      ( !STACK ?auto_382132 ?auto_382131 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382142 - BLOCK
      ?auto_382143 - BLOCK
      ?auto_382144 - BLOCK
      ?auto_382145 - BLOCK
      ?auto_382146 - BLOCK
      ?auto_382147 - BLOCK
      ?auto_382148 - BLOCK
      ?auto_382149 - BLOCK
    )
    :vars
    (
      ?auto_382150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382149 ?auto_382150 ) ( ON-TABLE ?auto_382142 ) ( ON ?auto_382143 ?auto_382142 ) ( ON ?auto_382144 ?auto_382143 ) ( ON ?auto_382145 ?auto_382144 ) ( ON ?auto_382146 ?auto_382145 ) ( ON ?auto_382147 ?auto_382146 ) ( not ( = ?auto_382142 ?auto_382143 ) ) ( not ( = ?auto_382142 ?auto_382144 ) ) ( not ( = ?auto_382142 ?auto_382145 ) ) ( not ( = ?auto_382142 ?auto_382146 ) ) ( not ( = ?auto_382142 ?auto_382147 ) ) ( not ( = ?auto_382142 ?auto_382148 ) ) ( not ( = ?auto_382142 ?auto_382149 ) ) ( not ( = ?auto_382142 ?auto_382150 ) ) ( not ( = ?auto_382143 ?auto_382144 ) ) ( not ( = ?auto_382143 ?auto_382145 ) ) ( not ( = ?auto_382143 ?auto_382146 ) ) ( not ( = ?auto_382143 ?auto_382147 ) ) ( not ( = ?auto_382143 ?auto_382148 ) ) ( not ( = ?auto_382143 ?auto_382149 ) ) ( not ( = ?auto_382143 ?auto_382150 ) ) ( not ( = ?auto_382144 ?auto_382145 ) ) ( not ( = ?auto_382144 ?auto_382146 ) ) ( not ( = ?auto_382144 ?auto_382147 ) ) ( not ( = ?auto_382144 ?auto_382148 ) ) ( not ( = ?auto_382144 ?auto_382149 ) ) ( not ( = ?auto_382144 ?auto_382150 ) ) ( not ( = ?auto_382145 ?auto_382146 ) ) ( not ( = ?auto_382145 ?auto_382147 ) ) ( not ( = ?auto_382145 ?auto_382148 ) ) ( not ( = ?auto_382145 ?auto_382149 ) ) ( not ( = ?auto_382145 ?auto_382150 ) ) ( not ( = ?auto_382146 ?auto_382147 ) ) ( not ( = ?auto_382146 ?auto_382148 ) ) ( not ( = ?auto_382146 ?auto_382149 ) ) ( not ( = ?auto_382146 ?auto_382150 ) ) ( not ( = ?auto_382147 ?auto_382148 ) ) ( not ( = ?auto_382147 ?auto_382149 ) ) ( not ( = ?auto_382147 ?auto_382150 ) ) ( not ( = ?auto_382148 ?auto_382149 ) ) ( not ( = ?auto_382148 ?auto_382150 ) ) ( not ( = ?auto_382149 ?auto_382150 ) ) ( CLEAR ?auto_382147 ) ( ON ?auto_382148 ?auto_382149 ) ( CLEAR ?auto_382148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_382142 ?auto_382143 ?auto_382144 ?auto_382145 ?auto_382146 ?auto_382147 ?auto_382148 )
      ( MAKE-8PILE ?auto_382142 ?auto_382143 ?auto_382144 ?auto_382145 ?auto_382146 ?auto_382147 ?auto_382148 ?auto_382149 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382159 - BLOCK
      ?auto_382160 - BLOCK
      ?auto_382161 - BLOCK
      ?auto_382162 - BLOCK
      ?auto_382163 - BLOCK
      ?auto_382164 - BLOCK
      ?auto_382165 - BLOCK
      ?auto_382166 - BLOCK
    )
    :vars
    (
      ?auto_382167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382166 ?auto_382167 ) ( ON-TABLE ?auto_382159 ) ( ON ?auto_382160 ?auto_382159 ) ( ON ?auto_382161 ?auto_382160 ) ( ON ?auto_382162 ?auto_382161 ) ( ON ?auto_382163 ?auto_382162 ) ( ON ?auto_382164 ?auto_382163 ) ( not ( = ?auto_382159 ?auto_382160 ) ) ( not ( = ?auto_382159 ?auto_382161 ) ) ( not ( = ?auto_382159 ?auto_382162 ) ) ( not ( = ?auto_382159 ?auto_382163 ) ) ( not ( = ?auto_382159 ?auto_382164 ) ) ( not ( = ?auto_382159 ?auto_382165 ) ) ( not ( = ?auto_382159 ?auto_382166 ) ) ( not ( = ?auto_382159 ?auto_382167 ) ) ( not ( = ?auto_382160 ?auto_382161 ) ) ( not ( = ?auto_382160 ?auto_382162 ) ) ( not ( = ?auto_382160 ?auto_382163 ) ) ( not ( = ?auto_382160 ?auto_382164 ) ) ( not ( = ?auto_382160 ?auto_382165 ) ) ( not ( = ?auto_382160 ?auto_382166 ) ) ( not ( = ?auto_382160 ?auto_382167 ) ) ( not ( = ?auto_382161 ?auto_382162 ) ) ( not ( = ?auto_382161 ?auto_382163 ) ) ( not ( = ?auto_382161 ?auto_382164 ) ) ( not ( = ?auto_382161 ?auto_382165 ) ) ( not ( = ?auto_382161 ?auto_382166 ) ) ( not ( = ?auto_382161 ?auto_382167 ) ) ( not ( = ?auto_382162 ?auto_382163 ) ) ( not ( = ?auto_382162 ?auto_382164 ) ) ( not ( = ?auto_382162 ?auto_382165 ) ) ( not ( = ?auto_382162 ?auto_382166 ) ) ( not ( = ?auto_382162 ?auto_382167 ) ) ( not ( = ?auto_382163 ?auto_382164 ) ) ( not ( = ?auto_382163 ?auto_382165 ) ) ( not ( = ?auto_382163 ?auto_382166 ) ) ( not ( = ?auto_382163 ?auto_382167 ) ) ( not ( = ?auto_382164 ?auto_382165 ) ) ( not ( = ?auto_382164 ?auto_382166 ) ) ( not ( = ?auto_382164 ?auto_382167 ) ) ( not ( = ?auto_382165 ?auto_382166 ) ) ( not ( = ?auto_382165 ?auto_382167 ) ) ( not ( = ?auto_382166 ?auto_382167 ) ) ( CLEAR ?auto_382164 ) ( ON ?auto_382165 ?auto_382166 ) ( CLEAR ?auto_382165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_382159 ?auto_382160 ?auto_382161 ?auto_382162 ?auto_382163 ?auto_382164 ?auto_382165 )
      ( MAKE-8PILE ?auto_382159 ?auto_382160 ?auto_382161 ?auto_382162 ?auto_382163 ?auto_382164 ?auto_382165 ?auto_382166 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382176 - BLOCK
      ?auto_382177 - BLOCK
      ?auto_382178 - BLOCK
      ?auto_382179 - BLOCK
      ?auto_382180 - BLOCK
      ?auto_382181 - BLOCK
      ?auto_382182 - BLOCK
      ?auto_382183 - BLOCK
    )
    :vars
    (
      ?auto_382184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382183 ?auto_382184 ) ( ON-TABLE ?auto_382176 ) ( ON ?auto_382177 ?auto_382176 ) ( ON ?auto_382178 ?auto_382177 ) ( ON ?auto_382179 ?auto_382178 ) ( ON ?auto_382180 ?auto_382179 ) ( not ( = ?auto_382176 ?auto_382177 ) ) ( not ( = ?auto_382176 ?auto_382178 ) ) ( not ( = ?auto_382176 ?auto_382179 ) ) ( not ( = ?auto_382176 ?auto_382180 ) ) ( not ( = ?auto_382176 ?auto_382181 ) ) ( not ( = ?auto_382176 ?auto_382182 ) ) ( not ( = ?auto_382176 ?auto_382183 ) ) ( not ( = ?auto_382176 ?auto_382184 ) ) ( not ( = ?auto_382177 ?auto_382178 ) ) ( not ( = ?auto_382177 ?auto_382179 ) ) ( not ( = ?auto_382177 ?auto_382180 ) ) ( not ( = ?auto_382177 ?auto_382181 ) ) ( not ( = ?auto_382177 ?auto_382182 ) ) ( not ( = ?auto_382177 ?auto_382183 ) ) ( not ( = ?auto_382177 ?auto_382184 ) ) ( not ( = ?auto_382178 ?auto_382179 ) ) ( not ( = ?auto_382178 ?auto_382180 ) ) ( not ( = ?auto_382178 ?auto_382181 ) ) ( not ( = ?auto_382178 ?auto_382182 ) ) ( not ( = ?auto_382178 ?auto_382183 ) ) ( not ( = ?auto_382178 ?auto_382184 ) ) ( not ( = ?auto_382179 ?auto_382180 ) ) ( not ( = ?auto_382179 ?auto_382181 ) ) ( not ( = ?auto_382179 ?auto_382182 ) ) ( not ( = ?auto_382179 ?auto_382183 ) ) ( not ( = ?auto_382179 ?auto_382184 ) ) ( not ( = ?auto_382180 ?auto_382181 ) ) ( not ( = ?auto_382180 ?auto_382182 ) ) ( not ( = ?auto_382180 ?auto_382183 ) ) ( not ( = ?auto_382180 ?auto_382184 ) ) ( not ( = ?auto_382181 ?auto_382182 ) ) ( not ( = ?auto_382181 ?auto_382183 ) ) ( not ( = ?auto_382181 ?auto_382184 ) ) ( not ( = ?auto_382182 ?auto_382183 ) ) ( not ( = ?auto_382182 ?auto_382184 ) ) ( not ( = ?auto_382183 ?auto_382184 ) ) ( ON ?auto_382182 ?auto_382183 ) ( CLEAR ?auto_382180 ) ( ON ?auto_382181 ?auto_382182 ) ( CLEAR ?auto_382181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_382176 ?auto_382177 ?auto_382178 ?auto_382179 ?auto_382180 ?auto_382181 )
      ( MAKE-8PILE ?auto_382176 ?auto_382177 ?auto_382178 ?auto_382179 ?auto_382180 ?auto_382181 ?auto_382182 ?auto_382183 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382193 - BLOCK
      ?auto_382194 - BLOCK
      ?auto_382195 - BLOCK
      ?auto_382196 - BLOCK
      ?auto_382197 - BLOCK
      ?auto_382198 - BLOCK
      ?auto_382199 - BLOCK
      ?auto_382200 - BLOCK
    )
    :vars
    (
      ?auto_382201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382200 ?auto_382201 ) ( ON-TABLE ?auto_382193 ) ( ON ?auto_382194 ?auto_382193 ) ( ON ?auto_382195 ?auto_382194 ) ( ON ?auto_382196 ?auto_382195 ) ( ON ?auto_382197 ?auto_382196 ) ( not ( = ?auto_382193 ?auto_382194 ) ) ( not ( = ?auto_382193 ?auto_382195 ) ) ( not ( = ?auto_382193 ?auto_382196 ) ) ( not ( = ?auto_382193 ?auto_382197 ) ) ( not ( = ?auto_382193 ?auto_382198 ) ) ( not ( = ?auto_382193 ?auto_382199 ) ) ( not ( = ?auto_382193 ?auto_382200 ) ) ( not ( = ?auto_382193 ?auto_382201 ) ) ( not ( = ?auto_382194 ?auto_382195 ) ) ( not ( = ?auto_382194 ?auto_382196 ) ) ( not ( = ?auto_382194 ?auto_382197 ) ) ( not ( = ?auto_382194 ?auto_382198 ) ) ( not ( = ?auto_382194 ?auto_382199 ) ) ( not ( = ?auto_382194 ?auto_382200 ) ) ( not ( = ?auto_382194 ?auto_382201 ) ) ( not ( = ?auto_382195 ?auto_382196 ) ) ( not ( = ?auto_382195 ?auto_382197 ) ) ( not ( = ?auto_382195 ?auto_382198 ) ) ( not ( = ?auto_382195 ?auto_382199 ) ) ( not ( = ?auto_382195 ?auto_382200 ) ) ( not ( = ?auto_382195 ?auto_382201 ) ) ( not ( = ?auto_382196 ?auto_382197 ) ) ( not ( = ?auto_382196 ?auto_382198 ) ) ( not ( = ?auto_382196 ?auto_382199 ) ) ( not ( = ?auto_382196 ?auto_382200 ) ) ( not ( = ?auto_382196 ?auto_382201 ) ) ( not ( = ?auto_382197 ?auto_382198 ) ) ( not ( = ?auto_382197 ?auto_382199 ) ) ( not ( = ?auto_382197 ?auto_382200 ) ) ( not ( = ?auto_382197 ?auto_382201 ) ) ( not ( = ?auto_382198 ?auto_382199 ) ) ( not ( = ?auto_382198 ?auto_382200 ) ) ( not ( = ?auto_382198 ?auto_382201 ) ) ( not ( = ?auto_382199 ?auto_382200 ) ) ( not ( = ?auto_382199 ?auto_382201 ) ) ( not ( = ?auto_382200 ?auto_382201 ) ) ( ON ?auto_382199 ?auto_382200 ) ( CLEAR ?auto_382197 ) ( ON ?auto_382198 ?auto_382199 ) ( CLEAR ?auto_382198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_382193 ?auto_382194 ?auto_382195 ?auto_382196 ?auto_382197 ?auto_382198 )
      ( MAKE-8PILE ?auto_382193 ?auto_382194 ?auto_382195 ?auto_382196 ?auto_382197 ?auto_382198 ?auto_382199 ?auto_382200 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382210 - BLOCK
      ?auto_382211 - BLOCK
      ?auto_382212 - BLOCK
      ?auto_382213 - BLOCK
      ?auto_382214 - BLOCK
      ?auto_382215 - BLOCK
      ?auto_382216 - BLOCK
      ?auto_382217 - BLOCK
    )
    :vars
    (
      ?auto_382218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382217 ?auto_382218 ) ( ON-TABLE ?auto_382210 ) ( ON ?auto_382211 ?auto_382210 ) ( ON ?auto_382212 ?auto_382211 ) ( ON ?auto_382213 ?auto_382212 ) ( not ( = ?auto_382210 ?auto_382211 ) ) ( not ( = ?auto_382210 ?auto_382212 ) ) ( not ( = ?auto_382210 ?auto_382213 ) ) ( not ( = ?auto_382210 ?auto_382214 ) ) ( not ( = ?auto_382210 ?auto_382215 ) ) ( not ( = ?auto_382210 ?auto_382216 ) ) ( not ( = ?auto_382210 ?auto_382217 ) ) ( not ( = ?auto_382210 ?auto_382218 ) ) ( not ( = ?auto_382211 ?auto_382212 ) ) ( not ( = ?auto_382211 ?auto_382213 ) ) ( not ( = ?auto_382211 ?auto_382214 ) ) ( not ( = ?auto_382211 ?auto_382215 ) ) ( not ( = ?auto_382211 ?auto_382216 ) ) ( not ( = ?auto_382211 ?auto_382217 ) ) ( not ( = ?auto_382211 ?auto_382218 ) ) ( not ( = ?auto_382212 ?auto_382213 ) ) ( not ( = ?auto_382212 ?auto_382214 ) ) ( not ( = ?auto_382212 ?auto_382215 ) ) ( not ( = ?auto_382212 ?auto_382216 ) ) ( not ( = ?auto_382212 ?auto_382217 ) ) ( not ( = ?auto_382212 ?auto_382218 ) ) ( not ( = ?auto_382213 ?auto_382214 ) ) ( not ( = ?auto_382213 ?auto_382215 ) ) ( not ( = ?auto_382213 ?auto_382216 ) ) ( not ( = ?auto_382213 ?auto_382217 ) ) ( not ( = ?auto_382213 ?auto_382218 ) ) ( not ( = ?auto_382214 ?auto_382215 ) ) ( not ( = ?auto_382214 ?auto_382216 ) ) ( not ( = ?auto_382214 ?auto_382217 ) ) ( not ( = ?auto_382214 ?auto_382218 ) ) ( not ( = ?auto_382215 ?auto_382216 ) ) ( not ( = ?auto_382215 ?auto_382217 ) ) ( not ( = ?auto_382215 ?auto_382218 ) ) ( not ( = ?auto_382216 ?auto_382217 ) ) ( not ( = ?auto_382216 ?auto_382218 ) ) ( not ( = ?auto_382217 ?auto_382218 ) ) ( ON ?auto_382216 ?auto_382217 ) ( ON ?auto_382215 ?auto_382216 ) ( CLEAR ?auto_382213 ) ( ON ?auto_382214 ?auto_382215 ) ( CLEAR ?auto_382214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_382210 ?auto_382211 ?auto_382212 ?auto_382213 ?auto_382214 )
      ( MAKE-8PILE ?auto_382210 ?auto_382211 ?auto_382212 ?auto_382213 ?auto_382214 ?auto_382215 ?auto_382216 ?auto_382217 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382227 - BLOCK
      ?auto_382228 - BLOCK
      ?auto_382229 - BLOCK
      ?auto_382230 - BLOCK
      ?auto_382231 - BLOCK
      ?auto_382232 - BLOCK
      ?auto_382233 - BLOCK
      ?auto_382234 - BLOCK
    )
    :vars
    (
      ?auto_382235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382234 ?auto_382235 ) ( ON-TABLE ?auto_382227 ) ( ON ?auto_382228 ?auto_382227 ) ( ON ?auto_382229 ?auto_382228 ) ( ON ?auto_382230 ?auto_382229 ) ( not ( = ?auto_382227 ?auto_382228 ) ) ( not ( = ?auto_382227 ?auto_382229 ) ) ( not ( = ?auto_382227 ?auto_382230 ) ) ( not ( = ?auto_382227 ?auto_382231 ) ) ( not ( = ?auto_382227 ?auto_382232 ) ) ( not ( = ?auto_382227 ?auto_382233 ) ) ( not ( = ?auto_382227 ?auto_382234 ) ) ( not ( = ?auto_382227 ?auto_382235 ) ) ( not ( = ?auto_382228 ?auto_382229 ) ) ( not ( = ?auto_382228 ?auto_382230 ) ) ( not ( = ?auto_382228 ?auto_382231 ) ) ( not ( = ?auto_382228 ?auto_382232 ) ) ( not ( = ?auto_382228 ?auto_382233 ) ) ( not ( = ?auto_382228 ?auto_382234 ) ) ( not ( = ?auto_382228 ?auto_382235 ) ) ( not ( = ?auto_382229 ?auto_382230 ) ) ( not ( = ?auto_382229 ?auto_382231 ) ) ( not ( = ?auto_382229 ?auto_382232 ) ) ( not ( = ?auto_382229 ?auto_382233 ) ) ( not ( = ?auto_382229 ?auto_382234 ) ) ( not ( = ?auto_382229 ?auto_382235 ) ) ( not ( = ?auto_382230 ?auto_382231 ) ) ( not ( = ?auto_382230 ?auto_382232 ) ) ( not ( = ?auto_382230 ?auto_382233 ) ) ( not ( = ?auto_382230 ?auto_382234 ) ) ( not ( = ?auto_382230 ?auto_382235 ) ) ( not ( = ?auto_382231 ?auto_382232 ) ) ( not ( = ?auto_382231 ?auto_382233 ) ) ( not ( = ?auto_382231 ?auto_382234 ) ) ( not ( = ?auto_382231 ?auto_382235 ) ) ( not ( = ?auto_382232 ?auto_382233 ) ) ( not ( = ?auto_382232 ?auto_382234 ) ) ( not ( = ?auto_382232 ?auto_382235 ) ) ( not ( = ?auto_382233 ?auto_382234 ) ) ( not ( = ?auto_382233 ?auto_382235 ) ) ( not ( = ?auto_382234 ?auto_382235 ) ) ( ON ?auto_382233 ?auto_382234 ) ( ON ?auto_382232 ?auto_382233 ) ( CLEAR ?auto_382230 ) ( ON ?auto_382231 ?auto_382232 ) ( CLEAR ?auto_382231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_382227 ?auto_382228 ?auto_382229 ?auto_382230 ?auto_382231 )
      ( MAKE-8PILE ?auto_382227 ?auto_382228 ?auto_382229 ?auto_382230 ?auto_382231 ?auto_382232 ?auto_382233 ?auto_382234 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382244 - BLOCK
      ?auto_382245 - BLOCK
      ?auto_382246 - BLOCK
      ?auto_382247 - BLOCK
      ?auto_382248 - BLOCK
      ?auto_382249 - BLOCK
      ?auto_382250 - BLOCK
      ?auto_382251 - BLOCK
    )
    :vars
    (
      ?auto_382252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382251 ?auto_382252 ) ( ON-TABLE ?auto_382244 ) ( ON ?auto_382245 ?auto_382244 ) ( ON ?auto_382246 ?auto_382245 ) ( not ( = ?auto_382244 ?auto_382245 ) ) ( not ( = ?auto_382244 ?auto_382246 ) ) ( not ( = ?auto_382244 ?auto_382247 ) ) ( not ( = ?auto_382244 ?auto_382248 ) ) ( not ( = ?auto_382244 ?auto_382249 ) ) ( not ( = ?auto_382244 ?auto_382250 ) ) ( not ( = ?auto_382244 ?auto_382251 ) ) ( not ( = ?auto_382244 ?auto_382252 ) ) ( not ( = ?auto_382245 ?auto_382246 ) ) ( not ( = ?auto_382245 ?auto_382247 ) ) ( not ( = ?auto_382245 ?auto_382248 ) ) ( not ( = ?auto_382245 ?auto_382249 ) ) ( not ( = ?auto_382245 ?auto_382250 ) ) ( not ( = ?auto_382245 ?auto_382251 ) ) ( not ( = ?auto_382245 ?auto_382252 ) ) ( not ( = ?auto_382246 ?auto_382247 ) ) ( not ( = ?auto_382246 ?auto_382248 ) ) ( not ( = ?auto_382246 ?auto_382249 ) ) ( not ( = ?auto_382246 ?auto_382250 ) ) ( not ( = ?auto_382246 ?auto_382251 ) ) ( not ( = ?auto_382246 ?auto_382252 ) ) ( not ( = ?auto_382247 ?auto_382248 ) ) ( not ( = ?auto_382247 ?auto_382249 ) ) ( not ( = ?auto_382247 ?auto_382250 ) ) ( not ( = ?auto_382247 ?auto_382251 ) ) ( not ( = ?auto_382247 ?auto_382252 ) ) ( not ( = ?auto_382248 ?auto_382249 ) ) ( not ( = ?auto_382248 ?auto_382250 ) ) ( not ( = ?auto_382248 ?auto_382251 ) ) ( not ( = ?auto_382248 ?auto_382252 ) ) ( not ( = ?auto_382249 ?auto_382250 ) ) ( not ( = ?auto_382249 ?auto_382251 ) ) ( not ( = ?auto_382249 ?auto_382252 ) ) ( not ( = ?auto_382250 ?auto_382251 ) ) ( not ( = ?auto_382250 ?auto_382252 ) ) ( not ( = ?auto_382251 ?auto_382252 ) ) ( ON ?auto_382250 ?auto_382251 ) ( ON ?auto_382249 ?auto_382250 ) ( ON ?auto_382248 ?auto_382249 ) ( CLEAR ?auto_382246 ) ( ON ?auto_382247 ?auto_382248 ) ( CLEAR ?auto_382247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_382244 ?auto_382245 ?auto_382246 ?auto_382247 )
      ( MAKE-8PILE ?auto_382244 ?auto_382245 ?auto_382246 ?auto_382247 ?auto_382248 ?auto_382249 ?auto_382250 ?auto_382251 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382261 - BLOCK
      ?auto_382262 - BLOCK
      ?auto_382263 - BLOCK
      ?auto_382264 - BLOCK
      ?auto_382265 - BLOCK
      ?auto_382266 - BLOCK
      ?auto_382267 - BLOCK
      ?auto_382268 - BLOCK
    )
    :vars
    (
      ?auto_382269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382268 ?auto_382269 ) ( ON-TABLE ?auto_382261 ) ( ON ?auto_382262 ?auto_382261 ) ( ON ?auto_382263 ?auto_382262 ) ( not ( = ?auto_382261 ?auto_382262 ) ) ( not ( = ?auto_382261 ?auto_382263 ) ) ( not ( = ?auto_382261 ?auto_382264 ) ) ( not ( = ?auto_382261 ?auto_382265 ) ) ( not ( = ?auto_382261 ?auto_382266 ) ) ( not ( = ?auto_382261 ?auto_382267 ) ) ( not ( = ?auto_382261 ?auto_382268 ) ) ( not ( = ?auto_382261 ?auto_382269 ) ) ( not ( = ?auto_382262 ?auto_382263 ) ) ( not ( = ?auto_382262 ?auto_382264 ) ) ( not ( = ?auto_382262 ?auto_382265 ) ) ( not ( = ?auto_382262 ?auto_382266 ) ) ( not ( = ?auto_382262 ?auto_382267 ) ) ( not ( = ?auto_382262 ?auto_382268 ) ) ( not ( = ?auto_382262 ?auto_382269 ) ) ( not ( = ?auto_382263 ?auto_382264 ) ) ( not ( = ?auto_382263 ?auto_382265 ) ) ( not ( = ?auto_382263 ?auto_382266 ) ) ( not ( = ?auto_382263 ?auto_382267 ) ) ( not ( = ?auto_382263 ?auto_382268 ) ) ( not ( = ?auto_382263 ?auto_382269 ) ) ( not ( = ?auto_382264 ?auto_382265 ) ) ( not ( = ?auto_382264 ?auto_382266 ) ) ( not ( = ?auto_382264 ?auto_382267 ) ) ( not ( = ?auto_382264 ?auto_382268 ) ) ( not ( = ?auto_382264 ?auto_382269 ) ) ( not ( = ?auto_382265 ?auto_382266 ) ) ( not ( = ?auto_382265 ?auto_382267 ) ) ( not ( = ?auto_382265 ?auto_382268 ) ) ( not ( = ?auto_382265 ?auto_382269 ) ) ( not ( = ?auto_382266 ?auto_382267 ) ) ( not ( = ?auto_382266 ?auto_382268 ) ) ( not ( = ?auto_382266 ?auto_382269 ) ) ( not ( = ?auto_382267 ?auto_382268 ) ) ( not ( = ?auto_382267 ?auto_382269 ) ) ( not ( = ?auto_382268 ?auto_382269 ) ) ( ON ?auto_382267 ?auto_382268 ) ( ON ?auto_382266 ?auto_382267 ) ( ON ?auto_382265 ?auto_382266 ) ( CLEAR ?auto_382263 ) ( ON ?auto_382264 ?auto_382265 ) ( CLEAR ?auto_382264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_382261 ?auto_382262 ?auto_382263 ?auto_382264 )
      ( MAKE-8PILE ?auto_382261 ?auto_382262 ?auto_382263 ?auto_382264 ?auto_382265 ?auto_382266 ?auto_382267 ?auto_382268 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382278 - BLOCK
      ?auto_382279 - BLOCK
      ?auto_382280 - BLOCK
      ?auto_382281 - BLOCK
      ?auto_382282 - BLOCK
      ?auto_382283 - BLOCK
      ?auto_382284 - BLOCK
      ?auto_382285 - BLOCK
    )
    :vars
    (
      ?auto_382286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382285 ?auto_382286 ) ( ON-TABLE ?auto_382278 ) ( ON ?auto_382279 ?auto_382278 ) ( not ( = ?auto_382278 ?auto_382279 ) ) ( not ( = ?auto_382278 ?auto_382280 ) ) ( not ( = ?auto_382278 ?auto_382281 ) ) ( not ( = ?auto_382278 ?auto_382282 ) ) ( not ( = ?auto_382278 ?auto_382283 ) ) ( not ( = ?auto_382278 ?auto_382284 ) ) ( not ( = ?auto_382278 ?auto_382285 ) ) ( not ( = ?auto_382278 ?auto_382286 ) ) ( not ( = ?auto_382279 ?auto_382280 ) ) ( not ( = ?auto_382279 ?auto_382281 ) ) ( not ( = ?auto_382279 ?auto_382282 ) ) ( not ( = ?auto_382279 ?auto_382283 ) ) ( not ( = ?auto_382279 ?auto_382284 ) ) ( not ( = ?auto_382279 ?auto_382285 ) ) ( not ( = ?auto_382279 ?auto_382286 ) ) ( not ( = ?auto_382280 ?auto_382281 ) ) ( not ( = ?auto_382280 ?auto_382282 ) ) ( not ( = ?auto_382280 ?auto_382283 ) ) ( not ( = ?auto_382280 ?auto_382284 ) ) ( not ( = ?auto_382280 ?auto_382285 ) ) ( not ( = ?auto_382280 ?auto_382286 ) ) ( not ( = ?auto_382281 ?auto_382282 ) ) ( not ( = ?auto_382281 ?auto_382283 ) ) ( not ( = ?auto_382281 ?auto_382284 ) ) ( not ( = ?auto_382281 ?auto_382285 ) ) ( not ( = ?auto_382281 ?auto_382286 ) ) ( not ( = ?auto_382282 ?auto_382283 ) ) ( not ( = ?auto_382282 ?auto_382284 ) ) ( not ( = ?auto_382282 ?auto_382285 ) ) ( not ( = ?auto_382282 ?auto_382286 ) ) ( not ( = ?auto_382283 ?auto_382284 ) ) ( not ( = ?auto_382283 ?auto_382285 ) ) ( not ( = ?auto_382283 ?auto_382286 ) ) ( not ( = ?auto_382284 ?auto_382285 ) ) ( not ( = ?auto_382284 ?auto_382286 ) ) ( not ( = ?auto_382285 ?auto_382286 ) ) ( ON ?auto_382284 ?auto_382285 ) ( ON ?auto_382283 ?auto_382284 ) ( ON ?auto_382282 ?auto_382283 ) ( ON ?auto_382281 ?auto_382282 ) ( CLEAR ?auto_382279 ) ( ON ?auto_382280 ?auto_382281 ) ( CLEAR ?auto_382280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_382278 ?auto_382279 ?auto_382280 )
      ( MAKE-8PILE ?auto_382278 ?auto_382279 ?auto_382280 ?auto_382281 ?auto_382282 ?auto_382283 ?auto_382284 ?auto_382285 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382295 - BLOCK
      ?auto_382296 - BLOCK
      ?auto_382297 - BLOCK
      ?auto_382298 - BLOCK
      ?auto_382299 - BLOCK
      ?auto_382300 - BLOCK
      ?auto_382301 - BLOCK
      ?auto_382302 - BLOCK
    )
    :vars
    (
      ?auto_382303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382302 ?auto_382303 ) ( ON-TABLE ?auto_382295 ) ( ON ?auto_382296 ?auto_382295 ) ( not ( = ?auto_382295 ?auto_382296 ) ) ( not ( = ?auto_382295 ?auto_382297 ) ) ( not ( = ?auto_382295 ?auto_382298 ) ) ( not ( = ?auto_382295 ?auto_382299 ) ) ( not ( = ?auto_382295 ?auto_382300 ) ) ( not ( = ?auto_382295 ?auto_382301 ) ) ( not ( = ?auto_382295 ?auto_382302 ) ) ( not ( = ?auto_382295 ?auto_382303 ) ) ( not ( = ?auto_382296 ?auto_382297 ) ) ( not ( = ?auto_382296 ?auto_382298 ) ) ( not ( = ?auto_382296 ?auto_382299 ) ) ( not ( = ?auto_382296 ?auto_382300 ) ) ( not ( = ?auto_382296 ?auto_382301 ) ) ( not ( = ?auto_382296 ?auto_382302 ) ) ( not ( = ?auto_382296 ?auto_382303 ) ) ( not ( = ?auto_382297 ?auto_382298 ) ) ( not ( = ?auto_382297 ?auto_382299 ) ) ( not ( = ?auto_382297 ?auto_382300 ) ) ( not ( = ?auto_382297 ?auto_382301 ) ) ( not ( = ?auto_382297 ?auto_382302 ) ) ( not ( = ?auto_382297 ?auto_382303 ) ) ( not ( = ?auto_382298 ?auto_382299 ) ) ( not ( = ?auto_382298 ?auto_382300 ) ) ( not ( = ?auto_382298 ?auto_382301 ) ) ( not ( = ?auto_382298 ?auto_382302 ) ) ( not ( = ?auto_382298 ?auto_382303 ) ) ( not ( = ?auto_382299 ?auto_382300 ) ) ( not ( = ?auto_382299 ?auto_382301 ) ) ( not ( = ?auto_382299 ?auto_382302 ) ) ( not ( = ?auto_382299 ?auto_382303 ) ) ( not ( = ?auto_382300 ?auto_382301 ) ) ( not ( = ?auto_382300 ?auto_382302 ) ) ( not ( = ?auto_382300 ?auto_382303 ) ) ( not ( = ?auto_382301 ?auto_382302 ) ) ( not ( = ?auto_382301 ?auto_382303 ) ) ( not ( = ?auto_382302 ?auto_382303 ) ) ( ON ?auto_382301 ?auto_382302 ) ( ON ?auto_382300 ?auto_382301 ) ( ON ?auto_382299 ?auto_382300 ) ( ON ?auto_382298 ?auto_382299 ) ( CLEAR ?auto_382296 ) ( ON ?auto_382297 ?auto_382298 ) ( CLEAR ?auto_382297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_382295 ?auto_382296 ?auto_382297 )
      ( MAKE-8PILE ?auto_382295 ?auto_382296 ?auto_382297 ?auto_382298 ?auto_382299 ?auto_382300 ?auto_382301 ?auto_382302 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382312 - BLOCK
      ?auto_382313 - BLOCK
      ?auto_382314 - BLOCK
      ?auto_382315 - BLOCK
      ?auto_382316 - BLOCK
      ?auto_382317 - BLOCK
      ?auto_382318 - BLOCK
      ?auto_382319 - BLOCK
    )
    :vars
    (
      ?auto_382320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382319 ?auto_382320 ) ( ON-TABLE ?auto_382312 ) ( not ( = ?auto_382312 ?auto_382313 ) ) ( not ( = ?auto_382312 ?auto_382314 ) ) ( not ( = ?auto_382312 ?auto_382315 ) ) ( not ( = ?auto_382312 ?auto_382316 ) ) ( not ( = ?auto_382312 ?auto_382317 ) ) ( not ( = ?auto_382312 ?auto_382318 ) ) ( not ( = ?auto_382312 ?auto_382319 ) ) ( not ( = ?auto_382312 ?auto_382320 ) ) ( not ( = ?auto_382313 ?auto_382314 ) ) ( not ( = ?auto_382313 ?auto_382315 ) ) ( not ( = ?auto_382313 ?auto_382316 ) ) ( not ( = ?auto_382313 ?auto_382317 ) ) ( not ( = ?auto_382313 ?auto_382318 ) ) ( not ( = ?auto_382313 ?auto_382319 ) ) ( not ( = ?auto_382313 ?auto_382320 ) ) ( not ( = ?auto_382314 ?auto_382315 ) ) ( not ( = ?auto_382314 ?auto_382316 ) ) ( not ( = ?auto_382314 ?auto_382317 ) ) ( not ( = ?auto_382314 ?auto_382318 ) ) ( not ( = ?auto_382314 ?auto_382319 ) ) ( not ( = ?auto_382314 ?auto_382320 ) ) ( not ( = ?auto_382315 ?auto_382316 ) ) ( not ( = ?auto_382315 ?auto_382317 ) ) ( not ( = ?auto_382315 ?auto_382318 ) ) ( not ( = ?auto_382315 ?auto_382319 ) ) ( not ( = ?auto_382315 ?auto_382320 ) ) ( not ( = ?auto_382316 ?auto_382317 ) ) ( not ( = ?auto_382316 ?auto_382318 ) ) ( not ( = ?auto_382316 ?auto_382319 ) ) ( not ( = ?auto_382316 ?auto_382320 ) ) ( not ( = ?auto_382317 ?auto_382318 ) ) ( not ( = ?auto_382317 ?auto_382319 ) ) ( not ( = ?auto_382317 ?auto_382320 ) ) ( not ( = ?auto_382318 ?auto_382319 ) ) ( not ( = ?auto_382318 ?auto_382320 ) ) ( not ( = ?auto_382319 ?auto_382320 ) ) ( ON ?auto_382318 ?auto_382319 ) ( ON ?auto_382317 ?auto_382318 ) ( ON ?auto_382316 ?auto_382317 ) ( ON ?auto_382315 ?auto_382316 ) ( ON ?auto_382314 ?auto_382315 ) ( CLEAR ?auto_382312 ) ( ON ?auto_382313 ?auto_382314 ) ( CLEAR ?auto_382313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_382312 ?auto_382313 )
      ( MAKE-8PILE ?auto_382312 ?auto_382313 ?auto_382314 ?auto_382315 ?auto_382316 ?auto_382317 ?auto_382318 ?auto_382319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382329 - BLOCK
      ?auto_382330 - BLOCK
      ?auto_382331 - BLOCK
      ?auto_382332 - BLOCK
      ?auto_382333 - BLOCK
      ?auto_382334 - BLOCK
      ?auto_382335 - BLOCK
      ?auto_382336 - BLOCK
    )
    :vars
    (
      ?auto_382337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382336 ?auto_382337 ) ( ON-TABLE ?auto_382329 ) ( not ( = ?auto_382329 ?auto_382330 ) ) ( not ( = ?auto_382329 ?auto_382331 ) ) ( not ( = ?auto_382329 ?auto_382332 ) ) ( not ( = ?auto_382329 ?auto_382333 ) ) ( not ( = ?auto_382329 ?auto_382334 ) ) ( not ( = ?auto_382329 ?auto_382335 ) ) ( not ( = ?auto_382329 ?auto_382336 ) ) ( not ( = ?auto_382329 ?auto_382337 ) ) ( not ( = ?auto_382330 ?auto_382331 ) ) ( not ( = ?auto_382330 ?auto_382332 ) ) ( not ( = ?auto_382330 ?auto_382333 ) ) ( not ( = ?auto_382330 ?auto_382334 ) ) ( not ( = ?auto_382330 ?auto_382335 ) ) ( not ( = ?auto_382330 ?auto_382336 ) ) ( not ( = ?auto_382330 ?auto_382337 ) ) ( not ( = ?auto_382331 ?auto_382332 ) ) ( not ( = ?auto_382331 ?auto_382333 ) ) ( not ( = ?auto_382331 ?auto_382334 ) ) ( not ( = ?auto_382331 ?auto_382335 ) ) ( not ( = ?auto_382331 ?auto_382336 ) ) ( not ( = ?auto_382331 ?auto_382337 ) ) ( not ( = ?auto_382332 ?auto_382333 ) ) ( not ( = ?auto_382332 ?auto_382334 ) ) ( not ( = ?auto_382332 ?auto_382335 ) ) ( not ( = ?auto_382332 ?auto_382336 ) ) ( not ( = ?auto_382332 ?auto_382337 ) ) ( not ( = ?auto_382333 ?auto_382334 ) ) ( not ( = ?auto_382333 ?auto_382335 ) ) ( not ( = ?auto_382333 ?auto_382336 ) ) ( not ( = ?auto_382333 ?auto_382337 ) ) ( not ( = ?auto_382334 ?auto_382335 ) ) ( not ( = ?auto_382334 ?auto_382336 ) ) ( not ( = ?auto_382334 ?auto_382337 ) ) ( not ( = ?auto_382335 ?auto_382336 ) ) ( not ( = ?auto_382335 ?auto_382337 ) ) ( not ( = ?auto_382336 ?auto_382337 ) ) ( ON ?auto_382335 ?auto_382336 ) ( ON ?auto_382334 ?auto_382335 ) ( ON ?auto_382333 ?auto_382334 ) ( ON ?auto_382332 ?auto_382333 ) ( ON ?auto_382331 ?auto_382332 ) ( CLEAR ?auto_382329 ) ( ON ?auto_382330 ?auto_382331 ) ( CLEAR ?auto_382330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_382329 ?auto_382330 )
      ( MAKE-8PILE ?auto_382329 ?auto_382330 ?auto_382331 ?auto_382332 ?auto_382333 ?auto_382334 ?auto_382335 ?auto_382336 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382346 - BLOCK
      ?auto_382347 - BLOCK
      ?auto_382348 - BLOCK
      ?auto_382349 - BLOCK
      ?auto_382350 - BLOCK
      ?auto_382351 - BLOCK
      ?auto_382352 - BLOCK
      ?auto_382353 - BLOCK
    )
    :vars
    (
      ?auto_382354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382353 ?auto_382354 ) ( not ( = ?auto_382346 ?auto_382347 ) ) ( not ( = ?auto_382346 ?auto_382348 ) ) ( not ( = ?auto_382346 ?auto_382349 ) ) ( not ( = ?auto_382346 ?auto_382350 ) ) ( not ( = ?auto_382346 ?auto_382351 ) ) ( not ( = ?auto_382346 ?auto_382352 ) ) ( not ( = ?auto_382346 ?auto_382353 ) ) ( not ( = ?auto_382346 ?auto_382354 ) ) ( not ( = ?auto_382347 ?auto_382348 ) ) ( not ( = ?auto_382347 ?auto_382349 ) ) ( not ( = ?auto_382347 ?auto_382350 ) ) ( not ( = ?auto_382347 ?auto_382351 ) ) ( not ( = ?auto_382347 ?auto_382352 ) ) ( not ( = ?auto_382347 ?auto_382353 ) ) ( not ( = ?auto_382347 ?auto_382354 ) ) ( not ( = ?auto_382348 ?auto_382349 ) ) ( not ( = ?auto_382348 ?auto_382350 ) ) ( not ( = ?auto_382348 ?auto_382351 ) ) ( not ( = ?auto_382348 ?auto_382352 ) ) ( not ( = ?auto_382348 ?auto_382353 ) ) ( not ( = ?auto_382348 ?auto_382354 ) ) ( not ( = ?auto_382349 ?auto_382350 ) ) ( not ( = ?auto_382349 ?auto_382351 ) ) ( not ( = ?auto_382349 ?auto_382352 ) ) ( not ( = ?auto_382349 ?auto_382353 ) ) ( not ( = ?auto_382349 ?auto_382354 ) ) ( not ( = ?auto_382350 ?auto_382351 ) ) ( not ( = ?auto_382350 ?auto_382352 ) ) ( not ( = ?auto_382350 ?auto_382353 ) ) ( not ( = ?auto_382350 ?auto_382354 ) ) ( not ( = ?auto_382351 ?auto_382352 ) ) ( not ( = ?auto_382351 ?auto_382353 ) ) ( not ( = ?auto_382351 ?auto_382354 ) ) ( not ( = ?auto_382352 ?auto_382353 ) ) ( not ( = ?auto_382352 ?auto_382354 ) ) ( not ( = ?auto_382353 ?auto_382354 ) ) ( ON ?auto_382352 ?auto_382353 ) ( ON ?auto_382351 ?auto_382352 ) ( ON ?auto_382350 ?auto_382351 ) ( ON ?auto_382349 ?auto_382350 ) ( ON ?auto_382348 ?auto_382349 ) ( ON ?auto_382347 ?auto_382348 ) ( ON ?auto_382346 ?auto_382347 ) ( CLEAR ?auto_382346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_382346 )
      ( MAKE-8PILE ?auto_382346 ?auto_382347 ?auto_382348 ?auto_382349 ?auto_382350 ?auto_382351 ?auto_382352 ?auto_382353 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_382363 - BLOCK
      ?auto_382364 - BLOCK
      ?auto_382365 - BLOCK
      ?auto_382366 - BLOCK
      ?auto_382367 - BLOCK
      ?auto_382368 - BLOCK
      ?auto_382369 - BLOCK
      ?auto_382370 - BLOCK
    )
    :vars
    (
      ?auto_382371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382370 ?auto_382371 ) ( not ( = ?auto_382363 ?auto_382364 ) ) ( not ( = ?auto_382363 ?auto_382365 ) ) ( not ( = ?auto_382363 ?auto_382366 ) ) ( not ( = ?auto_382363 ?auto_382367 ) ) ( not ( = ?auto_382363 ?auto_382368 ) ) ( not ( = ?auto_382363 ?auto_382369 ) ) ( not ( = ?auto_382363 ?auto_382370 ) ) ( not ( = ?auto_382363 ?auto_382371 ) ) ( not ( = ?auto_382364 ?auto_382365 ) ) ( not ( = ?auto_382364 ?auto_382366 ) ) ( not ( = ?auto_382364 ?auto_382367 ) ) ( not ( = ?auto_382364 ?auto_382368 ) ) ( not ( = ?auto_382364 ?auto_382369 ) ) ( not ( = ?auto_382364 ?auto_382370 ) ) ( not ( = ?auto_382364 ?auto_382371 ) ) ( not ( = ?auto_382365 ?auto_382366 ) ) ( not ( = ?auto_382365 ?auto_382367 ) ) ( not ( = ?auto_382365 ?auto_382368 ) ) ( not ( = ?auto_382365 ?auto_382369 ) ) ( not ( = ?auto_382365 ?auto_382370 ) ) ( not ( = ?auto_382365 ?auto_382371 ) ) ( not ( = ?auto_382366 ?auto_382367 ) ) ( not ( = ?auto_382366 ?auto_382368 ) ) ( not ( = ?auto_382366 ?auto_382369 ) ) ( not ( = ?auto_382366 ?auto_382370 ) ) ( not ( = ?auto_382366 ?auto_382371 ) ) ( not ( = ?auto_382367 ?auto_382368 ) ) ( not ( = ?auto_382367 ?auto_382369 ) ) ( not ( = ?auto_382367 ?auto_382370 ) ) ( not ( = ?auto_382367 ?auto_382371 ) ) ( not ( = ?auto_382368 ?auto_382369 ) ) ( not ( = ?auto_382368 ?auto_382370 ) ) ( not ( = ?auto_382368 ?auto_382371 ) ) ( not ( = ?auto_382369 ?auto_382370 ) ) ( not ( = ?auto_382369 ?auto_382371 ) ) ( not ( = ?auto_382370 ?auto_382371 ) ) ( ON ?auto_382369 ?auto_382370 ) ( ON ?auto_382368 ?auto_382369 ) ( ON ?auto_382367 ?auto_382368 ) ( ON ?auto_382366 ?auto_382367 ) ( ON ?auto_382365 ?auto_382366 ) ( ON ?auto_382364 ?auto_382365 ) ( ON ?auto_382363 ?auto_382364 ) ( CLEAR ?auto_382363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_382363 )
      ( MAKE-8PILE ?auto_382363 ?auto_382364 ?auto_382365 ?auto_382366 ?auto_382367 ?auto_382368 ?auto_382369 ?auto_382370 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382381 - BLOCK
      ?auto_382382 - BLOCK
      ?auto_382383 - BLOCK
      ?auto_382384 - BLOCK
      ?auto_382385 - BLOCK
      ?auto_382386 - BLOCK
      ?auto_382387 - BLOCK
      ?auto_382388 - BLOCK
      ?auto_382389 - BLOCK
    )
    :vars
    (
      ?auto_382390 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_382388 ) ( ON ?auto_382389 ?auto_382390 ) ( CLEAR ?auto_382389 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_382381 ) ( ON ?auto_382382 ?auto_382381 ) ( ON ?auto_382383 ?auto_382382 ) ( ON ?auto_382384 ?auto_382383 ) ( ON ?auto_382385 ?auto_382384 ) ( ON ?auto_382386 ?auto_382385 ) ( ON ?auto_382387 ?auto_382386 ) ( ON ?auto_382388 ?auto_382387 ) ( not ( = ?auto_382381 ?auto_382382 ) ) ( not ( = ?auto_382381 ?auto_382383 ) ) ( not ( = ?auto_382381 ?auto_382384 ) ) ( not ( = ?auto_382381 ?auto_382385 ) ) ( not ( = ?auto_382381 ?auto_382386 ) ) ( not ( = ?auto_382381 ?auto_382387 ) ) ( not ( = ?auto_382381 ?auto_382388 ) ) ( not ( = ?auto_382381 ?auto_382389 ) ) ( not ( = ?auto_382381 ?auto_382390 ) ) ( not ( = ?auto_382382 ?auto_382383 ) ) ( not ( = ?auto_382382 ?auto_382384 ) ) ( not ( = ?auto_382382 ?auto_382385 ) ) ( not ( = ?auto_382382 ?auto_382386 ) ) ( not ( = ?auto_382382 ?auto_382387 ) ) ( not ( = ?auto_382382 ?auto_382388 ) ) ( not ( = ?auto_382382 ?auto_382389 ) ) ( not ( = ?auto_382382 ?auto_382390 ) ) ( not ( = ?auto_382383 ?auto_382384 ) ) ( not ( = ?auto_382383 ?auto_382385 ) ) ( not ( = ?auto_382383 ?auto_382386 ) ) ( not ( = ?auto_382383 ?auto_382387 ) ) ( not ( = ?auto_382383 ?auto_382388 ) ) ( not ( = ?auto_382383 ?auto_382389 ) ) ( not ( = ?auto_382383 ?auto_382390 ) ) ( not ( = ?auto_382384 ?auto_382385 ) ) ( not ( = ?auto_382384 ?auto_382386 ) ) ( not ( = ?auto_382384 ?auto_382387 ) ) ( not ( = ?auto_382384 ?auto_382388 ) ) ( not ( = ?auto_382384 ?auto_382389 ) ) ( not ( = ?auto_382384 ?auto_382390 ) ) ( not ( = ?auto_382385 ?auto_382386 ) ) ( not ( = ?auto_382385 ?auto_382387 ) ) ( not ( = ?auto_382385 ?auto_382388 ) ) ( not ( = ?auto_382385 ?auto_382389 ) ) ( not ( = ?auto_382385 ?auto_382390 ) ) ( not ( = ?auto_382386 ?auto_382387 ) ) ( not ( = ?auto_382386 ?auto_382388 ) ) ( not ( = ?auto_382386 ?auto_382389 ) ) ( not ( = ?auto_382386 ?auto_382390 ) ) ( not ( = ?auto_382387 ?auto_382388 ) ) ( not ( = ?auto_382387 ?auto_382389 ) ) ( not ( = ?auto_382387 ?auto_382390 ) ) ( not ( = ?auto_382388 ?auto_382389 ) ) ( not ( = ?auto_382388 ?auto_382390 ) ) ( not ( = ?auto_382389 ?auto_382390 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_382389 ?auto_382390 )
      ( !STACK ?auto_382389 ?auto_382388 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382400 - BLOCK
      ?auto_382401 - BLOCK
      ?auto_382402 - BLOCK
      ?auto_382403 - BLOCK
      ?auto_382404 - BLOCK
      ?auto_382405 - BLOCK
      ?auto_382406 - BLOCK
      ?auto_382407 - BLOCK
      ?auto_382408 - BLOCK
    )
    :vars
    (
      ?auto_382409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_382407 ) ( ON ?auto_382408 ?auto_382409 ) ( CLEAR ?auto_382408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_382400 ) ( ON ?auto_382401 ?auto_382400 ) ( ON ?auto_382402 ?auto_382401 ) ( ON ?auto_382403 ?auto_382402 ) ( ON ?auto_382404 ?auto_382403 ) ( ON ?auto_382405 ?auto_382404 ) ( ON ?auto_382406 ?auto_382405 ) ( ON ?auto_382407 ?auto_382406 ) ( not ( = ?auto_382400 ?auto_382401 ) ) ( not ( = ?auto_382400 ?auto_382402 ) ) ( not ( = ?auto_382400 ?auto_382403 ) ) ( not ( = ?auto_382400 ?auto_382404 ) ) ( not ( = ?auto_382400 ?auto_382405 ) ) ( not ( = ?auto_382400 ?auto_382406 ) ) ( not ( = ?auto_382400 ?auto_382407 ) ) ( not ( = ?auto_382400 ?auto_382408 ) ) ( not ( = ?auto_382400 ?auto_382409 ) ) ( not ( = ?auto_382401 ?auto_382402 ) ) ( not ( = ?auto_382401 ?auto_382403 ) ) ( not ( = ?auto_382401 ?auto_382404 ) ) ( not ( = ?auto_382401 ?auto_382405 ) ) ( not ( = ?auto_382401 ?auto_382406 ) ) ( not ( = ?auto_382401 ?auto_382407 ) ) ( not ( = ?auto_382401 ?auto_382408 ) ) ( not ( = ?auto_382401 ?auto_382409 ) ) ( not ( = ?auto_382402 ?auto_382403 ) ) ( not ( = ?auto_382402 ?auto_382404 ) ) ( not ( = ?auto_382402 ?auto_382405 ) ) ( not ( = ?auto_382402 ?auto_382406 ) ) ( not ( = ?auto_382402 ?auto_382407 ) ) ( not ( = ?auto_382402 ?auto_382408 ) ) ( not ( = ?auto_382402 ?auto_382409 ) ) ( not ( = ?auto_382403 ?auto_382404 ) ) ( not ( = ?auto_382403 ?auto_382405 ) ) ( not ( = ?auto_382403 ?auto_382406 ) ) ( not ( = ?auto_382403 ?auto_382407 ) ) ( not ( = ?auto_382403 ?auto_382408 ) ) ( not ( = ?auto_382403 ?auto_382409 ) ) ( not ( = ?auto_382404 ?auto_382405 ) ) ( not ( = ?auto_382404 ?auto_382406 ) ) ( not ( = ?auto_382404 ?auto_382407 ) ) ( not ( = ?auto_382404 ?auto_382408 ) ) ( not ( = ?auto_382404 ?auto_382409 ) ) ( not ( = ?auto_382405 ?auto_382406 ) ) ( not ( = ?auto_382405 ?auto_382407 ) ) ( not ( = ?auto_382405 ?auto_382408 ) ) ( not ( = ?auto_382405 ?auto_382409 ) ) ( not ( = ?auto_382406 ?auto_382407 ) ) ( not ( = ?auto_382406 ?auto_382408 ) ) ( not ( = ?auto_382406 ?auto_382409 ) ) ( not ( = ?auto_382407 ?auto_382408 ) ) ( not ( = ?auto_382407 ?auto_382409 ) ) ( not ( = ?auto_382408 ?auto_382409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_382408 ?auto_382409 )
      ( !STACK ?auto_382408 ?auto_382407 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382419 - BLOCK
      ?auto_382420 - BLOCK
      ?auto_382421 - BLOCK
      ?auto_382422 - BLOCK
      ?auto_382423 - BLOCK
      ?auto_382424 - BLOCK
      ?auto_382425 - BLOCK
      ?auto_382426 - BLOCK
      ?auto_382427 - BLOCK
    )
    :vars
    (
      ?auto_382428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382427 ?auto_382428 ) ( ON-TABLE ?auto_382419 ) ( ON ?auto_382420 ?auto_382419 ) ( ON ?auto_382421 ?auto_382420 ) ( ON ?auto_382422 ?auto_382421 ) ( ON ?auto_382423 ?auto_382422 ) ( ON ?auto_382424 ?auto_382423 ) ( ON ?auto_382425 ?auto_382424 ) ( not ( = ?auto_382419 ?auto_382420 ) ) ( not ( = ?auto_382419 ?auto_382421 ) ) ( not ( = ?auto_382419 ?auto_382422 ) ) ( not ( = ?auto_382419 ?auto_382423 ) ) ( not ( = ?auto_382419 ?auto_382424 ) ) ( not ( = ?auto_382419 ?auto_382425 ) ) ( not ( = ?auto_382419 ?auto_382426 ) ) ( not ( = ?auto_382419 ?auto_382427 ) ) ( not ( = ?auto_382419 ?auto_382428 ) ) ( not ( = ?auto_382420 ?auto_382421 ) ) ( not ( = ?auto_382420 ?auto_382422 ) ) ( not ( = ?auto_382420 ?auto_382423 ) ) ( not ( = ?auto_382420 ?auto_382424 ) ) ( not ( = ?auto_382420 ?auto_382425 ) ) ( not ( = ?auto_382420 ?auto_382426 ) ) ( not ( = ?auto_382420 ?auto_382427 ) ) ( not ( = ?auto_382420 ?auto_382428 ) ) ( not ( = ?auto_382421 ?auto_382422 ) ) ( not ( = ?auto_382421 ?auto_382423 ) ) ( not ( = ?auto_382421 ?auto_382424 ) ) ( not ( = ?auto_382421 ?auto_382425 ) ) ( not ( = ?auto_382421 ?auto_382426 ) ) ( not ( = ?auto_382421 ?auto_382427 ) ) ( not ( = ?auto_382421 ?auto_382428 ) ) ( not ( = ?auto_382422 ?auto_382423 ) ) ( not ( = ?auto_382422 ?auto_382424 ) ) ( not ( = ?auto_382422 ?auto_382425 ) ) ( not ( = ?auto_382422 ?auto_382426 ) ) ( not ( = ?auto_382422 ?auto_382427 ) ) ( not ( = ?auto_382422 ?auto_382428 ) ) ( not ( = ?auto_382423 ?auto_382424 ) ) ( not ( = ?auto_382423 ?auto_382425 ) ) ( not ( = ?auto_382423 ?auto_382426 ) ) ( not ( = ?auto_382423 ?auto_382427 ) ) ( not ( = ?auto_382423 ?auto_382428 ) ) ( not ( = ?auto_382424 ?auto_382425 ) ) ( not ( = ?auto_382424 ?auto_382426 ) ) ( not ( = ?auto_382424 ?auto_382427 ) ) ( not ( = ?auto_382424 ?auto_382428 ) ) ( not ( = ?auto_382425 ?auto_382426 ) ) ( not ( = ?auto_382425 ?auto_382427 ) ) ( not ( = ?auto_382425 ?auto_382428 ) ) ( not ( = ?auto_382426 ?auto_382427 ) ) ( not ( = ?auto_382426 ?auto_382428 ) ) ( not ( = ?auto_382427 ?auto_382428 ) ) ( CLEAR ?auto_382425 ) ( ON ?auto_382426 ?auto_382427 ) ( CLEAR ?auto_382426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_382419 ?auto_382420 ?auto_382421 ?auto_382422 ?auto_382423 ?auto_382424 ?auto_382425 ?auto_382426 )
      ( MAKE-9PILE ?auto_382419 ?auto_382420 ?auto_382421 ?auto_382422 ?auto_382423 ?auto_382424 ?auto_382425 ?auto_382426 ?auto_382427 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382438 - BLOCK
      ?auto_382439 - BLOCK
      ?auto_382440 - BLOCK
      ?auto_382441 - BLOCK
      ?auto_382442 - BLOCK
      ?auto_382443 - BLOCK
      ?auto_382444 - BLOCK
      ?auto_382445 - BLOCK
      ?auto_382446 - BLOCK
    )
    :vars
    (
      ?auto_382447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382446 ?auto_382447 ) ( ON-TABLE ?auto_382438 ) ( ON ?auto_382439 ?auto_382438 ) ( ON ?auto_382440 ?auto_382439 ) ( ON ?auto_382441 ?auto_382440 ) ( ON ?auto_382442 ?auto_382441 ) ( ON ?auto_382443 ?auto_382442 ) ( ON ?auto_382444 ?auto_382443 ) ( not ( = ?auto_382438 ?auto_382439 ) ) ( not ( = ?auto_382438 ?auto_382440 ) ) ( not ( = ?auto_382438 ?auto_382441 ) ) ( not ( = ?auto_382438 ?auto_382442 ) ) ( not ( = ?auto_382438 ?auto_382443 ) ) ( not ( = ?auto_382438 ?auto_382444 ) ) ( not ( = ?auto_382438 ?auto_382445 ) ) ( not ( = ?auto_382438 ?auto_382446 ) ) ( not ( = ?auto_382438 ?auto_382447 ) ) ( not ( = ?auto_382439 ?auto_382440 ) ) ( not ( = ?auto_382439 ?auto_382441 ) ) ( not ( = ?auto_382439 ?auto_382442 ) ) ( not ( = ?auto_382439 ?auto_382443 ) ) ( not ( = ?auto_382439 ?auto_382444 ) ) ( not ( = ?auto_382439 ?auto_382445 ) ) ( not ( = ?auto_382439 ?auto_382446 ) ) ( not ( = ?auto_382439 ?auto_382447 ) ) ( not ( = ?auto_382440 ?auto_382441 ) ) ( not ( = ?auto_382440 ?auto_382442 ) ) ( not ( = ?auto_382440 ?auto_382443 ) ) ( not ( = ?auto_382440 ?auto_382444 ) ) ( not ( = ?auto_382440 ?auto_382445 ) ) ( not ( = ?auto_382440 ?auto_382446 ) ) ( not ( = ?auto_382440 ?auto_382447 ) ) ( not ( = ?auto_382441 ?auto_382442 ) ) ( not ( = ?auto_382441 ?auto_382443 ) ) ( not ( = ?auto_382441 ?auto_382444 ) ) ( not ( = ?auto_382441 ?auto_382445 ) ) ( not ( = ?auto_382441 ?auto_382446 ) ) ( not ( = ?auto_382441 ?auto_382447 ) ) ( not ( = ?auto_382442 ?auto_382443 ) ) ( not ( = ?auto_382442 ?auto_382444 ) ) ( not ( = ?auto_382442 ?auto_382445 ) ) ( not ( = ?auto_382442 ?auto_382446 ) ) ( not ( = ?auto_382442 ?auto_382447 ) ) ( not ( = ?auto_382443 ?auto_382444 ) ) ( not ( = ?auto_382443 ?auto_382445 ) ) ( not ( = ?auto_382443 ?auto_382446 ) ) ( not ( = ?auto_382443 ?auto_382447 ) ) ( not ( = ?auto_382444 ?auto_382445 ) ) ( not ( = ?auto_382444 ?auto_382446 ) ) ( not ( = ?auto_382444 ?auto_382447 ) ) ( not ( = ?auto_382445 ?auto_382446 ) ) ( not ( = ?auto_382445 ?auto_382447 ) ) ( not ( = ?auto_382446 ?auto_382447 ) ) ( CLEAR ?auto_382444 ) ( ON ?auto_382445 ?auto_382446 ) ( CLEAR ?auto_382445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_382438 ?auto_382439 ?auto_382440 ?auto_382441 ?auto_382442 ?auto_382443 ?auto_382444 ?auto_382445 )
      ( MAKE-9PILE ?auto_382438 ?auto_382439 ?auto_382440 ?auto_382441 ?auto_382442 ?auto_382443 ?auto_382444 ?auto_382445 ?auto_382446 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382457 - BLOCK
      ?auto_382458 - BLOCK
      ?auto_382459 - BLOCK
      ?auto_382460 - BLOCK
      ?auto_382461 - BLOCK
      ?auto_382462 - BLOCK
      ?auto_382463 - BLOCK
      ?auto_382464 - BLOCK
      ?auto_382465 - BLOCK
    )
    :vars
    (
      ?auto_382466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382465 ?auto_382466 ) ( ON-TABLE ?auto_382457 ) ( ON ?auto_382458 ?auto_382457 ) ( ON ?auto_382459 ?auto_382458 ) ( ON ?auto_382460 ?auto_382459 ) ( ON ?auto_382461 ?auto_382460 ) ( ON ?auto_382462 ?auto_382461 ) ( not ( = ?auto_382457 ?auto_382458 ) ) ( not ( = ?auto_382457 ?auto_382459 ) ) ( not ( = ?auto_382457 ?auto_382460 ) ) ( not ( = ?auto_382457 ?auto_382461 ) ) ( not ( = ?auto_382457 ?auto_382462 ) ) ( not ( = ?auto_382457 ?auto_382463 ) ) ( not ( = ?auto_382457 ?auto_382464 ) ) ( not ( = ?auto_382457 ?auto_382465 ) ) ( not ( = ?auto_382457 ?auto_382466 ) ) ( not ( = ?auto_382458 ?auto_382459 ) ) ( not ( = ?auto_382458 ?auto_382460 ) ) ( not ( = ?auto_382458 ?auto_382461 ) ) ( not ( = ?auto_382458 ?auto_382462 ) ) ( not ( = ?auto_382458 ?auto_382463 ) ) ( not ( = ?auto_382458 ?auto_382464 ) ) ( not ( = ?auto_382458 ?auto_382465 ) ) ( not ( = ?auto_382458 ?auto_382466 ) ) ( not ( = ?auto_382459 ?auto_382460 ) ) ( not ( = ?auto_382459 ?auto_382461 ) ) ( not ( = ?auto_382459 ?auto_382462 ) ) ( not ( = ?auto_382459 ?auto_382463 ) ) ( not ( = ?auto_382459 ?auto_382464 ) ) ( not ( = ?auto_382459 ?auto_382465 ) ) ( not ( = ?auto_382459 ?auto_382466 ) ) ( not ( = ?auto_382460 ?auto_382461 ) ) ( not ( = ?auto_382460 ?auto_382462 ) ) ( not ( = ?auto_382460 ?auto_382463 ) ) ( not ( = ?auto_382460 ?auto_382464 ) ) ( not ( = ?auto_382460 ?auto_382465 ) ) ( not ( = ?auto_382460 ?auto_382466 ) ) ( not ( = ?auto_382461 ?auto_382462 ) ) ( not ( = ?auto_382461 ?auto_382463 ) ) ( not ( = ?auto_382461 ?auto_382464 ) ) ( not ( = ?auto_382461 ?auto_382465 ) ) ( not ( = ?auto_382461 ?auto_382466 ) ) ( not ( = ?auto_382462 ?auto_382463 ) ) ( not ( = ?auto_382462 ?auto_382464 ) ) ( not ( = ?auto_382462 ?auto_382465 ) ) ( not ( = ?auto_382462 ?auto_382466 ) ) ( not ( = ?auto_382463 ?auto_382464 ) ) ( not ( = ?auto_382463 ?auto_382465 ) ) ( not ( = ?auto_382463 ?auto_382466 ) ) ( not ( = ?auto_382464 ?auto_382465 ) ) ( not ( = ?auto_382464 ?auto_382466 ) ) ( not ( = ?auto_382465 ?auto_382466 ) ) ( ON ?auto_382464 ?auto_382465 ) ( CLEAR ?auto_382462 ) ( ON ?auto_382463 ?auto_382464 ) ( CLEAR ?auto_382463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_382457 ?auto_382458 ?auto_382459 ?auto_382460 ?auto_382461 ?auto_382462 ?auto_382463 )
      ( MAKE-9PILE ?auto_382457 ?auto_382458 ?auto_382459 ?auto_382460 ?auto_382461 ?auto_382462 ?auto_382463 ?auto_382464 ?auto_382465 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382476 - BLOCK
      ?auto_382477 - BLOCK
      ?auto_382478 - BLOCK
      ?auto_382479 - BLOCK
      ?auto_382480 - BLOCK
      ?auto_382481 - BLOCK
      ?auto_382482 - BLOCK
      ?auto_382483 - BLOCK
      ?auto_382484 - BLOCK
    )
    :vars
    (
      ?auto_382485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382484 ?auto_382485 ) ( ON-TABLE ?auto_382476 ) ( ON ?auto_382477 ?auto_382476 ) ( ON ?auto_382478 ?auto_382477 ) ( ON ?auto_382479 ?auto_382478 ) ( ON ?auto_382480 ?auto_382479 ) ( ON ?auto_382481 ?auto_382480 ) ( not ( = ?auto_382476 ?auto_382477 ) ) ( not ( = ?auto_382476 ?auto_382478 ) ) ( not ( = ?auto_382476 ?auto_382479 ) ) ( not ( = ?auto_382476 ?auto_382480 ) ) ( not ( = ?auto_382476 ?auto_382481 ) ) ( not ( = ?auto_382476 ?auto_382482 ) ) ( not ( = ?auto_382476 ?auto_382483 ) ) ( not ( = ?auto_382476 ?auto_382484 ) ) ( not ( = ?auto_382476 ?auto_382485 ) ) ( not ( = ?auto_382477 ?auto_382478 ) ) ( not ( = ?auto_382477 ?auto_382479 ) ) ( not ( = ?auto_382477 ?auto_382480 ) ) ( not ( = ?auto_382477 ?auto_382481 ) ) ( not ( = ?auto_382477 ?auto_382482 ) ) ( not ( = ?auto_382477 ?auto_382483 ) ) ( not ( = ?auto_382477 ?auto_382484 ) ) ( not ( = ?auto_382477 ?auto_382485 ) ) ( not ( = ?auto_382478 ?auto_382479 ) ) ( not ( = ?auto_382478 ?auto_382480 ) ) ( not ( = ?auto_382478 ?auto_382481 ) ) ( not ( = ?auto_382478 ?auto_382482 ) ) ( not ( = ?auto_382478 ?auto_382483 ) ) ( not ( = ?auto_382478 ?auto_382484 ) ) ( not ( = ?auto_382478 ?auto_382485 ) ) ( not ( = ?auto_382479 ?auto_382480 ) ) ( not ( = ?auto_382479 ?auto_382481 ) ) ( not ( = ?auto_382479 ?auto_382482 ) ) ( not ( = ?auto_382479 ?auto_382483 ) ) ( not ( = ?auto_382479 ?auto_382484 ) ) ( not ( = ?auto_382479 ?auto_382485 ) ) ( not ( = ?auto_382480 ?auto_382481 ) ) ( not ( = ?auto_382480 ?auto_382482 ) ) ( not ( = ?auto_382480 ?auto_382483 ) ) ( not ( = ?auto_382480 ?auto_382484 ) ) ( not ( = ?auto_382480 ?auto_382485 ) ) ( not ( = ?auto_382481 ?auto_382482 ) ) ( not ( = ?auto_382481 ?auto_382483 ) ) ( not ( = ?auto_382481 ?auto_382484 ) ) ( not ( = ?auto_382481 ?auto_382485 ) ) ( not ( = ?auto_382482 ?auto_382483 ) ) ( not ( = ?auto_382482 ?auto_382484 ) ) ( not ( = ?auto_382482 ?auto_382485 ) ) ( not ( = ?auto_382483 ?auto_382484 ) ) ( not ( = ?auto_382483 ?auto_382485 ) ) ( not ( = ?auto_382484 ?auto_382485 ) ) ( ON ?auto_382483 ?auto_382484 ) ( CLEAR ?auto_382481 ) ( ON ?auto_382482 ?auto_382483 ) ( CLEAR ?auto_382482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_382476 ?auto_382477 ?auto_382478 ?auto_382479 ?auto_382480 ?auto_382481 ?auto_382482 )
      ( MAKE-9PILE ?auto_382476 ?auto_382477 ?auto_382478 ?auto_382479 ?auto_382480 ?auto_382481 ?auto_382482 ?auto_382483 ?auto_382484 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382495 - BLOCK
      ?auto_382496 - BLOCK
      ?auto_382497 - BLOCK
      ?auto_382498 - BLOCK
      ?auto_382499 - BLOCK
      ?auto_382500 - BLOCK
      ?auto_382501 - BLOCK
      ?auto_382502 - BLOCK
      ?auto_382503 - BLOCK
    )
    :vars
    (
      ?auto_382504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382503 ?auto_382504 ) ( ON-TABLE ?auto_382495 ) ( ON ?auto_382496 ?auto_382495 ) ( ON ?auto_382497 ?auto_382496 ) ( ON ?auto_382498 ?auto_382497 ) ( ON ?auto_382499 ?auto_382498 ) ( not ( = ?auto_382495 ?auto_382496 ) ) ( not ( = ?auto_382495 ?auto_382497 ) ) ( not ( = ?auto_382495 ?auto_382498 ) ) ( not ( = ?auto_382495 ?auto_382499 ) ) ( not ( = ?auto_382495 ?auto_382500 ) ) ( not ( = ?auto_382495 ?auto_382501 ) ) ( not ( = ?auto_382495 ?auto_382502 ) ) ( not ( = ?auto_382495 ?auto_382503 ) ) ( not ( = ?auto_382495 ?auto_382504 ) ) ( not ( = ?auto_382496 ?auto_382497 ) ) ( not ( = ?auto_382496 ?auto_382498 ) ) ( not ( = ?auto_382496 ?auto_382499 ) ) ( not ( = ?auto_382496 ?auto_382500 ) ) ( not ( = ?auto_382496 ?auto_382501 ) ) ( not ( = ?auto_382496 ?auto_382502 ) ) ( not ( = ?auto_382496 ?auto_382503 ) ) ( not ( = ?auto_382496 ?auto_382504 ) ) ( not ( = ?auto_382497 ?auto_382498 ) ) ( not ( = ?auto_382497 ?auto_382499 ) ) ( not ( = ?auto_382497 ?auto_382500 ) ) ( not ( = ?auto_382497 ?auto_382501 ) ) ( not ( = ?auto_382497 ?auto_382502 ) ) ( not ( = ?auto_382497 ?auto_382503 ) ) ( not ( = ?auto_382497 ?auto_382504 ) ) ( not ( = ?auto_382498 ?auto_382499 ) ) ( not ( = ?auto_382498 ?auto_382500 ) ) ( not ( = ?auto_382498 ?auto_382501 ) ) ( not ( = ?auto_382498 ?auto_382502 ) ) ( not ( = ?auto_382498 ?auto_382503 ) ) ( not ( = ?auto_382498 ?auto_382504 ) ) ( not ( = ?auto_382499 ?auto_382500 ) ) ( not ( = ?auto_382499 ?auto_382501 ) ) ( not ( = ?auto_382499 ?auto_382502 ) ) ( not ( = ?auto_382499 ?auto_382503 ) ) ( not ( = ?auto_382499 ?auto_382504 ) ) ( not ( = ?auto_382500 ?auto_382501 ) ) ( not ( = ?auto_382500 ?auto_382502 ) ) ( not ( = ?auto_382500 ?auto_382503 ) ) ( not ( = ?auto_382500 ?auto_382504 ) ) ( not ( = ?auto_382501 ?auto_382502 ) ) ( not ( = ?auto_382501 ?auto_382503 ) ) ( not ( = ?auto_382501 ?auto_382504 ) ) ( not ( = ?auto_382502 ?auto_382503 ) ) ( not ( = ?auto_382502 ?auto_382504 ) ) ( not ( = ?auto_382503 ?auto_382504 ) ) ( ON ?auto_382502 ?auto_382503 ) ( ON ?auto_382501 ?auto_382502 ) ( CLEAR ?auto_382499 ) ( ON ?auto_382500 ?auto_382501 ) ( CLEAR ?auto_382500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_382495 ?auto_382496 ?auto_382497 ?auto_382498 ?auto_382499 ?auto_382500 )
      ( MAKE-9PILE ?auto_382495 ?auto_382496 ?auto_382497 ?auto_382498 ?auto_382499 ?auto_382500 ?auto_382501 ?auto_382502 ?auto_382503 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382514 - BLOCK
      ?auto_382515 - BLOCK
      ?auto_382516 - BLOCK
      ?auto_382517 - BLOCK
      ?auto_382518 - BLOCK
      ?auto_382519 - BLOCK
      ?auto_382520 - BLOCK
      ?auto_382521 - BLOCK
      ?auto_382522 - BLOCK
    )
    :vars
    (
      ?auto_382523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382522 ?auto_382523 ) ( ON-TABLE ?auto_382514 ) ( ON ?auto_382515 ?auto_382514 ) ( ON ?auto_382516 ?auto_382515 ) ( ON ?auto_382517 ?auto_382516 ) ( ON ?auto_382518 ?auto_382517 ) ( not ( = ?auto_382514 ?auto_382515 ) ) ( not ( = ?auto_382514 ?auto_382516 ) ) ( not ( = ?auto_382514 ?auto_382517 ) ) ( not ( = ?auto_382514 ?auto_382518 ) ) ( not ( = ?auto_382514 ?auto_382519 ) ) ( not ( = ?auto_382514 ?auto_382520 ) ) ( not ( = ?auto_382514 ?auto_382521 ) ) ( not ( = ?auto_382514 ?auto_382522 ) ) ( not ( = ?auto_382514 ?auto_382523 ) ) ( not ( = ?auto_382515 ?auto_382516 ) ) ( not ( = ?auto_382515 ?auto_382517 ) ) ( not ( = ?auto_382515 ?auto_382518 ) ) ( not ( = ?auto_382515 ?auto_382519 ) ) ( not ( = ?auto_382515 ?auto_382520 ) ) ( not ( = ?auto_382515 ?auto_382521 ) ) ( not ( = ?auto_382515 ?auto_382522 ) ) ( not ( = ?auto_382515 ?auto_382523 ) ) ( not ( = ?auto_382516 ?auto_382517 ) ) ( not ( = ?auto_382516 ?auto_382518 ) ) ( not ( = ?auto_382516 ?auto_382519 ) ) ( not ( = ?auto_382516 ?auto_382520 ) ) ( not ( = ?auto_382516 ?auto_382521 ) ) ( not ( = ?auto_382516 ?auto_382522 ) ) ( not ( = ?auto_382516 ?auto_382523 ) ) ( not ( = ?auto_382517 ?auto_382518 ) ) ( not ( = ?auto_382517 ?auto_382519 ) ) ( not ( = ?auto_382517 ?auto_382520 ) ) ( not ( = ?auto_382517 ?auto_382521 ) ) ( not ( = ?auto_382517 ?auto_382522 ) ) ( not ( = ?auto_382517 ?auto_382523 ) ) ( not ( = ?auto_382518 ?auto_382519 ) ) ( not ( = ?auto_382518 ?auto_382520 ) ) ( not ( = ?auto_382518 ?auto_382521 ) ) ( not ( = ?auto_382518 ?auto_382522 ) ) ( not ( = ?auto_382518 ?auto_382523 ) ) ( not ( = ?auto_382519 ?auto_382520 ) ) ( not ( = ?auto_382519 ?auto_382521 ) ) ( not ( = ?auto_382519 ?auto_382522 ) ) ( not ( = ?auto_382519 ?auto_382523 ) ) ( not ( = ?auto_382520 ?auto_382521 ) ) ( not ( = ?auto_382520 ?auto_382522 ) ) ( not ( = ?auto_382520 ?auto_382523 ) ) ( not ( = ?auto_382521 ?auto_382522 ) ) ( not ( = ?auto_382521 ?auto_382523 ) ) ( not ( = ?auto_382522 ?auto_382523 ) ) ( ON ?auto_382521 ?auto_382522 ) ( ON ?auto_382520 ?auto_382521 ) ( CLEAR ?auto_382518 ) ( ON ?auto_382519 ?auto_382520 ) ( CLEAR ?auto_382519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_382514 ?auto_382515 ?auto_382516 ?auto_382517 ?auto_382518 ?auto_382519 )
      ( MAKE-9PILE ?auto_382514 ?auto_382515 ?auto_382516 ?auto_382517 ?auto_382518 ?auto_382519 ?auto_382520 ?auto_382521 ?auto_382522 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382533 - BLOCK
      ?auto_382534 - BLOCK
      ?auto_382535 - BLOCK
      ?auto_382536 - BLOCK
      ?auto_382537 - BLOCK
      ?auto_382538 - BLOCK
      ?auto_382539 - BLOCK
      ?auto_382540 - BLOCK
      ?auto_382541 - BLOCK
    )
    :vars
    (
      ?auto_382542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382541 ?auto_382542 ) ( ON-TABLE ?auto_382533 ) ( ON ?auto_382534 ?auto_382533 ) ( ON ?auto_382535 ?auto_382534 ) ( ON ?auto_382536 ?auto_382535 ) ( not ( = ?auto_382533 ?auto_382534 ) ) ( not ( = ?auto_382533 ?auto_382535 ) ) ( not ( = ?auto_382533 ?auto_382536 ) ) ( not ( = ?auto_382533 ?auto_382537 ) ) ( not ( = ?auto_382533 ?auto_382538 ) ) ( not ( = ?auto_382533 ?auto_382539 ) ) ( not ( = ?auto_382533 ?auto_382540 ) ) ( not ( = ?auto_382533 ?auto_382541 ) ) ( not ( = ?auto_382533 ?auto_382542 ) ) ( not ( = ?auto_382534 ?auto_382535 ) ) ( not ( = ?auto_382534 ?auto_382536 ) ) ( not ( = ?auto_382534 ?auto_382537 ) ) ( not ( = ?auto_382534 ?auto_382538 ) ) ( not ( = ?auto_382534 ?auto_382539 ) ) ( not ( = ?auto_382534 ?auto_382540 ) ) ( not ( = ?auto_382534 ?auto_382541 ) ) ( not ( = ?auto_382534 ?auto_382542 ) ) ( not ( = ?auto_382535 ?auto_382536 ) ) ( not ( = ?auto_382535 ?auto_382537 ) ) ( not ( = ?auto_382535 ?auto_382538 ) ) ( not ( = ?auto_382535 ?auto_382539 ) ) ( not ( = ?auto_382535 ?auto_382540 ) ) ( not ( = ?auto_382535 ?auto_382541 ) ) ( not ( = ?auto_382535 ?auto_382542 ) ) ( not ( = ?auto_382536 ?auto_382537 ) ) ( not ( = ?auto_382536 ?auto_382538 ) ) ( not ( = ?auto_382536 ?auto_382539 ) ) ( not ( = ?auto_382536 ?auto_382540 ) ) ( not ( = ?auto_382536 ?auto_382541 ) ) ( not ( = ?auto_382536 ?auto_382542 ) ) ( not ( = ?auto_382537 ?auto_382538 ) ) ( not ( = ?auto_382537 ?auto_382539 ) ) ( not ( = ?auto_382537 ?auto_382540 ) ) ( not ( = ?auto_382537 ?auto_382541 ) ) ( not ( = ?auto_382537 ?auto_382542 ) ) ( not ( = ?auto_382538 ?auto_382539 ) ) ( not ( = ?auto_382538 ?auto_382540 ) ) ( not ( = ?auto_382538 ?auto_382541 ) ) ( not ( = ?auto_382538 ?auto_382542 ) ) ( not ( = ?auto_382539 ?auto_382540 ) ) ( not ( = ?auto_382539 ?auto_382541 ) ) ( not ( = ?auto_382539 ?auto_382542 ) ) ( not ( = ?auto_382540 ?auto_382541 ) ) ( not ( = ?auto_382540 ?auto_382542 ) ) ( not ( = ?auto_382541 ?auto_382542 ) ) ( ON ?auto_382540 ?auto_382541 ) ( ON ?auto_382539 ?auto_382540 ) ( ON ?auto_382538 ?auto_382539 ) ( CLEAR ?auto_382536 ) ( ON ?auto_382537 ?auto_382538 ) ( CLEAR ?auto_382537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_382533 ?auto_382534 ?auto_382535 ?auto_382536 ?auto_382537 )
      ( MAKE-9PILE ?auto_382533 ?auto_382534 ?auto_382535 ?auto_382536 ?auto_382537 ?auto_382538 ?auto_382539 ?auto_382540 ?auto_382541 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382552 - BLOCK
      ?auto_382553 - BLOCK
      ?auto_382554 - BLOCK
      ?auto_382555 - BLOCK
      ?auto_382556 - BLOCK
      ?auto_382557 - BLOCK
      ?auto_382558 - BLOCK
      ?auto_382559 - BLOCK
      ?auto_382560 - BLOCK
    )
    :vars
    (
      ?auto_382561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382560 ?auto_382561 ) ( ON-TABLE ?auto_382552 ) ( ON ?auto_382553 ?auto_382552 ) ( ON ?auto_382554 ?auto_382553 ) ( ON ?auto_382555 ?auto_382554 ) ( not ( = ?auto_382552 ?auto_382553 ) ) ( not ( = ?auto_382552 ?auto_382554 ) ) ( not ( = ?auto_382552 ?auto_382555 ) ) ( not ( = ?auto_382552 ?auto_382556 ) ) ( not ( = ?auto_382552 ?auto_382557 ) ) ( not ( = ?auto_382552 ?auto_382558 ) ) ( not ( = ?auto_382552 ?auto_382559 ) ) ( not ( = ?auto_382552 ?auto_382560 ) ) ( not ( = ?auto_382552 ?auto_382561 ) ) ( not ( = ?auto_382553 ?auto_382554 ) ) ( not ( = ?auto_382553 ?auto_382555 ) ) ( not ( = ?auto_382553 ?auto_382556 ) ) ( not ( = ?auto_382553 ?auto_382557 ) ) ( not ( = ?auto_382553 ?auto_382558 ) ) ( not ( = ?auto_382553 ?auto_382559 ) ) ( not ( = ?auto_382553 ?auto_382560 ) ) ( not ( = ?auto_382553 ?auto_382561 ) ) ( not ( = ?auto_382554 ?auto_382555 ) ) ( not ( = ?auto_382554 ?auto_382556 ) ) ( not ( = ?auto_382554 ?auto_382557 ) ) ( not ( = ?auto_382554 ?auto_382558 ) ) ( not ( = ?auto_382554 ?auto_382559 ) ) ( not ( = ?auto_382554 ?auto_382560 ) ) ( not ( = ?auto_382554 ?auto_382561 ) ) ( not ( = ?auto_382555 ?auto_382556 ) ) ( not ( = ?auto_382555 ?auto_382557 ) ) ( not ( = ?auto_382555 ?auto_382558 ) ) ( not ( = ?auto_382555 ?auto_382559 ) ) ( not ( = ?auto_382555 ?auto_382560 ) ) ( not ( = ?auto_382555 ?auto_382561 ) ) ( not ( = ?auto_382556 ?auto_382557 ) ) ( not ( = ?auto_382556 ?auto_382558 ) ) ( not ( = ?auto_382556 ?auto_382559 ) ) ( not ( = ?auto_382556 ?auto_382560 ) ) ( not ( = ?auto_382556 ?auto_382561 ) ) ( not ( = ?auto_382557 ?auto_382558 ) ) ( not ( = ?auto_382557 ?auto_382559 ) ) ( not ( = ?auto_382557 ?auto_382560 ) ) ( not ( = ?auto_382557 ?auto_382561 ) ) ( not ( = ?auto_382558 ?auto_382559 ) ) ( not ( = ?auto_382558 ?auto_382560 ) ) ( not ( = ?auto_382558 ?auto_382561 ) ) ( not ( = ?auto_382559 ?auto_382560 ) ) ( not ( = ?auto_382559 ?auto_382561 ) ) ( not ( = ?auto_382560 ?auto_382561 ) ) ( ON ?auto_382559 ?auto_382560 ) ( ON ?auto_382558 ?auto_382559 ) ( ON ?auto_382557 ?auto_382558 ) ( CLEAR ?auto_382555 ) ( ON ?auto_382556 ?auto_382557 ) ( CLEAR ?auto_382556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_382552 ?auto_382553 ?auto_382554 ?auto_382555 ?auto_382556 )
      ( MAKE-9PILE ?auto_382552 ?auto_382553 ?auto_382554 ?auto_382555 ?auto_382556 ?auto_382557 ?auto_382558 ?auto_382559 ?auto_382560 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382571 - BLOCK
      ?auto_382572 - BLOCK
      ?auto_382573 - BLOCK
      ?auto_382574 - BLOCK
      ?auto_382575 - BLOCK
      ?auto_382576 - BLOCK
      ?auto_382577 - BLOCK
      ?auto_382578 - BLOCK
      ?auto_382579 - BLOCK
    )
    :vars
    (
      ?auto_382580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382579 ?auto_382580 ) ( ON-TABLE ?auto_382571 ) ( ON ?auto_382572 ?auto_382571 ) ( ON ?auto_382573 ?auto_382572 ) ( not ( = ?auto_382571 ?auto_382572 ) ) ( not ( = ?auto_382571 ?auto_382573 ) ) ( not ( = ?auto_382571 ?auto_382574 ) ) ( not ( = ?auto_382571 ?auto_382575 ) ) ( not ( = ?auto_382571 ?auto_382576 ) ) ( not ( = ?auto_382571 ?auto_382577 ) ) ( not ( = ?auto_382571 ?auto_382578 ) ) ( not ( = ?auto_382571 ?auto_382579 ) ) ( not ( = ?auto_382571 ?auto_382580 ) ) ( not ( = ?auto_382572 ?auto_382573 ) ) ( not ( = ?auto_382572 ?auto_382574 ) ) ( not ( = ?auto_382572 ?auto_382575 ) ) ( not ( = ?auto_382572 ?auto_382576 ) ) ( not ( = ?auto_382572 ?auto_382577 ) ) ( not ( = ?auto_382572 ?auto_382578 ) ) ( not ( = ?auto_382572 ?auto_382579 ) ) ( not ( = ?auto_382572 ?auto_382580 ) ) ( not ( = ?auto_382573 ?auto_382574 ) ) ( not ( = ?auto_382573 ?auto_382575 ) ) ( not ( = ?auto_382573 ?auto_382576 ) ) ( not ( = ?auto_382573 ?auto_382577 ) ) ( not ( = ?auto_382573 ?auto_382578 ) ) ( not ( = ?auto_382573 ?auto_382579 ) ) ( not ( = ?auto_382573 ?auto_382580 ) ) ( not ( = ?auto_382574 ?auto_382575 ) ) ( not ( = ?auto_382574 ?auto_382576 ) ) ( not ( = ?auto_382574 ?auto_382577 ) ) ( not ( = ?auto_382574 ?auto_382578 ) ) ( not ( = ?auto_382574 ?auto_382579 ) ) ( not ( = ?auto_382574 ?auto_382580 ) ) ( not ( = ?auto_382575 ?auto_382576 ) ) ( not ( = ?auto_382575 ?auto_382577 ) ) ( not ( = ?auto_382575 ?auto_382578 ) ) ( not ( = ?auto_382575 ?auto_382579 ) ) ( not ( = ?auto_382575 ?auto_382580 ) ) ( not ( = ?auto_382576 ?auto_382577 ) ) ( not ( = ?auto_382576 ?auto_382578 ) ) ( not ( = ?auto_382576 ?auto_382579 ) ) ( not ( = ?auto_382576 ?auto_382580 ) ) ( not ( = ?auto_382577 ?auto_382578 ) ) ( not ( = ?auto_382577 ?auto_382579 ) ) ( not ( = ?auto_382577 ?auto_382580 ) ) ( not ( = ?auto_382578 ?auto_382579 ) ) ( not ( = ?auto_382578 ?auto_382580 ) ) ( not ( = ?auto_382579 ?auto_382580 ) ) ( ON ?auto_382578 ?auto_382579 ) ( ON ?auto_382577 ?auto_382578 ) ( ON ?auto_382576 ?auto_382577 ) ( ON ?auto_382575 ?auto_382576 ) ( CLEAR ?auto_382573 ) ( ON ?auto_382574 ?auto_382575 ) ( CLEAR ?auto_382574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_382571 ?auto_382572 ?auto_382573 ?auto_382574 )
      ( MAKE-9PILE ?auto_382571 ?auto_382572 ?auto_382573 ?auto_382574 ?auto_382575 ?auto_382576 ?auto_382577 ?auto_382578 ?auto_382579 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382590 - BLOCK
      ?auto_382591 - BLOCK
      ?auto_382592 - BLOCK
      ?auto_382593 - BLOCK
      ?auto_382594 - BLOCK
      ?auto_382595 - BLOCK
      ?auto_382596 - BLOCK
      ?auto_382597 - BLOCK
      ?auto_382598 - BLOCK
    )
    :vars
    (
      ?auto_382599 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382598 ?auto_382599 ) ( ON-TABLE ?auto_382590 ) ( ON ?auto_382591 ?auto_382590 ) ( ON ?auto_382592 ?auto_382591 ) ( not ( = ?auto_382590 ?auto_382591 ) ) ( not ( = ?auto_382590 ?auto_382592 ) ) ( not ( = ?auto_382590 ?auto_382593 ) ) ( not ( = ?auto_382590 ?auto_382594 ) ) ( not ( = ?auto_382590 ?auto_382595 ) ) ( not ( = ?auto_382590 ?auto_382596 ) ) ( not ( = ?auto_382590 ?auto_382597 ) ) ( not ( = ?auto_382590 ?auto_382598 ) ) ( not ( = ?auto_382590 ?auto_382599 ) ) ( not ( = ?auto_382591 ?auto_382592 ) ) ( not ( = ?auto_382591 ?auto_382593 ) ) ( not ( = ?auto_382591 ?auto_382594 ) ) ( not ( = ?auto_382591 ?auto_382595 ) ) ( not ( = ?auto_382591 ?auto_382596 ) ) ( not ( = ?auto_382591 ?auto_382597 ) ) ( not ( = ?auto_382591 ?auto_382598 ) ) ( not ( = ?auto_382591 ?auto_382599 ) ) ( not ( = ?auto_382592 ?auto_382593 ) ) ( not ( = ?auto_382592 ?auto_382594 ) ) ( not ( = ?auto_382592 ?auto_382595 ) ) ( not ( = ?auto_382592 ?auto_382596 ) ) ( not ( = ?auto_382592 ?auto_382597 ) ) ( not ( = ?auto_382592 ?auto_382598 ) ) ( not ( = ?auto_382592 ?auto_382599 ) ) ( not ( = ?auto_382593 ?auto_382594 ) ) ( not ( = ?auto_382593 ?auto_382595 ) ) ( not ( = ?auto_382593 ?auto_382596 ) ) ( not ( = ?auto_382593 ?auto_382597 ) ) ( not ( = ?auto_382593 ?auto_382598 ) ) ( not ( = ?auto_382593 ?auto_382599 ) ) ( not ( = ?auto_382594 ?auto_382595 ) ) ( not ( = ?auto_382594 ?auto_382596 ) ) ( not ( = ?auto_382594 ?auto_382597 ) ) ( not ( = ?auto_382594 ?auto_382598 ) ) ( not ( = ?auto_382594 ?auto_382599 ) ) ( not ( = ?auto_382595 ?auto_382596 ) ) ( not ( = ?auto_382595 ?auto_382597 ) ) ( not ( = ?auto_382595 ?auto_382598 ) ) ( not ( = ?auto_382595 ?auto_382599 ) ) ( not ( = ?auto_382596 ?auto_382597 ) ) ( not ( = ?auto_382596 ?auto_382598 ) ) ( not ( = ?auto_382596 ?auto_382599 ) ) ( not ( = ?auto_382597 ?auto_382598 ) ) ( not ( = ?auto_382597 ?auto_382599 ) ) ( not ( = ?auto_382598 ?auto_382599 ) ) ( ON ?auto_382597 ?auto_382598 ) ( ON ?auto_382596 ?auto_382597 ) ( ON ?auto_382595 ?auto_382596 ) ( ON ?auto_382594 ?auto_382595 ) ( CLEAR ?auto_382592 ) ( ON ?auto_382593 ?auto_382594 ) ( CLEAR ?auto_382593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_382590 ?auto_382591 ?auto_382592 ?auto_382593 )
      ( MAKE-9PILE ?auto_382590 ?auto_382591 ?auto_382592 ?auto_382593 ?auto_382594 ?auto_382595 ?auto_382596 ?auto_382597 ?auto_382598 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382609 - BLOCK
      ?auto_382610 - BLOCK
      ?auto_382611 - BLOCK
      ?auto_382612 - BLOCK
      ?auto_382613 - BLOCK
      ?auto_382614 - BLOCK
      ?auto_382615 - BLOCK
      ?auto_382616 - BLOCK
      ?auto_382617 - BLOCK
    )
    :vars
    (
      ?auto_382618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382617 ?auto_382618 ) ( ON-TABLE ?auto_382609 ) ( ON ?auto_382610 ?auto_382609 ) ( not ( = ?auto_382609 ?auto_382610 ) ) ( not ( = ?auto_382609 ?auto_382611 ) ) ( not ( = ?auto_382609 ?auto_382612 ) ) ( not ( = ?auto_382609 ?auto_382613 ) ) ( not ( = ?auto_382609 ?auto_382614 ) ) ( not ( = ?auto_382609 ?auto_382615 ) ) ( not ( = ?auto_382609 ?auto_382616 ) ) ( not ( = ?auto_382609 ?auto_382617 ) ) ( not ( = ?auto_382609 ?auto_382618 ) ) ( not ( = ?auto_382610 ?auto_382611 ) ) ( not ( = ?auto_382610 ?auto_382612 ) ) ( not ( = ?auto_382610 ?auto_382613 ) ) ( not ( = ?auto_382610 ?auto_382614 ) ) ( not ( = ?auto_382610 ?auto_382615 ) ) ( not ( = ?auto_382610 ?auto_382616 ) ) ( not ( = ?auto_382610 ?auto_382617 ) ) ( not ( = ?auto_382610 ?auto_382618 ) ) ( not ( = ?auto_382611 ?auto_382612 ) ) ( not ( = ?auto_382611 ?auto_382613 ) ) ( not ( = ?auto_382611 ?auto_382614 ) ) ( not ( = ?auto_382611 ?auto_382615 ) ) ( not ( = ?auto_382611 ?auto_382616 ) ) ( not ( = ?auto_382611 ?auto_382617 ) ) ( not ( = ?auto_382611 ?auto_382618 ) ) ( not ( = ?auto_382612 ?auto_382613 ) ) ( not ( = ?auto_382612 ?auto_382614 ) ) ( not ( = ?auto_382612 ?auto_382615 ) ) ( not ( = ?auto_382612 ?auto_382616 ) ) ( not ( = ?auto_382612 ?auto_382617 ) ) ( not ( = ?auto_382612 ?auto_382618 ) ) ( not ( = ?auto_382613 ?auto_382614 ) ) ( not ( = ?auto_382613 ?auto_382615 ) ) ( not ( = ?auto_382613 ?auto_382616 ) ) ( not ( = ?auto_382613 ?auto_382617 ) ) ( not ( = ?auto_382613 ?auto_382618 ) ) ( not ( = ?auto_382614 ?auto_382615 ) ) ( not ( = ?auto_382614 ?auto_382616 ) ) ( not ( = ?auto_382614 ?auto_382617 ) ) ( not ( = ?auto_382614 ?auto_382618 ) ) ( not ( = ?auto_382615 ?auto_382616 ) ) ( not ( = ?auto_382615 ?auto_382617 ) ) ( not ( = ?auto_382615 ?auto_382618 ) ) ( not ( = ?auto_382616 ?auto_382617 ) ) ( not ( = ?auto_382616 ?auto_382618 ) ) ( not ( = ?auto_382617 ?auto_382618 ) ) ( ON ?auto_382616 ?auto_382617 ) ( ON ?auto_382615 ?auto_382616 ) ( ON ?auto_382614 ?auto_382615 ) ( ON ?auto_382613 ?auto_382614 ) ( ON ?auto_382612 ?auto_382613 ) ( CLEAR ?auto_382610 ) ( ON ?auto_382611 ?auto_382612 ) ( CLEAR ?auto_382611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_382609 ?auto_382610 ?auto_382611 )
      ( MAKE-9PILE ?auto_382609 ?auto_382610 ?auto_382611 ?auto_382612 ?auto_382613 ?auto_382614 ?auto_382615 ?auto_382616 ?auto_382617 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382628 - BLOCK
      ?auto_382629 - BLOCK
      ?auto_382630 - BLOCK
      ?auto_382631 - BLOCK
      ?auto_382632 - BLOCK
      ?auto_382633 - BLOCK
      ?auto_382634 - BLOCK
      ?auto_382635 - BLOCK
      ?auto_382636 - BLOCK
    )
    :vars
    (
      ?auto_382637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382636 ?auto_382637 ) ( ON-TABLE ?auto_382628 ) ( ON ?auto_382629 ?auto_382628 ) ( not ( = ?auto_382628 ?auto_382629 ) ) ( not ( = ?auto_382628 ?auto_382630 ) ) ( not ( = ?auto_382628 ?auto_382631 ) ) ( not ( = ?auto_382628 ?auto_382632 ) ) ( not ( = ?auto_382628 ?auto_382633 ) ) ( not ( = ?auto_382628 ?auto_382634 ) ) ( not ( = ?auto_382628 ?auto_382635 ) ) ( not ( = ?auto_382628 ?auto_382636 ) ) ( not ( = ?auto_382628 ?auto_382637 ) ) ( not ( = ?auto_382629 ?auto_382630 ) ) ( not ( = ?auto_382629 ?auto_382631 ) ) ( not ( = ?auto_382629 ?auto_382632 ) ) ( not ( = ?auto_382629 ?auto_382633 ) ) ( not ( = ?auto_382629 ?auto_382634 ) ) ( not ( = ?auto_382629 ?auto_382635 ) ) ( not ( = ?auto_382629 ?auto_382636 ) ) ( not ( = ?auto_382629 ?auto_382637 ) ) ( not ( = ?auto_382630 ?auto_382631 ) ) ( not ( = ?auto_382630 ?auto_382632 ) ) ( not ( = ?auto_382630 ?auto_382633 ) ) ( not ( = ?auto_382630 ?auto_382634 ) ) ( not ( = ?auto_382630 ?auto_382635 ) ) ( not ( = ?auto_382630 ?auto_382636 ) ) ( not ( = ?auto_382630 ?auto_382637 ) ) ( not ( = ?auto_382631 ?auto_382632 ) ) ( not ( = ?auto_382631 ?auto_382633 ) ) ( not ( = ?auto_382631 ?auto_382634 ) ) ( not ( = ?auto_382631 ?auto_382635 ) ) ( not ( = ?auto_382631 ?auto_382636 ) ) ( not ( = ?auto_382631 ?auto_382637 ) ) ( not ( = ?auto_382632 ?auto_382633 ) ) ( not ( = ?auto_382632 ?auto_382634 ) ) ( not ( = ?auto_382632 ?auto_382635 ) ) ( not ( = ?auto_382632 ?auto_382636 ) ) ( not ( = ?auto_382632 ?auto_382637 ) ) ( not ( = ?auto_382633 ?auto_382634 ) ) ( not ( = ?auto_382633 ?auto_382635 ) ) ( not ( = ?auto_382633 ?auto_382636 ) ) ( not ( = ?auto_382633 ?auto_382637 ) ) ( not ( = ?auto_382634 ?auto_382635 ) ) ( not ( = ?auto_382634 ?auto_382636 ) ) ( not ( = ?auto_382634 ?auto_382637 ) ) ( not ( = ?auto_382635 ?auto_382636 ) ) ( not ( = ?auto_382635 ?auto_382637 ) ) ( not ( = ?auto_382636 ?auto_382637 ) ) ( ON ?auto_382635 ?auto_382636 ) ( ON ?auto_382634 ?auto_382635 ) ( ON ?auto_382633 ?auto_382634 ) ( ON ?auto_382632 ?auto_382633 ) ( ON ?auto_382631 ?auto_382632 ) ( CLEAR ?auto_382629 ) ( ON ?auto_382630 ?auto_382631 ) ( CLEAR ?auto_382630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_382628 ?auto_382629 ?auto_382630 )
      ( MAKE-9PILE ?auto_382628 ?auto_382629 ?auto_382630 ?auto_382631 ?auto_382632 ?auto_382633 ?auto_382634 ?auto_382635 ?auto_382636 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382647 - BLOCK
      ?auto_382648 - BLOCK
      ?auto_382649 - BLOCK
      ?auto_382650 - BLOCK
      ?auto_382651 - BLOCK
      ?auto_382652 - BLOCK
      ?auto_382653 - BLOCK
      ?auto_382654 - BLOCK
      ?auto_382655 - BLOCK
    )
    :vars
    (
      ?auto_382656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382655 ?auto_382656 ) ( ON-TABLE ?auto_382647 ) ( not ( = ?auto_382647 ?auto_382648 ) ) ( not ( = ?auto_382647 ?auto_382649 ) ) ( not ( = ?auto_382647 ?auto_382650 ) ) ( not ( = ?auto_382647 ?auto_382651 ) ) ( not ( = ?auto_382647 ?auto_382652 ) ) ( not ( = ?auto_382647 ?auto_382653 ) ) ( not ( = ?auto_382647 ?auto_382654 ) ) ( not ( = ?auto_382647 ?auto_382655 ) ) ( not ( = ?auto_382647 ?auto_382656 ) ) ( not ( = ?auto_382648 ?auto_382649 ) ) ( not ( = ?auto_382648 ?auto_382650 ) ) ( not ( = ?auto_382648 ?auto_382651 ) ) ( not ( = ?auto_382648 ?auto_382652 ) ) ( not ( = ?auto_382648 ?auto_382653 ) ) ( not ( = ?auto_382648 ?auto_382654 ) ) ( not ( = ?auto_382648 ?auto_382655 ) ) ( not ( = ?auto_382648 ?auto_382656 ) ) ( not ( = ?auto_382649 ?auto_382650 ) ) ( not ( = ?auto_382649 ?auto_382651 ) ) ( not ( = ?auto_382649 ?auto_382652 ) ) ( not ( = ?auto_382649 ?auto_382653 ) ) ( not ( = ?auto_382649 ?auto_382654 ) ) ( not ( = ?auto_382649 ?auto_382655 ) ) ( not ( = ?auto_382649 ?auto_382656 ) ) ( not ( = ?auto_382650 ?auto_382651 ) ) ( not ( = ?auto_382650 ?auto_382652 ) ) ( not ( = ?auto_382650 ?auto_382653 ) ) ( not ( = ?auto_382650 ?auto_382654 ) ) ( not ( = ?auto_382650 ?auto_382655 ) ) ( not ( = ?auto_382650 ?auto_382656 ) ) ( not ( = ?auto_382651 ?auto_382652 ) ) ( not ( = ?auto_382651 ?auto_382653 ) ) ( not ( = ?auto_382651 ?auto_382654 ) ) ( not ( = ?auto_382651 ?auto_382655 ) ) ( not ( = ?auto_382651 ?auto_382656 ) ) ( not ( = ?auto_382652 ?auto_382653 ) ) ( not ( = ?auto_382652 ?auto_382654 ) ) ( not ( = ?auto_382652 ?auto_382655 ) ) ( not ( = ?auto_382652 ?auto_382656 ) ) ( not ( = ?auto_382653 ?auto_382654 ) ) ( not ( = ?auto_382653 ?auto_382655 ) ) ( not ( = ?auto_382653 ?auto_382656 ) ) ( not ( = ?auto_382654 ?auto_382655 ) ) ( not ( = ?auto_382654 ?auto_382656 ) ) ( not ( = ?auto_382655 ?auto_382656 ) ) ( ON ?auto_382654 ?auto_382655 ) ( ON ?auto_382653 ?auto_382654 ) ( ON ?auto_382652 ?auto_382653 ) ( ON ?auto_382651 ?auto_382652 ) ( ON ?auto_382650 ?auto_382651 ) ( ON ?auto_382649 ?auto_382650 ) ( CLEAR ?auto_382647 ) ( ON ?auto_382648 ?auto_382649 ) ( CLEAR ?auto_382648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_382647 ?auto_382648 )
      ( MAKE-9PILE ?auto_382647 ?auto_382648 ?auto_382649 ?auto_382650 ?auto_382651 ?auto_382652 ?auto_382653 ?auto_382654 ?auto_382655 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382666 - BLOCK
      ?auto_382667 - BLOCK
      ?auto_382668 - BLOCK
      ?auto_382669 - BLOCK
      ?auto_382670 - BLOCK
      ?auto_382671 - BLOCK
      ?auto_382672 - BLOCK
      ?auto_382673 - BLOCK
      ?auto_382674 - BLOCK
    )
    :vars
    (
      ?auto_382675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382674 ?auto_382675 ) ( ON-TABLE ?auto_382666 ) ( not ( = ?auto_382666 ?auto_382667 ) ) ( not ( = ?auto_382666 ?auto_382668 ) ) ( not ( = ?auto_382666 ?auto_382669 ) ) ( not ( = ?auto_382666 ?auto_382670 ) ) ( not ( = ?auto_382666 ?auto_382671 ) ) ( not ( = ?auto_382666 ?auto_382672 ) ) ( not ( = ?auto_382666 ?auto_382673 ) ) ( not ( = ?auto_382666 ?auto_382674 ) ) ( not ( = ?auto_382666 ?auto_382675 ) ) ( not ( = ?auto_382667 ?auto_382668 ) ) ( not ( = ?auto_382667 ?auto_382669 ) ) ( not ( = ?auto_382667 ?auto_382670 ) ) ( not ( = ?auto_382667 ?auto_382671 ) ) ( not ( = ?auto_382667 ?auto_382672 ) ) ( not ( = ?auto_382667 ?auto_382673 ) ) ( not ( = ?auto_382667 ?auto_382674 ) ) ( not ( = ?auto_382667 ?auto_382675 ) ) ( not ( = ?auto_382668 ?auto_382669 ) ) ( not ( = ?auto_382668 ?auto_382670 ) ) ( not ( = ?auto_382668 ?auto_382671 ) ) ( not ( = ?auto_382668 ?auto_382672 ) ) ( not ( = ?auto_382668 ?auto_382673 ) ) ( not ( = ?auto_382668 ?auto_382674 ) ) ( not ( = ?auto_382668 ?auto_382675 ) ) ( not ( = ?auto_382669 ?auto_382670 ) ) ( not ( = ?auto_382669 ?auto_382671 ) ) ( not ( = ?auto_382669 ?auto_382672 ) ) ( not ( = ?auto_382669 ?auto_382673 ) ) ( not ( = ?auto_382669 ?auto_382674 ) ) ( not ( = ?auto_382669 ?auto_382675 ) ) ( not ( = ?auto_382670 ?auto_382671 ) ) ( not ( = ?auto_382670 ?auto_382672 ) ) ( not ( = ?auto_382670 ?auto_382673 ) ) ( not ( = ?auto_382670 ?auto_382674 ) ) ( not ( = ?auto_382670 ?auto_382675 ) ) ( not ( = ?auto_382671 ?auto_382672 ) ) ( not ( = ?auto_382671 ?auto_382673 ) ) ( not ( = ?auto_382671 ?auto_382674 ) ) ( not ( = ?auto_382671 ?auto_382675 ) ) ( not ( = ?auto_382672 ?auto_382673 ) ) ( not ( = ?auto_382672 ?auto_382674 ) ) ( not ( = ?auto_382672 ?auto_382675 ) ) ( not ( = ?auto_382673 ?auto_382674 ) ) ( not ( = ?auto_382673 ?auto_382675 ) ) ( not ( = ?auto_382674 ?auto_382675 ) ) ( ON ?auto_382673 ?auto_382674 ) ( ON ?auto_382672 ?auto_382673 ) ( ON ?auto_382671 ?auto_382672 ) ( ON ?auto_382670 ?auto_382671 ) ( ON ?auto_382669 ?auto_382670 ) ( ON ?auto_382668 ?auto_382669 ) ( CLEAR ?auto_382666 ) ( ON ?auto_382667 ?auto_382668 ) ( CLEAR ?auto_382667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_382666 ?auto_382667 )
      ( MAKE-9PILE ?auto_382666 ?auto_382667 ?auto_382668 ?auto_382669 ?auto_382670 ?auto_382671 ?auto_382672 ?auto_382673 ?auto_382674 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382685 - BLOCK
      ?auto_382686 - BLOCK
      ?auto_382687 - BLOCK
      ?auto_382688 - BLOCK
      ?auto_382689 - BLOCK
      ?auto_382690 - BLOCK
      ?auto_382691 - BLOCK
      ?auto_382692 - BLOCK
      ?auto_382693 - BLOCK
    )
    :vars
    (
      ?auto_382694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382693 ?auto_382694 ) ( not ( = ?auto_382685 ?auto_382686 ) ) ( not ( = ?auto_382685 ?auto_382687 ) ) ( not ( = ?auto_382685 ?auto_382688 ) ) ( not ( = ?auto_382685 ?auto_382689 ) ) ( not ( = ?auto_382685 ?auto_382690 ) ) ( not ( = ?auto_382685 ?auto_382691 ) ) ( not ( = ?auto_382685 ?auto_382692 ) ) ( not ( = ?auto_382685 ?auto_382693 ) ) ( not ( = ?auto_382685 ?auto_382694 ) ) ( not ( = ?auto_382686 ?auto_382687 ) ) ( not ( = ?auto_382686 ?auto_382688 ) ) ( not ( = ?auto_382686 ?auto_382689 ) ) ( not ( = ?auto_382686 ?auto_382690 ) ) ( not ( = ?auto_382686 ?auto_382691 ) ) ( not ( = ?auto_382686 ?auto_382692 ) ) ( not ( = ?auto_382686 ?auto_382693 ) ) ( not ( = ?auto_382686 ?auto_382694 ) ) ( not ( = ?auto_382687 ?auto_382688 ) ) ( not ( = ?auto_382687 ?auto_382689 ) ) ( not ( = ?auto_382687 ?auto_382690 ) ) ( not ( = ?auto_382687 ?auto_382691 ) ) ( not ( = ?auto_382687 ?auto_382692 ) ) ( not ( = ?auto_382687 ?auto_382693 ) ) ( not ( = ?auto_382687 ?auto_382694 ) ) ( not ( = ?auto_382688 ?auto_382689 ) ) ( not ( = ?auto_382688 ?auto_382690 ) ) ( not ( = ?auto_382688 ?auto_382691 ) ) ( not ( = ?auto_382688 ?auto_382692 ) ) ( not ( = ?auto_382688 ?auto_382693 ) ) ( not ( = ?auto_382688 ?auto_382694 ) ) ( not ( = ?auto_382689 ?auto_382690 ) ) ( not ( = ?auto_382689 ?auto_382691 ) ) ( not ( = ?auto_382689 ?auto_382692 ) ) ( not ( = ?auto_382689 ?auto_382693 ) ) ( not ( = ?auto_382689 ?auto_382694 ) ) ( not ( = ?auto_382690 ?auto_382691 ) ) ( not ( = ?auto_382690 ?auto_382692 ) ) ( not ( = ?auto_382690 ?auto_382693 ) ) ( not ( = ?auto_382690 ?auto_382694 ) ) ( not ( = ?auto_382691 ?auto_382692 ) ) ( not ( = ?auto_382691 ?auto_382693 ) ) ( not ( = ?auto_382691 ?auto_382694 ) ) ( not ( = ?auto_382692 ?auto_382693 ) ) ( not ( = ?auto_382692 ?auto_382694 ) ) ( not ( = ?auto_382693 ?auto_382694 ) ) ( ON ?auto_382692 ?auto_382693 ) ( ON ?auto_382691 ?auto_382692 ) ( ON ?auto_382690 ?auto_382691 ) ( ON ?auto_382689 ?auto_382690 ) ( ON ?auto_382688 ?auto_382689 ) ( ON ?auto_382687 ?auto_382688 ) ( ON ?auto_382686 ?auto_382687 ) ( ON ?auto_382685 ?auto_382686 ) ( CLEAR ?auto_382685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_382685 )
      ( MAKE-9PILE ?auto_382685 ?auto_382686 ?auto_382687 ?auto_382688 ?auto_382689 ?auto_382690 ?auto_382691 ?auto_382692 ?auto_382693 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_382704 - BLOCK
      ?auto_382705 - BLOCK
      ?auto_382706 - BLOCK
      ?auto_382707 - BLOCK
      ?auto_382708 - BLOCK
      ?auto_382709 - BLOCK
      ?auto_382710 - BLOCK
      ?auto_382711 - BLOCK
      ?auto_382712 - BLOCK
    )
    :vars
    (
      ?auto_382713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382712 ?auto_382713 ) ( not ( = ?auto_382704 ?auto_382705 ) ) ( not ( = ?auto_382704 ?auto_382706 ) ) ( not ( = ?auto_382704 ?auto_382707 ) ) ( not ( = ?auto_382704 ?auto_382708 ) ) ( not ( = ?auto_382704 ?auto_382709 ) ) ( not ( = ?auto_382704 ?auto_382710 ) ) ( not ( = ?auto_382704 ?auto_382711 ) ) ( not ( = ?auto_382704 ?auto_382712 ) ) ( not ( = ?auto_382704 ?auto_382713 ) ) ( not ( = ?auto_382705 ?auto_382706 ) ) ( not ( = ?auto_382705 ?auto_382707 ) ) ( not ( = ?auto_382705 ?auto_382708 ) ) ( not ( = ?auto_382705 ?auto_382709 ) ) ( not ( = ?auto_382705 ?auto_382710 ) ) ( not ( = ?auto_382705 ?auto_382711 ) ) ( not ( = ?auto_382705 ?auto_382712 ) ) ( not ( = ?auto_382705 ?auto_382713 ) ) ( not ( = ?auto_382706 ?auto_382707 ) ) ( not ( = ?auto_382706 ?auto_382708 ) ) ( not ( = ?auto_382706 ?auto_382709 ) ) ( not ( = ?auto_382706 ?auto_382710 ) ) ( not ( = ?auto_382706 ?auto_382711 ) ) ( not ( = ?auto_382706 ?auto_382712 ) ) ( not ( = ?auto_382706 ?auto_382713 ) ) ( not ( = ?auto_382707 ?auto_382708 ) ) ( not ( = ?auto_382707 ?auto_382709 ) ) ( not ( = ?auto_382707 ?auto_382710 ) ) ( not ( = ?auto_382707 ?auto_382711 ) ) ( not ( = ?auto_382707 ?auto_382712 ) ) ( not ( = ?auto_382707 ?auto_382713 ) ) ( not ( = ?auto_382708 ?auto_382709 ) ) ( not ( = ?auto_382708 ?auto_382710 ) ) ( not ( = ?auto_382708 ?auto_382711 ) ) ( not ( = ?auto_382708 ?auto_382712 ) ) ( not ( = ?auto_382708 ?auto_382713 ) ) ( not ( = ?auto_382709 ?auto_382710 ) ) ( not ( = ?auto_382709 ?auto_382711 ) ) ( not ( = ?auto_382709 ?auto_382712 ) ) ( not ( = ?auto_382709 ?auto_382713 ) ) ( not ( = ?auto_382710 ?auto_382711 ) ) ( not ( = ?auto_382710 ?auto_382712 ) ) ( not ( = ?auto_382710 ?auto_382713 ) ) ( not ( = ?auto_382711 ?auto_382712 ) ) ( not ( = ?auto_382711 ?auto_382713 ) ) ( not ( = ?auto_382712 ?auto_382713 ) ) ( ON ?auto_382711 ?auto_382712 ) ( ON ?auto_382710 ?auto_382711 ) ( ON ?auto_382709 ?auto_382710 ) ( ON ?auto_382708 ?auto_382709 ) ( ON ?auto_382707 ?auto_382708 ) ( ON ?auto_382706 ?auto_382707 ) ( ON ?auto_382705 ?auto_382706 ) ( ON ?auto_382704 ?auto_382705 ) ( CLEAR ?auto_382704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_382704 )
      ( MAKE-9PILE ?auto_382704 ?auto_382705 ?auto_382706 ?auto_382707 ?auto_382708 ?auto_382709 ?auto_382710 ?auto_382711 ?auto_382712 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382724 - BLOCK
      ?auto_382725 - BLOCK
      ?auto_382726 - BLOCK
      ?auto_382727 - BLOCK
      ?auto_382728 - BLOCK
      ?auto_382729 - BLOCK
      ?auto_382730 - BLOCK
      ?auto_382731 - BLOCK
      ?auto_382732 - BLOCK
      ?auto_382733 - BLOCK
    )
    :vars
    (
      ?auto_382734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_382732 ) ( ON ?auto_382733 ?auto_382734 ) ( CLEAR ?auto_382733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_382724 ) ( ON ?auto_382725 ?auto_382724 ) ( ON ?auto_382726 ?auto_382725 ) ( ON ?auto_382727 ?auto_382726 ) ( ON ?auto_382728 ?auto_382727 ) ( ON ?auto_382729 ?auto_382728 ) ( ON ?auto_382730 ?auto_382729 ) ( ON ?auto_382731 ?auto_382730 ) ( ON ?auto_382732 ?auto_382731 ) ( not ( = ?auto_382724 ?auto_382725 ) ) ( not ( = ?auto_382724 ?auto_382726 ) ) ( not ( = ?auto_382724 ?auto_382727 ) ) ( not ( = ?auto_382724 ?auto_382728 ) ) ( not ( = ?auto_382724 ?auto_382729 ) ) ( not ( = ?auto_382724 ?auto_382730 ) ) ( not ( = ?auto_382724 ?auto_382731 ) ) ( not ( = ?auto_382724 ?auto_382732 ) ) ( not ( = ?auto_382724 ?auto_382733 ) ) ( not ( = ?auto_382724 ?auto_382734 ) ) ( not ( = ?auto_382725 ?auto_382726 ) ) ( not ( = ?auto_382725 ?auto_382727 ) ) ( not ( = ?auto_382725 ?auto_382728 ) ) ( not ( = ?auto_382725 ?auto_382729 ) ) ( not ( = ?auto_382725 ?auto_382730 ) ) ( not ( = ?auto_382725 ?auto_382731 ) ) ( not ( = ?auto_382725 ?auto_382732 ) ) ( not ( = ?auto_382725 ?auto_382733 ) ) ( not ( = ?auto_382725 ?auto_382734 ) ) ( not ( = ?auto_382726 ?auto_382727 ) ) ( not ( = ?auto_382726 ?auto_382728 ) ) ( not ( = ?auto_382726 ?auto_382729 ) ) ( not ( = ?auto_382726 ?auto_382730 ) ) ( not ( = ?auto_382726 ?auto_382731 ) ) ( not ( = ?auto_382726 ?auto_382732 ) ) ( not ( = ?auto_382726 ?auto_382733 ) ) ( not ( = ?auto_382726 ?auto_382734 ) ) ( not ( = ?auto_382727 ?auto_382728 ) ) ( not ( = ?auto_382727 ?auto_382729 ) ) ( not ( = ?auto_382727 ?auto_382730 ) ) ( not ( = ?auto_382727 ?auto_382731 ) ) ( not ( = ?auto_382727 ?auto_382732 ) ) ( not ( = ?auto_382727 ?auto_382733 ) ) ( not ( = ?auto_382727 ?auto_382734 ) ) ( not ( = ?auto_382728 ?auto_382729 ) ) ( not ( = ?auto_382728 ?auto_382730 ) ) ( not ( = ?auto_382728 ?auto_382731 ) ) ( not ( = ?auto_382728 ?auto_382732 ) ) ( not ( = ?auto_382728 ?auto_382733 ) ) ( not ( = ?auto_382728 ?auto_382734 ) ) ( not ( = ?auto_382729 ?auto_382730 ) ) ( not ( = ?auto_382729 ?auto_382731 ) ) ( not ( = ?auto_382729 ?auto_382732 ) ) ( not ( = ?auto_382729 ?auto_382733 ) ) ( not ( = ?auto_382729 ?auto_382734 ) ) ( not ( = ?auto_382730 ?auto_382731 ) ) ( not ( = ?auto_382730 ?auto_382732 ) ) ( not ( = ?auto_382730 ?auto_382733 ) ) ( not ( = ?auto_382730 ?auto_382734 ) ) ( not ( = ?auto_382731 ?auto_382732 ) ) ( not ( = ?auto_382731 ?auto_382733 ) ) ( not ( = ?auto_382731 ?auto_382734 ) ) ( not ( = ?auto_382732 ?auto_382733 ) ) ( not ( = ?auto_382732 ?auto_382734 ) ) ( not ( = ?auto_382733 ?auto_382734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_382733 ?auto_382734 )
      ( !STACK ?auto_382733 ?auto_382732 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382745 - BLOCK
      ?auto_382746 - BLOCK
      ?auto_382747 - BLOCK
      ?auto_382748 - BLOCK
      ?auto_382749 - BLOCK
      ?auto_382750 - BLOCK
      ?auto_382751 - BLOCK
      ?auto_382752 - BLOCK
      ?auto_382753 - BLOCK
      ?auto_382754 - BLOCK
    )
    :vars
    (
      ?auto_382755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_382753 ) ( ON ?auto_382754 ?auto_382755 ) ( CLEAR ?auto_382754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_382745 ) ( ON ?auto_382746 ?auto_382745 ) ( ON ?auto_382747 ?auto_382746 ) ( ON ?auto_382748 ?auto_382747 ) ( ON ?auto_382749 ?auto_382748 ) ( ON ?auto_382750 ?auto_382749 ) ( ON ?auto_382751 ?auto_382750 ) ( ON ?auto_382752 ?auto_382751 ) ( ON ?auto_382753 ?auto_382752 ) ( not ( = ?auto_382745 ?auto_382746 ) ) ( not ( = ?auto_382745 ?auto_382747 ) ) ( not ( = ?auto_382745 ?auto_382748 ) ) ( not ( = ?auto_382745 ?auto_382749 ) ) ( not ( = ?auto_382745 ?auto_382750 ) ) ( not ( = ?auto_382745 ?auto_382751 ) ) ( not ( = ?auto_382745 ?auto_382752 ) ) ( not ( = ?auto_382745 ?auto_382753 ) ) ( not ( = ?auto_382745 ?auto_382754 ) ) ( not ( = ?auto_382745 ?auto_382755 ) ) ( not ( = ?auto_382746 ?auto_382747 ) ) ( not ( = ?auto_382746 ?auto_382748 ) ) ( not ( = ?auto_382746 ?auto_382749 ) ) ( not ( = ?auto_382746 ?auto_382750 ) ) ( not ( = ?auto_382746 ?auto_382751 ) ) ( not ( = ?auto_382746 ?auto_382752 ) ) ( not ( = ?auto_382746 ?auto_382753 ) ) ( not ( = ?auto_382746 ?auto_382754 ) ) ( not ( = ?auto_382746 ?auto_382755 ) ) ( not ( = ?auto_382747 ?auto_382748 ) ) ( not ( = ?auto_382747 ?auto_382749 ) ) ( not ( = ?auto_382747 ?auto_382750 ) ) ( not ( = ?auto_382747 ?auto_382751 ) ) ( not ( = ?auto_382747 ?auto_382752 ) ) ( not ( = ?auto_382747 ?auto_382753 ) ) ( not ( = ?auto_382747 ?auto_382754 ) ) ( not ( = ?auto_382747 ?auto_382755 ) ) ( not ( = ?auto_382748 ?auto_382749 ) ) ( not ( = ?auto_382748 ?auto_382750 ) ) ( not ( = ?auto_382748 ?auto_382751 ) ) ( not ( = ?auto_382748 ?auto_382752 ) ) ( not ( = ?auto_382748 ?auto_382753 ) ) ( not ( = ?auto_382748 ?auto_382754 ) ) ( not ( = ?auto_382748 ?auto_382755 ) ) ( not ( = ?auto_382749 ?auto_382750 ) ) ( not ( = ?auto_382749 ?auto_382751 ) ) ( not ( = ?auto_382749 ?auto_382752 ) ) ( not ( = ?auto_382749 ?auto_382753 ) ) ( not ( = ?auto_382749 ?auto_382754 ) ) ( not ( = ?auto_382749 ?auto_382755 ) ) ( not ( = ?auto_382750 ?auto_382751 ) ) ( not ( = ?auto_382750 ?auto_382752 ) ) ( not ( = ?auto_382750 ?auto_382753 ) ) ( not ( = ?auto_382750 ?auto_382754 ) ) ( not ( = ?auto_382750 ?auto_382755 ) ) ( not ( = ?auto_382751 ?auto_382752 ) ) ( not ( = ?auto_382751 ?auto_382753 ) ) ( not ( = ?auto_382751 ?auto_382754 ) ) ( not ( = ?auto_382751 ?auto_382755 ) ) ( not ( = ?auto_382752 ?auto_382753 ) ) ( not ( = ?auto_382752 ?auto_382754 ) ) ( not ( = ?auto_382752 ?auto_382755 ) ) ( not ( = ?auto_382753 ?auto_382754 ) ) ( not ( = ?auto_382753 ?auto_382755 ) ) ( not ( = ?auto_382754 ?auto_382755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_382754 ?auto_382755 )
      ( !STACK ?auto_382754 ?auto_382753 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382766 - BLOCK
      ?auto_382767 - BLOCK
      ?auto_382768 - BLOCK
      ?auto_382769 - BLOCK
      ?auto_382770 - BLOCK
      ?auto_382771 - BLOCK
      ?auto_382772 - BLOCK
      ?auto_382773 - BLOCK
      ?auto_382774 - BLOCK
      ?auto_382775 - BLOCK
    )
    :vars
    (
      ?auto_382776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382775 ?auto_382776 ) ( ON-TABLE ?auto_382766 ) ( ON ?auto_382767 ?auto_382766 ) ( ON ?auto_382768 ?auto_382767 ) ( ON ?auto_382769 ?auto_382768 ) ( ON ?auto_382770 ?auto_382769 ) ( ON ?auto_382771 ?auto_382770 ) ( ON ?auto_382772 ?auto_382771 ) ( ON ?auto_382773 ?auto_382772 ) ( not ( = ?auto_382766 ?auto_382767 ) ) ( not ( = ?auto_382766 ?auto_382768 ) ) ( not ( = ?auto_382766 ?auto_382769 ) ) ( not ( = ?auto_382766 ?auto_382770 ) ) ( not ( = ?auto_382766 ?auto_382771 ) ) ( not ( = ?auto_382766 ?auto_382772 ) ) ( not ( = ?auto_382766 ?auto_382773 ) ) ( not ( = ?auto_382766 ?auto_382774 ) ) ( not ( = ?auto_382766 ?auto_382775 ) ) ( not ( = ?auto_382766 ?auto_382776 ) ) ( not ( = ?auto_382767 ?auto_382768 ) ) ( not ( = ?auto_382767 ?auto_382769 ) ) ( not ( = ?auto_382767 ?auto_382770 ) ) ( not ( = ?auto_382767 ?auto_382771 ) ) ( not ( = ?auto_382767 ?auto_382772 ) ) ( not ( = ?auto_382767 ?auto_382773 ) ) ( not ( = ?auto_382767 ?auto_382774 ) ) ( not ( = ?auto_382767 ?auto_382775 ) ) ( not ( = ?auto_382767 ?auto_382776 ) ) ( not ( = ?auto_382768 ?auto_382769 ) ) ( not ( = ?auto_382768 ?auto_382770 ) ) ( not ( = ?auto_382768 ?auto_382771 ) ) ( not ( = ?auto_382768 ?auto_382772 ) ) ( not ( = ?auto_382768 ?auto_382773 ) ) ( not ( = ?auto_382768 ?auto_382774 ) ) ( not ( = ?auto_382768 ?auto_382775 ) ) ( not ( = ?auto_382768 ?auto_382776 ) ) ( not ( = ?auto_382769 ?auto_382770 ) ) ( not ( = ?auto_382769 ?auto_382771 ) ) ( not ( = ?auto_382769 ?auto_382772 ) ) ( not ( = ?auto_382769 ?auto_382773 ) ) ( not ( = ?auto_382769 ?auto_382774 ) ) ( not ( = ?auto_382769 ?auto_382775 ) ) ( not ( = ?auto_382769 ?auto_382776 ) ) ( not ( = ?auto_382770 ?auto_382771 ) ) ( not ( = ?auto_382770 ?auto_382772 ) ) ( not ( = ?auto_382770 ?auto_382773 ) ) ( not ( = ?auto_382770 ?auto_382774 ) ) ( not ( = ?auto_382770 ?auto_382775 ) ) ( not ( = ?auto_382770 ?auto_382776 ) ) ( not ( = ?auto_382771 ?auto_382772 ) ) ( not ( = ?auto_382771 ?auto_382773 ) ) ( not ( = ?auto_382771 ?auto_382774 ) ) ( not ( = ?auto_382771 ?auto_382775 ) ) ( not ( = ?auto_382771 ?auto_382776 ) ) ( not ( = ?auto_382772 ?auto_382773 ) ) ( not ( = ?auto_382772 ?auto_382774 ) ) ( not ( = ?auto_382772 ?auto_382775 ) ) ( not ( = ?auto_382772 ?auto_382776 ) ) ( not ( = ?auto_382773 ?auto_382774 ) ) ( not ( = ?auto_382773 ?auto_382775 ) ) ( not ( = ?auto_382773 ?auto_382776 ) ) ( not ( = ?auto_382774 ?auto_382775 ) ) ( not ( = ?auto_382774 ?auto_382776 ) ) ( not ( = ?auto_382775 ?auto_382776 ) ) ( CLEAR ?auto_382773 ) ( ON ?auto_382774 ?auto_382775 ) ( CLEAR ?auto_382774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_382766 ?auto_382767 ?auto_382768 ?auto_382769 ?auto_382770 ?auto_382771 ?auto_382772 ?auto_382773 ?auto_382774 )
      ( MAKE-10PILE ?auto_382766 ?auto_382767 ?auto_382768 ?auto_382769 ?auto_382770 ?auto_382771 ?auto_382772 ?auto_382773 ?auto_382774 ?auto_382775 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382787 - BLOCK
      ?auto_382788 - BLOCK
      ?auto_382789 - BLOCK
      ?auto_382790 - BLOCK
      ?auto_382791 - BLOCK
      ?auto_382792 - BLOCK
      ?auto_382793 - BLOCK
      ?auto_382794 - BLOCK
      ?auto_382795 - BLOCK
      ?auto_382796 - BLOCK
    )
    :vars
    (
      ?auto_382797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382796 ?auto_382797 ) ( ON-TABLE ?auto_382787 ) ( ON ?auto_382788 ?auto_382787 ) ( ON ?auto_382789 ?auto_382788 ) ( ON ?auto_382790 ?auto_382789 ) ( ON ?auto_382791 ?auto_382790 ) ( ON ?auto_382792 ?auto_382791 ) ( ON ?auto_382793 ?auto_382792 ) ( ON ?auto_382794 ?auto_382793 ) ( not ( = ?auto_382787 ?auto_382788 ) ) ( not ( = ?auto_382787 ?auto_382789 ) ) ( not ( = ?auto_382787 ?auto_382790 ) ) ( not ( = ?auto_382787 ?auto_382791 ) ) ( not ( = ?auto_382787 ?auto_382792 ) ) ( not ( = ?auto_382787 ?auto_382793 ) ) ( not ( = ?auto_382787 ?auto_382794 ) ) ( not ( = ?auto_382787 ?auto_382795 ) ) ( not ( = ?auto_382787 ?auto_382796 ) ) ( not ( = ?auto_382787 ?auto_382797 ) ) ( not ( = ?auto_382788 ?auto_382789 ) ) ( not ( = ?auto_382788 ?auto_382790 ) ) ( not ( = ?auto_382788 ?auto_382791 ) ) ( not ( = ?auto_382788 ?auto_382792 ) ) ( not ( = ?auto_382788 ?auto_382793 ) ) ( not ( = ?auto_382788 ?auto_382794 ) ) ( not ( = ?auto_382788 ?auto_382795 ) ) ( not ( = ?auto_382788 ?auto_382796 ) ) ( not ( = ?auto_382788 ?auto_382797 ) ) ( not ( = ?auto_382789 ?auto_382790 ) ) ( not ( = ?auto_382789 ?auto_382791 ) ) ( not ( = ?auto_382789 ?auto_382792 ) ) ( not ( = ?auto_382789 ?auto_382793 ) ) ( not ( = ?auto_382789 ?auto_382794 ) ) ( not ( = ?auto_382789 ?auto_382795 ) ) ( not ( = ?auto_382789 ?auto_382796 ) ) ( not ( = ?auto_382789 ?auto_382797 ) ) ( not ( = ?auto_382790 ?auto_382791 ) ) ( not ( = ?auto_382790 ?auto_382792 ) ) ( not ( = ?auto_382790 ?auto_382793 ) ) ( not ( = ?auto_382790 ?auto_382794 ) ) ( not ( = ?auto_382790 ?auto_382795 ) ) ( not ( = ?auto_382790 ?auto_382796 ) ) ( not ( = ?auto_382790 ?auto_382797 ) ) ( not ( = ?auto_382791 ?auto_382792 ) ) ( not ( = ?auto_382791 ?auto_382793 ) ) ( not ( = ?auto_382791 ?auto_382794 ) ) ( not ( = ?auto_382791 ?auto_382795 ) ) ( not ( = ?auto_382791 ?auto_382796 ) ) ( not ( = ?auto_382791 ?auto_382797 ) ) ( not ( = ?auto_382792 ?auto_382793 ) ) ( not ( = ?auto_382792 ?auto_382794 ) ) ( not ( = ?auto_382792 ?auto_382795 ) ) ( not ( = ?auto_382792 ?auto_382796 ) ) ( not ( = ?auto_382792 ?auto_382797 ) ) ( not ( = ?auto_382793 ?auto_382794 ) ) ( not ( = ?auto_382793 ?auto_382795 ) ) ( not ( = ?auto_382793 ?auto_382796 ) ) ( not ( = ?auto_382793 ?auto_382797 ) ) ( not ( = ?auto_382794 ?auto_382795 ) ) ( not ( = ?auto_382794 ?auto_382796 ) ) ( not ( = ?auto_382794 ?auto_382797 ) ) ( not ( = ?auto_382795 ?auto_382796 ) ) ( not ( = ?auto_382795 ?auto_382797 ) ) ( not ( = ?auto_382796 ?auto_382797 ) ) ( CLEAR ?auto_382794 ) ( ON ?auto_382795 ?auto_382796 ) ( CLEAR ?auto_382795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_382787 ?auto_382788 ?auto_382789 ?auto_382790 ?auto_382791 ?auto_382792 ?auto_382793 ?auto_382794 ?auto_382795 )
      ( MAKE-10PILE ?auto_382787 ?auto_382788 ?auto_382789 ?auto_382790 ?auto_382791 ?auto_382792 ?auto_382793 ?auto_382794 ?auto_382795 ?auto_382796 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382808 - BLOCK
      ?auto_382809 - BLOCK
      ?auto_382810 - BLOCK
      ?auto_382811 - BLOCK
      ?auto_382812 - BLOCK
      ?auto_382813 - BLOCK
      ?auto_382814 - BLOCK
      ?auto_382815 - BLOCK
      ?auto_382816 - BLOCK
      ?auto_382817 - BLOCK
    )
    :vars
    (
      ?auto_382818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382817 ?auto_382818 ) ( ON-TABLE ?auto_382808 ) ( ON ?auto_382809 ?auto_382808 ) ( ON ?auto_382810 ?auto_382809 ) ( ON ?auto_382811 ?auto_382810 ) ( ON ?auto_382812 ?auto_382811 ) ( ON ?auto_382813 ?auto_382812 ) ( ON ?auto_382814 ?auto_382813 ) ( not ( = ?auto_382808 ?auto_382809 ) ) ( not ( = ?auto_382808 ?auto_382810 ) ) ( not ( = ?auto_382808 ?auto_382811 ) ) ( not ( = ?auto_382808 ?auto_382812 ) ) ( not ( = ?auto_382808 ?auto_382813 ) ) ( not ( = ?auto_382808 ?auto_382814 ) ) ( not ( = ?auto_382808 ?auto_382815 ) ) ( not ( = ?auto_382808 ?auto_382816 ) ) ( not ( = ?auto_382808 ?auto_382817 ) ) ( not ( = ?auto_382808 ?auto_382818 ) ) ( not ( = ?auto_382809 ?auto_382810 ) ) ( not ( = ?auto_382809 ?auto_382811 ) ) ( not ( = ?auto_382809 ?auto_382812 ) ) ( not ( = ?auto_382809 ?auto_382813 ) ) ( not ( = ?auto_382809 ?auto_382814 ) ) ( not ( = ?auto_382809 ?auto_382815 ) ) ( not ( = ?auto_382809 ?auto_382816 ) ) ( not ( = ?auto_382809 ?auto_382817 ) ) ( not ( = ?auto_382809 ?auto_382818 ) ) ( not ( = ?auto_382810 ?auto_382811 ) ) ( not ( = ?auto_382810 ?auto_382812 ) ) ( not ( = ?auto_382810 ?auto_382813 ) ) ( not ( = ?auto_382810 ?auto_382814 ) ) ( not ( = ?auto_382810 ?auto_382815 ) ) ( not ( = ?auto_382810 ?auto_382816 ) ) ( not ( = ?auto_382810 ?auto_382817 ) ) ( not ( = ?auto_382810 ?auto_382818 ) ) ( not ( = ?auto_382811 ?auto_382812 ) ) ( not ( = ?auto_382811 ?auto_382813 ) ) ( not ( = ?auto_382811 ?auto_382814 ) ) ( not ( = ?auto_382811 ?auto_382815 ) ) ( not ( = ?auto_382811 ?auto_382816 ) ) ( not ( = ?auto_382811 ?auto_382817 ) ) ( not ( = ?auto_382811 ?auto_382818 ) ) ( not ( = ?auto_382812 ?auto_382813 ) ) ( not ( = ?auto_382812 ?auto_382814 ) ) ( not ( = ?auto_382812 ?auto_382815 ) ) ( not ( = ?auto_382812 ?auto_382816 ) ) ( not ( = ?auto_382812 ?auto_382817 ) ) ( not ( = ?auto_382812 ?auto_382818 ) ) ( not ( = ?auto_382813 ?auto_382814 ) ) ( not ( = ?auto_382813 ?auto_382815 ) ) ( not ( = ?auto_382813 ?auto_382816 ) ) ( not ( = ?auto_382813 ?auto_382817 ) ) ( not ( = ?auto_382813 ?auto_382818 ) ) ( not ( = ?auto_382814 ?auto_382815 ) ) ( not ( = ?auto_382814 ?auto_382816 ) ) ( not ( = ?auto_382814 ?auto_382817 ) ) ( not ( = ?auto_382814 ?auto_382818 ) ) ( not ( = ?auto_382815 ?auto_382816 ) ) ( not ( = ?auto_382815 ?auto_382817 ) ) ( not ( = ?auto_382815 ?auto_382818 ) ) ( not ( = ?auto_382816 ?auto_382817 ) ) ( not ( = ?auto_382816 ?auto_382818 ) ) ( not ( = ?auto_382817 ?auto_382818 ) ) ( ON ?auto_382816 ?auto_382817 ) ( CLEAR ?auto_382814 ) ( ON ?auto_382815 ?auto_382816 ) ( CLEAR ?auto_382815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_382808 ?auto_382809 ?auto_382810 ?auto_382811 ?auto_382812 ?auto_382813 ?auto_382814 ?auto_382815 )
      ( MAKE-10PILE ?auto_382808 ?auto_382809 ?auto_382810 ?auto_382811 ?auto_382812 ?auto_382813 ?auto_382814 ?auto_382815 ?auto_382816 ?auto_382817 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382829 - BLOCK
      ?auto_382830 - BLOCK
      ?auto_382831 - BLOCK
      ?auto_382832 - BLOCK
      ?auto_382833 - BLOCK
      ?auto_382834 - BLOCK
      ?auto_382835 - BLOCK
      ?auto_382836 - BLOCK
      ?auto_382837 - BLOCK
      ?auto_382838 - BLOCK
    )
    :vars
    (
      ?auto_382839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382838 ?auto_382839 ) ( ON-TABLE ?auto_382829 ) ( ON ?auto_382830 ?auto_382829 ) ( ON ?auto_382831 ?auto_382830 ) ( ON ?auto_382832 ?auto_382831 ) ( ON ?auto_382833 ?auto_382832 ) ( ON ?auto_382834 ?auto_382833 ) ( ON ?auto_382835 ?auto_382834 ) ( not ( = ?auto_382829 ?auto_382830 ) ) ( not ( = ?auto_382829 ?auto_382831 ) ) ( not ( = ?auto_382829 ?auto_382832 ) ) ( not ( = ?auto_382829 ?auto_382833 ) ) ( not ( = ?auto_382829 ?auto_382834 ) ) ( not ( = ?auto_382829 ?auto_382835 ) ) ( not ( = ?auto_382829 ?auto_382836 ) ) ( not ( = ?auto_382829 ?auto_382837 ) ) ( not ( = ?auto_382829 ?auto_382838 ) ) ( not ( = ?auto_382829 ?auto_382839 ) ) ( not ( = ?auto_382830 ?auto_382831 ) ) ( not ( = ?auto_382830 ?auto_382832 ) ) ( not ( = ?auto_382830 ?auto_382833 ) ) ( not ( = ?auto_382830 ?auto_382834 ) ) ( not ( = ?auto_382830 ?auto_382835 ) ) ( not ( = ?auto_382830 ?auto_382836 ) ) ( not ( = ?auto_382830 ?auto_382837 ) ) ( not ( = ?auto_382830 ?auto_382838 ) ) ( not ( = ?auto_382830 ?auto_382839 ) ) ( not ( = ?auto_382831 ?auto_382832 ) ) ( not ( = ?auto_382831 ?auto_382833 ) ) ( not ( = ?auto_382831 ?auto_382834 ) ) ( not ( = ?auto_382831 ?auto_382835 ) ) ( not ( = ?auto_382831 ?auto_382836 ) ) ( not ( = ?auto_382831 ?auto_382837 ) ) ( not ( = ?auto_382831 ?auto_382838 ) ) ( not ( = ?auto_382831 ?auto_382839 ) ) ( not ( = ?auto_382832 ?auto_382833 ) ) ( not ( = ?auto_382832 ?auto_382834 ) ) ( not ( = ?auto_382832 ?auto_382835 ) ) ( not ( = ?auto_382832 ?auto_382836 ) ) ( not ( = ?auto_382832 ?auto_382837 ) ) ( not ( = ?auto_382832 ?auto_382838 ) ) ( not ( = ?auto_382832 ?auto_382839 ) ) ( not ( = ?auto_382833 ?auto_382834 ) ) ( not ( = ?auto_382833 ?auto_382835 ) ) ( not ( = ?auto_382833 ?auto_382836 ) ) ( not ( = ?auto_382833 ?auto_382837 ) ) ( not ( = ?auto_382833 ?auto_382838 ) ) ( not ( = ?auto_382833 ?auto_382839 ) ) ( not ( = ?auto_382834 ?auto_382835 ) ) ( not ( = ?auto_382834 ?auto_382836 ) ) ( not ( = ?auto_382834 ?auto_382837 ) ) ( not ( = ?auto_382834 ?auto_382838 ) ) ( not ( = ?auto_382834 ?auto_382839 ) ) ( not ( = ?auto_382835 ?auto_382836 ) ) ( not ( = ?auto_382835 ?auto_382837 ) ) ( not ( = ?auto_382835 ?auto_382838 ) ) ( not ( = ?auto_382835 ?auto_382839 ) ) ( not ( = ?auto_382836 ?auto_382837 ) ) ( not ( = ?auto_382836 ?auto_382838 ) ) ( not ( = ?auto_382836 ?auto_382839 ) ) ( not ( = ?auto_382837 ?auto_382838 ) ) ( not ( = ?auto_382837 ?auto_382839 ) ) ( not ( = ?auto_382838 ?auto_382839 ) ) ( ON ?auto_382837 ?auto_382838 ) ( CLEAR ?auto_382835 ) ( ON ?auto_382836 ?auto_382837 ) ( CLEAR ?auto_382836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_382829 ?auto_382830 ?auto_382831 ?auto_382832 ?auto_382833 ?auto_382834 ?auto_382835 ?auto_382836 )
      ( MAKE-10PILE ?auto_382829 ?auto_382830 ?auto_382831 ?auto_382832 ?auto_382833 ?auto_382834 ?auto_382835 ?auto_382836 ?auto_382837 ?auto_382838 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382850 - BLOCK
      ?auto_382851 - BLOCK
      ?auto_382852 - BLOCK
      ?auto_382853 - BLOCK
      ?auto_382854 - BLOCK
      ?auto_382855 - BLOCK
      ?auto_382856 - BLOCK
      ?auto_382857 - BLOCK
      ?auto_382858 - BLOCK
      ?auto_382859 - BLOCK
    )
    :vars
    (
      ?auto_382860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382859 ?auto_382860 ) ( ON-TABLE ?auto_382850 ) ( ON ?auto_382851 ?auto_382850 ) ( ON ?auto_382852 ?auto_382851 ) ( ON ?auto_382853 ?auto_382852 ) ( ON ?auto_382854 ?auto_382853 ) ( ON ?auto_382855 ?auto_382854 ) ( not ( = ?auto_382850 ?auto_382851 ) ) ( not ( = ?auto_382850 ?auto_382852 ) ) ( not ( = ?auto_382850 ?auto_382853 ) ) ( not ( = ?auto_382850 ?auto_382854 ) ) ( not ( = ?auto_382850 ?auto_382855 ) ) ( not ( = ?auto_382850 ?auto_382856 ) ) ( not ( = ?auto_382850 ?auto_382857 ) ) ( not ( = ?auto_382850 ?auto_382858 ) ) ( not ( = ?auto_382850 ?auto_382859 ) ) ( not ( = ?auto_382850 ?auto_382860 ) ) ( not ( = ?auto_382851 ?auto_382852 ) ) ( not ( = ?auto_382851 ?auto_382853 ) ) ( not ( = ?auto_382851 ?auto_382854 ) ) ( not ( = ?auto_382851 ?auto_382855 ) ) ( not ( = ?auto_382851 ?auto_382856 ) ) ( not ( = ?auto_382851 ?auto_382857 ) ) ( not ( = ?auto_382851 ?auto_382858 ) ) ( not ( = ?auto_382851 ?auto_382859 ) ) ( not ( = ?auto_382851 ?auto_382860 ) ) ( not ( = ?auto_382852 ?auto_382853 ) ) ( not ( = ?auto_382852 ?auto_382854 ) ) ( not ( = ?auto_382852 ?auto_382855 ) ) ( not ( = ?auto_382852 ?auto_382856 ) ) ( not ( = ?auto_382852 ?auto_382857 ) ) ( not ( = ?auto_382852 ?auto_382858 ) ) ( not ( = ?auto_382852 ?auto_382859 ) ) ( not ( = ?auto_382852 ?auto_382860 ) ) ( not ( = ?auto_382853 ?auto_382854 ) ) ( not ( = ?auto_382853 ?auto_382855 ) ) ( not ( = ?auto_382853 ?auto_382856 ) ) ( not ( = ?auto_382853 ?auto_382857 ) ) ( not ( = ?auto_382853 ?auto_382858 ) ) ( not ( = ?auto_382853 ?auto_382859 ) ) ( not ( = ?auto_382853 ?auto_382860 ) ) ( not ( = ?auto_382854 ?auto_382855 ) ) ( not ( = ?auto_382854 ?auto_382856 ) ) ( not ( = ?auto_382854 ?auto_382857 ) ) ( not ( = ?auto_382854 ?auto_382858 ) ) ( not ( = ?auto_382854 ?auto_382859 ) ) ( not ( = ?auto_382854 ?auto_382860 ) ) ( not ( = ?auto_382855 ?auto_382856 ) ) ( not ( = ?auto_382855 ?auto_382857 ) ) ( not ( = ?auto_382855 ?auto_382858 ) ) ( not ( = ?auto_382855 ?auto_382859 ) ) ( not ( = ?auto_382855 ?auto_382860 ) ) ( not ( = ?auto_382856 ?auto_382857 ) ) ( not ( = ?auto_382856 ?auto_382858 ) ) ( not ( = ?auto_382856 ?auto_382859 ) ) ( not ( = ?auto_382856 ?auto_382860 ) ) ( not ( = ?auto_382857 ?auto_382858 ) ) ( not ( = ?auto_382857 ?auto_382859 ) ) ( not ( = ?auto_382857 ?auto_382860 ) ) ( not ( = ?auto_382858 ?auto_382859 ) ) ( not ( = ?auto_382858 ?auto_382860 ) ) ( not ( = ?auto_382859 ?auto_382860 ) ) ( ON ?auto_382858 ?auto_382859 ) ( ON ?auto_382857 ?auto_382858 ) ( CLEAR ?auto_382855 ) ( ON ?auto_382856 ?auto_382857 ) ( CLEAR ?auto_382856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_382850 ?auto_382851 ?auto_382852 ?auto_382853 ?auto_382854 ?auto_382855 ?auto_382856 )
      ( MAKE-10PILE ?auto_382850 ?auto_382851 ?auto_382852 ?auto_382853 ?auto_382854 ?auto_382855 ?auto_382856 ?auto_382857 ?auto_382858 ?auto_382859 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382871 - BLOCK
      ?auto_382872 - BLOCK
      ?auto_382873 - BLOCK
      ?auto_382874 - BLOCK
      ?auto_382875 - BLOCK
      ?auto_382876 - BLOCK
      ?auto_382877 - BLOCK
      ?auto_382878 - BLOCK
      ?auto_382879 - BLOCK
      ?auto_382880 - BLOCK
    )
    :vars
    (
      ?auto_382881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382880 ?auto_382881 ) ( ON-TABLE ?auto_382871 ) ( ON ?auto_382872 ?auto_382871 ) ( ON ?auto_382873 ?auto_382872 ) ( ON ?auto_382874 ?auto_382873 ) ( ON ?auto_382875 ?auto_382874 ) ( ON ?auto_382876 ?auto_382875 ) ( not ( = ?auto_382871 ?auto_382872 ) ) ( not ( = ?auto_382871 ?auto_382873 ) ) ( not ( = ?auto_382871 ?auto_382874 ) ) ( not ( = ?auto_382871 ?auto_382875 ) ) ( not ( = ?auto_382871 ?auto_382876 ) ) ( not ( = ?auto_382871 ?auto_382877 ) ) ( not ( = ?auto_382871 ?auto_382878 ) ) ( not ( = ?auto_382871 ?auto_382879 ) ) ( not ( = ?auto_382871 ?auto_382880 ) ) ( not ( = ?auto_382871 ?auto_382881 ) ) ( not ( = ?auto_382872 ?auto_382873 ) ) ( not ( = ?auto_382872 ?auto_382874 ) ) ( not ( = ?auto_382872 ?auto_382875 ) ) ( not ( = ?auto_382872 ?auto_382876 ) ) ( not ( = ?auto_382872 ?auto_382877 ) ) ( not ( = ?auto_382872 ?auto_382878 ) ) ( not ( = ?auto_382872 ?auto_382879 ) ) ( not ( = ?auto_382872 ?auto_382880 ) ) ( not ( = ?auto_382872 ?auto_382881 ) ) ( not ( = ?auto_382873 ?auto_382874 ) ) ( not ( = ?auto_382873 ?auto_382875 ) ) ( not ( = ?auto_382873 ?auto_382876 ) ) ( not ( = ?auto_382873 ?auto_382877 ) ) ( not ( = ?auto_382873 ?auto_382878 ) ) ( not ( = ?auto_382873 ?auto_382879 ) ) ( not ( = ?auto_382873 ?auto_382880 ) ) ( not ( = ?auto_382873 ?auto_382881 ) ) ( not ( = ?auto_382874 ?auto_382875 ) ) ( not ( = ?auto_382874 ?auto_382876 ) ) ( not ( = ?auto_382874 ?auto_382877 ) ) ( not ( = ?auto_382874 ?auto_382878 ) ) ( not ( = ?auto_382874 ?auto_382879 ) ) ( not ( = ?auto_382874 ?auto_382880 ) ) ( not ( = ?auto_382874 ?auto_382881 ) ) ( not ( = ?auto_382875 ?auto_382876 ) ) ( not ( = ?auto_382875 ?auto_382877 ) ) ( not ( = ?auto_382875 ?auto_382878 ) ) ( not ( = ?auto_382875 ?auto_382879 ) ) ( not ( = ?auto_382875 ?auto_382880 ) ) ( not ( = ?auto_382875 ?auto_382881 ) ) ( not ( = ?auto_382876 ?auto_382877 ) ) ( not ( = ?auto_382876 ?auto_382878 ) ) ( not ( = ?auto_382876 ?auto_382879 ) ) ( not ( = ?auto_382876 ?auto_382880 ) ) ( not ( = ?auto_382876 ?auto_382881 ) ) ( not ( = ?auto_382877 ?auto_382878 ) ) ( not ( = ?auto_382877 ?auto_382879 ) ) ( not ( = ?auto_382877 ?auto_382880 ) ) ( not ( = ?auto_382877 ?auto_382881 ) ) ( not ( = ?auto_382878 ?auto_382879 ) ) ( not ( = ?auto_382878 ?auto_382880 ) ) ( not ( = ?auto_382878 ?auto_382881 ) ) ( not ( = ?auto_382879 ?auto_382880 ) ) ( not ( = ?auto_382879 ?auto_382881 ) ) ( not ( = ?auto_382880 ?auto_382881 ) ) ( ON ?auto_382879 ?auto_382880 ) ( ON ?auto_382878 ?auto_382879 ) ( CLEAR ?auto_382876 ) ( ON ?auto_382877 ?auto_382878 ) ( CLEAR ?auto_382877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_382871 ?auto_382872 ?auto_382873 ?auto_382874 ?auto_382875 ?auto_382876 ?auto_382877 )
      ( MAKE-10PILE ?auto_382871 ?auto_382872 ?auto_382873 ?auto_382874 ?auto_382875 ?auto_382876 ?auto_382877 ?auto_382878 ?auto_382879 ?auto_382880 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382892 - BLOCK
      ?auto_382893 - BLOCK
      ?auto_382894 - BLOCK
      ?auto_382895 - BLOCK
      ?auto_382896 - BLOCK
      ?auto_382897 - BLOCK
      ?auto_382898 - BLOCK
      ?auto_382899 - BLOCK
      ?auto_382900 - BLOCK
      ?auto_382901 - BLOCK
    )
    :vars
    (
      ?auto_382902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382901 ?auto_382902 ) ( ON-TABLE ?auto_382892 ) ( ON ?auto_382893 ?auto_382892 ) ( ON ?auto_382894 ?auto_382893 ) ( ON ?auto_382895 ?auto_382894 ) ( ON ?auto_382896 ?auto_382895 ) ( not ( = ?auto_382892 ?auto_382893 ) ) ( not ( = ?auto_382892 ?auto_382894 ) ) ( not ( = ?auto_382892 ?auto_382895 ) ) ( not ( = ?auto_382892 ?auto_382896 ) ) ( not ( = ?auto_382892 ?auto_382897 ) ) ( not ( = ?auto_382892 ?auto_382898 ) ) ( not ( = ?auto_382892 ?auto_382899 ) ) ( not ( = ?auto_382892 ?auto_382900 ) ) ( not ( = ?auto_382892 ?auto_382901 ) ) ( not ( = ?auto_382892 ?auto_382902 ) ) ( not ( = ?auto_382893 ?auto_382894 ) ) ( not ( = ?auto_382893 ?auto_382895 ) ) ( not ( = ?auto_382893 ?auto_382896 ) ) ( not ( = ?auto_382893 ?auto_382897 ) ) ( not ( = ?auto_382893 ?auto_382898 ) ) ( not ( = ?auto_382893 ?auto_382899 ) ) ( not ( = ?auto_382893 ?auto_382900 ) ) ( not ( = ?auto_382893 ?auto_382901 ) ) ( not ( = ?auto_382893 ?auto_382902 ) ) ( not ( = ?auto_382894 ?auto_382895 ) ) ( not ( = ?auto_382894 ?auto_382896 ) ) ( not ( = ?auto_382894 ?auto_382897 ) ) ( not ( = ?auto_382894 ?auto_382898 ) ) ( not ( = ?auto_382894 ?auto_382899 ) ) ( not ( = ?auto_382894 ?auto_382900 ) ) ( not ( = ?auto_382894 ?auto_382901 ) ) ( not ( = ?auto_382894 ?auto_382902 ) ) ( not ( = ?auto_382895 ?auto_382896 ) ) ( not ( = ?auto_382895 ?auto_382897 ) ) ( not ( = ?auto_382895 ?auto_382898 ) ) ( not ( = ?auto_382895 ?auto_382899 ) ) ( not ( = ?auto_382895 ?auto_382900 ) ) ( not ( = ?auto_382895 ?auto_382901 ) ) ( not ( = ?auto_382895 ?auto_382902 ) ) ( not ( = ?auto_382896 ?auto_382897 ) ) ( not ( = ?auto_382896 ?auto_382898 ) ) ( not ( = ?auto_382896 ?auto_382899 ) ) ( not ( = ?auto_382896 ?auto_382900 ) ) ( not ( = ?auto_382896 ?auto_382901 ) ) ( not ( = ?auto_382896 ?auto_382902 ) ) ( not ( = ?auto_382897 ?auto_382898 ) ) ( not ( = ?auto_382897 ?auto_382899 ) ) ( not ( = ?auto_382897 ?auto_382900 ) ) ( not ( = ?auto_382897 ?auto_382901 ) ) ( not ( = ?auto_382897 ?auto_382902 ) ) ( not ( = ?auto_382898 ?auto_382899 ) ) ( not ( = ?auto_382898 ?auto_382900 ) ) ( not ( = ?auto_382898 ?auto_382901 ) ) ( not ( = ?auto_382898 ?auto_382902 ) ) ( not ( = ?auto_382899 ?auto_382900 ) ) ( not ( = ?auto_382899 ?auto_382901 ) ) ( not ( = ?auto_382899 ?auto_382902 ) ) ( not ( = ?auto_382900 ?auto_382901 ) ) ( not ( = ?auto_382900 ?auto_382902 ) ) ( not ( = ?auto_382901 ?auto_382902 ) ) ( ON ?auto_382900 ?auto_382901 ) ( ON ?auto_382899 ?auto_382900 ) ( ON ?auto_382898 ?auto_382899 ) ( CLEAR ?auto_382896 ) ( ON ?auto_382897 ?auto_382898 ) ( CLEAR ?auto_382897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_382892 ?auto_382893 ?auto_382894 ?auto_382895 ?auto_382896 ?auto_382897 )
      ( MAKE-10PILE ?auto_382892 ?auto_382893 ?auto_382894 ?auto_382895 ?auto_382896 ?auto_382897 ?auto_382898 ?auto_382899 ?auto_382900 ?auto_382901 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382913 - BLOCK
      ?auto_382914 - BLOCK
      ?auto_382915 - BLOCK
      ?auto_382916 - BLOCK
      ?auto_382917 - BLOCK
      ?auto_382918 - BLOCK
      ?auto_382919 - BLOCK
      ?auto_382920 - BLOCK
      ?auto_382921 - BLOCK
      ?auto_382922 - BLOCK
    )
    :vars
    (
      ?auto_382923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382922 ?auto_382923 ) ( ON-TABLE ?auto_382913 ) ( ON ?auto_382914 ?auto_382913 ) ( ON ?auto_382915 ?auto_382914 ) ( ON ?auto_382916 ?auto_382915 ) ( ON ?auto_382917 ?auto_382916 ) ( not ( = ?auto_382913 ?auto_382914 ) ) ( not ( = ?auto_382913 ?auto_382915 ) ) ( not ( = ?auto_382913 ?auto_382916 ) ) ( not ( = ?auto_382913 ?auto_382917 ) ) ( not ( = ?auto_382913 ?auto_382918 ) ) ( not ( = ?auto_382913 ?auto_382919 ) ) ( not ( = ?auto_382913 ?auto_382920 ) ) ( not ( = ?auto_382913 ?auto_382921 ) ) ( not ( = ?auto_382913 ?auto_382922 ) ) ( not ( = ?auto_382913 ?auto_382923 ) ) ( not ( = ?auto_382914 ?auto_382915 ) ) ( not ( = ?auto_382914 ?auto_382916 ) ) ( not ( = ?auto_382914 ?auto_382917 ) ) ( not ( = ?auto_382914 ?auto_382918 ) ) ( not ( = ?auto_382914 ?auto_382919 ) ) ( not ( = ?auto_382914 ?auto_382920 ) ) ( not ( = ?auto_382914 ?auto_382921 ) ) ( not ( = ?auto_382914 ?auto_382922 ) ) ( not ( = ?auto_382914 ?auto_382923 ) ) ( not ( = ?auto_382915 ?auto_382916 ) ) ( not ( = ?auto_382915 ?auto_382917 ) ) ( not ( = ?auto_382915 ?auto_382918 ) ) ( not ( = ?auto_382915 ?auto_382919 ) ) ( not ( = ?auto_382915 ?auto_382920 ) ) ( not ( = ?auto_382915 ?auto_382921 ) ) ( not ( = ?auto_382915 ?auto_382922 ) ) ( not ( = ?auto_382915 ?auto_382923 ) ) ( not ( = ?auto_382916 ?auto_382917 ) ) ( not ( = ?auto_382916 ?auto_382918 ) ) ( not ( = ?auto_382916 ?auto_382919 ) ) ( not ( = ?auto_382916 ?auto_382920 ) ) ( not ( = ?auto_382916 ?auto_382921 ) ) ( not ( = ?auto_382916 ?auto_382922 ) ) ( not ( = ?auto_382916 ?auto_382923 ) ) ( not ( = ?auto_382917 ?auto_382918 ) ) ( not ( = ?auto_382917 ?auto_382919 ) ) ( not ( = ?auto_382917 ?auto_382920 ) ) ( not ( = ?auto_382917 ?auto_382921 ) ) ( not ( = ?auto_382917 ?auto_382922 ) ) ( not ( = ?auto_382917 ?auto_382923 ) ) ( not ( = ?auto_382918 ?auto_382919 ) ) ( not ( = ?auto_382918 ?auto_382920 ) ) ( not ( = ?auto_382918 ?auto_382921 ) ) ( not ( = ?auto_382918 ?auto_382922 ) ) ( not ( = ?auto_382918 ?auto_382923 ) ) ( not ( = ?auto_382919 ?auto_382920 ) ) ( not ( = ?auto_382919 ?auto_382921 ) ) ( not ( = ?auto_382919 ?auto_382922 ) ) ( not ( = ?auto_382919 ?auto_382923 ) ) ( not ( = ?auto_382920 ?auto_382921 ) ) ( not ( = ?auto_382920 ?auto_382922 ) ) ( not ( = ?auto_382920 ?auto_382923 ) ) ( not ( = ?auto_382921 ?auto_382922 ) ) ( not ( = ?auto_382921 ?auto_382923 ) ) ( not ( = ?auto_382922 ?auto_382923 ) ) ( ON ?auto_382921 ?auto_382922 ) ( ON ?auto_382920 ?auto_382921 ) ( ON ?auto_382919 ?auto_382920 ) ( CLEAR ?auto_382917 ) ( ON ?auto_382918 ?auto_382919 ) ( CLEAR ?auto_382918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_382913 ?auto_382914 ?auto_382915 ?auto_382916 ?auto_382917 ?auto_382918 )
      ( MAKE-10PILE ?auto_382913 ?auto_382914 ?auto_382915 ?auto_382916 ?auto_382917 ?auto_382918 ?auto_382919 ?auto_382920 ?auto_382921 ?auto_382922 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382934 - BLOCK
      ?auto_382935 - BLOCK
      ?auto_382936 - BLOCK
      ?auto_382937 - BLOCK
      ?auto_382938 - BLOCK
      ?auto_382939 - BLOCK
      ?auto_382940 - BLOCK
      ?auto_382941 - BLOCK
      ?auto_382942 - BLOCK
      ?auto_382943 - BLOCK
    )
    :vars
    (
      ?auto_382944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382943 ?auto_382944 ) ( ON-TABLE ?auto_382934 ) ( ON ?auto_382935 ?auto_382934 ) ( ON ?auto_382936 ?auto_382935 ) ( ON ?auto_382937 ?auto_382936 ) ( not ( = ?auto_382934 ?auto_382935 ) ) ( not ( = ?auto_382934 ?auto_382936 ) ) ( not ( = ?auto_382934 ?auto_382937 ) ) ( not ( = ?auto_382934 ?auto_382938 ) ) ( not ( = ?auto_382934 ?auto_382939 ) ) ( not ( = ?auto_382934 ?auto_382940 ) ) ( not ( = ?auto_382934 ?auto_382941 ) ) ( not ( = ?auto_382934 ?auto_382942 ) ) ( not ( = ?auto_382934 ?auto_382943 ) ) ( not ( = ?auto_382934 ?auto_382944 ) ) ( not ( = ?auto_382935 ?auto_382936 ) ) ( not ( = ?auto_382935 ?auto_382937 ) ) ( not ( = ?auto_382935 ?auto_382938 ) ) ( not ( = ?auto_382935 ?auto_382939 ) ) ( not ( = ?auto_382935 ?auto_382940 ) ) ( not ( = ?auto_382935 ?auto_382941 ) ) ( not ( = ?auto_382935 ?auto_382942 ) ) ( not ( = ?auto_382935 ?auto_382943 ) ) ( not ( = ?auto_382935 ?auto_382944 ) ) ( not ( = ?auto_382936 ?auto_382937 ) ) ( not ( = ?auto_382936 ?auto_382938 ) ) ( not ( = ?auto_382936 ?auto_382939 ) ) ( not ( = ?auto_382936 ?auto_382940 ) ) ( not ( = ?auto_382936 ?auto_382941 ) ) ( not ( = ?auto_382936 ?auto_382942 ) ) ( not ( = ?auto_382936 ?auto_382943 ) ) ( not ( = ?auto_382936 ?auto_382944 ) ) ( not ( = ?auto_382937 ?auto_382938 ) ) ( not ( = ?auto_382937 ?auto_382939 ) ) ( not ( = ?auto_382937 ?auto_382940 ) ) ( not ( = ?auto_382937 ?auto_382941 ) ) ( not ( = ?auto_382937 ?auto_382942 ) ) ( not ( = ?auto_382937 ?auto_382943 ) ) ( not ( = ?auto_382937 ?auto_382944 ) ) ( not ( = ?auto_382938 ?auto_382939 ) ) ( not ( = ?auto_382938 ?auto_382940 ) ) ( not ( = ?auto_382938 ?auto_382941 ) ) ( not ( = ?auto_382938 ?auto_382942 ) ) ( not ( = ?auto_382938 ?auto_382943 ) ) ( not ( = ?auto_382938 ?auto_382944 ) ) ( not ( = ?auto_382939 ?auto_382940 ) ) ( not ( = ?auto_382939 ?auto_382941 ) ) ( not ( = ?auto_382939 ?auto_382942 ) ) ( not ( = ?auto_382939 ?auto_382943 ) ) ( not ( = ?auto_382939 ?auto_382944 ) ) ( not ( = ?auto_382940 ?auto_382941 ) ) ( not ( = ?auto_382940 ?auto_382942 ) ) ( not ( = ?auto_382940 ?auto_382943 ) ) ( not ( = ?auto_382940 ?auto_382944 ) ) ( not ( = ?auto_382941 ?auto_382942 ) ) ( not ( = ?auto_382941 ?auto_382943 ) ) ( not ( = ?auto_382941 ?auto_382944 ) ) ( not ( = ?auto_382942 ?auto_382943 ) ) ( not ( = ?auto_382942 ?auto_382944 ) ) ( not ( = ?auto_382943 ?auto_382944 ) ) ( ON ?auto_382942 ?auto_382943 ) ( ON ?auto_382941 ?auto_382942 ) ( ON ?auto_382940 ?auto_382941 ) ( ON ?auto_382939 ?auto_382940 ) ( CLEAR ?auto_382937 ) ( ON ?auto_382938 ?auto_382939 ) ( CLEAR ?auto_382938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_382934 ?auto_382935 ?auto_382936 ?auto_382937 ?auto_382938 )
      ( MAKE-10PILE ?auto_382934 ?auto_382935 ?auto_382936 ?auto_382937 ?auto_382938 ?auto_382939 ?auto_382940 ?auto_382941 ?auto_382942 ?auto_382943 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382955 - BLOCK
      ?auto_382956 - BLOCK
      ?auto_382957 - BLOCK
      ?auto_382958 - BLOCK
      ?auto_382959 - BLOCK
      ?auto_382960 - BLOCK
      ?auto_382961 - BLOCK
      ?auto_382962 - BLOCK
      ?auto_382963 - BLOCK
      ?auto_382964 - BLOCK
    )
    :vars
    (
      ?auto_382965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382964 ?auto_382965 ) ( ON-TABLE ?auto_382955 ) ( ON ?auto_382956 ?auto_382955 ) ( ON ?auto_382957 ?auto_382956 ) ( ON ?auto_382958 ?auto_382957 ) ( not ( = ?auto_382955 ?auto_382956 ) ) ( not ( = ?auto_382955 ?auto_382957 ) ) ( not ( = ?auto_382955 ?auto_382958 ) ) ( not ( = ?auto_382955 ?auto_382959 ) ) ( not ( = ?auto_382955 ?auto_382960 ) ) ( not ( = ?auto_382955 ?auto_382961 ) ) ( not ( = ?auto_382955 ?auto_382962 ) ) ( not ( = ?auto_382955 ?auto_382963 ) ) ( not ( = ?auto_382955 ?auto_382964 ) ) ( not ( = ?auto_382955 ?auto_382965 ) ) ( not ( = ?auto_382956 ?auto_382957 ) ) ( not ( = ?auto_382956 ?auto_382958 ) ) ( not ( = ?auto_382956 ?auto_382959 ) ) ( not ( = ?auto_382956 ?auto_382960 ) ) ( not ( = ?auto_382956 ?auto_382961 ) ) ( not ( = ?auto_382956 ?auto_382962 ) ) ( not ( = ?auto_382956 ?auto_382963 ) ) ( not ( = ?auto_382956 ?auto_382964 ) ) ( not ( = ?auto_382956 ?auto_382965 ) ) ( not ( = ?auto_382957 ?auto_382958 ) ) ( not ( = ?auto_382957 ?auto_382959 ) ) ( not ( = ?auto_382957 ?auto_382960 ) ) ( not ( = ?auto_382957 ?auto_382961 ) ) ( not ( = ?auto_382957 ?auto_382962 ) ) ( not ( = ?auto_382957 ?auto_382963 ) ) ( not ( = ?auto_382957 ?auto_382964 ) ) ( not ( = ?auto_382957 ?auto_382965 ) ) ( not ( = ?auto_382958 ?auto_382959 ) ) ( not ( = ?auto_382958 ?auto_382960 ) ) ( not ( = ?auto_382958 ?auto_382961 ) ) ( not ( = ?auto_382958 ?auto_382962 ) ) ( not ( = ?auto_382958 ?auto_382963 ) ) ( not ( = ?auto_382958 ?auto_382964 ) ) ( not ( = ?auto_382958 ?auto_382965 ) ) ( not ( = ?auto_382959 ?auto_382960 ) ) ( not ( = ?auto_382959 ?auto_382961 ) ) ( not ( = ?auto_382959 ?auto_382962 ) ) ( not ( = ?auto_382959 ?auto_382963 ) ) ( not ( = ?auto_382959 ?auto_382964 ) ) ( not ( = ?auto_382959 ?auto_382965 ) ) ( not ( = ?auto_382960 ?auto_382961 ) ) ( not ( = ?auto_382960 ?auto_382962 ) ) ( not ( = ?auto_382960 ?auto_382963 ) ) ( not ( = ?auto_382960 ?auto_382964 ) ) ( not ( = ?auto_382960 ?auto_382965 ) ) ( not ( = ?auto_382961 ?auto_382962 ) ) ( not ( = ?auto_382961 ?auto_382963 ) ) ( not ( = ?auto_382961 ?auto_382964 ) ) ( not ( = ?auto_382961 ?auto_382965 ) ) ( not ( = ?auto_382962 ?auto_382963 ) ) ( not ( = ?auto_382962 ?auto_382964 ) ) ( not ( = ?auto_382962 ?auto_382965 ) ) ( not ( = ?auto_382963 ?auto_382964 ) ) ( not ( = ?auto_382963 ?auto_382965 ) ) ( not ( = ?auto_382964 ?auto_382965 ) ) ( ON ?auto_382963 ?auto_382964 ) ( ON ?auto_382962 ?auto_382963 ) ( ON ?auto_382961 ?auto_382962 ) ( ON ?auto_382960 ?auto_382961 ) ( CLEAR ?auto_382958 ) ( ON ?auto_382959 ?auto_382960 ) ( CLEAR ?auto_382959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_382955 ?auto_382956 ?auto_382957 ?auto_382958 ?auto_382959 )
      ( MAKE-10PILE ?auto_382955 ?auto_382956 ?auto_382957 ?auto_382958 ?auto_382959 ?auto_382960 ?auto_382961 ?auto_382962 ?auto_382963 ?auto_382964 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382976 - BLOCK
      ?auto_382977 - BLOCK
      ?auto_382978 - BLOCK
      ?auto_382979 - BLOCK
      ?auto_382980 - BLOCK
      ?auto_382981 - BLOCK
      ?auto_382982 - BLOCK
      ?auto_382983 - BLOCK
      ?auto_382984 - BLOCK
      ?auto_382985 - BLOCK
    )
    :vars
    (
      ?auto_382986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_382985 ?auto_382986 ) ( ON-TABLE ?auto_382976 ) ( ON ?auto_382977 ?auto_382976 ) ( ON ?auto_382978 ?auto_382977 ) ( not ( = ?auto_382976 ?auto_382977 ) ) ( not ( = ?auto_382976 ?auto_382978 ) ) ( not ( = ?auto_382976 ?auto_382979 ) ) ( not ( = ?auto_382976 ?auto_382980 ) ) ( not ( = ?auto_382976 ?auto_382981 ) ) ( not ( = ?auto_382976 ?auto_382982 ) ) ( not ( = ?auto_382976 ?auto_382983 ) ) ( not ( = ?auto_382976 ?auto_382984 ) ) ( not ( = ?auto_382976 ?auto_382985 ) ) ( not ( = ?auto_382976 ?auto_382986 ) ) ( not ( = ?auto_382977 ?auto_382978 ) ) ( not ( = ?auto_382977 ?auto_382979 ) ) ( not ( = ?auto_382977 ?auto_382980 ) ) ( not ( = ?auto_382977 ?auto_382981 ) ) ( not ( = ?auto_382977 ?auto_382982 ) ) ( not ( = ?auto_382977 ?auto_382983 ) ) ( not ( = ?auto_382977 ?auto_382984 ) ) ( not ( = ?auto_382977 ?auto_382985 ) ) ( not ( = ?auto_382977 ?auto_382986 ) ) ( not ( = ?auto_382978 ?auto_382979 ) ) ( not ( = ?auto_382978 ?auto_382980 ) ) ( not ( = ?auto_382978 ?auto_382981 ) ) ( not ( = ?auto_382978 ?auto_382982 ) ) ( not ( = ?auto_382978 ?auto_382983 ) ) ( not ( = ?auto_382978 ?auto_382984 ) ) ( not ( = ?auto_382978 ?auto_382985 ) ) ( not ( = ?auto_382978 ?auto_382986 ) ) ( not ( = ?auto_382979 ?auto_382980 ) ) ( not ( = ?auto_382979 ?auto_382981 ) ) ( not ( = ?auto_382979 ?auto_382982 ) ) ( not ( = ?auto_382979 ?auto_382983 ) ) ( not ( = ?auto_382979 ?auto_382984 ) ) ( not ( = ?auto_382979 ?auto_382985 ) ) ( not ( = ?auto_382979 ?auto_382986 ) ) ( not ( = ?auto_382980 ?auto_382981 ) ) ( not ( = ?auto_382980 ?auto_382982 ) ) ( not ( = ?auto_382980 ?auto_382983 ) ) ( not ( = ?auto_382980 ?auto_382984 ) ) ( not ( = ?auto_382980 ?auto_382985 ) ) ( not ( = ?auto_382980 ?auto_382986 ) ) ( not ( = ?auto_382981 ?auto_382982 ) ) ( not ( = ?auto_382981 ?auto_382983 ) ) ( not ( = ?auto_382981 ?auto_382984 ) ) ( not ( = ?auto_382981 ?auto_382985 ) ) ( not ( = ?auto_382981 ?auto_382986 ) ) ( not ( = ?auto_382982 ?auto_382983 ) ) ( not ( = ?auto_382982 ?auto_382984 ) ) ( not ( = ?auto_382982 ?auto_382985 ) ) ( not ( = ?auto_382982 ?auto_382986 ) ) ( not ( = ?auto_382983 ?auto_382984 ) ) ( not ( = ?auto_382983 ?auto_382985 ) ) ( not ( = ?auto_382983 ?auto_382986 ) ) ( not ( = ?auto_382984 ?auto_382985 ) ) ( not ( = ?auto_382984 ?auto_382986 ) ) ( not ( = ?auto_382985 ?auto_382986 ) ) ( ON ?auto_382984 ?auto_382985 ) ( ON ?auto_382983 ?auto_382984 ) ( ON ?auto_382982 ?auto_382983 ) ( ON ?auto_382981 ?auto_382982 ) ( ON ?auto_382980 ?auto_382981 ) ( CLEAR ?auto_382978 ) ( ON ?auto_382979 ?auto_382980 ) ( CLEAR ?auto_382979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_382976 ?auto_382977 ?auto_382978 ?auto_382979 )
      ( MAKE-10PILE ?auto_382976 ?auto_382977 ?auto_382978 ?auto_382979 ?auto_382980 ?auto_382981 ?auto_382982 ?auto_382983 ?auto_382984 ?auto_382985 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_382997 - BLOCK
      ?auto_382998 - BLOCK
      ?auto_382999 - BLOCK
      ?auto_383000 - BLOCK
      ?auto_383001 - BLOCK
      ?auto_383002 - BLOCK
      ?auto_383003 - BLOCK
      ?auto_383004 - BLOCK
      ?auto_383005 - BLOCK
      ?auto_383006 - BLOCK
    )
    :vars
    (
      ?auto_383007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383006 ?auto_383007 ) ( ON-TABLE ?auto_382997 ) ( ON ?auto_382998 ?auto_382997 ) ( ON ?auto_382999 ?auto_382998 ) ( not ( = ?auto_382997 ?auto_382998 ) ) ( not ( = ?auto_382997 ?auto_382999 ) ) ( not ( = ?auto_382997 ?auto_383000 ) ) ( not ( = ?auto_382997 ?auto_383001 ) ) ( not ( = ?auto_382997 ?auto_383002 ) ) ( not ( = ?auto_382997 ?auto_383003 ) ) ( not ( = ?auto_382997 ?auto_383004 ) ) ( not ( = ?auto_382997 ?auto_383005 ) ) ( not ( = ?auto_382997 ?auto_383006 ) ) ( not ( = ?auto_382997 ?auto_383007 ) ) ( not ( = ?auto_382998 ?auto_382999 ) ) ( not ( = ?auto_382998 ?auto_383000 ) ) ( not ( = ?auto_382998 ?auto_383001 ) ) ( not ( = ?auto_382998 ?auto_383002 ) ) ( not ( = ?auto_382998 ?auto_383003 ) ) ( not ( = ?auto_382998 ?auto_383004 ) ) ( not ( = ?auto_382998 ?auto_383005 ) ) ( not ( = ?auto_382998 ?auto_383006 ) ) ( not ( = ?auto_382998 ?auto_383007 ) ) ( not ( = ?auto_382999 ?auto_383000 ) ) ( not ( = ?auto_382999 ?auto_383001 ) ) ( not ( = ?auto_382999 ?auto_383002 ) ) ( not ( = ?auto_382999 ?auto_383003 ) ) ( not ( = ?auto_382999 ?auto_383004 ) ) ( not ( = ?auto_382999 ?auto_383005 ) ) ( not ( = ?auto_382999 ?auto_383006 ) ) ( not ( = ?auto_382999 ?auto_383007 ) ) ( not ( = ?auto_383000 ?auto_383001 ) ) ( not ( = ?auto_383000 ?auto_383002 ) ) ( not ( = ?auto_383000 ?auto_383003 ) ) ( not ( = ?auto_383000 ?auto_383004 ) ) ( not ( = ?auto_383000 ?auto_383005 ) ) ( not ( = ?auto_383000 ?auto_383006 ) ) ( not ( = ?auto_383000 ?auto_383007 ) ) ( not ( = ?auto_383001 ?auto_383002 ) ) ( not ( = ?auto_383001 ?auto_383003 ) ) ( not ( = ?auto_383001 ?auto_383004 ) ) ( not ( = ?auto_383001 ?auto_383005 ) ) ( not ( = ?auto_383001 ?auto_383006 ) ) ( not ( = ?auto_383001 ?auto_383007 ) ) ( not ( = ?auto_383002 ?auto_383003 ) ) ( not ( = ?auto_383002 ?auto_383004 ) ) ( not ( = ?auto_383002 ?auto_383005 ) ) ( not ( = ?auto_383002 ?auto_383006 ) ) ( not ( = ?auto_383002 ?auto_383007 ) ) ( not ( = ?auto_383003 ?auto_383004 ) ) ( not ( = ?auto_383003 ?auto_383005 ) ) ( not ( = ?auto_383003 ?auto_383006 ) ) ( not ( = ?auto_383003 ?auto_383007 ) ) ( not ( = ?auto_383004 ?auto_383005 ) ) ( not ( = ?auto_383004 ?auto_383006 ) ) ( not ( = ?auto_383004 ?auto_383007 ) ) ( not ( = ?auto_383005 ?auto_383006 ) ) ( not ( = ?auto_383005 ?auto_383007 ) ) ( not ( = ?auto_383006 ?auto_383007 ) ) ( ON ?auto_383005 ?auto_383006 ) ( ON ?auto_383004 ?auto_383005 ) ( ON ?auto_383003 ?auto_383004 ) ( ON ?auto_383002 ?auto_383003 ) ( ON ?auto_383001 ?auto_383002 ) ( CLEAR ?auto_382999 ) ( ON ?auto_383000 ?auto_383001 ) ( CLEAR ?auto_383000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_382997 ?auto_382998 ?auto_382999 ?auto_383000 )
      ( MAKE-10PILE ?auto_382997 ?auto_382998 ?auto_382999 ?auto_383000 ?auto_383001 ?auto_383002 ?auto_383003 ?auto_383004 ?auto_383005 ?auto_383006 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_383018 - BLOCK
      ?auto_383019 - BLOCK
      ?auto_383020 - BLOCK
      ?auto_383021 - BLOCK
      ?auto_383022 - BLOCK
      ?auto_383023 - BLOCK
      ?auto_383024 - BLOCK
      ?auto_383025 - BLOCK
      ?auto_383026 - BLOCK
      ?auto_383027 - BLOCK
    )
    :vars
    (
      ?auto_383028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383027 ?auto_383028 ) ( ON-TABLE ?auto_383018 ) ( ON ?auto_383019 ?auto_383018 ) ( not ( = ?auto_383018 ?auto_383019 ) ) ( not ( = ?auto_383018 ?auto_383020 ) ) ( not ( = ?auto_383018 ?auto_383021 ) ) ( not ( = ?auto_383018 ?auto_383022 ) ) ( not ( = ?auto_383018 ?auto_383023 ) ) ( not ( = ?auto_383018 ?auto_383024 ) ) ( not ( = ?auto_383018 ?auto_383025 ) ) ( not ( = ?auto_383018 ?auto_383026 ) ) ( not ( = ?auto_383018 ?auto_383027 ) ) ( not ( = ?auto_383018 ?auto_383028 ) ) ( not ( = ?auto_383019 ?auto_383020 ) ) ( not ( = ?auto_383019 ?auto_383021 ) ) ( not ( = ?auto_383019 ?auto_383022 ) ) ( not ( = ?auto_383019 ?auto_383023 ) ) ( not ( = ?auto_383019 ?auto_383024 ) ) ( not ( = ?auto_383019 ?auto_383025 ) ) ( not ( = ?auto_383019 ?auto_383026 ) ) ( not ( = ?auto_383019 ?auto_383027 ) ) ( not ( = ?auto_383019 ?auto_383028 ) ) ( not ( = ?auto_383020 ?auto_383021 ) ) ( not ( = ?auto_383020 ?auto_383022 ) ) ( not ( = ?auto_383020 ?auto_383023 ) ) ( not ( = ?auto_383020 ?auto_383024 ) ) ( not ( = ?auto_383020 ?auto_383025 ) ) ( not ( = ?auto_383020 ?auto_383026 ) ) ( not ( = ?auto_383020 ?auto_383027 ) ) ( not ( = ?auto_383020 ?auto_383028 ) ) ( not ( = ?auto_383021 ?auto_383022 ) ) ( not ( = ?auto_383021 ?auto_383023 ) ) ( not ( = ?auto_383021 ?auto_383024 ) ) ( not ( = ?auto_383021 ?auto_383025 ) ) ( not ( = ?auto_383021 ?auto_383026 ) ) ( not ( = ?auto_383021 ?auto_383027 ) ) ( not ( = ?auto_383021 ?auto_383028 ) ) ( not ( = ?auto_383022 ?auto_383023 ) ) ( not ( = ?auto_383022 ?auto_383024 ) ) ( not ( = ?auto_383022 ?auto_383025 ) ) ( not ( = ?auto_383022 ?auto_383026 ) ) ( not ( = ?auto_383022 ?auto_383027 ) ) ( not ( = ?auto_383022 ?auto_383028 ) ) ( not ( = ?auto_383023 ?auto_383024 ) ) ( not ( = ?auto_383023 ?auto_383025 ) ) ( not ( = ?auto_383023 ?auto_383026 ) ) ( not ( = ?auto_383023 ?auto_383027 ) ) ( not ( = ?auto_383023 ?auto_383028 ) ) ( not ( = ?auto_383024 ?auto_383025 ) ) ( not ( = ?auto_383024 ?auto_383026 ) ) ( not ( = ?auto_383024 ?auto_383027 ) ) ( not ( = ?auto_383024 ?auto_383028 ) ) ( not ( = ?auto_383025 ?auto_383026 ) ) ( not ( = ?auto_383025 ?auto_383027 ) ) ( not ( = ?auto_383025 ?auto_383028 ) ) ( not ( = ?auto_383026 ?auto_383027 ) ) ( not ( = ?auto_383026 ?auto_383028 ) ) ( not ( = ?auto_383027 ?auto_383028 ) ) ( ON ?auto_383026 ?auto_383027 ) ( ON ?auto_383025 ?auto_383026 ) ( ON ?auto_383024 ?auto_383025 ) ( ON ?auto_383023 ?auto_383024 ) ( ON ?auto_383022 ?auto_383023 ) ( ON ?auto_383021 ?auto_383022 ) ( CLEAR ?auto_383019 ) ( ON ?auto_383020 ?auto_383021 ) ( CLEAR ?auto_383020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_383018 ?auto_383019 ?auto_383020 )
      ( MAKE-10PILE ?auto_383018 ?auto_383019 ?auto_383020 ?auto_383021 ?auto_383022 ?auto_383023 ?auto_383024 ?auto_383025 ?auto_383026 ?auto_383027 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_383039 - BLOCK
      ?auto_383040 - BLOCK
      ?auto_383041 - BLOCK
      ?auto_383042 - BLOCK
      ?auto_383043 - BLOCK
      ?auto_383044 - BLOCK
      ?auto_383045 - BLOCK
      ?auto_383046 - BLOCK
      ?auto_383047 - BLOCK
      ?auto_383048 - BLOCK
    )
    :vars
    (
      ?auto_383049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383048 ?auto_383049 ) ( ON-TABLE ?auto_383039 ) ( ON ?auto_383040 ?auto_383039 ) ( not ( = ?auto_383039 ?auto_383040 ) ) ( not ( = ?auto_383039 ?auto_383041 ) ) ( not ( = ?auto_383039 ?auto_383042 ) ) ( not ( = ?auto_383039 ?auto_383043 ) ) ( not ( = ?auto_383039 ?auto_383044 ) ) ( not ( = ?auto_383039 ?auto_383045 ) ) ( not ( = ?auto_383039 ?auto_383046 ) ) ( not ( = ?auto_383039 ?auto_383047 ) ) ( not ( = ?auto_383039 ?auto_383048 ) ) ( not ( = ?auto_383039 ?auto_383049 ) ) ( not ( = ?auto_383040 ?auto_383041 ) ) ( not ( = ?auto_383040 ?auto_383042 ) ) ( not ( = ?auto_383040 ?auto_383043 ) ) ( not ( = ?auto_383040 ?auto_383044 ) ) ( not ( = ?auto_383040 ?auto_383045 ) ) ( not ( = ?auto_383040 ?auto_383046 ) ) ( not ( = ?auto_383040 ?auto_383047 ) ) ( not ( = ?auto_383040 ?auto_383048 ) ) ( not ( = ?auto_383040 ?auto_383049 ) ) ( not ( = ?auto_383041 ?auto_383042 ) ) ( not ( = ?auto_383041 ?auto_383043 ) ) ( not ( = ?auto_383041 ?auto_383044 ) ) ( not ( = ?auto_383041 ?auto_383045 ) ) ( not ( = ?auto_383041 ?auto_383046 ) ) ( not ( = ?auto_383041 ?auto_383047 ) ) ( not ( = ?auto_383041 ?auto_383048 ) ) ( not ( = ?auto_383041 ?auto_383049 ) ) ( not ( = ?auto_383042 ?auto_383043 ) ) ( not ( = ?auto_383042 ?auto_383044 ) ) ( not ( = ?auto_383042 ?auto_383045 ) ) ( not ( = ?auto_383042 ?auto_383046 ) ) ( not ( = ?auto_383042 ?auto_383047 ) ) ( not ( = ?auto_383042 ?auto_383048 ) ) ( not ( = ?auto_383042 ?auto_383049 ) ) ( not ( = ?auto_383043 ?auto_383044 ) ) ( not ( = ?auto_383043 ?auto_383045 ) ) ( not ( = ?auto_383043 ?auto_383046 ) ) ( not ( = ?auto_383043 ?auto_383047 ) ) ( not ( = ?auto_383043 ?auto_383048 ) ) ( not ( = ?auto_383043 ?auto_383049 ) ) ( not ( = ?auto_383044 ?auto_383045 ) ) ( not ( = ?auto_383044 ?auto_383046 ) ) ( not ( = ?auto_383044 ?auto_383047 ) ) ( not ( = ?auto_383044 ?auto_383048 ) ) ( not ( = ?auto_383044 ?auto_383049 ) ) ( not ( = ?auto_383045 ?auto_383046 ) ) ( not ( = ?auto_383045 ?auto_383047 ) ) ( not ( = ?auto_383045 ?auto_383048 ) ) ( not ( = ?auto_383045 ?auto_383049 ) ) ( not ( = ?auto_383046 ?auto_383047 ) ) ( not ( = ?auto_383046 ?auto_383048 ) ) ( not ( = ?auto_383046 ?auto_383049 ) ) ( not ( = ?auto_383047 ?auto_383048 ) ) ( not ( = ?auto_383047 ?auto_383049 ) ) ( not ( = ?auto_383048 ?auto_383049 ) ) ( ON ?auto_383047 ?auto_383048 ) ( ON ?auto_383046 ?auto_383047 ) ( ON ?auto_383045 ?auto_383046 ) ( ON ?auto_383044 ?auto_383045 ) ( ON ?auto_383043 ?auto_383044 ) ( ON ?auto_383042 ?auto_383043 ) ( CLEAR ?auto_383040 ) ( ON ?auto_383041 ?auto_383042 ) ( CLEAR ?auto_383041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_383039 ?auto_383040 ?auto_383041 )
      ( MAKE-10PILE ?auto_383039 ?auto_383040 ?auto_383041 ?auto_383042 ?auto_383043 ?auto_383044 ?auto_383045 ?auto_383046 ?auto_383047 ?auto_383048 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_383060 - BLOCK
      ?auto_383061 - BLOCK
      ?auto_383062 - BLOCK
      ?auto_383063 - BLOCK
      ?auto_383064 - BLOCK
      ?auto_383065 - BLOCK
      ?auto_383066 - BLOCK
      ?auto_383067 - BLOCK
      ?auto_383068 - BLOCK
      ?auto_383069 - BLOCK
    )
    :vars
    (
      ?auto_383070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383069 ?auto_383070 ) ( ON-TABLE ?auto_383060 ) ( not ( = ?auto_383060 ?auto_383061 ) ) ( not ( = ?auto_383060 ?auto_383062 ) ) ( not ( = ?auto_383060 ?auto_383063 ) ) ( not ( = ?auto_383060 ?auto_383064 ) ) ( not ( = ?auto_383060 ?auto_383065 ) ) ( not ( = ?auto_383060 ?auto_383066 ) ) ( not ( = ?auto_383060 ?auto_383067 ) ) ( not ( = ?auto_383060 ?auto_383068 ) ) ( not ( = ?auto_383060 ?auto_383069 ) ) ( not ( = ?auto_383060 ?auto_383070 ) ) ( not ( = ?auto_383061 ?auto_383062 ) ) ( not ( = ?auto_383061 ?auto_383063 ) ) ( not ( = ?auto_383061 ?auto_383064 ) ) ( not ( = ?auto_383061 ?auto_383065 ) ) ( not ( = ?auto_383061 ?auto_383066 ) ) ( not ( = ?auto_383061 ?auto_383067 ) ) ( not ( = ?auto_383061 ?auto_383068 ) ) ( not ( = ?auto_383061 ?auto_383069 ) ) ( not ( = ?auto_383061 ?auto_383070 ) ) ( not ( = ?auto_383062 ?auto_383063 ) ) ( not ( = ?auto_383062 ?auto_383064 ) ) ( not ( = ?auto_383062 ?auto_383065 ) ) ( not ( = ?auto_383062 ?auto_383066 ) ) ( not ( = ?auto_383062 ?auto_383067 ) ) ( not ( = ?auto_383062 ?auto_383068 ) ) ( not ( = ?auto_383062 ?auto_383069 ) ) ( not ( = ?auto_383062 ?auto_383070 ) ) ( not ( = ?auto_383063 ?auto_383064 ) ) ( not ( = ?auto_383063 ?auto_383065 ) ) ( not ( = ?auto_383063 ?auto_383066 ) ) ( not ( = ?auto_383063 ?auto_383067 ) ) ( not ( = ?auto_383063 ?auto_383068 ) ) ( not ( = ?auto_383063 ?auto_383069 ) ) ( not ( = ?auto_383063 ?auto_383070 ) ) ( not ( = ?auto_383064 ?auto_383065 ) ) ( not ( = ?auto_383064 ?auto_383066 ) ) ( not ( = ?auto_383064 ?auto_383067 ) ) ( not ( = ?auto_383064 ?auto_383068 ) ) ( not ( = ?auto_383064 ?auto_383069 ) ) ( not ( = ?auto_383064 ?auto_383070 ) ) ( not ( = ?auto_383065 ?auto_383066 ) ) ( not ( = ?auto_383065 ?auto_383067 ) ) ( not ( = ?auto_383065 ?auto_383068 ) ) ( not ( = ?auto_383065 ?auto_383069 ) ) ( not ( = ?auto_383065 ?auto_383070 ) ) ( not ( = ?auto_383066 ?auto_383067 ) ) ( not ( = ?auto_383066 ?auto_383068 ) ) ( not ( = ?auto_383066 ?auto_383069 ) ) ( not ( = ?auto_383066 ?auto_383070 ) ) ( not ( = ?auto_383067 ?auto_383068 ) ) ( not ( = ?auto_383067 ?auto_383069 ) ) ( not ( = ?auto_383067 ?auto_383070 ) ) ( not ( = ?auto_383068 ?auto_383069 ) ) ( not ( = ?auto_383068 ?auto_383070 ) ) ( not ( = ?auto_383069 ?auto_383070 ) ) ( ON ?auto_383068 ?auto_383069 ) ( ON ?auto_383067 ?auto_383068 ) ( ON ?auto_383066 ?auto_383067 ) ( ON ?auto_383065 ?auto_383066 ) ( ON ?auto_383064 ?auto_383065 ) ( ON ?auto_383063 ?auto_383064 ) ( ON ?auto_383062 ?auto_383063 ) ( CLEAR ?auto_383060 ) ( ON ?auto_383061 ?auto_383062 ) ( CLEAR ?auto_383061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_383060 ?auto_383061 )
      ( MAKE-10PILE ?auto_383060 ?auto_383061 ?auto_383062 ?auto_383063 ?auto_383064 ?auto_383065 ?auto_383066 ?auto_383067 ?auto_383068 ?auto_383069 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_383081 - BLOCK
      ?auto_383082 - BLOCK
      ?auto_383083 - BLOCK
      ?auto_383084 - BLOCK
      ?auto_383085 - BLOCK
      ?auto_383086 - BLOCK
      ?auto_383087 - BLOCK
      ?auto_383088 - BLOCK
      ?auto_383089 - BLOCK
      ?auto_383090 - BLOCK
    )
    :vars
    (
      ?auto_383091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383090 ?auto_383091 ) ( ON-TABLE ?auto_383081 ) ( not ( = ?auto_383081 ?auto_383082 ) ) ( not ( = ?auto_383081 ?auto_383083 ) ) ( not ( = ?auto_383081 ?auto_383084 ) ) ( not ( = ?auto_383081 ?auto_383085 ) ) ( not ( = ?auto_383081 ?auto_383086 ) ) ( not ( = ?auto_383081 ?auto_383087 ) ) ( not ( = ?auto_383081 ?auto_383088 ) ) ( not ( = ?auto_383081 ?auto_383089 ) ) ( not ( = ?auto_383081 ?auto_383090 ) ) ( not ( = ?auto_383081 ?auto_383091 ) ) ( not ( = ?auto_383082 ?auto_383083 ) ) ( not ( = ?auto_383082 ?auto_383084 ) ) ( not ( = ?auto_383082 ?auto_383085 ) ) ( not ( = ?auto_383082 ?auto_383086 ) ) ( not ( = ?auto_383082 ?auto_383087 ) ) ( not ( = ?auto_383082 ?auto_383088 ) ) ( not ( = ?auto_383082 ?auto_383089 ) ) ( not ( = ?auto_383082 ?auto_383090 ) ) ( not ( = ?auto_383082 ?auto_383091 ) ) ( not ( = ?auto_383083 ?auto_383084 ) ) ( not ( = ?auto_383083 ?auto_383085 ) ) ( not ( = ?auto_383083 ?auto_383086 ) ) ( not ( = ?auto_383083 ?auto_383087 ) ) ( not ( = ?auto_383083 ?auto_383088 ) ) ( not ( = ?auto_383083 ?auto_383089 ) ) ( not ( = ?auto_383083 ?auto_383090 ) ) ( not ( = ?auto_383083 ?auto_383091 ) ) ( not ( = ?auto_383084 ?auto_383085 ) ) ( not ( = ?auto_383084 ?auto_383086 ) ) ( not ( = ?auto_383084 ?auto_383087 ) ) ( not ( = ?auto_383084 ?auto_383088 ) ) ( not ( = ?auto_383084 ?auto_383089 ) ) ( not ( = ?auto_383084 ?auto_383090 ) ) ( not ( = ?auto_383084 ?auto_383091 ) ) ( not ( = ?auto_383085 ?auto_383086 ) ) ( not ( = ?auto_383085 ?auto_383087 ) ) ( not ( = ?auto_383085 ?auto_383088 ) ) ( not ( = ?auto_383085 ?auto_383089 ) ) ( not ( = ?auto_383085 ?auto_383090 ) ) ( not ( = ?auto_383085 ?auto_383091 ) ) ( not ( = ?auto_383086 ?auto_383087 ) ) ( not ( = ?auto_383086 ?auto_383088 ) ) ( not ( = ?auto_383086 ?auto_383089 ) ) ( not ( = ?auto_383086 ?auto_383090 ) ) ( not ( = ?auto_383086 ?auto_383091 ) ) ( not ( = ?auto_383087 ?auto_383088 ) ) ( not ( = ?auto_383087 ?auto_383089 ) ) ( not ( = ?auto_383087 ?auto_383090 ) ) ( not ( = ?auto_383087 ?auto_383091 ) ) ( not ( = ?auto_383088 ?auto_383089 ) ) ( not ( = ?auto_383088 ?auto_383090 ) ) ( not ( = ?auto_383088 ?auto_383091 ) ) ( not ( = ?auto_383089 ?auto_383090 ) ) ( not ( = ?auto_383089 ?auto_383091 ) ) ( not ( = ?auto_383090 ?auto_383091 ) ) ( ON ?auto_383089 ?auto_383090 ) ( ON ?auto_383088 ?auto_383089 ) ( ON ?auto_383087 ?auto_383088 ) ( ON ?auto_383086 ?auto_383087 ) ( ON ?auto_383085 ?auto_383086 ) ( ON ?auto_383084 ?auto_383085 ) ( ON ?auto_383083 ?auto_383084 ) ( CLEAR ?auto_383081 ) ( ON ?auto_383082 ?auto_383083 ) ( CLEAR ?auto_383082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_383081 ?auto_383082 )
      ( MAKE-10PILE ?auto_383081 ?auto_383082 ?auto_383083 ?auto_383084 ?auto_383085 ?auto_383086 ?auto_383087 ?auto_383088 ?auto_383089 ?auto_383090 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_383102 - BLOCK
      ?auto_383103 - BLOCK
      ?auto_383104 - BLOCK
      ?auto_383105 - BLOCK
      ?auto_383106 - BLOCK
      ?auto_383107 - BLOCK
      ?auto_383108 - BLOCK
      ?auto_383109 - BLOCK
      ?auto_383110 - BLOCK
      ?auto_383111 - BLOCK
    )
    :vars
    (
      ?auto_383112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383111 ?auto_383112 ) ( not ( = ?auto_383102 ?auto_383103 ) ) ( not ( = ?auto_383102 ?auto_383104 ) ) ( not ( = ?auto_383102 ?auto_383105 ) ) ( not ( = ?auto_383102 ?auto_383106 ) ) ( not ( = ?auto_383102 ?auto_383107 ) ) ( not ( = ?auto_383102 ?auto_383108 ) ) ( not ( = ?auto_383102 ?auto_383109 ) ) ( not ( = ?auto_383102 ?auto_383110 ) ) ( not ( = ?auto_383102 ?auto_383111 ) ) ( not ( = ?auto_383102 ?auto_383112 ) ) ( not ( = ?auto_383103 ?auto_383104 ) ) ( not ( = ?auto_383103 ?auto_383105 ) ) ( not ( = ?auto_383103 ?auto_383106 ) ) ( not ( = ?auto_383103 ?auto_383107 ) ) ( not ( = ?auto_383103 ?auto_383108 ) ) ( not ( = ?auto_383103 ?auto_383109 ) ) ( not ( = ?auto_383103 ?auto_383110 ) ) ( not ( = ?auto_383103 ?auto_383111 ) ) ( not ( = ?auto_383103 ?auto_383112 ) ) ( not ( = ?auto_383104 ?auto_383105 ) ) ( not ( = ?auto_383104 ?auto_383106 ) ) ( not ( = ?auto_383104 ?auto_383107 ) ) ( not ( = ?auto_383104 ?auto_383108 ) ) ( not ( = ?auto_383104 ?auto_383109 ) ) ( not ( = ?auto_383104 ?auto_383110 ) ) ( not ( = ?auto_383104 ?auto_383111 ) ) ( not ( = ?auto_383104 ?auto_383112 ) ) ( not ( = ?auto_383105 ?auto_383106 ) ) ( not ( = ?auto_383105 ?auto_383107 ) ) ( not ( = ?auto_383105 ?auto_383108 ) ) ( not ( = ?auto_383105 ?auto_383109 ) ) ( not ( = ?auto_383105 ?auto_383110 ) ) ( not ( = ?auto_383105 ?auto_383111 ) ) ( not ( = ?auto_383105 ?auto_383112 ) ) ( not ( = ?auto_383106 ?auto_383107 ) ) ( not ( = ?auto_383106 ?auto_383108 ) ) ( not ( = ?auto_383106 ?auto_383109 ) ) ( not ( = ?auto_383106 ?auto_383110 ) ) ( not ( = ?auto_383106 ?auto_383111 ) ) ( not ( = ?auto_383106 ?auto_383112 ) ) ( not ( = ?auto_383107 ?auto_383108 ) ) ( not ( = ?auto_383107 ?auto_383109 ) ) ( not ( = ?auto_383107 ?auto_383110 ) ) ( not ( = ?auto_383107 ?auto_383111 ) ) ( not ( = ?auto_383107 ?auto_383112 ) ) ( not ( = ?auto_383108 ?auto_383109 ) ) ( not ( = ?auto_383108 ?auto_383110 ) ) ( not ( = ?auto_383108 ?auto_383111 ) ) ( not ( = ?auto_383108 ?auto_383112 ) ) ( not ( = ?auto_383109 ?auto_383110 ) ) ( not ( = ?auto_383109 ?auto_383111 ) ) ( not ( = ?auto_383109 ?auto_383112 ) ) ( not ( = ?auto_383110 ?auto_383111 ) ) ( not ( = ?auto_383110 ?auto_383112 ) ) ( not ( = ?auto_383111 ?auto_383112 ) ) ( ON ?auto_383110 ?auto_383111 ) ( ON ?auto_383109 ?auto_383110 ) ( ON ?auto_383108 ?auto_383109 ) ( ON ?auto_383107 ?auto_383108 ) ( ON ?auto_383106 ?auto_383107 ) ( ON ?auto_383105 ?auto_383106 ) ( ON ?auto_383104 ?auto_383105 ) ( ON ?auto_383103 ?auto_383104 ) ( ON ?auto_383102 ?auto_383103 ) ( CLEAR ?auto_383102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_383102 )
      ( MAKE-10PILE ?auto_383102 ?auto_383103 ?auto_383104 ?auto_383105 ?auto_383106 ?auto_383107 ?auto_383108 ?auto_383109 ?auto_383110 ?auto_383111 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_383123 - BLOCK
      ?auto_383124 - BLOCK
      ?auto_383125 - BLOCK
      ?auto_383126 - BLOCK
      ?auto_383127 - BLOCK
      ?auto_383128 - BLOCK
      ?auto_383129 - BLOCK
      ?auto_383130 - BLOCK
      ?auto_383131 - BLOCK
      ?auto_383132 - BLOCK
    )
    :vars
    (
      ?auto_383133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383132 ?auto_383133 ) ( not ( = ?auto_383123 ?auto_383124 ) ) ( not ( = ?auto_383123 ?auto_383125 ) ) ( not ( = ?auto_383123 ?auto_383126 ) ) ( not ( = ?auto_383123 ?auto_383127 ) ) ( not ( = ?auto_383123 ?auto_383128 ) ) ( not ( = ?auto_383123 ?auto_383129 ) ) ( not ( = ?auto_383123 ?auto_383130 ) ) ( not ( = ?auto_383123 ?auto_383131 ) ) ( not ( = ?auto_383123 ?auto_383132 ) ) ( not ( = ?auto_383123 ?auto_383133 ) ) ( not ( = ?auto_383124 ?auto_383125 ) ) ( not ( = ?auto_383124 ?auto_383126 ) ) ( not ( = ?auto_383124 ?auto_383127 ) ) ( not ( = ?auto_383124 ?auto_383128 ) ) ( not ( = ?auto_383124 ?auto_383129 ) ) ( not ( = ?auto_383124 ?auto_383130 ) ) ( not ( = ?auto_383124 ?auto_383131 ) ) ( not ( = ?auto_383124 ?auto_383132 ) ) ( not ( = ?auto_383124 ?auto_383133 ) ) ( not ( = ?auto_383125 ?auto_383126 ) ) ( not ( = ?auto_383125 ?auto_383127 ) ) ( not ( = ?auto_383125 ?auto_383128 ) ) ( not ( = ?auto_383125 ?auto_383129 ) ) ( not ( = ?auto_383125 ?auto_383130 ) ) ( not ( = ?auto_383125 ?auto_383131 ) ) ( not ( = ?auto_383125 ?auto_383132 ) ) ( not ( = ?auto_383125 ?auto_383133 ) ) ( not ( = ?auto_383126 ?auto_383127 ) ) ( not ( = ?auto_383126 ?auto_383128 ) ) ( not ( = ?auto_383126 ?auto_383129 ) ) ( not ( = ?auto_383126 ?auto_383130 ) ) ( not ( = ?auto_383126 ?auto_383131 ) ) ( not ( = ?auto_383126 ?auto_383132 ) ) ( not ( = ?auto_383126 ?auto_383133 ) ) ( not ( = ?auto_383127 ?auto_383128 ) ) ( not ( = ?auto_383127 ?auto_383129 ) ) ( not ( = ?auto_383127 ?auto_383130 ) ) ( not ( = ?auto_383127 ?auto_383131 ) ) ( not ( = ?auto_383127 ?auto_383132 ) ) ( not ( = ?auto_383127 ?auto_383133 ) ) ( not ( = ?auto_383128 ?auto_383129 ) ) ( not ( = ?auto_383128 ?auto_383130 ) ) ( not ( = ?auto_383128 ?auto_383131 ) ) ( not ( = ?auto_383128 ?auto_383132 ) ) ( not ( = ?auto_383128 ?auto_383133 ) ) ( not ( = ?auto_383129 ?auto_383130 ) ) ( not ( = ?auto_383129 ?auto_383131 ) ) ( not ( = ?auto_383129 ?auto_383132 ) ) ( not ( = ?auto_383129 ?auto_383133 ) ) ( not ( = ?auto_383130 ?auto_383131 ) ) ( not ( = ?auto_383130 ?auto_383132 ) ) ( not ( = ?auto_383130 ?auto_383133 ) ) ( not ( = ?auto_383131 ?auto_383132 ) ) ( not ( = ?auto_383131 ?auto_383133 ) ) ( not ( = ?auto_383132 ?auto_383133 ) ) ( ON ?auto_383131 ?auto_383132 ) ( ON ?auto_383130 ?auto_383131 ) ( ON ?auto_383129 ?auto_383130 ) ( ON ?auto_383128 ?auto_383129 ) ( ON ?auto_383127 ?auto_383128 ) ( ON ?auto_383126 ?auto_383127 ) ( ON ?auto_383125 ?auto_383126 ) ( ON ?auto_383124 ?auto_383125 ) ( ON ?auto_383123 ?auto_383124 ) ( CLEAR ?auto_383123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_383123 )
      ( MAKE-10PILE ?auto_383123 ?auto_383124 ?auto_383125 ?auto_383126 ?auto_383127 ?auto_383128 ?auto_383129 ?auto_383130 ?auto_383131 ?auto_383132 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383145 - BLOCK
      ?auto_383146 - BLOCK
      ?auto_383147 - BLOCK
      ?auto_383148 - BLOCK
      ?auto_383149 - BLOCK
      ?auto_383150 - BLOCK
      ?auto_383151 - BLOCK
      ?auto_383152 - BLOCK
      ?auto_383153 - BLOCK
      ?auto_383154 - BLOCK
      ?auto_383155 - BLOCK
    )
    :vars
    (
      ?auto_383156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_383154 ) ( ON ?auto_383155 ?auto_383156 ) ( CLEAR ?auto_383155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_383145 ) ( ON ?auto_383146 ?auto_383145 ) ( ON ?auto_383147 ?auto_383146 ) ( ON ?auto_383148 ?auto_383147 ) ( ON ?auto_383149 ?auto_383148 ) ( ON ?auto_383150 ?auto_383149 ) ( ON ?auto_383151 ?auto_383150 ) ( ON ?auto_383152 ?auto_383151 ) ( ON ?auto_383153 ?auto_383152 ) ( ON ?auto_383154 ?auto_383153 ) ( not ( = ?auto_383145 ?auto_383146 ) ) ( not ( = ?auto_383145 ?auto_383147 ) ) ( not ( = ?auto_383145 ?auto_383148 ) ) ( not ( = ?auto_383145 ?auto_383149 ) ) ( not ( = ?auto_383145 ?auto_383150 ) ) ( not ( = ?auto_383145 ?auto_383151 ) ) ( not ( = ?auto_383145 ?auto_383152 ) ) ( not ( = ?auto_383145 ?auto_383153 ) ) ( not ( = ?auto_383145 ?auto_383154 ) ) ( not ( = ?auto_383145 ?auto_383155 ) ) ( not ( = ?auto_383145 ?auto_383156 ) ) ( not ( = ?auto_383146 ?auto_383147 ) ) ( not ( = ?auto_383146 ?auto_383148 ) ) ( not ( = ?auto_383146 ?auto_383149 ) ) ( not ( = ?auto_383146 ?auto_383150 ) ) ( not ( = ?auto_383146 ?auto_383151 ) ) ( not ( = ?auto_383146 ?auto_383152 ) ) ( not ( = ?auto_383146 ?auto_383153 ) ) ( not ( = ?auto_383146 ?auto_383154 ) ) ( not ( = ?auto_383146 ?auto_383155 ) ) ( not ( = ?auto_383146 ?auto_383156 ) ) ( not ( = ?auto_383147 ?auto_383148 ) ) ( not ( = ?auto_383147 ?auto_383149 ) ) ( not ( = ?auto_383147 ?auto_383150 ) ) ( not ( = ?auto_383147 ?auto_383151 ) ) ( not ( = ?auto_383147 ?auto_383152 ) ) ( not ( = ?auto_383147 ?auto_383153 ) ) ( not ( = ?auto_383147 ?auto_383154 ) ) ( not ( = ?auto_383147 ?auto_383155 ) ) ( not ( = ?auto_383147 ?auto_383156 ) ) ( not ( = ?auto_383148 ?auto_383149 ) ) ( not ( = ?auto_383148 ?auto_383150 ) ) ( not ( = ?auto_383148 ?auto_383151 ) ) ( not ( = ?auto_383148 ?auto_383152 ) ) ( not ( = ?auto_383148 ?auto_383153 ) ) ( not ( = ?auto_383148 ?auto_383154 ) ) ( not ( = ?auto_383148 ?auto_383155 ) ) ( not ( = ?auto_383148 ?auto_383156 ) ) ( not ( = ?auto_383149 ?auto_383150 ) ) ( not ( = ?auto_383149 ?auto_383151 ) ) ( not ( = ?auto_383149 ?auto_383152 ) ) ( not ( = ?auto_383149 ?auto_383153 ) ) ( not ( = ?auto_383149 ?auto_383154 ) ) ( not ( = ?auto_383149 ?auto_383155 ) ) ( not ( = ?auto_383149 ?auto_383156 ) ) ( not ( = ?auto_383150 ?auto_383151 ) ) ( not ( = ?auto_383150 ?auto_383152 ) ) ( not ( = ?auto_383150 ?auto_383153 ) ) ( not ( = ?auto_383150 ?auto_383154 ) ) ( not ( = ?auto_383150 ?auto_383155 ) ) ( not ( = ?auto_383150 ?auto_383156 ) ) ( not ( = ?auto_383151 ?auto_383152 ) ) ( not ( = ?auto_383151 ?auto_383153 ) ) ( not ( = ?auto_383151 ?auto_383154 ) ) ( not ( = ?auto_383151 ?auto_383155 ) ) ( not ( = ?auto_383151 ?auto_383156 ) ) ( not ( = ?auto_383152 ?auto_383153 ) ) ( not ( = ?auto_383152 ?auto_383154 ) ) ( not ( = ?auto_383152 ?auto_383155 ) ) ( not ( = ?auto_383152 ?auto_383156 ) ) ( not ( = ?auto_383153 ?auto_383154 ) ) ( not ( = ?auto_383153 ?auto_383155 ) ) ( not ( = ?auto_383153 ?auto_383156 ) ) ( not ( = ?auto_383154 ?auto_383155 ) ) ( not ( = ?auto_383154 ?auto_383156 ) ) ( not ( = ?auto_383155 ?auto_383156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_383155 ?auto_383156 )
      ( !STACK ?auto_383155 ?auto_383154 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383168 - BLOCK
      ?auto_383169 - BLOCK
      ?auto_383170 - BLOCK
      ?auto_383171 - BLOCK
      ?auto_383172 - BLOCK
      ?auto_383173 - BLOCK
      ?auto_383174 - BLOCK
      ?auto_383175 - BLOCK
      ?auto_383176 - BLOCK
      ?auto_383177 - BLOCK
      ?auto_383178 - BLOCK
    )
    :vars
    (
      ?auto_383179 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_383177 ) ( ON ?auto_383178 ?auto_383179 ) ( CLEAR ?auto_383178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_383168 ) ( ON ?auto_383169 ?auto_383168 ) ( ON ?auto_383170 ?auto_383169 ) ( ON ?auto_383171 ?auto_383170 ) ( ON ?auto_383172 ?auto_383171 ) ( ON ?auto_383173 ?auto_383172 ) ( ON ?auto_383174 ?auto_383173 ) ( ON ?auto_383175 ?auto_383174 ) ( ON ?auto_383176 ?auto_383175 ) ( ON ?auto_383177 ?auto_383176 ) ( not ( = ?auto_383168 ?auto_383169 ) ) ( not ( = ?auto_383168 ?auto_383170 ) ) ( not ( = ?auto_383168 ?auto_383171 ) ) ( not ( = ?auto_383168 ?auto_383172 ) ) ( not ( = ?auto_383168 ?auto_383173 ) ) ( not ( = ?auto_383168 ?auto_383174 ) ) ( not ( = ?auto_383168 ?auto_383175 ) ) ( not ( = ?auto_383168 ?auto_383176 ) ) ( not ( = ?auto_383168 ?auto_383177 ) ) ( not ( = ?auto_383168 ?auto_383178 ) ) ( not ( = ?auto_383168 ?auto_383179 ) ) ( not ( = ?auto_383169 ?auto_383170 ) ) ( not ( = ?auto_383169 ?auto_383171 ) ) ( not ( = ?auto_383169 ?auto_383172 ) ) ( not ( = ?auto_383169 ?auto_383173 ) ) ( not ( = ?auto_383169 ?auto_383174 ) ) ( not ( = ?auto_383169 ?auto_383175 ) ) ( not ( = ?auto_383169 ?auto_383176 ) ) ( not ( = ?auto_383169 ?auto_383177 ) ) ( not ( = ?auto_383169 ?auto_383178 ) ) ( not ( = ?auto_383169 ?auto_383179 ) ) ( not ( = ?auto_383170 ?auto_383171 ) ) ( not ( = ?auto_383170 ?auto_383172 ) ) ( not ( = ?auto_383170 ?auto_383173 ) ) ( not ( = ?auto_383170 ?auto_383174 ) ) ( not ( = ?auto_383170 ?auto_383175 ) ) ( not ( = ?auto_383170 ?auto_383176 ) ) ( not ( = ?auto_383170 ?auto_383177 ) ) ( not ( = ?auto_383170 ?auto_383178 ) ) ( not ( = ?auto_383170 ?auto_383179 ) ) ( not ( = ?auto_383171 ?auto_383172 ) ) ( not ( = ?auto_383171 ?auto_383173 ) ) ( not ( = ?auto_383171 ?auto_383174 ) ) ( not ( = ?auto_383171 ?auto_383175 ) ) ( not ( = ?auto_383171 ?auto_383176 ) ) ( not ( = ?auto_383171 ?auto_383177 ) ) ( not ( = ?auto_383171 ?auto_383178 ) ) ( not ( = ?auto_383171 ?auto_383179 ) ) ( not ( = ?auto_383172 ?auto_383173 ) ) ( not ( = ?auto_383172 ?auto_383174 ) ) ( not ( = ?auto_383172 ?auto_383175 ) ) ( not ( = ?auto_383172 ?auto_383176 ) ) ( not ( = ?auto_383172 ?auto_383177 ) ) ( not ( = ?auto_383172 ?auto_383178 ) ) ( not ( = ?auto_383172 ?auto_383179 ) ) ( not ( = ?auto_383173 ?auto_383174 ) ) ( not ( = ?auto_383173 ?auto_383175 ) ) ( not ( = ?auto_383173 ?auto_383176 ) ) ( not ( = ?auto_383173 ?auto_383177 ) ) ( not ( = ?auto_383173 ?auto_383178 ) ) ( not ( = ?auto_383173 ?auto_383179 ) ) ( not ( = ?auto_383174 ?auto_383175 ) ) ( not ( = ?auto_383174 ?auto_383176 ) ) ( not ( = ?auto_383174 ?auto_383177 ) ) ( not ( = ?auto_383174 ?auto_383178 ) ) ( not ( = ?auto_383174 ?auto_383179 ) ) ( not ( = ?auto_383175 ?auto_383176 ) ) ( not ( = ?auto_383175 ?auto_383177 ) ) ( not ( = ?auto_383175 ?auto_383178 ) ) ( not ( = ?auto_383175 ?auto_383179 ) ) ( not ( = ?auto_383176 ?auto_383177 ) ) ( not ( = ?auto_383176 ?auto_383178 ) ) ( not ( = ?auto_383176 ?auto_383179 ) ) ( not ( = ?auto_383177 ?auto_383178 ) ) ( not ( = ?auto_383177 ?auto_383179 ) ) ( not ( = ?auto_383178 ?auto_383179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_383178 ?auto_383179 )
      ( !STACK ?auto_383178 ?auto_383177 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383191 - BLOCK
      ?auto_383192 - BLOCK
      ?auto_383193 - BLOCK
      ?auto_383194 - BLOCK
      ?auto_383195 - BLOCK
      ?auto_383196 - BLOCK
      ?auto_383197 - BLOCK
      ?auto_383198 - BLOCK
      ?auto_383199 - BLOCK
      ?auto_383200 - BLOCK
      ?auto_383201 - BLOCK
    )
    :vars
    (
      ?auto_383202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383201 ?auto_383202 ) ( ON-TABLE ?auto_383191 ) ( ON ?auto_383192 ?auto_383191 ) ( ON ?auto_383193 ?auto_383192 ) ( ON ?auto_383194 ?auto_383193 ) ( ON ?auto_383195 ?auto_383194 ) ( ON ?auto_383196 ?auto_383195 ) ( ON ?auto_383197 ?auto_383196 ) ( ON ?auto_383198 ?auto_383197 ) ( ON ?auto_383199 ?auto_383198 ) ( not ( = ?auto_383191 ?auto_383192 ) ) ( not ( = ?auto_383191 ?auto_383193 ) ) ( not ( = ?auto_383191 ?auto_383194 ) ) ( not ( = ?auto_383191 ?auto_383195 ) ) ( not ( = ?auto_383191 ?auto_383196 ) ) ( not ( = ?auto_383191 ?auto_383197 ) ) ( not ( = ?auto_383191 ?auto_383198 ) ) ( not ( = ?auto_383191 ?auto_383199 ) ) ( not ( = ?auto_383191 ?auto_383200 ) ) ( not ( = ?auto_383191 ?auto_383201 ) ) ( not ( = ?auto_383191 ?auto_383202 ) ) ( not ( = ?auto_383192 ?auto_383193 ) ) ( not ( = ?auto_383192 ?auto_383194 ) ) ( not ( = ?auto_383192 ?auto_383195 ) ) ( not ( = ?auto_383192 ?auto_383196 ) ) ( not ( = ?auto_383192 ?auto_383197 ) ) ( not ( = ?auto_383192 ?auto_383198 ) ) ( not ( = ?auto_383192 ?auto_383199 ) ) ( not ( = ?auto_383192 ?auto_383200 ) ) ( not ( = ?auto_383192 ?auto_383201 ) ) ( not ( = ?auto_383192 ?auto_383202 ) ) ( not ( = ?auto_383193 ?auto_383194 ) ) ( not ( = ?auto_383193 ?auto_383195 ) ) ( not ( = ?auto_383193 ?auto_383196 ) ) ( not ( = ?auto_383193 ?auto_383197 ) ) ( not ( = ?auto_383193 ?auto_383198 ) ) ( not ( = ?auto_383193 ?auto_383199 ) ) ( not ( = ?auto_383193 ?auto_383200 ) ) ( not ( = ?auto_383193 ?auto_383201 ) ) ( not ( = ?auto_383193 ?auto_383202 ) ) ( not ( = ?auto_383194 ?auto_383195 ) ) ( not ( = ?auto_383194 ?auto_383196 ) ) ( not ( = ?auto_383194 ?auto_383197 ) ) ( not ( = ?auto_383194 ?auto_383198 ) ) ( not ( = ?auto_383194 ?auto_383199 ) ) ( not ( = ?auto_383194 ?auto_383200 ) ) ( not ( = ?auto_383194 ?auto_383201 ) ) ( not ( = ?auto_383194 ?auto_383202 ) ) ( not ( = ?auto_383195 ?auto_383196 ) ) ( not ( = ?auto_383195 ?auto_383197 ) ) ( not ( = ?auto_383195 ?auto_383198 ) ) ( not ( = ?auto_383195 ?auto_383199 ) ) ( not ( = ?auto_383195 ?auto_383200 ) ) ( not ( = ?auto_383195 ?auto_383201 ) ) ( not ( = ?auto_383195 ?auto_383202 ) ) ( not ( = ?auto_383196 ?auto_383197 ) ) ( not ( = ?auto_383196 ?auto_383198 ) ) ( not ( = ?auto_383196 ?auto_383199 ) ) ( not ( = ?auto_383196 ?auto_383200 ) ) ( not ( = ?auto_383196 ?auto_383201 ) ) ( not ( = ?auto_383196 ?auto_383202 ) ) ( not ( = ?auto_383197 ?auto_383198 ) ) ( not ( = ?auto_383197 ?auto_383199 ) ) ( not ( = ?auto_383197 ?auto_383200 ) ) ( not ( = ?auto_383197 ?auto_383201 ) ) ( not ( = ?auto_383197 ?auto_383202 ) ) ( not ( = ?auto_383198 ?auto_383199 ) ) ( not ( = ?auto_383198 ?auto_383200 ) ) ( not ( = ?auto_383198 ?auto_383201 ) ) ( not ( = ?auto_383198 ?auto_383202 ) ) ( not ( = ?auto_383199 ?auto_383200 ) ) ( not ( = ?auto_383199 ?auto_383201 ) ) ( not ( = ?auto_383199 ?auto_383202 ) ) ( not ( = ?auto_383200 ?auto_383201 ) ) ( not ( = ?auto_383200 ?auto_383202 ) ) ( not ( = ?auto_383201 ?auto_383202 ) ) ( CLEAR ?auto_383199 ) ( ON ?auto_383200 ?auto_383201 ) ( CLEAR ?auto_383200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_383191 ?auto_383192 ?auto_383193 ?auto_383194 ?auto_383195 ?auto_383196 ?auto_383197 ?auto_383198 ?auto_383199 ?auto_383200 )
      ( MAKE-11PILE ?auto_383191 ?auto_383192 ?auto_383193 ?auto_383194 ?auto_383195 ?auto_383196 ?auto_383197 ?auto_383198 ?auto_383199 ?auto_383200 ?auto_383201 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383214 - BLOCK
      ?auto_383215 - BLOCK
      ?auto_383216 - BLOCK
      ?auto_383217 - BLOCK
      ?auto_383218 - BLOCK
      ?auto_383219 - BLOCK
      ?auto_383220 - BLOCK
      ?auto_383221 - BLOCK
      ?auto_383222 - BLOCK
      ?auto_383223 - BLOCK
      ?auto_383224 - BLOCK
    )
    :vars
    (
      ?auto_383225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383224 ?auto_383225 ) ( ON-TABLE ?auto_383214 ) ( ON ?auto_383215 ?auto_383214 ) ( ON ?auto_383216 ?auto_383215 ) ( ON ?auto_383217 ?auto_383216 ) ( ON ?auto_383218 ?auto_383217 ) ( ON ?auto_383219 ?auto_383218 ) ( ON ?auto_383220 ?auto_383219 ) ( ON ?auto_383221 ?auto_383220 ) ( ON ?auto_383222 ?auto_383221 ) ( not ( = ?auto_383214 ?auto_383215 ) ) ( not ( = ?auto_383214 ?auto_383216 ) ) ( not ( = ?auto_383214 ?auto_383217 ) ) ( not ( = ?auto_383214 ?auto_383218 ) ) ( not ( = ?auto_383214 ?auto_383219 ) ) ( not ( = ?auto_383214 ?auto_383220 ) ) ( not ( = ?auto_383214 ?auto_383221 ) ) ( not ( = ?auto_383214 ?auto_383222 ) ) ( not ( = ?auto_383214 ?auto_383223 ) ) ( not ( = ?auto_383214 ?auto_383224 ) ) ( not ( = ?auto_383214 ?auto_383225 ) ) ( not ( = ?auto_383215 ?auto_383216 ) ) ( not ( = ?auto_383215 ?auto_383217 ) ) ( not ( = ?auto_383215 ?auto_383218 ) ) ( not ( = ?auto_383215 ?auto_383219 ) ) ( not ( = ?auto_383215 ?auto_383220 ) ) ( not ( = ?auto_383215 ?auto_383221 ) ) ( not ( = ?auto_383215 ?auto_383222 ) ) ( not ( = ?auto_383215 ?auto_383223 ) ) ( not ( = ?auto_383215 ?auto_383224 ) ) ( not ( = ?auto_383215 ?auto_383225 ) ) ( not ( = ?auto_383216 ?auto_383217 ) ) ( not ( = ?auto_383216 ?auto_383218 ) ) ( not ( = ?auto_383216 ?auto_383219 ) ) ( not ( = ?auto_383216 ?auto_383220 ) ) ( not ( = ?auto_383216 ?auto_383221 ) ) ( not ( = ?auto_383216 ?auto_383222 ) ) ( not ( = ?auto_383216 ?auto_383223 ) ) ( not ( = ?auto_383216 ?auto_383224 ) ) ( not ( = ?auto_383216 ?auto_383225 ) ) ( not ( = ?auto_383217 ?auto_383218 ) ) ( not ( = ?auto_383217 ?auto_383219 ) ) ( not ( = ?auto_383217 ?auto_383220 ) ) ( not ( = ?auto_383217 ?auto_383221 ) ) ( not ( = ?auto_383217 ?auto_383222 ) ) ( not ( = ?auto_383217 ?auto_383223 ) ) ( not ( = ?auto_383217 ?auto_383224 ) ) ( not ( = ?auto_383217 ?auto_383225 ) ) ( not ( = ?auto_383218 ?auto_383219 ) ) ( not ( = ?auto_383218 ?auto_383220 ) ) ( not ( = ?auto_383218 ?auto_383221 ) ) ( not ( = ?auto_383218 ?auto_383222 ) ) ( not ( = ?auto_383218 ?auto_383223 ) ) ( not ( = ?auto_383218 ?auto_383224 ) ) ( not ( = ?auto_383218 ?auto_383225 ) ) ( not ( = ?auto_383219 ?auto_383220 ) ) ( not ( = ?auto_383219 ?auto_383221 ) ) ( not ( = ?auto_383219 ?auto_383222 ) ) ( not ( = ?auto_383219 ?auto_383223 ) ) ( not ( = ?auto_383219 ?auto_383224 ) ) ( not ( = ?auto_383219 ?auto_383225 ) ) ( not ( = ?auto_383220 ?auto_383221 ) ) ( not ( = ?auto_383220 ?auto_383222 ) ) ( not ( = ?auto_383220 ?auto_383223 ) ) ( not ( = ?auto_383220 ?auto_383224 ) ) ( not ( = ?auto_383220 ?auto_383225 ) ) ( not ( = ?auto_383221 ?auto_383222 ) ) ( not ( = ?auto_383221 ?auto_383223 ) ) ( not ( = ?auto_383221 ?auto_383224 ) ) ( not ( = ?auto_383221 ?auto_383225 ) ) ( not ( = ?auto_383222 ?auto_383223 ) ) ( not ( = ?auto_383222 ?auto_383224 ) ) ( not ( = ?auto_383222 ?auto_383225 ) ) ( not ( = ?auto_383223 ?auto_383224 ) ) ( not ( = ?auto_383223 ?auto_383225 ) ) ( not ( = ?auto_383224 ?auto_383225 ) ) ( CLEAR ?auto_383222 ) ( ON ?auto_383223 ?auto_383224 ) ( CLEAR ?auto_383223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_383214 ?auto_383215 ?auto_383216 ?auto_383217 ?auto_383218 ?auto_383219 ?auto_383220 ?auto_383221 ?auto_383222 ?auto_383223 )
      ( MAKE-11PILE ?auto_383214 ?auto_383215 ?auto_383216 ?auto_383217 ?auto_383218 ?auto_383219 ?auto_383220 ?auto_383221 ?auto_383222 ?auto_383223 ?auto_383224 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383237 - BLOCK
      ?auto_383238 - BLOCK
      ?auto_383239 - BLOCK
      ?auto_383240 - BLOCK
      ?auto_383241 - BLOCK
      ?auto_383242 - BLOCK
      ?auto_383243 - BLOCK
      ?auto_383244 - BLOCK
      ?auto_383245 - BLOCK
      ?auto_383246 - BLOCK
      ?auto_383247 - BLOCK
    )
    :vars
    (
      ?auto_383248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383247 ?auto_383248 ) ( ON-TABLE ?auto_383237 ) ( ON ?auto_383238 ?auto_383237 ) ( ON ?auto_383239 ?auto_383238 ) ( ON ?auto_383240 ?auto_383239 ) ( ON ?auto_383241 ?auto_383240 ) ( ON ?auto_383242 ?auto_383241 ) ( ON ?auto_383243 ?auto_383242 ) ( ON ?auto_383244 ?auto_383243 ) ( not ( = ?auto_383237 ?auto_383238 ) ) ( not ( = ?auto_383237 ?auto_383239 ) ) ( not ( = ?auto_383237 ?auto_383240 ) ) ( not ( = ?auto_383237 ?auto_383241 ) ) ( not ( = ?auto_383237 ?auto_383242 ) ) ( not ( = ?auto_383237 ?auto_383243 ) ) ( not ( = ?auto_383237 ?auto_383244 ) ) ( not ( = ?auto_383237 ?auto_383245 ) ) ( not ( = ?auto_383237 ?auto_383246 ) ) ( not ( = ?auto_383237 ?auto_383247 ) ) ( not ( = ?auto_383237 ?auto_383248 ) ) ( not ( = ?auto_383238 ?auto_383239 ) ) ( not ( = ?auto_383238 ?auto_383240 ) ) ( not ( = ?auto_383238 ?auto_383241 ) ) ( not ( = ?auto_383238 ?auto_383242 ) ) ( not ( = ?auto_383238 ?auto_383243 ) ) ( not ( = ?auto_383238 ?auto_383244 ) ) ( not ( = ?auto_383238 ?auto_383245 ) ) ( not ( = ?auto_383238 ?auto_383246 ) ) ( not ( = ?auto_383238 ?auto_383247 ) ) ( not ( = ?auto_383238 ?auto_383248 ) ) ( not ( = ?auto_383239 ?auto_383240 ) ) ( not ( = ?auto_383239 ?auto_383241 ) ) ( not ( = ?auto_383239 ?auto_383242 ) ) ( not ( = ?auto_383239 ?auto_383243 ) ) ( not ( = ?auto_383239 ?auto_383244 ) ) ( not ( = ?auto_383239 ?auto_383245 ) ) ( not ( = ?auto_383239 ?auto_383246 ) ) ( not ( = ?auto_383239 ?auto_383247 ) ) ( not ( = ?auto_383239 ?auto_383248 ) ) ( not ( = ?auto_383240 ?auto_383241 ) ) ( not ( = ?auto_383240 ?auto_383242 ) ) ( not ( = ?auto_383240 ?auto_383243 ) ) ( not ( = ?auto_383240 ?auto_383244 ) ) ( not ( = ?auto_383240 ?auto_383245 ) ) ( not ( = ?auto_383240 ?auto_383246 ) ) ( not ( = ?auto_383240 ?auto_383247 ) ) ( not ( = ?auto_383240 ?auto_383248 ) ) ( not ( = ?auto_383241 ?auto_383242 ) ) ( not ( = ?auto_383241 ?auto_383243 ) ) ( not ( = ?auto_383241 ?auto_383244 ) ) ( not ( = ?auto_383241 ?auto_383245 ) ) ( not ( = ?auto_383241 ?auto_383246 ) ) ( not ( = ?auto_383241 ?auto_383247 ) ) ( not ( = ?auto_383241 ?auto_383248 ) ) ( not ( = ?auto_383242 ?auto_383243 ) ) ( not ( = ?auto_383242 ?auto_383244 ) ) ( not ( = ?auto_383242 ?auto_383245 ) ) ( not ( = ?auto_383242 ?auto_383246 ) ) ( not ( = ?auto_383242 ?auto_383247 ) ) ( not ( = ?auto_383242 ?auto_383248 ) ) ( not ( = ?auto_383243 ?auto_383244 ) ) ( not ( = ?auto_383243 ?auto_383245 ) ) ( not ( = ?auto_383243 ?auto_383246 ) ) ( not ( = ?auto_383243 ?auto_383247 ) ) ( not ( = ?auto_383243 ?auto_383248 ) ) ( not ( = ?auto_383244 ?auto_383245 ) ) ( not ( = ?auto_383244 ?auto_383246 ) ) ( not ( = ?auto_383244 ?auto_383247 ) ) ( not ( = ?auto_383244 ?auto_383248 ) ) ( not ( = ?auto_383245 ?auto_383246 ) ) ( not ( = ?auto_383245 ?auto_383247 ) ) ( not ( = ?auto_383245 ?auto_383248 ) ) ( not ( = ?auto_383246 ?auto_383247 ) ) ( not ( = ?auto_383246 ?auto_383248 ) ) ( not ( = ?auto_383247 ?auto_383248 ) ) ( ON ?auto_383246 ?auto_383247 ) ( CLEAR ?auto_383244 ) ( ON ?auto_383245 ?auto_383246 ) ( CLEAR ?auto_383245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_383237 ?auto_383238 ?auto_383239 ?auto_383240 ?auto_383241 ?auto_383242 ?auto_383243 ?auto_383244 ?auto_383245 )
      ( MAKE-11PILE ?auto_383237 ?auto_383238 ?auto_383239 ?auto_383240 ?auto_383241 ?auto_383242 ?auto_383243 ?auto_383244 ?auto_383245 ?auto_383246 ?auto_383247 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383260 - BLOCK
      ?auto_383261 - BLOCK
      ?auto_383262 - BLOCK
      ?auto_383263 - BLOCK
      ?auto_383264 - BLOCK
      ?auto_383265 - BLOCK
      ?auto_383266 - BLOCK
      ?auto_383267 - BLOCK
      ?auto_383268 - BLOCK
      ?auto_383269 - BLOCK
      ?auto_383270 - BLOCK
    )
    :vars
    (
      ?auto_383271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383270 ?auto_383271 ) ( ON-TABLE ?auto_383260 ) ( ON ?auto_383261 ?auto_383260 ) ( ON ?auto_383262 ?auto_383261 ) ( ON ?auto_383263 ?auto_383262 ) ( ON ?auto_383264 ?auto_383263 ) ( ON ?auto_383265 ?auto_383264 ) ( ON ?auto_383266 ?auto_383265 ) ( ON ?auto_383267 ?auto_383266 ) ( not ( = ?auto_383260 ?auto_383261 ) ) ( not ( = ?auto_383260 ?auto_383262 ) ) ( not ( = ?auto_383260 ?auto_383263 ) ) ( not ( = ?auto_383260 ?auto_383264 ) ) ( not ( = ?auto_383260 ?auto_383265 ) ) ( not ( = ?auto_383260 ?auto_383266 ) ) ( not ( = ?auto_383260 ?auto_383267 ) ) ( not ( = ?auto_383260 ?auto_383268 ) ) ( not ( = ?auto_383260 ?auto_383269 ) ) ( not ( = ?auto_383260 ?auto_383270 ) ) ( not ( = ?auto_383260 ?auto_383271 ) ) ( not ( = ?auto_383261 ?auto_383262 ) ) ( not ( = ?auto_383261 ?auto_383263 ) ) ( not ( = ?auto_383261 ?auto_383264 ) ) ( not ( = ?auto_383261 ?auto_383265 ) ) ( not ( = ?auto_383261 ?auto_383266 ) ) ( not ( = ?auto_383261 ?auto_383267 ) ) ( not ( = ?auto_383261 ?auto_383268 ) ) ( not ( = ?auto_383261 ?auto_383269 ) ) ( not ( = ?auto_383261 ?auto_383270 ) ) ( not ( = ?auto_383261 ?auto_383271 ) ) ( not ( = ?auto_383262 ?auto_383263 ) ) ( not ( = ?auto_383262 ?auto_383264 ) ) ( not ( = ?auto_383262 ?auto_383265 ) ) ( not ( = ?auto_383262 ?auto_383266 ) ) ( not ( = ?auto_383262 ?auto_383267 ) ) ( not ( = ?auto_383262 ?auto_383268 ) ) ( not ( = ?auto_383262 ?auto_383269 ) ) ( not ( = ?auto_383262 ?auto_383270 ) ) ( not ( = ?auto_383262 ?auto_383271 ) ) ( not ( = ?auto_383263 ?auto_383264 ) ) ( not ( = ?auto_383263 ?auto_383265 ) ) ( not ( = ?auto_383263 ?auto_383266 ) ) ( not ( = ?auto_383263 ?auto_383267 ) ) ( not ( = ?auto_383263 ?auto_383268 ) ) ( not ( = ?auto_383263 ?auto_383269 ) ) ( not ( = ?auto_383263 ?auto_383270 ) ) ( not ( = ?auto_383263 ?auto_383271 ) ) ( not ( = ?auto_383264 ?auto_383265 ) ) ( not ( = ?auto_383264 ?auto_383266 ) ) ( not ( = ?auto_383264 ?auto_383267 ) ) ( not ( = ?auto_383264 ?auto_383268 ) ) ( not ( = ?auto_383264 ?auto_383269 ) ) ( not ( = ?auto_383264 ?auto_383270 ) ) ( not ( = ?auto_383264 ?auto_383271 ) ) ( not ( = ?auto_383265 ?auto_383266 ) ) ( not ( = ?auto_383265 ?auto_383267 ) ) ( not ( = ?auto_383265 ?auto_383268 ) ) ( not ( = ?auto_383265 ?auto_383269 ) ) ( not ( = ?auto_383265 ?auto_383270 ) ) ( not ( = ?auto_383265 ?auto_383271 ) ) ( not ( = ?auto_383266 ?auto_383267 ) ) ( not ( = ?auto_383266 ?auto_383268 ) ) ( not ( = ?auto_383266 ?auto_383269 ) ) ( not ( = ?auto_383266 ?auto_383270 ) ) ( not ( = ?auto_383266 ?auto_383271 ) ) ( not ( = ?auto_383267 ?auto_383268 ) ) ( not ( = ?auto_383267 ?auto_383269 ) ) ( not ( = ?auto_383267 ?auto_383270 ) ) ( not ( = ?auto_383267 ?auto_383271 ) ) ( not ( = ?auto_383268 ?auto_383269 ) ) ( not ( = ?auto_383268 ?auto_383270 ) ) ( not ( = ?auto_383268 ?auto_383271 ) ) ( not ( = ?auto_383269 ?auto_383270 ) ) ( not ( = ?auto_383269 ?auto_383271 ) ) ( not ( = ?auto_383270 ?auto_383271 ) ) ( ON ?auto_383269 ?auto_383270 ) ( CLEAR ?auto_383267 ) ( ON ?auto_383268 ?auto_383269 ) ( CLEAR ?auto_383268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_383260 ?auto_383261 ?auto_383262 ?auto_383263 ?auto_383264 ?auto_383265 ?auto_383266 ?auto_383267 ?auto_383268 )
      ( MAKE-11PILE ?auto_383260 ?auto_383261 ?auto_383262 ?auto_383263 ?auto_383264 ?auto_383265 ?auto_383266 ?auto_383267 ?auto_383268 ?auto_383269 ?auto_383270 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383283 - BLOCK
      ?auto_383284 - BLOCK
      ?auto_383285 - BLOCK
      ?auto_383286 - BLOCK
      ?auto_383287 - BLOCK
      ?auto_383288 - BLOCK
      ?auto_383289 - BLOCK
      ?auto_383290 - BLOCK
      ?auto_383291 - BLOCK
      ?auto_383292 - BLOCK
      ?auto_383293 - BLOCK
    )
    :vars
    (
      ?auto_383294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383293 ?auto_383294 ) ( ON-TABLE ?auto_383283 ) ( ON ?auto_383284 ?auto_383283 ) ( ON ?auto_383285 ?auto_383284 ) ( ON ?auto_383286 ?auto_383285 ) ( ON ?auto_383287 ?auto_383286 ) ( ON ?auto_383288 ?auto_383287 ) ( ON ?auto_383289 ?auto_383288 ) ( not ( = ?auto_383283 ?auto_383284 ) ) ( not ( = ?auto_383283 ?auto_383285 ) ) ( not ( = ?auto_383283 ?auto_383286 ) ) ( not ( = ?auto_383283 ?auto_383287 ) ) ( not ( = ?auto_383283 ?auto_383288 ) ) ( not ( = ?auto_383283 ?auto_383289 ) ) ( not ( = ?auto_383283 ?auto_383290 ) ) ( not ( = ?auto_383283 ?auto_383291 ) ) ( not ( = ?auto_383283 ?auto_383292 ) ) ( not ( = ?auto_383283 ?auto_383293 ) ) ( not ( = ?auto_383283 ?auto_383294 ) ) ( not ( = ?auto_383284 ?auto_383285 ) ) ( not ( = ?auto_383284 ?auto_383286 ) ) ( not ( = ?auto_383284 ?auto_383287 ) ) ( not ( = ?auto_383284 ?auto_383288 ) ) ( not ( = ?auto_383284 ?auto_383289 ) ) ( not ( = ?auto_383284 ?auto_383290 ) ) ( not ( = ?auto_383284 ?auto_383291 ) ) ( not ( = ?auto_383284 ?auto_383292 ) ) ( not ( = ?auto_383284 ?auto_383293 ) ) ( not ( = ?auto_383284 ?auto_383294 ) ) ( not ( = ?auto_383285 ?auto_383286 ) ) ( not ( = ?auto_383285 ?auto_383287 ) ) ( not ( = ?auto_383285 ?auto_383288 ) ) ( not ( = ?auto_383285 ?auto_383289 ) ) ( not ( = ?auto_383285 ?auto_383290 ) ) ( not ( = ?auto_383285 ?auto_383291 ) ) ( not ( = ?auto_383285 ?auto_383292 ) ) ( not ( = ?auto_383285 ?auto_383293 ) ) ( not ( = ?auto_383285 ?auto_383294 ) ) ( not ( = ?auto_383286 ?auto_383287 ) ) ( not ( = ?auto_383286 ?auto_383288 ) ) ( not ( = ?auto_383286 ?auto_383289 ) ) ( not ( = ?auto_383286 ?auto_383290 ) ) ( not ( = ?auto_383286 ?auto_383291 ) ) ( not ( = ?auto_383286 ?auto_383292 ) ) ( not ( = ?auto_383286 ?auto_383293 ) ) ( not ( = ?auto_383286 ?auto_383294 ) ) ( not ( = ?auto_383287 ?auto_383288 ) ) ( not ( = ?auto_383287 ?auto_383289 ) ) ( not ( = ?auto_383287 ?auto_383290 ) ) ( not ( = ?auto_383287 ?auto_383291 ) ) ( not ( = ?auto_383287 ?auto_383292 ) ) ( not ( = ?auto_383287 ?auto_383293 ) ) ( not ( = ?auto_383287 ?auto_383294 ) ) ( not ( = ?auto_383288 ?auto_383289 ) ) ( not ( = ?auto_383288 ?auto_383290 ) ) ( not ( = ?auto_383288 ?auto_383291 ) ) ( not ( = ?auto_383288 ?auto_383292 ) ) ( not ( = ?auto_383288 ?auto_383293 ) ) ( not ( = ?auto_383288 ?auto_383294 ) ) ( not ( = ?auto_383289 ?auto_383290 ) ) ( not ( = ?auto_383289 ?auto_383291 ) ) ( not ( = ?auto_383289 ?auto_383292 ) ) ( not ( = ?auto_383289 ?auto_383293 ) ) ( not ( = ?auto_383289 ?auto_383294 ) ) ( not ( = ?auto_383290 ?auto_383291 ) ) ( not ( = ?auto_383290 ?auto_383292 ) ) ( not ( = ?auto_383290 ?auto_383293 ) ) ( not ( = ?auto_383290 ?auto_383294 ) ) ( not ( = ?auto_383291 ?auto_383292 ) ) ( not ( = ?auto_383291 ?auto_383293 ) ) ( not ( = ?auto_383291 ?auto_383294 ) ) ( not ( = ?auto_383292 ?auto_383293 ) ) ( not ( = ?auto_383292 ?auto_383294 ) ) ( not ( = ?auto_383293 ?auto_383294 ) ) ( ON ?auto_383292 ?auto_383293 ) ( ON ?auto_383291 ?auto_383292 ) ( CLEAR ?auto_383289 ) ( ON ?auto_383290 ?auto_383291 ) ( CLEAR ?auto_383290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_383283 ?auto_383284 ?auto_383285 ?auto_383286 ?auto_383287 ?auto_383288 ?auto_383289 ?auto_383290 )
      ( MAKE-11PILE ?auto_383283 ?auto_383284 ?auto_383285 ?auto_383286 ?auto_383287 ?auto_383288 ?auto_383289 ?auto_383290 ?auto_383291 ?auto_383292 ?auto_383293 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383306 - BLOCK
      ?auto_383307 - BLOCK
      ?auto_383308 - BLOCK
      ?auto_383309 - BLOCK
      ?auto_383310 - BLOCK
      ?auto_383311 - BLOCK
      ?auto_383312 - BLOCK
      ?auto_383313 - BLOCK
      ?auto_383314 - BLOCK
      ?auto_383315 - BLOCK
      ?auto_383316 - BLOCK
    )
    :vars
    (
      ?auto_383317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383316 ?auto_383317 ) ( ON-TABLE ?auto_383306 ) ( ON ?auto_383307 ?auto_383306 ) ( ON ?auto_383308 ?auto_383307 ) ( ON ?auto_383309 ?auto_383308 ) ( ON ?auto_383310 ?auto_383309 ) ( ON ?auto_383311 ?auto_383310 ) ( ON ?auto_383312 ?auto_383311 ) ( not ( = ?auto_383306 ?auto_383307 ) ) ( not ( = ?auto_383306 ?auto_383308 ) ) ( not ( = ?auto_383306 ?auto_383309 ) ) ( not ( = ?auto_383306 ?auto_383310 ) ) ( not ( = ?auto_383306 ?auto_383311 ) ) ( not ( = ?auto_383306 ?auto_383312 ) ) ( not ( = ?auto_383306 ?auto_383313 ) ) ( not ( = ?auto_383306 ?auto_383314 ) ) ( not ( = ?auto_383306 ?auto_383315 ) ) ( not ( = ?auto_383306 ?auto_383316 ) ) ( not ( = ?auto_383306 ?auto_383317 ) ) ( not ( = ?auto_383307 ?auto_383308 ) ) ( not ( = ?auto_383307 ?auto_383309 ) ) ( not ( = ?auto_383307 ?auto_383310 ) ) ( not ( = ?auto_383307 ?auto_383311 ) ) ( not ( = ?auto_383307 ?auto_383312 ) ) ( not ( = ?auto_383307 ?auto_383313 ) ) ( not ( = ?auto_383307 ?auto_383314 ) ) ( not ( = ?auto_383307 ?auto_383315 ) ) ( not ( = ?auto_383307 ?auto_383316 ) ) ( not ( = ?auto_383307 ?auto_383317 ) ) ( not ( = ?auto_383308 ?auto_383309 ) ) ( not ( = ?auto_383308 ?auto_383310 ) ) ( not ( = ?auto_383308 ?auto_383311 ) ) ( not ( = ?auto_383308 ?auto_383312 ) ) ( not ( = ?auto_383308 ?auto_383313 ) ) ( not ( = ?auto_383308 ?auto_383314 ) ) ( not ( = ?auto_383308 ?auto_383315 ) ) ( not ( = ?auto_383308 ?auto_383316 ) ) ( not ( = ?auto_383308 ?auto_383317 ) ) ( not ( = ?auto_383309 ?auto_383310 ) ) ( not ( = ?auto_383309 ?auto_383311 ) ) ( not ( = ?auto_383309 ?auto_383312 ) ) ( not ( = ?auto_383309 ?auto_383313 ) ) ( not ( = ?auto_383309 ?auto_383314 ) ) ( not ( = ?auto_383309 ?auto_383315 ) ) ( not ( = ?auto_383309 ?auto_383316 ) ) ( not ( = ?auto_383309 ?auto_383317 ) ) ( not ( = ?auto_383310 ?auto_383311 ) ) ( not ( = ?auto_383310 ?auto_383312 ) ) ( not ( = ?auto_383310 ?auto_383313 ) ) ( not ( = ?auto_383310 ?auto_383314 ) ) ( not ( = ?auto_383310 ?auto_383315 ) ) ( not ( = ?auto_383310 ?auto_383316 ) ) ( not ( = ?auto_383310 ?auto_383317 ) ) ( not ( = ?auto_383311 ?auto_383312 ) ) ( not ( = ?auto_383311 ?auto_383313 ) ) ( not ( = ?auto_383311 ?auto_383314 ) ) ( not ( = ?auto_383311 ?auto_383315 ) ) ( not ( = ?auto_383311 ?auto_383316 ) ) ( not ( = ?auto_383311 ?auto_383317 ) ) ( not ( = ?auto_383312 ?auto_383313 ) ) ( not ( = ?auto_383312 ?auto_383314 ) ) ( not ( = ?auto_383312 ?auto_383315 ) ) ( not ( = ?auto_383312 ?auto_383316 ) ) ( not ( = ?auto_383312 ?auto_383317 ) ) ( not ( = ?auto_383313 ?auto_383314 ) ) ( not ( = ?auto_383313 ?auto_383315 ) ) ( not ( = ?auto_383313 ?auto_383316 ) ) ( not ( = ?auto_383313 ?auto_383317 ) ) ( not ( = ?auto_383314 ?auto_383315 ) ) ( not ( = ?auto_383314 ?auto_383316 ) ) ( not ( = ?auto_383314 ?auto_383317 ) ) ( not ( = ?auto_383315 ?auto_383316 ) ) ( not ( = ?auto_383315 ?auto_383317 ) ) ( not ( = ?auto_383316 ?auto_383317 ) ) ( ON ?auto_383315 ?auto_383316 ) ( ON ?auto_383314 ?auto_383315 ) ( CLEAR ?auto_383312 ) ( ON ?auto_383313 ?auto_383314 ) ( CLEAR ?auto_383313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_383306 ?auto_383307 ?auto_383308 ?auto_383309 ?auto_383310 ?auto_383311 ?auto_383312 ?auto_383313 )
      ( MAKE-11PILE ?auto_383306 ?auto_383307 ?auto_383308 ?auto_383309 ?auto_383310 ?auto_383311 ?auto_383312 ?auto_383313 ?auto_383314 ?auto_383315 ?auto_383316 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383329 - BLOCK
      ?auto_383330 - BLOCK
      ?auto_383331 - BLOCK
      ?auto_383332 - BLOCK
      ?auto_383333 - BLOCK
      ?auto_383334 - BLOCK
      ?auto_383335 - BLOCK
      ?auto_383336 - BLOCK
      ?auto_383337 - BLOCK
      ?auto_383338 - BLOCK
      ?auto_383339 - BLOCK
    )
    :vars
    (
      ?auto_383340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383339 ?auto_383340 ) ( ON-TABLE ?auto_383329 ) ( ON ?auto_383330 ?auto_383329 ) ( ON ?auto_383331 ?auto_383330 ) ( ON ?auto_383332 ?auto_383331 ) ( ON ?auto_383333 ?auto_383332 ) ( ON ?auto_383334 ?auto_383333 ) ( not ( = ?auto_383329 ?auto_383330 ) ) ( not ( = ?auto_383329 ?auto_383331 ) ) ( not ( = ?auto_383329 ?auto_383332 ) ) ( not ( = ?auto_383329 ?auto_383333 ) ) ( not ( = ?auto_383329 ?auto_383334 ) ) ( not ( = ?auto_383329 ?auto_383335 ) ) ( not ( = ?auto_383329 ?auto_383336 ) ) ( not ( = ?auto_383329 ?auto_383337 ) ) ( not ( = ?auto_383329 ?auto_383338 ) ) ( not ( = ?auto_383329 ?auto_383339 ) ) ( not ( = ?auto_383329 ?auto_383340 ) ) ( not ( = ?auto_383330 ?auto_383331 ) ) ( not ( = ?auto_383330 ?auto_383332 ) ) ( not ( = ?auto_383330 ?auto_383333 ) ) ( not ( = ?auto_383330 ?auto_383334 ) ) ( not ( = ?auto_383330 ?auto_383335 ) ) ( not ( = ?auto_383330 ?auto_383336 ) ) ( not ( = ?auto_383330 ?auto_383337 ) ) ( not ( = ?auto_383330 ?auto_383338 ) ) ( not ( = ?auto_383330 ?auto_383339 ) ) ( not ( = ?auto_383330 ?auto_383340 ) ) ( not ( = ?auto_383331 ?auto_383332 ) ) ( not ( = ?auto_383331 ?auto_383333 ) ) ( not ( = ?auto_383331 ?auto_383334 ) ) ( not ( = ?auto_383331 ?auto_383335 ) ) ( not ( = ?auto_383331 ?auto_383336 ) ) ( not ( = ?auto_383331 ?auto_383337 ) ) ( not ( = ?auto_383331 ?auto_383338 ) ) ( not ( = ?auto_383331 ?auto_383339 ) ) ( not ( = ?auto_383331 ?auto_383340 ) ) ( not ( = ?auto_383332 ?auto_383333 ) ) ( not ( = ?auto_383332 ?auto_383334 ) ) ( not ( = ?auto_383332 ?auto_383335 ) ) ( not ( = ?auto_383332 ?auto_383336 ) ) ( not ( = ?auto_383332 ?auto_383337 ) ) ( not ( = ?auto_383332 ?auto_383338 ) ) ( not ( = ?auto_383332 ?auto_383339 ) ) ( not ( = ?auto_383332 ?auto_383340 ) ) ( not ( = ?auto_383333 ?auto_383334 ) ) ( not ( = ?auto_383333 ?auto_383335 ) ) ( not ( = ?auto_383333 ?auto_383336 ) ) ( not ( = ?auto_383333 ?auto_383337 ) ) ( not ( = ?auto_383333 ?auto_383338 ) ) ( not ( = ?auto_383333 ?auto_383339 ) ) ( not ( = ?auto_383333 ?auto_383340 ) ) ( not ( = ?auto_383334 ?auto_383335 ) ) ( not ( = ?auto_383334 ?auto_383336 ) ) ( not ( = ?auto_383334 ?auto_383337 ) ) ( not ( = ?auto_383334 ?auto_383338 ) ) ( not ( = ?auto_383334 ?auto_383339 ) ) ( not ( = ?auto_383334 ?auto_383340 ) ) ( not ( = ?auto_383335 ?auto_383336 ) ) ( not ( = ?auto_383335 ?auto_383337 ) ) ( not ( = ?auto_383335 ?auto_383338 ) ) ( not ( = ?auto_383335 ?auto_383339 ) ) ( not ( = ?auto_383335 ?auto_383340 ) ) ( not ( = ?auto_383336 ?auto_383337 ) ) ( not ( = ?auto_383336 ?auto_383338 ) ) ( not ( = ?auto_383336 ?auto_383339 ) ) ( not ( = ?auto_383336 ?auto_383340 ) ) ( not ( = ?auto_383337 ?auto_383338 ) ) ( not ( = ?auto_383337 ?auto_383339 ) ) ( not ( = ?auto_383337 ?auto_383340 ) ) ( not ( = ?auto_383338 ?auto_383339 ) ) ( not ( = ?auto_383338 ?auto_383340 ) ) ( not ( = ?auto_383339 ?auto_383340 ) ) ( ON ?auto_383338 ?auto_383339 ) ( ON ?auto_383337 ?auto_383338 ) ( ON ?auto_383336 ?auto_383337 ) ( CLEAR ?auto_383334 ) ( ON ?auto_383335 ?auto_383336 ) ( CLEAR ?auto_383335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_383329 ?auto_383330 ?auto_383331 ?auto_383332 ?auto_383333 ?auto_383334 ?auto_383335 )
      ( MAKE-11PILE ?auto_383329 ?auto_383330 ?auto_383331 ?auto_383332 ?auto_383333 ?auto_383334 ?auto_383335 ?auto_383336 ?auto_383337 ?auto_383338 ?auto_383339 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383352 - BLOCK
      ?auto_383353 - BLOCK
      ?auto_383354 - BLOCK
      ?auto_383355 - BLOCK
      ?auto_383356 - BLOCK
      ?auto_383357 - BLOCK
      ?auto_383358 - BLOCK
      ?auto_383359 - BLOCK
      ?auto_383360 - BLOCK
      ?auto_383361 - BLOCK
      ?auto_383362 - BLOCK
    )
    :vars
    (
      ?auto_383363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383362 ?auto_383363 ) ( ON-TABLE ?auto_383352 ) ( ON ?auto_383353 ?auto_383352 ) ( ON ?auto_383354 ?auto_383353 ) ( ON ?auto_383355 ?auto_383354 ) ( ON ?auto_383356 ?auto_383355 ) ( ON ?auto_383357 ?auto_383356 ) ( not ( = ?auto_383352 ?auto_383353 ) ) ( not ( = ?auto_383352 ?auto_383354 ) ) ( not ( = ?auto_383352 ?auto_383355 ) ) ( not ( = ?auto_383352 ?auto_383356 ) ) ( not ( = ?auto_383352 ?auto_383357 ) ) ( not ( = ?auto_383352 ?auto_383358 ) ) ( not ( = ?auto_383352 ?auto_383359 ) ) ( not ( = ?auto_383352 ?auto_383360 ) ) ( not ( = ?auto_383352 ?auto_383361 ) ) ( not ( = ?auto_383352 ?auto_383362 ) ) ( not ( = ?auto_383352 ?auto_383363 ) ) ( not ( = ?auto_383353 ?auto_383354 ) ) ( not ( = ?auto_383353 ?auto_383355 ) ) ( not ( = ?auto_383353 ?auto_383356 ) ) ( not ( = ?auto_383353 ?auto_383357 ) ) ( not ( = ?auto_383353 ?auto_383358 ) ) ( not ( = ?auto_383353 ?auto_383359 ) ) ( not ( = ?auto_383353 ?auto_383360 ) ) ( not ( = ?auto_383353 ?auto_383361 ) ) ( not ( = ?auto_383353 ?auto_383362 ) ) ( not ( = ?auto_383353 ?auto_383363 ) ) ( not ( = ?auto_383354 ?auto_383355 ) ) ( not ( = ?auto_383354 ?auto_383356 ) ) ( not ( = ?auto_383354 ?auto_383357 ) ) ( not ( = ?auto_383354 ?auto_383358 ) ) ( not ( = ?auto_383354 ?auto_383359 ) ) ( not ( = ?auto_383354 ?auto_383360 ) ) ( not ( = ?auto_383354 ?auto_383361 ) ) ( not ( = ?auto_383354 ?auto_383362 ) ) ( not ( = ?auto_383354 ?auto_383363 ) ) ( not ( = ?auto_383355 ?auto_383356 ) ) ( not ( = ?auto_383355 ?auto_383357 ) ) ( not ( = ?auto_383355 ?auto_383358 ) ) ( not ( = ?auto_383355 ?auto_383359 ) ) ( not ( = ?auto_383355 ?auto_383360 ) ) ( not ( = ?auto_383355 ?auto_383361 ) ) ( not ( = ?auto_383355 ?auto_383362 ) ) ( not ( = ?auto_383355 ?auto_383363 ) ) ( not ( = ?auto_383356 ?auto_383357 ) ) ( not ( = ?auto_383356 ?auto_383358 ) ) ( not ( = ?auto_383356 ?auto_383359 ) ) ( not ( = ?auto_383356 ?auto_383360 ) ) ( not ( = ?auto_383356 ?auto_383361 ) ) ( not ( = ?auto_383356 ?auto_383362 ) ) ( not ( = ?auto_383356 ?auto_383363 ) ) ( not ( = ?auto_383357 ?auto_383358 ) ) ( not ( = ?auto_383357 ?auto_383359 ) ) ( not ( = ?auto_383357 ?auto_383360 ) ) ( not ( = ?auto_383357 ?auto_383361 ) ) ( not ( = ?auto_383357 ?auto_383362 ) ) ( not ( = ?auto_383357 ?auto_383363 ) ) ( not ( = ?auto_383358 ?auto_383359 ) ) ( not ( = ?auto_383358 ?auto_383360 ) ) ( not ( = ?auto_383358 ?auto_383361 ) ) ( not ( = ?auto_383358 ?auto_383362 ) ) ( not ( = ?auto_383358 ?auto_383363 ) ) ( not ( = ?auto_383359 ?auto_383360 ) ) ( not ( = ?auto_383359 ?auto_383361 ) ) ( not ( = ?auto_383359 ?auto_383362 ) ) ( not ( = ?auto_383359 ?auto_383363 ) ) ( not ( = ?auto_383360 ?auto_383361 ) ) ( not ( = ?auto_383360 ?auto_383362 ) ) ( not ( = ?auto_383360 ?auto_383363 ) ) ( not ( = ?auto_383361 ?auto_383362 ) ) ( not ( = ?auto_383361 ?auto_383363 ) ) ( not ( = ?auto_383362 ?auto_383363 ) ) ( ON ?auto_383361 ?auto_383362 ) ( ON ?auto_383360 ?auto_383361 ) ( ON ?auto_383359 ?auto_383360 ) ( CLEAR ?auto_383357 ) ( ON ?auto_383358 ?auto_383359 ) ( CLEAR ?auto_383358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_383352 ?auto_383353 ?auto_383354 ?auto_383355 ?auto_383356 ?auto_383357 ?auto_383358 )
      ( MAKE-11PILE ?auto_383352 ?auto_383353 ?auto_383354 ?auto_383355 ?auto_383356 ?auto_383357 ?auto_383358 ?auto_383359 ?auto_383360 ?auto_383361 ?auto_383362 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383375 - BLOCK
      ?auto_383376 - BLOCK
      ?auto_383377 - BLOCK
      ?auto_383378 - BLOCK
      ?auto_383379 - BLOCK
      ?auto_383380 - BLOCK
      ?auto_383381 - BLOCK
      ?auto_383382 - BLOCK
      ?auto_383383 - BLOCK
      ?auto_383384 - BLOCK
      ?auto_383385 - BLOCK
    )
    :vars
    (
      ?auto_383386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383385 ?auto_383386 ) ( ON-TABLE ?auto_383375 ) ( ON ?auto_383376 ?auto_383375 ) ( ON ?auto_383377 ?auto_383376 ) ( ON ?auto_383378 ?auto_383377 ) ( ON ?auto_383379 ?auto_383378 ) ( not ( = ?auto_383375 ?auto_383376 ) ) ( not ( = ?auto_383375 ?auto_383377 ) ) ( not ( = ?auto_383375 ?auto_383378 ) ) ( not ( = ?auto_383375 ?auto_383379 ) ) ( not ( = ?auto_383375 ?auto_383380 ) ) ( not ( = ?auto_383375 ?auto_383381 ) ) ( not ( = ?auto_383375 ?auto_383382 ) ) ( not ( = ?auto_383375 ?auto_383383 ) ) ( not ( = ?auto_383375 ?auto_383384 ) ) ( not ( = ?auto_383375 ?auto_383385 ) ) ( not ( = ?auto_383375 ?auto_383386 ) ) ( not ( = ?auto_383376 ?auto_383377 ) ) ( not ( = ?auto_383376 ?auto_383378 ) ) ( not ( = ?auto_383376 ?auto_383379 ) ) ( not ( = ?auto_383376 ?auto_383380 ) ) ( not ( = ?auto_383376 ?auto_383381 ) ) ( not ( = ?auto_383376 ?auto_383382 ) ) ( not ( = ?auto_383376 ?auto_383383 ) ) ( not ( = ?auto_383376 ?auto_383384 ) ) ( not ( = ?auto_383376 ?auto_383385 ) ) ( not ( = ?auto_383376 ?auto_383386 ) ) ( not ( = ?auto_383377 ?auto_383378 ) ) ( not ( = ?auto_383377 ?auto_383379 ) ) ( not ( = ?auto_383377 ?auto_383380 ) ) ( not ( = ?auto_383377 ?auto_383381 ) ) ( not ( = ?auto_383377 ?auto_383382 ) ) ( not ( = ?auto_383377 ?auto_383383 ) ) ( not ( = ?auto_383377 ?auto_383384 ) ) ( not ( = ?auto_383377 ?auto_383385 ) ) ( not ( = ?auto_383377 ?auto_383386 ) ) ( not ( = ?auto_383378 ?auto_383379 ) ) ( not ( = ?auto_383378 ?auto_383380 ) ) ( not ( = ?auto_383378 ?auto_383381 ) ) ( not ( = ?auto_383378 ?auto_383382 ) ) ( not ( = ?auto_383378 ?auto_383383 ) ) ( not ( = ?auto_383378 ?auto_383384 ) ) ( not ( = ?auto_383378 ?auto_383385 ) ) ( not ( = ?auto_383378 ?auto_383386 ) ) ( not ( = ?auto_383379 ?auto_383380 ) ) ( not ( = ?auto_383379 ?auto_383381 ) ) ( not ( = ?auto_383379 ?auto_383382 ) ) ( not ( = ?auto_383379 ?auto_383383 ) ) ( not ( = ?auto_383379 ?auto_383384 ) ) ( not ( = ?auto_383379 ?auto_383385 ) ) ( not ( = ?auto_383379 ?auto_383386 ) ) ( not ( = ?auto_383380 ?auto_383381 ) ) ( not ( = ?auto_383380 ?auto_383382 ) ) ( not ( = ?auto_383380 ?auto_383383 ) ) ( not ( = ?auto_383380 ?auto_383384 ) ) ( not ( = ?auto_383380 ?auto_383385 ) ) ( not ( = ?auto_383380 ?auto_383386 ) ) ( not ( = ?auto_383381 ?auto_383382 ) ) ( not ( = ?auto_383381 ?auto_383383 ) ) ( not ( = ?auto_383381 ?auto_383384 ) ) ( not ( = ?auto_383381 ?auto_383385 ) ) ( not ( = ?auto_383381 ?auto_383386 ) ) ( not ( = ?auto_383382 ?auto_383383 ) ) ( not ( = ?auto_383382 ?auto_383384 ) ) ( not ( = ?auto_383382 ?auto_383385 ) ) ( not ( = ?auto_383382 ?auto_383386 ) ) ( not ( = ?auto_383383 ?auto_383384 ) ) ( not ( = ?auto_383383 ?auto_383385 ) ) ( not ( = ?auto_383383 ?auto_383386 ) ) ( not ( = ?auto_383384 ?auto_383385 ) ) ( not ( = ?auto_383384 ?auto_383386 ) ) ( not ( = ?auto_383385 ?auto_383386 ) ) ( ON ?auto_383384 ?auto_383385 ) ( ON ?auto_383383 ?auto_383384 ) ( ON ?auto_383382 ?auto_383383 ) ( ON ?auto_383381 ?auto_383382 ) ( CLEAR ?auto_383379 ) ( ON ?auto_383380 ?auto_383381 ) ( CLEAR ?auto_383380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_383375 ?auto_383376 ?auto_383377 ?auto_383378 ?auto_383379 ?auto_383380 )
      ( MAKE-11PILE ?auto_383375 ?auto_383376 ?auto_383377 ?auto_383378 ?auto_383379 ?auto_383380 ?auto_383381 ?auto_383382 ?auto_383383 ?auto_383384 ?auto_383385 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383398 - BLOCK
      ?auto_383399 - BLOCK
      ?auto_383400 - BLOCK
      ?auto_383401 - BLOCK
      ?auto_383402 - BLOCK
      ?auto_383403 - BLOCK
      ?auto_383404 - BLOCK
      ?auto_383405 - BLOCK
      ?auto_383406 - BLOCK
      ?auto_383407 - BLOCK
      ?auto_383408 - BLOCK
    )
    :vars
    (
      ?auto_383409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383408 ?auto_383409 ) ( ON-TABLE ?auto_383398 ) ( ON ?auto_383399 ?auto_383398 ) ( ON ?auto_383400 ?auto_383399 ) ( ON ?auto_383401 ?auto_383400 ) ( ON ?auto_383402 ?auto_383401 ) ( not ( = ?auto_383398 ?auto_383399 ) ) ( not ( = ?auto_383398 ?auto_383400 ) ) ( not ( = ?auto_383398 ?auto_383401 ) ) ( not ( = ?auto_383398 ?auto_383402 ) ) ( not ( = ?auto_383398 ?auto_383403 ) ) ( not ( = ?auto_383398 ?auto_383404 ) ) ( not ( = ?auto_383398 ?auto_383405 ) ) ( not ( = ?auto_383398 ?auto_383406 ) ) ( not ( = ?auto_383398 ?auto_383407 ) ) ( not ( = ?auto_383398 ?auto_383408 ) ) ( not ( = ?auto_383398 ?auto_383409 ) ) ( not ( = ?auto_383399 ?auto_383400 ) ) ( not ( = ?auto_383399 ?auto_383401 ) ) ( not ( = ?auto_383399 ?auto_383402 ) ) ( not ( = ?auto_383399 ?auto_383403 ) ) ( not ( = ?auto_383399 ?auto_383404 ) ) ( not ( = ?auto_383399 ?auto_383405 ) ) ( not ( = ?auto_383399 ?auto_383406 ) ) ( not ( = ?auto_383399 ?auto_383407 ) ) ( not ( = ?auto_383399 ?auto_383408 ) ) ( not ( = ?auto_383399 ?auto_383409 ) ) ( not ( = ?auto_383400 ?auto_383401 ) ) ( not ( = ?auto_383400 ?auto_383402 ) ) ( not ( = ?auto_383400 ?auto_383403 ) ) ( not ( = ?auto_383400 ?auto_383404 ) ) ( not ( = ?auto_383400 ?auto_383405 ) ) ( not ( = ?auto_383400 ?auto_383406 ) ) ( not ( = ?auto_383400 ?auto_383407 ) ) ( not ( = ?auto_383400 ?auto_383408 ) ) ( not ( = ?auto_383400 ?auto_383409 ) ) ( not ( = ?auto_383401 ?auto_383402 ) ) ( not ( = ?auto_383401 ?auto_383403 ) ) ( not ( = ?auto_383401 ?auto_383404 ) ) ( not ( = ?auto_383401 ?auto_383405 ) ) ( not ( = ?auto_383401 ?auto_383406 ) ) ( not ( = ?auto_383401 ?auto_383407 ) ) ( not ( = ?auto_383401 ?auto_383408 ) ) ( not ( = ?auto_383401 ?auto_383409 ) ) ( not ( = ?auto_383402 ?auto_383403 ) ) ( not ( = ?auto_383402 ?auto_383404 ) ) ( not ( = ?auto_383402 ?auto_383405 ) ) ( not ( = ?auto_383402 ?auto_383406 ) ) ( not ( = ?auto_383402 ?auto_383407 ) ) ( not ( = ?auto_383402 ?auto_383408 ) ) ( not ( = ?auto_383402 ?auto_383409 ) ) ( not ( = ?auto_383403 ?auto_383404 ) ) ( not ( = ?auto_383403 ?auto_383405 ) ) ( not ( = ?auto_383403 ?auto_383406 ) ) ( not ( = ?auto_383403 ?auto_383407 ) ) ( not ( = ?auto_383403 ?auto_383408 ) ) ( not ( = ?auto_383403 ?auto_383409 ) ) ( not ( = ?auto_383404 ?auto_383405 ) ) ( not ( = ?auto_383404 ?auto_383406 ) ) ( not ( = ?auto_383404 ?auto_383407 ) ) ( not ( = ?auto_383404 ?auto_383408 ) ) ( not ( = ?auto_383404 ?auto_383409 ) ) ( not ( = ?auto_383405 ?auto_383406 ) ) ( not ( = ?auto_383405 ?auto_383407 ) ) ( not ( = ?auto_383405 ?auto_383408 ) ) ( not ( = ?auto_383405 ?auto_383409 ) ) ( not ( = ?auto_383406 ?auto_383407 ) ) ( not ( = ?auto_383406 ?auto_383408 ) ) ( not ( = ?auto_383406 ?auto_383409 ) ) ( not ( = ?auto_383407 ?auto_383408 ) ) ( not ( = ?auto_383407 ?auto_383409 ) ) ( not ( = ?auto_383408 ?auto_383409 ) ) ( ON ?auto_383407 ?auto_383408 ) ( ON ?auto_383406 ?auto_383407 ) ( ON ?auto_383405 ?auto_383406 ) ( ON ?auto_383404 ?auto_383405 ) ( CLEAR ?auto_383402 ) ( ON ?auto_383403 ?auto_383404 ) ( CLEAR ?auto_383403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_383398 ?auto_383399 ?auto_383400 ?auto_383401 ?auto_383402 ?auto_383403 )
      ( MAKE-11PILE ?auto_383398 ?auto_383399 ?auto_383400 ?auto_383401 ?auto_383402 ?auto_383403 ?auto_383404 ?auto_383405 ?auto_383406 ?auto_383407 ?auto_383408 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383421 - BLOCK
      ?auto_383422 - BLOCK
      ?auto_383423 - BLOCK
      ?auto_383424 - BLOCK
      ?auto_383425 - BLOCK
      ?auto_383426 - BLOCK
      ?auto_383427 - BLOCK
      ?auto_383428 - BLOCK
      ?auto_383429 - BLOCK
      ?auto_383430 - BLOCK
      ?auto_383431 - BLOCK
    )
    :vars
    (
      ?auto_383432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383431 ?auto_383432 ) ( ON-TABLE ?auto_383421 ) ( ON ?auto_383422 ?auto_383421 ) ( ON ?auto_383423 ?auto_383422 ) ( ON ?auto_383424 ?auto_383423 ) ( not ( = ?auto_383421 ?auto_383422 ) ) ( not ( = ?auto_383421 ?auto_383423 ) ) ( not ( = ?auto_383421 ?auto_383424 ) ) ( not ( = ?auto_383421 ?auto_383425 ) ) ( not ( = ?auto_383421 ?auto_383426 ) ) ( not ( = ?auto_383421 ?auto_383427 ) ) ( not ( = ?auto_383421 ?auto_383428 ) ) ( not ( = ?auto_383421 ?auto_383429 ) ) ( not ( = ?auto_383421 ?auto_383430 ) ) ( not ( = ?auto_383421 ?auto_383431 ) ) ( not ( = ?auto_383421 ?auto_383432 ) ) ( not ( = ?auto_383422 ?auto_383423 ) ) ( not ( = ?auto_383422 ?auto_383424 ) ) ( not ( = ?auto_383422 ?auto_383425 ) ) ( not ( = ?auto_383422 ?auto_383426 ) ) ( not ( = ?auto_383422 ?auto_383427 ) ) ( not ( = ?auto_383422 ?auto_383428 ) ) ( not ( = ?auto_383422 ?auto_383429 ) ) ( not ( = ?auto_383422 ?auto_383430 ) ) ( not ( = ?auto_383422 ?auto_383431 ) ) ( not ( = ?auto_383422 ?auto_383432 ) ) ( not ( = ?auto_383423 ?auto_383424 ) ) ( not ( = ?auto_383423 ?auto_383425 ) ) ( not ( = ?auto_383423 ?auto_383426 ) ) ( not ( = ?auto_383423 ?auto_383427 ) ) ( not ( = ?auto_383423 ?auto_383428 ) ) ( not ( = ?auto_383423 ?auto_383429 ) ) ( not ( = ?auto_383423 ?auto_383430 ) ) ( not ( = ?auto_383423 ?auto_383431 ) ) ( not ( = ?auto_383423 ?auto_383432 ) ) ( not ( = ?auto_383424 ?auto_383425 ) ) ( not ( = ?auto_383424 ?auto_383426 ) ) ( not ( = ?auto_383424 ?auto_383427 ) ) ( not ( = ?auto_383424 ?auto_383428 ) ) ( not ( = ?auto_383424 ?auto_383429 ) ) ( not ( = ?auto_383424 ?auto_383430 ) ) ( not ( = ?auto_383424 ?auto_383431 ) ) ( not ( = ?auto_383424 ?auto_383432 ) ) ( not ( = ?auto_383425 ?auto_383426 ) ) ( not ( = ?auto_383425 ?auto_383427 ) ) ( not ( = ?auto_383425 ?auto_383428 ) ) ( not ( = ?auto_383425 ?auto_383429 ) ) ( not ( = ?auto_383425 ?auto_383430 ) ) ( not ( = ?auto_383425 ?auto_383431 ) ) ( not ( = ?auto_383425 ?auto_383432 ) ) ( not ( = ?auto_383426 ?auto_383427 ) ) ( not ( = ?auto_383426 ?auto_383428 ) ) ( not ( = ?auto_383426 ?auto_383429 ) ) ( not ( = ?auto_383426 ?auto_383430 ) ) ( not ( = ?auto_383426 ?auto_383431 ) ) ( not ( = ?auto_383426 ?auto_383432 ) ) ( not ( = ?auto_383427 ?auto_383428 ) ) ( not ( = ?auto_383427 ?auto_383429 ) ) ( not ( = ?auto_383427 ?auto_383430 ) ) ( not ( = ?auto_383427 ?auto_383431 ) ) ( not ( = ?auto_383427 ?auto_383432 ) ) ( not ( = ?auto_383428 ?auto_383429 ) ) ( not ( = ?auto_383428 ?auto_383430 ) ) ( not ( = ?auto_383428 ?auto_383431 ) ) ( not ( = ?auto_383428 ?auto_383432 ) ) ( not ( = ?auto_383429 ?auto_383430 ) ) ( not ( = ?auto_383429 ?auto_383431 ) ) ( not ( = ?auto_383429 ?auto_383432 ) ) ( not ( = ?auto_383430 ?auto_383431 ) ) ( not ( = ?auto_383430 ?auto_383432 ) ) ( not ( = ?auto_383431 ?auto_383432 ) ) ( ON ?auto_383430 ?auto_383431 ) ( ON ?auto_383429 ?auto_383430 ) ( ON ?auto_383428 ?auto_383429 ) ( ON ?auto_383427 ?auto_383428 ) ( ON ?auto_383426 ?auto_383427 ) ( CLEAR ?auto_383424 ) ( ON ?auto_383425 ?auto_383426 ) ( CLEAR ?auto_383425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_383421 ?auto_383422 ?auto_383423 ?auto_383424 ?auto_383425 )
      ( MAKE-11PILE ?auto_383421 ?auto_383422 ?auto_383423 ?auto_383424 ?auto_383425 ?auto_383426 ?auto_383427 ?auto_383428 ?auto_383429 ?auto_383430 ?auto_383431 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383444 - BLOCK
      ?auto_383445 - BLOCK
      ?auto_383446 - BLOCK
      ?auto_383447 - BLOCK
      ?auto_383448 - BLOCK
      ?auto_383449 - BLOCK
      ?auto_383450 - BLOCK
      ?auto_383451 - BLOCK
      ?auto_383452 - BLOCK
      ?auto_383453 - BLOCK
      ?auto_383454 - BLOCK
    )
    :vars
    (
      ?auto_383455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383454 ?auto_383455 ) ( ON-TABLE ?auto_383444 ) ( ON ?auto_383445 ?auto_383444 ) ( ON ?auto_383446 ?auto_383445 ) ( ON ?auto_383447 ?auto_383446 ) ( not ( = ?auto_383444 ?auto_383445 ) ) ( not ( = ?auto_383444 ?auto_383446 ) ) ( not ( = ?auto_383444 ?auto_383447 ) ) ( not ( = ?auto_383444 ?auto_383448 ) ) ( not ( = ?auto_383444 ?auto_383449 ) ) ( not ( = ?auto_383444 ?auto_383450 ) ) ( not ( = ?auto_383444 ?auto_383451 ) ) ( not ( = ?auto_383444 ?auto_383452 ) ) ( not ( = ?auto_383444 ?auto_383453 ) ) ( not ( = ?auto_383444 ?auto_383454 ) ) ( not ( = ?auto_383444 ?auto_383455 ) ) ( not ( = ?auto_383445 ?auto_383446 ) ) ( not ( = ?auto_383445 ?auto_383447 ) ) ( not ( = ?auto_383445 ?auto_383448 ) ) ( not ( = ?auto_383445 ?auto_383449 ) ) ( not ( = ?auto_383445 ?auto_383450 ) ) ( not ( = ?auto_383445 ?auto_383451 ) ) ( not ( = ?auto_383445 ?auto_383452 ) ) ( not ( = ?auto_383445 ?auto_383453 ) ) ( not ( = ?auto_383445 ?auto_383454 ) ) ( not ( = ?auto_383445 ?auto_383455 ) ) ( not ( = ?auto_383446 ?auto_383447 ) ) ( not ( = ?auto_383446 ?auto_383448 ) ) ( not ( = ?auto_383446 ?auto_383449 ) ) ( not ( = ?auto_383446 ?auto_383450 ) ) ( not ( = ?auto_383446 ?auto_383451 ) ) ( not ( = ?auto_383446 ?auto_383452 ) ) ( not ( = ?auto_383446 ?auto_383453 ) ) ( not ( = ?auto_383446 ?auto_383454 ) ) ( not ( = ?auto_383446 ?auto_383455 ) ) ( not ( = ?auto_383447 ?auto_383448 ) ) ( not ( = ?auto_383447 ?auto_383449 ) ) ( not ( = ?auto_383447 ?auto_383450 ) ) ( not ( = ?auto_383447 ?auto_383451 ) ) ( not ( = ?auto_383447 ?auto_383452 ) ) ( not ( = ?auto_383447 ?auto_383453 ) ) ( not ( = ?auto_383447 ?auto_383454 ) ) ( not ( = ?auto_383447 ?auto_383455 ) ) ( not ( = ?auto_383448 ?auto_383449 ) ) ( not ( = ?auto_383448 ?auto_383450 ) ) ( not ( = ?auto_383448 ?auto_383451 ) ) ( not ( = ?auto_383448 ?auto_383452 ) ) ( not ( = ?auto_383448 ?auto_383453 ) ) ( not ( = ?auto_383448 ?auto_383454 ) ) ( not ( = ?auto_383448 ?auto_383455 ) ) ( not ( = ?auto_383449 ?auto_383450 ) ) ( not ( = ?auto_383449 ?auto_383451 ) ) ( not ( = ?auto_383449 ?auto_383452 ) ) ( not ( = ?auto_383449 ?auto_383453 ) ) ( not ( = ?auto_383449 ?auto_383454 ) ) ( not ( = ?auto_383449 ?auto_383455 ) ) ( not ( = ?auto_383450 ?auto_383451 ) ) ( not ( = ?auto_383450 ?auto_383452 ) ) ( not ( = ?auto_383450 ?auto_383453 ) ) ( not ( = ?auto_383450 ?auto_383454 ) ) ( not ( = ?auto_383450 ?auto_383455 ) ) ( not ( = ?auto_383451 ?auto_383452 ) ) ( not ( = ?auto_383451 ?auto_383453 ) ) ( not ( = ?auto_383451 ?auto_383454 ) ) ( not ( = ?auto_383451 ?auto_383455 ) ) ( not ( = ?auto_383452 ?auto_383453 ) ) ( not ( = ?auto_383452 ?auto_383454 ) ) ( not ( = ?auto_383452 ?auto_383455 ) ) ( not ( = ?auto_383453 ?auto_383454 ) ) ( not ( = ?auto_383453 ?auto_383455 ) ) ( not ( = ?auto_383454 ?auto_383455 ) ) ( ON ?auto_383453 ?auto_383454 ) ( ON ?auto_383452 ?auto_383453 ) ( ON ?auto_383451 ?auto_383452 ) ( ON ?auto_383450 ?auto_383451 ) ( ON ?auto_383449 ?auto_383450 ) ( CLEAR ?auto_383447 ) ( ON ?auto_383448 ?auto_383449 ) ( CLEAR ?auto_383448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_383444 ?auto_383445 ?auto_383446 ?auto_383447 ?auto_383448 )
      ( MAKE-11PILE ?auto_383444 ?auto_383445 ?auto_383446 ?auto_383447 ?auto_383448 ?auto_383449 ?auto_383450 ?auto_383451 ?auto_383452 ?auto_383453 ?auto_383454 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383467 - BLOCK
      ?auto_383468 - BLOCK
      ?auto_383469 - BLOCK
      ?auto_383470 - BLOCK
      ?auto_383471 - BLOCK
      ?auto_383472 - BLOCK
      ?auto_383473 - BLOCK
      ?auto_383474 - BLOCK
      ?auto_383475 - BLOCK
      ?auto_383476 - BLOCK
      ?auto_383477 - BLOCK
    )
    :vars
    (
      ?auto_383478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383477 ?auto_383478 ) ( ON-TABLE ?auto_383467 ) ( ON ?auto_383468 ?auto_383467 ) ( ON ?auto_383469 ?auto_383468 ) ( not ( = ?auto_383467 ?auto_383468 ) ) ( not ( = ?auto_383467 ?auto_383469 ) ) ( not ( = ?auto_383467 ?auto_383470 ) ) ( not ( = ?auto_383467 ?auto_383471 ) ) ( not ( = ?auto_383467 ?auto_383472 ) ) ( not ( = ?auto_383467 ?auto_383473 ) ) ( not ( = ?auto_383467 ?auto_383474 ) ) ( not ( = ?auto_383467 ?auto_383475 ) ) ( not ( = ?auto_383467 ?auto_383476 ) ) ( not ( = ?auto_383467 ?auto_383477 ) ) ( not ( = ?auto_383467 ?auto_383478 ) ) ( not ( = ?auto_383468 ?auto_383469 ) ) ( not ( = ?auto_383468 ?auto_383470 ) ) ( not ( = ?auto_383468 ?auto_383471 ) ) ( not ( = ?auto_383468 ?auto_383472 ) ) ( not ( = ?auto_383468 ?auto_383473 ) ) ( not ( = ?auto_383468 ?auto_383474 ) ) ( not ( = ?auto_383468 ?auto_383475 ) ) ( not ( = ?auto_383468 ?auto_383476 ) ) ( not ( = ?auto_383468 ?auto_383477 ) ) ( not ( = ?auto_383468 ?auto_383478 ) ) ( not ( = ?auto_383469 ?auto_383470 ) ) ( not ( = ?auto_383469 ?auto_383471 ) ) ( not ( = ?auto_383469 ?auto_383472 ) ) ( not ( = ?auto_383469 ?auto_383473 ) ) ( not ( = ?auto_383469 ?auto_383474 ) ) ( not ( = ?auto_383469 ?auto_383475 ) ) ( not ( = ?auto_383469 ?auto_383476 ) ) ( not ( = ?auto_383469 ?auto_383477 ) ) ( not ( = ?auto_383469 ?auto_383478 ) ) ( not ( = ?auto_383470 ?auto_383471 ) ) ( not ( = ?auto_383470 ?auto_383472 ) ) ( not ( = ?auto_383470 ?auto_383473 ) ) ( not ( = ?auto_383470 ?auto_383474 ) ) ( not ( = ?auto_383470 ?auto_383475 ) ) ( not ( = ?auto_383470 ?auto_383476 ) ) ( not ( = ?auto_383470 ?auto_383477 ) ) ( not ( = ?auto_383470 ?auto_383478 ) ) ( not ( = ?auto_383471 ?auto_383472 ) ) ( not ( = ?auto_383471 ?auto_383473 ) ) ( not ( = ?auto_383471 ?auto_383474 ) ) ( not ( = ?auto_383471 ?auto_383475 ) ) ( not ( = ?auto_383471 ?auto_383476 ) ) ( not ( = ?auto_383471 ?auto_383477 ) ) ( not ( = ?auto_383471 ?auto_383478 ) ) ( not ( = ?auto_383472 ?auto_383473 ) ) ( not ( = ?auto_383472 ?auto_383474 ) ) ( not ( = ?auto_383472 ?auto_383475 ) ) ( not ( = ?auto_383472 ?auto_383476 ) ) ( not ( = ?auto_383472 ?auto_383477 ) ) ( not ( = ?auto_383472 ?auto_383478 ) ) ( not ( = ?auto_383473 ?auto_383474 ) ) ( not ( = ?auto_383473 ?auto_383475 ) ) ( not ( = ?auto_383473 ?auto_383476 ) ) ( not ( = ?auto_383473 ?auto_383477 ) ) ( not ( = ?auto_383473 ?auto_383478 ) ) ( not ( = ?auto_383474 ?auto_383475 ) ) ( not ( = ?auto_383474 ?auto_383476 ) ) ( not ( = ?auto_383474 ?auto_383477 ) ) ( not ( = ?auto_383474 ?auto_383478 ) ) ( not ( = ?auto_383475 ?auto_383476 ) ) ( not ( = ?auto_383475 ?auto_383477 ) ) ( not ( = ?auto_383475 ?auto_383478 ) ) ( not ( = ?auto_383476 ?auto_383477 ) ) ( not ( = ?auto_383476 ?auto_383478 ) ) ( not ( = ?auto_383477 ?auto_383478 ) ) ( ON ?auto_383476 ?auto_383477 ) ( ON ?auto_383475 ?auto_383476 ) ( ON ?auto_383474 ?auto_383475 ) ( ON ?auto_383473 ?auto_383474 ) ( ON ?auto_383472 ?auto_383473 ) ( ON ?auto_383471 ?auto_383472 ) ( CLEAR ?auto_383469 ) ( ON ?auto_383470 ?auto_383471 ) ( CLEAR ?auto_383470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_383467 ?auto_383468 ?auto_383469 ?auto_383470 )
      ( MAKE-11PILE ?auto_383467 ?auto_383468 ?auto_383469 ?auto_383470 ?auto_383471 ?auto_383472 ?auto_383473 ?auto_383474 ?auto_383475 ?auto_383476 ?auto_383477 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383490 - BLOCK
      ?auto_383491 - BLOCK
      ?auto_383492 - BLOCK
      ?auto_383493 - BLOCK
      ?auto_383494 - BLOCK
      ?auto_383495 - BLOCK
      ?auto_383496 - BLOCK
      ?auto_383497 - BLOCK
      ?auto_383498 - BLOCK
      ?auto_383499 - BLOCK
      ?auto_383500 - BLOCK
    )
    :vars
    (
      ?auto_383501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383500 ?auto_383501 ) ( ON-TABLE ?auto_383490 ) ( ON ?auto_383491 ?auto_383490 ) ( ON ?auto_383492 ?auto_383491 ) ( not ( = ?auto_383490 ?auto_383491 ) ) ( not ( = ?auto_383490 ?auto_383492 ) ) ( not ( = ?auto_383490 ?auto_383493 ) ) ( not ( = ?auto_383490 ?auto_383494 ) ) ( not ( = ?auto_383490 ?auto_383495 ) ) ( not ( = ?auto_383490 ?auto_383496 ) ) ( not ( = ?auto_383490 ?auto_383497 ) ) ( not ( = ?auto_383490 ?auto_383498 ) ) ( not ( = ?auto_383490 ?auto_383499 ) ) ( not ( = ?auto_383490 ?auto_383500 ) ) ( not ( = ?auto_383490 ?auto_383501 ) ) ( not ( = ?auto_383491 ?auto_383492 ) ) ( not ( = ?auto_383491 ?auto_383493 ) ) ( not ( = ?auto_383491 ?auto_383494 ) ) ( not ( = ?auto_383491 ?auto_383495 ) ) ( not ( = ?auto_383491 ?auto_383496 ) ) ( not ( = ?auto_383491 ?auto_383497 ) ) ( not ( = ?auto_383491 ?auto_383498 ) ) ( not ( = ?auto_383491 ?auto_383499 ) ) ( not ( = ?auto_383491 ?auto_383500 ) ) ( not ( = ?auto_383491 ?auto_383501 ) ) ( not ( = ?auto_383492 ?auto_383493 ) ) ( not ( = ?auto_383492 ?auto_383494 ) ) ( not ( = ?auto_383492 ?auto_383495 ) ) ( not ( = ?auto_383492 ?auto_383496 ) ) ( not ( = ?auto_383492 ?auto_383497 ) ) ( not ( = ?auto_383492 ?auto_383498 ) ) ( not ( = ?auto_383492 ?auto_383499 ) ) ( not ( = ?auto_383492 ?auto_383500 ) ) ( not ( = ?auto_383492 ?auto_383501 ) ) ( not ( = ?auto_383493 ?auto_383494 ) ) ( not ( = ?auto_383493 ?auto_383495 ) ) ( not ( = ?auto_383493 ?auto_383496 ) ) ( not ( = ?auto_383493 ?auto_383497 ) ) ( not ( = ?auto_383493 ?auto_383498 ) ) ( not ( = ?auto_383493 ?auto_383499 ) ) ( not ( = ?auto_383493 ?auto_383500 ) ) ( not ( = ?auto_383493 ?auto_383501 ) ) ( not ( = ?auto_383494 ?auto_383495 ) ) ( not ( = ?auto_383494 ?auto_383496 ) ) ( not ( = ?auto_383494 ?auto_383497 ) ) ( not ( = ?auto_383494 ?auto_383498 ) ) ( not ( = ?auto_383494 ?auto_383499 ) ) ( not ( = ?auto_383494 ?auto_383500 ) ) ( not ( = ?auto_383494 ?auto_383501 ) ) ( not ( = ?auto_383495 ?auto_383496 ) ) ( not ( = ?auto_383495 ?auto_383497 ) ) ( not ( = ?auto_383495 ?auto_383498 ) ) ( not ( = ?auto_383495 ?auto_383499 ) ) ( not ( = ?auto_383495 ?auto_383500 ) ) ( not ( = ?auto_383495 ?auto_383501 ) ) ( not ( = ?auto_383496 ?auto_383497 ) ) ( not ( = ?auto_383496 ?auto_383498 ) ) ( not ( = ?auto_383496 ?auto_383499 ) ) ( not ( = ?auto_383496 ?auto_383500 ) ) ( not ( = ?auto_383496 ?auto_383501 ) ) ( not ( = ?auto_383497 ?auto_383498 ) ) ( not ( = ?auto_383497 ?auto_383499 ) ) ( not ( = ?auto_383497 ?auto_383500 ) ) ( not ( = ?auto_383497 ?auto_383501 ) ) ( not ( = ?auto_383498 ?auto_383499 ) ) ( not ( = ?auto_383498 ?auto_383500 ) ) ( not ( = ?auto_383498 ?auto_383501 ) ) ( not ( = ?auto_383499 ?auto_383500 ) ) ( not ( = ?auto_383499 ?auto_383501 ) ) ( not ( = ?auto_383500 ?auto_383501 ) ) ( ON ?auto_383499 ?auto_383500 ) ( ON ?auto_383498 ?auto_383499 ) ( ON ?auto_383497 ?auto_383498 ) ( ON ?auto_383496 ?auto_383497 ) ( ON ?auto_383495 ?auto_383496 ) ( ON ?auto_383494 ?auto_383495 ) ( CLEAR ?auto_383492 ) ( ON ?auto_383493 ?auto_383494 ) ( CLEAR ?auto_383493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_383490 ?auto_383491 ?auto_383492 ?auto_383493 )
      ( MAKE-11PILE ?auto_383490 ?auto_383491 ?auto_383492 ?auto_383493 ?auto_383494 ?auto_383495 ?auto_383496 ?auto_383497 ?auto_383498 ?auto_383499 ?auto_383500 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383513 - BLOCK
      ?auto_383514 - BLOCK
      ?auto_383515 - BLOCK
      ?auto_383516 - BLOCK
      ?auto_383517 - BLOCK
      ?auto_383518 - BLOCK
      ?auto_383519 - BLOCK
      ?auto_383520 - BLOCK
      ?auto_383521 - BLOCK
      ?auto_383522 - BLOCK
      ?auto_383523 - BLOCK
    )
    :vars
    (
      ?auto_383524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383523 ?auto_383524 ) ( ON-TABLE ?auto_383513 ) ( ON ?auto_383514 ?auto_383513 ) ( not ( = ?auto_383513 ?auto_383514 ) ) ( not ( = ?auto_383513 ?auto_383515 ) ) ( not ( = ?auto_383513 ?auto_383516 ) ) ( not ( = ?auto_383513 ?auto_383517 ) ) ( not ( = ?auto_383513 ?auto_383518 ) ) ( not ( = ?auto_383513 ?auto_383519 ) ) ( not ( = ?auto_383513 ?auto_383520 ) ) ( not ( = ?auto_383513 ?auto_383521 ) ) ( not ( = ?auto_383513 ?auto_383522 ) ) ( not ( = ?auto_383513 ?auto_383523 ) ) ( not ( = ?auto_383513 ?auto_383524 ) ) ( not ( = ?auto_383514 ?auto_383515 ) ) ( not ( = ?auto_383514 ?auto_383516 ) ) ( not ( = ?auto_383514 ?auto_383517 ) ) ( not ( = ?auto_383514 ?auto_383518 ) ) ( not ( = ?auto_383514 ?auto_383519 ) ) ( not ( = ?auto_383514 ?auto_383520 ) ) ( not ( = ?auto_383514 ?auto_383521 ) ) ( not ( = ?auto_383514 ?auto_383522 ) ) ( not ( = ?auto_383514 ?auto_383523 ) ) ( not ( = ?auto_383514 ?auto_383524 ) ) ( not ( = ?auto_383515 ?auto_383516 ) ) ( not ( = ?auto_383515 ?auto_383517 ) ) ( not ( = ?auto_383515 ?auto_383518 ) ) ( not ( = ?auto_383515 ?auto_383519 ) ) ( not ( = ?auto_383515 ?auto_383520 ) ) ( not ( = ?auto_383515 ?auto_383521 ) ) ( not ( = ?auto_383515 ?auto_383522 ) ) ( not ( = ?auto_383515 ?auto_383523 ) ) ( not ( = ?auto_383515 ?auto_383524 ) ) ( not ( = ?auto_383516 ?auto_383517 ) ) ( not ( = ?auto_383516 ?auto_383518 ) ) ( not ( = ?auto_383516 ?auto_383519 ) ) ( not ( = ?auto_383516 ?auto_383520 ) ) ( not ( = ?auto_383516 ?auto_383521 ) ) ( not ( = ?auto_383516 ?auto_383522 ) ) ( not ( = ?auto_383516 ?auto_383523 ) ) ( not ( = ?auto_383516 ?auto_383524 ) ) ( not ( = ?auto_383517 ?auto_383518 ) ) ( not ( = ?auto_383517 ?auto_383519 ) ) ( not ( = ?auto_383517 ?auto_383520 ) ) ( not ( = ?auto_383517 ?auto_383521 ) ) ( not ( = ?auto_383517 ?auto_383522 ) ) ( not ( = ?auto_383517 ?auto_383523 ) ) ( not ( = ?auto_383517 ?auto_383524 ) ) ( not ( = ?auto_383518 ?auto_383519 ) ) ( not ( = ?auto_383518 ?auto_383520 ) ) ( not ( = ?auto_383518 ?auto_383521 ) ) ( not ( = ?auto_383518 ?auto_383522 ) ) ( not ( = ?auto_383518 ?auto_383523 ) ) ( not ( = ?auto_383518 ?auto_383524 ) ) ( not ( = ?auto_383519 ?auto_383520 ) ) ( not ( = ?auto_383519 ?auto_383521 ) ) ( not ( = ?auto_383519 ?auto_383522 ) ) ( not ( = ?auto_383519 ?auto_383523 ) ) ( not ( = ?auto_383519 ?auto_383524 ) ) ( not ( = ?auto_383520 ?auto_383521 ) ) ( not ( = ?auto_383520 ?auto_383522 ) ) ( not ( = ?auto_383520 ?auto_383523 ) ) ( not ( = ?auto_383520 ?auto_383524 ) ) ( not ( = ?auto_383521 ?auto_383522 ) ) ( not ( = ?auto_383521 ?auto_383523 ) ) ( not ( = ?auto_383521 ?auto_383524 ) ) ( not ( = ?auto_383522 ?auto_383523 ) ) ( not ( = ?auto_383522 ?auto_383524 ) ) ( not ( = ?auto_383523 ?auto_383524 ) ) ( ON ?auto_383522 ?auto_383523 ) ( ON ?auto_383521 ?auto_383522 ) ( ON ?auto_383520 ?auto_383521 ) ( ON ?auto_383519 ?auto_383520 ) ( ON ?auto_383518 ?auto_383519 ) ( ON ?auto_383517 ?auto_383518 ) ( ON ?auto_383516 ?auto_383517 ) ( CLEAR ?auto_383514 ) ( ON ?auto_383515 ?auto_383516 ) ( CLEAR ?auto_383515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_383513 ?auto_383514 ?auto_383515 )
      ( MAKE-11PILE ?auto_383513 ?auto_383514 ?auto_383515 ?auto_383516 ?auto_383517 ?auto_383518 ?auto_383519 ?auto_383520 ?auto_383521 ?auto_383522 ?auto_383523 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383536 - BLOCK
      ?auto_383537 - BLOCK
      ?auto_383538 - BLOCK
      ?auto_383539 - BLOCK
      ?auto_383540 - BLOCK
      ?auto_383541 - BLOCK
      ?auto_383542 - BLOCK
      ?auto_383543 - BLOCK
      ?auto_383544 - BLOCK
      ?auto_383545 - BLOCK
      ?auto_383546 - BLOCK
    )
    :vars
    (
      ?auto_383547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383546 ?auto_383547 ) ( ON-TABLE ?auto_383536 ) ( ON ?auto_383537 ?auto_383536 ) ( not ( = ?auto_383536 ?auto_383537 ) ) ( not ( = ?auto_383536 ?auto_383538 ) ) ( not ( = ?auto_383536 ?auto_383539 ) ) ( not ( = ?auto_383536 ?auto_383540 ) ) ( not ( = ?auto_383536 ?auto_383541 ) ) ( not ( = ?auto_383536 ?auto_383542 ) ) ( not ( = ?auto_383536 ?auto_383543 ) ) ( not ( = ?auto_383536 ?auto_383544 ) ) ( not ( = ?auto_383536 ?auto_383545 ) ) ( not ( = ?auto_383536 ?auto_383546 ) ) ( not ( = ?auto_383536 ?auto_383547 ) ) ( not ( = ?auto_383537 ?auto_383538 ) ) ( not ( = ?auto_383537 ?auto_383539 ) ) ( not ( = ?auto_383537 ?auto_383540 ) ) ( not ( = ?auto_383537 ?auto_383541 ) ) ( not ( = ?auto_383537 ?auto_383542 ) ) ( not ( = ?auto_383537 ?auto_383543 ) ) ( not ( = ?auto_383537 ?auto_383544 ) ) ( not ( = ?auto_383537 ?auto_383545 ) ) ( not ( = ?auto_383537 ?auto_383546 ) ) ( not ( = ?auto_383537 ?auto_383547 ) ) ( not ( = ?auto_383538 ?auto_383539 ) ) ( not ( = ?auto_383538 ?auto_383540 ) ) ( not ( = ?auto_383538 ?auto_383541 ) ) ( not ( = ?auto_383538 ?auto_383542 ) ) ( not ( = ?auto_383538 ?auto_383543 ) ) ( not ( = ?auto_383538 ?auto_383544 ) ) ( not ( = ?auto_383538 ?auto_383545 ) ) ( not ( = ?auto_383538 ?auto_383546 ) ) ( not ( = ?auto_383538 ?auto_383547 ) ) ( not ( = ?auto_383539 ?auto_383540 ) ) ( not ( = ?auto_383539 ?auto_383541 ) ) ( not ( = ?auto_383539 ?auto_383542 ) ) ( not ( = ?auto_383539 ?auto_383543 ) ) ( not ( = ?auto_383539 ?auto_383544 ) ) ( not ( = ?auto_383539 ?auto_383545 ) ) ( not ( = ?auto_383539 ?auto_383546 ) ) ( not ( = ?auto_383539 ?auto_383547 ) ) ( not ( = ?auto_383540 ?auto_383541 ) ) ( not ( = ?auto_383540 ?auto_383542 ) ) ( not ( = ?auto_383540 ?auto_383543 ) ) ( not ( = ?auto_383540 ?auto_383544 ) ) ( not ( = ?auto_383540 ?auto_383545 ) ) ( not ( = ?auto_383540 ?auto_383546 ) ) ( not ( = ?auto_383540 ?auto_383547 ) ) ( not ( = ?auto_383541 ?auto_383542 ) ) ( not ( = ?auto_383541 ?auto_383543 ) ) ( not ( = ?auto_383541 ?auto_383544 ) ) ( not ( = ?auto_383541 ?auto_383545 ) ) ( not ( = ?auto_383541 ?auto_383546 ) ) ( not ( = ?auto_383541 ?auto_383547 ) ) ( not ( = ?auto_383542 ?auto_383543 ) ) ( not ( = ?auto_383542 ?auto_383544 ) ) ( not ( = ?auto_383542 ?auto_383545 ) ) ( not ( = ?auto_383542 ?auto_383546 ) ) ( not ( = ?auto_383542 ?auto_383547 ) ) ( not ( = ?auto_383543 ?auto_383544 ) ) ( not ( = ?auto_383543 ?auto_383545 ) ) ( not ( = ?auto_383543 ?auto_383546 ) ) ( not ( = ?auto_383543 ?auto_383547 ) ) ( not ( = ?auto_383544 ?auto_383545 ) ) ( not ( = ?auto_383544 ?auto_383546 ) ) ( not ( = ?auto_383544 ?auto_383547 ) ) ( not ( = ?auto_383545 ?auto_383546 ) ) ( not ( = ?auto_383545 ?auto_383547 ) ) ( not ( = ?auto_383546 ?auto_383547 ) ) ( ON ?auto_383545 ?auto_383546 ) ( ON ?auto_383544 ?auto_383545 ) ( ON ?auto_383543 ?auto_383544 ) ( ON ?auto_383542 ?auto_383543 ) ( ON ?auto_383541 ?auto_383542 ) ( ON ?auto_383540 ?auto_383541 ) ( ON ?auto_383539 ?auto_383540 ) ( CLEAR ?auto_383537 ) ( ON ?auto_383538 ?auto_383539 ) ( CLEAR ?auto_383538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_383536 ?auto_383537 ?auto_383538 )
      ( MAKE-11PILE ?auto_383536 ?auto_383537 ?auto_383538 ?auto_383539 ?auto_383540 ?auto_383541 ?auto_383542 ?auto_383543 ?auto_383544 ?auto_383545 ?auto_383546 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383559 - BLOCK
      ?auto_383560 - BLOCK
      ?auto_383561 - BLOCK
      ?auto_383562 - BLOCK
      ?auto_383563 - BLOCK
      ?auto_383564 - BLOCK
      ?auto_383565 - BLOCK
      ?auto_383566 - BLOCK
      ?auto_383567 - BLOCK
      ?auto_383568 - BLOCK
      ?auto_383569 - BLOCK
    )
    :vars
    (
      ?auto_383570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383569 ?auto_383570 ) ( ON-TABLE ?auto_383559 ) ( not ( = ?auto_383559 ?auto_383560 ) ) ( not ( = ?auto_383559 ?auto_383561 ) ) ( not ( = ?auto_383559 ?auto_383562 ) ) ( not ( = ?auto_383559 ?auto_383563 ) ) ( not ( = ?auto_383559 ?auto_383564 ) ) ( not ( = ?auto_383559 ?auto_383565 ) ) ( not ( = ?auto_383559 ?auto_383566 ) ) ( not ( = ?auto_383559 ?auto_383567 ) ) ( not ( = ?auto_383559 ?auto_383568 ) ) ( not ( = ?auto_383559 ?auto_383569 ) ) ( not ( = ?auto_383559 ?auto_383570 ) ) ( not ( = ?auto_383560 ?auto_383561 ) ) ( not ( = ?auto_383560 ?auto_383562 ) ) ( not ( = ?auto_383560 ?auto_383563 ) ) ( not ( = ?auto_383560 ?auto_383564 ) ) ( not ( = ?auto_383560 ?auto_383565 ) ) ( not ( = ?auto_383560 ?auto_383566 ) ) ( not ( = ?auto_383560 ?auto_383567 ) ) ( not ( = ?auto_383560 ?auto_383568 ) ) ( not ( = ?auto_383560 ?auto_383569 ) ) ( not ( = ?auto_383560 ?auto_383570 ) ) ( not ( = ?auto_383561 ?auto_383562 ) ) ( not ( = ?auto_383561 ?auto_383563 ) ) ( not ( = ?auto_383561 ?auto_383564 ) ) ( not ( = ?auto_383561 ?auto_383565 ) ) ( not ( = ?auto_383561 ?auto_383566 ) ) ( not ( = ?auto_383561 ?auto_383567 ) ) ( not ( = ?auto_383561 ?auto_383568 ) ) ( not ( = ?auto_383561 ?auto_383569 ) ) ( not ( = ?auto_383561 ?auto_383570 ) ) ( not ( = ?auto_383562 ?auto_383563 ) ) ( not ( = ?auto_383562 ?auto_383564 ) ) ( not ( = ?auto_383562 ?auto_383565 ) ) ( not ( = ?auto_383562 ?auto_383566 ) ) ( not ( = ?auto_383562 ?auto_383567 ) ) ( not ( = ?auto_383562 ?auto_383568 ) ) ( not ( = ?auto_383562 ?auto_383569 ) ) ( not ( = ?auto_383562 ?auto_383570 ) ) ( not ( = ?auto_383563 ?auto_383564 ) ) ( not ( = ?auto_383563 ?auto_383565 ) ) ( not ( = ?auto_383563 ?auto_383566 ) ) ( not ( = ?auto_383563 ?auto_383567 ) ) ( not ( = ?auto_383563 ?auto_383568 ) ) ( not ( = ?auto_383563 ?auto_383569 ) ) ( not ( = ?auto_383563 ?auto_383570 ) ) ( not ( = ?auto_383564 ?auto_383565 ) ) ( not ( = ?auto_383564 ?auto_383566 ) ) ( not ( = ?auto_383564 ?auto_383567 ) ) ( not ( = ?auto_383564 ?auto_383568 ) ) ( not ( = ?auto_383564 ?auto_383569 ) ) ( not ( = ?auto_383564 ?auto_383570 ) ) ( not ( = ?auto_383565 ?auto_383566 ) ) ( not ( = ?auto_383565 ?auto_383567 ) ) ( not ( = ?auto_383565 ?auto_383568 ) ) ( not ( = ?auto_383565 ?auto_383569 ) ) ( not ( = ?auto_383565 ?auto_383570 ) ) ( not ( = ?auto_383566 ?auto_383567 ) ) ( not ( = ?auto_383566 ?auto_383568 ) ) ( not ( = ?auto_383566 ?auto_383569 ) ) ( not ( = ?auto_383566 ?auto_383570 ) ) ( not ( = ?auto_383567 ?auto_383568 ) ) ( not ( = ?auto_383567 ?auto_383569 ) ) ( not ( = ?auto_383567 ?auto_383570 ) ) ( not ( = ?auto_383568 ?auto_383569 ) ) ( not ( = ?auto_383568 ?auto_383570 ) ) ( not ( = ?auto_383569 ?auto_383570 ) ) ( ON ?auto_383568 ?auto_383569 ) ( ON ?auto_383567 ?auto_383568 ) ( ON ?auto_383566 ?auto_383567 ) ( ON ?auto_383565 ?auto_383566 ) ( ON ?auto_383564 ?auto_383565 ) ( ON ?auto_383563 ?auto_383564 ) ( ON ?auto_383562 ?auto_383563 ) ( ON ?auto_383561 ?auto_383562 ) ( CLEAR ?auto_383559 ) ( ON ?auto_383560 ?auto_383561 ) ( CLEAR ?auto_383560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_383559 ?auto_383560 )
      ( MAKE-11PILE ?auto_383559 ?auto_383560 ?auto_383561 ?auto_383562 ?auto_383563 ?auto_383564 ?auto_383565 ?auto_383566 ?auto_383567 ?auto_383568 ?auto_383569 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383582 - BLOCK
      ?auto_383583 - BLOCK
      ?auto_383584 - BLOCK
      ?auto_383585 - BLOCK
      ?auto_383586 - BLOCK
      ?auto_383587 - BLOCK
      ?auto_383588 - BLOCK
      ?auto_383589 - BLOCK
      ?auto_383590 - BLOCK
      ?auto_383591 - BLOCK
      ?auto_383592 - BLOCK
    )
    :vars
    (
      ?auto_383593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383592 ?auto_383593 ) ( ON-TABLE ?auto_383582 ) ( not ( = ?auto_383582 ?auto_383583 ) ) ( not ( = ?auto_383582 ?auto_383584 ) ) ( not ( = ?auto_383582 ?auto_383585 ) ) ( not ( = ?auto_383582 ?auto_383586 ) ) ( not ( = ?auto_383582 ?auto_383587 ) ) ( not ( = ?auto_383582 ?auto_383588 ) ) ( not ( = ?auto_383582 ?auto_383589 ) ) ( not ( = ?auto_383582 ?auto_383590 ) ) ( not ( = ?auto_383582 ?auto_383591 ) ) ( not ( = ?auto_383582 ?auto_383592 ) ) ( not ( = ?auto_383582 ?auto_383593 ) ) ( not ( = ?auto_383583 ?auto_383584 ) ) ( not ( = ?auto_383583 ?auto_383585 ) ) ( not ( = ?auto_383583 ?auto_383586 ) ) ( not ( = ?auto_383583 ?auto_383587 ) ) ( not ( = ?auto_383583 ?auto_383588 ) ) ( not ( = ?auto_383583 ?auto_383589 ) ) ( not ( = ?auto_383583 ?auto_383590 ) ) ( not ( = ?auto_383583 ?auto_383591 ) ) ( not ( = ?auto_383583 ?auto_383592 ) ) ( not ( = ?auto_383583 ?auto_383593 ) ) ( not ( = ?auto_383584 ?auto_383585 ) ) ( not ( = ?auto_383584 ?auto_383586 ) ) ( not ( = ?auto_383584 ?auto_383587 ) ) ( not ( = ?auto_383584 ?auto_383588 ) ) ( not ( = ?auto_383584 ?auto_383589 ) ) ( not ( = ?auto_383584 ?auto_383590 ) ) ( not ( = ?auto_383584 ?auto_383591 ) ) ( not ( = ?auto_383584 ?auto_383592 ) ) ( not ( = ?auto_383584 ?auto_383593 ) ) ( not ( = ?auto_383585 ?auto_383586 ) ) ( not ( = ?auto_383585 ?auto_383587 ) ) ( not ( = ?auto_383585 ?auto_383588 ) ) ( not ( = ?auto_383585 ?auto_383589 ) ) ( not ( = ?auto_383585 ?auto_383590 ) ) ( not ( = ?auto_383585 ?auto_383591 ) ) ( not ( = ?auto_383585 ?auto_383592 ) ) ( not ( = ?auto_383585 ?auto_383593 ) ) ( not ( = ?auto_383586 ?auto_383587 ) ) ( not ( = ?auto_383586 ?auto_383588 ) ) ( not ( = ?auto_383586 ?auto_383589 ) ) ( not ( = ?auto_383586 ?auto_383590 ) ) ( not ( = ?auto_383586 ?auto_383591 ) ) ( not ( = ?auto_383586 ?auto_383592 ) ) ( not ( = ?auto_383586 ?auto_383593 ) ) ( not ( = ?auto_383587 ?auto_383588 ) ) ( not ( = ?auto_383587 ?auto_383589 ) ) ( not ( = ?auto_383587 ?auto_383590 ) ) ( not ( = ?auto_383587 ?auto_383591 ) ) ( not ( = ?auto_383587 ?auto_383592 ) ) ( not ( = ?auto_383587 ?auto_383593 ) ) ( not ( = ?auto_383588 ?auto_383589 ) ) ( not ( = ?auto_383588 ?auto_383590 ) ) ( not ( = ?auto_383588 ?auto_383591 ) ) ( not ( = ?auto_383588 ?auto_383592 ) ) ( not ( = ?auto_383588 ?auto_383593 ) ) ( not ( = ?auto_383589 ?auto_383590 ) ) ( not ( = ?auto_383589 ?auto_383591 ) ) ( not ( = ?auto_383589 ?auto_383592 ) ) ( not ( = ?auto_383589 ?auto_383593 ) ) ( not ( = ?auto_383590 ?auto_383591 ) ) ( not ( = ?auto_383590 ?auto_383592 ) ) ( not ( = ?auto_383590 ?auto_383593 ) ) ( not ( = ?auto_383591 ?auto_383592 ) ) ( not ( = ?auto_383591 ?auto_383593 ) ) ( not ( = ?auto_383592 ?auto_383593 ) ) ( ON ?auto_383591 ?auto_383592 ) ( ON ?auto_383590 ?auto_383591 ) ( ON ?auto_383589 ?auto_383590 ) ( ON ?auto_383588 ?auto_383589 ) ( ON ?auto_383587 ?auto_383588 ) ( ON ?auto_383586 ?auto_383587 ) ( ON ?auto_383585 ?auto_383586 ) ( ON ?auto_383584 ?auto_383585 ) ( CLEAR ?auto_383582 ) ( ON ?auto_383583 ?auto_383584 ) ( CLEAR ?auto_383583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_383582 ?auto_383583 )
      ( MAKE-11PILE ?auto_383582 ?auto_383583 ?auto_383584 ?auto_383585 ?auto_383586 ?auto_383587 ?auto_383588 ?auto_383589 ?auto_383590 ?auto_383591 ?auto_383592 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383605 - BLOCK
      ?auto_383606 - BLOCK
      ?auto_383607 - BLOCK
      ?auto_383608 - BLOCK
      ?auto_383609 - BLOCK
      ?auto_383610 - BLOCK
      ?auto_383611 - BLOCK
      ?auto_383612 - BLOCK
      ?auto_383613 - BLOCK
      ?auto_383614 - BLOCK
      ?auto_383615 - BLOCK
    )
    :vars
    (
      ?auto_383616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383615 ?auto_383616 ) ( not ( = ?auto_383605 ?auto_383606 ) ) ( not ( = ?auto_383605 ?auto_383607 ) ) ( not ( = ?auto_383605 ?auto_383608 ) ) ( not ( = ?auto_383605 ?auto_383609 ) ) ( not ( = ?auto_383605 ?auto_383610 ) ) ( not ( = ?auto_383605 ?auto_383611 ) ) ( not ( = ?auto_383605 ?auto_383612 ) ) ( not ( = ?auto_383605 ?auto_383613 ) ) ( not ( = ?auto_383605 ?auto_383614 ) ) ( not ( = ?auto_383605 ?auto_383615 ) ) ( not ( = ?auto_383605 ?auto_383616 ) ) ( not ( = ?auto_383606 ?auto_383607 ) ) ( not ( = ?auto_383606 ?auto_383608 ) ) ( not ( = ?auto_383606 ?auto_383609 ) ) ( not ( = ?auto_383606 ?auto_383610 ) ) ( not ( = ?auto_383606 ?auto_383611 ) ) ( not ( = ?auto_383606 ?auto_383612 ) ) ( not ( = ?auto_383606 ?auto_383613 ) ) ( not ( = ?auto_383606 ?auto_383614 ) ) ( not ( = ?auto_383606 ?auto_383615 ) ) ( not ( = ?auto_383606 ?auto_383616 ) ) ( not ( = ?auto_383607 ?auto_383608 ) ) ( not ( = ?auto_383607 ?auto_383609 ) ) ( not ( = ?auto_383607 ?auto_383610 ) ) ( not ( = ?auto_383607 ?auto_383611 ) ) ( not ( = ?auto_383607 ?auto_383612 ) ) ( not ( = ?auto_383607 ?auto_383613 ) ) ( not ( = ?auto_383607 ?auto_383614 ) ) ( not ( = ?auto_383607 ?auto_383615 ) ) ( not ( = ?auto_383607 ?auto_383616 ) ) ( not ( = ?auto_383608 ?auto_383609 ) ) ( not ( = ?auto_383608 ?auto_383610 ) ) ( not ( = ?auto_383608 ?auto_383611 ) ) ( not ( = ?auto_383608 ?auto_383612 ) ) ( not ( = ?auto_383608 ?auto_383613 ) ) ( not ( = ?auto_383608 ?auto_383614 ) ) ( not ( = ?auto_383608 ?auto_383615 ) ) ( not ( = ?auto_383608 ?auto_383616 ) ) ( not ( = ?auto_383609 ?auto_383610 ) ) ( not ( = ?auto_383609 ?auto_383611 ) ) ( not ( = ?auto_383609 ?auto_383612 ) ) ( not ( = ?auto_383609 ?auto_383613 ) ) ( not ( = ?auto_383609 ?auto_383614 ) ) ( not ( = ?auto_383609 ?auto_383615 ) ) ( not ( = ?auto_383609 ?auto_383616 ) ) ( not ( = ?auto_383610 ?auto_383611 ) ) ( not ( = ?auto_383610 ?auto_383612 ) ) ( not ( = ?auto_383610 ?auto_383613 ) ) ( not ( = ?auto_383610 ?auto_383614 ) ) ( not ( = ?auto_383610 ?auto_383615 ) ) ( not ( = ?auto_383610 ?auto_383616 ) ) ( not ( = ?auto_383611 ?auto_383612 ) ) ( not ( = ?auto_383611 ?auto_383613 ) ) ( not ( = ?auto_383611 ?auto_383614 ) ) ( not ( = ?auto_383611 ?auto_383615 ) ) ( not ( = ?auto_383611 ?auto_383616 ) ) ( not ( = ?auto_383612 ?auto_383613 ) ) ( not ( = ?auto_383612 ?auto_383614 ) ) ( not ( = ?auto_383612 ?auto_383615 ) ) ( not ( = ?auto_383612 ?auto_383616 ) ) ( not ( = ?auto_383613 ?auto_383614 ) ) ( not ( = ?auto_383613 ?auto_383615 ) ) ( not ( = ?auto_383613 ?auto_383616 ) ) ( not ( = ?auto_383614 ?auto_383615 ) ) ( not ( = ?auto_383614 ?auto_383616 ) ) ( not ( = ?auto_383615 ?auto_383616 ) ) ( ON ?auto_383614 ?auto_383615 ) ( ON ?auto_383613 ?auto_383614 ) ( ON ?auto_383612 ?auto_383613 ) ( ON ?auto_383611 ?auto_383612 ) ( ON ?auto_383610 ?auto_383611 ) ( ON ?auto_383609 ?auto_383610 ) ( ON ?auto_383608 ?auto_383609 ) ( ON ?auto_383607 ?auto_383608 ) ( ON ?auto_383606 ?auto_383607 ) ( ON ?auto_383605 ?auto_383606 ) ( CLEAR ?auto_383605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_383605 )
      ( MAKE-11PILE ?auto_383605 ?auto_383606 ?auto_383607 ?auto_383608 ?auto_383609 ?auto_383610 ?auto_383611 ?auto_383612 ?auto_383613 ?auto_383614 ?auto_383615 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_383628 - BLOCK
      ?auto_383629 - BLOCK
      ?auto_383630 - BLOCK
      ?auto_383631 - BLOCK
      ?auto_383632 - BLOCK
      ?auto_383633 - BLOCK
      ?auto_383634 - BLOCK
      ?auto_383635 - BLOCK
      ?auto_383636 - BLOCK
      ?auto_383637 - BLOCK
      ?auto_383638 - BLOCK
    )
    :vars
    (
      ?auto_383639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383638 ?auto_383639 ) ( not ( = ?auto_383628 ?auto_383629 ) ) ( not ( = ?auto_383628 ?auto_383630 ) ) ( not ( = ?auto_383628 ?auto_383631 ) ) ( not ( = ?auto_383628 ?auto_383632 ) ) ( not ( = ?auto_383628 ?auto_383633 ) ) ( not ( = ?auto_383628 ?auto_383634 ) ) ( not ( = ?auto_383628 ?auto_383635 ) ) ( not ( = ?auto_383628 ?auto_383636 ) ) ( not ( = ?auto_383628 ?auto_383637 ) ) ( not ( = ?auto_383628 ?auto_383638 ) ) ( not ( = ?auto_383628 ?auto_383639 ) ) ( not ( = ?auto_383629 ?auto_383630 ) ) ( not ( = ?auto_383629 ?auto_383631 ) ) ( not ( = ?auto_383629 ?auto_383632 ) ) ( not ( = ?auto_383629 ?auto_383633 ) ) ( not ( = ?auto_383629 ?auto_383634 ) ) ( not ( = ?auto_383629 ?auto_383635 ) ) ( not ( = ?auto_383629 ?auto_383636 ) ) ( not ( = ?auto_383629 ?auto_383637 ) ) ( not ( = ?auto_383629 ?auto_383638 ) ) ( not ( = ?auto_383629 ?auto_383639 ) ) ( not ( = ?auto_383630 ?auto_383631 ) ) ( not ( = ?auto_383630 ?auto_383632 ) ) ( not ( = ?auto_383630 ?auto_383633 ) ) ( not ( = ?auto_383630 ?auto_383634 ) ) ( not ( = ?auto_383630 ?auto_383635 ) ) ( not ( = ?auto_383630 ?auto_383636 ) ) ( not ( = ?auto_383630 ?auto_383637 ) ) ( not ( = ?auto_383630 ?auto_383638 ) ) ( not ( = ?auto_383630 ?auto_383639 ) ) ( not ( = ?auto_383631 ?auto_383632 ) ) ( not ( = ?auto_383631 ?auto_383633 ) ) ( not ( = ?auto_383631 ?auto_383634 ) ) ( not ( = ?auto_383631 ?auto_383635 ) ) ( not ( = ?auto_383631 ?auto_383636 ) ) ( not ( = ?auto_383631 ?auto_383637 ) ) ( not ( = ?auto_383631 ?auto_383638 ) ) ( not ( = ?auto_383631 ?auto_383639 ) ) ( not ( = ?auto_383632 ?auto_383633 ) ) ( not ( = ?auto_383632 ?auto_383634 ) ) ( not ( = ?auto_383632 ?auto_383635 ) ) ( not ( = ?auto_383632 ?auto_383636 ) ) ( not ( = ?auto_383632 ?auto_383637 ) ) ( not ( = ?auto_383632 ?auto_383638 ) ) ( not ( = ?auto_383632 ?auto_383639 ) ) ( not ( = ?auto_383633 ?auto_383634 ) ) ( not ( = ?auto_383633 ?auto_383635 ) ) ( not ( = ?auto_383633 ?auto_383636 ) ) ( not ( = ?auto_383633 ?auto_383637 ) ) ( not ( = ?auto_383633 ?auto_383638 ) ) ( not ( = ?auto_383633 ?auto_383639 ) ) ( not ( = ?auto_383634 ?auto_383635 ) ) ( not ( = ?auto_383634 ?auto_383636 ) ) ( not ( = ?auto_383634 ?auto_383637 ) ) ( not ( = ?auto_383634 ?auto_383638 ) ) ( not ( = ?auto_383634 ?auto_383639 ) ) ( not ( = ?auto_383635 ?auto_383636 ) ) ( not ( = ?auto_383635 ?auto_383637 ) ) ( not ( = ?auto_383635 ?auto_383638 ) ) ( not ( = ?auto_383635 ?auto_383639 ) ) ( not ( = ?auto_383636 ?auto_383637 ) ) ( not ( = ?auto_383636 ?auto_383638 ) ) ( not ( = ?auto_383636 ?auto_383639 ) ) ( not ( = ?auto_383637 ?auto_383638 ) ) ( not ( = ?auto_383637 ?auto_383639 ) ) ( not ( = ?auto_383638 ?auto_383639 ) ) ( ON ?auto_383637 ?auto_383638 ) ( ON ?auto_383636 ?auto_383637 ) ( ON ?auto_383635 ?auto_383636 ) ( ON ?auto_383634 ?auto_383635 ) ( ON ?auto_383633 ?auto_383634 ) ( ON ?auto_383632 ?auto_383633 ) ( ON ?auto_383631 ?auto_383632 ) ( ON ?auto_383630 ?auto_383631 ) ( ON ?auto_383629 ?auto_383630 ) ( ON ?auto_383628 ?auto_383629 ) ( CLEAR ?auto_383628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_383628 )
      ( MAKE-11PILE ?auto_383628 ?auto_383629 ?auto_383630 ?auto_383631 ?auto_383632 ?auto_383633 ?auto_383634 ?auto_383635 ?auto_383636 ?auto_383637 ?auto_383638 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383652 - BLOCK
      ?auto_383653 - BLOCK
      ?auto_383654 - BLOCK
      ?auto_383655 - BLOCK
      ?auto_383656 - BLOCK
      ?auto_383657 - BLOCK
      ?auto_383658 - BLOCK
      ?auto_383659 - BLOCK
      ?auto_383660 - BLOCK
      ?auto_383661 - BLOCK
      ?auto_383662 - BLOCK
      ?auto_383663 - BLOCK
    )
    :vars
    (
      ?auto_383664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_383662 ) ( ON ?auto_383663 ?auto_383664 ) ( CLEAR ?auto_383663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_383652 ) ( ON ?auto_383653 ?auto_383652 ) ( ON ?auto_383654 ?auto_383653 ) ( ON ?auto_383655 ?auto_383654 ) ( ON ?auto_383656 ?auto_383655 ) ( ON ?auto_383657 ?auto_383656 ) ( ON ?auto_383658 ?auto_383657 ) ( ON ?auto_383659 ?auto_383658 ) ( ON ?auto_383660 ?auto_383659 ) ( ON ?auto_383661 ?auto_383660 ) ( ON ?auto_383662 ?auto_383661 ) ( not ( = ?auto_383652 ?auto_383653 ) ) ( not ( = ?auto_383652 ?auto_383654 ) ) ( not ( = ?auto_383652 ?auto_383655 ) ) ( not ( = ?auto_383652 ?auto_383656 ) ) ( not ( = ?auto_383652 ?auto_383657 ) ) ( not ( = ?auto_383652 ?auto_383658 ) ) ( not ( = ?auto_383652 ?auto_383659 ) ) ( not ( = ?auto_383652 ?auto_383660 ) ) ( not ( = ?auto_383652 ?auto_383661 ) ) ( not ( = ?auto_383652 ?auto_383662 ) ) ( not ( = ?auto_383652 ?auto_383663 ) ) ( not ( = ?auto_383652 ?auto_383664 ) ) ( not ( = ?auto_383653 ?auto_383654 ) ) ( not ( = ?auto_383653 ?auto_383655 ) ) ( not ( = ?auto_383653 ?auto_383656 ) ) ( not ( = ?auto_383653 ?auto_383657 ) ) ( not ( = ?auto_383653 ?auto_383658 ) ) ( not ( = ?auto_383653 ?auto_383659 ) ) ( not ( = ?auto_383653 ?auto_383660 ) ) ( not ( = ?auto_383653 ?auto_383661 ) ) ( not ( = ?auto_383653 ?auto_383662 ) ) ( not ( = ?auto_383653 ?auto_383663 ) ) ( not ( = ?auto_383653 ?auto_383664 ) ) ( not ( = ?auto_383654 ?auto_383655 ) ) ( not ( = ?auto_383654 ?auto_383656 ) ) ( not ( = ?auto_383654 ?auto_383657 ) ) ( not ( = ?auto_383654 ?auto_383658 ) ) ( not ( = ?auto_383654 ?auto_383659 ) ) ( not ( = ?auto_383654 ?auto_383660 ) ) ( not ( = ?auto_383654 ?auto_383661 ) ) ( not ( = ?auto_383654 ?auto_383662 ) ) ( not ( = ?auto_383654 ?auto_383663 ) ) ( not ( = ?auto_383654 ?auto_383664 ) ) ( not ( = ?auto_383655 ?auto_383656 ) ) ( not ( = ?auto_383655 ?auto_383657 ) ) ( not ( = ?auto_383655 ?auto_383658 ) ) ( not ( = ?auto_383655 ?auto_383659 ) ) ( not ( = ?auto_383655 ?auto_383660 ) ) ( not ( = ?auto_383655 ?auto_383661 ) ) ( not ( = ?auto_383655 ?auto_383662 ) ) ( not ( = ?auto_383655 ?auto_383663 ) ) ( not ( = ?auto_383655 ?auto_383664 ) ) ( not ( = ?auto_383656 ?auto_383657 ) ) ( not ( = ?auto_383656 ?auto_383658 ) ) ( not ( = ?auto_383656 ?auto_383659 ) ) ( not ( = ?auto_383656 ?auto_383660 ) ) ( not ( = ?auto_383656 ?auto_383661 ) ) ( not ( = ?auto_383656 ?auto_383662 ) ) ( not ( = ?auto_383656 ?auto_383663 ) ) ( not ( = ?auto_383656 ?auto_383664 ) ) ( not ( = ?auto_383657 ?auto_383658 ) ) ( not ( = ?auto_383657 ?auto_383659 ) ) ( not ( = ?auto_383657 ?auto_383660 ) ) ( not ( = ?auto_383657 ?auto_383661 ) ) ( not ( = ?auto_383657 ?auto_383662 ) ) ( not ( = ?auto_383657 ?auto_383663 ) ) ( not ( = ?auto_383657 ?auto_383664 ) ) ( not ( = ?auto_383658 ?auto_383659 ) ) ( not ( = ?auto_383658 ?auto_383660 ) ) ( not ( = ?auto_383658 ?auto_383661 ) ) ( not ( = ?auto_383658 ?auto_383662 ) ) ( not ( = ?auto_383658 ?auto_383663 ) ) ( not ( = ?auto_383658 ?auto_383664 ) ) ( not ( = ?auto_383659 ?auto_383660 ) ) ( not ( = ?auto_383659 ?auto_383661 ) ) ( not ( = ?auto_383659 ?auto_383662 ) ) ( not ( = ?auto_383659 ?auto_383663 ) ) ( not ( = ?auto_383659 ?auto_383664 ) ) ( not ( = ?auto_383660 ?auto_383661 ) ) ( not ( = ?auto_383660 ?auto_383662 ) ) ( not ( = ?auto_383660 ?auto_383663 ) ) ( not ( = ?auto_383660 ?auto_383664 ) ) ( not ( = ?auto_383661 ?auto_383662 ) ) ( not ( = ?auto_383661 ?auto_383663 ) ) ( not ( = ?auto_383661 ?auto_383664 ) ) ( not ( = ?auto_383662 ?auto_383663 ) ) ( not ( = ?auto_383662 ?auto_383664 ) ) ( not ( = ?auto_383663 ?auto_383664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_383663 ?auto_383664 )
      ( !STACK ?auto_383663 ?auto_383662 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383677 - BLOCK
      ?auto_383678 - BLOCK
      ?auto_383679 - BLOCK
      ?auto_383680 - BLOCK
      ?auto_383681 - BLOCK
      ?auto_383682 - BLOCK
      ?auto_383683 - BLOCK
      ?auto_383684 - BLOCK
      ?auto_383685 - BLOCK
      ?auto_383686 - BLOCK
      ?auto_383687 - BLOCK
      ?auto_383688 - BLOCK
    )
    :vars
    (
      ?auto_383689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_383687 ) ( ON ?auto_383688 ?auto_383689 ) ( CLEAR ?auto_383688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_383677 ) ( ON ?auto_383678 ?auto_383677 ) ( ON ?auto_383679 ?auto_383678 ) ( ON ?auto_383680 ?auto_383679 ) ( ON ?auto_383681 ?auto_383680 ) ( ON ?auto_383682 ?auto_383681 ) ( ON ?auto_383683 ?auto_383682 ) ( ON ?auto_383684 ?auto_383683 ) ( ON ?auto_383685 ?auto_383684 ) ( ON ?auto_383686 ?auto_383685 ) ( ON ?auto_383687 ?auto_383686 ) ( not ( = ?auto_383677 ?auto_383678 ) ) ( not ( = ?auto_383677 ?auto_383679 ) ) ( not ( = ?auto_383677 ?auto_383680 ) ) ( not ( = ?auto_383677 ?auto_383681 ) ) ( not ( = ?auto_383677 ?auto_383682 ) ) ( not ( = ?auto_383677 ?auto_383683 ) ) ( not ( = ?auto_383677 ?auto_383684 ) ) ( not ( = ?auto_383677 ?auto_383685 ) ) ( not ( = ?auto_383677 ?auto_383686 ) ) ( not ( = ?auto_383677 ?auto_383687 ) ) ( not ( = ?auto_383677 ?auto_383688 ) ) ( not ( = ?auto_383677 ?auto_383689 ) ) ( not ( = ?auto_383678 ?auto_383679 ) ) ( not ( = ?auto_383678 ?auto_383680 ) ) ( not ( = ?auto_383678 ?auto_383681 ) ) ( not ( = ?auto_383678 ?auto_383682 ) ) ( not ( = ?auto_383678 ?auto_383683 ) ) ( not ( = ?auto_383678 ?auto_383684 ) ) ( not ( = ?auto_383678 ?auto_383685 ) ) ( not ( = ?auto_383678 ?auto_383686 ) ) ( not ( = ?auto_383678 ?auto_383687 ) ) ( not ( = ?auto_383678 ?auto_383688 ) ) ( not ( = ?auto_383678 ?auto_383689 ) ) ( not ( = ?auto_383679 ?auto_383680 ) ) ( not ( = ?auto_383679 ?auto_383681 ) ) ( not ( = ?auto_383679 ?auto_383682 ) ) ( not ( = ?auto_383679 ?auto_383683 ) ) ( not ( = ?auto_383679 ?auto_383684 ) ) ( not ( = ?auto_383679 ?auto_383685 ) ) ( not ( = ?auto_383679 ?auto_383686 ) ) ( not ( = ?auto_383679 ?auto_383687 ) ) ( not ( = ?auto_383679 ?auto_383688 ) ) ( not ( = ?auto_383679 ?auto_383689 ) ) ( not ( = ?auto_383680 ?auto_383681 ) ) ( not ( = ?auto_383680 ?auto_383682 ) ) ( not ( = ?auto_383680 ?auto_383683 ) ) ( not ( = ?auto_383680 ?auto_383684 ) ) ( not ( = ?auto_383680 ?auto_383685 ) ) ( not ( = ?auto_383680 ?auto_383686 ) ) ( not ( = ?auto_383680 ?auto_383687 ) ) ( not ( = ?auto_383680 ?auto_383688 ) ) ( not ( = ?auto_383680 ?auto_383689 ) ) ( not ( = ?auto_383681 ?auto_383682 ) ) ( not ( = ?auto_383681 ?auto_383683 ) ) ( not ( = ?auto_383681 ?auto_383684 ) ) ( not ( = ?auto_383681 ?auto_383685 ) ) ( not ( = ?auto_383681 ?auto_383686 ) ) ( not ( = ?auto_383681 ?auto_383687 ) ) ( not ( = ?auto_383681 ?auto_383688 ) ) ( not ( = ?auto_383681 ?auto_383689 ) ) ( not ( = ?auto_383682 ?auto_383683 ) ) ( not ( = ?auto_383682 ?auto_383684 ) ) ( not ( = ?auto_383682 ?auto_383685 ) ) ( not ( = ?auto_383682 ?auto_383686 ) ) ( not ( = ?auto_383682 ?auto_383687 ) ) ( not ( = ?auto_383682 ?auto_383688 ) ) ( not ( = ?auto_383682 ?auto_383689 ) ) ( not ( = ?auto_383683 ?auto_383684 ) ) ( not ( = ?auto_383683 ?auto_383685 ) ) ( not ( = ?auto_383683 ?auto_383686 ) ) ( not ( = ?auto_383683 ?auto_383687 ) ) ( not ( = ?auto_383683 ?auto_383688 ) ) ( not ( = ?auto_383683 ?auto_383689 ) ) ( not ( = ?auto_383684 ?auto_383685 ) ) ( not ( = ?auto_383684 ?auto_383686 ) ) ( not ( = ?auto_383684 ?auto_383687 ) ) ( not ( = ?auto_383684 ?auto_383688 ) ) ( not ( = ?auto_383684 ?auto_383689 ) ) ( not ( = ?auto_383685 ?auto_383686 ) ) ( not ( = ?auto_383685 ?auto_383687 ) ) ( not ( = ?auto_383685 ?auto_383688 ) ) ( not ( = ?auto_383685 ?auto_383689 ) ) ( not ( = ?auto_383686 ?auto_383687 ) ) ( not ( = ?auto_383686 ?auto_383688 ) ) ( not ( = ?auto_383686 ?auto_383689 ) ) ( not ( = ?auto_383687 ?auto_383688 ) ) ( not ( = ?auto_383687 ?auto_383689 ) ) ( not ( = ?auto_383688 ?auto_383689 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_383688 ?auto_383689 )
      ( !STACK ?auto_383688 ?auto_383687 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383702 - BLOCK
      ?auto_383703 - BLOCK
      ?auto_383704 - BLOCK
      ?auto_383705 - BLOCK
      ?auto_383706 - BLOCK
      ?auto_383707 - BLOCK
      ?auto_383708 - BLOCK
      ?auto_383709 - BLOCK
      ?auto_383710 - BLOCK
      ?auto_383711 - BLOCK
      ?auto_383712 - BLOCK
      ?auto_383713 - BLOCK
    )
    :vars
    (
      ?auto_383714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383713 ?auto_383714 ) ( ON-TABLE ?auto_383702 ) ( ON ?auto_383703 ?auto_383702 ) ( ON ?auto_383704 ?auto_383703 ) ( ON ?auto_383705 ?auto_383704 ) ( ON ?auto_383706 ?auto_383705 ) ( ON ?auto_383707 ?auto_383706 ) ( ON ?auto_383708 ?auto_383707 ) ( ON ?auto_383709 ?auto_383708 ) ( ON ?auto_383710 ?auto_383709 ) ( ON ?auto_383711 ?auto_383710 ) ( not ( = ?auto_383702 ?auto_383703 ) ) ( not ( = ?auto_383702 ?auto_383704 ) ) ( not ( = ?auto_383702 ?auto_383705 ) ) ( not ( = ?auto_383702 ?auto_383706 ) ) ( not ( = ?auto_383702 ?auto_383707 ) ) ( not ( = ?auto_383702 ?auto_383708 ) ) ( not ( = ?auto_383702 ?auto_383709 ) ) ( not ( = ?auto_383702 ?auto_383710 ) ) ( not ( = ?auto_383702 ?auto_383711 ) ) ( not ( = ?auto_383702 ?auto_383712 ) ) ( not ( = ?auto_383702 ?auto_383713 ) ) ( not ( = ?auto_383702 ?auto_383714 ) ) ( not ( = ?auto_383703 ?auto_383704 ) ) ( not ( = ?auto_383703 ?auto_383705 ) ) ( not ( = ?auto_383703 ?auto_383706 ) ) ( not ( = ?auto_383703 ?auto_383707 ) ) ( not ( = ?auto_383703 ?auto_383708 ) ) ( not ( = ?auto_383703 ?auto_383709 ) ) ( not ( = ?auto_383703 ?auto_383710 ) ) ( not ( = ?auto_383703 ?auto_383711 ) ) ( not ( = ?auto_383703 ?auto_383712 ) ) ( not ( = ?auto_383703 ?auto_383713 ) ) ( not ( = ?auto_383703 ?auto_383714 ) ) ( not ( = ?auto_383704 ?auto_383705 ) ) ( not ( = ?auto_383704 ?auto_383706 ) ) ( not ( = ?auto_383704 ?auto_383707 ) ) ( not ( = ?auto_383704 ?auto_383708 ) ) ( not ( = ?auto_383704 ?auto_383709 ) ) ( not ( = ?auto_383704 ?auto_383710 ) ) ( not ( = ?auto_383704 ?auto_383711 ) ) ( not ( = ?auto_383704 ?auto_383712 ) ) ( not ( = ?auto_383704 ?auto_383713 ) ) ( not ( = ?auto_383704 ?auto_383714 ) ) ( not ( = ?auto_383705 ?auto_383706 ) ) ( not ( = ?auto_383705 ?auto_383707 ) ) ( not ( = ?auto_383705 ?auto_383708 ) ) ( not ( = ?auto_383705 ?auto_383709 ) ) ( not ( = ?auto_383705 ?auto_383710 ) ) ( not ( = ?auto_383705 ?auto_383711 ) ) ( not ( = ?auto_383705 ?auto_383712 ) ) ( not ( = ?auto_383705 ?auto_383713 ) ) ( not ( = ?auto_383705 ?auto_383714 ) ) ( not ( = ?auto_383706 ?auto_383707 ) ) ( not ( = ?auto_383706 ?auto_383708 ) ) ( not ( = ?auto_383706 ?auto_383709 ) ) ( not ( = ?auto_383706 ?auto_383710 ) ) ( not ( = ?auto_383706 ?auto_383711 ) ) ( not ( = ?auto_383706 ?auto_383712 ) ) ( not ( = ?auto_383706 ?auto_383713 ) ) ( not ( = ?auto_383706 ?auto_383714 ) ) ( not ( = ?auto_383707 ?auto_383708 ) ) ( not ( = ?auto_383707 ?auto_383709 ) ) ( not ( = ?auto_383707 ?auto_383710 ) ) ( not ( = ?auto_383707 ?auto_383711 ) ) ( not ( = ?auto_383707 ?auto_383712 ) ) ( not ( = ?auto_383707 ?auto_383713 ) ) ( not ( = ?auto_383707 ?auto_383714 ) ) ( not ( = ?auto_383708 ?auto_383709 ) ) ( not ( = ?auto_383708 ?auto_383710 ) ) ( not ( = ?auto_383708 ?auto_383711 ) ) ( not ( = ?auto_383708 ?auto_383712 ) ) ( not ( = ?auto_383708 ?auto_383713 ) ) ( not ( = ?auto_383708 ?auto_383714 ) ) ( not ( = ?auto_383709 ?auto_383710 ) ) ( not ( = ?auto_383709 ?auto_383711 ) ) ( not ( = ?auto_383709 ?auto_383712 ) ) ( not ( = ?auto_383709 ?auto_383713 ) ) ( not ( = ?auto_383709 ?auto_383714 ) ) ( not ( = ?auto_383710 ?auto_383711 ) ) ( not ( = ?auto_383710 ?auto_383712 ) ) ( not ( = ?auto_383710 ?auto_383713 ) ) ( not ( = ?auto_383710 ?auto_383714 ) ) ( not ( = ?auto_383711 ?auto_383712 ) ) ( not ( = ?auto_383711 ?auto_383713 ) ) ( not ( = ?auto_383711 ?auto_383714 ) ) ( not ( = ?auto_383712 ?auto_383713 ) ) ( not ( = ?auto_383712 ?auto_383714 ) ) ( not ( = ?auto_383713 ?auto_383714 ) ) ( CLEAR ?auto_383711 ) ( ON ?auto_383712 ?auto_383713 ) ( CLEAR ?auto_383712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_383702 ?auto_383703 ?auto_383704 ?auto_383705 ?auto_383706 ?auto_383707 ?auto_383708 ?auto_383709 ?auto_383710 ?auto_383711 ?auto_383712 )
      ( MAKE-12PILE ?auto_383702 ?auto_383703 ?auto_383704 ?auto_383705 ?auto_383706 ?auto_383707 ?auto_383708 ?auto_383709 ?auto_383710 ?auto_383711 ?auto_383712 ?auto_383713 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383727 - BLOCK
      ?auto_383728 - BLOCK
      ?auto_383729 - BLOCK
      ?auto_383730 - BLOCK
      ?auto_383731 - BLOCK
      ?auto_383732 - BLOCK
      ?auto_383733 - BLOCK
      ?auto_383734 - BLOCK
      ?auto_383735 - BLOCK
      ?auto_383736 - BLOCK
      ?auto_383737 - BLOCK
      ?auto_383738 - BLOCK
    )
    :vars
    (
      ?auto_383739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383738 ?auto_383739 ) ( ON-TABLE ?auto_383727 ) ( ON ?auto_383728 ?auto_383727 ) ( ON ?auto_383729 ?auto_383728 ) ( ON ?auto_383730 ?auto_383729 ) ( ON ?auto_383731 ?auto_383730 ) ( ON ?auto_383732 ?auto_383731 ) ( ON ?auto_383733 ?auto_383732 ) ( ON ?auto_383734 ?auto_383733 ) ( ON ?auto_383735 ?auto_383734 ) ( ON ?auto_383736 ?auto_383735 ) ( not ( = ?auto_383727 ?auto_383728 ) ) ( not ( = ?auto_383727 ?auto_383729 ) ) ( not ( = ?auto_383727 ?auto_383730 ) ) ( not ( = ?auto_383727 ?auto_383731 ) ) ( not ( = ?auto_383727 ?auto_383732 ) ) ( not ( = ?auto_383727 ?auto_383733 ) ) ( not ( = ?auto_383727 ?auto_383734 ) ) ( not ( = ?auto_383727 ?auto_383735 ) ) ( not ( = ?auto_383727 ?auto_383736 ) ) ( not ( = ?auto_383727 ?auto_383737 ) ) ( not ( = ?auto_383727 ?auto_383738 ) ) ( not ( = ?auto_383727 ?auto_383739 ) ) ( not ( = ?auto_383728 ?auto_383729 ) ) ( not ( = ?auto_383728 ?auto_383730 ) ) ( not ( = ?auto_383728 ?auto_383731 ) ) ( not ( = ?auto_383728 ?auto_383732 ) ) ( not ( = ?auto_383728 ?auto_383733 ) ) ( not ( = ?auto_383728 ?auto_383734 ) ) ( not ( = ?auto_383728 ?auto_383735 ) ) ( not ( = ?auto_383728 ?auto_383736 ) ) ( not ( = ?auto_383728 ?auto_383737 ) ) ( not ( = ?auto_383728 ?auto_383738 ) ) ( not ( = ?auto_383728 ?auto_383739 ) ) ( not ( = ?auto_383729 ?auto_383730 ) ) ( not ( = ?auto_383729 ?auto_383731 ) ) ( not ( = ?auto_383729 ?auto_383732 ) ) ( not ( = ?auto_383729 ?auto_383733 ) ) ( not ( = ?auto_383729 ?auto_383734 ) ) ( not ( = ?auto_383729 ?auto_383735 ) ) ( not ( = ?auto_383729 ?auto_383736 ) ) ( not ( = ?auto_383729 ?auto_383737 ) ) ( not ( = ?auto_383729 ?auto_383738 ) ) ( not ( = ?auto_383729 ?auto_383739 ) ) ( not ( = ?auto_383730 ?auto_383731 ) ) ( not ( = ?auto_383730 ?auto_383732 ) ) ( not ( = ?auto_383730 ?auto_383733 ) ) ( not ( = ?auto_383730 ?auto_383734 ) ) ( not ( = ?auto_383730 ?auto_383735 ) ) ( not ( = ?auto_383730 ?auto_383736 ) ) ( not ( = ?auto_383730 ?auto_383737 ) ) ( not ( = ?auto_383730 ?auto_383738 ) ) ( not ( = ?auto_383730 ?auto_383739 ) ) ( not ( = ?auto_383731 ?auto_383732 ) ) ( not ( = ?auto_383731 ?auto_383733 ) ) ( not ( = ?auto_383731 ?auto_383734 ) ) ( not ( = ?auto_383731 ?auto_383735 ) ) ( not ( = ?auto_383731 ?auto_383736 ) ) ( not ( = ?auto_383731 ?auto_383737 ) ) ( not ( = ?auto_383731 ?auto_383738 ) ) ( not ( = ?auto_383731 ?auto_383739 ) ) ( not ( = ?auto_383732 ?auto_383733 ) ) ( not ( = ?auto_383732 ?auto_383734 ) ) ( not ( = ?auto_383732 ?auto_383735 ) ) ( not ( = ?auto_383732 ?auto_383736 ) ) ( not ( = ?auto_383732 ?auto_383737 ) ) ( not ( = ?auto_383732 ?auto_383738 ) ) ( not ( = ?auto_383732 ?auto_383739 ) ) ( not ( = ?auto_383733 ?auto_383734 ) ) ( not ( = ?auto_383733 ?auto_383735 ) ) ( not ( = ?auto_383733 ?auto_383736 ) ) ( not ( = ?auto_383733 ?auto_383737 ) ) ( not ( = ?auto_383733 ?auto_383738 ) ) ( not ( = ?auto_383733 ?auto_383739 ) ) ( not ( = ?auto_383734 ?auto_383735 ) ) ( not ( = ?auto_383734 ?auto_383736 ) ) ( not ( = ?auto_383734 ?auto_383737 ) ) ( not ( = ?auto_383734 ?auto_383738 ) ) ( not ( = ?auto_383734 ?auto_383739 ) ) ( not ( = ?auto_383735 ?auto_383736 ) ) ( not ( = ?auto_383735 ?auto_383737 ) ) ( not ( = ?auto_383735 ?auto_383738 ) ) ( not ( = ?auto_383735 ?auto_383739 ) ) ( not ( = ?auto_383736 ?auto_383737 ) ) ( not ( = ?auto_383736 ?auto_383738 ) ) ( not ( = ?auto_383736 ?auto_383739 ) ) ( not ( = ?auto_383737 ?auto_383738 ) ) ( not ( = ?auto_383737 ?auto_383739 ) ) ( not ( = ?auto_383738 ?auto_383739 ) ) ( CLEAR ?auto_383736 ) ( ON ?auto_383737 ?auto_383738 ) ( CLEAR ?auto_383737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_383727 ?auto_383728 ?auto_383729 ?auto_383730 ?auto_383731 ?auto_383732 ?auto_383733 ?auto_383734 ?auto_383735 ?auto_383736 ?auto_383737 )
      ( MAKE-12PILE ?auto_383727 ?auto_383728 ?auto_383729 ?auto_383730 ?auto_383731 ?auto_383732 ?auto_383733 ?auto_383734 ?auto_383735 ?auto_383736 ?auto_383737 ?auto_383738 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383752 - BLOCK
      ?auto_383753 - BLOCK
      ?auto_383754 - BLOCK
      ?auto_383755 - BLOCK
      ?auto_383756 - BLOCK
      ?auto_383757 - BLOCK
      ?auto_383758 - BLOCK
      ?auto_383759 - BLOCK
      ?auto_383760 - BLOCK
      ?auto_383761 - BLOCK
      ?auto_383762 - BLOCK
      ?auto_383763 - BLOCK
    )
    :vars
    (
      ?auto_383764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383763 ?auto_383764 ) ( ON-TABLE ?auto_383752 ) ( ON ?auto_383753 ?auto_383752 ) ( ON ?auto_383754 ?auto_383753 ) ( ON ?auto_383755 ?auto_383754 ) ( ON ?auto_383756 ?auto_383755 ) ( ON ?auto_383757 ?auto_383756 ) ( ON ?auto_383758 ?auto_383757 ) ( ON ?auto_383759 ?auto_383758 ) ( ON ?auto_383760 ?auto_383759 ) ( not ( = ?auto_383752 ?auto_383753 ) ) ( not ( = ?auto_383752 ?auto_383754 ) ) ( not ( = ?auto_383752 ?auto_383755 ) ) ( not ( = ?auto_383752 ?auto_383756 ) ) ( not ( = ?auto_383752 ?auto_383757 ) ) ( not ( = ?auto_383752 ?auto_383758 ) ) ( not ( = ?auto_383752 ?auto_383759 ) ) ( not ( = ?auto_383752 ?auto_383760 ) ) ( not ( = ?auto_383752 ?auto_383761 ) ) ( not ( = ?auto_383752 ?auto_383762 ) ) ( not ( = ?auto_383752 ?auto_383763 ) ) ( not ( = ?auto_383752 ?auto_383764 ) ) ( not ( = ?auto_383753 ?auto_383754 ) ) ( not ( = ?auto_383753 ?auto_383755 ) ) ( not ( = ?auto_383753 ?auto_383756 ) ) ( not ( = ?auto_383753 ?auto_383757 ) ) ( not ( = ?auto_383753 ?auto_383758 ) ) ( not ( = ?auto_383753 ?auto_383759 ) ) ( not ( = ?auto_383753 ?auto_383760 ) ) ( not ( = ?auto_383753 ?auto_383761 ) ) ( not ( = ?auto_383753 ?auto_383762 ) ) ( not ( = ?auto_383753 ?auto_383763 ) ) ( not ( = ?auto_383753 ?auto_383764 ) ) ( not ( = ?auto_383754 ?auto_383755 ) ) ( not ( = ?auto_383754 ?auto_383756 ) ) ( not ( = ?auto_383754 ?auto_383757 ) ) ( not ( = ?auto_383754 ?auto_383758 ) ) ( not ( = ?auto_383754 ?auto_383759 ) ) ( not ( = ?auto_383754 ?auto_383760 ) ) ( not ( = ?auto_383754 ?auto_383761 ) ) ( not ( = ?auto_383754 ?auto_383762 ) ) ( not ( = ?auto_383754 ?auto_383763 ) ) ( not ( = ?auto_383754 ?auto_383764 ) ) ( not ( = ?auto_383755 ?auto_383756 ) ) ( not ( = ?auto_383755 ?auto_383757 ) ) ( not ( = ?auto_383755 ?auto_383758 ) ) ( not ( = ?auto_383755 ?auto_383759 ) ) ( not ( = ?auto_383755 ?auto_383760 ) ) ( not ( = ?auto_383755 ?auto_383761 ) ) ( not ( = ?auto_383755 ?auto_383762 ) ) ( not ( = ?auto_383755 ?auto_383763 ) ) ( not ( = ?auto_383755 ?auto_383764 ) ) ( not ( = ?auto_383756 ?auto_383757 ) ) ( not ( = ?auto_383756 ?auto_383758 ) ) ( not ( = ?auto_383756 ?auto_383759 ) ) ( not ( = ?auto_383756 ?auto_383760 ) ) ( not ( = ?auto_383756 ?auto_383761 ) ) ( not ( = ?auto_383756 ?auto_383762 ) ) ( not ( = ?auto_383756 ?auto_383763 ) ) ( not ( = ?auto_383756 ?auto_383764 ) ) ( not ( = ?auto_383757 ?auto_383758 ) ) ( not ( = ?auto_383757 ?auto_383759 ) ) ( not ( = ?auto_383757 ?auto_383760 ) ) ( not ( = ?auto_383757 ?auto_383761 ) ) ( not ( = ?auto_383757 ?auto_383762 ) ) ( not ( = ?auto_383757 ?auto_383763 ) ) ( not ( = ?auto_383757 ?auto_383764 ) ) ( not ( = ?auto_383758 ?auto_383759 ) ) ( not ( = ?auto_383758 ?auto_383760 ) ) ( not ( = ?auto_383758 ?auto_383761 ) ) ( not ( = ?auto_383758 ?auto_383762 ) ) ( not ( = ?auto_383758 ?auto_383763 ) ) ( not ( = ?auto_383758 ?auto_383764 ) ) ( not ( = ?auto_383759 ?auto_383760 ) ) ( not ( = ?auto_383759 ?auto_383761 ) ) ( not ( = ?auto_383759 ?auto_383762 ) ) ( not ( = ?auto_383759 ?auto_383763 ) ) ( not ( = ?auto_383759 ?auto_383764 ) ) ( not ( = ?auto_383760 ?auto_383761 ) ) ( not ( = ?auto_383760 ?auto_383762 ) ) ( not ( = ?auto_383760 ?auto_383763 ) ) ( not ( = ?auto_383760 ?auto_383764 ) ) ( not ( = ?auto_383761 ?auto_383762 ) ) ( not ( = ?auto_383761 ?auto_383763 ) ) ( not ( = ?auto_383761 ?auto_383764 ) ) ( not ( = ?auto_383762 ?auto_383763 ) ) ( not ( = ?auto_383762 ?auto_383764 ) ) ( not ( = ?auto_383763 ?auto_383764 ) ) ( ON ?auto_383762 ?auto_383763 ) ( CLEAR ?auto_383760 ) ( ON ?auto_383761 ?auto_383762 ) ( CLEAR ?auto_383761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_383752 ?auto_383753 ?auto_383754 ?auto_383755 ?auto_383756 ?auto_383757 ?auto_383758 ?auto_383759 ?auto_383760 ?auto_383761 )
      ( MAKE-12PILE ?auto_383752 ?auto_383753 ?auto_383754 ?auto_383755 ?auto_383756 ?auto_383757 ?auto_383758 ?auto_383759 ?auto_383760 ?auto_383761 ?auto_383762 ?auto_383763 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383777 - BLOCK
      ?auto_383778 - BLOCK
      ?auto_383779 - BLOCK
      ?auto_383780 - BLOCK
      ?auto_383781 - BLOCK
      ?auto_383782 - BLOCK
      ?auto_383783 - BLOCK
      ?auto_383784 - BLOCK
      ?auto_383785 - BLOCK
      ?auto_383786 - BLOCK
      ?auto_383787 - BLOCK
      ?auto_383788 - BLOCK
    )
    :vars
    (
      ?auto_383789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383788 ?auto_383789 ) ( ON-TABLE ?auto_383777 ) ( ON ?auto_383778 ?auto_383777 ) ( ON ?auto_383779 ?auto_383778 ) ( ON ?auto_383780 ?auto_383779 ) ( ON ?auto_383781 ?auto_383780 ) ( ON ?auto_383782 ?auto_383781 ) ( ON ?auto_383783 ?auto_383782 ) ( ON ?auto_383784 ?auto_383783 ) ( ON ?auto_383785 ?auto_383784 ) ( not ( = ?auto_383777 ?auto_383778 ) ) ( not ( = ?auto_383777 ?auto_383779 ) ) ( not ( = ?auto_383777 ?auto_383780 ) ) ( not ( = ?auto_383777 ?auto_383781 ) ) ( not ( = ?auto_383777 ?auto_383782 ) ) ( not ( = ?auto_383777 ?auto_383783 ) ) ( not ( = ?auto_383777 ?auto_383784 ) ) ( not ( = ?auto_383777 ?auto_383785 ) ) ( not ( = ?auto_383777 ?auto_383786 ) ) ( not ( = ?auto_383777 ?auto_383787 ) ) ( not ( = ?auto_383777 ?auto_383788 ) ) ( not ( = ?auto_383777 ?auto_383789 ) ) ( not ( = ?auto_383778 ?auto_383779 ) ) ( not ( = ?auto_383778 ?auto_383780 ) ) ( not ( = ?auto_383778 ?auto_383781 ) ) ( not ( = ?auto_383778 ?auto_383782 ) ) ( not ( = ?auto_383778 ?auto_383783 ) ) ( not ( = ?auto_383778 ?auto_383784 ) ) ( not ( = ?auto_383778 ?auto_383785 ) ) ( not ( = ?auto_383778 ?auto_383786 ) ) ( not ( = ?auto_383778 ?auto_383787 ) ) ( not ( = ?auto_383778 ?auto_383788 ) ) ( not ( = ?auto_383778 ?auto_383789 ) ) ( not ( = ?auto_383779 ?auto_383780 ) ) ( not ( = ?auto_383779 ?auto_383781 ) ) ( not ( = ?auto_383779 ?auto_383782 ) ) ( not ( = ?auto_383779 ?auto_383783 ) ) ( not ( = ?auto_383779 ?auto_383784 ) ) ( not ( = ?auto_383779 ?auto_383785 ) ) ( not ( = ?auto_383779 ?auto_383786 ) ) ( not ( = ?auto_383779 ?auto_383787 ) ) ( not ( = ?auto_383779 ?auto_383788 ) ) ( not ( = ?auto_383779 ?auto_383789 ) ) ( not ( = ?auto_383780 ?auto_383781 ) ) ( not ( = ?auto_383780 ?auto_383782 ) ) ( not ( = ?auto_383780 ?auto_383783 ) ) ( not ( = ?auto_383780 ?auto_383784 ) ) ( not ( = ?auto_383780 ?auto_383785 ) ) ( not ( = ?auto_383780 ?auto_383786 ) ) ( not ( = ?auto_383780 ?auto_383787 ) ) ( not ( = ?auto_383780 ?auto_383788 ) ) ( not ( = ?auto_383780 ?auto_383789 ) ) ( not ( = ?auto_383781 ?auto_383782 ) ) ( not ( = ?auto_383781 ?auto_383783 ) ) ( not ( = ?auto_383781 ?auto_383784 ) ) ( not ( = ?auto_383781 ?auto_383785 ) ) ( not ( = ?auto_383781 ?auto_383786 ) ) ( not ( = ?auto_383781 ?auto_383787 ) ) ( not ( = ?auto_383781 ?auto_383788 ) ) ( not ( = ?auto_383781 ?auto_383789 ) ) ( not ( = ?auto_383782 ?auto_383783 ) ) ( not ( = ?auto_383782 ?auto_383784 ) ) ( not ( = ?auto_383782 ?auto_383785 ) ) ( not ( = ?auto_383782 ?auto_383786 ) ) ( not ( = ?auto_383782 ?auto_383787 ) ) ( not ( = ?auto_383782 ?auto_383788 ) ) ( not ( = ?auto_383782 ?auto_383789 ) ) ( not ( = ?auto_383783 ?auto_383784 ) ) ( not ( = ?auto_383783 ?auto_383785 ) ) ( not ( = ?auto_383783 ?auto_383786 ) ) ( not ( = ?auto_383783 ?auto_383787 ) ) ( not ( = ?auto_383783 ?auto_383788 ) ) ( not ( = ?auto_383783 ?auto_383789 ) ) ( not ( = ?auto_383784 ?auto_383785 ) ) ( not ( = ?auto_383784 ?auto_383786 ) ) ( not ( = ?auto_383784 ?auto_383787 ) ) ( not ( = ?auto_383784 ?auto_383788 ) ) ( not ( = ?auto_383784 ?auto_383789 ) ) ( not ( = ?auto_383785 ?auto_383786 ) ) ( not ( = ?auto_383785 ?auto_383787 ) ) ( not ( = ?auto_383785 ?auto_383788 ) ) ( not ( = ?auto_383785 ?auto_383789 ) ) ( not ( = ?auto_383786 ?auto_383787 ) ) ( not ( = ?auto_383786 ?auto_383788 ) ) ( not ( = ?auto_383786 ?auto_383789 ) ) ( not ( = ?auto_383787 ?auto_383788 ) ) ( not ( = ?auto_383787 ?auto_383789 ) ) ( not ( = ?auto_383788 ?auto_383789 ) ) ( ON ?auto_383787 ?auto_383788 ) ( CLEAR ?auto_383785 ) ( ON ?auto_383786 ?auto_383787 ) ( CLEAR ?auto_383786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_383777 ?auto_383778 ?auto_383779 ?auto_383780 ?auto_383781 ?auto_383782 ?auto_383783 ?auto_383784 ?auto_383785 ?auto_383786 )
      ( MAKE-12PILE ?auto_383777 ?auto_383778 ?auto_383779 ?auto_383780 ?auto_383781 ?auto_383782 ?auto_383783 ?auto_383784 ?auto_383785 ?auto_383786 ?auto_383787 ?auto_383788 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383802 - BLOCK
      ?auto_383803 - BLOCK
      ?auto_383804 - BLOCK
      ?auto_383805 - BLOCK
      ?auto_383806 - BLOCK
      ?auto_383807 - BLOCK
      ?auto_383808 - BLOCK
      ?auto_383809 - BLOCK
      ?auto_383810 - BLOCK
      ?auto_383811 - BLOCK
      ?auto_383812 - BLOCK
      ?auto_383813 - BLOCK
    )
    :vars
    (
      ?auto_383814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383813 ?auto_383814 ) ( ON-TABLE ?auto_383802 ) ( ON ?auto_383803 ?auto_383802 ) ( ON ?auto_383804 ?auto_383803 ) ( ON ?auto_383805 ?auto_383804 ) ( ON ?auto_383806 ?auto_383805 ) ( ON ?auto_383807 ?auto_383806 ) ( ON ?auto_383808 ?auto_383807 ) ( ON ?auto_383809 ?auto_383808 ) ( not ( = ?auto_383802 ?auto_383803 ) ) ( not ( = ?auto_383802 ?auto_383804 ) ) ( not ( = ?auto_383802 ?auto_383805 ) ) ( not ( = ?auto_383802 ?auto_383806 ) ) ( not ( = ?auto_383802 ?auto_383807 ) ) ( not ( = ?auto_383802 ?auto_383808 ) ) ( not ( = ?auto_383802 ?auto_383809 ) ) ( not ( = ?auto_383802 ?auto_383810 ) ) ( not ( = ?auto_383802 ?auto_383811 ) ) ( not ( = ?auto_383802 ?auto_383812 ) ) ( not ( = ?auto_383802 ?auto_383813 ) ) ( not ( = ?auto_383802 ?auto_383814 ) ) ( not ( = ?auto_383803 ?auto_383804 ) ) ( not ( = ?auto_383803 ?auto_383805 ) ) ( not ( = ?auto_383803 ?auto_383806 ) ) ( not ( = ?auto_383803 ?auto_383807 ) ) ( not ( = ?auto_383803 ?auto_383808 ) ) ( not ( = ?auto_383803 ?auto_383809 ) ) ( not ( = ?auto_383803 ?auto_383810 ) ) ( not ( = ?auto_383803 ?auto_383811 ) ) ( not ( = ?auto_383803 ?auto_383812 ) ) ( not ( = ?auto_383803 ?auto_383813 ) ) ( not ( = ?auto_383803 ?auto_383814 ) ) ( not ( = ?auto_383804 ?auto_383805 ) ) ( not ( = ?auto_383804 ?auto_383806 ) ) ( not ( = ?auto_383804 ?auto_383807 ) ) ( not ( = ?auto_383804 ?auto_383808 ) ) ( not ( = ?auto_383804 ?auto_383809 ) ) ( not ( = ?auto_383804 ?auto_383810 ) ) ( not ( = ?auto_383804 ?auto_383811 ) ) ( not ( = ?auto_383804 ?auto_383812 ) ) ( not ( = ?auto_383804 ?auto_383813 ) ) ( not ( = ?auto_383804 ?auto_383814 ) ) ( not ( = ?auto_383805 ?auto_383806 ) ) ( not ( = ?auto_383805 ?auto_383807 ) ) ( not ( = ?auto_383805 ?auto_383808 ) ) ( not ( = ?auto_383805 ?auto_383809 ) ) ( not ( = ?auto_383805 ?auto_383810 ) ) ( not ( = ?auto_383805 ?auto_383811 ) ) ( not ( = ?auto_383805 ?auto_383812 ) ) ( not ( = ?auto_383805 ?auto_383813 ) ) ( not ( = ?auto_383805 ?auto_383814 ) ) ( not ( = ?auto_383806 ?auto_383807 ) ) ( not ( = ?auto_383806 ?auto_383808 ) ) ( not ( = ?auto_383806 ?auto_383809 ) ) ( not ( = ?auto_383806 ?auto_383810 ) ) ( not ( = ?auto_383806 ?auto_383811 ) ) ( not ( = ?auto_383806 ?auto_383812 ) ) ( not ( = ?auto_383806 ?auto_383813 ) ) ( not ( = ?auto_383806 ?auto_383814 ) ) ( not ( = ?auto_383807 ?auto_383808 ) ) ( not ( = ?auto_383807 ?auto_383809 ) ) ( not ( = ?auto_383807 ?auto_383810 ) ) ( not ( = ?auto_383807 ?auto_383811 ) ) ( not ( = ?auto_383807 ?auto_383812 ) ) ( not ( = ?auto_383807 ?auto_383813 ) ) ( not ( = ?auto_383807 ?auto_383814 ) ) ( not ( = ?auto_383808 ?auto_383809 ) ) ( not ( = ?auto_383808 ?auto_383810 ) ) ( not ( = ?auto_383808 ?auto_383811 ) ) ( not ( = ?auto_383808 ?auto_383812 ) ) ( not ( = ?auto_383808 ?auto_383813 ) ) ( not ( = ?auto_383808 ?auto_383814 ) ) ( not ( = ?auto_383809 ?auto_383810 ) ) ( not ( = ?auto_383809 ?auto_383811 ) ) ( not ( = ?auto_383809 ?auto_383812 ) ) ( not ( = ?auto_383809 ?auto_383813 ) ) ( not ( = ?auto_383809 ?auto_383814 ) ) ( not ( = ?auto_383810 ?auto_383811 ) ) ( not ( = ?auto_383810 ?auto_383812 ) ) ( not ( = ?auto_383810 ?auto_383813 ) ) ( not ( = ?auto_383810 ?auto_383814 ) ) ( not ( = ?auto_383811 ?auto_383812 ) ) ( not ( = ?auto_383811 ?auto_383813 ) ) ( not ( = ?auto_383811 ?auto_383814 ) ) ( not ( = ?auto_383812 ?auto_383813 ) ) ( not ( = ?auto_383812 ?auto_383814 ) ) ( not ( = ?auto_383813 ?auto_383814 ) ) ( ON ?auto_383812 ?auto_383813 ) ( ON ?auto_383811 ?auto_383812 ) ( CLEAR ?auto_383809 ) ( ON ?auto_383810 ?auto_383811 ) ( CLEAR ?auto_383810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_383802 ?auto_383803 ?auto_383804 ?auto_383805 ?auto_383806 ?auto_383807 ?auto_383808 ?auto_383809 ?auto_383810 )
      ( MAKE-12PILE ?auto_383802 ?auto_383803 ?auto_383804 ?auto_383805 ?auto_383806 ?auto_383807 ?auto_383808 ?auto_383809 ?auto_383810 ?auto_383811 ?auto_383812 ?auto_383813 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383827 - BLOCK
      ?auto_383828 - BLOCK
      ?auto_383829 - BLOCK
      ?auto_383830 - BLOCK
      ?auto_383831 - BLOCK
      ?auto_383832 - BLOCK
      ?auto_383833 - BLOCK
      ?auto_383834 - BLOCK
      ?auto_383835 - BLOCK
      ?auto_383836 - BLOCK
      ?auto_383837 - BLOCK
      ?auto_383838 - BLOCK
    )
    :vars
    (
      ?auto_383839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383838 ?auto_383839 ) ( ON-TABLE ?auto_383827 ) ( ON ?auto_383828 ?auto_383827 ) ( ON ?auto_383829 ?auto_383828 ) ( ON ?auto_383830 ?auto_383829 ) ( ON ?auto_383831 ?auto_383830 ) ( ON ?auto_383832 ?auto_383831 ) ( ON ?auto_383833 ?auto_383832 ) ( ON ?auto_383834 ?auto_383833 ) ( not ( = ?auto_383827 ?auto_383828 ) ) ( not ( = ?auto_383827 ?auto_383829 ) ) ( not ( = ?auto_383827 ?auto_383830 ) ) ( not ( = ?auto_383827 ?auto_383831 ) ) ( not ( = ?auto_383827 ?auto_383832 ) ) ( not ( = ?auto_383827 ?auto_383833 ) ) ( not ( = ?auto_383827 ?auto_383834 ) ) ( not ( = ?auto_383827 ?auto_383835 ) ) ( not ( = ?auto_383827 ?auto_383836 ) ) ( not ( = ?auto_383827 ?auto_383837 ) ) ( not ( = ?auto_383827 ?auto_383838 ) ) ( not ( = ?auto_383827 ?auto_383839 ) ) ( not ( = ?auto_383828 ?auto_383829 ) ) ( not ( = ?auto_383828 ?auto_383830 ) ) ( not ( = ?auto_383828 ?auto_383831 ) ) ( not ( = ?auto_383828 ?auto_383832 ) ) ( not ( = ?auto_383828 ?auto_383833 ) ) ( not ( = ?auto_383828 ?auto_383834 ) ) ( not ( = ?auto_383828 ?auto_383835 ) ) ( not ( = ?auto_383828 ?auto_383836 ) ) ( not ( = ?auto_383828 ?auto_383837 ) ) ( not ( = ?auto_383828 ?auto_383838 ) ) ( not ( = ?auto_383828 ?auto_383839 ) ) ( not ( = ?auto_383829 ?auto_383830 ) ) ( not ( = ?auto_383829 ?auto_383831 ) ) ( not ( = ?auto_383829 ?auto_383832 ) ) ( not ( = ?auto_383829 ?auto_383833 ) ) ( not ( = ?auto_383829 ?auto_383834 ) ) ( not ( = ?auto_383829 ?auto_383835 ) ) ( not ( = ?auto_383829 ?auto_383836 ) ) ( not ( = ?auto_383829 ?auto_383837 ) ) ( not ( = ?auto_383829 ?auto_383838 ) ) ( not ( = ?auto_383829 ?auto_383839 ) ) ( not ( = ?auto_383830 ?auto_383831 ) ) ( not ( = ?auto_383830 ?auto_383832 ) ) ( not ( = ?auto_383830 ?auto_383833 ) ) ( not ( = ?auto_383830 ?auto_383834 ) ) ( not ( = ?auto_383830 ?auto_383835 ) ) ( not ( = ?auto_383830 ?auto_383836 ) ) ( not ( = ?auto_383830 ?auto_383837 ) ) ( not ( = ?auto_383830 ?auto_383838 ) ) ( not ( = ?auto_383830 ?auto_383839 ) ) ( not ( = ?auto_383831 ?auto_383832 ) ) ( not ( = ?auto_383831 ?auto_383833 ) ) ( not ( = ?auto_383831 ?auto_383834 ) ) ( not ( = ?auto_383831 ?auto_383835 ) ) ( not ( = ?auto_383831 ?auto_383836 ) ) ( not ( = ?auto_383831 ?auto_383837 ) ) ( not ( = ?auto_383831 ?auto_383838 ) ) ( not ( = ?auto_383831 ?auto_383839 ) ) ( not ( = ?auto_383832 ?auto_383833 ) ) ( not ( = ?auto_383832 ?auto_383834 ) ) ( not ( = ?auto_383832 ?auto_383835 ) ) ( not ( = ?auto_383832 ?auto_383836 ) ) ( not ( = ?auto_383832 ?auto_383837 ) ) ( not ( = ?auto_383832 ?auto_383838 ) ) ( not ( = ?auto_383832 ?auto_383839 ) ) ( not ( = ?auto_383833 ?auto_383834 ) ) ( not ( = ?auto_383833 ?auto_383835 ) ) ( not ( = ?auto_383833 ?auto_383836 ) ) ( not ( = ?auto_383833 ?auto_383837 ) ) ( not ( = ?auto_383833 ?auto_383838 ) ) ( not ( = ?auto_383833 ?auto_383839 ) ) ( not ( = ?auto_383834 ?auto_383835 ) ) ( not ( = ?auto_383834 ?auto_383836 ) ) ( not ( = ?auto_383834 ?auto_383837 ) ) ( not ( = ?auto_383834 ?auto_383838 ) ) ( not ( = ?auto_383834 ?auto_383839 ) ) ( not ( = ?auto_383835 ?auto_383836 ) ) ( not ( = ?auto_383835 ?auto_383837 ) ) ( not ( = ?auto_383835 ?auto_383838 ) ) ( not ( = ?auto_383835 ?auto_383839 ) ) ( not ( = ?auto_383836 ?auto_383837 ) ) ( not ( = ?auto_383836 ?auto_383838 ) ) ( not ( = ?auto_383836 ?auto_383839 ) ) ( not ( = ?auto_383837 ?auto_383838 ) ) ( not ( = ?auto_383837 ?auto_383839 ) ) ( not ( = ?auto_383838 ?auto_383839 ) ) ( ON ?auto_383837 ?auto_383838 ) ( ON ?auto_383836 ?auto_383837 ) ( CLEAR ?auto_383834 ) ( ON ?auto_383835 ?auto_383836 ) ( CLEAR ?auto_383835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_383827 ?auto_383828 ?auto_383829 ?auto_383830 ?auto_383831 ?auto_383832 ?auto_383833 ?auto_383834 ?auto_383835 )
      ( MAKE-12PILE ?auto_383827 ?auto_383828 ?auto_383829 ?auto_383830 ?auto_383831 ?auto_383832 ?auto_383833 ?auto_383834 ?auto_383835 ?auto_383836 ?auto_383837 ?auto_383838 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383852 - BLOCK
      ?auto_383853 - BLOCK
      ?auto_383854 - BLOCK
      ?auto_383855 - BLOCK
      ?auto_383856 - BLOCK
      ?auto_383857 - BLOCK
      ?auto_383858 - BLOCK
      ?auto_383859 - BLOCK
      ?auto_383860 - BLOCK
      ?auto_383861 - BLOCK
      ?auto_383862 - BLOCK
      ?auto_383863 - BLOCK
    )
    :vars
    (
      ?auto_383864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383863 ?auto_383864 ) ( ON-TABLE ?auto_383852 ) ( ON ?auto_383853 ?auto_383852 ) ( ON ?auto_383854 ?auto_383853 ) ( ON ?auto_383855 ?auto_383854 ) ( ON ?auto_383856 ?auto_383855 ) ( ON ?auto_383857 ?auto_383856 ) ( ON ?auto_383858 ?auto_383857 ) ( not ( = ?auto_383852 ?auto_383853 ) ) ( not ( = ?auto_383852 ?auto_383854 ) ) ( not ( = ?auto_383852 ?auto_383855 ) ) ( not ( = ?auto_383852 ?auto_383856 ) ) ( not ( = ?auto_383852 ?auto_383857 ) ) ( not ( = ?auto_383852 ?auto_383858 ) ) ( not ( = ?auto_383852 ?auto_383859 ) ) ( not ( = ?auto_383852 ?auto_383860 ) ) ( not ( = ?auto_383852 ?auto_383861 ) ) ( not ( = ?auto_383852 ?auto_383862 ) ) ( not ( = ?auto_383852 ?auto_383863 ) ) ( not ( = ?auto_383852 ?auto_383864 ) ) ( not ( = ?auto_383853 ?auto_383854 ) ) ( not ( = ?auto_383853 ?auto_383855 ) ) ( not ( = ?auto_383853 ?auto_383856 ) ) ( not ( = ?auto_383853 ?auto_383857 ) ) ( not ( = ?auto_383853 ?auto_383858 ) ) ( not ( = ?auto_383853 ?auto_383859 ) ) ( not ( = ?auto_383853 ?auto_383860 ) ) ( not ( = ?auto_383853 ?auto_383861 ) ) ( not ( = ?auto_383853 ?auto_383862 ) ) ( not ( = ?auto_383853 ?auto_383863 ) ) ( not ( = ?auto_383853 ?auto_383864 ) ) ( not ( = ?auto_383854 ?auto_383855 ) ) ( not ( = ?auto_383854 ?auto_383856 ) ) ( not ( = ?auto_383854 ?auto_383857 ) ) ( not ( = ?auto_383854 ?auto_383858 ) ) ( not ( = ?auto_383854 ?auto_383859 ) ) ( not ( = ?auto_383854 ?auto_383860 ) ) ( not ( = ?auto_383854 ?auto_383861 ) ) ( not ( = ?auto_383854 ?auto_383862 ) ) ( not ( = ?auto_383854 ?auto_383863 ) ) ( not ( = ?auto_383854 ?auto_383864 ) ) ( not ( = ?auto_383855 ?auto_383856 ) ) ( not ( = ?auto_383855 ?auto_383857 ) ) ( not ( = ?auto_383855 ?auto_383858 ) ) ( not ( = ?auto_383855 ?auto_383859 ) ) ( not ( = ?auto_383855 ?auto_383860 ) ) ( not ( = ?auto_383855 ?auto_383861 ) ) ( not ( = ?auto_383855 ?auto_383862 ) ) ( not ( = ?auto_383855 ?auto_383863 ) ) ( not ( = ?auto_383855 ?auto_383864 ) ) ( not ( = ?auto_383856 ?auto_383857 ) ) ( not ( = ?auto_383856 ?auto_383858 ) ) ( not ( = ?auto_383856 ?auto_383859 ) ) ( not ( = ?auto_383856 ?auto_383860 ) ) ( not ( = ?auto_383856 ?auto_383861 ) ) ( not ( = ?auto_383856 ?auto_383862 ) ) ( not ( = ?auto_383856 ?auto_383863 ) ) ( not ( = ?auto_383856 ?auto_383864 ) ) ( not ( = ?auto_383857 ?auto_383858 ) ) ( not ( = ?auto_383857 ?auto_383859 ) ) ( not ( = ?auto_383857 ?auto_383860 ) ) ( not ( = ?auto_383857 ?auto_383861 ) ) ( not ( = ?auto_383857 ?auto_383862 ) ) ( not ( = ?auto_383857 ?auto_383863 ) ) ( not ( = ?auto_383857 ?auto_383864 ) ) ( not ( = ?auto_383858 ?auto_383859 ) ) ( not ( = ?auto_383858 ?auto_383860 ) ) ( not ( = ?auto_383858 ?auto_383861 ) ) ( not ( = ?auto_383858 ?auto_383862 ) ) ( not ( = ?auto_383858 ?auto_383863 ) ) ( not ( = ?auto_383858 ?auto_383864 ) ) ( not ( = ?auto_383859 ?auto_383860 ) ) ( not ( = ?auto_383859 ?auto_383861 ) ) ( not ( = ?auto_383859 ?auto_383862 ) ) ( not ( = ?auto_383859 ?auto_383863 ) ) ( not ( = ?auto_383859 ?auto_383864 ) ) ( not ( = ?auto_383860 ?auto_383861 ) ) ( not ( = ?auto_383860 ?auto_383862 ) ) ( not ( = ?auto_383860 ?auto_383863 ) ) ( not ( = ?auto_383860 ?auto_383864 ) ) ( not ( = ?auto_383861 ?auto_383862 ) ) ( not ( = ?auto_383861 ?auto_383863 ) ) ( not ( = ?auto_383861 ?auto_383864 ) ) ( not ( = ?auto_383862 ?auto_383863 ) ) ( not ( = ?auto_383862 ?auto_383864 ) ) ( not ( = ?auto_383863 ?auto_383864 ) ) ( ON ?auto_383862 ?auto_383863 ) ( ON ?auto_383861 ?auto_383862 ) ( ON ?auto_383860 ?auto_383861 ) ( CLEAR ?auto_383858 ) ( ON ?auto_383859 ?auto_383860 ) ( CLEAR ?auto_383859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_383852 ?auto_383853 ?auto_383854 ?auto_383855 ?auto_383856 ?auto_383857 ?auto_383858 ?auto_383859 )
      ( MAKE-12PILE ?auto_383852 ?auto_383853 ?auto_383854 ?auto_383855 ?auto_383856 ?auto_383857 ?auto_383858 ?auto_383859 ?auto_383860 ?auto_383861 ?auto_383862 ?auto_383863 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383877 - BLOCK
      ?auto_383878 - BLOCK
      ?auto_383879 - BLOCK
      ?auto_383880 - BLOCK
      ?auto_383881 - BLOCK
      ?auto_383882 - BLOCK
      ?auto_383883 - BLOCK
      ?auto_383884 - BLOCK
      ?auto_383885 - BLOCK
      ?auto_383886 - BLOCK
      ?auto_383887 - BLOCK
      ?auto_383888 - BLOCK
    )
    :vars
    (
      ?auto_383889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383888 ?auto_383889 ) ( ON-TABLE ?auto_383877 ) ( ON ?auto_383878 ?auto_383877 ) ( ON ?auto_383879 ?auto_383878 ) ( ON ?auto_383880 ?auto_383879 ) ( ON ?auto_383881 ?auto_383880 ) ( ON ?auto_383882 ?auto_383881 ) ( ON ?auto_383883 ?auto_383882 ) ( not ( = ?auto_383877 ?auto_383878 ) ) ( not ( = ?auto_383877 ?auto_383879 ) ) ( not ( = ?auto_383877 ?auto_383880 ) ) ( not ( = ?auto_383877 ?auto_383881 ) ) ( not ( = ?auto_383877 ?auto_383882 ) ) ( not ( = ?auto_383877 ?auto_383883 ) ) ( not ( = ?auto_383877 ?auto_383884 ) ) ( not ( = ?auto_383877 ?auto_383885 ) ) ( not ( = ?auto_383877 ?auto_383886 ) ) ( not ( = ?auto_383877 ?auto_383887 ) ) ( not ( = ?auto_383877 ?auto_383888 ) ) ( not ( = ?auto_383877 ?auto_383889 ) ) ( not ( = ?auto_383878 ?auto_383879 ) ) ( not ( = ?auto_383878 ?auto_383880 ) ) ( not ( = ?auto_383878 ?auto_383881 ) ) ( not ( = ?auto_383878 ?auto_383882 ) ) ( not ( = ?auto_383878 ?auto_383883 ) ) ( not ( = ?auto_383878 ?auto_383884 ) ) ( not ( = ?auto_383878 ?auto_383885 ) ) ( not ( = ?auto_383878 ?auto_383886 ) ) ( not ( = ?auto_383878 ?auto_383887 ) ) ( not ( = ?auto_383878 ?auto_383888 ) ) ( not ( = ?auto_383878 ?auto_383889 ) ) ( not ( = ?auto_383879 ?auto_383880 ) ) ( not ( = ?auto_383879 ?auto_383881 ) ) ( not ( = ?auto_383879 ?auto_383882 ) ) ( not ( = ?auto_383879 ?auto_383883 ) ) ( not ( = ?auto_383879 ?auto_383884 ) ) ( not ( = ?auto_383879 ?auto_383885 ) ) ( not ( = ?auto_383879 ?auto_383886 ) ) ( not ( = ?auto_383879 ?auto_383887 ) ) ( not ( = ?auto_383879 ?auto_383888 ) ) ( not ( = ?auto_383879 ?auto_383889 ) ) ( not ( = ?auto_383880 ?auto_383881 ) ) ( not ( = ?auto_383880 ?auto_383882 ) ) ( not ( = ?auto_383880 ?auto_383883 ) ) ( not ( = ?auto_383880 ?auto_383884 ) ) ( not ( = ?auto_383880 ?auto_383885 ) ) ( not ( = ?auto_383880 ?auto_383886 ) ) ( not ( = ?auto_383880 ?auto_383887 ) ) ( not ( = ?auto_383880 ?auto_383888 ) ) ( not ( = ?auto_383880 ?auto_383889 ) ) ( not ( = ?auto_383881 ?auto_383882 ) ) ( not ( = ?auto_383881 ?auto_383883 ) ) ( not ( = ?auto_383881 ?auto_383884 ) ) ( not ( = ?auto_383881 ?auto_383885 ) ) ( not ( = ?auto_383881 ?auto_383886 ) ) ( not ( = ?auto_383881 ?auto_383887 ) ) ( not ( = ?auto_383881 ?auto_383888 ) ) ( not ( = ?auto_383881 ?auto_383889 ) ) ( not ( = ?auto_383882 ?auto_383883 ) ) ( not ( = ?auto_383882 ?auto_383884 ) ) ( not ( = ?auto_383882 ?auto_383885 ) ) ( not ( = ?auto_383882 ?auto_383886 ) ) ( not ( = ?auto_383882 ?auto_383887 ) ) ( not ( = ?auto_383882 ?auto_383888 ) ) ( not ( = ?auto_383882 ?auto_383889 ) ) ( not ( = ?auto_383883 ?auto_383884 ) ) ( not ( = ?auto_383883 ?auto_383885 ) ) ( not ( = ?auto_383883 ?auto_383886 ) ) ( not ( = ?auto_383883 ?auto_383887 ) ) ( not ( = ?auto_383883 ?auto_383888 ) ) ( not ( = ?auto_383883 ?auto_383889 ) ) ( not ( = ?auto_383884 ?auto_383885 ) ) ( not ( = ?auto_383884 ?auto_383886 ) ) ( not ( = ?auto_383884 ?auto_383887 ) ) ( not ( = ?auto_383884 ?auto_383888 ) ) ( not ( = ?auto_383884 ?auto_383889 ) ) ( not ( = ?auto_383885 ?auto_383886 ) ) ( not ( = ?auto_383885 ?auto_383887 ) ) ( not ( = ?auto_383885 ?auto_383888 ) ) ( not ( = ?auto_383885 ?auto_383889 ) ) ( not ( = ?auto_383886 ?auto_383887 ) ) ( not ( = ?auto_383886 ?auto_383888 ) ) ( not ( = ?auto_383886 ?auto_383889 ) ) ( not ( = ?auto_383887 ?auto_383888 ) ) ( not ( = ?auto_383887 ?auto_383889 ) ) ( not ( = ?auto_383888 ?auto_383889 ) ) ( ON ?auto_383887 ?auto_383888 ) ( ON ?auto_383886 ?auto_383887 ) ( ON ?auto_383885 ?auto_383886 ) ( CLEAR ?auto_383883 ) ( ON ?auto_383884 ?auto_383885 ) ( CLEAR ?auto_383884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_383877 ?auto_383878 ?auto_383879 ?auto_383880 ?auto_383881 ?auto_383882 ?auto_383883 ?auto_383884 )
      ( MAKE-12PILE ?auto_383877 ?auto_383878 ?auto_383879 ?auto_383880 ?auto_383881 ?auto_383882 ?auto_383883 ?auto_383884 ?auto_383885 ?auto_383886 ?auto_383887 ?auto_383888 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383902 - BLOCK
      ?auto_383903 - BLOCK
      ?auto_383904 - BLOCK
      ?auto_383905 - BLOCK
      ?auto_383906 - BLOCK
      ?auto_383907 - BLOCK
      ?auto_383908 - BLOCK
      ?auto_383909 - BLOCK
      ?auto_383910 - BLOCK
      ?auto_383911 - BLOCK
      ?auto_383912 - BLOCK
      ?auto_383913 - BLOCK
    )
    :vars
    (
      ?auto_383914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383913 ?auto_383914 ) ( ON-TABLE ?auto_383902 ) ( ON ?auto_383903 ?auto_383902 ) ( ON ?auto_383904 ?auto_383903 ) ( ON ?auto_383905 ?auto_383904 ) ( ON ?auto_383906 ?auto_383905 ) ( ON ?auto_383907 ?auto_383906 ) ( not ( = ?auto_383902 ?auto_383903 ) ) ( not ( = ?auto_383902 ?auto_383904 ) ) ( not ( = ?auto_383902 ?auto_383905 ) ) ( not ( = ?auto_383902 ?auto_383906 ) ) ( not ( = ?auto_383902 ?auto_383907 ) ) ( not ( = ?auto_383902 ?auto_383908 ) ) ( not ( = ?auto_383902 ?auto_383909 ) ) ( not ( = ?auto_383902 ?auto_383910 ) ) ( not ( = ?auto_383902 ?auto_383911 ) ) ( not ( = ?auto_383902 ?auto_383912 ) ) ( not ( = ?auto_383902 ?auto_383913 ) ) ( not ( = ?auto_383902 ?auto_383914 ) ) ( not ( = ?auto_383903 ?auto_383904 ) ) ( not ( = ?auto_383903 ?auto_383905 ) ) ( not ( = ?auto_383903 ?auto_383906 ) ) ( not ( = ?auto_383903 ?auto_383907 ) ) ( not ( = ?auto_383903 ?auto_383908 ) ) ( not ( = ?auto_383903 ?auto_383909 ) ) ( not ( = ?auto_383903 ?auto_383910 ) ) ( not ( = ?auto_383903 ?auto_383911 ) ) ( not ( = ?auto_383903 ?auto_383912 ) ) ( not ( = ?auto_383903 ?auto_383913 ) ) ( not ( = ?auto_383903 ?auto_383914 ) ) ( not ( = ?auto_383904 ?auto_383905 ) ) ( not ( = ?auto_383904 ?auto_383906 ) ) ( not ( = ?auto_383904 ?auto_383907 ) ) ( not ( = ?auto_383904 ?auto_383908 ) ) ( not ( = ?auto_383904 ?auto_383909 ) ) ( not ( = ?auto_383904 ?auto_383910 ) ) ( not ( = ?auto_383904 ?auto_383911 ) ) ( not ( = ?auto_383904 ?auto_383912 ) ) ( not ( = ?auto_383904 ?auto_383913 ) ) ( not ( = ?auto_383904 ?auto_383914 ) ) ( not ( = ?auto_383905 ?auto_383906 ) ) ( not ( = ?auto_383905 ?auto_383907 ) ) ( not ( = ?auto_383905 ?auto_383908 ) ) ( not ( = ?auto_383905 ?auto_383909 ) ) ( not ( = ?auto_383905 ?auto_383910 ) ) ( not ( = ?auto_383905 ?auto_383911 ) ) ( not ( = ?auto_383905 ?auto_383912 ) ) ( not ( = ?auto_383905 ?auto_383913 ) ) ( not ( = ?auto_383905 ?auto_383914 ) ) ( not ( = ?auto_383906 ?auto_383907 ) ) ( not ( = ?auto_383906 ?auto_383908 ) ) ( not ( = ?auto_383906 ?auto_383909 ) ) ( not ( = ?auto_383906 ?auto_383910 ) ) ( not ( = ?auto_383906 ?auto_383911 ) ) ( not ( = ?auto_383906 ?auto_383912 ) ) ( not ( = ?auto_383906 ?auto_383913 ) ) ( not ( = ?auto_383906 ?auto_383914 ) ) ( not ( = ?auto_383907 ?auto_383908 ) ) ( not ( = ?auto_383907 ?auto_383909 ) ) ( not ( = ?auto_383907 ?auto_383910 ) ) ( not ( = ?auto_383907 ?auto_383911 ) ) ( not ( = ?auto_383907 ?auto_383912 ) ) ( not ( = ?auto_383907 ?auto_383913 ) ) ( not ( = ?auto_383907 ?auto_383914 ) ) ( not ( = ?auto_383908 ?auto_383909 ) ) ( not ( = ?auto_383908 ?auto_383910 ) ) ( not ( = ?auto_383908 ?auto_383911 ) ) ( not ( = ?auto_383908 ?auto_383912 ) ) ( not ( = ?auto_383908 ?auto_383913 ) ) ( not ( = ?auto_383908 ?auto_383914 ) ) ( not ( = ?auto_383909 ?auto_383910 ) ) ( not ( = ?auto_383909 ?auto_383911 ) ) ( not ( = ?auto_383909 ?auto_383912 ) ) ( not ( = ?auto_383909 ?auto_383913 ) ) ( not ( = ?auto_383909 ?auto_383914 ) ) ( not ( = ?auto_383910 ?auto_383911 ) ) ( not ( = ?auto_383910 ?auto_383912 ) ) ( not ( = ?auto_383910 ?auto_383913 ) ) ( not ( = ?auto_383910 ?auto_383914 ) ) ( not ( = ?auto_383911 ?auto_383912 ) ) ( not ( = ?auto_383911 ?auto_383913 ) ) ( not ( = ?auto_383911 ?auto_383914 ) ) ( not ( = ?auto_383912 ?auto_383913 ) ) ( not ( = ?auto_383912 ?auto_383914 ) ) ( not ( = ?auto_383913 ?auto_383914 ) ) ( ON ?auto_383912 ?auto_383913 ) ( ON ?auto_383911 ?auto_383912 ) ( ON ?auto_383910 ?auto_383911 ) ( ON ?auto_383909 ?auto_383910 ) ( CLEAR ?auto_383907 ) ( ON ?auto_383908 ?auto_383909 ) ( CLEAR ?auto_383908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_383902 ?auto_383903 ?auto_383904 ?auto_383905 ?auto_383906 ?auto_383907 ?auto_383908 )
      ( MAKE-12PILE ?auto_383902 ?auto_383903 ?auto_383904 ?auto_383905 ?auto_383906 ?auto_383907 ?auto_383908 ?auto_383909 ?auto_383910 ?auto_383911 ?auto_383912 ?auto_383913 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383927 - BLOCK
      ?auto_383928 - BLOCK
      ?auto_383929 - BLOCK
      ?auto_383930 - BLOCK
      ?auto_383931 - BLOCK
      ?auto_383932 - BLOCK
      ?auto_383933 - BLOCK
      ?auto_383934 - BLOCK
      ?auto_383935 - BLOCK
      ?auto_383936 - BLOCK
      ?auto_383937 - BLOCK
      ?auto_383938 - BLOCK
    )
    :vars
    (
      ?auto_383939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383938 ?auto_383939 ) ( ON-TABLE ?auto_383927 ) ( ON ?auto_383928 ?auto_383927 ) ( ON ?auto_383929 ?auto_383928 ) ( ON ?auto_383930 ?auto_383929 ) ( ON ?auto_383931 ?auto_383930 ) ( ON ?auto_383932 ?auto_383931 ) ( not ( = ?auto_383927 ?auto_383928 ) ) ( not ( = ?auto_383927 ?auto_383929 ) ) ( not ( = ?auto_383927 ?auto_383930 ) ) ( not ( = ?auto_383927 ?auto_383931 ) ) ( not ( = ?auto_383927 ?auto_383932 ) ) ( not ( = ?auto_383927 ?auto_383933 ) ) ( not ( = ?auto_383927 ?auto_383934 ) ) ( not ( = ?auto_383927 ?auto_383935 ) ) ( not ( = ?auto_383927 ?auto_383936 ) ) ( not ( = ?auto_383927 ?auto_383937 ) ) ( not ( = ?auto_383927 ?auto_383938 ) ) ( not ( = ?auto_383927 ?auto_383939 ) ) ( not ( = ?auto_383928 ?auto_383929 ) ) ( not ( = ?auto_383928 ?auto_383930 ) ) ( not ( = ?auto_383928 ?auto_383931 ) ) ( not ( = ?auto_383928 ?auto_383932 ) ) ( not ( = ?auto_383928 ?auto_383933 ) ) ( not ( = ?auto_383928 ?auto_383934 ) ) ( not ( = ?auto_383928 ?auto_383935 ) ) ( not ( = ?auto_383928 ?auto_383936 ) ) ( not ( = ?auto_383928 ?auto_383937 ) ) ( not ( = ?auto_383928 ?auto_383938 ) ) ( not ( = ?auto_383928 ?auto_383939 ) ) ( not ( = ?auto_383929 ?auto_383930 ) ) ( not ( = ?auto_383929 ?auto_383931 ) ) ( not ( = ?auto_383929 ?auto_383932 ) ) ( not ( = ?auto_383929 ?auto_383933 ) ) ( not ( = ?auto_383929 ?auto_383934 ) ) ( not ( = ?auto_383929 ?auto_383935 ) ) ( not ( = ?auto_383929 ?auto_383936 ) ) ( not ( = ?auto_383929 ?auto_383937 ) ) ( not ( = ?auto_383929 ?auto_383938 ) ) ( not ( = ?auto_383929 ?auto_383939 ) ) ( not ( = ?auto_383930 ?auto_383931 ) ) ( not ( = ?auto_383930 ?auto_383932 ) ) ( not ( = ?auto_383930 ?auto_383933 ) ) ( not ( = ?auto_383930 ?auto_383934 ) ) ( not ( = ?auto_383930 ?auto_383935 ) ) ( not ( = ?auto_383930 ?auto_383936 ) ) ( not ( = ?auto_383930 ?auto_383937 ) ) ( not ( = ?auto_383930 ?auto_383938 ) ) ( not ( = ?auto_383930 ?auto_383939 ) ) ( not ( = ?auto_383931 ?auto_383932 ) ) ( not ( = ?auto_383931 ?auto_383933 ) ) ( not ( = ?auto_383931 ?auto_383934 ) ) ( not ( = ?auto_383931 ?auto_383935 ) ) ( not ( = ?auto_383931 ?auto_383936 ) ) ( not ( = ?auto_383931 ?auto_383937 ) ) ( not ( = ?auto_383931 ?auto_383938 ) ) ( not ( = ?auto_383931 ?auto_383939 ) ) ( not ( = ?auto_383932 ?auto_383933 ) ) ( not ( = ?auto_383932 ?auto_383934 ) ) ( not ( = ?auto_383932 ?auto_383935 ) ) ( not ( = ?auto_383932 ?auto_383936 ) ) ( not ( = ?auto_383932 ?auto_383937 ) ) ( not ( = ?auto_383932 ?auto_383938 ) ) ( not ( = ?auto_383932 ?auto_383939 ) ) ( not ( = ?auto_383933 ?auto_383934 ) ) ( not ( = ?auto_383933 ?auto_383935 ) ) ( not ( = ?auto_383933 ?auto_383936 ) ) ( not ( = ?auto_383933 ?auto_383937 ) ) ( not ( = ?auto_383933 ?auto_383938 ) ) ( not ( = ?auto_383933 ?auto_383939 ) ) ( not ( = ?auto_383934 ?auto_383935 ) ) ( not ( = ?auto_383934 ?auto_383936 ) ) ( not ( = ?auto_383934 ?auto_383937 ) ) ( not ( = ?auto_383934 ?auto_383938 ) ) ( not ( = ?auto_383934 ?auto_383939 ) ) ( not ( = ?auto_383935 ?auto_383936 ) ) ( not ( = ?auto_383935 ?auto_383937 ) ) ( not ( = ?auto_383935 ?auto_383938 ) ) ( not ( = ?auto_383935 ?auto_383939 ) ) ( not ( = ?auto_383936 ?auto_383937 ) ) ( not ( = ?auto_383936 ?auto_383938 ) ) ( not ( = ?auto_383936 ?auto_383939 ) ) ( not ( = ?auto_383937 ?auto_383938 ) ) ( not ( = ?auto_383937 ?auto_383939 ) ) ( not ( = ?auto_383938 ?auto_383939 ) ) ( ON ?auto_383937 ?auto_383938 ) ( ON ?auto_383936 ?auto_383937 ) ( ON ?auto_383935 ?auto_383936 ) ( ON ?auto_383934 ?auto_383935 ) ( CLEAR ?auto_383932 ) ( ON ?auto_383933 ?auto_383934 ) ( CLEAR ?auto_383933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_383927 ?auto_383928 ?auto_383929 ?auto_383930 ?auto_383931 ?auto_383932 ?auto_383933 )
      ( MAKE-12PILE ?auto_383927 ?auto_383928 ?auto_383929 ?auto_383930 ?auto_383931 ?auto_383932 ?auto_383933 ?auto_383934 ?auto_383935 ?auto_383936 ?auto_383937 ?auto_383938 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383952 - BLOCK
      ?auto_383953 - BLOCK
      ?auto_383954 - BLOCK
      ?auto_383955 - BLOCK
      ?auto_383956 - BLOCK
      ?auto_383957 - BLOCK
      ?auto_383958 - BLOCK
      ?auto_383959 - BLOCK
      ?auto_383960 - BLOCK
      ?auto_383961 - BLOCK
      ?auto_383962 - BLOCK
      ?auto_383963 - BLOCK
    )
    :vars
    (
      ?auto_383964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383963 ?auto_383964 ) ( ON-TABLE ?auto_383952 ) ( ON ?auto_383953 ?auto_383952 ) ( ON ?auto_383954 ?auto_383953 ) ( ON ?auto_383955 ?auto_383954 ) ( ON ?auto_383956 ?auto_383955 ) ( not ( = ?auto_383952 ?auto_383953 ) ) ( not ( = ?auto_383952 ?auto_383954 ) ) ( not ( = ?auto_383952 ?auto_383955 ) ) ( not ( = ?auto_383952 ?auto_383956 ) ) ( not ( = ?auto_383952 ?auto_383957 ) ) ( not ( = ?auto_383952 ?auto_383958 ) ) ( not ( = ?auto_383952 ?auto_383959 ) ) ( not ( = ?auto_383952 ?auto_383960 ) ) ( not ( = ?auto_383952 ?auto_383961 ) ) ( not ( = ?auto_383952 ?auto_383962 ) ) ( not ( = ?auto_383952 ?auto_383963 ) ) ( not ( = ?auto_383952 ?auto_383964 ) ) ( not ( = ?auto_383953 ?auto_383954 ) ) ( not ( = ?auto_383953 ?auto_383955 ) ) ( not ( = ?auto_383953 ?auto_383956 ) ) ( not ( = ?auto_383953 ?auto_383957 ) ) ( not ( = ?auto_383953 ?auto_383958 ) ) ( not ( = ?auto_383953 ?auto_383959 ) ) ( not ( = ?auto_383953 ?auto_383960 ) ) ( not ( = ?auto_383953 ?auto_383961 ) ) ( not ( = ?auto_383953 ?auto_383962 ) ) ( not ( = ?auto_383953 ?auto_383963 ) ) ( not ( = ?auto_383953 ?auto_383964 ) ) ( not ( = ?auto_383954 ?auto_383955 ) ) ( not ( = ?auto_383954 ?auto_383956 ) ) ( not ( = ?auto_383954 ?auto_383957 ) ) ( not ( = ?auto_383954 ?auto_383958 ) ) ( not ( = ?auto_383954 ?auto_383959 ) ) ( not ( = ?auto_383954 ?auto_383960 ) ) ( not ( = ?auto_383954 ?auto_383961 ) ) ( not ( = ?auto_383954 ?auto_383962 ) ) ( not ( = ?auto_383954 ?auto_383963 ) ) ( not ( = ?auto_383954 ?auto_383964 ) ) ( not ( = ?auto_383955 ?auto_383956 ) ) ( not ( = ?auto_383955 ?auto_383957 ) ) ( not ( = ?auto_383955 ?auto_383958 ) ) ( not ( = ?auto_383955 ?auto_383959 ) ) ( not ( = ?auto_383955 ?auto_383960 ) ) ( not ( = ?auto_383955 ?auto_383961 ) ) ( not ( = ?auto_383955 ?auto_383962 ) ) ( not ( = ?auto_383955 ?auto_383963 ) ) ( not ( = ?auto_383955 ?auto_383964 ) ) ( not ( = ?auto_383956 ?auto_383957 ) ) ( not ( = ?auto_383956 ?auto_383958 ) ) ( not ( = ?auto_383956 ?auto_383959 ) ) ( not ( = ?auto_383956 ?auto_383960 ) ) ( not ( = ?auto_383956 ?auto_383961 ) ) ( not ( = ?auto_383956 ?auto_383962 ) ) ( not ( = ?auto_383956 ?auto_383963 ) ) ( not ( = ?auto_383956 ?auto_383964 ) ) ( not ( = ?auto_383957 ?auto_383958 ) ) ( not ( = ?auto_383957 ?auto_383959 ) ) ( not ( = ?auto_383957 ?auto_383960 ) ) ( not ( = ?auto_383957 ?auto_383961 ) ) ( not ( = ?auto_383957 ?auto_383962 ) ) ( not ( = ?auto_383957 ?auto_383963 ) ) ( not ( = ?auto_383957 ?auto_383964 ) ) ( not ( = ?auto_383958 ?auto_383959 ) ) ( not ( = ?auto_383958 ?auto_383960 ) ) ( not ( = ?auto_383958 ?auto_383961 ) ) ( not ( = ?auto_383958 ?auto_383962 ) ) ( not ( = ?auto_383958 ?auto_383963 ) ) ( not ( = ?auto_383958 ?auto_383964 ) ) ( not ( = ?auto_383959 ?auto_383960 ) ) ( not ( = ?auto_383959 ?auto_383961 ) ) ( not ( = ?auto_383959 ?auto_383962 ) ) ( not ( = ?auto_383959 ?auto_383963 ) ) ( not ( = ?auto_383959 ?auto_383964 ) ) ( not ( = ?auto_383960 ?auto_383961 ) ) ( not ( = ?auto_383960 ?auto_383962 ) ) ( not ( = ?auto_383960 ?auto_383963 ) ) ( not ( = ?auto_383960 ?auto_383964 ) ) ( not ( = ?auto_383961 ?auto_383962 ) ) ( not ( = ?auto_383961 ?auto_383963 ) ) ( not ( = ?auto_383961 ?auto_383964 ) ) ( not ( = ?auto_383962 ?auto_383963 ) ) ( not ( = ?auto_383962 ?auto_383964 ) ) ( not ( = ?auto_383963 ?auto_383964 ) ) ( ON ?auto_383962 ?auto_383963 ) ( ON ?auto_383961 ?auto_383962 ) ( ON ?auto_383960 ?auto_383961 ) ( ON ?auto_383959 ?auto_383960 ) ( ON ?auto_383958 ?auto_383959 ) ( CLEAR ?auto_383956 ) ( ON ?auto_383957 ?auto_383958 ) ( CLEAR ?auto_383957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_383952 ?auto_383953 ?auto_383954 ?auto_383955 ?auto_383956 ?auto_383957 )
      ( MAKE-12PILE ?auto_383952 ?auto_383953 ?auto_383954 ?auto_383955 ?auto_383956 ?auto_383957 ?auto_383958 ?auto_383959 ?auto_383960 ?auto_383961 ?auto_383962 ?auto_383963 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_383977 - BLOCK
      ?auto_383978 - BLOCK
      ?auto_383979 - BLOCK
      ?auto_383980 - BLOCK
      ?auto_383981 - BLOCK
      ?auto_383982 - BLOCK
      ?auto_383983 - BLOCK
      ?auto_383984 - BLOCK
      ?auto_383985 - BLOCK
      ?auto_383986 - BLOCK
      ?auto_383987 - BLOCK
      ?auto_383988 - BLOCK
    )
    :vars
    (
      ?auto_383989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_383988 ?auto_383989 ) ( ON-TABLE ?auto_383977 ) ( ON ?auto_383978 ?auto_383977 ) ( ON ?auto_383979 ?auto_383978 ) ( ON ?auto_383980 ?auto_383979 ) ( ON ?auto_383981 ?auto_383980 ) ( not ( = ?auto_383977 ?auto_383978 ) ) ( not ( = ?auto_383977 ?auto_383979 ) ) ( not ( = ?auto_383977 ?auto_383980 ) ) ( not ( = ?auto_383977 ?auto_383981 ) ) ( not ( = ?auto_383977 ?auto_383982 ) ) ( not ( = ?auto_383977 ?auto_383983 ) ) ( not ( = ?auto_383977 ?auto_383984 ) ) ( not ( = ?auto_383977 ?auto_383985 ) ) ( not ( = ?auto_383977 ?auto_383986 ) ) ( not ( = ?auto_383977 ?auto_383987 ) ) ( not ( = ?auto_383977 ?auto_383988 ) ) ( not ( = ?auto_383977 ?auto_383989 ) ) ( not ( = ?auto_383978 ?auto_383979 ) ) ( not ( = ?auto_383978 ?auto_383980 ) ) ( not ( = ?auto_383978 ?auto_383981 ) ) ( not ( = ?auto_383978 ?auto_383982 ) ) ( not ( = ?auto_383978 ?auto_383983 ) ) ( not ( = ?auto_383978 ?auto_383984 ) ) ( not ( = ?auto_383978 ?auto_383985 ) ) ( not ( = ?auto_383978 ?auto_383986 ) ) ( not ( = ?auto_383978 ?auto_383987 ) ) ( not ( = ?auto_383978 ?auto_383988 ) ) ( not ( = ?auto_383978 ?auto_383989 ) ) ( not ( = ?auto_383979 ?auto_383980 ) ) ( not ( = ?auto_383979 ?auto_383981 ) ) ( not ( = ?auto_383979 ?auto_383982 ) ) ( not ( = ?auto_383979 ?auto_383983 ) ) ( not ( = ?auto_383979 ?auto_383984 ) ) ( not ( = ?auto_383979 ?auto_383985 ) ) ( not ( = ?auto_383979 ?auto_383986 ) ) ( not ( = ?auto_383979 ?auto_383987 ) ) ( not ( = ?auto_383979 ?auto_383988 ) ) ( not ( = ?auto_383979 ?auto_383989 ) ) ( not ( = ?auto_383980 ?auto_383981 ) ) ( not ( = ?auto_383980 ?auto_383982 ) ) ( not ( = ?auto_383980 ?auto_383983 ) ) ( not ( = ?auto_383980 ?auto_383984 ) ) ( not ( = ?auto_383980 ?auto_383985 ) ) ( not ( = ?auto_383980 ?auto_383986 ) ) ( not ( = ?auto_383980 ?auto_383987 ) ) ( not ( = ?auto_383980 ?auto_383988 ) ) ( not ( = ?auto_383980 ?auto_383989 ) ) ( not ( = ?auto_383981 ?auto_383982 ) ) ( not ( = ?auto_383981 ?auto_383983 ) ) ( not ( = ?auto_383981 ?auto_383984 ) ) ( not ( = ?auto_383981 ?auto_383985 ) ) ( not ( = ?auto_383981 ?auto_383986 ) ) ( not ( = ?auto_383981 ?auto_383987 ) ) ( not ( = ?auto_383981 ?auto_383988 ) ) ( not ( = ?auto_383981 ?auto_383989 ) ) ( not ( = ?auto_383982 ?auto_383983 ) ) ( not ( = ?auto_383982 ?auto_383984 ) ) ( not ( = ?auto_383982 ?auto_383985 ) ) ( not ( = ?auto_383982 ?auto_383986 ) ) ( not ( = ?auto_383982 ?auto_383987 ) ) ( not ( = ?auto_383982 ?auto_383988 ) ) ( not ( = ?auto_383982 ?auto_383989 ) ) ( not ( = ?auto_383983 ?auto_383984 ) ) ( not ( = ?auto_383983 ?auto_383985 ) ) ( not ( = ?auto_383983 ?auto_383986 ) ) ( not ( = ?auto_383983 ?auto_383987 ) ) ( not ( = ?auto_383983 ?auto_383988 ) ) ( not ( = ?auto_383983 ?auto_383989 ) ) ( not ( = ?auto_383984 ?auto_383985 ) ) ( not ( = ?auto_383984 ?auto_383986 ) ) ( not ( = ?auto_383984 ?auto_383987 ) ) ( not ( = ?auto_383984 ?auto_383988 ) ) ( not ( = ?auto_383984 ?auto_383989 ) ) ( not ( = ?auto_383985 ?auto_383986 ) ) ( not ( = ?auto_383985 ?auto_383987 ) ) ( not ( = ?auto_383985 ?auto_383988 ) ) ( not ( = ?auto_383985 ?auto_383989 ) ) ( not ( = ?auto_383986 ?auto_383987 ) ) ( not ( = ?auto_383986 ?auto_383988 ) ) ( not ( = ?auto_383986 ?auto_383989 ) ) ( not ( = ?auto_383987 ?auto_383988 ) ) ( not ( = ?auto_383987 ?auto_383989 ) ) ( not ( = ?auto_383988 ?auto_383989 ) ) ( ON ?auto_383987 ?auto_383988 ) ( ON ?auto_383986 ?auto_383987 ) ( ON ?auto_383985 ?auto_383986 ) ( ON ?auto_383984 ?auto_383985 ) ( ON ?auto_383983 ?auto_383984 ) ( CLEAR ?auto_383981 ) ( ON ?auto_383982 ?auto_383983 ) ( CLEAR ?auto_383982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_383977 ?auto_383978 ?auto_383979 ?auto_383980 ?auto_383981 ?auto_383982 )
      ( MAKE-12PILE ?auto_383977 ?auto_383978 ?auto_383979 ?auto_383980 ?auto_383981 ?auto_383982 ?auto_383983 ?auto_383984 ?auto_383985 ?auto_383986 ?auto_383987 ?auto_383988 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384002 - BLOCK
      ?auto_384003 - BLOCK
      ?auto_384004 - BLOCK
      ?auto_384005 - BLOCK
      ?auto_384006 - BLOCK
      ?auto_384007 - BLOCK
      ?auto_384008 - BLOCK
      ?auto_384009 - BLOCK
      ?auto_384010 - BLOCK
      ?auto_384011 - BLOCK
      ?auto_384012 - BLOCK
      ?auto_384013 - BLOCK
    )
    :vars
    (
      ?auto_384014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384013 ?auto_384014 ) ( ON-TABLE ?auto_384002 ) ( ON ?auto_384003 ?auto_384002 ) ( ON ?auto_384004 ?auto_384003 ) ( ON ?auto_384005 ?auto_384004 ) ( not ( = ?auto_384002 ?auto_384003 ) ) ( not ( = ?auto_384002 ?auto_384004 ) ) ( not ( = ?auto_384002 ?auto_384005 ) ) ( not ( = ?auto_384002 ?auto_384006 ) ) ( not ( = ?auto_384002 ?auto_384007 ) ) ( not ( = ?auto_384002 ?auto_384008 ) ) ( not ( = ?auto_384002 ?auto_384009 ) ) ( not ( = ?auto_384002 ?auto_384010 ) ) ( not ( = ?auto_384002 ?auto_384011 ) ) ( not ( = ?auto_384002 ?auto_384012 ) ) ( not ( = ?auto_384002 ?auto_384013 ) ) ( not ( = ?auto_384002 ?auto_384014 ) ) ( not ( = ?auto_384003 ?auto_384004 ) ) ( not ( = ?auto_384003 ?auto_384005 ) ) ( not ( = ?auto_384003 ?auto_384006 ) ) ( not ( = ?auto_384003 ?auto_384007 ) ) ( not ( = ?auto_384003 ?auto_384008 ) ) ( not ( = ?auto_384003 ?auto_384009 ) ) ( not ( = ?auto_384003 ?auto_384010 ) ) ( not ( = ?auto_384003 ?auto_384011 ) ) ( not ( = ?auto_384003 ?auto_384012 ) ) ( not ( = ?auto_384003 ?auto_384013 ) ) ( not ( = ?auto_384003 ?auto_384014 ) ) ( not ( = ?auto_384004 ?auto_384005 ) ) ( not ( = ?auto_384004 ?auto_384006 ) ) ( not ( = ?auto_384004 ?auto_384007 ) ) ( not ( = ?auto_384004 ?auto_384008 ) ) ( not ( = ?auto_384004 ?auto_384009 ) ) ( not ( = ?auto_384004 ?auto_384010 ) ) ( not ( = ?auto_384004 ?auto_384011 ) ) ( not ( = ?auto_384004 ?auto_384012 ) ) ( not ( = ?auto_384004 ?auto_384013 ) ) ( not ( = ?auto_384004 ?auto_384014 ) ) ( not ( = ?auto_384005 ?auto_384006 ) ) ( not ( = ?auto_384005 ?auto_384007 ) ) ( not ( = ?auto_384005 ?auto_384008 ) ) ( not ( = ?auto_384005 ?auto_384009 ) ) ( not ( = ?auto_384005 ?auto_384010 ) ) ( not ( = ?auto_384005 ?auto_384011 ) ) ( not ( = ?auto_384005 ?auto_384012 ) ) ( not ( = ?auto_384005 ?auto_384013 ) ) ( not ( = ?auto_384005 ?auto_384014 ) ) ( not ( = ?auto_384006 ?auto_384007 ) ) ( not ( = ?auto_384006 ?auto_384008 ) ) ( not ( = ?auto_384006 ?auto_384009 ) ) ( not ( = ?auto_384006 ?auto_384010 ) ) ( not ( = ?auto_384006 ?auto_384011 ) ) ( not ( = ?auto_384006 ?auto_384012 ) ) ( not ( = ?auto_384006 ?auto_384013 ) ) ( not ( = ?auto_384006 ?auto_384014 ) ) ( not ( = ?auto_384007 ?auto_384008 ) ) ( not ( = ?auto_384007 ?auto_384009 ) ) ( not ( = ?auto_384007 ?auto_384010 ) ) ( not ( = ?auto_384007 ?auto_384011 ) ) ( not ( = ?auto_384007 ?auto_384012 ) ) ( not ( = ?auto_384007 ?auto_384013 ) ) ( not ( = ?auto_384007 ?auto_384014 ) ) ( not ( = ?auto_384008 ?auto_384009 ) ) ( not ( = ?auto_384008 ?auto_384010 ) ) ( not ( = ?auto_384008 ?auto_384011 ) ) ( not ( = ?auto_384008 ?auto_384012 ) ) ( not ( = ?auto_384008 ?auto_384013 ) ) ( not ( = ?auto_384008 ?auto_384014 ) ) ( not ( = ?auto_384009 ?auto_384010 ) ) ( not ( = ?auto_384009 ?auto_384011 ) ) ( not ( = ?auto_384009 ?auto_384012 ) ) ( not ( = ?auto_384009 ?auto_384013 ) ) ( not ( = ?auto_384009 ?auto_384014 ) ) ( not ( = ?auto_384010 ?auto_384011 ) ) ( not ( = ?auto_384010 ?auto_384012 ) ) ( not ( = ?auto_384010 ?auto_384013 ) ) ( not ( = ?auto_384010 ?auto_384014 ) ) ( not ( = ?auto_384011 ?auto_384012 ) ) ( not ( = ?auto_384011 ?auto_384013 ) ) ( not ( = ?auto_384011 ?auto_384014 ) ) ( not ( = ?auto_384012 ?auto_384013 ) ) ( not ( = ?auto_384012 ?auto_384014 ) ) ( not ( = ?auto_384013 ?auto_384014 ) ) ( ON ?auto_384012 ?auto_384013 ) ( ON ?auto_384011 ?auto_384012 ) ( ON ?auto_384010 ?auto_384011 ) ( ON ?auto_384009 ?auto_384010 ) ( ON ?auto_384008 ?auto_384009 ) ( ON ?auto_384007 ?auto_384008 ) ( CLEAR ?auto_384005 ) ( ON ?auto_384006 ?auto_384007 ) ( CLEAR ?auto_384006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_384002 ?auto_384003 ?auto_384004 ?auto_384005 ?auto_384006 )
      ( MAKE-12PILE ?auto_384002 ?auto_384003 ?auto_384004 ?auto_384005 ?auto_384006 ?auto_384007 ?auto_384008 ?auto_384009 ?auto_384010 ?auto_384011 ?auto_384012 ?auto_384013 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384027 - BLOCK
      ?auto_384028 - BLOCK
      ?auto_384029 - BLOCK
      ?auto_384030 - BLOCK
      ?auto_384031 - BLOCK
      ?auto_384032 - BLOCK
      ?auto_384033 - BLOCK
      ?auto_384034 - BLOCK
      ?auto_384035 - BLOCK
      ?auto_384036 - BLOCK
      ?auto_384037 - BLOCK
      ?auto_384038 - BLOCK
    )
    :vars
    (
      ?auto_384039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384038 ?auto_384039 ) ( ON-TABLE ?auto_384027 ) ( ON ?auto_384028 ?auto_384027 ) ( ON ?auto_384029 ?auto_384028 ) ( ON ?auto_384030 ?auto_384029 ) ( not ( = ?auto_384027 ?auto_384028 ) ) ( not ( = ?auto_384027 ?auto_384029 ) ) ( not ( = ?auto_384027 ?auto_384030 ) ) ( not ( = ?auto_384027 ?auto_384031 ) ) ( not ( = ?auto_384027 ?auto_384032 ) ) ( not ( = ?auto_384027 ?auto_384033 ) ) ( not ( = ?auto_384027 ?auto_384034 ) ) ( not ( = ?auto_384027 ?auto_384035 ) ) ( not ( = ?auto_384027 ?auto_384036 ) ) ( not ( = ?auto_384027 ?auto_384037 ) ) ( not ( = ?auto_384027 ?auto_384038 ) ) ( not ( = ?auto_384027 ?auto_384039 ) ) ( not ( = ?auto_384028 ?auto_384029 ) ) ( not ( = ?auto_384028 ?auto_384030 ) ) ( not ( = ?auto_384028 ?auto_384031 ) ) ( not ( = ?auto_384028 ?auto_384032 ) ) ( not ( = ?auto_384028 ?auto_384033 ) ) ( not ( = ?auto_384028 ?auto_384034 ) ) ( not ( = ?auto_384028 ?auto_384035 ) ) ( not ( = ?auto_384028 ?auto_384036 ) ) ( not ( = ?auto_384028 ?auto_384037 ) ) ( not ( = ?auto_384028 ?auto_384038 ) ) ( not ( = ?auto_384028 ?auto_384039 ) ) ( not ( = ?auto_384029 ?auto_384030 ) ) ( not ( = ?auto_384029 ?auto_384031 ) ) ( not ( = ?auto_384029 ?auto_384032 ) ) ( not ( = ?auto_384029 ?auto_384033 ) ) ( not ( = ?auto_384029 ?auto_384034 ) ) ( not ( = ?auto_384029 ?auto_384035 ) ) ( not ( = ?auto_384029 ?auto_384036 ) ) ( not ( = ?auto_384029 ?auto_384037 ) ) ( not ( = ?auto_384029 ?auto_384038 ) ) ( not ( = ?auto_384029 ?auto_384039 ) ) ( not ( = ?auto_384030 ?auto_384031 ) ) ( not ( = ?auto_384030 ?auto_384032 ) ) ( not ( = ?auto_384030 ?auto_384033 ) ) ( not ( = ?auto_384030 ?auto_384034 ) ) ( not ( = ?auto_384030 ?auto_384035 ) ) ( not ( = ?auto_384030 ?auto_384036 ) ) ( not ( = ?auto_384030 ?auto_384037 ) ) ( not ( = ?auto_384030 ?auto_384038 ) ) ( not ( = ?auto_384030 ?auto_384039 ) ) ( not ( = ?auto_384031 ?auto_384032 ) ) ( not ( = ?auto_384031 ?auto_384033 ) ) ( not ( = ?auto_384031 ?auto_384034 ) ) ( not ( = ?auto_384031 ?auto_384035 ) ) ( not ( = ?auto_384031 ?auto_384036 ) ) ( not ( = ?auto_384031 ?auto_384037 ) ) ( not ( = ?auto_384031 ?auto_384038 ) ) ( not ( = ?auto_384031 ?auto_384039 ) ) ( not ( = ?auto_384032 ?auto_384033 ) ) ( not ( = ?auto_384032 ?auto_384034 ) ) ( not ( = ?auto_384032 ?auto_384035 ) ) ( not ( = ?auto_384032 ?auto_384036 ) ) ( not ( = ?auto_384032 ?auto_384037 ) ) ( not ( = ?auto_384032 ?auto_384038 ) ) ( not ( = ?auto_384032 ?auto_384039 ) ) ( not ( = ?auto_384033 ?auto_384034 ) ) ( not ( = ?auto_384033 ?auto_384035 ) ) ( not ( = ?auto_384033 ?auto_384036 ) ) ( not ( = ?auto_384033 ?auto_384037 ) ) ( not ( = ?auto_384033 ?auto_384038 ) ) ( not ( = ?auto_384033 ?auto_384039 ) ) ( not ( = ?auto_384034 ?auto_384035 ) ) ( not ( = ?auto_384034 ?auto_384036 ) ) ( not ( = ?auto_384034 ?auto_384037 ) ) ( not ( = ?auto_384034 ?auto_384038 ) ) ( not ( = ?auto_384034 ?auto_384039 ) ) ( not ( = ?auto_384035 ?auto_384036 ) ) ( not ( = ?auto_384035 ?auto_384037 ) ) ( not ( = ?auto_384035 ?auto_384038 ) ) ( not ( = ?auto_384035 ?auto_384039 ) ) ( not ( = ?auto_384036 ?auto_384037 ) ) ( not ( = ?auto_384036 ?auto_384038 ) ) ( not ( = ?auto_384036 ?auto_384039 ) ) ( not ( = ?auto_384037 ?auto_384038 ) ) ( not ( = ?auto_384037 ?auto_384039 ) ) ( not ( = ?auto_384038 ?auto_384039 ) ) ( ON ?auto_384037 ?auto_384038 ) ( ON ?auto_384036 ?auto_384037 ) ( ON ?auto_384035 ?auto_384036 ) ( ON ?auto_384034 ?auto_384035 ) ( ON ?auto_384033 ?auto_384034 ) ( ON ?auto_384032 ?auto_384033 ) ( CLEAR ?auto_384030 ) ( ON ?auto_384031 ?auto_384032 ) ( CLEAR ?auto_384031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_384027 ?auto_384028 ?auto_384029 ?auto_384030 ?auto_384031 )
      ( MAKE-12PILE ?auto_384027 ?auto_384028 ?auto_384029 ?auto_384030 ?auto_384031 ?auto_384032 ?auto_384033 ?auto_384034 ?auto_384035 ?auto_384036 ?auto_384037 ?auto_384038 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384052 - BLOCK
      ?auto_384053 - BLOCK
      ?auto_384054 - BLOCK
      ?auto_384055 - BLOCK
      ?auto_384056 - BLOCK
      ?auto_384057 - BLOCK
      ?auto_384058 - BLOCK
      ?auto_384059 - BLOCK
      ?auto_384060 - BLOCK
      ?auto_384061 - BLOCK
      ?auto_384062 - BLOCK
      ?auto_384063 - BLOCK
    )
    :vars
    (
      ?auto_384064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384063 ?auto_384064 ) ( ON-TABLE ?auto_384052 ) ( ON ?auto_384053 ?auto_384052 ) ( ON ?auto_384054 ?auto_384053 ) ( not ( = ?auto_384052 ?auto_384053 ) ) ( not ( = ?auto_384052 ?auto_384054 ) ) ( not ( = ?auto_384052 ?auto_384055 ) ) ( not ( = ?auto_384052 ?auto_384056 ) ) ( not ( = ?auto_384052 ?auto_384057 ) ) ( not ( = ?auto_384052 ?auto_384058 ) ) ( not ( = ?auto_384052 ?auto_384059 ) ) ( not ( = ?auto_384052 ?auto_384060 ) ) ( not ( = ?auto_384052 ?auto_384061 ) ) ( not ( = ?auto_384052 ?auto_384062 ) ) ( not ( = ?auto_384052 ?auto_384063 ) ) ( not ( = ?auto_384052 ?auto_384064 ) ) ( not ( = ?auto_384053 ?auto_384054 ) ) ( not ( = ?auto_384053 ?auto_384055 ) ) ( not ( = ?auto_384053 ?auto_384056 ) ) ( not ( = ?auto_384053 ?auto_384057 ) ) ( not ( = ?auto_384053 ?auto_384058 ) ) ( not ( = ?auto_384053 ?auto_384059 ) ) ( not ( = ?auto_384053 ?auto_384060 ) ) ( not ( = ?auto_384053 ?auto_384061 ) ) ( not ( = ?auto_384053 ?auto_384062 ) ) ( not ( = ?auto_384053 ?auto_384063 ) ) ( not ( = ?auto_384053 ?auto_384064 ) ) ( not ( = ?auto_384054 ?auto_384055 ) ) ( not ( = ?auto_384054 ?auto_384056 ) ) ( not ( = ?auto_384054 ?auto_384057 ) ) ( not ( = ?auto_384054 ?auto_384058 ) ) ( not ( = ?auto_384054 ?auto_384059 ) ) ( not ( = ?auto_384054 ?auto_384060 ) ) ( not ( = ?auto_384054 ?auto_384061 ) ) ( not ( = ?auto_384054 ?auto_384062 ) ) ( not ( = ?auto_384054 ?auto_384063 ) ) ( not ( = ?auto_384054 ?auto_384064 ) ) ( not ( = ?auto_384055 ?auto_384056 ) ) ( not ( = ?auto_384055 ?auto_384057 ) ) ( not ( = ?auto_384055 ?auto_384058 ) ) ( not ( = ?auto_384055 ?auto_384059 ) ) ( not ( = ?auto_384055 ?auto_384060 ) ) ( not ( = ?auto_384055 ?auto_384061 ) ) ( not ( = ?auto_384055 ?auto_384062 ) ) ( not ( = ?auto_384055 ?auto_384063 ) ) ( not ( = ?auto_384055 ?auto_384064 ) ) ( not ( = ?auto_384056 ?auto_384057 ) ) ( not ( = ?auto_384056 ?auto_384058 ) ) ( not ( = ?auto_384056 ?auto_384059 ) ) ( not ( = ?auto_384056 ?auto_384060 ) ) ( not ( = ?auto_384056 ?auto_384061 ) ) ( not ( = ?auto_384056 ?auto_384062 ) ) ( not ( = ?auto_384056 ?auto_384063 ) ) ( not ( = ?auto_384056 ?auto_384064 ) ) ( not ( = ?auto_384057 ?auto_384058 ) ) ( not ( = ?auto_384057 ?auto_384059 ) ) ( not ( = ?auto_384057 ?auto_384060 ) ) ( not ( = ?auto_384057 ?auto_384061 ) ) ( not ( = ?auto_384057 ?auto_384062 ) ) ( not ( = ?auto_384057 ?auto_384063 ) ) ( not ( = ?auto_384057 ?auto_384064 ) ) ( not ( = ?auto_384058 ?auto_384059 ) ) ( not ( = ?auto_384058 ?auto_384060 ) ) ( not ( = ?auto_384058 ?auto_384061 ) ) ( not ( = ?auto_384058 ?auto_384062 ) ) ( not ( = ?auto_384058 ?auto_384063 ) ) ( not ( = ?auto_384058 ?auto_384064 ) ) ( not ( = ?auto_384059 ?auto_384060 ) ) ( not ( = ?auto_384059 ?auto_384061 ) ) ( not ( = ?auto_384059 ?auto_384062 ) ) ( not ( = ?auto_384059 ?auto_384063 ) ) ( not ( = ?auto_384059 ?auto_384064 ) ) ( not ( = ?auto_384060 ?auto_384061 ) ) ( not ( = ?auto_384060 ?auto_384062 ) ) ( not ( = ?auto_384060 ?auto_384063 ) ) ( not ( = ?auto_384060 ?auto_384064 ) ) ( not ( = ?auto_384061 ?auto_384062 ) ) ( not ( = ?auto_384061 ?auto_384063 ) ) ( not ( = ?auto_384061 ?auto_384064 ) ) ( not ( = ?auto_384062 ?auto_384063 ) ) ( not ( = ?auto_384062 ?auto_384064 ) ) ( not ( = ?auto_384063 ?auto_384064 ) ) ( ON ?auto_384062 ?auto_384063 ) ( ON ?auto_384061 ?auto_384062 ) ( ON ?auto_384060 ?auto_384061 ) ( ON ?auto_384059 ?auto_384060 ) ( ON ?auto_384058 ?auto_384059 ) ( ON ?auto_384057 ?auto_384058 ) ( ON ?auto_384056 ?auto_384057 ) ( CLEAR ?auto_384054 ) ( ON ?auto_384055 ?auto_384056 ) ( CLEAR ?auto_384055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_384052 ?auto_384053 ?auto_384054 ?auto_384055 )
      ( MAKE-12PILE ?auto_384052 ?auto_384053 ?auto_384054 ?auto_384055 ?auto_384056 ?auto_384057 ?auto_384058 ?auto_384059 ?auto_384060 ?auto_384061 ?auto_384062 ?auto_384063 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384077 - BLOCK
      ?auto_384078 - BLOCK
      ?auto_384079 - BLOCK
      ?auto_384080 - BLOCK
      ?auto_384081 - BLOCK
      ?auto_384082 - BLOCK
      ?auto_384083 - BLOCK
      ?auto_384084 - BLOCK
      ?auto_384085 - BLOCK
      ?auto_384086 - BLOCK
      ?auto_384087 - BLOCK
      ?auto_384088 - BLOCK
    )
    :vars
    (
      ?auto_384089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384088 ?auto_384089 ) ( ON-TABLE ?auto_384077 ) ( ON ?auto_384078 ?auto_384077 ) ( ON ?auto_384079 ?auto_384078 ) ( not ( = ?auto_384077 ?auto_384078 ) ) ( not ( = ?auto_384077 ?auto_384079 ) ) ( not ( = ?auto_384077 ?auto_384080 ) ) ( not ( = ?auto_384077 ?auto_384081 ) ) ( not ( = ?auto_384077 ?auto_384082 ) ) ( not ( = ?auto_384077 ?auto_384083 ) ) ( not ( = ?auto_384077 ?auto_384084 ) ) ( not ( = ?auto_384077 ?auto_384085 ) ) ( not ( = ?auto_384077 ?auto_384086 ) ) ( not ( = ?auto_384077 ?auto_384087 ) ) ( not ( = ?auto_384077 ?auto_384088 ) ) ( not ( = ?auto_384077 ?auto_384089 ) ) ( not ( = ?auto_384078 ?auto_384079 ) ) ( not ( = ?auto_384078 ?auto_384080 ) ) ( not ( = ?auto_384078 ?auto_384081 ) ) ( not ( = ?auto_384078 ?auto_384082 ) ) ( not ( = ?auto_384078 ?auto_384083 ) ) ( not ( = ?auto_384078 ?auto_384084 ) ) ( not ( = ?auto_384078 ?auto_384085 ) ) ( not ( = ?auto_384078 ?auto_384086 ) ) ( not ( = ?auto_384078 ?auto_384087 ) ) ( not ( = ?auto_384078 ?auto_384088 ) ) ( not ( = ?auto_384078 ?auto_384089 ) ) ( not ( = ?auto_384079 ?auto_384080 ) ) ( not ( = ?auto_384079 ?auto_384081 ) ) ( not ( = ?auto_384079 ?auto_384082 ) ) ( not ( = ?auto_384079 ?auto_384083 ) ) ( not ( = ?auto_384079 ?auto_384084 ) ) ( not ( = ?auto_384079 ?auto_384085 ) ) ( not ( = ?auto_384079 ?auto_384086 ) ) ( not ( = ?auto_384079 ?auto_384087 ) ) ( not ( = ?auto_384079 ?auto_384088 ) ) ( not ( = ?auto_384079 ?auto_384089 ) ) ( not ( = ?auto_384080 ?auto_384081 ) ) ( not ( = ?auto_384080 ?auto_384082 ) ) ( not ( = ?auto_384080 ?auto_384083 ) ) ( not ( = ?auto_384080 ?auto_384084 ) ) ( not ( = ?auto_384080 ?auto_384085 ) ) ( not ( = ?auto_384080 ?auto_384086 ) ) ( not ( = ?auto_384080 ?auto_384087 ) ) ( not ( = ?auto_384080 ?auto_384088 ) ) ( not ( = ?auto_384080 ?auto_384089 ) ) ( not ( = ?auto_384081 ?auto_384082 ) ) ( not ( = ?auto_384081 ?auto_384083 ) ) ( not ( = ?auto_384081 ?auto_384084 ) ) ( not ( = ?auto_384081 ?auto_384085 ) ) ( not ( = ?auto_384081 ?auto_384086 ) ) ( not ( = ?auto_384081 ?auto_384087 ) ) ( not ( = ?auto_384081 ?auto_384088 ) ) ( not ( = ?auto_384081 ?auto_384089 ) ) ( not ( = ?auto_384082 ?auto_384083 ) ) ( not ( = ?auto_384082 ?auto_384084 ) ) ( not ( = ?auto_384082 ?auto_384085 ) ) ( not ( = ?auto_384082 ?auto_384086 ) ) ( not ( = ?auto_384082 ?auto_384087 ) ) ( not ( = ?auto_384082 ?auto_384088 ) ) ( not ( = ?auto_384082 ?auto_384089 ) ) ( not ( = ?auto_384083 ?auto_384084 ) ) ( not ( = ?auto_384083 ?auto_384085 ) ) ( not ( = ?auto_384083 ?auto_384086 ) ) ( not ( = ?auto_384083 ?auto_384087 ) ) ( not ( = ?auto_384083 ?auto_384088 ) ) ( not ( = ?auto_384083 ?auto_384089 ) ) ( not ( = ?auto_384084 ?auto_384085 ) ) ( not ( = ?auto_384084 ?auto_384086 ) ) ( not ( = ?auto_384084 ?auto_384087 ) ) ( not ( = ?auto_384084 ?auto_384088 ) ) ( not ( = ?auto_384084 ?auto_384089 ) ) ( not ( = ?auto_384085 ?auto_384086 ) ) ( not ( = ?auto_384085 ?auto_384087 ) ) ( not ( = ?auto_384085 ?auto_384088 ) ) ( not ( = ?auto_384085 ?auto_384089 ) ) ( not ( = ?auto_384086 ?auto_384087 ) ) ( not ( = ?auto_384086 ?auto_384088 ) ) ( not ( = ?auto_384086 ?auto_384089 ) ) ( not ( = ?auto_384087 ?auto_384088 ) ) ( not ( = ?auto_384087 ?auto_384089 ) ) ( not ( = ?auto_384088 ?auto_384089 ) ) ( ON ?auto_384087 ?auto_384088 ) ( ON ?auto_384086 ?auto_384087 ) ( ON ?auto_384085 ?auto_384086 ) ( ON ?auto_384084 ?auto_384085 ) ( ON ?auto_384083 ?auto_384084 ) ( ON ?auto_384082 ?auto_384083 ) ( ON ?auto_384081 ?auto_384082 ) ( CLEAR ?auto_384079 ) ( ON ?auto_384080 ?auto_384081 ) ( CLEAR ?auto_384080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_384077 ?auto_384078 ?auto_384079 ?auto_384080 )
      ( MAKE-12PILE ?auto_384077 ?auto_384078 ?auto_384079 ?auto_384080 ?auto_384081 ?auto_384082 ?auto_384083 ?auto_384084 ?auto_384085 ?auto_384086 ?auto_384087 ?auto_384088 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384102 - BLOCK
      ?auto_384103 - BLOCK
      ?auto_384104 - BLOCK
      ?auto_384105 - BLOCK
      ?auto_384106 - BLOCK
      ?auto_384107 - BLOCK
      ?auto_384108 - BLOCK
      ?auto_384109 - BLOCK
      ?auto_384110 - BLOCK
      ?auto_384111 - BLOCK
      ?auto_384112 - BLOCK
      ?auto_384113 - BLOCK
    )
    :vars
    (
      ?auto_384114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384113 ?auto_384114 ) ( ON-TABLE ?auto_384102 ) ( ON ?auto_384103 ?auto_384102 ) ( not ( = ?auto_384102 ?auto_384103 ) ) ( not ( = ?auto_384102 ?auto_384104 ) ) ( not ( = ?auto_384102 ?auto_384105 ) ) ( not ( = ?auto_384102 ?auto_384106 ) ) ( not ( = ?auto_384102 ?auto_384107 ) ) ( not ( = ?auto_384102 ?auto_384108 ) ) ( not ( = ?auto_384102 ?auto_384109 ) ) ( not ( = ?auto_384102 ?auto_384110 ) ) ( not ( = ?auto_384102 ?auto_384111 ) ) ( not ( = ?auto_384102 ?auto_384112 ) ) ( not ( = ?auto_384102 ?auto_384113 ) ) ( not ( = ?auto_384102 ?auto_384114 ) ) ( not ( = ?auto_384103 ?auto_384104 ) ) ( not ( = ?auto_384103 ?auto_384105 ) ) ( not ( = ?auto_384103 ?auto_384106 ) ) ( not ( = ?auto_384103 ?auto_384107 ) ) ( not ( = ?auto_384103 ?auto_384108 ) ) ( not ( = ?auto_384103 ?auto_384109 ) ) ( not ( = ?auto_384103 ?auto_384110 ) ) ( not ( = ?auto_384103 ?auto_384111 ) ) ( not ( = ?auto_384103 ?auto_384112 ) ) ( not ( = ?auto_384103 ?auto_384113 ) ) ( not ( = ?auto_384103 ?auto_384114 ) ) ( not ( = ?auto_384104 ?auto_384105 ) ) ( not ( = ?auto_384104 ?auto_384106 ) ) ( not ( = ?auto_384104 ?auto_384107 ) ) ( not ( = ?auto_384104 ?auto_384108 ) ) ( not ( = ?auto_384104 ?auto_384109 ) ) ( not ( = ?auto_384104 ?auto_384110 ) ) ( not ( = ?auto_384104 ?auto_384111 ) ) ( not ( = ?auto_384104 ?auto_384112 ) ) ( not ( = ?auto_384104 ?auto_384113 ) ) ( not ( = ?auto_384104 ?auto_384114 ) ) ( not ( = ?auto_384105 ?auto_384106 ) ) ( not ( = ?auto_384105 ?auto_384107 ) ) ( not ( = ?auto_384105 ?auto_384108 ) ) ( not ( = ?auto_384105 ?auto_384109 ) ) ( not ( = ?auto_384105 ?auto_384110 ) ) ( not ( = ?auto_384105 ?auto_384111 ) ) ( not ( = ?auto_384105 ?auto_384112 ) ) ( not ( = ?auto_384105 ?auto_384113 ) ) ( not ( = ?auto_384105 ?auto_384114 ) ) ( not ( = ?auto_384106 ?auto_384107 ) ) ( not ( = ?auto_384106 ?auto_384108 ) ) ( not ( = ?auto_384106 ?auto_384109 ) ) ( not ( = ?auto_384106 ?auto_384110 ) ) ( not ( = ?auto_384106 ?auto_384111 ) ) ( not ( = ?auto_384106 ?auto_384112 ) ) ( not ( = ?auto_384106 ?auto_384113 ) ) ( not ( = ?auto_384106 ?auto_384114 ) ) ( not ( = ?auto_384107 ?auto_384108 ) ) ( not ( = ?auto_384107 ?auto_384109 ) ) ( not ( = ?auto_384107 ?auto_384110 ) ) ( not ( = ?auto_384107 ?auto_384111 ) ) ( not ( = ?auto_384107 ?auto_384112 ) ) ( not ( = ?auto_384107 ?auto_384113 ) ) ( not ( = ?auto_384107 ?auto_384114 ) ) ( not ( = ?auto_384108 ?auto_384109 ) ) ( not ( = ?auto_384108 ?auto_384110 ) ) ( not ( = ?auto_384108 ?auto_384111 ) ) ( not ( = ?auto_384108 ?auto_384112 ) ) ( not ( = ?auto_384108 ?auto_384113 ) ) ( not ( = ?auto_384108 ?auto_384114 ) ) ( not ( = ?auto_384109 ?auto_384110 ) ) ( not ( = ?auto_384109 ?auto_384111 ) ) ( not ( = ?auto_384109 ?auto_384112 ) ) ( not ( = ?auto_384109 ?auto_384113 ) ) ( not ( = ?auto_384109 ?auto_384114 ) ) ( not ( = ?auto_384110 ?auto_384111 ) ) ( not ( = ?auto_384110 ?auto_384112 ) ) ( not ( = ?auto_384110 ?auto_384113 ) ) ( not ( = ?auto_384110 ?auto_384114 ) ) ( not ( = ?auto_384111 ?auto_384112 ) ) ( not ( = ?auto_384111 ?auto_384113 ) ) ( not ( = ?auto_384111 ?auto_384114 ) ) ( not ( = ?auto_384112 ?auto_384113 ) ) ( not ( = ?auto_384112 ?auto_384114 ) ) ( not ( = ?auto_384113 ?auto_384114 ) ) ( ON ?auto_384112 ?auto_384113 ) ( ON ?auto_384111 ?auto_384112 ) ( ON ?auto_384110 ?auto_384111 ) ( ON ?auto_384109 ?auto_384110 ) ( ON ?auto_384108 ?auto_384109 ) ( ON ?auto_384107 ?auto_384108 ) ( ON ?auto_384106 ?auto_384107 ) ( ON ?auto_384105 ?auto_384106 ) ( CLEAR ?auto_384103 ) ( ON ?auto_384104 ?auto_384105 ) ( CLEAR ?auto_384104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_384102 ?auto_384103 ?auto_384104 )
      ( MAKE-12PILE ?auto_384102 ?auto_384103 ?auto_384104 ?auto_384105 ?auto_384106 ?auto_384107 ?auto_384108 ?auto_384109 ?auto_384110 ?auto_384111 ?auto_384112 ?auto_384113 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384127 - BLOCK
      ?auto_384128 - BLOCK
      ?auto_384129 - BLOCK
      ?auto_384130 - BLOCK
      ?auto_384131 - BLOCK
      ?auto_384132 - BLOCK
      ?auto_384133 - BLOCK
      ?auto_384134 - BLOCK
      ?auto_384135 - BLOCK
      ?auto_384136 - BLOCK
      ?auto_384137 - BLOCK
      ?auto_384138 - BLOCK
    )
    :vars
    (
      ?auto_384139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384138 ?auto_384139 ) ( ON-TABLE ?auto_384127 ) ( ON ?auto_384128 ?auto_384127 ) ( not ( = ?auto_384127 ?auto_384128 ) ) ( not ( = ?auto_384127 ?auto_384129 ) ) ( not ( = ?auto_384127 ?auto_384130 ) ) ( not ( = ?auto_384127 ?auto_384131 ) ) ( not ( = ?auto_384127 ?auto_384132 ) ) ( not ( = ?auto_384127 ?auto_384133 ) ) ( not ( = ?auto_384127 ?auto_384134 ) ) ( not ( = ?auto_384127 ?auto_384135 ) ) ( not ( = ?auto_384127 ?auto_384136 ) ) ( not ( = ?auto_384127 ?auto_384137 ) ) ( not ( = ?auto_384127 ?auto_384138 ) ) ( not ( = ?auto_384127 ?auto_384139 ) ) ( not ( = ?auto_384128 ?auto_384129 ) ) ( not ( = ?auto_384128 ?auto_384130 ) ) ( not ( = ?auto_384128 ?auto_384131 ) ) ( not ( = ?auto_384128 ?auto_384132 ) ) ( not ( = ?auto_384128 ?auto_384133 ) ) ( not ( = ?auto_384128 ?auto_384134 ) ) ( not ( = ?auto_384128 ?auto_384135 ) ) ( not ( = ?auto_384128 ?auto_384136 ) ) ( not ( = ?auto_384128 ?auto_384137 ) ) ( not ( = ?auto_384128 ?auto_384138 ) ) ( not ( = ?auto_384128 ?auto_384139 ) ) ( not ( = ?auto_384129 ?auto_384130 ) ) ( not ( = ?auto_384129 ?auto_384131 ) ) ( not ( = ?auto_384129 ?auto_384132 ) ) ( not ( = ?auto_384129 ?auto_384133 ) ) ( not ( = ?auto_384129 ?auto_384134 ) ) ( not ( = ?auto_384129 ?auto_384135 ) ) ( not ( = ?auto_384129 ?auto_384136 ) ) ( not ( = ?auto_384129 ?auto_384137 ) ) ( not ( = ?auto_384129 ?auto_384138 ) ) ( not ( = ?auto_384129 ?auto_384139 ) ) ( not ( = ?auto_384130 ?auto_384131 ) ) ( not ( = ?auto_384130 ?auto_384132 ) ) ( not ( = ?auto_384130 ?auto_384133 ) ) ( not ( = ?auto_384130 ?auto_384134 ) ) ( not ( = ?auto_384130 ?auto_384135 ) ) ( not ( = ?auto_384130 ?auto_384136 ) ) ( not ( = ?auto_384130 ?auto_384137 ) ) ( not ( = ?auto_384130 ?auto_384138 ) ) ( not ( = ?auto_384130 ?auto_384139 ) ) ( not ( = ?auto_384131 ?auto_384132 ) ) ( not ( = ?auto_384131 ?auto_384133 ) ) ( not ( = ?auto_384131 ?auto_384134 ) ) ( not ( = ?auto_384131 ?auto_384135 ) ) ( not ( = ?auto_384131 ?auto_384136 ) ) ( not ( = ?auto_384131 ?auto_384137 ) ) ( not ( = ?auto_384131 ?auto_384138 ) ) ( not ( = ?auto_384131 ?auto_384139 ) ) ( not ( = ?auto_384132 ?auto_384133 ) ) ( not ( = ?auto_384132 ?auto_384134 ) ) ( not ( = ?auto_384132 ?auto_384135 ) ) ( not ( = ?auto_384132 ?auto_384136 ) ) ( not ( = ?auto_384132 ?auto_384137 ) ) ( not ( = ?auto_384132 ?auto_384138 ) ) ( not ( = ?auto_384132 ?auto_384139 ) ) ( not ( = ?auto_384133 ?auto_384134 ) ) ( not ( = ?auto_384133 ?auto_384135 ) ) ( not ( = ?auto_384133 ?auto_384136 ) ) ( not ( = ?auto_384133 ?auto_384137 ) ) ( not ( = ?auto_384133 ?auto_384138 ) ) ( not ( = ?auto_384133 ?auto_384139 ) ) ( not ( = ?auto_384134 ?auto_384135 ) ) ( not ( = ?auto_384134 ?auto_384136 ) ) ( not ( = ?auto_384134 ?auto_384137 ) ) ( not ( = ?auto_384134 ?auto_384138 ) ) ( not ( = ?auto_384134 ?auto_384139 ) ) ( not ( = ?auto_384135 ?auto_384136 ) ) ( not ( = ?auto_384135 ?auto_384137 ) ) ( not ( = ?auto_384135 ?auto_384138 ) ) ( not ( = ?auto_384135 ?auto_384139 ) ) ( not ( = ?auto_384136 ?auto_384137 ) ) ( not ( = ?auto_384136 ?auto_384138 ) ) ( not ( = ?auto_384136 ?auto_384139 ) ) ( not ( = ?auto_384137 ?auto_384138 ) ) ( not ( = ?auto_384137 ?auto_384139 ) ) ( not ( = ?auto_384138 ?auto_384139 ) ) ( ON ?auto_384137 ?auto_384138 ) ( ON ?auto_384136 ?auto_384137 ) ( ON ?auto_384135 ?auto_384136 ) ( ON ?auto_384134 ?auto_384135 ) ( ON ?auto_384133 ?auto_384134 ) ( ON ?auto_384132 ?auto_384133 ) ( ON ?auto_384131 ?auto_384132 ) ( ON ?auto_384130 ?auto_384131 ) ( CLEAR ?auto_384128 ) ( ON ?auto_384129 ?auto_384130 ) ( CLEAR ?auto_384129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_384127 ?auto_384128 ?auto_384129 )
      ( MAKE-12PILE ?auto_384127 ?auto_384128 ?auto_384129 ?auto_384130 ?auto_384131 ?auto_384132 ?auto_384133 ?auto_384134 ?auto_384135 ?auto_384136 ?auto_384137 ?auto_384138 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384152 - BLOCK
      ?auto_384153 - BLOCK
      ?auto_384154 - BLOCK
      ?auto_384155 - BLOCK
      ?auto_384156 - BLOCK
      ?auto_384157 - BLOCK
      ?auto_384158 - BLOCK
      ?auto_384159 - BLOCK
      ?auto_384160 - BLOCK
      ?auto_384161 - BLOCK
      ?auto_384162 - BLOCK
      ?auto_384163 - BLOCK
    )
    :vars
    (
      ?auto_384164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384163 ?auto_384164 ) ( ON-TABLE ?auto_384152 ) ( not ( = ?auto_384152 ?auto_384153 ) ) ( not ( = ?auto_384152 ?auto_384154 ) ) ( not ( = ?auto_384152 ?auto_384155 ) ) ( not ( = ?auto_384152 ?auto_384156 ) ) ( not ( = ?auto_384152 ?auto_384157 ) ) ( not ( = ?auto_384152 ?auto_384158 ) ) ( not ( = ?auto_384152 ?auto_384159 ) ) ( not ( = ?auto_384152 ?auto_384160 ) ) ( not ( = ?auto_384152 ?auto_384161 ) ) ( not ( = ?auto_384152 ?auto_384162 ) ) ( not ( = ?auto_384152 ?auto_384163 ) ) ( not ( = ?auto_384152 ?auto_384164 ) ) ( not ( = ?auto_384153 ?auto_384154 ) ) ( not ( = ?auto_384153 ?auto_384155 ) ) ( not ( = ?auto_384153 ?auto_384156 ) ) ( not ( = ?auto_384153 ?auto_384157 ) ) ( not ( = ?auto_384153 ?auto_384158 ) ) ( not ( = ?auto_384153 ?auto_384159 ) ) ( not ( = ?auto_384153 ?auto_384160 ) ) ( not ( = ?auto_384153 ?auto_384161 ) ) ( not ( = ?auto_384153 ?auto_384162 ) ) ( not ( = ?auto_384153 ?auto_384163 ) ) ( not ( = ?auto_384153 ?auto_384164 ) ) ( not ( = ?auto_384154 ?auto_384155 ) ) ( not ( = ?auto_384154 ?auto_384156 ) ) ( not ( = ?auto_384154 ?auto_384157 ) ) ( not ( = ?auto_384154 ?auto_384158 ) ) ( not ( = ?auto_384154 ?auto_384159 ) ) ( not ( = ?auto_384154 ?auto_384160 ) ) ( not ( = ?auto_384154 ?auto_384161 ) ) ( not ( = ?auto_384154 ?auto_384162 ) ) ( not ( = ?auto_384154 ?auto_384163 ) ) ( not ( = ?auto_384154 ?auto_384164 ) ) ( not ( = ?auto_384155 ?auto_384156 ) ) ( not ( = ?auto_384155 ?auto_384157 ) ) ( not ( = ?auto_384155 ?auto_384158 ) ) ( not ( = ?auto_384155 ?auto_384159 ) ) ( not ( = ?auto_384155 ?auto_384160 ) ) ( not ( = ?auto_384155 ?auto_384161 ) ) ( not ( = ?auto_384155 ?auto_384162 ) ) ( not ( = ?auto_384155 ?auto_384163 ) ) ( not ( = ?auto_384155 ?auto_384164 ) ) ( not ( = ?auto_384156 ?auto_384157 ) ) ( not ( = ?auto_384156 ?auto_384158 ) ) ( not ( = ?auto_384156 ?auto_384159 ) ) ( not ( = ?auto_384156 ?auto_384160 ) ) ( not ( = ?auto_384156 ?auto_384161 ) ) ( not ( = ?auto_384156 ?auto_384162 ) ) ( not ( = ?auto_384156 ?auto_384163 ) ) ( not ( = ?auto_384156 ?auto_384164 ) ) ( not ( = ?auto_384157 ?auto_384158 ) ) ( not ( = ?auto_384157 ?auto_384159 ) ) ( not ( = ?auto_384157 ?auto_384160 ) ) ( not ( = ?auto_384157 ?auto_384161 ) ) ( not ( = ?auto_384157 ?auto_384162 ) ) ( not ( = ?auto_384157 ?auto_384163 ) ) ( not ( = ?auto_384157 ?auto_384164 ) ) ( not ( = ?auto_384158 ?auto_384159 ) ) ( not ( = ?auto_384158 ?auto_384160 ) ) ( not ( = ?auto_384158 ?auto_384161 ) ) ( not ( = ?auto_384158 ?auto_384162 ) ) ( not ( = ?auto_384158 ?auto_384163 ) ) ( not ( = ?auto_384158 ?auto_384164 ) ) ( not ( = ?auto_384159 ?auto_384160 ) ) ( not ( = ?auto_384159 ?auto_384161 ) ) ( not ( = ?auto_384159 ?auto_384162 ) ) ( not ( = ?auto_384159 ?auto_384163 ) ) ( not ( = ?auto_384159 ?auto_384164 ) ) ( not ( = ?auto_384160 ?auto_384161 ) ) ( not ( = ?auto_384160 ?auto_384162 ) ) ( not ( = ?auto_384160 ?auto_384163 ) ) ( not ( = ?auto_384160 ?auto_384164 ) ) ( not ( = ?auto_384161 ?auto_384162 ) ) ( not ( = ?auto_384161 ?auto_384163 ) ) ( not ( = ?auto_384161 ?auto_384164 ) ) ( not ( = ?auto_384162 ?auto_384163 ) ) ( not ( = ?auto_384162 ?auto_384164 ) ) ( not ( = ?auto_384163 ?auto_384164 ) ) ( ON ?auto_384162 ?auto_384163 ) ( ON ?auto_384161 ?auto_384162 ) ( ON ?auto_384160 ?auto_384161 ) ( ON ?auto_384159 ?auto_384160 ) ( ON ?auto_384158 ?auto_384159 ) ( ON ?auto_384157 ?auto_384158 ) ( ON ?auto_384156 ?auto_384157 ) ( ON ?auto_384155 ?auto_384156 ) ( ON ?auto_384154 ?auto_384155 ) ( CLEAR ?auto_384152 ) ( ON ?auto_384153 ?auto_384154 ) ( CLEAR ?auto_384153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_384152 ?auto_384153 )
      ( MAKE-12PILE ?auto_384152 ?auto_384153 ?auto_384154 ?auto_384155 ?auto_384156 ?auto_384157 ?auto_384158 ?auto_384159 ?auto_384160 ?auto_384161 ?auto_384162 ?auto_384163 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384177 - BLOCK
      ?auto_384178 - BLOCK
      ?auto_384179 - BLOCK
      ?auto_384180 - BLOCK
      ?auto_384181 - BLOCK
      ?auto_384182 - BLOCK
      ?auto_384183 - BLOCK
      ?auto_384184 - BLOCK
      ?auto_384185 - BLOCK
      ?auto_384186 - BLOCK
      ?auto_384187 - BLOCK
      ?auto_384188 - BLOCK
    )
    :vars
    (
      ?auto_384189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384188 ?auto_384189 ) ( ON-TABLE ?auto_384177 ) ( not ( = ?auto_384177 ?auto_384178 ) ) ( not ( = ?auto_384177 ?auto_384179 ) ) ( not ( = ?auto_384177 ?auto_384180 ) ) ( not ( = ?auto_384177 ?auto_384181 ) ) ( not ( = ?auto_384177 ?auto_384182 ) ) ( not ( = ?auto_384177 ?auto_384183 ) ) ( not ( = ?auto_384177 ?auto_384184 ) ) ( not ( = ?auto_384177 ?auto_384185 ) ) ( not ( = ?auto_384177 ?auto_384186 ) ) ( not ( = ?auto_384177 ?auto_384187 ) ) ( not ( = ?auto_384177 ?auto_384188 ) ) ( not ( = ?auto_384177 ?auto_384189 ) ) ( not ( = ?auto_384178 ?auto_384179 ) ) ( not ( = ?auto_384178 ?auto_384180 ) ) ( not ( = ?auto_384178 ?auto_384181 ) ) ( not ( = ?auto_384178 ?auto_384182 ) ) ( not ( = ?auto_384178 ?auto_384183 ) ) ( not ( = ?auto_384178 ?auto_384184 ) ) ( not ( = ?auto_384178 ?auto_384185 ) ) ( not ( = ?auto_384178 ?auto_384186 ) ) ( not ( = ?auto_384178 ?auto_384187 ) ) ( not ( = ?auto_384178 ?auto_384188 ) ) ( not ( = ?auto_384178 ?auto_384189 ) ) ( not ( = ?auto_384179 ?auto_384180 ) ) ( not ( = ?auto_384179 ?auto_384181 ) ) ( not ( = ?auto_384179 ?auto_384182 ) ) ( not ( = ?auto_384179 ?auto_384183 ) ) ( not ( = ?auto_384179 ?auto_384184 ) ) ( not ( = ?auto_384179 ?auto_384185 ) ) ( not ( = ?auto_384179 ?auto_384186 ) ) ( not ( = ?auto_384179 ?auto_384187 ) ) ( not ( = ?auto_384179 ?auto_384188 ) ) ( not ( = ?auto_384179 ?auto_384189 ) ) ( not ( = ?auto_384180 ?auto_384181 ) ) ( not ( = ?auto_384180 ?auto_384182 ) ) ( not ( = ?auto_384180 ?auto_384183 ) ) ( not ( = ?auto_384180 ?auto_384184 ) ) ( not ( = ?auto_384180 ?auto_384185 ) ) ( not ( = ?auto_384180 ?auto_384186 ) ) ( not ( = ?auto_384180 ?auto_384187 ) ) ( not ( = ?auto_384180 ?auto_384188 ) ) ( not ( = ?auto_384180 ?auto_384189 ) ) ( not ( = ?auto_384181 ?auto_384182 ) ) ( not ( = ?auto_384181 ?auto_384183 ) ) ( not ( = ?auto_384181 ?auto_384184 ) ) ( not ( = ?auto_384181 ?auto_384185 ) ) ( not ( = ?auto_384181 ?auto_384186 ) ) ( not ( = ?auto_384181 ?auto_384187 ) ) ( not ( = ?auto_384181 ?auto_384188 ) ) ( not ( = ?auto_384181 ?auto_384189 ) ) ( not ( = ?auto_384182 ?auto_384183 ) ) ( not ( = ?auto_384182 ?auto_384184 ) ) ( not ( = ?auto_384182 ?auto_384185 ) ) ( not ( = ?auto_384182 ?auto_384186 ) ) ( not ( = ?auto_384182 ?auto_384187 ) ) ( not ( = ?auto_384182 ?auto_384188 ) ) ( not ( = ?auto_384182 ?auto_384189 ) ) ( not ( = ?auto_384183 ?auto_384184 ) ) ( not ( = ?auto_384183 ?auto_384185 ) ) ( not ( = ?auto_384183 ?auto_384186 ) ) ( not ( = ?auto_384183 ?auto_384187 ) ) ( not ( = ?auto_384183 ?auto_384188 ) ) ( not ( = ?auto_384183 ?auto_384189 ) ) ( not ( = ?auto_384184 ?auto_384185 ) ) ( not ( = ?auto_384184 ?auto_384186 ) ) ( not ( = ?auto_384184 ?auto_384187 ) ) ( not ( = ?auto_384184 ?auto_384188 ) ) ( not ( = ?auto_384184 ?auto_384189 ) ) ( not ( = ?auto_384185 ?auto_384186 ) ) ( not ( = ?auto_384185 ?auto_384187 ) ) ( not ( = ?auto_384185 ?auto_384188 ) ) ( not ( = ?auto_384185 ?auto_384189 ) ) ( not ( = ?auto_384186 ?auto_384187 ) ) ( not ( = ?auto_384186 ?auto_384188 ) ) ( not ( = ?auto_384186 ?auto_384189 ) ) ( not ( = ?auto_384187 ?auto_384188 ) ) ( not ( = ?auto_384187 ?auto_384189 ) ) ( not ( = ?auto_384188 ?auto_384189 ) ) ( ON ?auto_384187 ?auto_384188 ) ( ON ?auto_384186 ?auto_384187 ) ( ON ?auto_384185 ?auto_384186 ) ( ON ?auto_384184 ?auto_384185 ) ( ON ?auto_384183 ?auto_384184 ) ( ON ?auto_384182 ?auto_384183 ) ( ON ?auto_384181 ?auto_384182 ) ( ON ?auto_384180 ?auto_384181 ) ( ON ?auto_384179 ?auto_384180 ) ( CLEAR ?auto_384177 ) ( ON ?auto_384178 ?auto_384179 ) ( CLEAR ?auto_384178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_384177 ?auto_384178 )
      ( MAKE-12PILE ?auto_384177 ?auto_384178 ?auto_384179 ?auto_384180 ?auto_384181 ?auto_384182 ?auto_384183 ?auto_384184 ?auto_384185 ?auto_384186 ?auto_384187 ?auto_384188 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384202 - BLOCK
      ?auto_384203 - BLOCK
      ?auto_384204 - BLOCK
      ?auto_384205 - BLOCK
      ?auto_384206 - BLOCK
      ?auto_384207 - BLOCK
      ?auto_384208 - BLOCK
      ?auto_384209 - BLOCK
      ?auto_384210 - BLOCK
      ?auto_384211 - BLOCK
      ?auto_384212 - BLOCK
      ?auto_384213 - BLOCK
    )
    :vars
    (
      ?auto_384214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384213 ?auto_384214 ) ( not ( = ?auto_384202 ?auto_384203 ) ) ( not ( = ?auto_384202 ?auto_384204 ) ) ( not ( = ?auto_384202 ?auto_384205 ) ) ( not ( = ?auto_384202 ?auto_384206 ) ) ( not ( = ?auto_384202 ?auto_384207 ) ) ( not ( = ?auto_384202 ?auto_384208 ) ) ( not ( = ?auto_384202 ?auto_384209 ) ) ( not ( = ?auto_384202 ?auto_384210 ) ) ( not ( = ?auto_384202 ?auto_384211 ) ) ( not ( = ?auto_384202 ?auto_384212 ) ) ( not ( = ?auto_384202 ?auto_384213 ) ) ( not ( = ?auto_384202 ?auto_384214 ) ) ( not ( = ?auto_384203 ?auto_384204 ) ) ( not ( = ?auto_384203 ?auto_384205 ) ) ( not ( = ?auto_384203 ?auto_384206 ) ) ( not ( = ?auto_384203 ?auto_384207 ) ) ( not ( = ?auto_384203 ?auto_384208 ) ) ( not ( = ?auto_384203 ?auto_384209 ) ) ( not ( = ?auto_384203 ?auto_384210 ) ) ( not ( = ?auto_384203 ?auto_384211 ) ) ( not ( = ?auto_384203 ?auto_384212 ) ) ( not ( = ?auto_384203 ?auto_384213 ) ) ( not ( = ?auto_384203 ?auto_384214 ) ) ( not ( = ?auto_384204 ?auto_384205 ) ) ( not ( = ?auto_384204 ?auto_384206 ) ) ( not ( = ?auto_384204 ?auto_384207 ) ) ( not ( = ?auto_384204 ?auto_384208 ) ) ( not ( = ?auto_384204 ?auto_384209 ) ) ( not ( = ?auto_384204 ?auto_384210 ) ) ( not ( = ?auto_384204 ?auto_384211 ) ) ( not ( = ?auto_384204 ?auto_384212 ) ) ( not ( = ?auto_384204 ?auto_384213 ) ) ( not ( = ?auto_384204 ?auto_384214 ) ) ( not ( = ?auto_384205 ?auto_384206 ) ) ( not ( = ?auto_384205 ?auto_384207 ) ) ( not ( = ?auto_384205 ?auto_384208 ) ) ( not ( = ?auto_384205 ?auto_384209 ) ) ( not ( = ?auto_384205 ?auto_384210 ) ) ( not ( = ?auto_384205 ?auto_384211 ) ) ( not ( = ?auto_384205 ?auto_384212 ) ) ( not ( = ?auto_384205 ?auto_384213 ) ) ( not ( = ?auto_384205 ?auto_384214 ) ) ( not ( = ?auto_384206 ?auto_384207 ) ) ( not ( = ?auto_384206 ?auto_384208 ) ) ( not ( = ?auto_384206 ?auto_384209 ) ) ( not ( = ?auto_384206 ?auto_384210 ) ) ( not ( = ?auto_384206 ?auto_384211 ) ) ( not ( = ?auto_384206 ?auto_384212 ) ) ( not ( = ?auto_384206 ?auto_384213 ) ) ( not ( = ?auto_384206 ?auto_384214 ) ) ( not ( = ?auto_384207 ?auto_384208 ) ) ( not ( = ?auto_384207 ?auto_384209 ) ) ( not ( = ?auto_384207 ?auto_384210 ) ) ( not ( = ?auto_384207 ?auto_384211 ) ) ( not ( = ?auto_384207 ?auto_384212 ) ) ( not ( = ?auto_384207 ?auto_384213 ) ) ( not ( = ?auto_384207 ?auto_384214 ) ) ( not ( = ?auto_384208 ?auto_384209 ) ) ( not ( = ?auto_384208 ?auto_384210 ) ) ( not ( = ?auto_384208 ?auto_384211 ) ) ( not ( = ?auto_384208 ?auto_384212 ) ) ( not ( = ?auto_384208 ?auto_384213 ) ) ( not ( = ?auto_384208 ?auto_384214 ) ) ( not ( = ?auto_384209 ?auto_384210 ) ) ( not ( = ?auto_384209 ?auto_384211 ) ) ( not ( = ?auto_384209 ?auto_384212 ) ) ( not ( = ?auto_384209 ?auto_384213 ) ) ( not ( = ?auto_384209 ?auto_384214 ) ) ( not ( = ?auto_384210 ?auto_384211 ) ) ( not ( = ?auto_384210 ?auto_384212 ) ) ( not ( = ?auto_384210 ?auto_384213 ) ) ( not ( = ?auto_384210 ?auto_384214 ) ) ( not ( = ?auto_384211 ?auto_384212 ) ) ( not ( = ?auto_384211 ?auto_384213 ) ) ( not ( = ?auto_384211 ?auto_384214 ) ) ( not ( = ?auto_384212 ?auto_384213 ) ) ( not ( = ?auto_384212 ?auto_384214 ) ) ( not ( = ?auto_384213 ?auto_384214 ) ) ( ON ?auto_384212 ?auto_384213 ) ( ON ?auto_384211 ?auto_384212 ) ( ON ?auto_384210 ?auto_384211 ) ( ON ?auto_384209 ?auto_384210 ) ( ON ?auto_384208 ?auto_384209 ) ( ON ?auto_384207 ?auto_384208 ) ( ON ?auto_384206 ?auto_384207 ) ( ON ?auto_384205 ?auto_384206 ) ( ON ?auto_384204 ?auto_384205 ) ( ON ?auto_384203 ?auto_384204 ) ( ON ?auto_384202 ?auto_384203 ) ( CLEAR ?auto_384202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_384202 )
      ( MAKE-12PILE ?auto_384202 ?auto_384203 ?auto_384204 ?auto_384205 ?auto_384206 ?auto_384207 ?auto_384208 ?auto_384209 ?auto_384210 ?auto_384211 ?auto_384212 ?auto_384213 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_384227 - BLOCK
      ?auto_384228 - BLOCK
      ?auto_384229 - BLOCK
      ?auto_384230 - BLOCK
      ?auto_384231 - BLOCK
      ?auto_384232 - BLOCK
      ?auto_384233 - BLOCK
      ?auto_384234 - BLOCK
      ?auto_384235 - BLOCK
      ?auto_384236 - BLOCK
      ?auto_384237 - BLOCK
      ?auto_384238 - BLOCK
    )
    :vars
    (
      ?auto_384239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384238 ?auto_384239 ) ( not ( = ?auto_384227 ?auto_384228 ) ) ( not ( = ?auto_384227 ?auto_384229 ) ) ( not ( = ?auto_384227 ?auto_384230 ) ) ( not ( = ?auto_384227 ?auto_384231 ) ) ( not ( = ?auto_384227 ?auto_384232 ) ) ( not ( = ?auto_384227 ?auto_384233 ) ) ( not ( = ?auto_384227 ?auto_384234 ) ) ( not ( = ?auto_384227 ?auto_384235 ) ) ( not ( = ?auto_384227 ?auto_384236 ) ) ( not ( = ?auto_384227 ?auto_384237 ) ) ( not ( = ?auto_384227 ?auto_384238 ) ) ( not ( = ?auto_384227 ?auto_384239 ) ) ( not ( = ?auto_384228 ?auto_384229 ) ) ( not ( = ?auto_384228 ?auto_384230 ) ) ( not ( = ?auto_384228 ?auto_384231 ) ) ( not ( = ?auto_384228 ?auto_384232 ) ) ( not ( = ?auto_384228 ?auto_384233 ) ) ( not ( = ?auto_384228 ?auto_384234 ) ) ( not ( = ?auto_384228 ?auto_384235 ) ) ( not ( = ?auto_384228 ?auto_384236 ) ) ( not ( = ?auto_384228 ?auto_384237 ) ) ( not ( = ?auto_384228 ?auto_384238 ) ) ( not ( = ?auto_384228 ?auto_384239 ) ) ( not ( = ?auto_384229 ?auto_384230 ) ) ( not ( = ?auto_384229 ?auto_384231 ) ) ( not ( = ?auto_384229 ?auto_384232 ) ) ( not ( = ?auto_384229 ?auto_384233 ) ) ( not ( = ?auto_384229 ?auto_384234 ) ) ( not ( = ?auto_384229 ?auto_384235 ) ) ( not ( = ?auto_384229 ?auto_384236 ) ) ( not ( = ?auto_384229 ?auto_384237 ) ) ( not ( = ?auto_384229 ?auto_384238 ) ) ( not ( = ?auto_384229 ?auto_384239 ) ) ( not ( = ?auto_384230 ?auto_384231 ) ) ( not ( = ?auto_384230 ?auto_384232 ) ) ( not ( = ?auto_384230 ?auto_384233 ) ) ( not ( = ?auto_384230 ?auto_384234 ) ) ( not ( = ?auto_384230 ?auto_384235 ) ) ( not ( = ?auto_384230 ?auto_384236 ) ) ( not ( = ?auto_384230 ?auto_384237 ) ) ( not ( = ?auto_384230 ?auto_384238 ) ) ( not ( = ?auto_384230 ?auto_384239 ) ) ( not ( = ?auto_384231 ?auto_384232 ) ) ( not ( = ?auto_384231 ?auto_384233 ) ) ( not ( = ?auto_384231 ?auto_384234 ) ) ( not ( = ?auto_384231 ?auto_384235 ) ) ( not ( = ?auto_384231 ?auto_384236 ) ) ( not ( = ?auto_384231 ?auto_384237 ) ) ( not ( = ?auto_384231 ?auto_384238 ) ) ( not ( = ?auto_384231 ?auto_384239 ) ) ( not ( = ?auto_384232 ?auto_384233 ) ) ( not ( = ?auto_384232 ?auto_384234 ) ) ( not ( = ?auto_384232 ?auto_384235 ) ) ( not ( = ?auto_384232 ?auto_384236 ) ) ( not ( = ?auto_384232 ?auto_384237 ) ) ( not ( = ?auto_384232 ?auto_384238 ) ) ( not ( = ?auto_384232 ?auto_384239 ) ) ( not ( = ?auto_384233 ?auto_384234 ) ) ( not ( = ?auto_384233 ?auto_384235 ) ) ( not ( = ?auto_384233 ?auto_384236 ) ) ( not ( = ?auto_384233 ?auto_384237 ) ) ( not ( = ?auto_384233 ?auto_384238 ) ) ( not ( = ?auto_384233 ?auto_384239 ) ) ( not ( = ?auto_384234 ?auto_384235 ) ) ( not ( = ?auto_384234 ?auto_384236 ) ) ( not ( = ?auto_384234 ?auto_384237 ) ) ( not ( = ?auto_384234 ?auto_384238 ) ) ( not ( = ?auto_384234 ?auto_384239 ) ) ( not ( = ?auto_384235 ?auto_384236 ) ) ( not ( = ?auto_384235 ?auto_384237 ) ) ( not ( = ?auto_384235 ?auto_384238 ) ) ( not ( = ?auto_384235 ?auto_384239 ) ) ( not ( = ?auto_384236 ?auto_384237 ) ) ( not ( = ?auto_384236 ?auto_384238 ) ) ( not ( = ?auto_384236 ?auto_384239 ) ) ( not ( = ?auto_384237 ?auto_384238 ) ) ( not ( = ?auto_384237 ?auto_384239 ) ) ( not ( = ?auto_384238 ?auto_384239 ) ) ( ON ?auto_384237 ?auto_384238 ) ( ON ?auto_384236 ?auto_384237 ) ( ON ?auto_384235 ?auto_384236 ) ( ON ?auto_384234 ?auto_384235 ) ( ON ?auto_384233 ?auto_384234 ) ( ON ?auto_384232 ?auto_384233 ) ( ON ?auto_384231 ?auto_384232 ) ( ON ?auto_384230 ?auto_384231 ) ( ON ?auto_384229 ?auto_384230 ) ( ON ?auto_384228 ?auto_384229 ) ( ON ?auto_384227 ?auto_384228 ) ( CLEAR ?auto_384227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_384227 )
      ( MAKE-12PILE ?auto_384227 ?auto_384228 ?auto_384229 ?auto_384230 ?auto_384231 ?auto_384232 ?auto_384233 ?auto_384234 ?auto_384235 ?auto_384236 ?auto_384237 ?auto_384238 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384253 - BLOCK
      ?auto_384254 - BLOCK
      ?auto_384255 - BLOCK
      ?auto_384256 - BLOCK
      ?auto_384257 - BLOCK
      ?auto_384258 - BLOCK
      ?auto_384259 - BLOCK
      ?auto_384260 - BLOCK
      ?auto_384261 - BLOCK
      ?auto_384262 - BLOCK
      ?auto_384263 - BLOCK
      ?auto_384264 - BLOCK
      ?auto_384265 - BLOCK
    )
    :vars
    (
      ?auto_384266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_384264 ) ( ON ?auto_384265 ?auto_384266 ) ( CLEAR ?auto_384265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_384253 ) ( ON ?auto_384254 ?auto_384253 ) ( ON ?auto_384255 ?auto_384254 ) ( ON ?auto_384256 ?auto_384255 ) ( ON ?auto_384257 ?auto_384256 ) ( ON ?auto_384258 ?auto_384257 ) ( ON ?auto_384259 ?auto_384258 ) ( ON ?auto_384260 ?auto_384259 ) ( ON ?auto_384261 ?auto_384260 ) ( ON ?auto_384262 ?auto_384261 ) ( ON ?auto_384263 ?auto_384262 ) ( ON ?auto_384264 ?auto_384263 ) ( not ( = ?auto_384253 ?auto_384254 ) ) ( not ( = ?auto_384253 ?auto_384255 ) ) ( not ( = ?auto_384253 ?auto_384256 ) ) ( not ( = ?auto_384253 ?auto_384257 ) ) ( not ( = ?auto_384253 ?auto_384258 ) ) ( not ( = ?auto_384253 ?auto_384259 ) ) ( not ( = ?auto_384253 ?auto_384260 ) ) ( not ( = ?auto_384253 ?auto_384261 ) ) ( not ( = ?auto_384253 ?auto_384262 ) ) ( not ( = ?auto_384253 ?auto_384263 ) ) ( not ( = ?auto_384253 ?auto_384264 ) ) ( not ( = ?auto_384253 ?auto_384265 ) ) ( not ( = ?auto_384253 ?auto_384266 ) ) ( not ( = ?auto_384254 ?auto_384255 ) ) ( not ( = ?auto_384254 ?auto_384256 ) ) ( not ( = ?auto_384254 ?auto_384257 ) ) ( not ( = ?auto_384254 ?auto_384258 ) ) ( not ( = ?auto_384254 ?auto_384259 ) ) ( not ( = ?auto_384254 ?auto_384260 ) ) ( not ( = ?auto_384254 ?auto_384261 ) ) ( not ( = ?auto_384254 ?auto_384262 ) ) ( not ( = ?auto_384254 ?auto_384263 ) ) ( not ( = ?auto_384254 ?auto_384264 ) ) ( not ( = ?auto_384254 ?auto_384265 ) ) ( not ( = ?auto_384254 ?auto_384266 ) ) ( not ( = ?auto_384255 ?auto_384256 ) ) ( not ( = ?auto_384255 ?auto_384257 ) ) ( not ( = ?auto_384255 ?auto_384258 ) ) ( not ( = ?auto_384255 ?auto_384259 ) ) ( not ( = ?auto_384255 ?auto_384260 ) ) ( not ( = ?auto_384255 ?auto_384261 ) ) ( not ( = ?auto_384255 ?auto_384262 ) ) ( not ( = ?auto_384255 ?auto_384263 ) ) ( not ( = ?auto_384255 ?auto_384264 ) ) ( not ( = ?auto_384255 ?auto_384265 ) ) ( not ( = ?auto_384255 ?auto_384266 ) ) ( not ( = ?auto_384256 ?auto_384257 ) ) ( not ( = ?auto_384256 ?auto_384258 ) ) ( not ( = ?auto_384256 ?auto_384259 ) ) ( not ( = ?auto_384256 ?auto_384260 ) ) ( not ( = ?auto_384256 ?auto_384261 ) ) ( not ( = ?auto_384256 ?auto_384262 ) ) ( not ( = ?auto_384256 ?auto_384263 ) ) ( not ( = ?auto_384256 ?auto_384264 ) ) ( not ( = ?auto_384256 ?auto_384265 ) ) ( not ( = ?auto_384256 ?auto_384266 ) ) ( not ( = ?auto_384257 ?auto_384258 ) ) ( not ( = ?auto_384257 ?auto_384259 ) ) ( not ( = ?auto_384257 ?auto_384260 ) ) ( not ( = ?auto_384257 ?auto_384261 ) ) ( not ( = ?auto_384257 ?auto_384262 ) ) ( not ( = ?auto_384257 ?auto_384263 ) ) ( not ( = ?auto_384257 ?auto_384264 ) ) ( not ( = ?auto_384257 ?auto_384265 ) ) ( not ( = ?auto_384257 ?auto_384266 ) ) ( not ( = ?auto_384258 ?auto_384259 ) ) ( not ( = ?auto_384258 ?auto_384260 ) ) ( not ( = ?auto_384258 ?auto_384261 ) ) ( not ( = ?auto_384258 ?auto_384262 ) ) ( not ( = ?auto_384258 ?auto_384263 ) ) ( not ( = ?auto_384258 ?auto_384264 ) ) ( not ( = ?auto_384258 ?auto_384265 ) ) ( not ( = ?auto_384258 ?auto_384266 ) ) ( not ( = ?auto_384259 ?auto_384260 ) ) ( not ( = ?auto_384259 ?auto_384261 ) ) ( not ( = ?auto_384259 ?auto_384262 ) ) ( not ( = ?auto_384259 ?auto_384263 ) ) ( not ( = ?auto_384259 ?auto_384264 ) ) ( not ( = ?auto_384259 ?auto_384265 ) ) ( not ( = ?auto_384259 ?auto_384266 ) ) ( not ( = ?auto_384260 ?auto_384261 ) ) ( not ( = ?auto_384260 ?auto_384262 ) ) ( not ( = ?auto_384260 ?auto_384263 ) ) ( not ( = ?auto_384260 ?auto_384264 ) ) ( not ( = ?auto_384260 ?auto_384265 ) ) ( not ( = ?auto_384260 ?auto_384266 ) ) ( not ( = ?auto_384261 ?auto_384262 ) ) ( not ( = ?auto_384261 ?auto_384263 ) ) ( not ( = ?auto_384261 ?auto_384264 ) ) ( not ( = ?auto_384261 ?auto_384265 ) ) ( not ( = ?auto_384261 ?auto_384266 ) ) ( not ( = ?auto_384262 ?auto_384263 ) ) ( not ( = ?auto_384262 ?auto_384264 ) ) ( not ( = ?auto_384262 ?auto_384265 ) ) ( not ( = ?auto_384262 ?auto_384266 ) ) ( not ( = ?auto_384263 ?auto_384264 ) ) ( not ( = ?auto_384263 ?auto_384265 ) ) ( not ( = ?auto_384263 ?auto_384266 ) ) ( not ( = ?auto_384264 ?auto_384265 ) ) ( not ( = ?auto_384264 ?auto_384266 ) ) ( not ( = ?auto_384265 ?auto_384266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_384265 ?auto_384266 )
      ( !STACK ?auto_384265 ?auto_384264 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384280 - BLOCK
      ?auto_384281 - BLOCK
      ?auto_384282 - BLOCK
      ?auto_384283 - BLOCK
      ?auto_384284 - BLOCK
      ?auto_384285 - BLOCK
      ?auto_384286 - BLOCK
      ?auto_384287 - BLOCK
      ?auto_384288 - BLOCK
      ?auto_384289 - BLOCK
      ?auto_384290 - BLOCK
      ?auto_384291 - BLOCK
      ?auto_384292 - BLOCK
    )
    :vars
    (
      ?auto_384293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_384291 ) ( ON ?auto_384292 ?auto_384293 ) ( CLEAR ?auto_384292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_384280 ) ( ON ?auto_384281 ?auto_384280 ) ( ON ?auto_384282 ?auto_384281 ) ( ON ?auto_384283 ?auto_384282 ) ( ON ?auto_384284 ?auto_384283 ) ( ON ?auto_384285 ?auto_384284 ) ( ON ?auto_384286 ?auto_384285 ) ( ON ?auto_384287 ?auto_384286 ) ( ON ?auto_384288 ?auto_384287 ) ( ON ?auto_384289 ?auto_384288 ) ( ON ?auto_384290 ?auto_384289 ) ( ON ?auto_384291 ?auto_384290 ) ( not ( = ?auto_384280 ?auto_384281 ) ) ( not ( = ?auto_384280 ?auto_384282 ) ) ( not ( = ?auto_384280 ?auto_384283 ) ) ( not ( = ?auto_384280 ?auto_384284 ) ) ( not ( = ?auto_384280 ?auto_384285 ) ) ( not ( = ?auto_384280 ?auto_384286 ) ) ( not ( = ?auto_384280 ?auto_384287 ) ) ( not ( = ?auto_384280 ?auto_384288 ) ) ( not ( = ?auto_384280 ?auto_384289 ) ) ( not ( = ?auto_384280 ?auto_384290 ) ) ( not ( = ?auto_384280 ?auto_384291 ) ) ( not ( = ?auto_384280 ?auto_384292 ) ) ( not ( = ?auto_384280 ?auto_384293 ) ) ( not ( = ?auto_384281 ?auto_384282 ) ) ( not ( = ?auto_384281 ?auto_384283 ) ) ( not ( = ?auto_384281 ?auto_384284 ) ) ( not ( = ?auto_384281 ?auto_384285 ) ) ( not ( = ?auto_384281 ?auto_384286 ) ) ( not ( = ?auto_384281 ?auto_384287 ) ) ( not ( = ?auto_384281 ?auto_384288 ) ) ( not ( = ?auto_384281 ?auto_384289 ) ) ( not ( = ?auto_384281 ?auto_384290 ) ) ( not ( = ?auto_384281 ?auto_384291 ) ) ( not ( = ?auto_384281 ?auto_384292 ) ) ( not ( = ?auto_384281 ?auto_384293 ) ) ( not ( = ?auto_384282 ?auto_384283 ) ) ( not ( = ?auto_384282 ?auto_384284 ) ) ( not ( = ?auto_384282 ?auto_384285 ) ) ( not ( = ?auto_384282 ?auto_384286 ) ) ( not ( = ?auto_384282 ?auto_384287 ) ) ( not ( = ?auto_384282 ?auto_384288 ) ) ( not ( = ?auto_384282 ?auto_384289 ) ) ( not ( = ?auto_384282 ?auto_384290 ) ) ( not ( = ?auto_384282 ?auto_384291 ) ) ( not ( = ?auto_384282 ?auto_384292 ) ) ( not ( = ?auto_384282 ?auto_384293 ) ) ( not ( = ?auto_384283 ?auto_384284 ) ) ( not ( = ?auto_384283 ?auto_384285 ) ) ( not ( = ?auto_384283 ?auto_384286 ) ) ( not ( = ?auto_384283 ?auto_384287 ) ) ( not ( = ?auto_384283 ?auto_384288 ) ) ( not ( = ?auto_384283 ?auto_384289 ) ) ( not ( = ?auto_384283 ?auto_384290 ) ) ( not ( = ?auto_384283 ?auto_384291 ) ) ( not ( = ?auto_384283 ?auto_384292 ) ) ( not ( = ?auto_384283 ?auto_384293 ) ) ( not ( = ?auto_384284 ?auto_384285 ) ) ( not ( = ?auto_384284 ?auto_384286 ) ) ( not ( = ?auto_384284 ?auto_384287 ) ) ( not ( = ?auto_384284 ?auto_384288 ) ) ( not ( = ?auto_384284 ?auto_384289 ) ) ( not ( = ?auto_384284 ?auto_384290 ) ) ( not ( = ?auto_384284 ?auto_384291 ) ) ( not ( = ?auto_384284 ?auto_384292 ) ) ( not ( = ?auto_384284 ?auto_384293 ) ) ( not ( = ?auto_384285 ?auto_384286 ) ) ( not ( = ?auto_384285 ?auto_384287 ) ) ( not ( = ?auto_384285 ?auto_384288 ) ) ( not ( = ?auto_384285 ?auto_384289 ) ) ( not ( = ?auto_384285 ?auto_384290 ) ) ( not ( = ?auto_384285 ?auto_384291 ) ) ( not ( = ?auto_384285 ?auto_384292 ) ) ( not ( = ?auto_384285 ?auto_384293 ) ) ( not ( = ?auto_384286 ?auto_384287 ) ) ( not ( = ?auto_384286 ?auto_384288 ) ) ( not ( = ?auto_384286 ?auto_384289 ) ) ( not ( = ?auto_384286 ?auto_384290 ) ) ( not ( = ?auto_384286 ?auto_384291 ) ) ( not ( = ?auto_384286 ?auto_384292 ) ) ( not ( = ?auto_384286 ?auto_384293 ) ) ( not ( = ?auto_384287 ?auto_384288 ) ) ( not ( = ?auto_384287 ?auto_384289 ) ) ( not ( = ?auto_384287 ?auto_384290 ) ) ( not ( = ?auto_384287 ?auto_384291 ) ) ( not ( = ?auto_384287 ?auto_384292 ) ) ( not ( = ?auto_384287 ?auto_384293 ) ) ( not ( = ?auto_384288 ?auto_384289 ) ) ( not ( = ?auto_384288 ?auto_384290 ) ) ( not ( = ?auto_384288 ?auto_384291 ) ) ( not ( = ?auto_384288 ?auto_384292 ) ) ( not ( = ?auto_384288 ?auto_384293 ) ) ( not ( = ?auto_384289 ?auto_384290 ) ) ( not ( = ?auto_384289 ?auto_384291 ) ) ( not ( = ?auto_384289 ?auto_384292 ) ) ( not ( = ?auto_384289 ?auto_384293 ) ) ( not ( = ?auto_384290 ?auto_384291 ) ) ( not ( = ?auto_384290 ?auto_384292 ) ) ( not ( = ?auto_384290 ?auto_384293 ) ) ( not ( = ?auto_384291 ?auto_384292 ) ) ( not ( = ?auto_384291 ?auto_384293 ) ) ( not ( = ?auto_384292 ?auto_384293 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_384292 ?auto_384293 )
      ( !STACK ?auto_384292 ?auto_384291 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384307 - BLOCK
      ?auto_384308 - BLOCK
      ?auto_384309 - BLOCK
      ?auto_384310 - BLOCK
      ?auto_384311 - BLOCK
      ?auto_384312 - BLOCK
      ?auto_384313 - BLOCK
      ?auto_384314 - BLOCK
      ?auto_384315 - BLOCK
      ?auto_384316 - BLOCK
      ?auto_384317 - BLOCK
      ?auto_384318 - BLOCK
      ?auto_384319 - BLOCK
    )
    :vars
    (
      ?auto_384320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384319 ?auto_384320 ) ( ON-TABLE ?auto_384307 ) ( ON ?auto_384308 ?auto_384307 ) ( ON ?auto_384309 ?auto_384308 ) ( ON ?auto_384310 ?auto_384309 ) ( ON ?auto_384311 ?auto_384310 ) ( ON ?auto_384312 ?auto_384311 ) ( ON ?auto_384313 ?auto_384312 ) ( ON ?auto_384314 ?auto_384313 ) ( ON ?auto_384315 ?auto_384314 ) ( ON ?auto_384316 ?auto_384315 ) ( ON ?auto_384317 ?auto_384316 ) ( not ( = ?auto_384307 ?auto_384308 ) ) ( not ( = ?auto_384307 ?auto_384309 ) ) ( not ( = ?auto_384307 ?auto_384310 ) ) ( not ( = ?auto_384307 ?auto_384311 ) ) ( not ( = ?auto_384307 ?auto_384312 ) ) ( not ( = ?auto_384307 ?auto_384313 ) ) ( not ( = ?auto_384307 ?auto_384314 ) ) ( not ( = ?auto_384307 ?auto_384315 ) ) ( not ( = ?auto_384307 ?auto_384316 ) ) ( not ( = ?auto_384307 ?auto_384317 ) ) ( not ( = ?auto_384307 ?auto_384318 ) ) ( not ( = ?auto_384307 ?auto_384319 ) ) ( not ( = ?auto_384307 ?auto_384320 ) ) ( not ( = ?auto_384308 ?auto_384309 ) ) ( not ( = ?auto_384308 ?auto_384310 ) ) ( not ( = ?auto_384308 ?auto_384311 ) ) ( not ( = ?auto_384308 ?auto_384312 ) ) ( not ( = ?auto_384308 ?auto_384313 ) ) ( not ( = ?auto_384308 ?auto_384314 ) ) ( not ( = ?auto_384308 ?auto_384315 ) ) ( not ( = ?auto_384308 ?auto_384316 ) ) ( not ( = ?auto_384308 ?auto_384317 ) ) ( not ( = ?auto_384308 ?auto_384318 ) ) ( not ( = ?auto_384308 ?auto_384319 ) ) ( not ( = ?auto_384308 ?auto_384320 ) ) ( not ( = ?auto_384309 ?auto_384310 ) ) ( not ( = ?auto_384309 ?auto_384311 ) ) ( not ( = ?auto_384309 ?auto_384312 ) ) ( not ( = ?auto_384309 ?auto_384313 ) ) ( not ( = ?auto_384309 ?auto_384314 ) ) ( not ( = ?auto_384309 ?auto_384315 ) ) ( not ( = ?auto_384309 ?auto_384316 ) ) ( not ( = ?auto_384309 ?auto_384317 ) ) ( not ( = ?auto_384309 ?auto_384318 ) ) ( not ( = ?auto_384309 ?auto_384319 ) ) ( not ( = ?auto_384309 ?auto_384320 ) ) ( not ( = ?auto_384310 ?auto_384311 ) ) ( not ( = ?auto_384310 ?auto_384312 ) ) ( not ( = ?auto_384310 ?auto_384313 ) ) ( not ( = ?auto_384310 ?auto_384314 ) ) ( not ( = ?auto_384310 ?auto_384315 ) ) ( not ( = ?auto_384310 ?auto_384316 ) ) ( not ( = ?auto_384310 ?auto_384317 ) ) ( not ( = ?auto_384310 ?auto_384318 ) ) ( not ( = ?auto_384310 ?auto_384319 ) ) ( not ( = ?auto_384310 ?auto_384320 ) ) ( not ( = ?auto_384311 ?auto_384312 ) ) ( not ( = ?auto_384311 ?auto_384313 ) ) ( not ( = ?auto_384311 ?auto_384314 ) ) ( not ( = ?auto_384311 ?auto_384315 ) ) ( not ( = ?auto_384311 ?auto_384316 ) ) ( not ( = ?auto_384311 ?auto_384317 ) ) ( not ( = ?auto_384311 ?auto_384318 ) ) ( not ( = ?auto_384311 ?auto_384319 ) ) ( not ( = ?auto_384311 ?auto_384320 ) ) ( not ( = ?auto_384312 ?auto_384313 ) ) ( not ( = ?auto_384312 ?auto_384314 ) ) ( not ( = ?auto_384312 ?auto_384315 ) ) ( not ( = ?auto_384312 ?auto_384316 ) ) ( not ( = ?auto_384312 ?auto_384317 ) ) ( not ( = ?auto_384312 ?auto_384318 ) ) ( not ( = ?auto_384312 ?auto_384319 ) ) ( not ( = ?auto_384312 ?auto_384320 ) ) ( not ( = ?auto_384313 ?auto_384314 ) ) ( not ( = ?auto_384313 ?auto_384315 ) ) ( not ( = ?auto_384313 ?auto_384316 ) ) ( not ( = ?auto_384313 ?auto_384317 ) ) ( not ( = ?auto_384313 ?auto_384318 ) ) ( not ( = ?auto_384313 ?auto_384319 ) ) ( not ( = ?auto_384313 ?auto_384320 ) ) ( not ( = ?auto_384314 ?auto_384315 ) ) ( not ( = ?auto_384314 ?auto_384316 ) ) ( not ( = ?auto_384314 ?auto_384317 ) ) ( not ( = ?auto_384314 ?auto_384318 ) ) ( not ( = ?auto_384314 ?auto_384319 ) ) ( not ( = ?auto_384314 ?auto_384320 ) ) ( not ( = ?auto_384315 ?auto_384316 ) ) ( not ( = ?auto_384315 ?auto_384317 ) ) ( not ( = ?auto_384315 ?auto_384318 ) ) ( not ( = ?auto_384315 ?auto_384319 ) ) ( not ( = ?auto_384315 ?auto_384320 ) ) ( not ( = ?auto_384316 ?auto_384317 ) ) ( not ( = ?auto_384316 ?auto_384318 ) ) ( not ( = ?auto_384316 ?auto_384319 ) ) ( not ( = ?auto_384316 ?auto_384320 ) ) ( not ( = ?auto_384317 ?auto_384318 ) ) ( not ( = ?auto_384317 ?auto_384319 ) ) ( not ( = ?auto_384317 ?auto_384320 ) ) ( not ( = ?auto_384318 ?auto_384319 ) ) ( not ( = ?auto_384318 ?auto_384320 ) ) ( not ( = ?auto_384319 ?auto_384320 ) ) ( CLEAR ?auto_384317 ) ( ON ?auto_384318 ?auto_384319 ) ( CLEAR ?auto_384318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_384307 ?auto_384308 ?auto_384309 ?auto_384310 ?auto_384311 ?auto_384312 ?auto_384313 ?auto_384314 ?auto_384315 ?auto_384316 ?auto_384317 ?auto_384318 )
      ( MAKE-13PILE ?auto_384307 ?auto_384308 ?auto_384309 ?auto_384310 ?auto_384311 ?auto_384312 ?auto_384313 ?auto_384314 ?auto_384315 ?auto_384316 ?auto_384317 ?auto_384318 ?auto_384319 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384334 - BLOCK
      ?auto_384335 - BLOCK
      ?auto_384336 - BLOCK
      ?auto_384337 - BLOCK
      ?auto_384338 - BLOCK
      ?auto_384339 - BLOCK
      ?auto_384340 - BLOCK
      ?auto_384341 - BLOCK
      ?auto_384342 - BLOCK
      ?auto_384343 - BLOCK
      ?auto_384344 - BLOCK
      ?auto_384345 - BLOCK
      ?auto_384346 - BLOCK
    )
    :vars
    (
      ?auto_384347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384346 ?auto_384347 ) ( ON-TABLE ?auto_384334 ) ( ON ?auto_384335 ?auto_384334 ) ( ON ?auto_384336 ?auto_384335 ) ( ON ?auto_384337 ?auto_384336 ) ( ON ?auto_384338 ?auto_384337 ) ( ON ?auto_384339 ?auto_384338 ) ( ON ?auto_384340 ?auto_384339 ) ( ON ?auto_384341 ?auto_384340 ) ( ON ?auto_384342 ?auto_384341 ) ( ON ?auto_384343 ?auto_384342 ) ( ON ?auto_384344 ?auto_384343 ) ( not ( = ?auto_384334 ?auto_384335 ) ) ( not ( = ?auto_384334 ?auto_384336 ) ) ( not ( = ?auto_384334 ?auto_384337 ) ) ( not ( = ?auto_384334 ?auto_384338 ) ) ( not ( = ?auto_384334 ?auto_384339 ) ) ( not ( = ?auto_384334 ?auto_384340 ) ) ( not ( = ?auto_384334 ?auto_384341 ) ) ( not ( = ?auto_384334 ?auto_384342 ) ) ( not ( = ?auto_384334 ?auto_384343 ) ) ( not ( = ?auto_384334 ?auto_384344 ) ) ( not ( = ?auto_384334 ?auto_384345 ) ) ( not ( = ?auto_384334 ?auto_384346 ) ) ( not ( = ?auto_384334 ?auto_384347 ) ) ( not ( = ?auto_384335 ?auto_384336 ) ) ( not ( = ?auto_384335 ?auto_384337 ) ) ( not ( = ?auto_384335 ?auto_384338 ) ) ( not ( = ?auto_384335 ?auto_384339 ) ) ( not ( = ?auto_384335 ?auto_384340 ) ) ( not ( = ?auto_384335 ?auto_384341 ) ) ( not ( = ?auto_384335 ?auto_384342 ) ) ( not ( = ?auto_384335 ?auto_384343 ) ) ( not ( = ?auto_384335 ?auto_384344 ) ) ( not ( = ?auto_384335 ?auto_384345 ) ) ( not ( = ?auto_384335 ?auto_384346 ) ) ( not ( = ?auto_384335 ?auto_384347 ) ) ( not ( = ?auto_384336 ?auto_384337 ) ) ( not ( = ?auto_384336 ?auto_384338 ) ) ( not ( = ?auto_384336 ?auto_384339 ) ) ( not ( = ?auto_384336 ?auto_384340 ) ) ( not ( = ?auto_384336 ?auto_384341 ) ) ( not ( = ?auto_384336 ?auto_384342 ) ) ( not ( = ?auto_384336 ?auto_384343 ) ) ( not ( = ?auto_384336 ?auto_384344 ) ) ( not ( = ?auto_384336 ?auto_384345 ) ) ( not ( = ?auto_384336 ?auto_384346 ) ) ( not ( = ?auto_384336 ?auto_384347 ) ) ( not ( = ?auto_384337 ?auto_384338 ) ) ( not ( = ?auto_384337 ?auto_384339 ) ) ( not ( = ?auto_384337 ?auto_384340 ) ) ( not ( = ?auto_384337 ?auto_384341 ) ) ( not ( = ?auto_384337 ?auto_384342 ) ) ( not ( = ?auto_384337 ?auto_384343 ) ) ( not ( = ?auto_384337 ?auto_384344 ) ) ( not ( = ?auto_384337 ?auto_384345 ) ) ( not ( = ?auto_384337 ?auto_384346 ) ) ( not ( = ?auto_384337 ?auto_384347 ) ) ( not ( = ?auto_384338 ?auto_384339 ) ) ( not ( = ?auto_384338 ?auto_384340 ) ) ( not ( = ?auto_384338 ?auto_384341 ) ) ( not ( = ?auto_384338 ?auto_384342 ) ) ( not ( = ?auto_384338 ?auto_384343 ) ) ( not ( = ?auto_384338 ?auto_384344 ) ) ( not ( = ?auto_384338 ?auto_384345 ) ) ( not ( = ?auto_384338 ?auto_384346 ) ) ( not ( = ?auto_384338 ?auto_384347 ) ) ( not ( = ?auto_384339 ?auto_384340 ) ) ( not ( = ?auto_384339 ?auto_384341 ) ) ( not ( = ?auto_384339 ?auto_384342 ) ) ( not ( = ?auto_384339 ?auto_384343 ) ) ( not ( = ?auto_384339 ?auto_384344 ) ) ( not ( = ?auto_384339 ?auto_384345 ) ) ( not ( = ?auto_384339 ?auto_384346 ) ) ( not ( = ?auto_384339 ?auto_384347 ) ) ( not ( = ?auto_384340 ?auto_384341 ) ) ( not ( = ?auto_384340 ?auto_384342 ) ) ( not ( = ?auto_384340 ?auto_384343 ) ) ( not ( = ?auto_384340 ?auto_384344 ) ) ( not ( = ?auto_384340 ?auto_384345 ) ) ( not ( = ?auto_384340 ?auto_384346 ) ) ( not ( = ?auto_384340 ?auto_384347 ) ) ( not ( = ?auto_384341 ?auto_384342 ) ) ( not ( = ?auto_384341 ?auto_384343 ) ) ( not ( = ?auto_384341 ?auto_384344 ) ) ( not ( = ?auto_384341 ?auto_384345 ) ) ( not ( = ?auto_384341 ?auto_384346 ) ) ( not ( = ?auto_384341 ?auto_384347 ) ) ( not ( = ?auto_384342 ?auto_384343 ) ) ( not ( = ?auto_384342 ?auto_384344 ) ) ( not ( = ?auto_384342 ?auto_384345 ) ) ( not ( = ?auto_384342 ?auto_384346 ) ) ( not ( = ?auto_384342 ?auto_384347 ) ) ( not ( = ?auto_384343 ?auto_384344 ) ) ( not ( = ?auto_384343 ?auto_384345 ) ) ( not ( = ?auto_384343 ?auto_384346 ) ) ( not ( = ?auto_384343 ?auto_384347 ) ) ( not ( = ?auto_384344 ?auto_384345 ) ) ( not ( = ?auto_384344 ?auto_384346 ) ) ( not ( = ?auto_384344 ?auto_384347 ) ) ( not ( = ?auto_384345 ?auto_384346 ) ) ( not ( = ?auto_384345 ?auto_384347 ) ) ( not ( = ?auto_384346 ?auto_384347 ) ) ( CLEAR ?auto_384344 ) ( ON ?auto_384345 ?auto_384346 ) ( CLEAR ?auto_384345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_384334 ?auto_384335 ?auto_384336 ?auto_384337 ?auto_384338 ?auto_384339 ?auto_384340 ?auto_384341 ?auto_384342 ?auto_384343 ?auto_384344 ?auto_384345 )
      ( MAKE-13PILE ?auto_384334 ?auto_384335 ?auto_384336 ?auto_384337 ?auto_384338 ?auto_384339 ?auto_384340 ?auto_384341 ?auto_384342 ?auto_384343 ?auto_384344 ?auto_384345 ?auto_384346 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384361 - BLOCK
      ?auto_384362 - BLOCK
      ?auto_384363 - BLOCK
      ?auto_384364 - BLOCK
      ?auto_384365 - BLOCK
      ?auto_384366 - BLOCK
      ?auto_384367 - BLOCK
      ?auto_384368 - BLOCK
      ?auto_384369 - BLOCK
      ?auto_384370 - BLOCK
      ?auto_384371 - BLOCK
      ?auto_384372 - BLOCK
      ?auto_384373 - BLOCK
    )
    :vars
    (
      ?auto_384374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384373 ?auto_384374 ) ( ON-TABLE ?auto_384361 ) ( ON ?auto_384362 ?auto_384361 ) ( ON ?auto_384363 ?auto_384362 ) ( ON ?auto_384364 ?auto_384363 ) ( ON ?auto_384365 ?auto_384364 ) ( ON ?auto_384366 ?auto_384365 ) ( ON ?auto_384367 ?auto_384366 ) ( ON ?auto_384368 ?auto_384367 ) ( ON ?auto_384369 ?auto_384368 ) ( ON ?auto_384370 ?auto_384369 ) ( not ( = ?auto_384361 ?auto_384362 ) ) ( not ( = ?auto_384361 ?auto_384363 ) ) ( not ( = ?auto_384361 ?auto_384364 ) ) ( not ( = ?auto_384361 ?auto_384365 ) ) ( not ( = ?auto_384361 ?auto_384366 ) ) ( not ( = ?auto_384361 ?auto_384367 ) ) ( not ( = ?auto_384361 ?auto_384368 ) ) ( not ( = ?auto_384361 ?auto_384369 ) ) ( not ( = ?auto_384361 ?auto_384370 ) ) ( not ( = ?auto_384361 ?auto_384371 ) ) ( not ( = ?auto_384361 ?auto_384372 ) ) ( not ( = ?auto_384361 ?auto_384373 ) ) ( not ( = ?auto_384361 ?auto_384374 ) ) ( not ( = ?auto_384362 ?auto_384363 ) ) ( not ( = ?auto_384362 ?auto_384364 ) ) ( not ( = ?auto_384362 ?auto_384365 ) ) ( not ( = ?auto_384362 ?auto_384366 ) ) ( not ( = ?auto_384362 ?auto_384367 ) ) ( not ( = ?auto_384362 ?auto_384368 ) ) ( not ( = ?auto_384362 ?auto_384369 ) ) ( not ( = ?auto_384362 ?auto_384370 ) ) ( not ( = ?auto_384362 ?auto_384371 ) ) ( not ( = ?auto_384362 ?auto_384372 ) ) ( not ( = ?auto_384362 ?auto_384373 ) ) ( not ( = ?auto_384362 ?auto_384374 ) ) ( not ( = ?auto_384363 ?auto_384364 ) ) ( not ( = ?auto_384363 ?auto_384365 ) ) ( not ( = ?auto_384363 ?auto_384366 ) ) ( not ( = ?auto_384363 ?auto_384367 ) ) ( not ( = ?auto_384363 ?auto_384368 ) ) ( not ( = ?auto_384363 ?auto_384369 ) ) ( not ( = ?auto_384363 ?auto_384370 ) ) ( not ( = ?auto_384363 ?auto_384371 ) ) ( not ( = ?auto_384363 ?auto_384372 ) ) ( not ( = ?auto_384363 ?auto_384373 ) ) ( not ( = ?auto_384363 ?auto_384374 ) ) ( not ( = ?auto_384364 ?auto_384365 ) ) ( not ( = ?auto_384364 ?auto_384366 ) ) ( not ( = ?auto_384364 ?auto_384367 ) ) ( not ( = ?auto_384364 ?auto_384368 ) ) ( not ( = ?auto_384364 ?auto_384369 ) ) ( not ( = ?auto_384364 ?auto_384370 ) ) ( not ( = ?auto_384364 ?auto_384371 ) ) ( not ( = ?auto_384364 ?auto_384372 ) ) ( not ( = ?auto_384364 ?auto_384373 ) ) ( not ( = ?auto_384364 ?auto_384374 ) ) ( not ( = ?auto_384365 ?auto_384366 ) ) ( not ( = ?auto_384365 ?auto_384367 ) ) ( not ( = ?auto_384365 ?auto_384368 ) ) ( not ( = ?auto_384365 ?auto_384369 ) ) ( not ( = ?auto_384365 ?auto_384370 ) ) ( not ( = ?auto_384365 ?auto_384371 ) ) ( not ( = ?auto_384365 ?auto_384372 ) ) ( not ( = ?auto_384365 ?auto_384373 ) ) ( not ( = ?auto_384365 ?auto_384374 ) ) ( not ( = ?auto_384366 ?auto_384367 ) ) ( not ( = ?auto_384366 ?auto_384368 ) ) ( not ( = ?auto_384366 ?auto_384369 ) ) ( not ( = ?auto_384366 ?auto_384370 ) ) ( not ( = ?auto_384366 ?auto_384371 ) ) ( not ( = ?auto_384366 ?auto_384372 ) ) ( not ( = ?auto_384366 ?auto_384373 ) ) ( not ( = ?auto_384366 ?auto_384374 ) ) ( not ( = ?auto_384367 ?auto_384368 ) ) ( not ( = ?auto_384367 ?auto_384369 ) ) ( not ( = ?auto_384367 ?auto_384370 ) ) ( not ( = ?auto_384367 ?auto_384371 ) ) ( not ( = ?auto_384367 ?auto_384372 ) ) ( not ( = ?auto_384367 ?auto_384373 ) ) ( not ( = ?auto_384367 ?auto_384374 ) ) ( not ( = ?auto_384368 ?auto_384369 ) ) ( not ( = ?auto_384368 ?auto_384370 ) ) ( not ( = ?auto_384368 ?auto_384371 ) ) ( not ( = ?auto_384368 ?auto_384372 ) ) ( not ( = ?auto_384368 ?auto_384373 ) ) ( not ( = ?auto_384368 ?auto_384374 ) ) ( not ( = ?auto_384369 ?auto_384370 ) ) ( not ( = ?auto_384369 ?auto_384371 ) ) ( not ( = ?auto_384369 ?auto_384372 ) ) ( not ( = ?auto_384369 ?auto_384373 ) ) ( not ( = ?auto_384369 ?auto_384374 ) ) ( not ( = ?auto_384370 ?auto_384371 ) ) ( not ( = ?auto_384370 ?auto_384372 ) ) ( not ( = ?auto_384370 ?auto_384373 ) ) ( not ( = ?auto_384370 ?auto_384374 ) ) ( not ( = ?auto_384371 ?auto_384372 ) ) ( not ( = ?auto_384371 ?auto_384373 ) ) ( not ( = ?auto_384371 ?auto_384374 ) ) ( not ( = ?auto_384372 ?auto_384373 ) ) ( not ( = ?auto_384372 ?auto_384374 ) ) ( not ( = ?auto_384373 ?auto_384374 ) ) ( ON ?auto_384372 ?auto_384373 ) ( CLEAR ?auto_384370 ) ( ON ?auto_384371 ?auto_384372 ) ( CLEAR ?auto_384371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_384361 ?auto_384362 ?auto_384363 ?auto_384364 ?auto_384365 ?auto_384366 ?auto_384367 ?auto_384368 ?auto_384369 ?auto_384370 ?auto_384371 )
      ( MAKE-13PILE ?auto_384361 ?auto_384362 ?auto_384363 ?auto_384364 ?auto_384365 ?auto_384366 ?auto_384367 ?auto_384368 ?auto_384369 ?auto_384370 ?auto_384371 ?auto_384372 ?auto_384373 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384388 - BLOCK
      ?auto_384389 - BLOCK
      ?auto_384390 - BLOCK
      ?auto_384391 - BLOCK
      ?auto_384392 - BLOCK
      ?auto_384393 - BLOCK
      ?auto_384394 - BLOCK
      ?auto_384395 - BLOCK
      ?auto_384396 - BLOCK
      ?auto_384397 - BLOCK
      ?auto_384398 - BLOCK
      ?auto_384399 - BLOCK
      ?auto_384400 - BLOCK
    )
    :vars
    (
      ?auto_384401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384400 ?auto_384401 ) ( ON-TABLE ?auto_384388 ) ( ON ?auto_384389 ?auto_384388 ) ( ON ?auto_384390 ?auto_384389 ) ( ON ?auto_384391 ?auto_384390 ) ( ON ?auto_384392 ?auto_384391 ) ( ON ?auto_384393 ?auto_384392 ) ( ON ?auto_384394 ?auto_384393 ) ( ON ?auto_384395 ?auto_384394 ) ( ON ?auto_384396 ?auto_384395 ) ( ON ?auto_384397 ?auto_384396 ) ( not ( = ?auto_384388 ?auto_384389 ) ) ( not ( = ?auto_384388 ?auto_384390 ) ) ( not ( = ?auto_384388 ?auto_384391 ) ) ( not ( = ?auto_384388 ?auto_384392 ) ) ( not ( = ?auto_384388 ?auto_384393 ) ) ( not ( = ?auto_384388 ?auto_384394 ) ) ( not ( = ?auto_384388 ?auto_384395 ) ) ( not ( = ?auto_384388 ?auto_384396 ) ) ( not ( = ?auto_384388 ?auto_384397 ) ) ( not ( = ?auto_384388 ?auto_384398 ) ) ( not ( = ?auto_384388 ?auto_384399 ) ) ( not ( = ?auto_384388 ?auto_384400 ) ) ( not ( = ?auto_384388 ?auto_384401 ) ) ( not ( = ?auto_384389 ?auto_384390 ) ) ( not ( = ?auto_384389 ?auto_384391 ) ) ( not ( = ?auto_384389 ?auto_384392 ) ) ( not ( = ?auto_384389 ?auto_384393 ) ) ( not ( = ?auto_384389 ?auto_384394 ) ) ( not ( = ?auto_384389 ?auto_384395 ) ) ( not ( = ?auto_384389 ?auto_384396 ) ) ( not ( = ?auto_384389 ?auto_384397 ) ) ( not ( = ?auto_384389 ?auto_384398 ) ) ( not ( = ?auto_384389 ?auto_384399 ) ) ( not ( = ?auto_384389 ?auto_384400 ) ) ( not ( = ?auto_384389 ?auto_384401 ) ) ( not ( = ?auto_384390 ?auto_384391 ) ) ( not ( = ?auto_384390 ?auto_384392 ) ) ( not ( = ?auto_384390 ?auto_384393 ) ) ( not ( = ?auto_384390 ?auto_384394 ) ) ( not ( = ?auto_384390 ?auto_384395 ) ) ( not ( = ?auto_384390 ?auto_384396 ) ) ( not ( = ?auto_384390 ?auto_384397 ) ) ( not ( = ?auto_384390 ?auto_384398 ) ) ( not ( = ?auto_384390 ?auto_384399 ) ) ( not ( = ?auto_384390 ?auto_384400 ) ) ( not ( = ?auto_384390 ?auto_384401 ) ) ( not ( = ?auto_384391 ?auto_384392 ) ) ( not ( = ?auto_384391 ?auto_384393 ) ) ( not ( = ?auto_384391 ?auto_384394 ) ) ( not ( = ?auto_384391 ?auto_384395 ) ) ( not ( = ?auto_384391 ?auto_384396 ) ) ( not ( = ?auto_384391 ?auto_384397 ) ) ( not ( = ?auto_384391 ?auto_384398 ) ) ( not ( = ?auto_384391 ?auto_384399 ) ) ( not ( = ?auto_384391 ?auto_384400 ) ) ( not ( = ?auto_384391 ?auto_384401 ) ) ( not ( = ?auto_384392 ?auto_384393 ) ) ( not ( = ?auto_384392 ?auto_384394 ) ) ( not ( = ?auto_384392 ?auto_384395 ) ) ( not ( = ?auto_384392 ?auto_384396 ) ) ( not ( = ?auto_384392 ?auto_384397 ) ) ( not ( = ?auto_384392 ?auto_384398 ) ) ( not ( = ?auto_384392 ?auto_384399 ) ) ( not ( = ?auto_384392 ?auto_384400 ) ) ( not ( = ?auto_384392 ?auto_384401 ) ) ( not ( = ?auto_384393 ?auto_384394 ) ) ( not ( = ?auto_384393 ?auto_384395 ) ) ( not ( = ?auto_384393 ?auto_384396 ) ) ( not ( = ?auto_384393 ?auto_384397 ) ) ( not ( = ?auto_384393 ?auto_384398 ) ) ( not ( = ?auto_384393 ?auto_384399 ) ) ( not ( = ?auto_384393 ?auto_384400 ) ) ( not ( = ?auto_384393 ?auto_384401 ) ) ( not ( = ?auto_384394 ?auto_384395 ) ) ( not ( = ?auto_384394 ?auto_384396 ) ) ( not ( = ?auto_384394 ?auto_384397 ) ) ( not ( = ?auto_384394 ?auto_384398 ) ) ( not ( = ?auto_384394 ?auto_384399 ) ) ( not ( = ?auto_384394 ?auto_384400 ) ) ( not ( = ?auto_384394 ?auto_384401 ) ) ( not ( = ?auto_384395 ?auto_384396 ) ) ( not ( = ?auto_384395 ?auto_384397 ) ) ( not ( = ?auto_384395 ?auto_384398 ) ) ( not ( = ?auto_384395 ?auto_384399 ) ) ( not ( = ?auto_384395 ?auto_384400 ) ) ( not ( = ?auto_384395 ?auto_384401 ) ) ( not ( = ?auto_384396 ?auto_384397 ) ) ( not ( = ?auto_384396 ?auto_384398 ) ) ( not ( = ?auto_384396 ?auto_384399 ) ) ( not ( = ?auto_384396 ?auto_384400 ) ) ( not ( = ?auto_384396 ?auto_384401 ) ) ( not ( = ?auto_384397 ?auto_384398 ) ) ( not ( = ?auto_384397 ?auto_384399 ) ) ( not ( = ?auto_384397 ?auto_384400 ) ) ( not ( = ?auto_384397 ?auto_384401 ) ) ( not ( = ?auto_384398 ?auto_384399 ) ) ( not ( = ?auto_384398 ?auto_384400 ) ) ( not ( = ?auto_384398 ?auto_384401 ) ) ( not ( = ?auto_384399 ?auto_384400 ) ) ( not ( = ?auto_384399 ?auto_384401 ) ) ( not ( = ?auto_384400 ?auto_384401 ) ) ( ON ?auto_384399 ?auto_384400 ) ( CLEAR ?auto_384397 ) ( ON ?auto_384398 ?auto_384399 ) ( CLEAR ?auto_384398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_384388 ?auto_384389 ?auto_384390 ?auto_384391 ?auto_384392 ?auto_384393 ?auto_384394 ?auto_384395 ?auto_384396 ?auto_384397 ?auto_384398 )
      ( MAKE-13PILE ?auto_384388 ?auto_384389 ?auto_384390 ?auto_384391 ?auto_384392 ?auto_384393 ?auto_384394 ?auto_384395 ?auto_384396 ?auto_384397 ?auto_384398 ?auto_384399 ?auto_384400 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384415 - BLOCK
      ?auto_384416 - BLOCK
      ?auto_384417 - BLOCK
      ?auto_384418 - BLOCK
      ?auto_384419 - BLOCK
      ?auto_384420 - BLOCK
      ?auto_384421 - BLOCK
      ?auto_384422 - BLOCK
      ?auto_384423 - BLOCK
      ?auto_384424 - BLOCK
      ?auto_384425 - BLOCK
      ?auto_384426 - BLOCK
      ?auto_384427 - BLOCK
    )
    :vars
    (
      ?auto_384428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384427 ?auto_384428 ) ( ON-TABLE ?auto_384415 ) ( ON ?auto_384416 ?auto_384415 ) ( ON ?auto_384417 ?auto_384416 ) ( ON ?auto_384418 ?auto_384417 ) ( ON ?auto_384419 ?auto_384418 ) ( ON ?auto_384420 ?auto_384419 ) ( ON ?auto_384421 ?auto_384420 ) ( ON ?auto_384422 ?auto_384421 ) ( ON ?auto_384423 ?auto_384422 ) ( not ( = ?auto_384415 ?auto_384416 ) ) ( not ( = ?auto_384415 ?auto_384417 ) ) ( not ( = ?auto_384415 ?auto_384418 ) ) ( not ( = ?auto_384415 ?auto_384419 ) ) ( not ( = ?auto_384415 ?auto_384420 ) ) ( not ( = ?auto_384415 ?auto_384421 ) ) ( not ( = ?auto_384415 ?auto_384422 ) ) ( not ( = ?auto_384415 ?auto_384423 ) ) ( not ( = ?auto_384415 ?auto_384424 ) ) ( not ( = ?auto_384415 ?auto_384425 ) ) ( not ( = ?auto_384415 ?auto_384426 ) ) ( not ( = ?auto_384415 ?auto_384427 ) ) ( not ( = ?auto_384415 ?auto_384428 ) ) ( not ( = ?auto_384416 ?auto_384417 ) ) ( not ( = ?auto_384416 ?auto_384418 ) ) ( not ( = ?auto_384416 ?auto_384419 ) ) ( not ( = ?auto_384416 ?auto_384420 ) ) ( not ( = ?auto_384416 ?auto_384421 ) ) ( not ( = ?auto_384416 ?auto_384422 ) ) ( not ( = ?auto_384416 ?auto_384423 ) ) ( not ( = ?auto_384416 ?auto_384424 ) ) ( not ( = ?auto_384416 ?auto_384425 ) ) ( not ( = ?auto_384416 ?auto_384426 ) ) ( not ( = ?auto_384416 ?auto_384427 ) ) ( not ( = ?auto_384416 ?auto_384428 ) ) ( not ( = ?auto_384417 ?auto_384418 ) ) ( not ( = ?auto_384417 ?auto_384419 ) ) ( not ( = ?auto_384417 ?auto_384420 ) ) ( not ( = ?auto_384417 ?auto_384421 ) ) ( not ( = ?auto_384417 ?auto_384422 ) ) ( not ( = ?auto_384417 ?auto_384423 ) ) ( not ( = ?auto_384417 ?auto_384424 ) ) ( not ( = ?auto_384417 ?auto_384425 ) ) ( not ( = ?auto_384417 ?auto_384426 ) ) ( not ( = ?auto_384417 ?auto_384427 ) ) ( not ( = ?auto_384417 ?auto_384428 ) ) ( not ( = ?auto_384418 ?auto_384419 ) ) ( not ( = ?auto_384418 ?auto_384420 ) ) ( not ( = ?auto_384418 ?auto_384421 ) ) ( not ( = ?auto_384418 ?auto_384422 ) ) ( not ( = ?auto_384418 ?auto_384423 ) ) ( not ( = ?auto_384418 ?auto_384424 ) ) ( not ( = ?auto_384418 ?auto_384425 ) ) ( not ( = ?auto_384418 ?auto_384426 ) ) ( not ( = ?auto_384418 ?auto_384427 ) ) ( not ( = ?auto_384418 ?auto_384428 ) ) ( not ( = ?auto_384419 ?auto_384420 ) ) ( not ( = ?auto_384419 ?auto_384421 ) ) ( not ( = ?auto_384419 ?auto_384422 ) ) ( not ( = ?auto_384419 ?auto_384423 ) ) ( not ( = ?auto_384419 ?auto_384424 ) ) ( not ( = ?auto_384419 ?auto_384425 ) ) ( not ( = ?auto_384419 ?auto_384426 ) ) ( not ( = ?auto_384419 ?auto_384427 ) ) ( not ( = ?auto_384419 ?auto_384428 ) ) ( not ( = ?auto_384420 ?auto_384421 ) ) ( not ( = ?auto_384420 ?auto_384422 ) ) ( not ( = ?auto_384420 ?auto_384423 ) ) ( not ( = ?auto_384420 ?auto_384424 ) ) ( not ( = ?auto_384420 ?auto_384425 ) ) ( not ( = ?auto_384420 ?auto_384426 ) ) ( not ( = ?auto_384420 ?auto_384427 ) ) ( not ( = ?auto_384420 ?auto_384428 ) ) ( not ( = ?auto_384421 ?auto_384422 ) ) ( not ( = ?auto_384421 ?auto_384423 ) ) ( not ( = ?auto_384421 ?auto_384424 ) ) ( not ( = ?auto_384421 ?auto_384425 ) ) ( not ( = ?auto_384421 ?auto_384426 ) ) ( not ( = ?auto_384421 ?auto_384427 ) ) ( not ( = ?auto_384421 ?auto_384428 ) ) ( not ( = ?auto_384422 ?auto_384423 ) ) ( not ( = ?auto_384422 ?auto_384424 ) ) ( not ( = ?auto_384422 ?auto_384425 ) ) ( not ( = ?auto_384422 ?auto_384426 ) ) ( not ( = ?auto_384422 ?auto_384427 ) ) ( not ( = ?auto_384422 ?auto_384428 ) ) ( not ( = ?auto_384423 ?auto_384424 ) ) ( not ( = ?auto_384423 ?auto_384425 ) ) ( not ( = ?auto_384423 ?auto_384426 ) ) ( not ( = ?auto_384423 ?auto_384427 ) ) ( not ( = ?auto_384423 ?auto_384428 ) ) ( not ( = ?auto_384424 ?auto_384425 ) ) ( not ( = ?auto_384424 ?auto_384426 ) ) ( not ( = ?auto_384424 ?auto_384427 ) ) ( not ( = ?auto_384424 ?auto_384428 ) ) ( not ( = ?auto_384425 ?auto_384426 ) ) ( not ( = ?auto_384425 ?auto_384427 ) ) ( not ( = ?auto_384425 ?auto_384428 ) ) ( not ( = ?auto_384426 ?auto_384427 ) ) ( not ( = ?auto_384426 ?auto_384428 ) ) ( not ( = ?auto_384427 ?auto_384428 ) ) ( ON ?auto_384426 ?auto_384427 ) ( ON ?auto_384425 ?auto_384426 ) ( CLEAR ?auto_384423 ) ( ON ?auto_384424 ?auto_384425 ) ( CLEAR ?auto_384424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_384415 ?auto_384416 ?auto_384417 ?auto_384418 ?auto_384419 ?auto_384420 ?auto_384421 ?auto_384422 ?auto_384423 ?auto_384424 )
      ( MAKE-13PILE ?auto_384415 ?auto_384416 ?auto_384417 ?auto_384418 ?auto_384419 ?auto_384420 ?auto_384421 ?auto_384422 ?auto_384423 ?auto_384424 ?auto_384425 ?auto_384426 ?auto_384427 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384442 - BLOCK
      ?auto_384443 - BLOCK
      ?auto_384444 - BLOCK
      ?auto_384445 - BLOCK
      ?auto_384446 - BLOCK
      ?auto_384447 - BLOCK
      ?auto_384448 - BLOCK
      ?auto_384449 - BLOCK
      ?auto_384450 - BLOCK
      ?auto_384451 - BLOCK
      ?auto_384452 - BLOCK
      ?auto_384453 - BLOCK
      ?auto_384454 - BLOCK
    )
    :vars
    (
      ?auto_384455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384454 ?auto_384455 ) ( ON-TABLE ?auto_384442 ) ( ON ?auto_384443 ?auto_384442 ) ( ON ?auto_384444 ?auto_384443 ) ( ON ?auto_384445 ?auto_384444 ) ( ON ?auto_384446 ?auto_384445 ) ( ON ?auto_384447 ?auto_384446 ) ( ON ?auto_384448 ?auto_384447 ) ( ON ?auto_384449 ?auto_384448 ) ( ON ?auto_384450 ?auto_384449 ) ( not ( = ?auto_384442 ?auto_384443 ) ) ( not ( = ?auto_384442 ?auto_384444 ) ) ( not ( = ?auto_384442 ?auto_384445 ) ) ( not ( = ?auto_384442 ?auto_384446 ) ) ( not ( = ?auto_384442 ?auto_384447 ) ) ( not ( = ?auto_384442 ?auto_384448 ) ) ( not ( = ?auto_384442 ?auto_384449 ) ) ( not ( = ?auto_384442 ?auto_384450 ) ) ( not ( = ?auto_384442 ?auto_384451 ) ) ( not ( = ?auto_384442 ?auto_384452 ) ) ( not ( = ?auto_384442 ?auto_384453 ) ) ( not ( = ?auto_384442 ?auto_384454 ) ) ( not ( = ?auto_384442 ?auto_384455 ) ) ( not ( = ?auto_384443 ?auto_384444 ) ) ( not ( = ?auto_384443 ?auto_384445 ) ) ( not ( = ?auto_384443 ?auto_384446 ) ) ( not ( = ?auto_384443 ?auto_384447 ) ) ( not ( = ?auto_384443 ?auto_384448 ) ) ( not ( = ?auto_384443 ?auto_384449 ) ) ( not ( = ?auto_384443 ?auto_384450 ) ) ( not ( = ?auto_384443 ?auto_384451 ) ) ( not ( = ?auto_384443 ?auto_384452 ) ) ( not ( = ?auto_384443 ?auto_384453 ) ) ( not ( = ?auto_384443 ?auto_384454 ) ) ( not ( = ?auto_384443 ?auto_384455 ) ) ( not ( = ?auto_384444 ?auto_384445 ) ) ( not ( = ?auto_384444 ?auto_384446 ) ) ( not ( = ?auto_384444 ?auto_384447 ) ) ( not ( = ?auto_384444 ?auto_384448 ) ) ( not ( = ?auto_384444 ?auto_384449 ) ) ( not ( = ?auto_384444 ?auto_384450 ) ) ( not ( = ?auto_384444 ?auto_384451 ) ) ( not ( = ?auto_384444 ?auto_384452 ) ) ( not ( = ?auto_384444 ?auto_384453 ) ) ( not ( = ?auto_384444 ?auto_384454 ) ) ( not ( = ?auto_384444 ?auto_384455 ) ) ( not ( = ?auto_384445 ?auto_384446 ) ) ( not ( = ?auto_384445 ?auto_384447 ) ) ( not ( = ?auto_384445 ?auto_384448 ) ) ( not ( = ?auto_384445 ?auto_384449 ) ) ( not ( = ?auto_384445 ?auto_384450 ) ) ( not ( = ?auto_384445 ?auto_384451 ) ) ( not ( = ?auto_384445 ?auto_384452 ) ) ( not ( = ?auto_384445 ?auto_384453 ) ) ( not ( = ?auto_384445 ?auto_384454 ) ) ( not ( = ?auto_384445 ?auto_384455 ) ) ( not ( = ?auto_384446 ?auto_384447 ) ) ( not ( = ?auto_384446 ?auto_384448 ) ) ( not ( = ?auto_384446 ?auto_384449 ) ) ( not ( = ?auto_384446 ?auto_384450 ) ) ( not ( = ?auto_384446 ?auto_384451 ) ) ( not ( = ?auto_384446 ?auto_384452 ) ) ( not ( = ?auto_384446 ?auto_384453 ) ) ( not ( = ?auto_384446 ?auto_384454 ) ) ( not ( = ?auto_384446 ?auto_384455 ) ) ( not ( = ?auto_384447 ?auto_384448 ) ) ( not ( = ?auto_384447 ?auto_384449 ) ) ( not ( = ?auto_384447 ?auto_384450 ) ) ( not ( = ?auto_384447 ?auto_384451 ) ) ( not ( = ?auto_384447 ?auto_384452 ) ) ( not ( = ?auto_384447 ?auto_384453 ) ) ( not ( = ?auto_384447 ?auto_384454 ) ) ( not ( = ?auto_384447 ?auto_384455 ) ) ( not ( = ?auto_384448 ?auto_384449 ) ) ( not ( = ?auto_384448 ?auto_384450 ) ) ( not ( = ?auto_384448 ?auto_384451 ) ) ( not ( = ?auto_384448 ?auto_384452 ) ) ( not ( = ?auto_384448 ?auto_384453 ) ) ( not ( = ?auto_384448 ?auto_384454 ) ) ( not ( = ?auto_384448 ?auto_384455 ) ) ( not ( = ?auto_384449 ?auto_384450 ) ) ( not ( = ?auto_384449 ?auto_384451 ) ) ( not ( = ?auto_384449 ?auto_384452 ) ) ( not ( = ?auto_384449 ?auto_384453 ) ) ( not ( = ?auto_384449 ?auto_384454 ) ) ( not ( = ?auto_384449 ?auto_384455 ) ) ( not ( = ?auto_384450 ?auto_384451 ) ) ( not ( = ?auto_384450 ?auto_384452 ) ) ( not ( = ?auto_384450 ?auto_384453 ) ) ( not ( = ?auto_384450 ?auto_384454 ) ) ( not ( = ?auto_384450 ?auto_384455 ) ) ( not ( = ?auto_384451 ?auto_384452 ) ) ( not ( = ?auto_384451 ?auto_384453 ) ) ( not ( = ?auto_384451 ?auto_384454 ) ) ( not ( = ?auto_384451 ?auto_384455 ) ) ( not ( = ?auto_384452 ?auto_384453 ) ) ( not ( = ?auto_384452 ?auto_384454 ) ) ( not ( = ?auto_384452 ?auto_384455 ) ) ( not ( = ?auto_384453 ?auto_384454 ) ) ( not ( = ?auto_384453 ?auto_384455 ) ) ( not ( = ?auto_384454 ?auto_384455 ) ) ( ON ?auto_384453 ?auto_384454 ) ( ON ?auto_384452 ?auto_384453 ) ( CLEAR ?auto_384450 ) ( ON ?auto_384451 ?auto_384452 ) ( CLEAR ?auto_384451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_384442 ?auto_384443 ?auto_384444 ?auto_384445 ?auto_384446 ?auto_384447 ?auto_384448 ?auto_384449 ?auto_384450 ?auto_384451 )
      ( MAKE-13PILE ?auto_384442 ?auto_384443 ?auto_384444 ?auto_384445 ?auto_384446 ?auto_384447 ?auto_384448 ?auto_384449 ?auto_384450 ?auto_384451 ?auto_384452 ?auto_384453 ?auto_384454 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384469 - BLOCK
      ?auto_384470 - BLOCK
      ?auto_384471 - BLOCK
      ?auto_384472 - BLOCK
      ?auto_384473 - BLOCK
      ?auto_384474 - BLOCK
      ?auto_384475 - BLOCK
      ?auto_384476 - BLOCK
      ?auto_384477 - BLOCK
      ?auto_384478 - BLOCK
      ?auto_384479 - BLOCK
      ?auto_384480 - BLOCK
      ?auto_384481 - BLOCK
    )
    :vars
    (
      ?auto_384482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384481 ?auto_384482 ) ( ON-TABLE ?auto_384469 ) ( ON ?auto_384470 ?auto_384469 ) ( ON ?auto_384471 ?auto_384470 ) ( ON ?auto_384472 ?auto_384471 ) ( ON ?auto_384473 ?auto_384472 ) ( ON ?auto_384474 ?auto_384473 ) ( ON ?auto_384475 ?auto_384474 ) ( ON ?auto_384476 ?auto_384475 ) ( not ( = ?auto_384469 ?auto_384470 ) ) ( not ( = ?auto_384469 ?auto_384471 ) ) ( not ( = ?auto_384469 ?auto_384472 ) ) ( not ( = ?auto_384469 ?auto_384473 ) ) ( not ( = ?auto_384469 ?auto_384474 ) ) ( not ( = ?auto_384469 ?auto_384475 ) ) ( not ( = ?auto_384469 ?auto_384476 ) ) ( not ( = ?auto_384469 ?auto_384477 ) ) ( not ( = ?auto_384469 ?auto_384478 ) ) ( not ( = ?auto_384469 ?auto_384479 ) ) ( not ( = ?auto_384469 ?auto_384480 ) ) ( not ( = ?auto_384469 ?auto_384481 ) ) ( not ( = ?auto_384469 ?auto_384482 ) ) ( not ( = ?auto_384470 ?auto_384471 ) ) ( not ( = ?auto_384470 ?auto_384472 ) ) ( not ( = ?auto_384470 ?auto_384473 ) ) ( not ( = ?auto_384470 ?auto_384474 ) ) ( not ( = ?auto_384470 ?auto_384475 ) ) ( not ( = ?auto_384470 ?auto_384476 ) ) ( not ( = ?auto_384470 ?auto_384477 ) ) ( not ( = ?auto_384470 ?auto_384478 ) ) ( not ( = ?auto_384470 ?auto_384479 ) ) ( not ( = ?auto_384470 ?auto_384480 ) ) ( not ( = ?auto_384470 ?auto_384481 ) ) ( not ( = ?auto_384470 ?auto_384482 ) ) ( not ( = ?auto_384471 ?auto_384472 ) ) ( not ( = ?auto_384471 ?auto_384473 ) ) ( not ( = ?auto_384471 ?auto_384474 ) ) ( not ( = ?auto_384471 ?auto_384475 ) ) ( not ( = ?auto_384471 ?auto_384476 ) ) ( not ( = ?auto_384471 ?auto_384477 ) ) ( not ( = ?auto_384471 ?auto_384478 ) ) ( not ( = ?auto_384471 ?auto_384479 ) ) ( not ( = ?auto_384471 ?auto_384480 ) ) ( not ( = ?auto_384471 ?auto_384481 ) ) ( not ( = ?auto_384471 ?auto_384482 ) ) ( not ( = ?auto_384472 ?auto_384473 ) ) ( not ( = ?auto_384472 ?auto_384474 ) ) ( not ( = ?auto_384472 ?auto_384475 ) ) ( not ( = ?auto_384472 ?auto_384476 ) ) ( not ( = ?auto_384472 ?auto_384477 ) ) ( not ( = ?auto_384472 ?auto_384478 ) ) ( not ( = ?auto_384472 ?auto_384479 ) ) ( not ( = ?auto_384472 ?auto_384480 ) ) ( not ( = ?auto_384472 ?auto_384481 ) ) ( not ( = ?auto_384472 ?auto_384482 ) ) ( not ( = ?auto_384473 ?auto_384474 ) ) ( not ( = ?auto_384473 ?auto_384475 ) ) ( not ( = ?auto_384473 ?auto_384476 ) ) ( not ( = ?auto_384473 ?auto_384477 ) ) ( not ( = ?auto_384473 ?auto_384478 ) ) ( not ( = ?auto_384473 ?auto_384479 ) ) ( not ( = ?auto_384473 ?auto_384480 ) ) ( not ( = ?auto_384473 ?auto_384481 ) ) ( not ( = ?auto_384473 ?auto_384482 ) ) ( not ( = ?auto_384474 ?auto_384475 ) ) ( not ( = ?auto_384474 ?auto_384476 ) ) ( not ( = ?auto_384474 ?auto_384477 ) ) ( not ( = ?auto_384474 ?auto_384478 ) ) ( not ( = ?auto_384474 ?auto_384479 ) ) ( not ( = ?auto_384474 ?auto_384480 ) ) ( not ( = ?auto_384474 ?auto_384481 ) ) ( not ( = ?auto_384474 ?auto_384482 ) ) ( not ( = ?auto_384475 ?auto_384476 ) ) ( not ( = ?auto_384475 ?auto_384477 ) ) ( not ( = ?auto_384475 ?auto_384478 ) ) ( not ( = ?auto_384475 ?auto_384479 ) ) ( not ( = ?auto_384475 ?auto_384480 ) ) ( not ( = ?auto_384475 ?auto_384481 ) ) ( not ( = ?auto_384475 ?auto_384482 ) ) ( not ( = ?auto_384476 ?auto_384477 ) ) ( not ( = ?auto_384476 ?auto_384478 ) ) ( not ( = ?auto_384476 ?auto_384479 ) ) ( not ( = ?auto_384476 ?auto_384480 ) ) ( not ( = ?auto_384476 ?auto_384481 ) ) ( not ( = ?auto_384476 ?auto_384482 ) ) ( not ( = ?auto_384477 ?auto_384478 ) ) ( not ( = ?auto_384477 ?auto_384479 ) ) ( not ( = ?auto_384477 ?auto_384480 ) ) ( not ( = ?auto_384477 ?auto_384481 ) ) ( not ( = ?auto_384477 ?auto_384482 ) ) ( not ( = ?auto_384478 ?auto_384479 ) ) ( not ( = ?auto_384478 ?auto_384480 ) ) ( not ( = ?auto_384478 ?auto_384481 ) ) ( not ( = ?auto_384478 ?auto_384482 ) ) ( not ( = ?auto_384479 ?auto_384480 ) ) ( not ( = ?auto_384479 ?auto_384481 ) ) ( not ( = ?auto_384479 ?auto_384482 ) ) ( not ( = ?auto_384480 ?auto_384481 ) ) ( not ( = ?auto_384480 ?auto_384482 ) ) ( not ( = ?auto_384481 ?auto_384482 ) ) ( ON ?auto_384480 ?auto_384481 ) ( ON ?auto_384479 ?auto_384480 ) ( ON ?auto_384478 ?auto_384479 ) ( CLEAR ?auto_384476 ) ( ON ?auto_384477 ?auto_384478 ) ( CLEAR ?auto_384477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_384469 ?auto_384470 ?auto_384471 ?auto_384472 ?auto_384473 ?auto_384474 ?auto_384475 ?auto_384476 ?auto_384477 )
      ( MAKE-13PILE ?auto_384469 ?auto_384470 ?auto_384471 ?auto_384472 ?auto_384473 ?auto_384474 ?auto_384475 ?auto_384476 ?auto_384477 ?auto_384478 ?auto_384479 ?auto_384480 ?auto_384481 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384496 - BLOCK
      ?auto_384497 - BLOCK
      ?auto_384498 - BLOCK
      ?auto_384499 - BLOCK
      ?auto_384500 - BLOCK
      ?auto_384501 - BLOCK
      ?auto_384502 - BLOCK
      ?auto_384503 - BLOCK
      ?auto_384504 - BLOCK
      ?auto_384505 - BLOCK
      ?auto_384506 - BLOCK
      ?auto_384507 - BLOCK
      ?auto_384508 - BLOCK
    )
    :vars
    (
      ?auto_384509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384508 ?auto_384509 ) ( ON-TABLE ?auto_384496 ) ( ON ?auto_384497 ?auto_384496 ) ( ON ?auto_384498 ?auto_384497 ) ( ON ?auto_384499 ?auto_384498 ) ( ON ?auto_384500 ?auto_384499 ) ( ON ?auto_384501 ?auto_384500 ) ( ON ?auto_384502 ?auto_384501 ) ( ON ?auto_384503 ?auto_384502 ) ( not ( = ?auto_384496 ?auto_384497 ) ) ( not ( = ?auto_384496 ?auto_384498 ) ) ( not ( = ?auto_384496 ?auto_384499 ) ) ( not ( = ?auto_384496 ?auto_384500 ) ) ( not ( = ?auto_384496 ?auto_384501 ) ) ( not ( = ?auto_384496 ?auto_384502 ) ) ( not ( = ?auto_384496 ?auto_384503 ) ) ( not ( = ?auto_384496 ?auto_384504 ) ) ( not ( = ?auto_384496 ?auto_384505 ) ) ( not ( = ?auto_384496 ?auto_384506 ) ) ( not ( = ?auto_384496 ?auto_384507 ) ) ( not ( = ?auto_384496 ?auto_384508 ) ) ( not ( = ?auto_384496 ?auto_384509 ) ) ( not ( = ?auto_384497 ?auto_384498 ) ) ( not ( = ?auto_384497 ?auto_384499 ) ) ( not ( = ?auto_384497 ?auto_384500 ) ) ( not ( = ?auto_384497 ?auto_384501 ) ) ( not ( = ?auto_384497 ?auto_384502 ) ) ( not ( = ?auto_384497 ?auto_384503 ) ) ( not ( = ?auto_384497 ?auto_384504 ) ) ( not ( = ?auto_384497 ?auto_384505 ) ) ( not ( = ?auto_384497 ?auto_384506 ) ) ( not ( = ?auto_384497 ?auto_384507 ) ) ( not ( = ?auto_384497 ?auto_384508 ) ) ( not ( = ?auto_384497 ?auto_384509 ) ) ( not ( = ?auto_384498 ?auto_384499 ) ) ( not ( = ?auto_384498 ?auto_384500 ) ) ( not ( = ?auto_384498 ?auto_384501 ) ) ( not ( = ?auto_384498 ?auto_384502 ) ) ( not ( = ?auto_384498 ?auto_384503 ) ) ( not ( = ?auto_384498 ?auto_384504 ) ) ( not ( = ?auto_384498 ?auto_384505 ) ) ( not ( = ?auto_384498 ?auto_384506 ) ) ( not ( = ?auto_384498 ?auto_384507 ) ) ( not ( = ?auto_384498 ?auto_384508 ) ) ( not ( = ?auto_384498 ?auto_384509 ) ) ( not ( = ?auto_384499 ?auto_384500 ) ) ( not ( = ?auto_384499 ?auto_384501 ) ) ( not ( = ?auto_384499 ?auto_384502 ) ) ( not ( = ?auto_384499 ?auto_384503 ) ) ( not ( = ?auto_384499 ?auto_384504 ) ) ( not ( = ?auto_384499 ?auto_384505 ) ) ( not ( = ?auto_384499 ?auto_384506 ) ) ( not ( = ?auto_384499 ?auto_384507 ) ) ( not ( = ?auto_384499 ?auto_384508 ) ) ( not ( = ?auto_384499 ?auto_384509 ) ) ( not ( = ?auto_384500 ?auto_384501 ) ) ( not ( = ?auto_384500 ?auto_384502 ) ) ( not ( = ?auto_384500 ?auto_384503 ) ) ( not ( = ?auto_384500 ?auto_384504 ) ) ( not ( = ?auto_384500 ?auto_384505 ) ) ( not ( = ?auto_384500 ?auto_384506 ) ) ( not ( = ?auto_384500 ?auto_384507 ) ) ( not ( = ?auto_384500 ?auto_384508 ) ) ( not ( = ?auto_384500 ?auto_384509 ) ) ( not ( = ?auto_384501 ?auto_384502 ) ) ( not ( = ?auto_384501 ?auto_384503 ) ) ( not ( = ?auto_384501 ?auto_384504 ) ) ( not ( = ?auto_384501 ?auto_384505 ) ) ( not ( = ?auto_384501 ?auto_384506 ) ) ( not ( = ?auto_384501 ?auto_384507 ) ) ( not ( = ?auto_384501 ?auto_384508 ) ) ( not ( = ?auto_384501 ?auto_384509 ) ) ( not ( = ?auto_384502 ?auto_384503 ) ) ( not ( = ?auto_384502 ?auto_384504 ) ) ( not ( = ?auto_384502 ?auto_384505 ) ) ( not ( = ?auto_384502 ?auto_384506 ) ) ( not ( = ?auto_384502 ?auto_384507 ) ) ( not ( = ?auto_384502 ?auto_384508 ) ) ( not ( = ?auto_384502 ?auto_384509 ) ) ( not ( = ?auto_384503 ?auto_384504 ) ) ( not ( = ?auto_384503 ?auto_384505 ) ) ( not ( = ?auto_384503 ?auto_384506 ) ) ( not ( = ?auto_384503 ?auto_384507 ) ) ( not ( = ?auto_384503 ?auto_384508 ) ) ( not ( = ?auto_384503 ?auto_384509 ) ) ( not ( = ?auto_384504 ?auto_384505 ) ) ( not ( = ?auto_384504 ?auto_384506 ) ) ( not ( = ?auto_384504 ?auto_384507 ) ) ( not ( = ?auto_384504 ?auto_384508 ) ) ( not ( = ?auto_384504 ?auto_384509 ) ) ( not ( = ?auto_384505 ?auto_384506 ) ) ( not ( = ?auto_384505 ?auto_384507 ) ) ( not ( = ?auto_384505 ?auto_384508 ) ) ( not ( = ?auto_384505 ?auto_384509 ) ) ( not ( = ?auto_384506 ?auto_384507 ) ) ( not ( = ?auto_384506 ?auto_384508 ) ) ( not ( = ?auto_384506 ?auto_384509 ) ) ( not ( = ?auto_384507 ?auto_384508 ) ) ( not ( = ?auto_384507 ?auto_384509 ) ) ( not ( = ?auto_384508 ?auto_384509 ) ) ( ON ?auto_384507 ?auto_384508 ) ( ON ?auto_384506 ?auto_384507 ) ( ON ?auto_384505 ?auto_384506 ) ( CLEAR ?auto_384503 ) ( ON ?auto_384504 ?auto_384505 ) ( CLEAR ?auto_384504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_384496 ?auto_384497 ?auto_384498 ?auto_384499 ?auto_384500 ?auto_384501 ?auto_384502 ?auto_384503 ?auto_384504 )
      ( MAKE-13PILE ?auto_384496 ?auto_384497 ?auto_384498 ?auto_384499 ?auto_384500 ?auto_384501 ?auto_384502 ?auto_384503 ?auto_384504 ?auto_384505 ?auto_384506 ?auto_384507 ?auto_384508 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384523 - BLOCK
      ?auto_384524 - BLOCK
      ?auto_384525 - BLOCK
      ?auto_384526 - BLOCK
      ?auto_384527 - BLOCK
      ?auto_384528 - BLOCK
      ?auto_384529 - BLOCK
      ?auto_384530 - BLOCK
      ?auto_384531 - BLOCK
      ?auto_384532 - BLOCK
      ?auto_384533 - BLOCK
      ?auto_384534 - BLOCK
      ?auto_384535 - BLOCK
    )
    :vars
    (
      ?auto_384536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384535 ?auto_384536 ) ( ON-TABLE ?auto_384523 ) ( ON ?auto_384524 ?auto_384523 ) ( ON ?auto_384525 ?auto_384524 ) ( ON ?auto_384526 ?auto_384525 ) ( ON ?auto_384527 ?auto_384526 ) ( ON ?auto_384528 ?auto_384527 ) ( ON ?auto_384529 ?auto_384528 ) ( not ( = ?auto_384523 ?auto_384524 ) ) ( not ( = ?auto_384523 ?auto_384525 ) ) ( not ( = ?auto_384523 ?auto_384526 ) ) ( not ( = ?auto_384523 ?auto_384527 ) ) ( not ( = ?auto_384523 ?auto_384528 ) ) ( not ( = ?auto_384523 ?auto_384529 ) ) ( not ( = ?auto_384523 ?auto_384530 ) ) ( not ( = ?auto_384523 ?auto_384531 ) ) ( not ( = ?auto_384523 ?auto_384532 ) ) ( not ( = ?auto_384523 ?auto_384533 ) ) ( not ( = ?auto_384523 ?auto_384534 ) ) ( not ( = ?auto_384523 ?auto_384535 ) ) ( not ( = ?auto_384523 ?auto_384536 ) ) ( not ( = ?auto_384524 ?auto_384525 ) ) ( not ( = ?auto_384524 ?auto_384526 ) ) ( not ( = ?auto_384524 ?auto_384527 ) ) ( not ( = ?auto_384524 ?auto_384528 ) ) ( not ( = ?auto_384524 ?auto_384529 ) ) ( not ( = ?auto_384524 ?auto_384530 ) ) ( not ( = ?auto_384524 ?auto_384531 ) ) ( not ( = ?auto_384524 ?auto_384532 ) ) ( not ( = ?auto_384524 ?auto_384533 ) ) ( not ( = ?auto_384524 ?auto_384534 ) ) ( not ( = ?auto_384524 ?auto_384535 ) ) ( not ( = ?auto_384524 ?auto_384536 ) ) ( not ( = ?auto_384525 ?auto_384526 ) ) ( not ( = ?auto_384525 ?auto_384527 ) ) ( not ( = ?auto_384525 ?auto_384528 ) ) ( not ( = ?auto_384525 ?auto_384529 ) ) ( not ( = ?auto_384525 ?auto_384530 ) ) ( not ( = ?auto_384525 ?auto_384531 ) ) ( not ( = ?auto_384525 ?auto_384532 ) ) ( not ( = ?auto_384525 ?auto_384533 ) ) ( not ( = ?auto_384525 ?auto_384534 ) ) ( not ( = ?auto_384525 ?auto_384535 ) ) ( not ( = ?auto_384525 ?auto_384536 ) ) ( not ( = ?auto_384526 ?auto_384527 ) ) ( not ( = ?auto_384526 ?auto_384528 ) ) ( not ( = ?auto_384526 ?auto_384529 ) ) ( not ( = ?auto_384526 ?auto_384530 ) ) ( not ( = ?auto_384526 ?auto_384531 ) ) ( not ( = ?auto_384526 ?auto_384532 ) ) ( not ( = ?auto_384526 ?auto_384533 ) ) ( not ( = ?auto_384526 ?auto_384534 ) ) ( not ( = ?auto_384526 ?auto_384535 ) ) ( not ( = ?auto_384526 ?auto_384536 ) ) ( not ( = ?auto_384527 ?auto_384528 ) ) ( not ( = ?auto_384527 ?auto_384529 ) ) ( not ( = ?auto_384527 ?auto_384530 ) ) ( not ( = ?auto_384527 ?auto_384531 ) ) ( not ( = ?auto_384527 ?auto_384532 ) ) ( not ( = ?auto_384527 ?auto_384533 ) ) ( not ( = ?auto_384527 ?auto_384534 ) ) ( not ( = ?auto_384527 ?auto_384535 ) ) ( not ( = ?auto_384527 ?auto_384536 ) ) ( not ( = ?auto_384528 ?auto_384529 ) ) ( not ( = ?auto_384528 ?auto_384530 ) ) ( not ( = ?auto_384528 ?auto_384531 ) ) ( not ( = ?auto_384528 ?auto_384532 ) ) ( not ( = ?auto_384528 ?auto_384533 ) ) ( not ( = ?auto_384528 ?auto_384534 ) ) ( not ( = ?auto_384528 ?auto_384535 ) ) ( not ( = ?auto_384528 ?auto_384536 ) ) ( not ( = ?auto_384529 ?auto_384530 ) ) ( not ( = ?auto_384529 ?auto_384531 ) ) ( not ( = ?auto_384529 ?auto_384532 ) ) ( not ( = ?auto_384529 ?auto_384533 ) ) ( not ( = ?auto_384529 ?auto_384534 ) ) ( not ( = ?auto_384529 ?auto_384535 ) ) ( not ( = ?auto_384529 ?auto_384536 ) ) ( not ( = ?auto_384530 ?auto_384531 ) ) ( not ( = ?auto_384530 ?auto_384532 ) ) ( not ( = ?auto_384530 ?auto_384533 ) ) ( not ( = ?auto_384530 ?auto_384534 ) ) ( not ( = ?auto_384530 ?auto_384535 ) ) ( not ( = ?auto_384530 ?auto_384536 ) ) ( not ( = ?auto_384531 ?auto_384532 ) ) ( not ( = ?auto_384531 ?auto_384533 ) ) ( not ( = ?auto_384531 ?auto_384534 ) ) ( not ( = ?auto_384531 ?auto_384535 ) ) ( not ( = ?auto_384531 ?auto_384536 ) ) ( not ( = ?auto_384532 ?auto_384533 ) ) ( not ( = ?auto_384532 ?auto_384534 ) ) ( not ( = ?auto_384532 ?auto_384535 ) ) ( not ( = ?auto_384532 ?auto_384536 ) ) ( not ( = ?auto_384533 ?auto_384534 ) ) ( not ( = ?auto_384533 ?auto_384535 ) ) ( not ( = ?auto_384533 ?auto_384536 ) ) ( not ( = ?auto_384534 ?auto_384535 ) ) ( not ( = ?auto_384534 ?auto_384536 ) ) ( not ( = ?auto_384535 ?auto_384536 ) ) ( ON ?auto_384534 ?auto_384535 ) ( ON ?auto_384533 ?auto_384534 ) ( ON ?auto_384532 ?auto_384533 ) ( ON ?auto_384531 ?auto_384532 ) ( CLEAR ?auto_384529 ) ( ON ?auto_384530 ?auto_384531 ) ( CLEAR ?auto_384530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_384523 ?auto_384524 ?auto_384525 ?auto_384526 ?auto_384527 ?auto_384528 ?auto_384529 ?auto_384530 )
      ( MAKE-13PILE ?auto_384523 ?auto_384524 ?auto_384525 ?auto_384526 ?auto_384527 ?auto_384528 ?auto_384529 ?auto_384530 ?auto_384531 ?auto_384532 ?auto_384533 ?auto_384534 ?auto_384535 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384550 - BLOCK
      ?auto_384551 - BLOCK
      ?auto_384552 - BLOCK
      ?auto_384553 - BLOCK
      ?auto_384554 - BLOCK
      ?auto_384555 - BLOCK
      ?auto_384556 - BLOCK
      ?auto_384557 - BLOCK
      ?auto_384558 - BLOCK
      ?auto_384559 - BLOCK
      ?auto_384560 - BLOCK
      ?auto_384561 - BLOCK
      ?auto_384562 - BLOCK
    )
    :vars
    (
      ?auto_384563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384562 ?auto_384563 ) ( ON-TABLE ?auto_384550 ) ( ON ?auto_384551 ?auto_384550 ) ( ON ?auto_384552 ?auto_384551 ) ( ON ?auto_384553 ?auto_384552 ) ( ON ?auto_384554 ?auto_384553 ) ( ON ?auto_384555 ?auto_384554 ) ( ON ?auto_384556 ?auto_384555 ) ( not ( = ?auto_384550 ?auto_384551 ) ) ( not ( = ?auto_384550 ?auto_384552 ) ) ( not ( = ?auto_384550 ?auto_384553 ) ) ( not ( = ?auto_384550 ?auto_384554 ) ) ( not ( = ?auto_384550 ?auto_384555 ) ) ( not ( = ?auto_384550 ?auto_384556 ) ) ( not ( = ?auto_384550 ?auto_384557 ) ) ( not ( = ?auto_384550 ?auto_384558 ) ) ( not ( = ?auto_384550 ?auto_384559 ) ) ( not ( = ?auto_384550 ?auto_384560 ) ) ( not ( = ?auto_384550 ?auto_384561 ) ) ( not ( = ?auto_384550 ?auto_384562 ) ) ( not ( = ?auto_384550 ?auto_384563 ) ) ( not ( = ?auto_384551 ?auto_384552 ) ) ( not ( = ?auto_384551 ?auto_384553 ) ) ( not ( = ?auto_384551 ?auto_384554 ) ) ( not ( = ?auto_384551 ?auto_384555 ) ) ( not ( = ?auto_384551 ?auto_384556 ) ) ( not ( = ?auto_384551 ?auto_384557 ) ) ( not ( = ?auto_384551 ?auto_384558 ) ) ( not ( = ?auto_384551 ?auto_384559 ) ) ( not ( = ?auto_384551 ?auto_384560 ) ) ( not ( = ?auto_384551 ?auto_384561 ) ) ( not ( = ?auto_384551 ?auto_384562 ) ) ( not ( = ?auto_384551 ?auto_384563 ) ) ( not ( = ?auto_384552 ?auto_384553 ) ) ( not ( = ?auto_384552 ?auto_384554 ) ) ( not ( = ?auto_384552 ?auto_384555 ) ) ( not ( = ?auto_384552 ?auto_384556 ) ) ( not ( = ?auto_384552 ?auto_384557 ) ) ( not ( = ?auto_384552 ?auto_384558 ) ) ( not ( = ?auto_384552 ?auto_384559 ) ) ( not ( = ?auto_384552 ?auto_384560 ) ) ( not ( = ?auto_384552 ?auto_384561 ) ) ( not ( = ?auto_384552 ?auto_384562 ) ) ( not ( = ?auto_384552 ?auto_384563 ) ) ( not ( = ?auto_384553 ?auto_384554 ) ) ( not ( = ?auto_384553 ?auto_384555 ) ) ( not ( = ?auto_384553 ?auto_384556 ) ) ( not ( = ?auto_384553 ?auto_384557 ) ) ( not ( = ?auto_384553 ?auto_384558 ) ) ( not ( = ?auto_384553 ?auto_384559 ) ) ( not ( = ?auto_384553 ?auto_384560 ) ) ( not ( = ?auto_384553 ?auto_384561 ) ) ( not ( = ?auto_384553 ?auto_384562 ) ) ( not ( = ?auto_384553 ?auto_384563 ) ) ( not ( = ?auto_384554 ?auto_384555 ) ) ( not ( = ?auto_384554 ?auto_384556 ) ) ( not ( = ?auto_384554 ?auto_384557 ) ) ( not ( = ?auto_384554 ?auto_384558 ) ) ( not ( = ?auto_384554 ?auto_384559 ) ) ( not ( = ?auto_384554 ?auto_384560 ) ) ( not ( = ?auto_384554 ?auto_384561 ) ) ( not ( = ?auto_384554 ?auto_384562 ) ) ( not ( = ?auto_384554 ?auto_384563 ) ) ( not ( = ?auto_384555 ?auto_384556 ) ) ( not ( = ?auto_384555 ?auto_384557 ) ) ( not ( = ?auto_384555 ?auto_384558 ) ) ( not ( = ?auto_384555 ?auto_384559 ) ) ( not ( = ?auto_384555 ?auto_384560 ) ) ( not ( = ?auto_384555 ?auto_384561 ) ) ( not ( = ?auto_384555 ?auto_384562 ) ) ( not ( = ?auto_384555 ?auto_384563 ) ) ( not ( = ?auto_384556 ?auto_384557 ) ) ( not ( = ?auto_384556 ?auto_384558 ) ) ( not ( = ?auto_384556 ?auto_384559 ) ) ( not ( = ?auto_384556 ?auto_384560 ) ) ( not ( = ?auto_384556 ?auto_384561 ) ) ( not ( = ?auto_384556 ?auto_384562 ) ) ( not ( = ?auto_384556 ?auto_384563 ) ) ( not ( = ?auto_384557 ?auto_384558 ) ) ( not ( = ?auto_384557 ?auto_384559 ) ) ( not ( = ?auto_384557 ?auto_384560 ) ) ( not ( = ?auto_384557 ?auto_384561 ) ) ( not ( = ?auto_384557 ?auto_384562 ) ) ( not ( = ?auto_384557 ?auto_384563 ) ) ( not ( = ?auto_384558 ?auto_384559 ) ) ( not ( = ?auto_384558 ?auto_384560 ) ) ( not ( = ?auto_384558 ?auto_384561 ) ) ( not ( = ?auto_384558 ?auto_384562 ) ) ( not ( = ?auto_384558 ?auto_384563 ) ) ( not ( = ?auto_384559 ?auto_384560 ) ) ( not ( = ?auto_384559 ?auto_384561 ) ) ( not ( = ?auto_384559 ?auto_384562 ) ) ( not ( = ?auto_384559 ?auto_384563 ) ) ( not ( = ?auto_384560 ?auto_384561 ) ) ( not ( = ?auto_384560 ?auto_384562 ) ) ( not ( = ?auto_384560 ?auto_384563 ) ) ( not ( = ?auto_384561 ?auto_384562 ) ) ( not ( = ?auto_384561 ?auto_384563 ) ) ( not ( = ?auto_384562 ?auto_384563 ) ) ( ON ?auto_384561 ?auto_384562 ) ( ON ?auto_384560 ?auto_384561 ) ( ON ?auto_384559 ?auto_384560 ) ( ON ?auto_384558 ?auto_384559 ) ( CLEAR ?auto_384556 ) ( ON ?auto_384557 ?auto_384558 ) ( CLEAR ?auto_384557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_384550 ?auto_384551 ?auto_384552 ?auto_384553 ?auto_384554 ?auto_384555 ?auto_384556 ?auto_384557 )
      ( MAKE-13PILE ?auto_384550 ?auto_384551 ?auto_384552 ?auto_384553 ?auto_384554 ?auto_384555 ?auto_384556 ?auto_384557 ?auto_384558 ?auto_384559 ?auto_384560 ?auto_384561 ?auto_384562 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384577 - BLOCK
      ?auto_384578 - BLOCK
      ?auto_384579 - BLOCK
      ?auto_384580 - BLOCK
      ?auto_384581 - BLOCK
      ?auto_384582 - BLOCK
      ?auto_384583 - BLOCK
      ?auto_384584 - BLOCK
      ?auto_384585 - BLOCK
      ?auto_384586 - BLOCK
      ?auto_384587 - BLOCK
      ?auto_384588 - BLOCK
      ?auto_384589 - BLOCK
    )
    :vars
    (
      ?auto_384590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384589 ?auto_384590 ) ( ON-TABLE ?auto_384577 ) ( ON ?auto_384578 ?auto_384577 ) ( ON ?auto_384579 ?auto_384578 ) ( ON ?auto_384580 ?auto_384579 ) ( ON ?auto_384581 ?auto_384580 ) ( ON ?auto_384582 ?auto_384581 ) ( not ( = ?auto_384577 ?auto_384578 ) ) ( not ( = ?auto_384577 ?auto_384579 ) ) ( not ( = ?auto_384577 ?auto_384580 ) ) ( not ( = ?auto_384577 ?auto_384581 ) ) ( not ( = ?auto_384577 ?auto_384582 ) ) ( not ( = ?auto_384577 ?auto_384583 ) ) ( not ( = ?auto_384577 ?auto_384584 ) ) ( not ( = ?auto_384577 ?auto_384585 ) ) ( not ( = ?auto_384577 ?auto_384586 ) ) ( not ( = ?auto_384577 ?auto_384587 ) ) ( not ( = ?auto_384577 ?auto_384588 ) ) ( not ( = ?auto_384577 ?auto_384589 ) ) ( not ( = ?auto_384577 ?auto_384590 ) ) ( not ( = ?auto_384578 ?auto_384579 ) ) ( not ( = ?auto_384578 ?auto_384580 ) ) ( not ( = ?auto_384578 ?auto_384581 ) ) ( not ( = ?auto_384578 ?auto_384582 ) ) ( not ( = ?auto_384578 ?auto_384583 ) ) ( not ( = ?auto_384578 ?auto_384584 ) ) ( not ( = ?auto_384578 ?auto_384585 ) ) ( not ( = ?auto_384578 ?auto_384586 ) ) ( not ( = ?auto_384578 ?auto_384587 ) ) ( not ( = ?auto_384578 ?auto_384588 ) ) ( not ( = ?auto_384578 ?auto_384589 ) ) ( not ( = ?auto_384578 ?auto_384590 ) ) ( not ( = ?auto_384579 ?auto_384580 ) ) ( not ( = ?auto_384579 ?auto_384581 ) ) ( not ( = ?auto_384579 ?auto_384582 ) ) ( not ( = ?auto_384579 ?auto_384583 ) ) ( not ( = ?auto_384579 ?auto_384584 ) ) ( not ( = ?auto_384579 ?auto_384585 ) ) ( not ( = ?auto_384579 ?auto_384586 ) ) ( not ( = ?auto_384579 ?auto_384587 ) ) ( not ( = ?auto_384579 ?auto_384588 ) ) ( not ( = ?auto_384579 ?auto_384589 ) ) ( not ( = ?auto_384579 ?auto_384590 ) ) ( not ( = ?auto_384580 ?auto_384581 ) ) ( not ( = ?auto_384580 ?auto_384582 ) ) ( not ( = ?auto_384580 ?auto_384583 ) ) ( not ( = ?auto_384580 ?auto_384584 ) ) ( not ( = ?auto_384580 ?auto_384585 ) ) ( not ( = ?auto_384580 ?auto_384586 ) ) ( not ( = ?auto_384580 ?auto_384587 ) ) ( not ( = ?auto_384580 ?auto_384588 ) ) ( not ( = ?auto_384580 ?auto_384589 ) ) ( not ( = ?auto_384580 ?auto_384590 ) ) ( not ( = ?auto_384581 ?auto_384582 ) ) ( not ( = ?auto_384581 ?auto_384583 ) ) ( not ( = ?auto_384581 ?auto_384584 ) ) ( not ( = ?auto_384581 ?auto_384585 ) ) ( not ( = ?auto_384581 ?auto_384586 ) ) ( not ( = ?auto_384581 ?auto_384587 ) ) ( not ( = ?auto_384581 ?auto_384588 ) ) ( not ( = ?auto_384581 ?auto_384589 ) ) ( not ( = ?auto_384581 ?auto_384590 ) ) ( not ( = ?auto_384582 ?auto_384583 ) ) ( not ( = ?auto_384582 ?auto_384584 ) ) ( not ( = ?auto_384582 ?auto_384585 ) ) ( not ( = ?auto_384582 ?auto_384586 ) ) ( not ( = ?auto_384582 ?auto_384587 ) ) ( not ( = ?auto_384582 ?auto_384588 ) ) ( not ( = ?auto_384582 ?auto_384589 ) ) ( not ( = ?auto_384582 ?auto_384590 ) ) ( not ( = ?auto_384583 ?auto_384584 ) ) ( not ( = ?auto_384583 ?auto_384585 ) ) ( not ( = ?auto_384583 ?auto_384586 ) ) ( not ( = ?auto_384583 ?auto_384587 ) ) ( not ( = ?auto_384583 ?auto_384588 ) ) ( not ( = ?auto_384583 ?auto_384589 ) ) ( not ( = ?auto_384583 ?auto_384590 ) ) ( not ( = ?auto_384584 ?auto_384585 ) ) ( not ( = ?auto_384584 ?auto_384586 ) ) ( not ( = ?auto_384584 ?auto_384587 ) ) ( not ( = ?auto_384584 ?auto_384588 ) ) ( not ( = ?auto_384584 ?auto_384589 ) ) ( not ( = ?auto_384584 ?auto_384590 ) ) ( not ( = ?auto_384585 ?auto_384586 ) ) ( not ( = ?auto_384585 ?auto_384587 ) ) ( not ( = ?auto_384585 ?auto_384588 ) ) ( not ( = ?auto_384585 ?auto_384589 ) ) ( not ( = ?auto_384585 ?auto_384590 ) ) ( not ( = ?auto_384586 ?auto_384587 ) ) ( not ( = ?auto_384586 ?auto_384588 ) ) ( not ( = ?auto_384586 ?auto_384589 ) ) ( not ( = ?auto_384586 ?auto_384590 ) ) ( not ( = ?auto_384587 ?auto_384588 ) ) ( not ( = ?auto_384587 ?auto_384589 ) ) ( not ( = ?auto_384587 ?auto_384590 ) ) ( not ( = ?auto_384588 ?auto_384589 ) ) ( not ( = ?auto_384588 ?auto_384590 ) ) ( not ( = ?auto_384589 ?auto_384590 ) ) ( ON ?auto_384588 ?auto_384589 ) ( ON ?auto_384587 ?auto_384588 ) ( ON ?auto_384586 ?auto_384587 ) ( ON ?auto_384585 ?auto_384586 ) ( ON ?auto_384584 ?auto_384585 ) ( CLEAR ?auto_384582 ) ( ON ?auto_384583 ?auto_384584 ) ( CLEAR ?auto_384583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_384577 ?auto_384578 ?auto_384579 ?auto_384580 ?auto_384581 ?auto_384582 ?auto_384583 )
      ( MAKE-13PILE ?auto_384577 ?auto_384578 ?auto_384579 ?auto_384580 ?auto_384581 ?auto_384582 ?auto_384583 ?auto_384584 ?auto_384585 ?auto_384586 ?auto_384587 ?auto_384588 ?auto_384589 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384604 - BLOCK
      ?auto_384605 - BLOCK
      ?auto_384606 - BLOCK
      ?auto_384607 - BLOCK
      ?auto_384608 - BLOCK
      ?auto_384609 - BLOCK
      ?auto_384610 - BLOCK
      ?auto_384611 - BLOCK
      ?auto_384612 - BLOCK
      ?auto_384613 - BLOCK
      ?auto_384614 - BLOCK
      ?auto_384615 - BLOCK
      ?auto_384616 - BLOCK
    )
    :vars
    (
      ?auto_384617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384616 ?auto_384617 ) ( ON-TABLE ?auto_384604 ) ( ON ?auto_384605 ?auto_384604 ) ( ON ?auto_384606 ?auto_384605 ) ( ON ?auto_384607 ?auto_384606 ) ( ON ?auto_384608 ?auto_384607 ) ( ON ?auto_384609 ?auto_384608 ) ( not ( = ?auto_384604 ?auto_384605 ) ) ( not ( = ?auto_384604 ?auto_384606 ) ) ( not ( = ?auto_384604 ?auto_384607 ) ) ( not ( = ?auto_384604 ?auto_384608 ) ) ( not ( = ?auto_384604 ?auto_384609 ) ) ( not ( = ?auto_384604 ?auto_384610 ) ) ( not ( = ?auto_384604 ?auto_384611 ) ) ( not ( = ?auto_384604 ?auto_384612 ) ) ( not ( = ?auto_384604 ?auto_384613 ) ) ( not ( = ?auto_384604 ?auto_384614 ) ) ( not ( = ?auto_384604 ?auto_384615 ) ) ( not ( = ?auto_384604 ?auto_384616 ) ) ( not ( = ?auto_384604 ?auto_384617 ) ) ( not ( = ?auto_384605 ?auto_384606 ) ) ( not ( = ?auto_384605 ?auto_384607 ) ) ( not ( = ?auto_384605 ?auto_384608 ) ) ( not ( = ?auto_384605 ?auto_384609 ) ) ( not ( = ?auto_384605 ?auto_384610 ) ) ( not ( = ?auto_384605 ?auto_384611 ) ) ( not ( = ?auto_384605 ?auto_384612 ) ) ( not ( = ?auto_384605 ?auto_384613 ) ) ( not ( = ?auto_384605 ?auto_384614 ) ) ( not ( = ?auto_384605 ?auto_384615 ) ) ( not ( = ?auto_384605 ?auto_384616 ) ) ( not ( = ?auto_384605 ?auto_384617 ) ) ( not ( = ?auto_384606 ?auto_384607 ) ) ( not ( = ?auto_384606 ?auto_384608 ) ) ( not ( = ?auto_384606 ?auto_384609 ) ) ( not ( = ?auto_384606 ?auto_384610 ) ) ( not ( = ?auto_384606 ?auto_384611 ) ) ( not ( = ?auto_384606 ?auto_384612 ) ) ( not ( = ?auto_384606 ?auto_384613 ) ) ( not ( = ?auto_384606 ?auto_384614 ) ) ( not ( = ?auto_384606 ?auto_384615 ) ) ( not ( = ?auto_384606 ?auto_384616 ) ) ( not ( = ?auto_384606 ?auto_384617 ) ) ( not ( = ?auto_384607 ?auto_384608 ) ) ( not ( = ?auto_384607 ?auto_384609 ) ) ( not ( = ?auto_384607 ?auto_384610 ) ) ( not ( = ?auto_384607 ?auto_384611 ) ) ( not ( = ?auto_384607 ?auto_384612 ) ) ( not ( = ?auto_384607 ?auto_384613 ) ) ( not ( = ?auto_384607 ?auto_384614 ) ) ( not ( = ?auto_384607 ?auto_384615 ) ) ( not ( = ?auto_384607 ?auto_384616 ) ) ( not ( = ?auto_384607 ?auto_384617 ) ) ( not ( = ?auto_384608 ?auto_384609 ) ) ( not ( = ?auto_384608 ?auto_384610 ) ) ( not ( = ?auto_384608 ?auto_384611 ) ) ( not ( = ?auto_384608 ?auto_384612 ) ) ( not ( = ?auto_384608 ?auto_384613 ) ) ( not ( = ?auto_384608 ?auto_384614 ) ) ( not ( = ?auto_384608 ?auto_384615 ) ) ( not ( = ?auto_384608 ?auto_384616 ) ) ( not ( = ?auto_384608 ?auto_384617 ) ) ( not ( = ?auto_384609 ?auto_384610 ) ) ( not ( = ?auto_384609 ?auto_384611 ) ) ( not ( = ?auto_384609 ?auto_384612 ) ) ( not ( = ?auto_384609 ?auto_384613 ) ) ( not ( = ?auto_384609 ?auto_384614 ) ) ( not ( = ?auto_384609 ?auto_384615 ) ) ( not ( = ?auto_384609 ?auto_384616 ) ) ( not ( = ?auto_384609 ?auto_384617 ) ) ( not ( = ?auto_384610 ?auto_384611 ) ) ( not ( = ?auto_384610 ?auto_384612 ) ) ( not ( = ?auto_384610 ?auto_384613 ) ) ( not ( = ?auto_384610 ?auto_384614 ) ) ( not ( = ?auto_384610 ?auto_384615 ) ) ( not ( = ?auto_384610 ?auto_384616 ) ) ( not ( = ?auto_384610 ?auto_384617 ) ) ( not ( = ?auto_384611 ?auto_384612 ) ) ( not ( = ?auto_384611 ?auto_384613 ) ) ( not ( = ?auto_384611 ?auto_384614 ) ) ( not ( = ?auto_384611 ?auto_384615 ) ) ( not ( = ?auto_384611 ?auto_384616 ) ) ( not ( = ?auto_384611 ?auto_384617 ) ) ( not ( = ?auto_384612 ?auto_384613 ) ) ( not ( = ?auto_384612 ?auto_384614 ) ) ( not ( = ?auto_384612 ?auto_384615 ) ) ( not ( = ?auto_384612 ?auto_384616 ) ) ( not ( = ?auto_384612 ?auto_384617 ) ) ( not ( = ?auto_384613 ?auto_384614 ) ) ( not ( = ?auto_384613 ?auto_384615 ) ) ( not ( = ?auto_384613 ?auto_384616 ) ) ( not ( = ?auto_384613 ?auto_384617 ) ) ( not ( = ?auto_384614 ?auto_384615 ) ) ( not ( = ?auto_384614 ?auto_384616 ) ) ( not ( = ?auto_384614 ?auto_384617 ) ) ( not ( = ?auto_384615 ?auto_384616 ) ) ( not ( = ?auto_384615 ?auto_384617 ) ) ( not ( = ?auto_384616 ?auto_384617 ) ) ( ON ?auto_384615 ?auto_384616 ) ( ON ?auto_384614 ?auto_384615 ) ( ON ?auto_384613 ?auto_384614 ) ( ON ?auto_384612 ?auto_384613 ) ( ON ?auto_384611 ?auto_384612 ) ( CLEAR ?auto_384609 ) ( ON ?auto_384610 ?auto_384611 ) ( CLEAR ?auto_384610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_384604 ?auto_384605 ?auto_384606 ?auto_384607 ?auto_384608 ?auto_384609 ?auto_384610 )
      ( MAKE-13PILE ?auto_384604 ?auto_384605 ?auto_384606 ?auto_384607 ?auto_384608 ?auto_384609 ?auto_384610 ?auto_384611 ?auto_384612 ?auto_384613 ?auto_384614 ?auto_384615 ?auto_384616 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384631 - BLOCK
      ?auto_384632 - BLOCK
      ?auto_384633 - BLOCK
      ?auto_384634 - BLOCK
      ?auto_384635 - BLOCK
      ?auto_384636 - BLOCK
      ?auto_384637 - BLOCK
      ?auto_384638 - BLOCK
      ?auto_384639 - BLOCK
      ?auto_384640 - BLOCK
      ?auto_384641 - BLOCK
      ?auto_384642 - BLOCK
      ?auto_384643 - BLOCK
    )
    :vars
    (
      ?auto_384644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384643 ?auto_384644 ) ( ON-TABLE ?auto_384631 ) ( ON ?auto_384632 ?auto_384631 ) ( ON ?auto_384633 ?auto_384632 ) ( ON ?auto_384634 ?auto_384633 ) ( ON ?auto_384635 ?auto_384634 ) ( not ( = ?auto_384631 ?auto_384632 ) ) ( not ( = ?auto_384631 ?auto_384633 ) ) ( not ( = ?auto_384631 ?auto_384634 ) ) ( not ( = ?auto_384631 ?auto_384635 ) ) ( not ( = ?auto_384631 ?auto_384636 ) ) ( not ( = ?auto_384631 ?auto_384637 ) ) ( not ( = ?auto_384631 ?auto_384638 ) ) ( not ( = ?auto_384631 ?auto_384639 ) ) ( not ( = ?auto_384631 ?auto_384640 ) ) ( not ( = ?auto_384631 ?auto_384641 ) ) ( not ( = ?auto_384631 ?auto_384642 ) ) ( not ( = ?auto_384631 ?auto_384643 ) ) ( not ( = ?auto_384631 ?auto_384644 ) ) ( not ( = ?auto_384632 ?auto_384633 ) ) ( not ( = ?auto_384632 ?auto_384634 ) ) ( not ( = ?auto_384632 ?auto_384635 ) ) ( not ( = ?auto_384632 ?auto_384636 ) ) ( not ( = ?auto_384632 ?auto_384637 ) ) ( not ( = ?auto_384632 ?auto_384638 ) ) ( not ( = ?auto_384632 ?auto_384639 ) ) ( not ( = ?auto_384632 ?auto_384640 ) ) ( not ( = ?auto_384632 ?auto_384641 ) ) ( not ( = ?auto_384632 ?auto_384642 ) ) ( not ( = ?auto_384632 ?auto_384643 ) ) ( not ( = ?auto_384632 ?auto_384644 ) ) ( not ( = ?auto_384633 ?auto_384634 ) ) ( not ( = ?auto_384633 ?auto_384635 ) ) ( not ( = ?auto_384633 ?auto_384636 ) ) ( not ( = ?auto_384633 ?auto_384637 ) ) ( not ( = ?auto_384633 ?auto_384638 ) ) ( not ( = ?auto_384633 ?auto_384639 ) ) ( not ( = ?auto_384633 ?auto_384640 ) ) ( not ( = ?auto_384633 ?auto_384641 ) ) ( not ( = ?auto_384633 ?auto_384642 ) ) ( not ( = ?auto_384633 ?auto_384643 ) ) ( not ( = ?auto_384633 ?auto_384644 ) ) ( not ( = ?auto_384634 ?auto_384635 ) ) ( not ( = ?auto_384634 ?auto_384636 ) ) ( not ( = ?auto_384634 ?auto_384637 ) ) ( not ( = ?auto_384634 ?auto_384638 ) ) ( not ( = ?auto_384634 ?auto_384639 ) ) ( not ( = ?auto_384634 ?auto_384640 ) ) ( not ( = ?auto_384634 ?auto_384641 ) ) ( not ( = ?auto_384634 ?auto_384642 ) ) ( not ( = ?auto_384634 ?auto_384643 ) ) ( not ( = ?auto_384634 ?auto_384644 ) ) ( not ( = ?auto_384635 ?auto_384636 ) ) ( not ( = ?auto_384635 ?auto_384637 ) ) ( not ( = ?auto_384635 ?auto_384638 ) ) ( not ( = ?auto_384635 ?auto_384639 ) ) ( not ( = ?auto_384635 ?auto_384640 ) ) ( not ( = ?auto_384635 ?auto_384641 ) ) ( not ( = ?auto_384635 ?auto_384642 ) ) ( not ( = ?auto_384635 ?auto_384643 ) ) ( not ( = ?auto_384635 ?auto_384644 ) ) ( not ( = ?auto_384636 ?auto_384637 ) ) ( not ( = ?auto_384636 ?auto_384638 ) ) ( not ( = ?auto_384636 ?auto_384639 ) ) ( not ( = ?auto_384636 ?auto_384640 ) ) ( not ( = ?auto_384636 ?auto_384641 ) ) ( not ( = ?auto_384636 ?auto_384642 ) ) ( not ( = ?auto_384636 ?auto_384643 ) ) ( not ( = ?auto_384636 ?auto_384644 ) ) ( not ( = ?auto_384637 ?auto_384638 ) ) ( not ( = ?auto_384637 ?auto_384639 ) ) ( not ( = ?auto_384637 ?auto_384640 ) ) ( not ( = ?auto_384637 ?auto_384641 ) ) ( not ( = ?auto_384637 ?auto_384642 ) ) ( not ( = ?auto_384637 ?auto_384643 ) ) ( not ( = ?auto_384637 ?auto_384644 ) ) ( not ( = ?auto_384638 ?auto_384639 ) ) ( not ( = ?auto_384638 ?auto_384640 ) ) ( not ( = ?auto_384638 ?auto_384641 ) ) ( not ( = ?auto_384638 ?auto_384642 ) ) ( not ( = ?auto_384638 ?auto_384643 ) ) ( not ( = ?auto_384638 ?auto_384644 ) ) ( not ( = ?auto_384639 ?auto_384640 ) ) ( not ( = ?auto_384639 ?auto_384641 ) ) ( not ( = ?auto_384639 ?auto_384642 ) ) ( not ( = ?auto_384639 ?auto_384643 ) ) ( not ( = ?auto_384639 ?auto_384644 ) ) ( not ( = ?auto_384640 ?auto_384641 ) ) ( not ( = ?auto_384640 ?auto_384642 ) ) ( not ( = ?auto_384640 ?auto_384643 ) ) ( not ( = ?auto_384640 ?auto_384644 ) ) ( not ( = ?auto_384641 ?auto_384642 ) ) ( not ( = ?auto_384641 ?auto_384643 ) ) ( not ( = ?auto_384641 ?auto_384644 ) ) ( not ( = ?auto_384642 ?auto_384643 ) ) ( not ( = ?auto_384642 ?auto_384644 ) ) ( not ( = ?auto_384643 ?auto_384644 ) ) ( ON ?auto_384642 ?auto_384643 ) ( ON ?auto_384641 ?auto_384642 ) ( ON ?auto_384640 ?auto_384641 ) ( ON ?auto_384639 ?auto_384640 ) ( ON ?auto_384638 ?auto_384639 ) ( ON ?auto_384637 ?auto_384638 ) ( CLEAR ?auto_384635 ) ( ON ?auto_384636 ?auto_384637 ) ( CLEAR ?auto_384636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_384631 ?auto_384632 ?auto_384633 ?auto_384634 ?auto_384635 ?auto_384636 )
      ( MAKE-13PILE ?auto_384631 ?auto_384632 ?auto_384633 ?auto_384634 ?auto_384635 ?auto_384636 ?auto_384637 ?auto_384638 ?auto_384639 ?auto_384640 ?auto_384641 ?auto_384642 ?auto_384643 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384658 - BLOCK
      ?auto_384659 - BLOCK
      ?auto_384660 - BLOCK
      ?auto_384661 - BLOCK
      ?auto_384662 - BLOCK
      ?auto_384663 - BLOCK
      ?auto_384664 - BLOCK
      ?auto_384665 - BLOCK
      ?auto_384666 - BLOCK
      ?auto_384667 - BLOCK
      ?auto_384668 - BLOCK
      ?auto_384669 - BLOCK
      ?auto_384670 - BLOCK
    )
    :vars
    (
      ?auto_384671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384670 ?auto_384671 ) ( ON-TABLE ?auto_384658 ) ( ON ?auto_384659 ?auto_384658 ) ( ON ?auto_384660 ?auto_384659 ) ( ON ?auto_384661 ?auto_384660 ) ( ON ?auto_384662 ?auto_384661 ) ( not ( = ?auto_384658 ?auto_384659 ) ) ( not ( = ?auto_384658 ?auto_384660 ) ) ( not ( = ?auto_384658 ?auto_384661 ) ) ( not ( = ?auto_384658 ?auto_384662 ) ) ( not ( = ?auto_384658 ?auto_384663 ) ) ( not ( = ?auto_384658 ?auto_384664 ) ) ( not ( = ?auto_384658 ?auto_384665 ) ) ( not ( = ?auto_384658 ?auto_384666 ) ) ( not ( = ?auto_384658 ?auto_384667 ) ) ( not ( = ?auto_384658 ?auto_384668 ) ) ( not ( = ?auto_384658 ?auto_384669 ) ) ( not ( = ?auto_384658 ?auto_384670 ) ) ( not ( = ?auto_384658 ?auto_384671 ) ) ( not ( = ?auto_384659 ?auto_384660 ) ) ( not ( = ?auto_384659 ?auto_384661 ) ) ( not ( = ?auto_384659 ?auto_384662 ) ) ( not ( = ?auto_384659 ?auto_384663 ) ) ( not ( = ?auto_384659 ?auto_384664 ) ) ( not ( = ?auto_384659 ?auto_384665 ) ) ( not ( = ?auto_384659 ?auto_384666 ) ) ( not ( = ?auto_384659 ?auto_384667 ) ) ( not ( = ?auto_384659 ?auto_384668 ) ) ( not ( = ?auto_384659 ?auto_384669 ) ) ( not ( = ?auto_384659 ?auto_384670 ) ) ( not ( = ?auto_384659 ?auto_384671 ) ) ( not ( = ?auto_384660 ?auto_384661 ) ) ( not ( = ?auto_384660 ?auto_384662 ) ) ( not ( = ?auto_384660 ?auto_384663 ) ) ( not ( = ?auto_384660 ?auto_384664 ) ) ( not ( = ?auto_384660 ?auto_384665 ) ) ( not ( = ?auto_384660 ?auto_384666 ) ) ( not ( = ?auto_384660 ?auto_384667 ) ) ( not ( = ?auto_384660 ?auto_384668 ) ) ( not ( = ?auto_384660 ?auto_384669 ) ) ( not ( = ?auto_384660 ?auto_384670 ) ) ( not ( = ?auto_384660 ?auto_384671 ) ) ( not ( = ?auto_384661 ?auto_384662 ) ) ( not ( = ?auto_384661 ?auto_384663 ) ) ( not ( = ?auto_384661 ?auto_384664 ) ) ( not ( = ?auto_384661 ?auto_384665 ) ) ( not ( = ?auto_384661 ?auto_384666 ) ) ( not ( = ?auto_384661 ?auto_384667 ) ) ( not ( = ?auto_384661 ?auto_384668 ) ) ( not ( = ?auto_384661 ?auto_384669 ) ) ( not ( = ?auto_384661 ?auto_384670 ) ) ( not ( = ?auto_384661 ?auto_384671 ) ) ( not ( = ?auto_384662 ?auto_384663 ) ) ( not ( = ?auto_384662 ?auto_384664 ) ) ( not ( = ?auto_384662 ?auto_384665 ) ) ( not ( = ?auto_384662 ?auto_384666 ) ) ( not ( = ?auto_384662 ?auto_384667 ) ) ( not ( = ?auto_384662 ?auto_384668 ) ) ( not ( = ?auto_384662 ?auto_384669 ) ) ( not ( = ?auto_384662 ?auto_384670 ) ) ( not ( = ?auto_384662 ?auto_384671 ) ) ( not ( = ?auto_384663 ?auto_384664 ) ) ( not ( = ?auto_384663 ?auto_384665 ) ) ( not ( = ?auto_384663 ?auto_384666 ) ) ( not ( = ?auto_384663 ?auto_384667 ) ) ( not ( = ?auto_384663 ?auto_384668 ) ) ( not ( = ?auto_384663 ?auto_384669 ) ) ( not ( = ?auto_384663 ?auto_384670 ) ) ( not ( = ?auto_384663 ?auto_384671 ) ) ( not ( = ?auto_384664 ?auto_384665 ) ) ( not ( = ?auto_384664 ?auto_384666 ) ) ( not ( = ?auto_384664 ?auto_384667 ) ) ( not ( = ?auto_384664 ?auto_384668 ) ) ( not ( = ?auto_384664 ?auto_384669 ) ) ( not ( = ?auto_384664 ?auto_384670 ) ) ( not ( = ?auto_384664 ?auto_384671 ) ) ( not ( = ?auto_384665 ?auto_384666 ) ) ( not ( = ?auto_384665 ?auto_384667 ) ) ( not ( = ?auto_384665 ?auto_384668 ) ) ( not ( = ?auto_384665 ?auto_384669 ) ) ( not ( = ?auto_384665 ?auto_384670 ) ) ( not ( = ?auto_384665 ?auto_384671 ) ) ( not ( = ?auto_384666 ?auto_384667 ) ) ( not ( = ?auto_384666 ?auto_384668 ) ) ( not ( = ?auto_384666 ?auto_384669 ) ) ( not ( = ?auto_384666 ?auto_384670 ) ) ( not ( = ?auto_384666 ?auto_384671 ) ) ( not ( = ?auto_384667 ?auto_384668 ) ) ( not ( = ?auto_384667 ?auto_384669 ) ) ( not ( = ?auto_384667 ?auto_384670 ) ) ( not ( = ?auto_384667 ?auto_384671 ) ) ( not ( = ?auto_384668 ?auto_384669 ) ) ( not ( = ?auto_384668 ?auto_384670 ) ) ( not ( = ?auto_384668 ?auto_384671 ) ) ( not ( = ?auto_384669 ?auto_384670 ) ) ( not ( = ?auto_384669 ?auto_384671 ) ) ( not ( = ?auto_384670 ?auto_384671 ) ) ( ON ?auto_384669 ?auto_384670 ) ( ON ?auto_384668 ?auto_384669 ) ( ON ?auto_384667 ?auto_384668 ) ( ON ?auto_384666 ?auto_384667 ) ( ON ?auto_384665 ?auto_384666 ) ( ON ?auto_384664 ?auto_384665 ) ( CLEAR ?auto_384662 ) ( ON ?auto_384663 ?auto_384664 ) ( CLEAR ?auto_384663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_384658 ?auto_384659 ?auto_384660 ?auto_384661 ?auto_384662 ?auto_384663 )
      ( MAKE-13PILE ?auto_384658 ?auto_384659 ?auto_384660 ?auto_384661 ?auto_384662 ?auto_384663 ?auto_384664 ?auto_384665 ?auto_384666 ?auto_384667 ?auto_384668 ?auto_384669 ?auto_384670 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384685 - BLOCK
      ?auto_384686 - BLOCK
      ?auto_384687 - BLOCK
      ?auto_384688 - BLOCK
      ?auto_384689 - BLOCK
      ?auto_384690 - BLOCK
      ?auto_384691 - BLOCK
      ?auto_384692 - BLOCK
      ?auto_384693 - BLOCK
      ?auto_384694 - BLOCK
      ?auto_384695 - BLOCK
      ?auto_384696 - BLOCK
      ?auto_384697 - BLOCK
    )
    :vars
    (
      ?auto_384698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384697 ?auto_384698 ) ( ON-TABLE ?auto_384685 ) ( ON ?auto_384686 ?auto_384685 ) ( ON ?auto_384687 ?auto_384686 ) ( ON ?auto_384688 ?auto_384687 ) ( not ( = ?auto_384685 ?auto_384686 ) ) ( not ( = ?auto_384685 ?auto_384687 ) ) ( not ( = ?auto_384685 ?auto_384688 ) ) ( not ( = ?auto_384685 ?auto_384689 ) ) ( not ( = ?auto_384685 ?auto_384690 ) ) ( not ( = ?auto_384685 ?auto_384691 ) ) ( not ( = ?auto_384685 ?auto_384692 ) ) ( not ( = ?auto_384685 ?auto_384693 ) ) ( not ( = ?auto_384685 ?auto_384694 ) ) ( not ( = ?auto_384685 ?auto_384695 ) ) ( not ( = ?auto_384685 ?auto_384696 ) ) ( not ( = ?auto_384685 ?auto_384697 ) ) ( not ( = ?auto_384685 ?auto_384698 ) ) ( not ( = ?auto_384686 ?auto_384687 ) ) ( not ( = ?auto_384686 ?auto_384688 ) ) ( not ( = ?auto_384686 ?auto_384689 ) ) ( not ( = ?auto_384686 ?auto_384690 ) ) ( not ( = ?auto_384686 ?auto_384691 ) ) ( not ( = ?auto_384686 ?auto_384692 ) ) ( not ( = ?auto_384686 ?auto_384693 ) ) ( not ( = ?auto_384686 ?auto_384694 ) ) ( not ( = ?auto_384686 ?auto_384695 ) ) ( not ( = ?auto_384686 ?auto_384696 ) ) ( not ( = ?auto_384686 ?auto_384697 ) ) ( not ( = ?auto_384686 ?auto_384698 ) ) ( not ( = ?auto_384687 ?auto_384688 ) ) ( not ( = ?auto_384687 ?auto_384689 ) ) ( not ( = ?auto_384687 ?auto_384690 ) ) ( not ( = ?auto_384687 ?auto_384691 ) ) ( not ( = ?auto_384687 ?auto_384692 ) ) ( not ( = ?auto_384687 ?auto_384693 ) ) ( not ( = ?auto_384687 ?auto_384694 ) ) ( not ( = ?auto_384687 ?auto_384695 ) ) ( not ( = ?auto_384687 ?auto_384696 ) ) ( not ( = ?auto_384687 ?auto_384697 ) ) ( not ( = ?auto_384687 ?auto_384698 ) ) ( not ( = ?auto_384688 ?auto_384689 ) ) ( not ( = ?auto_384688 ?auto_384690 ) ) ( not ( = ?auto_384688 ?auto_384691 ) ) ( not ( = ?auto_384688 ?auto_384692 ) ) ( not ( = ?auto_384688 ?auto_384693 ) ) ( not ( = ?auto_384688 ?auto_384694 ) ) ( not ( = ?auto_384688 ?auto_384695 ) ) ( not ( = ?auto_384688 ?auto_384696 ) ) ( not ( = ?auto_384688 ?auto_384697 ) ) ( not ( = ?auto_384688 ?auto_384698 ) ) ( not ( = ?auto_384689 ?auto_384690 ) ) ( not ( = ?auto_384689 ?auto_384691 ) ) ( not ( = ?auto_384689 ?auto_384692 ) ) ( not ( = ?auto_384689 ?auto_384693 ) ) ( not ( = ?auto_384689 ?auto_384694 ) ) ( not ( = ?auto_384689 ?auto_384695 ) ) ( not ( = ?auto_384689 ?auto_384696 ) ) ( not ( = ?auto_384689 ?auto_384697 ) ) ( not ( = ?auto_384689 ?auto_384698 ) ) ( not ( = ?auto_384690 ?auto_384691 ) ) ( not ( = ?auto_384690 ?auto_384692 ) ) ( not ( = ?auto_384690 ?auto_384693 ) ) ( not ( = ?auto_384690 ?auto_384694 ) ) ( not ( = ?auto_384690 ?auto_384695 ) ) ( not ( = ?auto_384690 ?auto_384696 ) ) ( not ( = ?auto_384690 ?auto_384697 ) ) ( not ( = ?auto_384690 ?auto_384698 ) ) ( not ( = ?auto_384691 ?auto_384692 ) ) ( not ( = ?auto_384691 ?auto_384693 ) ) ( not ( = ?auto_384691 ?auto_384694 ) ) ( not ( = ?auto_384691 ?auto_384695 ) ) ( not ( = ?auto_384691 ?auto_384696 ) ) ( not ( = ?auto_384691 ?auto_384697 ) ) ( not ( = ?auto_384691 ?auto_384698 ) ) ( not ( = ?auto_384692 ?auto_384693 ) ) ( not ( = ?auto_384692 ?auto_384694 ) ) ( not ( = ?auto_384692 ?auto_384695 ) ) ( not ( = ?auto_384692 ?auto_384696 ) ) ( not ( = ?auto_384692 ?auto_384697 ) ) ( not ( = ?auto_384692 ?auto_384698 ) ) ( not ( = ?auto_384693 ?auto_384694 ) ) ( not ( = ?auto_384693 ?auto_384695 ) ) ( not ( = ?auto_384693 ?auto_384696 ) ) ( not ( = ?auto_384693 ?auto_384697 ) ) ( not ( = ?auto_384693 ?auto_384698 ) ) ( not ( = ?auto_384694 ?auto_384695 ) ) ( not ( = ?auto_384694 ?auto_384696 ) ) ( not ( = ?auto_384694 ?auto_384697 ) ) ( not ( = ?auto_384694 ?auto_384698 ) ) ( not ( = ?auto_384695 ?auto_384696 ) ) ( not ( = ?auto_384695 ?auto_384697 ) ) ( not ( = ?auto_384695 ?auto_384698 ) ) ( not ( = ?auto_384696 ?auto_384697 ) ) ( not ( = ?auto_384696 ?auto_384698 ) ) ( not ( = ?auto_384697 ?auto_384698 ) ) ( ON ?auto_384696 ?auto_384697 ) ( ON ?auto_384695 ?auto_384696 ) ( ON ?auto_384694 ?auto_384695 ) ( ON ?auto_384693 ?auto_384694 ) ( ON ?auto_384692 ?auto_384693 ) ( ON ?auto_384691 ?auto_384692 ) ( ON ?auto_384690 ?auto_384691 ) ( CLEAR ?auto_384688 ) ( ON ?auto_384689 ?auto_384690 ) ( CLEAR ?auto_384689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_384685 ?auto_384686 ?auto_384687 ?auto_384688 ?auto_384689 )
      ( MAKE-13PILE ?auto_384685 ?auto_384686 ?auto_384687 ?auto_384688 ?auto_384689 ?auto_384690 ?auto_384691 ?auto_384692 ?auto_384693 ?auto_384694 ?auto_384695 ?auto_384696 ?auto_384697 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384712 - BLOCK
      ?auto_384713 - BLOCK
      ?auto_384714 - BLOCK
      ?auto_384715 - BLOCK
      ?auto_384716 - BLOCK
      ?auto_384717 - BLOCK
      ?auto_384718 - BLOCK
      ?auto_384719 - BLOCK
      ?auto_384720 - BLOCK
      ?auto_384721 - BLOCK
      ?auto_384722 - BLOCK
      ?auto_384723 - BLOCK
      ?auto_384724 - BLOCK
    )
    :vars
    (
      ?auto_384725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384724 ?auto_384725 ) ( ON-TABLE ?auto_384712 ) ( ON ?auto_384713 ?auto_384712 ) ( ON ?auto_384714 ?auto_384713 ) ( ON ?auto_384715 ?auto_384714 ) ( not ( = ?auto_384712 ?auto_384713 ) ) ( not ( = ?auto_384712 ?auto_384714 ) ) ( not ( = ?auto_384712 ?auto_384715 ) ) ( not ( = ?auto_384712 ?auto_384716 ) ) ( not ( = ?auto_384712 ?auto_384717 ) ) ( not ( = ?auto_384712 ?auto_384718 ) ) ( not ( = ?auto_384712 ?auto_384719 ) ) ( not ( = ?auto_384712 ?auto_384720 ) ) ( not ( = ?auto_384712 ?auto_384721 ) ) ( not ( = ?auto_384712 ?auto_384722 ) ) ( not ( = ?auto_384712 ?auto_384723 ) ) ( not ( = ?auto_384712 ?auto_384724 ) ) ( not ( = ?auto_384712 ?auto_384725 ) ) ( not ( = ?auto_384713 ?auto_384714 ) ) ( not ( = ?auto_384713 ?auto_384715 ) ) ( not ( = ?auto_384713 ?auto_384716 ) ) ( not ( = ?auto_384713 ?auto_384717 ) ) ( not ( = ?auto_384713 ?auto_384718 ) ) ( not ( = ?auto_384713 ?auto_384719 ) ) ( not ( = ?auto_384713 ?auto_384720 ) ) ( not ( = ?auto_384713 ?auto_384721 ) ) ( not ( = ?auto_384713 ?auto_384722 ) ) ( not ( = ?auto_384713 ?auto_384723 ) ) ( not ( = ?auto_384713 ?auto_384724 ) ) ( not ( = ?auto_384713 ?auto_384725 ) ) ( not ( = ?auto_384714 ?auto_384715 ) ) ( not ( = ?auto_384714 ?auto_384716 ) ) ( not ( = ?auto_384714 ?auto_384717 ) ) ( not ( = ?auto_384714 ?auto_384718 ) ) ( not ( = ?auto_384714 ?auto_384719 ) ) ( not ( = ?auto_384714 ?auto_384720 ) ) ( not ( = ?auto_384714 ?auto_384721 ) ) ( not ( = ?auto_384714 ?auto_384722 ) ) ( not ( = ?auto_384714 ?auto_384723 ) ) ( not ( = ?auto_384714 ?auto_384724 ) ) ( not ( = ?auto_384714 ?auto_384725 ) ) ( not ( = ?auto_384715 ?auto_384716 ) ) ( not ( = ?auto_384715 ?auto_384717 ) ) ( not ( = ?auto_384715 ?auto_384718 ) ) ( not ( = ?auto_384715 ?auto_384719 ) ) ( not ( = ?auto_384715 ?auto_384720 ) ) ( not ( = ?auto_384715 ?auto_384721 ) ) ( not ( = ?auto_384715 ?auto_384722 ) ) ( not ( = ?auto_384715 ?auto_384723 ) ) ( not ( = ?auto_384715 ?auto_384724 ) ) ( not ( = ?auto_384715 ?auto_384725 ) ) ( not ( = ?auto_384716 ?auto_384717 ) ) ( not ( = ?auto_384716 ?auto_384718 ) ) ( not ( = ?auto_384716 ?auto_384719 ) ) ( not ( = ?auto_384716 ?auto_384720 ) ) ( not ( = ?auto_384716 ?auto_384721 ) ) ( not ( = ?auto_384716 ?auto_384722 ) ) ( not ( = ?auto_384716 ?auto_384723 ) ) ( not ( = ?auto_384716 ?auto_384724 ) ) ( not ( = ?auto_384716 ?auto_384725 ) ) ( not ( = ?auto_384717 ?auto_384718 ) ) ( not ( = ?auto_384717 ?auto_384719 ) ) ( not ( = ?auto_384717 ?auto_384720 ) ) ( not ( = ?auto_384717 ?auto_384721 ) ) ( not ( = ?auto_384717 ?auto_384722 ) ) ( not ( = ?auto_384717 ?auto_384723 ) ) ( not ( = ?auto_384717 ?auto_384724 ) ) ( not ( = ?auto_384717 ?auto_384725 ) ) ( not ( = ?auto_384718 ?auto_384719 ) ) ( not ( = ?auto_384718 ?auto_384720 ) ) ( not ( = ?auto_384718 ?auto_384721 ) ) ( not ( = ?auto_384718 ?auto_384722 ) ) ( not ( = ?auto_384718 ?auto_384723 ) ) ( not ( = ?auto_384718 ?auto_384724 ) ) ( not ( = ?auto_384718 ?auto_384725 ) ) ( not ( = ?auto_384719 ?auto_384720 ) ) ( not ( = ?auto_384719 ?auto_384721 ) ) ( not ( = ?auto_384719 ?auto_384722 ) ) ( not ( = ?auto_384719 ?auto_384723 ) ) ( not ( = ?auto_384719 ?auto_384724 ) ) ( not ( = ?auto_384719 ?auto_384725 ) ) ( not ( = ?auto_384720 ?auto_384721 ) ) ( not ( = ?auto_384720 ?auto_384722 ) ) ( not ( = ?auto_384720 ?auto_384723 ) ) ( not ( = ?auto_384720 ?auto_384724 ) ) ( not ( = ?auto_384720 ?auto_384725 ) ) ( not ( = ?auto_384721 ?auto_384722 ) ) ( not ( = ?auto_384721 ?auto_384723 ) ) ( not ( = ?auto_384721 ?auto_384724 ) ) ( not ( = ?auto_384721 ?auto_384725 ) ) ( not ( = ?auto_384722 ?auto_384723 ) ) ( not ( = ?auto_384722 ?auto_384724 ) ) ( not ( = ?auto_384722 ?auto_384725 ) ) ( not ( = ?auto_384723 ?auto_384724 ) ) ( not ( = ?auto_384723 ?auto_384725 ) ) ( not ( = ?auto_384724 ?auto_384725 ) ) ( ON ?auto_384723 ?auto_384724 ) ( ON ?auto_384722 ?auto_384723 ) ( ON ?auto_384721 ?auto_384722 ) ( ON ?auto_384720 ?auto_384721 ) ( ON ?auto_384719 ?auto_384720 ) ( ON ?auto_384718 ?auto_384719 ) ( ON ?auto_384717 ?auto_384718 ) ( CLEAR ?auto_384715 ) ( ON ?auto_384716 ?auto_384717 ) ( CLEAR ?auto_384716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_384712 ?auto_384713 ?auto_384714 ?auto_384715 ?auto_384716 )
      ( MAKE-13PILE ?auto_384712 ?auto_384713 ?auto_384714 ?auto_384715 ?auto_384716 ?auto_384717 ?auto_384718 ?auto_384719 ?auto_384720 ?auto_384721 ?auto_384722 ?auto_384723 ?auto_384724 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384739 - BLOCK
      ?auto_384740 - BLOCK
      ?auto_384741 - BLOCK
      ?auto_384742 - BLOCK
      ?auto_384743 - BLOCK
      ?auto_384744 - BLOCK
      ?auto_384745 - BLOCK
      ?auto_384746 - BLOCK
      ?auto_384747 - BLOCK
      ?auto_384748 - BLOCK
      ?auto_384749 - BLOCK
      ?auto_384750 - BLOCK
      ?auto_384751 - BLOCK
    )
    :vars
    (
      ?auto_384752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384751 ?auto_384752 ) ( ON-TABLE ?auto_384739 ) ( ON ?auto_384740 ?auto_384739 ) ( ON ?auto_384741 ?auto_384740 ) ( not ( = ?auto_384739 ?auto_384740 ) ) ( not ( = ?auto_384739 ?auto_384741 ) ) ( not ( = ?auto_384739 ?auto_384742 ) ) ( not ( = ?auto_384739 ?auto_384743 ) ) ( not ( = ?auto_384739 ?auto_384744 ) ) ( not ( = ?auto_384739 ?auto_384745 ) ) ( not ( = ?auto_384739 ?auto_384746 ) ) ( not ( = ?auto_384739 ?auto_384747 ) ) ( not ( = ?auto_384739 ?auto_384748 ) ) ( not ( = ?auto_384739 ?auto_384749 ) ) ( not ( = ?auto_384739 ?auto_384750 ) ) ( not ( = ?auto_384739 ?auto_384751 ) ) ( not ( = ?auto_384739 ?auto_384752 ) ) ( not ( = ?auto_384740 ?auto_384741 ) ) ( not ( = ?auto_384740 ?auto_384742 ) ) ( not ( = ?auto_384740 ?auto_384743 ) ) ( not ( = ?auto_384740 ?auto_384744 ) ) ( not ( = ?auto_384740 ?auto_384745 ) ) ( not ( = ?auto_384740 ?auto_384746 ) ) ( not ( = ?auto_384740 ?auto_384747 ) ) ( not ( = ?auto_384740 ?auto_384748 ) ) ( not ( = ?auto_384740 ?auto_384749 ) ) ( not ( = ?auto_384740 ?auto_384750 ) ) ( not ( = ?auto_384740 ?auto_384751 ) ) ( not ( = ?auto_384740 ?auto_384752 ) ) ( not ( = ?auto_384741 ?auto_384742 ) ) ( not ( = ?auto_384741 ?auto_384743 ) ) ( not ( = ?auto_384741 ?auto_384744 ) ) ( not ( = ?auto_384741 ?auto_384745 ) ) ( not ( = ?auto_384741 ?auto_384746 ) ) ( not ( = ?auto_384741 ?auto_384747 ) ) ( not ( = ?auto_384741 ?auto_384748 ) ) ( not ( = ?auto_384741 ?auto_384749 ) ) ( not ( = ?auto_384741 ?auto_384750 ) ) ( not ( = ?auto_384741 ?auto_384751 ) ) ( not ( = ?auto_384741 ?auto_384752 ) ) ( not ( = ?auto_384742 ?auto_384743 ) ) ( not ( = ?auto_384742 ?auto_384744 ) ) ( not ( = ?auto_384742 ?auto_384745 ) ) ( not ( = ?auto_384742 ?auto_384746 ) ) ( not ( = ?auto_384742 ?auto_384747 ) ) ( not ( = ?auto_384742 ?auto_384748 ) ) ( not ( = ?auto_384742 ?auto_384749 ) ) ( not ( = ?auto_384742 ?auto_384750 ) ) ( not ( = ?auto_384742 ?auto_384751 ) ) ( not ( = ?auto_384742 ?auto_384752 ) ) ( not ( = ?auto_384743 ?auto_384744 ) ) ( not ( = ?auto_384743 ?auto_384745 ) ) ( not ( = ?auto_384743 ?auto_384746 ) ) ( not ( = ?auto_384743 ?auto_384747 ) ) ( not ( = ?auto_384743 ?auto_384748 ) ) ( not ( = ?auto_384743 ?auto_384749 ) ) ( not ( = ?auto_384743 ?auto_384750 ) ) ( not ( = ?auto_384743 ?auto_384751 ) ) ( not ( = ?auto_384743 ?auto_384752 ) ) ( not ( = ?auto_384744 ?auto_384745 ) ) ( not ( = ?auto_384744 ?auto_384746 ) ) ( not ( = ?auto_384744 ?auto_384747 ) ) ( not ( = ?auto_384744 ?auto_384748 ) ) ( not ( = ?auto_384744 ?auto_384749 ) ) ( not ( = ?auto_384744 ?auto_384750 ) ) ( not ( = ?auto_384744 ?auto_384751 ) ) ( not ( = ?auto_384744 ?auto_384752 ) ) ( not ( = ?auto_384745 ?auto_384746 ) ) ( not ( = ?auto_384745 ?auto_384747 ) ) ( not ( = ?auto_384745 ?auto_384748 ) ) ( not ( = ?auto_384745 ?auto_384749 ) ) ( not ( = ?auto_384745 ?auto_384750 ) ) ( not ( = ?auto_384745 ?auto_384751 ) ) ( not ( = ?auto_384745 ?auto_384752 ) ) ( not ( = ?auto_384746 ?auto_384747 ) ) ( not ( = ?auto_384746 ?auto_384748 ) ) ( not ( = ?auto_384746 ?auto_384749 ) ) ( not ( = ?auto_384746 ?auto_384750 ) ) ( not ( = ?auto_384746 ?auto_384751 ) ) ( not ( = ?auto_384746 ?auto_384752 ) ) ( not ( = ?auto_384747 ?auto_384748 ) ) ( not ( = ?auto_384747 ?auto_384749 ) ) ( not ( = ?auto_384747 ?auto_384750 ) ) ( not ( = ?auto_384747 ?auto_384751 ) ) ( not ( = ?auto_384747 ?auto_384752 ) ) ( not ( = ?auto_384748 ?auto_384749 ) ) ( not ( = ?auto_384748 ?auto_384750 ) ) ( not ( = ?auto_384748 ?auto_384751 ) ) ( not ( = ?auto_384748 ?auto_384752 ) ) ( not ( = ?auto_384749 ?auto_384750 ) ) ( not ( = ?auto_384749 ?auto_384751 ) ) ( not ( = ?auto_384749 ?auto_384752 ) ) ( not ( = ?auto_384750 ?auto_384751 ) ) ( not ( = ?auto_384750 ?auto_384752 ) ) ( not ( = ?auto_384751 ?auto_384752 ) ) ( ON ?auto_384750 ?auto_384751 ) ( ON ?auto_384749 ?auto_384750 ) ( ON ?auto_384748 ?auto_384749 ) ( ON ?auto_384747 ?auto_384748 ) ( ON ?auto_384746 ?auto_384747 ) ( ON ?auto_384745 ?auto_384746 ) ( ON ?auto_384744 ?auto_384745 ) ( ON ?auto_384743 ?auto_384744 ) ( CLEAR ?auto_384741 ) ( ON ?auto_384742 ?auto_384743 ) ( CLEAR ?auto_384742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_384739 ?auto_384740 ?auto_384741 ?auto_384742 )
      ( MAKE-13PILE ?auto_384739 ?auto_384740 ?auto_384741 ?auto_384742 ?auto_384743 ?auto_384744 ?auto_384745 ?auto_384746 ?auto_384747 ?auto_384748 ?auto_384749 ?auto_384750 ?auto_384751 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384766 - BLOCK
      ?auto_384767 - BLOCK
      ?auto_384768 - BLOCK
      ?auto_384769 - BLOCK
      ?auto_384770 - BLOCK
      ?auto_384771 - BLOCK
      ?auto_384772 - BLOCK
      ?auto_384773 - BLOCK
      ?auto_384774 - BLOCK
      ?auto_384775 - BLOCK
      ?auto_384776 - BLOCK
      ?auto_384777 - BLOCK
      ?auto_384778 - BLOCK
    )
    :vars
    (
      ?auto_384779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384778 ?auto_384779 ) ( ON-TABLE ?auto_384766 ) ( ON ?auto_384767 ?auto_384766 ) ( ON ?auto_384768 ?auto_384767 ) ( not ( = ?auto_384766 ?auto_384767 ) ) ( not ( = ?auto_384766 ?auto_384768 ) ) ( not ( = ?auto_384766 ?auto_384769 ) ) ( not ( = ?auto_384766 ?auto_384770 ) ) ( not ( = ?auto_384766 ?auto_384771 ) ) ( not ( = ?auto_384766 ?auto_384772 ) ) ( not ( = ?auto_384766 ?auto_384773 ) ) ( not ( = ?auto_384766 ?auto_384774 ) ) ( not ( = ?auto_384766 ?auto_384775 ) ) ( not ( = ?auto_384766 ?auto_384776 ) ) ( not ( = ?auto_384766 ?auto_384777 ) ) ( not ( = ?auto_384766 ?auto_384778 ) ) ( not ( = ?auto_384766 ?auto_384779 ) ) ( not ( = ?auto_384767 ?auto_384768 ) ) ( not ( = ?auto_384767 ?auto_384769 ) ) ( not ( = ?auto_384767 ?auto_384770 ) ) ( not ( = ?auto_384767 ?auto_384771 ) ) ( not ( = ?auto_384767 ?auto_384772 ) ) ( not ( = ?auto_384767 ?auto_384773 ) ) ( not ( = ?auto_384767 ?auto_384774 ) ) ( not ( = ?auto_384767 ?auto_384775 ) ) ( not ( = ?auto_384767 ?auto_384776 ) ) ( not ( = ?auto_384767 ?auto_384777 ) ) ( not ( = ?auto_384767 ?auto_384778 ) ) ( not ( = ?auto_384767 ?auto_384779 ) ) ( not ( = ?auto_384768 ?auto_384769 ) ) ( not ( = ?auto_384768 ?auto_384770 ) ) ( not ( = ?auto_384768 ?auto_384771 ) ) ( not ( = ?auto_384768 ?auto_384772 ) ) ( not ( = ?auto_384768 ?auto_384773 ) ) ( not ( = ?auto_384768 ?auto_384774 ) ) ( not ( = ?auto_384768 ?auto_384775 ) ) ( not ( = ?auto_384768 ?auto_384776 ) ) ( not ( = ?auto_384768 ?auto_384777 ) ) ( not ( = ?auto_384768 ?auto_384778 ) ) ( not ( = ?auto_384768 ?auto_384779 ) ) ( not ( = ?auto_384769 ?auto_384770 ) ) ( not ( = ?auto_384769 ?auto_384771 ) ) ( not ( = ?auto_384769 ?auto_384772 ) ) ( not ( = ?auto_384769 ?auto_384773 ) ) ( not ( = ?auto_384769 ?auto_384774 ) ) ( not ( = ?auto_384769 ?auto_384775 ) ) ( not ( = ?auto_384769 ?auto_384776 ) ) ( not ( = ?auto_384769 ?auto_384777 ) ) ( not ( = ?auto_384769 ?auto_384778 ) ) ( not ( = ?auto_384769 ?auto_384779 ) ) ( not ( = ?auto_384770 ?auto_384771 ) ) ( not ( = ?auto_384770 ?auto_384772 ) ) ( not ( = ?auto_384770 ?auto_384773 ) ) ( not ( = ?auto_384770 ?auto_384774 ) ) ( not ( = ?auto_384770 ?auto_384775 ) ) ( not ( = ?auto_384770 ?auto_384776 ) ) ( not ( = ?auto_384770 ?auto_384777 ) ) ( not ( = ?auto_384770 ?auto_384778 ) ) ( not ( = ?auto_384770 ?auto_384779 ) ) ( not ( = ?auto_384771 ?auto_384772 ) ) ( not ( = ?auto_384771 ?auto_384773 ) ) ( not ( = ?auto_384771 ?auto_384774 ) ) ( not ( = ?auto_384771 ?auto_384775 ) ) ( not ( = ?auto_384771 ?auto_384776 ) ) ( not ( = ?auto_384771 ?auto_384777 ) ) ( not ( = ?auto_384771 ?auto_384778 ) ) ( not ( = ?auto_384771 ?auto_384779 ) ) ( not ( = ?auto_384772 ?auto_384773 ) ) ( not ( = ?auto_384772 ?auto_384774 ) ) ( not ( = ?auto_384772 ?auto_384775 ) ) ( not ( = ?auto_384772 ?auto_384776 ) ) ( not ( = ?auto_384772 ?auto_384777 ) ) ( not ( = ?auto_384772 ?auto_384778 ) ) ( not ( = ?auto_384772 ?auto_384779 ) ) ( not ( = ?auto_384773 ?auto_384774 ) ) ( not ( = ?auto_384773 ?auto_384775 ) ) ( not ( = ?auto_384773 ?auto_384776 ) ) ( not ( = ?auto_384773 ?auto_384777 ) ) ( not ( = ?auto_384773 ?auto_384778 ) ) ( not ( = ?auto_384773 ?auto_384779 ) ) ( not ( = ?auto_384774 ?auto_384775 ) ) ( not ( = ?auto_384774 ?auto_384776 ) ) ( not ( = ?auto_384774 ?auto_384777 ) ) ( not ( = ?auto_384774 ?auto_384778 ) ) ( not ( = ?auto_384774 ?auto_384779 ) ) ( not ( = ?auto_384775 ?auto_384776 ) ) ( not ( = ?auto_384775 ?auto_384777 ) ) ( not ( = ?auto_384775 ?auto_384778 ) ) ( not ( = ?auto_384775 ?auto_384779 ) ) ( not ( = ?auto_384776 ?auto_384777 ) ) ( not ( = ?auto_384776 ?auto_384778 ) ) ( not ( = ?auto_384776 ?auto_384779 ) ) ( not ( = ?auto_384777 ?auto_384778 ) ) ( not ( = ?auto_384777 ?auto_384779 ) ) ( not ( = ?auto_384778 ?auto_384779 ) ) ( ON ?auto_384777 ?auto_384778 ) ( ON ?auto_384776 ?auto_384777 ) ( ON ?auto_384775 ?auto_384776 ) ( ON ?auto_384774 ?auto_384775 ) ( ON ?auto_384773 ?auto_384774 ) ( ON ?auto_384772 ?auto_384773 ) ( ON ?auto_384771 ?auto_384772 ) ( ON ?auto_384770 ?auto_384771 ) ( CLEAR ?auto_384768 ) ( ON ?auto_384769 ?auto_384770 ) ( CLEAR ?auto_384769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_384766 ?auto_384767 ?auto_384768 ?auto_384769 )
      ( MAKE-13PILE ?auto_384766 ?auto_384767 ?auto_384768 ?auto_384769 ?auto_384770 ?auto_384771 ?auto_384772 ?auto_384773 ?auto_384774 ?auto_384775 ?auto_384776 ?auto_384777 ?auto_384778 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384793 - BLOCK
      ?auto_384794 - BLOCK
      ?auto_384795 - BLOCK
      ?auto_384796 - BLOCK
      ?auto_384797 - BLOCK
      ?auto_384798 - BLOCK
      ?auto_384799 - BLOCK
      ?auto_384800 - BLOCK
      ?auto_384801 - BLOCK
      ?auto_384802 - BLOCK
      ?auto_384803 - BLOCK
      ?auto_384804 - BLOCK
      ?auto_384805 - BLOCK
    )
    :vars
    (
      ?auto_384806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384805 ?auto_384806 ) ( ON-TABLE ?auto_384793 ) ( ON ?auto_384794 ?auto_384793 ) ( not ( = ?auto_384793 ?auto_384794 ) ) ( not ( = ?auto_384793 ?auto_384795 ) ) ( not ( = ?auto_384793 ?auto_384796 ) ) ( not ( = ?auto_384793 ?auto_384797 ) ) ( not ( = ?auto_384793 ?auto_384798 ) ) ( not ( = ?auto_384793 ?auto_384799 ) ) ( not ( = ?auto_384793 ?auto_384800 ) ) ( not ( = ?auto_384793 ?auto_384801 ) ) ( not ( = ?auto_384793 ?auto_384802 ) ) ( not ( = ?auto_384793 ?auto_384803 ) ) ( not ( = ?auto_384793 ?auto_384804 ) ) ( not ( = ?auto_384793 ?auto_384805 ) ) ( not ( = ?auto_384793 ?auto_384806 ) ) ( not ( = ?auto_384794 ?auto_384795 ) ) ( not ( = ?auto_384794 ?auto_384796 ) ) ( not ( = ?auto_384794 ?auto_384797 ) ) ( not ( = ?auto_384794 ?auto_384798 ) ) ( not ( = ?auto_384794 ?auto_384799 ) ) ( not ( = ?auto_384794 ?auto_384800 ) ) ( not ( = ?auto_384794 ?auto_384801 ) ) ( not ( = ?auto_384794 ?auto_384802 ) ) ( not ( = ?auto_384794 ?auto_384803 ) ) ( not ( = ?auto_384794 ?auto_384804 ) ) ( not ( = ?auto_384794 ?auto_384805 ) ) ( not ( = ?auto_384794 ?auto_384806 ) ) ( not ( = ?auto_384795 ?auto_384796 ) ) ( not ( = ?auto_384795 ?auto_384797 ) ) ( not ( = ?auto_384795 ?auto_384798 ) ) ( not ( = ?auto_384795 ?auto_384799 ) ) ( not ( = ?auto_384795 ?auto_384800 ) ) ( not ( = ?auto_384795 ?auto_384801 ) ) ( not ( = ?auto_384795 ?auto_384802 ) ) ( not ( = ?auto_384795 ?auto_384803 ) ) ( not ( = ?auto_384795 ?auto_384804 ) ) ( not ( = ?auto_384795 ?auto_384805 ) ) ( not ( = ?auto_384795 ?auto_384806 ) ) ( not ( = ?auto_384796 ?auto_384797 ) ) ( not ( = ?auto_384796 ?auto_384798 ) ) ( not ( = ?auto_384796 ?auto_384799 ) ) ( not ( = ?auto_384796 ?auto_384800 ) ) ( not ( = ?auto_384796 ?auto_384801 ) ) ( not ( = ?auto_384796 ?auto_384802 ) ) ( not ( = ?auto_384796 ?auto_384803 ) ) ( not ( = ?auto_384796 ?auto_384804 ) ) ( not ( = ?auto_384796 ?auto_384805 ) ) ( not ( = ?auto_384796 ?auto_384806 ) ) ( not ( = ?auto_384797 ?auto_384798 ) ) ( not ( = ?auto_384797 ?auto_384799 ) ) ( not ( = ?auto_384797 ?auto_384800 ) ) ( not ( = ?auto_384797 ?auto_384801 ) ) ( not ( = ?auto_384797 ?auto_384802 ) ) ( not ( = ?auto_384797 ?auto_384803 ) ) ( not ( = ?auto_384797 ?auto_384804 ) ) ( not ( = ?auto_384797 ?auto_384805 ) ) ( not ( = ?auto_384797 ?auto_384806 ) ) ( not ( = ?auto_384798 ?auto_384799 ) ) ( not ( = ?auto_384798 ?auto_384800 ) ) ( not ( = ?auto_384798 ?auto_384801 ) ) ( not ( = ?auto_384798 ?auto_384802 ) ) ( not ( = ?auto_384798 ?auto_384803 ) ) ( not ( = ?auto_384798 ?auto_384804 ) ) ( not ( = ?auto_384798 ?auto_384805 ) ) ( not ( = ?auto_384798 ?auto_384806 ) ) ( not ( = ?auto_384799 ?auto_384800 ) ) ( not ( = ?auto_384799 ?auto_384801 ) ) ( not ( = ?auto_384799 ?auto_384802 ) ) ( not ( = ?auto_384799 ?auto_384803 ) ) ( not ( = ?auto_384799 ?auto_384804 ) ) ( not ( = ?auto_384799 ?auto_384805 ) ) ( not ( = ?auto_384799 ?auto_384806 ) ) ( not ( = ?auto_384800 ?auto_384801 ) ) ( not ( = ?auto_384800 ?auto_384802 ) ) ( not ( = ?auto_384800 ?auto_384803 ) ) ( not ( = ?auto_384800 ?auto_384804 ) ) ( not ( = ?auto_384800 ?auto_384805 ) ) ( not ( = ?auto_384800 ?auto_384806 ) ) ( not ( = ?auto_384801 ?auto_384802 ) ) ( not ( = ?auto_384801 ?auto_384803 ) ) ( not ( = ?auto_384801 ?auto_384804 ) ) ( not ( = ?auto_384801 ?auto_384805 ) ) ( not ( = ?auto_384801 ?auto_384806 ) ) ( not ( = ?auto_384802 ?auto_384803 ) ) ( not ( = ?auto_384802 ?auto_384804 ) ) ( not ( = ?auto_384802 ?auto_384805 ) ) ( not ( = ?auto_384802 ?auto_384806 ) ) ( not ( = ?auto_384803 ?auto_384804 ) ) ( not ( = ?auto_384803 ?auto_384805 ) ) ( not ( = ?auto_384803 ?auto_384806 ) ) ( not ( = ?auto_384804 ?auto_384805 ) ) ( not ( = ?auto_384804 ?auto_384806 ) ) ( not ( = ?auto_384805 ?auto_384806 ) ) ( ON ?auto_384804 ?auto_384805 ) ( ON ?auto_384803 ?auto_384804 ) ( ON ?auto_384802 ?auto_384803 ) ( ON ?auto_384801 ?auto_384802 ) ( ON ?auto_384800 ?auto_384801 ) ( ON ?auto_384799 ?auto_384800 ) ( ON ?auto_384798 ?auto_384799 ) ( ON ?auto_384797 ?auto_384798 ) ( ON ?auto_384796 ?auto_384797 ) ( CLEAR ?auto_384794 ) ( ON ?auto_384795 ?auto_384796 ) ( CLEAR ?auto_384795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_384793 ?auto_384794 ?auto_384795 )
      ( MAKE-13PILE ?auto_384793 ?auto_384794 ?auto_384795 ?auto_384796 ?auto_384797 ?auto_384798 ?auto_384799 ?auto_384800 ?auto_384801 ?auto_384802 ?auto_384803 ?auto_384804 ?auto_384805 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384820 - BLOCK
      ?auto_384821 - BLOCK
      ?auto_384822 - BLOCK
      ?auto_384823 - BLOCK
      ?auto_384824 - BLOCK
      ?auto_384825 - BLOCK
      ?auto_384826 - BLOCK
      ?auto_384827 - BLOCK
      ?auto_384828 - BLOCK
      ?auto_384829 - BLOCK
      ?auto_384830 - BLOCK
      ?auto_384831 - BLOCK
      ?auto_384832 - BLOCK
    )
    :vars
    (
      ?auto_384833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384832 ?auto_384833 ) ( ON-TABLE ?auto_384820 ) ( ON ?auto_384821 ?auto_384820 ) ( not ( = ?auto_384820 ?auto_384821 ) ) ( not ( = ?auto_384820 ?auto_384822 ) ) ( not ( = ?auto_384820 ?auto_384823 ) ) ( not ( = ?auto_384820 ?auto_384824 ) ) ( not ( = ?auto_384820 ?auto_384825 ) ) ( not ( = ?auto_384820 ?auto_384826 ) ) ( not ( = ?auto_384820 ?auto_384827 ) ) ( not ( = ?auto_384820 ?auto_384828 ) ) ( not ( = ?auto_384820 ?auto_384829 ) ) ( not ( = ?auto_384820 ?auto_384830 ) ) ( not ( = ?auto_384820 ?auto_384831 ) ) ( not ( = ?auto_384820 ?auto_384832 ) ) ( not ( = ?auto_384820 ?auto_384833 ) ) ( not ( = ?auto_384821 ?auto_384822 ) ) ( not ( = ?auto_384821 ?auto_384823 ) ) ( not ( = ?auto_384821 ?auto_384824 ) ) ( not ( = ?auto_384821 ?auto_384825 ) ) ( not ( = ?auto_384821 ?auto_384826 ) ) ( not ( = ?auto_384821 ?auto_384827 ) ) ( not ( = ?auto_384821 ?auto_384828 ) ) ( not ( = ?auto_384821 ?auto_384829 ) ) ( not ( = ?auto_384821 ?auto_384830 ) ) ( not ( = ?auto_384821 ?auto_384831 ) ) ( not ( = ?auto_384821 ?auto_384832 ) ) ( not ( = ?auto_384821 ?auto_384833 ) ) ( not ( = ?auto_384822 ?auto_384823 ) ) ( not ( = ?auto_384822 ?auto_384824 ) ) ( not ( = ?auto_384822 ?auto_384825 ) ) ( not ( = ?auto_384822 ?auto_384826 ) ) ( not ( = ?auto_384822 ?auto_384827 ) ) ( not ( = ?auto_384822 ?auto_384828 ) ) ( not ( = ?auto_384822 ?auto_384829 ) ) ( not ( = ?auto_384822 ?auto_384830 ) ) ( not ( = ?auto_384822 ?auto_384831 ) ) ( not ( = ?auto_384822 ?auto_384832 ) ) ( not ( = ?auto_384822 ?auto_384833 ) ) ( not ( = ?auto_384823 ?auto_384824 ) ) ( not ( = ?auto_384823 ?auto_384825 ) ) ( not ( = ?auto_384823 ?auto_384826 ) ) ( not ( = ?auto_384823 ?auto_384827 ) ) ( not ( = ?auto_384823 ?auto_384828 ) ) ( not ( = ?auto_384823 ?auto_384829 ) ) ( not ( = ?auto_384823 ?auto_384830 ) ) ( not ( = ?auto_384823 ?auto_384831 ) ) ( not ( = ?auto_384823 ?auto_384832 ) ) ( not ( = ?auto_384823 ?auto_384833 ) ) ( not ( = ?auto_384824 ?auto_384825 ) ) ( not ( = ?auto_384824 ?auto_384826 ) ) ( not ( = ?auto_384824 ?auto_384827 ) ) ( not ( = ?auto_384824 ?auto_384828 ) ) ( not ( = ?auto_384824 ?auto_384829 ) ) ( not ( = ?auto_384824 ?auto_384830 ) ) ( not ( = ?auto_384824 ?auto_384831 ) ) ( not ( = ?auto_384824 ?auto_384832 ) ) ( not ( = ?auto_384824 ?auto_384833 ) ) ( not ( = ?auto_384825 ?auto_384826 ) ) ( not ( = ?auto_384825 ?auto_384827 ) ) ( not ( = ?auto_384825 ?auto_384828 ) ) ( not ( = ?auto_384825 ?auto_384829 ) ) ( not ( = ?auto_384825 ?auto_384830 ) ) ( not ( = ?auto_384825 ?auto_384831 ) ) ( not ( = ?auto_384825 ?auto_384832 ) ) ( not ( = ?auto_384825 ?auto_384833 ) ) ( not ( = ?auto_384826 ?auto_384827 ) ) ( not ( = ?auto_384826 ?auto_384828 ) ) ( not ( = ?auto_384826 ?auto_384829 ) ) ( not ( = ?auto_384826 ?auto_384830 ) ) ( not ( = ?auto_384826 ?auto_384831 ) ) ( not ( = ?auto_384826 ?auto_384832 ) ) ( not ( = ?auto_384826 ?auto_384833 ) ) ( not ( = ?auto_384827 ?auto_384828 ) ) ( not ( = ?auto_384827 ?auto_384829 ) ) ( not ( = ?auto_384827 ?auto_384830 ) ) ( not ( = ?auto_384827 ?auto_384831 ) ) ( not ( = ?auto_384827 ?auto_384832 ) ) ( not ( = ?auto_384827 ?auto_384833 ) ) ( not ( = ?auto_384828 ?auto_384829 ) ) ( not ( = ?auto_384828 ?auto_384830 ) ) ( not ( = ?auto_384828 ?auto_384831 ) ) ( not ( = ?auto_384828 ?auto_384832 ) ) ( not ( = ?auto_384828 ?auto_384833 ) ) ( not ( = ?auto_384829 ?auto_384830 ) ) ( not ( = ?auto_384829 ?auto_384831 ) ) ( not ( = ?auto_384829 ?auto_384832 ) ) ( not ( = ?auto_384829 ?auto_384833 ) ) ( not ( = ?auto_384830 ?auto_384831 ) ) ( not ( = ?auto_384830 ?auto_384832 ) ) ( not ( = ?auto_384830 ?auto_384833 ) ) ( not ( = ?auto_384831 ?auto_384832 ) ) ( not ( = ?auto_384831 ?auto_384833 ) ) ( not ( = ?auto_384832 ?auto_384833 ) ) ( ON ?auto_384831 ?auto_384832 ) ( ON ?auto_384830 ?auto_384831 ) ( ON ?auto_384829 ?auto_384830 ) ( ON ?auto_384828 ?auto_384829 ) ( ON ?auto_384827 ?auto_384828 ) ( ON ?auto_384826 ?auto_384827 ) ( ON ?auto_384825 ?auto_384826 ) ( ON ?auto_384824 ?auto_384825 ) ( ON ?auto_384823 ?auto_384824 ) ( CLEAR ?auto_384821 ) ( ON ?auto_384822 ?auto_384823 ) ( CLEAR ?auto_384822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_384820 ?auto_384821 ?auto_384822 )
      ( MAKE-13PILE ?auto_384820 ?auto_384821 ?auto_384822 ?auto_384823 ?auto_384824 ?auto_384825 ?auto_384826 ?auto_384827 ?auto_384828 ?auto_384829 ?auto_384830 ?auto_384831 ?auto_384832 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384847 - BLOCK
      ?auto_384848 - BLOCK
      ?auto_384849 - BLOCK
      ?auto_384850 - BLOCK
      ?auto_384851 - BLOCK
      ?auto_384852 - BLOCK
      ?auto_384853 - BLOCK
      ?auto_384854 - BLOCK
      ?auto_384855 - BLOCK
      ?auto_384856 - BLOCK
      ?auto_384857 - BLOCK
      ?auto_384858 - BLOCK
      ?auto_384859 - BLOCK
    )
    :vars
    (
      ?auto_384860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384859 ?auto_384860 ) ( ON-TABLE ?auto_384847 ) ( not ( = ?auto_384847 ?auto_384848 ) ) ( not ( = ?auto_384847 ?auto_384849 ) ) ( not ( = ?auto_384847 ?auto_384850 ) ) ( not ( = ?auto_384847 ?auto_384851 ) ) ( not ( = ?auto_384847 ?auto_384852 ) ) ( not ( = ?auto_384847 ?auto_384853 ) ) ( not ( = ?auto_384847 ?auto_384854 ) ) ( not ( = ?auto_384847 ?auto_384855 ) ) ( not ( = ?auto_384847 ?auto_384856 ) ) ( not ( = ?auto_384847 ?auto_384857 ) ) ( not ( = ?auto_384847 ?auto_384858 ) ) ( not ( = ?auto_384847 ?auto_384859 ) ) ( not ( = ?auto_384847 ?auto_384860 ) ) ( not ( = ?auto_384848 ?auto_384849 ) ) ( not ( = ?auto_384848 ?auto_384850 ) ) ( not ( = ?auto_384848 ?auto_384851 ) ) ( not ( = ?auto_384848 ?auto_384852 ) ) ( not ( = ?auto_384848 ?auto_384853 ) ) ( not ( = ?auto_384848 ?auto_384854 ) ) ( not ( = ?auto_384848 ?auto_384855 ) ) ( not ( = ?auto_384848 ?auto_384856 ) ) ( not ( = ?auto_384848 ?auto_384857 ) ) ( not ( = ?auto_384848 ?auto_384858 ) ) ( not ( = ?auto_384848 ?auto_384859 ) ) ( not ( = ?auto_384848 ?auto_384860 ) ) ( not ( = ?auto_384849 ?auto_384850 ) ) ( not ( = ?auto_384849 ?auto_384851 ) ) ( not ( = ?auto_384849 ?auto_384852 ) ) ( not ( = ?auto_384849 ?auto_384853 ) ) ( not ( = ?auto_384849 ?auto_384854 ) ) ( not ( = ?auto_384849 ?auto_384855 ) ) ( not ( = ?auto_384849 ?auto_384856 ) ) ( not ( = ?auto_384849 ?auto_384857 ) ) ( not ( = ?auto_384849 ?auto_384858 ) ) ( not ( = ?auto_384849 ?auto_384859 ) ) ( not ( = ?auto_384849 ?auto_384860 ) ) ( not ( = ?auto_384850 ?auto_384851 ) ) ( not ( = ?auto_384850 ?auto_384852 ) ) ( not ( = ?auto_384850 ?auto_384853 ) ) ( not ( = ?auto_384850 ?auto_384854 ) ) ( not ( = ?auto_384850 ?auto_384855 ) ) ( not ( = ?auto_384850 ?auto_384856 ) ) ( not ( = ?auto_384850 ?auto_384857 ) ) ( not ( = ?auto_384850 ?auto_384858 ) ) ( not ( = ?auto_384850 ?auto_384859 ) ) ( not ( = ?auto_384850 ?auto_384860 ) ) ( not ( = ?auto_384851 ?auto_384852 ) ) ( not ( = ?auto_384851 ?auto_384853 ) ) ( not ( = ?auto_384851 ?auto_384854 ) ) ( not ( = ?auto_384851 ?auto_384855 ) ) ( not ( = ?auto_384851 ?auto_384856 ) ) ( not ( = ?auto_384851 ?auto_384857 ) ) ( not ( = ?auto_384851 ?auto_384858 ) ) ( not ( = ?auto_384851 ?auto_384859 ) ) ( not ( = ?auto_384851 ?auto_384860 ) ) ( not ( = ?auto_384852 ?auto_384853 ) ) ( not ( = ?auto_384852 ?auto_384854 ) ) ( not ( = ?auto_384852 ?auto_384855 ) ) ( not ( = ?auto_384852 ?auto_384856 ) ) ( not ( = ?auto_384852 ?auto_384857 ) ) ( not ( = ?auto_384852 ?auto_384858 ) ) ( not ( = ?auto_384852 ?auto_384859 ) ) ( not ( = ?auto_384852 ?auto_384860 ) ) ( not ( = ?auto_384853 ?auto_384854 ) ) ( not ( = ?auto_384853 ?auto_384855 ) ) ( not ( = ?auto_384853 ?auto_384856 ) ) ( not ( = ?auto_384853 ?auto_384857 ) ) ( not ( = ?auto_384853 ?auto_384858 ) ) ( not ( = ?auto_384853 ?auto_384859 ) ) ( not ( = ?auto_384853 ?auto_384860 ) ) ( not ( = ?auto_384854 ?auto_384855 ) ) ( not ( = ?auto_384854 ?auto_384856 ) ) ( not ( = ?auto_384854 ?auto_384857 ) ) ( not ( = ?auto_384854 ?auto_384858 ) ) ( not ( = ?auto_384854 ?auto_384859 ) ) ( not ( = ?auto_384854 ?auto_384860 ) ) ( not ( = ?auto_384855 ?auto_384856 ) ) ( not ( = ?auto_384855 ?auto_384857 ) ) ( not ( = ?auto_384855 ?auto_384858 ) ) ( not ( = ?auto_384855 ?auto_384859 ) ) ( not ( = ?auto_384855 ?auto_384860 ) ) ( not ( = ?auto_384856 ?auto_384857 ) ) ( not ( = ?auto_384856 ?auto_384858 ) ) ( not ( = ?auto_384856 ?auto_384859 ) ) ( not ( = ?auto_384856 ?auto_384860 ) ) ( not ( = ?auto_384857 ?auto_384858 ) ) ( not ( = ?auto_384857 ?auto_384859 ) ) ( not ( = ?auto_384857 ?auto_384860 ) ) ( not ( = ?auto_384858 ?auto_384859 ) ) ( not ( = ?auto_384858 ?auto_384860 ) ) ( not ( = ?auto_384859 ?auto_384860 ) ) ( ON ?auto_384858 ?auto_384859 ) ( ON ?auto_384857 ?auto_384858 ) ( ON ?auto_384856 ?auto_384857 ) ( ON ?auto_384855 ?auto_384856 ) ( ON ?auto_384854 ?auto_384855 ) ( ON ?auto_384853 ?auto_384854 ) ( ON ?auto_384852 ?auto_384853 ) ( ON ?auto_384851 ?auto_384852 ) ( ON ?auto_384850 ?auto_384851 ) ( ON ?auto_384849 ?auto_384850 ) ( CLEAR ?auto_384847 ) ( ON ?auto_384848 ?auto_384849 ) ( CLEAR ?auto_384848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_384847 ?auto_384848 )
      ( MAKE-13PILE ?auto_384847 ?auto_384848 ?auto_384849 ?auto_384850 ?auto_384851 ?auto_384852 ?auto_384853 ?auto_384854 ?auto_384855 ?auto_384856 ?auto_384857 ?auto_384858 ?auto_384859 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384874 - BLOCK
      ?auto_384875 - BLOCK
      ?auto_384876 - BLOCK
      ?auto_384877 - BLOCK
      ?auto_384878 - BLOCK
      ?auto_384879 - BLOCK
      ?auto_384880 - BLOCK
      ?auto_384881 - BLOCK
      ?auto_384882 - BLOCK
      ?auto_384883 - BLOCK
      ?auto_384884 - BLOCK
      ?auto_384885 - BLOCK
      ?auto_384886 - BLOCK
    )
    :vars
    (
      ?auto_384887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384886 ?auto_384887 ) ( ON-TABLE ?auto_384874 ) ( not ( = ?auto_384874 ?auto_384875 ) ) ( not ( = ?auto_384874 ?auto_384876 ) ) ( not ( = ?auto_384874 ?auto_384877 ) ) ( not ( = ?auto_384874 ?auto_384878 ) ) ( not ( = ?auto_384874 ?auto_384879 ) ) ( not ( = ?auto_384874 ?auto_384880 ) ) ( not ( = ?auto_384874 ?auto_384881 ) ) ( not ( = ?auto_384874 ?auto_384882 ) ) ( not ( = ?auto_384874 ?auto_384883 ) ) ( not ( = ?auto_384874 ?auto_384884 ) ) ( not ( = ?auto_384874 ?auto_384885 ) ) ( not ( = ?auto_384874 ?auto_384886 ) ) ( not ( = ?auto_384874 ?auto_384887 ) ) ( not ( = ?auto_384875 ?auto_384876 ) ) ( not ( = ?auto_384875 ?auto_384877 ) ) ( not ( = ?auto_384875 ?auto_384878 ) ) ( not ( = ?auto_384875 ?auto_384879 ) ) ( not ( = ?auto_384875 ?auto_384880 ) ) ( not ( = ?auto_384875 ?auto_384881 ) ) ( not ( = ?auto_384875 ?auto_384882 ) ) ( not ( = ?auto_384875 ?auto_384883 ) ) ( not ( = ?auto_384875 ?auto_384884 ) ) ( not ( = ?auto_384875 ?auto_384885 ) ) ( not ( = ?auto_384875 ?auto_384886 ) ) ( not ( = ?auto_384875 ?auto_384887 ) ) ( not ( = ?auto_384876 ?auto_384877 ) ) ( not ( = ?auto_384876 ?auto_384878 ) ) ( not ( = ?auto_384876 ?auto_384879 ) ) ( not ( = ?auto_384876 ?auto_384880 ) ) ( not ( = ?auto_384876 ?auto_384881 ) ) ( not ( = ?auto_384876 ?auto_384882 ) ) ( not ( = ?auto_384876 ?auto_384883 ) ) ( not ( = ?auto_384876 ?auto_384884 ) ) ( not ( = ?auto_384876 ?auto_384885 ) ) ( not ( = ?auto_384876 ?auto_384886 ) ) ( not ( = ?auto_384876 ?auto_384887 ) ) ( not ( = ?auto_384877 ?auto_384878 ) ) ( not ( = ?auto_384877 ?auto_384879 ) ) ( not ( = ?auto_384877 ?auto_384880 ) ) ( not ( = ?auto_384877 ?auto_384881 ) ) ( not ( = ?auto_384877 ?auto_384882 ) ) ( not ( = ?auto_384877 ?auto_384883 ) ) ( not ( = ?auto_384877 ?auto_384884 ) ) ( not ( = ?auto_384877 ?auto_384885 ) ) ( not ( = ?auto_384877 ?auto_384886 ) ) ( not ( = ?auto_384877 ?auto_384887 ) ) ( not ( = ?auto_384878 ?auto_384879 ) ) ( not ( = ?auto_384878 ?auto_384880 ) ) ( not ( = ?auto_384878 ?auto_384881 ) ) ( not ( = ?auto_384878 ?auto_384882 ) ) ( not ( = ?auto_384878 ?auto_384883 ) ) ( not ( = ?auto_384878 ?auto_384884 ) ) ( not ( = ?auto_384878 ?auto_384885 ) ) ( not ( = ?auto_384878 ?auto_384886 ) ) ( not ( = ?auto_384878 ?auto_384887 ) ) ( not ( = ?auto_384879 ?auto_384880 ) ) ( not ( = ?auto_384879 ?auto_384881 ) ) ( not ( = ?auto_384879 ?auto_384882 ) ) ( not ( = ?auto_384879 ?auto_384883 ) ) ( not ( = ?auto_384879 ?auto_384884 ) ) ( not ( = ?auto_384879 ?auto_384885 ) ) ( not ( = ?auto_384879 ?auto_384886 ) ) ( not ( = ?auto_384879 ?auto_384887 ) ) ( not ( = ?auto_384880 ?auto_384881 ) ) ( not ( = ?auto_384880 ?auto_384882 ) ) ( not ( = ?auto_384880 ?auto_384883 ) ) ( not ( = ?auto_384880 ?auto_384884 ) ) ( not ( = ?auto_384880 ?auto_384885 ) ) ( not ( = ?auto_384880 ?auto_384886 ) ) ( not ( = ?auto_384880 ?auto_384887 ) ) ( not ( = ?auto_384881 ?auto_384882 ) ) ( not ( = ?auto_384881 ?auto_384883 ) ) ( not ( = ?auto_384881 ?auto_384884 ) ) ( not ( = ?auto_384881 ?auto_384885 ) ) ( not ( = ?auto_384881 ?auto_384886 ) ) ( not ( = ?auto_384881 ?auto_384887 ) ) ( not ( = ?auto_384882 ?auto_384883 ) ) ( not ( = ?auto_384882 ?auto_384884 ) ) ( not ( = ?auto_384882 ?auto_384885 ) ) ( not ( = ?auto_384882 ?auto_384886 ) ) ( not ( = ?auto_384882 ?auto_384887 ) ) ( not ( = ?auto_384883 ?auto_384884 ) ) ( not ( = ?auto_384883 ?auto_384885 ) ) ( not ( = ?auto_384883 ?auto_384886 ) ) ( not ( = ?auto_384883 ?auto_384887 ) ) ( not ( = ?auto_384884 ?auto_384885 ) ) ( not ( = ?auto_384884 ?auto_384886 ) ) ( not ( = ?auto_384884 ?auto_384887 ) ) ( not ( = ?auto_384885 ?auto_384886 ) ) ( not ( = ?auto_384885 ?auto_384887 ) ) ( not ( = ?auto_384886 ?auto_384887 ) ) ( ON ?auto_384885 ?auto_384886 ) ( ON ?auto_384884 ?auto_384885 ) ( ON ?auto_384883 ?auto_384884 ) ( ON ?auto_384882 ?auto_384883 ) ( ON ?auto_384881 ?auto_384882 ) ( ON ?auto_384880 ?auto_384881 ) ( ON ?auto_384879 ?auto_384880 ) ( ON ?auto_384878 ?auto_384879 ) ( ON ?auto_384877 ?auto_384878 ) ( ON ?auto_384876 ?auto_384877 ) ( CLEAR ?auto_384874 ) ( ON ?auto_384875 ?auto_384876 ) ( CLEAR ?auto_384875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_384874 ?auto_384875 )
      ( MAKE-13PILE ?auto_384874 ?auto_384875 ?auto_384876 ?auto_384877 ?auto_384878 ?auto_384879 ?auto_384880 ?auto_384881 ?auto_384882 ?auto_384883 ?auto_384884 ?auto_384885 ?auto_384886 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384901 - BLOCK
      ?auto_384902 - BLOCK
      ?auto_384903 - BLOCK
      ?auto_384904 - BLOCK
      ?auto_384905 - BLOCK
      ?auto_384906 - BLOCK
      ?auto_384907 - BLOCK
      ?auto_384908 - BLOCK
      ?auto_384909 - BLOCK
      ?auto_384910 - BLOCK
      ?auto_384911 - BLOCK
      ?auto_384912 - BLOCK
      ?auto_384913 - BLOCK
    )
    :vars
    (
      ?auto_384914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384913 ?auto_384914 ) ( not ( = ?auto_384901 ?auto_384902 ) ) ( not ( = ?auto_384901 ?auto_384903 ) ) ( not ( = ?auto_384901 ?auto_384904 ) ) ( not ( = ?auto_384901 ?auto_384905 ) ) ( not ( = ?auto_384901 ?auto_384906 ) ) ( not ( = ?auto_384901 ?auto_384907 ) ) ( not ( = ?auto_384901 ?auto_384908 ) ) ( not ( = ?auto_384901 ?auto_384909 ) ) ( not ( = ?auto_384901 ?auto_384910 ) ) ( not ( = ?auto_384901 ?auto_384911 ) ) ( not ( = ?auto_384901 ?auto_384912 ) ) ( not ( = ?auto_384901 ?auto_384913 ) ) ( not ( = ?auto_384901 ?auto_384914 ) ) ( not ( = ?auto_384902 ?auto_384903 ) ) ( not ( = ?auto_384902 ?auto_384904 ) ) ( not ( = ?auto_384902 ?auto_384905 ) ) ( not ( = ?auto_384902 ?auto_384906 ) ) ( not ( = ?auto_384902 ?auto_384907 ) ) ( not ( = ?auto_384902 ?auto_384908 ) ) ( not ( = ?auto_384902 ?auto_384909 ) ) ( not ( = ?auto_384902 ?auto_384910 ) ) ( not ( = ?auto_384902 ?auto_384911 ) ) ( not ( = ?auto_384902 ?auto_384912 ) ) ( not ( = ?auto_384902 ?auto_384913 ) ) ( not ( = ?auto_384902 ?auto_384914 ) ) ( not ( = ?auto_384903 ?auto_384904 ) ) ( not ( = ?auto_384903 ?auto_384905 ) ) ( not ( = ?auto_384903 ?auto_384906 ) ) ( not ( = ?auto_384903 ?auto_384907 ) ) ( not ( = ?auto_384903 ?auto_384908 ) ) ( not ( = ?auto_384903 ?auto_384909 ) ) ( not ( = ?auto_384903 ?auto_384910 ) ) ( not ( = ?auto_384903 ?auto_384911 ) ) ( not ( = ?auto_384903 ?auto_384912 ) ) ( not ( = ?auto_384903 ?auto_384913 ) ) ( not ( = ?auto_384903 ?auto_384914 ) ) ( not ( = ?auto_384904 ?auto_384905 ) ) ( not ( = ?auto_384904 ?auto_384906 ) ) ( not ( = ?auto_384904 ?auto_384907 ) ) ( not ( = ?auto_384904 ?auto_384908 ) ) ( not ( = ?auto_384904 ?auto_384909 ) ) ( not ( = ?auto_384904 ?auto_384910 ) ) ( not ( = ?auto_384904 ?auto_384911 ) ) ( not ( = ?auto_384904 ?auto_384912 ) ) ( not ( = ?auto_384904 ?auto_384913 ) ) ( not ( = ?auto_384904 ?auto_384914 ) ) ( not ( = ?auto_384905 ?auto_384906 ) ) ( not ( = ?auto_384905 ?auto_384907 ) ) ( not ( = ?auto_384905 ?auto_384908 ) ) ( not ( = ?auto_384905 ?auto_384909 ) ) ( not ( = ?auto_384905 ?auto_384910 ) ) ( not ( = ?auto_384905 ?auto_384911 ) ) ( not ( = ?auto_384905 ?auto_384912 ) ) ( not ( = ?auto_384905 ?auto_384913 ) ) ( not ( = ?auto_384905 ?auto_384914 ) ) ( not ( = ?auto_384906 ?auto_384907 ) ) ( not ( = ?auto_384906 ?auto_384908 ) ) ( not ( = ?auto_384906 ?auto_384909 ) ) ( not ( = ?auto_384906 ?auto_384910 ) ) ( not ( = ?auto_384906 ?auto_384911 ) ) ( not ( = ?auto_384906 ?auto_384912 ) ) ( not ( = ?auto_384906 ?auto_384913 ) ) ( not ( = ?auto_384906 ?auto_384914 ) ) ( not ( = ?auto_384907 ?auto_384908 ) ) ( not ( = ?auto_384907 ?auto_384909 ) ) ( not ( = ?auto_384907 ?auto_384910 ) ) ( not ( = ?auto_384907 ?auto_384911 ) ) ( not ( = ?auto_384907 ?auto_384912 ) ) ( not ( = ?auto_384907 ?auto_384913 ) ) ( not ( = ?auto_384907 ?auto_384914 ) ) ( not ( = ?auto_384908 ?auto_384909 ) ) ( not ( = ?auto_384908 ?auto_384910 ) ) ( not ( = ?auto_384908 ?auto_384911 ) ) ( not ( = ?auto_384908 ?auto_384912 ) ) ( not ( = ?auto_384908 ?auto_384913 ) ) ( not ( = ?auto_384908 ?auto_384914 ) ) ( not ( = ?auto_384909 ?auto_384910 ) ) ( not ( = ?auto_384909 ?auto_384911 ) ) ( not ( = ?auto_384909 ?auto_384912 ) ) ( not ( = ?auto_384909 ?auto_384913 ) ) ( not ( = ?auto_384909 ?auto_384914 ) ) ( not ( = ?auto_384910 ?auto_384911 ) ) ( not ( = ?auto_384910 ?auto_384912 ) ) ( not ( = ?auto_384910 ?auto_384913 ) ) ( not ( = ?auto_384910 ?auto_384914 ) ) ( not ( = ?auto_384911 ?auto_384912 ) ) ( not ( = ?auto_384911 ?auto_384913 ) ) ( not ( = ?auto_384911 ?auto_384914 ) ) ( not ( = ?auto_384912 ?auto_384913 ) ) ( not ( = ?auto_384912 ?auto_384914 ) ) ( not ( = ?auto_384913 ?auto_384914 ) ) ( ON ?auto_384912 ?auto_384913 ) ( ON ?auto_384911 ?auto_384912 ) ( ON ?auto_384910 ?auto_384911 ) ( ON ?auto_384909 ?auto_384910 ) ( ON ?auto_384908 ?auto_384909 ) ( ON ?auto_384907 ?auto_384908 ) ( ON ?auto_384906 ?auto_384907 ) ( ON ?auto_384905 ?auto_384906 ) ( ON ?auto_384904 ?auto_384905 ) ( ON ?auto_384903 ?auto_384904 ) ( ON ?auto_384902 ?auto_384903 ) ( ON ?auto_384901 ?auto_384902 ) ( CLEAR ?auto_384901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_384901 )
      ( MAKE-13PILE ?auto_384901 ?auto_384902 ?auto_384903 ?auto_384904 ?auto_384905 ?auto_384906 ?auto_384907 ?auto_384908 ?auto_384909 ?auto_384910 ?auto_384911 ?auto_384912 ?auto_384913 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_384928 - BLOCK
      ?auto_384929 - BLOCK
      ?auto_384930 - BLOCK
      ?auto_384931 - BLOCK
      ?auto_384932 - BLOCK
      ?auto_384933 - BLOCK
      ?auto_384934 - BLOCK
      ?auto_384935 - BLOCK
      ?auto_384936 - BLOCK
      ?auto_384937 - BLOCK
      ?auto_384938 - BLOCK
      ?auto_384939 - BLOCK
      ?auto_384940 - BLOCK
    )
    :vars
    (
      ?auto_384941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_384940 ?auto_384941 ) ( not ( = ?auto_384928 ?auto_384929 ) ) ( not ( = ?auto_384928 ?auto_384930 ) ) ( not ( = ?auto_384928 ?auto_384931 ) ) ( not ( = ?auto_384928 ?auto_384932 ) ) ( not ( = ?auto_384928 ?auto_384933 ) ) ( not ( = ?auto_384928 ?auto_384934 ) ) ( not ( = ?auto_384928 ?auto_384935 ) ) ( not ( = ?auto_384928 ?auto_384936 ) ) ( not ( = ?auto_384928 ?auto_384937 ) ) ( not ( = ?auto_384928 ?auto_384938 ) ) ( not ( = ?auto_384928 ?auto_384939 ) ) ( not ( = ?auto_384928 ?auto_384940 ) ) ( not ( = ?auto_384928 ?auto_384941 ) ) ( not ( = ?auto_384929 ?auto_384930 ) ) ( not ( = ?auto_384929 ?auto_384931 ) ) ( not ( = ?auto_384929 ?auto_384932 ) ) ( not ( = ?auto_384929 ?auto_384933 ) ) ( not ( = ?auto_384929 ?auto_384934 ) ) ( not ( = ?auto_384929 ?auto_384935 ) ) ( not ( = ?auto_384929 ?auto_384936 ) ) ( not ( = ?auto_384929 ?auto_384937 ) ) ( not ( = ?auto_384929 ?auto_384938 ) ) ( not ( = ?auto_384929 ?auto_384939 ) ) ( not ( = ?auto_384929 ?auto_384940 ) ) ( not ( = ?auto_384929 ?auto_384941 ) ) ( not ( = ?auto_384930 ?auto_384931 ) ) ( not ( = ?auto_384930 ?auto_384932 ) ) ( not ( = ?auto_384930 ?auto_384933 ) ) ( not ( = ?auto_384930 ?auto_384934 ) ) ( not ( = ?auto_384930 ?auto_384935 ) ) ( not ( = ?auto_384930 ?auto_384936 ) ) ( not ( = ?auto_384930 ?auto_384937 ) ) ( not ( = ?auto_384930 ?auto_384938 ) ) ( not ( = ?auto_384930 ?auto_384939 ) ) ( not ( = ?auto_384930 ?auto_384940 ) ) ( not ( = ?auto_384930 ?auto_384941 ) ) ( not ( = ?auto_384931 ?auto_384932 ) ) ( not ( = ?auto_384931 ?auto_384933 ) ) ( not ( = ?auto_384931 ?auto_384934 ) ) ( not ( = ?auto_384931 ?auto_384935 ) ) ( not ( = ?auto_384931 ?auto_384936 ) ) ( not ( = ?auto_384931 ?auto_384937 ) ) ( not ( = ?auto_384931 ?auto_384938 ) ) ( not ( = ?auto_384931 ?auto_384939 ) ) ( not ( = ?auto_384931 ?auto_384940 ) ) ( not ( = ?auto_384931 ?auto_384941 ) ) ( not ( = ?auto_384932 ?auto_384933 ) ) ( not ( = ?auto_384932 ?auto_384934 ) ) ( not ( = ?auto_384932 ?auto_384935 ) ) ( not ( = ?auto_384932 ?auto_384936 ) ) ( not ( = ?auto_384932 ?auto_384937 ) ) ( not ( = ?auto_384932 ?auto_384938 ) ) ( not ( = ?auto_384932 ?auto_384939 ) ) ( not ( = ?auto_384932 ?auto_384940 ) ) ( not ( = ?auto_384932 ?auto_384941 ) ) ( not ( = ?auto_384933 ?auto_384934 ) ) ( not ( = ?auto_384933 ?auto_384935 ) ) ( not ( = ?auto_384933 ?auto_384936 ) ) ( not ( = ?auto_384933 ?auto_384937 ) ) ( not ( = ?auto_384933 ?auto_384938 ) ) ( not ( = ?auto_384933 ?auto_384939 ) ) ( not ( = ?auto_384933 ?auto_384940 ) ) ( not ( = ?auto_384933 ?auto_384941 ) ) ( not ( = ?auto_384934 ?auto_384935 ) ) ( not ( = ?auto_384934 ?auto_384936 ) ) ( not ( = ?auto_384934 ?auto_384937 ) ) ( not ( = ?auto_384934 ?auto_384938 ) ) ( not ( = ?auto_384934 ?auto_384939 ) ) ( not ( = ?auto_384934 ?auto_384940 ) ) ( not ( = ?auto_384934 ?auto_384941 ) ) ( not ( = ?auto_384935 ?auto_384936 ) ) ( not ( = ?auto_384935 ?auto_384937 ) ) ( not ( = ?auto_384935 ?auto_384938 ) ) ( not ( = ?auto_384935 ?auto_384939 ) ) ( not ( = ?auto_384935 ?auto_384940 ) ) ( not ( = ?auto_384935 ?auto_384941 ) ) ( not ( = ?auto_384936 ?auto_384937 ) ) ( not ( = ?auto_384936 ?auto_384938 ) ) ( not ( = ?auto_384936 ?auto_384939 ) ) ( not ( = ?auto_384936 ?auto_384940 ) ) ( not ( = ?auto_384936 ?auto_384941 ) ) ( not ( = ?auto_384937 ?auto_384938 ) ) ( not ( = ?auto_384937 ?auto_384939 ) ) ( not ( = ?auto_384937 ?auto_384940 ) ) ( not ( = ?auto_384937 ?auto_384941 ) ) ( not ( = ?auto_384938 ?auto_384939 ) ) ( not ( = ?auto_384938 ?auto_384940 ) ) ( not ( = ?auto_384938 ?auto_384941 ) ) ( not ( = ?auto_384939 ?auto_384940 ) ) ( not ( = ?auto_384939 ?auto_384941 ) ) ( not ( = ?auto_384940 ?auto_384941 ) ) ( ON ?auto_384939 ?auto_384940 ) ( ON ?auto_384938 ?auto_384939 ) ( ON ?auto_384937 ?auto_384938 ) ( ON ?auto_384936 ?auto_384937 ) ( ON ?auto_384935 ?auto_384936 ) ( ON ?auto_384934 ?auto_384935 ) ( ON ?auto_384933 ?auto_384934 ) ( ON ?auto_384932 ?auto_384933 ) ( ON ?auto_384931 ?auto_384932 ) ( ON ?auto_384930 ?auto_384931 ) ( ON ?auto_384929 ?auto_384930 ) ( ON ?auto_384928 ?auto_384929 ) ( CLEAR ?auto_384928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_384928 )
      ( MAKE-13PILE ?auto_384928 ?auto_384929 ?auto_384930 ?auto_384931 ?auto_384932 ?auto_384933 ?auto_384934 ?auto_384935 ?auto_384936 ?auto_384937 ?auto_384938 ?auto_384939 ?auto_384940 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_384956 - BLOCK
      ?auto_384957 - BLOCK
      ?auto_384958 - BLOCK
      ?auto_384959 - BLOCK
      ?auto_384960 - BLOCK
      ?auto_384961 - BLOCK
      ?auto_384962 - BLOCK
      ?auto_384963 - BLOCK
      ?auto_384964 - BLOCK
      ?auto_384965 - BLOCK
      ?auto_384966 - BLOCK
      ?auto_384967 - BLOCK
      ?auto_384968 - BLOCK
      ?auto_384969 - BLOCK
    )
    :vars
    (
      ?auto_384970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_384968 ) ( ON ?auto_384969 ?auto_384970 ) ( CLEAR ?auto_384969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_384956 ) ( ON ?auto_384957 ?auto_384956 ) ( ON ?auto_384958 ?auto_384957 ) ( ON ?auto_384959 ?auto_384958 ) ( ON ?auto_384960 ?auto_384959 ) ( ON ?auto_384961 ?auto_384960 ) ( ON ?auto_384962 ?auto_384961 ) ( ON ?auto_384963 ?auto_384962 ) ( ON ?auto_384964 ?auto_384963 ) ( ON ?auto_384965 ?auto_384964 ) ( ON ?auto_384966 ?auto_384965 ) ( ON ?auto_384967 ?auto_384966 ) ( ON ?auto_384968 ?auto_384967 ) ( not ( = ?auto_384956 ?auto_384957 ) ) ( not ( = ?auto_384956 ?auto_384958 ) ) ( not ( = ?auto_384956 ?auto_384959 ) ) ( not ( = ?auto_384956 ?auto_384960 ) ) ( not ( = ?auto_384956 ?auto_384961 ) ) ( not ( = ?auto_384956 ?auto_384962 ) ) ( not ( = ?auto_384956 ?auto_384963 ) ) ( not ( = ?auto_384956 ?auto_384964 ) ) ( not ( = ?auto_384956 ?auto_384965 ) ) ( not ( = ?auto_384956 ?auto_384966 ) ) ( not ( = ?auto_384956 ?auto_384967 ) ) ( not ( = ?auto_384956 ?auto_384968 ) ) ( not ( = ?auto_384956 ?auto_384969 ) ) ( not ( = ?auto_384956 ?auto_384970 ) ) ( not ( = ?auto_384957 ?auto_384958 ) ) ( not ( = ?auto_384957 ?auto_384959 ) ) ( not ( = ?auto_384957 ?auto_384960 ) ) ( not ( = ?auto_384957 ?auto_384961 ) ) ( not ( = ?auto_384957 ?auto_384962 ) ) ( not ( = ?auto_384957 ?auto_384963 ) ) ( not ( = ?auto_384957 ?auto_384964 ) ) ( not ( = ?auto_384957 ?auto_384965 ) ) ( not ( = ?auto_384957 ?auto_384966 ) ) ( not ( = ?auto_384957 ?auto_384967 ) ) ( not ( = ?auto_384957 ?auto_384968 ) ) ( not ( = ?auto_384957 ?auto_384969 ) ) ( not ( = ?auto_384957 ?auto_384970 ) ) ( not ( = ?auto_384958 ?auto_384959 ) ) ( not ( = ?auto_384958 ?auto_384960 ) ) ( not ( = ?auto_384958 ?auto_384961 ) ) ( not ( = ?auto_384958 ?auto_384962 ) ) ( not ( = ?auto_384958 ?auto_384963 ) ) ( not ( = ?auto_384958 ?auto_384964 ) ) ( not ( = ?auto_384958 ?auto_384965 ) ) ( not ( = ?auto_384958 ?auto_384966 ) ) ( not ( = ?auto_384958 ?auto_384967 ) ) ( not ( = ?auto_384958 ?auto_384968 ) ) ( not ( = ?auto_384958 ?auto_384969 ) ) ( not ( = ?auto_384958 ?auto_384970 ) ) ( not ( = ?auto_384959 ?auto_384960 ) ) ( not ( = ?auto_384959 ?auto_384961 ) ) ( not ( = ?auto_384959 ?auto_384962 ) ) ( not ( = ?auto_384959 ?auto_384963 ) ) ( not ( = ?auto_384959 ?auto_384964 ) ) ( not ( = ?auto_384959 ?auto_384965 ) ) ( not ( = ?auto_384959 ?auto_384966 ) ) ( not ( = ?auto_384959 ?auto_384967 ) ) ( not ( = ?auto_384959 ?auto_384968 ) ) ( not ( = ?auto_384959 ?auto_384969 ) ) ( not ( = ?auto_384959 ?auto_384970 ) ) ( not ( = ?auto_384960 ?auto_384961 ) ) ( not ( = ?auto_384960 ?auto_384962 ) ) ( not ( = ?auto_384960 ?auto_384963 ) ) ( not ( = ?auto_384960 ?auto_384964 ) ) ( not ( = ?auto_384960 ?auto_384965 ) ) ( not ( = ?auto_384960 ?auto_384966 ) ) ( not ( = ?auto_384960 ?auto_384967 ) ) ( not ( = ?auto_384960 ?auto_384968 ) ) ( not ( = ?auto_384960 ?auto_384969 ) ) ( not ( = ?auto_384960 ?auto_384970 ) ) ( not ( = ?auto_384961 ?auto_384962 ) ) ( not ( = ?auto_384961 ?auto_384963 ) ) ( not ( = ?auto_384961 ?auto_384964 ) ) ( not ( = ?auto_384961 ?auto_384965 ) ) ( not ( = ?auto_384961 ?auto_384966 ) ) ( not ( = ?auto_384961 ?auto_384967 ) ) ( not ( = ?auto_384961 ?auto_384968 ) ) ( not ( = ?auto_384961 ?auto_384969 ) ) ( not ( = ?auto_384961 ?auto_384970 ) ) ( not ( = ?auto_384962 ?auto_384963 ) ) ( not ( = ?auto_384962 ?auto_384964 ) ) ( not ( = ?auto_384962 ?auto_384965 ) ) ( not ( = ?auto_384962 ?auto_384966 ) ) ( not ( = ?auto_384962 ?auto_384967 ) ) ( not ( = ?auto_384962 ?auto_384968 ) ) ( not ( = ?auto_384962 ?auto_384969 ) ) ( not ( = ?auto_384962 ?auto_384970 ) ) ( not ( = ?auto_384963 ?auto_384964 ) ) ( not ( = ?auto_384963 ?auto_384965 ) ) ( not ( = ?auto_384963 ?auto_384966 ) ) ( not ( = ?auto_384963 ?auto_384967 ) ) ( not ( = ?auto_384963 ?auto_384968 ) ) ( not ( = ?auto_384963 ?auto_384969 ) ) ( not ( = ?auto_384963 ?auto_384970 ) ) ( not ( = ?auto_384964 ?auto_384965 ) ) ( not ( = ?auto_384964 ?auto_384966 ) ) ( not ( = ?auto_384964 ?auto_384967 ) ) ( not ( = ?auto_384964 ?auto_384968 ) ) ( not ( = ?auto_384964 ?auto_384969 ) ) ( not ( = ?auto_384964 ?auto_384970 ) ) ( not ( = ?auto_384965 ?auto_384966 ) ) ( not ( = ?auto_384965 ?auto_384967 ) ) ( not ( = ?auto_384965 ?auto_384968 ) ) ( not ( = ?auto_384965 ?auto_384969 ) ) ( not ( = ?auto_384965 ?auto_384970 ) ) ( not ( = ?auto_384966 ?auto_384967 ) ) ( not ( = ?auto_384966 ?auto_384968 ) ) ( not ( = ?auto_384966 ?auto_384969 ) ) ( not ( = ?auto_384966 ?auto_384970 ) ) ( not ( = ?auto_384967 ?auto_384968 ) ) ( not ( = ?auto_384967 ?auto_384969 ) ) ( not ( = ?auto_384967 ?auto_384970 ) ) ( not ( = ?auto_384968 ?auto_384969 ) ) ( not ( = ?auto_384968 ?auto_384970 ) ) ( not ( = ?auto_384969 ?auto_384970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_384969 ?auto_384970 )
      ( !STACK ?auto_384969 ?auto_384968 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_384985 - BLOCK
      ?auto_384986 - BLOCK
      ?auto_384987 - BLOCK
      ?auto_384988 - BLOCK
      ?auto_384989 - BLOCK
      ?auto_384990 - BLOCK
      ?auto_384991 - BLOCK
      ?auto_384992 - BLOCK
      ?auto_384993 - BLOCK
      ?auto_384994 - BLOCK
      ?auto_384995 - BLOCK
      ?auto_384996 - BLOCK
      ?auto_384997 - BLOCK
      ?auto_384998 - BLOCK
    )
    :vars
    (
      ?auto_384999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_384997 ) ( ON ?auto_384998 ?auto_384999 ) ( CLEAR ?auto_384998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_384985 ) ( ON ?auto_384986 ?auto_384985 ) ( ON ?auto_384987 ?auto_384986 ) ( ON ?auto_384988 ?auto_384987 ) ( ON ?auto_384989 ?auto_384988 ) ( ON ?auto_384990 ?auto_384989 ) ( ON ?auto_384991 ?auto_384990 ) ( ON ?auto_384992 ?auto_384991 ) ( ON ?auto_384993 ?auto_384992 ) ( ON ?auto_384994 ?auto_384993 ) ( ON ?auto_384995 ?auto_384994 ) ( ON ?auto_384996 ?auto_384995 ) ( ON ?auto_384997 ?auto_384996 ) ( not ( = ?auto_384985 ?auto_384986 ) ) ( not ( = ?auto_384985 ?auto_384987 ) ) ( not ( = ?auto_384985 ?auto_384988 ) ) ( not ( = ?auto_384985 ?auto_384989 ) ) ( not ( = ?auto_384985 ?auto_384990 ) ) ( not ( = ?auto_384985 ?auto_384991 ) ) ( not ( = ?auto_384985 ?auto_384992 ) ) ( not ( = ?auto_384985 ?auto_384993 ) ) ( not ( = ?auto_384985 ?auto_384994 ) ) ( not ( = ?auto_384985 ?auto_384995 ) ) ( not ( = ?auto_384985 ?auto_384996 ) ) ( not ( = ?auto_384985 ?auto_384997 ) ) ( not ( = ?auto_384985 ?auto_384998 ) ) ( not ( = ?auto_384985 ?auto_384999 ) ) ( not ( = ?auto_384986 ?auto_384987 ) ) ( not ( = ?auto_384986 ?auto_384988 ) ) ( not ( = ?auto_384986 ?auto_384989 ) ) ( not ( = ?auto_384986 ?auto_384990 ) ) ( not ( = ?auto_384986 ?auto_384991 ) ) ( not ( = ?auto_384986 ?auto_384992 ) ) ( not ( = ?auto_384986 ?auto_384993 ) ) ( not ( = ?auto_384986 ?auto_384994 ) ) ( not ( = ?auto_384986 ?auto_384995 ) ) ( not ( = ?auto_384986 ?auto_384996 ) ) ( not ( = ?auto_384986 ?auto_384997 ) ) ( not ( = ?auto_384986 ?auto_384998 ) ) ( not ( = ?auto_384986 ?auto_384999 ) ) ( not ( = ?auto_384987 ?auto_384988 ) ) ( not ( = ?auto_384987 ?auto_384989 ) ) ( not ( = ?auto_384987 ?auto_384990 ) ) ( not ( = ?auto_384987 ?auto_384991 ) ) ( not ( = ?auto_384987 ?auto_384992 ) ) ( not ( = ?auto_384987 ?auto_384993 ) ) ( not ( = ?auto_384987 ?auto_384994 ) ) ( not ( = ?auto_384987 ?auto_384995 ) ) ( not ( = ?auto_384987 ?auto_384996 ) ) ( not ( = ?auto_384987 ?auto_384997 ) ) ( not ( = ?auto_384987 ?auto_384998 ) ) ( not ( = ?auto_384987 ?auto_384999 ) ) ( not ( = ?auto_384988 ?auto_384989 ) ) ( not ( = ?auto_384988 ?auto_384990 ) ) ( not ( = ?auto_384988 ?auto_384991 ) ) ( not ( = ?auto_384988 ?auto_384992 ) ) ( not ( = ?auto_384988 ?auto_384993 ) ) ( not ( = ?auto_384988 ?auto_384994 ) ) ( not ( = ?auto_384988 ?auto_384995 ) ) ( not ( = ?auto_384988 ?auto_384996 ) ) ( not ( = ?auto_384988 ?auto_384997 ) ) ( not ( = ?auto_384988 ?auto_384998 ) ) ( not ( = ?auto_384988 ?auto_384999 ) ) ( not ( = ?auto_384989 ?auto_384990 ) ) ( not ( = ?auto_384989 ?auto_384991 ) ) ( not ( = ?auto_384989 ?auto_384992 ) ) ( not ( = ?auto_384989 ?auto_384993 ) ) ( not ( = ?auto_384989 ?auto_384994 ) ) ( not ( = ?auto_384989 ?auto_384995 ) ) ( not ( = ?auto_384989 ?auto_384996 ) ) ( not ( = ?auto_384989 ?auto_384997 ) ) ( not ( = ?auto_384989 ?auto_384998 ) ) ( not ( = ?auto_384989 ?auto_384999 ) ) ( not ( = ?auto_384990 ?auto_384991 ) ) ( not ( = ?auto_384990 ?auto_384992 ) ) ( not ( = ?auto_384990 ?auto_384993 ) ) ( not ( = ?auto_384990 ?auto_384994 ) ) ( not ( = ?auto_384990 ?auto_384995 ) ) ( not ( = ?auto_384990 ?auto_384996 ) ) ( not ( = ?auto_384990 ?auto_384997 ) ) ( not ( = ?auto_384990 ?auto_384998 ) ) ( not ( = ?auto_384990 ?auto_384999 ) ) ( not ( = ?auto_384991 ?auto_384992 ) ) ( not ( = ?auto_384991 ?auto_384993 ) ) ( not ( = ?auto_384991 ?auto_384994 ) ) ( not ( = ?auto_384991 ?auto_384995 ) ) ( not ( = ?auto_384991 ?auto_384996 ) ) ( not ( = ?auto_384991 ?auto_384997 ) ) ( not ( = ?auto_384991 ?auto_384998 ) ) ( not ( = ?auto_384991 ?auto_384999 ) ) ( not ( = ?auto_384992 ?auto_384993 ) ) ( not ( = ?auto_384992 ?auto_384994 ) ) ( not ( = ?auto_384992 ?auto_384995 ) ) ( not ( = ?auto_384992 ?auto_384996 ) ) ( not ( = ?auto_384992 ?auto_384997 ) ) ( not ( = ?auto_384992 ?auto_384998 ) ) ( not ( = ?auto_384992 ?auto_384999 ) ) ( not ( = ?auto_384993 ?auto_384994 ) ) ( not ( = ?auto_384993 ?auto_384995 ) ) ( not ( = ?auto_384993 ?auto_384996 ) ) ( not ( = ?auto_384993 ?auto_384997 ) ) ( not ( = ?auto_384993 ?auto_384998 ) ) ( not ( = ?auto_384993 ?auto_384999 ) ) ( not ( = ?auto_384994 ?auto_384995 ) ) ( not ( = ?auto_384994 ?auto_384996 ) ) ( not ( = ?auto_384994 ?auto_384997 ) ) ( not ( = ?auto_384994 ?auto_384998 ) ) ( not ( = ?auto_384994 ?auto_384999 ) ) ( not ( = ?auto_384995 ?auto_384996 ) ) ( not ( = ?auto_384995 ?auto_384997 ) ) ( not ( = ?auto_384995 ?auto_384998 ) ) ( not ( = ?auto_384995 ?auto_384999 ) ) ( not ( = ?auto_384996 ?auto_384997 ) ) ( not ( = ?auto_384996 ?auto_384998 ) ) ( not ( = ?auto_384996 ?auto_384999 ) ) ( not ( = ?auto_384997 ?auto_384998 ) ) ( not ( = ?auto_384997 ?auto_384999 ) ) ( not ( = ?auto_384998 ?auto_384999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_384998 ?auto_384999 )
      ( !STACK ?auto_384998 ?auto_384997 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385014 - BLOCK
      ?auto_385015 - BLOCK
      ?auto_385016 - BLOCK
      ?auto_385017 - BLOCK
      ?auto_385018 - BLOCK
      ?auto_385019 - BLOCK
      ?auto_385020 - BLOCK
      ?auto_385021 - BLOCK
      ?auto_385022 - BLOCK
      ?auto_385023 - BLOCK
      ?auto_385024 - BLOCK
      ?auto_385025 - BLOCK
      ?auto_385026 - BLOCK
      ?auto_385027 - BLOCK
    )
    :vars
    (
      ?auto_385028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385027 ?auto_385028 ) ( ON-TABLE ?auto_385014 ) ( ON ?auto_385015 ?auto_385014 ) ( ON ?auto_385016 ?auto_385015 ) ( ON ?auto_385017 ?auto_385016 ) ( ON ?auto_385018 ?auto_385017 ) ( ON ?auto_385019 ?auto_385018 ) ( ON ?auto_385020 ?auto_385019 ) ( ON ?auto_385021 ?auto_385020 ) ( ON ?auto_385022 ?auto_385021 ) ( ON ?auto_385023 ?auto_385022 ) ( ON ?auto_385024 ?auto_385023 ) ( ON ?auto_385025 ?auto_385024 ) ( not ( = ?auto_385014 ?auto_385015 ) ) ( not ( = ?auto_385014 ?auto_385016 ) ) ( not ( = ?auto_385014 ?auto_385017 ) ) ( not ( = ?auto_385014 ?auto_385018 ) ) ( not ( = ?auto_385014 ?auto_385019 ) ) ( not ( = ?auto_385014 ?auto_385020 ) ) ( not ( = ?auto_385014 ?auto_385021 ) ) ( not ( = ?auto_385014 ?auto_385022 ) ) ( not ( = ?auto_385014 ?auto_385023 ) ) ( not ( = ?auto_385014 ?auto_385024 ) ) ( not ( = ?auto_385014 ?auto_385025 ) ) ( not ( = ?auto_385014 ?auto_385026 ) ) ( not ( = ?auto_385014 ?auto_385027 ) ) ( not ( = ?auto_385014 ?auto_385028 ) ) ( not ( = ?auto_385015 ?auto_385016 ) ) ( not ( = ?auto_385015 ?auto_385017 ) ) ( not ( = ?auto_385015 ?auto_385018 ) ) ( not ( = ?auto_385015 ?auto_385019 ) ) ( not ( = ?auto_385015 ?auto_385020 ) ) ( not ( = ?auto_385015 ?auto_385021 ) ) ( not ( = ?auto_385015 ?auto_385022 ) ) ( not ( = ?auto_385015 ?auto_385023 ) ) ( not ( = ?auto_385015 ?auto_385024 ) ) ( not ( = ?auto_385015 ?auto_385025 ) ) ( not ( = ?auto_385015 ?auto_385026 ) ) ( not ( = ?auto_385015 ?auto_385027 ) ) ( not ( = ?auto_385015 ?auto_385028 ) ) ( not ( = ?auto_385016 ?auto_385017 ) ) ( not ( = ?auto_385016 ?auto_385018 ) ) ( not ( = ?auto_385016 ?auto_385019 ) ) ( not ( = ?auto_385016 ?auto_385020 ) ) ( not ( = ?auto_385016 ?auto_385021 ) ) ( not ( = ?auto_385016 ?auto_385022 ) ) ( not ( = ?auto_385016 ?auto_385023 ) ) ( not ( = ?auto_385016 ?auto_385024 ) ) ( not ( = ?auto_385016 ?auto_385025 ) ) ( not ( = ?auto_385016 ?auto_385026 ) ) ( not ( = ?auto_385016 ?auto_385027 ) ) ( not ( = ?auto_385016 ?auto_385028 ) ) ( not ( = ?auto_385017 ?auto_385018 ) ) ( not ( = ?auto_385017 ?auto_385019 ) ) ( not ( = ?auto_385017 ?auto_385020 ) ) ( not ( = ?auto_385017 ?auto_385021 ) ) ( not ( = ?auto_385017 ?auto_385022 ) ) ( not ( = ?auto_385017 ?auto_385023 ) ) ( not ( = ?auto_385017 ?auto_385024 ) ) ( not ( = ?auto_385017 ?auto_385025 ) ) ( not ( = ?auto_385017 ?auto_385026 ) ) ( not ( = ?auto_385017 ?auto_385027 ) ) ( not ( = ?auto_385017 ?auto_385028 ) ) ( not ( = ?auto_385018 ?auto_385019 ) ) ( not ( = ?auto_385018 ?auto_385020 ) ) ( not ( = ?auto_385018 ?auto_385021 ) ) ( not ( = ?auto_385018 ?auto_385022 ) ) ( not ( = ?auto_385018 ?auto_385023 ) ) ( not ( = ?auto_385018 ?auto_385024 ) ) ( not ( = ?auto_385018 ?auto_385025 ) ) ( not ( = ?auto_385018 ?auto_385026 ) ) ( not ( = ?auto_385018 ?auto_385027 ) ) ( not ( = ?auto_385018 ?auto_385028 ) ) ( not ( = ?auto_385019 ?auto_385020 ) ) ( not ( = ?auto_385019 ?auto_385021 ) ) ( not ( = ?auto_385019 ?auto_385022 ) ) ( not ( = ?auto_385019 ?auto_385023 ) ) ( not ( = ?auto_385019 ?auto_385024 ) ) ( not ( = ?auto_385019 ?auto_385025 ) ) ( not ( = ?auto_385019 ?auto_385026 ) ) ( not ( = ?auto_385019 ?auto_385027 ) ) ( not ( = ?auto_385019 ?auto_385028 ) ) ( not ( = ?auto_385020 ?auto_385021 ) ) ( not ( = ?auto_385020 ?auto_385022 ) ) ( not ( = ?auto_385020 ?auto_385023 ) ) ( not ( = ?auto_385020 ?auto_385024 ) ) ( not ( = ?auto_385020 ?auto_385025 ) ) ( not ( = ?auto_385020 ?auto_385026 ) ) ( not ( = ?auto_385020 ?auto_385027 ) ) ( not ( = ?auto_385020 ?auto_385028 ) ) ( not ( = ?auto_385021 ?auto_385022 ) ) ( not ( = ?auto_385021 ?auto_385023 ) ) ( not ( = ?auto_385021 ?auto_385024 ) ) ( not ( = ?auto_385021 ?auto_385025 ) ) ( not ( = ?auto_385021 ?auto_385026 ) ) ( not ( = ?auto_385021 ?auto_385027 ) ) ( not ( = ?auto_385021 ?auto_385028 ) ) ( not ( = ?auto_385022 ?auto_385023 ) ) ( not ( = ?auto_385022 ?auto_385024 ) ) ( not ( = ?auto_385022 ?auto_385025 ) ) ( not ( = ?auto_385022 ?auto_385026 ) ) ( not ( = ?auto_385022 ?auto_385027 ) ) ( not ( = ?auto_385022 ?auto_385028 ) ) ( not ( = ?auto_385023 ?auto_385024 ) ) ( not ( = ?auto_385023 ?auto_385025 ) ) ( not ( = ?auto_385023 ?auto_385026 ) ) ( not ( = ?auto_385023 ?auto_385027 ) ) ( not ( = ?auto_385023 ?auto_385028 ) ) ( not ( = ?auto_385024 ?auto_385025 ) ) ( not ( = ?auto_385024 ?auto_385026 ) ) ( not ( = ?auto_385024 ?auto_385027 ) ) ( not ( = ?auto_385024 ?auto_385028 ) ) ( not ( = ?auto_385025 ?auto_385026 ) ) ( not ( = ?auto_385025 ?auto_385027 ) ) ( not ( = ?auto_385025 ?auto_385028 ) ) ( not ( = ?auto_385026 ?auto_385027 ) ) ( not ( = ?auto_385026 ?auto_385028 ) ) ( not ( = ?auto_385027 ?auto_385028 ) ) ( CLEAR ?auto_385025 ) ( ON ?auto_385026 ?auto_385027 ) ( CLEAR ?auto_385026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_385014 ?auto_385015 ?auto_385016 ?auto_385017 ?auto_385018 ?auto_385019 ?auto_385020 ?auto_385021 ?auto_385022 ?auto_385023 ?auto_385024 ?auto_385025 ?auto_385026 )
      ( MAKE-14PILE ?auto_385014 ?auto_385015 ?auto_385016 ?auto_385017 ?auto_385018 ?auto_385019 ?auto_385020 ?auto_385021 ?auto_385022 ?auto_385023 ?auto_385024 ?auto_385025 ?auto_385026 ?auto_385027 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385043 - BLOCK
      ?auto_385044 - BLOCK
      ?auto_385045 - BLOCK
      ?auto_385046 - BLOCK
      ?auto_385047 - BLOCK
      ?auto_385048 - BLOCK
      ?auto_385049 - BLOCK
      ?auto_385050 - BLOCK
      ?auto_385051 - BLOCK
      ?auto_385052 - BLOCK
      ?auto_385053 - BLOCK
      ?auto_385054 - BLOCK
      ?auto_385055 - BLOCK
      ?auto_385056 - BLOCK
    )
    :vars
    (
      ?auto_385057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385056 ?auto_385057 ) ( ON-TABLE ?auto_385043 ) ( ON ?auto_385044 ?auto_385043 ) ( ON ?auto_385045 ?auto_385044 ) ( ON ?auto_385046 ?auto_385045 ) ( ON ?auto_385047 ?auto_385046 ) ( ON ?auto_385048 ?auto_385047 ) ( ON ?auto_385049 ?auto_385048 ) ( ON ?auto_385050 ?auto_385049 ) ( ON ?auto_385051 ?auto_385050 ) ( ON ?auto_385052 ?auto_385051 ) ( ON ?auto_385053 ?auto_385052 ) ( ON ?auto_385054 ?auto_385053 ) ( not ( = ?auto_385043 ?auto_385044 ) ) ( not ( = ?auto_385043 ?auto_385045 ) ) ( not ( = ?auto_385043 ?auto_385046 ) ) ( not ( = ?auto_385043 ?auto_385047 ) ) ( not ( = ?auto_385043 ?auto_385048 ) ) ( not ( = ?auto_385043 ?auto_385049 ) ) ( not ( = ?auto_385043 ?auto_385050 ) ) ( not ( = ?auto_385043 ?auto_385051 ) ) ( not ( = ?auto_385043 ?auto_385052 ) ) ( not ( = ?auto_385043 ?auto_385053 ) ) ( not ( = ?auto_385043 ?auto_385054 ) ) ( not ( = ?auto_385043 ?auto_385055 ) ) ( not ( = ?auto_385043 ?auto_385056 ) ) ( not ( = ?auto_385043 ?auto_385057 ) ) ( not ( = ?auto_385044 ?auto_385045 ) ) ( not ( = ?auto_385044 ?auto_385046 ) ) ( not ( = ?auto_385044 ?auto_385047 ) ) ( not ( = ?auto_385044 ?auto_385048 ) ) ( not ( = ?auto_385044 ?auto_385049 ) ) ( not ( = ?auto_385044 ?auto_385050 ) ) ( not ( = ?auto_385044 ?auto_385051 ) ) ( not ( = ?auto_385044 ?auto_385052 ) ) ( not ( = ?auto_385044 ?auto_385053 ) ) ( not ( = ?auto_385044 ?auto_385054 ) ) ( not ( = ?auto_385044 ?auto_385055 ) ) ( not ( = ?auto_385044 ?auto_385056 ) ) ( not ( = ?auto_385044 ?auto_385057 ) ) ( not ( = ?auto_385045 ?auto_385046 ) ) ( not ( = ?auto_385045 ?auto_385047 ) ) ( not ( = ?auto_385045 ?auto_385048 ) ) ( not ( = ?auto_385045 ?auto_385049 ) ) ( not ( = ?auto_385045 ?auto_385050 ) ) ( not ( = ?auto_385045 ?auto_385051 ) ) ( not ( = ?auto_385045 ?auto_385052 ) ) ( not ( = ?auto_385045 ?auto_385053 ) ) ( not ( = ?auto_385045 ?auto_385054 ) ) ( not ( = ?auto_385045 ?auto_385055 ) ) ( not ( = ?auto_385045 ?auto_385056 ) ) ( not ( = ?auto_385045 ?auto_385057 ) ) ( not ( = ?auto_385046 ?auto_385047 ) ) ( not ( = ?auto_385046 ?auto_385048 ) ) ( not ( = ?auto_385046 ?auto_385049 ) ) ( not ( = ?auto_385046 ?auto_385050 ) ) ( not ( = ?auto_385046 ?auto_385051 ) ) ( not ( = ?auto_385046 ?auto_385052 ) ) ( not ( = ?auto_385046 ?auto_385053 ) ) ( not ( = ?auto_385046 ?auto_385054 ) ) ( not ( = ?auto_385046 ?auto_385055 ) ) ( not ( = ?auto_385046 ?auto_385056 ) ) ( not ( = ?auto_385046 ?auto_385057 ) ) ( not ( = ?auto_385047 ?auto_385048 ) ) ( not ( = ?auto_385047 ?auto_385049 ) ) ( not ( = ?auto_385047 ?auto_385050 ) ) ( not ( = ?auto_385047 ?auto_385051 ) ) ( not ( = ?auto_385047 ?auto_385052 ) ) ( not ( = ?auto_385047 ?auto_385053 ) ) ( not ( = ?auto_385047 ?auto_385054 ) ) ( not ( = ?auto_385047 ?auto_385055 ) ) ( not ( = ?auto_385047 ?auto_385056 ) ) ( not ( = ?auto_385047 ?auto_385057 ) ) ( not ( = ?auto_385048 ?auto_385049 ) ) ( not ( = ?auto_385048 ?auto_385050 ) ) ( not ( = ?auto_385048 ?auto_385051 ) ) ( not ( = ?auto_385048 ?auto_385052 ) ) ( not ( = ?auto_385048 ?auto_385053 ) ) ( not ( = ?auto_385048 ?auto_385054 ) ) ( not ( = ?auto_385048 ?auto_385055 ) ) ( not ( = ?auto_385048 ?auto_385056 ) ) ( not ( = ?auto_385048 ?auto_385057 ) ) ( not ( = ?auto_385049 ?auto_385050 ) ) ( not ( = ?auto_385049 ?auto_385051 ) ) ( not ( = ?auto_385049 ?auto_385052 ) ) ( not ( = ?auto_385049 ?auto_385053 ) ) ( not ( = ?auto_385049 ?auto_385054 ) ) ( not ( = ?auto_385049 ?auto_385055 ) ) ( not ( = ?auto_385049 ?auto_385056 ) ) ( not ( = ?auto_385049 ?auto_385057 ) ) ( not ( = ?auto_385050 ?auto_385051 ) ) ( not ( = ?auto_385050 ?auto_385052 ) ) ( not ( = ?auto_385050 ?auto_385053 ) ) ( not ( = ?auto_385050 ?auto_385054 ) ) ( not ( = ?auto_385050 ?auto_385055 ) ) ( not ( = ?auto_385050 ?auto_385056 ) ) ( not ( = ?auto_385050 ?auto_385057 ) ) ( not ( = ?auto_385051 ?auto_385052 ) ) ( not ( = ?auto_385051 ?auto_385053 ) ) ( not ( = ?auto_385051 ?auto_385054 ) ) ( not ( = ?auto_385051 ?auto_385055 ) ) ( not ( = ?auto_385051 ?auto_385056 ) ) ( not ( = ?auto_385051 ?auto_385057 ) ) ( not ( = ?auto_385052 ?auto_385053 ) ) ( not ( = ?auto_385052 ?auto_385054 ) ) ( not ( = ?auto_385052 ?auto_385055 ) ) ( not ( = ?auto_385052 ?auto_385056 ) ) ( not ( = ?auto_385052 ?auto_385057 ) ) ( not ( = ?auto_385053 ?auto_385054 ) ) ( not ( = ?auto_385053 ?auto_385055 ) ) ( not ( = ?auto_385053 ?auto_385056 ) ) ( not ( = ?auto_385053 ?auto_385057 ) ) ( not ( = ?auto_385054 ?auto_385055 ) ) ( not ( = ?auto_385054 ?auto_385056 ) ) ( not ( = ?auto_385054 ?auto_385057 ) ) ( not ( = ?auto_385055 ?auto_385056 ) ) ( not ( = ?auto_385055 ?auto_385057 ) ) ( not ( = ?auto_385056 ?auto_385057 ) ) ( CLEAR ?auto_385054 ) ( ON ?auto_385055 ?auto_385056 ) ( CLEAR ?auto_385055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_385043 ?auto_385044 ?auto_385045 ?auto_385046 ?auto_385047 ?auto_385048 ?auto_385049 ?auto_385050 ?auto_385051 ?auto_385052 ?auto_385053 ?auto_385054 ?auto_385055 )
      ( MAKE-14PILE ?auto_385043 ?auto_385044 ?auto_385045 ?auto_385046 ?auto_385047 ?auto_385048 ?auto_385049 ?auto_385050 ?auto_385051 ?auto_385052 ?auto_385053 ?auto_385054 ?auto_385055 ?auto_385056 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385072 - BLOCK
      ?auto_385073 - BLOCK
      ?auto_385074 - BLOCK
      ?auto_385075 - BLOCK
      ?auto_385076 - BLOCK
      ?auto_385077 - BLOCK
      ?auto_385078 - BLOCK
      ?auto_385079 - BLOCK
      ?auto_385080 - BLOCK
      ?auto_385081 - BLOCK
      ?auto_385082 - BLOCK
      ?auto_385083 - BLOCK
      ?auto_385084 - BLOCK
      ?auto_385085 - BLOCK
    )
    :vars
    (
      ?auto_385086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385085 ?auto_385086 ) ( ON-TABLE ?auto_385072 ) ( ON ?auto_385073 ?auto_385072 ) ( ON ?auto_385074 ?auto_385073 ) ( ON ?auto_385075 ?auto_385074 ) ( ON ?auto_385076 ?auto_385075 ) ( ON ?auto_385077 ?auto_385076 ) ( ON ?auto_385078 ?auto_385077 ) ( ON ?auto_385079 ?auto_385078 ) ( ON ?auto_385080 ?auto_385079 ) ( ON ?auto_385081 ?auto_385080 ) ( ON ?auto_385082 ?auto_385081 ) ( not ( = ?auto_385072 ?auto_385073 ) ) ( not ( = ?auto_385072 ?auto_385074 ) ) ( not ( = ?auto_385072 ?auto_385075 ) ) ( not ( = ?auto_385072 ?auto_385076 ) ) ( not ( = ?auto_385072 ?auto_385077 ) ) ( not ( = ?auto_385072 ?auto_385078 ) ) ( not ( = ?auto_385072 ?auto_385079 ) ) ( not ( = ?auto_385072 ?auto_385080 ) ) ( not ( = ?auto_385072 ?auto_385081 ) ) ( not ( = ?auto_385072 ?auto_385082 ) ) ( not ( = ?auto_385072 ?auto_385083 ) ) ( not ( = ?auto_385072 ?auto_385084 ) ) ( not ( = ?auto_385072 ?auto_385085 ) ) ( not ( = ?auto_385072 ?auto_385086 ) ) ( not ( = ?auto_385073 ?auto_385074 ) ) ( not ( = ?auto_385073 ?auto_385075 ) ) ( not ( = ?auto_385073 ?auto_385076 ) ) ( not ( = ?auto_385073 ?auto_385077 ) ) ( not ( = ?auto_385073 ?auto_385078 ) ) ( not ( = ?auto_385073 ?auto_385079 ) ) ( not ( = ?auto_385073 ?auto_385080 ) ) ( not ( = ?auto_385073 ?auto_385081 ) ) ( not ( = ?auto_385073 ?auto_385082 ) ) ( not ( = ?auto_385073 ?auto_385083 ) ) ( not ( = ?auto_385073 ?auto_385084 ) ) ( not ( = ?auto_385073 ?auto_385085 ) ) ( not ( = ?auto_385073 ?auto_385086 ) ) ( not ( = ?auto_385074 ?auto_385075 ) ) ( not ( = ?auto_385074 ?auto_385076 ) ) ( not ( = ?auto_385074 ?auto_385077 ) ) ( not ( = ?auto_385074 ?auto_385078 ) ) ( not ( = ?auto_385074 ?auto_385079 ) ) ( not ( = ?auto_385074 ?auto_385080 ) ) ( not ( = ?auto_385074 ?auto_385081 ) ) ( not ( = ?auto_385074 ?auto_385082 ) ) ( not ( = ?auto_385074 ?auto_385083 ) ) ( not ( = ?auto_385074 ?auto_385084 ) ) ( not ( = ?auto_385074 ?auto_385085 ) ) ( not ( = ?auto_385074 ?auto_385086 ) ) ( not ( = ?auto_385075 ?auto_385076 ) ) ( not ( = ?auto_385075 ?auto_385077 ) ) ( not ( = ?auto_385075 ?auto_385078 ) ) ( not ( = ?auto_385075 ?auto_385079 ) ) ( not ( = ?auto_385075 ?auto_385080 ) ) ( not ( = ?auto_385075 ?auto_385081 ) ) ( not ( = ?auto_385075 ?auto_385082 ) ) ( not ( = ?auto_385075 ?auto_385083 ) ) ( not ( = ?auto_385075 ?auto_385084 ) ) ( not ( = ?auto_385075 ?auto_385085 ) ) ( not ( = ?auto_385075 ?auto_385086 ) ) ( not ( = ?auto_385076 ?auto_385077 ) ) ( not ( = ?auto_385076 ?auto_385078 ) ) ( not ( = ?auto_385076 ?auto_385079 ) ) ( not ( = ?auto_385076 ?auto_385080 ) ) ( not ( = ?auto_385076 ?auto_385081 ) ) ( not ( = ?auto_385076 ?auto_385082 ) ) ( not ( = ?auto_385076 ?auto_385083 ) ) ( not ( = ?auto_385076 ?auto_385084 ) ) ( not ( = ?auto_385076 ?auto_385085 ) ) ( not ( = ?auto_385076 ?auto_385086 ) ) ( not ( = ?auto_385077 ?auto_385078 ) ) ( not ( = ?auto_385077 ?auto_385079 ) ) ( not ( = ?auto_385077 ?auto_385080 ) ) ( not ( = ?auto_385077 ?auto_385081 ) ) ( not ( = ?auto_385077 ?auto_385082 ) ) ( not ( = ?auto_385077 ?auto_385083 ) ) ( not ( = ?auto_385077 ?auto_385084 ) ) ( not ( = ?auto_385077 ?auto_385085 ) ) ( not ( = ?auto_385077 ?auto_385086 ) ) ( not ( = ?auto_385078 ?auto_385079 ) ) ( not ( = ?auto_385078 ?auto_385080 ) ) ( not ( = ?auto_385078 ?auto_385081 ) ) ( not ( = ?auto_385078 ?auto_385082 ) ) ( not ( = ?auto_385078 ?auto_385083 ) ) ( not ( = ?auto_385078 ?auto_385084 ) ) ( not ( = ?auto_385078 ?auto_385085 ) ) ( not ( = ?auto_385078 ?auto_385086 ) ) ( not ( = ?auto_385079 ?auto_385080 ) ) ( not ( = ?auto_385079 ?auto_385081 ) ) ( not ( = ?auto_385079 ?auto_385082 ) ) ( not ( = ?auto_385079 ?auto_385083 ) ) ( not ( = ?auto_385079 ?auto_385084 ) ) ( not ( = ?auto_385079 ?auto_385085 ) ) ( not ( = ?auto_385079 ?auto_385086 ) ) ( not ( = ?auto_385080 ?auto_385081 ) ) ( not ( = ?auto_385080 ?auto_385082 ) ) ( not ( = ?auto_385080 ?auto_385083 ) ) ( not ( = ?auto_385080 ?auto_385084 ) ) ( not ( = ?auto_385080 ?auto_385085 ) ) ( not ( = ?auto_385080 ?auto_385086 ) ) ( not ( = ?auto_385081 ?auto_385082 ) ) ( not ( = ?auto_385081 ?auto_385083 ) ) ( not ( = ?auto_385081 ?auto_385084 ) ) ( not ( = ?auto_385081 ?auto_385085 ) ) ( not ( = ?auto_385081 ?auto_385086 ) ) ( not ( = ?auto_385082 ?auto_385083 ) ) ( not ( = ?auto_385082 ?auto_385084 ) ) ( not ( = ?auto_385082 ?auto_385085 ) ) ( not ( = ?auto_385082 ?auto_385086 ) ) ( not ( = ?auto_385083 ?auto_385084 ) ) ( not ( = ?auto_385083 ?auto_385085 ) ) ( not ( = ?auto_385083 ?auto_385086 ) ) ( not ( = ?auto_385084 ?auto_385085 ) ) ( not ( = ?auto_385084 ?auto_385086 ) ) ( not ( = ?auto_385085 ?auto_385086 ) ) ( ON ?auto_385084 ?auto_385085 ) ( CLEAR ?auto_385082 ) ( ON ?auto_385083 ?auto_385084 ) ( CLEAR ?auto_385083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_385072 ?auto_385073 ?auto_385074 ?auto_385075 ?auto_385076 ?auto_385077 ?auto_385078 ?auto_385079 ?auto_385080 ?auto_385081 ?auto_385082 ?auto_385083 )
      ( MAKE-14PILE ?auto_385072 ?auto_385073 ?auto_385074 ?auto_385075 ?auto_385076 ?auto_385077 ?auto_385078 ?auto_385079 ?auto_385080 ?auto_385081 ?auto_385082 ?auto_385083 ?auto_385084 ?auto_385085 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385101 - BLOCK
      ?auto_385102 - BLOCK
      ?auto_385103 - BLOCK
      ?auto_385104 - BLOCK
      ?auto_385105 - BLOCK
      ?auto_385106 - BLOCK
      ?auto_385107 - BLOCK
      ?auto_385108 - BLOCK
      ?auto_385109 - BLOCK
      ?auto_385110 - BLOCK
      ?auto_385111 - BLOCK
      ?auto_385112 - BLOCK
      ?auto_385113 - BLOCK
      ?auto_385114 - BLOCK
    )
    :vars
    (
      ?auto_385115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385114 ?auto_385115 ) ( ON-TABLE ?auto_385101 ) ( ON ?auto_385102 ?auto_385101 ) ( ON ?auto_385103 ?auto_385102 ) ( ON ?auto_385104 ?auto_385103 ) ( ON ?auto_385105 ?auto_385104 ) ( ON ?auto_385106 ?auto_385105 ) ( ON ?auto_385107 ?auto_385106 ) ( ON ?auto_385108 ?auto_385107 ) ( ON ?auto_385109 ?auto_385108 ) ( ON ?auto_385110 ?auto_385109 ) ( ON ?auto_385111 ?auto_385110 ) ( not ( = ?auto_385101 ?auto_385102 ) ) ( not ( = ?auto_385101 ?auto_385103 ) ) ( not ( = ?auto_385101 ?auto_385104 ) ) ( not ( = ?auto_385101 ?auto_385105 ) ) ( not ( = ?auto_385101 ?auto_385106 ) ) ( not ( = ?auto_385101 ?auto_385107 ) ) ( not ( = ?auto_385101 ?auto_385108 ) ) ( not ( = ?auto_385101 ?auto_385109 ) ) ( not ( = ?auto_385101 ?auto_385110 ) ) ( not ( = ?auto_385101 ?auto_385111 ) ) ( not ( = ?auto_385101 ?auto_385112 ) ) ( not ( = ?auto_385101 ?auto_385113 ) ) ( not ( = ?auto_385101 ?auto_385114 ) ) ( not ( = ?auto_385101 ?auto_385115 ) ) ( not ( = ?auto_385102 ?auto_385103 ) ) ( not ( = ?auto_385102 ?auto_385104 ) ) ( not ( = ?auto_385102 ?auto_385105 ) ) ( not ( = ?auto_385102 ?auto_385106 ) ) ( not ( = ?auto_385102 ?auto_385107 ) ) ( not ( = ?auto_385102 ?auto_385108 ) ) ( not ( = ?auto_385102 ?auto_385109 ) ) ( not ( = ?auto_385102 ?auto_385110 ) ) ( not ( = ?auto_385102 ?auto_385111 ) ) ( not ( = ?auto_385102 ?auto_385112 ) ) ( not ( = ?auto_385102 ?auto_385113 ) ) ( not ( = ?auto_385102 ?auto_385114 ) ) ( not ( = ?auto_385102 ?auto_385115 ) ) ( not ( = ?auto_385103 ?auto_385104 ) ) ( not ( = ?auto_385103 ?auto_385105 ) ) ( not ( = ?auto_385103 ?auto_385106 ) ) ( not ( = ?auto_385103 ?auto_385107 ) ) ( not ( = ?auto_385103 ?auto_385108 ) ) ( not ( = ?auto_385103 ?auto_385109 ) ) ( not ( = ?auto_385103 ?auto_385110 ) ) ( not ( = ?auto_385103 ?auto_385111 ) ) ( not ( = ?auto_385103 ?auto_385112 ) ) ( not ( = ?auto_385103 ?auto_385113 ) ) ( not ( = ?auto_385103 ?auto_385114 ) ) ( not ( = ?auto_385103 ?auto_385115 ) ) ( not ( = ?auto_385104 ?auto_385105 ) ) ( not ( = ?auto_385104 ?auto_385106 ) ) ( not ( = ?auto_385104 ?auto_385107 ) ) ( not ( = ?auto_385104 ?auto_385108 ) ) ( not ( = ?auto_385104 ?auto_385109 ) ) ( not ( = ?auto_385104 ?auto_385110 ) ) ( not ( = ?auto_385104 ?auto_385111 ) ) ( not ( = ?auto_385104 ?auto_385112 ) ) ( not ( = ?auto_385104 ?auto_385113 ) ) ( not ( = ?auto_385104 ?auto_385114 ) ) ( not ( = ?auto_385104 ?auto_385115 ) ) ( not ( = ?auto_385105 ?auto_385106 ) ) ( not ( = ?auto_385105 ?auto_385107 ) ) ( not ( = ?auto_385105 ?auto_385108 ) ) ( not ( = ?auto_385105 ?auto_385109 ) ) ( not ( = ?auto_385105 ?auto_385110 ) ) ( not ( = ?auto_385105 ?auto_385111 ) ) ( not ( = ?auto_385105 ?auto_385112 ) ) ( not ( = ?auto_385105 ?auto_385113 ) ) ( not ( = ?auto_385105 ?auto_385114 ) ) ( not ( = ?auto_385105 ?auto_385115 ) ) ( not ( = ?auto_385106 ?auto_385107 ) ) ( not ( = ?auto_385106 ?auto_385108 ) ) ( not ( = ?auto_385106 ?auto_385109 ) ) ( not ( = ?auto_385106 ?auto_385110 ) ) ( not ( = ?auto_385106 ?auto_385111 ) ) ( not ( = ?auto_385106 ?auto_385112 ) ) ( not ( = ?auto_385106 ?auto_385113 ) ) ( not ( = ?auto_385106 ?auto_385114 ) ) ( not ( = ?auto_385106 ?auto_385115 ) ) ( not ( = ?auto_385107 ?auto_385108 ) ) ( not ( = ?auto_385107 ?auto_385109 ) ) ( not ( = ?auto_385107 ?auto_385110 ) ) ( not ( = ?auto_385107 ?auto_385111 ) ) ( not ( = ?auto_385107 ?auto_385112 ) ) ( not ( = ?auto_385107 ?auto_385113 ) ) ( not ( = ?auto_385107 ?auto_385114 ) ) ( not ( = ?auto_385107 ?auto_385115 ) ) ( not ( = ?auto_385108 ?auto_385109 ) ) ( not ( = ?auto_385108 ?auto_385110 ) ) ( not ( = ?auto_385108 ?auto_385111 ) ) ( not ( = ?auto_385108 ?auto_385112 ) ) ( not ( = ?auto_385108 ?auto_385113 ) ) ( not ( = ?auto_385108 ?auto_385114 ) ) ( not ( = ?auto_385108 ?auto_385115 ) ) ( not ( = ?auto_385109 ?auto_385110 ) ) ( not ( = ?auto_385109 ?auto_385111 ) ) ( not ( = ?auto_385109 ?auto_385112 ) ) ( not ( = ?auto_385109 ?auto_385113 ) ) ( not ( = ?auto_385109 ?auto_385114 ) ) ( not ( = ?auto_385109 ?auto_385115 ) ) ( not ( = ?auto_385110 ?auto_385111 ) ) ( not ( = ?auto_385110 ?auto_385112 ) ) ( not ( = ?auto_385110 ?auto_385113 ) ) ( not ( = ?auto_385110 ?auto_385114 ) ) ( not ( = ?auto_385110 ?auto_385115 ) ) ( not ( = ?auto_385111 ?auto_385112 ) ) ( not ( = ?auto_385111 ?auto_385113 ) ) ( not ( = ?auto_385111 ?auto_385114 ) ) ( not ( = ?auto_385111 ?auto_385115 ) ) ( not ( = ?auto_385112 ?auto_385113 ) ) ( not ( = ?auto_385112 ?auto_385114 ) ) ( not ( = ?auto_385112 ?auto_385115 ) ) ( not ( = ?auto_385113 ?auto_385114 ) ) ( not ( = ?auto_385113 ?auto_385115 ) ) ( not ( = ?auto_385114 ?auto_385115 ) ) ( ON ?auto_385113 ?auto_385114 ) ( CLEAR ?auto_385111 ) ( ON ?auto_385112 ?auto_385113 ) ( CLEAR ?auto_385112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_385101 ?auto_385102 ?auto_385103 ?auto_385104 ?auto_385105 ?auto_385106 ?auto_385107 ?auto_385108 ?auto_385109 ?auto_385110 ?auto_385111 ?auto_385112 )
      ( MAKE-14PILE ?auto_385101 ?auto_385102 ?auto_385103 ?auto_385104 ?auto_385105 ?auto_385106 ?auto_385107 ?auto_385108 ?auto_385109 ?auto_385110 ?auto_385111 ?auto_385112 ?auto_385113 ?auto_385114 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385130 - BLOCK
      ?auto_385131 - BLOCK
      ?auto_385132 - BLOCK
      ?auto_385133 - BLOCK
      ?auto_385134 - BLOCK
      ?auto_385135 - BLOCK
      ?auto_385136 - BLOCK
      ?auto_385137 - BLOCK
      ?auto_385138 - BLOCK
      ?auto_385139 - BLOCK
      ?auto_385140 - BLOCK
      ?auto_385141 - BLOCK
      ?auto_385142 - BLOCK
      ?auto_385143 - BLOCK
    )
    :vars
    (
      ?auto_385144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385143 ?auto_385144 ) ( ON-TABLE ?auto_385130 ) ( ON ?auto_385131 ?auto_385130 ) ( ON ?auto_385132 ?auto_385131 ) ( ON ?auto_385133 ?auto_385132 ) ( ON ?auto_385134 ?auto_385133 ) ( ON ?auto_385135 ?auto_385134 ) ( ON ?auto_385136 ?auto_385135 ) ( ON ?auto_385137 ?auto_385136 ) ( ON ?auto_385138 ?auto_385137 ) ( ON ?auto_385139 ?auto_385138 ) ( not ( = ?auto_385130 ?auto_385131 ) ) ( not ( = ?auto_385130 ?auto_385132 ) ) ( not ( = ?auto_385130 ?auto_385133 ) ) ( not ( = ?auto_385130 ?auto_385134 ) ) ( not ( = ?auto_385130 ?auto_385135 ) ) ( not ( = ?auto_385130 ?auto_385136 ) ) ( not ( = ?auto_385130 ?auto_385137 ) ) ( not ( = ?auto_385130 ?auto_385138 ) ) ( not ( = ?auto_385130 ?auto_385139 ) ) ( not ( = ?auto_385130 ?auto_385140 ) ) ( not ( = ?auto_385130 ?auto_385141 ) ) ( not ( = ?auto_385130 ?auto_385142 ) ) ( not ( = ?auto_385130 ?auto_385143 ) ) ( not ( = ?auto_385130 ?auto_385144 ) ) ( not ( = ?auto_385131 ?auto_385132 ) ) ( not ( = ?auto_385131 ?auto_385133 ) ) ( not ( = ?auto_385131 ?auto_385134 ) ) ( not ( = ?auto_385131 ?auto_385135 ) ) ( not ( = ?auto_385131 ?auto_385136 ) ) ( not ( = ?auto_385131 ?auto_385137 ) ) ( not ( = ?auto_385131 ?auto_385138 ) ) ( not ( = ?auto_385131 ?auto_385139 ) ) ( not ( = ?auto_385131 ?auto_385140 ) ) ( not ( = ?auto_385131 ?auto_385141 ) ) ( not ( = ?auto_385131 ?auto_385142 ) ) ( not ( = ?auto_385131 ?auto_385143 ) ) ( not ( = ?auto_385131 ?auto_385144 ) ) ( not ( = ?auto_385132 ?auto_385133 ) ) ( not ( = ?auto_385132 ?auto_385134 ) ) ( not ( = ?auto_385132 ?auto_385135 ) ) ( not ( = ?auto_385132 ?auto_385136 ) ) ( not ( = ?auto_385132 ?auto_385137 ) ) ( not ( = ?auto_385132 ?auto_385138 ) ) ( not ( = ?auto_385132 ?auto_385139 ) ) ( not ( = ?auto_385132 ?auto_385140 ) ) ( not ( = ?auto_385132 ?auto_385141 ) ) ( not ( = ?auto_385132 ?auto_385142 ) ) ( not ( = ?auto_385132 ?auto_385143 ) ) ( not ( = ?auto_385132 ?auto_385144 ) ) ( not ( = ?auto_385133 ?auto_385134 ) ) ( not ( = ?auto_385133 ?auto_385135 ) ) ( not ( = ?auto_385133 ?auto_385136 ) ) ( not ( = ?auto_385133 ?auto_385137 ) ) ( not ( = ?auto_385133 ?auto_385138 ) ) ( not ( = ?auto_385133 ?auto_385139 ) ) ( not ( = ?auto_385133 ?auto_385140 ) ) ( not ( = ?auto_385133 ?auto_385141 ) ) ( not ( = ?auto_385133 ?auto_385142 ) ) ( not ( = ?auto_385133 ?auto_385143 ) ) ( not ( = ?auto_385133 ?auto_385144 ) ) ( not ( = ?auto_385134 ?auto_385135 ) ) ( not ( = ?auto_385134 ?auto_385136 ) ) ( not ( = ?auto_385134 ?auto_385137 ) ) ( not ( = ?auto_385134 ?auto_385138 ) ) ( not ( = ?auto_385134 ?auto_385139 ) ) ( not ( = ?auto_385134 ?auto_385140 ) ) ( not ( = ?auto_385134 ?auto_385141 ) ) ( not ( = ?auto_385134 ?auto_385142 ) ) ( not ( = ?auto_385134 ?auto_385143 ) ) ( not ( = ?auto_385134 ?auto_385144 ) ) ( not ( = ?auto_385135 ?auto_385136 ) ) ( not ( = ?auto_385135 ?auto_385137 ) ) ( not ( = ?auto_385135 ?auto_385138 ) ) ( not ( = ?auto_385135 ?auto_385139 ) ) ( not ( = ?auto_385135 ?auto_385140 ) ) ( not ( = ?auto_385135 ?auto_385141 ) ) ( not ( = ?auto_385135 ?auto_385142 ) ) ( not ( = ?auto_385135 ?auto_385143 ) ) ( not ( = ?auto_385135 ?auto_385144 ) ) ( not ( = ?auto_385136 ?auto_385137 ) ) ( not ( = ?auto_385136 ?auto_385138 ) ) ( not ( = ?auto_385136 ?auto_385139 ) ) ( not ( = ?auto_385136 ?auto_385140 ) ) ( not ( = ?auto_385136 ?auto_385141 ) ) ( not ( = ?auto_385136 ?auto_385142 ) ) ( not ( = ?auto_385136 ?auto_385143 ) ) ( not ( = ?auto_385136 ?auto_385144 ) ) ( not ( = ?auto_385137 ?auto_385138 ) ) ( not ( = ?auto_385137 ?auto_385139 ) ) ( not ( = ?auto_385137 ?auto_385140 ) ) ( not ( = ?auto_385137 ?auto_385141 ) ) ( not ( = ?auto_385137 ?auto_385142 ) ) ( not ( = ?auto_385137 ?auto_385143 ) ) ( not ( = ?auto_385137 ?auto_385144 ) ) ( not ( = ?auto_385138 ?auto_385139 ) ) ( not ( = ?auto_385138 ?auto_385140 ) ) ( not ( = ?auto_385138 ?auto_385141 ) ) ( not ( = ?auto_385138 ?auto_385142 ) ) ( not ( = ?auto_385138 ?auto_385143 ) ) ( not ( = ?auto_385138 ?auto_385144 ) ) ( not ( = ?auto_385139 ?auto_385140 ) ) ( not ( = ?auto_385139 ?auto_385141 ) ) ( not ( = ?auto_385139 ?auto_385142 ) ) ( not ( = ?auto_385139 ?auto_385143 ) ) ( not ( = ?auto_385139 ?auto_385144 ) ) ( not ( = ?auto_385140 ?auto_385141 ) ) ( not ( = ?auto_385140 ?auto_385142 ) ) ( not ( = ?auto_385140 ?auto_385143 ) ) ( not ( = ?auto_385140 ?auto_385144 ) ) ( not ( = ?auto_385141 ?auto_385142 ) ) ( not ( = ?auto_385141 ?auto_385143 ) ) ( not ( = ?auto_385141 ?auto_385144 ) ) ( not ( = ?auto_385142 ?auto_385143 ) ) ( not ( = ?auto_385142 ?auto_385144 ) ) ( not ( = ?auto_385143 ?auto_385144 ) ) ( ON ?auto_385142 ?auto_385143 ) ( ON ?auto_385141 ?auto_385142 ) ( CLEAR ?auto_385139 ) ( ON ?auto_385140 ?auto_385141 ) ( CLEAR ?auto_385140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_385130 ?auto_385131 ?auto_385132 ?auto_385133 ?auto_385134 ?auto_385135 ?auto_385136 ?auto_385137 ?auto_385138 ?auto_385139 ?auto_385140 )
      ( MAKE-14PILE ?auto_385130 ?auto_385131 ?auto_385132 ?auto_385133 ?auto_385134 ?auto_385135 ?auto_385136 ?auto_385137 ?auto_385138 ?auto_385139 ?auto_385140 ?auto_385141 ?auto_385142 ?auto_385143 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385159 - BLOCK
      ?auto_385160 - BLOCK
      ?auto_385161 - BLOCK
      ?auto_385162 - BLOCK
      ?auto_385163 - BLOCK
      ?auto_385164 - BLOCK
      ?auto_385165 - BLOCK
      ?auto_385166 - BLOCK
      ?auto_385167 - BLOCK
      ?auto_385168 - BLOCK
      ?auto_385169 - BLOCK
      ?auto_385170 - BLOCK
      ?auto_385171 - BLOCK
      ?auto_385172 - BLOCK
    )
    :vars
    (
      ?auto_385173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385172 ?auto_385173 ) ( ON-TABLE ?auto_385159 ) ( ON ?auto_385160 ?auto_385159 ) ( ON ?auto_385161 ?auto_385160 ) ( ON ?auto_385162 ?auto_385161 ) ( ON ?auto_385163 ?auto_385162 ) ( ON ?auto_385164 ?auto_385163 ) ( ON ?auto_385165 ?auto_385164 ) ( ON ?auto_385166 ?auto_385165 ) ( ON ?auto_385167 ?auto_385166 ) ( ON ?auto_385168 ?auto_385167 ) ( not ( = ?auto_385159 ?auto_385160 ) ) ( not ( = ?auto_385159 ?auto_385161 ) ) ( not ( = ?auto_385159 ?auto_385162 ) ) ( not ( = ?auto_385159 ?auto_385163 ) ) ( not ( = ?auto_385159 ?auto_385164 ) ) ( not ( = ?auto_385159 ?auto_385165 ) ) ( not ( = ?auto_385159 ?auto_385166 ) ) ( not ( = ?auto_385159 ?auto_385167 ) ) ( not ( = ?auto_385159 ?auto_385168 ) ) ( not ( = ?auto_385159 ?auto_385169 ) ) ( not ( = ?auto_385159 ?auto_385170 ) ) ( not ( = ?auto_385159 ?auto_385171 ) ) ( not ( = ?auto_385159 ?auto_385172 ) ) ( not ( = ?auto_385159 ?auto_385173 ) ) ( not ( = ?auto_385160 ?auto_385161 ) ) ( not ( = ?auto_385160 ?auto_385162 ) ) ( not ( = ?auto_385160 ?auto_385163 ) ) ( not ( = ?auto_385160 ?auto_385164 ) ) ( not ( = ?auto_385160 ?auto_385165 ) ) ( not ( = ?auto_385160 ?auto_385166 ) ) ( not ( = ?auto_385160 ?auto_385167 ) ) ( not ( = ?auto_385160 ?auto_385168 ) ) ( not ( = ?auto_385160 ?auto_385169 ) ) ( not ( = ?auto_385160 ?auto_385170 ) ) ( not ( = ?auto_385160 ?auto_385171 ) ) ( not ( = ?auto_385160 ?auto_385172 ) ) ( not ( = ?auto_385160 ?auto_385173 ) ) ( not ( = ?auto_385161 ?auto_385162 ) ) ( not ( = ?auto_385161 ?auto_385163 ) ) ( not ( = ?auto_385161 ?auto_385164 ) ) ( not ( = ?auto_385161 ?auto_385165 ) ) ( not ( = ?auto_385161 ?auto_385166 ) ) ( not ( = ?auto_385161 ?auto_385167 ) ) ( not ( = ?auto_385161 ?auto_385168 ) ) ( not ( = ?auto_385161 ?auto_385169 ) ) ( not ( = ?auto_385161 ?auto_385170 ) ) ( not ( = ?auto_385161 ?auto_385171 ) ) ( not ( = ?auto_385161 ?auto_385172 ) ) ( not ( = ?auto_385161 ?auto_385173 ) ) ( not ( = ?auto_385162 ?auto_385163 ) ) ( not ( = ?auto_385162 ?auto_385164 ) ) ( not ( = ?auto_385162 ?auto_385165 ) ) ( not ( = ?auto_385162 ?auto_385166 ) ) ( not ( = ?auto_385162 ?auto_385167 ) ) ( not ( = ?auto_385162 ?auto_385168 ) ) ( not ( = ?auto_385162 ?auto_385169 ) ) ( not ( = ?auto_385162 ?auto_385170 ) ) ( not ( = ?auto_385162 ?auto_385171 ) ) ( not ( = ?auto_385162 ?auto_385172 ) ) ( not ( = ?auto_385162 ?auto_385173 ) ) ( not ( = ?auto_385163 ?auto_385164 ) ) ( not ( = ?auto_385163 ?auto_385165 ) ) ( not ( = ?auto_385163 ?auto_385166 ) ) ( not ( = ?auto_385163 ?auto_385167 ) ) ( not ( = ?auto_385163 ?auto_385168 ) ) ( not ( = ?auto_385163 ?auto_385169 ) ) ( not ( = ?auto_385163 ?auto_385170 ) ) ( not ( = ?auto_385163 ?auto_385171 ) ) ( not ( = ?auto_385163 ?auto_385172 ) ) ( not ( = ?auto_385163 ?auto_385173 ) ) ( not ( = ?auto_385164 ?auto_385165 ) ) ( not ( = ?auto_385164 ?auto_385166 ) ) ( not ( = ?auto_385164 ?auto_385167 ) ) ( not ( = ?auto_385164 ?auto_385168 ) ) ( not ( = ?auto_385164 ?auto_385169 ) ) ( not ( = ?auto_385164 ?auto_385170 ) ) ( not ( = ?auto_385164 ?auto_385171 ) ) ( not ( = ?auto_385164 ?auto_385172 ) ) ( not ( = ?auto_385164 ?auto_385173 ) ) ( not ( = ?auto_385165 ?auto_385166 ) ) ( not ( = ?auto_385165 ?auto_385167 ) ) ( not ( = ?auto_385165 ?auto_385168 ) ) ( not ( = ?auto_385165 ?auto_385169 ) ) ( not ( = ?auto_385165 ?auto_385170 ) ) ( not ( = ?auto_385165 ?auto_385171 ) ) ( not ( = ?auto_385165 ?auto_385172 ) ) ( not ( = ?auto_385165 ?auto_385173 ) ) ( not ( = ?auto_385166 ?auto_385167 ) ) ( not ( = ?auto_385166 ?auto_385168 ) ) ( not ( = ?auto_385166 ?auto_385169 ) ) ( not ( = ?auto_385166 ?auto_385170 ) ) ( not ( = ?auto_385166 ?auto_385171 ) ) ( not ( = ?auto_385166 ?auto_385172 ) ) ( not ( = ?auto_385166 ?auto_385173 ) ) ( not ( = ?auto_385167 ?auto_385168 ) ) ( not ( = ?auto_385167 ?auto_385169 ) ) ( not ( = ?auto_385167 ?auto_385170 ) ) ( not ( = ?auto_385167 ?auto_385171 ) ) ( not ( = ?auto_385167 ?auto_385172 ) ) ( not ( = ?auto_385167 ?auto_385173 ) ) ( not ( = ?auto_385168 ?auto_385169 ) ) ( not ( = ?auto_385168 ?auto_385170 ) ) ( not ( = ?auto_385168 ?auto_385171 ) ) ( not ( = ?auto_385168 ?auto_385172 ) ) ( not ( = ?auto_385168 ?auto_385173 ) ) ( not ( = ?auto_385169 ?auto_385170 ) ) ( not ( = ?auto_385169 ?auto_385171 ) ) ( not ( = ?auto_385169 ?auto_385172 ) ) ( not ( = ?auto_385169 ?auto_385173 ) ) ( not ( = ?auto_385170 ?auto_385171 ) ) ( not ( = ?auto_385170 ?auto_385172 ) ) ( not ( = ?auto_385170 ?auto_385173 ) ) ( not ( = ?auto_385171 ?auto_385172 ) ) ( not ( = ?auto_385171 ?auto_385173 ) ) ( not ( = ?auto_385172 ?auto_385173 ) ) ( ON ?auto_385171 ?auto_385172 ) ( ON ?auto_385170 ?auto_385171 ) ( CLEAR ?auto_385168 ) ( ON ?auto_385169 ?auto_385170 ) ( CLEAR ?auto_385169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_385159 ?auto_385160 ?auto_385161 ?auto_385162 ?auto_385163 ?auto_385164 ?auto_385165 ?auto_385166 ?auto_385167 ?auto_385168 ?auto_385169 )
      ( MAKE-14PILE ?auto_385159 ?auto_385160 ?auto_385161 ?auto_385162 ?auto_385163 ?auto_385164 ?auto_385165 ?auto_385166 ?auto_385167 ?auto_385168 ?auto_385169 ?auto_385170 ?auto_385171 ?auto_385172 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385188 - BLOCK
      ?auto_385189 - BLOCK
      ?auto_385190 - BLOCK
      ?auto_385191 - BLOCK
      ?auto_385192 - BLOCK
      ?auto_385193 - BLOCK
      ?auto_385194 - BLOCK
      ?auto_385195 - BLOCK
      ?auto_385196 - BLOCK
      ?auto_385197 - BLOCK
      ?auto_385198 - BLOCK
      ?auto_385199 - BLOCK
      ?auto_385200 - BLOCK
      ?auto_385201 - BLOCK
    )
    :vars
    (
      ?auto_385202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385201 ?auto_385202 ) ( ON-TABLE ?auto_385188 ) ( ON ?auto_385189 ?auto_385188 ) ( ON ?auto_385190 ?auto_385189 ) ( ON ?auto_385191 ?auto_385190 ) ( ON ?auto_385192 ?auto_385191 ) ( ON ?auto_385193 ?auto_385192 ) ( ON ?auto_385194 ?auto_385193 ) ( ON ?auto_385195 ?auto_385194 ) ( ON ?auto_385196 ?auto_385195 ) ( not ( = ?auto_385188 ?auto_385189 ) ) ( not ( = ?auto_385188 ?auto_385190 ) ) ( not ( = ?auto_385188 ?auto_385191 ) ) ( not ( = ?auto_385188 ?auto_385192 ) ) ( not ( = ?auto_385188 ?auto_385193 ) ) ( not ( = ?auto_385188 ?auto_385194 ) ) ( not ( = ?auto_385188 ?auto_385195 ) ) ( not ( = ?auto_385188 ?auto_385196 ) ) ( not ( = ?auto_385188 ?auto_385197 ) ) ( not ( = ?auto_385188 ?auto_385198 ) ) ( not ( = ?auto_385188 ?auto_385199 ) ) ( not ( = ?auto_385188 ?auto_385200 ) ) ( not ( = ?auto_385188 ?auto_385201 ) ) ( not ( = ?auto_385188 ?auto_385202 ) ) ( not ( = ?auto_385189 ?auto_385190 ) ) ( not ( = ?auto_385189 ?auto_385191 ) ) ( not ( = ?auto_385189 ?auto_385192 ) ) ( not ( = ?auto_385189 ?auto_385193 ) ) ( not ( = ?auto_385189 ?auto_385194 ) ) ( not ( = ?auto_385189 ?auto_385195 ) ) ( not ( = ?auto_385189 ?auto_385196 ) ) ( not ( = ?auto_385189 ?auto_385197 ) ) ( not ( = ?auto_385189 ?auto_385198 ) ) ( not ( = ?auto_385189 ?auto_385199 ) ) ( not ( = ?auto_385189 ?auto_385200 ) ) ( not ( = ?auto_385189 ?auto_385201 ) ) ( not ( = ?auto_385189 ?auto_385202 ) ) ( not ( = ?auto_385190 ?auto_385191 ) ) ( not ( = ?auto_385190 ?auto_385192 ) ) ( not ( = ?auto_385190 ?auto_385193 ) ) ( not ( = ?auto_385190 ?auto_385194 ) ) ( not ( = ?auto_385190 ?auto_385195 ) ) ( not ( = ?auto_385190 ?auto_385196 ) ) ( not ( = ?auto_385190 ?auto_385197 ) ) ( not ( = ?auto_385190 ?auto_385198 ) ) ( not ( = ?auto_385190 ?auto_385199 ) ) ( not ( = ?auto_385190 ?auto_385200 ) ) ( not ( = ?auto_385190 ?auto_385201 ) ) ( not ( = ?auto_385190 ?auto_385202 ) ) ( not ( = ?auto_385191 ?auto_385192 ) ) ( not ( = ?auto_385191 ?auto_385193 ) ) ( not ( = ?auto_385191 ?auto_385194 ) ) ( not ( = ?auto_385191 ?auto_385195 ) ) ( not ( = ?auto_385191 ?auto_385196 ) ) ( not ( = ?auto_385191 ?auto_385197 ) ) ( not ( = ?auto_385191 ?auto_385198 ) ) ( not ( = ?auto_385191 ?auto_385199 ) ) ( not ( = ?auto_385191 ?auto_385200 ) ) ( not ( = ?auto_385191 ?auto_385201 ) ) ( not ( = ?auto_385191 ?auto_385202 ) ) ( not ( = ?auto_385192 ?auto_385193 ) ) ( not ( = ?auto_385192 ?auto_385194 ) ) ( not ( = ?auto_385192 ?auto_385195 ) ) ( not ( = ?auto_385192 ?auto_385196 ) ) ( not ( = ?auto_385192 ?auto_385197 ) ) ( not ( = ?auto_385192 ?auto_385198 ) ) ( not ( = ?auto_385192 ?auto_385199 ) ) ( not ( = ?auto_385192 ?auto_385200 ) ) ( not ( = ?auto_385192 ?auto_385201 ) ) ( not ( = ?auto_385192 ?auto_385202 ) ) ( not ( = ?auto_385193 ?auto_385194 ) ) ( not ( = ?auto_385193 ?auto_385195 ) ) ( not ( = ?auto_385193 ?auto_385196 ) ) ( not ( = ?auto_385193 ?auto_385197 ) ) ( not ( = ?auto_385193 ?auto_385198 ) ) ( not ( = ?auto_385193 ?auto_385199 ) ) ( not ( = ?auto_385193 ?auto_385200 ) ) ( not ( = ?auto_385193 ?auto_385201 ) ) ( not ( = ?auto_385193 ?auto_385202 ) ) ( not ( = ?auto_385194 ?auto_385195 ) ) ( not ( = ?auto_385194 ?auto_385196 ) ) ( not ( = ?auto_385194 ?auto_385197 ) ) ( not ( = ?auto_385194 ?auto_385198 ) ) ( not ( = ?auto_385194 ?auto_385199 ) ) ( not ( = ?auto_385194 ?auto_385200 ) ) ( not ( = ?auto_385194 ?auto_385201 ) ) ( not ( = ?auto_385194 ?auto_385202 ) ) ( not ( = ?auto_385195 ?auto_385196 ) ) ( not ( = ?auto_385195 ?auto_385197 ) ) ( not ( = ?auto_385195 ?auto_385198 ) ) ( not ( = ?auto_385195 ?auto_385199 ) ) ( not ( = ?auto_385195 ?auto_385200 ) ) ( not ( = ?auto_385195 ?auto_385201 ) ) ( not ( = ?auto_385195 ?auto_385202 ) ) ( not ( = ?auto_385196 ?auto_385197 ) ) ( not ( = ?auto_385196 ?auto_385198 ) ) ( not ( = ?auto_385196 ?auto_385199 ) ) ( not ( = ?auto_385196 ?auto_385200 ) ) ( not ( = ?auto_385196 ?auto_385201 ) ) ( not ( = ?auto_385196 ?auto_385202 ) ) ( not ( = ?auto_385197 ?auto_385198 ) ) ( not ( = ?auto_385197 ?auto_385199 ) ) ( not ( = ?auto_385197 ?auto_385200 ) ) ( not ( = ?auto_385197 ?auto_385201 ) ) ( not ( = ?auto_385197 ?auto_385202 ) ) ( not ( = ?auto_385198 ?auto_385199 ) ) ( not ( = ?auto_385198 ?auto_385200 ) ) ( not ( = ?auto_385198 ?auto_385201 ) ) ( not ( = ?auto_385198 ?auto_385202 ) ) ( not ( = ?auto_385199 ?auto_385200 ) ) ( not ( = ?auto_385199 ?auto_385201 ) ) ( not ( = ?auto_385199 ?auto_385202 ) ) ( not ( = ?auto_385200 ?auto_385201 ) ) ( not ( = ?auto_385200 ?auto_385202 ) ) ( not ( = ?auto_385201 ?auto_385202 ) ) ( ON ?auto_385200 ?auto_385201 ) ( ON ?auto_385199 ?auto_385200 ) ( ON ?auto_385198 ?auto_385199 ) ( CLEAR ?auto_385196 ) ( ON ?auto_385197 ?auto_385198 ) ( CLEAR ?auto_385197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_385188 ?auto_385189 ?auto_385190 ?auto_385191 ?auto_385192 ?auto_385193 ?auto_385194 ?auto_385195 ?auto_385196 ?auto_385197 )
      ( MAKE-14PILE ?auto_385188 ?auto_385189 ?auto_385190 ?auto_385191 ?auto_385192 ?auto_385193 ?auto_385194 ?auto_385195 ?auto_385196 ?auto_385197 ?auto_385198 ?auto_385199 ?auto_385200 ?auto_385201 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385217 - BLOCK
      ?auto_385218 - BLOCK
      ?auto_385219 - BLOCK
      ?auto_385220 - BLOCK
      ?auto_385221 - BLOCK
      ?auto_385222 - BLOCK
      ?auto_385223 - BLOCK
      ?auto_385224 - BLOCK
      ?auto_385225 - BLOCK
      ?auto_385226 - BLOCK
      ?auto_385227 - BLOCK
      ?auto_385228 - BLOCK
      ?auto_385229 - BLOCK
      ?auto_385230 - BLOCK
    )
    :vars
    (
      ?auto_385231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385230 ?auto_385231 ) ( ON-TABLE ?auto_385217 ) ( ON ?auto_385218 ?auto_385217 ) ( ON ?auto_385219 ?auto_385218 ) ( ON ?auto_385220 ?auto_385219 ) ( ON ?auto_385221 ?auto_385220 ) ( ON ?auto_385222 ?auto_385221 ) ( ON ?auto_385223 ?auto_385222 ) ( ON ?auto_385224 ?auto_385223 ) ( ON ?auto_385225 ?auto_385224 ) ( not ( = ?auto_385217 ?auto_385218 ) ) ( not ( = ?auto_385217 ?auto_385219 ) ) ( not ( = ?auto_385217 ?auto_385220 ) ) ( not ( = ?auto_385217 ?auto_385221 ) ) ( not ( = ?auto_385217 ?auto_385222 ) ) ( not ( = ?auto_385217 ?auto_385223 ) ) ( not ( = ?auto_385217 ?auto_385224 ) ) ( not ( = ?auto_385217 ?auto_385225 ) ) ( not ( = ?auto_385217 ?auto_385226 ) ) ( not ( = ?auto_385217 ?auto_385227 ) ) ( not ( = ?auto_385217 ?auto_385228 ) ) ( not ( = ?auto_385217 ?auto_385229 ) ) ( not ( = ?auto_385217 ?auto_385230 ) ) ( not ( = ?auto_385217 ?auto_385231 ) ) ( not ( = ?auto_385218 ?auto_385219 ) ) ( not ( = ?auto_385218 ?auto_385220 ) ) ( not ( = ?auto_385218 ?auto_385221 ) ) ( not ( = ?auto_385218 ?auto_385222 ) ) ( not ( = ?auto_385218 ?auto_385223 ) ) ( not ( = ?auto_385218 ?auto_385224 ) ) ( not ( = ?auto_385218 ?auto_385225 ) ) ( not ( = ?auto_385218 ?auto_385226 ) ) ( not ( = ?auto_385218 ?auto_385227 ) ) ( not ( = ?auto_385218 ?auto_385228 ) ) ( not ( = ?auto_385218 ?auto_385229 ) ) ( not ( = ?auto_385218 ?auto_385230 ) ) ( not ( = ?auto_385218 ?auto_385231 ) ) ( not ( = ?auto_385219 ?auto_385220 ) ) ( not ( = ?auto_385219 ?auto_385221 ) ) ( not ( = ?auto_385219 ?auto_385222 ) ) ( not ( = ?auto_385219 ?auto_385223 ) ) ( not ( = ?auto_385219 ?auto_385224 ) ) ( not ( = ?auto_385219 ?auto_385225 ) ) ( not ( = ?auto_385219 ?auto_385226 ) ) ( not ( = ?auto_385219 ?auto_385227 ) ) ( not ( = ?auto_385219 ?auto_385228 ) ) ( not ( = ?auto_385219 ?auto_385229 ) ) ( not ( = ?auto_385219 ?auto_385230 ) ) ( not ( = ?auto_385219 ?auto_385231 ) ) ( not ( = ?auto_385220 ?auto_385221 ) ) ( not ( = ?auto_385220 ?auto_385222 ) ) ( not ( = ?auto_385220 ?auto_385223 ) ) ( not ( = ?auto_385220 ?auto_385224 ) ) ( not ( = ?auto_385220 ?auto_385225 ) ) ( not ( = ?auto_385220 ?auto_385226 ) ) ( not ( = ?auto_385220 ?auto_385227 ) ) ( not ( = ?auto_385220 ?auto_385228 ) ) ( not ( = ?auto_385220 ?auto_385229 ) ) ( not ( = ?auto_385220 ?auto_385230 ) ) ( not ( = ?auto_385220 ?auto_385231 ) ) ( not ( = ?auto_385221 ?auto_385222 ) ) ( not ( = ?auto_385221 ?auto_385223 ) ) ( not ( = ?auto_385221 ?auto_385224 ) ) ( not ( = ?auto_385221 ?auto_385225 ) ) ( not ( = ?auto_385221 ?auto_385226 ) ) ( not ( = ?auto_385221 ?auto_385227 ) ) ( not ( = ?auto_385221 ?auto_385228 ) ) ( not ( = ?auto_385221 ?auto_385229 ) ) ( not ( = ?auto_385221 ?auto_385230 ) ) ( not ( = ?auto_385221 ?auto_385231 ) ) ( not ( = ?auto_385222 ?auto_385223 ) ) ( not ( = ?auto_385222 ?auto_385224 ) ) ( not ( = ?auto_385222 ?auto_385225 ) ) ( not ( = ?auto_385222 ?auto_385226 ) ) ( not ( = ?auto_385222 ?auto_385227 ) ) ( not ( = ?auto_385222 ?auto_385228 ) ) ( not ( = ?auto_385222 ?auto_385229 ) ) ( not ( = ?auto_385222 ?auto_385230 ) ) ( not ( = ?auto_385222 ?auto_385231 ) ) ( not ( = ?auto_385223 ?auto_385224 ) ) ( not ( = ?auto_385223 ?auto_385225 ) ) ( not ( = ?auto_385223 ?auto_385226 ) ) ( not ( = ?auto_385223 ?auto_385227 ) ) ( not ( = ?auto_385223 ?auto_385228 ) ) ( not ( = ?auto_385223 ?auto_385229 ) ) ( not ( = ?auto_385223 ?auto_385230 ) ) ( not ( = ?auto_385223 ?auto_385231 ) ) ( not ( = ?auto_385224 ?auto_385225 ) ) ( not ( = ?auto_385224 ?auto_385226 ) ) ( not ( = ?auto_385224 ?auto_385227 ) ) ( not ( = ?auto_385224 ?auto_385228 ) ) ( not ( = ?auto_385224 ?auto_385229 ) ) ( not ( = ?auto_385224 ?auto_385230 ) ) ( not ( = ?auto_385224 ?auto_385231 ) ) ( not ( = ?auto_385225 ?auto_385226 ) ) ( not ( = ?auto_385225 ?auto_385227 ) ) ( not ( = ?auto_385225 ?auto_385228 ) ) ( not ( = ?auto_385225 ?auto_385229 ) ) ( not ( = ?auto_385225 ?auto_385230 ) ) ( not ( = ?auto_385225 ?auto_385231 ) ) ( not ( = ?auto_385226 ?auto_385227 ) ) ( not ( = ?auto_385226 ?auto_385228 ) ) ( not ( = ?auto_385226 ?auto_385229 ) ) ( not ( = ?auto_385226 ?auto_385230 ) ) ( not ( = ?auto_385226 ?auto_385231 ) ) ( not ( = ?auto_385227 ?auto_385228 ) ) ( not ( = ?auto_385227 ?auto_385229 ) ) ( not ( = ?auto_385227 ?auto_385230 ) ) ( not ( = ?auto_385227 ?auto_385231 ) ) ( not ( = ?auto_385228 ?auto_385229 ) ) ( not ( = ?auto_385228 ?auto_385230 ) ) ( not ( = ?auto_385228 ?auto_385231 ) ) ( not ( = ?auto_385229 ?auto_385230 ) ) ( not ( = ?auto_385229 ?auto_385231 ) ) ( not ( = ?auto_385230 ?auto_385231 ) ) ( ON ?auto_385229 ?auto_385230 ) ( ON ?auto_385228 ?auto_385229 ) ( ON ?auto_385227 ?auto_385228 ) ( CLEAR ?auto_385225 ) ( ON ?auto_385226 ?auto_385227 ) ( CLEAR ?auto_385226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_385217 ?auto_385218 ?auto_385219 ?auto_385220 ?auto_385221 ?auto_385222 ?auto_385223 ?auto_385224 ?auto_385225 ?auto_385226 )
      ( MAKE-14PILE ?auto_385217 ?auto_385218 ?auto_385219 ?auto_385220 ?auto_385221 ?auto_385222 ?auto_385223 ?auto_385224 ?auto_385225 ?auto_385226 ?auto_385227 ?auto_385228 ?auto_385229 ?auto_385230 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385246 - BLOCK
      ?auto_385247 - BLOCK
      ?auto_385248 - BLOCK
      ?auto_385249 - BLOCK
      ?auto_385250 - BLOCK
      ?auto_385251 - BLOCK
      ?auto_385252 - BLOCK
      ?auto_385253 - BLOCK
      ?auto_385254 - BLOCK
      ?auto_385255 - BLOCK
      ?auto_385256 - BLOCK
      ?auto_385257 - BLOCK
      ?auto_385258 - BLOCK
      ?auto_385259 - BLOCK
    )
    :vars
    (
      ?auto_385260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385259 ?auto_385260 ) ( ON-TABLE ?auto_385246 ) ( ON ?auto_385247 ?auto_385246 ) ( ON ?auto_385248 ?auto_385247 ) ( ON ?auto_385249 ?auto_385248 ) ( ON ?auto_385250 ?auto_385249 ) ( ON ?auto_385251 ?auto_385250 ) ( ON ?auto_385252 ?auto_385251 ) ( ON ?auto_385253 ?auto_385252 ) ( not ( = ?auto_385246 ?auto_385247 ) ) ( not ( = ?auto_385246 ?auto_385248 ) ) ( not ( = ?auto_385246 ?auto_385249 ) ) ( not ( = ?auto_385246 ?auto_385250 ) ) ( not ( = ?auto_385246 ?auto_385251 ) ) ( not ( = ?auto_385246 ?auto_385252 ) ) ( not ( = ?auto_385246 ?auto_385253 ) ) ( not ( = ?auto_385246 ?auto_385254 ) ) ( not ( = ?auto_385246 ?auto_385255 ) ) ( not ( = ?auto_385246 ?auto_385256 ) ) ( not ( = ?auto_385246 ?auto_385257 ) ) ( not ( = ?auto_385246 ?auto_385258 ) ) ( not ( = ?auto_385246 ?auto_385259 ) ) ( not ( = ?auto_385246 ?auto_385260 ) ) ( not ( = ?auto_385247 ?auto_385248 ) ) ( not ( = ?auto_385247 ?auto_385249 ) ) ( not ( = ?auto_385247 ?auto_385250 ) ) ( not ( = ?auto_385247 ?auto_385251 ) ) ( not ( = ?auto_385247 ?auto_385252 ) ) ( not ( = ?auto_385247 ?auto_385253 ) ) ( not ( = ?auto_385247 ?auto_385254 ) ) ( not ( = ?auto_385247 ?auto_385255 ) ) ( not ( = ?auto_385247 ?auto_385256 ) ) ( not ( = ?auto_385247 ?auto_385257 ) ) ( not ( = ?auto_385247 ?auto_385258 ) ) ( not ( = ?auto_385247 ?auto_385259 ) ) ( not ( = ?auto_385247 ?auto_385260 ) ) ( not ( = ?auto_385248 ?auto_385249 ) ) ( not ( = ?auto_385248 ?auto_385250 ) ) ( not ( = ?auto_385248 ?auto_385251 ) ) ( not ( = ?auto_385248 ?auto_385252 ) ) ( not ( = ?auto_385248 ?auto_385253 ) ) ( not ( = ?auto_385248 ?auto_385254 ) ) ( not ( = ?auto_385248 ?auto_385255 ) ) ( not ( = ?auto_385248 ?auto_385256 ) ) ( not ( = ?auto_385248 ?auto_385257 ) ) ( not ( = ?auto_385248 ?auto_385258 ) ) ( not ( = ?auto_385248 ?auto_385259 ) ) ( not ( = ?auto_385248 ?auto_385260 ) ) ( not ( = ?auto_385249 ?auto_385250 ) ) ( not ( = ?auto_385249 ?auto_385251 ) ) ( not ( = ?auto_385249 ?auto_385252 ) ) ( not ( = ?auto_385249 ?auto_385253 ) ) ( not ( = ?auto_385249 ?auto_385254 ) ) ( not ( = ?auto_385249 ?auto_385255 ) ) ( not ( = ?auto_385249 ?auto_385256 ) ) ( not ( = ?auto_385249 ?auto_385257 ) ) ( not ( = ?auto_385249 ?auto_385258 ) ) ( not ( = ?auto_385249 ?auto_385259 ) ) ( not ( = ?auto_385249 ?auto_385260 ) ) ( not ( = ?auto_385250 ?auto_385251 ) ) ( not ( = ?auto_385250 ?auto_385252 ) ) ( not ( = ?auto_385250 ?auto_385253 ) ) ( not ( = ?auto_385250 ?auto_385254 ) ) ( not ( = ?auto_385250 ?auto_385255 ) ) ( not ( = ?auto_385250 ?auto_385256 ) ) ( not ( = ?auto_385250 ?auto_385257 ) ) ( not ( = ?auto_385250 ?auto_385258 ) ) ( not ( = ?auto_385250 ?auto_385259 ) ) ( not ( = ?auto_385250 ?auto_385260 ) ) ( not ( = ?auto_385251 ?auto_385252 ) ) ( not ( = ?auto_385251 ?auto_385253 ) ) ( not ( = ?auto_385251 ?auto_385254 ) ) ( not ( = ?auto_385251 ?auto_385255 ) ) ( not ( = ?auto_385251 ?auto_385256 ) ) ( not ( = ?auto_385251 ?auto_385257 ) ) ( not ( = ?auto_385251 ?auto_385258 ) ) ( not ( = ?auto_385251 ?auto_385259 ) ) ( not ( = ?auto_385251 ?auto_385260 ) ) ( not ( = ?auto_385252 ?auto_385253 ) ) ( not ( = ?auto_385252 ?auto_385254 ) ) ( not ( = ?auto_385252 ?auto_385255 ) ) ( not ( = ?auto_385252 ?auto_385256 ) ) ( not ( = ?auto_385252 ?auto_385257 ) ) ( not ( = ?auto_385252 ?auto_385258 ) ) ( not ( = ?auto_385252 ?auto_385259 ) ) ( not ( = ?auto_385252 ?auto_385260 ) ) ( not ( = ?auto_385253 ?auto_385254 ) ) ( not ( = ?auto_385253 ?auto_385255 ) ) ( not ( = ?auto_385253 ?auto_385256 ) ) ( not ( = ?auto_385253 ?auto_385257 ) ) ( not ( = ?auto_385253 ?auto_385258 ) ) ( not ( = ?auto_385253 ?auto_385259 ) ) ( not ( = ?auto_385253 ?auto_385260 ) ) ( not ( = ?auto_385254 ?auto_385255 ) ) ( not ( = ?auto_385254 ?auto_385256 ) ) ( not ( = ?auto_385254 ?auto_385257 ) ) ( not ( = ?auto_385254 ?auto_385258 ) ) ( not ( = ?auto_385254 ?auto_385259 ) ) ( not ( = ?auto_385254 ?auto_385260 ) ) ( not ( = ?auto_385255 ?auto_385256 ) ) ( not ( = ?auto_385255 ?auto_385257 ) ) ( not ( = ?auto_385255 ?auto_385258 ) ) ( not ( = ?auto_385255 ?auto_385259 ) ) ( not ( = ?auto_385255 ?auto_385260 ) ) ( not ( = ?auto_385256 ?auto_385257 ) ) ( not ( = ?auto_385256 ?auto_385258 ) ) ( not ( = ?auto_385256 ?auto_385259 ) ) ( not ( = ?auto_385256 ?auto_385260 ) ) ( not ( = ?auto_385257 ?auto_385258 ) ) ( not ( = ?auto_385257 ?auto_385259 ) ) ( not ( = ?auto_385257 ?auto_385260 ) ) ( not ( = ?auto_385258 ?auto_385259 ) ) ( not ( = ?auto_385258 ?auto_385260 ) ) ( not ( = ?auto_385259 ?auto_385260 ) ) ( ON ?auto_385258 ?auto_385259 ) ( ON ?auto_385257 ?auto_385258 ) ( ON ?auto_385256 ?auto_385257 ) ( ON ?auto_385255 ?auto_385256 ) ( CLEAR ?auto_385253 ) ( ON ?auto_385254 ?auto_385255 ) ( CLEAR ?auto_385254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_385246 ?auto_385247 ?auto_385248 ?auto_385249 ?auto_385250 ?auto_385251 ?auto_385252 ?auto_385253 ?auto_385254 )
      ( MAKE-14PILE ?auto_385246 ?auto_385247 ?auto_385248 ?auto_385249 ?auto_385250 ?auto_385251 ?auto_385252 ?auto_385253 ?auto_385254 ?auto_385255 ?auto_385256 ?auto_385257 ?auto_385258 ?auto_385259 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385275 - BLOCK
      ?auto_385276 - BLOCK
      ?auto_385277 - BLOCK
      ?auto_385278 - BLOCK
      ?auto_385279 - BLOCK
      ?auto_385280 - BLOCK
      ?auto_385281 - BLOCK
      ?auto_385282 - BLOCK
      ?auto_385283 - BLOCK
      ?auto_385284 - BLOCK
      ?auto_385285 - BLOCK
      ?auto_385286 - BLOCK
      ?auto_385287 - BLOCK
      ?auto_385288 - BLOCK
    )
    :vars
    (
      ?auto_385289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385288 ?auto_385289 ) ( ON-TABLE ?auto_385275 ) ( ON ?auto_385276 ?auto_385275 ) ( ON ?auto_385277 ?auto_385276 ) ( ON ?auto_385278 ?auto_385277 ) ( ON ?auto_385279 ?auto_385278 ) ( ON ?auto_385280 ?auto_385279 ) ( ON ?auto_385281 ?auto_385280 ) ( ON ?auto_385282 ?auto_385281 ) ( not ( = ?auto_385275 ?auto_385276 ) ) ( not ( = ?auto_385275 ?auto_385277 ) ) ( not ( = ?auto_385275 ?auto_385278 ) ) ( not ( = ?auto_385275 ?auto_385279 ) ) ( not ( = ?auto_385275 ?auto_385280 ) ) ( not ( = ?auto_385275 ?auto_385281 ) ) ( not ( = ?auto_385275 ?auto_385282 ) ) ( not ( = ?auto_385275 ?auto_385283 ) ) ( not ( = ?auto_385275 ?auto_385284 ) ) ( not ( = ?auto_385275 ?auto_385285 ) ) ( not ( = ?auto_385275 ?auto_385286 ) ) ( not ( = ?auto_385275 ?auto_385287 ) ) ( not ( = ?auto_385275 ?auto_385288 ) ) ( not ( = ?auto_385275 ?auto_385289 ) ) ( not ( = ?auto_385276 ?auto_385277 ) ) ( not ( = ?auto_385276 ?auto_385278 ) ) ( not ( = ?auto_385276 ?auto_385279 ) ) ( not ( = ?auto_385276 ?auto_385280 ) ) ( not ( = ?auto_385276 ?auto_385281 ) ) ( not ( = ?auto_385276 ?auto_385282 ) ) ( not ( = ?auto_385276 ?auto_385283 ) ) ( not ( = ?auto_385276 ?auto_385284 ) ) ( not ( = ?auto_385276 ?auto_385285 ) ) ( not ( = ?auto_385276 ?auto_385286 ) ) ( not ( = ?auto_385276 ?auto_385287 ) ) ( not ( = ?auto_385276 ?auto_385288 ) ) ( not ( = ?auto_385276 ?auto_385289 ) ) ( not ( = ?auto_385277 ?auto_385278 ) ) ( not ( = ?auto_385277 ?auto_385279 ) ) ( not ( = ?auto_385277 ?auto_385280 ) ) ( not ( = ?auto_385277 ?auto_385281 ) ) ( not ( = ?auto_385277 ?auto_385282 ) ) ( not ( = ?auto_385277 ?auto_385283 ) ) ( not ( = ?auto_385277 ?auto_385284 ) ) ( not ( = ?auto_385277 ?auto_385285 ) ) ( not ( = ?auto_385277 ?auto_385286 ) ) ( not ( = ?auto_385277 ?auto_385287 ) ) ( not ( = ?auto_385277 ?auto_385288 ) ) ( not ( = ?auto_385277 ?auto_385289 ) ) ( not ( = ?auto_385278 ?auto_385279 ) ) ( not ( = ?auto_385278 ?auto_385280 ) ) ( not ( = ?auto_385278 ?auto_385281 ) ) ( not ( = ?auto_385278 ?auto_385282 ) ) ( not ( = ?auto_385278 ?auto_385283 ) ) ( not ( = ?auto_385278 ?auto_385284 ) ) ( not ( = ?auto_385278 ?auto_385285 ) ) ( not ( = ?auto_385278 ?auto_385286 ) ) ( not ( = ?auto_385278 ?auto_385287 ) ) ( not ( = ?auto_385278 ?auto_385288 ) ) ( not ( = ?auto_385278 ?auto_385289 ) ) ( not ( = ?auto_385279 ?auto_385280 ) ) ( not ( = ?auto_385279 ?auto_385281 ) ) ( not ( = ?auto_385279 ?auto_385282 ) ) ( not ( = ?auto_385279 ?auto_385283 ) ) ( not ( = ?auto_385279 ?auto_385284 ) ) ( not ( = ?auto_385279 ?auto_385285 ) ) ( not ( = ?auto_385279 ?auto_385286 ) ) ( not ( = ?auto_385279 ?auto_385287 ) ) ( not ( = ?auto_385279 ?auto_385288 ) ) ( not ( = ?auto_385279 ?auto_385289 ) ) ( not ( = ?auto_385280 ?auto_385281 ) ) ( not ( = ?auto_385280 ?auto_385282 ) ) ( not ( = ?auto_385280 ?auto_385283 ) ) ( not ( = ?auto_385280 ?auto_385284 ) ) ( not ( = ?auto_385280 ?auto_385285 ) ) ( not ( = ?auto_385280 ?auto_385286 ) ) ( not ( = ?auto_385280 ?auto_385287 ) ) ( not ( = ?auto_385280 ?auto_385288 ) ) ( not ( = ?auto_385280 ?auto_385289 ) ) ( not ( = ?auto_385281 ?auto_385282 ) ) ( not ( = ?auto_385281 ?auto_385283 ) ) ( not ( = ?auto_385281 ?auto_385284 ) ) ( not ( = ?auto_385281 ?auto_385285 ) ) ( not ( = ?auto_385281 ?auto_385286 ) ) ( not ( = ?auto_385281 ?auto_385287 ) ) ( not ( = ?auto_385281 ?auto_385288 ) ) ( not ( = ?auto_385281 ?auto_385289 ) ) ( not ( = ?auto_385282 ?auto_385283 ) ) ( not ( = ?auto_385282 ?auto_385284 ) ) ( not ( = ?auto_385282 ?auto_385285 ) ) ( not ( = ?auto_385282 ?auto_385286 ) ) ( not ( = ?auto_385282 ?auto_385287 ) ) ( not ( = ?auto_385282 ?auto_385288 ) ) ( not ( = ?auto_385282 ?auto_385289 ) ) ( not ( = ?auto_385283 ?auto_385284 ) ) ( not ( = ?auto_385283 ?auto_385285 ) ) ( not ( = ?auto_385283 ?auto_385286 ) ) ( not ( = ?auto_385283 ?auto_385287 ) ) ( not ( = ?auto_385283 ?auto_385288 ) ) ( not ( = ?auto_385283 ?auto_385289 ) ) ( not ( = ?auto_385284 ?auto_385285 ) ) ( not ( = ?auto_385284 ?auto_385286 ) ) ( not ( = ?auto_385284 ?auto_385287 ) ) ( not ( = ?auto_385284 ?auto_385288 ) ) ( not ( = ?auto_385284 ?auto_385289 ) ) ( not ( = ?auto_385285 ?auto_385286 ) ) ( not ( = ?auto_385285 ?auto_385287 ) ) ( not ( = ?auto_385285 ?auto_385288 ) ) ( not ( = ?auto_385285 ?auto_385289 ) ) ( not ( = ?auto_385286 ?auto_385287 ) ) ( not ( = ?auto_385286 ?auto_385288 ) ) ( not ( = ?auto_385286 ?auto_385289 ) ) ( not ( = ?auto_385287 ?auto_385288 ) ) ( not ( = ?auto_385287 ?auto_385289 ) ) ( not ( = ?auto_385288 ?auto_385289 ) ) ( ON ?auto_385287 ?auto_385288 ) ( ON ?auto_385286 ?auto_385287 ) ( ON ?auto_385285 ?auto_385286 ) ( ON ?auto_385284 ?auto_385285 ) ( CLEAR ?auto_385282 ) ( ON ?auto_385283 ?auto_385284 ) ( CLEAR ?auto_385283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_385275 ?auto_385276 ?auto_385277 ?auto_385278 ?auto_385279 ?auto_385280 ?auto_385281 ?auto_385282 ?auto_385283 )
      ( MAKE-14PILE ?auto_385275 ?auto_385276 ?auto_385277 ?auto_385278 ?auto_385279 ?auto_385280 ?auto_385281 ?auto_385282 ?auto_385283 ?auto_385284 ?auto_385285 ?auto_385286 ?auto_385287 ?auto_385288 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385304 - BLOCK
      ?auto_385305 - BLOCK
      ?auto_385306 - BLOCK
      ?auto_385307 - BLOCK
      ?auto_385308 - BLOCK
      ?auto_385309 - BLOCK
      ?auto_385310 - BLOCK
      ?auto_385311 - BLOCK
      ?auto_385312 - BLOCK
      ?auto_385313 - BLOCK
      ?auto_385314 - BLOCK
      ?auto_385315 - BLOCK
      ?auto_385316 - BLOCK
      ?auto_385317 - BLOCK
    )
    :vars
    (
      ?auto_385318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385317 ?auto_385318 ) ( ON-TABLE ?auto_385304 ) ( ON ?auto_385305 ?auto_385304 ) ( ON ?auto_385306 ?auto_385305 ) ( ON ?auto_385307 ?auto_385306 ) ( ON ?auto_385308 ?auto_385307 ) ( ON ?auto_385309 ?auto_385308 ) ( ON ?auto_385310 ?auto_385309 ) ( not ( = ?auto_385304 ?auto_385305 ) ) ( not ( = ?auto_385304 ?auto_385306 ) ) ( not ( = ?auto_385304 ?auto_385307 ) ) ( not ( = ?auto_385304 ?auto_385308 ) ) ( not ( = ?auto_385304 ?auto_385309 ) ) ( not ( = ?auto_385304 ?auto_385310 ) ) ( not ( = ?auto_385304 ?auto_385311 ) ) ( not ( = ?auto_385304 ?auto_385312 ) ) ( not ( = ?auto_385304 ?auto_385313 ) ) ( not ( = ?auto_385304 ?auto_385314 ) ) ( not ( = ?auto_385304 ?auto_385315 ) ) ( not ( = ?auto_385304 ?auto_385316 ) ) ( not ( = ?auto_385304 ?auto_385317 ) ) ( not ( = ?auto_385304 ?auto_385318 ) ) ( not ( = ?auto_385305 ?auto_385306 ) ) ( not ( = ?auto_385305 ?auto_385307 ) ) ( not ( = ?auto_385305 ?auto_385308 ) ) ( not ( = ?auto_385305 ?auto_385309 ) ) ( not ( = ?auto_385305 ?auto_385310 ) ) ( not ( = ?auto_385305 ?auto_385311 ) ) ( not ( = ?auto_385305 ?auto_385312 ) ) ( not ( = ?auto_385305 ?auto_385313 ) ) ( not ( = ?auto_385305 ?auto_385314 ) ) ( not ( = ?auto_385305 ?auto_385315 ) ) ( not ( = ?auto_385305 ?auto_385316 ) ) ( not ( = ?auto_385305 ?auto_385317 ) ) ( not ( = ?auto_385305 ?auto_385318 ) ) ( not ( = ?auto_385306 ?auto_385307 ) ) ( not ( = ?auto_385306 ?auto_385308 ) ) ( not ( = ?auto_385306 ?auto_385309 ) ) ( not ( = ?auto_385306 ?auto_385310 ) ) ( not ( = ?auto_385306 ?auto_385311 ) ) ( not ( = ?auto_385306 ?auto_385312 ) ) ( not ( = ?auto_385306 ?auto_385313 ) ) ( not ( = ?auto_385306 ?auto_385314 ) ) ( not ( = ?auto_385306 ?auto_385315 ) ) ( not ( = ?auto_385306 ?auto_385316 ) ) ( not ( = ?auto_385306 ?auto_385317 ) ) ( not ( = ?auto_385306 ?auto_385318 ) ) ( not ( = ?auto_385307 ?auto_385308 ) ) ( not ( = ?auto_385307 ?auto_385309 ) ) ( not ( = ?auto_385307 ?auto_385310 ) ) ( not ( = ?auto_385307 ?auto_385311 ) ) ( not ( = ?auto_385307 ?auto_385312 ) ) ( not ( = ?auto_385307 ?auto_385313 ) ) ( not ( = ?auto_385307 ?auto_385314 ) ) ( not ( = ?auto_385307 ?auto_385315 ) ) ( not ( = ?auto_385307 ?auto_385316 ) ) ( not ( = ?auto_385307 ?auto_385317 ) ) ( not ( = ?auto_385307 ?auto_385318 ) ) ( not ( = ?auto_385308 ?auto_385309 ) ) ( not ( = ?auto_385308 ?auto_385310 ) ) ( not ( = ?auto_385308 ?auto_385311 ) ) ( not ( = ?auto_385308 ?auto_385312 ) ) ( not ( = ?auto_385308 ?auto_385313 ) ) ( not ( = ?auto_385308 ?auto_385314 ) ) ( not ( = ?auto_385308 ?auto_385315 ) ) ( not ( = ?auto_385308 ?auto_385316 ) ) ( not ( = ?auto_385308 ?auto_385317 ) ) ( not ( = ?auto_385308 ?auto_385318 ) ) ( not ( = ?auto_385309 ?auto_385310 ) ) ( not ( = ?auto_385309 ?auto_385311 ) ) ( not ( = ?auto_385309 ?auto_385312 ) ) ( not ( = ?auto_385309 ?auto_385313 ) ) ( not ( = ?auto_385309 ?auto_385314 ) ) ( not ( = ?auto_385309 ?auto_385315 ) ) ( not ( = ?auto_385309 ?auto_385316 ) ) ( not ( = ?auto_385309 ?auto_385317 ) ) ( not ( = ?auto_385309 ?auto_385318 ) ) ( not ( = ?auto_385310 ?auto_385311 ) ) ( not ( = ?auto_385310 ?auto_385312 ) ) ( not ( = ?auto_385310 ?auto_385313 ) ) ( not ( = ?auto_385310 ?auto_385314 ) ) ( not ( = ?auto_385310 ?auto_385315 ) ) ( not ( = ?auto_385310 ?auto_385316 ) ) ( not ( = ?auto_385310 ?auto_385317 ) ) ( not ( = ?auto_385310 ?auto_385318 ) ) ( not ( = ?auto_385311 ?auto_385312 ) ) ( not ( = ?auto_385311 ?auto_385313 ) ) ( not ( = ?auto_385311 ?auto_385314 ) ) ( not ( = ?auto_385311 ?auto_385315 ) ) ( not ( = ?auto_385311 ?auto_385316 ) ) ( not ( = ?auto_385311 ?auto_385317 ) ) ( not ( = ?auto_385311 ?auto_385318 ) ) ( not ( = ?auto_385312 ?auto_385313 ) ) ( not ( = ?auto_385312 ?auto_385314 ) ) ( not ( = ?auto_385312 ?auto_385315 ) ) ( not ( = ?auto_385312 ?auto_385316 ) ) ( not ( = ?auto_385312 ?auto_385317 ) ) ( not ( = ?auto_385312 ?auto_385318 ) ) ( not ( = ?auto_385313 ?auto_385314 ) ) ( not ( = ?auto_385313 ?auto_385315 ) ) ( not ( = ?auto_385313 ?auto_385316 ) ) ( not ( = ?auto_385313 ?auto_385317 ) ) ( not ( = ?auto_385313 ?auto_385318 ) ) ( not ( = ?auto_385314 ?auto_385315 ) ) ( not ( = ?auto_385314 ?auto_385316 ) ) ( not ( = ?auto_385314 ?auto_385317 ) ) ( not ( = ?auto_385314 ?auto_385318 ) ) ( not ( = ?auto_385315 ?auto_385316 ) ) ( not ( = ?auto_385315 ?auto_385317 ) ) ( not ( = ?auto_385315 ?auto_385318 ) ) ( not ( = ?auto_385316 ?auto_385317 ) ) ( not ( = ?auto_385316 ?auto_385318 ) ) ( not ( = ?auto_385317 ?auto_385318 ) ) ( ON ?auto_385316 ?auto_385317 ) ( ON ?auto_385315 ?auto_385316 ) ( ON ?auto_385314 ?auto_385315 ) ( ON ?auto_385313 ?auto_385314 ) ( ON ?auto_385312 ?auto_385313 ) ( CLEAR ?auto_385310 ) ( ON ?auto_385311 ?auto_385312 ) ( CLEAR ?auto_385311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_385304 ?auto_385305 ?auto_385306 ?auto_385307 ?auto_385308 ?auto_385309 ?auto_385310 ?auto_385311 )
      ( MAKE-14PILE ?auto_385304 ?auto_385305 ?auto_385306 ?auto_385307 ?auto_385308 ?auto_385309 ?auto_385310 ?auto_385311 ?auto_385312 ?auto_385313 ?auto_385314 ?auto_385315 ?auto_385316 ?auto_385317 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385333 - BLOCK
      ?auto_385334 - BLOCK
      ?auto_385335 - BLOCK
      ?auto_385336 - BLOCK
      ?auto_385337 - BLOCK
      ?auto_385338 - BLOCK
      ?auto_385339 - BLOCK
      ?auto_385340 - BLOCK
      ?auto_385341 - BLOCK
      ?auto_385342 - BLOCK
      ?auto_385343 - BLOCK
      ?auto_385344 - BLOCK
      ?auto_385345 - BLOCK
      ?auto_385346 - BLOCK
    )
    :vars
    (
      ?auto_385347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385346 ?auto_385347 ) ( ON-TABLE ?auto_385333 ) ( ON ?auto_385334 ?auto_385333 ) ( ON ?auto_385335 ?auto_385334 ) ( ON ?auto_385336 ?auto_385335 ) ( ON ?auto_385337 ?auto_385336 ) ( ON ?auto_385338 ?auto_385337 ) ( ON ?auto_385339 ?auto_385338 ) ( not ( = ?auto_385333 ?auto_385334 ) ) ( not ( = ?auto_385333 ?auto_385335 ) ) ( not ( = ?auto_385333 ?auto_385336 ) ) ( not ( = ?auto_385333 ?auto_385337 ) ) ( not ( = ?auto_385333 ?auto_385338 ) ) ( not ( = ?auto_385333 ?auto_385339 ) ) ( not ( = ?auto_385333 ?auto_385340 ) ) ( not ( = ?auto_385333 ?auto_385341 ) ) ( not ( = ?auto_385333 ?auto_385342 ) ) ( not ( = ?auto_385333 ?auto_385343 ) ) ( not ( = ?auto_385333 ?auto_385344 ) ) ( not ( = ?auto_385333 ?auto_385345 ) ) ( not ( = ?auto_385333 ?auto_385346 ) ) ( not ( = ?auto_385333 ?auto_385347 ) ) ( not ( = ?auto_385334 ?auto_385335 ) ) ( not ( = ?auto_385334 ?auto_385336 ) ) ( not ( = ?auto_385334 ?auto_385337 ) ) ( not ( = ?auto_385334 ?auto_385338 ) ) ( not ( = ?auto_385334 ?auto_385339 ) ) ( not ( = ?auto_385334 ?auto_385340 ) ) ( not ( = ?auto_385334 ?auto_385341 ) ) ( not ( = ?auto_385334 ?auto_385342 ) ) ( not ( = ?auto_385334 ?auto_385343 ) ) ( not ( = ?auto_385334 ?auto_385344 ) ) ( not ( = ?auto_385334 ?auto_385345 ) ) ( not ( = ?auto_385334 ?auto_385346 ) ) ( not ( = ?auto_385334 ?auto_385347 ) ) ( not ( = ?auto_385335 ?auto_385336 ) ) ( not ( = ?auto_385335 ?auto_385337 ) ) ( not ( = ?auto_385335 ?auto_385338 ) ) ( not ( = ?auto_385335 ?auto_385339 ) ) ( not ( = ?auto_385335 ?auto_385340 ) ) ( not ( = ?auto_385335 ?auto_385341 ) ) ( not ( = ?auto_385335 ?auto_385342 ) ) ( not ( = ?auto_385335 ?auto_385343 ) ) ( not ( = ?auto_385335 ?auto_385344 ) ) ( not ( = ?auto_385335 ?auto_385345 ) ) ( not ( = ?auto_385335 ?auto_385346 ) ) ( not ( = ?auto_385335 ?auto_385347 ) ) ( not ( = ?auto_385336 ?auto_385337 ) ) ( not ( = ?auto_385336 ?auto_385338 ) ) ( not ( = ?auto_385336 ?auto_385339 ) ) ( not ( = ?auto_385336 ?auto_385340 ) ) ( not ( = ?auto_385336 ?auto_385341 ) ) ( not ( = ?auto_385336 ?auto_385342 ) ) ( not ( = ?auto_385336 ?auto_385343 ) ) ( not ( = ?auto_385336 ?auto_385344 ) ) ( not ( = ?auto_385336 ?auto_385345 ) ) ( not ( = ?auto_385336 ?auto_385346 ) ) ( not ( = ?auto_385336 ?auto_385347 ) ) ( not ( = ?auto_385337 ?auto_385338 ) ) ( not ( = ?auto_385337 ?auto_385339 ) ) ( not ( = ?auto_385337 ?auto_385340 ) ) ( not ( = ?auto_385337 ?auto_385341 ) ) ( not ( = ?auto_385337 ?auto_385342 ) ) ( not ( = ?auto_385337 ?auto_385343 ) ) ( not ( = ?auto_385337 ?auto_385344 ) ) ( not ( = ?auto_385337 ?auto_385345 ) ) ( not ( = ?auto_385337 ?auto_385346 ) ) ( not ( = ?auto_385337 ?auto_385347 ) ) ( not ( = ?auto_385338 ?auto_385339 ) ) ( not ( = ?auto_385338 ?auto_385340 ) ) ( not ( = ?auto_385338 ?auto_385341 ) ) ( not ( = ?auto_385338 ?auto_385342 ) ) ( not ( = ?auto_385338 ?auto_385343 ) ) ( not ( = ?auto_385338 ?auto_385344 ) ) ( not ( = ?auto_385338 ?auto_385345 ) ) ( not ( = ?auto_385338 ?auto_385346 ) ) ( not ( = ?auto_385338 ?auto_385347 ) ) ( not ( = ?auto_385339 ?auto_385340 ) ) ( not ( = ?auto_385339 ?auto_385341 ) ) ( not ( = ?auto_385339 ?auto_385342 ) ) ( not ( = ?auto_385339 ?auto_385343 ) ) ( not ( = ?auto_385339 ?auto_385344 ) ) ( not ( = ?auto_385339 ?auto_385345 ) ) ( not ( = ?auto_385339 ?auto_385346 ) ) ( not ( = ?auto_385339 ?auto_385347 ) ) ( not ( = ?auto_385340 ?auto_385341 ) ) ( not ( = ?auto_385340 ?auto_385342 ) ) ( not ( = ?auto_385340 ?auto_385343 ) ) ( not ( = ?auto_385340 ?auto_385344 ) ) ( not ( = ?auto_385340 ?auto_385345 ) ) ( not ( = ?auto_385340 ?auto_385346 ) ) ( not ( = ?auto_385340 ?auto_385347 ) ) ( not ( = ?auto_385341 ?auto_385342 ) ) ( not ( = ?auto_385341 ?auto_385343 ) ) ( not ( = ?auto_385341 ?auto_385344 ) ) ( not ( = ?auto_385341 ?auto_385345 ) ) ( not ( = ?auto_385341 ?auto_385346 ) ) ( not ( = ?auto_385341 ?auto_385347 ) ) ( not ( = ?auto_385342 ?auto_385343 ) ) ( not ( = ?auto_385342 ?auto_385344 ) ) ( not ( = ?auto_385342 ?auto_385345 ) ) ( not ( = ?auto_385342 ?auto_385346 ) ) ( not ( = ?auto_385342 ?auto_385347 ) ) ( not ( = ?auto_385343 ?auto_385344 ) ) ( not ( = ?auto_385343 ?auto_385345 ) ) ( not ( = ?auto_385343 ?auto_385346 ) ) ( not ( = ?auto_385343 ?auto_385347 ) ) ( not ( = ?auto_385344 ?auto_385345 ) ) ( not ( = ?auto_385344 ?auto_385346 ) ) ( not ( = ?auto_385344 ?auto_385347 ) ) ( not ( = ?auto_385345 ?auto_385346 ) ) ( not ( = ?auto_385345 ?auto_385347 ) ) ( not ( = ?auto_385346 ?auto_385347 ) ) ( ON ?auto_385345 ?auto_385346 ) ( ON ?auto_385344 ?auto_385345 ) ( ON ?auto_385343 ?auto_385344 ) ( ON ?auto_385342 ?auto_385343 ) ( ON ?auto_385341 ?auto_385342 ) ( CLEAR ?auto_385339 ) ( ON ?auto_385340 ?auto_385341 ) ( CLEAR ?auto_385340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_385333 ?auto_385334 ?auto_385335 ?auto_385336 ?auto_385337 ?auto_385338 ?auto_385339 ?auto_385340 )
      ( MAKE-14PILE ?auto_385333 ?auto_385334 ?auto_385335 ?auto_385336 ?auto_385337 ?auto_385338 ?auto_385339 ?auto_385340 ?auto_385341 ?auto_385342 ?auto_385343 ?auto_385344 ?auto_385345 ?auto_385346 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385362 - BLOCK
      ?auto_385363 - BLOCK
      ?auto_385364 - BLOCK
      ?auto_385365 - BLOCK
      ?auto_385366 - BLOCK
      ?auto_385367 - BLOCK
      ?auto_385368 - BLOCK
      ?auto_385369 - BLOCK
      ?auto_385370 - BLOCK
      ?auto_385371 - BLOCK
      ?auto_385372 - BLOCK
      ?auto_385373 - BLOCK
      ?auto_385374 - BLOCK
      ?auto_385375 - BLOCK
    )
    :vars
    (
      ?auto_385376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385375 ?auto_385376 ) ( ON-TABLE ?auto_385362 ) ( ON ?auto_385363 ?auto_385362 ) ( ON ?auto_385364 ?auto_385363 ) ( ON ?auto_385365 ?auto_385364 ) ( ON ?auto_385366 ?auto_385365 ) ( ON ?auto_385367 ?auto_385366 ) ( not ( = ?auto_385362 ?auto_385363 ) ) ( not ( = ?auto_385362 ?auto_385364 ) ) ( not ( = ?auto_385362 ?auto_385365 ) ) ( not ( = ?auto_385362 ?auto_385366 ) ) ( not ( = ?auto_385362 ?auto_385367 ) ) ( not ( = ?auto_385362 ?auto_385368 ) ) ( not ( = ?auto_385362 ?auto_385369 ) ) ( not ( = ?auto_385362 ?auto_385370 ) ) ( not ( = ?auto_385362 ?auto_385371 ) ) ( not ( = ?auto_385362 ?auto_385372 ) ) ( not ( = ?auto_385362 ?auto_385373 ) ) ( not ( = ?auto_385362 ?auto_385374 ) ) ( not ( = ?auto_385362 ?auto_385375 ) ) ( not ( = ?auto_385362 ?auto_385376 ) ) ( not ( = ?auto_385363 ?auto_385364 ) ) ( not ( = ?auto_385363 ?auto_385365 ) ) ( not ( = ?auto_385363 ?auto_385366 ) ) ( not ( = ?auto_385363 ?auto_385367 ) ) ( not ( = ?auto_385363 ?auto_385368 ) ) ( not ( = ?auto_385363 ?auto_385369 ) ) ( not ( = ?auto_385363 ?auto_385370 ) ) ( not ( = ?auto_385363 ?auto_385371 ) ) ( not ( = ?auto_385363 ?auto_385372 ) ) ( not ( = ?auto_385363 ?auto_385373 ) ) ( not ( = ?auto_385363 ?auto_385374 ) ) ( not ( = ?auto_385363 ?auto_385375 ) ) ( not ( = ?auto_385363 ?auto_385376 ) ) ( not ( = ?auto_385364 ?auto_385365 ) ) ( not ( = ?auto_385364 ?auto_385366 ) ) ( not ( = ?auto_385364 ?auto_385367 ) ) ( not ( = ?auto_385364 ?auto_385368 ) ) ( not ( = ?auto_385364 ?auto_385369 ) ) ( not ( = ?auto_385364 ?auto_385370 ) ) ( not ( = ?auto_385364 ?auto_385371 ) ) ( not ( = ?auto_385364 ?auto_385372 ) ) ( not ( = ?auto_385364 ?auto_385373 ) ) ( not ( = ?auto_385364 ?auto_385374 ) ) ( not ( = ?auto_385364 ?auto_385375 ) ) ( not ( = ?auto_385364 ?auto_385376 ) ) ( not ( = ?auto_385365 ?auto_385366 ) ) ( not ( = ?auto_385365 ?auto_385367 ) ) ( not ( = ?auto_385365 ?auto_385368 ) ) ( not ( = ?auto_385365 ?auto_385369 ) ) ( not ( = ?auto_385365 ?auto_385370 ) ) ( not ( = ?auto_385365 ?auto_385371 ) ) ( not ( = ?auto_385365 ?auto_385372 ) ) ( not ( = ?auto_385365 ?auto_385373 ) ) ( not ( = ?auto_385365 ?auto_385374 ) ) ( not ( = ?auto_385365 ?auto_385375 ) ) ( not ( = ?auto_385365 ?auto_385376 ) ) ( not ( = ?auto_385366 ?auto_385367 ) ) ( not ( = ?auto_385366 ?auto_385368 ) ) ( not ( = ?auto_385366 ?auto_385369 ) ) ( not ( = ?auto_385366 ?auto_385370 ) ) ( not ( = ?auto_385366 ?auto_385371 ) ) ( not ( = ?auto_385366 ?auto_385372 ) ) ( not ( = ?auto_385366 ?auto_385373 ) ) ( not ( = ?auto_385366 ?auto_385374 ) ) ( not ( = ?auto_385366 ?auto_385375 ) ) ( not ( = ?auto_385366 ?auto_385376 ) ) ( not ( = ?auto_385367 ?auto_385368 ) ) ( not ( = ?auto_385367 ?auto_385369 ) ) ( not ( = ?auto_385367 ?auto_385370 ) ) ( not ( = ?auto_385367 ?auto_385371 ) ) ( not ( = ?auto_385367 ?auto_385372 ) ) ( not ( = ?auto_385367 ?auto_385373 ) ) ( not ( = ?auto_385367 ?auto_385374 ) ) ( not ( = ?auto_385367 ?auto_385375 ) ) ( not ( = ?auto_385367 ?auto_385376 ) ) ( not ( = ?auto_385368 ?auto_385369 ) ) ( not ( = ?auto_385368 ?auto_385370 ) ) ( not ( = ?auto_385368 ?auto_385371 ) ) ( not ( = ?auto_385368 ?auto_385372 ) ) ( not ( = ?auto_385368 ?auto_385373 ) ) ( not ( = ?auto_385368 ?auto_385374 ) ) ( not ( = ?auto_385368 ?auto_385375 ) ) ( not ( = ?auto_385368 ?auto_385376 ) ) ( not ( = ?auto_385369 ?auto_385370 ) ) ( not ( = ?auto_385369 ?auto_385371 ) ) ( not ( = ?auto_385369 ?auto_385372 ) ) ( not ( = ?auto_385369 ?auto_385373 ) ) ( not ( = ?auto_385369 ?auto_385374 ) ) ( not ( = ?auto_385369 ?auto_385375 ) ) ( not ( = ?auto_385369 ?auto_385376 ) ) ( not ( = ?auto_385370 ?auto_385371 ) ) ( not ( = ?auto_385370 ?auto_385372 ) ) ( not ( = ?auto_385370 ?auto_385373 ) ) ( not ( = ?auto_385370 ?auto_385374 ) ) ( not ( = ?auto_385370 ?auto_385375 ) ) ( not ( = ?auto_385370 ?auto_385376 ) ) ( not ( = ?auto_385371 ?auto_385372 ) ) ( not ( = ?auto_385371 ?auto_385373 ) ) ( not ( = ?auto_385371 ?auto_385374 ) ) ( not ( = ?auto_385371 ?auto_385375 ) ) ( not ( = ?auto_385371 ?auto_385376 ) ) ( not ( = ?auto_385372 ?auto_385373 ) ) ( not ( = ?auto_385372 ?auto_385374 ) ) ( not ( = ?auto_385372 ?auto_385375 ) ) ( not ( = ?auto_385372 ?auto_385376 ) ) ( not ( = ?auto_385373 ?auto_385374 ) ) ( not ( = ?auto_385373 ?auto_385375 ) ) ( not ( = ?auto_385373 ?auto_385376 ) ) ( not ( = ?auto_385374 ?auto_385375 ) ) ( not ( = ?auto_385374 ?auto_385376 ) ) ( not ( = ?auto_385375 ?auto_385376 ) ) ( ON ?auto_385374 ?auto_385375 ) ( ON ?auto_385373 ?auto_385374 ) ( ON ?auto_385372 ?auto_385373 ) ( ON ?auto_385371 ?auto_385372 ) ( ON ?auto_385370 ?auto_385371 ) ( ON ?auto_385369 ?auto_385370 ) ( CLEAR ?auto_385367 ) ( ON ?auto_385368 ?auto_385369 ) ( CLEAR ?auto_385368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_385362 ?auto_385363 ?auto_385364 ?auto_385365 ?auto_385366 ?auto_385367 ?auto_385368 )
      ( MAKE-14PILE ?auto_385362 ?auto_385363 ?auto_385364 ?auto_385365 ?auto_385366 ?auto_385367 ?auto_385368 ?auto_385369 ?auto_385370 ?auto_385371 ?auto_385372 ?auto_385373 ?auto_385374 ?auto_385375 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385391 - BLOCK
      ?auto_385392 - BLOCK
      ?auto_385393 - BLOCK
      ?auto_385394 - BLOCK
      ?auto_385395 - BLOCK
      ?auto_385396 - BLOCK
      ?auto_385397 - BLOCK
      ?auto_385398 - BLOCK
      ?auto_385399 - BLOCK
      ?auto_385400 - BLOCK
      ?auto_385401 - BLOCK
      ?auto_385402 - BLOCK
      ?auto_385403 - BLOCK
      ?auto_385404 - BLOCK
    )
    :vars
    (
      ?auto_385405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385404 ?auto_385405 ) ( ON-TABLE ?auto_385391 ) ( ON ?auto_385392 ?auto_385391 ) ( ON ?auto_385393 ?auto_385392 ) ( ON ?auto_385394 ?auto_385393 ) ( ON ?auto_385395 ?auto_385394 ) ( ON ?auto_385396 ?auto_385395 ) ( not ( = ?auto_385391 ?auto_385392 ) ) ( not ( = ?auto_385391 ?auto_385393 ) ) ( not ( = ?auto_385391 ?auto_385394 ) ) ( not ( = ?auto_385391 ?auto_385395 ) ) ( not ( = ?auto_385391 ?auto_385396 ) ) ( not ( = ?auto_385391 ?auto_385397 ) ) ( not ( = ?auto_385391 ?auto_385398 ) ) ( not ( = ?auto_385391 ?auto_385399 ) ) ( not ( = ?auto_385391 ?auto_385400 ) ) ( not ( = ?auto_385391 ?auto_385401 ) ) ( not ( = ?auto_385391 ?auto_385402 ) ) ( not ( = ?auto_385391 ?auto_385403 ) ) ( not ( = ?auto_385391 ?auto_385404 ) ) ( not ( = ?auto_385391 ?auto_385405 ) ) ( not ( = ?auto_385392 ?auto_385393 ) ) ( not ( = ?auto_385392 ?auto_385394 ) ) ( not ( = ?auto_385392 ?auto_385395 ) ) ( not ( = ?auto_385392 ?auto_385396 ) ) ( not ( = ?auto_385392 ?auto_385397 ) ) ( not ( = ?auto_385392 ?auto_385398 ) ) ( not ( = ?auto_385392 ?auto_385399 ) ) ( not ( = ?auto_385392 ?auto_385400 ) ) ( not ( = ?auto_385392 ?auto_385401 ) ) ( not ( = ?auto_385392 ?auto_385402 ) ) ( not ( = ?auto_385392 ?auto_385403 ) ) ( not ( = ?auto_385392 ?auto_385404 ) ) ( not ( = ?auto_385392 ?auto_385405 ) ) ( not ( = ?auto_385393 ?auto_385394 ) ) ( not ( = ?auto_385393 ?auto_385395 ) ) ( not ( = ?auto_385393 ?auto_385396 ) ) ( not ( = ?auto_385393 ?auto_385397 ) ) ( not ( = ?auto_385393 ?auto_385398 ) ) ( not ( = ?auto_385393 ?auto_385399 ) ) ( not ( = ?auto_385393 ?auto_385400 ) ) ( not ( = ?auto_385393 ?auto_385401 ) ) ( not ( = ?auto_385393 ?auto_385402 ) ) ( not ( = ?auto_385393 ?auto_385403 ) ) ( not ( = ?auto_385393 ?auto_385404 ) ) ( not ( = ?auto_385393 ?auto_385405 ) ) ( not ( = ?auto_385394 ?auto_385395 ) ) ( not ( = ?auto_385394 ?auto_385396 ) ) ( not ( = ?auto_385394 ?auto_385397 ) ) ( not ( = ?auto_385394 ?auto_385398 ) ) ( not ( = ?auto_385394 ?auto_385399 ) ) ( not ( = ?auto_385394 ?auto_385400 ) ) ( not ( = ?auto_385394 ?auto_385401 ) ) ( not ( = ?auto_385394 ?auto_385402 ) ) ( not ( = ?auto_385394 ?auto_385403 ) ) ( not ( = ?auto_385394 ?auto_385404 ) ) ( not ( = ?auto_385394 ?auto_385405 ) ) ( not ( = ?auto_385395 ?auto_385396 ) ) ( not ( = ?auto_385395 ?auto_385397 ) ) ( not ( = ?auto_385395 ?auto_385398 ) ) ( not ( = ?auto_385395 ?auto_385399 ) ) ( not ( = ?auto_385395 ?auto_385400 ) ) ( not ( = ?auto_385395 ?auto_385401 ) ) ( not ( = ?auto_385395 ?auto_385402 ) ) ( not ( = ?auto_385395 ?auto_385403 ) ) ( not ( = ?auto_385395 ?auto_385404 ) ) ( not ( = ?auto_385395 ?auto_385405 ) ) ( not ( = ?auto_385396 ?auto_385397 ) ) ( not ( = ?auto_385396 ?auto_385398 ) ) ( not ( = ?auto_385396 ?auto_385399 ) ) ( not ( = ?auto_385396 ?auto_385400 ) ) ( not ( = ?auto_385396 ?auto_385401 ) ) ( not ( = ?auto_385396 ?auto_385402 ) ) ( not ( = ?auto_385396 ?auto_385403 ) ) ( not ( = ?auto_385396 ?auto_385404 ) ) ( not ( = ?auto_385396 ?auto_385405 ) ) ( not ( = ?auto_385397 ?auto_385398 ) ) ( not ( = ?auto_385397 ?auto_385399 ) ) ( not ( = ?auto_385397 ?auto_385400 ) ) ( not ( = ?auto_385397 ?auto_385401 ) ) ( not ( = ?auto_385397 ?auto_385402 ) ) ( not ( = ?auto_385397 ?auto_385403 ) ) ( not ( = ?auto_385397 ?auto_385404 ) ) ( not ( = ?auto_385397 ?auto_385405 ) ) ( not ( = ?auto_385398 ?auto_385399 ) ) ( not ( = ?auto_385398 ?auto_385400 ) ) ( not ( = ?auto_385398 ?auto_385401 ) ) ( not ( = ?auto_385398 ?auto_385402 ) ) ( not ( = ?auto_385398 ?auto_385403 ) ) ( not ( = ?auto_385398 ?auto_385404 ) ) ( not ( = ?auto_385398 ?auto_385405 ) ) ( not ( = ?auto_385399 ?auto_385400 ) ) ( not ( = ?auto_385399 ?auto_385401 ) ) ( not ( = ?auto_385399 ?auto_385402 ) ) ( not ( = ?auto_385399 ?auto_385403 ) ) ( not ( = ?auto_385399 ?auto_385404 ) ) ( not ( = ?auto_385399 ?auto_385405 ) ) ( not ( = ?auto_385400 ?auto_385401 ) ) ( not ( = ?auto_385400 ?auto_385402 ) ) ( not ( = ?auto_385400 ?auto_385403 ) ) ( not ( = ?auto_385400 ?auto_385404 ) ) ( not ( = ?auto_385400 ?auto_385405 ) ) ( not ( = ?auto_385401 ?auto_385402 ) ) ( not ( = ?auto_385401 ?auto_385403 ) ) ( not ( = ?auto_385401 ?auto_385404 ) ) ( not ( = ?auto_385401 ?auto_385405 ) ) ( not ( = ?auto_385402 ?auto_385403 ) ) ( not ( = ?auto_385402 ?auto_385404 ) ) ( not ( = ?auto_385402 ?auto_385405 ) ) ( not ( = ?auto_385403 ?auto_385404 ) ) ( not ( = ?auto_385403 ?auto_385405 ) ) ( not ( = ?auto_385404 ?auto_385405 ) ) ( ON ?auto_385403 ?auto_385404 ) ( ON ?auto_385402 ?auto_385403 ) ( ON ?auto_385401 ?auto_385402 ) ( ON ?auto_385400 ?auto_385401 ) ( ON ?auto_385399 ?auto_385400 ) ( ON ?auto_385398 ?auto_385399 ) ( CLEAR ?auto_385396 ) ( ON ?auto_385397 ?auto_385398 ) ( CLEAR ?auto_385397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_385391 ?auto_385392 ?auto_385393 ?auto_385394 ?auto_385395 ?auto_385396 ?auto_385397 )
      ( MAKE-14PILE ?auto_385391 ?auto_385392 ?auto_385393 ?auto_385394 ?auto_385395 ?auto_385396 ?auto_385397 ?auto_385398 ?auto_385399 ?auto_385400 ?auto_385401 ?auto_385402 ?auto_385403 ?auto_385404 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385420 - BLOCK
      ?auto_385421 - BLOCK
      ?auto_385422 - BLOCK
      ?auto_385423 - BLOCK
      ?auto_385424 - BLOCK
      ?auto_385425 - BLOCK
      ?auto_385426 - BLOCK
      ?auto_385427 - BLOCK
      ?auto_385428 - BLOCK
      ?auto_385429 - BLOCK
      ?auto_385430 - BLOCK
      ?auto_385431 - BLOCK
      ?auto_385432 - BLOCK
      ?auto_385433 - BLOCK
    )
    :vars
    (
      ?auto_385434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385433 ?auto_385434 ) ( ON-TABLE ?auto_385420 ) ( ON ?auto_385421 ?auto_385420 ) ( ON ?auto_385422 ?auto_385421 ) ( ON ?auto_385423 ?auto_385422 ) ( ON ?auto_385424 ?auto_385423 ) ( not ( = ?auto_385420 ?auto_385421 ) ) ( not ( = ?auto_385420 ?auto_385422 ) ) ( not ( = ?auto_385420 ?auto_385423 ) ) ( not ( = ?auto_385420 ?auto_385424 ) ) ( not ( = ?auto_385420 ?auto_385425 ) ) ( not ( = ?auto_385420 ?auto_385426 ) ) ( not ( = ?auto_385420 ?auto_385427 ) ) ( not ( = ?auto_385420 ?auto_385428 ) ) ( not ( = ?auto_385420 ?auto_385429 ) ) ( not ( = ?auto_385420 ?auto_385430 ) ) ( not ( = ?auto_385420 ?auto_385431 ) ) ( not ( = ?auto_385420 ?auto_385432 ) ) ( not ( = ?auto_385420 ?auto_385433 ) ) ( not ( = ?auto_385420 ?auto_385434 ) ) ( not ( = ?auto_385421 ?auto_385422 ) ) ( not ( = ?auto_385421 ?auto_385423 ) ) ( not ( = ?auto_385421 ?auto_385424 ) ) ( not ( = ?auto_385421 ?auto_385425 ) ) ( not ( = ?auto_385421 ?auto_385426 ) ) ( not ( = ?auto_385421 ?auto_385427 ) ) ( not ( = ?auto_385421 ?auto_385428 ) ) ( not ( = ?auto_385421 ?auto_385429 ) ) ( not ( = ?auto_385421 ?auto_385430 ) ) ( not ( = ?auto_385421 ?auto_385431 ) ) ( not ( = ?auto_385421 ?auto_385432 ) ) ( not ( = ?auto_385421 ?auto_385433 ) ) ( not ( = ?auto_385421 ?auto_385434 ) ) ( not ( = ?auto_385422 ?auto_385423 ) ) ( not ( = ?auto_385422 ?auto_385424 ) ) ( not ( = ?auto_385422 ?auto_385425 ) ) ( not ( = ?auto_385422 ?auto_385426 ) ) ( not ( = ?auto_385422 ?auto_385427 ) ) ( not ( = ?auto_385422 ?auto_385428 ) ) ( not ( = ?auto_385422 ?auto_385429 ) ) ( not ( = ?auto_385422 ?auto_385430 ) ) ( not ( = ?auto_385422 ?auto_385431 ) ) ( not ( = ?auto_385422 ?auto_385432 ) ) ( not ( = ?auto_385422 ?auto_385433 ) ) ( not ( = ?auto_385422 ?auto_385434 ) ) ( not ( = ?auto_385423 ?auto_385424 ) ) ( not ( = ?auto_385423 ?auto_385425 ) ) ( not ( = ?auto_385423 ?auto_385426 ) ) ( not ( = ?auto_385423 ?auto_385427 ) ) ( not ( = ?auto_385423 ?auto_385428 ) ) ( not ( = ?auto_385423 ?auto_385429 ) ) ( not ( = ?auto_385423 ?auto_385430 ) ) ( not ( = ?auto_385423 ?auto_385431 ) ) ( not ( = ?auto_385423 ?auto_385432 ) ) ( not ( = ?auto_385423 ?auto_385433 ) ) ( not ( = ?auto_385423 ?auto_385434 ) ) ( not ( = ?auto_385424 ?auto_385425 ) ) ( not ( = ?auto_385424 ?auto_385426 ) ) ( not ( = ?auto_385424 ?auto_385427 ) ) ( not ( = ?auto_385424 ?auto_385428 ) ) ( not ( = ?auto_385424 ?auto_385429 ) ) ( not ( = ?auto_385424 ?auto_385430 ) ) ( not ( = ?auto_385424 ?auto_385431 ) ) ( not ( = ?auto_385424 ?auto_385432 ) ) ( not ( = ?auto_385424 ?auto_385433 ) ) ( not ( = ?auto_385424 ?auto_385434 ) ) ( not ( = ?auto_385425 ?auto_385426 ) ) ( not ( = ?auto_385425 ?auto_385427 ) ) ( not ( = ?auto_385425 ?auto_385428 ) ) ( not ( = ?auto_385425 ?auto_385429 ) ) ( not ( = ?auto_385425 ?auto_385430 ) ) ( not ( = ?auto_385425 ?auto_385431 ) ) ( not ( = ?auto_385425 ?auto_385432 ) ) ( not ( = ?auto_385425 ?auto_385433 ) ) ( not ( = ?auto_385425 ?auto_385434 ) ) ( not ( = ?auto_385426 ?auto_385427 ) ) ( not ( = ?auto_385426 ?auto_385428 ) ) ( not ( = ?auto_385426 ?auto_385429 ) ) ( not ( = ?auto_385426 ?auto_385430 ) ) ( not ( = ?auto_385426 ?auto_385431 ) ) ( not ( = ?auto_385426 ?auto_385432 ) ) ( not ( = ?auto_385426 ?auto_385433 ) ) ( not ( = ?auto_385426 ?auto_385434 ) ) ( not ( = ?auto_385427 ?auto_385428 ) ) ( not ( = ?auto_385427 ?auto_385429 ) ) ( not ( = ?auto_385427 ?auto_385430 ) ) ( not ( = ?auto_385427 ?auto_385431 ) ) ( not ( = ?auto_385427 ?auto_385432 ) ) ( not ( = ?auto_385427 ?auto_385433 ) ) ( not ( = ?auto_385427 ?auto_385434 ) ) ( not ( = ?auto_385428 ?auto_385429 ) ) ( not ( = ?auto_385428 ?auto_385430 ) ) ( not ( = ?auto_385428 ?auto_385431 ) ) ( not ( = ?auto_385428 ?auto_385432 ) ) ( not ( = ?auto_385428 ?auto_385433 ) ) ( not ( = ?auto_385428 ?auto_385434 ) ) ( not ( = ?auto_385429 ?auto_385430 ) ) ( not ( = ?auto_385429 ?auto_385431 ) ) ( not ( = ?auto_385429 ?auto_385432 ) ) ( not ( = ?auto_385429 ?auto_385433 ) ) ( not ( = ?auto_385429 ?auto_385434 ) ) ( not ( = ?auto_385430 ?auto_385431 ) ) ( not ( = ?auto_385430 ?auto_385432 ) ) ( not ( = ?auto_385430 ?auto_385433 ) ) ( not ( = ?auto_385430 ?auto_385434 ) ) ( not ( = ?auto_385431 ?auto_385432 ) ) ( not ( = ?auto_385431 ?auto_385433 ) ) ( not ( = ?auto_385431 ?auto_385434 ) ) ( not ( = ?auto_385432 ?auto_385433 ) ) ( not ( = ?auto_385432 ?auto_385434 ) ) ( not ( = ?auto_385433 ?auto_385434 ) ) ( ON ?auto_385432 ?auto_385433 ) ( ON ?auto_385431 ?auto_385432 ) ( ON ?auto_385430 ?auto_385431 ) ( ON ?auto_385429 ?auto_385430 ) ( ON ?auto_385428 ?auto_385429 ) ( ON ?auto_385427 ?auto_385428 ) ( ON ?auto_385426 ?auto_385427 ) ( CLEAR ?auto_385424 ) ( ON ?auto_385425 ?auto_385426 ) ( CLEAR ?auto_385425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_385420 ?auto_385421 ?auto_385422 ?auto_385423 ?auto_385424 ?auto_385425 )
      ( MAKE-14PILE ?auto_385420 ?auto_385421 ?auto_385422 ?auto_385423 ?auto_385424 ?auto_385425 ?auto_385426 ?auto_385427 ?auto_385428 ?auto_385429 ?auto_385430 ?auto_385431 ?auto_385432 ?auto_385433 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385449 - BLOCK
      ?auto_385450 - BLOCK
      ?auto_385451 - BLOCK
      ?auto_385452 - BLOCK
      ?auto_385453 - BLOCK
      ?auto_385454 - BLOCK
      ?auto_385455 - BLOCK
      ?auto_385456 - BLOCK
      ?auto_385457 - BLOCK
      ?auto_385458 - BLOCK
      ?auto_385459 - BLOCK
      ?auto_385460 - BLOCK
      ?auto_385461 - BLOCK
      ?auto_385462 - BLOCK
    )
    :vars
    (
      ?auto_385463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385462 ?auto_385463 ) ( ON-TABLE ?auto_385449 ) ( ON ?auto_385450 ?auto_385449 ) ( ON ?auto_385451 ?auto_385450 ) ( ON ?auto_385452 ?auto_385451 ) ( ON ?auto_385453 ?auto_385452 ) ( not ( = ?auto_385449 ?auto_385450 ) ) ( not ( = ?auto_385449 ?auto_385451 ) ) ( not ( = ?auto_385449 ?auto_385452 ) ) ( not ( = ?auto_385449 ?auto_385453 ) ) ( not ( = ?auto_385449 ?auto_385454 ) ) ( not ( = ?auto_385449 ?auto_385455 ) ) ( not ( = ?auto_385449 ?auto_385456 ) ) ( not ( = ?auto_385449 ?auto_385457 ) ) ( not ( = ?auto_385449 ?auto_385458 ) ) ( not ( = ?auto_385449 ?auto_385459 ) ) ( not ( = ?auto_385449 ?auto_385460 ) ) ( not ( = ?auto_385449 ?auto_385461 ) ) ( not ( = ?auto_385449 ?auto_385462 ) ) ( not ( = ?auto_385449 ?auto_385463 ) ) ( not ( = ?auto_385450 ?auto_385451 ) ) ( not ( = ?auto_385450 ?auto_385452 ) ) ( not ( = ?auto_385450 ?auto_385453 ) ) ( not ( = ?auto_385450 ?auto_385454 ) ) ( not ( = ?auto_385450 ?auto_385455 ) ) ( not ( = ?auto_385450 ?auto_385456 ) ) ( not ( = ?auto_385450 ?auto_385457 ) ) ( not ( = ?auto_385450 ?auto_385458 ) ) ( not ( = ?auto_385450 ?auto_385459 ) ) ( not ( = ?auto_385450 ?auto_385460 ) ) ( not ( = ?auto_385450 ?auto_385461 ) ) ( not ( = ?auto_385450 ?auto_385462 ) ) ( not ( = ?auto_385450 ?auto_385463 ) ) ( not ( = ?auto_385451 ?auto_385452 ) ) ( not ( = ?auto_385451 ?auto_385453 ) ) ( not ( = ?auto_385451 ?auto_385454 ) ) ( not ( = ?auto_385451 ?auto_385455 ) ) ( not ( = ?auto_385451 ?auto_385456 ) ) ( not ( = ?auto_385451 ?auto_385457 ) ) ( not ( = ?auto_385451 ?auto_385458 ) ) ( not ( = ?auto_385451 ?auto_385459 ) ) ( not ( = ?auto_385451 ?auto_385460 ) ) ( not ( = ?auto_385451 ?auto_385461 ) ) ( not ( = ?auto_385451 ?auto_385462 ) ) ( not ( = ?auto_385451 ?auto_385463 ) ) ( not ( = ?auto_385452 ?auto_385453 ) ) ( not ( = ?auto_385452 ?auto_385454 ) ) ( not ( = ?auto_385452 ?auto_385455 ) ) ( not ( = ?auto_385452 ?auto_385456 ) ) ( not ( = ?auto_385452 ?auto_385457 ) ) ( not ( = ?auto_385452 ?auto_385458 ) ) ( not ( = ?auto_385452 ?auto_385459 ) ) ( not ( = ?auto_385452 ?auto_385460 ) ) ( not ( = ?auto_385452 ?auto_385461 ) ) ( not ( = ?auto_385452 ?auto_385462 ) ) ( not ( = ?auto_385452 ?auto_385463 ) ) ( not ( = ?auto_385453 ?auto_385454 ) ) ( not ( = ?auto_385453 ?auto_385455 ) ) ( not ( = ?auto_385453 ?auto_385456 ) ) ( not ( = ?auto_385453 ?auto_385457 ) ) ( not ( = ?auto_385453 ?auto_385458 ) ) ( not ( = ?auto_385453 ?auto_385459 ) ) ( not ( = ?auto_385453 ?auto_385460 ) ) ( not ( = ?auto_385453 ?auto_385461 ) ) ( not ( = ?auto_385453 ?auto_385462 ) ) ( not ( = ?auto_385453 ?auto_385463 ) ) ( not ( = ?auto_385454 ?auto_385455 ) ) ( not ( = ?auto_385454 ?auto_385456 ) ) ( not ( = ?auto_385454 ?auto_385457 ) ) ( not ( = ?auto_385454 ?auto_385458 ) ) ( not ( = ?auto_385454 ?auto_385459 ) ) ( not ( = ?auto_385454 ?auto_385460 ) ) ( not ( = ?auto_385454 ?auto_385461 ) ) ( not ( = ?auto_385454 ?auto_385462 ) ) ( not ( = ?auto_385454 ?auto_385463 ) ) ( not ( = ?auto_385455 ?auto_385456 ) ) ( not ( = ?auto_385455 ?auto_385457 ) ) ( not ( = ?auto_385455 ?auto_385458 ) ) ( not ( = ?auto_385455 ?auto_385459 ) ) ( not ( = ?auto_385455 ?auto_385460 ) ) ( not ( = ?auto_385455 ?auto_385461 ) ) ( not ( = ?auto_385455 ?auto_385462 ) ) ( not ( = ?auto_385455 ?auto_385463 ) ) ( not ( = ?auto_385456 ?auto_385457 ) ) ( not ( = ?auto_385456 ?auto_385458 ) ) ( not ( = ?auto_385456 ?auto_385459 ) ) ( not ( = ?auto_385456 ?auto_385460 ) ) ( not ( = ?auto_385456 ?auto_385461 ) ) ( not ( = ?auto_385456 ?auto_385462 ) ) ( not ( = ?auto_385456 ?auto_385463 ) ) ( not ( = ?auto_385457 ?auto_385458 ) ) ( not ( = ?auto_385457 ?auto_385459 ) ) ( not ( = ?auto_385457 ?auto_385460 ) ) ( not ( = ?auto_385457 ?auto_385461 ) ) ( not ( = ?auto_385457 ?auto_385462 ) ) ( not ( = ?auto_385457 ?auto_385463 ) ) ( not ( = ?auto_385458 ?auto_385459 ) ) ( not ( = ?auto_385458 ?auto_385460 ) ) ( not ( = ?auto_385458 ?auto_385461 ) ) ( not ( = ?auto_385458 ?auto_385462 ) ) ( not ( = ?auto_385458 ?auto_385463 ) ) ( not ( = ?auto_385459 ?auto_385460 ) ) ( not ( = ?auto_385459 ?auto_385461 ) ) ( not ( = ?auto_385459 ?auto_385462 ) ) ( not ( = ?auto_385459 ?auto_385463 ) ) ( not ( = ?auto_385460 ?auto_385461 ) ) ( not ( = ?auto_385460 ?auto_385462 ) ) ( not ( = ?auto_385460 ?auto_385463 ) ) ( not ( = ?auto_385461 ?auto_385462 ) ) ( not ( = ?auto_385461 ?auto_385463 ) ) ( not ( = ?auto_385462 ?auto_385463 ) ) ( ON ?auto_385461 ?auto_385462 ) ( ON ?auto_385460 ?auto_385461 ) ( ON ?auto_385459 ?auto_385460 ) ( ON ?auto_385458 ?auto_385459 ) ( ON ?auto_385457 ?auto_385458 ) ( ON ?auto_385456 ?auto_385457 ) ( ON ?auto_385455 ?auto_385456 ) ( CLEAR ?auto_385453 ) ( ON ?auto_385454 ?auto_385455 ) ( CLEAR ?auto_385454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_385449 ?auto_385450 ?auto_385451 ?auto_385452 ?auto_385453 ?auto_385454 )
      ( MAKE-14PILE ?auto_385449 ?auto_385450 ?auto_385451 ?auto_385452 ?auto_385453 ?auto_385454 ?auto_385455 ?auto_385456 ?auto_385457 ?auto_385458 ?auto_385459 ?auto_385460 ?auto_385461 ?auto_385462 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385478 - BLOCK
      ?auto_385479 - BLOCK
      ?auto_385480 - BLOCK
      ?auto_385481 - BLOCK
      ?auto_385482 - BLOCK
      ?auto_385483 - BLOCK
      ?auto_385484 - BLOCK
      ?auto_385485 - BLOCK
      ?auto_385486 - BLOCK
      ?auto_385487 - BLOCK
      ?auto_385488 - BLOCK
      ?auto_385489 - BLOCK
      ?auto_385490 - BLOCK
      ?auto_385491 - BLOCK
    )
    :vars
    (
      ?auto_385492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385491 ?auto_385492 ) ( ON-TABLE ?auto_385478 ) ( ON ?auto_385479 ?auto_385478 ) ( ON ?auto_385480 ?auto_385479 ) ( ON ?auto_385481 ?auto_385480 ) ( not ( = ?auto_385478 ?auto_385479 ) ) ( not ( = ?auto_385478 ?auto_385480 ) ) ( not ( = ?auto_385478 ?auto_385481 ) ) ( not ( = ?auto_385478 ?auto_385482 ) ) ( not ( = ?auto_385478 ?auto_385483 ) ) ( not ( = ?auto_385478 ?auto_385484 ) ) ( not ( = ?auto_385478 ?auto_385485 ) ) ( not ( = ?auto_385478 ?auto_385486 ) ) ( not ( = ?auto_385478 ?auto_385487 ) ) ( not ( = ?auto_385478 ?auto_385488 ) ) ( not ( = ?auto_385478 ?auto_385489 ) ) ( not ( = ?auto_385478 ?auto_385490 ) ) ( not ( = ?auto_385478 ?auto_385491 ) ) ( not ( = ?auto_385478 ?auto_385492 ) ) ( not ( = ?auto_385479 ?auto_385480 ) ) ( not ( = ?auto_385479 ?auto_385481 ) ) ( not ( = ?auto_385479 ?auto_385482 ) ) ( not ( = ?auto_385479 ?auto_385483 ) ) ( not ( = ?auto_385479 ?auto_385484 ) ) ( not ( = ?auto_385479 ?auto_385485 ) ) ( not ( = ?auto_385479 ?auto_385486 ) ) ( not ( = ?auto_385479 ?auto_385487 ) ) ( not ( = ?auto_385479 ?auto_385488 ) ) ( not ( = ?auto_385479 ?auto_385489 ) ) ( not ( = ?auto_385479 ?auto_385490 ) ) ( not ( = ?auto_385479 ?auto_385491 ) ) ( not ( = ?auto_385479 ?auto_385492 ) ) ( not ( = ?auto_385480 ?auto_385481 ) ) ( not ( = ?auto_385480 ?auto_385482 ) ) ( not ( = ?auto_385480 ?auto_385483 ) ) ( not ( = ?auto_385480 ?auto_385484 ) ) ( not ( = ?auto_385480 ?auto_385485 ) ) ( not ( = ?auto_385480 ?auto_385486 ) ) ( not ( = ?auto_385480 ?auto_385487 ) ) ( not ( = ?auto_385480 ?auto_385488 ) ) ( not ( = ?auto_385480 ?auto_385489 ) ) ( not ( = ?auto_385480 ?auto_385490 ) ) ( not ( = ?auto_385480 ?auto_385491 ) ) ( not ( = ?auto_385480 ?auto_385492 ) ) ( not ( = ?auto_385481 ?auto_385482 ) ) ( not ( = ?auto_385481 ?auto_385483 ) ) ( not ( = ?auto_385481 ?auto_385484 ) ) ( not ( = ?auto_385481 ?auto_385485 ) ) ( not ( = ?auto_385481 ?auto_385486 ) ) ( not ( = ?auto_385481 ?auto_385487 ) ) ( not ( = ?auto_385481 ?auto_385488 ) ) ( not ( = ?auto_385481 ?auto_385489 ) ) ( not ( = ?auto_385481 ?auto_385490 ) ) ( not ( = ?auto_385481 ?auto_385491 ) ) ( not ( = ?auto_385481 ?auto_385492 ) ) ( not ( = ?auto_385482 ?auto_385483 ) ) ( not ( = ?auto_385482 ?auto_385484 ) ) ( not ( = ?auto_385482 ?auto_385485 ) ) ( not ( = ?auto_385482 ?auto_385486 ) ) ( not ( = ?auto_385482 ?auto_385487 ) ) ( not ( = ?auto_385482 ?auto_385488 ) ) ( not ( = ?auto_385482 ?auto_385489 ) ) ( not ( = ?auto_385482 ?auto_385490 ) ) ( not ( = ?auto_385482 ?auto_385491 ) ) ( not ( = ?auto_385482 ?auto_385492 ) ) ( not ( = ?auto_385483 ?auto_385484 ) ) ( not ( = ?auto_385483 ?auto_385485 ) ) ( not ( = ?auto_385483 ?auto_385486 ) ) ( not ( = ?auto_385483 ?auto_385487 ) ) ( not ( = ?auto_385483 ?auto_385488 ) ) ( not ( = ?auto_385483 ?auto_385489 ) ) ( not ( = ?auto_385483 ?auto_385490 ) ) ( not ( = ?auto_385483 ?auto_385491 ) ) ( not ( = ?auto_385483 ?auto_385492 ) ) ( not ( = ?auto_385484 ?auto_385485 ) ) ( not ( = ?auto_385484 ?auto_385486 ) ) ( not ( = ?auto_385484 ?auto_385487 ) ) ( not ( = ?auto_385484 ?auto_385488 ) ) ( not ( = ?auto_385484 ?auto_385489 ) ) ( not ( = ?auto_385484 ?auto_385490 ) ) ( not ( = ?auto_385484 ?auto_385491 ) ) ( not ( = ?auto_385484 ?auto_385492 ) ) ( not ( = ?auto_385485 ?auto_385486 ) ) ( not ( = ?auto_385485 ?auto_385487 ) ) ( not ( = ?auto_385485 ?auto_385488 ) ) ( not ( = ?auto_385485 ?auto_385489 ) ) ( not ( = ?auto_385485 ?auto_385490 ) ) ( not ( = ?auto_385485 ?auto_385491 ) ) ( not ( = ?auto_385485 ?auto_385492 ) ) ( not ( = ?auto_385486 ?auto_385487 ) ) ( not ( = ?auto_385486 ?auto_385488 ) ) ( not ( = ?auto_385486 ?auto_385489 ) ) ( not ( = ?auto_385486 ?auto_385490 ) ) ( not ( = ?auto_385486 ?auto_385491 ) ) ( not ( = ?auto_385486 ?auto_385492 ) ) ( not ( = ?auto_385487 ?auto_385488 ) ) ( not ( = ?auto_385487 ?auto_385489 ) ) ( not ( = ?auto_385487 ?auto_385490 ) ) ( not ( = ?auto_385487 ?auto_385491 ) ) ( not ( = ?auto_385487 ?auto_385492 ) ) ( not ( = ?auto_385488 ?auto_385489 ) ) ( not ( = ?auto_385488 ?auto_385490 ) ) ( not ( = ?auto_385488 ?auto_385491 ) ) ( not ( = ?auto_385488 ?auto_385492 ) ) ( not ( = ?auto_385489 ?auto_385490 ) ) ( not ( = ?auto_385489 ?auto_385491 ) ) ( not ( = ?auto_385489 ?auto_385492 ) ) ( not ( = ?auto_385490 ?auto_385491 ) ) ( not ( = ?auto_385490 ?auto_385492 ) ) ( not ( = ?auto_385491 ?auto_385492 ) ) ( ON ?auto_385490 ?auto_385491 ) ( ON ?auto_385489 ?auto_385490 ) ( ON ?auto_385488 ?auto_385489 ) ( ON ?auto_385487 ?auto_385488 ) ( ON ?auto_385486 ?auto_385487 ) ( ON ?auto_385485 ?auto_385486 ) ( ON ?auto_385484 ?auto_385485 ) ( ON ?auto_385483 ?auto_385484 ) ( CLEAR ?auto_385481 ) ( ON ?auto_385482 ?auto_385483 ) ( CLEAR ?auto_385482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_385478 ?auto_385479 ?auto_385480 ?auto_385481 ?auto_385482 )
      ( MAKE-14PILE ?auto_385478 ?auto_385479 ?auto_385480 ?auto_385481 ?auto_385482 ?auto_385483 ?auto_385484 ?auto_385485 ?auto_385486 ?auto_385487 ?auto_385488 ?auto_385489 ?auto_385490 ?auto_385491 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385507 - BLOCK
      ?auto_385508 - BLOCK
      ?auto_385509 - BLOCK
      ?auto_385510 - BLOCK
      ?auto_385511 - BLOCK
      ?auto_385512 - BLOCK
      ?auto_385513 - BLOCK
      ?auto_385514 - BLOCK
      ?auto_385515 - BLOCK
      ?auto_385516 - BLOCK
      ?auto_385517 - BLOCK
      ?auto_385518 - BLOCK
      ?auto_385519 - BLOCK
      ?auto_385520 - BLOCK
    )
    :vars
    (
      ?auto_385521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385520 ?auto_385521 ) ( ON-TABLE ?auto_385507 ) ( ON ?auto_385508 ?auto_385507 ) ( ON ?auto_385509 ?auto_385508 ) ( ON ?auto_385510 ?auto_385509 ) ( not ( = ?auto_385507 ?auto_385508 ) ) ( not ( = ?auto_385507 ?auto_385509 ) ) ( not ( = ?auto_385507 ?auto_385510 ) ) ( not ( = ?auto_385507 ?auto_385511 ) ) ( not ( = ?auto_385507 ?auto_385512 ) ) ( not ( = ?auto_385507 ?auto_385513 ) ) ( not ( = ?auto_385507 ?auto_385514 ) ) ( not ( = ?auto_385507 ?auto_385515 ) ) ( not ( = ?auto_385507 ?auto_385516 ) ) ( not ( = ?auto_385507 ?auto_385517 ) ) ( not ( = ?auto_385507 ?auto_385518 ) ) ( not ( = ?auto_385507 ?auto_385519 ) ) ( not ( = ?auto_385507 ?auto_385520 ) ) ( not ( = ?auto_385507 ?auto_385521 ) ) ( not ( = ?auto_385508 ?auto_385509 ) ) ( not ( = ?auto_385508 ?auto_385510 ) ) ( not ( = ?auto_385508 ?auto_385511 ) ) ( not ( = ?auto_385508 ?auto_385512 ) ) ( not ( = ?auto_385508 ?auto_385513 ) ) ( not ( = ?auto_385508 ?auto_385514 ) ) ( not ( = ?auto_385508 ?auto_385515 ) ) ( not ( = ?auto_385508 ?auto_385516 ) ) ( not ( = ?auto_385508 ?auto_385517 ) ) ( not ( = ?auto_385508 ?auto_385518 ) ) ( not ( = ?auto_385508 ?auto_385519 ) ) ( not ( = ?auto_385508 ?auto_385520 ) ) ( not ( = ?auto_385508 ?auto_385521 ) ) ( not ( = ?auto_385509 ?auto_385510 ) ) ( not ( = ?auto_385509 ?auto_385511 ) ) ( not ( = ?auto_385509 ?auto_385512 ) ) ( not ( = ?auto_385509 ?auto_385513 ) ) ( not ( = ?auto_385509 ?auto_385514 ) ) ( not ( = ?auto_385509 ?auto_385515 ) ) ( not ( = ?auto_385509 ?auto_385516 ) ) ( not ( = ?auto_385509 ?auto_385517 ) ) ( not ( = ?auto_385509 ?auto_385518 ) ) ( not ( = ?auto_385509 ?auto_385519 ) ) ( not ( = ?auto_385509 ?auto_385520 ) ) ( not ( = ?auto_385509 ?auto_385521 ) ) ( not ( = ?auto_385510 ?auto_385511 ) ) ( not ( = ?auto_385510 ?auto_385512 ) ) ( not ( = ?auto_385510 ?auto_385513 ) ) ( not ( = ?auto_385510 ?auto_385514 ) ) ( not ( = ?auto_385510 ?auto_385515 ) ) ( not ( = ?auto_385510 ?auto_385516 ) ) ( not ( = ?auto_385510 ?auto_385517 ) ) ( not ( = ?auto_385510 ?auto_385518 ) ) ( not ( = ?auto_385510 ?auto_385519 ) ) ( not ( = ?auto_385510 ?auto_385520 ) ) ( not ( = ?auto_385510 ?auto_385521 ) ) ( not ( = ?auto_385511 ?auto_385512 ) ) ( not ( = ?auto_385511 ?auto_385513 ) ) ( not ( = ?auto_385511 ?auto_385514 ) ) ( not ( = ?auto_385511 ?auto_385515 ) ) ( not ( = ?auto_385511 ?auto_385516 ) ) ( not ( = ?auto_385511 ?auto_385517 ) ) ( not ( = ?auto_385511 ?auto_385518 ) ) ( not ( = ?auto_385511 ?auto_385519 ) ) ( not ( = ?auto_385511 ?auto_385520 ) ) ( not ( = ?auto_385511 ?auto_385521 ) ) ( not ( = ?auto_385512 ?auto_385513 ) ) ( not ( = ?auto_385512 ?auto_385514 ) ) ( not ( = ?auto_385512 ?auto_385515 ) ) ( not ( = ?auto_385512 ?auto_385516 ) ) ( not ( = ?auto_385512 ?auto_385517 ) ) ( not ( = ?auto_385512 ?auto_385518 ) ) ( not ( = ?auto_385512 ?auto_385519 ) ) ( not ( = ?auto_385512 ?auto_385520 ) ) ( not ( = ?auto_385512 ?auto_385521 ) ) ( not ( = ?auto_385513 ?auto_385514 ) ) ( not ( = ?auto_385513 ?auto_385515 ) ) ( not ( = ?auto_385513 ?auto_385516 ) ) ( not ( = ?auto_385513 ?auto_385517 ) ) ( not ( = ?auto_385513 ?auto_385518 ) ) ( not ( = ?auto_385513 ?auto_385519 ) ) ( not ( = ?auto_385513 ?auto_385520 ) ) ( not ( = ?auto_385513 ?auto_385521 ) ) ( not ( = ?auto_385514 ?auto_385515 ) ) ( not ( = ?auto_385514 ?auto_385516 ) ) ( not ( = ?auto_385514 ?auto_385517 ) ) ( not ( = ?auto_385514 ?auto_385518 ) ) ( not ( = ?auto_385514 ?auto_385519 ) ) ( not ( = ?auto_385514 ?auto_385520 ) ) ( not ( = ?auto_385514 ?auto_385521 ) ) ( not ( = ?auto_385515 ?auto_385516 ) ) ( not ( = ?auto_385515 ?auto_385517 ) ) ( not ( = ?auto_385515 ?auto_385518 ) ) ( not ( = ?auto_385515 ?auto_385519 ) ) ( not ( = ?auto_385515 ?auto_385520 ) ) ( not ( = ?auto_385515 ?auto_385521 ) ) ( not ( = ?auto_385516 ?auto_385517 ) ) ( not ( = ?auto_385516 ?auto_385518 ) ) ( not ( = ?auto_385516 ?auto_385519 ) ) ( not ( = ?auto_385516 ?auto_385520 ) ) ( not ( = ?auto_385516 ?auto_385521 ) ) ( not ( = ?auto_385517 ?auto_385518 ) ) ( not ( = ?auto_385517 ?auto_385519 ) ) ( not ( = ?auto_385517 ?auto_385520 ) ) ( not ( = ?auto_385517 ?auto_385521 ) ) ( not ( = ?auto_385518 ?auto_385519 ) ) ( not ( = ?auto_385518 ?auto_385520 ) ) ( not ( = ?auto_385518 ?auto_385521 ) ) ( not ( = ?auto_385519 ?auto_385520 ) ) ( not ( = ?auto_385519 ?auto_385521 ) ) ( not ( = ?auto_385520 ?auto_385521 ) ) ( ON ?auto_385519 ?auto_385520 ) ( ON ?auto_385518 ?auto_385519 ) ( ON ?auto_385517 ?auto_385518 ) ( ON ?auto_385516 ?auto_385517 ) ( ON ?auto_385515 ?auto_385516 ) ( ON ?auto_385514 ?auto_385515 ) ( ON ?auto_385513 ?auto_385514 ) ( ON ?auto_385512 ?auto_385513 ) ( CLEAR ?auto_385510 ) ( ON ?auto_385511 ?auto_385512 ) ( CLEAR ?auto_385511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_385507 ?auto_385508 ?auto_385509 ?auto_385510 ?auto_385511 )
      ( MAKE-14PILE ?auto_385507 ?auto_385508 ?auto_385509 ?auto_385510 ?auto_385511 ?auto_385512 ?auto_385513 ?auto_385514 ?auto_385515 ?auto_385516 ?auto_385517 ?auto_385518 ?auto_385519 ?auto_385520 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385536 - BLOCK
      ?auto_385537 - BLOCK
      ?auto_385538 - BLOCK
      ?auto_385539 - BLOCK
      ?auto_385540 - BLOCK
      ?auto_385541 - BLOCK
      ?auto_385542 - BLOCK
      ?auto_385543 - BLOCK
      ?auto_385544 - BLOCK
      ?auto_385545 - BLOCK
      ?auto_385546 - BLOCK
      ?auto_385547 - BLOCK
      ?auto_385548 - BLOCK
      ?auto_385549 - BLOCK
    )
    :vars
    (
      ?auto_385550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385549 ?auto_385550 ) ( ON-TABLE ?auto_385536 ) ( ON ?auto_385537 ?auto_385536 ) ( ON ?auto_385538 ?auto_385537 ) ( not ( = ?auto_385536 ?auto_385537 ) ) ( not ( = ?auto_385536 ?auto_385538 ) ) ( not ( = ?auto_385536 ?auto_385539 ) ) ( not ( = ?auto_385536 ?auto_385540 ) ) ( not ( = ?auto_385536 ?auto_385541 ) ) ( not ( = ?auto_385536 ?auto_385542 ) ) ( not ( = ?auto_385536 ?auto_385543 ) ) ( not ( = ?auto_385536 ?auto_385544 ) ) ( not ( = ?auto_385536 ?auto_385545 ) ) ( not ( = ?auto_385536 ?auto_385546 ) ) ( not ( = ?auto_385536 ?auto_385547 ) ) ( not ( = ?auto_385536 ?auto_385548 ) ) ( not ( = ?auto_385536 ?auto_385549 ) ) ( not ( = ?auto_385536 ?auto_385550 ) ) ( not ( = ?auto_385537 ?auto_385538 ) ) ( not ( = ?auto_385537 ?auto_385539 ) ) ( not ( = ?auto_385537 ?auto_385540 ) ) ( not ( = ?auto_385537 ?auto_385541 ) ) ( not ( = ?auto_385537 ?auto_385542 ) ) ( not ( = ?auto_385537 ?auto_385543 ) ) ( not ( = ?auto_385537 ?auto_385544 ) ) ( not ( = ?auto_385537 ?auto_385545 ) ) ( not ( = ?auto_385537 ?auto_385546 ) ) ( not ( = ?auto_385537 ?auto_385547 ) ) ( not ( = ?auto_385537 ?auto_385548 ) ) ( not ( = ?auto_385537 ?auto_385549 ) ) ( not ( = ?auto_385537 ?auto_385550 ) ) ( not ( = ?auto_385538 ?auto_385539 ) ) ( not ( = ?auto_385538 ?auto_385540 ) ) ( not ( = ?auto_385538 ?auto_385541 ) ) ( not ( = ?auto_385538 ?auto_385542 ) ) ( not ( = ?auto_385538 ?auto_385543 ) ) ( not ( = ?auto_385538 ?auto_385544 ) ) ( not ( = ?auto_385538 ?auto_385545 ) ) ( not ( = ?auto_385538 ?auto_385546 ) ) ( not ( = ?auto_385538 ?auto_385547 ) ) ( not ( = ?auto_385538 ?auto_385548 ) ) ( not ( = ?auto_385538 ?auto_385549 ) ) ( not ( = ?auto_385538 ?auto_385550 ) ) ( not ( = ?auto_385539 ?auto_385540 ) ) ( not ( = ?auto_385539 ?auto_385541 ) ) ( not ( = ?auto_385539 ?auto_385542 ) ) ( not ( = ?auto_385539 ?auto_385543 ) ) ( not ( = ?auto_385539 ?auto_385544 ) ) ( not ( = ?auto_385539 ?auto_385545 ) ) ( not ( = ?auto_385539 ?auto_385546 ) ) ( not ( = ?auto_385539 ?auto_385547 ) ) ( not ( = ?auto_385539 ?auto_385548 ) ) ( not ( = ?auto_385539 ?auto_385549 ) ) ( not ( = ?auto_385539 ?auto_385550 ) ) ( not ( = ?auto_385540 ?auto_385541 ) ) ( not ( = ?auto_385540 ?auto_385542 ) ) ( not ( = ?auto_385540 ?auto_385543 ) ) ( not ( = ?auto_385540 ?auto_385544 ) ) ( not ( = ?auto_385540 ?auto_385545 ) ) ( not ( = ?auto_385540 ?auto_385546 ) ) ( not ( = ?auto_385540 ?auto_385547 ) ) ( not ( = ?auto_385540 ?auto_385548 ) ) ( not ( = ?auto_385540 ?auto_385549 ) ) ( not ( = ?auto_385540 ?auto_385550 ) ) ( not ( = ?auto_385541 ?auto_385542 ) ) ( not ( = ?auto_385541 ?auto_385543 ) ) ( not ( = ?auto_385541 ?auto_385544 ) ) ( not ( = ?auto_385541 ?auto_385545 ) ) ( not ( = ?auto_385541 ?auto_385546 ) ) ( not ( = ?auto_385541 ?auto_385547 ) ) ( not ( = ?auto_385541 ?auto_385548 ) ) ( not ( = ?auto_385541 ?auto_385549 ) ) ( not ( = ?auto_385541 ?auto_385550 ) ) ( not ( = ?auto_385542 ?auto_385543 ) ) ( not ( = ?auto_385542 ?auto_385544 ) ) ( not ( = ?auto_385542 ?auto_385545 ) ) ( not ( = ?auto_385542 ?auto_385546 ) ) ( not ( = ?auto_385542 ?auto_385547 ) ) ( not ( = ?auto_385542 ?auto_385548 ) ) ( not ( = ?auto_385542 ?auto_385549 ) ) ( not ( = ?auto_385542 ?auto_385550 ) ) ( not ( = ?auto_385543 ?auto_385544 ) ) ( not ( = ?auto_385543 ?auto_385545 ) ) ( not ( = ?auto_385543 ?auto_385546 ) ) ( not ( = ?auto_385543 ?auto_385547 ) ) ( not ( = ?auto_385543 ?auto_385548 ) ) ( not ( = ?auto_385543 ?auto_385549 ) ) ( not ( = ?auto_385543 ?auto_385550 ) ) ( not ( = ?auto_385544 ?auto_385545 ) ) ( not ( = ?auto_385544 ?auto_385546 ) ) ( not ( = ?auto_385544 ?auto_385547 ) ) ( not ( = ?auto_385544 ?auto_385548 ) ) ( not ( = ?auto_385544 ?auto_385549 ) ) ( not ( = ?auto_385544 ?auto_385550 ) ) ( not ( = ?auto_385545 ?auto_385546 ) ) ( not ( = ?auto_385545 ?auto_385547 ) ) ( not ( = ?auto_385545 ?auto_385548 ) ) ( not ( = ?auto_385545 ?auto_385549 ) ) ( not ( = ?auto_385545 ?auto_385550 ) ) ( not ( = ?auto_385546 ?auto_385547 ) ) ( not ( = ?auto_385546 ?auto_385548 ) ) ( not ( = ?auto_385546 ?auto_385549 ) ) ( not ( = ?auto_385546 ?auto_385550 ) ) ( not ( = ?auto_385547 ?auto_385548 ) ) ( not ( = ?auto_385547 ?auto_385549 ) ) ( not ( = ?auto_385547 ?auto_385550 ) ) ( not ( = ?auto_385548 ?auto_385549 ) ) ( not ( = ?auto_385548 ?auto_385550 ) ) ( not ( = ?auto_385549 ?auto_385550 ) ) ( ON ?auto_385548 ?auto_385549 ) ( ON ?auto_385547 ?auto_385548 ) ( ON ?auto_385546 ?auto_385547 ) ( ON ?auto_385545 ?auto_385546 ) ( ON ?auto_385544 ?auto_385545 ) ( ON ?auto_385543 ?auto_385544 ) ( ON ?auto_385542 ?auto_385543 ) ( ON ?auto_385541 ?auto_385542 ) ( ON ?auto_385540 ?auto_385541 ) ( CLEAR ?auto_385538 ) ( ON ?auto_385539 ?auto_385540 ) ( CLEAR ?auto_385539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_385536 ?auto_385537 ?auto_385538 ?auto_385539 )
      ( MAKE-14PILE ?auto_385536 ?auto_385537 ?auto_385538 ?auto_385539 ?auto_385540 ?auto_385541 ?auto_385542 ?auto_385543 ?auto_385544 ?auto_385545 ?auto_385546 ?auto_385547 ?auto_385548 ?auto_385549 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385565 - BLOCK
      ?auto_385566 - BLOCK
      ?auto_385567 - BLOCK
      ?auto_385568 - BLOCK
      ?auto_385569 - BLOCK
      ?auto_385570 - BLOCK
      ?auto_385571 - BLOCK
      ?auto_385572 - BLOCK
      ?auto_385573 - BLOCK
      ?auto_385574 - BLOCK
      ?auto_385575 - BLOCK
      ?auto_385576 - BLOCK
      ?auto_385577 - BLOCK
      ?auto_385578 - BLOCK
    )
    :vars
    (
      ?auto_385579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385578 ?auto_385579 ) ( ON-TABLE ?auto_385565 ) ( ON ?auto_385566 ?auto_385565 ) ( ON ?auto_385567 ?auto_385566 ) ( not ( = ?auto_385565 ?auto_385566 ) ) ( not ( = ?auto_385565 ?auto_385567 ) ) ( not ( = ?auto_385565 ?auto_385568 ) ) ( not ( = ?auto_385565 ?auto_385569 ) ) ( not ( = ?auto_385565 ?auto_385570 ) ) ( not ( = ?auto_385565 ?auto_385571 ) ) ( not ( = ?auto_385565 ?auto_385572 ) ) ( not ( = ?auto_385565 ?auto_385573 ) ) ( not ( = ?auto_385565 ?auto_385574 ) ) ( not ( = ?auto_385565 ?auto_385575 ) ) ( not ( = ?auto_385565 ?auto_385576 ) ) ( not ( = ?auto_385565 ?auto_385577 ) ) ( not ( = ?auto_385565 ?auto_385578 ) ) ( not ( = ?auto_385565 ?auto_385579 ) ) ( not ( = ?auto_385566 ?auto_385567 ) ) ( not ( = ?auto_385566 ?auto_385568 ) ) ( not ( = ?auto_385566 ?auto_385569 ) ) ( not ( = ?auto_385566 ?auto_385570 ) ) ( not ( = ?auto_385566 ?auto_385571 ) ) ( not ( = ?auto_385566 ?auto_385572 ) ) ( not ( = ?auto_385566 ?auto_385573 ) ) ( not ( = ?auto_385566 ?auto_385574 ) ) ( not ( = ?auto_385566 ?auto_385575 ) ) ( not ( = ?auto_385566 ?auto_385576 ) ) ( not ( = ?auto_385566 ?auto_385577 ) ) ( not ( = ?auto_385566 ?auto_385578 ) ) ( not ( = ?auto_385566 ?auto_385579 ) ) ( not ( = ?auto_385567 ?auto_385568 ) ) ( not ( = ?auto_385567 ?auto_385569 ) ) ( not ( = ?auto_385567 ?auto_385570 ) ) ( not ( = ?auto_385567 ?auto_385571 ) ) ( not ( = ?auto_385567 ?auto_385572 ) ) ( not ( = ?auto_385567 ?auto_385573 ) ) ( not ( = ?auto_385567 ?auto_385574 ) ) ( not ( = ?auto_385567 ?auto_385575 ) ) ( not ( = ?auto_385567 ?auto_385576 ) ) ( not ( = ?auto_385567 ?auto_385577 ) ) ( not ( = ?auto_385567 ?auto_385578 ) ) ( not ( = ?auto_385567 ?auto_385579 ) ) ( not ( = ?auto_385568 ?auto_385569 ) ) ( not ( = ?auto_385568 ?auto_385570 ) ) ( not ( = ?auto_385568 ?auto_385571 ) ) ( not ( = ?auto_385568 ?auto_385572 ) ) ( not ( = ?auto_385568 ?auto_385573 ) ) ( not ( = ?auto_385568 ?auto_385574 ) ) ( not ( = ?auto_385568 ?auto_385575 ) ) ( not ( = ?auto_385568 ?auto_385576 ) ) ( not ( = ?auto_385568 ?auto_385577 ) ) ( not ( = ?auto_385568 ?auto_385578 ) ) ( not ( = ?auto_385568 ?auto_385579 ) ) ( not ( = ?auto_385569 ?auto_385570 ) ) ( not ( = ?auto_385569 ?auto_385571 ) ) ( not ( = ?auto_385569 ?auto_385572 ) ) ( not ( = ?auto_385569 ?auto_385573 ) ) ( not ( = ?auto_385569 ?auto_385574 ) ) ( not ( = ?auto_385569 ?auto_385575 ) ) ( not ( = ?auto_385569 ?auto_385576 ) ) ( not ( = ?auto_385569 ?auto_385577 ) ) ( not ( = ?auto_385569 ?auto_385578 ) ) ( not ( = ?auto_385569 ?auto_385579 ) ) ( not ( = ?auto_385570 ?auto_385571 ) ) ( not ( = ?auto_385570 ?auto_385572 ) ) ( not ( = ?auto_385570 ?auto_385573 ) ) ( not ( = ?auto_385570 ?auto_385574 ) ) ( not ( = ?auto_385570 ?auto_385575 ) ) ( not ( = ?auto_385570 ?auto_385576 ) ) ( not ( = ?auto_385570 ?auto_385577 ) ) ( not ( = ?auto_385570 ?auto_385578 ) ) ( not ( = ?auto_385570 ?auto_385579 ) ) ( not ( = ?auto_385571 ?auto_385572 ) ) ( not ( = ?auto_385571 ?auto_385573 ) ) ( not ( = ?auto_385571 ?auto_385574 ) ) ( not ( = ?auto_385571 ?auto_385575 ) ) ( not ( = ?auto_385571 ?auto_385576 ) ) ( not ( = ?auto_385571 ?auto_385577 ) ) ( not ( = ?auto_385571 ?auto_385578 ) ) ( not ( = ?auto_385571 ?auto_385579 ) ) ( not ( = ?auto_385572 ?auto_385573 ) ) ( not ( = ?auto_385572 ?auto_385574 ) ) ( not ( = ?auto_385572 ?auto_385575 ) ) ( not ( = ?auto_385572 ?auto_385576 ) ) ( not ( = ?auto_385572 ?auto_385577 ) ) ( not ( = ?auto_385572 ?auto_385578 ) ) ( not ( = ?auto_385572 ?auto_385579 ) ) ( not ( = ?auto_385573 ?auto_385574 ) ) ( not ( = ?auto_385573 ?auto_385575 ) ) ( not ( = ?auto_385573 ?auto_385576 ) ) ( not ( = ?auto_385573 ?auto_385577 ) ) ( not ( = ?auto_385573 ?auto_385578 ) ) ( not ( = ?auto_385573 ?auto_385579 ) ) ( not ( = ?auto_385574 ?auto_385575 ) ) ( not ( = ?auto_385574 ?auto_385576 ) ) ( not ( = ?auto_385574 ?auto_385577 ) ) ( not ( = ?auto_385574 ?auto_385578 ) ) ( not ( = ?auto_385574 ?auto_385579 ) ) ( not ( = ?auto_385575 ?auto_385576 ) ) ( not ( = ?auto_385575 ?auto_385577 ) ) ( not ( = ?auto_385575 ?auto_385578 ) ) ( not ( = ?auto_385575 ?auto_385579 ) ) ( not ( = ?auto_385576 ?auto_385577 ) ) ( not ( = ?auto_385576 ?auto_385578 ) ) ( not ( = ?auto_385576 ?auto_385579 ) ) ( not ( = ?auto_385577 ?auto_385578 ) ) ( not ( = ?auto_385577 ?auto_385579 ) ) ( not ( = ?auto_385578 ?auto_385579 ) ) ( ON ?auto_385577 ?auto_385578 ) ( ON ?auto_385576 ?auto_385577 ) ( ON ?auto_385575 ?auto_385576 ) ( ON ?auto_385574 ?auto_385575 ) ( ON ?auto_385573 ?auto_385574 ) ( ON ?auto_385572 ?auto_385573 ) ( ON ?auto_385571 ?auto_385572 ) ( ON ?auto_385570 ?auto_385571 ) ( ON ?auto_385569 ?auto_385570 ) ( CLEAR ?auto_385567 ) ( ON ?auto_385568 ?auto_385569 ) ( CLEAR ?auto_385568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_385565 ?auto_385566 ?auto_385567 ?auto_385568 )
      ( MAKE-14PILE ?auto_385565 ?auto_385566 ?auto_385567 ?auto_385568 ?auto_385569 ?auto_385570 ?auto_385571 ?auto_385572 ?auto_385573 ?auto_385574 ?auto_385575 ?auto_385576 ?auto_385577 ?auto_385578 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385594 - BLOCK
      ?auto_385595 - BLOCK
      ?auto_385596 - BLOCK
      ?auto_385597 - BLOCK
      ?auto_385598 - BLOCK
      ?auto_385599 - BLOCK
      ?auto_385600 - BLOCK
      ?auto_385601 - BLOCK
      ?auto_385602 - BLOCK
      ?auto_385603 - BLOCK
      ?auto_385604 - BLOCK
      ?auto_385605 - BLOCK
      ?auto_385606 - BLOCK
      ?auto_385607 - BLOCK
    )
    :vars
    (
      ?auto_385608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385607 ?auto_385608 ) ( ON-TABLE ?auto_385594 ) ( ON ?auto_385595 ?auto_385594 ) ( not ( = ?auto_385594 ?auto_385595 ) ) ( not ( = ?auto_385594 ?auto_385596 ) ) ( not ( = ?auto_385594 ?auto_385597 ) ) ( not ( = ?auto_385594 ?auto_385598 ) ) ( not ( = ?auto_385594 ?auto_385599 ) ) ( not ( = ?auto_385594 ?auto_385600 ) ) ( not ( = ?auto_385594 ?auto_385601 ) ) ( not ( = ?auto_385594 ?auto_385602 ) ) ( not ( = ?auto_385594 ?auto_385603 ) ) ( not ( = ?auto_385594 ?auto_385604 ) ) ( not ( = ?auto_385594 ?auto_385605 ) ) ( not ( = ?auto_385594 ?auto_385606 ) ) ( not ( = ?auto_385594 ?auto_385607 ) ) ( not ( = ?auto_385594 ?auto_385608 ) ) ( not ( = ?auto_385595 ?auto_385596 ) ) ( not ( = ?auto_385595 ?auto_385597 ) ) ( not ( = ?auto_385595 ?auto_385598 ) ) ( not ( = ?auto_385595 ?auto_385599 ) ) ( not ( = ?auto_385595 ?auto_385600 ) ) ( not ( = ?auto_385595 ?auto_385601 ) ) ( not ( = ?auto_385595 ?auto_385602 ) ) ( not ( = ?auto_385595 ?auto_385603 ) ) ( not ( = ?auto_385595 ?auto_385604 ) ) ( not ( = ?auto_385595 ?auto_385605 ) ) ( not ( = ?auto_385595 ?auto_385606 ) ) ( not ( = ?auto_385595 ?auto_385607 ) ) ( not ( = ?auto_385595 ?auto_385608 ) ) ( not ( = ?auto_385596 ?auto_385597 ) ) ( not ( = ?auto_385596 ?auto_385598 ) ) ( not ( = ?auto_385596 ?auto_385599 ) ) ( not ( = ?auto_385596 ?auto_385600 ) ) ( not ( = ?auto_385596 ?auto_385601 ) ) ( not ( = ?auto_385596 ?auto_385602 ) ) ( not ( = ?auto_385596 ?auto_385603 ) ) ( not ( = ?auto_385596 ?auto_385604 ) ) ( not ( = ?auto_385596 ?auto_385605 ) ) ( not ( = ?auto_385596 ?auto_385606 ) ) ( not ( = ?auto_385596 ?auto_385607 ) ) ( not ( = ?auto_385596 ?auto_385608 ) ) ( not ( = ?auto_385597 ?auto_385598 ) ) ( not ( = ?auto_385597 ?auto_385599 ) ) ( not ( = ?auto_385597 ?auto_385600 ) ) ( not ( = ?auto_385597 ?auto_385601 ) ) ( not ( = ?auto_385597 ?auto_385602 ) ) ( not ( = ?auto_385597 ?auto_385603 ) ) ( not ( = ?auto_385597 ?auto_385604 ) ) ( not ( = ?auto_385597 ?auto_385605 ) ) ( not ( = ?auto_385597 ?auto_385606 ) ) ( not ( = ?auto_385597 ?auto_385607 ) ) ( not ( = ?auto_385597 ?auto_385608 ) ) ( not ( = ?auto_385598 ?auto_385599 ) ) ( not ( = ?auto_385598 ?auto_385600 ) ) ( not ( = ?auto_385598 ?auto_385601 ) ) ( not ( = ?auto_385598 ?auto_385602 ) ) ( not ( = ?auto_385598 ?auto_385603 ) ) ( not ( = ?auto_385598 ?auto_385604 ) ) ( not ( = ?auto_385598 ?auto_385605 ) ) ( not ( = ?auto_385598 ?auto_385606 ) ) ( not ( = ?auto_385598 ?auto_385607 ) ) ( not ( = ?auto_385598 ?auto_385608 ) ) ( not ( = ?auto_385599 ?auto_385600 ) ) ( not ( = ?auto_385599 ?auto_385601 ) ) ( not ( = ?auto_385599 ?auto_385602 ) ) ( not ( = ?auto_385599 ?auto_385603 ) ) ( not ( = ?auto_385599 ?auto_385604 ) ) ( not ( = ?auto_385599 ?auto_385605 ) ) ( not ( = ?auto_385599 ?auto_385606 ) ) ( not ( = ?auto_385599 ?auto_385607 ) ) ( not ( = ?auto_385599 ?auto_385608 ) ) ( not ( = ?auto_385600 ?auto_385601 ) ) ( not ( = ?auto_385600 ?auto_385602 ) ) ( not ( = ?auto_385600 ?auto_385603 ) ) ( not ( = ?auto_385600 ?auto_385604 ) ) ( not ( = ?auto_385600 ?auto_385605 ) ) ( not ( = ?auto_385600 ?auto_385606 ) ) ( not ( = ?auto_385600 ?auto_385607 ) ) ( not ( = ?auto_385600 ?auto_385608 ) ) ( not ( = ?auto_385601 ?auto_385602 ) ) ( not ( = ?auto_385601 ?auto_385603 ) ) ( not ( = ?auto_385601 ?auto_385604 ) ) ( not ( = ?auto_385601 ?auto_385605 ) ) ( not ( = ?auto_385601 ?auto_385606 ) ) ( not ( = ?auto_385601 ?auto_385607 ) ) ( not ( = ?auto_385601 ?auto_385608 ) ) ( not ( = ?auto_385602 ?auto_385603 ) ) ( not ( = ?auto_385602 ?auto_385604 ) ) ( not ( = ?auto_385602 ?auto_385605 ) ) ( not ( = ?auto_385602 ?auto_385606 ) ) ( not ( = ?auto_385602 ?auto_385607 ) ) ( not ( = ?auto_385602 ?auto_385608 ) ) ( not ( = ?auto_385603 ?auto_385604 ) ) ( not ( = ?auto_385603 ?auto_385605 ) ) ( not ( = ?auto_385603 ?auto_385606 ) ) ( not ( = ?auto_385603 ?auto_385607 ) ) ( not ( = ?auto_385603 ?auto_385608 ) ) ( not ( = ?auto_385604 ?auto_385605 ) ) ( not ( = ?auto_385604 ?auto_385606 ) ) ( not ( = ?auto_385604 ?auto_385607 ) ) ( not ( = ?auto_385604 ?auto_385608 ) ) ( not ( = ?auto_385605 ?auto_385606 ) ) ( not ( = ?auto_385605 ?auto_385607 ) ) ( not ( = ?auto_385605 ?auto_385608 ) ) ( not ( = ?auto_385606 ?auto_385607 ) ) ( not ( = ?auto_385606 ?auto_385608 ) ) ( not ( = ?auto_385607 ?auto_385608 ) ) ( ON ?auto_385606 ?auto_385607 ) ( ON ?auto_385605 ?auto_385606 ) ( ON ?auto_385604 ?auto_385605 ) ( ON ?auto_385603 ?auto_385604 ) ( ON ?auto_385602 ?auto_385603 ) ( ON ?auto_385601 ?auto_385602 ) ( ON ?auto_385600 ?auto_385601 ) ( ON ?auto_385599 ?auto_385600 ) ( ON ?auto_385598 ?auto_385599 ) ( ON ?auto_385597 ?auto_385598 ) ( CLEAR ?auto_385595 ) ( ON ?auto_385596 ?auto_385597 ) ( CLEAR ?auto_385596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_385594 ?auto_385595 ?auto_385596 )
      ( MAKE-14PILE ?auto_385594 ?auto_385595 ?auto_385596 ?auto_385597 ?auto_385598 ?auto_385599 ?auto_385600 ?auto_385601 ?auto_385602 ?auto_385603 ?auto_385604 ?auto_385605 ?auto_385606 ?auto_385607 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385623 - BLOCK
      ?auto_385624 - BLOCK
      ?auto_385625 - BLOCK
      ?auto_385626 - BLOCK
      ?auto_385627 - BLOCK
      ?auto_385628 - BLOCK
      ?auto_385629 - BLOCK
      ?auto_385630 - BLOCK
      ?auto_385631 - BLOCK
      ?auto_385632 - BLOCK
      ?auto_385633 - BLOCK
      ?auto_385634 - BLOCK
      ?auto_385635 - BLOCK
      ?auto_385636 - BLOCK
    )
    :vars
    (
      ?auto_385637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385636 ?auto_385637 ) ( ON-TABLE ?auto_385623 ) ( ON ?auto_385624 ?auto_385623 ) ( not ( = ?auto_385623 ?auto_385624 ) ) ( not ( = ?auto_385623 ?auto_385625 ) ) ( not ( = ?auto_385623 ?auto_385626 ) ) ( not ( = ?auto_385623 ?auto_385627 ) ) ( not ( = ?auto_385623 ?auto_385628 ) ) ( not ( = ?auto_385623 ?auto_385629 ) ) ( not ( = ?auto_385623 ?auto_385630 ) ) ( not ( = ?auto_385623 ?auto_385631 ) ) ( not ( = ?auto_385623 ?auto_385632 ) ) ( not ( = ?auto_385623 ?auto_385633 ) ) ( not ( = ?auto_385623 ?auto_385634 ) ) ( not ( = ?auto_385623 ?auto_385635 ) ) ( not ( = ?auto_385623 ?auto_385636 ) ) ( not ( = ?auto_385623 ?auto_385637 ) ) ( not ( = ?auto_385624 ?auto_385625 ) ) ( not ( = ?auto_385624 ?auto_385626 ) ) ( not ( = ?auto_385624 ?auto_385627 ) ) ( not ( = ?auto_385624 ?auto_385628 ) ) ( not ( = ?auto_385624 ?auto_385629 ) ) ( not ( = ?auto_385624 ?auto_385630 ) ) ( not ( = ?auto_385624 ?auto_385631 ) ) ( not ( = ?auto_385624 ?auto_385632 ) ) ( not ( = ?auto_385624 ?auto_385633 ) ) ( not ( = ?auto_385624 ?auto_385634 ) ) ( not ( = ?auto_385624 ?auto_385635 ) ) ( not ( = ?auto_385624 ?auto_385636 ) ) ( not ( = ?auto_385624 ?auto_385637 ) ) ( not ( = ?auto_385625 ?auto_385626 ) ) ( not ( = ?auto_385625 ?auto_385627 ) ) ( not ( = ?auto_385625 ?auto_385628 ) ) ( not ( = ?auto_385625 ?auto_385629 ) ) ( not ( = ?auto_385625 ?auto_385630 ) ) ( not ( = ?auto_385625 ?auto_385631 ) ) ( not ( = ?auto_385625 ?auto_385632 ) ) ( not ( = ?auto_385625 ?auto_385633 ) ) ( not ( = ?auto_385625 ?auto_385634 ) ) ( not ( = ?auto_385625 ?auto_385635 ) ) ( not ( = ?auto_385625 ?auto_385636 ) ) ( not ( = ?auto_385625 ?auto_385637 ) ) ( not ( = ?auto_385626 ?auto_385627 ) ) ( not ( = ?auto_385626 ?auto_385628 ) ) ( not ( = ?auto_385626 ?auto_385629 ) ) ( not ( = ?auto_385626 ?auto_385630 ) ) ( not ( = ?auto_385626 ?auto_385631 ) ) ( not ( = ?auto_385626 ?auto_385632 ) ) ( not ( = ?auto_385626 ?auto_385633 ) ) ( not ( = ?auto_385626 ?auto_385634 ) ) ( not ( = ?auto_385626 ?auto_385635 ) ) ( not ( = ?auto_385626 ?auto_385636 ) ) ( not ( = ?auto_385626 ?auto_385637 ) ) ( not ( = ?auto_385627 ?auto_385628 ) ) ( not ( = ?auto_385627 ?auto_385629 ) ) ( not ( = ?auto_385627 ?auto_385630 ) ) ( not ( = ?auto_385627 ?auto_385631 ) ) ( not ( = ?auto_385627 ?auto_385632 ) ) ( not ( = ?auto_385627 ?auto_385633 ) ) ( not ( = ?auto_385627 ?auto_385634 ) ) ( not ( = ?auto_385627 ?auto_385635 ) ) ( not ( = ?auto_385627 ?auto_385636 ) ) ( not ( = ?auto_385627 ?auto_385637 ) ) ( not ( = ?auto_385628 ?auto_385629 ) ) ( not ( = ?auto_385628 ?auto_385630 ) ) ( not ( = ?auto_385628 ?auto_385631 ) ) ( not ( = ?auto_385628 ?auto_385632 ) ) ( not ( = ?auto_385628 ?auto_385633 ) ) ( not ( = ?auto_385628 ?auto_385634 ) ) ( not ( = ?auto_385628 ?auto_385635 ) ) ( not ( = ?auto_385628 ?auto_385636 ) ) ( not ( = ?auto_385628 ?auto_385637 ) ) ( not ( = ?auto_385629 ?auto_385630 ) ) ( not ( = ?auto_385629 ?auto_385631 ) ) ( not ( = ?auto_385629 ?auto_385632 ) ) ( not ( = ?auto_385629 ?auto_385633 ) ) ( not ( = ?auto_385629 ?auto_385634 ) ) ( not ( = ?auto_385629 ?auto_385635 ) ) ( not ( = ?auto_385629 ?auto_385636 ) ) ( not ( = ?auto_385629 ?auto_385637 ) ) ( not ( = ?auto_385630 ?auto_385631 ) ) ( not ( = ?auto_385630 ?auto_385632 ) ) ( not ( = ?auto_385630 ?auto_385633 ) ) ( not ( = ?auto_385630 ?auto_385634 ) ) ( not ( = ?auto_385630 ?auto_385635 ) ) ( not ( = ?auto_385630 ?auto_385636 ) ) ( not ( = ?auto_385630 ?auto_385637 ) ) ( not ( = ?auto_385631 ?auto_385632 ) ) ( not ( = ?auto_385631 ?auto_385633 ) ) ( not ( = ?auto_385631 ?auto_385634 ) ) ( not ( = ?auto_385631 ?auto_385635 ) ) ( not ( = ?auto_385631 ?auto_385636 ) ) ( not ( = ?auto_385631 ?auto_385637 ) ) ( not ( = ?auto_385632 ?auto_385633 ) ) ( not ( = ?auto_385632 ?auto_385634 ) ) ( not ( = ?auto_385632 ?auto_385635 ) ) ( not ( = ?auto_385632 ?auto_385636 ) ) ( not ( = ?auto_385632 ?auto_385637 ) ) ( not ( = ?auto_385633 ?auto_385634 ) ) ( not ( = ?auto_385633 ?auto_385635 ) ) ( not ( = ?auto_385633 ?auto_385636 ) ) ( not ( = ?auto_385633 ?auto_385637 ) ) ( not ( = ?auto_385634 ?auto_385635 ) ) ( not ( = ?auto_385634 ?auto_385636 ) ) ( not ( = ?auto_385634 ?auto_385637 ) ) ( not ( = ?auto_385635 ?auto_385636 ) ) ( not ( = ?auto_385635 ?auto_385637 ) ) ( not ( = ?auto_385636 ?auto_385637 ) ) ( ON ?auto_385635 ?auto_385636 ) ( ON ?auto_385634 ?auto_385635 ) ( ON ?auto_385633 ?auto_385634 ) ( ON ?auto_385632 ?auto_385633 ) ( ON ?auto_385631 ?auto_385632 ) ( ON ?auto_385630 ?auto_385631 ) ( ON ?auto_385629 ?auto_385630 ) ( ON ?auto_385628 ?auto_385629 ) ( ON ?auto_385627 ?auto_385628 ) ( ON ?auto_385626 ?auto_385627 ) ( CLEAR ?auto_385624 ) ( ON ?auto_385625 ?auto_385626 ) ( CLEAR ?auto_385625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_385623 ?auto_385624 ?auto_385625 )
      ( MAKE-14PILE ?auto_385623 ?auto_385624 ?auto_385625 ?auto_385626 ?auto_385627 ?auto_385628 ?auto_385629 ?auto_385630 ?auto_385631 ?auto_385632 ?auto_385633 ?auto_385634 ?auto_385635 ?auto_385636 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385652 - BLOCK
      ?auto_385653 - BLOCK
      ?auto_385654 - BLOCK
      ?auto_385655 - BLOCK
      ?auto_385656 - BLOCK
      ?auto_385657 - BLOCK
      ?auto_385658 - BLOCK
      ?auto_385659 - BLOCK
      ?auto_385660 - BLOCK
      ?auto_385661 - BLOCK
      ?auto_385662 - BLOCK
      ?auto_385663 - BLOCK
      ?auto_385664 - BLOCK
      ?auto_385665 - BLOCK
    )
    :vars
    (
      ?auto_385666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385665 ?auto_385666 ) ( ON-TABLE ?auto_385652 ) ( not ( = ?auto_385652 ?auto_385653 ) ) ( not ( = ?auto_385652 ?auto_385654 ) ) ( not ( = ?auto_385652 ?auto_385655 ) ) ( not ( = ?auto_385652 ?auto_385656 ) ) ( not ( = ?auto_385652 ?auto_385657 ) ) ( not ( = ?auto_385652 ?auto_385658 ) ) ( not ( = ?auto_385652 ?auto_385659 ) ) ( not ( = ?auto_385652 ?auto_385660 ) ) ( not ( = ?auto_385652 ?auto_385661 ) ) ( not ( = ?auto_385652 ?auto_385662 ) ) ( not ( = ?auto_385652 ?auto_385663 ) ) ( not ( = ?auto_385652 ?auto_385664 ) ) ( not ( = ?auto_385652 ?auto_385665 ) ) ( not ( = ?auto_385652 ?auto_385666 ) ) ( not ( = ?auto_385653 ?auto_385654 ) ) ( not ( = ?auto_385653 ?auto_385655 ) ) ( not ( = ?auto_385653 ?auto_385656 ) ) ( not ( = ?auto_385653 ?auto_385657 ) ) ( not ( = ?auto_385653 ?auto_385658 ) ) ( not ( = ?auto_385653 ?auto_385659 ) ) ( not ( = ?auto_385653 ?auto_385660 ) ) ( not ( = ?auto_385653 ?auto_385661 ) ) ( not ( = ?auto_385653 ?auto_385662 ) ) ( not ( = ?auto_385653 ?auto_385663 ) ) ( not ( = ?auto_385653 ?auto_385664 ) ) ( not ( = ?auto_385653 ?auto_385665 ) ) ( not ( = ?auto_385653 ?auto_385666 ) ) ( not ( = ?auto_385654 ?auto_385655 ) ) ( not ( = ?auto_385654 ?auto_385656 ) ) ( not ( = ?auto_385654 ?auto_385657 ) ) ( not ( = ?auto_385654 ?auto_385658 ) ) ( not ( = ?auto_385654 ?auto_385659 ) ) ( not ( = ?auto_385654 ?auto_385660 ) ) ( not ( = ?auto_385654 ?auto_385661 ) ) ( not ( = ?auto_385654 ?auto_385662 ) ) ( not ( = ?auto_385654 ?auto_385663 ) ) ( not ( = ?auto_385654 ?auto_385664 ) ) ( not ( = ?auto_385654 ?auto_385665 ) ) ( not ( = ?auto_385654 ?auto_385666 ) ) ( not ( = ?auto_385655 ?auto_385656 ) ) ( not ( = ?auto_385655 ?auto_385657 ) ) ( not ( = ?auto_385655 ?auto_385658 ) ) ( not ( = ?auto_385655 ?auto_385659 ) ) ( not ( = ?auto_385655 ?auto_385660 ) ) ( not ( = ?auto_385655 ?auto_385661 ) ) ( not ( = ?auto_385655 ?auto_385662 ) ) ( not ( = ?auto_385655 ?auto_385663 ) ) ( not ( = ?auto_385655 ?auto_385664 ) ) ( not ( = ?auto_385655 ?auto_385665 ) ) ( not ( = ?auto_385655 ?auto_385666 ) ) ( not ( = ?auto_385656 ?auto_385657 ) ) ( not ( = ?auto_385656 ?auto_385658 ) ) ( not ( = ?auto_385656 ?auto_385659 ) ) ( not ( = ?auto_385656 ?auto_385660 ) ) ( not ( = ?auto_385656 ?auto_385661 ) ) ( not ( = ?auto_385656 ?auto_385662 ) ) ( not ( = ?auto_385656 ?auto_385663 ) ) ( not ( = ?auto_385656 ?auto_385664 ) ) ( not ( = ?auto_385656 ?auto_385665 ) ) ( not ( = ?auto_385656 ?auto_385666 ) ) ( not ( = ?auto_385657 ?auto_385658 ) ) ( not ( = ?auto_385657 ?auto_385659 ) ) ( not ( = ?auto_385657 ?auto_385660 ) ) ( not ( = ?auto_385657 ?auto_385661 ) ) ( not ( = ?auto_385657 ?auto_385662 ) ) ( not ( = ?auto_385657 ?auto_385663 ) ) ( not ( = ?auto_385657 ?auto_385664 ) ) ( not ( = ?auto_385657 ?auto_385665 ) ) ( not ( = ?auto_385657 ?auto_385666 ) ) ( not ( = ?auto_385658 ?auto_385659 ) ) ( not ( = ?auto_385658 ?auto_385660 ) ) ( not ( = ?auto_385658 ?auto_385661 ) ) ( not ( = ?auto_385658 ?auto_385662 ) ) ( not ( = ?auto_385658 ?auto_385663 ) ) ( not ( = ?auto_385658 ?auto_385664 ) ) ( not ( = ?auto_385658 ?auto_385665 ) ) ( not ( = ?auto_385658 ?auto_385666 ) ) ( not ( = ?auto_385659 ?auto_385660 ) ) ( not ( = ?auto_385659 ?auto_385661 ) ) ( not ( = ?auto_385659 ?auto_385662 ) ) ( not ( = ?auto_385659 ?auto_385663 ) ) ( not ( = ?auto_385659 ?auto_385664 ) ) ( not ( = ?auto_385659 ?auto_385665 ) ) ( not ( = ?auto_385659 ?auto_385666 ) ) ( not ( = ?auto_385660 ?auto_385661 ) ) ( not ( = ?auto_385660 ?auto_385662 ) ) ( not ( = ?auto_385660 ?auto_385663 ) ) ( not ( = ?auto_385660 ?auto_385664 ) ) ( not ( = ?auto_385660 ?auto_385665 ) ) ( not ( = ?auto_385660 ?auto_385666 ) ) ( not ( = ?auto_385661 ?auto_385662 ) ) ( not ( = ?auto_385661 ?auto_385663 ) ) ( not ( = ?auto_385661 ?auto_385664 ) ) ( not ( = ?auto_385661 ?auto_385665 ) ) ( not ( = ?auto_385661 ?auto_385666 ) ) ( not ( = ?auto_385662 ?auto_385663 ) ) ( not ( = ?auto_385662 ?auto_385664 ) ) ( not ( = ?auto_385662 ?auto_385665 ) ) ( not ( = ?auto_385662 ?auto_385666 ) ) ( not ( = ?auto_385663 ?auto_385664 ) ) ( not ( = ?auto_385663 ?auto_385665 ) ) ( not ( = ?auto_385663 ?auto_385666 ) ) ( not ( = ?auto_385664 ?auto_385665 ) ) ( not ( = ?auto_385664 ?auto_385666 ) ) ( not ( = ?auto_385665 ?auto_385666 ) ) ( ON ?auto_385664 ?auto_385665 ) ( ON ?auto_385663 ?auto_385664 ) ( ON ?auto_385662 ?auto_385663 ) ( ON ?auto_385661 ?auto_385662 ) ( ON ?auto_385660 ?auto_385661 ) ( ON ?auto_385659 ?auto_385660 ) ( ON ?auto_385658 ?auto_385659 ) ( ON ?auto_385657 ?auto_385658 ) ( ON ?auto_385656 ?auto_385657 ) ( ON ?auto_385655 ?auto_385656 ) ( ON ?auto_385654 ?auto_385655 ) ( CLEAR ?auto_385652 ) ( ON ?auto_385653 ?auto_385654 ) ( CLEAR ?auto_385653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_385652 ?auto_385653 )
      ( MAKE-14PILE ?auto_385652 ?auto_385653 ?auto_385654 ?auto_385655 ?auto_385656 ?auto_385657 ?auto_385658 ?auto_385659 ?auto_385660 ?auto_385661 ?auto_385662 ?auto_385663 ?auto_385664 ?auto_385665 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385681 - BLOCK
      ?auto_385682 - BLOCK
      ?auto_385683 - BLOCK
      ?auto_385684 - BLOCK
      ?auto_385685 - BLOCK
      ?auto_385686 - BLOCK
      ?auto_385687 - BLOCK
      ?auto_385688 - BLOCK
      ?auto_385689 - BLOCK
      ?auto_385690 - BLOCK
      ?auto_385691 - BLOCK
      ?auto_385692 - BLOCK
      ?auto_385693 - BLOCK
      ?auto_385694 - BLOCK
    )
    :vars
    (
      ?auto_385695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385694 ?auto_385695 ) ( ON-TABLE ?auto_385681 ) ( not ( = ?auto_385681 ?auto_385682 ) ) ( not ( = ?auto_385681 ?auto_385683 ) ) ( not ( = ?auto_385681 ?auto_385684 ) ) ( not ( = ?auto_385681 ?auto_385685 ) ) ( not ( = ?auto_385681 ?auto_385686 ) ) ( not ( = ?auto_385681 ?auto_385687 ) ) ( not ( = ?auto_385681 ?auto_385688 ) ) ( not ( = ?auto_385681 ?auto_385689 ) ) ( not ( = ?auto_385681 ?auto_385690 ) ) ( not ( = ?auto_385681 ?auto_385691 ) ) ( not ( = ?auto_385681 ?auto_385692 ) ) ( not ( = ?auto_385681 ?auto_385693 ) ) ( not ( = ?auto_385681 ?auto_385694 ) ) ( not ( = ?auto_385681 ?auto_385695 ) ) ( not ( = ?auto_385682 ?auto_385683 ) ) ( not ( = ?auto_385682 ?auto_385684 ) ) ( not ( = ?auto_385682 ?auto_385685 ) ) ( not ( = ?auto_385682 ?auto_385686 ) ) ( not ( = ?auto_385682 ?auto_385687 ) ) ( not ( = ?auto_385682 ?auto_385688 ) ) ( not ( = ?auto_385682 ?auto_385689 ) ) ( not ( = ?auto_385682 ?auto_385690 ) ) ( not ( = ?auto_385682 ?auto_385691 ) ) ( not ( = ?auto_385682 ?auto_385692 ) ) ( not ( = ?auto_385682 ?auto_385693 ) ) ( not ( = ?auto_385682 ?auto_385694 ) ) ( not ( = ?auto_385682 ?auto_385695 ) ) ( not ( = ?auto_385683 ?auto_385684 ) ) ( not ( = ?auto_385683 ?auto_385685 ) ) ( not ( = ?auto_385683 ?auto_385686 ) ) ( not ( = ?auto_385683 ?auto_385687 ) ) ( not ( = ?auto_385683 ?auto_385688 ) ) ( not ( = ?auto_385683 ?auto_385689 ) ) ( not ( = ?auto_385683 ?auto_385690 ) ) ( not ( = ?auto_385683 ?auto_385691 ) ) ( not ( = ?auto_385683 ?auto_385692 ) ) ( not ( = ?auto_385683 ?auto_385693 ) ) ( not ( = ?auto_385683 ?auto_385694 ) ) ( not ( = ?auto_385683 ?auto_385695 ) ) ( not ( = ?auto_385684 ?auto_385685 ) ) ( not ( = ?auto_385684 ?auto_385686 ) ) ( not ( = ?auto_385684 ?auto_385687 ) ) ( not ( = ?auto_385684 ?auto_385688 ) ) ( not ( = ?auto_385684 ?auto_385689 ) ) ( not ( = ?auto_385684 ?auto_385690 ) ) ( not ( = ?auto_385684 ?auto_385691 ) ) ( not ( = ?auto_385684 ?auto_385692 ) ) ( not ( = ?auto_385684 ?auto_385693 ) ) ( not ( = ?auto_385684 ?auto_385694 ) ) ( not ( = ?auto_385684 ?auto_385695 ) ) ( not ( = ?auto_385685 ?auto_385686 ) ) ( not ( = ?auto_385685 ?auto_385687 ) ) ( not ( = ?auto_385685 ?auto_385688 ) ) ( not ( = ?auto_385685 ?auto_385689 ) ) ( not ( = ?auto_385685 ?auto_385690 ) ) ( not ( = ?auto_385685 ?auto_385691 ) ) ( not ( = ?auto_385685 ?auto_385692 ) ) ( not ( = ?auto_385685 ?auto_385693 ) ) ( not ( = ?auto_385685 ?auto_385694 ) ) ( not ( = ?auto_385685 ?auto_385695 ) ) ( not ( = ?auto_385686 ?auto_385687 ) ) ( not ( = ?auto_385686 ?auto_385688 ) ) ( not ( = ?auto_385686 ?auto_385689 ) ) ( not ( = ?auto_385686 ?auto_385690 ) ) ( not ( = ?auto_385686 ?auto_385691 ) ) ( not ( = ?auto_385686 ?auto_385692 ) ) ( not ( = ?auto_385686 ?auto_385693 ) ) ( not ( = ?auto_385686 ?auto_385694 ) ) ( not ( = ?auto_385686 ?auto_385695 ) ) ( not ( = ?auto_385687 ?auto_385688 ) ) ( not ( = ?auto_385687 ?auto_385689 ) ) ( not ( = ?auto_385687 ?auto_385690 ) ) ( not ( = ?auto_385687 ?auto_385691 ) ) ( not ( = ?auto_385687 ?auto_385692 ) ) ( not ( = ?auto_385687 ?auto_385693 ) ) ( not ( = ?auto_385687 ?auto_385694 ) ) ( not ( = ?auto_385687 ?auto_385695 ) ) ( not ( = ?auto_385688 ?auto_385689 ) ) ( not ( = ?auto_385688 ?auto_385690 ) ) ( not ( = ?auto_385688 ?auto_385691 ) ) ( not ( = ?auto_385688 ?auto_385692 ) ) ( not ( = ?auto_385688 ?auto_385693 ) ) ( not ( = ?auto_385688 ?auto_385694 ) ) ( not ( = ?auto_385688 ?auto_385695 ) ) ( not ( = ?auto_385689 ?auto_385690 ) ) ( not ( = ?auto_385689 ?auto_385691 ) ) ( not ( = ?auto_385689 ?auto_385692 ) ) ( not ( = ?auto_385689 ?auto_385693 ) ) ( not ( = ?auto_385689 ?auto_385694 ) ) ( not ( = ?auto_385689 ?auto_385695 ) ) ( not ( = ?auto_385690 ?auto_385691 ) ) ( not ( = ?auto_385690 ?auto_385692 ) ) ( not ( = ?auto_385690 ?auto_385693 ) ) ( not ( = ?auto_385690 ?auto_385694 ) ) ( not ( = ?auto_385690 ?auto_385695 ) ) ( not ( = ?auto_385691 ?auto_385692 ) ) ( not ( = ?auto_385691 ?auto_385693 ) ) ( not ( = ?auto_385691 ?auto_385694 ) ) ( not ( = ?auto_385691 ?auto_385695 ) ) ( not ( = ?auto_385692 ?auto_385693 ) ) ( not ( = ?auto_385692 ?auto_385694 ) ) ( not ( = ?auto_385692 ?auto_385695 ) ) ( not ( = ?auto_385693 ?auto_385694 ) ) ( not ( = ?auto_385693 ?auto_385695 ) ) ( not ( = ?auto_385694 ?auto_385695 ) ) ( ON ?auto_385693 ?auto_385694 ) ( ON ?auto_385692 ?auto_385693 ) ( ON ?auto_385691 ?auto_385692 ) ( ON ?auto_385690 ?auto_385691 ) ( ON ?auto_385689 ?auto_385690 ) ( ON ?auto_385688 ?auto_385689 ) ( ON ?auto_385687 ?auto_385688 ) ( ON ?auto_385686 ?auto_385687 ) ( ON ?auto_385685 ?auto_385686 ) ( ON ?auto_385684 ?auto_385685 ) ( ON ?auto_385683 ?auto_385684 ) ( CLEAR ?auto_385681 ) ( ON ?auto_385682 ?auto_385683 ) ( CLEAR ?auto_385682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_385681 ?auto_385682 )
      ( MAKE-14PILE ?auto_385681 ?auto_385682 ?auto_385683 ?auto_385684 ?auto_385685 ?auto_385686 ?auto_385687 ?auto_385688 ?auto_385689 ?auto_385690 ?auto_385691 ?auto_385692 ?auto_385693 ?auto_385694 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385710 - BLOCK
      ?auto_385711 - BLOCK
      ?auto_385712 - BLOCK
      ?auto_385713 - BLOCK
      ?auto_385714 - BLOCK
      ?auto_385715 - BLOCK
      ?auto_385716 - BLOCK
      ?auto_385717 - BLOCK
      ?auto_385718 - BLOCK
      ?auto_385719 - BLOCK
      ?auto_385720 - BLOCK
      ?auto_385721 - BLOCK
      ?auto_385722 - BLOCK
      ?auto_385723 - BLOCK
    )
    :vars
    (
      ?auto_385724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385723 ?auto_385724 ) ( not ( = ?auto_385710 ?auto_385711 ) ) ( not ( = ?auto_385710 ?auto_385712 ) ) ( not ( = ?auto_385710 ?auto_385713 ) ) ( not ( = ?auto_385710 ?auto_385714 ) ) ( not ( = ?auto_385710 ?auto_385715 ) ) ( not ( = ?auto_385710 ?auto_385716 ) ) ( not ( = ?auto_385710 ?auto_385717 ) ) ( not ( = ?auto_385710 ?auto_385718 ) ) ( not ( = ?auto_385710 ?auto_385719 ) ) ( not ( = ?auto_385710 ?auto_385720 ) ) ( not ( = ?auto_385710 ?auto_385721 ) ) ( not ( = ?auto_385710 ?auto_385722 ) ) ( not ( = ?auto_385710 ?auto_385723 ) ) ( not ( = ?auto_385710 ?auto_385724 ) ) ( not ( = ?auto_385711 ?auto_385712 ) ) ( not ( = ?auto_385711 ?auto_385713 ) ) ( not ( = ?auto_385711 ?auto_385714 ) ) ( not ( = ?auto_385711 ?auto_385715 ) ) ( not ( = ?auto_385711 ?auto_385716 ) ) ( not ( = ?auto_385711 ?auto_385717 ) ) ( not ( = ?auto_385711 ?auto_385718 ) ) ( not ( = ?auto_385711 ?auto_385719 ) ) ( not ( = ?auto_385711 ?auto_385720 ) ) ( not ( = ?auto_385711 ?auto_385721 ) ) ( not ( = ?auto_385711 ?auto_385722 ) ) ( not ( = ?auto_385711 ?auto_385723 ) ) ( not ( = ?auto_385711 ?auto_385724 ) ) ( not ( = ?auto_385712 ?auto_385713 ) ) ( not ( = ?auto_385712 ?auto_385714 ) ) ( not ( = ?auto_385712 ?auto_385715 ) ) ( not ( = ?auto_385712 ?auto_385716 ) ) ( not ( = ?auto_385712 ?auto_385717 ) ) ( not ( = ?auto_385712 ?auto_385718 ) ) ( not ( = ?auto_385712 ?auto_385719 ) ) ( not ( = ?auto_385712 ?auto_385720 ) ) ( not ( = ?auto_385712 ?auto_385721 ) ) ( not ( = ?auto_385712 ?auto_385722 ) ) ( not ( = ?auto_385712 ?auto_385723 ) ) ( not ( = ?auto_385712 ?auto_385724 ) ) ( not ( = ?auto_385713 ?auto_385714 ) ) ( not ( = ?auto_385713 ?auto_385715 ) ) ( not ( = ?auto_385713 ?auto_385716 ) ) ( not ( = ?auto_385713 ?auto_385717 ) ) ( not ( = ?auto_385713 ?auto_385718 ) ) ( not ( = ?auto_385713 ?auto_385719 ) ) ( not ( = ?auto_385713 ?auto_385720 ) ) ( not ( = ?auto_385713 ?auto_385721 ) ) ( not ( = ?auto_385713 ?auto_385722 ) ) ( not ( = ?auto_385713 ?auto_385723 ) ) ( not ( = ?auto_385713 ?auto_385724 ) ) ( not ( = ?auto_385714 ?auto_385715 ) ) ( not ( = ?auto_385714 ?auto_385716 ) ) ( not ( = ?auto_385714 ?auto_385717 ) ) ( not ( = ?auto_385714 ?auto_385718 ) ) ( not ( = ?auto_385714 ?auto_385719 ) ) ( not ( = ?auto_385714 ?auto_385720 ) ) ( not ( = ?auto_385714 ?auto_385721 ) ) ( not ( = ?auto_385714 ?auto_385722 ) ) ( not ( = ?auto_385714 ?auto_385723 ) ) ( not ( = ?auto_385714 ?auto_385724 ) ) ( not ( = ?auto_385715 ?auto_385716 ) ) ( not ( = ?auto_385715 ?auto_385717 ) ) ( not ( = ?auto_385715 ?auto_385718 ) ) ( not ( = ?auto_385715 ?auto_385719 ) ) ( not ( = ?auto_385715 ?auto_385720 ) ) ( not ( = ?auto_385715 ?auto_385721 ) ) ( not ( = ?auto_385715 ?auto_385722 ) ) ( not ( = ?auto_385715 ?auto_385723 ) ) ( not ( = ?auto_385715 ?auto_385724 ) ) ( not ( = ?auto_385716 ?auto_385717 ) ) ( not ( = ?auto_385716 ?auto_385718 ) ) ( not ( = ?auto_385716 ?auto_385719 ) ) ( not ( = ?auto_385716 ?auto_385720 ) ) ( not ( = ?auto_385716 ?auto_385721 ) ) ( not ( = ?auto_385716 ?auto_385722 ) ) ( not ( = ?auto_385716 ?auto_385723 ) ) ( not ( = ?auto_385716 ?auto_385724 ) ) ( not ( = ?auto_385717 ?auto_385718 ) ) ( not ( = ?auto_385717 ?auto_385719 ) ) ( not ( = ?auto_385717 ?auto_385720 ) ) ( not ( = ?auto_385717 ?auto_385721 ) ) ( not ( = ?auto_385717 ?auto_385722 ) ) ( not ( = ?auto_385717 ?auto_385723 ) ) ( not ( = ?auto_385717 ?auto_385724 ) ) ( not ( = ?auto_385718 ?auto_385719 ) ) ( not ( = ?auto_385718 ?auto_385720 ) ) ( not ( = ?auto_385718 ?auto_385721 ) ) ( not ( = ?auto_385718 ?auto_385722 ) ) ( not ( = ?auto_385718 ?auto_385723 ) ) ( not ( = ?auto_385718 ?auto_385724 ) ) ( not ( = ?auto_385719 ?auto_385720 ) ) ( not ( = ?auto_385719 ?auto_385721 ) ) ( not ( = ?auto_385719 ?auto_385722 ) ) ( not ( = ?auto_385719 ?auto_385723 ) ) ( not ( = ?auto_385719 ?auto_385724 ) ) ( not ( = ?auto_385720 ?auto_385721 ) ) ( not ( = ?auto_385720 ?auto_385722 ) ) ( not ( = ?auto_385720 ?auto_385723 ) ) ( not ( = ?auto_385720 ?auto_385724 ) ) ( not ( = ?auto_385721 ?auto_385722 ) ) ( not ( = ?auto_385721 ?auto_385723 ) ) ( not ( = ?auto_385721 ?auto_385724 ) ) ( not ( = ?auto_385722 ?auto_385723 ) ) ( not ( = ?auto_385722 ?auto_385724 ) ) ( not ( = ?auto_385723 ?auto_385724 ) ) ( ON ?auto_385722 ?auto_385723 ) ( ON ?auto_385721 ?auto_385722 ) ( ON ?auto_385720 ?auto_385721 ) ( ON ?auto_385719 ?auto_385720 ) ( ON ?auto_385718 ?auto_385719 ) ( ON ?auto_385717 ?auto_385718 ) ( ON ?auto_385716 ?auto_385717 ) ( ON ?auto_385715 ?auto_385716 ) ( ON ?auto_385714 ?auto_385715 ) ( ON ?auto_385713 ?auto_385714 ) ( ON ?auto_385712 ?auto_385713 ) ( ON ?auto_385711 ?auto_385712 ) ( ON ?auto_385710 ?auto_385711 ) ( CLEAR ?auto_385710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_385710 )
      ( MAKE-14PILE ?auto_385710 ?auto_385711 ?auto_385712 ?auto_385713 ?auto_385714 ?auto_385715 ?auto_385716 ?auto_385717 ?auto_385718 ?auto_385719 ?auto_385720 ?auto_385721 ?auto_385722 ?auto_385723 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_385739 - BLOCK
      ?auto_385740 - BLOCK
      ?auto_385741 - BLOCK
      ?auto_385742 - BLOCK
      ?auto_385743 - BLOCK
      ?auto_385744 - BLOCK
      ?auto_385745 - BLOCK
      ?auto_385746 - BLOCK
      ?auto_385747 - BLOCK
      ?auto_385748 - BLOCK
      ?auto_385749 - BLOCK
      ?auto_385750 - BLOCK
      ?auto_385751 - BLOCK
      ?auto_385752 - BLOCK
    )
    :vars
    (
      ?auto_385753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385752 ?auto_385753 ) ( not ( = ?auto_385739 ?auto_385740 ) ) ( not ( = ?auto_385739 ?auto_385741 ) ) ( not ( = ?auto_385739 ?auto_385742 ) ) ( not ( = ?auto_385739 ?auto_385743 ) ) ( not ( = ?auto_385739 ?auto_385744 ) ) ( not ( = ?auto_385739 ?auto_385745 ) ) ( not ( = ?auto_385739 ?auto_385746 ) ) ( not ( = ?auto_385739 ?auto_385747 ) ) ( not ( = ?auto_385739 ?auto_385748 ) ) ( not ( = ?auto_385739 ?auto_385749 ) ) ( not ( = ?auto_385739 ?auto_385750 ) ) ( not ( = ?auto_385739 ?auto_385751 ) ) ( not ( = ?auto_385739 ?auto_385752 ) ) ( not ( = ?auto_385739 ?auto_385753 ) ) ( not ( = ?auto_385740 ?auto_385741 ) ) ( not ( = ?auto_385740 ?auto_385742 ) ) ( not ( = ?auto_385740 ?auto_385743 ) ) ( not ( = ?auto_385740 ?auto_385744 ) ) ( not ( = ?auto_385740 ?auto_385745 ) ) ( not ( = ?auto_385740 ?auto_385746 ) ) ( not ( = ?auto_385740 ?auto_385747 ) ) ( not ( = ?auto_385740 ?auto_385748 ) ) ( not ( = ?auto_385740 ?auto_385749 ) ) ( not ( = ?auto_385740 ?auto_385750 ) ) ( not ( = ?auto_385740 ?auto_385751 ) ) ( not ( = ?auto_385740 ?auto_385752 ) ) ( not ( = ?auto_385740 ?auto_385753 ) ) ( not ( = ?auto_385741 ?auto_385742 ) ) ( not ( = ?auto_385741 ?auto_385743 ) ) ( not ( = ?auto_385741 ?auto_385744 ) ) ( not ( = ?auto_385741 ?auto_385745 ) ) ( not ( = ?auto_385741 ?auto_385746 ) ) ( not ( = ?auto_385741 ?auto_385747 ) ) ( not ( = ?auto_385741 ?auto_385748 ) ) ( not ( = ?auto_385741 ?auto_385749 ) ) ( not ( = ?auto_385741 ?auto_385750 ) ) ( not ( = ?auto_385741 ?auto_385751 ) ) ( not ( = ?auto_385741 ?auto_385752 ) ) ( not ( = ?auto_385741 ?auto_385753 ) ) ( not ( = ?auto_385742 ?auto_385743 ) ) ( not ( = ?auto_385742 ?auto_385744 ) ) ( not ( = ?auto_385742 ?auto_385745 ) ) ( not ( = ?auto_385742 ?auto_385746 ) ) ( not ( = ?auto_385742 ?auto_385747 ) ) ( not ( = ?auto_385742 ?auto_385748 ) ) ( not ( = ?auto_385742 ?auto_385749 ) ) ( not ( = ?auto_385742 ?auto_385750 ) ) ( not ( = ?auto_385742 ?auto_385751 ) ) ( not ( = ?auto_385742 ?auto_385752 ) ) ( not ( = ?auto_385742 ?auto_385753 ) ) ( not ( = ?auto_385743 ?auto_385744 ) ) ( not ( = ?auto_385743 ?auto_385745 ) ) ( not ( = ?auto_385743 ?auto_385746 ) ) ( not ( = ?auto_385743 ?auto_385747 ) ) ( not ( = ?auto_385743 ?auto_385748 ) ) ( not ( = ?auto_385743 ?auto_385749 ) ) ( not ( = ?auto_385743 ?auto_385750 ) ) ( not ( = ?auto_385743 ?auto_385751 ) ) ( not ( = ?auto_385743 ?auto_385752 ) ) ( not ( = ?auto_385743 ?auto_385753 ) ) ( not ( = ?auto_385744 ?auto_385745 ) ) ( not ( = ?auto_385744 ?auto_385746 ) ) ( not ( = ?auto_385744 ?auto_385747 ) ) ( not ( = ?auto_385744 ?auto_385748 ) ) ( not ( = ?auto_385744 ?auto_385749 ) ) ( not ( = ?auto_385744 ?auto_385750 ) ) ( not ( = ?auto_385744 ?auto_385751 ) ) ( not ( = ?auto_385744 ?auto_385752 ) ) ( not ( = ?auto_385744 ?auto_385753 ) ) ( not ( = ?auto_385745 ?auto_385746 ) ) ( not ( = ?auto_385745 ?auto_385747 ) ) ( not ( = ?auto_385745 ?auto_385748 ) ) ( not ( = ?auto_385745 ?auto_385749 ) ) ( not ( = ?auto_385745 ?auto_385750 ) ) ( not ( = ?auto_385745 ?auto_385751 ) ) ( not ( = ?auto_385745 ?auto_385752 ) ) ( not ( = ?auto_385745 ?auto_385753 ) ) ( not ( = ?auto_385746 ?auto_385747 ) ) ( not ( = ?auto_385746 ?auto_385748 ) ) ( not ( = ?auto_385746 ?auto_385749 ) ) ( not ( = ?auto_385746 ?auto_385750 ) ) ( not ( = ?auto_385746 ?auto_385751 ) ) ( not ( = ?auto_385746 ?auto_385752 ) ) ( not ( = ?auto_385746 ?auto_385753 ) ) ( not ( = ?auto_385747 ?auto_385748 ) ) ( not ( = ?auto_385747 ?auto_385749 ) ) ( not ( = ?auto_385747 ?auto_385750 ) ) ( not ( = ?auto_385747 ?auto_385751 ) ) ( not ( = ?auto_385747 ?auto_385752 ) ) ( not ( = ?auto_385747 ?auto_385753 ) ) ( not ( = ?auto_385748 ?auto_385749 ) ) ( not ( = ?auto_385748 ?auto_385750 ) ) ( not ( = ?auto_385748 ?auto_385751 ) ) ( not ( = ?auto_385748 ?auto_385752 ) ) ( not ( = ?auto_385748 ?auto_385753 ) ) ( not ( = ?auto_385749 ?auto_385750 ) ) ( not ( = ?auto_385749 ?auto_385751 ) ) ( not ( = ?auto_385749 ?auto_385752 ) ) ( not ( = ?auto_385749 ?auto_385753 ) ) ( not ( = ?auto_385750 ?auto_385751 ) ) ( not ( = ?auto_385750 ?auto_385752 ) ) ( not ( = ?auto_385750 ?auto_385753 ) ) ( not ( = ?auto_385751 ?auto_385752 ) ) ( not ( = ?auto_385751 ?auto_385753 ) ) ( not ( = ?auto_385752 ?auto_385753 ) ) ( ON ?auto_385751 ?auto_385752 ) ( ON ?auto_385750 ?auto_385751 ) ( ON ?auto_385749 ?auto_385750 ) ( ON ?auto_385748 ?auto_385749 ) ( ON ?auto_385747 ?auto_385748 ) ( ON ?auto_385746 ?auto_385747 ) ( ON ?auto_385745 ?auto_385746 ) ( ON ?auto_385744 ?auto_385745 ) ( ON ?auto_385743 ?auto_385744 ) ( ON ?auto_385742 ?auto_385743 ) ( ON ?auto_385741 ?auto_385742 ) ( ON ?auto_385740 ?auto_385741 ) ( ON ?auto_385739 ?auto_385740 ) ( CLEAR ?auto_385739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_385739 )
      ( MAKE-14PILE ?auto_385739 ?auto_385740 ?auto_385741 ?auto_385742 ?auto_385743 ?auto_385744 ?auto_385745 ?auto_385746 ?auto_385747 ?auto_385748 ?auto_385749 ?auto_385750 ?auto_385751 ?auto_385752 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385769 - BLOCK
      ?auto_385770 - BLOCK
      ?auto_385771 - BLOCK
      ?auto_385772 - BLOCK
      ?auto_385773 - BLOCK
      ?auto_385774 - BLOCK
      ?auto_385775 - BLOCK
      ?auto_385776 - BLOCK
      ?auto_385777 - BLOCK
      ?auto_385778 - BLOCK
      ?auto_385779 - BLOCK
      ?auto_385780 - BLOCK
      ?auto_385781 - BLOCK
      ?auto_385782 - BLOCK
      ?auto_385783 - BLOCK
    )
    :vars
    (
      ?auto_385784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_385782 ) ( ON ?auto_385783 ?auto_385784 ) ( CLEAR ?auto_385783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_385769 ) ( ON ?auto_385770 ?auto_385769 ) ( ON ?auto_385771 ?auto_385770 ) ( ON ?auto_385772 ?auto_385771 ) ( ON ?auto_385773 ?auto_385772 ) ( ON ?auto_385774 ?auto_385773 ) ( ON ?auto_385775 ?auto_385774 ) ( ON ?auto_385776 ?auto_385775 ) ( ON ?auto_385777 ?auto_385776 ) ( ON ?auto_385778 ?auto_385777 ) ( ON ?auto_385779 ?auto_385778 ) ( ON ?auto_385780 ?auto_385779 ) ( ON ?auto_385781 ?auto_385780 ) ( ON ?auto_385782 ?auto_385781 ) ( not ( = ?auto_385769 ?auto_385770 ) ) ( not ( = ?auto_385769 ?auto_385771 ) ) ( not ( = ?auto_385769 ?auto_385772 ) ) ( not ( = ?auto_385769 ?auto_385773 ) ) ( not ( = ?auto_385769 ?auto_385774 ) ) ( not ( = ?auto_385769 ?auto_385775 ) ) ( not ( = ?auto_385769 ?auto_385776 ) ) ( not ( = ?auto_385769 ?auto_385777 ) ) ( not ( = ?auto_385769 ?auto_385778 ) ) ( not ( = ?auto_385769 ?auto_385779 ) ) ( not ( = ?auto_385769 ?auto_385780 ) ) ( not ( = ?auto_385769 ?auto_385781 ) ) ( not ( = ?auto_385769 ?auto_385782 ) ) ( not ( = ?auto_385769 ?auto_385783 ) ) ( not ( = ?auto_385769 ?auto_385784 ) ) ( not ( = ?auto_385770 ?auto_385771 ) ) ( not ( = ?auto_385770 ?auto_385772 ) ) ( not ( = ?auto_385770 ?auto_385773 ) ) ( not ( = ?auto_385770 ?auto_385774 ) ) ( not ( = ?auto_385770 ?auto_385775 ) ) ( not ( = ?auto_385770 ?auto_385776 ) ) ( not ( = ?auto_385770 ?auto_385777 ) ) ( not ( = ?auto_385770 ?auto_385778 ) ) ( not ( = ?auto_385770 ?auto_385779 ) ) ( not ( = ?auto_385770 ?auto_385780 ) ) ( not ( = ?auto_385770 ?auto_385781 ) ) ( not ( = ?auto_385770 ?auto_385782 ) ) ( not ( = ?auto_385770 ?auto_385783 ) ) ( not ( = ?auto_385770 ?auto_385784 ) ) ( not ( = ?auto_385771 ?auto_385772 ) ) ( not ( = ?auto_385771 ?auto_385773 ) ) ( not ( = ?auto_385771 ?auto_385774 ) ) ( not ( = ?auto_385771 ?auto_385775 ) ) ( not ( = ?auto_385771 ?auto_385776 ) ) ( not ( = ?auto_385771 ?auto_385777 ) ) ( not ( = ?auto_385771 ?auto_385778 ) ) ( not ( = ?auto_385771 ?auto_385779 ) ) ( not ( = ?auto_385771 ?auto_385780 ) ) ( not ( = ?auto_385771 ?auto_385781 ) ) ( not ( = ?auto_385771 ?auto_385782 ) ) ( not ( = ?auto_385771 ?auto_385783 ) ) ( not ( = ?auto_385771 ?auto_385784 ) ) ( not ( = ?auto_385772 ?auto_385773 ) ) ( not ( = ?auto_385772 ?auto_385774 ) ) ( not ( = ?auto_385772 ?auto_385775 ) ) ( not ( = ?auto_385772 ?auto_385776 ) ) ( not ( = ?auto_385772 ?auto_385777 ) ) ( not ( = ?auto_385772 ?auto_385778 ) ) ( not ( = ?auto_385772 ?auto_385779 ) ) ( not ( = ?auto_385772 ?auto_385780 ) ) ( not ( = ?auto_385772 ?auto_385781 ) ) ( not ( = ?auto_385772 ?auto_385782 ) ) ( not ( = ?auto_385772 ?auto_385783 ) ) ( not ( = ?auto_385772 ?auto_385784 ) ) ( not ( = ?auto_385773 ?auto_385774 ) ) ( not ( = ?auto_385773 ?auto_385775 ) ) ( not ( = ?auto_385773 ?auto_385776 ) ) ( not ( = ?auto_385773 ?auto_385777 ) ) ( not ( = ?auto_385773 ?auto_385778 ) ) ( not ( = ?auto_385773 ?auto_385779 ) ) ( not ( = ?auto_385773 ?auto_385780 ) ) ( not ( = ?auto_385773 ?auto_385781 ) ) ( not ( = ?auto_385773 ?auto_385782 ) ) ( not ( = ?auto_385773 ?auto_385783 ) ) ( not ( = ?auto_385773 ?auto_385784 ) ) ( not ( = ?auto_385774 ?auto_385775 ) ) ( not ( = ?auto_385774 ?auto_385776 ) ) ( not ( = ?auto_385774 ?auto_385777 ) ) ( not ( = ?auto_385774 ?auto_385778 ) ) ( not ( = ?auto_385774 ?auto_385779 ) ) ( not ( = ?auto_385774 ?auto_385780 ) ) ( not ( = ?auto_385774 ?auto_385781 ) ) ( not ( = ?auto_385774 ?auto_385782 ) ) ( not ( = ?auto_385774 ?auto_385783 ) ) ( not ( = ?auto_385774 ?auto_385784 ) ) ( not ( = ?auto_385775 ?auto_385776 ) ) ( not ( = ?auto_385775 ?auto_385777 ) ) ( not ( = ?auto_385775 ?auto_385778 ) ) ( not ( = ?auto_385775 ?auto_385779 ) ) ( not ( = ?auto_385775 ?auto_385780 ) ) ( not ( = ?auto_385775 ?auto_385781 ) ) ( not ( = ?auto_385775 ?auto_385782 ) ) ( not ( = ?auto_385775 ?auto_385783 ) ) ( not ( = ?auto_385775 ?auto_385784 ) ) ( not ( = ?auto_385776 ?auto_385777 ) ) ( not ( = ?auto_385776 ?auto_385778 ) ) ( not ( = ?auto_385776 ?auto_385779 ) ) ( not ( = ?auto_385776 ?auto_385780 ) ) ( not ( = ?auto_385776 ?auto_385781 ) ) ( not ( = ?auto_385776 ?auto_385782 ) ) ( not ( = ?auto_385776 ?auto_385783 ) ) ( not ( = ?auto_385776 ?auto_385784 ) ) ( not ( = ?auto_385777 ?auto_385778 ) ) ( not ( = ?auto_385777 ?auto_385779 ) ) ( not ( = ?auto_385777 ?auto_385780 ) ) ( not ( = ?auto_385777 ?auto_385781 ) ) ( not ( = ?auto_385777 ?auto_385782 ) ) ( not ( = ?auto_385777 ?auto_385783 ) ) ( not ( = ?auto_385777 ?auto_385784 ) ) ( not ( = ?auto_385778 ?auto_385779 ) ) ( not ( = ?auto_385778 ?auto_385780 ) ) ( not ( = ?auto_385778 ?auto_385781 ) ) ( not ( = ?auto_385778 ?auto_385782 ) ) ( not ( = ?auto_385778 ?auto_385783 ) ) ( not ( = ?auto_385778 ?auto_385784 ) ) ( not ( = ?auto_385779 ?auto_385780 ) ) ( not ( = ?auto_385779 ?auto_385781 ) ) ( not ( = ?auto_385779 ?auto_385782 ) ) ( not ( = ?auto_385779 ?auto_385783 ) ) ( not ( = ?auto_385779 ?auto_385784 ) ) ( not ( = ?auto_385780 ?auto_385781 ) ) ( not ( = ?auto_385780 ?auto_385782 ) ) ( not ( = ?auto_385780 ?auto_385783 ) ) ( not ( = ?auto_385780 ?auto_385784 ) ) ( not ( = ?auto_385781 ?auto_385782 ) ) ( not ( = ?auto_385781 ?auto_385783 ) ) ( not ( = ?auto_385781 ?auto_385784 ) ) ( not ( = ?auto_385782 ?auto_385783 ) ) ( not ( = ?auto_385782 ?auto_385784 ) ) ( not ( = ?auto_385783 ?auto_385784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_385783 ?auto_385784 )
      ( !STACK ?auto_385783 ?auto_385782 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385800 - BLOCK
      ?auto_385801 - BLOCK
      ?auto_385802 - BLOCK
      ?auto_385803 - BLOCK
      ?auto_385804 - BLOCK
      ?auto_385805 - BLOCK
      ?auto_385806 - BLOCK
      ?auto_385807 - BLOCK
      ?auto_385808 - BLOCK
      ?auto_385809 - BLOCK
      ?auto_385810 - BLOCK
      ?auto_385811 - BLOCK
      ?auto_385812 - BLOCK
      ?auto_385813 - BLOCK
      ?auto_385814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_385813 ) ( ON-TABLE ?auto_385814 ) ( CLEAR ?auto_385814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_385800 ) ( ON ?auto_385801 ?auto_385800 ) ( ON ?auto_385802 ?auto_385801 ) ( ON ?auto_385803 ?auto_385802 ) ( ON ?auto_385804 ?auto_385803 ) ( ON ?auto_385805 ?auto_385804 ) ( ON ?auto_385806 ?auto_385805 ) ( ON ?auto_385807 ?auto_385806 ) ( ON ?auto_385808 ?auto_385807 ) ( ON ?auto_385809 ?auto_385808 ) ( ON ?auto_385810 ?auto_385809 ) ( ON ?auto_385811 ?auto_385810 ) ( ON ?auto_385812 ?auto_385811 ) ( ON ?auto_385813 ?auto_385812 ) ( not ( = ?auto_385800 ?auto_385801 ) ) ( not ( = ?auto_385800 ?auto_385802 ) ) ( not ( = ?auto_385800 ?auto_385803 ) ) ( not ( = ?auto_385800 ?auto_385804 ) ) ( not ( = ?auto_385800 ?auto_385805 ) ) ( not ( = ?auto_385800 ?auto_385806 ) ) ( not ( = ?auto_385800 ?auto_385807 ) ) ( not ( = ?auto_385800 ?auto_385808 ) ) ( not ( = ?auto_385800 ?auto_385809 ) ) ( not ( = ?auto_385800 ?auto_385810 ) ) ( not ( = ?auto_385800 ?auto_385811 ) ) ( not ( = ?auto_385800 ?auto_385812 ) ) ( not ( = ?auto_385800 ?auto_385813 ) ) ( not ( = ?auto_385800 ?auto_385814 ) ) ( not ( = ?auto_385801 ?auto_385802 ) ) ( not ( = ?auto_385801 ?auto_385803 ) ) ( not ( = ?auto_385801 ?auto_385804 ) ) ( not ( = ?auto_385801 ?auto_385805 ) ) ( not ( = ?auto_385801 ?auto_385806 ) ) ( not ( = ?auto_385801 ?auto_385807 ) ) ( not ( = ?auto_385801 ?auto_385808 ) ) ( not ( = ?auto_385801 ?auto_385809 ) ) ( not ( = ?auto_385801 ?auto_385810 ) ) ( not ( = ?auto_385801 ?auto_385811 ) ) ( not ( = ?auto_385801 ?auto_385812 ) ) ( not ( = ?auto_385801 ?auto_385813 ) ) ( not ( = ?auto_385801 ?auto_385814 ) ) ( not ( = ?auto_385802 ?auto_385803 ) ) ( not ( = ?auto_385802 ?auto_385804 ) ) ( not ( = ?auto_385802 ?auto_385805 ) ) ( not ( = ?auto_385802 ?auto_385806 ) ) ( not ( = ?auto_385802 ?auto_385807 ) ) ( not ( = ?auto_385802 ?auto_385808 ) ) ( not ( = ?auto_385802 ?auto_385809 ) ) ( not ( = ?auto_385802 ?auto_385810 ) ) ( not ( = ?auto_385802 ?auto_385811 ) ) ( not ( = ?auto_385802 ?auto_385812 ) ) ( not ( = ?auto_385802 ?auto_385813 ) ) ( not ( = ?auto_385802 ?auto_385814 ) ) ( not ( = ?auto_385803 ?auto_385804 ) ) ( not ( = ?auto_385803 ?auto_385805 ) ) ( not ( = ?auto_385803 ?auto_385806 ) ) ( not ( = ?auto_385803 ?auto_385807 ) ) ( not ( = ?auto_385803 ?auto_385808 ) ) ( not ( = ?auto_385803 ?auto_385809 ) ) ( not ( = ?auto_385803 ?auto_385810 ) ) ( not ( = ?auto_385803 ?auto_385811 ) ) ( not ( = ?auto_385803 ?auto_385812 ) ) ( not ( = ?auto_385803 ?auto_385813 ) ) ( not ( = ?auto_385803 ?auto_385814 ) ) ( not ( = ?auto_385804 ?auto_385805 ) ) ( not ( = ?auto_385804 ?auto_385806 ) ) ( not ( = ?auto_385804 ?auto_385807 ) ) ( not ( = ?auto_385804 ?auto_385808 ) ) ( not ( = ?auto_385804 ?auto_385809 ) ) ( not ( = ?auto_385804 ?auto_385810 ) ) ( not ( = ?auto_385804 ?auto_385811 ) ) ( not ( = ?auto_385804 ?auto_385812 ) ) ( not ( = ?auto_385804 ?auto_385813 ) ) ( not ( = ?auto_385804 ?auto_385814 ) ) ( not ( = ?auto_385805 ?auto_385806 ) ) ( not ( = ?auto_385805 ?auto_385807 ) ) ( not ( = ?auto_385805 ?auto_385808 ) ) ( not ( = ?auto_385805 ?auto_385809 ) ) ( not ( = ?auto_385805 ?auto_385810 ) ) ( not ( = ?auto_385805 ?auto_385811 ) ) ( not ( = ?auto_385805 ?auto_385812 ) ) ( not ( = ?auto_385805 ?auto_385813 ) ) ( not ( = ?auto_385805 ?auto_385814 ) ) ( not ( = ?auto_385806 ?auto_385807 ) ) ( not ( = ?auto_385806 ?auto_385808 ) ) ( not ( = ?auto_385806 ?auto_385809 ) ) ( not ( = ?auto_385806 ?auto_385810 ) ) ( not ( = ?auto_385806 ?auto_385811 ) ) ( not ( = ?auto_385806 ?auto_385812 ) ) ( not ( = ?auto_385806 ?auto_385813 ) ) ( not ( = ?auto_385806 ?auto_385814 ) ) ( not ( = ?auto_385807 ?auto_385808 ) ) ( not ( = ?auto_385807 ?auto_385809 ) ) ( not ( = ?auto_385807 ?auto_385810 ) ) ( not ( = ?auto_385807 ?auto_385811 ) ) ( not ( = ?auto_385807 ?auto_385812 ) ) ( not ( = ?auto_385807 ?auto_385813 ) ) ( not ( = ?auto_385807 ?auto_385814 ) ) ( not ( = ?auto_385808 ?auto_385809 ) ) ( not ( = ?auto_385808 ?auto_385810 ) ) ( not ( = ?auto_385808 ?auto_385811 ) ) ( not ( = ?auto_385808 ?auto_385812 ) ) ( not ( = ?auto_385808 ?auto_385813 ) ) ( not ( = ?auto_385808 ?auto_385814 ) ) ( not ( = ?auto_385809 ?auto_385810 ) ) ( not ( = ?auto_385809 ?auto_385811 ) ) ( not ( = ?auto_385809 ?auto_385812 ) ) ( not ( = ?auto_385809 ?auto_385813 ) ) ( not ( = ?auto_385809 ?auto_385814 ) ) ( not ( = ?auto_385810 ?auto_385811 ) ) ( not ( = ?auto_385810 ?auto_385812 ) ) ( not ( = ?auto_385810 ?auto_385813 ) ) ( not ( = ?auto_385810 ?auto_385814 ) ) ( not ( = ?auto_385811 ?auto_385812 ) ) ( not ( = ?auto_385811 ?auto_385813 ) ) ( not ( = ?auto_385811 ?auto_385814 ) ) ( not ( = ?auto_385812 ?auto_385813 ) ) ( not ( = ?auto_385812 ?auto_385814 ) ) ( not ( = ?auto_385813 ?auto_385814 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_385814 )
      ( !STACK ?auto_385814 ?auto_385813 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385830 - BLOCK
      ?auto_385831 - BLOCK
      ?auto_385832 - BLOCK
      ?auto_385833 - BLOCK
      ?auto_385834 - BLOCK
      ?auto_385835 - BLOCK
      ?auto_385836 - BLOCK
      ?auto_385837 - BLOCK
      ?auto_385838 - BLOCK
      ?auto_385839 - BLOCK
      ?auto_385840 - BLOCK
      ?auto_385841 - BLOCK
      ?auto_385842 - BLOCK
      ?auto_385843 - BLOCK
      ?auto_385844 - BLOCK
    )
    :vars
    (
      ?auto_385845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385844 ?auto_385845 ) ( ON-TABLE ?auto_385830 ) ( ON ?auto_385831 ?auto_385830 ) ( ON ?auto_385832 ?auto_385831 ) ( ON ?auto_385833 ?auto_385832 ) ( ON ?auto_385834 ?auto_385833 ) ( ON ?auto_385835 ?auto_385834 ) ( ON ?auto_385836 ?auto_385835 ) ( ON ?auto_385837 ?auto_385836 ) ( ON ?auto_385838 ?auto_385837 ) ( ON ?auto_385839 ?auto_385838 ) ( ON ?auto_385840 ?auto_385839 ) ( ON ?auto_385841 ?auto_385840 ) ( ON ?auto_385842 ?auto_385841 ) ( not ( = ?auto_385830 ?auto_385831 ) ) ( not ( = ?auto_385830 ?auto_385832 ) ) ( not ( = ?auto_385830 ?auto_385833 ) ) ( not ( = ?auto_385830 ?auto_385834 ) ) ( not ( = ?auto_385830 ?auto_385835 ) ) ( not ( = ?auto_385830 ?auto_385836 ) ) ( not ( = ?auto_385830 ?auto_385837 ) ) ( not ( = ?auto_385830 ?auto_385838 ) ) ( not ( = ?auto_385830 ?auto_385839 ) ) ( not ( = ?auto_385830 ?auto_385840 ) ) ( not ( = ?auto_385830 ?auto_385841 ) ) ( not ( = ?auto_385830 ?auto_385842 ) ) ( not ( = ?auto_385830 ?auto_385843 ) ) ( not ( = ?auto_385830 ?auto_385844 ) ) ( not ( = ?auto_385830 ?auto_385845 ) ) ( not ( = ?auto_385831 ?auto_385832 ) ) ( not ( = ?auto_385831 ?auto_385833 ) ) ( not ( = ?auto_385831 ?auto_385834 ) ) ( not ( = ?auto_385831 ?auto_385835 ) ) ( not ( = ?auto_385831 ?auto_385836 ) ) ( not ( = ?auto_385831 ?auto_385837 ) ) ( not ( = ?auto_385831 ?auto_385838 ) ) ( not ( = ?auto_385831 ?auto_385839 ) ) ( not ( = ?auto_385831 ?auto_385840 ) ) ( not ( = ?auto_385831 ?auto_385841 ) ) ( not ( = ?auto_385831 ?auto_385842 ) ) ( not ( = ?auto_385831 ?auto_385843 ) ) ( not ( = ?auto_385831 ?auto_385844 ) ) ( not ( = ?auto_385831 ?auto_385845 ) ) ( not ( = ?auto_385832 ?auto_385833 ) ) ( not ( = ?auto_385832 ?auto_385834 ) ) ( not ( = ?auto_385832 ?auto_385835 ) ) ( not ( = ?auto_385832 ?auto_385836 ) ) ( not ( = ?auto_385832 ?auto_385837 ) ) ( not ( = ?auto_385832 ?auto_385838 ) ) ( not ( = ?auto_385832 ?auto_385839 ) ) ( not ( = ?auto_385832 ?auto_385840 ) ) ( not ( = ?auto_385832 ?auto_385841 ) ) ( not ( = ?auto_385832 ?auto_385842 ) ) ( not ( = ?auto_385832 ?auto_385843 ) ) ( not ( = ?auto_385832 ?auto_385844 ) ) ( not ( = ?auto_385832 ?auto_385845 ) ) ( not ( = ?auto_385833 ?auto_385834 ) ) ( not ( = ?auto_385833 ?auto_385835 ) ) ( not ( = ?auto_385833 ?auto_385836 ) ) ( not ( = ?auto_385833 ?auto_385837 ) ) ( not ( = ?auto_385833 ?auto_385838 ) ) ( not ( = ?auto_385833 ?auto_385839 ) ) ( not ( = ?auto_385833 ?auto_385840 ) ) ( not ( = ?auto_385833 ?auto_385841 ) ) ( not ( = ?auto_385833 ?auto_385842 ) ) ( not ( = ?auto_385833 ?auto_385843 ) ) ( not ( = ?auto_385833 ?auto_385844 ) ) ( not ( = ?auto_385833 ?auto_385845 ) ) ( not ( = ?auto_385834 ?auto_385835 ) ) ( not ( = ?auto_385834 ?auto_385836 ) ) ( not ( = ?auto_385834 ?auto_385837 ) ) ( not ( = ?auto_385834 ?auto_385838 ) ) ( not ( = ?auto_385834 ?auto_385839 ) ) ( not ( = ?auto_385834 ?auto_385840 ) ) ( not ( = ?auto_385834 ?auto_385841 ) ) ( not ( = ?auto_385834 ?auto_385842 ) ) ( not ( = ?auto_385834 ?auto_385843 ) ) ( not ( = ?auto_385834 ?auto_385844 ) ) ( not ( = ?auto_385834 ?auto_385845 ) ) ( not ( = ?auto_385835 ?auto_385836 ) ) ( not ( = ?auto_385835 ?auto_385837 ) ) ( not ( = ?auto_385835 ?auto_385838 ) ) ( not ( = ?auto_385835 ?auto_385839 ) ) ( not ( = ?auto_385835 ?auto_385840 ) ) ( not ( = ?auto_385835 ?auto_385841 ) ) ( not ( = ?auto_385835 ?auto_385842 ) ) ( not ( = ?auto_385835 ?auto_385843 ) ) ( not ( = ?auto_385835 ?auto_385844 ) ) ( not ( = ?auto_385835 ?auto_385845 ) ) ( not ( = ?auto_385836 ?auto_385837 ) ) ( not ( = ?auto_385836 ?auto_385838 ) ) ( not ( = ?auto_385836 ?auto_385839 ) ) ( not ( = ?auto_385836 ?auto_385840 ) ) ( not ( = ?auto_385836 ?auto_385841 ) ) ( not ( = ?auto_385836 ?auto_385842 ) ) ( not ( = ?auto_385836 ?auto_385843 ) ) ( not ( = ?auto_385836 ?auto_385844 ) ) ( not ( = ?auto_385836 ?auto_385845 ) ) ( not ( = ?auto_385837 ?auto_385838 ) ) ( not ( = ?auto_385837 ?auto_385839 ) ) ( not ( = ?auto_385837 ?auto_385840 ) ) ( not ( = ?auto_385837 ?auto_385841 ) ) ( not ( = ?auto_385837 ?auto_385842 ) ) ( not ( = ?auto_385837 ?auto_385843 ) ) ( not ( = ?auto_385837 ?auto_385844 ) ) ( not ( = ?auto_385837 ?auto_385845 ) ) ( not ( = ?auto_385838 ?auto_385839 ) ) ( not ( = ?auto_385838 ?auto_385840 ) ) ( not ( = ?auto_385838 ?auto_385841 ) ) ( not ( = ?auto_385838 ?auto_385842 ) ) ( not ( = ?auto_385838 ?auto_385843 ) ) ( not ( = ?auto_385838 ?auto_385844 ) ) ( not ( = ?auto_385838 ?auto_385845 ) ) ( not ( = ?auto_385839 ?auto_385840 ) ) ( not ( = ?auto_385839 ?auto_385841 ) ) ( not ( = ?auto_385839 ?auto_385842 ) ) ( not ( = ?auto_385839 ?auto_385843 ) ) ( not ( = ?auto_385839 ?auto_385844 ) ) ( not ( = ?auto_385839 ?auto_385845 ) ) ( not ( = ?auto_385840 ?auto_385841 ) ) ( not ( = ?auto_385840 ?auto_385842 ) ) ( not ( = ?auto_385840 ?auto_385843 ) ) ( not ( = ?auto_385840 ?auto_385844 ) ) ( not ( = ?auto_385840 ?auto_385845 ) ) ( not ( = ?auto_385841 ?auto_385842 ) ) ( not ( = ?auto_385841 ?auto_385843 ) ) ( not ( = ?auto_385841 ?auto_385844 ) ) ( not ( = ?auto_385841 ?auto_385845 ) ) ( not ( = ?auto_385842 ?auto_385843 ) ) ( not ( = ?auto_385842 ?auto_385844 ) ) ( not ( = ?auto_385842 ?auto_385845 ) ) ( not ( = ?auto_385843 ?auto_385844 ) ) ( not ( = ?auto_385843 ?auto_385845 ) ) ( not ( = ?auto_385844 ?auto_385845 ) ) ( CLEAR ?auto_385842 ) ( ON ?auto_385843 ?auto_385844 ) ( CLEAR ?auto_385843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_385830 ?auto_385831 ?auto_385832 ?auto_385833 ?auto_385834 ?auto_385835 ?auto_385836 ?auto_385837 ?auto_385838 ?auto_385839 ?auto_385840 ?auto_385841 ?auto_385842 ?auto_385843 )
      ( MAKE-15PILE ?auto_385830 ?auto_385831 ?auto_385832 ?auto_385833 ?auto_385834 ?auto_385835 ?auto_385836 ?auto_385837 ?auto_385838 ?auto_385839 ?auto_385840 ?auto_385841 ?auto_385842 ?auto_385843 ?auto_385844 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385861 - BLOCK
      ?auto_385862 - BLOCK
      ?auto_385863 - BLOCK
      ?auto_385864 - BLOCK
      ?auto_385865 - BLOCK
      ?auto_385866 - BLOCK
      ?auto_385867 - BLOCK
      ?auto_385868 - BLOCK
      ?auto_385869 - BLOCK
      ?auto_385870 - BLOCK
      ?auto_385871 - BLOCK
      ?auto_385872 - BLOCK
      ?auto_385873 - BLOCK
      ?auto_385874 - BLOCK
      ?auto_385875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_385875 ) ( ON-TABLE ?auto_385861 ) ( ON ?auto_385862 ?auto_385861 ) ( ON ?auto_385863 ?auto_385862 ) ( ON ?auto_385864 ?auto_385863 ) ( ON ?auto_385865 ?auto_385864 ) ( ON ?auto_385866 ?auto_385865 ) ( ON ?auto_385867 ?auto_385866 ) ( ON ?auto_385868 ?auto_385867 ) ( ON ?auto_385869 ?auto_385868 ) ( ON ?auto_385870 ?auto_385869 ) ( ON ?auto_385871 ?auto_385870 ) ( ON ?auto_385872 ?auto_385871 ) ( ON ?auto_385873 ?auto_385872 ) ( not ( = ?auto_385861 ?auto_385862 ) ) ( not ( = ?auto_385861 ?auto_385863 ) ) ( not ( = ?auto_385861 ?auto_385864 ) ) ( not ( = ?auto_385861 ?auto_385865 ) ) ( not ( = ?auto_385861 ?auto_385866 ) ) ( not ( = ?auto_385861 ?auto_385867 ) ) ( not ( = ?auto_385861 ?auto_385868 ) ) ( not ( = ?auto_385861 ?auto_385869 ) ) ( not ( = ?auto_385861 ?auto_385870 ) ) ( not ( = ?auto_385861 ?auto_385871 ) ) ( not ( = ?auto_385861 ?auto_385872 ) ) ( not ( = ?auto_385861 ?auto_385873 ) ) ( not ( = ?auto_385861 ?auto_385874 ) ) ( not ( = ?auto_385861 ?auto_385875 ) ) ( not ( = ?auto_385862 ?auto_385863 ) ) ( not ( = ?auto_385862 ?auto_385864 ) ) ( not ( = ?auto_385862 ?auto_385865 ) ) ( not ( = ?auto_385862 ?auto_385866 ) ) ( not ( = ?auto_385862 ?auto_385867 ) ) ( not ( = ?auto_385862 ?auto_385868 ) ) ( not ( = ?auto_385862 ?auto_385869 ) ) ( not ( = ?auto_385862 ?auto_385870 ) ) ( not ( = ?auto_385862 ?auto_385871 ) ) ( not ( = ?auto_385862 ?auto_385872 ) ) ( not ( = ?auto_385862 ?auto_385873 ) ) ( not ( = ?auto_385862 ?auto_385874 ) ) ( not ( = ?auto_385862 ?auto_385875 ) ) ( not ( = ?auto_385863 ?auto_385864 ) ) ( not ( = ?auto_385863 ?auto_385865 ) ) ( not ( = ?auto_385863 ?auto_385866 ) ) ( not ( = ?auto_385863 ?auto_385867 ) ) ( not ( = ?auto_385863 ?auto_385868 ) ) ( not ( = ?auto_385863 ?auto_385869 ) ) ( not ( = ?auto_385863 ?auto_385870 ) ) ( not ( = ?auto_385863 ?auto_385871 ) ) ( not ( = ?auto_385863 ?auto_385872 ) ) ( not ( = ?auto_385863 ?auto_385873 ) ) ( not ( = ?auto_385863 ?auto_385874 ) ) ( not ( = ?auto_385863 ?auto_385875 ) ) ( not ( = ?auto_385864 ?auto_385865 ) ) ( not ( = ?auto_385864 ?auto_385866 ) ) ( not ( = ?auto_385864 ?auto_385867 ) ) ( not ( = ?auto_385864 ?auto_385868 ) ) ( not ( = ?auto_385864 ?auto_385869 ) ) ( not ( = ?auto_385864 ?auto_385870 ) ) ( not ( = ?auto_385864 ?auto_385871 ) ) ( not ( = ?auto_385864 ?auto_385872 ) ) ( not ( = ?auto_385864 ?auto_385873 ) ) ( not ( = ?auto_385864 ?auto_385874 ) ) ( not ( = ?auto_385864 ?auto_385875 ) ) ( not ( = ?auto_385865 ?auto_385866 ) ) ( not ( = ?auto_385865 ?auto_385867 ) ) ( not ( = ?auto_385865 ?auto_385868 ) ) ( not ( = ?auto_385865 ?auto_385869 ) ) ( not ( = ?auto_385865 ?auto_385870 ) ) ( not ( = ?auto_385865 ?auto_385871 ) ) ( not ( = ?auto_385865 ?auto_385872 ) ) ( not ( = ?auto_385865 ?auto_385873 ) ) ( not ( = ?auto_385865 ?auto_385874 ) ) ( not ( = ?auto_385865 ?auto_385875 ) ) ( not ( = ?auto_385866 ?auto_385867 ) ) ( not ( = ?auto_385866 ?auto_385868 ) ) ( not ( = ?auto_385866 ?auto_385869 ) ) ( not ( = ?auto_385866 ?auto_385870 ) ) ( not ( = ?auto_385866 ?auto_385871 ) ) ( not ( = ?auto_385866 ?auto_385872 ) ) ( not ( = ?auto_385866 ?auto_385873 ) ) ( not ( = ?auto_385866 ?auto_385874 ) ) ( not ( = ?auto_385866 ?auto_385875 ) ) ( not ( = ?auto_385867 ?auto_385868 ) ) ( not ( = ?auto_385867 ?auto_385869 ) ) ( not ( = ?auto_385867 ?auto_385870 ) ) ( not ( = ?auto_385867 ?auto_385871 ) ) ( not ( = ?auto_385867 ?auto_385872 ) ) ( not ( = ?auto_385867 ?auto_385873 ) ) ( not ( = ?auto_385867 ?auto_385874 ) ) ( not ( = ?auto_385867 ?auto_385875 ) ) ( not ( = ?auto_385868 ?auto_385869 ) ) ( not ( = ?auto_385868 ?auto_385870 ) ) ( not ( = ?auto_385868 ?auto_385871 ) ) ( not ( = ?auto_385868 ?auto_385872 ) ) ( not ( = ?auto_385868 ?auto_385873 ) ) ( not ( = ?auto_385868 ?auto_385874 ) ) ( not ( = ?auto_385868 ?auto_385875 ) ) ( not ( = ?auto_385869 ?auto_385870 ) ) ( not ( = ?auto_385869 ?auto_385871 ) ) ( not ( = ?auto_385869 ?auto_385872 ) ) ( not ( = ?auto_385869 ?auto_385873 ) ) ( not ( = ?auto_385869 ?auto_385874 ) ) ( not ( = ?auto_385869 ?auto_385875 ) ) ( not ( = ?auto_385870 ?auto_385871 ) ) ( not ( = ?auto_385870 ?auto_385872 ) ) ( not ( = ?auto_385870 ?auto_385873 ) ) ( not ( = ?auto_385870 ?auto_385874 ) ) ( not ( = ?auto_385870 ?auto_385875 ) ) ( not ( = ?auto_385871 ?auto_385872 ) ) ( not ( = ?auto_385871 ?auto_385873 ) ) ( not ( = ?auto_385871 ?auto_385874 ) ) ( not ( = ?auto_385871 ?auto_385875 ) ) ( not ( = ?auto_385872 ?auto_385873 ) ) ( not ( = ?auto_385872 ?auto_385874 ) ) ( not ( = ?auto_385872 ?auto_385875 ) ) ( not ( = ?auto_385873 ?auto_385874 ) ) ( not ( = ?auto_385873 ?auto_385875 ) ) ( not ( = ?auto_385874 ?auto_385875 ) ) ( CLEAR ?auto_385873 ) ( ON ?auto_385874 ?auto_385875 ) ( CLEAR ?auto_385874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_385861 ?auto_385862 ?auto_385863 ?auto_385864 ?auto_385865 ?auto_385866 ?auto_385867 ?auto_385868 ?auto_385869 ?auto_385870 ?auto_385871 ?auto_385872 ?auto_385873 ?auto_385874 )
      ( MAKE-15PILE ?auto_385861 ?auto_385862 ?auto_385863 ?auto_385864 ?auto_385865 ?auto_385866 ?auto_385867 ?auto_385868 ?auto_385869 ?auto_385870 ?auto_385871 ?auto_385872 ?auto_385873 ?auto_385874 ?auto_385875 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385891 - BLOCK
      ?auto_385892 - BLOCK
      ?auto_385893 - BLOCK
      ?auto_385894 - BLOCK
      ?auto_385895 - BLOCK
      ?auto_385896 - BLOCK
      ?auto_385897 - BLOCK
      ?auto_385898 - BLOCK
      ?auto_385899 - BLOCK
      ?auto_385900 - BLOCK
      ?auto_385901 - BLOCK
      ?auto_385902 - BLOCK
      ?auto_385903 - BLOCK
      ?auto_385904 - BLOCK
      ?auto_385905 - BLOCK
    )
    :vars
    (
      ?auto_385906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385905 ?auto_385906 ) ( ON-TABLE ?auto_385891 ) ( ON ?auto_385892 ?auto_385891 ) ( ON ?auto_385893 ?auto_385892 ) ( ON ?auto_385894 ?auto_385893 ) ( ON ?auto_385895 ?auto_385894 ) ( ON ?auto_385896 ?auto_385895 ) ( ON ?auto_385897 ?auto_385896 ) ( ON ?auto_385898 ?auto_385897 ) ( ON ?auto_385899 ?auto_385898 ) ( ON ?auto_385900 ?auto_385899 ) ( ON ?auto_385901 ?auto_385900 ) ( ON ?auto_385902 ?auto_385901 ) ( not ( = ?auto_385891 ?auto_385892 ) ) ( not ( = ?auto_385891 ?auto_385893 ) ) ( not ( = ?auto_385891 ?auto_385894 ) ) ( not ( = ?auto_385891 ?auto_385895 ) ) ( not ( = ?auto_385891 ?auto_385896 ) ) ( not ( = ?auto_385891 ?auto_385897 ) ) ( not ( = ?auto_385891 ?auto_385898 ) ) ( not ( = ?auto_385891 ?auto_385899 ) ) ( not ( = ?auto_385891 ?auto_385900 ) ) ( not ( = ?auto_385891 ?auto_385901 ) ) ( not ( = ?auto_385891 ?auto_385902 ) ) ( not ( = ?auto_385891 ?auto_385903 ) ) ( not ( = ?auto_385891 ?auto_385904 ) ) ( not ( = ?auto_385891 ?auto_385905 ) ) ( not ( = ?auto_385891 ?auto_385906 ) ) ( not ( = ?auto_385892 ?auto_385893 ) ) ( not ( = ?auto_385892 ?auto_385894 ) ) ( not ( = ?auto_385892 ?auto_385895 ) ) ( not ( = ?auto_385892 ?auto_385896 ) ) ( not ( = ?auto_385892 ?auto_385897 ) ) ( not ( = ?auto_385892 ?auto_385898 ) ) ( not ( = ?auto_385892 ?auto_385899 ) ) ( not ( = ?auto_385892 ?auto_385900 ) ) ( not ( = ?auto_385892 ?auto_385901 ) ) ( not ( = ?auto_385892 ?auto_385902 ) ) ( not ( = ?auto_385892 ?auto_385903 ) ) ( not ( = ?auto_385892 ?auto_385904 ) ) ( not ( = ?auto_385892 ?auto_385905 ) ) ( not ( = ?auto_385892 ?auto_385906 ) ) ( not ( = ?auto_385893 ?auto_385894 ) ) ( not ( = ?auto_385893 ?auto_385895 ) ) ( not ( = ?auto_385893 ?auto_385896 ) ) ( not ( = ?auto_385893 ?auto_385897 ) ) ( not ( = ?auto_385893 ?auto_385898 ) ) ( not ( = ?auto_385893 ?auto_385899 ) ) ( not ( = ?auto_385893 ?auto_385900 ) ) ( not ( = ?auto_385893 ?auto_385901 ) ) ( not ( = ?auto_385893 ?auto_385902 ) ) ( not ( = ?auto_385893 ?auto_385903 ) ) ( not ( = ?auto_385893 ?auto_385904 ) ) ( not ( = ?auto_385893 ?auto_385905 ) ) ( not ( = ?auto_385893 ?auto_385906 ) ) ( not ( = ?auto_385894 ?auto_385895 ) ) ( not ( = ?auto_385894 ?auto_385896 ) ) ( not ( = ?auto_385894 ?auto_385897 ) ) ( not ( = ?auto_385894 ?auto_385898 ) ) ( not ( = ?auto_385894 ?auto_385899 ) ) ( not ( = ?auto_385894 ?auto_385900 ) ) ( not ( = ?auto_385894 ?auto_385901 ) ) ( not ( = ?auto_385894 ?auto_385902 ) ) ( not ( = ?auto_385894 ?auto_385903 ) ) ( not ( = ?auto_385894 ?auto_385904 ) ) ( not ( = ?auto_385894 ?auto_385905 ) ) ( not ( = ?auto_385894 ?auto_385906 ) ) ( not ( = ?auto_385895 ?auto_385896 ) ) ( not ( = ?auto_385895 ?auto_385897 ) ) ( not ( = ?auto_385895 ?auto_385898 ) ) ( not ( = ?auto_385895 ?auto_385899 ) ) ( not ( = ?auto_385895 ?auto_385900 ) ) ( not ( = ?auto_385895 ?auto_385901 ) ) ( not ( = ?auto_385895 ?auto_385902 ) ) ( not ( = ?auto_385895 ?auto_385903 ) ) ( not ( = ?auto_385895 ?auto_385904 ) ) ( not ( = ?auto_385895 ?auto_385905 ) ) ( not ( = ?auto_385895 ?auto_385906 ) ) ( not ( = ?auto_385896 ?auto_385897 ) ) ( not ( = ?auto_385896 ?auto_385898 ) ) ( not ( = ?auto_385896 ?auto_385899 ) ) ( not ( = ?auto_385896 ?auto_385900 ) ) ( not ( = ?auto_385896 ?auto_385901 ) ) ( not ( = ?auto_385896 ?auto_385902 ) ) ( not ( = ?auto_385896 ?auto_385903 ) ) ( not ( = ?auto_385896 ?auto_385904 ) ) ( not ( = ?auto_385896 ?auto_385905 ) ) ( not ( = ?auto_385896 ?auto_385906 ) ) ( not ( = ?auto_385897 ?auto_385898 ) ) ( not ( = ?auto_385897 ?auto_385899 ) ) ( not ( = ?auto_385897 ?auto_385900 ) ) ( not ( = ?auto_385897 ?auto_385901 ) ) ( not ( = ?auto_385897 ?auto_385902 ) ) ( not ( = ?auto_385897 ?auto_385903 ) ) ( not ( = ?auto_385897 ?auto_385904 ) ) ( not ( = ?auto_385897 ?auto_385905 ) ) ( not ( = ?auto_385897 ?auto_385906 ) ) ( not ( = ?auto_385898 ?auto_385899 ) ) ( not ( = ?auto_385898 ?auto_385900 ) ) ( not ( = ?auto_385898 ?auto_385901 ) ) ( not ( = ?auto_385898 ?auto_385902 ) ) ( not ( = ?auto_385898 ?auto_385903 ) ) ( not ( = ?auto_385898 ?auto_385904 ) ) ( not ( = ?auto_385898 ?auto_385905 ) ) ( not ( = ?auto_385898 ?auto_385906 ) ) ( not ( = ?auto_385899 ?auto_385900 ) ) ( not ( = ?auto_385899 ?auto_385901 ) ) ( not ( = ?auto_385899 ?auto_385902 ) ) ( not ( = ?auto_385899 ?auto_385903 ) ) ( not ( = ?auto_385899 ?auto_385904 ) ) ( not ( = ?auto_385899 ?auto_385905 ) ) ( not ( = ?auto_385899 ?auto_385906 ) ) ( not ( = ?auto_385900 ?auto_385901 ) ) ( not ( = ?auto_385900 ?auto_385902 ) ) ( not ( = ?auto_385900 ?auto_385903 ) ) ( not ( = ?auto_385900 ?auto_385904 ) ) ( not ( = ?auto_385900 ?auto_385905 ) ) ( not ( = ?auto_385900 ?auto_385906 ) ) ( not ( = ?auto_385901 ?auto_385902 ) ) ( not ( = ?auto_385901 ?auto_385903 ) ) ( not ( = ?auto_385901 ?auto_385904 ) ) ( not ( = ?auto_385901 ?auto_385905 ) ) ( not ( = ?auto_385901 ?auto_385906 ) ) ( not ( = ?auto_385902 ?auto_385903 ) ) ( not ( = ?auto_385902 ?auto_385904 ) ) ( not ( = ?auto_385902 ?auto_385905 ) ) ( not ( = ?auto_385902 ?auto_385906 ) ) ( not ( = ?auto_385903 ?auto_385904 ) ) ( not ( = ?auto_385903 ?auto_385905 ) ) ( not ( = ?auto_385903 ?auto_385906 ) ) ( not ( = ?auto_385904 ?auto_385905 ) ) ( not ( = ?auto_385904 ?auto_385906 ) ) ( not ( = ?auto_385905 ?auto_385906 ) ) ( ON ?auto_385904 ?auto_385905 ) ( CLEAR ?auto_385902 ) ( ON ?auto_385903 ?auto_385904 ) ( CLEAR ?auto_385903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_385891 ?auto_385892 ?auto_385893 ?auto_385894 ?auto_385895 ?auto_385896 ?auto_385897 ?auto_385898 ?auto_385899 ?auto_385900 ?auto_385901 ?auto_385902 ?auto_385903 )
      ( MAKE-15PILE ?auto_385891 ?auto_385892 ?auto_385893 ?auto_385894 ?auto_385895 ?auto_385896 ?auto_385897 ?auto_385898 ?auto_385899 ?auto_385900 ?auto_385901 ?auto_385902 ?auto_385903 ?auto_385904 ?auto_385905 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385922 - BLOCK
      ?auto_385923 - BLOCK
      ?auto_385924 - BLOCK
      ?auto_385925 - BLOCK
      ?auto_385926 - BLOCK
      ?auto_385927 - BLOCK
      ?auto_385928 - BLOCK
      ?auto_385929 - BLOCK
      ?auto_385930 - BLOCK
      ?auto_385931 - BLOCK
      ?auto_385932 - BLOCK
      ?auto_385933 - BLOCK
      ?auto_385934 - BLOCK
      ?auto_385935 - BLOCK
      ?auto_385936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_385936 ) ( ON-TABLE ?auto_385922 ) ( ON ?auto_385923 ?auto_385922 ) ( ON ?auto_385924 ?auto_385923 ) ( ON ?auto_385925 ?auto_385924 ) ( ON ?auto_385926 ?auto_385925 ) ( ON ?auto_385927 ?auto_385926 ) ( ON ?auto_385928 ?auto_385927 ) ( ON ?auto_385929 ?auto_385928 ) ( ON ?auto_385930 ?auto_385929 ) ( ON ?auto_385931 ?auto_385930 ) ( ON ?auto_385932 ?auto_385931 ) ( ON ?auto_385933 ?auto_385932 ) ( not ( = ?auto_385922 ?auto_385923 ) ) ( not ( = ?auto_385922 ?auto_385924 ) ) ( not ( = ?auto_385922 ?auto_385925 ) ) ( not ( = ?auto_385922 ?auto_385926 ) ) ( not ( = ?auto_385922 ?auto_385927 ) ) ( not ( = ?auto_385922 ?auto_385928 ) ) ( not ( = ?auto_385922 ?auto_385929 ) ) ( not ( = ?auto_385922 ?auto_385930 ) ) ( not ( = ?auto_385922 ?auto_385931 ) ) ( not ( = ?auto_385922 ?auto_385932 ) ) ( not ( = ?auto_385922 ?auto_385933 ) ) ( not ( = ?auto_385922 ?auto_385934 ) ) ( not ( = ?auto_385922 ?auto_385935 ) ) ( not ( = ?auto_385922 ?auto_385936 ) ) ( not ( = ?auto_385923 ?auto_385924 ) ) ( not ( = ?auto_385923 ?auto_385925 ) ) ( not ( = ?auto_385923 ?auto_385926 ) ) ( not ( = ?auto_385923 ?auto_385927 ) ) ( not ( = ?auto_385923 ?auto_385928 ) ) ( not ( = ?auto_385923 ?auto_385929 ) ) ( not ( = ?auto_385923 ?auto_385930 ) ) ( not ( = ?auto_385923 ?auto_385931 ) ) ( not ( = ?auto_385923 ?auto_385932 ) ) ( not ( = ?auto_385923 ?auto_385933 ) ) ( not ( = ?auto_385923 ?auto_385934 ) ) ( not ( = ?auto_385923 ?auto_385935 ) ) ( not ( = ?auto_385923 ?auto_385936 ) ) ( not ( = ?auto_385924 ?auto_385925 ) ) ( not ( = ?auto_385924 ?auto_385926 ) ) ( not ( = ?auto_385924 ?auto_385927 ) ) ( not ( = ?auto_385924 ?auto_385928 ) ) ( not ( = ?auto_385924 ?auto_385929 ) ) ( not ( = ?auto_385924 ?auto_385930 ) ) ( not ( = ?auto_385924 ?auto_385931 ) ) ( not ( = ?auto_385924 ?auto_385932 ) ) ( not ( = ?auto_385924 ?auto_385933 ) ) ( not ( = ?auto_385924 ?auto_385934 ) ) ( not ( = ?auto_385924 ?auto_385935 ) ) ( not ( = ?auto_385924 ?auto_385936 ) ) ( not ( = ?auto_385925 ?auto_385926 ) ) ( not ( = ?auto_385925 ?auto_385927 ) ) ( not ( = ?auto_385925 ?auto_385928 ) ) ( not ( = ?auto_385925 ?auto_385929 ) ) ( not ( = ?auto_385925 ?auto_385930 ) ) ( not ( = ?auto_385925 ?auto_385931 ) ) ( not ( = ?auto_385925 ?auto_385932 ) ) ( not ( = ?auto_385925 ?auto_385933 ) ) ( not ( = ?auto_385925 ?auto_385934 ) ) ( not ( = ?auto_385925 ?auto_385935 ) ) ( not ( = ?auto_385925 ?auto_385936 ) ) ( not ( = ?auto_385926 ?auto_385927 ) ) ( not ( = ?auto_385926 ?auto_385928 ) ) ( not ( = ?auto_385926 ?auto_385929 ) ) ( not ( = ?auto_385926 ?auto_385930 ) ) ( not ( = ?auto_385926 ?auto_385931 ) ) ( not ( = ?auto_385926 ?auto_385932 ) ) ( not ( = ?auto_385926 ?auto_385933 ) ) ( not ( = ?auto_385926 ?auto_385934 ) ) ( not ( = ?auto_385926 ?auto_385935 ) ) ( not ( = ?auto_385926 ?auto_385936 ) ) ( not ( = ?auto_385927 ?auto_385928 ) ) ( not ( = ?auto_385927 ?auto_385929 ) ) ( not ( = ?auto_385927 ?auto_385930 ) ) ( not ( = ?auto_385927 ?auto_385931 ) ) ( not ( = ?auto_385927 ?auto_385932 ) ) ( not ( = ?auto_385927 ?auto_385933 ) ) ( not ( = ?auto_385927 ?auto_385934 ) ) ( not ( = ?auto_385927 ?auto_385935 ) ) ( not ( = ?auto_385927 ?auto_385936 ) ) ( not ( = ?auto_385928 ?auto_385929 ) ) ( not ( = ?auto_385928 ?auto_385930 ) ) ( not ( = ?auto_385928 ?auto_385931 ) ) ( not ( = ?auto_385928 ?auto_385932 ) ) ( not ( = ?auto_385928 ?auto_385933 ) ) ( not ( = ?auto_385928 ?auto_385934 ) ) ( not ( = ?auto_385928 ?auto_385935 ) ) ( not ( = ?auto_385928 ?auto_385936 ) ) ( not ( = ?auto_385929 ?auto_385930 ) ) ( not ( = ?auto_385929 ?auto_385931 ) ) ( not ( = ?auto_385929 ?auto_385932 ) ) ( not ( = ?auto_385929 ?auto_385933 ) ) ( not ( = ?auto_385929 ?auto_385934 ) ) ( not ( = ?auto_385929 ?auto_385935 ) ) ( not ( = ?auto_385929 ?auto_385936 ) ) ( not ( = ?auto_385930 ?auto_385931 ) ) ( not ( = ?auto_385930 ?auto_385932 ) ) ( not ( = ?auto_385930 ?auto_385933 ) ) ( not ( = ?auto_385930 ?auto_385934 ) ) ( not ( = ?auto_385930 ?auto_385935 ) ) ( not ( = ?auto_385930 ?auto_385936 ) ) ( not ( = ?auto_385931 ?auto_385932 ) ) ( not ( = ?auto_385931 ?auto_385933 ) ) ( not ( = ?auto_385931 ?auto_385934 ) ) ( not ( = ?auto_385931 ?auto_385935 ) ) ( not ( = ?auto_385931 ?auto_385936 ) ) ( not ( = ?auto_385932 ?auto_385933 ) ) ( not ( = ?auto_385932 ?auto_385934 ) ) ( not ( = ?auto_385932 ?auto_385935 ) ) ( not ( = ?auto_385932 ?auto_385936 ) ) ( not ( = ?auto_385933 ?auto_385934 ) ) ( not ( = ?auto_385933 ?auto_385935 ) ) ( not ( = ?auto_385933 ?auto_385936 ) ) ( not ( = ?auto_385934 ?auto_385935 ) ) ( not ( = ?auto_385934 ?auto_385936 ) ) ( not ( = ?auto_385935 ?auto_385936 ) ) ( ON ?auto_385935 ?auto_385936 ) ( CLEAR ?auto_385933 ) ( ON ?auto_385934 ?auto_385935 ) ( CLEAR ?auto_385934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_385922 ?auto_385923 ?auto_385924 ?auto_385925 ?auto_385926 ?auto_385927 ?auto_385928 ?auto_385929 ?auto_385930 ?auto_385931 ?auto_385932 ?auto_385933 ?auto_385934 )
      ( MAKE-15PILE ?auto_385922 ?auto_385923 ?auto_385924 ?auto_385925 ?auto_385926 ?auto_385927 ?auto_385928 ?auto_385929 ?auto_385930 ?auto_385931 ?auto_385932 ?auto_385933 ?auto_385934 ?auto_385935 ?auto_385936 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385952 - BLOCK
      ?auto_385953 - BLOCK
      ?auto_385954 - BLOCK
      ?auto_385955 - BLOCK
      ?auto_385956 - BLOCK
      ?auto_385957 - BLOCK
      ?auto_385958 - BLOCK
      ?auto_385959 - BLOCK
      ?auto_385960 - BLOCK
      ?auto_385961 - BLOCK
      ?auto_385962 - BLOCK
      ?auto_385963 - BLOCK
      ?auto_385964 - BLOCK
      ?auto_385965 - BLOCK
      ?auto_385966 - BLOCK
    )
    :vars
    (
      ?auto_385967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_385966 ?auto_385967 ) ( ON-TABLE ?auto_385952 ) ( ON ?auto_385953 ?auto_385952 ) ( ON ?auto_385954 ?auto_385953 ) ( ON ?auto_385955 ?auto_385954 ) ( ON ?auto_385956 ?auto_385955 ) ( ON ?auto_385957 ?auto_385956 ) ( ON ?auto_385958 ?auto_385957 ) ( ON ?auto_385959 ?auto_385958 ) ( ON ?auto_385960 ?auto_385959 ) ( ON ?auto_385961 ?auto_385960 ) ( ON ?auto_385962 ?auto_385961 ) ( not ( = ?auto_385952 ?auto_385953 ) ) ( not ( = ?auto_385952 ?auto_385954 ) ) ( not ( = ?auto_385952 ?auto_385955 ) ) ( not ( = ?auto_385952 ?auto_385956 ) ) ( not ( = ?auto_385952 ?auto_385957 ) ) ( not ( = ?auto_385952 ?auto_385958 ) ) ( not ( = ?auto_385952 ?auto_385959 ) ) ( not ( = ?auto_385952 ?auto_385960 ) ) ( not ( = ?auto_385952 ?auto_385961 ) ) ( not ( = ?auto_385952 ?auto_385962 ) ) ( not ( = ?auto_385952 ?auto_385963 ) ) ( not ( = ?auto_385952 ?auto_385964 ) ) ( not ( = ?auto_385952 ?auto_385965 ) ) ( not ( = ?auto_385952 ?auto_385966 ) ) ( not ( = ?auto_385952 ?auto_385967 ) ) ( not ( = ?auto_385953 ?auto_385954 ) ) ( not ( = ?auto_385953 ?auto_385955 ) ) ( not ( = ?auto_385953 ?auto_385956 ) ) ( not ( = ?auto_385953 ?auto_385957 ) ) ( not ( = ?auto_385953 ?auto_385958 ) ) ( not ( = ?auto_385953 ?auto_385959 ) ) ( not ( = ?auto_385953 ?auto_385960 ) ) ( not ( = ?auto_385953 ?auto_385961 ) ) ( not ( = ?auto_385953 ?auto_385962 ) ) ( not ( = ?auto_385953 ?auto_385963 ) ) ( not ( = ?auto_385953 ?auto_385964 ) ) ( not ( = ?auto_385953 ?auto_385965 ) ) ( not ( = ?auto_385953 ?auto_385966 ) ) ( not ( = ?auto_385953 ?auto_385967 ) ) ( not ( = ?auto_385954 ?auto_385955 ) ) ( not ( = ?auto_385954 ?auto_385956 ) ) ( not ( = ?auto_385954 ?auto_385957 ) ) ( not ( = ?auto_385954 ?auto_385958 ) ) ( not ( = ?auto_385954 ?auto_385959 ) ) ( not ( = ?auto_385954 ?auto_385960 ) ) ( not ( = ?auto_385954 ?auto_385961 ) ) ( not ( = ?auto_385954 ?auto_385962 ) ) ( not ( = ?auto_385954 ?auto_385963 ) ) ( not ( = ?auto_385954 ?auto_385964 ) ) ( not ( = ?auto_385954 ?auto_385965 ) ) ( not ( = ?auto_385954 ?auto_385966 ) ) ( not ( = ?auto_385954 ?auto_385967 ) ) ( not ( = ?auto_385955 ?auto_385956 ) ) ( not ( = ?auto_385955 ?auto_385957 ) ) ( not ( = ?auto_385955 ?auto_385958 ) ) ( not ( = ?auto_385955 ?auto_385959 ) ) ( not ( = ?auto_385955 ?auto_385960 ) ) ( not ( = ?auto_385955 ?auto_385961 ) ) ( not ( = ?auto_385955 ?auto_385962 ) ) ( not ( = ?auto_385955 ?auto_385963 ) ) ( not ( = ?auto_385955 ?auto_385964 ) ) ( not ( = ?auto_385955 ?auto_385965 ) ) ( not ( = ?auto_385955 ?auto_385966 ) ) ( not ( = ?auto_385955 ?auto_385967 ) ) ( not ( = ?auto_385956 ?auto_385957 ) ) ( not ( = ?auto_385956 ?auto_385958 ) ) ( not ( = ?auto_385956 ?auto_385959 ) ) ( not ( = ?auto_385956 ?auto_385960 ) ) ( not ( = ?auto_385956 ?auto_385961 ) ) ( not ( = ?auto_385956 ?auto_385962 ) ) ( not ( = ?auto_385956 ?auto_385963 ) ) ( not ( = ?auto_385956 ?auto_385964 ) ) ( not ( = ?auto_385956 ?auto_385965 ) ) ( not ( = ?auto_385956 ?auto_385966 ) ) ( not ( = ?auto_385956 ?auto_385967 ) ) ( not ( = ?auto_385957 ?auto_385958 ) ) ( not ( = ?auto_385957 ?auto_385959 ) ) ( not ( = ?auto_385957 ?auto_385960 ) ) ( not ( = ?auto_385957 ?auto_385961 ) ) ( not ( = ?auto_385957 ?auto_385962 ) ) ( not ( = ?auto_385957 ?auto_385963 ) ) ( not ( = ?auto_385957 ?auto_385964 ) ) ( not ( = ?auto_385957 ?auto_385965 ) ) ( not ( = ?auto_385957 ?auto_385966 ) ) ( not ( = ?auto_385957 ?auto_385967 ) ) ( not ( = ?auto_385958 ?auto_385959 ) ) ( not ( = ?auto_385958 ?auto_385960 ) ) ( not ( = ?auto_385958 ?auto_385961 ) ) ( not ( = ?auto_385958 ?auto_385962 ) ) ( not ( = ?auto_385958 ?auto_385963 ) ) ( not ( = ?auto_385958 ?auto_385964 ) ) ( not ( = ?auto_385958 ?auto_385965 ) ) ( not ( = ?auto_385958 ?auto_385966 ) ) ( not ( = ?auto_385958 ?auto_385967 ) ) ( not ( = ?auto_385959 ?auto_385960 ) ) ( not ( = ?auto_385959 ?auto_385961 ) ) ( not ( = ?auto_385959 ?auto_385962 ) ) ( not ( = ?auto_385959 ?auto_385963 ) ) ( not ( = ?auto_385959 ?auto_385964 ) ) ( not ( = ?auto_385959 ?auto_385965 ) ) ( not ( = ?auto_385959 ?auto_385966 ) ) ( not ( = ?auto_385959 ?auto_385967 ) ) ( not ( = ?auto_385960 ?auto_385961 ) ) ( not ( = ?auto_385960 ?auto_385962 ) ) ( not ( = ?auto_385960 ?auto_385963 ) ) ( not ( = ?auto_385960 ?auto_385964 ) ) ( not ( = ?auto_385960 ?auto_385965 ) ) ( not ( = ?auto_385960 ?auto_385966 ) ) ( not ( = ?auto_385960 ?auto_385967 ) ) ( not ( = ?auto_385961 ?auto_385962 ) ) ( not ( = ?auto_385961 ?auto_385963 ) ) ( not ( = ?auto_385961 ?auto_385964 ) ) ( not ( = ?auto_385961 ?auto_385965 ) ) ( not ( = ?auto_385961 ?auto_385966 ) ) ( not ( = ?auto_385961 ?auto_385967 ) ) ( not ( = ?auto_385962 ?auto_385963 ) ) ( not ( = ?auto_385962 ?auto_385964 ) ) ( not ( = ?auto_385962 ?auto_385965 ) ) ( not ( = ?auto_385962 ?auto_385966 ) ) ( not ( = ?auto_385962 ?auto_385967 ) ) ( not ( = ?auto_385963 ?auto_385964 ) ) ( not ( = ?auto_385963 ?auto_385965 ) ) ( not ( = ?auto_385963 ?auto_385966 ) ) ( not ( = ?auto_385963 ?auto_385967 ) ) ( not ( = ?auto_385964 ?auto_385965 ) ) ( not ( = ?auto_385964 ?auto_385966 ) ) ( not ( = ?auto_385964 ?auto_385967 ) ) ( not ( = ?auto_385965 ?auto_385966 ) ) ( not ( = ?auto_385965 ?auto_385967 ) ) ( not ( = ?auto_385966 ?auto_385967 ) ) ( ON ?auto_385965 ?auto_385966 ) ( ON ?auto_385964 ?auto_385965 ) ( CLEAR ?auto_385962 ) ( ON ?auto_385963 ?auto_385964 ) ( CLEAR ?auto_385963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_385952 ?auto_385953 ?auto_385954 ?auto_385955 ?auto_385956 ?auto_385957 ?auto_385958 ?auto_385959 ?auto_385960 ?auto_385961 ?auto_385962 ?auto_385963 )
      ( MAKE-15PILE ?auto_385952 ?auto_385953 ?auto_385954 ?auto_385955 ?auto_385956 ?auto_385957 ?auto_385958 ?auto_385959 ?auto_385960 ?auto_385961 ?auto_385962 ?auto_385963 ?auto_385964 ?auto_385965 ?auto_385966 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_385983 - BLOCK
      ?auto_385984 - BLOCK
      ?auto_385985 - BLOCK
      ?auto_385986 - BLOCK
      ?auto_385987 - BLOCK
      ?auto_385988 - BLOCK
      ?auto_385989 - BLOCK
      ?auto_385990 - BLOCK
      ?auto_385991 - BLOCK
      ?auto_385992 - BLOCK
      ?auto_385993 - BLOCK
      ?auto_385994 - BLOCK
      ?auto_385995 - BLOCK
      ?auto_385996 - BLOCK
      ?auto_385997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_385997 ) ( ON-TABLE ?auto_385983 ) ( ON ?auto_385984 ?auto_385983 ) ( ON ?auto_385985 ?auto_385984 ) ( ON ?auto_385986 ?auto_385985 ) ( ON ?auto_385987 ?auto_385986 ) ( ON ?auto_385988 ?auto_385987 ) ( ON ?auto_385989 ?auto_385988 ) ( ON ?auto_385990 ?auto_385989 ) ( ON ?auto_385991 ?auto_385990 ) ( ON ?auto_385992 ?auto_385991 ) ( ON ?auto_385993 ?auto_385992 ) ( not ( = ?auto_385983 ?auto_385984 ) ) ( not ( = ?auto_385983 ?auto_385985 ) ) ( not ( = ?auto_385983 ?auto_385986 ) ) ( not ( = ?auto_385983 ?auto_385987 ) ) ( not ( = ?auto_385983 ?auto_385988 ) ) ( not ( = ?auto_385983 ?auto_385989 ) ) ( not ( = ?auto_385983 ?auto_385990 ) ) ( not ( = ?auto_385983 ?auto_385991 ) ) ( not ( = ?auto_385983 ?auto_385992 ) ) ( not ( = ?auto_385983 ?auto_385993 ) ) ( not ( = ?auto_385983 ?auto_385994 ) ) ( not ( = ?auto_385983 ?auto_385995 ) ) ( not ( = ?auto_385983 ?auto_385996 ) ) ( not ( = ?auto_385983 ?auto_385997 ) ) ( not ( = ?auto_385984 ?auto_385985 ) ) ( not ( = ?auto_385984 ?auto_385986 ) ) ( not ( = ?auto_385984 ?auto_385987 ) ) ( not ( = ?auto_385984 ?auto_385988 ) ) ( not ( = ?auto_385984 ?auto_385989 ) ) ( not ( = ?auto_385984 ?auto_385990 ) ) ( not ( = ?auto_385984 ?auto_385991 ) ) ( not ( = ?auto_385984 ?auto_385992 ) ) ( not ( = ?auto_385984 ?auto_385993 ) ) ( not ( = ?auto_385984 ?auto_385994 ) ) ( not ( = ?auto_385984 ?auto_385995 ) ) ( not ( = ?auto_385984 ?auto_385996 ) ) ( not ( = ?auto_385984 ?auto_385997 ) ) ( not ( = ?auto_385985 ?auto_385986 ) ) ( not ( = ?auto_385985 ?auto_385987 ) ) ( not ( = ?auto_385985 ?auto_385988 ) ) ( not ( = ?auto_385985 ?auto_385989 ) ) ( not ( = ?auto_385985 ?auto_385990 ) ) ( not ( = ?auto_385985 ?auto_385991 ) ) ( not ( = ?auto_385985 ?auto_385992 ) ) ( not ( = ?auto_385985 ?auto_385993 ) ) ( not ( = ?auto_385985 ?auto_385994 ) ) ( not ( = ?auto_385985 ?auto_385995 ) ) ( not ( = ?auto_385985 ?auto_385996 ) ) ( not ( = ?auto_385985 ?auto_385997 ) ) ( not ( = ?auto_385986 ?auto_385987 ) ) ( not ( = ?auto_385986 ?auto_385988 ) ) ( not ( = ?auto_385986 ?auto_385989 ) ) ( not ( = ?auto_385986 ?auto_385990 ) ) ( not ( = ?auto_385986 ?auto_385991 ) ) ( not ( = ?auto_385986 ?auto_385992 ) ) ( not ( = ?auto_385986 ?auto_385993 ) ) ( not ( = ?auto_385986 ?auto_385994 ) ) ( not ( = ?auto_385986 ?auto_385995 ) ) ( not ( = ?auto_385986 ?auto_385996 ) ) ( not ( = ?auto_385986 ?auto_385997 ) ) ( not ( = ?auto_385987 ?auto_385988 ) ) ( not ( = ?auto_385987 ?auto_385989 ) ) ( not ( = ?auto_385987 ?auto_385990 ) ) ( not ( = ?auto_385987 ?auto_385991 ) ) ( not ( = ?auto_385987 ?auto_385992 ) ) ( not ( = ?auto_385987 ?auto_385993 ) ) ( not ( = ?auto_385987 ?auto_385994 ) ) ( not ( = ?auto_385987 ?auto_385995 ) ) ( not ( = ?auto_385987 ?auto_385996 ) ) ( not ( = ?auto_385987 ?auto_385997 ) ) ( not ( = ?auto_385988 ?auto_385989 ) ) ( not ( = ?auto_385988 ?auto_385990 ) ) ( not ( = ?auto_385988 ?auto_385991 ) ) ( not ( = ?auto_385988 ?auto_385992 ) ) ( not ( = ?auto_385988 ?auto_385993 ) ) ( not ( = ?auto_385988 ?auto_385994 ) ) ( not ( = ?auto_385988 ?auto_385995 ) ) ( not ( = ?auto_385988 ?auto_385996 ) ) ( not ( = ?auto_385988 ?auto_385997 ) ) ( not ( = ?auto_385989 ?auto_385990 ) ) ( not ( = ?auto_385989 ?auto_385991 ) ) ( not ( = ?auto_385989 ?auto_385992 ) ) ( not ( = ?auto_385989 ?auto_385993 ) ) ( not ( = ?auto_385989 ?auto_385994 ) ) ( not ( = ?auto_385989 ?auto_385995 ) ) ( not ( = ?auto_385989 ?auto_385996 ) ) ( not ( = ?auto_385989 ?auto_385997 ) ) ( not ( = ?auto_385990 ?auto_385991 ) ) ( not ( = ?auto_385990 ?auto_385992 ) ) ( not ( = ?auto_385990 ?auto_385993 ) ) ( not ( = ?auto_385990 ?auto_385994 ) ) ( not ( = ?auto_385990 ?auto_385995 ) ) ( not ( = ?auto_385990 ?auto_385996 ) ) ( not ( = ?auto_385990 ?auto_385997 ) ) ( not ( = ?auto_385991 ?auto_385992 ) ) ( not ( = ?auto_385991 ?auto_385993 ) ) ( not ( = ?auto_385991 ?auto_385994 ) ) ( not ( = ?auto_385991 ?auto_385995 ) ) ( not ( = ?auto_385991 ?auto_385996 ) ) ( not ( = ?auto_385991 ?auto_385997 ) ) ( not ( = ?auto_385992 ?auto_385993 ) ) ( not ( = ?auto_385992 ?auto_385994 ) ) ( not ( = ?auto_385992 ?auto_385995 ) ) ( not ( = ?auto_385992 ?auto_385996 ) ) ( not ( = ?auto_385992 ?auto_385997 ) ) ( not ( = ?auto_385993 ?auto_385994 ) ) ( not ( = ?auto_385993 ?auto_385995 ) ) ( not ( = ?auto_385993 ?auto_385996 ) ) ( not ( = ?auto_385993 ?auto_385997 ) ) ( not ( = ?auto_385994 ?auto_385995 ) ) ( not ( = ?auto_385994 ?auto_385996 ) ) ( not ( = ?auto_385994 ?auto_385997 ) ) ( not ( = ?auto_385995 ?auto_385996 ) ) ( not ( = ?auto_385995 ?auto_385997 ) ) ( not ( = ?auto_385996 ?auto_385997 ) ) ( ON ?auto_385996 ?auto_385997 ) ( ON ?auto_385995 ?auto_385996 ) ( CLEAR ?auto_385993 ) ( ON ?auto_385994 ?auto_385995 ) ( CLEAR ?auto_385994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_385983 ?auto_385984 ?auto_385985 ?auto_385986 ?auto_385987 ?auto_385988 ?auto_385989 ?auto_385990 ?auto_385991 ?auto_385992 ?auto_385993 ?auto_385994 )
      ( MAKE-15PILE ?auto_385983 ?auto_385984 ?auto_385985 ?auto_385986 ?auto_385987 ?auto_385988 ?auto_385989 ?auto_385990 ?auto_385991 ?auto_385992 ?auto_385993 ?auto_385994 ?auto_385995 ?auto_385996 ?auto_385997 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386013 - BLOCK
      ?auto_386014 - BLOCK
      ?auto_386015 - BLOCK
      ?auto_386016 - BLOCK
      ?auto_386017 - BLOCK
      ?auto_386018 - BLOCK
      ?auto_386019 - BLOCK
      ?auto_386020 - BLOCK
      ?auto_386021 - BLOCK
      ?auto_386022 - BLOCK
      ?auto_386023 - BLOCK
      ?auto_386024 - BLOCK
      ?auto_386025 - BLOCK
      ?auto_386026 - BLOCK
      ?auto_386027 - BLOCK
    )
    :vars
    (
      ?auto_386028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386027 ?auto_386028 ) ( ON-TABLE ?auto_386013 ) ( ON ?auto_386014 ?auto_386013 ) ( ON ?auto_386015 ?auto_386014 ) ( ON ?auto_386016 ?auto_386015 ) ( ON ?auto_386017 ?auto_386016 ) ( ON ?auto_386018 ?auto_386017 ) ( ON ?auto_386019 ?auto_386018 ) ( ON ?auto_386020 ?auto_386019 ) ( ON ?auto_386021 ?auto_386020 ) ( ON ?auto_386022 ?auto_386021 ) ( not ( = ?auto_386013 ?auto_386014 ) ) ( not ( = ?auto_386013 ?auto_386015 ) ) ( not ( = ?auto_386013 ?auto_386016 ) ) ( not ( = ?auto_386013 ?auto_386017 ) ) ( not ( = ?auto_386013 ?auto_386018 ) ) ( not ( = ?auto_386013 ?auto_386019 ) ) ( not ( = ?auto_386013 ?auto_386020 ) ) ( not ( = ?auto_386013 ?auto_386021 ) ) ( not ( = ?auto_386013 ?auto_386022 ) ) ( not ( = ?auto_386013 ?auto_386023 ) ) ( not ( = ?auto_386013 ?auto_386024 ) ) ( not ( = ?auto_386013 ?auto_386025 ) ) ( not ( = ?auto_386013 ?auto_386026 ) ) ( not ( = ?auto_386013 ?auto_386027 ) ) ( not ( = ?auto_386013 ?auto_386028 ) ) ( not ( = ?auto_386014 ?auto_386015 ) ) ( not ( = ?auto_386014 ?auto_386016 ) ) ( not ( = ?auto_386014 ?auto_386017 ) ) ( not ( = ?auto_386014 ?auto_386018 ) ) ( not ( = ?auto_386014 ?auto_386019 ) ) ( not ( = ?auto_386014 ?auto_386020 ) ) ( not ( = ?auto_386014 ?auto_386021 ) ) ( not ( = ?auto_386014 ?auto_386022 ) ) ( not ( = ?auto_386014 ?auto_386023 ) ) ( not ( = ?auto_386014 ?auto_386024 ) ) ( not ( = ?auto_386014 ?auto_386025 ) ) ( not ( = ?auto_386014 ?auto_386026 ) ) ( not ( = ?auto_386014 ?auto_386027 ) ) ( not ( = ?auto_386014 ?auto_386028 ) ) ( not ( = ?auto_386015 ?auto_386016 ) ) ( not ( = ?auto_386015 ?auto_386017 ) ) ( not ( = ?auto_386015 ?auto_386018 ) ) ( not ( = ?auto_386015 ?auto_386019 ) ) ( not ( = ?auto_386015 ?auto_386020 ) ) ( not ( = ?auto_386015 ?auto_386021 ) ) ( not ( = ?auto_386015 ?auto_386022 ) ) ( not ( = ?auto_386015 ?auto_386023 ) ) ( not ( = ?auto_386015 ?auto_386024 ) ) ( not ( = ?auto_386015 ?auto_386025 ) ) ( not ( = ?auto_386015 ?auto_386026 ) ) ( not ( = ?auto_386015 ?auto_386027 ) ) ( not ( = ?auto_386015 ?auto_386028 ) ) ( not ( = ?auto_386016 ?auto_386017 ) ) ( not ( = ?auto_386016 ?auto_386018 ) ) ( not ( = ?auto_386016 ?auto_386019 ) ) ( not ( = ?auto_386016 ?auto_386020 ) ) ( not ( = ?auto_386016 ?auto_386021 ) ) ( not ( = ?auto_386016 ?auto_386022 ) ) ( not ( = ?auto_386016 ?auto_386023 ) ) ( not ( = ?auto_386016 ?auto_386024 ) ) ( not ( = ?auto_386016 ?auto_386025 ) ) ( not ( = ?auto_386016 ?auto_386026 ) ) ( not ( = ?auto_386016 ?auto_386027 ) ) ( not ( = ?auto_386016 ?auto_386028 ) ) ( not ( = ?auto_386017 ?auto_386018 ) ) ( not ( = ?auto_386017 ?auto_386019 ) ) ( not ( = ?auto_386017 ?auto_386020 ) ) ( not ( = ?auto_386017 ?auto_386021 ) ) ( not ( = ?auto_386017 ?auto_386022 ) ) ( not ( = ?auto_386017 ?auto_386023 ) ) ( not ( = ?auto_386017 ?auto_386024 ) ) ( not ( = ?auto_386017 ?auto_386025 ) ) ( not ( = ?auto_386017 ?auto_386026 ) ) ( not ( = ?auto_386017 ?auto_386027 ) ) ( not ( = ?auto_386017 ?auto_386028 ) ) ( not ( = ?auto_386018 ?auto_386019 ) ) ( not ( = ?auto_386018 ?auto_386020 ) ) ( not ( = ?auto_386018 ?auto_386021 ) ) ( not ( = ?auto_386018 ?auto_386022 ) ) ( not ( = ?auto_386018 ?auto_386023 ) ) ( not ( = ?auto_386018 ?auto_386024 ) ) ( not ( = ?auto_386018 ?auto_386025 ) ) ( not ( = ?auto_386018 ?auto_386026 ) ) ( not ( = ?auto_386018 ?auto_386027 ) ) ( not ( = ?auto_386018 ?auto_386028 ) ) ( not ( = ?auto_386019 ?auto_386020 ) ) ( not ( = ?auto_386019 ?auto_386021 ) ) ( not ( = ?auto_386019 ?auto_386022 ) ) ( not ( = ?auto_386019 ?auto_386023 ) ) ( not ( = ?auto_386019 ?auto_386024 ) ) ( not ( = ?auto_386019 ?auto_386025 ) ) ( not ( = ?auto_386019 ?auto_386026 ) ) ( not ( = ?auto_386019 ?auto_386027 ) ) ( not ( = ?auto_386019 ?auto_386028 ) ) ( not ( = ?auto_386020 ?auto_386021 ) ) ( not ( = ?auto_386020 ?auto_386022 ) ) ( not ( = ?auto_386020 ?auto_386023 ) ) ( not ( = ?auto_386020 ?auto_386024 ) ) ( not ( = ?auto_386020 ?auto_386025 ) ) ( not ( = ?auto_386020 ?auto_386026 ) ) ( not ( = ?auto_386020 ?auto_386027 ) ) ( not ( = ?auto_386020 ?auto_386028 ) ) ( not ( = ?auto_386021 ?auto_386022 ) ) ( not ( = ?auto_386021 ?auto_386023 ) ) ( not ( = ?auto_386021 ?auto_386024 ) ) ( not ( = ?auto_386021 ?auto_386025 ) ) ( not ( = ?auto_386021 ?auto_386026 ) ) ( not ( = ?auto_386021 ?auto_386027 ) ) ( not ( = ?auto_386021 ?auto_386028 ) ) ( not ( = ?auto_386022 ?auto_386023 ) ) ( not ( = ?auto_386022 ?auto_386024 ) ) ( not ( = ?auto_386022 ?auto_386025 ) ) ( not ( = ?auto_386022 ?auto_386026 ) ) ( not ( = ?auto_386022 ?auto_386027 ) ) ( not ( = ?auto_386022 ?auto_386028 ) ) ( not ( = ?auto_386023 ?auto_386024 ) ) ( not ( = ?auto_386023 ?auto_386025 ) ) ( not ( = ?auto_386023 ?auto_386026 ) ) ( not ( = ?auto_386023 ?auto_386027 ) ) ( not ( = ?auto_386023 ?auto_386028 ) ) ( not ( = ?auto_386024 ?auto_386025 ) ) ( not ( = ?auto_386024 ?auto_386026 ) ) ( not ( = ?auto_386024 ?auto_386027 ) ) ( not ( = ?auto_386024 ?auto_386028 ) ) ( not ( = ?auto_386025 ?auto_386026 ) ) ( not ( = ?auto_386025 ?auto_386027 ) ) ( not ( = ?auto_386025 ?auto_386028 ) ) ( not ( = ?auto_386026 ?auto_386027 ) ) ( not ( = ?auto_386026 ?auto_386028 ) ) ( not ( = ?auto_386027 ?auto_386028 ) ) ( ON ?auto_386026 ?auto_386027 ) ( ON ?auto_386025 ?auto_386026 ) ( ON ?auto_386024 ?auto_386025 ) ( CLEAR ?auto_386022 ) ( ON ?auto_386023 ?auto_386024 ) ( CLEAR ?auto_386023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_386013 ?auto_386014 ?auto_386015 ?auto_386016 ?auto_386017 ?auto_386018 ?auto_386019 ?auto_386020 ?auto_386021 ?auto_386022 ?auto_386023 )
      ( MAKE-15PILE ?auto_386013 ?auto_386014 ?auto_386015 ?auto_386016 ?auto_386017 ?auto_386018 ?auto_386019 ?auto_386020 ?auto_386021 ?auto_386022 ?auto_386023 ?auto_386024 ?auto_386025 ?auto_386026 ?auto_386027 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386044 - BLOCK
      ?auto_386045 - BLOCK
      ?auto_386046 - BLOCK
      ?auto_386047 - BLOCK
      ?auto_386048 - BLOCK
      ?auto_386049 - BLOCK
      ?auto_386050 - BLOCK
      ?auto_386051 - BLOCK
      ?auto_386052 - BLOCK
      ?auto_386053 - BLOCK
      ?auto_386054 - BLOCK
      ?auto_386055 - BLOCK
      ?auto_386056 - BLOCK
      ?auto_386057 - BLOCK
      ?auto_386058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386058 ) ( ON-TABLE ?auto_386044 ) ( ON ?auto_386045 ?auto_386044 ) ( ON ?auto_386046 ?auto_386045 ) ( ON ?auto_386047 ?auto_386046 ) ( ON ?auto_386048 ?auto_386047 ) ( ON ?auto_386049 ?auto_386048 ) ( ON ?auto_386050 ?auto_386049 ) ( ON ?auto_386051 ?auto_386050 ) ( ON ?auto_386052 ?auto_386051 ) ( ON ?auto_386053 ?auto_386052 ) ( not ( = ?auto_386044 ?auto_386045 ) ) ( not ( = ?auto_386044 ?auto_386046 ) ) ( not ( = ?auto_386044 ?auto_386047 ) ) ( not ( = ?auto_386044 ?auto_386048 ) ) ( not ( = ?auto_386044 ?auto_386049 ) ) ( not ( = ?auto_386044 ?auto_386050 ) ) ( not ( = ?auto_386044 ?auto_386051 ) ) ( not ( = ?auto_386044 ?auto_386052 ) ) ( not ( = ?auto_386044 ?auto_386053 ) ) ( not ( = ?auto_386044 ?auto_386054 ) ) ( not ( = ?auto_386044 ?auto_386055 ) ) ( not ( = ?auto_386044 ?auto_386056 ) ) ( not ( = ?auto_386044 ?auto_386057 ) ) ( not ( = ?auto_386044 ?auto_386058 ) ) ( not ( = ?auto_386045 ?auto_386046 ) ) ( not ( = ?auto_386045 ?auto_386047 ) ) ( not ( = ?auto_386045 ?auto_386048 ) ) ( not ( = ?auto_386045 ?auto_386049 ) ) ( not ( = ?auto_386045 ?auto_386050 ) ) ( not ( = ?auto_386045 ?auto_386051 ) ) ( not ( = ?auto_386045 ?auto_386052 ) ) ( not ( = ?auto_386045 ?auto_386053 ) ) ( not ( = ?auto_386045 ?auto_386054 ) ) ( not ( = ?auto_386045 ?auto_386055 ) ) ( not ( = ?auto_386045 ?auto_386056 ) ) ( not ( = ?auto_386045 ?auto_386057 ) ) ( not ( = ?auto_386045 ?auto_386058 ) ) ( not ( = ?auto_386046 ?auto_386047 ) ) ( not ( = ?auto_386046 ?auto_386048 ) ) ( not ( = ?auto_386046 ?auto_386049 ) ) ( not ( = ?auto_386046 ?auto_386050 ) ) ( not ( = ?auto_386046 ?auto_386051 ) ) ( not ( = ?auto_386046 ?auto_386052 ) ) ( not ( = ?auto_386046 ?auto_386053 ) ) ( not ( = ?auto_386046 ?auto_386054 ) ) ( not ( = ?auto_386046 ?auto_386055 ) ) ( not ( = ?auto_386046 ?auto_386056 ) ) ( not ( = ?auto_386046 ?auto_386057 ) ) ( not ( = ?auto_386046 ?auto_386058 ) ) ( not ( = ?auto_386047 ?auto_386048 ) ) ( not ( = ?auto_386047 ?auto_386049 ) ) ( not ( = ?auto_386047 ?auto_386050 ) ) ( not ( = ?auto_386047 ?auto_386051 ) ) ( not ( = ?auto_386047 ?auto_386052 ) ) ( not ( = ?auto_386047 ?auto_386053 ) ) ( not ( = ?auto_386047 ?auto_386054 ) ) ( not ( = ?auto_386047 ?auto_386055 ) ) ( not ( = ?auto_386047 ?auto_386056 ) ) ( not ( = ?auto_386047 ?auto_386057 ) ) ( not ( = ?auto_386047 ?auto_386058 ) ) ( not ( = ?auto_386048 ?auto_386049 ) ) ( not ( = ?auto_386048 ?auto_386050 ) ) ( not ( = ?auto_386048 ?auto_386051 ) ) ( not ( = ?auto_386048 ?auto_386052 ) ) ( not ( = ?auto_386048 ?auto_386053 ) ) ( not ( = ?auto_386048 ?auto_386054 ) ) ( not ( = ?auto_386048 ?auto_386055 ) ) ( not ( = ?auto_386048 ?auto_386056 ) ) ( not ( = ?auto_386048 ?auto_386057 ) ) ( not ( = ?auto_386048 ?auto_386058 ) ) ( not ( = ?auto_386049 ?auto_386050 ) ) ( not ( = ?auto_386049 ?auto_386051 ) ) ( not ( = ?auto_386049 ?auto_386052 ) ) ( not ( = ?auto_386049 ?auto_386053 ) ) ( not ( = ?auto_386049 ?auto_386054 ) ) ( not ( = ?auto_386049 ?auto_386055 ) ) ( not ( = ?auto_386049 ?auto_386056 ) ) ( not ( = ?auto_386049 ?auto_386057 ) ) ( not ( = ?auto_386049 ?auto_386058 ) ) ( not ( = ?auto_386050 ?auto_386051 ) ) ( not ( = ?auto_386050 ?auto_386052 ) ) ( not ( = ?auto_386050 ?auto_386053 ) ) ( not ( = ?auto_386050 ?auto_386054 ) ) ( not ( = ?auto_386050 ?auto_386055 ) ) ( not ( = ?auto_386050 ?auto_386056 ) ) ( not ( = ?auto_386050 ?auto_386057 ) ) ( not ( = ?auto_386050 ?auto_386058 ) ) ( not ( = ?auto_386051 ?auto_386052 ) ) ( not ( = ?auto_386051 ?auto_386053 ) ) ( not ( = ?auto_386051 ?auto_386054 ) ) ( not ( = ?auto_386051 ?auto_386055 ) ) ( not ( = ?auto_386051 ?auto_386056 ) ) ( not ( = ?auto_386051 ?auto_386057 ) ) ( not ( = ?auto_386051 ?auto_386058 ) ) ( not ( = ?auto_386052 ?auto_386053 ) ) ( not ( = ?auto_386052 ?auto_386054 ) ) ( not ( = ?auto_386052 ?auto_386055 ) ) ( not ( = ?auto_386052 ?auto_386056 ) ) ( not ( = ?auto_386052 ?auto_386057 ) ) ( not ( = ?auto_386052 ?auto_386058 ) ) ( not ( = ?auto_386053 ?auto_386054 ) ) ( not ( = ?auto_386053 ?auto_386055 ) ) ( not ( = ?auto_386053 ?auto_386056 ) ) ( not ( = ?auto_386053 ?auto_386057 ) ) ( not ( = ?auto_386053 ?auto_386058 ) ) ( not ( = ?auto_386054 ?auto_386055 ) ) ( not ( = ?auto_386054 ?auto_386056 ) ) ( not ( = ?auto_386054 ?auto_386057 ) ) ( not ( = ?auto_386054 ?auto_386058 ) ) ( not ( = ?auto_386055 ?auto_386056 ) ) ( not ( = ?auto_386055 ?auto_386057 ) ) ( not ( = ?auto_386055 ?auto_386058 ) ) ( not ( = ?auto_386056 ?auto_386057 ) ) ( not ( = ?auto_386056 ?auto_386058 ) ) ( not ( = ?auto_386057 ?auto_386058 ) ) ( ON ?auto_386057 ?auto_386058 ) ( ON ?auto_386056 ?auto_386057 ) ( ON ?auto_386055 ?auto_386056 ) ( CLEAR ?auto_386053 ) ( ON ?auto_386054 ?auto_386055 ) ( CLEAR ?auto_386054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_386044 ?auto_386045 ?auto_386046 ?auto_386047 ?auto_386048 ?auto_386049 ?auto_386050 ?auto_386051 ?auto_386052 ?auto_386053 ?auto_386054 )
      ( MAKE-15PILE ?auto_386044 ?auto_386045 ?auto_386046 ?auto_386047 ?auto_386048 ?auto_386049 ?auto_386050 ?auto_386051 ?auto_386052 ?auto_386053 ?auto_386054 ?auto_386055 ?auto_386056 ?auto_386057 ?auto_386058 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386074 - BLOCK
      ?auto_386075 - BLOCK
      ?auto_386076 - BLOCK
      ?auto_386077 - BLOCK
      ?auto_386078 - BLOCK
      ?auto_386079 - BLOCK
      ?auto_386080 - BLOCK
      ?auto_386081 - BLOCK
      ?auto_386082 - BLOCK
      ?auto_386083 - BLOCK
      ?auto_386084 - BLOCK
      ?auto_386085 - BLOCK
      ?auto_386086 - BLOCK
      ?auto_386087 - BLOCK
      ?auto_386088 - BLOCK
    )
    :vars
    (
      ?auto_386089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386088 ?auto_386089 ) ( ON-TABLE ?auto_386074 ) ( ON ?auto_386075 ?auto_386074 ) ( ON ?auto_386076 ?auto_386075 ) ( ON ?auto_386077 ?auto_386076 ) ( ON ?auto_386078 ?auto_386077 ) ( ON ?auto_386079 ?auto_386078 ) ( ON ?auto_386080 ?auto_386079 ) ( ON ?auto_386081 ?auto_386080 ) ( ON ?auto_386082 ?auto_386081 ) ( not ( = ?auto_386074 ?auto_386075 ) ) ( not ( = ?auto_386074 ?auto_386076 ) ) ( not ( = ?auto_386074 ?auto_386077 ) ) ( not ( = ?auto_386074 ?auto_386078 ) ) ( not ( = ?auto_386074 ?auto_386079 ) ) ( not ( = ?auto_386074 ?auto_386080 ) ) ( not ( = ?auto_386074 ?auto_386081 ) ) ( not ( = ?auto_386074 ?auto_386082 ) ) ( not ( = ?auto_386074 ?auto_386083 ) ) ( not ( = ?auto_386074 ?auto_386084 ) ) ( not ( = ?auto_386074 ?auto_386085 ) ) ( not ( = ?auto_386074 ?auto_386086 ) ) ( not ( = ?auto_386074 ?auto_386087 ) ) ( not ( = ?auto_386074 ?auto_386088 ) ) ( not ( = ?auto_386074 ?auto_386089 ) ) ( not ( = ?auto_386075 ?auto_386076 ) ) ( not ( = ?auto_386075 ?auto_386077 ) ) ( not ( = ?auto_386075 ?auto_386078 ) ) ( not ( = ?auto_386075 ?auto_386079 ) ) ( not ( = ?auto_386075 ?auto_386080 ) ) ( not ( = ?auto_386075 ?auto_386081 ) ) ( not ( = ?auto_386075 ?auto_386082 ) ) ( not ( = ?auto_386075 ?auto_386083 ) ) ( not ( = ?auto_386075 ?auto_386084 ) ) ( not ( = ?auto_386075 ?auto_386085 ) ) ( not ( = ?auto_386075 ?auto_386086 ) ) ( not ( = ?auto_386075 ?auto_386087 ) ) ( not ( = ?auto_386075 ?auto_386088 ) ) ( not ( = ?auto_386075 ?auto_386089 ) ) ( not ( = ?auto_386076 ?auto_386077 ) ) ( not ( = ?auto_386076 ?auto_386078 ) ) ( not ( = ?auto_386076 ?auto_386079 ) ) ( not ( = ?auto_386076 ?auto_386080 ) ) ( not ( = ?auto_386076 ?auto_386081 ) ) ( not ( = ?auto_386076 ?auto_386082 ) ) ( not ( = ?auto_386076 ?auto_386083 ) ) ( not ( = ?auto_386076 ?auto_386084 ) ) ( not ( = ?auto_386076 ?auto_386085 ) ) ( not ( = ?auto_386076 ?auto_386086 ) ) ( not ( = ?auto_386076 ?auto_386087 ) ) ( not ( = ?auto_386076 ?auto_386088 ) ) ( not ( = ?auto_386076 ?auto_386089 ) ) ( not ( = ?auto_386077 ?auto_386078 ) ) ( not ( = ?auto_386077 ?auto_386079 ) ) ( not ( = ?auto_386077 ?auto_386080 ) ) ( not ( = ?auto_386077 ?auto_386081 ) ) ( not ( = ?auto_386077 ?auto_386082 ) ) ( not ( = ?auto_386077 ?auto_386083 ) ) ( not ( = ?auto_386077 ?auto_386084 ) ) ( not ( = ?auto_386077 ?auto_386085 ) ) ( not ( = ?auto_386077 ?auto_386086 ) ) ( not ( = ?auto_386077 ?auto_386087 ) ) ( not ( = ?auto_386077 ?auto_386088 ) ) ( not ( = ?auto_386077 ?auto_386089 ) ) ( not ( = ?auto_386078 ?auto_386079 ) ) ( not ( = ?auto_386078 ?auto_386080 ) ) ( not ( = ?auto_386078 ?auto_386081 ) ) ( not ( = ?auto_386078 ?auto_386082 ) ) ( not ( = ?auto_386078 ?auto_386083 ) ) ( not ( = ?auto_386078 ?auto_386084 ) ) ( not ( = ?auto_386078 ?auto_386085 ) ) ( not ( = ?auto_386078 ?auto_386086 ) ) ( not ( = ?auto_386078 ?auto_386087 ) ) ( not ( = ?auto_386078 ?auto_386088 ) ) ( not ( = ?auto_386078 ?auto_386089 ) ) ( not ( = ?auto_386079 ?auto_386080 ) ) ( not ( = ?auto_386079 ?auto_386081 ) ) ( not ( = ?auto_386079 ?auto_386082 ) ) ( not ( = ?auto_386079 ?auto_386083 ) ) ( not ( = ?auto_386079 ?auto_386084 ) ) ( not ( = ?auto_386079 ?auto_386085 ) ) ( not ( = ?auto_386079 ?auto_386086 ) ) ( not ( = ?auto_386079 ?auto_386087 ) ) ( not ( = ?auto_386079 ?auto_386088 ) ) ( not ( = ?auto_386079 ?auto_386089 ) ) ( not ( = ?auto_386080 ?auto_386081 ) ) ( not ( = ?auto_386080 ?auto_386082 ) ) ( not ( = ?auto_386080 ?auto_386083 ) ) ( not ( = ?auto_386080 ?auto_386084 ) ) ( not ( = ?auto_386080 ?auto_386085 ) ) ( not ( = ?auto_386080 ?auto_386086 ) ) ( not ( = ?auto_386080 ?auto_386087 ) ) ( not ( = ?auto_386080 ?auto_386088 ) ) ( not ( = ?auto_386080 ?auto_386089 ) ) ( not ( = ?auto_386081 ?auto_386082 ) ) ( not ( = ?auto_386081 ?auto_386083 ) ) ( not ( = ?auto_386081 ?auto_386084 ) ) ( not ( = ?auto_386081 ?auto_386085 ) ) ( not ( = ?auto_386081 ?auto_386086 ) ) ( not ( = ?auto_386081 ?auto_386087 ) ) ( not ( = ?auto_386081 ?auto_386088 ) ) ( not ( = ?auto_386081 ?auto_386089 ) ) ( not ( = ?auto_386082 ?auto_386083 ) ) ( not ( = ?auto_386082 ?auto_386084 ) ) ( not ( = ?auto_386082 ?auto_386085 ) ) ( not ( = ?auto_386082 ?auto_386086 ) ) ( not ( = ?auto_386082 ?auto_386087 ) ) ( not ( = ?auto_386082 ?auto_386088 ) ) ( not ( = ?auto_386082 ?auto_386089 ) ) ( not ( = ?auto_386083 ?auto_386084 ) ) ( not ( = ?auto_386083 ?auto_386085 ) ) ( not ( = ?auto_386083 ?auto_386086 ) ) ( not ( = ?auto_386083 ?auto_386087 ) ) ( not ( = ?auto_386083 ?auto_386088 ) ) ( not ( = ?auto_386083 ?auto_386089 ) ) ( not ( = ?auto_386084 ?auto_386085 ) ) ( not ( = ?auto_386084 ?auto_386086 ) ) ( not ( = ?auto_386084 ?auto_386087 ) ) ( not ( = ?auto_386084 ?auto_386088 ) ) ( not ( = ?auto_386084 ?auto_386089 ) ) ( not ( = ?auto_386085 ?auto_386086 ) ) ( not ( = ?auto_386085 ?auto_386087 ) ) ( not ( = ?auto_386085 ?auto_386088 ) ) ( not ( = ?auto_386085 ?auto_386089 ) ) ( not ( = ?auto_386086 ?auto_386087 ) ) ( not ( = ?auto_386086 ?auto_386088 ) ) ( not ( = ?auto_386086 ?auto_386089 ) ) ( not ( = ?auto_386087 ?auto_386088 ) ) ( not ( = ?auto_386087 ?auto_386089 ) ) ( not ( = ?auto_386088 ?auto_386089 ) ) ( ON ?auto_386087 ?auto_386088 ) ( ON ?auto_386086 ?auto_386087 ) ( ON ?auto_386085 ?auto_386086 ) ( ON ?auto_386084 ?auto_386085 ) ( CLEAR ?auto_386082 ) ( ON ?auto_386083 ?auto_386084 ) ( CLEAR ?auto_386083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_386074 ?auto_386075 ?auto_386076 ?auto_386077 ?auto_386078 ?auto_386079 ?auto_386080 ?auto_386081 ?auto_386082 ?auto_386083 )
      ( MAKE-15PILE ?auto_386074 ?auto_386075 ?auto_386076 ?auto_386077 ?auto_386078 ?auto_386079 ?auto_386080 ?auto_386081 ?auto_386082 ?auto_386083 ?auto_386084 ?auto_386085 ?auto_386086 ?auto_386087 ?auto_386088 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386105 - BLOCK
      ?auto_386106 - BLOCK
      ?auto_386107 - BLOCK
      ?auto_386108 - BLOCK
      ?auto_386109 - BLOCK
      ?auto_386110 - BLOCK
      ?auto_386111 - BLOCK
      ?auto_386112 - BLOCK
      ?auto_386113 - BLOCK
      ?auto_386114 - BLOCK
      ?auto_386115 - BLOCK
      ?auto_386116 - BLOCK
      ?auto_386117 - BLOCK
      ?auto_386118 - BLOCK
      ?auto_386119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386119 ) ( ON-TABLE ?auto_386105 ) ( ON ?auto_386106 ?auto_386105 ) ( ON ?auto_386107 ?auto_386106 ) ( ON ?auto_386108 ?auto_386107 ) ( ON ?auto_386109 ?auto_386108 ) ( ON ?auto_386110 ?auto_386109 ) ( ON ?auto_386111 ?auto_386110 ) ( ON ?auto_386112 ?auto_386111 ) ( ON ?auto_386113 ?auto_386112 ) ( not ( = ?auto_386105 ?auto_386106 ) ) ( not ( = ?auto_386105 ?auto_386107 ) ) ( not ( = ?auto_386105 ?auto_386108 ) ) ( not ( = ?auto_386105 ?auto_386109 ) ) ( not ( = ?auto_386105 ?auto_386110 ) ) ( not ( = ?auto_386105 ?auto_386111 ) ) ( not ( = ?auto_386105 ?auto_386112 ) ) ( not ( = ?auto_386105 ?auto_386113 ) ) ( not ( = ?auto_386105 ?auto_386114 ) ) ( not ( = ?auto_386105 ?auto_386115 ) ) ( not ( = ?auto_386105 ?auto_386116 ) ) ( not ( = ?auto_386105 ?auto_386117 ) ) ( not ( = ?auto_386105 ?auto_386118 ) ) ( not ( = ?auto_386105 ?auto_386119 ) ) ( not ( = ?auto_386106 ?auto_386107 ) ) ( not ( = ?auto_386106 ?auto_386108 ) ) ( not ( = ?auto_386106 ?auto_386109 ) ) ( not ( = ?auto_386106 ?auto_386110 ) ) ( not ( = ?auto_386106 ?auto_386111 ) ) ( not ( = ?auto_386106 ?auto_386112 ) ) ( not ( = ?auto_386106 ?auto_386113 ) ) ( not ( = ?auto_386106 ?auto_386114 ) ) ( not ( = ?auto_386106 ?auto_386115 ) ) ( not ( = ?auto_386106 ?auto_386116 ) ) ( not ( = ?auto_386106 ?auto_386117 ) ) ( not ( = ?auto_386106 ?auto_386118 ) ) ( not ( = ?auto_386106 ?auto_386119 ) ) ( not ( = ?auto_386107 ?auto_386108 ) ) ( not ( = ?auto_386107 ?auto_386109 ) ) ( not ( = ?auto_386107 ?auto_386110 ) ) ( not ( = ?auto_386107 ?auto_386111 ) ) ( not ( = ?auto_386107 ?auto_386112 ) ) ( not ( = ?auto_386107 ?auto_386113 ) ) ( not ( = ?auto_386107 ?auto_386114 ) ) ( not ( = ?auto_386107 ?auto_386115 ) ) ( not ( = ?auto_386107 ?auto_386116 ) ) ( not ( = ?auto_386107 ?auto_386117 ) ) ( not ( = ?auto_386107 ?auto_386118 ) ) ( not ( = ?auto_386107 ?auto_386119 ) ) ( not ( = ?auto_386108 ?auto_386109 ) ) ( not ( = ?auto_386108 ?auto_386110 ) ) ( not ( = ?auto_386108 ?auto_386111 ) ) ( not ( = ?auto_386108 ?auto_386112 ) ) ( not ( = ?auto_386108 ?auto_386113 ) ) ( not ( = ?auto_386108 ?auto_386114 ) ) ( not ( = ?auto_386108 ?auto_386115 ) ) ( not ( = ?auto_386108 ?auto_386116 ) ) ( not ( = ?auto_386108 ?auto_386117 ) ) ( not ( = ?auto_386108 ?auto_386118 ) ) ( not ( = ?auto_386108 ?auto_386119 ) ) ( not ( = ?auto_386109 ?auto_386110 ) ) ( not ( = ?auto_386109 ?auto_386111 ) ) ( not ( = ?auto_386109 ?auto_386112 ) ) ( not ( = ?auto_386109 ?auto_386113 ) ) ( not ( = ?auto_386109 ?auto_386114 ) ) ( not ( = ?auto_386109 ?auto_386115 ) ) ( not ( = ?auto_386109 ?auto_386116 ) ) ( not ( = ?auto_386109 ?auto_386117 ) ) ( not ( = ?auto_386109 ?auto_386118 ) ) ( not ( = ?auto_386109 ?auto_386119 ) ) ( not ( = ?auto_386110 ?auto_386111 ) ) ( not ( = ?auto_386110 ?auto_386112 ) ) ( not ( = ?auto_386110 ?auto_386113 ) ) ( not ( = ?auto_386110 ?auto_386114 ) ) ( not ( = ?auto_386110 ?auto_386115 ) ) ( not ( = ?auto_386110 ?auto_386116 ) ) ( not ( = ?auto_386110 ?auto_386117 ) ) ( not ( = ?auto_386110 ?auto_386118 ) ) ( not ( = ?auto_386110 ?auto_386119 ) ) ( not ( = ?auto_386111 ?auto_386112 ) ) ( not ( = ?auto_386111 ?auto_386113 ) ) ( not ( = ?auto_386111 ?auto_386114 ) ) ( not ( = ?auto_386111 ?auto_386115 ) ) ( not ( = ?auto_386111 ?auto_386116 ) ) ( not ( = ?auto_386111 ?auto_386117 ) ) ( not ( = ?auto_386111 ?auto_386118 ) ) ( not ( = ?auto_386111 ?auto_386119 ) ) ( not ( = ?auto_386112 ?auto_386113 ) ) ( not ( = ?auto_386112 ?auto_386114 ) ) ( not ( = ?auto_386112 ?auto_386115 ) ) ( not ( = ?auto_386112 ?auto_386116 ) ) ( not ( = ?auto_386112 ?auto_386117 ) ) ( not ( = ?auto_386112 ?auto_386118 ) ) ( not ( = ?auto_386112 ?auto_386119 ) ) ( not ( = ?auto_386113 ?auto_386114 ) ) ( not ( = ?auto_386113 ?auto_386115 ) ) ( not ( = ?auto_386113 ?auto_386116 ) ) ( not ( = ?auto_386113 ?auto_386117 ) ) ( not ( = ?auto_386113 ?auto_386118 ) ) ( not ( = ?auto_386113 ?auto_386119 ) ) ( not ( = ?auto_386114 ?auto_386115 ) ) ( not ( = ?auto_386114 ?auto_386116 ) ) ( not ( = ?auto_386114 ?auto_386117 ) ) ( not ( = ?auto_386114 ?auto_386118 ) ) ( not ( = ?auto_386114 ?auto_386119 ) ) ( not ( = ?auto_386115 ?auto_386116 ) ) ( not ( = ?auto_386115 ?auto_386117 ) ) ( not ( = ?auto_386115 ?auto_386118 ) ) ( not ( = ?auto_386115 ?auto_386119 ) ) ( not ( = ?auto_386116 ?auto_386117 ) ) ( not ( = ?auto_386116 ?auto_386118 ) ) ( not ( = ?auto_386116 ?auto_386119 ) ) ( not ( = ?auto_386117 ?auto_386118 ) ) ( not ( = ?auto_386117 ?auto_386119 ) ) ( not ( = ?auto_386118 ?auto_386119 ) ) ( ON ?auto_386118 ?auto_386119 ) ( ON ?auto_386117 ?auto_386118 ) ( ON ?auto_386116 ?auto_386117 ) ( ON ?auto_386115 ?auto_386116 ) ( CLEAR ?auto_386113 ) ( ON ?auto_386114 ?auto_386115 ) ( CLEAR ?auto_386114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_386105 ?auto_386106 ?auto_386107 ?auto_386108 ?auto_386109 ?auto_386110 ?auto_386111 ?auto_386112 ?auto_386113 ?auto_386114 )
      ( MAKE-15PILE ?auto_386105 ?auto_386106 ?auto_386107 ?auto_386108 ?auto_386109 ?auto_386110 ?auto_386111 ?auto_386112 ?auto_386113 ?auto_386114 ?auto_386115 ?auto_386116 ?auto_386117 ?auto_386118 ?auto_386119 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386135 - BLOCK
      ?auto_386136 - BLOCK
      ?auto_386137 - BLOCK
      ?auto_386138 - BLOCK
      ?auto_386139 - BLOCK
      ?auto_386140 - BLOCK
      ?auto_386141 - BLOCK
      ?auto_386142 - BLOCK
      ?auto_386143 - BLOCK
      ?auto_386144 - BLOCK
      ?auto_386145 - BLOCK
      ?auto_386146 - BLOCK
      ?auto_386147 - BLOCK
      ?auto_386148 - BLOCK
      ?auto_386149 - BLOCK
    )
    :vars
    (
      ?auto_386150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386149 ?auto_386150 ) ( ON-TABLE ?auto_386135 ) ( ON ?auto_386136 ?auto_386135 ) ( ON ?auto_386137 ?auto_386136 ) ( ON ?auto_386138 ?auto_386137 ) ( ON ?auto_386139 ?auto_386138 ) ( ON ?auto_386140 ?auto_386139 ) ( ON ?auto_386141 ?auto_386140 ) ( ON ?auto_386142 ?auto_386141 ) ( not ( = ?auto_386135 ?auto_386136 ) ) ( not ( = ?auto_386135 ?auto_386137 ) ) ( not ( = ?auto_386135 ?auto_386138 ) ) ( not ( = ?auto_386135 ?auto_386139 ) ) ( not ( = ?auto_386135 ?auto_386140 ) ) ( not ( = ?auto_386135 ?auto_386141 ) ) ( not ( = ?auto_386135 ?auto_386142 ) ) ( not ( = ?auto_386135 ?auto_386143 ) ) ( not ( = ?auto_386135 ?auto_386144 ) ) ( not ( = ?auto_386135 ?auto_386145 ) ) ( not ( = ?auto_386135 ?auto_386146 ) ) ( not ( = ?auto_386135 ?auto_386147 ) ) ( not ( = ?auto_386135 ?auto_386148 ) ) ( not ( = ?auto_386135 ?auto_386149 ) ) ( not ( = ?auto_386135 ?auto_386150 ) ) ( not ( = ?auto_386136 ?auto_386137 ) ) ( not ( = ?auto_386136 ?auto_386138 ) ) ( not ( = ?auto_386136 ?auto_386139 ) ) ( not ( = ?auto_386136 ?auto_386140 ) ) ( not ( = ?auto_386136 ?auto_386141 ) ) ( not ( = ?auto_386136 ?auto_386142 ) ) ( not ( = ?auto_386136 ?auto_386143 ) ) ( not ( = ?auto_386136 ?auto_386144 ) ) ( not ( = ?auto_386136 ?auto_386145 ) ) ( not ( = ?auto_386136 ?auto_386146 ) ) ( not ( = ?auto_386136 ?auto_386147 ) ) ( not ( = ?auto_386136 ?auto_386148 ) ) ( not ( = ?auto_386136 ?auto_386149 ) ) ( not ( = ?auto_386136 ?auto_386150 ) ) ( not ( = ?auto_386137 ?auto_386138 ) ) ( not ( = ?auto_386137 ?auto_386139 ) ) ( not ( = ?auto_386137 ?auto_386140 ) ) ( not ( = ?auto_386137 ?auto_386141 ) ) ( not ( = ?auto_386137 ?auto_386142 ) ) ( not ( = ?auto_386137 ?auto_386143 ) ) ( not ( = ?auto_386137 ?auto_386144 ) ) ( not ( = ?auto_386137 ?auto_386145 ) ) ( not ( = ?auto_386137 ?auto_386146 ) ) ( not ( = ?auto_386137 ?auto_386147 ) ) ( not ( = ?auto_386137 ?auto_386148 ) ) ( not ( = ?auto_386137 ?auto_386149 ) ) ( not ( = ?auto_386137 ?auto_386150 ) ) ( not ( = ?auto_386138 ?auto_386139 ) ) ( not ( = ?auto_386138 ?auto_386140 ) ) ( not ( = ?auto_386138 ?auto_386141 ) ) ( not ( = ?auto_386138 ?auto_386142 ) ) ( not ( = ?auto_386138 ?auto_386143 ) ) ( not ( = ?auto_386138 ?auto_386144 ) ) ( not ( = ?auto_386138 ?auto_386145 ) ) ( not ( = ?auto_386138 ?auto_386146 ) ) ( not ( = ?auto_386138 ?auto_386147 ) ) ( not ( = ?auto_386138 ?auto_386148 ) ) ( not ( = ?auto_386138 ?auto_386149 ) ) ( not ( = ?auto_386138 ?auto_386150 ) ) ( not ( = ?auto_386139 ?auto_386140 ) ) ( not ( = ?auto_386139 ?auto_386141 ) ) ( not ( = ?auto_386139 ?auto_386142 ) ) ( not ( = ?auto_386139 ?auto_386143 ) ) ( not ( = ?auto_386139 ?auto_386144 ) ) ( not ( = ?auto_386139 ?auto_386145 ) ) ( not ( = ?auto_386139 ?auto_386146 ) ) ( not ( = ?auto_386139 ?auto_386147 ) ) ( not ( = ?auto_386139 ?auto_386148 ) ) ( not ( = ?auto_386139 ?auto_386149 ) ) ( not ( = ?auto_386139 ?auto_386150 ) ) ( not ( = ?auto_386140 ?auto_386141 ) ) ( not ( = ?auto_386140 ?auto_386142 ) ) ( not ( = ?auto_386140 ?auto_386143 ) ) ( not ( = ?auto_386140 ?auto_386144 ) ) ( not ( = ?auto_386140 ?auto_386145 ) ) ( not ( = ?auto_386140 ?auto_386146 ) ) ( not ( = ?auto_386140 ?auto_386147 ) ) ( not ( = ?auto_386140 ?auto_386148 ) ) ( not ( = ?auto_386140 ?auto_386149 ) ) ( not ( = ?auto_386140 ?auto_386150 ) ) ( not ( = ?auto_386141 ?auto_386142 ) ) ( not ( = ?auto_386141 ?auto_386143 ) ) ( not ( = ?auto_386141 ?auto_386144 ) ) ( not ( = ?auto_386141 ?auto_386145 ) ) ( not ( = ?auto_386141 ?auto_386146 ) ) ( not ( = ?auto_386141 ?auto_386147 ) ) ( not ( = ?auto_386141 ?auto_386148 ) ) ( not ( = ?auto_386141 ?auto_386149 ) ) ( not ( = ?auto_386141 ?auto_386150 ) ) ( not ( = ?auto_386142 ?auto_386143 ) ) ( not ( = ?auto_386142 ?auto_386144 ) ) ( not ( = ?auto_386142 ?auto_386145 ) ) ( not ( = ?auto_386142 ?auto_386146 ) ) ( not ( = ?auto_386142 ?auto_386147 ) ) ( not ( = ?auto_386142 ?auto_386148 ) ) ( not ( = ?auto_386142 ?auto_386149 ) ) ( not ( = ?auto_386142 ?auto_386150 ) ) ( not ( = ?auto_386143 ?auto_386144 ) ) ( not ( = ?auto_386143 ?auto_386145 ) ) ( not ( = ?auto_386143 ?auto_386146 ) ) ( not ( = ?auto_386143 ?auto_386147 ) ) ( not ( = ?auto_386143 ?auto_386148 ) ) ( not ( = ?auto_386143 ?auto_386149 ) ) ( not ( = ?auto_386143 ?auto_386150 ) ) ( not ( = ?auto_386144 ?auto_386145 ) ) ( not ( = ?auto_386144 ?auto_386146 ) ) ( not ( = ?auto_386144 ?auto_386147 ) ) ( not ( = ?auto_386144 ?auto_386148 ) ) ( not ( = ?auto_386144 ?auto_386149 ) ) ( not ( = ?auto_386144 ?auto_386150 ) ) ( not ( = ?auto_386145 ?auto_386146 ) ) ( not ( = ?auto_386145 ?auto_386147 ) ) ( not ( = ?auto_386145 ?auto_386148 ) ) ( not ( = ?auto_386145 ?auto_386149 ) ) ( not ( = ?auto_386145 ?auto_386150 ) ) ( not ( = ?auto_386146 ?auto_386147 ) ) ( not ( = ?auto_386146 ?auto_386148 ) ) ( not ( = ?auto_386146 ?auto_386149 ) ) ( not ( = ?auto_386146 ?auto_386150 ) ) ( not ( = ?auto_386147 ?auto_386148 ) ) ( not ( = ?auto_386147 ?auto_386149 ) ) ( not ( = ?auto_386147 ?auto_386150 ) ) ( not ( = ?auto_386148 ?auto_386149 ) ) ( not ( = ?auto_386148 ?auto_386150 ) ) ( not ( = ?auto_386149 ?auto_386150 ) ) ( ON ?auto_386148 ?auto_386149 ) ( ON ?auto_386147 ?auto_386148 ) ( ON ?auto_386146 ?auto_386147 ) ( ON ?auto_386145 ?auto_386146 ) ( ON ?auto_386144 ?auto_386145 ) ( CLEAR ?auto_386142 ) ( ON ?auto_386143 ?auto_386144 ) ( CLEAR ?auto_386143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_386135 ?auto_386136 ?auto_386137 ?auto_386138 ?auto_386139 ?auto_386140 ?auto_386141 ?auto_386142 ?auto_386143 )
      ( MAKE-15PILE ?auto_386135 ?auto_386136 ?auto_386137 ?auto_386138 ?auto_386139 ?auto_386140 ?auto_386141 ?auto_386142 ?auto_386143 ?auto_386144 ?auto_386145 ?auto_386146 ?auto_386147 ?auto_386148 ?auto_386149 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386166 - BLOCK
      ?auto_386167 - BLOCK
      ?auto_386168 - BLOCK
      ?auto_386169 - BLOCK
      ?auto_386170 - BLOCK
      ?auto_386171 - BLOCK
      ?auto_386172 - BLOCK
      ?auto_386173 - BLOCK
      ?auto_386174 - BLOCK
      ?auto_386175 - BLOCK
      ?auto_386176 - BLOCK
      ?auto_386177 - BLOCK
      ?auto_386178 - BLOCK
      ?auto_386179 - BLOCK
      ?auto_386180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386180 ) ( ON-TABLE ?auto_386166 ) ( ON ?auto_386167 ?auto_386166 ) ( ON ?auto_386168 ?auto_386167 ) ( ON ?auto_386169 ?auto_386168 ) ( ON ?auto_386170 ?auto_386169 ) ( ON ?auto_386171 ?auto_386170 ) ( ON ?auto_386172 ?auto_386171 ) ( ON ?auto_386173 ?auto_386172 ) ( not ( = ?auto_386166 ?auto_386167 ) ) ( not ( = ?auto_386166 ?auto_386168 ) ) ( not ( = ?auto_386166 ?auto_386169 ) ) ( not ( = ?auto_386166 ?auto_386170 ) ) ( not ( = ?auto_386166 ?auto_386171 ) ) ( not ( = ?auto_386166 ?auto_386172 ) ) ( not ( = ?auto_386166 ?auto_386173 ) ) ( not ( = ?auto_386166 ?auto_386174 ) ) ( not ( = ?auto_386166 ?auto_386175 ) ) ( not ( = ?auto_386166 ?auto_386176 ) ) ( not ( = ?auto_386166 ?auto_386177 ) ) ( not ( = ?auto_386166 ?auto_386178 ) ) ( not ( = ?auto_386166 ?auto_386179 ) ) ( not ( = ?auto_386166 ?auto_386180 ) ) ( not ( = ?auto_386167 ?auto_386168 ) ) ( not ( = ?auto_386167 ?auto_386169 ) ) ( not ( = ?auto_386167 ?auto_386170 ) ) ( not ( = ?auto_386167 ?auto_386171 ) ) ( not ( = ?auto_386167 ?auto_386172 ) ) ( not ( = ?auto_386167 ?auto_386173 ) ) ( not ( = ?auto_386167 ?auto_386174 ) ) ( not ( = ?auto_386167 ?auto_386175 ) ) ( not ( = ?auto_386167 ?auto_386176 ) ) ( not ( = ?auto_386167 ?auto_386177 ) ) ( not ( = ?auto_386167 ?auto_386178 ) ) ( not ( = ?auto_386167 ?auto_386179 ) ) ( not ( = ?auto_386167 ?auto_386180 ) ) ( not ( = ?auto_386168 ?auto_386169 ) ) ( not ( = ?auto_386168 ?auto_386170 ) ) ( not ( = ?auto_386168 ?auto_386171 ) ) ( not ( = ?auto_386168 ?auto_386172 ) ) ( not ( = ?auto_386168 ?auto_386173 ) ) ( not ( = ?auto_386168 ?auto_386174 ) ) ( not ( = ?auto_386168 ?auto_386175 ) ) ( not ( = ?auto_386168 ?auto_386176 ) ) ( not ( = ?auto_386168 ?auto_386177 ) ) ( not ( = ?auto_386168 ?auto_386178 ) ) ( not ( = ?auto_386168 ?auto_386179 ) ) ( not ( = ?auto_386168 ?auto_386180 ) ) ( not ( = ?auto_386169 ?auto_386170 ) ) ( not ( = ?auto_386169 ?auto_386171 ) ) ( not ( = ?auto_386169 ?auto_386172 ) ) ( not ( = ?auto_386169 ?auto_386173 ) ) ( not ( = ?auto_386169 ?auto_386174 ) ) ( not ( = ?auto_386169 ?auto_386175 ) ) ( not ( = ?auto_386169 ?auto_386176 ) ) ( not ( = ?auto_386169 ?auto_386177 ) ) ( not ( = ?auto_386169 ?auto_386178 ) ) ( not ( = ?auto_386169 ?auto_386179 ) ) ( not ( = ?auto_386169 ?auto_386180 ) ) ( not ( = ?auto_386170 ?auto_386171 ) ) ( not ( = ?auto_386170 ?auto_386172 ) ) ( not ( = ?auto_386170 ?auto_386173 ) ) ( not ( = ?auto_386170 ?auto_386174 ) ) ( not ( = ?auto_386170 ?auto_386175 ) ) ( not ( = ?auto_386170 ?auto_386176 ) ) ( not ( = ?auto_386170 ?auto_386177 ) ) ( not ( = ?auto_386170 ?auto_386178 ) ) ( not ( = ?auto_386170 ?auto_386179 ) ) ( not ( = ?auto_386170 ?auto_386180 ) ) ( not ( = ?auto_386171 ?auto_386172 ) ) ( not ( = ?auto_386171 ?auto_386173 ) ) ( not ( = ?auto_386171 ?auto_386174 ) ) ( not ( = ?auto_386171 ?auto_386175 ) ) ( not ( = ?auto_386171 ?auto_386176 ) ) ( not ( = ?auto_386171 ?auto_386177 ) ) ( not ( = ?auto_386171 ?auto_386178 ) ) ( not ( = ?auto_386171 ?auto_386179 ) ) ( not ( = ?auto_386171 ?auto_386180 ) ) ( not ( = ?auto_386172 ?auto_386173 ) ) ( not ( = ?auto_386172 ?auto_386174 ) ) ( not ( = ?auto_386172 ?auto_386175 ) ) ( not ( = ?auto_386172 ?auto_386176 ) ) ( not ( = ?auto_386172 ?auto_386177 ) ) ( not ( = ?auto_386172 ?auto_386178 ) ) ( not ( = ?auto_386172 ?auto_386179 ) ) ( not ( = ?auto_386172 ?auto_386180 ) ) ( not ( = ?auto_386173 ?auto_386174 ) ) ( not ( = ?auto_386173 ?auto_386175 ) ) ( not ( = ?auto_386173 ?auto_386176 ) ) ( not ( = ?auto_386173 ?auto_386177 ) ) ( not ( = ?auto_386173 ?auto_386178 ) ) ( not ( = ?auto_386173 ?auto_386179 ) ) ( not ( = ?auto_386173 ?auto_386180 ) ) ( not ( = ?auto_386174 ?auto_386175 ) ) ( not ( = ?auto_386174 ?auto_386176 ) ) ( not ( = ?auto_386174 ?auto_386177 ) ) ( not ( = ?auto_386174 ?auto_386178 ) ) ( not ( = ?auto_386174 ?auto_386179 ) ) ( not ( = ?auto_386174 ?auto_386180 ) ) ( not ( = ?auto_386175 ?auto_386176 ) ) ( not ( = ?auto_386175 ?auto_386177 ) ) ( not ( = ?auto_386175 ?auto_386178 ) ) ( not ( = ?auto_386175 ?auto_386179 ) ) ( not ( = ?auto_386175 ?auto_386180 ) ) ( not ( = ?auto_386176 ?auto_386177 ) ) ( not ( = ?auto_386176 ?auto_386178 ) ) ( not ( = ?auto_386176 ?auto_386179 ) ) ( not ( = ?auto_386176 ?auto_386180 ) ) ( not ( = ?auto_386177 ?auto_386178 ) ) ( not ( = ?auto_386177 ?auto_386179 ) ) ( not ( = ?auto_386177 ?auto_386180 ) ) ( not ( = ?auto_386178 ?auto_386179 ) ) ( not ( = ?auto_386178 ?auto_386180 ) ) ( not ( = ?auto_386179 ?auto_386180 ) ) ( ON ?auto_386179 ?auto_386180 ) ( ON ?auto_386178 ?auto_386179 ) ( ON ?auto_386177 ?auto_386178 ) ( ON ?auto_386176 ?auto_386177 ) ( ON ?auto_386175 ?auto_386176 ) ( CLEAR ?auto_386173 ) ( ON ?auto_386174 ?auto_386175 ) ( CLEAR ?auto_386174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_386166 ?auto_386167 ?auto_386168 ?auto_386169 ?auto_386170 ?auto_386171 ?auto_386172 ?auto_386173 ?auto_386174 )
      ( MAKE-15PILE ?auto_386166 ?auto_386167 ?auto_386168 ?auto_386169 ?auto_386170 ?auto_386171 ?auto_386172 ?auto_386173 ?auto_386174 ?auto_386175 ?auto_386176 ?auto_386177 ?auto_386178 ?auto_386179 ?auto_386180 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386196 - BLOCK
      ?auto_386197 - BLOCK
      ?auto_386198 - BLOCK
      ?auto_386199 - BLOCK
      ?auto_386200 - BLOCK
      ?auto_386201 - BLOCK
      ?auto_386202 - BLOCK
      ?auto_386203 - BLOCK
      ?auto_386204 - BLOCK
      ?auto_386205 - BLOCK
      ?auto_386206 - BLOCK
      ?auto_386207 - BLOCK
      ?auto_386208 - BLOCK
      ?auto_386209 - BLOCK
      ?auto_386210 - BLOCK
    )
    :vars
    (
      ?auto_386211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386210 ?auto_386211 ) ( ON-TABLE ?auto_386196 ) ( ON ?auto_386197 ?auto_386196 ) ( ON ?auto_386198 ?auto_386197 ) ( ON ?auto_386199 ?auto_386198 ) ( ON ?auto_386200 ?auto_386199 ) ( ON ?auto_386201 ?auto_386200 ) ( ON ?auto_386202 ?auto_386201 ) ( not ( = ?auto_386196 ?auto_386197 ) ) ( not ( = ?auto_386196 ?auto_386198 ) ) ( not ( = ?auto_386196 ?auto_386199 ) ) ( not ( = ?auto_386196 ?auto_386200 ) ) ( not ( = ?auto_386196 ?auto_386201 ) ) ( not ( = ?auto_386196 ?auto_386202 ) ) ( not ( = ?auto_386196 ?auto_386203 ) ) ( not ( = ?auto_386196 ?auto_386204 ) ) ( not ( = ?auto_386196 ?auto_386205 ) ) ( not ( = ?auto_386196 ?auto_386206 ) ) ( not ( = ?auto_386196 ?auto_386207 ) ) ( not ( = ?auto_386196 ?auto_386208 ) ) ( not ( = ?auto_386196 ?auto_386209 ) ) ( not ( = ?auto_386196 ?auto_386210 ) ) ( not ( = ?auto_386196 ?auto_386211 ) ) ( not ( = ?auto_386197 ?auto_386198 ) ) ( not ( = ?auto_386197 ?auto_386199 ) ) ( not ( = ?auto_386197 ?auto_386200 ) ) ( not ( = ?auto_386197 ?auto_386201 ) ) ( not ( = ?auto_386197 ?auto_386202 ) ) ( not ( = ?auto_386197 ?auto_386203 ) ) ( not ( = ?auto_386197 ?auto_386204 ) ) ( not ( = ?auto_386197 ?auto_386205 ) ) ( not ( = ?auto_386197 ?auto_386206 ) ) ( not ( = ?auto_386197 ?auto_386207 ) ) ( not ( = ?auto_386197 ?auto_386208 ) ) ( not ( = ?auto_386197 ?auto_386209 ) ) ( not ( = ?auto_386197 ?auto_386210 ) ) ( not ( = ?auto_386197 ?auto_386211 ) ) ( not ( = ?auto_386198 ?auto_386199 ) ) ( not ( = ?auto_386198 ?auto_386200 ) ) ( not ( = ?auto_386198 ?auto_386201 ) ) ( not ( = ?auto_386198 ?auto_386202 ) ) ( not ( = ?auto_386198 ?auto_386203 ) ) ( not ( = ?auto_386198 ?auto_386204 ) ) ( not ( = ?auto_386198 ?auto_386205 ) ) ( not ( = ?auto_386198 ?auto_386206 ) ) ( not ( = ?auto_386198 ?auto_386207 ) ) ( not ( = ?auto_386198 ?auto_386208 ) ) ( not ( = ?auto_386198 ?auto_386209 ) ) ( not ( = ?auto_386198 ?auto_386210 ) ) ( not ( = ?auto_386198 ?auto_386211 ) ) ( not ( = ?auto_386199 ?auto_386200 ) ) ( not ( = ?auto_386199 ?auto_386201 ) ) ( not ( = ?auto_386199 ?auto_386202 ) ) ( not ( = ?auto_386199 ?auto_386203 ) ) ( not ( = ?auto_386199 ?auto_386204 ) ) ( not ( = ?auto_386199 ?auto_386205 ) ) ( not ( = ?auto_386199 ?auto_386206 ) ) ( not ( = ?auto_386199 ?auto_386207 ) ) ( not ( = ?auto_386199 ?auto_386208 ) ) ( not ( = ?auto_386199 ?auto_386209 ) ) ( not ( = ?auto_386199 ?auto_386210 ) ) ( not ( = ?auto_386199 ?auto_386211 ) ) ( not ( = ?auto_386200 ?auto_386201 ) ) ( not ( = ?auto_386200 ?auto_386202 ) ) ( not ( = ?auto_386200 ?auto_386203 ) ) ( not ( = ?auto_386200 ?auto_386204 ) ) ( not ( = ?auto_386200 ?auto_386205 ) ) ( not ( = ?auto_386200 ?auto_386206 ) ) ( not ( = ?auto_386200 ?auto_386207 ) ) ( not ( = ?auto_386200 ?auto_386208 ) ) ( not ( = ?auto_386200 ?auto_386209 ) ) ( not ( = ?auto_386200 ?auto_386210 ) ) ( not ( = ?auto_386200 ?auto_386211 ) ) ( not ( = ?auto_386201 ?auto_386202 ) ) ( not ( = ?auto_386201 ?auto_386203 ) ) ( not ( = ?auto_386201 ?auto_386204 ) ) ( not ( = ?auto_386201 ?auto_386205 ) ) ( not ( = ?auto_386201 ?auto_386206 ) ) ( not ( = ?auto_386201 ?auto_386207 ) ) ( not ( = ?auto_386201 ?auto_386208 ) ) ( not ( = ?auto_386201 ?auto_386209 ) ) ( not ( = ?auto_386201 ?auto_386210 ) ) ( not ( = ?auto_386201 ?auto_386211 ) ) ( not ( = ?auto_386202 ?auto_386203 ) ) ( not ( = ?auto_386202 ?auto_386204 ) ) ( not ( = ?auto_386202 ?auto_386205 ) ) ( not ( = ?auto_386202 ?auto_386206 ) ) ( not ( = ?auto_386202 ?auto_386207 ) ) ( not ( = ?auto_386202 ?auto_386208 ) ) ( not ( = ?auto_386202 ?auto_386209 ) ) ( not ( = ?auto_386202 ?auto_386210 ) ) ( not ( = ?auto_386202 ?auto_386211 ) ) ( not ( = ?auto_386203 ?auto_386204 ) ) ( not ( = ?auto_386203 ?auto_386205 ) ) ( not ( = ?auto_386203 ?auto_386206 ) ) ( not ( = ?auto_386203 ?auto_386207 ) ) ( not ( = ?auto_386203 ?auto_386208 ) ) ( not ( = ?auto_386203 ?auto_386209 ) ) ( not ( = ?auto_386203 ?auto_386210 ) ) ( not ( = ?auto_386203 ?auto_386211 ) ) ( not ( = ?auto_386204 ?auto_386205 ) ) ( not ( = ?auto_386204 ?auto_386206 ) ) ( not ( = ?auto_386204 ?auto_386207 ) ) ( not ( = ?auto_386204 ?auto_386208 ) ) ( not ( = ?auto_386204 ?auto_386209 ) ) ( not ( = ?auto_386204 ?auto_386210 ) ) ( not ( = ?auto_386204 ?auto_386211 ) ) ( not ( = ?auto_386205 ?auto_386206 ) ) ( not ( = ?auto_386205 ?auto_386207 ) ) ( not ( = ?auto_386205 ?auto_386208 ) ) ( not ( = ?auto_386205 ?auto_386209 ) ) ( not ( = ?auto_386205 ?auto_386210 ) ) ( not ( = ?auto_386205 ?auto_386211 ) ) ( not ( = ?auto_386206 ?auto_386207 ) ) ( not ( = ?auto_386206 ?auto_386208 ) ) ( not ( = ?auto_386206 ?auto_386209 ) ) ( not ( = ?auto_386206 ?auto_386210 ) ) ( not ( = ?auto_386206 ?auto_386211 ) ) ( not ( = ?auto_386207 ?auto_386208 ) ) ( not ( = ?auto_386207 ?auto_386209 ) ) ( not ( = ?auto_386207 ?auto_386210 ) ) ( not ( = ?auto_386207 ?auto_386211 ) ) ( not ( = ?auto_386208 ?auto_386209 ) ) ( not ( = ?auto_386208 ?auto_386210 ) ) ( not ( = ?auto_386208 ?auto_386211 ) ) ( not ( = ?auto_386209 ?auto_386210 ) ) ( not ( = ?auto_386209 ?auto_386211 ) ) ( not ( = ?auto_386210 ?auto_386211 ) ) ( ON ?auto_386209 ?auto_386210 ) ( ON ?auto_386208 ?auto_386209 ) ( ON ?auto_386207 ?auto_386208 ) ( ON ?auto_386206 ?auto_386207 ) ( ON ?auto_386205 ?auto_386206 ) ( ON ?auto_386204 ?auto_386205 ) ( CLEAR ?auto_386202 ) ( ON ?auto_386203 ?auto_386204 ) ( CLEAR ?auto_386203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_386196 ?auto_386197 ?auto_386198 ?auto_386199 ?auto_386200 ?auto_386201 ?auto_386202 ?auto_386203 )
      ( MAKE-15PILE ?auto_386196 ?auto_386197 ?auto_386198 ?auto_386199 ?auto_386200 ?auto_386201 ?auto_386202 ?auto_386203 ?auto_386204 ?auto_386205 ?auto_386206 ?auto_386207 ?auto_386208 ?auto_386209 ?auto_386210 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386227 - BLOCK
      ?auto_386228 - BLOCK
      ?auto_386229 - BLOCK
      ?auto_386230 - BLOCK
      ?auto_386231 - BLOCK
      ?auto_386232 - BLOCK
      ?auto_386233 - BLOCK
      ?auto_386234 - BLOCK
      ?auto_386235 - BLOCK
      ?auto_386236 - BLOCK
      ?auto_386237 - BLOCK
      ?auto_386238 - BLOCK
      ?auto_386239 - BLOCK
      ?auto_386240 - BLOCK
      ?auto_386241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386241 ) ( ON-TABLE ?auto_386227 ) ( ON ?auto_386228 ?auto_386227 ) ( ON ?auto_386229 ?auto_386228 ) ( ON ?auto_386230 ?auto_386229 ) ( ON ?auto_386231 ?auto_386230 ) ( ON ?auto_386232 ?auto_386231 ) ( ON ?auto_386233 ?auto_386232 ) ( not ( = ?auto_386227 ?auto_386228 ) ) ( not ( = ?auto_386227 ?auto_386229 ) ) ( not ( = ?auto_386227 ?auto_386230 ) ) ( not ( = ?auto_386227 ?auto_386231 ) ) ( not ( = ?auto_386227 ?auto_386232 ) ) ( not ( = ?auto_386227 ?auto_386233 ) ) ( not ( = ?auto_386227 ?auto_386234 ) ) ( not ( = ?auto_386227 ?auto_386235 ) ) ( not ( = ?auto_386227 ?auto_386236 ) ) ( not ( = ?auto_386227 ?auto_386237 ) ) ( not ( = ?auto_386227 ?auto_386238 ) ) ( not ( = ?auto_386227 ?auto_386239 ) ) ( not ( = ?auto_386227 ?auto_386240 ) ) ( not ( = ?auto_386227 ?auto_386241 ) ) ( not ( = ?auto_386228 ?auto_386229 ) ) ( not ( = ?auto_386228 ?auto_386230 ) ) ( not ( = ?auto_386228 ?auto_386231 ) ) ( not ( = ?auto_386228 ?auto_386232 ) ) ( not ( = ?auto_386228 ?auto_386233 ) ) ( not ( = ?auto_386228 ?auto_386234 ) ) ( not ( = ?auto_386228 ?auto_386235 ) ) ( not ( = ?auto_386228 ?auto_386236 ) ) ( not ( = ?auto_386228 ?auto_386237 ) ) ( not ( = ?auto_386228 ?auto_386238 ) ) ( not ( = ?auto_386228 ?auto_386239 ) ) ( not ( = ?auto_386228 ?auto_386240 ) ) ( not ( = ?auto_386228 ?auto_386241 ) ) ( not ( = ?auto_386229 ?auto_386230 ) ) ( not ( = ?auto_386229 ?auto_386231 ) ) ( not ( = ?auto_386229 ?auto_386232 ) ) ( not ( = ?auto_386229 ?auto_386233 ) ) ( not ( = ?auto_386229 ?auto_386234 ) ) ( not ( = ?auto_386229 ?auto_386235 ) ) ( not ( = ?auto_386229 ?auto_386236 ) ) ( not ( = ?auto_386229 ?auto_386237 ) ) ( not ( = ?auto_386229 ?auto_386238 ) ) ( not ( = ?auto_386229 ?auto_386239 ) ) ( not ( = ?auto_386229 ?auto_386240 ) ) ( not ( = ?auto_386229 ?auto_386241 ) ) ( not ( = ?auto_386230 ?auto_386231 ) ) ( not ( = ?auto_386230 ?auto_386232 ) ) ( not ( = ?auto_386230 ?auto_386233 ) ) ( not ( = ?auto_386230 ?auto_386234 ) ) ( not ( = ?auto_386230 ?auto_386235 ) ) ( not ( = ?auto_386230 ?auto_386236 ) ) ( not ( = ?auto_386230 ?auto_386237 ) ) ( not ( = ?auto_386230 ?auto_386238 ) ) ( not ( = ?auto_386230 ?auto_386239 ) ) ( not ( = ?auto_386230 ?auto_386240 ) ) ( not ( = ?auto_386230 ?auto_386241 ) ) ( not ( = ?auto_386231 ?auto_386232 ) ) ( not ( = ?auto_386231 ?auto_386233 ) ) ( not ( = ?auto_386231 ?auto_386234 ) ) ( not ( = ?auto_386231 ?auto_386235 ) ) ( not ( = ?auto_386231 ?auto_386236 ) ) ( not ( = ?auto_386231 ?auto_386237 ) ) ( not ( = ?auto_386231 ?auto_386238 ) ) ( not ( = ?auto_386231 ?auto_386239 ) ) ( not ( = ?auto_386231 ?auto_386240 ) ) ( not ( = ?auto_386231 ?auto_386241 ) ) ( not ( = ?auto_386232 ?auto_386233 ) ) ( not ( = ?auto_386232 ?auto_386234 ) ) ( not ( = ?auto_386232 ?auto_386235 ) ) ( not ( = ?auto_386232 ?auto_386236 ) ) ( not ( = ?auto_386232 ?auto_386237 ) ) ( not ( = ?auto_386232 ?auto_386238 ) ) ( not ( = ?auto_386232 ?auto_386239 ) ) ( not ( = ?auto_386232 ?auto_386240 ) ) ( not ( = ?auto_386232 ?auto_386241 ) ) ( not ( = ?auto_386233 ?auto_386234 ) ) ( not ( = ?auto_386233 ?auto_386235 ) ) ( not ( = ?auto_386233 ?auto_386236 ) ) ( not ( = ?auto_386233 ?auto_386237 ) ) ( not ( = ?auto_386233 ?auto_386238 ) ) ( not ( = ?auto_386233 ?auto_386239 ) ) ( not ( = ?auto_386233 ?auto_386240 ) ) ( not ( = ?auto_386233 ?auto_386241 ) ) ( not ( = ?auto_386234 ?auto_386235 ) ) ( not ( = ?auto_386234 ?auto_386236 ) ) ( not ( = ?auto_386234 ?auto_386237 ) ) ( not ( = ?auto_386234 ?auto_386238 ) ) ( not ( = ?auto_386234 ?auto_386239 ) ) ( not ( = ?auto_386234 ?auto_386240 ) ) ( not ( = ?auto_386234 ?auto_386241 ) ) ( not ( = ?auto_386235 ?auto_386236 ) ) ( not ( = ?auto_386235 ?auto_386237 ) ) ( not ( = ?auto_386235 ?auto_386238 ) ) ( not ( = ?auto_386235 ?auto_386239 ) ) ( not ( = ?auto_386235 ?auto_386240 ) ) ( not ( = ?auto_386235 ?auto_386241 ) ) ( not ( = ?auto_386236 ?auto_386237 ) ) ( not ( = ?auto_386236 ?auto_386238 ) ) ( not ( = ?auto_386236 ?auto_386239 ) ) ( not ( = ?auto_386236 ?auto_386240 ) ) ( not ( = ?auto_386236 ?auto_386241 ) ) ( not ( = ?auto_386237 ?auto_386238 ) ) ( not ( = ?auto_386237 ?auto_386239 ) ) ( not ( = ?auto_386237 ?auto_386240 ) ) ( not ( = ?auto_386237 ?auto_386241 ) ) ( not ( = ?auto_386238 ?auto_386239 ) ) ( not ( = ?auto_386238 ?auto_386240 ) ) ( not ( = ?auto_386238 ?auto_386241 ) ) ( not ( = ?auto_386239 ?auto_386240 ) ) ( not ( = ?auto_386239 ?auto_386241 ) ) ( not ( = ?auto_386240 ?auto_386241 ) ) ( ON ?auto_386240 ?auto_386241 ) ( ON ?auto_386239 ?auto_386240 ) ( ON ?auto_386238 ?auto_386239 ) ( ON ?auto_386237 ?auto_386238 ) ( ON ?auto_386236 ?auto_386237 ) ( ON ?auto_386235 ?auto_386236 ) ( CLEAR ?auto_386233 ) ( ON ?auto_386234 ?auto_386235 ) ( CLEAR ?auto_386234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_386227 ?auto_386228 ?auto_386229 ?auto_386230 ?auto_386231 ?auto_386232 ?auto_386233 ?auto_386234 )
      ( MAKE-15PILE ?auto_386227 ?auto_386228 ?auto_386229 ?auto_386230 ?auto_386231 ?auto_386232 ?auto_386233 ?auto_386234 ?auto_386235 ?auto_386236 ?auto_386237 ?auto_386238 ?auto_386239 ?auto_386240 ?auto_386241 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386257 - BLOCK
      ?auto_386258 - BLOCK
      ?auto_386259 - BLOCK
      ?auto_386260 - BLOCK
      ?auto_386261 - BLOCK
      ?auto_386262 - BLOCK
      ?auto_386263 - BLOCK
      ?auto_386264 - BLOCK
      ?auto_386265 - BLOCK
      ?auto_386266 - BLOCK
      ?auto_386267 - BLOCK
      ?auto_386268 - BLOCK
      ?auto_386269 - BLOCK
      ?auto_386270 - BLOCK
      ?auto_386271 - BLOCK
    )
    :vars
    (
      ?auto_386272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386271 ?auto_386272 ) ( ON-TABLE ?auto_386257 ) ( ON ?auto_386258 ?auto_386257 ) ( ON ?auto_386259 ?auto_386258 ) ( ON ?auto_386260 ?auto_386259 ) ( ON ?auto_386261 ?auto_386260 ) ( ON ?auto_386262 ?auto_386261 ) ( not ( = ?auto_386257 ?auto_386258 ) ) ( not ( = ?auto_386257 ?auto_386259 ) ) ( not ( = ?auto_386257 ?auto_386260 ) ) ( not ( = ?auto_386257 ?auto_386261 ) ) ( not ( = ?auto_386257 ?auto_386262 ) ) ( not ( = ?auto_386257 ?auto_386263 ) ) ( not ( = ?auto_386257 ?auto_386264 ) ) ( not ( = ?auto_386257 ?auto_386265 ) ) ( not ( = ?auto_386257 ?auto_386266 ) ) ( not ( = ?auto_386257 ?auto_386267 ) ) ( not ( = ?auto_386257 ?auto_386268 ) ) ( not ( = ?auto_386257 ?auto_386269 ) ) ( not ( = ?auto_386257 ?auto_386270 ) ) ( not ( = ?auto_386257 ?auto_386271 ) ) ( not ( = ?auto_386257 ?auto_386272 ) ) ( not ( = ?auto_386258 ?auto_386259 ) ) ( not ( = ?auto_386258 ?auto_386260 ) ) ( not ( = ?auto_386258 ?auto_386261 ) ) ( not ( = ?auto_386258 ?auto_386262 ) ) ( not ( = ?auto_386258 ?auto_386263 ) ) ( not ( = ?auto_386258 ?auto_386264 ) ) ( not ( = ?auto_386258 ?auto_386265 ) ) ( not ( = ?auto_386258 ?auto_386266 ) ) ( not ( = ?auto_386258 ?auto_386267 ) ) ( not ( = ?auto_386258 ?auto_386268 ) ) ( not ( = ?auto_386258 ?auto_386269 ) ) ( not ( = ?auto_386258 ?auto_386270 ) ) ( not ( = ?auto_386258 ?auto_386271 ) ) ( not ( = ?auto_386258 ?auto_386272 ) ) ( not ( = ?auto_386259 ?auto_386260 ) ) ( not ( = ?auto_386259 ?auto_386261 ) ) ( not ( = ?auto_386259 ?auto_386262 ) ) ( not ( = ?auto_386259 ?auto_386263 ) ) ( not ( = ?auto_386259 ?auto_386264 ) ) ( not ( = ?auto_386259 ?auto_386265 ) ) ( not ( = ?auto_386259 ?auto_386266 ) ) ( not ( = ?auto_386259 ?auto_386267 ) ) ( not ( = ?auto_386259 ?auto_386268 ) ) ( not ( = ?auto_386259 ?auto_386269 ) ) ( not ( = ?auto_386259 ?auto_386270 ) ) ( not ( = ?auto_386259 ?auto_386271 ) ) ( not ( = ?auto_386259 ?auto_386272 ) ) ( not ( = ?auto_386260 ?auto_386261 ) ) ( not ( = ?auto_386260 ?auto_386262 ) ) ( not ( = ?auto_386260 ?auto_386263 ) ) ( not ( = ?auto_386260 ?auto_386264 ) ) ( not ( = ?auto_386260 ?auto_386265 ) ) ( not ( = ?auto_386260 ?auto_386266 ) ) ( not ( = ?auto_386260 ?auto_386267 ) ) ( not ( = ?auto_386260 ?auto_386268 ) ) ( not ( = ?auto_386260 ?auto_386269 ) ) ( not ( = ?auto_386260 ?auto_386270 ) ) ( not ( = ?auto_386260 ?auto_386271 ) ) ( not ( = ?auto_386260 ?auto_386272 ) ) ( not ( = ?auto_386261 ?auto_386262 ) ) ( not ( = ?auto_386261 ?auto_386263 ) ) ( not ( = ?auto_386261 ?auto_386264 ) ) ( not ( = ?auto_386261 ?auto_386265 ) ) ( not ( = ?auto_386261 ?auto_386266 ) ) ( not ( = ?auto_386261 ?auto_386267 ) ) ( not ( = ?auto_386261 ?auto_386268 ) ) ( not ( = ?auto_386261 ?auto_386269 ) ) ( not ( = ?auto_386261 ?auto_386270 ) ) ( not ( = ?auto_386261 ?auto_386271 ) ) ( not ( = ?auto_386261 ?auto_386272 ) ) ( not ( = ?auto_386262 ?auto_386263 ) ) ( not ( = ?auto_386262 ?auto_386264 ) ) ( not ( = ?auto_386262 ?auto_386265 ) ) ( not ( = ?auto_386262 ?auto_386266 ) ) ( not ( = ?auto_386262 ?auto_386267 ) ) ( not ( = ?auto_386262 ?auto_386268 ) ) ( not ( = ?auto_386262 ?auto_386269 ) ) ( not ( = ?auto_386262 ?auto_386270 ) ) ( not ( = ?auto_386262 ?auto_386271 ) ) ( not ( = ?auto_386262 ?auto_386272 ) ) ( not ( = ?auto_386263 ?auto_386264 ) ) ( not ( = ?auto_386263 ?auto_386265 ) ) ( not ( = ?auto_386263 ?auto_386266 ) ) ( not ( = ?auto_386263 ?auto_386267 ) ) ( not ( = ?auto_386263 ?auto_386268 ) ) ( not ( = ?auto_386263 ?auto_386269 ) ) ( not ( = ?auto_386263 ?auto_386270 ) ) ( not ( = ?auto_386263 ?auto_386271 ) ) ( not ( = ?auto_386263 ?auto_386272 ) ) ( not ( = ?auto_386264 ?auto_386265 ) ) ( not ( = ?auto_386264 ?auto_386266 ) ) ( not ( = ?auto_386264 ?auto_386267 ) ) ( not ( = ?auto_386264 ?auto_386268 ) ) ( not ( = ?auto_386264 ?auto_386269 ) ) ( not ( = ?auto_386264 ?auto_386270 ) ) ( not ( = ?auto_386264 ?auto_386271 ) ) ( not ( = ?auto_386264 ?auto_386272 ) ) ( not ( = ?auto_386265 ?auto_386266 ) ) ( not ( = ?auto_386265 ?auto_386267 ) ) ( not ( = ?auto_386265 ?auto_386268 ) ) ( not ( = ?auto_386265 ?auto_386269 ) ) ( not ( = ?auto_386265 ?auto_386270 ) ) ( not ( = ?auto_386265 ?auto_386271 ) ) ( not ( = ?auto_386265 ?auto_386272 ) ) ( not ( = ?auto_386266 ?auto_386267 ) ) ( not ( = ?auto_386266 ?auto_386268 ) ) ( not ( = ?auto_386266 ?auto_386269 ) ) ( not ( = ?auto_386266 ?auto_386270 ) ) ( not ( = ?auto_386266 ?auto_386271 ) ) ( not ( = ?auto_386266 ?auto_386272 ) ) ( not ( = ?auto_386267 ?auto_386268 ) ) ( not ( = ?auto_386267 ?auto_386269 ) ) ( not ( = ?auto_386267 ?auto_386270 ) ) ( not ( = ?auto_386267 ?auto_386271 ) ) ( not ( = ?auto_386267 ?auto_386272 ) ) ( not ( = ?auto_386268 ?auto_386269 ) ) ( not ( = ?auto_386268 ?auto_386270 ) ) ( not ( = ?auto_386268 ?auto_386271 ) ) ( not ( = ?auto_386268 ?auto_386272 ) ) ( not ( = ?auto_386269 ?auto_386270 ) ) ( not ( = ?auto_386269 ?auto_386271 ) ) ( not ( = ?auto_386269 ?auto_386272 ) ) ( not ( = ?auto_386270 ?auto_386271 ) ) ( not ( = ?auto_386270 ?auto_386272 ) ) ( not ( = ?auto_386271 ?auto_386272 ) ) ( ON ?auto_386270 ?auto_386271 ) ( ON ?auto_386269 ?auto_386270 ) ( ON ?auto_386268 ?auto_386269 ) ( ON ?auto_386267 ?auto_386268 ) ( ON ?auto_386266 ?auto_386267 ) ( ON ?auto_386265 ?auto_386266 ) ( ON ?auto_386264 ?auto_386265 ) ( CLEAR ?auto_386262 ) ( ON ?auto_386263 ?auto_386264 ) ( CLEAR ?auto_386263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_386257 ?auto_386258 ?auto_386259 ?auto_386260 ?auto_386261 ?auto_386262 ?auto_386263 )
      ( MAKE-15PILE ?auto_386257 ?auto_386258 ?auto_386259 ?auto_386260 ?auto_386261 ?auto_386262 ?auto_386263 ?auto_386264 ?auto_386265 ?auto_386266 ?auto_386267 ?auto_386268 ?auto_386269 ?auto_386270 ?auto_386271 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386288 - BLOCK
      ?auto_386289 - BLOCK
      ?auto_386290 - BLOCK
      ?auto_386291 - BLOCK
      ?auto_386292 - BLOCK
      ?auto_386293 - BLOCK
      ?auto_386294 - BLOCK
      ?auto_386295 - BLOCK
      ?auto_386296 - BLOCK
      ?auto_386297 - BLOCK
      ?auto_386298 - BLOCK
      ?auto_386299 - BLOCK
      ?auto_386300 - BLOCK
      ?auto_386301 - BLOCK
      ?auto_386302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386302 ) ( ON-TABLE ?auto_386288 ) ( ON ?auto_386289 ?auto_386288 ) ( ON ?auto_386290 ?auto_386289 ) ( ON ?auto_386291 ?auto_386290 ) ( ON ?auto_386292 ?auto_386291 ) ( ON ?auto_386293 ?auto_386292 ) ( not ( = ?auto_386288 ?auto_386289 ) ) ( not ( = ?auto_386288 ?auto_386290 ) ) ( not ( = ?auto_386288 ?auto_386291 ) ) ( not ( = ?auto_386288 ?auto_386292 ) ) ( not ( = ?auto_386288 ?auto_386293 ) ) ( not ( = ?auto_386288 ?auto_386294 ) ) ( not ( = ?auto_386288 ?auto_386295 ) ) ( not ( = ?auto_386288 ?auto_386296 ) ) ( not ( = ?auto_386288 ?auto_386297 ) ) ( not ( = ?auto_386288 ?auto_386298 ) ) ( not ( = ?auto_386288 ?auto_386299 ) ) ( not ( = ?auto_386288 ?auto_386300 ) ) ( not ( = ?auto_386288 ?auto_386301 ) ) ( not ( = ?auto_386288 ?auto_386302 ) ) ( not ( = ?auto_386289 ?auto_386290 ) ) ( not ( = ?auto_386289 ?auto_386291 ) ) ( not ( = ?auto_386289 ?auto_386292 ) ) ( not ( = ?auto_386289 ?auto_386293 ) ) ( not ( = ?auto_386289 ?auto_386294 ) ) ( not ( = ?auto_386289 ?auto_386295 ) ) ( not ( = ?auto_386289 ?auto_386296 ) ) ( not ( = ?auto_386289 ?auto_386297 ) ) ( not ( = ?auto_386289 ?auto_386298 ) ) ( not ( = ?auto_386289 ?auto_386299 ) ) ( not ( = ?auto_386289 ?auto_386300 ) ) ( not ( = ?auto_386289 ?auto_386301 ) ) ( not ( = ?auto_386289 ?auto_386302 ) ) ( not ( = ?auto_386290 ?auto_386291 ) ) ( not ( = ?auto_386290 ?auto_386292 ) ) ( not ( = ?auto_386290 ?auto_386293 ) ) ( not ( = ?auto_386290 ?auto_386294 ) ) ( not ( = ?auto_386290 ?auto_386295 ) ) ( not ( = ?auto_386290 ?auto_386296 ) ) ( not ( = ?auto_386290 ?auto_386297 ) ) ( not ( = ?auto_386290 ?auto_386298 ) ) ( not ( = ?auto_386290 ?auto_386299 ) ) ( not ( = ?auto_386290 ?auto_386300 ) ) ( not ( = ?auto_386290 ?auto_386301 ) ) ( not ( = ?auto_386290 ?auto_386302 ) ) ( not ( = ?auto_386291 ?auto_386292 ) ) ( not ( = ?auto_386291 ?auto_386293 ) ) ( not ( = ?auto_386291 ?auto_386294 ) ) ( not ( = ?auto_386291 ?auto_386295 ) ) ( not ( = ?auto_386291 ?auto_386296 ) ) ( not ( = ?auto_386291 ?auto_386297 ) ) ( not ( = ?auto_386291 ?auto_386298 ) ) ( not ( = ?auto_386291 ?auto_386299 ) ) ( not ( = ?auto_386291 ?auto_386300 ) ) ( not ( = ?auto_386291 ?auto_386301 ) ) ( not ( = ?auto_386291 ?auto_386302 ) ) ( not ( = ?auto_386292 ?auto_386293 ) ) ( not ( = ?auto_386292 ?auto_386294 ) ) ( not ( = ?auto_386292 ?auto_386295 ) ) ( not ( = ?auto_386292 ?auto_386296 ) ) ( not ( = ?auto_386292 ?auto_386297 ) ) ( not ( = ?auto_386292 ?auto_386298 ) ) ( not ( = ?auto_386292 ?auto_386299 ) ) ( not ( = ?auto_386292 ?auto_386300 ) ) ( not ( = ?auto_386292 ?auto_386301 ) ) ( not ( = ?auto_386292 ?auto_386302 ) ) ( not ( = ?auto_386293 ?auto_386294 ) ) ( not ( = ?auto_386293 ?auto_386295 ) ) ( not ( = ?auto_386293 ?auto_386296 ) ) ( not ( = ?auto_386293 ?auto_386297 ) ) ( not ( = ?auto_386293 ?auto_386298 ) ) ( not ( = ?auto_386293 ?auto_386299 ) ) ( not ( = ?auto_386293 ?auto_386300 ) ) ( not ( = ?auto_386293 ?auto_386301 ) ) ( not ( = ?auto_386293 ?auto_386302 ) ) ( not ( = ?auto_386294 ?auto_386295 ) ) ( not ( = ?auto_386294 ?auto_386296 ) ) ( not ( = ?auto_386294 ?auto_386297 ) ) ( not ( = ?auto_386294 ?auto_386298 ) ) ( not ( = ?auto_386294 ?auto_386299 ) ) ( not ( = ?auto_386294 ?auto_386300 ) ) ( not ( = ?auto_386294 ?auto_386301 ) ) ( not ( = ?auto_386294 ?auto_386302 ) ) ( not ( = ?auto_386295 ?auto_386296 ) ) ( not ( = ?auto_386295 ?auto_386297 ) ) ( not ( = ?auto_386295 ?auto_386298 ) ) ( not ( = ?auto_386295 ?auto_386299 ) ) ( not ( = ?auto_386295 ?auto_386300 ) ) ( not ( = ?auto_386295 ?auto_386301 ) ) ( not ( = ?auto_386295 ?auto_386302 ) ) ( not ( = ?auto_386296 ?auto_386297 ) ) ( not ( = ?auto_386296 ?auto_386298 ) ) ( not ( = ?auto_386296 ?auto_386299 ) ) ( not ( = ?auto_386296 ?auto_386300 ) ) ( not ( = ?auto_386296 ?auto_386301 ) ) ( not ( = ?auto_386296 ?auto_386302 ) ) ( not ( = ?auto_386297 ?auto_386298 ) ) ( not ( = ?auto_386297 ?auto_386299 ) ) ( not ( = ?auto_386297 ?auto_386300 ) ) ( not ( = ?auto_386297 ?auto_386301 ) ) ( not ( = ?auto_386297 ?auto_386302 ) ) ( not ( = ?auto_386298 ?auto_386299 ) ) ( not ( = ?auto_386298 ?auto_386300 ) ) ( not ( = ?auto_386298 ?auto_386301 ) ) ( not ( = ?auto_386298 ?auto_386302 ) ) ( not ( = ?auto_386299 ?auto_386300 ) ) ( not ( = ?auto_386299 ?auto_386301 ) ) ( not ( = ?auto_386299 ?auto_386302 ) ) ( not ( = ?auto_386300 ?auto_386301 ) ) ( not ( = ?auto_386300 ?auto_386302 ) ) ( not ( = ?auto_386301 ?auto_386302 ) ) ( ON ?auto_386301 ?auto_386302 ) ( ON ?auto_386300 ?auto_386301 ) ( ON ?auto_386299 ?auto_386300 ) ( ON ?auto_386298 ?auto_386299 ) ( ON ?auto_386297 ?auto_386298 ) ( ON ?auto_386296 ?auto_386297 ) ( ON ?auto_386295 ?auto_386296 ) ( CLEAR ?auto_386293 ) ( ON ?auto_386294 ?auto_386295 ) ( CLEAR ?auto_386294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_386288 ?auto_386289 ?auto_386290 ?auto_386291 ?auto_386292 ?auto_386293 ?auto_386294 )
      ( MAKE-15PILE ?auto_386288 ?auto_386289 ?auto_386290 ?auto_386291 ?auto_386292 ?auto_386293 ?auto_386294 ?auto_386295 ?auto_386296 ?auto_386297 ?auto_386298 ?auto_386299 ?auto_386300 ?auto_386301 ?auto_386302 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386318 - BLOCK
      ?auto_386319 - BLOCK
      ?auto_386320 - BLOCK
      ?auto_386321 - BLOCK
      ?auto_386322 - BLOCK
      ?auto_386323 - BLOCK
      ?auto_386324 - BLOCK
      ?auto_386325 - BLOCK
      ?auto_386326 - BLOCK
      ?auto_386327 - BLOCK
      ?auto_386328 - BLOCK
      ?auto_386329 - BLOCK
      ?auto_386330 - BLOCK
      ?auto_386331 - BLOCK
      ?auto_386332 - BLOCK
    )
    :vars
    (
      ?auto_386333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386332 ?auto_386333 ) ( ON-TABLE ?auto_386318 ) ( ON ?auto_386319 ?auto_386318 ) ( ON ?auto_386320 ?auto_386319 ) ( ON ?auto_386321 ?auto_386320 ) ( ON ?auto_386322 ?auto_386321 ) ( not ( = ?auto_386318 ?auto_386319 ) ) ( not ( = ?auto_386318 ?auto_386320 ) ) ( not ( = ?auto_386318 ?auto_386321 ) ) ( not ( = ?auto_386318 ?auto_386322 ) ) ( not ( = ?auto_386318 ?auto_386323 ) ) ( not ( = ?auto_386318 ?auto_386324 ) ) ( not ( = ?auto_386318 ?auto_386325 ) ) ( not ( = ?auto_386318 ?auto_386326 ) ) ( not ( = ?auto_386318 ?auto_386327 ) ) ( not ( = ?auto_386318 ?auto_386328 ) ) ( not ( = ?auto_386318 ?auto_386329 ) ) ( not ( = ?auto_386318 ?auto_386330 ) ) ( not ( = ?auto_386318 ?auto_386331 ) ) ( not ( = ?auto_386318 ?auto_386332 ) ) ( not ( = ?auto_386318 ?auto_386333 ) ) ( not ( = ?auto_386319 ?auto_386320 ) ) ( not ( = ?auto_386319 ?auto_386321 ) ) ( not ( = ?auto_386319 ?auto_386322 ) ) ( not ( = ?auto_386319 ?auto_386323 ) ) ( not ( = ?auto_386319 ?auto_386324 ) ) ( not ( = ?auto_386319 ?auto_386325 ) ) ( not ( = ?auto_386319 ?auto_386326 ) ) ( not ( = ?auto_386319 ?auto_386327 ) ) ( not ( = ?auto_386319 ?auto_386328 ) ) ( not ( = ?auto_386319 ?auto_386329 ) ) ( not ( = ?auto_386319 ?auto_386330 ) ) ( not ( = ?auto_386319 ?auto_386331 ) ) ( not ( = ?auto_386319 ?auto_386332 ) ) ( not ( = ?auto_386319 ?auto_386333 ) ) ( not ( = ?auto_386320 ?auto_386321 ) ) ( not ( = ?auto_386320 ?auto_386322 ) ) ( not ( = ?auto_386320 ?auto_386323 ) ) ( not ( = ?auto_386320 ?auto_386324 ) ) ( not ( = ?auto_386320 ?auto_386325 ) ) ( not ( = ?auto_386320 ?auto_386326 ) ) ( not ( = ?auto_386320 ?auto_386327 ) ) ( not ( = ?auto_386320 ?auto_386328 ) ) ( not ( = ?auto_386320 ?auto_386329 ) ) ( not ( = ?auto_386320 ?auto_386330 ) ) ( not ( = ?auto_386320 ?auto_386331 ) ) ( not ( = ?auto_386320 ?auto_386332 ) ) ( not ( = ?auto_386320 ?auto_386333 ) ) ( not ( = ?auto_386321 ?auto_386322 ) ) ( not ( = ?auto_386321 ?auto_386323 ) ) ( not ( = ?auto_386321 ?auto_386324 ) ) ( not ( = ?auto_386321 ?auto_386325 ) ) ( not ( = ?auto_386321 ?auto_386326 ) ) ( not ( = ?auto_386321 ?auto_386327 ) ) ( not ( = ?auto_386321 ?auto_386328 ) ) ( not ( = ?auto_386321 ?auto_386329 ) ) ( not ( = ?auto_386321 ?auto_386330 ) ) ( not ( = ?auto_386321 ?auto_386331 ) ) ( not ( = ?auto_386321 ?auto_386332 ) ) ( not ( = ?auto_386321 ?auto_386333 ) ) ( not ( = ?auto_386322 ?auto_386323 ) ) ( not ( = ?auto_386322 ?auto_386324 ) ) ( not ( = ?auto_386322 ?auto_386325 ) ) ( not ( = ?auto_386322 ?auto_386326 ) ) ( not ( = ?auto_386322 ?auto_386327 ) ) ( not ( = ?auto_386322 ?auto_386328 ) ) ( not ( = ?auto_386322 ?auto_386329 ) ) ( not ( = ?auto_386322 ?auto_386330 ) ) ( not ( = ?auto_386322 ?auto_386331 ) ) ( not ( = ?auto_386322 ?auto_386332 ) ) ( not ( = ?auto_386322 ?auto_386333 ) ) ( not ( = ?auto_386323 ?auto_386324 ) ) ( not ( = ?auto_386323 ?auto_386325 ) ) ( not ( = ?auto_386323 ?auto_386326 ) ) ( not ( = ?auto_386323 ?auto_386327 ) ) ( not ( = ?auto_386323 ?auto_386328 ) ) ( not ( = ?auto_386323 ?auto_386329 ) ) ( not ( = ?auto_386323 ?auto_386330 ) ) ( not ( = ?auto_386323 ?auto_386331 ) ) ( not ( = ?auto_386323 ?auto_386332 ) ) ( not ( = ?auto_386323 ?auto_386333 ) ) ( not ( = ?auto_386324 ?auto_386325 ) ) ( not ( = ?auto_386324 ?auto_386326 ) ) ( not ( = ?auto_386324 ?auto_386327 ) ) ( not ( = ?auto_386324 ?auto_386328 ) ) ( not ( = ?auto_386324 ?auto_386329 ) ) ( not ( = ?auto_386324 ?auto_386330 ) ) ( not ( = ?auto_386324 ?auto_386331 ) ) ( not ( = ?auto_386324 ?auto_386332 ) ) ( not ( = ?auto_386324 ?auto_386333 ) ) ( not ( = ?auto_386325 ?auto_386326 ) ) ( not ( = ?auto_386325 ?auto_386327 ) ) ( not ( = ?auto_386325 ?auto_386328 ) ) ( not ( = ?auto_386325 ?auto_386329 ) ) ( not ( = ?auto_386325 ?auto_386330 ) ) ( not ( = ?auto_386325 ?auto_386331 ) ) ( not ( = ?auto_386325 ?auto_386332 ) ) ( not ( = ?auto_386325 ?auto_386333 ) ) ( not ( = ?auto_386326 ?auto_386327 ) ) ( not ( = ?auto_386326 ?auto_386328 ) ) ( not ( = ?auto_386326 ?auto_386329 ) ) ( not ( = ?auto_386326 ?auto_386330 ) ) ( not ( = ?auto_386326 ?auto_386331 ) ) ( not ( = ?auto_386326 ?auto_386332 ) ) ( not ( = ?auto_386326 ?auto_386333 ) ) ( not ( = ?auto_386327 ?auto_386328 ) ) ( not ( = ?auto_386327 ?auto_386329 ) ) ( not ( = ?auto_386327 ?auto_386330 ) ) ( not ( = ?auto_386327 ?auto_386331 ) ) ( not ( = ?auto_386327 ?auto_386332 ) ) ( not ( = ?auto_386327 ?auto_386333 ) ) ( not ( = ?auto_386328 ?auto_386329 ) ) ( not ( = ?auto_386328 ?auto_386330 ) ) ( not ( = ?auto_386328 ?auto_386331 ) ) ( not ( = ?auto_386328 ?auto_386332 ) ) ( not ( = ?auto_386328 ?auto_386333 ) ) ( not ( = ?auto_386329 ?auto_386330 ) ) ( not ( = ?auto_386329 ?auto_386331 ) ) ( not ( = ?auto_386329 ?auto_386332 ) ) ( not ( = ?auto_386329 ?auto_386333 ) ) ( not ( = ?auto_386330 ?auto_386331 ) ) ( not ( = ?auto_386330 ?auto_386332 ) ) ( not ( = ?auto_386330 ?auto_386333 ) ) ( not ( = ?auto_386331 ?auto_386332 ) ) ( not ( = ?auto_386331 ?auto_386333 ) ) ( not ( = ?auto_386332 ?auto_386333 ) ) ( ON ?auto_386331 ?auto_386332 ) ( ON ?auto_386330 ?auto_386331 ) ( ON ?auto_386329 ?auto_386330 ) ( ON ?auto_386328 ?auto_386329 ) ( ON ?auto_386327 ?auto_386328 ) ( ON ?auto_386326 ?auto_386327 ) ( ON ?auto_386325 ?auto_386326 ) ( ON ?auto_386324 ?auto_386325 ) ( CLEAR ?auto_386322 ) ( ON ?auto_386323 ?auto_386324 ) ( CLEAR ?auto_386323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_386318 ?auto_386319 ?auto_386320 ?auto_386321 ?auto_386322 ?auto_386323 )
      ( MAKE-15PILE ?auto_386318 ?auto_386319 ?auto_386320 ?auto_386321 ?auto_386322 ?auto_386323 ?auto_386324 ?auto_386325 ?auto_386326 ?auto_386327 ?auto_386328 ?auto_386329 ?auto_386330 ?auto_386331 ?auto_386332 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386349 - BLOCK
      ?auto_386350 - BLOCK
      ?auto_386351 - BLOCK
      ?auto_386352 - BLOCK
      ?auto_386353 - BLOCK
      ?auto_386354 - BLOCK
      ?auto_386355 - BLOCK
      ?auto_386356 - BLOCK
      ?auto_386357 - BLOCK
      ?auto_386358 - BLOCK
      ?auto_386359 - BLOCK
      ?auto_386360 - BLOCK
      ?auto_386361 - BLOCK
      ?auto_386362 - BLOCK
      ?auto_386363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386363 ) ( ON-TABLE ?auto_386349 ) ( ON ?auto_386350 ?auto_386349 ) ( ON ?auto_386351 ?auto_386350 ) ( ON ?auto_386352 ?auto_386351 ) ( ON ?auto_386353 ?auto_386352 ) ( not ( = ?auto_386349 ?auto_386350 ) ) ( not ( = ?auto_386349 ?auto_386351 ) ) ( not ( = ?auto_386349 ?auto_386352 ) ) ( not ( = ?auto_386349 ?auto_386353 ) ) ( not ( = ?auto_386349 ?auto_386354 ) ) ( not ( = ?auto_386349 ?auto_386355 ) ) ( not ( = ?auto_386349 ?auto_386356 ) ) ( not ( = ?auto_386349 ?auto_386357 ) ) ( not ( = ?auto_386349 ?auto_386358 ) ) ( not ( = ?auto_386349 ?auto_386359 ) ) ( not ( = ?auto_386349 ?auto_386360 ) ) ( not ( = ?auto_386349 ?auto_386361 ) ) ( not ( = ?auto_386349 ?auto_386362 ) ) ( not ( = ?auto_386349 ?auto_386363 ) ) ( not ( = ?auto_386350 ?auto_386351 ) ) ( not ( = ?auto_386350 ?auto_386352 ) ) ( not ( = ?auto_386350 ?auto_386353 ) ) ( not ( = ?auto_386350 ?auto_386354 ) ) ( not ( = ?auto_386350 ?auto_386355 ) ) ( not ( = ?auto_386350 ?auto_386356 ) ) ( not ( = ?auto_386350 ?auto_386357 ) ) ( not ( = ?auto_386350 ?auto_386358 ) ) ( not ( = ?auto_386350 ?auto_386359 ) ) ( not ( = ?auto_386350 ?auto_386360 ) ) ( not ( = ?auto_386350 ?auto_386361 ) ) ( not ( = ?auto_386350 ?auto_386362 ) ) ( not ( = ?auto_386350 ?auto_386363 ) ) ( not ( = ?auto_386351 ?auto_386352 ) ) ( not ( = ?auto_386351 ?auto_386353 ) ) ( not ( = ?auto_386351 ?auto_386354 ) ) ( not ( = ?auto_386351 ?auto_386355 ) ) ( not ( = ?auto_386351 ?auto_386356 ) ) ( not ( = ?auto_386351 ?auto_386357 ) ) ( not ( = ?auto_386351 ?auto_386358 ) ) ( not ( = ?auto_386351 ?auto_386359 ) ) ( not ( = ?auto_386351 ?auto_386360 ) ) ( not ( = ?auto_386351 ?auto_386361 ) ) ( not ( = ?auto_386351 ?auto_386362 ) ) ( not ( = ?auto_386351 ?auto_386363 ) ) ( not ( = ?auto_386352 ?auto_386353 ) ) ( not ( = ?auto_386352 ?auto_386354 ) ) ( not ( = ?auto_386352 ?auto_386355 ) ) ( not ( = ?auto_386352 ?auto_386356 ) ) ( not ( = ?auto_386352 ?auto_386357 ) ) ( not ( = ?auto_386352 ?auto_386358 ) ) ( not ( = ?auto_386352 ?auto_386359 ) ) ( not ( = ?auto_386352 ?auto_386360 ) ) ( not ( = ?auto_386352 ?auto_386361 ) ) ( not ( = ?auto_386352 ?auto_386362 ) ) ( not ( = ?auto_386352 ?auto_386363 ) ) ( not ( = ?auto_386353 ?auto_386354 ) ) ( not ( = ?auto_386353 ?auto_386355 ) ) ( not ( = ?auto_386353 ?auto_386356 ) ) ( not ( = ?auto_386353 ?auto_386357 ) ) ( not ( = ?auto_386353 ?auto_386358 ) ) ( not ( = ?auto_386353 ?auto_386359 ) ) ( not ( = ?auto_386353 ?auto_386360 ) ) ( not ( = ?auto_386353 ?auto_386361 ) ) ( not ( = ?auto_386353 ?auto_386362 ) ) ( not ( = ?auto_386353 ?auto_386363 ) ) ( not ( = ?auto_386354 ?auto_386355 ) ) ( not ( = ?auto_386354 ?auto_386356 ) ) ( not ( = ?auto_386354 ?auto_386357 ) ) ( not ( = ?auto_386354 ?auto_386358 ) ) ( not ( = ?auto_386354 ?auto_386359 ) ) ( not ( = ?auto_386354 ?auto_386360 ) ) ( not ( = ?auto_386354 ?auto_386361 ) ) ( not ( = ?auto_386354 ?auto_386362 ) ) ( not ( = ?auto_386354 ?auto_386363 ) ) ( not ( = ?auto_386355 ?auto_386356 ) ) ( not ( = ?auto_386355 ?auto_386357 ) ) ( not ( = ?auto_386355 ?auto_386358 ) ) ( not ( = ?auto_386355 ?auto_386359 ) ) ( not ( = ?auto_386355 ?auto_386360 ) ) ( not ( = ?auto_386355 ?auto_386361 ) ) ( not ( = ?auto_386355 ?auto_386362 ) ) ( not ( = ?auto_386355 ?auto_386363 ) ) ( not ( = ?auto_386356 ?auto_386357 ) ) ( not ( = ?auto_386356 ?auto_386358 ) ) ( not ( = ?auto_386356 ?auto_386359 ) ) ( not ( = ?auto_386356 ?auto_386360 ) ) ( not ( = ?auto_386356 ?auto_386361 ) ) ( not ( = ?auto_386356 ?auto_386362 ) ) ( not ( = ?auto_386356 ?auto_386363 ) ) ( not ( = ?auto_386357 ?auto_386358 ) ) ( not ( = ?auto_386357 ?auto_386359 ) ) ( not ( = ?auto_386357 ?auto_386360 ) ) ( not ( = ?auto_386357 ?auto_386361 ) ) ( not ( = ?auto_386357 ?auto_386362 ) ) ( not ( = ?auto_386357 ?auto_386363 ) ) ( not ( = ?auto_386358 ?auto_386359 ) ) ( not ( = ?auto_386358 ?auto_386360 ) ) ( not ( = ?auto_386358 ?auto_386361 ) ) ( not ( = ?auto_386358 ?auto_386362 ) ) ( not ( = ?auto_386358 ?auto_386363 ) ) ( not ( = ?auto_386359 ?auto_386360 ) ) ( not ( = ?auto_386359 ?auto_386361 ) ) ( not ( = ?auto_386359 ?auto_386362 ) ) ( not ( = ?auto_386359 ?auto_386363 ) ) ( not ( = ?auto_386360 ?auto_386361 ) ) ( not ( = ?auto_386360 ?auto_386362 ) ) ( not ( = ?auto_386360 ?auto_386363 ) ) ( not ( = ?auto_386361 ?auto_386362 ) ) ( not ( = ?auto_386361 ?auto_386363 ) ) ( not ( = ?auto_386362 ?auto_386363 ) ) ( ON ?auto_386362 ?auto_386363 ) ( ON ?auto_386361 ?auto_386362 ) ( ON ?auto_386360 ?auto_386361 ) ( ON ?auto_386359 ?auto_386360 ) ( ON ?auto_386358 ?auto_386359 ) ( ON ?auto_386357 ?auto_386358 ) ( ON ?auto_386356 ?auto_386357 ) ( ON ?auto_386355 ?auto_386356 ) ( CLEAR ?auto_386353 ) ( ON ?auto_386354 ?auto_386355 ) ( CLEAR ?auto_386354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_386349 ?auto_386350 ?auto_386351 ?auto_386352 ?auto_386353 ?auto_386354 )
      ( MAKE-15PILE ?auto_386349 ?auto_386350 ?auto_386351 ?auto_386352 ?auto_386353 ?auto_386354 ?auto_386355 ?auto_386356 ?auto_386357 ?auto_386358 ?auto_386359 ?auto_386360 ?auto_386361 ?auto_386362 ?auto_386363 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386379 - BLOCK
      ?auto_386380 - BLOCK
      ?auto_386381 - BLOCK
      ?auto_386382 - BLOCK
      ?auto_386383 - BLOCK
      ?auto_386384 - BLOCK
      ?auto_386385 - BLOCK
      ?auto_386386 - BLOCK
      ?auto_386387 - BLOCK
      ?auto_386388 - BLOCK
      ?auto_386389 - BLOCK
      ?auto_386390 - BLOCK
      ?auto_386391 - BLOCK
      ?auto_386392 - BLOCK
      ?auto_386393 - BLOCK
    )
    :vars
    (
      ?auto_386394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386393 ?auto_386394 ) ( ON-TABLE ?auto_386379 ) ( ON ?auto_386380 ?auto_386379 ) ( ON ?auto_386381 ?auto_386380 ) ( ON ?auto_386382 ?auto_386381 ) ( not ( = ?auto_386379 ?auto_386380 ) ) ( not ( = ?auto_386379 ?auto_386381 ) ) ( not ( = ?auto_386379 ?auto_386382 ) ) ( not ( = ?auto_386379 ?auto_386383 ) ) ( not ( = ?auto_386379 ?auto_386384 ) ) ( not ( = ?auto_386379 ?auto_386385 ) ) ( not ( = ?auto_386379 ?auto_386386 ) ) ( not ( = ?auto_386379 ?auto_386387 ) ) ( not ( = ?auto_386379 ?auto_386388 ) ) ( not ( = ?auto_386379 ?auto_386389 ) ) ( not ( = ?auto_386379 ?auto_386390 ) ) ( not ( = ?auto_386379 ?auto_386391 ) ) ( not ( = ?auto_386379 ?auto_386392 ) ) ( not ( = ?auto_386379 ?auto_386393 ) ) ( not ( = ?auto_386379 ?auto_386394 ) ) ( not ( = ?auto_386380 ?auto_386381 ) ) ( not ( = ?auto_386380 ?auto_386382 ) ) ( not ( = ?auto_386380 ?auto_386383 ) ) ( not ( = ?auto_386380 ?auto_386384 ) ) ( not ( = ?auto_386380 ?auto_386385 ) ) ( not ( = ?auto_386380 ?auto_386386 ) ) ( not ( = ?auto_386380 ?auto_386387 ) ) ( not ( = ?auto_386380 ?auto_386388 ) ) ( not ( = ?auto_386380 ?auto_386389 ) ) ( not ( = ?auto_386380 ?auto_386390 ) ) ( not ( = ?auto_386380 ?auto_386391 ) ) ( not ( = ?auto_386380 ?auto_386392 ) ) ( not ( = ?auto_386380 ?auto_386393 ) ) ( not ( = ?auto_386380 ?auto_386394 ) ) ( not ( = ?auto_386381 ?auto_386382 ) ) ( not ( = ?auto_386381 ?auto_386383 ) ) ( not ( = ?auto_386381 ?auto_386384 ) ) ( not ( = ?auto_386381 ?auto_386385 ) ) ( not ( = ?auto_386381 ?auto_386386 ) ) ( not ( = ?auto_386381 ?auto_386387 ) ) ( not ( = ?auto_386381 ?auto_386388 ) ) ( not ( = ?auto_386381 ?auto_386389 ) ) ( not ( = ?auto_386381 ?auto_386390 ) ) ( not ( = ?auto_386381 ?auto_386391 ) ) ( not ( = ?auto_386381 ?auto_386392 ) ) ( not ( = ?auto_386381 ?auto_386393 ) ) ( not ( = ?auto_386381 ?auto_386394 ) ) ( not ( = ?auto_386382 ?auto_386383 ) ) ( not ( = ?auto_386382 ?auto_386384 ) ) ( not ( = ?auto_386382 ?auto_386385 ) ) ( not ( = ?auto_386382 ?auto_386386 ) ) ( not ( = ?auto_386382 ?auto_386387 ) ) ( not ( = ?auto_386382 ?auto_386388 ) ) ( not ( = ?auto_386382 ?auto_386389 ) ) ( not ( = ?auto_386382 ?auto_386390 ) ) ( not ( = ?auto_386382 ?auto_386391 ) ) ( not ( = ?auto_386382 ?auto_386392 ) ) ( not ( = ?auto_386382 ?auto_386393 ) ) ( not ( = ?auto_386382 ?auto_386394 ) ) ( not ( = ?auto_386383 ?auto_386384 ) ) ( not ( = ?auto_386383 ?auto_386385 ) ) ( not ( = ?auto_386383 ?auto_386386 ) ) ( not ( = ?auto_386383 ?auto_386387 ) ) ( not ( = ?auto_386383 ?auto_386388 ) ) ( not ( = ?auto_386383 ?auto_386389 ) ) ( not ( = ?auto_386383 ?auto_386390 ) ) ( not ( = ?auto_386383 ?auto_386391 ) ) ( not ( = ?auto_386383 ?auto_386392 ) ) ( not ( = ?auto_386383 ?auto_386393 ) ) ( not ( = ?auto_386383 ?auto_386394 ) ) ( not ( = ?auto_386384 ?auto_386385 ) ) ( not ( = ?auto_386384 ?auto_386386 ) ) ( not ( = ?auto_386384 ?auto_386387 ) ) ( not ( = ?auto_386384 ?auto_386388 ) ) ( not ( = ?auto_386384 ?auto_386389 ) ) ( not ( = ?auto_386384 ?auto_386390 ) ) ( not ( = ?auto_386384 ?auto_386391 ) ) ( not ( = ?auto_386384 ?auto_386392 ) ) ( not ( = ?auto_386384 ?auto_386393 ) ) ( not ( = ?auto_386384 ?auto_386394 ) ) ( not ( = ?auto_386385 ?auto_386386 ) ) ( not ( = ?auto_386385 ?auto_386387 ) ) ( not ( = ?auto_386385 ?auto_386388 ) ) ( not ( = ?auto_386385 ?auto_386389 ) ) ( not ( = ?auto_386385 ?auto_386390 ) ) ( not ( = ?auto_386385 ?auto_386391 ) ) ( not ( = ?auto_386385 ?auto_386392 ) ) ( not ( = ?auto_386385 ?auto_386393 ) ) ( not ( = ?auto_386385 ?auto_386394 ) ) ( not ( = ?auto_386386 ?auto_386387 ) ) ( not ( = ?auto_386386 ?auto_386388 ) ) ( not ( = ?auto_386386 ?auto_386389 ) ) ( not ( = ?auto_386386 ?auto_386390 ) ) ( not ( = ?auto_386386 ?auto_386391 ) ) ( not ( = ?auto_386386 ?auto_386392 ) ) ( not ( = ?auto_386386 ?auto_386393 ) ) ( not ( = ?auto_386386 ?auto_386394 ) ) ( not ( = ?auto_386387 ?auto_386388 ) ) ( not ( = ?auto_386387 ?auto_386389 ) ) ( not ( = ?auto_386387 ?auto_386390 ) ) ( not ( = ?auto_386387 ?auto_386391 ) ) ( not ( = ?auto_386387 ?auto_386392 ) ) ( not ( = ?auto_386387 ?auto_386393 ) ) ( not ( = ?auto_386387 ?auto_386394 ) ) ( not ( = ?auto_386388 ?auto_386389 ) ) ( not ( = ?auto_386388 ?auto_386390 ) ) ( not ( = ?auto_386388 ?auto_386391 ) ) ( not ( = ?auto_386388 ?auto_386392 ) ) ( not ( = ?auto_386388 ?auto_386393 ) ) ( not ( = ?auto_386388 ?auto_386394 ) ) ( not ( = ?auto_386389 ?auto_386390 ) ) ( not ( = ?auto_386389 ?auto_386391 ) ) ( not ( = ?auto_386389 ?auto_386392 ) ) ( not ( = ?auto_386389 ?auto_386393 ) ) ( not ( = ?auto_386389 ?auto_386394 ) ) ( not ( = ?auto_386390 ?auto_386391 ) ) ( not ( = ?auto_386390 ?auto_386392 ) ) ( not ( = ?auto_386390 ?auto_386393 ) ) ( not ( = ?auto_386390 ?auto_386394 ) ) ( not ( = ?auto_386391 ?auto_386392 ) ) ( not ( = ?auto_386391 ?auto_386393 ) ) ( not ( = ?auto_386391 ?auto_386394 ) ) ( not ( = ?auto_386392 ?auto_386393 ) ) ( not ( = ?auto_386392 ?auto_386394 ) ) ( not ( = ?auto_386393 ?auto_386394 ) ) ( ON ?auto_386392 ?auto_386393 ) ( ON ?auto_386391 ?auto_386392 ) ( ON ?auto_386390 ?auto_386391 ) ( ON ?auto_386389 ?auto_386390 ) ( ON ?auto_386388 ?auto_386389 ) ( ON ?auto_386387 ?auto_386388 ) ( ON ?auto_386386 ?auto_386387 ) ( ON ?auto_386385 ?auto_386386 ) ( ON ?auto_386384 ?auto_386385 ) ( CLEAR ?auto_386382 ) ( ON ?auto_386383 ?auto_386384 ) ( CLEAR ?auto_386383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_386379 ?auto_386380 ?auto_386381 ?auto_386382 ?auto_386383 )
      ( MAKE-15PILE ?auto_386379 ?auto_386380 ?auto_386381 ?auto_386382 ?auto_386383 ?auto_386384 ?auto_386385 ?auto_386386 ?auto_386387 ?auto_386388 ?auto_386389 ?auto_386390 ?auto_386391 ?auto_386392 ?auto_386393 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386410 - BLOCK
      ?auto_386411 - BLOCK
      ?auto_386412 - BLOCK
      ?auto_386413 - BLOCK
      ?auto_386414 - BLOCK
      ?auto_386415 - BLOCK
      ?auto_386416 - BLOCK
      ?auto_386417 - BLOCK
      ?auto_386418 - BLOCK
      ?auto_386419 - BLOCK
      ?auto_386420 - BLOCK
      ?auto_386421 - BLOCK
      ?auto_386422 - BLOCK
      ?auto_386423 - BLOCK
      ?auto_386424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386424 ) ( ON-TABLE ?auto_386410 ) ( ON ?auto_386411 ?auto_386410 ) ( ON ?auto_386412 ?auto_386411 ) ( ON ?auto_386413 ?auto_386412 ) ( not ( = ?auto_386410 ?auto_386411 ) ) ( not ( = ?auto_386410 ?auto_386412 ) ) ( not ( = ?auto_386410 ?auto_386413 ) ) ( not ( = ?auto_386410 ?auto_386414 ) ) ( not ( = ?auto_386410 ?auto_386415 ) ) ( not ( = ?auto_386410 ?auto_386416 ) ) ( not ( = ?auto_386410 ?auto_386417 ) ) ( not ( = ?auto_386410 ?auto_386418 ) ) ( not ( = ?auto_386410 ?auto_386419 ) ) ( not ( = ?auto_386410 ?auto_386420 ) ) ( not ( = ?auto_386410 ?auto_386421 ) ) ( not ( = ?auto_386410 ?auto_386422 ) ) ( not ( = ?auto_386410 ?auto_386423 ) ) ( not ( = ?auto_386410 ?auto_386424 ) ) ( not ( = ?auto_386411 ?auto_386412 ) ) ( not ( = ?auto_386411 ?auto_386413 ) ) ( not ( = ?auto_386411 ?auto_386414 ) ) ( not ( = ?auto_386411 ?auto_386415 ) ) ( not ( = ?auto_386411 ?auto_386416 ) ) ( not ( = ?auto_386411 ?auto_386417 ) ) ( not ( = ?auto_386411 ?auto_386418 ) ) ( not ( = ?auto_386411 ?auto_386419 ) ) ( not ( = ?auto_386411 ?auto_386420 ) ) ( not ( = ?auto_386411 ?auto_386421 ) ) ( not ( = ?auto_386411 ?auto_386422 ) ) ( not ( = ?auto_386411 ?auto_386423 ) ) ( not ( = ?auto_386411 ?auto_386424 ) ) ( not ( = ?auto_386412 ?auto_386413 ) ) ( not ( = ?auto_386412 ?auto_386414 ) ) ( not ( = ?auto_386412 ?auto_386415 ) ) ( not ( = ?auto_386412 ?auto_386416 ) ) ( not ( = ?auto_386412 ?auto_386417 ) ) ( not ( = ?auto_386412 ?auto_386418 ) ) ( not ( = ?auto_386412 ?auto_386419 ) ) ( not ( = ?auto_386412 ?auto_386420 ) ) ( not ( = ?auto_386412 ?auto_386421 ) ) ( not ( = ?auto_386412 ?auto_386422 ) ) ( not ( = ?auto_386412 ?auto_386423 ) ) ( not ( = ?auto_386412 ?auto_386424 ) ) ( not ( = ?auto_386413 ?auto_386414 ) ) ( not ( = ?auto_386413 ?auto_386415 ) ) ( not ( = ?auto_386413 ?auto_386416 ) ) ( not ( = ?auto_386413 ?auto_386417 ) ) ( not ( = ?auto_386413 ?auto_386418 ) ) ( not ( = ?auto_386413 ?auto_386419 ) ) ( not ( = ?auto_386413 ?auto_386420 ) ) ( not ( = ?auto_386413 ?auto_386421 ) ) ( not ( = ?auto_386413 ?auto_386422 ) ) ( not ( = ?auto_386413 ?auto_386423 ) ) ( not ( = ?auto_386413 ?auto_386424 ) ) ( not ( = ?auto_386414 ?auto_386415 ) ) ( not ( = ?auto_386414 ?auto_386416 ) ) ( not ( = ?auto_386414 ?auto_386417 ) ) ( not ( = ?auto_386414 ?auto_386418 ) ) ( not ( = ?auto_386414 ?auto_386419 ) ) ( not ( = ?auto_386414 ?auto_386420 ) ) ( not ( = ?auto_386414 ?auto_386421 ) ) ( not ( = ?auto_386414 ?auto_386422 ) ) ( not ( = ?auto_386414 ?auto_386423 ) ) ( not ( = ?auto_386414 ?auto_386424 ) ) ( not ( = ?auto_386415 ?auto_386416 ) ) ( not ( = ?auto_386415 ?auto_386417 ) ) ( not ( = ?auto_386415 ?auto_386418 ) ) ( not ( = ?auto_386415 ?auto_386419 ) ) ( not ( = ?auto_386415 ?auto_386420 ) ) ( not ( = ?auto_386415 ?auto_386421 ) ) ( not ( = ?auto_386415 ?auto_386422 ) ) ( not ( = ?auto_386415 ?auto_386423 ) ) ( not ( = ?auto_386415 ?auto_386424 ) ) ( not ( = ?auto_386416 ?auto_386417 ) ) ( not ( = ?auto_386416 ?auto_386418 ) ) ( not ( = ?auto_386416 ?auto_386419 ) ) ( not ( = ?auto_386416 ?auto_386420 ) ) ( not ( = ?auto_386416 ?auto_386421 ) ) ( not ( = ?auto_386416 ?auto_386422 ) ) ( not ( = ?auto_386416 ?auto_386423 ) ) ( not ( = ?auto_386416 ?auto_386424 ) ) ( not ( = ?auto_386417 ?auto_386418 ) ) ( not ( = ?auto_386417 ?auto_386419 ) ) ( not ( = ?auto_386417 ?auto_386420 ) ) ( not ( = ?auto_386417 ?auto_386421 ) ) ( not ( = ?auto_386417 ?auto_386422 ) ) ( not ( = ?auto_386417 ?auto_386423 ) ) ( not ( = ?auto_386417 ?auto_386424 ) ) ( not ( = ?auto_386418 ?auto_386419 ) ) ( not ( = ?auto_386418 ?auto_386420 ) ) ( not ( = ?auto_386418 ?auto_386421 ) ) ( not ( = ?auto_386418 ?auto_386422 ) ) ( not ( = ?auto_386418 ?auto_386423 ) ) ( not ( = ?auto_386418 ?auto_386424 ) ) ( not ( = ?auto_386419 ?auto_386420 ) ) ( not ( = ?auto_386419 ?auto_386421 ) ) ( not ( = ?auto_386419 ?auto_386422 ) ) ( not ( = ?auto_386419 ?auto_386423 ) ) ( not ( = ?auto_386419 ?auto_386424 ) ) ( not ( = ?auto_386420 ?auto_386421 ) ) ( not ( = ?auto_386420 ?auto_386422 ) ) ( not ( = ?auto_386420 ?auto_386423 ) ) ( not ( = ?auto_386420 ?auto_386424 ) ) ( not ( = ?auto_386421 ?auto_386422 ) ) ( not ( = ?auto_386421 ?auto_386423 ) ) ( not ( = ?auto_386421 ?auto_386424 ) ) ( not ( = ?auto_386422 ?auto_386423 ) ) ( not ( = ?auto_386422 ?auto_386424 ) ) ( not ( = ?auto_386423 ?auto_386424 ) ) ( ON ?auto_386423 ?auto_386424 ) ( ON ?auto_386422 ?auto_386423 ) ( ON ?auto_386421 ?auto_386422 ) ( ON ?auto_386420 ?auto_386421 ) ( ON ?auto_386419 ?auto_386420 ) ( ON ?auto_386418 ?auto_386419 ) ( ON ?auto_386417 ?auto_386418 ) ( ON ?auto_386416 ?auto_386417 ) ( ON ?auto_386415 ?auto_386416 ) ( CLEAR ?auto_386413 ) ( ON ?auto_386414 ?auto_386415 ) ( CLEAR ?auto_386414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_386410 ?auto_386411 ?auto_386412 ?auto_386413 ?auto_386414 )
      ( MAKE-15PILE ?auto_386410 ?auto_386411 ?auto_386412 ?auto_386413 ?auto_386414 ?auto_386415 ?auto_386416 ?auto_386417 ?auto_386418 ?auto_386419 ?auto_386420 ?auto_386421 ?auto_386422 ?auto_386423 ?auto_386424 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386440 - BLOCK
      ?auto_386441 - BLOCK
      ?auto_386442 - BLOCK
      ?auto_386443 - BLOCK
      ?auto_386444 - BLOCK
      ?auto_386445 - BLOCK
      ?auto_386446 - BLOCK
      ?auto_386447 - BLOCK
      ?auto_386448 - BLOCK
      ?auto_386449 - BLOCK
      ?auto_386450 - BLOCK
      ?auto_386451 - BLOCK
      ?auto_386452 - BLOCK
      ?auto_386453 - BLOCK
      ?auto_386454 - BLOCK
    )
    :vars
    (
      ?auto_386455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386454 ?auto_386455 ) ( ON-TABLE ?auto_386440 ) ( ON ?auto_386441 ?auto_386440 ) ( ON ?auto_386442 ?auto_386441 ) ( not ( = ?auto_386440 ?auto_386441 ) ) ( not ( = ?auto_386440 ?auto_386442 ) ) ( not ( = ?auto_386440 ?auto_386443 ) ) ( not ( = ?auto_386440 ?auto_386444 ) ) ( not ( = ?auto_386440 ?auto_386445 ) ) ( not ( = ?auto_386440 ?auto_386446 ) ) ( not ( = ?auto_386440 ?auto_386447 ) ) ( not ( = ?auto_386440 ?auto_386448 ) ) ( not ( = ?auto_386440 ?auto_386449 ) ) ( not ( = ?auto_386440 ?auto_386450 ) ) ( not ( = ?auto_386440 ?auto_386451 ) ) ( not ( = ?auto_386440 ?auto_386452 ) ) ( not ( = ?auto_386440 ?auto_386453 ) ) ( not ( = ?auto_386440 ?auto_386454 ) ) ( not ( = ?auto_386440 ?auto_386455 ) ) ( not ( = ?auto_386441 ?auto_386442 ) ) ( not ( = ?auto_386441 ?auto_386443 ) ) ( not ( = ?auto_386441 ?auto_386444 ) ) ( not ( = ?auto_386441 ?auto_386445 ) ) ( not ( = ?auto_386441 ?auto_386446 ) ) ( not ( = ?auto_386441 ?auto_386447 ) ) ( not ( = ?auto_386441 ?auto_386448 ) ) ( not ( = ?auto_386441 ?auto_386449 ) ) ( not ( = ?auto_386441 ?auto_386450 ) ) ( not ( = ?auto_386441 ?auto_386451 ) ) ( not ( = ?auto_386441 ?auto_386452 ) ) ( not ( = ?auto_386441 ?auto_386453 ) ) ( not ( = ?auto_386441 ?auto_386454 ) ) ( not ( = ?auto_386441 ?auto_386455 ) ) ( not ( = ?auto_386442 ?auto_386443 ) ) ( not ( = ?auto_386442 ?auto_386444 ) ) ( not ( = ?auto_386442 ?auto_386445 ) ) ( not ( = ?auto_386442 ?auto_386446 ) ) ( not ( = ?auto_386442 ?auto_386447 ) ) ( not ( = ?auto_386442 ?auto_386448 ) ) ( not ( = ?auto_386442 ?auto_386449 ) ) ( not ( = ?auto_386442 ?auto_386450 ) ) ( not ( = ?auto_386442 ?auto_386451 ) ) ( not ( = ?auto_386442 ?auto_386452 ) ) ( not ( = ?auto_386442 ?auto_386453 ) ) ( not ( = ?auto_386442 ?auto_386454 ) ) ( not ( = ?auto_386442 ?auto_386455 ) ) ( not ( = ?auto_386443 ?auto_386444 ) ) ( not ( = ?auto_386443 ?auto_386445 ) ) ( not ( = ?auto_386443 ?auto_386446 ) ) ( not ( = ?auto_386443 ?auto_386447 ) ) ( not ( = ?auto_386443 ?auto_386448 ) ) ( not ( = ?auto_386443 ?auto_386449 ) ) ( not ( = ?auto_386443 ?auto_386450 ) ) ( not ( = ?auto_386443 ?auto_386451 ) ) ( not ( = ?auto_386443 ?auto_386452 ) ) ( not ( = ?auto_386443 ?auto_386453 ) ) ( not ( = ?auto_386443 ?auto_386454 ) ) ( not ( = ?auto_386443 ?auto_386455 ) ) ( not ( = ?auto_386444 ?auto_386445 ) ) ( not ( = ?auto_386444 ?auto_386446 ) ) ( not ( = ?auto_386444 ?auto_386447 ) ) ( not ( = ?auto_386444 ?auto_386448 ) ) ( not ( = ?auto_386444 ?auto_386449 ) ) ( not ( = ?auto_386444 ?auto_386450 ) ) ( not ( = ?auto_386444 ?auto_386451 ) ) ( not ( = ?auto_386444 ?auto_386452 ) ) ( not ( = ?auto_386444 ?auto_386453 ) ) ( not ( = ?auto_386444 ?auto_386454 ) ) ( not ( = ?auto_386444 ?auto_386455 ) ) ( not ( = ?auto_386445 ?auto_386446 ) ) ( not ( = ?auto_386445 ?auto_386447 ) ) ( not ( = ?auto_386445 ?auto_386448 ) ) ( not ( = ?auto_386445 ?auto_386449 ) ) ( not ( = ?auto_386445 ?auto_386450 ) ) ( not ( = ?auto_386445 ?auto_386451 ) ) ( not ( = ?auto_386445 ?auto_386452 ) ) ( not ( = ?auto_386445 ?auto_386453 ) ) ( not ( = ?auto_386445 ?auto_386454 ) ) ( not ( = ?auto_386445 ?auto_386455 ) ) ( not ( = ?auto_386446 ?auto_386447 ) ) ( not ( = ?auto_386446 ?auto_386448 ) ) ( not ( = ?auto_386446 ?auto_386449 ) ) ( not ( = ?auto_386446 ?auto_386450 ) ) ( not ( = ?auto_386446 ?auto_386451 ) ) ( not ( = ?auto_386446 ?auto_386452 ) ) ( not ( = ?auto_386446 ?auto_386453 ) ) ( not ( = ?auto_386446 ?auto_386454 ) ) ( not ( = ?auto_386446 ?auto_386455 ) ) ( not ( = ?auto_386447 ?auto_386448 ) ) ( not ( = ?auto_386447 ?auto_386449 ) ) ( not ( = ?auto_386447 ?auto_386450 ) ) ( not ( = ?auto_386447 ?auto_386451 ) ) ( not ( = ?auto_386447 ?auto_386452 ) ) ( not ( = ?auto_386447 ?auto_386453 ) ) ( not ( = ?auto_386447 ?auto_386454 ) ) ( not ( = ?auto_386447 ?auto_386455 ) ) ( not ( = ?auto_386448 ?auto_386449 ) ) ( not ( = ?auto_386448 ?auto_386450 ) ) ( not ( = ?auto_386448 ?auto_386451 ) ) ( not ( = ?auto_386448 ?auto_386452 ) ) ( not ( = ?auto_386448 ?auto_386453 ) ) ( not ( = ?auto_386448 ?auto_386454 ) ) ( not ( = ?auto_386448 ?auto_386455 ) ) ( not ( = ?auto_386449 ?auto_386450 ) ) ( not ( = ?auto_386449 ?auto_386451 ) ) ( not ( = ?auto_386449 ?auto_386452 ) ) ( not ( = ?auto_386449 ?auto_386453 ) ) ( not ( = ?auto_386449 ?auto_386454 ) ) ( not ( = ?auto_386449 ?auto_386455 ) ) ( not ( = ?auto_386450 ?auto_386451 ) ) ( not ( = ?auto_386450 ?auto_386452 ) ) ( not ( = ?auto_386450 ?auto_386453 ) ) ( not ( = ?auto_386450 ?auto_386454 ) ) ( not ( = ?auto_386450 ?auto_386455 ) ) ( not ( = ?auto_386451 ?auto_386452 ) ) ( not ( = ?auto_386451 ?auto_386453 ) ) ( not ( = ?auto_386451 ?auto_386454 ) ) ( not ( = ?auto_386451 ?auto_386455 ) ) ( not ( = ?auto_386452 ?auto_386453 ) ) ( not ( = ?auto_386452 ?auto_386454 ) ) ( not ( = ?auto_386452 ?auto_386455 ) ) ( not ( = ?auto_386453 ?auto_386454 ) ) ( not ( = ?auto_386453 ?auto_386455 ) ) ( not ( = ?auto_386454 ?auto_386455 ) ) ( ON ?auto_386453 ?auto_386454 ) ( ON ?auto_386452 ?auto_386453 ) ( ON ?auto_386451 ?auto_386452 ) ( ON ?auto_386450 ?auto_386451 ) ( ON ?auto_386449 ?auto_386450 ) ( ON ?auto_386448 ?auto_386449 ) ( ON ?auto_386447 ?auto_386448 ) ( ON ?auto_386446 ?auto_386447 ) ( ON ?auto_386445 ?auto_386446 ) ( ON ?auto_386444 ?auto_386445 ) ( CLEAR ?auto_386442 ) ( ON ?auto_386443 ?auto_386444 ) ( CLEAR ?auto_386443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_386440 ?auto_386441 ?auto_386442 ?auto_386443 )
      ( MAKE-15PILE ?auto_386440 ?auto_386441 ?auto_386442 ?auto_386443 ?auto_386444 ?auto_386445 ?auto_386446 ?auto_386447 ?auto_386448 ?auto_386449 ?auto_386450 ?auto_386451 ?auto_386452 ?auto_386453 ?auto_386454 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386471 - BLOCK
      ?auto_386472 - BLOCK
      ?auto_386473 - BLOCK
      ?auto_386474 - BLOCK
      ?auto_386475 - BLOCK
      ?auto_386476 - BLOCK
      ?auto_386477 - BLOCK
      ?auto_386478 - BLOCK
      ?auto_386479 - BLOCK
      ?auto_386480 - BLOCK
      ?auto_386481 - BLOCK
      ?auto_386482 - BLOCK
      ?auto_386483 - BLOCK
      ?auto_386484 - BLOCK
      ?auto_386485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386485 ) ( ON-TABLE ?auto_386471 ) ( ON ?auto_386472 ?auto_386471 ) ( ON ?auto_386473 ?auto_386472 ) ( not ( = ?auto_386471 ?auto_386472 ) ) ( not ( = ?auto_386471 ?auto_386473 ) ) ( not ( = ?auto_386471 ?auto_386474 ) ) ( not ( = ?auto_386471 ?auto_386475 ) ) ( not ( = ?auto_386471 ?auto_386476 ) ) ( not ( = ?auto_386471 ?auto_386477 ) ) ( not ( = ?auto_386471 ?auto_386478 ) ) ( not ( = ?auto_386471 ?auto_386479 ) ) ( not ( = ?auto_386471 ?auto_386480 ) ) ( not ( = ?auto_386471 ?auto_386481 ) ) ( not ( = ?auto_386471 ?auto_386482 ) ) ( not ( = ?auto_386471 ?auto_386483 ) ) ( not ( = ?auto_386471 ?auto_386484 ) ) ( not ( = ?auto_386471 ?auto_386485 ) ) ( not ( = ?auto_386472 ?auto_386473 ) ) ( not ( = ?auto_386472 ?auto_386474 ) ) ( not ( = ?auto_386472 ?auto_386475 ) ) ( not ( = ?auto_386472 ?auto_386476 ) ) ( not ( = ?auto_386472 ?auto_386477 ) ) ( not ( = ?auto_386472 ?auto_386478 ) ) ( not ( = ?auto_386472 ?auto_386479 ) ) ( not ( = ?auto_386472 ?auto_386480 ) ) ( not ( = ?auto_386472 ?auto_386481 ) ) ( not ( = ?auto_386472 ?auto_386482 ) ) ( not ( = ?auto_386472 ?auto_386483 ) ) ( not ( = ?auto_386472 ?auto_386484 ) ) ( not ( = ?auto_386472 ?auto_386485 ) ) ( not ( = ?auto_386473 ?auto_386474 ) ) ( not ( = ?auto_386473 ?auto_386475 ) ) ( not ( = ?auto_386473 ?auto_386476 ) ) ( not ( = ?auto_386473 ?auto_386477 ) ) ( not ( = ?auto_386473 ?auto_386478 ) ) ( not ( = ?auto_386473 ?auto_386479 ) ) ( not ( = ?auto_386473 ?auto_386480 ) ) ( not ( = ?auto_386473 ?auto_386481 ) ) ( not ( = ?auto_386473 ?auto_386482 ) ) ( not ( = ?auto_386473 ?auto_386483 ) ) ( not ( = ?auto_386473 ?auto_386484 ) ) ( not ( = ?auto_386473 ?auto_386485 ) ) ( not ( = ?auto_386474 ?auto_386475 ) ) ( not ( = ?auto_386474 ?auto_386476 ) ) ( not ( = ?auto_386474 ?auto_386477 ) ) ( not ( = ?auto_386474 ?auto_386478 ) ) ( not ( = ?auto_386474 ?auto_386479 ) ) ( not ( = ?auto_386474 ?auto_386480 ) ) ( not ( = ?auto_386474 ?auto_386481 ) ) ( not ( = ?auto_386474 ?auto_386482 ) ) ( not ( = ?auto_386474 ?auto_386483 ) ) ( not ( = ?auto_386474 ?auto_386484 ) ) ( not ( = ?auto_386474 ?auto_386485 ) ) ( not ( = ?auto_386475 ?auto_386476 ) ) ( not ( = ?auto_386475 ?auto_386477 ) ) ( not ( = ?auto_386475 ?auto_386478 ) ) ( not ( = ?auto_386475 ?auto_386479 ) ) ( not ( = ?auto_386475 ?auto_386480 ) ) ( not ( = ?auto_386475 ?auto_386481 ) ) ( not ( = ?auto_386475 ?auto_386482 ) ) ( not ( = ?auto_386475 ?auto_386483 ) ) ( not ( = ?auto_386475 ?auto_386484 ) ) ( not ( = ?auto_386475 ?auto_386485 ) ) ( not ( = ?auto_386476 ?auto_386477 ) ) ( not ( = ?auto_386476 ?auto_386478 ) ) ( not ( = ?auto_386476 ?auto_386479 ) ) ( not ( = ?auto_386476 ?auto_386480 ) ) ( not ( = ?auto_386476 ?auto_386481 ) ) ( not ( = ?auto_386476 ?auto_386482 ) ) ( not ( = ?auto_386476 ?auto_386483 ) ) ( not ( = ?auto_386476 ?auto_386484 ) ) ( not ( = ?auto_386476 ?auto_386485 ) ) ( not ( = ?auto_386477 ?auto_386478 ) ) ( not ( = ?auto_386477 ?auto_386479 ) ) ( not ( = ?auto_386477 ?auto_386480 ) ) ( not ( = ?auto_386477 ?auto_386481 ) ) ( not ( = ?auto_386477 ?auto_386482 ) ) ( not ( = ?auto_386477 ?auto_386483 ) ) ( not ( = ?auto_386477 ?auto_386484 ) ) ( not ( = ?auto_386477 ?auto_386485 ) ) ( not ( = ?auto_386478 ?auto_386479 ) ) ( not ( = ?auto_386478 ?auto_386480 ) ) ( not ( = ?auto_386478 ?auto_386481 ) ) ( not ( = ?auto_386478 ?auto_386482 ) ) ( not ( = ?auto_386478 ?auto_386483 ) ) ( not ( = ?auto_386478 ?auto_386484 ) ) ( not ( = ?auto_386478 ?auto_386485 ) ) ( not ( = ?auto_386479 ?auto_386480 ) ) ( not ( = ?auto_386479 ?auto_386481 ) ) ( not ( = ?auto_386479 ?auto_386482 ) ) ( not ( = ?auto_386479 ?auto_386483 ) ) ( not ( = ?auto_386479 ?auto_386484 ) ) ( not ( = ?auto_386479 ?auto_386485 ) ) ( not ( = ?auto_386480 ?auto_386481 ) ) ( not ( = ?auto_386480 ?auto_386482 ) ) ( not ( = ?auto_386480 ?auto_386483 ) ) ( not ( = ?auto_386480 ?auto_386484 ) ) ( not ( = ?auto_386480 ?auto_386485 ) ) ( not ( = ?auto_386481 ?auto_386482 ) ) ( not ( = ?auto_386481 ?auto_386483 ) ) ( not ( = ?auto_386481 ?auto_386484 ) ) ( not ( = ?auto_386481 ?auto_386485 ) ) ( not ( = ?auto_386482 ?auto_386483 ) ) ( not ( = ?auto_386482 ?auto_386484 ) ) ( not ( = ?auto_386482 ?auto_386485 ) ) ( not ( = ?auto_386483 ?auto_386484 ) ) ( not ( = ?auto_386483 ?auto_386485 ) ) ( not ( = ?auto_386484 ?auto_386485 ) ) ( ON ?auto_386484 ?auto_386485 ) ( ON ?auto_386483 ?auto_386484 ) ( ON ?auto_386482 ?auto_386483 ) ( ON ?auto_386481 ?auto_386482 ) ( ON ?auto_386480 ?auto_386481 ) ( ON ?auto_386479 ?auto_386480 ) ( ON ?auto_386478 ?auto_386479 ) ( ON ?auto_386477 ?auto_386478 ) ( ON ?auto_386476 ?auto_386477 ) ( ON ?auto_386475 ?auto_386476 ) ( CLEAR ?auto_386473 ) ( ON ?auto_386474 ?auto_386475 ) ( CLEAR ?auto_386474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_386471 ?auto_386472 ?auto_386473 ?auto_386474 )
      ( MAKE-15PILE ?auto_386471 ?auto_386472 ?auto_386473 ?auto_386474 ?auto_386475 ?auto_386476 ?auto_386477 ?auto_386478 ?auto_386479 ?auto_386480 ?auto_386481 ?auto_386482 ?auto_386483 ?auto_386484 ?auto_386485 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386501 - BLOCK
      ?auto_386502 - BLOCK
      ?auto_386503 - BLOCK
      ?auto_386504 - BLOCK
      ?auto_386505 - BLOCK
      ?auto_386506 - BLOCK
      ?auto_386507 - BLOCK
      ?auto_386508 - BLOCK
      ?auto_386509 - BLOCK
      ?auto_386510 - BLOCK
      ?auto_386511 - BLOCK
      ?auto_386512 - BLOCK
      ?auto_386513 - BLOCK
      ?auto_386514 - BLOCK
      ?auto_386515 - BLOCK
    )
    :vars
    (
      ?auto_386516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386515 ?auto_386516 ) ( ON-TABLE ?auto_386501 ) ( ON ?auto_386502 ?auto_386501 ) ( not ( = ?auto_386501 ?auto_386502 ) ) ( not ( = ?auto_386501 ?auto_386503 ) ) ( not ( = ?auto_386501 ?auto_386504 ) ) ( not ( = ?auto_386501 ?auto_386505 ) ) ( not ( = ?auto_386501 ?auto_386506 ) ) ( not ( = ?auto_386501 ?auto_386507 ) ) ( not ( = ?auto_386501 ?auto_386508 ) ) ( not ( = ?auto_386501 ?auto_386509 ) ) ( not ( = ?auto_386501 ?auto_386510 ) ) ( not ( = ?auto_386501 ?auto_386511 ) ) ( not ( = ?auto_386501 ?auto_386512 ) ) ( not ( = ?auto_386501 ?auto_386513 ) ) ( not ( = ?auto_386501 ?auto_386514 ) ) ( not ( = ?auto_386501 ?auto_386515 ) ) ( not ( = ?auto_386501 ?auto_386516 ) ) ( not ( = ?auto_386502 ?auto_386503 ) ) ( not ( = ?auto_386502 ?auto_386504 ) ) ( not ( = ?auto_386502 ?auto_386505 ) ) ( not ( = ?auto_386502 ?auto_386506 ) ) ( not ( = ?auto_386502 ?auto_386507 ) ) ( not ( = ?auto_386502 ?auto_386508 ) ) ( not ( = ?auto_386502 ?auto_386509 ) ) ( not ( = ?auto_386502 ?auto_386510 ) ) ( not ( = ?auto_386502 ?auto_386511 ) ) ( not ( = ?auto_386502 ?auto_386512 ) ) ( not ( = ?auto_386502 ?auto_386513 ) ) ( not ( = ?auto_386502 ?auto_386514 ) ) ( not ( = ?auto_386502 ?auto_386515 ) ) ( not ( = ?auto_386502 ?auto_386516 ) ) ( not ( = ?auto_386503 ?auto_386504 ) ) ( not ( = ?auto_386503 ?auto_386505 ) ) ( not ( = ?auto_386503 ?auto_386506 ) ) ( not ( = ?auto_386503 ?auto_386507 ) ) ( not ( = ?auto_386503 ?auto_386508 ) ) ( not ( = ?auto_386503 ?auto_386509 ) ) ( not ( = ?auto_386503 ?auto_386510 ) ) ( not ( = ?auto_386503 ?auto_386511 ) ) ( not ( = ?auto_386503 ?auto_386512 ) ) ( not ( = ?auto_386503 ?auto_386513 ) ) ( not ( = ?auto_386503 ?auto_386514 ) ) ( not ( = ?auto_386503 ?auto_386515 ) ) ( not ( = ?auto_386503 ?auto_386516 ) ) ( not ( = ?auto_386504 ?auto_386505 ) ) ( not ( = ?auto_386504 ?auto_386506 ) ) ( not ( = ?auto_386504 ?auto_386507 ) ) ( not ( = ?auto_386504 ?auto_386508 ) ) ( not ( = ?auto_386504 ?auto_386509 ) ) ( not ( = ?auto_386504 ?auto_386510 ) ) ( not ( = ?auto_386504 ?auto_386511 ) ) ( not ( = ?auto_386504 ?auto_386512 ) ) ( not ( = ?auto_386504 ?auto_386513 ) ) ( not ( = ?auto_386504 ?auto_386514 ) ) ( not ( = ?auto_386504 ?auto_386515 ) ) ( not ( = ?auto_386504 ?auto_386516 ) ) ( not ( = ?auto_386505 ?auto_386506 ) ) ( not ( = ?auto_386505 ?auto_386507 ) ) ( not ( = ?auto_386505 ?auto_386508 ) ) ( not ( = ?auto_386505 ?auto_386509 ) ) ( not ( = ?auto_386505 ?auto_386510 ) ) ( not ( = ?auto_386505 ?auto_386511 ) ) ( not ( = ?auto_386505 ?auto_386512 ) ) ( not ( = ?auto_386505 ?auto_386513 ) ) ( not ( = ?auto_386505 ?auto_386514 ) ) ( not ( = ?auto_386505 ?auto_386515 ) ) ( not ( = ?auto_386505 ?auto_386516 ) ) ( not ( = ?auto_386506 ?auto_386507 ) ) ( not ( = ?auto_386506 ?auto_386508 ) ) ( not ( = ?auto_386506 ?auto_386509 ) ) ( not ( = ?auto_386506 ?auto_386510 ) ) ( not ( = ?auto_386506 ?auto_386511 ) ) ( not ( = ?auto_386506 ?auto_386512 ) ) ( not ( = ?auto_386506 ?auto_386513 ) ) ( not ( = ?auto_386506 ?auto_386514 ) ) ( not ( = ?auto_386506 ?auto_386515 ) ) ( not ( = ?auto_386506 ?auto_386516 ) ) ( not ( = ?auto_386507 ?auto_386508 ) ) ( not ( = ?auto_386507 ?auto_386509 ) ) ( not ( = ?auto_386507 ?auto_386510 ) ) ( not ( = ?auto_386507 ?auto_386511 ) ) ( not ( = ?auto_386507 ?auto_386512 ) ) ( not ( = ?auto_386507 ?auto_386513 ) ) ( not ( = ?auto_386507 ?auto_386514 ) ) ( not ( = ?auto_386507 ?auto_386515 ) ) ( not ( = ?auto_386507 ?auto_386516 ) ) ( not ( = ?auto_386508 ?auto_386509 ) ) ( not ( = ?auto_386508 ?auto_386510 ) ) ( not ( = ?auto_386508 ?auto_386511 ) ) ( not ( = ?auto_386508 ?auto_386512 ) ) ( not ( = ?auto_386508 ?auto_386513 ) ) ( not ( = ?auto_386508 ?auto_386514 ) ) ( not ( = ?auto_386508 ?auto_386515 ) ) ( not ( = ?auto_386508 ?auto_386516 ) ) ( not ( = ?auto_386509 ?auto_386510 ) ) ( not ( = ?auto_386509 ?auto_386511 ) ) ( not ( = ?auto_386509 ?auto_386512 ) ) ( not ( = ?auto_386509 ?auto_386513 ) ) ( not ( = ?auto_386509 ?auto_386514 ) ) ( not ( = ?auto_386509 ?auto_386515 ) ) ( not ( = ?auto_386509 ?auto_386516 ) ) ( not ( = ?auto_386510 ?auto_386511 ) ) ( not ( = ?auto_386510 ?auto_386512 ) ) ( not ( = ?auto_386510 ?auto_386513 ) ) ( not ( = ?auto_386510 ?auto_386514 ) ) ( not ( = ?auto_386510 ?auto_386515 ) ) ( not ( = ?auto_386510 ?auto_386516 ) ) ( not ( = ?auto_386511 ?auto_386512 ) ) ( not ( = ?auto_386511 ?auto_386513 ) ) ( not ( = ?auto_386511 ?auto_386514 ) ) ( not ( = ?auto_386511 ?auto_386515 ) ) ( not ( = ?auto_386511 ?auto_386516 ) ) ( not ( = ?auto_386512 ?auto_386513 ) ) ( not ( = ?auto_386512 ?auto_386514 ) ) ( not ( = ?auto_386512 ?auto_386515 ) ) ( not ( = ?auto_386512 ?auto_386516 ) ) ( not ( = ?auto_386513 ?auto_386514 ) ) ( not ( = ?auto_386513 ?auto_386515 ) ) ( not ( = ?auto_386513 ?auto_386516 ) ) ( not ( = ?auto_386514 ?auto_386515 ) ) ( not ( = ?auto_386514 ?auto_386516 ) ) ( not ( = ?auto_386515 ?auto_386516 ) ) ( ON ?auto_386514 ?auto_386515 ) ( ON ?auto_386513 ?auto_386514 ) ( ON ?auto_386512 ?auto_386513 ) ( ON ?auto_386511 ?auto_386512 ) ( ON ?auto_386510 ?auto_386511 ) ( ON ?auto_386509 ?auto_386510 ) ( ON ?auto_386508 ?auto_386509 ) ( ON ?auto_386507 ?auto_386508 ) ( ON ?auto_386506 ?auto_386507 ) ( ON ?auto_386505 ?auto_386506 ) ( ON ?auto_386504 ?auto_386505 ) ( CLEAR ?auto_386502 ) ( ON ?auto_386503 ?auto_386504 ) ( CLEAR ?auto_386503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386501 ?auto_386502 ?auto_386503 )
      ( MAKE-15PILE ?auto_386501 ?auto_386502 ?auto_386503 ?auto_386504 ?auto_386505 ?auto_386506 ?auto_386507 ?auto_386508 ?auto_386509 ?auto_386510 ?auto_386511 ?auto_386512 ?auto_386513 ?auto_386514 ?auto_386515 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386532 - BLOCK
      ?auto_386533 - BLOCK
      ?auto_386534 - BLOCK
      ?auto_386535 - BLOCK
      ?auto_386536 - BLOCK
      ?auto_386537 - BLOCK
      ?auto_386538 - BLOCK
      ?auto_386539 - BLOCK
      ?auto_386540 - BLOCK
      ?auto_386541 - BLOCK
      ?auto_386542 - BLOCK
      ?auto_386543 - BLOCK
      ?auto_386544 - BLOCK
      ?auto_386545 - BLOCK
      ?auto_386546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386546 ) ( ON-TABLE ?auto_386532 ) ( ON ?auto_386533 ?auto_386532 ) ( not ( = ?auto_386532 ?auto_386533 ) ) ( not ( = ?auto_386532 ?auto_386534 ) ) ( not ( = ?auto_386532 ?auto_386535 ) ) ( not ( = ?auto_386532 ?auto_386536 ) ) ( not ( = ?auto_386532 ?auto_386537 ) ) ( not ( = ?auto_386532 ?auto_386538 ) ) ( not ( = ?auto_386532 ?auto_386539 ) ) ( not ( = ?auto_386532 ?auto_386540 ) ) ( not ( = ?auto_386532 ?auto_386541 ) ) ( not ( = ?auto_386532 ?auto_386542 ) ) ( not ( = ?auto_386532 ?auto_386543 ) ) ( not ( = ?auto_386532 ?auto_386544 ) ) ( not ( = ?auto_386532 ?auto_386545 ) ) ( not ( = ?auto_386532 ?auto_386546 ) ) ( not ( = ?auto_386533 ?auto_386534 ) ) ( not ( = ?auto_386533 ?auto_386535 ) ) ( not ( = ?auto_386533 ?auto_386536 ) ) ( not ( = ?auto_386533 ?auto_386537 ) ) ( not ( = ?auto_386533 ?auto_386538 ) ) ( not ( = ?auto_386533 ?auto_386539 ) ) ( not ( = ?auto_386533 ?auto_386540 ) ) ( not ( = ?auto_386533 ?auto_386541 ) ) ( not ( = ?auto_386533 ?auto_386542 ) ) ( not ( = ?auto_386533 ?auto_386543 ) ) ( not ( = ?auto_386533 ?auto_386544 ) ) ( not ( = ?auto_386533 ?auto_386545 ) ) ( not ( = ?auto_386533 ?auto_386546 ) ) ( not ( = ?auto_386534 ?auto_386535 ) ) ( not ( = ?auto_386534 ?auto_386536 ) ) ( not ( = ?auto_386534 ?auto_386537 ) ) ( not ( = ?auto_386534 ?auto_386538 ) ) ( not ( = ?auto_386534 ?auto_386539 ) ) ( not ( = ?auto_386534 ?auto_386540 ) ) ( not ( = ?auto_386534 ?auto_386541 ) ) ( not ( = ?auto_386534 ?auto_386542 ) ) ( not ( = ?auto_386534 ?auto_386543 ) ) ( not ( = ?auto_386534 ?auto_386544 ) ) ( not ( = ?auto_386534 ?auto_386545 ) ) ( not ( = ?auto_386534 ?auto_386546 ) ) ( not ( = ?auto_386535 ?auto_386536 ) ) ( not ( = ?auto_386535 ?auto_386537 ) ) ( not ( = ?auto_386535 ?auto_386538 ) ) ( not ( = ?auto_386535 ?auto_386539 ) ) ( not ( = ?auto_386535 ?auto_386540 ) ) ( not ( = ?auto_386535 ?auto_386541 ) ) ( not ( = ?auto_386535 ?auto_386542 ) ) ( not ( = ?auto_386535 ?auto_386543 ) ) ( not ( = ?auto_386535 ?auto_386544 ) ) ( not ( = ?auto_386535 ?auto_386545 ) ) ( not ( = ?auto_386535 ?auto_386546 ) ) ( not ( = ?auto_386536 ?auto_386537 ) ) ( not ( = ?auto_386536 ?auto_386538 ) ) ( not ( = ?auto_386536 ?auto_386539 ) ) ( not ( = ?auto_386536 ?auto_386540 ) ) ( not ( = ?auto_386536 ?auto_386541 ) ) ( not ( = ?auto_386536 ?auto_386542 ) ) ( not ( = ?auto_386536 ?auto_386543 ) ) ( not ( = ?auto_386536 ?auto_386544 ) ) ( not ( = ?auto_386536 ?auto_386545 ) ) ( not ( = ?auto_386536 ?auto_386546 ) ) ( not ( = ?auto_386537 ?auto_386538 ) ) ( not ( = ?auto_386537 ?auto_386539 ) ) ( not ( = ?auto_386537 ?auto_386540 ) ) ( not ( = ?auto_386537 ?auto_386541 ) ) ( not ( = ?auto_386537 ?auto_386542 ) ) ( not ( = ?auto_386537 ?auto_386543 ) ) ( not ( = ?auto_386537 ?auto_386544 ) ) ( not ( = ?auto_386537 ?auto_386545 ) ) ( not ( = ?auto_386537 ?auto_386546 ) ) ( not ( = ?auto_386538 ?auto_386539 ) ) ( not ( = ?auto_386538 ?auto_386540 ) ) ( not ( = ?auto_386538 ?auto_386541 ) ) ( not ( = ?auto_386538 ?auto_386542 ) ) ( not ( = ?auto_386538 ?auto_386543 ) ) ( not ( = ?auto_386538 ?auto_386544 ) ) ( not ( = ?auto_386538 ?auto_386545 ) ) ( not ( = ?auto_386538 ?auto_386546 ) ) ( not ( = ?auto_386539 ?auto_386540 ) ) ( not ( = ?auto_386539 ?auto_386541 ) ) ( not ( = ?auto_386539 ?auto_386542 ) ) ( not ( = ?auto_386539 ?auto_386543 ) ) ( not ( = ?auto_386539 ?auto_386544 ) ) ( not ( = ?auto_386539 ?auto_386545 ) ) ( not ( = ?auto_386539 ?auto_386546 ) ) ( not ( = ?auto_386540 ?auto_386541 ) ) ( not ( = ?auto_386540 ?auto_386542 ) ) ( not ( = ?auto_386540 ?auto_386543 ) ) ( not ( = ?auto_386540 ?auto_386544 ) ) ( not ( = ?auto_386540 ?auto_386545 ) ) ( not ( = ?auto_386540 ?auto_386546 ) ) ( not ( = ?auto_386541 ?auto_386542 ) ) ( not ( = ?auto_386541 ?auto_386543 ) ) ( not ( = ?auto_386541 ?auto_386544 ) ) ( not ( = ?auto_386541 ?auto_386545 ) ) ( not ( = ?auto_386541 ?auto_386546 ) ) ( not ( = ?auto_386542 ?auto_386543 ) ) ( not ( = ?auto_386542 ?auto_386544 ) ) ( not ( = ?auto_386542 ?auto_386545 ) ) ( not ( = ?auto_386542 ?auto_386546 ) ) ( not ( = ?auto_386543 ?auto_386544 ) ) ( not ( = ?auto_386543 ?auto_386545 ) ) ( not ( = ?auto_386543 ?auto_386546 ) ) ( not ( = ?auto_386544 ?auto_386545 ) ) ( not ( = ?auto_386544 ?auto_386546 ) ) ( not ( = ?auto_386545 ?auto_386546 ) ) ( ON ?auto_386545 ?auto_386546 ) ( ON ?auto_386544 ?auto_386545 ) ( ON ?auto_386543 ?auto_386544 ) ( ON ?auto_386542 ?auto_386543 ) ( ON ?auto_386541 ?auto_386542 ) ( ON ?auto_386540 ?auto_386541 ) ( ON ?auto_386539 ?auto_386540 ) ( ON ?auto_386538 ?auto_386539 ) ( ON ?auto_386537 ?auto_386538 ) ( ON ?auto_386536 ?auto_386537 ) ( ON ?auto_386535 ?auto_386536 ) ( CLEAR ?auto_386533 ) ( ON ?auto_386534 ?auto_386535 ) ( CLEAR ?auto_386534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386532 ?auto_386533 ?auto_386534 )
      ( MAKE-15PILE ?auto_386532 ?auto_386533 ?auto_386534 ?auto_386535 ?auto_386536 ?auto_386537 ?auto_386538 ?auto_386539 ?auto_386540 ?auto_386541 ?auto_386542 ?auto_386543 ?auto_386544 ?auto_386545 ?auto_386546 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386562 - BLOCK
      ?auto_386563 - BLOCK
      ?auto_386564 - BLOCK
      ?auto_386565 - BLOCK
      ?auto_386566 - BLOCK
      ?auto_386567 - BLOCK
      ?auto_386568 - BLOCK
      ?auto_386569 - BLOCK
      ?auto_386570 - BLOCK
      ?auto_386571 - BLOCK
      ?auto_386572 - BLOCK
      ?auto_386573 - BLOCK
      ?auto_386574 - BLOCK
      ?auto_386575 - BLOCK
      ?auto_386576 - BLOCK
    )
    :vars
    (
      ?auto_386577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386576 ?auto_386577 ) ( ON-TABLE ?auto_386562 ) ( not ( = ?auto_386562 ?auto_386563 ) ) ( not ( = ?auto_386562 ?auto_386564 ) ) ( not ( = ?auto_386562 ?auto_386565 ) ) ( not ( = ?auto_386562 ?auto_386566 ) ) ( not ( = ?auto_386562 ?auto_386567 ) ) ( not ( = ?auto_386562 ?auto_386568 ) ) ( not ( = ?auto_386562 ?auto_386569 ) ) ( not ( = ?auto_386562 ?auto_386570 ) ) ( not ( = ?auto_386562 ?auto_386571 ) ) ( not ( = ?auto_386562 ?auto_386572 ) ) ( not ( = ?auto_386562 ?auto_386573 ) ) ( not ( = ?auto_386562 ?auto_386574 ) ) ( not ( = ?auto_386562 ?auto_386575 ) ) ( not ( = ?auto_386562 ?auto_386576 ) ) ( not ( = ?auto_386562 ?auto_386577 ) ) ( not ( = ?auto_386563 ?auto_386564 ) ) ( not ( = ?auto_386563 ?auto_386565 ) ) ( not ( = ?auto_386563 ?auto_386566 ) ) ( not ( = ?auto_386563 ?auto_386567 ) ) ( not ( = ?auto_386563 ?auto_386568 ) ) ( not ( = ?auto_386563 ?auto_386569 ) ) ( not ( = ?auto_386563 ?auto_386570 ) ) ( not ( = ?auto_386563 ?auto_386571 ) ) ( not ( = ?auto_386563 ?auto_386572 ) ) ( not ( = ?auto_386563 ?auto_386573 ) ) ( not ( = ?auto_386563 ?auto_386574 ) ) ( not ( = ?auto_386563 ?auto_386575 ) ) ( not ( = ?auto_386563 ?auto_386576 ) ) ( not ( = ?auto_386563 ?auto_386577 ) ) ( not ( = ?auto_386564 ?auto_386565 ) ) ( not ( = ?auto_386564 ?auto_386566 ) ) ( not ( = ?auto_386564 ?auto_386567 ) ) ( not ( = ?auto_386564 ?auto_386568 ) ) ( not ( = ?auto_386564 ?auto_386569 ) ) ( not ( = ?auto_386564 ?auto_386570 ) ) ( not ( = ?auto_386564 ?auto_386571 ) ) ( not ( = ?auto_386564 ?auto_386572 ) ) ( not ( = ?auto_386564 ?auto_386573 ) ) ( not ( = ?auto_386564 ?auto_386574 ) ) ( not ( = ?auto_386564 ?auto_386575 ) ) ( not ( = ?auto_386564 ?auto_386576 ) ) ( not ( = ?auto_386564 ?auto_386577 ) ) ( not ( = ?auto_386565 ?auto_386566 ) ) ( not ( = ?auto_386565 ?auto_386567 ) ) ( not ( = ?auto_386565 ?auto_386568 ) ) ( not ( = ?auto_386565 ?auto_386569 ) ) ( not ( = ?auto_386565 ?auto_386570 ) ) ( not ( = ?auto_386565 ?auto_386571 ) ) ( not ( = ?auto_386565 ?auto_386572 ) ) ( not ( = ?auto_386565 ?auto_386573 ) ) ( not ( = ?auto_386565 ?auto_386574 ) ) ( not ( = ?auto_386565 ?auto_386575 ) ) ( not ( = ?auto_386565 ?auto_386576 ) ) ( not ( = ?auto_386565 ?auto_386577 ) ) ( not ( = ?auto_386566 ?auto_386567 ) ) ( not ( = ?auto_386566 ?auto_386568 ) ) ( not ( = ?auto_386566 ?auto_386569 ) ) ( not ( = ?auto_386566 ?auto_386570 ) ) ( not ( = ?auto_386566 ?auto_386571 ) ) ( not ( = ?auto_386566 ?auto_386572 ) ) ( not ( = ?auto_386566 ?auto_386573 ) ) ( not ( = ?auto_386566 ?auto_386574 ) ) ( not ( = ?auto_386566 ?auto_386575 ) ) ( not ( = ?auto_386566 ?auto_386576 ) ) ( not ( = ?auto_386566 ?auto_386577 ) ) ( not ( = ?auto_386567 ?auto_386568 ) ) ( not ( = ?auto_386567 ?auto_386569 ) ) ( not ( = ?auto_386567 ?auto_386570 ) ) ( not ( = ?auto_386567 ?auto_386571 ) ) ( not ( = ?auto_386567 ?auto_386572 ) ) ( not ( = ?auto_386567 ?auto_386573 ) ) ( not ( = ?auto_386567 ?auto_386574 ) ) ( not ( = ?auto_386567 ?auto_386575 ) ) ( not ( = ?auto_386567 ?auto_386576 ) ) ( not ( = ?auto_386567 ?auto_386577 ) ) ( not ( = ?auto_386568 ?auto_386569 ) ) ( not ( = ?auto_386568 ?auto_386570 ) ) ( not ( = ?auto_386568 ?auto_386571 ) ) ( not ( = ?auto_386568 ?auto_386572 ) ) ( not ( = ?auto_386568 ?auto_386573 ) ) ( not ( = ?auto_386568 ?auto_386574 ) ) ( not ( = ?auto_386568 ?auto_386575 ) ) ( not ( = ?auto_386568 ?auto_386576 ) ) ( not ( = ?auto_386568 ?auto_386577 ) ) ( not ( = ?auto_386569 ?auto_386570 ) ) ( not ( = ?auto_386569 ?auto_386571 ) ) ( not ( = ?auto_386569 ?auto_386572 ) ) ( not ( = ?auto_386569 ?auto_386573 ) ) ( not ( = ?auto_386569 ?auto_386574 ) ) ( not ( = ?auto_386569 ?auto_386575 ) ) ( not ( = ?auto_386569 ?auto_386576 ) ) ( not ( = ?auto_386569 ?auto_386577 ) ) ( not ( = ?auto_386570 ?auto_386571 ) ) ( not ( = ?auto_386570 ?auto_386572 ) ) ( not ( = ?auto_386570 ?auto_386573 ) ) ( not ( = ?auto_386570 ?auto_386574 ) ) ( not ( = ?auto_386570 ?auto_386575 ) ) ( not ( = ?auto_386570 ?auto_386576 ) ) ( not ( = ?auto_386570 ?auto_386577 ) ) ( not ( = ?auto_386571 ?auto_386572 ) ) ( not ( = ?auto_386571 ?auto_386573 ) ) ( not ( = ?auto_386571 ?auto_386574 ) ) ( not ( = ?auto_386571 ?auto_386575 ) ) ( not ( = ?auto_386571 ?auto_386576 ) ) ( not ( = ?auto_386571 ?auto_386577 ) ) ( not ( = ?auto_386572 ?auto_386573 ) ) ( not ( = ?auto_386572 ?auto_386574 ) ) ( not ( = ?auto_386572 ?auto_386575 ) ) ( not ( = ?auto_386572 ?auto_386576 ) ) ( not ( = ?auto_386572 ?auto_386577 ) ) ( not ( = ?auto_386573 ?auto_386574 ) ) ( not ( = ?auto_386573 ?auto_386575 ) ) ( not ( = ?auto_386573 ?auto_386576 ) ) ( not ( = ?auto_386573 ?auto_386577 ) ) ( not ( = ?auto_386574 ?auto_386575 ) ) ( not ( = ?auto_386574 ?auto_386576 ) ) ( not ( = ?auto_386574 ?auto_386577 ) ) ( not ( = ?auto_386575 ?auto_386576 ) ) ( not ( = ?auto_386575 ?auto_386577 ) ) ( not ( = ?auto_386576 ?auto_386577 ) ) ( ON ?auto_386575 ?auto_386576 ) ( ON ?auto_386574 ?auto_386575 ) ( ON ?auto_386573 ?auto_386574 ) ( ON ?auto_386572 ?auto_386573 ) ( ON ?auto_386571 ?auto_386572 ) ( ON ?auto_386570 ?auto_386571 ) ( ON ?auto_386569 ?auto_386570 ) ( ON ?auto_386568 ?auto_386569 ) ( ON ?auto_386567 ?auto_386568 ) ( ON ?auto_386566 ?auto_386567 ) ( ON ?auto_386565 ?auto_386566 ) ( ON ?auto_386564 ?auto_386565 ) ( CLEAR ?auto_386562 ) ( ON ?auto_386563 ?auto_386564 ) ( CLEAR ?auto_386563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386562 ?auto_386563 )
      ( MAKE-15PILE ?auto_386562 ?auto_386563 ?auto_386564 ?auto_386565 ?auto_386566 ?auto_386567 ?auto_386568 ?auto_386569 ?auto_386570 ?auto_386571 ?auto_386572 ?auto_386573 ?auto_386574 ?auto_386575 ?auto_386576 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386593 - BLOCK
      ?auto_386594 - BLOCK
      ?auto_386595 - BLOCK
      ?auto_386596 - BLOCK
      ?auto_386597 - BLOCK
      ?auto_386598 - BLOCK
      ?auto_386599 - BLOCK
      ?auto_386600 - BLOCK
      ?auto_386601 - BLOCK
      ?auto_386602 - BLOCK
      ?auto_386603 - BLOCK
      ?auto_386604 - BLOCK
      ?auto_386605 - BLOCK
      ?auto_386606 - BLOCK
      ?auto_386607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386607 ) ( ON-TABLE ?auto_386593 ) ( not ( = ?auto_386593 ?auto_386594 ) ) ( not ( = ?auto_386593 ?auto_386595 ) ) ( not ( = ?auto_386593 ?auto_386596 ) ) ( not ( = ?auto_386593 ?auto_386597 ) ) ( not ( = ?auto_386593 ?auto_386598 ) ) ( not ( = ?auto_386593 ?auto_386599 ) ) ( not ( = ?auto_386593 ?auto_386600 ) ) ( not ( = ?auto_386593 ?auto_386601 ) ) ( not ( = ?auto_386593 ?auto_386602 ) ) ( not ( = ?auto_386593 ?auto_386603 ) ) ( not ( = ?auto_386593 ?auto_386604 ) ) ( not ( = ?auto_386593 ?auto_386605 ) ) ( not ( = ?auto_386593 ?auto_386606 ) ) ( not ( = ?auto_386593 ?auto_386607 ) ) ( not ( = ?auto_386594 ?auto_386595 ) ) ( not ( = ?auto_386594 ?auto_386596 ) ) ( not ( = ?auto_386594 ?auto_386597 ) ) ( not ( = ?auto_386594 ?auto_386598 ) ) ( not ( = ?auto_386594 ?auto_386599 ) ) ( not ( = ?auto_386594 ?auto_386600 ) ) ( not ( = ?auto_386594 ?auto_386601 ) ) ( not ( = ?auto_386594 ?auto_386602 ) ) ( not ( = ?auto_386594 ?auto_386603 ) ) ( not ( = ?auto_386594 ?auto_386604 ) ) ( not ( = ?auto_386594 ?auto_386605 ) ) ( not ( = ?auto_386594 ?auto_386606 ) ) ( not ( = ?auto_386594 ?auto_386607 ) ) ( not ( = ?auto_386595 ?auto_386596 ) ) ( not ( = ?auto_386595 ?auto_386597 ) ) ( not ( = ?auto_386595 ?auto_386598 ) ) ( not ( = ?auto_386595 ?auto_386599 ) ) ( not ( = ?auto_386595 ?auto_386600 ) ) ( not ( = ?auto_386595 ?auto_386601 ) ) ( not ( = ?auto_386595 ?auto_386602 ) ) ( not ( = ?auto_386595 ?auto_386603 ) ) ( not ( = ?auto_386595 ?auto_386604 ) ) ( not ( = ?auto_386595 ?auto_386605 ) ) ( not ( = ?auto_386595 ?auto_386606 ) ) ( not ( = ?auto_386595 ?auto_386607 ) ) ( not ( = ?auto_386596 ?auto_386597 ) ) ( not ( = ?auto_386596 ?auto_386598 ) ) ( not ( = ?auto_386596 ?auto_386599 ) ) ( not ( = ?auto_386596 ?auto_386600 ) ) ( not ( = ?auto_386596 ?auto_386601 ) ) ( not ( = ?auto_386596 ?auto_386602 ) ) ( not ( = ?auto_386596 ?auto_386603 ) ) ( not ( = ?auto_386596 ?auto_386604 ) ) ( not ( = ?auto_386596 ?auto_386605 ) ) ( not ( = ?auto_386596 ?auto_386606 ) ) ( not ( = ?auto_386596 ?auto_386607 ) ) ( not ( = ?auto_386597 ?auto_386598 ) ) ( not ( = ?auto_386597 ?auto_386599 ) ) ( not ( = ?auto_386597 ?auto_386600 ) ) ( not ( = ?auto_386597 ?auto_386601 ) ) ( not ( = ?auto_386597 ?auto_386602 ) ) ( not ( = ?auto_386597 ?auto_386603 ) ) ( not ( = ?auto_386597 ?auto_386604 ) ) ( not ( = ?auto_386597 ?auto_386605 ) ) ( not ( = ?auto_386597 ?auto_386606 ) ) ( not ( = ?auto_386597 ?auto_386607 ) ) ( not ( = ?auto_386598 ?auto_386599 ) ) ( not ( = ?auto_386598 ?auto_386600 ) ) ( not ( = ?auto_386598 ?auto_386601 ) ) ( not ( = ?auto_386598 ?auto_386602 ) ) ( not ( = ?auto_386598 ?auto_386603 ) ) ( not ( = ?auto_386598 ?auto_386604 ) ) ( not ( = ?auto_386598 ?auto_386605 ) ) ( not ( = ?auto_386598 ?auto_386606 ) ) ( not ( = ?auto_386598 ?auto_386607 ) ) ( not ( = ?auto_386599 ?auto_386600 ) ) ( not ( = ?auto_386599 ?auto_386601 ) ) ( not ( = ?auto_386599 ?auto_386602 ) ) ( not ( = ?auto_386599 ?auto_386603 ) ) ( not ( = ?auto_386599 ?auto_386604 ) ) ( not ( = ?auto_386599 ?auto_386605 ) ) ( not ( = ?auto_386599 ?auto_386606 ) ) ( not ( = ?auto_386599 ?auto_386607 ) ) ( not ( = ?auto_386600 ?auto_386601 ) ) ( not ( = ?auto_386600 ?auto_386602 ) ) ( not ( = ?auto_386600 ?auto_386603 ) ) ( not ( = ?auto_386600 ?auto_386604 ) ) ( not ( = ?auto_386600 ?auto_386605 ) ) ( not ( = ?auto_386600 ?auto_386606 ) ) ( not ( = ?auto_386600 ?auto_386607 ) ) ( not ( = ?auto_386601 ?auto_386602 ) ) ( not ( = ?auto_386601 ?auto_386603 ) ) ( not ( = ?auto_386601 ?auto_386604 ) ) ( not ( = ?auto_386601 ?auto_386605 ) ) ( not ( = ?auto_386601 ?auto_386606 ) ) ( not ( = ?auto_386601 ?auto_386607 ) ) ( not ( = ?auto_386602 ?auto_386603 ) ) ( not ( = ?auto_386602 ?auto_386604 ) ) ( not ( = ?auto_386602 ?auto_386605 ) ) ( not ( = ?auto_386602 ?auto_386606 ) ) ( not ( = ?auto_386602 ?auto_386607 ) ) ( not ( = ?auto_386603 ?auto_386604 ) ) ( not ( = ?auto_386603 ?auto_386605 ) ) ( not ( = ?auto_386603 ?auto_386606 ) ) ( not ( = ?auto_386603 ?auto_386607 ) ) ( not ( = ?auto_386604 ?auto_386605 ) ) ( not ( = ?auto_386604 ?auto_386606 ) ) ( not ( = ?auto_386604 ?auto_386607 ) ) ( not ( = ?auto_386605 ?auto_386606 ) ) ( not ( = ?auto_386605 ?auto_386607 ) ) ( not ( = ?auto_386606 ?auto_386607 ) ) ( ON ?auto_386606 ?auto_386607 ) ( ON ?auto_386605 ?auto_386606 ) ( ON ?auto_386604 ?auto_386605 ) ( ON ?auto_386603 ?auto_386604 ) ( ON ?auto_386602 ?auto_386603 ) ( ON ?auto_386601 ?auto_386602 ) ( ON ?auto_386600 ?auto_386601 ) ( ON ?auto_386599 ?auto_386600 ) ( ON ?auto_386598 ?auto_386599 ) ( ON ?auto_386597 ?auto_386598 ) ( ON ?auto_386596 ?auto_386597 ) ( ON ?auto_386595 ?auto_386596 ) ( CLEAR ?auto_386593 ) ( ON ?auto_386594 ?auto_386595 ) ( CLEAR ?auto_386594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386593 ?auto_386594 )
      ( MAKE-15PILE ?auto_386593 ?auto_386594 ?auto_386595 ?auto_386596 ?auto_386597 ?auto_386598 ?auto_386599 ?auto_386600 ?auto_386601 ?auto_386602 ?auto_386603 ?auto_386604 ?auto_386605 ?auto_386606 ?auto_386607 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386623 - BLOCK
      ?auto_386624 - BLOCK
      ?auto_386625 - BLOCK
      ?auto_386626 - BLOCK
      ?auto_386627 - BLOCK
      ?auto_386628 - BLOCK
      ?auto_386629 - BLOCK
      ?auto_386630 - BLOCK
      ?auto_386631 - BLOCK
      ?auto_386632 - BLOCK
      ?auto_386633 - BLOCK
      ?auto_386634 - BLOCK
      ?auto_386635 - BLOCK
      ?auto_386636 - BLOCK
      ?auto_386637 - BLOCK
    )
    :vars
    (
      ?auto_386638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386637 ?auto_386638 ) ( not ( = ?auto_386623 ?auto_386624 ) ) ( not ( = ?auto_386623 ?auto_386625 ) ) ( not ( = ?auto_386623 ?auto_386626 ) ) ( not ( = ?auto_386623 ?auto_386627 ) ) ( not ( = ?auto_386623 ?auto_386628 ) ) ( not ( = ?auto_386623 ?auto_386629 ) ) ( not ( = ?auto_386623 ?auto_386630 ) ) ( not ( = ?auto_386623 ?auto_386631 ) ) ( not ( = ?auto_386623 ?auto_386632 ) ) ( not ( = ?auto_386623 ?auto_386633 ) ) ( not ( = ?auto_386623 ?auto_386634 ) ) ( not ( = ?auto_386623 ?auto_386635 ) ) ( not ( = ?auto_386623 ?auto_386636 ) ) ( not ( = ?auto_386623 ?auto_386637 ) ) ( not ( = ?auto_386623 ?auto_386638 ) ) ( not ( = ?auto_386624 ?auto_386625 ) ) ( not ( = ?auto_386624 ?auto_386626 ) ) ( not ( = ?auto_386624 ?auto_386627 ) ) ( not ( = ?auto_386624 ?auto_386628 ) ) ( not ( = ?auto_386624 ?auto_386629 ) ) ( not ( = ?auto_386624 ?auto_386630 ) ) ( not ( = ?auto_386624 ?auto_386631 ) ) ( not ( = ?auto_386624 ?auto_386632 ) ) ( not ( = ?auto_386624 ?auto_386633 ) ) ( not ( = ?auto_386624 ?auto_386634 ) ) ( not ( = ?auto_386624 ?auto_386635 ) ) ( not ( = ?auto_386624 ?auto_386636 ) ) ( not ( = ?auto_386624 ?auto_386637 ) ) ( not ( = ?auto_386624 ?auto_386638 ) ) ( not ( = ?auto_386625 ?auto_386626 ) ) ( not ( = ?auto_386625 ?auto_386627 ) ) ( not ( = ?auto_386625 ?auto_386628 ) ) ( not ( = ?auto_386625 ?auto_386629 ) ) ( not ( = ?auto_386625 ?auto_386630 ) ) ( not ( = ?auto_386625 ?auto_386631 ) ) ( not ( = ?auto_386625 ?auto_386632 ) ) ( not ( = ?auto_386625 ?auto_386633 ) ) ( not ( = ?auto_386625 ?auto_386634 ) ) ( not ( = ?auto_386625 ?auto_386635 ) ) ( not ( = ?auto_386625 ?auto_386636 ) ) ( not ( = ?auto_386625 ?auto_386637 ) ) ( not ( = ?auto_386625 ?auto_386638 ) ) ( not ( = ?auto_386626 ?auto_386627 ) ) ( not ( = ?auto_386626 ?auto_386628 ) ) ( not ( = ?auto_386626 ?auto_386629 ) ) ( not ( = ?auto_386626 ?auto_386630 ) ) ( not ( = ?auto_386626 ?auto_386631 ) ) ( not ( = ?auto_386626 ?auto_386632 ) ) ( not ( = ?auto_386626 ?auto_386633 ) ) ( not ( = ?auto_386626 ?auto_386634 ) ) ( not ( = ?auto_386626 ?auto_386635 ) ) ( not ( = ?auto_386626 ?auto_386636 ) ) ( not ( = ?auto_386626 ?auto_386637 ) ) ( not ( = ?auto_386626 ?auto_386638 ) ) ( not ( = ?auto_386627 ?auto_386628 ) ) ( not ( = ?auto_386627 ?auto_386629 ) ) ( not ( = ?auto_386627 ?auto_386630 ) ) ( not ( = ?auto_386627 ?auto_386631 ) ) ( not ( = ?auto_386627 ?auto_386632 ) ) ( not ( = ?auto_386627 ?auto_386633 ) ) ( not ( = ?auto_386627 ?auto_386634 ) ) ( not ( = ?auto_386627 ?auto_386635 ) ) ( not ( = ?auto_386627 ?auto_386636 ) ) ( not ( = ?auto_386627 ?auto_386637 ) ) ( not ( = ?auto_386627 ?auto_386638 ) ) ( not ( = ?auto_386628 ?auto_386629 ) ) ( not ( = ?auto_386628 ?auto_386630 ) ) ( not ( = ?auto_386628 ?auto_386631 ) ) ( not ( = ?auto_386628 ?auto_386632 ) ) ( not ( = ?auto_386628 ?auto_386633 ) ) ( not ( = ?auto_386628 ?auto_386634 ) ) ( not ( = ?auto_386628 ?auto_386635 ) ) ( not ( = ?auto_386628 ?auto_386636 ) ) ( not ( = ?auto_386628 ?auto_386637 ) ) ( not ( = ?auto_386628 ?auto_386638 ) ) ( not ( = ?auto_386629 ?auto_386630 ) ) ( not ( = ?auto_386629 ?auto_386631 ) ) ( not ( = ?auto_386629 ?auto_386632 ) ) ( not ( = ?auto_386629 ?auto_386633 ) ) ( not ( = ?auto_386629 ?auto_386634 ) ) ( not ( = ?auto_386629 ?auto_386635 ) ) ( not ( = ?auto_386629 ?auto_386636 ) ) ( not ( = ?auto_386629 ?auto_386637 ) ) ( not ( = ?auto_386629 ?auto_386638 ) ) ( not ( = ?auto_386630 ?auto_386631 ) ) ( not ( = ?auto_386630 ?auto_386632 ) ) ( not ( = ?auto_386630 ?auto_386633 ) ) ( not ( = ?auto_386630 ?auto_386634 ) ) ( not ( = ?auto_386630 ?auto_386635 ) ) ( not ( = ?auto_386630 ?auto_386636 ) ) ( not ( = ?auto_386630 ?auto_386637 ) ) ( not ( = ?auto_386630 ?auto_386638 ) ) ( not ( = ?auto_386631 ?auto_386632 ) ) ( not ( = ?auto_386631 ?auto_386633 ) ) ( not ( = ?auto_386631 ?auto_386634 ) ) ( not ( = ?auto_386631 ?auto_386635 ) ) ( not ( = ?auto_386631 ?auto_386636 ) ) ( not ( = ?auto_386631 ?auto_386637 ) ) ( not ( = ?auto_386631 ?auto_386638 ) ) ( not ( = ?auto_386632 ?auto_386633 ) ) ( not ( = ?auto_386632 ?auto_386634 ) ) ( not ( = ?auto_386632 ?auto_386635 ) ) ( not ( = ?auto_386632 ?auto_386636 ) ) ( not ( = ?auto_386632 ?auto_386637 ) ) ( not ( = ?auto_386632 ?auto_386638 ) ) ( not ( = ?auto_386633 ?auto_386634 ) ) ( not ( = ?auto_386633 ?auto_386635 ) ) ( not ( = ?auto_386633 ?auto_386636 ) ) ( not ( = ?auto_386633 ?auto_386637 ) ) ( not ( = ?auto_386633 ?auto_386638 ) ) ( not ( = ?auto_386634 ?auto_386635 ) ) ( not ( = ?auto_386634 ?auto_386636 ) ) ( not ( = ?auto_386634 ?auto_386637 ) ) ( not ( = ?auto_386634 ?auto_386638 ) ) ( not ( = ?auto_386635 ?auto_386636 ) ) ( not ( = ?auto_386635 ?auto_386637 ) ) ( not ( = ?auto_386635 ?auto_386638 ) ) ( not ( = ?auto_386636 ?auto_386637 ) ) ( not ( = ?auto_386636 ?auto_386638 ) ) ( not ( = ?auto_386637 ?auto_386638 ) ) ( ON ?auto_386636 ?auto_386637 ) ( ON ?auto_386635 ?auto_386636 ) ( ON ?auto_386634 ?auto_386635 ) ( ON ?auto_386633 ?auto_386634 ) ( ON ?auto_386632 ?auto_386633 ) ( ON ?auto_386631 ?auto_386632 ) ( ON ?auto_386630 ?auto_386631 ) ( ON ?auto_386629 ?auto_386630 ) ( ON ?auto_386628 ?auto_386629 ) ( ON ?auto_386627 ?auto_386628 ) ( ON ?auto_386626 ?auto_386627 ) ( ON ?auto_386625 ?auto_386626 ) ( ON ?auto_386624 ?auto_386625 ) ( ON ?auto_386623 ?auto_386624 ) ( CLEAR ?auto_386623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386623 )
      ( MAKE-15PILE ?auto_386623 ?auto_386624 ?auto_386625 ?auto_386626 ?auto_386627 ?auto_386628 ?auto_386629 ?auto_386630 ?auto_386631 ?auto_386632 ?auto_386633 ?auto_386634 ?auto_386635 ?auto_386636 ?auto_386637 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386654 - BLOCK
      ?auto_386655 - BLOCK
      ?auto_386656 - BLOCK
      ?auto_386657 - BLOCK
      ?auto_386658 - BLOCK
      ?auto_386659 - BLOCK
      ?auto_386660 - BLOCK
      ?auto_386661 - BLOCK
      ?auto_386662 - BLOCK
      ?auto_386663 - BLOCK
      ?auto_386664 - BLOCK
      ?auto_386665 - BLOCK
      ?auto_386666 - BLOCK
      ?auto_386667 - BLOCK
      ?auto_386668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_386668 ) ( not ( = ?auto_386654 ?auto_386655 ) ) ( not ( = ?auto_386654 ?auto_386656 ) ) ( not ( = ?auto_386654 ?auto_386657 ) ) ( not ( = ?auto_386654 ?auto_386658 ) ) ( not ( = ?auto_386654 ?auto_386659 ) ) ( not ( = ?auto_386654 ?auto_386660 ) ) ( not ( = ?auto_386654 ?auto_386661 ) ) ( not ( = ?auto_386654 ?auto_386662 ) ) ( not ( = ?auto_386654 ?auto_386663 ) ) ( not ( = ?auto_386654 ?auto_386664 ) ) ( not ( = ?auto_386654 ?auto_386665 ) ) ( not ( = ?auto_386654 ?auto_386666 ) ) ( not ( = ?auto_386654 ?auto_386667 ) ) ( not ( = ?auto_386654 ?auto_386668 ) ) ( not ( = ?auto_386655 ?auto_386656 ) ) ( not ( = ?auto_386655 ?auto_386657 ) ) ( not ( = ?auto_386655 ?auto_386658 ) ) ( not ( = ?auto_386655 ?auto_386659 ) ) ( not ( = ?auto_386655 ?auto_386660 ) ) ( not ( = ?auto_386655 ?auto_386661 ) ) ( not ( = ?auto_386655 ?auto_386662 ) ) ( not ( = ?auto_386655 ?auto_386663 ) ) ( not ( = ?auto_386655 ?auto_386664 ) ) ( not ( = ?auto_386655 ?auto_386665 ) ) ( not ( = ?auto_386655 ?auto_386666 ) ) ( not ( = ?auto_386655 ?auto_386667 ) ) ( not ( = ?auto_386655 ?auto_386668 ) ) ( not ( = ?auto_386656 ?auto_386657 ) ) ( not ( = ?auto_386656 ?auto_386658 ) ) ( not ( = ?auto_386656 ?auto_386659 ) ) ( not ( = ?auto_386656 ?auto_386660 ) ) ( not ( = ?auto_386656 ?auto_386661 ) ) ( not ( = ?auto_386656 ?auto_386662 ) ) ( not ( = ?auto_386656 ?auto_386663 ) ) ( not ( = ?auto_386656 ?auto_386664 ) ) ( not ( = ?auto_386656 ?auto_386665 ) ) ( not ( = ?auto_386656 ?auto_386666 ) ) ( not ( = ?auto_386656 ?auto_386667 ) ) ( not ( = ?auto_386656 ?auto_386668 ) ) ( not ( = ?auto_386657 ?auto_386658 ) ) ( not ( = ?auto_386657 ?auto_386659 ) ) ( not ( = ?auto_386657 ?auto_386660 ) ) ( not ( = ?auto_386657 ?auto_386661 ) ) ( not ( = ?auto_386657 ?auto_386662 ) ) ( not ( = ?auto_386657 ?auto_386663 ) ) ( not ( = ?auto_386657 ?auto_386664 ) ) ( not ( = ?auto_386657 ?auto_386665 ) ) ( not ( = ?auto_386657 ?auto_386666 ) ) ( not ( = ?auto_386657 ?auto_386667 ) ) ( not ( = ?auto_386657 ?auto_386668 ) ) ( not ( = ?auto_386658 ?auto_386659 ) ) ( not ( = ?auto_386658 ?auto_386660 ) ) ( not ( = ?auto_386658 ?auto_386661 ) ) ( not ( = ?auto_386658 ?auto_386662 ) ) ( not ( = ?auto_386658 ?auto_386663 ) ) ( not ( = ?auto_386658 ?auto_386664 ) ) ( not ( = ?auto_386658 ?auto_386665 ) ) ( not ( = ?auto_386658 ?auto_386666 ) ) ( not ( = ?auto_386658 ?auto_386667 ) ) ( not ( = ?auto_386658 ?auto_386668 ) ) ( not ( = ?auto_386659 ?auto_386660 ) ) ( not ( = ?auto_386659 ?auto_386661 ) ) ( not ( = ?auto_386659 ?auto_386662 ) ) ( not ( = ?auto_386659 ?auto_386663 ) ) ( not ( = ?auto_386659 ?auto_386664 ) ) ( not ( = ?auto_386659 ?auto_386665 ) ) ( not ( = ?auto_386659 ?auto_386666 ) ) ( not ( = ?auto_386659 ?auto_386667 ) ) ( not ( = ?auto_386659 ?auto_386668 ) ) ( not ( = ?auto_386660 ?auto_386661 ) ) ( not ( = ?auto_386660 ?auto_386662 ) ) ( not ( = ?auto_386660 ?auto_386663 ) ) ( not ( = ?auto_386660 ?auto_386664 ) ) ( not ( = ?auto_386660 ?auto_386665 ) ) ( not ( = ?auto_386660 ?auto_386666 ) ) ( not ( = ?auto_386660 ?auto_386667 ) ) ( not ( = ?auto_386660 ?auto_386668 ) ) ( not ( = ?auto_386661 ?auto_386662 ) ) ( not ( = ?auto_386661 ?auto_386663 ) ) ( not ( = ?auto_386661 ?auto_386664 ) ) ( not ( = ?auto_386661 ?auto_386665 ) ) ( not ( = ?auto_386661 ?auto_386666 ) ) ( not ( = ?auto_386661 ?auto_386667 ) ) ( not ( = ?auto_386661 ?auto_386668 ) ) ( not ( = ?auto_386662 ?auto_386663 ) ) ( not ( = ?auto_386662 ?auto_386664 ) ) ( not ( = ?auto_386662 ?auto_386665 ) ) ( not ( = ?auto_386662 ?auto_386666 ) ) ( not ( = ?auto_386662 ?auto_386667 ) ) ( not ( = ?auto_386662 ?auto_386668 ) ) ( not ( = ?auto_386663 ?auto_386664 ) ) ( not ( = ?auto_386663 ?auto_386665 ) ) ( not ( = ?auto_386663 ?auto_386666 ) ) ( not ( = ?auto_386663 ?auto_386667 ) ) ( not ( = ?auto_386663 ?auto_386668 ) ) ( not ( = ?auto_386664 ?auto_386665 ) ) ( not ( = ?auto_386664 ?auto_386666 ) ) ( not ( = ?auto_386664 ?auto_386667 ) ) ( not ( = ?auto_386664 ?auto_386668 ) ) ( not ( = ?auto_386665 ?auto_386666 ) ) ( not ( = ?auto_386665 ?auto_386667 ) ) ( not ( = ?auto_386665 ?auto_386668 ) ) ( not ( = ?auto_386666 ?auto_386667 ) ) ( not ( = ?auto_386666 ?auto_386668 ) ) ( not ( = ?auto_386667 ?auto_386668 ) ) ( ON ?auto_386667 ?auto_386668 ) ( ON ?auto_386666 ?auto_386667 ) ( ON ?auto_386665 ?auto_386666 ) ( ON ?auto_386664 ?auto_386665 ) ( ON ?auto_386663 ?auto_386664 ) ( ON ?auto_386662 ?auto_386663 ) ( ON ?auto_386661 ?auto_386662 ) ( ON ?auto_386660 ?auto_386661 ) ( ON ?auto_386659 ?auto_386660 ) ( ON ?auto_386658 ?auto_386659 ) ( ON ?auto_386657 ?auto_386658 ) ( ON ?auto_386656 ?auto_386657 ) ( ON ?auto_386655 ?auto_386656 ) ( ON ?auto_386654 ?auto_386655 ) ( CLEAR ?auto_386654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386654 )
      ( MAKE-15PILE ?auto_386654 ?auto_386655 ?auto_386656 ?auto_386657 ?auto_386658 ?auto_386659 ?auto_386660 ?auto_386661 ?auto_386662 ?auto_386663 ?auto_386664 ?auto_386665 ?auto_386666 ?auto_386667 ?auto_386668 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_386684 - BLOCK
      ?auto_386685 - BLOCK
      ?auto_386686 - BLOCK
      ?auto_386687 - BLOCK
      ?auto_386688 - BLOCK
      ?auto_386689 - BLOCK
      ?auto_386690 - BLOCK
      ?auto_386691 - BLOCK
      ?auto_386692 - BLOCK
      ?auto_386693 - BLOCK
      ?auto_386694 - BLOCK
      ?auto_386695 - BLOCK
      ?auto_386696 - BLOCK
      ?auto_386697 - BLOCK
      ?auto_386698 - BLOCK
    )
    :vars
    (
      ?auto_386699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_386684 ?auto_386685 ) ) ( not ( = ?auto_386684 ?auto_386686 ) ) ( not ( = ?auto_386684 ?auto_386687 ) ) ( not ( = ?auto_386684 ?auto_386688 ) ) ( not ( = ?auto_386684 ?auto_386689 ) ) ( not ( = ?auto_386684 ?auto_386690 ) ) ( not ( = ?auto_386684 ?auto_386691 ) ) ( not ( = ?auto_386684 ?auto_386692 ) ) ( not ( = ?auto_386684 ?auto_386693 ) ) ( not ( = ?auto_386684 ?auto_386694 ) ) ( not ( = ?auto_386684 ?auto_386695 ) ) ( not ( = ?auto_386684 ?auto_386696 ) ) ( not ( = ?auto_386684 ?auto_386697 ) ) ( not ( = ?auto_386684 ?auto_386698 ) ) ( not ( = ?auto_386685 ?auto_386686 ) ) ( not ( = ?auto_386685 ?auto_386687 ) ) ( not ( = ?auto_386685 ?auto_386688 ) ) ( not ( = ?auto_386685 ?auto_386689 ) ) ( not ( = ?auto_386685 ?auto_386690 ) ) ( not ( = ?auto_386685 ?auto_386691 ) ) ( not ( = ?auto_386685 ?auto_386692 ) ) ( not ( = ?auto_386685 ?auto_386693 ) ) ( not ( = ?auto_386685 ?auto_386694 ) ) ( not ( = ?auto_386685 ?auto_386695 ) ) ( not ( = ?auto_386685 ?auto_386696 ) ) ( not ( = ?auto_386685 ?auto_386697 ) ) ( not ( = ?auto_386685 ?auto_386698 ) ) ( not ( = ?auto_386686 ?auto_386687 ) ) ( not ( = ?auto_386686 ?auto_386688 ) ) ( not ( = ?auto_386686 ?auto_386689 ) ) ( not ( = ?auto_386686 ?auto_386690 ) ) ( not ( = ?auto_386686 ?auto_386691 ) ) ( not ( = ?auto_386686 ?auto_386692 ) ) ( not ( = ?auto_386686 ?auto_386693 ) ) ( not ( = ?auto_386686 ?auto_386694 ) ) ( not ( = ?auto_386686 ?auto_386695 ) ) ( not ( = ?auto_386686 ?auto_386696 ) ) ( not ( = ?auto_386686 ?auto_386697 ) ) ( not ( = ?auto_386686 ?auto_386698 ) ) ( not ( = ?auto_386687 ?auto_386688 ) ) ( not ( = ?auto_386687 ?auto_386689 ) ) ( not ( = ?auto_386687 ?auto_386690 ) ) ( not ( = ?auto_386687 ?auto_386691 ) ) ( not ( = ?auto_386687 ?auto_386692 ) ) ( not ( = ?auto_386687 ?auto_386693 ) ) ( not ( = ?auto_386687 ?auto_386694 ) ) ( not ( = ?auto_386687 ?auto_386695 ) ) ( not ( = ?auto_386687 ?auto_386696 ) ) ( not ( = ?auto_386687 ?auto_386697 ) ) ( not ( = ?auto_386687 ?auto_386698 ) ) ( not ( = ?auto_386688 ?auto_386689 ) ) ( not ( = ?auto_386688 ?auto_386690 ) ) ( not ( = ?auto_386688 ?auto_386691 ) ) ( not ( = ?auto_386688 ?auto_386692 ) ) ( not ( = ?auto_386688 ?auto_386693 ) ) ( not ( = ?auto_386688 ?auto_386694 ) ) ( not ( = ?auto_386688 ?auto_386695 ) ) ( not ( = ?auto_386688 ?auto_386696 ) ) ( not ( = ?auto_386688 ?auto_386697 ) ) ( not ( = ?auto_386688 ?auto_386698 ) ) ( not ( = ?auto_386689 ?auto_386690 ) ) ( not ( = ?auto_386689 ?auto_386691 ) ) ( not ( = ?auto_386689 ?auto_386692 ) ) ( not ( = ?auto_386689 ?auto_386693 ) ) ( not ( = ?auto_386689 ?auto_386694 ) ) ( not ( = ?auto_386689 ?auto_386695 ) ) ( not ( = ?auto_386689 ?auto_386696 ) ) ( not ( = ?auto_386689 ?auto_386697 ) ) ( not ( = ?auto_386689 ?auto_386698 ) ) ( not ( = ?auto_386690 ?auto_386691 ) ) ( not ( = ?auto_386690 ?auto_386692 ) ) ( not ( = ?auto_386690 ?auto_386693 ) ) ( not ( = ?auto_386690 ?auto_386694 ) ) ( not ( = ?auto_386690 ?auto_386695 ) ) ( not ( = ?auto_386690 ?auto_386696 ) ) ( not ( = ?auto_386690 ?auto_386697 ) ) ( not ( = ?auto_386690 ?auto_386698 ) ) ( not ( = ?auto_386691 ?auto_386692 ) ) ( not ( = ?auto_386691 ?auto_386693 ) ) ( not ( = ?auto_386691 ?auto_386694 ) ) ( not ( = ?auto_386691 ?auto_386695 ) ) ( not ( = ?auto_386691 ?auto_386696 ) ) ( not ( = ?auto_386691 ?auto_386697 ) ) ( not ( = ?auto_386691 ?auto_386698 ) ) ( not ( = ?auto_386692 ?auto_386693 ) ) ( not ( = ?auto_386692 ?auto_386694 ) ) ( not ( = ?auto_386692 ?auto_386695 ) ) ( not ( = ?auto_386692 ?auto_386696 ) ) ( not ( = ?auto_386692 ?auto_386697 ) ) ( not ( = ?auto_386692 ?auto_386698 ) ) ( not ( = ?auto_386693 ?auto_386694 ) ) ( not ( = ?auto_386693 ?auto_386695 ) ) ( not ( = ?auto_386693 ?auto_386696 ) ) ( not ( = ?auto_386693 ?auto_386697 ) ) ( not ( = ?auto_386693 ?auto_386698 ) ) ( not ( = ?auto_386694 ?auto_386695 ) ) ( not ( = ?auto_386694 ?auto_386696 ) ) ( not ( = ?auto_386694 ?auto_386697 ) ) ( not ( = ?auto_386694 ?auto_386698 ) ) ( not ( = ?auto_386695 ?auto_386696 ) ) ( not ( = ?auto_386695 ?auto_386697 ) ) ( not ( = ?auto_386695 ?auto_386698 ) ) ( not ( = ?auto_386696 ?auto_386697 ) ) ( not ( = ?auto_386696 ?auto_386698 ) ) ( not ( = ?auto_386697 ?auto_386698 ) ) ( ON ?auto_386684 ?auto_386699 ) ( not ( = ?auto_386698 ?auto_386699 ) ) ( not ( = ?auto_386697 ?auto_386699 ) ) ( not ( = ?auto_386696 ?auto_386699 ) ) ( not ( = ?auto_386695 ?auto_386699 ) ) ( not ( = ?auto_386694 ?auto_386699 ) ) ( not ( = ?auto_386693 ?auto_386699 ) ) ( not ( = ?auto_386692 ?auto_386699 ) ) ( not ( = ?auto_386691 ?auto_386699 ) ) ( not ( = ?auto_386690 ?auto_386699 ) ) ( not ( = ?auto_386689 ?auto_386699 ) ) ( not ( = ?auto_386688 ?auto_386699 ) ) ( not ( = ?auto_386687 ?auto_386699 ) ) ( not ( = ?auto_386686 ?auto_386699 ) ) ( not ( = ?auto_386685 ?auto_386699 ) ) ( not ( = ?auto_386684 ?auto_386699 ) ) ( ON ?auto_386685 ?auto_386684 ) ( ON ?auto_386686 ?auto_386685 ) ( ON ?auto_386687 ?auto_386686 ) ( ON ?auto_386688 ?auto_386687 ) ( ON ?auto_386689 ?auto_386688 ) ( ON ?auto_386690 ?auto_386689 ) ( ON ?auto_386691 ?auto_386690 ) ( ON ?auto_386692 ?auto_386691 ) ( ON ?auto_386693 ?auto_386692 ) ( ON ?auto_386694 ?auto_386693 ) ( ON ?auto_386695 ?auto_386694 ) ( ON ?auto_386696 ?auto_386695 ) ( ON ?auto_386697 ?auto_386696 ) ( ON ?auto_386698 ?auto_386697 ) ( CLEAR ?auto_386698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_386698 ?auto_386697 ?auto_386696 ?auto_386695 ?auto_386694 ?auto_386693 ?auto_386692 ?auto_386691 ?auto_386690 ?auto_386689 ?auto_386688 ?auto_386687 ?auto_386686 ?auto_386685 ?auto_386684 )
      ( MAKE-15PILE ?auto_386684 ?auto_386685 ?auto_386686 ?auto_386687 ?auto_386688 ?auto_386689 ?auto_386690 ?auto_386691 ?auto_386692 ?auto_386693 ?auto_386694 ?auto_386695 ?auto_386696 ?auto_386697 ?auto_386698 ) )
  )

)

