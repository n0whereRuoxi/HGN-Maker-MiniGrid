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
      ?auto_17475 - BLOCK
    )
    :vars
    (
      ?auto_17476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17475 ?auto_17476 ) ( CLEAR ?auto_17475 ) ( HAND-EMPTY ) ( not ( = ?auto_17475 ?auto_17476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17475 ?auto_17476 )
      ( !PUTDOWN ?auto_17475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17478 - BLOCK
    )
    :vars
    (
      ?auto_17479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17478 ?auto_17479 ) ( CLEAR ?auto_17478 ) ( HAND-EMPTY ) ( not ( = ?auto_17478 ?auto_17479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17478 ?auto_17479 )
      ( !PUTDOWN ?auto_17478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17482 - BLOCK
      ?auto_17483 - BLOCK
    )
    :vars
    (
      ?auto_17484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17482 ) ( ON ?auto_17483 ?auto_17484 ) ( CLEAR ?auto_17483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17482 ) ( not ( = ?auto_17482 ?auto_17483 ) ) ( not ( = ?auto_17482 ?auto_17484 ) ) ( not ( = ?auto_17483 ?auto_17484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17483 ?auto_17484 )
      ( !STACK ?auto_17483 ?auto_17482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17487 - BLOCK
      ?auto_17488 - BLOCK
    )
    :vars
    (
      ?auto_17489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17487 ) ( ON ?auto_17488 ?auto_17489 ) ( CLEAR ?auto_17488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17487 ) ( not ( = ?auto_17487 ?auto_17488 ) ) ( not ( = ?auto_17487 ?auto_17489 ) ) ( not ( = ?auto_17488 ?auto_17489 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17488 ?auto_17489 )
      ( !STACK ?auto_17488 ?auto_17487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17492 - BLOCK
      ?auto_17493 - BLOCK
    )
    :vars
    (
      ?auto_17494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17493 ?auto_17494 ) ( not ( = ?auto_17492 ?auto_17493 ) ) ( not ( = ?auto_17492 ?auto_17494 ) ) ( not ( = ?auto_17493 ?auto_17494 ) ) ( ON ?auto_17492 ?auto_17493 ) ( CLEAR ?auto_17492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17492 )
      ( MAKE-2PILE ?auto_17492 ?auto_17493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17497 - BLOCK
      ?auto_17498 - BLOCK
    )
    :vars
    (
      ?auto_17499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17498 ?auto_17499 ) ( not ( = ?auto_17497 ?auto_17498 ) ) ( not ( = ?auto_17497 ?auto_17499 ) ) ( not ( = ?auto_17498 ?auto_17499 ) ) ( ON ?auto_17497 ?auto_17498 ) ( CLEAR ?auto_17497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17497 )
      ( MAKE-2PILE ?auto_17497 ?auto_17498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17503 - BLOCK
      ?auto_17504 - BLOCK
      ?auto_17505 - BLOCK
    )
    :vars
    (
      ?auto_17506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17504 ) ( ON ?auto_17505 ?auto_17506 ) ( CLEAR ?auto_17505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17503 ) ( ON ?auto_17504 ?auto_17503 ) ( not ( = ?auto_17503 ?auto_17504 ) ) ( not ( = ?auto_17503 ?auto_17505 ) ) ( not ( = ?auto_17503 ?auto_17506 ) ) ( not ( = ?auto_17504 ?auto_17505 ) ) ( not ( = ?auto_17504 ?auto_17506 ) ) ( not ( = ?auto_17505 ?auto_17506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17505 ?auto_17506 )
      ( !STACK ?auto_17505 ?auto_17504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17510 - BLOCK
      ?auto_17511 - BLOCK
      ?auto_17512 - BLOCK
    )
    :vars
    (
      ?auto_17513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17511 ) ( ON ?auto_17512 ?auto_17513 ) ( CLEAR ?auto_17512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17510 ) ( ON ?auto_17511 ?auto_17510 ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17513 ) ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17513 ) ) ( not ( = ?auto_17512 ?auto_17513 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17512 ?auto_17513 )
      ( !STACK ?auto_17512 ?auto_17511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17517 - BLOCK
      ?auto_17518 - BLOCK
      ?auto_17519 - BLOCK
    )
    :vars
    (
      ?auto_17520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17519 ?auto_17520 ) ( ON-TABLE ?auto_17517 ) ( not ( = ?auto_17517 ?auto_17518 ) ) ( not ( = ?auto_17517 ?auto_17519 ) ) ( not ( = ?auto_17517 ?auto_17520 ) ) ( not ( = ?auto_17518 ?auto_17519 ) ) ( not ( = ?auto_17518 ?auto_17520 ) ) ( not ( = ?auto_17519 ?auto_17520 ) ) ( CLEAR ?auto_17517 ) ( ON ?auto_17518 ?auto_17519 ) ( CLEAR ?auto_17518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17517 ?auto_17518 )
      ( MAKE-3PILE ?auto_17517 ?auto_17518 ?auto_17519 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17524 - BLOCK
      ?auto_17525 - BLOCK
      ?auto_17526 - BLOCK
    )
    :vars
    (
      ?auto_17527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17526 ?auto_17527 ) ( ON-TABLE ?auto_17524 ) ( not ( = ?auto_17524 ?auto_17525 ) ) ( not ( = ?auto_17524 ?auto_17526 ) ) ( not ( = ?auto_17524 ?auto_17527 ) ) ( not ( = ?auto_17525 ?auto_17526 ) ) ( not ( = ?auto_17525 ?auto_17527 ) ) ( not ( = ?auto_17526 ?auto_17527 ) ) ( CLEAR ?auto_17524 ) ( ON ?auto_17525 ?auto_17526 ) ( CLEAR ?auto_17525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17524 ?auto_17525 )
      ( MAKE-3PILE ?auto_17524 ?auto_17525 ?auto_17526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17531 - BLOCK
      ?auto_17532 - BLOCK
      ?auto_17533 - BLOCK
    )
    :vars
    (
      ?auto_17534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17533 ?auto_17534 ) ( not ( = ?auto_17531 ?auto_17532 ) ) ( not ( = ?auto_17531 ?auto_17533 ) ) ( not ( = ?auto_17531 ?auto_17534 ) ) ( not ( = ?auto_17532 ?auto_17533 ) ) ( not ( = ?auto_17532 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( ON ?auto_17532 ?auto_17533 ) ( ON ?auto_17531 ?auto_17532 ) ( CLEAR ?auto_17531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17531 )
      ( MAKE-3PILE ?auto_17531 ?auto_17532 ?auto_17533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17538 - BLOCK
      ?auto_17539 - BLOCK
      ?auto_17540 - BLOCK
    )
    :vars
    (
      ?auto_17541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17540 ?auto_17541 ) ( not ( = ?auto_17538 ?auto_17539 ) ) ( not ( = ?auto_17538 ?auto_17540 ) ) ( not ( = ?auto_17538 ?auto_17541 ) ) ( not ( = ?auto_17539 ?auto_17540 ) ) ( not ( = ?auto_17539 ?auto_17541 ) ) ( not ( = ?auto_17540 ?auto_17541 ) ) ( ON ?auto_17539 ?auto_17540 ) ( ON ?auto_17538 ?auto_17539 ) ( CLEAR ?auto_17538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17538 )
      ( MAKE-3PILE ?auto_17538 ?auto_17539 ?auto_17540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17546 - BLOCK
      ?auto_17547 - BLOCK
      ?auto_17548 - BLOCK
      ?auto_17549 - BLOCK
    )
    :vars
    (
      ?auto_17550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17548 ) ( ON ?auto_17549 ?auto_17550 ) ( CLEAR ?auto_17549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17546 ) ( ON ?auto_17547 ?auto_17546 ) ( ON ?auto_17548 ?auto_17547 ) ( not ( = ?auto_17546 ?auto_17547 ) ) ( not ( = ?auto_17546 ?auto_17548 ) ) ( not ( = ?auto_17546 ?auto_17549 ) ) ( not ( = ?auto_17546 ?auto_17550 ) ) ( not ( = ?auto_17547 ?auto_17548 ) ) ( not ( = ?auto_17547 ?auto_17549 ) ) ( not ( = ?auto_17547 ?auto_17550 ) ) ( not ( = ?auto_17548 ?auto_17549 ) ) ( not ( = ?auto_17548 ?auto_17550 ) ) ( not ( = ?auto_17549 ?auto_17550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17549 ?auto_17550 )
      ( !STACK ?auto_17549 ?auto_17548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17555 - BLOCK
      ?auto_17556 - BLOCK
      ?auto_17557 - BLOCK
      ?auto_17558 - BLOCK
    )
    :vars
    (
      ?auto_17559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17557 ) ( ON ?auto_17558 ?auto_17559 ) ( CLEAR ?auto_17558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17555 ) ( ON ?auto_17556 ?auto_17555 ) ( ON ?auto_17557 ?auto_17556 ) ( not ( = ?auto_17555 ?auto_17556 ) ) ( not ( = ?auto_17555 ?auto_17557 ) ) ( not ( = ?auto_17555 ?auto_17558 ) ) ( not ( = ?auto_17555 ?auto_17559 ) ) ( not ( = ?auto_17556 ?auto_17557 ) ) ( not ( = ?auto_17556 ?auto_17558 ) ) ( not ( = ?auto_17556 ?auto_17559 ) ) ( not ( = ?auto_17557 ?auto_17558 ) ) ( not ( = ?auto_17557 ?auto_17559 ) ) ( not ( = ?auto_17558 ?auto_17559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17558 ?auto_17559 )
      ( !STACK ?auto_17558 ?auto_17557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17564 - BLOCK
      ?auto_17565 - BLOCK
      ?auto_17566 - BLOCK
      ?auto_17567 - BLOCK
    )
    :vars
    (
      ?auto_17568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17567 ?auto_17568 ) ( ON-TABLE ?auto_17564 ) ( ON ?auto_17565 ?auto_17564 ) ( not ( = ?auto_17564 ?auto_17565 ) ) ( not ( = ?auto_17564 ?auto_17566 ) ) ( not ( = ?auto_17564 ?auto_17567 ) ) ( not ( = ?auto_17564 ?auto_17568 ) ) ( not ( = ?auto_17565 ?auto_17566 ) ) ( not ( = ?auto_17565 ?auto_17567 ) ) ( not ( = ?auto_17565 ?auto_17568 ) ) ( not ( = ?auto_17566 ?auto_17567 ) ) ( not ( = ?auto_17566 ?auto_17568 ) ) ( not ( = ?auto_17567 ?auto_17568 ) ) ( CLEAR ?auto_17565 ) ( ON ?auto_17566 ?auto_17567 ) ( CLEAR ?auto_17566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17564 ?auto_17565 ?auto_17566 )
      ( MAKE-4PILE ?auto_17564 ?auto_17565 ?auto_17566 ?auto_17567 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17573 - BLOCK
      ?auto_17574 - BLOCK
      ?auto_17575 - BLOCK
      ?auto_17576 - BLOCK
    )
    :vars
    (
      ?auto_17577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17576 ?auto_17577 ) ( ON-TABLE ?auto_17573 ) ( ON ?auto_17574 ?auto_17573 ) ( not ( = ?auto_17573 ?auto_17574 ) ) ( not ( = ?auto_17573 ?auto_17575 ) ) ( not ( = ?auto_17573 ?auto_17576 ) ) ( not ( = ?auto_17573 ?auto_17577 ) ) ( not ( = ?auto_17574 ?auto_17575 ) ) ( not ( = ?auto_17574 ?auto_17576 ) ) ( not ( = ?auto_17574 ?auto_17577 ) ) ( not ( = ?auto_17575 ?auto_17576 ) ) ( not ( = ?auto_17575 ?auto_17577 ) ) ( not ( = ?auto_17576 ?auto_17577 ) ) ( CLEAR ?auto_17574 ) ( ON ?auto_17575 ?auto_17576 ) ( CLEAR ?auto_17575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17573 ?auto_17574 ?auto_17575 )
      ( MAKE-4PILE ?auto_17573 ?auto_17574 ?auto_17575 ?auto_17576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17582 - BLOCK
      ?auto_17583 - BLOCK
      ?auto_17584 - BLOCK
      ?auto_17585 - BLOCK
    )
    :vars
    (
      ?auto_17586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17585 ?auto_17586 ) ( ON-TABLE ?auto_17582 ) ( not ( = ?auto_17582 ?auto_17583 ) ) ( not ( = ?auto_17582 ?auto_17584 ) ) ( not ( = ?auto_17582 ?auto_17585 ) ) ( not ( = ?auto_17582 ?auto_17586 ) ) ( not ( = ?auto_17583 ?auto_17584 ) ) ( not ( = ?auto_17583 ?auto_17585 ) ) ( not ( = ?auto_17583 ?auto_17586 ) ) ( not ( = ?auto_17584 ?auto_17585 ) ) ( not ( = ?auto_17584 ?auto_17586 ) ) ( not ( = ?auto_17585 ?auto_17586 ) ) ( ON ?auto_17584 ?auto_17585 ) ( CLEAR ?auto_17582 ) ( ON ?auto_17583 ?auto_17584 ) ( CLEAR ?auto_17583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17582 ?auto_17583 )
      ( MAKE-4PILE ?auto_17582 ?auto_17583 ?auto_17584 ?auto_17585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17591 - BLOCK
      ?auto_17592 - BLOCK
      ?auto_17593 - BLOCK
      ?auto_17594 - BLOCK
    )
    :vars
    (
      ?auto_17595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17594 ?auto_17595 ) ( ON-TABLE ?auto_17591 ) ( not ( = ?auto_17591 ?auto_17592 ) ) ( not ( = ?auto_17591 ?auto_17593 ) ) ( not ( = ?auto_17591 ?auto_17594 ) ) ( not ( = ?auto_17591 ?auto_17595 ) ) ( not ( = ?auto_17592 ?auto_17593 ) ) ( not ( = ?auto_17592 ?auto_17594 ) ) ( not ( = ?auto_17592 ?auto_17595 ) ) ( not ( = ?auto_17593 ?auto_17594 ) ) ( not ( = ?auto_17593 ?auto_17595 ) ) ( not ( = ?auto_17594 ?auto_17595 ) ) ( ON ?auto_17593 ?auto_17594 ) ( CLEAR ?auto_17591 ) ( ON ?auto_17592 ?auto_17593 ) ( CLEAR ?auto_17592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17591 ?auto_17592 )
      ( MAKE-4PILE ?auto_17591 ?auto_17592 ?auto_17593 ?auto_17594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17600 - BLOCK
      ?auto_17601 - BLOCK
      ?auto_17602 - BLOCK
      ?auto_17603 - BLOCK
    )
    :vars
    (
      ?auto_17604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17603 ?auto_17604 ) ( not ( = ?auto_17600 ?auto_17601 ) ) ( not ( = ?auto_17600 ?auto_17602 ) ) ( not ( = ?auto_17600 ?auto_17603 ) ) ( not ( = ?auto_17600 ?auto_17604 ) ) ( not ( = ?auto_17601 ?auto_17602 ) ) ( not ( = ?auto_17601 ?auto_17603 ) ) ( not ( = ?auto_17601 ?auto_17604 ) ) ( not ( = ?auto_17602 ?auto_17603 ) ) ( not ( = ?auto_17602 ?auto_17604 ) ) ( not ( = ?auto_17603 ?auto_17604 ) ) ( ON ?auto_17602 ?auto_17603 ) ( ON ?auto_17601 ?auto_17602 ) ( ON ?auto_17600 ?auto_17601 ) ( CLEAR ?auto_17600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17600 )
      ( MAKE-4PILE ?auto_17600 ?auto_17601 ?auto_17602 ?auto_17603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17609 - BLOCK
      ?auto_17610 - BLOCK
      ?auto_17611 - BLOCK
      ?auto_17612 - BLOCK
    )
    :vars
    (
      ?auto_17613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17612 ?auto_17613 ) ( not ( = ?auto_17609 ?auto_17610 ) ) ( not ( = ?auto_17609 ?auto_17611 ) ) ( not ( = ?auto_17609 ?auto_17612 ) ) ( not ( = ?auto_17609 ?auto_17613 ) ) ( not ( = ?auto_17610 ?auto_17611 ) ) ( not ( = ?auto_17610 ?auto_17612 ) ) ( not ( = ?auto_17610 ?auto_17613 ) ) ( not ( = ?auto_17611 ?auto_17612 ) ) ( not ( = ?auto_17611 ?auto_17613 ) ) ( not ( = ?auto_17612 ?auto_17613 ) ) ( ON ?auto_17611 ?auto_17612 ) ( ON ?auto_17610 ?auto_17611 ) ( ON ?auto_17609 ?auto_17610 ) ( CLEAR ?auto_17609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17609 )
      ( MAKE-4PILE ?auto_17609 ?auto_17610 ?auto_17611 ?auto_17612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17619 - BLOCK
      ?auto_17620 - BLOCK
      ?auto_17621 - BLOCK
      ?auto_17622 - BLOCK
      ?auto_17623 - BLOCK
    )
    :vars
    (
      ?auto_17624 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17622 ) ( ON ?auto_17623 ?auto_17624 ) ( CLEAR ?auto_17623 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17619 ) ( ON ?auto_17620 ?auto_17619 ) ( ON ?auto_17621 ?auto_17620 ) ( ON ?auto_17622 ?auto_17621 ) ( not ( = ?auto_17619 ?auto_17620 ) ) ( not ( = ?auto_17619 ?auto_17621 ) ) ( not ( = ?auto_17619 ?auto_17622 ) ) ( not ( = ?auto_17619 ?auto_17623 ) ) ( not ( = ?auto_17619 ?auto_17624 ) ) ( not ( = ?auto_17620 ?auto_17621 ) ) ( not ( = ?auto_17620 ?auto_17622 ) ) ( not ( = ?auto_17620 ?auto_17623 ) ) ( not ( = ?auto_17620 ?auto_17624 ) ) ( not ( = ?auto_17621 ?auto_17622 ) ) ( not ( = ?auto_17621 ?auto_17623 ) ) ( not ( = ?auto_17621 ?auto_17624 ) ) ( not ( = ?auto_17622 ?auto_17623 ) ) ( not ( = ?auto_17622 ?auto_17624 ) ) ( not ( = ?auto_17623 ?auto_17624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17623 ?auto_17624 )
      ( !STACK ?auto_17623 ?auto_17622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17630 - BLOCK
      ?auto_17631 - BLOCK
      ?auto_17632 - BLOCK
      ?auto_17633 - BLOCK
      ?auto_17634 - BLOCK
    )
    :vars
    (
      ?auto_17635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17633 ) ( ON ?auto_17634 ?auto_17635 ) ( CLEAR ?auto_17634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17630 ) ( ON ?auto_17631 ?auto_17630 ) ( ON ?auto_17632 ?auto_17631 ) ( ON ?auto_17633 ?auto_17632 ) ( not ( = ?auto_17630 ?auto_17631 ) ) ( not ( = ?auto_17630 ?auto_17632 ) ) ( not ( = ?auto_17630 ?auto_17633 ) ) ( not ( = ?auto_17630 ?auto_17634 ) ) ( not ( = ?auto_17630 ?auto_17635 ) ) ( not ( = ?auto_17631 ?auto_17632 ) ) ( not ( = ?auto_17631 ?auto_17633 ) ) ( not ( = ?auto_17631 ?auto_17634 ) ) ( not ( = ?auto_17631 ?auto_17635 ) ) ( not ( = ?auto_17632 ?auto_17633 ) ) ( not ( = ?auto_17632 ?auto_17634 ) ) ( not ( = ?auto_17632 ?auto_17635 ) ) ( not ( = ?auto_17633 ?auto_17634 ) ) ( not ( = ?auto_17633 ?auto_17635 ) ) ( not ( = ?auto_17634 ?auto_17635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17634 ?auto_17635 )
      ( !STACK ?auto_17634 ?auto_17633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17641 - BLOCK
      ?auto_17642 - BLOCK
      ?auto_17643 - BLOCK
      ?auto_17644 - BLOCK
      ?auto_17645 - BLOCK
    )
    :vars
    (
      ?auto_17646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17645 ?auto_17646 ) ( ON-TABLE ?auto_17641 ) ( ON ?auto_17642 ?auto_17641 ) ( ON ?auto_17643 ?auto_17642 ) ( not ( = ?auto_17641 ?auto_17642 ) ) ( not ( = ?auto_17641 ?auto_17643 ) ) ( not ( = ?auto_17641 ?auto_17644 ) ) ( not ( = ?auto_17641 ?auto_17645 ) ) ( not ( = ?auto_17641 ?auto_17646 ) ) ( not ( = ?auto_17642 ?auto_17643 ) ) ( not ( = ?auto_17642 ?auto_17644 ) ) ( not ( = ?auto_17642 ?auto_17645 ) ) ( not ( = ?auto_17642 ?auto_17646 ) ) ( not ( = ?auto_17643 ?auto_17644 ) ) ( not ( = ?auto_17643 ?auto_17645 ) ) ( not ( = ?auto_17643 ?auto_17646 ) ) ( not ( = ?auto_17644 ?auto_17645 ) ) ( not ( = ?auto_17644 ?auto_17646 ) ) ( not ( = ?auto_17645 ?auto_17646 ) ) ( CLEAR ?auto_17643 ) ( ON ?auto_17644 ?auto_17645 ) ( CLEAR ?auto_17644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17641 ?auto_17642 ?auto_17643 ?auto_17644 )
      ( MAKE-5PILE ?auto_17641 ?auto_17642 ?auto_17643 ?auto_17644 ?auto_17645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17652 - BLOCK
      ?auto_17653 - BLOCK
      ?auto_17654 - BLOCK
      ?auto_17655 - BLOCK
      ?auto_17656 - BLOCK
    )
    :vars
    (
      ?auto_17657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17656 ?auto_17657 ) ( ON-TABLE ?auto_17652 ) ( ON ?auto_17653 ?auto_17652 ) ( ON ?auto_17654 ?auto_17653 ) ( not ( = ?auto_17652 ?auto_17653 ) ) ( not ( = ?auto_17652 ?auto_17654 ) ) ( not ( = ?auto_17652 ?auto_17655 ) ) ( not ( = ?auto_17652 ?auto_17656 ) ) ( not ( = ?auto_17652 ?auto_17657 ) ) ( not ( = ?auto_17653 ?auto_17654 ) ) ( not ( = ?auto_17653 ?auto_17655 ) ) ( not ( = ?auto_17653 ?auto_17656 ) ) ( not ( = ?auto_17653 ?auto_17657 ) ) ( not ( = ?auto_17654 ?auto_17655 ) ) ( not ( = ?auto_17654 ?auto_17656 ) ) ( not ( = ?auto_17654 ?auto_17657 ) ) ( not ( = ?auto_17655 ?auto_17656 ) ) ( not ( = ?auto_17655 ?auto_17657 ) ) ( not ( = ?auto_17656 ?auto_17657 ) ) ( CLEAR ?auto_17654 ) ( ON ?auto_17655 ?auto_17656 ) ( CLEAR ?auto_17655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 )
      ( MAKE-5PILE ?auto_17652 ?auto_17653 ?auto_17654 ?auto_17655 ?auto_17656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17663 - BLOCK
      ?auto_17664 - BLOCK
      ?auto_17665 - BLOCK
      ?auto_17666 - BLOCK
      ?auto_17667 - BLOCK
    )
    :vars
    (
      ?auto_17668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17667 ?auto_17668 ) ( ON-TABLE ?auto_17663 ) ( ON ?auto_17664 ?auto_17663 ) ( not ( = ?auto_17663 ?auto_17664 ) ) ( not ( = ?auto_17663 ?auto_17665 ) ) ( not ( = ?auto_17663 ?auto_17666 ) ) ( not ( = ?auto_17663 ?auto_17667 ) ) ( not ( = ?auto_17663 ?auto_17668 ) ) ( not ( = ?auto_17664 ?auto_17665 ) ) ( not ( = ?auto_17664 ?auto_17666 ) ) ( not ( = ?auto_17664 ?auto_17667 ) ) ( not ( = ?auto_17664 ?auto_17668 ) ) ( not ( = ?auto_17665 ?auto_17666 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( not ( = ?auto_17665 ?auto_17668 ) ) ( not ( = ?auto_17666 ?auto_17667 ) ) ( not ( = ?auto_17666 ?auto_17668 ) ) ( not ( = ?auto_17667 ?auto_17668 ) ) ( ON ?auto_17666 ?auto_17667 ) ( CLEAR ?auto_17664 ) ( ON ?auto_17665 ?auto_17666 ) ( CLEAR ?auto_17665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17663 ?auto_17664 ?auto_17665 )
      ( MAKE-5PILE ?auto_17663 ?auto_17664 ?auto_17665 ?auto_17666 ?auto_17667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17674 - BLOCK
      ?auto_17675 - BLOCK
      ?auto_17676 - BLOCK
      ?auto_17677 - BLOCK
      ?auto_17678 - BLOCK
    )
    :vars
    (
      ?auto_17679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17678 ?auto_17679 ) ( ON-TABLE ?auto_17674 ) ( ON ?auto_17675 ?auto_17674 ) ( not ( = ?auto_17674 ?auto_17675 ) ) ( not ( = ?auto_17674 ?auto_17676 ) ) ( not ( = ?auto_17674 ?auto_17677 ) ) ( not ( = ?auto_17674 ?auto_17678 ) ) ( not ( = ?auto_17674 ?auto_17679 ) ) ( not ( = ?auto_17675 ?auto_17676 ) ) ( not ( = ?auto_17675 ?auto_17677 ) ) ( not ( = ?auto_17675 ?auto_17678 ) ) ( not ( = ?auto_17675 ?auto_17679 ) ) ( not ( = ?auto_17676 ?auto_17677 ) ) ( not ( = ?auto_17676 ?auto_17678 ) ) ( not ( = ?auto_17676 ?auto_17679 ) ) ( not ( = ?auto_17677 ?auto_17678 ) ) ( not ( = ?auto_17677 ?auto_17679 ) ) ( not ( = ?auto_17678 ?auto_17679 ) ) ( ON ?auto_17677 ?auto_17678 ) ( CLEAR ?auto_17675 ) ( ON ?auto_17676 ?auto_17677 ) ( CLEAR ?auto_17676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17674 ?auto_17675 ?auto_17676 )
      ( MAKE-5PILE ?auto_17674 ?auto_17675 ?auto_17676 ?auto_17677 ?auto_17678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17685 - BLOCK
      ?auto_17686 - BLOCK
      ?auto_17687 - BLOCK
      ?auto_17688 - BLOCK
      ?auto_17689 - BLOCK
    )
    :vars
    (
      ?auto_17690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17689 ?auto_17690 ) ( ON-TABLE ?auto_17685 ) ( not ( = ?auto_17685 ?auto_17686 ) ) ( not ( = ?auto_17685 ?auto_17687 ) ) ( not ( = ?auto_17685 ?auto_17688 ) ) ( not ( = ?auto_17685 ?auto_17689 ) ) ( not ( = ?auto_17685 ?auto_17690 ) ) ( not ( = ?auto_17686 ?auto_17687 ) ) ( not ( = ?auto_17686 ?auto_17688 ) ) ( not ( = ?auto_17686 ?auto_17689 ) ) ( not ( = ?auto_17686 ?auto_17690 ) ) ( not ( = ?auto_17687 ?auto_17688 ) ) ( not ( = ?auto_17687 ?auto_17689 ) ) ( not ( = ?auto_17687 ?auto_17690 ) ) ( not ( = ?auto_17688 ?auto_17689 ) ) ( not ( = ?auto_17688 ?auto_17690 ) ) ( not ( = ?auto_17689 ?auto_17690 ) ) ( ON ?auto_17688 ?auto_17689 ) ( ON ?auto_17687 ?auto_17688 ) ( CLEAR ?auto_17685 ) ( ON ?auto_17686 ?auto_17687 ) ( CLEAR ?auto_17686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17685 ?auto_17686 )
      ( MAKE-5PILE ?auto_17685 ?auto_17686 ?auto_17687 ?auto_17688 ?auto_17689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17696 - BLOCK
      ?auto_17697 - BLOCK
      ?auto_17698 - BLOCK
      ?auto_17699 - BLOCK
      ?auto_17700 - BLOCK
    )
    :vars
    (
      ?auto_17701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17700 ?auto_17701 ) ( ON-TABLE ?auto_17696 ) ( not ( = ?auto_17696 ?auto_17697 ) ) ( not ( = ?auto_17696 ?auto_17698 ) ) ( not ( = ?auto_17696 ?auto_17699 ) ) ( not ( = ?auto_17696 ?auto_17700 ) ) ( not ( = ?auto_17696 ?auto_17701 ) ) ( not ( = ?auto_17697 ?auto_17698 ) ) ( not ( = ?auto_17697 ?auto_17699 ) ) ( not ( = ?auto_17697 ?auto_17700 ) ) ( not ( = ?auto_17697 ?auto_17701 ) ) ( not ( = ?auto_17698 ?auto_17699 ) ) ( not ( = ?auto_17698 ?auto_17700 ) ) ( not ( = ?auto_17698 ?auto_17701 ) ) ( not ( = ?auto_17699 ?auto_17700 ) ) ( not ( = ?auto_17699 ?auto_17701 ) ) ( not ( = ?auto_17700 ?auto_17701 ) ) ( ON ?auto_17699 ?auto_17700 ) ( ON ?auto_17698 ?auto_17699 ) ( CLEAR ?auto_17696 ) ( ON ?auto_17697 ?auto_17698 ) ( CLEAR ?auto_17697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17696 ?auto_17697 )
      ( MAKE-5PILE ?auto_17696 ?auto_17697 ?auto_17698 ?auto_17699 ?auto_17700 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17707 - BLOCK
      ?auto_17708 - BLOCK
      ?auto_17709 - BLOCK
      ?auto_17710 - BLOCK
      ?auto_17711 - BLOCK
    )
    :vars
    (
      ?auto_17712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17711 ?auto_17712 ) ( not ( = ?auto_17707 ?auto_17708 ) ) ( not ( = ?auto_17707 ?auto_17709 ) ) ( not ( = ?auto_17707 ?auto_17710 ) ) ( not ( = ?auto_17707 ?auto_17711 ) ) ( not ( = ?auto_17707 ?auto_17712 ) ) ( not ( = ?auto_17708 ?auto_17709 ) ) ( not ( = ?auto_17708 ?auto_17710 ) ) ( not ( = ?auto_17708 ?auto_17711 ) ) ( not ( = ?auto_17708 ?auto_17712 ) ) ( not ( = ?auto_17709 ?auto_17710 ) ) ( not ( = ?auto_17709 ?auto_17711 ) ) ( not ( = ?auto_17709 ?auto_17712 ) ) ( not ( = ?auto_17710 ?auto_17711 ) ) ( not ( = ?auto_17710 ?auto_17712 ) ) ( not ( = ?auto_17711 ?auto_17712 ) ) ( ON ?auto_17710 ?auto_17711 ) ( ON ?auto_17709 ?auto_17710 ) ( ON ?auto_17708 ?auto_17709 ) ( ON ?auto_17707 ?auto_17708 ) ( CLEAR ?auto_17707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17707 )
      ( MAKE-5PILE ?auto_17707 ?auto_17708 ?auto_17709 ?auto_17710 ?auto_17711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17718 - BLOCK
      ?auto_17719 - BLOCK
      ?auto_17720 - BLOCK
      ?auto_17721 - BLOCK
      ?auto_17722 - BLOCK
    )
    :vars
    (
      ?auto_17723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17722 ?auto_17723 ) ( not ( = ?auto_17718 ?auto_17719 ) ) ( not ( = ?auto_17718 ?auto_17720 ) ) ( not ( = ?auto_17718 ?auto_17721 ) ) ( not ( = ?auto_17718 ?auto_17722 ) ) ( not ( = ?auto_17718 ?auto_17723 ) ) ( not ( = ?auto_17719 ?auto_17720 ) ) ( not ( = ?auto_17719 ?auto_17721 ) ) ( not ( = ?auto_17719 ?auto_17722 ) ) ( not ( = ?auto_17719 ?auto_17723 ) ) ( not ( = ?auto_17720 ?auto_17721 ) ) ( not ( = ?auto_17720 ?auto_17722 ) ) ( not ( = ?auto_17720 ?auto_17723 ) ) ( not ( = ?auto_17721 ?auto_17722 ) ) ( not ( = ?auto_17721 ?auto_17723 ) ) ( not ( = ?auto_17722 ?auto_17723 ) ) ( ON ?auto_17721 ?auto_17722 ) ( ON ?auto_17720 ?auto_17721 ) ( ON ?auto_17719 ?auto_17720 ) ( ON ?auto_17718 ?auto_17719 ) ( CLEAR ?auto_17718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17718 )
      ( MAKE-5PILE ?auto_17718 ?auto_17719 ?auto_17720 ?auto_17721 ?auto_17722 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17730 - BLOCK
      ?auto_17731 - BLOCK
      ?auto_17732 - BLOCK
      ?auto_17733 - BLOCK
      ?auto_17734 - BLOCK
      ?auto_17735 - BLOCK
    )
    :vars
    (
      ?auto_17736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17734 ) ( ON ?auto_17735 ?auto_17736 ) ( CLEAR ?auto_17735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17730 ) ( ON ?auto_17731 ?auto_17730 ) ( ON ?auto_17732 ?auto_17731 ) ( ON ?auto_17733 ?auto_17732 ) ( ON ?auto_17734 ?auto_17733 ) ( not ( = ?auto_17730 ?auto_17731 ) ) ( not ( = ?auto_17730 ?auto_17732 ) ) ( not ( = ?auto_17730 ?auto_17733 ) ) ( not ( = ?auto_17730 ?auto_17734 ) ) ( not ( = ?auto_17730 ?auto_17735 ) ) ( not ( = ?auto_17730 ?auto_17736 ) ) ( not ( = ?auto_17731 ?auto_17732 ) ) ( not ( = ?auto_17731 ?auto_17733 ) ) ( not ( = ?auto_17731 ?auto_17734 ) ) ( not ( = ?auto_17731 ?auto_17735 ) ) ( not ( = ?auto_17731 ?auto_17736 ) ) ( not ( = ?auto_17732 ?auto_17733 ) ) ( not ( = ?auto_17732 ?auto_17734 ) ) ( not ( = ?auto_17732 ?auto_17735 ) ) ( not ( = ?auto_17732 ?auto_17736 ) ) ( not ( = ?auto_17733 ?auto_17734 ) ) ( not ( = ?auto_17733 ?auto_17735 ) ) ( not ( = ?auto_17733 ?auto_17736 ) ) ( not ( = ?auto_17734 ?auto_17735 ) ) ( not ( = ?auto_17734 ?auto_17736 ) ) ( not ( = ?auto_17735 ?auto_17736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17735 ?auto_17736 )
      ( !STACK ?auto_17735 ?auto_17734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17743 - BLOCK
      ?auto_17744 - BLOCK
      ?auto_17745 - BLOCK
      ?auto_17746 - BLOCK
      ?auto_17747 - BLOCK
      ?auto_17748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17747 ) ( ON-TABLE ?auto_17748 ) ( CLEAR ?auto_17748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17743 ) ( ON ?auto_17744 ?auto_17743 ) ( ON ?auto_17745 ?auto_17744 ) ( ON ?auto_17746 ?auto_17745 ) ( ON ?auto_17747 ?auto_17746 ) ( not ( = ?auto_17743 ?auto_17744 ) ) ( not ( = ?auto_17743 ?auto_17745 ) ) ( not ( = ?auto_17743 ?auto_17746 ) ) ( not ( = ?auto_17743 ?auto_17747 ) ) ( not ( = ?auto_17743 ?auto_17748 ) ) ( not ( = ?auto_17744 ?auto_17745 ) ) ( not ( = ?auto_17744 ?auto_17746 ) ) ( not ( = ?auto_17744 ?auto_17747 ) ) ( not ( = ?auto_17744 ?auto_17748 ) ) ( not ( = ?auto_17745 ?auto_17746 ) ) ( not ( = ?auto_17745 ?auto_17747 ) ) ( not ( = ?auto_17745 ?auto_17748 ) ) ( not ( = ?auto_17746 ?auto_17747 ) ) ( not ( = ?auto_17746 ?auto_17748 ) ) ( not ( = ?auto_17747 ?auto_17748 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_17748 )
      ( !STACK ?auto_17748 ?auto_17747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17755 - BLOCK
      ?auto_17756 - BLOCK
      ?auto_17757 - BLOCK
      ?auto_17758 - BLOCK
      ?auto_17759 - BLOCK
      ?auto_17760 - BLOCK
    )
    :vars
    (
      ?auto_17761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17760 ?auto_17761 ) ( ON-TABLE ?auto_17755 ) ( ON ?auto_17756 ?auto_17755 ) ( ON ?auto_17757 ?auto_17756 ) ( ON ?auto_17758 ?auto_17757 ) ( not ( = ?auto_17755 ?auto_17756 ) ) ( not ( = ?auto_17755 ?auto_17757 ) ) ( not ( = ?auto_17755 ?auto_17758 ) ) ( not ( = ?auto_17755 ?auto_17759 ) ) ( not ( = ?auto_17755 ?auto_17760 ) ) ( not ( = ?auto_17755 ?auto_17761 ) ) ( not ( = ?auto_17756 ?auto_17757 ) ) ( not ( = ?auto_17756 ?auto_17758 ) ) ( not ( = ?auto_17756 ?auto_17759 ) ) ( not ( = ?auto_17756 ?auto_17760 ) ) ( not ( = ?auto_17756 ?auto_17761 ) ) ( not ( = ?auto_17757 ?auto_17758 ) ) ( not ( = ?auto_17757 ?auto_17759 ) ) ( not ( = ?auto_17757 ?auto_17760 ) ) ( not ( = ?auto_17757 ?auto_17761 ) ) ( not ( = ?auto_17758 ?auto_17759 ) ) ( not ( = ?auto_17758 ?auto_17760 ) ) ( not ( = ?auto_17758 ?auto_17761 ) ) ( not ( = ?auto_17759 ?auto_17760 ) ) ( not ( = ?auto_17759 ?auto_17761 ) ) ( not ( = ?auto_17760 ?auto_17761 ) ) ( CLEAR ?auto_17758 ) ( ON ?auto_17759 ?auto_17760 ) ( CLEAR ?auto_17759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17755 ?auto_17756 ?auto_17757 ?auto_17758 ?auto_17759 )
      ( MAKE-6PILE ?auto_17755 ?auto_17756 ?auto_17757 ?auto_17758 ?auto_17759 ?auto_17760 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17768 - BLOCK
      ?auto_17769 - BLOCK
      ?auto_17770 - BLOCK
      ?auto_17771 - BLOCK
      ?auto_17772 - BLOCK
      ?auto_17773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17773 ) ( ON-TABLE ?auto_17768 ) ( ON ?auto_17769 ?auto_17768 ) ( ON ?auto_17770 ?auto_17769 ) ( ON ?auto_17771 ?auto_17770 ) ( not ( = ?auto_17768 ?auto_17769 ) ) ( not ( = ?auto_17768 ?auto_17770 ) ) ( not ( = ?auto_17768 ?auto_17771 ) ) ( not ( = ?auto_17768 ?auto_17772 ) ) ( not ( = ?auto_17768 ?auto_17773 ) ) ( not ( = ?auto_17769 ?auto_17770 ) ) ( not ( = ?auto_17769 ?auto_17771 ) ) ( not ( = ?auto_17769 ?auto_17772 ) ) ( not ( = ?auto_17769 ?auto_17773 ) ) ( not ( = ?auto_17770 ?auto_17771 ) ) ( not ( = ?auto_17770 ?auto_17772 ) ) ( not ( = ?auto_17770 ?auto_17773 ) ) ( not ( = ?auto_17771 ?auto_17772 ) ) ( not ( = ?auto_17771 ?auto_17773 ) ) ( not ( = ?auto_17772 ?auto_17773 ) ) ( CLEAR ?auto_17771 ) ( ON ?auto_17772 ?auto_17773 ) ( CLEAR ?auto_17772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17768 ?auto_17769 ?auto_17770 ?auto_17771 ?auto_17772 )
      ( MAKE-6PILE ?auto_17768 ?auto_17769 ?auto_17770 ?auto_17771 ?auto_17772 ?auto_17773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17780 - BLOCK
      ?auto_17781 - BLOCK
      ?auto_17782 - BLOCK
      ?auto_17783 - BLOCK
      ?auto_17784 - BLOCK
      ?auto_17785 - BLOCK
    )
    :vars
    (
      ?auto_17786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17785 ?auto_17786 ) ( ON-TABLE ?auto_17780 ) ( ON ?auto_17781 ?auto_17780 ) ( ON ?auto_17782 ?auto_17781 ) ( not ( = ?auto_17780 ?auto_17781 ) ) ( not ( = ?auto_17780 ?auto_17782 ) ) ( not ( = ?auto_17780 ?auto_17783 ) ) ( not ( = ?auto_17780 ?auto_17784 ) ) ( not ( = ?auto_17780 ?auto_17785 ) ) ( not ( = ?auto_17780 ?auto_17786 ) ) ( not ( = ?auto_17781 ?auto_17782 ) ) ( not ( = ?auto_17781 ?auto_17783 ) ) ( not ( = ?auto_17781 ?auto_17784 ) ) ( not ( = ?auto_17781 ?auto_17785 ) ) ( not ( = ?auto_17781 ?auto_17786 ) ) ( not ( = ?auto_17782 ?auto_17783 ) ) ( not ( = ?auto_17782 ?auto_17784 ) ) ( not ( = ?auto_17782 ?auto_17785 ) ) ( not ( = ?auto_17782 ?auto_17786 ) ) ( not ( = ?auto_17783 ?auto_17784 ) ) ( not ( = ?auto_17783 ?auto_17785 ) ) ( not ( = ?auto_17783 ?auto_17786 ) ) ( not ( = ?auto_17784 ?auto_17785 ) ) ( not ( = ?auto_17784 ?auto_17786 ) ) ( not ( = ?auto_17785 ?auto_17786 ) ) ( ON ?auto_17784 ?auto_17785 ) ( CLEAR ?auto_17782 ) ( ON ?auto_17783 ?auto_17784 ) ( CLEAR ?auto_17783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17780 ?auto_17781 ?auto_17782 ?auto_17783 )
      ( MAKE-6PILE ?auto_17780 ?auto_17781 ?auto_17782 ?auto_17783 ?auto_17784 ?auto_17785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17793 - BLOCK
      ?auto_17794 - BLOCK
      ?auto_17795 - BLOCK
      ?auto_17796 - BLOCK
      ?auto_17797 - BLOCK
      ?auto_17798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17798 ) ( ON-TABLE ?auto_17793 ) ( ON ?auto_17794 ?auto_17793 ) ( ON ?auto_17795 ?auto_17794 ) ( not ( = ?auto_17793 ?auto_17794 ) ) ( not ( = ?auto_17793 ?auto_17795 ) ) ( not ( = ?auto_17793 ?auto_17796 ) ) ( not ( = ?auto_17793 ?auto_17797 ) ) ( not ( = ?auto_17793 ?auto_17798 ) ) ( not ( = ?auto_17794 ?auto_17795 ) ) ( not ( = ?auto_17794 ?auto_17796 ) ) ( not ( = ?auto_17794 ?auto_17797 ) ) ( not ( = ?auto_17794 ?auto_17798 ) ) ( not ( = ?auto_17795 ?auto_17796 ) ) ( not ( = ?auto_17795 ?auto_17797 ) ) ( not ( = ?auto_17795 ?auto_17798 ) ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( not ( = ?auto_17796 ?auto_17798 ) ) ( not ( = ?auto_17797 ?auto_17798 ) ) ( ON ?auto_17797 ?auto_17798 ) ( CLEAR ?auto_17795 ) ( ON ?auto_17796 ?auto_17797 ) ( CLEAR ?auto_17796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17793 ?auto_17794 ?auto_17795 ?auto_17796 )
      ( MAKE-6PILE ?auto_17793 ?auto_17794 ?auto_17795 ?auto_17796 ?auto_17797 ?auto_17798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17805 - BLOCK
      ?auto_17806 - BLOCK
      ?auto_17807 - BLOCK
      ?auto_17808 - BLOCK
      ?auto_17809 - BLOCK
      ?auto_17810 - BLOCK
    )
    :vars
    (
      ?auto_17811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17810 ?auto_17811 ) ( ON-TABLE ?auto_17805 ) ( ON ?auto_17806 ?auto_17805 ) ( not ( = ?auto_17805 ?auto_17806 ) ) ( not ( = ?auto_17805 ?auto_17807 ) ) ( not ( = ?auto_17805 ?auto_17808 ) ) ( not ( = ?auto_17805 ?auto_17809 ) ) ( not ( = ?auto_17805 ?auto_17810 ) ) ( not ( = ?auto_17805 ?auto_17811 ) ) ( not ( = ?auto_17806 ?auto_17807 ) ) ( not ( = ?auto_17806 ?auto_17808 ) ) ( not ( = ?auto_17806 ?auto_17809 ) ) ( not ( = ?auto_17806 ?auto_17810 ) ) ( not ( = ?auto_17806 ?auto_17811 ) ) ( not ( = ?auto_17807 ?auto_17808 ) ) ( not ( = ?auto_17807 ?auto_17809 ) ) ( not ( = ?auto_17807 ?auto_17810 ) ) ( not ( = ?auto_17807 ?auto_17811 ) ) ( not ( = ?auto_17808 ?auto_17809 ) ) ( not ( = ?auto_17808 ?auto_17810 ) ) ( not ( = ?auto_17808 ?auto_17811 ) ) ( not ( = ?auto_17809 ?auto_17810 ) ) ( not ( = ?auto_17809 ?auto_17811 ) ) ( not ( = ?auto_17810 ?auto_17811 ) ) ( ON ?auto_17809 ?auto_17810 ) ( ON ?auto_17808 ?auto_17809 ) ( CLEAR ?auto_17806 ) ( ON ?auto_17807 ?auto_17808 ) ( CLEAR ?auto_17807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17805 ?auto_17806 ?auto_17807 )
      ( MAKE-6PILE ?auto_17805 ?auto_17806 ?auto_17807 ?auto_17808 ?auto_17809 ?auto_17810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17818 - BLOCK
      ?auto_17819 - BLOCK
      ?auto_17820 - BLOCK
      ?auto_17821 - BLOCK
      ?auto_17822 - BLOCK
      ?auto_17823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17823 ) ( ON-TABLE ?auto_17818 ) ( ON ?auto_17819 ?auto_17818 ) ( not ( = ?auto_17818 ?auto_17819 ) ) ( not ( = ?auto_17818 ?auto_17820 ) ) ( not ( = ?auto_17818 ?auto_17821 ) ) ( not ( = ?auto_17818 ?auto_17822 ) ) ( not ( = ?auto_17818 ?auto_17823 ) ) ( not ( = ?auto_17819 ?auto_17820 ) ) ( not ( = ?auto_17819 ?auto_17821 ) ) ( not ( = ?auto_17819 ?auto_17822 ) ) ( not ( = ?auto_17819 ?auto_17823 ) ) ( not ( = ?auto_17820 ?auto_17821 ) ) ( not ( = ?auto_17820 ?auto_17822 ) ) ( not ( = ?auto_17820 ?auto_17823 ) ) ( not ( = ?auto_17821 ?auto_17822 ) ) ( not ( = ?auto_17821 ?auto_17823 ) ) ( not ( = ?auto_17822 ?auto_17823 ) ) ( ON ?auto_17822 ?auto_17823 ) ( ON ?auto_17821 ?auto_17822 ) ( CLEAR ?auto_17819 ) ( ON ?auto_17820 ?auto_17821 ) ( CLEAR ?auto_17820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17818 ?auto_17819 ?auto_17820 )
      ( MAKE-6PILE ?auto_17818 ?auto_17819 ?auto_17820 ?auto_17821 ?auto_17822 ?auto_17823 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17830 - BLOCK
      ?auto_17831 - BLOCK
      ?auto_17832 - BLOCK
      ?auto_17833 - BLOCK
      ?auto_17834 - BLOCK
      ?auto_17835 - BLOCK
    )
    :vars
    (
      ?auto_17836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17835 ?auto_17836 ) ( ON-TABLE ?auto_17830 ) ( not ( = ?auto_17830 ?auto_17831 ) ) ( not ( = ?auto_17830 ?auto_17832 ) ) ( not ( = ?auto_17830 ?auto_17833 ) ) ( not ( = ?auto_17830 ?auto_17834 ) ) ( not ( = ?auto_17830 ?auto_17835 ) ) ( not ( = ?auto_17830 ?auto_17836 ) ) ( not ( = ?auto_17831 ?auto_17832 ) ) ( not ( = ?auto_17831 ?auto_17833 ) ) ( not ( = ?auto_17831 ?auto_17834 ) ) ( not ( = ?auto_17831 ?auto_17835 ) ) ( not ( = ?auto_17831 ?auto_17836 ) ) ( not ( = ?auto_17832 ?auto_17833 ) ) ( not ( = ?auto_17832 ?auto_17834 ) ) ( not ( = ?auto_17832 ?auto_17835 ) ) ( not ( = ?auto_17832 ?auto_17836 ) ) ( not ( = ?auto_17833 ?auto_17834 ) ) ( not ( = ?auto_17833 ?auto_17835 ) ) ( not ( = ?auto_17833 ?auto_17836 ) ) ( not ( = ?auto_17834 ?auto_17835 ) ) ( not ( = ?auto_17834 ?auto_17836 ) ) ( not ( = ?auto_17835 ?auto_17836 ) ) ( ON ?auto_17834 ?auto_17835 ) ( ON ?auto_17833 ?auto_17834 ) ( ON ?auto_17832 ?auto_17833 ) ( CLEAR ?auto_17830 ) ( ON ?auto_17831 ?auto_17832 ) ( CLEAR ?auto_17831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17830 ?auto_17831 )
      ( MAKE-6PILE ?auto_17830 ?auto_17831 ?auto_17832 ?auto_17833 ?auto_17834 ?auto_17835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17843 - BLOCK
      ?auto_17844 - BLOCK
      ?auto_17845 - BLOCK
      ?auto_17846 - BLOCK
      ?auto_17847 - BLOCK
      ?auto_17848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17848 ) ( ON-TABLE ?auto_17843 ) ( not ( = ?auto_17843 ?auto_17844 ) ) ( not ( = ?auto_17843 ?auto_17845 ) ) ( not ( = ?auto_17843 ?auto_17846 ) ) ( not ( = ?auto_17843 ?auto_17847 ) ) ( not ( = ?auto_17843 ?auto_17848 ) ) ( not ( = ?auto_17844 ?auto_17845 ) ) ( not ( = ?auto_17844 ?auto_17846 ) ) ( not ( = ?auto_17844 ?auto_17847 ) ) ( not ( = ?auto_17844 ?auto_17848 ) ) ( not ( = ?auto_17845 ?auto_17846 ) ) ( not ( = ?auto_17845 ?auto_17847 ) ) ( not ( = ?auto_17845 ?auto_17848 ) ) ( not ( = ?auto_17846 ?auto_17847 ) ) ( not ( = ?auto_17846 ?auto_17848 ) ) ( not ( = ?auto_17847 ?auto_17848 ) ) ( ON ?auto_17847 ?auto_17848 ) ( ON ?auto_17846 ?auto_17847 ) ( ON ?auto_17845 ?auto_17846 ) ( CLEAR ?auto_17843 ) ( ON ?auto_17844 ?auto_17845 ) ( CLEAR ?auto_17844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17843 ?auto_17844 )
      ( MAKE-6PILE ?auto_17843 ?auto_17844 ?auto_17845 ?auto_17846 ?auto_17847 ?auto_17848 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17855 - BLOCK
      ?auto_17856 - BLOCK
      ?auto_17857 - BLOCK
      ?auto_17858 - BLOCK
      ?auto_17859 - BLOCK
      ?auto_17860 - BLOCK
    )
    :vars
    (
      ?auto_17861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17860 ?auto_17861 ) ( not ( = ?auto_17855 ?auto_17856 ) ) ( not ( = ?auto_17855 ?auto_17857 ) ) ( not ( = ?auto_17855 ?auto_17858 ) ) ( not ( = ?auto_17855 ?auto_17859 ) ) ( not ( = ?auto_17855 ?auto_17860 ) ) ( not ( = ?auto_17855 ?auto_17861 ) ) ( not ( = ?auto_17856 ?auto_17857 ) ) ( not ( = ?auto_17856 ?auto_17858 ) ) ( not ( = ?auto_17856 ?auto_17859 ) ) ( not ( = ?auto_17856 ?auto_17860 ) ) ( not ( = ?auto_17856 ?auto_17861 ) ) ( not ( = ?auto_17857 ?auto_17858 ) ) ( not ( = ?auto_17857 ?auto_17859 ) ) ( not ( = ?auto_17857 ?auto_17860 ) ) ( not ( = ?auto_17857 ?auto_17861 ) ) ( not ( = ?auto_17858 ?auto_17859 ) ) ( not ( = ?auto_17858 ?auto_17860 ) ) ( not ( = ?auto_17858 ?auto_17861 ) ) ( not ( = ?auto_17859 ?auto_17860 ) ) ( not ( = ?auto_17859 ?auto_17861 ) ) ( not ( = ?auto_17860 ?auto_17861 ) ) ( ON ?auto_17859 ?auto_17860 ) ( ON ?auto_17858 ?auto_17859 ) ( ON ?auto_17857 ?auto_17858 ) ( ON ?auto_17856 ?auto_17857 ) ( ON ?auto_17855 ?auto_17856 ) ( CLEAR ?auto_17855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17855 )
      ( MAKE-6PILE ?auto_17855 ?auto_17856 ?auto_17857 ?auto_17858 ?auto_17859 ?auto_17860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17868 - BLOCK
      ?auto_17869 - BLOCK
      ?auto_17870 - BLOCK
      ?auto_17871 - BLOCK
      ?auto_17872 - BLOCK
      ?auto_17873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17873 ) ( not ( = ?auto_17868 ?auto_17869 ) ) ( not ( = ?auto_17868 ?auto_17870 ) ) ( not ( = ?auto_17868 ?auto_17871 ) ) ( not ( = ?auto_17868 ?auto_17872 ) ) ( not ( = ?auto_17868 ?auto_17873 ) ) ( not ( = ?auto_17869 ?auto_17870 ) ) ( not ( = ?auto_17869 ?auto_17871 ) ) ( not ( = ?auto_17869 ?auto_17872 ) ) ( not ( = ?auto_17869 ?auto_17873 ) ) ( not ( = ?auto_17870 ?auto_17871 ) ) ( not ( = ?auto_17870 ?auto_17872 ) ) ( not ( = ?auto_17870 ?auto_17873 ) ) ( not ( = ?auto_17871 ?auto_17872 ) ) ( not ( = ?auto_17871 ?auto_17873 ) ) ( not ( = ?auto_17872 ?auto_17873 ) ) ( ON ?auto_17872 ?auto_17873 ) ( ON ?auto_17871 ?auto_17872 ) ( ON ?auto_17870 ?auto_17871 ) ( ON ?auto_17869 ?auto_17870 ) ( ON ?auto_17868 ?auto_17869 ) ( CLEAR ?auto_17868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17868 )
      ( MAKE-6PILE ?auto_17868 ?auto_17869 ?auto_17870 ?auto_17871 ?auto_17872 ?auto_17873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17880 - BLOCK
      ?auto_17881 - BLOCK
      ?auto_17882 - BLOCK
      ?auto_17883 - BLOCK
      ?auto_17884 - BLOCK
      ?auto_17885 - BLOCK
    )
    :vars
    (
      ?auto_17886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17880 ?auto_17881 ) ) ( not ( = ?auto_17880 ?auto_17882 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17884 ) ) ( not ( = ?auto_17880 ?auto_17885 ) ) ( not ( = ?auto_17881 ?auto_17882 ) ) ( not ( = ?auto_17881 ?auto_17883 ) ) ( not ( = ?auto_17881 ?auto_17884 ) ) ( not ( = ?auto_17881 ?auto_17885 ) ) ( not ( = ?auto_17882 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17884 ) ) ( not ( = ?auto_17882 ?auto_17885 ) ) ( not ( = ?auto_17883 ?auto_17884 ) ) ( not ( = ?auto_17883 ?auto_17885 ) ) ( not ( = ?auto_17884 ?auto_17885 ) ) ( ON ?auto_17880 ?auto_17886 ) ( not ( = ?auto_17885 ?auto_17886 ) ) ( not ( = ?auto_17884 ?auto_17886 ) ) ( not ( = ?auto_17883 ?auto_17886 ) ) ( not ( = ?auto_17882 ?auto_17886 ) ) ( not ( = ?auto_17881 ?auto_17886 ) ) ( not ( = ?auto_17880 ?auto_17886 ) ) ( ON ?auto_17881 ?auto_17880 ) ( ON ?auto_17882 ?auto_17881 ) ( ON ?auto_17883 ?auto_17882 ) ( ON ?auto_17884 ?auto_17883 ) ( ON ?auto_17885 ?auto_17884 ) ( CLEAR ?auto_17885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_17885 ?auto_17884 ?auto_17883 ?auto_17882 ?auto_17881 ?auto_17880 )
      ( MAKE-6PILE ?auto_17880 ?auto_17881 ?auto_17882 ?auto_17883 ?auto_17884 ?auto_17885 ) )
  )

)

