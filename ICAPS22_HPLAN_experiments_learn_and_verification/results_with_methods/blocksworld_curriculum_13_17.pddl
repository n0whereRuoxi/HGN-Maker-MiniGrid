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
      ?auto_264505 - BLOCK
    )
    :vars
    (
      ?auto_264506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264505 ?auto_264506 ) ( CLEAR ?auto_264505 ) ( HAND-EMPTY ) ( not ( = ?auto_264505 ?auto_264506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264505 ?auto_264506 )
      ( !PUTDOWN ?auto_264505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_264508 - BLOCK
    )
    :vars
    (
      ?auto_264509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264508 ?auto_264509 ) ( CLEAR ?auto_264508 ) ( HAND-EMPTY ) ( not ( = ?auto_264508 ?auto_264509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264508 ?auto_264509 )
      ( !PUTDOWN ?auto_264508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_264512 - BLOCK
      ?auto_264513 - BLOCK
    )
    :vars
    (
      ?auto_264514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264512 ) ( ON ?auto_264513 ?auto_264514 ) ( CLEAR ?auto_264513 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264512 ) ( not ( = ?auto_264512 ?auto_264513 ) ) ( not ( = ?auto_264512 ?auto_264514 ) ) ( not ( = ?auto_264513 ?auto_264514 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264513 ?auto_264514 )
      ( !STACK ?auto_264513 ?auto_264512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_264517 - BLOCK
      ?auto_264518 - BLOCK
    )
    :vars
    (
      ?auto_264519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264517 ) ( ON ?auto_264518 ?auto_264519 ) ( CLEAR ?auto_264518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264517 ) ( not ( = ?auto_264517 ?auto_264518 ) ) ( not ( = ?auto_264517 ?auto_264519 ) ) ( not ( = ?auto_264518 ?auto_264519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264518 ?auto_264519 )
      ( !STACK ?auto_264518 ?auto_264517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_264522 - BLOCK
      ?auto_264523 - BLOCK
    )
    :vars
    (
      ?auto_264524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264523 ?auto_264524 ) ( not ( = ?auto_264522 ?auto_264523 ) ) ( not ( = ?auto_264522 ?auto_264524 ) ) ( not ( = ?auto_264523 ?auto_264524 ) ) ( ON ?auto_264522 ?auto_264523 ) ( CLEAR ?auto_264522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264522 )
      ( MAKE-2PILE ?auto_264522 ?auto_264523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_264527 - BLOCK
      ?auto_264528 - BLOCK
    )
    :vars
    (
      ?auto_264529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264528 ?auto_264529 ) ( not ( = ?auto_264527 ?auto_264528 ) ) ( not ( = ?auto_264527 ?auto_264529 ) ) ( not ( = ?auto_264528 ?auto_264529 ) ) ( ON ?auto_264527 ?auto_264528 ) ( CLEAR ?auto_264527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264527 )
      ( MAKE-2PILE ?auto_264527 ?auto_264528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264533 - BLOCK
      ?auto_264534 - BLOCK
      ?auto_264535 - BLOCK
    )
    :vars
    (
      ?auto_264536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264534 ) ( ON ?auto_264535 ?auto_264536 ) ( CLEAR ?auto_264535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264533 ) ( ON ?auto_264534 ?auto_264533 ) ( not ( = ?auto_264533 ?auto_264534 ) ) ( not ( = ?auto_264533 ?auto_264535 ) ) ( not ( = ?auto_264533 ?auto_264536 ) ) ( not ( = ?auto_264534 ?auto_264535 ) ) ( not ( = ?auto_264534 ?auto_264536 ) ) ( not ( = ?auto_264535 ?auto_264536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264535 ?auto_264536 )
      ( !STACK ?auto_264535 ?auto_264534 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264540 - BLOCK
      ?auto_264541 - BLOCK
      ?auto_264542 - BLOCK
    )
    :vars
    (
      ?auto_264543 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264541 ) ( ON ?auto_264542 ?auto_264543 ) ( CLEAR ?auto_264542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264540 ) ( ON ?auto_264541 ?auto_264540 ) ( not ( = ?auto_264540 ?auto_264541 ) ) ( not ( = ?auto_264540 ?auto_264542 ) ) ( not ( = ?auto_264540 ?auto_264543 ) ) ( not ( = ?auto_264541 ?auto_264542 ) ) ( not ( = ?auto_264541 ?auto_264543 ) ) ( not ( = ?auto_264542 ?auto_264543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264542 ?auto_264543 )
      ( !STACK ?auto_264542 ?auto_264541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264547 - BLOCK
      ?auto_264548 - BLOCK
      ?auto_264549 - BLOCK
    )
    :vars
    (
      ?auto_264550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264549 ?auto_264550 ) ( ON-TABLE ?auto_264547 ) ( not ( = ?auto_264547 ?auto_264548 ) ) ( not ( = ?auto_264547 ?auto_264549 ) ) ( not ( = ?auto_264547 ?auto_264550 ) ) ( not ( = ?auto_264548 ?auto_264549 ) ) ( not ( = ?auto_264548 ?auto_264550 ) ) ( not ( = ?auto_264549 ?auto_264550 ) ) ( CLEAR ?auto_264547 ) ( ON ?auto_264548 ?auto_264549 ) ( CLEAR ?auto_264548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264547 ?auto_264548 )
      ( MAKE-3PILE ?auto_264547 ?auto_264548 ?auto_264549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264554 - BLOCK
      ?auto_264555 - BLOCK
      ?auto_264556 - BLOCK
    )
    :vars
    (
      ?auto_264557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264556 ?auto_264557 ) ( ON-TABLE ?auto_264554 ) ( not ( = ?auto_264554 ?auto_264555 ) ) ( not ( = ?auto_264554 ?auto_264556 ) ) ( not ( = ?auto_264554 ?auto_264557 ) ) ( not ( = ?auto_264555 ?auto_264556 ) ) ( not ( = ?auto_264555 ?auto_264557 ) ) ( not ( = ?auto_264556 ?auto_264557 ) ) ( CLEAR ?auto_264554 ) ( ON ?auto_264555 ?auto_264556 ) ( CLEAR ?auto_264555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264554 ?auto_264555 )
      ( MAKE-3PILE ?auto_264554 ?auto_264555 ?auto_264556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264561 - BLOCK
      ?auto_264562 - BLOCK
      ?auto_264563 - BLOCK
    )
    :vars
    (
      ?auto_264564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264563 ?auto_264564 ) ( not ( = ?auto_264561 ?auto_264562 ) ) ( not ( = ?auto_264561 ?auto_264563 ) ) ( not ( = ?auto_264561 ?auto_264564 ) ) ( not ( = ?auto_264562 ?auto_264563 ) ) ( not ( = ?auto_264562 ?auto_264564 ) ) ( not ( = ?auto_264563 ?auto_264564 ) ) ( ON ?auto_264562 ?auto_264563 ) ( ON ?auto_264561 ?auto_264562 ) ( CLEAR ?auto_264561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264561 )
      ( MAKE-3PILE ?auto_264561 ?auto_264562 ?auto_264563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_264568 - BLOCK
      ?auto_264569 - BLOCK
      ?auto_264570 - BLOCK
    )
    :vars
    (
      ?auto_264571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264570 ?auto_264571 ) ( not ( = ?auto_264568 ?auto_264569 ) ) ( not ( = ?auto_264568 ?auto_264570 ) ) ( not ( = ?auto_264568 ?auto_264571 ) ) ( not ( = ?auto_264569 ?auto_264570 ) ) ( not ( = ?auto_264569 ?auto_264571 ) ) ( not ( = ?auto_264570 ?auto_264571 ) ) ( ON ?auto_264569 ?auto_264570 ) ( ON ?auto_264568 ?auto_264569 ) ( CLEAR ?auto_264568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264568 )
      ( MAKE-3PILE ?auto_264568 ?auto_264569 ?auto_264570 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264576 - BLOCK
      ?auto_264577 - BLOCK
      ?auto_264578 - BLOCK
      ?auto_264579 - BLOCK
    )
    :vars
    (
      ?auto_264580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264578 ) ( ON ?auto_264579 ?auto_264580 ) ( CLEAR ?auto_264579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264576 ) ( ON ?auto_264577 ?auto_264576 ) ( ON ?auto_264578 ?auto_264577 ) ( not ( = ?auto_264576 ?auto_264577 ) ) ( not ( = ?auto_264576 ?auto_264578 ) ) ( not ( = ?auto_264576 ?auto_264579 ) ) ( not ( = ?auto_264576 ?auto_264580 ) ) ( not ( = ?auto_264577 ?auto_264578 ) ) ( not ( = ?auto_264577 ?auto_264579 ) ) ( not ( = ?auto_264577 ?auto_264580 ) ) ( not ( = ?auto_264578 ?auto_264579 ) ) ( not ( = ?auto_264578 ?auto_264580 ) ) ( not ( = ?auto_264579 ?auto_264580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264579 ?auto_264580 )
      ( !STACK ?auto_264579 ?auto_264578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264585 - BLOCK
      ?auto_264586 - BLOCK
      ?auto_264587 - BLOCK
      ?auto_264588 - BLOCK
    )
    :vars
    (
      ?auto_264589 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264587 ) ( ON ?auto_264588 ?auto_264589 ) ( CLEAR ?auto_264588 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264585 ) ( ON ?auto_264586 ?auto_264585 ) ( ON ?auto_264587 ?auto_264586 ) ( not ( = ?auto_264585 ?auto_264586 ) ) ( not ( = ?auto_264585 ?auto_264587 ) ) ( not ( = ?auto_264585 ?auto_264588 ) ) ( not ( = ?auto_264585 ?auto_264589 ) ) ( not ( = ?auto_264586 ?auto_264587 ) ) ( not ( = ?auto_264586 ?auto_264588 ) ) ( not ( = ?auto_264586 ?auto_264589 ) ) ( not ( = ?auto_264587 ?auto_264588 ) ) ( not ( = ?auto_264587 ?auto_264589 ) ) ( not ( = ?auto_264588 ?auto_264589 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264588 ?auto_264589 )
      ( !STACK ?auto_264588 ?auto_264587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264594 - BLOCK
      ?auto_264595 - BLOCK
      ?auto_264596 - BLOCK
      ?auto_264597 - BLOCK
    )
    :vars
    (
      ?auto_264598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264597 ?auto_264598 ) ( ON-TABLE ?auto_264594 ) ( ON ?auto_264595 ?auto_264594 ) ( not ( = ?auto_264594 ?auto_264595 ) ) ( not ( = ?auto_264594 ?auto_264596 ) ) ( not ( = ?auto_264594 ?auto_264597 ) ) ( not ( = ?auto_264594 ?auto_264598 ) ) ( not ( = ?auto_264595 ?auto_264596 ) ) ( not ( = ?auto_264595 ?auto_264597 ) ) ( not ( = ?auto_264595 ?auto_264598 ) ) ( not ( = ?auto_264596 ?auto_264597 ) ) ( not ( = ?auto_264596 ?auto_264598 ) ) ( not ( = ?auto_264597 ?auto_264598 ) ) ( CLEAR ?auto_264595 ) ( ON ?auto_264596 ?auto_264597 ) ( CLEAR ?auto_264596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264594 ?auto_264595 ?auto_264596 )
      ( MAKE-4PILE ?auto_264594 ?auto_264595 ?auto_264596 ?auto_264597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264603 - BLOCK
      ?auto_264604 - BLOCK
      ?auto_264605 - BLOCK
      ?auto_264606 - BLOCK
    )
    :vars
    (
      ?auto_264607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264606 ?auto_264607 ) ( ON-TABLE ?auto_264603 ) ( ON ?auto_264604 ?auto_264603 ) ( not ( = ?auto_264603 ?auto_264604 ) ) ( not ( = ?auto_264603 ?auto_264605 ) ) ( not ( = ?auto_264603 ?auto_264606 ) ) ( not ( = ?auto_264603 ?auto_264607 ) ) ( not ( = ?auto_264604 ?auto_264605 ) ) ( not ( = ?auto_264604 ?auto_264606 ) ) ( not ( = ?auto_264604 ?auto_264607 ) ) ( not ( = ?auto_264605 ?auto_264606 ) ) ( not ( = ?auto_264605 ?auto_264607 ) ) ( not ( = ?auto_264606 ?auto_264607 ) ) ( CLEAR ?auto_264604 ) ( ON ?auto_264605 ?auto_264606 ) ( CLEAR ?auto_264605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264603 ?auto_264604 ?auto_264605 )
      ( MAKE-4PILE ?auto_264603 ?auto_264604 ?auto_264605 ?auto_264606 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264612 - BLOCK
      ?auto_264613 - BLOCK
      ?auto_264614 - BLOCK
      ?auto_264615 - BLOCK
    )
    :vars
    (
      ?auto_264616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264615 ?auto_264616 ) ( ON-TABLE ?auto_264612 ) ( not ( = ?auto_264612 ?auto_264613 ) ) ( not ( = ?auto_264612 ?auto_264614 ) ) ( not ( = ?auto_264612 ?auto_264615 ) ) ( not ( = ?auto_264612 ?auto_264616 ) ) ( not ( = ?auto_264613 ?auto_264614 ) ) ( not ( = ?auto_264613 ?auto_264615 ) ) ( not ( = ?auto_264613 ?auto_264616 ) ) ( not ( = ?auto_264614 ?auto_264615 ) ) ( not ( = ?auto_264614 ?auto_264616 ) ) ( not ( = ?auto_264615 ?auto_264616 ) ) ( ON ?auto_264614 ?auto_264615 ) ( CLEAR ?auto_264612 ) ( ON ?auto_264613 ?auto_264614 ) ( CLEAR ?auto_264613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264612 ?auto_264613 )
      ( MAKE-4PILE ?auto_264612 ?auto_264613 ?auto_264614 ?auto_264615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264621 - BLOCK
      ?auto_264622 - BLOCK
      ?auto_264623 - BLOCK
      ?auto_264624 - BLOCK
    )
    :vars
    (
      ?auto_264625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264624 ?auto_264625 ) ( ON-TABLE ?auto_264621 ) ( not ( = ?auto_264621 ?auto_264622 ) ) ( not ( = ?auto_264621 ?auto_264623 ) ) ( not ( = ?auto_264621 ?auto_264624 ) ) ( not ( = ?auto_264621 ?auto_264625 ) ) ( not ( = ?auto_264622 ?auto_264623 ) ) ( not ( = ?auto_264622 ?auto_264624 ) ) ( not ( = ?auto_264622 ?auto_264625 ) ) ( not ( = ?auto_264623 ?auto_264624 ) ) ( not ( = ?auto_264623 ?auto_264625 ) ) ( not ( = ?auto_264624 ?auto_264625 ) ) ( ON ?auto_264623 ?auto_264624 ) ( CLEAR ?auto_264621 ) ( ON ?auto_264622 ?auto_264623 ) ( CLEAR ?auto_264622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264621 ?auto_264622 )
      ( MAKE-4PILE ?auto_264621 ?auto_264622 ?auto_264623 ?auto_264624 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264630 - BLOCK
      ?auto_264631 - BLOCK
      ?auto_264632 - BLOCK
      ?auto_264633 - BLOCK
    )
    :vars
    (
      ?auto_264634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264633 ?auto_264634 ) ( not ( = ?auto_264630 ?auto_264631 ) ) ( not ( = ?auto_264630 ?auto_264632 ) ) ( not ( = ?auto_264630 ?auto_264633 ) ) ( not ( = ?auto_264630 ?auto_264634 ) ) ( not ( = ?auto_264631 ?auto_264632 ) ) ( not ( = ?auto_264631 ?auto_264633 ) ) ( not ( = ?auto_264631 ?auto_264634 ) ) ( not ( = ?auto_264632 ?auto_264633 ) ) ( not ( = ?auto_264632 ?auto_264634 ) ) ( not ( = ?auto_264633 ?auto_264634 ) ) ( ON ?auto_264632 ?auto_264633 ) ( ON ?auto_264631 ?auto_264632 ) ( ON ?auto_264630 ?auto_264631 ) ( CLEAR ?auto_264630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264630 )
      ( MAKE-4PILE ?auto_264630 ?auto_264631 ?auto_264632 ?auto_264633 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_264639 - BLOCK
      ?auto_264640 - BLOCK
      ?auto_264641 - BLOCK
      ?auto_264642 - BLOCK
    )
    :vars
    (
      ?auto_264643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264642 ?auto_264643 ) ( not ( = ?auto_264639 ?auto_264640 ) ) ( not ( = ?auto_264639 ?auto_264641 ) ) ( not ( = ?auto_264639 ?auto_264642 ) ) ( not ( = ?auto_264639 ?auto_264643 ) ) ( not ( = ?auto_264640 ?auto_264641 ) ) ( not ( = ?auto_264640 ?auto_264642 ) ) ( not ( = ?auto_264640 ?auto_264643 ) ) ( not ( = ?auto_264641 ?auto_264642 ) ) ( not ( = ?auto_264641 ?auto_264643 ) ) ( not ( = ?auto_264642 ?auto_264643 ) ) ( ON ?auto_264641 ?auto_264642 ) ( ON ?auto_264640 ?auto_264641 ) ( ON ?auto_264639 ?auto_264640 ) ( CLEAR ?auto_264639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264639 )
      ( MAKE-4PILE ?auto_264639 ?auto_264640 ?auto_264641 ?auto_264642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264649 - BLOCK
      ?auto_264650 - BLOCK
      ?auto_264651 - BLOCK
      ?auto_264652 - BLOCK
      ?auto_264653 - BLOCK
    )
    :vars
    (
      ?auto_264654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264652 ) ( ON ?auto_264653 ?auto_264654 ) ( CLEAR ?auto_264653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264649 ) ( ON ?auto_264650 ?auto_264649 ) ( ON ?auto_264651 ?auto_264650 ) ( ON ?auto_264652 ?auto_264651 ) ( not ( = ?auto_264649 ?auto_264650 ) ) ( not ( = ?auto_264649 ?auto_264651 ) ) ( not ( = ?auto_264649 ?auto_264652 ) ) ( not ( = ?auto_264649 ?auto_264653 ) ) ( not ( = ?auto_264649 ?auto_264654 ) ) ( not ( = ?auto_264650 ?auto_264651 ) ) ( not ( = ?auto_264650 ?auto_264652 ) ) ( not ( = ?auto_264650 ?auto_264653 ) ) ( not ( = ?auto_264650 ?auto_264654 ) ) ( not ( = ?auto_264651 ?auto_264652 ) ) ( not ( = ?auto_264651 ?auto_264653 ) ) ( not ( = ?auto_264651 ?auto_264654 ) ) ( not ( = ?auto_264652 ?auto_264653 ) ) ( not ( = ?auto_264652 ?auto_264654 ) ) ( not ( = ?auto_264653 ?auto_264654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264653 ?auto_264654 )
      ( !STACK ?auto_264653 ?auto_264652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264660 - BLOCK
      ?auto_264661 - BLOCK
      ?auto_264662 - BLOCK
      ?auto_264663 - BLOCK
      ?auto_264664 - BLOCK
    )
    :vars
    (
      ?auto_264665 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264663 ) ( ON ?auto_264664 ?auto_264665 ) ( CLEAR ?auto_264664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264660 ) ( ON ?auto_264661 ?auto_264660 ) ( ON ?auto_264662 ?auto_264661 ) ( ON ?auto_264663 ?auto_264662 ) ( not ( = ?auto_264660 ?auto_264661 ) ) ( not ( = ?auto_264660 ?auto_264662 ) ) ( not ( = ?auto_264660 ?auto_264663 ) ) ( not ( = ?auto_264660 ?auto_264664 ) ) ( not ( = ?auto_264660 ?auto_264665 ) ) ( not ( = ?auto_264661 ?auto_264662 ) ) ( not ( = ?auto_264661 ?auto_264663 ) ) ( not ( = ?auto_264661 ?auto_264664 ) ) ( not ( = ?auto_264661 ?auto_264665 ) ) ( not ( = ?auto_264662 ?auto_264663 ) ) ( not ( = ?auto_264662 ?auto_264664 ) ) ( not ( = ?auto_264662 ?auto_264665 ) ) ( not ( = ?auto_264663 ?auto_264664 ) ) ( not ( = ?auto_264663 ?auto_264665 ) ) ( not ( = ?auto_264664 ?auto_264665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264664 ?auto_264665 )
      ( !STACK ?auto_264664 ?auto_264663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264671 - BLOCK
      ?auto_264672 - BLOCK
      ?auto_264673 - BLOCK
      ?auto_264674 - BLOCK
      ?auto_264675 - BLOCK
    )
    :vars
    (
      ?auto_264676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264675 ?auto_264676 ) ( ON-TABLE ?auto_264671 ) ( ON ?auto_264672 ?auto_264671 ) ( ON ?auto_264673 ?auto_264672 ) ( not ( = ?auto_264671 ?auto_264672 ) ) ( not ( = ?auto_264671 ?auto_264673 ) ) ( not ( = ?auto_264671 ?auto_264674 ) ) ( not ( = ?auto_264671 ?auto_264675 ) ) ( not ( = ?auto_264671 ?auto_264676 ) ) ( not ( = ?auto_264672 ?auto_264673 ) ) ( not ( = ?auto_264672 ?auto_264674 ) ) ( not ( = ?auto_264672 ?auto_264675 ) ) ( not ( = ?auto_264672 ?auto_264676 ) ) ( not ( = ?auto_264673 ?auto_264674 ) ) ( not ( = ?auto_264673 ?auto_264675 ) ) ( not ( = ?auto_264673 ?auto_264676 ) ) ( not ( = ?auto_264674 ?auto_264675 ) ) ( not ( = ?auto_264674 ?auto_264676 ) ) ( not ( = ?auto_264675 ?auto_264676 ) ) ( CLEAR ?auto_264673 ) ( ON ?auto_264674 ?auto_264675 ) ( CLEAR ?auto_264674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264671 ?auto_264672 ?auto_264673 ?auto_264674 )
      ( MAKE-5PILE ?auto_264671 ?auto_264672 ?auto_264673 ?auto_264674 ?auto_264675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264682 - BLOCK
      ?auto_264683 - BLOCK
      ?auto_264684 - BLOCK
      ?auto_264685 - BLOCK
      ?auto_264686 - BLOCK
    )
    :vars
    (
      ?auto_264687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264686 ?auto_264687 ) ( ON-TABLE ?auto_264682 ) ( ON ?auto_264683 ?auto_264682 ) ( ON ?auto_264684 ?auto_264683 ) ( not ( = ?auto_264682 ?auto_264683 ) ) ( not ( = ?auto_264682 ?auto_264684 ) ) ( not ( = ?auto_264682 ?auto_264685 ) ) ( not ( = ?auto_264682 ?auto_264686 ) ) ( not ( = ?auto_264682 ?auto_264687 ) ) ( not ( = ?auto_264683 ?auto_264684 ) ) ( not ( = ?auto_264683 ?auto_264685 ) ) ( not ( = ?auto_264683 ?auto_264686 ) ) ( not ( = ?auto_264683 ?auto_264687 ) ) ( not ( = ?auto_264684 ?auto_264685 ) ) ( not ( = ?auto_264684 ?auto_264686 ) ) ( not ( = ?auto_264684 ?auto_264687 ) ) ( not ( = ?auto_264685 ?auto_264686 ) ) ( not ( = ?auto_264685 ?auto_264687 ) ) ( not ( = ?auto_264686 ?auto_264687 ) ) ( CLEAR ?auto_264684 ) ( ON ?auto_264685 ?auto_264686 ) ( CLEAR ?auto_264685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264682 ?auto_264683 ?auto_264684 ?auto_264685 )
      ( MAKE-5PILE ?auto_264682 ?auto_264683 ?auto_264684 ?auto_264685 ?auto_264686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264693 - BLOCK
      ?auto_264694 - BLOCK
      ?auto_264695 - BLOCK
      ?auto_264696 - BLOCK
      ?auto_264697 - BLOCK
    )
    :vars
    (
      ?auto_264698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264697 ?auto_264698 ) ( ON-TABLE ?auto_264693 ) ( ON ?auto_264694 ?auto_264693 ) ( not ( = ?auto_264693 ?auto_264694 ) ) ( not ( = ?auto_264693 ?auto_264695 ) ) ( not ( = ?auto_264693 ?auto_264696 ) ) ( not ( = ?auto_264693 ?auto_264697 ) ) ( not ( = ?auto_264693 ?auto_264698 ) ) ( not ( = ?auto_264694 ?auto_264695 ) ) ( not ( = ?auto_264694 ?auto_264696 ) ) ( not ( = ?auto_264694 ?auto_264697 ) ) ( not ( = ?auto_264694 ?auto_264698 ) ) ( not ( = ?auto_264695 ?auto_264696 ) ) ( not ( = ?auto_264695 ?auto_264697 ) ) ( not ( = ?auto_264695 ?auto_264698 ) ) ( not ( = ?auto_264696 ?auto_264697 ) ) ( not ( = ?auto_264696 ?auto_264698 ) ) ( not ( = ?auto_264697 ?auto_264698 ) ) ( ON ?auto_264696 ?auto_264697 ) ( CLEAR ?auto_264694 ) ( ON ?auto_264695 ?auto_264696 ) ( CLEAR ?auto_264695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264693 ?auto_264694 ?auto_264695 )
      ( MAKE-5PILE ?auto_264693 ?auto_264694 ?auto_264695 ?auto_264696 ?auto_264697 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264704 - BLOCK
      ?auto_264705 - BLOCK
      ?auto_264706 - BLOCK
      ?auto_264707 - BLOCK
      ?auto_264708 - BLOCK
    )
    :vars
    (
      ?auto_264709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264708 ?auto_264709 ) ( ON-TABLE ?auto_264704 ) ( ON ?auto_264705 ?auto_264704 ) ( not ( = ?auto_264704 ?auto_264705 ) ) ( not ( = ?auto_264704 ?auto_264706 ) ) ( not ( = ?auto_264704 ?auto_264707 ) ) ( not ( = ?auto_264704 ?auto_264708 ) ) ( not ( = ?auto_264704 ?auto_264709 ) ) ( not ( = ?auto_264705 ?auto_264706 ) ) ( not ( = ?auto_264705 ?auto_264707 ) ) ( not ( = ?auto_264705 ?auto_264708 ) ) ( not ( = ?auto_264705 ?auto_264709 ) ) ( not ( = ?auto_264706 ?auto_264707 ) ) ( not ( = ?auto_264706 ?auto_264708 ) ) ( not ( = ?auto_264706 ?auto_264709 ) ) ( not ( = ?auto_264707 ?auto_264708 ) ) ( not ( = ?auto_264707 ?auto_264709 ) ) ( not ( = ?auto_264708 ?auto_264709 ) ) ( ON ?auto_264707 ?auto_264708 ) ( CLEAR ?auto_264705 ) ( ON ?auto_264706 ?auto_264707 ) ( CLEAR ?auto_264706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264704 ?auto_264705 ?auto_264706 )
      ( MAKE-5PILE ?auto_264704 ?auto_264705 ?auto_264706 ?auto_264707 ?auto_264708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264715 - BLOCK
      ?auto_264716 - BLOCK
      ?auto_264717 - BLOCK
      ?auto_264718 - BLOCK
      ?auto_264719 - BLOCK
    )
    :vars
    (
      ?auto_264720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264719 ?auto_264720 ) ( ON-TABLE ?auto_264715 ) ( not ( = ?auto_264715 ?auto_264716 ) ) ( not ( = ?auto_264715 ?auto_264717 ) ) ( not ( = ?auto_264715 ?auto_264718 ) ) ( not ( = ?auto_264715 ?auto_264719 ) ) ( not ( = ?auto_264715 ?auto_264720 ) ) ( not ( = ?auto_264716 ?auto_264717 ) ) ( not ( = ?auto_264716 ?auto_264718 ) ) ( not ( = ?auto_264716 ?auto_264719 ) ) ( not ( = ?auto_264716 ?auto_264720 ) ) ( not ( = ?auto_264717 ?auto_264718 ) ) ( not ( = ?auto_264717 ?auto_264719 ) ) ( not ( = ?auto_264717 ?auto_264720 ) ) ( not ( = ?auto_264718 ?auto_264719 ) ) ( not ( = ?auto_264718 ?auto_264720 ) ) ( not ( = ?auto_264719 ?auto_264720 ) ) ( ON ?auto_264718 ?auto_264719 ) ( ON ?auto_264717 ?auto_264718 ) ( CLEAR ?auto_264715 ) ( ON ?auto_264716 ?auto_264717 ) ( CLEAR ?auto_264716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264715 ?auto_264716 )
      ( MAKE-5PILE ?auto_264715 ?auto_264716 ?auto_264717 ?auto_264718 ?auto_264719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264726 - BLOCK
      ?auto_264727 - BLOCK
      ?auto_264728 - BLOCK
      ?auto_264729 - BLOCK
      ?auto_264730 - BLOCK
    )
    :vars
    (
      ?auto_264731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264730 ?auto_264731 ) ( ON-TABLE ?auto_264726 ) ( not ( = ?auto_264726 ?auto_264727 ) ) ( not ( = ?auto_264726 ?auto_264728 ) ) ( not ( = ?auto_264726 ?auto_264729 ) ) ( not ( = ?auto_264726 ?auto_264730 ) ) ( not ( = ?auto_264726 ?auto_264731 ) ) ( not ( = ?auto_264727 ?auto_264728 ) ) ( not ( = ?auto_264727 ?auto_264729 ) ) ( not ( = ?auto_264727 ?auto_264730 ) ) ( not ( = ?auto_264727 ?auto_264731 ) ) ( not ( = ?auto_264728 ?auto_264729 ) ) ( not ( = ?auto_264728 ?auto_264730 ) ) ( not ( = ?auto_264728 ?auto_264731 ) ) ( not ( = ?auto_264729 ?auto_264730 ) ) ( not ( = ?auto_264729 ?auto_264731 ) ) ( not ( = ?auto_264730 ?auto_264731 ) ) ( ON ?auto_264729 ?auto_264730 ) ( ON ?auto_264728 ?auto_264729 ) ( CLEAR ?auto_264726 ) ( ON ?auto_264727 ?auto_264728 ) ( CLEAR ?auto_264727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264726 ?auto_264727 )
      ( MAKE-5PILE ?auto_264726 ?auto_264727 ?auto_264728 ?auto_264729 ?auto_264730 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264737 - BLOCK
      ?auto_264738 - BLOCK
      ?auto_264739 - BLOCK
      ?auto_264740 - BLOCK
      ?auto_264741 - BLOCK
    )
    :vars
    (
      ?auto_264742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264741 ?auto_264742 ) ( not ( = ?auto_264737 ?auto_264738 ) ) ( not ( = ?auto_264737 ?auto_264739 ) ) ( not ( = ?auto_264737 ?auto_264740 ) ) ( not ( = ?auto_264737 ?auto_264741 ) ) ( not ( = ?auto_264737 ?auto_264742 ) ) ( not ( = ?auto_264738 ?auto_264739 ) ) ( not ( = ?auto_264738 ?auto_264740 ) ) ( not ( = ?auto_264738 ?auto_264741 ) ) ( not ( = ?auto_264738 ?auto_264742 ) ) ( not ( = ?auto_264739 ?auto_264740 ) ) ( not ( = ?auto_264739 ?auto_264741 ) ) ( not ( = ?auto_264739 ?auto_264742 ) ) ( not ( = ?auto_264740 ?auto_264741 ) ) ( not ( = ?auto_264740 ?auto_264742 ) ) ( not ( = ?auto_264741 ?auto_264742 ) ) ( ON ?auto_264740 ?auto_264741 ) ( ON ?auto_264739 ?auto_264740 ) ( ON ?auto_264738 ?auto_264739 ) ( ON ?auto_264737 ?auto_264738 ) ( CLEAR ?auto_264737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264737 )
      ( MAKE-5PILE ?auto_264737 ?auto_264738 ?auto_264739 ?auto_264740 ?auto_264741 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_264748 - BLOCK
      ?auto_264749 - BLOCK
      ?auto_264750 - BLOCK
      ?auto_264751 - BLOCK
      ?auto_264752 - BLOCK
    )
    :vars
    (
      ?auto_264753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264752 ?auto_264753 ) ( not ( = ?auto_264748 ?auto_264749 ) ) ( not ( = ?auto_264748 ?auto_264750 ) ) ( not ( = ?auto_264748 ?auto_264751 ) ) ( not ( = ?auto_264748 ?auto_264752 ) ) ( not ( = ?auto_264748 ?auto_264753 ) ) ( not ( = ?auto_264749 ?auto_264750 ) ) ( not ( = ?auto_264749 ?auto_264751 ) ) ( not ( = ?auto_264749 ?auto_264752 ) ) ( not ( = ?auto_264749 ?auto_264753 ) ) ( not ( = ?auto_264750 ?auto_264751 ) ) ( not ( = ?auto_264750 ?auto_264752 ) ) ( not ( = ?auto_264750 ?auto_264753 ) ) ( not ( = ?auto_264751 ?auto_264752 ) ) ( not ( = ?auto_264751 ?auto_264753 ) ) ( not ( = ?auto_264752 ?auto_264753 ) ) ( ON ?auto_264751 ?auto_264752 ) ( ON ?auto_264750 ?auto_264751 ) ( ON ?auto_264749 ?auto_264750 ) ( ON ?auto_264748 ?auto_264749 ) ( CLEAR ?auto_264748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264748 )
      ( MAKE-5PILE ?auto_264748 ?auto_264749 ?auto_264750 ?auto_264751 ?auto_264752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264760 - BLOCK
      ?auto_264761 - BLOCK
      ?auto_264762 - BLOCK
      ?auto_264763 - BLOCK
      ?auto_264764 - BLOCK
      ?auto_264765 - BLOCK
    )
    :vars
    (
      ?auto_264766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264764 ) ( ON ?auto_264765 ?auto_264766 ) ( CLEAR ?auto_264765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264760 ) ( ON ?auto_264761 ?auto_264760 ) ( ON ?auto_264762 ?auto_264761 ) ( ON ?auto_264763 ?auto_264762 ) ( ON ?auto_264764 ?auto_264763 ) ( not ( = ?auto_264760 ?auto_264761 ) ) ( not ( = ?auto_264760 ?auto_264762 ) ) ( not ( = ?auto_264760 ?auto_264763 ) ) ( not ( = ?auto_264760 ?auto_264764 ) ) ( not ( = ?auto_264760 ?auto_264765 ) ) ( not ( = ?auto_264760 ?auto_264766 ) ) ( not ( = ?auto_264761 ?auto_264762 ) ) ( not ( = ?auto_264761 ?auto_264763 ) ) ( not ( = ?auto_264761 ?auto_264764 ) ) ( not ( = ?auto_264761 ?auto_264765 ) ) ( not ( = ?auto_264761 ?auto_264766 ) ) ( not ( = ?auto_264762 ?auto_264763 ) ) ( not ( = ?auto_264762 ?auto_264764 ) ) ( not ( = ?auto_264762 ?auto_264765 ) ) ( not ( = ?auto_264762 ?auto_264766 ) ) ( not ( = ?auto_264763 ?auto_264764 ) ) ( not ( = ?auto_264763 ?auto_264765 ) ) ( not ( = ?auto_264763 ?auto_264766 ) ) ( not ( = ?auto_264764 ?auto_264765 ) ) ( not ( = ?auto_264764 ?auto_264766 ) ) ( not ( = ?auto_264765 ?auto_264766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264765 ?auto_264766 )
      ( !STACK ?auto_264765 ?auto_264764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264773 - BLOCK
      ?auto_264774 - BLOCK
      ?auto_264775 - BLOCK
      ?auto_264776 - BLOCK
      ?auto_264777 - BLOCK
      ?auto_264778 - BLOCK
    )
    :vars
    (
      ?auto_264779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264777 ) ( ON ?auto_264778 ?auto_264779 ) ( CLEAR ?auto_264778 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264773 ) ( ON ?auto_264774 ?auto_264773 ) ( ON ?auto_264775 ?auto_264774 ) ( ON ?auto_264776 ?auto_264775 ) ( ON ?auto_264777 ?auto_264776 ) ( not ( = ?auto_264773 ?auto_264774 ) ) ( not ( = ?auto_264773 ?auto_264775 ) ) ( not ( = ?auto_264773 ?auto_264776 ) ) ( not ( = ?auto_264773 ?auto_264777 ) ) ( not ( = ?auto_264773 ?auto_264778 ) ) ( not ( = ?auto_264773 ?auto_264779 ) ) ( not ( = ?auto_264774 ?auto_264775 ) ) ( not ( = ?auto_264774 ?auto_264776 ) ) ( not ( = ?auto_264774 ?auto_264777 ) ) ( not ( = ?auto_264774 ?auto_264778 ) ) ( not ( = ?auto_264774 ?auto_264779 ) ) ( not ( = ?auto_264775 ?auto_264776 ) ) ( not ( = ?auto_264775 ?auto_264777 ) ) ( not ( = ?auto_264775 ?auto_264778 ) ) ( not ( = ?auto_264775 ?auto_264779 ) ) ( not ( = ?auto_264776 ?auto_264777 ) ) ( not ( = ?auto_264776 ?auto_264778 ) ) ( not ( = ?auto_264776 ?auto_264779 ) ) ( not ( = ?auto_264777 ?auto_264778 ) ) ( not ( = ?auto_264777 ?auto_264779 ) ) ( not ( = ?auto_264778 ?auto_264779 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264778 ?auto_264779 )
      ( !STACK ?auto_264778 ?auto_264777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264786 - BLOCK
      ?auto_264787 - BLOCK
      ?auto_264788 - BLOCK
      ?auto_264789 - BLOCK
      ?auto_264790 - BLOCK
      ?auto_264791 - BLOCK
    )
    :vars
    (
      ?auto_264792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264791 ?auto_264792 ) ( ON-TABLE ?auto_264786 ) ( ON ?auto_264787 ?auto_264786 ) ( ON ?auto_264788 ?auto_264787 ) ( ON ?auto_264789 ?auto_264788 ) ( not ( = ?auto_264786 ?auto_264787 ) ) ( not ( = ?auto_264786 ?auto_264788 ) ) ( not ( = ?auto_264786 ?auto_264789 ) ) ( not ( = ?auto_264786 ?auto_264790 ) ) ( not ( = ?auto_264786 ?auto_264791 ) ) ( not ( = ?auto_264786 ?auto_264792 ) ) ( not ( = ?auto_264787 ?auto_264788 ) ) ( not ( = ?auto_264787 ?auto_264789 ) ) ( not ( = ?auto_264787 ?auto_264790 ) ) ( not ( = ?auto_264787 ?auto_264791 ) ) ( not ( = ?auto_264787 ?auto_264792 ) ) ( not ( = ?auto_264788 ?auto_264789 ) ) ( not ( = ?auto_264788 ?auto_264790 ) ) ( not ( = ?auto_264788 ?auto_264791 ) ) ( not ( = ?auto_264788 ?auto_264792 ) ) ( not ( = ?auto_264789 ?auto_264790 ) ) ( not ( = ?auto_264789 ?auto_264791 ) ) ( not ( = ?auto_264789 ?auto_264792 ) ) ( not ( = ?auto_264790 ?auto_264791 ) ) ( not ( = ?auto_264790 ?auto_264792 ) ) ( not ( = ?auto_264791 ?auto_264792 ) ) ( CLEAR ?auto_264789 ) ( ON ?auto_264790 ?auto_264791 ) ( CLEAR ?auto_264790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264786 ?auto_264787 ?auto_264788 ?auto_264789 ?auto_264790 )
      ( MAKE-6PILE ?auto_264786 ?auto_264787 ?auto_264788 ?auto_264789 ?auto_264790 ?auto_264791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264799 - BLOCK
      ?auto_264800 - BLOCK
      ?auto_264801 - BLOCK
      ?auto_264802 - BLOCK
      ?auto_264803 - BLOCK
      ?auto_264804 - BLOCK
    )
    :vars
    (
      ?auto_264805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264804 ?auto_264805 ) ( ON-TABLE ?auto_264799 ) ( ON ?auto_264800 ?auto_264799 ) ( ON ?auto_264801 ?auto_264800 ) ( ON ?auto_264802 ?auto_264801 ) ( not ( = ?auto_264799 ?auto_264800 ) ) ( not ( = ?auto_264799 ?auto_264801 ) ) ( not ( = ?auto_264799 ?auto_264802 ) ) ( not ( = ?auto_264799 ?auto_264803 ) ) ( not ( = ?auto_264799 ?auto_264804 ) ) ( not ( = ?auto_264799 ?auto_264805 ) ) ( not ( = ?auto_264800 ?auto_264801 ) ) ( not ( = ?auto_264800 ?auto_264802 ) ) ( not ( = ?auto_264800 ?auto_264803 ) ) ( not ( = ?auto_264800 ?auto_264804 ) ) ( not ( = ?auto_264800 ?auto_264805 ) ) ( not ( = ?auto_264801 ?auto_264802 ) ) ( not ( = ?auto_264801 ?auto_264803 ) ) ( not ( = ?auto_264801 ?auto_264804 ) ) ( not ( = ?auto_264801 ?auto_264805 ) ) ( not ( = ?auto_264802 ?auto_264803 ) ) ( not ( = ?auto_264802 ?auto_264804 ) ) ( not ( = ?auto_264802 ?auto_264805 ) ) ( not ( = ?auto_264803 ?auto_264804 ) ) ( not ( = ?auto_264803 ?auto_264805 ) ) ( not ( = ?auto_264804 ?auto_264805 ) ) ( CLEAR ?auto_264802 ) ( ON ?auto_264803 ?auto_264804 ) ( CLEAR ?auto_264803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264799 ?auto_264800 ?auto_264801 ?auto_264802 ?auto_264803 )
      ( MAKE-6PILE ?auto_264799 ?auto_264800 ?auto_264801 ?auto_264802 ?auto_264803 ?auto_264804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264812 - BLOCK
      ?auto_264813 - BLOCK
      ?auto_264814 - BLOCK
      ?auto_264815 - BLOCK
      ?auto_264816 - BLOCK
      ?auto_264817 - BLOCK
    )
    :vars
    (
      ?auto_264818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264817 ?auto_264818 ) ( ON-TABLE ?auto_264812 ) ( ON ?auto_264813 ?auto_264812 ) ( ON ?auto_264814 ?auto_264813 ) ( not ( = ?auto_264812 ?auto_264813 ) ) ( not ( = ?auto_264812 ?auto_264814 ) ) ( not ( = ?auto_264812 ?auto_264815 ) ) ( not ( = ?auto_264812 ?auto_264816 ) ) ( not ( = ?auto_264812 ?auto_264817 ) ) ( not ( = ?auto_264812 ?auto_264818 ) ) ( not ( = ?auto_264813 ?auto_264814 ) ) ( not ( = ?auto_264813 ?auto_264815 ) ) ( not ( = ?auto_264813 ?auto_264816 ) ) ( not ( = ?auto_264813 ?auto_264817 ) ) ( not ( = ?auto_264813 ?auto_264818 ) ) ( not ( = ?auto_264814 ?auto_264815 ) ) ( not ( = ?auto_264814 ?auto_264816 ) ) ( not ( = ?auto_264814 ?auto_264817 ) ) ( not ( = ?auto_264814 ?auto_264818 ) ) ( not ( = ?auto_264815 ?auto_264816 ) ) ( not ( = ?auto_264815 ?auto_264817 ) ) ( not ( = ?auto_264815 ?auto_264818 ) ) ( not ( = ?auto_264816 ?auto_264817 ) ) ( not ( = ?auto_264816 ?auto_264818 ) ) ( not ( = ?auto_264817 ?auto_264818 ) ) ( ON ?auto_264816 ?auto_264817 ) ( CLEAR ?auto_264814 ) ( ON ?auto_264815 ?auto_264816 ) ( CLEAR ?auto_264815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264812 ?auto_264813 ?auto_264814 ?auto_264815 )
      ( MAKE-6PILE ?auto_264812 ?auto_264813 ?auto_264814 ?auto_264815 ?auto_264816 ?auto_264817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264825 - BLOCK
      ?auto_264826 - BLOCK
      ?auto_264827 - BLOCK
      ?auto_264828 - BLOCK
      ?auto_264829 - BLOCK
      ?auto_264830 - BLOCK
    )
    :vars
    (
      ?auto_264831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264830 ?auto_264831 ) ( ON-TABLE ?auto_264825 ) ( ON ?auto_264826 ?auto_264825 ) ( ON ?auto_264827 ?auto_264826 ) ( not ( = ?auto_264825 ?auto_264826 ) ) ( not ( = ?auto_264825 ?auto_264827 ) ) ( not ( = ?auto_264825 ?auto_264828 ) ) ( not ( = ?auto_264825 ?auto_264829 ) ) ( not ( = ?auto_264825 ?auto_264830 ) ) ( not ( = ?auto_264825 ?auto_264831 ) ) ( not ( = ?auto_264826 ?auto_264827 ) ) ( not ( = ?auto_264826 ?auto_264828 ) ) ( not ( = ?auto_264826 ?auto_264829 ) ) ( not ( = ?auto_264826 ?auto_264830 ) ) ( not ( = ?auto_264826 ?auto_264831 ) ) ( not ( = ?auto_264827 ?auto_264828 ) ) ( not ( = ?auto_264827 ?auto_264829 ) ) ( not ( = ?auto_264827 ?auto_264830 ) ) ( not ( = ?auto_264827 ?auto_264831 ) ) ( not ( = ?auto_264828 ?auto_264829 ) ) ( not ( = ?auto_264828 ?auto_264830 ) ) ( not ( = ?auto_264828 ?auto_264831 ) ) ( not ( = ?auto_264829 ?auto_264830 ) ) ( not ( = ?auto_264829 ?auto_264831 ) ) ( not ( = ?auto_264830 ?auto_264831 ) ) ( ON ?auto_264829 ?auto_264830 ) ( CLEAR ?auto_264827 ) ( ON ?auto_264828 ?auto_264829 ) ( CLEAR ?auto_264828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_264825 ?auto_264826 ?auto_264827 ?auto_264828 )
      ( MAKE-6PILE ?auto_264825 ?auto_264826 ?auto_264827 ?auto_264828 ?auto_264829 ?auto_264830 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264838 - BLOCK
      ?auto_264839 - BLOCK
      ?auto_264840 - BLOCK
      ?auto_264841 - BLOCK
      ?auto_264842 - BLOCK
      ?auto_264843 - BLOCK
    )
    :vars
    (
      ?auto_264844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264843 ?auto_264844 ) ( ON-TABLE ?auto_264838 ) ( ON ?auto_264839 ?auto_264838 ) ( not ( = ?auto_264838 ?auto_264839 ) ) ( not ( = ?auto_264838 ?auto_264840 ) ) ( not ( = ?auto_264838 ?auto_264841 ) ) ( not ( = ?auto_264838 ?auto_264842 ) ) ( not ( = ?auto_264838 ?auto_264843 ) ) ( not ( = ?auto_264838 ?auto_264844 ) ) ( not ( = ?auto_264839 ?auto_264840 ) ) ( not ( = ?auto_264839 ?auto_264841 ) ) ( not ( = ?auto_264839 ?auto_264842 ) ) ( not ( = ?auto_264839 ?auto_264843 ) ) ( not ( = ?auto_264839 ?auto_264844 ) ) ( not ( = ?auto_264840 ?auto_264841 ) ) ( not ( = ?auto_264840 ?auto_264842 ) ) ( not ( = ?auto_264840 ?auto_264843 ) ) ( not ( = ?auto_264840 ?auto_264844 ) ) ( not ( = ?auto_264841 ?auto_264842 ) ) ( not ( = ?auto_264841 ?auto_264843 ) ) ( not ( = ?auto_264841 ?auto_264844 ) ) ( not ( = ?auto_264842 ?auto_264843 ) ) ( not ( = ?auto_264842 ?auto_264844 ) ) ( not ( = ?auto_264843 ?auto_264844 ) ) ( ON ?auto_264842 ?auto_264843 ) ( ON ?auto_264841 ?auto_264842 ) ( CLEAR ?auto_264839 ) ( ON ?auto_264840 ?auto_264841 ) ( CLEAR ?auto_264840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264838 ?auto_264839 ?auto_264840 )
      ( MAKE-6PILE ?auto_264838 ?auto_264839 ?auto_264840 ?auto_264841 ?auto_264842 ?auto_264843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264851 - BLOCK
      ?auto_264852 - BLOCK
      ?auto_264853 - BLOCK
      ?auto_264854 - BLOCK
      ?auto_264855 - BLOCK
      ?auto_264856 - BLOCK
    )
    :vars
    (
      ?auto_264857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264856 ?auto_264857 ) ( ON-TABLE ?auto_264851 ) ( ON ?auto_264852 ?auto_264851 ) ( not ( = ?auto_264851 ?auto_264852 ) ) ( not ( = ?auto_264851 ?auto_264853 ) ) ( not ( = ?auto_264851 ?auto_264854 ) ) ( not ( = ?auto_264851 ?auto_264855 ) ) ( not ( = ?auto_264851 ?auto_264856 ) ) ( not ( = ?auto_264851 ?auto_264857 ) ) ( not ( = ?auto_264852 ?auto_264853 ) ) ( not ( = ?auto_264852 ?auto_264854 ) ) ( not ( = ?auto_264852 ?auto_264855 ) ) ( not ( = ?auto_264852 ?auto_264856 ) ) ( not ( = ?auto_264852 ?auto_264857 ) ) ( not ( = ?auto_264853 ?auto_264854 ) ) ( not ( = ?auto_264853 ?auto_264855 ) ) ( not ( = ?auto_264853 ?auto_264856 ) ) ( not ( = ?auto_264853 ?auto_264857 ) ) ( not ( = ?auto_264854 ?auto_264855 ) ) ( not ( = ?auto_264854 ?auto_264856 ) ) ( not ( = ?auto_264854 ?auto_264857 ) ) ( not ( = ?auto_264855 ?auto_264856 ) ) ( not ( = ?auto_264855 ?auto_264857 ) ) ( not ( = ?auto_264856 ?auto_264857 ) ) ( ON ?auto_264855 ?auto_264856 ) ( ON ?auto_264854 ?auto_264855 ) ( CLEAR ?auto_264852 ) ( ON ?auto_264853 ?auto_264854 ) ( CLEAR ?auto_264853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_264851 ?auto_264852 ?auto_264853 )
      ( MAKE-6PILE ?auto_264851 ?auto_264852 ?auto_264853 ?auto_264854 ?auto_264855 ?auto_264856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264864 - BLOCK
      ?auto_264865 - BLOCK
      ?auto_264866 - BLOCK
      ?auto_264867 - BLOCK
      ?auto_264868 - BLOCK
      ?auto_264869 - BLOCK
    )
    :vars
    (
      ?auto_264870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264869 ?auto_264870 ) ( ON-TABLE ?auto_264864 ) ( not ( = ?auto_264864 ?auto_264865 ) ) ( not ( = ?auto_264864 ?auto_264866 ) ) ( not ( = ?auto_264864 ?auto_264867 ) ) ( not ( = ?auto_264864 ?auto_264868 ) ) ( not ( = ?auto_264864 ?auto_264869 ) ) ( not ( = ?auto_264864 ?auto_264870 ) ) ( not ( = ?auto_264865 ?auto_264866 ) ) ( not ( = ?auto_264865 ?auto_264867 ) ) ( not ( = ?auto_264865 ?auto_264868 ) ) ( not ( = ?auto_264865 ?auto_264869 ) ) ( not ( = ?auto_264865 ?auto_264870 ) ) ( not ( = ?auto_264866 ?auto_264867 ) ) ( not ( = ?auto_264866 ?auto_264868 ) ) ( not ( = ?auto_264866 ?auto_264869 ) ) ( not ( = ?auto_264866 ?auto_264870 ) ) ( not ( = ?auto_264867 ?auto_264868 ) ) ( not ( = ?auto_264867 ?auto_264869 ) ) ( not ( = ?auto_264867 ?auto_264870 ) ) ( not ( = ?auto_264868 ?auto_264869 ) ) ( not ( = ?auto_264868 ?auto_264870 ) ) ( not ( = ?auto_264869 ?auto_264870 ) ) ( ON ?auto_264868 ?auto_264869 ) ( ON ?auto_264867 ?auto_264868 ) ( ON ?auto_264866 ?auto_264867 ) ( CLEAR ?auto_264864 ) ( ON ?auto_264865 ?auto_264866 ) ( CLEAR ?auto_264865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264864 ?auto_264865 )
      ( MAKE-6PILE ?auto_264864 ?auto_264865 ?auto_264866 ?auto_264867 ?auto_264868 ?auto_264869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264877 - BLOCK
      ?auto_264878 - BLOCK
      ?auto_264879 - BLOCK
      ?auto_264880 - BLOCK
      ?auto_264881 - BLOCK
      ?auto_264882 - BLOCK
    )
    :vars
    (
      ?auto_264883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264882 ?auto_264883 ) ( ON-TABLE ?auto_264877 ) ( not ( = ?auto_264877 ?auto_264878 ) ) ( not ( = ?auto_264877 ?auto_264879 ) ) ( not ( = ?auto_264877 ?auto_264880 ) ) ( not ( = ?auto_264877 ?auto_264881 ) ) ( not ( = ?auto_264877 ?auto_264882 ) ) ( not ( = ?auto_264877 ?auto_264883 ) ) ( not ( = ?auto_264878 ?auto_264879 ) ) ( not ( = ?auto_264878 ?auto_264880 ) ) ( not ( = ?auto_264878 ?auto_264881 ) ) ( not ( = ?auto_264878 ?auto_264882 ) ) ( not ( = ?auto_264878 ?auto_264883 ) ) ( not ( = ?auto_264879 ?auto_264880 ) ) ( not ( = ?auto_264879 ?auto_264881 ) ) ( not ( = ?auto_264879 ?auto_264882 ) ) ( not ( = ?auto_264879 ?auto_264883 ) ) ( not ( = ?auto_264880 ?auto_264881 ) ) ( not ( = ?auto_264880 ?auto_264882 ) ) ( not ( = ?auto_264880 ?auto_264883 ) ) ( not ( = ?auto_264881 ?auto_264882 ) ) ( not ( = ?auto_264881 ?auto_264883 ) ) ( not ( = ?auto_264882 ?auto_264883 ) ) ( ON ?auto_264881 ?auto_264882 ) ( ON ?auto_264880 ?auto_264881 ) ( ON ?auto_264879 ?auto_264880 ) ( CLEAR ?auto_264877 ) ( ON ?auto_264878 ?auto_264879 ) ( CLEAR ?auto_264878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_264877 ?auto_264878 )
      ( MAKE-6PILE ?auto_264877 ?auto_264878 ?auto_264879 ?auto_264880 ?auto_264881 ?auto_264882 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264890 - BLOCK
      ?auto_264891 - BLOCK
      ?auto_264892 - BLOCK
      ?auto_264893 - BLOCK
      ?auto_264894 - BLOCK
      ?auto_264895 - BLOCK
    )
    :vars
    (
      ?auto_264896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264895 ?auto_264896 ) ( not ( = ?auto_264890 ?auto_264891 ) ) ( not ( = ?auto_264890 ?auto_264892 ) ) ( not ( = ?auto_264890 ?auto_264893 ) ) ( not ( = ?auto_264890 ?auto_264894 ) ) ( not ( = ?auto_264890 ?auto_264895 ) ) ( not ( = ?auto_264890 ?auto_264896 ) ) ( not ( = ?auto_264891 ?auto_264892 ) ) ( not ( = ?auto_264891 ?auto_264893 ) ) ( not ( = ?auto_264891 ?auto_264894 ) ) ( not ( = ?auto_264891 ?auto_264895 ) ) ( not ( = ?auto_264891 ?auto_264896 ) ) ( not ( = ?auto_264892 ?auto_264893 ) ) ( not ( = ?auto_264892 ?auto_264894 ) ) ( not ( = ?auto_264892 ?auto_264895 ) ) ( not ( = ?auto_264892 ?auto_264896 ) ) ( not ( = ?auto_264893 ?auto_264894 ) ) ( not ( = ?auto_264893 ?auto_264895 ) ) ( not ( = ?auto_264893 ?auto_264896 ) ) ( not ( = ?auto_264894 ?auto_264895 ) ) ( not ( = ?auto_264894 ?auto_264896 ) ) ( not ( = ?auto_264895 ?auto_264896 ) ) ( ON ?auto_264894 ?auto_264895 ) ( ON ?auto_264893 ?auto_264894 ) ( ON ?auto_264892 ?auto_264893 ) ( ON ?auto_264891 ?auto_264892 ) ( ON ?auto_264890 ?auto_264891 ) ( CLEAR ?auto_264890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264890 )
      ( MAKE-6PILE ?auto_264890 ?auto_264891 ?auto_264892 ?auto_264893 ?auto_264894 ?auto_264895 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_264903 - BLOCK
      ?auto_264904 - BLOCK
      ?auto_264905 - BLOCK
      ?auto_264906 - BLOCK
      ?auto_264907 - BLOCK
      ?auto_264908 - BLOCK
    )
    :vars
    (
      ?auto_264909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264908 ?auto_264909 ) ( not ( = ?auto_264903 ?auto_264904 ) ) ( not ( = ?auto_264903 ?auto_264905 ) ) ( not ( = ?auto_264903 ?auto_264906 ) ) ( not ( = ?auto_264903 ?auto_264907 ) ) ( not ( = ?auto_264903 ?auto_264908 ) ) ( not ( = ?auto_264903 ?auto_264909 ) ) ( not ( = ?auto_264904 ?auto_264905 ) ) ( not ( = ?auto_264904 ?auto_264906 ) ) ( not ( = ?auto_264904 ?auto_264907 ) ) ( not ( = ?auto_264904 ?auto_264908 ) ) ( not ( = ?auto_264904 ?auto_264909 ) ) ( not ( = ?auto_264905 ?auto_264906 ) ) ( not ( = ?auto_264905 ?auto_264907 ) ) ( not ( = ?auto_264905 ?auto_264908 ) ) ( not ( = ?auto_264905 ?auto_264909 ) ) ( not ( = ?auto_264906 ?auto_264907 ) ) ( not ( = ?auto_264906 ?auto_264908 ) ) ( not ( = ?auto_264906 ?auto_264909 ) ) ( not ( = ?auto_264907 ?auto_264908 ) ) ( not ( = ?auto_264907 ?auto_264909 ) ) ( not ( = ?auto_264908 ?auto_264909 ) ) ( ON ?auto_264907 ?auto_264908 ) ( ON ?auto_264906 ?auto_264907 ) ( ON ?auto_264905 ?auto_264906 ) ( ON ?auto_264904 ?auto_264905 ) ( ON ?auto_264903 ?auto_264904 ) ( CLEAR ?auto_264903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_264903 )
      ( MAKE-6PILE ?auto_264903 ?auto_264904 ?auto_264905 ?auto_264906 ?auto_264907 ?auto_264908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264917 - BLOCK
      ?auto_264918 - BLOCK
      ?auto_264919 - BLOCK
      ?auto_264920 - BLOCK
      ?auto_264921 - BLOCK
      ?auto_264922 - BLOCK
      ?auto_264923 - BLOCK
    )
    :vars
    (
      ?auto_264924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264922 ) ( ON ?auto_264923 ?auto_264924 ) ( CLEAR ?auto_264923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264917 ) ( ON ?auto_264918 ?auto_264917 ) ( ON ?auto_264919 ?auto_264918 ) ( ON ?auto_264920 ?auto_264919 ) ( ON ?auto_264921 ?auto_264920 ) ( ON ?auto_264922 ?auto_264921 ) ( not ( = ?auto_264917 ?auto_264918 ) ) ( not ( = ?auto_264917 ?auto_264919 ) ) ( not ( = ?auto_264917 ?auto_264920 ) ) ( not ( = ?auto_264917 ?auto_264921 ) ) ( not ( = ?auto_264917 ?auto_264922 ) ) ( not ( = ?auto_264917 ?auto_264923 ) ) ( not ( = ?auto_264917 ?auto_264924 ) ) ( not ( = ?auto_264918 ?auto_264919 ) ) ( not ( = ?auto_264918 ?auto_264920 ) ) ( not ( = ?auto_264918 ?auto_264921 ) ) ( not ( = ?auto_264918 ?auto_264922 ) ) ( not ( = ?auto_264918 ?auto_264923 ) ) ( not ( = ?auto_264918 ?auto_264924 ) ) ( not ( = ?auto_264919 ?auto_264920 ) ) ( not ( = ?auto_264919 ?auto_264921 ) ) ( not ( = ?auto_264919 ?auto_264922 ) ) ( not ( = ?auto_264919 ?auto_264923 ) ) ( not ( = ?auto_264919 ?auto_264924 ) ) ( not ( = ?auto_264920 ?auto_264921 ) ) ( not ( = ?auto_264920 ?auto_264922 ) ) ( not ( = ?auto_264920 ?auto_264923 ) ) ( not ( = ?auto_264920 ?auto_264924 ) ) ( not ( = ?auto_264921 ?auto_264922 ) ) ( not ( = ?auto_264921 ?auto_264923 ) ) ( not ( = ?auto_264921 ?auto_264924 ) ) ( not ( = ?auto_264922 ?auto_264923 ) ) ( not ( = ?auto_264922 ?auto_264924 ) ) ( not ( = ?auto_264923 ?auto_264924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264923 ?auto_264924 )
      ( !STACK ?auto_264923 ?auto_264922 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264932 - BLOCK
      ?auto_264933 - BLOCK
      ?auto_264934 - BLOCK
      ?auto_264935 - BLOCK
      ?auto_264936 - BLOCK
      ?auto_264937 - BLOCK
      ?auto_264938 - BLOCK
    )
    :vars
    (
      ?auto_264939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_264937 ) ( ON ?auto_264938 ?auto_264939 ) ( CLEAR ?auto_264938 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_264932 ) ( ON ?auto_264933 ?auto_264932 ) ( ON ?auto_264934 ?auto_264933 ) ( ON ?auto_264935 ?auto_264934 ) ( ON ?auto_264936 ?auto_264935 ) ( ON ?auto_264937 ?auto_264936 ) ( not ( = ?auto_264932 ?auto_264933 ) ) ( not ( = ?auto_264932 ?auto_264934 ) ) ( not ( = ?auto_264932 ?auto_264935 ) ) ( not ( = ?auto_264932 ?auto_264936 ) ) ( not ( = ?auto_264932 ?auto_264937 ) ) ( not ( = ?auto_264932 ?auto_264938 ) ) ( not ( = ?auto_264932 ?auto_264939 ) ) ( not ( = ?auto_264933 ?auto_264934 ) ) ( not ( = ?auto_264933 ?auto_264935 ) ) ( not ( = ?auto_264933 ?auto_264936 ) ) ( not ( = ?auto_264933 ?auto_264937 ) ) ( not ( = ?auto_264933 ?auto_264938 ) ) ( not ( = ?auto_264933 ?auto_264939 ) ) ( not ( = ?auto_264934 ?auto_264935 ) ) ( not ( = ?auto_264934 ?auto_264936 ) ) ( not ( = ?auto_264934 ?auto_264937 ) ) ( not ( = ?auto_264934 ?auto_264938 ) ) ( not ( = ?auto_264934 ?auto_264939 ) ) ( not ( = ?auto_264935 ?auto_264936 ) ) ( not ( = ?auto_264935 ?auto_264937 ) ) ( not ( = ?auto_264935 ?auto_264938 ) ) ( not ( = ?auto_264935 ?auto_264939 ) ) ( not ( = ?auto_264936 ?auto_264937 ) ) ( not ( = ?auto_264936 ?auto_264938 ) ) ( not ( = ?auto_264936 ?auto_264939 ) ) ( not ( = ?auto_264937 ?auto_264938 ) ) ( not ( = ?auto_264937 ?auto_264939 ) ) ( not ( = ?auto_264938 ?auto_264939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_264938 ?auto_264939 )
      ( !STACK ?auto_264938 ?auto_264937 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264947 - BLOCK
      ?auto_264948 - BLOCK
      ?auto_264949 - BLOCK
      ?auto_264950 - BLOCK
      ?auto_264951 - BLOCK
      ?auto_264952 - BLOCK
      ?auto_264953 - BLOCK
    )
    :vars
    (
      ?auto_264954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264953 ?auto_264954 ) ( ON-TABLE ?auto_264947 ) ( ON ?auto_264948 ?auto_264947 ) ( ON ?auto_264949 ?auto_264948 ) ( ON ?auto_264950 ?auto_264949 ) ( ON ?auto_264951 ?auto_264950 ) ( not ( = ?auto_264947 ?auto_264948 ) ) ( not ( = ?auto_264947 ?auto_264949 ) ) ( not ( = ?auto_264947 ?auto_264950 ) ) ( not ( = ?auto_264947 ?auto_264951 ) ) ( not ( = ?auto_264947 ?auto_264952 ) ) ( not ( = ?auto_264947 ?auto_264953 ) ) ( not ( = ?auto_264947 ?auto_264954 ) ) ( not ( = ?auto_264948 ?auto_264949 ) ) ( not ( = ?auto_264948 ?auto_264950 ) ) ( not ( = ?auto_264948 ?auto_264951 ) ) ( not ( = ?auto_264948 ?auto_264952 ) ) ( not ( = ?auto_264948 ?auto_264953 ) ) ( not ( = ?auto_264948 ?auto_264954 ) ) ( not ( = ?auto_264949 ?auto_264950 ) ) ( not ( = ?auto_264949 ?auto_264951 ) ) ( not ( = ?auto_264949 ?auto_264952 ) ) ( not ( = ?auto_264949 ?auto_264953 ) ) ( not ( = ?auto_264949 ?auto_264954 ) ) ( not ( = ?auto_264950 ?auto_264951 ) ) ( not ( = ?auto_264950 ?auto_264952 ) ) ( not ( = ?auto_264950 ?auto_264953 ) ) ( not ( = ?auto_264950 ?auto_264954 ) ) ( not ( = ?auto_264951 ?auto_264952 ) ) ( not ( = ?auto_264951 ?auto_264953 ) ) ( not ( = ?auto_264951 ?auto_264954 ) ) ( not ( = ?auto_264952 ?auto_264953 ) ) ( not ( = ?auto_264952 ?auto_264954 ) ) ( not ( = ?auto_264953 ?auto_264954 ) ) ( CLEAR ?auto_264951 ) ( ON ?auto_264952 ?auto_264953 ) ( CLEAR ?auto_264952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_264947 ?auto_264948 ?auto_264949 ?auto_264950 ?auto_264951 ?auto_264952 )
      ( MAKE-7PILE ?auto_264947 ?auto_264948 ?auto_264949 ?auto_264950 ?auto_264951 ?auto_264952 ?auto_264953 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264962 - BLOCK
      ?auto_264963 - BLOCK
      ?auto_264964 - BLOCK
      ?auto_264965 - BLOCK
      ?auto_264966 - BLOCK
      ?auto_264967 - BLOCK
      ?auto_264968 - BLOCK
    )
    :vars
    (
      ?auto_264969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264968 ?auto_264969 ) ( ON-TABLE ?auto_264962 ) ( ON ?auto_264963 ?auto_264962 ) ( ON ?auto_264964 ?auto_264963 ) ( ON ?auto_264965 ?auto_264964 ) ( ON ?auto_264966 ?auto_264965 ) ( not ( = ?auto_264962 ?auto_264963 ) ) ( not ( = ?auto_264962 ?auto_264964 ) ) ( not ( = ?auto_264962 ?auto_264965 ) ) ( not ( = ?auto_264962 ?auto_264966 ) ) ( not ( = ?auto_264962 ?auto_264967 ) ) ( not ( = ?auto_264962 ?auto_264968 ) ) ( not ( = ?auto_264962 ?auto_264969 ) ) ( not ( = ?auto_264963 ?auto_264964 ) ) ( not ( = ?auto_264963 ?auto_264965 ) ) ( not ( = ?auto_264963 ?auto_264966 ) ) ( not ( = ?auto_264963 ?auto_264967 ) ) ( not ( = ?auto_264963 ?auto_264968 ) ) ( not ( = ?auto_264963 ?auto_264969 ) ) ( not ( = ?auto_264964 ?auto_264965 ) ) ( not ( = ?auto_264964 ?auto_264966 ) ) ( not ( = ?auto_264964 ?auto_264967 ) ) ( not ( = ?auto_264964 ?auto_264968 ) ) ( not ( = ?auto_264964 ?auto_264969 ) ) ( not ( = ?auto_264965 ?auto_264966 ) ) ( not ( = ?auto_264965 ?auto_264967 ) ) ( not ( = ?auto_264965 ?auto_264968 ) ) ( not ( = ?auto_264965 ?auto_264969 ) ) ( not ( = ?auto_264966 ?auto_264967 ) ) ( not ( = ?auto_264966 ?auto_264968 ) ) ( not ( = ?auto_264966 ?auto_264969 ) ) ( not ( = ?auto_264967 ?auto_264968 ) ) ( not ( = ?auto_264967 ?auto_264969 ) ) ( not ( = ?auto_264968 ?auto_264969 ) ) ( CLEAR ?auto_264966 ) ( ON ?auto_264967 ?auto_264968 ) ( CLEAR ?auto_264967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_264962 ?auto_264963 ?auto_264964 ?auto_264965 ?auto_264966 ?auto_264967 )
      ( MAKE-7PILE ?auto_264962 ?auto_264963 ?auto_264964 ?auto_264965 ?auto_264966 ?auto_264967 ?auto_264968 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264977 - BLOCK
      ?auto_264978 - BLOCK
      ?auto_264979 - BLOCK
      ?auto_264980 - BLOCK
      ?auto_264981 - BLOCK
      ?auto_264982 - BLOCK
      ?auto_264983 - BLOCK
    )
    :vars
    (
      ?auto_264984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264983 ?auto_264984 ) ( ON-TABLE ?auto_264977 ) ( ON ?auto_264978 ?auto_264977 ) ( ON ?auto_264979 ?auto_264978 ) ( ON ?auto_264980 ?auto_264979 ) ( not ( = ?auto_264977 ?auto_264978 ) ) ( not ( = ?auto_264977 ?auto_264979 ) ) ( not ( = ?auto_264977 ?auto_264980 ) ) ( not ( = ?auto_264977 ?auto_264981 ) ) ( not ( = ?auto_264977 ?auto_264982 ) ) ( not ( = ?auto_264977 ?auto_264983 ) ) ( not ( = ?auto_264977 ?auto_264984 ) ) ( not ( = ?auto_264978 ?auto_264979 ) ) ( not ( = ?auto_264978 ?auto_264980 ) ) ( not ( = ?auto_264978 ?auto_264981 ) ) ( not ( = ?auto_264978 ?auto_264982 ) ) ( not ( = ?auto_264978 ?auto_264983 ) ) ( not ( = ?auto_264978 ?auto_264984 ) ) ( not ( = ?auto_264979 ?auto_264980 ) ) ( not ( = ?auto_264979 ?auto_264981 ) ) ( not ( = ?auto_264979 ?auto_264982 ) ) ( not ( = ?auto_264979 ?auto_264983 ) ) ( not ( = ?auto_264979 ?auto_264984 ) ) ( not ( = ?auto_264980 ?auto_264981 ) ) ( not ( = ?auto_264980 ?auto_264982 ) ) ( not ( = ?auto_264980 ?auto_264983 ) ) ( not ( = ?auto_264980 ?auto_264984 ) ) ( not ( = ?auto_264981 ?auto_264982 ) ) ( not ( = ?auto_264981 ?auto_264983 ) ) ( not ( = ?auto_264981 ?auto_264984 ) ) ( not ( = ?auto_264982 ?auto_264983 ) ) ( not ( = ?auto_264982 ?auto_264984 ) ) ( not ( = ?auto_264983 ?auto_264984 ) ) ( ON ?auto_264982 ?auto_264983 ) ( CLEAR ?auto_264980 ) ( ON ?auto_264981 ?auto_264982 ) ( CLEAR ?auto_264981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264977 ?auto_264978 ?auto_264979 ?auto_264980 ?auto_264981 )
      ( MAKE-7PILE ?auto_264977 ?auto_264978 ?auto_264979 ?auto_264980 ?auto_264981 ?auto_264982 ?auto_264983 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_264992 - BLOCK
      ?auto_264993 - BLOCK
      ?auto_264994 - BLOCK
      ?auto_264995 - BLOCK
      ?auto_264996 - BLOCK
      ?auto_264997 - BLOCK
      ?auto_264998 - BLOCK
    )
    :vars
    (
      ?auto_264999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_264998 ?auto_264999 ) ( ON-TABLE ?auto_264992 ) ( ON ?auto_264993 ?auto_264992 ) ( ON ?auto_264994 ?auto_264993 ) ( ON ?auto_264995 ?auto_264994 ) ( not ( = ?auto_264992 ?auto_264993 ) ) ( not ( = ?auto_264992 ?auto_264994 ) ) ( not ( = ?auto_264992 ?auto_264995 ) ) ( not ( = ?auto_264992 ?auto_264996 ) ) ( not ( = ?auto_264992 ?auto_264997 ) ) ( not ( = ?auto_264992 ?auto_264998 ) ) ( not ( = ?auto_264992 ?auto_264999 ) ) ( not ( = ?auto_264993 ?auto_264994 ) ) ( not ( = ?auto_264993 ?auto_264995 ) ) ( not ( = ?auto_264993 ?auto_264996 ) ) ( not ( = ?auto_264993 ?auto_264997 ) ) ( not ( = ?auto_264993 ?auto_264998 ) ) ( not ( = ?auto_264993 ?auto_264999 ) ) ( not ( = ?auto_264994 ?auto_264995 ) ) ( not ( = ?auto_264994 ?auto_264996 ) ) ( not ( = ?auto_264994 ?auto_264997 ) ) ( not ( = ?auto_264994 ?auto_264998 ) ) ( not ( = ?auto_264994 ?auto_264999 ) ) ( not ( = ?auto_264995 ?auto_264996 ) ) ( not ( = ?auto_264995 ?auto_264997 ) ) ( not ( = ?auto_264995 ?auto_264998 ) ) ( not ( = ?auto_264995 ?auto_264999 ) ) ( not ( = ?auto_264996 ?auto_264997 ) ) ( not ( = ?auto_264996 ?auto_264998 ) ) ( not ( = ?auto_264996 ?auto_264999 ) ) ( not ( = ?auto_264997 ?auto_264998 ) ) ( not ( = ?auto_264997 ?auto_264999 ) ) ( not ( = ?auto_264998 ?auto_264999 ) ) ( ON ?auto_264997 ?auto_264998 ) ( CLEAR ?auto_264995 ) ( ON ?auto_264996 ?auto_264997 ) ( CLEAR ?auto_264996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_264992 ?auto_264993 ?auto_264994 ?auto_264995 ?auto_264996 )
      ( MAKE-7PILE ?auto_264992 ?auto_264993 ?auto_264994 ?auto_264995 ?auto_264996 ?auto_264997 ?auto_264998 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265007 - BLOCK
      ?auto_265008 - BLOCK
      ?auto_265009 - BLOCK
      ?auto_265010 - BLOCK
      ?auto_265011 - BLOCK
      ?auto_265012 - BLOCK
      ?auto_265013 - BLOCK
    )
    :vars
    (
      ?auto_265014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265013 ?auto_265014 ) ( ON-TABLE ?auto_265007 ) ( ON ?auto_265008 ?auto_265007 ) ( ON ?auto_265009 ?auto_265008 ) ( not ( = ?auto_265007 ?auto_265008 ) ) ( not ( = ?auto_265007 ?auto_265009 ) ) ( not ( = ?auto_265007 ?auto_265010 ) ) ( not ( = ?auto_265007 ?auto_265011 ) ) ( not ( = ?auto_265007 ?auto_265012 ) ) ( not ( = ?auto_265007 ?auto_265013 ) ) ( not ( = ?auto_265007 ?auto_265014 ) ) ( not ( = ?auto_265008 ?auto_265009 ) ) ( not ( = ?auto_265008 ?auto_265010 ) ) ( not ( = ?auto_265008 ?auto_265011 ) ) ( not ( = ?auto_265008 ?auto_265012 ) ) ( not ( = ?auto_265008 ?auto_265013 ) ) ( not ( = ?auto_265008 ?auto_265014 ) ) ( not ( = ?auto_265009 ?auto_265010 ) ) ( not ( = ?auto_265009 ?auto_265011 ) ) ( not ( = ?auto_265009 ?auto_265012 ) ) ( not ( = ?auto_265009 ?auto_265013 ) ) ( not ( = ?auto_265009 ?auto_265014 ) ) ( not ( = ?auto_265010 ?auto_265011 ) ) ( not ( = ?auto_265010 ?auto_265012 ) ) ( not ( = ?auto_265010 ?auto_265013 ) ) ( not ( = ?auto_265010 ?auto_265014 ) ) ( not ( = ?auto_265011 ?auto_265012 ) ) ( not ( = ?auto_265011 ?auto_265013 ) ) ( not ( = ?auto_265011 ?auto_265014 ) ) ( not ( = ?auto_265012 ?auto_265013 ) ) ( not ( = ?auto_265012 ?auto_265014 ) ) ( not ( = ?auto_265013 ?auto_265014 ) ) ( ON ?auto_265012 ?auto_265013 ) ( ON ?auto_265011 ?auto_265012 ) ( CLEAR ?auto_265009 ) ( ON ?auto_265010 ?auto_265011 ) ( CLEAR ?auto_265010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265007 ?auto_265008 ?auto_265009 ?auto_265010 )
      ( MAKE-7PILE ?auto_265007 ?auto_265008 ?auto_265009 ?auto_265010 ?auto_265011 ?auto_265012 ?auto_265013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265022 - BLOCK
      ?auto_265023 - BLOCK
      ?auto_265024 - BLOCK
      ?auto_265025 - BLOCK
      ?auto_265026 - BLOCK
      ?auto_265027 - BLOCK
      ?auto_265028 - BLOCK
    )
    :vars
    (
      ?auto_265029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265028 ?auto_265029 ) ( ON-TABLE ?auto_265022 ) ( ON ?auto_265023 ?auto_265022 ) ( ON ?auto_265024 ?auto_265023 ) ( not ( = ?auto_265022 ?auto_265023 ) ) ( not ( = ?auto_265022 ?auto_265024 ) ) ( not ( = ?auto_265022 ?auto_265025 ) ) ( not ( = ?auto_265022 ?auto_265026 ) ) ( not ( = ?auto_265022 ?auto_265027 ) ) ( not ( = ?auto_265022 ?auto_265028 ) ) ( not ( = ?auto_265022 ?auto_265029 ) ) ( not ( = ?auto_265023 ?auto_265024 ) ) ( not ( = ?auto_265023 ?auto_265025 ) ) ( not ( = ?auto_265023 ?auto_265026 ) ) ( not ( = ?auto_265023 ?auto_265027 ) ) ( not ( = ?auto_265023 ?auto_265028 ) ) ( not ( = ?auto_265023 ?auto_265029 ) ) ( not ( = ?auto_265024 ?auto_265025 ) ) ( not ( = ?auto_265024 ?auto_265026 ) ) ( not ( = ?auto_265024 ?auto_265027 ) ) ( not ( = ?auto_265024 ?auto_265028 ) ) ( not ( = ?auto_265024 ?auto_265029 ) ) ( not ( = ?auto_265025 ?auto_265026 ) ) ( not ( = ?auto_265025 ?auto_265027 ) ) ( not ( = ?auto_265025 ?auto_265028 ) ) ( not ( = ?auto_265025 ?auto_265029 ) ) ( not ( = ?auto_265026 ?auto_265027 ) ) ( not ( = ?auto_265026 ?auto_265028 ) ) ( not ( = ?auto_265026 ?auto_265029 ) ) ( not ( = ?auto_265027 ?auto_265028 ) ) ( not ( = ?auto_265027 ?auto_265029 ) ) ( not ( = ?auto_265028 ?auto_265029 ) ) ( ON ?auto_265027 ?auto_265028 ) ( ON ?auto_265026 ?auto_265027 ) ( CLEAR ?auto_265024 ) ( ON ?auto_265025 ?auto_265026 ) ( CLEAR ?auto_265025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265022 ?auto_265023 ?auto_265024 ?auto_265025 )
      ( MAKE-7PILE ?auto_265022 ?auto_265023 ?auto_265024 ?auto_265025 ?auto_265026 ?auto_265027 ?auto_265028 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265037 - BLOCK
      ?auto_265038 - BLOCK
      ?auto_265039 - BLOCK
      ?auto_265040 - BLOCK
      ?auto_265041 - BLOCK
      ?auto_265042 - BLOCK
      ?auto_265043 - BLOCK
    )
    :vars
    (
      ?auto_265044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265043 ?auto_265044 ) ( ON-TABLE ?auto_265037 ) ( ON ?auto_265038 ?auto_265037 ) ( not ( = ?auto_265037 ?auto_265038 ) ) ( not ( = ?auto_265037 ?auto_265039 ) ) ( not ( = ?auto_265037 ?auto_265040 ) ) ( not ( = ?auto_265037 ?auto_265041 ) ) ( not ( = ?auto_265037 ?auto_265042 ) ) ( not ( = ?auto_265037 ?auto_265043 ) ) ( not ( = ?auto_265037 ?auto_265044 ) ) ( not ( = ?auto_265038 ?auto_265039 ) ) ( not ( = ?auto_265038 ?auto_265040 ) ) ( not ( = ?auto_265038 ?auto_265041 ) ) ( not ( = ?auto_265038 ?auto_265042 ) ) ( not ( = ?auto_265038 ?auto_265043 ) ) ( not ( = ?auto_265038 ?auto_265044 ) ) ( not ( = ?auto_265039 ?auto_265040 ) ) ( not ( = ?auto_265039 ?auto_265041 ) ) ( not ( = ?auto_265039 ?auto_265042 ) ) ( not ( = ?auto_265039 ?auto_265043 ) ) ( not ( = ?auto_265039 ?auto_265044 ) ) ( not ( = ?auto_265040 ?auto_265041 ) ) ( not ( = ?auto_265040 ?auto_265042 ) ) ( not ( = ?auto_265040 ?auto_265043 ) ) ( not ( = ?auto_265040 ?auto_265044 ) ) ( not ( = ?auto_265041 ?auto_265042 ) ) ( not ( = ?auto_265041 ?auto_265043 ) ) ( not ( = ?auto_265041 ?auto_265044 ) ) ( not ( = ?auto_265042 ?auto_265043 ) ) ( not ( = ?auto_265042 ?auto_265044 ) ) ( not ( = ?auto_265043 ?auto_265044 ) ) ( ON ?auto_265042 ?auto_265043 ) ( ON ?auto_265041 ?auto_265042 ) ( ON ?auto_265040 ?auto_265041 ) ( CLEAR ?auto_265038 ) ( ON ?auto_265039 ?auto_265040 ) ( CLEAR ?auto_265039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265037 ?auto_265038 ?auto_265039 )
      ( MAKE-7PILE ?auto_265037 ?auto_265038 ?auto_265039 ?auto_265040 ?auto_265041 ?auto_265042 ?auto_265043 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265052 - BLOCK
      ?auto_265053 - BLOCK
      ?auto_265054 - BLOCK
      ?auto_265055 - BLOCK
      ?auto_265056 - BLOCK
      ?auto_265057 - BLOCK
      ?auto_265058 - BLOCK
    )
    :vars
    (
      ?auto_265059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265058 ?auto_265059 ) ( ON-TABLE ?auto_265052 ) ( ON ?auto_265053 ?auto_265052 ) ( not ( = ?auto_265052 ?auto_265053 ) ) ( not ( = ?auto_265052 ?auto_265054 ) ) ( not ( = ?auto_265052 ?auto_265055 ) ) ( not ( = ?auto_265052 ?auto_265056 ) ) ( not ( = ?auto_265052 ?auto_265057 ) ) ( not ( = ?auto_265052 ?auto_265058 ) ) ( not ( = ?auto_265052 ?auto_265059 ) ) ( not ( = ?auto_265053 ?auto_265054 ) ) ( not ( = ?auto_265053 ?auto_265055 ) ) ( not ( = ?auto_265053 ?auto_265056 ) ) ( not ( = ?auto_265053 ?auto_265057 ) ) ( not ( = ?auto_265053 ?auto_265058 ) ) ( not ( = ?auto_265053 ?auto_265059 ) ) ( not ( = ?auto_265054 ?auto_265055 ) ) ( not ( = ?auto_265054 ?auto_265056 ) ) ( not ( = ?auto_265054 ?auto_265057 ) ) ( not ( = ?auto_265054 ?auto_265058 ) ) ( not ( = ?auto_265054 ?auto_265059 ) ) ( not ( = ?auto_265055 ?auto_265056 ) ) ( not ( = ?auto_265055 ?auto_265057 ) ) ( not ( = ?auto_265055 ?auto_265058 ) ) ( not ( = ?auto_265055 ?auto_265059 ) ) ( not ( = ?auto_265056 ?auto_265057 ) ) ( not ( = ?auto_265056 ?auto_265058 ) ) ( not ( = ?auto_265056 ?auto_265059 ) ) ( not ( = ?auto_265057 ?auto_265058 ) ) ( not ( = ?auto_265057 ?auto_265059 ) ) ( not ( = ?auto_265058 ?auto_265059 ) ) ( ON ?auto_265057 ?auto_265058 ) ( ON ?auto_265056 ?auto_265057 ) ( ON ?auto_265055 ?auto_265056 ) ( CLEAR ?auto_265053 ) ( ON ?auto_265054 ?auto_265055 ) ( CLEAR ?auto_265054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265052 ?auto_265053 ?auto_265054 )
      ( MAKE-7PILE ?auto_265052 ?auto_265053 ?auto_265054 ?auto_265055 ?auto_265056 ?auto_265057 ?auto_265058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265067 - BLOCK
      ?auto_265068 - BLOCK
      ?auto_265069 - BLOCK
      ?auto_265070 - BLOCK
      ?auto_265071 - BLOCK
      ?auto_265072 - BLOCK
      ?auto_265073 - BLOCK
    )
    :vars
    (
      ?auto_265074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265073 ?auto_265074 ) ( ON-TABLE ?auto_265067 ) ( not ( = ?auto_265067 ?auto_265068 ) ) ( not ( = ?auto_265067 ?auto_265069 ) ) ( not ( = ?auto_265067 ?auto_265070 ) ) ( not ( = ?auto_265067 ?auto_265071 ) ) ( not ( = ?auto_265067 ?auto_265072 ) ) ( not ( = ?auto_265067 ?auto_265073 ) ) ( not ( = ?auto_265067 ?auto_265074 ) ) ( not ( = ?auto_265068 ?auto_265069 ) ) ( not ( = ?auto_265068 ?auto_265070 ) ) ( not ( = ?auto_265068 ?auto_265071 ) ) ( not ( = ?auto_265068 ?auto_265072 ) ) ( not ( = ?auto_265068 ?auto_265073 ) ) ( not ( = ?auto_265068 ?auto_265074 ) ) ( not ( = ?auto_265069 ?auto_265070 ) ) ( not ( = ?auto_265069 ?auto_265071 ) ) ( not ( = ?auto_265069 ?auto_265072 ) ) ( not ( = ?auto_265069 ?auto_265073 ) ) ( not ( = ?auto_265069 ?auto_265074 ) ) ( not ( = ?auto_265070 ?auto_265071 ) ) ( not ( = ?auto_265070 ?auto_265072 ) ) ( not ( = ?auto_265070 ?auto_265073 ) ) ( not ( = ?auto_265070 ?auto_265074 ) ) ( not ( = ?auto_265071 ?auto_265072 ) ) ( not ( = ?auto_265071 ?auto_265073 ) ) ( not ( = ?auto_265071 ?auto_265074 ) ) ( not ( = ?auto_265072 ?auto_265073 ) ) ( not ( = ?auto_265072 ?auto_265074 ) ) ( not ( = ?auto_265073 ?auto_265074 ) ) ( ON ?auto_265072 ?auto_265073 ) ( ON ?auto_265071 ?auto_265072 ) ( ON ?auto_265070 ?auto_265071 ) ( ON ?auto_265069 ?auto_265070 ) ( CLEAR ?auto_265067 ) ( ON ?auto_265068 ?auto_265069 ) ( CLEAR ?auto_265068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265067 ?auto_265068 )
      ( MAKE-7PILE ?auto_265067 ?auto_265068 ?auto_265069 ?auto_265070 ?auto_265071 ?auto_265072 ?auto_265073 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265082 - BLOCK
      ?auto_265083 - BLOCK
      ?auto_265084 - BLOCK
      ?auto_265085 - BLOCK
      ?auto_265086 - BLOCK
      ?auto_265087 - BLOCK
      ?auto_265088 - BLOCK
    )
    :vars
    (
      ?auto_265089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265088 ?auto_265089 ) ( ON-TABLE ?auto_265082 ) ( not ( = ?auto_265082 ?auto_265083 ) ) ( not ( = ?auto_265082 ?auto_265084 ) ) ( not ( = ?auto_265082 ?auto_265085 ) ) ( not ( = ?auto_265082 ?auto_265086 ) ) ( not ( = ?auto_265082 ?auto_265087 ) ) ( not ( = ?auto_265082 ?auto_265088 ) ) ( not ( = ?auto_265082 ?auto_265089 ) ) ( not ( = ?auto_265083 ?auto_265084 ) ) ( not ( = ?auto_265083 ?auto_265085 ) ) ( not ( = ?auto_265083 ?auto_265086 ) ) ( not ( = ?auto_265083 ?auto_265087 ) ) ( not ( = ?auto_265083 ?auto_265088 ) ) ( not ( = ?auto_265083 ?auto_265089 ) ) ( not ( = ?auto_265084 ?auto_265085 ) ) ( not ( = ?auto_265084 ?auto_265086 ) ) ( not ( = ?auto_265084 ?auto_265087 ) ) ( not ( = ?auto_265084 ?auto_265088 ) ) ( not ( = ?auto_265084 ?auto_265089 ) ) ( not ( = ?auto_265085 ?auto_265086 ) ) ( not ( = ?auto_265085 ?auto_265087 ) ) ( not ( = ?auto_265085 ?auto_265088 ) ) ( not ( = ?auto_265085 ?auto_265089 ) ) ( not ( = ?auto_265086 ?auto_265087 ) ) ( not ( = ?auto_265086 ?auto_265088 ) ) ( not ( = ?auto_265086 ?auto_265089 ) ) ( not ( = ?auto_265087 ?auto_265088 ) ) ( not ( = ?auto_265087 ?auto_265089 ) ) ( not ( = ?auto_265088 ?auto_265089 ) ) ( ON ?auto_265087 ?auto_265088 ) ( ON ?auto_265086 ?auto_265087 ) ( ON ?auto_265085 ?auto_265086 ) ( ON ?auto_265084 ?auto_265085 ) ( CLEAR ?auto_265082 ) ( ON ?auto_265083 ?auto_265084 ) ( CLEAR ?auto_265083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265082 ?auto_265083 )
      ( MAKE-7PILE ?auto_265082 ?auto_265083 ?auto_265084 ?auto_265085 ?auto_265086 ?auto_265087 ?auto_265088 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265097 - BLOCK
      ?auto_265098 - BLOCK
      ?auto_265099 - BLOCK
      ?auto_265100 - BLOCK
      ?auto_265101 - BLOCK
      ?auto_265102 - BLOCK
      ?auto_265103 - BLOCK
    )
    :vars
    (
      ?auto_265104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265103 ?auto_265104 ) ( not ( = ?auto_265097 ?auto_265098 ) ) ( not ( = ?auto_265097 ?auto_265099 ) ) ( not ( = ?auto_265097 ?auto_265100 ) ) ( not ( = ?auto_265097 ?auto_265101 ) ) ( not ( = ?auto_265097 ?auto_265102 ) ) ( not ( = ?auto_265097 ?auto_265103 ) ) ( not ( = ?auto_265097 ?auto_265104 ) ) ( not ( = ?auto_265098 ?auto_265099 ) ) ( not ( = ?auto_265098 ?auto_265100 ) ) ( not ( = ?auto_265098 ?auto_265101 ) ) ( not ( = ?auto_265098 ?auto_265102 ) ) ( not ( = ?auto_265098 ?auto_265103 ) ) ( not ( = ?auto_265098 ?auto_265104 ) ) ( not ( = ?auto_265099 ?auto_265100 ) ) ( not ( = ?auto_265099 ?auto_265101 ) ) ( not ( = ?auto_265099 ?auto_265102 ) ) ( not ( = ?auto_265099 ?auto_265103 ) ) ( not ( = ?auto_265099 ?auto_265104 ) ) ( not ( = ?auto_265100 ?auto_265101 ) ) ( not ( = ?auto_265100 ?auto_265102 ) ) ( not ( = ?auto_265100 ?auto_265103 ) ) ( not ( = ?auto_265100 ?auto_265104 ) ) ( not ( = ?auto_265101 ?auto_265102 ) ) ( not ( = ?auto_265101 ?auto_265103 ) ) ( not ( = ?auto_265101 ?auto_265104 ) ) ( not ( = ?auto_265102 ?auto_265103 ) ) ( not ( = ?auto_265102 ?auto_265104 ) ) ( not ( = ?auto_265103 ?auto_265104 ) ) ( ON ?auto_265102 ?auto_265103 ) ( ON ?auto_265101 ?auto_265102 ) ( ON ?auto_265100 ?auto_265101 ) ( ON ?auto_265099 ?auto_265100 ) ( ON ?auto_265098 ?auto_265099 ) ( ON ?auto_265097 ?auto_265098 ) ( CLEAR ?auto_265097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265097 )
      ( MAKE-7PILE ?auto_265097 ?auto_265098 ?auto_265099 ?auto_265100 ?auto_265101 ?auto_265102 ?auto_265103 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_265112 - BLOCK
      ?auto_265113 - BLOCK
      ?auto_265114 - BLOCK
      ?auto_265115 - BLOCK
      ?auto_265116 - BLOCK
      ?auto_265117 - BLOCK
      ?auto_265118 - BLOCK
    )
    :vars
    (
      ?auto_265119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265118 ?auto_265119 ) ( not ( = ?auto_265112 ?auto_265113 ) ) ( not ( = ?auto_265112 ?auto_265114 ) ) ( not ( = ?auto_265112 ?auto_265115 ) ) ( not ( = ?auto_265112 ?auto_265116 ) ) ( not ( = ?auto_265112 ?auto_265117 ) ) ( not ( = ?auto_265112 ?auto_265118 ) ) ( not ( = ?auto_265112 ?auto_265119 ) ) ( not ( = ?auto_265113 ?auto_265114 ) ) ( not ( = ?auto_265113 ?auto_265115 ) ) ( not ( = ?auto_265113 ?auto_265116 ) ) ( not ( = ?auto_265113 ?auto_265117 ) ) ( not ( = ?auto_265113 ?auto_265118 ) ) ( not ( = ?auto_265113 ?auto_265119 ) ) ( not ( = ?auto_265114 ?auto_265115 ) ) ( not ( = ?auto_265114 ?auto_265116 ) ) ( not ( = ?auto_265114 ?auto_265117 ) ) ( not ( = ?auto_265114 ?auto_265118 ) ) ( not ( = ?auto_265114 ?auto_265119 ) ) ( not ( = ?auto_265115 ?auto_265116 ) ) ( not ( = ?auto_265115 ?auto_265117 ) ) ( not ( = ?auto_265115 ?auto_265118 ) ) ( not ( = ?auto_265115 ?auto_265119 ) ) ( not ( = ?auto_265116 ?auto_265117 ) ) ( not ( = ?auto_265116 ?auto_265118 ) ) ( not ( = ?auto_265116 ?auto_265119 ) ) ( not ( = ?auto_265117 ?auto_265118 ) ) ( not ( = ?auto_265117 ?auto_265119 ) ) ( not ( = ?auto_265118 ?auto_265119 ) ) ( ON ?auto_265117 ?auto_265118 ) ( ON ?auto_265116 ?auto_265117 ) ( ON ?auto_265115 ?auto_265116 ) ( ON ?auto_265114 ?auto_265115 ) ( ON ?auto_265113 ?auto_265114 ) ( ON ?auto_265112 ?auto_265113 ) ( CLEAR ?auto_265112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265112 )
      ( MAKE-7PILE ?auto_265112 ?auto_265113 ?auto_265114 ?auto_265115 ?auto_265116 ?auto_265117 ?auto_265118 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265128 - BLOCK
      ?auto_265129 - BLOCK
      ?auto_265130 - BLOCK
      ?auto_265131 - BLOCK
      ?auto_265132 - BLOCK
      ?auto_265133 - BLOCK
      ?auto_265134 - BLOCK
      ?auto_265135 - BLOCK
    )
    :vars
    (
      ?auto_265136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265134 ) ( ON ?auto_265135 ?auto_265136 ) ( CLEAR ?auto_265135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265128 ) ( ON ?auto_265129 ?auto_265128 ) ( ON ?auto_265130 ?auto_265129 ) ( ON ?auto_265131 ?auto_265130 ) ( ON ?auto_265132 ?auto_265131 ) ( ON ?auto_265133 ?auto_265132 ) ( ON ?auto_265134 ?auto_265133 ) ( not ( = ?auto_265128 ?auto_265129 ) ) ( not ( = ?auto_265128 ?auto_265130 ) ) ( not ( = ?auto_265128 ?auto_265131 ) ) ( not ( = ?auto_265128 ?auto_265132 ) ) ( not ( = ?auto_265128 ?auto_265133 ) ) ( not ( = ?auto_265128 ?auto_265134 ) ) ( not ( = ?auto_265128 ?auto_265135 ) ) ( not ( = ?auto_265128 ?auto_265136 ) ) ( not ( = ?auto_265129 ?auto_265130 ) ) ( not ( = ?auto_265129 ?auto_265131 ) ) ( not ( = ?auto_265129 ?auto_265132 ) ) ( not ( = ?auto_265129 ?auto_265133 ) ) ( not ( = ?auto_265129 ?auto_265134 ) ) ( not ( = ?auto_265129 ?auto_265135 ) ) ( not ( = ?auto_265129 ?auto_265136 ) ) ( not ( = ?auto_265130 ?auto_265131 ) ) ( not ( = ?auto_265130 ?auto_265132 ) ) ( not ( = ?auto_265130 ?auto_265133 ) ) ( not ( = ?auto_265130 ?auto_265134 ) ) ( not ( = ?auto_265130 ?auto_265135 ) ) ( not ( = ?auto_265130 ?auto_265136 ) ) ( not ( = ?auto_265131 ?auto_265132 ) ) ( not ( = ?auto_265131 ?auto_265133 ) ) ( not ( = ?auto_265131 ?auto_265134 ) ) ( not ( = ?auto_265131 ?auto_265135 ) ) ( not ( = ?auto_265131 ?auto_265136 ) ) ( not ( = ?auto_265132 ?auto_265133 ) ) ( not ( = ?auto_265132 ?auto_265134 ) ) ( not ( = ?auto_265132 ?auto_265135 ) ) ( not ( = ?auto_265132 ?auto_265136 ) ) ( not ( = ?auto_265133 ?auto_265134 ) ) ( not ( = ?auto_265133 ?auto_265135 ) ) ( not ( = ?auto_265133 ?auto_265136 ) ) ( not ( = ?auto_265134 ?auto_265135 ) ) ( not ( = ?auto_265134 ?auto_265136 ) ) ( not ( = ?auto_265135 ?auto_265136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265135 ?auto_265136 )
      ( !STACK ?auto_265135 ?auto_265134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265145 - BLOCK
      ?auto_265146 - BLOCK
      ?auto_265147 - BLOCK
      ?auto_265148 - BLOCK
      ?auto_265149 - BLOCK
      ?auto_265150 - BLOCK
      ?auto_265151 - BLOCK
      ?auto_265152 - BLOCK
    )
    :vars
    (
      ?auto_265153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265151 ) ( ON ?auto_265152 ?auto_265153 ) ( CLEAR ?auto_265152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265145 ) ( ON ?auto_265146 ?auto_265145 ) ( ON ?auto_265147 ?auto_265146 ) ( ON ?auto_265148 ?auto_265147 ) ( ON ?auto_265149 ?auto_265148 ) ( ON ?auto_265150 ?auto_265149 ) ( ON ?auto_265151 ?auto_265150 ) ( not ( = ?auto_265145 ?auto_265146 ) ) ( not ( = ?auto_265145 ?auto_265147 ) ) ( not ( = ?auto_265145 ?auto_265148 ) ) ( not ( = ?auto_265145 ?auto_265149 ) ) ( not ( = ?auto_265145 ?auto_265150 ) ) ( not ( = ?auto_265145 ?auto_265151 ) ) ( not ( = ?auto_265145 ?auto_265152 ) ) ( not ( = ?auto_265145 ?auto_265153 ) ) ( not ( = ?auto_265146 ?auto_265147 ) ) ( not ( = ?auto_265146 ?auto_265148 ) ) ( not ( = ?auto_265146 ?auto_265149 ) ) ( not ( = ?auto_265146 ?auto_265150 ) ) ( not ( = ?auto_265146 ?auto_265151 ) ) ( not ( = ?auto_265146 ?auto_265152 ) ) ( not ( = ?auto_265146 ?auto_265153 ) ) ( not ( = ?auto_265147 ?auto_265148 ) ) ( not ( = ?auto_265147 ?auto_265149 ) ) ( not ( = ?auto_265147 ?auto_265150 ) ) ( not ( = ?auto_265147 ?auto_265151 ) ) ( not ( = ?auto_265147 ?auto_265152 ) ) ( not ( = ?auto_265147 ?auto_265153 ) ) ( not ( = ?auto_265148 ?auto_265149 ) ) ( not ( = ?auto_265148 ?auto_265150 ) ) ( not ( = ?auto_265148 ?auto_265151 ) ) ( not ( = ?auto_265148 ?auto_265152 ) ) ( not ( = ?auto_265148 ?auto_265153 ) ) ( not ( = ?auto_265149 ?auto_265150 ) ) ( not ( = ?auto_265149 ?auto_265151 ) ) ( not ( = ?auto_265149 ?auto_265152 ) ) ( not ( = ?auto_265149 ?auto_265153 ) ) ( not ( = ?auto_265150 ?auto_265151 ) ) ( not ( = ?auto_265150 ?auto_265152 ) ) ( not ( = ?auto_265150 ?auto_265153 ) ) ( not ( = ?auto_265151 ?auto_265152 ) ) ( not ( = ?auto_265151 ?auto_265153 ) ) ( not ( = ?auto_265152 ?auto_265153 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265152 ?auto_265153 )
      ( !STACK ?auto_265152 ?auto_265151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265162 - BLOCK
      ?auto_265163 - BLOCK
      ?auto_265164 - BLOCK
      ?auto_265165 - BLOCK
      ?auto_265166 - BLOCK
      ?auto_265167 - BLOCK
      ?auto_265168 - BLOCK
      ?auto_265169 - BLOCK
    )
    :vars
    (
      ?auto_265170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265169 ?auto_265170 ) ( ON-TABLE ?auto_265162 ) ( ON ?auto_265163 ?auto_265162 ) ( ON ?auto_265164 ?auto_265163 ) ( ON ?auto_265165 ?auto_265164 ) ( ON ?auto_265166 ?auto_265165 ) ( ON ?auto_265167 ?auto_265166 ) ( not ( = ?auto_265162 ?auto_265163 ) ) ( not ( = ?auto_265162 ?auto_265164 ) ) ( not ( = ?auto_265162 ?auto_265165 ) ) ( not ( = ?auto_265162 ?auto_265166 ) ) ( not ( = ?auto_265162 ?auto_265167 ) ) ( not ( = ?auto_265162 ?auto_265168 ) ) ( not ( = ?auto_265162 ?auto_265169 ) ) ( not ( = ?auto_265162 ?auto_265170 ) ) ( not ( = ?auto_265163 ?auto_265164 ) ) ( not ( = ?auto_265163 ?auto_265165 ) ) ( not ( = ?auto_265163 ?auto_265166 ) ) ( not ( = ?auto_265163 ?auto_265167 ) ) ( not ( = ?auto_265163 ?auto_265168 ) ) ( not ( = ?auto_265163 ?auto_265169 ) ) ( not ( = ?auto_265163 ?auto_265170 ) ) ( not ( = ?auto_265164 ?auto_265165 ) ) ( not ( = ?auto_265164 ?auto_265166 ) ) ( not ( = ?auto_265164 ?auto_265167 ) ) ( not ( = ?auto_265164 ?auto_265168 ) ) ( not ( = ?auto_265164 ?auto_265169 ) ) ( not ( = ?auto_265164 ?auto_265170 ) ) ( not ( = ?auto_265165 ?auto_265166 ) ) ( not ( = ?auto_265165 ?auto_265167 ) ) ( not ( = ?auto_265165 ?auto_265168 ) ) ( not ( = ?auto_265165 ?auto_265169 ) ) ( not ( = ?auto_265165 ?auto_265170 ) ) ( not ( = ?auto_265166 ?auto_265167 ) ) ( not ( = ?auto_265166 ?auto_265168 ) ) ( not ( = ?auto_265166 ?auto_265169 ) ) ( not ( = ?auto_265166 ?auto_265170 ) ) ( not ( = ?auto_265167 ?auto_265168 ) ) ( not ( = ?auto_265167 ?auto_265169 ) ) ( not ( = ?auto_265167 ?auto_265170 ) ) ( not ( = ?auto_265168 ?auto_265169 ) ) ( not ( = ?auto_265168 ?auto_265170 ) ) ( not ( = ?auto_265169 ?auto_265170 ) ) ( CLEAR ?auto_265167 ) ( ON ?auto_265168 ?auto_265169 ) ( CLEAR ?auto_265168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265162 ?auto_265163 ?auto_265164 ?auto_265165 ?auto_265166 ?auto_265167 ?auto_265168 )
      ( MAKE-8PILE ?auto_265162 ?auto_265163 ?auto_265164 ?auto_265165 ?auto_265166 ?auto_265167 ?auto_265168 ?auto_265169 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265179 - BLOCK
      ?auto_265180 - BLOCK
      ?auto_265181 - BLOCK
      ?auto_265182 - BLOCK
      ?auto_265183 - BLOCK
      ?auto_265184 - BLOCK
      ?auto_265185 - BLOCK
      ?auto_265186 - BLOCK
    )
    :vars
    (
      ?auto_265187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265186 ?auto_265187 ) ( ON-TABLE ?auto_265179 ) ( ON ?auto_265180 ?auto_265179 ) ( ON ?auto_265181 ?auto_265180 ) ( ON ?auto_265182 ?auto_265181 ) ( ON ?auto_265183 ?auto_265182 ) ( ON ?auto_265184 ?auto_265183 ) ( not ( = ?auto_265179 ?auto_265180 ) ) ( not ( = ?auto_265179 ?auto_265181 ) ) ( not ( = ?auto_265179 ?auto_265182 ) ) ( not ( = ?auto_265179 ?auto_265183 ) ) ( not ( = ?auto_265179 ?auto_265184 ) ) ( not ( = ?auto_265179 ?auto_265185 ) ) ( not ( = ?auto_265179 ?auto_265186 ) ) ( not ( = ?auto_265179 ?auto_265187 ) ) ( not ( = ?auto_265180 ?auto_265181 ) ) ( not ( = ?auto_265180 ?auto_265182 ) ) ( not ( = ?auto_265180 ?auto_265183 ) ) ( not ( = ?auto_265180 ?auto_265184 ) ) ( not ( = ?auto_265180 ?auto_265185 ) ) ( not ( = ?auto_265180 ?auto_265186 ) ) ( not ( = ?auto_265180 ?auto_265187 ) ) ( not ( = ?auto_265181 ?auto_265182 ) ) ( not ( = ?auto_265181 ?auto_265183 ) ) ( not ( = ?auto_265181 ?auto_265184 ) ) ( not ( = ?auto_265181 ?auto_265185 ) ) ( not ( = ?auto_265181 ?auto_265186 ) ) ( not ( = ?auto_265181 ?auto_265187 ) ) ( not ( = ?auto_265182 ?auto_265183 ) ) ( not ( = ?auto_265182 ?auto_265184 ) ) ( not ( = ?auto_265182 ?auto_265185 ) ) ( not ( = ?auto_265182 ?auto_265186 ) ) ( not ( = ?auto_265182 ?auto_265187 ) ) ( not ( = ?auto_265183 ?auto_265184 ) ) ( not ( = ?auto_265183 ?auto_265185 ) ) ( not ( = ?auto_265183 ?auto_265186 ) ) ( not ( = ?auto_265183 ?auto_265187 ) ) ( not ( = ?auto_265184 ?auto_265185 ) ) ( not ( = ?auto_265184 ?auto_265186 ) ) ( not ( = ?auto_265184 ?auto_265187 ) ) ( not ( = ?auto_265185 ?auto_265186 ) ) ( not ( = ?auto_265185 ?auto_265187 ) ) ( not ( = ?auto_265186 ?auto_265187 ) ) ( CLEAR ?auto_265184 ) ( ON ?auto_265185 ?auto_265186 ) ( CLEAR ?auto_265185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265179 ?auto_265180 ?auto_265181 ?auto_265182 ?auto_265183 ?auto_265184 ?auto_265185 )
      ( MAKE-8PILE ?auto_265179 ?auto_265180 ?auto_265181 ?auto_265182 ?auto_265183 ?auto_265184 ?auto_265185 ?auto_265186 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265196 - BLOCK
      ?auto_265197 - BLOCK
      ?auto_265198 - BLOCK
      ?auto_265199 - BLOCK
      ?auto_265200 - BLOCK
      ?auto_265201 - BLOCK
      ?auto_265202 - BLOCK
      ?auto_265203 - BLOCK
    )
    :vars
    (
      ?auto_265204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265203 ?auto_265204 ) ( ON-TABLE ?auto_265196 ) ( ON ?auto_265197 ?auto_265196 ) ( ON ?auto_265198 ?auto_265197 ) ( ON ?auto_265199 ?auto_265198 ) ( ON ?auto_265200 ?auto_265199 ) ( not ( = ?auto_265196 ?auto_265197 ) ) ( not ( = ?auto_265196 ?auto_265198 ) ) ( not ( = ?auto_265196 ?auto_265199 ) ) ( not ( = ?auto_265196 ?auto_265200 ) ) ( not ( = ?auto_265196 ?auto_265201 ) ) ( not ( = ?auto_265196 ?auto_265202 ) ) ( not ( = ?auto_265196 ?auto_265203 ) ) ( not ( = ?auto_265196 ?auto_265204 ) ) ( not ( = ?auto_265197 ?auto_265198 ) ) ( not ( = ?auto_265197 ?auto_265199 ) ) ( not ( = ?auto_265197 ?auto_265200 ) ) ( not ( = ?auto_265197 ?auto_265201 ) ) ( not ( = ?auto_265197 ?auto_265202 ) ) ( not ( = ?auto_265197 ?auto_265203 ) ) ( not ( = ?auto_265197 ?auto_265204 ) ) ( not ( = ?auto_265198 ?auto_265199 ) ) ( not ( = ?auto_265198 ?auto_265200 ) ) ( not ( = ?auto_265198 ?auto_265201 ) ) ( not ( = ?auto_265198 ?auto_265202 ) ) ( not ( = ?auto_265198 ?auto_265203 ) ) ( not ( = ?auto_265198 ?auto_265204 ) ) ( not ( = ?auto_265199 ?auto_265200 ) ) ( not ( = ?auto_265199 ?auto_265201 ) ) ( not ( = ?auto_265199 ?auto_265202 ) ) ( not ( = ?auto_265199 ?auto_265203 ) ) ( not ( = ?auto_265199 ?auto_265204 ) ) ( not ( = ?auto_265200 ?auto_265201 ) ) ( not ( = ?auto_265200 ?auto_265202 ) ) ( not ( = ?auto_265200 ?auto_265203 ) ) ( not ( = ?auto_265200 ?auto_265204 ) ) ( not ( = ?auto_265201 ?auto_265202 ) ) ( not ( = ?auto_265201 ?auto_265203 ) ) ( not ( = ?auto_265201 ?auto_265204 ) ) ( not ( = ?auto_265202 ?auto_265203 ) ) ( not ( = ?auto_265202 ?auto_265204 ) ) ( not ( = ?auto_265203 ?auto_265204 ) ) ( ON ?auto_265202 ?auto_265203 ) ( CLEAR ?auto_265200 ) ( ON ?auto_265201 ?auto_265202 ) ( CLEAR ?auto_265201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265196 ?auto_265197 ?auto_265198 ?auto_265199 ?auto_265200 ?auto_265201 )
      ( MAKE-8PILE ?auto_265196 ?auto_265197 ?auto_265198 ?auto_265199 ?auto_265200 ?auto_265201 ?auto_265202 ?auto_265203 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265213 - BLOCK
      ?auto_265214 - BLOCK
      ?auto_265215 - BLOCK
      ?auto_265216 - BLOCK
      ?auto_265217 - BLOCK
      ?auto_265218 - BLOCK
      ?auto_265219 - BLOCK
      ?auto_265220 - BLOCK
    )
    :vars
    (
      ?auto_265221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265220 ?auto_265221 ) ( ON-TABLE ?auto_265213 ) ( ON ?auto_265214 ?auto_265213 ) ( ON ?auto_265215 ?auto_265214 ) ( ON ?auto_265216 ?auto_265215 ) ( ON ?auto_265217 ?auto_265216 ) ( not ( = ?auto_265213 ?auto_265214 ) ) ( not ( = ?auto_265213 ?auto_265215 ) ) ( not ( = ?auto_265213 ?auto_265216 ) ) ( not ( = ?auto_265213 ?auto_265217 ) ) ( not ( = ?auto_265213 ?auto_265218 ) ) ( not ( = ?auto_265213 ?auto_265219 ) ) ( not ( = ?auto_265213 ?auto_265220 ) ) ( not ( = ?auto_265213 ?auto_265221 ) ) ( not ( = ?auto_265214 ?auto_265215 ) ) ( not ( = ?auto_265214 ?auto_265216 ) ) ( not ( = ?auto_265214 ?auto_265217 ) ) ( not ( = ?auto_265214 ?auto_265218 ) ) ( not ( = ?auto_265214 ?auto_265219 ) ) ( not ( = ?auto_265214 ?auto_265220 ) ) ( not ( = ?auto_265214 ?auto_265221 ) ) ( not ( = ?auto_265215 ?auto_265216 ) ) ( not ( = ?auto_265215 ?auto_265217 ) ) ( not ( = ?auto_265215 ?auto_265218 ) ) ( not ( = ?auto_265215 ?auto_265219 ) ) ( not ( = ?auto_265215 ?auto_265220 ) ) ( not ( = ?auto_265215 ?auto_265221 ) ) ( not ( = ?auto_265216 ?auto_265217 ) ) ( not ( = ?auto_265216 ?auto_265218 ) ) ( not ( = ?auto_265216 ?auto_265219 ) ) ( not ( = ?auto_265216 ?auto_265220 ) ) ( not ( = ?auto_265216 ?auto_265221 ) ) ( not ( = ?auto_265217 ?auto_265218 ) ) ( not ( = ?auto_265217 ?auto_265219 ) ) ( not ( = ?auto_265217 ?auto_265220 ) ) ( not ( = ?auto_265217 ?auto_265221 ) ) ( not ( = ?auto_265218 ?auto_265219 ) ) ( not ( = ?auto_265218 ?auto_265220 ) ) ( not ( = ?auto_265218 ?auto_265221 ) ) ( not ( = ?auto_265219 ?auto_265220 ) ) ( not ( = ?auto_265219 ?auto_265221 ) ) ( not ( = ?auto_265220 ?auto_265221 ) ) ( ON ?auto_265219 ?auto_265220 ) ( CLEAR ?auto_265217 ) ( ON ?auto_265218 ?auto_265219 ) ( CLEAR ?auto_265218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265213 ?auto_265214 ?auto_265215 ?auto_265216 ?auto_265217 ?auto_265218 )
      ( MAKE-8PILE ?auto_265213 ?auto_265214 ?auto_265215 ?auto_265216 ?auto_265217 ?auto_265218 ?auto_265219 ?auto_265220 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265230 - BLOCK
      ?auto_265231 - BLOCK
      ?auto_265232 - BLOCK
      ?auto_265233 - BLOCK
      ?auto_265234 - BLOCK
      ?auto_265235 - BLOCK
      ?auto_265236 - BLOCK
      ?auto_265237 - BLOCK
    )
    :vars
    (
      ?auto_265238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265237 ?auto_265238 ) ( ON-TABLE ?auto_265230 ) ( ON ?auto_265231 ?auto_265230 ) ( ON ?auto_265232 ?auto_265231 ) ( ON ?auto_265233 ?auto_265232 ) ( not ( = ?auto_265230 ?auto_265231 ) ) ( not ( = ?auto_265230 ?auto_265232 ) ) ( not ( = ?auto_265230 ?auto_265233 ) ) ( not ( = ?auto_265230 ?auto_265234 ) ) ( not ( = ?auto_265230 ?auto_265235 ) ) ( not ( = ?auto_265230 ?auto_265236 ) ) ( not ( = ?auto_265230 ?auto_265237 ) ) ( not ( = ?auto_265230 ?auto_265238 ) ) ( not ( = ?auto_265231 ?auto_265232 ) ) ( not ( = ?auto_265231 ?auto_265233 ) ) ( not ( = ?auto_265231 ?auto_265234 ) ) ( not ( = ?auto_265231 ?auto_265235 ) ) ( not ( = ?auto_265231 ?auto_265236 ) ) ( not ( = ?auto_265231 ?auto_265237 ) ) ( not ( = ?auto_265231 ?auto_265238 ) ) ( not ( = ?auto_265232 ?auto_265233 ) ) ( not ( = ?auto_265232 ?auto_265234 ) ) ( not ( = ?auto_265232 ?auto_265235 ) ) ( not ( = ?auto_265232 ?auto_265236 ) ) ( not ( = ?auto_265232 ?auto_265237 ) ) ( not ( = ?auto_265232 ?auto_265238 ) ) ( not ( = ?auto_265233 ?auto_265234 ) ) ( not ( = ?auto_265233 ?auto_265235 ) ) ( not ( = ?auto_265233 ?auto_265236 ) ) ( not ( = ?auto_265233 ?auto_265237 ) ) ( not ( = ?auto_265233 ?auto_265238 ) ) ( not ( = ?auto_265234 ?auto_265235 ) ) ( not ( = ?auto_265234 ?auto_265236 ) ) ( not ( = ?auto_265234 ?auto_265237 ) ) ( not ( = ?auto_265234 ?auto_265238 ) ) ( not ( = ?auto_265235 ?auto_265236 ) ) ( not ( = ?auto_265235 ?auto_265237 ) ) ( not ( = ?auto_265235 ?auto_265238 ) ) ( not ( = ?auto_265236 ?auto_265237 ) ) ( not ( = ?auto_265236 ?auto_265238 ) ) ( not ( = ?auto_265237 ?auto_265238 ) ) ( ON ?auto_265236 ?auto_265237 ) ( ON ?auto_265235 ?auto_265236 ) ( CLEAR ?auto_265233 ) ( ON ?auto_265234 ?auto_265235 ) ( CLEAR ?auto_265234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265230 ?auto_265231 ?auto_265232 ?auto_265233 ?auto_265234 )
      ( MAKE-8PILE ?auto_265230 ?auto_265231 ?auto_265232 ?auto_265233 ?auto_265234 ?auto_265235 ?auto_265236 ?auto_265237 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265247 - BLOCK
      ?auto_265248 - BLOCK
      ?auto_265249 - BLOCK
      ?auto_265250 - BLOCK
      ?auto_265251 - BLOCK
      ?auto_265252 - BLOCK
      ?auto_265253 - BLOCK
      ?auto_265254 - BLOCK
    )
    :vars
    (
      ?auto_265255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265254 ?auto_265255 ) ( ON-TABLE ?auto_265247 ) ( ON ?auto_265248 ?auto_265247 ) ( ON ?auto_265249 ?auto_265248 ) ( ON ?auto_265250 ?auto_265249 ) ( not ( = ?auto_265247 ?auto_265248 ) ) ( not ( = ?auto_265247 ?auto_265249 ) ) ( not ( = ?auto_265247 ?auto_265250 ) ) ( not ( = ?auto_265247 ?auto_265251 ) ) ( not ( = ?auto_265247 ?auto_265252 ) ) ( not ( = ?auto_265247 ?auto_265253 ) ) ( not ( = ?auto_265247 ?auto_265254 ) ) ( not ( = ?auto_265247 ?auto_265255 ) ) ( not ( = ?auto_265248 ?auto_265249 ) ) ( not ( = ?auto_265248 ?auto_265250 ) ) ( not ( = ?auto_265248 ?auto_265251 ) ) ( not ( = ?auto_265248 ?auto_265252 ) ) ( not ( = ?auto_265248 ?auto_265253 ) ) ( not ( = ?auto_265248 ?auto_265254 ) ) ( not ( = ?auto_265248 ?auto_265255 ) ) ( not ( = ?auto_265249 ?auto_265250 ) ) ( not ( = ?auto_265249 ?auto_265251 ) ) ( not ( = ?auto_265249 ?auto_265252 ) ) ( not ( = ?auto_265249 ?auto_265253 ) ) ( not ( = ?auto_265249 ?auto_265254 ) ) ( not ( = ?auto_265249 ?auto_265255 ) ) ( not ( = ?auto_265250 ?auto_265251 ) ) ( not ( = ?auto_265250 ?auto_265252 ) ) ( not ( = ?auto_265250 ?auto_265253 ) ) ( not ( = ?auto_265250 ?auto_265254 ) ) ( not ( = ?auto_265250 ?auto_265255 ) ) ( not ( = ?auto_265251 ?auto_265252 ) ) ( not ( = ?auto_265251 ?auto_265253 ) ) ( not ( = ?auto_265251 ?auto_265254 ) ) ( not ( = ?auto_265251 ?auto_265255 ) ) ( not ( = ?auto_265252 ?auto_265253 ) ) ( not ( = ?auto_265252 ?auto_265254 ) ) ( not ( = ?auto_265252 ?auto_265255 ) ) ( not ( = ?auto_265253 ?auto_265254 ) ) ( not ( = ?auto_265253 ?auto_265255 ) ) ( not ( = ?auto_265254 ?auto_265255 ) ) ( ON ?auto_265253 ?auto_265254 ) ( ON ?auto_265252 ?auto_265253 ) ( CLEAR ?auto_265250 ) ( ON ?auto_265251 ?auto_265252 ) ( CLEAR ?auto_265251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265247 ?auto_265248 ?auto_265249 ?auto_265250 ?auto_265251 )
      ( MAKE-8PILE ?auto_265247 ?auto_265248 ?auto_265249 ?auto_265250 ?auto_265251 ?auto_265252 ?auto_265253 ?auto_265254 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265264 - BLOCK
      ?auto_265265 - BLOCK
      ?auto_265266 - BLOCK
      ?auto_265267 - BLOCK
      ?auto_265268 - BLOCK
      ?auto_265269 - BLOCK
      ?auto_265270 - BLOCK
      ?auto_265271 - BLOCK
    )
    :vars
    (
      ?auto_265272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265271 ?auto_265272 ) ( ON-TABLE ?auto_265264 ) ( ON ?auto_265265 ?auto_265264 ) ( ON ?auto_265266 ?auto_265265 ) ( not ( = ?auto_265264 ?auto_265265 ) ) ( not ( = ?auto_265264 ?auto_265266 ) ) ( not ( = ?auto_265264 ?auto_265267 ) ) ( not ( = ?auto_265264 ?auto_265268 ) ) ( not ( = ?auto_265264 ?auto_265269 ) ) ( not ( = ?auto_265264 ?auto_265270 ) ) ( not ( = ?auto_265264 ?auto_265271 ) ) ( not ( = ?auto_265264 ?auto_265272 ) ) ( not ( = ?auto_265265 ?auto_265266 ) ) ( not ( = ?auto_265265 ?auto_265267 ) ) ( not ( = ?auto_265265 ?auto_265268 ) ) ( not ( = ?auto_265265 ?auto_265269 ) ) ( not ( = ?auto_265265 ?auto_265270 ) ) ( not ( = ?auto_265265 ?auto_265271 ) ) ( not ( = ?auto_265265 ?auto_265272 ) ) ( not ( = ?auto_265266 ?auto_265267 ) ) ( not ( = ?auto_265266 ?auto_265268 ) ) ( not ( = ?auto_265266 ?auto_265269 ) ) ( not ( = ?auto_265266 ?auto_265270 ) ) ( not ( = ?auto_265266 ?auto_265271 ) ) ( not ( = ?auto_265266 ?auto_265272 ) ) ( not ( = ?auto_265267 ?auto_265268 ) ) ( not ( = ?auto_265267 ?auto_265269 ) ) ( not ( = ?auto_265267 ?auto_265270 ) ) ( not ( = ?auto_265267 ?auto_265271 ) ) ( not ( = ?auto_265267 ?auto_265272 ) ) ( not ( = ?auto_265268 ?auto_265269 ) ) ( not ( = ?auto_265268 ?auto_265270 ) ) ( not ( = ?auto_265268 ?auto_265271 ) ) ( not ( = ?auto_265268 ?auto_265272 ) ) ( not ( = ?auto_265269 ?auto_265270 ) ) ( not ( = ?auto_265269 ?auto_265271 ) ) ( not ( = ?auto_265269 ?auto_265272 ) ) ( not ( = ?auto_265270 ?auto_265271 ) ) ( not ( = ?auto_265270 ?auto_265272 ) ) ( not ( = ?auto_265271 ?auto_265272 ) ) ( ON ?auto_265270 ?auto_265271 ) ( ON ?auto_265269 ?auto_265270 ) ( ON ?auto_265268 ?auto_265269 ) ( CLEAR ?auto_265266 ) ( ON ?auto_265267 ?auto_265268 ) ( CLEAR ?auto_265267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265264 ?auto_265265 ?auto_265266 ?auto_265267 )
      ( MAKE-8PILE ?auto_265264 ?auto_265265 ?auto_265266 ?auto_265267 ?auto_265268 ?auto_265269 ?auto_265270 ?auto_265271 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265281 - BLOCK
      ?auto_265282 - BLOCK
      ?auto_265283 - BLOCK
      ?auto_265284 - BLOCK
      ?auto_265285 - BLOCK
      ?auto_265286 - BLOCK
      ?auto_265287 - BLOCK
      ?auto_265288 - BLOCK
    )
    :vars
    (
      ?auto_265289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265288 ?auto_265289 ) ( ON-TABLE ?auto_265281 ) ( ON ?auto_265282 ?auto_265281 ) ( ON ?auto_265283 ?auto_265282 ) ( not ( = ?auto_265281 ?auto_265282 ) ) ( not ( = ?auto_265281 ?auto_265283 ) ) ( not ( = ?auto_265281 ?auto_265284 ) ) ( not ( = ?auto_265281 ?auto_265285 ) ) ( not ( = ?auto_265281 ?auto_265286 ) ) ( not ( = ?auto_265281 ?auto_265287 ) ) ( not ( = ?auto_265281 ?auto_265288 ) ) ( not ( = ?auto_265281 ?auto_265289 ) ) ( not ( = ?auto_265282 ?auto_265283 ) ) ( not ( = ?auto_265282 ?auto_265284 ) ) ( not ( = ?auto_265282 ?auto_265285 ) ) ( not ( = ?auto_265282 ?auto_265286 ) ) ( not ( = ?auto_265282 ?auto_265287 ) ) ( not ( = ?auto_265282 ?auto_265288 ) ) ( not ( = ?auto_265282 ?auto_265289 ) ) ( not ( = ?auto_265283 ?auto_265284 ) ) ( not ( = ?auto_265283 ?auto_265285 ) ) ( not ( = ?auto_265283 ?auto_265286 ) ) ( not ( = ?auto_265283 ?auto_265287 ) ) ( not ( = ?auto_265283 ?auto_265288 ) ) ( not ( = ?auto_265283 ?auto_265289 ) ) ( not ( = ?auto_265284 ?auto_265285 ) ) ( not ( = ?auto_265284 ?auto_265286 ) ) ( not ( = ?auto_265284 ?auto_265287 ) ) ( not ( = ?auto_265284 ?auto_265288 ) ) ( not ( = ?auto_265284 ?auto_265289 ) ) ( not ( = ?auto_265285 ?auto_265286 ) ) ( not ( = ?auto_265285 ?auto_265287 ) ) ( not ( = ?auto_265285 ?auto_265288 ) ) ( not ( = ?auto_265285 ?auto_265289 ) ) ( not ( = ?auto_265286 ?auto_265287 ) ) ( not ( = ?auto_265286 ?auto_265288 ) ) ( not ( = ?auto_265286 ?auto_265289 ) ) ( not ( = ?auto_265287 ?auto_265288 ) ) ( not ( = ?auto_265287 ?auto_265289 ) ) ( not ( = ?auto_265288 ?auto_265289 ) ) ( ON ?auto_265287 ?auto_265288 ) ( ON ?auto_265286 ?auto_265287 ) ( ON ?auto_265285 ?auto_265286 ) ( CLEAR ?auto_265283 ) ( ON ?auto_265284 ?auto_265285 ) ( CLEAR ?auto_265284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265281 ?auto_265282 ?auto_265283 ?auto_265284 )
      ( MAKE-8PILE ?auto_265281 ?auto_265282 ?auto_265283 ?auto_265284 ?auto_265285 ?auto_265286 ?auto_265287 ?auto_265288 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265298 - BLOCK
      ?auto_265299 - BLOCK
      ?auto_265300 - BLOCK
      ?auto_265301 - BLOCK
      ?auto_265302 - BLOCK
      ?auto_265303 - BLOCK
      ?auto_265304 - BLOCK
      ?auto_265305 - BLOCK
    )
    :vars
    (
      ?auto_265306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265305 ?auto_265306 ) ( ON-TABLE ?auto_265298 ) ( ON ?auto_265299 ?auto_265298 ) ( not ( = ?auto_265298 ?auto_265299 ) ) ( not ( = ?auto_265298 ?auto_265300 ) ) ( not ( = ?auto_265298 ?auto_265301 ) ) ( not ( = ?auto_265298 ?auto_265302 ) ) ( not ( = ?auto_265298 ?auto_265303 ) ) ( not ( = ?auto_265298 ?auto_265304 ) ) ( not ( = ?auto_265298 ?auto_265305 ) ) ( not ( = ?auto_265298 ?auto_265306 ) ) ( not ( = ?auto_265299 ?auto_265300 ) ) ( not ( = ?auto_265299 ?auto_265301 ) ) ( not ( = ?auto_265299 ?auto_265302 ) ) ( not ( = ?auto_265299 ?auto_265303 ) ) ( not ( = ?auto_265299 ?auto_265304 ) ) ( not ( = ?auto_265299 ?auto_265305 ) ) ( not ( = ?auto_265299 ?auto_265306 ) ) ( not ( = ?auto_265300 ?auto_265301 ) ) ( not ( = ?auto_265300 ?auto_265302 ) ) ( not ( = ?auto_265300 ?auto_265303 ) ) ( not ( = ?auto_265300 ?auto_265304 ) ) ( not ( = ?auto_265300 ?auto_265305 ) ) ( not ( = ?auto_265300 ?auto_265306 ) ) ( not ( = ?auto_265301 ?auto_265302 ) ) ( not ( = ?auto_265301 ?auto_265303 ) ) ( not ( = ?auto_265301 ?auto_265304 ) ) ( not ( = ?auto_265301 ?auto_265305 ) ) ( not ( = ?auto_265301 ?auto_265306 ) ) ( not ( = ?auto_265302 ?auto_265303 ) ) ( not ( = ?auto_265302 ?auto_265304 ) ) ( not ( = ?auto_265302 ?auto_265305 ) ) ( not ( = ?auto_265302 ?auto_265306 ) ) ( not ( = ?auto_265303 ?auto_265304 ) ) ( not ( = ?auto_265303 ?auto_265305 ) ) ( not ( = ?auto_265303 ?auto_265306 ) ) ( not ( = ?auto_265304 ?auto_265305 ) ) ( not ( = ?auto_265304 ?auto_265306 ) ) ( not ( = ?auto_265305 ?auto_265306 ) ) ( ON ?auto_265304 ?auto_265305 ) ( ON ?auto_265303 ?auto_265304 ) ( ON ?auto_265302 ?auto_265303 ) ( ON ?auto_265301 ?auto_265302 ) ( CLEAR ?auto_265299 ) ( ON ?auto_265300 ?auto_265301 ) ( CLEAR ?auto_265300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265298 ?auto_265299 ?auto_265300 )
      ( MAKE-8PILE ?auto_265298 ?auto_265299 ?auto_265300 ?auto_265301 ?auto_265302 ?auto_265303 ?auto_265304 ?auto_265305 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265315 - BLOCK
      ?auto_265316 - BLOCK
      ?auto_265317 - BLOCK
      ?auto_265318 - BLOCK
      ?auto_265319 - BLOCK
      ?auto_265320 - BLOCK
      ?auto_265321 - BLOCK
      ?auto_265322 - BLOCK
    )
    :vars
    (
      ?auto_265323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265322 ?auto_265323 ) ( ON-TABLE ?auto_265315 ) ( ON ?auto_265316 ?auto_265315 ) ( not ( = ?auto_265315 ?auto_265316 ) ) ( not ( = ?auto_265315 ?auto_265317 ) ) ( not ( = ?auto_265315 ?auto_265318 ) ) ( not ( = ?auto_265315 ?auto_265319 ) ) ( not ( = ?auto_265315 ?auto_265320 ) ) ( not ( = ?auto_265315 ?auto_265321 ) ) ( not ( = ?auto_265315 ?auto_265322 ) ) ( not ( = ?auto_265315 ?auto_265323 ) ) ( not ( = ?auto_265316 ?auto_265317 ) ) ( not ( = ?auto_265316 ?auto_265318 ) ) ( not ( = ?auto_265316 ?auto_265319 ) ) ( not ( = ?auto_265316 ?auto_265320 ) ) ( not ( = ?auto_265316 ?auto_265321 ) ) ( not ( = ?auto_265316 ?auto_265322 ) ) ( not ( = ?auto_265316 ?auto_265323 ) ) ( not ( = ?auto_265317 ?auto_265318 ) ) ( not ( = ?auto_265317 ?auto_265319 ) ) ( not ( = ?auto_265317 ?auto_265320 ) ) ( not ( = ?auto_265317 ?auto_265321 ) ) ( not ( = ?auto_265317 ?auto_265322 ) ) ( not ( = ?auto_265317 ?auto_265323 ) ) ( not ( = ?auto_265318 ?auto_265319 ) ) ( not ( = ?auto_265318 ?auto_265320 ) ) ( not ( = ?auto_265318 ?auto_265321 ) ) ( not ( = ?auto_265318 ?auto_265322 ) ) ( not ( = ?auto_265318 ?auto_265323 ) ) ( not ( = ?auto_265319 ?auto_265320 ) ) ( not ( = ?auto_265319 ?auto_265321 ) ) ( not ( = ?auto_265319 ?auto_265322 ) ) ( not ( = ?auto_265319 ?auto_265323 ) ) ( not ( = ?auto_265320 ?auto_265321 ) ) ( not ( = ?auto_265320 ?auto_265322 ) ) ( not ( = ?auto_265320 ?auto_265323 ) ) ( not ( = ?auto_265321 ?auto_265322 ) ) ( not ( = ?auto_265321 ?auto_265323 ) ) ( not ( = ?auto_265322 ?auto_265323 ) ) ( ON ?auto_265321 ?auto_265322 ) ( ON ?auto_265320 ?auto_265321 ) ( ON ?auto_265319 ?auto_265320 ) ( ON ?auto_265318 ?auto_265319 ) ( CLEAR ?auto_265316 ) ( ON ?auto_265317 ?auto_265318 ) ( CLEAR ?auto_265317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265315 ?auto_265316 ?auto_265317 )
      ( MAKE-8PILE ?auto_265315 ?auto_265316 ?auto_265317 ?auto_265318 ?auto_265319 ?auto_265320 ?auto_265321 ?auto_265322 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265332 - BLOCK
      ?auto_265333 - BLOCK
      ?auto_265334 - BLOCK
      ?auto_265335 - BLOCK
      ?auto_265336 - BLOCK
      ?auto_265337 - BLOCK
      ?auto_265338 - BLOCK
      ?auto_265339 - BLOCK
    )
    :vars
    (
      ?auto_265340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265339 ?auto_265340 ) ( ON-TABLE ?auto_265332 ) ( not ( = ?auto_265332 ?auto_265333 ) ) ( not ( = ?auto_265332 ?auto_265334 ) ) ( not ( = ?auto_265332 ?auto_265335 ) ) ( not ( = ?auto_265332 ?auto_265336 ) ) ( not ( = ?auto_265332 ?auto_265337 ) ) ( not ( = ?auto_265332 ?auto_265338 ) ) ( not ( = ?auto_265332 ?auto_265339 ) ) ( not ( = ?auto_265332 ?auto_265340 ) ) ( not ( = ?auto_265333 ?auto_265334 ) ) ( not ( = ?auto_265333 ?auto_265335 ) ) ( not ( = ?auto_265333 ?auto_265336 ) ) ( not ( = ?auto_265333 ?auto_265337 ) ) ( not ( = ?auto_265333 ?auto_265338 ) ) ( not ( = ?auto_265333 ?auto_265339 ) ) ( not ( = ?auto_265333 ?auto_265340 ) ) ( not ( = ?auto_265334 ?auto_265335 ) ) ( not ( = ?auto_265334 ?auto_265336 ) ) ( not ( = ?auto_265334 ?auto_265337 ) ) ( not ( = ?auto_265334 ?auto_265338 ) ) ( not ( = ?auto_265334 ?auto_265339 ) ) ( not ( = ?auto_265334 ?auto_265340 ) ) ( not ( = ?auto_265335 ?auto_265336 ) ) ( not ( = ?auto_265335 ?auto_265337 ) ) ( not ( = ?auto_265335 ?auto_265338 ) ) ( not ( = ?auto_265335 ?auto_265339 ) ) ( not ( = ?auto_265335 ?auto_265340 ) ) ( not ( = ?auto_265336 ?auto_265337 ) ) ( not ( = ?auto_265336 ?auto_265338 ) ) ( not ( = ?auto_265336 ?auto_265339 ) ) ( not ( = ?auto_265336 ?auto_265340 ) ) ( not ( = ?auto_265337 ?auto_265338 ) ) ( not ( = ?auto_265337 ?auto_265339 ) ) ( not ( = ?auto_265337 ?auto_265340 ) ) ( not ( = ?auto_265338 ?auto_265339 ) ) ( not ( = ?auto_265338 ?auto_265340 ) ) ( not ( = ?auto_265339 ?auto_265340 ) ) ( ON ?auto_265338 ?auto_265339 ) ( ON ?auto_265337 ?auto_265338 ) ( ON ?auto_265336 ?auto_265337 ) ( ON ?auto_265335 ?auto_265336 ) ( ON ?auto_265334 ?auto_265335 ) ( CLEAR ?auto_265332 ) ( ON ?auto_265333 ?auto_265334 ) ( CLEAR ?auto_265333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265332 ?auto_265333 )
      ( MAKE-8PILE ?auto_265332 ?auto_265333 ?auto_265334 ?auto_265335 ?auto_265336 ?auto_265337 ?auto_265338 ?auto_265339 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265349 - BLOCK
      ?auto_265350 - BLOCK
      ?auto_265351 - BLOCK
      ?auto_265352 - BLOCK
      ?auto_265353 - BLOCK
      ?auto_265354 - BLOCK
      ?auto_265355 - BLOCK
      ?auto_265356 - BLOCK
    )
    :vars
    (
      ?auto_265357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265356 ?auto_265357 ) ( ON-TABLE ?auto_265349 ) ( not ( = ?auto_265349 ?auto_265350 ) ) ( not ( = ?auto_265349 ?auto_265351 ) ) ( not ( = ?auto_265349 ?auto_265352 ) ) ( not ( = ?auto_265349 ?auto_265353 ) ) ( not ( = ?auto_265349 ?auto_265354 ) ) ( not ( = ?auto_265349 ?auto_265355 ) ) ( not ( = ?auto_265349 ?auto_265356 ) ) ( not ( = ?auto_265349 ?auto_265357 ) ) ( not ( = ?auto_265350 ?auto_265351 ) ) ( not ( = ?auto_265350 ?auto_265352 ) ) ( not ( = ?auto_265350 ?auto_265353 ) ) ( not ( = ?auto_265350 ?auto_265354 ) ) ( not ( = ?auto_265350 ?auto_265355 ) ) ( not ( = ?auto_265350 ?auto_265356 ) ) ( not ( = ?auto_265350 ?auto_265357 ) ) ( not ( = ?auto_265351 ?auto_265352 ) ) ( not ( = ?auto_265351 ?auto_265353 ) ) ( not ( = ?auto_265351 ?auto_265354 ) ) ( not ( = ?auto_265351 ?auto_265355 ) ) ( not ( = ?auto_265351 ?auto_265356 ) ) ( not ( = ?auto_265351 ?auto_265357 ) ) ( not ( = ?auto_265352 ?auto_265353 ) ) ( not ( = ?auto_265352 ?auto_265354 ) ) ( not ( = ?auto_265352 ?auto_265355 ) ) ( not ( = ?auto_265352 ?auto_265356 ) ) ( not ( = ?auto_265352 ?auto_265357 ) ) ( not ( = ?auto_265353 ?auto_265354 ) ) ( not ( = ?auto_265353 ?auto_265355 ) ) ( not ( = ?auto_265353 ?auto_265356 ) ) ( not ( = ?auto_265353 ?auto_265357 ) ) ( not ( = ?auto_265354 ?auto_265355 ) ) ( not ( = ?auto_265354 ?auto_265356 ) ) ( not ( = ?auto_265354 ?auto_265357 ) ) ( not ( = ?auto_265355 ?auto_265356 ) ) ( not ( = ?auto_265355 ?auto_265357 ) ) ( not ( = ?auto_265356 ?auto_265357 ) ) ( ON ?auto_265355 ?auto_265356 ) ( ON ?auto_265354 ?auto_265355 ) ( ON ?auto_265353 ?auto_265354 ) ( ON ?auto_265352 ?auto_265353 ) ( ON ?auto_265351 ?auto_265352 ) ( CLEAR ?auto_265349 ) ( ON ?auto_265350 ?auto_265351 ) ( CLEAR ?auto_265350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265349 ?auto_265350 )
      ( MAKE-8PILE ?auto_265349 ?auto_265350 ?auto_265351 ?auto_265352 ?auto_265353 ?auto_265354 ?auto_265355 ?auto_265356 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265366 - BLOCK
      ?auto_265367 - BLOCK
      ?auto_265368 - BLOCK
      ?auto_265369 - BLOCK
      ?auto_265370 - BLOCK
      ?auto_265371 - BLOCK
      ?auto_265372 - BLOCK
      ?auto_265373 - BLOCK
    )
    :vars
    (
      ?auto_265374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265373 ?auto_265374 ) ( not ( = ?auto_265366 ?auto_265367 ) ) ( not ( = ?auto_265366 ?auto_265368 ) ) ( not ( = ?auto_265366 ?auto_265369 ) ) ( not ( = ?auto_265366 ?auto_265370 ) ) ( not ( = ?auto_265366 ?auto_265371 ) ) ( not ( = ?auto_265366 ?auto_265372 ) ) ( not ( = ?auto_265366 ?auto_265373 ) ) ( not ( = ?auto_265366 ?auto_265374 ) ) ( not ( = ?auto_265367 ?auto_265368 ) ) ( not ( = ?auto_265367 ?auto_265369 ) ) ( not ( = ?auto_265367 ?auto_265370 ) ) ( not ( = ?auto_265367 ?auto_265371 ) ) ( not ( = ?auto_265367 ?auto_265372 ) ) ( not ( = ?auto_265367 ?auto_265373 ) ) ( not ( = ?auto_265367 ?auto_265374 ) ) ( not ( = ?auto_265368 ?auto_265369 ) ) ( not ( = ?auto_265368 ?auto_265370 ) ) ( not ( = ?auto_265368 ?auto_265371 ) ) ( not ( = ?auto_265368 ?auto_265372 ) ) ( not ( = ?auto_265368 ?auto_265373 ) ) ( not ( = ?auto_265368 ?auto_265374 ) ) ( not ( = ?auto_265369 ?auto_265370 ) ) ( not ( = ?auto_265369 ?auto_265371 ) ) ( not ( = ?auto_265369 ?auto_265372 ) ) ( not ( = ?auto_265369 ?auto_265373 ) ) ( not ( = ?auto_265369 ?auto_265374 ) ) ( not ( = ?auto_265370 ?auto_265371 ) ) ( not ( = ?auto_265370 ?auto_265372 ) ) ( not ( = ?auto_265370 ?auto_265373 ) ) ( not ( = ?auto_265370 ?auto_265374 ) ) ( not ( = ?auto_265371 ?auto_265372 ) ) ( not ( = ?auto_265371 ?auto_265373 ) ) ( not ( = ?auto_265371 ?auto_265374 ) ) ( not ( = ?auto_265372 ?auto_265373 ) ) ( not ( = ?auto_265372 ?auto_265374 ) ) ( not ( = ?auto_265373 ?auto_265374 ) ) ( ON ?auto_265372 ?auto_265373 ) ( ON ?auto_265371 ?auto_265372 ) ( ON ?auto_265370 ?auto_265371 ) ( ON ?auto_265369 ?auto_265370 ) ( ON ?auto_265368 ?auto_265369 ) ( ON ?auto_265367 ?auto_265368 ) ( ON ?auto_265366 ?auto_265367 ) ( CLEAR ?auto_265366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265366 )
      ( MAKE-8PILE ?auto_265366 ?auto_265367 ?auto_265368 ?auto_265369 ?auto_265370 ?auto_265371 ?auto_265372 ?auto_265373 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_265383 - BLOCK
      ?auto_265384 - BLOCK
      ?auto_265385 - BLOCK
      ?auto_265386 - BLOCK
      ?auto_265387 - BLOCK
      ?auto_265388 - BLOCK
      ?auto_265389 - BLOCK
      ?auto_265390 - BLOCK
    )
    :vars
    (
      ?auto_265391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265390 ?auto_265391 ) ( not ( = ?auto_265383 ?auto_265384 ) ) ( not ( = ?auto_265383 ?auto_265385 ) ) ( not ( = ?auto_265383 ?auto_265386 ) ) ( not ( = ?auto_265383 ?auto_265387 ) ) ( not ( = ?auto_265383 ?auto_265388 ) ) ( not ( = ?auto_265383 ?auto_265389 ) ) ( not ( = ?auto_265383 ?auto_265390 ) ) ( not ( = ?auto_265383 ?auto_265391 ) ) ( not ( = ?auto_265384 ?auto_265385 ) ) ( not ( = ?auto_265384 ?auto_265386 ) ) ( not ( = ?auto_265384 ?auto_265387 ) ) ( not ( = ?auto_265384 ?auto_265388 ) ) ( not ( = ?auto_265384 ?auto_265389 ) ) ( not ( = ?auto_265384 ?auto_265390 ) ) ( not ( = ?auto_265384 ?auto_265391 ) ) ( not ( = ?auto_265385 ?auto_265386 ) ) ( not ( = ?auto_265385 ?auto_265387 ) ) ( not ( = ?auto_265385 ?auto_265388 ) ) ( not ( = ?auto_265385 ?auto_265389 ) ) ( not ( = ?auto_265385 ?auto_265390 ) ) ( not ( = ?auto_265385 ?auto_265391 ) ) ( not ( = ?auto_265386 ?auto_265387 ) ) ( not ( = ?auto_265386 ?auto_265388 ) ) ( not ( = ?auto_265386 ?auto_265389 ) ) ( not ( = ?auto_265386 ?auto_265390 ) ) ( not ( = ?auto_265386 ?auto_265391 ) ) ( not ( = ?auto_265387 ?auto_265388 ) ) ( not ( = ?auto_265387 ?auto_265389 ) ) ( not ( = ?auto_265387 ?auto_265390 ) ) ( not ( = ?auto_265387 ?auto_265391 ) ) ( not ( = ?auto_265388 ?auto_265389 ) ) ( not ( = ?auto_265388 ?auto_265390 ) ) ( not ( = ?auto_265388 ?auto_265391 ) ) ( not ( = ?auto_265389 ?auto_265390 ) ) ( not ( = ?auto_265389 ?auto_265391 ) ) ( not ( = ?auto_265390 ?auto_265391 ) ) ( ON ?auto_265389 ?auto_265390 ) ( ON ?auto_265388 ?auto_265389 ) ( ON ?auto_265387 ?auto_265388 ) ( ON ?auto_265386 ?auto_265387 ) ( ON ?auto_265385 ?auto_265386 ) ( ON ?auto_265384 ?auto_265385 ) ( ON ?auto_265383 ?auto_265384 ) ( CLEAR ?auto_265383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265383 )
      ( MAKE-8PILE ?auto_265383 ?auto_265384 ?auto_265385 ?auto_265386 ?auto_265387 ?auto_265388 ?auto_265389 ?auto_265390 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265401 - BLOCK
      ?auto_265402 - BLOCK
      ?auto_265403 - BLOCK
      ?auto_265404 - BLOCK
      ?auto_265405 - BLOCK
      ?auto_265406 - BLOCK
      ?auto_265407 - BLOCK
      ?auto_265408 - BLOCK
      ?auto_265409 - BLOCK
    )
    :vars
    (
      ?auto_265410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265408 ) ( ON ?auto_265409 ?auto_265410 ) ( CLEAR ?auto_265409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265401 ) ( ON ?auto_265402 ?auto_265401 ) ( ON ?auto_265403 ?auto_265402 ) ( ON ?auto_265404 ?auto_265403 ) ( ON ?auto_265405 ?auto_265404 ) ( ON ?auto_265406 ?auto_265405 ) ( ON ?auto_265407 ?auto_265406 ) ( ON ?auto_265408 ?auto_265407 ) ( not ( = ?auto_265401 ?auto_265402 ) ) ( not ( = ?auto_265401 ?auto_265403 ) ) ( not ( = ?auto_265401 ?auto_265404 ) ) ( not ( = ?auto_265401 ?auto_265405 ) ) ( not ( = ?auto_265401 ?auto_265406 ) ) ( not ( = ?auto_265401 ?auto_265407 ) ) ( not ( = ?auto_265401 ?auto_265408 ) ) ( not ( = ?auto_265401 ?auto_265409 ) ) ( not ( = ?auto_265401 ?auto_265410 ) ) ( not ( = ?auto_265402 ?auto_265403 ) ) ( not ( = ?auto_265402 ?auto_265404 ) ) ( not ( = ?auto_265402 ?auto_265405 ) ) ( not ( = ?auto_265402 ?auto_265406 ) ) ( not ( = ?auto_265402 ?auto_265407 ) ) ( not ( = ?auto_265402 ?auto_265408 ) ) ( not ( = ?auto_265402 ?auto_265409 ) ) ( not ( = ?auto_265402 ?auto_265410 ) ) ( not ( = ?auto_265403 ?auto_265404 ) ) ( not ( = ?auto_265403 ?auto_265405 ) ) ( not ( = ?auto_265403 ?auto_265406 ) ) ( not ( = ?auto_265403 ?auto_265407 ) ) ( not ( = ?auto_265403 ?auto_265408 ) ) ( not ( = ?auto_265403 ?auto_265409 ) ) ( not ( = ?auto_265403 ?auto_265410 ) ) ( not ( = ?auto_265404 ?auto_265405 ) ) ( not ( = ?auto_265404 ?auto_265406 ) ) ( not ( = ?auto_265404 ?auto_265407 ) ) ( not ( = ?auto_265404 ?auto_265408 ) ) ( not ( = ?auto_265404 ?auto_265409 ) ) ( not ( = ?auto_265404 ?auto_265410 ) ) ( not ( = ?auto_265405 ?auto_265406 ) ) ( not ( = ?auto_265405 ?auto_265407 ) ) ( not ( = ?auto_265405 ?auto_265408 ) ) ( not ( = ?auto_265405 ?auto_265409 ) ) ( not ( = ?auto_265405 ?auto_265410 ) ) ( not ( = ?auto_265406 ?auto_265407 ) ) ( not ( = ?auto_265406 ?auto_265408 ) ) ( not ( = ?auto_265406 ?auto_265409 ) ) ( not ( = ?auto_265406 ?auto_265410 ) ) ( not ( = ?auto_265407 ?auto_265408 ) ) ( not ( = ?auto_265407 ?auto_265409 ) ) ( not ( = ?auto_265407 ?auto_265410 ) ) ( not ( = ?auto_265408 ?auto_265409 ) ) ( not ( = ?auto_265408 ?auto_265410 ) ) ( not ( = ?auto_265409 ?auto_265410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265409 ?auto_265410 )
      ( !STACK ?auto_265409 ?auto_265408 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265420 - BLOCK
      ?auto_265421 - BLOCK
      ?auto_265422 - BLOCK
      ?auto_265423 - BLOCK
      ?auto_265424 - BLOCK
      ?auto_265425 - BLOCK
      ?auto_265426 - BLOCK
      ?auto_265427 - BLOCK
      ?auto_265428 - BLOCK
    )
    :vars
    (
      ?auto_265429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265427 ) ( ON ?auto_265428 ?auto_265429 ) ( CLEAR ?auto_265428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265420 ) ( ON ?auto_265421 ?auto_265420 ) ( ON ?auto_265422 ?auto_265421 ) ( ON ?auto_265423 ?auto_265422 ) ( ON ?auto_265424 ?auto_265423 ) ( ON ?auto_265425 ?auto_265424 ) ( ON ?auto_265426 ?auto_265425 ) ( ON ?auto_265427 ?auto_265426 ) ( not ( = ?auto_265420 ?auto_265421 ) ) ( not ( = ?auto_265420 ?auto_265422 ) ) ( not ( = ?auto_265420 ?auto_265423 ) ) ( not ( = ?auto_265420 ?auto_265424 ) ) ( not ( = ?auto_265420 ?auto_265425 ) ) ( not ( = ?auto_265420 ?auto_265426 ) ) ( not ( = ?auto_265420 ?auto_265427 ) ) ( not ( = ?auto_265420 ?auto_265428 ) ) ( not ( = ?auto_265420 ?auto_265429 ) ) ( not ( = ?auto_265421 ?auto_265422 ) ) ( not ( = ?auto_265421 ?auto_265423 ) ) ( not ( = ?auto_265421 ?auto_265424 ) ) ( not ( = ?auto_265421 ?auto_265425 ) ) ( not ( = ?auto_265421 ?auto_265426 ) ) ( not ( = ?auto_265421 ?auto_265427 ) ) ( not ( = ?auto_265421 ?auto_265428 ) ) ( not ( = ?auto_265421 ?auto_265429 ) ) ( not ( = ?auto_265422 ?auto_265423 ) ) ( not ( = ?auto_265422 ?auto_265424 ) ) ( not ( = ?auto_265422 ?auto_265425 ) ) ( not ( = ?auto_265422 ?auto_265426 ) ) ( not ( = ?auto_265422 ?auto_265427 ) ) ( not ( = ?auto_265422 ?auto_265428 ) ) ( not ( = ?auto_265422 ?auto_265429 ) ) ( not ( = ?auto_265423 ?auto_265424 ) ) ( not ( = ?auto_265423 ?auto_265425 ) ) ( not ( = ?auto_265423 ?auto_265426 ) ) ( not ( = ?auto_265423 ?auto_265427 ) ) ( not ( = ?auto_265423 ?auto_265428 ) ) ( not ( = ?auto_265423 ?auto_265429 ) ) ( not ( = ?auto_265424 ?auto_265425 ) ) ( not ( = ?auto_265424 ?auto_265426 ) ) ( not ( = ?auto_265424 ?auto_265427 ) ) ( not ( = ?auto_265424 ?auto_265428 ) ) ( not ( = ?auto_265424 ?auto_265429 ) ) ( not ( = ?auto_265425 ?auto_265426 ) ) ( not ( = ?auto_265425 ?auto_265427 ) ) ( not ( = ?auto_265425 ?auto_265428 ) ) ( not ( = ?auto_265425 ?auto_265429 ) ) ( not ( = ?auto_265426 ?auto_265427 ) ) ( not ( = ?auto_265426 ?auto_265428 ) ) ( not ( = ?auto_265426 ?auto_265429 ) ) ( not ( = ?auto_265427 ?auto_265428 ) ) ( not ( = ?auto_265427 ?auto_265429 ) ) ( not ( = ?auto_265428 ?auto_265429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265428 ?auto_265429 )
      ( !STACK ?auto_265428 ?auto_265427 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265439 - BLOCK
      ?auto_265440 - BLOCK
      ?auto_265441 - BLOCK
      ?auto_265442 - BLOCK
      ?auto_265443 - BLOCK
      ?auto_265444 - BLOCK
      ?auto_265445 - BLOCK
      ?auto_265446 - BLOCK
      ?auto_265447 - BLOCK
    )
    :vars
    (
      ?auto_265448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265447 ?auto_265448 ) ( ON-TABLE ?auto_265439 ) ( ON ?auto_265440 ?auto_265439 ) ( ON ?auto_265441 ?auto_265440 ) ( ON ?auto_265442 ?auto_265441 ) ( ON ?auto_265443 ?auto_265442 ) ( ON ?auto_265444 ?auto_265443 ) ( ON ?auto_265445 ?auto_265444 ) ( not ( = ?auto_265439 ?auto_265440 ) ) ( not ( = ?auto_265439 ?auto_265441 ) ) ( not ( = ?auto_265439 ?auto_265442 ) ) ( not ( = ?auto_265439 ?auto_265443 ) ) ( not ( = ?auto_265439 ?auto_265444 ) ) ( not ( = ?auto_265439 ?auto_265445 ) ) ( not ( = ?auto_265439 ?auto_265446 ) ) ( not ( = ?auto_265439 ?auto_265447 ) ) ( not ( = ?auto_265439 ?auto_265448 ) ) ( not ( = ?auto_265440 ?auto_265441 ) ) ( not ( = ?auto_265440 ?auto_265442 ) ) ( not ( = ?auto_265440 ?auto_265443 ) ) ( not ( = ?auto_265440 ?auto_265444 ) ) ( not ( = ?auto_265440 ?auto_265445 ) ) ( not ( = ?auto_265440 ?auto_265446 ) ) ( not ( = ?auto_265440 ?auto_265447 ) ) ( not ( = ?auto_265440 ?auto_265448 ) ) ( not ( = ?auto_265441 ?auto_265442 ) ) ( not ( = ?auto_265441 ?auto_265443 ) ) ( not ( = ?auto_265441 ?auto_265444 ) ) ( not ( = ?auto_265441 ?auto_265445 ) ) ( not ( = ?auto_265441 ?auto_265446 ) ) ( not ( = ?auto_265441 ?auto_265447 ) ) ( not ( = ?auto_265441 ?auto_265448 ) ) ( not ( = ?auto_265442 ?auto_265443 ) ) ( not ( = ?auto_265442 ?auto_265444 ) ) ( not ( = ?auto_265442 ?auto_265445 ) ) ( not ( = ?auto_265442 ?auto_265446 ) ) ( not ( = ?auto_265442 ?auto_265447 ) ) ( not ( = ?auto_265442 ?auto_265448 ) ) ( not ( = ?auto_265443 ?auto_265444 ) ) ( not ( = ?auto_265443 ?auto_265445 ) ) ( not ( = ?auto_265443 ?auto_265446 ) ) ( not ( = ?auto_265443 ?auto_265447 ) ) ( not ( = ?auto_265443 ?auto_265448 ) ) ( not ( = ?auto_265444 ?auto_265445 ) ) ( not ( = ?auto_265444 ?auto_265446 ) ) ( not ( = ?auto_265444 ?auto_265447 ) ) ( not ( = ?auto_265444 ?auto_265448 ) ) ( not ( = ?auto_265445 ?auto_265446 ) ) ( not ( = ?auto_265445 ?auto_265447 ) ) ( not ( = ?auto_265445 ?auto_265448 ) ) ( not ( = ?auto_265446 ?auto_265447 ) ) ( not ( = ?auto_265446 ?auto_265448 ) ) ( not ( = ?auto_265447 ?auto_265448 ) ) ( CLEAR ?auto_265445 ) ( ON ?auto_265446 ?auto_265447 ) ( CLEAR ?auto_265446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_265439 ?auto_265440 ?auto_265441 ?auto_265442 ?auto_265443 ?auto_265444 ?auto_265445 ?auto_265446 )
      ( MAKE-9PILE ?auto_265439 ?auto_265440 ?auto_265441 ?auto_265442 ?auto_265443 ?auto_265444 ?auto_265445 ?auto_265446 ?auto_265447 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265458 - BLOCK
      ?auto_265459 - BLOCK
      ?auto_265460 - BLOCK
      ?auto_265461 - BLOCK
      ?auto_265462 - BLOCK
      ?auto_265463 - BLOCK
      ?auto_265464 - BLOCK
      ?auto_265465 - BLOCK
      ?auto_265466 - BLOCK
    )
    :vars
    (
      ?auto_265467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265466 ?auto_265467 ) ( ON-TABLE ?auto_265458 ) ( ON ?auto_265459 ?auto_265458 ) ( ON ?auto_265460 ?auto_265459 ) ( ON ?auto_265461 ?auto_265460 ) ( ON ?auto_265462 ?auto_265461 ) ( ON ?auto_265463 ?auto_265462 ) ( ON ?auto_265464 ?auto_265463 ) ( not ( = ?auto_265458 ?auto_265459 ) ) ( not ( = ?auto_265458 ?auto_265460 ) ) ( not ( = ?auto_265458 ?auto_265461 ) ) ( not ( = ?auto_265458 ?auto_265462 ) ) ( not ( = ?auto_265458 ?auto_265463 ) ) ( not ( = ?auto_265458 ?auto_265464 ) ) ( not ( = ?auto_265458 ?auto_265465 ) ) ( not ( = ?auto_265458 ?auto_265466 ) ) ( not ( = ?auto_265458 ?auto_265467 ) ) ( not ( = ?auto_265459 ?auto_265460 ) ) ( not ( = ?auto_265459 ?auto_265461 ) ) ( not ( = ?auto_265459 ?auto_265462 ) ) ( not ( = ?auto_265459 ?auto_265463 ) ) ( not ( = ?auto_265459 ?auto_265464 ) ) ( not ( = ?auto_265459 ?auto_265465 ) ) ( not ( = ?auto_265459 ?auto_265466 ) ) ( not ( = ?auto_265459 ?auto_265467 ) ) ( not ( = ?auto_265460 ?auto_265461 ) ) ( not ( = ?auto_265460 ?auto_265462 ) ) ( not ( = ?auto_265460 ?auto_265463 ) ) ( not ( = ?auto_265460 ?auto_265464 ) ) ( not ( = ?auto_265460 ?auto_265465 ) ) ( not ( = ?auto_265460 ?auto_265466 ) ) ( not ( = ?auto_265460 ?auto_265467 ) ) ( not ( = ?auto_265461 ?auto_265462 ) ) ( not ( = ?auto_265461 ?auto_265463 ) ) ( not ( = ?auto_265461 ?auto_265464 ) ) ( not ( = ?auto_265461 ?auto_265465 ) ) ( not ( = ?auto_265461 ?auto_265466 ) ) ( not ( = ?auto_265461 ?auto_265467 ) ) ( not ( = ?auto_265462 ?auto_265463 ) ) ( not ( = ?auto_265462 ?auto_265464 ) ) ( not ( = ?auto_265462 ?auto_265465 ) ) ( not ( = ?auto_265462 ?auto_265466 ) ) ( not ( = ?auto_265462 ?auto_265467 ) ) ( not ( = ?auto_265463 ?auto_265464 ) ) ( not ( = ?auto_265463 ?auto_265465 ) ) ( not ( = ?auto_265463 ?auto_265466 ) ) ( not ( = ?auto_265463 ?auto_265467 ) ) ( not ( = ?auto_265464 ?auto_265465 ) ) ( not ( = ?auto_265464 ?auto_265466 ) ) ( not ( = ?auto_265464 ?auto_265467 ) ) ( not ( = ?auto_265465 ?auto_265466 ) ) ( not ( = ?auto_265465 ?auto_265467 ) ) ( not ( = ?auto_265466 ?auto_265467 ) ) ( CLEAR ?auto_265464 ) ( ON ?auto_265465 ?auto_265466 ) ( CLEAR ?auto_265465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_265458 ?auto_265459 ?auto_265460 ?auto_265461 ?auto_265462 ?auto_265463 ?auto_265464 ?auto_265465 )
      ( MAKE-9PILE ?auto_265458 ?auto_265459 ?auto_265460 ?auto_265461 ?auto_265462 ?auto_265463 ?auto_265464 ?auto_265465 ?auto_265466 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265477 - BLOCK
      ?auto_265478 - BLOCK
      ?auto_265479 - BLOCK
      ?auto_265480 - BLOCK
      ?auto_265481 - BLOCK
      ?auto_265482 - BLOCK
      ?auto_265483 - BLOCK
      ?auto_265484 - BLOCK
      ?auto_265485 - BLOCK
    )
    :vars
    (
      ?auto_265486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265485 ?auto_265486 ) ( ON-TABLE ?auto_265477 ) ( ON ?auto_265478 ?auto_265477 ) ( ON ?auto_265479 ?auto_265478 ) ( ON ?auto_265480 ?auto_265479 ) ( ON ?auto_265481 ?auto_265480 ) ( ON ?auto_265482 ?auto_265481 ) ( not ( = ?auto_265477 ?auto_265478 ) ) ( not ( = ?auto_265477 ?auto_265479 ) ) ( not ( = ?auto_265477 ?auto_265480 ) ) ( not ( = ?auto_265477 ?auto_265481 ) ) ( not ( = ?auto_265477 ?auto_265482 ) ) ( not ( = ?auto_265477 ?auto_265483 ) ) ( not ( = ?auto_265477 ?auto_265484 ) ) ( not ( = ?auto_265477 ?auto_265485 ) ) ( not ( = ?auto_265477 ?auto_265486 ) ) ( not ( = ?auto_265478 ?auto_265479 ) ) ( not ( = ?auto_265478 ?auto_265480 ) ) ( not ( = ?auto_265478 ?auto_265481 ) ) ( not ( = ?auto_265478 ?auto_265482 ) ) ( not ( = ?auto_265478 ?auto_265483 ) ) ( not ( = ?auto_265478 ?auto_265484 ) ) ( not ( = ?auto_265478 ?auto_265485 ) ) ( not ( = ?auto_265478 ?auto_265486 ) ) ( not ( = ?auto_265479 ?auto_265480 ) ) ( not ( = ?auto_265479 ?auto_265481 ) ) ( not ( = ?auto_265479 ?auto_265482 ) ) ( not ( = ?auto_265479 ?auto_265483 ) ) ( not ( = ?auto_265479 ?auto_265484 ) ) ( not ( = ?auto_265479 ?auto_265485 ) ) ( not ( = ?auto_265479 ?auto_265486 ) ) ( not ( = ?auto_265480 ?auto_265481 ) ) ( not ( = ?auto_265480 ?auto_265482 ) ) ( not ( = ?auto_265480 ?auto_265483 ) ) ( not ( = ?auto_265480 ?auto_265484 ) ) ( not ( = ?auto_265480 ?auto_265485 ) ) ( not ( = ?auto_265480 ?auto_265486 ) ) ( not ( = ?auto_265481 ?auto_265482 ) ) ( not ( = ?auto_265481 ?auto_265483 ) ) ( not ( = ?auto_265481 ?auto_265484 ) ) ( not ( = ?auto_265481 ?auto_265485 ) ) ( not ( = ?auto_265481 ?auto_265486 ) ) ( not ( = ?auto_265482 ?auto_265483 ) ) ( not ( = ?auto_265482 ?auto_265484 ) ) ( not ( = ?auto_265482 ?auto_265485 ) ) ( not ( = ?auto_265482 ?auto_265486 ) ) ( not ( = ?auto_265483 ?auto_265484 ) ) ( not ( = ?auto_265483 ?auto_265485 ) ) ( not ( = ?auto_265483 ?auto_265486 ) ) ( not ( = ?auto_265484 ?auto_265485 ) ) ( not ( = ?auto_265484 ?auto_265486 ) ) ( not ( = ?auto_265485 ?auto_265486 ) ) ( ON ?auto_265484 ?auto_265485 ) ( CLEAR ?auto_265482 ) ( ON ?auto_265483 ?auto_265484 ) ( CLEAR ?auto_265483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265477 ?auto_265478 ?auto_265479 ?auto_265480 ?auto_265481 ?auto_265482 ?auto_265483 )
      ( MAKE-9PILE ?auto_265477 ?auto_265478 ?auto_265479 ?auto_265480 ?auto_265481 ?auto_265482 ?auto_265483 ?auto_265484 ?auto_265485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265496 - BLOCK
      ?auto_265497 - BLOCK
      ?auto_265498 - BLOCK
      ?auto_265499 - BLOCK
      ?auto_265500 - BLOCK
      ?auto_265501 - BLOCK
      ?auto_265502 - BLOCK
      ?auto_265503 - BLOCK
      ?auto_265504 - BLOCK
    )
    :vars
    (
      ?auto_265505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265504 ?auto_265505 ) ( ON-TABLE ?auto_265496 ) ( ON ?auto_265497 ?auto_265496 ) ( ON ?auto_265498 ?auto_265497 ) ( ON ?auto_265499 ?auto_265498 ) ( ON ?auto_265500 ?auto_265499 ) ( ON ?auto_265501 ?auto_265500 ) ( not ( = ?auto_265496 ?auto_265497 ) ) ( not ( = ?auto_265496 ?auto_265498 ) ) ( not ( = ?auto_265496 ?auto_265499 ) ) ( not ( = ?auto_265496 ?auto_265500 ) ) ( not ( = ?auto_265496 ?auto_265501 ) ) ( not ( = ?auto_265496 ?auto_265502 ) ) ( not ( = ?auto_265496 ?auto_265503 ) ) ( not ( = ?auto_265496 ?auto_265504 ) ) ( not ( = ?auto_265496 ?auto_265505 ) ) ( not ( = ?auto_265497 ?auto_265498 ) ) ( not ( = ?auto_265497 ?auto_265499 ) ) ( not ( = ?auto_265497 ?auto_265500 ) ) ( not ( = ?auto_265497 ?auto_265501 ) ) ( not ( = ?auto_265497 ?auto_265502 ) ) ( not ( = ?auto_265497 ?auto_265503 ) ) ( not ( = ?auto_265497 ?auto_265504 ) ) ( not ( = ?auto_265497 ?auto_265505 ) ) ( not ( = ?auto_265498 ?auto_265499 ) ) ( not ( = ?auto_265498 ?auto_265500 ) ) ( not ( = ?auto_265498 ?auto_265501 ) ) ( not ( = ?auto_265498 ?auto_265502 ) ) ( not ( = ?auto_265498 ?auto_265503 ) ) ( not ( = ?auto_265498 ?auto_265504 ) ) ( not ( = ?auto_265498 ?auto_265505 ) ) ( not ( = ?auto_265499 ?auto_265500 ) ) ( not ( = ?auto_265499 ?auto_265501 ) ) ( not ( = ?auto_265499 ?auto_265502 ) ) ( not ( = ?auto_265499 ?auto_265503 ) ) ( not ( = ?auto_265499 ?auto_265504 ) ) ( not ( = ?auto_265499 ?auto_265505 ) ) ( not ( = ?auto_265500 ?auto_265501 ) ) ( not ( = ?auto_265500 ?auto_265502 ) ) ( not ( = ?auto_265500 ?auto_265503 ) ) ( not ( = ?auto_265500 ?auto_265504 ) ) ( not ( = ?auto_265500 ?auto_265505 ) ) ( not ( = ?auto_265501 ?auto_265502 ) ) ( not ( = ?auto_265501 ?auto_265503 ) ) ( not ( = ?auto_265501 ?auto_265504 ) ) ( not ( = ?auto_265501 ?auto_265505 ) ) ( not ( = ?auto_265502 ?auto_265503 ) ) ( not ( = ?auto_265502 ?auto_265504 ) ) ( not ( = ?auto_265502 ?auto_265505 ) ) ( not ( = ?auto_265503 ?auto_265504 ) ) ( not ( = ?auto_265503 ?auto_265505 ) ) ( not ( = ?auto_265504 ?auto_265505 ) ) ( ON ?auto_265503 ?auto_265504 ) ( CLEAR ?auto_265501 ) ( ON ?auto_265502 ?auto_265503 ) ( CLEAR ?auto_265502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265496 ?auto_265497 ?auto_265498 ?auto_265499 ?auto_265500 ?auto_265501 ?auto_265502 )
      ( MAKE-9PILE ?auto_265496 ?auto_265497 ?auto_265498 ?auto_265499 ?auto_265500 ?auto_265501 ?auto_265502 ?auto_265503 ?auto_265504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265515 - BLOCK
      ?auto_265516 - BLOCK
      ?auto_265517 - BLOCK
      ?auto_265518 - BLOCK
      ?auto_265519 - BLOCK
      ?auto_265520 - BLOCK
      ?auto_265521 - BLOCK
      ?auto_265522 - BLOCK
      ?auto_265523 - BLOCK
    )
    :vars
    (
      ?auto_265524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265523 ?auto_265524 ) ( ON-TABLE ?auto_265515 ) ( ON ?auto_265516 ?auto_265515 ) ( ON ?auto_265517 ?auto_265516 ) ( ON ?auto_265518 ?auto_265517 ) ( ON ?auto_265519 ?auto_265518 ) ( not ( = ?auto_265515 ?auto_265516 ) ) ( not ( = ?auto_265515 ?auto_265517 ) ) ( not ( = ?auto_265515 ?auto_265518 ) ) ( not ( = ?auto_265515 ?auto_265519 ) ) ( not ( = ?auto_265515 ?auto_265520 ) ) ( not ( = ?auto_265515 ?auto_265521 ) ) ( not ( = ?auto_265515 ?auto_265522 ) ) ( not ( = ?auto_265515 ?auto_265523 ) ) ( not ( = ?auto_265515 ?auto_265524 ) ) ( not ( = ?auto_265516 ?auto_265517 ) ) ( not ( = ?auto_265516 ?auto_265518 ) ) ( not ( = ?auto_265516 ?auto_265519 ) ) ( not ( = ?auto_265516 ?auto_265520 ) ) ( not ( = ?auto_265516 ?auto_265521 ) ) ( not ( = ?auto_265516 ?auto_265522 ) ) ( not ( = ?auto_265516 ?auto_265523 ) ) ( not ( = ?auto_265516 ?auto_265524 ) ) ( not ( = ?auto_265517 ?auto_265518 ) ) ( not ( = ?auto_265517 ?auto_265519 ) ) ( not ( = ?auto_265517 ?auto_265520 ) ) ( not ( = ?auto_265517 ?auto_265521 ) ) ( not ( = ?auto_265517 ?auto_265522 ) ) ( not ( = ?auto_265517 ?auto_265523 ) ) ( not ( = ?auto_265517 ?auto_265524 ) ) ( not ( = ?auto_265518 ?auto_265519 ) ) ( not ( = ?auto_265518 ?auto_265520 ) ) ( not ( = ?auto_265518 ?auto_265521 ) ) ( not ( = ?auto_265518 ?auto_265522 ) ) ( not ( = ?auto_265518 ?auto_265523 ) ) ( not ( = ?auto_265518 ?auto_265524 ) ) ( not ( = ?auto_265519 ?auto_265520 ) ) ( not ( = ?auto_265519 ?auto_265521 ) ) ( not ( = ?auto_265519 ?auto_265522 ) ) ( not ( = ?auto_265519 ?auto_265523 ) ) ( not ( = ?auto_265519 ?auto_265524 ) ) ( not ( = ?auto_265520 ?auto_265521 ) ) ( not ( = ?auto_265520 ?auto_265522 ) ) ( not ( = ?auto_265520 ?auto_265523 ) ) ( not ( = ?auto_265520 ?auto_265524 ) ) ( not ( = ?auto_265521 ?auto_265522 ) ) ( not ( = ?auto_265521 ?auto_265523 ) ) ( not ( = ?auto_265521 ?auto_265524 ) ) ( not ( = ?auto_265522 ?auto_265523 ) ) ( not ( = ?auto_265522 ?auto_265524 ) ) ( not ( = ?auto_265523 ?auto_265524 ) ) ( ON ?auto_265522 ?auto_265523 ) ( ON ?auto_265521 ?auto_265522 ) ( CLEAR ?auto_265519 ) ( ON ?auto_265520 ?auto_265521 ) ( CLEAR ?auto_265520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265515 ?auto_265516 ?auto_265517 ?auto_265518 ?auto_265519 ?auto_265520 )
      ( MAKE-9PILE ?auto_265515 ?auto_265516 ?auto_265517 ?auto_265518 ?auto_265519 ?auto_265520 ?auto_265521 ?auto_265522 ?auto_265523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265534 - BLOCK
      ?auto_265535 - BLOCK
      ?auto_265536 - BLOCK
      ?auto_265537 - BLOCK
      ?auto_265538 - BLOCK
      ?auto_265539 - BLOCK
      ?auto_265540 - BLOCK
      ?auto_265541 - BLOCK
      ?auto_265542 - BLOCK
    )
    :vars
    (
      ?auto_265543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265542 ?auto_265543 ) ( ON-TABLE ?auto_265534 ) ( ON ?auto_265535 ?auto_265534 ) ( ON ?auto_265536 ?auto_265535 ) ( ON ?auto_265537 ?auto_265536 ) ( ON ?auto_265538 ?auto_265537 ) ( not ( = ?auto_265534 ?auto_265535 ) ) ( not ( = ?auto_265534 ?auto_265536 ) ) ( not ( = ?auto_265534 ?auto_265537 ) ) ( not ( = ?auto_265534 ?auto_265538 ) ) ( not ( = ?auto_265534 ?auto_265539 ) ) ( not ( = ?auto_265534 ?auto_265540 ) ) ( not ( = ?auto_265534 ?auto_265541 ) ) ( not ( = ?auto_265534 ?auto_265542 ) ) ( not ( = ?auto_265534 ?auto_265543 ) ) ( not ( = ?auto_265535 ?auto_265536 ) ) ( not ( = ?auto_265535 ?auto_265537 ) ) ( not ( = ?auto_265535 ?auto_265538 ) ) ( not ( = ?auto_265535 ?auto_265539 ) ) ( not ( = ?auto_265535 ?auto_265540 ) ) ( not ( = ?auto_265535 ?auto_265541 ) ) ( not ( = ?auto_265535 ?auto_265542 ) ) ( not ( = ?auto_265535 ?auto_265543 ) ) ( not ( = ?auto_265536 ?auto_265537 ) ) ( not ( = ?auto_265536 ?auto_265538 ) ) ( not ( = ?auto_265536 ?auto_265539 ) ) ( not ( = ?auto_265536 ?auto_265540 ) ) ( not ( = ?auto_265536 ?auto_265541 ) ) ( not ( = ?auto_265536 ?auto_265542 ) ) ( not ( = ?auto_265536 ?auto_265543 ) ) ( not ( = ?auto_265537 ?auto_265538 ) ) ( not ( = ?auto_265537 ?auto_265539 ) ) ( not ( = ?auto_265537 ?auto_265540 ) ) ( not ( = ?auto_265537 ?auto_265541 ) ) ( not ( = ?auto_265537 ?auto_265542 ) ) ( not ( = ?auto_265537 ?auto_265543 ) ) ( not ( = ?auto_265538 ?auto_265539 ) ) ( not ( = ?auto_265538 ?auto_265540 ) ) ( not ( = ?auto_265538 ?auto_265541 ) ) ( not ( = ?auto_265538 ?auto_265542 ) ) ( not ( = ?auto_265538 ?auto_265543 ) ) ( not ( = ?auto_265539 ?auto_265540 ) ) ( not ( = ?auto_265539 ?auto_265541 ) ) ( not ( = ?auto_265539 ?auto_265542 ) ) ( not ( = ?auto_265539 ?auto_265543 ) ) ( not ( = ?auto_265540 ?auto_265541 ) ) ( not ( = ?auto_265540 ?auto_265542 ) ) ( not ( = ?auto_265540 ?auto_265543 ) ) ( not ( = ?auto_265541 ?auto_265542 ) ) ( not ( = ?auto_265541 ?auto_265543 ) ) ( not ( = ?auto_265542 ?auto_265543 ) ) ( ON ?auto_265541 ?auto_265542 ) ( ON ?auto_265540 ?auto_265541 ) ( CLEAR ?auto_265538 ) ( ON ?auto_265539 ?auto_265540 ) ( CLEAR ?auto_265539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265534 ?auto_265535 ?auto_265536 ?auto_265537 ?auto_265538 ?auto_265539 )
      ( MAKE-9PILE ?auto_265534 ?auto_265535 ?auto_265536 ?auto_265537 ?auto_265538 ?auto_265539 ?auto_265540 ?auto_265541 ?auto_265542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265553 - BLOCK
      ?auto_265554 - BLOCK
      ?auto_265555 - BLOCK
      ?auto_265556 - BLOCK
      ?auto_265557 - BLOCK
      ?auto_265558 - BLOCK
      ?auto_265559 - BLOCK
      ?auto_265560 - BLOCK
      ?auto_265561 - BLOCK
    )
    :vars
    (
      ?auto_265562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265561 ?auto_265562 ) ( ON-TABLE ?auto_265553 ) ( ON ?auto_265554 ?auto_265553 ) ( ON ?auto_265555 ?auto_265554 ) ( ON ?auto_265556 ?auto_265555 ) ( not ( = ?auto_265553 ?auto_265554 ) ) ( not ( = ?auto_265553 ?auto_265555 ) ) ( not ( = ?auto_265553 ?auto_265556 ) ) ( not ( = ?auto_265553 ?auto_265557 ) ) ( not ( = ?auto_265553 ?auto_265558 ) ) ( not ( = ?auto_265553 ?auto_265559 ) ) ( not ( = ?auto_265553 ?auto_265560 ) ) ( not ( = ?auto_265553 ?auto_265561 ) ) ( not ( = ?auto_265553 ?auto_265562 ) ) ( not ( = ?auto_265554 ?auto_265555 ) ) ( not ( = ?auto_265554 ?auto_265556 ) ) ( not ( = ?auto_265554 ?auto_265557 ) ) ( not ( = ?auto_265554 ?auto_265558 ) ) ( not ( = ?auto_265554 ?auto_265559 ) ) ( not ( = ?auto_265554 ?auto_265560 ) ) ( not ( = ?auto_265554 ?auto_265561 ) ) ( not ( = ?auto_265554 ?auto_265562 ) ) ( not ( = ?auto_265555 ?auto_265556 ) ) ( not ( = ?auto_265555 ?auto_265557 ) ) ( not ( = ?auto_265555 ?auto_265558 ) ) ( not ( = ?auto_265555 ?auto_265559 ) ) ( not ( = ?auto_265555 ?auto_265560 ) ) ( not ( = ?auto_265555 ?auto_265561 ) ) ( not ( = ?auto_265555 ?auto_265562 ) ) ( not ( = ?auto_265556 ?auto_265557 ) ) ( not ( = ?auto_265556 ?auto_265558 ) ) ( not ( = ?auto_265556 ?auto_265559 ) ) ( not ( = ?auto_265556 ?auto_265560 ) ) ( not ( = ?auto_265556 ?auto_265561 ) ) ( not ( = ?auto_265556 ?auto_265562 ) ) ( not ( = ?auto_265557 ?auto_265558 ) ) ( not ( = ?auto_265557 ?auto_265559 ) ) ( not ( = ?auto_265557 ?auto_265560 ) ) ( not ( = ?auto_265557 ?auto_265561 ) ) ( not ( = ?auto_265557 ?auto_265562 ) ) ( not ( = ?auto_265558 ?auto_265559 ) ) ( not ( = ?auto_265558 ?auto_265560 ) ) ( not ( = ?auto_265558 ?auto_265561 ) ) ( not ( = ?auto_265558 ?auto_265562 ) ) ( not ( = ?auto_265559 ?auto_265560 ) ) ( not ( = ?auto_265559 ?auto_265561 ) ) ( not ( = ?auto_265559 ?auto_265562 ) ) ( not ( = ?auto_265560 ?auto_265561 ) ) ( not ( = ?auto_265560 ?auto_265562 ) ) ( not ( = ?auto_265561 ?auto_265562 ) ) ( ON ?auto_265560 ?auto_265561 ) ( ON ?auto_265559 ?auto_265560 ) ( ON ?auto_265558 ?auto_265559 ) ( CLEAR ?auto_265556 ) ( ON ?auto_265557 ?auto_265558 ) ( CLEAR ?auto_265557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265553 ?auto_265554 ?auto_265555 ?auto_265556 ?auto_265557 )
      ( MAKE-9PILE ?auto_265553 ?auto_265554 ?auto_265555 ?auto_265556 ?auto_265557 ?auto_265558 ?auto_265559 ?auto_265560 ?auto_265561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265572 - BLOCK
      ?auto_265573 - BLOCK
      ?auto_265574 - BLOCK
      ?auto_265575 - BLOCK
      ?auto_265576 - BLOCK
      ?auto_265577 - BLOCK
      ?auto_265578 - BLOCK
      ?auto_265579 - BLOCK
      ?auto_265580 - BLOCK
    )
    :vars
    (
      ?auto_265581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265580 ?auto_265581 ) ( ON-TABLE ?auto_265572 ) ( ON ?auto_265573 ?auto_265572 ) ( ON ?auto_265574 ?auto_265573 ) ( ON ?auto_265575 ?auto_265574 ) ( not ( = ?auto_265572 ?auto_265573 ) ) ( not ( = ?auto_265572 ?auto_265574 ) ) ( not ( = ?auto_265572 ?auto_265575 ) ) ( not ( = ?auto_265572 ?auto_265576 ) ) ( not ( = ?auto_265572 ?auto_265577 ) ) ( not ( = ?auto_265572 ?auto_265578 ) ) ( not ( = ?auto_265572 ?auto_265579 ) ) ( not ( = ?auto_265572 ?auto_265580 ) ) ( not ( = ?auto_265572 ?auto_265581 ) ) ( not ( = ?auto_265573 ?auto_265574 ) ) ( not ( = ?auto_265573 ?auto_265575 ) ) ( not ( = ?auto_265573 ?auto_265576 ) ) ( not ( = ?auto_265573 ?auto_265577 ) ) ( not ( = ?auto_265573 ?auto_265578 ) ) ( not ( = ?auto_265573 ?auto_265579 ) ) ( not ( = ?auto_265573 ?auto_265580 ) ) ( not ( = ?auto_265573 ?auto_265581 ) ) ( not ( = ?auto_265574 ?auto_265575 ) ) ( not ( = ?auto_265574 ?auto_265576 ) ) ( not ( = ?auto_265574 ?auto_265577 ) ) ( not ( = ?auto_265574 ?auto_265578 ) ) ( not ( = ?auto_265574 ?auto_265579 ) ) ( not ( = ?auto_265574 ?auto_265580 ) ) ( not ( = ?auto_265574 ?auto_265581 ) ) ( not ( = ?auto_265575 ?auto_265576 ) ) ( not ( = ?auto_265575 ?auto_265577 ) ) ( not ( = ?auto_265575 ?auto_265578 ) ) ( not ( = ?auto_265575 ?auto_265579 ) ) ( not ( = ?auto_265575 ?auto_265580 ) ) ( not ( = ?auto_265575 ?auto_265581 ) ) ( not ( = ?auto_265576 ?auto_265577 ) ) ( not ( = ?auto_265576 ?auto_265578 ) ) ( not ( = ?auto_265576 ?auto_265579 ) ) ( not ( = ?auto_265576 ?auto_265580 ) ) ( not ( = ?auto_265576 ?auto_265581 ) ) ( not ( = ?auto_265577 ?auto_265578 ) ) ( not ( = ?auto_265577 ?auto_265579 ) ) ( not ( = ?auto_265577 ?auto_265580 ) ) ( not ( = ?auto_265577 ?auto_265581 ) ) ( not ( = ?auto_265578 ?auto_265579 ) ) ( not ( = ?auto_265578 ?auto_265580 ) ) ( not ( = ?auto_265578 ?auto_265581 ) ) ( not ( = ?auto_265579 ?auto_265580 ) ) ( not ( = ?auto_265579 ?auto_265581 ) ) ( not ( = ?auto_265580 ?auto_265581 ) ) ( ON ?auto_265579 ?auto_265580 ) ( ON ?auto_265578 ?auto_265579 ) ( ON ?auto_265577 ?auto_265578 ) ( CLEAR ?auto_265575 ) ( ON ?auto_265576 ?auto_265577 ) ( CLEAR ?auto_265576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265572 ?auto_265573 ?auto_265574 ?auto_265575 ?auto_265576 )
      ( MAKE-9PILE ?auto_265572 ?auto_265573 ?auto_265574 ?auto_265575 ?auto_265576 ?auto_265577 ?auto_265578 ?auto_265579 ?auto_265580 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265591 - BLOCK
      ?auto_265592 - BLOCK
      ?auto_265593 - BLOCK
      ?auto_265594 - BLOCK
      ?auto_265595 - BLOCK
      ?auto_265596 - BLOCK
      ?auto_265597 - BLOCK
      ?auto_265598 - BLOCK
      ?auto_265599 - BLOCK
    )
    :vars
    (
      ?auto_265600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265599 ?auto_265600 ) ( ON-TABLE ?auto_265591 ) ( ON ?auto_265592 ?auto_265591 ) ( ON ?auto_265593 ?auto_265592 ) ( not ( = ?auto_265591 ?auto_265592 ) ) ( not ( = ?auto_265591 ?auto_265593 ) ) ( not ( = ?auto_265591 ?auto_265594 ) ) ( not ( = ?auto_265591 ?auto_265595 ) ) ( not ( = ?auto_265591 ?auto_265596 ) ) ( not ( = ?auto_265591 ?auto_265597 ) ) ( not ( = ?auto_265591 ?auto_265598 ) ) ( not ( = ?auto_265591 ?auto_265599 ) ) ( not ( = ?auto_265591 ?auto_265600 ) ) ( not ( = ?auto_265592 ?auto_265593 ) ) ( not ( = ?auto_265592 ?auto_265594 ) ) ( not ( = ?auto_265592 ?auto_265595 ) ) ( not ( = ?auto_265592 ?auto_265596 ) ) ( not ( = ?auto_265592 ?auto_265597 ) ) ( not ( = ?auto_265592 ?auto_265598 ) ) ( not ( = ?auto_265592 ?auto_265599 ) ) ( not ( = ?auto_265592 ?auto_265600 ) ) ( not ( = ?auto_265593 ?auto_265594 ) ) ( not ( = ?auto_265593 ?auto_265595 ) ) ( not ( = ?auto_265593 ?auto_265596 ) ) ( not ( = ?auto_265593 ?auto_265597 ) ) ( not ( = ?auto_265593 ?auto_265598 ) ) ( not ( = ?auto_265593 ?auto_265599 ) ) ( not ( = ?auto_265593 ?auto_265600 ) ) ( not ( = ?auto_265594 ?auto_265595 ) ) ( not ( = ?auto_265594 ?auto_265596 ) ) ( not ( = ?auto_265594 ?auto_265597 ) ) ( not ( = ?auto_265594 ?auto_265598 ) ) ( not ( = ?auto_265594 ?auto_265599 ) ) ( not ( = ?auto_265594 ?auto_265600 ) ) ( not ( = ?auto_265595 ?auto_265596 ) ) ( not ( = ?auto_265595 ?auto_265597 ) ) ( not ( = ?auto_265595 ?auto_265598 ) ) ( not ( = ?auto_265595 ?auto_265599 ) ) ( not ( = ?auto_265595 ?auto_265600 ) ) ( not ( = ?auto_265596 ?auto_265597 ) ) ( not ( = ?auto_265596 ?auto_265598 ) ) ( not ( = ?auto_265596 ?auto_265599 ) ) ( not ( = ?auto_265596 ?auto_265600 ) ) ( not ( = ?auto_265597 ?auto_265598 ) ) ( not ( = ?auto_265597 ?auto_265599 ) ) ( not ( = ?auto_265597 ?auto_265600 ) ) ( not ( = ?auto_265598 ?auto_265599 ) ) ( not ( = ?auto_265598 ?auto_265600 ) ) ( not ( = ?auto_265599 ?auto_265600 ) ) ( ON ?auto_265598 ?auto_265599 ) ( ON ?auto_265597 ?auto_265598 ) ( ON ?auto_265596 ?auto_265597 ) ( ON ?auto_265595 ?auto_265596 ) ( CLEAR ?auto_265593 ) ( ON ?auto_265594 ?auto_265595 ) ( CLEAR ?auto_265594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265591 ?auto_265592 ?auto_265593 ?auto_265594 )
      ( MAKE-9PILE ?auto_265591 ?auto_265592 ?auto_265593 ?auto_265594 ?auto_265595 ?auto_265596 ?auto_265597 ?auto_265598 ?auto_265599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265610 - BLOCK
      ?auto_265611 - BLOCK
      ?auto_265612 - BLOCK
      ?auto_265613 - BLOCK
      ?auto_265614 - BLOCK
      ?auto_265615 - BLOCK
      ?auto_265616 - BLOCK
      ?auto_265617 - BLOCK
      ?auto_265618 - BLOCK
    )
    :vars
    (
      ?auto_265619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265618 ?auto_265619 ) ( ON-TABLE ?auto_265610 ) ( ON ?auto_265611 ?auto_265610 ) ( ON ?auto_265612 ?auto_265611 ) ( not ( = ?auto_265610 ?auto_265611 ) ) ( not ( = ?auto_265610 ?auto_265612 ) ) ( not ( = ?auto_265610 ?auto_265613 ) ) ( not ( = ?auto_265610 ?auto_265614 ) ) ( not ( = ?auto_265610 ?auto_265615 ) ) ( not ( = ?auto_265610 ?auto_265616 ) ) ( not ( = ?auto_265610 ?auto_265617 ) ) ( not ( = ?auto_265610 ?auto_265618 ) ) ( not ( = ?auto_265610 ?auto_265619 ) ) ( not ( = ?auto_265611 ?auto_265612 ) ) ( not ( = ?auto_265611 ?auto_265613 ) ) ( not ( = ?auto_265611 ?auto_265614 ) ) ( not ( = ?auto_265611 ?auto_265615 ) ) ( not ( = ?auto_265611 ?auto_265616 ) ) ( not ( = ?auto_265611 ?auto_265617 ) ) ( not ( = ?auto_265611 ?auto_265618 ) ) ( not ( = ?auto_265611 ?auto_265619 ) ) ( not ( = ?auto_265612 ?auto_265613 ) ) ( not ( = ?auto_265612 ?auto_265614 ) ) ( not ( = ?auto_265612 ?auto_265615 ) ) ( not ( = ?auto_265612 ?auto_265616 ) ) ( not ( = ?auto_265612 ?auto_265617 ) ) ( not ( = ?auto_265612 ?auto_265618 ) ) ( not ( = ?auto_265612 ?auto_265619 ) ) ( not ( = ?auto_265613 ?auto_265614 ) ) ( not ( = ?auto_265613 ?auto_265615 ) ) ( not ( = ?auto_265613 ?auto_265616 ) ) ( not ( = ?auto_265613 ?auto_265617 ) ) ( not ( = ?auto_265613 ?auto_265618 ) ) ( not ( = ?auto_265613 ?auto_265619 ) ) ( not ( = ?auto_265614 ?auto_265615 ) ) ( not ( = ?auto_265614 ?auto_265616 ) ) ( not ( = ?auto_265614 ?auto_265617 ) ) ( not ( = ?auto_265614 ?auto_265618 ) ) ( not ( = ?auto_265614 ?auto_265619 ) ) ( not ( = ?auto_265615 ?auto_265616 ) ) ( not ( = ?auto_265615 ?auto_265617 ) ) ( not ( = ?auto_265615 ?auto_265618 ) ) ( not ( = ?auto_265615 ?auto_265619 ) ) ( not ( = ?auto_265616 ?auto_265617 ) ) ( not ( = ?auto_265616 ?auto_265618 ) ) ( not ( = ?auto_265616 ?auto_265619 ) ) ( not ( = ?auto_265617 ?auto_265618 ) ) ( not ( = ?auto_265617 ?auto_265619 ) ) ( not ( = ?auto_265618 ?auto_265619 ) ) ( ON ?auto_265617 ?auto_265618 ) ( ON ?auto_265616 ?auto_265617 ) ( ON ?auto_265615 ?auto_265616 ) ( ON ?auto_265614 ?auto_265615 ) ( CLEAR ?auto_265612 ) ( ON ?auto_265613 ?auto_265614 ) ( CLEAR ?auto_265613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265610 ?auto_265611 ?auto_265612 ?auto_265613 )
      ( MAKE-9PILE ?auto_265610 ?auto_265611 ?auto_265612 ?auto_265613 ?auto_265614 ?auto_265615 ?auto_265616 ?auto_265617 ?auto_265618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265629 - BLOCK
      ?auto_265630 - BLOCK
      ?auto_265631 - BLOCK
      ?auto_265632 - BLOCK
      ?auto_265633 - BLOCK
      ?auto_265634 - BLOCK
      ?auto_265635 - BLOCK
      ?auto_265636 - BLOCK
      ?auto_265637 - BLOCK
    )
    :vars
    (
      ?auto_265638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265637 ?auto_265638 ) ( ON-TABLE ?auto_265629 ) ( ON ?auto_265630 ?auto_265629 ) ( not ( = ?auto_265629 ?auto_265630 ) ) ( not ( = ?auto_265629 ?auto_265631 ) ) ( not ( = ?auto_265629 ?auto_265632 ) ) ( not ( = ?auto_265629 ?auto_265633 ) ) ( not ( = ?auto_265629 ?auto_265634 ) ) ( not ( = ?auto_265629 ?auto_265635 ) ) ( not ( = ?auto_265629 ?auto_265636 ) ) ( not ( = ?auto_265629 ?auto_265637 ) ) ( not ( = ?auto_265629 ?auto_265638 ) ) ( not ( = ?auto_265630 ?auto_265631 ) ) ( not ( = ?auto_265630 ?auto_265632 ) ) ( not ( = ?auto_265630 ?auto_265633 ) ) ( not ( = ?auto_265630 ?auto_265634 ) ) ( not ( = ?auto_265630 ?auto_265635 ) ) ( not ( = ?auto_265630 ?auto_265636 ) ) ( not ( = ?auto_265630 ?auto_265637 ) ) ( not ( = ?auto_265630 ?auto_265638 ) ) ( not ( = ?auto_265631 ?auto_265632 ) ) ( not ( = ?auto_265631 ?auto_265633 ) ) ( not ( = ?auto_265631 ?auto_265634 ) ) ( not ( = ?auto_265631 ?auto_265635 ) ) ( not ( = ?auto_265631 ?auto_265636 ) ) ( not ( = ?auto_265631 ?auto_265637 ) ) ( not ( = ?auto_265631 ?auto_265638 ) ) ( not ( = ?auto_265632 ?auto_265633 ) ) ( not ( = ?auto_265632 ?auto_265634 ) ) ( not ( = ?auto_265632 ?auto_265635 ) ) ( not ( = ?auto_265632 ?auto_265636 ) ) ( not ( = ?auto_265632 ?auto_265637 ) ) ( not ( = ?auto_265632 ?auto_265638 ) ) ( not ( = ?auto_265633 ?auto_265634 ) ) ( not ( = ?auto_265633 ?auto_265635 ) ) ( not ( = ?auto_265633 ?auto_265636 ) ) ( not ( = ?auto_265633 ?auto_265637 ) ) ( not ( = ?auto_265633 ?auto_265638 ) ) ( not ( = ?auto_265634 ?auto_265635 ) ) ( not ( = ?auto_265634 ?auto_265636 ) ) ( not ( = ?auto_265634 ?auto_265637 ) ) ( not ( = ?auto_265634 ?auto_265638 ) ) ( not ( = ?auto_265635 ?auto_265636 ) ) ( not ( = ?auto_265635 ?auto_265637 ) ) ( not ( = ?auto_265635 ?auto_265638 ) ) ( not ( = ?auto_265636 ?auto_265637 ) ) ( not ( = ?auto_265636 ?auto_265638 ) ) ( not ( = ?auto_265637 ?auto_265638 ) ) ( ON ?auto_265636 ?auto_265637 ) ( ON ?auto_265635 ?auto_265636 ) ( ON ?auto_265634 ?auto_265635 ) ( ON ?auto_265633 ?auto_265634 ) ( ON ?auto_265632 ?auto_265633 ) ( CLEAR ?auto_265630 ) ( ON ?auto_265631 ?auto_265632 ) ( CLEAR ?auto_265631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265629 ?auto_265630 ?auto_265631 )
      ( MAKE-9PILE ?auto_265629 ?auto_265630 ?auto_265631 ?auto_265632 ?auto_265633 ?auto_265634 ?auto_265635 ?auto_265636 ?auto_265637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265648 - BLOCK
      ?auto_265649 - BLOCK
      ?auto_265650 - BLOCK
      ?auto_265651 - BLOCK
      ?auto_265652 - BLOCK
      ?auto_265653 - BLOCK
      ?auto_265654 - BLOCK
      ?auto_265655 - BLOCK
      ?auto_265656 - BLOCK
    )
    :vars
    (
      ?auto_265657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265656 ?auto_265657 ) ( ON-TABLE ?auto_265648 ) ( ON ?auto_265649 ?auto_265648 ) ( not ( = ?auto_265648 ?auto_265649 ) ) ( not ( = ?auto_265648 ?auto_265650 ) ) ( not ( = ?auto_265648 ?auto_265651 ) ) ( not ( = ?auto_265648 ?auto_265652 ) ) ( not ( = ?auto_265648 ?auto_265653 ) ) ( not ( = ?auto_265648 ?auto_265654 ) ) ( not ( = ?auto_265648 ?auto_265655 ) ) ( not ( = ?auto_265648 ?auto_265656 ) ) ( not ( = ?auto_265648 ?auto_265657 ) ) ( not ( = ?auto_265649 ?auto_265650 ) ) ( not ( = ?auto_265649 ?auto_265651 ) ) ( not ( = ?auto_265649 ?auto_265652 ) ) ( not ( = ?auto_265649 ?auto_265653 ) ) ( not ( = ?auto_265649 ?auto_265654 ) ) ( not ( = ?auto_265649 ?auto_265655 ) ) ( not ( = ?auto_265649 ?auto_265656 ) ) ( not ( = ?auto_265649 ?auto_265657 ) ) ( not ( = ?auto_265650 ?auto_265651 ) ) ( not ( = ?auto_265650 ?auto_265652 ) ) ( not ( = ?auto_265650 ?auto_265653 ) ) ( not ( = ?auto_265650 ?auto_265654 ) ) ( not ( = ?auto_265650 ?auto_265655 ) ) ( not ( = ?auto_265650 ?auto_265656 ) ) ( not ( = ?auto_265650 ?auto_265657 ) ) ( not ( = ?auto_265651 ?auto_265652 ) ) ( not ( = ?auto_265651 ?auto_265653 ) ) ( not ( = ?auto_265651 ?auto_265654 ) ) ( not ( = ?auto_265651 ?auto_265655 ) ) ( not ( = ?auto_265651 ?auto_265656 ) ) ( not ( = ?auto_265651 ?auto_265657 ) ) ( not ( = ?auto_265652 ?auto_265653 ) ) ( not ( = ?auto_265652 ?auto_265654 ) ) ( not ( = ?auto_265652 ?auto_265655 ) ) ( not ( = ?auto_265652 ?auto_265656 ) ) ( not ( = ?auto_265652 ?auto_265657 ) ) ( not ( = ?auto_265653 ?auto_265654 ) ) ( not ( = ?auto_265653 ?auto_265655 ) ) ( not ( = ?auto_265653 ?auto_265656 ) ) ( not ( = ?auto_265653 ?auto_265657 ) ) ( not ( = ?auto_265654 ?auto_265655 ) ) ( not ( = ?auto_265654 ?auto_265656 ) ) ( not ( = ?auto_265654 ?auto_265657 ) ) ( not ( = ?auto_265655 ?auto_265656 ) ) ( not ( = ?auto_265655 ?auto_265657 ) ) ( not ( = ?auto_265656 ?auto_265657 ) ) ( ON ?auto_265655 ?auto_265656 ) ( ON ?auto_265654 ?auto_265655 ) ( ON ?auto_265653 ?auto_265654 ) ( ON ?auto_265652 ?auto_265653 ) ( ON ?auto_265651 ?auto_265652 ) ( CLEAR ?auto_265649 ) ( ON ?auto_265650 ?auto_265651 ) ( CLEAR ?auto_265650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_265648 ?auto_265649 ?auto_265650 )
      ( MAKE-9PILE ?auto_265648 ?auto_265649 ?auto_265650 ?auto_265651 ?auto_265652 ?auto_265653 ?auto_265654 ?auto_265655 ?auto_265656 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265667 - BLOCK
      ?auto_265668 - BLOCK
      ?auto_265669 - BLOCK
      ?auto_265670 - BLOCK
      ?auto_265671 - BLOCK
      ?auto_265672 - BLOCK
      ?auto_265673 - BLOCK
      ?auto_265674 - BLOCK
      ?auto_265675 - BLOCK
    )
    :vars
    (
      ?auto_265676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265675 ?auto_265676 ) ( ON-TABLE ?auto_265667 ) ( not ( = ?auto_265667 ?auto_265668 ) ) ( not ( = ?auto_265667 ?auto_265669 ) ) ( not ( = ?auto_265667 ?auto_265670 ) ) ( not ( = ?auto_265667 ?auto_265671 ) ) ( not ( = ?auto_265667 ?auto_265672 ) ) ( not ( = ?auto_265667 ?auto_265673 ) ) ( not ( = ?auto_265667 ?auto_265674 ) ) ( not ( = ?auto_265667 ?auto_265675 ) ) ( not ( = ?auto_265667 ?auto_265676 ) ) ( not ( = ?auto_265668 ?auto_265669 ) ) ( not ( = ?auto_265668 ?auto_265670 ) ) ( not ( = ?auto_265668 ?auto_265671 ) ) ( not ( = ?auto_265668 ?auto_265672 ) ) ( not ( = ?auto_265668 ?auto_265673 ) ) ( not ( = ?auto_265668 ?auto_265674 ) ) ( not ( = ?auto_265668 ?auto_265675 ) ) ( not ( = ?auto_265668 ?auto_265676 ) ) ( not ( = ?auto_265669 ?auto_265670 ) ) ( not ( = ?auto_265669 ?auto_265671 ) ) ( not ( = ?auto_265669 ?auto_265672 ) ) ( not ( = ?auto_265669 ?auto_265673 ) ) ( not ( = ?auto_265669 ?auto_265674 ) ) ( not ( = ?auto_265669 ?auto_265675 ) ) ( not ( = ?auto_265669 ?auto_265676 ) ) ( not ( = ?auto_265670 ?auto_265671 ) ) ( not ( = ?auto_265670 ?auto_265672 ) ) ( not ( = ?auto_265670 ?auto_265673 ) ) ( not ( = ?auto_265670 ?auto_265674 ) ) ( not ( = ?auto_265670 ?auto_265675 ) ) ( not ( = ?auto_265670 ?auto_265676 ) ) ( not ( = ?auto_265671 ?auto_265672 ) ) ( not ( = ?auto_265671 ?auto_265673 ) ) ( not ( = ?auto_265671 ?auto_265674 ) ) ( not ( = ?auto_265671 ?auto_265675 ) ) ( not ( = ?auto_265671 ?auto_265676 ) ) ( not ( = ?auto_265672 ?auto_265673 ) ) ( not ( = ?auto_265672 ?auto_265674 ) ) ( not ( = ?auto_265672 ?auto_265675 ) ) ( not ( = ?auto_265672 ?auto_265676 ) ) ( not ( = ?auto_265673 ?auto_265674 ) ) ( not ( = ?auto_265673 ?auto_265675 ) ) ( not ( = ?auto_265673 ?auto_265676 ) ) ( not ( = ?auto_265674 ?auto_265675 ) ) ( not ( = ?auto_265674 ?auto_265676 ) ) ( not ( = ?auto_265675 ?auto_265676 ) ) ( ON ?auto_265674 ?auto_265675 ) ( ON ?auto_265673 ?auto_265674 ) ( ON ?auto_265672 ?auto_265673 ) ( ON ?auto_265671 ?auto_265672 ) ( ON ?auto_265670 ?auto_265671 ) ( ON ?auto_265669 ?auto_265670 ) ( CLEAR ?auto_265667 ) ( ON ?auto_265668 ?auto_265669 ) ( CLEAR ?auto_265668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265667 ?auto_265668 )
      ( MAKE-9PILE ?auto_265667 ?auto_265668 ?auto_265669 ?auto_265670 ?auto_265671 ?auto_265672 ?auto_265673 ?auto_265674 ?auto_265675 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265686 - BLOCK
      ?auto_265687 - BLOCK
      ?auto_265688 - BLOCK
      ?auto_265689 - BLOCK
      ?auto_265690 - BLOCK
      ?auto_265691 - BLOCK
      ?auto_265692 - BLOCK
      ?auto_265693 - BLOCK
      ?auto_265694 - BLOCK
    )
    :vars
    (
      ?auto_265695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265694 ?auto_265695 ) ( ON-TABLE ?auto_265686 ) ( not ( = ?auto_265686 ?auto_265687 ) ) ( not ( = ?auto_265686 ?auto_265688 ) ) ( not ( = ?auto_265686 ?auto_265689 ) ) ( not ( = ?auto_265686 ?auto_265690 ) ) ( not ( = ?auto_265686 ?auto_265691 ) ) ( not ( = ?auto_265686 ?auto_265692 ) ) ( not ( = ?auto_265686 ?auto_265693 ) ) ( not ( = ?auto_265686 ?auto_265694 ) ) ( not ( = ?auto_265686 ?auto_265695 ) ) ( not ( = ?auto_265687 ?auto_265688 ) ) ( not ( = ?auto_265687 ?auto_265689 ) ) ( not ( = ?auto_265687 ?auto_265690 ) ) ( not ( = ?auto_265687 ?auto_265691 ) ) ( not ( = ?auto_265687 ?auto_265692 ) ) ( not ( = ?auto_265687 ?auto_265693 ) ) ( not ( = ?auto_265687 ?auto_265694 ) ) ( not ( = ?auto_265687 ?auto_265695 ) ) ( not ( = ?auto_265688 ?auto_265689 ) ) ( not ( = ?auto_265688 ?auto_265690 ) ) ( not ( = ?auto_265688 ?auto_265691 ) ) ( not ( = ?auto_265688 ?auto_265692 ) ) ( not ( = ?auto_265688 ?auto_265693 ) ) ( not ( = ?auto_265688 ?auto_265694 ) ) ( not ( = ?auto_265688 ?auto_265695 ) ) ( not ( = ?auto_265689 ?auto_265690 ) ) ( not ( = ?auto_265689 ?auto_265691 ) ) ( not ( = ?auto_265689 ?auto_265692 ) ) ( not ( = ?auto_265689 ?auto_265693 ) ) ( not ( = ?auto_265689 ?auto_265694 ) ) ( not ( = ?auto_265689 ?auto_265695 ) ) ( not ( = ?auto_265690 ?auto_265691 ) ) ( not ( = ?auto_265690 ?auto_265692 ) ) ( not ( = ?auto_265690 ?auto_265693 ) ) ( not ( = ?auto_265690 ?auto_265694 ) ) ( not ( = ?auto_265690 ?auto_265695 ) ) ( not ( = ?auto_265691 ?auto_265692 ) ) ( not ( = ?auto_265691 ?auto_265693 ) ) ( not ( = ?auto_265691 ?auto_265694 ) ) ( not ( = ?auto_265691 ?auto_265695 ) ) ( not ( = ?auto_265692 ?auto_265693 ) ) ( not ( = ?auto_265692 ?auto_265694 ) ) ( not ( = ?auto_265692 ?auto_265695 ) ) ( not ( = ?auto_265693 ?auto_265694 ) ) ( not ( = ?auto_265693 ?auto_265695 ) ) ( not ( = ?auto_265694 ?auto_265695 ) ) ( ON ?auto_265693 ?auto_265694 ) ( ON ?auto_265692 ?auto_265693 ) ( ON ?auto_265691 ?auto_265692 ) ( ON ?auto_265690 ?auto_265691 ) ( ON ?auto_265689 ?auto_265690 ) ( ON ?auto_265688 ?auto_265689 ) ( CLEAR ?auto_265686 ) ( ON ?auto_265687 ?auto_265688 ) ( CLEAR ?auto_265687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_265686 ?auto_265687 )
      ( MAKE-9PILE ?auto_265686 ?auto_265687 ?auto_265688 ?auto_265689 ?auto_265690 ?auto_265691 ?auto_265692 ?auto_265693 ?auto_265694 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265705 - BLOCK
      ?auto_265706 - BLOCK
      ?auto_265707 - BLOCK
      ?auto_265708 - BLOCK
      ?auto_265709 - BLOCK
      ?auto_265710 - BLOCK
      ?auto_265711 - BLOCK
      ?auto_265712 - BLOCK
      ?auto_265713 - BLOCK
    )
    :vars
    (
      ?auto_265714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265713 ?auto_265714 ) ( not ( = ?auto_265705 ?auto_265706 ) ) ( not ( = ?auto_265705 ?auto_265707 ) ) ( not ( = ?auto_265705 ?auto_265708 ) ) ( not ( = ?auto_265705 ?auto_265709 ) ) ( not ( = ?auto_265705 ?auto_265710 ) ) ( not ( = ?auto_265705 ?auto_265711 ) ) ( not ( = ?auto_265705 ?auto_265712 ) ) ( not ( = ?auto_265705 ?auto_265713 ) ) ( not ( = ?auto_265705 ?auto_265714 ) ) ( not ( = ?auto_265706 ?auto_265707 ) ) ( not ( = ?auto_265706 ?auto_265708 ) ) ( not ( = ?auto_265706 ?auto_265709 ) ) ( not ( = ?auto_265706 ?auto_265710 ) ) ( not ( = ?auto_265706 ?auto_265711 ) ) ( not ( = ?auto_265706 ?auto_265712 ) ) ( not ( = ?auto_265706 ?auto_265713 ) ) ( not ( = ?auto_265706 ?auto_265714 ) ) ( not ( = ?auto_265707 ?auto_265708 ) ) ( not ( = ?auto_265707 ?auto_265709 ) ) ( not ( = ?auto_265707 ?auto_265710 ) ) ( not ( = ?auto_265707 ?auto_265711 ) ) ( not ( = ?auto_265707 ?auto_265712 ) ) ( not ( = ?auto_265707 ?auto_265713 ) ) ( not ( = ?auto_265707 ?auto_265714 ) ) ( not ( = ?auto_265708 ?auto_265709 ) ) ( not ( = ?auto_265708 ?auto_265710 ) ) ( not ( = ?auto_265708 ?auto_265711 ) ) ( not ( = ?auto_265708 ?auto_265712 ) ) ( not ( = ?auto_265708 ?auto_265713 ) ) ( not ( = ?auto_265708 ?auto_265714 ) ) ( not ( = ?auto_265709 ?auto_265710 ) ) ( not ( = ?auto_265709 ?auto_265711 ) ) ( not ( = ?auto_265709 ?auto_265712 ) ) ( not ( = ?auto_265709 ?auto_265713 ) ) ( not ( = ?auto_265709 ?auto_265714 ) ) ( not ( = ?auto_265710 ?auto_265711 ) ) ( not ( = ?auto_265710 ?auto_265712 ) ) ( not ( = ?auto_265710 ?auto_265713 ) ) ( not ( = ?auto_265710 ?auto_265714 ) ) ( not ( = ?auto_265711 ?auto_265712 ) ) ( not ( = ?auto_265711 ?auto_265713 ) ) ( not ( = ?auto_265711 ?auto_265714 ) ) ( not ( = ?auto_265712 ?auto_265713 ) ) ( not ( = ?auto_265712 ?auto_265714 ) ) ( not ( = ?auto_265713 ?auto_265714 ) ) ( ON ?auto_265712 ?auto_265713 ) ( ON ?auto_265711 ?auto_265712 ) ( ON ?auto_265710 ?auto_265711 ) ( ON ?auto_265709 ?auto_265710 ) ( ON ?auto_265708 ?auto_265709 ) ( ON ?auto_265707 ?auto_265708 ) ( ON ?auto_265706 ?auto_265707 ) ( ON ?auto_265705 ?auto_265706 ) ( CLEAR ?auto_265705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265705 )
      ( MAKE-9PILE ?auto_265705 ?auto_265706 ?auto_265707 ?auto_265708 ?auto_265709 ?auto_265710 ?auto_265711 ?auto_265712 ?auto_265713 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_265724 - BLOCK
      ?auto_265725 - BLOCK
      ?auto_265726 - BLOCK
      ?auto_265727 - BLOCK
      ?auto_265728 - BLOCK
      ?auto_265729 - BLOCK
      ?auto_265730 - BLOCK
      ?auto_265731 - BLOCK
      ?auto_265732 - BLOCK
    )
    :vars
    (
      ?auto_265733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265732 ?auto_265733 ) ( not ( = ?auto_265724 ?auto_265725 ) ) ( not ( = ?auto_265724 ?auto_265726 ) ) ( not ( = ?auto_265724 ?auto_265727 ) ) ( not ( = ?auto_265724 ?auto_265728 ) ) ( not ( = ?auto_265724 ?auto_265729 ) ) ( not ( = ?auto_265724 ?auto_265730 ) ) ( not ( = ?auto_265724 ?auto_265731 ) ) ( not ( = ?auto_265724 ?auto_265732 ) ) ( not ( = ?auto_265724 ?auto_265733 ) ) ( not ( = ?auto_265725 ?auto_265726 ) ) ( not ( = ?auto_265725 ?auto_265727 ) ) ( not ( = ?auto_265725 ?auto_265728 ) ) ( not ( = ?auto_265725 ?auto_265729 ) ) ( not ( = ?auto_265725 ?auto_265730 ) ) ( not ( = ?auto_265725 ?auto_265731 ) ) ( not ( = ?auto_265725 ?auto_265732 ) ) ( not ( = ?auto_265725 ?auto_265733 ) ) ( not ( = ?auto_265726 ?auto_265727 ) ) ( not ( = ?auto_265726 ?auto_265728 ) ) ( not ( = ?auto_265726 ?auto_265729 ) ) ( not ( = ?auto_265726 ?auto_265730 ) ) ( not ( = ?auto_265726 ?auto_265731 ) ) ( not ( = ?auto_265726 ?auto_265732 ) ) ( not ( = ?auto_265726 ?auto_265733 ) ) ( not ( = ?auto_265727 ?auto_265728 ) ) ( not ( = ?auto_265727 ?auto_265729 ) ) ( not ( = ?auto_265727 ?auto_265730 ) ) ( not ( = ?auto_265727 ?auto_265731 ) ) ( not ( = ?auto_265727 ?auto_265732 ) ) ( not ( = ?auto_265727 ?auto_265733 ) ) ( not ( = ?auto_265728 ?auto_265729 ) ) ( not ( = ?auto_265728 ?auto_265730 ) ) ( not ( = ?auto_265728 ?auto_265731 ) ) ( not ( = ?auto_265728 ?auto_265732 ) ) ( not ( = ?auto_265728 ?auto_265733 ) ) ( not ( = ?auto_265729 ?auto_265730 ) ) ( not ( = ?auto_265729 ?auto_265731 ) ) ( not ( = ?auto_265729 ?auto_265732 ) ) ( not ( = ?auto_265729 ?auto_265733 ) ) ( not ( = ?auto_265730 ?auto_265731 ) ) ( not ( = ?auto_265730 ?auto_265732 ) ) ( not ( = ?auto_265730 ?auto_265733 ) ) ( not ( = ?auto_265731 ?auto_265732 ) ) ( not ( = ?auto_265731 ?auto_265733 ) ) ( not ( = ?auto_265732 ?auto_265733 ) ) ( ON ?auto_265731 ?auto_265732 ) ( ON ?auto_265730 ?auto_265731 ) ( ON ?auto_265729 ?auto_265730 ) ( ON ?auto_265728 ?auto_265729 ) ( ON ?auto_265727 ?auto_265728 ) ( ON ?auto_265726 ?auto_265727 ) ( ON ?auto_265725 ?auto_265726 ) ( ON ?auto_265724 ?auto_265725 ) ( CLEAR ?auto_265724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_265724 )
      ( MAKE-9PILE ?auto_265724 ?auto_265725 ?auto_265726 ?auto_265727 ?auto_265728 ?auto_265729 ?auto_265730 ?auto_265731 ?auto_265732 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265744 - BLOCK
      ?auto_265745 - BLOCK
      ?auto_265746 - BLOCK
      ?auto_265747 - BLOCK
      ?auto_265748 - BLOCK
      ?auto_265749 - BLOCK
      ?auto_265750 - BLOCK
      ?auto_265751 - BLOCK
      ?auto_265752 - BLOCK
      ?auto_265753 - BLOCK
    )
    :vars
    (
      ?auto_265754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265752 ) ( ON ?auto_265753 ?auto_265754 ) ( CLEAR ?auto_265753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265744 ) ( ON ?auto_265745 ?auto_265744 ) ( ON ?auto_265746 ?auto_265745 ) ( ON ?auto_265747 ?auto_265746 ) ( ON ?auto_265748 ?auto_265747 ) ( ON ?auto_265749 ?auto_265748 ) ( ON ?auto_265750 ?auto_265749 ) ( ON ?auto_265751 ?auto_265750 ) ( ON ?auto_265752 ?auto_265751 ) ( not ( = ?auto_265744 ?auto_265745 ) ) ( not ( = ?auto_265744 ?auto_265746 ) ) ( not ( = ?auto_265744 ?auto_265747 ) ) ( not ( = ?auto_265744 ?auto_265748 ) ) ( not ( = ?auto_265744 ?auto_265749 ) ) ( not ( = ?auto_265744 ?auto_265750 ) ) ( not ( = ?auto_265744 ?auto_265751 ) ) ( not ( = ?auto_265744 ?auto_265752 ) ) ( not ( = ?auto_265744 ?auto_265753 ) ) ( not ( = ?auto_265744 ?auto_265754 ) ) ( not ( = ?auto_265745 ?auto_265746 ) ) ( not ( = ?auto_265745 ?auto_265747 ) ) ( not ( = ?auto_265745 ?auto_265748 ) ) ( not ( = ?auto_265745 ?auto_265749 ) ) ( not ( = ?auto_265745 ?auto_265750 ) ) ( not ( = ?auto_265745 ?auto_265751 ) ) ( not ( = ?auto_265745 ?auto_265752 ) ) ( not ( = ?auto_265745 ?auto_265753 ) ) ( not ( = ?auto_265745 ?auto_265754 ) ) ( not ( = ?auto_265746 ?auto_265747 ) ) ( not ( = ?auto_265746 ?auto_265748 ) ) ( not ( = ?auto_265746 ?auto_265749 ) ) ( not ( = ?auto_265746 ?auto_265750 ) ) ( not ( = ?auto_265746 ?auto_265751 ) ) ( not ( = ?auto_265746 ?auto_265752 ) ) ( not ( = ?auto_265746 ?auto_265753 ) ) ( not ( = ?auto_265746 ?auto_265754 ) ) ( not ( = ?auto_265747 ?auto_265748 ) ) ( not ( = ?auto_265747 ?auto_265749 ) ) ( not ( = ?auto_265747 ?auto_265750 ) ) ( not ( = ?auto_265747 ?auto_265751 ) ) ( not ( = ?auto_265747 ?auto_265752 ) ) ( not ( = ?auto_265747 ?auto_265753 ) ) ( not ( = ?auto_265747 ?auto_265754 ) ) ( not ( = ?auto_265748 ?auto_265749 ) ) ( not ( = ?auto_265748 ?auto_265750 ) ) ( not ( = ?auto_265748 ?auto_265751 ) ) ( not ( = ?auto_265748 ?auto_265752 ) ) ( not ( = ?auto_265748 ?auto_265753 ) ) ( not ( = ?auto_265748 ?auto_265754 ) ) ( not ( = ?auto_265749 ?auto_265750 ) ) ( not ( = ?auto_265749 ?auto_265751 ) ) ( not ( = ?auto_265749 ?auto_265752 ) ) ( not ( = ?auto_265749 ?auto_265753 ) ) ( not ( = ?auto_265749 ?auto_265754 ) ) ( not ( = ?auto_265750 ?auto_265751 ) ) ( not ( = ?auto_265750 ?auto_265752 ) ) ( not ( = ?auto_265750 ?auto_265753 ) ) ( not ( = ?auto_265750 ?auto_265754 ) ) ( not ( = ?auto_265751 ?auto_265752 ) ) ( not ( = ?auto_265751 ?auto_265753 ) ) ( not ( = ?auto_265751 ?auto_265754 ) ) ( not ( = ?auto_265752 ?auto_265753 ) ) ( not ( = ?auto_265752 ?auto_265754 ) ) ( not ( = ?auto_265753 ?auto_265754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265753 ?auto_265754 )
      ( !STACK ?auto_265753 ?auto_265752 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265765 - BLOCK
      ?auto_265766 - BLOCK
      ?auto_265767 - BLOCK
      ?auto_265768 - BLOCK
      ?auto_265769 - BLOCK
      ?auto_265770 - BLOCK
      ?auto_265771 - BLOCK
      ?auto_265772 - BLOCK
      ?auto_265773 - BLOCK
      ?auto_265774 - BLOCK
    )
    :vars
    (
      ?auto_265775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265773 ) ( ON ?auto_265774 ?auto_265775 ) ( CLEAR ?auto_265774 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_265765 ) ( ON ?auto_265766 ?auto_265765 ) ( ON ?auto_265767 ?auto_265766 ) ( ON ?auto_265768 ?auto_265767 ) ( ON ?auto_265769 ?auto_265768 ) ( ON ?auto_265770 ?auto_265769 ) ( ON ?auto_265771 ?auto_265770 ) ( ON ?auto_265772 ?auto_265771 ) ( ON ?auto_265773 ?auto_265772 ) ( not ( = ?auto_265765 ?auto_265766 ) ) ( not ( = ?auto_265765 ?auto_265767 ) ) ( not ( = ?auto_265765 ?auto_265768 ) ) ( not ( = ?auto_265765 ?auto_265769 ) ) ( not ( = ?auto_265765 ?auto_265770 ) ) ( not ( = ?auto_265765 ?auto_265771 ) ) ( not ( = ?auto_265765 ?auto_265772 ) ) ( not ( = ?auto_265765 ?auto_265773 ) ) ( not ( = ?auto_265765 ?auto_265774 ) ) ( not ( = ?auto_265765 ?auto_265775 ) ) ( not ( = ?auto_265766 ?auto_265767 ) ) ( not ( = ?auto_265766 ?auto_265768 ) ) ( not ( = ?auto_265766 ?auto_265769 ) ) ( not ( = ?auto_265766 ?auto_265770 ) ) ( not ( = ?auto_265766 ?auto_265771 ) ) ( not ( = ?auto_265766 ?auto_265772 ) ) ( not ( = ?auto_265766 ?auto_265773 ) ) ( not ( = ?auto_265766 ?auto_265774 ) ) ( not ( = ?auto_265766 ?auto_265775 ) ) ( not ( = ?auto_265767 ?auto_265768 ) ) ( not ( = ?auto_265767 ?auto_265769 ) ) ( not ( = ?auto_265767 ?auto_265770 ) ) ( not ( = ?auto_265767 ?auto_265771 ) ) ( not ( = ?auto_265767 ?auto_265772 ) ) ( not ( = ?auto_265767 ?auto_265773 ) ) ( not ( = ?auto_265767 ?auto_265774 ) ) ( not ( = ?auto_265767 ?auto_265775 ) ) ( not ( = ?auto_265768 ?auto_265769 ) ) ( not ( = ?auto_265768 ?auto_265770 ) ) ( not ( = ?auto_265768 ?auto_265771 ) ) ( not ( = ?auto_265768 ?auto_265772 ) ) ( not ( = ?auto_265768 ?auto_265773 ) ) ( not ( = ?auto_265768 ?auto_265774 ) ) ( not ( = ?auto_265768 ?auto_265775 ) ) ( not ( = ?auto_265769 ?auto_265770 ) ) ( not ( = ?auto_265769 ?auto_265771 ) ) ( not ( = ?auto_265769 ?auto_265772 ) ) ( not ( = ?auto_265769 ?auto_265773 ) ) ( not ( = ?auto_265769 ?auto_265774 ) ) ( not ( = ?auto_265769 ?auto_265775 ) ) ( not ( = ?auto_265770 ?auto_265771 ) ) ( not ( = ?auto_265770 ?auto_265772 ) ) ( not ( = ?auto_265770 ?auto_265773 ) ) ( not ( = ?auto_265770 ?auto_265774 ) ) ( not ( = ?auto_265770 ?auto_265775 ) ) ( not ( = ?auto_265771 ?auto_265772 ) ) ( not ( = ?auto_265771 ?auto_265773 ) ) ( not ( = ?auto_265771 ?auto_265774 ) ) ( not ( = ?auto_265771 ?auto_265775 ) ) ( not ( = ?auto_265772 ?auto_265773 ) ) ( not ( = ?auto_265772 ?auto_265774 ) ) ( not ( = ?auto_265772 ?auto_265775 ) ) ( not ( = ?auto_265773 ?auto_265774 ) ) ( not ( = ?auto_265773 ?auto_265775 ) ) ( not ( = ?auto_265774 ?auto_265775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_265774 ?auto_265775 )
      ( !STACK ?auto_265774 ?auto_265773 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265786 - BLOCK
      ?auto_265787 - BLOCK
      ?auto_265788 - BLOCK
      ?auto_265789 - BLOCK
      ?auto_265790 - BLOCK
      ?auto_265791 - BLOCK
      ?auto_265792 - BLOCK
      ?auto_265793 - BLOCK
      ?auto_265794 - BLOCK
      ?auto_265795 - BLOCK
    )
    :vars
    (
      ?auto_265796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265795 ?auto_265796 ) ( ON-TABLE ?auto_265786 ) ( ON ?auto_265787 ?auto_265786 ) ( ON ?auto_265788 ?auto_265787 ) ( ON ?auto_265789 ?auto_265788 ) ( ON ?auto_265790 ?auto_265789 ) ( ON ?auto_265791 ?auto_265790 ) ( ON ?auto_265792 ?auto_265791 ) ( ON ?auto_265793 ?auto_265792 ) ( not ( = ?auto_265786 ?auto_265787 ) ) ( not ( = ?auto_265786 ?auto_265788 ) ) ( not ( = ?auto_265786 ?auto_265789 ) ) ( not ( = ?auto_265786 ?auto_265790 ) ) ( not ( = ?auto_265786 ?auto_265791 ) ) ( not ( = ?auto_265786 ?auto_265792 ) ) ( not ( = ?auto_265786 ?auto_265793 ) ) ( not ( = ?auto_265786 ?auto_265794 ) ) ( not ( = ?auto_265786 ?auto_265795 ) ) ( not ( = ?auto_265786 ?auto_265796 ) ) ( not ( = ?auto_265787 ?auto_265788 ) ) ( not ( = ?auto_265787 ?auto_265789 ) ) ( not ( = ?auto_265787 ?auto_265790 ) ) ( not ( = ?auto_265787 ?auto_265791 ) ) ( not ( = ?auto_265787 ?auto_265792 ) ) ( not ( = ?auto_265787 ?auto_265793 ) ) ( not ( = ?auto_265787 ?auto_265794 ) ) ( not ( = ?auto_265787 ?auto_265795 ) ) ( not ( = ?auto_265787 ?auto_265796 ) ) ( not ( = ?auto_265788 ?auto_265789 ) ) ( not ( = ?auto_265788 ?auto_265790 ) ) ( not ( = ?auto_265788 ?auto_265791 ) ) ( not ( = ?auto_265788 ?auto_265792 ) ) ( not ( = ?auto_265788 ?auto_265793 ) ) ( not ( = ?auto_265788 ?auto_265794 ) ) ( not ( = ?auto_265788 ?auto_265795 ) ) ( not ( = ?auto_265788 ?auto_265796 ) ) ( not ( = ?auto_265789 ?auto_265790 ) ) ( not ( = ?auto_265789 ?auto_265791 ) ) ( not ( = ?auto_265789 ?auto_265792 ) ) ( not ( = ?auto_265789 ?auto_265793 ) ) ( not ( = ?auto_265789 ?auto_265794 ) ) ( not ( = ?auto_265789 ?auto_265795 ) ) ( not ( = ?auto_265789 ?auto_265796 ) ) ( not ( = ?auto_265790 ?auto_265791 ) ) ( not ( = ?auto_265790 ?auto_265792 ) ) ( not ( = ?auto_265790 ?auto_265793 ) ) ( not ( = ?auto_265790 ?auto_265794 ) ) ( not ( = ?auto_265790 ?auto_265795 ) ) ( not ( = ?auto_265790 ?auto_265796 ) ) ( not ( = ?auto_265791 ?auto_265792 ) ) ( not ( = ?auto_265791 ?auto_265793 ) ) ( not ( = ?auto_265791 ?auto_265794 ) ) ( not ( = ?auto_265791 ?auto_265795 ) ) ( not ( = ?auto_265791 ?auto_265796 ) ) ( not ( = ?auto_265792 ?auto_265793 ) ) ( not ( = ?auto_265792 ?auto_265794 ) ) ( not ( = ?auto_265792 ?auto_265795 ) ) ( not ( = ?auto_265792 ?auto_265796 ) ) ( not ( = ?auto_265793 ?auto_265794 ) ) ( not ( = ?auto_265793 ?auto_265795 ) ) ( not ( = ?auto_265793 ?auto_265796 ) ) ( not ( = ?auto_265794 ?auto_265795 ) ) ( not ( = ?auto_265794 ?auto_265796 ) ) ( not ( = ?auto_265795 ?auto_265796 ) ) ( CLEAR ?auto_265793 ) ( ON ?auto_265794 ?auto_265795 ) ( CLEAR ?auto_265794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_265786 ?auto_265787 ?auto_265788 ?auto_265789 ?auto_265790 ?auto_265791 ?auto_265792 ?auto_265793 ?auto_265794 )
      ( MAKE-10PILE ?auto_265786 ?auto_265787 ?auto_265788 ?auto_265789 ?auto_265790 ?auto_265791 ?auto_265792 ?auto_265793 ?auto_265794 ?auto_265795 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265807 - BLOCK
      ?auto_265808 - BLOCK
      ?auto_265809 - BLOCK
      ?auto_265810 - BLOCK
      ?auto_265811 - BLOCK
      ?auto_265812 - BLOCK
      ?auto_265813 - BLOCK
      ?auto_265814 - BLOCK
      ?auto_265815 - BLOCK
      ?auto_265816 - BLOCK
    )
    :vars
    (
      ?auto_265817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265816 ?auto_265817 ) ( ON-TABLE ?auto_265807 ) ( ON ?auto_265808 ?auto_265807 ) ( ON ?auto_265809 ?auto_265808 ) ( ON ?auto_265810 ?auto_265809 ) ( ON ?auto_265811 ?auto_265810 ) ( ON ?auto_265812 ?auto_265811 ) ( ON ?auto_265813 ?auto_265812 ) ( ON ?auto_265814 ?auto_265813 ) ( not ( = ?auto_265807 ?auto_265808 ) ) ( not ( = ?auto_265807 ?auto_265809 ) ) ( not ( = ?auto_265807 ?auto_265810 ) ) ( not ( = ?auto_265807 ?auto_265811 ) ) ( not ( = ?auto_265807 ?auto_265812 ) ) ( not ( = ?auto_265807 ?auto_265813 ) ) ( not ( = ?auto_265807 ?auto_265814 ) ) ( not ( = ?auto_265807 ?auto_265815 ) ) ( not ( = ?auto_265807 ?auto_265816 ) ) ( not ( = ?auto_265807 ?auto_265817 ) ) ( not ( = ?auto_265808 ?auto_265809 ) ) ( not ( = ?auto_265808 ?auto_265810 ) ) ( not ( = ?auto_265808 ?auto_265811 ) ) ( not ( = ?auto_265808 ?auto_265812 ) ) ( not ( = ?auto_265808 ?auto_265813 ) ) ( not ( = ?auto_265808 ?auto_265814 ) ) ( not ( = ?auto_265808 ?auto_265815 ) ) ( not ( = ?auto_265808 ?auto_265816 ) ) ( not ( = ?auto_265808 ?auto_265817 ) ) ( not ( = ?auto_265809 ?auto_265810 ) ) ( not ( = ?auto_265809 ?auto_265811 ) ) ( not ( = ?auto_265809 ?auto_265812 ) ) ( not ( = ?auto_265809 ?auto_265813 ) ) ( not ( = ?auto_265809 ?auto_265814 ) ) ( not ( = ?auto_265809 ?auto_265815 ) ) ( not ( = ?auto_265809 ?auto_265816 ) ) ( not ( = ?auto_265809 ?auto_265817 ) ) ( not ( = ?auto_265810 ?auto_265811 ) ) ( not ( = ?auto_265810 ?auto_265812 ) ) ( not ( = ?auto_265810 ?auto_265813 ) ) ( not ( = ?auto_265810 ?auto_265814 ) ) ( not ( = ?auto_265810 ?auto_265815 ) ) ( not ( = ?auto_265810 ?auto_265816 ) ) ( not ( = ?auto_265810 ?auto_265817 ) ) ( not ( = ?auto_265811 ?auto_265812 ) ) ( not ( = ?auto_265811 ?auto_265813 ) ) ( not ( = ?auto_265811 ?auto_265814 ) ) ( not ( = ?auto_265811 ?auto_265815 ) ) ( not ( = ?auto_265811 ?auto_265816 ) ) ( not ( = ?auto_265811 ?auto_265817 ) ) ( not ( = ?auto_265812 ?auto_265813 ) ) ( not ( = ?auto_265812 ?auto_265814 ) ) ( not ( = ?auto_265812 ?auto_265815 ) ) ( not ( = ?auto_265812 ?auto_265816 ) ) ( not ( = ?auto_265812 ?auto_265817 ) ) ( not ( = ?auto_265813 ?auto_265814 ) ) ( not ( = ?auto_265813 ?auto_265815 ) ) ( not ( = ?auto_265813 ?auto_265816 ) ) ( not ( = ?auto_265813 ?auto_265817 ) ) ( not ( = ?auto_265814 ?auto_265815 ) ) ( not ( = ?auto_265814 ?auto_265816 ) ) ( not ( = ?auto_265814 ?auto_265817 ) ) ( not ( = ?auto_265815 ?auto_265816 ) ) ( not ( = ?auto_265815 ?auto_265817 ) ) ( not ( = ?auto_265816 ?auto_265817 ) ) ( CLEAR ?auto_265814 ) ( ON ?auto_265815 ?auto_265816 ) ( CLEAR ?auto_265815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_265807 ?auto_265808 ?auto_265809 ?auto_265810 ?auto_265811 ?auto_265812 ?auto_265813 ?auto_265814 ?auto_265815 )
      ( MAKE-10PILE ?auto_265807 ?auto_265808 ?auto_265809 ?auto_265810 ?auto_265811 ?auto_265812 ?auto_265813 ?auto_265814 ?auto_265815 ?auto_265816 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265828 - BLOCK
      ?auto_265829 - BLOCK
      ?auto_265830 - BLOCK
      ?auto_265831 - BLOCK
      ?auto_265832 - BLOCK
      ?auto_265833 - BLOCK
      ?auto_265834 - BLOCK
      ?auto_265835 - BLOCK
      ?auto_265836 - BLOCK
      ?auto_265837 - BLOCK
    )
    :vars
    (
      ?auto_265838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265837 ?auto_265838 ) ( ON-TABLE ?auto_265828 ) ( ON ?auto_265829 ?auto_265828 ) ( ON ?auto_265830 ?auto_265829 ) ( ON ?auto_265831 ?auto_265830 ) ( ON ?auto_265832 ?auto_265831 ) ( ON ?auto_265833 ?auto_265832 ) ( ON ?auto_265834 ?auto_265833 ) ( not ( = ?auto_265828 ?auto_265829 ) ) ( not ( = ?auto_265828 ?auto_265830 ) ) ( not ( = ?auto_265828 ?auto_265831 ) ) ( not ( = ?auto_265828 ?auto_265832 ) ) ( not ( = ?auto_265828 ?auto_265833 ) ) ( not ( = ?auto_265828 ?auto_265834 ) ) ( not ( = ?auto_265828 ?auto_265835 ) ) ( not ( = ?auto_265828 ?auto_265836 ) ) ( not ( = ?auto_265828 ?auto_265837 ) ) ( not ( = ?auto_265828 ?auto_265838 ) ) ( not ( = ?auto_265829 ?auto_265830 ) ) ( not ( = ?auto_265829 ?auto_265831 ) ) ( not ( = ?auto_265829 ?auto_265832 ) ) ( not ( = ?auto_265829 ?auto_265833 ) ) ( not ( = ?auto_265829 ?auto_265834 ) ) ( not ( = ?auto_265829 ?auto_265835 ) ) ( not ( = ?auto_265829 ?auto_265836 ) ) ( not ( = ?auto_265829 ?auto_265837 ) ) ( not ( = ?auto_265829 ?auto_265838 ) ) ( not ( = ?auto_265830 ?auto_265831 ) ) ( not ( = ?auto_265830 ?auto_265832 ) ) ( not ( = ?auto_265830 ?auto_265833 ) ) ( not ( = ?auto_265830 ?auto_265834 ) ) ( not ( = ?auto_265830 ?auto_265835 ) ) ( not ( = ?auto_265830 ?auto_265836 ) ) ( not ( = ?auto_265830 ?auto_265837 ) ) ( not ( = ?auto_265830 ?auto_265838 ) ) ( not ( = ?auto_265831 ?auto_265832 ) ) ( not ( = ?auto_265831 ?auto_265833 ) ) ( not ( = ?auto_265831 ?auto_265834 ) ) ( not ( = ?auto_265831 ?auto_265835 ) ) ( not ( = ?auto_265831 ?auto_265836 ) ) ( not ( = ?auto_265831 ?auto_265837 ) ) ( not ( = ?auto_265831 ?auto_265838 ) ) ( not ( = ?auto_265832 ?auto_265833 ) ) ( not ( = ?auto_265832 ?auto_265834 ) ) ( not ( = ?auto_265832 ?auto_265835 ) ) ( not ( = ?auto_265832 ?auto_265836 ) ) ( not ( = ?auto_265832 ?auto_265837 ) ) ( not ( = ?auto_265832 ?auto_265838 ) ) ( not ( = ?auto_265833 ?auto_265834 ) ) ( not ( = ?auto_265833 ?auto_265835 ) ) ( not ( = ?auto_265833 ?auto_265836 ) ) ( not ( = ?auto_265833 ?auto_265837 ) ) ( not ( = ?auto_265833 ?auto_265838 ) ) ( not ( = ?auto_265834 ?auto_265835 ) ) ( not ( = ?auto_265834 ?auto_265836 ) ) ( not ( = ?auto_265834 ?auto_265837 ) ) ( not ( = ?auto_265834 ?auto_265838 ) ) ( not ( = ?auto_265835 ?auto_265836 ) ) ( not ( = ?auto_265835 ?auto_265837 ) ) ( not ( = ?auto_265835 ?auto_265838 ) ) ( not ( = ?auto_265836 ?auto_265837 ) ) ( not ( = ?auto_265836 ?auto_265838 ) ) ( not ( = ?auto_265837 ?auto_265838 ) ) ( ON ?auto_265836 ?auto_265837 ) ( CLEAR ?auto_265834 ) ( ON ?auto_265835 ?auto_265836 ) ( CLEAR ?auto_265835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_265828 ?auto_265829 ?auto_265830 ?auto_265831 ?auto_265832 ?auto_265833 ?auto_265834 ?auto_265835 )
      ( MAKE-10PILE ?auto_265828 ?auto_265829 ?auto_265830 ?auto_265831 ?auto_265832 ?auto_265833 ?auto_265834 ?auto_265835 ?auto_265836 ?auto_265837 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265849 - BLOCK
      ?auto_265850 - BLOCK
      ?auto_265851 - BLOCK
      ?auto_265852 - BLOCK
      ?auto_265853 - BLOCK
      ?auto_265854 - BLOCK
      ?auto_265855 - BLOCK
      ?auto_265856 - BLOCK
      ?auto_265857 - BLOCK
      ?auto_265858 - BLOCK
    )
    :vars
    (
      ?auto_265859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265858 ?auto_265859 ) ( ON-TABLE ?auto_265849 ) ( ON ?auto_265850 ?auto_265849 ) ( ON ?auto_265851 ?auto_265850 ) ( ON ?auto_265852 ?auto_265851 ) ( ON ?auto_265853 ?auto_265852 ) ( ON ?auto_265854 ?auto_265853 ) ( ON ?auto_265855 ?auto_265854 ) ( not ( = ?auto_265849 ?auto_265850 ) ) ( not ( = ?auto_265849 ?auto_265851 ) ) ( not ( = ?auto_265849 ?auto_265852 ) ) ( not ( = ?auto_265849 ?auto_265853 ) ) ( not ( = ?auto_265849 ?auto_265854 ) ) ( not ( = ?auto_265849 ?auto_265855 ) ) ( not ( = ?auto_265849 ?auto_265856 ) ) ( not ( = ?auto_265849 ?auto_265857 ) ) ( not ( = ?auto_265849 ?auto_265858 ) ) ( not ( = ?auto_265849 ?auto_265859 ) ) ( not ( = ?auto_265850 ?auto_265851 ) ) ( not ( = ?auto_265850 ?auto_265852 ) ) ( not ( = ?auto_265850 ?auto_265853 ) ) ( not ( = ?auto_265850 ?auto_265854 ) ) ( not ( = ?auto_265850 ?auto_265855 ) ) ( not ( = ?auto_265850 ?auto_265856 ) ) ( not ( = ?auto_265850 ?auto_265857 ) ) ( not ( = ?auto_265850 ?auto_265858 ) ) ( not ( = ?auto_265850 ?auto_265859 ) ) ( not ( = ?auto_265851 ?auto_265852 ) ) ( not ( = ?auto_265851 ?auto_265853 ) ) ( not ( = ?auto_265851 ?auto_265854 ) ) ( not ( = ?auto_265851 ?auto_265855 ) ) ( not ( = ?auto_265851 ?auto_265856 ) ) ( not ( = ?auto_265851 ?auto_265857 ) ) ( not ( = ?auto_265851 ?auto_265858 ) ) ( not ( = ?auto_265851 ?auto_265859 ) ) ( not ( = ?auto_265852 ?auto_265853 ) ) ( not ( = ?auto_265852 ?auto_265854 ) ) ( not ( = ?auto_265852 ?auto_265855 ) ) ( not ( = ?auto_265852 ?auto_265856 ) ) ( not ( = ?auto_265852 ?auto_265857 ) ) ( not ( = ?auto_265852 ?auto_265858 ) ) ( not ( = ?auto_265852 ?auto_265859 ) ) ( not ( = ?auto_265853 ?auto_265854 ) ) ( not ( = ?auto_265853 ?auto_265855 ) ) ( not ( = ?auto_265853 ?auto_265856 ) ) ( not ( = ?auto_265853 ?auto_265857 ) ) ( not ( = ?auto_265853 ?auto_265858 ) ) ( not ( = ?auto_265853 ?auto_265859 ) ) ( not ( = ?auto_265854 ?auto_265855 ) ) ( not ( = ?auto_265854 ?auto_265856 ) ) ( not ( = ?auto_265854 ?auto_265857 ) ) ( not ( = ?auto_265854 ?auto_265858 ) ) ( not ( = ?auto_265854 ?auto_265859 ) ) ( not ( = ?auto_265855 ?auto_265856 ) ) ( not ( = ?auto_265855 ?auto_265857 ) ) ( not ( = ?auto_265855 ?auto_265858 ) ) ( not ( = ?auto_265855 ?auto_265859 ) ) ( not ( = ?auto_265856 ?auto_265857 ) ) ( not ( = ?auto_265856 ?auto_265858 ) ) ( not ( = ?auto_265856 ?auto_265859 ) ) ( not ( = ?auto_265857 ?auto_265858 ) ) ( not ( = ?auto_265857 ?auto_265859 ) ) ( not ( = ?auto_265858 ?auto_265859 ) ) ( ON ?auto_265857 ?auto_265858 ) ( CLEAR ?auto_265855 ) ( ON ?auto_265856 ?auto_265857 ) ( CLEAR ?auto_265856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_265849 ?auto_265850 ?auto_265851 ?auto_265852 ?auto_265853 ?auto_265854 ?auto_265855 ?auto_265856 )
      ( MAKE-10PILE ?auto_265849 ?auto_265850 ?auto_265851 ?auto_265852 ?auto_265853 ?auto_265854 ?auto_265855 ?auto_265856 ?auto_265857 ?auto_265858 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265870 - BLOCK
      ?auto_265871 - BLOCK
      ?auto_265872 - BLOCK
      ?auto_265873 - BLOCK
      ?auto_265874 - BLOCK
      ?auto_265875 - BLOCK
      ?auto_265876 - BLOCK
      ?auto_265877 - BLOCK
      ?auto_265878 - BLOCK
      ?auto_265879 - BLOCK
    )
    :vars
    (
      ?auto_265880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265879 ?auto_265880 ) ( ON-TABLE ?auto_265870 ) ( ON ?auto_265871 ?auto_265870 ) ( ON ?auto_265872 ?auto_265871 ) ( ON ?auto_265873 ?auto_265872 ) ( ON ?auto_265874 ?auto_265873 ) ( ON ?auto_265875 ?auto_265874 ) ( not ( = ?auto_265870 ?auto_265871 ) ) ( not ( = ?auto_265870 ?auto_265872 ) ) ( not ( = ?auto_265870 ?auto_265873 ) ) ( not ( = ?auto_265870 ?auto_265874 ) ) ( not ( = ?auto_265870 ?auto_265875 ) ) ( not ( = ?auto_265870 ?auto_265876 ) ) ( not ( = ?auto_265870 ?auto_265877 ) ) ( not ( = ?auto_265870 ?auto_265878 ) ) ( not ( = ?auto_265870 ?auto_265879 ) ) ( not ( = ?auto_265870 ?auto_265880 ) ) ( not ( = ?auto_265871 ?auto_265872 ) ) ( not ( = ?auto_265871 ?auto_265873 ) ) ( not ( = ?auto_265871 ?auto_265874 ) ) ( not ( = ?auto_265871 ?auto_265875 ) ) ( not ( = ?auto_265871 ?auto_265876 ) ) ( not ( = ?auto_265871 ?auto_265877 ) ) ( not ( = ?auto_265871 ?auto_265878 ) ) ( not ( = ?auto_265871 ?auto_265879 ) ) ( not ( = ?auto_265871 ?auto_265880 ) ) ( not ( = ?auto_265872 ?auto_265873 ) ) ( not ( = ?auto_265872 ?auto_265874 ) ) ( not ( = ?auto_265872 ?auto_265875 ) ) ( not ( = ?auto_265872 ?auto_265876 ) ) ( not ( = ?auto_265872 ?auto_265877 ) ) ( not ( = ?auto_265872 ?auto_265878 ) ) ( not ( = ?auto_265872 ?auto_265879 ) ) ( not ( = ?auto_265872 ?auto_265880 ) ) ( not ( = ?auto_265873 ?auto_265874 ) ) ( not ( = ?auto_265873 ?auto_265875 ) ) ( not ( = ?auto_265873 ?auto_265876 ) ) ( not ( = ?auto_265873 ?auto_265877 ) ) ( not ( = ?auto_265873 ?auto_265878 ) ) ( not ( = ?auto_265873 ?auto_265879 ) ) ( not ( = ?auto_265873 ?auto_265880 ) ) ( not ( = ?auto_265874 ?auto_265875 ) ) ( not ( = ?auto_265874 ?auto_265876 ) ) ( not ( = ?auto_265874 ?auto_265877 ) ) ( not ( = ?auto_265874 ?auto_265878 ) ) ( not ( = ?auto_265874 ?auto_265879 ) ) ( not ( = ?auto_265874 ?auto_265880 ) ) ( not ( = ?auto_265875 ?auto_265876 ) ) ( not ( = ?auto_265875 ?auto_265877 ) ) ( not ( = ?auto_265875 ?auto_265878 ) ) ( not ( = ?auto_265875 ?auto_265879 ) ) ( not ( = ?auto_265875 ?auto_265880 ) ) ( not ( = ?auto_265876 ?auto_265877 ) ) ( not ( = ?auto_265876 ?auto_265878 ) ) ( not ( = ?auto_265876 ?auto_265879 ) ) ( not ( = ?auto_265876 ?auto_265880 ) ) ( not ( = ?auto_265877 ?auto_265878 ) ) ( not ( = ?auto_265877 ?auto_265879 ) ) ( not ( = ?auto_265877 ?auto_265880 ) ) ( not ( = ?auto_265878 ?auto_265879 ) ) ( not ( = ?auto_265878 ?auto_265880 ) ) ( not ( = ?auto_265879 ?auto_265880 ) ) ( ON ?auto_265878 ?auto_265879 ) ( ON ?auto_265877 ?auto_265878 ) ( CLEAR ?auto_265875 ) ( ON ?auto_265876 ?auto_265877 ) ( CLEAR ?auto_265876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265870 ?auto_265871 ?auto_265872 ?auto_265873 ?auto_265874 ?auto_265875 ?auto_265876 )
      ( MAKE-10PILE ?auto_265870 ?auto_265871 ?auto_265872 ?auto_265873 ?auto_265874 ?auto_265875 ?auto_265876 ?auto_265877 ?auto_265878 ?auto_265879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265891 - BLOCK
      ?auto_265892 - BLOCK
      ?auto_265893 - BLOCK
      ?auto_265894 - BLOCK
      ?auto_265895 - BLOCK
      ?auto_265896 - BLOCK
      ?auto_265897 - BLOCK
      ?auto_265898 - BLOCK
      ?auto_265899 - BLOCK
      ?auto_265900 - BLOCK
    )
    :vars
    (
      ?auto_265901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265900 ?auto_265901 ) ( ON-TABLE ?auto_265891 ) ( ON ?auto_265892 ?auto_265891 ) ( ON ?auto_265893 ?auto_265892 ) ( ON ?auto_265894 ?auto_265893 ) ( ON ?auto_265895 ?auto_265894 ) ( ON ?auto_265896 ?auto_265895 ) ( not ( = ?auto_265891 ?auto_265892 ) ) ( not ( = ?auto_265891 ?auto_265893 ) ) ( not ( = ?auto_265891 ?auto_265894 ) ) ( not ( = ?auto_265891 ?auto_265895 ) ) ( not ( = ?auto_265891 ?auto_265896 ) ) ( not ( = ?auto_265891 ?auto_265897 ) ) ( not ( = ?auto_265891 ?auto_265898 ) ) ( not ( = ?auto_265891 ?auto_265899 ) ) ( not ( = ?auto_265891 ?auto_265900 ) ) ( not ( = ?auto_265891 ?auto_265901 ) ) ( not ( = ?auto_265892 ?auto_265893 ) ) ( not ( = ?auto_265892 ?auto_265894 ) ) ( not ( = ?auto_265892 ?auto_265895 ) ) ( not ( = ?auto_265892 ?auto_265896 ) ) ( not ( = ?auto_265892 ?auto_265897 ) ) ( not ( = ?auto_265892 ?auto_265898 ) ) ( not ( = ?auto_265892 ?auto_265899 ) ) ( not ( = ?auto_265892 ?auto_265900 ) ) ( not ( = ?auto_265892 ?auto_265901 ) ) ( not ( = ?auto_265893 ?auto_265894 ) ) ( not ( = ?auto_265893 ?auto_265895 ) ) ( not ( = ?auto_265893 ?auto_265896 ) ) ( not ( = ?auto_265893 ?auto_265897 ) ) ( not ( = ?auto_265893 ?auto_265898 ) ) ( not ( = ?auto_265893 ?auto_265899 ) ) ( not ( = ?auto_265893 ?auto_265900 ) ) ( not ( = ?auto_265893 ?auto_265901 ) ) ( not ( = ?auto_265894 ?auto_265895 ) ) ( not ( = ?auto_265894 ?auto_265896 ) ) ( not ( = ?auto_265894 ?auto_265897 ) ) ( not ( = ?auto_265894 ?auto_265898 ) ) ( not ( = ?auto_265894 ?auto_265899 ) ) ( not ( = ?auto_265894 ?auto_265900 ) ) ( not ( = ?auto_265894 ?auto_265901 ) ) ( not ( = ?auto_265895 ?auto_265896 ) ) ( not ( = ?auto_265895 ?auto_265897 ) ) ( not ( = ?auto_265895 ?auto_265898 ) ) ( not ( = ?auto_265895 ?auto_265899 ) ) ( not ( = ?auto_265895 ?auto_265900 ) ) ( not ( = ?auto_265895 ?auto_265901 ) ) ( not ( = ?auto_265896 ?auto_265897 ) ) ( not ( = ?auto_265896 ?auto_265898 ) ) ( not ( = ?auto_265896 ?auto_265899 ) ) ( not ( = ?auto_265896 ?auto_265900 ) ) ( not ( = ?auto_265896 ?auto_265901 ) ) ( not ( = ?auto_265897 ?auto_265898 ) ) ( not ( = ?auto_265897 ?auto_265899 ) ) ( not ( = ?auto_265897 ?auto_265900 ) ) ( not ( = ?auto_265897 ?auto_265901 ) ) ( not ( = ?auto_265898 ?auto_265899 ) ) ( not ( = ?auto_265898 ?auto_265900 ) ) ( not ( = ?auto_265898 ?auto_265901 ) ) ( not ( = ?auto_265899 ?auto_265900 ) ) ( not ( = ?auto_265899 ?auto_265901 ) ) ( not ( = ?auto_265900 ?auto_265901 ) ) ( ON ?auto_265899 ?auto_265900 ) ( ON ?auto_265898 ?auto_265899 ) ( CLEAR ?auto_265896 ) ( ON ?auto_265897 ?auto_265898 ) ( CLEAR ?auto_265897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_265891 ?auto_265892 ?auto_265893 ?auto_265894 ?auto_265895 ?auto_265896 ?auto_265897 )
      ( MAKE-10PILE ?auto_265891 ?auto_265892 ?auto_265893 ?auto_265894 ?auto_265895 ?auto_265896 ?auto_265897 ?auto_265898 ?auto_265899 ?auto_265900 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265912 - BLOCK
      ?auto_265913 - BLOCK
      ?auto_265914 - BLOCK
      ?auto_265915 - BLOCK
      ?auto_265916 - BLOCK
      ?auto_265917 - BLOCK
      ?auto_265918 - BLOCK
      ?auto_265919 - BLOCK
      ?auto_265920 - BLOCK
      ?auto_265921 - BLOCK
    )
    :vars
    (
      ?auto_265922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265921 ?auto_265922 ) ( ON-TABLE ?auto_265912 ) ( ON ?auto_265913 ?auto_265912 ) ( ON ?auto_265914 ?auto_265913 ) ( ON ?auto_265915 ?auto_265914 ) ( ON ?auto_265916 ?auto_265915 ) ( not ( = ?auto_265912 ?auto_265913 ) ) ( not ( = ?auto_265912 ?auto_265914 ) ) ( not ( = ?auto_265912 ?auto_265915 ) ) ( not ( = ?auto_265912 ?auto_265916 ) ) ( not ( = ?auto_265912 ?auto_265917 ) ) ( not ( = ?auto_265912 ?auto_265918 ) ) ( not ( = ?auto_265912 ?auto_265919 ) ) ( not ( = ?auto_265912 ?auto_265920 ) ) ( not ( = ?auto_265912 ?auto_265921 ) ) ( not ( = ?auto_265912 ?auto_265922 ) ) ( not ( = ?auto_265913 ?auto_265914 ) ) ( not ( = ?auto_265913 ?auto_265915 ) ) ( not ( = ?auto_265913 ?auto_265916 ) ) ( not ( = ?auto_265913 ?auto_265917 ) ) ( not ( = ?auto_265913 ?auto_265918 ) ) ( not ( = ?auto_265913 ?auto_265919 ) ) ( not ( = ?auto_265913 ?auto_265920 ) ) ( not ( = ?auto_265913 ?auto_265921 ) ) ( not ( = ?auto_265913 ?auto_265922 ) ) ( not ( = ?auto_265914 ?auto_265915 ) ) ( not ( = ?auto_265914 ?auto_265916 ) ) ( not ( = ?auto_265914 ?auto_265917 ) ) ( not ( = ?auto_265914 ?auto_265918 ) ) ( not ( = ?auto_265914 ?auto_265919 ) ) ( not ( = ?auto_265914 ?auto_265920 ) ) ( not ( = ?auto_265914 ?auto_265921 ) ) ( not ( = ?auto_265914 ?auto_265922 ) ) ( not ( = ?auto_265915 ?auto_265916 ) ) ( not ( = ?auto_265915 ?auto_265917 ) ) ( not ( = ?auto_265915 ?auto_265918 ) ) ( not ( = ?auto_265915 ?auto_265919 ) ) ( not ( = ?auto_265915 ?auto_265920 ) ) ( not ( = ?auto_265915 ?auto_265921 ) ) ( not ( = ?auto_265915 ?auto_265922 ) ) ( not ( = ?auto_265916 ?auto_265917 ) ) ( not ( = ?auto_265916 ?auto_265918 ) ) ( not ( = ?auto_265916 ?auto_265919 ) ) ( not ( = ?auto_265916 ?auto_265920 ) ) ( not ( = ?auto_265916 ?auto_265921 ) ) ( not ( = ?auto_265916 ?auto_265922 ) ) ( not ( = ?auto_265917 ?auto_265918 ) ) ( not ( = ?auto_265917 ?auto_265919 ) ) ( not ( = ?auto_265917 ?auto_265920 ) ) ( not ( = ?auto_265917 ?auto_265921 ) ) ( not ( = ?auto_265917 ?auto_265922 ) ) ( not ( = ?auto_265918 ?auto_265919 ) ) ( not ( = ?auto_265918 ?auto_265920 ) ) ( not ( = ?auto_265918 ?auto_265921 ) ) ( not ( = ?auto_265918 ?auto_265922 ) ) ( not ( = ?auto_265919 ?auto_265920 ) ) ( not ( = ?auto_265919 ?auto_265921 ) ) ( not ( = ?auto_265919 ?auto_265922 ) ) ( not ( = ?auto_265920 ?auto_265921 ) ) ( not ( = ?auto_265920 ?auto_265922 ) ) ( not ( = ?auto_265921 ?auto_265922 ) ) ( ON ?auto_265920 ?auto_265921 ) ( ON ?auto_265919 ?auto_265920 ) ( ON ?auto_265918 ?auto_265919 ) ( CLEAR ?auto_265916 ) ( ON ?auto_265917 ?auto_265918 ) ( CLEAR ?auto_265917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265912 ?auto_265913 ?auto_265914 ?auto_265915 ?auto_265916 ?auto_265917 )
      ( MAKE-10PILE ?auto_265912 ?auto_265913 ?auto_265914 ?auto_265915 ?auto_265916 ?auto_265917 ?auto_265918 ?auto_265919 ?auto_265920 ?auto_265921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265933 - BLOCK
      ?auto_265934 - BLOCK
      ?auto_265935 - BLOCK
      ?auto_265936 - BLOCK
      ?auto_265937 - BLOCK
      ?auto_265938 - BLOCK
      ?auto_265939 - BLOCK
      ?auto_265940 - BLOCK
      ?auto_265941 - BLOCK
      ?auto_265942 - BLOCK
    )
    :vars
    (
      ?auto_265943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265942 ?auto_265943 ) ( ON-TABLE ?auto_265933 ) ( ON ?auto_265934 ?auto_265933 ) ( ON ?auto_265935 ?auto_265934 ) ( ON ?auto_265936 ?auto_265935 ) ( ON ?auto_265937 ?auto_265936 ) ( not ( = ?auto_265933 ?auto_265934 ) ) ( not ( = ?auto_265933 ?auto_265935 ) ) ( not ( = ?auto_265933 ?auto_265936 ) ) ( not ( = ?auto_265933 ?auto_265937 ) ) ( not ( = ?auto_265933 ?auto_265938 ) ) ( not ( = ?auto_265933 ?auto_265939 ) ) ( not ( = ?auto_265933 ?auto_265940 ) ) ( not ( = ?auto_265933 ?auto_265941 ) ) ( not ( = ?auto_265933 ?auto_265942 ) ) ( not ( = ?auto_265933 ?auto_265943 ) ) ( not ( = ?auto_265934 ?auto_265935 ) ) ( not ( = ?auto_265934 ?auto_265936 ) ) ( not ( = ?auto_265934 ?auto_265937 ) ) ( not ( = ?auto_265934 ?auto_265938 ) ) ( not ( = ?auto_265934 ?auto_265939 ) ) ( not ( = ?auto_265934 ?auto_265940 ) ) ( not ( = ?auto_265934 ?auto_265941 ) ) ( not ( = ?auto_265934 ?auto_265942 ) ) ( not ( = ?auto_265934 ?auto_265943 ) ) ( not ( = ?auto_265935 ?auto_265936 ) ) ( not ( = ?auto_265935 ?auto_265937 ) ) ( not ( = ?auto_265935 ?auto_265938 ) ) ( not ( = ?auto_265935 ?auto_265939 ) ) ( not ( = ?auto_265935 ?auto_265940 ) ) ( not ( = ?auto_265935 ?auto_265941 ) ) ( not ( = ?auto_265935 ?auto_265942 ) ) ( not ( = ?auto_265935 ?auto_265943 ) ) ( not ( = ?auto_265936 ?auto_265937 ) ) ( not ( = ?auto_265936 ?auto_265938 ) ) ( not ( = ?auto_265936 ?auto_265939 ) ) ( not ( = ?auto_265936 ?auto_265940 ) ) ( not ( = ?auto_265936 ?auto_265941 ) ) ( not ( = ?auto_265936 ?auto_265942 ) ) ( not ( = ?auto_265936 ?auto_265943 ) ) ( not ( = ?auto_265937 ?auto_265938 ) ) ( not ( = ?auto_265937 ?auto_265939 ) ) ( not ( = ?auto_265937 ?auto_265940 ) ) ( not ( = ?auto_265937 ?auto_265941 ) ) ( not ( = ?auto_265937 ?auto_265942 ) ) ( not ( = ?auto_265937 ?auto_265943 ) ) ( not ( = ?auto_265938 ?auto_265939 ) ) ( not ( = ?auto_265938 ?auto_265940 ) ) ( not ( = ?auto_265938 ?auto_265941 ) ) ( not ( = ?auto_265938 ?auto_265942 ) ) ( not ( = ?auto_265938 ?auto_265943 ) ) ( not ( = ?auto_265939 ?auto_265940 ) ) ( not ( = ?auto_265939 ?auto_265941 ) ) ( not ( = ?auto_265939 ?auto_265942 ) ) ( not ( = ?auto_265939 ?auto_265943 ) ) ( not ( = ?auto_265940 ?auto_265941 ) ) ( not ( = ?auto_265940 ?auto_265942 ) ) ( not ( = ?auto_265940 ?auto_265943 ) ) ( not ( = ?auto_265941 ?auto_265942 ) ) ( not ( = ?auto_265941 ?auto_265943 ) ) ( not ( = ?auto_265942 ?auto_265943 ) ) ( ON ?auto_265941 ?auto_265942 ) ( ON ?auto_265940 ?auto_265941 ) ( ON ?auto_265939 ?auto_265940 ) ( CLEAR ?auto_265937 ) ( ON ?auto_265938 ?auto_265939 ) ( CLEAR ?auto_265938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_265933 ?auto_265934 ?auto_265935 ?auto_265936 ?auto_265937 ?auto_265938 )
      ( MAKE-10PILE ?auto_265933 ?auto_265934 ?auto_265935 ?auto_265936 ?auto_265937 ?auto_265938 ?auto_265939 ?auto_265940 ?auto_265941 ?auto_265942 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265954 - BLOCK
      ?auto_265955 - BLOCK
      ?auto_265956 - BLOCK
      ?auto_265957 - BLOCK
      ?auto_265958 - BLOCK
      ?auto_265959 - BLOCK
      ?auto_265960 - BLOCK
      ?auto_265961 - BLOCK
      ?auto_265962 - BLOCK
      ?auto_265963 - BLOCK
    )
    :vars
    (
      ?auto_265964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265963 ?auto_265964 ) ( ON-TABLE ?auto_265954 ) ( ON ?auto_265955 ?auto_265954 ) ( ON ?auto_265956 ?auto_265955 ) ( ON ?auto_265957 ?auto_265956 ) ( not ( = ?auto_265954 ?auto_265955 ) ) ( not ( = ?auto_265954 ?auto_265956 ) ) ( not ( = ?auto_265954 ?auto_265957 ) ) ( not ( = ?auto_265954 ?auto_265958 ) ) ( not ( = ?auto_265954 ?auto_265959 ) ) ( not ( = ?auto_265954 ?auto_265960 ) ) ( not ( = ?auto_265954 ?auto_265961 ) ) ( not ( = ?auto_265954 ?auto_265962 ) ) ( not ( = ?auto_265954 ?auto_265963 ) ) ( not ( = ?auto_265954 ?auto_265964 ) ) ( not ( = ?auto_265955 ?auto_265956 ) ) ( not ( = ?auto_265955 ?auto_265957 ) ) ( not ( = ?auto_265955 ?auto_265958 ) ) ( not ( = ?auto_265955 ?auto_265959 ) ) ( not ( = ?auto_265955 ?auto_265960 ) ) ( not ( = ?auto_265955 ?auto_265961 ) ) ( not ( = ?auto_265955 ?auto_265962 ) ) ( not ( = ?auto_265955 ?auto_265963 ) ) ( not ( = ?auto_265955 ?auto_265964 ) ) ( not ( = ?auto_265956 ?auto_265957 ) ) ( not ( = ?auto_265956 ?auto_265958 ) ) ( not ( = ?auto_265956 ?auto_265959 ) ) ( not ( = ?auto_265956 ?auto_265960 ) ) ( not ( = ?auto_265956 ?auto_265961 ) ) ( not ( = ?auto_265956 ?auto_265962 ) ) ( not ( = ?auto_265956 ?auto_265963 ) ) ( not ( = ?auto_265956 ?auto_265964 ) ) ( not ( = ?auto_265957 ?auto_265958 ) ) ( not ( = ?auto_265957 ?auto_265959 ) ) ( not ( = ?auto_265957 ?auto_265960 ) ) ( not ( = ?auto_265957 ?auto_265961 ) ) ( not ( = ?auto_265957 ?auto_265962 ) ) ( not ( = ?auto_265957 ?auto_265963 ) ) ( not ( = ?auto_265957 ?auto_265964 ) ) ( not ( = ?auto_265958 ?auto_265959 ) ) ( not ( = ?auto_265958 ?auto_265960 ) ) ( not ( = ?auto_265958 ?auto_265961 ) ) ( not ( = ?auto_265958 ?auto_265962 ) ) ( not ( = ?auto_265958 ?auto_265963 ) ) ( not ( = ?auto_265958 ?auto_265964 ) ) ( not ( = ?auto_265959 ?auto_265960 ) ) ( not ( = ?auto_265959 ?auto_265961 ) ) ( not ( = ?auto_265959 ?auto_265962 ) ) ( not ( = ?auto_265959 ?auto_265963 ) ) ( not ( = ?auto_265959 ?auto_265964 ) ) ( not ( = ?auto_265960 ?auto_265961 ) ) ( not ( = ?auto_265960 ?auto_265962 ) ) ( not ( = ?auto_265960 ?auto_265963 ) ) ( not ( = ?auto_265960 ?auto_265964 ) ) ( not ( = ?auto_265961 ?auto_265962 ) ) ( not ( = ?auto_265961 ?auto_265963 ) ) ( not ( = ?auto_265961 ?auto_265964 ) ) ( not ( = ?auto_265962 ?auto_265963 ) ) ( not ( = ?auto_265962 ?auto_265964 ) ) ( not ( = ?auto_265963 ?auto_265964 ) ) ( ON ?auto_265962 ?auto_265963 ) ( ON ?auto_265961 ?auto_265962 ) ( ON ?auto_265960 ?auto_265961 ) ( ON ?auto_265959 ?auto_265960 ) ( CLEAR ?auto_265957 ) ( ON ?auto_265958 ?auto_265959 ) ( CLEAR ?auto_265958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265954 ?auto_265955 ?auto_265956 ?auto_265957 ?auto_265958 )
      ( MAKE-10PILE ?auto_265954 ?auto_265955 ?auto_265956 ?auto_265957 ?auto_265958 ?auto_265959 ?auto_265960 ?auto_265961 ?auto_265962 ?auto_265963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265975 - BLOCK
      ?auto_265976 - BLOCK
      ?auto_265977 - BLOCK
      ?auto_265978 - BLOCK
      ?auto_265979 - BLOCK
      ?auto_265980 - BLOCK
      ?auto_265981 - BLOCK
      ?auto_265982 - BLOCK
      ?auto_265983 - BLOCK
      ?auto_265984 - BLOCK
    )
    :vars
    (
      ?auto_265985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_265984 ?auto_265985 ) ( ON-TABLE ?auto_265975 ) ( ON ?auto_265976 ?auto_265975 ) ( ON ?auto_265977 ?auto_265976 ) ( ON ?auto_265978 ?auto_265977 ) ( not ( = ?auto_265975 ?auto_265976 ) ) ( not ( = ?auto_265975 ?auto_265977 ) ) ( not ( = ?auto_265975 ?auto_265978 ) ) ( not ( = ?auto_265975 ?auto_265979 ) ) ( not ( = ?auto_265975 ?auto_265980 ) ) ( not ( = ?auto_265975 ?auto_265981 ) ) ( not ( = ?auto_265975 ?auto_265982 ) ) ( not ( = ?auto_265975 ?auto_265983 ) ) ( not ( = ?auto_265975 ?auto_265984 ) ) ( not ( = ?auto_265975 ?auto_265985 ) ) ( not ( = ?auto_265976 ?auto_265977 ) ) ( not ( = ?auto_265976 ?auto_265978 ) ) ( not ( = ?auto_265976 ?auto_265979 ) ) ( not ( = ?auto_265976 ?auto_265980 ) ) ( not ( = ?auto_265976 ?auto_265981 ) ) ( not ( = ?auto_265976 ?auto_265982 ) ) ( not ( = ?auto_265976 ?auto_265983 ) ) ( not ( = ?auto_265976 ?auto_265984 ) ) ( not ( = ?auto_265976 ?auto_265985 ) ) ( not ( = ?auto_265977 ?auto_265978 ) ) ( not ( = ?auto_265977 ?auto_265979 ) ) ( not ( = ?auto_265977 ?auto_265980 ) ) ( not ( = ?auto_265977 ?auto_265981 ) ) ( not ( = ?auto_265977 ?auto_265982 ) ) ( not ( = ?auto_265977 ?auto_265983 ) ) ( not ( = ?auto_265977 ?auto_265984 ) ) ( not ( = ?auto_265977 ?auto_265985 ) ) ( not ( = ?auto_265978 ?auto_265979 ) ) ( not ( = ?auto_265978 ?auto_265980 ) ) ( not ( = ?auto_265978 ?auto_265981 ) ) ( not ( = ?auto_265978 ?auto_265982 ) ) ( not ( = ?auto_265978 ?auto_265983 ) ) ( not ( = ?auto_265978 ?auto_265984 ) ) ( not ( = ?auto_265978 ?auto_265985 ) ) ( not ( = ?auto_265979 ?auto_265980 ) ) ( not ( = ?auto_265979 ?auto_265981 ) ) ( not ( = ?auto_265979 ?auto_265982 ) ) ( not ( = ?auto_265979 ?auto_265983 ) ) ( not ( = ?auto_265979 ?auto_265984 ) ) ( not ( = ?auto_265979 ?auto_265985 ) ) ( not ( = ?auto_265980 ?auto_265981 ) ) ( not ( = ?auto_265980 ?auto_265982 ) ) ( not ( = ?auto_265980 ?auto_265983 ) ) ( not ( = ?auto_265980 ?auto_265984 ) ) ( not ( = ?auto_265980 ?auto_265985 ) ) ( not ( = ?auto_265981 ?auto_265982 ) ) ( not ( = ?auto_265981 ?auto_265983 ) ) ( not ( = ?auto_265981 ?auto_265984 ) ) ( not ( = ?auto_265981 ?auto_265985 ) ) ( not ( = ?auto_265982 ?auto_265983 ) ) ( not ( = ?auto_265982 ?auto_265984 ) ) ( not ( = ?auto_265982 ?auto_265985 ) ) ( not ( = ?auto_265983 ?auto_265984 ) ) ( not ( = ?auto_265983 ?auto_265985 ) ) ( not ( = ?auto_265984 ?auto_265985 ) ) ( ON ?auto_265983 ?auto_265984 ) ( ON ?auto_265982 ?auto_265983 ) ( ON ?auto_265981 ?auto_265982 ) ( ON ?auto_265980 ?auto_265981 ) ( CLEAR ?auto_265978 ) ( ON ?auto_265979 ?auto_265980 ) ( CLEAR ?auto_265979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_265975 ?auto_265976 ?auto_265977 ?auto_265978 ?auto_265979 )
      ( MAKE-10PILE ?auto_265975 ?auto_265976 ?auto_265977 ?auto_265978 ?auto_265979 ?auto_265980 ?auto_265981 ?auto_265982 ?auto_265983 ?auto_265984 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_265996 - BLOCK
      ?auto_265997 - BLOCK
      ?auto_265998 - BLOCK
      ?auto_265999 - BLOCK
      ?auto_266000 - BLOCK
      ?auto_266001 - BLOCK
      ?auto_266002 - BLOCK
      ?auto_266003 - BLOCK
      ?auto_266004 - BLOCK
      ?auto_266005 - BLOCK
    )
    :vars
    (
      ?auto_266006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266005 ?auto_266006 ) ( ON-TABLE ?auto_265996 ) ( ON ?auto_265997 ?auto_265996 ) ( ON ?auto_265998 ?auto_265997 ) ( not ( = ?auto_265996 ?auto_265997 ) ) ( not ( = ?auto_265996 ?auto_265998 ) ) ( not ( = ?auto_265996 ?auto_265999 ) ) ( not ( = ?auto_265996 ?auto_266000 ) ) ( not ( = ?auto_265996 ?auto_266001 ) ) ( not ( = ?auto_265996 ?auto_266002 ) ) ( not ( = ?auto_265996 ?auto_266003 ) ) ( not ( = ?auto_265996 ?auto_266004 ) ) ( not ( = ?auto_265996 ?auto_266005 ) ) ( not ( = ?auto_265996 ?auto_266006 ) ) ( not ( = ?auto_265997 ?auto_265998 ) ) ( not ( = ?auto_265997 ?auto_265999 ) ) ( not ( = ?auto_265997 ?auto_266000 ) ) ( not ( = ?auto_265997 ?auto_266001 ) ) ( not ( = ?auto_265997 ?auto_266002 ) ) ( not ( = ?auto_265997 ?auto_266003 ) ) ( not ( = ?auto_265997 ?auto_266004 ) ) ( not ( = ?auto_265997 ?auto_266005 ) ) ( not ( = ?auto_265997 ?auto_266006 ) ) ( not ( = ?auto_265998 ?auto_265999 ) ) ( not ( = ?auto_265998 ?auto_266000 ) ) ( not ( = ?auto_265998 ?auto_266001 ) ) ( not ( = ?auto_265998 ?auto_266002 ) ) ( not ( = ?auto_265998 ?auto_266003 ) ) ( not ( = ?auto_265998 ?auto_266004 ) ) ( not ( = ?auto_265998 ?auto_266005 ) ) ( not ( = ?auto_265998 ?auto_266006 ) ) ( not ( = ?auto_265999 ?auto_266000 ) ) ( not ( = ?auto_265999 ?auto_266001 ) ) ( not ( = ?auto_265999 ?auto_266002 ) ) ( not ( = ?auto_265999 ?auto_266003 ) ) ( not ( = ?auto_265999 ?auto_266004 ) ) ( not ( = ?auto_265999 ?auto_266005 ) ) ( not ( = ?auto_265999 ?auto_266006 ) ) ( not ( = ?auto_266000 ?auto_266001 ) ) ( not ( = ?auto_266000 ?auto_266002 ) ) ( not ( = ?auto_266000 ?auto_266003 ) ) ( not ( = ?auto_266000 ?auto_266004 ) ) ( not ( = ?auto_266000 ?auto_266005 ) ) ( not ( = ?auto_266000 ?auto_266006 ) ) ( not ( = ?auto_266001 ?auto_266002 ) ) ( not ( = ?auto_266001 ?auto_266003 ) ) ( not ( = ?auto_266001 ?auto_266004 ) ) ( not ( = ?auto_266001 ?auto_266005 ) ) ( not ( = ?auto_266001 ?auto_266006 ) ) ( not ( = ?auto_266002 ?auto_266003 ) ) ( not ( = ?auto_266002 ?auto_266004 ) ) ( not ( = ?auto_266002 ?auto_266005 ) ) ( not ( = ?auto_266002 ?auto_266006 ) ) ( not ( = ?auto_266003 ?auto_266004 ) ) ( not ( = ?auto_266003 ?auto_266005 ) ) ( not ( = ?auto_266003 ?auto_266006 ) ) ( not ( = ?auto_266004 ?auto_266005 ) ) ( not ( = ?auto_266004 ?auto_266006 ) ) ( not ( = ?auto_266005 ?auto_266006 ) ) ( ON ?auto_266004 ?auto_266005 ) ( ON ?auto_266003 ?auto_266004 ) ( ON ?auto_266002 ?auto_266003 ) ( ON ?auto_266001 ?auto_266002 ) ( ON ?auto_266000 ?auto_266001 ) ( CLEAR ?auto_265998 ) ( ON ?auto_265999 ?auto_266000 ) ( CLEAR ?auto_265999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_265996 ?auto_265997 ?auto_265998 ?auto_265999 )
      ( MAKE-10PILE ?auto_265996 ?auto_265997 ?auto_265998 ?auto_265999 ?auto_266000 ?auto_266001 ?auto_266002 ?auto_266003 ?auto_266004 ?auto_266005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266017 - BLOCK
      ?auto_266018 - BLOCK
      ?auto_266019 - BLOCK
      ?auto_266020 - BLOCK
      ?auto_266021 - BLOCK
      ?auto_266022 - BLOCK
      ?auto_266023 - BLOCK
      ?auto_266024 - BLOCK
      ?auto_266025 - BLOCK
      ?auto_266026 - BLOCK
    )
    :vars
    (
      ?auto_266027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266026 ?auto_266027 ) ( ON-TABLE ?auto_266017 ) ( ON ?auto_266018 ?auto_266017 ) ( ON ?auto_266019 ?auto_266018 ) ( not ( = ?auto_266017 ?auto_266018 ) ) ( not ( = ?auto_266017 ?auto_266019 ) ) ( not ( = ?auto_266017 ?auto_266020 ) ) ( not ( = ?auto_266017 ?auto_266021 ) ) ( not ( = ?auto_266017 ?auto_266022 ) ) ( not ( = ?auto_266017 ?auto_266023 ) ) ( not ( = ?auto_266017 ?auto_266024 ) ) ( not ( = ?auto_266017 ?auto_266025 ) ) ( not ( = ?auto_266017 ?auto_266026 ) ) ( not ( = ?auto_266017 ?auto_266027 ) ) ( not ( = ?auto_266018 ?auto_266019 ) ) ( not ( = ?auto_266018 ?auto_266020 ) ) ( not ( = ?auto_266018 ?auto_266021 ) ) ( not ( = ?auto_266018 ?auto_266022 ) ) ( not ( = ?auto_266018 ?auto_266023 ) ) ( not ( = ?auto_266018 ?auto_266024 ) ) ( not ( = ?auto_266018 ?auto_266025 ) ) ( not ( = ?auto_266018 ?auto_266026 ) ) ( not ( = ?auto_266018 ?auto_266027 ) ) ( not ( = ?auto_266019 ?auto_266020 ) ) ( not ( = ?auto_266019 ?auto_266021 ) ) ( not ( = ?auto_266019 ?auto_266022 ) ) ( not ( = ?auto_266019 ?auto_266023 ) ) ( not ( = ?auto_266019 ?auto_266024 ) ) ( not ( = ?auto_266019 ?auto_266025 ) ) ( not ( = ?auto_266019 ?auto_266026 ) ) ( not ( = ?auto_266019 ?auto_266027 ) ) ( not ( = ?auto_266020 ?auto_266021 ) ) ( not ( = ?auto_266020 ?auto_266022 ) ) ( not ( = ?auto_266020 ?auto_266023 ) ) ( not ( = ?auto_266020 ?auto_266024 ) ) ( not ( = ?auto_266020 ?auto_266025 ) ) ( not ( = ?auto_266020 ?auto_266026 ) ) ( not ( = ?auto_266020 ?auto_266027 ) ) ( not ( = ?auto_266021 ?auto_266022 ) ) ( not ( = ?auto_266021 ?auto_266023 ) ) ( not ( = ?auto_266021 ?auto_266024 ) ) ( not ( = ?auto_266021 ?auto_266025 ) ) ( not ( = ?auto_266021 ?auto_266026 ) ) ( not ( = ?auto_266021 ?auto_266027 ) ) ( not ( = ?auto_266022 ?auto_266023 ) ) ( not ( = ?auto_266022 ?auto_266024 ) ) ( not ( = ?auto_266022 ?auto_266025 ) ) ( not ( = ?auto_266022 ?auto_266026 ) ) ( not ( = ?auto_266022 ?auto_266027 ) ) ( not ( = ?auto_266023 ?auto_266024 ) ) ( not ( = ?auto_266023 ?auto_266025 ) ) ( not ( = ?auto_266023 ?auto_266026 ) ) ( not ( = ?auto_266023 ?auto_266027 ) ) ( not ( = ?auto_266024 ?auto_266025 ) ) ( not ( = ?auto_266024 ?auto_266026 ) ) ( not ( = ?auto_266024 ?auto_266027 ) ) ( not ( = ?auto_266025 ?auto_266026 ) ) ( not ( = ?auto_266025 ?auto_266027 ) ) ( not ( = ?auto_266026 ?auto_266027 ) ) ( ON ?auto_266025 ?auto_266026 ) ( ON ?auto_266024 ?auto_266025 ) ( ON ?auto_266023 ?auto_266024 ) ( ON ?auto_266022 ?auto_266023 ) ( ON ?auto_266021 ?auto_266022 ) ( CLEAR ?auto_266019 ) ( ON ?auto_266020 ?auto_266021 ) ( CLEAR ?auto_266020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_266017 ?auto_266018 ?auto_266019 ?auto_266020 )
      ( MAKE-10PILE ?auto_266017 ?auto_266018 ?auto_266019 ?auto_266020 ?auto_266021 ?auto_266022 ?auto_266023 ?auto_266024 ?auto_266025 ?auto_266026 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266038 - BLOCK
      ?auto_266039 - BLOCK
      ?auto_266040 - BLOCK
      ?auto_266041 - BLOCK
      ?auto_266042 - BLOCK
      ?auto_266043 - BLOCK
      ?auto_266044 - BLOCK
      ?auto_266045 - BLOCK
      ?auto_266046 - BLOCK
      ?auto_266047 - BLOCK
    )
    :vars
    (
      ?auto_266048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266047 ?auto_266048 ) ( ON-TABLE ?auto_266038 ) ( ON ?auto_266039 ?auto_266038 ) ( not ( = ?auto_266038 ?auto_266039 ) ) ( not ( = ?auto_266038 ?auto_266040 ) ) ( not ( = ?auto_266038 ?auto_266041 ) ) ( not ( = ?auto_266038 ?auto_266042 ) ) ( not ( = ?auto_266038 ?auto_266043 ) ) ( not ( = ?auto_266038 ?auto_266044 ) ) ( not ( = ?auto_266038 ?auto_266045 ) ) ( not ( = ?auto_266038 ?auto_266046 ) ) ( not ( = ?auto_266038 ?auto_266047 ) ) ( not ( = ?auto_266038 ?auto_266048 ) ) ( not ( = ?auto_266039 ?auto_266040 ) ) ( not ( = ?auto_266039 ?auto_266041 ) ) ( not ( = ?auto_266039 ?auto_266042 ) ) ( not ( = ?auto_266039 ?auto_266043 ) ) ( not ( = ?auto_266039 ?auto_266044 ) ) ( not ( = ?auto_266039 ?auto_266045 ) ) ( not ( = ?auto_266039 ?auto_266046 ) ) ( not ( = ?auto_266039 ?auto_266047 ) ) ( not ( = ?auto_266039 ?auto_266048 ) ) ( not ( = ?auto_266040 ?auto_266041 ) ) ( not ( = ?auto_266040 ?auto_266042 ) ) ( not ( = ?auto_266040 ?auto_266043 ) ) ( not ( = ?auto_266040 ?auto_266044 ) ) ( not ( = ?auto_266040 ?auto_266045 ) ) ( not ( = ?auto_266040 ?auto_266046 ) ) ( not ( = ?auto_266040 ?auto_266047 ) ) ( not ( = ?auto_266040 ?auto_266048 ) ) ( not ( = ?auto_266041 ?auto_266042 ) ) ( not ( = ?auto_266041 ?auto_266043 ) ) ( not ( = ?auto_266041 ?auto_266044 ) ) ( not ( = ?auto_266041 ?auto_266045 ) ) ( not ( = ?auto_266041 ?auto_266046 ) ) ( not ( = ?auto_266041 ?auto_266047 ) ) ( not ( = ?auto_266041 ?auto_266048 ) ) ( not ( = ?auto_266042 ?auto_266043 ) ) ( not ( = ?auto_266042 ?auto_266044 ) ) ( not ( = ?auto_266042 ?auto_266045 ) ) ( not ( = ?auto_266042 ?auto_266046 ) ) ( not ( = ?auto_266042 ?auto_266047 ) ) ( not ( = ?auto_266042 ?auto_266048 ) ) ( not ( = ?auto_266043 ?auto_266044 ) ) ( not ( = ?auto_266043 ?auto_266045 ) ) ( not ( = ?auto_266043 ?auto_266046 ) ) ( not ( = ?auto_266043 ?auto_266047 ) ) ( not ( = ?auto_266043 ?auto_266048 ) ) ( not ( = ?auto_266044 ?auto_266045 ) ) ( not ( = ?auto_266044 ?auto_266046 ) ) ( not ( = ?auto_266044 ?auto_266047 ) ) ( not ( = ?auto_266044 ?auto_266048 ) ) ( not ( = ?auto_266045 ?auto_266046 ) ) ( not ( = ?auto_266045 ?auto_266047 ) ) ( not ( = ?auto_266045 ?auto_266048 ) ) ( not ( = ?auto_266046 ?auto_266047 ) ) ( not ( = ?auto_266046 ?auto_266048 ) ) ( not ( = ?auto_266047 ?auto_266048 ) ) ( ON ?auto_266046 ?auto_266047 ) ( ON ?auto_266045 ?auto_266046 ) ( ON ?auto_266044 ?auto_266045 ) ( ON ?auto_266043 ?auto_266044 ) ( ON ?auto_266042 ?auto_266043 ) ( ON ?auto_266041 ?auto_266042 ) ( CLEAR ?auto_266039 ) ( ON ?auto_266040 ?auto_266041 ) ( CLEAR ?auto_266040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_266038 ?auto_266039 ?auto_266040 )
      ( MAKE-10PILE ?auto_266038 ?auto_266039 ?auto_266040 ?auto_266041 ?auto_266042 ?auto_266043 ?auto_266044 ?auto_266045 ?auto_266046 ?auto_266047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266059 - BLOCK
      ?auto_266060 - BLOCK
      ?auto_266061 - BLOCK
      ?auto_266062 - BLOCK
      ?auto_266063 - BLOCK
      ?auto_266064 - BLOCK
      ?auto_266065 - BLOCK
      ?auto_266066 - BLOCK
      ?auto_266067 - BLOCK
      ?auto_266068 - BLOCK
    )
    :vars
    (
      ?auto_266069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266068 ?auto_266069 ) ( ON-TABLE ?auto_266059 ) ( ON ?auto_266060 ?auto_266059 ) ( not ( = ?auto_266059 ?auto_266060 ) ) ( not ( = ?auto_266059 ?auto_266061 ) ) ( not ( = ?auto_266059 ?auto_266062 ) ) ( not ( = ?auto_266059 ?auto_266063 ) ) ( not ( = ?auto_266059 ?auto_266064 ) ) ( not ( = ?auto_266059 ?auto_266065 ) ) ( not ( = ?auto_266059 ?auto_266066 ) ) ( not ( = ?auto_266059 ?auto_266067 ) ) ( not ( = ?auto_266059 ?auto_266068 ) ) ( not ( = ?auto_266059 ?auto_266069 ) ) ( not ( = ?auto_266060 ?auto_266061 ) ) ( not ( = ?auto_266060 ?auto_266062 ) ) ( not ( = ?auto_266060 ?auto_266063 ) ) ( not ( = ?auto_266060 ?auto_266064 ) ) ( not ( = ?auto_266060 ?auto_266065 ) ) ( not ( = ?auto_266060 ?auto_266066 ) ) ( not ( = ?auto_266060 ?auto_266067 ) ) ( not ( = ?auto_266060 ?auto_266068 ) ) ( not ( = ?auto_266060 ?auto_266069 ) ) ( not ( = ?auto_266061 ?auto_266062 ) ) ( not ( = ?auto_266061 ?auto_266063 ) ) ( not ( = ?auto_266061 ?auto_266064 ) ) ( not ( = ?auto_266061 ?auto_266065 ) ) ( not ( = ?auto_266061 ?auto_266066 ) ) ( not ( = ?auto_266061 ?auto_266067 ) ) ( not ( = ?auto_266061 ?auto_266068 ) ) ( not ( = ?auto_266061 ?auto_266069 ) ) ( not ( = ?auto_266062 ?auto_266063 ) ) ( not ( = ?auto_266062 ?auto_266064 ) ) ( not ( = ?auto_266062 ?auto_266065 ) ) ( not ( = ?auto_266062 ?auto_266066 ) ) ( not ( = ?auto_266062 ?auto_266067 ) ) ( not ( = ?auto_266062 ?auto_266068 ) ) ( not ( = ?auto_266062 ?auto_266069 ) ) ( not ( = ?auto_266063 ?auto_266064 ) ) ( not ( = ?auto_266063 ?auto_266065 ) ) ( not ( = ?auto_266063 ?auto_266066 ) ) ( not ( = ?auto_266063 ?auto_266067 ) ) ( not ( = ?auto_266063 ?auto_266068 ) ) ( not ( = ?auto_266063 ?auto_266069 ) ) ( not ( = ?auto_266064 ?auto_266065 ) ) ( not ( = ?auto_266064 ?auto_266066 ) ) ( not ( = ?auto_266064 ?auto_266067 ) ) ( not ( = ?auto_266064 ?auto_266068 ) ) ( not ( = ?auto_266064 ?auto_266069 ) ) ( not ( = ?auto_266065 ?auto_266066 ) ) ( not ( = ?auto_266065 ?auto_266067 ) ) ( not ( = ?auto_266065 ?auto_266068 ) ) ( not ( = ?auto_266065 ?auto_266069 ) ) ( not ( = ?auto_266066 ?auto_266067 ) ) ( not ( = ?auto_266066 ?auto_266068 ) ) ( not ( = ?auto_266066 ?auto_266069 ) ) ( not ( = ?auto_266067 ?auto_266068 ) ) ( not ( = ?auto_266067 ?auto_266069 ) ) ( not ( = ?auto_266068 ?auto_266069 ) ) ( ON ?auto_266067 ?auto_266068 ) ( ON ?auto_266066 ?auto_266067 ) ( ON ?auto_266065 ?auto_266066 ) ( ON ?auto_266064 ?auto_266065 ) ( ON ?auto_266063 ?auto_266064 ) ( ON ?auto_266062 ?auto_266063 ) ( CLEAR ?auto_266060 ) ( ON ?auto_266061 ?auto_266062 ) ( CLEAR ?auto_266061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_266059 ?auto_266060 ?auto_266061 )
      ( MAKE-10PILE ?auto_266059 ?auto_266060 ?auto_266061 ?auto_266062 ?auto_266063 ?auto_266064 ?auto_266065 ?auto_266066 ?auto_266067 ?auto_266068 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266080 - BLOCK
      ?auto_266081 - BLOCK
      ?auto_266082 - BLOCK
      ?auto_266083 - BLOCK
      ?auto_266084 - BLOCK
      ?auto_266085 - BLOCK
      ?auto_266086 - BLOCK
      ?auto_266087 - BLOCK
      ?auto_266088 - BLOCK
      ?auto_266089 - BLOCK
    )
    :vars
    (
      ?auto_266090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266089 ?auto_266090 ) ( ON-TABLE ?auto_266080 ) ( not ( = ?auto_266080 ?auto_266081 ) ) ( not ( = ?auto_266080 ?auto_266082 ) ) ( not ( = ?auto_266080 ?auto_266083 ) ) ( not ( = ?auto_266080 ?auto_266084 ) ) ( not ( = ?auto_266080 ?auto_266085 ) ) ( not ( = ?auto_266080 ?auto_266086 ) ) ( not ( = ?auto_266080 ?auto_266087 ) ) ( not ( = ?auto_266080 ?auto_266088 ) ) ( not ( = ?auto_266080 ?auto_266089 ) ) ( not ( = ?auto_266080 ?auto_266090 ) ) ( not ( = ?auto_266081 ?auto_266082 ) ) ( not ( = ?auto_266081 ?auto_266083 ) ) ( not ( = ?auto_266081 ?auto_266084 ) ) ( not ( = ?auto_266081 ?auto_266085 ) ) ( not ( = ?auto_266081 ?auto_266086 ) ) ( not ( = ?auto_266081 ?auto_266087 ) ) ( not ( = ?auto_266081 ?auto_266088 ) ) ( not ( = ?auto_266081 ?auto_266089 ) ) ( not ( = ?auto_266081 ?auto_266090 ) ) ( not ( = ?auto_266082 ?auto_266083 ) ) ( not ( = ?auto_266082 ?auto_266084 ) ) ( not ( = ?auto_266082 ?auto_266085 ) ) ( not ( = ?auto_266082 ?auto_266086 ) ) ( not ( = ?auto_266082 ?auto_266087 ) ) ( not ( = ?auto_266082 ?auto_266088 ) ) ( not ( = ?auto_266082 ?auto_266089 ) ) ( not ( = ?auto_266082 ?auto_266090 ) ) ( not ( = ?auto_266083 ?auto_266084 ) ) ( not ( = ?auto_266083 ?auto_266085 ) ) ( not ( = ?auto_266083 ?auto_266086 ) ) ( not ( = ?auto_266083 ?auto_266087 ) ) ( not ( = ?auto_266083 ?auto_266088 ) ) ( not ( = ?auto_266083 ?auto_266089 ) ) ( not ( = ?auto_266083 ?auto_266090 ) ) ( not ( = ?auto_266084 ?auto_266085 ) ) ( not ( = ?auto_266084 ?auto_266086 ) ) ( not ( = ?auto_266084 ?auto_266087 ) ) ( not ( = ?auto_266084 ?auto_266088 ) ) ( not ( = ?auto_266084 ?auto_266089 ) ) ( not ( = ?auto_266084 ?auto_266090 ) ) ( not ( = ?auto_266085 ?auto_266086 ) ) ( not ( = ?auto_266085 ?auto_266087 ) ) ( not ( = ?auto_266085 ?auto_266088 ) ) ( not ( = ?auto_266085 ?auto_266089 ) ) ( not ( = ?auto_266085 ?auto_266090 ) ) ( not ( = ?auto_266086 ?auto_266087 ) ) ( not ( = ?auto_266086 ?auto_266088 ) ) ( not ( = ?auto_266086 ?auto_266089 ) ) ( not ( = ?auto_266086 ?auto_266090 ) ) ( not ( = ?auto_266087 ?auto_266088 ) ) ( not ( = ?auto_266087 ?auto_266089 ) ) ( not ( = ?auto_266087 ?auto_266090 ) ) ( not ( = ?auto_266088 ?auto_266089 ) ) ( not ( = ?auto_266088 ?auto_266090 ) ) ( not ( = ?auto_266089 ?auto_266090 ) ) ( ON ?auto_266088 ?auto_266089 ) ( ON ?auto_266087 ?auto_266088 ) ( ON ?auto_266086 ?auto_266087 ) ( ON ?auto_266085 ?auto_266086 ) ( ON ?auto_266084 ?auto_266085 ) ( ON ?auto_266083 ?auto_266084 ) ( ON ?auto_266082 ?auto_266083 ) ( CLEAR ?auto_266080 ) ( ON ?auto_266081 ?auto_266082 ) ( CLEAR ?auto_266081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_266080 ?auto_266081 )
      ( MAKE-10PILE ?auto_266080 ?auto_266081 ?auto_266082 ?auto_266083 ?auto_266084 ?auto_266085 ?auto_266086 ?auto_266087 ?auto_266088 ?auto_266089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266101 - BLOCK
      ?auto_266102 - BLOCK
      ?auto_266103 - BLOCK
      ?auto_266104 - BLOCK
      ?auto_266105 - BLOCK
      ?auto_266106 - BLOCK
      ?auto_266107 - BLOCK
      ?auto_266108 - BLOCK
      ?auto_266109 - BLOCK
      ?auto_266110 - BLOCK
    )
    :vars
    (
      ?auto_266111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266110 ?auto_266111 ) ( ON-TABLE ?auto_266101 ) ( not ( = ?auto_266101 ?auto_266102 ) ) ( not ( = ?auto_266101 ?auto_266103 ) ) ( not ( = ?auto_266101 ?auto_266104 ) ) ( not ( = ?auto_266101 ?auto_266105 ) ) ( not ( = ?auto_266101 ?auto_266106 ) ) ( not ( = ?auto_266101 ?auto_266107 ) ) ( not ( = ?auto_266101 ?auto_266108 ) ) ( not ( = ?auto_266101 ?auto_266109 ) ) ( not ( = ?auto_266101 ?auto_266110 ) ) ( not ( = ?auto_266101 ?auto_266111 ) ) ( not ( = ?auto_266102 ?auto_266103 ) ) ( not ( = ?auto_266102 ?auto_266104 ) ) ( not ( = ?auto_266102 ?auto_266105 ) ) ( not ( = ?auto_266102 ?auto_266106 ) ) ( not ( = ?auto_266102 ?auto_266107 ) ) ( not ( = ?auto_266102 ?auto_266108 ) ) ( not ( = ?auto_266102 ?auto_266109 ) ) ( not ( = ?auto_266102 ?auto_266110 ) ) ( not ( = ?auto_266102 ?auto_266111 ) ) ( not ( = ?auto_266103 ?auto_266104 ) ) ( not ( = ?auto_266103 ?auto_266105 ) ) ( not ( = ?auto_266103 ?auto_266106 ) ) ( not ( = ?auto_266103 ?auto_266107 ) ) ( not ( = ?auto_266103 ?auto_266108 ) ) ( not ( = ?auto_266103 ?auto_266109 ) ) ( not ( = ?auto_266103 ?auto_266110 ) ) ( not ( = ?auto_266103 ?auto_266111 ) ) ( not ( = ?auto_266104 ?auto_266105 ) ) ( not ( = ?auto_266104 ?auto_266106 ) ) ( not ( = ?auto_266104 ?auto_266107 ) ) ( not ( = ?auto_266104 ?auto_266108 ) ) ( not ( = ?auto_266104 ?auto_266109 ) ) ( not ( = ?auto_266104 ?auto_266110 ) ) ( not ( = ?auto_266104 ?auto_266111 ) ) ( not ( = ?auto_266105 ?auto_266106 ) ) ( not ( = ?auto_266105 ?auto_266107 ) ) ( not ( = ?auto_266105 ?auto_266108 ) ) ( not ( = ?auto_266105 ?auto_266109 ) ) ( not ( = ?auto_266105 ?auto_266110 ) ) ( not ( = ?auto_266105 ?auto_266111 ) ) ( not ( = ?auto_266106 ?auto_266107 ) ) ( not ( = ?auto_266106 ?auto_266108 ) ) ( not ( = ?auto_266106 ?auto_266109 ) ) ( not ( = ?auto_266106 ?auto_266110 ) ) ( not ( = ?auto_266106 ?auto_266111 ) ) ( not ( = ?auto_266107 ?auto_266108 ) ) ( not ( = ?auto_266107 ?auto_266109 ) ) ( not ( = ?auto_266107 ?auto_266110 ) ) ( not ( = ?auto_266107 ?auto_266111 ) ) ( not ( = ?auto_266108 ?auto_266109 ) ) ( not ( = ?auto_266108 ?auto_266110 ) ) ( not ( = ?auto_266108 ?auto_266111 ) ) ( not ( = ?auto_266109 ?auto_266110 ) ) ( not ( = ?auto_266109 ?auto_266111 ) ) ( not ( = ?auto_266110 ?auto_266111 ) ) ( ON ?auto_266109 ?auto_266110 ) ( ON ?auto_266108 ?auto_266109 ) ( ON ?auto_266107 ?auto_266108 ) ( ON ?auto_266106 ?auto_266107 ) ( ON ?auto_266105 ?auto_266106 ) ( ON ?auto_266104 ?auto_266105 ) ( ON ?auto_266103 ?auto_266104 ) ( CLEAR ?auto_266101 ) ( ON ?auto_266102 ?auto_266103 ) ( CLEAR ?auto_266102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_266101 ?auto_266102 )
      ( MAKE-10PILE ?auto_266101 ?auto_266102 ?auto_266103 ?auto_266104 ?auto_266105 ?auto_266106 ?auto_266107 ?auto_266108 ?auto_266109 ?auto_266110 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266122 - BLOCK
      ?auto_266123 - BLOCK
      ?auto_266124 - BLOCK
      ?auto_266125 - BLOCK
      ?auto_266126 - BLOCK
      ?auto_266127 - BLOCK
      ?auto_266128 - BLOCK
      ?auto_266129 - BLOCK
      ?auto_266130 - BLOCK
      ?auto_266131 - BLOCK
    )
    :vars
    (
      ?auto_266132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266131 ?auto_266132 ) ( not ( = ?auto_266122 ?auto_266123 ) ) ( not ( = ?auto_266122 ?auto_266124 ) ) ( not ( = ?auto_266122 ?auto_266125 ) ) ( not ( = ?auto_266122 ?auto_266126 ) ) ( not ( = ?auto_266122 ?auto_266127 ) ) ( not ( = ?auto_266122 ?auto_266128 ) ) ( not ( = ?auto_266122 ?auto_266129 ) ) ( not ( = ?auto_266122 ?auto_266130 ) ) ( not ( = ?auto_266122 ?auto_266131 ) ) ( not ( = ?auto_266122 ?auto_266132 ) ) ( not ( = ?auto_266123 ?auto_266124 ) ) ( not ( = ?auto_266123 ?auto_266125 ) ) ( not ( = ?auto_266123 ?auto_266126 ) ) ( not ( = ?auto_266123 ?auto_266127 ) ) ( not ( = ?auto_266123 ?auto_266128 ) ) ( not ( = ?auto_266123 ?auto_266129 ) ) ( not ( = ?auto_266123 ?auto_266130 ) ) ( not ( = ?auto_266123 ?auto_266131 ) ) ( not ( = ?auto_266123 ?auto_266132 ) ) ( not ( = ?auto_266124 ?auto_266125 ) ) ( not ( = ?auto_266124 ?auto_266126 ) ) ( not ( = ?auto_266124 ?auto_266127 ) ) ( not ( = ?auto_266124 ?auto_266128 ) ) ( not ( = ?auto_266124 ?auto_266129 ) ) ( not ( = ?auto_266124 ?auto_266130 ) ) ( not ( = ?auto_266124 ?auto_266131 ) ) ( not ( = ?auto_266124 ?auto_266132 ) ) ( not ( = ?auto_266125 ?auto_266126 ) ) ( not ( = ?auto_266125 ?auto_266127 ) ) ( not ( = ?auto_266125 ?auto_266128 ) ) ( not ( = ?auto_266125 ?auto_266129 ) ) ( not ( = ?auto_266125 ?auto_266130 ) ) ( not ( = ?auto_266125 ?auto_266131 ) ) ( not ( = ?auto_266125 ?auto_266132 ) ) ( not ( = ?auto_266126 ?auto_266127 ) ) ( not ( = ?auto_266126 ?auto_266128 ) ) ( not ( = ?auto_266126 ?auto_266129 ) ) ( not ( = ?auto_266126 ?auto_266130 ) ) ( not ( = ?auto_266126 ?auto_266131 ) ) ( not ( = ?auto_266126 ?auto_266132 ) ) ( not ( = ?auto_266127 ?auto_266128 ) ) ( not ( = ?auto_266127 ?auto_266129 ) ) ( not ( = ?auto_266127 ?auto_266130 ) ) ( not ( = ?auto_266127 ?auto_266131 ) ) ( not ( = ?auto_266127 ?auto_266132 ) ) ( not ( = ?auto_266128 ?auto_266129 ) ) ( not ( = ?auto_266128 ?auto_266130 ) ) ( not ( = ?auto_266128 ?auto_266131 ) ) ( not ( = ?auto_266128 ?auto_266132 ) ) ( not ( = ?auto_266129 ?auto_266130 ) ) ( not ( = ?auto_266129 ?auto_266131 ) ) ( not ( = ?auto_266129 ?auto_266132 ) ) ( not ( = ?auto_266130 ?auto_266131 ) ) ( not ( = ?auto_266130 ?auto_266132 ) ) ( not ( = ?auto_266131 ?auto_266132 ) ) ( ON ?auto_266130 ?auto_266131 ) ( ON ?auto_266129 ?auto_266130 ) ( ON ?auto_266128 ?auto_266129 ) ( ON ?auto_266127 ?auto_266128 ) ( ON ?auto_266126 ?auto_266127 ) ( ON ?auto_266125 ?auto_266126 ) ( ON ?auto_266124 ?auto_266125 ) ( ON ?auto_266123 ?auto_266124 ) ( ON ?auto_266122 ?auto_266123 ) ( CLEAR ?auto_266122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_266122 )
      ( MAKE-10PILE ?auto_266122 ?auto_266123 ?auto_266124 ?auto_266125 ?auto_266126 ?auto_266127 ?auto_266128 ?auto_266129 ?auto_266130 ?auto_266131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_266143 - BLOCK
      ?auto_266144 - BLOCK
      ?auto_266145 - BLOCK
      ?auto_266146 - BLOCK
      ?auto_266147 - BLOCK
      ?auto_266148 - BLOCK
      ?auto_266149 - BLOCK
      ?auto_266150 - BLOCK
      ?auto_266151 - BLOCK
      ?auto_266152 - BLOCK
    )
    :vars
    (
      ?auto_266153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266152 ?auto_266153 ) ( not ( = ?auto_266143 ?auto_266144 ) ) ( not ( = ?auto_266143 ?auto_266145 ) ) ( not ( = ?auto_266143 ?auto_266146 ) ) ( not ( = ?auto_266143 ?auto_266147 ) ) ( not ( = ?auto_266143 ?auto_266148 ) ) ( not ( = ?auto_266143 ?auto_266149 ) ) ( not ( = ?auto_266143 ?auto_266150 ) ) ( not ( = ?auto_266143 ?auto_266151 ) ) ( not ( = ?auto_266143 ?auto_266152 ) ) ( not ( = ?auto_266143 ?auto_266153 ) ) ( not ( = ?auto_266144 ?auto_266145 ) ) ( not ( = ?auto_266144 ?auto_266146 ) ) ( not ( = ?auto_266144 ?auto_266147 ) ) ( not ( = ?auto_266144 ?auto_266148 ) ) ( not ( = ?auto_266144 ?auto_266149 ) ) ( not ( = ?auto_266144 ?auto_266150 ) ) ( not ( = ?auto_266144 ?auto_266151 ) ) ( not ( = ?auto_266144 ?auto_266152 ) ) ( not ( = ?auto_266144 ?auto_266153 ) ) ( not ( = ?auto_266145 ?auto_266146 ) ) ( not ( = ?auto_266145 ?auto_266147 ) ) ( not ( = ?auto_266145 ?auto_266148 ) ) ( not ( = ?auto_266145 ?auto_266149 ) ) ( not ( = ?auto_266145 ?auto_266150 ) ) ( not ( = ?auto_266145 ?auto_266151 ) ) ( not ( = ?auto_266145 ?auto_266152 ) ) ( not ( = ?auto_266145 ?auto_266153 ) ) ( not ( = ?auto_266146 ?auto_266147 ) ) ( not ( = ?auto_266146 ?auto_266148 ) ) ( not ( = ?auto_266146 ?auto_266149 ) ) ( not ( = ?auto_266146 ?auto_266150 ) ) ( not ( = ?auto_266146 ?auto_266151 ) ) ( not ( = ?auto_266146 ?auto_266152 ) ) ( not ( = ?auto_266146 ?auto_266153 ) ) ( not ( = ?auto_266147 ?auto_266148 ) ) ( not ( = ?auto_266147 ?auto_266149 ) ) ( not ( = ?auto_266147 ?auto_266150 ) ) ( not ( = ?auto_266147 ?auto_266151 ) ) ( not ( = ?auto_266147 ?auto_266152 ) ) ( not ( = ?auto_266147 ?auto_266153 ) ) ( not ( = ?auto_266148 ?auto_266149 ) ) ( not ( = ?auto_266148 ?auto_266150 ) ) ( not ( = ?auto_266148 ?auto_266151 ) ) ( not ( = ?auto_266148 ?auto_266152 ) ) ( not ( = ?auto_266148 ?auto_266153 ) ) ( not ( = ?auto_266149 ?auto_266150 ) ) ( not ( = ?auto_266149 ?auto_266151 ) ) ( not ( = ?auto_266149 ?auto_266152 ) ) ( not ( = ?auto_266149 ?auto_266153 ) ) ( not ( = ?auto_266150 ?auto_266151 ) ) ( not ( = ?auto_266150 ?auto_266152 ) ) ( not ( = ?auto_266150 ?auto_266153 ) ) ( not ( = ?auto_266151 ?auto_266152 ) ) ( not ( = ?auto_266151 ?auto_266153 ) ) ( not ( = ?auto_266152 ?auto_266153 ) ) ( ON ?auto_266151 ?auto_266152 ) ( ON ?auto_266150 ?auto_266151 ) ( ON ?auto_266149 ?auto_266150 ) ( ON ?auto_266148 ?auto_266149 ) ( ON ?auto_266147 ?auto_266148 ) ( ON ?auto_266146 ?auto_266147 ) ( ON ?auto_266145 ?auto_266146 ) ( ON ?auto_266144 ?auto_266145 ) ( ON ?auto_266143 ?auto_266144 ) ( CLEAR ?auto_266143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_266143 )
      ( MAKE-10PILE ?auto_266143 ?auto_266144 ?auto_266145 ?auto_266146 ?auto_266147 ?auto_266148 ?auto_266149 ?auto_266150 ?auto_266151 ?auto_266152 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266165 - BLOCK
      ?auto_266166 - BLOCK
      ?auto_266167 - BLOCK
      ?auto_266168 - BLOCK
      ?auto_266169 - BLOCK
      ?auto_266170 - BLOCK
      ?auto_266171 - BLOCK
      ?auto_266172 - BLOCK
      ?auto_266173 - BLOCK
      ?auto_266174 - BLOCK
      ?auto_266175 - BLOCK
    )
    :vars
    (
      ?auto_266176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_266174 ) ( ON ?auto_266175 ?auto_266176 ) ( CLEAR ?auto_266175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_266165 ) ( ON ?auto_266166 ?auto_266165 ) ( ON ?auto_266167 ?auto_266166 ) ( ON ?auto_266168 ?auto_266167 ) ( ON ?auto_266169 ?auto_266168 ) ( ON ?auto_266170 ?auto_266169 ) ( ON ?auto_266171 ?auto_266170 ) ( ON ?auto_266172 ?auto_266171 ) ( ON ?auto_266173 ?auto_266172 ) ( ON ?auto_266174 ?auto_266173 ) ( not ( = ?auto_266165 ?auto_266166 ) ) ( not ( = ?auto_266165 ?auto_266167 ) ) ( not ( = ?auto_266165 ?auto_266168 ) ) ( not ( = ?auto_266165 ?auto_266169 ) ) ( not ( = ?auto_266165 ?auto_266170 ) ) ( not ( = ?auto_266165 ?auto_266171 ) ) ( not ( = ?auto_266165 ?auto_266172 ) ) ( not ( = ?auto_266165 ?auto_266173 ) ) ( not ( = ?auto_266165 ?auto_266174 ) ) ( not ( = ?auto_266165 ?auto_266175 ) ) ( not ( = ?auto_266165 ?auto_266176 ) ) ( not ( = ?auto_266166 ?auto_266167 ) ) ( not ( = ?auto_266166 ?auto_266168 ) ) ( not ( = ?auto_266166 ?auto_266169 ) ) ( not ( = ?auto_266166 ?auto_266170 ) ) ( not ( = ?auto_266166 ?auto_266171 ) ) ( not ( = ?auto_266166 ?auto_266172 ) ) ( not ( = ?auto_266166 ?auto_266173 ) ) ( not ( = ?auto_266166 ?auto_266174 ) ) ( not ( = ?auto_266166 ?auto_266175 ) ) ( not ( = ?auto_266166 ?auto_266176 ) ) ( not ( = ?auto_266167 ?auto_266168 ) ) ( not ( = ?auto_266167 ?auto_266169 ) ) ( not ( = ?auto_266167 ?auto_266170 ) ) ( not ( = ?auto_266167 ?auto_266171 ) ) ( not ( = ?auto_266167 ?auto_266172 ) ) ( not ( = ?auto_266167 ?auto_266173 ) ) ( not ( = ?auto_266167 ?auto_266174 ) ) ( not ( = ?auto_266167 ?auto_266175 ) ) ( not ( = ?auto_266167 ?auto_266176 ) ) ( not ( = ?auto_266168 ?auto_266169 ) ) ( not ( = ?auto_266168 ?auto_266170 ) ) ( not ( = ?auto_266168 ?auto_266171 ) ) ( not ( = ?auto_266168 ?auto_266172 ) ) ( not ( = ?auto_266168 ?auto_266173 ) ) ( not ( = ?auto_266168 ?auto_266174 ) ) ( not ( = ?auto_266168 ?auto_266175 ) ) ( not ( = ?auto_266168 ?auto_266176 ) ) ( not ( = ?auto_266169 ?auto_266170 ) ) ( not ( = ?auto_266169 ?auto_266171 ) ) ( not ( = ?auto_266169 ?auto_266172 ) ) ( not ( = ?auto_266169 ?auto_266173 ) ) ( not ( = ?auto_266169 ?auto_266174 ) ) ( not ( = ?auto_266169 ?auto_266175 ) ) ( not ( = ?auto_266169 ?auto_266176 ) ) ( not ( = ?auto_266170 ?auto_266171 ) ) ( not ( = ?auto_266170 ?auto_266172 ) ) ( not ( = ?auto_266170 ?auto_266173 ) ) ( not ( = ?auto_266170 ?auto_266174 ) ) ( not ( = ?auto_266170 ?auto_266175 ) ) ( not ( = ?auto_266170 ?auto_266176 ) ) ( not ( = ?auto_266171 ?auto_266172 ) ) ( not ( = ?auto_266171 ?auto_266173 ) ) ( not ( = ?auto_266171 ?auto_266174 ) ) ( not ( = ?auto_266171 ?auto_266175 ) ) ( not ( = ?auto_266171 ?auto_266176 ) ) ( not ( = ?auto_266172 ?auto_266173 ) ) ( not ( = ?auto_266172 ?auto_266174 ) ) ( not ( = ?auto_266172 ?auto_266175 ) ) ( not ( = ?auto_266172 ?auto_266176 ) ) ( not ( = ?auto_266173 ?auto_266174 ) ) ( not ( = ?auto_266173 ?auto_266175 ) ) ( not ( = ?auto_266173 ?auto_266176 ) ) ( not ( = ?auto_266174 ?auto_266175 ) ) ( not ( = ?auto_266174 ?auto_266176 ) ) ( not ( = ?auto_266175 ?auto_266176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_266175 ?auto_266176 )
      ( !STACK ?auto_266175 ?auto_266174 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266188 - BLOCK
      ?auto_266189 - BLOCK
      ?auto_266190 - BLOCK
      ?auto_266191 - BLOCK
      ?auto_266192 - BLOCK
      ?auto_266193 - BLOCK
      ?auto_266194 - BLOCK
      ?auto_266195 - BLOCK
      ?auto_266196 - BLOCK
      ?auto_266197 - BLOCK
      ?auto_266198 - BLOCK
    )
    :vars
    (
      ?auto_266199 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_266197 ) ( ON ?auto_266198 ?auto_266199 ) ( CLEAR ?auto_266198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_266188 ) ( ON ?auto_266189 ?auto_266188 ) ( ON ?auto_266190 ?auto_266189 ) ( ON ?auto_266191 ?auto_266190 ) ( ON ?auto_266192 ?auto_266191 ) ( ON ?auto_266193 ?auto_266192 ) ( ON ?auto_266194 ?auto_266193 ) ( ON ?auto_266195 ?auto_266194 ) ( ON ?auto_266196 ?auto_266195 ) ( ON ?auto_266197 ?auto_266196 ) ( not ( = ?auto_266188 ?auto_266189 ) ) ( not ( = ?auto_266188 ?auto_266190 ) ) ( not ( = ?auto_266188 ?auto_266191 ) ) ( not ( = ?auto_266188 ?auto_266192 ) ) ( not ( = ?auto_266188 ?auto_266193 ) ) ( not ( = ?auto_266188 ?auto_266194 ) ) ( not ( = ?auto_266188 ?auto_266195 ) ) ( not ( = ?auto_266188 ?auto_266196 ) ) ( not ( = ?auto_266188 ?auto_266197 ) ) ( not ( = ?auto_266188 ?auto_266198 ) ) ( not ( = ?auto_266188 ?auto_266199 ) ) ( not ( = ?auto_266189 ?auto_266190 ) ) ( not ( = ?auto_266189 ?auto_266191 ) ) ( not ( = ?auto_266189 ?auto_266192 ) ) ( not ( = ?auto_266189 ?auto_266193 ) ) ( not ( = ?auto_266189 ?auto_266194 ) ) ( not ( = ?auto_266189 ?auto_266195 ) ) ( not ( = ?auto_266189 ?auto_266196 ) ) ( not ( = ?auto_266189 ?auto_266197 ) ) ( not ( = ?auto_266189 ?auto_266198 ) ) ( not ( = ?auto_266189 ?auto_266199 ) ) ( not ( = ?auto_266190 ?auto_266191 ) ) ( not ( = ?auto_266190 ?auto_266192 ) ) ( not ( = ?auto_266190 ?auto_266193 ) ) ( not ( = ?auto_266190 ?auto_266194 ) ) ( not ( = ?auto_266190 ?auto_266195 ) ) ( not ( = ?auto_266190 ?auto_266196 ) ) ( not ( = ?auto_266190 ?auto_266197 ) ) ( not ( = ?auto_266190 ?auto_266198 ) ) ( not ( = ?auto_266190 ?auto_266199 ) ) ( not ( = ?auto_266191 ?auto_266192 ) ) ( not ( = ?auto_266191 ?auto_266193 ) ) ( not ( = ?auto_266191 ?auto_266194 ) ) ( not ( = ?auto_266191 ?auto_266195 ) ) ( not ( = ?auto_266191 ?auto_266196 ) ) ( not ( = ?auto_266191 ?auto_266197 ) ) ( not ( = ?auto_266191 ?auto_266198 ) ) ( not ( = ?auto_266191 ?auto_266199 ) ) ( not ( = ?auto_266192 ?auto_266193 ) ) ( not ( = ?auto_266192 ?auto_266194 ) ) ( not ( = ?auto_266192 ?auto_266195 ) ) ( not ( = ?auto_266192 ?auto_266196 ) ) ( not ( = ?auto_266192 ?auto_266197 ) ) ( not ( = ?auto_266192 ?auto_266198 ) ) ( not ( = ?auto_266192 ?auto_266199 ) ) ( not ( = ?auto_266193 ?auto_266194 ) ) ( not ( = ?auto_266193 ?auto_266195 ) ) ( not ( = ?auto_266193 ?auto_266196 ) ) ( not ( = ?auto_266193 ?auto_266197 ) ) ( not ( = ?auto_266193 ?auto_266198 ) ) ( not ( = ?auto_266193 ?auto_266199 ) ) ( not ( = ?auto_266194 ?auto_266195 ) ) ( not ( = ?auto_266194 ?auto_266196 ) ) ( not ( = ?auto_266194 ?auto_266197 ) ) ( not ( = ?auto_266194 ?auto_266198 ) ) ( not ( = ?auto_266194 ?auto_266199 ) ) ( not ( = ?auto_266195 ?auto_266196 ) ) ( not ( = ?auto_266195 ?auto_266197 ) ) ( not ( = ?auto_266195 ?auto_266198 ) ) ( not ( = ?auto_266195 ?auto_266199 ) ) ( not ( = ?auto_266196 ?auto_266197 ) ) ( not ( = ?auto_266196 ?auto_266198 ) ) ( not ( = ?auto_266196 ?auto_266199 ) ) ( not ( = ?auto_266197 ?auto_266198 ) ) ( not ( = ?auto_266197 ?auto_266199 ) ) ( not ( = ?auto_266198 ?auto_266199 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_266198 ?auto_266199 )
      ( !STACK ?auto_266198 ?auto_266197 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266211 - BLOCK
      ?auto_266212 - BLOCK
      ?auto_266213 - BLOCK
      ?auto_266214 - BLOCK
      ?auto_266215 - BLOCK
      ?auto_266216 - BLOCK
      ?auto_266217 - BLOCK
      ?auto_266218 - BLOCK
      ?auto_266219 - BLOCK
      ?auto_266220 - BLOCK
      ?auto_266221 - BLOCK
    )
    :vars
    (
      ?auto_266222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266221 ?auto_266222 ) ( ON-TABLE ?auto_266211 ) ( ON ?auto_266212 ?auto_266211 ) ( ON ?auto_266213 ?auto_266212 ) ( ON ?auto_266214 ?auto_266213 ) ( ON ?auto_266215 ?auto_266214 ) ( ON ?auto_266216 ?auto_266215 ) ( ON ?auto_266217 ?auto_266216 ) ( ON ?auto_266218 ?auto_266217 ) ( ON ?auto_266219 ?auto_266218 ) ( not ( = ?auto_266211 ?auto_266212 ) ) ( not ( = ?auto_266211 ?auto_266213 ) ) ( not ( = ?auto_266211 ?auto_266214 ) ) ( not ( = ?auto_266211 ?auto_266215 ) ) ( not ( = ?auto_266211 ?auto_266216 ) ) ( not ( = ?auto_266211 ?auto_266217 ) ) ( not ( = ?auto_266211 ?auto_266218 ) ) ( not ( = ?auto_266211 ?auto_266219 ) ) ( not ( = ?auto_266211 ?auto_266220 ) ) ( not ( = ?auto_266211 ?auto_266221 ) ) ( not ( = ?auto_266211 ?auto_266222 ) ) ( not ( = ?auto_266212 ?auto_266213 ) ) ( not ( = ?auto_266212 ?auto_266214 ) ) ( not ( = ?auto_266212 ?auto_266215 ) ) ( not ( = ?auto_266212 ?auto_266216 ) ) ( not ( = ?auto_266212 ?auto_266217 ) ) ( not ( = ?auto_266212 ?auto_266218 ) ) ( not ( = ?auto_266212 ?auto_266219 ) ) ( not ( = ?auto_266212 ?auto_266220 ) ) ( not ( = ?auto_266212 ?auto_266221 ) ) ( not ( = ?auto_266212 ?auto_266222 ) ) ( not ( = ?auto_266213 ?auto_266214 ) ) ( not ( = ?auto_266213 ?auto_266215 ) ) ( not ( = ?auto_266213 ?auto_266216 ) ) ( not ( = ?auto_266213 ?auto_266217 ) ) ( not ( = ?auto_266213 ?auto_266218 ) ) ( not ( = ?auto_266213 ?auto_266219 ) ) ( not ( = ?auto_266213 ?auto_266220 ) ) ( not ( = ?auto_266213 ?auto_266221 ) ) ( not ( = ?auto_266213 ?auto_266222 ) ) ( not ( = ?auto_266214 ?auto_266215 ) ) ( not ( = ?auto_266214 ?auto_266216 ) ) ( not ( = ?auto_266214 ?auto_266217 ) ) ( not ( = ?auto_266214 ?auto_266218 ) ) ( not ( = ?auto_266214 ?auto_266219 ) ) ( not ( = ?auto_266214 ?auto_266220 ) ) ( not ( = ?auto_266214 ?auto_266221 ) ) ( not ( = ?auto_266214 ?auto_266222 ) ) ( not ( = ?auto_266215 ?auto_266216 ) ) ( not ( = ?auto_266215 ?auto_266217 ) ) ( not ( = ?auto_266215 ?auto_266218 ) ) ( not ( = ?auto_266215 ?auto_266219 ) ) ( not ( = ?auto_266215 ?auto_266220 ) ) ( not ( = ?auto_266215 ?auto_266221 ) ) ( not ( = ?auto_266215 ?auto_266222 ) ) ( not ( = ?auto_266216 ?auto_266217 ) ) ( not ( = ?auto_266216 ?auto_266218 ) ) ( not ( = ?auto_266216 ?auto_266219 ) ) ( not ( = ?auto_266216 ?auto_266220 ) ) ( not ( = ?auto_266216 ?auto_266221 ) ) ( not ( = ?auto_266216 ?auto_266222 ) ) ( not ( = ?auto_266217 ?auto_266218 ) ) ( not ( = ?auto_266217 ?auto_266219 ) ) ( not ( = ?auto_266217 ?auto_266220 ) ) ( not ( = ?auto_266217 ?auto_266221 ) ) ( not ( = ?auto_266217 ?auto_266222 ) ) ( not ( = ?auto_266218 ?auto_266219 ) ) ( not ( = ?auto_266218 ?auto_266220 ) ) ( not ( = ?auto_266218 ?auto_266221 ) ) ( not ( = ?auto_266218 ?auto_266222 ) ) ( not ( = ?auto_266219 ?auto_266220 ) ) ( not ( = ?auto_266219 ?auto_266221 ) ) ( not ( = ?auto_266219 ?auto_266222 ) ) ( not ( = ?auto_266220 ?auto_266221 ) ) ( not ( = ?auto_266220 ?auto_266222 ) ) ( not ( = ?auto_266221 ?auto_266222 ) ) ( CLEAR ?auto_266219 ) ( ON ?auto_266220 ?auto_266221 ) ( CLEAR ?auto_266220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_266211 ?auto_266212 ?auto_266213 ?auto_266214 ?auto_266215 ?auto_266216 ?auto_266217 ?auto_266218 ?auto_266219 ?auto_266220 )
      ( MAKE-11PILE ?auto_266211 ?auto_266212 ?auto_266213 ?auto_266214 ?auto_266215 ?auto_266216 ?auto_266217 ?auto_266218 ?auto_266219 ?auto_266220 ?auto_266221 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266234 - BLOCK
      ?auto_266235 - BLOCK
      ?auto_266236 - BLOCK
      ?auto_266237 - BLOCK
      ?auto_266238 - BLOCK
      ?auto_266239 - BLOCK
      ?auto_266240 - BLOCK
      ?auto_266241 - BLOCK
      ?auto_266242 - BLOCK
      ?auto_266243 - BLOCK
      ?auto_266244 - BLOCK
    )
    :vars
    (
      ?auto_266245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266244 ?auto_266245 ) ( ON-TABLE ?auto_266234 ) ( ON ?auto_266235 ?auto_266234 ) ( ON ?auto_266236 ?auto_266235 ) ( ON ?auto_266237 ?auto_266236 ) ( ON ?auto_266238 ?auto_266237 ) ( ON ?auto_266239 ?auto_266238 ) ( ON ?auto_266240 ?auto_266239 ) ( ON ?auto_266241 ?auto_266240 ) ( ON ?auto_266242 ?auto_266241 ) ( not ( = ?auto_266234 ?auto_266235 ) ) ( not ( = ?auto_266234 ?auto_266236 ) ) ( not ( = ?auto_266234 ?auto_266237 ) ) ( not ( = ?auto_266234 ?auto_266238 ) ) ( not ( = ?auto_266234 ?auto_266239 ) ) ( not ( = ?auto_266234 ?auto_266240 ) ) ( not ( = ?auto_266234 ?auto_266241 ) ) ( not ( = ?auto_266234 ?auto_266242 ) ) ( not ( = ?auto_266234 ?auto_266243 ) ) ( not ( = ?auto_266234 ?auto_266244 ) ) ( not ( = ?auto_266234 ?auto_266245 ) ) ( not ( = ?auto_266235 ?auto_266236 ) ) ( not ( = ?auto_266235 ?auto_266237 ) ) ( not ( = ?auto_266235 ?auto_266238 ) ) ( not ( = ?auto_266235 ?auto_266239 ) ) ( not ( = ?auto_266235 ?auto_266240 ) ) ( not ( = ?auto_266235 ?auto_266241 ) ) ( not ( = ?auto_266235 ?auto_266242 ) ) ( not ( = ?auto_266235 ?auto_266243 ) ) ( not ( = ?auto_266235 ?auto_266244 ) ) ( not ( = ?auto_266235 ?auto_266245 ) ) ( not ( = ?auto_266236 ?auto_266237 ) ) ( not ( = ?auto_266236 ?auto_266238 ) ) ( not ( = ?auto_266236 ?auto_266239 ) ) ( not ( = ?auto_266236 ?auto_266240 ) ) ( not ( = ?auto_266236 ?auto_266241 ) ) ( not ( = ?auto_266236 ?auto_266242 ) ) ( not ( = ?auto_266236 ?auto_266243 ) ) ( not ( = ?auto_266236 ?auto_266244 ) ) ( not ( = ?auto_266236 ?auto_266245 ) ) ( not ( = ?auto_266237 ?auto_266238 ) ) ( not ( = ?auto_266237 ?auto_266239 ) ) ( not ( = ?auto_266237 ?auto_266240 ) ) ( not ( = ?auto_266237 ?auto_266241 ) ) ( not ( = ?auto_266237 ?auto_266242 ) ) ( not ( = ?auto_266237 ?auto_266243 ) ) ( not ( = ?auto_266237 ?auto_266244 ) ) ( not ( = ?auto_266237 ?auto_266245 ) ) ( not ( = ?auto_266238 ?auto_266239 ) ) ( not ( = ?auto_266238 ?auto_266240 ) ) ( not ( = ?auto_266238 ?auto_266241 ) ) ( not ( = ?auto_266238 ?auto_266242 ) ) ( not ( = ?auto_266238 ?auto_266243 ) ) ( not ( = ?auto_266238 ?auto_266244 ) ) ( not ( = ?auto_266238 ?auto_266245 ) ) ( not ( = ?auto_266239 ?auto_266240 ) ) ( not ( = ?auto_266239 ?auto_266241 ) ) ( not ( = ?auto_266239 ?auto_266242 ) ) ( not ( = ?auto_266239 ?auto_266243 ) ) ( not ( = ?auto_266239 ?auto_266244 ) ) ( not ( = ?auto_266239 ?auto_266245 ) ) ( not ( = ?auto_266240 ?auto_266241 ) ) ( not ( = ?auto_266240 ?auto_266242 ) ) ( not ( = ?auto_266240 ?auto_266243 ) ) ( not ( = ?auto_266240 ?auto_266244 ) ) ( not ( = ?auto_266240 ?auto_266245 ) ) ( not ( = ?auto_266241 ?auto_266242 ) ) ( not ( = ?auto_266241 ?auto_266243 ) ) ( not ( = ?auto_266241 ?auto_266244 ) ) ( not ( = ?auto_266241 ?auto_266245 ) ) ( not ( = ?auto_266242 ?auto_266243 ) ) ( not ( = ?auto_266242 ?auto_266244 ) ) ( not ( = ?auto_266242 ?auto_266245 ) ) ( not ( = ?auto_266243 ?auto_266244 ) ) ( not ( = ?auto_266243 ?auto_266245 ) ) ( not ( = ?auto_266244 ?auto_266245 ) ) ( CLEAR ?auto_266242 ) ( ON ?auto_266243 ?auto_266244 ) ( CLEAR ?auto_266243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_266234 ?auto_266235 ?auto_266236 ?auto_266237 ?auto_266238 ?auto_266239 ?auto_266240 ?auto_266241 ?auto_266242 ?auto_266243 )
      ( MAKE-11PILE ?auto_266234 ?auto_266235 ?auto_266236 ?auto_266237 ?auto_266238 ?auto_266239 ?auto_266240 ?auto_266241 ?auto_266242 ?auto_266243 ?auto_266244 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266257 - BLOCK
      ?auto_266258 - BLOCK
      ?auto_266259 - BLOCK
      ?auto_266260 - BLOCK
      ?auto_266261 - BLOCK
      ?auto_266262 - BLOCK
      ?auto_266263 - BLOCK
      ?auto_266264 - BLOCK
      ?auto_266265 - BLOCK
      ?auto_266266 - BLOCK
      ?auto_266267 - BLOCK
    )
    :vars
    (
      ?auto_266268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266267 ?auto_266268 ) ( ON-TABLE ?auto_266257 ) ( ON ?auto_266258 ?auto_266257 ) ( ON ?auto_266259 ?auto_266258 ) ( ON ?auto_266260 ?auto_266259 ) ( ON ?auto_266261 ?auto_266260 ) ( ON ?auto_266262 ?auto_266261 ) ( ON ?auto_266263 ?auto_266262 ) ( ON ?auto_266264 ?auto_266263 ) ( not ( = ?auto_266257 ?auto_266258 ) ) ( not ( = ?auto_266257 ?auto_266259 ) ) ( not ( = ?auto_266257 ?auto_266260 ) ) ( not ( = ?auto_266257 ?auto_266261 ) ) ( not ( = ?auto_266257 ?auto_266262 ) ) ( not ( = ?auto_266257 ?auto_266263 ) ) ( not ( = ?auto_266257 ?auto_266264 ) ) ( not ( = ?auto_266257 ?auto_266265 ) ) ( not ( = ?auto_266257 ?auto_266266 ) ) ( not ( = ?auto_266257 ?auto_266267 ) ) ( not ( = ?auto_266257 ?auto_266268 ) ) ( not ( = ?auto_266258 ?auto_266259 ) ) ( not ( = ?auto_266258 ?auto_266260 ) ) ( not ( = ?auto_266258 ?auto_266261 ) ) ( not ( = ?auto_266258 ?auto_266262 ) ) ( not ( = ?auto_266258 ?auto_266263 ) ) ( not ( = ?auto_266258 ?auto_266264 ) ) ( not ( = ?auto_266258 ?auto_266265 ) ) ( not ( = ?auto_266258 ?auto_266266 ) ) ( not ( = ?auto_266258 ?auto_266267 ) ) ( not ( = ?auto_266258 ?auto_266268 ) ) ( not ( = ?auto_266259 ?auto_266260 ) ) ( not ( = ?auto_266259 ?auto_266261 ) ) ( not ( = ?auto_266259 ?auto_266262 ) ) ( not ( = ?auto_266259 ?auto_266263 ) ) ( not ( = ?auto_266259 ?auto_266264 ) ) ( not ( = ?auto_266259 ?auto_266265 ) ) ( not ( = ?auto_266259 ?auto_266266 ) ) ( not ( = ?auto_266259 ?auto_266267 ) ) ( not ( = ?auto_266259 ?auto_266268 ) ) ( not ( = ?auto_266260 ?auto_266261 ) ) ( not ( = ?auto_266260 ?auto_266262 ) ) ( not ( = ?auto_266260 ?auto_266263 ) ) ( not ( = ?auto_266260 ?auto_266264 ) ) ( not ( = ?auto_266260 ?auto_266265 ) ) ( not ( = ?auto_266260 ?auto_266266 ) ) ( not ( = ?auto_266260 ?auto_266267 ) ) ( not ( = ?auto_266260 ?auto_266268 ) ) ( not ( = ?auto_266261 ?auto_266262 ) ) ( not ( = ?auto_266261 ?auto_266263 ) ) ( not ( = ?auto_266261 ?auto_266264 ) ) ( not ( = ?auto_266261 ?auto_266265 ) ) ( not ( = ?auto_266261 ?auto_266266 ) ) ( not ( = ?auto_266261 ?auto_266267 ) ) ( not ( = ?auto_266261 ?auto_266268 ) ) ( not ( = ?auto_266262 ?auto_266263 ) ) ( not ( = ?auto_266262 ?auto_266264 ) ) ( not ( = ?auto_266262 ?auto_266265 ) ) ( not ( = ?auto_266262 ?auto_266266 ) ) ( not ( = ?auto_266262 ?auto_266267 ) ) ( not ( = ?auto_266262 ?auto_266268 ) ) ( not ( = ?auto_266263 ?auto_266264 ) ) ( not ( = ?auto_266263 ?auto_266265 ) ) ( not ( = ?auto_266263 ?auto_266266 ) ) ( not ( = ?auto_266263 ?auto_266267 ) ) ( not ( = ?auto_266263 ?auto_266268 ) ) ( not ( = ?auto_266264 ?auto_266265 ) ) ( not ( = ?auto_266264 ?auto_266266 ) ) ( not ( = ?auto_266264 ?auto_266267 ) ) ( not ( = ?auto_266264 ?auto_266268 ) ) ( not ( = ?auto_266265 ?auto_266266 ) ) ( not ( = ?auto_266265 ?auto_266267 ) ) ( not ( = ?auto_266265 ?auto_266268 ) ) ( not ( = ?auto_266266 ?auto_266267 ) ) ( not ( = ?auto_266266 ?auto_266268 ) ) ( not ( = ?auto_266267 ?auto_266268 ) ) ( ON ?auto_266266 ?auto_266267 ) ( CLEAR ?auto_266264 ) ( ON ?auto_266265 ?auto_266266 ) ( CLEAR ?auto_266265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_266257 ?auto_266258 ?auto_266259 ?auto_266260 ?auto_266261 ?auto_266262 ?auto_266263 ?auto_266264 ?auto_266265 )
      ( MAKE-11PILE ?auto_266257 ?auto_266258 ?auto_266259 ?auto_266260 ?auto_266261 ?auto_266262 ?auto_266263 ?auto_266264 ?auto_266265 ?auto_266266 ?auto_266267 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266280 - BLOCK
      ?auto_266281 - BLOCK
      ?auto_266282 - BLOCK
      ?auto_266283 - BLOCK
      ?auto_266284 - BLOCK
      ?auto_266285 - BLOCK
      ?auto_266286 - BLOCK
      ?auto_266287 - BLOCK
      ?auto_266288 - BLOCK
      ?auto_266289 - BLOCK
      ?auto_266290 - BLOCK
    )
    :vars
    (
      ?auto_266291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266290 ?auto_266291 ) ( ON-TABLE ?auto_266280 ) ( ON ?auto_266281 ?auto_266280 ) ( ON ?auto_266282 ?auto_266281 ) ( ON ?auto_266283 ?auto_266282 ) ( ON ?auto_266284 ?auto_266283 ) ( ON ?auto_266285 ?auto_266284 ) ( ON ?auto_266286 ?auto_266285 ) ( ON ?auto_266287 ?auto_266286 ) ( not ( = ?auto_266280 ?auto_266281 ) ) ( not ( = ?auto_266280 ?auto_266282 ) ) ( not ( = ?auto_266280 ?auto_266283 ) ) ( not ( = ?auto_266280 ?auto_266284 ) ) ( not ( = ?auto_266280 ?auto_266285 ) ) ( not ( = ?auto_266280 ?auto_266286 ) ) ( not ( = ?auto_266280 ?auto_266287 ) ) ( not ( = ?auto_266280 ?auto_266288 ) ) ( not ( = ?auto_266280 ?auto_266289 ) ) ( not ( = ?auto_266280 ?auto_266290 ) ) ( not ( = ?auto_266280 ?auto_266291 ) ) ( not ( = ?auto_266281 ?auto_266282 ) ) ( not ( = ?auto_266281 ?auto_266283 ) ) ( not ( = ?auto_266281 ?auto_266284 ) ) ( not ( = ?auto_266281 ?auto_266285 ) ) ( not ( = ?auto_266281 ?auto_266286 ) ) ( not ( = ?auto_266281 ?auto_266287 ) ) ( not ( = ?auto_266281 ?auto_266288 ) ) ( not ( = ?auto_266281 ?auto_266289 ) ) ( not ( = ?auto_266281 ?auto_266290 ) ) ( not ( = ?auto_266281 ?auto_266291 ) ) ( not ( = ?auto_266282 ?auto_266283 ) ) ( not ( = ?auto_266282 ?auto_266284 ) ) ( not ( = ?auto_266282 ?auto_266285 ) ) ( not ( = ?auto_266282 ?auto_266286 ) ) ( not ( = ?auto_266282 ?auto_266287 ) ) ( not ( = ?auto_266282 ?auto_266288 ) ) ( not ( = ?auto_266282 ?auto_266289 ) ) ( not ( = ?auto_266282 ?auto_266290 ) ) ( not ( = ?auto_266282 ?auto_266291 ) ) ( not ( = ?auto_266283 ?auto_266284 ) ) ( not ( = ?auto_266283 ?auto_266285 ) ) ( not ( = ?auto_266283 ?auto_266286 ) ) ( not ( = ?auto_266283 ?auto_266287 ) ) ( not ( = ?auto_266283 ?auto_266288 ) ) ( not ( = ?auto_266283 ?auto_266289 ) ) ( not ( = ?auto_266283 ?auto_266290 ) ) ( not ( = ?auto_266283 ?auto_266291 ) ) ( not ( = ?auto_266284 ?auto_266285 ) ) ( not ( = ?auto_266284 ?auto_266286 ) ) ( not ( = ?auto_266284 ?auto_266287 ) ) ( not ( = ?auto_266284 ?auto_266288 ) ) ( not ( = ?auto_266284 ?auto_266289 ) ) ( not ( = ?auto_266284 ?auto_266290 ) ) ( not ( = ?auto_266284 ?auto_266291 ) ) ( not ( = ?auto_266285 ?auto_266286 ) ) ( not ( = ?auto_266285 ?auto_266287 ) ) ( not ( = ?auto_266285 ?auto_266288 ) ) ( not ( = ?auto_266285 ?auto_266289 ) ) ( not ( = ?auto_266285 ?auto_266290 ) ) ( not ( = ?auto_266285 ?auto_266291 ) ) ( not ( = ?auto_266286 ?auto_266287 ) ) ( not ( = ?auto_266286 ?auto_266288 ) ) ( not ( = ?auto_266286 ?auto_266289 ) ) ( not ( = ?auto_266286 ?auto_266290 ) ) ( not ( = ?auto_266286 ?auto_266291 ) ) ( not ( = ?auto_266287 ?auto_266288 ) ) ( not ( = ?auto_266287 ?auto_266289 ) ) ( not ( = ?auto_266287 ?auto_266290 ) ) ( not ( = ?auto_266287 ?auto_266291 ) ) ( not ( = ?auto_266288 ?auto_266289 ) ) ( not ( = ?auto_266288 ?auto_266290 ) ) ( not ( = ?auto_266288 ?auto_266291 ) ) ( not ( = ?auto_266289 ?auto_266290 ) ) ( not ( = ?auto_266289 ?auto_266291 ) ) ( not ( = ?auto_266290 ?auto_266291 ) ) ( ON ?auto_266289 ?auto_266290 ) ( CLEAR ?auto_266287 ) ( ON ?auto_266288 ?auto_266289 ) ( CLEAR ?auto_266288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_266280 ?auto_266281 ?auto_266282 ?auto_266283 ?auto_266284 ?auto_266285 ?auto_266286 ?auto_266287 ?auto_266288 )
      ( MAKE-11PILE ?auto_266280 ?auto_266281 ?auto_266282 ?auto_266283 ?auto_266284 ?auto_266285 ?auto_266286 ?auto_266287 ?auto_266288 ?auto_266289 ?auto_266290 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266303 - BLOCK
      ?auto_266304 - BLOCK
      ?auto_266305 - BLOCK
      ?auto_266306 - BLOCK
      ?auto_266307 - BLOCK
      ?auto_266308 - BLOCK
      ?auto_266309 - BLOCK
      ?auto_266310 - BLOCK
      ?auto_266311 - BLOCK
      ?auto_266312 - BLOCK
      ?auto_266313 - BLOCK
    )
    :vars
    (
      ?auto_266314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266313 ?auto_266314 ) ( ON-TABLE ?auto_266303 ) ( ON ?auto_266304 ?auto_266303 ) ( ON ?auto_266305 ?auto_266304 ) ( ON ?auto_266306 ?auto_266305 ) ( ON ?auto_266307 ?auto_266306 ) ( ON ?auto_266308 ?auto_266307 ) ( ON ?auto_266309 ?auto_266308 ) ( not ( = ?auto_266303 ?auto_266304 ) ) ( not ( = ?auto_266303 ?auto_266305 ) ) ( not ( = ?auto_266303 ?auto_266306 ) ) ( not ( = ?auto_266303 ?auto_266307 ) ) ( not ( = ?auto_266303 ?auto_266308 ) ) ( not ( = ?auto_266303 ?auto_266309 ) ) ( not ( = ?auto_266303 ?auto_266310 ) ) ( not ( = ?auto_266303 ?auto_266311 ) ) ( not ( = ?auto_266303 ?auto_266312 ) ) ( not ( = ?auto_266303 ?auto_266313 ) ) ( not ( = ?auto_266303 ?auto_266314 ) ) ( not ( = ?auto_266304 ?auto_266305 ) ) ( not ( = ?auto_266304 ?auto_266306 ) ) ( not ( = ?auto_266304 ?auto_266307 ) ) ( not ( = ?auto_266304 ?auto_266308 ) ) ( not ( = ?auto_266304 ?auto_266309 ) ) ( not ( = ?auto_266304 ?auto_266310 ) ) ( not ( = ?auto_266304 ?auto_266311 ) ) ( not ( = ?auto_266304 ?auto_266312 ) ) ( not ( = ?auto_266304 ?auto_266313 ) ) ( not ( = ?auto_266304 ?auto_266314 ) ) ( not ( = ?auto_266305 ?auto_266306 ) ) ( not ( = ?auto_266305 ?auto_266307 ) ) ( not ( = ?auto_266305 ?auto_266308 ) ) ( not ( = ?auto_266305 ?auto_266309 ) ) ( not ( = ?auto_266305 ?auto_266310 ) ) ( not ( = ?auto_266305 ?auto_266311 ) ) ( not ( = ?auto_266305 ?auto_266312 ) ) ( not ( = ?auto_266305 ?auto_266313 ) ) ( not ( = ?auto_266305 ?auto_266314 ) ) ( not ( = ?auto_266306 ?auto_266307 ) ) ( not ( = ?auto_266306 ?auto_266308 ) ) ( not ( = ?auto_266306 ?auto_266309 ) ) ( not ( = ?auto_266306 ?auto_266310 ) ) ( not ( = ?auto_266306 ?auto_266311 ) ) ( not ( = ?auto_266306 ?auto_266312 ) ) ( not ( = ?auto_266306 ?auto_266313 ) ) ( not ( = ?auto_266306 ?auto_266314 ) ) ( not ( = ?auto_266307 ?auto_266308 ) ) ( not ( = ?auto_266307 ?auto_266309 ) ) ( not ( = ?auto_266307 ?auto_266310 ) ) ( not ( = ?auto_266307 ?auto_266311 ) ) ( not ( = ?auto_266307 ?auto_266312 ) ) ( not ( = ?auto_266307 ?auto_266313 ) ) ( not ( = ?auto_266307 ?auto_266314 ) ) ( not ( = ?auto_266308 ?auto_266309 ) ) ( not ( = ?auto_266308 ?auto_266310 ) ) ( not ( = ?auto_266308 ?auto_266311 ) ) ( not ( = ?auto_266308 ?auto_266312 ) ) ( not ( = ?auto_266308 ?auto_266313 ) ) ( not ( = ?auto_266308 ?auto_266314 ) ) ( not ( = ?auto_266309 ?auto_266310 ) ) ( not ( = ?auto_266309 ?auto_266311 ) ) ( not ( = ?auto_266309 ?auto_266312 ) ) ( not ( = ?auto_266309 ?auto_266313 ) ) ( not ( = ?auto_266309 ?auto_266314 ) ) ( not ( = ?auto_266310 ?auto_266311 ) ) ( not ( = ?auto_266310 ?auto_266312 ) ) ( not ( = ?auto_266310 ?auto_266313 ) ) ( not ( = ?auto_266310 ?auto_266314 ) ) ( not ( = ?auto_266311 ?auto_266312 ) ) ( not ( = ?auto_266311 ?auto_266313 ) ) ( not ( = ?auto_266311 ?auto_266314 ) ) ( not ( = ?auto_266312 ?auto_266313 ) ) ( not ( = ?auto_266312 ?auto_266314 ) ) ( not ( = ?auto_266313 ?auto_266314 ) ) ( ON ?auto_266312 ?auto_266313 ) ( ON ?auto_266311 ?auto_266312 ) ( CLEAR ?auto_266309 ) ( ON ?auto_266310 ?auto_266311 ) ( CLEAR ?auto_266310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_266303 ?auto_266304 ?auto_266305 ?auto_266306 ?auto_266307 ?auto_266308 ?auto_266309 ?auto_266310 )
      ( MAKE-11PILE ?auto_266303 ?auto_266304 ?auto_266305 ?auto_266306 ?auto_266307 ?auto_266308 ?auto_266309 ?auto_266310 ?auto_266311 ?auto_266312 ?auto_266313 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266326 - BLOCK
      ?auto_266327 - BLOCK
      ?auto_266328 - BLOCK
      ?auto_266329 - BLOCK
      ?auto_266330 - BLOCK
      ?auto_266331 - BLOCK
      ?auto_266332 - BLOCK
      ?auto_266333 - BLOCK
      ?auto_266334 - BLOCK
      ?auto_266335 - BLOCK
      ?auto_266336 - BLOCK
    )
    :vars
    (
      ?auto_266337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266336 ?auto_266337 ) ( ON-TABLE ?auto_266326 ) ( ON ?auto_266327 ?auto_266326 ) ( ON ?auto_266328 ?auto_266327 ) ( ON ?auto_266329 ?auto_266328 ) ( ON ?auto_266330 ?auto_266329 ) ( ON ?auto_266331 ?auto_266330 ) ( ON ?auto_266332 ?auto_266331 ) ( not ( = ?auto_266326 ?auto_266327 ) ) ( not ( = ?auto_266326 ?auto_266328 ) ) ( not ( = ?auto_266326 ?auto_266329 ) ) ( not ( = ?auto_266326 ?auto_266330 ) ) ( not ( = ?auto_266326 ?auto_266331 ) ) ( not ( = ?auto_266326 ?auto_266332 ) ) ( not ( = ?auto_266326 ?auto_266333 ) ) ( not ( = ?auto_266326 ?auto_266334 ) ) ( not ( = ?auto_266326 ?auto_266335 ) ) ( not ( = ?auto_266326 ?auto_266336 ) ) ( not ( = ?auto_266326 ?auto_266337 ) ) ( not ( = ?auto_266327 ?auto_266328 ) ) ( not ( = ?auto_266327 ?auto_266329 ) ) ( not ( = ?auto_266327 ?auto_266330 ) ) ( not ( = ?auto_266327 ?auto_266331 ) ) ( not ( = ?auto_266327 ?auto_266332 ) ) ( not ( = ?auto_266327 ?auto_266333 ) ) ( not ( = ?auto_266327 ?auto_266334 ) ) ( not ( = ?auto_266327 ?auto_266335 ) ) ( not ( = ?auto_266327 ?auto_266336 ) ) ( not ( = ?auto_266327 ?auto_266337 ) ) ( not ( = ?auto_266328 ?auto_266329 ) ) ( not ( = ?auto_266328 ?auto_266330 ) ) ( not ( = ?auto_266328 ?auto_266331 ) ) ( not ( = ?auto_266328 ?auto_266332 ) ) ( not ( = ?auto_266328 ?auto_266333 ) ) ( not ( = ?auto_266328 ?auto_266334 ) ) ( not ( = ?auto_266328 ?auto_266335 ) ) ( not ( = ?auto_266328 ?auto_266336 ) ) ( not ( = ?auto_266328 ?auto_266337 ) ) ( not ( = ?auto_266329 ?auto_266330 ) ) ( not ( = ?auto_266329 ?auto_266331 ) ) ( not ( = ?auto_266329 ?auto_266332 ) ) ( not ( = ?auto_266329 ?auto_266333 ) ) ( not ( = ?auto_266329 ?auto_266334 ) ) ( not ( = ?auto_266329 ?auto_266335 ) ) ( not ( = ?auto_266329 ?auto_266336 ) ) ( not ( = ?auto_266329 ?auto_266337 ) ) ( not ( = ?auto_266330 ?auto_266331 ) ) ( not ( = ?auto_266330 ?auto_266332 ) ) ( not ( = ?auto_266330 ?auto_266333 ) ) ( not ( = ?auto_266330 ?auto_266334 ) ) ( not ( = ?auto_266330 ?auto_266335 ) ) ( not ( = ?auto_266330 ?auto_266336 ) ) ( not ( = ?auto_266330 ?auto_266337 ) ) ( not ( = ?auto_266331 ?auto_266332 ) ) ( not ( = ?auto_266331 ?auto_266333 ) ) ( not ( = ?auto_266331 ?auto_266334 ) ) ( not ( = ?auto_266331 ?auto_266335 ) ) ( not ( = ?auto_266331 ?auto_266336 ) ) ( not ( = ?auto_266331 ?auto_266337 ) ) ( not ( = ?auto_266332 ?auto_266333 ) ) ( not ( = ?auto_266332 ?auto_266334 ) ) ( not ( = ?auto_266332 ?auto_266335 ) ) ( not ( = ?auto_266332 ?auto_266336 ) ) ( not ( = ?auto_266332 ?auto_266337 ) ) ( not ( = ?auto_266333 ?auto_266334 ) ) ( not ( = ?auto_266333 ?auto_266335 ) ) ( not ( = ?auto_266333 ?auto_266336 ) ) ( not ( = ?auto_266333 ?auto_266337 ) ) ( not ( = ?auto_266334 ?auto_266335 ) ) ( not ( = ?auto_266334 ?auto_266336 ) ) ( not ( = ?auto_266334 ?auto_266337 ) ) ( not ( = ?auto_266335 ?auto_266336 ) ) ( not ( = ?auto_266335 ?auto_266337 ) ) ( not ( = ?auto_266336 ?auto_266337 ) ) ( ON ?auto_266335 ?auto_266336 ) ( ON ?auto_266334 ?auto_266335 ) ( CLEAR ?auto_266332 ) ( ON ?auto_266333 ?auto_266334 ) ( CLEAR ?auto_266333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_266326 ?auto_266327 ?auto_266328 ?auto_266329 ?auto_266330 ?auto_266331 ?auto_266332 ?auto_266333 )
      ( MAKE-11PILE ?auto_266326 ?auto_266327 ?auto_266328 ?auto_266329 ?auto_266330 ?auto_266331 ?auto_266332 ?auto_266333 ?auto_266334 ?auto_266335 ?auto_266336 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266349 - BLOCK
      ?auto_266350 - BLOCK
      ?auto_266351 - BLOCK
      ?auto_266352 - BLOCK
      ?auto_266353 - BLOCK
      ?auto_266354 - BLOCK
      ?auto_266355 - BLOCK
      ?auto_266356 - BLOCK
      ?auto_266357 - BLOCK
      ?auto_266358 - BLOCK
      ?auto_266359 - BLOCK
    )
    :vars
    (
      ?auto_266360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266359 ?auto_266360 ) ( ON-TABLE ?auto_266349 ) ( ON ?auto_266350 ?auto_266349 ) ( ON ?auto_266351 ?auto_266350 ) ( ON ?auto_266352 ?auto_266351 ) ( ON ?auto_266353 ?auto_266352 ) ( ON ?auto_266354 ?auto_266353 ) ( not ( = ?auto_266349 ?auto_266350 ) ) ( not ( = ?auto_266349 ?auto_266351 ) ) ( not ( = ?auto_266349 ?auto_266352 ) ) ( not ( = ?auto_266349 ?auto_266353 ) ) ( not ( = ?auto_266349 ?auto_266354 ) ) ( not ( = ?auto_266349 ?auto_266355 ) ) ( not ( = ?auto_266349 ?auto_266356 ) ) ( not ( = ?auto_266349 ?auto_266357 ) ) ( not ( = ?auto_266349 ?auto_266358 ) ) ( not ( = ?auto_266349 ?auto_266359 ) ) ( not ( = ?auto_266349 ?auto_266360 ) ) ( not ( = ?auto_266350 ?auto_266351 ) ) ( not ( = ?auto_266350 ?auto_266352 ) ) ( not ( = ?auto_266350 ?auto_266353 ) ) ( not ( = ?auto_266350 ?auto_266354 ) ) ( not ( = ?auto_266350 ?auto_266355 ) ) ( not ( = ?auto_266350 ?auto_266356 ) ) ( not ( = ?auto_266350 ?auto_266357 ) ) ( not ( = ?auto_266350 ?auto_266358 ) ) ( not ( = ?auto_266350 ?auto_266359 ) ) ( not ( = ?auto_266350 ?auto_266360 ) ) ( not ( = ?auto_266351 ?auto_266352 ) ) ( not ( = ?auto_266351 ?auto_266353 ) ) ( not ( = ?auto_266351 ?auto_266354 ) ) ( not ( = ?auto_266351 ?auto_266355 ) ) ( not ( = ?auto_266351 ?auto_266356 ) ) ( not ( = ?auto_266351 ?auto_266357 ) ) ( not ( = ?auto_266351 ?auto_266358 ) ) ( not ( = ?auto_266351 ?auto_266359 ) ) ( not ( = ?auto_266351 ?auto_266360 ) ) ( not ( = ?auto_266352 ?auto_266353 ) ) ( not ( = ?auto_266352 ?auto_266354 ) ) ( not ( = ?auto_266352 ?auto_266355 ) ) ( not ( = ?auto_266352 ?auto_266356 ) ) ( not ( = ?auto_266352 ?auto_266357 ) ) ( not ( = ?auto_266352 ?auto_266358 ) ) ( not ( = ?auto_266352 ?auto_266359 ) ) ( not ( = ?auto_266352 ?auto_266360 ) ) ( not ( = ?auto_266353 ?auto_266354 ) ) ( not ( = ?auto_266353 ?auto_266355 ) ) ( not ( = ?auto_266353 ?auto_266356 ) ) ( not ( = ?auto_266353 ?auto_266357 ) ) ( not ( = ?auto_266353 ?auto_266358 ) ) ( not ( = ?auto_266353 ?auto_266359 ) ) ( not ( = ?auto_266353 ?auto_266360 ) ) ( not ( = ?auto_266354 ?auto_266355 ) ) ( not ( = ?auto_266354 ?auto_266356 ) ) ( not ( = ?auto_266354 ?auto_266357 ) ) ( not ( = ?auto_266354 ?auto_266358 ) ) ( not ( = ?auto_266354 ?auto_266359 ) ) ( not ( = ?auto_266354 ?auto_266360 ) ) ( not ( = ?auto_266355 ?auto_266356 ) ) ( not ( = ?auto_266355 ?auto_266357 ) ) ( not ( = ?auto_266355 ?auto_266358 ) ) ( not ( = ?auto_266355 ?auto_266359 ) ) ( not ( = ?auto_266355 ?auto_266360 ) ) ( not ( = ?auto_266356 ?auto_266357 ) ) ( not ( = ?auto_266356 ?auto_266358 ) ) ( not ( = ?auto_266356 ?auto_266359 ) ) ( not ( = ?auto_266356 ?auto_266360 ) ) ( not ( = ?auto_266357 ?auto_266358 ) ) ( not ( = ?auto_266357 ?auto_266359 ) ) ( not ( = ?auto_266357 ?auto_266360 ) ) ( not ( = ?auto_266358 ?auto_266359 ) ) ( not ( = ?auto_266358 ?auto_266360 ) ) ( not ( = ?auto_266359 ?auto_266360 ) ) ( ON ?auto_266358 ?auto_266359 ) ( ON ?auto_266357 ?auto_266358 ) ( ON ?auto_266356 ?auto_266357 ) ( CLEAR ?auto_266354 ) ( ON ?auto_266355 ?auto_266356 ) ( CLEAR ?auto_266355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_266349 ?auto_266350 ?auto_266351 ?auto_266352 ?auto_266353 ?auto_266354 ?auto_266355 )
      ( MAKE-11PILE ?auto_266349 ?auto_266350 ?auto_266351 ?auto_266352 ?auto_266353 ?auto_266354 ?auto_266355 ?auto_266356 ?auto_266357 ?auto_266358 ?auto_266359 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266372 - BLOCK
      ?auto_266373 - BLOCK
      ?auto_266374 - BLOCK
      ?auto_266375 - BLOCK
      ?auto_266376 - BLOCK
      ?auto_266377 - BLOCK
      ?auto_266378 - BLOCK
      ?auto_266379 - BLOCK
      ?auto_266380 - BLOCK
      ?auto_266381 - BLOCK
      ?auto_266382 - BLOCK
    )
    :vars
    (
      ?auto_266383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266382 ?auto_266383 ) ( ON-TABLE ?auto_266372 ) ( ON ?auto_266373 ?auto_266372 ) ( ON ?auto_266374 ?auto_266373 ) ( ON ?auto_266375 ?auto_266374 ) ( ON ?auto_266376 ?auto_266375 ) ( ON ?auto_266377 ?auto_266376 ) ( not ( = ?auto_266372 ?auto_266373 ) ) ( not ( = ?auto_266372 ?auto_266374 ) ) ( not ( = ?auto_266372 ?auto_266375 ) ) ( not ( = ?auto_266372 ?auto_266376 ) ) ( not ( = ?auto_266372 ?auto_266377 ) ) ( not ( = ?auto_266372 ?auto_266378 ) ) ( not ( = ?auto_266372 ?auto_266379 ) ) ( not ( = ?auto_266372 ?auto_266380 ) ) ( not ( = ?auto_266372 ?auto_266381 ) ) ( not ( = ?auto_266372 ?auto_266382 ) ) ( not ( = ?auto_266372 ?auto_266383 ) ) ( not ( = ?auto_266373 ?auto_266374 ) ) ( not ( = ?auto_266373 ?auto_266375 ) ) ( not ( = ?auto_266373 ?auto_266376 ) ) ( not ( = ?auto_266373 ?auto_266377 ) ) ( not ( = ?auto_266373 ?auto_266378 ) ) ( not ( = ?auto_266373 ?auto_266379 ) ) ( not ( = ?auto_266373 ?auto_266380 ) ) ( not ( = ?auto_266373 ?auto_266381 ) ) ( not ( = ?auto_266373 ?auto_266382 ) ) ( not ( = ?auto_266373 ?auto_266383 ) ) ( not ( = ?auto_266374 ?auto_266375 ) ) ( not ( = ?auto_266374 ?auto_266376 ) ) ( not ( = ?auto_266374 ?auto_266377 ) ) ( not ( = ?auto_266374 ?auto_266378 ) ) ( not ( = ?auto_266374 ?auto_266379 ) ) ( not ( = ?auto_266374 ?auto_266380 ) ) ( not ( = ?auto_266374 ?auto_266381 ) ) ( not ( = ?auto_266374 ?auto_266382 ) ) ( not ( = ?auto_266374 ?auto_266383 ) ) ( not ( = ?auto_266375 ?auto_266376 ) ) ( not ( = ?auto_266375 ?auto_266377 ) ) ( not ( = ?auto_266375 ?auto_266378 ) ) ( not ( = ?auto_266375 ?auto_266379 ) ) ( not ( = ?auto_266375 ?auto_266380 ) ) ( not ( = ?auto_266375 ?auto_266381 ) ) ( not ( = ?auto_266375 ?auto_266382 ) ) ( not ( = ?auto_266375 ?auto_266383 ) ) ( not ( = ?auto_266376 ?auto_266377 ) ) ( not ( = ?auto_266376 ?auto_266378 ) ) ( not ( = ?auto_266376 ?auto_266379 ) ) ( not ( = ?auto_266376 ?auto_266380 ) ) ( not ( = ?auto_266376 ?auto_266381 ) ) ( not ( = ?auto_266376 ?auto_266382 ) ) ( not ( = ?auto_266376 ?auto_266383 ) ) ( not ( = ?auto_266377 ?auto_266378 ) ) ( not ( = ?auto_266377 ?auto_266379 ) ) ( not ( = ?auto_266377 ?auto_266380 ) ) ( not ( = ?auto_266377 ?auto_266381 ) ) ( not ( = ?auto_266377 ?auto_266382 ) ) ( not ( = ?auto_266377 ?auto_266383 ) ) ( not ( = ?auto_266378 ?auto_266379 ) ) ( not ( = ?auto_266378 ?auto_266380 ) ) ( not ( = ?auto_266378 ?auto_266381 ) ) ( not ( = ?auto_266378 ?auto_266382 ) ) ( not ( = ?auto_266378 ?auto_266383 ) ) ( not ( = ?auto_266379 ?auto_266380 ) ) ( not ( = ?auto_266379 ?auto_266381 ) ) ( not ( = ?auto_266379 ?auto_266382 ) ) ( not ( = ?auto_266379 ?auto_266383 ) ) ( not ( = ?auto_266380 ?auto_266381 ) ) ( not ( = ?auto_266380 ?auto_266382 ) ) ( not ( = ?auto_266380 ?auto_266383 ) ) ( not ( = ?auto_266381 ?auto_266382 ) ) ( not ( = ?auto_266381 ?auto_266383 ) ) ( not ( = ?auto_266382 ?auto_266383 ) ) ( ON ?auto_266381 ?auto_266382 ) ( ON ?auto_266380 ?auto_266381 ) ( ON ?auto_266379 ?auto_266380 ) ( CLEAR ?auto_266377 ) ( ON ?auto_266378 ?auto_266379 ) ( CLEAR ?auto_266378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_266372 ?auto_266373 ?auto_266374 ?auto_266375 ?auto_266376 ?auto_266377 ?auto_266378 )
      ( MAKE-11PILE ?auto_266372 ?auto_266373 ?auto_266374 ?auto_266375 ?auto_266376 ?auto_266377 ?auto_266378 ?auto_266379 ?auto_266380 ?auto_266381 ?auto_266382 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266395 - BLOCK
      ?auto_266396 - BLOCK
      ?auto_266397 - BLOCK
      ?auto_266398 - BLOCK
      ?auto_266399 - BLOCK
      ?auto_266400 - BLOCK
      ?auto_266401 - BLOCK
      ?auto_266402 - BLOCK
      ?auto_266403 - BLOCK
      ?auto_266404 - BLOCK
      ?auto_266405 - BLOCK
    )
    :vars
    (
      ?auto_266406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266405 ?auto_266406 ) ( ON-TABLE ?auto_266395 ) ( ON ?auto_266396 ?auto_266395 ) ( ON ?auto_266397 ?auto_266396 ) ( ON ?auto_266398 ?auto_266397 ) ( ON ?auto_266399 ?auto_266398 ) ( not ( = ?auto_266395 ?auto_266396 ) ) ( not ( = ?auto_266395 ?auto_266397 ) ) ( not ( = ?auto_266395 ?auto_266398 ) ) ( not ( = ?auto_266395 ?auto_266399 ) ) ( not ( = ?auto_266395 ?auto_266400 ) ) ( not ( = ?auto_266395 ?auto_266401 ) ) ( not ( = ?auto_266395 ?auto_266402 ) ) ( not ( = ?auto_266395 ?auto_266403 ) ) ( not ( = ?auto_266395 ?auto_266404 ) ) ( not ( = ?auto_266395 ?auto_266405 ) ) ( not ( = ?auto_266395 ?auto_266406 ) ) ( not ( = ?auto_266396 ?auto_266397 ) ) ( not ( = ?auto_266396 ?auto_266398 ) ) ( not ( = ?auto_266396 ?auto_266399 ) ) ( not ( = ?auto_266396 ?auto_266400 ) ) ( not ( = ?auto_266396 ?auto_266401 ) ) ( not ( = ?auto_266396 ?auto_266402 ) ) ( not ( = ?auto_266396 ?auto_266403 ) ) ( not ( = ?auto_266396 ?auto_266404 ) ) ( not ( = ?auto_266396 ?auto_266405 ) ) ( not ( = ?auto_266396 ?auto_266406 ) ) ( not ( = ?auto_266397 ?auto_266398 ) ) ( not ( = ?auto_266397 ?auto_266399 ) ) ( not ( = ?auto_266397 ?auto_266400 ) ) ( not ( = ?auto_266397 ?auto_266401 ) ) ( not ( = ?auto_266397 ?auto_266402 ) ) ( not ( = ?auto_266397 ?auto_266403 ) ) ( not ( = ?auto_266397 ?auto_266404 ) ) ( not ( = ?auto_266397 ?auto_266405 ) ) ( not ( = ?auto_266397 ?auto_266406 ) ) ( not ( = ?auto_266398 ?auto_266399 ) ) ( not ( = ?auto_266398 ?auto_266400 ) ) ( not ( = ?auto_266398 ?auto_266401 ) ) ( not ( = ?auto_266398 ?auto_266402 ) ) ( not ( = ?auto_266398 ?auto_266403 ) ) ( not ( = ?auto_266398 ?auto_266404 ) ) ( not ( = ?auto_266398 ?auto_266405 ) ) ( not ( = ?auto_266398 ?auto_266406 ) ) ( not ( = ?auto_266399 ?auto_266400 ) ) ( not ( = ?auto_266399 ?auto_266401 ) ) ( not ( = ?auto_266399 ?auto_266402 ) ) ( not ( = ?auto_266399 ?auto_266403 ) ) ( not ( = ?auto_266399 ?auto_266404 ) ) ( not ( = ?auto_266399 ?auto_266405 ) ) ( not ( = ?auto_266399 ?auto_266406 ) ) ( not ( = ?auto_266400 ?auto_266401 ) ) ( not ( = ?auto_266400 ?auto_266402 ) ) ( not ( = ?auto_266400 ?auto_266403 ) ) ( not ( = ?auto_266400 ?auto_266404 ) ) ( not ( = ?auto_266400 ?auto_266405 ) ) ( not ( = ?auto_266400 ?auto_266406 ) ) ( not ( = ?auto_266401 ?auto_266402 ) ) ( not ( = ?auto_266401 ?auto_266403 ) ) ( not ( = ?auto_266401 ?auto_266404 ) ) ( not ( = ?auto_266401 ?auto_266405 ) ) ( not ( = ?auto_266401 ?auto_266406 ) ) ( not ( = ?auto_266402 ?auto_266403 ) ) ( not ( = ?auto_266402 ?auto_266404 ) ) ( not ( = ?auto_266402 ?auto_266405 ) ) ( not ( = ?auto_266402 ?auto_266406 ) ) ( not ( = ?auto_266403 ?auto_266404 ) ) ( not ( = ?auto_266403 ?auto_266405 ) ) ( not ( = ?auto_266403 ?auto_266406 ) ) ( not ( = ?auto_266404 ?auto_266405 ) ) ( not ( = ?auto_266404 ?auto_266406 ) ) ( not ( = ?auto_266405 ?auto_266406 ) ) ( ON ?auto_266404 ?auto_266405 ) ( ON ?auto_266403 ?auto_266404 ) ( ON ?auto_266402 ?auto_266403 ) ( ON ?auto_266401 ?auto_266402 ) ( CLEAR ?auto_266399 ) ( ON ?auto_266400 ?auto_266401 ) ( CLEAR ?auto_266400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_266395 ?auto_266396 ?auto_266397 ?auto_266398 ?auto_266399 ?auto_266400 )
      ( MAKE-11PILE ?auto_266395 ?auto_266396 ?auto_266397 ?auto_266398 ?auto_266399 ?auto_266400 ?auto_266401 ?auto_266402 ?auto_266403 ?auto_266404 ?auto_266405 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266418 - BLOCK
      ?auto_266419 - BLOCK
      ?auto_266420 - BLOCK
      ?auto_266421 - BLOCK
      ?auto_266422 - BLOCK
      ?auto_266423 - BLOCK
      ?auto_266424 - BLOCK
      ?auto_266425 - BLOCK
      ?auto_266426 - BLOCK
      ?auto_266427 - BLOCK
      ?auto_266428 - BLOCK
    )
    :vars
    (
      ?auto_266429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266428 ?auto_266429 ) ( ON-TABLE ?auto_266418 ) ( ON ?auto_266419 ?auto_266418 ) ( ON ?auto_266420 ?auto_266419 ) ( ON ?auto_266421 ?auto_266420 ) ( ON ?auto_266422 ?auto_266421 ) ( not ( = ?auto_266418 ?auto_266419 ) ) ( not ( = ?auto_266418 ?auto_266420 ) ) ( not ( = ?auto_266418 ?auto_266421 ) ) ( not ( = ?auto_266418 ?auto_266422 ) ) ( not ( = ?auto_266418 ?auto_266423 ) ) ( not ( = ?auto_266418 ?auto_266424 ) ) ( not ( = ?auto_266418 ?auto_266425 ) ) ( not ( = ?auto_266418 ?auto_266426 ) ) ( not ( = ?auto_266418 ?auto_266427 ) ) ( not ( = ?auto_266418 ?auto_266428 ) ) ( not ( = ?auto_266418 ?auto_266429 ) ) ( not ( = ?auto_266419 ?auto_266420 ) ) ( not ( = ?auto_266419 ?auto_266421 ) ) ( not ( = ?auto_266419 ?auto_266422 ) ) ( not ( = ?auto_266419 ?auto_266423 ) ) ( not ( = ?auto_266419 ?auto_266424 ) ) ( not ( = ?auto_266419 ?auto_266425 ) ) ( not ( = ?auto_266419 ?auto_266426 ) ) ( not ( = ?auto_266419 ?auto_266427 ) ) ( not ( = ?auto_266419 ?auto_266428 ) ) ( not ( = ?auto_266419 ?auto_266429 ) ) ( not ( = ?auto_266420 ?auto_266421 ) ) ( not ( = ?auto_266420 ?auto_266422 ) ) ( not ( = ?auto_266420 ?auto_266423 ) ) ( not ( = ?auto_266420 ?auto_266424 ) ) ( not ( = ?auto_266420 ?auto_266425 ) ) ( not ( = ?auto_266420 ?auto_266426 ) ) ( not ( = ?auto_266420 ?auto_266427 ) ) ( not ( = ?auto_266420 ?auto_266428 ) ) ( not ( = ?auto_266420 ?auto_266429 ) ) ( not ( = ?auto_266421 ?auto_266422 ) ) ( not ( = ?auto_266421 ?auto_266423 ) ) ( not ( = ?auto_266421 ?auto_266424 ) ) ( not ( = ?auto_266421 ?auto_266425 ) ) ( not ( = ?auto_266421 ?auto_266426 ) ) ( not ( = ?auto_266421 ?auto_266427 ) ) ( not ( = ?auto_266421 ?auto_266428 ) ) ( not ( = ?auto_266421 ?auto_266429 ) ) ( not ( = ?auto_266422 ?auto_266423 ) ) ( not ( = ?auto_266422 ?auto_266424 ) ) ( not ( = ?auto_266422 ?auto_266425 ) ) ( not ( = ?auto_266422 ?auto_266426 ) ) ( not ( = ?auto_266422 ?auto_266427 ) ) ( not ( = ?auto_266422 ?auto_266428 ) ) ( not ( = ?auto_266422 ?auto_266429 ) ) ( not ( = ?auto_266423 ?auto_266424 ) ) ( not ( = ?auto_266423 ?auto_266425 ) ) ( not ( = ?auto_266423 ?auto_266426 ) ) ( not ( = ?auto_266423 ?auto_266427 ) ) ( not ( = ?auto_266423 ?auto_266428 ) ) ( not ( = ?auto_266423 ?auto_266429 ) ) ( not ( = ?auto_266424 ?auto_266425 ) ) ( not ( = ?auto_266424 ?auto_266426 ) ) ( not ( = ?auto_266424 ?auto_266427 ) ) ( not ( = ?auto_266424 ?auto_266428 ) ) ( not ( = ?auto_266424 ?auto_266429 ) ) ( not ( = ?auto_266425 ?auto_266426 ) ) ( not ( = ?auto_266425 ?auto_266427 ) ) ( not ( = ?auto_266425 ?auto_266428 ) ) ( not ( = ?auto_266425 ?auto_266429 ) ) ( not ( = ?auto_266426 ?auto_266427 ) ) ( not ( = ?auto_266426 ?auto_266428 ) ) ( not ( = ?auto_266426 ?auto_266429 ) ) ( not ( = ?auto_266427 ?auto_266428 ) ) ( not ( = ?auto_266427 ?auto_266429 ) ) ( not ( = ?auto_266428 ?auto_266429 ) ) ( ON ?auto_266427 ?auto_266428 ) ( ON ?auto_266426 ?auto_266427 ) ( ON ?auto_266425 ?auto_266426 ) ( ON ?auto_266424 ?auto_266425 ) ( CLEAR ?auto_266422 ) ( ON ?auto_266423 ?auto_266424 ) ( CLEAR ?auto_266423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_266418 ?auto_266419 ?auto_266420 ?auto_266421 ?auto_266422 ?auto_266423 )
      ( MAKE-11PILE ?auto_266418 ?auto_266419 ?auto_266420 ?auto_266421 ?auto_266422 ?auto_266423 ?auto_266424 ?auto_266425 ?auto_266426 ?auto_266427 ?auto_266428 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266441 - BLOCK
      ?auto_266442 - BLOCK
      ?auto_266443 - BLOCK
      ?auto_266444 - BLOCK
      ?auto_266445 - BLOCK
      ?auto_266446 - BLOCK
      ?auto_266447 - BLOCK
      ?auto_266448 - BLOCK
      ?auto_266449 - BLOCK
      ?auto_266450 - BLOCK
      ?auto_266451 - BLOCK
    )
    :vars
    (
      ?auto_266452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266451 ?auto_266452 ) ( ON-TABLE ?auto_266441 ) ( ON ?auto_266442 ?auto_266441 ) ( ON ?auto_266443 ?auto_266442 ) ( ON ?auto_266444 ?auto_266443 ) ( not ( = ?auto_266441 ?auto_266442 ) ) ( not ( = ?auto_266441 ?auto_266443 ) ) ( not ( = ?auto_266441 ?auto_266444 ) ) ( not ( = ?auto_266441 ?auto_266445 ) ) ( not ( = ?auto_266441 ?auto_266446 ) ) ( not ( = ?auto_266441 ?auto_266447 ) ) ( not ( = ?auto_266441 ?auto_266448 ) ) ( not ( = ?auto_266441 ?auto_266449 ) ) ( not ( = ?auto_266441 ?auto_266450 ) ) ( not ( = ?auto_266441 ?auto_266451 ) ) ( not ( = ?auto_266441 ?auto_266452 ) ) ( not ( = ?auto_266442 ?auto_266443 ) ) ( not ( = ?auto_266442 ?auto_266444 ) ) ( not ( = ?auto_266442 ?auto_266445 ) ) ( not ( = ?auto_266442 ?auto_266446 ) ) ( not ( = ?auto_266442 ?auto_266447 ) ) ( not ( = ?auto_266442 ?auto_266448 ) ) ( not ( = ?auto_266442 ?auto_266449 ) ) ( not ( = ?auto_266442 ?auto_266450 ) ) ( not ( = ?auto_266442 ?auto_266451 ) ) ( not ( = ?auto_266442 ?auto_266452 ) ) ( not ( = ?auto_266443 ?auto_266444 ) ) ( not ( = ?auto_266443 ?auto_266445 ) ) ( not ( = ?auto_266443 ?auto_266446 ) ) ( not ( = ?auto_266443 ?auto_266447 ) ) ( not ( = ?auto_266443 ?auto_266448 ) ) ( not ( = ?auto_266443 ?auto_266449 ) ) ( not ( = ?auto_266443 ?auto_266450 ) ) ( not ( = ?auto_266443 ?auto_266451 ) ) ( not ( = ?auto_266443 ?auto_266452 ) ) ( not ( = ?auto_266444 ?auto_266445 ) ) ( not ( = ?auto_266444 ?auto_266446 ) ) ( not ( = ?auto_266444 ?auto_266447 ) ) ( not ( = ?auto_266444 ?auto_266448 ) ) ( not ( = ?auto_266444 ?auto_266449 ) ) ( not ( = ?auto_266444 ?auto_266450 ) ) ( not ( = ?auto_266444 ?auto_266451 ) ) ( not ( = ?auto_266444 ?auto_266452 ) ) ( not ( = ?auto_266445 ?auto_266446 ) ) ( not ( = ?auto_266445 ?auto_266447 ) ) ( not ( = ?auto_266445 ?auto_266448 ) ) ( not ( = ?auto_266445 ?auto_266449 ) ) ( not ( = ?auto_266445 ?auto_266450 ) ) ( not ( = ?auto_266445 ?auto_266451 ) ) ( not ( = ?auto_266445 ?auto_266452 ) ) ( not ( = ?auto_266446 ?auto_266447 ) ) ( not ( = ?auto_266446 ?auto_266448 ) ) ( not ( = ?auto_266446 ?auto_266449 ) ) ( not ( = ?auto_266446 ?auto_266450 ) ) ( not ( = ?auto_266446 ?auto_266451 ) ) ( not ( = ?auto_266446 ?auto_266452 ) ) ( not ( = ?auto_266447 ?auto_266448 ) ) ( not ( = ?auto_266447 ?auto_266449 ) ) ( not ( = ?auto_266447 ?auto_266450 ) ) ( not ( = ?auto_266447 ?auto_266451 ) ) ( not ( = ?auto_266447 ?auto_266452 ) ) ( not ( = ?auto_266448 ?auto_266449 ) ) ( not ( = ?auto_266448 ?auto_266450 ) ) ( not ( = ?auto_266448 ?auto_266451 ) ) ( not ( = ?auto_266448 ?auto_266452 ) ) ( not ( = ?auto_266449 ?auto_266450 ) ) ( not ( = ?auto_266449 ?auto_266451 ) ) ( not ( = ?auto_266449 ?auto_266452 ) ) ( not ( = ?auto_266450 ?auto_266451 ) ) ( not ( = ?auto_266450 ?auto_266452 ) ) ( not ( = ?auto_266451 ?auto_266452 ) ) ( ON ?auto_266450 ?auto_266451 ) ( ON ?auto_266449 ?auto_266450 ) ( ON ?auto_266448 ?auto_266449 ) ( ON ?auto_266447 ?auto_266448 ) ( ON ?auto_266446 ?auto_266447 ) ( CLEAR ?auto_266444 ) ( ON ?auto_266445 ?auto_266446 ) ( CLEAR ?auto_266445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_266441 ?auto_266442 ?auto_266443 ?auto_266444 ?auto_266445 )
      ( MAKE-11PILE ?auto_266441 ?auto_266442 ?auto_266443 ?auto_266444 ?auto_266445 ?auto_266446 ?auto_266447 ?auto_266448 ?auto_266449 ?auto_266450 ?auto_266451 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266464 - BLOCK
      ?auto_266465 - BLOCK
      ?auto_266466 - BLOCK
      ?auto_266467 - BLOCK
      ?auto_266468 - BLOCK
      ?auto_266469 - BLOCK
      ?auto_266470 - BLOCK
      ?auto_266471 - BLOCK
      ?auto_266472 - BLOCK
      ?auto_266473 - BLOCK
      ?auto_266474 - BLOCK
    )
    :vars
    (
      ?auto_266475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266474 ?auto_266475 ) ( ON-TABLE ?auto_266464 ) ( ON ?auto_266465 ?auto_266464 ) ( ON ?auto_266466 ?auto_266465 ) ( ON ?auto_266467 ?auto_266466 ) ( not ( = ?auto_266464 ?auto_266465 ) ) ( not ( = ?auto_266464 ?auto_266466 ) ) ( not ( = ?auto_266464 ?auto_266467 ) ) ( not ( = ?auto_266464 ?auto_266468 ) ) ( not ( = ?auto_266464 ?auto_266469 ) ) ( not ( = ?auto_266464 ?auto_266470 ) ) ( not ( = ?auto_266464 ?auto_266471 ) ) ( not ( = ?auto_266464 ?auto_266472 ) ) ( not ( = ?auto_266464 ?auto_266473 ) ) ( not ( = ?auto_266464 ?auto_266474 ) ) ( not ( = ?auto_266464 ?auto_266475 ) ) ( not ( = ?auto_266465 ?auto_266466 ) ) ( not ( = ?auto_266465 ?auto_266467 ) ) ( not ( = ?auto_266465 ?auto_266468 ) ) ( not ( = ?auto_266465 ?auto_266469 ) ) ( not ( = ?auto_266465 ?auto_266470 ) ) ( not ( = ?auto_266465 ?auto_266471 ) ) ( not ( = ?auto_266465 ?auto_266472 ) ) ( not ( = ?auto_266465 ?auto_266473 ) ) ( not ( = ?auto_266465 ?auto_266474 ) ) ( not ( = ?auto_266465 ?auto_266475 ) ) ( not ( = ?auto_266466 ?auto_266467 ) ) ( not ( = ?auto_266466 ?auto_266468 ) ) ( not ( = ?auto_266466 ?auto_266469 ) ) ( not ( = ?auto_266466 ?auto_266470 ) ) ( not ( = ?auto_266466 ?auto_266471 ) ) ( not ( = ?auto_266466 ?auto_266472 ) ) ( not ( = ?auto_266466 ?auto_266473 ) ) ( not ( = ?auto_266466 ?auto_266474 ) ) ( not ( = ?auto_266466 ?auto_266475 ) ) ( not ( = ?auto_266467 ?auto_266468 ) ) ( not ( = ?auto_266467 ?auto_266469 ) ) ( not ( = ?auto_266467 ?auto_266470 ) ) ( not ( = ?auto_266467 ?auto_266471 ) ) ( not ( = ?auto_266467 ?auto_266472 ) ) ( not ( = ?auto_266467 ?auto_266473 ) ) ( not ( = ?auto_266467 ?auto_266474 ) ) ( not ( = ?auto_266467 ?auto_266475 ) ) ( not ( = ?auto_266468 ?auto_266469 ) ) ( not ( = ?auto_266468 ?auto_266470 ) ) ( not ( = ?auto_266468 ?auto_266471 ) ) ( not ( = ?auto_266468 ?auto_266472 ) ) ( not ( = ?auto_266468 ?auto_266473 ) ) ( not ( = ?auto_266468 ?auto_266474 ) ) ( not ( = ?auto_266468 ?auto_266475 ) ) ( not ( = ?auto_266469 ?auto_266470 ) ) ( not ( = ?auto_266469 ?auto_266471 ) ) ( not ( = ?auto_266469 ?auto_266472 ) ) ( not ( = ?auto_266469 ?auto_266473 ) ) ( not ( = ?auto_266469 ?auto_266474 ) ) ( not ( = ?auto_266469 ?auto_266475 ) ) ( not ( = ?auto_266470 ?auto_266471 ) ) ( not ( = ?auto_266470 ?auto_266472 ) ) ( not ( = ?auto_266470 ?auto_266473 ) ) ( not ( = ?auto_266470 ?auto_266474 ) ) ( not ( = ?auto_266470 ?auto_266475 ) ) ( not ( = ?auto_266471 ?auto_266472 ) ) ( not ( = ?auto_266471 ?auto_266473 ) ) ( not ( = ?auto_266471 ?auto_266474 ) ) ( not ( = ?auto_266471 ?auto_266475 ) ) ( not ( = ?auto_266472 ?auto_266473 ) ) ( not ( = ?auto_266472 ?auto_266474 ) ) ( not ( = ?auto_266472 ?auto_266475 ) ) ( not ( = ?auto_266473 ?auto_266474 ) ) ( not ( = ?auto_266473 ?auto_266475 ) ) ( not ( = ?auto_266474 ?auto_266475 ) ) ( ON ?auto_266473 ?auto_266474 ) ( ON ?auto_266472 ?auto_266473 ) ( ON ?auto_266471 ?auto_266472 ) ( ON ?auto_266470 ?auto_266471 ) ( ON ?auto_266469 ?auto_266470 ) ( CLEAR ?auto_266467 ) ( ON ?auto_266468 ?auto_266469 ) ( CLEAR ?auto_266468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_266464 ?auto_266465 ?auto_266466 ?auto_266467 ?auto_266468 )
      ( MAKE-11PILE ?auto_266464 ?auto_266465 ?auto_266466 ?auto_266467 ?auto_266468 ?auto_266469 ?auto_266470 ?auto_266471 ?auto_266472 ?auto_266473 ?auto_266474 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266487 - BLOCK
      ?auto_266488 - BLOCK
      ?auto_266489 - BLOCK
      ?auto_266490 - BLOCK
      ?auto_266491 - BLOCK
      ?auto_266492 - BLOCK
      ?auto_266493 - BLOCK
      ?auto_266494 - BLOCK
      ?auto_266495 - BLOCK
      ?auto_266496 - BLOCK
      ?auto_266497 - BLOCK
    )
    :vars
    (
      ?auto_266498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266497 ?auto_266498 ) ( ON-TABLE ?auto_266487 ) ( ON ?auto_266488 ?auto_266487 ) ( ON ?auto_266489 ?auto_266488 ) ( not ( = ?auto_266487 ?auto_266488 ) ) ( not ( = ?auto_266487 ?auto_266489 ) ) ( not ( = ?auto_266487 ?auto_266490 ) ) ( not ( = ?auto_266487 ?auto_266491 ) ) ( not ( = ?auto_266487 ?auto_266492 ) ) ( not ( = ?auto_266487 ?auto_266493 ) ) ( not ( = ?auto_266487 ?auto_266494 ) ) ( not ( = ?auto_266487 ?auto_266495 ) ) ( not ( = ?auto_266487 ?auto_266496 ) ) ( not ( = ?auto_266487 ?auto_266497 ) ) ( not ( = ?auto_266487 ?auto_266498 ) ) ( not ( = ?auto_266488 ?auto_266489 ) ) ( not ( = ?auto_266488 ?auto_266490 ) ) ( not ( = ?auto_266488 ?auto_266491 ) ) ( not ( = ?auto_266488 ?auto_266492 ) ) ( not ( = ?auto_266488 ?auto_266493 ) ) ( not ( = ?auto_266488 ?auto_266494 ) ) ( not ( = ?auto_266488 ?auto_266495 ) ) ( not ( = ?auto_266488 ?auto_266496 ) ) ( not ( = ?auto_266488 ?auto_266497 ) ) ( not ( = ?auto_266488 ?auto_266498 ) ) ( not ( = ?auto_266489 ?auto_266490 ) ) ( not ( = ?auto_266489 ?auto_266491 ) ) ( not ( = ?auto_266489 ?auto_266492 ) ) ( not ( = ?auto_266489 ?auto_266493 ) ) ( not ( = ?auto_266489 ?auto_266494 ) ) ( not ( = ?auto_266489 ?auto_266495 ) ) ( not ( = ?auto_266489 ?auto_266496 ) ) ( not ( = ?auto_266489 ?auto_266497 ) ) ( not ( = ?auto_266489 ?auto_266498 ) ) ( not ( = ?auto_266490 ?auto_266491 ) ) ( not ( = ?auto_266490 ?auto_266492 ) ) ( not ( = ?auto_266490 ?auto_266493 ) ) ( not ( = ?auto_266490 ?auto_266494 ) ) ( not ( = ?auto_266490 ?auto_266495 ) ) ( not ( = ?auto_266490 ?auto_266496 ) ) ( not ( = ?auto_266490 ?auto_266497 ) ) ( not ( = ?auto_266490 ?auto_266498 ) ) ( not ( = ?auto_266491 ?auto_266492 ) ) ( not ( = ?auto_266491 ?auto_266493 ) ) ( not ( = ?auto_266491 ?auto_266494 ) ) ( not ( = ?auto_266491 ?auto_266495 ) ) ( not ( = ?auto_266491 ?auto_266496 ) ) ( not ( = ?auto_266491 ?auto_266497 ) ) ( not ( = ?auto_266491 ?auto_266498 ) ) ( not ( = ?auto_266492 ?auto_266493 ) ) ( not ( = ?auto_266492 ?auto_266494 ) ) ( not ( = ?auto_266492 ?auto_266495 ) ) ( not ( = ?auto_266492 ?auto_266496 ) ) ( not ( = ?auto_266492 ?auto_266497 ) ) ( not ( = ?auto_266492 ?auto_266498 ) ) ( not ( = ?auto_266493 ?auto_266494 ) ) ( not ( = ?auto_266493 ?auto_266495 ) ) ( not ( = ?auto_266493 ?auto_266496 ) ) ( not ( = ?auto_266493 ?auto_266497 ) ) ( not ( = ?auto_266493 ?auto_266498 ) ) ( not ( = ?auto_266494 ?auto_266495 ) ) ( not ( = ?auto_266494 ?auto_266496 ) ) ( not ( = ?auto_266494 ?auto_266497 ) ) ( not ( = ?auto_266494 ?auto_266498 ) ) ( not ( = ?auto_266495 ?auto_266496 ) ) ( not ( = ?auto_266495 ?auto_266497 ) ) ( not ( = ?auto_266495 ?auto_266498 ) ) ( not ( = ?auto_266496 ?auto_266497 ) ) ( not ( = ?auto_266496 ?auto_266498 ) ) ( not ( = ?auto_266497 ?auto_266498 ) ) ( ON ?auto_266496 ?auto_266497 ) ( ON ?auto_266495 ?auto_266496 ) ( ON ?auto_266494 ?auto_266495 ) ( ON ?auto_266493 ?auto_266494 ) ( ON ?auto_266492 ?auto_266493 ) ( ON ?auto_266491 ?auto_266492 ) ( CLEAR ?auto_266489 ) ( ON ?auto_266490 ?auto_266491 ) ( CLEAR ?auto_266490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_266487 ?auto_266488 ?auto_266489 ?auto_266490 )
      ( MAKE-11PILE ?auto_266487 ?auto_266488 ?auto_266489 ?auto_266490 ?auto_266491 ?auto_266492 ?auto_266493 ?auto_266494 ?auto_266495 ?auto_266496 ?auto_266497 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266510 - BLOCK
      ?auto_266511 - BLOCK
      ?auto_266512 - BLOCK
      ?auto_266513 - BLOCK
      ?auto_266514 - BLOCK
      ?auto_266515 - BLOCK
      ?auto_266516 - BLOCK
      ?auto_266517 - BLOCK
      ?auto_266518 - BLOCK
      ?auto_266519 - BLOCK
      ?auto_266520 - BLOCK
    )
    :vars
    (
      ?auto_266521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266520 ?auto_266521 ) ( ON-TABLE ?auto_266510 ) ( ON ?auto_266511 ?auto_266510 ) ( ON ?auto_266512 ?auto_266511 ) ( not ( = ?auto_266510 ?auto_266511 ) ) ( not ( = ?auto_266510 ?auto_266512 ) ) ( not ( = ?auto_266510 ?auto_266513 ) ) ( not ( = ?auto_266510 ?auto_266514 ) ) ( not ( = ?auto_266510 ?auto_266515 ) ) ( not ( = ?auto_266510 ?auto_266516 ) ) ( not ( = ?auto_266510 ?auto_266517 ) ) ( not ( = ?auto_266510 ?auto_266518 ) ) ( not ( = ?auto_266510 ?auto_266519 ) ) ( not ( = ?auto_266510 ?auto_266520 ) ) ( not ( = ?auto_266510 ?auto_266521 ) ) ( not ( = ?auto_266511 ?auto_266512 ) ) ( not ( = ?auto_266511 ?auto_266513 ) ) ( not ( = ?auto_266511 ?auto_266514 ) ) ( not ( = ?auto_266511 ?auto_266515 ) ) ( not ( = ?auto_266511 ?auto_266516 ) ) ( not ( = ?auto_266511 ?auto_266517 ) ) ( not ( = ?auto_266511 ?auto_266518 ) ) ( not ( = ?auto_266511 ?auto_266519 ) ) ( not ( = ?auto_266511 ?auto_266520 ) ) ( not ( = ?auto_266511 ?auto_266521 ) ) ( not ( = ?auto_266512 ?auto_266513 ) ) ( not ( = ?auto_266512 ?auto_266514 ) ) ( not ( = ?auto_266512 ?auto_266515 ) ) ( not ( = ?auto_266512 ?auto_266516 ) ) ( not ( = ?auto_266512 ?auto_266517 ) ) ( not ( = ?auto_266512 ?auto_266518 ) ) ( not ( = ?auto_266512 ?auto_266519 ) ) ( not ( = ?auto_266512 ?auto_266520 ) ) ( not ( = ?auto_266512 ?auto_266521 ) ) ( not ( = ?auto_266513 ?auto_266514 ) ) ( not ( = ?auto_266513 ?auto_266515 ) ) ( not ( = ?auto_266513 ?auto_266516 ) ) ( not ( = ?auto_266513 ?auto_266517 ) ) ( not ( = ?auto_266513 ?auto_266518 ) ) ( not ( = ?auto_266513 ?auto_266519 ) ) ( not ( = ?auto_266513 ?auto_266520 ) ) ( not ( = ?auto_266513 ?auto_266521 ) ) ( not ( = ?auto_266514 ?auto_266515 ) ) ( not ( = ?auto_266514 ?auto_266516 ) ) ( not ( = ?auto_266514 ?auto_266517 ) ) ( not ( = ?auto_266514 ?auto_266518 ) ) ( not ( = ?auto_266514 ?auto_266519 ) ) ( not ( = ?auto_266514 ?auto_266520 ) ) ( not ( = ?auto_266514 ?auto_266521 ) ) ( not ( = ?auto_266515 ?auto_266516 ) ) ( not ( = ?auto_266515 ?auto_266517 ) ) ( not ( = ?auto_266515 ?auto_266518 ) ) ( not ( = ?auto_266515 ?auto_266519 ) ) ( not ( = ?auto_266515 ?auto_266520 ) ) ( not ( = ?auto_266515 ?auto_266521 ) ) ( not ( = ?auto_266516 ?auto_266517 ) ) ( not ( = ?auto_266516 ?auto_266518 ) ) ( not ( = ?auto_266516 ?auto_266519 ) ) ( not ( = ?auto_266516 ?auto_266520 ) ) ( not ( = ?auto_266516 ?auto_266521 ) ) ( not ( = ?auto_266517 ?auto_266518 ) ) ( not ( = ?auto_266517 ?auto_266519 ) ) ( not ( = ?auto_266517 ?auto_266520 ) ) ( not ( = ?auto_266517 ?auto_266521 ) ) ( not ( = ?auto_266518 ?auto_266519 ) ) ( not ( = ?auto_266518 ?auto_266520 ) ) ( not ( = ?auto_266518 ?auto_266521 ) ) ( not ( = ?auto_266519 ?auto_266520 ) ) ( not ( = ?auto_266519 ?auto_266521 ) ) ( not ( = ?auto_266520 ?auto_266521 ) ) ( ON ?auto_266519 ?auto_266520 ) ( ON ?auto_266518 ?auto_266519 ) ( ON ?auto_266517 ?auto_266518 ) ( ON ?auto_266516 ?auto_266517 ) ( ON ?auto_266515 ?auto_266516 ) ( ON ?auto_266514 ?auto_266515 ) ( CLEAR ?auto_266512 ) ( ON ?auto_266513 ?auto_266514 ) ( CLEAR ?auto_266513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_266510 ?auto_266511 ?auto_266512 ?auto_266513 )
      ( MAKE-11PILE ?auto_266510 ?auto_266511 ?auto_266512 ?auto_266513 ?auto_266514 ?auto_266515 ?auto_266516 ?auto_266517 ?auto_266518 ?auto_266519 ?auto_266520 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266533 - BLOCK
      ?auto_266534 - BLOCK
      ?auto_266535 - BLOCK
      ?auto_266536 - BLOCK
      ?auto_266537 - BLOCK
      ?auto_266538 - BLOCK
      ?auto_266539 - BLOCK
      ?auto_266540 - BLOCK
      ?auto_266541 - BLOCK
      ?auto_266542 - BLOCK
      ?auto_266543 - BLOCK
    )
    :vars
    (
      ?auto_266544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266543 ?auto_266544 ) ( ON-TABLE ?auto_266533 ) ( ON ?auto_266534 ?auto_266533 ) ( not ( = ?auto_266533 ?auto_266534 ) ) ( not ( = ?auto_266533 ?auto_266535 ) ) ( not ( = ?auto_266533 ?auto_266536 ) ) ( not ( = ?auto_266533 ?auto_266537 ) ) ( not ( = ?auto_266533 ?auto_266538 ) ) ( not ( = ?auto_266533 ?auto_266539 ) ) ( not ( = ?auto_266533 ?auto_266540 ) ) ( not ( = ?auto_266533 ?auto_266541 ) ) ( not ( = ?auto_266533 ?auto_266542 ) ) ( not ( = ?auto_266533 ?auto_266543 ) ) ( not ( = ?auto_266533 ?auto_266544 ) ) ( not ( = ?auto_266534 ?auto_266535 ) ) ( not ( = ?auto_266534 ?auto_266536 ) ) ( not ( = ?auto_266534 ?auto_266537 ) ) ( not ( = ?auto_266534 ?auto_266538 ) ) ( not ( = ?auto_266534 ?auto_266539 ) ) ( not ( = ?auto_266534 ?auto_266540 ) ) ( not ( = ?auto_266534 ?auto_266541 ) ) ( not ( = ?auto_266534 ?auto_266542 ) ) ( not ( = ?auto_266534 ?auto_266543 ) ) ( not ( = ?auto_266534 ?auto_266544 ) ) ( not ( = ?auto_266535 ?auto_266536 ) ) ( not ( = ?auto_266535 ?auto_266537 ) ) ( not ( = ?auto_266535 ?auto_266538 ) ) ( not ( = ?auto_266535 ?auto_266539 ) ) ( not ( = ?auto_266535 ?auto_266540 ) ) ( not ( = ?auto_266535 ?auto_266541 ) ) ( not ( = ?auto_266535 ?auto_266542 ) ) ( not ( = ?auto_266535 ?auto_266543 ) ) ( not ( = ?auto_266535 ?auto_266544 ) ) ( not ( = ?auto_266536 ?auto_266537 ) ) ( not ( = ?auto_266536 ?auto_266538 ) ) ( not ( = ?auto_266536 ?auto_266539 ) ) ( not ( = ?auto_266536 ?auto_266540 ) ) ( not ( = ?auto_266536 ?auto_266541 ) ) ( not ( = ?auto_266536 ?auto_266542 ) ) ( not ( = ?auto_266536 ?auto_266543 ) ) ( not ( = ?auto_266536 ?auto_266544 ) ) ( not ( = ?auto_266537 ?auto_266538 ) ) ( not ( = ?auto_266537 ?auto_266539 ) ) ( not ( = ?auto_266537 ?auto_266540 ) ) ( not ( = ?auto_266537 ?auto_266541 ) ) ( not ( = ?auto_266537 ?auto_266542 ) ) ( not ( = ?auto_266537 ?auto_266543 ) ) ( not ( = ?auto_266537 ?auto_266544 ) ) ( not ( = ?auto_266538 ?auto_266539 ) ) ( not ( = ?auto_266538 ?auto_266540 ) ) ( not ( = ?auto_266538 ?auto_266541 ) ) ( not ( = ?auto_266538 ?auto_266542 ) ) ( not ( = ?auto_266538 ?auto_266543 ) ) ( not ( = ?auto_266538 ?auto_266544 ) ) ( not ( = ?auto_266539 ?auto_266540 ) ) ( not ( = ?auto_266539 ?auto_266541 ) ) ( not ( = ?auto_266539 ?auto_266542 ) ) ( not ( = ?auto_266539 ?auto_266543 ) ) ( not ( = ?auto_266539 ?auto_266544 ) ) ( not ( = ?auto_266540 ?auto_266541 ) ) ( not ( = ?auto_266540 ?auto_266542 ) ) ( not ( = ?auto_266540 ?auto_266543 ) ) ( not ( = ?auto_266540 ?auto_266544 ) ) ( not ( = ?auto_266541 ?auto_266542 ) ) ( not ( = ?auto_266541 ?auto_266543 ) ) ( not ( = ?auto_266541 ?auto_266544 ) ) ( not ( = ?auto_266542 ?auto_266543 ) ) ( not ( = ?auto_266542 ?auto_266544 ) ) ( not ( = ?auto_266543 ?auto_266544 ) ) ( ON ?auto_266542 ?auto_266543 ) ( ON ?auto_266541 ?auto_266542 ) ( ON ?auto_266540 ?auto_266541 ) ( ON ?auto_266539 ?auto_266540 ) ( ON ?auto_266538 ?auto_266539 ) ( ON ?auto_266537 ?auto_266538 ) ( ON ?auto_266536 ?auto_266537 ) ( CLEAR ?auto_266534 ) ( ON ?auto_266535 ?auto_266536 ) ( CLEAR ?auto_266535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_266533 ?auto_266534 ?auto_266535 )
      ( MAKE-11PILE ?auto_266533 ?auto_266534 ?auto_266535 ?auto_266536 ?auto_266537 ?auto_266538 ?auto_266539 ?auto_266540 ?auto_266541 ?auto_266542 ?auto_266543 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266556 - BLOCK
      ?auto_266557 - BLOCK
      ?auto_266558 - BLOCK
      ?auto_266559 - BLOCK
      ?auto_266560 - BLOCK
      ?auto_266561 - BLOCK
      ?auto_266562 - BLOCK
      ?auto_266563 - BLOCK
      ?auto_266564 - BLOCK
      ?auto_266565 - BLOCK
      ?auto_266566 - BLOCK
    )
    :vars
    (
      ?auto_266567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266566 ?auto_266567 ) ( ON-TABLE ?auto_266556 ) ( ON ?auto_266557 ?auto_266556 ) ( not ( = ?auto_266556 ?auto_266557 ) ) ( not ( = ?auto_266556 ?auto_266558 ) ) ( not ( = ?auto_266556 ?auto_266559 ) ) ( not ( = ?auto_266556 ?auto_266560 ) ) ( not ( = ?auto_266556 ?auto_266561 ) ) ( not ( = ?auto_266556 ?auto_266562 ) ) ( not ( = ?auto_266556 ?auto_266563 ) ) ( not ( = ?auto_266556 ?auto_266564 ) ) ( not ( = ?auto_266556 ?auto_266565 ) ) ( not ( = ?auto_266556 ?auto_266566 ) ) ( not ( = ?auto_266556 ?auto_266567 ) ) ( not ( = ?auto_266557 ?auto_266558 ) ) ( not ( = ?auto_266557 ?auto_266559 ) ) ( not ( = ?auto_266557 ?auto_266560 ) ) ( not ( = ?auto_266557 ?auto_266561 ) ) ( not ( = ?auto_266557 ?auto_266562 ) ) ( not ( = ?auto_266557 ?auto_266563 ) ) ( not ( = ?auto_266557 ?auto_266564 ) ) ( not ( = ?auto_266557 ?auto_266565 ) ) ( not ( = ?auto_266557 ?auto_266566 ) ) ( not ( = ?auto_266557 ?auto_266567 ) ) ( not ( = ?auto_266558 ?auto_266559 ) ) ( not ( = ?auto_266558 ?auto_266560 ) ) ( not ( = ?auto_266558 ?auto_266561 ) ) ( not ( = ?auto_266558 ?auto_266562 ) ) ( not ( = ?auto_266558 ?auto_266563 ) ) ( not ( = ?auto_266558 ?auto_266564 ) ) ( not ( = ?auto_266558 ?auto_266565 ) ) ( not ( = ?auto_266558 ?auto_266566 ) ) ( not ( = ?auto_266558 ?auto_266567 ) ) ( not ( = ?auto_266559 ?auto_266560 ) ) ( not ( = ?auto_266559 ?auto_266561 ) ) ( not ( = ?auto_266559 ?auto_266562 ) ) ( not ( = ?auto_266559 ?auto_266563 ) ) ( not ( = ?auto_266559 ?auto_266564 ) ) ( not ( = ?auto_266559 ?auto_266565 ) ) ( not ( = ?auto_266559 ?auto_266566 ) ) ( not ( = ?auto_266559 ?auto_266567 ) ) ( not ( = ?auto_266560 ?auto_266561 ) ) ( not ( = ?auto_266560 ?auto_266562 ) ) ( not ( = ?auto_266560 ?auto_266563 ) ) ( not ( = ?auto_266560 ?auto_266564 ) ) ( not ( = ?auto_266560 ?auto_266565 ) ) ( not ( = ?auto_266560 ?auto_266566 ) ) ( not ( = ?auto_266560 ?auto_266567 ) ) ( not ( = ?auto_266561 ?auto_266562 ) ) ( not ( = ?auto_266561 ?auto_266563 ) ) ( not ( = ?auto_266561 ?auto_266564 ) ) ( not ( = ?auto_266561 ?auto_266565 ) ) ( not ( = ?auto_266561 ?auto_266566 ) ) ( not ( = ?auto_266561 ?auto_266567 ) ) ( not ( = ?auto_266562 ?auto_266563 ) ) ( not ( = ?auto_266562 ?auto_266564 ) ) ( not ( = ?auto_266562 ?auto_266565 ) ) ( not ( = ?auto_266562 ?auto_266566 ) ) ( not ( = ?auto_266562 ?auto_266567 ) ) ( not ( = ?auto_266563 ?auto_266564 ) ) ( not ( = ?auto_266563 ?auto_266565 ) ) ( not ( = ?auto_266563 ?auto_266566 ) ) ( not ( = ?auto_266563 ?auto_266567 ) ) ( not ( = ?auto_266564 ?auto_266565 ) ) ( not ( = ?auto_266564 ?auto_266566 ) ) ( not ( = ?auto_266564 ?auto_266567 ) ) ( not ( = ?auto_266565 ?auto_266566 ) ) ( not ( = ?auto_266565 ?auto_266567 ) ) ( not ( = ?auto_266566 ?auto_266567 ) ) ( ON ?auto_266565 ?auto_266566 ) ( ON ?auto_266564 ?auto_266565 ) ( ON ?auto_266563 ?auto_266564 ) ( ON ?auto_266562 ?auto_266563 ) ( ON ?auto_266561 ?auto_266562 ) ( ON ?auto_266560 ?auto_266561 ) ( ON ?auto_266559 ?auto_266560 ) ( CLEAR ?auto_266557 ) ( ON ?auto_266558 ?auto_266559 ) ( CLEAR ?auto_266558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_266556 ?auto_266557 ?auto_266558 )
      ( MAKE-11PILE ?auto_266556 ?auto_266557 ?auto_266558 ?auto_266559 ?auto_266560 ?auto_266561 ?auto_266562 ?auto_266563 ?auto_266564 ?auto_266565 ?auto_266566 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266579 - BLOCK
      ?auto_266580 - BLOCK
      ?auto_266581 - BLOCK
      ?auto_266582 - BLOCK
      ?auto_266583 - BLOCK
      ?auto_266584 - BLOCK
      ?auto_266585 - BLOCK
      ?auto_266586 - BLOCK
      ?auto_266587 - BLOCK
      ?auto_266588 - BLOCK
      ?auto_266589 - BLOCK
    )
    :vars
    (
      ?auto_266590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266589 ?auto_266590 ) ( ON-TABLE ?auto_266579 ) ( not ( = ?auto_266579 ?auto_266580 ) ) ( not ( = ?auto_266579 ?auto_266581 ) ) ( not ( = ?auto_266579 ?auto_266582 ) ) ( not ( = ?auto_266579 ?auto_266583 ) ) ( not ( = ?auto_266579 ?auto_266584 ) ) ( not ( = ?auto_266579 ?auto_266585 ) ) ( not ( = ?auto_266579 ?auto_266586 ) ) ( not ( = ?auto_266579 ?auto_266587 ) ) ( not ( = ?auto_266579 ?auto_266588 ) ) ( not ( = ?auto_266579 ?auto_266589 ) ) ( not ( = ?auto_266579 ?auto_266590 ) ) ( not ( = ?auto_266580 ?auto_266581 ) ) ( not ( = ?auto_266580 ?auto_266582 ) ) ( not ( = ?auto_266580 ?auto_266583 ) ) ( not ( = ?auto_266580 ?auto_266584 ) ) ( not ( = ?auto_266580 ?auto_266585 ) ) ( not ( = ?auto_266580 ?auto_266586 ) ) ( not ( = ?auto_266580 ?auto_266587 ) ) ( not ( = ?auto_266580 ?auto_266588 ) ) ( not ( = ?auto_266580 ?auto_266589 ) ) ( not ( = ?auto_266580 ?auto_266590 ) ) ( not ( = ?auto_266581 ?auto_266582 ) ) ( not ( = ?auto_266581 ?auto_266583 ) ) ( not ( = ?auto_266581 ?auto_266584 ) ) ( not ( = ?auto_266581 ?auto_266585 ) ) ( not ( = ?auto_266581 ?auto_266586 ) ) ( not ( = ?auto_266581 ?auto_266587 ) ) ( not ( = ?auto_266581 ?auto_266588 ) ) ( not ( = ?auto_266581 ?auto_266589 ) ) ( not ( = ?auto_266581 ?auto_266590 ) ) ( not ( = ?auto_266582 ?auto_266583 ) ) ( not ( = ?auto_266582 ?auto_266584 ) ) ( not ( = ?auto_266582 ?auto_266585 ) ) ( not ( = ?auto_266582 ?auto_266586 ) ) ( not ( = ?auto_266582 ?auto_266587 ) ) ( not ( = ?auto_266582 ?auto_266588 ) ) ( not ( = ?auto_266582 ?auto_266589 ) ) ( not ( = ?auto_266582 ?auto_266590 ) ) ( not ( = ?auto_266583 ?auto_266584 ) ) ( not ( = ?auto_266583 ?auto_266585 ) ) ( not ( = ?auto_266583 ?auto_266586 ) ) ( not ( = ?auto_266583 ?auto_266587 ) ) ( not ( = ?auto_266583 ?auto_266588 ) ) ( not ( = ?auto_266583 ?auto_266589 ) ) ( not ( = ?auto_266583 ?auto_266590 ) ) ( not ( = ?auto_266584 ?auto_266585 ) ) ( not ( = ?auto_266584 ?auto_266586 ) ) ( not ( = ?auto_266584 ?auto_266587 ) ) ( not ( = ?auto_266584 ?auto_266588 ) ) ( not ( = ?auto_266584 ?auto_266589 ) ) ( not ( = ?auto_266584 ?auto_266590 ) ) ( not ( = ?auto_266585 ?auto_266586 ) ) ( not ( = ?auto_266585 ?auto_266587 ) ) ( not ( = ?auto_266585 ?auto_266588 ) ) ( not ( = ?auto_266585 ?auto_266589 ) ) ( not ( = ?auto_266585 ?auto_266590 ) ) ( not ( = ?auto_266586 ?auto_266587 ) ) ( not ( = ?auto_266586 ?auto_266588 ) ) ( not ( = ?auto_266586 ?auto_266589 ) ) ( not ( = ?auto_266586 ?auto_266590 ) ) ( not ( = ?auto_266587 ?auto_266588 ) ) ( not ( = ?auto_266587 ?auto_266589 ) ) ( not ( = ?auto_266587 ?auto_266590 ) ) ( not ( = ?auto_266588 ?auto_266589 ) ) ( not ( = ?auto_266588 ?auto_266590 ) ) ( not ( = ?auto_266589 ?auto_266590 ) ) ( ON ?auto_266588 ?auto_266589 ) ( ON ?auto_266587 ?auto_266588 ) ( ON ?auto_266586 ?auto_266587 ) ( ON ?auto_266585 ?auto_266586 ) ( ON ?auto_266584 ?auto_266585 ) ( ON ?auto_266583 ?auto_266584 ) ( ON ?auto_266582 ?auto_266583 ) ( ON ?auto_266581 ?auto_266582 ) ( CLEAR ?auto_266579 ) ( ON ?auto_266580 ?auto_266581 ) ( CLEAR ?auto_266580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_266579 ?auto_266580 )
      ( MAKE-11PILE ?auto_266579 ?auto_266580 ?auto_266581 ?auto_266582 ?auto_266583 ?auto_266584 ?auto_266585 ?auto_266586 ?auto_266587 ?auto_266588 ?auto_266589 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266602 - BLOCK
      ?auto_266603 - BLOCK
      ?auto_266604 - BLOCK
      ?auto_266605 - BLOCK
      ?auto_266606 - BLOCK
      ?auto_266607 - BLOCK
      ?auto_266608 - BLOCK
      ?auto_266609 - BLOCK
      ?auto_266610 - BLOCK
      ?auto_266611 - BLOCK
      ?auto_266612 - BLOCK
    )
    :vars
    (
      ?auto_266613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266612 ?auto_266613 ) ( ON-TABLE ?auto_266602 ) ( not ( = ?auto_266602 ?auto_266603 ) ) ( not ( = ?auto_266602 ?auto_266604 ) ) ( not ( = ?auto_266602 ?auto_266605 ) ) ( not ( = ?auto_266602 ?auto_266606 ) ) ( not ( = ?auto_266602 ?auto_266607 ) ) ( not ( = ?auto_266602 ?auto_266608 ) ) ( not ( = ?auto_266602 ?auto_266609 ) ) ( not ( = ?auto_266602 ?auto_266610 ) ) ( not ( = ?auto_266602 ?auto_266611 ) ) ( not ( = ?auto_266602 ?auto_266612 ) ) ( not ( = ?auto_266602 ?auto_266613 ) ) ( not ( = ?auto_266603 ?auto_266604 ) ) ( not ( = ?auto_266603 ?auto_266605 ) ) ( not ( = ?auto_266603 ?auto_266606 ) ) ( not ( = ?auto_266603 ?auto_266607 ) ) ( not ( = ?auto_266603 ?auto_266608 ) ) ( not ( = ?auto_266603 ?auto_266609 ) ) ( not ( = ?auto_266603 ?auto_266610 ) ) ( not ( = ?auto_266603 ?auto_266611 ) ) ( not ( = ?auto_266603 ?auto_266612 ) ) ( not ( = ?auto_266603 ?auto_266613 ) ) ( not ( = ?auto_266604 ?auto_266605 ) ) ( not ( = ?auto_266604 ?auto_266606 ) ) ( not ( = ?auto_266604 ?auto_266607 ) ) ( not ( = ?auto_266604 ?auto_266608 ) ) ( not ( = ?auto_266604 ?auto_266609 ) ) ( not ( = ?auto_266604 ?auto_266610 ) ) ( not ( = ?auto_266604 ?auto_266611 ) ) ( not ( = ?auto_266604 ?auto_266612 ) ) ( not ( = ?auto_266604 ?auto_266613 ) ) ( not ( = ?auto_266605 ?auto_266606 ) ) ( not ( = ?auto_266605 ?auto_266607 ) ) ( not ( = ?auto_266605 ?auto_266608 ) ) ( not ( = ?auto_266605 ?auto_266609 ) ) ( not ( = ?auto_266605 ?auto_266610 ) ) ( not ( = ?auto_266605 ?auto_266611 ) ) ( not ( = ?auto_266605 ?auto_266612 ) ) ( not ( = ?auto_266605 ?auto_266613 ) ) ( not ( = ?auto_266606 ?auto_266607 ) ) ( not ( = ?auto_266606 ?auto_266608 ) ) ( not ( = ?auto_266606 ?auto_266609 ) ) ( not ( = ?auto_266606 ?auto_266610 ) ) ( not ( = ?auto_266606 ?auto_266611 ) ) ( not ( = ?auto_266606 ?auto_266612 ) ) ( not ( = ?auto_266606 ?auto_266613 ) ) ( not ( = ?auto_266607 ?auto_266608 ) ) ( not ( = ?auto_266607 ?auto_266609 ) ) ( not ( = ?auto_266607 ?auto_266610 ) ) ( not ( = ?auto_266607 ?auto_266611 ) ) ( not ( = ?auto_266607 ?auto_266612 ) ) ( not ( = ?auto_266607 ?auto_266613 ) ) ( not ( = ?auto_266608 ?auto_266609 ) ) ( not ( = ?auto_266608 ?auto_266610 ) ) ( not ( = ?auto_266608 ?auto_266611 ) ) ( not ( = ?auto_266608 ?auto_266612 ) ) ( not ( = ?auto_266608 ?auto_266613 ) ) ( not ( = ?auto_266609 ?auto_266610 ) ) ( not ( = ?auto_266609 ?auto_266611 ) ) ( not ( = ?auto_266609 ?auto_266612 ) ) ( not ( = ?auto_266609 ?auto_266613 ) ) ( not ( = ?auto_266610 ?auto_266611 ) ) ( not ( = ?auto_266610 ?auto_266612 ) ) ( not ( = ?auto_266610 ?auto_266613 ) ) ( not ( = ?auto_266611 ?auto_266612 ) ) ( not ( = ?auto_266611 ?auto_266613 ) ) ( not ( = ?auto_266612 ?auto_266613 ) ) ( ON ?auto_266611 ?auto_266612 ) ( ON ?auto_266610 ?auto_266611 ) ( ON ?auto_266609 ?auto_266610 ) ( ON ?auto_266608 ?auto_266609 ) ( ON ?auto_266607 ?auto_266608 ) ( ON ?auto_266606 ?auto_266607 ) ( ON ?auto_266605 ?auto_266606 ) ( ON ?auto_266604 ?auto_266605 ) ( CLEAR ?auto_266602 ) ( ON ?auto_266603 ?auto_266604 ) ( CLEAR ?auto_266603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_266602 ?auto_266603 )
      ( MAKE-11PILE ?auto_266602 ?auto_266603 ?auto_266604 ?auto_266605 ?auto_266606 ?auto_266607 ?auto_266608 ?auto_266609 ?auto_266610 ?auto_266611 ?auto_266612 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266625 - BLOCK
      ?auto_266626 - BLOCK
      ?auto_266627 - BLOCK
      ?auto_266628 - BLOCK
      ?auto_266629 - BLOCK
      ?auto_266630 - BLOCK
      ?auto_266631 - BLOCK
      ?auto_266632 - BLOCK
      ?auto_266633 - BLOCK
      ?auto_266634 - BLOCK
      ?auto_266635 - BLOCK
    )
    :vars
    (
      ?auto_266636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266635 ?auto_266636 ) ( not ( = ?auto_266625 ?auto_266626 ) ) ( not ( = ?auto_266625 ?auto_266627 ) ) ( not ( = ?auto_266625 ?auto_266628 ) ) ( not ( = ?auto_266625 ?auto_266629 ) ) ( not ( = ?auto_266625 ?auto_266630 ) ) ( not ( = ?auto_266625 ?auto_266631 ) ) ( not ( = ?auto_266625 ?auto_266632 ) ) ( not ( = ?auto_266625 ?auto_266633 ) ) ( not ( = ?auto_266625 ?auto_266634 ) ) ( not ( = ?auto_266625 ?auto_266635 ) ) ( not ( = ?auto_266625 ?auto_266636 ) ) ( not ( = ?auto_266626 ?auto_266627 ) ) ( not ( = ?auto_266626 ?auto_266628 ) ) ( not ( = ?auto_266626 ?auto_266629 ) ) ( not ( = ?auto_266626 ?auto_266630 ) ) ( not ( = ?auto_266626 ?auto_266631 ) ) ( not ( = ?auto_266626 ?auto_266632 ) ) ( not ( = ?auto_266626 ?auto_266633 ) ) ( not ( = ?auto_266626 ?auto_266634 ) ) ( not ( = ?auto_266626 ?auto_266635 ) ) ( not ( = ?auto_266626 ?auto_266636 ) ) ( not ( = ?auto_266627 ?auto_266628 ) ) ( not ( = ?auto_266627 ?auto_266629 ) ) ( not ( = ?auto_266627 ?auto_266630 ) ) ( not ( = ?auto_266627 ?auto_266631 ) ) ( not ( = ?auto_266627 ?auto_266632 ) ) ( not ( = ?auto_266627 ?auto_266633 ) ) ( not ( = ?auto_266627 ?auto_266634 ) ) ( not ( = ?auto_266627 ?auto_266635 ) ) ( not ( = ?auto_266627 ?auto_266636 ) ) ( not ( = ?auto_266628 ?auto_266629 ) ) ( not ( = ?auto_266628 ?auto_266630 ) ) ( not ( = ?auto_266628 ?auto_266631 ) ) ( not ( = ?auto_266628 ?auto_266632 ) ) ( not ( = ?auto_266628 ?auto_266633 ) ) ( not ( = ?auto_266628 ?auto_266634 ) ) ( not ( = ?auto_266628 ?auto_266635 ) ) ( not ( = ?auto_266628 ?auto_266636 ) ) ( not ( = ?auto_266629 ?auto_266630 ) ) ( not ( = ?auto_266629 ?auto_266631 ) ) ( not ( = ?auto_266629 ?auto_266632 ) ) ( not ( = ?auto_266629 ?auto_266633 ) ) ( not ( = ?auto_266629 ?auto_266634 ) ) ( not ( = ?auto_266629 ?auto_266635 ) ) ( not ( = ?auto_266629 ?auto_266636 ) ) ( not ( = ?auto_266630 ?auto_266631 ) ) ( not ( = ?auto_266630 ?auto_266632 ) ) ( not ( = ?auto_266630 ?auto_266633 ) ) ( not ( = ?auto_266630 ?auto_266634 ) ) ( not ( = ?auto_266630 ?auto_266635 ) ) ( not ( = ?auto_266630 ?auto_266636 ) ) ( not ( = ?auto_266631 ?auto_266632 ) ) ( not ( = ?auto_266631 ?auto_266633 ) ) ( not ( = ?auto_266631 ?auto_266634 ) ) ( not ( = ?auto_266631 ?auto_266635 ) ) ( not ( = ?auto_266631 ?auto_266636 ) ) ( not ( = ?auto_266632 ?auto_266633 ) ) ( not ( = ?auto_266632 ?auto_266634 ) ) ( not ( = ?auto_266632 ?auto_266635 ) ) ( not ( = ?auto_266632 ?auto_266636 ) ) ( not ( = ?auto_266633 ?auto_266634 ) ) ( not ( = ?auto_266633 ?auto_266635 ) ) ( not ( = ?auto_266633 ?auto_266636 ) ) ( not ( = ?auto_266634 ?auto_266635 ) ) ( not ( = ?auto_266634 ?auto_266636 ) ) ( not ( = ?auto_266635 ?auto_266636 ) ) ( ON ?auto_266634 ?auto_266635 ) ( ON ?auto_266633 ?auto_266634 ) ( ON ?auto_266632 ?auto_266633 ) ( ON ?auto_266631 ?auto_266632 ) ( ON ?auto_266630 ?auto_266631 ) ( ON ?auto_266629 ?auto_266630 ) ( ON ?auto_266628 ?auto_266629 ) ( ON ?auto_266627 ?auto_266628 ) ( ON ?auto_266626 ?auto_266627 ) ( ON ?auto_266625 ?auto_266626 ) ( CLEAR ?auto_266625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_266625 )
      ( MAKE-11PILE ?auto_266625 ?auto_266626 ?auto_266627 ?auto_266628 ?auto_266629 ?auto_266630 ?auto_266631 ?auto_266632 ?auto_266633 ?auto_266634 ?auto_266635 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_266648 - BLOCK
      ?auto_266649 - BLOCK
      ?auto_266650 - BLOCK
      ?auto_266651 - BLOCK
      ?auto_266652 - BLOCK
      ?auto_266653 - BLOCK
      ?auto_266654 - BLOCK
      ?auto_266655 - BLOCK
      ?auto_266656 - BLOCK
      ?auto_266657 - BLOCK
      ?auto_266658 - BLOCK
    )
    :vars
    (
      ?auto_266659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266658 ?auto_266659 ) ( not ( = ?auto_266648 ?auto_266649 ) ) ( not ( = ?auto_266648 ?auto_266650 ) ) ( not ( = ?auto_266648 ?auto_266651 ) ) ( not ( = ?auto_266648 ?auto_266652 ) ) ( not ( = ?auto_266648 ?auto_266653 ) ) ( not ( = ?auto_266648 ?auto_266654 ) ) ( not ( = ?auto_266648 ?auto_266655 ) ) ( not ( = ?auto_266648 ?auto_266656 ) ) ( not ( = ?auto_266648 ?auto_266657 ) ) ( not ( = ?auto_266648 ?auto_266658 ) ) ( not ( = ?auto_266648 ?auto_266659 ) ) ( not ( = ?auto_266649 ?auto_266650 ) ) ( not ( = ?auto_266649 ?auto_266651 ) ) ( not ( = ?auto_266649 ?auto_266652 ) ) ( not ( = ?auto_266649 ?auto_266653 ) ) ( not ( = ?auto_266649 ?auto_266654 ) ) ( not ( = ?auto_266649 ?auto_266655 ) ) ( not ( = ?auto_266649 ?auto_266656 ) ) ( not ( = ?auto_266649 ?auto_266657 ) ) ( not ( = ?auto_266649 ?auto_266658 ) ) ( not ( = ?auto_266649 ?auto_266659 ) ) ( not ( = ?auto_266650 ?auto_266651 ) ) ( not ( = ?auto_266650 ?auto_266652 ) ) ( not ( = ?auto_266650 ?auto_266653 ) ) ( not ( = ?auto_266650 ?auto_266654 ) ) ( not ( = ?auto_266650 ?auto_266655 ) ) ( not ( = ?auto_266650 ?auto_266656 ) ) ( not ( = ?auto_266650 ?auto_266657 ) ) ( not ( = ?auto_266650 ?auto_266658 ) ) ( not ( = ?auto_266650 ?auto_266659 ) ) ( not ( = ?auto_266651 ?auto_266652 ) ) ( not ( = ?auto_266651 ?auto_266653 ) ) ( not ( = ?auto_266651 ?auto_266654 ) ) ( not ( = ?auto_266651 ?auto_266655 ) ) ( not ( = ?auto_266651 ?auto_266656 ) ) ( not ( = ?auto_266651 ?auto_266657 ) ) ( not ( = ?auto_266651 ?auto_266658 ) ) ( not ( = ?auto_266651 ?auto_266659 ) ) ( not ( = ?auto_266652 ?auto_266653 ) ) ( not ( = ?auto_266652 ?auto_266654 ) ) ( not ( = ?auto_266652 ?auto_266655 ) ) ( not ( = ?auto_266652 ?auto_266656 ) ) ( not ( = ?auto_266652 ?auto_266657 ) ) ( not ( = ?auto_266652 ?auto_266658 ) ) ( not ( = ?auto_266652 ?auto_266659 ) ) ( not ( = ?auto_266653 ?auto_266654 ) ) ( not ( = ?auto_266653 ?auto_266655 ) ) ( not ( = ?auto_266653 ?auto_266656 ) ) ( not ( = ?auto_266653 ?auto_266657 ) ) ( not ( = ?auto_266653 ?auto_266658 ) ) ( not ( = ?auto_266653 ?auto_266659 ) ) ( not ( = ?auto_266654 ?auto_266655 ) ) ( not ( = ?auto_266654 ?auto_266656 ) ) ( not ( = ?auto_266654 ?auto_266657 ) ) ( not ( = ?auto_266654 ?auto_266658 ) ) ( not ( = ?auto_266654 ?auto_266659 ) ) ( not ( = ?auto_266655 ?auto_266656 ) ) ( not ( = ?auto_266655 ?auto_266657 ) ) ( not ( = ?auto_266655 ?auto_266658 ) ) ( not ( = ?auto_266655 ?auto_266659 ) ) ( not ( = ?auto_266656 ?auto_266657 ) ) ( not ( = ?auto_266656 ?auto_266658 ) ) ( not ( = ?auto_266656 ?auto_266659 ) ) ( not ( = ?auto_266657 ?auto_266658 ) ) ( not ( = ?auto_266657 ?auto_266659 ) ) ( not ( = ?auto_266658 ?auto_266659 ) ) ( ON ?auto_266657 ?auto_266658 ) ( ON ?auto_266656 ?auto_266657 ) ( ON ?auto_266655 ?auto_266656 ) ( ON ?auto_266654 ?auto_266655 ) ( ON ?auto_266653 ?auto_266654 ) ( ON ?auto_266652 ?auto_266653 ) ( ON ?auto_266651 ?auto_266652 ) ( ON ?auto_266650 ?auto_266651 ) ( ON ?auto_266649 ?auto_266650 ) ( ON ?auto_266648 ?auto_266649 ) ( CLEAR ?auto_266648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_266648 )
      ( MAKE-11PILE ?auto_266648 ?auto_266649 ?auto_266650 ?auto_266651 ?auto_266652 ?auto_266653 ?auto_266654 ?auto_266655 ?auto_266656 ?auto_266657 ?auto_266658 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266672 - BLOCK
      ?auto_266673 - BLOCK
      ?auto_266674 - BLOCK
      ?auto_266675 - BLOCK
      ?auto_266676 - BLOCK
      ?auto_266677 - BLOCK
      ?auto_266678 - BLOCK
      ?auto_266679 - BLOCK
      ?auto_266680 - BLOCK
      ?auto_266681 - BLOCK
      ?auto_266682 - BLOCK
      ?auto_266683 - BLOCK
    )
    :vars
    (
      ?auto_266684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_266682 ) ( ON ?auto_266683 ?auto_266684 ) ( CLEAR ?auto_266683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_266672 ) ( ON ?auto_266673 ?auto_266672 ) ( ON ?auto_266674 ?auto_266673 ) ( ON ?auto_266675 ?auto_266674 ) ( ON ?auto_266676 ?auto_266675 ) ( ON ?auto_266677 ?auto_266676 ) ( ON ?auto_266678 ?auto_266677 ) ( ON ?auto_266679 ?auto_266678 ) ( ON ?auto_266680 ?auto_266679 ) ( ON ?auto_266681 ?auto_266680 ) ( ON ?auto_266682 ?auto_266681 ) ( not ( = ?auto_266672 ?auto_266673 ) ) ( not ( = ?auto_266672 ?auto_266674 ) ) ( not ( = ?auto_266672 ?auto_266675 ) ) ( not ( = ?auto_266672 ?auto_266676 ) ) ( not ( = ?auto_266672 ?auto_266677 ) ) ( not ( = ?auto_266672 ?auto_266678 ) ) ( not ( = ?auto_266672 ?auto_266679 ) ) ( not ( = ?auto_266672 ?auto_266680 ) ) ( not ( = ?auto_266672 ?auto_266681 ) ) ( not ( = ?auto_266672 ?auto_266682 ) ) ( not ( = ?auto_266672 ?auto_266683 ) ) ( not ( = ?auto_266672 ?auto_266684 ) ) ( not ( = ?auto_266673 ?auto_266674 ) ) ( not ( = ?auto_266673 ?auto_266675 ) ) ( not ( = ?auto_266673 ?auto_266676 ) ) ( not ( = ?auto_266673 ?auto_266677 ) ) ( not ( = ?auto_266673 ?auto_266678 ) ) ( not ( = ?auto_266673 ?auto_266679 ) ) ( not ( = ?auto_266673 ?auto_266680 ) ) ( not ( = ?auto_266673 ?auto_266681 ) ) ( not ( = ?auto_266673 ?auto_266682 ) ) ( not ( = ?auto_266673 ?auto_266683 ) ) ( not ( = ?auto_266673 ?auto_266684 ) ) ( not ( = ?auto_266674 ?auto_266675 ) ) ( not ( = ?auto_266674 ?auto_266676 ) ) ( not ( = ?auto_266674 ?auto_266677 ) ) ( not ( = ?auto_266674 ?auto_266678 ) ) ( not ( = ?auto_266674 ?auto_266679 ) ) ( not ( = ?auto_266674 ?auto_266680 ) ) ( not ( = ?auto_266674 ?auto_266681 ) ) ( not ( = ?auto_266674 ?auto_266682 ) ) ( not ( = ?auto_266674 ?auto_266683 ) ) ( not ( = ?auto_266674 ?auto_266684 ) ) ( not ( = ?auto_266675 ?auto_266676 ) ) ( not ( = ?auto_266675 ?auto_266677 ) ) ( not ( = ?auto_266675 ?auto_266678 ) ) ( not ( = ?auto_266675 ?auto_266679 ) ) ( not ( = ?auto_266675 ?auto_266680 ) ) ( not ( = ?auto_266675 ?auto_266681 ) ) ( not ( = ?auto_266675 ?auto_266682 ) ) ( not ( = ?auto_266675 ?auto_266683 ) ) ( not ( = ?auto_266675 ?auto_266684 ) ) ( not ( = ?auto_266676 ?auto_266677 ) ) ( not ( = ?auto_266676 ?auto_266678 ) ) ( not ( = ?auto_266676 ?auto_266679 ) ) ( not ( = ?auto_266676 ?auto_266680 ) ) ( not ( = ?auto_266676 ?auto_266681 ) ) ( not ( = ?auto_266676 ?auto_266682 ) ) ( not ( = ?auto_266676 ?auto_266683 ) ) ( not ( = ?auto_266676 ?auto_266684 ) ) ( not ( = ?auto_266677 ?auto_266678 ) ) ( not ( = ?auto_266677 ?auto_266679 ) ) ( not ( = ?auto_266677 ?auto_266680 ) ) ( not ( = ?auto_266677 ?auto_266681 ) ) ( not ( = ?auto_266677 ?auto_266682 ) ) ( not ( = ?auto_266677 ?auto_266683 ) ) ( not ( = ?auto_266677 ?auto_266684 ) ) ( not ( = ?auto_266678 ?auto_266679 ) ) ( not ( = ?auto_266678 ?auto_266680 ) ) ( not ( = ?auto_266678 ?auto_266681 ) ) ( not ( = ?auto_266678 ?auto_266682 ) ) ( not ( = ?auto_266678 ?auto_266683 ) ) ( not ( = ?auto_266678 ?auto_266684 ) ) ( not ( = ?auto_266679 ?auto_266680 ) ) ( not ( = ?auto_266679 ?auto_266681 ) ) ( not ( = ?auto_266679 ?auto_266682 ) ) ( not ( = ?auto_266679 ?auto_266683 ) ) ( not ( = ?auto_266679 ?auto_266684 ) ) ( not ( = ?auto_266680 ?auto_266681 ) ) ( not ( = ?auto_266680 ?auto_266682 ) ) ( not ( = ?auto_266680 ?auto_266683 ) ) ( not ( = ?auto_266680 ?auto_266684 ) ) ( not ( = ?auto_266681 ?auto_266682 ) ) ( not ( = ?auto_266681 ?auto_266683 ) ) ( not ( = ?auto_266681 ?auto_266684 ) ) ( not ( = ?auto_266682 ?auto_266683 ) ) ( not ( = ?auto_266682 ?auto_266684 ) ) ( not ( = ?auto_266683 ?auto_266684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_266683 ?auto_266684 )
      ( !STACK ?auto_266683 ?auto_266682 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266697 - BLOCK
      ?auto_266698 - BLOCK
      ?auto_266699 - BLOCK
      ?auto_266700 - BLOCK
      ?auto_266701 - BLOCK
      ?auto_266702 - BLOCK
      ?auto_266703 - BLOCK
      ?auto_266704 - BLOCK
      ?auto_266705 - BLOCK
      ?auto_266706 - BLOCK
      ?auto_266707 - BLOCK
      ?auto_266708 - BLOCK
    )
    :vars
    (
      ?auto_266709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_266707 ) ( ON ?auto_266708 ?auto_266709 ) ( CLEAR ?auto_266708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_266697 ) ( ON ?auto_266698 ?auto_266697 ) ( ON ?auto_266699 ?auto_266698 ) ( ON ?auto_266700 ?auto_266699 ) ( ON ?auto_266701 ?auto_266700 ) ( ON ?auto_266702 ?auto_266701 ) ( ON ?auto_266703 ?auto_266702 ) ( ON ?auto_266704 ?auto_266703 ) ( ON ?auto_266705 ?auto_266704 ) ( ON ?auto_266706 ?auto_266705 ) ( ON ?auto_266707 ?auto_266706 ) ( not ( = ?auto_266697 ?auto_266698 ) ) ( not ( = ?auto_266697 ?auto_266699 ) ) ( not ( = ?auto_266697 ?auto_266700 ) ) ( not ( = ?auto_266697 ?auto_266701 ) ) ( not ( = ?auto_266697 ?auto_266702 ) ) ( not ( = ?auto_266697 ?auto_266703 ) ) ( not ( = ?auto_266697 ?auto_266704 ) ) ( not ( = ?auto_266697 ?auto_266705 ) ) ( not ( = ?auto_266697 ?auto_266706 ) ) ( not ( = ?auto_266697 ?auto_266707 ) ) ( not ( = ?auto_266697 ?auto_266708 ) ) ( not ( = ?auto_266697 ?auto_266709 ) ) ( not ( = ?auto_266698 ?auto_266699 ) ) ( not ( = ?auto_266698 ?auto_266700 ) ) ( not ( = ?auto_266698 ?auto_266701 ) ) ( not ( = ?auto_266698 ?auto_266702 ) ) ( not ( = ?auto_266698 ?auto_266703 ) ) ( not ( = ?auto_266698 ?auto_266704 ) ) ( not ( = ?auto_266698 ?auto_266705 ) ) ( not ( = ?auto_266698 ?auto_266706 ) ) ( not ( = ?auto_266698 ?auto_266707 ) ) ( not ( = ?auto_266698 ?auto_266708 ) ) ( not ( = ?auto_266698 ?auto_266709 ) ) ( not ( = ?auto_266699 ?auto_266700 ) ) ( not ( = ?auto_266699 ?auto_266701 ) ) ( not ( = ?auto_266699 ?auto_266702 ) ) ( not ( = ?auto_266699 ?auto_266703 ) ) ( not ( = ?auto_266699 ?auto_266704 ) ) ( not ( = ?auto_266699 ?auto_266705 ) ) ( not ( = ?auto_266699 ?auto_266706 ) ) ( not ( = ?auto_266699 ?auto_266707 ) ) ( not ( = ?auto_266699 ?auto_266708 ) ) ( not ( = ?auto_266699 ?auto_266709 ) ) ( not ( = ?auto_266700 ?auto_266701 ) ) ( not ( = ?auto_266700 ?auto_266702 ) ) ( not ( = ?auto_266700 ?auto_266703 ) ) ( not ( = ?auto_266700 ?auto_266704 ) ) ( not ( = ?auto_266700 ?auto_266705 ) ) ( not ( = ?auto_266700 ?auto_266706 ) ) ( not ( = ?auto_266700 ?auto_266707 ) ) ( not ( = ?auto_266700 ?auto_266708 ) ) ( not ( = ?auto_266700 ?auto_266709 ) ) ( not ( = ?auto_266701 ?auto_266702 ) ) ( not ( = ?auto_266701 ?auto_266703 ) ) ( not ( = ?auto_266701 ?auto_266704 ) ) ( not ( = ?auto_266701 ?auto_266705 ) ) ( not ( = ?auto_266701 ?auto_266706 ) ) ( not ( = ?auto_266701 ?auto_266707 ) ) ( not ( = ?auto_266701 ?auto_266708 ) ) ( not ( = ?auto_266701 ?auto_266709 ) ) ( not ( = ?auto_266702 ?auto_266703 ) ) ( not ( = ?auto_266702 ?auto_266704 ) ) ( not ( = ?auto_266702 ?auto_266705 ) ) ( not ( = ?auto_266702 ?auto_266706 ) ) ( not ( = ?auto_266702 ?auto_266707 ) ) ( not ( = ?auto_266702 ?auto_266708 ) ) ( not ( = ?auto_266702 ?auto_266709 ) ) ( not ( = ?auto_266703 ?auto_266704 ) ) ( not ( = ?auto_266703 ?auto_266705 ) ) ( not ( = ?auto_266703 ?auto_266706 ) ) ( not ( = ?auto_266703 ?auto_266707 ) ) ( not ( = ?auto_266703 ?auto_266708 ) ) ( not ( = ?auto_266703 ?auto_266709 ) ) ( not ( = ?auto_266704 ?auto_266705 ) ) ( not ( = ?auto_266704 ?auto_266706 ) ) ( not ( = ?auto_266704 ?auto_266707 ) ) ( not ( = ?auto_266704 ?auto_266708 ) ) ( not ( = ?auto_266704 ?auto_266709 ) ) ( not ( = ?auto_266705 ?auto_266706 ) ) ( not ( = ?auto_266705 ?auto_266707 ) ) ( not ( = ?auto_266705 ?auto_266708 ) ) ( not ( = ?auto_266705 ?auto_266709 ) ) ( not ( = ?auto_266706 ?auto_266707 ) ) ( not ( = ?auto_266706 ?auto_266708 ) ) ( not ( = ?auto_266706 ?auto_266709 ) ) ( not ( = ?auto_266707 ?auto_266708 ) ) ( not ( = ?auto_266707 ?auto_266709 ) ) ( not ( = ?auto_266708 ?auto_266709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_266708 ?auto_266709 )
      ( !STACK ?auto_266708 ?auto_266707 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266722 - BLOCK
      ?auto_266723 - BLOCK
      ?auto_266724 - BLOCK
      ?auto_266725 - BLOCK
      ?auto_266726 - BLOCK
      ?auto_266727 - BLOCK
      ?auto_266728 - BLOCK
      ?auto_266729 - BLOCK
      ?auto_266730 - BLOCK
      ?auto_266731 - BLOCK
      ?auto_266732 - BLOCK
      ?auto_266733 - BLOCK
    )
    :vars
    (
      ?auto_266734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266733 ?auto_266734 ) ( ON-TABLE ?auto_266722 ) ( ON ?auto_266723 ?auto_266722 ) ( ON ?auto_266724 ?auto_266723 ) ( ON ?auto_266725 ?auto_266724 ) ( ON ?auto_266726 ?auto_266725 ) ( ON ?auto_266727 ?auto_266726 ) ( ON ?auto_266728 ?auto_266727 ) ( ON ?auto_266729 ?auto_266728 ) ( ON ?auto_266730 ?auto_266729 ) ( ON ?auto_266731 ?auto_266730 ) ( not ( = ?auto_266722 ?auto_266723 ) ) ( not ( = ?auto_266722 ?auto_266724 ) ) ( not ( = ?auto_266722 ?auto_266725 ) ) ( not ( = ?auto_266722 ?auto_266726 ) ) ( not ( = ?auto_266722 ?auto_266727 ) ) ( not ( = ?auto_266722 ?auto_266728 ) ) ( not ( = ?auto_266722 ?auto_266729 ) ) ( not ( = ?auto_266722 ?auto_266730 ) ) ( not ( = ?auto_266722 ?auto_266731 ) ) ( not ( = ?auto_266722 ?auto_266732 ) ) ( not ( = ?auto_266722 ?auto_266733 ) ) ( not ( = ?auto_266722 ?auto_266734 ) ) ( not ( = ?auto_266723 ?auto_266724 ) ) ( not ( = ?auto_266723 ?auto_266725 ) ) ( not ( = ?auto_266723 ?auto_266726 ) ) ( not ( = ?auto_266723 ?auto_266727 ) ) ( not ( = ?auto_266723 ?auto_266728 ) ) ( not ( = ?auto_266723 ?auto_266729 ) ) ( not ( = ?auto_266723 ?auto_266730 ) ) ( not ( = ?auto_266723 ?auto_266731 ) ) ( not ( = ?auto_266723 ?auto_266732 ) ) ( not ( = ?auto_266723 ?auto_266733 ) ) ( not ( = ?auto_266723 ?auto_266734 ) ) ( not ( = ?auto_266724 ?auto_266725 ) ) ( not ( = ?auto_266724 ?auto_266726 ) ) ( not ( = ?auto_266724 ?auto_266727 ) ) ( not ( = ?auto_266724 ?auto_266728 ) ) ( not ( = ?auto_266724 ?auto_266729 ) ) ( not ( = ?auto_266724 ?auto_266730 ) ) ( not ( = ?auto_266724 ?auto_266731 ) ) ( not ( = ?auto_266724 ?auto_266732 ) ) ( not ( = ?auto_266724 ?auto_266733 ) ) ( not ( = ?auto_266724 ?auto_266734 ) ) ( not ( = ?auto_266725 ?auto_266726 ) ) ( not ( = ?auto_266725 ?auto_266727 ) ) ( not ( = ?auto_266725 ?auto_266728 ) ) ( not ( = ?auto_266725 ?auto_266729 ) ) ( not ( = ?auto_266725 ?auto_266730 ) ) ( not ( = ?auto_266725 ?auto_266731 ) ) ( not ( = ?auto_266725 ?auto_266732 ) ) ( not ( = ?auto_266725 ?auto_266733 ) ) ( not ( = ?auto_266725 ?auto_266734 ) ) ( not ( = ?auto_266726 ?auto_266727 ) ) ( not ( = ?auto_266726 ?auto_266728 ) ) ( not ( = ?auto_266726 ?auto_266729 ) ) ( not ( = ?auto_266726 ?auto_266730 ) ) ( not ( = ?auto_266726 ?auto_266731 ) ) ( not ( = ?auto_266726 ?auto_266732 ) ) ( not ( = ?auto_266726 ?auto_266733 ) ) ( not ( = ?auto_266726 ?auto_266734 ) ) ( not ( = ?auto_266727 ?auto_266728 ) ) ( not ( = ?auto_266727 ?auto_266729 ) ) ( not ( = ?auto_266727 ?auto_266730 ) ) ( not ( = ?auto_266727 ?auto_266731 ) ) ( not ( = ?auto_266727 ?auto_266732 ) ) ( not ( = ?auto_266727 ?auto_266733 ) ) ( not ( = ?auto_266727 ?auto_266734 ) ) ( not ( = ?auto_266728 ?auto_266729 ) ) ( not ( = ?auto_266728 ?auto_266730 ) ) ( not ( = ?auto_266728 ?auto_266731 ) ) ( not ( = ?auto_266728 ?auto_266732 ) ) ( not ( = ?auto_266728 ?auto_266733 ) ) ( not ( = ?auto_266728 ?auto_266734 ) ) ( not ( = ?auto_266729 ?auto_266730 ) ) ( not ( = ?auto_266729 ?auto_266731 ) ) ( not ( = ?auto_266729 ?auto_266732 ) ) ( not ( = ?auto_266729 ?auto_266733 ) ) ( not ( = ?auto_266729 ?auto_266734 ) ) ( not ( = ?auto_266730 ?auto_266731 ) ) ( not ( = ?auto_266730 ?auto_266732 ) ) ( not ( = ?auto_266730 ?auto_266733 ) ) ( not ( = ?auto_266730 ?auto_266734 ) ) ( not ( = ?auto_266731 ?auto_266732 ) ) ( not ( = ?auto_266731 ?auto_266733 ) ) ( not ( = ?auto_266731 ?auto_266734 ) ) ( not ( = ?auto_266732 ?auto_266733 ) ) ( not ( = ?auto_266732 ?auto_266734 ) ) ( not ( = ?auto_266733 ?auto_266734 ) ) ( CLEAR ?auto_266731 ) ( ON ?auto_266732 ?auto_266733 ) ( CLEAR ?auto_266732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_266722 ?auto_266723 ?auto_266724 ?auto_266725 ?auto_266726 ?auto_266727 ?auto_266728 ?auto_266729 ?auto_266730 ?auto_266731 ?auto_266732 )
      ( MAKE-12PILE ?auto_266722 ?auto_266723 ?auto_266724 ?auto_266725 ?auto_266726 ?auto_266727 ?auto_266728 ?auto_266729 ?auto_266730 ?auto_266731 ?auto_266732 ?auto_266733 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266747 - BLOCK
      ?auto_266748 - BLOCK
      ?auto_266749 - BLOCK
      ?auto_266750 - BLOCK
      ?auto_266751 - BLOCK
      ?auto_266752 - BLOCK
      ?auto_266753 - BLOCK
      ?auto_266754 - BLOCK
      ?auto_266755 - BLOCK
      ?auto_266756 - BLOCK
      ?auto_266757 - BLOCK
      ?auto_266758 - BLOCK
    )
    :vars
    (
      ?auto_266759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266758 ?auto_266759 ) ( ON-TABLE ?auto_266747 ) ( ON ?auto_266748 ?auto_266747 ) ( ON ?auto_266749 ?auto_266748 ) ( ON ?auto_266750 ?auto_266749 ) ( ON ?auto_266751 ?auto_266750 ) ( ON ?auto_266752 ?auto_266751 ) ( ON ?auto_266753 ?auto_266752 ) ( ON ?auto_266754 ?auto_266753 ) ( ON ?auto_266755 ?auto_266754 ) ( ON ?auto_266756 ?auto_266755 ) ( not ( = ?auto_266747 ?auto_266748 ) ) ( not ( = ?auto_266747 ?auto_266749 ) ) ( not ( = ?auto_266747 ?auto_266750 ) ) ( not ( = ?auto_266747 ?auto_266751 ) ) ( not ( = ?auto_266747 ?auto_266752 ) ) ( not ( = ?auto_266747 ?auto_266753 ) ) ( not ( = ?auto_266747 ?auto_266754 ) ) ( not ( = ?auto_266747 ?auto_266755 ) ) ( not ( = ?auto_266747 ?auto_266756 ) ) ( not ( = ?auto_266747 ?auto_266757 ) ) ( not ( = ?auto_266747 ?auto_266758 ) ) ( not ( = ?auto_266747 ?auto_266759 ) ) ( not ( = ?auto_266748 ?auto_266749 ) ) ( not ( = ?auto_266748 ?auto_266750 ) ) ( not ( = ?auto_266748 ?auto_266751 ) ) ( not ( = ?auto_266748 ?auto_266752 ) ) ( not ( = ?auto_266748 ?auto_266753 ) ) ( not ( = ?auto_266748 ?auto_266754 ) ) ( not ( = ?auto_266748 ?auto_266755 ) ) ( not ( = ?auto_266748 ?auto_266756 ) ) ( not ( = ?auto_266748 ?auto_266757 ) ) ( not ( = ?auto_266748 ?auto_266758 ) ) ( not ( = ?auto_266748 ?auto_266759 ) ) ( not ( = ?auto_266749 ?auto_266750 ) ) ( not ( = ?auto_266749 ?auto_266751 ) ) ( not ( = ?auto_266749 ?auto_266752 ) ) ( not ( = ?auto_266749 ?auto_266753 ) ) ( not ( = ?auto_266749 ?auto_266754 ) ) ( not ( = ?auto_266749 ?auto_266755 ) ) ( not ( = ?auto_266749 ?auto_266756 ) ) ( not ( = ?auto_266749 ?auto_266757 ) ) ( not ( = ?auto_266749 ?auto_266758 ) ) ( not ( = ?auto_266749 ?auto_266759 ) ) ( not ( = ?auto_266750 ?auto_266751 ) ) ( not ( = ?auto_266750 ?auto_266752 ) ) ( not ( = ?auto_266750 ?auto_266753 ) ) ( not ( = ?auto_266750 ?auto_266754 ) ) ( not ( = ?auto_266750 ?auto_266755 ) ) ( not ( = ?auto_266750 ?auto_266756 ) ) ( not ( = ?auto_266750 ?auto_266757 ) ) ( not ( = ?auto_266750 ?auto_266758 ) ) ( not ( = ?auto_266750 ?auto_266759 ) ) ( not ( = ?auto_266751 ?auto_266752 ) ) ( not ( = ?auto_266751 ?auto_266753 ) ) ( not ( = ?auto_266751 ?auto_266754 ) ) ( not ( = ?auto_266751 ?auto_266755 ) ) ( not ( = ?auto_266751 ?auto_266756 ) ) ( not ( = ?auto_266751 ?auto_266757 ) ) ( not ( = ?auto_266751 ?auto_266758 ) ) ( not ( = ?auto_266751 ?auto_266759 ) ) ( not ( = ?auto_266752 ?auto_266753 ) ) ( not ( = ?auto_266752 ?auto_266754 ) ) ( not ( = ?auto_266752 ?auto_266755 ) ) ( not ( = ?auto_266752 ?auto_266756 ) ) ( not ( = ?auto_266752 ?auto_266757 ) ) ( not ( = ?auto_266752 ?auto_266758 ) ) ( not ( = ?auto_266752 ?auto_266759 ) ) ( not ( = ?auto_266753 ?auto_266754 ) ) ( not ( = ?auto_266753 ?auto_266755 ) ) ( not ( = ?auto_266753 ?auto_266756 ) ) ( not ( = ?auto_266753 ?auto_266757 ) ) ( not ( = ?auto_266753 ?auto_266758 ) ) ( not ( = ?auto_266753 ?auto_266759 ) ) ( not ( = ?auto_266754 ?auto_266755 ) ) ( not ( = ?auto_266754 ?auto_266756 ) ) ( not ( = ?auto_266754 ?auto_266757 ) ) ( not ( = ?auto_266754 ?auto_266758 ) ) ( not ( = ?auto_266754 ?auto_266759 ) ) ( not ( = ?auto_266755 ?auto_266756 ) ) ( not ( = ?auto_266755 ?auto_266757 ) ) ( not ( = ?auto_266755 ?auto_266758 ) ) ( not ( = ?auto_266755 ?auto_266759 ) ) ( not ( = ?auto_266756 ?auto_266757 ) ) ( not ( = ?auto_266756 ?auto_266758 ) ) ( not ( = ?auto_266756 ?auto_266759 ) ) ( not ( = ?auto_266757 ?auto_266758 ) ) ( not ( = ?auto_266757 ?auto_266759 ) ) ( not ( = ?auto_266758 ?auto_266759 ) ) ( CLEAR ?auto_266756 ) ( ON ?auto_266757 ?auto_266758 ) ( CLEAR ?auto_266757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_266747 ?auto_266748 ?auto_266749 ?auto_266750 ?auto_266751 ?auto_266752 ?auto_266753 ?auto_266754 ?auto_266755 ?auto_266756 ?auto_266757 )
      ( MAKE-12PILE ?auto_266747 ?auto_266748 ?auto_266749 ?auto_266750 ?auto_266751 ?auto_266752 ?auto_266753 ?auto_266754 ?auto_266755 ?auto_266756 ?auto_266757 ?auto_266758 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266772 - BLOCK
      ?auto_266773 - BLOCK
      ?auto_266774 - BLOCK
      ?auto_266775 - BLOCK
      ?auto_266776 - BLOCK
      ?auto_266777 - BLOCK
      ?auto_266778 - BLOCK
      ?auto_266779 - BLOCK
      ?auto_266780 - BLOCK
      ?auto_266781 - BLOCK
      ?auto_266782 - BLOCK
      ?auto_266783 - BLOCK
    )
    :vars
    (
      ?auto_266784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266783 ?auto_266784 ) ( ON-TABLE ?auto_266772 ) ( ON ?auto_266773 ?auto_266772 ) ( ON ?auto_266774 ?auto_266773 ) ( ON ?auto_266775 ?auto_266774 ) ( ON ?auto_266776 ?auto_266775 ) ( ON ?auto_266777 ?auto_266776 ) ( ON ?auto_266778 ?auto_266777 ) ( ON ?auto_266779 ?auto_266778 ) ( ON ?auto_266780 ?auto_266779 ) ( not ( = ?auto_266772 ?auto_266773 ) ) ( not ( = ?auto_266772 ?auto_266774 ) ) ( not ( = ?auto_266772 ?auto_266775 ) ) ( not ( = ?auto_266772 ?auto_266776 ) ) ( not ( = ?auto_266772 ?auto_266777 ) ) ( not ( = ?auto_266772 ?auto_266778 ) ) ( not ( = ?auto_266772 ?auto_266779 ) ) ( not ( = ?auto_266772 ?auto_266780 ) ) ( not ( = ?auto_266772 ?auto_266781 ) ) ( not ( = ?auto_266772 ?auto_266782 ) ) ( not ( = ?auto_266772 ?auto_266783 ) ) ( not ( = ?auto_266772 ?auto_266784 ) ) ( not ( = ?auto_266773 ?auto_266774 ) ) ( not ( = ?auto_266773 ?auto_266775 ) ) ( not ( = ?auto_266773 ?auto_266776 ) ) ( not ( = ?auto_266773 ?auto_266777 ) ) ( not ( = ?auto_266773 ?auto_266778 ) ) ( not ( = ?auto_266773 ?auto_266779 ) ) ( not ( = ?auto_266773 ?auto_266780 ) ) ( not ( = ?auto_266773 ?auto_266781 ) ) ( not ( = ?auto_266773 ?auto_266782 ) ) ( not ( = ?auto_266773 ?auto_266783 ) ) ( not ( = ?auto_266773 ?auto_266784 ) ) ( not ( = ?auto_266774 ?auto_266775 ) ) ( not ( = ?auto_266774 ?auto_266776 ) ) ( not ( = ?auto_266774 ?auto_266777 ) ) ( not ( = ?auto_266774 ?auto_266778 ) ) ( not ( = ?auto_266774 ?auto_266779 ) ) ( not ( = ?auto_266774 ?auto_266780 ) ) ( not ( = ?auto_266774 ?auto_266781 ) ) ( not ( = ?auto_266774 ?auto_266782 ) ) ( not ( = ?auto_266774 ?auto_266783 ) ) ( not ( = ?auto_266774 ?auto_266784 ) ) ( not ( = ?auto_266775 ?auto_266776 ) ) ( not ( = ?auto_266775 ?auto_266777 ) ) ( not ( = ?auto_266775 ?auto_266778 ) ) ( not ( = ?auto_266775 ?auto_266779 ) ) ( not ( = ?auto_266775 ?auto_266780 ) ) ( not ( = ?auto_266775 ?auto_266781 ) ) ( not ( = ?auto_266775 ?auto_266782 ) ) ( not ( = ?auto_266775 ?auto_266783 ) ) ( not ( = ?auto_266775 ?auto_266784 ) ) ( not ( = ?auto_266776 ?auto_266777 ) ) ( not ( = ?auto_266776 ?auto_266778 ) ) ( not ( = ?auto_266776 ?auto_266779 ) ) ( not ( = ?auto_266776 ?auto_266780 ) ) ( not ( = ?auto_266776 ?auto_266781 ) ) ( not ( = ?auto_266776 ?auto_266782 ) ) ( not ( = ?auto_266776 ?auto_266783 ) ) ( not ( = ?auto_266776 ?auto_266784 ) ) ( not ( = ?auto_266777 ?auto_266778 ) ) ( not ( = ?auto_266777 ?auto_266779 ) ) ( not ( = ?auto_266777 ?auto_266780 ) ) ( not ( = ?auto_266777 ?auto_266781 ) ) ( not ( = ?auto_266777 ?auto_266782 ) ) ( not ( = ?auto_266777 ?auto_266783 ) ) ( not ( = ?auto_266777 ?auto_266784 ) ) ( not ( = ?auto_266778 ?auto_266779 ) ) ( not ( = ?auto_266778 ?auto_266780 ) ) ( not ( = ?auto_266778 ?auto_266781 ) ) ( not ( = ?auto_266778 ?auto_266782 ) ) ( not ( = ?auto_266778 ?auto_266783 ) ) ( not ( = ?auto_266778 ?auto_266784 ) ) ( not ( = ?auto_266779 ?auto_266780 ) ) ( not ( = ?auto_266779 ?auto_266781 ) ) ( not ( = ?auto_266779 ?auto_266782 ) ) ( not ( = ?auto_266779 ?auto_266783 ) ) ( not ( = ?auto_266779 ?auto_266784 ) ) ( not ( = ?auto_266780 ?auto_266781 ) ) ( not ( = ?auto_266780 ?auto_266782 ) ) ( not ( = ?auto_266780 ?auto_266783 ) ) ( not ( = ?auto_266780 ?auto_266784 ) ) ( not ( = ?auto_266781 ?auto_266782 ) ) ( not ( = ?auto_266781 ?auto_266783 ) ) ( not ( = ?auto_266781 ?auto_266784 ) ) ( not ( = ?auto_266782 ?auto_266783 ) ) ( not ( = ?auto_266782 ?auto_266784 ) ) ( not ( = ?auto_266783 ?auto_266784 ) ) ( ON ?auto_266782 ?auto_266783 ) ( CLEAR ?auto_266780 ) ( ON ?auto_266781 ?auto_266782 ) ( CLEAR ?auto_266781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_266772 ?auto_266773 ?auto_266774 ?auto_266775 ?auto_266776 ?auto_266777 ?auto_266778 ?auto_266779 ?auto_266780 ?auto_266781 )
      ( MAKE-12PILE ?auto_266772 ?auto_266773 ?auto_266774 ?auto_266775 ?auto_266776 ?auto_266777 ?auto_266778 ?auto_266779 ?auto_266780 ?auto_266781 ?auto_266782 ?auto_266783 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266797 - BLOCK
      ?auto_266798 - BLOCK
      ?auto_266799 - BLOCK
      ?auto_266800 - BLOCK
      ?auto_266801 - BLOCK
      ?auto_266802 - BLOCK
      ?auto_266803 - BLOCK
      ?auto_266804 - BLOCK
      ?auto_266805 - BLOCK
      ?auto_266806 - BLOCK
      ?auto_266807 - BLOCK
      ?auto_266808 - BLOCK
    )
    :vars
    (
      ?auto_266809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266808 ?auto_266809 ) ( ON-TABLE ?auto_266797 ) ( ON ?auto_266798 ?auto_266797 ) ( ON ?auto_266799 ?auto_266798 ) ( ON ?auto_266800 ?auto_266799 ) ( ON ?auto_266801 ?auto_266800 ) ( ON ?auto_266802 ?auto_266801 ) ( ON ?auto_266803 ?auto_266802 ) ( ON ?auto_266804 ?auto_266803 ) ( ON ?auto_266805 ?auto_266804 ) ( not ( = ?auto_266797 ?auto_266798 ) ) ( not ( = ?auto_266797 ?auto_266799 ) ) ( not ( = ?auto_266797 ?auto_266800 ) ) ( not ( = ?auto_266797 ?auto_266801 ) ) ( not ( = ?auto_266797 ?auto_266802 ) ) ( not ( = ?auto_266797 ?auto_266803 ) ) ( not ( = ?auto_266797 ?auto_266804 ) ) ( not ( = ?auto_266797 ?auto_266805 ) ) ( not ( = ?auto_266797 ?auto_266806 ) ) ( not ( = ?auto_266797 ?auto_266807 ) ) ( not ( = ?auto_266797 ?auto_266808 ) ) ( not ( = ?auto_266797 ?auto_266809 ) ) ( not ( = ?auto_266798 ?auto_266799 ) ) ( not ( = ?auto_266798 ?auto_266800 ) ) ( not ( = ?auto_266798 ?auto_266801 ) ) ( not ( = ?auto_266798 ?auto_266802 ) ) ( not ( = ?auto_266798 ?auto_266803 ) ) ( not ( = ?auto_266798 ?auto_266804 ) ) ( not ( = ?auto_266798 ?auto_266805 ) ) ( not ( = ?auto_266798 ?auto_266806 ) ) ( not ( = ?auto_266798 ?auto_266807 ) ) ( not ( = ?auto_266798 ?auto_266808 ) ) ( not ( = ?auto_266798 ?auto_266809 ) ) ( not ( = ?auto_266799 ?auto_266800 ) ) ( not ( = ?auto_266799 ?auto_266801 ) ) ( not ( = ?auto_266799 ?auto_266802 ) ) ( not ( = ?auto_266799 ?auto_266803 ) ) ( not ( = ?auto_266799 ?auto_266804 ) ) ( not ( = ?auto_266799 ?auto_266805 ) ) ( not ( = ?auto_266799 ?auto_266806 ) ) ( not ( = ?auto_266799 ?auto_266807 ) ) ( not ( = ?auto_266799 ?auto_266808 ) ) ( not ( = ?auto_266799 ?auto_266809 ) ) ( not ( = ?auto_266800 ?auto_266801 ) ) ( not ( = ?auto_266800 ?auto_266802 ) ) ( not ( = ?auto_266800 ?auto_266803 ) ) ( not ( = ?auto_266800 ?auto_266804 ) ) ( not ( = ?auto_266800 ?auto_266805 ) ) ( not ( = ?auto_266800 ?auto_266806 ) ) ( not ( = ?auto_266800 ?auto_266807 ) ) ( not ( = ?auto_266800 ?auto_266808 ) ) ( not ( = ?auto_266800 ?auto_266809 ) ) ( not ( = ?auto_266801 ?auto_266802 ) ) ( not ( = ?auto_266801 ?auto_266803 ) ) ( not ( = ?auto_266801 ?auto_266804 ) ) ( not ( = ?auto_266801 ?auto_266805 ) ) ( not ( = ?auto_266801 ?auto_266806 ) ) ( not ( = ?auto_266801 ?auto_266807 ) ) ( not ( = ?auto_266801 ?auto_266808 ) ) ( not ( = ?auto_266801 ?auto_266809 ) ) ( not ( = ?auto_266802 ?auto_266803 ) ) ( not ( = ?auto_266802 ?auto_266804 ) ) ( not ( = ?auto_266802 ?auto_266805 ) ) ( not ( = ?auto_266802 ?auto_266806 ) ) ( not ( = ?auto_266802 ?auto_266807 ) ) ( not ( = ?auto_266802 ?auto_266808 ) ) ( not ( = ?auto_266802 ?auto_266809 ) ) ( not ( = ?auto_266803 ?auto_266804 ) ) ( not ( = ?auto_266803 ?auto_266805 ) ) ( not ( = ?auto_266803 ?auto_266806 ) ) ( not ( = ?auto_266803 ?auto_266807 ) ) ( not ( = ?auto_266803 ?auto_266808 ) ) ( not ( = ?auto_266803 ?auto_266809 ) ) ( not ( = ?auto_266804 ?auto_266805 ) ) ( not ( = ?auto_266804 ?auto_266806 ) ) ( not ( = ?auto_266804 ?auto_266807 ) ) ( not ( = ?auto_266804 ?auto_266808 ) ) ( not ( = ?auto_266804 ?auto_266809 ) ) ( not ( = ?auto_266805 ?auto_266806 ) ) ( not ( = ?auto_266805 ?auto_266807 ) ) ( not ( = ?auto_266805 ?auto_266808 ) ) ( not ( = ?auto_266805 ?auto_266809 ) ) ( not ( = ?auto_266806 ?auto_266807 ) ) ( not ( = ?auto_266806 ?auto_266808 ) ) ( not ( = ?auto_266806 ?auto_266809 ) ) ( not ( = ?auto_266807 ?auto_266808 ) ) ( not ( = ?auto_266807 ?auto_266809 ) ) ( not ( = ?auto_266808 ?auto_266809 ) ) ( ON ?auto_266807 ?auto_266808 ) ( CLEAR ?auto_266805 ) ( ON ?auto_266806 ?auto_266807 ) ( CLEAR ?auto_266806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_266797 ?auto_266798 ?auto_266799 ?auto_266800 ?auto_266801 ?auto_266802 ?auto_266803 ?auto_266804 ?auto_266805 ?auto_266806 )
      ( MAKE-12PILE ?auto_266797 ?auto_266798 ?auto_266799 ?auto_266800 ?auto_266801 ?auto_266802 ?auto_266803 ?auto_266804 ?auto_266805 ?auto_266806 ?auto_266807 ?auto_266808 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266822 - BLOCK
      ?auto_266823 - BLOCK
      ?auto_266824 - BLOCK
      ?auto_266825 - BLOCK
      ?auto_266826 - BLOCK
      ?auto_266827 - BLOCK
      ?auto_266828 - BLOCK
      ?auto_266829 - BLOCK
      ?auto_266830 - BLOCK
      ?auto_266831 - BLOCK
      ?auto_266832 - BLOCK
      ?auto_266833 - BLOCK
    )
    :vars
    (
      ?auto_266834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266833 ?auto_266834 ) ( ON-TABLE ?auto_266822 ) ( ON ?auto_266823 ?auto_266822 ) ( ON ?auto_266824 ?auto_266823 ) ( ON ?auto_266825 ?auto_266824 ) ( ON ?auto_266826 ?auto_266825 ) ( ON ?auto_266827 ?auto_266826 ) ( ON ?auto_266828 ?auto_266827 ) ( ON ?auto_266829 ?auto_266828 ) ( not ( = ?auto_266822 ?auto_266823 ) ) ( not ( = ?auto_266822 ?auto_266824 ) ) ( not ( = ?auto_266822 ?auto_266825 ) ) ( not ( = ?auto_266822 ?auto_266826 ) ) ( not ( = ?auto_266822 ?auto_266827 ) ) ( not ( = ?auto_266822 ?auto_266828 ) ) ( not ( = ?auto_266822 ?auto_266829 ) ) ( not ( = ?auto_266822 ?auto_266830 ) ) ( not ( = ?auto_266822 ?auto_266831 ) ) ( not ( = ?auto_266822 ?auto_266832 ) ) ( not ( = ?auto_266822 ?auto_266833 ) ) ( not ( = ?auto_266822 ?auto_266834 ) ) ( not ( = ?auto_266823 ?auto_266824 ) ) ( not ( = ?auto_266823 ?auto_266825 ) ) ( not ( = ?auto_266823 ?auto_266826 ) ) ( not ( = ?auto_266823 ?auto_266827 ) ) ( not ( = ?auto_266823 ?auto_266828 ) ) ( not ( = ?auto_266823 ?auto_266829 ) ) ( not ( = ?auto_266823 ?auto_266830 ) ) ( not ( = ?auto_266823 ?auto_266831 ) ) ( not ( = ?auto_266823 ?auto_266832 ) ) ( not ( = ?auto_266823 ?auto_266833 ) ) ( not ( = ?auto_266823 ?auto_266834 ) ) ( not ( = ?auto_266824 ?auto_266825 ) ) ( not ( = ?auto_266824 ?auto_266826 ) ) ( not ( = ?auto_266824 ?auto_266827 ) ) ( not ( = ?auto_266824 ?auto_266828 ) ) ( not ( = ?auto_266824 ?auto_266829 ) ) ( not ( = ?auto_266824 ?auto_266830 ) ) ( not ( = ?auto_266824 ?auto_266831 ) ) ( not ( = ?auto_266824 ?auto_266832 ) ) ( not ( = ?auto_266824 ?auto_266833 ) ) ( not ( = ?auto_266824 ?auto_266834 ) ) ( not ( = ?auto_266825 ?auto_266826 ) ) ( not ( = ?auto_266825 ?auto_266827 ) ) ( not ( = ?auto_266825 ?auto_266828 ) ) ( not ( = ?auto_266825 ?auto_266829 ) ) ( not ( = ?auto_266825 ?auto_266830 ) ) ( not ( = ?auto_266825 ?auto_266831 ) ) ( not ( = ?auto_266825 ?auto_266832 ) ) ( not ( = ?auto_266825 ?auto_266833 ) ) ( not ( = ?auto_266825 ?auto_266834 ) ) ( not ( = ?auto_266826 ?auto_266827 ) ) ( not ( = ?auto_266826 ?auto_266828 ) ) ( not ( = ?auto_266826 ?auto_266829 ) ) ( not ( = ?auto_266826 ?auto_266830 ) ) ( not ( = ?auto_266826 ?auto_266831 ) ) ( not ( = ?auto_266826 ?auto_266832 ) ) ( not ( = ?auto_266826 ?auto_266833 ) ) ( not ( = ?auto_266826 ?auto_266834 ) ) ( not ( = ?auto_266827 ?auto_266828 ) ) ( not ( = ?auto_266827 ?auto_266829 ) ) ( not ( = ?auto_266827 ?auto_266830 ) ) ( not ( = ?auto_266827 ?auto_266831 ) ) ( not ( = ?auto_266827 ?auto_266832 ) ) ( not ( = ?auto_266827 ?auto_266833 ) ) ( not ( = ?auto_266827 ?auto_266834 ) ) ( not ( = ?auto_266828 ?auto_266829 ) ) ( not ( = ?auto_266828 ?auto_266830 ) ) ( not ( = ?auto_266828 ?auto_266831 ) ) ( not ( = ?auto_266828 ?auto_266832 ) ) ( not ( = ?auto_266828 ?auto_266833 ) ) ( not ( = ?auto_266828 ?auto_266834 ) ) ( not ( = ?auto_266829 ?auto_266830 ) ) ( not ( = ?auto_266829 ?auto_266831 ) ) ( not ( = ?auto_266829 ?auto_266832 ) ) ( not ( = ?auto_266829 ?auto_266833 ) ) ( not ( = ?auto_266829 ?auto_266834 ) ) ( not ( = ?auto_266830 ?auto_266831 ) ) ( not ( = ?auto_266830 ?auto_266832 ) ) ( not ( = ?auto_266830 ?auto_266833 ) ) ( not ( = ?auto_266830 ?auto_266834 ) ) ( not ( = ?auto_266831 ?auto_266832 ) ) ( not ( = ?auto_266831 ?auto_266833 ) ) ( not ( = ?auto_266831 ?auto_266834 ) ) ( not ( = ?auto_266832 ?auto_266833 ) ) ( not ( = ?auto_266832 ?auto_266834 ) ) ( not ( = ?auto_266833 ?auto_266834 ) ) ( ON ?auto_266832 ?auto_266833 ) ( ON ?auto_266831 ?auto_266832 ) ( CLEAR ?auto_266829 ) ( ON ?auto_266830 ?auto_266831 ) ( CLEAR ?auto_266830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_266822 ?auto_266823 ?auto_266824 ?auto_266825 ?auto_266826 ?auto_266827 ?auto_266828 ?auto_266829 ?auto_266830 )
      ( MAKE-12PILE ?auto_266822 ?auto_266823 ?auto_266824 ?auto_266825 ?auto_266826 ?auto_266827 ?auto_266828 ?auto_266829 ?auto_266830 ?auto_266831 ?auto_266832 ?auto_266833 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266847 - BLOCK
      ?auto_266848 - BLOCK
      ?auto_266849 - BLOCK
      ?auto_266850 - BLOCK
      ?auto_266851 - BLOCK
      ?auto_266852 - BLOCK
      ?auto_266853 - BLOCK
      ?auto_266854 - BLOCK
      ?auto_266855 - BLOCK
      ?auto_266856 - BLOCK
      ?auto_266857 - BLOCK
      ?auto_266858 - BLOCK
    )
    :vars
    (
      ?auto_266859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266858 ?auto_266859 ) ( ON-TABLE ?auto_266847 ) ( ON ?auto_266848 ?auto_266847 ) ( ON ?auto_266849 ?auto_266848 ) ( ON ?auto_266850 ?auto_266849 ) ( ON ?auto_266851 ?auto_266850 ) ( ON ?auto_266852 ?auto_266851 ) ( ON ?auto_266853 ?auto_266852 ) ( ON ?auto_266854 ?auto_266853 ) ( not ( = ?auto_266847 ?auto_266848 ) ) ( not ( = ?auto_266847 ?auto_266849 ) ) ( not ( = ?auto_266847 ?auto_266850 ) ) ( not ( = ?auto_266847 ?auto_266851 ) ) ( not ( = ?auto_266847 ?auto_266852 ) ) ( not ( = ?auto_266847 ?auto_266853 ) ) ( not ( = ?auto_266847 ?auto_266854 ) ) ( not ( = ?auto_266847 ?auto_266855 ) ) ( not ( = ?auto_266847 ?auto_266856 ) ) ( not ( = ?auto_266847 ?auto_266857 ) ) ( not ( = ?auto_266847 ?auto_266858 ) ) ( not ( = ?auto_266847 ?auto_266859 ) ) ( not ( = ?auto_266848 ?auto_266849 ) ) ( not ( = ?auto_266848 ?auto_266850 ) ) ( not ( = ?auto_266848 ?auto_266851 ) ) ( not ( = ?auto_266848 ?auto_266852 ) ) ( not ( = ?auto_266848 ?auto_266853 ) ) ( not ( = ?auto_266848 ?auto_266854 ) ) ( not ( = ?auto_266848 ?auto_266855 ) ) ( not ( = ?auto_266848 ?auto_266856 ) ) ( not ( = ?auto_266848 ?auto_266857 ) ) ( not ( = ?auto_266848 ?auto_266858 ) ) ( not ( = ?auto_266848 ?auto_266859 ) ) ( not ( = ?auto_266849 ?auto_266850 ) ) ( not ( = ?auto_266849 ?auto_266851 ) ) ( not ( = ?auto_266849 ?auto_266852 ) ) ( not ( = ?auto_266849 ?auto_266853 ) ) ( not ( = ?auto_266849 ?auto_266854 ) ) ( not ( = ?auto_266849 ?auto_266855 ) ) ( not ( = ?auto_266849 ?auto_266856 ) ) ( not ( = ?auto_266849 ?auto_266857 ) ) ( not ( = ?auto_266849 ?auto_266858 ) ) ( not ( = ?auto_266849 ?auto_266859 ) ) ( not ( = ?auto_266850 ?auto_266851 ) ) ( not ( = ?auto_266850 ?auto_266852 ) ) ( not ( = ?auto_266850 ?auto_266853 ) ) ( not ( = ?auto_266850 ?auto_266854 ) ) ( not ( = ?auto_266850 ?auto_266855 ) ) ( not ( = ?auto_266850 ?auto_266856 ) ) ( not ( = ?auto_266850 ?auto_266857 ) ) ( not ( = ?auto_266850 ?auto_266858 ) ) ( not ( = ?auto_266850 ?auto_266859 ) ) ( not ( = ?auto_266851 ?auto_266852 ) ) ( not ( = ?auto_266851 ?auto_266853 ) ) ( not ( = ?auto_266851 ?auto_266854 ) ) ( not ( = ?auto_266851 ?auto_266855 ) ) ( not ( = ?auto_266851 ?auto_266856 ) ) ( not ( = ?auto_266851 ?auto_266857 ) ) ( not ( = ?auto_266851 ?auto_266858 ) ) ( not ( = ?auto_266851 ?auto_266859 ) ) ( not ( = ?auto_266852 ?auto_266853 ) ) ( not ( = ?auto_266852 ?auto_266854 ) ) ( not ( = ?auto_266852 ?auto_266855 ) ) ( not ( = ?auto_266852 ?auto_266856 ) ) ( not ( = ?auto_266852 ?auto_266857 ) ) ( not ( = ?auto_266852 ?auto_266858 ) ) ( not ( = ?auto_266852 ?auto_266859 ) ) ( not ( = ?auto_266853 ?auto_266854 ) ) ( not ( = ?auto_266853 ?auto_266855 ) ) ( not ( = ?auto_266853 ?auto_266856 ) ) ( not ( = ?auto_266853 ?auto_266857 ) ) ( not ( = ?auto_266853 ?auto_266858 ) ) ( not ( = ?auto_266853 ?auto_266859 ) ) ( not ( = ?auto_266854 ?auto_266855 ) ) ( not ( = ?auto_266854 ?auto_266856 ) ) ( not ( = ?auto_266854 ?auto_266857 ) ) ( not ( = ?auto_266854 ?auto_266858 ) ) ( not ( = ?auto_266854 ?auto_266859 ) ) ( not ( = ?auto_266855 ?auto_266856 ) ) ( not ( = ?auto_266855 ?auto_266857 ) ) ( not ( = ?auto_266855 ?auto_266858 ) ) ( not ( = ?auto_266855 ?auto_266859 ) ) ( not ( = ?auto_266856 ?auto_266857 ) ) ( not ( = ?auto_266856 ?auto_266858 ) ) ( not ( = ?auto_266856 ?auto_266859 ) ) ( not ( = ?auto_266857 ?auto_266858 ) ) ( not ( = ?auto_266857 ?auto_266859 ) ) ( not ( = ?auto_266858 ?auto_266859 ) ) ( ON ?auto_266857 ?auto_266858 ) ( ON ?auto_266856 ?auto_266857 ) ( CLEAR ?auto_266854 ) ( ON ?auto_266855 ?auto_266856 ) ( CLEAR ?auto_266855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_266847 ?auto_266848 ?auto_266849 ?auto_266850 ?auto_266851 ?auto_266852 ?auto_266853 ?auto_266854 ?auto_266855 )
      ( MAKE-12PILE ?auto_266847 ?auto_266848 ?auto_266849 ?auto_266850 ?auto_266851 ?auto_266852 ?auto_266853 ?auto_266854 ?auto_266855 ?auto_266856 ?auto_266857 ?auto_266858 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266872 - BLOCK
      ?auto_266873 - BLOCK
      ?auto_266874 - BLOCK
      ?auto_266875 - BLOCK
      ?auto_266876 - BLOCK
      ?auto_266877 - BLOCK
      ?auto_266878 - BLOCK
      ?auto_266879 - BLOCK
      ?auto_266880 - BLOCK
      ?auto_266881 - BLOCK
      ?auto_266882 - BLOCK
      ?auto_266883 - BLOCK
    )
    :vars
    (
      ?auto_266884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266883 ?auto_266884 ) ( ON-TABLE ?auto_266872 ) ( ON ?auto_266873 ?auto_266872 ) ( ON ?auto_266874 ?auto_266873 ) ( ON ?auto_266875 ?auto_266874 ) ( ON ?auto_266876 ?auto_266875 ) ( ON ?auto_266877 ?auto_266876 ) ( ON ?auto_266878 ?auto_266877 ) ( not ( = ?auto_266872 ?auto_266873 ) ) ( not ( = ?auto_266872 ?auto_266874 ) ) ( not ( = ?auto_266872 ?auto_266875 ) ) ( not ( = ?auto_266872 ?auto_266876 ) ) ( not ( = ?auto_266872 ?auto_266877 ) ) ( not ( = ?auto_266872 ?auto_266878 ) ) ( not ( = ?auto_266872 ?auto_266879 ) ) ( not ( = ?auto_266872 ?auto_266880 ) ) ( not ( = ?auto_266872 ?auto_266881 ) ) ( not ( = ?auto_266872 ?auto_266882 ) ) ( not ( = ?auto_266872 ?auto_266883 ) ) ( not ( = ?auto_266872 ?auto_266884 ) ) ( not ( = ?auto_266873 ?auto_266874 ) ) ( not ( = ?auto_266873 ?auto_266875 ) ) ( not ( = ?auto_266873 ?auto_266876 ) ) ( not ( = ?auto_266873 ?auto_266877 ) ) ( not ( = ?auto_266873 ?auto_266878 ) ) ( not ( = ?auto_266873 ?auto_266879 ) ) ( not ( = ?auto_266873 ?auto_266880 ) ) ( not ( = ?auto_266873 ?auto_266881 ) ) ( not ( = ?auto_266873 ?auto_266882 ) ) ( not ( = ?auto_266873 ?auto_266883 ) ) ( not ( = ?auto_266873 ?auto_266884 ) ) ( not ( = ?auto_266874 ?auto_266875 ) ) ( not ( = ?auto_266874 ?auto_266876 ) ) ( not ( = ?auto_266874 ?auto_266877 ) ) ( not ( = ?auto_266874 ?auto_266878 ) ) ( not ( = ?auto_266874 ?auto_266879 ) ) ( not ( = ?auto_266874 ?auto_266880 ) ) ( not ( = ?auto_266874 ?auto_266881 ) ) ( not ( = ?auto_266874 ?auto_266882 ) ) ( not ( = ?auto_266874 ?auto_266883 ) ) ( not ( = ?auto_266874 ?auto_266884 ) ) ( not ( = ?auto_266875 ?auto_266876 ) ) ( not ( = ?auto_266875 ?auto_266877 ) ) ( not ( = ?auto_266875 ?auto_266878 ) ) ( not ( = ?auto_266875 ?auto_266879 ) ) ( not ( = ?auto_266875 ?auto_266880 ) ) ( not ( = ?auto_266875 ?auto_266881 ) ) ( not ( = ?auto_266875 ?auto_266882 ) ) ( not ( = ?auto_266875 ?auto_266883 ) ) ( not ( = ?auto_266875 ?auto_266884 ) ) ( not ( = ?auto_266876 ?auto_266877 ) ) ( not ( = ?auto_266876 ?auto_266878 ) ) ( not ( = ?auto_266876 ?auto_266879 ) ) ( not ( = ?auto_266876 ?auto_266880 ) ) ( not ( = ?auto_266876 ?auto_266881 ) ) ( not ( = ?auto_266876 ?auto_266882 ) ) ( not ( = ?auto_266876 ?auto_266883 ) ) ( not ( = ?auto_266876 ?auto_266884 ) ) ( not ( = ?auto_266877 ?auto_266878 ) ) ( not ( = ?auto_266877 ?auto_266879 ) ) ( not ( = ?auto_266877 ?auto_266880 ) ) ( not ( = ?auto_266877 ?auto_266881 ) ) ( not ( = ?auto_266877 ?auto_266882 ) ) ( not ( = ?auto_266877 ?auto_266883 ) ) ( not ( = ?auto_266877 ?auto_266884 ) ) ( not ( = ?auto_266878 ?auto_266879 ) ) ( not ( = ?auto_266878 ?auto_266880 ) ) ( not ( = ?auto_266878 ?auto_266881 ) ) ( not ( = ?auto_266878 ?auto_266882 ) ) ( not ( = ?auto_266878 ?auto_266883 ) ) ( not ( = ?auto_266878 ?auto_266884 ) ) ( not ( = ?auto_266879 ?auto_266880 ) ) ( not ( = ?auto_266879 ?auto_266881 ) ) ( not ( = ?auto_266879 ?auto_266882 ) ) ( not ( = ?auto_266879 ?auto_266883 ) ) ( not ( = ?auto_266879 ?auto_266884 ) ) ( not ( = ?auto_266880 ?auto_266881 ) ) ( not ( = ?auto_266880 ?auto_266882 ) ) ( not ( = ?auto_266880 ?auto_266883 ) ) ( not ( = ?auto_266880 ?auto_266884 ) ) ( not ( = ?auto_266881 ?auto_266882 ) ) ( not ( = ?auto_266881 ?auto_266883 ) ) ( not ( = ?auto_266881 ?auto_266884 ) ) ( not ( = ?auto_266882 ?auto_266883 ) ) ( not ( = ?auto_266882 ?auto_266884 ) ) ( not ( = ?auto_266883 ?auto_266884 ) ) ( ON ?auto_266882 ?auto_266883 ) ( ON ?auto_266881 ?auto_266882 ) ( ON ?auto_266880 ?auto_266881 ) ( CLEAR ?auto_266878 ) ( ON ?auto_266879 ?auto_266880 ) ( CLEAR ?auto_266879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_266872 ?auto_266873 ?auto_266874 ?auto_266875 ?auto_266876 ?auto_266877 ?auto_266878 ?auto_266879 )
      ( MAKE-12PILE ?auto_266872 ?auto_266873 ?auto_266874 ?auto_266875 ?auto_266876 ?auto_266877 ?auto_266878 ?auto_266879 ?auto_266880 ?auto_266881 ?auto_266882 ?auto_266883 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266897 - BLOCK
      ?auto_266898 - BLOCK
      ?auto_266899 - BLOCK
      ?auto_266900 - BLOCK
      ?auto_266901 - BLOCK
      ?auto_266902 - BLOCK
      ?auto_266903 - BLOCK
      ?auto_266904 - BLOCK
      ?auto_266905 - BLOCK
      ?auto_266906 - BLOCK
      ?auto_266907 - BLOCK
      ?auto_266908 - BLOCK
    )
    :vars
    (
      ?auto_266909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266908 ?auto_266909 ) ( ON-TABLE ?auto_266897 ) ( ON ?auto_266898 ?auto_266897 ) ( ON ?auto_266899 ?auto_266898 ) ( ON ?auto_266900 ?auto_266899 ) ( ON ?auto_266901 ?auto_266900 ) ( ON ?auto_266902 ?auto_266901 ) ( ON ?auto_266903 ?auto_266902 ) ( not ( = ?auto_266897 ?auto_266898 ) ) ( not ( = ?auto_266897 ?auto_266899 ) ) ( not ( = ?auto_266897 ?auto_266900 ) ) ( not ( = ?auto_266897 ?auto_266901 ) ) ( not ( = ?auto_266897 ?auto_266902 ) ) ( not ( = ?auto_266897 ?auto_266903 ) ) ( not ( = ?auto_266897 ?auto_266904 ) ) ( not ( = ?auto_266897 ?auto_266905 ) ) ( not ( = ?auto_266897 ?auto_266906 ) ) ( not ( = ?auto_266897 ?auto_266907 ) ) ( not ( = ?auto_266897 ?auto_266908 ) ) ( not ( = ?auto_266897 ?auto_266909 ) ) ( not ( = ?auto_266898 ?auto_266899 ) ) ( not ( = ?auto_266898 ?auto_266900 ) ) ( not ( = ?auto_266898 ?auto_266901 ) ) ( not ( = ?auto_266898 ?auto_266902 ) ) ( not ( = ?auto_266898 ?auto_266903 ) ) ( not ( = ?auto_266898 ?auto_266904 ) ) ( not ( = ?auto_266898 ?auto_266905 ) ) ( not ( = ?auto_266898 ?auto_266906 ) ) ( not ( = ?auto_266898 ?auto_266907 ) ) ( not ( = ?auto_266898 ?auto_266908 ) ) ( not ( = ?auto_266898 ?auto_266909 ) ) ( not ( = ?auto_266899 ?auto_266900 ) ) ( not ( = ?auto_266899 ?auto_266901 ) ) ( not ( = ?auto_266899 ?auto_266902 ) ) ( not ( = ?auto_266899 ?auto_266903 ) ) ( not ( = ?auto_266899 ?auto_266904 ) ) ( not ( = ?auto_266899 ?auto_266905 ) ) ( not ( = ?auto_266899 ?auto_266906 ) ) ( not ( = ?auto_266899 ?auto_266907 ) ) ( not ( = ?auto_266899 ?auto_266908 ) ) ( not ( = ?auto_266899 ?auto_266909 ) ) ( not ( = ?auto_266900 ?auto_266901 ) ) ( not ( = ?auto_266900 ?auto_266902 ) ) ( not ( = ?auto_266900 ?auto_266903 ) ) ( not ( = ?auto_266900 ?auto_266904 ) ) ( not ( = ?auto_266900 ?auto_266905 ) ) ( not ( = ?auto_266900 ?auto_266906 ) ) ( not ( = ?auto_266900 ?auto_266907 ) ) ( not ( = ?auto_266900 ?auto_266908 ) ) ( not ( = ?auto_266900 ?auto_266909 ) ) ( not ( = ?auto_266901 ?auto_266902 ) ) ( not ( = ?auto_266901 ?auto_266903 ) ) ( not ( = ?auto_266901 ?auto_266904 ) ) ( not ( = ?auto_266901 ?auto_266905 ) ) ( not ( = ?auto_266901 ?auto_266906 ) ) ( not ( = ?auto_266901 ?auto_266907 ) ) ( not ( = ?auto_266901 ?auto_266908 ) ) ( not ( = ?auto_266901 ?auto_266909 ) ) ( not ( = ?auto_266902 ?auto_266903 ) ) ( not ( = ?auto_266902 ?auto_266904 ) ) ( not ( = ?auto_266902 ?auto_266905 ) ) ( not ( = ?auto_266902 ?auto_266906 ) ) ( not ( = ?auto_266902 ?auto_266907 ) ) ( not ( = ?auto_266902 ?auto_266908 ) ) ( not ( = ?auto_266902 ?auto_266909 ) ) ( not ( = ?auto_266903 ?auto_266904 ) ) ( not ( = ?auto_266903 ?auto_266905 ) ) ( not ( = ?auto_266903 ?auto_266906 ) ) ( not ( = ?auto_266903 ?auto_266907 ) ) ( not ( = ?auto_266903 ?auto_266908 ) ) ( not ( = ?auto_266903 ?auto_266909 ) ) ( not ( = ?auto_266904 ?auto_266905 ) ) ( not ( = ?auto_266904 ?auto_266906 ) ) ( not ( = ?auto_266904 ?auto_266907 ) ) ( not ( = ?auto_266904 ?auto_266908 ) ) ( not ( = ?auto_266904 ?auto_266909 ) ) ( not ( = ?auto_266905 ?auto_266906 ) ) ( not ( = ?auto_266905 ?auto_266907 ) ) ( not ( = ?auto_266905 ?auto_266908 ) ) ( not ( = ?auto_266905 ?auto_266909 ) ) ( not ( = ?auto_266906 ?auto_266907 ) ) ( not ( = ?auto_266906 ?auto_266908 ) ) ( not ( = ?auto_266906 ?auto_266909 ) ) ( not ( = ?auto_266907 ?auto_266908 ) ) ( not ( = ?auto_266907 ?auto_266909 ) ) ( not ( = ?auto_266908 ?auto_266909 ) ) ( ON ?auto_266907 ?auto_266908 ) ( ON ?auto_266906 ?auto_266907 ) ( ON ?auto_266905 ?auto_266906 ) ( CLEAR ?auto_266903 ) ( ON ?auto_266904 ?auto_266905 ) ( CLEAR ?auto_266904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_266897 ?auto_266898 ?auto_266899 ?auto_266900 ?auto_266901 ?auto_266902 ?auto_266903 ?auto_266904 )
      ( MAKE-12PILE ?auto_266897 ?auto_266898 ?auto_266899 ?auto_266900 ?auto_266901 ?auto_266902 ?auto_266903 ?auto_266904 ?auto_266905 ?auto_266906 ?auto_266907 ?auto_266908 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266922 - BLOCK
      ?auto_266923 - BLOCK
      ?auto_266924 - BLOCK
      ?auto_266925 - BLOCK
      ?auto_266926 - BLOCK
      ?auto_266927 - BLOCK
      ?auto_266928 - BLOCK
      ?auto_266929 - BLOCK
      ?auto_266930 - BLOCK
      ?auto_266931 - BLOCK
      ?auto_266932 - BLOCK
      ?auto_266933 - BLOCK
    )
    :vars
    (
      ?auto_266934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266933 ?auto_266934 ) ( ON-TABLE ?auto_266922 ) ( ON ?auto_266923 ?auto_266922 ) ( ON ?auto_266924 ?auto_266923 ) ( ON ?auto_266925 ?auto_266924 ) ( ON ?auto_266926 ?auto_266925 ) ( ON ?auto_266927 ?auto_266926 ) ( not ( = ?auto_266922 ?auto_266923 ) ) ( not ( = ?auto_266922 ?auto_266924 ) ) ( not ( = ?auto_266922 ?auto_266925 ) ) ( not ( = ?auto_266922 ?auto_266926 ) ) ( not ( = ?auto_266922 ?auto_266927 ) ) ( not ( = ?auto_266922 ?auto_266928 ) ) ( not ( = ?auto_266922 ?auto_266929 ) ) ( not ( = ?auto_266922 ?auto_266930 ) ) ( not ( = ?auto_266922 ?auto_266931 ) ) ( not ( = ?auto_266922 ?auto_266932 ) ) ( not ( = ?auto_266922 ?auto_266933 ) ) ( not ( = ?auto_266922 ?auto_266934 ) ) ( not ( = ?auto_266923 ?auto_266924 ) ) ( not ( = ?auto_266923 ?auto_266925 ) ) ( not ( = ?auto_266923 ?auto_266926 ) ) ( not ( = ?auto_266923 ?auto_266927 ) ) ( not ( = ?auto_266923 ?auto_266928 ) ) ( not ( = ?auto_266923 ?auto_266929 ) ) ( not ( = ?auto_266923 ?auto_266930 ) ) ( not ( = ?auto_266923 ?auto_266931 ) ) ( not ( = ?auto_266923 ?auto_266932 ) ) ( not ( = ?auto_266923 ?auto_266933 ) ) ( not ( = ?auto_266923 ?auto_266934 ) ) ( not ( = ?auto_266924 ?auto_266925 ) ) ( not ( = ?auto_266924 ?auto_266926 ) ) ( not ( = ?auto_266924 ?auto_266927 ) ) ( not ( = ?auto_266924 ?auto_266928 ) ) ( not ( = ?auto_266924 ?auto_266929 ) ) ( not ( = ?auto_266924 ?auto_266930 ) ) ( not ( = ?auto_266924 ?auto_266931 ) ) ( not ( = ?auto_266924 ?auto_266932 ) ) ( not ( = ?auto_266924 ?auto_266933 ) ) ( not ( = ?auto_266924 ?auto_266934 ) ) ( not ( = ?auto_266925 ?auto_266926 ) ) ( not ( = ?auto_266925 ?auto_266927 ) ) ( not ( = ?auto_266925 ?auto_266928 ) ) ( not ( = ?auto_266925 ?auto_266929 ) ) ( not ( = ?auto_266925 ?auto_266930 ) ) ( not ( = ?auto_266925 ?auto_266931 ) ) ( not ( = ?auto_266925 ?auto_266932 ) ) ( not ( = ?auto_266925 ?auto_266933 ) ) ( not ( = ?auto_266925 ?auto_266934 ) ) ( not ( = ?auto_266926 ?auto_266927 ) ) ( not ( = ?auto_266926 ?auto_266928 ) ) ( not ( = ?auto_266926 ?auto_266929 ) ) ( not ( = ?auto_266926 ?auto_266930 ) ) ( not ( = ?auto_266926 ?auto_266931 ) ) ( not ( = ?auto_266926 ?auto_266932 ) ) ( not ( = ?auto_266926 ?auto_266933 ) ) ( not ( = ?auto_266926 ?auto_266934 ) ) ( not ( = ?auto_266927 ?auto_266928 ) ) ( not ( = ?auto_266927 ?auto_266929 ) ) ( not ( = ?auto_266927 ?auto_266930 ) ) ( not ( = ?auto_266927 ?auto_266931 ) ) ( not ( = ?auto_266927 ?auto_266932 ) ) ( not ( = ?auto_266927 ?auto_266933 ) ) ( not ( = ?auto_266927 ?auto_266934 ) ) ( not ( = ?auto_266928 ?auto_266929 ) ) ( not ( = ?auto_266928 ?auto_266930 ) ) ( not ( = ?auto_266928 ?auto_266931 ) ) ( not ( = ?auto_266928 ?auto_266932 ) ) ( not ( = ?auto_266928 ?auto_266933 ) ) ( not ( = ?auto_266928 ?auto_266934 ) ) ( not ( = ?auto_266929 ?auto_266930 ) ) ( not ( = ?auto_266929 ?auto_266931 ) ) ( not ( = ?auto_266929 ?auto_266932 ) ) ( not ( = ?auto_266929 ?auto_266933 ) ) ( not ( = ?auto_266929 ?auto_266934 ) ) ( not ( = ?auto_266930 ?auto_266931 ) ) ( not ( = ?auto_266930 ?auto_266932 ) ) ( not ( = ?auto_266930 ?auto_266933 ) ) ( not ( = ?auto_266930 ?auto_266934 ) ) ( not ( = ?auto_266931 ?auto_266932 ) ) ( not ( = ?auto_266931 ?auto_266933 ) ) ( not ( = ?auto_266931 ?auto_266934 ) ) ( not ( = ?auto_266932 ?auto_266933 ) ) ( not ( = ?auto_266932 ?auto_266934 ) ) ( not ( = ?auto_266933 ?auto_266934 ) ) ( ON ?auto_266932 ?auto_266933 ) ( ON ?auto_266931 ?auto_266932 ) ( ON ?auto_266930 ?auto_266931 ) ( ON ?auto_266929 ?auto_266930 ) ( CLEAR ?auto_266927 ) ( ON ?auto_266928 ?auto_266929 ) ( CLEAR ?auto_266928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_266922 ?auto_266923 ?auto_266924 ?auto_266925 ?auto_266926 ?auto_266927 ?auto_266928 )
      ( MAKE-12PILE ?auto_266922 ?auto_266923 ?auto_266924 ?auto_266925 ?auto_266926 ?auto_266927 ?auto_266928 ?auto_266929 ?auto_266930 ?auto_266931 ?auto_266932 ?auto_266933 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266947 - BLOCK
      ?auto_266948 - BLOCK
      ?auto_266949 - BLOCK
      ?auto_266950 - BLOCK
      ?auto_266951 - BLOCK
      ?auto_266952 - BLOCK
      ?auto_266953 - BLOCK
      ?auto_266954 - BLOCK
      ?auto_266955 - BLOCK
      ?auto_266956 - BLOCK
      ?auto_266957 - BLOCK
      ?auto_266958 - BLOCK
    )
    :vars
    (
      ?auto_266959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266958 ?auto_266959 ) ( ON-TABLE ?auto_266947 ) ( ON ?auto_266948 ?auto_266947 ) ( ON ?auto_266949 ?auto_266948 ) ( ON ?auto_266950 ?auto_266949 ) ( ON ?auto_266951 ?auto_266950 ) ( ON ?auto_266952 ?auto_266951 ) ( not ( = ?auto_266947 ?auto_266948 ) ) ( not ( = ?auto_266947 ?auto_266949 ) ) ( not ( = ?auto_266947 ?auto_266950 ) ) ( not ( = ?auto_266947 ?auto_266951 ) ) ( not ( = ?auto_266947 ?auto_266952 ) ) ( not ( = ?auto_266947 ?auto_266953 ) ) ( not ( = ?auto_266947 ?auto_266954 ) ) ( not ( = ?auto_266947 ?auto_266955 ) ) ( not ( = ?auto_266947 ?auto_266956 ) ) ( not ( = ?auto_266947 ?auto_266957 ) ) ( not ( = ?auto_266947 ?auto_266958 ) ) ( not ( = ?auto_266947 ?auto_266959 ) ) ( not ( = ?auto_266948 ?auto_266949 ) ) ( not ( = ?auto_266948 ?auto_266950 ) ) ( not ( = ?auto_266948 ?auto_266951 ) ) ( not ( = ?auto_266948 ?auto_266952 ) ) ( not ( = ?auto_266948 ?auto_266953 ) ) ( not ( = ?auto_266948 ?auto_266954 ) ) ( not ( = ?auto_266948 ?auto_266955 ) ) ( not ( = ?auto_266948 ?auto_266956 ) ) ( not ( = ?auto_266948 ?auto_266957 ) ) ( not ( = ?auto_266948 ?auto_266958 ) ) ( not ( = ?auto_266948 ?auto_266959 ) ) ( not ( = ?auto_266949 ?auto_266950 ) ) ( not ( = ?auto_266949 ?auto_266951 ) ) ( not ( = ?auto_266949 ?auto_266952 ) ) ( not ( = ?auto_266949 ?auto_266953 ) ) ( not ( = ?auto_266949 ?auto_266954 ) ) ( not ( = ?auto_266949 ?auto_266955 ) ) ( not ( = ?auto_266949 ?auto_266956 ) ) ( not ( = ?auto_266949 ?auto_266957 ) ) ( not ( = ?auto_266949 ?auto_266958 ) ) ( not ( = ?auto_266949 ?auto_266959 ) ) ( not ( = ?auto_266950 ?auto_266951 ) ) ( not ( = ?auto_266950 ?auto_266952 ) ) ( not ( = ?auto_266950 ?auto_266953 ) ) ( not ( = ?auto_266950 ?auto_266954 ) ) ( not ( = ?auto_266950 ?auto_266955 ) ) ( not ( = ?auto_266950 ?auto_266956 ) ) ( not ( = ?auto_266950 ?auto_266957 ) ) ( not ( = ?auto_266950 ?auto_266958 ) ) ( not ( = ?auto_266950 ?auto_266959 ) ) ( not ( = ?auto_266951 ?auto_266952 ) ) ( not ( = ?auto_266951 ?auto_266953 ) ) ( not ( = ?auto_266951 ?auto_266954 ) ) ( not ( = ?auto_266951 ?auto_266955 ) ) ( not ( = ?auto_266951 ?auto_266956 ) ) ( not ( = ?auto_266951 ?auto_266957 ) ) ( not ( = ?auto_266951 ?auto_266958 ) ) ( not ( = ?auto_266951 ?auto_266959 ) ) ( not ( = ?auto_266952 ?auto_266953 ) ) ( not ( = ?auto_266952 ?auto_266954 ) ) ( not ( = ?auto_266952 ?auto_266955 ) ) ( not ( = ?auto_266952 ?auto_266956 ) ) ( not ( = ?auto_266952 ?auto_266957 ) ) ( not ( = ?auto_266952 ?auto_266958 ) ) ( not ( = ?auto_266952 ?auto_266959 ) ) ( not ( = ?auto_266953 ?auto_266954 ) ) ( not ( = ?auto_266953 ?auto_266955 ) ) ( not ( = ?auto_266953 ?auto_266956 ) ) ( not ( = ?auto_266953 ?auto_266957 ) ) ( not ( = ?auto_266953 ?auto_266958 ) ) ( not ( = ?auto_266953 ?auto_266959 ) ) ( not ( = ?auto_266954 ?auto_266955 ) ) ( not ( = ?auto_266954 ?auto_266956 ) ) ( not ( = ?auto_266954 ?auto_266957 ) ) ( not ( = ?auto_266954 ?auto_266958 ) ) ( not ( = ?auto_266954 ?auto_266959 ) ) ( not ( = ?auto_266955 ?auto_266956 ) ) ( not ( = ?auto_266955 ?auto_266957 ) ) ( not ( = ?auto_266955 ?auto_266958 ) ) ( not ( = ?auto_266955 ?auto_266959 ) ) ( not ( = ?auto_266956 ?auto_266957 ) ) ( not ( = ?auto_266956 ?auto_266958 ) ) ( not ( = ?auto_266956 ?auto_266959 ) ) ( not ( = ?auto_266957 ?auto_266958 ) ) ( not ( = ?auto_266957 ?auto_266959 ) ) ( not ( = ?auto_266958 ?auto_266959 ) ) ( ON ?auto_266957 ?auto_266958 ) ( ON ?auto_266956 ?auto_266957 ) ( ON ?auto_266955 ?auto_266956 ) ( ON ?auto_266954 ?auto_266955 ) ( CLEAR ?auto_266952 ) ( ON ?auto_266953 ?auto_266954 ) ( CLEAR ?auto_266953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_266947 ?auto_266948 ?auto_266949 ?auto_266950 ?auto_266951 ?auto_266952 ?auto_266953 )
      ( MAKE-12PILE ?auto_266947 ?auto_266948 ?auto_266949 ?auto_266950 ?auto_266951 ?auto_266952 ?auto_266953 ?auto_266954 ?auto_266955 ?auto_266956 ?auto_266957 ?auto_266958 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266972 - BLOCK
      ?auto_266973 - BLOCK
      ?auto_266974 - BLOCK
      ?auto_266975 - BLOCK
      ?auto_266976 - BLOCK
      ?auto_266977 - BLOCK
      ?auto_266978 - BLOCK
      ?auto_266979 - BLOCK
      ?auto_266980 - BLOCK
      ?auto_266981 - BLOCK
      ?auto_266982 - BLOCK
      ?auto_266983 - BLOCK
    )
    :vars
    (
      ?auto_266984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_266983 ?auto_266984 ) ( ON-TABLE ?auto_266972 ) ( ON ?auto_266973 ?auto_266972 ) ( ON ?auto_266974 ?auto_266973 ) ( ON ?auto_266975 ?auto_266974 ) ( ON ?auto_266976 ?auto_266975 ) ( not ( = ?auto_266972 ?auto_266973 ) ) ( not ( = ?auto_266972 ?auto_266974 ) ) ( not ( = ?auto_266972 ?auto_266975 ) ) ( not ( = ?auto_266972 ?auto_266976 ) ) ( not ( = ?auto_266972 ?auto_266977 ) ) ( not ( = ?auto_266972 ?auto_266978 ) ) ( not ( = ?auto_266972 ?auto_266979 ) ) ( not ( = ?auto_266972 ?auto_266980 ) ) ( not ( = ?auto_266972 ?auto_266981 ) ) ( not ( = ?auto_266972 ?auto_266982 ) ) ( not ( = ?auto_266972 ?auto_266983 ) ) ( not ( = ?auto_266972 ?auto_266984 ) ) ( not ( = ?auto_266973 ?auto_266974 ) ) ( not ( = ?auto_266973 ?auto_266975 ) ) ( not ( = ?auto_266973 ?auto_266976 ) ) ( not ( = ?auto_266973 ?auto_266977 ) ) ( not ( = ?auto_266973 ?auto_266978 ) ) ( not ( = ?auto_266973 ?auto_266979 ) ) ( not ( = ?auto_266973 ?auto_266980 ) ) ( not ( = ?auto_266973 ?auto_266981 ) ) ( not ( = ?auto_266973 ?auto_266982 ) ) ( not ( = ?auto_266973 ?auto_266983 ) ) ( not ( = ?auto_266973 ?auto_266984 ) ) ( not ( = ?auto_266974 ?auto_266975 ) ) ( not ( = ?auto_266974 ?auto_266976 ) ) ( not ( = ?auto_266974 ?auto_266977 ) ) ( not ( = ?auto_266974 ?auto_266978 ) ) ( not ( = ?auto_266974 ?auto_266979 ) ) ( not ( = ?auto_266974 ?auto_266980 ) ) ( not ( = ?auto_266974 ?auto_266981 ) ) ( not ( = ?auto_266974 ?auto_266982 ) ) ( not ( = ?auto_266974 ?auto_266983 ) ) ( not ( = ?auto_266974 ?auto_266984 ) ) ( not ( = ?auto_266975 ?auto_266976 ) ) ( not ( = ?auto_266975 ?auto_266977 ) ) ( not ( = ?auto_266975 ?auto_266978 ) ) ( not ( = ?auto_266975 ?auto_266979 ) ) ( not ( = ?auto_266975 ?auto_266980 ) ) ( not ( = ?auto_266975 ?auto_266981 ) ) ( not ( = ?auto_266975 ?auto_266982 ) ) ( not ( = ?auto_266975 ?auto_266983 ) ) ( not ( = ?auto_266975 ?auto_266984 ) ) ( not ( = ?auto_266976 ?auto_266977 ) ) ( not ( = ?auto_266976 ?auto_266978 ) ) ( not ( = ?auto_266976 ?auto_266979 ) ) ( not ( = ?auto_266976 ?auto_266980 ) ) ( not ( = ?auto_266976 ?auto_266981 ) ) ( not ( = ?auto_266976 ?auto_266982 ) ) ( not ( = ?auto_266976 ?auto_266983 ) ) ( not ( = ?auto_266976 ?auto_266984 ) ) ( not ( = ?auto_266977 ?auto_266978 ) ) ( not ( = ?auto_266977 ?auto_266979 ) ) ( not ( = ?auto_266977 ?auto_266980 ) ) ( not ( = ?auto_266977 ?auto_266981 ) ) ( not ( = ?auto_266977 ?auto_266982 ) ) ( not ( = ?auto_266977 ?auto_266983 ) ) ( not ( = ?auto_266977 ?auto_266984 ) ) ( not ( = ?auto_266978 ?auto_266979 ) ) ( not ( = ?auto_266978 ?auto_266980 ) ) ( not ( = ?auto_266978 ?auto_266981 ) ) ( not ( = ?auto_266978 ?auto_266982 ) ) ( not ( = ?auto_266978 ?auto_266983 ) ) ( not ( = ?auto_266978 ?auto_266984 ) ) ( not ( = ?auto_266979 ?auto_266980 ) ) ( not ( = ?auto_266979 ?auto_266981 ) ) ( not ( = ?auto_266979 ?auto_266982 ) ) ( not ( = ?auto_266979 ?auto_266983 ) ) ( not ( = ?auto_266979 ?auto_266984 ) ) ( not ( = ?auto_266980 ?auto_266981 ) ) ( not ( = ?auto_266980 ?auto_266982 ) ) ( not ( = ?auto_266980 ?auto_266983 ) ) ( not ( = ?auto_266980 ?auto_266984 ) ) ( not ( = ?auto_266981 ?auto_266982 ) ) ( not ( = ?auto_266981 ?auto_266983 ) ) ( not ( = ?auto_266981 ?auto_266984 ) ) ( not ( = ?auto_266982 ?auto_266983 ) ) ( not ( = ?auto_266982 ?auto_266984 ) ) ( not ( = ?auto_266983 ?auto_266984 ) ) ( ON ?auto_266982 ?auto_266983 ) ( ON ?auto_266981 ?auto_266982 ) ( ON ?auto_266980 ?auto_266981 ) ( ON ?auto_266979 ?auto_266980 ) ( ON ?auto_266978 ?auto_266979 ) ( CLEAR ?auto_266976 ) ( ON ?auto_266977 ?auto_266978 ) ( CLEAR ?auto_266977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_266972 ?auto_266973 ?auto_266974 ?auto_266975 ?auto_266976 ?auto_266977 )
      ( MAKE-12PILE ?auto_266972 ?auto_266973 ?auto_266974 ?auto_266975 ?auto_266976 ?auto_266977 ?auto_266978 ?auto_266979 ?auto_266980 ?auto_266981 ?auto_266982 ?auto_266983 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_266997 - BLOCK
      ?auto_266998 - BLOCK
      ?auto_266999 - BLOCK
      ?auto_267000 - BLOCK
      ?auto_267001 - BLOCK
      ?auto_267002 - BLOCK
      ?auto_267003 - BLOCK
      ?auto_267004 - BLOCK
      ?auto_267005 - BLOCK
      ?auto_267006 - BLOCK
      ?auto_267007 - BLOCK
      ?auto_267008 - BLOCK
    )
    :vars
    (
      ?auto_267009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267008 ?auto_267009 ) ( ON-TABLE ?auto_266997 ) ( ON ?auto_266998 ?auto_266997 ) ( ON ?auto_266999 ?auto_266998 ) ( ON ?auto_267000 ?auto_266999 ) ( ON ?auto_267001 ?auto_267000 ) ( not ( = ?auto_266997 ?auto_266998 ) ) ( not ( = ?auto_266997 ?auto_266999 ) ) ( not ( = ?auto_266997 ?auto_267000 ) ) ( not ( = ?auto_266997 ?auto_267001 ) ) ( not ( = ?auto_266997 ?auto_267002 ) ) ( not ( = ?auto_266997 ?auto_267003 ) ) ( not ( = ?auto_266997 ?auto_267004 ) ) ( not ( = ?auto_266997 ?auto_267005 ) ) ( not ( = ?auto_266997 ?auto_267006 ) ) ( not ( = ?auto_266997 ?auto_267007 ) ) ( not ( = ?auto_266997 ?auto_267008 ) ) ( not ( = ?auto_266997 ?auto_267009 ) ) ( not ( = ?auto_266998 ?auto_266999 ) ) ( not ( = ?auto_266998 ?auto_267000 ) ) ( not ( = ?auto_266998 ?auto_267001 ) ) ( not ( = ?auto_266998 ?auto_267002 ) ) ( not ( = ?auto_266998 ?auto_267003 ) ) ( not ( = ?auto_266998 ?auto_267004 ) ) ( not ( = ?auto_266998 ?auto_267005 ) ) ( not ( = ?auto_266998 ?auto_267006 ) ) ( not ( = ?auto_266998 ?auto_267007 ) ) ( not ( = ?auto_266998 ?auto_267008 ) ) ( not ( = ?auto_266998 ?auto_267009 ) ) ( not ( = ?auto_266999 ?auto_267000 ) ) ( not ( = ?auto_266999 ?auto_267001 ) ) ( not ( = ?auto_266999 ?auto_267002 ) ) ( not ( = ?auto_266999 ?auto_267003 ) ) ( not ( = ?auto_266999 ?auto_267004 ) ) ( not ( = ?auto_266999 ?auto_267005 ) ) ( not ( = ?auto_266999 ?auto_267006 ) ) ( not ( = ?auto_266999 ?auto_267007 ) ) ( not ( = ?auto_266999 ?auto_267008 ) ) ( not ( = ?auto_266999 ?auto_267009 ) ) ( not ( = ?auto_267000 ?auto_267001 ) ) ( not ( = ?auto_267000 ?auto_267002 ) ) ( not ( = ?auto_267000 ?auto_267003 ) ) ( not ( = ?auto_267000 ?auto_267004 ) ) ( not ( = ?auto_267000 ?auto_267005 ) ) ( not ( = ?auto_267000 ?auto_267006 ) ) ( not ( = ?auto_267000 ?auto_267007 ) ) ( not ( = ?auto_267000 ?auto_267008 ) ) ( not ( = ?auto_267000 ?auto_267009 ) ) ( not ( = ?auto_267001 ?auto_267002 ) ) ( not ( = ?auto_267001 ?auto_267003 ) ) ( not ( = ?auto_267001 ?auto_267004 ) ) ( not ( = ?auto_267001 ?auto_267005 ) ) ( not ( = ?auto_267001 ?auto_267006 ) ) ( not ( = ?auto_267001 ?auto_267007 ) ) ( not ( = ?auto_267001 ?auto_267008 ) ) ( not ( = ?auto_267001 ?auto_267009 ) ) ( not ( = ?auto_267002 ?auto_267003 ) ) ( not ( = ?auto_267002 ?auto_267004 ) ) ( not ( = ?auto_267002 ?auto_267005 ) ) ( not ( = ?auto_267002 ?auto_267006 ) ) ( not ( = ?auto_267002 ?auto_267007 ) ) ( not ( = ?auto_267002 ?auto_267008 ) ) ( not ( = ?auto_267002 ?auto_267009 ) ) ( not ( = ?auto_267003 ?auto_267004 ) ) ( not ( = ?auto_267003 ?auto_267005 ) ) ( not ( = ?auto_267003 ?auto_267006 ) ) ( not ( = ?auto_267003 ?auto_267007 ) ) ( not ( = ?auto_267003 ?auto_267008 ) ) ( not ( = ?auto_267003 ?auto_267009 ) ) ( not ( = ?auto_267004 ?auto_267005 ) ) ( not ( = ?auto_267004 ?auto_267006 ) ) ( not ( = ?auto_267004 ?auto_267007 ) ) ( not ( = ?auto_267004 ?auto_267008 ) ) ( not ( = ?auto_267004 ?auto_267009 ) ) ( not ( = ?auto_267005 ?auto_267006 ) ) ( not ( = ?auto_267005 ?auto_267007 ) ) ( not ( = ?auto_267005 ?auto_267008 ) ) ( not ( = ?auto_267005 ?auto_267009 ) ) ( not ( = ?auto_267006 ?auto_267007 ) ) ( not ( = ?auto_267006 ?auto_267008 ) ) ( not ( = ?auto_267006 ?auto_267009 ) ) ( not ( = ?auto_267007 ?auto_267008 ) ) ( not ( = ?auto_267007 ?auto_267009 ) ) ( not ( = ?auto_267008 ?auto_267009 ) ) ( ON ?auto_267007 ?auto_267008 ) ( ON ?auto_267006 ?auto_267007 ) ( ON ?auto_267005 ?auto_267006 ) ( ON ?auto_267004 ?auto_267005 ) ( ON ?auto_267003 ?auto_267004 ) ( CLEAR ?auto_267001 ) ( ON ?auto_267002 ?auto_267003 ) ( CLEAR ?auto_267002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_266997 ?auto_266998 ?auto_266999 ?auto_267000 ?auto_267001 ?auto_267002 )
      ( MAKE-12PILE ?auto_266997 ?auto_266998 ?auto_266999 ?auto_267000 ?auto_267001 ?auto_267002 ?auto_267003 ?auto_267004 ?auto_267005 ?auto_267006 ?auto_267007 ?auto_267008 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267022 - BLOCK
      ?auto_267023 - BLOCK
      ?auto_267024 - BLOCK
      ?auto_267025 - BLOCK
      ?auto_267026 - BLOCK
      ?auto_267027 - BLOCK
      ?auto_267028 - BLOCK
      ?auto_267029 - BLOCK
      ?auto_267030 - BLOCK
      ?auto_267031 - BLOCK
      ?auto_267032 - BLOCK
      ?auto_267033 - BLOCK
    )
    :vars
    (
      ?auto_267034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267033 ?auto_267034 ) ( ON-TABLE ?auto_267022 ) ( ON ?auto_267023 ?auto_267022 ) ( ON ?auto_267024 ?auto_267023 ) ( ON ?auto_267025 ?auto_267024 ) ( not ( = ?auto_267022 ?auto_267023 ) ) ( not ( = ?auto_267022 ?auto_267024 ) ) ( not ( = ?auto_267022 ?auto_267025 ) ) ( not ( = ?auto_267022 ?auto_267026 ) ) ( not ( = ?auto_267022 ?auto_267027 ) ) ( not ( = ?auto_267022 ?auto_267028 ) ) ( not ( = ?auto_267022 ?auto_267029 ) ) ( not ( = ?auto_267022 ?auto_267030 ) ) ( not ( = ?auto_267022 ?auto_267031 ) ) ( not ( = ?auto_267022 ?auto_267032 ) ) ( not ( = ?auto_267022 ?auto_267033 ) ) ( not ( = ?auto_267022 ?auto_267034 ) ) ( not ( = ?auto_267023 ?auto_267024 ) ) ( not ( = ?auto_267023 ?auto_267025 ) ) ( not ( = ?auto_267023 ?auto_267026 ) ) ( not ( = ?auto_267023 ?auto_267027 ) ) ( not ( = ?auto_267023 ?auto_267028 ) ) ( not ( = ?auto_267023 ?auto_267029 ) ) ( not ( = ?auto_267023 ?auto_267030 ) ) ( not ( = ?auto_267023 ?auto_267031 ) ) ( not ( = ?auto_267023 ?auto_267032 ) ) ( not ( = ?auto_267023 ?auto_267033 ) ) ( not ( = ?auto_267023 ?auto_267034 ) ) ( not ( = ?auto_267024 ?auto_267025 ) ) ( not ( = ?auto_267024 ?auto_267026 ) ) ( not ( = ?auto_267024 ?auto_267027 ) ) ( not ( = ?auto_267024 ?auto_267028 ) ) ( not ( = ?auto_267024 ?auto_267029 ) ) ( not ( = ?auto_267024 ?auto_267030 ) ) ( not ( = ?auto_267024 ?auto_267031 ) ) ( not ( = ?auto_267024 ?auto_267032 ) ) ( not ( = ?auto_267024 ?auto_267033 ) ) ( not ( = ?auto_267024 ?auto_267034 ) ) ( not ( = ?auto_267025 ?auto_267026 ) ) ( not ( = ?auto_267025 ?auto_267027 ) ) ( not ( = ?auto_267025 ?auto_267028 ) ) ( not ( = ?auto_267025 ?auto_267029 ) ) ( not ( = ?auto_267025 ?auto_267030 ) ) ( not ( = ?auto_267025 ?auto_267031 ) ) ( not ( = ?auto_267025 ?auto_267032 ) ) ( not ( = ?auto_267025 ?auto_267033 ) ) ( not ( = ?auto_267025 ?auto_267034 ) ) ( not ( = ?auto_267026 ?auto_267027 ) ) ( not ( = ?auto_267026 ?auto_267028 ) ) ( not ( = ?auto_267026 ?auto_267029 ) ) ( not ( = ?auto_267026 ?auto_267030 ) ) ( not ( = ?auto_267026 ?auto_267031 ) ) ( not ( = ?auto_267026 ?auto_267032 ) ) ( not ( = ?auto_267026 ?auto_267033 ) ) ( not ( = ?auto_267026 ?auto_267034 ) ) ( not ( = ?auto_267027 ?auto_267028 ) ) ( not ( = ?auto_267027 ?auto_267029 ) ) ( not ( = ?auto_267027 ?auto_267030 ) ) ( not ( = ?auto_267027 ?auto_267031 ) ) ( not ( = ?auto_267027 ?auto_267032 ) ) ( not ( = ?auto_267027 ?auto_267033 ) ) ( not ( = ?auto_267027 ?auto_267034 ) ) ( not ( = ?auto_267028 ?auto_267029 ) ) ( not ( = ?auto_267028 ?auto_267030 ) ) ( not ( = ?auto_267028 ?auto_267031 ) ) ( not ( = ?auto_267028 ?auto_267032 ) ) ( not ( = ?auto_267028 ?auto_267033 ) ) ( not ( = ?auto_267028 ?auto_267034 ) ) ( not ( = ?auto_267029 ?auto_267030 ) ) ( not ( = ?auto_267029 ?auto_267031 ) ) ( not ( = ?auto_267029 ?auto_267032 ) ) ( not ( = ?auto_267029 ?auto_267033 ) ) ( not ( = ?auto_267029 ?auto_267034 ) ) ( not ( = ?auto_267030 ?auto_267031 ) ) ( not ( = ?auto_267030 ?auto_267032 ) ) ( not ( = ?auto_267030 ?auto_267033 ) ) ( not ( = ?auto_267030 ?auto_267034 ) ) ( not ( = ?auto_267031 ?auto_267032 ) ) ( not ( = ?auto_267031 ?auto_267033 ) ) ( not ( = ?auto_267031 ?auto_267034 ) ) ( not ( = ?auto_267032 ?auto_267033 ) ) ( not ( = ?auto_267032 ?auto_267034 ) ) ( not ( = ?auto_267033 ?auto_267034 ) ) ( ON ?auto_267032 ?auto_267033 ) ( ON ?auto_267031 ?auto_267032 ) ( ON ?auto_267030 ?auto_267031 ) ( ON ?auto_267029 ?auto_267030 ) ( ON ?auto_267028 ?auto_267029 ) ( ON ?auto_267027 ?auto_267028 ) ( CLEAR ?auto_267025 ) ( ON ?auto_267026 ?auto_267027 ) ( CLEAR ?auto_267026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_267022 ?auto_267023 ?auto_267024 ?auto_267025 ?auto_267026 )
      ( MAKE-12PILE ?auto_267022 ?auto_267023 ?auto_267024 ?auto_267025 ?auto_267026 ?auto_267027 ?auto_267028 ?auto_267029 ?auto_267030 ?auto_267031 ?auto_267032 ?auto_267033 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267047 - BLOCK
      ?auto_267048 - BLOCK
      ?auto_267049 - BLOCK
      ?auto_267050 - BLOCK
      ?auto_267051 - BLOCK
      ?auto_267052 - BLOCK
      ?auto_267053 - BLOCK
      ?auto_267054 - BLOCK
      ?auto_267055 - BLOCK
      ?auto_267056 - BLOCK
      ?auto_267057 - BLOCK
      ?auto_267058 - BLOCK
    )
    :vars
    (
      ?auto_267059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267058 ?auto_267059 ) ( ON-TABLE ?auto_267047 ) ( ON ?auto_267048 ?auto_267047 ) ( ON ?auto_267049 ?auto_267048 ) ( ON ?auto_267050 ?auto_267049 ) ( not ( = ?auto_267047 ?auto_267048 ) ) ( not ( = ?auto_267047 ?auto_267049 ) ) ( not ( = ?auto_267047 ?auto_267050 ) ) ( not ( = ?auto_267047 ?auto_267051 ) ) ( not ( = ?auto_267047 ?auto_267052 ) ) ( not ( = ?auto_267047 ?auto_267053 ) ) ( not ( = ?auto_267047 ?auto_267054 ) ) ( not ( = ?auto_267047 ?auto_267055 ) ) ( not ( = ?auto_267047 ?auto_267056 ) ) ( not ( = ?auto_267047 ?auto_267057 ) ) ( not ( = ?auto_267047 ?auto_267058 ) ) ( not ( = ?auto_267047 ?auto_267059 ) ) ( not ( = ?auto_267048 ?auto_267049 ) ) ( not ( = ?auto_267048 ?auto_267050 ) ) ( not ( = ?auto_267048 ?auto_267051 ) ) ( not ( = ?auto_267048 ?auto_267052 ) ) ( not ( = ?auto_267048 ?auto_267053 ) ) ( not ( = ?auto_267048 ?auto_267054 ) ) ( not ( = ?auto_267048 ?auto_267055 ) ) ( not ( = ?auto_267048 ?auto_267056 ) ) ( not ( = ?auto_267048 ?auto_267057 ) ) ( not ( = ?auto_267048 ?auto_267058 ) ) ( not ( = ?auto_267048 ?auto_267059 ) ) ( not ( = ?auto_267049 ?auto_267050 ) ) ( not ( = ?auto_267049 ?auto_267051 ) ) ( not ( = ?auto_267049 ?auto_267052 ) ) ( not ( = ?auto_267049 ?auto_267053 ) ) ( not ( = ?auto_267049 ?auto_267054 ) ) ( not ( = ?auto_267049 ?auto_267055 ) ) ( not ( = ?auto_267049 ?auto_267056 ) ) ( not ( = ?auto_267049 ?auto_267057 ) ) ( not ( = ?auto_267049 ?auto_267058 ) ) ( not ( = ?auto_267049 ?auto_267059 ) ) ( not ( = ?auto_267050 ?auto_267051 ) ) ( not ( = ?auto_267050 ?auto_267052 ) ) ( not ( = ?auto_267050 ?auto_267053 ) ) ( not ( = ?auto_267050 ?auto_267054 ) ) ( not ( = ?auto_267050 ?auto_267055 ) ) ( not ( = ?auto_267050 ?auto_267056 ) ) ( not ( = ?auto_267050 ?auto_267057 ) ) ( not ( = ?auto_267050 ?auto_267058 ) ) ( not ( = ?auto_267050 ?auto_267059 ) ) ( not ( = ?auto_267051 ?auto_267052 ) ) ( not ( = ?auto_267051 ?auto_267053 ) ) ( not ( = ?auto_267051 ?auto_267054 ) ) ( not ( = ?auto_267051 ?auto_267055 ) ) ( not ( = ?auto_267051 ?auto_267056 ) ) ( not ( = ?auto_267051 ?auto_267057 ) ) ( not ( = ?auto_267051 ?auto_267058 ) ) ( not ( = ?auto_267051 ?auto_267059 ) ) ( not ( = ?auto_267052 ?auto_267053 ) ) ( not ( = ?auto_267052 ?auto_267054 ) ) ( not ( = ?auto_267052 ?auto_267055 ) ) ( not ( = ?auto_267052 ?auto_267056 ) ) ( not ( = ?auto_267052 ?auto_267057 ) ) ( not ( = ?auto_267052 ?auto_267058 ) ) ( not ( = ?auto_267052 ?auto_267059 ) ) ( not ( = ?auto_267053 ?auto_267054 ) ) ( not ( = ?auto_267053 ?auto_267055 ) ) ( not ( = ?auto_267053 ?auto_267056 ) ) ( not ( = ?auto_267053 ?auto_267057 ) ) ( not ( = ?auto_267053 ?auto_267058 ) ) ( not ( = ?auto_267053 ?auto_267059 ) ) ( not ( = ?auto_267054 ?auto_267055 ) ) ( not ( = ?auto_267054 ?auto_267056 ) ) ( not ( = ?auto_267054 ?auto_267057 ) ) ( not ( = ?auto_267054 ?auto_267058 ) ) ( not ( = ?auto_267054 ?auto_267059 ) ) ( not ( = ?auto_267055 ?auto_267056 ) ) ( not ( = ?auto_267055 ?auto_267057 ) ) ( not ( = ?auto_267055 ?auto_267058 ) ) ( not ( = ?auto_267055 ?auto_267059 ) ) ( not ( = ?auto_267056 ?auto_267057 ) ) ( not ( = ?auto_267056 ?auto_267058 ) ) ( not ( = ?auto_267056 ?auto_267059 ) ) ( not ( = ?auto_267057 ?auto_267058 ) ) ( not ( = ?auto_267057 ?auto_267059 ) ) ( not ( = ?auto_267058 ?auto_267059 ) ) ( ON ?auto_267057 ?auto_267058 ) ( ON ?auto_267056 ?auto_267057 ) ( ON ?auto_267055 ?auto_267056 ) ( ON ?auto_267054 ?auto_267055 ) ( ON ?auto_267053 ?auto_267054 ) ( ON ?auto_267052 ?auto_267053 ) ( CLEAR ?auto_267050 ) ( ON ?auto_267051 ?auto_267052 ) ( CLEAR ?auto_267051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_267047 ?auto_267048 ?auto_267049 ?auto_267050 ?auto_267051 )
      ( MAKE-12PILE ?auto_267047 ?auto_267048 ?auto_267049 ?auto_267050 ?auto_267051 ?auto_267052 ?auto_267053 ?auto_267054 ?auto_267055 ?auto_267056 ?auto_267057 ?auto_267058 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267072 - BLOCK
      ?auto_267073 - BLOCK
      ?auto_267074 - BLOCK
      ?auto_267075 - BLOCK
      ?auto_267076 - BLOCK
      ?auto_267077 - BLOCK
      ?auto_267078 - BLOCK
      ?auto_267079 - BLOCK
      ?auto_267080 - BLOCK
      ?auto_267081 - BLOCK
      ?auto_267082 - BLOCK
      ?auto_267083 - BLOCK
    )
    :vars
    (
      ?auto_267084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267083 ?auto_267084 ) ( ON-TABLE ?auto_267072 ) ( ON ?auto_267073 ?auto_267072 ) ( ON ?auto_267074 ?auto_267073 ) ( not ( = ?auto_267072 ?auto_267073 ) ) ( not ( = ?auto_267072 ?auto_267074 ) ) ( not ( = ?auto_267072 ?auto_267075 ) ) ( not ( = ?auto_267072 ?auto_267076 ) ) ( not ( = ?auto_267072 ?auto_267077 ) ) ( not ( = ?auto_267072 ?auto_267078 ) ) ( not ( = ?auto_267072 ?auto_267079 ) ) ( not ( = ?auto_267072 ?auto_267080 ) ) ( not ( = ?auto_267072 ?auto_267081 ) ) ( not ( = ?auto_267072 ?auto_267082 ) ) ( not ( = ?auto_267072 ?auto_267083 ) ) ( not ( = ?auto_267072 ?auto_267084 ) ) ( not ( = ?auto_267073 ?auto_267074 ) ) ( not ( = ?auto_267073 ?auto_267075 ) ) ( not ( = ?auto_267073 ?auto_267076 ) ) ( not ( = ?auto_267073 ?auto_267077 ) ) ( not ( = ?auto_267073 ?auto_267078 ) ) ( not ( = ?auto_267073 ?auto_267079 ) ) ( not ( = ?auto_267073 ?auto_267080 ) ) ( not ( = ?auto_267073 ?auto_267081 ) ) ( not ( = ?auto_267073 ?auto_267082 ) ) ( not ( = ?auto_267073 ?auto_267083 ) ) ( not ( = ?auto_267073 ?auto_267084 ) ) ( not ( = ?auto_267074 ?auto_267075 ) ) ( not ( = ?auto_267074 ?auto_267076 ) ) ( not ( = ?auto_267074 ?auto_267077 ) ) ( not ( = ?auto_267074 ?auto_267078 ) ) ( not ( = ?auto_267074 ?auto_267079 ) ) ( not ( = ?auto_267074 ?auto_267080 ) ) ( not ( = ?auto_267074 ?auto_267081 ) ) ( not ( = ?auto_267074 ?auto_267082 ) ) ( not ( = ?auto_267074 ?auto_267083 ) ) ( not ( = ?auto_267074 ?auto_267084 ) ) ( not ( = ?auto_267075 ?auto_267076 ) ) ( not ( = ?auto_267075 ?auto_267077 ) ) ( not ( = ?auto_267075 ?auto_267078 ) ) ( not ( = ?auto_267075 ?auto_267079 ) ) ( not ( = ?auto_267075 ?auto_267080 ) ) ( not ( = ?auto_267075 ?auto_267081 ) ) ( not ( = ?auto_267075 ?auto_267082 ) ) ( not ( = ?auto_267075 ?auto_267083 ) ) ( not ( = ?auto_267075 ?auto_267084 ) ) ( not ( = ?auto_267076 ?auto_267077 ) ) ( not ( = ?auto_267076 ?auto_267078 ) ) ( not ( = ?auto_267076 ?auto_267079 ) ) ( not ( = ?auto_267076 ?auto_267080 ) ) ( not ( = ?auto_267076 ?auto_267081 ) ) ( not ( = ?auto_267076 ?auto_267082 ) ) ( not ( = ?auto_267076 ?auto_267083 ) ) ( not ( = ?auto_267076 ?auto_267084 ) ) ( not ( = ?auto_267077 ?auto_267078 ) ) ( not ( = ?auto_267077 ?auto_267079 ) ) ( not ( = ?auto_267077 ?auto_267080 ) ) ( not ( = ?auto_267077 ?auto_267081 ) ) ( not ( = ?auto_267077 ?auto_267082 ) ) ( not ( = ?auto_267077 ?auto_267083 ) ) ( not ( = ?auto_267077 ?auto_267084 ) ) ( not ( = ?auto_267078 ?auto_267079 ) ) ( not ( = ?auto_267078 ?auto_267080 ) ) ( not ( = ?auto_267078 ?auto_267081 ) ) ( not ( = ?auto_267078 ?auto_267082 ) ) ( not ( = ?auto_267078 ?auto_267083 ) ) ( not ( = ?auto_267078 ?auto_267084 ) ) ( not ( = ?auto_267079 ?auto_267080 ) ) ( not ( = ?auto_267079 ?auto_267081 ) ) ( not ( = ?auto_267079 ?auto_267082 ) ) ( not ( = ?auto_267079 ?auto_267083 ) ) ( not ( = ?auto_267079 ?auto_267084 ) ) ( not ( = ?auto_267080 ?auto_267081 ) ) ( not ( = ?auto_267080 ?auto_267082 ) ) ( not ( = ?auto_267080 ?auto_267083 ) ) ( not ( = ?auto_267080 ?auto_267084 ) ) ( not ( = ?auto_267081 ?auto_267082 ) ) ( not ( = ?auto_267081 ?auto_267083 ) ) ( not ( = ?auto_267081 ?auto_267084 ) ) ( not ( = ?auto_267082 ?auto_267083 ) ) ( not ( = ?auto_267082 ?auto_267084 ) ) ( not ( = ?auto_267083 ?auto_267084 ) ) ( ON ?auto_267082 ?auto_267083 ) ( ON ?auto_267081 ?auto_267082 ) ( ON ?auto_267080 ?auto_267081 ) ( ON ?auto_267079 ?auto_267080 ) ( ON ?auto_267078 ?auto_267079 ) ( ON ?auto_267077 ?auto_267078 ) ( ON ?auto_267076 ?auto_267077 ) ( CLEAR ?auto_267074 ) ( ON ?auto_267075 ?auto_267076 ) ( CLEAR ?auto_267075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_267072 ?auto_267073 ?auto_267074 ?auto_267075 )
      ( MAKE-12PILE ?auto_267072 ?auto_267073 ?auto_267074 ?auto_267075 ?auto_267076 ?auto_267077 ?auto_267078 ?auto_267079 ?auto_267080 ?auto_267081 ?auto_267082 ?auto_267083 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267097 - BLOCK
      ?auto_267098 - BLOCK
      ?auto_267099 - BLOCK
      ?auto_267100 - BLOCK
      ?auto_267101 - BLOCK
      ?auto_267102 - BLOCK
      ?auto_267103 - BLOCK
      ?auto_267104 - BLOCK
      ?auto_267105 - BLOCK
      ?auto_267106 - BLOCK
      ?auto_267107 - BLOCK
      ?auto_267108 - BLOCK
    )
    :vars
    (
      ?auto_267109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267108 ?auto_267109 ) ( ON-TABLE ?auto_267097 ) ( ON ?auto_267098 ?auto_267097 ) ( ON ?auto_267099 ?auto_267098 ) ( not ( = ?auto_267097 ?auto_267098 ) ) ( not ( = ?auto_267097 ?auto_267099 ) ) ( not ( = ?auto_267097 ?auto_267100 ) ) ( not ( = ?auto_267097 ?auto_267101 ) ) ( not ( = ?auto_267097 ?auto_267102 ) ) ( not ( = ?auto_267097 ?auto_267103 ) ) ( not ( = ?auto_267097 ?auto_267104 ) ) ( not ( = ?auto_267097 ?auto_267105 ) ) ( not ( = ?auto_267097 ?auto_267106 ) ) ( not ( = ?auto_267097 ?auto_267107 ) ) ( not ( = ?auto_267097 ?auto_267108 ) ) ( not ( = ?auto_267097 ?auto_267109 ) ) ( not ( = ?auto_267098 ?auto_267099 ) ) ( not ( = ?auto_267098 ?auto_267100 ) ) ( not ( = ?auto_267098 ?auto_267101 ) ) ( not ( = ?auto_267098 ?auto_267102 ) ) ( not ( = ?auto_267098 ?auto_267103 ) ) ( not ( = ?auto_267098 ?auto_267104 ) ) ( not ( = ?auto_267098 ?auto_267105 ) ) ( not ( = ?auto_267098 ?auto_267106 ) ) ( not ( = ?auto_267098 ?auto_267107 ) ) ( not ( = ?auto_267098 ?auto_267108 ) ) ( not ( = ?auto_267098 ?auto_267109 ) ) ( not ( = ?auto_267099 ?auto_267100 ) ) ( not ( = ?auto_267099 ?auto_267101 ) ) ( not ( = ?auto_267099 ?auto_267102 ) ) ( not ( = ?auto_267099 ?auto_267103 ) ) ( not ( = ?auto_267099 ?auto_267104 ) ) ( not ( = ?auto_267099 ?auto_267105 ) ) ( not ( = ?auto_267099 ?auto_267106 ) ) ( not ( = ?auto_267099 ?auto_267107 ) ) ( not ( = ?auto_267099 ?auto_267108 ) ) ( not ( = ?auto_267099 ?auto_267109 ) ) ( not ( = ?auto_267100 ?auto_267101 ) ) ( not ( = ?auto_267100 ?auto_267102 ) ) ( not ( = ?auto_267100 ?auto_267103 ) ) ( not ( = ?auto_267100 ?auto_267104 ) ) ( not ( = ?auto_267100 ?auto_267105 ) ) ( not ( = ?auto_267100 ?auto_267106 ) ) ( not ( = ?auto_267100 ?auto_267107 ) ) ( not ( = ?auto_267100 ?auto_267108 ) ) ( not ( = ?auto_267100 ?auto_267109 ) ) ( not ( = ?auto_267101 ?auto_267102 ) ) ( not ( = ?auto_267101 ?auto_267103 ) ) ( not ( = ?auto_267101 ?auto_267104 ) ) ( not ( = ?auto_267101 ?auto_267105 ) ) ( not ( = ?auto_267101 ?auto_267106 ) ) ( not ( = ?auto_267101 ?auto_267107 ) ) ( not ( = ?auto_267101 ?auto_267108 ) ) ( not ( = ?auto_267101 ?auto_267109 ) ) ( not ( = ?auto_267102 ?auto_267103 ) ) ( not ( = ?auto_267102 ?auto_267104 ) ) ( not ( = ?auto_267102 ?auto_267105 ) ) ( not ( = ?auto_267102 ?auto_267106 ) ) ( not ( = ?auto_267102 ?auto_267107 ) ) ( not ( = ?auto_267102 ?auto_267108 ) ) ( not ( = ?auto_267102 ?auto_267109 ) ) ( not ( = ?auto_267103 ?auto_267104 ) ) ( not ( = ?auto_267103 ?auto_267105 ) ) ( not ( = ?auto_267103 ?auto_267106 ) ) ( not ( = ?auto_267103 ?auto_267107 ) ) ( not ( = ?auto_267103 ?auto_267108 ) ) ( not ( = ?auto_267103 ?auto_267109 ) ) ( not ( = ?auto_267104 ?auto_267105 ) ) ( not ( = ?auto_267104 ?auto_267106 ) ) ( not ( = ?auto_267104 ?auto_267107 ) ) ( not ( = ?auto_267104 ?auto_267108 ) ) ( not ( = ?auto_267104 ?auto_267109 ) ) ( not ( = ?auto_267105 ?auto_267106 ) ) ( not ( = ?auto_267105 ?auto_267107 ) ) ( not ( = ?auto_267105 ?auto_267108 ) ) ( not ( = ?auto_267105 ?auto_267109 ) ) ( not ( = ?auto_267106 ?auto_267107 ) ) ( not ( = ?auto_267106 ?auto_267108 ) ) ( not ( = ?auto_267106 ?auto_267109 ) ) ( not ( = ?auto_267107 ?auto_267108 ) ) ( not ( = ?auto_267107 ?auto_267109 ) ) ( not ( = ?auto_267108 ?auto_267109 ) ) ( ON ?auto_267107 ?auto_267108 ) ( ON ?auto_267106 ?auto_267107 ) ( ON ?auto_267105 ?auto_267106 ) ( ON ?auto_267104 ?auto_267105 ) ( ON ?auto_267103 ?auto_267104 ) ( ON ?auto_267102 ?auto_267103 ) ( ON ?auto_267101 ?auto_267102 ) ( CLEAR ?auto_267099 ) ( ON ?auto_267100 ?auto_267101 ) ( CLEAR ?auto_267100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_267097 ?auto_267098 ?auto_267099 ?auto_267100 )
      ( MAKE-12PILE ?auto_267097 ?auto_267098 ?auto_267099 ?auto_267100 ?auto_267101 ?auto_267102 ?auto_267103 ?auto_267104 ?auto_267105 ?auto_267106 ?auto_267107 ?auto_267108 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267122 - BLOCK
      ?auto_267123 - BLOCK
      ?auto_267124 - BLOCK
      ?auto_267125 - BLOCK
      ?auto_267126 - BLOCK
      ?auto_267127 - BLOCK
      ?auto_267128 - BLOCK
      ?auto_267129 - BLOCK
      ?auto_267130 - BLOCK
      ?auto_267131 - BLOCK
      ?auto_267132 - BLOCK
      ?auto_267133 - BLOCK
    )
    :vars
    (
      ?auto_267134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267133 ?auto_267134 ) ( ON-TABLE ?auto_267122 ) ( ON ?auto_267123 ?auto_267122 ) ( not ( = ?auto_267122 ?auto_267123 ) ) ( not ( = ?auto_267122 ?auto_267124 ) ) ( not ( = ?auto_267122 ?auto_267125 ) ) ( not ( = ?auto_267122 ?auto_267126 ) ) ( not ( = ?auto_267122 ?auto_267127 ) ) ( not ( = ?auto_267122 ?auto_267128 ) ) ( not ( = ?auto_267122 ?auto_267129 ) ) ( not ( = ?auto_267122 ?auto_267130 ) ) ( not ( = ?auto_267122 ?auto_267131 ) ) ( not ( = ?auto_267122 ?auto_267132 ) ) ( not ( = ?auto_267122 ?auto_267133 ) ) ( not ( = ?auto_267122 ?auto_267134 ) ) ( not ( = ?auto_267123 ?auto_267124 ) ) ( not ( = ?auto_267123 ?auto_267125 ) ) ( not ( = ?auto_267123 ?auto_267126 ) ) ( not ( = ?auto_267123 ?auto_267127 ) ) ( not ( = ?auto_267123 ?auto_267128 ) ) ( not ( = ?auto_267123 ?auto_267129 ) ) ( not ( = ?auto_267123 ?auto_267130 ) ) ( not ( = ?auto_267123 ?auto_267131 ) ) ( not ( = ?auto_267123 ?auto_267132 ) ) ( not ( = ?auto_267123 ?auto_267133 ) ) ( not ( = ?auto_267123 ?auto_267134 ) ) ( not ( = ?auto_267124 ?auto_267125 ) ) ( not ( = ?auto_267124 ?auto_267126 ) ) ( not ( = ?auto_267124 ?auto_267127 ) ) ( not ( = ?auto_267124 ?auto_267128 ) ) ( not ( = ?auto_267124 ?auto_267129 ) ) ( not ( = ?auto_267124 ?auto_267130 ) ) ( not ( = ?auto_267124 ?auto_267131 ) ) ( not ( = ?auto_267124 ?auto_267132 ) ) ( not ( = ?auto_267124 ?auto_267133 ) ) ( not ( = ?auto_267124 ?auto_267134 ) ) ( not ( = ?auto_267125 ?auto_267126 ) ) ( not ( = ?auto_267125 ?auto_267127 ) ) ( not ( = ?auto_267125 ?auto_267128 ) ) ( not ( = ?auto_267125 ?auto_267129 ) ) ( not ( = ?auto_267125 ?auto_267130 ) ) ( not ( = ?auto_267125 ?auto_267131 ) ) ( not ( = ?auto_267125 ?auto_267132 ) ) ( not ( = ?auto_267125 ?auto_267133 ) ) ( not ( = ?auto_267125 ?auto_267134 ) ) ( not ( = ?auto_267126 ?auto_267127 ) ) ( not ( = ?auto_267126 ?auto_267128 ) ) ( not ( = ?auto_267126 ?auto_267129 ) ) ( not ( = ?auto_267126 ?auto_267130 ) ) ( not ( = ?auto_267126 ?auto_267131 ) ) ( not ( = ?auto_267126 ?auto_267132 ) ) ( not ( = ?auto_267126 ?auto_267133 ) ) ( not ( = ?auto_267126 ?auto_267134 ) ) ( not ( = ?auto_267127 ?auto_267128 ) ) ( not ( = ?auto_267127 ?auto_267129 ) ) ( not ( = ?auto_267127 ?auto_267130 ) ) ( not ( = ?auto_267127 ?auto_267131 ) ) ( not ( = ?auto_267127 ?auto_267132 ) ) ( not ( = ?auto_267127 ?auto_267133 ) ) ( not ( = ?auto_267127 ?auto_267134 ) ) ( not ( = ?auto_267128 ?auto_267129 ) ) ( not ( = ?auto_267128 ?auto_267130 ) ) ( not ( = ?auto_267128 ?auto_267131 ) ) ( not ( = ?auto_267128 ?auto_267132 ) ) ( not ( = ?auto_267128 ?auto_267133 ) ) ( not ( = ?auto_267128 ?auto_267134 ) ) ( not ( = ?auto_267129 ?auto_267130 ) ) ( not ( = ?auto_267129 ?auto_267131 ) ) ( not ( = ?auto_267129 ?auto_267132 ) ) ( not ( = ?auto_267129 ?auto_267133 ) ) ( not ( = ?auto_267129 ?auto_267134 ) ) ( not ( = ?auto_267130 ?auto_267131 ) ) ( not ( = ?auto_267130 ?auto_267132 ) ) ( not ( = ?auto_267130 ?auto_267133 ) ) ( not ( = ?auto_267130 ?auto_267134 ) ) ( not ( = ?auto_267131 ?auto_267132 ) ) ( not ( = ?auto_267131 ?auto_267133 ) ) ( not ( = ?auto_267131 ?auto_267134 ) ) ( not ( = ?auto_267132 ?auto_267133 ) ) ( not ( = ?auto_267132 ?auto_267134 ) ) ( not ( = ?auto_267133 ?auto_267134 ) ) ( ON ?auto_267132 ?auto_267133 ) ( ON ?auto_267131 ?auto_267132 ) ( ON ?auto_267130 ?auto_267131 ) ( ON ?auto_267129 ?auto_267130 ) ( ON ?auto_267128 ?auto_267129 ) ( ON ?auto_267127 ?auto_267128 ) ( ON ?auto_267126 ?auto_267127 ) ( ON ?auto_267125 ?auto_267126 ) ( CLEAR ?auto_267123 ) ( ON ?auto_267124 ?auto_267125 ) ( CLEAR ?auto_267124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_267122 ?auto_267123 ?auto_267124 )
      ( MAKE-12PILE ?auto_267122 ?auto_267123 ?auto_267124 ?auto_267125 ?auto_267126 ?auto_267127 ?auto_267128 ?auto_267129 ?auto_267130 ?auto_267131 ?auto_267132 ?auto_267133 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267147 - BLOCK
      ?auto_267148 - BLOCK
      ?auto_267149 - BLOCK
      ?auto_267150 - BLOCK
      ?auto_267151 - BLOCK
      ?auto_267152 - BLOCK
      ?auto_267153 - BLOCK
      ?auto_267154 - BLOCK
      ?auto_267155 - BLOCK
      ?auto_267156 - BLOCK
      ?auto_267157 - BLOCK
      ?auto_267158 - BLOCK
    )
    :vars
    (
      ?auto_267159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267158 ?auto_267159 ) ( ON-TABLE ?auto_267147 ) ( ON ?auto_267148 ?auto_267147 ) ( not ( = ?auto_267147 ?auto_267148 ) ) ( not ( = ?auto_267147 ?auto_267149 ) ) ( not ( = ?auto_267147 ?auto_267150 ) ) ( not ( = ?auto_267147 ?auto_267151 ) ) ( not ( = ?auto_267147 ?auto_267152 ) ) ( not ( = ?auto_267147 ?auto_267153 ) ) ( not ( = ?auto_267147 ?auto_267154 ) ) ( not ( = ?auto_267147 ?auto_267155 ) ) ( not ( = ?auto_267147 ?auto_267156 ) ) ( not ( = ?auto_267147 ?auto_267157 ) ) ( not ( = ?auto_267147 ?auto_267158 ) ) ( not ( = ?auto_267147 ?auto_267159 ) ) ( not ( = ?auto_267148 ?auto_267149 ) ) ( not ( = ?auto_267148 ?auto_267150 ) ) ( not ( = ?auto_267148 ?auto_267151 ) ) ( not ( = ?auto_267148 ?auto_267152 ) ) ( not ( = ?auto_267148 ?auto_267153 ) ) ( not ( = ?auto_267148 ?auto_267154 ) ) ( not ( = ?auto_267148 ?auto_267155 ) ) ( not ( = ?auto_267148 ?auto_267156 ) ) ( not ( = ?auto_267148 ?auto_267157 ) ) ( not ( = ?auto_267148 ?auto_267158 ) ) ( not ( = ?auto_267148 ?auto_267159 ) ) ( not ( = ?auto_267149 ?auto_267150 ) ) ( not ( = ?auto_267149 ?auto_267151 ) ) ( not ( = ?auto_267149 ?auto_267152 ) ) ( not ( = ?auto_267149 ?auto_267153 ) ) ( not ( = ?auto_267149 ?auto_267154 ) ) ( not ( = ?auto_267149 ?auto_267155 ) ) ( not ( = ?auto_267149 ?auto_267156 ) ) ( not ( = ?auto_267149 ?auto_267157 ) ) ( not ( = ?auto_267149 ?auto_267158 ) ) ( not ( = ?auto_267149 ?auto_267159 ) ) ( not ( = ?auto_267150 ?auto_267151 ) ) ( not ( = ?auto_267150 ?auto_267152 ) ) ( not ( = ?auto_267150 ?auto_267153 ) ) ( not ( = ?auto_267150 ?auto_267154 ) ) ( not ( = ?auto_267150 ?auto_267155 ) ) ( not ( = ?auto_267150 ?auto_267156 ) ) ( not ( = ?auto_267150 ?auto_267157 ) ) ( not ( = ?auto_267150 ?auto_267158 ) ) ( not ( = ?auto_267150 ?auto_267159 ) ) ( not ( = ?auto_267151 ?auto_267152 ) ) ( not ( = ?auto_267151 ?auto_267153 ) ) ( not ( = ?auto_267151 ?auto_267154 ) ) ( not ( = ?auto_267151 ?auto_267155 ) ) ( not ( = ?auto_267151 ?auto_267156 ) ) ( not ( = ?auto_267151 ?auto_267157 ) ) ( not ( = ?auto_267151 ?auto_267158 ) ) ( not ( = ?auto_267151 ?auto_267159 ) ) ( not ( = ?auto_267152 ?auto_267153 ) ) ( not ( = ?auto_267152 ?auto_267154 ) ) ( not ( = ?auto_267152 ?auto_267155 ) ) ( not ( = ?auto_267152 ?auto_267156 ) ) ( not ( = ?auto_267152 ?auto_267157 ) ) ( not ( = ?auto_267152 ?auto_267158 ) ) ( not ( = ?auto_267152 ?auto_267159 ) ) ( not ( = ?auto_267153 ?auto_267154 ) ) ( not ( = ?auto_267153 ?auto_267155 ) ) ( not ( = ?auto_267153 ?auto_267156 ) ) ( not ( = ?auto_267153 ?auto_267157 ) ) ( not ( = ?auto_267153 ?auto_267158 ) ) ( not ( = ?auto_267153 ?auto_267159 ) ) ( not ( = ?auto_267154 ?auto_267155 ) ) ( not ( = ?auto_267154 ?auto_267156 ) ) ( not ( = ?auto_267154 ?auto_267157 ) ) ( not ( = ?auto_267154 ?auto_267158 ) ) ( not ( = ?auto_267154 ?auto_267159 ) ) ( not ( = ?auto_267155 ?auto_267156 ) ) ( not ( = ?auto_267155 ?auto_267157 ) ) ( not ( = ?auto_267155 ?auto_267158 ) ) ( not ( = ?auto_267155 ?auto_267159 ) ) ( not ( = ?auto_267156 ?auto_267157 ) ) ( not ( = ?auto_267156 ?auto_267158 ) ) ( not ( = ?auto_267156 ?auto_267159 ) ) ( not ( = ?auto_267157 ?auto_267158 ) ) ( not ( = ?auto_267157 ?auto_267159 ) ) ( not ( = ?auto_267158 ?auto_267159 ) ) ( ON ?auto_267157 ?auto_267158 ) ( ON ?auto_267156 ?auto_267157 ) ( ON ?auto_267155 ?auto_267156 ) ( ON ?auto_267154 ?auto_267155 ) ( ON ?auto_267153 ?auto_267154 ) ( ON ?auto_267152 ?auto_267153 ) ( ON ?auto_267151 ?auto_267152 ) ( ON ?auto_267150 ?auto_267151 ) ( CLEAR ?auto_267148 ) ( ON ?auto_267149 ?auto_267150 ) ( CLEAR ?auto_267149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_267147 ?auto_267148 ?auto_267149 )
      ( MAKE-12PILE ?auto_267147 ?auto_267148 ?auto_267149 ?auto_267150 ?auto_267151 ?auto_267152 ?auto_267153 ?auto_267154 ?auto_267155 ?auto_267156 ?auto_267157 ?auto_267158 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267172 - BLOCK
      ?auto_267173 - BLOCK
      ?auto_267174 - BLOCK
      ?auto_267175 - BLOCK
      ?auto_267176 - BLOCK
      ?auto_267177 - BLOCK
      ?auto_267178 - BLOCK
      ?auto_267179 - BLOCK
      ?auto_267180 - BLOCK
      ?auto_267181 - BLOCK
      ?auto_267182 - BLOCK
      ?auto_267183 - BLOCK
    )
    :vars
    (
      ?auto_267184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267183 ?auto_267184 ) ( ON-TABLE ?auto_267172 ) ( not ( = ?auto_267172 ?auto_267173 ) ) ( not ( = ?auto_267172 ?auto_267174 ) ) ( not ( = ?auto_267172 ?auto_267175 ) ) ( not ( = ?auto_267172 ?auto_267176 ) ) ( not ( = ?auto_267172 ?auto_267177 ) ) ( not ( = ?auto_267172 ?auto_267178 ) ) ( not ( = ?auto_267172 ?auto_267179 ) ) ( not ( = ?auto_267172 ?auto_267180 ) ) ( not ( = ?auto_267172 ?auto_267181 ) ) ( not ( = ?auto_267172 ?auto_267182 ) ) ( not ( = ?auto_267172 ?auto_267183 ) ) ( not ( = ?auto_267172 ?auto_267184 ) ) ( not ( = ?auto_267173 ?auto_267174 ) ) ( not ( = ?auto_267173 ?auto_267175 ) ) ( not ( = ?auto_267173 ?auto_267176 ) ) ( not ( = ?auto_267173 ?auto_267177 ) ) ( not ( = ?auto_267173 ?auto_267178 ) ) ( not ( = ?auto_267173 ?auto_267179 ) ) ( not ( = ?auto_267173 ?auto_267180 ) ) ( not ( = ?auto_267173 ?auto_267181 ) ) ( not ( = ?auto_267173 ?auto_267182 ) ) ( not ( = ?auto_267173 ?auto_267183 ) ) ( not ( = ?auto_267173 ?auto_267184 ) ) ( not ( = ?auto_267174 ?auto_267175 ) ) ( not ( = ?auto_267174 ?auto_267176 ) ) ( not ( = ?auto_267174 ?auto_267177 ) ) ( not ( = ?auto_267174 ?auto_267178 ) ) ( not ( = ?auto_267174 ?auto_267179 ) ) ( not ( = ?auto_267174 ?auto_267180 ) ) ( not ( = ?auto_267174 ?auto_267181 ) ) ( not ( = ?auto_267174 ?auto_267182 ) ) ( not ( = ?auto_267174 ?auto_267183 ) ) ( not ( = ?auto_267174 ?auto_267184 ) ) ( not ( = ?auto_267175 ?auto_267176 ) ) ( not ( = ?auto_267175 ?auto_267177 ) ) ( not ( = ?auto_267175 ?auto_267178 ) ) ( not ( = ?auto_267175 ?auto_267179 ) ) ( not ( = ?auto_267175 ?auto_267180 ) ) ( not ( = ?auto_267175 ?auto_267181 ) ) ( not ( = ?auto_267175 ?auto_267182 ) ) ( not ( = ?auto_267175 ?auto_267183 ) ) ( not ( = ?auto_267175 ?auto_267184 ) ) ( not ( = ?auto_267176 ?auto_267177 ) ) ( not ( = ?auto_267176 ?auto_267178 ) ) ( not ( = ?auto_267176 ?auto_267179 ) ) ( not ( = ?auto_267176 ?auto_267180 ) ) ( not ( = ?auto_267176 ?auto_267181 ) ) ( not ( = ?auto_267176 ?auto_267182 ) ) ( not ( = ?auto_267176 ?auto_267183 ) ) ( not ( = ?auto_267176 ?auto_267184 ) ) ( not ( = ?auto_267177 ?auto_267178 ) ) ( not ( = ?auto_267177 ?auto_267179 ) ) ( not ( = ?auto_267177 ?auto_267180 ) ) ( not ( = ?auto_267177 ?auto_267181 ) ) ( not ( = ?auto_267177 ?auto_267182 ) ) ( not ( = ?auto_267177 ?auto_267183 ) ) ( not ( = ?auto_267177 ?auto_267184 ) ) ( not ( = ?auto_267178 ?auto_267179 ) ) ( not ( = ?auto_267178 ?auto_267180 ) ) ( not ( = ?auto_267178 ?auto_267181 ) ) ( not ( = ?auto_267178 ?auto_267182 ) ) ( not ( = ?auto_267178 ?auto_267183 ) ) ( not ( = ?auto_267178 ?auto_267184 ) ) ( not ( = ?auto_267179 ?auto_267180 ) ) ( not ( = ?auto_267179 ?auto_267181 ) ) ( not ( = ?auto_267179 ?auto_267182 ) ) ( not ( = ?auto_267179 ?auto_267183 ) ) ( not ( = ?auto_267179 ?auto_267184 ) ) ( not ( = ?auto_267180 ?auto_267181 ) ) ( not ( = ?auto_267180 ?auto_267182 ) ) ( not ( = ?auto_267180 ?auto_267183 ) ) ( not ( = ?auto_267180 ?auto_267184 ) ) ( not ( = ?auto_267181 ?auto_267182 ) ) ( not ( = ?auto_267181 ?auto_267183 ) ) ( not ( = ?auto_267181 ?auto_267184 ) ) ( not ( = ?auto_267182 ?auto_267183 ) ) ( not ( = ?auto_267182 ?auto_267184 ) ) ( not ( = ?auto_267183 ?auto_267184 ) ) ( ON ?auto_267182 ?auto_267183 ) ( ON ?auto_267181 ?auto_267182 ) ( ON ?auto_267180 ?auto_267181 ) ( ON ?auto_267179 ?auto_267180 ) ( ON ?auto_267178 ?auto_267179 ) ( ON ?auto_267177 ?auto_267178 ) ( ON ?auto_267176 ?auto_267177 ) ( ON ?auto_267175 ?auto_267176 ) ( ON ?auto_267174 ?auto_267175 ) ( CLEAR ?auto_267172 ) ( ON ?auto_267173 ?auto_267174 ) ( CLEAR ?auto_267173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_267172 ?auto_267173 )
      ( MAKE-12PILE ?auto_267172 ?auto_267173 ?auto_267174 ?auto_267175 ?auto_267176 ?auto_267177 ?auto_267178 ?auto_267179 ?auto_267180 ?auto_267181 ?auto_267182 ?auto_267183 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267197 - BLOCK
      ?auto_267198 - BLOCK
      ?auto_267199 - BLOCK
      ?auto_267200 - BLOCK
      ?auto_267201 - BLOCK
      ?auto_267202 - BLOCK
      ?auto_267203 - BLOCK
      ?auto_267204 - BLOCK
      ?auto_267205 - BLOCK
      ?auto_267206 - BLOCK
      ?auto_267207 - BLOCK
      ?auto_267208 - BLOCK
    )
    :vars
    (
      ?auto_267209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267208 ?auto_267209 ) ( ON-TABLE ?auto_267197 ) ( not ( = ?auto_267197 ?auto_267198 ) ) ( not ( = ?auto_267197 ?auto_267199 ) ) ( not ( = ?auto_267197 ?auto_267200 ) ) ( not ( = ?auto_267197 ?auto_267201 ) ) ( not ( = ?auto_267197 ?auto_267202 ) ) ( not ( = ?auto_267197 ?auto_267203 ) ) ( not ( = ?auto_267197 ?auto_267204 ) ) ( not ( = ?auto_267197 ?auto_267205 ) ) ( not ( = ?auto_267197 ?auto_267206 ) ) ( not ( = ?auto_267197 ?auto_267207 ) ) ( not ( = ?auto_267197 ?auto_267208 ) ) ( not ( = ?auto_267197 ?auto_267209 ) ) ( not ( = ?auto_267198 ?auto_267199 ) ) ( not ( = ?auto_267198 ?auto_267200 ) ) ( not ( = ?auto_267198 ?auto_267201 ) ) ( not ( = ?auto_267198 ?auto_267202 ) ) ( not ( = ?auto_267198 ?auto_267203 ) ) ( not ( = ?auto_267198 ?auto_267204 ) ) ( not ( = ?auto_267198 ?auto_267205 ) ) ( not ( = ?auto_267198 ?auto_267206 ) ) ( not ( = ?auto_267198 ?auto_267207 ) ) ( not ( = ?auto_267198 ?auto_267208 ) ) ( not ( = ?auto_267198 ?auto_267209 ) ) ( not ( = ?auto_267199 ?auto_267200 ) ) ( not ( = ?auto_267199 ?auto_267201 ) ) ( not ( = ?auto_267199 ?auto_267202 ) ) ( not ( = ?auto_267199 ?auto_267203 ) ) ( not ( = ?auto_267199 ?auto_267204 ) ) ( not ( = ?auto_267199 ?auto_267205 ) ) ( not ( = ?auto_267199 ?auto_267206 ) ) ( not ( = ?auto_267199 ?auto_267207 ) ) ( not ( = ?auto_267199 ?auto_267208 ) ) ( not ( = ?auto_267199 ?auto_267209 ) ) ( not ( = ?auto_267200 ?auto_267201 ) ) ( not ( = ?auto_267200 ?auto_267202 ) ) ( not ( = ?auto_267200 ?auto_267203 ) ) ( not ( = ?auto_267200 ?auto_267204 ) ) ( not ( = ?auto_267200 ?auto_267205 ) ) ( not ( = ?auto_267200 ?auto_267206 ) ) ( not ( = ?auto_267200 ?auto_267207 ) ) ( not ( = ?auto_267200 ?auto_267208 ) ) ( not ( = ?auto_267200 ?auto_267209 ) ) ( not ( = ?auto_267201 ?auto_267202 ) ) ( not ( = ?auto_267201 ?auto_267203 ) ) ( not ( = ?auto_267201 ?auto_267204 ) ) ( not ( = ?auto_267201 ?auto_267205 ) ) ( not ( = ?auto_267201 ?auto_267206 ) ) ( not ( = ?auto_267201 ?auto_267207 ) ) ( not ( = ?auto_267201 ?auto_267208 ) ) ( not ( = ?auto_267201 ?auto_267209 ) ) ( not ( = ?auto_267202 ?auto_267203 ) ) ( not ( = ?auto_267202 ?auto_267204 ) ) ( not ( = ?auto_267202 ?auto_267205 ) ) ( not ( = ?auto_267202 ?auto_267206 ) ) ( not ( = ?auto_267202 ?auto_267207 ) ) ( not ( = ?auto_267202 ?auto_267208 ) ) ( not ( = ?auto_267202 ?auto_267209 ) ) ( not ( = ?auto_267203 ?auto_267204 ) ) ( not ( = ?auto_267203 ?auto_267205 ) ) ( not ( = ?auto_267203 ?auto_267206 ) ) ( not ( = ?auto_267203 ?auto_267207 ) ) ( not ( = ?auto_267203 ?auto_267208 ) ) ( not ( = ?auto_267203 ?auto_267209 ) ) ( not ( = ?auto_267204 ?auto_267205 ) ) ( not ( = ?auto_267204 ?auto_267206 ) ) ( not ( = ?auto_267204 ?auto_267207 ) ) ( not ( = ?auto_267204 ?auto_267208 ) ) ( not ( = ?auto_267204 ?auto_267209 ) ) ( not ( = ?auto_267205 ?auto_267206 ) ) ( not ( = ?auto_267205 ?auto_267207 ) ) ( not ( = ?auto_267205 ?auto_267208 ) ) ( not ( = ?auto_267205 ?auto_267209 ) ) ( not ( = ?auto_267206 ?auto_267207 ) ) ( not ( = ?auto_267206 ?auto_267208 ) ) ( not ( = ?auto_267206 ?auto_267209 ) ) ( not ( = ?auto_267207 ?auto_267208 ) ) ( not ( = ?auto_267207 ?auto_267209 ) ) ( not ( = ?auto_267208 ?auto_267209 ) ) ( ON ?auto_267207 ?auto_267208 ) ( ON ?auto_267206 ?auto_267207 ) ( ON ?auto_267205 ?auto_267206 ) ( ON ?auto_267204 ?auto_267205 ) ( ON ?auto_267203 ?auto_267204 ) ( ON ?auto_267202 ?auto_267203 ) ( ON ?auto_267201 ?auto_267202 ) ( ON ?auto_267200 ?auto_267201 ) ( ON ?auto_267199 ?auto_267200 ) ( CLEAR ?auto_267197 ) ( ON ?auto_267198 ?auto_267199 ) ( CLEAR ?auto_267198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_267197 ?auto_267198 )
      ( MAKE-12PILE ?auto_267197 ?auto_267198 ?auto_267199 ?auto_267200 ?auto_267201 ?auto_267202 ?auto_267203 ?auto_267204 ?auto_267205 ?auto_267206 ?auto_267207 ?auto_267208 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267222 - BLOCK
      ?auto_267223 - BLOCK
      ?auto_267224 - BLOCK
      ?auto_267225 - BLOCK
      ?auto_267226 - BLOCK
      ?auto_267227 - BLOCK
      ?auto_267228 - BLOCK
      ?auto_267229 - BLOCK
      ?auto_267230 - BLOCK
      ?auto_267231 - BLOCK
      ?auto_267232 - BLOCK
      ?auto_267233 - BLOCK
    )
    :vars
    (
      ?auto_267234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267233 ?auto_267234 ) ( not ( = ?auto_267222 ?auto_267223 ) ) ( not ( = ?auto_267222 ?auto_267224 ) ) ( not ( = ?auto_267222 ?auto_267225 ) ) ( not ( = ?auto_267222 ?auto_267226 ) ) ( not ( = ?auto_267222 ?auto_267227 ) ) ( not ( = ?auto_267222 ?auto_267228 ) ) ( not ( = ?auto_267222 ?auto_267229 ) ) ( not ( = ?auto_267222 ?auto_267230 ) ) ( not ( = ?auto_267222 ?auto_267231 ) ) ( not ( = ?auto_267222 ?auto_267232 ) ) ( not ( = ?auto_267222 ?auto_267233 ) ) ( not ( = ?auto_267222 ?auto_267234 ) ) ( not ( = ?auto_267223 ?auto_267224 ) ) ( not ( = ?auto_267223 ?auto_267225 ) ) ( not ( = ?auto_267223 ?auto_267226 ) ) ( not ( = ?auto_267223 ?auto_267227 ) ) ( not ( = ?auto_267223 ?auto_267228 ) ) ( not ( = ?auto_267223 ?auto_267229 ) ) ( not ( = ?auto_267223 ?auto_267230 ) ) ( not ( = ?auto_267223 ?auto_267231 ) ) ( not ( = ?auto_267223 ?auto_267232 ) ) ( not ( = ?auto_267223 ?auto_267233 ) ) ( not ( = ?auto_267223 ?auto_267234 ) ) ( not ( = ?auto_267224 ?auto_267225 ) ) ( not ( = ?auto_267224 ?auto_267226 ) ) ( not ( = ?auto_267224 ?auto_267227 ) ) ( not ( = ?auto_267224 ?auto_267228 ) ) ( not ( = ?auto_267224 ?auto_267229 ) ) ( not ( = ?auto_267224 ?auto_267230 ) ) ( not ( = ?auto_267224 ?auto_267231 ) ) ( not ( = ?auto_267224 ?auto_267232 ) ) ( not ( = ?auto_267224 ?auto_267233 ) ) ( not ( = ?auto_267224 ?auto_267234 ) ) ( not ( = ?auto_267225 ?auto_267226 ) ) ( not ( = ?auto_267225 ?auto_267227 ) ) ( not ( = ?auto_267225 ?auto_267228 ) ) ( not ( = ?auto_267225 ?auto_267229 ) ) ( not ( = ?auto_267225 ?auto_267230 ) ) ( not ( = ?auto_267225 ?auto_267231 ) ) ( not ( = ?auto_267225 ?auto_267232 ) ) ( not ( = ?auto_267225 ?auto_267233 ) ) ( not ( = ?auto_267225 ?auto_267234 ) ) ( not ( = ?auto_267226 ?auto_267227 ) ) ( not ( = ?auto_267226 ?auto_267228 ) ) ( not ( = ?auto_267226 ?auto_267229 ) ) ( not ( = ?auto_267226 ?auto_267230 ) ) ( not ( = ?auto_267226 ?auto_267231 ) ) ( not ( = ?auto_267226 ?auto_267232 ) ) ( not ( = ?auto_267226 ?auto_267233 ) ) ( not ( = ?auto_267226 ?auto_267234 ) ) ( not ( = ?auto_267227 ?auto_267228 ) ) ( not ( = ?auto_267227 ?auto_267229 ) ) ( not ( = ?auto_267227 ?auto_267230 ) ) ( not ( = ?auto_267227 ?auto_267231 ) ) ( not ( = ?auto_267227 ?auto_267232 ) ) ( not ( = ?auto_267227 ?auto_267233 ) ) ( not ( = ?auto_267227 ?auto_267234 ) ) ( not ( = ?auto_267228 ?auto_267229 ) ) ( not ( = ?auto_267228 ?auto_267230 ) ) ( not ( = ?auto_267228 ?auto_267231 ) ) ( not ( = ?auto_267228 ?auto_267232 ) ) ( not ( = ?auto_267228 ?auto_267233 ) ) ( not ( = ?auto_267228 ?auto_267234 ) ) ( not ( = ?auto_267229 ?auto_267230 ) ) ( not ( = ?auto_267229 ?auto_267231 ) ) ( not ( = ?auto_267229 ?auto_267232 ) ) ( not ( = ?auto_267229 ?auto_267233 ) ) ( not ( = ?auto_267229 ?auto_267234 ) ) ( not ( = ?auto_267230 ?auto_267231 ) ) ( not ( = ?auto_267230 ?auto_267232 ) ) ( not ( = ?auto_267230 ?auto_267233 ) ) ( not ( = ?auto_267230 ?auto_267234 ) ) ( not ( = ?auto_267231 ?auto_267232 ) ) ( not ( = ?auto_267231 ?auto_267233 ) ) ( not ( = ?auto_267231 ?auto_267234 ) ) ( not ( = ?auto_267232 ?auto_267233 ) ) ( not ( = ?auto_267232 ?auto_267234 ) ) ( not ( = ?auto_267233 ?auto_267234 ) ) ( ON ?auto_267232 ?auto_267233 ) ( ON ?auto_267231 ?auto_267232 ) ( ON ?auto_267230 ?auto_267231 ) ( ON ?auto_267229 ?auto_267230 ) ( ON ?auto_267228 ?auto_267229 ) ( ON ?auto_267227 ?auto_267228 ) ( ON ?auto_267226 ?auto_267227 ) ( ON ?auto_267225 ?auto_267226 ) ( ON ?auto_267224 ?auto_267225 ) ( ON ?auto_267223 ?auto_267224 ) ( ON ?auto_267222 ?auto_267223 ) ( CLEAR ?auto_267222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267222 )
      ( MAKE-12PILE ?auto_267222 ?auto_267223 ?auto_267224 ?auto_267225 ?auto_267226 ?auto_267227 ?auto_267228 ?auto_267229 ?auto_267230 ?auto_267231 ?auto_267232 ?auto_267233 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_267247 - BLOCK
      ?auto_267248 - BLOCK
      ?auto_267249 - BLOCK
      ?auto_267250 - BLOCK
      ?auto_267251 - BLOCK
      ?auto_267252 - BLOCK
      ?auto_267253 - BLOCK
      ?auto_267254 - BLOCK
      ?auto_267255 - BLOCK
      ?auto_267256 - BLOCK
      ?auto_267257 - BLOCK
      ?auto_267258 - BLOCK
    )
    :vars
    (
      ?auto_267259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267258 ?auto_267259 ) ( not ( = ?auto_267247 ?auto_267248 ) ) ( not ( = ?auto_267247 ?auto_267249 ) ) ( not ( = ?auto_267247 ?auto_267250 ) ) ( not ( = ?auto_267247 ?auto_267251 ) ) ( not ( = ?auto_267247 ?auto_267252 ) ) ( not ( = ?auto_267247 ?auto_267253 ) ) ( not ( = ?auto_267247 ?auto_267254 ) ) ( not ( = ?auto_267247 ?auto_267255 ) ) ( not ( = ?auto_267247 ?auto_267256 ) ) ( not ( = ?auto_267247 ?auto_267257 ) ) ( not ( = ?auto_267247 ?auto_267258 ) ) ( not ( = ?auto_267247 ?auto_267259 ) ) ( not ( = ?auto_267248 ?auto_267249 ) ) ( not ( = ?auto_267248 ?auto_267250 ) ) ( not ( = ?auto_267248 ?auto_267251 ) ) ( not ( = ?auto_267248 ?auto_267252 ) ) ( not ( = ?auto_267248 ?auto_267253 ) ) ( not ( = ?auto_267248 ?auto_267254 ) ) ( not ( = ?auto_267248 ?auto_267255 ) ) ( not ( = ?auto_267248 ?auto_267256 ) ) ( not ( = ?auto_267248 ?auto_267257 ) ) ( not ( = ?auto_267248 ?auto_267258 ) ) ( not ( = ?auto_267248 ?auto_267259 ) ) ( not ( = ?auto_267249 ?auto_267250 ) ) ( not ( = ?auto_267249 ?auto_267251 ) ) ( not ( = ?auto_267249 ?auto_267252 ) ) ( not ( = ?auto_267249 ?auto_267253 ) ) ( not ( = ?auto_267249 ?auto_267254 ) ) ( not ( = ?auto_267249 ?auto_267255 ) ) ( not ( = ?auto_267249 ?auto_267256 ) ) ( not ( = ?auto_267249 ?auto_267257 ) ) ( not ( = ?auto_267249 ?auto_267258 ) ) ( not ( = ?auto_267249 ?auto_267259 ) ) ( not ( = ?auto_267250 ?auto_267251 ) ) ( not ( = ?auto_267250 ?auto_267252 ) ) ( not ( = ?auto_267250 ?auto_267253 ) ) ( not ( = ?auto_267250 ?auto_267254 ) ) ( not ( = ?auto_267250 ?auto_267255 ) ) ( not ( = ?auto_267250 ?auto_267256 ) ) ( not ( = ?auto_267250 ?auto_267257 ) ) ( not ( = ?auto_267250 ?auto_267258 ) ) ( not ( = ?auto_267250 ?auto_267259 ) ) ( not ( = ?auto_267251 ?auto_267252 ) ) ( not ( = ?auto_267251 ?auto_267253 ) ) ( not ( = ?auto_267251 ?auto_267254 ) ) ( not ( = ?auto_267251 ?auto_267255 ) ) ( not ( = ?auto_267251 ?auto_267256 ) ) ( not ( = ?auto_267251 ?auto_267257 ) ) ( not ( = ?auto_267251 ?auto_267258 ) ) ( not ( = ?auto_267251 ?auto_267259 ) ) ( not ( = ?auto_267252 ?auto_267253 ) ) ( not ( = ?auto_267252 ?auto_267254 ) ) ( not ( = ?auto_267252 ?auto_267255 ) ) ( not ( = ?auto_267252 ?auto_267256 ) ) ( not ( = ?auto_267252 ?auto_267257 ) ) ( not ( = ?auto_267252 ?auto_267258 ) ) ( not ( = ?auto_267252 ?auto_267259 ) ) ( not ( = ?auto_267253 ?auto_267254 ) ) ( not ( = ?auto_267253 ?auto_267255 ) ) ( not ( = ?auto_267253 ?auto_267256 ) ) ( not ( = ?auto_267253 ?auto_267257 ) ) ( not ( = ?auto_267253 ?auto_267258 ) ) ( not ( = ?auto_267253 ?auto_267259 ) ) ( not ( = ?auto_267254 ?auto_267255 ) ) ( not ( = ?auto_267254 ?auto_267256 ) ) ( not ( = ?auto_267254 ?auto_267257 ) ) ( not ( = ?auto_267254 ?auto_267258 ) ) ( not ( = ?auto_267254 ?auto_267259 ) ) ( not ( = ?auto_267255 ?auto_267256 ) ) ( not ( = ?auto_267255 ?auto_267257 ) ) ( not ( = ?auto_267255 ?auto_267258 ) ) ( not ( = ?auto_267255 ?auto_267259 ) ) ( not ( = ?auto_267256 ?auto_267257 ) ) ( not ( = ?auto_267256 ?auto_267258 ) ) ( not ( = ?auto_267256 ?auto_267259 ) ) ( not ( = ?auto_267257 ?auto_267258 ) ) ( not ( = ?auto_267257 ?auto_267259 ) ) ( not ( = ?auto_267258 ?auto_267259 ) ) ( ON ?auto_267257 ?auto_267258 ) ( ON ?auto_267256 ?auto_267257 ) ( ON ?auto_267255 ?auto_267256 ) ( ON ?auto_267254 ?auto_267255 ) ( ON ?auto_267253 ?auto_267254 ) ( ON ?auto_267252 ?auto_267253 ) ( ON ?auto_267251 ?auto_267252 ) ( ON ?auto_267250 ?auto_267251 ) ( ON ?auto_267249 ?auto_267250 ) ( ON ?auto_267248 ?auto_267249 ) ( ON ?auto_267247 ?auto_267248 ) ( CLEAR ?auto_267247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267247 )
      ( MAKE-12PILE ?auto_267247 ?auto_267248 ?auto_267249 ?auto_267250 ?auto_267251 ?auto_267252 ?auto_267253 ?auto_267254 ?auto_267255 ?auto_267256 ?auto_267257 ?auto_267258 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267273 - BLOCK
      ?auto_267274 - BLOCK
      ?auto_267275 - BLOCK
      ?auto_267276 - BLOCK
      ?auto_267277 - BLOCK
      ?auto_267278 - BLOCK
      ?auto_267279 - BLOCK
      ?auto_267280 - BLOCK
      ?auto_267281 - BLOCK
      ?auto_267282 - BLOCK
      ?auto_267283 - BLOCK
      ?auto_267284 - BLOCK
      ?auto_267285 - BLOCK
    )
    :vars
    (
      ?auto_267286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_267284 ) ( ON ?auto_267285 ?auto_267286 ) ( CLEAR ?auto_267285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_267273 ) ( ON ?auto_267274 ?auto_267273 ) ( ON ?auto_267275 ?auto_267274 ) ( ON ?auto_267276 ?auto_267275 ) ( ON ?auto_267277 ?auto_267276 ) ( ON ?auto_267278 ?auto_267277 ) ( ON ?auto_267279 ?auto_267278 ) ( ON ?auto_267280 ?auto_267279 ) ( ON ?auto_267281 ?auto_267280 ) ( ON ?auto_267282 ?auto_267281 ) ( ON ?auto_267283 ?auto_267282 ) ( ON ?auto_267284 ?auto_267283 ) ( not ( = ?auto_267273 ?auto_267274 ) ) ( not ( = ?auto_267273 ?auto_267275 ) ) ( not ( = ?auto_267273 ?auto_267276 ) ) ( not ( = ?auto_267273 ?auto_267277 ) ) ( not ( = ?auto_267273 ?auto_267278 ) ) ( not ( = ?auto_267273 ?auto_267279 ) ) ( not ( = ?auto_267273 ?auto_267280 ) ) ( not ( = ?auto_267273 ?auto_267281 ) ) ( not ( = ?auto_267273 ?auto_267282 ) ) ( not ( = ?auto_267273 ?auto_267283 ) ) ( not ( = ?auto_267273 ?auto_267284 ) ) ( not ( = ?auto_267273 ?auto_267285 ) ) ( not ( = ?auto_267273 ?auto_267286 ) ) ( not ( = ?auto_267274 ?auto_267275 ) ) ( not ( = ?auto_267274 ?auto_267276 ) ) ( not ( = ?auto_267274 ?auto_267277 ) ) ( not ( = ?auto_267274 ?auto_267278 ) ) ( not ( = ?auto_267274 ?auto_267279 ) ) ( not ( = ?auto_267274 ?auto_267280 ) ) ( not ( = ?auto_267274 ?auto_267281 ) ) ( not ( = ?auto_267274 ?auto_267282 ) ) ( not ( = ?auto_267274 ?auto_267283 ) ) ( not ( = ?auto_267274 ?auto_267284 ) ) ( not ( = ?auto_267274 ?auto_267285 ) ) ( not ( = ?auto_267274 ?auto_267286 ) ) ( not ( = ?auto_267275 ?auto_267276 ) ) ( not ( = ?auto_267275 ?auto_267277 ) ) ( not ( = ?auto_267275 ?auto_267278 ) ) ( not ( = ?auto_267275 ?auto_267279 ) ) ( not ( = ?auto_267275 ?auto_267280 ) ) ( not ( = ?auto_267275 ?auto_267281 ) ) ( not ( = ?auto_267275 ?auto_267282 ) ) ( not ( = ?auto_267275 ?auto_267283 ) ) ( not ( = ?auto_267275 ?auto_267284 ) ) ( not ( = ?auto_267275 ?auto_267285 ) ) ( not ( = ?auto_267275 ?auto_267286 ) ) ( not ( = ?auto_267276 ?auto_267277 ) ) ( not ( = ?auto_267276 ?auto_267278 ) ) ( not ( = ?auto_267276 ?auto_267279 ) ) ( not ( = ?auto_267276 ?auto_267280 ) ) ( not ( = ?auto_267276 ?auto_267281 ) ) ( not ( = ?auto_267276 ?auto_267282 ) ) ( not ( = ?auto_267276 ?auto_267283 ) ) ( not ( = ?auto_267276 ?auto_267284 ) ) ( not ( = ?auto_267276 ?auto_267285 ) ) ( not ( = ?auto_267276 ?auto_267286 ) ) ( not ( = ?auto_267277 ?auto_267278 ) ) ( not ( = ?auto_267277 ?auto_267279 ) ) ( not ( = ?auto_267277 ?auto_267280 ) ) ( not ( = ?auto_267277 ?auto_267281 ) ) ( not ( = ?auto_267277 ?auto_267282 ) ) ( not ( = ?auto_267277 ?auto_267283 ) ) ( not ( = ?auto_267277 ?auto_267284 ) ) ( not ( = ?auto_267277 ?auto_267285 ) ) ( not ( = ?auto_267277 ?auto_267286 ) ) ( not ( = ?auto_267278 ?auto_267279 ) ) ( not ( = ?auto_267278 ?auto_267280 ) ) ( not ( = ?auto_267278 ?auto_267281 ) ) ( not ( = ?auto_267278 ?auto_267282 ) ) ( not ( = ?auto_267278 ?auto_267283 ) ) ( not ( = ?auto_267278 ?auto_267284 ) ) ( not ( = ?auto_267278 ?auto_267285 ) ) ( not ( = ?auto_267278 ?auto_267286 ) ) ( not ( = ?auto_267279 ?auto_267280 ) ) ( not ( = ?auto_267279 ?auto_267281 ) ) ( not ( = ?auto_267279 ?auto_267282 ) ) ( not ( = ?auto_267279 ?auto_267283 ) ) ( not ( = ?auto_267279 ?auto_267284 ) ) ( not ( = ?auto_267279 ?auto_267285 ) ) ( not ( = ?auto_267279 ?auto_267286 ) ) ( not ( = ?auto_267280 ?auto_267281 ) ) ( not ( = ?auto_267280 ?auto_267282 ) ) ( not ( = ?auto_267280 ?auto_267283 ) ) ( not ( = ?auto_267280 ?auto_267284 ) ) ( not ( = ?auto_267280 ?auto_267285 ) ) ( not ( = ?auto_267280 ?auto_267286 ) ) ( not ( = ?auto_267281 ?auto_267282 ) ) ( not ( = ?auto_267281 ?auto_267283 ) ) ( not ( = ?auto_267281 ?auto_267284 ) ) ( not ( = ?auto_267281 ?auto_267285 ) ) ( not ( = ?auto_267281 ?auto_267286 ) ) ( not ( = ?auto_267282 ?auto_267283 ) ) ( not ( = ?auto_267282 ?auto_267284 ) ) ( not ( = ?auto_267282 ?auto_267285 ) ) ( not ( = ?auto_267282 ?auto_267286 ) ) ( not ( = ?auto_267283 ?auto_267284 ) ) ( not ( = ?auto_267283 ?auto_267285 ) ) ( not ( = ?auto_267283 ?auto_267286 ) ) ( not ( = ?auto_267284 ?auto_267285 ) ) ( not ( = ?auto_267284 ?auto_267286 ) ) ( not ( = ?auto_267285 ?auto_267286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_267285 ?auto_267286 )
      ( !STACK ?auto_267285 ?auto_267284 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267300 - BLOCK
      ?auto_267301 - BLOCK
      ?auto_267302 - BLOCK
      ?auto_267303 - BLOCK
      ?auto_267304 - BLOCK
      ?auto_267305 - BLOCK
      ?auto_267306 - BLOCK
      ?auto_267307 - BLOCK
      ?auto_267308 - BLOCK
      ?auto_267309 - BLOCK
      ?auto_267310 - BLOCK
      ?auto_267311 - BLOCK
      ?auto_267312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_267311 ) ( ON-TABLE ?auto_267312 ) ( CLEAR ?auto_267312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_267300 ) ( ON ?auto_267301 ?auto_267300 ) ( ON ?auto_267302 ?auto_267301 ) ( ON ?auto_267303 ?auto_267302 ) ( ON ?auto_267304 ?auto_267303 ) ( ON ?auto_267305 ?auto_267304 ) ( ON ?auto_267306 ?auto_267305 ) ( ON ?auto_267307 ?auto_267306 ) ( ON ?auto_267308 ?auto_267307 ) ( ON ?auto_267309 ?auto_267308 ) ( ON ?auto_267310 ?auto_267309 ) ( ON ?auto_267311 ?auto_267310 ) ( not ( = ?auto_267300 ?auto_267301 ) ) ( not ( = ?auto_267300 ?auto_267302 ) ) ( not ( = ?auto_267300 ?auto_267303 ) ) ( not ( = ?auto_267300 ?auto_267304 ) ) ( not ( = ?auto_267300 ?auto_267305 ) ) ( not ( = ?auto_267300 ?auto_267306 ) ) ( not ( = ?auto_267300 ?auto_267307 ) ) ( not ( = ?auto_267300 ?auto_267308 ) ) ( not ( = ?auto_267300 ?auto_267309 ) ) ( not ( = ?auto_267300 ?auto_267310 ) ) ( not ( = ?auto_267300 ?auto_267311 ) ) ( not ( = ?auto_267300 ?auto_267312 ) ) ( not ( = ?auto_267301 ?auto_267302 ) ) ( not ( = ?auto_267301 ?auto_267303 ) ) ( not ( = ?auto_267301 ?auto_267304 ) ) ( not ( = ?auto_267301 ?auto_267305 ) ) ( not ( = ?auto_267301 ?auto_267306 ) ) ( not ( = ?auto_267301 ?auto_267307 ) ) ( not ( = ?auto_267301 ?auto_267308 ) ) ( not ( = ?auto_267301 ?auto_267309 ) ) ( not ( = ?auto_267301 ?auto_267310 ) ) ( not ( = ?auto_267301 ?auto_267311 ) ) ( not ( = ?auto_267301 ?auto_267312 ) ) ( not ( = ?auto_267302 ?auto_267303 ) ) ( not ( = ?auto_267302 ?auto_267304 ) ) ( not ( = ?auto_267302 ?auto_267305 ) ) ( not ( = ?auto_267302 ?auto_267306 ) ) ( not ( = ?auto_267302 ?auto_267307 ) ) ( not ( = ?auto_267302 ?auto_267308 ) ) ( not ( = ?auto_267302 ?auto_267309 ) ) ( not ( = ?auto_267302 ?auto_267310 ) ) ( not ( = ?auto_267302 ?auto_267311 ) ) ( not ( = ?auto_267302 ?auto_267312 ) ) ( not ( = ?auto_267303 ?auto_267304 ) ) ( not ( = ?auto_267303 ?auto_267305 ) ) ( not ( = ?auto_267303 ?auto_267306 ) ) ( not ( = ?auto_267303 ?auto_267307 ) ) ( not ( = ?auto_267303 ?auto_267308 ) ) ( not ( = ?auto_267303 ?auto_267309 ) ) ( not ( = ?auto_267303 ?auto_267310 ) ) ( not ( = ?auto_267303 ?auto_267311 ) ) ( not ( = ?auto_267303 ?auto_267312 ) ) ( not ( = ?auto_267304 ?auto_267305 ) ) ( not ( = ?auto_267304 ?auto_267306 ) ) ( not ( = ?auto_267304 ?auto_267307 ) ) ( not ( = ?auto_267304 ?auto_267308 ) ) ( not ( = ?auto_267304 ?auto_267309 ) ) ( not ( = ?auto_267304 ?auto_267310 ) ) ( not ( = ?auto_267304 ?auto_267311 ) ) ( not ( = ?auto_267304 ?auto_267312 ) ) ( not ( = ?auto_267305 ?auto_267306 ) ) ( not ( = ?auto_267305 ?auto_267307 ) ) ( not ( = ?auto_267305 ?auto_267308 ) ) ( not ( = ?auto_267305 ?auto_267309 ) ) ( not ( = ?auto_267305 ?auto_267310 ) ) ( not ( = ?auto_267305 ?auto_267311 ) ) ( not ( = ?auto_267305 ?auto_267312 ) ) ( not ( = ?auto_267306 ?auto_267307 ) ) ( not ( = ?auto_267306 ?auto_267308 ) ) ( not ( = ?auto_267306 ?auto_267309 ) ) ( not ( = ?auto_267306 ?auto_267310 ) ) ( not ( = ?auto_267306 ?auto_267311 ) ) ( not ( = ?auto_267306 ?auto_267312 ) ) ( not ( = ?auto_267307 ?auto_267308 ) ) ( not ( = ?auto_267307 ?auto_267309 ) ) ( not ( = ?auto_267307 ?auto_267310 ) ) ( not ( = ?auto_267307 ?auto_267311 ) ) ( not ( = ?auto_267307 ?auto_267312 ) ) ( not ( = ?auto_267308 ?auto_267309 ) ) ( not ( = ?auto_267308 ?auto_267310 ) ) ( not ( = ?auto_267308 ?auto_267311 ) ) ( not ( = ?auto_267308 ?auto_267312 ) ) ( not ( = ?auto_267309 ?auto_267310 ) ) ( not ( = ?auto_267309 ?auto_267311 ) ) ( not ( = ?auto_267309 ?auto_267312 ) ) ( not ( = ?auto_267310 ?auto_267311 ) ) ( not ( = ?auto_267310 ?auto_267312 ) ) ( not ( = ?auto_267311 ?auto_267312 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_267312 )
      ( !STACK ?auto_267312 ?auto_267311 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267326 - BLOCK
      ?auto_267327 - BLOCK
      ?auto_267328 - BLOCK
      ?auto_267329 - BLOCK
      ?auto_267330 - BLOCK
      ?auto_267331 - BLOCK
      ?auto_267332 - BLOCK
      ?auto_267333 - BLOCK
      ?auto_267334 - BLOCK
      ?auto_267335 - BLOCK
      ?auto_267336 - BLOCK
      ?auto_267337 - BLOCK
      ?auto_267338 - BLOCK
    )
    :vars
    (
      ?auto_267339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267338 ?auto_267339 ) ( ON-TABLE ?auto_267326 ) ( ON ?auto_267327 ?auto_267326 ) ( ON ?auto_267328 ?auto_267327 ) ( ON ?auto_267329 ?auto_267328 ) ( ON ?auto_267330 ?auto_267329 ) ( ON ?auto_267331 ?auto_267330 ) ( ON ?auto_267332 ?auto_267331 ) ( ON ?auto_267333 ?auto_267332 ) ( ON ?auto_267334 ?auto_267333 ) ( ON ?auto_267335 ?auto_267334 ) ( ON ?auto_267336 ?auto_267335 ) ( not ( = ?auto_267326 ?auto_267327 ) ) ( not ( = ?auto_267326 ?auto_267328 ) ) ( not ( = ?auto_267326 ?auto_267329 ) ) ( not ( = ?auto_267326 ?auto_267330 ) ) ( not ( = ?auto_267326 ?auto_267331 ) ) ( not ( = ?auto_267326 ?auto_267332 ) ) ( not ( = ?auto_267326 ?auto_267333 ) ) ( not ( = ?auto_267326 ?auto_267334 ) ) ( not ( = ?auto_267326 ?auto_267335 ) ) ( not ( = ?auto_267326 ?auto_267336 ) ) ( not ( = ?auto_267326 ?auto_267337 ) ) ( not ( = ?auto_267326 ?auto_267338 ) ) ( not ( = ?auto_267326 ?auto_267339 ) ) ( not ( = ?auto_267327 ?auto_267328 ) ) ( not ( = ?auto_267327 ?auto_267329 ) ) ( not ( = ?auto_267327 ?auto_267330 ) ) ( not ( = ?auto_267327 ?auto_267331 ) ) ( not ( = ?auto_267327 ?auto_267332 ) ) ( not ( = ?auto_267327 ?auto_267333 ) ) ( not ( = ?auto_267327 ?auto_267334 ) ) ( not ( = ?auto_267327 ?auto_267335 ) ) ( not ( = ?auto_267327 ?auto_267336 ) ) ( not ( = ?auto_267327 ?auto_267337 ) ) ( not ( = ?auto_267327 ?auto_267338 ) ) ( not ( = ?auto_267327 ?auto_267339 ) ) ( not ( = ?auto_267328 ?auto_267329 ) ) ( not ( = ?auto_267328 ?auto_267330 ) ) ( not ( = ?auto_267328 ?auto_267331 ) ) ( not ( = ?auto_267328 ?auto_267332 ) ) ( not ( = ?auto_267328 ?auto_267333 ) ) ( not ( = ?auto_267328 ?auto_267334 ) ) ( not ( = ?auto_267328 ?auto_267335 ) ) ( not ( = ?auto_267328 ?auto_267336 ) ) ( not ( = ?auto_267328 ?auto_267337 ) ) ( not ( = ?auto_267328 ?auto_267338 ) ) ( not ( = ?auto_267328 ?auto_267339 ) ) ( not ( = ?auto_267329 ?auto_267330 ) ) ( not ( = ?auto_267329 ?auto_267331 ) ) ( not ( = ?auto_267329 ?auto_267332 ) ) ( not ( = ?auto_267329 ?auto_267333 ) ) ( not ( = ?auto_267329 ?auto_267334 ) ) ( not ( = ?auto_267329 ?auto_267335 ) ) ( not ( = ?auto_267329 ?auto_267336 ) ) ( not ( = ?auto_267329 ?auto_267337 ) ) ( not ( = ?auto_267329 ?auto_267338 ) ) ( not ( = ?auto_267329 ?auto_267339 ) ) ( not ( = ?auto_267330 ?auto_267331 ) ) ( not ( = ?auto_267330 ?auto_267332 ) ) ( not ( = ?auto_267330 ?auto_267333 ) ) ( not ( = ?auto_267330 ?auto_267334 ) ) ( not ( = ?auto_267330 ?auto_267335 ) ) ( not ( = ?auto_267330 ?auto_267336 ) ) ( not ( = ?auto_267330 ?auto_267337 ) ) ( not ( = ?auto_267330 ?auto_267338 ) ) ( not ( = ?auto_267330 ?auto_267339 ) ) ( not ( = ?auto_267331 ?auto_267332 ) ) ( not ( = ?auto_267331 ?auto_267333 ) ) ( not ( = ?auto_267331 ?auto_267334 ) ) ( not ( = ?auto_267331 ?auto_267335 ) ) ( not ( = ?auto_267331 ?auto_267336 ) ) ( not ( = ?auto_267331 ?auto_267337 ) ) ( not ( = ?auto_267331 ?auto_267338 ) ) ( not ( = ?auto_267331 ?auto_267339 ) ) ( not ( = ?auto_267332 ?auto_267333 ) ) ( not ( = ?auto_267332 ?auto_267334 ) ) ( not ( = ?auto_267332 ?auto_267335 ) ) ( not ( = ?auto_267332 ?auto_267336 ) ) ( not ( = ?auto_267332 ?auto_267337 ) ) ( not ( = ?auto_267332 ?auto_267338 ) ) ( not ( = ?auto_267332 ?auto_267339 ) ) ( not ( = ?auto_267333 ?auto_267334 ) ) ( not ( = ?auto_267333 ?auto_267335 ) ) ( not ( = ?auto_267333 ?auto_267336 ) ) ( not ( = ?auto_267333 ?auto_267337 ) ) ( not ( = ?auto_267333 ?auto_267338 ) ) ( not ( = ?auto_267333 ?auto_267339 ) ) ( not ( = ?auto_267334 ?auto_267335 ) ) ( not ( = ?auto_267334 ?auto_267336 ) ) ( not ( = ?auto_267334 ?auto_267337 ) ) ( not ( = ?auto_267334 ?auto_267338 ) ) ( not ( = ?auto_267334 ?auto_267339 ) ) ( not ( = ?auto_267335 ?auto_267336 ) ) ( not ( = ?auto_267335 ?auto_267337 ) ) ( not ( = ?auto_267335 ?auto_267338 ) ) ( not ( = ?auto_267335 ?auto_267339 ) ) ( not ( = ?auto_267336 ?auto_267337 ) ) ( not ( = ?auto_267336 ?auto_267338 ) ) ( not ( = ?auto_267336 ?auto_267339 ) ) ( not ( = ?auto_267337 ?auto_267338 ) ) ( not ( = ?auto_267337 ?auto_267339 ) ) ( not ( = ?auto_267338 ?auto_267339 ) ) ( CLEAR ?auto_267336 ) ( ON ?auto_267337 ?auto_267338 ) ( CLEAR ?auto_267337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_267326 ?auto_267327 ?auto_267328 ?auto_267329 ?auto_267330 ?auto_267331 ?auto_267332 ?auto_267333 ?auto_267334 ?auto_267335 ?auto_267336 ?auto_267337 )
      ( MAKE-13PILE ?auto_267326 ?auto_267327 ?auto_267328 ?auto_267329 ?auto_267330 ?auto_267331 ?auto_267332 ?auto_267333 ?auto_267334 ?auto_267335 ?auto_267336 ?auto_267337 ?auto_267338 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267353 - BLOCK
      ?auto_267354 - BLOCK
      ?auto_267355 - BLOCK
      ?auto_267356 - BLOCK
      ?auto_267357 - BLOCK
      ?auto_267358 - BLOCK
      ?auto_267359 - BLOCK
      ?auto_267360 - BLOCK
      ?auto_267361 - BLOCK
      ?auto_267362 - BLOCK
      ?auto_267363 - BLOCK
      ?auto_267364 - BLOCK
      ?auto_267365 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267365 ) ( ON-TABLE ?auto_267353 ) ( ON ?auto_267354 ?auto_267353 ) ( ON ?auto_267355 ?auto_267354 ) ( ON ?auto_267356 ?auto_267355 ) ( ON ?auto_267357 ?auto_267356 ) ( ON ?auto_267358 ?auto_267357 ) ( ON ?auto_267359 ?auto_267358 ) ( ON ?auto_267360 ?auto_267359 ) ( ON ?auto_267361 ?auto_267360 ) ( ON ?auto_267362 ?auto_267361 ) ( ON ?auto_267363 ?auto_267362 ) ( not ( = ?auto_267353 ?auto_267354 ) ) ( not ( = ?auto_267353 ?auto_267355 ) ) ( not ( = ?auto_267353 ?auto_267356 ) ) ( not ( = ?auto_267353 ?auto_267357 ) ) ( not ( = ?auto_267353 ?auto_267358 ) ) ( not ( = ?auto_267353 ?auto_267359 ) ) ( not ( = ?auto_267353 ?auto_267360 ) ) ( not ( = ?auto_267353 ?auto_267361 ) ) ( not ( = ?auto_267353 ?auto_267362 ) ) ( not ( = ?auto_267353 ?auto_267363 ) ) ( not ( = ?auto_267353 ?auto_267364 ) ) ( not ( = ?auto_267353 ?auto_267365 ) ) ( not ( = ?auto_267354 ?auto_267355 ) ) ( not ( = ?auto_267354 ?auto_267356 ) ) ( not ( = ?auto_267354 ?auto_267357 ) ) ( not ( = ?auto_267354 ?auto_267358 ) ) ( not ( = ?auto_267354 ?auto_267359 ) ) ( not ( = ?auto_267354 ?auto_267360 ) ) ( not ( = ?auto_267354 ?auto_267361 ) ) ( not ( = ?auto_267354 ?auto_267362 ) ) ( not ( = ?auto_267354 ?auto_267363 ) ) ( not ( = ?auto_267354 ?auto_267364 ) ) ( not ( = ?auto_267354 ?auto_267365 ) ) ( not ( = ?auto_267355 ?auto_267356 ) ) ( not ( = ?auto_267355 ?auto_267357 ) ) ( not ( = ?auto_267355 ?auto_267358 ) ) ( not ( = ?auto_267355 ?auto_267359 ) ) ( not ( = ?auto_267355 ?auto_267360 ) ) ( not ( = ?auto_267355 ?auto_267361 ) ) ( not ( = ?auto_267355 ?auto_267362 ) ) ( not ( = ?auto_267355 ?auto_267363 ) ) ( not ( = ?auto_267355 ?auto_267364 ) ) ( not ( = ?auto_267355 ?auto_267365 ) ) ( not ( = ?auto_267356 ?auto_267357 ) ) ( not ( = ?auto_267356 ?auto_267358 ) ) ( not ( = ?auto_267356 ?auto_267359 ) ) ( not ( = ?auto_267356 ?auto_267360 ) ) ( not ( = ?auto_267356 ?auto_267361 ) ) ( not ( = ?auto_267356 ?auto_267362 ) ) ( not ( = ?auto_267356 ?auto_267363 ) ) ( not ( = ?auto_267356 ?auto_267364 ) ) ( not ( = ?auto_267356 ?auto_267365 ) ) ( not ( = ?auto_267357 ?auto_267358 ) ) ( not ( = ?auto_267357 ?auto_267359 ) ) ( not ( = ?auto_267357 ?auto_267360 ) ) ( not ( = ?auto_267357 ?auto_267361 ) ) ( not ( = ?auto_267357 ?auto_267362 ) ) ( not ( = ?auto_267357 ?auto_267363 ) ) ( not ( = ?auto_267357 ?auto_267364 ) ) ( not ( = ?auto_267357 ?auto_267365 ) ) ( not ( = ?auto_267358 ?auto_267359 ) ) ( not ( = ?auto_267358 ?auto_267360 ) ) ( not ( = ?auto_267358 ?auto_267361 ) ) ( not ( = ?auto_267358 ?auto_267362 ) ) ( not ( = ?auto_267358 ?auto_267363 ) ) ( not ( = ?auto_267358 ?auto_267364 ) ) ( not ( = ?auto_267358 ?auto_267365 ) ) ( not ( = ?auto_267359 ?auto_267360 ) ) ( not ( = ?auto_267359 ?auto_267361 ) ) ( not ( = ?auto_267359 ?auto_267362 ) ) ( not ( = ?auto_267359 ?auto_267363 ) ) ( not ( = ?auto_267359 ?auto_267364 ) ) ( not ( = ?auto_267359 ?auto_267365 ) ) ( not ( = ?auto_267360 ?auto_267361 ) ) ( not ( = ?auto_267360 ?auto_267362 ) ) ( not ( = ?auto_267360 ?auto_267363 ) ) ( not ( = ?auto_267360 ?auto_267364 ) ) ( not ( = ?auto_267360 ?auto_267365 ) ) ( not ( = ?auto_267361 ?auto_267362 ) ) ( not ( = ?auto_267361 ?auto_267363 ) ) ( not ( = ?auto_267361 ?auto_267364 ) ) ( not ( = ?auto_267361 ?auto_267365 ) ) ( not ( = ?auto_267362 ?auto_267363 ) ) ( not ( = ?auto_267362 ?auto_267364 ) ) ( not ( = ?auto_267362 ?auto_267365 ) ) ( not ( = ?auto_267363 ?auto_267364 ) ) ( not ( = ?auto_267363 ?auto_267365 ) ) ( not ( = ?auto_267364 ?auto_267365 ) ) ( CLEAR ?auto_267363 ) ( ON ?auto_267364 ?auto_267365 ) ( CLEAR ?auto_267364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_267353 ?auto_267354 ?auto_267355 ?auto_267356 ?auto_267357 ?auto_267358 ?auto_267359 ?auto_267360 ?auto_267361 ?auto_267362 ?auto_267363 ?auto_267364 )
      ( MAKE-13PILE ?auto_267353 ?auto_267354 ?auto_267355 ?auto_267356 ?auto_267357 ?auto_267358 ?auto_267359 ?auto_267360 ?auto_267361 ?auto_267362 ?auto_267363 ?auto_267364 ?auto_267365 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267379 - BLOCK
      ?auto_267380 - BLOCK
      ?auto_267381 - BLOCK
      ?auto_267382 - BLOCK
      ?auto_267383 - BLOCK
      ?auto_267384 - BLOCK
      ?auto_267385 - BLOCK
      ?auto_267386 - BLOCK
      ?auto_267387 - BLOCK
      ?auto_267388 - BLOCK
      ?auto_267389 - BLOCK
      ?auto_267390 - BLOCK
      ?auto_267391 - BLOCK
    )
    :vars
    (
      ?auto_267392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267391 ?auto_267392 ) ( ON-TABLE ?auto_267379 ) ( ON ?auto_267380 ?auto_267379 ) ( ON ?auto_267381 ?auto_267380 ) ( ON ?auto_267382 ?auto_267381 ) ( ON ?auto_267383 ?auto_267382 ) ( ON ?auto_267384 ?auto_267383 ) ( ON ?auto_267385 ?auto_267384 ) ( ON ?auto_267386 ?auto_267385 ) ( ON ?auto_267387 ?auto_267386 ) ( ON ?auto_267388 ?auto_267387 ) ( not ( = ?auto_267379 ?auto_267380 ) ) ( not ( = ?auto_267379 ?auto_267381 ) ) ( not ( = ?auto_267379 ?auto_267382 ) ) ( not ( = ?auto_267379 ?auto_267383 ) ) ( not ( = ?auto_267379 ?auto_267384 ) ) ( not ( = ?auto_267379 ?auto_267385 ) ) ( not ( = ?auto_267379 ?auto_267386 ) ) ( not ( = ?auto_267379 ?auto_267387 ) ) ( not ( = ?auto_267379 ?auto_267388 ) ) ( not ( = ?auto_267379 ?auto_267389 ) ) ( not ( = ?auto_267379 ?auto_267390 ) ) ( not ( = ?auto_267379 ?auto_267391 ) ) ( not ( = ?auto_267379 ?auto_267392 ) ) ( not ( = ?auto_267380 ?auto_267381 ) ) ( not ( = ?auto_267380 ?auto_267382 ) ) ( not ( = ?auto_267380 ?auto_267383 ) ) ( not ( = ?auto_267380 ?auto_267384 ) ) ( not ( = ?auto_267380 ?auto_267385 ) ) ( not ( = ?auto_267380 ?auto_267386 ) ) ( not ( = ?auto_267380 ?auto_267387 ) ) ( not ( = ?auto_267380 ?auto_267388 ) ) ( not ( = ?auto_267380 ?auto_267389 ) ) ( not ( = ?auto_267380 ?auto_267390 ) ) ( not ( = ?auto_267380 ?auto_267391 ) ) ( not ( = ?auto_267380 ?auto_267392 ) ) ( not ( = ?auto_267381 ?auto_267382 ) ) ( not ( = ?auto_267381 ?auto_267383 ) ) ( not ( = ?auto_267381 ?auto_267384 ) ) ( not ( = ?auto_267381 ?auto_267385 ) ) ( not ( = ?auto_267381 ?auto_267386 ) ) ( not ( = ?auto_267381 ?auto_267387 ) ) ( not ( = ?auto_267381 ?auto_267388 ) ) ( not ( = ?auto_267381 ?auto_267389 ) ) ( not ( = ?auto_267381 ?auto_267390 ) ) ( not ( = ?auto_267381 ?auto_267391 ) ) ( not ( = ?auto_267381 ?auto_267392 ) ) ( not ( = ?auto_267382 ?auto_267383 ) ) ( not ( = ?auto_267382 ?auto_267384 ) ) ( not ( = ?auto_267382 ?auto_267385 ) ) ( not ( = ?auto_267382 ?auto_267386 ) ) ( not ( = ?auto_267382 ?auto_267387 ) ) ( not ( = ?auto_267382 ?auto_267388 ) ) ( not ( = ?auto_267382 ?auto_267389 ) ) ( not ( = ?auto_267382 ?auto_267390 ) ) ( not ( = ?auto_267382 ?auto_267391 ) ) ( not ( = ?auto_267382 ?auto_267392 ) ) ( not ( = ?auto_267383 ?auto_267384 ) ) ( not ( = ?auto_267383 ?auto_267385 ) ) ( not ( = ?auto_267383 ?auto_267386 ) ) ( not ( = ?auto_267383 ?auto_267387 ) ) ( not ( = ?auto_267383 ?auto_267388 ) ) ( not ( = ?auto_267383 ?auto_267389 ) ) ( not ( = ?auto_267383 ?auto_267390 ) ) ( not ( = ?auto_267383 ?auto_267391 ) ) ( not ( = ?auto_267383 ?auto_267392 ) ) ( not ( = ?auto_267384 ?auto_267385 ) ) ( not ( = ?auto_267384 ?auto_267386 ) ) ( not ( = ?auto_267384 ?auto_267387 ) ) ( not ( = ?auto_267384 ?auto_267388 ) ) ( not ( = ?auto_267384 ?auto_267389 ) ) ( not ( = ?auto_267384 ?auto_267390 ) ) ( not ( = ?auto_267384 ?auto_267391 ) ) ( not ( = ?auto_267384 ?auto_267392 ) ) ( not ( = ?auto_267385 ?auto_267386 ) ) ( not ( = ?auto_267385 ?auto_267387 ) ) ( not ( = ?auto_267385 ?auto_267388 ) ) ( not ( = ?auto_267385 ?auto_267389 ) ) ( not ( = ?auto_267385 ?auto_267390 ) ) ( not ( = ?auto_267385 ?auto_267391 ) ) ( not ( = ?auto_267385 ?auto_267392 ) ) ( not ( = ?auto_267386 ?auto_267387 ) ) ( not ( = ?auto_267386 ?auto_267388 ) ) ( not ( = ?auto_267386 ?auto_267389 ) ) ( not ( = ?auto_267386 ?auto_267390 ) ) ( not ( = ?auto_267386 ?auto_267391 ) ) ( not ( = ?auto_267386 ?auto_267392 ) ) ( not ( = ?auto_267387 ?auto_267388 ) ) ( not ( = ?auto_267387 ?auto_267389 ) ) ( not ( = ?auto_267387 ?auto_267390 ) ) ( not ( = ?auto_267387 ?auto_267391 ) ) ( not ( = ?auto_267387 ?auto_267392 ) ) ( not ( = ?auto_267388 ?auto_267389 ) ) ( not ( = ?auto_267388 ?auto_267390 ) ) ( not ( = ?auto_267388 ?auto_267391 ) ) ( not ( = ?auto_267388 ?auto_267392 ) ) ( not ( = ?auto_267389 ?auto_267390 ) ) ( not ( = ?auto_267389 ?auto_267391 ) ) ( not ( = ?auto_267389 ?auto_267392 ) ) ( not ( = ?auto_267390 ?auto_267391 ) ) ( not ( = ?auto_267390 ?auto_267392 ) ) ( not ( = ?auto_267391 ?auto_267392 ) ) ( ON ?auto_267390 ?auto_267391 ) ( CLEAR ?auto_267388 ) ( ON ?auto_267389 ?auto_267390 ) ( CLEAR ?auto_267389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_267379 ?auto_267380 ?auto_267381 ?auto_267382 ?auto_267383 ?auto_267384 ?auto_267385 ?auto_267386 ?auto_267387 ?auto_267388 ?auto_267389 )
      ( MAKE-13PILE ?auto_267379 ?auto_267380 ?auto_267381 ?auto_267382 ?auto_267383 ?auto_267384 ?auto_267385 ?auto_267386 ?auto_267387 ?auto_267388 ?auto_267389 ?auto_267390 ?auto_267391 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267406 - BLOCK
      ?auto_267407 - BLOCK
      ?auto_267408 - BLOCK
      ?auto_267409 - BLOCK
      ?auto_267410 - BLOCK
      ?auto_267411 - BLOCK
      ?auto_267412 - BLOCK
      ?auto_267413 - BLOCK
      ?auto_267414 - BLOCK
      ?auto_267415 - BLOCK
      ?auto_267416 - BLOCK
      ?auto_267417 - BLOCK
      ?auto_267418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267418 ) ( ON-TABLE ?auto_267406 ) ( ON ?auto_267407 ?auto_267406 ) ( ON ?auto_267408 ?auto_267407 ) ( ON ?auto_267409 ?auto_267408 ) ( ON ?auto_267410 ?auto_267409 ) ( ON ?auto_267411 ?auto_267410 ) ( ON ?auto_267412 ?auto_267411 ) ( ON ?auto_267413 ?auto_267412 ) ( ON ?auto_267414 ?auto_267413 ) ( ON ?auto_267415 ?auto_267414 ) ( not ( = ?auto_267406 ?auto_267407 ) ) ( not ( = ?auto_267406 ?auto_267408 ) ) ( not ( = ?auto_267406 ?auto_267409 ) ) ( not ( = ?auto_267406 ?auto_267410 ) ) ( not ( = ?auto_267406 ?auto_267411 ) ) ( not ( = ?auto_267406 ?auto_267412 ) ) ( not ( = ?auto_267406 ?auto_267413 ) ) ( not ( = ?auto_267406 ?auto_267414 ) ) ( not ( = ?auto_267406 ?auto_267415 ) ) ( not ( = ?auto_267406 ?auto_267416 ) ) ( not ( = ?auto_267406 ?auto_267417 ) ) ( not ( = ?auto_267406 ?auto_267418 ) ) ( not ( = ?auto_267407 ?auto_267408 ) ) ( not ( = ?auto_267407 ?auto_267409 ) ) ( not ( = ?auto_267407 ?auto_267410 ) ) ( not ( = ?auto_267407 ?auto_267411 ) ) ( not ( = ?auto_267407 ?auto_267412 ) ) ( not ( = ?auto_267407 ?auto_267413 ) ) ( not ( = ?auto_267407 ?auto_267414 ) ) ( not ( = ?auto_267407 ?auto_267415 ) ) ( not ( = ?auto_267407 ?auto_267416 ) ) ( not ( = ?auto_267407 ?auto_267417 ) ) ( not ( = ?auto_267407 ?auto_267418 ) ) ( not ( = ?auto_267408 ?auto_267409 ) ) ( not ( = ?auto_267408 ?auto_267410 ) ) ( not ( = ?auto_267408 ?auto_267411 ) ) ( not ( = ?auto_267408 ?auto_267412 ) ) ( not ( = ?auto_267408 ?auto_267413 ) ) ( not ( = ?auto_267408 ?auto_267414 ) ) ( not ( = ?auto_267408 ?auto_267415 ) ) ( not ( = ?auto_267408 ?auto_267416 ) ) ( not ( = ?auto_267408 ?auto_267417 ) ) ( not ( = ?auto_267408 ?auto_267418 ) ) ( not ( = ?auto_267409 ?auto_267410 ) ) ( not ( = ?auto_267409 ?auto_267411 ) ) ( not ( = ?auto_267409 ?auto_267412 ) ) ( not ( = ?auto_267409 ?auto_267413 ) ) ( not ( = ?auto_267409 ?auto_267414 ) ) ( not ( = ?auto_267409 ?auto_267415 ) ) ( not ( = ?auto_267409 ?auto_267416 ) ) ( not ( = ?auto_267409 ?auto_267417 ) ) ( not ( = ?auto_267409 ?auto_267418 ) ) ( not ( = ?auto_267410 ?auto_267411 ) ) ( not ( = ?auto_267410 ?auto_267412 ) ) ( not ( = ?auto_267410 ?auto_267413 ) ) ( not ( = ?auto_267410 ?auto_267414 ) ) ( not ( = ?auto_267410 ?auto_267415 ) ) ( not ( = ?auto_267410 ?auto_267416 ) ) ( not ( = ?auto_267410 ?auto_267417 ) ) ( not ( = ?auto_267410 ?auto_267418 ) ) ( not ( = ?auto_267411 ?auto_267412 ) ) ( not ( = ?auto_267411 ?auto_267413 ) ) ( not ( = ?auto_267411 ?auto_267414 ) ) ( not ( = ?auto_267411 ?auto_267415 ) ) ( not ( = ?auto_267411 ?auto_267416 ) ) ( not ( = ?auto_267411 ?auto_267417 ) ) ( not ( = ?auto_267411 ?auto_267418 ) ) ( not ( = ?auto_267412 ?auto_267413 ) ) ( not ( = ?auto_267412 ?auto_267414 ) ) ( not ( = ?auto_267412 ?auto_267415 ) ) ( not ( = ?auto_267412 ?auto_267416 ) ) ( not ( = ?auto_267412 ?auto_267417 ) ) ( not ( = ?auto_267412 ?auto_267418 ) ) ( not ( = ?auto_267413 ?auto_267414 ) ) ( not ( = ?auto_267413 ?auto_267415 ) ) ( not ( = ?auto_267413 ?auto_267416 ) ) ( not ( = ?auto_267413 ?auto_267417 ) ) ( not ( = ?auto_267413 ?auto_267418 ) ) ( not ( = ?auto_267414 ?auto_267415 ) ) ( not ( = ?auto_267414 ?auto_267416 ) ) ( not ( = ?auto_267414 ?auto_267417 ) ) ( not ( = ?auto_267414 ?auto_267418 ) ) ( not ( = ?auto_267415 ?auto_267416 ) ) ( not ( = ?auto_267415 ?auto_267417 ) ) ( not ( = ?auto_267415 ?auto_267418 ) ) ( not ( = ?auto_267416 ?auto_267417 ) ) ( not ( = ?auto_267416 ?auto_267418 ) ) ( not ( = ?auto_267417 ?auto_267418 ) ) ( ON ?auto_267417 ?auto_267418 ) ( CLEAR ?auto_267415 ) ( ON ?auto_267416 ?auto_267417 ) ( CLEAR ?auto_267416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_267406 ?auto_267407 ?auto_267408 ?auto_267409 ?auto_267410 ?auto_267411 ?auto_267412 ?auto_267413 ?auto_267414 ?auto_267415 ?auto_267416 )
      ( MAKE-13PILE ?auto_267406 ?auto_267407 ?auto_267408 ?auto_267409 ?auto_267410 ?auto_267411 ?auto_267412 ?auto_267413 ?auto_267414 ?auto_267415 ?auto_267416 ?auto_267417 ?auto_267418 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267432 - BLOCK
      ?auto_267433 - BLOCK
      ?auto_267434 - BLOCK
      ?auto_267435 - BLOCK
      ?auto_267436 - BLOCK
      ?auto_267437 - BLOCK
      ?auto_267438 - BLOCK
      ?auto_267439 - BLOCK
      ?auto_267440 - BLOCK
      ?auto_267441 - BLOCK
      ?auto_267442 - BLOCK
      ?auto_267443 - BLOCK
      ?auto_267444 - BLOCK
    )
    :vars
    (
      ?auto_267445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267444 ?auto_267445 ) ( ON-TABLE ?auto_267432 ) ( ON ?auto_267433 ?auto_267432 ) ( ON ?auto_267434 ?auto_267433 ) ( ON ?auto_267435 ?auto_267434 ) ( ON ?auto_267436 ?auto_267435 ) ( ON ?auto_267437 ?auto_267436 ) ( ON ?auto_267438 ?auto_267437 ) ( ON ?auto_267439 ?auto_267438 ) ( ON ?auto_267440 ?auto_267439 ) ( not ( = ?auto_267432 ?auto_267433 ) ) ( not ( = ?auto_267432 ?auto_267434 ) ) ( not ( = ?auto_267432 ?auto_267435 ) ) ( not ( = ?auto_267432 ?auto_267436 ) ) ( not ( = ?auto_267432 ?auto_267437 ) ) ( not ( = ?auto_267432 ?auto_267438 ) ) ( not ( = ?auto_267432 ?auto_267439 ) ) ( not ( = ?auto_267432 ?auto_267440 ) ) ( not ( = ?auto_267432 ?auto_267441 ) ) ( not ( = ?auto_267432 ?auto_267442 ) ) ( not ( = ?auto_267432 ?auto_267443 ) ) ( not ( = ?auto_267432 ?auto_267444 ) ) ( not ( = ?auto_267432 ?auto_267445 ) ) ( not ( = ?auto_267433 ?auto_267434 ) ) ( not ( = ?auto_267433 ?auto_267435 ) ) ( not ( = ?auto_267433 ?auto_267436 ) ) ( not ( = ?auto_267433 ?auto_267437 ) ) ( not ( = ?auto_267433 ?auto_267438 ) ) ( not ( = ?auto_267433 ?auto_267439 ) ) ( not ( = ?auto_267433 ?auto_267440 ) ) ( not ( = ?auto_267433 ?auto_267441 ) ) ( not ( = ?auto_267433 ?auto_267442 ) ) ( not ( = ?auto_267433 ?auto_267443 ) ) ( not ( = ?auto_267433 ?auto_267444 ) ) ( not ( = ?auto_267433 ?auto_267445 ) ) ( not ( = ?auto_267434 ?auto_267435 ) ) ( not ( = ?auto_267434 ?auto_267436 ) ) ( not ( = ?auto_267434 ?auto_267437 ) ) ( not ( = ?auto_267434 ?auto_267438 ) ) ( not ( = ?auto_267434 ?auto_267439 ) ) ( not ( = ?auto_267434 ?auto_267440 ) ) ( not ( = ?auto_267434 ?auto_267441 ) ) ( not ( = ?auto_267434 ?auto_267442 ) ) ( not ( = ?auto_267434 ?auto_267443 ) ) ( not ( = ?auto_267434 ?auto_267444 ) ) ( not ( = ?auto_267434 ?auto_267445 ) ) ( not ( = ?auto_267435 ?auto_267436 ) ) ( not ( = ?auto_267435 ?auto_267437 ) ) ( not ( = ?auto_267435 ?auto_267438 ) ) ( not ( = ?auto_267435 ?auto_267439 ) ) ( not ( = ?auto_267435 ?auto_267440 ) ) ( not ( = ?auto_267435 ?auto_267441 ) ) ( not ( = ?auto_267435 ?auto_267442 ) ) ( not ( = ?auto_267435 ?auto_267443 ) ) ( not ( = ?auto_267435 ?auto_267444 ) ) ( not ( = ?auto_267435 ?auto_267445 ) ) ( not ( = ?auto_267436 ?auto_267437 ) ) ( not ( = ?auto_267436 ?auto_267438 ) ) ( not ( = ?auto_267436 ?auto_267439 ) ) ( not ( = ?auto_267436 ?auto_267440 ) ) ( not ( = ?auto_267436 ?auto_267441 ) ) ( not ( = ?auto_267436 ?auto_267442 ) ) ( not ( = ?auto_267436 ?auto_267443 ) ) ( not ( = ?auto_267436 ?auto_267444 ) ) ( not ( = ?auto_267436 ?auto_267445 ) ) ( not ( = ?auto_267437 ?auto_267438 ) ) ( not ( = ?auto_267437 ?auto_267439 ) ) ( not ( = ?auto_267437 ?auto_267440 ) ) ( not ( = ?auto_267437 ?auto_267441 ) ) ( not ( = ?auto_267437 ?auto_267442 ) ) ( not ( = ?auto_267437 ?auto_267443 ) ) ( not ( = ?auto_267437 ?auto_267444 ) ) ( not ( = ?auto_267437 ?auto_267445 ) ) ( not ( = ?auto_267438 ?auto_267439 ) ) ( not ( = ?auto_267438 ?auto_267440 ) ) ( not ( = ?auto_267438 ?auto_267441 ) ) ( not ( = ?auto_267438 ?auto_267442 ) ) ( not ( = ?auto_267438 ?auto_267443 ) ) ( not ( = ?auto_267438 ?auto_267444 ) ) ( not ( = ?auto_267438 ?auto_267445 ) ) ( not ( = ?auto_267439 ?auto_267440 ) ) ( not ( = ?auto_267439 ?auto_267441 ) ) ( not ( = ?auto_267439 ?auto_267442 ) ) ( not ( = ?auto_267439 ?auto_267443 ) ) ( not ( = ?auto_267439 ?auto_267444 ) ) ( not ( = ?auto_267439 ?auto_267445 ) ) ( not ( = ?auto_267440 ?auto_267441 ) ) ( not ( = ?auto_267440 ?auto_267442 ) ) ( not ( = ?auto_267440 ?auto_267443 ) ) ( not ( = ?auto_267440 ?auto_267444 ) ) ( not ( = ?auto_267440 ?auto_267445 ) ) ( not ( = ?auto_267441 ?auto_267442 ) ) ( not ( = ?auto_267441 ?auto_267443 ) ) ( not ( = ?auto_267441 ?auto_267444 ) ) ( not ( = ?auto_267441 ?auto_267445 ) ) ( not ( = ?auto_267442 ?auto_267443 ) ) ( not ( = ?auto_267442 ?auto_267444 ) ) ( not ( = ?auto_267442 ?auto_267445 ) ) ( not ( = ?auto_267443 ?auto_267444 ) ) ( not ( = ?auto_267443 ?auto_267445 ) ) ( not ( = ?auto_267444 ?auto_267445 ) ) ( ON ?auto_267443 ?auto_267444 ) ( ON ?auto_267442 ?auto_267443 ) ( CLEAR ?auto_267440 ) ( ON ?auto_267441 ?auto_267442 ) ( CLEAR ?auto_267441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_267432 ?auto_267433 ?auto_267434 ?auto_267435 ?auto_267436 ?auto_267437 ?auto_267438 ?auto_267439 ?auto_267440 ?auto_267441 )
      ( MAKE-13PILE ?auto_267432 ?auto_267433 ?auto_267434 ?auto_267435 ?auto_267436 ?auto_267437 ?auto_267438 ?auto_267439 ?auto_267440 ?auto_267441 ?auto_267442 ?auto_267443 ?auto_267444 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267459 - BLOCK
      ?auto_267460 - BLOCK
      ?auto_267461 - BLOCK
      ?auto_267462 - BLOCK
      ?auto_267463 - BLOCK
      ?auto_267464 - BLOCK
      ?auto_267465 - BLOCK
      ?auto_267466 - BLOCK
      ?auto_267467 - BLOCK
      ?auto_267468 - BLOCK
      ?auto_267469 - BLOCK
      ?auto_267470 - BLOCK
      ?auto_267471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267471 ) ( ON-TABLE ?auto_267459 ) ( ON ?auto_267460 ?auto_267459 ) ( ON ?auto_267461 ?auto_267460 ) ( ON ?auto_267462 ?auto_267461 ) ( ON ?auto_267463 ?auto_267462 ) ( ON ?auto_267464 ?auto_267463 ) ( ON ?auto_267465 ?auto_267464 ) ( ON ?auto_267466 ?auto_267465 ) ( ON ?auto_267467 ?auto_267466 ) ( not ( = ?auto_267459 ?auto_267460 ) ) ( not ( = ?auto_267459 ?auto_267461 ) ) ( not ( = ?auto_267459 ?auto_267462 ) ) ( not ( = ?auto_267459 ?auto_267463 ) ) ( not ( = ?auto_267459 ?auto_267464 ) ) ( not ( = ?auto_267459 ?auto_267465 ) ) ( not ( = ?auto_267459 ?auto_267466 ) ) ( not ( = ?auto_267459 ?auto_267467 ) ) ( not ( = ?auto_267459 ?auto_267468 ) ) ( not ( = ?auto_267459 ?auto_267469 ) ) ( not ( = ?auto_267459 ?auto_267470 ) ) ( not ( = ?auto_267459 ?auto_267471 ) ) ( not ( = ?auto_267460 ?auto_267461 ) ) ( not ( = ?auto_267460 ?auto_267462 ) ) ( not ( = ?auto_267460 ?auto_267463 ) ) ( not ( = ?auto_267460 ?auto_267464 ) ) ( not ( = ?auto_267460 ?auto_267465 ) ) ( not ( = ?auto_267460 ?auto_267466 ) ) ( not ( = ?auto_267460 ?auto_267467 ) ) ( not ( = ?auto_267460 ?auto_267468 ) ) ( not ( = ?auto_267460 ?auto_267469 ) ) ( not ( = ?auto_267460 ?auto_267470 ) ) ( not ( = ?auto_267460 ?auto_267471 ) ) ( not ( = ?auto_267461 ?auto_267462 ) ) ( not ( = ?auto_267461 ?auto_267463 ) ) ( not ( = ?auto_267461 ?auto_267464 ) ) ( not ( = ?auto_267461 ?auto_267465 ) ) ( not ( = ?auto_267461 ?auto_267466 ) ) ( not ( = ?auto_267461 ?auto_267467 ) ) ( not ( = ?auto_267461 ?auto_267468 ) ) ( not ( = ?auto_267461 ?auto_267469 ) ) ( not ( = ?auto_267461 ?auto_267470 ) ) ( not ( = ?auto_267461 ?auto_267471 ) ) ( not ( = ?auto_267462 ?auto_267463 ) ) ( not ( = ?auto_267462 ?auto_267464 ) ) ( not ( = ?auto_267462 ?auto_267465 ) ) ( not ( = ?auto_267462 ?auto_267466 ) ) ( not ( = ?auto_267462 ?auto_267467 ) ) ( not ( = ?auto_267462 ?auto_267468 ) ) ( not ( = ?auto_267462 ?auto_267469 ) ) ( not ( = ?auto_267462 ?auto_267470 ) ) ( not ( = ?auto_267462 ?auto_267471 ) ) ( not ( = ?auto_267463 ?auto_267464 ) ) ( not ( = ?auto_267463 ?auto_267465 ) ) ( not ( = ?auto_267463 ?auto_267466 ) ) ( not ( = ?auto_267463 ?auto_267467 ) ) ( not ( = ?auto_267463 ?auto_267468 ) ) ( not ( = ?auto_267463 ?auto_267469 ) ) ( not ( = ?auto_267463 ?auto_267470 ) ) ( not ( = ?auto_267463 ?auto_267471 ) ) ( not ( = ?auto_267464 ?auto_267465 ) ) ( not ( = ?auto_267464 ?auto_267466 ) ) ( not ( = ?auto_267464 ?auto_267467 ) ) ( not ( = ?auto_267464 ?auto_267468 ) ) ( not ( = ?auto_267464 ?auto_267469 ) ) ( not ( = ?auto_267464 ?auto_267470 ) ) ( not ( = ?auto_267464 ?auto_267471 ) ) ( not ( = ?auto_267465 ?auto_267466 ) ) ( not ( = ?auto_267465 ?auto_267467 ) ) ( not ( = ?auto_267465 ?auto_267468 ) ) ( not ( = ?auto_267465 ?auto_267469 ) ) ( not ( = ?auto_267465 ?auto_267470 ) ) ( not ( = ?auto_267465 ?auto_267471 ) ) ( not ( = ?auto_267466 ?auto_267467 ) ) ( not ( = ?auto_267466 ?auto_267468 ) ) ( not ( = ?auto_267466 ?auto_267469 ) ) ( not ( = ?auto_267466 ?auto_267470 ) ) ( not ( = ?auto_267466 ?auto_267471 ) ) ( not ( = ?auto_267467 ?auto_267468 ) ) ( not ( = ?auto_267467 ?auto_267469 ) ) ( not ( = ?auto_267467 ?auto_267470 ) ) ( not ( = ?auto_267467 ?auto_267471 ) ) ( not ( = ?auto_267468 ?auto_267469 ) ) ( not ( = ?auto_267468 ?auto_267470 ) ) ( not ( = ?auto_267468 ?auto_267471 ) ) ( not ( = ?auto_267469 ?auto_267470 ) ) ( not ( = ?auto_267469 ?auto_267471 ) ) ( not ( = ?auto_267470 ?auto_267471 ) ) ( ON ?auto_267470 ?auto_267471 ) ( ON ?auto_267469 ?auto_267470 ) ( CLEAR ?auto_267467 ) ( ON ?auto_267468 ?auto_267469 ) ( CLEAR ?auto_267468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_267459 ?auto_267460 ?auto_267461 ?auto_267462 ?auto_267463 ?auto_267464 ?auto_267465 ?auto_267466 ?auto_267467 ?auto_267468 )
      ( MAKE-13PILE ?auto_267459 ?auto_267460 ?auto_267461 ?auto_267462 ?auto_267463 ?auto_267464 ?auto_267465 ?auto_267466 ?auto_267467 ?auto_267468 ?auto_267469 ?auto_267470 ?auto_267471 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267485 - BLOCK
      ?auto_267486 - BLOCK
      ?auto_267487 - BLOCK
      ?auto_267488 - BLOCK
      ?auto_267489 - BLOCK
      ?auto_267490 - BLOCK
      ?auto_267491 - BLOCK
      ?auto_267492 - BLOCK
      ?auto_267493 - BLOCK
      ?auto_267494 - BLOCK
      ?auto_267495 - BLOCK
      ?auto_267496 - BLOCK
      ?auto_267497 - BLOCK
    )
    :vars
    (
      ?auto_267498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267497 ?auto_267498 ) ( ON-TABLE ?auto_267485 ) ( ON ?auto_267486 ?auto_267485 ) ( ON ?auto_267487 ?auto_267486 ) ( ON ?auto_267488 ?auto_267487 ) ( ON ?auto_267489 ?auto_267488 ) ( ON ?auto_267490 ?auto_267489 ) ( ON ?auto_267491 ?auto_267490 ) ( ON ?auto_267492 ?auto_267491 ) ( not ( = ?auto_267485 ?auto_267486 ) ) ( not ( = ?auto_267485 ?auto_267487 ) ) ( not ( = ?auto_267485 ?auto_267488 ) ) ( not ( = ?auto_267485 ?auto_267489 ) ) ( not ( = ?auto_267485 ?auto_267490 ) ) ( not ( = ?auto_267485 ?auto_267491 ) ) ( not ( = ?auto_267485 ?auto_267492 ) ) ( not ( = ?auto_267485 ?auto_267493 ) ) ( not ( = ?auto_267485 ?auto_267494 ) ) ( not ( = ?auto_267485 ?auto_267495 ) ) ( not ( = ?auto_267485 ?auto_267496 ) ) ( not ( = ?auto_267485 ?auto_267497 ) ) ( not ( = ?auto_267485 ?auto_267498 ) ) ( not ( = ?auto_267486 ?auto_267487 ) ) ( not ( = ?auto_267486 ?auto_267488 ) ) ( not ( = ?auto_267486 ?auto_267489 ) ) ( not ( = ?auto_267486 ?auto_267490 ) ) ( not ( = ?auto_267486 ?auto_267491 ) ) ( not ( = ?auto_267486 ?auto_267492 ) ) ( not ( = ?auto_267486 ?auto_267493 ) ) ( not ( = ?auto_267486 ?auto_267494 ) ) ( not ( = ?auto_267486 ?auto_267495 ) ) ( not ( = ?auto_267486 ?auto_267496 ) ) ( not ( = ?auto_267486 ?auto_267497 ) ) ( not ( = ?auto_267486 ?auto_267498 ) ) ( not ( = ?auto_267487 ?auto_267488 ) ) ( not ( = ?auto_267487 ?auto_267489 ) ) ( not ( = ?auto_267487 ?auto_267490 ) ) ( not ( = ?auto_267487 ?auto_267491 ) ) ( not ( = ?auto_267487 ?auto_267492 ) ) ( not ( = ?auto_267487 ?auto_267493 ) ) ( not ( = ?auto_267487 ?auto_267494 ) ) ( not ( = ?auto_267487 ?auto_267495 ) ) ( not ( = ?auto_267487 ?auto_267496 ) ) ( not ( = ?auto_267487 ?auto_267497 ) ) ( not ( = ?auto_267487 ?auto_267498 ) ) ( not ( = ?auto_267488 ?auto_267489 ) ) ( not ( = ?auto_267488 ?auto_267490 ) ) ( not ( = ?auto_267488 ?auto_267491 ) ) ( not ( = ?auto_267488 ?auto_267492 ) ) ( not ( = ?auto_267488 ?auto_267493 ) ) ( not ( = ?auto_267488 ?auto_267494 ) ) ( not ( = ?auto_267488 ?auto_267495 ) ) ( not ( = ?auto_267488 ?auto_267496 ) ) ( not ( = ?auto_267488 ?auto_267497 ) ) ( not ( = ?auto_267488 ?auto_267498 ) ) ( not ( = ?auto_267489 ?auto_267490 ) ) ( not ( = ?auto_267489 ?auto_267491 ) ) ( not ( = ?auto_267489 ?auto_267492 ) ) ( not ( = ?auto_267489 ?auto_267493 ) ) ( not ( = ?auto_267489 ?auto_267494 ) ) ( not ( = ?auto_267489 ?auto_267495 ) ) ( not ( = ?auto_267489 ?auto_267496 ) ) ( not ( = ?auto_267489 ?auto_267497 ) ) ( not ( = ?auto_267489 ?auto_267498 ) ) ( not ( = ?auto_267490 ?auto_267491 ) ) ( not ( = ?auto_267490 ?auto_267492 ) ) ( not ( = ?auto_267490 ?auto_267493 ) ) ( not ( = ?auto_267490 ?auto_267494 ) ) ( not ( = ?auto_267490 ?auto_267495 ) ) ( not ( = ?auto_267490 ?auto_267496 ) ) ( not ( = ?auto_267490 ?auto_267497 ) ) ( not ( = ?auto_267490 ?auto_267498 ) ) ( not ( = ?auto_267491 ?auto_267492 ) ) ( not ( = ?auto_267491 ?auto_267493 ) ) ( not ( = ?auto_267491 ?auto_267494 ) ) ( not ( = ?auto_267491 ?auto_267495 ) ) ( not ( = ?auto_267491 ?auto_267496 ) ) ( not ( = ?auto_267491 ?auto_267497 ) ) ( not ( = ?auto_267491 ?auto_267498 ) ) ( not ( = ?auto_267492 ?auto_267493 ) ) ( not ( = ?auto_267492 ?auto_267494 ) ) ( not ( = ?auto_267492 ?auto_267495 ) ) ( not ( = ?auto_267492 ?auto_267496 ) ) ( not ( = ?auto_267492 ?auto_267497 ) ) ( not ( = ?auto_267492 ?auto_267498 ) ) ( not ( = ?auto_267493 ?auto_267494 ) ) ( not ( = ?auto_267493 ?auto_267495 ) ) ( not ( = ?auto_267493 ?auto_267496 ) ) ( not ( = ?auto_267493 ?auto_267497 ) ) ( not ( = ?auto_267493 ?auto_267498 ) ) ( not ( = ?auto_267494 ?auto_267495 ) ) ( not ( = ?auto_267494 ?auto_267496 ) ) ( not ( = ?auto_267494 ?auto_267497 ) ) ( not ( = ?auto_267494 ?auto_267498 ) ) ( not ( = ?auto_267495 ?auto_267496 ) ) ( not ( = ?auto_267495 ?auto_267497 ) ) ( not ( = ?auto_267495 ?auto_267498 ) ) ( not ( = ?auto_267496 ?auto_267497 ) ) ( not ( = ?auto_267496 ?auto_267498 ) ) ( not ( = ?auto_267497 ?auto_267498 ) ) ( ON ?auto_267496 ?auto_267497 ) ( ON ?auto_267495 ?auto_267496 ) ( ON ?auto_267494 ?auto_267495 ) ( CLEAR ?auto_267492 ) ( ON ?auto_267493 ?auto_267494 ) ( CLEAR ?auto_267493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_267485 ?auto_267486 ?auto_267487 ?auto_267488 ?auto_267489 ?auto_267490 ?auto_267491 ?auto_267492 ?auto_267493 )
      ( MAKE-13PILE ?auto_267485 ?auto_267486 ?auto_267487 ?auto_267488 ?auto_267489 ?auto_267490 ?auto_267491 ?auto_267492 ?auto_267493 ?auto_267494 ?auto_267495 ?auto_267496 ?auto_267497 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267512 - BLOCK
      ?auto_267513 - BLOCK
      ?auto_267514 - BLOCK
      ?auto_267515 - BLOCK
      ?auto_267516 - BLOCK
      ?auto_267517 - BLOCK
      ?auto_267518 - BLOCK
      ?auto_267519 - BLOCK
      ?auto_267520 - BLOCK
      ?auto_267521 - BLOCK
      ?auto_267522 - BLOCK
      ?auto_267523 - BLOCK
      ?auto_267524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267524 ) ( ON-TABLE ?auto_267512 ) ( ON ?auto_267513 ?auto_267512 ) ( ON ?auto_267514 ?auto_267513 ) ( ON ?auto_267515 ?auto_267514 ) ( ON ?auto_267516 ?auto_267515 ) ( ON ?auto_267517 ?auto_267516 ) ( ON ?auto_267518 ?auto_267517 ) ( ON ?auto_267519 ?auto_267518 ) ( not ( = ?auto_267512 ?auto_267513 ) ) ( not ( = ?auto_267512 ?auto_267514 ) ) ( not ( = ?auto_267512 ?auto_267515 ) ) ( not ( = ?auto_267512 ?auto_267516 ) ) ( not ( = ?auto_267512 ?auto_267517 ) ) ( not ( = ?auto_267512 ?auto_267518 ) ) ( not ( = ?auto_267512 ?auto_267519 ) ) ( not ( = ?auto_267512 ?auto_267520 ) ) ( not ( = ?auto_267512 ?auto_267521 ) ) ( not ( = ?auto_267512 ?auto_267522 ) ) ( not ( = ?auto_267512 ?auto_267523 ) ) ( not ( = ?auto_267512 ?auto_267524 ) ) ( not ( = ?auto_267513 ?auto_267514 ) ) ( not ( = ?auto_267513 ?auto_267515 ) ) ( not ( = ?auto_267513 ?auto_267516 ) ) ( not ( = ?auto_267513 ?auto_267517 ) ) ( not ( = ?auto_267513 ?auto_267518 ) ) ( not ( = ?auto_267513 ?auto_267519 ) ) ( not ( = ?auto_267513 ?auto_267520 ) ) ( not ( = ?auto_267513 ?auto_267521 ) ) ( not ( = ?auto_267513 ?auto_267522 ) ) ( not ( = ?auto_267513 ?auto_267523 ) ) ( not ( = ?auto_267513 ?auto_267524 ) ) ( not ( = ?auto_267514 ?auto_267515 ) ) ( not ( = ?auto_267514 ?auto_267516 ) ) ( not ( = ?auto_267514 ?auto_267517 ) ) ( not ( = ?auto_267514 ?auto_267518 ) ) ( not ( = ?auto_267514 ?auto_267519 ) ) ( not ( = ?auto_267514 ?auto_267520 ) ) ( not ( = ?auto_267514 ?auto_267521 ) ) ( not ( = ?auto_267514 ?auto_267522 ) ) ( not ( = ?auto_267514 ?auto_267523 ) ) ( not ( = ?auto_267514 ?auto_267524 ) ) ( not ( = ?auto_267515 ?auto_267516 ) ) ( not ( = ?auto_267515 ?auto_267517 ) ) ( not ( = ?auto_267515 ?auto_267518 ) ) ( not ( = ?auto_267515 ?auto_267519 ) ) ( not ( = ?auto_267515 ?auto_267520 ) ) ( not ( = ?auto_267515 ?auto_267521 ) ) ( not ( = ?auto_267515 ?auto_267522 ) ) ( not ( = ?auto_267515 ?auto_267523 ) ) ( not ( = ?auto_267515 ?auto_267524 ) ) ( not ( = ?auto_267516 ?auto_267517 ) ) ( not ( = ?auto_267516 ?auto_267518 ) ) ( not ( = ?auto_267516 ?auto_267519 ) ) ( not ( = ?auto_267516 ?auto_267520 ) ) ( not ( = ?auto_267516 ?auto_267521 ) ) ( not ( = ?auto_267516 ?auto_267522 ) ) ( not ( = ?auto_267516 ?auto_267523 ) ) ( not ( = ?auto_267516 ?auto_267524 ) ) ( not ( = ?auto_267517 ?auto_267518 ) ) ( not ( = ?auto_267517 ?auto_267519 ) ) ( not ( = ?auto_267517 ?auto_267520 ) ) ( not ( = ?auto_267517 ?auto_267521 ) ) ( not ( = ?auto_267517 ?auto_267522 ) ) ( not ( = ?auto_267517 ?auto_267523 ) ) ( not ( = ?auto_267517 ?auto_267524 ) ) ( not ( = ?auto_267518 ?auto_267519 ) ) ( not ( = ?auto_267518 ?auto_267520 ) ) ( not ( = ?auto_267518 ?auto_267521 ) ) ( not ( = ?auto_267518 ?auto_267522 ) ) ( not ( = ?auto_267518 ?auto_267523 ) ) ( not ( = ?auto_267518 ?auto_267524 ) ) ( not ( = ?auto_267519 ?auto_267520 ) ) ( not ( = ?auto_267519 ?auto_267521 ) ) ( not ( = ?auto_267519 ?auto_267522 ) ) ( not ( = ?auto_267519 ?auto_267523 ) ) ( not ( = ?auto_267519 ?auto_267524 ) ) ( not ( = ?auto_267520 ?auto_267521 ) ) ( not ( = ?auto_267520 ?auto_267522 ) ) ( not ( = ?auto_267520 ?auto_267523 ) ) ( not ( = ?auto_267520 ?auto_267524 ) ) ( not ( = ?auto_267521 ?auto_267522 ) ) ( not ( = ?auto_267521 ?auto_267523 ) ) ( not ( = ?auto_267521 ?auto_267524 ) ) ( not ( = ?auto_267522 ?auto_267523 ) ) ( not ( = ?auto_267522 ?auto_267524 ) ) ( not ( = ?auto_267523 ?auto_267524 ) ) ( ON ?auto_267523 ?auto_267524 ) ( ON ?auto_267522 ?auto_267523 ) ( ON ?auto_267521 ?auto_267522 ) ( CLEAR ?auto_267519 ) ( ON ?auto_267520 ?auto_267521 ) ( CLEAR ?auto_267520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_267512 ?auto_267513 ?auto_267514 ?auto_267515 ?auto_267516 ?auto_267517 ?auto_267518 ?auto_267519 ?auto_267520 )
      ( MAKE-13PILE ?auto_267512 ?auto_267513 ?auto_267514 ?auto_267515 ?auto_267516 ?auto_267517 ?auto_267518 ?auto_267519 ?auto_267520 ?auto_267521 ?auto_267522 ?auto_267523 ?auto_267524 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267538 - BLOCK
      ?auto_267539 - BLOCK
      ?auto_267540 - BLOCK
      ?auto_267541 - BLOCK
      ?auto_267542 - BLOCK
      ?auto_267543 - BLOCK
      ?auto_267544 - BLOCK
      ?auto_267545 - BLOCK
      ?auto_267546 - BLOCK
      ?auto_267547 - BLOCK
      ?auto_267548 - BLOCK
      ?auto_267549 - BLOCK
      ?auto_267550 - BLOCK
    )
    :vars
    (
      ?auto_267551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267550 ?auto_267551 ) ( ON-TABLE ?auto_267538 ) ( ON ?auto_267539 ?auto_267538 ) ( ON ?auto_267540 ?auto_267539 ) ( ON ?auto_267541 ?auto_267540 ) ( ON ?auto_267542 ?auto_267541 ) ( ON ?auto_267543 ?auto_267542 ) ( ON ?auto_267544 ?auto_267543 ) ( not ( = ?auto_267538 ?auto_267539 ) ) ( not ( = ?auto_267538 ?auto_267540 ) ) ( not ( = ?auto_267538 ?auto_267541 ) ) ( not ( = ?auto_267538 ?auto_267542 ) ) ( not ( = ?auto_267538 ?auto_267543 ) ) ( not ( = ?auto_267538 ?auto_267544 ) ) ( not ( = ?auto_267538 ?auto_267545 ) ) ( not ( = ?auto_267538 ?auto_267546 ) ) ( not ( = ?auto_267538 ?auto_267547 ) ) ( not ( = ?auto_267538 ?auto_267548 ) ) ( not ( = ?auto_267538 ?auto_267549 ) ) ( not ( = ?auto_267538 ?auto_267550 ) ) ( not ( = ?auto_267538 ?auto_267551 ) ) ( not ( = ?auto_267539 ?auto_267540 ) ) ( not ( = ?auto_267539 ?auto_267541 ) ) ( not ( = ?auto_267539 ?auto_267542 ) ) ( not ( = ?auto_267539 ?auto_267543 ) ) ( not ( = ?auto_267539 ?auto_267544 ) ) ( not ( = ?auto_267539 ?auto_267545 ) ) ( not ( = ?auto_267539 ?auto_267546 ) ) ( not ( = ?auto_267539 ?auto_267547 ) ) ( not ( = ?auto_267539 ?auto_267548 ) ) ( not ( = ?auto_267539 ?auto_267549 ) ) ( not ( = ?auto_267539 ?auto_267550 ) ) ( not ( = ?auto_267539 ?auto_267551 ) ) ( not ( = ?auto_267540 ?auto_267541 ) ) ( not ( = ?auto_267540 ?auto_267542 ) ) ( not ( = ?auto_267540 ?auto_267543 ) ) ( not ( = ?auto_267540 ?auto_267544 ) ) ( not ( = ?auto_267540 ?auto_267545 ) ) ( not ( = ?auto_267540 ?auto_267546 ) ) ( not ( = ?auto_267540 ?auto_267547 ) ) ( not ( = ?auto_267540 ?auto_267548 ) ) ( not ( = ?auto_267540 ?auto_267549 ) ) ( not ( = ?auto_267540 ?auto_267550 ) ) ( not ( = ?auto_267540 ?auto_267551 ) ) ( not ( = ?auto_267541 ?auto_267542 ) ) ( not ( = ?auto_267541 ?auto_267543 ) ) ( not ( = ?auto_267541 ?auto_267544 ) ) ( not ( = ?auto_267541 ?auto_267545 ) ) ( not ( = ?auto_267541 ?auto_267546 ) ) ( not ( = ?auto_267541 ?auto_267547 ) ) ( not ( = ?auto_267541 ?auto_267548 ) ) ( not ( = ?auto_267541 ?auto_267549 ) ) ( not ( = ?auto_267541 ?auto_267550 ) ) ( not ( = ?auto_267541 ?auto_267551 ) ) ( not ( = ?auto_267542 ?auto_267543 ) ) ( not ( = ?auto_267542 ?auto_267544 ) ) ( not ( = ?auto_267542 ?auto_267545 ) ) ( not ( = ?auto_267542 ?auto_267546 ) ) ( not ( = ?auto_267542 ?auto_267547 ) ) ( not ( = ?auto_267542 ?auto_267548 ) ) ( not ( = ?auto_267542 ?auto_267549 ) ) ( not ( = ?auto_267542 ?auto_267550 ) ) ( not ( = ?auto_267542 ?auto_267551 ) ) ( not ( = ?auto_267543 ?auto_267544 ) ) ( not ( = ?auto_267543 ?auto_267545 ) ) ( not ( = ?auto_267543 ?auto_267546 ) ) ( not ( = ?auto_267543 ?auto_267547 ) ) ( not ( = ?auto_267543 ?auto_267548 ) ) ( not ( = ?auto_267543 ?auto_267549 ) ) ( not ( = ?auto_267543 ?auto_267550 ) ) ( not ( = ?auto_267543 ?auto_267551 ) ) ( not ( = ?auto_267544 ?auto_267545 ) ) ( not ( = ?auto_267544 ?auto_267546 ) ) ( not ( = ?auto_267544 ?auto_267547 ) ) ( not ( = ?auto_267544 ?auto_267548 ) ) ( not ( = ?auto_267544 ?auto_267549 ) ) ( not ( = ?auto_267544 ?auto_267550 ) ) ( not ( = ?auto_267544 ?auto_267551 ) ) ( not ( = ?auto_267545 ?auto_267546 ) ) ( not ( = ?auto_267545 ?auto_267547 ) ) ( not ( = ?auto_267545 ?auto_267548 ) ) ( not ( = ?auto_267545 ?auto_267549 ) ) ( not ( = ?auto_267545 ?auto_267550 ) ) ( not ( = ?auto_267545 ?auto_267551 ) ) ( not ( = ?auto_267546 ?auto_267547 ) ) ( not ( = ?auto_267546 ?auto_267548 ) ) ( not ( = ?auto_267546 ?auto_267549 ) ) ( not ( = ?auto_267546 ?auto_267550 ) ) ( not ( = ?auto_267546 ?auto_267551 ) ) ( not ( = ?auto_267547 ?auto_267548 ) ) ( not ( = ?auto_267547 ?auto_267549 ) ) ( not ( = ?auto_267547 ?auto_267550 ) ) ( not ( = ?auto_267547 ?auto_267551 ) ) ( not ( = ?auto_267548 ?auto_267549 ) ) ( not ( = ?auto_267548 ?auto_267550 ) ) ( not ( = ?auto_267548 ?auto_267551 ) ) ( not ( = ?auto_267549 ?auto_267550 ) ) ( not ( = ?auto_267549 ?auto_267551 ) ) ( not ( = ?auto_267550 ?auto_267551 ) ) ( ON ?auto_267549 ?auto_267550 ) ( ON ?auto_267548 ?auto_267549 ) ( ON ?auto_267547 ?auto_267548 ) ( ON ?auto_267546 ?auto_267547 ) ( CLEAR ?auto_267544 ) ( ON ?auto_267545 ?auto_267546 ) ( CLEAR ?auto_267545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_267538 ?auto_267539 ?auto_267540 ?auto_267541 ?auto_267542 ?auto_267543 ?auto_267544 ?auto_267545 )
      ( MAKE-13PILE ?auto_267538 ?auto_267539 ?auto_267540 ?auto_267541 ?auto_267542 ?auto_267543 ?auto_267544 ?auto_267545 ?auto_267546 ?auto_267547 ?auto_267548 ?auto_267549 ?auto_267550 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267565 - BLOCK
      ?auto_267566 - BLOCK
      ?auto_267567 - BLOCK
      ?auto_267568 - BLOCK
      ?auto_267569 - BLOCK
      ?auto_267570 - BLOCK
      ?auto_267571 - BLOCK
      ?auto_267572 - BLOCK
      ?auto_267573 - BLOCK
      ?auto_267574 - BLOCK
      ?auto_267575 - BLOCK
      ?auto_267576 - BLOCK
      ?auto_267577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267577 ) ( ON-TABLE ?auto_267565 ) ( ON ?auto_267566 ?auto_267565 ) ( ON ?auto_267567 ?auto_267566 ) ( ON ?auto_267568 ?auto_267567 ) ( ON ?auto_267569 ?auto_267568 ) ( ON ?auto_267570 ?auto_267569 ) ( ON ?auto_267571 ?auto_267570 ) ( not ( = ?auto_267565 ?auto_267566 ) ) ( not ( = ?auto_267565 ?auto_267567 ) ) ( not ( = ?auto_267565 ?auto_267568 ) ) ( not ( = ?auto_267565 ?auto_267569 ) ) ( not ( = ?auto_267565 ?auto_267570 ) ) ( not ( = ?auto_267565 ?auto_267571 ) ) ( not ( = ?auto_267565 ?auto_267572 ) ) ( not ( = ?auto_267565 ?auto_267573 ) ) ( not ( = ?auto_267565 ?auto_267574 ) ) ( not ( = ?auto_267565 ?auto_267575 ) ) ( not ( = ?auto_267565 ?auto_267576 ) ) ( not ( = ?auto_267565 ?auto_267577 ) ) ( not ( = ?auto_267566 ?auto_267567 ) ) ( not ( = ?auto_267566 ?auto_267568 ) ) ( not ( = ?auto_267566 ?auto_267569 ) ) ( not ( = ?auto_267566 ?auto_267570 ) ) ( not ( = ?auto_267566 ?auto_267571 ) ) ( not ( = ?auto_267566 ?auto_267572 ) ) ( not ( = ?auto_267566 ?auto_267573 ) ) ( not ( = ?auto_267566 ?auto_267574 ) ) ( not ( = ?auto_267566 ?auto_267575 ) ) ( not ( = ?auto_267566 ?auto_267576 ) ) ( not ( = ?auto_267566 ?auto_267577 ) ) ( not ( = ?auto_267567 ?auto_267568 ) ) ( not ( = ?auto_267567 ?auto_267569 ) ) ( not ( = ?auto_267567 ?auto_267570 ) ) ( not ( = ?auto_267567 ?auto_267571 ) ) ( not ( = ?auto_267567 ?auto_267572 ) ) ( not ( = ?auto_267567 ?auto_267573 ) ) ( not ( = ?auto_267567 ?auto_267574 ) ) ( not ( = ?auto_267567 ?auto_267575 ) ) ( not ( = ?auto_267567 ?auto_267576 ) ) ( not ( = ?auto_267567 ?auto_267577 ) ) ( not ( = ?auto_267568 ?auto_267569 ) ) ( not ( = ?auto_267568 ?auto_267570 ) ) ( not ( = ?auto_267568 ?auto_267571 ) ) ( not ( = ?auto_267568 ?auto_267572 ) ) ( not ( = ?auto_267568 ?auto_267573 ) ) ( not ( = ?auto_267568 ?auto_267574 ) ) ( not ( = ?auto_267568 ?auto_267575 ) ) ( not ( = ?auto_267568 ?auto_267576 ) ) ( not ( = ?auto_267568 ?auto_267577 ) ) ( not ( = ?auto_267569 ?auto_267570 ) ) ( not ( = ?auto_267569 ?auto_267571 ) ) ( not ( = ?auto_267569 ?auto_267572 ) ) ( not ( = ?auto_267569 ?auto_267573 ) ) ( not ( = ?auto_267569 ?auto_267574 ) ) ( not ( = ?auto_267569 ?auto_267575 ) ) ( not ( = ?auto_267569 ?auto_267576 ) ) ( not ( = ?auto_267569 ?auto_267577 ) ) ( not ( = ?auto_267570 ?auto_267571 ) ) ( not ( = ?auto_267570 ?auto_267572 ) ) ( not ( = ?auto_267570 ?auto_267573 ) ) ( not ( = ?auto_267570 ?auto_267574 ) ) ( not ( = ?auto_267570 ?auto_267575 ) ) ( not ( = ?auto_267570 ?auto_267576 ) ) ( not ( = ?auto_267570 ?auto_267577 ) ) ( not ( = ?auto_267571 ?auto_267572 ) ) ( not ( = ?auto_267571 ?auto_267573 ) ) ( not ( = ?auto_267571 ?auto_267574 ) ) ( not ( = ?auto_267571 ?auto_267575 ) ) ( not ( = ?auto_267571 ?auto_267576 ) ) ( not ( = ?auto_267571 ?auto_267577 ) ) ( not ( = ?auto_267572 ?auto_267573 ) ) ( not ( = ?auto_267572 ?auto_267574 ) ) ( not ( = ?auto_267572 ?auto_267575 ) ) ( not ( = ?auto_267572 ?auto_267576 ) ) ( not ( = ?auto_267572 ?auto_267577 ) ) ( not ( = ?auto_267573 ?auto_267574 ) ) ( not ( = ?auto_267573 ?auto_267575 ) ) ( not ( = ?auto_267573 ?auto_267576 ) ) ( not ( = ?auto_267573 ?auto_267577 ) ) ( not ( = ?auto_267574 ?auto_267575 ) ) ( not ( = ?auto_267574 ?auto_267576 ) ) ( not ( = ?auto_267574 ?auto_267577 ) ) ( not ( = ?auto_267575 ?auto_267576 ) ) ( not ( = ?auto_267575 ?auto_267577 ) ) ( not ( = ?auto_267576 ?auto_267577 ) ) ( ON ?auto_267576 ?auto_267577 ) ( ON ?auto_267575 ?auto_267576 ) ( ON ?auto_267574 ?auto_267575 ) ( ON ?auto_267573 ?auto_267574 ) ( CLEAR ?auto_267571 ) ( ON ?auto_267572 ?auto_267573 ) ( CLEAR ?auto_267572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_267565 ?auto_267566 ?auto_267567 ?auto_267568 ?auto_267569 ?auto_267570 ?auto_267571 ?auto_267572 )
      ( MAKE-13PILE ?auto_267565 ?auto_267566 ?auto_267567 ?auto_267568 ?auto_267569 ?auto_267570 ?auto_267571 ?auto_267572 ?auto_267573 ?auto_267574 ?auto_267575 ?auto_267576 ?auto_267577 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267591 - BLOCK
      ?auto_267592 - BLOCK
      ?auto_267593 - BLOCK
      ?auto_267594 - BLOCK
      ?auto_267595 - BLOCK
      ?auto_267596 - BLOCK
      ?auto_267597 - BLOCK
      ?auto_267598 - BLOCK
      ?auto_267599 - BLOCK
      ?auto_267600 - BLOCK
      ?auto_267601 - BLOCK
      ?auto_267602 - BLOCK
      ?auto_267603 - BLOCK
    )
    :vars
    (
      ?auto_267604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267603 ?auto_267604 ) ( ON-TABLE ?auto_267591 ) ( ON ?auto_267592 ?auto_267591 ) ( ON ?auto_267593 ?auto_267592 ) ( ON ?auto_267594 ?auto_267593 ) ( ON ?auto_267595 ?auto_267594 ) ( ON ?auto_267596 ?auto_267595 ) ( not ( = ?auto_267591 ?auto_267592 ) ) ( not ( = ?auto_267591 ?auto_267593 ) ) ( not ( = ?auto_267591 ?auto_267594 ) ) ( not ( = ?auto_267591 ?auto_267595 ) ) ( not ( = ?auto_267591 ?auto_267596 ) ) ( not ( = ?auto_267591 ?auto_267597 ) ) ( not ( = ?auto_267591 ?auto_267598 ) ) ( not ( = ?auto_267591 ?auto_267599 ) ) ( not ( = ?auto_267591 ?auto_267600 ) ) ( not ( = ?auto_267591 ?auto_267601 ) ) ( not ( = ?auto_267591 ?auto_267602 ) ) ( not ( = ?auto_267591 ?auto_267603 ) ) ( not ( = ?auto_267591 ?auto_267604 ) ) ( not ( = ?auto_267592 ?auto_267593 ) ) ( not ( = ?auto_267592 ?auto_267594 ) ) ( not ( = ?auto_267592 ?auto_267595 ) ) ( not ( = ?auto_267592 ?auto_267596 ) ) ( not ( = ?auto_267592 ?auto_267597 ) ) ( not ( = ?auto_267592 ?auto_267598 ) ) ( not ( = ?auto_267592 ?auto_267599 ) ) ( not ( = ?auto_267592 ?auto_267600 ) ) ( not ( = ?auto_267592 ?auto_267601 ) ) ( not ( = ?auto_267592 ?auto_267602 ) ) ( not ( = ?auto_267592 ?auto_267603 ) ) ( not ( = ?auto_267592 ?auto_267604 ) ) ( not ( = ?auto_267593 ?auto_267594 ) ) ( not ( = ?auto_267593 ?auto_267595 ) ) ( not ( = ?auto_267593 ?auto_267596 ) ) ( not ( = ?auto_267593 ?auto_267597 ) ) ( not ( = ?auto_267593 ?auto_267598 ) ) ( not ( = ?auto_267593 ?auto_267599 ) ) ( not ( = ?auto_267593 ?auto_267600 ) ) ( not ( = ?auto_267593 ?auto_267601 ) ) ( not ( = ?auto_267593 ?auto_267602 ) ) ( not ( = ?auto_267593 ?auto_267603 ) ) ( not ( = ?auto_267593 ?auto_267604 ) ) ( not ( = ?auto_267594 ?auto_267595 ) ) ( not ( = ?auto_267594 ?auto_267596 ) ) ( not ( = ?auto_267594 ?auto_267597 ) ) ( not ( = ?auto_267594 ?auto_267598 ) ) ( not ( = ?auto_267594 ?auto_267599 ) ) ( not ( = ?auto_267594 ?auto_267600 ) ) ( not ( = ?auto_267594 ?auto_267601 ) ) ( not ( = ?auto_267594 ?auto_267602 ) ) ( not ( = ?auto_267594 ?auto_267603 ) ) ( not ( = ?auto_267594 ?auto_267604 ) ) ( not ( = ?auto_267595 ?auto_267596 ) ) ( not ( = ?auto_267595 ?auto_267597 ) ) ( not ( = ?auto_267595 ?auto_267598 ) ) ( not ( = ?auto_267595 ?auto_267599 ) ) ( not ( = ?auto_267595 ?auto_267600 ) ) ( not ( = ?auto_267595 ?auto_267601 ) ) ( not ( = ?auto_267595 ?auto_267602 ) ) ( not ( = ?auto_267595 ?auto_267603 ) ) ( not ( = ?auto_267595 ?auto_267604 ) ) ( not ( = ?auto_267596 ?auto_267597 ) ) ( not ( = ?auto_267596 ?auto_267598 ) ) ( not ( = ?auto_267596 ?auto_267599 ) ) ( not ( = ?auto_267596 ?auto_267600 ) ) ( not ( = ?auto_267596 ?auto_267601 ) ) ( not ( = ?auto_267596 ?auto_267602 ) ) ( not ( = ?auto_267596 ?auto_267603 ) ) ( not ( = ?auto_267596 ?auto_267604 ) ) ( not ( = ?auto_267597 ?auto_267598 ) ) ( not ( = ?auto_267597 ?auto_267599 ) ) ( not ( = ?auto_267597 ?auto_267600 ) ) ( not ( = ?auto_267597 ?auto_267601 ) ) ( not ( = ?auto_267597 ?auto_267602 ) ) ( not ( = ?auto_267597 ?auto_267603 ) ) ( not ( = ?auto_267597 ?auto_267604 ) ) ( not ( = ?auto_267598 ?auto_267599 ) ) ( not ( = ?auto_267598 ?auto_267600 ) ) ( not ( = ?auto_267598 ?auto_267601 ) ) ( not ( = ?auto_267598 ?auto_267602 ) ) ( not ( = ?auto_267598 ?auto_267603 ) ) ( not ( = ?auto_267598 ?auto_267604 ) ) ( not ( = ?auto_267599 ?auto_267600 ) ) ( not ( = ?auto_267599 ?auto_267601 ) ) ( not ( = ?auto_267599 ?auto_267602 ) ) ( not ( = ?auto_267599 ?auto_267603 ) ) ( not ( = ?auto_267599 ?auto_267604 ) ) ( not ( = ?auto_267600 ?auto_267601 ) ) ( not ( = ?auto_267600 ?auto_267602 ) ) ( not ( = ?auto_267600 ?auto_267603 ) ) ( not ( = ?auto_267600 ?auto_267604 ) ) ( not ( = ?auto_267601 ?auto_267602 ) ) ( not ( = ?auto_267601 ?auto_267603 ) ) ( not ( = ?auto_267601 ?auto_267604 ) ) ( not ( = ?auto_267602 ?auto_267603 ) ) ( not ( = ?auto_267602 ?auto_267604 ) ) ( not ( = ?auto_267603 ?auto_267604 ) ) ( ON ?auto_267602 ?auto_267603 ) ( ON ?auto_267601 ?auto_267602 ) ( ON ?auto_267600 ?auto_267601 ) ( ON ?auto_267599 ?auto_267600 ) ( ON ?auto_267598 ?auto_267599 ) ( CLEAR ?auto_267596 ) ( ON ?auto_267597 ?auto_267598 ) ( CLEAR ?auto_267597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_267591 ?auto_267592 ?auto_267593 ?auto_267594 ?auto_267595 ?auto_267596 ?auto_267597 )
      ( MAKE-13PILE ?auto_267591 ?auto_267592 ?auto_267593 ?auto_267594 ?auto_267595 ?auto_267596 ?auto_267597 ?auto_267598 ?auto_267599 ?auto_267600 ?auto_267601 ?auto_267602 ?auto_267603 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267618 - BLOCK
      ?auto_267619 - BLOCK
      ?auto_267620 - BLOCK
      ?auto_267621 - BLOCK
      ?auto_267622 - BLOCK
      ?auto_267623 - BLOCK
      ?auto_267624 - BLOCK
      ?auto_267625 - BLOCK
      ?auto_267626 - BLOCK
      ?auto_267627 - BLOCK
      ?auto_267628 - BLOCK
      ?auto_267629 - BLOCK
      ?auto_267630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267630 ) ( ON-TABLE ?auto_267618 ) ( ON ?auto_267619 ?auto_267618 ) ( ON ?auto_267620 ?auto_267619 ) ( ON ?auto_267621 ?auto_267620 ) ( ON ?auto_267622 ?auto_267621 ) ( ON ?auto_267623 ?auto_267622 ) ( not ( = ?auto_267618 ?auto_267619 ) ) ( not ( = ?auto_267618 ?auto_267620 ) ) ( not ( = ?auto_267618 ?auto_267621 ) ) ( not ( = ?auto_267618 ?auto_267622 ) ) ( not ( = ?auto_267618 ?auto_267623 ) ) ( not ( = ?auto_267618 ?auto_267624 ) ) ( not ( = ?auto_267618 ?auto_267625 ) ) ( not ( = ?auto_267618 ?auto_267626 ) ) ( not ( = ?auto_267618 ?auto_267627 ) ) ( not ( = ?auto_267618 ?auto_267628 ) ) ( not ( = ?auto_267618 ?auto_267629 ) ) ( not ( = ?auto_267618 ?auto_267630 ) ) ( not ( = ?auto_267619 ?auto_267620 ) ) ( not ( = ?auto_267619 ?auto_267621 ) ) ( not ( = ?auto_267619 ?auto_267622 ) ) ( not ( = ?auto_267619 ?auto_267623 ) ) ( not ( = ?auto_267619 ?auto_267624 ) ) ( not ( = ?auto_267619 ?auto_267625 ) ) ( not ( = ?auto_267619 ?auto_267626 ) ) ( not ( = ?auto_267619 ?auto_267627 ) ) ( not ( = ?auto_267619 ?auto_267628 ) ) ( not ( = ?auto_267619 ?auto_267629 ) ) ( not ( = ?auto_267619 ?auto_267630 ) ) ( not ( = ?auto_267620 ?auto_267621 ) ) ( not ( = ?auto_267620 ?auto_267622 ) ) ( not ( = ?auto_267620 ?auto_267623 ) ) ( not ( = ?auto_267620 ?auto_267624 ) ) ( not ( = ?auto_267620 ?auto_267625 ) ) ( not ( = ?auto_267620 ?auto_267626 ) ) ( not ( = ?auto_267620 ?auto_267627 ) ) ( not ( = ?auto_267620 ?auto_267628 ) ) ( not ( = ?auto_267620 ?auto_267629 ) ) ( not ( = ?auto_267620 ?auto_267630 ) ) ( not ( = ?auto_267621 ?auto_267622 ) ) ( not ( = ?auto_267621 ?auto_267623 ) ) ( not ( = ?auto_267621 ?auto_267624 ) ) ( not ( = ?auto_267621 ?auto_267625 ) ) ( not ( = ?auto_267621 ?auto_267626 ) ) ( not ( = ?auto_267621 ?auto_267627 ) ) ( not ( = ?auto_267621 ?auto_267628 ) ) ( not ( = ?auto_267621 ?auto_267629 ) ) ( not ( = ?auto_267621 ?auto_267630 ) ) ( not ( = ?auto_267622 ?auto_267623 ) ) ( not ( = ?auto_267622 ?auto_267624 ) ) ( not ( = ?auto_267622 ?auto_267625 ) ) ( not ( = ?auto_267622 ?auto_267626 ) ) ( not ( = ?auto_267622 ?auto_267627 ) ) ( not ( = ?auto_267622 ?auto_267628 ) ) ( not ( = ?auto_267622 ?auto_267629 ) ) ( not ( = ?auto_267622 ?auto_267630 ) ) ( not ( = ?auto_267623 ?auto_267624 ) ) ( not ( = ?auto_267623 ?auto_267625 ) ) ( not ( = ?auto_267623 ?auto_267626 ) ) ( not ( = ?auto_267623 ?auto_267627 ) ) ( not ( = ?auto_267623 ?auto_267628 ) ) ( not ( = ?auto_267623 ?auto_267629 ) ) ( not ( = ?auto_267623 ?auto_267630 ) ) ( not ( = ?auto_267624 ?auto_267625 ) ) ( not ( = ?auto_267624 ?auto_267626 ) ) ( not ( = ?auto_267624 ?auto_267627 ) ) ( not ( = ?auto_267624 ?auto_267628 ) ) ( not ( = ?auto_267624 ?auto_267629 ) ) ( not ( = ?auto_267624 ?auto_267630 ) ) ( not ( = ?auto_267625 ?auto_267626 ) ) ( not ( = ?auto_267625 ?auto_267627 ) ) ( not ( = ?auto_267625 ?auto_267628 ) ) ( not ( = ?auto_267625 ?auto_267629 ) ) ( not ( = ?auto_267625 ?auto_267630 ) ) ( not ( = ?auto_267626 ?auto_267627 ) ) ( not ( = ?auto_267626 ?auto_267628 ) ) ( not ( = ?auto_267626 ?auto_267629 ) ) ( not ( = ?auto_267626 ?auto_267630 ) ) ( not ( = ?auto_267627 ?auto_267628 ) ) ( not ( = ?auto_267627 ?auto_267629 ) ) ( not ( = ?auto_267627 ?auto_267630 ) ) ( not ( = ?auto_267628 ?auto_267629 ) ) ( not ( = ?auto_267628 ?auto_267630 ) ) ( not ( = ?auto_267629 ?auto_267630 ) ) ( ON ?auto_267629 ?auto_267630 ) ( ON ?auto_267628 ?auto_267629 ) ( ON ?auto_267627 ?auto_267628 ) ( ON ?auto_267626 ?auto_267627 ) ( ON ?auto_267625 ?auto_267626 ) ( CLEAR ?auto_267623 ) ( ON ?auto_267624 ?auto_267625 ) ( CLEAR ?auto_267624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_267618 ?auto_267619 ?auto_267620 ?auto_267621 ?auto_267622 ?auto_267623 ?auto_267624 )
      ( MAKE-13PILE ?auto_267618 ?auto_267619 ?auto_267620 ?auto_267621 ?auto_267622 ?auto_267623 ?auto_267624 ?auto_267625 ?auto_267626 ?auto_267627 ?auto_267628 ?auto_267629 ?auto_267630 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267644 - BLOCK
      ?auto_267645 - BLOCK
      ?auto_267646 - BLOCK
      ?auto_267647 - BLOCK
      ?auto_267648 - BLOCK
      ?auto_267649 - BLOCK
      ?auto_267650 - BLOCK
      ?auto_267651 - BLOCK
      ?auto_267652 - BLOCK
      ?auto_267653 - BLOCK
      ?auto_267654 - BLOCK
      ?auto_267655 - BLOCK
      ?auto_267656 - BLOCK
    )
    :vars
    (
      ?auto_267657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267656 ?auto_267657 ) ( ON-TABLE ?auto_267644 ) ( ON ?auto_267645 ?auto_267644 ) ( ON ?auto_267646 ?auto_267645 ) ( ON ?auto_267647 ?auto_267646 ) ( ON ?auto_267648 ?auto_267647 ) ( not ( = ?auto_267644 ?auto_267645 ) ) ( not ( = ?auto_267644 ?auto_267646 ) ) ( not ( = ?auto_267644 ?auto_267647 ) ) ( not ( = ?auto_267644 ?auto_267648 ) ) ( not ( = ?auto_267644 ?auto_267649 ) ) ( not ( = ?auto_267644 ?auto_267650 ) ) ( not ( = ?auto_267644 ?auto_267651 ) ) ( not ( = ?auto_267644 ?auto_267652 ) ) ( not ( = ?auto_267644 ?auto_267653 ) ) ( not ( = ?auto_267644 ?auto_267654 ) ) ( not ( = ?auto_267644 ?auto_267655 ) ) ( not ( = ?auto_267644 ?auto_267656 ) ) ( not ( = ?auto_267644 ?auto_267657 ) ) ( not ( = ?auto_267645 ?auto_267646 ) ) ( not ( = ?auto_267645 ?auto_267647 ) ) ( not ( = ?auto_267645 ?auto_267648 ) ) ( not ( = ?auto_267645 ?auto_267649 ) ) ( not ( = ?auto_267645 ?auto_267650 ) ) ( not ( = ?auto_267645 ?auto_267651 ) ) ( not ( = ?auto_267645 ?auto_267652 ) ) ( not ( = ?auto_267645 ?auto_267653 ) ) ( not ( = ?auto_267645 ?auto_267654 ) ) ( not ( = ?auto_267645 ?auto_267655 ) ) ( not ( = ?auto_267645 ?auto_267656 ) ) ( not ( = ?auto_267645 ?auto_267657 ) ) ( not ( = ?auto_267646 ?auto_267647 ) ) ( not ( = ?auto_267646 ?auto_267648 ) ) ( not ( = ?auto_267646 ?auto_267649 ) ) ( not ( = ?auto_267646 ?auto_267650 ) ) ( not ( = ?auto_267646 ?auto_267651 ) ) ( not ( = ?auto_267646 ?auto_267652 ) ) ( not ( = ?auto_267646 ?auto_267653 ) ) ( not ( = ?auto_267646 ?auto_267654 ) ) ( not ( = ?auto_267646 ?auto_267655 ) ) ( not ( = ?auto_267646 ?auto_267656 ) ) ( not ( = ?auto_267646 ?auto_267657 ) ) ( not ( = ?auto_267647 ?auto_267648 ) ) ( not ( = ?auto_267647 ?auto_267649 ) ) ( not ( = ?auto_267647 ?auto_267650 ) ) ( not ( = ?auto_267647 ?auto_267651 ) ) ( not ( = ?auto_267647 ?auto_267652 ) ) ( not ( = ?auto_267647 ?auto_267653 ) ) ( not ( = ?auto_267647 ?auto_267654 ) ) ( not ( = ?auto_267647 ?auto_267655 ) ) ( not ( = ?auto_267647 ?auto_267656 ) ) ( not ( = ?auto_267647 ?auto_267657 ) ) ( not ( = ?auto_267648 ?auto_267649 ) ) ( not ( = ?auto_267648 ?auto_267650 ) ) ( not ( = ?auto_267648 ?auto_267651 ) ) ( not ( = ?auto_267648 ?auto_267652 ) ) ( not ( = ?auto_267648 ?auto_267653 ) ) ( not ( = ?auto_267648 ?auto_267654 ) ) ( not ( = ?auto_267648 ?auto_267655 ) ) ( not ( = ?auto_267648 ?auto_267656 ) ) ( not ( = ?auto_267648 ?auto_267657 ) ) ( not ( = ?auto_267649 ?auto_267650 ) ) ( not ( = ?auto_267649 ?auto_267651 ) ) ( not ( = ?auto_267649 ?auto_267652 ) ) ( not ( = ?auto_267649 ?auto_267653 ) ) ( not ( = ?auto_267649 ?auto_267654 ) ) ( not ( = ?auto_267649 ?auto_267655 ) ) ( not ( = ?auto_267649 ?auto_267656 ) ) ( not ( = ?auto_267649 ?auto_267657 ) ) ( not ( = ?auto_267650 ?auto_267651 ) ) ( not ( = ?auto_267650 ?auto_267652 ) ) ( not ( = ?auto_267650 ?auto_267653 ) ) ( not ( = ?auto_267650 ?auto_267654 ) ) ( not ( = ?auto_267650 ?auto_267655 ) ) ( not ( = ?auto_267650 ?auto_267656 ) ) ( not ( = ?auto_267650 ?auto_267657 ) ) ( not ( = ?auto_267651 ?auto_267652 ) ) ( not ( = ?auto_267651 ?auto_267653 ) ) ( not ( = ?auto_267651 ?auto_267654 ) ) ( not ( = ?auto_267651 ?auto_267655 ) ) ( not ( = ?auto_267651 ?auto_267656 ) ) ( not ( = ?auto_267651 ?auto_267657 ) ) ( not ( = ?auto_267652 ?auto_267653 ) ) ( not ( = ?auto_267652 ?auto_267654 ) ) ( not ( = ?auto_267652 ?auto_267655 ) ) ( not ( = ?auto_267652 ?auto_267656 ) ) ( not ( = ?auto_267652 ?auto_267657 ) ) ( not ( = ?auto_267653 ?auto_267654 ) ) ( not ( = ?auto_267653 ?auto_267655 ) ) ( not ( = ?auto_267653 ?auto_267656 ) ) ( not ( = ?auto_267653 ?auto_267657 ) ) ( not ( = ?auto_267654 ?auto_267655 ) ) ( not ( = ?auto_267654 ?auto_267656 ) ) ( not ( = ?auto_267654 ?auto_267657 ) ) ( not ( = ?auto_267655 ?auto_267656 ) ) ( not ( = ?auto_267655 ?auto_267657 ) ) ( not ( = ?auto_267656 ?auto_267657 ) ) ( ON ?auto_267655 ?auto_267656 ) ( ON ?auto_267654 ?auto_267655 ) ( ON ?auto_267653 ?auto_267654 ) ( ON ?auto_267652 ?auto_267653 ) ( ON ?auto_267651 ?auto_267652 ) ( ON ?auto_267650 ?auto_267651 ) ( CLEAR ?auto_267648 ) ( ON ?auto_267649 ?auto_267650 ) ( CLEAR ?auto_267649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_267644 ?auto_267645 ?auto_267646 ?auto_267647 ?auto_267648 ?auto_267649 )
      ( MAKE-13PILE ?auto_267644 ?auto_267645 ?auto_267646 ?auto_267647 ?auto_267648 ?auto_267649 ?auto_267650 ?auto_267651 ?auto_267652 ?auto_267653 ?auto_267654 ?auto_267655 ?auto_267656 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267671 - BLOCK
      ?auto_267672 - BLOCK
      ?auto_267673 - BLOCK
      ?auto_267674 - BLOCK
      ?auto_267675 - BLOCK
      ?auto_267676 - BLOCK
      ?auto_267677 - BLOCK
      ?auto_267678 - BLOCK
      ?auto_267679 - BLOCK
      ?auto_267680 - BLOCK
      ?auto_267681 - BLOCK
      ?auto_267682 - BLOCK
      ?auto_267683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267683 ) ( ON-TABLE ?auto_267671 ) ( ON ?auto_267672 ?auto_267671 ) ( ON ?auto_267673 ?auto_267672 ) ( ON ?auto_267674 ?auto_267673 ) ( ON ?auto_267675 ?auto_267674 ) ( not ( = ?auto_267671 ?auto_267672 ) ) ( not ( = ?auto_267671 ?auto_267673 ) ) ( not ( = ?auto_267671 ?auto_267674 ) ) ( not ( = ?auto_267671 ?auto_267675 ) ) ( not ( = ?auto_267671 ?auto_267676 ) ) ( not ( = ?auto_267671 ?auto_267677 ) ) ( not ( = ?auto_267671 ?auto_267678 ) ) ( not ( = ?auto_267671 ?auto_267679 ) ) ( not ( = ?auto_267671 ?auto_267680 ) ) ( not ( = ?auto_267671 ?auto_267681 ) ) ( not ( = ?auto_267671 ?auto_267682 ) ) ( not ( = ?auto_267671 ?auto_267683 ) ) ( not ( = ?auto_267672 ?auto_267673 ) ) ( not ( = ?auto_267672 ?auto_267674 ) ) ( not ( = ?auto_267672 ?auto_267675 ) ) ( not ( = ?auto_267672 ?auto_267676 ) ) ( not ( = ?auto_267672 ?auto_267677 ) ) ( not ( = ?auto_267672 ?auto_267678 ) ) ( not ( = ?auto_267672 ?auto_267679 ) ) ( not ( = ?auto_267672 ?auto_267680 ) ) ( not ( = ?auto_267672 ?auto_267681 ) ) ( not ( = ?auto_267672 ?auto_267682 ) ) ( not ( = ?auto_267672 ?auto_267683 ) ) ( not ( = ?auto_267673 ?auto_267674 ) ) ( not ( = ?auto_267673 ?auto_267675 ) ) ( not ( = ?auto_267673 ?auto_267676 ) ) ( not ( = ?auto_267673 ?auto_267677 ) ) ( not ( = ?auto_267673 ?auto_267678 ) ) ( not ( = ?auto_267673 ?auto_267679 ) ) ( not ( = ?auto_267673 ?auto_267680 ) ) ( not ( = ?auto_267673 ?auto_267681 ) ) ( not ( = ?auto_267673 ?auto_267682 ) ) ( not ( = ?auto_267673 ?auto_267683 ) ) ( not ( = ?auto_267674 ?auto_267675 ) ) ( not ( = ?auto_267674 ?auto_267676 ) ) ( not ( = ?auto_267674 ?auto_267677 ) ) ( not ( = ?auto_267674 ?auto_267678 ) ) ( not ( = ?auto_267674 ?auto_267679 ) ) ( not ( = ?auto_267674 ?auto_267680 ) ) ( not ( = ?auto_267674 ?auto_267681 ) ) ( not ( = ?auto_267674 ?auto_267682 ) ) ( not ( = ?auto_267674 ?auto_267683 ) ) ( not ( = ?auto_267675 ?auto_267676 ) ) ( not ( = ?auto_267675 ?auto_267677 ) ) ( not ( = ?auto_267675 ?auto_267678 ) ) ( not ( = ?auto_267675 ?auto_267679 ) ) ( not ( = ?auto_267675 ?auto_267680 ) ) ( not ( = ?auto_267675 ?auto_267681 ) ) ( not ( = ?auto_267675 ?auto_267682 ) ) ( not ( = ?auto_267675 ?auto_267683 ) ) ( not ( = ?auto_267676 ?auto_267677 ) ) ( not ( = ?auto_267676 ?auto_267678 ) ) ( not ( = ?auto_267676 ?auto_267679 ) ) ( not ( = ?auto_267676 ?auto_267680 ) ) ( not ( = ?auto_267676 ?auto_267681 ) ) ( not ( = ?auto_267676 ?auto_267682 ) ) ( not ( = ?auto_267676 ?auto_267683 ) ) ( not ( = ?auto_267677 ?auto_267678 ) ) ( not ( = ?auto_267677 ?auto_267679 ) ) ( not ( = ?auto_267677 ?auto_267680 ) ) ( not ( = ?auto_267677 ?auto_267681 ) ) ( not ( = ?auto_267677 ?auto_267682 ) ) ( not ( = ?auto_267677 ?auto_267683 ) ) ( not ( = ?auto_267678 ?auto_267679 ) ) ( not ( = ?auto_267678 ?auto_267680 ) ) ( not ( = ?auto_267678 ?auto_267681 ) ) ( not ( = ?auto_267678 ?auto_267682 ) ) ( not ( = ?auto_267678 ?auto_267683 ) ) ( not ( = ?auto_267679 ?auto_267680 ) ) ( not ( = ?auto_267679 ?auto_267681 ) ) ( not ( = ?auto_267679 ?auto_267682 ) ) ( not ( = ?auto_267679 ?auto_267683 ) ) ( not ( = ?auto_267680 ?auto_267681 ) ) ( not ( = ?auto_267680 ?auto_267682 ) ) ( not ( = ?auto_267680 ?auto_267683 ) ) ( not ( = ?auto_267681 ?auto_267682 ) ) ( not ( = ?auto_267681 ?auto_267683 ) ) ( not ( = ?auto_267682 ?auto_267683 ) ) ( ON ?auto_267682 ?auto_267683 ) ( ON ?auto_267681 ?auto_267682 ) ( ON ?auto_267680 ?auto_267681 ) ( ON ?auto_267679 ?auto_267680 ) ( ON ?auto_267678 ?auto_267679 ) ( ON ?auto_267677 ?auto_267678 ) ( CLEAR ?auto_267675 ) ( ON ?auto_267676 ?auto_267677 ) ( CLEAR ?auto_267676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_267671 ?auto_267672 ?auto_267673 ?auto_267674 ?auto_267675 ?auto_267676 )
      ( MAKE-13PILE ?auto_267671 ?auto_267672 ?auto_267673 ?auto_267674 ?auto_267675 ?auto_267676 ?auto_267677 ?auto_267678 ?auto_267679 ?auto_267680 ?auto_267681 ?auto_267682 ?auto_267683 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267697 - BLOCK
      ?auto_267698 - BLOCK
      ?auto_267699 - BLOCK
      ?auto_267700 - BLOCK
      ?auto_267701 - BLOCK
      ?auto_267702 - BLOCK
      ?auto_267703 - BLOCK
      ?auto_267704 - BLOCK
      ?auto_267705 - BLOCK
      ?auto_267706 - BLOCK
      ?auto_267707 - BLOCK
      ?auto_267708 - BLOCK
      ?auto_267709 - BLOCK
    )
    :vars
    (
      ?auto_267710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267709 ?auto_267710 ) ( ON-TABLE ?auto_267697 ) ( ON ?auto_267698 ?auto_267697 ) ( ON ?auto_267699 ?auto_267698 ) ( ON ?auto_267700 ?auto_267699 ) ( not ( = ?auto_267697 ?auto_267698 ) ) ( not ( = ?auto_267697 ?auto_267699 ) ) ( not ( = ?auto_267697 ?auto_267700 ) ) ( not ( = ?auto_267697 ?auto_267701 ) ) ( not ( = ?auto_267697 ?auto_267702 ) ) ( not ( = ?auto_267697 ?auto_267703 ) ) ( not ( = ?auto_267697 ?auto_267704 ) ) ( not ( = ?auto_267697 ?auto_267705 ) ) ( not ( = ?auto_267697 ?auto_267706 ) ) ( not ( = ?auto_267697 ?auto_267707 ) ) ( not ( = ?auto_267697 ?auto_267708 ) ) ( not ( = ?auto_267697 ?auto_267709 ) ) ( not ( = ?auto_267697 ?auto_267710 ) ) ( not ( = ?auto_267698 ?auto_267699 ) ) ( not ( = ?auto_267698 ?auto_267700 ) ) ( not ( = ?auto_267698 ?auto_267701 ) ) ( not ( = ?auto_267698 ?auto_267702 ) ) ( not ( = ?auto_267698 ?auto_267703 ) ) ( not ( = ?auto_267698 ?auto_267704 ) ) ( not ( = ?auto_267698 ?auto_267705 ) ) ( not ( = ?auto_267698 ?auto_267706 ) ) ( not ( = ?auto_267698 ?auto_267707 ) ) ( not ( = ?auto_267698 ?auto_267708 ) ) ( not ( = ?auto_267698 ?auto_267709 ) ) ( not ( = ?auto_267698 ?auto_267710 ) ) ( not ( = ?auto_267699 ?auto_267700 ) ) ( not ( = ?auto_267699 ?auto_267701 ) ) ( not ( = ?auto_267699 ?auto_267702 ) ) ( not ( = ?auto_267699 ?auto_267703 ) ) ( not ( = ?auto_267699 ?auto_267704 ) ) ( not ( = ?auto_267699 ?auto_267705 ) ) ( not ( = ?auto_267699 ?auto_267706 ) ) ( not ( = ?auto_267699 ?auto_267707 ) ) ( not ( = ?auto_267699 ?auto_267708 ) ) ( not ( = ?auto_267699 ?auto_267709 ) ) ( not ( = ?auto_267699 ?auto_267710 ) ) ( not ( = ?auto_267700 ?auto_267701 ) ) ( not ( = ?auto_267700 ?auto_267702 ) ) ( not ( = ?auto_267700 ?auto_267703 ) ) ( not ( = ?auto_267700 ?auto_267704 ) ) ( not ( = ?auto_267700 ?auto_267705 ) ) ( not ( = ?auto_267700 ?auto_267706 ) ) ( not ( = ?auto_267700 ?auto_267707 ) ) ( not ( = ?auto_267700 ?auto_267708 ) ) ( not ( = ?auto_267700 ?auto_267709 ) ) ( not ( = ?auto_267700 ?auto_267710 ) ) ( not ( = ?auto_267701 ?auto_267702 ) ) ( not ( = ?auto_267701 ?auto_267703 ) ) ( not ( = ?auto_267701 ?auto_267704 ) ) ( not ( = ?auto_267701 ?auto_267705 ) ) ( not ( = ?auto_267701 ?auto_267706 ) ) ( not ( = ?auto_267701 ?auto_267707 ) ) ( not ( = ?auto_267701 ?auto_267708 ) ) ( not ( = ?auto_267701 ?auto_267709 ) ) ( not ( = ?auto_267701 ?auto_267710 ) ) ( not ( = ?auto_267702 ?auto_267703 ) ) ( not ( = ?auto_267702 ?auto_267704 ) ) ( not ( = ?auto_267702 ?auto_267705 ) ) ( not ( = ?auto_267702 ?auto_267706 ) ) ( not ( = ?auto_267702 ?auto_267707 ) ) ( not ( = ?auto_267702 ?auto_267708 ) ) ( not ( = ?auto_267702 ?auto_267709 ) ) ( not ( = ?auto_267702 ?auto_267710 ) ) ( not ( = ?auto_267703 ?auto_267704 ) ) ( not ( = ?auto_267703 ?auto_267705 ) ) ( not ( = ?auto_267703 ?auto_267706 ) ) ( not ( = ?auto_267703 ?auto_267707 ) ) ( not ( = ?auto_267703 ?auto_267708 ) ) ( not ( = ?auto_267703 ?auto_267709 ) ) ( not ( = ?auto_267703 ?auto_267710 ) ) ( not ( = ?auto_267704 ?auto_267705 ) ) ( not ( = ?auto_267704 ?auto_267706 ) ) ( not ( = ?auto_267704 ?auto_267707 ) ) ( not ( = ?auto_267704 ?auto_267708 ) ) ( not ( = ?auto_267704 ?auto_267709 ) ) ( not ( = ?auto_267704 ?auto_267710 ) ) ( not ( = ?auto_267705 ?auto_267706 ) ) ( not ( = ?auto_267705 ?auto_267707 ) ) ( not ( = ?auto_267705 ?auto_267708 ) ) ( not ( = ?auto_267705 ?auto_267709 ) ) ( not ( = ?auto_267705 ?auto_267710 ) ) ( not ( = ?auto_267706 ?auto_267707 ) ) ( not ( = ?auto_267706 ?auto_267708 ) ) ( not ( = ?auto_267706 ?auto_267709 ) ) ( not ( = ?auto_267706 ?auto_267710 ) ) ( not ( = ?auto_267707 ?auto_267708 ) ) ( not ( = ?auto_267707 ?auto_267709 ) ) ( not ( = ?auto_267707 ?auto_267710 ) ) ( not ( = ?auto_267708 ?auto_267709 ) ) ( not ( = ?auto_267708 ?auto_267710 ) ) ( not ( = ?auto_267709 ?auto_267710 ) ) ( ON ?auto_267708 ?auto_267709 ) ( ON ?auto_267707 ?auto_267708 ) ( ON ?auto_267706 ?auto_267707 ) ( ON ?auto_267705 ?auto_267706 ) ( ON ?auto_267704 ?auto_267705 ) ( ON ?auto_267703 ?auto_267704 ) ( ON ?auto_267702 ?auto_267703 ) ( CLEAR ?auto_267700 ) ( ON ?auto_267701 ?auto_267702 ) ( CLEAR ?auto_267701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_267697 ?auto_267698 ?auto_267699 ?auto_267700 ?auto_267701 )
      ( MAKE-13PILE ?auto_267697 ?auto_267698 ?auto_267699 ?auto_267700 ?auto_267701 ?auto_267702 ?auto_267703 ?auto_267704 ?auto_267705 ?auto_267706 ?auto_267707 ?auto_267708 ?auto_267709 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267724 - BLOCK
      ?auto_267725 - BLOCK
      ?auto_267726 - BLOCK
      ?auto_267727 - BLOCK
      ?auto_267728 - BLOCK
      ?auto_267729 - BLOCK
      ?auto_267730 - BLOCK
      ?auto_267731 - BLOCK
      ?auto_267732 - BLOCK
      ?auto_267733 - BLOCK
      ?auto_267734 - BLOCK
      ?auto_267735 - BLOCK
      ?auto_267736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267736 ) ( ON-TABLE ?auto_267724 ) ( ON ?auto_267725 ?auto_267724 ) ( ON ?auto_267726 ?auto_267725 ) ( ON ?auto_267727 ?auto_267726 ) ( not ( = ?auto_267724 ?auto_267725 ) ) ( not ( = ?auto_267724 ?auto_267726 ) ) ( not ( = ?auto_267724 ?auto_267727 ) ) ( not ( = ?auto_267724 ?auto_267728 ) ) ( not ( = ?auto_267724 ?auto_267729 ) ) ( not ( = ?auto_267724 ?auto_267730 ) ) ( not ( = ?auto_267724 ?auto_267731 ) ) ( not ( = ?auto_267724 ?auto_267732 ) ) ( not ( = ?auto_267724 ?auto_267733 ) ) ( not ( = ?auto_267724 ?auto_267734 ) ) ( not ( = ?auto_267724 ?auto_267735 ) ) ( not ( = ?auto_267724 ?auto_267736 ) ) ( not ( = ?auto_267725 ?auto_267726 ) ) ( not ( = ?auto_267725 ?auto_267727 ) ) ( not ( = ?auto_267725 ?auto_267728 ) ) ( not ( = ?auto_267725 ?auto_267729 ) ) ( not ( = ?auto_267725 ?auto_267730 ) ) ( not ( = ?auto_267725 ?auto_267731 ) ) ( not ( = ?auto_267725 ?auto_267732 ) ) ( not ( = ?auto_267725 ?auto_267733 ) ) ( not ( = ?auto_267725 ?auto_267734 ) ) ( not ( = ?auto_267725 ?auto_267735 ) ) ( not ( = ?auto_267725 ?auto_267736 ) ) ( not ( = ?auto_267726 ?auto_267727 ) ) ( not ( = ?auto_267726 ?auto_267728 ) ) ( not ( = ?auto_267726 ?auto_267729 ) ) ( not ( = ?auto_267726 ?auto_267730 ) ) ( not ( = ?auto_267726 ?auto_267731 ) ) ( not ( = ?auto_267726 ?auto_267732 ) ) ( not ( = ?auto_267726 ?auto_267733 ) ) ( not ( = ?auto_267726 ?auto_267734 ) ) ( not ( = ?auto_267726 ?auto_267735 ) ) ( not ( = ?auto_267726 ?auto_267736 ) ) ( not ( = ?auto_267727 ?auto_267728 ) ) ( not ( = ?auto_267727 ?auto_267729 ) ) ( not ( = ?auto_267727 ?auto_267730 ) ) ( not ( = ?auto_267727 ?auto_267731 ) ) ( not ( = ?auto_267727 ?auto_267732 ) ) ( not ( = ?auto_267727 ?auto_267733 ) ) ( not ( = ?auto_267727 ?auto_267734 ) ) ( not ( = ?auto_267727 ?auto_267735 ) ) ( not ( = ?auto_267727 ?auto_267736 ) ) ( not ( = ?auto_267728 ?auto_267729 ) ) ( not ( = ?auto_267728 ?auto_267730 ) ) ( not ( = ?auto_267728 ?auto_267731 ) ) ( not ( = ?auto_267728 ?auto_267732 ) ) ( not ( = ?auto_267728 ?auto_267733 ) ) ( not ( = ?auto_267728 ?auto_267734 ) ) ( not ( = ?auto_267728 ?auto_267735 ) ) ( not ( = ?auto_267728 ?auto_267736 ) ) ( not ( = ?auto_267729 ?auto_267730 ) ) ( not ( = ?auto_267729 ?auto_267731 ) ) ( not ( = ?auto_267729 ?auto_267732 ) ) ( not ( = ?auto_267729 ?auto_267733 ) ) ( not ( = ?auto_267729 ?auto_267734 ) ) ( not ( = ?auto_267729 ?auto_267735 ) ) ( not ( = ?auto_267729 ?auto_267736 ) ) ( not ( = ?auto_267730 ?auto_267731 ) ) ( not ( = ?auto_267730 ?auto_267732 ) ) ( not ( = ?auto_267730 ?auto_267733 ) ) ( not ( = ?auto_267730 ?auto_267734 ) ) ( not ( = ?auto_267730 ?auto_267735 ) ) ( not ( = ?auto_267730 ?auto_267736 ) ) ( not ( = ?auto_267731 ?auto_267732 ) ) ( not ( = ?auto_267731 ?auto_267733 ) ) ( not ( = ?auto_267731 ?auto_267734 ) ) ( not ( = ?auto_267731 ?auto_267735 ) ) ( not ( = ?auto_267731 ?auto_267736 ) ) ( not ( = ?auto_267732 ?auto_267733 ) ) ( not ( = ?auto_267732 ?auto_267734 ) ) ( not ( = ?auto_267732 ?auto_267735 ) ) ( not ( = ?auto_267732 ?auto_267736 ) ) ( not ( = ?auto_267733 ?auto_267734 ) ) ( not ( = ?auto_267733 ?auto_267735 ) ) ( not ( = ?auto_267733 ?auto_267736 ) ) ( not ( = ?auto_267734 ?auto_267735 ) ) ( not ( = ?auto_267734 ?auto_267736 ) ) ( not ( = ?auto_267735 ?auto_267736 ) ) ( ON ?auto_267735 ?auto_267736 ) ( ON ?auto_267734 ?auto_267735 ) ( ON ?auto_267733 ?auto_267734 ) ( ON ?auto_267732 ?auto_267733 ) ( ON ?auto_267731 ?auto_267732 ) ( ON ?auto_267730 ?auto_267731 ) ( ON ?auto_267729 ?auto_267730 ) ( CLEAR ?auto_267727 ) ( ON ?auto_267728 ?auto_267729 ) ( CLEAR ?auto_267728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_267724 ?auto_267725 ?auto_267726 ?auto_267727 ?auto_267728 )
      ( MAKE-13PILE ?auto_267724 ?auto_267725 ?auto_267726 ?auto_267727 ?auto_267728 ?auto_267729 ?auto_267730 ?auto_267731 ?auto_267732 ?auto_267733 ?auto_267734 ?auto_267735 ?auto_267736 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267750 - BLOCK
      ?auto_267751 - BLOCK
      ?auto_267752 - BLOCK
      ?auto_267753 - BLOCK
      ?auto_267754 - BLOCK
      ?auto_267755 - BLOCK
      ?auto_267756 - BLOCK
      ?auto_267757 - BLOCK
      ?auto_267758 - BLOCK
      ?auto_267759 - BLOCK
      ?auto_267760 - BLOCK
      ?auto_267761 - BLOCK
      ?auto_267762 - BLOCK
    )
    :vars
    (
      ?auto_267763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267762 ?auto_267763 ) ( ON-TABLE ?auto_267750 ) ( ON ?auto_267751 ?auto_267750 ) ( ON ?auto_267752 ?auto_267751 ) ( not ( = ?auto_267750 ?auto_267751 ) ) ( not ( = ?auto_267750 ?auto_267752 ) ) ( not ( = ?auto_267750 ?auto_267753 ) ) ( not ( = ?auto_267750 ?auto_267754 ) ) ( not ( = ?auto_267750 ?auto_267755 ) ) ( not ( = ?auto_267750 ?auto_267756 ) ) ( not ( = ?auto_267750 ?auto_267757 ) ) ( not ( = ?auto_267750 ?auto_267758 ) ) ( not ( = ?auto_267750 ?auto_267759 ) ) ( not ( = ?auto_267750 ?auto_267760 ) ) ( not ( = ?auto_267750 ?auto_267761 ) ) ( not ( = ?auto_267750 ?auto_267762 ) ) ( not ( = ?auto_267750 ?auto_267763 ) ) ( not ( = ?auto_267751 ?auto_267752 ) ) ( not ( = ?auto_267751 ?auto_267753 ) ) ( not ( = ?auto_267751 ?auto_267754 ) ) ( not ( = ?auto_267751 ?auto_267755 ) ) ( not ( = ?auto_267751 ?auto_267756 ) ) ( not ( = ?auto_267751 ?auto_267757 ) ) ( not ( = ?auto_267751 ?auto_267758 ) ) ( not ( = ?auto_267751 ?auto_267759 ) ) ( not ( = ?auto_267751 ?auto_267760 ) ) ( not ( = ?auto_267751 ?auto_267761 ) ) ( not ( = ?auto_267751 ?auto_267762 ) ) ( not ( = ?auto_267751 ?auto_267763 ) ) ( not ( = ?auto_267752 ?auto_267753 ) ) ( not ( = ?auto_267752 ?auto_267754 ) ) ( not ( = ?auto_267752 ?auto_267755 ) ) ( not ( = ?auto_267752 ?auto_267756 ) ) ( not ( = ?auto_267752 ?auto_267757 ) ) ( not ( = ?auto_267752 ?auto_267758 ) ) ( not ( = ?auto_267752 ?auto_267759 ) ) ( not ( = ?auto_267752 ?auto_267760 ) ) ( not ( = ?auto_267752 ?auto_267761 ) ) ( not ( = ?auto_267752 ?auto_267762 ) ) ( not ( = ?auto_267752 ?auto_267763 ) ) ( not ( = ?auto_267753 ?auto_267754 ) ) ( not ( = ?auto_267753 ?auto_267755 ) ) ( not ( = ?auto_267753 ?auto_267756 ) ) ( not ( = ?auto_267753 ?auto_267757 ) ) ( not ( = ?auto_267753 ?auto_267758 ) ) ( not ( = ?auto_267753 ?auto_267759 ) ) ( not ( = ?auto_267753 ?auto_267760 ) ) ( not ( = ?auto_267753 ?auto_267761 ) ) ( not ( = ?auto_267753 ?auto_267762 ) ) ( not ( = ?auto_267753 ?auto_267763 ) ) ( not ( = ?auto_267754 ?auto_267755 ) ) ( not ( = ?auto_267754 ?auto_267756 ) ) ( not ( = ?auto_267754 ?auto_267757 ) ) ( not ( = ?auto_267754 ?auto_267758 ) ) ( not ( = ?auto_267754 ?auto_267759 ) ) ( not ( = ?auto_267754 ?auto_267760 ) ) ( not ( = ?auto_267754 ?auto_267761 ) ) ( not ( = ?auto_267754 ?auto_267762 ) ) ( not ( = ?auto_267754 ?auto_267763 ) ) ( not ( = ?auto_267755 ?auto_267756 ) ) ( not ( = ?auto_267755 ?auto_267757 ) ) ( not ( = ?auto_267755 ?auto_267758 ) ) ( not ( = ?auto_267755 ?auto_267759 ) ) ( not ( = ?auto_267755 ?auto_267760 ) ) ( not ( = ?auto_267755 ?auto_267761 ) ) ( not ( = ?auto_267755 ?auto_267762 ) ) ( not ( = ?auto_267755 ?auto_267763 ) ) ( not ( = ?auto_267756 ?auto_267757 ) ) ( not ( = ?auto_267756 ?auto_267758 ) ) ( not ( = ?auto_267756 ?auto_267759 ) ) ( not ( = ?auto_267756 ?auto_267760 ) ) ( not ( = ?auto_267756 ?auto_267761 ) ) ( not ( = ?auto_267756 ?auto_267762 ) ) ( not ( = ?auto_267756 ?auto_267763 ) ) ( not ( = ?auto_267757 ?auto_267758 ) ) ( not ( = ?auto_267757 ?auto_267759 ) ) ( not ( = ?auto_267757 ?auto_267760 ) ) ( not ( = ?auto_267757 ?auto_267761 ) ) ( not ( = ?auto_267757 ?auto_267762 ) ) ( not ( = ?auto_267757 ?auto_267763 ) ) ( not ( = ?auto_267758 ?auto_267759 ) ) ( not ( = ?auto_267758 ?auto_267760 ) ) ( not ( = ?auto_267758 ?auto_267761 ) ) ( not ( = ?auto_267758 ?auto_267762 ) ) ( not ( = ?auto_267758 ?auto_267763 ) ) ( not ( = ?auto_267759 ?auto_267760 ) ) ( not ( = ?auto_267759 ?auto_267761 ) ) ( not ( = ?auto_267759 ?auto_267762 ) ) ( not ( = ?auto_267759 ?auto_267763 ) ) ( not ( = ?auto_267760 ?auto_267761 ) ) ( not ( = ?auto_267760 ?auto_267762 ) ) ( not ( = ?auto_267760 ?auto_267763 ) ) ( not ( = ?auto_267761 ?auto_267762 ) ) ( not ( = ?auto_267761 ?auto_267763 ) ) ( not ( = ?auto_267762 ?auto_267763 ) ) ( ON ?auto_267761 ?auto_267762 ) ( ON ?auto_267760 ?auto_267761 ) ( ON ?auto_267759 ?auto_267760 ) ( ON ?auto_267758 ?auto_267759 ) ( ON ?auto_267757 ?auto_267758 ) ( ON ?auto_267756 ?auto_267757 ) ( ON ?auto_267755 ?auto_267756 ) ( ON ?auto_267754 ?auto_267755 ) ( CLEAR ?auto_267752 ) ( ON ?auto_267753 ?auto_267754 ) ( CLEAR ?auto_267753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_267750 ?auto_267751 ?auto_267752 ?auto_267753 )
      ( MAKE-13PILE ?auto_267750 ?auto_267751 ?auto_267752 ?auto_267753 ?auto_267754 ?auto_267755 ?auto_267756 ?auto_267757 ?auto_267758 ?auto_267759 ?auto_267760 ?auto_267761 ?auto_267762 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267777 - BLOCK
      ?auto_267778 - BLOCK
      ?auto_267779 - BLOCK
      ?auto_267780 - BLOCK
      ?auto_267781 - BLOCK
      ?auto_267782 - BLOCK
      ?auto_267783 - BLOCK
      ?auto_267784 - BLOCK
      ?auto_267785 - BLOCK
      ?auto_267786 - BLOCK
      ?auto_267787 - BLOCK
      ?auto_267788 - BLOCK
      ?auto_267789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267789 ) ( ON-TABLE ?auto_267777 ) ( ON ?auto_267778 ?auto_267777 ) ( ON ?auto_267779 ?auto_267778 ) ( not ( = ?auto_267777 ?auto_267778 ) ) ( not ( = ?auto_267777 ?auto_267779 ) ) ( not ( = ?auto_267777 ?auto_267780 ) ) ( not ( = ?auto_267777 ?auto_267781 ) ) ( not ( = ?auto_267777 ?auto_267782 ) ) ( not ( = ?auto_267777 ?auto_267783 ) ) ( not ( = ?auto_267777 ?auto_267784 ) ) ( not ( = ?auto_267777 ?auto_267785 ) ) ( not ( = ?auto_267777 ?auto_267786 ) ) ( not ( = ?auto_267777 ?auto_267787 ) ) ( not ( = ?auto_267777 ?auto_267788 ) ) ( not ( = ?auto_267777 ?auto_267789 ) ) ( not ( = ?auto_267778 ?auto_267779 ) ) ( not ( = ?auto_267778 ?auto_267780 ) ) ( not ( = ?auto_267778 ?auto_267781 ) ) ( not ( = ?auto_267778 ?auto_267782 ) ) ( not ( = ?auto_267778 ?auto_267783 ) ) ( not ( = ?auto_267778 ?auto_267784 ) ) ( not ( = ?auto_267778 ?auto_267785 ) ) ( not ( = ?auto_267778 ?auto_267786 ) ) ( not ( = ?auto_267778 ?auto_267787 ) ) ( not ( = ?auto_267778 ?auto_267788 ) ) ( not ( = ?auto_267778 ?auto_267789 ) ) ( not ( = ?auto_267779 ?auto_267780 ) ) ( not ( = ?auto_267779 ?auto_267781 ) ) ( not ( = ?auto_267779 ?auto_267782 ) ) ( not ( = ?auto_267779 ?auto_267783 ) ) ( not ( = ?auto_267779 ?auto_267784 ) ) ( not ( = ?auto_267779 ?auto_267785 ) ) ( not ( = ?auto_267779 ?auto_267786 ) ) ( not ( = ?auto_267779 ?auto_267787 ) ) ( not ( = ?auto_267779 ?auto_267788 ) ) ( not ( = ?auto_267779 ?auto_267789 ) ) ( not ( = ?auto_267780 ?auto_267781 ) ) ( not ( = ?auto_267780 ?auto_267782 ) ) ( not ( = ?auto_267780 ?auto_267783 ) ) ( not ( = ?auto_267780 ?auto_267784 ) ) ( not ( = ?auto_267780 ?auto_267785 ) ) ( not ( = ?auto_267780 ?auto_267786 ) ) ( not ( = ?auto_267780 ?auto_267787 ) ) ( not ( = ?auto_267780 ?auto_267788 ) ) ( not ( = ?auto_267780 ?auto_267789 ) ) ( not ( = ?auto_267781 ?auto_267782 ) ) ( not ( = ?auto_267781 ?auto_267783 ) ) ( not ( = ?auto_267781 ?auto_267784 ) ) ( not ( = ?auto_267781 ?auto_267785 ) ) ( not ( = ?auto_267781 ?auto_267786 ) ) ( not ( = ?auto_267781 ?auto_267787 ) ) ( not ( = ?auto_267781 ?auto_267788 ) ) ( not ( = ?auto_267781 ?auto_267789 ) ) ( not ( = ?auto_267782 ?auto_267783 ) ) ( not ( = ?auto_267782 ?auto_267784 ) ) ( not ( = ?auto_267782 ?auto_267785 ) ) ( not ( = ?auto_267782 ?auto_267786 ) ) ( not ( = ?auto_267782 ?auto_267787 ) ) ( not ( = ?auto_267782 ?auto_267788 ) ) ( not ( = ?auto_267782 ?auto_267789 ) ) ( not ( = ?auto_267783 ?auto_267784 ) ) ( not ( = ?auto_267783 ?auto_267785 ) ) ( not ( = ?auto_267783 ?auto_267786 ) ) ( not ( = ?auto_267783 ?auto_267787 ) ) ( not ( = ?auto_267783 ?auto_267788 ) ) ( not ( = ?auto_267783 ?auto_267789 ) ) ( not ( = ?auto_267784 ?auto_267785 ) ) ( not ( = ?auto_267784 ?auto_267786 ) ) ( not ( = ?auto_267784 ?auto_267787 ) ) ( not ( = ?auto_267784 ?auto_267788 ) ) ( not ( = ?auto_267784 ?auto_267789 ) ) ( not ( = ?auto_267785 ?auto_267786 ) ) ( not ( = ?auto_267785 ?auto_267787 ) ) ( not ( = ?auto_267785 ?auto_267788 ) ) ( not ( = ?auto_267785 ?auto_267789 ) ) ( not ( = ?auto_267786 ?auto_267787 ) ) ( not ( = ?auto_267786 ?auto_267788 ) ) ( not ( = ?auto_267786 ?auto_267789 ) ) ( not ( = ?auto_267787 ?auto_267788 ) ) ( not ( = ?auto_267787 ?auto_267789 ) ) ( not ( = ?auto_267788 ?auto_267789 ) ) ( ON ?auto_267788 ?auto_267789 ) ( ON ?auto_267787 ?auto_267788 ) ( ON ?auto_267786 ?auto_267787 ) ( ON ?auto_267785 ?auto_267786 ) ( ON ?auto_267784 ?auto_267785 ) ( ON ?auto_267783 ?auto_267784 ) ( ON ?auto_267782 ?auto_267783 ) ( ON ?auto_267781 ?auto_267782 ) ( CLEAR ?auto_267779 ) ( ON ?auto_267780 ?auto_267781 ) ( CLEAR ?auto_267780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_267777 ?auto_267778 ?auto_267779 ?auto_267780 )
      ( MAKE-13PILE ?auto_267777 ?auto_267778 ?auto_267779 ?auto_267780 ?auto_267781 ?auto_267782 ?auto_267783 ?auto_267784 ?auto_267785 ?auto_267786 ?auto_267787 ?auto_267788 ?auto_267789 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267803 - BLOCK
      ?auto_267804 - BLOCK
      ?auto_267805 - BLOCK
      ?auto_267806 - BLOCK
      ?auto_267807 - BLOCK
      ?auto_267808 - BLOCK
      ?auto_267809 - BLOCK
      ?auto_267810 - BLOCK
      ?auto_267811 - BLOCK
      ?auto_267812 - BLOCK
      ?auto_267813 - BLOCK
      ?auto_267814 - BLOCK
      ?auto_267815 - BLOCK
    )
    :vars
    (
      ?auto_267816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267815 ?auto_267816 ) ( ON-TABLE ?auto_267803 ) ( ON ?auto_267804 ?auto_267803 ) ( not ( = ?auto_267803 ?auto_267804 ) ) ( not ( = ?auto_267803 ?auto_267805 ) ) ( not ( = ?auto_267803 ?auto_267806 ) ) ( not ( = ?auto_267803 ?auto_267807 ) ) ( not ( = ?auto_267803 ?auto_267808 ) ) ( not ( = ?auto_267803 ?auto_267809 ) ) ( not ( = ?auto_267803 ?auto_267810 ) ) ( not ( = ?auto_267803 ?auto_267811 ) ) ( not ( = ?auto_267803 ?auto_267812 ) ) ( not ( = ?auto_267803 ?auto_267813 ) ) ( not ( = ?auto_267803 ?auto_267814 ) ) ( not ( = ?auto_267803 ?auto_267815 ) ) ( not ( = ?auto_267803 ?auto_267816 ) ) ( not ( = ?auto_267804 ?auto_267805 ) ) ( not ( = ?auto_267804 ?auto_267806 ) ) ( not ( = ?auto_267804 ?auto_267807 ) ) ( not ( = ?auto_267804 ?auto_267808 ) ) ( not ( = ?auto_267804 ?auto_267809 ) ) ( not ( = ?auto_267804 ?auto_267810 ) ) ( not ( = ?auto_267804 ?auto_267811 ) ) ( not ( = ?auto_267804 ?auto_267812 ) ) ( not ( = ?auto_267804 ?auto_267813 ) ) ( not ( = ?auto_267804 ?auto_267814 ) ) ( not ( = ?auto_267804 ?auto_267815 ) ) ( not ( = ?auto_267804 ?auto_267816 ) ) ( not ( = ?auto_267805 ?auto_267806 ) ) ( not ( = ?auto_267805 ?auto_267807 ) ) ( not ( = ?auto_267805 ?auto_267808 ) ) ( not ( = ?auto_267805 ?auto_267809 ) ) ( not ( = ?auto_267805 ?auto_267810 ) ) ( not ( = ?auto_267805 ?auto_267811 ) ) ( not ( = ?auto_267805 ?auto_267812 ) ) ( not ( = ?auto_267805 ?auto_267813 ) ) ( not ( = ?auto_267805 ?auto_267814 ) ) ( not ( = ?auto_267805 ?auto_267815 ) ) ( not ( = ?auto_267805 ?auto_267816 ) ) ( not ( = ?auto_267806 ?auto_267807 ) ) ( not ( = ?auto_267806 ?auto_267808 ) ) ( not ( = ?auto_267806 ?auto_267809 ) ) ( not ( = ?auto_267806 ?auto_267810 ) ) ( not ( = ?auto_267806 ?auto_267811 ) ) ( not ( = ?auto_267806 ?auto_267812 ) ) ( not ( = ?auto_267806 ?auto_267813 ) ) ( not ( = ?auto_267806 ?auto_267814 ) ) ( not ( = ?auto_267806 ?auto_267815 ) ) ( not ( = ?auto_267806 ?auto_267816 ) ) ( not ( = ?auto_267807 ?auto_267808 ) ) ( not ( = ?auto_267807 ?auto_267809 ) ) ( not ( = ?auto_267807 ?auto_267810 ) ) ( not ( = ?auto_267807 ?auto_267811 ) ) ( not ( = ?auto_267807 ?auto_267812 ) ) ( not ( = ?auto_267807 ?auto_267813 ) ) ( not ( = ?auto_267807 ?auto_267814 ) ) ( not ( = ?auto_267807 ?auto_267815 ) ) ( not ( = ?auto_267807 ?auto_267816 ) ) ( not ( = ?auto_267808 ?auto_267809 ) ) ( not ( = ?auto_267808 ?auto_267810 ) ) ( not ( = ?auto_267808 ?auto_267811 ) ) ( not ( = ?auto_267808 ?auto_267812 ) ) ( not ( = ?auto_267808 ?auto_267813 ) ) ( not ( = ?auto_267808 ?auto_267814 ) ) ( not ( = ?auto_267808 ?auto_267815 ) ) ( not ( = ?auto_267808 ?auto_267816 ) ) ( not ( = ?auto_267809 ?auto_267810 ) ) ( not ( = ?auto_267809 ?auto_267811 ) ) ( not ( = ?auto_267809 ?auto_267812 ) ) ( not ( = ?auto_267809 ?auto_267813 ) ) ( not ( = ?auto_267809 ?auto_267814 ) ) ( not ( = ?auto_267809 ?auto_267815 ) ) ( not ( = ?auto_267809 ?auto_267816 ) ) ( not ( = ?auto_267810 ?auto_267811 ) ) ( not ( = ?auto_267810 ?auto_267812 ) ) ( not ( = ?auto_267810 ?auto_267813 ) ) ( not ( = ?auto_267810 ?auto_267814 ) ) ( not ( = ?auto_267810 ?auto_267815 ) ) ( not ( = ?auto_267810 ?auto_267816 ) ) ( not ( = ?auto_267811 ?auto_267812 ) ) ( not ( = ?auto_267811 ?auto_267813 ) ) ( not ( = ?auto_267811 ?auto_267814 ) ) ( not ( = ?auto_267811 ?auto_267815 ) ) ( not ( = ?auto_267811 ?auto_267816 ) ) ( not ( = ?auto_267812 ?auto_267813 ) ) ( not ( = ?auto_267812 ?auto_267814 ) ) ( not ( = ?auto_267812 ?auto_267815 ) ) ( not ( = ?auto_267812 ?auto_267816 ) ) ( not ( = ?auto_267813 ?auto_267814 ) ) ( not ( = ?auto_267813 ?auto_267815 ) ) ( not ( = ?auto_267813 ?auto_267816 ) ) ( not ( = ?auto_267814 ?auto_267815 ) ) ( not ( = ?auto_267814 ?auto_267816 ) ) ( not ( = ?auto_267815 ?auto_267816 ) ) ( ON ?auto_267814 ?auto_267815 ) ( ON ?auto_267813 ?auto_267814 ) ( ON ?auto_267812 ?auto_267813 ) ( ON ?auto_267811 ?auto_267812 ) ( ON ?auto_267810 ?auto_267811 ) ( ON ?auto_267809 ?auto_267810 ) ( ON ?auto_267808 ?auto_267809 ) ( ON ?auto_267807 ?auto_267808 ) ( ON ?auto_267806 ?auto_267807 ) ( CLEAR ?auto_267804 ) ( ON ?auto_267805 ?auto_267806 ) ( CLEAR ?auto_267805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_267803 ?auto_267804 ?auto_267805 )
      ( MAKE-13PILE ?auto_267803 ?auto_267804 ?auto_267805 ?auto_267806 ?auto_267807 ?auto_267808 ?auto_267809 ?auto_267810 ?auto_267811 ?auto_267812 ?auto_267813 ?auto_267814 ?auto_267815 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267830 - BLOCK
      ?auto_267831 - BLOCK
      ?auto_267832 - BLOCK
      ?auto_267833 - BLOCK
      ?auto_267834 - BLOCK
      ?auto_267835 - BLOCK
      ?auto_267836 - BLOCK
      ?auto_267837 - BLOCK
      ?auto_267838 - BLOCK
      ?auto_267839 - BLOCK
      ?auto_267840 - BLOCK
      ?auto_267841 - BLOCK
      ?auto_267842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267842 ) ( ON-TABLE ?auto_267830 ) ( ON ?auto_267831 ?auto_267830 ) ( not ( = ?auto_267830 ?auto_267831 ) ) ( not ( = ?auto_267830 ?auto_267832 ) ) ( not ( = ?auto_267830 ?auto_267833 ) ) ( not ( = ?auto_267830 ?auto_267834 ) ) ( not ( = ?auto_267830 ?auto_267835 ) ) ( not ( = ?auto_267830 ?auto_267836 ) ) ( not ( = ?auto_267830 ?auto_267837 ) ) ( not ( = ?auto_267830 ?auto_267838 ) ) ( not ( = ?auto_267830 ?auto_267839 ) ) ( not ( = ?auto_267830 ?auto_267840 ) ) ( not ( = ?auto_267830 ?auto_267841 ) ) ( not ( = ?auto_267830 ?auto_267842 ) ) ( not ( = ?auto_267831 ?auto_267832 ) ) ( not ( = ?auto_267831 ?auto_267833 ) ) ( not ( = ?auto_267831 ?auto_267834 ) ) ( not ( = ?auto_267831 ?auto_267835 ) ) ( not ( = ?auto_267831 ?auto_267836 ) ) ( not ( = ?auto_267831 ?auto_267837 ) ) ( not ( = ?auto_267831 ?auto_267838 ) ) ( not ( = ?auto_267831 ?auto_267839 ) ) ( not ( = ?auto_267831 ?auto_267840 ) ) ( not ( = ?auto_267831 ?auto_267841 ) ) ( not ( = ?auto_267831 ?auto_267842 ) ) ( not ( = ?auto_267832 ?auto_267833 ) ) ( not ( = ?auto_267832 ?auto_267834 ) ) ( not ( = ?auto_267832 ?auto_267835 ) ) ( not ( = ?auto_267832 ?auto_267836 ) ) ( not ( = ?auto_267832 ?auto_267837 ) ) ( not ( = ?auto_267832 ?auto_267838 ) ) ( not ( = ?auto_267832 ?auto_267839 ) ) ( not ( = ?auto_267832 ?auto_267840 ) ) ( not ( = ?auto_267832 ?auto_267841 ) ) ( not ( = ?auto_267832 ?auto_267842 ) ) ( not ( = ?auto_267833 ?auto_267834 ) ) ( not ( = ?auto_267833 ?auto_267835 ) ) ( not ( = ?auto_267833 ?auto_267836 ) ) ( not ( = ?auto_267833 ?auto_267837 ) ) ( not ( = ?auto_267833 ?auto_267838 ) ) ( not ( = ?auto_267833 ?auto_267839 ) ) ( not ( = ?auto_267833 ?auto_267840 ) ) ( not ( = ?auto_267833 ?auto_267841 ) ) ( not ( = ?auto_267833 ?auto_267842 ) ) ( not ( = ?auto_267834 ?auto_267835 ) ) ( not ( = ?auto_267834 ?auto_267836 ) ) ( not ( = ?auto_267834 ?auto_267837 ) ) ( not ( = ?auto_267834 ?auto_267838 ) ) ( not ( = ?auto_267834 ?auto_267839 ) ) ( not ( = ?auto_267834 ?auto_267840 ) ) ( not ( = ?auto_267834 ?auto_267841 ) ) ( not ( = ?auto_267834 ?auto_267842 ) ) ( not ( = ?auto_267835 ?auto_267836 ) ) ( not ( = ?auto_267835 ?auto_267837 ) ) ( not ( = ?auto_267835 ?auto_267838 ) ) ( not ( = ?auto_267835 ?auto_267839 ) ) ( not ( = ?auto_267835 ?auto_267840 ) ) ( not ( = ?auto_267835 ?auto_267841 ) ) ( not ( = ?auto_267835 ?auto_267842 ) ) ( not ( = ?auto_267836 ?auto_267837 ) ) ( not ( = ?auto_267836 ?auto_267838 ) ) ( not ( = ?auto_267836 ?auto_267839 ) ) ( not ( = ?auto_267836 ?auto_267840 ) ) ( not ( = ?auto_267836 ?auto_267841 ) ) ( not ( = ?auto_267836 ?auto_267842 ) ) ( not ( = ?auto_267837 ?auto_267838 ) ) ( not ( = ?auto_267837 ?auto_267839 ) ) ( not ( = ?auto_267837 ?auto_267840 ) ) ( not ( = ?auto_267837 ?auto_267841 ) ) ( not ( = ?auto_267837 ?auto_267842 ) ) ( not ( = ?auto_267838 ?auto_267839 ) ) ( not ( = ?auto_267838 ?auto_267840 ) ) ( not ( = ?auto_267838 ?auto_267841 ) ) ( not ( = ?auto_267838 ?auto_267842 ) ) ( not ( = ?auto_267839 ?auto_267840 ) ) ( not ( = ?auto_267839 ?auto_267841 ) ) ( not ( = ?auto_267839 ?auto_267842 ) ) ( not ( = ?auto_267840 ?auto_267841 ) ) ( not ( = ?auto_267840 ?auto_267842 ) ) ( not ( = ?auto_267841 ?auto_267842 ) ) ( ON ?auto_267841 ?auto_267842 ) ( ON ?auto_267840 ?auto_267841 ) ( ON ?auto_267839 ?auto_267840 ) ( ON ?auto_267838 ?auto_267839 ) ( ON ?auto_267837 ?auto_267838 ) ( ON ?auto_267836 ?auto_267837 ) ( ON ?auto_267835 ?auto_267836 ) ( ON ?auto_267834 ?auto_267835 ) ( ON ?auto_267833 ?auto_267834 ) ( CLEAR ?auto_267831 ) ( ON ?auto_267832 ?auto_267833 ) ( CLEAR ?auto_267832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_267830 ?auto_267831 ?auto_267832 )
      ( MAKE-13PILE ?auto_267830 ?auto_267831 ?auto_267832 ?auto_267833 ?auto_267834 ?auto_267835 ?auto_267836 ?auto_267837 ?auto_267838 ?auto_267839 ?auto_267840 ?auto_267841 ?auto_267842 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267856 - BLOCK
      ?auto_267857 - BLOCK
      ?auto_267858 - BLOCK
      ?auto_267859 - BLOCK
      ?auto_267860 - BLOCK
      ?auto_267861 - BLOCK
      ?auto_267862 - BLOCK
      ?auto_267863 - BLOCK
      ?auto_267864 - BLOCK
      ?auto_267865 - BLOCK
      ?auto_267866 - BLOCK
      ?auto_267867 - BLOCK
      ?auto_267868 - BLOCK
    )
    :vars
    (
      ?auto_267869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267868 ?auto_267869 ) ( ON-TABLE ?auto_267856 ) ( not ( = ?auto_267856 ?auto_267857 ) ) ( not ( = ?auto_267856 ?auto_267858 ) ) ( not ( = ?auto_267856 ?auto_267859 ) ) ( not ( = ?auto_267856 ?auto_267860 ) ) ( not ( = ?auto_267856 ?auto_267861 ) ) ( not ( = ?auto_267856 ?auto_267862 ) ) ( not ( = ?auto_267856 ?auto_267863 ) ) ( not ( = ?auto_267856 ?auto_267864 ) ) ( not ( = ?auto_267856 ?auto_267865 ) ) ( not ( = ?auto_267856 ?auto_267866 ) ) ( not ( = ?auto_267856 ?auto_267867 ) ) ( not ( = ?auto_267856 ?auto_267868 ) ) ( not ( = ?auto_267856 ?auto_267869 ) ) ( not ( = ?auto_267857 ?auto_267858 ) ) ( not ( = ?auto_267857 ?auto_267859 ) ) ( not ( = ?auto_267857 ?auto_267860 ) ) ( not ( = ?auto_267857 ?auto_267861 ) ) ( not ( = ?auto_267857 ?auto_267862 ) ) ( not ( = ?auto_267857 ?auto_267863 ) ) ( not ( = ?auto_267857 ?auto_267864 ) ) ( not ( = ?auto_267857 ?auto_267865 ) ) ( not ( = ?auto_267857 ?auto_267866 ) ) ( not ( = ?auto_267857 ?auto_267867 ) ) ( not ( = ?auto_267857 ?auto_267868 ) ) ( not ( = ?auto_267857 ?auto_267869 ) ) ( not ( = ?auto_267858 ?auto_267859 ) ) ( not ( = ?auto_267858 ?auto_267860 ) ) ( not ( = ?auto_267858 ?auto_267861 ) ) ( not ( = ?auto_267858 ?auto_267862 ) ) ( not ( = ?auto_267858 ?auto_267863 ) ) ( not ( = ?auto_267858 ?auto_267864 ) ) ( not ( = ?auto_267858 ?auto_267865 ) ) ( not ( = ?auto_267858 ?auto_267866 ) ) ( not ( = ?auto_267858 ?auto_267867 ) ) ( not ( = ?auto_267858 ?auto_267868 ) ) ( not ( = ?auto_267858 ?auto_267869 ) ) ( not ( = ?auto_267859 ?auto_267860 ) ) ( not ( = ?auto_267859 ?auto_267861 ) ) ( not ( = ?auto_267859 ?auto_267862 ) ) ( not ( = ?auto_267859 ?auto_267863 ) ) ( not ( = ?auto_267859 ?auto_267864 ) ) ( not ( = ?auto_267859 ?auto_267865 ) ) ( not ( = ?auto_267859 ?auto_267866 ) ) ( not ( = ?auto_267859 ?auto_267867 ) ) ( not ( = ?auto_267859 ?auto_267868 ) ) ( not ( = ?auto_267859 ?auto_267869 ) ) ( not ( = ?auto_267860 ?auto_267861 ) ) ( not ( = ?auto_267860 ?auto_267862 ) ) ( not ( = ?auto_267860 ?auto_267863 ) ) ( not ( = ?auto_267860 ?auto_267864 ) ) ( not ( = ?auto_267860 ?auto_267865 ) ) ( not ( = ?auto_267860 ?auto_267866 ) ) ( not ( = ?auto_267860 ?auto_267867 ) ) ( not ( = ?auto_267860 ?auto_267868 ) ) ( not ( = ?auto_267860 ?auto_267869 ) ) ( not ( = ?auto_267861 ?auto_267862 ) ) ( not ( = ?auto_267861 ?auto_267863 ) ) ( not ( = ?auto_267861 ?auto_267864 ) ) ( not ( = ?auto_267861 ?auto_267865 ) ) ( not ( = ?auto_267861 ?auto_267866 ) ) ( not ( = ?auto_267861 ?auto_267867 ) ) ( not ( = ?auto_267861 ?auto_267868 ) ) ( not ( = ?auto_267861 ?auto_267869 ) ) ( not ( = ?auto_267862 ?auto_267863 ) ) ( not ( = ?auto_267862 ?auto_267864 ) ) ( not ( = ?auto_267862 ?auto_267865 ) ) ( not ( = ?auto_267862 ?auto_267866 ) ) ( not ( = ?auto_267862 ?auto_267867 ) ) ( not ( = ?auto_267862 ?auto_267868 ) ) ( not ( = ?auto_267862 ?auto_267869 ) ) ( not ( = ?auto_267863 ?auto_267864 ) ) ( not ( = ?auto_267863 ?auto_267865 ) ) ( not ( = ?auto_267863 ?auto_267866 ) ) ( not ( = ?auto_267863 ?auto_267867 ) ) ( not ( = ?auto_267863 ?auto_267868 ) ) ( not ( = ?auto_267863 ?auto_267869 ) ) ( not ( = ?auto_267864 ?auto_267865 ) ) ( not ( = ?auto_267864 ?auto_267866 ) ) ( not ( = ?auto_267864 ?auto_267867 ) ) ( not ( = ?auto_267864 ?auto_267868 ) ) ( not ( = ?auto_267864 ?auto_267869 ) ) ( not ( = ?auto_267865 ?auto_267866 ) ) ( not ( = ?auto_267865 ?auto_267867 ) ) ( not ( = ?auto_267865 ?auto_267868 ) ) ( not ( = ?auto_267865 ?auto_267869 ) ) ( not ( = ?auto_267866 ?auto_267867 ) ) ( not ( = ?auto_267866 ?auto_267868 ) ) ( not ( = ?auto_267866 ?auto_267869 ) ) ( not ( = ?auto_267867 ?auto_267868 ) ) ( not ( = ?auto_267867 ?auto_267869 ) ) ( not ( = ?auto_267868 ?auto_267869 ) ) ( ON ?auto_267867 ?auto_267868 ) ( ON ?auto_267866 ?auto_267867 ) ( ON ?auto_267865 ?auto_267866 ) ( ON ?auto_267864 ?auto_267865 ) ( ON ?auto_267863 ?auto_267864 ) ( ON ?auto_267862 ?auto_267863 ) ( ON ?auto_267861 ?auto_267862 ) ( ON ?auto_267860 ?auto_267861 ) ( ON ?auto_267859 ?auto_267860 ) ( ON ?auto_267858 ?auto_267859 ) ( CLEAR ?auto_267856 ) ( ON ?auto_267857 ?auto_267858 ) ( CLEAR ?auto_267857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_267856 ?auto_267857 )
      ( MAKE-13PILE ?auto_267856 ?auto_267857 ?auto_267858 ?auto_267859 ?auto_267860 ?auto_267861 ?auto_267862 ?auto_267863 ?auto_267864 ?auto_267865 ?auto_267866 ?auto_267867 ?auto_267868 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267883 - BLOCK
      ?auto_267884 - BLOCK
      ?auto_267885 - BLOCK
      ?auto_267886 - BLOCK
      ?auto_267887 - BLOCK
      ?auto_267888 - BLOCK
      ?auto_267889 - BLOCK
      ?auto_267890 - BLOCK
      ?auto_267891 - BLOCK
      ?auto_267892 - BLOCK
      ?auto_267893 - BLOCK
      ?auto_267894 - BLOCK
      ?auto_267895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267895 ) ( ON-TABLE ?auto_267883 ) ( not ( = ?auto_267883 ?auto_267884 ) ) ( not ( = ?auto_267883 ?auto_267885 ) ) ( not ( = ?auto_267883 ?auto_267886 ) ) ( not ( = ?auto_267883 ?auto_267887 ) ) ( not ( = ?auto_267883 ?auto_267888 ) ) ( not ( = ?auto_267883 ?auto_267889 ) ) ( not ( = ?auto_267883 ?auto_267890 ) ) ( not ( = ?auto_267883 ?auto_267891 ) ) ( not ( = ?auto_267883 ?auto_267892 ) ) ( not ( = ?auto_267883 ?auto_267893 ) ) ( not ( = ?auto_267883 ?auto_267894 ) ) ( not ( = ?auto_267883 ?auto_267895 ) ) ( not ( = ?auto_267884 ?auto_267885 ) ) ( not ( = ?auto_267884 ?auto_267886 ) ) ( not ( = ?auto_267884 ?auto_267887 ) ) ( not ( = ?auto_267884 ?auto_267888 ) ) ( not ( = ?auto_267884 ?auto_267889 ) ) ( not ( = ?auto_267884 ?auto_267890 ) ) ( not ( = ?auto_267884 ?auto_267891 ) ) ( not ( = ?auto_267884 ?auto_267892 ) ) ( not ( = ?auto_267884 ?auto_267893 ) ) ( not ( = ?auto_267884 ?auto_267894 ) ) ( not ( = ?auto_267884 ?auto_267895 ) ) ( not ( = ?auto_267885 ?auto_267886 ) ) ( not ( = ?auto_267885 ?auto_267887 ) ) ( not ( = ?auto_267885 ?auto_267888 ) ) ( not ( = ?auto_267885 ?auto_267889 ) ) ( not ( = ?auto_267885 ?auto_267890 ) ) ( not ( = ?auto_267885 ?auto_267891 ) ) ( not ( = ?auto_267885 ?auto_267892 ) ) ( not ( = ?auto_267885 ?auto_267893 ) ) ( not ( = ?auto_267885 ?auto_267894 ) ) ( not ( = ?auto_267885 ?auto_267895 ) ) ( not ( = ?auto_267886 ?auto_267887 ) ) ( not ( = ?auto_267886 ?auto_267888 ) ) ( not ( = ?auto_267886 ?auto_267889 ) ) ( not ( = ?auto_267886 ?auto_267890 ) ) ( not ( = ?auto_267886 ?auto_267891 ) ) ( not ( = ?auto_267886 ?auto_267892 ) ) ( not ( = ?auto_267886 ?auto_267893 ) ) ( not ( = ?auto_267886 ?auto_267894 ) ) ( not ( = ?auto_267886 ?auto_267895 ) ) ( not ( = ?auto_267887 ?auto_267888 ) ) ( not ( = ?auto_267887 ?auto_267889 ) ) ( not ( = ?auto_267887 ?auto_267890 ) ) ( not ( = ?auto_267887 ?auto_267891 ) ) ( not ( = ?auto_267887 ?auto_267892 ) ) ( not ( = ?auto_267887 ?auto_267893 ) ) ( not ( = ?auto_267887 ?auto_267894 ) ) ( not ( = ?auto_267887 ?auto_267895 ) ) ( not ( = ?auto_267888 ?auto_267889 ) ) ( not ( = ?auto_267888 ?auto_267890 ) ) ( not ( = ?auto_267888 ?auto_267891 ) ) ( not ( = ?auto_267888 ?auto_267892 ) ) ( not ( = ?auto_267888 ?auto_267893 ) ) ( not ( = ?auto_267888 ?auto_267894 ) ) ( not ( = ?auto_267888 ?auto_267895 ) ) ( not ( = ?auto_267889 ?auto_267890 ) ) ( not ( = ?auto_267889 ?auto_267891 ) ) ( not ( = ?auto_267889 ?auto_267892 ) ) ( not ( = ?auto_267889 ?auto_267893 ) ) ( not ( = ?auto_267889 ?auto_267894 ) ) ( not ( = ?auto_267889 ?auto_267895 ) ) ( not ( = ?auto_267890 ?auto_267891 ) ) ( not ( = ?auto_267890 ?auto_267892 ) ) ( not ( = ?auto_267890 ?auto_267893 ) ) ( not ( = ?auto_267890 ?auto_267894 ) ) ( not ( = ?auto_267890 ?auto_267895 ) ) ( not ( = ?auto_267891 ?auto_267892 ) ) ( not ( = ?auto_267891 ?auto_267893 ) ) ( not ( = ?auto_267891 ?auto_267894 ) ) ( not ( = ?auto_267891 ?auto_267895 ) ) ( not ( = ?auto_267892 ?auto_267893 ) ) ( not ( = ?auto_267892 ?auto_267894 ) ) ( not ( = ?auto_267892 ?auto_267895 ) ) ( not ( = ?auto_267893 ?auto_267894 ) ) ( not ( = ?auto_267893 ?auto_267895 ) ) ( not ( = ?auto_267894 ?auto_267895 ) ) ( ON ?auto_267894 ?auto_267895 ) ( ON ?auto_267893 ?auto_267894 ) ( ON ?auto_267892 ?auto_267893 ) ( ON ?auto_267891 ?auto_267892 ) ( ON ?auto_267890 ?auto_267891 ) ( ON ?auto_267889 ?auto_267890 ) ( ON ?auto_267888 ?auto_267889 ) ( ON ?auto_267887 ?auto_267888 ) ( ON ?auto_267886 ?auto_267887 ) ( ON ?auto_267885 ?auto_267886 ) ( CLEAR ?auto_267883 ) ( ON ?auto_267884 ?auto_267885 ) ( CLEAR ?auto_267884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_267883 ?auto_267884 )
      ( MAKE-13PILE ?auto_267883 ?auto_267884 ?auto_267885 ?auto_267886 ?auto_267887 ?auto_267888 ?auto_267889 ?auto_267890 ?auto_267891 ?auto_267892 ?auto_267893 ?auto_267894 ?auto_267895 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267909 - BLOCK
      ?auto_267910 - BLOCK
      ?auto_267911 - BLOCK
      ?auto_267912 - BLOCK
      ?auto_267913 - BLOCK
      ?auto_267914 - BLOCK
      ?auto_267915 - BLOCK
      ?auto_267916 - BLOCK
      ?auto_267917 - BLOCK
      ?auto_267918 - BLOCK
      ?auto_267919 - BLOCK
      ?auto_267920 - BLOCK
      ?auto_267921 - BLOCK
    )
    :vars
    (
      ?auto_267922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_267921 ?auto_267922 ) ( not ( = ?auto_267909 ?auto_267910 ) ) ( not ( = ?auto_267909 ?auto_267911 ) ) ( not ( = ?auto_267909 ?auto_267912 ) ) ( not ( = ?auto_267909 ?auto_267913 ) ) ( not ( = ?auto_267909 ?auto_267914 ) ) ( not ( = ?auto_267909 ?auto_267915 ) ) ( not ( = ?auto_267909 ?auto_267916 ) ) ( not ( = ?auto_267909 ?auto_267917 ) ) ( not ( = ?auto_267909 ?auto_267918 ) ) ( not ( = ?auto_267909 ?auto_267919 ) ) ( not ( = ?auto_267909 ?auto_267920 ) ) ( not ( = ?auto_267909 ?auto_267921 ) ) ( not ( = ?auto_267909 ?auto_267922 ) ) ( not ( = ?auto_267910 ?auto_267911 ) ) ( not ( = ?auto_267910 ?auto_267912 ) ) ( not ( = ?auto_267910 ?auto_267913 ) ) ( not ( = ?auto_267910 ?auto_267914 ) ) ( not ( = ?auto_267910 ?auto_267915 ) ) ( not ( = ?auto_267910 ?auto_267916 ) ) ( not ( = ?auto_267910 ?auto_267917 ) ) ( not ( = ?auto_267910 ?auto_267918 ) ) ( not ( = ?auto_267910 ?auto_267919 ) ) ( not ( = ?auto_267910 ?auto_267920 ) ) ( not ( = ?auto_267910 ?auto_267921 ) ) ( not ( = ?auto_267910 ?auto_267922 ) ) ( not ( = ?auto_267911 ?auto_267912 ) ) ( not ( = ?auto_267911 ?auto_267913 ) ) ( not ( = ?auto_267911 ?auto_267914 ) ) ( not ( = ?auto_267911 ?auto_267915 ) ) ( not ( = ?auto_267911 ?auto_267916 ) ) ( not ( = ?auto_267911 ?auto_267917 ) ) ( not ( = ?auto_267911 ?auto_267918 ) ) ( not ( = ?auto_267911 ?auto_267919 ) ) ( not ( = ?auto_267911 ?auto_267920 ) ) ( not ( = ?auto_267911 ?auto_267921 ) ) ( not ( = ?auto_267911 ?auto_267922 ) ) ( not ( = ?auto_267912 ?auto_267913 ) ) ( not ( = ?auto_267912 ?auto_267914 ) ) ( not ( = ?auto_267912 ?auto_267915 ) ) ( not ( = ?auto_267912 ?auto_267916 ) ) ( not ( = ?auto_267912 ?auto_267917 ) ) ( not ( = ?auto_267912 ?auto_267918 ) ) ( not ( = ?auto_267912 ?auto_267919 ) ) ( not ( = ?auto_267912 ?auto_267920 ) ) ( not ( = ?auto_267912 ?auto_267921 ) ) ( not ( = ?auto_267912 ?auto_267922 ) ) ( not ( = ?auto_267913 ?auto_267914 ) ) ( not ( = ?auto_267913 ?auto_267915 ) ) ( not ( = ?auto_267913 ?auto_267916 ) ) ( not ( = ?auto_267913 ?auto_267917 ) ) ( not ( = ?auto_267913 ?auto_267918 ) ) ( not ( = ?auto_267913 ?auto_267919 ) ) ( not ( = ?auto_267913 ?auto_267920 ) ) ( not ( = ?auto_267913 ?auto_267921 ) ) ( not ( = ?auto_267913 ?auto_267922 ) ) ( not ( = ?auto_267914 ?auto_267915 ) ) ( not ( = ?auto_267914 ?auto_267916 ) ) ( not ( = ?auto_267914 ?auto_267917 ) ) ( not ( = ?auto_267914 ?auto_267918 ) ) ( not ( = ?auto_267914 ?auto_267919 ) ) ( not ( = ?auto_267914 ?auto_267920 ) ) ( not ( = ?auto_267914 ?auto_267921 ) ) ( not ( = ?auto_267914 ?auto_267922 ) ) ( not ( = ?auto_267915 ?auto_267916 ) ) ( not ( = ?auto_267915 ?auto_267917 ) ) ( not ( = ?auto_267915 ?auto_267918 ) ) ( not ( = ?auto_267915 ?auto_267919 ) ) ( not ( = ?auto_267915 ?auto_267920 ) ) ( not ( = ?auto_267915 ?auto_267921 ) ) ( not ( = ?auto_267915 ?auto_267922 ) ) ( not ( = ?auto_267916 ?auto_267917 ) ) ( not ( = ?auto_267916 ?auto_267918 ) ) ( not ( = ?auto_267916 ?auto_267919 ) ) ( not ( = ?auto_267916 ?auto_267920 ) ) ( not ( = ?auto_267916 ?auto_267921 ) ) ( not ( = ?auto_267916 ?auto_267922 ) ) ( not ( = ?auto_267917 ?auto_267918 ) ) ( not ( = ?auto_267917 ?auto_267919 ) ) ( not ( = ?auto_267917 ?auto_267920 ) ) ( not ( = ?auto_267917 ?auto_267921 ) ) ( not ( = ?auto_267917 ?auto_267922 ) ) ( not ( = ?auto_267918 ?auto_267919 ) ) ( not ( = ?auto_267918 ?auto_267920 ) ) ( not ( = ?auto_267918 ?auto_267921 ) ) ( not ( = ?auto_267918 ?auto_267922 ) ) ( not ( = ?auto_267919 ?auto_267920 ) ) ( not ( = ?auto_267919 ?auto_267921 ) ) ( not ( = ?auto_267919 ?auto_267922 ) ) ( not ( = ?auto_267920 ?auto_267921 ) ) ( not ( = ?auto_267920 ?auto_267922 ) ) ( not ( = ?auto_267921 ?auto_267922 ) ) ( ON ?auto_267920 ?auto_267921 ) ( ON ?auto_267919 ?auto_267920 ) ( ON ?auto_267918 ?auto_267919 ) ( ON ?auto_267917 ?auto_267918 ) ( ON ?auto_267916 ?auto_267917 ) ( ON ?auto_267915 ?auto_267916 ) ( ON ?auto_267914 ?auto_267915 ) ( ON ?auto_267913 ?auto_267914 ) ( ON ?auto_267912 ?auto_267913 ) ( ON ?auto_267911 ?auto_267912 ) ( ON ?auto_267910 ?auto_267911 ) ( ON ?auto_267909 ?auto_267910 ) ( CLEAR ?auto_267909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267909 )
      ( MAKE-13PILE ?auto_267909 ?auto_267910 ?auto_267911 ?auto_267912 ?auto_267913 ?auto_267914 ?auto_267915 ?auto_267916 ?auto_267917 ?auto_267918 ?auto_267919 ?auto_267920 ?auto_267921 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267936 - BLOCK
      ?auto_267937 - BLOCK
      ?auto_267938 - BLOCK
      ?auto_267939 - BLOCK
      ?auto_267940 - BLOCK
      ?auto_267941 - BLOCK
      ?auto_267942 - BLOCK
      ?auto_267943 - BLOCK
      ?auto_267944 - BLOCK
      ?auto_267945 - BLOCK
      ?auto_267946 - BLOCK
      ?auto_267947 - BLOCK
      ?auto_267948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_267948 ) ( not ( = ?auto_267936 ?auto_267937 ) ) ( not ( = ?auto_267936 ?auto_267938 ) ) ( not ( = ?auto_267936 ?auto_267939 ) ) ( not ( = ?auto_267936 ?auto_267940 ) ) ( not ( = ?auto_267936 ?auto_267941 ) ) ( not ( = ?auto_267936 ?auto_267942 ) ) ( not ( = ?auto_267936 ?auto_267943 ) ) ( not ( = ?auto_267936 ?auto_267944 ) ) ( not ( = ?auto_267936 ?auto_267945 ) ) ( not ( = ?auto_267936 ?auto_267946 ) ) ( not ( = ?auto_267936 ?auto_267947 ) ) ( not ( = ?auto_267936 ?auto_267948 ) ) ( not ( = ?auto_267937 ?auto_267938 ) ) ( not ( = ?auto_267937 ?auto_267939 ) ) ( not ( = ?auto_267937 ?auto_267940 ) ) ( not ( = ?auto_267937 ?auto_267941 ) ) ( not ( = ?auto_267937 ?auto_267942 ) ) ( not ( = ?auto_267937 ?auto_267943 ) ) ( not ( = ?auto_267937 ?auto_267944 ) ) ( not ( = ?auto_267937 ?auto_267945 ) ) ( not ( = ?auto_267937 ?auto_267946 ) ) ( not ( = ?auto_267937 ?auto_267947 ) ) ( not ( = ?auto_267937 ?auto_267948 ) ) ( not ( = ?auto_267938 ?auto_267939 ) ) ( not ( = ?auto_267938 ?auto_267940 ) ) ( not ( = ?auto_267938 ?auto_267941 ) ) ( not ( = ?auto_267938 ?auto_267942 ) ) ( not ( = ?auto_267938 ?auto_267943 ) ) ( not ( = ?auto_267938 ?auto_267944 ) ) ( not ( = ?auto_267938 ?auto_267945 ) ) ( not ( = ?auto_267938 ?auto_267946 ) ) ( not ( = ?auto_267938 ?auto_267947 ) ) ( not ( = ?auto_267938 ?auto_267948 ) ) ( not ( = ?auto_267939 ?auto_267940 ) ) ( not ( = ?auto_267939 ?auto_267941 ) ) ( not ( = ?auto_267939 ?auto_267942 ) ) ( not ( = ?auto_267939 ?auto_267943 ) ) ( not ( = ?auto_267939 ?auto_267944 ) ) ( not ( = ?auto_267939 ?auto_267945 ) ) ( not ( = ?auto_267939 ?auto_267946 ) ) ( not ( = ?auto_267939 ?auto_267947 ) ) ( not ( = ?auto_267939 ?auto_267948 ) ) ( not ( = ?auto_267940 ?auto_267941 ) ) ( not ( = ?auto_267940 ?auto_267942 ) ) ( not ( = ?auto_267940 ?auto_267943 ) ) ( not ( = ?auto_267940 ?auto_267944 ) ) ( not ( = ?auto_267940 ?auto_267945 ) ) ( not ( = ?auto_267940 ?auto_267946 ) ) ( not ( = ?auto_267940 ?auto_267947 ) ) ( not ( = ?auto_267940 ?auto_267948 ) ) ( not ( = ?auto_267941 ?auto_267942 ) ) ( not ( = ?auto_267941 ?auto_267943 ) ) ( not ( = ?auto_267941 ?auto_267944 ) ) ( not ( = ?auto_267941 ?auto_267945 ) ) ( not ( = ?auto_267941 ?auto_267946 ) ) ( not ( = ?auto_267941 ?auto_267947 ) ) ( not ( = ?auto_267941 ?auto_267948 ) ) ( not ( = ?auto_267942 ?auto_267943 ) ) ( not ( = ?auto_267942 ?auto_267944 ) ) ( not ( = ?auto_267942 ?auto_267945 ) ) ( not ( = ?auto_267942 ?auto_267946 ) ) ( not ( = ?auto_267942 ?auto_267947 ) ) ( not ( = ?auto_267942 ?auto_267948 ) ) ( not ( = ?auto_267943 ?auto_267944 ) ) ( not ( = ?auto_267943 ?auto_267945 ) ) ( not ( = ?auto_267943 ?auto_267946 ) ) ( not ( = ?auto_267943 ?auto_267947 ) ) ( not ( = ?auto_267943 ?auto_267948 ) ) ( not ( = ?auto_267944 ?auto_267945 ) ) ( not ( = ?auto_267944 ?auto_267946 ) ) ( not ( = ?auto_267944 ?auto_267947 ) ) ( not ( = ?auto_267944 ?auto_267948 ) ) ( not ( = ?auto_267945 ?auto_267946 ) ) ( not ( = ?auto_267945 ?auto_267947 ) ) ( not ( = ?auto_267945 ?auto_267948 ) ) ( not ( = ?auto_267946 ?auto_267947 ) ) ( not ( = ?auto_267946 ?auto_267948 ) ) ( not ( = ?auto_267947 ?auto_267948 ) ) ( ON ?auto_267947 ?auto_267948 ) ( ON ?auto_267946 ?auto_267947 ) ( ON ?auto_267945 ?auto_267946 ) ( ON ?auto_267944 ?auto_267945 ) ( ON ?auto_267943 ?auto_267944 ) ( ON ?auto_267942 ?auto_267943 ) ( ON ?auto_267941 ?auto_267942 ) ( ON ?auto_267940 ?auto_267941 ) ( ON ?auto_267939 ?auto_267940 ) ( ON ?auto_267938 ?auto_267939 ) ( ON ?auto_267937 ?auto_267938 ) ( ON ?auto_267936 ?auto_267937 ) ( CLEAR ?auto_267936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_267936 )
      ( MAKE-13PILE ?auto_267936 ?auto_267937 ?auto_267938 ?auto_267939 ?auto_267940 ?auto_267941 ?auto_267942 ?auto_267943 ?auto_267944 ?auto_267945 ?auto_267946 ?auto_267947 ?auto_267948 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_267962 - BLOCK
      ?auto_267963 - BLOCK
      ?auto_267964 - BLOCK
      ?auto_267965 - BLOCK
      ?auto_267966 - BLOCK
      ?auto_267967 - BLOCK
      ?auto_267968 - BLOCK
      ?auto_267969 - BLOCK
      ?auto_267970 - BLOCK
      ?auto_267971 - BLOCK
      ?auto_267972 - BLOCK
      ?auto_267973 - BLOCK
      ?auto_267974 - BLOCK
    )
    :vars
    (
      ?auto_267975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_267962 ?auto_267963 ) ) ( not ( = ?auto_267962 ?auto_267964 ) ) ( not ( = ?auto_267962 ?auto_267965 ) ) ( not ( = ?auto_267962 ?auto_267966 ) ) ( not ( = ?auto_267962 ?auto_267967 ) ) ( not ( = ?auto_267962 ?auto_267968 ) ) ( not ( = ?auto_267962 ?auto_267969 ) ) ( not ( = ?auto_267962 ?auto_267970 ) ) ( not ( = ?auto_267962 ?auto_267971 ) ) ( not ( = ?auto_267962 ?auto_267972 ) ) ( not ( = ?auto_267962 ?auto_267973 ) ) ( not ( = ?auto_267962 ?auto_267974 ) ) ( not ( = ?auto_267963 ?auto_267964 ) ) ( not ( = ?auto_267963 ?auto_267965 ) ) ( not ( = ?auto_267963 ?auto_267966 ) ) ( not ( = ?auto_267963 ?auto_267967 ) ) ( not ( = ?auto_267963 ?auto_267968 ) ) ( not ( = ?auto_267963 ?auto_267969 ) ) ( not ( = ?auto_267963 ?auto_267970 ) ) ( not ( = ?auto_267963 ?auto_267971 ) ) ( not ( = ?auto_267963 ?auto_267972 ) ) ( not ( = ?auto_267963 ?auto_267973 ) ) ( not ( = ?auto_267963 ?auto_267974 ) ) ( not ( = ?auto_267964 ?auto_267965 ) ) ( not ( = ?auto_267964 ?auto_267966 ) ) ( not ( = ?auto_267964 ?auto_267967 ) ) ( not ( = ?auto_267964 ?auto_267968 ) ) ( not ( = ?auto_267964 ?auto_267969 ) ) ( not ( = ?auto_267964 ?auto_267970 ) ) ( not ( = ?auto_267964 ?auto_267971 ) ) ( not ( = ?auto_267964 ?auto_267972 ) ) ( not ( = ?auto_267964 ?auto_267973 ) ) ( not ( = ?auto_267964 ?auto_267974 ) ) ( not ( = ?auto_267965 ?auto_267966 ) ) ( not ( = ?auto_267965 ?auto_267967 ) ) ( not ( = ?auto_267965 ?auto_267968 ) ) ( not ( = ?auto_267965 ?auto_267969 ) ) ( not ( = ?auto_267965 ?auto_267970 ) ) ( not ( = ?auto_267965 ?auto_267971 ) ) ( not ( = ?auto_267965 ?auto_267972 ) ) ( not ( = ?auto_267965 ?auto_267973 ) ) ( not ( = ?auto_267965 ?auto_267974 ) ) ( not ( = ?auto_267966 ?auto_267967 ) ) ( not ( = ?auto_267966 ?auto_267968 ) ) ( not ( = ?auto_267966 ?auto_267969 ) ) ( not ( = ?auto_267966 ?auto_267970 ) ) ( not ( = ?auto_267966 ?auto_267971 ) ) ( not ( = ?auto_267966 ?auto_267972 ) ) ( not ( = ?auto_267966 ?auto_267973 ) ) ( not ( = ?auto_267966 ?auto_267974 ) ) ( not ( = ?auto_267967 ?auto_267968 ) ) ( not ( = ?auto_267967 ?auto_267969 ) ) ( not ( = ?auto_267967 ?auto_267970 ) ) ( not ( = ?auto_267967 ?auto_267971 ) ) ( not ( = ?auto_267967 ?auto_267972 ) ) ( not ( = ?auto_267967 ?auto_267973 ) ) ( not ( = ?auto_267967 ?auto_267974 ) ) ( not ( = ?auto_267968 ?auto_267969 ) ) ( not ( = ?auto_267968 ?auto_267970 ) ) ( not ( = ?auto_267968 ?auto_267971 ) ) ( not ( = ?auto_267968 ?auto_267972 ) ) ( not ( = ?auto_267968 ?auto_267973 ) ) ( not ( = ?auto_267968 ?auto_267974 ) ) ( not ( = ?auto_267969 ?auto_267970 ) ) ( not ( = ?auto_267969 ?auto_267971 ) ) ( not ( = ?auto_267969 ?auto_267972 ) ) ( not ( = ?auto_267969 ?auto_267973 ) ) ( not ( = ?auto_267969 ?auto_267974 ) ) ( not ( = ?auto_267970 ?auto_267971 ) ) ( not ( = ?auto_267970 ?auto_267972 ) ) ( not ( = ?auto_267970 ?auto_267973 ) ) ( not ( = ?auto_267970 ?auto_267974 ) ) ( not ( = ?auto_267971 ?auto_267972 ) ) ( not ( = ?auto_267971 ?auto_267973 ) ) ( not ( = ?auto_267971 ?auto_267974 ) ) ( not ( = ?auto_267972 ?auto_267973 ) ) ( not ( = ?auto_267972 ?auto_267974 ) ) ( not ( = ?auto_267973 ?auto_267974 ) ) ( ON ?auto_267962 ?auto_267975 ) ( not ( = ?auto_267974 ?auto_267975 ) ) ( not ( = ?auto_267973 ?auto_267975 ) ) ( not ( = ?auto_267972 ?auto_267975 ) ) ( not ( = ?auto_267971 ?auto_267975 ) ) ( not ( = ?auto_267970 ?auto_267975 ) ) ( not ( = ?auto_267969 ?auto_267975 ) ) ( not ( = ?auto_267968 ?auto_267975 ) ) ( not ( = ?auto_267967 ?auto_267975 ) ) ( not ( = ?auto_267966 ?auto_267975 ) ) ( not ( = ?auto_267965 ?auto_267975 ) ) ( not ( = ?auto_267964 ?auto_267975 ) ) ( not ( = ?auto_267963 ?auto_267975 ) ) ( not ( = ?auto_267962 ?auto_267975 ) ) ( ON ?auto_267963 ?auto_267962 ) ( ON ?auto_267964 ?auto_267963 ) ( ON ?auto_267965 ?auto_267964 ) ( ON ?auto_267966 ?auto_267965 ) ( ON ?auto_267967 ?auto_267966 ) ( ON ?auto_267968 ?auto_267967 ) ( ON ?auto_267969 ?auto_267968 ) ( ON ?auto_267970 ?auto_267969 ) ( ON ?auto_267971 ?auto_267970 ) ( ON ?auto_267972 ?auto_267971 ) ( ON ?auto_267973 ?auto_267972 ) ( ON ?auto_267974 ?auto_267973 ) ( CLEAR ?auto_267974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_267974 ?auto_267973 ?auto_267972 ?auto_267971 ?auto_267970 ?auto_267969 ?auto_267968 ?auto_267967 ?auto_267966 ?auto_267965 ?auto_267964 ?auto_267963 ?auto_267962 )
      ( MAKE-13PILE ?auto_267962 ?auto_267963 ?auto_267964 ?auto_267965 ?auto_267966 ?auto_267967 ?auto_267968 ?auto_267969 ?auto_267970 ?auto_267971 ?auto_267972 ?auto_267973 ?auto_267974 ) )
  )

)

