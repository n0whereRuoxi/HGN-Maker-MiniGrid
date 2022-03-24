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
      ?auto_748478 - BLOCK
    )
    :vars
    (
      ?auto_748479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748478 ?auto_748479 ) ( CLEAR ?auto_748478 ) ( HAND-EMPTY ) ( not ( = ?auto_748478 ?auto_748479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_748478 ?auto_748479 )
      ( !PUTDOWN ?auto_748478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_748485 - BLOCK
      ?auto_748486 - BLOCK
    )
    :vars
    (
      ?auto_748487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_748485 ) ( ON ?auto_748486 ?auto_748487 ) ( CLEAR ?auto_748486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_748485 ) ( not ( = ?auto_748485 ?auto_748486 ) ) ( not ( = ?auto_748485 ?auto_748487 ) ) ( not ( = ?auto_748486 ?auto_748487 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_748486 ?auto_748487 )
      ( !STACK ?auto_748486 ?auto_748485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_748495 - BLOCK
      ?auto_748496 - BLOCK
    )
    :vars
    (
      ?auto_748497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748496 ?auto_748497 ) ( not ( = ?auto_748495 ?auto_748496 ) ) ( not ( = ?auto_748495 ?auto_748497 ) ) ( not ( = ?auto_748496 ?auto_748497 ) ) ( ON ?auto_748495 ?auto_748496 ) ( CLEAR ?auto_748495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_748495 )
      ( MAKE-2PILE ?auto_748495 ?auto_748496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_748506 - BLOCK
      ?auto_748507 - BLOCK
      ?auto_748508 - BLOCK
    )
    :vars
    (
      ?auto_748509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_748507 ) ( ON ?auto_748508 ?auto_748509 ) ( CLEAR ?auto_748508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_748506 ) ( ON ?auto_748507 ?auto_748506 ) ( not ( = ?auto_748506 ?auto_748507 ) ) ( not ( = ?auto_748506 ?auto_748508 ) ) ( not ( = ?auto_748506 ?auto_748509 ) ) ( not ( = ?auto_748507 ?auto_748508 ) ) ( not ( = ?auto_748507 ?auto_748509 ) ) ( not ( = ?auto_748508 ?auto_748509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_748508 ?auto_748509 )
      ( !STACK ?auto_748508 ?auto_748507 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_748520 - BLOCK
      ?auto_748521 - BLOCK
      ?auto_748522 - BLOCK
    )
    :vars
    (
      ?auto_748523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748522 ?auto_748523 ) ( ON-TABLE ?auto_748520 ) ( not ( = ?auto_748520 ?auto_748521 ) ) ( not ( = ?auto_748520 ?auto_748522 ) ) ( not ( = ?auto_748520 ?auto_748523 ) ) ( not ( = ?auto_748521 ?auto_748522 ) ) ( not ( = ?auto_748521 ?auto_748523 ) ) ( not ( = ?auto_748522 ?auto_748523 ) ) ( CLEAR ?auto_748520 ) ( ON ?auto_748521 ?auto_748522 ) ( CLEAR ?auto_748521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_748520 ?auto_748521 )
      ( MAKE-3PILE ?auto_748520 ?auto_748521 ?auto_748522 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_748534 - BLOCK
      ?auto_748535 - BLOCK
      ?auto_748536 - BLOCK
    )
    :vars
    (
      ?auto_748537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748536 ?auto_748537 ) ( not ( = ?auto_748534 ?auto_748535 ) ) ( not ( = ?auto_748534 ?auto_748536 ) ) ( not ( = ?auto_748534 ?auto_748537 ) ) ( not ( = ?auto_748535 ?auto_748536 ) ) ( not ( = ?auto_748535 ?auto_748537 ) ) ( not ( = ?auto_748536 ?auto_748537 ) ) ( ON ?auto_748535 ?auto_748536 ) ( ON ?auto_748534 ?auto_748535 ) ( CLEAR ?auto_748534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_748534 )
      ( MAKE-3PILE ?auto_748534 ?auto_748535 ?auto_748536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_748549 - BLOCK
      ?auto_748550 - BLOCK
      ?auto_748551 - BLOCK
      ?auto_748552 - BLOCK
    )
    :vars
    (
      ?auto_748553 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_748551 ) ( ON ?auto_748552 ?auto_748553 ) ( CLEAR ?auto_748552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_748549 ) ( ON ?auto_748550 ?auto_748549 ) ( ON ?auto_748551 ?auto_748550 ) ( not ( = ?auto_748549 ?auto_748550 ) ) ( not ( = ?auto_748549 ?auto_748551 ) ) ( not ( = ?auto_748549 ?auto_748552 ) ) ( not ( = ?auto_748549 ?auto_748553 ) ) ( not ( = ?auto_748550 ?auto_748551 ) ) ( not ( = ?auto_748550 ?auto_748552 ) ) ( not ( = ?auto_748550 ?auto_748553 ) ) ( not ( = ?auto_748551 ?auto_748552 ) ) ( not ( = ?auto_748551 ?auto_748553 ) ) ( not ( = ?auto_748552 ?auto_748553 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_748552 ?auto_748553 )
      ( !STACK ?auto_748552 ?auto_748551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_748567 - BLOCK
      ?auto_748568 - BLOCK
      ?auto_748569 - BLOCK
      ?auto_748570 - BLOCK
    )
    :vars
    (
      ?auto_748571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748570 ?auto_748571 ) ( ON-TABLE ?auto_748567 ) ( ON ?auto_748568 ?auto_748567 ) ( not ( = ?auto_748567 ?auto_748568 ) ) ( not ( = ?auto_748567 ?auto_748569 ) ) ( not ( = ?auto_748567 ?auto_748570 ) ) ( not ( = ?auto_748567 ?auto_748571 ) ) ( not ( = ?auto_748568 ?auto_748569 ) ) ( not ( = ?auto_748568 ?auto_748570 ) ) ( not ( = ?auto_748568 ?auto_748571 ) ) ( not ( = ?auto_748569 ?auto_748570 ) ) ( not ( = ?auto_748569 ?auto_748571 ) ) ( not ( = ?auto_748570 ?auto_748571 ) ) ( CLEAR ?auto_748568 ) ( ON ?auto_748569 ?auto_748570 ) ( CLEAR ?auto_748569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_748567 ?auto_748568 ?auto_748569 )
      ( MAKE-4PILE ?auto_748567 ?auto_748568 ?auto_748569 ?auto_748570 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_748585 - BLOCK
      ?auto_748586 - BLOCK
      ?auto_748587 - BLOCK
      ?auto_748588 - BLOCK
    )
    :vars
    (
      ?auto_748589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748588 ?auto_748589 ) ( ON-TABLE ?auto_748585 ) ( not ( = ?auto_748585 ?auto_748586 ) ) ( not ( = ?auto_748585 ?auto_748587 ) ) ( not ( = ?auto_748585 ?auto_748588 ) ) ( not ( = ?auto_748585 ?auto_748589 ) ) ( not ( = ?auto_748586 ?auto_748587 ) ) ( not ( = ?auto_748586 ?auto_748588 ) ) ( not ( = ?auto_748586 ?auto_748589 ) ) ( not ( = ?auto_748587 ?auto_748588 ) ) ( not ( = ?auto_748587 ?auto_748589 ) ) ( not ( = ?auto_748588 ?auto_748589 ) ) ( ON ?auto_748587 ?auto_748588 ) ( CLEAR ?auto_748585 ) ( ON ?auto_748586 ?auto_748587 ) ( CLEAR ?auto_748586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_748585 ?auto_748586 )
      ( MAKE-4PILE ?auto_748585 ?auto_748586 ?auto_748587 ?auto_748588 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_748603 - BLOCK
      ?auto_748604 - BLOCK
      ?auto_748605 - BLOCK
      ?auto_748606 - BLOCK
    )
    :vars
    (
      ?auto_748607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748606 ?auto_748607 ) ( not ( = ?auto_748603 ?auto_748604 ) ) ( not ( = ?auto_748603 ?auto_748605 ) ) ( not ( = ?auto_748603 ?auto_748606 ) ) ( not ( = ?auto_748603 ?auto_748607 ) ) ( not ( = ?auto_748604 ?auto_748605 ) ) ( not ( = ?auto_748604 ?auto_748606 ) ) ( not ( = ?auto_748604 ?auto_748607 ) ) ( not ( = ?auto_748605 ?auto_748606 ) ) ( not ( = ?auto_748605 ?auto_748607 ) ) ( not ( = ?auto_748606 ?auto_748607 ) ) ( ON ?auto_748605 ?auto_748606 ) ( ON ?auto_748604 ?auto_748605 ) ( ON ?auto_748603 ?auto_748604 ) ( CLEAR ?auto_748603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_748603 )
      ( MAKE-4PILE ?auto_748603 ?auto_748604 ?auto_748605 ?auto_748606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_748622 - BLOCK
      ?auto_748623 - BLOCK
      ?auto_748624 - BLOCK
      ?auto_748625 - BLOCK
      ?auto_748626 - BLOCK
    )
    :vars
    (
      ?auto_748627 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_748625 ) ( ON ?auto_748626 ?auto_748627 ) ( CLEAR ?auto_748626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_748622 ) ( ON ?auto_748623 ?auto_748622 ) ( ON ?auto_748624 ?auto_748623 ) ( ON ?auto_748625 ?auto_748624 ) ( not ( = ?auto_748622 ?auto_748623 ) ) ( not ( = ?auto_748622 ?auto_748624 ) ) ( not ( = ?auto_748622 ?auto_748625 ) ) ( not ( = ?auto_748622 ?auto_748626 ) ) ( not ( = ?auto_748622 ?auto_748627 ) ) ( not ( = ?auto_748623 ?auto_748624 ) ) ( not ( = ?auto_748623 ?auto_748625 ) ) ( not ( = ?auto_748623 ?auto_748626 ) ) ( not ( = ?auto_748623 ?auto_748627 ) ) ( not ( = ?auto_748624 ?auto_748625 ) ) ( not ( = ?auto_748624 ?auto_748626 ) ) ( not ( = ?auto_748624 ?auto_748627 ) ) ( not ( = ?auto_748625 ?auto_748626 ) ) ( not ( = ?auto_748625 ?auto_748627 ) ) ( not ( = ?auto_748626 ?auto_748627 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_748626 ?auto_748627 )
      ( !STACK ?auto_748626 ?auto_748625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_748644 - BLOCK
      ?auto_748645 - BLOCK
      ?auto_748646 - BLOCK
      ?auto_748647 - BLOCK
      ?auto_748648 - BLOCK
    )
    :vars
    (
      ?auto_748649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748648 ?auto_748649 ) ( ON-TABLE ?auto_748644 ) ( ON ?auto_748645 ?auto_748644 ) ( ON ?auto_748646 ?auto_748645 ) ( not ( = ?auto_748644 ?auto_748645 ) ) ( not ( = ?auto_748644 ?auto_748646 ) ) ( not ( = ?auto_748644 ?auto_748647 ) ) ( not ( = ?auto_748644 ?auto_748648 ) ) ( not ( = ?auto_748644 ?auto_748649 ) ) ( not ( = ?auto_748645 ?auto_748646 ) ) ( not ( = ?auto_748645 ?auto_748647 ) ) ( not ( = ?auto_748645 ?auto_748648 ) ) ( not ( = ?auto_748645 ?auto_748649 ) ) ( not ( = ?auto_748646 ?auto_748647 ) ) ( not ( = ?auto_748646 ?auto_748648 ) ) ( not ( = ?auto_748646 ?auto_748649 ) ) ( not ( = ?auto_748647 ?auto_748648 ) ) ( not ( = ?auto_748647 ?auto_748649 ) ) ( not ( = ?auto_748648 ?auto_748649 ) ) ( CLEAR ?auto_748646 ) ( ON ?auto_748647 ?auto_748648 ) ( CLEAR ?auto_748647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_748644 ?auto_748645 ?auto_748646 ?auto_748647 )
      ( MAKE-5PILE ?auto_748644 ?auto_748645 ?auto_748646 ?auto_748647 ?auto_748648 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_748666 - BLOCK
      ?auto_748667 - BLOCK
      ?auto_748668 - BLOCK
      ?auto_748669 - BLOCK
      ?auto_748670 - BLOCK
    )
    :vars
    (
      ?auto_748671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748670 ?auto_748671 ) ( ON-TABLE ?auto_748666 ) ( ON ?auto_748667 ?auto_748666 ) ( not ( = ?auto_748666 ?auto_748667 ) ) ( not ( = ?auto_748666 ?auto_748668 ) ) ( not ( = ?auto_748666 ?auto_748669 ) ) ( not ( = ?auto_748666 ?auto_748670 ) ) ( not ( = ?auto_748666 ?auto_748671 ) ) ( not ( = ?auto_748667 ?auto_748668 ) ) ( not ( = ?auto_748667 ?auto_748669 ) ) ( not ( = ?auto_748667 ?auto_748670 ) ) ( not ( = ?auto_748667 ?auto_748671 ) ) ( not ( = ?auto_748668 ?auto_748669 ) ) ( not ( = ?auto_748668 ?auto_748670 ) ) ( not ( = ?auto_748668 ?auto_748671 ) ) ( not ( = ?auto_748669 ?auto_748670 ) ) ( not ( = ?auto_748669 ?auto_748671 ) ) ( not ( = ?auto_748670 ?auto_748671 ) ) ( ON ?auto_748669 ?auto_748670 ) ( CLEAR ?auto_748667 ) ( ON ?auto_748668 ?auto_748669 ) ( CLEAR ?auto_748668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_748666 ?auto_748667 ?auto_748668 )
      ( MAKE-5PILE ?auto_748666 ?auto_748667 ?auto_748668 ?auto_748669 ?auto_748670 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_748688 - BLOCK
      ?auto_748689 - BLOCK
      ?auto_748690 - BLOCK
      ?auto_748691 - BLOCK
      ?auto_748692 - BLOCK
    )
    :vars
    (
      ?auto_748693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748692 ?auto_748693 ) ( ON-TABLE ?auto_748688 ) ( not ( = ?auto_748688 ?auto_748689 ) ) ( not ( = ?auto_748688 ?auto_748690 ) ) ( not ( = ?auto_748688 ?auto_748691 ) ) ( not ( = ?auto_748688 ?auto_748692 ) ) ( not ( = ?auto_748688 ?auto_748693 ) ) ( not ( = ?auto_748689 ?auto_748690 ) ) ( not ( = ?auto_748689 ?auto_748691 ) ) ( not ( = ?auto_748689 ?auto_748692 ) ) ( not ( = ?auto_748689 ?auto_748693 ) ) ( not ( = ?auto_748690 ?auto_748691 ) ) ( not ( = ?auto_748690 ?auto_748692 ) ) ( not ( = ?auto_748690 ?auto_748693 ) ) ( not ( = ?auto_748691 ?auto_748692 ) ) ( not ( = ?auto_748691 ?auto_748693 ) ) ( not ( = ?auto_748692 ?auto_748693 ) ) ( ON ?auto_748691 ?auto_748692 ) ( ON ?auto_748690 ?auto_748691 ) ( CLEAR ?auto_748688 ) ( ON ?auto_748689 ?auto_748690 ) ( CLEAR ?auto_748689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_748688 ?auto_748689 )
      ( MAKE-5PILE ?auto_748688 ?auto_748689 ?auto_748690 ?auto_748691 ?auto_748692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_748710 - BLOCK
      ?auto_748711 - BLOCK
      ?auto_748712 - BLOCK
      ?auto_748713 - BLOCK
      ?auto_748714 - BLOCK
    )
    :vars
    (
      ?auto_748715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748714 ?auto_748715 ) ( not ( = ?auto_748710 ?auto_748711 ) ) ( not ( = ?auto_748710 ?auto_748712 ) ) ( not ( = ?auto_748710 ?auto_748713 ) ) ( not ( = ?auto_748710 ?auto_748714 ) ) ( not ( = ?auto_748710 ?auto_748715 ) ) ( not ( = ?auto_748711 ?auto_748712 ) ) ( not ( = ?auto_748711 ?auto_748713 ) ) ( not ( = ?auto_748711 ?auto_748714 ) ) ( not ( = ?auto_748711 ?auto_748715 ) ) ( not ( = ?auto_748712 ?auto_748713 ) ) ( not ( = ?auto_748712 ?auto_748714 ) ) ( not ( = ?auto_748712 ?auto_748715 ) ) ( not ( = ?auto_748713 ?auto_748714 ) ) ( not ( = ?auto_748713 ?auto_748715 ) ) ( not ( = ?auto_748714 ?auto_748715 ) ) ( ON ?auto_748713 ?auto_748714 ) ( ON ?auto_748712 ?auto_748713 ) ( ON ?auto_748711 ?auto_748712 ) ( ON ?auto_748710 ?auto_748711 ) ( CLEAR ?auto_748710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_748710 )
      ( MAKE-5PILE ?auto_748710 ?auto_748711 ?auto_748712 ?auto_748713 ?auto_748714 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_748733 - BLOCK
      ?auto_748734 - BLOCK
      ?auto_748735 - BLOCK
      ?auto_748736 - BLOCK
      ?auto_748737 - BLOCK
      ?auto_748738 - BLOCK
    )
    :vars
    (
      ?auto_748739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_748737 ) ( ON ?auto_748738 ?auto_748739 ) ( CLEAR ?auto_748738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_748733 ) ( ON ?auto_748734 ?auto_748733 ) ( ON ?auto_748735 ?auto_748734 ) ( ON ?auto_748736 ?auto_748735 ) ( ON ?auto_748737 ?auto_748736 ) ( not ( = ?auto_748733 ?auto_748734 ) ) ( not ( = ?auto_748733 ?auto_748735 ) ) ( not ( = ?auto_748733 ?auto_748736 ) ) ( not ( = ?auto_748733 ?auto_748737 ) ) ( not ( = ?auto_748733 ?auto_748738 ) ) ( not ( = ?auto_748733 ?auto_748739 ) ) ( not ( = ?auto_748734 ?auto_748735 ) ) ( not ( = ?auto_748734 ?auto_748736 ) ) ( not ( = ?auto_748734 ?auto_748737 ) ) ( not ( = ?auto_748734 ?auto_748738 ) ) ( not ( = ?auto_748734 ?auto_748739 ) ) ( not ( = ?auto_748735 ?auto_748736 ) ) ( not ( = ?auto_748735 ?auto_748737 ) ) ( not ( = ?auto_748735 ?auto_748738 ) ) ( not ( = ?auto_748735 ?auto_748739 ) ) ( not ( = ?auto_748736 ?auto_748737 ) ) ( not ( = ?auto_748736 ?auto_748738 ) ) ( not ( = ?auto_748736 ?auto_748739 ) ) ( not ( = ?auto_748737 ?auto_748738 ) ) ( not ( = ?auto_748737 ?auto_748739 ) ) ( not ( = ?auto_748738 ?auto_748739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_748738 ?auto_748739 )
      ( !STACK ?auto_748738 ?auto_748737 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_748759 - BLOCK
      ?auto_748760 - BLOCK
      ?auto_748761 - BLOCK
      ?auto_748762 - BLOCK
      ?auto_748763 - BLOCK
      ?auto_748764 - BLOCK
    )
    :vars
    (
      ?auto_748765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748764 ?auto_748765 ) ( ON-TABLE ?auto_748759 ) ( ON ?auto_748760 ?auto_748759 ) ( ON ?auto_748761 ?auto_748760 ) ( ON ?auto_748762 ?auto_748761 ) ( not ( = ?auto_748759 ?auto_748760 ) ) ( not ( = ?auto_748759 ?auto_748761 ) ) ( not ( = ?auto_748759 ?auto_748762 ) ) ( not ( = ?auto_748759 ?auto_748763 ) ) ( not ( = ?auto_748759 ?auto_748764 ) ) ( not ( = ?auto_748759 ?auto_748765 ) ) ( not ( = ?auto_748760 ?auto_748761 ) ) ( not ( = ?auto_748760 ?auto_748762 ) ) ( not ( = ?auto_748760 ?auto_748763 ) ) ( not ( = ?auto_748760 ?auto_748764 ) ) ( not ( = ?auto_748760 ?auto_748765 ) ) ( not ( = ?auto_748761 ?auto_748762 ) ) ( not ( = ?auto_748761 ?auto_748763 ) ) ( not ( = ?auto_748761 ?auto_748764 ) ) ( not ( = ?auto_748761 ?auto_748765 ) ) ( not ( = ?auto_748762 ?auto_748763 ) ) ( not ( = ?auto_748762 ?auto_748764 ) ) ( not ( = ?auto_748762 ?auto_748765 ) ) ( not ( = ?auto_748763 ?auto_748764 ) ) ( not ( = ?auto_748763 ?auto_748765 ) ) ( not ( = ?auto_748764 ?auto_748765 ) ) ( CLEAR ?auto_748762 ) ( ON ?auto_748763 ?auto_748764 ) ( CLEAR ?auto_748763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_748759 ?auto_748760 ?auto_748761 ?auto_748762 ?auto_748763 )
      ( MAKE-6PILE ?auto_748759 ?auto_748760 ?auto_748761 ?auto_748762 ?auto_748763 ?auto_748764 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_748785 - BLOCK
      ?auto_748786 - BLOCK
      ?auto_748787 - BLOCK
      ?auto_748788 - BLOCK
      ?auto_748789 - BLOCK
      ?auto_748790 - BLOCK
    )
    :vars
    (
      ?auto_748791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748790 ?auto_748791 ) ( ON-TABLE ?auto_748785 ) ( ON ?auto_748786 ?auto_748785 ) ( ON ?auto_748787 ?auto_748786 ) ( not ( = ?auto_748785 ?auto_748786 ) ) ( not ( = ?auto_748785 ?auto_748787 ) ) ( not ( = ?auto_748785 ?auto_748788 ) ) ( not ( = ?auto_748785 ?auto_748789 ) ) ( not ( = ?auto_748785 ?auto_748790 ) ) ( not ( = ?auto_748785 ?auto_748791 ) ) ( not ( = ?auto_748786 ?auto_748787 ) ) ( not ( = ?auto_748786 ?auto_748788 ) ) ( not ( = ?auto_748786 ?auto_748789 ) ) ( not ( = ?auto_748786 ?auto_748790 ) ) ( not ( = ?auto_748786 ?auto_748791 ) ) ( not ( = ?auto_748787 ?auto_748788 ) ) ( not ( = ?auto_748787 ?auto_748789 ) ) ( not ( = ?auto_748787 ?auto_748790 ) ) ( not ( = ?auto_748787 ?auto_748791 ) ) ( not ( = ?auto_748788 ?auto_748789 ) ) ( not ( = ?auto_748788 ?auto_748790 ) ) ( not ( = ?auto_748788 ?auto_748791 ) ) ( not ( = ?auto_748789 ?auto_748790 ) ) ( not ( = ?auto_748789 ?auto_748791 ) ) ( not ( = ?auto_748790 ?auto_748791 ) ) ( ON ?auto_748789 ?auto_748790 ) ( CLEAR ?auto_748787 ) ( ON ?auto_748788 ?auto_748789 ) ( CLEAR ?auto_748788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_748785 ?auto_748786 ?auto_748787 ?auto_748788 )
      ( MAKE-6PILE ?auto_748785 ?auto_748786 ?auto_748787 ?auto_748788 ?auto_748789 ?auto_748790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_748811 - BLOCK
      ?auto_748812 - BLOCK
      ?auto_748813 - BLOCK
      ?auto_748814 - BLOCK
      ?auto_748815 - BLOCK
      ?auto_748816 - BLOCK
    )
    :vars
    (
      ?auto_748817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748816 ?auto_748817 ) ( ON-TABLE ?auto_748811 ) ( ON ?auto_748812 ?auto_748811 ) ( not ( = ?auto_748811 ?auto_748812 ) ) ( not ( = ?auto_748811 ?auto_748813 ) ) ( not ( = ?auto_748811 ?auto_748814 ) ) ( not ( = ?auto_748811 ?auto_748815 ) ) ( not ( = ?auto_748811 ?auto_748816 ) ) ( not ( = ?auto_748811 ?auto_748817 ) ) ( not ( = ?auto_748812 ?auto_748813 ) ) ( not ( = ?auto_748812 ?auto_748814 ) ) ( not ( = ?auto_748812 ?auto_748815 ) ) ( not ( = ?auto_748812 ?auto_748816 ) ) ( not ( = ?auto_748812 ?auto_748817 ) ) ( not ( = ?auto_748813 ?auto_748814 ) ) ( not ( = ?auto_748813 ?auto_748815 ) ) ( not ( = ?auto_748813 ?auto_748816 ) ) ( not ( = ?auto_748813 ?auto_748817 ) ) ( not ( = ?auto_748814 ?auto_748815 ) ) ( not ( = ?auto_748814 ?auto_748816 ) ) ( not ( = ?auto_748814 ?auto_748817 ) ) ( not ( = ?auto_748815 ?auto_748816 ) ) ( not ( = ?auto_748815 ?auto_748817 ) ) ( not ( = ?auto_748816 ?auto_748817 ) ) ( ON ?auto_748815 ?auto_748816 ) ( ON ?auto_748814 ?auto_748815 ) ( CLEAR ?auto_748812 ) ( ON ?auto_748813 ?auto_748814 ) ( CLEAR ?auto_748813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_748811 ?auto_748812 ?auto_748813 )
      ( MAKE-6PILE ?auto_748811 ?auto_748812 ?auto_748813 ?auto_748814 ?auto_748815 ?auto_748816 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_748837 - BLOCK
      ?auto_748838 - BLOCK
      ?auto_748839 - BLOCK
      ?auto_748840 - BLOCK
      ?auto_748841 - BLOCK
      ?auto_748842 - BLOCK
    )
    :vars
    (
      ?auto_748843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748842 ?auto_748843 ) ( ON-TABLE ?auto_748837 ) ( not ( = ?auto_748837 ?auto_748838 ) ) ( not ( = ?auto_748837 ?auto_748839 ) ) ( not ( = ?auto_748837 ?auto_748840 ) ) ( not ( = ?auto_748837 ?auto_748841 ) ) ( not ( = ?auto_748837 ?auto_748842 ) ) ( not ( = ?auto_748837 ?auto_748843 ) ) ( not ( = ?auto_748838 ?auto_748839 ) ) ( not ( = ?auto_748838 ?auto_748840 ) ) ( not ( = ?auto_748838 ?auto_748841 ) ) ( not ( = ?auto_748838 ?auto_748842 ) ) ( not ( = ?auto_748838 ?auto_748843 ) ) ( not ( = ?auto_748839 ?auto_748840 ) ) ( not ( = ?auto_748839 ?auto_748841 ) ) ( not ( = ?auto_748839 ?auto_748842 ) ) ( not ( = ?auto_748839 ?auto_748843 ) ) ( not ( = ?auto_748840 ?auto_748841 ) ) ( not ( = ?auto_748840 ?auto_748842 ) ) ( not ( = ?auto_748840 ?auto_748843 ) ) ( not ( = ?auto_748841 ?auto_748842 ) ) ( not ( = ?auto_748841 ?auto_748843 ) ) ( not ( = ?auto_748842 ?auto_748843 ) ) ( ON ?auto_748841 ?auto_748842 ) ( ON ?auto_748840 ?auto_748841 ) ( ON ?auto_748839 ?auto_748840 ) ( CLEAR ?auto_748837 ) ( ON ?auto_748838 ?auto_748839 ) ( CLEAR ?auto_748838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_748837 ?auto_748838 )
      ( MAKE-6PILE ?auto_748837 ?auto_748838 ?auto_748839 ?auto_748840 ?auto_748841 ?auto_748842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_748863 - BLOCK
      ?auto_748864 - BLOCK
      ?auto_748865 - BLOCK
      ?auto_748866 - BLOCK
      ?auto_748867 - BLOCK
      ?auto_748868 - BLOCK
    )
    :vars
    (
      ?auto_748869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748868 ?auto_748869 ) ( not ( = ?auto_748863 ?auto_748864 ) ) ( not ( = ?auto_748863 ?auto_748865 ) ) ( not ( = ?auto_748863 ?auto_748866 ) ) ( not ( = ?auto_748863 ?auto_748867 ) ) ( not ( = ?auto_748863 ?auto_748868 ) ) ( not ( = ?auto_748863 ?auto_748869 ) ) ( not ( = ?auto_748864 ?auto_748865 ) ) ( not ( = ?auto_748864 ?auto_748866 ) ) ( not ( = ?auto_748864 ?auto_748867 ) ) ( not ( = ?auto_748864 ?auto_748868 ) ) ( not ( = ?auto_748864 ?auto_748869 ) ) ( not ( = ?auto_748865 ?auto_748866 ) ) ( not ( = ?auto_748865 ?auto_748867 ) ) ( not ( = ?auto_748865 ?auto_748868 ) ) ( not ( = ?auto_748865 ?auto_748869 ) ) ( not ( = ?auto_748866 ?auto_748867 ) ) ( not ( = ?auto_748866 ?auto_748868 ) ) ( not ( = ?auto_748866 ?auto_748869 ) ) ( not ( = ?auto_748867 ?auto_748868 ) ) ( not ( = ?auto_748867 ?auto_748869 ) ) ( not ( = ?auto_748868 ?auto_748869 ) ) ( ON ?auto_748867 ?auto_748868 ) ( ON ?auto_748866 ?auto_748867 ) ( ON ?auto_748865 ?auto_748866 ) ( ON ?auto_748864 ?auto_748865 ) ( ON ?auto_748863 ?auto_748864 ) ( CLEAR ?auto_748863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_748863 )
      ( MAKE-6PILE ?auto_748863 ?auto_748864 ?auto_748865 ?auto_748866 ?auto_748867 ?auto_748868 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_748890 - BLOCK
      ?auto_748891 - BLOCK
      ?auto_748892 - BLOCK
      ?auto_748893 - BLOCK
      ?auto_748894 - BLOCK
      ?auto_748895 - BLOCK
      ?auto_748896 - BLOCK
    )
    :vars
    (
      ?auto_748897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_748895 ) ( ON ?auto_748896 ?auto_748897 ) ( CLEAR ?auto_748896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_748890 ) ( ON ?auto_748891 ?auto_748890 ) ( ON ?auto_748892 ?auto_748891 ) ( ON ?auto_748893 ?auto_748892 ) ( ON ?auto_748894 ?auto_748893 ) ( ON ?auto_748895 ?auto_748894 ) ( not ( = ?auto_748890 ?auto_748891 ) ) ( not ( = ?auto_748890 ?auto_748892 ) ) ( not ( = ?auto_748890 ?auto_748893 ) ) ( not ( = ?auto_748890 ?auto_748894 ) ) ( not ( = ?auto_748890 ?auto_748895 ) ) ( not ( = ?auto_748890 ?auto_748896 ) ) ( not ( = ?auto_748890 ?auto_748897 ) ) ( not ( = ?auto_748891 ?auto_748892 ) ) ( not ( = ?auto_748891 ?auto_748893 ) ) ( not ( = ?auto_748891 ?auto_748894 ) ) ( not ( = ?auto_748891 ?auto_748895 ) ) ( not ( = ?auto_748891 ?auto_748896 ) ) ( not ( = ?auto_748891 ?auto_748897 ) ) ( not ( = ?auto_748892 ?auto_748893 ) ) ( not ( = ?auto_748892 ?auto_748894 ) ) ( not ( = ?auto_748892 ?auto_748895 ) ) ( not ( = ?auto_748892 ?auto_748896 ) ) ( not ( = ?auto_748892 ?auto_748897 ) ) ( not ( = ?auto_748893 ?auto_748894 ) ) ( not ( = ?auto_748893 ?auto_748895 ) ) ( not ( = ?auto_748893 ?auto_748896 ) ) ( not ( = ?auto_748893 ?auto_748897 ) ) ( not ( = ?auto_748894 ?auto_748895 ) ) ( not ( = ?auto_748894 ?auto_748896 ) ) ( not ( = ?auto_748894 ?auto_748897 ) ) ( not ( = ?auto_748895 ?auto_748896 ) ) ( not ( = ?auto_748895 ?auto_748897 ) ) ( not ( = ?auto_748896 ?auto_748897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_748896 ?auto_748897 )
      ( !STACK ?auto_748896 ?auto_748895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_748920 - BLOCK
      ?auto_748921 - BLOCK
      ?auto_748922 - BLOCK
      ?auto_748923 - BLOCK
      ?auto_748924 - BLOCK
      ?auto_748925 - BLOCK
      ?auto_748926 - BLOCK
    )
    :vars
    (
      ?auto_748927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748926 ?auto_748927 ) ( ON-TABLE ?auto_748920 ) ( ON ?auto_748921 ?auto_748920 ) ( ON ?auto_748922 ?auto_748921 ) ( ON ?auto_748923 ?auto_748922 ) ( ON ?auto_748924 ?auto_748923 ) ( not ( = ?auto_748920 ?auto_748921 ) ) ( not ( = ?auto_748920 ?auto_748922 ) ) ( not ( = ?auto_748920 ?auto_748923 ) ) ( not ( = ?auto_748920 ?auto_748924 ) ) ( not ( = ?auto_748920 ?auto_748925 ) ) ( not ( = ?auto_748920 ?auto_748926 ) ) ( not ( = ?auto_748920 ?auto_748927 ) ) ( not ( = ?auto_748921 ?auto_748922 ) ) ( not ( = ?auto_748921 ?auto_748923 ) ) ( not ( = ?auto_748921 ?auto_748924 ) ) ( not ( = ?auto_748921 ?auto_748925 ) ) ( not ( = ?auto_748921 ?auto_748926 ) ) ( not ( = ?auto_748921 ?auto_748927 ) ) ( not ( = ?auto_748922 ?auto_748923 ) ) ( not ( = ?auto_748922 ?auto_748924 ) ) ( not ( = ?auto_748922 ?auto_748925 ) ) ( not ( = ?auto_748922 ?auto_748926 ) ) ( not ( = ?auto_748922 ?auto_748927 ) ) ( not ( = ?auto_748923 ?auto_748924 ) ) ( not ( = ?auto_748923 ?auto_748925 ) ) ( not ( = ?auto_748923 ?auto_748926 ) ) ( not ( = ?auto_748923 ?auto_748927 ) ) ( not ( = ?auto_748924 ?auto_748925 ) ) ( not ( = ?auto_748924 ?auto_748926 ) ) ( not ( = ?auto_748924 ?auto_748927 ) ) ( not ( = ?auto_748925 ?auto_748926 ) ) ( not ( = ?auto_748925 ?auto_748927 ) ) ( not ( = ?auto_748926 ?auto_748927 ) ) ( CLEAR ?auto_748924 ) ( ON ?auto_748925 ?auto_748926 ) ( CLEAR ?auto_748925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_748920 ?auto_748921 ?auto_748922 ?auto_748923 ?auto_748924 ?auto_748925 )
      ( MAKE-7PILE ?auto_748920 ?auto_748921 ?auto_748922 ?auto_748923 ?auto_748924 ?auto_748925 ?auto_748926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_748950 - BLOCK
      ?auto_748951 - BLOCK
      ?auto_748952 - BLOCK
      ?auto_748953 - BLOCK
      ?auto_748954 - BLOCK
      ?auto_748955 - BLOCK
      ?auto_748956 - BLOCK
    )
    :vars
    (
      ?auto_748957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748956 ?auto_748957 ) ( ON-TABLE ?auto_748950 ) ( ON ?auto_748951 ?auto_748950 ) ( ON ?auto_748952 ?auto_748951 ) ( ON ?auto_748953 ?auto_748952 ) ( not ( = ?auto_748950 ?auto_748951 ) ) ( not ( = ?auto_748950 ?auto_748952 ) ) ( not ( = ?auto_748950 ?auto_748953 ) ) ( not ( = ?auto_748950 ?auto_748954 ) ) ( not ( = ?auto_748950 ?auto_748955 ) ) ( not ( = ?auto_748950 ?auto_748956 ) ) ( not ( = ?auto_748950 ?auto_748957 ) ) ( not ( = ?auto_748951 ?auto_748952 ) ) ( not ( = ?auto_748951 ?auto_748953 ) ) ( not ( = ?auto_748951 ?auto_748954 ) ) ( not ( = ?auto_748951 ?auto_748955 ) ) ( not ( = ?auto_748951 ?auto_748956 ) ) ( not ( = ?auto_748951 ?auto_748957 ) ) ( not ( = ?auto_748952 ?auto_748953 ) ) ( not ( = ?auto_748952 ?auto_748954 ) ) ( not ( = ?auto_748952 ?auto_748955 ) ) ( not ( = ?auto_748952 ?auto_748956 ) ) ( not ( = ?auto_748952 ?auto_748957 ) ) ( not ( = ?auto_748953 ?auto_748954 ) ) ( not ( = ?auto_748953 ?auto_748955 ) ) ( not ( = ?auto_748953 ?auto_748956 ) ) ( not ( = ?auto_748953 ?auto_748957 ) ) ( not ( = ?auto_748954 ?auto_748955 ) ) ( not ( = ?auto_748954 ?auto_748956 ) ) ( not ( = ?auto_748954 ?auto_748957 ) ) ( not ( = ?auto_748955 ?auto_748956 ) ) ( not ( = ?auto_748955 ?auto_748957 ) ) ( not ( = ?auto_748956 ?auto_748957 ) ) ( ON ?auto_748955 ?auto_748956 ) ( CLEAR ?auto_748953 ) ( ON ?auto_748954 ?auto_748955 ) ( CLEAR ?auto_748954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_748950 ?auto_748951 ?auto_748952 ?auto_748953 ?auto_748954 )
      ( MAKE-7PILE ?auto_748950 ?auto_748951 ?auto_748952 ?auto_748953 ?auto_748954 ?auto_748955 ?auto_748956 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_748980 - BLOCK
      ?auto_748981 - BLOCK
      ?auto_748982 - BLOCK
      ?auto_748983 - BLOCK
      ?auto_748984 - BLOCK
      ?auto_748985 - BLOCK
      ?auto_748986 - BLOCK
    )
    :vars
    (
      ?auto_748987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_748986 ?auto_748987 ) ( ON-TABLE ?auto_748980 ) ( ON ?auto_748981 ?auto_748980 ) ( ON ?auto_748982 ?auto_748981 ) ( not ( = ?auto_748980 ?auto_748981 ) ) ( not ( = ?auto_748980 ?auto_748982 ) ) ( not ( = ?auto_748980 ?auto_748983 ) ) ( not ( = ?auto_748980 ?auto_748984 ) ) ( not ( = ?auto_748980 ?auto_748985 ) ) ( not ( = ?auto_748980 ?auto_748986 ) ) ( not ( = ?auto_748980 ?auto_748987 ) ) ( not ( = ?auto_748981 ?auto_748982 ) ) ( not ( = ?auto_748981 ?auto_748983 ) ) ( not ( = ?auto_748981 ?auto_748984 ) ) ( not ( = ?auto_748981 ?auto_748985 ) ) ( not ( = ?auto_748981 ?auto_748986 ) ) ( not ( = ?auto_748981 ?auto_748987 ) ) ( not ( = ?auto_748982 ?auto_748983 ) ) ( not ( = ?auto_748982 ?auto_748984 ) ) ( not ( = ?auto_748982 ?auto_748985 ) ) ( not ( = ?auto_748982 ?auto_748986 ) ) ( not ( = ?auto_748982 ?auto_748987 ) ) ( not ( = ?auto_748983 ?auto_748984 ) ) ( not ( = ?auto_748983 ?auto_748985 ) ) ( not ( = ?auto_748983 ?auto_748986 ) ) ( not ( = ?auto_748983 ?auto_748987 ) ) ( not ( = ?auto_748984 ?auto_748985 ) ) ( not ( = ?auto_748984 ?auto_748986 ) ) ( not ( = ?auto_748984 ?auto_748987 ) ) ( not ( = ?auto_748985 ?auto_748986 ) ) ( not ( = ?auto_748985 ?auto_748987 ) ) ( not ( = ?auto_748986 ?auto_748987 ) ) ( ON ?auto_748985 ?auto_748986 ) ( ON ?auto_748984 ?auto_748985 ) ( CLEAR ?auto_748982 ) ( ON ?auto_748983 ?auto_748984 ) ( CLEAR ?auto_748983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_748980 ?auto_748981 ?auto_748982 ?auto_748983 )
      ( MAKE-7PILE ?auto_748980 ?auto_748981 ?auto_748982 ?auto_748983 ?auto_748984 ?auto_748985 ?auto_748986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_749010 - BLOCK
      ?auto_749011 - BLOCK
      ?auto_749012 - BLOCK
      ?auto_749013 - BLOCK
      ?auto_749014 - BLOCK
      ?auto_749015 - BLOCK
      ?auto_749016 - BLOCK
    )
    :vars
    (
      ?auto_749017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749016 ?auto_749017 ) ( ON-TABLE ?auto_749010 ) ( ON ?auto_749011 ?auto_749010 ) ( not ( = ?auto_749010 ?auto_749011 ) ) ( not ( = ?auto_749010 ?auto_749012 ) ) ( not ( = ?auto_749010 ?auto_749013 ) ) ( not ( = ?auto_749010 ?auto_749014 ) ) ( not ( = ?auto_749010 ?auto_749015 ) ) ( not ( = ?auto_749010 ?auto_749016 ) ) ( not ( = ?auto_749010 ?auto_749017 ) ) ( not ( = ?auto_749011 ?auto_749012 ) ) ( not ( = ?auto_749011 ?auto_749013 ) ) ( not ( = ?auto_749011 ?auto_749014 ) ) ( not ( = ?auto_749011 ?auto_749015 ) ) ( not ( = ?auto_749011 ?auto_749016 ) ) ( not ( = ?auto_749011 ?auto_749017 ) ) ( not ( = ?auto_749012 ?auto_749013 ) ) ( not ( = ?auto_749012 ?auto_749014 ) ) ( not ( = ?auto_749012 ?auto_749015 ) ) ( not ( = ?auto_749012 ?auto_749016 ) ) ( not ( = ?auto_749012 ?auto_749017 ) ) ( not ( = ?auto_749013 ?auto_749014 ) ) ( not ( = ?auto_749013 ?auto_749015 ) ) ( not ( = ?auto_749013 ?auto_749016 ) ) ( not ( = ?auto_749013 ?auto_749017 ) ) ( not ( = ?auto_749014 ?auto_749015 ) ) ( not ( = ?auto_749014 ?auto_749016 ) ) ( not ( = ?auto_749014 ?auto_749017 ) ) ( not ( = ?auto_749015 ?auto_749016 ) ) ( not ( = ?auto_749015 ?auto_749017 ) ) ( not ( = ?auto_749016 ?auto_749017 ) ) ( ON ?auto_749015 ?auto_749016 ) ( ON ?auto_749014 ?auto_749015 ) ( ON ?auto_749013 ?auto_749014 ) ( CLEAR ?auto_749011 ) ( ON ?auto_749012 ?auto_749013 ) ( CLEAR ?auto_749012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_749010 ?auto_749011 ?auto_749012 )
      ( MAKE-7PILE ?auto_749010 ?auto_749011 ?auto_749012 ?auto_749013 ?auto_749014 ?auto_749015 ?auto_749016 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_749040 - BLOCK
      ?auto_749041 - BLOCK
      ?auto_749042 - BLOCK
      ?auto_749043 - BLOCK
      ?auto_749044 - BLOCK
      ?auto_749045 - BLOCK
      ?auto_749046 - BLOCK
    )
    :vars
    (
      ?auto_749047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749046 ?auto_749047 ) ( ON-TABLE ?auto_749040 ) ( not ( = ?auto_749040 ?auto_749041 ) ) ( not ( = ?auto_749040 ?auto_749042 ) ) ( not ( = ?auto_749040 ?auto_749043 ) ) ( not ( = ?auto_749040 ?auto_749044 ) ) ( not ( = ?auto_749040 ?auto_749045 ) ) ( not ( = ?auto_749040 ?auto_749046 ) ) ( not ( = ?auto_749040 ?auto_749047 ) ) ( not ( = ?auto_749041 ?auto_749042 ) ) ( not ( = ?auto_749041 ?auto_749043 ) ) ( not ( = ?auto_749041 ?auto_749044 ) ) ( not ( = ?auto_749041 ?auto_749045 ) ) ( not ( = ?auto_749041 ?auto_749046 ) ) ( not ( = ?auto_749041 ?auto_749047 ) ) ( not ( = ?auto_749042 ?auto_749043 ) ) ( not ( = ?auto_749042 ?auto_749044 ) ) ( not ( = ?auto_749042 ?auto_749045 ) ) ( not ( = ?auto_749042 ?auto_749046 ) ) ( not ( = ?auto_749042 ?auto_749047 ) ) ( not ( = ?auto_749043 ?auto_749044 ) ) ( not ( = ?auto_749043 ?auto_749045 ) ) ( not ( = ?auto_749043 ?auto_749046 ) ) ( not ( = ?auto_749043 ?auto_749047 ) ) ( not ( = ?auto_749044 ?auto_749045 ) ) ( not ( = ?auto_749044 ?auto_749046 ) ) ( not ( = ?auto_749044 ?auto_749047 ) ) ( not ( = ?auto_749045 ?auto_749046 ) ) ( not ( = ?auto_749045 ?auto_749047 ) ) ( not ( = ?auto_749046 ?auto_749047 ) ) ( ON ?auto_749045 ?auto_749046 ) ( ON ?auto_749044 ?auto_749045 ) ( ON ?auto_749043 ?auto_749044 ) ( ON ?auto_749042 ?auto_749043 ) ( CLEAR ?auto_749040 ) ( ON ?auto_749041 ?auto_749042 ) ( CLEAR ?auto_749041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_749040 ?auto_749041 )
      ( MAKE-7PILE ?auto_749040 ?auto_749041 ?auto_749042 ?auto_749043 ?auto_749044 ?auto_749045 ?auto_749046 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_749070 - BLOCK
      ?auto_749071 - BLOCK
      ?auto_749072 - BLOCK
      ?auto_749073 - BLOCK
      ?auto_749074 - BLOCK
      ?auto_749075 - BLOCK
      ?auto_749076 - BLOCK
    )
    :vars
    (
      ?auto_749077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749076 ?auto_749077 ) ( not ( = ?auto_749070 ?auto_749071 ) ) ( not ( = ?auto_749070 ?auto_749072 ) ) ( not ( = ?auto_749070 ?auto_749073 ) ) ( not ( = ?auto_749070 ?auto_749074 ) ) ( not ( = ?auto_749070 ?auto_749075 ) ) ( not ( = ?auto_749070 ?auto_749076 ) ) ( not ( = ?auto_749070 ?auto_749077 ) ) ( not ( = ?auto_749071 ?auto_749072 ) ) ( not ( = ?auto_749071 ?auto_749073 ) ) ( not ( = ?auto_749071 ?auto_749074 ) ) ( not ( = ?auto_749071 ?auto_749075 ) ) ( not ( = ?auto_749071 ?auto_749076 ) ) ( not ( = ?auto_749071 ?auto_749077 ) ) ( not ( = ?auto_749072 ?auto_749073 ) ) ( not ( = ?auto_749072 ?auto_749074 ) ) ( not ( = ?auto_749072 ?auto_749075 ) ) ( not ( = ?auto_749072 ?auto_749076 ) ) ( not ( = ?auto_749072 ?auto_749077 ) ) ( not ( = ?auto_749073 ?auto_749074 ) ) ( not ( = ?auto_749073 ?auto_749075 ) ) ( not ( = ?auto_749073 ?auto_749076 ) ) ( not ( = ?auto_749073 ?auto_749077 ) ) ( not ( = ?auto_749074 ?auto_749075 ) ) ( not ( = ?auto_749074 ?auto_749076 ) ) ( not ( = ?auto_749074 ?auto_749077 ) ) ( not ( = ?auto_749075 ?auto_749076 ) ) ( not ( = ?auto_749075 ?auto_749077 ) ) ( not ( = ?auto_749076 ?auto_749077 ) ) ( ON ?auto_749075 ?auto_749076 ) ( ON ?auto_749074 ?auto_749075 ) ( ON ?auto_749073 ?auto_749074 ) ( ON ?auto_749072 ?auto_749073 ) ( ON ?auto_749071 ?auto_749072 ) ( ON ?auto_749070 ?auto_749071 ) ( CLEAR ?auto_749070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_749070 )
      ( MAKE-7PILE ?auto_749070 ?auto_749071 ?auto_749072 ?auto_749073 ?auto_749074 ?auto_749075 ?auto_749076 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749101 - BLOCK
      ?auto_749102 - BLOCK
      ?auto_749103 - BLOCK
      ?auto_749104 - BLOCK
      ?auto_749105 - BLOCK
      ?auto_749106 - BLOCK
      ?auto_749107 - BLOCK
      ?auto_749108 - BLOCK
    )
    :vars
    (
      ?auto_749109 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_749107 ) ( ON ?auto_749108 ?auto_749109 ) ( CLEAR ?auto_749108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_749101 ) ( ON ?auto_749102 ?auto_749101 ) ( ON ?auto_749103 ?auto_749102 ) ( ON ?auto_749104 ?auto_749103 ) ( ON ?auto_749105 ?auto_749104 ) ( ON ?auto_749106 ?auto_749105 ) ( ON ?auto_749107 ?auto_749106 ) ( not ( = ?auto_749101 ?auto_749102 ) ) ( not ( = ?auto_749101 ?auto_749103 ) ) ( not ( = ?auto_749101 ?auto_749104 ) ) ( not ( = ?auto_749101 ?auto_749105 ) ) ( not ( = ?auto_749101 ?auto_749106 ) ) ( not ( = ?auto_749101 ?auto_749107 ) ) ( not ( = ?auto_749101 ?auto_749108 ) ) ( not ( = ?auto_749101 ?auto_749109 ) ) ( not ( = ?auto_749102 ?auto_749103 ) ) ( not ( = ?auto_749102 ?auto_749104 ) ) ( not ( = ?auto_749102 ?auto_749105 ) ) ( not ( = ?auto_749102 ?auto_749106 ) ) ( not ( = ?auto_749102 ?auto_749107 ) ) ( not ( = ?auto_749102 ?auto_749108 ) ) ( not ( = ?auto_749102 ?auto_749109 ) ) ( not ( = ?auto_749103 ?auto_749104 ) ) ( not ( = ?auto_749103 ?auto_749105 ) ) ( not ( = ?auto_749103 ?auto_749106 ) ) ( not ( = ?auto_749103 ?auto_749107 ) ) ( not ( = ?auto_749103 ?auto_749108 ) ) ( not ( = ?auto_749103 ?auto_749109 ) ) ( not ( = ?auto_749104 ?auto_749105 ) ) ( not ( = ?auto_749104 ?auto_749106 ) ) ( not ( = ?auto_749104 ?auto_749107 ) ) ( not ( = ?auto_749104 ?auto_749108 ) ) ( not ( = ?auto_749104 ?auto_749109 ) ) ( not ( = ?auto_749105 ?auto_749106 ) ) ( not ( = ?auto_749105 ?auto_749107 ) ) ( not ( = ?auto_749105 ?auto_749108 ) ) ( not ( = ?auto_749105 ?auto_749109 ) ) ( not ( = ?auto_749106 ?auto_749107 ) ) ( not ( = ?auto_749106 ?auto_749108 ) ) ( not ( = ?auto_749106 ?auto_749109 ) ) ( not ( = ?auto_749107 ?auto_749108 ) ) ( not ( = ?auto_749107 ?auto_749109 ) ) ( not ( = ?auto_749108 ?auto_749109 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_749108 ?auto_749109 )
      ( !STACK ?auto_749108 ?auto_749107 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749135 - BLOCK
      ?auto_749136 - BLOCK
      ?auto_749137 - BLOCK
      ?auto_749138 - BLOCK
      ?auto_749139 - BLOCK
      ?auto_749140 - BLOCK
      ?auto_749141 - BLOCK
      ?auto_749142 - BLOCK
    )
    :vars
    (
      ?auto_749143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749142 ?auto_749143 ) ( ON-TABLE ?auto_749135 ) ( ON ?auto_749136 ?auto_749135 ) ( ON ?auto_749137 ?auto_749136 ) ( ON ?auto_749138 ?auto_749137 ) ( ON ?auto_749139 ?auto_749138 ) ( ON ?auto_749140 ?auto_749139 ) ( not ( = ?auto_749135 ?auto_749136 ) ) ( not ( = ?auto_749135 ?auto_749137 ) ) ( not ( = ?auto_749135 ?auto_749138 ) ) ( not ( = ?auto_749135 ?auto_749139 ) ) ( not ( = ?auto_749135 ?auto_749140 ) ) ( not ( = ?auto_749135 ?auto_749141 ) ) ( not ( = ?auto_749135 ?auto_749142 ) ) ( not ( = ?auto_749135 ?auto_749143 ) ) ( not ( = ?auto_749136 ?auto_749137 ) ) ( not ( = ?auto_749136 ?auto_749138 ) ) ( not ( = ?auto_749136 ?auto_749139 ) ) ( not ( = ?auto_749136 ?auto_749140 ) ) ( not ( = ?auto_749136 ?auto_749141 ) ) ( not ( = ?auto_749136 ?auto_749142 ) ) ( not ( = ?auto_749136 ?auto_749143 ) ) ( not ( = ?auto_749137 ?auto_749138 ) ) ( not ( = ?auto_749137 ?auto_749139 ) ) ( not ( = ?auto_749137 ?auto_749140 ) ) ( not ( = ?auto_749137 ?auto_749141 ) ) ( not ( = ?auto_749137 ?auto_749142 ) ) ( not ( = ?auto_749137 ?auto_749143 ) ) ( not ( = ?auto_749138 ?auto_749139 ) ) ( not ( = ?auto_749138 ?auto_749140 ) ) ( not ( = ?auto_749138 ?auto_749141 ) ) ( not ( = ?auto_749138 ?auto_749142 ) ) ( not ( = ?auto_749138 ?auto_749143 ) ) ( not ( = ?auto_749139 ?auto_749140 ) ) ( not ( = ?auto_749139 ?auto_749141 ) ) ( not ( = ?auto_749139 ?auto_749142 ) ) ( not ( = ?auto_749139 ?auto_749143 ) ) ( not ( = ?auto_749140 ?auto_749141 ) ) ( not ( = ?auto_749140 ?auto_749142 ) ) ( not ( = ?auto_749140 ?auto_749143 ) ) ( not ( = ?auto_749141 ?auto_749142 ) ) ( not ( = ?auto_749141 ?auto_749143 ) ) ( not ( = ?auto_749142 ?auto_749143 ) ) ( CLEAR ?auto_749140 ) ( ON ?auto_749141 ?auto_749142 ) ( CLEAR ?auto_749141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_749135 ?auto_749136 ?auto_749137 ?auto_749138 ?auto_749139 ?auto_749140 ?auto_749141 )
      ( MAKE-8PILE ?auto_749135 ?auto_749136 ?auto_749137 ?auto_749138 ?auto_749139 ?auto_749140 ?auto_749141 ?auto_749142 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749169 - BLOCK
      ?auto_749170 - BLOCK
      ?auto_749171 - BLOCK
      ?auto_749172 - BLOCK
      ?auto_749173 - BLOCK
      ?auto_749174 - BLOCK
      ?auto_749175 - BLOCK
      ?auto_749176 - BLOCK
    )
    :vars
    (
      ?auto_749177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749176 ?auto_749177 ) ( ON-TABLE ?auto_749169 ) ( ON ?auto_749170 ?auto_749169 ) ( ON ?auto_749171 ?auto_749170 ) ( ON ?auto_749172 ?auto_749171 ) ( ON ?auto_749173 ?auto_749172 ) ( not ( = ?auto_749169 ?auto_749170 ) ) ( not ( = ?auto_749169 ?auto_749171 ) ) ( not ( = ?auto_749169 ?auto_749172 ) ) ( not ( = ?auto_749169 ?auto_749173 ) ) ( not ( = ?auto_749169 ?auto_749174 ) ) ( not ( = ?auto_749169 ?auto_749175 ) ) ( not ( = ?auto_749169 ?auto_749176 ) ) ( not ( = ?auto_749169 ?auto_749177 ) ) ( not ( = ?auto_749170 ?auto_749171 ) ) ( not ( = ?auto_749170 ?auto_749172 ) ) ( not ( = ?auto_749170 ?auto_749173 ) ) ( not ( = ?auto_749170 ?auto_749174 ) ) ( not ( = ?auto_749170 ?auto_749175 ) ) ( not ( = ?auto_749170 ?auto_749176 ) ) ( not ( = ?auto_749170 ?auto_749177 ) ) ( not ( = ?auto_749171 ?auto_749172 ) ) ( not ( = ?auto_749171 ?auto_749173 ) ) ( not ( = ?auto_749171 ?auto_749174 ) ) ( not ( = ?auto_749171 ?auto_749175 ) ) ( not ( = ?auto_749171 ?auto_749176 ) ) ( not ( = ?auto_749171 ?auto_749177 ) ) ( not ( = ?auto_749172 ?auto_749173 ) ) ( not ( = ?auto_749172 ?auto_749174 ) ) ( not ( = ?auto_749172 ?auto_749175 ) ) ( not ( = ?auto_749172 ?auto_749176 ) ) ( not ( = ?auto_749172 ?auto_749177 ) ) ( not ( = ?auto_749173 ?auto_749174 ) ) ( not ( = ?auto_749173 ?auto_749175 ) ) ( not ( = ?auto_749173 ?auto_749176 ) ) ( not ( = ?auto_749173 ?auto_749177 ) ) ( not ( = ?auto_749174 ?auto_749175 ) ) ( not ( = ?auto_749174 ?auto_749176 ) ) ( not ( = ?auto_749174 ?auto_749177 ) ) ( not ( = ?auto_749175 ?auto_749176 ) ) ( not ( = ?auto_749175 ?auto_749177 ) ) ( not ( = ?auto_749176 ?auto_749177 ) ) ( ON ?auto_749175 ?auto_749176 ) ( CLEAR ?auto_749173 ) ( ON ?auto_749174 ?auto_749175 ) ( CLEAR ?auto_749174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_749169 ?auto_749170 ?auto_749171 ?auto_749172 ?auto_749173 ?auto_749174 )
      ( MAKE-8PILE ?auto_749169 ?auto_749170 ?auto_749171 ?auto_749172 ?auto_749173 ?auto_749174 ?auto_749175 ?auto_749176 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749203 - BLOCK
      ?auto_749204 - BLOCK
      ?auto_749205 - BLOCK
      ?auto_749206 - BLOCK
      ?auto_749207 - BLOCK
      ?auto_749208 - BLOCK
      ?auto_749209 - BLOCK
      ?auto_749210 - BLOCK
    )
    :vars
    (
      ?auto_749211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749210 ?auto_749211 ) ( ON-TABLE ?auto_749203 ) ( ON ?auto_749204 ?auto_749203 ) ( ON ?auto_749205 ?auto_749204 ) ( ON ?auto_749206 ?auto_749205 ) ( not ( = ?auto_749203 ?auto_749204 ) ) ( not ( = ?auto_749203 ?auto_749205 ) ) ( not ( = ?auto_749203 ?auto_749206 ) ) ( not ( = ?auto_749203 ?auto_749207 ) ) ( not ( = ?auto_749203 ?auto_749208 ) ) ( not ( = ?auto_749203 ?auto_749209 ) ) ( not ( = ?auto_749203 ?auto_749210 ) ) ( not ( = ?auto_749203 ?auto_749211 ) ) ( not ( = ?auto_749204 ?auto_749205 ) ) ( not ( = ?auto_749204 ?auto_749206 ) ) ( not ( = ?auto_749204 ?auto_749207 ) ) ( not ( = ?auto_749204 ?auto_749208 ) ) ( not ( = ?auto_749204 ?auto_749209 ) ) ( not ( = ?auto_749204 ?auto_749210 ) ) ( not ( = ?auto_749204 ?auto_749211 ) ) ( not ( = ?auto_749205 ?auto_749206 ) ) ( not ( = ?auto_749205 ?auto_749207 ) ) ( not ( = ?auto_749205 ?auto_749208 ) ) ( not ( = ?auto_749205 ?auto_749209 ) ) ( not ( = ?auto_749205 ?auto_749210 ) ) ( not ( = ?auto_749205 ?auto_749211 ) ) ( not ( = ?auto_749206 ?auto_749207 ) ) ( not ( = ?auto_749206 ?auto_749208 ) ) ( not ( = ?auto_749206 ?auto_749209 ) ) ( not ( = ?auto_749206 ?auto_749210 ) ) ( not ( = ?auto_749206 ?auto_749211 ) ) ( not ( = ?auto_749207 ?auto_749208 ) ) ( not ( = ?auto_749207 ?auto_749209 ) ) ( not ( = ?auto_749207 ?auto_749210 ) ) ( not ( = ?auto_749207 ?auto_749211 ) ) ( not ( = ?auto_749208 ?auto_749209 ) ) ( not ( = ?auto_749208 ?auto_749210 ) ) ( not ( = ?auto_749208 ?auto_749211 ) ) ( not ( = ?auto_749209 ?auto_749210 ) ) ( not ( = ?auto_749209 ?auto_749211 ) ) ( not ( = ?auto_749210 ?auto_749211 ) ) ( ON ?auto_749209 ?auto_749210 ) ( ON ?auto_749208 ?auto_749209 ) ( CLEAR ?auto_749206 ) ( ON ?auto_749207 ?auto_749208 ) ( CLEAR ?auto_749207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_749203 ?auto_749204 ?auto_749205 ?auto_749206 ?auto_749207 )
      ( MAKE-8PILE ?auto_749203 ?auto_749204 ?auto_749205 ?auto_749206 ?auto_749207 ?auto_749208 ?auto_749209 ?auto_749210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749237 - BLOCK
      ?auto_749238 - BLOCK
      ?auto_749239 - BLOCK
      ?auto_749240 - BLOCK
      ?auto_749241 - BLOCK
      ?auto_749242 - BLOCK
      ?auto_749243 - BLOCK
      ?auto_749244 - BLOCK
    )
    :vars
    (
      ?auto_749245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749244 ?auto_749245 ) ( ON-TABLE ?auto_749237 ) ( ON ?auto_749238 ?auto_749237 ) ( ON ?auto_749239 ?auto_749238 ) ( not ( = ?auto_749237 ?auto_749238 ) ) ( not ( = ?auto_749237 ?auto_749239 ) ) ( not ( = ?auto_749237 ?auto_749240 ) ) ( not ( = ?auto_749237 ?auto_749241 ) ) ( not ( = ?auto_749237 ?auto_749242 ) ) ( not ( = ?auto_749237 ?auto_749243 ) ) ( not ( = ?auto_749237 ?auto_749244 ) ) ( not ( = ?auto_749237 ?auto_749245 ) ) ( not ( = ?auto_749238 ?auto_749239 ) ) ( not ( = ?auto_749238 ?auto_749240 ) ) ( not ( = ?auto_749238 ?auto_749241 ) ) ( not ( = ?auto_749238 ?auto_749242 ) ) ( not ( = ?auto_749238 ?auto_749243 ) ) ( not ( = ?auto_749238 ?auto_749244 ) ) ( not ( = ?auto_749238 ?auto_749245 ) ) ( not ( = ?auto_749239 ?auto_749240 ) ) ( not ( = ?auto_749239 ?auto_749241 ) ) ( not ( = ?auto_749239 ?auto_749242 ) ) ( not ( = ?auto_749239 ?auto_749243 ) ) ( not ( = ?auto_749239 ?auto_749244 ) ) ( not ( = ?auto_749239 ?auto_749245 ) ) ( not ( = ?auto_749240 ?auto_749241 ) ) ( not ( = ?auto_749240 ?auto_749242 ) ) ( not ( = ?auto_749240 ?auto_749243 ) ) ( not ( = ?auto_749240 ?auto_749244 ) ) ( not ( = ?auto_749240 ?auto_749245 ) ) ( not ( = ?auto_749241 ?auto_749242 ) ) ( not ( = ?auto_749241 ?auto_749243 ) ) ( not ( = ?auto_749241 ?auto_749244 ) ) ( not ( = ?auto_749241 ?auto_749245 ) ) ( not ( = ?auto_749242 ?auto_749243 ) ) ( not ( = ?auto_749242 ?auto_749244 ) ) ( not ( = ?auto_749242 ?auto_749245 ) ) ( not ( = ?auto_749243 ?auto_749244 ) ) ( not ( = ?auto_749243 ?auto_749245 ) ) ( not ( = ?auto_749244 ?auto_749245 ) ) ( ON ?auto_749243 ?auto_749244 ) ( ON ?auto_749242 ?auto_749243 ) ( ON ?auto_749241 ?auto_749242 ) ( CLEAR ?auto_749239 ) ( ON ?auto_749240 ?auto_749241 ) ( CLEAR ?auto_749240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_749237 ?auto_749238 ?auto_749239 ?auto_749240 )
      ( MAKE-8PILE ?auto_749237 ?auto_749238 ?auto_749239 ?auto_749240 ?auto_749241 ?auto_749242 ?auto_749243 ?auto_749244 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749271 - BLOCK
      ?auto_749272 - BLOCK
      ?auto_749273 - BLOCK
      ?auto_749274 - BLOCK
      ?auto_749275 - BLOCK
      ?auto_749276 - BLOCK
      ?auto_749277 - BLOCK
      ?auto_749278 - BLOCK
    )
    :vars
    (
      ?auto_749279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749278 ?auto_749279 ) ( ON-TABLE ?auto_749271 ) ( ON ?auto_749272 ?auto_749271 ) ( not ( = ?auto_749271 ?auto_749272 ) ) ( not ( = ?auto_749271 ?auto_749273 ) ) ( not ( = ?auto_749271 ?auto_749274 ) ) ( not ( = ?auto_749271 ?auto_749275 ) ) ( not ( = ?auto_749271 ?auto_749276 ) ) ( not ( = ?auto_749271 ?auto_749277 ) ) ( not ( = ?auto_749271 ?auto_749278 ) ) ( not ( = ?auto_749271 ?auto_749279 ) ) ( not ( = ?auto_749272 ?auto_749273 ) ) ( not ( = ?auto_749272 ?auto_749274 ) ) ( not ( = ?auto_749272 ?auto_749275 ) ) ( not ( = ?auto_749272 ?auto_749276 ) ) ( not ( = ?auto_749272 ?auto_749277 ) ) ( not ( = ?auto_749272 ?auto_749278 ) ) ( not ( = ?auto_749272 ?auto_749279 ) ) ( not ( = ?auto_749273 ?auto_749274 ) ) ( not ( = ?auto_749273 ?auto_749275 ) ) ( not ( = ?auto_749273 ?auto_749276 ) ) ( not ( = ?auto_749273 ?auto_749277 ) ) ( not ( = ?auto_749273 ?auto_749278 ) ) ( not ( = ?auto_749273 ?auto_749279 ) ) ( not ( = ?auto_749274 ?auto_749275 ) ) ( not ( = ?auto_749274 ?auto_749276 ) ) ( not ( = ?auto_749274 ?auto_749277 ) ) ( not ( = ?auto_749274 ?auto_749278 ) ) ( not ( = ?auto_749274 ?auto_749279 ) ) ( not ( = ?auto_749275 ?auto_749276 ) ) ( not ( = ?auto_749275 ?auto_749277 ) ) ( not ( = ?auto_749275 ?auto_749278 ) ) ( not ( = ?auto_749275 ?auto_749279 ) ) ( not ( = ?auto_749276 ?auto_749277 ) ) ( not ( = ?auto_749276 ?auto_749278 ) ) ( not ( = ?auto_749276 ?auto_749279 ) ) ( not ( = ?auto_749277 ?auto_749278 ) ) ( not ( = ?auto_749277 ?auto_749279 ) ) ( not ( = ?auto_749278 ?auto_749279 ) ) ( ON ?auto_749277 ?auto_749278 ) ( ON ?auto_749276 ?auto_749277 ) ( ON ?auto_749275 ?auto_749276 ) ( ON ?auto_749274 ?auto_749275 ) ( CLEAR ?auto_749272 ) ( ON ?auto_749273 ?auto_749274 ) ( CLEAR ?auto_749273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_749271 ?auto_749272 ?auto_749273 )
      ( MAKE-8PILE ?auto_749271 ?auto_749272 ?auto_749273 ?auto_749274 ?auto_749275 ?auto_749276 ?auto_749277 ?auto_749278 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749305 - BLOCK
      ?auto_749306 - BLOCK
      ?auto_749307 - BLOCK
      ?auto_749308 - BLOCK
      ?auto_749309 - BLOCK
      ?auto_749310 - BLOCK
      ?auto_749311 - BLOCK
      ?auto_749312 - BLOCK
    )
    :vars
    (
      ?auto_749313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749312 ?auto_749313 ) ( ON-TABLE ?auto_749305 ) ( not ( = ?auto_749305 ?auto_749306 ) ) ( not ( = ?auto_749305 ?auto_749307 ) ) ( not ( = ?auto_749305 ?auto_749308 ) ) ( not ( = ?auto_749305 ?auto_749309 ) ) ( not ( = ?auto_749305 ?auto_749310 ) ) ( not ( = ?auto_749305 ?auto_749311 ) ) ( not ( = ?auto_749305 ?auto_749312 ) ) ( not ( = ?auto_749305 ?auto_749313 ) ) ( not ( = ?auto_749306 ?auto_749307 ) ) ( not ( = ?auto_749306 ?auto_749308 ) ) ( not ( = ?auto_749306 ?auto_749309 ) ) ( not ( = ?auto_749306 ?auto_749310 ) ) ( not ( = ?auto_749306 ?auto_749311 ) ) ( not ( = ?auto_749306 ?auto_749312 ) ) ( not ( = ?auto_749306 ?auto_749313 ) ) ( not ( = ?auto_749307 ?auto_749308 ) ) ( not ( = ?auto_749307 ?auto_749309 ) ) ( not ( = ?auto_749307 ?auto_749310 ) ) ( not ( = ?auto_749307 ?auto_749311 ) ) ( not ( = ?auto_749307 ?auto_749312 ) ) ( not ( = ?auto_749307 ?auto_749313 ) ) ( not ( = ?auto_749308 ?auto_749309 ) ) ( not ( = ?auto_749308 ?auto_749310 ) ) ( not ( = ?auto_749308 ?auto_749311 ) ) ( not ( = ?auto_749308 ?auto_749312 ) ) ( not ( = ?auto_749308 ?auto_749313 ) ) ( not ( = ?auto_749309 ?auto_749310 ) ) ( not ( = ?auto_749309 ?auto_749311 ) ) ( not ( = ?auto_749309 ?auto_749312 ) ) ( not ( = ?auto_749309 ?auto_749313 ) ) ( not ( = ?auto_749310 ?auto_749311 ) ) ( not ( = ?auto_749310 ?auto_749312 ) ) ( not ( = ?auto_749310 ?auto_749313 ) ) ( not ( = ?auto_749311 ?auto_749312 ) ) ( not ( = ?auto_749311 ?auto_749313 ) ) ( not ( = ?auto_749312 ?auto_749313 ) ) ( ON ?auto_749311 ?auto_749312 ) ( ON ?auto_749310 ?auto_749311 ) ( ON ?auto_749309 ?auto_749310 ) ( ON ?auto_749308 ?auto_749309 ) ( ON ?auto_749307 ?auto_749308 ) ( CLEAR ?auto_749305 ) ( ON ?auto_749306 ?auto_749307 ) ( CLEAR ?auto_749306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_749305 ?auto_749306 )
      ( MAKE-8PILE ?auto_749305 ?auto_749306 ?auto_749307 ?auto_749308 ?auto_749309 ?auto_749310 ?auto_749311 ?auto_749312 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_749339 - BLOCK
      ?auto_749340 - BLOCK
      ?auto_749341 - BLOCK
      ?auto_749342 - BLOCK
      ?auto_749343 - BLOCK
      ?auto_749344 - BLOCK
      ?auto_749345 - BLOCK
      ?auto_749346 - BLOCK
    )
    :vars
    (
      ?auto_749347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749346 ?auto_749347 ) ( not ( = ?auto_749339 ?auto_749340 ) ) ( not ( = ?auto_749339 ?auto_749341 ) ) ( not ( = ?auto_749339 ?auto_749342 ) ) ( not ( = ?auto_749339 ?auto_749343 ) ) ( not ( = ?auto_749339 ?auto_749344 ) ) ( not ( = ?auto_749339 ?auto_749345 ) ) ( not ( = ?auto_749339 ?auto_749346 ) ) ( not ( = ?auto_749339 ?auto_749347 ) ) ( not ( = ?auto_749340 ?auto_749341 ) ) ( not ( = ?auto_749340 ?auto_749342 ) ) ( not ( = ?auto_749340 ?auto_749343 ) ) ( not ( = ?auto_749340 ?auto_749344 ) ) ( not ( = ?auto_749340 ?auto_749345 ) ) ( not ( = ?auto_749340 ?auto_749346 ) ) ( not ( = ?auto_749340 ?auto_749347 ) ) ( not ( = ?auto_749341 ?auto_749342 ) ) ( not ( = ?auto_749341 ?auto_749343 ) ) ( not ( = ?auto_749341 ?auto_749344 ) ) ( not ( = ?auto_749341 ?auto_749345 ) ) ( not ( = ?auto_749341 ?auto_749346 ) ) ( not ( = ?auto_749341 ?auto_749347 ) ) ( not ( = ?auto_749342 ?auto_749343 ) ) ( not ( = ?auto_749342 ?auto_749344 ) ) ( not ( = ?auto_749342 ?auto_749345 ) ) ( not ( = ?auto_749342 ?auto_749346 ) ) ( not ( = ?auto_749342 ?auto_749347 ) ) ( not ( = ?auto_749343 ?auto_749344 ) ) ( not ( = ?auto_749343 ?auto_749345 ) ) ( not ( = ?auto_749343 ?auto_749346 ) ) ( not ( = ?auto_749343 ?auto_749347 ) ) ( not ( = ?auto_749344 ?auto_749345 ) ) ( not ( = ?auto_749344 ?auto_749346 ) ) ( not ( = ?auto_749344 ?auto_749347 ) ) ( not ( = ?auto_749345 ?auto_749346 ) ) ( not ( = ?auto_749345 ?auto_749347 ) ) ( not ( = ?auto_749346 ?auto_749347 ) ) ( ON ?auto_749345 ?auto_749346 ) ( ON ?auto_749344 ?auto_749345 ) ( ON ?auto_749343 ?auto_749344 ) ( ON ?auto_749342 ?auto_749343 ) ( ON ?auto_749341 ?auto_749342 ) ( ON ?auto_749340 ?auto_749341 ) ( ON ?auto_749339 ?auto_749340 ) ( CLEAR ?auto_749339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_749339 )
      ( MAKE-8PILE ?auto_749339 ?auto_749340 ?auto_749341 ?auto_749342 ?auto_749343 ?auto_749344 ?auto_749345 ?auto_749346 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749374 - BLOCK
      ?auto_749375 - BLOCK
      ?auto_749376 - BLOCK
      ?auto_749377 - BLOCK
      ?auto_749378 - BLOCK
      ?auto_749379 - BLOCK
      ?auto_749380 - BLOCK
      ?auto_749381 - BLOCK
      ?auto_749382 - BLOCK
    )
    :vars
    (
      ?auto_749383 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_749381 ) ( ON ?auto_749382 ?auto_749383 ) ( CLEAR ?auto_749382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_749374 ) ( ON ?auto_749375 ?auto_749374 ) ( ON ?auto_749376 ?auto_749375 ) ( ON ?auto_749377 ?auto_749376 ) ( ON ?auto_749378 ?auto_749377 ) ( ON ?auto_749379 ?auto_749378 ) ( ON ?auto_749380 ?auto_749379 ) ( ON ?auto_749381 ?auto_749380 ) ( not ( = ?auto_749374 ?auto_749375 ) ) ( not ( = ?auto_749374 ?auto_749376 ) ) ( not ( = ?auto_749374 ?auto_749377 ) ) ( not ( = ?auto_749374 ?auto_749378 ) ) ( not ( = ?auto_749374 ?auto_749379 ) ) ( not ( = ?auto_749374 ?auto_749380 ) ) ( not ( = ?auto_749374 ?auto_749381 ) ) ( not ( = ?auto_749374 ?auto_749382 ) ) ( not ( = ?auto_749374 ?auto_749383 ) ) ( not ( = ?auto_749375 ?auto_749376 ) ) ( not ( = ?auto_749375 ?auto_749377 ) ) ( not ( = ?auto_749375 ?auto_749378 ) ) ( not ( = ?auto_749375 ?auto_749379 ) ) ( not ( = ?auto_749375 ?auto_749380 ) ) ( not ( = ?auto_749375 ?auto_749381 ) ) ( not ( = ?auto_749375 ?auto_749382 ) ) ( not ( = ?auto_749375 ?auto_749383 ) ) ( not ( = ?auto_749376 ?auto_749377 ) ) ( not ( = ?auto_749376 ?auto_749378 ) ) ( not ( = ?auto_749376 ?auto_749379 ) ) ( not ( = ?auto_749376 ?auto_749380 ) ) ( not ( = ?auto_749376 ?auto_749381 ) ) ( not ( = ?auto_749376 ?auto_749382 ) ) ( not ( = ?auto_749376 ?auto_749383 ) ) ( not ( = ?auto_749377 ?auto_749378 ) ) ( not ( = ?auto_749377 ?auto_749379 ) ) ( not ( = ?auto_749377 ?auto_749380 ) ) ( not ( = ?auto_749377 ?auto_749381 ) ) ( not ( = ?auto_749377 ?auto_749382 ) ) ( not ( = ?auto_749377 ?auto_749383 ) ) ( not ( = ?auto_749378 ?auto_749379 ) ) ( not ( = ?auto_749378 ?auto_749380 ) ) ( not ( = ?auto_749378 ?auto_749381 ) ) ( not ( = ?auto_749378 ?auto_749382 ) ) ( not ( = ?auto_749378 ?auto_749383 ) ) ( not ( = ?auto_749379 ?auto_749380 ) ) ( not ( = ?auto_749379 ?auto_749381 ) ) ( not ( = ?auto_749379 ?auto_749382 ) ) ( not ( = ?auto_749379 ?auto_749383 ) ) ( not ( = ?auto_749380 ?auto_749381 ) ) ( not ( = ?auto_749380 ?auto_749382 ) ) ( not ( = ?auto_749380 ?auto_749383 ) ) ( not ( = ?auto_749381 ?auto_749382 ) ) ( not ( = ?auto_749381 ?auto_749383 ) ) ( not ( = ?auto_749382 ?auto_749383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_749382 ?auto_749383 )
      ( !STACK ?auto_749382 ?auto_749381 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749412 - BLOCK
      ?auto_749413 - BLOCK
      ?auto_749414 - BLOCK
      ?auto_749415 - BLOCK
      ?auto_749416 - BLOCK
      ?auto_749417 - BLOCK
      ?auto_749418 - BLOCK
      ?auto_749419 - BLOCK
      ?auto_749420 - BLOCK
    )
    :vars
    (
      ?auto_749421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749420 ?auto_749421 ) ( ON-TABLE ?auto_749412 ) ( ON ?auto_749413 ?auto_749412 ) ( ON ?auto_749414 ?auto_749413 ) ( ON ?auto_749415 ?auto_749414 ) ( ON ?auto_749416 ?auto_749415 ) ( ON ?auto_749417 ?auto_749416 ) ( ON ?auto_749418 ?auto_749417 ) ( not ( = ?auto_749412 ?auto_749413 ) ) ( not ( = ?auto_749412 ?auto_749414 ) ) ( not ( = ?auto_749412 ?auto_749415 ) ) ( not ( = ?auto_749412 ?auto_749416 ) ) ( not ( = ?auto_749412 ?auto_749417 ) ) ( not ( = ?auto_749412 ?auto_749418 ) ) ( not ( = ?auto_749412 ?auto_749419 ) ) ( not ( = ?auto_749412 ?auto_749420 ) ) ( not ( = ?auto_749412 ?auto_749421 ) ) ( not ( = ?auto_749413 ?auto_749414 ) ) ( not ( = ?auto_749413 ?auto_749415 ) ) ( not ( = ?auto_749413 ?auto_749416 ) ) ( not ( = ?auto_749413 ?auto_749417 ) ) ( not ( = ?auto_749413 ?auto_749418 ) ) ( not ( = ?auto_749413 ?auto_749419 ) ) ( not ( = ?auto_749413 ?auto_749420 ) ) ( not ( = ?auto_749413 ?auto_749421 ) ) ( not ( = ?auto_749414 ?auto_749415 ) ) ( not ( = ?auto_749414 ?auto_749416 ) ) ( not ( = ?auto_749414 ?auto_749417 ) ) ( not ( = ?auto_749414 ?auto_749418 ) ) ( not ( = ?auto_749414 ?auto_749419 ) ) ( not ( = ?auto_749414 ?auto_749420 ) ) ( not ( = ?auto_749414 ?auto_749421 ) ) ( not ( = ?auto_749415 ?auto_749416 ) ) ( not ( = ?auto_749415 ?auto_749417 ) ) ( not ( = ?auto_749415 ?auto_749418 ) ) ( not ( = ?auto_749415 ?auto_749419 ) ) ( not ( = ?auto_749415 ?auto_749420 ) ) ( not ( = ?auto_749415 ?auto_749421 ) ) ( not ( = ?auto_749416 ?auto_749417 ) ) ( not ( = ?auto_749416 ?auto_749418 ) ) ( not ( = ?auto_749416 ?auto_749419 ) ) ( not ( = ?auto_749416 ?auto_749420 ) ) ( not ( = ?auto_749416 ?auto_749421 ) ) ( not ( = ?auto_749417 ?auto_749418 ) ) ( not ( = ?auto_749417 ?auto_749419 ) ) ( not ( = ?auto_749417 ?auto_749420 ) ) ( not ( = ?auto_749417 ?auto_749421 ) ) ( not ( = ?auto_749418 ?auto_749419 ) ) ( not ( = ?auto_749418 ?auto_749420 ) ) ( not ( = ?auto_749418 ?auto_749421 ) ) ( not ( = ?auto_749419 ?auto_749420 ) ) ( not ( = ?auto_749419 ?auto_749421 ) ) ( not ( = ?auto_749420 ?auto_749421 ) ) ( CLEAR ?auto_749418 ) ( ON ?auto_749419 ?auto_749420 ) ( CLEAR ?auto_749419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_749412 ?auto_749413 ?auto_749414 ?auto_749415 ?auto_749416 ?auto_749417 ?auto_749418 ?auto_749419 )
      ( MAKE-9PILE ?auto_749412 ?auto_749413 ?auto_749414 ?auto_749415 ?auto_749416 ?auto_749417 ?auto_749418 ?auto_749419 ?auto_749420 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749450 - BLOCK
      ?auto_749451 - BLOCK
      ?auto_749452 - BLOCK
      ?auto_749453 - BLOCK
      ?auto_749454 - BLOCK
      ?auto_749455 - BLOCK
      ?auto_749456 - BLOCK
      ?auto_749457 - BLOCK
      ?auto_749458 - BLOCK
    )
    :vars
    (
      ?auto_749459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749458 ?auto_749459 ) ( ON-TABLE ?auto_749450 ) ( ON ?auto_749451 ?auto_749450 ) ( ON ?auto_749452 ?auto_749451 ) ( ON ?auto_749453 ?auto_749452 ) ( ON ?auto_749454 ?auto_749453 ) ( ON ?auto_749455 ?auto_749454 ) ( not ( = ?auto_749450 ?auto_749451 ) ) ( not ( = ?auto_749450 ?auto_749452 ) ) ( not ( = ?auto_749450 ?auto_749453 ) ) ( not ( = ?auto_749450 ?auto_749454 ) ) ( not ( = ?auto_749450 ?auto_749455 ) ) ( not ( = ?auto_749450 ?auto_749456 ) ) ( not ( = ?auto_749450 ?auto_749457 ) ) ( not ( = ?auto_749450 ?auto_749458 ) ) ( not ( = ?auto_749450 ?auto_749459 ) ) ( not ( = ?auto_749451 ?auto_749452 ) ) ( not ( = ?auto_749451 ?auto_749453 ) ) ( not ( = ?auto_749451 ?auto_749454 ) ) ( not ( = ?auto_749451 ?auto_749455 ) ) ( not ( = ?auto_749451 ?auto_749456 ) ) ( not ( = ?auto_749451 ?auto_749457 ) ) ( not ( = ?auto_749451 ?auto_749458 ) ) ( not ( = ?auto_749451 ?auto_749459 ) ) ( not ( = ?auto_749452 ?auto_749453 ) ) ( not ( = ?auto_749452 ?auto_749454 ) ) ( not ( = ?auto_749452 ?auto_749455 ) ) ( not ( = ?auto_749452 ?auto_749456 ) ) ( not ( = ?auto_749452 ?auto_749457 ) ) ( not ( = ?auto_749452 ?auto_749458 ) ) ( not ( = ?auto_749452 ?auto_749459 ) ) ( not ( = ?auto_749453 ?auto_749454 ) ) ( not ( = ?auto_749453 ?auto_749455 ) ) ( not ( = ?auto_749453 ?auto_749456 ) ) ( not ( = ?auto_749453 ?auto_749457 ) ) ( not ( = ?auto_749453 ?auto_749458 ) ) ( not ( = ?auto_749453 ?auto_749459 ) ) ( not ( = ?auto_749454 ?auto_749455 ) ) ( not ( = ?auto_749454 ?auto_749456 ) ) ( not ( = ?auto_749454 ?auto_749457 ) ) ( not ( = ?auto_749454 ?auto_749458 ) ) ( not ( = ?auto_749454 ?auto_749459 ) ) ( not ( = ?auto_749455 ?auto_749456 ) ) ( not ( = ?auto_749455 ?auto_749457 ) ) ( not ( = ?auto_749455 ?auto_749458 ) ) ( not ( = ?auto_749455 ?auto_749459 ) ) ( not ( = ?auto_749456 ?auto_749457 ) ) ( not ( = ?auto_749456 ?auto_749458 ) ) ( not ( = ?auto_749456 ?auto_749459 ) ) ( not ( = ?auto_749457 ?auto_749458 ) ) ( not ( = ?auto_749457 ?auto_749459 ) ) ( not ( = ?auto_749458 ?auto_749459 ) ) ( ON ?auto_749457 ?auto_749458 ) ( CLEAR ?auto_749455 ) ( ON ?auto_749456 ?auto_749457 ) ( CLEAR ?auto_749456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_749450 ?auto_749451 ?auto_749452 ?auto_749453 ?auto_749454 ?auto_749455 ?auto_749456 )
      ( MAKE-9PILE ?auto_749450 ?auto_749451 ?auto_749452 ?auto_749453 ?auto_749454 ?auto_749455 ?auto_749456 ?auto_749457 ?auto_749458 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749488 - BLOCK
      ?auto_749489 - BLOCK
      ?auto_749490 - BLOCK
      ?auto_749491 - BLOCK
      ?auto_749492 - BLOCK
      ?auto_749493 - BLOCK
      ?auto_749494 - BLOCK
      ?auto_749495 - BLOCK
      ?auto_749496 - BLOCK
    )
    :vars
    (
      ?auto_749497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749496 ?auto_749497 ) ( ON-TABLE ?auto_749488 ) ( ON ?auto_749489 ?auto_749488 ) ( ON ?auto_749490 ?auto_749489 ) ( ON ?auto_749491 ?auto_749490 ) ( ON ?auto_749492 ?auto_749491 ) ( not ( = ?auto_749488 ?auto_749489 ) ) ( not ( = ?auto_749488 ?auto_749490 ) ) ( not ( = ?auto_749488 ?auto_749491 ) ) ( not ( = ?auto_749488 ?auto_749492 ) ) ( not ( = ?auto_749488 ?auto_749493 ) ) ( not ( = ?auto_749488 ?auto_749494 ) ) ( not ( = ?auto_749488 ?auto_749495 ) ) ( not ( = ?auto_749488 ?auto_749496 ) ) ( not ( = ?auto_749488 ?auto_749497 ) ) ( not ( = ?auto_749489 ?auto_749490 ) ) ( not ( = ?auto_749489 ?auto_749491 ) ) ( not ( = ?auto_749489 ?auto_749492 ) ) ( not ( = ?auto_749489 ?auto_749493 ) ) ( not ( = ?auto_749489 ?auto_749494 ) ) ( not ( = ?auto_749489 ?auto_749495 ) ) ( not ( = ?auto_749489 ?auto_749496 ) ) ( not ( = ?auto_749489 ?auto_749497 ) ) ( not ( = ?auto_749490 ?auto_749491 ) ) ( not ( = ?auto_749490 ?auto_749492 ) ) ( not ( = ?auto_749490 ?auto_749493 ) ) ( not ( = ?auto_749490 ?auto_749494 ) ) ( not ( = ?auto_749490 ?auto_749495 ) ) ( not ( = ?auto_749490 ?auto_749496 ) ) ( not ( = ?auto_749490 ?auto_749497 ) ) ( not ( = ?auto_749491 ?auto_749492 ) ) ( not ( = ?auto_749491 ?auto_749493 ) ) ( not ( = ?auto_749491 ?auto_749494 ) ) ( not ( = ?auto_749491 ?auto_749495 ) ) ( not ( = ?auto_749491 ?auto_749496 ) ) ( not ( = ?auto_749491 ?auto_749497 ) ) ( not ( = ?auto_749492 ?auto_749493 ) ) ( not ( = ?auto_749492 ?auto_749494 ) ) ( not ( = ?auto_749492 ?auto_749495 ) ) ( not ( = ?auto_749492 ?auto_749496 ) ) ( not ( = ?auto_749492 ?auto_749497 ) ) ( not ( = ?auto_749493 ?auto_749494 ) ) ( not ( = ?auto_749493 ?auto_749495 ) ) ( not ( = ?auto_749493 ?auto_749496 ) ) ( not ( = ?auto_749493 ?auto_749497 ) ) ( not ( = ?auto_749494 ?auto_749495 ) ) ( not ( = ?auto_749494 ?auto_749496 ) ) ( not ( = ?auto_749494 ?auto_749497 ) ) ( not ( = ?auto_749495 ?auto_749496 ) ) ( not ( = ?auto_749495 ?auto_749497 ) ) ( not ( = ?auto_749496 ?auto_749497 ) ) ( ON ?auto_749495 ?auto_749496 ) ( ON ?auto_749494 ?auto_749495 ) ( CLEAR ?auto_749492 ) ( ON ?auto_749493 ?auto_749494 ) ( CLEAR ?auto_749493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_749488 ?auto_749489 ?auto_749490 ?auto_749491 ?auto_749492 ?auto_749493 )
      ( MAKE-9PILE ?auto_749488 ?auto_749489 ?auto_749490 ?auto_749491 ?auto_749492 ?auto_749493 ?auto_749494 ?auto_749495 ?auto_749496 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749526 - BLOCK
      ?auto_749527 - BLOCK
      ?auto_749528 - BLOCK
      ?auto_749529 - BLOCK
      ?auto_749530 - BLOCK
      ?auto_749531 - BLOCK
      ?auto_749532 - BLOCK
      ?auto_749533 - BLOCK
      ?auto_749534 - BLOCK
    )
    :vars
    (
      ?auto_749535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749534 ?auto_749535 ) ( ON-TABLE ?auto_749526 ) ( ON ?auto_749527 ?auto_749526 ) ( ON ?auto_749528 ?auto_749527 ) ( ON ?auto_749529 ?auto_749528 ) ( not ( = ?auto_749526 ?auto_749527 ) ) ( not ( = ?auto_749526 ?auto_749528 ) ) ( not ( = ?auto_749526 ?auto_749529 ) ) ( not ( = ?auto_749526 ?auto_749530 ) ) ( not ( = ?auto_749526 ?auto_749531 ) ) ( not ( = ?auto_749526 ?auto_749532 ) ) ( not ( = ?auto_749526 ?auto_749533 ) ) ( not ( = ?auto_749526 ?auto_749534 ) ) ( not ( = ?auto_749526 ?auto_749535 ) ) ( not ( = ?auto_749527 ?auto_749528 ) ) ( not ( = ?auto_749527 ?auto_749529 ) ) ( not ( = ?auto_749527 ?auto_749530 ) ) ( not ( = ?auto_749527 ?auto_749531 ) ) ( not ( = ?auto_749527 ?auto_749532 ) ) ( not ( = ?auto_749527 ?auto_749533 ) ) ( not ( = ?auto_749527 ?auto_749534 ) ) ( not ( = ?auto_749527 ?auto_749535 ) ) ( not ( = ?auto_749528 ?auto_749529 ) ) ( not ( = ?auto_749528 ?auto_749530 ) ) ( not ( = ?auto_749528 ?auto_749531 ) ) ( not ( = ?auto_749528 ?auto_749532 ) ) ( not ( = ?auto_749528 ?auto_749533 ) ) ( not ( = ?auto_749528 ?auto_749534 ) ) ( not ( = ?auto_749528 ?auto_749535 ) ) ( not ( = ?auto_749529 ?auto_749530 ) ) ( not ( = ?auto_749529 ?auto_749531 ) ) ( not ( = ?auto_749529 ?auto_749532 ) ) ( not ( = ?auto_749529 ?auto_749533 ) ) ( not ( = ?auto_749529 ?auto_749534 ) ) ( not ( = ?auto_749529 ?auto_749535 ) ) ( not ( = ?auto_749530 ?auto_749531 ) ) ( not ( = ?auto_749530 ?auto_749532 ) ) ( not ( = ?auto_749530 ?auto_749533 ) ) ( not ( = ?auto_749530 ?auto_749534 ) ) ( not ( = ?auto_749530 ?auto_749535 ) ) ( not ( = ?auto_749531 ?auto_749532 ) ) ( not ( = ?auto_749531 ?auto_749533 ) ) ( not ( = ?auto_749531 ?auto_749534 ) ) ( not ( = ?auto_749531 ?auto_749535 ) ) ( not ( = ?auto_749532 ?auto_749533 ) ) ( not ( = ?auto_749532 ?auto_749534 ) ) ( not ( = ?auto_749532 ?auto_749535 ) ) ( not ( = ?auto_749533 ?auto_749534 ) ) ( not ( = ?auto_749533 ?auto_749535 ) ) ( not ( = ?auto_749534 ?auto_749535 ) ) ( ON ?auto_749533 ?auto_749534 ) ( ON ?auto_749532 ?auto_749533 ) ( ON ?auto_749531 ?auto_749532 ) ( CLEAR ?auto_749529 ) ( ON ?auto_749530 ?auto_749531 ) ( CLEAR ?auto_749530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_749526 ?auto_749527 ?auto_749528 ?auto_749529 ?auto_749530 )
      ( MAKE-9PILE ?auto_749526 ?auto_749527 ?auto_749528 ?auto_749529 ?auto_749530 ?auto_749531 ?auto_749532 ?auto_749533 ?auto_749534 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749564 - BLOCK
      ?auto_749565 - BLOCK
      ?auto_749566 - BLOCK
      ?auto_749567 - BLOCK
      ?auto_749568 - BLOCK
      ?auto_749569 - BLOCK
      ?auto_749570 - BLOCK
      ?auto_749571 - BLOCK
      ?auto_749572 - BLOCK
    )
    :vars
    (
      ?auto_749573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749572 ?auto_749573 ) ( ON-TABLE ?auto_749564 ) ( ON ?auto_749565 ?auto_749564 ) ( ON ?auto_749566 ?auto_749565 ) ( not ( = ?auto_749564 ?auto_749565 ) ) ( not ( = ?auto_749564 ?auto_749566 ) ) ( not ( = ?auto_749564 ?auto_749567 ) ) ( not ( = ?auto_749564 ?auto_749568 ) ) ( not ( = ?auto_749564 ?auto_749569 ) ) ( not ( = ?auto_749564 ?auto_749570 ) ) ( not ( = ?auto_749564 ?auto_749571 ) ) ( not ( = ?auto_749564 ?auto_749572 ) ) ( not ( = ?auto_749564 ?auto_749573 ) ) ( not ( = ?auto_749565 ?auto_749566 ) ) ( not ( = ?auto_749565 ?auto_749567 ) ) ( not ( = ?auto_749565 ?auto_749568 ) ) ( not ( = ?auto_749565 ?auto_749569 ) ) ( not ( = ?auto_749565 ?auto_749570 ) ) ( not ( = ?auto_749565 ?auto_749571 ) ) ( not ( = ?auto_749565 ?auto_749572 ) ) ( not ( = ?auto_749565 ?auto_749573 ) ) ( not ( = ?auto_749566 ?auto_749567 ) ) ( not ( = ?auto_749566 ?auto_749568 ) ) ( not ( = ?auto_749566 ?auto_749569 ) ) ( not ( = ?auto_749566 ?auto_749570 ) ) ( not ( = ?auto_749566 ?auto_749571 ) ) ( not ( = ?auto_749566 ?auto_749572 ) ) ( not ( = ?auto_749566 ?auto_749573 ) ) ( not ( = ?auto_749567 ?auto_749568 ) ) ( not ( = ?auto_749567 ?auto_749569 ) ) ( not ( = ?auto_749567 ?auto_749570 ) ) ( not ( = ?auto_749567 ?auto_749571 ) ) ( not ( = ?auto_749567 ?auto_749572 ) ) ( not ( = ?auto_749567 ?auto_749573 ) ) ( not ( = ?auto_749568 ?auto_749569 ) ) ( not ( = ?auto_749568 ?auto_749570 ) ) ( not ( = ?auto_749568 ?auto_749571 ) ) ( not ( = ?auto_749568 ?auto_749572 ) ) ( not ( = ?auto_749568 ?auto_749573 ) ) ( not ( = ?auto_749569 ?auto_749570 ) ) ( not ( = ?auto_749569 ?auto_749571 ) ) ( not ( = ?auto_749569 ?auto_749572 ) ) ( not ( = ?auto_749569 ?auto_749573 ) ) ( not ( = ?auto_749570 ?auto_749571 ) ) ( not ( = ?auto_749570 ?auto_749572 ) ) ( not ( = ?auto_749570 ?auto_749573 ) ) ( not ( = ?auto_749571 ?auto_749572 ) ) ( not ( = ?auto_749571 ?auto_749573 ) ) ( not ( = ?auto_749572 ?auto_749573 ) ) ( ON ?auto_749571 ?auto_749572 ) ( ON ?auto_749570 ?auto_749571 ) ( ON ?auto_749569 ?auto_749570 ) ( ON ?auto_749568 ?auto_749569 ) ( CLEAR ?auto_749566 ) ( ON ?auto_749567 ?auto_749568 ) ( CLEAR ?auto_749567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_749564 ?auto_749565 ?auto_749566 ?auto_749567 )
      ( MAKE-9PILE ?auto_749564 ?auto_749565 ?auto_749566 ?auto_749567 ?auto_749568 ?auto_749569 ?auto_749570 ?auto_749571 ?auto_749572 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749602 - BLOCK
      ?auto_749603 - BLOCK
      ?auto_749604 - BLOCK
      ?auto_749605 - BLOCK
      ?auto_749606 - BLOCK
      ?auto_749607 - BLOCK
      ?auto_749608 - BLOCK
      ?auto_749609 - BLOCK
      ?auto_749610 - BLOCK
    )
    :vars
    (
      ?auto_749611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749610 ?auto_749611 ) ( ON-TABLE ?auto_749602 ) ( ON ?auto_749603 ?auto_749602 ) ( not ( = ?auto_749602 ?auto_749603 ) ) ( not ( = ?auto_749602 ?auto_749604 ) ) ( not ( = ?auto_749602 ?auto_749605 ) ) ( not ( = ?auto_749602 ?auto_749606 ) ) ( not ( = ?auto_749602 ?auto_749607 ) ) ( not ( = ?auto_749602 ?auto_749608 ) ) ( not ( = ?auto_749602 ?auto_749609 ) ) ( not ( = ?auto_749602 ?auto_749610 ) ) ( not ( = ?auto_749602 ?auto_749611 ) ) ( not ( = ?auto_749603 ?auto_749604 ) ) ( not ( = ?auto_749603 ?auto_749605 ) ) ( not ( = ?auto_749603 ?auto_749606 ) ) ( not ( = ?auto_749603 ?auto_749607 ) ) ( not ( = ?auto_749603 ?auto_749608 ) ) ( not ( = ?auto_749603 ?auto_749609 ) ) ( not ( = ?auto_749603 ?auto_749610 ) ) ( not ( = ?auto_749603 ?auto_749611 ) ) ( not ( = ?auto_749604 ?auto_749605 ) ) ( not ( = ?auto_749604 ?auto_749606 ) ) ( not ( = ?auto_749604 ?auto_749607 ) ) ( not ( = ?auto_749604 ?auto_749608 ) ) ( not ( = ?auto_749604 ?auto_749609 ) ) ( not ( = ?auto_749604 ?auto_749610 ) ) ( not ( = ?auto_749604 ?auto_749611 ) ) ( not ( = ?auto_749605 ?auto_749606 ) ) ( not ( = ?auto_749605 ?auto_749607 ) ) ( not ( = ?auto_749605 ?auto_749608 ) ) ( not ( = ?auto_749605 ?auto_749609 ) ) ( not ( = ?auto_749605 ?auto_749610 ) ) ( not ( = ?auto_749605 ?auto_749611 ) ) ( not ( = ?auto_749606 ?auto_749607 ) ) ( not ( = ?auto_749606 ?auto_749608 ) ) ( not ( = ?auto_749606 ?auto_749609 ) ) ( not ( = ?auto_749606 ?auto_749610 ) ) ( not ( = ?auto_749606 ?auto_749611 ) ) ( not ( = ?auto_749607 ?auto_749608 ) ) ( not ( = ?auto_749607 ?auto_749609 ) ) ( not ( = ?auto_749607 ?auto_749610 ) ) ( not ( = ?auto_749607 ?auto_749611 ) ) ( not ( = ?auto_749608 ?auto_749609 ) ) ( not ( = ?auto_749608 ?auto_749610 ) ) ( not ( = ?auto_749608 ?auto_749611 ) ) ( not ( = ?auto_749609 ?auto_749610 ) ) ( not ( = ?auto_749609 ?auto_749611 ) ) ( not ( = ?auto_749610 ?auto_749611 ) ) ( ON ?auto_749609 ?auto_749610 ) ( ON ?auto_749608 ?auto_749609 ) ( ON ?auto_749607 ?auto_749608 ) ( ON ?auto_749606 ?auto_749607 ) ( ON ?auto_749605 ?auto_749606 ) ( CLEAR ?auto_749603 ) ( ON ?auto_749604 ?auto_749605 ) ( CLEAR ?auto_749604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_749602 ?auto_749603 ?auto_749604 )
      ( MAKE-9PILE ?auto_749602 ?auto_749603 ?auto_749604 ?auto_749605 ?auto_749606 ?auto_749607 ?auto_749608 ?auto_749609 ?auto_749610 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749640 - BLOCK
      ?auto_749641 - BLOCK
      ?auto_749642 - BLOCK
      ?auto_749643 - BLOCK
      ?auto_749644 - BLOCK
      ?auto_749645 - BLOCK
      ?auto_749646 - BLOCK
      ?auto_749647 - BLOCK
      ?auto_749648 - BLOCK
    )
    :vars
    (
      ?auto_749649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749648 ?auto_749649 ) ( ON-TABLE ?auto_749640 ) ( not ( = ?auto_749640 ?auto_749641 ) ) ( not ( = ?auto_749640 ?auto_749642 ) ) ( not ( = ?auto_749640 ?auto_749643 ) ) ( not ( = ?auto_749640 ?auto_749644 ) ) ( not ( = ?auto_749640 ?auto_749645 ) ) ( not ( = ?auto_749640 ?auto_749646 ) ) ( not ( = ?auto_749640 ?auto_749647 ) ) ( not ( = ?auto_749640 ?auto_749648 ) ) ( not ( = ?auto_749640 ?auto_749649 ) ) ( not ( = ?auto_749641 ?auto_749642 ) ) ( not ( = ?auto_749641 ?auto_749643 ) ) ( not ( = ?auto_749641 ?auto_749644 ) ) ( not ( = ?auto_749641 ?auto_749645 ) ) ( not ( = ?auto_749641 ?auto_749646 ) ) ( not ( = ?auto_749641 ?auto_749647 ) ) ( not ( = ?auto_749641 ?auto_749648 ) ) ( not ( = ?auto_749641 ?auto_749649 ) ) ( not ( = ?auto_749642 ?auto_749643 ) ) ( not ( = ?auto_749642 ?auto_749644 ) ) ( not ( = ?auto_749642 ?auto_749645 ) ) ( not ( = ?auto_749642 ?auto_749646 ) ) ( not ( = ?auto_749642 ?auto_749647 ) ) ( not ( = ?auto_749642 ?auto_749648 ) ) ( not ( = ?auto_749642 ?auto_749649 ) ) ( not ( = ?auto_749643 ?auto_749644 ) ) ( not ( = ?auto_749643 ?auto_749645 ) ) ( not ( = ?auto_749643 ?auto_749646 ) ) ( not ( = ?auto_749643 ?auto_749647 ) ) ( not ( = ?auto_749643 ?auto_749648 ) ) ( not ( = ?auto_749643 ?auto_749649 ) ) ( not ( = ?auto_749644 ?auto_749645 ) ) ( not ( = ?auto_749644 ?auto_749646 ) ) ( not ( = ?auto_749644 ?auto_749647 ) ) ( not ( = ?auto_749644 ?auto_749648 ) ) ( not ( = ?auto_749644 ?auto_749649 ) ) ( not ( = ?auto_749645 ?auto_749646 ) ) ( not ( = ?auto_749645 ?auto_749647 ) ) ( not ( = ?auto_749645 ?auto_749648 ) ) ( not ( = ?auto_749645 ?auto_749649 ) ) ( not ( = ?auto_749646 ?auto_749647 ) ) ( not ( = ?auto_749646 ?auto_749648 ) ) ( not ( = ?auto_749646 ?auto_749649 ) ) ( not ( = ?auto_749647 ?auto_749648 ) ) ( not ( = ?auto_749647 ?auto_749649 ) ) ( not ( = ?auto_749648 ?auto_749649 ) ) ( ON ?auto_749647 ?auto_749648 ) ( ON ?auto_749646 ?auto_749647 ) ( ON ?auto_749645 ?auto_749646 ) ( ON ?auto_749644 ?auto_749645 ) ( ON ?auto_749643 ?auto_749644 ) ( ON ?auto_749642 ?auto_749643 ) ( CLEAR ?auto_749640 ) ( ON ?auto_749641 ?auto_749642 ) ( CLEAR ?auto_749641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_749640 ?auto_749641 )
      ( MAKE-9PILE ?auto_749640 ?auto_749641 ?auto_749642 ?auto_749643 ?auto_749644 ?auto_749645 ?auto_749646 ?auto_749647 ?auto_749648 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_749678 - BLOCK
      ?auto_749679 - BLOCK
      ?auto_749680 - BLOCK
      ?auto_749681 - BLOCK
      ?auto_749682 - BLOCK
      ?auto_749683 - BLOCK
      ?auto_749684 - BLOCK
      ?auto_749685 - BLOCK
      ?auto_749686 - BLOCK
    )
    :vars
    (
      ?auto_749687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749686 ?auto_749687 ) ( not ( = ?auto_749678 ?auto_749679 ) ) ( not ( = ?auto_749678 ?auto_749680 ) ) ( not ( = ?auto_749678 ?auto_749681 ) ) ( not ( = ?auto_749678 ?auto_749682 ) ) ( not ( = ?auto_749678 ?auto_749683 ) ) ( not ( = ?auto_749678 ?auto_749684 ) ) ( not ( = ?auto_749678 ?auto_749685 ) ) ( not ( = ?auto_749678 ?auto_749686 ) ) ( not ( = ?auto_749678 ?auto_749687 ) ) ( not ( = ?auto_749679 ?auto_749680 ) ) ( not ( = ?auto_749679 ?auto_749681 ) ) ( not ( = ?auto_749679 ?auto_749682 ) ) ( not ( = ?auto_749679 ?auto_749683 ) ) ( not ( = ?auto_749679 ?auto_749684 ) ) ( not ( = ?auto_749679 ?auto_749685 ) ) ( not ( = ?auto_749679 ?auto_749686 ) ) ( not ( = ?auto_749679 ?auto_749687 ) ) ( not ( = ?auto_749680 ?auto_749681 ) ) ( not ( = ?auto_749680 ?auto_749682 ) ) ( not ( = ?auto_749680 ?auto_749683 ) ) ( not ( = ?auto_749680 ?auto_749684 ) ) ( not ( = ?auto_749680 ?auto_749685 ) ) ( not ( = ?auto_749680 ?auto_749686 ) ) ( not ( = ?auto_749680 ?auto_749687 ) ) ( not ( = ?auto_749681 ?auto_749682 ) ) ( not ( = ?auto_749681 ?auto_749683 ) ) ( not ( = ?auto_749681 ?auto_749684 ) ) ( not ( = ?auto_749681 ?auto_749685 ) ) ( not ( = ?auto_749681 ?auto_749686 ) ) ( not ( = ?auto_749681 ?auto_749687 ) ) ( not ( = ?auto_749682 ?auto_749683 ) ) ( not ( = ?auto_749682 ?auto_749684 ) ) ( not ( = ?auto_749682 ?auto_749685 ) ) ( not ( = ?auto_749682 ?auto_749686 ) ) ( not ( = ?auto_749682 ?auto_749687 ) ) ( not ( = ?auto_749683 ?auto_749684 ) ) ( not ( = ?auto_749683 ?auto_749685 ) ) ( not ( = ?auto_749683 ?auto_749686 ) ) ( not ( = ?auto_749683 ?auto_749687 ) ) ( not ( = ?auto_749684 ?auto_749685 ) ) ( not ( = ?auto_749684 ?auto_749686 ) ) ( not ( = ?auto_749684 ?auto_749687 ) ) ( not ( = ?auto_749685 ?auto_749686 ) ) ( not ( = ?auto_749685 ?auto_749687 ) ) ( not ( = ?auto_749686 ?auto_749687 ) ) ( ON ?auto_749685 ?auto_749686 ) ( ON ?auto_749684 ?auto_749685 ) ( ON ?auto_749683 ?auto_749684 ) ( ON ?auto_749682 ?auto_749683 ) ( ON ?auto_749681 ?auto_749682 ) ( ON ?auto_749680 ?auto_749681 ) ( ON ?auto_749679 ?auto_749680 ) ( ON ?auto_749678 ?auto_749679 ) ( CLEAR ?auto_749678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_749678 )
      ( MAKE-9PILE ?auto_749678 ?auto_749679 ?auto_749680 ?auto_749681 ?auto_749682 ?auto_749683 ?auto_749684 ?auto_749685 ?auto_749686 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_749717 - BLOCK
      ?auto_749718 - BLOCK
      ?auto_749719 - BLOCK
      ?auto_749720 - BLOCK
      ?auto_749721 - BLOCK
      ?auto_749722 - BLOCK
      ?auto_749723 - BLOCK
      ?auto_749724 - BLOCK
      ?auto_749725 - BLOCK
      ?auto_749726 - BLOCK
    )
    :vars
    (
      ?auto_749727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_749725 ) ( ON ?auto_749726 ?auto_749727 ) ( CLEAR ?auto_749726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_749717 ) ( ON ?auto_749718 ?auto_749717 ) ( ON ?auto_749719 ?auto_749718 ) ( ON ?auto_749720 ?auto_749719 ) ( ON ?auto_749721 ?auto_749720 ) ( ON ?auto_749722 ?auto_749721 ) ( ON ?auto_749723 ?auto_749722 ) ( ON ?auto_749724 ?auto_749723 ) ( ON ?auto_749725 ?auto_749724 ) ( not ( = ?auto_749717 ?auto_749718 ) ) ( not ( = ?auto_749717 ?auto_749719 ) ) ( not ( = ?auto_749717 ?auto_749720 ) ) ( not ( = ?auto_749717 ?auto_749721 ) ) ( not ( = ?auto_749717 ?auto_749722 ) ) ( not ( = ?auto_749717 ?auto_749723 ) ) ( not ( = ?auto_749717 ?auto_749724 ) ) ( not ( = ?auto_749717 ?auto_749725 ) ) ( not ( = ?auto_749717 ?auto_749726 ) ) ( not ( = ?auto_749717 ?auto_749727 ) ) ( not ( = ?auto_749718 ?auto_749719 ) ) ( not ( = ?auto_749718 ?auto_749720 ) ) ( not ( = ?auto_749718 ?auto_749721 ) ) ( not ( = ?auto_749718 ?auto_749722 ) ) ( not ( = ?auto_749718 ?auto_749723 ) ) ( not ( = ?auto_749718 ?auto_749724 ) ) ( not ( = ?auto_749718 ?auto_749725 ) ) ( not ( = ?auto_749718 ?auto_749726 ) ) ( not ( = ?auto_749718 ?auto_749727 ) ) ( not ( = ?auto_749719 ?auto_749720 ) ) ( not ( = ?auto_749719 ?auto_749721 ) ) ( not ( = ?auto_749719 ?auto_749722 ) ) ( not ( = ?auto_749719 ?auto_749723 ) ) ( not ( = ?auto_749719 ?auto_749724 ) ) ( not ( = ?auto_749719 ?auto_749725 ) ) ( not ( = ?auto_749719 ?auto_749726 ) ) ( not ( = ?auto_749719 ?auto_749727 ) ) ( not ( = ?auto_749720 ?auto_749721 ) ) ( not ( = ?auto_749720 ?auto_749722 ) ) ( not ( = ?auto_749720 ?auto_749723 ) ) ( not ( = ?auto_749720 ?auto_749724 ) ) ( not ( = ?auto_749720 ?auto_749725 ) ) ( not ( = ?auto_749720 ?auto_749726 ) ) ( not ( = ?auto_749720 ?auto_749727 ) ) ( not ( = ?auto_749721 ?auto_749722 ) ) ( not ( = ?auto_749721 ?auto_749723 ) ) ( not ( = ?auto_749721 ?auto_749724 ) ) ( not ( = ?auto_749721 ?auto_749725 ) ) ( not ( = ?auto_749721 ?auto_749726 ) ) ( not ( = ?auto_749721 ?auto_749727 ) ) ( not ( = ?auto_749722 ?auto_749723 ) ) ( not ( = ?auto_749722 ?auto_749724 ) ) ( not ( = ?auto_749722 ?auto_749725 ) ) ( not ( = ?auto_749722 ?auto_749726 ) ) ( not ( = ?auto_749722 ?auto_749727 ) ) ( not ( = ?auto_749723 ?auto_749724 ) ) ( not ( = ?auto_749723 ?auto_749725 ) ) ( not ( = ?auto_749723 ?auto_749726 ) ) ( not ( = ?auto_749723 ?auto_749727 ) ) ( not ( = ?auto_749724 ?auto_749725 ) ) ( not ( = ?auto_749724 ?auto_749726 ) ) ( not ( = ?auto_749724 ?auto_749727 ) ) ( not ( = ?auto_749725 ?auto_749726 ) ) ( not ( = ?auto_749725 ?auto_749727 ) ) ( not ( = ?auto_749726 ?auto_749727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_749726 ?auto_749727 )
      ( !STACK ?auto_749726 ?auto_749725 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_749759 - BLOCK
      ?auto_749760 - BLOCK
      ?auto_749761 - BLOCK
      ?auto_749762 - BLOCK
      ?auto_749763 - BLOCK
      ?auto_749764 - BLOCK
      ?auto_749765 - BLOCK
      ?auto_749766 - BLOCK
      ?auto_749767 - BLOCK
      ?auto_749768 - BLOCK
    )
    :vars
    (
      ?auto_749769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749768 ?auto_749769 ) ( ON-TABLE ?auto_749759 ) ( ON ?auto_749760 ?auto_749759 ) ( ON ?auto_749761 ?auto_749760 ) ( ON ?auto_749762 ?auto_749761 ) ( ON ?auto_749763 ?auto_749762 ) ( ON ?auto_749764 ?auto_749763 ) ( ON ?auto_749765 ?auto_749764 ) ( ON ?auto_749766 ?auto_749765 ) ( not ( = ?auto_749759 ?auto_749760 ) ) ( not ( = ?auto_749759 ?auto_749761 ) ) ( not ( = ?auto_749759 ?auto_749762 ) ) ( not ( = ?auto_749759 ?auto_749763 ) ) ( not ( = ?auto_749759 ?auto_749764 ) ) ( not ( = ?auto_749759 ?auto_749765 ) ) ( not ( = ?auto_749759 ?auto_749766 ) ) ( not ( = ?auto_749759 ?auto_749767 ) ) ( not ( = ?auto_749759 ?auto_749768 ) ) ( not ( = ?auto_749759 ?auto_749769 ) ) ( not ( = ?auto_749760 ?auto_749761 ) ) ( not ( = ?auto_749760 ?auto_749762 ) ) ( not ( = ?auto_749760 ?auto_749763 ) ) ( not ( = ?auto_749760 ?auto_749764 ) ) ( not ( = ?auto_749760 ?auto_749765 ) ) ( not ( = ?auto_749760 ?auto_749766 ) ) ( not ( = ?auto_749760 ?auto_749767 ) ) ( not ( = ?auto_749760 ?auto_749768 ) ) ( not ( = ?auto_749760 ?auto_749769 ) ) ( not ( = ?auto_749761 ?auto_749762 ) ) ( not ( = ?auto_749761 ?auto_749763 ) ) ( not ( = ?auto_749761 ?auto_749764 ) ) ( not ( = ?auto_749761 ?auto_749765 ) ) ( not ( = ?auto_749761 ?auto_749766 ) ) ( not ( = ?auto_749761 ?auto_749767 ) ) ( not ( = ?auto_749761 ?auto_749768 ) ) ( not ( = ?auto_749761 ?auto_749769 ) ) ( not ( = ?auto_749762 ?auto_749763 ) ) ( not ( = ?auto_749762 ?auto_749764 ) ) ( not ( = ?auto_749762 ?auto_749765 ) ) ( not ( = ?auto_749762 ?auto_749766 ) ) ( not ( = ?auto_749762 ?auto_749767 ) ) ( not ( = ?auto_749762 ?auto_749768 ) ) ( not ( = ?auto_749762 ?auto_749769 ) ) ( not ( = ?auto_749763 ?auto_749764 ) ) ( not ( = ?auto_749763 ?auto_749765 ) ) ( not ( = ?auto_749763 ?auto_749766 ) ) ( not ( = ?auto_749763 ?auto_749767 ) ) ( not ( = ?auto_749763 ?auto_749768 ) ) ( not ( = ?auto_749763 ?auto_749769 ) ) ( not ( = ?auto_749764 ?auto_749765 ) ) ( not ( = ?auto_749764 ?auto_749766 ) ) ( not ( = ?auto_749764 ?auto_749767 ) ) ( not ( = ?auto_749764 ?auto_749768 ) ) ( not ( = ?auto_749764 ?auto_749769 ) ) ( not ( = ?auto_749765 ?auto_749766 ) ) ( not ( = ?auto_749765 ?auto_749767 ) ) ( not ( = ?auto_749765 ?auto_749768 ) ) ( not ( = ?auto_749765 ?auto_749769 ) ) ( not ( = ?auto_749766 ?auto_749767 ) ) ( not ( = ?auto_749766 ?auto_749768 ) ) ( not ( = ?auto_749766 ?auto_749769 ) ) ( not ( = ?auto_749767 ?auto_749768 ) ) ( not ( = ?auto_749767 ?auto_749769 ) ) ( not ( = ?auto_749768 ?auto_749769 ) ) ( CLEAR ?auto_749766 ) ( ON ?auto_749767 ?auto_749768 ) ( CLEAR ?auto_749767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_749759 ?auto_749760 ?auto_749761 ?auto_749762 ?auto_749763 ?auto_749764 ?auto_749765 ?auto_749766 ?auto_749767 )
      ( MAKE-10PILE ?auto_749759 ?auto_749760 ?auto_749761 ?auto_749762 ?auto_749763 ?auto_749764 ?auto_749765 ?auto_749766 ?auto_749767 ?auto_749768 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_749801 - BLOCK
      ?auto_749802 - BLOCK
      ?auto_749803 - BLOCK
      ?auto_749804 - BLOCK
      ?auto_749805 - BLOCK
      ?auto_749806 - BLOCK
      ?auto_749807 - BLOCK
      ?auto_749808 - BLOCK
      ?auto_749809 - BLOCK
      ?auto_749810 - BLOCK
    )
    :vars
    (
      ?auto_749811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749810 ?auto_749811 ) ( ON-TABLE ?auto_749801 ) ( ON ?auto_749802 ?auto_749801 ) ( ON ?auto_749803 ?auto_749802 ) ( ON ?auto_749804 ?auto_749803 ) ( ON ?auto_749805 ?auto_749804 ) ( ON ?auto_749806 ?auto_749805 ) ( ON ?auto_749807 ?auto_749806 ) ( not ( = ?auto_749801 ?auto_749802 ) ) ( not ( = ?auto_749801 ?auto_749803 ) ) ( not ( = ?auto_749801 ?auto_749804 ) ) ( not ( = ?auto_749801 ?auto_749805 ) ) ( not ( = ?auto_749801 ?auto_749806 ) ) ( not ( = ?auto_749801 ?auto_749807 ) ) ( not ( = ?auto_749801 ?auto_749808 ) ) ( not ( = ?auto_749801 ?auto_749809 ) ) ( not ( = ?auto_749801 ?auto_749810 ) ) ( not ( = ?auto_749801 ?auto_749811 ) ) ( not ( = ?auto_749802 ?auto_749803 ) ) ( not ( = ?auto_749802 ?auto_749804 ) ) ( not ( = ?auto_749802 ?auto_749805 ) ) ( not ( = ?auto_749802 ?auto_749806 ) ) ( not ( = ?auto_749802 ?auto_749807 ) ) ( not ( = ?auto_749802 ?auto_749808 ) ) ( not ( = ?auto_749802 ?auto_749809 ) ) ( not ( = ?auto_749802 ?auto_749810 ) ) ( not ( = ?auto_749802 ?auto_749811 ) ) ( not ( = ?auto_749803 ?auto_749804 ) ) ( not ( = ?auto_749803 ?auto_749805 ) ) ( not ( = ?auto_749803 ?auto_749806 ) ) ( not ( = ?auto_749803 ?auto_749807 ) ) ( not ( = ?auto_749803 ?auto_749808 ) ) ( not ( = ?auto_749803 ?auto_749809 ) ) ( not ( = ?auto_749803 ?auto_749810 ) ) ( not ( = ?auto_749803 ?auto_749811 ) ) ( not ( = ?auto_749804 ?auto_749805 ) ) ( not ( = ?auto_749804 ?auto_749806 ) ) ( not ( = ?auto_749804 ?auto_749807 ) ) ( not ( = ?auto_749804 ?auto_749808 ) ) ( not ( = ?auto_749804 ?auto_749809 ) ) ( not ( = ?auto_749804 ?auto_749810 ) ) ( not ( = ?auto_749804 ?auto_749811 ) ) ( not ( = ?auto_749805 ?auto_749806 ) ) ( not ( = ?auto_749805 ?auto_749807 ) ) ( not ( = ?auto_749805 ?auto_749808 ) ) ( not ( = ?auto_749805 ?auto_749809 ) ) ( not ( = ?auto_749805 ?auto_749810 ) ) ( not ( = ?auto_749805 ?auto_749811 ) ) ( not ( = ?auto_749806 ?auto_749807 ) ) ( not ( = ?auto_749806 ?auto_749808 ) ) ( not ( = ?auto_749806 ?auto_749809 ) ) ( not ( = ?auto_749806 ?auto_749810 ) ) ( not ( = ?auto_749806 ?auto_749811 ) ) ( not ( = ?auto_749807 ?auto_749808 ) ) ( not ( = ?auto_749807 ?auto_749809 ) ) ( not ( = ?auto_749807 ?auto_749810 ) ) ( not ( = ?auto_749807 ?auto_749811 ) ) ( not ( = ?auto_749808 ?auto_749809 ) ) ( not ( = ?auto_749808 ?auto_749810 ) ) ( not ( = ?auto_749808 ?auto_749811 ) ) ( not ( = ?auto_749809 ?auto_749810 ) ) ( not ( = ?auto_749809 ?auto_749811 ) ) ( not ( = ?auto_749810 ?auto_749811 ) ) ( ON ?auto_749809 ?auto_749810 ) ( CLEAR ?auto_749807 ) ( ON ?auto_749808 ?auto_749809 ) ( CLEAR ?auto_749808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_749801 ?auto_749802 ?auto_749803 ?auto_749804 ?auto_749805 ?auto_749806 ?auto_749807 ?auto_749808 )
      ( MAKE-10PILE ?auto_749801 ?auto_749802 ?auto_749803 ?auto_749804 ?auto_749805 ?auto_749806 ?auto_749807 ?auto_749808 ?auto_749809 ?auto_749810 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_749843 - BLOCK
      ?auto_749844 - BLOCK
      ?auto_749845 - BLOCK
      ?auto_749846 - BLOCK
      ?auto_749847 - BLOCK
      ?auto_749848 - BLOCK
      ?auto_749849 - BLOCK
      ?auto_749850 - BLOCK
      ?auto_749851 - BLOCK
      ?auto_749852 - BLOCK
    )
    :vars
    (
      ?auto_749853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749852 ?auto_749853 ) ( ON-TABLE ?auto_749843 ) ( ON ?auto_749844 ?auto_749843 ) ( ON ?auto_749845 ?auto_749844 ) ( ON ?auto_749846 ?auto_749845 ) ( ON ?auto_749847 ?auto_749846 ) ( ON ?auto_749848 ?auto_749847 ) ( not ( = ?auto_749843 ?auto_749844 ) ) ( not ( = ?auto_749843 ?auto_749845 ) ) ( not ( = ?auto_749843 ?auto_749846 ) ) ( not ( = ?auto_749843 ?auto_749847 ) ) ( not ( = ?auto_749843 ?auto_749848 ) ) ( not ( = ?auto_749843 ?auto_749849 ) ) ( not ( = ?auto_749843 ?auto_749850 ) ) ( not ( = ?auto_749843 ?auto_749851 ) ) ( not ( = ?auto_749843 ?auto_749852 ) ) ( not ( = ?auto_749843 ?auto_749853 ) ) ( not ( = ?auto_749844 ?auto_749845 ) ) ( not ( = ?auto_749844 ?auto_749846 ) ) ( not ( = ?auto_749844 ?auto_749847 ) ) ( not ( = ?auto_749844 ?auto_749848 ) ) ( not ( = ?auto_749844 ?auto_749849 ) ) ( not ( = ?auto_749844 ?auto_749850 ) ) ( not ( = ?auto_749844 ?auto_749851 ) ) ( not ( = ?auto_749844 ?auto_749852 ) ) ( not ( = ?auto_749844 ?auto_749853 ) ) ( not ( = ?auto_749845 ?auto_749846 ) ) ( not ( = ?auto_749845 ?auto_749847 ) ) ( not ( = ?auto_749845 ?auto_749848 ) ) ( not ( = ?auto_749845 ?auto_749849 ) ) ( not ( = ?auto_749845 ?auto_749850 ) ) ( not ( = ?auto_749845 ?auto_749851 ) ) ( not ( = ?auto_749845 ?auto_749852 ) ) ( not ( = ?auto_749845 ?auto_749853 ) ) ( not ( = ?auto_749846 ?auto_749847 ) ) ( not ( = ?auto_749846 ?auto_749848 ) ) ( not ( = ?auto_749846 ?auto_749849 ) ) ( not ( = ?auto_749846 ?auto_749850 ) ) ( not ( = ?auto_749846 ?auto_749851 ) ) ( not ( = ?auto_749846 ?auto_749852 ) ) ( not ( = ?auto_749846 ?auto_749853 ) ) ( not ( = ?auto_749847 ?auto_749848 ) ) ( not ( = ?auto_749847 ?auto_749849 ) ) ( not ( = ?auto_749847 ?auto_749850 ) ) ( not ( = ?auto_749847 ?auto_749851 ) ) ( not ( = ?auto_749847 ?auto_749852 ) ) ( not ( = ?auto_749847 ?auto_749853 ) ) ( not ( = ?auto_749848 ?auto_749849 ) ) ( not ( = ?auto_749848 ?auto_749850 ) ) ( not ( = ?auto_749848 ?auto_749851 ) ) ( not ( = ?auto_749848 ?auto_749852 ) ) ( not ( = ?auto_749848 ?auto_749853 ) ) ( not ( = ?auto_749849 ?auto_749850 ) ) ( not ( = ?auto_749849 ?auto_749851 ) ) ( not ( = ?auto_749849 ?auto_749852 ) ) ( not ( = ?auto_749849 ?auto_749853 ) ) ( not ( = ?auto_749850 ?auto_749851 ) ) ( not ( = ?auto_749850 ?auto_749852 ) ) ( not ( = ?auto_749850 ?auto_749853 ) ) ( not ( = ?auto_749851 ?auto_749852 ) ) ( not ( = ?auto_749851 ?auto_749853 ) ) ( not ( = ?auto_749852 ?auto_749853 ) ) ( ON ?auto_749851 ?auto_749852 ) ( ON ?auto_749850 ?auto_749851 ) ( CLEAR ?auto_749848 ) ( ON ?auto_749849 ?auto_749850 ) ( CLEAR ?auto_749849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_749843 ?auto_749844 ?auto_749845 ?auto_749846 ?auto_749847 ?auto_749848 ?auto_749849 )
      ( MAKE-10PILE ?auto_749843 ?auto_749844 ?auto_749845 ?auto_749846 ?auto_749847 ?auto_749848 ?auto_749849 ?auto_749850 ?auto_749851 ?auto_749852 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_749885 - BLOCK
      ?auto_749886 - BLOCK
      ?auto_749887 - BLOCK
      ?auto_749888 - BLOCK
      ?auto_749889 - BLOCK
      ?auto_749890 - BLOCK
      ?auto_749891 - BLOCK
      ?auto_749892 - BLOCK
      ?auto_749893 - BLOCK
      ?auto_749894 - BLOCK
    )
    :vars
    (
      ?auto_749895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749894 ?auto_749895 ) ( ON-TABLE ?auto_749885 ) ( ON ?auto_749886 ?auto_749885 ) ( ON ?auto_749887 ?auto_749886 ) ( ON ?auto_749888 ?auto_749887 ) ( ON ?auto_749889 ?auto_749888 ) ( not ( = ?auto_749885 ?auto_749886 ) ) ( not ( = ?auto_749885 ?auto_749887 ) ) ( not ( = ?auto_749885 ?auto_749888 ) ) ( not ( = ?auto_749885 ?auto_749889 ) ) ( not ( = ?auto_749885 ?auto_749890 ) ) ( not ( = ?auto_749885 ?auto_749891 ) ) ( not ( = ?auto_749885 ?auto_749892 ) ) ( not ( = ?auto_749885 ?auto_749893 ) ) ( not ( = ?auto_749885 ?auto_749894 ) ) ( not ( = ?auto_749885 ?auto_749895 ) ) ( not ( = ?auto_749886 ?auto_749887 ) ) ( not ( = ?auto_749886 ?auto_749888 ) ) ( not ( = ?auto_749886 ?auto_749889 ) ) ( not ( = ?auto_749886 ?auto_749890 ) ) ( not ( = ?auto_749886 ?auto_749891 ) ) ( not ( = ?auto_749886 ?auto_749892 ) ) ( not ( = ?auto_749886 ?auto_749893 ) ) ( not ( = ?auto_749886 ?auto_749894 ) ) ( not ( = ?auto_749886 ?auto_749895 ) ) ( not ( = ?auto_749887 ?auto_749888 ) ) ( not ( = ?auto_749887 ?auto_749889 ) ) ( not ( = ?auto_749887 ?auto_749890 ) ) ( not ( = ?auto_749887 ?auto_749891 ) ) ( not ( = ?auto_749887 ?auto_749892 ) ) ( not ( = ?auto_749887 ?auto_749893 ) ) ( not ( = ?auto_749887 ?auto_749894 ) ) ( not ( = ?auto_749887 ?auto_749895 ) ) ( not ( = ?auto_749888 ?auto_749889 ) ) ( not ( = ?auto_749888 ?auto_749890 ) ) ( not ( = ?auto_749888 ?auto_749891 ) ) ( not ( = ?auto_749888 ?auto_749892 ) ) ( not ( = ?auto_749888 ?auto_749893 ) ) ( not ( = ?auto_749888 ?auto_749894 ) ) ( not ( = ?auto_749888 ?auto_749895 ) ) ( not ( = ?auto_749889 ?auto_749890 ) ) ( not ( = ?auto_749889 ?auto_749891 ) ) ( not ( = ?auto_749889 ?auto_749892 ) ) ( not ( = ?auto_749889 ?auto_749893 ) ) ( not ( = ?auto_749889 ?auto_749894 ) ) ( not ( = ?auto_749889 ?auto_749895 ) ) ( not ( = ?auto_749890 ?auto_749891 ) ) ( not ( = ?auto_749890 ?auto_749892 ) ) ( not ( = ?auto_749890 ?auto_749893 ) ) ( not ( = ?auto_749890 ?auto_749894 ) ) ( not ( = ?auto_749890 ?auto_749895 ) ) ( not ( = ?auto_749891 ?auto_749892 ) ) ( not ( = ?auto_749891 ?auto_749893 ) ) ( not ( = ?auto_749891 ?auto_749894 ) ) ( not ( = ?auto_749891 ?auto_749895 ) ) ( not ( = ?auto_749892 ?auto_749893 ) ) ( not ( = ?auto_749892 ?auto_749894 ) ) ( not ( = ?auto_749892 ?auto_749895 ) ) ( not ( = ?auto_749893 ?auto_749894 ) ) ( not ( = ?auto_749893 ?auto_749895 ) ) ( not ( = ?auto_749894 ?auto_749895 ) ) ( ON ?auto_749893 ?auto_749894 ) ( ON ?auto_749892 ?auto_749893 ) ( ON ?auto_749891 ?auto_749892 ) ( CLEAR ?auto_749889 ) ( ON ?auto_749890 ?auto_749891 ) ( CLEAR ?auto_749890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_749885 ?auto_749886 ?auto_749887 ?auto_749888 ?auto_749889 ?auto_749890 )
      ( MAKE-10PILE ?auto_749885 ?auto_749886 ?auto_749887 ?auto_749888 ?auto_749889 ?auto_749890 ?auto_749891 ?auto_749892 ?auto_749893 ?auto_749894 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_749927 - BLOCK
      ?auto_749928 - BLOCK
      ?auto_749929 - BLOCK
      ?auto_749930 - BLOCK
      ?auto_749931 - BLOCK
      ?auto_749932 - BLOCK
      ?auto_749933 - BLOCK
      ?auto_749934 - BLOCK
      ?auto_749935 - BLOCK
      ?auto_749936 - BLOCK
    )
    :vars
    (
      ?auto_749937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749936 ?auto_749937 ) ( ON-TABLE ?auto_749927 ) ( ON ?auto_749928 ?auto_749927 ) ( ON ?auto_749929 ?auto_749928 ) ( ON ?auto_749930 ?auto_749929 ) ( not ( = ?auto_749927 ?auto_749928 ) ) ( not ( = ?auto_749927 ?auto_749929 ) ) ( not ( = ?auto_749927 ?auto_749930 ) ) ( not ( = ?auto_749927 ?auto_749931 ) ) ( not ( = ?auto_749927 ?auto_749932 ) ) ( not ( = ?auto_749927 ?auto_749933 ) ) ( not ( = ?auto_749927 ?auto_749934 ) ) ( not ( = ?auto_749927 ?auto_749935 ) ) ( not ( = ?auto_749927 ?auto_749936 ) ) ( not ( = ?auto_749927 ?auto_749937 ) ) ( not ( = ?auto_749928 ?auto_749929 ) ) ( not ( = ?auto_749928 ?auto_749930 ) ) ( not ( = ?auto_749928 ?auto_749931 ) ) ( not ( = ?auto_749928 ?auto_749932 ) ) ( not ( = ?auto_749928 ?auto_749933 ) ) ( not ( = ?auto_749928 ?auto_749934 ) ) ( not ( = ?auto_749928 ?auto_749935 ) ) ( not ( = ?auto_749928 ?auto_749936 ) ) ( not ( = ?auto_749928 ?auto_749937 ) ) ( not ( = ?auto_749929 ?auto_749930 ) ) ( not ( = ?auto_749929 ?auto_749931 ) ) ( not ( = ?auto_749929 ?auto_749932 ) ) ( not ( = ?auto_749929 ?auto_749933 ) ) ( not ( = ?auto_749929 ?auto_749934 ) ) ( not ( = ?auto_749929 ?auto_749935 ) ) ( not ( = ?auto_749929 ?auto_749936 ) ) ( not ( = ?auto_749929 ?auto_749937 ) ) ( not ( = ?auto_749930 ?auto_749931 ) ) ( not ( = ?auto_749930 ?auto_749932 ) ) ( not ( = ?auto_749930 ?auto_749933 ) ) ( not ( = ?auto_749930 ?auto_749934 ) ) ( not ( = ?auto_749930 ?auto_749935 ) ) ( not ( = ?auto_749930 ?auto_749936 ) ) ( not ( = ?auto_749930 ?auto_749937 ) ) ( not ( = ?auto_749931 ?auto_749932 ) ) ( not ( = ?auto_749931 ?auto_749933 ) ) ( not ( = ?auto_749931 ?auto_749934 ) ) ( not ( = ?auto_749931 ?auto_749935 ) ) ( not ( = ?auto_749931 ?auto_749936 ) ) ( not ( = ?auto_749931 ?auto_749937 ) ) ( not ( = ?auto_749932 ?auto_749933 ) ) ( not ( = ?auto_749932 ?auto_749934 ) ) ( not ( = ?auto_749932 ?auto_749935 ) ) ( not ( = ?auto_749932 ?auto_749936 ) ) ( not ( = ?auto_749932 ?auto_749937 ) ) ( not ( = ?auto_749933 ?auto_749934 ) ) ( not ( = ?auto_749933 ?auto_749935 ) ) ( not ( = ?auto_749933 ?auto_749936 ) ) ( not ( = ?auto_749933 ?auto_749937 ) ) ( not ( = ?auto_749934 ?auto_749935 ) ) ( not ( = ?auto_749934 ?auto_749936 ) ) ( not ( = ?auto_749934 ?auto_749937 ) ) ( not ( = ?auto_749935 ?auto_749936 ) ) ( not ( = ?auto_749935 ?auto_749937 ) ) ( not ( = ?auto_749936 ?auto_749937 ) ) ( ON ?auto_749935 ?auto_749936 ) ( ON ?auto_749934 ?auto_749935 ) ( ON ?auto_749933 ?auto_749934 ) ( ON ?auto_749932 ?auto_749933 ) ( CLEAR ?auto_749930 ) ( ON ?auto_749931 ?auto_749932 ) ( CLEAR ?auto_749931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_749927 ?auto_749928 ?auto_749929 ?auto_749930 ?auto_749931 )
      ( MAKE-10PILE ?auto_749927 ?auto_749928 ?auto_749929 ?auto_749930 ?auto_749931 ?auto_749932 ?auto_749933 ?auto_749934 ?auto_749935 ?auto_749936 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_749969 - BLOCK
      ?auto_749970 - BLOCK
      ?auto_749971 - BLOCK
      ?auto_749972 - BLOCK
      ?auto_749973 - BLOCK
      ?auto_749974 - BLOCK
      ?auto_749975 - BLOCK
      ?auto_749976 - BLOCK
      ?auto_749977 - BLOCK
      ?auto_749978 - BLOCK
    )
    :vars
    (
      ?auto_749979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_749978 ?auto_749979 ) ( ON-TABLE ?auto_749969 ) ( ON ?auto_749970 ?auto_749969 ) ( ON ?auto_749971 ?auto_749970 ) ( not ( = ?auto_749969 ?auto_749970 ) ) ( not ( = ?auto_749969 ?auto_749971 ) ) ( not ( = ?auto_749969 ?auto_749972 ) ) ( not ( = ?auto_749969 ?auto_749973 ) ) ( not ( = ?auto_749969 ?auto_749974 ) ) ( not ( = ?auto_749969 ?auto_749975 ) ) ( not ( = ?auto_749969 ?auto_749976 ) ) ( not ( = ?auto_749969 ?auto_749977 ) ) ( not ( = ?auto_749969 ?auto_749978 ) ) ( not ( = ?auto_749969 ?auto_749979 ) ) ( not ( = ?auto_749970 ?auto_749971 ) ) ( not ( = ?auto_749970 ?auto_749972 ) ) ( not ( = ?auto_749970 ?auto_749973 ) ) ( not ( = ?auto_749970 ?auto_749974 ) ) ( not ( = ?auto_749970 ?auto_749975 ) ) ( not ( = ?auto_749970 ?auto_749976 ) ) ( not ( = ?auto_749970 ?auto_749977 ) ) ( not ( = ?auto_749970 ?auto_749978 ) ) ( not ( = ?auto_749970 ?auto_749979 ) ) ( not ( = ?auto_749971 ?auto_749972 ) ) ( not ( = ?auto_749971 ?auto_749973 ) ) ( not ( = ?auto_749971 ?auto_749974 ) ) ( not ( = ?auto_749971 ?auto_749975 ) ) ( not ( = ?auto_749971 ?auto_749976 ) ) ( not ( = ?auto_749971 ?auto_749977 ) ) ( not ( = ?auto_749971 ?auto_749978 ) ) ( not ( = ?auto_749971 ?auto_749979 ) ) ( not ( = ?auto_749972 ?auto_749973 ) ) ( not ( = ?auto_749972 ?auto_749974 ) ) ( not ( = ?auto_749972 ?auto_749975 ) ) ( not ( = ?auto_749972 ?auto_749976 ) ) ( not ( = ?auto_749972 ?auto_749977 ) ) ( not ( = ?auto_749972 ?auto_749978 ) ) ( not ( = ?auto_749972 ?auto_749979 ) ) ( not ( = ?auto_749973 ?auto_749974 ) ) ( not ( = ?auto_749973 ?auto_749975 ) ) ( not ( = ?auto_749973 ?auto_749976 ) ) ( not ( = ?auto_749973 ?auto_749977 ) ) ( not ( = ?auto_749973 ?auto_749978 ) ) ( not ( = ?auto_749973 ?auto_749979 ) ) ( not ( = ?auto_749974 ?auto_749975 ) ) ( not ( = ?auto_749974 ?auto_749976 ) ) ( not ( = ?auto_749974 ?auto_749977 ) ) ( not ( = ?auto_749974 ?auto_749978 ) ) ( not ( = ?auto_749974 ?auto_749979 ) ) ( not ( = ?auto_749975 ?auto_749976 ) ) ( not ( = ?auto_749975 ?auto_749977 ) ) ( not ( = ?auto_749975 ?auto_749978 ) ) ( not ( = ?auto_749975 ?auto_749979 ) ) ( not ( = ?auto_749976 ?auto_749977 ) ) ( not ( = ?auto_749976 ?auto_749978 ) ) ( not ( = ?auto_749976 ?auto_749979 ) ) ( not ( = ?auto_749977 ?auto_749978 ) ) ( not ( = ?auto_749977 ?auto_749979 ) ) ( not ( = ?auto_749978 ?auto_749979 ) ) ( ON ?auto_749977 ?auto_749978 ) ( ON ?auto_749976 ?auto_749977 ) ( ON ?auto_749975 ?auto_749976 ) ( ON ?auto_749974 ?auto_749975 ) ( ON ?auto_749973 ?auto_749974 ) ( CLEAR ?auto_749971 ) ( ON ?auto_749972 ?auto_749973 ) ( CLEAR ?auto_749972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_749969 ?auto_749970 ?auto_749971 ?auto_749972 )
      ( MAKE-10PILE ?auto_749969 ?auto_749970 ?auto_749971 ?auto_749972 ?auto_749973 ?auto_749974 ?auto_749975 ?auto_749976 ?auto_749977 ?auto_749978 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_750011 - BLOCK
      ?auto_750012 - BLOCK
      ?auto_750013 - BLOCK
      ?auto_750014 - BLOCK
      ?auto_750015 - BLOCK
      ?auto_750016 - BLOCK
      ?auto_750017 - BLOCK
      ?auto_750018 - BLOCK
      ?auto_750019 - BLOCK
      ?auto_750020 - BLOCK
    )
    :vars
    (
      ?auto_750021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750020 ?auto_750021 ) ( ON-TABLE ?auto_750011 ) ( ON ?auto_750012 ?auto_750011 ) ( not ( = ?auto_750011 ?auto_750012 ) ) ( not ( = ?auto_750011 ?auto_750013 ) ) ( not ( = ?auto_750011 ?auto_750014 ) ) ( not ( = ?auto_750011 ?auto_750015 ) ) ( not ( = ?auto_750011 ?auto_750016 ) ) ( not ( = ?auto_750011 ?auto_750017 ) ) ( not ( = ?auto_750011 ?auto_750018 ) ) ( not ( = ?auto_750011 ?auto_750019 ) ) ( not ( = ?auto_750011 ?auto_750020 ) ) ( not ( = ?auto_750011 ?auto_750021 ) ) ( not ( = ?auto_750012 ?auto_750013 ) ) ( not ( = ?auto_750012 ?auto_750014 ) ) ( not ( = ?auto_750012 ?auto_750015 ) ) ( not ( = ?auto_750012 ?auto_750016 ) ) ( not ( = ?auto_750012 ?auto_750017 ) ) ( not ( = ?auto_750012 ?auto_750018 ) ) ( not ( = ?auto_750012 ?auto_750019 ) ) ( not ( = ?auto_750012 ?auto_750020 ) ) ( not ( = ?auto_750012 ?auto_750021 ) ) ( not ( = ?auto_750013 ?auto_750014 ) ) ( not ( = ?auto_750013 ?auto_750015 ) ) ( not ( = ?auto_750013 ?auto_750016 ) ) ( not ( = ?auto_750013 ?auto_750017 ) ) ( not ( = ?auto_750013 ?auto_750018 ) ) ( not ( = ?auto_750013 ?auto_750019 ) ) ( not ( = ?auto_750013 ?auto_750020 ) ) ( not ( = ?auto_750013 ?auto_750021 ) ) ( not ( = ?auto_750014 ?auto_750015 ) ) ( not ( = ?auto_750014 ?auto_750016 ) ) ( not ( = ?auto_750014 ?auto_750017 ) ) ( not ( = ?auto_750014 ?auto_750018 ) ) ( not ( = ?auto_750014 ?auto_750019 ) ) ( not ( = ?auto_750014 ?auto_750020 ) ) ( not ( = ?auto_750014 ?auto_750021 ) ) ( not ( = ?auto_750015 ?auto_750016 ) ) ( not ( = ?auto_750015 ?auto_750017 ) ) ( not ( = ?auto_750015 ?auto_750018 ) ) ( not ( = ?auto_750015 ?auto_750019 ) ) ( not ( = ?auto_750015 ?auto_750020 ) ) ( not ( = ?auto_750015 ?auto_750021 ) ) ( not ( = ?auto_750016 ?auto_750017 ) ) ( not ( = ?auto_750016 ?auto_750018 ) ) ( not ( = ?auto_750016 ?auto_750019 ) ) ( not ( = ?auto_750016 ?auto_750020 ) ) ( not ( = ?auto_750016 ?auto_750021 ) ) ( not ( = ?auto_750017 ?auto_750018 ) ) ( not ( = ?auto_750017 ?auto_750019 ) ) ( not ( = ?auto_750017 ?auto_750020 ) ) ( not ( = ?auto_750017 ?auto_750021 ) ) ( not ( = ?auto_750018 ?auto_750019 ) ) ( not ( = ?auto_750018 ?auto_750020 ) ) ( not ( = ?auto_750018 ?auto_750021 ) ) ( not ( = ?auto_750019 ?auto_750020 ) ) ( not ( = ?auto_750019 ?auto_750021 ) ) ( not ( = ?auto_750020 ?auto_750021 ) ) ( ON ?auto_750019 ?auto_750020 ) ( ON ?auto_750018 ?auto_750019 ) ( ON ?auto_750017 ?auto_750018 ) ( ON ?auto_750016 ?auto_750017 ) ( ON ?auto_750015 ?auto_750016 ) ( ON ?auto_750014 ?auto_750015 ) ( CLEAR ?auto_750012 ) ( ON ?auto_750013 ?auto_750014 ) ( CLEAR ?auto_750013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_750011 ?auto_750012 ?auto_750013 )
      ( MAKE-10PILE ?auto_750011 ?auto_750012 ?auto_750013 ?auto_750014 ?auto_750015 ?auto_750016 ?auto_750017 ?auto_750018 ?auto_750019 ?auto_750020 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_750053 - BLOCK
      ?auto_750054 - BLOCK
      ?auto_750055 - BLOCK
      ?auto_750056 - BLOCK
      ?auto_750057 - BLOCK
      ?auto_750058 - BLOCK
      ?auto_750059 - BLOCK
      ?auto_750060 - BLOCK
      ?auto_750061 - BLOCK
      ?auto_750062 - BLOCK
    )
    :vars
    (
      ?auto_750063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750062 ?auto_750063 ) ( ON-TABLE ?auto_750053 ) ( not ( = ?auto_750053 ?auto_750054 ) ) ( not ( = ?auto_750053 ?auto_750055 ) ) ( not ( = ?auto_750053 ?auto_750056 ) ) ( not ( = ?auto_750053 ?auto_750057 ) ) ( not ( = ?auto_750053 ?auto_750058 ) ) ( not ( = ?auto_750053 ?auto_750059 ) ) ( not ( = ?auto_750053 ?auto_750060 ) ) ( not ( = ?auto_750053 ?auto_750061 ) ) ( not ( = ?auto_750053 ?auto_750062 ) ) ( not ( = ?auto_750053 ?auto_750063 ) ) ( not ( = ?auto_750054 ?auto_750055 ) ) ( not ( = ?auto_750054 ?auto_750056 ) ) ( not ( = ?auto_750054 ?auto_750057 ) ) ( not ( = ?auto_750054 ?auto_750058 ) ) ( not ( = ?auto_750054 ?auto_750059 ) ) ( not ( = ?auto_750054 ?auto_750060 ) ) ( not ( = ?auto_750054 ?auto_750061 ) ) ( not ( = ?auto_750054 ?auto_750062 ) ) ( not ( = ?auto_750054 ?auto_750063 ) ) ( not ( = ?auto_750055 ?auto_750056 ) ) ( not ( = ?auto_750055 ?auto_750057 ) ) ( not ( = ?auto_750055 ?auto_750058 ) ) ( not ( = ?auto_750055 ?auto_750059 ) ) ( not ( = ?auto_750055 ?auto_750060 ) ) ( not ( = ?auto_750055 ?auto_750061 ) ) ( not ( = ?auto_750055 ?auto_750062 ) ) ( not ( = ?auto_750055 ?auto_750063 ) ) ( not ( = ?auto_750056 ?auto_750057 ) ) ( not ( = ?auto_750056 ?auto_750058 ) ) ( not ( = ?auto_750056 ?auto_750059 ) ) ( not ( = ?auto_750056 ?auto_750060 ) ) ( not ( = ?auto_750056 ?auto_750061 ) ) ( not ( = ?auto_750056 ?auto_750062 ) ) ( not ( = ?auto_750056 ?auto_750063 ) ) ( not ( = ?auto_750057 ?auto_750058 ) ) ( not ( = ?auto_750057 ?auto_750059 ) ) ( not ( = ?auto_750057 ?auto_750060 ) ) ( not ( = ?auto_750057 ?auto_750061 ) ) ( not ( = ?auto_750057 ?auto_750062 ) ) ( not ( = ?auto_750057 ?auto_750063 ) ) ( not ( = ?auto_750058 ?auto_750059 ) ) ( not ( = ?auto_750058 ?auto_750060 ) ) ( not ( = ?auto_750058 ?auto_750061 ) ) ( not ( = ?auto_750058 ?auto_750062 ) ) ( not ( = ?auto_750058 ?auto_750063 ) ) ( not ( = ?auto_750059 ?auto_750060 ) ) ( not ( = ?auto_750059 ?auto_750061 ) ) ( not ( = ?auto_750059 ?auto_750062 ) ) ( not ( = ?auto_750059 ?auto_750063 ) ) ( not ( = ?auto_750060 ?auto_750061 ) ) ( not ( = ?auto_750060 ?auto_750062 ) ) ( not ( = ?auto_750060 ?auto_750063 ) ) ( not ( = ?auto_750061 ?auto_750062 ) ) ( not ( = ?auto_750061 ?auto_750063 ) ) ( not ( = ?auto_750062 ?auto_750063 ) ) ( ON ?auto_750061 ?auto_750062 ) ( ON ?auto_750060 ?auto_750061 ) ( ON ?auto_750059 ?auto_750060 ) ( ON ?auto_750058 ?auto_750059 ) ( ON ?auto_750057 ?auto_750058 ) ( ON ?auto_750056 ?auto_750057 ) ( ON ?auto_750055 ?auto_750056 ) ( CLEAR ?auto_750053 ) ( ON ?auto_750054 ?auto_750055 ) ( CLEAR ?auto_750054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_750053 ?auto_750054 )
      ( MAKE-10PILE ?auto_750053 ?auto_750054 ?auto_750055 ?auto_750056 ?auto_750057 ?auto_750058 ?auto_750059 ?auto_750060 ?auto_750061 ?auto_750062 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_750095 - BLOCK
      ?auto_750096 - BLOCK
      ?auto_750097 - BLOCK
      ?auto_750098 - BLOCK
      ?auto_750099 - BLOCK
      ?auto_750100 - BLOCK
      ?auto_750101 - BLOCK
      ?auto_750102 - BLOCK
      ?auto_750103 - BLOCK
      ?auto_750104 - BLOCK
    )
    :vars
    (
      ?auto_750105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750104 ?auto_750105 ) ( not ( = ?auto_750095 ?auto_750096 ) ) ( not ( = ?auto_750095 ?auto_750097 ) ) ( not ( = ?auto_750095 ?auto_750098 ) ) ( not ( = ?auto_750095 ?auto_750099 ) ) ( not ( = ?auto_750095 ?auto_750100 ) ) ( not ( = ?auto_750095 ?auto_750101 ) ) ( not ( = ?auto_750095 ?auto_750102 ) ) ( not ( = ?auto_750095 ?auto_750103 ) ) ( not ( = ?auto_750095 ?auto_750104 ) ) ( not ( = ?auto_750095 ?auto_750105 ) ) ( not ( = ?auto_750096 ?auto_750097 ) ) ( not ( = ?auto_750096 ?auto_750098 ) ) ( not ( = ?auto_750096 ?auto_750099 ) ) ( not ( = ?auto_750096 ?auto_750100 ) ) ( not ( = ?auto_750096 ?auto_750101 ) ) ( not ( = ?auto_750096 ?auto_750102 ) ) ( not ( = ?auto_750096 ?auto_750103 ) ) ( not ( = ?auto_750096 ?auto_750104 ) ) ( not ( = ?auto_750096 ?auto_750105 ) ) ( not ( = ?auto_750097 ?auto_750098 ) ) ( not ( = ?auto_750097 ?auto_750099 ) ) ( not ( = ?auto_750097 ?auto_750100 ) ) ( not ( = ?auto_750097 ?auto_750101 ) ) ( not ( = ?auto_750097 ?auto_750102 ) ) ( not ( = ?auto_750097 ?auto_750103 ) ) ( not ( = ?auto_750097 ?auto_750104 ) ) ( not ( = ?auto_750097 ?auto_750105 ) ) ( not ( = ?auto_750098 ?auto_750099 ) ) ( not ( = ?auto_750098 ?auto_750100 ) ) ( not ( = ?auto_750098 ?auto_750101 ) ) ( not ( = ?auto_750098 ?auto_750102 ) ) ( not ( = ?auto_750098 ?auto_750103 ) ) ( not ( = ?auto_750098 ?auto_750104 ) ) ( not ( = ?auto_750098 ?auto_750105 ) ) ( not ( = ?auto_750099 ?auto_750100 ) ) ( not ( = ?auto_750099 ?auto_750101 ) ) ( not ( = ?auto_750099 ?auto_750102 ) ) ( not ( = ?auto_750099 ?auto_750103 ) ) ( not ( = ?auto_750099 ?auto_750104 ) ) ( not ( = ?auto_750099 ?auto_750105 ) ) ( not ( = ?auto_750100 ?auto_750101 ) ) ( not ( = ?auto_750100 ?auto_750102 ) ) ( not ( = ?auto_750100 ?auto_750103 ) ) ( not ( = ?auto_750100 ?auto_750104 ) ) ( not ( = ?auto_750100 ?auto_750105 ) ) ( not ( = ?auto_750101 ?auto_750102 ) ) ( not ( = ?auto_750101 ?auto_750103 ) ) ( not ( = ?auto_750101 ?auto_750104 ) ) ( not ( = ?auto_750101 ?auto_750105 ) ) ( not ( = ?auto_750102 ?auto_750103 ) ) ( not ( = ?auto_750102 ?auto_750104 ) ) ( not ( = ?auto_750102 ?auto_750105 ) ) ( not ( = ?auto_750103 ?auto_750104 ) ) ( not ( = ?auto_750103 ?auto_750105 ) ) ( not ( = ?auto_750104 ?auto_750105 ) ) ( ON ?auto_750103 ?auto_750104 ) ( ON ?auto_750102 ?auto_750103 ) ( ON ?auto_750101 ?auto_750102 ) ( ON ?auto_750100 ?auto_750101 ) ( ON ?auto_750099 ?auto_750100 ) ( ON ?auto_750098 ?auto_750099 ) ( ON ?auto_750097 ?auto_750098 ) ( ON ?auto_750096 ?auto_750097 ) ( ON ?auto_750095 ?auto_750096 ) ( CLEAR ?auto_750095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_750095 )
      ( MAKE-10PILE ?auto_750095 ?auto_750096 ?auto_750097 ?auto_750098 ?auto_750099 ?auto_750100 ?auto_750101 ?auto_750102 ?auto_750103 ?auto_750104 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750138 - BLOCK
      ?auto_750139 - BLOCK
      ?auto_750140 - BLOCK
      ?auto_750141 - BLOCK
      ?auto_750142 - BLOCK
      ?auto_750143 - BLOCK
      ?auto_750144 - BLOCK
      ?auto_750145 - BLOCK
      ?auto_750146 - BLOCK
      ?auto_750147 - BLOCK
      ?auto_750148 - BLOCK
    )
    :vars
    (
      ?auto_750149 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_750147 ) ( ON ?auto_750148 ?auto_750149 ) ( CLEAR ?auto_750148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_750138 ) ( ON ?auto_750139 ?auto_750138 ) ( ON ?auto_750140 ?auto_750139 ) ( ON ?auto_750141 ?auto_750140 ) ( ON ?auto_750142 ?auto_750141 ) ( ON ?auto_750143 ?auto_750142 ) ( ON ?auto_750144 ?auto_750143 ) ( ON ?auto_750145 ?auto_750144 ) ( ON ?auto_750146 ?auto_750145 ) ( ON ?auto_750147 ?auto_750146 ) ( not ( = ?auto_750138 ?auto_750139 ) ) ( not ( = ?auto_750138 ?auto_750140 ) ) ( not ( = ?auto_750138 ?auto_750141 ) ) ( not ( = ?auto_750138 ?auto_750142 ) ) ( not ( = ?auto_750138 ?auto_750143 ) ) ( not ( = ?auto_750138 ?auto_750144 ) ) ( not ( = ?auto_750138 ?auto_750145 ) ) ( not ( = ?auto_750138 ?auto_750146 ) ) ( not ( = ?auto_750138 ?auto_750147 ) ) ( not ( = ?auto_750138 ?auto_750148 ) ) ( not ( = ?auto_750138 ?auto_750149 ) ) ( not ( = ?auto_750139 ?auto_750140 ) ) ( not ( = ?auto_750139 ?auto_750141 ) ) ( not ( = ?auto_750139 ?auto_750142 ) ) ( not ( = ?auto_750139 ?auto_750143 ) ) ( not ( = ?auto_750139 ?auto_750144 ) ) ( not ( = ?auto_750139 ?auto_750145 ) ) ( not ( = ?auto_750139 ?auto_750146 ) ) ( not ( = ?auto_750139 ?auto_750147 ) ) ( not ( = ?auto_750139 ?auto_750148 ) ) ( not ( = ?auto_750139 ?auto_750149 ) ) ( not ( = ?auto_750140 ?auto_750141 ) ) ( not ( = ?auto_750140 ?auto_750142 ) ) ( not ( = ?auto_750140 ?auto_750143 ) ) ( not ( = ?auto_750140 ?auto_750144 ) ) ( not ( = ?auto_750140 ?auto_750145 ) ) ( not ( = ?auto_750140 ?auto_750146 ) ) ( not ( = ?auto_750140 ?auto_750147 ) ) ( not ( = ?auto_750140 ?auto_750148 ) ) ( not ( = ?auto_750140 ?auto_750149 ) ) ( not ( = ?auto_750141 ?auto_750142 ) ) ( not ( = ?auto_750141 ?auto_750143 ) ) ( not ( = ?auto_750141 ?auto_750144 ) ) ( not ( = ?auto_750141 ?auto_750145 ) ) ( not ( = ?auto_750141 ?auto_750146 ) ) ( not ( = ?auto_750141 ?auto_750147 ) ) ( not ( = ?auto_750141 ?auto_750148 ) ) ( not ( = ?auto_750141 ?auto_750149 ) ) ( not ( = ?auto_750142 ?auto_750143 ) ) ( not ( = ?auto_750142 ?auto_750144 ) ) ( not ( = ?auto_750142 ?auto_750145 ) ) ( not ( = ?auto_750142 ?auto_750146 ) ) ( not ( = ?auto_750142 ?auto_750147 ) ) ( not ( = ?auto_750142 ?auto_750148 ) ) ( not ( = ?auto_750142 ?auto_750149 ) ) ( not ( = ?auto_750143 ?auto_750144 ) ) ( not ( = ?auto_750143 ?auto_750145 ) ) ( not ( = ?auto_750143 ?auto_750146 ) ) ( not ( = ?auto_750143 ?auto_750147 ) ) ( not ( = ?auto_750143 ?auto_750148 ) ) ( not ( = ?auto_750143 ?auto_750149 ) ) ( not ( = ?auto_750144 ?auto_750145 ) ) ( not ( = ?auto_750144 ?auto_750146 ) ) ( not ( = ?auto_750144 ?auto_750147 ) ) ( not ( = ?auto_750144 ?auto_750148 ) ) ( not ( = ?auto_750144 ?auto_750149 ) ) ( not ( = ?auto_750145 ?auto_750146 ) ) ( not ( = ?auto_750145 ?auto_750147 ) ) ( not ( = ?auto_750145 ?auto_750148 ) ) ( not ( = ?auto_750145 ?auto_750149 ) ) ( not ( = ?auto_750146 ?auto_750147 ) ) ( not ( = ?auto_750146 ?auto_750148 ) ) ( not ( = ?auto_750146 ?auto_750149 ) ) ( not ( = ?auto_750147 ?auto_750148 ) ) ( not ( = ?auto_750147 ?auto_750149 ) ) ( not ( = ?auto_750148 ?auto_750149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_750148 ?auto_750149 )
      ( !STACK ?auto_750148 ?auto_750147 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750184 - BLOCK
      ?auto_750185 - BLOCK
      ?auto_750186 - BLOCK
      ?auto_750187 - BLOCK
      ?auto_750188 - BLOCK
      ?auto_750189 - BLOCK
      ?auto_750190 - BLOCK
      ?auto_750191 - BLOCK
      ?auto_750192 - BLOCK
      ?auto_750193 - BLOCK
      ?auto_750194 - BLOCK
    )
    :vars
    (
      ?auto_750195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750194 ?auto_750195 ) ( ON-TABLE ?auto_750184 ) ( ON ?auto_750185 ?auto_750184 ) ( ON ?auto_750186 ?auto_750185 ) ( ON ?auto_750187 ?auto_750186 ) ( ON ?auto_750188 ?auto_750187 ) ( ON ?auto_750189 ?auto_750188 ) ( ON ?auto_750190 ?auto_750189 ) ( ON ?auto_750191 ?auto_750190 ) ( ON ?auto_750192 ?auto_750191 ) ( not ( = ?auto_750184 ?auto_750185 ) ) ( not ( = ?auto_750184 ?auto_750186 ) ) ( not ( = ?auto_750184 ?auto_750187 ) ) ( not ( = ?auto_750184 ?auto_750188 ) ) ( not ( = ?auto_750184 ?auto_750189 ) ) ( not ( = ?auto_750184 ?auto_750190 ) ) ( not ( = ?auto_750184 ?auto_750191 ) ) ( not ( = ?auto_750184 ?auto_750192 ) ) ( not ( = ?auto_750184 ?auto_750193 ) ) ( not ( = ?auto_750184 ?auto_750194 ) ) ( not ( = ?auto_750184 ?auto_750195 ) ) ( not ( = ?auto_750185 ?auto_750186 ) ) ( not ( = ?auto_750185 ?auto_750187 ) ) ( not ( = ?auto_750185 ?auto_750188 ) ) ( not ( = ?auto_750185 ?auto_750189 ) ) ( not ( = ?auto_750185 ?auto_750190 ) ) ( not ( = ?auto_750185 ?auto_750191 ) ) ( not ( = ?auto_750185 ?auto_750192 ) ) ( not ( = ?auto_750185 ?auto_750193 ) ) ( not ( = ?auto_750185 ?auto_750194 ) ) ( not ( = ?auto_750185 ?auto_750195 ) ) ( not ( = ?auto_750186 ?auto_750187 ) ) ( not ( = ?auto_750186 ?auto_750188 ) ) ( not ( = ?auto_750186 ?auto_750189 ) ) ( not ( = ?auto_750186 ?auto_750190 ) ) ( not ( = ?auto_750186 ?auto_750191 ) ) ( not ( = ?auto_750186 ?auto_750192 ) ) ( not ( = ?auto_750186 ?auto_750193 ) ) ( not ( = ?auto_750186 ?auto_750194 ) ) ( not ( = ?auto_750186 ?auto_750195 ) ) ( not ( = ?auto_750187 ?auto_750188 ) ) ( not ( = ?auto_750187 ?auto_750189 ) ) ( not ( = ?auto_750187 ?auto_750190 ) ) ( not ( = ?auto_750187 ?auto_750191 ) ) ( not ( = ?auto_750187 ?auto_750192 ) ) ( not ( = ?auto_750187 ?auto_750193 ) ) ( not ( = ?auto_750187 ?auto_750194 ) ) ( not ( = ?auto_750187 ?auto_750195 ) ) ( not ( = ?auto_750188 ?auto_750189 ) ) ( not ( = ?auto_750188 ?auto_750190 ) ) ( not ( = ?auto_750188 ?auto_750191 ) ) ( not ( = ?auto_750188 ?auto_750192 ) ) ( not ( = ?auto_750188 ?auto_750193 ) ) ( not ( = ?auto_750188 ?auto_750194 ) ) ( not ( = ?auto_750188 ?auto_750195 ) ) ( not ( = ?auto_750189 ?auto_750190 ) ) ( not ( = ?auto_750189 ?auto_750191 ) ) ( not ( = ?auto_750189 ?auto_750192 ) ) ( not ( = ?auto_750189 ?auto_750193 ) ) ( not ( = ?auto_750189 ?auto_750194 ) ) ( not ( = ?auto_750189 ?auto_750195 ) ) ( not ( = ?auto_750190 ?auto_750191 ) ) ( not ( = ?auto_750190 ?auto_750192 ) ) ( not ( = ?auto_750190 ?auto_750193 ) ) ( not ( = ?auto_750190 ?auto_750194 ) ) ( not ( = ?auto_750190 ?auto_750195 ) ) ( not ( = ?auto_750191 ?auto_750192 ) ) ( not ( = ?auto_750191 ?auto_750193 ) ) ( not ( = ?auto_750191 ?auto_750194 ) ) ( not ( = ?auto_750191 ?auto_750195 ) ) ( not ( = ?auto_750192 ?auto_750193 ) ) ( not ( = ?auto_750192 ?auto_750194 ) ) ( not ( = ?auto_750192 ?auto_750195 ) ) ( not ( = ?auto_750193 ?auto_750194 ) ) ( not ( = ?auto_750193 ?auto_750195 ) ) ( not ( = ?auto_750194 ?auto_750195 ) ) ( CLEAR ?auto_750192 ) ( ON ?auto_750193 ?auto_750194 ) ( CLEAR ?auto_750193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_750184 ?auto_750185 ?auto_750186 ?auto_750187 ?auto_750188 ?auto_750189 ?auto_750190 ?auto_750191 ?auto_750192 ?auto_750193 )
      ( MAKE-11PILE ?auto_750184 ?auto_750185 ?auto_750186 ?auto_750187 ?auto_750188 ?auto_750189 ?auto_750190 ?auto_750191 ?auto_750192 ?auto_750193 ?auto_750194 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750230 - BLOCK
      ?auto_750231 - BLOCK
      ?auto_750232 - BLOCK
      ?auto_750233 - BLOCK
      ?auto_750234 - BLOCK
      ?auto_750235 - BLOCK
      ?auto_750236 - BLOCK
      ?auto_750237 - BLOCK
      ?auto_750238 - BLOCK
      ?auto_750239 - BLOCK
      ?auto_750240 - BLOCK
    )
    :vars
    (
      ?auto_750241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750240 ?auto_750241 ) ( ON-TABLE ?auto_750230 ) ( ON ?auto_750231 ?auto_750230 ) ( ON ?auto_750232 ?auto_750231 ) ( ON ?auto_750233 ?auto_750232 ) ( ON ?auto_750234 ?auto_750233 ) ( ON ?auto_750235 ?auto_750234 ) ( ON ?auto_750236 ?auto_750235 ) ( ON ?auto_750237 ?auto_750236 ) ( not ( = ?auto_750230 ?auto_750231 ) ) ( not ( = ?auto_750230 ?auto_750232 ) ) ( not ( = ?auto_750230 ?auto_750233 ) ) ( not ( = ?auto_750230 ?auto_750234 ) ) ( not ( = ?auto_750230 ?auto_750235 ) ) ( not ( = ?auto_750230 ?auto_750236 ) ) ( not ( = ?auto_750230 ?auto_750237 ) ) ( not ( = ?auto_750230 ?auto_750238 ) ) ( not ( = ?auto_750230 ?auto_750239 ) ) ( not ( = ?auto_750230 ?auto_750240 ) ) ( not ( = ?auto_750230 ?auto_750241 ) ) ( not ( = ?auto_750231 ?auto_750232 ) ) ( not ( = ?auto_750231 ?auto_750233 ) ) ( not ( = ?auto_750231 ?auto_750234 ) ) ( not ( = ?auto_750231 ?auto_750235 ) ) ( not ( = ?auto_750231 ?auto_750236 ) ) ( not ( = ?auto_750231 ?auto_750237 ) ) ( not ( = ?auto_750231 ?auto_750238 ) ) ( not ( = ?auto_750231 ?auto_750239 ) ) ( not ( = ?auto_750231 ?auto_750240 ) ) ( not ( = ?auto_750231 ?auto_750241 ) ) ( not ( = ?auto_750232 ?auto_750233 ) ) ( not ( = ?auto_750232 ?auto_750234 ) ) ( not ( = ?auto_750232 ?auto_750235 ) ) ( not ( = ?auto_750232 ?auto_750236 ) ) ( not ( = ?auto_750232 ?auto_750237 ) ) ( not ( = ?auto_750232 ?auto_750238 ) ) ( not ( = ?auto_750232 ?auto_750239 ) ) ( not ( = ?auto_750232 ?auto_750240 ) ) ( not ( = ?auto_750232 ?auto_750241 ) ) ( not ( = ?auto_750233 ?auto_750234 ) ) ( not ( = ?auto_750233 ?auto_750235 ) ) ( not ( = ?auto_750233 ?auto_750236 ) ) ( not ( = ?auto_750233 ?auto_750237 ) ) ( not ( = ?auto_750233 ?auto_750238 ) ) ( not ( = ?auto_750233 ?auto_750239 ) ) ( not ( = ?auto_750233 ?auto_750240 ) ) ( not ( = ?auto_750233 ?auto_750241 ) ) ( not ( = ?auto_750234 ?auto_750235 ) ) ( not ( = ?auto_750234 ?auto_750236 ) ) ( not ( = ?auto_750234 ?auto_750237 ) ) ( not ( = ?auto_750234 ?auto_750238 ) ) ( not ( = ?auto_750234 ?auto_750239 ) ) ( not ( = ?auto_750234 ?auto_750240 ) ) ( not ( = ?auto_750234 ?auto_750241 ) ) ( not ( = ?auto_750235 ?auto_750236 ) ) ( not ( = ?auto_750235 ?auto_750237 ) ) ( not ( = ?auto_750235 ?auto_750238 ) ) ( not ( = ?auto_750235 ?auto_750239 ) ) ( not ( = ?auto_750235 ?auto_750240 ) ) ( not ( = ?auto_750235 ?auto_750241 ) ) ( not ( = ?auto_750236 ?auto_750237 ) ) ( not ( = ?auto_750236 ?auto_750238 ) ) ( not ( = ?auto_750236 ?auto_750239 ) ) ( not ( = ?auto_750236 ?auto_750240 ) ) ( not ( = ?auto_750236 ?auto_750241 ) ) ( not ( = ?auto_750237 ?auto_750238 ) ) ( not ( = ?auto_750237 ?auto_750239 ) ) ( not ( = ?auto_750237 ?auto_750240 ) ) ( not ( = ?auto_750237 ?auto_750241 ) ) ( not ( = ?auto_750238 ?auto_750239 ) ) ( not ( = ?auto_750238 ?auto_750240 ) ) ( not ( = ?auto_750238 ?auto_750241 ) ) ( not ( = ?auto_750239 ?auto_750240 ) ) ( not ( = ?auto_750239 ?auto_750241 ) ) ( not ( = ?auto_750240 ?auto_750241 ) ) ( ON ?auto_750239 ?auto_750240 ) ( CLEAR ?auto_750237 ) ( ON ?auto_750238 ?auto_750239 ) ( CLEAR ?auto_750238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_750230 ?auto_750231 ?auto_750232 ?auto_750233 ?auto_750234 ?auto_750235 ?auto_750236 ?auto_750237 ?auto_750238 )
      ( MAKE-11PILE ?auto_750230 ?auto_750231 ?auto_750232 ?auto_750233 ?auto_750234 ?auto_750235 ?auto_750236 ?auto_750237 ?auto_750238 ?auto_750239 ?auto_750240 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750276 - BLOCK
      ?auto_750277 - BLOCK
      ?auto_750278 - BLOCK
      ?auto_750279 - BLOCK
      ?auto_750280 - BLOCK
      ?auto_750281 - BLOCK
      ?auto_750282 - BLOCK
      ?auto_750283 - BLOCK
      ?auto_750284 - BLOCK
      ?auto_750285 - BLOCK
      ?auto_750286 - BLOCK
    )
    :vars
    (
      ?auto_750287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750286 ?auto_750287 ) ( ON-TABLE ?auto_750276 ) ( ON ?auto_750277 ?auto_750276 ) ( ON ?auto_750278 ?auto_750277 ) ( ON ?auto_750279 ?auto_750278 ) ( ON ?auto_750280 ?auto_750279 ) ( ON ?auto_750281 ?auto_750280 ) ( ON ?auto_750282 ?auto_750281 ) ( not ( = ?auto_750276 ?auto_750277 ) ) ( not ( = ?auto_750276 ?auto_750278 ) ) ( not ( = ?auto_750276 ?auto_750279 ) ) ( not ( = ?auto_750276 ?auto_750280 ) ) ( not ( = ?auto_750276 ?auto_750281 ) ) ( not ( = ?auto_750276 ?auto_750282 ) ) ( not ( = ?auto_750276 ?auto_750283 ) ) ( not ( = ?auto_750276 ?auto_750284 ) ) ( not ( = ?auto_750276 ?auto_750285 ) ) ( not ( = ?auto_750276 ?auto_750286 ) ) ( not ( = ?auto_750276 ?auto_750287 ) ) ( not ( = ?auto_750277 ?auto_750278 ) ) ( not ( = ?auto_750277 ?auto_750279 ) ) ( not ( = ?auto_750277 ?auto_750280 ) ) ( not ( = ?auto_750277 ?auto_750281 ) ) ( not ( = ?auto_750277 ?auto_750282 ) ) ( not ( = ?auto_750277 ?auto_750283 ) ) ( not ( = ?auto_750277 ?auto_750284 ) ) ( not ( = ?auto_750277 ?auto_750285 ) ) ( not ( = ?auto_750277 ?auto_750286 ) ) ( not ( = ?auto_750277 ?auto_750287 ) ) ( not ( = ?auto_750278 ?auto_750279 ) ) ( not ( = ?auto_750278 ?auto_750280 ) ) ( not ( = ?auto_750278 ?auto_750281 ) ) ( not ( = ?auto_750278 ?auto_750282 ) ) ( not ( = ?auto_750278 ?auto_750283 ) ) ( not ( = ?auto_750278 ?auto_750284 ) ) ( not ( = ?auto_750278 ?auto_750285 ) ) ( not ( = ?auto_750278 ?auto_750286 ) ) ( not ( = ?auto_750278 ?auto_750287 ) ) ( not ( = ?auto_750279 ?auto_750280 ) ) ( not ( = ?auto_750279 ?auto_750281 ) ) ( not ( = ?auto_750279 ?auto_750282 ) ) ( not ( = ?auto_750279 ?auto_750283 ) ) ( not ( = ?auto_750279 ?auto_750284 ) ) ( not ( = ?auto_750279 ?auto_750285 ) ) ( not ( = ?auto_750279 ?auto_750286 ) ) ( not ( = ?auto_750279 ?auto_750287 ) ) ( not ( = ?auto_750280 ?auto_750281 ) ) ( not ( = ?auto_750280 ?auto_750282 ) ) ( not ( = ?auto_750280 ?auto_750283 ) ) ( not ( = ?auto_750280 ?auto_750284 ) ) ( not ( = ?auto_750280 ?auto_750285 ) ) ( not ( = ?auto_750280 ?auto_750286 ) ) ( not ( = ?auto_750280 ?auto_750287 ) ) ( not ( = ?auto_750281 ?auto_750282 ) ) ( not ( = ?auto_750281 ?auto_750283 ) ) ( not ( = ?auto_750281 ?auto_750284 ) ) ( not ( = ?auto_750281 ?auto_750285 ) ) ( not ( = ?auto_750281 ?auto_750286 ) ) ( not ( = ?auto_750281 ?auto_750287 ) ) ( not ( = ?auto_750282 ?auto_750283 ) ) ( not ( = ?auto_750282 ?auto_750284 ) ) ( not ( = ?auto_750282 ?auto_750285 ) ) ( not ( = ?auto_750282 ?auto_750286 ) ) ( not ( = ?auto_750282 ?auto_750287 ) ) ( not ( = ?auto_750283 ?auto_750284 ) ) ( not ( = ?auto_750283 ?auto_750285 ) ) ( not ( = ?auto_750283 ?auto_750286 ) ) ( not ( = ?auto_750283 ?auto_750287 ) ) ( not ( = ?auto_750284 ?auto_750285 ) ) ( not ( = ?auto_750284 ?auto_750286 ) ) ( not ( = ?auto_750284 ?auto_750287 ) ) ( not ( = ?auto_750285 ?auto_750286 ) ) ( not ( = ?auto_750285 ?auto_750287 ) ) ( not ( = ?auto_750286 ?auto_750287 ) ) ( ON ?auto_750285 ?auto_750286 ) ( ON ?auto_750284 ?auto_750285 ) ( CLEAR ?auto_750282 ) ( ON ?auto_750283 ?auto_750284 ) ( CLEAR ?auto_750283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_750276 ?auto_750277 ?auto_750278 ?auto_750279 ?auto_750280 ?auto_750281 ?auto_750282 ?auto_750283 )
      ( MAKE-11PILE ?auto_750276 ?auto_750277 ?auto_750278 ?auto_750279 ?auto_750280 ?auto_750281 ?auto_750282 ?auto_750283 ?auto_750284 ?auto_750285 ?auto_750286 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750322 - BLOCK
      ?auto_750323 - BLOCK
      ?auto_750324 - BLOCK
      ?auto_750325 - BLOCK
      ?auto_750326 - BLOCK
      ?auto_750327 - BLOCK
      ?auto_750328 - BLOCK
      ?auto_750329 - BLOCK
      ?auto_750330 - BLOCK
      ?auto_750331 - BLOCK
      ?auto_750332 - BLOCK
    )
    :vars
    (
      ?auto_750333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750332 ?auto_750333 ) ( ON-TABLE ?auto_750322 ) ( ON ?auto_750323 ?auto_750322 ) ( ON ?auto_750324 ?auto_750323 ) ( ON ?auto_750325 ?auto_750324 ) ( ON ?auto_750326 ?auto_750325 ) ( ON ?auto_750327 ?auto_750326 ) ( not ( = ?auto_750322 ?auto_750323 ) ) ( not ( = ?auto_750322 ?auto_750324 ) ) ( not ( = ?auto_750322 ?auto_750325 ) ) ( not ( = ?auto_750322 ?auto_750326 ) ) ( not ( = ?auto_750322 ?auto_750327 ) ) ( not ( = ?auto_750322 ?auto_750328 ) ) ( not ( = ?auto_750322 ?auto_750329 ) ) ( not ( = ?auto_750322 ?auto_750330 ) ) ( not ( = ?auto_750322 ?auto_750331 ) ) ( not ( = ?auto_750322 ?auto_750332 ) ) ( not ( = ?auto_750322 ?auto_750333 ) ) ( not ( = ?auto_750323 ?auto_750324 ) ) ( not ( = ?auto_750323 ?auto_750325 ) ) ( not ( = ?auto_750323 ?auto_750326 ) ) ( not ( = ?auto_750323 ?auto_750327 ) ) ( not ( = ?auto_750323 ?auto_750328 ) ) ( not ( = ?auto_750323 ?auto_750329 ) ) ( not ( = ?auto_750323 ?auto_750330 ) ) ( not ( = ?auto_750323 ?auto_750331 ) ) ( not ( = ?auto_750323 ?auto_750332 ) ) ( not ( = ?auto_750323 ?auto_750333 ) ) ( not ( = ?auto_750324 ?auto_750325 ) ) ( not ( = ?auto_750324 ?auto_750326 ) ) ( not ( = ?auto_750324 ?auto_750327 ) ) ( not ( = ?auto_750324 ?auto_750328 ) ) ( not ( = ?auto_750324 ?auto_750329 ) ) ( not ( = ?auto_750324 ?auto_750330 ) ) ( not ( = ?auto_750324 ?auto_750331 ) ) ( not ( = ?auto_750324 ?auto_750332 ) ) ( not ( = ?auto_750324 ?auto_750333 ) ) ( not ( = ?auto_750325 ?auto_750326 ) ) ( not ( = ?auto_750325 ?auto_750327 ) ) ( not ( = ?auto_750325 ?auto_750328 ) ) ( not ( = ?auto_750325 ?auto_750329 ) ) ( not ( = ?auto_750325 ?auto_750330 ) ) ( not ( = ?auto_750325 ?auto_750331 ) ) ( not ( = ?auto_750325 ?auto_750332 ) ) ( not ( = ?auto_750325 ?auto_750333 ) ) ( not ( = ?auto_750326 ?auto_750327 ) ) ( not ( = ?auto_750326 ?auto_750328 ) ) ( not ( = ?auto_750326 ?auto_750329 ) ) ( not ( = ?auto_750326 ?auto_750330 ) ) ( not ( = ?auto_750326 ?auto_750331 ) ) ( not ( = ?auto_750326 ?auto_750332 ) ) ( not ( = ?auto_750326 ?auto_750333 ) ) ( not ( = ?auto_750327 ?auto_750328 ) ) ( not ( = ?auto_750327 ?auto_750329 ) ) ( not ( = ?auto_750327 ?auto_750330 ) ) ( not ( = ?auto_750327 ?auto_750331 ) ) ( not ( = ?auto_750327 ?auto_750332 ) ) ( not ( = ?auto_750327 ?auto_750333 ) ) ( not ( = ?auto_750328 ?auto_750329 ) ) ( not ( = ?auto_750328 ?auto_750330 ) ) ( not ( = ?auto_750328 ?auto_750331 ) ) ( not ( = ?auto_750328 ?auto_750332 ) ) ( not ( = ?auto_750328 ?auto_750333 ) ) ( not ( = ?auto_750329 ?auto_750330 ) ) ( not ( = ?auto_750329 ?auto_750331 ) ) ( not ( = ?auto_750329 ?auto_750332 ) ) ( not ( = ?auto_750329 ?auto_750333 ) ) ( not ( = ?auto_750330 ?auto_750331 ) ) ( not ( = ?auto_750330 ?auto_750332 ) ) ( not ( = ?auto_750330 ?auto_750333 ) ) ( not ( = ?auto_750331 ?auto_750332 ) ) ( not ( = ?auto_750331 ?auto_750333 ) ) ( not ( = ?auto_750332 ?auto_750333 ) ) ( ON ?auto_750331 ?auto_750332 ) ( ON ?auto_750330 ?auto_750331 ) ( ON ?auto_750329 ?auto_750330 ) ( CLEAR ?auto_750327 ) ( ON ?auto_750328 ?auto_750329 ) ( CLEAR ?auto_750328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_750322 ?auto_750323 ?auto_750324 ?auto_750325 ?auto_750326 ?auto_750327 ?auto_750328 )
      ( MAKE-11PILE ?auto_750322 ?auto_750323 ?auto_750324 ?auto_750325 ?auto_750326 ?auto_750327 ?auto_750328 ?auto_750329 ?auto_750330 ?auto_750331 ?auto_750332 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750368 - BLOCK
      ?auto_750369 - BLOCK
      ?auto_750370 - BLOCK
      ?auto_750371 - BLOCK
      ?auto_750372 - BLOCK
      ?auto_750373 - BLOCK
      ?auto_750374 - BLOCK
      ?auto_750375 - BLOCK
      ?auto_750376 - BLOCK
      ?auto_750377 - BLOCK
      ?auto_750378 - BLOCK
    )
    :vars
    (
      ?auto_750379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750378 ?auto_750379 ) ( ON-TABLE ?auto_750368 ) ( ON ?auto_750369 ?auto_750368 ) ( ON ?auto_750370 ?auto_750369 ) ( ON ?auto_750371 ?auto_750370 ) ( ON ?auto_750372 ?auto_750371 ) ( not ( = ?auto_750368 ?auto_750369 ) ) ( not ( = ?auto_750368 ?auto_750370 ) ) ( not ( = ?auto_750368 ?auto_750371 ) ) ( not ( = ?auto_750368 ?auto_750372 ) ) ( not ( = ?auto_750368 ?auto_750373 ) ) ( not ( = ?auto_750368 ?auto_750374 ) ) ( not ( = ?auto_750368 ?auto_750375 ) ) ( not ( = ?auto_750368 ?auto_750376 ) ) ( not ( = ?auto_750368 ?auto_750377 ) ) ( not ( = ?auto_750368 ?auto_750378 ) ) ( not ( = ?auto_750368 ?auto_750379 ) ) ( not ( = ?auto_750369 ?auto_750370 ) ) ( not ( = ?auto_750369 ?auto_750371 ) ) ( not ( = ?auto_750369 ?auto_750372 ) ) ( not ( = ?auto_750369 ?auto_750373 ) ) ( not ( = ?auto_750369 ?auto_750374 ) ) ( not ( = ?auto_750369 ?auto_750375 ) ) ( not ( = ?auto_750369 ?auto_750376 ) ) ( not ( = ?auto_750369 ?auto_750377 ) ) ( not ( = ?auto_750369 ?auto_750378 ) ) ( not ( = ?auto_750369 ?auto_750379 ) ) ( not ( = ?auto_750370 ?auto_750371 ) ) ( not ( = ?auto_750370 ?auto_750372 ) ) ( not ( = ?auto_750370 ?auto_750373 ) ) ( not ( = ?auto_750370 ?auto_750374 ) ) ( not ( = ?auto_750370 ?auto_750375 ) ) ( not ( = ?auto_750370 ?auto_750376 ) ) ( not ( = ?auto_750370 ?auto_750377 ) ) ( not ( = ?auto_750370 ?auto_750378 ) ) ( not ( = ?auto_750370 ?auto_750379 ) ) ( not ( = ?auto_750371 ?auto_750372 ) ) ( not ( = ?auto_750371 ?auto_750373 ) ) ( not ( = ?auto_750371 ?auto_750374 ) ) ( not ( = ?auto_750371 ?auto_750375 ) ) ( not ( = ?auto_750371 ?auto_750376 ) ) ( not ( = ?auto_750371 ?auto_750377 ) ) ( not ( = ?auto_750371 ?auto_750378 ) ) ( not ( = ?auto_750371 ?auto_750379 ) ) ( not ( = ?auto_750372 ?auto_750373 ) ) ( not ( = ?auto_750372 ?auto_750374 ) ) ( not ( = ?auto_750372 ?auto_750375 ) ) ( not ( = ?auto_750372 ?auto_750376 ) ) ( not ( = ?auto_750372 ?auto_750377 ) ) ( not ( = ?auto_750372 ?auto_750378 ) ) ( not ( = ?auto_750372 ?auto_750379 ) ) ( not ( = ?auto_750373 ?auto_750374 ) ) ( not ( = ?auto_750373 ?auto_750375 ) ) ( not ( = ?auto_750373 ?auto_750376 ) ) ( not ( = ?auto_750373 ?auto_750377 ) ) ( not ( = ?auto_750373 ?auto_750378 ) ) ( not ( = ?auto_750373 ?auto_750379 ) ) ( not ( = ?auto_750374 ?auto_750375 ) ) ( not ( = ?auto_750374 ?auto_750376 ) ) ( not ( = ?auto_750374 ?auto_750377 ) ) ( not ( = ?auto_750374 ?auto_750378 ) ) ( not ( = ?auto_750374 ?auto_750379 ) ) ( not ( = ?auto_750375 ?auto_750376 ) ) ( not ( = ?auto_750375 ?auto_750377 ) ) ( not ( = ?auto_750375 ?auto_750378 ) ) ( not ( = ?auto_750375 ?auto_750379 ) ) ( not ( = ?auto_750376 ?auto_750377 ) ) ( not ( = ?auto_750376 ?auto_750378 ) ) ( not ( = ?auto_750376 ?auto_750379 ) ) ( not ( = ?auto_750377 ?auto_750378 ) ) ( not ( = ?auto_750377 ?auto_750379 ) ) ( not ( = ?auto_750378 ?auto_750379 ) ) ( ON ?auto_750377 ?auto_750378 ) ( ON ?auto_750376 ?auto_750377 ) ( ON ?auto_750375 ?auto_750376 ) ( ON ?auto_750374 ?auto_750375 ) ( CLEAR ?auto_750372 ) ( ON ?auto_750373 ?auto_750374 ) ( CLEAR ?auto_750373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_750368 ?auto_750369 ?auto_750370 ?auto_750371 ?auto_750372 ?auto_750373 )
      ( MAKE-11PILE ?auto_750368 ?auto_750369 ?auto_750370 ?auto_750371 ?auto_750372 ?auto_750373 ?auto_750374 ?auto_750375 ?auto_750376 ?auto_750377 ?auto_750378 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750414 - BLOCK
      ?auto_750415 - BLOCK
      ?auto_750416 - BLOCK
      ?auto_750417 - BLOCK
      ?auto_750418 - BLOCK
      ?auto_750419 - BLOCK
      ?auto_750420 - BLOCK
      ?auto_750421 - BLOCK
      ?auto_750422 - BLOCK
      ?auto_750423 - BLOCK
      ?auto_750424 - BLOCK
    )
    :vars
    (
      ?auto_750425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750424 ?auto_750425 ) ( ON-TABLE ?auto_750414 ) ( ON ?auto_750415 ?auto_750414 ) ( ON ?auto_750416 ?auto_750415 ) ( ON ?auto_750417 ?auto_750416 ) ( not ( = ?auto_750414 ?auto_750415 ) ) ( not ( = ?auto_750414 ?auto_750416 ) ) ( not ( = ?auto_750414 ?auto_750417 ) ) ( not ( = ?auto_750414 ?auto_750418 ) ) ( not ( = ?auto_750414 ?auto_750419 ) ) ( not ( = ?auto_750414 ?auto_750420 ) ) ( not ( = ?auto_750414 ?auto_750421 ) ) ( not ( = ?auto_750414 ?auto_750422 ) ) ( not ( = ?auto_750414 ?auto_750423 ) ) ( not ( = ?auto_750414 ?auto_750424 ) ) ( not ( = ?auto_750414 ?auto_750425 ) ) ( not ( = ?auto_750415 ?auto_750416 ) ) ( not ( = ?auto_750415 ?auto_750417 ) ) ( not ( = ?auto_750415 ?auto_750418 ) ) ( not ( = ?auto_750415 ?auto_750419 ) ) ( not ( = ?auto_750415 ?auto_750420 ) ) ( not ( = ?auto_750415 ?auto_750421 ) ) ( not ( = ?auto_750415 ?auto_750422 ) ) ( not ( = ?auto_750415 ?auto_750423 ) ) ( not ( = ?auto_750415 ?auto_750424 ) ) ( not ( = ?auto_750415 ?auto_750425 ) ) ( not ( = ?auto_750416 ?auto_750417 ) ) ( not ( = ?auto_750416 ?auto_750418 ) ) ( not ( = ?auto_750416 ?auto_750419 ) ) ( not ( = ?auto_750416 ?auto_750420 ) ) ( not ( = ?auto_750416 ?auto_750421 ) ) ( not ( = ?auto_750416 ?auto_750422 ) ) ( not ( = ?auto_750416 ?auto_750423 ) ) ( not ( = ?auto_750416 ?auto_750424 ) ) ( not ( = ?auto_750416 ?auto_750425 ) ) ( not ( = ?auto_750417 ?auto_750418 ) ) ( not ( = ?auto_750417 ?auto_750419 ) ) ( not ( = ?auto_750417 ?auto_750420 ) ) ( not ( = ?auto_750417 ?auto_750421 ) ) ( not ( = ?auto_750417 ?auto_750422 ) ) ( not ( = ?auto_750417 ?auto_750423 ) ) ( not ( = ?auto_750417 ?auto_750424 ) ) ( not ( = ?auto_750417 ?auto_750425 ) ) ( not ( = ?auto_750418 ?auto_750419 ) ) ( not ( = ?auto_750418 ?auto_750420 ) ) ( not ( = ?auto_750418 ?auto_750421 ) ) ( not ( = ?auto_750418 ?auto_750422 ) ) ( not ( = ?auto_750418 ?auto_750423 ) ) ( not ( = ?auto_750418 ?auto_750424 ) ) ( not ( = ?auto_750418 ?auto_750425 ) ) ( not ( = ?auto_750419 ?auto_750420 ) ) ( not ( = ?auto_750419 ?auto_750421 ) ) ( not ( = ?auto_750419 ?auto_750422 ) ) ( not ( = ?auto_750419 ?auto_750423 ) ) ( not ( = ?auto_750419 ?auto_750424 ) ) ( not ( = ?auto_750419 ?auto_750425 ) ) ( not ( = ?auto_750420 ?auto_750421 ) ) ( not ( = ?auto_750420 ?auto_750422 ) ) ( not ( = ?auto_750420 ?auto_750423 ) ) ( not ( = ?auto_750420 ?auto_750424 ) ) ( not ( = ?auto_750420 ?auto_750425 ) ) ( not ( = ?auto_750421 ?auto_750422 ) ) ( not ( = ?auto_750421 ?auto_750423 ) ) ( not ( = ?auto_750421 ?auto_750424 ) ) ( not ( = ?auto_750421 ?auto_750425 ) ) ( not ( = ?auto_750422 ?auto_750423 ) ) ( not ( = ?auto_750422 ?auto_750424 ) ) ( not ( = ?auto_750422 ?auto_750425 ) ) ( not ( = ?auto_750423 ?auto_750424 ) ) ( not ( = ?auto_750423 ?auto_750425 ) ) ( not ( = ?auto_750424 ?auto_750425 ) ) ( ON ?auto_750423 ?auto_750424 ) ( ON ?auto_750422 ?auto_750423 ) ( ON ?auto_750421 ?auto_750422 ) ( ON ?auto_750420 ?auto_750421 ) ( ON ?auto_750419 ?auto_750420 ) ( CLEAR ?auto_750417 ) ( ON ?auto_750418 ?auto_750419 ) ( CLEAR ?auto_750418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_750414 ?auto_750415 ?auto_750416 ?auto_750417 ?auto_750418 )
      ( MAKE-11PILE ?auto_750414 ?auto_750415 ?auto_750416 ?auto_750417 ?auto_750418 ?auto_750419 ?auto_750420 ?auto_750421 ?auto_750422 ?auto_750423 ?auto_750424 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750460 - BLOCK
      ?auto_750461 - BLOCK
      ?auto_750462 - BLOCK
      ?auto_750463 - BLOCK
      ?auto_750464 - BLOCK
      ?auto_750465 - BLOCK
      ?auto_750466 - BLOCK
      ?auto_750467 - BLOCK
      ?auto_750468 - BLOCK
      ?auto_750469 - BLOCK
      ?auto_750470 - BLOCK
    )
    :vars
    (
      ?auto_750471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750470 ?auto_750471 ) ( ON-TABLE ?auto_750460 ) ( ON ?auto_750461 ?auto_750460 ) ( ON ?auto_750462 ?auto_750461 ) ( not ( = ?auto_750460 ?auto_750461 ) ) ( not ( = ?auto_750460 ?auto_750462 ) ) ( not ( = ?auto_750460 ?auto_750463 ) ) ( not ( = ?auto_750460 ?auto_750464 ) ) ( not ( = ?auto_750460 ?auto_750465 ) ) ( not ( = ?auto_750460 ?auto_750466 ) ) ( not ( = ?auto_750460 ?auto_750467 ) ) ( not ( = ?auto_750460 ?auto_750468 ) ) ( not ( = ?auto_750460 ?auto_750469 ) ) ( not ( = ?auto_750460 ?auto_750470 ) ) ( not ( = ?auto_750460 ?auto_750471 ) ) ( not ( = ?auto_750461 ?auto_750462 ) ) ( not ( = ?auto_750461 ?auto_750463 ) ) ( not ( = ?auto_750461 ?auto_750464 ) ) ( not ( = ?auto_750461 ?auto_750465 ) ) ( not ( = ?auto_750461 ?auto_750466 ) ) ( not ( = ?auto_750461 ?auto_750467 ) ) ( not ( = ?auto_750461 ?auto_750468 ) ) ( not ( = ?auto_750461 ?auto_750469 ) ) ( not ( = ?auto_750461 ?auto_750470 ) ) ( not ( = ?auto_750461 ?auto_750471 ) ) ( not ( = ?auto_750462 ?auto_750463 ) ) ( not ( = ?auto_750462 ?auto_750464 ) ) ( not ( = ?auto_750462 ?auto_750465 ) ) ( not ( = ?auto_750462 ?auto_750466 ) ) ( not ( = ?auto_750462 ?auto_750467 ) ) ( not ( = ?auto_750462 ?auto_750468 ) ) ( not ( = ?auto_750462 ?auto_750469 ) ) ( not ( = ?auto_750462 ?auto_750470 ) ) ( not ( = ?auto_750462 ?auto_750471 ) ) ( not ( = ?auto_750463 ?auto_750464 ) ) ( not ( = ?auto_750463 ?auto_750465 ) ) ( not ( = ?auto_750463 ?auto_750466 ) ) ( not ( = ?auto_750463 ?auto_750467 ) ) ( not ( = ?auto_750463 ?auto_750468 ) ) ( not ( = ?auto_750463 ?auto_750469 ) ) ( not ( = ?auto_750463 ?auto_750470 ) ) ( not ( = ?auto_750463 ?auto_750471 ) ) ( not ( = ?auto_750464 ?auto_750465 ) ) ( not ( = ?auto_750464 ?auto_750466 ) ) ( not ( = ?auto_750464 ?auto_750467 ) ) ( not ( = ?auto_750464 ?auto_750468 ) ) ( not ( = ?auto_750464 ?auto_750469 ) ) ( not ( = ?auto_750464 ?auto_750470 ) ) ( not ( = ?auto_750464 ?auto_750471 ) ) ( not ( = ?auto_750465 ?auto_750466 ) ) ( not ( = ?auto_750465 ?auto_750467 ) ) ( not ( = ?auto_750465 ?auto_750468 ) ) ( not ( = ?auto_750465 ?auto_750469 ) ) ( not ( = ?auto_750465 ?auto_750470 ) ) ( not ( = ?auto_750465 ?auto_750471 ) ) ( not ( = ?auto_750466 ?auto_750467 ) ) ( not ( = ?auto_750466 ?auto_750468 ) ) ( not ( = ?auto_750466 ?auto_750469 ) ) ( not ( = ?auto_750466 ?auto_750470 ) ) ( not ( = ?auto_750466 ?auto_750471 ) ) ( not ( = ?auto_750467 ?auto_750468 ) ) ( not ( = ?auto_750467 ?auto_750469 ) ) ( not ( = ?auto_750467 ?auto_750470 ) ) ( not ( = ?auto_750467 ?auto_750471 ) ) ( not ( = ?auto_750468 ?auto_750469 ) ) ( not ( = ?auto_750468 ?auto_750470 ) ) ( not ( = ?auto_750468 ?auto_750471 ) ) ( not ( = ?auto_750469 ?auto_750470 ) ) ( not ( = ?auto_750469 ?auto_750471 ) ) ( not ( = ?auto_750470 ?auto_750471 ) ) ( ON ?auto_750469 ?auto_750470 ) ( ON ?auto_750468 ?auto_750469 ) ( ON ?auto_750467 ?auto_750468 ) ( ON ?auto_750466 ?auto_750467 ) ( ON ?auto_750465 ?auto_750466 ) ( ON ?auto_750464 ?auto_750465 ) ( CLEAR ?auto_750462 ) ( ON ?auto_750463 ?auto_750464 ) ( CLEAR ?auto_750463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_750460 ?auto_750461 ?auto_750462 ?auto_750463 )
      ( MAKE-11PILE ?auto_750460 ?auto_750461 ?auto_750462 ?auto_750463 ?auto_750464 ?auto_750465 ?auto_750466 ?auto_750467 ?auto_750468 ?auto_750469 ?auto_750470 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750506 - BLOCK
      ?auto_750507 - BLOCK
      ?auto_750508 - BLOCK
      ?auto_750509 - BLOCK
      ?auto_750510 - BLOCK
      ?auto_750511 - BLOCK
      ?auto_750512 - BLOCK
      ?auto_750513 - BLOCK
      ?auto_750514 - BLOCK
      ?auto_750515 - BLOCK
      ?auto_750516 - BLOCK
    )
    :vars
    (
      ?auto_750517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750516 ?auto_750517 ) ( ON-TABLE ?auto_750506 ) ( ON ?auto_750507 ?auto_750506 ) ( not ( = ?auto_750506 ?auto_750507 ) ) ( not ( = ?auto_750506 ?auto_750508 ) ) ( not ( = ?auto_750506 ?auto_750509 ) ) ( not ( = ?auto_750506 ?auto_750510 ) ) ( not ( = ?auto_750506 ?auto_750511 ) ) ( not ( = ?auto_750506 ?auto_750512 ) ) ( not ( = ?auto_750506 ?auto_750513 ) ) ( not ( = ?auto_750506 ?auto_750514 ) ) ( not ( = ?auto_750506 ?auto_750515 ) ) ( not ( = ?auto_750506 ?auto_750516 ) ) ( not ( = ?auto_750506 ?auto_750517 ) ) ( not ( = ?auto_750507 ?auto_750508 ) ) ( not ( = ?auto_750507 ?auto_750509 ) ) ( not ( = ?auto_750507 ?auto_750510 ) ) ( not ( = ?auto_750507 ?auto_750511 ) ) ( not ( = ?auto_750507 ?auto_750512 ) ) ( not ( = ?auto_750507 ?auto_750513 ) ) ( not ( = ?auto_750507 ?auto_750514 ) ) ( not ( = ?auto_750507 ?auto_750515 ) ) ( not ( = ?auto_750507 ?auto_750516 ) ) ( not ( = ?auto_750507 ?auto_750517 ) ) ( not ( = ?auto_750508 ?auto_750509 ) ) ( not ( = ?auto_750508 ?auto_750510 ) ) ( not ( = ?auto_750508 ?auto_750511 ) ) ( not ( = ?auto_750508 ?auto_750512 ) ) ( not ( = ?auto_750508 ?auto_750513 ) ) ( not ( = ?auto_750508 ?auto_750514 ) ) ( not ( = ?auto_750508 ?auto_750515 ) ) ( not ( = ?auto_750508 ?auto_750516 ) ) ( not ( = ?auto_750508 ?auto_750517 ) ) ( not ( = ?auto_750509 ?auto_750510 ) ) ( not ( = ?auto_750509 ?auto_750511 ) ) ( not ( = ?auto_750509 ?auto_750512 ) ) ( not ( = ?auto_750509 ?auto_750513 ) ) ( not ( = ?auto_750509 ?auto_750514 ) ) ( not ( = ?auto_750509 ?auto_750515 ) ) ( not ( = ?auto_750509 ?auto_750516 ) ) ( not ( = ?auto_750509 ?auto_750517 ) ) ( not ( = ?auto_750510 ?auto_750511 ) ) ( not ( = ?auto_750510 ?auto_750512 ) ) ( not ( = ?auto_750510 ?auto_750513 ) ) ( not ( = ?auto_750510 ?auto_750514 ) ) ( not ( = ?auto_750510 ?auto_750515 ) ) ( not ( = ?auto_750510 ?auto_750516 ) ) ( not ( = ?auto_750510 ?auto_750517 ) ) ( not ( = ?auto_750511 ?auto_750512 ) ) ( not ( = ?auto_750511 ?auto_750513 ) ) ( not ( = ?auto_750511 ?auto_750514 ) ) ( not ( = ?auto_750511 ?auto_750515 ) ) ( not ( = ?auto_750511 ?auto_750516 ) ) ( not ( = ?auto_750511 ?auto_750517 ) ) ( not ( = ?auto_750512 ?auto_750513 ) ) ( not ( = ?auto_750512 ?auto_750514 ) ) ( not ( = ?auto_750512 ?auto_750515 ) ) ( not ( = ?auto_750512 ?auto_750516 ) ) ( not ( = ?auto_750512 ?auto_750517 ) ) ( not ( = ?auto_750513 ?auto_750514 ) ) ( not ( = ?auto_750513 ?auto_750515 ) ) ( not ( = ?auto_750513 ?auto_750516 ) ) ( not ( = ?auto_750513 ?auto_750517 ) ) ( not ( = ?auto_750514 ?auto_750515 ) ) ( not ( = ?auto_750514 ?auto_750516 ) ) ( not ( = ?auto_750514 ?auto_750517 ) ) ( not ( = ?auto_750515 ?auto_750516 ) ) ( not ( = ?auto_750515 ?auto_750517 ) ) ( not ( = ?auto_750516 ?auto_750517 ) ) ( ON ?auto_750515 ?auto_750516 ) ( ON ?auto_750514 ?auto_750515 ) ( ON ?auto_750513 ?auto_750514 ) ( ON ?auto_750512 ?auto_750513 ) ( ON ?auto_750511 ?auto_750512 ) ( ON ?auto_750510 ?auto_750511 ) ( ON ?auto_750509 ?auto_750510 ) ( CLEAR ?auto_750507 ) ( ON ?auto_750508 ?auto_750509 ) ( CLEAR ?auto_750508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_750506 ?auto_750507 ?auto_750508 )
      ( MAKE-11PILE ?auto_750506 ?auto_750507 ?auto_750508 ?auto_750509 ?auto_750510 ?auto_750511 ?auto_750512 ?auto_750513 ?auto_750514 ?auto_750515 ?auto_750516 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750552 - BLOCK
      ?auto_750553 - BLOCK
      ?auto_750554 - BLOCK
      ?auto_750555 - BLOCK
      ?auto_750556 - BLOCK
      ?auto_750557 - BLOCK
      ?auto_750558 - BLOCK
      ?auto_750559 - BLOCK
      ?auto_750560 - BLOCK
      ?auto_750561 - BLOCK
      ?auto_750562 - BLOCK
    )
    :vars
    (
      ?auto_750563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750562 ?auto_750563 ) ( ON-TABLE ?auto_750552 ) ( not ( = ?auto_750552 ?auto_750553 ) ) ( not ( = ?auto_750552 ?auto_750554 ) ) ( not ( = ?auto_750552 ?auto_750555 ) ) ( not ( = ?auto_750552 ?auto_750556 ) ) ( not ( = ?auto_750552 ?auto_750557 ) ) ( not ( = ?auto_750552 ?auto_750558 ) ) ( not ( = ?auto_750552 ?auto_750559 ) ) ( not ( = ?auto_750552 ?auto_750560 ) ) ( not ( = ?auto_750552 ?auto_750561 ) ) ( not ( = ?auto_750552 ?auto_750562 ) ) ( not ( = ?auto_750552 ?auto_750563 ) ) ( not ( = ?auto_750553 ?auto_750554 ) ) ( not ( = ?auto_750553 ?auto_750555 ) ) ( not ( = ?auto_750553 ?auto_750556 ) ) ( not ( = ?auto_750553 ?auto_750557 ) ) ( not ( = ?auto_750553 ?auto_750558 ) ) ( not ( = ?auto_750553 ?auto_750559 ) ) ( not ( = ?auto_750553 ?auto_750560 ) ) ( not ( = ?auto_750553 ?auto_750561 ) ) ( not ( = ?auto_750553 ?auto_750562 ) ) ( not ( = ?auto_750553 ?auto_750563 ) ) ( not ( = ?auto_750554 ?auto_750555 ) ) ( not ( = ?auto_750554 ?auto_750556 ) ) ( not ( = ?auto_750554 ?auto_750557 ) ) ( not ( = ?auto_750554 ?auto_750558 ) ) ( not ( = ?auto_750554 ?auto_750559 ) ) ( not ( = ?auto_750554 ?auto_750560 ) ) ( not ( = ?auto_750554 ?auto_750561 ) ) ( not ( = ?auto_750554 ?auto_750562 ) ) ( not ( = ?auto_750554 ?auto_750563 ) ) ( not ( = ?auto_750555 ?auto_750556 ) ) ( not ( = ?auto_750555 ?auto_750557 ) ) ( not ( = ?auto_750555 ?auto_750558 ) ) ( not ( = ?auto_750555 ?auto_750559 ) ) ( not ( = ?auto_750555 ?auto_750560 ) ) ( not ( = ?auto_750555 ?auto_750561 ) ) ( not ( = ?auto_750555 ?auto_750562 ) ) ( not ( = ?auto_750555 ?auto_750563 ) ) ( not ( = ?auto_750556 ?auto_750557 ) ) ( not ( = ?auto_750556 ?auto_750558 ) ) ( not ( = ?auto_750556 ?auto_750559 ) ) ( not ( = ?auto_750556 ?auto_750560 ) ) ( not ( = ?auto_750556 ?auto_750561 ) ) ( not ( = ?auto_750556 ?auto_750562 ) ) ( not ( = ?auto_750556 ?auto_750563 ) ) ( not ( = ?auto_750557 ?auto_750558 ) ) ( not ( = ?auto_750557 ?auto_750559 ) ) ( not ( = ?auto_750557 ?auto_750560 ) ) ( not ( = ?auto_750557 ?auto_750561 ) ) ( not ( = ?auto_750557 ?auto_750562 ) ) ( not ( = ?auto_750557 ?auto_750563 ) ) ( not ( = ?auto_750558 ?auto_750559 ) ) ( not ( = ?auto_750558 ?auto_750560 ) ) ( not ( = ?auto_750558 ?auto_750561 ) ) ( not ( = ?auto_750558 ?auto_750562 ) ) ( not ( = ?auto_750558 ?auto_750563 ) ) ( not ( = ?auto_750559 ?auto_750560 ) ) ( not ( = ?auto_750559 ?auto_750561 ) ) ( not ( = ?auto_750559 ?auto_750562 ) ) ( not ( = ?auto_750559 ?auto_750563 ) ) ( not ( = ?auto_750560 ?auto_750561 ) ) ( not ( = ?auto_750560 ?auto_750562 ) ) ( not ( = ?auto_750560 ?auto_750563 ) ) ( not ( = ?auto_750561 ?auto_750562 ) ) ( not ( = ?auto_750561 ?auto_750563 ) ) ( not ( = ?auto_750562 ?auto_750563 ) ) ( ON ?auto_750561 ?auto_750562 ) ( ON ?auto_750560 ?auto_750561 ) ( ON ?auto_750559 ?auto_750560 ) ( ON ?auto_750558 ?auto_750559 ) ( ON ?auto_750557 ?auto_750558 ) ( ON ?auto_750556 ?auto_750557 ) ( ON ?auto_750555 ?auto_750556 ) ( ON ?auto_750554 ?auto_750555 ) ( CLEAR ?auto_750552 ) ( ON ?auto_750553 ?auto_750554 ) ( CLEAR ?auto_750553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_750552 ?auto_750553 )
      ( MAKE-11PILE ?auto_750552 ?auto_750553 ?auto_750554 ?auto_750555 ?auto_750556 ?auto_750557 ?auto_750558 ?auto_750559 ?auto_750560 ?auto_750561 ?auto_750562 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_750598 - BLOCK
      ?auto_750599 - BLOCK
      ?auto_750600 - BLOCK
      ?auto_750601 - BLOCK
      ?auto_750602 - BLOCK
      ?auto_750603 - BLOCK
      ?auto_750604 - BLOCK
      ?auto_750605 - BLOCK
      ?auto_750606 - BLOCK
      ?auto_750607 - BLOCK
      ?auto_750608 - BLOCK
    )
    :vars
    (
      ?auto_750609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750608 ?auto_750609 ) ( not ( = ?auto_750598 ?auto_750599 ) ) ( not ( = ?auto_750598 ?auto_750600 ) ) ( not ( = ?auto_750598 ?auto_750601 ) ) ( not ( = ?auto_750598 ?auto_750602 ) ) ( not ( = ?auto_750598 ?auto_750603 ) ) ( not ( = ?auto_750598 ?auto_750604 ) ) ( not ( = ?auto_750598 ?auto_750605 ) ) ( not ( = ?auto_750598 ?auto_750606 ) ) ( not ( = ?auto_750598 ?auto_750607 ) ) ( not ( = ?auto_750598 ?auto_750608 ) ) ( not ( = ?auto_750598 ?auto_750609 ) ) ( not ( = ?auto_750599 ?auto_750600 ) ) ( not ( = ?auto_750599 ?auto_750601 ) ) ( not ( = ?auto_750599 ?auto_750602 ) ) ( not ( = ?auto_750599 ?auto_750603 ) ) ( not ( = ?auto_750599 ?auto_750604 ) ) ( not ( = ?auto_750599 ?auto_750605 ) ) ( not ( = ?auto_750599 ?auto_750606 ) ) ( not ( = ?auto_750599 ?auto_750607 ) ) ( not ( = ?auto_750599 ?auto_750608 ) ) ( not ( = ?auto_750599 ?auto_750609 ) ) ( not ( = ?auto_750600 ?auto_750601 ) ) ( not ( = ?auto_750600 ?auto_750602 ) ) ( not ( = ?auto_750600 ?auto_750603 ) ) ( not ( = ?auto_750600 ?auto_750604 ) ) ( not ( = ?auto_750600 ?auto_750605 ) ) ( not ( = ?auto_750600 ?auto_750606 ) ) ( not ( = ?auto_750600 ?auto_750607 ) ) ( not ( = ?auto_750600 ?auto_750608 ) ) ( not ( = ?auto_750600 ?auto_750609 ) ) ( not ( = ?auto_750601 ?auto_750602 ) ) ( not ( = ?auto_750601 ?auto_750603 ) ) ( not ( = ?auto_750601 ?auto_750604 ) ) ( not ( = ?auto_750601 ?auto_750605 ) ) ( not ( = ?auto_750601 ?auto_750606 ) ) ( not ( = ?auto_750601 ?auto_750607 ) ) ( not ( = ?auto_750601 ?auto_750608 ) ) ( not ( = ?auto_750601 ?auto_750609 ) ) ( not ( = ?auto_750602 ?auto_750603 ) ) ( not ( = ?auto_750602 ?auto_750604 ) ) ( not ( = ?auto_750602 ?auto_750605 ) ) ( not ( = ?auto_750602 ?auto_750606 ) ) ( not ( = ?auto_750602 ?auto_750607 ) ) ( not ( = ?auto_750602 ?auto_750608 ) ) ( not ( = ?auto_750602 ?auto_750609 ) ) ( not ( = ?auto_750603 ?auto_750604 ) ) ( not ( = ?auto_750603 ?auto_750605 ) ) ( not ( = ?auto_750603 ?auto_750606 ) ) ( not ( = ?auto_750603 ?auto_750607 ) ) ( not ( = ?auto_750603 ?auto_750608 ) ) ( not ( = ?auto_750603 ?auto_750609 ) ) ( not ( = ?auto_750604 ?auto_750605 ) ) ( not ( = ?auto_750604 ?auto_750606 ) ) ( not ( = ?auto_750604 ?auto_750607 ) ) ( not ( = ?auto_750604 ?auto_750608 ) ) ( not ( = ?auto_750604 ?auto_750609 ) ) ( not ( = ?auto_750605 ?auto_750606 ) ) ( not ( = ?auto_750605 ?auto_750607 ) ) ( not ( = ?auto_750605 ?auto_750608 ) ) ( not ( = ?auto_750605 ?auto_750609 ) ) ( not ( = ?auto_750606 ?auto_750607 ) ) ( not ( = ?auto_750606 ?auto_750608 ) ) ( not ( = ?auto_750606 ?auto_750609 ) ) ( not ( = ?auto_750607 ?auto_750608 ) ) ( not ( = ?auto_750607 ?auto_750609 ) ) ( not ( = ?auto_750608 ?auto_750609 ) ) ( ON ?auto_750607 ?auto_750608 ) ( ON ?auto_750606 ?auto_750607 ) ( ON ?auto_750605 ?auto_750606 ) ( ON ?auto_750604 ?auto_750605 ) ( ON ?auto_750603 ?auto_750604 ) ( ON ?auto_750602 ?auto_750603 ) ( ON ?auto_750601 ?auto_750602 ) ( ON ?auto_750600 ?auto_750601 ) ( ON ?auto_750599 ?auto_750600 ) ( ON ?auto_750598 ?auto_750599 ) ( CLEAR ?auto_750598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_750598 )
      ( MAKE-11PILE ?auto_750598 ?auto_750599 ?auto_750600 ?auto_750601 ?auto_750602 ?auto_750603 ?auto_750604 ?auto_750605 ?auto_750606 ?auto_750607 ?auto_750608 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750645 - BLOCK
      ?auto_750646 - BLOCK
      ?auto_750647 - BLOCK
      ?auto_750648 - BLOCK
      ?auto_750649 - BLOCK
      ?auto_750650 - BLOCK
      ?auto_750651 - BLOCK
      ?auto_750652 - BLOCK
      ?auto_750653 - BLOCK
      ?auto_750654 - BLOCK
      ?auto_750655 - BLOCK
      ?auto_750656 - BLOCK
    )
    :vars
    (
      ?auto_750657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_750655 ) ( ON ?auto_750656 ?auto_750657 ) ( CLEAR ?auto_750656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_750645 ) ( ON ?auto_750646 ?auto_750645 ) ( ON ?auto_750647 ?auto_750646 ) ( ON ?auto_750648 ?auto_750647 ) ( ON ?auto_750649 ?auto_750648 ) ( ON ?auto_750650 ?auto_750649 ) ( ON ?auto_750651 ?auto_750650 ) ( ON ?auto_750652 ?auto_750651 ) ( ON ?auto_750653 ?auto_750652 ) ( ON ?auto_750654 ?auto_750653 ) ( ON ?auto_750655 ?auto_750654 ) ( not ( = ?auto_750645 ?auto_750646 ) ) ( not ( = ?auto_750645 ?auto_750647 ) ) ( not ( = ?auto_750645 ?auto_750648 ) ) ( not ( = ?auto_750645 ?auto_750649 ) ) ( not ( = ?auto_750645 ?auto_750650 ) ) ( not ( = ?auto_750645 ?auto_750651 ) ) ( not ( = ?auto_750645 ?auto_750652 ) ) ( not ( = ?auto_750645 ?auto_750653 ) ) ( not ( = ?auto_750645 ?auto_750654 ) ) ( not ( = ?auto_750645 ?auto_750655 ) ) ( not ( = ?auto_750645 ?auto_750656 ) ) ( not ( = ?auto_750645 ?auto_750657 ) ) ( not ( = ?auto_750646 ?auto_750647 ) ) ( not ( = ?auto_750646 ?auto_750648 ) ) ( not ( = ?auto_750646 ?auto_750649 ) ) ( not ( = ?auto_750646 ?auto_750650 ) ) ( not ( = ?auto_750646 ?auto_750651 ) ) ( not ( = ?auto_750646 ?auto_750652 ) ) ( not ( = ?auto_750646 ?auto_750653 ) ) ( not ( = ?auto_750646 ?auto_750654 ) ) ( not ( = ?auto_750646 ?auto_750655 ) ) ( not ( = ?auto_750646 ?auto_750656 ) ) ( not ( = ?auto_750646 ?auto_750657 ) ) ( not ( = ?auto_750647 ?auto_750648 ) ) ( not ( = ?auto_750647 ?auto_750649 ) ) ( not ( = ?auto_750647 ?auto_750650 ) ) ( not ( = ?auto_750647 ?auto_750651 ) ) ( not ( = ?auto_750647 ?auto_750652 ) ) ( not ( = ?auto_750647 ?auto_750653 ) ) ( not ( = ?auto_750647 ?auto_750654 ) ) ( not ( = ?auto_750647 ?auto_750655 ) ) ( not ( = ?auto_750647 ?auto_750656 ) ) ( not ( = ?auto_750647 ?auto_750657 ) ) ( not ( = ?auto_750648 ?auto_750649 ) ) ( not ( = ?auto_750648 ?auto_750650 ) ) ( not ( = ?auto_750648 ?auto_750651 ) ) ( not ( = ?auto_750648 ?auto_750652 ) ) ( not ( = ?auto_750648 ?auto_750653 ) ) ( not ( = ?auto_750648 ?auto_750654 ) ) ( not ( = ?auto_750648 ?auto_750655 ) ) ( not ( = ?auto_750648 ?auto_750656 ) ) ( not ( = ?auto_750648 ?auto_750657 ) ) ( not ( = ?auto_750649 ?auto_750650 ) ) ( not ( = ?auto_750649 ?auto_750651 ) ) ( not ( = ?auto_750649 ?auto_750652 ) ) ( not ( = ?auto_750649 ?auto_750653 ) ) ( not ( = ?auto_750649 ?auto_750654 ) ) ( not ( = ?auto_750649 ?auto_750655 ) ) ( not ( = ?auto_750649 ?auto_750656 ) ) ( not ( = ?auto_750649 ?auto_750657 ) ) ( not ( = ?auto_750650 ?auto_750651 ) ) ( not ( = ?auto_750650 ?auto_750652 ) ) ( not ( = ?auto_750650 ?auto_750653 ) ) ( not ( = ?auto_750650 ?auto_750654 ) ) ( not ( = ?auto_750650 ?auto_750655 ) ) ( not ( = ?auto_750650 ?auto_750656 ) ) ( not ( = ?auto_750650 ?auto_750657 ) ) ( not ( = ?auto_750651 ?auto_750652 ) ) ( not ( = ?auto_750651 ?auto_750653 ) ) ( not ( = ?auto_750651 ?auto_750654 ) ) ( not ( = ?auto_750651 ?auto_750655 ) ) ( not ( = ?auto_750651 ?auto_750656 ) ) ( not ( = ?auto_750651 ?auto_750657 ) ) ( not ( = ?auto_750652 ?auto_750653 ) ) ( not ( = ?auto_750652 ?auto_750654 ) ) ( not ( = ?auto_750652 ?auto_750655 ) ) ( not ( = ?auto_750652 ?auto_750656 ) ) ( not ( = ?auto_750652 ?auto_750657 ) ) ( not ( = ?auto_750653 ?auto_750654 ) ) ( not ( = ?auto_750653 ?auto_750655 ) ) ( not ( = ?auto_750653 ?auto_750656 ) ) ( not ( = ?auto_750653 ?auto_750657 ) ) ( not ( = ?auto_750654 ?auto_750655 ) ) ( not ( = ?auto_750654 ?auto_750656 ) ) ( not ( = ?auto_750654 ?auto_750657 ) ) ( not ( = ?auto_750655 ?auto_750656 ) ) ( not ( = ?auto_750655 ?auto_750657 ) ) ( not ( = ?auto_750656 ?auto_750657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_750656 ?auto_750657 )
      ( !STACK ?auto_750656 ?auto_750655 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750695 - BLOCK
      ?auto_750696 - BLOCK
      ?auto_750697 - BLOCK
      ?auto_750698 - BLOCK
      ?auto_750699 - BLOCK
      ?auto_750700 - BLOCK
      ?auto_750701 - BLOCK
      ?auto_750702 - BLOCK
      ?auto_750703 - BLOCK
      ?auto_750704 - BLOCK
      ?auto_750705 - BLOCK
      ?auto_750706 - BLOCK
    )
    :vars
    (
      ?auto_750707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750706 ?auto_750707 ) ( ON-TABLE ?auto_750695 ) ( ON ?auto_750696 ?auto_750695 ) ( ON ?auto_750697 ?auto_750696 ) ( ON ?auto_750698 ?auto_750697 ) ( ON ?auto_750699 ?auto_750698 ) ( ON ?auto_750700 ?auto_750699 ) ( ON ?auto_750701 ?auto_750700 ) ( ON ?auto_750702 ?auto_750701 ) ( ON ?auto_750703 ?auto_750702 ) ( ON ?auto_750704 ?auto_750703 ) ( not ( = ?auto_750695 ?auto_750696 ) ) ( not ( = ?auto_750695 ?auto_750697 ) ) ( not ( = ?auto_750695 ?auto_750698 ) ) ( not ( = ?auto_750695 ?auto_750699 ) ) ( not ( = ?auto_750695 ?auto_750700 ) ) ( not ( = ?auto_750695 ?auto_750701 ) ) ( not ( = ?auto_750695 ?auto_750702 ) ) ( not ( = ?auto_750695 ?auto_750703 ) ) ( not ( = ?auto_750695 ?auto_750704 ) ) ( not ( = ?auto_750695 ?auto_750705 ) ) ( not ( = ?auto_750695 ?auto_750706 ) ) ( not ( = ?auto_750695 ?auto_750707 ) ) ( not ( = ?auto_750696 ?auto_750697 ) ) ( not ( = ?auto_750696 ?auto_750698 ) ) ( not ( = ?auto_750696 ?auto_750699 ) ) ( not ( = ?auto_750696 ?auto_750700 ) ) ( not ( = ?auto_750696 ?auto_750701 ) ) ( not ( = ?auto_750696 ?auto_750702 ) ) ( not ( = ?auto_750696 ?auto_750703 ) ) ( not ( = ?auto_750696 ?auto_750704 ) ) ( not ( = ?auto_750696 ?auto_750705 ) ) ( not ( = ?auto_750696 ?auto_750706 ) ) ( not ( = ?auto_750696 ?auto_750707 ) ) ( not ( = ?auto_750697 ?auto_750698 ) ) ( not ( = ?auto_750697 ?auto_750699 ) ) ( not ( = ?auto_750697 ?auto_750700 ) ) ( not ( = ?auto_750697 ?auto_750701 ) ) ( not ( = ?auto_750697 ?auto_750702 ) ) ( not ( = ?auto_750697 ?auto_750703 ) ) ( not ( = ?auto_750697 ?auto_750704 ) ) ( not ( = ?auto_750697 ?auto_750705 ) ) ( not ( = ?auto_750697 ?auto_750706 ) ) ( not ( = ?auto_750697 ?auto_750707 ) ) ( not ( = ?auto_750698 ?auto_750699 ) ) ( not ( = ?auto_750698 ?auto_750700 ) ) ( not ( = ?auto_750698 ?auto_750701 ) ) ( not ( = ?auto_750698 ?auto_750702 ) ) ( not ( = ?auto_750698 ?auto_750703 ) ) ( not ( = ?auto_750698 ?auto_750704 ) ) ( not ( = ?auto_750698 ?auto_750705 ) ) ( not ( = ?auto_750698 ?auto_750706 ) ) ( not ( = ?auto_750698 ?auto_750707 ) ) ( not ( = ?auto_750699 ?auto_750700 ) ) ( not ( = ?auto_750699 ?auto_750701 ) ) ( not ( = ?auto_750699 ?auto_750702 ) ) ( not ( = ?auto_750699 ?auto_750703 ) ) ( not ( = ?auto_750699 ?auto_750704 ) ) ( not ( = ?auto_750699 ?auto_750705 ) ) ( not ( = ?auto_750699 ?auto_750706 ) ) ( not ( = ?auto_750699 ?auto_750707 ) ) ( not ( = ?auto_750700 ?auto_750701 ) ) ( not ( = ?auto_750700 ?auto_750702 ) ) ( not ( = ?auto_750700 ?auto_750703 ) ) ( not ( = ?auto_750700 ?auto_750704 ) ) ( not ( = ?auto_750700 ?auto_750705 ) ) ( not ( = ?auto_750700 ?auto_750706 ) ) ( not ( = ?auto_750700 ?auto_750707 ) ) ( not ( = ?auto_750701 ?auto_750702 ) ) ( not ( = ?auto_750701 ?auto_750703 ) ) ( not ( = ?auto_750701 ?auto_750704 ) ) ( not ( = ?auto_750701 ?auto_750705 ) ) ( not ( = ?auto_750701 ?auto_750706 ) ) ( not ( = ?auto_750701 ?auto_750707 ) ) ( not ( = ?auto_750702 ?auto_750703 ) ) ( not ( = ?auto_750702 ?auto_750704 ) ) ( not ( = ?auto_750702 ?auto_750705 ) ) ( not ( = ?auto_750702 ?auto_750706 ) ) ( not ( = ?auto_750702 ?auto_750707 ) ) ( not ( = ?auto_750703 ?auto_750704 ) ) ( not ( = ?auto_750703 ?auto_750705 ) ) ( not ( = ?auto_750703 ?auto_750706 ) ) ( not ( = ?auto_750703 ?auto_750707 ) ) ( not ( = ?auto_750704 ?auto_750705 ) ) ( not ( = ?auto_750704 ?auto_750706 ) ) ( not ( = ?auto_750704 ?auto_750707 ) ) ( not ( = ?auto_750705 ?auto_750706 ) ) ( not ( = ?auto_750705 ?auto_750707 ) ) ( not ( = ?auto_750706 ?auto_750707 ) ) ( CLEAR ?auto_750704 ) ( ON ?auto_750705 ?auto_750706 ) ( CLEAR ?auto_750705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_750695 ?auto_750696 ?auto_750697 ?auto_750698 ?auto_750699 ?auto_750700 ?auto_750701 ?auto_750702 ?auto_750703 ?auto_750704 ?auto_750705 )
      ( MAKE-12PILE ?auto_750695 ?auto_750696 ?auto_750697 ?auto_750698 ?auto_750699 ?auto_750700 ?auto_750701 ?auto_750702 ?auto_750703 ?auto_750704 ?auto_750705 ?auto_750706 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750745 - BLOCK
      ?auto_750746 - BLOCK
      ?auto_750747 - BLOCK
      ?auto_750748 - BLOCK
      ?auto_750749 - BLOCK
      ?auto_750750 - BLOCK
      ?auto_750751 - BLOCK
      ?auto_750752 - BLOCK
      ?auto_750753 - BLOCK
      ?auto_750754 - BLOCK
      ?auto_750755 - BLOCK
      ?auto_750756 - BLOCK
    )
    :vars
    (
      ?auto_750757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750756 ?auto_750757 ) ( ON-TABLE ?auto_750745 ) ( ON ?auto_750746 ?auto_750745 ) ( ON ?auto_750747 ?auto_750746 ) ( ON ?auto_750748 ?auto_750747 ) ( ON ?auto_750749 ?auto_750748 ) ( ON ?auto_750750 ?auto_750749 ) ( ON ?auto_750751 ?auto_750750 ) ( ON ?auto_750752 ?auto_750751 ) ( ON ?auto_750753 ?auto_750752 ) ( not ( = ?auto_750745 ?auto_750746 ) ) ( not ( = ?auto_750745 ?auto_750747 ) ) ( not ( = ?auto_750745 ?auto_750748 ) ) ( not ( = ?auto_750745 ?auto_750749 ) ) ( not ( = ?auto_750745 ?auto_750750 ) ) ( not ( = ?auto_750745 ?auto_750751 ) ) ( not ( = ?auto_750745 ?auto_750752 ) ) ( not ( = ?auto_750745 ?auto_750753 ) ) ( not ( = ?auto_750745 ?auto_750754 ) ) ( not ( = ?auto_750745 ?auto_750755 ) ) ( not ( = ?auto_750745 ?auto_750756 ) ) ( not ( = ?auto_750745 ?auto_750757 ) ) ( not ( = ?auto_750746 ?auto_750747 ) ) ( not ( = ?auto_750746 ?auto_750748 ) ) ( not ( = ?auto_750746 ?auto_750749 ) ) ( not ( = ?auto_750746 ?auto_750750 ) ) ( not ( = ?auto_750746 ?auto_750751 ) ) ( not ( = ?auto_750746 ?auto_750752 ) ) ( not ( = ?auto_750746 ?auto_750753 ) ) ( not ( = ?auto_750746 ?auto_750754 ) ) ( not ( = ?auto_750746 ?auto_750755 ) ) ( not ( = ?auto_750746 ?auto_750756 ) ) ( not ( = ?auto_750746 ?auto_750757 ) ) ( not ( = ?auto_750747 ?auto_750748 ) ) ( not ( = ?auto_750747 ?auto_750749 ) ) ( not ( = ?auto_750747 ?auto_750750 ) ) ( not ( = ?auto_750747 ?auto_750751 ) ) ( not ( = ?auto_750747 ?auto_750752 ) ) ( not ( = ?auto_750747 ?auto_750753 ) ) ( not ( = ?auto_750747 ?auto_750754 ) ) ( not ( = ?auto_750747 ?auto_750755 ) ) ( not ( = ?auto_750747 ?auto_750756 ) ) ( not ( = ?auto_750747 ?auto_750757 ) ) ( not ( = ?auto_750748 ?auto_750749 ) ) ( not ( = ?auto_750748 ?auto_750750 ) ) ( not ( = ?auto_750748 ?auto_750751 ) ) ( not ( = ?auto_750748 ?auto_750752 ) ) ( not ( = ?auto_750748 ?auto_750753 ) ) ( not ( = ?auto_750748 ?auto_750754 ) ) ( not ( = ?auto_750748 ?auto_750755 ) ) ( not ( = ?auto_750748 ?auto_750756 ) ) ( not ( = ?auto_750748 ?auto_750757 ) ) ( not ( = ?auto_750749 ?auto_750750 ) ) ( not ( = ?auto_750749 ?auto_750751 ) ) ( not ( = ?auto_750749 ?auto_750752 ) ) ( not ( = ?auto_750749 ?auto_750753 ) ) ( not ( = ?auto_750749 ?auto_750754 ) ) ( not ( = ?auto_750749 ?auto_750755 ) ) ( not ( = ?auto_750749 ?auto_750756 ) ) ( not ( = ?auto_750749 ?auto_750757 ) ) ( not ( = ?auto_750750 ?auto_750751 ) ) ( not ( = ?auto_750750 ?auto_750752 ) ) ( not ( = ?auto_750750 ?auto_750753 ) ) ( not ( = ?auto_750750 ?auto_750754 ) ) ( not ( = ?auto_750750 ?auto_750755 ) ) ( not ( = ?auto_750750 ?auto_750756 ) ) ( not ( = ?auto_750750 ?auto_750757 ) ) ( not ( = ?auto_750751 ?auto_750752 ) ) ( not ( = ?auto_750751 ?auto_750753 ) ) ( not ( = ?auto_750751 ?auto_750754 ) ) ( not ( = ?auto_750751 ?auto_750755 ) ) ( not ( = ?auto_750751 ?auto_750756 ) ) ( not ( = ?auto_750751 ?auto_750757 ) ) ( not ( = ?auto_750752 ?auto_750753 ) ) ( not ( = ?auto_750752 ?auto_750754 ) ) ( not ( = ?auto_750752 ?auto_750755 ) ) ( not ( = ?auto_750752 ?auto_750756 ) ) ( not ( = ?auto_750752 ?auto_750757 ) ) ( not ( = ?auto_750753 ?auto_750754 ) ) ( not ( = ?auto_750753 ?auto_750755 ) ) ( not ( = ?auto_750753 ?auto_750756 ) ) ( not ( = ?auto_750753 ?auto_750757 ) ) ( not ( = ?auto_750754 ?auto_750755 ) ) ( not ( = ?auto_750754 ?auto_750756 ) ) ( not ( = ?auto_750754 ?auto_750757 ) ) ( not ( = ?auto_750755 ?auto_750756 ) ) ( not ( = ?auto_750755 ?auto_750757 ) ) ( not ( = ?auto_750756 ?auto_750757 ) ) ( ON ?auto_750755 ?auto_750756 ) ( CLEAR ?auto_750753 ) ( ON ?auto_750754 ?auto_750755 ) ( CLEAR ?auto_750754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_750745 ?auto_750746 ?auto_750747 ?auto_750748 ?auto_750749 ?auto_750750 ?auto_750751 ?auto_750752 ?auto_750753 ?auto_750754 )
      ( MAKE-12PILE ?auto_750745 ?auto_750746 ?auto_750747 ?auto_750748 ?auto_750749 ?auto_750750 ?auto_750751 ?auto_750752 ?auto_750753 ?auto_750754 ?auto_750755 ?auto_750756 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750795 - BLOCK
      ?auto_750796 - BLOCK
      ?auto_750797 - BLOCK
      ?auto_750798 - BLOCK
      ?auto_750799 - BLOCK
      ?auto_750800 - BLOCK
      ?auto_750801 - BLOCK
      ?auto_750802 - BLOCK
      ?auto_750803 - BLOCK
      ?auto_750804 - BLOCK
      ?auto_750805 - BLOCK
      ?auto_750806 - BLOCK
    )
    :vars
    (
      ?auto_750807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750806 ?auto_750807 ) ( ON-TABLE ?auto_750795 ) ( ON ?auto_750796 ?auto_750795 ) ( ON ?auto_750797 ?auto_750796 ) ( ON ?auto_750798 ?auto_750797 ) ( ON ?auto_750799 ?auto_750798 ) ( ON ?auto_750800 ?auto_750799 ) ( ON ?auto_750801 ?auto_750800 ) ( ON ?auto_750802 ?auto_750801 ) ( not ( = ?auto_750795 ?auto_750796 ) ) ( not ( = ?auto_750795 ?auto_750797 ) ) ( not ( = ?auto_750795 ?auto_750798 ) ) ( not ( = ?auto_750795 ?auto_750799 ) ) ( not ( = ?auto_750795 ?auto_750800 ) ) ( not ( = ?auto_750795 ?auto_750801 ) ) ( not ( = ?auto_750795 ?auto_750802 ) ) ( not ( = ?auto_750795 ?auto_750803 ) ) ( not ( = ?auto_750795 ?auto_750804 ) ) ( not ( = ?auto_750795 ?auto_750805 ) ) ( not ( = ?auto_750795 ?auto_750806 ) ) ( not ( = ?auto_750795 ?auto_750807 ) ) ( not ( = ?auto_750796 ?auto_750797 ) ) ( not ( = ?auto_750796 ?auto_750798 ) ) ( not ( = ?auto_750796 ?auto_750799 ) ) ( not ( = ?auto_750796 ?auto_750800 ) ) ( not ( = ?auto_750796 ?auto_750801 ) ) ( not ( = ?auto_750796 ?auto_750802 ) ) ( not ( = ?auto_750796 ?auto_750803 ) ) ( not ( = ?auto_750796 ?auto_750804 ) ) ( not ( = ?auto_750796 ?auto_750805 ) ) ( not ( = ?auto_750796 ?auto_750806 ) ) ( not ( = ?auto_750796 ?auto_750807 ) ) ( not ( = ?auto_750797 ?auto_750798 ) ) ( not ( = ?auto_750797 ?auto_750799 ) ) ( not ( = ?auto_750797 ?auto_750800 ) ) ( not ( = ?auto_750797 ?auto_750801 ) ) ( not ( = ?auto_750797 ?auto_750802 ) ) ( not ( = ?auto_750797 ?auto_750803 ) ) ( not ( = ?auto_750797 ?auto_750804 ) ) ( not ( = ?auto_750797 ?auto_750805 ) ) ( not ( = ?auto_750797 ?auto_750806 ) ) ( not ( = ?auto_750797 ?auto_750807 ) ) ( not ( = ?auto_750798 ?auto_750799 ) ) ( not ( = ?auto_750798 ?auto_750800 ) ) ( not ( = ?auto_750798 ?auto_750801 ) ) ( not ( = ?auto_750798 ?auto_750802 ) ) ( not ( = ?auto_750798 ?auto_750803 ) ) ( not ( = ?auto_750798 ?auto_750804 ) ) ( not ( = ?auto_750798 ?auto_750805 ) ) ( not ( = ?auto_750798 ?auto_750806 ) ) ( not ( = ?auto_750798 ?auto_750807 ) ) ( not ( = ?auto_750799 ?auto_750800 ) ) ( not ( = ?auto_750799 ?auto_750801 ) ) ( not ( = ?auto_750799 ?auto_750802 ) ) ( not ( = ?auto_750799 ?auto_750803 ) ) ( not ( = ?auto_750799 ?auto_750804 ) ) ( not ( = ?auto_750799 ?auto_750805 ) ) ( not ( = ?auto_750799 ?auto_750806 ) ) ( not ( = ?auto_750799 ?auto_750807 ) ) ( not ( = ?auto_750800 ?auto_750801 ) ) ( not ( = ?auto_750800 ?auto_750802 ) ) ( not ( = ?auto_750800 ?auto_750803 ) ) ( not ( = ?auto_750800 ?auto_750804 ) ) ( not ( = ?auto_750800 ?auto_750805 ) ) ( not ( = ?auto_750800 ?auto_750806 ) ) ( not ( = ?auto_750800 ?auto_750807 ) ) ( not ( = ?auto_750801 ?auto_750802 ) ) ( not ( = ?auto_750801 ?auto_750803 ) ) ( not ( = ?auto_750801 ?auto_750804 ) ) ( not ( = ?auto_750801 ?auto_750805 ) ) ( not ( = ?auto_750801 ?auto_750806 ) ) ( not ( = ?auto_750801 ?auto_750807 ) ) ( not ( = ?auto_750802 ?auto_750803 ) ) ( not ( = ?auto_750802 ?auto_750804 ) ) ( not ( = ?auto_750802 ?auto_750805 ) ) ( not ( = ?auto_750802 ?auto_750806 ) ) ( not ( = ?auto_750802 ?auto_750807 ) ) ( not ( = ?auto_750803 ?auto_750804 ) ) ( not ( = ?auto_750803 ?auto_750805 ) ) ( not ( = ?auto_750803 ?auto_750806 ) ) ( not ( = ?auto_750803 ?auto_750807 ) ) ( not ( = ?auto_750804 ?auto_750805 ) ) ( not ( = ?auto_750804 ?auto_750806 ) ) ( not ( = ?auto_750804 ?auto_750807 ) ) ( not ( = ?auto_750805 ?auto_750806 ) ) ( not ( = ?auto_750805 ?auto_750807 ) ) ( not ( = ?auto_750806 ?auto_750807 ) ) ( ON ?auto_750805 ?auto_750806 ) ( ON ?auto_750804 ?auto_750805 ) ( CLEAR ?auto_750802 ) ( ON ?auto_750803 ?auto_750804 ) ( CLEAR ?auto_750803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_750795 ?auto_750796 ?auto_750797 ?auto_750798 ?auto_750799 ?auto_750800 ?auto_750801 ?auto_750802 ?auto_750803 )
      ( MAKE-12PILE ?auto_750795 ?auto_750796 ?auto_750797 ?auto_750798 ?auto_750799 ?auto_750800 ?auto_750801 ?auto_750802 ?auto_750803 ?auto_750804 ?auto_750805 ?auto_750806 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750845 - BLOCK
      ?auto_750846 - BLOCK
      ?auto_750847 - BLOCK
      ?auto_750848 - BLOCK
      ?auto_750849 - BLOCK
      ?auto_750850 - BLOCK
      ?auto_750851 - BLOCK
      ?auto_750852 - BLOCK
      ?auto_750853 - BLOCK
      ?auto_750854 - BLOCK
      ?auto_750855 - BLOCK
      ?auto_750856 - BLOCK
    )
    :vars
    (
      ?auto_750857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750856 ?auto_750857 ) ( ON-TABLE ?auto_750845 ) ( ON ?auto_750846 ?auto_750845 ) ( ON ?auto_750847 ?auto_750846 ) ( ON ?auto_750848 ?auto_750847 ) ( ON ?auto_750849 ?auto_750848 ) ( ON ?auto_750850 ?auto_750849 ) ( ON ?auto_750851 ?auto_750850 ) ( not ( = ?auto_750845 ?auto_750846 ) ) ( not ( = ?auto_750845 ?auto_750847 ) ) ( not ( = ?auto_750845 ?auto_750848 ) ) ( not ( = ?auto_750845 ?auto_750849 ) ) ( not ( = ?auto_750845 ?auto_750850 ) ) ( not ( = ?auto_750845 ?auto_750851 ) ) ( not ( = ?auto_750845 ?auto_750852 ) ) ( not ( = ?auto_750845 ?auto_750853 ) ) ( not ( = ?auto_750845 ?auto_750854 ) ) ( not ( = ?auto_750845 ?auto_750855 ) ) ( not ( = ?auto_750845 ?auto_750856 ) ) ( not ( = ?auto_750845 ?auto_750857 ) ) ( not ( = ?auto_750846 ?auto_750847 ) ) ( not ( = ?auto_750846 ?auto_750848 ) ) ( not ( = ?auto_750846 ?auto_750849 ) ) ( not ( = ?auto_750846 ?auto_750850 ) ) ( not ( = ?auto_750846 ?auto_750851 ) ) ( not ( = ?auto_750846 ?auto_750852 ) ) ( not ( = ?auto_750846 ?auto_750853 ) ) ( not ( = ?auto_750846 ?auto_750854 ) ) ( not ( = ?auto_750846 ?auto_750855 ) ) ( not ( = ?auto_750846 ?auto_750856 ) ) ( not ( = ?auto_750846 ?auto_750857 ) ) ( not ( = ?auto_750847 ?auto_750848 ) ) ( not ( = ?auto_750847 ?auto_750849 ) ) ( not ( = ?auto_750847 ?auto_750850 ) ) ( not ( = ?auto_750847 ?auto_750851 ) ) ( not ( = ?auto_750847 ?auto_750852 ) ) ( not ( = ?auto_750847 ?auto_750853 ) ) ( not ( = ?auto_750847 ?auto_750854 ) ) ( not ( = ?auto_750847 ?auto_750855 ) ) ( not ( = ?auto_750847 ?auto_750856 ) ) ( not ( = ?auto_750847 ?auto_750857 ) ) ( not ( = ?auto_750848 ?auto_750849 ) ) ( not ( = ?auto_750848 ?auto_750850 ) ) ( not ( = ?auto_750848 ?auto_750851 ) ) ( not ( = ?auto_750848 ?auto_750852 ) ) ( not ( = ?auto_750848 ?auto_750853 ) ) ( not ( = ?auto_750848 ?auto_750854 ) ) ( not ( = ?auto_750848 ?auto_750855 ) ) ( not ( = ?auto_750848 ?auto_750856 ) ) ( not ( = ?auto_750848 ?auto_750857 ) ) ( not ( = ?auto_750849 ?auto_750850 ) ) ( not ( = ?auto_750849 ?auto_750851 ) ) ( not ( = ?auto_750849 ?auto_750852 ) ) ( not ( = ?auto_750849 ?auto_750853 ) ) ( not ( = ?auto_750849 ?auto_750854 ) ) ( not ( = ?auto_750849 ?auto_750855 ) ) ( not ( = ?auto_750849 ?auto_750856 ) ) ( not ( = ?auto_750849 ?auto_750857 ) ) ( not ( = ?auto_750850 ?auto_750851 ) ) ( not ( = ?auto_750850 ?auto_750852 ) ) ( not ( = ?auto_750850 ?auto_750853 ) ) ( not ( = ?auto_750850 ?auto_750854 ) ) ( not ( = ?auto_750850 ?auto_750855 ) ) ( not ( = ?auto_750850 ?auto_750856 ) ) ( not ( = ?auto_750850 ?auto_750857 ) ) ( not ( = ?auto_750851 ?auto_750852 ) ) ( not ( = ?auto_750851 ?auto_750853 ) ) ( not ( = ?auto_750851 ?auto_750854 ) ) ( not ( = ?auto_750851 ?auto_750855 ) ) ( not ( = ?auto_750851 ?auto_750856 ) ) ( not ( = ?auto_750851 ?auto_750857 ) ) ( not ( = ?auto_750852 ?auto_750853 ) ) ( not ( = ?auto_750852 ?auto_750854 ) ) ( not ( = ?auto_750852 ?auto_750855 ) ) ( not ( = ?auto_750852 ?auto_750856 ) ) ( not ( = ?auto_750852 ?auto_750857 ) ) ( not ( = ?auto_750853 ?auto_750854 ) ) ( not ( = ?auto_750853 ?auto_750855 ) ) ( not ( = ?auto_750853 ?auto_750856 ) ) ( not ( = ?auto_750853 ?auto_750857 ) ) ( not ( = ?auto_750854 ?auto_750855 ) ) ( not ( = ?auto_750854 ?auto_750856 ) ) ( not ( = ?auto_750854 ?auto_750857 ) ) ( not ( = ?auto_750855 ?auto_750856 ) ) ( not ( = ?auto_750855 ?auto_750857 ) ) ( not ( = ?auto_750856 ?auto_750857 ) ) ( ON ?auto_750855 ?auto_750856 ) ( ON ?auto_750854 ?auto_750855 ) ( ON ?auto_750853 ?auto_750854 ) ( CLEAR ?auto_750851 ) ( ON ?auto_750852 ?auto_750853 ) ( CLEAR ?auto_750852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_750845 ?auto_750846 ?auto_750847 ?auto_750848 ?auto_750849 ?auto_750850 ?auto_750851 ?auto_750852 )
      ( MAKE-12PILE ?auto_750845 ?auto_750846 ?auto_750847 ?auto_750848 ?auto_750849 ?auto_750850 ?auto_750851 ?auto_750852 ?auto_750853 ?auto_750854 ?auto_750855 ?auto_750856 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750895 - BLOCK
      ?auto_750896 - BLOCK
      ?auto_750897 - BLOCK
      ?auto_750898 - BLOCK
      ?auto_750899 - BLOCK
      ?auto_750900 - BLOCK
      ?auto_750901 - BLOCK
      ?auto_750902 - BLOCK
      ?auto_750903 - BLOCK
      ?auto_750904 - BLOCK
      ?auto_750905 - BLOCK
      ?auto_750906 - BLOCK
    )
    :vars
    (
      ?auto_750907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750906 ?auto_750907 ) ( ON-TABLE ?auto_750895 ) ( ON ?auto_750896 ?auto_750895 ) ( ON ?auto_750897 ?auto_750896 ) ( ON ?auto_750898 ?auto_750897 ) ( ON ?auto_750899 ?auto_750898 ) ( ON ?auto_750900 ?auto_750899 ) ( not ( = ?auto_750895 ?auto_750896 ) ) ( not ( = ?auto_750895 ?auto_750897 ) ) ( not ( = ?auto_750895 ?auto_750898 ) ) ( not ( = ?auto_750895 ?auto_750899 ) ) ( not ( = ?auto_750895 ?auto_750900 ) ) ( not ( = ?auto_750895 ?auto_750901 ) ) ( not ( = ?auto_750895 ?auto_750902 ) ) ( not ( = ?auto_750895 ?auto_750903 ) ) ( not ( = ?auto_750895 ?auto_750904 ) ) ( not ( = ?auto_750895 ?auto_750905 ) ) ( not ( = ?auto_750895 ?auto_750906 ) ) ( not ( = ?auto_750895 ?auto_750907 ) ) ( not ( = ?auto_750896 ?auto_750897 ) ) ( not ( = ?auto_750896 ?auto_750898 ) ) ( not ( = ?auto_750896 ?auto_750899 ) ) ( not ( = ?auto_750896 ?auto_750900 ) ) ( not ( = ?auto_750896 ?auto_750901 ) ) ( not ( = ?auto_750896 ?auto_750902 ) ) ( not ( = ?auto_750896 ?auto_750903 ) ) ( not ( = ?auto_750896 ?auto_750904 ) ) ( not ( = ?auto_750896 ?auto_750905 ) ) ( not ( = ?auto_750896 ?auto_750906 ) ) ( not ( = ?auto_750896 ?auto_750907 ) ) ( not ( = ?auto_750897 ?auto_750898 ) ) ( not ( = ?auto_750897 ?auto_750899 ) ) ( not ( = ?auto_750897 ?auto_750900 ) ) ( not ( = ?auto_750897 ?auto_750901 ) ) ( not ( = ?auto_750897 ?auto_750902 ) ) ( not ( = ?auto_750897 ?auto_750903 ) ) ( not ( = ?auto_750897 ?auto_750904 ) ) ( not ( = ?auto_750897 ?auto_750905 ) ) ( not ( = ?auto_750897 ?auto_750906 ) ) ( not ( = ?auto_750897 ?auto_750907 ) ) ( not ( = ?auto_750898 ?auto_750899 ) ) ( not ( = ?auto_750898 ?auto_750900 ) ) ( not ( = ?auto_750898 ?auto_750901 ) ) ( not ( = ?auto_750898 ?auto_750902 ) ) ( not ( = ?auto_750898 ?auto_750903 ) ) ( not ( = ?auto_750898 ?auto_750904 ) ) ( not ( = ?auto_750898 ?auto_750905 ) ) ( not ( = ?auto_750898 ?auto_750906 ) ) ( not ( = ?auto_750898 ?auto_750907 ) ) ( not ( = ?auto_750899 ?auto_750900 ) ) ( not ( = ?auto_750899 ?auto_750901 ) ) ( not ( = ?auto_750899 ?auto_750902 ) ) ( not ( = ?auto_750899 ?auto_750903 ) ) ( not ( = ?auto_750899 ?auto_750904 ) ) ( not ( = ?auto_750899 ?auto_750905 ) ) ( not ( = ?auto_750899 ?auto_750906 ) ) ( not ( = ?auto_750899 ?auto_750907 ) ) ( not ( = ?auto_750900 ?auto_750901 ) ) ( not ( = ?auto_750900 ?auto_750902 ) ) ( not ( = ?auto_750900 ?auto_750903 ) ) ( not ( = ?auto_750900 ?auto_750904 ) ) ( not ( = ?auto_750900 ?auto_750905 ) ) ( not ( = ?auto_750900 ?auto_750906 ) ) ( not ( = ?auto_750900 ?auto_750907 ) ) ( not ( = ?auto_750901 ?auto_750902 ) ) ( not ( = ?auto_750901 ?auto_750903 ) ) ( not ( = ?auto_750901 ?auto_750904 ) ) ( not ( = ?auto_750901 ?auto_750905 ) ) ( not ( = ?auto_750901 ?auto_750906 ) ) ( not ( = ?auto_750901 ?auto_750907 ) ) ( not ( = ?auto_750902 ?auto_750903 ) ) ( not ( = ?auto_750902 ?auto_750904 ) ) ( not ( = ?auto_750902 ?auto_750905 ) ) ( not ( = ?auto_750902 ?auto_750906 ) ) ( not ( = ?auto_750902 ?auto_750907 ) ) ( not ( = ?auto_750903 ?auto_750904 ) ) ( not ( = ?auto_750903 ?auto_750905 ) ) ( not ( = ?auto_750903 ?auto_750906 ) ) ( not ( = ?auto_750903 ?auto_750907 ) ) ( not ( = ?auto_750904 ?auto_750905 ) ) ( not ( = ?auto_750904 ?auto_750906 ) ) ( not ( = ?auto_750904 ?auto_750907 ) ) ( not ( = ?auto_750905 ?auto_750906 ) ) ( not ( = ?auto_750905 ?auto_750907 ) ) ( not ( = ?auto_750906 ?auto_750907 ) ) ( ON ?auto_750905 ?auto_750906 ) ( ON ?auto_750904 ?auto_750905 ) ( ON ?auto_750903 ?auto_750904 ) ( ON ?auto_750902 ?auto_750903 ) ( CLEAR ?auto_750900 ) ( ON ?auto_750901 ?auto_750902 ) ( CLEAR ?auto_750901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_750895 ?auto_750896 ?auto_750897 ?auto_750898 ?auto_750899 ?auto_750900 ?auto_750901 )
      ( MAKE-12PILE ?auto_750895 ?auto_750896 ?auto_750897 ?auto_750898 ?auto_750899 ?auto_750900 ?auto_750901 ?auto_750902 ?auto_750903 ?auto_750904 ?auto_750905 ?auto_750906 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750945 - BLOCK
      ?auto_750946 - BLOCK
      ?auto_750947 - BLOCK
      ?auto_750948 - BLOCK
      ?auto_750949 - BLOCK
      ?auto_750950 - BLOCK
      ?auto_750951 - BLOCK
      ?auto_750952 - BLOCK
      ?auto_750953 - BLOCK
      ?auto_750954 - BLOCK
      ?auto_750955 - BLOCK
      ?auto_750956 - BLOCK
    )
    :vars
    (
      ?auto_750957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_750956 ?auto_750957 ) ( ON-TABLE ?auto_750945 ) ( ON ?auto_750946 ?auto_750945 ) ( ON ?auto_750947 ?auto_750946 ) ( ON ?auto_750948 ?auto_750947 ) ( ON ?auto_750949 ?auto_750948 ) ( not ( = ?auto_750945 ?auto_750946 ) ) ( not ( = ?auto_750945 ?auto_750947 ) ) ( not ( = ?auto_750945 ?auto_750948 ) ) ( not ( = ?auto_750945 ?auto_750949 ) ) ( not ( = ?auto_750945 ?auto_750950 ) ) ( not ( = ?auto_750945 ?auto_750951 ) ) ( not ( = ?auto_750945 ?auto_750952 ) ) ( not ( = ?auto_750945 ?auto_750953 ) ) ( not ( = ?auto_750945 ?auto_750954 ) ) ( not ( = ?auto_750945 ?auto_750955 ) ) ( not ( = ?auto_750945 ?auto_750956 ) ) ( not ( = ?auto_750945 ?auto_750957 ) ) ( not ( = ?auto_750946 ?auto_750947 ) ) ( not ( = ?auto_750946 ?auto_750948 ) ) ( not ( = ?auto_750946 ?auto_750949 ) ) ( not ( = ?auto_750946 ?auto_750950 ) ) ( not ( = ?auto_750946 ?auto_750951 ) ) ( not ( = ?auto_750946 ?auto_750952 ) ) ( not ( = ?auto_750946 ?auto_750953 ) ) ( not ( = ?auto_750946 ?auto_750954 ) ) ( not ( = ?auto_750946 ?auto_750955 ) ) ( not ( = ?auto_750946 ?auto_750956 ) ) ( not ( = ?auto_750946 ?auto_750957 ) ) ( not ( = ?auto_750947 ?auto_750948 ) ) ( not ( = ?auto_750947 ?auto_750949 ) ) ( not ( = ?auto_750947 ?auto_750950 ) ) ( not ( = ?auto_750947 ?auto_750951 ) ) ( not ( = ?auto_750947 ?auto_750952 ) ) ( not ( = ?auto_750947 ?auto_750953 ) ) ( not ( = ?auto_750947 ?auto_750954 ) ) ( not ( = ?auto_750947 ?auto_750955 ) ) ( not ( = ?auto_750947 ?auto_750956 ) ) ( not ( = ?auto_750947 ?auto_750957 ) ) ( not ( = ?auto_750948 ?auto_750949 ) ) ( not ( = ?auto_750948 ?auto_750950 ) ) ( not ( = ?auto_750948 ?auto_750951 ) ) ( not ( = ?auto_750948 ?auto_750952 ) ) ( not ( = ?auto_750948 ?auto_750953 ) ) ( not ( = ?auto_750948 ?auto_750954 ) ) ( not ( = ?auto_750948 ?auto_750955 ) ) ( not ( = ?auto_750948 ?auto_750956 ) ) ( not ( = ?auto_750948 ?auto_750957 ) ) ( not ( = ?auto_750949 ?auto_750950 ) ) ( not ( = ?auto_750949 ?auto_750951 ) ) ( not ( = ?auto_750949 ?auto_750952 ) ) ( not ( = ?auto_750949 ?auto_750953 ) ) ( not ( = ?auto_750949 ?auto_750954 ) ) ( not ( = ?auto_750949 ?auto_750955 ) ) ( not ( = ?auto_750949 ?auto_750956 ) ) ( not ( = ?auto_750949 ?auto_750957 ) ) ( not ( = ?auto_750950 ?auto_750951 ) ) ( not ( = ?auto_750950 ?auto_750952 ) ) ( not ( = ?auto_750950 ?auto_750953 ) ) ( not ( = ?auto_750950 ?auto_750954 ) ) ( not ( = ?auto_750950 ?auto_750955 ) ) ( not ( = ?auto_750950 ?auto_750956 ) ) ( not ( = ?auto_750950 ?auto_750957 ) ) ( not ( = ?auto_750951 ?auto_750952 ) ) ( not ( = ?auto_750951 ?auto_750953 ) ) ( not ( = ?auto_750951 ?auto_750954 ) ) ( not ( = ?auto_750951 ?auto_750955 ) ) ( not ( = ?auto_750951 ?auto_750956 ) ) ( not ( = ?auto_750951 ?auto_750957 ) ) ( not ( = ?auto_750952 ?auto_750953 ) ) ( not ( = ?auto_750952 ?auto_750954 ) ) ( not ( = ?auto_750952 ?auto_750955 ) ) ( not ( = ?auto_750952 ?auto_750956 ) ) ( not ( = ?auto_750952 ?auto_750957 ) ) ( not ( = ?auto_750953 ?auto_750954 ) ) ( not ( = ?auto_750953 ?auto_750955 ) ) ( not ( = ?auto_750953 ?auto_750956 ) ) ( not ( = ?auto_750953 ?auto_750957 ) ) ( not ( = ?auto_750954 ?auto_750955 ) ) ( not ( = ?auto_750954 ?auto_750956 ) ) ( not ( = ?auto_750954 ?auto_750957 ) ) ( not ( = ?auto_750955 ?auto_750956 ) ) ( not ( = ?auto_750955 ?auto_750957 ) ) ( not ( = ?auto_750956 ?auto_750957 ) ) ( ON ?auto_750955 ?auto_750956 ) ( ON ?auto_750954 ?auto_750955 ) ( ON ?auto_750953 ?auto_750954 ) ( ON ?auto_750952 ?auto_750953 ) ( ON ?auto_750951 ?auto_750952 ) ( CLEAR ?auto_750949 ) ( ON ?auto_750950 ?auto_750951 ) ( CLEAR ?auto_750950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_750945 ?auto_750946 ?auto_750947 ?auto_750948 ?auto_750949 ?auto_750950 )
      ( MAKE-12PILE ?auto_750945 ?auto_750946 ?auto_750947 ?auto_750948 ?auto_750949 ?auto_750950 ?auto_750951 ?auto_750952 ?auto_750953 ?auto_750954 ?auto_750955 ?auto_750956 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_750995 - BLOCK
      ?auto_750996 - BLOCK
      ?auto_750997 - BLOCK
      ?auto_750998 - BLOCK
      ?auto_750999 - BLOCK
      ?auto_751000 - BLOCK
      ?auto_751001 - BLOCK
      ?auto_751002 - BLOCK
      ?auto_751003 - BLOCK
      ?auto_751004 - BLOCK
      ?auto_751005 - BLOCK
      ?auto_751006 - BLOCK
    )
    :vars
    (
      ?auto_751007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751006 ?auto_751007 ) ( ON-TABLE ?auto_750995 ) ( ON ?auto_750996 ?auto_750995 ) ( ON ?auto_750997 ?auto_750996 ) ( ON ?auto_750998 ?auto_750997 ) ( not ( = ?auto_750995 ?auto_750996 ) ) ( not ( = ?auto_750995 ?auto_750997 ) ) ( not ( = ?auto_750995 ?auto_750998 ) ) ( not ( = ?auto_750995 ?auto_750999 ) ) ( not ( = ?auto_750995 ?auto_751000 ) ) ( not ( = ?auto_750995 ?auto_751001 ) ) ( not ( = ?auto_750995 ?auto_751002 ) ) ( not ( = ?auto_750995 ?auto_751003 ) ) ( not ( = ?auto_750995 ?auto_751004 ) ) ( not ( = ?auto_750995 ?auto_751005 ) ) ( not ( = ?auto_750995 ?auto_751006 ) ) ( not ( = ?auto_750995 ?auto_751007 ) ) ( not ( = ?auto_750996 ?auto_750997 ) ) ( not ( = ?auto_750996 ?auto_750998 ) ) ( not ( = ?auto_750996 ?auto_750999 ) ) ( not ( = ?auto_750996 ?auto_751000 ) ) ( not ( = ?auto_750996 ?auto_751001 ) ) ( not ( = ?auto_750996 ?auto_751002 ) ) ( not ( = ?auto_750996 ?auto_751003 ) ) ( not ( = ?auto_750996 ?auto_751004 ) ) ( not ( = ?auto_750996 ?auto_751005 ) ) ( not ( = ?auto_750996 ?auto_751006 ) ) ( not ( = ?auto_750996 ?auto_751007 ) ) ( not ( = ?auto_750997 ?auto_750998 ) ) ( not ( = ?auto_750997 ?auto_750999 ) ) ( not ( = ?auto_750997 ?auto_751000 ) ) ( not ( = ?auto_750997 ?auto_751001 ) ) ( not ( = ?auto_750997 ?auto_751002 ) ) ( not ( = ?auto_750997 ?auto_751003 ) ) ( not ( = ?auto_750997 ?auto_751004 ) ) ( not ( = ?auto_750997 ?auto_751005 ) ) ( not ( = ?auto_750997 ?auto_751006 ) ) ( not ( = ?auto_750997 ?auto_751007 ) ) ( not ( = ?auto_750998 ?auto_750999 ) ) ( not ( = ?auto_750998 ?auto_751000 ) ) ( not ( = ?auto_750998 ?auto_751001 ) ) ( not ( = ?auto_750998 ?auto_751002 ) ) ( not ( = ?auto_750998 ?auto_751003 ) ) ( not ( = ?auto_750998 ?auto_751004 ) ) ( not ( = ?auto_750998 ?auto_751005 ) ) ( not ( = ?auto_750998 ?auto_751006 ) ) ( not ( = ?auto_750998 ?auto_751007 ) ) ( not ( = ?auto_750999 ?auto_751000 ) ) ( not ( = ?auto_750999 ?auto_751001 ) ) ( not ( = ?auto_750999 ?auto_751002 ) ) ( not ( = ?auto_750999 ?auto_751003 ) ) ( not ( = ?auto_750999 ?auto_751004 ) ) ( not ( = ?auto_750999 ?auto_751005 ) ) ( not ( = ?auto_750999 ?auto_751006 ) ) ( not ( = ?auto_750999 ?auto_751007 ) ) ( not ( = ?auto_751000 ?auto_751001 ) ) ( not ( = ?auto_751000 ?auto_751002 ) ) ( not ( = ?auto_751000 ?auto_751003 ) ) ( not ( = ?auto_751000 ?auto_751004 ) ) ( not ( = ?auto_751000 ?auto_751005 ) ) ( not ( = ?auto_751000 ?auto_751006 ) ) ( not ( = ?auto_751000 ?auto_751007 ) ) ( not ( = ?auto_751001 ?auto_751002 ) ) ( not ( = ?auto_751001 ?auto_751003 ) ) ( not ( = ?auto_751001 ?auto_751004 ) ) ( not ( = ?auto_751001 ?auto_751005 ) ) ( not ( = ?auto_751001 ?auto_751006 ) ) ( not ( = ?auto_751001 ?auto_751007 ) ) ( not ( = ?auto_751002 ?auto_751003 ) ) ( not ( = ?auto_751002 ?auto_751004 ) ) ( not ( = ?auto_751002 ?auto_751005 ) ) ( not ( = ?auto_751002 ?auto_751006 ) ) ( not ( = ?auto_751002 ?auto_751007 ) ) ( not ( = ?auto_751003 ?auto_751004 ) ) ( not ( = ?auto_751003 ?auto_751005 ) ) ( not ( = ?auto_751003 ?auto_751006 ) ) ( not ( = ?auto_751003 ?auto_751007 ) ) ( not ( = ?auto_751004 ?auto_751005 ) ) ( not ( = ?auto_751004 ?auto_751006 ) ) ( not ( = ?auto_751004 ?auto_751007 ) ) ( not ( = ?auto_751005 ?auto_751006 ) ) ( not ( = ?auto_751005 ?auto_751007 ) ) ( not ( = ?auto_751006 ?auto_751007 ) ) ( ON ?auto_751005 ?auto_751006 ) ( ON ?auto_751004 ?auto_751005 ) ( ON ?auto_751003 ?auto_751004 ) ( ON ?auto_751002 ?auto_751003 ) ( ON ?auto_751001 ?auto_751002 ) ( ON ?auto_751000 ?auto_751001 ) ( CLEAR ?auto_750998 ) ( ON ?auto_750999 ?auto_751000 ) ( CLEAR ?auto_750999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_750995 ?auto_750996 ?auto_750997 ?auto_750998 ?auto_750999 )
      ( MAKE-12PILE ?auto_750995 ?auto_750996 ?auto_750997 ?auto_750998 ?auto_750999 ?auto_751000 ?auto_751001 ?auto_751002 ?auto_751003 ?auto_751004 ?auto_751005 ?auto_751006 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_751045 - BLOCK
      ?auto_751046 - BLOCK
      ?auto_751047 - BLOCK
      ?auto_751048 - BLOCK
      ?auto_751049 - BLOCK
      ?auto_751050 - BLOCK
      ?auto_751051 - BLOCK
      ?auto_751052 - BLOCK
      ?auto_751053 - BLOCK
      ?auto_751054 - BLOCK
      ?auto_751055 - BLOCK
      ?auto_751056 - BLOCK
    )
    :vars
    (
      ?auto_751057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751056 ?auto_751057 ) ( ON-TABLE ?auto_751045 ) ( ON ?auto_751046 ?auto_751045 ) ( ON ?auto_751047 ?auto_751046 ) ( not ( = ?auto_751045 ?auto_751046 ) ) ( not ( = ?auto_751045 ?auto_751047 ) ) ( not ( = ?auto_751045 ?auto_751048 ) ) ( not ( = ?auto_751045 ?auto_751049 ) ) ( not ( = ?auto_751045 ?auto_751050 ) ) ( not ( = ?auto_751045 ?auto_751051 ) ) ( not ( = ?auto_751045 ?auto_751052 ) ) ( not ( = ?auto_751045 ?auto_751053 ) ) ( not ( = ?auto_751045 ?auto_751054 ) ) ( not ( = ?auto_751045 ?auto_751055 ) ) ( not ( = ?auto_751045 ?auto_751056 ) ) ( not ( = ?auto_751045 ?auto_751057 ) ) ( not ( = ?auto_751046 ?auto_751047 ) ) ( not ( = ?auto_751046 ?auto_751048 ) ) ( not ( = ?auto_751046 ?auto_751049 ) ) ( not ( = ?auto_751046 ?auto_751050 ) ) ( not ( = ?auto_751046 ?auto_751051 ) ) ( not ( = ?auto_751046 ?auto_751052 ) ) ( not ( = ?auto_751046 ?auto_751053 ) ) ( not ( = ?auto_751046 ?auto_751054 ) ) ( not ( = ?auto_751046 ?auto_751055 ) ) ( not ( = ?auto_751046 ?auto_751056 ) ) ( not ( = ?auto_751046 ?auto_751057 ) ) ( not ( = ?auto_751047 ?auto_751048 ) ) ( not ( = ?auto_751047 ?auto_751049 ) ) ( not ( = ?auto_751047 ?auto_751050 ) ) ( not ( = ?auto_751047 ?auto_751051 ) ) ( not ( = ?auto_751047 ?auto_751052 ) ) ( not ( = ?auto_751047 ?auto_751053 ) ) ( not ( = ?auto_751047 ?auto_751054 ) ) ( not ( = ?auto_751047 ?auto_751055 ) ) ( not ( = ?auto_751047 ?auto_751056 ) ) ( not ( = ?auto_751047 ?auto_751057 ) ) ( not ( = ?auto_751048 ?auto_751049 ) ) ( not ( = ?auto_751048 ?auto_751050 ) ) ( not ( = ?auto_751048 ?auto_751051 ) ) ( not ( = ?auto_751048 ?auto_751052 ) ) ( not ( = ?auto_751048 ?auto_751053 ) ) ( not ( = ?auto_751048 ?auto_751054 ) ) ( not ( = ?auto_751048 ?auto_751055 ) ) ( not ( = ?auto_751048 ?auto_751056 ) ) ( not ( = ?auto_751048 ?auto_751057 ) ) ( not ( = ?auto_751049 ?auto_751050 ) ) ( not ( = ?auto_751049 ?auto_751051 ) ) ( not ( = ?auto_751049 ?auto_751052 ) ) ( not ( = ?auto_751049 ?auto_751053 ) ) ( not ( = ?auto_751049 ?auto_751054 ) ) ( not ( = ?auto_751049 ?auto_751055 ) ) ( not ( = ?auto_751049 ?auto_751056 ) ) ( not ( = ?auto_751049 ?auto_751057 ) ) ( not ( = ?auto_751050 ?auto_751051 ) ) ( not ( = ?auto_751050 ?auto_751052 ) ) ( not ( = ?auto_751050 ?auto_751053 ) ) ( not ( = ?auto_751050 ?auto_751054 ) ) ( not ( = ?auto_751050 ?auto_751055 ) ) ( not ( = ?auto_751050 ?auto_751056 ) ) ( not ( = ?auto_751050 ?auto_751057 ) ) ( not ( = ?auto_751051 ?auto_751052 ) ) ( not ( = ?auto_751051 ?auto_751053 ) ) ( not ( = ?auto_751051 ?auto_751054 ) ) ( not ( = ?auto_751051 ?auto_751055 ) ) ( not ( = ?auto_751051 ?auto_751056 ) ) ( not ( = ?auto_751051 ?auto_751057 ) ) ( not ( = ?auto_751052 ?auto_751053 ) ) ( not ( = ?auto_751052 ?auto_751054 ) ) ( not ( = ?auto_751052 ?auto_751055 ) ) ( not ( = ?auto_751052 ?auto_751056 ) ) ( not ( = ?auto_751052 ?auto_751057 ) ) ( not ( = ?auto_751053 ?auto_751054 ) ) ( not ( = ?auto_751053 ?auto_751055 ) ) ( not ( = ?auto_751053 ?auto_751056 ) ) ( not ( = ?auto_751053 ?auto_751057 ) ) ( not ( = ?auto_751054 ?auto_751055 ) ) ( not ( = ?auto_751054 ?auto_751056 ) ) ( not ( = ?auto_751054 ?auto_751057 ) ) ( not ( = ?auto_751055 ?auto_751056 ) ) ( not ( = ?auto_751055 ?auto_751057 ) ) ( not ( = ?auto_751056 ?auto_751057 ) ) ( ON ?auto_751055 ?auto_751056 ) ( ON ?auto_751054 ?auto_751055 ) ( ON ?auto_751053 ?auto_751054 ) ( ON ?auto_751052 ?auto_751053 ) ( ON ?auto_751051 ?auto_751052 ) ( ON ?auto_751050 ?auto_751051 ) ( ON ?auto_751049 ?auto_751050 ) ( CLEAR ?auto_751047 ) ( ON ?auto_751048 ?auto_751049 ) ( CLEAR ?auto_751048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_751045 ?auto_751046 ?auto_751047 ?auto_751048 )
      ( MAKE-12PILE ?auto_751045 ?auto_751046 ?auto_751047 ?auto_751048 ?auto_751049 ?auto_751050 ?auto_751051 ?auto_751052 ?auto_751053 ?auto_751054 ?auto_751055 ?auto_751056 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_751095 - BLOCK
      ?auto_751096 - BLOCK
      ?auto_751097 - BLOCK
      ?auto_751098 - BLOCK
      ?auto_751099 - BLOCK
      ?auto_751100 - BLOCK
      ?auto_751101 - BLOCK
      ?auto_751102 - BLOCK
      ?auto_751103 - BLOCK
      ?auto_751104 - BLOCK
      ?auto_751105 - BLOCK
      ?auto_751106 - BLOCK
    )
    :vars
    (
      ?auto_751107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751106 ?auto_751107 ) ( ON-TABLE ?auto_751095 ) ( ON ?auto_751096 ?auto_751095 ) ( not ( = ?auto_751095 ?auto_751096 ) ) ( not ( = ?auto_751095 ?auto_751097 ) ) ( not ( = ?auto_751095 ?auto_751098 ) ) ( not ( = ?auto_751095 ?auto_751099 ) ) ( not ( = ?auto_751095 ?auto_751100 ) ) ( not ( = ?auto_751095 ?auto_751101 ) ) ( not ( = ?auto_751095 ?auto_751102 ) ) ( not ( = ?auto_751095 ?auto_751103 ) ) ( not ( = ?auto_751095 ?auto_751104 ) ) ( not ( = ?auto_751095 ?auto_751105 ) ) ( not ( = ?auto_751095 ?auto_751106 ) ) ( not ( = ?auto_751095 ?auto_751107 ) ) ( not ( = ?auto_751096 ?auto_751097 ) ) ( not ( = ?auto_751096 ?auto_751098 ) ) ( not ( = ?auto_751096 ?auto_751099 ) ) ( not ( = ?auto_751096 ?auto_751100 ) ) ( not ( = ?auto_751096 ?auto_751101 ) ) ( not ( = ?auto_751096 ?auto_751102 ) ) ( not ( = ?auto_751096 ?auto_751103 ) ) ( not ( = ?auto_751096 ?auto_751104 ) ) ( not ( = ?auto_751096 ?auto_751105 ) ) ( not ( = ?auto_751096 ?auto_751106 ) ) ( not ( = ?auto_751096 ?auto_751107 ) ) ( not ( = ?auto_751097 ?auto_751098 ) ) ( not ( = ?auto_751097 ?auto_751099 ) ) ( not ( = ?auto_751097 ?auto_751100 ) ) ( not ( = ?auto_751097 ?auto_751101 ) ) ( not ( = ?auto_751097 ?auto_751102 ) ) ( not ( = ?auto_751097 ?auto_751103 ) ) ( not ( = ?auto_751097 ?auto_751104 ) ) ( not ( = ?auto_751097 ?auto_751105 ) ) ( not ( = ?auto_751097 ?auto_751106 ) ) ( not ( = ?auto_751097 ?auto_751107 ) ) ( not ( = ?auto_751098 ?auto_751099 ) ) ( not ( = ?auto_751098 ?auto_751100 ) ) ( not ( = ?auto_751098 ?auto_751101 ) ) ( not ( = ?auto_751098 ?auto_751102 ) ) ( not ( = ?auto_751098 ?auto_751103 ) ) ( not ( = ?auto_751098 ?auto_751104 ) ) ( not ( = ?auto_751098 ?auto_751105 ) ) ( not ( = ?auto_751098 ?auto_751106 ) ) ( not ( = ?auto_751098 ?auto_751107 ) ) ( not ( = ?auto_751099 ?auto_751100 ) ) ( not ( = ?auto_751099 ?auto_751101 ) ) ( not ( = ?auto_751099 ?auto_751102 ) ) ( not ( = ?auto_751099 ?auto_751103 ) ) ( not ( = ?auto_751099 ?auto_751104 ) ) ( not ( = ?auto_751099 ?auto_751105 ) ) ( not ( = ?auto_751099 ?auto_751106 ) ) ( not ( = ?auto_751099 ?auto_751107 ) ) ( not ( = ?auto_751100 ?auto_751101 ) ) ( not ( = ?auto_751100 ?auto_751102 ) ) ( not ( = ?auto_751100 ?auto_751103 ) ) ( not ( = ?auto_751100 ?auto_751104 ) ) ( not ( = ?auto_751100 ?auto_751105 ) ) ( not ( = ?auto_751100 ?auto_751106 ) ) ( not ( = ?auto_751100 ?auto_751107 ) ) ( not ( = ?auto_751101 ?auto_751102 ) ) ( not ( = ?auto_751101 ?auto_751103 ) ) ( not ( = ?auto_751101 ?auto_751104 ) ) ( not ( = ?auto_751101 ?auto_751105 ) ) ( not ( = ?auto_751101 ?auto_751106 ) ) ( not ( = ?auto_751101 ?auto_751107 ) ) ( not ( = ?auto_751102 ?auto_751103 ) ) ( not ( = ?auto_751102 ?auto_751104 ) ) ( not ( = ?auto_751102 ?auto_751105 ) ) ( not ( = ?auto_751102 ?auto_751106 ) ) ( not ( = ?auto_751102 ?auto_751107 ) ) ( not ( = ?auto_751103 ?auto_751104 ) ) ( not ( = ?auto_751103 ?auto_751105 ) ) ( not ( = ?auto_751103 ?auto_751106 ) ) ( not ( = ?auto_751103 ?auto_751107 ) ) ( not ( = ?auto_751104 ?auto_751105 ) ) ( not ( = ?auto_751104 ?auto_751106 ) ) ( not ( = ?auto_751104 ?auto_751107 ) ) ( not ( = ?auto_751105 ?auto_751106 ) ) ( not ( = ?auto_751105 ?auto_751107 ) ) ( not ( = ?auto_751106 ?auto_751107 ) ) ( ON ?auto_751105 ?auto_751106 ) ( ON ?auto_751104 ?auto_751105 ) ( ON ?auto_751103 ?auto_751104 ) ( ON ?auto_751102 ?auto_751103 ) ( ON ?auto_751101 ?auto_751102 ) ( ON ?auto_751100 ?auto_751101 ) ( ON ?auto_751099 ?auto_751100 ) ( ON ?auto_751098 ?auto_751099 ) ( CLEAR ?auto_751096 ) ( ON ?auto_751097 ?auto_751098 ) ( CLEAR ?auto_751097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_751095 ?auto_751096 ?auto_751097 )
      ( MAKE-12PILE ?auto_751095 ?auto_751096 ?auto_751097 ?auto_751098 ?auto_751099 ?auto_751100 ?auto_751101 ?auto_751102 ?auto_751103 ?auto_751104 ?auto_751105 ?auto_751106 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_751145 - BLOCK
      ?auto_751146 - BLOCK
      ?auto_751147 - BLOCK
      ?auto_751148 - BLOCK
      ?auto_751149 - BLOCK
      ?auto_751150 - BLOCK
      ?auto_751151 - BLOCK
      ?auto_751152 - BLOCK
      ?auto_751153 - BLOCK
      ?auto_751154 - BLOCK
      ?auto_751155 - BLOCK
      ?auto_751156 - BLOCK
    )
    :vars
    (
      ?auto_751157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751156 ?auto_751157 ) ( ON-TABLE ?auto_751145 ) ( not ( = ?auto_751145 ?auto_751146 ) ) ( not ( = ?auto_751145 ?auto_751147 ) ) ( not ( = ?auto_751145 ?auto_751148 ) ) ( not ( = ?auto_751145 ?auto_751149 ) ) ( not ( = ?auto_751145 ?auto_751150 ) ) ( not ( = ?auto_751145 ?auto_751151 ) ) ( not ( = ?auto_751145 ?auto_751152 ) ) ( not ( = ?auto_751145 ?auto_751153 ) ) ( not ( = ?auto_751145 ?auto_751154 ) ) ( not ( = ?auto_751145 ?auto_751155 ) ) ( not ( = ?auto_751145 ?auto_751156 ) ) ( not ( = ?auto_751145 ?auto_751157 ) ) ( not ( = ?auto_751146 ?auto_751147 ) ) ( not ( = ?auto_751146 ?auto_751148 ) ) ( not ( = ?auto_751146 ?auto_751149 ) ) ( not ( = ?auto_751146 ?auto_751150 ) ) ( not ( = ?auto_751146 ?auto_751151 ) ) ( not ( = ?auto_751146 ?auto_751152 ) ) ( not ( = ?auto_751146 ?auto_751153 ) ) ( not ( = ?auto_751146 ?auto_751154 ) ) ( not ( = ?auto_751146 ?auto_751155 ) ) ( not ( = ?auto_751146 ?auto_751156 ) ) ( not ( = ?auto_751146 ?auto_751157 ) ) ( not ( = ?auto_751147 ?auto_751148 ) ) ( not ( = ?auto_751147 ?auto_751149 ) ) ( not ( = ?auto_751147 ?auto_751150 ) ) ( not ( = ?auto_751147 ?auto_751151 ) ) ( not ( = ?auto_751147 ?auto_751152 ) ) ( not ( = ?auto_751147 ?auto_751153 ) ) ( not ( = ?auto_751147 ?auto_751154 ) ) ( not ( = ?auto_751147 ?auto_751155 ) ) ( not ( = ?auto_751147 ?auto_751156 ) ) ( not ( = ?auto_751147 ?auto_751157 ) ) ( not ( = ?auto_751148 ?auto_751149 ) ) ( not ( = ?auto_751148 ?auto_751150 ) ) ( not ( = ?auto_751148 ?auto_751151 ) ) ( not ( = ?auto_751148 ?auto_751152 ) ) ( not ( = ?auto_751148 ?auto_751153 ) ) ( not ( = ?auto_751148 ?auto_751154 ) ) ( not ( = ?auto_751148 ?auto_751155 ) ) ( not ( = ?auto_751148 ?auto_751156 ) ) ( not ( = ?auto_751148 ?auto_751157 ) ) ( not ( = ?auto_751149 ?auto_751150 ) ) ( not ( = ?auto_751149 ?auto_751151 ) ) ( not ( = ?auto_751149 ?auto_751152 ) ) ( not ( = ?auto_751149 ?auto_751153 ) ) ( not ( = ?auto_751149 ?auto_751154 ) ) ( not ( = ?auto_751149 ?auto_751155 ) ) ( not ( = ?auto_751149 ?auto_751156 ) ) ( not ( = ?auto_751149 ?auto_751157 ) ) ( not ( = ?auto_751150 ?auto_751151 ) ) ( not ( = ?auto_751150 ?auto_751152 ) ) ( not ( = ?auto_751150 ?auto_751153 ) ) ( not ( = ?auto_751150 ?auto_751154 ) ) ( not ( = ?auto_751150 ?auto_751155 ) ) ( not ( = ?auto_751150 ?auto_751156 ) ) ( not ( = ?auto_751150 ?auto_751157 ) ) ( not ( = ?auto_751151 ?auto_751152 ) ) ( not ( = ?auto_751151 ?auto_751153 ) ) ( not ( = ?auto_751151 ?auto_751154 ) ) ( not ( = ?auto_751151 ?auto_751155 ) ) ( not ( = ?auto_751151 ?auto_751156 ) ) ( not ( = ?auto_751151 ?auto_751157 ) ) ( not ( = ?auto_751152 ?auto_751153 ) ) ( not ( = ?auto_751152 ?auto_751154 ) ) ( not ( = ?auto_751152 ?auto_751155 ) ) ( not ( = ?auto_751152 ?auto_751156 ) ) ( not ( = ?auto_751152 ?auto_751157 ) ) ( not ( = ?auto_751153 ?auto_751154 ) ) ( not ( = ?auto_751153 ?auto_751155 ) ) ( not ( = ?auto_751153 ?auto_751156 ) ) ( not ( = ?auto_751153 ?auto_751157 ) ) ( not ( = ?auto_751154 ?auto_751155 ) ) ( not ( = ?auto_751154 ?auto_751156 ) ) ( not ( = ?auto_751154 ?auto_751157 ) ) ( not ( = ?auto_751155 ?auto_751156 ) ) ( not ( = ?auto_751155 ?auto_751157 ) ) ( not ( = ?auto_751156 ?auto_751157 ) ) ( ON ?auto_751155 ?auto_751156 ) ( ON ?auto_751154 ?auto_751155 ) ( ON ?auto_751153 ?auto_751154 ) ( ON ?auto_751152 ?auto_751153 ) ( ON ?auto_751151 ?auto_751152 ) ( ON ?auto_751150 ?auto_751151 ) ( ON ?auto_751149 ?auto_751150 ) ( ON ?auto_751148 ?auto_751149 ) ( ON ?auto_751147 ?auto_751148 ) ( CLEAR ?auto_751145 ) ( ON ?auto_751146 ?auto_751147 ) ( CLEAR ?auto_751146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_751145 ?auto_751146 )
      ( MAKE-12PILE ?auto_751145 ?auto_751146 ?auto_751147 ?auto_751148 ?auto_751149 ?auto_751150 ?auto_751151 ?auto_751152 ?auto_751153 ?auto_751154 ?auto_751155 ?auto_751156 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_751195 - BLOCK
      ?auto_751196 - BLOCK
      ?auto_751197 - BLOCK
      ?auto_751198 - BLOCK
      ?auto_751199 - BLOCK
      ?auto_751200 - BLOCK
      ?auto_751201 - BLOCK
      ?auto_751202 - BLOCK
      ?auto_751203 - BLOCK
      ?auto_751204 - BLOCK
      ?auto_751205 - BLOCK
      ?auto_751206 - BLOCK
    )
    :vars
    (
      ?auto_751207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751206 ?auto_751207 ) ( not ( = ?auto_751195 ?auto_751196 ) ) ( not ( = ?auto_751195 ?auto_751197 ) ) ( not ( = ?auto_751195 ?auto_751198 ) ) ( not ( = ?auto_751195 ?auto_751199 ) ) ( not ( = ?auto_751195 ?auto_751200 ) ) ( not ( = ?auto_751195 ?auto_751201 ) ) ( not ( = ?auto_751195 ?auto_751202 ) ) ( not ( = ?auto_751195 ?auto_751203 ) ) ( not ( = ?auto_751195 ?auto_751204 ) ) ( not ( = ?auto_751195 ?auto_751205 ) ) ( not ( = ?auto_751195 ?auto_751206 ) ) ( not ( = ?auto_751195 ?auto_751207 ) ) ( not ( = ?auto_751196 ?auto_751197 ) ) ( not ( = ?auto_751196 ?auto_751198 ) ) ( not ( = ?auto_751196 ?auto_751199 ) ) ( not ( = ?auto_751196 ?auto_751200 ) ) ( not ( = ?auto_751196 ?auto_751201 ) ) ( not ( = ?auto_751196 ?auto_751202 ) ) ( not ( = ?auto_751196 ?auto_751203 ) ) ( not ( = ?auto_751196 ?auto_751204 ) ) ( not ( = ?auto_751196 ?auto_751205 ) ) ( not ( = ?auto_751196 ?auto_751206 ) ) ( not ( = ?auto_751196 ?auto_751207 ) ) ( not ( = ?auto_751197 ?auto_751198 ) ) ( not ( = ?auto_751197 ?auto_751199 ) ) ( not ( = ?auto_751197 ?auto_751200 ) ) ( not ( = ?auto_751197 ?auto_751201 ) ) ( not ( = ?auto_751197 ?auto_751202 ) ) ( not ( = ?auto_751197 ?auto_751203 ) ) ( not ( = ?auto_751197 ?auto_751204 ) ) ( not ( = ?auto_751197 ?auto_751205 ) ) ( not ( = ?auto_751197 ?auto_751206 ) ) ( not ( = ?auto_751197 ?auto_751207 ) ) ( not ( = ?auto_751198 ?auto_751199 ) ) ( not ( = ?auto_751198 ?auto_751200 ) ) ( not ( = ?auto_751198 ?auto_751201 ) ) ( not ( = ?auto_751198 ?auto_751202 ) ) ( not ( = ?auto_751198 ?auto_751203 ) ) ( not ( = ?auto_751198 ?auto_751204 ) ) ( not ( = ?auto_751198 ?auto_751205 ) ) ( not ( = ?auto_751198 ?auto_751206 ) ) ( not ( = ?auto_751198 ?auto_751207 ) ) ( not ( = ?auto_751199 ?auto_751200 ) ) ( not ( = ?auto_751199 ?auto_751201 ) ) ( not ( = ?auto_751199 ?auto_751202 ) ) ( not ( = ?auto_751199 ?auto_751203 ) ) ( not ( = ?auto_751199 ?auto_751204 ) ) ( not ( = ?auto_751199 ?auto_751205 ) ) ( not ( = ?auto_751199 ?auto_751206 ) ) ( not ( = ?auto_751199 ?auto_751207 ) ) ( not ( = ?auto_751200 ?auto_751201 ) ) ( not ( = ?auto_751200 ?auto_751202 ) ) ( not ( = ?auto_751200 ?auto_751203 ) ) ( not ( = ?auto_751200 ?auto_751204 ) ) ( not ( = ?auto_751200 ?auto_751205 ) ) ( not ( = ?auto_751200 ?auto_751206 ) ) ( not ( = ?auto_751200 ?auto_751207 ) ) ( not ( = ?auto_751201 ?auto_751202 ) ) ( not ( = ?auto_751201 ?auto_751203 ) ) ( not ( = ?auto_751201 ?auto_751204 ) ) ( not ( = ?auto_751201 ?auto_751205 ) ) ( not ( = ?auto_751201 ?auto_751206 ) ) ( not ( = ?auto_751201 ?auto_751207 ) ) ( not ( = ?auto_751202 ?auto_751203 ) ) ( not ( = ?auto_751202 ?auto_751204 ) ) ( not ( = ?auto_751202 ?auto_751205 ) ) ( not ( = ?auto_751202 ?auto_751206 ) ) ( not ( = ?auto_751202 ?auto_751207 ) ) ( not ( = ?auto_751203 ?auto_751204 ) ) ( not ( = ?auto_751203 ?auto_751205 ) ) ( not ( = ?auto_751203 ?auto_751206 ) ) ( not ( = ?auto_751203 ?auto_751207 ) ) ( not ( = ?auto_751204 ?auto_751205 ) ) ( not ( = ?auto_751204 ?auto_751206 ) ) ( not ( = ?auto_751204 ?auto_751207 ) ) ( not ( = ?auto_751205 ?auto_751206 ) ) ( not ( = ?auto_751205 ?auto_751207 ) ) ( not ( = ?auto_751206 ?auto_751207 ) ) ( ON ?auto_751205 ?auto_751206 ) ( ON ?auto_751204 ?auto_751205 ) ( ON ?auto_751203 ?auto_751204 ) ( ON ?auto_751202 ?auto_751203 ) ( ON ?auto_751201 ?auto_751202 ) ( ON ?auto_751200 ?auto_751201 ) ( ON ?auto_751199 ?auto_751200 ) ( ON ?auto_751198 ?auto_751199 ) ( ON ?auto_751197 ?auto_751198 ) ( ON ?auto_751196 ?auto_751197 ) ( ON ?auto_751195 ?auto_751196 ) ( CLEAR ?auto_751195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_751195 )
      ( MAKE-12PILE ?auto_751195 ?auto_751196 ?auto_751197 ?auto_751198 ?auto_751199 ?auto_751200 ?auto_751201 ?auto_751202 ?auto_751203 ?auto_751204 ?auto_751205 ?auto_751206 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751246 - BLOCK
      ?auto_751247 - BLOCK
      ?auto_751248 - BLOCK
      ?auto_751249 - BLOCK
      ?auto_751250 - BLOCK
      ?auto_751251 - BLOCK
      ?auto_751252 - BLOCK
      ?auto_751253 - BLOCK
      ?auto_751254 - BLOCK
      ?auto_751255 - BLOCK
      ?auto_751256 - BLOCK
      ?auto_751257 - BLOCK
      ?auto_751258 - BLOCK
    )
    :vars
    (
      ?auto_751259 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_751257 ) ( ON ?auto_751258 ?auto_751259 ) ( CLEAR ?auto_751258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_751246 ) ( ON ?auto_751247 ?auto_751246 ) ( ON ?auto_751248 ?auto_751247 ) ( ON ?auto_751249 ?auto_751248 ) ( ON ?auto_751250 ?auto_751249 ) ( ON ?auto_751251 ?auto_751250 ) ( ON ?auto_751252 ?auto_751251 ) ( ON ?auto_751253 ?auto_751252 ) ( ON ?auto_751254 ?auto_751253 ) ( ON ?auto_751255 ?auto_751254 ) ( ON ?auto_751256 ?auto_751255 ) ( ON ?auto_751257 ?auto_751256 ) ( not ( = ?auto_751246 ?auto_751247 ) ) ( not ( = ?auto_751246 ?auto_751248 ) ) ( not ( = ?auto_751246 ?auto_751249 ) ) ( not ( = ?auto_751246 ?auto_751250 ) ) ( not ( = ?auto_751246 ?auto_751251 ) ) ( not ( = ?auto_751246 ?auto_751252 ) ) ( not ( = ?auto_751246 ?auto_751253 ) ) ( not ( = ?auto_751246 ?auto_751254 ) ) ( not ( = ?auto_751246 ?auto_751255 ) ) ( not ( = ?auto_751246 ?auto_751256 ) ) ( not ( = ?auto_751246 ?auto_751257 ) ) ( not ( = ?auto_751246 ?auto_751258 ) ) ( not ( = ?auto_751246 ?auto_751259 ) ) ( not ( = ?auto_751247 ?auto_751248 ) ) ( not ( = ?auto_751247 ?auto_751249 ) ) ( not ( = ?auto_751247 ?auto_751250 ) ) ( not ( = ?auto_751247 ?auto_751251 ) ) ( not ( = ?auto_751247 ?auto_751252 ) ) ( not ( = ?auto_751247 ?auto_751253 ) ) ( not ( = ?auto_751247 ?auto_751254 ) ) ( not ( = ?auto_751247 ?auto_751255 ) ) ( not ( = ?auto_751247 ?auto_751256 ) ) ( not ( = ?auto_751247 ?auto_751257 ) ) ( not ( = ?auto_751247 ?auto_751258 ) ) ( not ( = ?auto_751247 ?auto_751259 ) ) ( not ( = ?auto_751248 ?auto_751249 ) ) ( not ( = ?auto_751248 ?auto_751250 ) ) ( not ( = ?auto_751248 ?auto_751251 ) ) ( not ( = ?auto_751248 ?auto_751252 ) ) ( not ( = ?auto_751248 ?auto_751253 ) ) ( not ( = ?auto_751248 ?auto_751254 ) ) ( not ( = ?auto_751248 ?auto_751255 ) ) ( not ( = ?auto_751248 ?auto_751256 ) ) ( not ( = ?auto_751248 ?auto_751257 ) ) ( not ( = ?auto_751248 ?auto_751258 ) ) ( not ( = ?auto_751248 ?auto_751259 ) ) ( not ( = ?auto_751249 ?auto_751250 ) ) ( not ( = ?auto_751249 ?auto_751251 ) ) ( not ( = ?auto_751249 ?auto_751252 ) ) ( not ( = ?auto_751249 ?auto_751253 ) ) ( not ( = ?auto_751249 ?auto_751254 ) ) ( not ( = ?auto_751249 ?auto_751255 ) ) ( not ( = ?auto_751249 ?auto_751256 ) ) ( not ( = ?auto_751249 ?auto_751257 ) ) ( not ( = ?auto_751249 ?auto_751258 ) ) ( not ( = ?auto_751249 ?auto_751259 ) ) ( not ( = ?auto_751250 ?auto_751251 ) ) ( not ( = ?auto_751250 ?auto_751252 ) ) ( not ( = ?auto_751250 ?auto_751253 ) ) ( not ( = ?auto_751250 ?auto_751254 ) ) ( not ( = ?auto_751250 ?auto_751255 ) ) ( not ( = ?auto_751250 ?auto_751256 ) ) ( not ( = ?auto_751250 ?auto_751257 ) ) ( not ( = ?auto_751250 ?auto_751258 ) ) ( not ( = ?auto_751250 ?auto_751259 ) ) ( not ( = ?auto_751251 ?auto_751252 ) ) ( not ( = ?auto_751251 ?auto_751253 ) ) ( not ( = ?auto_751251 ?auto_751254 ) ) ( not ( = ?auto_751251 ?auto_751255 ) ) ( not ( = ?auto_751251 ?auto_751256 ) ) ( not ( = ?auto_751251 ?auto_751257 ) ) ( not ( = ?auto_751251 ?auto_751258 ) ) ( not ( = ?auto_751251 ?auto_751259 ) ) ( not ( = ?auto_751252 ?auto_751253 ) ) ( not ( = ?auto_751252 ?auto_751254 ) ) ( not ( = ?auto_751252 ?auto_751255 ) ) ( not ( = ?auto_751252 ?auto_751256 ) ) ( not ( = ?auto_751252 ?auto_751257 ) ) ( not ( = ?auto_751252 ?auto_751258 ) ) ( not ( = ?auto_751252 ?auto_751259 ) ) ( not ( = ?auto_751253 ?auto_751254 ) ) ( not ( = ?auto_751253 ?auto_751255 ) ) ( not ( = ?auto_751253 ?auto_751256 ) ) ( not ( = ?auto_751253 ?auto_751257 ) ) ( not ( = ?auto_751253 ?auto_751258 ) ) ( not ( = ?auto_751253 ?auto_751259 ) ) ( not ( = ?auto_751254 ?auto_751255 ) ) ( not ( = ?auto_751254 ?auto_751256 ) ) ( not ( = ?auto_751254 ?auto_751257 ) ) ( not ( = ?auto_751254 ?auto_751258 ) ) ( not ( = ?auto_751254 ?auto_751259 ) ) ( not ( = ?auto_751255 ?auto_751256 ) ) ( not ( = ?auto_751255 ?auto_751257 ) ) ( not ( = ?auto_751255 ?auto_751258 ) ) ( not ( = ?auto_751255 ?auto_751259 ) ) ( not ( = ?auto_751256 ?auto_751257 ) ) ( not ( = ?auto_751256 ?auto_751258 ) ) ( not ( = ?auto_751256 ?auto_751259 ) ) ( not ( = ?auto_751257 ?auto_751258 ) ) ( not ( = ?auto_751257 ?auto_751259 ) ) ( not ( = ?auto_751258 ?auto_751259 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_751258 ?auto_751259 )
      ( !STACK ?auto_751258 ?auto_751257 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751300 - BLOCK
      ?auto_751301 - BLOCK
      ?auto_751302 - BLOCK
      ?auto_751303 - BLOCK
      ?auto_751304 - BLOCK
      ?auto_751305 - BLOCK
      ?auto_751306 - BLOCK
      ?auto_751307 - BLOCK
      ?auto_751308 - BLOCK
      ?auto_751309 - BLOCK
      ?auto_751310 - BLOCK
      ?auto_751311 - BLOCK
      ?auto_751312 - BLOCK
    )
    :vars
    (
      ?auto_751313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751312 ?auto_751313 ) ( ON-TABLE ?auto_751300 ) ( ON ?auto_751301 ?auto_751300 ) ( ON ?auto_751302 ?auto_751301 ) ( ON ?auto_751303 ?auto_751302 ) ( ON ?auto_751304 ?auto_751303 ) ( ON ?auto_751305 ?auto_751304 ) ( ON ?auto_751306 ?auto_751305 ) ( ON ?auto_751307 ?auto_751306 ) ( ON ?auto_751308 ?auto_751307 ) ( ON ?auto_751309 ?auto_751308 ) ( ON ?auto_751310 ?auto_751309 ) ( not ( = ?auto_751300 ?auto_751301 ) ) ( not ( = ?auto_751300 ?auto_751302 ) ) ( not ( = ?auto_751300 ?auto_751303 ) ) ( not ( = ?auto_751300 ?auto_751304 ) ) ( not ( = ?auto_751300 ?auto_751305 ) ) ( not ( = ?auto_751300 ?auto_751306 ) ) ( not ( = ?auto_751300 ?auto_751307 ) ) ( not ( = ?auto_751300 ?auto_751308 ) ) ( not ( = ?auto_751300 ?auto_751309 ) ) ( not ( = ?auto_751300 ?auto_751310 ) ) ( not ( = ?auto_751300 ?auto_751311 ) ) ( not ( = ?auto_751300 ?auto_751312 ) ) ( not ( = ?auto_751300 ?auto_751313 ) ) ( not ( = ?auto_751301 ?auto_751302 ) ) ( not ( = ?auto_751301 ?auto_751303 ) ) ( not ( = ?auto_751301 ?auto_751304 ) ) ( not ( = ?auto_751301 ?auto_751305 ) ) ( not ( = ?auto_751301 ?auto_751306 ) ) ( not ( = ?auto_751301 ?auto_751307 ) ) ( not ( = ?auto_751301 ?auto_751308 ) ) ( not ( = ?auto_751301 ?auto_751309 ) ) ( not ( = ?auto_751301 ?auto_751310 ) ) ( not ( = ?auto_751301 ?auto_751311 ) ) ( not ( = ?auto_751301 ?auto_751312 ) ) ( not ( = ?auto_751301 ?auto_751313 ) ) ( not ( = ?auto_751302 ?auto_751303 ) ) ( not ( = ?auto_751302 ?auto_751304 ) ) ( not ( = ?auto_751302 ?auto_751305 ) ) ( not ( = ?auto_751302 ?auto_751306 ) ) ( not ( = ?auto_751302 ?auto_751307 ) ) ( not ( = ?auto_751302 ?auto_751308 ) ) ( not ( = ?auto_751302 ?auto_751309 ) ) ( not ( = ?auto_751302 ?auto_751310 ) ) ( not ( = ?auto_751302 ?auto_751311 ) ) ( not ( = ?auto_751302 ?auto_751312 ) ) ( not ( = ?auto_751302 ?auto_751313 ) ) ( not ( = ?auto_751303 ?auto_751304 ) ) ( not ( = ?auto_751303 ?auto_751305 ) ) ( not ( = ?auto_751303 ?auto_751306 ) ) ( not ( = ?auto_751303 ?auto_751307 ) ) ( not ( = ?auto_751303 ?auto_751308 ) ) ( not ( = ?auto_751303 ?auto_751309 ) ) ( not ( = ?auto_751303 ?auto_751310 ) ) ( not ( = ?auto_751303 ?auto_751311 ) ) ( not ( = ?auto_751303 ?auto_751312 ) ) ( not ( = ?auto_751303 ?auto_751313 ) ) ( not ( = ?auto_751304 ?auto_751305 ) ) ( not ( = ?auto_751304 ?auto_751306 ) ) ( not ( = ?auto_751304 ?auto_751307 ) ) ( not ( = ?auto_751304 ?auto_751308 ) ) ( not ( = ?auto_751304 ?auto_751309 ) ) ( not ( = ?auto_751304 ?auto_751310 ) ) ( not ( = ?auto_751304 ?auto_751311 ) ) ( not ( = ?auto_751304 ?auto_751312 ) ) ( not ( = ?auto_751304 ?auto_751313 ) ) ( not ( = ?auto_751305 ?auto_751306 ) ) ( not ( = ?auto_751305 ?auto_751307 ) ) ( not ( = ?auto_751305 ?auto_751308 ) ) ( not ( = ?auto_751305 ?auto_751309 ) ) ( not ( = ?auto_751305 ?auto_751310 ) ) ( not ( = ?auto_751305 ?auto_751311 ) ) ( not ( = ?auto_751305 ?auto_751312 ) ) ( not ( = ?auto_751305 ?auto_751313 ) ) ( not ( = ?auto_751306 ?auto_751307 ) ) ( not ( = ?auto_751306 ?auto_751308 ) ) ( not ( = ?auto_751306 ?auto_751309 ) ) ( not ( = ?auto_751306 ?auto_751310 ) ) ( not ( = ?auto_751306 ?auto_751311 ) ) ( not ( = ?auto_751306 ?auto_751312 ) ) ( not ( = ?auto_751306 ?auto_751313 ) ) ( not ( = ?auto_751307 ?auto_751308 ) ) ( not ( = ?auto_751307 ?auto_751309 ) ) ( not ( = ?auto_751307 ?auto_751310 ) ) ( not ( = ?auto_751307 ?auto_751311 ) ) ( not ( = ?auto_751307 ?auto_751312 ) ) ( not ( = ?auto_751307 ?auto_751313 ) ) ( not ( = ?auto_751308 ?auto_751309 ) ) ( not ( = ?auto_751308 ?auto_751310 ) ) ( not ( = ?auto_751308 ?auto_751311 ) ) ( not ( = ?auto_751308 ?auto_751312 ) ) ( not ( = ?auto_751308 ?auto_751313 ) ) ( not ( = ?auto_751309 ?auto_751310 ) ) ( not ( = ?auto_751309 ?auto_751311 ) ) ( not ( = ?auto_751309 ?auto_751312 ) ) ( not ( = ?auto_751309 ?auto_751313 ) ) ( not ( = ?auto_751310 ?auto_751311 ) ) ( not ( = ?auto_751310 ?auto_751312 ) ) ( not ( = ?auto_751310 ?auto_751313 ) ) ( not ( = ?auto_751311 ?auto_751312 ) ) ( not ( = ?auto_751311 ?auto_751313 ) ) ( not ( = ?auto_751312 ?auto_751313 ) ) ( CLEAR ?auto_751310 ) ( ON ?auto_751311 ?auto_751312 ) ( CLEAR ?auto_751311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_751300 ?auto_751301 ?auto_751302 ?auto_751303 ?auto_751304 ?auto_751305 ?auto_751306 ?auto_751307 ?auto_751308 ?auto_751309 ?auto_751310 ?auto_751311 )
      ( MAKE-13PILE ?auto_751300 ?auto_751301 ?auto_751302 ?auto_751303 ?auto_751304 ?auto_751305 ?auto_751306 ?auto_751307 ?auto_751308 ?auto_751309 ?auto_751310 ?auto_751311 ?auto_751312 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751354 - BLOCK
      ?auto_751355 - BLOCK
      ?auto_751356 - BLOCK
      ?auto_751357 - BLOCK
      ?auto_751358 - BLOCK
      ?auto_751359 - BLOCK
      ?auto_751360 - BLOCK
      ?auto_751361 - BLOCK
      ?auto_751362 - BLOCK
      ?auto_751363 - BLOCK
      ?auto_751364 - BLOCK
      ?auto_751365 - BLOCK
      ?auto_751366 - BLOCK
    )
    :vars
    (
      ?auto_751367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751366 ?auto_751367 ) ( ON-TABLE ?auto_751354 ) ( ON ?auto_751355 ?auto_751354 ) ( ON ?auto_751356 ?auto_751355 ) ( ON ?auto_751357 ?auto_751356 ) ( ON ?auto_751358 ?auto_751357 ) ( ON ?auto_751359 ?auto_751358 ) ( ON ?auto_751360 ?auto_751359 ) ( ON ?auto_751361 ?auto_751360 ) ( ON ?auto_751362 ?auto_751361 ) ( ON ?auto_751363 ?auto_751362 ) ( not ( = ?auto_751354 ?auto_751355 ) ) ( not ( = ?auto_751354 ?auto_751356 ) ) ( not ( = ?auto_751354 ?auto_751357 ) ) ( not ( = ?auto_751354 ?auto_751358 ) ) ( not ( = ?auto_751354 ?auto_751359 ) ) ( not ( = ?auto_751354 ?auto_751360 ) ) ( not ( = ?auto_751354 ?auto_751361 ) ) ( not ( = ?auto_751354 ?auto_751362 ) ) ( not ( = ?auto_751354 ?auto_751363 ) ) ( not ( = ?auto_751354 ?auto_751364 ) ) ( not ( = ?auto_751354 ?auto_751365 ) ) ( not ( = ?auto_751354 ?auto_751366 ) ) ( not ( = ?auto_751354 ?auto_751367 ) ) ( not ( = ?auto_751355 ?auto_751356 ) ) ( not ( = ?auto_751355 ?auto_751357 ) ) ( not ( = ?auto_751355 ?auto_751358 ) ) ( not ( = ?auto_751355 ?auto_751359 ) ) ( not ( = ?auto_751355 ?auto_751360 ) ) ( not ( = ?auto_751355 ?auto_751361 ) ) ( not ( = ?auto_751355 ?auto_751362 ) ) ( not ( = ?auto_751355 ?auto_751363 ) ) ( not ( = ?auto_751355 ?auto_751364 ) ) ( not ( = ?auto_751355 ?auto_751365 ) ) ( not ( = ?auto_751355 ?auto_751366 ) ) ( not ( = ?auto_751355 ?auto_751367 ) ) ( not ( = ?auto_751356 ?auto_751357 ) ) ( not ( = ?auto_751356 ?auto_751358 ) ) ( not ( = ?auto_751356 ?auto_751359 ) ) ( not ( = ?auto_751356 ?auto_751360 ) ) ( not ( = ?auto_751356 ?auto_751361 ) ) ( not ( = ?auto_751356 ?auto_751362 ) ) ( not ( = ?auto_751356 ?auto_751363 ) ) ( not ( = ?auto_751356 ?auto_751364 ) ) ( not ( = ?auto_751356 ?auto_751365 ) ) ( not ( = ?auto_751356 ?auto_751366 ) ) ( not ( = ?auto_751356 ?auto_751367 ) ) ( not ( = ?auto_751357 ?auto_751358 ) ) ( not ( = ?auto_751357 ?auto_751359 ) ) ( not ( = ?auto_751357 ?auto_751360 ) ) ( not ( = ?auto_751357 ?auto_751361 ) ) ( not ( = ?auto_751357 ?auto_751362 ) ) ( not ( = ?auto_751357 ?auto_751363 ) ) ( not ( = ?auto_751357 ?auto_751364 ) ) ( not ( = ?auto_751357 ?auto_751365 ) ) ( not ( = ?auto_751357 ?auto_751366 ) ) ( not ( = ?auto_751357 ?auto_751367 ) ) ( not ( = ?auto_751358 ?auto_751359 ) ) ( not ( = ?auto_751358 ?auto_751360 ) ) ( not ( = ?auto_751358 ?auto_751361 ) ) ( not ( = ?auto_751358 ?auto_751362 ) ) ( not ( = ?auto_751358 ?auto_751363 ) ) ( not ( = ?auto_751358 ?auto_751364 ) ) ( not ( = ?auto_751358 ?auto_751365 ) ) ( not ( = ?auto_751358 ?auto_751366 ) ) ( not ( = ?auto_751358 ?auto_751367 ) ) ( not ( = ?auto_751359 ?auto_751360 ) ) ( not ( = ?auto_751359 ?auto_751361 ) ) ( not ( = ?auto_751359 ?auto_751362 ) ) ( not ( = ?auto_751359 ?auto_751363 ) ) ( not ( = ?auto_751359 ?auto_751364 ) ) ( not ( = ?auto_751359 ?auto_751365 ) ) ( not ( = ?auto_751359 ?auto_751366 ) ) ( not ( = ?auto_751359 ?auto_751367 ) ) ( not ( = ?auto_751360 ?auto_751361 ) ) ( not ( = ?auto_751360 ?auto_751362 ) ) ( not ( = ?auto_751360 ?auto_751363 ) ) ( not ( = ?auto_751360 ?auto_751364 ) ) ( not ( = ?auto_751360 ?auto_751365 ) ) ( not ( = ?auto_751360 ?auto_751366 ) ) ( not ( = ?auto_751360 ?auto_751367 ) ) ( not ( = ?auto_751361 ?auto_751362 ) ) ( not ( = ?auto_751361 ?auto_751363 ) ) ( not ( = ?auto_751361 ?auto_751364 ) ) ( not ( = ?auto_751361 ?auto_751365 ) ) ( not ( = ?auto_751361 ?auto_751366 ) ) ( not ( = ?auto_751361 ?auto_751367 ) ) ( not ( = ?auto_751362 ?auto_751363 ) ) ( not ( = ?auto_751362 ?auto_751364 ) ) ( not ( = ?auto_751362 ?auto_751365 ) ) ( not ( = ?auto_751362 ?auto_751366 ) ) ( not ( = ?auto_751362 ?auto_751367 ) ) ( not ( = ?auto_751363 ?auto_751364 ) ) ( not ( = ?auto_751363 ?auto_751365 ) ) ( not ( = ?auto_751363 ?auto_751366 ) ) ( not ( = ?auto_751363 ?auto_751367 ) ) ( not ( = ?auto_751364 ?auto_751365 ) ) ( not ( = ?auto_751364 ?auto_751366 ) ) ( not ( = ?auto_751364 ?auto_751367 ) ) ( not ( = ?auto_751365 ?auto_751366 ) ) ( not ( = ?auto_751365 ?auto_751367 ) ) ( not ( = ?auto_751366 ?auto_751367 ) ) ( ON ?auto_751365 ?auto_751366 ) ( CLEAR ?auto_751363 ) ( ON ?auto_751364 ?auto_751365 ) ( CLEAR ?auto_751364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_751354 ?auto_751355 ?auto_751356 ?auto_751357 ?auto_751358 ?auto_751359 ?auto_751360 ?auto_751361 ?auto_751362 ?auto_751363 ?auto_751364 )
      ( MAKE-13PILE ?auto_751354 ?auto_751355 ?auto_751356 ?auto_751357 ?auto_751358 ?auto_751359 ?auto_751360 ?auto_751361 ?auto_751362 ?auto_751363 ?auto_751364 ?auto_751365 ?auto_751366 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751408 - BLOCK
      ?auto_751409 - BLOCK
      ?auto_751410 - BLOCK
      ?auto_751411 - BLOCK
      ?auto_751412 - BLOCK
      ?auto_751413 - BLOCK
      ?auto_751414 - BLOCK
      ?auto_751415 - BLOCK
      ?auto_751416 - BLOCK
      ?auto_751417 - BLOCK
      ?auto_751418 - BLOCK
      ?auto_751419 - BLOCK
      ?auto_751420 - BLOCK
    )
    :vars
    (
      ?auto_751421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751420 ?auto_751421 ) ( ON-TABLE ?auto_751408 ) ( ON ?auto_751409 ?auto_751408 ) ( ON ?auto_751410 ?auto_751409 ) ( ON ?auto_751411 ?auto_751410 ) ( ON ?auto_751412 ?auto_751411 ) ( ON ?auto_751413 ?auto_751412 ) ( ON ?auto_751414 ?auto_751413 ) ( ON ?auto_751415 ?auto_751414 ) ( ON ?auto_751416 ?auto_751415 ) ( not ( = ?auto_751408 ?auto_751409 ) ) ( not ( = ?auto_751408 ?auto_751410 ) ) ( not ( = ?auto_751408 ?auto_751411 ) ) ( not ( = ?auto_751408 ?auto_751412 ) ) ( not ( = ?auto_751408 ?auto_751413 ) ) ( not ( = ?auto_751408 ?auto_751414 ) ) ( not ( = ?auto_751408 ?auto_751415 ) ) ( not ( = ?auto_751408 ?auto_751416 ) ) ( not ( = ?auto_751408 ?auto_751417 ) ) ( not ( = ?auto_751408 ?auto_751418 ) ) ( not ( = ?auto_751408 ?auto_751419 ) ) ( not ( = ?auto_751408 ?auto_751420 ) ) ( not ( = ?auto_751408 ?auto_751421 ) ) ( not ( = ?auto_751409 ?auto_751410 ) ) ( not ( = ?auto_751409 ?auto_751411 ) ) ( not ( = ?auto_751409 ?auto_751412 ) ) ( not ( = ?auto_751409 ?auto_751413 ) ) ( not ( = ?auto_751409 ?auto_751414 ) ) ( not ( = ?auto_751409 ?auto_751415 ) ) ( not ( = ?auto_751409 ?auto_751416 ) ) ( not ( = ?auto_751409 ?auto_751417 ) ) ( not ( = ?auto_751409 ?auto_751418 ) ) ( not ( = ?auto_751409 ?auto_751419 ) ) ( not ( = ?auto_751409 ?auto_751420 ) ) ( not ( = ?auto_751409 ?auto_751421 ) ) ( not ( = ?auto_751410 ?auto_751411 ) ) ( not ( = ?auto_751410 ?auto_751412 ) ) ( not ( = ?auto_751410 ?auto_751413 ) ) ( not ( = ?auto_751410 ?auto_751414 ) ) ( not ( = ?auto_751410 ?auto_751415 ) ) ( not ( = ?auto_751410 ?auto_751416 ) ) ( not ( = ?auto_751410 ?auto_751417 ) ) ( not ( = ?auto_751410 ?auto_751418 ) ) ( not ( = ?auto_751410 ?auto_751419 ) ) ( not ( = ?auto_751410 ?auto_751420 ) ) ( not ( = ?auto_751410 ?auto_751421 ) ) ( not ( = ?auto_751411 ?auto_751412 ) ) ( not ( = ?auto_751411 ?auto_751413 ) ) ( not ( = ?auto_751411 ?auto_751414 ) ) ( not ( = ?auto_751411 ?auto_751415 ) ) ( not ( = ?auto_751411 ?auto_751416 ) ) ( not ( = ?auto_751411 ?auto_751417 ) ) ( not ( = ?auto_751411 ?auto_751418 ) ) ( not ( = ?auto_751411 ?auto_751419 ) ) ( not ( = ?auto_751411 ?auto_751420 ) ) ( not ( = ?auto_751411 ?auto_751421 ) ) ( not ( = ?auto_751412 ?auto_751413 ) ) ( not ( = ?auto_751412 ?auto_751414 ) ) ( not ( = ?auto_751412 ?auto_751415 ) ) ( not ( = ?auto_751412 ?auto_751416 ) ) ( not ( = ?auto_751412 ?auto_751417 ) ) ( not ( = ?auto_751412 ?auto_751418 ) ) ( not ( = ?auto_751412 ?auto_751419 ) ) ( not ( = ?auto_751412 ?auto_751420 ) ) ( not ( = ?auto_751412 ?auto_751421 ) ) ( not ( = ?auto_751413 ?auto_751414 ) ) ( not ( = ?auto_751413 ?auto_751415 ) ) ( not ( = ?auto_751413 ?auto_751416 ) ) ( not ( = ?auto_751413 ?auto_751417 ) ) ( not ( = ?auto_751413 ?auto_751418 ) ) ( not ( = ?auto_751413 ?auto_751419 ) ) ( not ( = ?auto_751413 ?auto_751420 ) ) ( not ( = ?auto_751413 ?auto_751421 ) ) ( not ( = ?auto_751414 ?auto_751415 ) ) ( not ( = ?auto_751414 ?auto_751416 ) ) ( not ( = ?auto_751414 ?auto_751417 ) ) ( not ( = ?auto_751414 ?auto_751418 ) ) ( not ( = ?auto_751414 ?auto_751419 ) ) ( not ( = ?auto_751414 ?auto_751420 ) ) ( not ( = ?auto_751414 ?auto_751421 ) ) ( not ( = ?auto_751415 ?auto_751416 ) ) ( not ( = ?auto_751415 ?auto_751417 ) ) ( not ( = ?auto_751415 ?auto_751418 ) ) ( not ( = ?auto_751415 ?auto_751419 ) ) ( not ( = ?auto_751415 ?auto_751420 ) ) ( not ( = ?auto_751415 ?auto_751421 ) ) ( not ( = ?auto_751416 ?auto_751417 ) ) ( not ( = ?auto_751416 ?auto_751418 ) ) ( not ( = ?auto_751416 ?auto_751419 ) ) ( not ( = ?auto_751416 ?auto_751420 ) ) ( not ( = ?auto_751416 ?auto_751421 ) ) ( not ( = ?auto_751417 ?auto_751418 ) ) ( not ( = ?auto_751417 ?auto_751419 ) ) ( not ( = ?auto_751417 ?auto_751420 ) ) ( not ( = ?auto_751417 ?auto_751421 ) ) ( not ( = ?auto_751418 ?auto_751419 ) ) ( not ( = ?auto_751418 ?auto_751420 ) ) ( not ( = ?auto_751418 ?auto_751421 ) ) ( not ( = ?auto_751419 ?auto_751420 ) ) ( not ( = ?auto_751419 ?auto_751421 ) ) ( not ( = ?auto_751420 ?auto_751421 ) ) ( ON ?auto_751419 ?auto_751420 ) ( ON ?auto_751418 ?auto_751419 ) ( CLEAR ?auto_751416 ) ( ON ?auto_751417 ?auto_751418 ) ( CLEAR ?auto_751417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_751408 ?auto_751409 ?auto_751410 ?auto_751411 ?auto_751412 ?auto_751413 ?auto_751414 ?auto_751415 ?auto_751416 ?auto_751417 )
      ( MAKE-13PILE ?auto_751408 ?auto_751409 ?auto_751410 ?auto_751411 ?auto_751412 ?auto_751413 ?auto_751414 ?auto_751415 ?auto_751416 ?auto_751417 ?auto_751418 ?auto_751419 ?auto_751420 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751462 - BLOCK
      ?auto_751463 - BLOCK
      ?auto_751464 - BLOCK
      ?auto_751465 - BLOCK
      ?auto_751466 - BLOCK
      ?auto_751467 - BLOCK
      ?auto_751468 - BLOCK
      ?auto_751469 - BLOCK
      ?auto_751470 - BLOCK
      ?auto_751471 - BLOCK
      ?auto_751472 - BLOCK
      ?auto_751473 - BLOCK
      ?auto_751474 - BLOCK
    )
    :vars
    (
      ?auto_751475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751474 ?auto_751475 ) ( ON-TABLE ?auto_751462 ) ( ON ?auto_751463 ?auto_751462 ) ( ON ?auto_751464 ?auto_751463 ) ( ON ?auto_751465 ?auto_751464 ) ( ON ?auto_751466 ?auto_751465 ) ( ON ?auto_751467 ?auto_751466 ) ( ON ?auto_751468 ?auto_751467 ) ( ON ?auto_751469 ?auto_751468 ) ( not ( = ?auto_751462 ?auto_751463 ) ) ( not ( = ?auto_751462 ?auto_751464 ) ) ( not ( = ?auto_751462 ?auto_751465 ) ) ( not ( = ?auto_751462 ?auto_751466 ) ) ( not ( = ?auto_751462 ?auto_751467 ) ) ( not ( = ?auto_751462 ?auto_751468 ) ) ( not ( = ?auto_751462 ?auto_751469 ) ) ( not ( = ?auto_751462 ?auto_751470 ) ) ( not ( = ?auto_751462 ?auto_751471 ) ) ( not ( = ?auto_751462 ?auto_751472 ) ) ( not ( = ?auto_751462 ?auto_751473 ) ) ( not ( = ?auto_751462 ?auto_751474 ) ) ( not ( = ?auto_751462 ?auto_751475 ) ) ( not ( = ?auto_751463 ?auto_751464 ) ) ( not ( = ?auto_751463 ?auto_751465 ) ) ( not ( = ?auto_751463 ?auto_751466 ) ) ( not ( = ?auto_751463 ?auto_751467 ) ) ( not ( = ?auto_751463 ?auto_751468 ) ) ( not ( = ?auto_751463 ?auto_751469 ) ) ( not ( = ?auto_751463 ?auto_751470 ) ) ( not ( = ?auto_751463 ?auto_751471 ) ) ( not ( = ?auto_751463 ?auto_751472 ) ) ( not ( = ?auto_751463 ?auto_751473 ) ) ( not ( = ?auto_751463 ?auto_751474 ) ) ( not ( = ?auto_751463 ?auto_751475 ) ) ( not ( = ?auto_751464 ?auto_751465 ) ) ( not ( = ?auto_751464 ?auto_751466 ) ) ( not ( = ?auto_751464 ?auto_751467 ) ) ( not ( = ?auto_751464 ?auto_751468 ) ) ( not ( = ?auto_751464 ?auto_751469 ) ) ( not ( = ?auto_751464 ?auto_751470 ) ) ( not ( = ?auto_751464 ?auto_751471 ) ) ( not ( = ?auto_751464 ?auto_751472 ) ) ( not ( = ?auto_751464 ?auto_751473 ) ) ( not ( = ?auto_751464 ?auto_751474 ) ) ( not ( = ?auto_751464 ?auto_751475 ) ) ( not ( = ?auto_751465 ?auto_751466 ) ) ( not ( = ?auto_751465 ?auto_751467 ) ) ( not ( = ?auto_751465 ?auto_751468 ) ) ( not ( = ?auto_751465 ?auto_751469 ) ) ( not ( = ?auto_751465 ?auto_751470 ) ) ( not ( = ?auto_751465 ?auto_751471 ) ) ( not ( = ?auto_751465 ?auto_751472 ) ) ( not ( = ?auto_751465 ?auto_751473 ) ) ( not ( = ?auto_751465 ?auto_751474 ) ) ( not ( = ?auto_751465 ?auto_751475 ) ) ( not ( = ?auto_751466 ?auto_751467 ) ) ( not ( = ?auto_751466 ?auto_751468 ) ) ( not ( = ?auto_751466 ?auto_751469 ) ) ( not ( = ?auto_751466 ?auto_751470 ) ) ( not ( = ?auto_751466 ?auto_751471 ) ) ( not ( = ?auto_751466 ?auto_751472 ) ) ( not ( = ?auto_751466 ?auto_751473 ) ) ( not ( = ?auto_751466 ?auto_751474 ) ) ( not ( = ?auto_751466 ?auto_751475 ) ) ( not ( = ?auto_751467 ?auto_751468 ) ) ( not ( = ?auto_751467 ?auto_751469 ) ) ( not ( = ?auto_751467 ?auto_751470 ) ) ( not ( = ?auto_751467 ?auto_751471 ) ) ( not ( = ?auto_751467 ?auto_751472 ) ) ( not ( = ?auto_751467 ?auto_751473 ) ) ( not ( = ?auto_751467 ?auto_751474 ) ) ( not ( = ?auto_751467 ?auto_751475 ) ) ( not ( = ?auto_751468 ?auto_751469 ) ) ( not ( = ?auto_751468 ?auto_751470 ) ) ( not ( = ?auto_751468 ?auto_751471 ) ) ( not ( = ?auto_751468 ?auto_751472 ) ) ( not ( = ?auto_751468 ?auto_751473 ) ) ( not ( = ?auto_751468 ?auto_751474 ) ) ( not ( = ?auto_751468 ?auto_751475 ) ) ( not ( = ?auto_751469 ?auto_751470 ) ) ( not ( = ?auto_751469 ?auto_751471 ) ) ( not ( = ?auto_751469 ?auto_751472 ) ) ( not ( = ?auto_751469 ?auto_751473 ) ) ( not ( = ?auto_751469 ?auto_751474 ) ) ( not ( = ?auto_751469 ?auto_751475 ) ) ( not ( = ?auto_751470 ?auto_751471 ) ) ( not ( = ?auto_751470 ?auto_751472 ) ) ( not ( = ?auto_751470 ?auto_751473 ) ) ( not ( = ?auto_751470 ?auto_751474 ) ) ( not ( = ?auto_751470 ?auto_751475 ) ) ( not ( = ?auto_751471 ?auto_751472 ) ) ( not ( = ?auto_751471 ?auto_751473 ) ) ( not ( = ?auto_751471 ?auto_751474 ) ) ( not ( = ?auto_751471 ?auto_751475 ) ) ( not ( = ?auto_751472 ?auto_751473 ) ) ( not ( = ?auto_751472 ?auto_751474 ) ) ( not ( = ?auto_751472 ?auto_751475 ) ) ( not ( = ?auto_751473 ?auto_751474 ) ) ( not ( = ?auto_751473 ?auto_751475 ) ) ( not ( = ?auto_751474 ?auto_751475 ) ) ( ON ?auto_751473 ?auto_751474 ) ( ON ?auto_751472 ?auto_751473 ) ( ON ?auto_751471 ?auto_751472 ) ( CLEAR ?auto_751469 ) ( ON ?auto_751470 ?auto_751471 ) ( CLEAR ?auto_751470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_751462 ?auto_751463 ?auto_751464 ?auto_751465 ?auto_751466 ?auto_751467 ?auto_751468 ?auto_751469 ?auto_751470 )
      ( MAKE-13PILE ?auto_751462 ?auto_751463 ?auto_751464 ?auto_751465 ?auto_751466 ?auto_751467 ?auto_751468 ?auto_751469 ?auto_751470 ?auto_751471 ?auto_751472 ?auto_751473 ?auto_751474 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751516 - BLOCK
      ?auto_751517 - BLOCK
      ?auto_751518 - BLOCK
      ?auto_751519 - BLOCK
      ?auto_751520 - BLOCK
      ?auto_751521 - BLOCK
      ?auto_751522 - BLOCK
      ?auto_751523 - BLOCK
      ?auto_751524 - BLOCK
      ?auto_751525 - BLOCK
      ?auto_751526 - BLOCK
      ?auto_751527 - BLOCK
      ?auto_751528 - BLOCK
    )
    :vars
    (
      ?auto_751529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751528 ?auto_751529 ) ( ON-TABLE ?auto_751516 ) ( ON ?auto_751517 ?auto_751516 ) ( ON ?auto_751518 ?auto_751517 ) ( ON ?auto_751519 ?auto_751518 ) ( ON ?auto_751520 ?auto_751519 ) ( ON ?auto_751521 ?auto_751520 ) ( ON ?auto_751522 ?auto_751521 ) ( not ( = ?auto_751516 ?auto_751517 ) ) ( not ( = ?auto_751516 ?auto_751518 ) ) ( not ( = ?auto_751516 ?auto_751519 ) ) ( not ( = ?auto_751516 ?auto_751520 ) ) ( not ( = ?auto_751516 ?auto_751521 ) ) ( not ( = ?auto_751516 ?auto_751522 ) ) ( not ( = ?auto_751516 ?auto_751523 ) ) ( not ( = ?auto_751516 ?auto_751524 ) ) ( not ( = ?auto_751516 ?auto_751525 ) ) ( not ( = ?auto_751516 ?auto_751526 ) ) ( not ( = ?auto_751516 ?auto_751527 ) ) ( not ( = ?auto_751516 ?auto_751528 ) ) ( not ( = ?auto_751516 ?auto_751529 ) ) ( not ( = ?auto_751517 ?auto_751518 ) ) ( not ( = ?auto_751517 ?auto_751519 ) ) ( not ( = ?auto_751517 ?auto_751520 ) ) ( not ( = ?auto_751517 ?auto_751521 ) ) ( not ( = ?auto_751517 ?auto_751522 ) ) ( not ( = ?auto_751517 ?auto_751523 ) ) ( not ( = ?auto_751517 ?auto_751524 ) ) ( not ( = ?auto_751517 ?auto_751525 ) ) ( not ( = ?auto_751517 ?auto_751526 ) ) ( not ( = ?auto_751517 ?auto_751527 ) ) ( not ( = ?auto_751517 ?auto_751528 ) ) ( not ( = ?auto_751517 ?auto_751529 ) ) ( not ( = ?auto_751518 ?auto_751519 ) ) ( not ( = ?auto_751518 ?auto_751520 ) ) ( not ( = ?auto_751518 ?auto_751521 ) ) ( not ( = ?auto_751518 ?auto_751522 ) ) ( not ( = ?auto_751518 ?auto_751523 ) ) ( not ( = ?auto_751518 ?auto_751524 ) ) ( not ( = ?auto_751518 ?auto_751525 ) ) ( not ( = ?auto_751518 ?auto_751526 ) ) ( not ( = ?auto_751518 ?auto_751527 ) ) ( not ( = ?auto_751518 ?auto_751528 ) ) ( not ( = ?auto_751518 ?auto_751529 ) ) ( not ( = ?auto_751519 ?auto_751520 ) ) ( not ( = ?auto_751519 ?auto_751521 ) ) ( not ( = ?auto_751519 ?auto_751522 ) ) ( not ( = ?auto_751519 ?auto_751523 ) ) ( not ( = ?auto_751519 ?auto_751524 ) ) ( not ( = ?auto_751519 ?auto_751525 ) ) ( not ( = ?auto_751519 ?auto_751526 ) ) ( not ( = ?auto_751519 ?auto_751527 ) ) ( not ( = ?auto_751519 ?auto_751528 ) ) ( not ( = ?auto_751519 ?auto_751529 ) ) ( not ( = ?auto_751520 ?auto_751521 ) ) ( not ( = ?auto_751520 ?auto_751522 ) ) ( not ( = ?auto_751520 ?auto_751523 ) ) ( not ( = ?auto_751520 ?auto_751524 ) ) ( not ( = ?auto_751520 ?auto_751525 ) ) ( not ( = ?auto_751520 ?auto_751526 ) ) ( not ( = ?auto_751520 ?auto_751527 ) ) ( not ( = ?auto_751520 ?auto_751528 ) ) ( not ( = ?auto_751520 ?auto_751529 ) ) ( not ( = ?auto_751521 ?auto_751522 ) ) ( not ( = ?auto_751521 ?auto_751523 ) ) ( not ( = ?auto_751521 ?auto_751524 ) ) ( not ( = ?auto_751521 ?auto_751525 ) ) ( not ( = ?auto_751521 ?auto_751526 ) ) ( not ( = ?auto_751521 ?auto_751527 ) ) ( not ( = ?auto_751521 ?auto_751528 ) ) ( not ( = ?auto_751521 ?auto_751529 ) ) ( not ( = ?auto_751522 ?auto_751523 ) ) ( not ( = ?auto_751522 ?auto_751524 ) ) ( not ( = ?auto_751522 ?auto_751525 ) ) ( not ( = ?auto_751522 ?auto_751526 ) ) ( not ( = ?auto_751522 ?auto_751527 ) ) ( not ( = ?auto_751522 ?auto_751528 ) ) ( not ( = ?auto_751522 ?auto_751529 ) ) ( not ( = ?auto_751523 ?auto_751524 ) ) ( not ( = ?auto_751523 ?auto_751525 ) ) ( not ( = ?auto_751523 ?auto_751526 ) ) ( not ( = ?auto_751523 ?auto_751527 ) ) ( not ( = ?auto_751523 ?auto_751528 ) ) ( not ( = ?auto_751523 ?auto_751529 ) ) ( not ( = ?auto_751524 ?auto_751525 ) ) ( not ( = ?auto_751524 ?auto_751526 ) ) ( not ( = ?auto_751524 ?auto_751527 ) ) ( not ( = ?auto_751524 ?auto_751528 ) ) ( not ( = ?auto_751524 ?auto_751529 ) ) ( not ( = ?auto_751525 ?auto_751526 ) ) ( not ( = ?auto_751525 ?auto_751527 ) ) ( not ( = ?auto_751525 ?auto_751528 ) ) ( not ( = ?auto_751525 ?auto_751529 ) ) ( not ( = ?auto_751526 ?auto_751527 ) ) ( not ( = ?auto_751526 ?auto_751528 ) ) ( not ( = ?auto_751526 ?auto_751529 ) ) ( not ( = ?auto_751527 ?auto_751528 ) ) ( not ( = ?auto_751527 ?auto_751529 ) ) ( not ( = ?auto_751528 ?auto_751529 ) ) ( ON ?auto_751527 ?auto_751528 ) ( ON ?auto_751526 ?auto_751527 ) ( ON ?auto_751525 ?auto_751526 ) ( ON ?auto_751524 ?auto_751525 ) ( CLEAR ?auto_751522 ) ( ON ?auto_751523 ?auto_751524 ) ( CLEAR ?auto_751523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_751516 ?auto_751517 ?auto_751518 ?auto_751519 ?auto_751520 ?auto_751521 ?auto_751522 ?auto_751523 )
      ( MAKE-13PILE ?auto_751516 ?auto_751517 ?auto_751518 ?auto_751519 ?auto_751520 ?auto_751521 ?auto_751522 ?auto_751523 ?auto_751524 ?auto_751525 ?auto_751526 ?auto_751527 ?auto_751528 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751570 - BLOCK
      ?auto_751571 - BLOCK
      ?auto_751572 - BLOCK
      ?auto_751573 - BLOCK
      ?auto_751574 - BLOCK
      ?auto_751575 - BLOCK
      ?auto_751576 - BLOCK
      ?auto_751577 - BLOCK
      ?auto_751578 - BLOCK
      ?auto_751579 - BLOCK
      ?auto_751580 - BLOCK
      ?auto_751581 - BLOCK
      ?auto_751582 - BLOCK
    )
    :vars
    (
      ?auto_751583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751582 ?auto_751583 ) ( ON-TABLE ?auto_751570 ) ( ON ?auto_751571 ?auto_751570 ) ( ON ?auto_751572 ?auto_751571 ) ( ON ?auto_751573 ?auto_751572 ) ( ON ?auto_751574 ?auto_751573 ) ( ON ?auto_751575 ?auto_751574 ) ( not ( = ?auto_751570 ?auto_751571 ) ) ( not ( = ?auto_751570 ?auto_751572 ) ) ( not ( = ?auto_751570 ?auto_751573 ) ) ( not ( = ?auto_751570 ?auto_751574 ) ) ( not ( = ?auto_751570 ?auto_751575 ) ) ( not ( = ?auto_751570 ?auto_751576 ) ) ( not ( = ?auto_751570 ?auto_751577 ) ) ( not ( = ?auto_751570 ?auto_751578 ) ) ( not ( = ?auto_751570 ?auto_751579 ) ) ( not ( = ?auto_751570 ?auto_751580 ) ) ( not ( = ?auto_751570 ?auto_751581 ) ) ( not ( = ?auto_751570 ?auto_751582 ) ) ( not ( = ?auto_751570 ?auto_751583 ) ) ( not ( = ?auto_751571 ?auto_751572 ) ) ( not ( = ?auto_751571 ?auto_751573 ) ) ( not ( = ?auto_751571 ?auto_751574 ) ) ( not ( = ?auto_751571 ?auto_751575 ) ) ( not ( = ?auto_751571 ?auto_751576 ) ) ( not ( = ?auto_751571 ?auto_751577 ) ) ( not ( = ?auto_751571 ?auto_751578 ) ) ( not ( = ?auto_751571 ?auto_751579 ) ) ( not ( = ?auto_751571 ?auto_751580 ) ) ( not ( = ?auto_751571 ?auto_751581 ) ) ( not ( = ?auto_751571 ?auto_751582 ) ) ( not ( = ?auto_751571 ?auto_751583 ) ) ( not ( = ?auto_751572 ?auto_751573 ) ) ( not ( = ?auto_751572 ?auto_751574 ) ) ( not ( = ?auto_751572 ?auto_751575 ) ) ( not ( = ?auto_751572 ?auto_751576 ) ) ( not ( = ?auto_751572 ?auto_751577 ) ) ( not ( = ?auto_751572 ?auto_751578 ) ) ( not ( = ?auto_751572 ?auto_751579 ) ) ( not ( = ?auto_751572 ?auto_751580 ) ) ( not ( = ?auto_751572 ?auto_751581 ) ) ( not ( = ?auto_751572 ?auto_751582 ) ) ( not ( = ?auto_751572 ?auto_751583 ) ) ( not ( = ?auto_751573 ?auto_751574 ) ) ( not ( = ?auto_751573 ?auto_751575 ) ) ( not ( = ?auto_751573 ?auto_751576 ) ) ( not ( = ?auto_751573 ?auto_751577 ) ) ( not ( = ?auto_751573 ?auto_751578 ) ) ( not ( = ?auto_751573 ?auto_751579 ) ) ( not ( = ?auto_751573 ?auto_751580 ) ) ( not ( = ?auto_751573 ?auto_751581 ) ) ( not ( = ?auto_751573 ?auto_751582 ) ) ( not ( = ?auto_751573 ?auto_751583 ) ) ( not ( = ?auto_751574 ?auto_751575 ) ) ( not ( = ?auto_751574 ?auto_751576 ) ) ( not ( = ?auto_751574 ?auto_751577 ) ) ( not ( = ?auto_751574 ?auto_751578 ) ) ( not ( = ?auto_751574 ?auto_751579 ) ) ( not ( = ?auto_751574 ?auto_751580 ) ) ( not ( = ?auto_751574 ?auto_751581 ) ) ( not ( = ?auto_751574 ?auto_751582 ) ) ( not ( = ?auto_751574 ?auto_751583 ) ) ( not ( = ?auto_751575 ?auto_751576 ) ) ( not ( = ?auto_751575 ?auto_751577 ) ) ( not ( = ?auto_751575 ?auto_751578 ) ) ( not ( = ?auto_751575 ?auto_751579 ) ) ( not ( = ?auto_751575 ?auto_751580 ) ) ( not ( = ?auto_751575 ?auto_751581 ) ) ( not ( = ?auto_751575 ?auto_751582 ) ) ( not ( = ?auto_751575 ?auto_751583 ) ) ( not ( = ?auto_751576 ?auto_751577 ) ) ( not ( = ?auto_751576 ?auto_751578 ) ) ( not ( = ?auto_751576 ?auto_751579 ) ) ( not ( = ?auto_751576 ?auto_751580 ) ) ( not ( = ?auto_751576 ?auto_751581 ) ) ( not ( = ?auto_751576 ?auto_751582 ) ) ( not ( = ?auto_751576 ?auto_751583 ) ) ( not ( = ?auto_751577 ?auto_751578 ) ) ( not ( = ?auto_751577 ?auto_751579 ) ) ( not ( = ?auto_751577 ?auto_751580 ) ) ( not ( = ?auto_751577 ?auto_751581 ) ) ( not ( = ?auto_751577 ?auto_751582 ) ) ( not ( = ?auto_751577 ?auto_751583 ) ) ( not ( = ?auto_751578 ?auto_751579 ) ) ( not ( = ?auto_751578 ?auto_751580 ) ) ( not ( = ?auto_751578 ?auto_751581 ) ) ( not ( = ?auto_751578 ?auto_751582 ) ) ( not ( = ?auto_751578 ?auto_751583 ) ) ( not ( = ?auto_751579 ?auto_751580 ) ) ( not ( = ?auto_751579 ?auto_751581 ) ) ( not ( = ?auto_751579 ?auto_751582 ) ) ( not ( = ?auto_751579 ?auto_751583 ) ) ( not ( = ?auto_751580 ?auto_751581 ) ) ( not ( = ?auto_751580 ?auto_751582 ) ) ( not ( = ?auto_751580 ?auto_751583 ) ) ( not ( = ?auto_751581 ?auto_751582 ) ) ( not ( = ?auto_751581 ?auto_751583 ) ) ( not ( = ?auto_751582 ?auto_751583 ) ) ( ON ?auto_751581 ?auto_751582 ) ( ON ?auto_751580 ?auto_751581 ) ( ON ?auto_751579 ?auto_751580 ) ( ON ?auto_751578 ?auto_751579 ) ( ON ?auto_751577 ?auto_751578 ) ( CLEAR ?auto_751575 ) ( ON ?auto_751576 ?auto_751577 ) ( CLEAR ?auto_751576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_751570 ?auto_751571 ?auto_751572 ?auto_751573 ?auto_751574 ?auto_751575 ?auto_751576 )
      ( MAKE-13PILE ?auto_751570 ?auto_751571 ?auto_751572 ?auto_751573 ?auto_751574 ?auto_751575 ?auto_751576 ?auto_751577 ?auto_751578 ?auto_751579 ?auto_751580 ?auto_751581 ?auto_751582 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751624 - BLOCK
      ?auto_751625 - BLOCK
      ?auto_751626 - BLOCK
      ?auto_751627 - BLOCK
      ?auto_751628 - BLOCK
      ?auto_751629 - BLOCK
      ?auto_751630 - BLOCK
      ?auto_751631 - BLOCK
      ?auto_751632 - BLOCK
      ?auto_751633 - BLOCK
      ?auto_751634 - BLOCK
      ?auto_751635 - BLOCK
      ?auto_751636 - BLOCK
    )
    :vars
    (
      ?auto_751637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751636 ?auto_751637 ) ( ON-TABLE ?auto_751624 ) ( ON ?auto_751625 ?auto_751624 ) ( ON ?auto_751626 ?auto_751625 ) ( ON ?auto_751627 ?auto_751626 ) ( ON ?auto_751628 ?auto_751627 ) ( not ( = ?auto_751624 ?auto_751625 ) ) ( not ( = ?auto_751624 ?auto_751626 ) ) ( not ( = ?auto_751624 ?auto_751627 ) ) ( not ( = ?auto_751624 ?auto_751628 ) ) ( not ( = ?auto_751624 ?auto_751629 ) ) ( not ( = ?auto_751624 ?auto_751630 ) ) ( not ( = ?auto_751624 ?auto_751631 ) ) ( not ( = ?auto_751624 ?auto_751632 ) ) ( not ( = ?auto_751624 ?auto_751633 ) ) ( not ( = ?auto_751624 ?auto_751634 ) ) ( not ( = ?auto_751624 ?auto_751635 ) ) ( not ( = ?auto_751624 ?auto_751636 ) ) ( not ( = ?auto_751624 ?auto_751637 ) ) ( not ( = ?auto_751625 ?auto_751626 ) ) ( not ( = ?auto_751625 ?auto_751627 ) ) ( not ( = ?auto_751625 ?auto_751628 ) ) ( not ( = ?auto_751625 ?auto_751629 ) ) ( not ( = ?auto_751625 ?auto_751630 ) ) ( not ( = ?auto_751625 ?auto_751631 ) ) ( not ( = ?auto_751625 ?auto_751632 ) ) ( not ( = ?auto_751625 ?auto_751633 ) ) ( not ( = ?auto_751625 ?auto_751634 ) ) ( not ( = ?auto_751625 ?auto_751635 ) ) ( not ( = ?auto_751625 ?auto_751636 ) ) ( not ( = ?auto_751625 ?auto_751637 ) ) ( not ( = ?auto_751626 ?auto_751627 ) ) ( not ( = ?auto_751626 ?auto_751628 ) ) ( not ( = ?auto_751626 ?auto_751629 ) ) ( not ( = ?auto_751626 ?auto_751630 ) ) ( not ( = ?auto_751626 ?auto_751631 ) ) ( not ( = ?auto_751626 ?auto_751632 ) ) ( not ( = ?auto_751626 ?auto_751633 ) ) ( not ( = ?auto_751626 ?auto_751634 ) ) ( not ( = ?auto_751626 ?auto_751635 ) ) ( not ( = ?auto_751626 ?auto_751636 ) ) ( not ( = ?auto_751626 ?auto_751637 ) ) ( not ( = ?auto_751627 ?auto_751628 ) ) ( not ( = ?auto_751627 ?auto_751629 ) ) ( not ( = ?auto_751627 ?auto_751630 ) ) ( not ( = ?auto_751627 ?auto_751631 ) ) ( not ( = ?auto_751627 ?auto_751632 ) ) ( not ( = ?auto_751627 ?auto_751633 ) ) ( not ( = ?auto_751627 ?auto_751634 ) ) ( not ( = ?auto_751627 ?auto_751635 ) ) ( not ( = ?auto_751627 ?auto_751636 ) ) ( not ( = ?auto_751627 ?auto_751637 ) ) ( not ( = ?auto_751628 ?auto_751629 ) ) ( not ( = ?auto_751628 ?auto_751630 ) ) ( not ( = ?auto_751628 ?auto_751631 ) ) ( not ( = ?auto_751628 ?auto_751632 ) ) ( not ( = ?auto_751628 ?auto_751633 ) ) ( not ( = ?auto_751628 ?auto_751634 ) ) ( not ( = ?auto_751628 ?auto_751635 ) ) ( not ( = ?auto_751628 ?auto_751636 ) ) ( not ( = ?auto_751628 ?auto_751637 ) ) ( not ( = ?auto_751629 ?auto_751630 ) ) ( not ( = ?auto_751629 ?auto_751631 ) ) ( not ( = ?auto_751629 ?auto_751632 ) ) ( not ( = ?auto_751629 ?auto_751633 ) ) ( not ( = ?auto_751629 ?auto_751634 ) ) ( not ( = ?auto_751629 ?auto_751635 ) ) ( not ( = ?auto_751629 ?auto_751636 ) ) ( not ( = ?auto_751629 ?auto_751637 ) ) ( not ( = ?auto_751630 ?auto_751631 ) ) ( not ( = ?auto_751630 ?auto_751632 ) ) ( not ( = ?auto_751630 ?auto_751633 ) ) ( not ( = ?auto_751630 ?auto_751634 ) ) ( not ( = ?auto_751630 ?auto_751635 ) ) ( not ( = ?auto_751630 ?auto_751636 ) ) ( not ( = ?auto_751630 ?auto_751637 ) ) ( not ( = ?auto_751631 ?auto_751632 ) ) ( not ( = ?auto_751631 ?auto_751633 ) ) ( not ( = ?auto_751631 ?auto_751634 ) ) ( not ( = ?auto_751631 ?auto_751635 ) ) ( not ( = ?auto_751631 ?auto_751636 ) ) ( not ( = ?auto_751631 ?auto_751637 ) ) ( not ( = ?auto_751632 ?auto_751633 ) ) ( not ( = ?auto_751632 ?auto_751634 ) ) ( not ( = ?auto_751632 ?auto_751635 ) ) ( not ( = ?auto_751632 ?auto_751636 ) ) ( not ( = ?auto_751632 ?auto_751637 ) ) ( not ( = ?auto_751633 ?auto_751634 ) ) ( not ( = ?auto_751633 ?auto_751635 ) ) ( not ( = ?auto_751633 ?auto_751636 ) ) ( not ( = ?auto_751633 ?auto_751637 ) ) ( not ( = ?auto_751634 ?auto_751635 ) ) ( not ( = ?auto_751634 ?auto_751636 ) ) ( not ( = ?auto_751634 ?auto_751637 ) ) ( not ( = ?auto_751635 ?auto_751636 ) ) ( not ( = ?auto_751635 ?auto_751637 ) ) ( not ( = ?auto_751636 ?auto_751637 ) ) ( ON ?auto_751635 ?auto_751636 ) ( ON ?auto_751634 ?auto_751635 ) ( ON ?auto_751633 ?auto_751634 ) ( ON ?auto_751632 ?auto_751633 ) ( ON ?auto_751631 ?auto_751632 ) ( ON ?auto_751630 ?auto_751631 ) ( CLEAR ?auto_751628 ) ( ON ?auto_751629 ?auto_751630 ) ( CLEAR ?auto_751629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_751624 ?auto_751625 ?auto_751626 ?auto_751627 ?auto_751628 ?auto_751629 )
      ( MAKE-13PILE ?auto_751624 ?auto_751625 ?auto_751626 ?auto_751627 ?auto_751628 ?auto_751629 ?auto_751630 ?auto_751631 ?auto_751632 ?auto_751633 ?auto_751634 ?auto_751635 ?auto_751636 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751678 - BLOCK
      ?auto_751679 - BLOCK
      ?auto_751680 - BLOCK
      ?auto_751681 - BLOCK
      ?auto_751682 - BLOCK
      ?auto_751683 - BLOCK
      ?auto_751684 - BLOCK
      ?auto_751685 - BLOCK
      ?auto_751686 - BLOCK
      ?auto_751687 - BLOCK
      ?auto_751688 - BLOCK
      ?auto_751689 - BLOCK
      ?auto_751690 - BLOCK
    )
    :vars
    (
      ?auto_751691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751690 ?auto_751691 ) ( ON-TABLE ?auto_751678 ) ( ON ?auto_751679 ?auto_751678 ) ( ON ?auto_751680 ?auto_751679 ) ( ON ?auto_751681 ?auto_751680 ) ( not ( = ?auto_751678 ?auto_751679 ) ) ( not ( = ?auto_751678 ?auto_751680 ) ) ( not ( = ?auto_751678 ?auto_751681 ) ) ( not ( = ?auto_751678 ?auto_751682 ) ) ( not ( = ?auto_751678 ?auto_751683 ) ) ( not ( = ?auto_751678 ?auto_751684 ) ) ( not ( = ?auto_751678 ?auto_751685 ) ) ( not ( = ?auto_751678 ?auto_751686 ) ) ( not ( = ?auto_751678 ?auto_751687 ) ) ( not ( = ?auto_751678 ?auto_751688 ) ) ( not ( = ?auto_751678 ?auto_751689 ) ) ( not ( = ?auto_751678 ?auto_751690 ) ) ( not ( = ?auto_751678 ?auto_751691 ) ) ( not ( = ?auto_751679 ?auto_751680 ) ) ( not ( = ?auto_751679 ?auto_751681 ) ) ( not ( = ?auto_751679 ?auto_751682 ) ) ( not ( = ?auto_751679 ?auto_751683 ) ) ( not ( = ?auto_751679 ?auto_751684 ) ) ( not ( = ?auto_751679 ?auto_751685 ) ) ( not ( = ?auto_751679 ?auto_751686 ) ) ( not ( = ?auto_751679 ?auto_751687 ) ) ( not ( = ?auto_751679 ?auto_751688 ) ) ( not ( = ?auto_751679 ?auto_751689 ) ) ( not ( = ?auto_751679 ?auto_751690 ) ) ( not ( = ?auto_751679 ?auto_751691 ) ) ( not ( = ?auto_751680 ?auto_751681 ) ) ( not ( = ?auto_751680 ?auto_751682 ) ) ( not ( = ?auto_751680 ?auto_751683 ) ) ( not ( = ?auto_751680 ?auto_751684 ) ) ( not ( = ?auto_751680 ?auto_751685 ) ) ( not ( = ?auto_751680 ?auto_751686 ) ) ( not ( = ?auto_751680 ?auto_751687 ) ) ( not ( = ?auto_751680 ?auto_751688 ) ) ( not ( = ?auto_751680 ?auto_751689 ) ) ( not ( = ?auto_751680 ?auto_751690 ) ) ( not ( = ?auto_751680 ?auto_751691 ) ) ( not ( = ?auto_751681 ?auto_751682 ) ) ( not ( = ?auto_751681 ?auto_751683 ) ) ( not ( = ?auto_751681 ?auto_751684 ) ) ( not ( = ?auto_751681 ?auto_751685 ) ) ( not ( = ?auto_751681 ?auto_751686 ) ) ( not ( = ?auto_751681 ?auto_751687 ) ) ( not ( = ?auto_751681 ?auto_751688 ) ) ( not ( = ?auto_751681 ?auto_751689 ) ) ( not ( = ?auto_751681 ?auto_751690 ) ) ( not ( = ?auto_751681 ?auto_751691 ) ) ( not ( = ?auto_751682 ?auto_751683 ) ) ( not ( = ?auto_751682 ?auto_751684 ) ) ( not ( = ?auto_751682 ?auto_751685 ) ) ( not ( = ?auto_751682 ?auto_751686 ) ) ( not ( = ?auto_751682 ?auto_751687 ) ) ( not ( = ?auto_751682 ?auto_751688 ) ) ( not ( = ?auto_751682 ?auto_751689 ) ) ( not ( = ?auto_751682 ?auto_751690 ) ) ( not ( = ?auto_751682 ?auto_751691 ) ) ( not ( = ?auto_751683 ?auto_751684 ) ) ( not ( = ?auto_751683 ?auto_751685 ) ) ( not ( = ?auto_751683 ?auto_751686 ) ) ( not ( = ?auto_751683 ?auto_751687 ) ) ( not ( = ?auto_751683 ?auto_751688 ) ) ( not ( = ?auto_751683 ?auto_751689 ) ) ( not ( = ?auto_751683 ?auto_751690 ) ) ( not ( = ?auto_751683 ?auto_751691 ) ) ( not ( = ?auto_751684 ?auto_751685 ) ) ( not ( = ?auto_751684 ?auto_751686 ) ) ( not ( = ?auto_751684 ?auto_751687 ) ) ( not ( = ?auto_751684 ?auto_751688 ) ) ( not ( = ?auto_751684 ?auto_751689 ) ) ( not ( = ?auto_751684 ?auto_751690 ) ) ( not ( = ?auto_751684 ?auto_751691 ) ) ( not ( = ?auto_751685 ?auto_751686 ) ) ( not ( = ?auto_751685 ?auto_751687 ) ) ( not ( = ?auto_751685 ?auto_751688 ) ) ( not ( = ?auto_751685 ?auto_751689 ) ) ( not ( = ?auto_751685 ?auto_751690 ) ) ( not ( = ?auto_751685 ?auto_751691 ) ) ( not ( = ?auto_751686 ?auto_751687 ) ) ( not ( = ?auto_751686 ?auto_751688 ) ) ( not ( = ?auto_751686 ?auto_751689 ) ) ( not ( = ?auto_751686 ?auto_751690 ) ) ( not ( = ?auto_751686 ?auto_751691 ) ) ( not ( = ?auto_751687 ?auto_751688 ) ) ( not ( = ?auto_751687 ?auto_751689 ) ) ( not ( = ?auto_751687 ?auto_751690 ) ) ( not ( = ?auto_751687 ?auto_751691 ) ) ( not ( = ?auto_751688 ?auto_751689 ) ) ( not ( = ?auto_751688 ?auto_751690 ) ) ( not ( = ?auto_751688 ?auto_751691 ) ) ( not ( = ?auto_751689 ?auto_751690 ) ) ( not ( = ?auto_751689 ?auto_751691 ) ) ( not ( = ?auto_751690 ?auto_751691 ) ) ( ON ?auto_751689 ?auto_751690 ) ( ON ?auto_751688 ?auto_751689 ) ( ON ?auto_751687 ?auto_751688 ) ( ON ?auto_751686 ?auto_751687 ) ( ON ?auto_751685 ?auto_751686 ) ( ON ?auto_751684 ?auto_751685 ) ( ON ?auto_751683 ?auto_751684 ) ( CLEAR ?auto_751681 ) ( ON ?auto_751682 ?auto_751683 ) ( CLEAR ?auto_751682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_751678 ?auto_751679 ?auto_751680 ?auto_751681 ?auto_751682 )
      ( MAKE-13PILE ?auto_751678 ?auto_751679 ?auto_751680 ?auto_751681 ?auto_751682 ?auto_751683 ?auto_751684 ?auto_751685 ?auto_751686 ?auto_751687 ?auto_751688 ?auto_751689 ?auto_751690 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751732 - BLOCK
      ?auto_751733 - BLOCK
      ?auto_751734 - BLOCK
      ?auto_751735 - BLOCK
      ?auto_751736 - BLOCK
      ?auto_751737 - BLOCK
      ?auto_751738 - BLOCK
      ?auto_751739 - BLOCK
      ?auto_751740 - BLOCK
      ?auto_751741 - BLOCK
      ?auto_751742 - BLOCK
      ?auto_751743 - BLOCK
      ?auto_751744 - BLOCK
    )
    :vars
    (
      ?auto_751745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751744 ?auto_751745 ) ( ON-TABLE ?auto_751732 ) ( ON ?auto_751733 ?auto_751732 ) ( ON ?auto_751734 ?auto_751733 ) ( not ( = ?auto_751732 ?auto_751733 ) ) ( not ( = ?auto_751732 ?auto_751734 ) ) ( not ( = ?auto_751732 ?auto_751735 ) ) ( not ( = ?auto_751732 ?auto_751736 ) ) ( not ( = ?auto_751732 ?auto_751737 ) ) ( not ( = ?auto_751732 ?auto_751738 ) ) ( not ( = ?auto_751732 ?auto_751739 ) ) ( not ( = ?auto_751732 ?auto_751740 ) ) ( not ( = ?auto_751732 ?auto_751741 ) ) ( not ( = ?auto_751732 ?auto_751742 ) ) ( not ( = ?auto_751732 ?auto_751743 ) ) ( not ( = ?auto_751732 ?auto_751744 ) ) ( not ( = ?auto_751732 ?auto_751745 ) ) ( not ( = ?auto_751733 ?auto_751734 ) ) ( not ( = ?auto_751733 ?auto_751735 ) ) ( not ( = ?auto_751733 ?auto_751736 ) ) ( not ( = ?auto_751733 ?auto_751737 ) ) ( not ( = ?auto_751733 ?auto_751738 ) ) ( not ( = ?auto_751733 ?auto_751739 ) ) ( not ( = ?auto_751733 ?auto_751740 ) ) ( not ( = ?auto_751733 ?auto_751741 ) ) ( not ( = ?auto_751733 ?auto_751742 ) ) ( not ( = ?auto_751733 ?auto_751743 ) ) ( not ( = ?auto_751733 ?auto_751744 ) ) ( not ( = ?auto_751733 ?auto_751745 ) ) ( not ( = ?auto_751734 ?auto_751735 ) ) ( not ( = ?auto_751734 ?auto_751736 ) ) ( not ( = ?auto_751734 ?auto_751737 ) ) ( not ( = ?auto_751734 ?auto_751738 ) ) ( not ( = ?auto_751734 ?auto_751739 ) ) ( not ( = ?auto_751734 ?auto_751740 ) ) ( not ( = ?auto_751734 ?auto_751741 ) ) ( not ( = ?auto_751734 ?auto_751742 ) ) ( not ( = ?auto_751734 ?auto_751743 ) ) ( not ( = ?auto_751734 ?auto_751744 ) ) ( not ( = ?auto_751734 ?auto_751745 ) ) ( not ( = ?auto_751735 ?auto_751736 ) ) ( not ( = ?auto_751735 ?auto_751737 ) ) ( not ( = ?auto_751735 ?auto_751738 ) ) ( not ( = ?auto_751735 ?auto_751739 ) ) ( not ( = ?auto_751735 ?auto_751740 ) ) ( not ( = ?auto_751735 ?auto_751741 ) ) ( not ( = ?auto_751735 ?auto_751742 ) ) ( not ( = ?auto_751735 ?auto_751743 ) ) ( not ( = ?auto_751735 ?auto_751744 ) ) ( not ( = ?auto_751735 ?auto_751745 ) ) ( not ( = ?auto_751736 ?auto_751737 ) ) ( not ( = ?auto_751736 ?auto_751738 ) ) ( not ( = ?auto_751736 ?auto_751739 ) ) ( not ( = ?auto_751736 ?auto_751740 ) ) ( not ( = ?auto_751736 ?auto_751741 ) ) ( not ( = ?auto_751736 ?auto_751742 ) ) ( not ( = ?auto_751736 ?auto_751743 ) ) ( not ( = ?auto_751736 ?auto_751744 ) ) ( not ( = ?auto_751736 ?auto_751745 ) ) ( not ( = ?auto_751737 ?auto_751738 ) ) ( not ( = ?auto_751737 ?auto_751739 ) ) ( not ( = ?auto_751737 ?auto_751740 ) ) ( not ( = ?auto_751737 ?auto_751741 ) ) ( not ( = ?auto_751737 ?auto_751742 ) ) ( not ( = ?auto_751737 ?auto_751743 ) ) ( not ( = ?auto_751737 ?auto_751744 ) ) ( not ( = ?auto_751737 ?auto_751745 ) ) ( not ( = ?auto_751738 ?auto_751739 ) ) ( not ( = ?auto_751738 ?auto_751740 ) ) ( not ( = ?auto_751738 ?auto_751741 ) ) ( not ( = ?auto_751738 ?auto_751742 ) ) ( not ( = ?auto_751738 ?auto_751743 ) ) ( not ( = ?auto_751738 ?auto_751744 ) ) ( not ( = ?auto_751738 ?auto_751745 ) ) ( not ( = ?auto_751739 ?auto_751740 ) ) ( not ( = ?auto_751739 ?auto_751741 ) ) ( not ( = ?auto_751739 ?auto_751742 ) ) ( not ( = ?auto_751739 ?auto_751743 ) ) ( not ( = ?auto_751739 ?auto_751744 ) ) ( not ( = ?auto_751739 ?auto_751745 ) ) ( not ( = ?auto_751740 ?auto_751741 ) ) ( not ( = ?auto_751740 ?auto_751742 ) ) ( not ( = ?auto_751740 ?auto_751743 ) ) ( not ( = ?auto_751740 ?auto_751744 ) ) ( not ( = ?auto_751740 ?auto_751745 ) ) ( not ( = ?auto_751741 ?auto_751742 ) ) ( not ( = ?auto_751741 ?auto_751743 ) ) ( not ( = ?auto_751741 ?auto_751744 ) ) ( not ( = ?auto_751741 ?auto_751745 ) ) ( not ( = ?auto_751742 ?auto_751743 ) ) ( not ( = ?auto_751742 ?auto_751744 ) ) ( not ( = ?auto_751742 ?auto_751745 ) ) ( not ( = ?auto_751743 ?auto_751744 ) ) ( not ( = ?auto_751743 ?auto_751745 ) ) ( not ( = ?auto_751744 ?auto_751745 ) ) ( ON ?auto_751743 ?auto_751744 ) ( ON ?auto_751742 ?auto_751743 ) ( ON ?auto_751741 ?auto_751742 ) ( ON ?auto_751740 ?auto_751741 ) ( ON ?auto_751739 ?auto_751740 ) ( ON ?auto_751738 ?auto_751739 ) ( ON ?auto_751737 ?auto_751738 ) ( ON ?auto_751736 ?auto_751737 ) ( CLEAR ?auto_751734 ) ( ON ?auto_751735 ?auto_751736 ) ( CLEAR ?auto_751735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_751732 ?auto_751733 ?auto_751734 ?auto_751735 )
      ( MAKE-13PILE ?auto_751732 ?auto_751733 ?auto_751734 ?auto_751735 ?auto_751736 ?auto_751737 ?auto_751738 ?auto_751739 ?auto_751740 ?auto_751741 ?auto_751742 ?auto_751743 ?auto_751744 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751786 - BLOCK
      ?auto_751787 - BLOCK
      ?auto_751788 - BLOCK
      ?auto_751789 - BLOCK
      ?auto_751790 - BLOCK
      ?auto_751791 - BLOCK
      ?auto_751792 - BLOCK
      ?auto_751793 - BLOCK
      ?auto_751794 - BLOCK
      ?auto_751795 - BLOCK
      ?auto_751796 - BLOCK
      ?auto_751797 - BLOCK
      ?auto_751798 - BLOCK
    )
    :vars
    (
      ?auto_751799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751798 ?auto_751799 ) ( ON-TABLE ?auto_751786 ) ( ON ?auto_751787 ?auto_751786 ) ( not ( = ?auto_751786 ?auto_751787 ) ) ( not ( = ?auto_751786 ?auto_751788 ) ) ( not ( = ?auto_751786 ?auto_751789 ) ) ( not ( = ?auto_751786 ?auto_751790 ) ) ( not ( = ?auto_751786 ?auto_751791 ) ) ( not ( = ?auto_751786 ?auto_751792 ) ) ( not ( = ?auto_751786 ?auto_751793 ) ) ( not ( = ?auto_751786 ?auto_751794 ) ) ( not ( = ?auto_751786 ?auto_751795 ) ) ( not ( = ?auto_751786 ?auto_751796 ) ) ( not ( = ?auto_751786 ?auto_751797 ) ) ( not ( = ?auto_751786 ?auto_751798 ) ) ( not ( = ?auto_751786 ?auto_751799 ) ) ( not ( = ?auto_751787 ?auto_751788 ) ) ( not ( = ?auto_751787 ?auto_751789 ) ) ( not ( = ?auto_751787 ?auto_751790 ) ) ( not ( = ?auto_751787 ?auto_751791 ) ) ( not ( = ?auto_751787 ?auto_751792 ) ) ( not ( = ?auto_751787 ?auto_751793 ) ) ( not ( = ?auto_751787 ?auto_751794 ) ) ( not ( = ?auto_751787 ?auto_751795 ) ) ( not ( = ?auto_751787 ?auto_751796 ) ) ( not ( = ?auto_751787 ?auto_751797 ) ) ( not ( = ?auto_751787 ?auto_751798 ) ) ( not ( = ?auto_751787 ?auto_751799 ) ) ( not ( = ?auto_751788 ?auto_751789 ) ) ( not ( = ?auto_751788 ?auto_751790 ) ) ( not ( = ?auto_751788 ?auto_751791 ) ) ( not ( = ?auto_751788 ?auto_751792 ) ) ( not ( = ?auto_751788 ?auto_751793 ) ) ( not ( = ?auto_751788 ?auto_751794 ) ) ( not ( = ?auto_751788 ?auto_751795 ) ) ( not ( = ?auto_751788 ?auto_751796 ) ) ( not ( = ?auto_751788 ?auto_751797 ) ) ( not ( = ?auto_751788 ?auto_751798 ) ) ( not ( = ?auto_751788 ?auto_751799 ) ) ( not ( = ?auto_751789 ?auto_751790 ) ) ( not ( = ?auto_751789 ?auto_751791 ) ) ( not ( = ?auto_751789 ?auto_751792 ) ) ( not ( = ?auto_751789 ?auto_751793 ) ) ( not ( = ?auto_751789 ?auto_751794 ) ) ( not ( = ?auto_751789 ?auto_751795 ) ) ( not ( = ?auto_751789 ?auto_751796 ) ) ( not ( = ?auto_751789 ?auto_751797 ) ) ( not ( = ?auto_751789 ?auto_751798 ) ) ( not ( = ?auto_751789 ?auto_751799 ) ) ( not ( = ?auto_751790 ?auto_751791 ) ) ( not ( = ?auto_751790 ?auto_751792 ) ) ( not ( = ?auto_751790 ?auto_751793 ) ) ( not ( = ?auto_751790 ?auto_751794 ) ) ( not ( = ?auto_751790 ?auto_751795 ) ) ( not ( = ?auto_751790 ?auto_751796 ) ) ( not ( = ?auto_751790 ?auto_751797 ) ) ( not ( = ?auto_751790 ?auto_751798 ) ) ( not ( = ?auto_751790 ?auto_751799 ) ) ( not ( = ?auto_751791 ?auto_751792 ) ) ( not ( = ?auto_751791 ?auto_751793 ) ) ( not ( = ?auto_751791 ?auto_751794 ) ) ( not ( = ?auto_751791 ?auto_751795 ) ) ( not ( = ?auto_751791 ?auto_751796 ) ) ( not ( = ?auto_751791 ?auto_751797 ) ) ( not ( = ?auto_751791 ?auto_751798 ) ) ( not ( = ?auto_751791 ?auto_751799 ) ) ( not ( = ?auto_751792 ?auto_751793 ) ) ( not ( = ?auto_751792 ?auto_751794 ) ) ( not ( = ?auto_751792 ?auto_751795 ) ) ( not ( = ?auto_751792 ?auto_751796 ) ) ( not ( = ?auto_751792 ?auto_751797 ) ) ( not ( = ?auto_751792 ?auto_751798 ) ) ( not ( = ?auto_751792 ?auto_751799 ) ) ( not ( = ?auto_751793 ?auto_751794 ) ) ( not ( = ?auto_751793 ?auto_751795 ) ) ( not ( = ?auto_751793 ?auto_751796 ) ) ( not ( = ?auto_751793 ?auto_751797 ) ) ( not ( = ?auto_751793 ?auto_751798 ) ) ( not ( = ?auto_751793 ?auto_751799 ) ) ( not ( = ?auto_751794 ?auto_751795 ) ) ( not ( = ?auto_751794 ?auto_751796 ) ) ( not ( = ?auto_751794 ?auto_751797 ) ) ( not ( = ?auto_751794 ?auto_751798 ) ) ( not ( = ?auto_751794 ?auto_751799 ) ) ( not ( = ?auto_751795 ?auto_751796 ) ) ( not ( = ?auto_751795 ?auto_751797 ) ) ( not ( = ?auto_751795 ?auto_751798 ) ) ( not ( = ?auto_751795 ?auto_751799 ) ) ( not ( = ?auto_751796 ?auto_751797 ) ) ( not ( = ?auto_751796 ?auto_751798 ) ) ( not ( = ?auto_751796 ?auto_751799 ) ) ( not ( = ?auto_751797 ?auto_751798 ) ) ( not ( = ?auto_751797 ?auto_751799 ) ) ( not ( = ?auto_751798 ?auto_751799 ) ) ( ON ?auto_751797 ?auto_751798 ) ( ON ?auto_751796 ?auto_751797 ) ( ON ?auto_751795 ?auto_751796 ) ( ON ?auto_751794 ?auto_751795 ) ( ON ?auto_751793 ?auto_751794 ) ( ON ?auto_751792 ?auto_751793 ) ( ON ?auto_751791 ?auto_751792 ) ( ON ?auto_751790 ?auto_751791 ) ( ON ?auto_751789 ?auto_751790 ) ( CLEAR ?auto_751787 ) ( ON ?auto_751788 ?auto_751789 ) ( CLEAR ?auto_751788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_751786 ?auto_751787 ?auto_751788 )
      ( MAKE-13PILE ?auto_751786 ?auto_751787 ?auto_751788 ?auto_751789 ?auto_751790 ?auto_751791 ?auto_751792 ?auto_751793 ?auto_751794 ?auto_751795 ?auto_751796 ?auto_751797 ?auto_751798 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751840 - BLOCK
      ?auto_751841 - BLOCK
      ?auto_751842 - BLOCK
      ?auto_751843 - BLOCK
      ?auto_751844 - BLOCK
      ?auto_751845 - BLOCK
      ?auto_751846 - BLOCK
      ?auto_751847 - BLOCK
      ?auto_751848 - BLOCK
      ?auto_751849 - BLOCK
      ?auto_751850 - BLOCK
      ?auto_751851 - BLOCK
      ?auto_751852 - BLOCK
    )
    :vars
    (
      ?auto_751853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751852 ?auto_751853 ) ( ON-TABLE ?auto_751840 ) ( not ( = ?auto_751840 ?auto_751841 ) ) ( not ( = ?auto_751840 ?auto_751842 ) ) ( not ( = ?auto_751840 ?auto_751843 ) ) ( not ( = ?auto_751840 ?auto_751844 ) ) ( not ( = ?auto_751840 ?auto_751845 ) ) ( not ( = ?auto_751840 ?auto_751846 ) ) ( not ( = ?auto_751840 ?auto_751847 ) ) ( not ( = ?auto_751840 ?auto_751848 ) ) ( not ( = ?auto_751840 ?auto_751849 ) ) ( not ( = ?auto_751840 ?auto_751850 ) ) ( not ( = ?auto_751840 ?auto_751851 ) ) ( not ( = ?auto_751840 ?auto_751852 ) ) ( not ( = ?auto_751840 ?auto_751853 ) ) ( not ( = ?auto_751841 ?auto_751842 ) ) ( not ( = ?auto_751841 ?auto_751843 ) ) ( not ( = ?auto_751841 ?auto_751844 ) ) ( not ( = ?auto_751841 ?auto_751845 ) ) ( not ( = ?auto_751841 ?auto_751846 ) ) ( not ( = ?auto_751841 ?auto_751847 ) ) ( not ( = ?auto_751841 ?auto_751848 ) ) ( not ( = ?auto_751841 ?auto_751849 ) ) ( not ( = ?auto_751841 ?auto_751850 ) ) ( not ( = ?auto_751841 ?auto_751851 ) ) ( not ( = ?auto_751841 ?auto_751852 ) ) ( not ( = ?auto_751841 ?auto_751853 ) ) ( not ( = ?auto_751842 ?auto_751843 ) ) ( not ( = ?auto_751842 ?auto_751844 ) ) ( not ( = ?auto_751842 ?auto_751845 ) ) ( not ( = ?auto_751842 ?auto_751846 ) ) ( not ( = ?auto_751842 ?auto_751847 ) ) ( not ( = ?auto_751842 ?auto_751848 ) ) ( not ( = ?auto_751842 ?auto_751849 ) ) ( not ( = ?auto_751842 ?auto_751850 ) ) ( not ( = ?auto_751842 ?auto_751851 ) ) ( not ( = ?auto_751842 ?auto_751852 ) ) ( not ( = ?auto_751842 ?auto_751853 ) ) ( not ( = ?auto_751843 ?auto_751844 ) ) ( not ( = ?auto_751843 ?auto_751845 ) ) ( not ( = ?auto_751843 ?auto_751846 ) ) ( not ( = ?auto_751843 ?auto_751847 ) ) ( not ( = ?auto_751843 ?auto_751848 ) ) ( not ( = ?auto_751843 ?auto_751849 ) ) ( not ( = ?auto_751843 ?auto_751850 ) ) ( not ( = ?auto_751843 ?auto_751851 ) ) ( not ( = ?auto_751843 ?auto_751852 ) ) ( not ( = ?auto_751843 ?auto_751853 ) ) ( not ( = ?auto_751844 ?auto_751845 ) ) ( not ( = ?auto_751844 ?auto_751846 ) ) ( not ( = ?auto_751844 ?auto_751847 ) ) ( not ( = ?auto_751844 ?auto_751848 ) ) ( not ( = ?auto_751844 ?auto_751849 ) ) ( not ( = ?auto_751844 ?auto_751850 ) ) ( not ( = ?auto_751844 ?auto_751851 ) ) ( not ( = ?auto_751844 ?auto_751852 ) ) ( not ( = ?auto_751844 ?auto_751853 ) ) ( not ( = ?auto_751845 ?auto_751846 ) ) ( not ( = ?auto_751845 ?auto_751847 ) ) ( not ( = ?auto_751845 ?auto_751848 ) ) ( not ( = ?auto_751845 ?auto_751849 ) ) ( not ( = ?auto_751845 ?auto_751850 ) ) ( not ( = ?auto_751845 ?auto_751851 ) ) ( not ( = ?auto_751845 ?auto_751852 ) ) ( not ( = ?auto_751845 ?auto_751853 ) ) ( not ( = ?auto_751846 ?auto_751847 ) ) ( not ( = ?auto_751846 ?auto_751848 ) ) ( not ( = ?auto_751846 ?auto_751849 ) ) ( not ( = ?auto_751846 ?auto_751850 ) ) ( not ( = ?auto_751846 ?auto_751851 ) ) ( not ( = ?auto_751846 ?auto_751852 ) ) ( not ( = ?auto_751846 ?auto_751853 ) ) ( not ( = ?auto_751847 ?auto_751848 ) ) ( not ( = ?auto_751847 ?auto_751849 ) ) ( not ( = ?auto_751847 ?auto_751850 ) ) ( not ( = ?auto_751847 ?auto_751851 ) ) ( not ( = ?auto_751847 ?auto_751852 ) ) ( not ( = ?auto_751847 ?auto_751853 ) ) ( not ( = ?auto_751848 ?auto_751849 ) ) ( not ( = ?auto_751848 ?auto_751850 ) ) ( not ( = ?auto_751848 ?auto_751851 ) ) ( not ( = ?auto_751848 ?auto_751852 ) ) ( not ( = ?auto_751848 ?auto_751853 ) ) ( not ( = ?auto_751849 ?auto_751850 ) ) ( not ( = ?auto_751849 ?auto_751851 ) ) ( not ( = ?auto_751849 ?auto_751852 ) ) ( not ( = ?auto_751849 ?auto_751853 ) ) ( not ( = ?auto_751850 ?auto_751851 ) ) ( not ( = ?auto_751850 ?auto_751852 ) ) ( not ( = ?auto_751850 ?auto_751853 ) ) ( not ( = ?auto_751851 ?auto_751852 ) ) ( not ( = ?auto_751851 ?auto_751853 ) ) ( not ( = ?auto_751852 ?auto_751853 ) ) ( ON ?auto_751851 ?auto_751852 ) ( ON ?auto_751850 ?auto_751851 ) ( ON ?auto_751849 ?auto_751850 ) ( ON ?auto_751848 ?auto_751849 ) ( ON ?auto_751847 ?auto_751848 ) ( ON ?auto_751846 ?auto_751847 ) ( ON ?auto_751845 ?auto_751846 ) ( ON ?auto_751844 ?auto_751845 ) ( ON ?auto_751843 ?auto_751844 ) ( ON ?auto_751842 ?auto_751843 ) ( CLEAR ?auto_751840 ) ( ON ?auto_751841 ?auto_751842 ) ( CLEAR ?auto_751841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_751840 ?auto_751841 )
      ( MAKE-13PILE ?auto_751840 ?auto_751841 ?auto_751842 ?auto_751843 ?auto_751844 ?auto_751845 ?auto_751846 ?auto_751847 ?auto_751848 ?auto_751849 ?auto_751850 ?auto_751851 ?auto_751852 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_751894 - BLOCK
      ?auto_751895 - BLOCK
      ?auto_751896 - BLOCK
      ?auto_751897 - BLOCK
      ?auto_751898 - BLOCK
      ?auto_751899 - BLOCK
      ?auto_751900 - BLOCK
      ?auto_751901 - BLOCK
      ?auto_751902 - BLOCK
      ?auto_751903 - BLOCK
      ?auto_751904 - BLOCK
      ?auto_751905 - BLOCK
      ?auto_751906 - BLOCK
    )
    :vars
    (
      ?auto_751907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751906 ?auto_751907 ) ( not ( = ?auto_751894 ?auto_751895 ) ) ( not ( = ?auto_751894 ?auto_751896 ) ) ( not ( = ?auto_751894 ?auto_751897 ) ) ( not ( = ?auto_751894 ?auto_751898 ) ) ( not ( = ?auto_751894 ?auto_751899 ) ) ( not ( = ?auto_751894 ?auto_751900 ) ) ( not ( = ?auto_751894 ?auto_751901 ) ) ( not ( = ?auto_751894 ?auto_751902 ) ) ( not ( = ?auto_751894 ?auto_751903 ) ) ( not ( = ?auto_751894 ?auto_751904 ) ) ( not ( = ?auto_751894 ?auto_751905 ) ) ( not ( = ?auto_751894 ?auto_751906 ) ) ( not ( = ?auto_751894 ?auto_751907 ) ) ( not ( = ?auto_751895 ?auto_751896 ) ) ( not ( = ?auto_751895 ?auto_751897 ) ) ( not ( = ?auto_751895 ?auto_751898 ) ) ( not ( = ?auto_751895 ?auto_751899 ) ) ( not ( = ?auto_751895 ?auto_751900 ) ) ( not ( = ?auto_751895 ?auto_751901 ) ) ( not ( = ?auto_751895 ?auto_751902 ) ) ( not ( = ?auto_751895 ?auto_751903 ) ) ( not ( = ?auto_751895 ?auto_751904 ) ) ( not ( = ?auto_751895 ?auto_751905 ) ) ( not ( = ?auto_751895 ?auto_751906 ) ) ( not ( = ?auto_751895 ?auto_751907 ) ) ( not ( = ?auto_751896 ?auto_751897 ) ) ( not ( = ?auto_751896 ?auto_751898 ) ) ( not ( = ?auto_751896 ?auto_751899 ) ) ( not ( = ?auto_751896 ?auto_751900 ) ) ( not ( = ?auto_751896 ?auto_751901 ) ) ( not ( = ?auto_751896 ?auto_751902 ) ) ( not ( = ?auto_751896 ?auto_751903 ) ) ( not ( = ?auto_751896 ?auto_751904 ) ) ( not ( = ?auto_751896 ?auto_751905 ) ) ( not ( = ?auto_751896 ?auto_751906 ) ) ( not ( = ?auto_751896 ?auto_751907 ) ) ( not ( = ?auto_751897 ?auto_751898 ) ) ( not ( = ?auto_751897 ?auto_751899 ) ) ( not ( = ?auto_751897 ?auto_751900 ) ) ( not ( = ?auto_751897 ?auto_751901 ) ) ( not ( = ?auto_751897 ?auto_751902 ) ) ( not ( = ?auto_751897 ?auto_751903 ) ) ( not ( = ?auto_751897 ?auto_751904 ) ) ( not ( = ?auto_751897 ?auto_751905 ) ) ( not ( = ?auto_751897 ?auto_751906 ) ) ( not ( = ?auto_751897 ?auto_751907 ) ) ( not ( = ?auto_751898 ?auto_751899 ) ) ( not ( = ?auto_751898 ?auto_751900 ) ) ( not ( = ?auto_751898 ?auto_751901 ) ) ( not ( = ?auto_751898 ?auto_751902 ) ) ( not ( = ?auto_751898 ?auto_751903 ) ) ( not ( = ?auto_751898 ?auto_751904 ) ) ( not ( = ?auto_751898 ?auto_751905 ) ) ( not ( = ?auto_751898 ?auto_751906 ) ) ( not ( = ?auto_751898 ?auto_751907 ) ) ( not ( = ?auto_751899 ?auto_751900 ) ) ( not ( = ?auto_751899 ?auto_751901 ) ) ( not ( = ?auto_751899 ?auto_751902 ) ) ( not ( = ?auto_751899 ?auto_751903 ) ) ( not ( = ?auto_751899 ?auto_751904 ) ) ( not ( = ?auto_751899 ?auto_751905 ) ) ( not ( = ?auto_751899 ?auto_751906 ) ) ( not ( = ?auto_751899 ?auto_751907 ) ) ( not ( = ?auto_751900 ?auto_751901 ) ) ( not ( = ?auto_751900 ?auto_751902 ) ) ( not ( = ?auto_751900 ?auto_751903 ) ) ( not ( = ?auto_751900 ?auto_751904 ) ) ( not ( = ?auto_751900 ?auto_751905 ) ) ( not ( = ?auto_751900 ?auto_751906 ) ) ( not ( = ?auto_751900 ?auto_751907 ) ) ( not ( = ?auto_751901 ?auto_751902 ) ) ( not ( = ?auto_751901 ?auto_751903 ) ) ( not ( = ?auto_751901 ?auto_751904 ) ) ( not ( = ?auto_751901 ?auto_751905 ) ) ( not ( = ?auto_751901 ?auto_751906 ) ) ( not ( = ?auto_751901 ?auto_751907 ) ) ( not ( = ?auto_751902 ?auto_751903 ) ) ( not ( = ?auto_751902 ?auto_751904 ) ) ( not ( = ?auto_751902 ?auto_751905 ) ) ( not ( = ?auto_751902 ?auto_751906 ) ) ( not ( = ?auto_751902 ?auto_751907 ) ) ( not ( = ?auto_751903 ?auto_751904 ) ) ( not ( = ?auto_751903 ?auto_751905 ) ) ( not ( = ?auto_751903 ?auto_751906 ) ) ( not ( = ?auto_751903 ?auto_751907 ) ) ( not ( = ?auto_751904 ?auto_751905 ) ) ( not ( = ?auto_751904 ?auto_751906 ) ) ( not ( = ?auto_751904 ?auto_751907 ) ) ( not ( = ?auto_751905 ?auto_751906 ) ) ( not ( = ?auto_751905 ?auto_751907 ) ) ( not ( = ?auto_751906 ?auto_751907 ) ) ( ON ?auto_751905 ?auto_751906 ) ( ON ?auto_751904 ?auto_751905 ) ( ON ?auto_751903 ?auto_751904 ) ( ON ?auto_751902 ?auto_751903 ) ( ON ?auto_751901 ?auto_751902 ) ( ON ?auto_751900 ?auto_751901 ) ( ON ?auto_751899 ?auto_751900 ) ( ON ?auto_751898 ?auto_751899 ) ( ON ?auto_751897 ?auto_751898 ) ( ON ?auto_751896 ?auto_751897 ) ( ON ?auto_751895 ?auto_751896 ) ( ON ?auto_751894 ?auto_751895 ) ( CLEAR ?auto_751894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_751894 )
      ( MAKE-13PILE ?auto_751894 ?auto_751895 ?auto_751896 ?auto_751897 ?auto_751898 ?auto_751899 ?auto_751900 ?auto_751901 ?auto_751902 ?auto_751903 ?auto_751904 ?auto_751905 ?auto_751906 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_751949 - BLOCK
      ?auto_751950 - BLOCK
      ?auto_751951 - BLOCK
      ?auto_751952 - BLOCK
      ?auto_751953 - BLOCK
      ?auto_751954 - BLOCK
      ?auto_751955 - BLOCK
      ?auto_751956 - BLOCK
      ?auto_751957 - BLOCK
      ?auto_751958 - BLOCK
      ?auto_751959 - BLOCK
      ?auto_751960 - BLOCK
      ?auto_751961 - BLOCK
      ?auto_751962 - BLOCK
    )
    :vars
    (
      ?auto_751963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_751961 ) ( ON ?auto_751962 ?auto_751963 ) ( CLEAR ?auto_751962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_751949 ) ( ON ?auto_751950 ?auto_751949 ) ( ON ?auto_751951 ?auto_751950 ) ( ON ?auto_751952 ?auto_751951 ) ( ON ?auto_751953 ?auto_751952 ) ( ON ?auto_751954 ?auto_751953 ) ( ON ?auto_751955 ?auto_751954 ) ( ON ?auto_751956 ?auto_751955 ) ( ON ?auto_751957 ?auto_751956 ) ( ON ?auto_751958 ?auto_751957 ) ( ON ?auto_751959 ?auto_751958 ) ( ON ?auto_751960 ?auto_751959 ) ( ON ?auto_751961 ?auto_751960 ) ( not ( = ?auto_751949 ?auto_751950 ) ) ( not ( = ?auto_751949 ?auto_751951 ) ) ( not ( = ?auto_751949 ?auto_751952 ) ) ( not ( = ?auto_751949 ?auto_751953 ) ) ( not ( = ?auto_751949 ?auto_751954 ) ) ( not ( = ?auto_751949 ?auto_751955 ) ) ( not ( = ?auto_751949 ?auto_751956 ) ) ( not ( = ?auto_751949 ?auto_751957 ) ) ( not ( = ?auto_751949 ?auto_751958 ) ) ( not ( = ?auto_751949 ?auto_751959 ) ) ( not ( = ?auto_751949 ?auto_751960 ) ) ( not ( = ?auto_751949 ?auto_751961 ) ) ( not ( = ?auto_751949 ?auto_751962 ) ) ( not ( = ?auto_751949 ?auto_751963 ) ) ( not ( = ?auto_751950 ?auto_751951 ) ) ( not ( = ?auto_751950 ?auto_751952 ) ) ( not ( = ?auto_751950 ?auto_751953 ) ) ( not ( = ?auto_751950 ?auto_751954 ) ) ( not ( = ?auto_751950 ?auto_751955 ) ) ( not ( = ?auto_751950 ?auto_751956 ) ) ( not ( = ?auto_751950 ?auto_751957 ) ) ( not ( = ?auto_751950 ?auto_751958 ) ) ( not ( = ?auto_751950 ?auto_751959 ) ) ( not ( = ?auto_751950 ?auto_751960 ) ) ( not ( = ?auto_751950 ?auto_751961 ) ) ( not ( = ?auto_751950 ?auto_751962 ) ) ( not ( = ?auto_751950 ?auto_751963 ) ) ( not ( = ?auto_751951 ?auto_751952 ) ) ( not ( = ?auto_751951 ?auto_751953 ) ) ( not ( = ?auto_751951 ?auto_751954 ) ) ( not ( = ?auto_751951 ?auto_751955 ) ) ( not ( = ?auto_751951 ?auto_751956 ) ) ( not ( = ?auto_751951 ?auto_751957 ) ) ( not ( = ?auto_751951 ?auto_751958 ) ) ( not ( = ?auto_751951 ?auto_751959 ) ) ( not ( = ?auto_751951 ?auto_751960 ) ) ( not ( = ?auto_751951 ?auto_751961 ) ) ( not ( = ?auto_751951 ?auto_751962 ) ) ( not ( = ?auto_751951 ?auto_751963 ) ) ( not ( = ?auto_751952 ?auto_751953 ) ) ( not ( = ?auto_751952 ?auto_751954 ) ) ( not ( = ?auto_751952 ?auto_751955 ) ) ( not ( = ?auto_751952 ?auto_751956 ) ) ( not ( = ?auto_751952 ?auto_751957 ) ) ( not ( = ?auto_751952 ?auto_751958 ) ) ( not ( = ?auto_751952 ?auto_751959 ) ) ( not ( = ?auto_751952 ?auto_751960 ) ) ( not ( = ?auto_751952 ?auto_751961 ) ) ( not ( = ?auto_751952 ?auto_751962 ) ) ( not ( = ?auto_751952 ?auto_751963 ) ) ( not ( = ?auto_751953 ?auto_751954 ) ) ( not ( = ?auto_751953 ?auto_751955 ) ) ( not ( = ?auto_751953 ?auto_751956 ) ) ( not ( = ?auto_751953 ?auto_751957 ) ) ( not ( = ?auto_751953 ?auto_751958 ) ) ( not ( = ?auto_751953 ?auto_751959 ) ) ( not ( = ?auto_751953 ?auto_751960 ) ) ( not ( = ?auto_751953 ?auto_751961 ) ) ( not ( = ?auto_751953 ?auto_751962 ) ) ( not ( = ?auto_751953 ?auto_751963 ) ) ( not ( = ?auto_751954 ?auto_751955 ) ) ( not ( = ?auto_751954 ?auto_751956 ) ) ( not ( = ?auto_751954 ?auto_751957 ) ) ( not ( = ?auto_751954 ?auto_751958 ) ) ( not ( = ?auto_751954 ?auto_751959 ) ) ( not ( = ?auto_751954 ?auto_751960 ) ) ( not ( = ?auto_751954 ?auto_751961 ) ) ( not ( = ?auto_751954 ?auto_751962 ) ) ( not ( = ?auto_751954 ?auto_751963 ) ) ( not ( = ?auto_751955 ?auto_751956 ) ) ( not ( = ?auto_751955 ?auto_751957 ) ) ( not ( = ?auto_751955 ?auto_751958 ) ) ( not ( = ?auto_751955 ?auto_751959 ) ) ( not ( = ?auto_751955 ?auto_751960 ) ) ( not ( = ?auto_751955 ?auto_751961 ) ) ( not ( = ?auto_751955 ?auto_751962 ) ) ( not ( = ?auto_751955 ?auto_751963 ) ) ( not ( = ?auto_751956 ?auto_751957 ) ) ( not ( = ?auto_751956 ?auto_751958 ) ) ( not ( = ?auto_751956 ?auto_751959 ) ) ( not ( = ?auto_751956 ?auto_751960 ) ) ( not ( = ?auto_751956 ?auto_751961 ) ) ( not ( = ?auto_751956 ?auto_751962 ) ) ( not ( = ?auto_751956 ?auto_751963 ) ) ( not ( = ?auto_751957 ?auto_751958 ) ) ( not ( = ?auto_751957 ?auto_751959 ) ) ( not ( = ?auto_751957 ?auto_751960 ) ) ( not ( = ?auto_751957 ?auto_751961 ) ) ( not ( = ?auto_751957 ?auto_751962 ) ) ( not ( = ?auto_751957 ?auto_751963 ) ) ( not ( = ?auto_751958 ?auto_751959 ) ) ( not ( = ?auto_751958 ?auto_751960 ) ) ( not ( = ?auto_751958 ?auto_751961 ) ) ( not ( = ?auto_751958 ?auto_751962 ) ) ( not ( = ?auto_751958 ?auto_751963 ) ) ( not ( = ?auto_751959 ?auto_751960 ) ) ( not ( = ?auto_751959 ?auto_751961 ) ) ( not ( = ?auto_751959 ?auto_751962 ) ) ( not ( = ?auto_751959 ?auto_751963 ) ) ( not ( = ?auto_751960 ?auto_751961 ) ) ( not ( = ?auto_751960 ?auto_751962 ) ) ( not ( = ?auto_751960 ?auto_751963 ) ) ( not ( = ?auto_751961 ?auto_751962 ) ) ( not ( = ?auto_751961 ?auto_751963 ) ) ( not ( = ?auto_751962 ?auto_751963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_751962 ?auto_751963 )
      ( !STACK ?auto_751962 ?auto_751961 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752007 - BLOCK
      ?auto_752008 - BLOCK
      ?auto_752009 - BLOCK
      ?auto_752010 - BLOCK
      ?auto_752011 - BLOCK
      ?auto_752012 - BLOCK
      ?auto_752013 - BLOCK
      ?auto_752014 - BLOCK
      ?auto_752015 - BLOCK
      ?auto_752016 - BLOCK
      ?auto_752017 - BLOCK
      ?auto_752018 - BLOCK
      ?auto_752019 - BLOCK
      ?auto_752020 - BLOCK
    )
    :vars
    (
      ?auto_752021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752020 ?auto_752021 ) ( ON-TABLE ?auto_752007 ) ( ON ?auto_752008 ?auto_752007 ) ( ON ?auto_752009 ?auto_752008 ) ( ON ?auto_752010 ?auto_752009 ) ( ON ?auto_752011 ?auto_752010 ) ( ON ?auto_752012 ?auto_752011 ) ( ON ?auto_752013 ?auto_752012 ) ( ON ?auto_752014 ?auto_752013 ) ( ON ?auto_752015 ?auto_752014 ) ( ON ?auto_752016 ?auto_752015 ) ( ON ?auto_752017 ?auto_752016 ) ( ON ?auto_752018 ?auto_752017 ) ( not ( = ?auto_752007 ?auto_752008 ) ) ( not ( = ?auto_752007 ?auto_752009 ) ) ( not ( = ?auto_752007 ?auto_752010 ) ) ( not ( = ?auto_752007 ?auto_752011 ) ) ( not ( = ?auto_752007 ?auto_752012 ) ) ( not ( = ?auto_752007 ?auto_752013 ) ) ( not ( = ?auto_752007 ?auto_752014 ) ) ( not ( = ?auto_752007 ?auto_752015 ) ) ( not ( = ?auto_752007 ?auto_752016 ) ) ( not ( = ?auto_752007 ?auto_752017 ) ) ( not ( = ?auto_752007 ?auto_752018 ) ) ( not ( = ?auto_752007 ?auto_752019 ) ) ( not ( = ?auto_752007 ?auto_752020 ) ) ( not ( = ?auto_752007 ?auto_752021 ) ) ( not ( = ?auto_752008 ?auto_752009 ) ) ( not ( = ?auto_752008 ?auto_752010 ) ) ( not ( = ?auto_752008 ?auto_752011 ) ) ( not ( = ?auto_752008 ?auto_752012 ) ) ( not ( = ?auto_752008 ?auto_752013 ) ) ( not ( = ?auto_752008 ?auto_752014 ) ) ( not ( = ?auto_752008 ?auto_752015 ) ) ( not ( = ?auto_752008 ?auto_752016 ) ) ( not ( = ?auto_752008 ?auto_752017 ) ) ( not ( = ?auto_752008 ?auto_752018 ) ) ( not ( = ?auto_752008 ?auto_752019 ) ) ( not ( = ?auto_752008 ?auto_752020 ) ) ( not ( = ?auto_752008 ?auto_752021 ) ) ( not ( = ?auto_752009 ?auto_752010 ) ) ( not ( = ?auto_752009 ?auto_752011 ) ) ( not ( = ?auto_752009 ?auto_752012 ) ) ( not ( = ?auto_752009 ?auto_752013 ) ) ( not ( = ?auto_752009 ?auto_752014 ) ) ( not ( = ?auto_752009 ?auto_752015 ) ) ( not ( = ?auto_752009 ?auto_752016 ) ) ( not ( = ?auto_752009 ?auto_752017 ) ) ( not ( = ?auto_752009 ?auto_752018 ) ) ( not ( = ?auto_752009 ?auto_752019 ) ) ( not ( = ?auto_752009 ?auto_752020 ) ) ( not ( = ?auto_752009 ?auto_752021 ) ) ( not ( = ?auto_752010 ?auto_752011 ) ) ( not ( = ?auto_752010 ?auto_752012 ) ) ( not ( = ?auto_752010 ?auto_752013 ) ) ( not ( = ?auto_752010 ?auto_752014 ) ) ( not ( = ?auto_752010 ?auto_752015 ) ) ( not ( = ?auto_752010 ?auto_752016 ) ) ( not ( = ?auto_752010 ?auto_752017 ) ) ( not ( = ?auto_752010 ?auto_752018 ) ) ( not ( = ?auto_752010 ?auto_752019 ) ) ( not ( = ?auto_752010 ?auto_752020 ) ) ( not ( = ?auto_752010 ?auto_752021 ) ) ( not ( = ?auto_752011 ?auto_752012 ) ) ( not ( = ?auto_752011 ?auto_752013 ) ) ( not ( = ?auto_752011 ?auto_752014 ) ) ( not ( = ?auto_752011 ?auto_752015 ) ) ( not ( = ?auto_752011 ?auto_752016 ) ) ( not ( = ?auto_752011 ?auto_752017 ) ) ( not ( = ?auto_752011 ?auto_752018 ) ) ( not ( = ?auto_752011 ?auto_752019 ) ) ( not ( = ?auto_752011 ?auto_752020 ) ) ( not ( = ?auto_752011 ?auto_752021 ) ) ( not ( = ?auto_752012 ?auto_752013 ) ) ( not ( = ?auto_752012 ?auto_752014 ) ) ( not ( = ?auto_752012 ?auto_752015 ) ) ( not ( = ?auto_752012 ?auto_752016 ) ) ( not ( = ?auto_752012 ?auto_752017 ) ) ( not ( = ?auto_752012 ?auto_752018 ) ) ( not ( = ?auto_752012 ?auto_752019 ) ) ( not ( = ?auto_752012 ?auto_752020 ) ) ( not ( = ?auto_752012 ?auto_752021 ) ) ( not ( = ?auto_752013 ?auto_752014 ) ) ( not ( = ?auto_752013 ?auto_752015 ) ) ( not ( = ?auto_752013 ?auto_752016 ) ) ( not ( = ?auto_752013 ?auto_752017 ) ) ( not ( = ?auto_752013 ?auto_752018 ) ) ( not ( = ?auto_752013 ?auto_752019 ) ) ( not ( = ?auto_752013 ?auto_752020 ) ) ( not ( = ?auto_752013 ?auto_752021 ) ) ( not ( = ?auto_752014 ?auto_752015 ) ) ( not ( = ?auto_752014 ?auto_752016 ) ) ( not ( = ?auto_752014 ?auto_752017 ) ) ( not ( = ?auto_752014 ?auto_752018 ) ) ( not ( = ?auto_752014 ?auto_752019 ) ) ( not ( = ?auto_752014 ?auto_752020 ) ) ( not ( = ?auto_752014 ?auto_752021 ) ) ( not ( = ?auto_752015 ?auto_752016 ) ) ( not ( = ?auto_752015 ?auto_752017 ) ) ( not ( = ?auto_752015 ?auto_752018 ) ) ( not ( = ?auto_752015 ?auto_752019 ) ) ( not ( = ?auto_752015 ?auto_752020 ) ) ( not ( = ?auto_752015 ?auto_752021 ) ) ( not ( = ?auto_752016 ?auto_752017 ) ) ( not ( = ?auto_752016 ?auto_752018 ) ) ( not ( = ?auto_752016 ?auto_752019 ) ) ( not ( = ?auto_752016 ?auto_752020 ) ) ( not ( = ?auto_752016 ?auto_752021 ) ) ( not ( = ?auto_752017 ?auto_752018 ) ) ( not ( = ?auto_752017 ?auto_752019 ) ) ( not ( = ?auto_752017 ?auto_752020 ) ) ( not ( = ?auto_752017 ?auto_752021 ) ) ( not ( = ?auto_752018 ?auto_752019 ) ) ( not ( = ?auto_752018 ?auto_752020 ) ) ( not ( = ?auto_752018 ?auto_752021 ) ) ( not ( = ?auto_752019 ?auto_752020 ) ) ( not ( = ?auto_752019 ?auto_752021 ) ) ( not ( = ?auto_752020 ?auto_752021 ) ) ( CLEAR ?auto_752018 ) ( ON ?auto_752019 ?auto_752020 ) ( CLEAR ?auto_752019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_752007 ?auto_752008 ?auto_752009 ?auto_752010 ?auto_752011 ?auto_752012 ?auto_752013 ?auto_752014 ?auto_752015 ?auto_752016 ?auto_752017 ?auto_752018 ?auto_752019 )
      ( MAKE-14PILE ?auto_752007 ?auto_752008 ?auto_752009 ?auto_752010 ?auto_752011 ?auto_752012 ?auto_752013 ?auto_752014 ?auto_752015 ?auto_752016 ?auto_752017 ?auto_752018 ?auto_752019 ?auto_752020 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752065 - BLOCK
      ?auto_752066 - BLOCK
      ?auto_752067 - BLOCK
      ?auto_752068 - BLOCK
      ?auto_752069 - BLOCK
      ?auto_752070 - BLOCK
      ?auto_752071 - BLOCK
      ?auto_752072 - BLOCK
      ?auto_752073 - BLOCK
      ?auto_752074 - BLOCK
      ?auto_752075 - BLOCK
      ?auto_752076 - BLOCK
      ?auto_752077 - BLOCK
      ?auto_752078 - BLOCK
    )
    :vars
    (
      ?auto_752079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752078 ?auto_752079 ) ( ON-TABLE ?auto_752065 ) ( ON ?auto_752066 ?auto_752065 ) ( ON ?auto_752067 ?auto_752066 ) ( ON ?auto_752068 ?auto_752067 ) ( ON ?auto_752069 ?auto_752068 ) ( ON ?auto_752070 ?auto_752069 ) ( ON ?auto_752071 ?auto_752070 ) ( ON ?auto_752072 ?auto_752071 ) ( ON ?auto_752073 ?auto_752072 ) ( ON ?auto_752074 ?auto_752073 ) ( ON ?auto_752075 ?auto_752074 ) ( not ( = ?auto_752065 ?auto_752066 ) ) ( not ( = ?auto_752065 ?auto_752067 ) ) ( not ( = ?auto_752065 ?auto_752068 ) ) ( not ( = ?auto_752065 ?auto_752069 ) ) ( not ( = ?auto_752065 ?auto_752070 ) ) ( not ( = ?auto_752065 ?auto_752071 ) ) ( not ( = ?auto_752065 ?auto_752072 ) ) ( not ( = ?auto_752065 ?auto_752073 ) ) ( not ( = ?auto_752065 ?auto_752074 ) ) ( not ( = ?auto_752065 ?auto_752075 ) ) ( not ( = ?auto_752065 ?auto_752076 ) ) ( not ( = ?auto_752065 ?auto_752077 ) ) ( not ( = ?auto_752065 ?auto_752078 ) ) ( not ( = ?auto_752065 ?auto_752079 ) ) ( not ( = ?auto_752066 ?auto_752067 ) ) ( not ( = ?auto_752066 ?auto_752068 ) ) ( not ( = ?auto_752066 ?auto_752069 ) ) ( not ( = ?auto_752066 ?auto_752070 ) ) ( not ( = ?auto_752066 ?auto_752071 ) ) ( not ( = ?auto_752066 ?auto_752072 ) ) ( not ( = ?auto_752066 ?auto_752073 ) ) ( not ( = ?auto_752066 ?auto_752074 ) ) ( not ( = ?auto_752066 ?auto_752075 ) ) ( not ( = ?auto_752066 ?auto_752076 ) ) ( not ( = ?auto_752066 ?auto_752077 ) ) ( not ( = ?auto_752066 ?auto_752078 ) ) ( not ( = ?auto_752066 ?auto_752079 ) ) ( not ( = ?auto_752067 ?auto_752068 ) ) ( not ( = ?auto_752067 ?auto_752069 ) ) ( not ( = ?auto_752067 ?auto_752070 ) ) ( not ( = ?auto_752067 ?auto_752071 ) ) ( not ( = ?auto_752067 ?auto_752072 ) ) ( not ( = ?auto_752067 ?auto_752073 ) ) ( not ( = ?auto_752067 ?auto_752074 ) ) ( not ( = ?auto_752067 ?auto_752075 ) ) ( not ( = ?auto_752067 ?auto_752076 ) ) ( not ( = ?auto_752067 ?auto_752077 ) ) ( not ( = ?auto_752067 ?auto_752078 ) ) ( not ( = ?auto_752067 ?auto_752079 ) ) ( not ( = ?auto_752068 ?auto_752069 ) ) ( not ( = ?auto_752068 ?auto_752070 ) ) ( not ( = ?auto_752068 ?auto_752071 ) ) ( not ( = ?auto_752068 ?auto_752072 ) ) ( not ( = ?auto_752068 ?auto_752073 ) ) ( not ( = ?auto_752068 ?auto_752074 ) ) ( not ( = ?auto_752068 ?auto_752075 ) ) ( not ( = ?auto_752068 ?auto_752076 ) ) ( not ( = ?auto_752068 ?auto_752077 ) ) ( not ( = ?auto_752068 ?auto_752078 ) ) ( not ( = ?auto_752068 ?auto_752079 ) ) ( not ( = ?auto_752069 ?auto_752070 ) ) ( not ( = ?auto_752069 ?auto_752071 ) ) ( not ( = ?auto_752069 ?auto_752072 ) ) ( not ( = ?auto_752069 ?auto_752073 ) ) ( not ( = ?auto_752069 ?auto_752074 ) ) ( not ( = ?auto_752069 ?auto_752075 ) ) ( not ( = ?auto_752069 ?auto_752076 ) ) ( not ( = ?auto_752069 ?auto_752077 ) ) ( not ( = ?auto_752069 ?auto_752078 ) ) ( not ( = ?auto_752069 ?auto_752079 ) ) ( not ( = ?auto_752070 ?auto_752071 ) ) ( not ( = ?auto_752070 ?auto_752072 ) ) ( not ( = ?auto_752070 ?auto_752073 ) ) ( not ( = ?auto_752070 ?auto_752074 ) ) ( not ( = ?auto_752070 ?auto_752075 ) ) ( not ( = ?auto_752070 ?auto_752076 ) ) ( not ( = ?auto_752070 ?auto_752077 ) ) ( not ( = ?auto_752070 ?auto_752078 ) ) ( not ( = ?auto_752070 ?auto_752079 ) ) ( not ( = ?auto_752071 ?auto_752072 ) ) ( not ( = ?auto_752071 ?auto_752073 ) ) ( not ( = ?auto_752071 ?auto_752074 ) ) ( not ( = ?auto_752071 ?auto_752075 ) ) ( not ( = ?auto_752071 ?auto_752076 ) ) ( not ( = ?auto_752071 ?auto_752077 ) ) ( not ( = ?auto_752071 ?auto_752078 ) ) ( not ( = ?auto_752071 ?auto_752079 ) ) ( not ( = ?auto_752072 ?auto_752073 ) ) ( not ( = ?auto_752072 ?auto_752074 ) ) ( not ( = ?auto_752072 ?auto_752075 ) ) ( not ( = ?auto_752072 ?auto_752076 ) ) ( not ( = ?auto_752072 ?auto_752077 ) ) ( not ( = ?auto_752072 ?auto_752078 ) ) ( not ( = ?auto_752072 ?auto_752079 ) ) ( not ( = ?auto_752073 ?auto_752074 ) ) ( not ( = ?auto_752073 ?auto_752075 ) ) ( not ( = ?auto_752073 ?auto_752076 ) ) ( not ( = ?auto_752073 ?auto_752077 ) ) ( not ( = ?auto_752073 ?auto_752078 ) ) ( not ( = ?auto_752073 ?auto_752079 ) ) ( not ( = ?auto_752074 ?auto_752075 ) ) ( not ( = ?auto_752074 ?auto_752076 ) ) ( not ( = ?auto_752074 ?auto_752077 ) ) ( not ( = ?auto_752074 ?auto_752078 ) ) ( not ( = ?auto_752074 ?auto_752079 ) ) ( not ( = ?auto_752075 ?auto_752076 ) ) ( not ( = ?auto_752075 ?auto_752077 ) ) ( not ( = ?auto_752075 ?auto_752078 ) ) ( not ( = ?auto_752075 ?auto_752079 ) ) ( not ( = ?auto_752076 ?auto_752077 ) ) ( not ( = ?auto_752076 ?auto_752078 ) ) ( not ( = ?auto_752076 ?auto_752079 ) ) ( not ( = ?auto_752077 ?auto_752078 ) ) ( not ( = ?auto_752077 ?auto_752079 ) ) ( not ( = ?auto_752078 ?auto_752079 ) ) ( ON ?auto_752077 ?auto_752078 ) ( CLEAR ?auto_752075 ) ( ON ?auto_752076 ?auto_752077 ) ( CLEAR ?auto_752076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_752065 ?auto_752066 ?auto_752067 ?auto_752068 ?auto_752069 ?auto_752070 ?auto_752071 ?auto_752072 ?auto_752073 ?auto_752074 ?auto_752075 ?auto_752076 )
      ( MAKE-14PILE ?auto_752065 ?auto_752066 ?auto_752067 ?auto_752068 ?auto_752069 ?auto_752070 ?auto_752071 ?auto_752072 ?auto_752073 ?auto_752074 ?auto_752075 ?auto_752076 ?auto_752077 ?auto_752078 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752123 - BLOCK
      ?auto_752124 - BLOCK
      ?auto_752125 - BLOCK
      ?auto_752126 - BLOCK
      ?auto_752127 - BLOCK
      ?auto_752128 - BLOCK
      ?auto_752129 - BLOCK
      ?auto_752130 - BLOCK
      ?auto_752131 - BLOCK
      ?auto_752132 - BLOCK
      ?auto_752133 - BLOCK
      ?auto_752134 - BLOCK
      ?auto_752135 - BLOCK
      ?auto_752136 - BLOCK
    )
    :vars
    (
      ?auto_752137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752136 ?auto_752137 ) ( ON-TABLE ?auto_752123 ) ( ON ?auto_752124 ?auto_752123 ) ( ON ?auto_752125 ?auto_752124 ) ( ON ?auto_752126 ?auto_752125 ) ( ON ?auto_752127 ?auto_752126 ) ( ON ?auto_752128 ?auto_752127 ) ( ON ?auto_752129 ?auto_752128 ) ( ON ?auto_752130 ?auto_752129 ) ( ON ?auto_752131 ?auto_752130 ) ( ON ?auto_752132 ?auto_752131 ) ( not ( = ?auto_752123 ?auto_752124 ) ) ( not ( = ?auto_752123 ?auto_752125 ) ) ( not ( = ?auto_752123 ?auto_752126 ) ) ( not ( = ?auto_752123 ?auto_752127 ) ) ( not ( = ?auto_752123 ?auto_752128 ) ) ( not ( = ?auto_752123 ?auto_752129 ) ) ( not ( = ?auto_752123 ?auto_752130 ) ) ( not ( = ?auto_752123 ?auto_752131 ) ) ( not ( = ?auto_752123 ?auto_752132 ) ) ( not ( = ?auto_752123 ?auto_752133 ) ) ( not ( = ?auto_752123 ?auto_752134 ) ) ( not ( = ?auto_752123 ?auto_752135 ) ) ( not ( = ?auto_752123 ?auto_752136 ) ) ( not ( = ?auto_752123 ?auto_752137 ) ) ( not ( = ?auto_752124 ?auto_752125 ) ) ( not ( = ?auto_752124 ?auto_752126 ) ) ( not ( = ?auto_752124 ?auto_752127 ) ) ( not ( = ?auto_752124 ?auto_752128 ) ) ( not ( = ?auto_752124 ?auto_752129 ) ) ( not ( = ?auto_752124 ?auto_752130 ) ) ( not ( = ?auto_752124 ?auto_752131 ) ) ( not ( = ?auto_752124 ?auto_752132 ) ) ( not ( = ?auto_752124 ?auto_752133 ) ) ( not ( = ?auto_752124 ?auto_752134 ) ) ( not ( = ?auto_752124 ?auto_752135 ) ) ( not ( = ?auto_752124 ?auto_752136 ) ) ( not ( = ?auto_752124 ?auto_752137 ) ) ( not ( = ?auto_752125 ?auto_752126 ) ) ( not ( = ?auto_752125 ?auto_752127 ) ) ( not ( = ?auto_752125 ?auto_752128 ) ) ( not ( = ?auto_752125 ?auto_752129 ) ) ( not ( = ?auto_752125 ?auto_752130 ) ) ( not ( = ?auto_752125 ?auto_752131 ) ) ( not ( = ?auto_752125 ?auto_752132 ) ) ( not ( = ?auto_752125 ?auto_752133 ) ) ( not ( = ?auto_752125 ?auto_752134 ) ) ( not ( = ?auto_752125 ?auto_752135 ) ) ( not ( = ?auto_752125 ?auto_752136 ) ) ( not ( = ?auto_752125 ?auto_752137 ) ) ( not ( = ?auto_752126 ?auto_752127 ) ) ( not ( = ?auto_752126 ?auto_752128 ) ) ( not ( = ?auto_752126 ?auto_752129 ) ) ( not ( = ?auto_752126 ?auto_752130 ) ) ( not ( = ?auto_752126 ?auto_752131 ) ) ( not ( = ?auto_752126 ?auto_752132 ) ) ( not ( = ?auto_752126 ?auto_752133 ) ) ( not ( = ?auto_752126 ?auto_752134 ) ) ( not ( = ?auto_752126 ?auto_752135 ) ) ( not ( = ?auto_752126 ?auto_752136 ) ) ( not ( = ?auto_752126 ?auto_752137 ) ) ( not ( = ?auto_752127 ?auto_752128 ) ) ( not ( = ?auto_752127 ?auto_752129 ) ) ( not ( = ?auto_752127 ?auto_752130 ) ) ( not ( = ?auto_752127 ?auto_752131 ) ) ( not ( = ?auto_752127 ?auto_752132 ) ) ( not ( = ?auto_752127 ?auto_752133 ) ) ( not ( = ?auto_752127 ?auto_752134 ) ) ( not ( = ?auto_752127 ?auto_752135 ) ) ( not ( = ?auto_752127 ?auto_752136 ) ) ( not ( = ?auto_752127 ?auto_752137 ) ) ( not ( = ?auto_752128 ?auto_752129 ) ) ( not ( = ?auto_752128 ?auto_752130 ) ) ( not ( = ?auto_752128 ?auto_752131 ) ) ( not ( = ?auto_752128 ?auto_752132 ) ) ( not ( = ?auto_752128 ?auto_752133 ) ) ( not ( = ?auto_752128 ?auto_752134 ) ) ( not ( = ?auto_752128 ?auto_752135 ) ) ( not ( = ?auto_752128 ?auto_752136 ) ) ( not ( = ?auto_752128 ?auto_752137 ) ) ( not ( = ?auto_752129 ?auto_752130 ) ) ( not ( = ?auto_752129 ?auto_752131 ) ) ( not ( = ?auto_752129 ?auto_752132 ) ) ( not ( = ?auto_752129 ?auto_752133 ) ) ( not ( = ?auto_752129 ?auto_752134 ) ) ( not ( = ?auto_752129 ?auto_752135 ) ) ( not ( = ?auto_752129 ?auto_752136 ) ) ( not ( = ?auto_752129 ?auto_752137 ) ) ( not ( = ?auto_752130 ?auto_752131 ) ) ( not ( = ?auto_752130 ?auto_752132 ) ) ( not ( = ?auto_752130 ?auto_752133 ) ) ( not ( = ?auto_752130 ?auto_752134 ) ) ( not ( = ?auto_752130 ?auto_752135 ) ) ( not ( = ?auto_752130 ?auto_752136 ) ) ( not ( = ?auto_752130 ?auto_752137 ) ) ( not ( = ?auto_752131 ?auto_752132 ) ) ( not ( = ?auto_752131 ?auto_752133 ) ) ( not ( = ?auto_752131 ?auto_752134 ) ) ( not ( = ?auto_752131 ?auto_752135 ) ) ( not ( = ?auto_752131 ?auto_752136 ) ) ( not ( = ?auto_752131 ?auto_752137 ) ) ( not ( = ?auto_752132 ?auto_752133 ) ) ( not ( = ?auto_752132 ?auto_752134 ) ) ( not ( = ?auto_752132 ?auto_752135 ) ) ( not ( = ?auto_752132 ?auto_752136 ) ) ( not ( = ?auto_752132 ?auto_752137 ) ) ( not ( = ?auto_752133 ?auto_752134 ) ) ( not ( = ?auto_752133 ?auto_752135 ) ) ( not ( = ?auto_752133 ?auto_752136 ) ) ( not ( = ?auto_752133 ?auto_752137 ) ) ( not ( = ?auto_752134 ?auto_752135 ) ) ( not ( = ?auto_752134 ?auto_752136 ) ) ( not ( = ?auto_752134 ?auto_752137 ) ) ( not ( = ?auto_752135 ?auto_752136 ) ) ( not ( = ?auto_752135 ?auto_752137 ) ) ( not ( = ?auto_752136 ?auto_752137 ) ) ( ON ?auto_752135 ?auto_752136 ) ( ON ?auto_752134 ?auto_752135 ) ( CLEAR ?auto_752132 ) ( ON ?auto_752133 ?auto_752134 ) ( CLEAR ?auto_752133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_752123 ?auto_752124 ?auto_752125 ?auto_752126 ?auto_752127 ?auto_752128 ?auto_752129 ?auto_752130 ?auto_752131 ?auto_752132 ?auto_752133 )
      ( MAKE-14PILE ?auto_752123 ?auto_752124 ?auto_752125 ?auto_752126 ?auto_752127 ?auto_752128 ?auto_752129 ?auto_752130 ?auto_752131 ?auto_752132 ?auto_752133 ?auto_752134 ?auto_752135 ?auto_752136 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752181 - BLOCK
      ?auto_752182 - BLOCK
      ?auto_752183 - BLOCK
      ?auto_752184 - BLOCK
      ?auto_752185 - BLOCK
      ?auto_752186 - BLOCK
      ?auto_752187 - BLOCK
      ?auto_752188 - BLOCK
      ?auto_752189 - BLOCK
      ?auto_752190 - BLOCK
      ?auto_752191 - BLOCK
      ?auto_752192 - BLOCK
      ?auto_752193 - BLOCK
      ?auto_752194 - BLOCK
    )
    :vars
    (
      ?auto_752195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752194 ?auto_752195 ) ( ON-TABLE ?auto_752181 ) ( ON ?auto_752182 ?auto_752181 ) ( ON ?auto_752183 ?auto_752182 ) ( ON ?auto_752184 ?auto_752183 ) ( ON ?auto_752185 ?auto_752184 ) ( ON ?auto_752186 ?auto_752185 ) ( ON ?auto_752187 ?auto_752186 ) ( ON ?auto_752188 ?auto_752187 ) ( ON ?auto_752189 ?auto_752188 ) ( not ( = ?auto_752181 ?auto_752182 ) ) ( not ( = ?auto_752181 ?auto_752183 ) ) ( not ( = ?auto_752181 ?auto_752184 ) ) ( not ( = ?auto_752181 ?auto_752185 ) ) ( not ( = ?auto_752181 ?auto_752186 ) ) ( not ( = ?auto_752181 ?auto_752187 ) ) ( not ( = ?auto_752181 ?auto_752188 ) ) ( not ( = ?auto_752181 ?auto_752189 ) ) ( not ( = ?auto_752181 ?auto_752190 ) ) ( not ( = ?auto_752181 ?auto_752191 ) ) ( not ( = ?auto_752181 ?auto_752192 ) ) ( not ( = ?auto_752181 ?auto_752193 ) ) ( not ( = ?auto_752181 ?auto_752194 ) ) ( not ( = ?auto_752181 ?auto_752195 ) ) ( not ( = ?auto_752182 ?auto_752183 ) ) ( not ( = ?auto_752182 ?auto_752184 ) ) ( not ( = ?auto_752182 ?auto_752185 ) ) ( not ( = ?auto_752182 ?auto_752186 ) ) ( not ( = ?auto_752182 ?auto_752187 ) ) ( not ( = ?auto_752182 ?auto_752188 ) ) ( not ( = ?auto_752182 ?auto_752189 ) ) ( not ( = ?auto_752182 ?auto_752190 ) ) ( not ( = ?auto_752182 ?auto_752191 ) ) ( not ( = ?auto_752182 ?auto_752192 ) ) ( not ( = ?auto_752182 ?auto_752193 ) ) ( not ( = ?auto_752182 ?auto_752194 ) ) ( not ( = ?auto_752182 ?auto_752195 ) ) ( not ( = ?auto_752183 ?auto_752184 ) ) ( not ( = ?auto_752183 ?auto_752185 ) ) ( not ( = ?auto_752183 ?auto_752186 ) ) ( not ( = ?auto_752183 ?auto_752187 ) ) ( not ( = ?auto_752183 ?auto_752188 ) ) ( not ( = ?auto_752183 ?auto_752189 ) ) ( not ( = ?auto_752183 ?auto_752190 ) ) ( not ( = ?auto_752183 ?auto_752191 ) ) ( not ( = ?auto_752183 ?auto_752192 ) ) ( not ( = ?auto_752183 ?auto_752193 ) ) ( not ( = ?auto_752183 ?auto_752194 ) ) ( not ( = ?auto_752183 ?auto_752195 ) ) ( not ( = ?auto_752184 ?auto_752185 ) ) ( not ( = ?auto_752184 ?auto_752186 ) ) ( not ( = ?auto_752184 ?auto_752187 ) ) ( not ( = ?auto_752184 ?auto_752188 ) ) ( not ( = ?auto_752184 ?auto_752189 ) ) ( not ( = ?auto_752184 ?auto_752190 ) ) ( not ( = ?auto_752184 ?auto_752191 ) ) ( not ( = ?auto_752184 ?auto_752192 ) ) ( not ( = ?auto_752184 ?auto_752193 ) ) ( not ( = ?auto_752184 ?auto_752194 ) ) ( not ( = ?auto_752184 ?auto_752195 ) ) ( not ( = ?auto_752185 ?auto_752186 ) ) ( not ( = ?auto_752185 ?auto_752187 ) ) ( not ( = ?auto_752185 ?auto_752188 ) ) ( not ( = ?auto_752185 ?auto_752189 ) ) ( not ( = ?auto_752185 ?auto_752190 ) ) ( not ( = ?auto_752185 ?auto_752191 ) ) ( not ( = ?auto_752185 ?auto_752192 ) ) ( not ( = ?auto_752185 ?auto_752193 ) ) ( not ( = ?auto_752185 ?auto_752194 ) ) ( not ( = ?auto_752185 ?auto_752195 ) ) ( not ( = ?auto_752186 ?auto_752187 ) ) ( not ( = ?auto_752186 ?auto_752188 ) ) ( not ( = ?auto_752186 ?auto_752189 ) ) ( not ( = ?auto_752186 ?auto_752190 ) ) ( not ( = ?auto_752186 ?auto_752191 ) ) ( not ( = ?auto_752186 ?auto_752192 ) ) ( not ( = ?auto_752186 ?auto_752193 ) ) ( not ( = ?auto_752186 ?auto_752194 ) ) ( not ( = ?auto_752186 ?auto_752195 ) ) ( not ( = ?auto_752187 ?auto_752188 ) ) ( not ( = ?auto_752187 ?auto_752189 ) ) ( not ( = ?auto_752187 ?auto_752190 ) ) ( not ( = ?auto_752187 ?auto_752191 ) ) ( not ( = ?auto_752187 ?auto_752192 ) ) ( not ( = ?auto_752187 ?auto_752193 ) ) ( not ( = ?auto_752187 ?auto_752194 ) ) ( not ( = ?auto_752187 ?auto_752195 ) ) ( not ( = ?auto_752188 ?auto_752189 ) ) ( not ( = ?auto_752188 ?auto_752190 ) ) ( not ( = ?auto_752188 ?auto_752191 ) ) ( not ( = ?auto_752188 ?auto_752192 ) ) ( not ( = ?auto_752188 ?auto_752193 ) ) ( not ( = ?auto_752188 ?auto_752194 ) ) ( not ( = ?auto_752188 ?auto_752195 ) ) ( not ( = ?auto_752189 ?auto_752190 ) ) ( not ( = ?auto_752189 ?auto_752191 ) ) ( not ( = ?auto_752189 ?auto_752192 ) ) ( not ( = ?auto_752189 ?auto_752193 ) ) ( not ( = ?auto_752189 ?auto_752194 ) ) ( not ( = ?auto_752189 ?auto_752195 ) ) ( not ( = ?auto_752190 ?auto_752191 ) ) ( not ( = ?auto_752190 ?auto_752192 ) ) ( not ( = ?auto_752190 ?auto_752193 ) ) ( not ( = ?auto_752190 ?auto_752194 ) ) ( not ( = ?auto_752190 ?auto_752195 ) ) ( not ( = ?auto_752191 ?auto_752192 ) ) ( not ( = ?auto_752191 ?auto_752193 ) ) ( not ( = ?auto_752191 ?auto_752194 ) ) ( not ( = ?auto_752191 ?auto_752195 ) ) ( not ( = ?auto_752192 ?auto_752193 ) ) ( not ( = ?auto_752192 ?auto_752194 ) ) ( not ( = ?auto_752192 ?auto_752195 ) ) ( not ( = ?auto_752193 ?auto_752194 ) ) ( not ( = ?auto_752193 ?auto_752195 ) ) ( not ( = ?auto_752194 ?auto_752195 ) ) ( ON ?auto_752193 ?auto_752194 ) ( ON ?auto_752192 ?auto_752193 ) ( ON ?auto_752191 ?auto_752192 ) ( CLEAR ?auto_752189 ) ( ON ?auto_752190 ?auto_752191 ) ( CLEAR ?auto_752190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_752181 ?auto_752182 ?auto_752183 ?auto_752184 ?auto_752185 ?auto_752186 ?auto_752187 ?auto_752188 ?auto_752189 ?auto_752190 )
      ( MAKE-14PILE ?auto_752181 ?auto_752182 ?auto_752183 ?auto_752184 ?auto_752185 ?auto_752186 ?auto_752187 ?auto_752188 ?auto_752189 ?auto_752190 ?auto_752191 ?auto_752192 ?auto_752193 ?auto_752194 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752239 - BLOCK
      ?auto_752240 - BLOCK
      ?auto_752241 - BLOCK
      ?auto_752242 - BLOCK
      ?auto_752243 - BLOCK
      ?auto_752244 - BLOCK
      ?auto_752245 - BLOCK
      ?auto_752246 - BLOCK
      ?auto_752247 - BLOCK
      ?auto_752248 - BLOCK
      ?auto_752249 - BLOCK
      ?auto_752250 - BLOCK
      ?auto_752251 - BLOCK
      ?auto_752252 - BLOCK
    )
    :vars
    (
      ?auto_752253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752252 ?auto_752253 ) ( ON-TABLE ?auto_752239 ) ( ON ?auto_752240 ?auto_752239 ) ( ON ?auto_752241 ?auto_752240 ) ( ON ?auto_752242 ?auto_752241 ) ( ON ?auto_752243 ?auto_752242 ) ( ON ?auto_752244 ?auto_752243 ) ( ON ?auto_752245 ?auto_752244 ) ( ON ?auto_752246 ?auto_752245 ) ( not ( = ?auto_752239 ?auto_752240 ) ) ( not ( = ?auto_752239 ?auto_752241 ) ) ( not ( = ?auto_752239 ?auto_752242 ) ) ( not ( = ?auto_752239 ?auto_752243 ) ) ( not ( = ?auto_752239 ?auto_752244 ) ) ( not ( = ?auto_752239 ?auto_752245 ) ) ( not ( = ?auto_752239 ?auto_752246 ) ) ( not ( = ?auto_752239 ?auto_752247 ) ) ( not ( = ?auto_752239 ?auto_752248 ) ) ( not ( = ?auto_752239 ?auto_752249 ) ) ( not ( = ?auto_752239 ?auto_752250 ) ) ( not ( = ?auto_752239 ?auto_752251 ) ) ( not ( = ?auto_752239 ?auto_752252 ) ) ( not ( = ?auto_752239 ?auto_752253 ) ) ( not ( = ?auto_752240 ?auto_752241 ) ) ( not ( = ?auto_752240 ?auto_752242 ) ) ( not ( = ?auto_752240 ?auto_752243 ) ) ( not ( = ?auto_752240 ?auto_752244 ) ) ( not ( = ?auto_752240 ?auto_752245 ) ) ( not ( = ?auto_752240 ?auto_752246 ) ) ( not ( = ?auto_752240 ?auto_752247 ) ) ( not ( = ?auto_752240 ?auto_752248 ) ) ( not ( = ?auto_752240 ?auto_752249 ) ) ( not ( = ?auto_752240 ?auto_752250 ) ) ( not ( = ?auto_752240 ?auto_752251 ) ) ( not ( = ?auto_752240 ?auto_752252 ) ) ( not ( = ?auto_752240 ?auto_752253 ) ) ( not ( = ?auto_752241 ?auto_752242 ) ) ( not ( = ?auto_752241 ?auto_752243 ) ) ( not ( = ?auto_752241 ?auto_752244 ) ) ( not ( = ?auto_752241 ?auto_752245 ) ) ( not ( = ?auto_752241 ?auto_752246 ) ) ( not ( = ?auto_752241 ?auto_752247 ) ) ( not ( = ?auto_752241 ?auto_752248 ) ) ( not ( = ?auto_752241 ?auto_752249 ) ) ( not ( = ?auto_752241 ?auto_752250 ) ) ( not ( = ?auto_752241 ?auto_752251 ) ) ( not ( = ?auto_752241 ?auto_752252 ) ) ( not ( = ?auto_752241 ?auto_752253 ) ) ( not ( = ?auto_752242 ?auto_752243 ) ) ( not ( = ?auto_752242 ?auto_752244 ) ) ( not ( = ?auto_752242 ?auto_752245 ) ) ( not ( = ?auto_752242 ?auto_752246 ) ) ( not ( = ?auto_752242 ?auto_752247 ) ) ( not ( = ?auto_752242 ?auto_752248 ) ) ( not ( = ?auto_752242 ?auto_752249 ) ) ( not ( = ?auto_752242 ?auto_752250 ) ) ( not ( = ?auto_752242 ?auto_752251 ) ) ( not ( = ?auto_752242 ?auto_752252 ) ) ( not ( = ?auto_752242 ?auto_752253 ) ) ( not ( = ?auto_752243 ?auto_752244 ) ) ( not ( = ?auto_752243 ?auto_752245 ) ) ( not ( = ?auto_752243 ?auto_752246 ) ) ( not ( = ?auto_752243 ?auto_752247 ) ) ( not ( = ?auto_752243 ?auto_752248 ) ) ( not ( = ?auto_752243 ?auto_752249 ) ) ( not ( = ?auto_752243 ?auto_752250 ) ) ( not ( = ?auto_752243 ?auto_752251 ) ) ( not ( = ?auto_752243 ?auto_752252 ) ) ( not ( = ?auto_752243 ?auto_752253 ) ) ( not ( = ?auto_752244 ?auto_752245 ) ) ( not ( = ?auto_752244 ?auto_752246 ) ) ( not ( = ?auto_752244 ?auto_752247 ) ) ( not ( = ?auto_752244 ?auto_752248 ) ) ( not ( = ?auto_752244 ?auto_752249 ) ) ( not ( = ?auto_752244 ?auto_752250 ) ) ( not ( = ?auto_752244 ?auto_752251 ) ) ( not ( = ?auto_752244 ?auto_752252 ) ) ( not ( = ?auto_752244 ?auto_752253 ) ) ( not ( = ?auto_752245 ?auto_752246 ) ) ( not ( = ?auto_752245 ?auto_752247 ) ) ( not ( = ?auto_752245 ?auto_752248 ) ) ( not ( = ?auto_752245 ?auto_752249 ) ) ( not ( = ?auto_752245 ?auto_752250 ) ) ( not ( = ?auto_752245 ?auto_752251 ) ) ( not ( = ?auto_752245 ?auto_752252 ) ) ( not ( = ?auto_752245 ?auto_752253 ) ) ( not ( = ?auto_752246 ?auto_752247 ) ) ( not ( = ?auto_752246 ?auto_752248 ) ) ( not ( = ?auto_752246 ?auto_752249 ) ) ( not ( = ?auto_752246 ?auto_752250 ) ) ( not ( = ?auto_752246 ?auto_752251 ) ) ( not ( = ?auto_752246 ?auto_752252 ) ) ( not ( = ?auto_752246 ?auto_752253 ) ) ( not ( = ?auto_752247 ?auto_752248 ) ) ( not ( = ?auto_752247 ?auto_752249 ) ) ( not ( = ?auto_752247 ?auto_752250 ) ) ( not ( = ?auto_752247 ?auto_752251 ) ) ( not ( = ?auto_752247 ?auto_752252 ) ) ( not ( = ?auto_752247 ?auto_752253 ) ) ( not ( = ?auto_752248 ?auto_752249 ) ) ( not ( = ?auto_752248 ?auto_752250 ) ) ( not ( = ?auto_752248 ?auto_752251 ) ) ( not ( = ?auto_752248 ?auto_752252 ) ) ( not ( = ?auto_752248 ?auto_752253 ) ) ( not ( = ?auto_752249 ?auto_752250 ) ) ( not ( = ?auto_752249 ?auto_752251 ) ) ( not ( = ?auto_752249 ?auto_752252 ) ) ( not ( = ?auto_752249 ?auto_752253 ) ) ( not ( = ?auto_752250 ?auto_752251 ) ) ( not ( = ?auto_752250 ?auto_752252 ) ) ( not ( = ?auto_752250 ?auto_752253 ) ) ( not ( = ?auto_752251 ?auto_752252 ) ) ( not ( = ?auto_752251 ?auto_752253 ) ) ( not ( = ?auto_752252 ?auto_752253 ) ) ( ON ?auto_752251 ?auto_752252 ) ( ON ?auto_752250 ?auto_752251 ) ( ON ?auto_752249 ?auto_752250 ) ( ON ?auto_752248 ?auto_752249 ) ( CLEAR ?auto_752246 ) ( ON ?auto_752247 ?auto_752248 ) ( CLEAR ?auto_752247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_752239 ?auto_752240 ?auto_752241 ?auto_752242 ?auto_752243 ?auto_752244 ?auto_752245 ?auto_752246 ?auto_752247 )
      ( MAKE-14PILE ?auto_752239 ?auto_752240 ?auto_752241 ?auto_752242 ?auto_752243 ?auto_752244 ?auto_752245 ?auto_752246 ?auto_752247 ?auto_752248 ?auto_752249 ?auto_752250 ?auto_752251 ?auto_752252 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752297 - BLOCK
      ?auto_752298 - BLOCK
      ?auto_752299 - BLOCK
      ?auto_752300 - BLOCK
      ?auto_752301 - BLOCK
      ?auto_752302 - BLOCK
      ?auto_752303 - BLOCK
      ?auto_752304 - BLOCK
      ?auto_752305 - BLOCK
      ?auto_752306 - BLOCK
      ?auto_752307 - BLOCK
      ?auto_752308 - BLOCK
      ?auto_752309 - BLOCK
      ?auto_752310 - BLOCK
    )
    :vars
    (
      ?auto_752311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752310 ?auto_752311 ) ( ON-TABLE ?auto_752297 ) ( ON ?auto_752298 ?auto_752297 ) ( ON ?auto_752299 ?auto_752298 ) ( ON ?auto_752300 ?auto_752299 ) ( ON ?auto_752301 ?auto_752300 ) ( ON ?auto_752302 ?auto_752301 ) ( ON ?auto_752303 ?auto_752302 ) ( not ( = ?auto_752297 ?auto_752298 ) ) ( not ( = ?auto_752297 ?auto_752299 ) ) ( not ( = ?auto_752297 ?auto_752300 ) ) ( not ( = ?auto_752297 ?auto_752301 ) ) ( not ( = ?auto_752297 ?auto_752302 ) ) ( not ( = ?auto_752297 ?auto_752303 ) ) ( not ( = ?auto_752297 ?auto_752304 ) ) ( not ( = ?auto_752297 ?auto_752305 ) ) ( not ( = ?auto_752297 ?auto_752306 ) ) ( not ( = ?auto_752297 ?auto_752307 ) ) ( not ( = ?auto_752297 ?auto_752308 ) ) ( not ( = ?auto_752297 ?auto_752309 ) ) ( not ( = ?auto_752297 ?auto_752310 ) ) ( not ( = ?auto_752297 ?auto_752311 ) ) ( not ( = ?auto_752298 ?auto_752299 ) ) ( not ( = ?auto_752298 ?auto_752300 ) ) ( not ( = ?auto_752298 ?auto_752301 ) ) ( not ( = ?auto_752298 ?auto_752302 ) ) ( not ( = ?auto_752298 ?auto_752303 ) ) ( not ( = ?auto_752298 ?auto_752304 ) ) ( not ( = ?auto_752298 ?auto_752305 ) ) ( not ( = ?auto_752298 ?auto_752306 ) ) ( not ( = ?auto_752298 ?auto_752307 ) ) ( not ( = ?auto_752298 ?auto_752308 ) ) ( not ( = ?auto_752298 ?auto_752309 ) ) ( not ( = ?auto_752298 ?auto_752310 ) ) ( not ( = ?auto_752298 ?auto_752311 ) ) ( not ( = ?auto_752299 ?auto_752300 ) ) ( not ( = ?auto_752299 ?auto_752301 ) ) ( not ( = ?auto_752299 ?auto_752302 ) ) ( not ( = ?auto_752299 ?auto_752303 ) ) ( not ( = ?auto_752299 ?auto_752304 ) ) ( not ( = ?auto_752299 ?auto_752305 ) ) ( not ( = ?auto_752299 ?auto_752306 ) ) ( not ( = ?auto_752299 ?auto_752307 ) ) ( not ( = ?auto_752299 ?auto_752308 ) ) ( not ( = ?auto_752299 ?auto_752309 ) ) ( not ( = ?auto_752299 ?auto_752310 ) ) ( not ( = ?auto_752299 ?auto_752311 ) ) ( not ( = ?auto_752300 ?auto_752301 ) ) ( not ( = ?auto_752300 ?auto_752302 ) ) ( not ( = ?auto_752300 ?auto_752303 ) ) ( not ( = ?auto_752300 ?auto_752304 ) ) ( not ( = ?auto_752300 ?auto_752305 ) ) ( not ( = ?auto_752300 ?auto_752306 ) ) ( not ( = ?auto_752300 ?auto_752307 ) ) ( not ( = ?auto_752300 ?auto_752308 ) ) ( not ( = ?auto_752300 ?auto_752309 ) ) ( not ( = ?auto_752300 ?auto_752310 ) ) ( not ( = ?auto_752300 ?auto_752311 ) ) ( not ( = ?auto_752301 ?auto_752302 ) ) ( not ( = ?auto_752301 ?auto_752303 ) ) ( not ( = ?auto_752301 ?auto_752304 ) ) ( not ( = ?auto_752301 ?auto_752305 ) ) ( not ( = ?auto_752301 ?auto_752306 ) ) ( not ( = ?auto_752301 ?auto_752307 ) ) ( not ( = ?auto_752301 ?auto_752308 ) ) ( not ( = ?auto_752301 ?auto_752309 ) ) ( not ( = ?auto_752301 ?auto_752310 ) ) ( not ( = ?auto_752301 ?auto_752311 ) ) ( not ( = ?auto_752302 ?auto_752303 ) ) ( not ( = ?auto_752302 ?auto_752304 ) ) ( not ( = ?auto_752302 ?auto_752305 ) ) ( not ( = ?auto_752302 ?auto_752306 ) ) ( not ( = ?auto_752302 ?auto_752307 ) ) ( not ( = ?auto_752302 ?auto_752308 ) ) ( not ( = ?auto_752302 ?auto_752309 ) ) ( not ( = ?auto_752302 ?auto_752310 ) ) ( not ( = ?auto_752302 ?auto_752311 ) ) ( not ( = ?auto_752303 ?auto_752304 ) ) ( not ( = ?auto_752303 ?auto_752305 ) ) ( not ( = ?auto_752303 ?auto_752306 ) ) ( not ( = ?auto_752303 ?auto_752307 ) ) ( not ( = ?auto_752303 ?auto_752308 ) ) ( not ( = ?auto_752303 ?auto_752309 ) ) ( not ( = ?auto_752303 ?auto_752310 ) ) ( not ( = ?auto_752303 ?auto_752311 ) ) ( not ( = ?auto_752304 ?auto_752305 ) ) ( not ( = ?auto_752304 ?auto_752306 ) ) ( not ( = ?auto_752304 ?auto_752307 ) ) ( not ( = ?auto_752304 ?auto_752308 ) ) ( not ( = ?auto_752304 ?auto_752309 ) ) ( not ( = ?auto_752304 ?auto_752310 ) ) ( not ( = ?auto_752304 ?auto_752311 ) ) ( not ( = ?auto_752305 ?auto_752306 ) ) ( not ( = ?auto_752305 ?auto_752307 ) ) ( not ( = ?auto_752305 ?auto_752308 ) ) ( not ( = ?auto_752305 ?auto_752309 ) ) ( not ( = ?auto_752305 ?auto_752310 ) ) ( not ( = ?auto_752305 ?auto_752311 ) ) ( not ( = ?auto_752306 ?auto_752307 ) ) ( not ( = ?auto_752306 ?auto_752308 ) ) ( not ( = ?auto_752306 ?auto_752309 ) ) ( not ( = ?auto_752306 ?auto_752310 ) ) ( not ( = ?auto_752306 ?auto_752311 ) ) ( not ( = ?auto_752307 ?auto_752308 ) ) ( not ( = ?auto_752307 ?auto_752309 ) ) ( not ( = ?auto_752307 ?auto_752310 ) ) ( not ( = ?auto_752307 ?auto_752311 ) ) ( not ( = ?auto_752308 ?auto_752309 ) ) ( not ( = ?auto_752308 ?auto_752310 ) ) ( not ( = ?auto_752308 ?auto_752311 ) ) ( not ( = ?auto_752309 ?auto_752310 ) ) ( not ( = ?auto_752309 ?auto_752311 ) ) ( not ( = ?auto_752310 ?auto_752311 ) ) ( ON ?auto_752309 ?auto_752310 ) ( ON ?auto_752308 ?auto_752309 ) ( ON ?auto_752307 ?auto_752308 ) ( ON ?auto_752306 ?auto_752307 ) ( ON ?auto_752305 ?auto_752306 ) ( CLEAR ?auto_752303 ) ( ON ?auto_752304 ?auto_752305 ) ( CLEAR ?auto_752304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_752297 ?auto_752298 ?auto_752299 ?auto_752300 ?auto_752301 ?auto_752302 ?auto_752303 ?auto_752304 )
      ( MAKE-14PILE ?auto_752297 ?auto_752298 ?auto_752299 ?auto_752300 ?auto_752301 ?auto_752302 ?auto_752303 ?auto_752304 ?auto_752305 ?auto_752306 ?auto_752307 ?auto_752308 ?auto_752309 ?auto_752310 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752355 - BLOCK
      ?auto_752356 - BLOCK
      ?auto_752357 - BLOCK
      ?auto_752358 - BLOCK
      ?auto_752359 - BLOCK
      ?auto_752360 - BLOCK
      ?auto_752361 - BLOCK
      ?auto_752362 - BLOCK
      ?auto_752363 - BLOCK
      ?auto_752364 - BLOCK
      ?auto_752365 - BLOCK
      ?auto_752366 - BLOCK
      ?auto_752367 - BLOCK
      ?auto_752368 - BLOCK
    )
    :vars
    (
      ?auto_752369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752368 ?auto_752369 ) ( ON-TABLE ?auto_752355 ) ( ON ?auto_752356 ?auto_752355 ) ( ON ?auto_752357 ?auto_752356 ) ( ON ?auto_752358 ?auto_752357 ) ( ON ?auto_752359 ?auto_752358 ) ( ON ?auto_752360 ?auto_752359 ) ( not ( = ?auto_752355 ?auto_752356 ) ) ( not ( = ?auto_752355 ?auto_752357 ) ) ( not ( = ?auto_752355 ?auto_752358 ) ) ( not ( = ?auto_752355 ?auto_752359 ) ) ( not ( = ?auto_752355 ?auto_752360 ) ) ( not ( = ?auto_752355 ?auto_752361 ) ) ( not ( = ?auto_752355 ?auto_752362 ) ) ( not ( = ?auto_752355 ?auto_752363 ) ) ( not ( = ?auto_752355 ?auto_752364 ) ) ( not ( = ?auto_752355 ?auto_752365 ) ) ( not ( = ?auto_752355 ?auto_752366 ) ) ( not ( = ?auto_752355 ?auto_752367 ) ) ( not ( = ?auto_752355 ?auto_752368 ) ) ( not ( = ?auto_752355 ?auto_752369 ) ) ( not ( = ?auto_752356 ?auto_752357 ) ) ( not ( = ?auto_752356 ?auto_752358 ) ) ( not ( = ?auto_752356 ?auto_752359 ) ) ( not ( = ?auto_752356 ?auto_752360 ) ) ( not ( = ?auto_752356 ?auto_752361 ) ) ( not ( = ?auto_752356 ?auto_752362 ) ) ( not ( = ?auto_752356 ?auto_752363 ) ) ( not ( = ?auto_752356 ?auto_752364 ) ) ( not ( = ?auto_752356 ?auto_752365 ) ) ( not ( = ?auto_752356 ?auto_752366 ) ) ( not ( = ?auto_752356 ?auto_752367 ) ) ( not ( = ?auto_752356 ?auto_752368 ) ) ( not ( = ?auto_752356 ?auto_752369 ) ) ( not ( = ?auto_752357 ?auto_752358 ) ) ( not ( = ?auto_752357 ?auto_752359 ) ) ( not ( = ?auto_752357 ?auto_752360 ) ) ( not ( = ?auto_752357 ?auto_752361 ) ) ( not ( = ?auto_752357 ?auto_752362 ) ) ( not ( = ?auto_752357 ?auto_752363 ) ) ( not ( = ?auto_752357 ?auto_752364 ) ) ( not ( = ?auto_752357 ?auto_752365 ) ) ( not ( = ?auto_752357 ?auto_752366 ) ) ( not ( = ?auto_752357 ?auto_752367 ) ) ( not ( = ?auto_752357 ?auto_752368 ) ) ( not ( = ?auto_752357 ?auto_752369 ) ) ( not ( = ?auto_752358 ?auto_752359 ) ) ( not ( = ?auto_752358 ?auto_752360 ) ) ( not ( = ?auto_752358 ?auto_752361 ) ) ( not ( = ?auto_752358 ?auto_752362 ) ) ( not ( = ?auto_752358 ?auto_752363 ) ) ( not ( = ?auto_752358 ?auto_752364 ) ) ( not ( = ?auto_752358 ?auto_752365 ) ) ( not ( = ?auto_752358 ?auto_752366 ) ) ( not ( = ?auto_752358 ?auto_752367 ) ) ( not ( = ?auto_752358 ?auto_752368 ) ) ( not ( = ?auto_752358 ?auto_752369 ) ) ( not ( = ?auto_752359 ?auto_752360 ) ) ( not ( = ?auto_752359 ?auto_752361 ) ) ( not ( = ?auto_752359 ?auto_752362 ) ) ( not ( = ?auto_752359 ?auto_752363 ) ) ( not ( = ?auto_752359 ?auto_752364 ) ) ( not ( = ?auto_752359 ?auto_752365 ) ) ( not ( = ?auto_752359 ?auto_752366 ) ) ( not ( = ?auto_752359 ?auto_752367 ) ) ( not ( = ?auto_752359 ?auto_752368 ) ) ( not ( = ?auto_752359 ?auto_752369 ) ) ( not ( = ?auto_752360 ?auto_752361 ) ) ( not ( = ?auto_752360 ?auto_752362 ) ) ( not ( = ?auto_752360 ?auto_752363 ) ) ( not ( = ?auto_752360 ?auto_752364 ) ) ( not ( = ?auto_752360 ?auto_752365 ) ) ( not ( = ?auto_752360 ?auto_752366 ) ) ( not ( = ?auto_752360 ?auto_752367 ) ) ( not ( = ?auto_752360 ?auto_752368 ) ) ( not ( = ?auto_752360 ?auto_752369 ) ) ( not ( = ?auto_752361 ?auto_752362 ) ) ( not ( = ?auto_752361 ?auto_752363 ) ) ( not ( = ?auto_752361 ?auto_752364 ) ) ( not ( = ?auto_752361 ?auto_752365 ) ) ( not ( = ?auto_752361 ?auto_752366 ) ) ( not ( = ?auto_752361 ?auto_752367 ) ) ( not ( = ?auto_752361 ?auto_752368 ) ) ( not ( = ?auto_752361 ?auto_752369 ) ) ( not ( = ?auto_752362 ?auto_752363 ) ) ( not ( = ?auto_752362 ?auto_752364 ) ) ( not ( = ?auto_752362 ?auto_752365 ) ) ( not ( = ?auto_752362 ?auto_752366 ) ) ( not ( = ?auto_752362 ?auto_752367 ) ) ( not ( = ?auto_752362 ?auto_752368 ) ) ( not ( = ?auto_752362 ?auto_752369 ) ) ( not ( = ?auto_752363 ?auto_752364 ) ) ( not ( = ?auto_752363 ?auto_752365 ) ) ( not ( = ?auto_752363 ?auto_752366 ) ) ( not ( = ?auto_752363 ?auto_752367 ) ) ( not ( = ?auto_752363 ?auto_752368 ) ) ( not ( = ?auto_752363 ?auto_752369 ) ) ( not ( = ?auto_752364 ?auto_752365 ) ) ( not ( = ?auto_752364 ?auto_752366 ) ) ( not ( = ?auto_752364 ?auto_752367 ) ) ( not ( = ?auto_752364 ?auto_752368 ) ) ( not ( = ?auto_752364 ?auto_752369 ) ) ( not ( = ?auto_752365 ?auto_752366 ) ) ( not ( = ?auto_752365 ?auto_752367 ) ) ( not ( = ?auto_752365 ?auto_752368 ) ) ( not ( = ?auto_752365 ?auto_752369 ) ) ( not ( = ?auto_752366 ?auto_752367 ) ) ( not ( = ?auto_752366 ?auto_752368 ) ) ( not ( = ?auto_752366 ?auto_752369 ) ) ( not ( = ?auto_752367 ?auto_752368 ) ) ( not ( = ?auto_752367 ?auto_752369 ) ) ( not ( = ?auto_752368 ?auto_752369 ) ) ( ON ?auto_752367 ?auto_752368 ) ( ON ?auto_752366 ?auto_752367 ) ( ON ?auto_752365 ?auto_752366 ) ( ON ?auto_752364 ?auto_752365 ) ( ON ?auto_752363 ?auto_752364 ) ( ON ?auto_752362 ?auto_752363 ) ( CLEAR ?auto_752360 ) ( ON ?auto_752361 ?auto_752362 ) ( CLEAR ?auto_752361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_752355 ?auto_752356 ?auto_752357 ?auto_752358 ?auto_752359 ?auto_752360 ?auto_752361 )
      ( MAKE-14PILE ?auto_752355 ?auto_752356 ?auto_752357 ?auto_752358 ?auto_752359 ?auto_752360 ?auto_752361 ?auto_752362 ?auto_752363 ?auto_752364 ?auto_752365 ?auto_752366 ?auto_752367 ?auto_752368 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752413 - BLOCK
      ?auto_752414 - BLOCK
      ?auto_752415 - BLOCK
      ?auto_752416 - BLOCK
      ?auto_752417 - BLOCK
      ?auto_752418 - BLOCK
      ?auto_752419 - BLOCK
      ?auto_752420 - BLOCK
      ?auto_752421 - BLOCK
      ?auto_752422 - BLOCK
      ?auto_752423 - BLOCK
      ?auto_752424 - BLOCK
      ?auto_752425 - BLOCK
      ?auto_752426 - BLOCK
    )
    :vars
    (
      ?auto_752427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752426 ?auto_752427 ) ( ON-TABLE ?auto_752413 ) ( ON ?auto_752414 ?auto_752413 ) ( ON ?auto_752415 ?auto_752414 ) ( ON ?auto_752416 ?auto_752415 ) ( ON ?auto_752417 ?auto_752416 ) ( not ( = ?auto_752413 ?auto_752414 ) ) ( not ( = ?auto_752413 ?auto_752415 ) ) ( not ( = ?auto_752413 ?auto_752416 ) ) ( not ( = ?auto_752413 ?auto_752417 ) ) ( not ( = ?auto_752413 ?auto_752418 ) ) ( not ( = ?auto_752413 ?auto_752419 ) ) ( not ( = ?auto_752413 ?auto_752420 ) ) ( not ( = ?auto_752413 ?auto_752421 ) ) ( not ( = ?auto_752413 ?auto_752422 ) ) ( not ( = ?auto_752413 ?auto_752423 ) ) ( not ( = ?auto_752413 ?auto_752424 ) ) ( not ( = ?auto_752413 ?auto_752425 ) ) ( not ( = ?auto_752413 ?auto_752426 ) ) ( not ( = ?auto_752413 ?auto_752427 ) ) ( not ( = ?auto_752414 ?auto_752415 ) ) ( not ( = ?auto_752414 ?auto_752416 ) ) ( not ( = ?auto_752414 ?auto_752417 ) ) ( not ( = ?auto_752414 ?auto_752418 ) ) ( not ( = ?auto_752414 ?auto_752419 ) ) ( not ( = ?auto_752414 ?auto_752420 ) ) ( not ( = ?auto_752414 ?auto_752421 ) ) ( not ( = ?auto_752414 ?auto_752422 ) ) ( not ( = ?auto_752414 ?auto_752423 ) ) ( not ( = ?auto_752414 ?auto_752424 ) ) ( not ( = ?auto_752414 ?auto_752425 ) ) ( not ( = ?auto_752414 ?auto_752426 ) ) ( not ( = ?auto_752414 ?auto_752427 ) ) ( not ( = ?auto_752415 ?auto_752416 ) ) ( not ( = ?auto_752415 ?auto_752417 ) ) ( not ( = ?auto_752415 ?auto_752418 ) ) ( not ( = ?auto_752415 ?auto_752419 ) ) ( not ( = ?auto_752415 ?auto_752420 ) ) ( not ( = ?auto_752415 ?auto_752421 ) ) ( not ( = ?auto_752415 ?auto_752422 ) ) ( not ( = ?auto_752415 ?auto_752423 ) ) ( not ( = ?auto_752415 ?auto_752424 ) ) ( not ( = ?auto_752415 ?auto_752425 ) ) ( not ( = ?auto_752415 ?auto_752426 ) ) ( not ( = ?auto_752415 ?auto_752427 ) ) ( not ( = ?auto_752416 ?auto_752417 ) ) ( not ( = ?auto_752416 ?auto_752418 ) ) ( not ( = ?auto_752416 ?auto_752419 ) ) ( not ( = ?auto_752416 ?auto_752420 ) ) ( not ( = ?auto_752416 ?auto_752421 ) ) ( not ( = ?auto_752416 ?auto_752422 ) ) ( not ( = ?auto_752416 ?auto_752423 ) ) ( not ( = ?auto_752416 ?auto_752424 ) ) ( not ( = ?auto_752416 ?auto_752425 ) ) ( not ( = ?auto_752416 ?auto_752426 ) ) ( not ( = ?auto_752416 ?auto_752427 ) ) ( not ( = ?auto_752417 ?auto_752418 ) ) ( not ( = ?auto_752417 ?auto_752419 ) ) ( not ( = ?auto_752417 ?auto_752420 ) ) ( not ( = ?auto_752417 ?auto_752421 ) ) ( not ( = ?auto_752417 ?auto_752422 ) ) ( not ( = ?auto_752417 ?auto_752423 ) ) ( not ( = ?auto_752417 ?auto_752424 ) ) ( not ( = ?auto_752417 ?auto_752425 ) ) ( not ( = ?auto_752417 ?auto_752426 ) ) ( not ( = ?auto_752417 ?auto_752427 ) ) ( not ( = ?auto_752418 ?auto_752419 ) ) ( not ( = ?auto_752418 ?auto_752420 ) ) ( not ( = ?auto_752418 ?auto_752421 ) ) ( not ( = ?auto_752418 ?auto_752422 ) ) ( not ( = ?auto_752418 ?auto_752423 ) ) ( not ( = ?auto_752418 ?auto_752424 ) ) ( not ( = ?auto_752418 ?auto_752425 ) ) ( not ( = ?auto_752418 ?auto_752426 ) ) ( not ( = ?auto_752418 ?auto_752427 ) ) ( not ( = ?auto_752419 ?auto_752420 ) ) ( not ( = ?auto_752419 ?auto_752421 ) ) ( not ( = ?auto_752419 ?auto_752422 ) ) ( not ( = ?auto_752419 ?auto_752423 ) ) ( not ( = ?auto_752419 ?auto_752424 ) ) ( not ( = ?auto_752419 ?auto_752425 ) ) ( not ( = ?auto_752419 ?auto_752426 ) ) ( not ( = ?auto_752419 ?auto_752427 ) ) ( not ( = ?auto_752420 ?auto_752421 ) ) ( not ( = ?auto_752420 ?auto_752422 ) ) ( not ( = ?auto_752420 ?auto_752423 ) ) ( not ( = ?auto_752420 ?auto_752424 ) ) ( not ( = ?auto_752420 ?auto_752425 ) ) ( not ( = ?auto_752420 ?auto_752426 ) ) ( not ( = ?auto_752420 ?auto_752427 ) ) ( not ( = ?auto_752421 ?auto_752422 ) ) ( not ( = ?auto_752421 ?auto_752423 ) ) ( not ( = ?auto_752421 ?auto_752424 ) ) ( not ( = ?auto_752421 ?auto_752425 ) ) ( not ( = ?auto_752421 ?auto_752426 ) ) ( not ( = ?auto_752421 ?auto_752427 ) ) ( not ( = ?auto_752422 ?auto_752423 ) ) ( not ( = ?auto_752422 ?auto_752424 ) ) ( not ( = ?auto_752422 ?auto_752425 ) ) ( not ( = ?auto_752422 ?auto_752426 ) ) ( not ( = ?auto_752422 ?auto_752427 ) ) ( not ( = ?auto_752423 ?auto_752424 ) ) ( not ( = ?auto_752423 ?auto_752425 ) ) ( not ( = ?auto_752423 ?auto_752426 ) ) ( not ( = ?auto_752423 ?auto_752427 ) ) ( not ( = ?auto_752424 ?auto_752425 ) ) ( not ( = ?auto_752424 ?auto_752426 ) ) ( not ( = ?auto_752424 ?auto_752427 ) ) ( not ( = ?auto_752425 ?auto_752426 ) ) ( not ( = ?auto_752425 ?auto_752427 ) ) ( not ( = ?auto_752426 ?auto_752427 ) ) ( ON ?auto_752425 ?auto_752426 ) ( ON ?auto_752424 ?auto_752425 ) ( ON ?auto_752423 ?auto_752424 ) ( ON ?auto_752422 ?auto_752423 ) ( ON ?auto_752421 ?auto_752422 ) ( ON ?auto_752420 ?auto_752421 ) ( ON ?auto_752419 ?auto_752420 ) ( CLEAR ?auto_752417 ) ( ON ?auto_752418 ?auto_752419 ) ( CLEAR ?auto_752418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_752413 ?auto_752414 ?auto_752415 ?auto_752416 ?auto_752417 ?auto_752418 )
      ( MAKE-14PILE ?auto_752413 ?auto_752414 ?auto_752415 ?auto_752416 ?auto_752417 ?auto_752418 ?auto_752419 ?auto_752420 ?auto_752421 ?auto_752422 ?auto_752423 ?auto_752424 ?auto_752425 ?auto_752426 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752471 - BLOCK
      ?auto_752472 - BLOCK
      ?auto_752473 - BLOCK
      ?auto_752474 - BLOCK
      ?auto_752475 - BLOCK
      ?auto_752476 - BLOCK
      ?auto_752477 - BLOCK
      ?auto_752478 - BLOCK
      ?auto_752479 - BLOCK
      ?auto_752480 - BLOCK
      ?auto_752481 - BLOCK
      ?auto_752482 - BLOCK
      ?auto_752483 - BLOCK
      ?auto_752484 - BLOCK
    )
    :vars
    (
      ?auto_752485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752484 ?auto_752485 ) ( ON-TABLE ?auto_752471 ) ( ON ?auto_752472 ?auto_752471 ) ( ON ?auto_752473 ?auto_752472 ) ( ON ?auto_752474 ?auto_752473 ) ( not ( = ?auto_752471 ?auto_752472 ) ) ( not ( = ?auto_752471 ?auto_752473 ) ) ( not ( = ?auto_752471 ?auto_752474 ) ) ( not ( = ?auto_752471 ?auto_752475 ) ) ( not ( = ?auto_752471 ?auto_752476 ) ) ( not ( = ?auto_752471 ?auto_752477 ) ) ( not ( = ?auto_752471 ?auto_752478 ) ) ( not ( = ?auto_752471 ?auto_752479 ) ) ( not ( = ?auto_752471 ?auto_752480 ) ) ( not ( = ?auto_752471 ?auto_752481 ) ) ( not ( = ?auto_752471 ?auto_752482 ) ) ( not ( = ?auto_752471 ?auto_752483 ) ) ( not ( = ?auto_752471 ?auto_752484 ) ) ( not ( = ?auto_752471 ?auto_752485 ) ) ( not ( = ?auto_752472 ?auto_752473 ) ) ( not ( = ?auto_752472 ?auto_752474 ) ) ( not ( = ?auto_752472 ?auto_752475 ) ) ( not ( = ?auto_752472 ?auto_752476 ) ) ( not ( = ?auto_752472 ?auto_752477 ) ) ( not ( = ?auto_752472 ?auto_752478 ) ) ( not ( = ?auto_752472 ?auto_752479 ) ) ( not ( = ?auto_752472 ?auto_752480 ) ) ( not ( = ?auto_752472 ?auto_752481 ) ) ( not ( = ?auto_752472 ?auto_752482 ) ) ( not ( = ?auto_752472 ?auto_752483 ) ) ( not ( = ?auto_752472 ?auto_752484 ) ) ( not ( = ?auto_752472 ?auto_752485 ) ) ( not ( = ?auto_752473 ?auto_752474 ) ) ( not ( = ?auto_752473 ?auto_752475 ) ) ( not ( = ?auto_752473 ?auto_752476 ) ) ( not ( = ?auto_752473 ?auto_752477 ) ) ( not ( = ?auto_752473 ?auto_752478 ) ) ( not ( = ?auto_752473 ?auto_752479 ) ) ( not ( = ?auto_752473 ?auto_752480 ) ) ( not ( = ?auto_752473 ?auto_752481 ) ) ( not ( = ?auto_752473 ?auto_752482 ) ) ( not ( = ?auto_752473 ?auto_752483 ) ) ( not ( = ?auto_752473 ?auto_752484 ) ) ( not ( = ?auto_752473 ?auto_752485 ) ) ( not ( = ?auto_752474 ?auto_752475 ) ) ( not ( = ?auto_752474 ?auto_752476 ) ) ( not ( = ?auto_752474 ?auto_752477 ) ) ( not ( = ?auto_752474 ?auto_752478 ) ) ( not ( = ?auto_752474 ?auto_752479 ) ) ( not ( = ?auto_752474 ?auto_752480 ) ) ( not ( = ?auto_752474 ?auto_752481 ) ) ( not ( = ?auto_752474 ?auto_752482 ) ) ( not ( = ?auto_752474 ?auto_752483 ) ) ( not ( = ?auto_752474 ?auto_752484 ) ) ( not ( = ?auto_752474 ?auto_752485 ) ) ( not ( = ?auto_752475 ?auto_752476 ) ) ( not ( = ?auto_752475 ?auto_752477 ) ) ( not ( = ?auto_752475 ?auto_752478 ) ) ( not ( = ?auto_752475 ?auto_752479 ) ) ( not ( = ?auto_752475 ?auto_752480 ) ) ( not ( = ?auto_752475 ?auto_752481 ) ) ( not ( = ?auto_752475 ?auto_752482 ) ) ( not ( = ?auto_752475 ?auto_752483 ) ) ( not ( = ?auto_752475 ?auto_752484 ) ) ( not ( = ?auto_752475 ?auto_752485 ) ) ( not ( = ?auto_752476 ?auto_752477 ) ) ( not ( = ?auto_752476 ?auto_752478 ) ) ( not ( = ?auto_752476 ?auto_752479 ) ) ( not ( = ?auto_752476 ?auto_752480 ) ) ( not ( = ?auto_752476 ?auto_752481 ) ) ( not ( = ?auto_752476 ?auto_752482 ) ) ( not ( = ?auto_752476 ?auto_752483 ) ) ( not ( = ?auto_752476 ?auto_752484 ) ) ( not ( = ?auto_752476 ?auto_752485 ) ) ( not ( = ?auto_752477 ?auto_752478 ) ) ( not ( = ?auto_752477 ?auto_752479 ) ) ( not ( = ?auto_752477 ?auto_752480 ) ) ( not ( = ?auto_752477 ?auto_752481 ) ) ( not ( = ?auto_752477 ?auto_752482 ) ) ( not ( = ?auto_752477 ?auto_752483 ) ) ( not ( = ?auto_752477 ?auto_752484 ) ) ( not ( = ?auto_752477 ?auto_752485 ) ) ( not ( = ?auto_752478 ?auto_752479 ) ) ( not ( = ?auto_752478 ?auto_752480 ) ) ( not ( = ?auto_752478 ?auto_752481 ) ) ( not ( = ?auto_752478 ?auto_752482 ) ) ( not ( = ?auto_752478 ?auto_752483 ) ) ( not ( = ?auto_752478 ?auto_752484 ) ) ( not ( = ?auto_752478 ?auto_752485 ) ) ( not ( = ?auto_752479 ?auto_752480 ) ) ( not ( = ?auto_752479 ?auto_752481 ) ) ( not ( = ?auto_752479 ?auto_752482 ) ) ( not ( = ?auto_752479 ?auto_752483 ) ) ( not ( = ?auto_752479 ?auto_752484 ) ) ( not ( = ?auto_752479 ?auto_752485 ) ) ( not ( = ?auto_752480 ?auto_752481 ) ) ( not ( = ?auto_752480 ?auto_752482 ) ) ( not ( = ?auto_752480 ?auto_752483 ) ) ( not ( = ?auto_752480 ?auto_752484 ) ) ( not ( = ?auto_752480 ?auto_752485 ) ) ( not ( = ?auto_752481 ?auto_752482 ) ) ( not ( = ?auto_752481 ?auto_752483 ) ) ( not ( = ?auto_752481 ?auto_752484 ) ) ( not ( = ?auto_752481 ?auto_752485 ) ) ( not ( = ?auto_752482 ?auto_752483 ) ) ( not ( = ?auto_752482 ?auto_752484 ) ) ( not ( = ?auto_752482 ?auto_752485 ) ) ( not ( = ?auto_752483 ?auto_752484 ) ) ( not ( = ?auto_752483 ?auto_752485 ) ) ( not ( = ?auto_752484 ?auto_752485 ) ) ( ON ?auto_752483 ?auto_752484 ) ( ON ?auto_752482 ?auto_752483 ) ( ON ?auto_752481 ?auto_752482 ) ( ON ?auto_752480 ?auto_752481 ) ( ON ?auto_752479 ?auto_752480 ) ( ON ?auto_752478 ?auto_752479 ) ( ON ?auto_752477 ?auto_752478 ) ( ON ?auto_752476 ?auto_752477 ) ( CLEAR ?auto_752474 ) ( ON ?auto_752475 ?auto_752476 ) ( CLEAR ?auto_752475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_752471 ?auto_752472 ?auto_752473 ?auto_752474 ?auto_752475 )
      ( MAKE-14PILE ?auto_752471 ?auto_752472 ?auto_752473 ?auto_752474 ?auto_752475 ?auto_752476 ?auto_752477 ?auto_752478 ?auto_752479 ?auto_752480 ?auto_752481 ?auto_752482 ?auto_752483 ?auto_752484 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752529 - BLOCK
      ?auto_752530 - BLOCK
      ?auto_752531 - BLOCK
      ?auto_752532 - BLOCK
      ?auto_752533 - BLOCK
      ?auto_752534 - BLOCK
      ?auto_752535 - BLOCK
      ?auto_752536 - BLOCK
      ?auto_752537 - BLOCK
      ?auto_752538 - BLOCK
      ?auto_752539 - BLOCK
      ?auto_752540 - BLOCK
      ?auto_752541 - BLOCK
      ?auto_752542 - BLOCK
    )
    :vars
    (
      ?auto_752543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752542 ?auto_752543 ) ( ON-TABLE ?auto_752529 ) ( ON ?auto_752530 ?auto_752529 ) ( ON ?auto_752531 ?auto_752530 ) ( not ( = ?auto_752529 ?auto_752530 ) ) ( not ( = ?auto_752529 ?auto_752531 ) ) ( not ( = ?auto_752529 ?auto_752532 ) ) ( not ( = ?auto_752529 ?auto_752533 ) ) ( not ( = ?auto_752529 ?auto_752534 ) ) ( not ( = ?auto_752529 ?auto_752535 ) ) ( not ( = ?auto_752529 ?auto_752536 ) ) ( not ( = ?auto_752529 ?auto_752537 ) ) ( not ( = ?auto_752529 ?auto_752538 ) ) ( not ( = ?auto_752529 ?auto_752539 ) ) ( not ( = ?auto_752529 ?auto_752540 ) ) ( not ( = ?auto_752529 ?auto_752541 ) ) ( not ( = ?auto_752529 ?auto_752542 ) ) ( not ( = ?auto_752529 ?auto_752543 ) ) ( not ( = ?auto_752530 ?auto_752531 ) ) ( not ( = ?auto_752530 ?auto_752532 ) ) ( not ( = ?auto_752530 ?auto_752533 ) ) ( not ( = ?auto_752530 ?auto_752534 ) ) ( not ( = ?auto_752530 ?auto_752535 ) ) ( not ( = ?auto_752530 ?auto_752536 ) ) ( not ( = ?auto_752530 ?auto_752537 ) ) ( not ( = ?auto_752530 ?auto_752538 ) ) ( not ( = ?auto_752530 ?auto_752539 ) ) ( not ( = ?auto_752530 ?auto_752540 ) ) ( not ( = ?auto_752530 ?auto_752541 ) ) ( not ( = ?auto_752530 ?auto_752542 ) ) ( not ( = ?auto_752530 ?auto_752543 ) ) ( not ( = ?auto_752531 ?auto_752532 ) ) ( not ( = ?auto_752531 ?auto_752533 ) ) ( not ( = ?auto_752531 ?auto_752534 ) ) ( not ( = ?auto_752531 ?auto_752535 ) ) ( not ( = ?auto_752531 ?auto_752536 ) ) ( not ( = ?auto_752531 ?auto_752537 ) ) ( not ( = ?auto_752531 ?auto_752538 ) ) ( not ( = ?auto_752531 ?auto_752539 ) ) ( not ( = ?auto_752531 ?auto_752540 ) ) ( not ( = ?auto_752531 ?auto_752541 ) ) ( not ( = ?auto_752531 ?auto_752542 ) ) ( not ( = ?auto_752531 ?auto_752543 ) ) ( not ( = ?auto_752532 ?auto_752533 ) ) ( not ( = ?auto_752532 ?auto_752534 ) ) ( not ( = ?auto_752532 ?auto_752535 ) ) ( not ( = ?auto_752532 ?auto_752536 ) ) ( not ( = ?auto_752532 ?auto_752537 ) ) ( not ( = ?auto_752532 ?auto_752538 ) ) ( not ( = ?auto_752532 ?auto_752539 ) ) ( not ( = ?auto_752532 ?auto_752540 ) ) ( not ( = ?auto_752532 ?auto_752541 ) ) ( not ( = ?auto_752532 ?auto_752542 ) ) ( not ( = ?auto_752532 ?auto_752543 ) ) ( not ( = ?auto_752533 ?auto_752534 ) ) ( not ( = ?auto_752533 ?auto_752535 ) ) ( not ( = ?auto_752533 ?auto_752536 ) ) ( not ( = ?auto_752533 ?auto_752537 ) ) ( not ( = ?auto_752533 ?auto_752538 ) ) ( not ( = ?auto_752533 ?auto_752539 ) ) ( not ( = ?auto_752533 ?auto_752540 ) ) ( not ( = ?auto_752533 ?auto_752541 ) ) ( not ( = ?auto_752533 ?auto_752542 ) ) ( not ( = ?auto_752533 ?auto_752543 ) ) ( not ( = ?auto_752534 ?auto_752535 ) ) ( not ( = ?auto_752534 ?auto_752536 ) ) ( not ( = ?auto_752534 ?auto_752537 ) ) ( not ( = ?auto_752534 ?auto_752538 ) ) ( not ( = ?auto_752534 ?auto_752539 ) ) ( not ( = ?auto_752534 ?auto_752540 ) ) ( not ( = ?auto_752534 ?auto_752541 ) ) ( not ( = ?auto_752534 ?auto_752542 ) ) ( not ( = ?auto_752534 ?auto_752543 ) ) ( not ( = ?auto_752535 ?auto_752536 ) ) ( not ( = ?auto_752535 ?auto_752537 ) ) ( not ( = ?auto_752535 ?auto_752538 ) ) ( not ( = ?auto_752535 ?auto_752539 ) ) ( not ( = ?auto_752535 ?auto_752540 ) ) ( not ( = ?auto_752535 ?auto_752541 ) ) ( not ( = ?auto_752535 ?auto_752542 ) ) ( not ( = ?auto_752535 ?auto_752543 ) ) ( not ( = ?auto_752536 ?auto_752537 ) ) ( not ( = ?auto_752536 ?auto_752538 ) ) ( not ( = ?auto_752536 ?auto_752539 ) ) ( not ( = ?auto_752536 ?auto_752540 ) ) ( not ( = ?auto_752536 ?auto_752541 ) ) ( not ( = ?auto_752536 ?auto_752542 ) ) ( not ( = ?auto_752536 ?auto_752543 ) ) ( not ( = ?auto_752537 ?auto_752538 ) ) ( not ( = ?auto_752537 ?auto_752539 ) ) ( not ( = ?auto_752537 ?auto_752540 ) ) ( not ( = ?auto_752537 ?auto_752541 ) ) ( not ( = ?auto_752537 ?auto_752542 ) ) ( not ( = ?auto_752537 ?auto_752543 ) ) ( not ( = ?auto_752538 ?auto_752539 ) ) ( not ( = ?auto_752538 ?auto_752540 ) ) ( not ( = ?auto_752538 ?auto_752541 ) ) ( not ( = ?auto_752538 ?auto_752542 ) ) ( not ( = ?auto_752538 ?auto_752543 ) ) ( not ( = ?auto_752539 ?auto_752540 ) ) ( not ( = ?auto_752539 ?auto_752541 ) ) ( not ( = ?auto_752539 ?auto_752542 ) ) ( not ( = ?auto_752539 ?auto_752543 ) ) ( not ( = ?auto_752540 ?auto_752541 ) ) ( not ( = ?auto_752540 ?auto_752542 ) ) ( not ( = ?auto_752540 ?auto_752543 ) ) ( not ( = ?auto_752541 ?auto_752542 ) ) ( not ( = ?auto_752541 ?auto_752543 ) ) ( not ( = ?auto_752542 ?auto_752543 ) ) ( ON ?auto_752541 ?auto_752542 ) ( ON ?auto_752540 ?auto_752541 ) ( ON ?auto_752539 ?auto_752540 ) ( ON ?auto_752538 ?auto_752539 ) ( ON ?auto_752537 ?auto_752538 ) ( ON ?auto_752536 ?auto_752537 ) ( ON ?auto_752535 ?auto_752536 ) ( ON ?auto_752534 ?auto_752535 ) ( ON ?auto_752533 ?auto_752534 ) ( CLEAR ?auto_752531 ) ( ON ?auto_752532 ?auto_752533 ) ( CLEAR ?auto_752532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_752529 ?auto_752530 ?auto_752531 ?auto_752532 )
      ( MAKE-14PILE ?auto_752529 ?auto_752530 ?auto_752531 ?auto_752532 ?auto_752533 ?auto_752534 ?auto_752535 ?auto_752536 ?auto_752537 ?auto_752538 ?auto_752539 ?auto_752540 ?auto_752541 ?auto_752542 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752587 - BLOCK
      ?auto_752588 - BLOCK
      ?auto_752589 - BLOCK
      ?auto_752590 - BLOCK
      ?auto_752591 - BLOCK
      ?auto_752592 - BLOCK
      ?auto_752593 - BLOCK
      ?auto_752594 - BLOCK
      ?auto_752595 - BLOCK
      ?auto_752596 - BLOCK
      ?auto_752597 - BLOCK
      ?auto_752598 - BLOCK
      ?auto_752599 - BLOCK
      ?auto_752600 - BLOCK
    )
    :vars
    (
      ?auto_752601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752600 ?auto_752601 ) ( ON-TABLE ?auto_752587 ) ( ON ?auto_752588 ?auto_752587 ) ( not ( = ?auto_752587 ?auto_752588 ) ) ( not ( = ?auto_752587 ?auto_752589 ) ) ( not ( = ?auto_752587 ?auto_752590 ) ) ( not ( = ?auto_752587 ?auto_752591 ) ) ( not ( = ?auto_752587 ?auto_752592 ) ) ( not ( = ?auto_752587 ?auto_752593 ) ) ( not ( = ?auto_752587 ?auto_752594 ) ) ( not ( = ?auto_752587 ?auto_752595 ) ) ( not ( = ?auto_752587 ?auto_752596 ) ) ( not ( = ?auto_752587 ?auto_752597 ) ) ( not ( = ?auto_752587 ?auto_752598 ) ) ( not ( = ?auto_752587 ?auto_752599 ) ) ( not ( = ?auto_752587 ?auto_752600 ) ) ( not ( = ?auto_752587 ?auto_752601 ) ) ( not ( = ?auto_752588 ?auto_752589 ) ) ( not ( = ?auto_752588 ?auto_752590 ) ) ( not ( = ?auto_752588 ?auto_752591 ) ) ( not ( = ?auto_752588 ?auto_752592 ) ) ( not ( = ?auto_752588 ?auto_752593 ) ) ( not ( = ?auto_752588 ?auto_752594 ) ) ( not ( = ?auto_752588 ?auto_752595 ) ) ( not ( = ?auto_752588 ?auto_752596 ) ) ( not ( = ?auto_752588 ?auto_752597 ) ) ( not ( = ?auto_752588 ?auto_752598 ) ) ( not ( = ?auto_752588 ?auto_752599 ) ) ( not ( = ?auto_752588 ?auto_752600 ) ) ( not ( = ?auto_752588 ?auto_752601 ) ) ( not ( = ?auto_752589 ?auto_752590 ) ) ( not ( = ?auto_752589 ?auto_752591 ) ) ( not ( = ?auto_752589 ?auto_752592 ) ) ( not ( = ?auto_752589 ?auto_752593 ) ) ( not ( = ?auto_752589 ?auto_752594 ) ) ( not ( = ?auto_752589 ?auto_752595 ) ) ( not ( = ?auto_752589 ?auto_752596 ) ) ( not ( = ?auto_752589 ?auto_752597 ) ) ( not ( = ?auto_752589 ?auto_752598 ) ) ( not ( = ?auto_752589 ?auto_752599 ) ) ( not ( = ?auto_752589 ?auto_752600 ) ) ( not ( = ?auto_752589 ?auto_752601 ) ) ( not ( = ?auto_752590 ?auto_752591 ) ) ( not ( = ?auto_752590 ?auto_752592 ) ) ( not ( = ?auto_752590 ?auto_752593 ) ) ( not ( = ?auto_752590 ?auto_752594 ) ) ( not ( = ?auto_752590 ?auto_752595 ) ) ( not ( = ?auto_752590 ?auto_752596 ) ) ( not ( = ?auto_752590 ?auto_752597 ) ) ( not ( = ?auto_752590 ?auto_752598 ) ) ( not ( = ?auto_752590 ?auto_752599 ) ) ( not ( = ?auto_752590 ?auto_752600 ) ) ( not ( = ?auto_752590 ?auto_752601 ) ) ( not ( = ?auto_752591 ?auto_752592 ) ) ( not ( = ?auto_752591 ?auto_752593 ) ) ( not ( = ?auto_752591 ?auto_752594 ) ) ( not ( = ?auto_752591 ?auto_752595 ) ) ( not ( = ?auto_752591 ?auto_752596 ) ) ( not ( = ?auto_752591 ?auto_752597 ) ) ( not ( = ?auto_752591 ?auto_752598 ) ) ( not ( = ?auto_752591 ?auto_752599 ) ) ( not ( = ?auto_752591 ?auto_752600 ) ) ( not ( = ?auto_752591 ?auto_752601 ) ) ( not ( = ?auto_752592 ?auto_752593 ) ) ( not ( = ?auto_752592 ?auto_752594 ) ) ( not ( = ?auto_752592 ?auto_752595 ) ) ( not ( = ?auto_752592 ?auto_752596 ) ) ( not ( = ?auto_752592 ?auto_752597 ) ) ( not ( = ?auto_752592 ?auto_752598 ) ) ( not ( = ?auto_752592 ?auto_752599 ) ) ( not ( = ?auto_752592 ?auto_752600 ) ) ( not ( = ?auto_752592 ?auto_752601 ) ) ( not ( = ?auto_752593 ?auto_752594 ) ) ( not ( = ?auto_752593 ?auto_752595 ) ) ( not ( = ?auto_752593 ?auto_752596 ) ) ( not ( = ?auto_752593 ?auto_752597 ) ) ( not ( = ?auto_752593 ?auto_752598 ) ) ( not ( = ?auto_752593 ?auto_752599 ) ) ( not ( = ?auto_752593 ?auto_752600 ) ) ( not ( = ?auto_752593 ?auto_752601 ) ) ( not ( = ?auto_752594 ?auto_752595 ) ) ( not ( = ?auto_752594 ?auto_752596 ) ) ( not ( = ?auto_752594 ?auto_752597 ) ) ( not ( = ?auto_752594 ?auto_752598 ) ) ( not ( = ?auto_752594 ?auto_752599 ) ) ( not ( = ?auto_752594 ?auto_752600 ) ) ( not ( = ?auto_752594 ?auto_752601 ) ) ( not ( = ?auto_752595 ?auto_752596 ) ) ( not ( = ?auto_752595 ?auto_752597 ) ) ( not ( = ?auto_752595 ?auto_752598 ) ) ( not ( = ?auto_752595 ?auto_752599 ) ) ( not ( = ?auto_752595 ?auto_752600 ) ) ( not ( = ?auto_752595 ?auto_752601 ) ) ( not ( = ?auto_752596 ?auto_752597 ) ) ( not ( = ?auto_752596 ?auto_752598 ) ) ( not ( = ?auto_752596 ?auto_752599 ) ) ( not ( = ?auto_752596 ?auto_752600 ) ) ( not ( = ?auto_752596 ?auto_752601 ) ) ( not ( = ?auto_752597 ?auto_752598 ) ) ( not ( = ?auto_752597 ?auto_752599 ) ) ( not ( = ?auto_752597 ?auto_752600 ) ) ( not ( = ?auto_752597 ?auto_752601 ) ) ( not ( = ?auto_752598 ?auto_752599 ) ) ( not ( = ?auto_752598 ?auto_752600 ) ) ( not ( = ?auto_752598 ?auto_752601 ) ) ( not ( = ?auto_752599 ?auto_752600 ) ) ( not ( = ?auto_752599 ?auto_752601 ) ) ( not ( = ?auto_752600 ?auto_752601 ) ) ( ON ?auto_752599 ?auto_752600 ) ( ON ?auto_752598 ?auto_752599 ) ( ON ?auto_752597 ?auto_752598 ) ( ON ?auto_752596 ?auto_752597 ) ( ON ?auto_752595 ?auto_752596 ) ( ON ?auto_752594 ?auto_752595 ) ( ON ?auto_752593 ?auto_752594 ) ( ON ?auto_752592 ?auto_752593 ) ( ON ?auto_752591 ?auto_752592 ) ( ON ?auto_752590 ?auto_752591 ) ( CLEAR ?auto_752588 ) ( ON ?auto_752589 ?auto_752590 ) ( CLEAR ?auto_752589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_752587 ?auto_752588 ?auto_752589 )
      ( MAKE-14PILE ?auto_752587 ?auto_752588 ?auto_752589 ?auto_752590 ?auto_752591 ?auto_752592 ?auto_752593 ?auto_752594 ?auto_752595 ?auto_752596 ?auto_752597 ?auto_752598 ?auto_752599 ?auto_752600 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752645 - BLOCK
      ?auto_752646 - BLOCK
      ?auto_752647 - BLOCK
      ?auto_752648 - BLOCK
      ?auto_752649 - BLOCK
      ?auto_752650 - BLOCK
      ?auto_752651 - BLOCK
      ?auto_752652 - BLOCK
      ?auto_752653 - BLOCK
      ?auto_752654 - BLOCK
      ?auto_752655 - BLOCK
      ?auto_752656 - BLOCK
      ?auto_752657 - BLOCK
      ?auto_752658 - BLOCK
    )
    :vars
    (
      ?auto_752659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752658 ?auto_752659 ) ( ON-TABLE ?auto_752645 ) ( not ( = ?auto_752645 ?auto_752646 ) ) ( not ( = ?auto_752645 ?auto_752647 ) ) ( not ( = ?auto_752645 ?auto_752648 ) ) ( not ( = ?auto_752645 ?auto_752649 ) ) ( not ( = ?auto_752645 ?auto_752650 ) ) ( not ( = ?auto_752645 ?auto_752651 ) ) ( not ( = ?auto_752645 ?auto_752652 ) ) ( not ( = ?auto_752645 ?auto_752653 ) ) ( not ( = ?auto_752645 ?auto_752654 ) ) ( not ( = ?auto_752645 ?auto_752655 ) ) ( not ( = ?auto_752645 ?auto_752656 ) ) ( not ( = ?auto_752645 ?auto_752657 ) ) ( not ( = ?auto_752645 ?auto_752658 ) ) ( not ( = ?auto_752645 ?auto_752659 ) ) ( not ( = ?auto_752646 ?auto_752647 ) ) ( not ( = ?auto_752646 ?auto_752648 ) ) ( not ( = ?auto_752646 ?auto_752649 ) ) ( not ( = ?auto_752646 ?auto_752650 ) ) ( not ( = ?auto_752646 ?auto_752651 ) ) ( not ( = ?auto_752646 ?auto_752652 ) ) ( not ( = ?auto_752646 ?auto_752653 ) ) ( not ( = ?auto_752646 ?auto_752654 ) ) ( not ( = ?auto_752646 ?auto_752655 ) ) ( not ( = ?auto_752646 ?auto_752656 ) ) ( not ( = ?auto_752646 ?auto_752657 ) ) ( not ( = ?auto_752646 ?auto_752658 ) ) ( not ( = ?auto_752646 ?auto_752659 ) ) ( not ( = ?auto_752647 ?auto_752648 ) ) ( not ( = ?auto_752647 ?auto_752649 ) ) ( not ( = ?auto_752647 ?auto_752650 ) ) ( not ( = ?auto_752647 ?auto_752651 ) ) ( not ( = ?auto_752647 ?auto_752652 ) ) ( not ( = ?auto_752647 ?auto_752653 ) ) ( not ( = ?auto_752647 ?auto_752654 ) ) ( not ( = ?auto_752647 ?auto_752655 ) ) ( not ( = ?auto_752647 ?auto_752656 ) ) ( not ( = ?auto_752647 ?auto_752657 ) ) ( not ( = ?auto_752647 ?auto_752658 ) ) ( not ( = ?auto_752647 ?auto_752659 ) ) ( not ( = ?auto_752648 ?auto_752649 ) ) ( not ( = ?auto_752648 ?auto_752650 ) ) ( not ( = ?auto_752648 ?auto_752651 ) ) ( not ( = ?auto_752648 ?auto_752652 ) ) ( not ( = ?auto_752648 ?auto_752653 ) ) ( not ( = ?auto_752648 ?auto_752654 ) ) ( not ( = ?auto_752648 ?auto_752655 ) ) ( not ( = ?auto_752648 ?auto_752656 ) ) ( not ( = ?auto_752648 ?auto_752657 ) ) ( not ( = ?auto_752648 ?auto_752658 ) ) ( not ( = ?auto_752648 ?auto_752659 ) ) ( not ( = ?auto_752649 ?auto_752650 ) ) ( not ( = ?auto_752649 ?auto_752651 ) ) ( not ( = ?auto_752649 ?auto_752652 ) ) ( not ( = ?auto_752649 ?auto_752653 ) ) ( not ( = ?auto_752649 ?auto_752654 ) ) ( not ( = ?auto_752649 ?auto_752655 ) ) ( not ( = ?auto_752649 ?auto_752656 ) ) ( not ( = ?auto_752649 ?auto_752657 ) ) ( not ( = ?auto_752649 ?auto_752658 ) ) ( not ( = ?auto_752649 ?auto_752659 ) ) ( not ( = ?auto_752650 ?auto_752651 ) ) ( not ( = ?auto_752650 ?auto_752652 ) ) ( not ( = ?auto_752650 ?auto_752653 ) ) ( not ( = ?auto_752650 ?auto_752654 ) ) ( not ( = ?auto_752650 ?auto_752655 ) ) ( not ( = ?auto_752650 ?auto_752656 ) ) ( not ( = ?auto_752650 ?auto_752657 ) ) ( not ( = ?auto_752650 ?auto_752658 ) ) ( not ( = ?auto_752650 ?auto_752659 ) ) ( not ( = ?auto_752651 ?auto_752652 ) ) ( not ( = ?auto_752651 ?auto_752653 ) ) ( not ( = ?auto_752651 ?auto_752654 ) ) ( not ( = ?auto_752651 ?auto_752655 ) ) ( not ( = ?auto_752651 ?auto_752656 ) ) ( not ( = ?auto_752651 ?auto_752657 ) ) ( not ( = ?auto_752651 ?auto_752658 ) ) ( not ( = ?auto_752651 ?auto_752659 ) ) ( not ( = ?auto_752652 ?auto_752653 ) ) ( not ( = ?auto_752652 ?auto_752654 ) ) ( not ( = ?auto_752652 ?auto_752655 ) ) ( not ( = ?auto_752652 ?auto_752656 ) ) ( not ( = ?auto_752652 ?auto_752657 ) ) ( not ( = ?auto_752652 ?auto_752658 ) ) ( not ( = ?auto_752652 ?auto_752659 ) ) ( not ( = ?auto_752653 ?auto_752654 ) ) ( not ( = ?auto_752653 ?auto_752655 ) ) ( not ( = ?auto_752653 ?auto_752656 ) ) ( not ( = ?auto_752653 ?auto_752657 ) ) ( not ( = ?auto_752653 ?auto_752658 ) ) ( not ( = ?auto_752653 ?auto_752659 ) ) ( not ( = ?auto_752654 ?auto_752655 ) ) ( not ( = ?auto_752654 ?auto_752656 ) ) ( not ( = ?auto_752654 ?auto_752657 ) ) ( not ( = ?auto_752654 ?auto_752658 ) ) ( not ( = ?auto_752654 ?auto_752659 ) ) ( not ( = ?auto_752655 ?auto_752656 ) ) ( not ( = ?auto_752655 ?auto_752657 ) ) ( not ( = ?auto_752655 ?auto_752658 ) ) ( not ( = ?auto_752655 ?auto_752659 ) ) ( not ( = ?auto_752656 ?auto_752657 ) ) ( not ( = ?auto_752656 ?auto_752658 ) ) ( not ( = ?auto_752656 ?auto_752659 ) ) ( not ( = ?auto_752657 ?auto_752658 ) ) ( not ( = ?auto_752657 ?auto_752659 ) ) ( not ( = ?auto_752658 ?auto_752659 ) ) ( ON ?auto_752657 ?auto_752658 ) ( ON ?auto_752656 ?auto_752657 ) ( ON ?auto_752655 ?auto_752656 ) ( ON ?auto_752654 ?auto_752655 ) ( ON ?auto_752653 ?auto_752654 ) ( ON ?auto_752652 ?auto_752653 ) ( ON ?auto_752651 ?auto_752652 ) ( ON ?auto_752650 ?auto_752651 ) ( ON ?auto_752649 ?auto_752650 ) ( ON ?auto_752648 ?auto_752649 ) ( ON ?auto_752647 ?auto_752648 ) ( CLEAR ?auto_752645 ) ( ON ?auto_752646 ?auto_752647 ) ( CLEAR ?auto_752646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_752645 ?auto_752646 )
      ( MAKE-14PILE ?auto_752645 ?auto_752646 ?auto_752647 ?auto_752648 ?auto_752649 ?auto_752650 ?auto_752651 ?auto_752652 ?auto_752653 ?auto_752654 ?auto_752655 ?auto_752656 ?auto_752657 ?auto_752658 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_752703 - BLOCK
      ?auto_752704 - BLOCK
      ?auto_752705 - BLOCK
      ?auto_752706 - BLOCK
      ?auto_752707 - BLOCK
      ?auto_752708 - BLOCK
      ?auto_752709 - BLOCK
      ?auto_752710 - BLOCK
      ?auto_752711 - BLOCK
      ?auto_752712 - BLOCK
      ?auto_752713 - BLOCK
      ?auto_752714 - BLOCK
      ?auto_752715 - BLOCK
      ?auto_752716 - BLOCK
    )
    :vars
    (
      ?auto_752717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752716 ?auto_752717 ) ( not ( = ?auto_752703 ?auto_752704 ) ) ( not ( = ?auto_752703 ?auto_752705 ) ) ( not ( = ?auto_752703 ?auto_752706 ) ) ( not ( = ?auto_752703 ?auto_752707 ) ) ( not ( = ?auto_752703 ?auto_752708 ) ) ( not ( = ?auto_752703 ?auto_752709 ) ) ( not ( = ?auto_752703 ?auto_752710 ) ) ( not ( = ?auto_752703 ?auto_752711 ) ) ( not ( = ?auto_752703 ?auto_752712 ) ) ( not ( = ?auto_752703 ?auto_752713 ) ) ( not ( = ?auto_752703 ?auto_752714 ) ) ( not ( = ?auto_752703 ?auto_752715 ) ) ( not ( = ?auto_752703 ?auto_752716 ) ) ( not ( = ?auto_752703 ?auto_752717 ) ) ( not ( = ?auto_752704 ?auto_752705 ) ) ( not ( = ?auto_752704 ?auto_752706 ) ) ( not ( = ?auto_752704 ?auto_752707 ) ) ( not ( = ?auto_752704 ?auto_752708 ) ) ( not ( = ?auto_752704 ?auto_752709 ) ) ( not ( = ?auto_752704 ?auto_752710 ) ) ( not ( = ?auto_752704 ?auto_752711 ) ) ( not ( = ?auto_752704 ?auto_752712 ) ) ( not ( = ?auto_752704 ?auto_752713 ) ) ( not ( = ?auto_752704 ?auto_752714 ) ) ( not ( = ?auto_752704 ?auto_752715 ) ) ( not ( = ?auto_752704 ?auto_752716 ) ) ( not ( = ?auto_752704 ?auto_752717 ) ) ( not ( = ?auto_752705 ?auto_752706 ) ) ( not ( = ?auto_752705 ?auto_752707 ) ) ( not ( = ?auto_752705 ?auto_752708 ) ) ( not ( = ?auto_752705 ?auto_752709 ) ) ( not ( = ?auto_752705 ?auto_752710 ) ) ( not ( = ?auto_752705 ?auto_752711 ) ) ( not ( = ?auto_752705 ?auto_752712 ) ) ( not ( = ?auto_752705 ?auto_752713 ) ) ( not ( = ?auto_752705 ?auto_752714 ) ) ( not ( = ?auto_752705 ?auto_752715 ) ) ( not ( = ?auto_752705 ?auto_752716 ) ) ( not ( = ?auto_752705 ?auto_752717 ) ) ( not ( = ?auto_752706 ?auto_752707 ) ) ( not ( = ?auto_752706 ?auto_752708 ) ) ( not ( = ?auto_752706 ?auto_752709 ) ) ( not ( = ?auto_752706 ?auto_752710 ) ) ( not ( = ?auto_752706 ?auto_752711 ) ) ( not ( = ?auto_752706 ?auto_752712 ) ) ( not ( = ?auto_752706 ?auto_752713 ) ) ( not ( = ?auto_752706 ?auto_752714 ) ) ( not ( = ?auto_752706 ?auto_752715 ) ) ( not ( = ?auto_752706 ?auto_752716 ) ) ( not ( = ?auto_752706 ?auto_752717 ) ) ( not ( = ?auto_752707 ?auto_752708 ) ) ( not ( = ?auto_752707 ?auto_752709 ) ) ( not ( = ?auto_752707 ?auto_752710 ) ) ( not ( = ?auto_752707 ?auto_752711 ) ) ( not ( = ?auto_752707 ?auto_752712 ) ) ( not ( = ?auto_752707 ?auto_752713 ) ) ( not ( = ?auto_752707 ?auto_752714 ) ) ( not ( = ?auto_752707 ?auto_752715 ) ) ( not ( = ?auto_752707 ?auto_752716 ) ) ( not ( = ?auto_752707 ?auto_752717 ) ) ( not ( = ?auto_752708 ?auto_752709 ) ) ( not ( = ?auto_752708 ?auto_752710 ) ) ( not ( = ?auto_752708 ?auto_752711 ) ) ( not ( = ?auto_752708 ?auto_752712 ) ) ( not ( = ?auto_752708 ?auto_752713 ) ) ( not ( = ?auto_752708 ?auto_752714 ) ) ( not ( = ?auto_752708 ?auto_752715 ) ) ( not ( = ?auto_752708 ?auto_752716 ) ) ( not ( = ?auto_752708 ?auto_752717 ) ) ( not ( = ?auto_752709 ?auto_752710 ) ) ( not ( = ?auto_752709 ?auto_752711 ) ) ( not ( = ?auto_752709 ?auto_752712 ) ) ( not ( = ?auto_752709 ?auto_752713 ) ) ( not ( = ?auto_752709 ?auto_752714 ) ) ( not ( = ?auto_752709 ?auto_752715 ) ) ( not ( = ?auto_752709 ?auto_752716 ) ) ( not ( = ?auto_752709 ?auto_752717 ) ) ( not ( = ?auto_752710 ?auto_752711 ) ) ( not ( = ?auto_752710 ?auto_752712 ) ) ( not ( = ?auto_752710 ?auto_752713 ) ) ( not ( = ?auto_752710 ?auto_752714 ) ) ( not ( = ?auto_752710 ?auto_752715 ) ) ( not ( = ?auto_752710 ?auto_752716 ) ) ( not ( = ?auto_752710 ?auto_752717 ) ) ( not ( = ?auto_752711 ?auto_752712 ) ) ( not ( = ?auto_752711 ?auto_752713 ) ) ( not ( = ?auto_752711 ?auto_752714 ) ) ( not ( = ?auto_752711 ?auto_752715 ) ) ( not ( = ?auto_752711 ?auto_752716 ) ) ( not ( = ?auto_752711 ?auto_752717 ) ) ( not ( = ?auto_752712 ?auto_752713 ) ) ( not ( = ?auto_752712 ?auto_752714 ) ) ( not ( = ?auto_752712 ?auto_752715 ) ) ( not ( = ?auto_752712 ?auto_752716 ) ) ( not ( = ?auto_752712 ?auto_752717 ) ) ( not ( = ?auto_752713 ?auto_752714 ) ) ( not ( = ?auto_752713 ?auto_752715 ) ) ( not ( = ?auto_752713 ?auto_752716 ) ) ( not ( = ?auto_752713 ?auto_752717 ) ) ( not ( = ?auto_752714 ?auto_752715 ) ) ( not ( = ?auto_752714 ?auto_752716 ) ) ( not ( = ?auto_752714 ?auto_752717 ) ) ( not ( = ?auto_752715 ?auto_752716 ) ) ( not ( = ?auto_752715 ?auto_752717 ) ) ( not ( = ?auto_752716 ?auto_752717 ) ) ( ON ?auto_752715 ?auto_752716 ) ( ON ?auto_752714 ?auto_752715 ) ( ON ?auto_752713 ?auto_752714 ) ( ON ?auto_752712 ?auto_752713 ) ( ON ?auto_752711 ?auto_752712 ) ( ON ?auto_752710 ?auto_752711 ) ( ON ?auto_752709 ?auto_752710 ) ( ON ?auto_752708 ?auto_752709 ) ( ON ?auto_752707 ?auto_752708 ) ( ON ?auto_752706 ?auto_752707 ) ( ON ?auto_752705 ?auto_752706 ) ( ON ?auto_752704 ?auto_752705 ) ( ON ?auto_752703 ?auto_752704 ) ( CLEAR ?auto_752703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_752703 )
      ( MAKE-14PILE ?auto_752703 ?auto_752704 ?auto_752705 ?auto_752706 ?auto_752707 ?auto_752708 ?auto_752709 ?auto_752710 ?auto_752711 ?auto_752712 ?auto_752713 ?auto_752714 ?auto_752715 ?auto_752716 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_752762 - BLOCK
      ?auto_752763 - BLOCK
      ?auto_752764 - BLOCK
      ?auto_752765 - BLOCK
      ?auto_752766 - BLOCK
      ?auto_752767 - BLOCK
      ?auto_752768 - BLOCK
      ?auto_752769 - BLOCK
      ?auto_752770 - BLOCK
      ?auto_752771 - BLOCK
      ?auto_752772 - BLOCK
      ?auto_752773 - BLOCK
      ?auto_752774 - BLOCK
      ?auto_752775 - BLOCK
      ?auto_752776 - BLOCK
    )
    :vars
    (
      ?auto_752777 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_752775 ) ( ON ?auto_752776 ?auto_752777 ) ( CLEAR ?auto_752776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_752762 ) ( ON ?auto_752763 ?auto_752762 ) ( ON ?auto_752764 ?auto_752763 ) ( ON ?auto_752765 ?auto_752764 ) ( ON ?auto_752766 ?auto_752765 ) ( ON ?auto_752767 ?auto_752766 ) ( ON ?auto_752768 ?auto_752767 ) ( ON ?auto_752769 ?auto_752768 ) ( ON ?auto_752770 ?auto_752769 ) ( ON ?auto_752771 ?auto_752770 ) ( ON ?auto_752772 ?auto_752771 ) ( ON ?auto_752773 ?auto_752772 ) ( ON ?auto_752774 ?auto_752773 ) ( ON ?auto_752775 ?auto_752774 ) ( not ( = ?auto_752762 ?auto_752763 ) ) ( not ( = ?auto_752762 ?auto_752764 ) ) ( not ( = ?auto_752762 ?auto_752765 ) ) ( not ( = ?auto_752762 ?auto_752766 ) ) ( not ( = ?auto_752762 ?auto_752767 ) ) ( not ( = ?auto_752762 ?auto_752768 ) ) ( not ( = ?auto_752762 ?auto_752769 ) ) ( not ( = ?auto_752762 ?auto_752770 ) ) ( not ( = ?auto_752762 ?auto_752771 ) ) ( not ( = ?auto_752762 ?auto_752772 ) ) ( not ( = ?auto_752762 ?auto_752773 ) ) ( not ( = ?auto_752762 ?auto_752774 ) ) ( not ( = ?auto_752762 ?auto_752775 ) ) ( not ( = ?auto_752762 ?auto_752776 ) ) ( not ( = ?auto_752762 ?auto_752777 ) ) ( not ( = ?auto_752763 ?auto_752764 ) ) ( not ( = ?auto_752763 ?auto_752765 ) ) ( not ( = ?auto_752763 ?auto_752766 ) ) ( not ( = ?auto_752763 ?auto_752767 ) ) ( not ( = ?auto_752763 ?auto_752768 ) ) ( not ( = ?auto_752763 ?auto_752769 ) ) ( not ( = ?auto_752763 ?auto_752770 ) ) ( not ( = ?auto_752763 ?auto_752771 ) ) ( not ( = ?auto_752763 ?auto_752772 ) ) ( not ( = ?auto_752763 ?auto_752773 ) ) ( not ( = ?auto_752763 ?auto_752774 ) ) ( not ( = ?auto_752763 ?auto_752775 ) ) ( not ( = ?auto_752763 ?auto_752776 ) ) ( not ( = ?auto_752763 ?auto_752777 ) ) ( not ( = ?auto_752764 ?auto_752765 ) ) ( not ( = ?auto_752764 ?auto_752766 ) ) ( not ( = ?auto_752764 ?auto_752767 ) ) ( not ( = ?auto_752764 ?auto_752768 ) ) ( not ( = ?auto_752764 ?auto_752769 ) ) ( not ( = ?auto_752764 ?auto_752770 ) ) ( not ( = ?auto_752764 ?auto_752771 ) ) ( not ( = ?auto_752764 ?auto_752772 ) ) ( not ( = ?auto_752764 ?auto_752773 ) ) ( not ( = ?auto_752764 ?auto_752774 ) ) ( not ( = ?auto_752764 ?auto_752775 ) ) ( not ( = ?auto_752764 ?auto_752776 ) ) ( not ( = ?auto_752764 ?auto_752777 ) ) ( not ( = ?auto_752765 ?auto_752766 ) ) ( not ( = ?auto_752765 ?auto_752767 ) ) ( not ( = ?auto_752765 ?auto_752768 ) ) ( not ( = ?auto_752765 ?auto_752769 ) ) ( not ( = ?auto_752765 ?auto_752770 ) ) ( not ( = ?auto_752765 ?auto_752771 ) ) ( not ( = ?auto_752765 ?auto_752772 ) ) ( not ( = ?auto_752765 ?auto_752773 ) ) ( not ( = ?auto_752765 ?auto_752774 ) ) ( not ( = ?auto_752765 ?auto_752775 ) ) ( not ( = ?auto_752765 ?auto_752776 ) ) ( not ( = ?auto_752765 ?auto_752777 ) ) ( not ( = ?auto_752766 ?auto_752767 ) ) ( not ( = ?auto_752766 ?auto_752768 ) ) ( not ( = ?auto_752766 ?auto_752769 ) ) ( not ( = ?auto_752766 ?auto_752770 ) ) ( not ( = ?auto_752766 ?auto_752771 ) ) ( not ( = ?auto_752766 ?auto_752772 ) ) ( not ( = ?auto_752766 ?auto_752773 ) ) ( not ( = ?auto_752766 ?auto_752774 ) ) ( not ( = ?auto_752766 ?auto_752775 ) ) ( not ( = ?auto_752766 ?auto_752776 ) ) ( not ( = ?auto_752766 ?auto_752777 ) ) ( not ( = ?auto_752767 ?auto_752768 ) ) ( not ( = ?auto_752767 ?auto_752769 ) ) ( not ( = ?auto_752767 ?auto_752770 ) ) ( not ( = ?auto_752767 ?auto_752771 ) ) ( not ( = ?auto_752767 ?auto_752772 ) ) ( not ( = ?auto_752767 ?auto_752773 ) ) ( not ( = ?auto_752767 ?auto_752774 ) ) ( not ( = ?auto_752767 ?auto_752775 ) ) ( not ( = ?auto_752767 ?auto_752776 ) ) ( not ( = ?auto_752767 ?auto_752777 ) ) ( not ( = ?auto_752768 ?auto_752769 ) ) ( not ( = ?auto_752768 ?auto_752770 ) ) ( not ( = ?auto_752768 ?auto_752771 ) ) ( not ( = ?auto_752768 ?auto_752772 ) ) ( not ( = ?auto_752768 ?auto_752773 ) ) ( not ( = ?auto_752768 ?auto_752774 ) ) ( not ( = ?auto_752768 ?auto_752775 ) ) ( not ( = ?auto_752768 ?auto_752776 ) ) ( not ( = ?auto_752768 ?auto_752777 ) ) ( not ( = ?auto_752769 ?auto_752770 ) ) ( not ( = ?auto_752769 ?auto_752771 ) ) ( not ( = ?auto_752769 ?auto_752772 ) ) ( not ( = ?auto_752769 ?auto_752773 ) ) ( not ( = ?auto_752769 ?auto_752774 ) ) ( not ( = ?auto_752769 ?auto_752775 ) ) ( not ( = ?auto_752769 ?auto_752776 ) ) ( not ( = ?auto_752769 ?auto_752777 ) ) ( not ( = ?auto_752770 ?auto_752771 ) ) ( not ( = ?auto_752770 ?auto_752772 ) ) ( not ( = ?auto_752770 ?auto_752773 ) ) ( not ( = ?auto_752770 ?auto_752774 ) ) ( not ( = ?auto_752770 ?auto_752775 ) ) ( not ( = ?auto_752770 ?auto_752776 ) ) ( not ( = ?auto_752770 ?auto_752777 ) ) ( not ( = ?auto_752771 ?auto_752772 ) ) ( not ( = ?auto_752771 ?auto_752773 ) ) ( not ( = ?auto_752771 ?auto_752774 ) ) ( not ( = ?auto_752771 ?auto_752775 ) ) ( not ( = ?auto_752771 ?auto_752776 ) ) ( not ( = ?auto_752771 ?auto_752777 ) ) ( not ( = ?auto_752772 ?auto_752773 ) ) ( not ( = ?auto_752772 ?auto_752774 ) ) ( not ( = ?auto_752772 ?auto_752775 ) ) ( not ( = ?auto_752772 ?auto_752776 ) ) ( not ( = ?auto_752772 ?auto_752777 ) ) ( not ( = ?auto_752773 ?auto_752774 ) ) ( not ( = ?auto_752773 ?auto_752775 ) ) ( not ( = ?auto_752773 ?auto_752776 ) ) ( not ( = ?auto_752773 ?auto_752777 ) ) ( not ( = ?auto_752774 ?auto_752775 ) ) ( not ( = ?auto_752774 ?auto_752776 ) ) ( not ( = ?auto_752774 ?auto_752777 ) ) ( not ( = ?auto_752775 ?auto_752776 ) ) ( not ( = ?auto_752775 ?auto_752777 ) ) ( not ( = ?auto_752776 ?auto_752777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_752776 ?auto_752777 )
      ( !STACK ?auto_752776 ?auto_752775 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_752824 - BLOCK
      ?auto_752825 - BLOCK
      ?auto_752826 - BLOCK
      ?auto_752827 - BLOCK
      ?auto_752828 - BLOCK
      ?auto_752829 - BLOCK
      ?auto_752830 - BLOCK
      ?auto_752831 - BLOCK
      ?auto_752832 - BLOCK
      ?auto_752833 - BLOCK
      ?auto_752834 - BLOCK
      ?auto_752835 - BLOCK
      ?auto_752836 - BLOCK
      ?auto_752837 - BLOCK
      ?auto_752838 - BLOCK
    )
    :vars
    (
      ?auto_752839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752838 ?auto_752839 ) ( ON-TABLE ?auto_752824 ) ( ON ?auto_752825 ?auto_752824 ) ( ON ?auto_752826 ?auto_752825 ) ( ON ?auto_752827 ?auto_752826 ) ( ON ?auto_752828 ?auto_752827 ) ( ON ?auto_752829 ?auto_752828 ) ( ON ?auto_752830 ?auto_752829 ) ( ON ?auto_752831 ?auto_752830 ) ( ON ?auto_752832 ?auto_752831 ) ( ON ?auto_752833 ?auto_752832 ) ( ON ?auto_752834 ?auto_752833 ) ( ON ?auto_752835 ?auto_752834 ) ( ON ?auto_752836 ?auto_752835 ) ( not ( = ?auto_752824 ?auto_752825 ) ) ( not ( = ?auto_752824 ?auto_752826 ) ) ( not ( = ?auto_752824 ?auto_752827 ) ) ( not ( = ?auto_752824 ?auto_752828 ) ) ( not ( = ?auto_752824 ?auto_752829 ) ) ( not ( = ?auto_752824 ?auto_752830 ) ) ( not ( = ?auto_752824 ?auto_752831 ) ) ( not ( = ?auto_752824 ?auto_752832 ) ) ( not ( = ?auto_752824 ?auto_752833 ) ) ( not ( = ?auto_752824 ?auto_752834 ) ) ( not ( = ?auto_752824 ?auto_752835 ) ) ( not ( = ?auto_752824 ?auto_752836 ) ) ( not ( = ?auto_752824 ?auto_752837 ) ) ( not ( = ?auto_752824 ?auto_752838 ) ) ( not ( = ?auto_752824 ?auto_752839 ) ) ( not ( = ?auto_752825 ?auto_752826 ) ) ( not ( = ?auto_752825 ?auto_752827 ) ) ( not ( = ?auto_752825 ?auto_752828 ) ) ( not ( = ?auto_752825 ?auto_752829 ) ) ( not ( = ?auto_752825 ?auto_752830 ) ) ( not ( = ?auto_752825 ?auto_752831 ) ) ( not ( = ?auto_752825 ?auto_752832 ) ) ( not ( = ?auto_752825 ?auto_752833 ) ) ( not ( = ?auto_752825 ?auto_752834 ) ) ( not ( = ?auto_752825 ?auto_752835 ) ) ( not ( = ?auto_752825 ?auto_752836 ) ) ( not ( = ?auto_752825 ?auto_752837 ) ) ( not ( = ?auto_752825 ?auto_752838 ) ) ( not ( = ?auto_752825 ?auto_752839 ) ) ( not ( = ?auto_752826 ?auto_752827 ) ) ( not ( = ?auto_752826 ?auto_752828 ) ) ( not ( = ?auto_752826 ?auto_752829 ) ) ( not ( = ?auto_752826 ?auto_752830 ) ) ( not ( = ?auto_752826 ?auto_752831 ) ) ( not ( = ?auto_752826 ?auto_752832 ) ) ( not ( = ?auto_752826 ?auto_752833 ) ) ( not ( = ?auto_752826 ?auto_752834 ) ) ( not ( = ?auto_752826 ?auto_752835 ) ) ( not ( = ?auto_752826 ?auto_752836 ) ) ( not ( = ?auto_752826 ?auto_752837 ) ) ( not ( = ?auto_752826 ?auto_752838 ) ) ( not ( = ?auto_752826 ?auto_752839 ) ) ( not ( = ?auto_752827 ?auto_752828 ) ) ( not ( = ?auto_752827 ?auto_752829 ) ) ( not ( = ?auto_752827 ?auto_752830 ) ) ( not ( = ?auto_752827 ?auto_752831 ) ) ( not ( = ?auto_752827 ?auto_752832 ) ) ( not ( = ?auto_752827 ?auto_752833 ) ) ( not ( = ?auto_752827 ?auto_752834 ) ) ( not ( = ?auto_752827 ?auto_752835 ) ) ( not ( = ?auto_752827 ?auto_752836 ) ) ( not ( = ?auto_752827 ?auto_752837 ) ) ( not ( = ?auto_752827 ?auto_752838 ) ) ( not ( = ?auto_752827 ?auto_752839 ) ) ( not ( = ?auto_752828 ?auto_752829 ) ) ( not ( = ?auto_752828 ?auto_752830 ) ) ( not ( = ?auto_752828 ?auto_752831 ) ) ( not ( = ?auto_752828 ?auto_752832 ) ) ( not ( = ?auto_752828 ?auto_752833 ) ) ( not ( = ?auto_752828 ?auto_752834 ) ) ( not ( = ?auto_752828 ?auto_752835 ) ) ( not ( = ?auto_752828 ?auto_752836 ) ) ( not ( = ?auto_752828 ?auto_752837 ) ) ( not ( = ?auto_752828 ?auto_752838 ) ) ( not ( = ?auto_752828 ?auto_752839 ) ) ( not ( = ?auto_752829 ?auto_752830 ) ) ( not ( = ?auto_752829 ?auto_752831 ) ) ( not ( = ?auto_752829 ?auto_752832 ) ) ( not ( = ?auto_752829 ?auto_752833 ) ) ( not ( = ?auto_752829 ?auto_752834 ) ) ( not ( = ?auto_752829 ?auto_752835 ) ) ( not ( = ?auto_752829 ?auto_752836 ) ) ( not ( = ?auto_752829 ?auto_752837 ) ) ( not ( = ?auto_752829 ?auto_752838 ) ) ( not ( = ?auto_752829 ?auto_752839 ) ) ( not ( = ?auto_752830 ?auto_752831 ) ) ( not ( = ?auto_752830 ?auto_752832 ) ) ( not ( = ?auto_752830 ?auto_752833 ) ) ( not ( = ?auto_752830 ?auto_752834 ) ) ( not ( = ?auto_752830 ?auto_752835 ) ) ( not ( = ?auto_752830 ?auto_752836 ) ) ( not ( = ?auto_752830 ?auto_752837 ) ) ( not ( = ?auto_752830 ?auto_752838 ) ) ( not ( = ?auto_752830 ?auto_752839 ) ) ( not ( = ?auto_752831 ?auto_752832 ) ) ( not ( = ?auto_752831 ?auto_752833 ) ) ( not ( = ?auto_752831 ?auto_752834 ) ) ( not ( = ?auto_752831 ?auto_752835 ) ) ( not ( = ?auto_752831 ?auto_752836 ) ) ( not ( = ?auto_752831 ?auto_752837 ) ) ( not ( = ?auto_752831 ?auto_752838 ) ) ( not ( = ?auto_752831 ?auto_752839 ) ) ( not ( = ?auto_752832 ?auto_752833 ) ) ( not ( = ?auto_752832 ?auto_752834 ) ) ( not ( = ?auto_752832 ?auto_752835 ) ) ( not ( = ?auto_752832 ?auto_752836 ) ) ( not ( = ?auto_752832 ?auto_752837 ) ) ( not ( = ?auto_752832 ?auto_752838 ) ) ( not ( = ?auto_752832 ?auto_752839 ) ) ( not ( = ?auto_752833 ?auto_752834 ) ) ( not ( = ?auto_752833 ?auto_752835 ) ) ( not ( = ?auto_752833 ?auto_752836 ) ) ( not ( = ?auto_752833 ?auto_752837 ) ) ( not ( = ?auto_752833 ?auto_752838 ) ) ( not ( = ?auto_752833 ?auto_752839 ) ) ( not ( = ?auto_752834 ?auto_752835 ) ) ( not ( = ?auto_752834 ?auto_752836 ) ) ( not ( = ?auto_752834 ?auto_752837 ) ) ( not ( = ?auto_752834 ?auto_752838 ) ) ( not ( = ?auto_752834 ?auto_752839 ) ) ( not ( = ?auto_752835 ?auto_752836 ) ) ( not ( = ?auto_752835 ?auto_752837 ) ) ( not ( = ?auto_752835 ?auto_752838 ) ) ( not ( = ?auto_752835 ?auto_752839 ) ) ( not ( = ?auto_752836 ?auto_752837 ) ) ( not ( = ?auto_752836 ?auto_752838 ) ) ( not ( = ?auto_752836 ?auto_752839 ) ) ( not ( = ?auto_752837 ?auto_752838 ) ) ( not ( = ?auto_752837 ?auto_752839 ) ) ( not ( = ?auto_752838 ?auto_752839 ) ) ( CLEAR ?auto_752836 ) ( ON ?auto_752837 ?auto_752838 ) ( CLEAR ?auto_752837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_752824 ?auto_752825 ?auto_752826 ?auto_752827 ?auto_752828 ?auto_752829 ?auto_752830 ?auto_752831 ?auto_752832 ?auto_752833 ?auto_752834 ?auto_752835 ?auto_752836 ?auto_752837 )
      ( MAKE-15PILE ?auto_752824 ?auto_752825 ?auto_752826 ?auto_752827 ?auto_752828 ?auto_752829 ?auto_752830 ?auto_752831 ?auto_752832 ?auto_752833 ?auto_752834 ?auto_752835 ?auto_752836 ?auto_752837 ?auto_752838 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_752886 - BLOCK
      ?auto_752887 - BLOCK
      ?auto_752888 - BLOCK
      ?auto_752889 - BLOCK
      ?auto_752890 - BLOCK
      ?auto_752891 - BLOCK
      ?auto_752892 - BLOCK
      ?auto_752893 - BLOCK
      ?auto_752894 - BLOCK
      ?auto_752895 - BLOCK
      ?auto_752896 - BLOCK
      ?auto_752897 - BLOCK
      ?auto_752898 - BLOCK
      ?auto_752899 - BLOCK
      ?auto_752900 - BLOCK
    )
    :vars
    (
      ?auto_752901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752900 ?auto_752901 ) ( ON-TABLE ?auto_752886 ) ( ON ?auto_752887 ?auto_752886 ) ( ON ?auto_752888 ?auto_752887 ) ( ON ?auto_752889 ?auto_752888 ) ( ON ?auto_752890 ?auto_752889 ) ( ON ?auto_752891 ?auto_752890 ) ( ON ?auto_752892 ?auto_752891 ) ( ON ?auto_752893 ?auto_752892 ) ( ON ?auto_752894 ?auto_752893 ) ( ON ?auto_752895 ?auto_752894 ) ( ON ?auto_752896 ?auto_752895 ) ( ON ?auto_752897 ?auto_752896 ) ( not ( = ?auto_752886 ?auto_752887 ) ) ( not ( = ?auto_752886 ?auto_752888 ) ) ( not ( = ?auto_752886 ?auto_752889 ) ) ( not ( = ?auto_752886 ?auto_752890 ) ) ( not ( = ?auto_752886 ?auto_752891 ) ) ( not ( = ?auto_752886 ?auto_752892 ) ) ( not ( = ?auto_752886 ?auto_752893 ) ) ( not ( = ?auto_752886 ?auto_752894 ) ) ( not ( = ?auto_752886 ?auto_752895 ) ) ( not ( = ?auto_752886 ?auto_752896 ) ) ( not ( = ?auto_752886 ?auto_752897 ) ) ( not ( = ?auto_752886 ?auto_752898 ) ) ( not ( = ?auto_752886 ?auto_752899 ) ) ( not ( = ?auto_752886 ?auto_752900 ) ) ( not ( = ?auto_752886 ?auto_752901 ) ) ( not ( = ?auto_752887 ?auto_752888 ) ) ( not ( = ?auto_752887 ?auto_752889 ) ) ( not ( = ?auto_752887 ?auto_752890 ) ) ( not ( = ?auto_752887 ?auto_752891 ) ) ( not ( = ?auto_752887 ?auto_752892 ) ) ( not ( = ?auto_752887 ?auto_752893 ) ) ( not ( = ?auto_752887 ?auto_752894 ) ) ( not ( = ?auto_752887 ?auto_752895 ) ) ( not ( = ?auto_752887 ?auto_752896 ) ) ( not ( = ?auto_752887 ?auto_752897 ) ) ( not ( = ?auto_752887 ?auto_752898 ) ) ( not ( = ?auto_752887 ?auto_752899 ) ) ( not ( = ?auto_752887 ?auto_752900 ) ) ( not ( = ?auto_752887 ?auto_752901 ) ) ( not ( = ?auto_752888 ?auto_752889 ) ) ( not ( = ?auto_752888 ?auto_752890 ) ) ( not ( = ?auto_752888 ?auto_752891 ) ) ( not ( = ?auto_752888 ?auto_752892 ) ) ( not ( = ?auto_752888 ?auto_752893 ) ) ( not ( = ?auto_752888 ?auto_752894 ) ) ( not ( = ?auto_752888 ?auto_752895 ) ) ( not ( = ?auto_752888 ?auto_752896 ) ) ( not ( = ?auto_752888 ?auto_752897 ) ) ( not ( = ?auto_752888 ?auto_752898 ) ) ( not ( = ?auto_752888 ?auto_752899 ) ) ( not ( = ?auto_752888 ?auto_752900 ) ) ( not ( = ?auto_752888 ?auto_752901 ) ) ( not ( = ?auto_752889 ?auto_752890 ) ) ( not ( = ?auto_752889 ?auto_752891 ) ) ( not ( = ?auto_752889 ?auto_752892 ) ) ( not ( = ?auto_752889 ?auto_752893 ) ) ( not ( = ?auto_752889 ?auto_752894 ) ) ( not ( = ?auto_752889 ?auto_752895 ) ) ( not ( = ?auto_752889 ?auto_752896 ) ) ( not ( = ?auto_752889 ?auto_752897 ) ) ( not ( = ?auto_752889 ?auto_752898 ) ) ( not ( = ?auto_752889 ?auto_752899 ) ) ( not ( = ?auto_752889 ?auto_752900 ) ) ( not ( = ?auto_752889 ?auto_752901 ) ) ( not ( = ?auto_752890 ?auto_752891 ) ) ( not ( = ?auto_752890 ?auto_752892 ) ) ( not ( = ?auto_752890 ?auto_752893 ) ) ( not ( = ?auto_752890 ?auto_752894 ) ) ( not ( = ?auto_752890 ?auto_752895 ) ) ( not ( = ?auto_752890 ?auto_752896 ) ) ( not ( = ?auto_752890 ?auto_752897 ) ) ( not ( = ?auto_752890 ?auto_752898 ) ) ( not ( = ?auto_752890 ?auto_752899 ) ) ( not ( = ?auto_752890 ?auto_752900 ) ) ( not ( = ?auto_752890 ?auto_752901 ) ) ( not ( = ?auto_752891 ?auto_752892 ) ) ( not ( = ?auto_752891 ?auto_752893 ) ) ( not ( = ?auto_752891 ?auto_752894 ) ) ( not ( = ?auto_752891 ?auto_752895 ) ) ( not ( = ?auto_752891 ?auto_752896 ) ) ( not ( = ?auto_752891 ?auto_752897 ) ) ( not ( = ?auto_752891 ?auto_752898 ) ) ( not ( = ?auto_752891 ?auto_752899 ) ) ( not ( = ?auto_752891 ?auto_752900 ) ) ( not ( = ?auto_752891 ?auto_752901 ) ) ( not ( = ?auto_752892 ?auto_752893 ) ) ( not ( = ?auto_752892 ?auto_752894 ) ) ( not ( = ?auto_752892 ?auto_752895 ) ) ( not ( = ?auto_752892 ?auto_752896 ) ) ( not ( = ?auto_752892 ?auto_752897 ) ) ( not ( = ?auto_752892 ?auto_752898 ) ) ( not ( = ?auto_752892 ?auto_752899 ) ) ( not ( = ?auto_752892 ?auto_752900 ) ) ( not ( = ?auto_752892 ?auto_752901 ) ) ( not ( = ?auto_752893 ?auto_752894 ) ) ( not ( = ?auto_752893 ?auto_752895 ) ) ( not ( = ?auto_752893 ?auto_752896 ) ) ( not ( = ?auto_752893 ?auto_752897 ) ) ( not ( = ?auto_752893 ?auto_752898 ) ) ( not ( = ?auto_752893 ?auto_752899 ) ) ( not ( = ?auto_752893 ?auto_752900 ) ) ( not ( = ?auto_752893 ?auto_752901 ) ) ( not ( = ?auto_752894 ?auto_752895 ) ) ( not ( = ?auto_752894 ?auto_752896 ) ) ( not ( = ?auto_752894 ?auto_752897 ) ) ( not ( = ?auto_752894 ?auto_752898 ) ) ( not ( = ?auto_752894 ?auto_752899 ) ) ( not ( = ?auto_752894 ?auto_752900 ) ) ( not ( = ?auto_752894 ?auto_752901 ) ) ( not ( = ?auto_752895 ?auto_752896 ) ) ( not ( = ?auto_752895 ?auto_752897 ) ) ( not ( = ?auto_752895 ?auto_752898 ) ) ( not ( = ?auto_752895 ?auto_752899 ) ) ( not ( = ?auto_752895 ?auto_752900 ) ) ( not ( = ?auto_752895 ?auto_752901 ) ) ( not ( = ?auto_752896 ?auto_752897 ) ) ( not ( = ?auto_752896 ?auto_752898 ) ) ( not ( = ?auto_752896 ?auto_752899 ) ) ( not ( = ?auto_752896 ?auto_752900 ) ) ( not ( = ?auto_752896 ?auto_752901 ) ) ( not ( = ?auto_752897 ?auto_752898 ) ) ( not ( = ?auto_752897 ?auto_752899 ) ) ( not ( = ?auto_752897 ?auto_752900 ) ) ( not ( = ?auto_752897 ?auto_752901 ) ) ( not ( = ?auto_752898 ?auto_752899 ) ) ( not ( = ?auto_752898 ?auto_752900 ) ) ( not ( = ?auto_752898 ?auto_752901 ) ) ( not ( = ?auto_752899 ?auto_752900 ) ) ( not ( = ?auto_752899 ?auto_752901 ) ) ( not ( = ?auto_752900 ?auto_752901 ) ) ( ON ?auto_752899 ?auto_752900 ) ( CLEAR ?auto_752897 ) ( ON ?auto_752898 ?auto_752899 ) ( CLEAR ?auto_752898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_752886 ?auto_752887 ?auto_752888 ?auto_752889 ?auto_752890 ?auto_752891 ?auto_752892 ?auto_752893 ?auto_752894 ?auto_752895 ?auto_752896 ?auto_752897 ?auto_752898 )
      ( MAKE-15PILE ?auto_752886 ?auto_752887 ?auto_752888 ?auto_752889 ?auto_752890 ?auto_752891 ?auto_752892 ?auto_752893 ?auto_752894 ?auto_752895 ?auto_752896 ?auto_752897 ?auto_752898 ?auto_752899 ?auto_752900 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_752948 - BLOCK
      ?auto_752949 - BLOCK
      ?auto_752950 - BLOCK
      ?auto_752951 - BLOCK
      ?auto_752952 - BLOCK
      ?auto_752953 - BLOCK
      ?auto_752954 - BLOCK
      ?auto_752955 - BLOCK
      ?auto_752956 - BLOCK
      ?auto_752957 - BLOCK
      ?auto_752958 - BLOCK
      ?auto_752959 - BLOCK
      ?auto_752960 - BLOCK
      ?auto_752961 - BLOCK
      ?auto_752962 - BLOCK
    )
    :vars
    (
      ?auto_752963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_752962 ?auto_752963 ) ( ON-TABLE ?auto_752948 ) ( ON ?auto_752949 ?auto_752948 ) ( ON ?auto_752950 ?auto_752949 ) ( ON ?auto_752951 ?auto_752950 ) ( ON ?auto_752952 ?auto_752951 ) ( ON ?auto_752953 ?auto_752952 ) ( ON ?auto_752954 ?auto_752953 ) ( ON ?auto_752955 ?auto_752954 ) ( ON ?auto_752956 ?auto_752955 ) ( ON ?auto_752957 ?auto_752956 ) ( ON ?auto_752958 ?auto_752957 ) ( not ( = ?auto_752948 ?auto_752949 ) ) ( not ( = ?auto_752948 ?auto_752950 ) ) ( not ( = ?auto_752948 ?auto_752951 ) ) ( not ( = ?auto_752948 ?auto_752952 ) ) ( not ( = ?auto_752948 ?auto_752953 ) ) ( not ( = ?auto_752948 ?auto_752954 ) ) ( not ( = ?auto_752948 ?auto_752955 ) ) ( not ( = ?auto_752948 ?auto_752956 ) ) ( not ( = ?auto_752948 ?auto_752957 ) ) ( not ( = ?auto_752948 ?auto_752958 ) ) ( not ( = ?auto_752948 ?auto_752959 ) ) ( not ( = ?auto_752948 ?auto_752960 ) ) ( not ( = ?auto_752948 ?auto_752961 ) ) ( not ( = ?auto_752948 ?auto_752962 ) ) ( not ( = ?auto_752948 ?auto_752963 ) ) ( not ( = ?auto_752949 ?auto_752950 ) ) ( not ( = ?auto_752949 ?auto_752951 ) ) ( not ( = ?auto_752949 ?auto_752952 ) ) ( not ( = ?auto_752949 ?auto_752953 ) ) ( not ( = ?auto_752949 ?auto_752954 ) ) ( not ( = ?auto_752949 ?auto_752955 ) ) ( not ( = ?auto_752949 ?auto_752956 ) ) ( not ( = ?auto_752949 ?auto_752957 ) ) ( not ( = ?auto_752949 ?auto_752958 ) ) ( not ( = ?auto_752949 ?auto_752959 ) ) ( not ( = ?auto_752949 ?auto_752960 ) ) ( not ( = ?auto_752949 ?auto_752961 ) ) ( not ( = ?auto_752949 ?auto_752962 ) ) ( not ( = ?auto_752949 ?auto_752963 ) ) ( not ( = ?auto_752950 ?auto_752951 ) ) ( not ( = ?auto_752950 ?auto_752952 ) ) ( not ( = ?auto_752950 ?auto_752953 ) ) ( not ( = ?auto_752950 ?auto_752954 ) ) ( not ( = ?auto_752950 ?auto_752955 ) ) ( not ( = ?auto_752950 ?auto_752956 ) ) ( not ( = ?auto_752950 ?auto_752957 ) ) ( not ( = ?auto_752950 ?auto_752958 ) ) ( not ( = ?auto_752950 ?auto_752959 ) ) ( not ( = ?auto_752950 ?auto_752960 ) ) ( not ( = ?auto_752950 ?auto_752961 ) ) ( not ( = ?auto_752950 ?auto_752962 ) ) ( not ( = ?auto_752950 ?auto_752963 ) ) ( not ( = ?auto_752951 ?auto_752952 ) ) ( not ( = ?auto_752951 ?auto_752953 ) ) ( not ( = ?auto_752951 ?auto_752954 ) ) ( not ( = ?auto_752951 ?auto_752955 ) ) ( not ( = ?auto_752951 ?auto_752956 ) ) ( not ( = ?auto_752951 ?auto_752957 ) ) ( not ( = ?auto_752951 ?auto_752958 ) ) ( not ( = ?auto_752951 ?auto_752959 ) ) ( not ( = ?auto_752951 ?auto_752960 ) ) ( not ( = ?auto_752951 ?auto_752961 ) ) ( not ( = ?auto_752951 ?auto_752962 ) ) ( not ( = ?auto_752951 ?auto_752963 ) ) ( not ( = ?auto_752952 ?auto_752953 ) ) ( not ( = ?auto_752952 ?auto_752954 ) ) ( not ( = ?auto_752952 ?auto_752955 ) ) ( not ( = ?auto_752952 ?auto_752956 ) ) ( not ( = ?auto_752952 ?auto_752957 ) ) ( not ( = ?auto_752952 ?auto_752958 ) ) ( not ( = ?auto_752952 ?auto_752959 ) ) ( not ( = ?auto_752952 ?auto_752960 ) ) ( not ( = ?auto_752952 ?auto_752961 ) ) ( not ( = ?auto_752952 ?auto_752962 ) ) ( not ( = ?auto_752952 ?auto_752963 ) ) ( not ( = ?auto_752953 ?auto_752954 ) ) ( not ( = ?auto_752953 ?auto_752955 ) ) ( not ( = ?auto_752953 ?auto_752956 ) ) ( not ( = ?auto_752953 ?auto_752957 ) ) ( not ( = ?auto_752953 ?auto_752958 ) ) ( not ( = ?auto_752953 ?auto_752959 ) ) ( not ( = ?auto_752953 ?auto_752960 ) ) ( not ( = ?auto_752953 ?auto_752961 ) ) ( not ( = ?auto_752953 ?auto_752962 ) ) ( not ( = ?auto_752953 ?auto_752963 ) ) ( not ( = ?auto_752954 ?auto_752955 ) ) ( not ( = ?auto_752954 ?auto_752956 ) ) ( not ( = ?auto_752954 ?auto_752957 ) ) ( not ( = ?auto_752954 ?auto_752958 ) ) ( not ( = ?auto_752954 ?auto_752959 ) ) ( not ( = ?auto_752954 ?auto_752960 ) ) ( not ( = ?auto_752954 ?auto_752961 ) ) ( not ( = ?auto_752954 ?auto_752962 ) ) ( not ( = ?auto_752954 ?auto_752963 ) ) ( not ( = ?auto_752955 ?auto_752956 ) ) ( not ( = ?auto_752955 ?auto_752957 ) ) ( not ( = ?auto_752955 ?auto_752958 ) ) ( not ( = ?auto_752955 ?auto_752959 ) ) ( not ( = ?auto_752955 ?auto_752960 ) ) ( not ( = ?auto_752955 ?auto_752961 ) ) ( not ( = ?auto_752955 ?auto_752962 ) ) ( not ( = ?auto_752955 ?auto_752963 ) ) ( not ( = ?auto_752956 ?auto_752957 ) ) ( not ( = ?auto_752956 ?auto_752958 ) ) ( not ( = ?auto_752956 ?auto_752959 ) ) ( not ( = ?auto_752956 ?auto_752960 ) ) ( not ( = ?auto_752956 ?auto_752961 ) ) ( not ( = ?auto_752956 ?auto_752962 ) ) ( not ( = ?auto_752956 ?auto_752963 ) ) ( not ( = ?auto_752957 ?auto_752958 ) ) ( not ( = ?auto_752957 ?auto_752959 ) ) ( not ( = ?auto_752957 ?auto_752960 ) ) ( not ( = ?auto_752957 ?auto_752961 ) ) ( not ( = ?auto_752957 ?auto_752962 ) ) ( not ( = ?auto_752957 ?auto_752963 ) ) ( not ( = ?auto_752958 ?auto_752959 ) ) ( not ( = ?auto_752958 ?auto_752960 ) ) ( not ( = ?auto_752958 ?auto_752961 ) ) ( not ( = ?auto_752958 ?auto_752962 ) ) ( not ( = ?auto_752958 ?auto_752963 ) ) ( not ( = ?auto_752959 ?auto_752960 ) ) ( not ( = ?auto_752959 ?auto_752961 ) ) ( not ( = ?auto_752959 ?auto_752962 ) ) ( not ( = ?auto_752959 ?auto_752963 ) ) ( not ( = ?auto_752960 ?auto_752961 ) ) ( not ( = ?auto_752960 ?auto_752962 ) ) ( not ( = ?auto_752960 ?auto_752963 ) ) ( not ( = ?auto_752961 ?auto_752962 ) ) ( not ( = ?auto_752961 ?auto_752963 ) ) ( not ( = ?auto_752962 ?auto_752963 ) ) ( ON ?auto_752961 ?auto_752962 ) ( ON ?auto_752960 ?auto_752961 ) ( CLEAR ?auto_752958 ) ( ON ?auto_752959 ?auto_752960 ) ( CLEAR ?auto_752959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_752948 ?auto_752949 ?auto_752950 ?auto_752951 ?auto_752952 ?auto_752953 ?auto_752954 ?auto_752955 ?auto_752956 ?auto_752957 ?auto_752958 ?auto_752959 )
      ( MAKE-15PILE ?auto_752948 ?auto_752949 ?auto_752950 ?auto_752951 ?auto_752952 ?auto_752953 ?auto_752954 ?auto_752955 ?auto_752956 ?auto_752957 ?auto_752958 ?auto_752959 ?auto_752960 ?auto_752961 ?auto_752962 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753010 - BLOCK
      ?auto_753011 - BLOCK
      ?auto_753012 - BLOCK
      ?auto_753013 - BLOCK
      ?auto_753014 - BLOCK
      ?auto_753015 - BLOCK
      ?auto_753016 - BLOCK
      ?auto_753017 - BLOCK
      ?auto_753018 - BLOCK
      ?auto_753019 - BLOCK
      ?auto_753020 - BLOCK
      ?auto_753021 - BLOCK
      ?auto_753022 - BLOCK
      ?auto_753023 - BLOCK
      ?auto_753024 - BLOCK
    )
    :vars
    (
      ?auto_753025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753024 ?auto_753025 ) ( ON-TABLE ?auto_753010 ) ( ON ?auto_753011 ?auto_753010 ) ( ON ?auto_753012 ?auto_753011 ) ( ON ?auto_753013 ?auto_753012 ) ( ON ?auto_753014 ?auto_753013 ) ( ON ?auto_753015 ?auto_753014 ) ( ON ?auto_753016 ?auto_753015 ) ( ON ?auto_753017 ?auto_753016 ) ( ON ?auto_753018 ?auto_753017 ) ( ON ?auto_753019 ?auto_753018 ) ( not ( = ?auto_753010 ?auto_753011 ) ) ( not ( = ?auto_753010 ?auto_753012 ) ) ( not ( = ?auto_753010 ?auto_753013 ) ) ( not ( = ?auto_753010 ?auto_753014 ) ) ( not ( = ?auto_753010 ?auto_753015 ) ) ( not ( = ?auto_753010 ?auto_753016 ) ) ( not ( = ?auto_753010 ?auto_753017 ) ) ( not ( = ?auto_753010 ?auto_753018 ) ) ( not ( = ?auto_753010 ?auto_753019 ) ) ( not ( = ?auto_753010 ?auto_753020 ) ) ( not ( = ?auto_753010 ?auto_753021 ) ) ( not ( = ?auto_753010 ?auto_753022 ) ) ( not ( = ?auto_753010 ?auto_753023 ) ) ( not ( = ?auto_753010 ?auto_753024 ) ) ( not ( = ?auto_753010 ?auto_753025 ) ) ( not ( = ?auto_753011 ?auto_753012 ) ) ( not ( = ?auto_753011 ?auto_753013 ) ) ( not ( = ?auto_753011 ?auto_753014 ) ) ( not ( = ?auto_753011 ?auto_753015 ) ) ( not ( = ?auto_753011 ?auto_753016 ) ) ( not ( = ?auto_753011 ?auto_753017 ) ) ( not ( = ?auto_753011 ?auto_753018 ) ) ( not ( = ?auto_753011 ?auto_753019 ) ) ( not ( = ?auto_753011 ?auto_753020 ) ) ( not ( = ?auto_753011 ?auto_753021 ) ) ( not ( = ?auto_753011 ?auto_753022 ) ) ( not ( = ?auto_753011 ?auto_753023 ) ) ( not ( = ?auto_753011 ?auto_753024 ) ) ( not ( = ?auto_753011 ?auto_753025 ) ) ( not ( = ?auto_753012 ?auto_753013 ) ) ( not ( = ?auto_753012 ?auto_753014 ) ) ( not ( = ?auto_753012 ?auto_753015 ) ) ( not ( = ?auto_753012 ?auto_753016 ) ) ( not ( = ?auto_753012 ?auto_753017 ) ) ( not ( = ?auto_753012 ?auto_753018 ) ) ( not ( = ?auto_753012 ?auto_753019 ) ) ( not ( = ?auto_753012 ?auto_753020 ) ) ( not ( = ?auto_753012 ?auto_753021 ) ) ( not ( = ?auto_753012 ?auto_753022 ) ) ( not ( = ?auto_753012 ?auto_753023 ) ) ( not ( = ?auto_753012 ?auto_753024 ) ) ( not ( = ?auto_753012 ?auto_753025 ) ) ( not ( = ?auto_753013 ?auto_753014 ) ) ( not ( = ?auto_753013 ?auto_753015 ) ) ( not ( = ?auto_753013 ?auto_753016 ) ) ( not ( = ?auto_753013 ?auto_753017 ) ) ( not ( = ?auto_753013 ?auto_753018 ) ) ( not ( = ?auto_753013 ?auto_753019 ) ) ( not ( = ?auto_753013 ?auto_753020 ) ) ( not ( = ?auto_753013 ?auto_753021 ) ) ( not ( = ?auto_753013 ?auto_753022 ) ) ( not ( = ?auto_753013 ?auto_753023 ) ) ( not ( = ?auto_753013 ?auto_753024 ) ) ( not ( = ?auto_753013 ?auto_753025 ) ) ( not ( = ?auto_753014 ?auto_753015 ) ) ( not ( = ?auto_753014 ?auto_753016 ) ) ( not ( = ?auto_753014 ?auto_753017 ) ) ( not ( = ?auto_753014 ?auto_753018 ) ) ( not ( = ?auto_753014 ?auto_753019 ) ) ( not ( = ?auto_753014 ?auto_753020 ) ) ( not ( = ?auto_753014 ?auto_753021 ) ) ( not ( = ?auto_753014 ?auto_753022 ) ) ( not ( = ?auto_753014 ?auto_753023 ) ) ( not ( = ?auto_753014 ?auto_753024 ) ) ( not ( = ?auto_753014 ?auto_753025 ) ) ( not ( = ?auto_753015 ?auto_753016 ) ) ( not ( = ?auto_753015 ?auto_753017 ) ) ( not ( = ?auto_753015 ?auto_753018 ) ) ( not ( = ?auto_753015 ?auto_753019 ) ) ( not ( = ?auto_753015 ?auto_753020 ) ) ( not ( = ?auto_753015 ?auto_753021 ) ) ( not ( = ?auto_753015 ?auto_753022 ) ) ( not ( = ?auto_753015 ?auto_753023 ) ) ( not ( = ?auto_753015 ?auto_753024 ) ) ( not ( = ?auto_753015 ?auto_753025 ) ) ( not ( = ?auto_753016 ?auto_753017 ) ) ( not ( = ?auto_753016 ?auto_753018 ) ) ( not ( = ?auto_753016 ?auto_753019 ) ) ( not ( = ?auto_753016 ?auto_753020 ) ) ( not ( = ?auto_753016 ?auto_753021 ) ) ( not ( = ?auto_753016 ?auto_753022 ) ) ( not ( = ?auto_753016 ?auto_753023 ) ) ( not ( = ?auto_753016 ?auto_753024 ) ) ( not ( = ?auto_753016 ?auto_753025 ) ) ( not ( = ?auto_753017 ?auto_753018 ) ) ( not ( = ?auto_753017 ?auto_753019 ) ) ( not ( = ?auto_753017 ?auto_753020 ) ) ( not ( = ?auto_753017 ?auto_753021 ) ) ( not ( = ?auto_753017 ?auto_753022 ) ) ( not ( = ?auto_753017 ?auto_753023 ) ) ( not ( = ?auto_753017 ?auto_753024 ) ) ( not ( = ?auto_753017 ?auto_753025 ) ) ( not ( = ?auto_753018 ?auto_753019 ) ) ( not ( = ?auto_753018 ?auto_753020 ) ) ( not ( = ?auto_753018 ?auto_753021 ) ) ( not ( = ?auto_753018 ?auto_753022 ) ) ( not ( = ?auto_753018 ?auto_753023 ) ) ( not ( = ?auto_753018 ?auto_753024 ) ) ( not ( = ?auto_753018 ?auto_753025 ) ) ( not ( = ?auto_753019 ?auto_753020 ) ) ( not ( = ?auto_753019 ?auto_753021 ) ) ( not ( = ?auto_753019 ?auto_753022 ) ) ( not ( = ?auto_753019 ?auto_753023 ) ) ( not ( = ?auto_753019 ?auto_753024 ) ) ( not ( = ?auto_753019 ?auto_753025 ) ) ( not ( = ?auto_753020 ?auto_753021 ) ) ( not ( = ?auto_753020 ?auto_753022 ) ) ( not ( = ?auto_753020 ?auto_753023 ) ) ( not ( = ?auto_753020 ?auto_753024 ) ) ( not ( = ?auto_753020 ?auto_753025 ) ) ( not ( = ?auto_753021 ?auto_753022 ) ) ( not ( = ?auto_753021 ?auto_753023 ) ) ( not ( = ?auto_753021 ?auto_753024 ) ) ( not ( = ?auto_753021 ?auto_753025 ) ) ( not ( = ?auto_753022 ?auto_753023 ) ) ( not ( = ?auto_753022 ?auto_753024 ) ) ( not ( = ?auto_753022 ?auto_753025 ) ) ( not ( = ?auto_753023 ?auto_753024 ) ) ( not ( = ?auto_753023 ?auto_753025 ) ) ( not ( = ?auto_753024 ?auto_753025 ) ) ( ON ?auto_753023 ?auto_753024 ) ( ON ?auto_753022 ?auto_753023 ) ( ON ?auto_753021 ?auto_753022 ) ( CLEAR ?auto_753019 ) ( ON ?auto_753020 ?auto_753021 ) ( CLEAR ?auto_753020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_753010 ?auto_753011 ?auto_753012 ?auto_753013 ?auto_753014 ?auto_753015 ?auto_753016 ?auto_753017 ?auto_753018 ?auto_753019 ?auto_753020 )
      ( MAKE-15PILE ?auto_753010 ?auto_753011 ?auto_753012 ?auto_753013 ?auto_753014 ?auto_753015 ?auto_753016 ?auto_753017 ?auto_753018 ?auto_753019 ?auto_753020 ?auto_753021 ?auto_753022 ?auto_753023 ?auto_753024 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753072 - BLOCK
      ?auto_753073 - BLOCK
      ?auto_753074 - BLOCK
      ?auto_753075 - BLOCK
      ?auto_753076 - BLOCK
      ?auto_753077 - BLOCK
      ?auto_753078 - BLOCK
      ?auto_753079 - BLOCK
      ?auto_753080 - BLOCK
      ?auto_753081 - BLOCK
      ?auto_753082 - BLOCK
      ?auto_753083 - BLOCK
      ?auto_753084 - BLOCK
      ?auto_753085 - BLOCK
      ?auto_753086 - BLOCK
    )
    :vars
    (
      ?auto_753087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753086 ?auto_753087 ) ( ON-TABLE ?auto_753072 ) ( ON ?auto_753073 ?auto_753072 ) ( ON ?auto_753074 ?auto_753073 ) ( ON ?auto_753075 ?auto_753074 ) ( ON ?auto_753076 ?auto_753075 ) ( ON ?auto_753077 ?auto_753076 ) ( ON ?auto_753078 ?auto_753077 ) ( ON ?auto_753079 ?auto_753078 ) ( ON ?auto_753080 ?auto_753079 ) ( not ( = ?auto_753072 ?auto_753073 ) ) ( not ( = ?auto_753072 ?auto_753074 ) ) ( not ( = ?auto_753072 ?auto_753075 ) ) ( not ( = ?auto_753072 ?auto_753076 ) ) ( not ( = ?auto_753072 ?auto_753077 ) ) ( not ( = ?auto_753072 ?auto_753078 ) ) ( not ( = ?auto_753072 ?auto_753079 ) ) ( not ( = ?auto_753072 ?auto_753080 ) ) ( not ( = ?auto_753072 ?auto_753081 ) ) ( not ( = ?auto_753072 ?auto_753082 ) ) ( not ( = ?auto_753072 ?auto_753083 ) ) ( not ( = ?auto_753072 ?auto_753084 ) ) ( not ( = ?auto_753072 ?auto_753085 ) ) ( not ( = ?auto_753072 ?auto_753086 ) ) ( not ( = ?auto_753072 ?auto_753087 ) ) ( not ( = ?auto_753073 ?auto_753074 ) ) ( not ( = ?auto_753073 ?auto_753075 ) ) ( not ( = ?auto_753073 ?auto_753076 ) ) ( not ( = ?auto_753073 ?auto_753077 ) ) ( not ( = ?auto_753073 ?auto_753078 ) ) ( not ( = ?auto_753073 ?auto_753079 ) ) ( not ( = ?auto_753073 ?auto_753080 ) ) ( not ( = ?auto_753073 ?auto_753081 ) ) ( not ( = ?auto_753073 ?auto_753082 ) ) ( not ( = ?auto_753073 ?auto_753083 ) ) ( not ( = ?auto_753073 ?auto_753084 ) ) ( not ( = ?auto_753073 ?auto_753085 ) ) ( not ( = ?auto_753073 ?auto_753086 ) ) ( not ( = ?auto_753073 ?auto_753087 ) ) ( not ( = ?auto_753074 ?auto_753075 ) ) ( not ( = ?auto_753074 ?auto_753076 ) ) ( not ( = ?auto_753074 ?auto_753077 ) ) ( not ( = ?auto_753074 ?auto_753078 ) ) ( not ( = ?auto_753074 ?auto_753079 ) ) ( not ( = ?auto_753074 ?auto_753080 ) ) ( not ( = ?auto_753074 ?auto_753081 ) ) ( not ( = ?auto_753074 ?auto_753082 ) ) ( not ( = ?auto_753074 ?auto_753083 ) ) ( not ( = ?auto_753074 ?auto_753084 ) ) ( not ( = ?auto_753074 ?auto_753085 ) ) ( not ( = ?auto_753074 ?auto_753086 ) ) ( not ( = ?auto_753074 ?auto_753087 ) ) ( not ( = ?auto_753075 ?auto_753076 ) ) ( not ( = ?auto_753075 ?auto_753077 ) ) ( not ( = ?auto_753075 ?auto_753078 ) ) ( not ( = ?auto_753075 ?auto_753079 ) ) ( not ( = ?auto_753075 ?auto_753080 ) ) ( not ( = ?auto_753075 ?auto_753081 ) ) ( not ( = ?auto_753075 ?auto_753082 ) ) ( not ( = ?auto_753075 ?auto_753083 ) ) ( not ( = ?auto_753075 ?auto_753084 ) ) ( not ( = ?auto_753075 ?auto_753085 ) ) ( not ( = ?auto_753075 ?auto_753086 ) ) ( not ( = ?auto_753075 ?auto_753087 ) ) ( not ( = ?auto_753076 ?auto_753077 ) ) ( not ( = ?auto_753076 ?auto_753078 ) ) ( not ( = ?auto_753076 ?auto_753079 ) ) ( not ( = ?auto_753076 ?auto_753080 ) ) ( not ( = ?auto_753076 ?auto_753081 ) ) ( not ( = ?auto_753076 ?auto_753082 ) ) ( not ( = ?auto_753076 ?auto_753083 ) ) ( not ( = ?auto_753076 ?auto_753084 ) ) ( not ( = ?auto_753076 ?auto_753085 ) ) ( not ( = ?auto_753076 ?auto_753086 ) ) ( not ( = ?auto_753076 ?auto_753087 ) ) ( not ( = ?auto_753077 ?auto_753078 ) ) ( not ( = ?auto_753077 ?auto_753079 ) ) ( not ( = ?auto_753077 ?auto_753080 ) ) ( not ( = ?auto_753077 ?auto_753081 ) ) ( not ( = ?auto_753077 ?auto_753082 ) ) ( not ( = ?auto_753077 ?auto_753083 ) ) ( not ( = ?auto_753077 ?auto_753084 ) ) ( not ( = ?auto_753077 ?auto_753085 ) ) ( not ( = ?auto_753077 ?auto_753086 ) ) ( not ( = ?auto_753077 ?auto_753087 ) ) ( not ( = ?auto_753078 ?auto_753079 ) ) ( not ( = ?auto_753078 ?auto_753080 ) ) ( not ( = ?auto_753078 ?auto_753081 ) ) ( not ( = ?auto_753078 ?auto_753082 ) ) ( not ( = ?auto_753078 ?auto_753083 ) ) ( not ( = ?auto_753078 ?auto_753084 ) ) ( not ( = ?auto_753078 ?auto_753085 ) ) ( not ( = ?auto_753078 ?auto_753086 ) ) ( not ( = ?auto_753078 ?auto_753087 ) ) ( not ( = ?auto_753079 ?auto_753080 ) ) ( not ( = ?auto_753079 ?auto_753081 ) ) ( not ( = ?auto_753079 ?auto_753082 ) ) ( not ( = ?auto_753079 ?auto_753083 ) ) ( not ( = ?auto_753079 ?auto_753084 ) ) ( not ( = ?auto_753079 ?auto_753085 ) ) ( not ( = ?auto_753079 ?auto_753086 ) ) ( not ( = ?auto_753079 ?auto_753087 ) ) ( not ( = ?auto_753080 ?auto_753081 ) ) ( not ( = ?auto_753080 ?auto_753082 ) ) ( not ( = ?auto_753080 ?auto_753083 ) ) ( not ( = ?auto_753080 ?auto_753084 ) ) ( not ( = ?auto_753080 ?auto_753085 ) ) ( not ( = ?auto_753080 ?auto_753086 ) ) ( not ( = ?auto_753080 ?auto_753087 ) ) ( not ( = ?auto_753081 ?auto_753082 ) ) ( not ( = ?auto_753081 ?auto_753083 ) ) ( not ( = ?auto_753081 ?auto_753084 ) ) ( not ( = ?auto_753081 ?auto_753085 ) ) ( not ( = ?auto_753081 ?auto_753086 ) ) ( not ( = ?auto_753081 ?auto_753087 ) ) ( not ( = ?auto_753082 ?auto_753083 ) ) ( not ( = ?auto_753082 ?auto_753084 ) ) ( not ( = ?auto_753082 ?auto_753085 ) ) ( not ( = ?auto_753082 ?auto_753086 ) ) ( not ( = ?auto_753082 ?auto_753087 ) ) ( not ( = ?auto_753083 ?auto_753084 ) ) ( not ( = ?auto_753083 ?auto_753085 ) ) ( not ( = ?auto_753083 ?auto_753086 ) ) ( not ( = ?auto_753083 ?auto_753087 ) ) ( not ( = ?auto_753084 ?auto_753085 ) ) ( not ( = ?auto_753084 ?auto_753086 ) ) ( not ( = ?auto_753084 ?auto_753087 ) ) ( not ( = ?auto_753085 ?auto_753086 ) ) ( not ( = ?auto_753085 ?auto_753087 ) ) ( not ( = ?auto_753086 ?auto_753087 ) ) ( ON ?auto_753085 ?auto_753086 ) ( ON ?auto_753084 ?auto_753085 ) ( ON ?auto_753083 ?auto_753084 ) ( ON ?auto_753082 ?auto_753083 ) ( CLEAR ?auto_753080 ) ( ON ?auto_753081 ?auto_753082 ) ( CLEAR ?auto_753081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_753072 ?auto_753073 ?auto_753074 ?auto_753075 ?auto_753076 ?auto_753077 ?auto_753078 ?auto_753079 ?auto_753080 ?auto_753081 )
      ( MAKE-15PILE ?auto_753072 ?auto_753073 ?auto_753074 ?auto_753075 ?auto_753076 ?auto_753077 ?auto_753078 ?auto_753079 ?auto_753080 ?auto_753081 ?auto_753082 ?auto_753083 ?auto_753084 ?auto_753085 ?auto_753086 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753134 - BLOCK
      ?auto_753135 - BLOCK
      ?auto_753136 - BLOCK
      ?auto_753137 - BLOCK
      ?auto_753138 - BLOCK
      ?auto_753139 - BLOCK
      ?auto_753140 - BLOCK
      ?auto_753141 - BLOCK
      ?auto_753142 - BLOCK
      ?auto_753143 - BLOCK
      ?auto_753144 - BLOCK
      ?auto_753145 - BLOCK
      ?auto_753146 - BLOCK
      ?auto_753147 - BLOCK
      ?auto_753148 - BLOCK
    )
    :vars
    (
      ?auto_753149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753148 ?auto_753149 ) ( ON-TABLE ?auto_753134 ) ( ON ?auto_753135 ?auto_753134 ) ( ON ?auto_753136 ?auto_753135 ) ( ON ?auto_753137 ?auto_753136 ) ( ON ?auto_753138 ?auto_753137 ) ( ON ?auto_753139 ?auto_753138 ) ( ON ?auto_753140 ?auto_753139 ) ( ON ?auto_753141 ?auto_753140 ) ( not ( = ?auto_753134 ?auto_753135 ) ) ( not ( = ?auto_753134 ?auto_753136 ) ) ( not ( = ?auto_753134 ?auto_753137 ) ) ( not ( = ?auto_753134 ?auto_753138 ) ) ( not ( = ?auto_753134 ?auto_753139 ) ) ( not ( = ?auto_753134 ?auto_753140 ) ) ( not ( = ?auto_753134 ?auto_753141 ) ) ( not ( = ?auto_753134 ?auto_753142 ) ) ( not ( = ?auto_753134 ?auto_753143 ) ) ( not ( = ?auto_753134 ?auto_753144 ) ) ( not ( = ?auto_753134 ?auto_753145 ) ) ( not ( = ?auto_753134 ?auto_753146 ) ) ( not ( = ?auto_753134 ?auto_753147 ) ) ( not ( = ?auto_753134 ?auto_753148 ) ) ( not ( = ?auto_753134 ?auto_753149 ) ) ( not ( = ?auto_753135 ?auto_753136 ) ) ( not ( = ?auto_753135 ?auto_753137 ) ) ( not ( = ?auto_753135 ?auto_753138 ) ) ( not ( = ?auto_753135 ?auto_753139 ) ) ( not ( = ?auto_753135 ?auto_753140 ) ) ( not ( = ?auto_753135 ?auto_753141 ) ) ( not ( = ?auto_753135 ?auto_753142 ) ) ( not ( = ?auto_753135 ?auto_753143 ) ) ( not ( = ?auto_753135 ?auto_753144 ) ) ( not ( = ?auto_753135 ?auto_753145 ) ) ( not ( = ?auto_753135 ?auto_753146 ) ) ( not ( = ?auto_753135 ?auto_753147 ) ) ( not ( = ?auto_753135 ?auto_753148 ) ) ( not ( = ?auto_753135 ?auto_753149 ) ) ( not ( = ?auto_753136 ?auto_753137 ) ) ( not ( = ?auto_753136 ?auto_753138 ) ) ( not ( = ?auto_753136 ?auto_753139 ) ) ( not ( = ?auto_753136 ?auto_753140 ) ) ( not ( = ?auto_753136 ?auto_753141 ) ) ( not ( = ?auto_753136 ?auto_753142 ) ) ( not ( = ?auto_753136 ?auto_753143 ) ) ( not ( = ?auto_753136 ?auto_753144 ) ) ( not ( = ?auto_753136 ?auto_753145 ) ) ( not ( = ?auto_753136 ?auto_753146 ) ) ( not ( = ?auto_753136 ?auto_753147 ) ) ( not ( = ?auto_753136 ?auto_753148 ) ) ( not ( = ?auto_753136 ?auto_753149 ) ) ( not ( = ?auto_753137 ?auto_753138 ) ) ( not ( = ?auto_753137 ?auto_753139 ) ) ( not ( = ?auto_753137 ?auto_753140 ) ) ( not ( = ?auto_753137 ?auto_753141 ) ) ( not ( = ?auto_753137 ?auto_753142 ) ) ( not ( = ?auto_753137 ?auto_753143 ) ) ( not ( = ?auto_753137 ?auto_753144 ) ) ( not ( = ?auto_753137 ?auto_753145 ) ) ( not ( = ?auto_753137 ?auto_753146 ) ) ( not ( = ?auto_753137 ?auto_753147 ) ) ( not ( = ?auto_753137 ?auto_753148 ) ) ( not ( = ?auto_753137 ?auto_753149 ) ) ( not ( = ?auto_753138 ?auto_753139 ) ) ( not ( = ?auto_753138 ?auto_753140 ) ) ( not ( = ?auto_753138 ?auto_753141 ) ) ( not ( = ?auto_753138 ?auto_753142 ) ) ( not ( = ?auto_753138 ?auto_753143 ) ) ( not ( = ?auto_753138 ?auto_753144 ) ) ( not ( = ?auto_753138 ?auto_753145 ) ) ( not ( = ?auto_753138 ?auto_753146 ) ) ( not ( = ?auto_753138 ?auto_753147 ) ) ( not ( = ?auto_753138 ?auto_753148 ) ) ( not ( = ?auto_753138 ?auto_753149 ) ) ( not ( = ?auto_753139 ?auto_753140 ) ) ( not ( = ?auto_753139 ?auto_753141 ) ) ( not ( = ?auto_753139 ?auto_753142 ) ) ( not ( = ?auto_753139 ?auto_753143 ) ) ( not ( = ?auto_753139 ?auto_753144 ) ) ( not ( = ?auto_753139 ?auto_753145 ) ) ( not ( = ?auto_753139 ?auto_753146 ) ) ( not ( = ?auto_753139 ?auto_753147 ) ) ( not ( = ?auto_753139 ?auto_753148 ) ) ( not ( = ?auto_753139 ?auto_753149 ) ) ( not ( = ?auto_753140 ?auto_753141 ) ) ( not ( = ?auto_753140 ?auto_753142 ) ) ( not ( = ?auto_753140 ?auto_753143 ) ) ( not ( = ?auto_753140 ?auto_753144 ) ) ( not ( = ?auto_753140 ?auto_753145 ) ) ( not ( = ?auto_753140 ?auto_753146 ) ) ( not ( = ?auto_753140 ?auto_753147 ) ) ( not ( = ?auto_753140 ?auto_753148 ) ) ( not ( = ?auto_753140 ?auto_753149 ) ) ( not ( = ?auto_753141 ?auto_753142 ) ) ( not ( = ?auto_753141 ?auto_753143 ) ) ( not ( = ?auto_753141 ?auto_753144 ) ) ( not ( = ?auto_753141 ?auto_753145 ) ) ( not ( = ?auto_753141 ?auto_753146 ) ) ( not ( = ?auto_753141 ?auto_753147 ) ) ( not ( = ?auto_753141 ?auto_753148 ) ) ( not ( = ?auto_753141 ?auto_753149 ) ) ( not ( = ?auto_753142 ?auto_753143 ) ) ( not ( = ?auto_753142 ?auto_753144 ) ) ( not ( = ?auto_753142 ?auto_753145 ) ) ( not ( = ?auto_753142 ?auto_753146 ) ) ( not ( = ?auto_753142 ?auto_753147 ) ) ( not ( = ?auto_753142 ?auto_753148 ) ) ( not ( = ?auto_753142 ?auto_753149 ) ) ( not ( = ?auto_753143 ?auto_753144 ) ) ( not ( = ?auto_753143 ?auto_753145 ) ) ( not ( = ?auto_753143 ?auto_753146 ) ) ( not ( = ?auto_753143 ?auto_753147 ) ) ( not ( = ?auto_753143 ?auto_753148 ) ) ( not ( = ?auto_753143 ?auto_753149 ) ) ( not ( = ?auto_753144 ?auto_753145 ) ) ( not ( = ?auto_753144 ?auto_753146 ) ) ( not ( = ?auto_753144 ?auto_753147 ) ) ( not ( = ?auto_753144 ?auto_753148 ) ) ( not ( = ?auto_753144 ?auto_753149 ) ) ( not ( = ?auto_753145 ?auto_753146 ) ) ( not ( = ?auto_753145 ?auto_753147 ) ) ( not ( = ?auto_753145 ?auto_753148 ) ) ( not ( = ?auto_753145 ?auto_753149 ) ) ( not ( = ?auto_753146 ?auto_753147 ) ) ( not ( = ?auto_753146 ?auto_753148 ) ) ( not ( = ?auto_753146 ?auto_753149 ) ) ( not ( = ?auto_753147 ?auto_753148 ) ) ( not ( = ?auto_753147 ?auto_753149 ) ) ( not ( = ?auto_753148 ?auto_753149 ) ) ( ON ?auto_753147 ?auto_753148 ) ( ON ?auto_753146 ?auto_753147 ) ( ON ?auto_753145 ?auto_753146 ) ( ON ?auto_753144 ?auto_753145 ) ( ON ?auto_753143 ?auto_753144 ) ( CLEAR ?auto_753141 ) ( ON ?auto_753142 ?auto_753143 ) ( CLEAR ?auto_753142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_753134 ?auto_753135 ?auto_753136 ?auto_753137 ?auto_753138 ?auto_753139 ?auto_753140 ?auto_753141 ?auto_753142 )
      ( MAKE-15PILE ?auto_753134 ?auto_753135 ?auto_753136 ?auto_753137 ?auto_753138 ?auto_753139 ?auto_753140 ?auto_753141 ?auto_753142 ?auto_753143 ?auto_753144 ?auto_753145 ?auto_753146 ?auto_753147 ?auto_753148 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753196 - BLOCK
      ?auto_753197 - BLOCK
      ?auto_753198 - BLOCK
      ?auto_753199 - BLOCK
      ?auto_753200 - BLOCK
      ?auto_753201 - BLOCK
      ?auto_753202 - BLOCK
      ?auto_753203 - BLOCK
      ?auto_753204 - BLOCK
      ?auto_753205 - BLOCK
      ?auto_753206 - BLOCK
      ?auto_753207 - BLOCK
      ?auto_753208 - BLOCK
      ?auto_753209 - BLOCK
      ?auto_753210 - BLOCK
    )
    :vars
    (
      ?auto_753211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753210 ?auto_753211 ) ( ON-TABLE ?auto_753196 ) ( ON ?auto_753197 ?auto_753196 ) ( ON ?auto_753198 ?auto_753197 ) ( ON ?auto_753199 ?auto_753198 ) ( ON ?auto_753200 ?auto_753199 ) ( ON ?auto_753201 ?auto_753200 ) ( ON ?auto_753202 ?auto_753201 ) ( not ( = ?auto_753196 ?auto_753197 ) ) ( not ( = ?auto_753196 ?auto_753198 ) ) ( not ( = ?auto_753196 ?auto_753199 ) ) ( not ( = ?auto_753196 ?auto_753200 ) ) ( not ( = ?auto_753196 ?auto_753201 ) ) ( not ( = ?auto_753196 ?auto_753202 ) ) ( not ( = ?auto_753196 ?auto_753203 ) ) ( not ( = ?auto_753196 ?auto_753204 ) ) ( not ( = ?auto_753196 ?auto_753205 ) ) ( not ( = ?auto_753196 ?auto_753206 ) ) ( not ( = ?auto_753196 ?auto_753207 ) ) ( not ( = ?auto_753196 ?auto_753208 ) ) ( not ( = ?auto_753196 ?auto_753209 ) ) ( not ( = ?auto_753196 ?auto_753210 ) ) ( not ( = ?auto_753196 ?auto_753211 ) ) ( not ( = ?auto_753197 ?auto_753198 ) ) ( not ( = ?auto_753197 ?auto_753199 ) ) ( not ( = ?auto_753197 ?auto_753200 ) ) ( not ( = ?auto_753197 ?auto_753201 ) ) ( not ( = ?auto_753197 ?auto_753202 ) ) ( not ( = ?auto_753197 ?auto_753203 ) ) ( not ( = ?auto_753197 ?auto_753204 ) ) ( not ( = ?auto_753197 ?auto_753205 ) ) ( not ( = ?auto_753197 ?auto_753206 ) ) ( not ( = ?auto_753197 ?auto_753207 ) ) ( not ( = ?auto_753197 ?auto_753208 ) ) ( not ( = ?auto_753197 ?auto_753209 ) ) ( not ( = ?auto_753197 ?auto_753210 ) ) ( not ( = ?auto_753197 ?auto_753211 ) ) ( not ( = ?auto_753198 ?auto_753199 ) ) ( not ( = ?auto_753198 ?auto_753200 ) ) ( not ( = ?auto_753198 ?auto_753201 ) ) ( not ( = ?auto_753198 ?auto_753202 ) ) ( not ( = ?auto_753198 ?auto_753203 ) ) ( not ( = ?auto_753198 ?auto_753204 ) ) ( not ( = ?auto_753198 ?auto_753205 ) ) ( not ( = ?auto_753198 ?auto_753206 ) ) ( not ( = ?auto_753198 ?auto_753207 ) ) ( not ( = ?auto_753198 ?auto_753208 ) ) ( not ( = ?auto_753198 ?auto_753209 ) ) ( not ( = ?auto_753198 ?auto_753210 ) ) ( not ( = ?auto_753198 ?auto_753211 ) ) ( not ( = ?auto_753199 ?auto_753200 ) ) ( not ( = ?auto_753199 ?auto_753201 ) ) ( not ( = ?auto_753199 ?auto_753202 ) ) ( not ( = ?auto_753199 ?auto_753203 ) ) ( not ( = ?auto_753199 ?auto_753204 ) ) ( not ( = ?auto_753199 ?auto_753205 ) ) ( not ( = ?auto_753199 ?auto_753206 ) ) ( not ( = ?auto_753199 ?auto_753207 ) ) ( not ( = ?auto_753199 ?auto_753208 ) ) ( not ( = ?auto_753199 ?auto_753209 ) ) ( not ( = ?auto_753199 ?auto_753210 ) ) ( not ( = ?auto_753199 ?auto_753211 ) ) ( not ( = ?auto_753200 ?auto_753201 ) ) ( not ( = ?auto_753200 ?auto_753202 ) ) ( not ( = ?auto_753200 ?auto_753203 ) ) ( not ( = ?auto_753200 ?auto_753204 ) ) ( not ( = ?auto_753200 ?auto_753205 ) ) ( not ( = ?auto_753200 ?auto_753206 ) ) ( not ( = ?auto_753200 ?auto_753207 ) ) ( not ( = ?auto_753200 ?auto_753208 ) ) ( not ( = ?auto_753200 ?auto_753209 ) ) ( not ( = ?auto_753200 ?auto_753210 ) ) ( not ( = ?auto_753200 ?auto_753211 ) ) ( not ( = ?auto_753201 ?auto_753202 ) ) ( not ( = ?auto_753201 ?auto_753203 ) ) ( not ( = ?auto_753201 ?auto_753204 ) ) ( not ( = ?auto_753201 ?auto_753205 ) ) ( not ( = ?auto_753201 ?auto_753206 ) ) ( not ( = ?auto_753201 ?auto_753207 ) ) ( not ( = ?auto_753201 ?auto_753208 ) ) ( not ( = ?auto_753201 ?auto_753209 ) ) ( not ( = ?auto_753201 ?auto_753210 ) ) ( not ( = ?auto_753201 ?auto_753211 ) ) ( not ( = ?auto_753202 ?auto_753203 ) ) ( not ( = ?auto_753202 ?auto_753204 ) ) ( not ( = ?auto_753202 ?auto_753205 ) ) ( not ( = ?auto_753202 ?auto_753206 ) ) ( not ( = ?auto_753202 ?auto_753207 ) ) ( not ( = ?auto_753202 ?auto_753208 ) ) ( not ( = ?auto_753202 ?auto_753209 ) ) ( not ( = ?auto_753202 ?auto_753210 ) ) ( not ( = ?auto_753202 ?auto_753211 ) ) ( not ( = ?auto_753203 ?auto_753204 ) ) ( not ( = ?auto_753203 ?auto_753205 ) ) ( not ( = ?auto_753203 ?auto_753206 ) ) ( not ( = ?auto_753203 ?auto_753207 ) ) ( not ( = ?auto_753203 ?auto_753208 ) ) ( not ( = ?auto_753203 ?auto_753209 ) ) ( not ( = ?auto_753203 ?auto_753210 ) ) ( not ( = ?auto_753203 ?auto_753211 ) ) ( not ( = ?auto_753204 ?auto_753205 ) ) ( not ( = ?auto_753204 ?auto_753206 ) ) ( not ( = ?auto_753204 ?auto_753207 ) ) ( not ( = ?auto_753204 ?auto_753208 ) ) ( not ( = ?auto_753204 ?auto_753209 ) ) ( not ( = ?auto_753204 ?auto_753210 ) ) ( not ( = ?auto_753204 ?auto_753211 ) ) ( not ( = ?auto_753205 ?auto_753206 ) ) ( not ( = ?auto_753205 ?auto_753207 ) ) ( not ( = ?auto_753205 ?auto_753208 ) ) ( not ( = ?auto_753205 ?auto_753209 ) ) ( not ( = ?auto_753205 ?auto_753210 ) ) ( not ( = ?auto_753205 ?auto_753211 ) ) ( not ( = ?auto_753206 ?auto_753207 ) ) ( not ( = ?auto_753206 ?auto_753208 ) ) ( not ( = ?auto_753206 ?auto_753209 ) ) ( not ( = ?auto_753206 ?auto_753210 ) ) ( not ( = ?auto_753206 ?auto_753211 ) ) ( not ( = ?auto_753207 ?auto_753208 ) ) ( not ( = ?auto_753207 ?auto_753209 ) ) ( not ( = ?auto_753207 ?auto_753210 ) ) ( not ( = ?auto_753207 ?auto_753211 ) ) ( not ( = ?auto_753208 ?auto_753209 ) ) ( not ( = ?auto_753208 ?auto_753210 ) ) ( not ( = ?auto_753208 ?auto_753211 ) ) ( not ( = ?auto_753209 ?auto_753210 ) ) ( not ( = ?auto_753209 ?auto_753211 ) ) ( not ( = ?auto_753210 ?auto_753211 ) ) ( ON ?auto_753209 ?auto_753210 ) ( ON ?auto_753208 ?auto_753209 ) ( ON ?auto_753207 ?auto_753208 ) ( ON ?auto_753206 ?auto_753207 ) ( ON ?auto_753205 ?auto_753206 ) ( ON ?auto_753204 ?auto_753205 ) ( CLEAR ?auto_753202 ) ( ON ?auto_753203 ?auto_753204 ) ( CLEAR ?auto_753203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_753196 ?auto_753197 ?auto_753198 ?auto_753199 ?auto_753200 ?auto_753201 ?auto_753202 ?auto_753203 )
      ( MAKE-15PILE ?auto_753196 ?auto_753197 ?auto_753198 ?auto_753199 ?auto_753200 ?auto_753201 ?auto_753202 ?auto_753203 ?auto_753204 ?auto_753205 ?auto_753206 ?auto_753207 ?auto_753208 ?auto_753209 ?auto_753210 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753258 - BLOCK
      ?auto_753259 - BLOCK
      ?auto_753260 - BLOCK
      ?auto_753261 - BLOCK
      ?auto_753262 - BLOCK
      ?auto_753263 - BLOCK
      ?auto_753264 - BLOCK
      ?auto_753265 - BLOCK
      ?auto_753266 - BLOCK
      ?auto_753267 - BLOCK
      ?auto_753268 - BLOCK
      ?auto_753269 - BLOCK
      ?auto_753270 - BLOCK
      ?auto_753271 - BLOCK
      ?auto_753272 - BLOCK
    )
    :vars
    (
      ?auto_753273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753272 ?auto_753273 ) ( ON-TABLE ?auto_753258 ) ( ON ?auto_753259 ?auto_753258 ) ( ON ?auto_753260 ?auto_753259 ) ( ON ?auto_753261 ?auto_753260 ) ( ON ?auto_753262 ?auto_753261 ) ( ON ?auto_753263 ?auto_753262 ) ( not ( = ?auto_753258 ?auto_753259 ) ) ( not ( = ?auto_753258 ?auto_753260 ) ) ( not ( = ?auto_753258 ?auto_753261 ) ) ( not ( = ?auto_753258 ?auto_753262 ) ) ( not ( = ?auto_753258 ?auto_753263 ) ) ( not ( = ?auto_753258 ?auto_753264 ) ) ( not ( = ?auto_753258 ?auto_753265 ) ) ( not ( = ?auto_753258 ?auto_753266 ) ) ( not ( = ?auto_753258 ?auto_753267 ) ) ( not ( = ?auto_753258 ?auto_753268 ) ) ( not ( = ?auto_753258 ?auto_753269 ) ) ( not ( = ?auto_753258 ?auto_753270 ) ) ( not ( = ?auto_753258 ?auto_753271 ) ) ( not ( = ?auto_753258 ?auto_753272 ) ) ( not ( = ?auto_753258 ?auto_753273 ) ) ( not ( = ?auto_753259 ?auto_753260 ) ) ( not ( = ?auto_753259 ?auto_753261 ) ) ( not ( = ?auto_753259 ?auto_753262 ) ) ( not ( = ?auto_753259 ?auto_753263 ) ) ( not ( = ?auto_753259 ?auto_753264 ) ) ( not ( = ?auto_753259 ?auto_753265 ) ) ( not ( = ?auto_753259 ?auto_753266 ) ) ( not ( = ?auto_753259 ?auto_753267 ) ) ( not ( = ?auto_753259 ?auto_753268 ) ) ( not ( = ?auto_753259 ?auto_753269 ) ) ( not ( = ?auto_753259 ?auto_753270 ) ) ( not ( = ?auto_753259 ?auto_753271 ) ) ( not ( = ?auto_753259 ?auto_753272 ) ) ( not ( = ?auto_753259 ?auto_753273 ) ) ( not ( = ?auto_753260 ?auto_753261 ) ) ( not ( = ?auto_753260 ?auto_753262 ) ) ( not ( = ?auto_753260 ?auto_753263 ) ) ( not ( = ?auto_753260 ?auto_753264 ) ) ( not ( = ?auto_753260 ?auto_753265 ) ) ( not ( = ?auto_753260 ?auto_753266 ) ) ( not ( = ?auto_753260 ?auto_753267 ) ) ( not ( = ?auto_753260 ?auto_753268 ) ) ( not ( = ?auto_753260 ?auto_753269 ) ) ( not ( = ?auto_753260 ?auto_753270 ) ) ( not ( = ?auto_753260 ?auto_753271 ) ) ( not ( = ?auto_753260 ?auto_753272 ) ) ( not ( = ?auto_753260 ?auto_753273 ) ) ( not ( = ?auto_753261 ?auto_753262 ) ) ( not ( = ?auto_753261 ?auto_753263 ) ) ( not ( = ?auto_753261 ?auto_753264 ) ) ( not ( = ?auto_753261 ?auto_753265 ) ) ( not ( = ?auto_753261 ?auto_753266 ) ) ( not ( = ?auto_753261 ?auto_753267 ) ) ( not ( = ?auto_753261 ?auto_753268 ) ) ( not ( = ?auto_753261 ?auto_753269 ) ) ( not ( = ?auto_753261 ?auto_753270 ) ) ( not ( = ?auto_753261 ?auto_753271 ) ) ( not ( = ?auto_753261 ?auto_753272 ) ) ( not ( = ?auto_753261 ?auto_753273 ) ) ( not ( = ?auto_753262 ?auto_753263 ) ) ( not ( = ?auto_753262 ?auto_753264 ) ) ( not ( = ?auto_753262 ?auto_753265 ) ) ( not ( = ?auto_753262 ?auto_753266 ) ) ( not ( = ?auto_753262 ?auto_753267 ) ) ( not ( = ?auto_753262 ?auto_753268 ) ) ( not ( = ?auto_753262 ?auto_753269 ) ) ( not ( = ?auto_753262 ?auto_753270 ) ) ( not ( = ?auto_753262 ?auto_753271 ) ) ( not ( = ?auto_753262 ?auto_753272 ) ) ( not ( = ?auto_753262 ?auto_753273 ) ) ( not ( = ?auto_753263 ?auto_753264 ) ) ( not ( = ?auto_753263 ?auto_753265 ) ) ( not ( = ?auto_753263 ?auto_753266 ) ) ( not ( = ?auto_753263 ?auto_753267 ) ) ( not ( = ?auto_753263 ?auto_753268 ) ) ( not ( = ?auto_753263 ?auto_753269 ) ) ( not ( = ?auto_753263 ?auto_753270 ) ) ( not ( = ?auto_753263 ?auto_753271 ) ) ( not ( = ?auto_753263 ?auto_753272 ) ) ( not ( = ?auto_753263 ?auto_753273 ) ) ( not ( = ?auto_753264 ?auto_753265 ) ) ( not ( = ?auto_753264 ?auto_753266 ) ) ( not ( = ?auto_753264 ?auto_753267 ) ) ( not ( = ?auto_753264 ?auto_753268 ) ) ( not ( = ?auto_753264 ?auto_753269 ) ) ( not ( = ?auto_753264 ?auto_753270 ) ) ( not ( = ?auto_753264 ?auto_753271 ) ) ( not ( = ?auto_753264 ?auto_753272 ) ) ( not ( = ?auto_753264 ?auto_753273 ) ) ( not ( = ?auto_753265 ?auto_753266 ) ) ( not ( = ?auto_753265 ?auto_753267 ) ) ( not ( = ?auto_753265 ?auto_753268 ) ) ( not ( = ?auto_753265 ?auto_753269 ) ) ( not ( = ?auto_753265 ?auto_753270 ) ) ( not ( = ?auto_753265 ?auto_753271 ) ) ( not ( = ?auto_753265 ?auto_753272 ) ) ( not ( = ?auto_753265 ?auto_753273 ) ) ( not ( = ?auto_753266 ?auto_753267 ) ) ( not ( = ?auto_753266 ?auto_753268 ) ) ( not ( = ?auto_753266 ?auto_753269 ) ) ( not ( = ?auto_753266 ?auto_753270 ) ) ( not ( = ?auto_753266 ?auto_753271 ) ) ( not ( = ?auto_753266 ?auto_753272 ) ) ( not ( = ?auto_753266 ?auto_753273 ) ) ( not ( = ?auto_753267 ?auto_753268 ) ) ( not ( = ?auto_753267 ?auto_753269 ) ) ( not ( = ?auto_753267 ?auto_753270 ) ) ( not ( = ?auto_753267 ?auto_753271 ) ) ( not ( = ?auto_753267 ?auto_753272 ) ) ( not ( = ?auto_753267 ?auto_753273 ) ) ( not ( = ?auto_753268 ?auto_753269 ) ) ( not ( = ?auto_753268 ?auto_753270 ) ) ( not ( = ?auto_753268 ?auto_753271 ) ) ( not ( = ?auto_753268 ?auto_753272 ) ) ( not ( = ?auto_753268 ?auto_753273 ) ) ( not ( = ?auto_753269 ?auto_753270 ) ) ( not ( = ?auto_753269 ?auto_753271 ) ) ( not ( = ?auto_753269 ?auto_753272 ) ) ( not ( = ?auto_753269 ?auto_753273 ) ) ( not ( = ?auto_753270 ?auto_753271 ) ) ( not ( = ?auto_753270 ?auto_753272 ) ) ( not ( = ?auto_753270 ?auto_753273 ) ) ( not ( = ?auto_753271 ?auto_753272 ) ) ( not ( = ?auto_753271 ?auto_753273 ) ) ( not ( = ?auto_753272 ?auto_753273 ) ) ( ON ?auto_753271 ?auto_753272 ) ( ON ?auto_753270 ?auto_753271 ) ( ON ?auto_753269 ?auto_753270 ) ( ON ?auto_753268 ?auto_753269 ) ( ON ?auto_753267 ?auto_753268 ) ( ON ?auto_753266 ?auto_753267 ) ( ON ?auto_753265 ?auto_753266 ) ( CLEAR ?auto_753263 ) ( ON ?auto_753264 ?auto_753265 ) ( CLEAR ?auto_753264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_753258 ?auto_753259 ?auto_753260 ?auto_753261 ?auto_753262 ?auto_753263 ?auto_753264 )
      ( MAKE-15PILE ?auto_753258 ?auto_753259 ?auto_753260 ?auto_753261 ?auto_753262 ?auto_753263 ?auto_753264 ?auto_753265 ?auto_753266 ?auto_753267 ?auto_753268 ?auto_753269 ?auto_753270 ?auto_753271 ?auto_753272 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753320 - BLOCK
      ?auto_753321 - BLOCK
      ?auto_753322 - BLOCK
      ?auto_753323 - BLOCK
      ?auto_753324 - BLOCK
      ?auto_753325 - BLOCK
      ?auto_753326 - BLOCK
      ?auto_753327 - BLOCK
      ?auto_753328 - BLOCK
      ?auto_753329 - BLOCK
      ?auto_753330 - BLOCK
      ?auto_753331 - BLOCK
      ?auto_753332 - BLOCK
      ?auto_753333 - BLOCK
      ?auto_753334 - BLOCK
    )
    :vars
    (
      ?auto_753335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753334 ?auto_753335 ) ( ON-TABLE ?auto_753320 ) ( ON ?auto_753321 ?auto_753320 ) ( ON ?auto_753322 ?auto_753321 ) ( ON ?auto_753323 ?auto_753322 ) ( ON ?auto_753324 ?auto_753323 ) ( not ( = ?auto_753320 ?auto_753321 ) ) ( not ( = ?auto_753320 ?auto_753322 ) ) ( not ( = ?auto_753320 ?auto_753323 ) ) ( not ( = ?auto_753320 ?auto_753324 ) ) ( not ( = ?auto_753320 ?auto_753325 ) ) ( not ( = ?auto_753320 ?auto_753326 ) ) ( not ( = ?auto_753320 ?auto_753327 ) ) ( not ( = ?auto_753320 ?auto_753328 ) ) ( not ( = ?auto_753320 ?auto_753329 ) ) ( not ( = ?auto_753320 ?auto_753330 ) ) ( not ( = ?auto_753320 ?auto_753331 ) ) ( not ( = ?auto_753320 ?auto_753332 ) ) ( not ( = ?auto_753320 ?auto_753333 ) ) ( not ( = ?auto_753320 ?auto_753334 ) ) ( not ( = ?auto_753320 ?auto_753335 ) ) ( not ( = ?auto_753321 ?auto_753322 ) ) ( not ( = ?auto_753321 ?auto_753323 ) ) ( not ( = ?auto_753321 ?auto_753324 ) ) ( not ( = ?auto_753321 ?auto_753325 ) ) ( not ( = ?auto_753321 ?auto_753326 ) ) ( not ( = ?auto_753321 ?auto_753327 ) ) ( not ( = ?auto_753321 ?auto_753328 ) ) ( not ( = ?auto_753321 ?auto_753329 ) ) ( not ( = ?auto_753321 ?auto_753330 ) ) ( not ( = ?auto_753321 ?auto_753331 ) ) ( not ( = ?auto_753321 ?auto_753332 ) ) ( not ( = ?auto_753321 ?auto_753333 ) ) ( not ( = ?auto_753321 ?auto_753334 ) ) ( not ( = ?auto_753321 ?auto_753335 ) ) ( not ( = ?auto_753322 ?auto_753323 ) ) ( not ( = ?auto_753322 ?auto_753324 ) ) ( not ( = ?auto_753322 ?auto_753325 ) ) ( not ( = ?auto_753322 ?auto_753326 ) ) ( not ( = ?auto_753322 ?auto_753327 ) ) ( not ( = ?auto_753322 ?auto_753328 ) ) ( not ( = ?auto_753322 ?auto_753329 ) ) ( not ( = ?auto_753322 ?auto_753330 ) ) ( not ( = ?auto_753322 ?auto_753331 ) ) ( not ( = ?auto_753322 ?auto_753332 ) ) ( not ( = ?auto_753322 ?auto_753333 ) ) ( not ( = ?auto_753322 ?auto_753334 ) ) ( not ( = ?auto_753322 ?auto_753335 ) ) ( not ( = ?auto_753323 ?auto_753324 ) ) ( not ( = ?auto_753323 ?auto_753325 ) ) ( not ( = ?auto_753323 ?auto_753326 ) ) ( not ( = ?auto_753323 ?auto_753327 ) ) ( not ( = ?auto_753323 ?auto_753328 ) ) ( not ( = ?auto_753323 ?auto_753329 ) ) ( not ( = ?auto_753323 ?auto_753330 ) ) ( not ( = ?auto_753323 ?auto_753331 ) ) ( not ( = ?auto_753323 ?auto_753332 ) ) ( not ( = ?auto_753323 ?auto_753333 ) ) ( not ( = ?auto_753323 ?auto_753334 ) ) ( not ( = ?auto_753323 ?auto_753335 ) ) ( not ( = ?auto_753324 ?auto_753325 ) ) ( not ( = ?auto_753324 ?auto_753326 ) ) ( not ( = ?auto_753324 ?auto_753327 ) ) ( not ( = ?auto_753324 ?auto_753328 ) ) ( not ( = ?auto_753324 ?auto_753329 ) ) ( not ( = ?auto_753324 ?auto_753330 ) ) ( not ( = ?auto_753324 ?auto_753331 ) ) ( not ( = ?auto_753324 ?auto_753332 ) ) ( not ( = ?auto_753324 ?auto_753333 ) ) ( not ( = ?auto_753324 ?auto_753334 ) ) ( not ( = ?auto_753324 ?auto_753335 ) ) ( not ( = ?auto_753325 ?auto_753326 ) ) ( not ( = ?auto_753325 ?auto_753327 ) ) ( not ( = ?auto_753325 ?auto_753328 ) ) ( not ( = ?auto_753325 ?auto_753329 ) ) ( not ( = ?auto_753325 ?auto_753330 ) ) ( not ( = ?auto_753325 ?auto_753331 ) ) ( not ( = ?auto_753325 ?auto_753332 ) ) ( not ( = ?auto_753325 ?auto_753333 ) ) ( not ( = ?auto_753325 ?auto_753334 ) ) ( not ( = ?auto_753325 ?auto_753335 ) ) ( not ( = ?auto_753326 ?auto_753327 ) ) ( not ( = ?auto_753326 ?auto_753328 ) ) ( not ( = ?auto_753326 ?auto_753329 ) ) ( not ( = ?auto_753326 ?auto_753330 ) ) ( not ( = ?auto_753326 ?auto_753331 ) ) ( not ( = ?auto_753326 ?auto_753332 ) ) ( not ( = ?auto_753326 ?auto_753333 ) ) ( not ( = ?auto_753326 ?auto_753334 ) ) ( not ( = ?auto_753326 ?auto_753335 ) ) ( not ( = ?auto_753327 ?auto_753328 ) ) ( not ( = ?auto_753327 ?auto_753329 ) ) ( not ( = ?auto_753327 ?auto_753330 ) ) ( not ( = ?auto_753327 ?auto_753331 ) ) ( not ( = ?auto_753327 ?auto_753332 ) ) ( not ( = ?auto_753327 ?auto_753333 ) ) ( not ( = ?auto_753327 ?auto_753334 ) ) ( not ( = ?auto_753327 ?auto_753335 ) ) ( not ( = ?auto_753328 ?auto_753329 ) ) ( not ( = ?auto_753328 ?auto_753330 ) ) ( not ( = ?auto_753328 ?auto_753331 ) ) ( not ( = ?auto_753328 ?auto_753332 ) ) ( not ( = ?auto_753328 ?auto_753333 ) ) ( not ( = ?auto_753328 ?auto_753334 ) ) ( not ( = ?auto_753328 ?auto_753335 ) ) ( not ( = ?auto_753329 ?auto_753330 ) ) ( not ( = ?auto_753329 ?auto_753331 ) ) ( not ( = ?auto_753329 ?auto_753332 ) ) ( not ( = ?auto_753329 ?auto_753333 ) ) ( not ( = ?auto_753329 ?auto_753334 ) ) ( not ( = ?auto_753329 ?auto_753335 ) ) ( not ( = ?auto_753330 ?auto_753331 ) ) ( not ( = ?auto_753330 ?auto_753332 ) ) ( not ( = ?auto_753330 ?auto_753333 ) ) ( not ( = ?auto_753330 ?auto_753334 ) ) ( not ( = ?auto_753330 ?auto_753335 ) ) ( not ( = ?auto_753331 ?auto_753332 ) ) ( not ( = ?auto_753331 ?auto_753333 ) ) ( not ( = ?auto_753331 ?auto_753334 ) ) ( not ( = ?auto_753331 ?auto_753335 ) ) ( not ( = ?auto_753332 ?auto_753333 ) ) ( not ( = ?auto_753332 ?auto_753334 ) ) ( not ( = ?auto_753332 ?auto_753335 ) ) ( not ( = ?auto_753333 ?auto_753334 ) ) ( not ( = ?auto_753333 ?auto_753335 ) ) ( not ( = ?auto_753334 ?auto_753335 ) ) ( ON ?auto_753333 ?auto_753334 ) ( ON ?auto_753332 ?auto_753333 ) ( ON ?auto_753331 ?auto_753332 ) ( ON ?auto_753330 ?auto_753331 ) ( ON ?auto_753329 ?auto_753330 ) ( ON ?auto_753328 ?auto_753329 ) ( ON ?auto_753327 ?auto_753328 ) ( ON ?auto_753326 ?auto_753327 ) ( CLEAR ?auto_753324 ) ( ON ?auto_753325 ?auto_753326 ) ( CLEAR ?auto_753325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_753320 ?auto_753321 ?auto_753322 ?auto_753323 ?auto_753324 ?auto_753325 )
      ( MAKE-15PILE ?auto_753320 ?auto_753321 ?auto_753322 ?auto_753323 ?auto_753324 ?auto_753325 ?auto_753326 ?auto_753327 ?auto_753328 ?auto_753329 ?auto_753330 ?auto_753331 ?auto_753332 ?auto_753333 ?auto_753334 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753382 - BLOCK
      ?auto_753383 - BLOCK
      ?auto_753384 - BLOCK
      ?auto_753385 - BLOCK
      ?auto_753386 - BLOCK
      ?auto_753387 - BLOCK
      ?auto_753388 - BLOCK
      ?auto_753389 - BLOCK
      ?auto_753390 - BLOCK
      ?auto_753391 - BLOCK
      ?auto_753392 - BLOCK
      ?auto_753393 - BLOCK
      ?auto_753394 - BLOCK
      ?auto_753395 - BLOCK
      ?auto_753396 - BLOCK
    )
    :vars
    (
      ?auto_753397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753396 ?auto_753397 ) ( ON-TABLE ?auto_753382 ) ( ON ?auto_753383 ?auto_753382 ) ( ON ?auto_753384 ?auto_753383 ) ( ON ?auto_753385 ?auto_753384 ) ( not ( = ?auto_753382 ?auto_753383 ) ) ( not ( = ?auto_753382 ?auto_753384 ) ) ( not ( = ?auto_753382 ?auto_753385 ) ) ( not ( = ?auto_753382 ?auto_753386 ) ) ( not ( = ?auto_753382 ?auto_753387 ) ) ( not ( = ?auto_753382 ?auto_753388 ) ) ( not ( = ?auto_753382 ?auto_753389 ) ) ( not ( = ?auto_753382 ?auto_753390 ) ) ( not ( = ?auto_753382 ?auto_753391 ) ) ( not ( = ?auto_753382 ?auto_753392 ) ) ( not ( = ?auto_753382 ?auto_753393 ) ) ( not ( = ?auto_753382 ?auto_753394 ) ) ( not ( = ?auto_753382 ?auto_753395 ) ) ( not ( = ?auto_753382 ?auto_753396 ) ) ( not ( = ?auto_753382 ?auto_753397 ) ) ( not ( = ?auto_753383 ?auto_753384 ) ) ( not ( = ?auto_753383 ?auto_753385 ) ) ( not ( = ?auto_753383 ?auto_753386 ) ) ( not ( = ?auto_753383 ?auto_753387 ) ) ( not ( = ?auto_753383 ?auto_753388 ) ) ( not ( = ?auto_753383 ?auto_753389 ) ) ( not ( = ?auto_753383 ?auto_753390 ) ) ( not ( = ?auto_753383 ?auto_753391 ) ) ( not ( = ?auto_753383 ?auto_753392 ) ) ( not ( = ?auto_753383 ?auto_753393 ) ) ( not ( = ?auto_753383 ?auto_753394 ) ) ( not ( = ?auto_753383 ?auto_753395 ) ) ( not ( = ?auto_753383 ?auto_753396 ) ) ( not ( = ?auto_753383 ?auto_753397 ) ) ( not ( = ?auto_753384 ?auto_753385 ) ) ( not ( = ?auto_753384 ?auto_753386 ) ) ( not ( = ?auto_753384 ?auto_753387 ) ) ( not ( = ?auto_753384 ?auto_753388 ) ) ( not ( = ?auto_753384 ?auto_753389 ) ) ( not ( = ?auto_753384 ?auto_753390 ) ) ( not ( = ?auto_753384 ?auto_753391 ) ) ( not ( = ?auto_753384 ?auto_753392 ) ) ( not ( = ?auto_753384 ?auto_753393 ) ) ( not ( = ?auto_753384 ?auto_753394 ) ) ( not ( = ?auto_753384 ?auto_753395 ) ) ( not ( = ?auto_753384 ?auto_753396 ) ) ( not ( = ?auto_753384 ?auto_753397 ) ) ( not ( = ?auto_753385 ?auto_753386 ) ) ( not ( = ?auto_753385 ?auto_753387 ) ) ( not ( = ?auto_753385 ?auto_753388 ) ) ( not ( = ?auto_753385 ?auto_753389 ) ) ( not ( = ?auto_753385 ?auto_753390 ) ) ( not ( = ?auto_753385 ?auto_753391 ) ) ( not ( = ?auto_753385 ?auto_753392 ) ) ( not ( = ?auto_753385 ?auto_753393 ) ) ( not ( = ?auto_753385 ?auto_753394 ) ) ( not ( = ?auto_753385 ?auto_753395 ) ) ( not ( = ?auto_753385 ?auto_753396 ) ) ( not ( = ?auto_753385 ?auto_753397 ) ) ( not ( = ?auto_753386 ?auto_753387 ) ) ( not ( = ?auto_753386 ?auto_753388 ) ) ( not ( = ?auto_753386 ?auto_753389 ) ) ( not ( = ?auto_753386 ?auto_753390 ) ) ( not ( = ?auto_753386 ?auto_753391 ) ) ( not ( = ?auto_753386 ?auto_753392 ) ) ( not ( = ?auto_753386 ?auto_753393 ) ) ( not ( = ?auto_753386 ?auto_753394 ) ) ( not ( = ?auto_753386 ?auto_753395 ) ) ( not ( = ?auto_753386 ?auto_753396 ) ) ( not ( = ?auto_753386 ?auto_753397 ) ) ( not ( = ?auto_753387 ?auto_753388 ) ) ( not ( = ?auto_753387 ?auto_753389 ) ) ( not ( = ?auto_753387 ?auto_753390 ) ) ( not ( = ?auto_753387 ?auto_753391 ) ) ( not ( = ?auto_753387 ?auto_753392 ) ) ( not ( = ?auto_753387 ?auto_753393 ) ) ( not ( = ?auto_753387 ?auto_753394 ) ) ( not ( = ?auto_753387 ?auto_753395 ) ) ( not ( = ?auto_753387 ?auto_753396 ) ) ( not ( = ?auto_753387 ?auto_753397 ) ) ( not ( = ?auto_753388 ?auto_753389 ) ) ( not ( = ?auto_753388 ?auto_753390 ) ) ( not ( = ?auto_753388 ?auto_753391 ) ) ( not ( = ?auto_753388 ?auto_753392 ) ) ( not ( = ?auto_753388 ?auto_753393 ) ) ( not ( = ?auto_753388 ?auto_753394 ) ) ( not ( = ?auto_753388 ?auto_753395 ) ) ( not ( = ?auto_753388 ?auto_753396 ) ) ( not ( = ?auto_753388 ?auto_753397 ) ) ( not ( = ?auto_753389 ?auto_753390 ) ) ( not ( = ?auto_753389 ?auto_753391 ) ) ( not ( = ?auto_753389 ?auto_753392 ) ) ( not ( = ?auto_753389 ?auto_753393 ) ) ( not ( = ?auto_753389 ?auto_753394 ) ) ( not ( = ?auto_753389 ?auto_753395 ) ) ( not ( = ?auto_753389 ?auto_753396 ) ) ( not ( = ?auto_753389 ?auto_753397 ) ) ( not ( = ?auto_753390 ?auto_753391 ) ) ( not ( = ?auto_753390 ?auto_753392 ) ) ( not ( = ?auto_753390 ?auto_753393 ) ) ( not ( = ?auto_753390 ?auto_753394 ) ) ( not ( = ?auto_753390 ?auto_753395 ) ) ( not ( = ?auto_753390 ?auto_753396 ) ) ( not ( = ?auto_753390 ?auto_753397 ) ) ( not ( = ?auto_753391 ?auto_753392 ) ) ( not ( = ?auto_753391 ?auto_753393 ) ) ( not ( = ?auto_753391 ?auto_753394 ) ) ( not ( = ?auto_753391 ?auto_753395 ) ) ( not ( = ?auto_753391 ?auto_753396 ) ) ( not ( = ?auto_753391 ?auto_753397 ) ) ( not ( = ?auto_753392 ?auto_753393 ) ) ( not ( = ?auto_753392 ?auto_753394 ) ) ( not ( = ?auto_753392 ?auto_753395 ) ) ( not ( = ?auto_753392 ?auto_753396 ) ) ( not ( = ?auto_753392 ?auto_753397 ) ) ( not ( = ?auto_753393 ?auto_753394 ) ) ( not ( = ?auto_753393 ?auto_753395 ) ) ( not ( = ?auto_753393 ?auto_753396 ) ) ( not ( = ?auto_753393 ?auto_753397 ) ) ( not ( = ?auto_753394 ?auto_753395 ) ) ( not ( = ?auto_753394 ?auto_753396 ) ) ( not ( = ?auto_753394 ?auto_753397 ) ) ( not ( = ?auto_753395 ?auto_753396 ) ) ( not ( = ?auto_753395 ?auto_753397 ) ) ( not ( = ?auto_753396 ?auto_753397 ) ) ( ON ?auto_753395 ?auto_753396 ) ( ON ?auto_753394 ?auto_753395 ) ( ON ?auto_753393 ?auto_753394 ) ( ON ?auto_753392 ?auto_753393 ) ( ON ?auto_753391 ?auto_753392 ) ( ON ?auto_753390 ?auto_753391 ) ( ON ?auto_753389 ?auto_753390 ) ( ON ?auto_753388 ?auto_753389 ) ( ON ?auto_753387 ?auto_753388 ) ( CLEAR ?auto_753385 ) ( ON ?auto_753386 ?auto_753387 ) ( CLEAR ?auto_753386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_753382 ?auto_753383 ?auto_753384 ?auto_753385 ?auto_753386 )
      ( MAKE-15PILE ?auto_753382 ?auto_753383 ?auto_753384 ?auto_753385 ?auto_753386 ?auto_753387 ?auto_753388 ?auto_753389 ?auto_753390 ?auto_753391 ?auto_753392 ?auto_753393 ?auto_753394 ?auto_753395 ?auto_753396 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753444 - BLOCK
      ?auto_753445 - BLOCK
      ?auto_753446 - BLOCK
      ?auto_753447 - BLOCK
      ?auto_753448 - BLOCK
      ?auto_753449 - BLOCK
      ?auto_753450 - BLOCK
      ?auto_753451 - BLOCK
      ?auto_753452 - BLOCK
      ?auto_753453 - BLOCK
      ?auto_753454 - BLOCK
      ?auto_753455 - BLOCK
      ?auto_753456 - BLOCK
      ?auto_753457 - BLOCK
      ?auto_753458 - BLOCK
    )
    :vars
    (
      ?auto_753459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753458 ?auto_753459 ) ( ON-TABLE ?auto_753444 ) ( ON ?auto_753445 ?auto_753444 ) ( ON ?auto_753446 ?auto_753445 ) ( not ( = ?auto_753444 ?auto_753445 ) ) ( not ( = ?auto_753444 ?auto_753446 ) ) ( not ( = ?auto_753444 ?auto_753447 ) ) ( not ( = ?auto_753444 ?auto_753448 ) ) ( not ( = ?auto_753444 ?auto_753449 ) ) ( not ( = ?auto_753444 ?auto_753450 ) ) ( not ( = ?auto_753444 ?auto_753451 ) ) ( not ( = ?auto_753444 ?auto_753452 ) ) ( not ( = ?auto_753444 ?auto_753453 ) ) ( not ( = ?auto_753444 ?auto_753454 ) ) ( not ( = ?auto_753444 ?auto_753455 ) ) ( not ( = ?auto_753444 ?auto_753456 ) ) ( not ( = ?auto_753444 ?auto_753457 ) ) ( not ( = ?auto_753444 ?auto_753458 ) ) ( not ( = ?auto_753444 ?auto_753459 ) ) ( not ( = ?auto_753445 ?auto_753446 ) ) ( not ( = ?auto_753445 ?auto_753447 ) ) ( not ( = ?auto_753445 ?auto_753448 ) ) ( not ( = ?auto_753445 ?auto_753449 ) ) ( not ( = ?auto_753445 ?auto_753450 ) ) ( not ( = ?auto_753445 ?auto_753451 ) ) ( not ( = ?auto_753445 ?auto_753452 ) ) ( not ( = ?auto_753445 ?auto_753453 ) ) ( not ( = ?auto_753445 ?auto_753454 ) ) ( not ( = ?auto_753445 ?auto_753455 ) ) ( not ( = ?auto_753445 ?auto_753456 ) ) ( not ( = ?auto_753445 ?auto_753457 ) ) ( not ( = ?auto_753445 ?auto_753458 ) ) ( not ( = ?auto_753445 ?auto_753459 ) ) ( not ( = ?auto_753446 ?auto_753447 ) ) ( not ( = ?auto_753446 ?auto_753448 ) ) ( not ( = ?auto_753446 ?auto_753449 ) ) ( not ( = ?auto_753446 ?auto_753450 ) ) ( not ( = ?auto_753446 ?auto_753451 ) ) ( not ( = ?auto_753446 ?auto_753452 ) ) ( not ( = ?auto_753446 ?auto_753453 ) ) ( not ( = ?auto_753446 ?auto_753454 ) ) ( not ( = ?auto_753446 ?auto_753455 ) ) ( not ( = ?auto_753446 ?auto_753456 ) ) ( not ( = ?auto_753446 ?auto_753457 ) ) ( not ( = ?auto_753446 ?auto_753458 ) ) ( not ( = ?auto_753446 ?auto_753459 ) ) ( not ( = ?auto_753447 ?auto_753448 ) ) ( not ( = ?auto_753447 ?auto_753449 ) ) ( not ( = ?auto_753447 ?auto_753450 ) ) ( not ( = ?auto_753447 ?auto_753451 ) ) ( not ( = ?auto_753447 ?auto_753452 ) ) ( not ( = ?auto_753447 ?auto_753453 ) ) ( not ( = ?auto_753447 ?auto_753454 ) ) ( not ( = ?auto_753447 ?auto_753455 ) ) ( not ( = ?auto_753447 ?auto_753456 ) ) ( not ( = ?auto_753447 ?auto_753457 ) ) ( not ( = ?auto_753447 ?auto_753458 ) ) ( not ( = ?auto_753447 ?auto_753459 ) ) ( not ( = ?auto_753448 ?auto_753449 ) ) ( not ( = ?auto_753448 ?auto_753450 ) ) ( not ( = ?auto_753448 ?auto_753451 ) ) ( not ( = ?auto_753448 ?auto_753452 ) ) ( not ( = ?auto_753448 ?auto_753453 ) ) ( not ( = ?auto_753448 ?auto_753454 ) ) ( not ( = ?auto_753448 ?auto_753455 ) ) ( not ( = ?auto_753448 ?auto_753456 ) ) ( not ( = ?auto_753448 ?auto_753457 ) ) ( not ( = ?auto_753448 ?auto_753458 ) ) ( not ( = ?auto_753448 ?auto_753459 ) ) ( not ( = ?auto_753449 ?auto_753450 ) ) ( not ( = ?auto_753449 ?auto_753451 ) ) ( not ( = ?auto_753449 ?auto_753452 ) ) ( not ( = ?auto_753449 ?auto_753453 ) ) ( not ( = ?auto_753449 ?auto_753454 ) ) ( not ( = ?auto_753449 ?auto_753455 ) ) ( not ( = ?auto_753449 ?auto_753456 ) ) ( not ( = ?auto_753449 ?auto_753457 ) ) ( not ( = ?auto_753449 ?auto_753458 ) ) ( not ( = ?auto_753449 ?auto_753459 ) ) ( not ( = ?auto_753450 ?auto_753451 ) ) ( not ( = ?auto_753450 ?auto_753452 ) ) ( not ( = ?auto_753450 ?auto_753453 ) ) ( not ( = ?auto_753450 ?auto_753454 ) ) ( not ( = ?auto_753450 ?auto_753455 ) ) ( not ( = ?auto_753450 ?auto_753456 ) ) ( not ( = ?auto_753450 ?auto_753457 ) ) ( not ( = ?auto_753450 ?auto_753458 ) ) ( not ( = ?auto_753450 ?auto_753459 ) ) ( not ( = ?auto_753451 ?auto_753452 ) ) ( not ( = ?auto_753451 ?auto_753453 ) ) ( not ( = ?auto_753451 ?auto_753454 ) ) ( not ( = ?auto_753451 ?auto_753455 ) ) ( not ( = ?auto_753451 ?auto_753456 ) ) ( not ( = ?auto_753451 ?auto_753457 ) ) ( not ( = ?auto_753451 ?auto_753458 ) ) ( not ( = ?auto_753451 ?auto_753459 ) ) ( not ( = ?auto_753452 ?auto_753453 ) ) ( not ( = ?auto_753452 ?auto_753454 ) ) ( not ( = ?auto_753452 ?auto_753455 ) ) ( not ( = ?auto_753452 ?auto_753456 ) ) ( not ( = ?auto_753452 ?auto_753457 ) ) ( not ( = ?auto_753452 ?auto_753458 ) ) ( not ( = ?auto_753452 ?auto_753459 ) ) ( not ( = ?auto_753453 ?auto_753454 ) ) ( not ( = ?auto_753453 ?auto_753455 ) ) ( not ( = ?auto_753453 ?auto_753456 ) ) ( not ( = ?auto_753453 ?auto_753457 ) ) ( not ( = ?auto_753453 ?auto_753458 ) ) ( not ( = ?auto_753453 ?auto_753459 ) ) ( not ( = ?auto_753454 ?auto_753455 ) ) ( not ( = ?auto_753454 ?auto_753456 ) ) ( not ( = ?auto_753454 ?auto_753457 ) ) ( not ( = ?auto_753454 ?auto_753458 ) ) ( not ( = ?auto_753454 ?auto_753459 ) ) ( not ( = ?auto_753455 ?auto_753456 ) ) ( not ( = ?auto_753455 ?auto_753457 ) ) ( not ( = ?auto_753455 ?auto_753458 ) ) ( not ( = ?auto_753455 ?auto_753459 ) ) ( not ( = ?auto_753456 ?auto_753457 ) ) ( not ( = ?auto_753456 ?auto_753458 ) ) ( not ( = ?auto_753456 ?auto_753459 ) ) ( not ( = ?auto_753457 ?auto_753458 ) ) ( not ( = ?auto_753457 ?auto_753459 ) ) ( not ( = ?auto_753458 ?auto_753459 ) ) ( ON ?auto_753457 ?auto_753458 ) ( ON ?auto_753456 ?auto_753457 ) ( ON ?auto_753455 ?auto_753456 ) ( ON ?auto_753454 ?auto_753455 ) ( ON ?auto_753453 ?auto_753454 ) ( ON ?auto_753452 ?auto_753453 ) ( ON ?auto_753451 ?auto_753452 ) ( ON ?auto_753450 ?auto_753451 ) ( ON ?auto_753449 ?auto_753450 ) ( ON ?auto_753448 ?auto_753449 ) ( CLEAR ?auto_753446 ) ( ON ?auto_753447 ?auto_753448 ) ( CLEAR ?auto_753447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_753444 ?auto_753445 ?auto_753446 ?auto_753447 )
      ( MAKE-15PILE ?auto_753444 ?auto_753445 ?auto_753446 ?auto_753447 ?auto_753448 ?auto_753449 ?auto_753450 ?auto_753451 ?auto_753452 ?auto_753453 ?auto_753454 ?auto_753455 ?auto_753456 ?auto_753457 ?auto_753458 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753506 - BLOCK
      ?auto_753507 - BLOCK
      ?auto_753508 - BLOCK
      ?auto_753509 - BLOCK
      ?auto_753510 - BLOCK
      ?auto_753511 - BLOCK
      ?auto_753512 - BLOCK
      ?auto_753513 - BLOCK
      ?auto_753514 - BLOCK
      ?auto_753515 - BLOCK
      ?auto_753516 - BLOCK
      ?auto_753517 - BLOCK
      ?auto_753518 - BLOCK
      ?auto_753519 - BLOCK
      ?auto_753520 - BLOCK
    )
    :vars
    (
      ?auto_753521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753520 ?auto_753521 ) ( ON-TABLE ?auto_753506 ) ( ON ?auto_753507 ?auto_753506 ) ( not ( = ?auto_753506 ?auto_753507 ) ) ( not ( = ?auto_753506 ?auto_753508 ) ) ( not ( = ?auto_753506 ?auto_753509 ) ) ( not ( = ?auto_753506 ?auto_753510 ) ) ( not ( = ?auto_753506 ?auto_753511 ) ) ( not ( = ?auto_753506 ?auto_753512 ) ) ( not ( = ?auto_753506 ?auto_753513 ) ) ( not ( = ?auto_753506 ?auto_753514 ) ) ( not ( = ?auto_753506 ?auto_753515 ) ) ( not ( = ?auto_753506 ?auto_753516 ) ) ( not ( = ?auto_753506 ?auto_753517 ) ) ( not ( = ?auto_753506 ?auto_753518 ) ) ( not ( = ?auto_753506 ?auto_753519 ) ) ( not ( = ?auto_753506 ?auto_753520 ) ) ( not ( = ?auto_753506 ?auto_753521 ) ) ( not ( = ?auto_753507 ?auto_753508 ) ) ( not ( = ?auto_753507 ?auto_753509 ) ) ( not ( = ?auto_753507 ?auto_753510 ) ) ( not ( = ?auto_753507 ?auto_753511 ) ) ( not ( = ?auto_753507 ?auto_753512 ) ) ( not ( = ?auto_753507 ?auto_753513 ) ) ( not ( = ?auto_753507 ?auto_753514 ) ) ( not ( = ?auto_753507 ?auto_753515 ) ) ( not ( = ?auto_753507 ?auto_753516 ) ) ( not ( = ?auto_753507 ?auto_753517 ) ) ( not ( = ?auto_753507 ?auto_753518 ) ) ( not ( = ?auto_753507 ?auto_753519 ) ) ( not ( = ?auto_753507 ?auto_753520 ) ) ( not ( = ?auto_753507 ?auto_753521 ) ) ( not ( = ?auto_753508 ?auto_753509 ) ) ( not ( = ?auto_753508 ?auto_753510 ) ) ( not ( = ?auto_753508 ?auto_753511 ) ) ( not ( = ?auto_753508 ?auto_753512 ) ) ( not ( = ?auto_753508 ?auto_753513 ) ) ( not ( = ?auto_753508 ?auto_753514 ) ) ( not ( = ?auto_753508 ?auto_753515 ) ) ( not ( = ?auto_753508 ?auto_753516 ) ) ( not ( = ?auto_753508 ?auto_753517 ) ) ( not ( = ?auto_753508 ?auto_753518 ) ) ( not ( = ?auto_753508 ?auto_753519 ) ) ( not ( = ?auto_753508 ?auto_753520 ) ) ( not ( = ?auto_753508 ?auto_753521 ) ) ( not ( = ?auto_753509 ?auto_753510 ) ) ( not ( = ?auto_753509 ?auto_753511 ) ) ( not ( = ?auto_753509 ?auto_753512 ) ) ( not ( = ?auto_753509 ?auto_753513 ) ) ( not ( = ?auto_753509 ?auto_753514 ) ) ( not ( = ?auto_753509 ?auto_753515 ) ) ( not ( = ?auto_753509 ?auto_753516 ) ) ( not ( = ?auto_753509 ?auto_753517 ) ) ( not ( = ?auto_753509 ?auto_753518 ) ) ( not ( = ?auto_753509 ?auto_753519 ) ) ( not ( = ?auto_753509 ?auto_753520 ) ) ( not ( = ?auto_753509 ?auto_753521 ) ) ( not ( = ?auto_753510 ?auto_753511 ) ) ( not ( = ?auto_753510 ?auto_753512 ) ) ( not ( = ?auto_753510 ?auto_753513 ) ) ( not ( = ?auto_753510 ?auto_753514 ) ) ( not ( = ?auto_753510 ?auto_753515 ) ) ( not ( = ?auto_753510 ?auto_753516 ) ) ( not ( = ?auto_753510 ?auto_753517 ) ) ( not ( = ?auto_753510 ?auto_753518 ) ) ( not ( = ?auto_753510 ?auto_753519 ) ) ( not ( = ?auto_753510 ?auto_753520 ) ) ( not ( = ?auto_753510 ?auto_753521 ) ) ( not ( = ?auto_753511 ?auto_753512 ) ) ( not ( = ?auto_753511 ?auto_753513 ) ) ( not ( = ?auto_753511 ?auto_753514 ) ) ( not ( = ?auto_753511 ?auto_753515 ) ) ( not ( = ?auto_753511 ?auto_753516 ) ) ( not ( = ?auto_753511 ?auto_753517 ) ) ( not ( = ?auto_753511 ?auto_753518 ) ) ( not ( = ?auto_753511 ?auto_753519 ) ) ( not ( = ?auto_753511 ?auto_753520 ) ) ( not ( = ?auto_753511 ?auto_753521 ) ) ( not ( = ?auto_753512 ?auto_753513 ) ) ( not ( = ?auto_753512 ?auto_753514 ) ) ( not ( = ?auto_753512 ?auto_753515 ) ) ( not ( = ?auto_753512 ?auto_753516 ) ) ( not ( = ?auto_753512 ?auto_753517 ) ) ( not ( = ?auto_753512 ?auto_753518 ) ) ( not ( = ?auto_753512 ?auto_753519 ) ) ( not ( = ?auto_753512 ?auto_753520 ) ) ( not ( = ?auto_753512 ?auto_753521 ) ) ( not ( = ?auto_753513 ?auto_753514 ) ) ( not ( = ?auto_753513 ?auto_753515 ) ) ( not ( = ?auto_753513 ?auto_753516 ) ) ( not ( = ?auto_753513 ?auto_753517 ) ) ( not ( = ?auto_753513 ?auto_753518 ) ) ( not ( = ?auto_753513 ?auto_753519 ) ) ( not ( = ?auto_753513 ?auto_753520 ) ) ( not ( = ?auto_753513 ?auto_753521 ) ) ( not ( = ?auto_753514 ?auto_753515 ) ) ( not ( = ?auto_753514 ?auto_753516 ) ) ( not ( = ?auto_753514 ?auto_753517 ) ) ( not ( = ?auto_753514 ?auto_753518 ) ) ( not ( = ?auto_753514 ?auto_753519 ) ) ( not ( = ?auto_753514 ?auto_753520 ) ) ( not ( = ?auto_753514 ?auto_753521 ) ) ( not ( = ?auto_753515 ?auto_753516 ) ) ( not ( = ?auto_753515 ?auto_753517 ) ) ( not ( = ?auto_753515 ?auto_753518 ) ) ( not ( = ?auto_753515 ?auto_753519 ) ) ( not ( = ?auto_753515 ?auto_753520 ) ) ( not ( = ?auto_753515 ?auto_753521 ) ) ( not ( = ?auto_753516 ?auto_753517 ) ) ( not ( = ?auto_753516 ?auto_753518 ) ) ( not ( = ?auto_753516 ?auto_753519 ) ) ( not ( = ?auto_753516 ?auto_753520 ) ) ( not ( = ?auto_753516 ?auto_753521 ) ) ( not ( = ?auto_753517 ?auto_753518 ) ) ( not ( = ?auto_753517 ?auto_753519 ) ) ( not ( = ?auto_753517 ?auto_753520 ) ) ( not ( = ?auto_753517 ?auto_753521 ) ) ( not ( = ?auto_753518 ?auto_753519 ) ) ( not ( = ?auto_753518 ?auto_753520 ) ) ( not ( = ?auto_753518 ?auto_753521 ) ) ( not ( = ?auto_753519 ?auto_753520 ) ) ( not ( = ?auto_753519 ?auto_753521 ) ) ( not ( = ?auto_753520 ?auto_753521 ) ) ( ON ?auto_753519 ?auto_753520 ) ( ON ?auto_753518 ?auto_753519 ) ( ON ?auto_753517 ?auto_753518 ) ( ON ?auto_753516 ?auto_753517 ) ( ON ?auto_753515 ?auto_753516 ) ( ON ?auto_753514 ?auto_753515 ) ( ON ?auto_753513 ?auto_753514 ) ( ON ?auto_753512 ?auto_753513 ) ( ON ?auto_753511 ?auto_753512 ) ( ON ?auto_753510 ?auto_753511 ) ( ON ?auto_753509 ?auto_753510 ) ( CLEAR ?auto_753507 ) ( ON ?auto_753508 ?auto_753509 ) ( CLEAR ?auto_753508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_753506 ?auto_753507 ?auto_753508 )
      ( MAKE-15PILE ?auto_753506 ?auto_753507 ?auto_753508 ?auto_753509 ?auto_753510 ?auto_753511 ?auto_753512 ?auto_753513 ?auto_753514 ?auto_753515 ?auto_753516 ?auto_753517 ?auto_753518 ?auto_753519 ?auto_753520 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753568 - BLOCK
      ?auto_753569 - BLOCK
      ?auto_753570 - BLOCK
      ?auto_753571 - BLOCK
      ?auto_753572 - BLOCK
      ?auto_753573 - BLOCK
      ?auto_753574 - BLOCK
      ?auto_753575 - BLOCK
      ?auto_753576 - BLOCK
      ?auto_753577 - BLOCK
      ?auto_753578 - BLOCK
      ?auto_753579 - BLOCK
      ?auto_753580 - BLOCK
      ?auto_753581 - BLOCK
      ?auto_753582 - BLOCK
    )
    :vars
    (
      ?auto_753583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753582 ?auto_753583 ) ( ON-TABLE ?auto_753568 ) ( not ( = ?auto_753568 ?auto_753569 ) ) ( not ( = ?auto_753568 ?auto_753570 ) ) ( not ( = ?auto_753568 ?auto_753571 ) ) ( not ( = ?auto_753568 ?auto_753572 ) ) ( not ( = ?auto_753568 ?auto_753573 ) ) ( not ( = ?auto_753568 ?auto_753574 ) ) ( not ( = ?auto_753568 ?auto_753575 ) ) ( not ( = ?auto_753568 ?auto_753576 ) ) ( not ( = ?auto_753568 ?auto_753577 ) ) ( not ( = ?auto_753568 ?auto_753578 ) ) ( not ( = ?auto_753568 ?auto_753579 ) ) ( not ( = ?auto_753568 ?auto_753580 ) ) ( not ( = ?auto_753568 ?auto_753581 ) ) ( not ( = ?auto_753568 ?auto_753582 ) ) ( not ( = ?auto_753568 ?auto_753583 ) ) ( not ( = ?auto_753569 ?auto_753570 ) ) ( not ( = ?auto_753569 ?auto_753571 ) ) ( not ( = ?auto_753569 ?auto_753572 ) ) ( not ( = ?auto_753569 ?auto_753573 ) ) ( not ( = ?auto_753569 ?auto_753574 ) ) ( not ( = ?auto_753569 ?auto_753575 ) ) ( not ( = ?auto_753569 ?auto_753576 ) ) ( not ( = ?auto_753569 ?auto_753577 ) ) ( not ( = ?auto_753569 ?auto_753578 ) ) ( not ( = ?auto_753569 ?auto_753579 ) ) ( not ( = ?auto_753569 ?auto_753580 ) ) ( not ( = ?auto_753569 ?auto_753581 ) ) ( not ( = ?auto_753569 ?auto_753582 ) ) ( not ( = ?auto_753569 ?auto_753583 ) ) ( not ( = ?auto_753570 ?auto_753571 ) ) ( not ( = ?auto_753570 ?auto_753572 ) ) ( not ( = ?auto_753570 ?auto_753573 ) ) ( not ( = ?auto_753570 ?auto_753574 ) ) ( not ( = ?auto_753570 ?auto_753575 ) ) ( not ( = ?auto_753570 ?auto_753576 ) ) ( not ( = ?auto_753570 ?auto_753577 ) ) ( not ( = ?auto_753570 ?auto_753578 ) ) ( not ( = ?auto_753570 ?auto_753579 ) ) ( not ( = ?auto_753570 ?auto_753580 ) ) ( not ( = ?auto_753570 ?auto_753581 ) ) ( not ( = ?auto_753570 ?auto_753582 ) ) ( not ( = ?auto_753570 ?auto_753583 ) ) ( not ( = ?auto_753571 ?auto_753572 ) ) ( not ( = ?auto_753571 ?auto_753573 ) ) ( not ( = ?auto_753571 ?auto_753574 ) ) ( not ( = ?auto_753571 ?auto_753575 ) ) ( not ( = ?auto_753571 ?auto_753576 ) ) ( not ( = ?auto_753571 ?auto_753577 ) ) ( not ( = ?auto_753571 ?auto_753578 ) ) ( not ( = ?auto_753571 ?auto_753579 ) ) ( not ( = ?auto_753571 ?auto_753580 ) ) ( not ( = ?auto_753571 ?auto_753581 ) ) ( not ( = ?auto_753571 ?auto_753582 ) ) ( not ( = ?auto_753571 ?auto_753583 ) ) ( not ( = ?auto_753572 ?auto_753573 ) ) ( not ( = ?auto_753572 ?auto_753574 ) ) ( not ( = ?auto_753572 ?auto_753575 ) ) ( not ( = ?auto_753572 ?auto_753576 ) ) ( not ( = ?auto_753572 ?auto_753577 ) ) ( not ( = ?auto_753572 ?auto_753578 ) ) ( not ( = ?auto_753572 ?auto_753579 ) ) ( not ( = ?auto_753572 ?auto_753580 ) ) ( not ( = ?auto_753572 ?auto_753581 ) ) ( not ( = ?auto_753572 ?auto_753582 ) ) ( not ( = ?auto_753572 ?auto_753583 ) ) ( not ( = ?auto_753573 ?auto_753574 ) ) ( not ( = ?auto_753573 ?auto_753575 ) ) ( not ( = ?auto_753573 ?auto_753576 ) ) ( not ( = ?auto_753573 ?auto_753577 ) ) ( not ( = ?auto_753573 ?auto_753578 ) ) ( not ( = ?auto_753573 ?auto_753579 ) ) ( not ( = ?auto_753573 ?auto_753580 ) ) ( not ( = ?auto_753573 ?auto_753581 ) ) ( not ( = ?auto_753573 ?auto_753582 ) ) ( not ( = ?auto_753573 ?auto_753583 ) ) ( not ( = ?auto_753574 ?auto_753575 ) ) ( not ( = ?auto_753574 ?auto_753576 ) ) ( not ( = ?auto_753574 ?auto_753577 ) ) ( not ( = ?auto_753574 ?auto_753578 ) ) ( not ( = ?auto_753574 ?auto_753579 ) ) ( not ( = ?auto_753574 ?auto_753580 ) ) ( not ( = ?auto_753574 ?auto_753581 ) ) ( not ( = ?auto_753574 ?auto_753582 ) ) ( not ( = ?auto_753574 ?auto_753583 ) ) ( not ( = ?auto_753575 ?auto_753576 ) ) ( not ( = ?auto_753575 ?auto_753577 ) ) ( not ( = ?auto_753575 ?auto_753578 ) ) ( not ( = ?auto_753575 ?auto_753579 ) ) ( not ( = ?auto_753575 ?auto_753580 ) ) ( not ( = ?auto_753575 ?auto_753581 ) ) ( not ( = ?auto_753575 ?auto_753582 ) ) ( not ( = ?auto_753575 ?auto_753583 ) ) ( not ( = ?auto_753576 ?auto_753577 ) ) ( not ( = ?auto_753576 ?auto_753578 ) ) ( not ( = ?auto_753576 ?auto_753579 ) ) ( not ( = ?auto_753576 ?auto_753580 ) ) ( not ( = ?auto_753576 ?auto_753581 ) ) ( not ( = ?auto_753576 ?auto_753582 ) ) ( not ( = ?auto_753576 ?auto_753583 ) ) ( not ( = ?auto_753577 ?auto_753578 ) ) ( not ( = ?auto_753577 ?auto_753579 ) ) ( not ( = ?auto_753577 ?auto_753580 ) ) ( not ( = ?auto_753577 ?auto_753581 ) ) ( not ( = ?auto_753577 ?auto_753582 ) ) ( not ( = ?auto_753577 ?auto_753583 ) ) ( not ( = ?auto_753578 ?auto_753579 ) ) ( not ( = ?auto_753578 ?auto_753580 ) ) ( not ( = ?auto_753578 ?auto_753581 ) ) ( not ( = ?auto_753578 ?auto_753582 ) ) ( not ( = ?auto_753578 ?auto_753583 ) ) ( not ( = ?auto_753579 ?auto_753580 ) ) ( not ( = ?auto_753579 ?auto_753581 ) ) ( not ( = ?auto_753579 ?auto_753582 ) ) ( not ( = ?auto_753579 ?auto_753583 ) ) ( not ( = ?auto_753580 ?auto_753581 ) ) ( not ( = ?auto_753580 ?auto_753582 ) ) ( not ( = ?auto_753580 ?auto_753583 ) ) ( not ( = ?auto_753581 ?auto_753582 ) ) ( not ( = ?auto_753581 ?auto_753583 ) ) ( not ( = ?auto_753582 ?auto_753583 ) ) ( ON ?auto_753581 ?auto_753582 ) ( ON ?auto_753580 ?auto_753581 ) ( ON ?auto_753579 ?auto_753580 ) ( ON ?auto_753578 ?auto_753579 ) ( ON ?auto_753577 ?auto_753578 ) ( ON ?auto_753576 ?auto_753577 ) ( ON ?auto_753575 ?auto_753576 ) ( ON ?auto_753574 ?auto_753575 ) ( ON ?auto_753573 ?auto_753574 ) ( ON ?auto_753572 ?auto_753573 ) ( ON ?auto_753571 ?auto_753572 ) ( ON ?auto_753570 ?auto_753571 ) ( CLEAR ?auto_753568 ) ( ON ?auto_753569 ?auto_753570 ) ( CLEAR ?auto_753569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_753568 ?auto_753569 )
      ( MAKE-15PILE ?auto_753568 ?auto_753569 ?auto_753570 ?auto_753571 ?auto_753572 ?auto_753573 ?auto_753574 ?auto_753575 ?auto_753576 ?auto_753577 ?auto_753578 ?auto_753579 ?auto_753580 ?auto_753581 ?auto_753582 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_753630 - BLOCK
      ?auto_753631 - BLOCK
      ?auto_753632 - BLOCK
      ?auto_753633 - BLOCK
      ?auto_753634 - BLOCK
      ?auto_753635 - BLOCK
      ?auto_753636 - BLOCK
      ?auto_753637 - BLOCK
      ?auto_753638 - BLOCK
      ?auto_753639 - BLOCK
      ?auto_753640 - BLOCK
      ?auto_753641 - BLOCK
      ?auto_753642 - BLOCK
      ?auto_753643 - BLOCK
      ?auto_753644 - BLOCK
    )
    :vars
    (
      ?auto_753645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753644 ?auto_753645 ) ( not ( = ?auto_753630 ?auto_753631 ) ) ( not ( = ?auto_753630 ?auto_753632 ) ) ( not ( = ?auto_753630 ?auto_753633 ) ) ( not ( = ?auto_753630 ?auto_753634 ) ) ( not ( = ?auto_753630 ?auto_753635 ) ) ( not ( = ?auto_753630 ?auto_753636 ) ) ( not ( = ?auto_753630 ?auto_753637 ) ) ( not ( = ?auto_753630 ?auto_753638 ) ) ( not ( = ?auto_753630 ?auto_753639 ) ) ( not ( = ?auto_753630 ?auto_753640 ) ) ( not ( = ?auto_753630 ?auto_753641 ) ) ( not ( = ?auto_753630 ?auto_753642 ) ) ( not ( = ?auto_753630 ?auto_753643 ) ) ( not ( = ?auto_753630 ?auto_753644 ) ) ( not ( = ?auto_753630 ?auto_753645 ) ) ( not ( = ?auto_753631 ?auto_753632 ) ) ( not ( = ?auto_753631 ?auto_753633 ) ) ( not ( = ?auto_753631 ?auto_753634 ) ) ( not ( = ?auto_753631 ?auto_753635 ) ) ( not ( = ?auto_753631 ?auto_753636 ) ) ( not ( = ?auto_753631 ?auto_753637 ) ) ( not ( = ?auto_753631 ?auto_753638 ) ) ( not ( = ?auto_753631 ?auto_753639 ) ) ( not ( = ?auto_753631 ?auto_753640 ) ) ( not ( = ?auto_753631 ?auto_753641 ) ) ( not ( = ?auto_753631 ?auto_753642 ) ) ( not ( = ?auto_753631 ?auto_753643 ) ) ( not ( = ?auto_753631 ?auto_753644 ) ) ( not ( = ?auto_753631 ?auto_753645 ) ) ( not ( = ?auto_753632 ?auto_753633 ) ) ( not ( = ?auto_753632 ?auto_753634 ) ) ( not ( = ?auto_753632 ?auto_753635 ) ) ( not ( = ?auto_753632 ?auto_753636 ) ) ( not ( = ?auto_753632 ?auto_753637 ) ) ( not ( = ?auto_753632 ?auto_753638 ) ) ( not ( = ?auto_753632 ?auto_753639 ) ) ( not ( = ?auto_753632 ?auto_753640 ) ) ( not ( = ?auto_753632 ?auto_753641 ) ) ( not ( = ?auto_753632 ?auto_753642 ) ) ( not ( = ?auto_753632 ?auto_753643 ) ) ( not ( = ?auto_753632 ?auto_753644 ) ) ( not ( = ?auto_753632 ?auto_753645 ) ) ( not ( = ?auto_753633 ?auto_753634 ) ) ( not ( = ?auto_753633 ?auto_753635 ) ) ( not ( = ?auto_753633 ?auto_753636 ) ) ( not ( = ?auto_753633 ?auto_753637 ) ) ( not ( = ?auto_753633 ?auto_753638 ) ) ( not ( = ?auto_753633 ?auto_753639 ) ) ( not ( = ?auto_753633 ?auto_753640 ) ) ( not ( = ?auto_753633 ?auto_753641 ) ) ( not ( = ?auto_753633 ?auto_753642 ) ) ( not ( = ?auto_753633 ?auto_753643 ) ) ( not ( = ?auto_753633 ?auto_753644 ) ) ( not ( = ?auto_753633 ?auto_753645 ) ) ( not ( = ?auto_753634 ?auto_753635 ) ) ( not ( = ?auto_753634 ?auto_753636 ) ) ( not ( = ?auto_753634 ?auto_753637 ) ) ( not ( = ?auto_753634 ?auto_753638 ) ) ( not ( = ?auto_753634 ?auto_753639 ) ) ( not ( = ?auto_753634 ?auto_753640 ) ) ( not ( = ?auto_753634 ?auto_753641 ) ) ( not ( = ?auto_753634 ?auto_753642 ) ) ( not ( = ?auto_753634 ?auto_753643 ) ) ( not ( = ?auto_753634 ?auto_753644 ) ) ( not ( = ?auto_753634 ?auto_753645 ) ) ( not ( = ?auto_753635 ?auto_753636 ) ) ( not ( = ?auto_753635 ?auto_753637 ) ) ( not ( = ?auto_753635 ?auto_753638 ) ) ( not ( = ?auto_753635 ?auto_753639 ) ) ( not ( = ?auto_753635 ?auto_753640 ) ) ( not ( = ?auto_753635 ?auto_753641 ) ) ( not ( = ?auto_753635 ?auto_753642 ) ) ( not ( = ?auto_753635 ?auto_753643 ) ) ( not ( = ?auto_753635 ?auto_753644 ) ) ( not ( = ?auto_753635 ?auto_753645 ) ) ( not ( = ?auto_753636 ?auto_753637 ) ) ( not ( = ?auto_753636 ?auto_753638 ) ) ( not ( = ?auto_753636 ?auto_753639 ) ) ( not ( = ?auto_753636 ?auto_753640 ) ) ( not ( = ?auto_753636 ?auto_753641 ) ) ( not ( = ?auto_753636 ?auto_753642 ) ) ( not ( = ?auto_753636 ?auto_753643 ) ) ( not ( = ?auto_753636 ?auto_753644 ) ) ( not ( = ?auto_753636 ?auto_753645 ) ) ( not ( = ?auto_753637 ?auto_753638 ) ) ( not ( = ?auto_753637 ?auto_753639 ) ) ( not ( = ?auto_753637 ?auto_753640 ) ) ( not ( = ?auto_753637 ?auto_753641 ) ) ( not ( = ?auto_753637 ?auto_753642 ) ) ( not ( = ?auto_753637 ?auto_753643 ) ) ( not ( = ?auto_753637 ?auto_753644 ) ) ( not ( = ?auto_753637 ?auto_753645 ) ) ( not ( = ?auto_753638 ?auto_753639 ) ) ( not ( = ?auto_753638 ?auto_753640 ) ) ( not ( = ?auto_753638 ?auto_753641 ) ) ( not ( = ?auto_753638 ?auto_753642 ) ) ( not ( = ?auto_753638 ?auto_753643 ) ) ( not ( = ?auto_753638 ?auto_753644 ) ) ( not ( = ?auto_753638 ?auto_753645 ) ) ( not ( = ?auto_753639 ?auto_753640 ) ) ( not ( = ?auto_753639 ?auto_753641 ) ) ( not ( = ?auto_753639 ?auto_753642 ) ) ( not ( = ?auto_753639 ?auto_753643 ) ) ( not ( = ?auto_753639 ?auto_753644 ) ) ( not ( = ?auto_753639 ?auto_753645 ) ) ( not ( = ?auto_753640 ?auto_753641 ) ) ( not ( = ?auto_753640 ?auto_753642 ) ) ( not ( = ?auto_753640 ?auto_753643 ) ) ( not ( = ?auto_753640 ?auto_753644 ) ) ( not ( = ?auto_753640 ?auto_753645 ) ) ( not ( = ?auto_753641 ?auto_753642 ) ) ( not ( = ?auto_753641 ?auto_753643 ) ) ( not ( = ?auto_753641 ?auto_753644 ) ) ( not ( = ?auto_753641 ?auto_753645 ) ) ( not ( = ?auto_753642 ?auto_753643 ) ) ( not ( = ?auto_753642 ?auto_753644 ) ) ( not ( = ?auto_753642 ?auto_753645 ) ) ( not ( = ?auto_753643 ?auto_753644 ) ) ( not ( = ?auto_753643 ?auto_753645 ) ) ( not ( = ?auto_753644 ?auto_753645 ) ) ( ON ?auto_753643 ?auto_753644 ) ( ON ?auto_753642 ?auto_753643 ) ( ON ?auto_753641 ?auto_753642 ) ( ON ?auto_753640 ?auto_753641 ) ( ON ?auto_753639 ?auto_753640 ) ( ON ?auto_753638 ?auto_753639 ) ( ON ?auto_753637 ?auto_753638 ) ( ON ?auto_753636 ?auto_753637 ) ( ON ?auto_753635 ?auto_753636 ) ( ON ?auto_753634 ?auto_753635 ) ( ON ?auto_753633 ?auto_753634 ) ( ON ?auto_753632 ?auto_753633 ) ( ON ?auto_753631 ?auto_753632 ) ( ON ?auto_753630 ?auto_753631 ) ( CLEAR ?auto_753630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_753630 )
      ( MAKE-15PILE ?auto_753630 ?auto_753631 ?auto_753632 ?auto_753633 ?auto_753634 ?auto_753635 ?auto_753636 ?auto_753637 ?auto_753638 ?auto_753639 ?auto_753640 ?auto_753641 ?auto_753642 ?auto_753643 ?auto_753644 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_753693 - BLOCK
      ?auto_753694 - BLOCK
      ?auto_753695 - BLOCK
      ?auto_753696 - BLOCK
      ?auto_753697 - BLOCK
      ?auto_753698 - BLOCK
      ?auto_753699 - BLOCK
      ?auto_753700 - BLOCK
      ?auto_753701 - BLOCK
      ?auto_753702 - BLOCK
      ?auto_753703 - BLOCK
      ?auto_753704 - BLOCK
      ?auto_753705 - BLOCK
      ?auto_753706 - BLOCK
      ?auto_753707 - BLOCK
      ?auto_753708 - BLOCK
    )
    :vars
    (
      ?auto_753709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_753707 ) ( ON ?auto_753708 ?auto_753709 ) ( CLEAR ?auto_753708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_753693 ) ( ON ?auto_753694 ?auto_753693 ) ( ON ?auto_753695 ?auto_753694 ) ( ON ?auto_753696 ?auto_753695 ) ( ON ?auto_753697 ?auto_753696 ) ( ON ?auto_753698 ?auto_753697 ) ( ON ?auto_753699 ?auto_753698 ) ( ON ?auto_753700 ?auto_753699 ) ( ON ?auto_753701 ?auto_753700 ) ( ON ?auto_753702 ?auto_753701 ) ( ON ?auto_753703 ?auto_753702 ) ( ON ?auto_753704 ?auto_753703 ) ( ON ?auto_753705 ?auto_753704 ) ( ON ?auto_753706 ?auto_753705 ) ( ON ?auto_753707 ?auto_753706 ) ( not ( = ?auto_753693 ?auto_753694 ) ) ( not ( = ?auto_753693 ?auto_753695 ) ) ( not ( = ?auto_753693 ?auto_753696 ) ) ( not ( = ?auto_753693 ?auto_753697 ) ) ( not ( = ?auto_753693 ?auto_753698 ) ) ( not ( = ?auto_753693 ?auto_753699 ) ) ( not ( = ?auto_753693 ?auto_753700 ) ) ( not ( = ?auto_753693 ?auto_753701 ) ) ( not ( = ?auto_753693 ?auto_753702 ) ) ( not ( = ?auto_753693 ?auto_753703 ) ) ( not ( = ?auto_753693 ?auto_753704 ) ) ( not ( = ?auto_753693 ?auto_753705 ) ) ( not ( = ?auto_753693 ?auto_753706 ) ) ( not ( = ?auto_753693 ?auto_753707 ) ) ( not ( = ?auto_753693 ?auto_753708 ) ) ( not ( = ?auto_753693 ?auto_753709 ) ) ( not ( = ?auto_753694 ?auto_753695 ) ) ( not ( = ?auto_753694 ?auto_753696 ) ) ( not ( = ?auto_753694 ?auto_753697 ) ) ( not ( = ?auto_753694 ?auto_753698 ) ) ( not ( = ?auto_753694 ?auto_753699 ) ) ( not ( = ?auto_753694 ?auto_753700 ) ) ( not ( = ?auto_753694 ?auto_753701 ) ) ( not ( = ?auto_753694 ?auto_753702 ) ) ( not ( = ?auto_753694 ?auto_753703 ) ) ( not ( = ?auto_753694 ?auto_753704 ) ) ( not ( = ?auto_753694 ?auto_753705 ) ) ( not ( = ?auto_753694 ?auto_753706 ) ) ( not ( = ?auto_753694 ?auto_753707 ) ) ( not ( = ?auto_753694 ?auto_753708 ) ) ( not ( = ?auto_753694 ?auto_753709 ) ) ( not ( = ?auto_753695 ?auto_753696 ) ) ( not ( = ?auto_753695 ?auto_753697 ) ) ( not ( = ?auto_753695 ?auto_753698 ) ) ( not ( = ?auto_753695 ?auto_753699 ) ) ( not ( = ?auto_753695 ?auto_753700 ) ) ( not ( = ?auto_753695 ?auto_753701 ) ) ( not ( = ?auto_753695 ?auto_753702 ) ) ( not ( = ?auto_753695 ?auto_753703 ) ) ( not ( = ?auto_753695 ?auto_753704 ) ) ( not ( = ?auto_753695 ?auto_753705 ) ) ( not ( = ?auto_753695 ?auto_753706 ) ) ( not ( = ?auto_753695 ?auto_753707 ) ) ( not ( = ?auto_753695 ?auto_753708 ) ) ( not ( = ?auto_753695 ?auto_753709 ) ) ( not ( = ?auto_753696 ?auto_753697 ) ) ( not ( = ?auto_753696 ?auto_753698 ) ) ( not ( = ?auto_753696 ?auto_753699 ) ) ( not ( = ?auto_753696 ?auto_753700 ) ) ( not ( = ?auto_753696 ?auto_753701 ) ) ( not ( = ?auto_753696 ?auto_753702 ) ) ( not ( = ?auto_753696 ?auto_753703 ) ) ( not ( = ?auto_753696 ?auto_753704 ) ) ( not ( = ?auto_753696 ?auto_753705 ) ) ( not ( = ?auto_753696 ?auto_753706 ) ) ( not ( = ?auto_753696 ?auto_753707 ) ) ( not ( = ?auto_753696 ?auto_753708 ) ) ( not ( = ?auto_753696 ?auto_753709 ) ) ( not ( = ?auto_753697 ?auto_753698 ) ) ( not ( = ?auto_753697 ?auto_753699 ) ) ( not ( = ?auto_753697 ?auto_753700 ) ) ( not ( = ?auto_753697 ?auto_753701 ) ) ( not ( = ?auto_753697 ?auto_753702 ) ) ( not ( = ?auto_753697 ?auto_753703 ) ) ( not ( = ?auto_753697 ?auto_753704 ) ) ( not ( = ?auto_753697 ?auto_753705 ) ) ( not ( = ?auto_753697 ?auto_753706 ) ) ( not ( = ?auto_753697 ?auto_753707 ) ) ( not ( = ?auto_753697 ?auto_753708 ) ) ( not ( = ?auto_753697 ?auto_753709 ) ) ( not ( = ?auto_753698 ?auto_753699 ) ) ( not ( = ?auto_753698 ?auto_753700 ) ) ( not ( = ?auto_753698 ?auto_753701 ) ) ( not ( = ?auto_753698 ?auto_753702 ) ) ( not ( = ?auto_753698 ?auto_753703 ) ) ( not ( = ?auto_753698 ?auto_753704 ) ) ( not ( = ?auto_753698 ?auto_753705 ) ) ( not ( = ?auto_753698 ?auto_753706 ) ) ( not ( = ?auto_753698 ?auto_753707 ) ) ( not ( = ?auto_753698 ?auto_753708 ) ) ( not ( = ?auto_753698 ?auto_753709 ) ) ( not ( = ?auto_753699 ?auto_753700 ) ) ( not ( = ?auto_753699 ?auto_753701 ) ) ( not ( = ?auto_753699 ?auto_753702 ) ) ( not ( = ?auto_753699 ?auto_753703 ) ) ( not ( = ?auto_753699 ?auto_753704 ) ) ( not ( = ?auto_753699 ?auto_753705 ) ) ( not ( = ?auto_753699 ?auto_753706 ) ) ( not ( = ?auto_753699 ?auto_753707 ) ) ( not ( = ?auto_753699 ?auto_753708 ) ) ( not ( = ?auto_753699 ?auto_753709 ) ) ( not ( = ?auto_753700 ?auto_753701 ) ) ( not ( = ?auto_753700 ?auto_753702 ) ) ( not ( = ?auto_753700 ?auto_753703 ) ) ( not ( = ?auto_753700 ?auto_753704 ) ) ( not ( = ?auto_753700 ?auto_753705 ) ) ( not ( = ?auto_753700 ?auto_753706 ) ) ( not ( = ?auto_753700 ?auto_753707 ) ) ( not ( = ?auto_753700 ?auto_753708 ) ) ( not ( = ?auto_753700 ?auto_753709 ) ) ( not ( = ?auto_753701 ?auto_753702 ) ) ( not ( = ?auto_753701 ?auto_753703 ) ) ( not ( = ?auto_753701 ?auto_753704 ) ) ( not ( = ?auto_753701 ?auto_753705 ) ) ( not ( = ?auto_753701 ?auto_753706 ) ) ( not ( = ?auto_753701 ?auto_753707 ) ) ( not ( = ?auto_753701 ?auto_753708 ) ) ( not ( = ?auto_753701 ?auto_753709 ) ) ( not ( = ?auto_753702 ?auto_753703 ) ) ( not ( = ?auto_753702 ?auto_753704 ) ) ( not ( = ?auto_753702 ?auto_753705 ) ) ( not ( = ?auto_753702 ?auto_753706 ) ) ( not ( = ?auto_753702 ?auto_753707 ) ) ( not ( = ?auto_753702 ?auto_753708 ) ) ( not ( = ?auto_753702 ?auto_753709 ) ) ( not ( = ?auto_753703 ?auto_753704 ) ) ( not ( = ?auto_753703 ?auto_753705 ) ) ( not ( = ?auto_753703 ?auto_753706 ) ) ( not ( = ?auto_753703 ?auto_753707 ) ) ( not ( = ?auto_753703 ?auto_753708 ) ) ( not ( = ?auto_753703 ?auto_753709 ) ) ( not ( = ?auto_753704 ?auto_753705 ) ) ( not ( = ?auto_753704 ?auto_753706 ) ) ( not ( = ?auto_753704 ?auto_753707 ) ) ( not ( = ?auto_753704 ?auto_753708 ) ) ( not ( = ?auto_753704 ?auto_753709 ) ) ( not ( = ?auto_753705 ?auto_753706 ) ) ( not ( = ?auto_753705 ?auto_753707 ) ) ( not ( = ?auto_753705 ?auto_753708 ) ) ( not ( = ?auto_753705 ?auto_753709 ) ) ( not ( = ?auto_753706 ?auto_753707 ) ) ( not ( = ?auto_753706 ?auto_753708 ) ) ( not ( = ?auto_753706 ?auto_753709 ) ) ( not ( = ?auto_753707 ?auto_753708 ) ) ( not ( = ?auto_753707 ?auto_753709 ) ) ( not ( = ?auto_753708 ?auto_753709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_753708 ?auto_753709 )
      ( !STACK ?auto_753708 ?auto_753707 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_753759 - BLOCK
      ?auto_753760 - BLOCK
      ?auto_753761 - BLOCK
      ?auto_753762 - BLOCK
      ?auto_753763 - BLOCK
      ?auto_753764 - BLOCK
      ?auto_753765 - BLOCK
      ?auto_753766 - BLOCK
      ?auto_753767 - BLOCK
      ?auto_753768 - BLOCK
      ?auto_753769 - BLOCK
      ?auto_753770 - BLOCK
      ?auto_753771 - BLOCK
      ?auto_753772 - BLOCK
      ?auto_753773 - BLOCK
      ?auto_753774 - BLOCK
    )
    :vars
    (
      ?auto_753775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753774 ?auto_753775 ) ( ON-TABLE ?auto_753759 ) ( ON ?auto_753760 ?auto_753759 ) ( ON ?auto_753761 ?auto_753760 ) ( ON ?auto_753762 ?auto_753761 ) ( ON ?auto_753763 ?auto_753762 ) ( ON ?auto_753764 ?auto_753763 ) ( ON ?auto_753765 ?auto_753764 ) ( ON ?auto_753766 ?auto_753765 ) ( ON ?auto_753767 ?auto_753766 ) ( ON ?auto_753768 ?auto_753767 ) ( ON ?auto_753769 ?auto_753768 ) ( ON ?auto_753770 ?auto_753769 ) ( ON ?auto_753771 ?auto_753770 ) ( ON ?auto_753772 ?auto_753771 ) ( not ( = ?auto_753759 ?auto_753760 ) ) ( not ( = ?auto_753759 ?auto_753761 ) ) ( not ( = ?auto_753759 ?auto_753762 ) ) ( not ( = ?auto_753759 ?auto_753763 ) ) ( not ( = ?auto_753759 ?auto_753764 ) ) ( not ( = ?auto_753759 ?auto_753765 ) ) ( not ( = ?auto_753759 ?auto_753766 ) ) ( not ( = ?auto_753759 ?auto_753767 ) ) ( not ( = ?auto_753759 ?auto_753768 ) ) ( not ( = ?auto_753759 ?auto_753769 ) ) ( not ( = ?auto_753759 ?auto_753770 ) ) ( not ( = ?auto_753759 ?auto_753771 ) ) ( not ( = ?auto_753759 ?auto_753772 ) ) ( not ( = ?auto_753759 ?auto_753773 ) ) ( not ( = ?auto_753759 ?auto_753774 ) ) ( not ( = ?auto_753759 ?auto_753775 ) ) ( not ( = ?auto_753760 ?auto_753761 ) ) ( not ( = ?auto_753760 ?auto_753762 ) ) ( not ( = ?auto_753760 ?auto_753763 ) ) ( not ( = ?auto_753760 ?auto_753764 ) ) ( not ( = ?auto_753760 ?auto_753765 ) ) ( not ( = ?auto_753760 ?auto_753766 ) ) ( not ( = ?auto_753760 ?auto_753767 ) ) ( not ( = ?auto_753760 ?auto_753768 ) ) ( not ( = ?auto_753760 ?auto_753769 ) ) ( not ( = ?auto_753760 ?auto_753770 ) ) ( not ( = ?auto_753760 ?auto_753771 ) ) ( not ( = ?auto_753760 ?auto_753772 ) ) ( not ( = ?auto_753760 ?auto_753773 ) ) ( not ( = ?auto_753760 ?auto_753774 ) ) ( not ( = ?auto_753760 ?auto_753775 ) ) ( not ( = ?auto_753761 ?auto_753762 ) ) ( not ( = ?auto_753761 ?auto_753763 ) ) ( not ( = ?auto_753761 ?auto_753764 ) ) ( not ( = ?auto_753761 ?auto_753765 ) ) ( not ( = ?auto_753761 ?auto_753766 ) ) ( not ( = ?auto_753761 ?auto_753767 ) ) ( not ( = ?auto_753761 ?auto_753768 ) ) ( not ( = ?auto_753761 ?auto_753769 ) ) ( not ( = ?auto_753761 ?auto_753770 ) ) ( not ( = ?auto_753761 ?auto_753771 ) ) ( not ( = ?auto_753761 ?auto_753772 ) ) ( not ( = ?auto_753761 ?auto_753773 ) ) ( not ( = ?auto_753761 ?auto_753774 ) ) ( not ( = ?auto_753761 ?auto_753775 ) ) ( not ( = ?auto_753762 ?auto_753763 ) ) ( not ( = ?auto_753762 ?auto_753764 ) ) ( not ( = ?auto_753762 ?auto_753765 ) ) ( not ( = ?auto_753762 ?auto_753766 ) ) ( not ( = ?auto_753762 ?auto_753767 ) ) ( not ( = ?auto_753762 ?auto_753768 ) ) ( not ( = ?auto_753762 ?auto_753769 ) ) ( not ( = ?auto_753762 ?auto_753770 ) ) ( not ( = ?auto_753762 ?auto_753771 ) ) ( not ( = ?auto_753762 ?auto_753772 ) ) ( not ( = ?auto_753762 ?auto_753773 ) ) ( not ( = ?auto_753762 ?auto_753774 ) ) ( not ( = ?auto_753762 ?auto_753775 ) ) ( not ( = ?auto_753763 ?auto_753764 ) ) ( not ( = ?auto_753763 ?auto_753765 ) ) ( not ( = ?auto_753763 ?auto_753766 ) ) ( not ( = ?auto_753763 ?auto_753767 ) ) ( not ( = ?auto_753763 ?auto_753768 ) ) ( not ( = ?auto_753763 ?auto_753769 ) ) ( not ( = ?auto_753763 ?auto_753770 ) ) ( not ( = ?auto_753763 ?auto_753771 ) ) ( not ( = ?auto_753763 ?auto_753772 ) ) ( not ( = ?auto_753763 ?auto_753773 ) ) ( not ( = ?auto_753763 ?auto_753774 ) ) ( not ( = ?auto_753763 ?auto_753775 ) ) ( not ( = ?auto_753764 ?auto_753765 ) ) ( not ( = ?auto_753764 ?auto_753766 ) ) ( not ( = ?auto_753764 ?auto_753767 ) ) ( not ( = ?auto_753764 ?auto_753768 ) ) ( not ( = ?auto_753764 ?auto_753769 ) ) ( not ( = ?auto_753764 ?auto_753770 ) ) ( not ( = ?auto_753764 ?auto_753771 ) ) ( not ( = ?auto_753764 ?auto_753772 ) ) ( not ( = ?auto_753764 ?auto_753773 ) ) ( not ( = ?auto_753764 ?auto_753774 ) ) ( not ( = ?auto_753764 ?auto_753775 ) ) ( not ( = ?auto_753765 ?auto_753766 ) ) ( not ( = ?auto_753765 ?auto_753767 ) ) ( not ( = ?auto_753765 ?auto_753768 ) ) ( not ( = ?auto_753765 ?auto_753769 ) ) ( not ( = ?auto_753765 ?auto_753770 ) ) ( not ( = ?auto_753765 ?auto_753771 ) ) ( not ( = ?auto_753765 ?auto_753772 ) ) ( not ( = ?auto_753765 ?auto_753773 ) ) ( not ( = ?auto_753765 ?auto_753774 ) ) ( not ( = ?auto_753765 ?auto_753775 ) ) ( not ( = ?auto_753766 ?auto_753767 ) ) ( not ( = ?auto_753766 ?auto_753768 ) ) ( not ( = ?auto_753766 ?auto_753769 ) ) ( not ( = ?auto_753766 ?auto_753770 ) ) ( not ( = ?auto_753766 ?auto_753771 ) ) ( not ( = ?auto_753766 ?auto_753772 ) ) ( not ( = ?auto_753766 ?auto_753773 ) ) ( not ( = ?auto_753766 ?auto_753774 ) ) ( not ( = ?auto_753766 ?auto_753775 ) ) ( not ( = ?auto_753767 ?auto_753768 ) ) ( not ( = ?auto_753767 ?auto_753769 ) ) ( not ( = ?auto_753767 ?auto_753770 ) ) ( not ( = ?auto_753767 ?auto_753771 ) ) ( not ( = ?auto_753767 ?auto_753772 ) ) ( not ( = ?auto_753767 ?auto_753773 ) ) ( not ( = ?auto_753767 ?auto_753774 ) ) ( not ( = ?auto_753767 ?auto_753775 ) ) ( not ( = ?auto_753768 ?auto_753769 ) ) ( not ( = ?auto_753768 ?auto_753770 ) ) ( not ( = ?auto_753768 ?auto_753771 ) ) ( not ( = ?auto_753768 ?auto_753772 ) ) ( not ( = ?auto_753768 ?auto_753773 ) ) ( not ( = ?auto_753768 ?auto_753774 ) ) ( not ( = ?auto_753768 ?auto_753775 ) ) ( not ( = ?auto_753769 ?auto_753770 ) ) ( not ( = ?auto_753769 ?auto_753771 ) ) ( not ( = ?auto_753769 ?auto_753772 ) ) ( not ( = ?auto_753769 ?auto_753773 ) ) ( not ( = ?auto_753769 ?auto_753774 ) ) ( not ( = ?auto_753769 ?auto_753775 ) ) ( not ( = ?auto_753770 ?auto_753771 ) ) ( not ( = ?auto_753770 ?auto_753772 ) ) ( not ( = ?auto_753770 ?auto_753773 ) ) ( not ( = ?auto_753770 ?auto_753774 ) ) ( not ( = ?auto_753770 ?auto_753775 ) ) ( not ( = ?auto_753771 ?auto_753772 ) ) ( not ( = ?auto_753771 ?auto_753773 ) ) ( not ( = ?auto_753771 ?auto_753774 ) ) ( not ( = ?auto_753771 ?auto_753775 ) ) ( not ( = ?auto_753772 ?auto_753773 ) ) ( not ( = ?auto_753772 ?auto_753774 ) ) ( not ( = ?auto_753772 ?auto_753775 ) ) ( not ( = ?auto_753773 ?auto_753774 ) ) ( not ( = ?auto_753773 ?auto_753775 ) ) ( not ( = ?auto_753774 ?auto_753775 ) ) ( CLEAR ?auto_753772 ) ( ON ?auto_753773 ?auto_753774 ) ( CLEAR ?auto_753773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_753759 ?auto_753760 ?auto_753761 ?auto_753762 ?auto_753763 ?auto_753764 ?auto_753765 ?auto_753766 ?auto_753767 ?auto_753768 ?auto_753769 ?auto_753770 ?auto_753771 ?auto_753772 ?auto_753773 )
      ( MAKE-16PILE ?auto_753759 ?auto_753760 ?auto_753761 ?auto_753762 ?auto_753763 ?auto_753764 ?auto_753765 ?auto_753766 ?auto_753767 ?auto_753768 ?auto_753769 ?auto_753770 ?auto_753771 ?auto_753772 ?auto_753773 ?auto_753774 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_753825 - BLOCK
      ?auto_753826 - BLOCK
      ?auto_753827 - BLOCK
      ?auto_753828 - BLOCK
      ?auto_753829 - BLOCK
      ?auto_753830 - BLOCK
      ?auto_753831 - BLOCK
      ?auto_753832 - BLOCK
      ?auto_753833 - BLOCK
      ?auto_753834 - BLOCK
      ?auto_753835 - BLOCK
      ?auto_753836 - BLOCK
      ?auto_753837 - BLOCK
      ?auto_753838 - BLOCK
      ?auto_753839 - BLOCK
      ?auto_753840 - BLOCK
    )
    :vars
    (
      ?auto_753841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753840 ?auto_753841 ) ( ON-TABLE ?auto_753825 ) ( ON ?auto_753826 ?auto_753825 ) ( ON ?auto_753827 ?auto_753826 ) ( ON ?auto_753828 ?auto_753827 ) ( ON ?auto_753829 ?auto_753828 ) ( ON ?auto_753830 ?auto_753829 ) ( ON ?auto_753831 ?auto_753830 ) ( ON ?auto_753832 ?auto_753831 ) ( ON ?auto_753833 ?auto_753832 ) ( ON ?auto_753834 ?auto_753833 ) ( ON ?auto_753835 ?auto_753834 ) ( ON ?auto_753836 ?auto_753835 ) ( ON ?auto_753837 ?auto_753836 ) ( not ( = ?auto_753825 ?auto_753826 ) ) ( not ( = ?auto_753825 ?auto_753827 ) ) ( not ( = ?auto_753825 ?auto_753828 ) ) ( not ( = ?auto_753825 ?auto_753829 ) ) ( not ( = ?auto_753825 ?auto_753830 ) ) ( not ( = ?auto_753825 ?auto_753831 ) ) ( not ( = ?auto_753825 ?auto_753832 ) ) ( not ( = ?auto_753825 ?auto_753833 ) ) ( not ( = ?auto_753825 ?auto_753834 ) ) ( not ( = ?auto_753825 ?auto_753835 ) ) ( not ( = ?auto_753825 ?auto_753836 ) ) ( not ( = ?auto_753825 ?auto_753837 ) ) ( not ( = ?auto_753825 ?auto_753838 ) ) ( not ( = ?auto_753825 ?auto_753839 ) ) ( not ( = ?auto_753825 ?auto_753840 ) ) ( not ( = ?auto_753825 ?auto_753841 ) ) ( not ( = ?auto_753826 ?auto_753827 ) ) ( not ( = ?auto_753826 ?auto_753828 ) ) ( not ( = ?auto_753826 ?auto_753829 ) ) ( not ( = ?auto_753826 ?auto_753830 ) ) ( not ( = ?auto_753826 ?auto_753831 ) ) ( not ( = ?auto_753826 ?auto_753832 ) ) ( not ( = ?auto_753826 ?auto_753833 ) ) ( not ( = ?auto_753826 ?auto_753834 ) ) ( not ( = ?auto_753826 ?auto_753835 ) ) ( not ( = ?auto_753826 ?auto_753836 ) ) ( not ( = ?auto_753826 ?auto_753837 ) ) ( not ( = ?auto_753826 ?auto_753838 ) ) ( not ( = ?auto_753826 ?auto_753839 ) ) ( not ( = ?auto_753826 ?auto_753840 ) ) ( not ( = ?auto_753826 ?auto_753841 ) ) ( not ( = ?auto_753827 ?auto_753828 ) ) ( not ( = ?auto_753827 ?auto_753829 ) ) ( not ( = ?auto_753827 ?auto_753830 ) ) ( not ( = ?auto_753827 ?auto_753831 ) ) ( not ( = ?auto_753827 ?auto_753832 ) ) ( not ( = ?auto_753827 ?auto_753833 ) ) ( not ( = ?auto_753827 ?auto_753834 ) ) ( not ( = ?auto_753827 ?auto_753835 ) ) ( not ( = ?auto_753827 ?auto_753836 ) ) ( not ( = ?auto_753827 ?auto_753837 ) ) ( not ( = ?auto_753827 ?auto_753838 ) ) ( not ( = ?auto_753827 ?auto_753839 ) ) ( not ( = ?auto_753827 ?auto_753840 ) ) ( not ( = ?auto_753827 ?auto_753841 ) ) ( not ( = ?auto_753828 ?auto_753829 ) ) ( not ( = ?auto_753828 ?auto_753830 ) ) ( not ( = ?auto_753828 ?auto_753831 ) ) ( not ( = ?auto_753828 ?auto_753832 ) ) ( not ( = ?auto_753828 ?auto_753833 ) ) ( not ( = ?auto_753828 ?auto_753834 ) ) ( not ( = ?auto_753828 ?auto_753835 ) ) ( not ( = ?auto_753828 ?auto_753836 ) ) ( not ( = ?auto_753828 ?auto_753837 ) ) ( not ( = ?auto_753828 ?auto_753838 ) ) ( not ( = ?auto_753828 ?auto_753839 ) ) ( not ( = ?auto_753828 ?auto_753840 ) ) ( not ( = ?auto_753828 ?auto_753841 ) ) ( not ( = ?auto_753829 ?auto_753830 ) ) ( not ( = ?auto_753829 ?auto_753831 ) ) ( not ( = ?auto_753829 ?auto_753832 ) ) ( not ( = ?auto_753829 ?auto_753833 ) ) ( not ( = ?auto_753829 ?auto_753834 ) ) ( not ( = ?auto_753829 ?auto_753835 ) ) ( not ( = ?auto_753829 ?auto_753836 ) ) ( not ( = ?auto_753829 ?auto_753837 ) ) ( not ( = ?auto_753829 ?auto_753838 ) ) ( not ( = ?auto_753829 ?auto_753839 ) ) ( not ( = ?auto_753829 ?auto_753840 ) ) ( not ( = ?auto_753829 ?auto_753841 ) ) ( not ( = ?auto_753830 ?auto_753831 ) ) ( not ( = ?auto_753830 ?auto_753832 ) ) ( not ( = ?auto_753830 ?auto_753833 ) ) ( not ( = ?auto_753830 ?auto_753834 ) ) ( not ( = ?auto_753830 ?auto_753835 ) ) ( not ( = ?auto_753830 ?auto_753836 ) ) ( not ( = ?auto_753830 ?auto_753837 ) ) ( not ( = ?auto_753830 ?auto_753838 ) ) ( not ( = ?auto_753830 ?auto_753839 ) ) ( not ( = ?auto_753830 ?auto_753840 ) ) ( not ( = ?auto_753830 ?auto_753841 ) ) ( not ( = ?auto_753831 ?auto_753832 ) ) ( not ( = ?auto_753831 ?auto_753833 ) ) ( not ( = ?auto_753831 ?auto_753834 ) ) ( not ( = ?auto_753831 ?auto_753835 ) ) ( not ( = ?auto_753831 ?auto_753836 ) ) ( not ( = ?auto_753831 ?auto_753837 ) ) ( not ( = ?auto_753831 ?auto_753838 ) ) ( not ( = ?auto_753831 ?auto_753839 ) ) ( not ( = ?auto_753831 ?auto_753840 ) ) ( not ( = ?auto_753831 ?auto_753841 ) ) ( not ( = ?auto_753832 ?auto_753833 ) ) ( not ( = ?auto_753832 ?auto_753834 ) ) ( not ( = ?auto_753832 ?auto_753835 ) ) ( not ( = ?auto_753832 ?auto_753836 ) ) ( not ( = ?auto_753832 ?auto_753837 ) ) ( not ( = ?auto_753832 ?auto_753838 ) ) ( not ( = ?auto_753832 ?auto_753839 ) ) ( not ( = ?auto_753832 ?auto_753840 ) ) ( not ( = ?auto_753832 ?auto_753841 ) ) ( not ( = ?auto_753833 ?auto_753834 ) ) ( not ( = ?auto_753833 ?auto_753835 ) ) ( not ( = ?auto_753833 ?auto_753836 ) ) ( not ( = ?auto_753833 ?auto_753837 ) ) ( not ( = ?auto_753833 ?auto_753838 ) ) ( not ( = ?auto_753833 ?auto_753839 ) ) ( not ( = ?auto_753833 ?auto_753840 ) ) ( not ( = ?auto_753833 ?auto_753841 ) ) ( not ( = ?auto_753834 ?auto_753835 ) ) ( not ( = ?auto_753834 ?auto_753836 ) ) ( not ( = ?auto_753834 ?auto_753837 ) ) ( not ( = ?auto_753834 ?auto_753838 ) ) ( not ( = ?auto_753834 ?auto_753839 ) ) ( not ( = ?auto_753834 ?auto_753840 ) ) ( not ( = ?auto_753834 ?auto_753841 ) ) ( not ( = ?auto_753835 ?auto_753836 ) ) ( not ( = ?auto_753835 ?auto_753837 ) ) ( not ( = ?auto_753835 ?auto_753838 ) ) ( not ( = ?auto_753835 ?auto_753839 ) ) ( not ( = ?auto_753835 ?auto_753840 ) ) ( not ( = ?auto_753835 ?auto_753841 ) ) ( not ( = ?auto_753836 ?auto_753837 ) ) ( not ( = ?auto_753836 ?auto_753838 ) ) ( not ( = ?auto_753836 ?auto_753839 ) ) ( not ( = ?auto_753836 ?auto_753840 ) ) ( not ( = ?auto_753836 ?auto_753841 ) ) ( not ( = ?auto_753837 ?auto_753838 ) ) ( not ( = ?auto_753837 ?auto_753839 ) ) ( not ( = ?auto_753837 ?auto_753840 ) ) ( not ( = ?auto_753837 ?auto_753841 ) ) ( not ( = ?auto_753838 ?auto_753839 ) ) ( not ( = ?auto_753838 ?auto_753840 ) ) ( not ( = ?auto_753838 ?auto_753841 ) ) ( not ( = ?auto_753839 ?auto_753840 ) ) ( not ( = ?auto_753839 ?auto_753841 ) ) ( not ( = ?auto_753840 ?auto_753841 ) ) ( ON ?auto_753839 ?auto_753840 ) ( CLEAR ?auto_753837 ) ( ON ?auto_753838 ?auto_753839 ) ( CLEAR ?auto_753838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_753825 ?auto_753826 ?auto_753827 ?auto_753828 ?auto_753829 ?auto_753830 ?auto_753831 ?auto_753832 ?auto_753833 ?auto_753834 ?auto_753835 ?auto_753836 ?auto_753837 ?auto_753838 )
      ( MAKE-16PILE ?auto_753825 ?auto_753826 ?auto_753827 ?auto_753828 ?auto_753829 ?auto_753830 ?auto_753831 ?auto_753832 ?auto_753833 ?auto_753834 ?auto_753835 ?auto_753836 ?auto_753837 ?auto_753838 ?auto_753839 ?auto_753840 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_753891 - BLOCK
      ?auto_753892 - BLOCK
      ?auto_753893 - BLOCK
      ?auto_753894 - BLOCK
      ?auto_753895 - BLOCK
      ?auto_753896 - BLOCK
      ?auto_753897 - BLOCK
      ?auto_753898 - BLOCK
      ?auto_753899 - BLOCK
      ?auto_753900 - BLOCK
      ?auto_753901 - BLOCK
      ?auto_753902 - BLOCK
      ?auto_753903 - BLOCK
      ?auto_753904 - BLOCK
      ?auto_753905 - BLOCK
      ?auto_753906 - BLOCK
    )
    :vars
    (
      ?auto_753907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753906 ?auto_753907 ) ( ON-TABLE ?auto_753891 ) ( ON ?auto_753892 ?auto_753891 ) ( ON ?auto_753893 ?auto_753892 ) ( ON ?auto_753894 ?auto_753893 ) ( ON ?auto_753895 ?auto_753894 ) ( ON ?auto_753896 ?auto_753895 ) ( ON ?auto_753897 ?auto_753896 ) ( ON ?auto_753898 ?auto_753897 ) ( ON ?auto_753899 ?auto_753898 ) ( ON ?auto_753900 ?auto_753899 ) ( ON ?auto_753901 ?auto_753900 ) ( ON ?auto_753902 ?auto_753901 ) ( not ( = ?auto_753891 ?auto_753892 ) ) ( not ( = ?auto_753891 ?auto_753893 ) ) ( not ( = ?auto_753891 ?auto_753894 ) ) ( not ( = ?auto_753891 ?auto_753895 ) ) ( not ( = ?auto_753891 ?auto_753896 ) ) ( not ( = ?auto_753891 ?auto_753897 ) ) ( not ( = ?auto_753891 ?auto_753898 ) ) ( not ( = ?auto_753891 ?auto_753899 ) ) ( not ( = ?auto_753891 ?auto_753900 ) ) ( not ( = ?auto_753891 ?auto_753901 ) ) ( not ( = ?auto_753891 ?auto_753902 ) ) ( not ( = ?auto_753891 ?auto_753903 ) ) ( not ( = ?auto_753891 ?auto_753904 ) ) ( not ( = ?auto_753891 ?auto_753905 ) ) ( not ( = ?auto_753891 ?auto_753906 ) ) ( not ( = ?auto_753891 ?auto_753907 ) ) ( not ( = ?auto_753892 ?auto_753893 ) ) ( not ( = ?auto_753892 ?auto_753894 ) ) ( not ( = ?auto_753892 ?auto_753895 ) ) ( not ( = ?auto_753892 ?auto_753896 ) ) ( not ( = ?auto_753892 ?auto_753897 ) ) ( not ( = ?auto_753892 ?auto_753898 ) ) ( not ( = ?auto_753892 ?auto_753899 ) ) ( not ( = ?auto_753892 ?auto_753900 ) ) ( not ( = ?auto_753892 ?auto_753901 ) ) ( not ( = ?auto_753892 ?auto_753902 ) ) ( not ( = ?auto_753892 ?auto_753903 ) ) ( not ( = ?auto_753892 ?auto_753904 ) ) ( not ( = ?auto_753892 ?auto_753905 ) ) ( not ( = ?auto_753892 ?auto_753906 ) ) ( not ( = ?auto_753892 ?auto_753907 ) ) ( not ( = ?auto_753893 ?auto_753894 ) ) ( not ( = ?auto_753893 ?auto_753895 ) ) ( not ( = ?auto_753893 ?auto_753896 ) ) ( not ( = ?auto_753893 ?auto_753897 ) ) ( not ( = ?auto_753893 ?auto_753898 ) ) ( not ( = ?auto_753893 ?auto_753899 ) ) ( not ( = ?auto_753893 ?auto_753900 ) ) ( not ( = ?auto_753893 ?auto_753901 ) ) ( not ( = ?auto_753893 ?auto_753902 ) ) ( not ( = ?auto_753893 ?auto_753903 ) ) ( not ( = ?auto_753893 ?auto_753904 ) ) ( not ( = ?auto_753893 ?auto_753905 ) ) ( not ( = ?auto_753893 ?auto_753906 ) ) ( not ( = ?auto_753893 ?auto_753907 ) ) ( not ( = ?auto_753894 ?auto_753895 ) ) ( not ( = ?auto_753894 ?auto_753896 ) ) ( not ( = ?auto_753894 ?auto_753897 ) ) ( not ( = ?auto_753894 ?auto_753898 ) ) ( not ( = ?auto_753894 ?auto_753899 ) ) ( not ( = ?auto_753894 ?auto_753900 ) ) ( not ( = ?auto_753894 ?auto_753901 ) ) ( not ( = ?auto_753894 ?auto_753902 ) ) ( not ( = ?auto_753894 ?auto_753903 ) ) ( not ( = ?auto_753894 ?auto_753904 ) ) ( not ( = ?auto_753894 ?auto_753905 ) ) ( not ( = ?auto_753894 ?auto_753906 ) ) ( not ( = ?auto_753894 ?auto_753907 ) ) ( not ( = ?auto_753895 ?auto_753896 ) ) ( not ( = ?auto_753895 ?auto_753897 ) ) ( not ( = ?auto_753895 ?auto_753898 ) ) ( not ( = ?auto_753895 ?auto_753899 ) ) ( not ( = ?auto_753895 ?auto_753900 ) ) ( not ( = ?auto_753895 ?auto_753901 ) ) ( not ( = ?auto_753895 ?auto_753902 ) ) ( not ( = ?auto_753895 ?auto_753903 ) ) ( not ( = ?auto_753895 ?auto_753904 ) ) ( not ( = ?auto_753895 ?auto_753905 ) ) ( not ( = ?auto_753895 ?auto_753906 ) ) ( not ( = ?auto_753895 ?auto_753907 ) ) ( not ( = ?auto_753896 ?auto_753897 ) ) ( not ( = ?auto_753896 ?auto_753898 ) ) ( not ( = ?auto_753896 ?auto_753899 ) ) ( not ( = ?auto_753896 ?auto_753900 ) ) ( not ( = ?auto_753896 ?auto_753901 ) ) ( not ( = ?auto_753896 ?auto_753902 ) ) ( not ( = ?auto_753896 ?auto_753903 ) ) ( not ( = ?auto_753896 ?auto_753904 ) ) ( not ( = ?auto_753896 ?auto_753905 ) ) ( not ( = ?auto_753896 ?auto_753906 ) ) ( not ( = ?auto_753896 ?auto_753907 ) ) ( not ( = ?auto_753897 ?auto_753898 ) ) ( not ( = ?auto_753897 ?auto_753899 ) ) ( not ( = ?auto_753897 ?auto_753900 ) ) ( not ( = ?auto_753897 ?auto_753901 ) ) ( not ( = ?auto_753897 ?auto_753902 ) ) ( not ( = ?auto_753897 ?auto_753903 ) ) ( not ( = ?auto_753897 ?auto_753904 ) ) ( not ( = ?auto_753897 ?auto_753905 ) ) ( not ( = ?auto_753897 ?auto_753906 ) ) ( not ( = ?auto_753897 ?auto_753907 ) ) ( not ( = ?auto_753898 ?auto_753899 ) ) ( not ( = ?auto_753898 ?auto_753900 ) ) ( not ( = ?auto_753898 ?auto_753901 ) ) ( not ( = ?auto_753898 ?auto_753902 ) ) ( not ( = ?auto_753898 ?auto_753903 ) ) ( not ( = ?auto_753898 ?auto_753904 ) ) ( not ( = ?auto_753898 ?auto_753905 ) ) ( not ( = ?auto_753898 ?auto_753906 ) ) ( not ( = ?auto_753898 ?auto_753907 ) ) ( not ( = ?auto_753899 ?auto_753900 ) ) ( not ( = ?auto_753899 ?auto_753901 ) ) ( not ( = ?auto_753899 ?auto_753902 ) ) ( not ( = ?auto_753899 ?auto_753903 ) ) ( not ( = ?auto_753899 ?auto_753904 ) ) ( not ( = ?auto_753899 ?auto_753905 ) ) ( not ( = ?auto_753899 ?auto_753906 ) ) ( not ( = ?auto_753899 ?auto_753907 ) ) ( not ( = ?auto_753900 ?auto_753901 ) ) ( not ( = ?auto_753900 ?auto_753902 ) ) ( not ( = ?auto_753900 ?auto_753903 ) ) ( not ( = ?auto_753900 ?auto_753904 ) ) ( not ( = ?auto_753900 ?auto_753905 ) ) ( not ( = ?auto_753900 ?auto_753906 ) ) ( not ( = ?auto_753900 ?auto_753907 ) ) ( not ( = ?auto_753901 ?auto_753902 ) ) ( not ( = ?auto_753901 ?auto_753903 ) ) ( not ( = ?auto_753901 ?auto_753904 ) ) ( not ( = ?auto_753901 ?auto_753905 ) ) ( not ( = ?auto_753901 ?auto_753906 ) ) ( not ( = ?auto_753901 ?auto_753907 ) ) ( not ( = ?auto_753902 ?auto_753903 ) ) ( not ( = ?auto_753902 ?auto_753904 ) ) ( not ( = ?auto_753902 ?auto_753905 ) ) ( not ( = ?auto_753902 ?auto_753906 ) ) ( not ( = ?auto_753902 ?auto_753907 ) ) ( not ( = ?auto_753903 ?auto_753904 ) ) ( not ( = ?auto_753903 ?auto_753905 ) ) ( not ( = ?auto_753903 ?auto_753906 ) ) ( not ( = ?auto_753903 ?auto_753907 ) ) ( not ( = ?auto_753904 ?auto_753905 ) ) ( not ( = ?auto_753904 ?auto_753906 ) ) ( not ( = ?auto_753904 ?auto_753907 ) ) ( not ( = ?auto_753905 ?auto_753906 ) ) ( not ( = ?auto_753905 ?auto_753907 ) ) ( not ( = ?auto_753906 ?auto_753907 ) ) ( ON ?auto_753905 ?auto_753906 ) ( ON ?auto_753904 ?auto_753905 ) ( CLEAR ?auto_753902 ) ( ON ?auto_753903 ?auto_753904 ) ( CLEAR ?auto_753903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_753891 ?auto_753892 ?auto_753893 ?auto_753894 ?auto_753895 ?auto_753896 ?auto_753897 ?auto_753898 ?auto_753899 ?auto_753900 ?auto_753901 ?auto_753902 ?auto_753903 )
      ( MAKE-16PILE ?auto_753891 ?auto_753892 ?auto_753893 ?auto_753894 ?auto_753895 ?auto_753896 ?auto_753897 ?auto_753898 ?auto_753899 ?auto_753900 ?auto_753901 ?auto_753902 ?auto_753903 ?auto_753904 ?auto_753905 ?auto_753906 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_753957 - BLOCK
      ?auto_753958 - BLOCK
      ?auto_753959 - BLOCK
      ?auto_753960 - BLOCK
      ?auto_753961 - BLOCK
      ?auto_753962 - BLOCK
      ?auto_753963 - BLOCK
      ?auto_753964 - BLOCK
      ?auto_753965 - BLOCK
      ?auto_753966 - BLOCK
      ?auto_753967 - BLOCK
      ?auto_753968 - BLOCK
      ?auto_753969 - BLOCK
      ?auto_753970 - BLOCK
      ?auto_753971 - BLOCK
      ?auto_753972 - BLOCK
    )
    :vars
    (
      ?auto_753973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753972 ?auto_753973 ) ( ON-TABLE ?auto_753957 ) ( ON ?auto_753958 ?auto_753957 ) ( ON ?auto_753959 ?auto_753958 ) ( ON ?auto_753960 ?auto_753959 ) ( ON ?auto_753961 ?auto_753960 ) ( ON ?auto_753962 ?auto_753961 ) ( ON ?auto_753963 ?auto_753962 ) ( ON ?auto_753964 ?auto_753963 ) ( ON ?auto_753965 ?auto_753964 ) ( ON ?auto_753966 ?auto_753965 ) ( ON ?auto_753967 ?auto_753966 ) ( not ( = ?auto_753957 ?auto_753958 ) ) ( not ( = ?auto_753957 ?auto_753959 ) ) ( not ( = ?auto_753957 ?auto_753960 ) ) ( not ( = ?auto_753957 ?auto_753961 ) ) ( not ( = ?auto_753957 ?auto_753962 ) ) ( not ( = ?auto_753957 ?auto_753963 ) ) ( not ( = ?auto_753957 ?auto_753964 ) ) ( not ( = ?auto_753957 ?auto_753965 ) ) ( not ( = ?auto_753957 ?auto_753966 ) ) ( not ( = ?auto_753957 ?auto_753967 ) ) ( not ( = ?auto_753957 ?auto_753968 ) ) ( not ( = ?auto_753957 ?auto_753969 ) ) ( not ( = ?auto_753957 ?auto_753970 ) ) ( not ( = ?auto_753957 ?auto_753971 ) ) ( not ( = ?auto_753957 ?auto_753972 ) ) ( not ( = ?auto_753957 ?auto_753973 ) ) ( not ( = ?auto_753958 ?auto_753959 ) ) ( not ( = ?auto_753958 ?auto_753960 ) ) ( not ( = ?auto_753958 ?auto_753961 ) ) ( not ( = ?auto_753958 ?auto_753962 ) ) ( not ( = ?auto_753958 ?auto_753963 ) ) ( not ( = ?auto_753958 ?auto_753964 ) ) ( not ( = ?auto_753958 ?auto_753965 ) ) ( not ( = ?auto_753958 ?auto_753966 ) ) ( not ( = ?auto_753958 ?auto_753967 ) ) ( not ( = ?auto_753958 ?auto_753968 ) ) ( not ( = ?auto_753958 ?auto_753969 ) ) ( not ( = ?auto_753958 ?auto_753970 ) ) ( not ( = ?auto_753958 ?auto_753971 ) ) ( not ( = ?auto_753958 ?auto_753972 ) ) ( not ( = ?auto_753958 ?auto_753973 ) ) ( not ( = ?auto_753959 ?auto_753960 ) ) ( not ( = ?auto_753959 ?auto_753961 ) ) ( not ( = ?auto_753959 ?auto_753962 ) ) ( not ( = ?auto_753959 ?auto_753963 ) ) ( not ( = ?auto_753959 ?auto_753964 ) ) ( not ( = ?auto_753959 ?auto_753965 ) ) ( not ( = ?auto_753959 ?auto_753966 ) ) ( not ( = ?auto_753959 ?auto_753967 ) ) ( not ( = ?auto_753959 ?auto_753968 ) ) ( not ( = ?auto_753959 ?auto_753969 ) ) ( not ( = ?auto_753959 ?auto_753970 ) ) ( not ( = ?auto_753959 ?auto_753971 ) ) ( not ( = ?auto_753959 ?auto_753972 ) ) ( not ( = ?auto_753959 ?auto_753973 ) ) ( not ( = ?auto_753960 ?auto_753961 ) ) ( not ( = ?auto_753960 ?auto_753962 ) ) ( not ( = ?auto_753960 ?auto_753963 ) ) ( not ( = ?auto_753960 ?auto_753964 ) ) ( not ( = ?auto_753960 ?auto_753965 ) ) ( not ( = ?auto_753960 ?auto_753966 ) ) ( not ( = ?auto_753960 ?auto_753967 ) ) ( not ( = ?auto_753960 ?auto_753968 ) ) ( not ( = ?auto_753960 ?auto_753969 ) ) ( not ( = ?auto_753960 ?auto_753970 ) ) ( not ( = ?auto_753960 ?auto_753971 ) ) ( not ( = ?auto_753960 ?auto_753972 ) ) ( not ( = ?auto_753960 ?auto_753973 ) ) ( not ( = ?auto_753961 ?auto_753962 ) ) ( not ( = ?auto_753961 ?auto_753963 ) ) ( not ( = ?auto_753961 ?auto_753964 ) ) ( not ( = ?auto_753961 ?auto_753965 ) ) ( not ( = ?auto_753961 ?auto_753966 ) ) ( not ( = ?auto_753961 ?auto_753967 ) ) ( not ( = ?auto_753961 ?auto_753968 ) ) ( not ( = ?auto_753961 ?auto_753969 ) ) ( not ( = ?auto_753961 ?auto_753970 ) ) ( not ( = ?auto_753961 ?auto_753971 ) ) ( not ( = ?auto_753961 ?auto_753972 ) ) ( not ( = ?auto_753961 ?auto_753973 ) ) ( not ( = ?auto_753962 ?auto_753963 ) ) ( not ( = ?auto_753962 ?auto_753964 ) ) ( not ( = ?auto_753962 ?auto_753965 ) ) ( not ( = ?auto_753962 ?auto_753966 ) ) ( not ( = ?auto_753962 ?auto_753967 ) ) ( not ( = ?auto_753962 ?auto_753968 ) ) ( not ( = ?auto_753962 ?auto_753969 ) ) ( not ( = ?auto_753962 ?auto_753970 ) ) ( not ( = ?auto_753962 ?auto_753971 ) ) ( not ( = ?auto_753962 ?auto_753972 ) ) ( not ( = ?auto_753962 ?auto_753973 ) ) ( not ( = ?auto_753963 ?auto_753964 ) ) ( not ( = ?auto_753963 ?auto_753965 ) ) ( not ( = ?auto_753963 ?auto_753966 ) ) ( not ( = ?auto_753963 ?auto_753967 ) ) ( not ( = ?auto_753963 ?auto_753968 ) ) ( not ( = ?auto_753963 ?auto_753969 ) ) ( not ( = ?auto_753963 ?auto_753970 ) ) ( not ( = ?auto_753963 ?auto_753971 ) ) ( not ( = ?auto_753963 ?auto_753972 ) ) ( not ( = ?auto_753963 ?auto_753973 ) ) ( not ( = ?auto_753964 ?auto_753965 ) ) ( not ( = ?auto_753964 ?auto_753966 ) ) ( not ( = ?auto_753964 ?auto_753967 ) ) ( not ( = ?auto_753964 ?auto_753968 ) ) ( not ( = ?auto_753964 ?auto_753969 ) ) ( not ( = ?auto_753964 ?auto_753970 ) ) ( not ( = ?auto_753964 ?auto_753971 ) ) ( not ( = ?auto_753964 ?auto_753972 ) ) ( not ( = ?auto_753964 ?auto_753973 ) ) ( not ( = ?auto_753965 ?auto_753966 ) ) ( not ( = ?auto_753965 ?auto_753967 ) ) ( not ( = ?auto_753965 ?auto_753968 ) ) ( not ( = ?auto_753965 ?auto_753969 ) ) ( not ( = ?auto_753965 ?auto_753970 ) ) ( not ( = ?auto_753965 ?auto_753971 ) ) ( not ( = ?auto_753965 ?auto_753972 ) ) ( not ( = ?auto_753965 ?auto_753973 ) ) ( not ( = ?auto_753966 ?auto_753967 ) ) ( not ( = ?auto_753966 ?auto_753968 ) ) ( not ( = ?auto_753966 ?auto_753969 ) ) ( not ( = ?auto_753966 ?auto_753970 ) ) ( not ( = ?auto_753966 ?auto_753971 ) ) ( not ( = ?auto_753966 ?auto_753972 ) ) ( not ( = ?auto_753966 ?auto_753973 ) ) ( not ( = ?auto_753967 ?auto_753968 ) ) ( not ( = ?auto_753967 ?auto_753969 ) ) ( not ( = ?auto_753967 ?auto_753970 ) ) ( not ( = ?auto_753967 ?auto_753971 ) ) ( not ( = ?auto_753967 ?auto_753972 ) ) ( not ( = ?auto_753967 ?auto_753973 ) ) ( not ( = ?auto_753968 ?auto_753969 ) ) ( not ( = ?auto_753968 ?auto_753970 ) ) ( not ( = ?auto_753968 ?auto_753971 ) ) ( not ( = ?auto_753968 ?auto_753972 ) ) ( not ( = ?auto_753968 ?auto_753973 ) ) ( not ( = ?auto_753969 ?auto_753970 ) ) ( not ( = ?auto_753969 ?auto_753971 ) ) ( not ( = ?auto_753969 ?auto_753972 ) ) ( not ( = ?auto_753969 ?auto_753973 ) ) ( not ( = ?auto_753970 ?auto_753971 ) ) ( not ( = ?auto_753970 ?auto_753972 ) ) ( not ( = ?auto_753970 ?auto_753973 ) ) ( not ( = ?auto_753971 ?auto_753972 ) ) ( not ( = ?auto_753971 ?auto_753973 ) ) ( not ( = ?auto_753972 ?auto_753973 ) ) ( ON ?auto_753971 ?auto_753972 ) ( ON ?auto_753970 ?auto_753971 ) ( ON ?auto_753969 ?auto_753970 ) ( CLEAR ?auto_753967 ) ( ON ?auto_753968 ?auto_753969 ) ( CLEAR ?auto_753968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_753957 ?auto_753958 ?auto_753959 ?auto_753960 ?auto_753961 ?auto_753962 ?auto_753963 ?auto_753964 ?auto_753965 ?auto_753966 ?auto_753967 ?auto_753968 )
      ( MAKE-16PILE ?auto_753957 ?auto_753958 ?auto_753959 ?auto_753960 ?auto_753961 ?auto_753962 ?auto_753963 ?auto_753964 ?auto_753965 ?auto_753966 ?auto_753967 ?auto_753968 ?auto_753969 ?auto_753970 ?auto_753971 ?auto_753972 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754023 - BLOCK
      ?auto_754024 - BLOCK
      ?auto_754025 - BLOCK
      ?auto_754026 - BLOCK
      ?auto_754027 - BLOCK
      ?auto_754028 - BLOCK
      ?auto_754029 - BLOCK
      ?auto_754030 - BLOCK
      ?auto_754031 - BLOCK
      ?auto_754032 - BLOCK
      ?auto_754033 - BLOCK
      ?auto_754034 - BLOCK
      ?auto_754035 - BLOCK
      ?auto_754036 - BLOCK
      ?auto_754037 - BLOCK
      ?auto_754038 - BLOCK
    )
    :vars
    (
      ?auto_754039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754038 ?auto_754039 ) ( ON-TABLE ?auto_754023 ) ( ON ?auto_754024 ?auto_754023 ) ( ON ?auto_754025 ?auto_754024 ) ( ON ?auto_754026 ?auto_754025 ) ( ON ?auto_754027 ?auto_754026 ) ( ON ?auto_754028 ?auto_754027 ) ( ON ?auto_754029 ?auto_754028 ) ( ON ?auto_754030 ?auto_754029 ) ( ON ?auto_754031 ?auto_754030 ) ( ON ?auto_754032 ?auto_754031 ) ( not ( = ?auto_754023 ?auto_754024 ) ) ( not ( = ?auto_754023 ?auto_754025 ) ) ( not ( = ?auto_754023 ?auto_754026 ) ) ( not ( = ?auto_754023 ?auto_754027 ) ) ( not ( = ?auto_754023 ?auto_754028 ) ) ( not ( = ?auto_754023 ?auto_754029 ) ) ( not ( = ?auto_754023 ?auto_754030 ) ) ( not ( = ?auto_754023 ?auto_754031 ) ) ( not ( = ?auto_754023 ?auto_754032 ) ) ( not ( = ?auto_754023 ?auto_754033 ) ) ( not ( = ?auto_754023 ?auto_754034 ) ) ( not ( = ?auto_754023 ?auto_754035 ) ) ( not ( = ?auto_754023 ?auto_754036 ) ) ( not ( = ?auto_754023 ?auto_754037 ) ) ( not ( = ?auto_754023 ?auto_754038 ) ) ( not ( = ?auto_754023 ?auto_754039 ) ) ( not ( = ?auto_754024 ?auto_754025 ) ) ( not ( = ?auto_754024 ?auto_754026 ) ) ( not ( = ?auto_754024 ?auto_754027 ) ) ( not ( = ?auto_754024 ?auto_754028 ) ) ( not ( = ?auto_754024 ?auto_754029 ) ) ( not ( = ?auto_754024 ?auto_754030 ) ) ( not ( = ?auto_754024 ?auto_754031 ) ) ( not ( = ?auto_754024 ?auto_754032 ) ) ( not ( = ?auto_754024 ?auto_754033 ) ) ( not ( = ?auto_754024 ?auto_754034 ) ) ( not ( = ?auto_754024 ?auto_754035 ) ) ( not ( = ?auto_754024 ?auto_754036 ) ) ( not ( = ?auto_754024 ?auto_754037 ) ) ( not ( = ?auto_754024 ?auto_754038 ) ) ( not ( = ?auto_754024 ?auto_754039 ) ) ( not ( = ?auto_754025 ?auto_754026 ) ) ( not ( = ?auto_754025 ?auto_754027 ) ) ( not ( = ?auto_754025 ?auto_754028 ) ) ( not ( = ?auto_754025 ?auto_754029 ) ) ( not ( = ?auto_754025 ?auto_754030 ) ) ( not ( = ?auto_754025 ?auto_754031 ) ) ( not ( = ?auto_754025 ?auto_754032 ) ) ( not ( = ?auto_754025 ?auto_754033 ) ) ( not ( = ?auto_754025 ?auto_754034 ) ) ( not ( = ?auto_754025 ?auto_754035 ) ) ( not ( = ?auto_754025 ?auto_754036 ) ) ( not ( = ?auto_754025 ?auto_754037 ) ) ( not ( = ?auto_754025 ?auto_754038 ) ) ( not ( = ?auto_754025 ?auto_754039 ) ) ( not ( = ?auto_754026 ?auto_754027 ) ) ( not ( = ?auto_754026 ?auto_754028 ) ) ( not ( = ?auto_754026 ?auto_754029 ) ) ( not ( = ?auto_754026 ?auto_754030 ) ) ( not ( = ?auto_754026 ?auto_754031 ) ) ( not ( = ?auto_754026 ?auto_754032 ) ) ( not ( = ?auto_754026 ?auto_754033 ) ) ( not ( = ?auto_754026 ?auto_754034 ) ) ( not ( = ?auto_754026 ?auto_754035 ) ) ( not ( = ?auto_754026 ?auto_754036 ) ) ( not ( = ?auto_754026 ?auto_754037 ) ) ( not ( = ?auto_754026 ?auto_754038 ) ) ( not ( = ?auto_754026 ?auto_754039 ) ) ( not ( = ?auto_754027 ?auto_754028 ) ) ( not ( = ?auto_754027 ?auto_754029 ) ) ( not ( = ?auto_754027 ?auto_754030 ) ) ( not ( = ?auto_754027 ?auto_754031 ) ) ( not ( = ?auto_754027 ?auto_754032 ) ) ( not ( = ?auto_754027 ?auto_754033 ) ) ( not ( = ?auto_754027 ?auto_754034 ) ) ( not ( = ?auto_754027 ?auto_754035 ) ) ( not ( = ?auto_754027 ?auto_754036 ) ) ( not ( = ?auto_754027 ?auto_754037 ) ) ( not ( = ?auto_754027 ?auto_754038 ) ) ( not ( = ?auto_754027 ?auto_754039 ) ) ( not ( = ?auto_754028 ?auto_754029 ) ) ( not ( = ?auto_754028 ?auto_754030 ) ) ( not ( = ?auto_754028 ?auto_754031 ) ) ( not ( = ?auto_754028 ?auto_754032 ) ) ( not ( = ?auto_754028 ?auto_754033 ) ) ( not ( = ?auto_754028 ?auto_754034 ) ) ( not ( = ?auto_754028 ?auto_754035 ) ) ( not ( = ?auto_754028 ?auto_754036 ) ) ( not ( = ?auto_754028 ?auto_754037 ) ) ( not ( = ?auto_754028 ?auto_754038 ) ) ( not ( = ?auto_754028 ?auto_754039 ) ) ( not ( = ?auto_754029 ?auto_754030 ) ) ( not ( = ?auto_754029 ?auto_754031 ) ) ( not ( = ?auto_754029 ?auto_754032 ) ) ( not ( = ?auto_754029 ?auto_754033 ) ) ( not ( = ?auto_754029 ?auto_754034 ) ) ( not ( = ?auto_754029 ?auto_754035 ) ) ( not ( = ?auto_754029 ?auto_754036 ) ) ( not ( = ?auto_754029 ?auto_754037 ) ) ( not ( = ?auto_754029 ?auto_754038 ) ) ( not ( = ?auto_754029 ?auto_754039 ) ) ( not ( = ?auto_754030 ?auto_754031 ) ) ( not ( = ?auto_754030 ?auto_754032 ) ) ( not ( = ?auto_754030 ?auto_754033 ) ) ( not ( = ?auto_754030 ?auto_754034 ) ) ( not ( = ?auto_754030 ?auto_754035 ) ) ( not ( = ?auto_754030 ?auto_754036 ) ) ( not ( = ?auto_754030 ?auto_754037 ) ) ( not ( = ?auto_754030 ?auto_754038 ) ) ( not ( = ?auto_754030 ?auto_754039 ) ) ( not ( = ?auto_754031 ?auto_754032 ) ) ( not ( = ?auto_754031 ?auto_754033 ) ) ( not ( = ?auto_754031 ?auto_754034 ) ) ( not ( = ?auto_754031 ?auto_754035 ) ) ( not ( = ?auto_754031 ?auto_754036 ) ) ( not ( = ?auto_754031 ?auto_754037 ) ) ( not ( = ?auto_754031 ?auto_754038 ) ) ( not ( = ?auto_754031 ?auto_754039 ) ) ( not ( = ?auto_754032 ?auto_754033 ) ) ( not ( = ?auto_754032 ?auto_754034 ) ) ( not ( = ?auto_754032 ?auto_754035 ) ) ( not ( = ?auto_754032 ?auto_754036 ) ) ( not ( = ?auto_754032 ?auto_754037 ) ) ( not ( = ?auto_754032 ?auto_754038 ) ) ( not ( = ?auto_754032 ?auto_754039 ) ) ( not ( = ?auto_754033 ?auto_754034 ) ) ( not ( = ?auto_754033 ?auto_754035 ) ) ( not ( = ?auto_754033 ?auto_754036 ) ) ( not ( = ?auto_754033 ?auto_754037 ) ) ( not ( = ?auto_754033 ?auto_754038 ) ) ( not ( = ?auto_754033 ?auto_754039 ) ) ( not ( = ?auto_754034 ?auto_754035 ) ) ( not ( = ?auto_754034 ?auto_754036 ) ) ( not ( = ?auto_754034 ?auto_754037 ) ) ( not ( = ?auto_754034 ?auto_754038 ) ) ( not ( = ?auto_754034 ?auto_754039 ) ) ( not ( = ?auto_754035 ?auto_754036 ) ) ( not ( = ?auto_754035 ?auto_754037 ) ) ( not ( = ?auto_754035 ?auto_754038 ) ) ( not ( = ?auto_754035 ?auto_754039 ) ) ( not ( = ?auto_754036 ?auto_754037 ) ) ( not ( = ?auto_754036 ?auto_754038 ) ) ( not ( = ?auto_754036 ?auto_754039 ) ) ( not ( = ?auto_754037 ?auto_754038 ) ) ( not ( = ?auto_754037 ?auto_754039 ) ) ( not ( = ?auto_754038 ?auto_754039 ) ) ( ON ?auto_754037 ?auto_754038 ) ( ON ?auto_754036 ?auto_754037 ) ( ON ?auto_754035 ?auto_754036 ) ( ON ?auto_754034 ?auto_754035 ) ( CLEAR ?auto_754032 ) ( ON ?auto_754033 ?auto_754034 ) ( CLEAR ?auto_754033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_754023 ?auto_754024 ?auto_754025 ?auto_754026 ?auto_754027 ?auto_754028 ?auto_754029 ?auto_754030 ?auto_754031 ?auto_754032 ?auto_754033 )
      ( MAKE-16PILE ?auto_754023 ?auto_754024 ?auto_754025 ?auto_754026 ?auto_754027 ?auto_754028 ?auto_754029 ?auto_754030 ?auto_754031 ?auto_754032 ?auto_754033 ?auto_754034 ?auto_754035 ?auto_754036 ?auto_754037 ?auto_754038 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754089 - BLOCK
      ?auto_754090 - BLOCK
      ?auto_754091 - BLOCK
      ?auto_754092 - BLOCK
      ?auto_754093 - BLOCK
      ?auto_754094 - BLOCK
      ?auto_754095 - BLOCK
      ?auto_754096 - BLOCK
      ?auto_754097 - BLOCK
      ?auto_754098 - BLOCK
      ?auto_754099 - BLOCK
      ?auto_754100 - BLOCK
      ?auto_754101 - BLOCK
      ?auto_754102 - BLOCK
      ?auto_754103 - BLOCK
      ?auto_754104 - BLOCK
    )
    :vars
    (
      ?auto_754105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754104 ?auto_754105 ) ( ON-TABLE ?auto_754089 ) ( ON ?auto_754090 ?auto_754089 ) ( ON ?auto_754091 ?auto_754090 ) ( ON ?auto_754092 ?auto_754091 ) ( ON ?auto_754093 ?auto_754092 ) ( ON ?auto_754094 ?auto_754093 ) ( ON ?auto_754095 ?auto_754094 ) ( ON ?auto_754096 ?auto_754095 ) ( ON ?auto_754097 ?auto_754096 ) ( not ( = ?auto_754089 ?auto_754090 ) ) ( not ( = ?auto_754089 ?auto_754091 ) ) ( not ( = ?auto_754089 ?auto_754092 ) ) ( not ( = ?auto_754089 ?auto_754093 ) ) ( not ( = ?auto_754089 ?auto_754094 ) ) ( not ( = ?auto_754089 ?auto_754095 ) ) ( not ( = ?auto_754089 ?auto_754096 ) ) ( not ( = ?auto_754089 ?auto_754097 ) ) ( not ( = ?auto_754089 ?auto_754098 ) ) ( not ( = ?auto_754089 ?auto_754099 ) ) ( not ( = ?auto_754089 ?auto_754100 ) ) ( not ( = ?auto_754089 ?auto_754101 ) ) ( not ( = ?auto_754089 ?auto_754102 ) ) ( not ( = ?auto_754089 ?auto_754103 ) ) ( not ( = ?auto_754089 ?auto_754104 ) ) ( not ( = ?auto_754089 ?auto_754105 ) ) ( not ( = ?auto_754090 ?auto_754091 ) ) ( not ( = ?auto_754090 ?auto_754092 ) ) ( not ( = ?auto_754090 ?auto_754093 ) ) ( not ( = ?auto_754090 ?auto_754094 ) ) ( not ( = ?auto_754090 ?auto_754095 ) ) ( not ( = ?auto_754090 ?auto_754096 ) ) ( not ( = ?auto_754090 ?auto_754097 ) ) ( not ( = ?auto_754090 ?auto_754098 ) ) ( not ( = ?auto_754090 ?auto_754099 ) ) ( not ( = ?auto_754090 ?auto_754100 ) ) ( not ( = ?auto_754090 ?auto_754101 ) ) ( not ( = ?auto_754090 ?auto_754102 ) ) ( not ( = ?auto_754090 ?auto_754103 ) ) ( not ( = ?auto_754090 ?auto_754104 ) ) ( not ( = ?auto_754090 ?auto_754105 ) ) ( not ( = ?auto_754091 ?auto_754092 ) ) ( not ( = ?auto_754091 ?auto_754093 ) ) ( not ( = ?auto_754091 ?auto_754094 ) ) ( not ( = ?auto_754091 ?auto_754095 ) ) ( not ( = ?auto_754091 ?auto_754096 ) ) ( not ( = ?auto_754091 ?auto_754097 ) ) ( not ( = ?auto_754091 ?auto_754098 ) ) ( not ( = ?auto_754091 ?auto_754099 ) ) ( not ( = ?auto_754091 ?auto_754100 ) ) ( not ( = ?auto_754091 ?auto_754101 ) ) ( not ( = ?auto_754091 ?auto_754102 ) ) ( not ( = ?auto_754091 ?auto_754103 ) ) ( not ( = ?auto_754091 ?auto_754104 ) ) ( not ( = ?auto_754091 ?auto_754105 ) ) ( not ( = ?auto_754092 ?auto_754093 ) ) ( not ( = ?auto_754092 ?auto_754094 ) ) ( not ( = ?auto_754092 ?auto_754095 ) ) ( not ( = ?auto_754092 ?auto_754096 ) ) ( not ( = ?auto_754092 ?auto_754097 ) ) ( not ( = ?auto_754092 ?auto_754098 ) ) ( not ( = ?auto_754092 ?auto_754099 ) ) ( not ( = ?auto_754092 ?auto_754100 ) ) ( not ( = ?auto_754092 ?auto_754101 ) ) ( not ( = ?auto_754092 ?auto_754102 ) ) ( not ( = ?auto_754092 ?auto_754103 ) ) ( not ( = ?auto_754092 ?auto_754104 ) ) ( not ( = ?auto_754092 ?auto_754105 ) ) ( not ( = ?auto_754093 ?auto_754094 ) ) ( not ( = ?auto_754093 ?auto_754095 ) ) ( not ( = ?auto_754093 ?auto_754096 ) ) ( not ( = ?auto_754093 ?auto_754097 ) ) ( not ( = ?auto_754093 ?auto_754098 ) ) ( not ( = ?auto_754093 ?auto_754099 ) ) ( not ( = ?auto_754093 ?auto_754100 ) ) ( not ( = ?auto_754093 ?auto_754101 ) ) ( not ( = ?auto_754093 ?auto_754102 ) ) ( not ( = ?auto_754093 ?auto_754103 ) ) ( not ( = ?auto_754093 ?auto_754104 ) ) ( not ( = ?auto_754093 ?auto_754105 ) ) ( not ( = ?auto_754094 ?auto_754095 ) ) ( not ( = ?auto_754094 ?auto_754096 ) ) ( not ( = ?auto_754094 ?auto_754097 ) ) ( not ( = ?auto_754094 ?auto_754098 ) ) ( not ( = ?auto_754094 ?auto_754099 ) ) ( not ( = ?auto_754094 ?auto_754100 ) ) ( not ( = ?auto_754094 ?auto_754101 ) ) ( not ( = ?auto_754094 ?auto_754102 ) ) ( not ( = ?auto_754094 ?auto_754103 ) ) ( not ( = ?auto_754094 ?auto_754104 ) ) ( not ( = ?auto_754094 ?auto_754105 ) ) ( not ( = ?auto_754095 ?auto_754096 ) ) ( not ( = ?auto_754095 ?auto_754097 ) ) ( not ( = ?auto_754095 ?auto_754098 ) ) ( not ( = ?auto_754095 ?auto_754099 ) ) ( not ( = ?auto_754095 ?auto_754100 ) ) ( not ( = ?auto_754095 ?auto_754101 ) ) ( not ( = ?auto_754095 ?auto_754102 ) ) ( not ( = ?auto_754095 ?auto_754103 ) ) ( not ( = ?auto_754095 ?auto_754104 ) ) ( not ( = ?auto_754095 ?auto_754105 ) ) ( not ( = ?auto_754096 ?auto_754097 ) ) ( not ( = ?auto_754096 ?auto_754098 ) ) ( not ( = ?auto_754096 ?auto_754099 ) ) ( not ( = ?auto_754096 ?auto_754100 ) ) ( not ( = ?auto_754096 ?auto_754101 ) ) ( not ( = ?auto_754096 ?auto_754102 ) ) ( not ( = ?auto_754096 ?auto_754103 ) ) ( not ( = ?auto_754096 ?auto_754104 ) ) ( not ( = ?auto_754096 ?auto_754105 ) ) ( not ( = ?auto_754097 ?auto_754098 ) ) ( not ( = ?auto_754097 ?auto_754099 ) ) ( not ( = ?auto_754097 ?auto_754100 ) ) ( not ( = ?auto_754097 ?auto_754101 ) ) ( not ( = ?auto_754097 ?auto_754102 ) ) ( not ( = ?auto_754097 ?auto_754103 ) ) ( not ( = ?auto_754097 ?auto_754104 ) ) ( not ( = ?auto_754097 ?auto_754105 ) ) ( not ( = ?auto_754098 ?auto_754099 ) ) ( not ( = ?auto_754098 ?auto_754100 ) ) ( not ( = ?auto_754098 ?auto_754101 ) ) ( not ( = ?auto_754098 ?auto_754102 ) ) ( not ( = ?auto_754098 ?auto_754103 ) ) ( not ( = ?auto_754098 ?auto_754104 ) ) ( not ( = ?auto_754098 ?auto_754105 ) ) ( not ( = ?auto_754099 ?auto_754100 ) ) ( not ( = ?auto_754099 ?auto_754101 ) ) ( not ( = ?auto_754099 ?auto_754102 ) ) ( not ( = ?auto_754099 ?auto_754103 ) ) ( not ( = ?auto_754099 ?auto_754104 ) ) ( not ( = ?auto_754099 ?auto_754105 ) ) ( not ( = ?auto_754100 ?auto_754101 ) ) ( not ( = ?auto_754100 ?auto_754102 ) ) ( not ( = ?auto_754100 ?auto_754103 ) ) ( not ( = ?auto_754100 ?auto_754104 ) ) ( not ( = ?auto_754100 ?auto_754105 ) ) ( not ( = ?auto_754101 ?auto_754102 ) ) ( not ( = ?auto_754101 ?auto_754103 ) ) ( not ( = ?auto_754101 ?auto_754104 ) ) ( not ( = ?auto_754101 ?auto_754105 ) ) ( not ( = ?auto_754102 ?auto_754103 ) ) ( not ( = ?auto_754102 ?auto_754104 ) ) ( not ( = ?auto_754102 ?auto_754105 ) ) ( not ( = ?auto_754103 ?auto_754104 ) ) ( not ( = ?auto_754103 ?auto_754105 ) ) ( not ( = ?auto_754104 ?auto_754105 ) ) ( ON ?auto_754103 ?auto_754104 ) ( ON ?auto_754102 ?auto_754103 ) ( ON ?auto_754101 ?auto_754102 ) ( ON ?auto_754100 ?auto_754101 ) ( ON ?auto_754099 ?auto_754100 ) ( CLEAR ?auto_754097 ) ( ON ?auto_754098 ?auto_754099 ) ( CLEAR ?auto_754098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_754089 ?auto_754090 ?auto_754091 ?auto_754092 ?auto_754093 ?auto_754094 ?auto_754095 ?auto_754096 ?auto_754097 ?auto_754098 )
      ( MAKE-16PILE ?auto_754089 ?auto_754090 ?auto_754091 ?auto_754092 ?auto_754093 ?auto_754094 ?auto_754095 ?auto_754096 ?auto_754097 ?auto_754098 ?auto_754099 ?auto_754100 ?auto_754101 ?auto_754102 ?auto_754103 ?auto_754104 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754155 - BLOCK
      ?auto_754156 - BLOCK
      ?auto_754157 - BLOCK
      ?auto_754158 - BLOCK
      ?auto_754159 - BLOCK
      ?auto_754160 - BLOCK
      ?auto_754161 - BLOCK
      ?auto_754162 - BLOCK
      ?auto_754163 - BLOCK
      ?auto_754164 - BLOCK
      ?auto_754165 - BLOCK
      ?auto_754166 - BLOCK
      ?auto_754167 - BLOCK
      ?auto_754168 - BLOCK
      ?auto_754169 - BLOCK
      ?auto_754170 - BLOCK
    )
    :vars
    (
      ?auto_754171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754170 ?auto_754171 ) ( ON-TABLE ?auto_754155 ) ( ON ?auto_754156 ?auto_754155 ) ( ON ?auto_754157 ?auto_754156 ) ( ON ?auto_754158 ?auto_754157 ) ( ON ?auto_754159 ?auto_754158 ) ( ON ?auto_754160 ?auto_754159 ) ( ON ?auto_754161 ?auto_754160 ) ( ON ?auto_754162 ?auto_754161 ) ( not ( = ?auto_754155 ?auto_754156 ) ) ( not ( = ?auto_754155 ?auto_754157 ) ) ( not ( = ?auto_754155 ?auto_754158 ) ) ( not ( = ?auto_754155 ?auto_754159 ) ) ( not ( = ?auto_754155 ?auto_754160 ) ) ( not ( = ?auto_754155 ?auto_754161 ) ) ( not ( = ?auto_754155 ?auto_754162 ) ) ( not ( = ?auto_754155 ?auto_754163 ) ) ( not ( = ?auto_754155 ?auto_754164 ) ) ( not ( = ?auto_754155 ?auto_754165 ) ) ( not ( = ?auto_754155 ?auto_754166 ) ) ( not ( = ?auto_754155 ?auto_754167 ) ) ( not ( = ?auto_754155 ?auto_754168 ) ) ( not ( = ?auto_754155 ?auto_754169 ) ) ( not ( = ?auto_754155 ?auto_754170 ) ) ( not ( = ?auto_754155 ?auto_754171 ) ) ( not ( = ?auto_754156 ?auto_754157 ) ) ( not ( = ?auto_754156 ?auto_754158 ) ) ( not ( = ?auto_754156 ?auto_754159 ) ) ( not ( = ?auto_754156 ?auto_754160 ) ) ( not ( = ?auto_754156 ?auto_754161 ) ) ( not ( = ?auto_754156 ?auto_754162 ) ) ( not ( = ?auto_754156 ?auto_754163 ) ) ( not ( = ?auto_754156 ?auto_754164 ) ) ( not ( = ?auto_754156 ?auto_754165 ) ) ( not ( = ?auto_754156 ?auto_754166 ) ) ( not ( = ?auto_754156 ?auto_754167 ) ) ( not ( = ?auto_754156 ?auto_754168 ) ) ( not ( = ?auto_754156 ?auto_754169 ) ) ( not ( = ?auto_754156 ?auto_754170 ) ) ( not ( = ?auto_754156 ?auto_754171 ) ) ( not ( = ?auto_754157 ?auto_754158 ) ) ( not ( = ?auto_754157 ?auto_754159 ) ) ( not ( = ?auto_754157 ?auto_754160 ) ) ( not ( = ?auto_754157 ?auto_754161 ) ) ( not ( = ?auto_754157 ?auto_754162 ) ) ( not ( = ?auto_754157 ?auto_754163 ) ) ( not ( = ?auto_754157 ?auto_754164 ) ) ( not ( = ?auto_754157 ?auto_754165 ) ) ( not ( = ?auto_754157 ?auto_754166 ) ) ( not ( = ?auto_754157 ?auto_754167 ) ) ( not ( = ?auto_754157 ?auto_754168 ) ) ( not ( = ?auto_754157 ?auto_754169 ) ) ( not ( = ?auto_754157 ?auto_754170 ) ) ( not ( = ?auto_754157 ?auto_754171 ) ) ( not ( = ?auto_754158 ?auto_754159 ) ) ( not ( = ?auto_754158 ?auto_754160 ) ) ( not ( = ?auto_754158 ?auto_754161 ) ) ( not ( = ?auto_754158 ?auto_754162 ) ) ( not ( = ?auto_754158 ?auto_754163 ) ) ( not ( = ?auto_754158 ?auto_754164 ) ) ( not ( = ?auto_754158 ?auto_754165 ) ) ( not ( = ?auto_754158 ?auto_754166 ) ) ( not ( = ?auto_754158 ?auto_754167 ) ) ( not ( = ?auto_754158 ?auto_754168 ) ) ( not ( = ?auto_754158 ?auto_754169 ) ) ( not ( = ?auto_754158 ?auto_754170 ) ) ( not ( = ?auto_754158 ?auto_754171 ) ) ( not ( = ?auto_754159 ?auto_754160 ) ) ( not ( = ?auto_754159 ?auto_754161 ) ) ( not ( = ?auto_754159 ?auto_754162 ) ) ( not ( = ?auto_754159 ?auto_754163 ) ) ( not ( = ?auto_754159 ?auto_754164 ) ) ( not ( = ?auto_754159 ?auto_754165 ) ) ( not ( = ?auto_754159 ?auto_754166 ) ) ( not ( = ?auto_754159 ?auto_754167 ) ) ( not ( = ?auto_754159 ?auto_754168 ) ) ( not ( = ?auto_754159 ?auto_754169 ) ) ( not ( = ?auto_754159 ?auto_754170 ) ) ( not ( = ?auto_754159 ?auto_754171 ) ) ( not ( = ?auto_754160 ?auto_754161 ) ) ( not ( = ?auto_754160 ?auto_754162 ) ) ( not ( = ?auto_754160 ?auto_754163 ) ) ( not ( = ?auto_754160 ?auto_754164 ) ) ( not ( = ?auto_754160 ?auto_754165 ) ) ( not ( = ?auto_754160 ?auto_754166 ) ) ( not ( = ?auto_754160 ?auto_754167 ) ) ( not ( = ?auto_754160 ?auto_754168 ) ) ( not ( = ?auto_754160 ?auto_754169 ) ) ( not ( = ?auto_754160 ?auto_754170 ) ) ( not ( = ?auto_754160 ?auto_754171 ) ) ( not ( = ?auto_754161 ?auto_754162 ) ) ( not ( = ?auto_754161 ?auto_754163 ) ) ( not ( = ?auto_754161 ?auto_754164 ) ) ( not ( = ?auto_754161 ?auto_754165 ) ) ( not ( = ?auto_754161 ?auto_754166 ) ) ( not ( = ?auto_754161 ?auto_754167 ) ) ( not ( = ?auto_754161 ?auto_754168 ) ) ( not ( = ?auto_754161 ?auto_754169 ) ) ( not ( = ?auto_754161 ?auto_754170 ) ) ( not ( = ?auto_754161 ?auto_754171 ) ) ( not ( = ?auto_754162 ?auto_754163 ) ) ( not ( = ?auto_754162 ?auto_754164 ) ) ( not ( = ?auto_754162 ?auto_754165 ) ) ( not ( = ?auto_754162 ?auto_754166 ) ) ( not ( = ?auto_754162 ?auto_754167 ) ) ( not ( = ?auto_754162 ?auto_754168 ) ) ( not ( = ?auto_754162 ?auto_754169 ) ) ( not ( = ?auto_754162 ?auto_754170 ) ) ( not ( = ?auto_754162 ?auto_754171 ) ) ( not ( = ?auto_754163 ?auto_754164 ) ) ( not ( = ?auto_754163 ?auto_754165 ) ) ( not ( = ?auto_754163 ?auto_754166 ) ) ( not ( = ?auto_754163 ?auto_754167 ) ) ( not ( = ?auto_754163 ?auto_754168 ) ) ( not ( = ?auto_754163 ?auto_754169 ) ) ( not ( = ?auto_754163 ?auto_754170 ) ) ( not ( = ?auto_754163 ?auto_754171 ) ) ( not ( = ?auto_754164 ?auto_754165 ) ) ( not ( = ?auto_754164 ?auto_754166 ) ) ( not ( = ?auto_754164 ?auto_754167 ) ) ( not ( = ?auto_754164 ?auto_754168 ) ) ( not ( = ?auto_754164 ?auto_754169 ) ) ( not ( = ?auto_754164 ?auto_754170 ) ) ( not ( = ?auto_754164 ?auto_754171 ) ) ( not ( = ?auto_754165 ?auto_754166 ) ) ( not ( = ?auto_754165 ?auto_754167 ) ) ( not ( = ?auto_754165 ?auto_754168 ) ) ( not ( = ?auto_754165 ?auto_754169 ) ) ( not ( = ?auto_754165 ?auto_754170 ) ) ( not ( = ?auto_754165 ?auto_754171 ) ) ( not ( = ?auto_754166 ?auto_754167 ) ) ( not ( = ?auto_754166 ?auto_754168 ) ) ( not ( = ?auto_754166 ?auto_754169 ) ) ( not ( = ?auto_754166 ?auto_754170 ) ) ( not ( = ?auto_754166 ?auto_754171 ) ) ( not ( = ?auto_754167 ?auto_754168 ) ) ( not ( = ?auto_754167 ?auto_754169 ) ) ( not ( = ?auto_754167 ?auto_754170 ) ) ( not ( = ?auto_754167 ?auto_754171 ) ) ( not ( = ?auto_754168 ?auto_754169 ) ) ( not ( = ?auto_754168 ?auto_754170 ) ) ( not ( = ?auto_754168 ?auto_754171 ) ) ( not ( = ?auto_754169 ?auto_754170 ) ) ( not ( = ?auto_754169 ?auto_754171 ) ) ( not ( = ?auto_754170 ?auto_754171 ) ) ( ON ?auto_754169 ?auto_754170 ) ( ON ?auto_754168 ?auto_754169 ) ( ON ?auto_754167 ?auto_754168 ) ( ON ?auto_754166 ?auto_754167 ) ( ON ?auto_754165 ?auto_754166 ) ( ON ?auto_754164 ?auto_754165 ) ( CLEAR ?auto_754162 ) ( ON ?auto_754163 ?auto_754164 ) ( CLEAR ?auto_754163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_754155 ?auto_754156 ?auto_754157 ?auto_754158 ?auto_754159 ?auto_754160 ?auto_754161 ?auto_754162 ?auto_754163 )
      ( MAKE-16PILE ?auto_754155 ?auto_754156 ?auto_754157 ?auto_754158 ?auto_754159 ?auto_754160 ?auto_754161 ?auto_754162 ?auto_754163 ?auto_754164 ?auto_754165 ?auto_754166 ?auto_754167 ?auto_754168 ?auto_754169 ?auto_754170 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754221 - BLOCK
      ?auto_754222 - BLOCK
      ?auto_754223 - BLOCK
      ?auto_754224 - BLOCK
      ?auto_754225 - BLOCK
      ?auto_754226 - BLOCK
      ?auto_754227 - BLOCK
      ?auto_754228 - BLOCK
      ?auto_754229 - BLOCK
      ?auto_754230 - BLOCK
      ?auto_754231 - BLOCK
      ?auto_754232 - BLOCK
      ?auto_754233 - BLOCK
      ?auto_754234 - BLOCK
      ?auto_754235 - BLOCK
      ?auto_754236 - BLOCK
    )
    :vars
    (
      ?auto_754237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754236 ?auto_754237 ) ( ON-TABLE ?auto_754221 ) ( ON ?auto_754222 ?auto_754221 ) ( ON ?auto_754223 ?auto_754222 ) ( ON ?auto_754224 ?auto_754223 ) ( ON ?auto_754225 ?auto_754224 ) ( ON ?auto_754226 ?auto_754225 ) ( ON ?auto_754227 ?auto_754226 ) ( not ( = ?auto_754221 ?auto_754222 ) ) ( not ( = ?auto_754221 ?auto_754223 ) ) ( not ( = ?auto_754221 ?auto_754224 ) ) ( not ( = ?auto_754221 ?auto_754225 ) ) ( not ( = ?auto_754221 ?auto_754226 ) ) ( not ( = ?auto_754221 ?auto_754227 ) ) ( not ( = ?auto_754221 ?auto_754228 ) ) ( not ( = ?auto_754221 ?auto_754229 ) ) ( not ( = ?auto_754221 ?auto_754230 ) ) ( not ( = ?auto_754221 ?auto_754231 ) ) ( not ( = ?auto_754221 ?auto_754232 ) ) ( not ( = ?auto_754221 ?auto_754233 ) ) ( not ( = ?auto_754221 ?auto_754234 ) ) ( not ( = ?auto_754221 ?auto_754235 ) ) ( not ( = ?auto_754221 ?auto_754236 ) ) ( not ( = ?auto_754221 ?auto_754237 ) ) ( not ( = ?auto_754222 ?auto_754223 ) ) ( not ( = ?auto_754222 ?auto_754224 ) ) ( not ( = ?auto_754222 ?auto_754225 ) ) ( not ( = ?auto_754222 ?auto_754226 ) ) ( not ( = ?auto_754222 ?auto_754227 ) ) ( not ( = ?auto_754222 ?auto_754228 ) ) ( not ( = ?auto_754222 ?auto_754229 ) ) ( not ( = ?auto_754222 ?auto_754230 ) ) ( not ( = ?auto_754222 ?auto_754231 ) ) ( not ( = ?auto_754222 ?auto_754232 ) ) ( not ( = ?auto_754222 ?auto_754233 ) ) ( not ( = ?auto_754222 ?auto_754234 ) ) ( not ( = ?auto_754222 ?auto_754235 ) ) ( not ( = ?auto_754222 ?auto_754236 ) ) ( not ( = ?auto_754222 ?auto_754237 ) ) ( not ( = ?auto_754223 ?auto_754224 ) ) ( not ( = ?auto_754223 ?auto_754225 ) ) ( not ( = ?auto_754223 ?auto_754226 ) ) ( not ( = ?auto_754223 ?auto_754227 ) ) ( not ( = ?auto_754223 ?auto_754228 ) ) ( not ( = ?auto_754223 ?auto_754229 ) ) ( not ( = ?auto_754223 ?auto_754230 ) ) ( not ( = ?auto_754223 ?auto_754231 ) ) ( not ( = ?auto_754223 ?auto_754232 ) ) ( not ( = ?auto_754223 ?auto_754233 ) ) ( not ( = ?auto_754223 ?auto_754234 ) ) ( not ( = ?auto_754223 ?auto_754235 ) ) ( not ( = ?auto_754223 ?auto_754236 ) ) ( not ( = ?auto_754223 ?auto_754237 ) ) ( not ( = ?auto_754224 ?auto_754225 ) ) ( not ( = ?auto_754224 ?auto_754226 ) ) ( not ( = ?auto_754224 ?auto_754227 ) ) ( not ( = ?auto_754224 ?auto_754228 ) ) ( not ( = ?auto_754224 ?auto_754229 ) ) ( not ( = ?auto_754224 ?auto_754230 ) ) ( not ( = ?auto_754224 ?auto_754231 ) ) ( not ( = ?auto_754224 ?auto_754232 ) ) ( not ( = ?auto_754224 ?auto_754233 ) ) ( not ( = ?auto_754224 ?auto_754234 ) ) ( not ( = ?auto_754224 ?auto_754235 ) ) ( not ( = ?auto_754224 ?auto_754236 ) ) ( not ( = ?auto_754224 ?auto_754237 ) ) ( not ( = ?auto_754225 ?auto_754226 ) ) ( not ( = ?auto_754225 ?auto_754227 ) ) ( not ( = ?auto_754225 ?auto_754228 ) ) ( not ( = ?auto_754225 ?auto_754229 ) ) ( not ( = ?auto_754225 ?auto_754230 ) ) ( not ( = ?auto_754225 ?auto_754231 ) ) ( not ( = ?auto_754225 ?auto_754232 ) ) ( not ( = ?auto_754225 ?auto_754233 ) ) ( not ( = ?auto_754225 ?auto_754234 ) ) ( not ( = ?auto_754225 ?auto_754235 ) ) ( not ( = ?auto_754225 ?auto_754236 ) ) ( not ( = ?auto_754225 ?auto_754237 ) ) ( not ( = ?auto_754226 ?auto_754227 ) ) ( not ( = ?auto_754226 ?auto_754228 ) ) ( not ( = ?auto_754226 ?auto_754229 ) ) ( not ( = ?auto_754226 ?auto_754230 ) ) ( not ( = ?auto_754226 ?auto_754231 ) ) ( not ( = ?auto_754226 ?auto_754232 ) ) ( not ( = ?auto_754226 ?auto_754233 ) ) ( not ( = ?auto_754226 ?auto_754234 ) ) ( not ( = ?auto_754226 ?auto_754235 ) ) ( not ( = ?auto_754226 ?auto_754236 ) ) ( not ( = ?auto_754226 ?auto_754237 ) ) ( not ( = ?auto_754227 ?auto_754228 ) ) ( not ( = ?auto_754227 ?auto_754229 ) ) ( not ( = ?auto_754227 ?auto_754230 ) ) ( not ( = ?auto_754227 ?auto_754231 ) ) ( not ( = ?auto_754227 ?auto_754232 ) ) ( not ( = ?auto_754227 ?auto_754233 ) ) ( not ( = ?auto_754227 ?auto_754234 ) ) ( not ( = ?auto_754227 ?auto_754235 ) ) ( not ( = ?auto_754227 ?auto_754236 ) ) ( not ( = ?auto_754227 ?auto_754237 ) ) ( not ( = ?auto_754228 ?auto_754229 ) ) ( not ( = ?auto_754228 ?auto_754230 ) ) ( not ( = ?auto_754228 ?auto_754231 ) ) ( not ( = ?auto_754228 ?auto_754232 ) ) ( not ( = ?auto_754228 ?auto_754233 ) ) ( not ( = ?auto_754228 ?auto_754234 ) ) ( not ( = ?auto_754228 ?auto_754235 ) ) ( not ( = ?auto_754228 ?auto_754236 ) ) ( not ( = ?auto_754228 ?auto_754237 ) ) ( not ( = ?auto_754229 ?auto_754230 ) ) ( not ( = ?auto_754229 ?auto_754231 ) ) ( not ( = ?auto_754229 ?auto_754232 ) ) ( not ( = ?auto_754229 ?auto_754233 ) ) ( not ( = ?auto_754229 ?auto_754234 ) ) ( not ( = ?auto_754229 ?auto_754235 ) ) ( not ( = ?auto_754229 ?auto_754236 ) ) ( not ( = ?auto_754229 ?auto_754237 ) ) ( not ( = ?auto_754230 ?auto_754231 ) ) ( not ( = ?auto_754230 ?auto_754232 ) ) ( not ( = ?auto_754230 ?auto_754233 ) ) ( not ( = ?auto_754230 ?auto_754234 ) ) ( not ( = ?auto_754230 ?auto_754235 ) ) ( not ( = ?auto_754230 ?auto_754236 ) ) ( not ( = ?auto_754230 ?auto_754237 ) ) ( not ( = ?auto_754231 ?auto_754232 ) ) ( not ( = ?auto_754231 ?auto_754233 ) ) ( not ( = ?auto_754231 ?auto_754234 ) ) ( not ( = ?auto_754231 ?auto_754235 ) ) ( not ( = ?auto_754231 ?auto_754236 ) ) ( not ( = ?auto_754231 ?auto_754237 ) ) ( not ( = ?auto_754232 ?auto_754233 ) ) ( not ( = ?auto_754232 ?auto_754234 ) ) ( not ( = ?auto_754232 ?auto_754235 ) ) ( not ( = ?auto_754232 ?auto_754236 ) ) ( not ( = ?auto_754232 ?auto_754237 ) ) ( not ( = ?auto_754233 ?auto_754234 ) ) ( not ( = ?auto_754233 ?auto_754235 ) ) ( not ( = ?auto_754233 ?auto_754236 ) ) ( not ( = ?auto_754233 ?auto_754237 ) ) ( not ( = ?auto_754234 ?auto_754235 ) ) ( not ( = ?auto_754234 ?auto_754236 ) ) ( not ( = ?auto_754234 ?auto_754237 ) ) ( not ( = ?auto_754235 ?auto_754236 ) ) ( not ( = ?auto_754235 ?auto_754237 ) ) ( not ( = ?auto_754236 ?auto_754237 ) ) ( ON ?auto_754235 ?auto_754236 ) ( ON ?auto_754234 ?auto_754235 ) ( ON ?auto_754233 ?auto_754234 ) ( ON ?auto_754232 ?auto_754233 ) ( ON ?auto_754231 ?auto_754232 ) ( ON ?auto_754230 ?auto_754231 ) ( ON ?auto_754229 ?auto_754230 ) ( CLEAR ?auto_754227 ) ( ON ?auto_754228 ?auto_754229 ) ( CLEAR ?auto_754228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_754221 ?auto_754222 ?auto_754223 ?auto_754224 ?auto_754225 ?auto_754226 ?auto_754227 ?auto_754228 )
      ( MAKE-16PILE ?auto_754221 ?auto_754222 ?auto_754223 ?auto_754224 ?auto_754225 ?auto_754226 ?auto_754227 ?auto_754228 ?auto_754229 ?auto_754230 ?auto_754231 ?auto_754232 ?auto_754233 ?auto_754234 ?auto_754235 ?auto_754236 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754287 - BLOCK
      ?auto_754288 - BLOCK
      ?auto_754289 - BLOCK
      ?auto_754290 - BLOCK
      ?auto_754291 - BLOCK
      ?auto_754292 - BLOCK
      ?auto_754293 - BLOCK
      ?auto_754294 - BLOCK
      ?auto_754295 - BLOCK
      ?auto_754296 - BLOCK
      ?auto_754297 - BLOCK
      ?auto_754298 - BLOCK
      ?auto_754299 - BLOCK
      ?auto_754300 - BLOCK
      ?auto_754301 - BLOCK
      ?auto_754302 - BLOCK
    )
    :vars
    (
      ?auto_754303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754302 ?auto_754303 ) ( ON-TABLE ?auto_754287 ) ( ON ?auto_754288 ?auto_754287 ) ( ON ?auto_754289 ?auto_754288 ) ( ON ?auto_754290 ?auto_754289 ) ( ON ?auto_754291 ?auto_754290 ) ( ON ?auto_754292 ?auto_754291 ) ( not ( = ?auto_754287 ?auto_754288 ) ) ( not ( = ?auto_754287 ?auto_754289 ) ) ( not ( = ?auto_754287 ?auto_754290 ) ) ( not ( = ?auto_754287 ?auto_754291 ) ) ( not ( = ?auto_754287 ?auto_754292 ) ) ( not ( = ?auto_754287 ?auto_754293 ) ) ( not ( = ?auto_754287 ?auto_754294 ) ) ( not ( = ?auto_754287 ?auto_754295 ) ) ( not ( = ?auto_754287 ?auto_754296 ) ) ( not ( = ?auto_754287 ?auto_754297 ) ) ( not ( = ?auto_754287 ?auto_754298 ) ) ( not ( = ?auto_754287 ?auto_754299 ) ) ( not ( = ?auto_754287 ?auto_754300 ) ) ( not ( = ?auto_754287 ?auto_754301 ) ) ( not ( = ?auto_754287 ?auto_754302 ) ) ( not ( = ?auto_754287 ?auto_754303 ) ) ( not ( = ?auto_754288 ?auto_754289 ) ) ( not ( = ?auto_754288 ?auto_754290 ) ) ( not ( = ?auto_754288 ?auto_754291 ) ) ( not ( = ?auto_754288 ?auto_754292 ) ) ( not ( = ?auto_754288 ?auto_754293 ) ) ( not ( = ?auto_754288 ?auto_754294 ) ) ( not ( = ?auto_754288 ?auto_754295 ) ) ( not ( = ?auto_754288 ?auto_754296 ) ) ( not ( = ?auto_754288 ?auto_754297 ) ) ( not ( = ?auto_754288 ?auto_754298 ) ) ( not ( = ?auto_754288 ?auto_754299 ) ) ( not ( = ?auto_754288 ?auto_754300 ) ) ( not ( = ?auto_754288 ?auto_754301 ) ) ( not ( = ?auto_754288 ?auto_754302 ) ) ( not ( = ?auto_754288 ?auto_754303 ) ) ( not ( = ?auto_754289 ?auto_754290 ) ) ( not ( = ?auto_754289 ?auto_754291 ) ) ( not ( = ?auto_754289 ?auto_754292 ) ) ( not ( = ?auto_754289 ?auto_754293 ) ) ( not ( = ?auto_754289 ?auto_754294 ) ) ( not ( = ?auto_754289 ?auto_754295 ) ) ( not ( = ?auto_754289 ?auto_754296 ) ) ( not ( = ?auto_754289 ?auto_754297 ) ) ( not ( = ?auto_754289 ?auto_754298 ) ) ( not ( = ?auto_754289 ?auto_754299 ) ) ( not ( = ?auto_754289 ?auto_754300 ) ) ( not ( = ?auto_754289 ?auto_754301 ) ) ( not ( = ?auto_754289 ?auto_754302 ) ) ( not ( = ?auto_754289 ?auto_754303 ) ) ( not ( = ?auto_754290 ?auto_754291 ) ) ( not ( = ?auto_754290 ?auto_754292 ) ) ( not ( = ?auto_754290 ?auto_754293 ) ) ( not ( = ?auto_754290 ?auto_754294 ) ) ( not ( = ?auto_754290 ?auto_754295 ) ) ( not ( = ?auto_754290 ?auto_754296 ) ) ( not ( = ?auto_754290 ?auto_754297 ) ) ( not ( = ?auto_754290 ?auto_754298 ) ) ( not ( = ?auto_754290 ?auto_754299 ) ) ( not ( = ?auto_754290 ?auto_754300 ) ) ( not ( = ?auto_754290 ?auto_754301 ) ) ( not ( = ?auto_754290 ?auto_754302 ) ) ( not ( = ?auto_754290 ?auto_754303 ) ) ( not ( = ?auto_754291 ?auto_754292 ) ) ( not ( = ?auto_754291 ?auto_754293 ) ) ( not ( = ?auto_754291 ?auto_754294 ) ) ( not ( = ?auto_754291 ?auto_754295 ) ) ( not ( = ?auto_754291 ?auto_754296 ) ) ( not ( = ?auto_754291 ?auto_754297 ) ) ( not ( = ?auto_754291 ?auto_754298 ) ) ( not ( = ?auto_754291 ?auto_754299 ) ) ( not ( = ?auto_754291 ?auto_754300 ) ) ( not ( = ?auto_754291 ?auto_754301 ) ) ( not ( = ?auto_754291 ?auto_754302 ) ) ( not ( = ?auto_754291 ?auto_754303 ) ) ( not ( = ?auto_754292 ?auto_754293 ) ) ( not ( = ?auto_754292 ?auto_754294 ) ) ( not ( = ?auto_754292 ?auto_754295 ) ) ( not ( = ?auto_754292 ?auto_754296 ) ) ( not ( = ?auto_754292 ?auto_754297 ) ) ( not ( = ?auto_754292 ?auto_754298 ) ) ( not ( = ?auto_754292 ?auto_754299 ) ) ( not ( = ?auto_754292 ?auto_754300 ) ) ( not ( = ?auto_754292 ?auto_754301 ) ) ( not ( = ?auto_754292 ?auto_754302 ) ) ( not ( = ?auto_754292 ?auto_754303 ) ) ( not ( = ?auto_754293 ?auto_754294 ) ) ( not ( = ?auto_754293 ?auto_754295 ) ) ( not ( = ?auto_754293 ?auto_754296 ) ) ( not ( = ?auto_754293 ?auto_754297 ) ) ( not ( = ?auto_754293 ?auto_754298 ) ) ( not ( = ?auto_754293 ?auto_754299 ) ) ( not ( = ?auto_754293 ?auto_754300 ) ) ( not ( = ?auto_754293 ?auto_754301 ) ) ( not ( = ?auto_754293 ?auto_754302 ) ) ( not ( = ?auto_754293 ?auto_754303 ) ) ( not ( = ?auto_754294 ?auto_754295 ) ) ( not ( = ?auto_754294 ?auto_754296 ) ) ( not ( = ?auto_754294 ?auto_754297 ) ) ( not ( = ?auto_754294 ?auto_754298 ) ) ( not ( = ?auto_754294 ?auto_754299 ) ) ( not ( = ?auto_754294 ?auto_754300 ) ) ( not ( = ?auto_754294 ?auto_754301 ) ) ( not ( = ?auto_754294 ?auto_754302 ) ) ( not ( = ?auto_754294 ?auto_754303 ) ) ( not ( = ?auto_754295 ?auto_754296 ) ) ( not ( = ?auto_754295 ?auto_754297 ) ) ( not ( = ?auto_754295 ?auto_754298 ) ) ( not ( = ?auto_754295 ?auto_754299 ) ) ( not ( = ?auto_754295 ?auto_754300 ) ) ( not ( = ?auto_754295 ?auto_754301 ) ) ( not ( = ?auto_754295 ?auto_754302 ) ) ( not ( = ?auto_754295 ?auto_754303 ) ) ( not ( = ?auto_754296 ?auto_754297 ) ) ( not ( = ?auto_754296 ?auto_754298 ) ) ( not ( = ?auto_754296 ?auto_754299 ) ) ( not ( = ?auto_754296 ?auto_754300 ) ) ( not ( = ?auto_754296 ?auto_754301 ) ) ( not ( = ?auto_754296 ?auto_754302 ) ) ( not ( = ?auto_754296 ?auto_754303 ) ) ( not ( = ?auto_754297 ?auto_754298 ) ) ( not ( = ?auto_754297 ?auto_754299 ) ) ( not ( = ?auto_754297 ?auto_754300 ) ) ( not ( = ?auto_754297 ?auto_754301 ) ) ( not ( = ?auto_754297 ?auto_754302 ) ) ( not ( = ?auto_754297 ?auto_754303 ) ) ( not ( = ?auto_754298 ?auto_754299 ) ) ( not ( = ?auto_754298 ?auto_754300 ) ) ( not ( = ?auto_754298 ?auto_754301 ) ) ( not ( = ?auto_754298 ?auto_754302 ) ) ( not ( = ?auto_754298 ?auto_754303 ) ) ( not ( = ?auto_754299 ?auto_754300 ) ) ( not ( = ?auto_754299 ?auto_754301 ) ) ( not ( = ?auto_754299 ?auto_754302 ) ) ( not ( = ?auto_754299 ?auto_754303 ) ) ( not ( = ?auto_754300 ?auto_754301 ) ) ( not ( = ?auto_754300 ?auto_754302 ) ) ( not ( = ?auto_754300 ?auto_754303 ) ) ( not ( = ?auto_754301 ?auto_754302 ) ) ( not ( = ?auto_754301 ?auto_754303 ) ) ( not ( = ?auto_754302 ?auto_754303 ) ) ( ON ?auto_754301 ?auto_754302 ) ( ON ?auto_754300 ?auto_754301 ) ( ON ?auto_754299 ?auto_754300 ) ( ON ?auto_754298 ?auto_754299 ) ( ON ?auto_754297 ?auto_754298 ) ( ON ?auto_754296 ?auto_754297 ) ( ON ?auto_754295 ?auto_754296 ) ( ON ?auto_754294 ?auto_754295 ) ( CLEAR ?auto_754292 ) ( ON ?auto_754293 ?auto_754294 ) ( CLEAR ?auto_754293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_754287 ?auto_754288 ?auto_754289 ?auto_754290 ?auto_754291 ?auto_754292 ?auto_754293 )
      ( MAKE-16PILE ?auto_754287 ?auto_754288 ?auto_754289 ?auto_754290 ?auto_754291 ?auto_754292 ?auto_754293 ?auto_754294 ?auto_754295 ?auto_754296 ?auto_754297 ?auto_754298 ?auto_754299 ?auto_754300 ?auto_754301 ?auto_754302 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754353 - BLOCK
      ?auto_754354 - BLOCK
      ?auto_754355 - BLOCK
      ?auto_754356 - BLOCK
      ?auto_754357 - BLOCK
      ?auto_754358 - BLOCK
      ?auto_754359 - BLOCK
      ?auto_754360 - BLOCK
      ?auto_754361 - BLOCK
      ?auto_754362 - BLOCK
      ?auto_754363 - BLOCK
      ?auto_754364 - BLOCK
      ?auto_754365 - BLOCK
      ?auto_754366 - BLOCK
      ?auto_754367 - BLOCK
      ?auto_754368 - BLOCK
    )
    :vars
    (
      ?auto_754369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754368 ?auto_754369 ) ( ON-TABLE ?auto_754353 ) ( ON ?auto_754354 ?auto_754353 ) ( ON ?auto_754355 ?auto_754354 ) ( ON ?auto_754356 ?auto_754355 ) ( ON ?auto_754357 ?auto_754356 ) ( not ( = ?auto_754353 ?auto_754354 ) ) ( not ( = ?auto_754353 ?auto_754355 ) ) ( not ( = ?auto_754353 ?auto_754356 ) ) ( not ( = ?auto_754353 ?auto_754357 ) ) ( not ( = ?auto_754353 ?auto_754358 ) ) ( not ( = ?auto_754353 ?auto_754359 ) ) ( not ( = ?auto_754353 ?auto_754360 ) ) ( not ( = ?auto_754353 ?auto_754361 ) ) ( not ( = ?auto_754353 ?auto_754362 ) ) ( not ( = ?auto_754353 ?auto_754363 ) ) ( not ( = ?auto_754353 ?auto_754364 ) ) ( not ( = ?auto_754353 ?auto_754365 ) ) ( not ( = ?auto_754353 ?auto_754366 ) ) ( not ( = ?auto_754353 ?auto_754367 ) ) ( not ( = ?auto_754353 ?auto_754368 ) ) ( not ( = ?auto_754353 ?auto_754369 ) ) ( not ( = ?auto_754354 ?auto_754355 ) ) ( not ( = ?auto_754354 ?auto_754356 ) ) ( not ( = ?auto_754354 ?auto_754357 ) ) ( not ( = ?auto_754354 ?auto_754358 ) ) ( not ( = ?auto_754354 ?auto_754359 ) ) ( not ( = ?auto_754354 ?auto_754360 ) ) ( not ( = ?auto_754354 ?auto_754361 ) ) ( not ( = ?auto_754354 ?auto_754362 ) ) ( not ( = ?auto_754354 ?auto_754363 ) ) ( not ( = ?auto_754354 ?auto_754364 ) ) ( not ( = ?auto_754354 ?auto_754365 ) ) ( not ( = ?auto_754354 ?auto_754366 ) ) ( not ( = ?auto_754354 ?auto_754367 ) ) ( not ( = ?auto_754354 ?auto_754368 ) ) ( not ( = ?auto_754354 ?auto_754369 ) ) ( not ( = ?auto_754355 ?auto_754356 ) ) ( not ( = ?auto_754355 ?auto_754357 ) ) ( not ( = ?auto_754355 ?auto_754358 ) ) ( not ( = ?auto_754355 ?auto_754359 ) ) ( not ( = ?auto_754355 ?auto_754360 ) ) ( not ( = ?auto_754355 ?auto_754361 ) ) ( not ( = ?auto_754355 ?auto_754362 ) ) ( not ( = ?auto_754355 ?auto_754363 ) ) ( not ( = ?auto_754355 ?auto_754364 ) ) ( not ( = ?auto_754355 ?auto_754365 ) ) ( not ( = ?auto_754355 ?auto_754366 ) ) ( not ( = ?auto_754355 ?auto_754367 ) ) ( not ( = ?auto_754355 ?auto_754368 ) ) ( not ( = ?auto_754355 ?auto_754369 ) ) ( not ( = ?auto_754356 ?auto_754357 ) ) ( not ( = ?auto_754356 ?auto_754358 ) ) ( not ( = ?auto_754356 ?auto_754359 ) ) ( not ( = ?auto_754356 ?auto_754360 ) ) ( not ( = ?auto_754356 ?auto_754361 ) ) ( not ( = ?auto_754356 ?auto_754362 ) ) ( not ( = ?auto_754356 ?auto_754363 ) ) ( not ( = ?auto_754356 ?auto_754364 ) ) ( not ( = ?auto_754356 ?auto_754365 ) ) ( not ( = ?auto_754356 ?auto_754366 ) ) ( not ( = ?auto_754356 ?auto_754367 ) ) ( not ( = ?auto_754356 ?auto_754368 ) ) ( not ( = ?auto_754356 ?auto_754369 ) ) ( not ( = ?auto_754357 ?auto_754358 ) ) ( not ( = ?auto_754357 ?auto_754359 ) ) ( not ( = ?auto_754357 ?auto_754360 ) ) ( not ( = ?auto_754357 ?auto_754361 ) ) ( not ( = ?auto_754357 ?auto_754362 ) ) ( not ( = ?auto_754357 ?auto_754363 ) ) ( not ( = ?auto_754357 ?auto_754364 ) ) ( not ( = ?auto_754357 ?auto_754365 ) ) ( not ( = ?auto_754357 ?auto_754366 ) ) ( not ( = ?auto_754357 ?auto_754367 ) ) ( not ( = ?auto_754357 ?auto_754368 ) ) ( not ( = ?auto_754357 ?auto_754369 ) ) ( not ( = ?auto_754358 ?auto_754359 ) ) ( not ( = ?auto_754358 ?auto_754360 ) ) ( not ( = ?auto_754358 ?auto_754361 ) ) ( not ( = ?auto_754358 ?auto_754362 ) ) ( not ( = ?auto_754358 ?auto_754363 ) ) ( not ( = ?auto_754358 ?auto_754364 ) ) ( not ( = ?auto_754358 ?auto_754365 ) ) ( not ( = ?auto_754358 ?auto_754366 ) ) ( not ( = ?auto_754358 ?auto_754367 ) ) ( not ( = ?auto_754358 ?auto_754368 ) ) ( not ( = ?auto_754358 ?auto_754369 ) ) ( not ( = ?auto_754359 ?auto_754360 ) ) ( not ( = ?auto_754359 ?auto_754361 ) ) ( not ( = ?auto_754359 ?auto_754362 ) ) ( not ( = ?auto_754359 ?auto_754363 ) ) ( not ( = ?auto_754359 ?auto_754364 ) ) ( not ( = ?auto_754359 ?auto_754365 ) ) ( not ( = ?auto_754359 ?auto_754366 ) ) ( not ( = ?auto_754359 ?auto_754367 ) ) ( not ( = ?auto_754359 ?auto_754368 ) ) ( not ( = ?auto_754359 ?auto_754369 ) ) ( not ( = ?auto_754360 ?auto_754361 ) ) ( not ( = ?auto_754360 ?auto_754362 ) ) ( not ( = ?auto_754360 ?auto_754363 ) ) ( not ( = ?auto_754360 ?auto_754364 ) ) ( not ( = ?auto_754360 ?auto_754365 ) ) ( not ( = ?auto_754360 ?auto_754366 ) ) ( not ( = ?auto_754360 ?auto_754367 ) ) ( not ( = ?auto_754360 ?auto_754368 ) ) ( not ( = ?auto_754360 ?auto_754369 ) ) ( not ( = ?auto_754361 ?auto_754362 ) ) ( not ( = ?auto_754361 ?auto_754363 ) ) ( not ( = ?auto_754361 ?auto_754364 ) ) ( not ( = ?auto_754361 ?auto_754365 ) ) ( not ( = ?auto_754361 ?auto_754366 ) ) ( not ( = ?auto_754361 ?auto_754367 ) ) ( not ( = ?auto_754361 ?auto_754368 ) ) ( not ( = ?auto_754361 ?auto_754369 ) ) ( not ( = ?auto_754362 ?auto_754363 ) ) ( not ( = ?auto_754362 ?auto_754364 ) ) ( not ( = ?auto_754362 ?auto_754365 ) ) ( not ( = ?auto_754362 ?auto_754366 ) ) ( not ( = ?auto_754362 ?auto_754367 ) ) ( not ( = ?auto_754362 ?auto_754368 ) ) ( not ( = ?auto_754362 ?auto_754369 ) ) ( not ( = ?auto_754363 ?auto_754364 ) ) ( not ( = ?auto_754363 ?auto_754365 ) ) ( not ( = ?auto_754363 ?auto_754366 ) ) ( not ( = ?auto_754363 ?auto_754367 ) ) ( not ( = ?auto_754363 ?auto_754368 ) ) ( not ( = ?auto_754363 ?auto_754369 ) ) ( not ( = ?auto_754364 ?auto_754365 ) ) ( not ( = ?auto_754364 ?auto_754366 ) ) ( not ( = ?auto_754364 ?auto_754367 ) ) ( not ( = ?auto_754364 ?auto_754368 ) ) ( not ( = ?auto_754364 ?auto_754369 ) ) ( not ( = ?auto_754365 ?auto_754366 ) ) ( not ( = ?auto_754365 ?auto_754367 ) ) ( not ( = ?auto_754365 ?auto_754368 ) ) ( not ( = ?auto_754365 ?auto_754369 ) ) ( not ( = ?auto_754366 ?auto_754367 ) ) ( not ( = ?auto_754366 ?auto_754368 ) ) ( not ( = ?auto_754366 ?auto_754369 ) ) ( not ( = ?auto_754367 ?auto_754368 ) ) ( not ( = ?auto_754367 ?auto_754369 ) ) ( not ( = ?auto_754368 ?auto_754369 ) ) ( ON ?auto_754367 ?auto_754368 ) ( ON ?auto_754366 ?auto_754367 ) ( ON ?auto_754365 ?auto_754366 ) ( ON ?auto_754364 ?auto_754365 ) ( ON ?auto_754363 ?auto_754364 ) ( ON ?auto_754362 ?auto_754363 ) ( ON ?auto_754361 ?auto_754362 ) ( ON ?auto_754360 ?auto_754361 ) ( ON ?auto_754359 ?auto_754360 ) ( CLEAR ?auto_754357 ) ( ON ?auto_754358 ?auto_754359 ) ( CLEAR ?auto_754358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_754353 ?auto_754354 ?auto_754355 ?auto_754356 ?auto_754357 ?auto_754358 )
      ( MAKE-16PILE ?auto_754353 ?auto_754354 ?auto_754355 ?auto_754356 ?auto_754357 ?auto_754358 ?auto_754359 ?auto_754360 ?auto_754361 ?auto_754362 ?auto_754363 ?auto_754364 ?auto_754365 ?auto_754366 ?auto_754367 ?auto_754368 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754419 - BLOCK
      ?auto_754420 - BLOCK
      ?auto_754421 - BLOCK
      ?auto_754422 - BLOCK
      ?auto_754423 - BLOCK
      ?auto_754424 - BLOCK
      ?auto_754425 - BLOCK
      ?auto_754426 - BLOCK
      ?auto_754427 - BLOCK
      ?auto_754428 - BLOCK
      ?auto_754429 - BLOCK
      ?auto_754430 - BLOCK
      ?auto_754431 - BLOCK
      ?auto_754432 - BLOCK
      ?auto_754433 - BLOCK
      ?auto_754434 - BLOCK
    )
    :vars
    (
      ?auto_754435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754434 ?auto_754435 ) ( ON-TABLE ?auto_754419 ) ( ON ?auto_754420 ?auto_754419 ) ( ON ?auto_754421 ?auto_754420 ) ( ON ?auto_754422 ?auto_754421 ) ( not ( = ?auto_754419 ?auto_754420 ) ) ( not ( = ?auto_754419 ?auto_754421 ) ) ( not ( = ?auto_754419 ?auto_754422 ) ) ( not ( = ?auto_754419 ?auto_754423 ) ) ( not ( = ?auto_754419 ?auto_754424 ) ) ( not ( = ?auto_754419 ?auto_754425 ) ) ( not ( = ?auto_754419 ?auto_754426 ) ) ( not ( = ?auto_754419 ?auto_754427 ) ) ( not ( = ?auto_754419 ?auto_754428 ) ) ( not ( = ?auto_754419 ?auto_754429 ) ) ( not ( = ?auto_754419 ?auto_754430 ) ) ( not ( = ?auto_754419 ?auto_754431 ) ) ( not ( = ?auto_754419 ?auto_754432 ) ) ( not ( = ?auto_754419 ?auto_754433 ) ) ( not ( = ?auto_754419 ?auto_754434 ) ) ( not ( = ?auto_754419 ?auto_754435 ) ) ( not ( = ?auto_754420 ?auto_754421 ) ) ( not ( = ?auto_754420 ?auto_754422 ) ) ( not ( = ?auto_754420 ?auto_754423 ) ) ( not ( = ?auto_754420 ?auto_754424 ) ) ( not ( = ?auto_754420 ?auto_754425 ) ) ( not ( = ?auto_754420 ?auto_754426 ) ) ( not ( = ?auto_754420 ?auto_754427 ) ) ( not ( = ?auto_754420 ?auto_754428 ) ) ( not ( = ?auto_754420 ?auto_754429 ) ) ( not ( = ?auto_754420 ?auto_754430 ) ) ( not ( = ?auto_754420 ?auto_754431 ) ) ( not ( = ?auto_754420 ?auto_754432 ) ) ( not ( = ?auto_754420 ?auto_754433 ) ) ( not ( = ?auto_754420 ?auto_754434 ) ) ( not ( = ?auto_754420 ?auto_754435 ) ) ( not ( = ?auto_754421 ?auto_754422 ) ) ( not ( = ?auto_754421 ?auto_754423 ) ) ( not ( = ?auto_754421 ?auto_754424 ) ) ( not ( = ?auto_754421 ?auto_754425 ) ) ( not ( = ?auto_754421 ?auto_754426 ) ) ( not ( = ?auto_754421 ?auto_754427 ) ) ( not ( = ?auto_754421 ?auto_754428 ) ) ( not ( = ?auto_754421 ?auto_754429 ) ) ( not ( = ?auto_754421 ?auto_754430 ) ) ( not ( = ?auto_754421 ?auto_754431 ) ) ( not ( = ?auto_754421 ?auto_754432 ) ) ( not ( = ?auto_754421 ?auto_754433 ) ) ( not ( = ?auto_754421 ?auto_754434 ) ) ( not ( = ?auto_754421 ?auto_754435 ) ) ( not ( = ?auto_754422 ?auto_754423 ) ) ( not ( = ?auto_754422 ?auto_754424 ) ) ( not ( = ?auto_754422 ?auto_754425 ) ) ( not ( = ?auto_754422 ?auto_754426 ) ) ( not ( = ?auto_754422 ?auto_754427 ) ) ( not ( = ?auto_754422 ?auto_754428 ) ) ( not ( = ?auto_754422 ?auto_754429 ) ) ( not ( = ?auto_754422 ?auto_754430 ) ) ( not ( = ?auto_754422 ?auto_754431 ) ) ( not ( = ?auto_754422 ?auto_754432 ) ) ( not ( = ?auto_754422 ?auto_754433 ) ) ( not ( = ?auto_754422 ?auto_754434 ) ) ( not ( = ?auto_754422 ?auto_754435 ) ) ( not ( = ?auto_754423 ?auto_754424 ) ) ( not ( = ?auto_754423 ?auto_754425 ) ) ( not ( = ?auto_754423 ?auto_754426 ) ) ( not ( = ?auto_754423 ?auto_754427 ) ) ( not ( = ?auto_754423 ?auto_754428 ) ) ( not ( = ?auto_754423 ?auto_754429 ) ) ( not ( = ?auto_754423 ?auto_754430 ) ) ( not ( = ?auto_754423 ?auto_754431 ) ) ( not ( = ?auto_754423 ?auto_754432 ) ) ( not ( = ?auto_754423 ?auto_754433 ) ) ( not ( = ?auto_754423 ?auto_754434 ) ) ( not ( = ?auto_754423 ?auto_754435 ) ) ( not ( = ?auto_754424 ?auto_754425 ) ) ( not ( = ?auto_754424 ?auto_754426 ) ) ( not ( = ?auto_754424 ?auto_754427 ) ) ( not ( = ?auto_754424 ?auto_754428 ) ) ( not ( = ?auto_754424 ?auto_754429 ) ) ( not ( = ?auto_754424 ?auto_754430 ) ) ( not ( = ?auto_754424 ?auto_754431 ) ) ( not ( = ?auto_754424 ?auto_754432 ) ) ( not ( = ?auto_754424 ?auto_754433 ) ) ( not ( = ?auto_754424 ?auto_754434 ) ) ( not ( = ?auto_754424 ?auto_754435 ) ) ( not ( = ?auto_754425 ?auto_754426 ) ) ( not ( = ?auto_754425 ?auto_754427 ) ) ( not ( = ?auto_754425 ?auto_754428 ) ) ( not ( = ?auto_754425 ?auto_754429 ) ) ( not ( = ?auto_754425 ?auto_754430 ) ) ( not ( = ?auto_754425 ?auto_754431 ) ) ( not ( = ?auto_754425 ?auto_754432 ) ) ( not ( = ?auto_754425 ?auto_754433 ) ) ( not ( = ?auto_754425 ?auto_754434 ) ) ( not ( = ?auto_754425 ?auto_754435 ) ) ( not ( = ?auto_754426 ?auto_754427 ) ) ( not ( = ?auto_754426 ?auto_754428 ) ) ( not ( = ?auto_754426 ?auto_754429 ) ) ( not ( = ?auto_754426 ?auto_754430 ) ) ( not ( = ?auto_754426 ?auto_754431 ) ) ( not ( = ?auto_754426 ?auto_754432 ) ) ( not ( = ?auto_754426 ?auto_754433 ) ) ( not ( = ?auto_754426 ?auto_754434 ) ) ( not ( = ?auto_754426 ?auto_754435 ) ) ( not ( = ?auto_754427 ?auto_754428 ) ) ( not ( = ?auto_754427 ?auto_754429 ) ) ( not ( = ?auto_754427 ?auto_754430 ) ) ( not ( = ?auto_754427 ?auto_754431 ) ) ( not ( = ?auto_754427 ?auto_754432 ) ) ( not ( = ?auto_754427 ?auto_754433 ) ) ( not ( = ?auto_754427 ?auto_754434 ) ) ( not ( = ?auto_754427 ?auto_754435 ) ) ( not ( = ?auto_754428 ?auto_754429 ) ) ( not ( = ?auto_754428 ?auto_754430 ) ) ( not ( = ?auto_754428 ?auto_754431 ) ) ( not ( = ?auto_754428 ?auto_754432 ) ) ( not ( = ?auto_754428 ?auto_754433 ) ) ( not ( = ?auto_754428 ?auto_754434 ) ) ( not ( = ?auto_754428 ?auto_754435 ) ) ( not ( = ?auto_754429 ?auto_754430 ) ) ( not ( = ?auto_754429 ?auto_754431 ) ) ( not ( = ?auto_754429 ?auto_754432 ) ) ( not ( = ?auto_754429 ?auto_754433 ) ) ( not ( = ?auto_754429 ?auto_754434 ) ) ( not ( = ?auto_754429 ?auto_754435 ) ) ( not ( = ?auto_754430 ?auto_754431 ) ) ( not ( = ?auto_754430 ?auto_754432 ) ) ( not ( = ?auto_754430 ?auto_754433 ) ) ( not ( = ?auto_754430 ?auto_754434 ) ) ( not ( = ?auto_754430 ?auto_754435 ) ) ( not ( = ?auto_754431 ?auto_754432 ) ) ( not ( = ?auto_754431 ?auto_754433 ) ) ( not ( = ?auto_754431 ?auto_754434 ) ) ( not ( = ?auto_754431 ?auto_754435 ) ) ( not ( = ?auto_754432 ?auto_754433 ) ) ( not ( = ?auto_754432 ?auto_754434 ) ) ( not ( = ?auto_754432 ?auto_754435 ) ) ( not ( = ?auto_754433 ?auto_754434 ) ) ( not ( = ?auto_754433 ?auto_754435 ) ) ( not ( = ?auto_754434 ?auto_754435 ) ) ( ON ?auto_754433 ?auto_754434 ) ( ON ?auto_754432 ?auto_754433 ) ( ON ?auto_754431 ?auto_754432 ) ( ON ?auto_754430 ?auto_754431 ) ( ON ?auto_754429 ?auto_754430 ) ( ON ?auto_754428 ?auto_754429 ) ( ON ?auto_754427 ?auto_754428 ) ( ON ?auto_754426 ?auto_754427 ) ( ON ?auto_754425 ?auto_754426 ) ( ON ?auto_754424 ?auto_754425 ) ( CLEAR ?auto_754422 ) ( ON ?auto_754423 ?auto_754424 ) ( CLEAR ?auto_754423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_754419 ?auto_754420 ?auto_754421 ?auto_754422 ?auto_754423 )
      ( MAKE-16PILE ?auto_754419 ?auto_754420 ?auto_754421 ?auto_754422 ?auto_754423 ?auto_754424 ?auto_754425 ?auto_754426 ?auto_754427 ?auto_754428 ?auto_754429 ?auto_754430 ?auto_754431 ?auto_754432 ?auto_754433 ?auto_754434 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754485 - BLOCK
      ?auto_754486 - BLOCK
      ?auto_754487 - BLOCK
      ?auto_754488 - BLOCK
      ?auto_754489 - BLOCK
      ?auto_754490 - BLOCK
      ?auto_754491 - BLOCK
      ?auto_754492 - BLOCK
      ?auto_754493 - BLOCK
      ?auto_754494 - BLOCK
      ?auto_754495 - BLOCK
      ?auto_754496 - BLOCK
      ?auto_754497 - BLOCK
      ?auto_754498 - BLOCK
      ?auto_754499 - BLOCK
      ?auto_754500 - BLOCK
    )
    :vars
    (
      ?auto_754501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754500 ?auto_754501 ) ( ON-TABLE ?auto_754485 ) ( ON ?auto_754486 ?auto_754485 ) ( ON ?auto_754487 ?auto_754486 ) ( not ( = ?auto_754485 ?auto_754486 ) ) ( not ( = ?auto_754485 ?auto_754487 ) ) ( not ( = ?auto_754485 ?auto_754488 ) ) ( not ( = ?auto_754485 ?auto_754489 ) ) ( not ( = ?auto_754485 ?auto_754490 ) ) ( not ( = ?auto_754485 ?auto_754491 ) ) ( not ( = ?auto_754485 ?auto_754492 ) ) ( not ( = ?auto_754485 ?auto_754493 ) ) ( not ( = ?auto_754485 ?auto_754494 ) ) ( not ( = ?auto_754485 ?auto_754495 ) ) ( not ( = ?auto_754485 ?auto_754496 ) ) ( not ( = ?auto_754485 ?auto_754497 ) ) ( not ( = ?auto_754485 ?auto_754498 ) ) ( not ( = ?auto_754485 ?auto_754499 ) ) ( not ( = ?auto_754485 ?auto_754500 ) ) ( not ( = ?auto_754485 ?auto_754501 ) ) ( not ( = ?auto_754486 ?auto_754487 ) ) ( not ( = ?auto_754486 ?auto_754488 ) ) ( not ( = ?auto_754486 ?auto_754489 ) ) ( not ( = ?auto_754486 ?auto_754490 ) ) ( not ( = ?auto_754486 ?auto_754491 ) ) ( not ( = ?auto_754486 ?auto_754492 ) ) ( not ( = ?auto_754486 ?auto_754493 ) ) ( not ( = ?auto_754486 ?auto_754494 ) ) ( not ( = ?auto_754486 ?auto_754495 ) ) ( not ( = ?auto_754486 ?auto_754496 ) ) ( not ( = ?auto_754486 ?auto_754497 ) ) ( not ( = ?auto_754486 ?auto_754498 ) ) ( not ( = ?auto_754486 ?auto_754499 ) ) ( not ( = ?auto_754486 ?auto_754500 ) ) ( not ( = ?auto_754486 ?auto_754501 ) ) ( not ( = ?auto_754487 ?auto_754488 ) ) ( not ( = ?auto_754487 ?auto_754489 ) ) ( not ( = ?auto_754487 ?auto_754490 ) ) ( not ( = ?auto_754487 ?auto_754491 ) ) ( not ( = ?auto_754487 ?auto_754492 ) ) ( not ( = ?auto_754487 ?auto_754493 ) ) ( not ( = ?auto_754487 ?auto_754494 ) ) ( not ( = ?auto_754487 ?auto_754495 ) ) ( not ( = ?auto_754487 ?auto_754496 ) ) ( not ( = ?auto_754487 ?auto_754497 ) ) ( not ( = ?auto_754487 ?auto_754498 ) ) ( not ( = ?auto_754487 ?auto_754499 ) ) ( not ( = ?auto_754487 ?auto_754500 ) ) ( not ( = ?auto_754487 ?auto_754501 ) ) ( not ( = ?auto_754488 ?auto_754489 ) ) ( not ( = ?auto_754488 ?auto_754490 ) ) ( not ( = ?auto_754488 ?auto_754491 ) ) ( not ( = ?auto_754488 ?auto_754492 ) ) ( not ( = ?auto_754488 ?auto_754493 ) ) ( not ( = ?auto_754488 ?auto_754494 ) ) ( not ( = ?auto_754488 ?auto_754495 ) ) ( not ( = ?auto_754488 ?auto_754496 ) ) ( not ( = ?auto_754488 ?auto_754497 ) ) ( not ( = ?auto_754488 ?auto_754498 ) ) ( not ( = ?auto_754488 ?auto_754499 ) ) ( not ( = ?auto_754488 ?auto_754500 ) ) ( not ( = ?auto_754488 ?auto_754501 ) ) ( not ( = ?auto_754489 ?auto_754490 ) ) ( not ( = ?auto_754489 ?auto_754491 ) ) ( not ( = ?auto_754489 ?auto_754492 ) ) ( not ( = ?auto_754489 ?auto_754493 ) ) ( not ( = ?auto_754489 ?auto_754494 ) ) ( not ( = ?auto_754489 ?auto_754495 ) ) ( not ( = ?auto_754489 ?auto_754496 ) ) ( not ( = ?auto_754489 ?auto_754497 ) ) ( not ( = ?auto_754489 ?auto_754498 ) ) ( not ( = ?auto_754489 ?auto_754499 ) ) ( not ( = ?auto_754489 ?auto_754500 ) ) ( not ( = ?auto_754489 ?auto_754501 ) ) ( not ( = ?auto_754490 ?auto_754491 ) ) ( not ( = ?auto_754490 ?auto_754492 ) ) ( not ( = ?auto_754490 ?auto_754493 ) ) ( not ( = ?auto_754490 ?auto_754494 ) ) ( not ( = ?auto_754490 ?auto_754495 ) ) ( not ( = ?auto_754490 ?auto_754496 ) ) ( not ( = ?auto_754490 ?auto_754497 ) ) ( not ( = ?auto_754490 ?auto_754498 ) ) ( not ( = ?auto_754490 ?auto_754499 ) ) ( not ( = ?auto_754490 ?auto_754500 ) ) ( not ( = ?auto_754490 ?auto_754501 ) ) ( not ( = ?auto_754491 ?auto_754492 ) ) ( not ( = ?auto_754491 ?auto_754493 ) ) ( not ( = ?auto_754491 ?auto_754494 ) ) ( not ( = ?auto_754491 ?auto_754495 ) ) ( not ( = ?auto_754491 ?auto_754496 ) ) ( not ( = ?auto_754491 ?auto_754497 ) ) ( not ( = ?auto_754491 ?auto_754498 ) ) ( not ( = ?auto_754491 ?auto_754499 ) ) ( not ( = ?auto_754491 ?auto_754500 ) ) ( not ( = ?auto_754491 ?auto_754501 ) ) ( not ( = ?auto_754492 ?auto_754493 ) ) ( not ( = ?auto_754492 ?auto_754494 ) ) ( not ( = ?auto_754492 ?auto_754495 ) ) ( not ( = ?auto_754492 ?auto_754496 ) ) ( not ( = ?auto_754492 ?auto_754497 ) ) ( not ( = ?auto_754492 ?auto_754498 ) ) ( not ( = ?auto_754492 ?auto_754499 ) ) ( not ( = ?auto_754492 ?auto_754500 ) ) ( not ( = ?auto_754492 ?auto_754501 ) ) ( not ( = ?auto_754493 ?auto_754494 ) ) ( not ( = ?auto_754493 ?auto_754495 ) ) ( not ( = ?auto_754493 ?auto_754496 ) ) ( not ( = ?auto_754493 ?auto_754497 ) ) ( not ( = ?auto_754493 ?auto_754498 ) ) ( not ( = ?auto_754493 ?auto_754499 ) ) ( not ( = ?auto_754493 ?auto_754500 ) ) ( not ( = ?auto_754493 ?auto_754501 ) ) ( not ( = ?auto_754494 ?auto_754495 ) ) ( not ( = ?auto_754494 ?auto_754496 ) ) ( not ( = ?auto_754494 ?auto_754497 ) ) ( not ( = ?auto_754494 ?auto_754498 ) ) ( not ( = ?auto_754494 ?auto_754499 ) ) ( not ( = ?auto_754494 ?auto_754500 ) ) ( not ( = ?auto_754494 ?auto_754501 ) ) ( not ( = ?auto_754495 ?auto_754496 ) ) ( not ( = ?auto_754495 ?auto_754497 ) ) ( not ( = ?auto_754495 ?auto_754498 ) ) ( not ( = ?auto_754495 ?auto_754499 ) ) ( not ( = ?auto_754495 ?auto_754500 ) ) ( not ( = ?auto_754495 ?auto_754501 ) ) ( not ( = ?auto_754496 ?auto_754497 ) ) ( not ( = ?auto_754496 ?auto_754498 ) ) ( not ( = ?auto_754496 ?auto_754499 ) ) ( not ( = ?auto_754496 ?auto_754500 ) ) ( not ( = ?auto_754496 ?auto_754501 ) ) ( not ( = ?auto_754497 ?auto_754498 ) ) ( not ( = ?auto_754497 ?auto_754499 ) ) ( not ( = ?auto_754497 ?auto_754500 ) ) ( not ( = ?auto_754497 ?auto_754501 ) ) ( not ( = ?auto_754498 ?auto_754499 ) ) ( not ( = ?auto_754498 ?auto_754500 ) ) ( not ( = ?auto_754498 ?auto_754501 ) ) ( not ( = ?auto_754499 ?auto_754500 ) ) ( not ( = ?auto_754499 ?auto_754501 ) ) ( not ( = ?auto_754500 ?auto_754501 ) ) ( ON ?auto_754499 ?auto_754500 ) ( ON ?auto_754498 ?auto_754499 ) ( ON ?auto_754497 ?auto_754498 ) ( ON ?auto_754496 ?auto_754497 ) ( ON ?auto_754495 ?auto_754496 ) ( ON ?auto_754494 ?auto_754495 ) ( ON ?auto_754493 ?auto_754494 ) ( ON ?auto_754492 ?auto_754493 ) ( ON ?auto_754491 ?auto_754492 ) ( ON ?auto_754490 ?auto_754491 ) ( ON ?auto_754489 ?auto_754490 ) ( CLEAR ?auto_754487 ) ( ON ?auto_754488 ?auto_754489 ) ( CLEAR ?auto_754488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_754485 ?auto_754486 ?auto_754487 ?auto_754488 )
      ( MAKE-16PILE ?auto_754485 ?auto_754486 ?auto_754487 ?auto_754488 ?auto_754489 ?auto_754490 ?auto_754491 ?auto_754492 ?auto_754493 ?auto_754494 ?auto_754495 ?auto_754496 ?auto_754497 ?auto_754498 ?auto_754499 ?auto_754500 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754551 - BLOCK
      ?auto_754552 - BLOCK
      ?auto_754553 - BLOCK
      ?auto_754554 - BLOCK
      ?auto_754555 - BLOCK
      ?auto_754556 - BLOCK
      ?auto_754557 - BLOCK
      ?auto_754558 - BLOCK
      ?auto_754559 - BLOCK
      ?auto_754560 - BLOCK
      ?auto_754561 - BLOCK
      ?auto_754562 - BLOCK
      ?auto_754563 - BLOCK
      ?auto_754564 - BLOCK
      ?auto_754565 - BLOCK
      ?auto_754566 - BLOCK
    )
    :vars
    (
      ?auto_754567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754566 ?auto_754567 ) ( ON-TABLE ?auto_754551 ) ( ON ?auto_754552 ?auto_754551 ) ( not ( = ?auto_754551 ?auto_754552 ) ) ( not ( = ?auto_754551 ?auto_754553 ) ) ( not ( = ?auto_754551 ?auto_754554 ) ) ( not ( = ?auto_754551 ?auto_754555 ) ) ( not ( = ?auto_754551 ?auto_754556 ) ) ( not ( = ?auto_754551 ?auto_754557 ) ) ( not ( = ?auto_754551 ?auto_754558 ) ) ( not ( = ?auto_754551 ?auto_754559 ) ) ( not ( = ?auto_754551 ?auto_754560 ) ) ( not ( = ?auto_754551 ?auto_754561 ) ) ( not ( = ?auto_754551 ?auto_754562 ) ) ( not ( = ?auto_754551 ?auto_754563 ) ) ( not ( = ?auto_754551 ?auto_754564 ) ) ( not ( = ?auto_754551 ?auto_754565 ) ) ( not ( = ?auto_754551 ?auto_754566 ) ) ( not ( = ?auto_754551 ?auto_754567 ) ) ( not ( = ?auto_754552 ?auto_754553 ) ) ( not ( = ?auto_754552 ?auto_754554 ) ) ( not ( = ?auto_754552 ?auto_754555 ) ) ( not ( = ?auto_754552 ?auto_754556 ) ) ( not ( = ?auto_754552 ?auto_754557 ) ) ( not ( = ?auto_754552 ?auto_754558 ) ) ( not ( = ?auto_754552 ?auto_754559 ) ) ( not ( = ?auto_754552 ?auto_754560 ) ) ( not ( = ?auto_754552 ?auto_754561 ) ) ( not ( = ?auto_754552 ?auto_754562 ) ) ( not ( = ?auto_754552 ?auto_754563 ) ) ( not ( = ?auto_754552 ?auto_754564 ) ) ( not ( = ?auto_754552 ?auto_754565 ) ) ( not ( = ?auto_754552 ?auto_754566 ) ) ( not ( = ?auto_754552 ?auto_754567 ) ) ( not ( = ?auto_754553 ?auto_754554 ) ) ( not ( = ?auto_754553 ?auto_754555 ) ) ( not ( = ?auto_754553 ?auto_754556 ) ) ( not ( = ?auto_754553 ?auto_754557 ) ) ( not ( = ?auto_754553 ?auto_754558 ) ) ( not ( = ?auto_754553 ?auto_754559 ) ) ( not ( = ?auto_754553 ?auto_754560 ) ) ( not ( = ?auto_754553 ?auto_754561 ) ) ( not ( = ?auto_754553 ?auto_754562 ) ) ( not ( = ?auto_754553 ?auto_754563 ) ) ( not ( = ?auto_754553 ?auto_754564 ) ) ( not ( = ?auto_754553 ?auto_754565 ) ) ( not ( = ?auto_754553 ?auto_754566 ) ) ( not ( = ?auto_754553 ?auto_754567 ) ) ( not ( = ?auto_754554 ?auto_754555 ) ) ( not ( = ?auto_754554 ?auto_754556 ) ) ( not ( = ?auto_754554 ?auto_754557 ) ) ( not ( = ?auto_754554 ?auto_754558 ) ) ( not ( = ?auto_754554 ?auto_754559 ) ) ( not ( = ?auto_754554 ?auto_754560 ) ) ( not ( = ?auto_754554 ?auto_754561 ) ) ( not ( = ?auto_754554 ?auto_754562 ) ) ( not ( = ?auto_754554 ?auto_754563 ) ) ( not ( = ?auto_754554 ?auto_754564 ) ) ( not ( = ?auto_754554 ?auto_754565 ) ) ( not ( = ?auto_754554 ?auto_754566 ) ) ( not ( = ?auto_754554 ?auto_754567 ) ) ( not ( = ?auto_754555 ?auto_754556 ) ) ( not ( = ?auto_754555 ?auto_754557 ) ) ( not ( = ?auto_754555 ?auto_754558 ) ) ( not ( = ?auto_754555 ?auto_754559 ) ) ( not ( = ?auto_754555 ?auto_754560 ) ) ( not ( = ?auto_754555 ?auto_754561 ) ) ( not ( = ?auto_754555 ?auto_754562 ) ) ( not ( = ?auto_754555 ?auto_754563 ) ) ( not ( = ?auto_754555 ?auto_754564 ) ) ( not ( = ?auto_754555 ?auto_754565 ) ) ( not ( = ?auto_754555 ?auto_754566 ) ) ( not ( = ?auto_754555 ?auto_754567 ) ) ( not ( = ?auto_754556 ?auto_754557 ) ) ( not ( = ?auto_754556 ?auto_754558 ) ) ( not ( = ?auto_754556 ?auto_754559 ) ) ( not ( = ?auto_754556 ?auto_754560 ) ) ( not ( = ?auto_754556 ?auto_754561 ) ) ( not ( = ?auto_754556 ?auto_754562 ) ) ( not ( = ?auto_754556 ?auto_754563 ) ) ( not ( = ?auto_754556 ?auto_754564 ) ) ( not ( = ?auto_754556 ?auto_754565 ) ) ( not ( = ?auto_754556 ?auto_754566 ) ) ( not ( = ?auto_754556 ?auto_754567 ) ) ( not ( = ?auto_754557 ?auto_754558 ) ) ( not ( = ?auto_754557 ?auto_754559 ) ) ( not ( = ?auto_754557 ?auto_754560 ) ) ( not ( = ?auto_754557 ?auto_754561 ) ) ( not ( = ?auto_754557 ?auto_754562 ) ) ( not ( = ?auto_754557 ?auto_754563 ) ) ( not ( = ?auto_754557 ?auto_754564 ) ) ( not ( = ?auto_754557 ?auto_754565 ) ) ( not ( = ?auto_754557 ?auto_754566 ) ) ( not ( = ?auto_754557 ?auto_754567 ) ) ( not ( = ?auto_754558 ?auto_754559 ) ) ( not ( = ?auto_754558 ?auto_754560 ) ) ( not ( = ?auto_754558 ?auto_754561 ) ) ( not ( = ?auto_754558 ?auto_754562 ) ) ( not ( = ?auto_754558 ?auto_754563 ) ) ( not ( = ?auto_754558 ?auto_754564 ) ) ( not ( = ?auto_754558 ?auto_754565 ) ) ( not ( = ?auto_754558 ?auto_754566 ) ) ( not ( = ?auto_754558 ?auto_754567 ) ) ( not ( = ?auto_754559 ?auto_754560 ) ) ( not ( = ?auto_754559 ?auto_754561 ) ) ( not ( = ?auto_754559 ?auto_754562 ) ) ( not ( = ?auto_754559 ?auto_754563 ) ) ( not ( = ?auto_754559 ?auto_754564 ) ) ( not ( = ?auto_754559 ?auto_754565 ) ) ( not ( = ?auto_754559 ?auto_754566 ) ) ( not ( = ?auto_754559 ?auto_754567 ) ) ( not ( = ?auto_754560 ?auto_754561 ) ) ( not ( = ?auto_754560 ?auto_754562 ) ) ( not ( = ?auto_754560 ?auto_754563 ) ) ( not ( = ?auto_754560 ?auto_754564 ) ) ( not ( = ?auto_754560 ?auto_754565 ) ) ( not ( = ?auto_754560 ?auto_754566 ) ) ( not ( = ?auto_754560 ?auto_754567 ) ) ( not ( = ?auto_754561 ?auto_754562 ) ) ( not ( = ?auto_754561 ?auto_754563 ) ) ( not ( = ?auto_754561 ?auto_754564 ) ) ( not ( = ?auto_754561 ?auto_754565 ) ) ( not ( = ?auto_754561 ?auto_754566 ) ) ( not ( = ?auto_754561 ?auto_754567 ) ) ( not ( = ?auto_754562 ?auto_754563 ) ) ( not ( = ?auto_754562 ?auto_754564 ) ) ( not ( = ?auto_754562 ?auto_754565 ) ) ( not ( = ?auto_754562 ?auto_754566 ) ) ( not ( = ?auto_754562 ?auto_754567 ) ) ( not ( = ?auto_754563 ?auto_754564 ) ) ( not ( = ?auto_754563 ?auto_754565 ) ) ( not ( = ?auto_754563 ?auto_754566 ) ) ( not ( = ?auto_754563 ?auto_754567 ) ) ( not ( = ?auto_754564 ?auto_754565 ) ) ( not ( = ?auto_754564 ?auto_754566 ) ) ( not ( = ?auto_754564 ?auto_754567 ) ) ( not ( = ?auto_754565 ?auto_754566 ) ) ( not ( = ?auto_754565 ?auto_754567 ) ) ( not ( = ?auto_754566 ?auto_754567 ) ) ( ON ?auto_754565 ?auto_754566 ) ( ON ?auto_754564 ?auto_754565 ) ( ON ?auto_754563 ?auto_754564 ) ( ON ?auto_754562 ?auto_754563 ) ( ON ?auto_754561 ?auto_754562 ) ( ON ?auto_754560 ?auto_754561 ) ( ON ?auto_754559 ?auto_754560 ) ( ON ?auto_754558 ?auto_754559 ) ( ON ?auto_754557 ?auto_754558 ) ( ON ?auto_754556 ?auto_754557 ) ( ON ?auto_754555 ?auto_754556 ) ( ON ?auto_754554 ?auto_754555 ) ( CLEAR ?auto_754552 ) ( ON ?auto_754553 ?auto_754554 ) ( CLEAR ?auto_754553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_754551 ?auto_754552 ?auto_754553 )
      ( MAKE-16PILE ?auto_754551 ?auto_754552 ?auto_754553 ?auto_754554 ?auto_754555 ?auto_754556 ?auto_754557 ?auto_754558 ?auto_754559 ?auto_754560 ?auto_754561 ?auto_754562 ?auto_754563 ?auto_754564 ?auto_754565 ?auto_754566 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754617 - BLOCK
      ?auto_754618 - BLOCK
      ?auto_754619 - BLOCK
      ?auto_754620 - BLOCK
      ?auto_754621 - BLOCK
      ?auto_754622 - BLOCK
      ?auto_754623 - BLOCK
      ?auto_754624 - BLOCK
      ?auto_754625 - BLOCK
      ?auto_754626 - BLOCK
      ?auto_754627 - BLOCK
      ?auto_754628 - BLOCK
      ?auto_754629 - BLOCK
      ?auto_754630 - BLOCK
      ?auto_754631 - BLOCK
      ?auto_754632 - BLOCK
    )
    :vars
    (
      ?auto_754633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754632 ?auto_754633 ) ( ON-TABLE ?auto_754617 ) ( not ( = ?auto_754617 ?auto_754618 ) ) ( not ( = ?auto_754617 ?auto_754619 ) ) ( not ( = ?auto_754617 ?auto_754620 ) ) ( not ( = ?auto_754617 ?auto_754621 ) ) ( not ( = ?auto_754617 ?auto_754622 ) ) ( not ( = ?auto_754617 ?auto_754623 ) ) ( not ( = ?auto_754617 ?auto_754624 ) ) ( not ( = ?auto_754617 ?auto_754625 ) ) ( not ( = ?auto_754617 ?auto_754626 ) ) ( not ( = ?auto_754617 ?auto_754627 ) ) ( not ( = ?auto_754617 ?auto_754628 ) ) ( not ( = ?auto_754617 ?auto_754629 ) ) ( not ( = ?auto_754617 ?auto_754630 ) ) ( not ( = ?auto_754617 ?auto_754631 ) ) ( not ( = ?auto_754617 ?auto_754632 ) ) ( not ( = ?auto_754617 ?auto_754633 ) ) ( not ( = ?auto_754618 ?auto_754619 ) ) ( not ( = ?auto_754618 ?auto_754620 ) ) ( not ( = ?auto_754618 ?auto_754621 ) ) ( not ( = ?auto_754618 ?auto_754622 ) ) ( not ( = ?auto_754618 ?auto_754623 ) ) ( not ( = ?auto_754618 ?auto_754624 ) ) ( not ( = ?auto_754618 ?auto_754625 ) ) ( not ( = ?auto_754618 ?auto_754626 ) ) ( not ( = ?auto_754618 ?auto_754627 ) ) ( not ( = ?auto_754618 ?auto_754628 ) ) ( not ( = ?auto_754618 ?auto_754629 ) ) ( not ( = ?auto_754618 ?auto_754630 ) ) ( not ( = ?auto_754618 ?auto_754631 ) ) ( not ( = ?auto_754618 ?auto_754632 ) ) ( not ( = ?auto_754618 ?auto_754633 ) ) ( not ( = ?auto_754619 ?auto_754620 ) ) ( not ( = ?auto_754619 ?auto_754621 ) ) ( not ( = ?auto_754619 ?auto_754622 ) ) ( not ( = ?auto_754619 ?auto_754623 ) ) ( not ( = ?auto_754619 ?auto_754624 ) ) ( not ( = ?auto_754619 ?auto_754625 ) ) ( not ( = ?auto_754619 ?auto_754626 ) ) ( not ( = ?auto_754619 ?auto_754627 ) ) ( not ( = ?auto_754619 ?auto_754628 ) ) ( not ( = ?auto_754619 ?auto_754629 ) ) ( not ( = ?auto_754619 ?auto_754630 ) ) ( not ( = ?auto_754619 ?auto_754631 ) ) ( not ( = ?auto_754619 ?auto_754632 ) ) ( not ( = ?auto_754619 ?auto_754633 ) ) ( not ( = ?auto_754620 ?auto_754621 ) ) ( not ( = ?auto_754620 ?auto_754622 ) ) ( not ( = ?auto_754620 ?auto_754623 ) ) ( not ( = ?auto_754620 ?auto_754624 ) ) ( not ( = ?auto_754620 ?auto_754625 ) ) ( not ( = ?auto_754620 ?auto_754626 ) ) ( not ( = ?auto_754620 ?auto_754627 ) ) ( not ( = ?auto_754620 ?auto_754628 ) ) ( not ( = ?auto_754620 ?auto_754629 ) ) ( not ( = ?auto_754620 ?auto_754630 ) ) ( not ( = ?auto_754620 ?auto_754631 ) ) ( not ( = ?auto_754620 ?auto_754632 ) ) ( not ( = ?auto_754620 ?auto_754633 ) ) ( not ( = ?auto_754621 ?auto_754622 ) ) ( not ( = ?auto_754621 ?auto_754623 ) ) ( not ( = ?auto_754621 ?auto_754624 ) ) ( not ( = ?auto_754621 ?auto_754625 ) ) ( not ( = ?auto_754621 ?auto_754626 ) ) ( not ( = ?auto_754621 ?auto_754627 ) ) ( not ( = ?auto_754621 ?auto_754628 ) ) ( not ( = ?auto_754621 ?auto_754629 ) ) ( not ( = ?auto_754621 ?auto_754630 ) ) ( not ( = ?auto_754621 ?auto_754631 ) ) ( not ( = ?auto_754621 ?auto_754632 ) ) ( not ( = ?auto_754621 ?auto_754633 ) ) ( not ( = ?auto_754622 ?auto_754623 ) ) ( not ( = ?auto_754622 ?auto_754624 ) ) ( not ( = ?auto_754622 ?auto_754625 ) ) ( not ( = ?auto_754622 ?auto_754626 ) ) ( not ( = ?auto_754622 ?auto_754627 ) ) ( not ( = ?auto_754622 ?auto_754628 ) ) ( not ( = ?auto_754622 ?auto_754629 ) ) ( not ( = ?auto_754622 ?auto_754630 ) ) ( not ( = ?auto_754622 ?auto_754631 ) ) ( not ( = ?auto_754622 ?auto_754632 ) ) ( not ( = ?auto_754622 ?auto_754633 ) ) ( not ( = ?auto_754623 ?auto_754624 ) ) ( not ( = ?auto_754623 ?auto_754625 ) ) ( not ( = ?auto_754623 ?auto_754626 ) ) ( not ( = ?auto_754623 ?auto_754627 ) ) ( not ( = ?auto_754623 ?auto_754628 ) ) ( not ( = ?auto_754623 ?auto_754629 ) ) ( not ( = ?auto_754623 ?auto_754630 ) ) ( not ( = ?auto_754623 ?auto_754631 ) ) ( not ( = ?auto_754623 ?auto_754632 ) ) ( not ( = ?auto_754623 ?auto_754633 ) ) ( not ( = ?auto_754624 ?auto_754625 ) ) ( not ( = ?auto_754624 ?auto_754626 ) ) ( not ( = ?auto_754624 ?auto_754627 ) ) ( not ( = ?auto_754624 ?auto_754628 ) ) ( not ( = ?auto_754624 ?auto_754629 ) ) ( not ( = ?auto_754624 ?auto_754630 ) ) ( not ( = ?auto_754624 ?auto_754631 ) ) ( not ( = ?auto_754624 ?auto_754632 ) ) ( not ( = ?auto_754624 ?auto_754633 ) ) ( not ( = ?auto_754625 ?auto_754626 ) ) ( not ( = ?auto_754625 ?auto_754627 ) ) ( not ( = ?auto_754625 ?auto_754628 ) ) ( not ( = ?auto_754625 ?auto_754629 ) ) ( not ( = ?auto_754625 ?auto_754630 ) ) ( not ( = ?auto_754625 ?auto_754631 ) ) ( not ( = ?auto_754625 ?auto_754632 ) ) ( not ( = ?auto_754625 ?auto_754633 ) ) ( not ( = ?auto_754626 ?auto_754627 ) ) ( not ( = ?auto_754626 ?auto_754628 ) ) ( not ( = ?auto_754626 ?auto_754629 ) ) ( not ( = ?auto_754626 ?auto_754630 ) ) ( not ( = ?auto_754626 ?auto_754631 ) ) ( not ( = ?auto_754626 ?auto_754632 ) ) ( not ( = ?auto_754626 ?auto_754633 ) ) ( not ( = ?auto_754627 ?auto_754628 ) ) ( not ( = ?auto_754627 ?auto_754629 ) ) ( not ( = ?auto_754627 ?auto_754630 ) ) ( not ( = ?auto_754627 ?auto_754631 ) ) ( not ( = ?auto_754627 ?auto_754632 ) ) ( not ( = ?auto_754627 ?auto_754633 ) ) ( not ( = ?auto_754628 ?auto_754629 ) ) ( not ( = ?auto_754628 ?auto_754630 ) ) ( not ( = ?auto_754628 ?auto_754631 ) ) ( not ( = ?auto_754628 ?auto_754632 ) ) ( not ( = ?auto_754628 ?auto_754633 ) ) ( not ( = ?auto_754629 ?auto_754630 ) ) ( not ( = ?auto_754629 ?auto_754631 ) ) ( not ( = ?auto_754629 ?auto_754632 ) ) ( not ( = ?auto_754629 ?auto_754633 ) ) ( not ( = ?auto_754630 ?auto_754631 ) ) ( not ( = ?auto_754630 ?auto_754632 ) ) ( not ( = ?auto_754630 ?auto_754633 ) ) ( not ( = ?auto_754631 ?auto_754632 ) ) ( not ( = ?auto_754631 ?auto_754633 ) ) ( not ( = ?auto_754632 ?auto_754633 ) ) ( ON ?auto_754631 ?auto_754632 ) ( ON ?auto_754630 ?auto_754631 ) ( ON ?auto_754629 ?auto_754630 ) ( ON ?auto_754628 ?auto_754629 ) ( ON ?auto_754627 ?auto_754628 ) ( ON ?auto_754626 ?auto_754627 ) ( ON ?auto_754625 ?auto_754626 ) ( ON ?auto_754624 ?auto_754625 ) ( ON ?auto_754623 ?auto_754624 ) ( ON ?auto_754622 ?auto_754623 ) ( ON ?auto_754621 ?auto_754622 ) ( ON ?auto_754620 ?auto_754621 ) ( ON ?auto_754619 ?auto_754620 ) ( CLEAR ?auto_754617 ) ( ON ?auto_754618 ?auto_754619 ) ( CLEAR ?auto_754618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_754617 ?auto_754618 )
      ( MAKE-16PILE ?auto_754617 ?auto_754618 ?auto_754619 ?auto_754620 ?auto_754621 ?auto_754622 ?auto_754623 ?auto_754624 ?auto_754625 ?auto_754626 ?auto_754627 ?auto_754628 ?auto_754629 ?auto_754630 ?auto_754631 ?auto_754632 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_754683 - BLOCK
      ?auto_754684 - BLOCK
      ?auto_754685 - BLOCK
      ?auto_754686 - BLOCK
      ?auto_754687 - BLOCK
      ?auto_754688 - BLOCK
      ?auto_754689 - BLOCK
      ?auto_754690 - BLOCK
      ?auto_754691 - BLOCK
      ?auto_754692 - BLOCK
      ?auto_754693 - BLOCK
      ?auto_754694 - BLOCK
      ?auto_754695 - BLOCK
      ?auto_754696 - BLOCK
      ?auto_754697 - BLOCK
      ?auto_754698 - BLOCK
    )
    :vars
    (
      ?auto_754699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754698 ?auto_754699 ) ( not ( = ?auto_754683 ?auto_754684 ) ) ( not ( = ?auto_754683 ?auto_754685 ) ) ( not ( = ?auto_754683 ?auto_754686 ) ) ( not ( = ?auto_754683 ?auto_754687 ) ) ( not ( = ?auto_754683 ?auto_754688 ) ) ( not ( = ?auto_754683 ?auto_754689 ) ) ( not ( = ?auto_754683 ?auto_754690 ) ) ( not ( = ?auto_754683 ?auto_754691 ) ) ( not ( = ?auto_754683 ?auto_754692 ) ) ( not ( = ?auto_754683 ?auto_754693 ) ) ( not ( = ?auto_754683 ?auto_754694 ) ) ( not ( = ?auto_754683 ?auto_754695 ) ) ( not ( = ?auto_754683 ?auto_754696 ) ) ( not ( = ?auto_754683 ?auto_754697 ) ) ( not ( = ?auto_754683 ?auto_754698 ) ) ( not ( = ?auto_754683 ?auto_754699 ) ) ( not ( = ?auto_754684 ?auto_754685 ) ) ( not ( = ?auto_754684 ?auto_754686 ) ) ( not ( = ?auto_754684 ?auto_754687 ) ) ( not ( = ?auto_754684 ?auto_754688 ) ) ( not ( = ?auto_754684 ?auto_754689 ) ) ( not ( = ?auto_754684 ?auto_754690 ) ) ( not ( = ?auto_754684 ?auto_754691 ) ) ( not ( = ?auto_754684 ?auto_754692 ) ) ( not ( = ?auto_754684 ?auto_754693 ) ) ( not ( = ?auto_754684 ?auto_754694 ) ) ( not ( = ?auto_754684 ?auto_754695 ) ) ( not ( = ?auto_754684 ?auto_754696 ) ) ( not ( = ?auto_754684 ?auto_754697 ) ) ( not ( = ?auto_754684 ?auto_754698 ) ) ( not ( = ?auto_754684 ?auto_754699 ) ) ( not ( = ?auto_754685 ?auto_754686 ) ) ( not ( = ?auto_754685 ?auto_754687 ) ) ( not ( = ?auto_754685 ?auto_754688 ) ) ( not ( = ?auto_754685 ?auto_754689 ) ) ( not ( = ?auto_754685 ?auto_754690 ) ) ( not ( = ?auto_754685 ?auto_754691 ) ) ( not ( = ?auto_754685 ?auto_754692 ) ) ( not ( = ?auto_754685 ?auto_754693 ) ) ( not ( = ?auto_754685 ?auto_754694 ) ) ( not ( = ?auto_754685 ?auto_754695 ) ) ( not ( = ?auto_754685 ?auto_754696 ) ) ( not ( = ?auto_754685 ?auto_754697 ) ) ( not ( = ?auto_754685 ?auto_754698 ) ) ( not ( = ?auto_754685 ?auto_754699 ) ) ( not ( = ?auto_754686 ?auto_754687 ) ) ( not ( = ?auto_754686 ?auto_754688 ) ) ( not ( = ?auto_754686 ?auto_754689 ) ) ( not ( = ?auto_754686 ?auto_754690 ) ) ( not ( = ?auto_754686 ?auto_754691 ) ) ( not ( = ?auto_754686 ?auto_754692 ) ) ( not ( = ?auto_754686 ?auto_754693 ) ) ( not ( = ?auto_754686 ?auto_754694 ) ) ( not ( = ?auto_754686 ?auto_754695 ) ) ( not ( = ?auto_754686 ?auto_754696 ) ) ( not ( = ?auto_754686 ?auto_754697 ) ) ( not ( = ?auto_754686 ?auto_754698 ) ) ( not ( = ?auto_754686 ?auto_754699 ) ) ( not ( = ?auto_754687 ?auto_754688 ) ) ( not ( = ?auto_754687 ?auto_754689 ) ) ( not ( = ?auto_754687 ?auto_754690 ) ) ( not ( = ?auto_754687 ?auto_754691 ) ) ( not ( = ?auto_754687 ?auto_754692 ) ) ( not ( = ?auto_754687 ?auto_754693 ) ) ( not ( = ?auto_754687 ?auto_754694 ) ) ( not ( = ?auto_754687 ?auto_754695 ) ) ( not ( = ?auto_754687 ?auto_754696 ) ) ( not ( = ?auto_754687 ?auto_754697 ) ) ( not ( = ?auto_754687 ?auto_754698 ) ) ( not ( = ?auto_754687 ?auto_754699 ) ) ( not ( = ?auto_754688 ?auto_754689 ) ) ( not ( = ?auto_754688 ?auto_754690 ) ) ( not ( = ?auto_754688 ?auto_754691 ) ) ( not ( = ?auto_754688 ?auto_754692 ) ) ( not ( = ?auto_754688 ?auto_754693 ) ) ( not ( = ?auto_754688 ?auto_754694 ) ) ( not ( = ?auto_754688 ?auto_754695 ) ) ( not ( = ?auto_754688 ?auto_754696 ) ) ( not ( = ?auto_754688 ?auto_754697 ) ) ( not ( = ?auto_754688 ?auto_754698 ) ) ( not ( = ?auto_754688 ?auto_754699 ) ) ( not ( = ?auto_754689 ?auto_754690 ) ) ( not ( = ?auto_754689 ?auto_754691 ) ) ( not ( = ?auto_754689 ?auto_754692 ) ) ( not ( = ?auto_754689 ?auto_754693 ) ) ( not ( = ?auto_754689 ?auto_754694 ) ) ( not ( = ?auto_754689 ?auto_754695 ) ) ( not ( = ?auto_754689 ?auto_754696 ) ) ( not ( = ?auto_754689 ?auto_754697 ) ) ( not ( = ?auto_754689 ?auto_754698 ) ) ( not ( = ?auto_754689 ?auto_754699 ) ) ( not ( = ?auto_754690 ?auto_754691 ) ) ( not ( = ?auto_754690 ?auto_754692 ) ) ( not ( = ?auto_754690 ?auto_754693 ) ) ( not ( = ?auto_754690 ?auto_754694 ) ) ( not ( = ?auto_754690 ?auto_754695 ) ) ( not ( = ?auto_754690 ?auto_754696 ) ) ( not ( = ?auto_754690 ?auto_754697 ) ) ( not ( = ?auto_754690 ?auto_754698 ) ) ( not ( = ?auto_754690 ?auto_754699 ) ) ( not ( = ?auto_754691 ?auto_754692 ) ) ( not ( = ?auto_754691 ?auto_754693 ) ) ( not ( = ?auto_754691 ?auto_754694 ) ) ( not ( = ?auto_754691 ?auto_754695 ) ) ( not ( = ?auto_754691 ?auto_754696 ) ) ( not ( = ?auto_754691 ?auto_754697 ) ) ( not ( = ?auto_754691 ?auto_754698 ) ) ( not ( = ?auto_754691 ?auto_754699 ) ) ( not ( = ?auto_754692 ?auto_754693 ) ) ( not ( = ?auto_754692 ?auto_754694 ) ) ( not ( = ?auto_754692 ?auto_754695 ) ) ( not ( = ?auto_754692 ?auto_754696 ) ) ( not ( = ?auto_754692 ?auto_754697 ) ) ( not ( = ?auto_754692 ?auto_754698 ) ) ( not ( = ?auto_754692 ?auto_754699 ) ) ( not ( = ?auto_754693 ?auto_754694 ) ) ( not ( = ?auto_754693 ?auto_754695 ) ) ( not ( = ?auto_754693 ?auto_754696 ) ) ( not ( = ?auto_754693 ?auto_754697 ) ) ( not ( = ?auto_754693 ?auto_754698 ) ) ( not ( = ?auto_754693 ?auto_754699 ) ) ( not ( = ?auto_754694 ?auto_754695 ) ) ( not ( = ?auto_754694 ?auto_754696 ) ) ( not ( = ?auto_754694 ?auto_754697 ) ) ( not ( = ?auto_754694 ?auto_754698 ) ) ( not ( = ?auto_754694 ?auto_754699 ) ) ( not ( = ?auto_754695 ?auto_754696 ) ) ( not ( = ?auto_754695 ?auto_754697 ) ) ( not ( = ?auto_754695 ?auto_754698 ) ) ( not ( = ?auto_754695 ?auto_754699 ) ) ( not ( = ?auto_754696 ?auto_754697 ) ) ( not ( = ?auto_754696 ?auto_754698 ) ) ( not ( = ?auto_754696 ?auto_754699 ) ) ( not ( = ?auto_754697 ?auto_754698 ) ) ( not ( = ?auto_754697 ?auto_754699 ) ) ( not ( = ?auto_754698 ?auto_754699 ) ) ( ON ?auto_754697 ?auto_754698 ) ( ON ?auto_754696 ?auto_754697 ) ( ON ?auto_754695 ?auto_754696 ) ( ON ?auto_754694 ?auto_754695 ) ( ON ?auto_754693 ?auto_754694 ) ( ON ?auto_754692 ?auto_754693 ) ( ON ?auto_754691 ?auto_754692 ) ( ON ?auto_754690 ?auto_754691 ) ( ON ?auto_754689 ?auto_754690 ) ( ON ?auto_754688 ?auto_754689 ) ( ON ?auto_754687 ?auto_754688 ) ( ON ?auto_754686 ?auto_754687 ) ( ON ?auto_754685 ?auto_754686 ) ( ON ?auto_754684 ?auto_754685 ) ( ON ?auto_754683 ?auto_754684 ) ( CLEAR ?auto_754683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_754683 )
      ( MAKE-16PILE ?auto_754683 ?auto_754684 ?auto_754685 ?auto_754686 ?auto_754687 ?auto_754688 ?auto_754689 ?auto_754690 ?auto_754691 ?auto_754692 ?auto_754693 ?auto_754694 ?auto_754695 ?auto_754696 ?auto_754697 ?auto_754698 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_754750 - BLOCK
      ?auto_754751 - BLOCK
      ?auto_754752 - BLOCK
      ?auto_754753 - BLOCK
      ?auto_754754 - BLOCK
      ?auto_754755 - BLOCK
      ?auto_754756 - BLOCK
      ?auto_754757 - BLOCK
      ?auto_754758 - BLOCK
      ?auto_754759 - BLOCK
      ?auto_754760 - BLOCK
      ?auto_754761 - BLOCK
      ?auto_754762 - BLOCK
      ?auto_754763 - BLOCK
      ?auto_754764 - BLOCK
      ?auto_754765 - BLOCK
      ?auto_754766 - BLOCK
    )
    :vars
    (
      ?auto_754767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_754765 ) ( ON ?auto_754766 ?auto_754767 ) ( CLEAR ?auto_754766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_754750 ) ( ON ?auto_754751 ?auto_754750 ) ( ON ?auto_754752 ?auto_754751 ) ( ON ?auto_754753 ?auto_754752 ) ( ON ?auto_754754 ?auto_754753 ) ( ON ?auto_754755 ?auto_754754 ) ( ON ?auto_754756 ?auto_754755 ) ( ON ?auto_754757 ?auto_754756 ) ( ON ?auto_754758 ?auto_754757 ) ( ON ?auto_754759 ?auto_754758 ) ( ON ?auto_754760 ?auto_754759 ) ( ON ?auto_754761 ?auto_754760 ) ( ON ?auto_754762 ?auto_754761 ) ( ON ?auto_754763 ?auto_754762 ) ( ON ?auto_754764 ?auto_754763 ) ( ON ?auto_754765 ?auto_754764 ) ( not ( = ?auto_754750 ?auto_754751 ) ) ( not ( = ?auto_754750 ?auto_754752 ) ) ( not ( = ?auto_754750 ?auto_754753 ) ) ( not ( = ?auto_754750 ?auto_754754 ) ) ( not ( = ?auto_754750 ?auto_754755 ) ) ( not ( = ?auto_754750 ?auto_754756 ) ) ( not ( = ?auto_754750 ?auto_754757 ) ) ( not ( = ?auto_754750 ?auto_754758 ) ) ( not ( = ?auto_754750 ?auto_754759 ) ) ( not ( = ?auto_754750 ?auto_754760 ) ) ( not ( = ?auto_754750 ?auto_754761 ) ) ( not ( = ?auto_754750 ?auto_754762 ) ) ( not ( = ?auto_754750 ?auto_754763 ) ) ( not ( = ?auto_754750 ?auto_754764 ) ) ( not ( = ?auto_754750 ?auto_754765 ) ) ( not ( = ?auto_754750 ?auto_754766 ) ) ( not ( = ?auto_754750 ?auto_754767 ) ) ( not ( = ?auto_754751 ?auto_754752 ) ) ( not ( = ?auto_754751 ?auto_754753 ) ) ( not ( = ?auto_754751 ?auto_754754 ) ) ( not ( = ?auto_754751 ?auto_754755 ) ) ( not ( = ?auto_754751 ?auto_754756 ) ) ( not ( = ?auto_754751 ?auto_754757 ) ) ( not ( = ?auto_754751 ?auto_754758 ) ) ( not ( = ?auto_754751 ?auto_754759 ) ) ( not ( = ?auto_754751 ?auto_754760 ) ) ( not ( = ?auto_754751 ?auto_754761 ) ) ( not ( = ?auto_754751 ?auto_754762 ) ) ( not ( = ?auto_754751 ?auto_754763 ) ) ( not ( = ?auto_754751 ?auto_754764 ) ) ( not ( = ?auto_754751 ?auto_754765 ) ) ( not ( = ?auto_754751 ?auto_754766 ) ) ( not ( = ?auto_754751 ?auto_754767 ) ) ( not ( = ?auto_754752 ?auto_754753 ) ) ( not ( = ?auto_754752 ?auto_754754 ) ) ( not ( = ?auto_754752 ?auto_754755 ) ) ( not ( = ?auto_754752 ?auto_754756 ) ) ( not ( = ?auto_754752 ?auto_754757 ) ) ( not ( = ?auto_754752 ?auto_754758 ) ) ( not ( = ?auto_754752 ?auto_754759 ) ) ( not ( = ?auto_754752 ?auto_754760 ) ) ( not ( = ?auto_754752 ?auto_754761 ) ) ( not ( = ?auto_754752 ?auto_754762 ) ) ( not ( = ?auto_754752 ?auto_754763 ) ) ( not ( = ?auto_754752 ?auto_754764 ) ) ( not ( = ?auto_754752 ?auto_754765 ) ) ( not ( = ?auto_754752 ?auto_754766 ) ) ( not ( = ?auto_754752 ?auto_754767 ) ) ( not ( = ?auto_754753 ?auto_754754 ) ) ( not ( = ?auto_754753 ?auto_754755 ) ) ( not ( = ?auto_754753 ?auto_754756 ) ) ( not ( = ?auto_754753 ?auto_754757 ) ) ( not ( = ?auto_754753 ?auto_754758 ) ) ( not ( = ?auto_754753 ?auto_754759 ) ) ( not ( = ?auto_754753 ?auto_754760 ) ) ( not ( = ?auto_754753 ?auto_754761 ) ) ( not ( = ?auto_754753 ?auto_754762 ) ) ( not ( = ?auto_754753 ?auto_754763 ) ) ( not ( = ?auto_754753 ?auto_754764 ) ) ( not ( = ?auto_754753 ?auto_754765 ) ) ( not ( = ?auto_754753 ?auto_754766 ) ) ( not ( = ?auto_754753 ?auto_754767 ) ) ( not ( = ?auto_754754 ?auto_754755 ) ) ( not ( = ?auto_754754 ?auto_754756 ) ) ( not ( = ?auto_754754 ?auto_754757 ) ) ( not ( = ?auto_754754 ?auto_754758 ) ) ( not ( = ?auto_754754 ?auto_754759 ) ) ( not ( = ?auto_754754 ?auto_754760 ) ) ( not ( = ?auto_754754 ?auto_754761 ) ) ( not ( = ?auto_754754 ?auto_754762 ) ) ( not ( = ?auto_754754 ?auto_754763 ) ) ( not ( = ?auto_754754 ?auto_754764 ) ) ( not ( = ?auto_754754 ?auto_754765 ) ) ( not ( = ?auto_754754 ?auto_754766 ) ) ( not ( = ?auto_754754 ?auto_754767 ) ) ( not ( = ?auto_754755 ?auto_754756 ) ) ( not ( = ?auto_754755 ?auto_754757 ) ) ( not ( = ?auto_754755 ?auto_754758 ) ) ( not ( = ?auto_754755 ?auto_754759 ) ) ( not ( = ?auto_754755 ?auto_754760 ) ) ( not ( = ?auto_754755 ?auto_754761 ) ) ( not ( = ?auto_754755 ?auto_754762 ) ) ( not ( = ?auto_754755 ?auto_754763 ) ) ( not ( = ?auto_754755 ?auto_754764 ) ) ( not ( = ?auto_754755 ?auto_754765 ) ) ( not ( = ?auto_754755 ?auto_754766 ) ) ( not ( = ?auto_754755 ?auto_754767 ) ) ( not ( = ?auto_754756 ?auto_754757 ) ) ( not ( = ?auto_754756 ?auto_754758 ) ) ( not ( = ?auto_754756 ?auto_754759 ) ) ( not ( = ?auto_754756 ?auto_754760 ) ) ( not ( = ?auto_754756 ?auto_754761 ) ) ( not ( = ?auto_754756 ?auto_754762 ) ) ( not ( = ?auto_754756 ?auto_754763 ) ) ( not ( = ?auto_754756 ?auto_754764 ) ) ( not ( = ?auto_754756 ?auto_754765 ) ) ( not ( = ?auto_754756 ?auto_754766 ) ) ( not ( = ?auto_754756 ?auto_754767 ) ) ( not ( = ?auto_754757 ?auto_754758 ) ) ( not ( = ?auto_754757 ?auto_754759 ) ) ( not ( = ?auto_754757 ?auto_754760 ) ) ( not ( = ?auto_754757 ?auto_754761 ) ) ( not ( = ?auto_754757 ?auto_754762 ) ) ( not ( = ?auto_754757 ?auto_754763 ) ) ( not ( = ?auto_754757 ?auto_754764 ) ) ( not ( = ?auto_754757 ?auto_754765 ) ) ( not ( = ?auto_754757 ?auto_754766 ) ) ( not ( = ?auto_754757 ?auto_754767 ) ) ( not ( = ?auto_754758 ?auto_754759 ) ) ( not ( = ?auto_754758 ?auto_754760 ) ) ( not ( = ?auto_754758 ?auto_754761 ) ) ( not ( = ?auto_754758 ?auto_754762 ) ) ( not ( = ?auto_754758 ?auto_754763 ) ) ( not ( = ?auto_754758 ?auto_754764 ) ) ( not ( = ?auto_754758 ?auto_754765 ) ) ( not ( = ?auto_754758 ?auto_754766 ) ) ( not ( = ?auto_754758 ?auto_754767 ) ) ( not ( = ?auto_754759 ?auto_754760 ) ) ( not ( = ?auto_754759 ?auto_754761 ) ) ( not ( = ?auto_754759 ?auto_754762 ) ) ( not ( = ?auto_754759 ?auto_754763 ) ) ( not ( = ?auto_754759 ?auto_754764 ) ) ( not ( = ?auto_754759 ?auto_754765 ) ) ( not ( = ?auto_754759 ?auto_754766 ) ) ( not ( = ?auto_754759 ?auto_754767 ) ) ( not ( = ?auto_754760 ?auto_754761 ) ) ( not ( = ?auto_754760 ?auto_754762 ) ) ( not ( = ?auto_754760 ?auto_754763 ) ) ( not ( = ?auto_754760 ?auto_754764 ) ) ( not ( = ?auto_754760 ?auto_754765 ) ) ( not ( = ?auto_754760 ?auto_754766 ) ) ( not ( = ?auto_754760 ?auto_754767 ) ) ( not ( = ?auto_754761 ?auto_754762 ) ) ( not ( = ?auto_754761 ?auto_754763 ) ) ( not ( = ?auto_754761 ?auto_754764 ) ) ( not ( = ?auto_754761 ?auto_754765 ) ) ( not ( = ?auto_754761 ?auto_754766 ) ) ( not ( = ?auto_754761 ?auto_754767 ) ) ( not ( = ?auto_754762 ?auto_754763 ) ) ( not ( = ?auto_754762 ?auto_754764 ) ) ( not ( = ?auto_754762 ?auto_754765 ) ) ( not ( = ?auto_754762 ?auto_754766 ) ) ( not ( = ?auto_754762 ?auto_754767 ) ) ( not ( = ?auto_754763 ?auto_754764 ) ) ( not ( = ?auto_754763 ?auto_754765 ) ) ( not ( = ?auto_754763 ?auto_754766 ) ) ( not ( = ?auto_754763 ?auto_754767 ) ) ( not ( = ?auto_754764 ?auto_754765 ) ) ( not ( = ?auto_754764 ?auto_754766 ) ) ( not ( = ?auto_754764 ?auto_754767 ) ) ( not ( = ?auto_754765 ?auto_754766 ) ) ( not ( = ?auto_754765 ?auto_754767 ) ) ( not ( = ?auto_754766 ?auto_754767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_754766 ?auto_754767 )
      ( !STACK ?auto_754766 ?auto_754765 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_754820 - BLOCK
      ?auto_754821 - BLOCK
      ?auto_754822 - BLOCK
      ?auto_754823 - BLOCK
      ?auto_754824 - BLOCK
      ?auto_754825 - BLOCK
      ?auto_754826 - BLOCK
      ?auto_754827 - BLOCK
      ?auto_754828 - BLOCK
      ?auto_754829 - BLOCK
      ?auto_754830 - BLOCK
      ?auto_754831 - BLOCK
      ?auto_754832 - BLOCK
      ?auto_754833 - BLOCK
      ?auto_754834 - BLOCK
      ?auto_754835 - BLOCK
      ?auto_754836 - BLOCK
    )
    :vars
    (
      ?auto_754837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754836 ?auto_754837 ) ( ON-TABLE ?auto_754820 ) ( ON ?auto_754821 ?auto_754820 ) ( ON ?auto_754822 ?auto_754821 ) ( ON ?auto_754823 ?auto_754822 ) ( ON ?auto_754824 ?auto_754823 ) ( ON ?auto_754825 ?auto_754824 ) ( ON ?auto_754826 ?auto_754825 ) ( ON ?auto_754827 ?auto_754826 ) ( ON ?auto_754828 ?auto_754827 ) ( ON ?auto_754829 ?auto_754828 ) ( ON ?auto_754830 ?auto_754829 ) ( ON ?auto_754831 ?auto_754830 ) ( ON ?auto_754832 ?auto_754831 ) ( ON ?auto_754833 ?auto_754832 ) ( ON ?auto_754834 ?auto_754833 ) ( not ( = ?auto_754820 ?auto_754821 ) ) ( not ( = ?auto_754820 ?auto_754822 ) ) ( not ( = ?auto_754820 ?auto_754823 ) ) ( not ( = ?auto_754820 ?auto_754824 ) ) ( not ( = ?auto_754820 ?auto_754825 ) ) ( not ( = ?auto_754820 ?auto_754826 ) ) ( not ( = ?auto_754820 ?auto_754827 ) ) ( not ( = ?auto_754820 ?auto_754828 ) ) ( not ( = ?auto_754820 ?auto_754829 ) ) ( not ( = ?auto_754820 ?auto_754830 ) ) ( not ( = ?auto_754820 ?auto_754831 ) ) ( not ( = ?auto_754820 ?auto_754832 ) ) ( not ( = ?auto_754820 ?auto_754833 ) ) ( not ( = ?auto_754820 ?auto_754834 ) ) ( not ( = ?auto_754820 ?auto_754835 ) ) ( not ( = ?auto_754820 ?auto_754836 ) ) ( not ( = ?auto_754820 ?auto_754837 ) ) ( not ( = ?auto_754821 ?auto_754822 ) ) ( not ( = ?auto_754821 ?auto_754823 ) ) ( not ( = ?auto_754821 ?auto_754824 ) ) ( not ( = ?auto_754821 ?auto_754825 ) ) ( not ( = ?auto_754821 ?auto_754826 ) ) ( not ( = ?auto_754821 ?auto_754827 ) ) ( not ( = ?auto_754821 ?auto_754828 ) ) ( not ( = ?auto_754821 ?auto_754829 ) ) ( not ( = ?auto_754821 ?auto_754830 ) ) ( not ( = ?auto_754821 ?auto_754831 ) ) ( not ( = ?auto_754821 ?auto_754832 ) ) ( not ( = ?auto_754821 ?auto_754833 ) ) ( not ( = ?auto_754821 ?auto_754834 ) ) ( not ( = ?auto_754821 ?auto_754835 ) ) ( not ( = ?auto_754821 ?auto_754836 ) ) ( not ( = ?auto_754821 ?auto_754837 ) ) ( not ( = ?auto_754822 ?auto_754823 ) ) ( not ( = ?auto_754822 ?auto_754824 ) ) ( not ( = ?auto_754822 ?auto_754825 ) ) ( not ( = ?auto_754822 ?auto_754826 ) ) ( not ( = ?auto_754822 ?auto_754827 ) ) ( not ( = ?auto_754822 ?auto_754828 ) ) ( not ( = ?auto_754822 ?auto_754829 ) ) ( not ( = ?auto_754822 ?auto_754830 ) ) ( not ( = ?auto_754822 ?auto_754831 ) ) ( not ( = ?auto_754822 ?auto_754832 ) ) ( not ( = ?auto_754822 ?auto_754833 ) ) ( not ( = ?auto_754822 ?auto_754834 ) ) ( not ( = ?auto_754822 ?auto_754835 ) ) ( not ( = ?auto_754822 ?auto_754836 ) ) ( not ( = ?auto_754822 ?auto_754837 ) ) ( not ( = ?auto_754823 ?auto_754824 ) ) ( not ( = ?auto_754823 ?auto_754825 ) ) ( not ( = ?auto_754823 ?auto_754826 ) ) ( not ( = ?auto_754823 ?auto_754827 ) ) ( not ( = ?auto_754823 ?auto_754828 ) ) ( not ( = ?auto_754823 ?auto_754829 ) ) ( not ( = ?auto_754823 ?auto_754830 ) ) ( not ( = ?auto_754823 ?auto_754831 ) ) ( not ( = ?auto_754823 ?auto_754832 ) ) ( not ( = ?auto_754823 ?auto_754833 ) ) ( not ( = ?auto_754823 ?auto_754834 ) ) ( not ( = ?auto_754823 ?auto_754835 ) ) ( not ( = ?auto_754823 ?auto_754836 ) ) ( not ( = ?auto_754823 ?auto_754837 ) ) ( not ( = ?auto_754824 ?auto_754825 ) ) ( not ( = ?auto_754824 ?auto_754826 ) ) ( not ( = ?auto_754824 ?auto_754827 ) ) ( not ( = ?auto_754824 ?auto_754828 ) ) ( not ( = ?auto_754824 ?auto_754829 ) ) ( not ( = ?auto_754824 ?auto_754830 ) ) ( not ( = ?auto_754824 ?auto_754831 ) ) ( not ( = ?auto_754824 ?auto_754832 ) ) ( not ( = ?auto_754824 ?auto_754833 ) ) ( not ( = ?auto_754824 ?auto_754834 ) ) ( not ( = ?auto_754824 ?auto_754835 ) ) ( not ( = ?auto_754824 ?auto_754836 ) ) ( not ( = ?auto_754824 ?auto_754837 ) ) ( not ( = ?auto_754825 ?auto_754826 ) ) ( not ( = ?auto_754825 ?auto_754827 ) ) ( not ( = ?auto_754825 ?auto_754828 ) ) ( not ( = ?auto_754825 ?auto_754829 ) ) ( not ( = ?auto_754825 ?auto_754830 ) ) ( not ( = ?auto_754825 ?auto_754831 ) ) ( not ( = ?auto_754825 ?auto_754832 ) ) ( not ( = ?auto_754825 ?auto_754833 ) ) ( not ( = ?auto_754825 ?auto_754834 ) ) ( not ( = ?auto_754825 ?auto_754835 ) ) ( not ( = ?auto_754825 ?auto_754836 ) ) ( not ( = ?auto_754825 ?auto_754837 ) ) ( not ( = ?auto_754826 ?auto_754827 ) ) ( not ( = ?auto_754826 ?auto_754828 ) ) ( not ( = ?auto_754826 ?auto_754829 ) ) ( not ( = ?auto_754826 ?auto_754830 ) ) ( not ( = ?auto_754826 ?auto_754831 ) ) ( not ( = ?auto_754826 ?auto_754832 ) ) ( not ( = ?auto_754826 ?auto_754833 ) ) ( not ( = ?auto_754826 ?auto_754834 ) ) ( not ( = ?auto_754826 ?auto_754835 ) ) ( not ( = ?auto_754826 ?auto_754836 ) ) ( not ( = ?auto_754826 ?auto_754837 ) ) ( not ( = ?auto_754827 ?auto_754828 ) ) ( not ( = ?auto_754827 ?auto_754829 ) ) ( not ( = ?auto_754827 ?auto_754830 ) ) ( not ( = ?auto_754827 ?auto_754831 ) ) ( not ( = ?auto_754827 ?auto_754832 ) ) ( not ( = ?auto_754827 ?auto_754833 ) ) ( not ( = ?auto_754827 ?auto_754834 ) ) ( not ( = ?auto_754827 ?auto_754835 ) ) ( not ( = ?auto_754827 ?auto_754836 ) ) ( not ( = ?auto_754827 ?auto_754837 ) ) ( not ( = ?auto_754828 ?auto_754829 ) ) ( not ( = ?auto_754828 ?auto_754830 ) ) ( not ( = ?auto_754828 ?auto_754831 ) ) ( not ( = ?auto_754828 ?auto_754832 ) ) ( not ( = ?auto_754828 ?auto_754833 ) ) ( not ( = ?auto_754828 ?auto_754834 ) ) ( not ( = ?auto_754828 ?auto_754835 ) ) ( not ( = ?auto_754828 ?auto_754836 ) ) ( not ( = ?auto_754828 ?auto_754837 ) ) ( not ( = ?auto_754829 ?auto_754830 ) ) ( not ( = ?auto_754829 ?auto_754831 ) ) ( not ( = ?auto_754829 ?auto_754832 ) ) ( not ( = ?auto_754829 ?auto_754833 ) ) ( not ( = ?auto_754829 ?auto_754834 ) ) ( not ( = ?auto_754829 ?auto_754835 ) ) ( not ( = ?auto_754829 ?auto_754836 ) ) ( not ( = ?auto_754829 ?auto_754837 ) ) ( not ( = ?auto_754830 ?auto_754831 ) ) ( not ( = ?auto_754830 ?auto_754832 ) ) ( not ( = ?auto_754830 ?auto_754833 ) ) ( not ( = ?auto_754830 ?auto_754834 ) ) ( not ( = ?auto_754830 ?auto_754835 ) ) ( not ( = ?auto_754830 ?auto_754836 ) ) ( not ( = ?auto_754830 ?auto_754837 ) ) ( not ( = ?auto_754831 ?auto_754832 ) ) ( not ( = ?auto_754831 ?auto_754833 ) ) ( not ( = ?auto_754831 ?auto_754834 ) ) ( not ( = ?auto_754831 ?auto_754835 ) ) ( not ( = ?auto_754831 ?auto_754836 ) ) ( not ( = ?auto_754831 ?auto_754837 ) ) ( not ( = ?auto_754832 ?auto_754833 ) ) ( not ( = ?auto_754832 ?auto_754834 ) ) ( not ( = ?auto_754832 ?auto_754835 ) ) ( not ( = ?auto_754832 ?auto_754836 ) ) ( not ( = ?auto_754832 ?auto_754837 ) ) ( not ( = ?auto_754833 ?auto_754834 ) ) ( not ( = ?auto_754833 ?auto_754835 ) ) ( not ( = ?auto_754833 ?auto_754836 ) ) ( not ( = ?auto_754833 ?auto_754837 ) ) ( not ( = ?auto_754834 ?auto_754835 ) ) ( not ( = ?auto_754834 ?auto_754836 ) ) ( not ( = ?auto_754834 ?auto_754837 ) ) ( not ( = ?auto_754835 ?auto_754836 ) ) ( not ( = ?auto_754835 ?auto_754837 ) ) ( not ( = ?auto_754836 ?auto_754837 ) ) ( CLEAR ?auto_754834 ) ( ON ?auto_754835 ?auto_754836 ) ( CLEAR ?auto_754835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_754820 ?auto_754821 ?auto_754822 ?auto_754823 ?auto_754824 ?auto_754825 ?auto_754826 ?auto_754827 ?auto_754828 ?auto_754829 ?auto_754830 ?auto_754831 ?auto_754832 ?auto_754833 ?auto_754834 ?auto_754835 )
      ( MAKE-17PILE ?auto_754820 ?auto_754821 ?auto_754822 ?auto_754823 ?auto_754824 ?auto_754825 ?auto_754826 ?auto_754827 ?auto_754828 ?auto_754829 ?auto_754830 ?auto_754831 ?auto_754832 ?auto_754833 ?auto_754834 ?auto_754835 ?auto_754836 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_754890 - BLOCK
      ?auto_754891 - BLOCK
      ?auto_754892 - BLOCK
      ?auto_754893 - BLOCK
      ?auto_754894 - BLOCK
      ?auto_754895 - BLOCK
      ?auto_754896 - BLOCK
      ?auto_754897 - BLOCK
      ?auto_754898 - BLOCK
      ?auto_754899 - BLOCK
      ?auto_754900 - BLOCK
      ?auto_754901 - BLOCK
      ?auto_754902 - BLOCK
      ?auto_754903 - BLOCK
      ?auto_754904 - BLOCK
      ?auto_754905 - BLOCK
      ?auto_754906 - BLOCK
    )
    :vars
    (
      ?auto_754907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754906 ?auto_754907 ) ( ON-TABLE ?auto_754890 ) ( ON ?auto_754891 ?auto_754890 ) ( ON ?auto_754892 ?auto_754891 ) ( ON ?auto_754893 ?auto_754892 ) ( ON ?auto_754894 ?auto_754893 ) ( ON ?auto_754895 ?auto_754894 ) ( ON ?auto_754896 ?auto_754895 ) ( ON ?auto_754897 ?auto_754896 ) ( ON ?auto_754898 ?auto_754897 ) ( ON ?auto_754899 ?auto_754898 ) ( ON ?auto_754900 ?auto_754899 ) ( ON ?auto_754901 ?auto_754900 ) ( ON ?auto_754902 ?auto_754901 ) ( ON ?auto_754903 ?auto_754902 ) ( not ( = ?auto_754890 ?auto_754891 ) ) ( not ( = ?auto_754890 ?auto_754892 ) ) ( not ( = ?auto_754890 ?auto_754893 ) ) ( not ( = ?auto_754890 ?auto_754894 ) ) ( not ( = ?auto_754890 ?auto_754895 ) ) ( not ( = ?auto_754890 ?auto_754896 ) ) ( not ( = ?auto_754890 ?auto_754897 ) ) ( not ( = ?auto_754890 ?auto_754898 ) ) ( not ( = ?auto_754890 ?auto_754899 ) ) ( not ( = ?auto_754890 ?auto_754900 ) ) ( not ( = ?auto_754890 ?auto_754901 ) ) ( not ( = ?auto_754890 ?auto_754902 ) ) ( not ( = ?auto_754890 ?auto_754903 ) ) ( not ( = ?auto_754890 ?auto_754904 ) ) ( not ( = ?auto_754890 ?auto_754905 ) ) ( not ( = ?auto_754890 ?auto_754906 ) ) ( not ( = ?auto_754890 ?auto_754907 ) ) ( not ( = ?auto_754891 ?auto_754892 ) ) ( not ( = ?auto_754891 ?auto_754893 ) ) ( not ( = ?auto_754891 ?auto_754894 ) ) ( not ( = ?auto_754891 ?auto_754895 ) ) ( not ( = ?auto_754891 ?auto_754896 ) ) ( not ( = ?auto_754891 ?auto_754897 ) ) ( not ( = ?auto_754891 ?auto_754898 ) ) ( not ( = ?auto_754891 ?auto_754899 ) ) ( not ( = ?auto_754891 ?auto_754900 ) ) ( not ( = ?auto_754891 ?auto_754901 ) ) ( not ( = ?auto_754891 ?auto_754902 ) ) ( not ( = ?auto_754891 ?auto_754903 ) ) ( not ( = ?auto_754891 ?auto_754904 ) ) ( not ( = ?auto_754891 ?auto_754905 ) ) ( not ( = ?auto_754891 ?auto_754906 ) ) ( not ( = ?auto_754891 ?auto_754907 ) ) ( not ( = ?auto_754892 ?auto_754893 ) ) ( not ( = ?auto_754892 ?auto_754894 ) ) ( not ( = ?auto_754892 ?auto_754895 ) ) ( not ( = ?auto_754892 ?auto_754896 ) ) ( not ( = ?auto_754892 ?auto_754897 ) ) ( not ( = ?auto_754892 ?auto_754898 ) ) ( not ( = ?auto_754892 ?auto_754899 ) ) ( not ( = ?auto_754892 ?auto_754900 ) ) ( not ( = ?auto_754892 ?auto_754901 ) ) ( not ( = ?auto_754892 ?auto_754902 ) ) ( not ( = ?auto_754892 ?auto_754903 ) ) ( not ( = ?auto_754892 ?auto_754904 ) ) ( not ( = ?auto_754892 ?auto_754905 ) ) ( not ( = ?auto_754892 ?auto_754906 ) ) ( not ( = ?auto_754892 ?auto_754907 ) ) ( not ( = ?auto_754893 ?auto_754894 ) ) ( not ( = ?auto_754893 ?auto_754895 ) ) ( not ( = ?auto_754893 ?auto_754896 ) ) ( not ( = ?auto_754893 ?auto_754897 ) ) ( not ( = ?auto_754893 ?auto_754898 ) ) ( not ( = ?auto_754893 ?auto_754899 ) ) ( not ( = ?auto_754893 ?auto_754900 ) ) ( not ( = ?auto_754893 ?auto_754901 ) ) ( not ( = ?auto_754893 ?auto_754902 ) ) ( not ( = ?auto_754893 ?auto_754903 ) ) ( not ( = ?auto_754893 ?auto_754904 ) ) ( not ( = ?auto_754893 ?auto_754905 ) ) ( not ( = ?auto_754893 ?auto_754906 ) ) ( not ( = ?auto_754893 ?auto_754907 ) ) ( not ( = ?auto_754894 ?auto_754895 ) ) ( not ( = ?auto_754894 ?auto_754896 ) ) ( not ( = ?auto_754894 ?auto_754897 ) ) ( not ( = ?auto_754894 ?auto_754898 ) ) ( not ( = ?auto_754894 ?auto_754899 ) ) ( not ( = ?auto_754894 ?auto_754900 ) ) ( not ( = ?auto_754894 ?auto_754901 ) ) ( not ( = ?auto_754894 ?auto_754902 ) ) ( not ( = ?auto_754894 ?auto_754903 ) ) ( not ( = ?auto_754894 ?auto_754904 ) ) ( not ( = ?auto_754894 ?auto_754905 ) ) ( not ( = ?auto_754894 ?auto_754906 ) ) ( not ( = ?auto_754894 ?auto_754907 ) ) ( not ( = ?auto_754895 ?auto_754896 ) ) ( not ( = ?auto_754895 ?auto_754897 ) ) ( not ( = ?auto_754895 ?auto_754898 ) ) ( not ( = ?auto_754895 ?auto_754899 ) ) ( not ( = ?auto_754895 ?auto_754900 ) ) ( not ( = ?auto_754895 ?auto_754901 ) ) ( not ( = ?auto_754895 ?auto_754902 ) ) ( not ( = ?auto_754895 ?auto_754903 ) ) ( not ( = ?auto_754895 ?auto_754904 ) ) ( not ( = ?auto_754895 ?auto_754905 ) ) ( not ( = ?auto_754895 ?auto_754906 ) ) ( not ( = ?auto_754895 ?auto_754907 ) ) ( not ( = ?auto_754896 ?auto_754897 ) ) ( not ( = ?auto_754896 ?auto_754898 ) ) ( not ( = ?auto_754896 ?auto_754899 ) ) ( not ( = ?auto_754896 ?auto_754900 ) ) ( not ( = ?auto_754896 ?auto_754901 ) ) ( not ( = ?auto_754896 ?auto_754902 ) ) ( not ( = ?auto_754896 ?auto_754903 ) ) ( not ( = ?auto_754896 ?auto_754904 ) ) ( not ( = ?auto_754896 ?auto_754905 ) ) ( not ( = ?auto_754896 ?auto_754906 ) ) ( not ( = ?auto_754896 ?auto_754907 ) ) ( not ( = ?auto_754897 ?auto_754898 ) ) ( not ( = ?auto_754897 ?auto_754899 ) ) ( not ( = ?auto_754897 ?auto_754900 ) ) ( not ( = ?auto_754897 ?auto_754901 ) ) ( not ( = ?auto_754897 ?auto_754902 ) ) ( not ( = ?auto_754897 ?auto_754903 ) ) ( not ( = ?auto_754897 ?auto_754904 ) ) ( not ( = ?auto_754897 ?auto_754905 ) ) ( not ( = ?auto_754897 ?auto_754906 ) ) ( not ( = ?auto_754897 ?auto_754907 ) ) ( not ( = ?auto_754898 ?auto_754899 ) ) ( not ( = ?auto_754898 ?auto_754900 ) ) ( not ( = ?auto_754898 ?auto_754901 ) ) ( not ( = ?auto_754898 ?auto_754902 ) ) ( not ( = ?auto_754898 ?auto_754903 ) ) ( not ( = ?auto_754898 ?auto_754904 ) ) ( not ( = ?auto_754898 ?auto_754905 ) ) ( not ( = ?auto_754898 ?auto_754906 ) ) ( not ( = ?auto_754898 ?auto_754907 ) ) ( not ( = ?auto_754899 ?auto_754900 ) ) ( not ( = ?auto_754899 ?auto_754901 ) ) ( not ( = ?auto_754899 ?auto_754902 ) ) ( not ( = ?auto_754899 ?auto_754903 ) ) ( not ( = ?auto_754899 ?auto_754904 ) ) ( not ( = ?auto_754899 ?auto_754905 ) ) ( not ( = ?auto_754899 ?auto_754906 ) ) ( not ( = ?auto_754899 ?auto_754907 ) ) ( not ( = ?auto_754900 ?auto_754901 ) ) ( not ( = ?auto_754900 ?auto_754902 ) ) ( not ( = ?auto_754900 ?auto_754903 ) ) ( not ( = ?auto_754900 ?auto_754904 ) ) ( not ( = ?auto_754900 ?auto_754905 ) ) ( not ( = ?auto_754900 ?auto_754906 ) ) ( not ( = ?auto_754900 ?auto_754907 ) ) ( not ( = ?auto_754901 ?auto_754902 ) ) ( not ( = ?auto_754901 ?auto_754903 ) ) ( not ( = ?auto_754901 ?auto_754904 ) ) ( not ( = ?auto_754901 ?auto_754905 ) ) ( not ( = ?auto_754901 ?auto_754906 ) ) ( not ( = ?auto_754901 ?auto_754907 ) ) ( not ( = ?auto_754902 ?auto_754903 ) ) ( not ( = ?auto_754902 ?auto_754904 ) ) ( not ( = ?auto_754902 ?auto_754905 ) ) ( not ( = ?auto_754902 ?auto_754906 ) ) ( not ( = ?auto_754902 ?auto_754907 ) ) ( not ( = ?auto_754903 ?auto_754904 ) ) ( not ( = ?auto_754903 ?auto_754905 ) ) ( not ( = ?auto_754903 ?auto_754906 ) ) ( not ( = ?auto_754903 ?auto_754907 ) ) ( not ( = ?auto_754904 ?auto_754905 ) ) ( not ( = ?auto_754904 ?auto_754906 ) ) ( not ( = ?auto_754904 ?auto_754907 ) ) ( not ( = ?auto_754905 ?auto_754906 ) ) ( not ( = ?auto_754905 ?auto_754907 ) ) ( not ( = ?auto_754906 ?auto_754907 ) ) ( ON ?auto_754905 ?auto_754906 ) ( CLEAR ?auto_754903 ) ( ON ?auto_754904 ?auto_754905 ) ( CLEAR ?auto_754904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_754890 ?auto_754891 ?auto_754892 ?auto_754893 ?auto_754894 ?auto_754895 ?auto_754896 ?auto_754897 ?auto_754898 ?auto_754899 ?auto_754900 ?auto_754901 ?auto_754902 ?auto_754903 ?auto_754904 )
      ( MAKE-17PILE ?auto_754890 ?auto_754891 ?auto_754892 ?auto_754893 ?auto_754894 ?auto_754895 ?auto_754896 ?auto_754897 ?auto_754898 ?auto_754899 ?auto_754900 ?auto_754901 ?auto_754902 ?auto_754903 ?auto_754904 ?auto_754905 ?auto_754906 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_754960 - BLOCK
      ?auto_754961 - BLOCK
      ?auto_754962 - BLOCK
      ?auto_754963 - BLOCK
      ?auto_754964 - BLOCK
      ?auto_754965 - BLOCK
      ?auto_754966 - BLOCK
      ?auto_754967 - BLOCK
      ?auto_754968 - BLOCK
      ?auto_754969 - BLOCK
      ?auto_754970 - BLOCK
      ?auto_754971 - BLOCK
      ?auto_754972 - BLOCK
      ?auto_754973 - BLOCK
      ?auto_754974 - BLOCK
      ?auto_754975 - BLOCK
      ?auto_754976 - BLOCK
    )
    :vars
    (
      ?auto_754977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_754976 ?auto_754977 ) ( ON-TABLE ?auto_754960 ) ( ON ?auto_754961 ?auto_754960 ) ( ON ?auto_754962 ?auto_754961 ) ( ON ?auto_754963 ?auto_754962 ) ( ON ?auto_754964 ?auto_754963 ) ( ON ?auto_754965 ?auto_754964 ) ( ON ?auto_754966 ?auto_754965 ) ( ON ?auto_754967 ?auto_754966 ) ( ON ?auto_754968 ?auto_754967 ) ( ON ?auto_754969 ?auto_754968 ) ( ON ?auto_754970 ?auto_754969 ) ( ON ?auto_754971 ?auto_754970 ) ( ON ?auto_754972 ?auto_754971 ) ( not ( = ?auto_754960 ?auto_754961 ) ) ( not ( = ?auto_754960 ?auto_754962 ) ) ( not ( = ?auto_754960 ?auto_754963 ) ) ( not ( = ?auto_754960 ?auto_754964 ) ) ( not ( = ?auto_754960 ?auto_754965 ) ) ( not ( = ?auto_754960 ?auto_754966 ) ) ( not ( = ?auto_754960 ?auto_754967 ) ) ( not ( = ?auto_754960 ?auto_754968 ) ) ( not ( = ?auto_754960 ?auto_754969 ) ) ( not ( = ?auto_754960 ?auto_754970 ) ) ( not ( = ?auto_754960 ?auto_754971 ) ) ( not ( = ?auto_754960 ?auto_754972 ) ) ( not ( = ?auto_754960 ?auto_754973 ) ) ( not ( = ?auto_754960 ?auto_754974 ) ) ( not ( = ?auto_754960 ?auto_754975 ) ) ( not ( = ?auto_754960 ?auto_754976 ) ) ( not ( = ?auto_754960 ?auto_754977 ) ) ( not ( = ?auto_754961 ?auto_754962 ) ) ( not ( = ?auto_754961 ?auto_754963 ) ) ( not ( = ?auto_754961 ?auto_754964 ) ) ( not ( = ?auto_754961 ?auto_754965 ) ) ( not ( = ?auto_754961 ?auto_754966 ) ) ( not ( = ?auto_754961 ?auto_754967 ) ) ( not ( = ?auto_754961 ?auto_754968 ) ) ( not ( = ?auto_754961 ?auto_754969 ) ) ( not ( = ?auto_754961 ?auto_754970 ) ) ( not ( = ?auto_754961 ?auto_754971 ) ) ( not ( = ?auto_754961 ?auto_754972 ) ) ( not ( = ?auto_754961 ?auto_754973 ) ) ( not ( = ?auto_754961 ?auto_754974 ) ) ( not ( = ?auto_754961 ?auto_754975 ) ) ( not ( = ?auto_754961 ?auto_754976 ) ) ( not ( = ?auto_754961 ?auto_754977 ) ) ( not ( = ?auto_754962 ?auto_754963 ) ) ( not ( = ?auto_754962 ?auto_754964 ) ) ( not ( = ?auto_754962 ?auto_754965 ) ) ( not ( = ?auto_754962 ?auto_754966 ) ) ( not ( = ?auto_754962 ?auto_754967 ) ) ( not ( = ?auto_754962 ?auto_754968 ) ) ( not ( = ?auto_754962 ?auto_754969 ) ) ( not ( = ?auto_754962 ?auto_754970 ) ) ( not ( = ?auto_754962 ?auto_754971 ) ) ( not ( = ?auto_754962 ?auto_754972 ) ) ( not ( = ?auto_754962 ?auto_754973 ) ) ( not ( = ?auto_754962 ?auto_754974 ) ) ( not ( = ?auto_754962 ?auto_754975 ) ) ( not ( = ?auto_754962 ?auto_754976 ) ) ( not ( = ?auto_754962 ?auto_754977 ) ) ( not ( = ?auto_754963 ?auto_754964 ) ) ( not ( = ?auto_754963 ?auto_754965 ) ) ( not ( = ?auto_754963 ?auto_754966 ) ) ( not ( = ?auto_754963 ?auto_754967 ) ) ( not ( = ?auto_754963 ?auto_754968 ) ) ( not ( = ?auto_754963 ?auto_754969 ) ) ( not ( = ?auto_754963 ?auto_754970 ) ) ( not ( = ?auto_754963 ?auto_754971 ) ) ( not ( = ?auto_754963 ?auto_754972 ) ) ( not ( = ?auto_754963 ?auto_754973 ) ) ( not ( = ?auto_754963 ?auto_754974 ) ) ( not ( = ?auto_754963 ?auto_754975 ) ) ( not ( = ?auto_754963 ?auto_754976 ) ) ( not ( = ?auto_754963 ?auto_754977 ) ) ( not ( = ?auto_754964 ?auto_754965 ) ) ( not ( = ?auto_754964 ?auto_754966 ) ) ( not ( = ?auto_754964 ?auto_754967 ) ) ( not ( = ?auto_754964 ?auto_754968 ) ) ( not ( = ?auto_754964 ?auto_754969 ) ) ( not ( = ?auto_754964 ?auto_754970 ) ) ( not ( = ?auto_754964 ?auto_754971 ) ) ( not ( = ?auto_754964 ?auto_754972 ) ) ( not ( = ?auto_754964 ?auto_754973 ) ) ( not ( = ?auto_754964 ?auto_754974 ) ) ( not ( = ?auto_754964 ?auto_754975 ) ) ( not ( = ?auto_754964 ?auto_754976 ) ) ( not ( = ?auto_754964 ?auto_754977 ) ) ( not ( = ?auto_754965 ?auto_754966 ) ) ( not ( = ?auto_754965 ?auto_754967 ) ) ( not ( = ?auto_754965 ?auto_754968 ) ) ( not ( = ?auto_754965 ?auto_754969 ) ) ( not ( = ?auto_754965 ?auto_754970 ) ) ( not ( = ?auto_754965 ?auto_754971 ) ) ( not ( = ?auto_754965 ?auto_754972 ) ) ( not ( = ?auto_754965 ?auto_754973 ) ) ( not ( = ?auto_754965 ?auto_754974 ) ) ( not ( = ?auto_754965 ?auto_754975 ) ) ( not ( = ?auto_754965 ?auto_754976 ) ) ( not ( = ?auto_754965 ?auto_754977 ) ) ( not ( = ?auto_754966 ?auto_754967 ) ) ( not ( = ?auto_754966 ?auto_754968 ) ) ( not ( = ?auto_754966 ?auto_754969 ) ) ( not ( = ?auto_754966 ?auto_754970 ) ) ( not ( = ?auto_754966 ?auto_754971 ) ) ( not ( = ?auto_754966 ?auto_754972 ) ) ( not ( = ?auto_754966 ?auto_754973 ) ) ( not ( = ?auto_754966 ?auto_754974 ) ) ( not ( = ?auto_754966 ?auto_754975 ) ) ( not ( = ?auto_754966 ?auto_754976 ) ) ( not ( = ?auto_754966 ?auto_754977 ) ) ( not ( = ?auto_754967 ?auto_754968 ) ) ( not ( = ?auto_754967 ?auto_754969 ) ) ( not ( = ?auto_754967 ?auto_754970 ) ) ( not ( = ?auto_754967 ?auto_754971 ) ) ( not ( = ?auto_754967 ?auto_754972 ) ) ( not ( = ?auto_754967 ?auto_754973 ) ) ( not ( = ?auto_754967 ?auto_754974 ) ) ( not ( = ?auto_754967 ?auto_754975 ) ) ( not ( = ?auto_754967 ?auto_754976 ) ) ( not ( = ?auto_754967 ?auto_754977 ) ) ( not ( = ?auto_754968 ?auto_754969 ) ) ( not ( = ?auto_754968 ?auto_754970 ) ) ( not ( = ?auto_754968 ?auto_754971 ) ) ( not ( = ?auto_754968 ?auto_754972 ) ) ( not ( = ?auto_754968 ?auto_754973 ) ) ( not ( = ?auto_754968 ?auto_754974 ) ) ( not ( = ?auto_754968 ?auto_754975 ) ) ( not ( = ?auto_754968 ?auto_754976 ) ) ( not ( = ?auto_754968 ?auto_754977 ) ) ( not ( = ?auto_754969 ?auto_754970 ) ) ( not ( = ?auto_754969 ?auto_754971 ) ) ( not ( = ?auto_754969 ?auto_754972 ) ) ( not ( = ?auto_754969 ?auto_754973 ) ) ( not ( = ?auto_754969 ?auto_754974 ) ) ( not ( = ?auto_754969 ?auto_754975 ) ) ( not ( = ?auto_754969 ?auto_754976 ) ) ( not ( = ?auto_754969 ?auto_754977 ) ) ( not ( = ?auto_754970 ?auto_754971 ) ) ( not ( = ?auto_754970 ?auto_754972 ) ) ( not ( = ?auto_754970 ?auto_754973 ) ) ( not ( = ?auto_754970 ?auto_754974 ) ) ( not ( = ?auto_754970 ?auto_754975 ) ) ( not ( = ?auto_754970 ?auto_754976 ) ) ( not ( = ?auto_754970 ?auto_754977 ) ) ( not ( = ?auto_754971 ?auto_754972 ) ) ( not ( = ?auto_754971 ?auto_754973 ) ) ( not ( = ?auto_754971 ?auto_754974 ) ) ( not ( = ?auto_754971 ?auto_754975 ) ) ( not ( = ?auto_754971 ?auto_754976 ) ) ( not ( = ?auto_754971 ?auto_754977 ) ) ( not ( = ?auto_754972 ?auto_754973 ) ) ( not ( = ?auto_754972 ?auto_754974 ) ) ( not ( = ?auto_754972 ?auto_754975 ) ) ( not ( = ?auto_754972 ?auto_754976 ) ) ( not ( = ?auto_754972 ?auto_754977 ) ) ( not ( = ?auto_754973 ?auto_754974 ) ) ( not ( = ?auto_754973 ?auto_754975 ) ) ( not ( = ?auto_754973 ?auto_754976 ) ) ( not ( = ?auto_754973 ?auto_754977 ) ) ( not ( = ?auto_754974 ?auto_754975 ) ) ( not ( = ?auto_754974 ?auto_754976 ) ) ( not ( = ?auto_754974 ?auto_754977 ) ) ( not ( = ?auto_754975 ?auto_754976 ) ) ( not ( = ?auto_754975 ?auto_754977 ) ) ( not ( = ?auto_754976 ?auto_754977 ) ) ( ON ?auto_754975 ?auto_754976 ) ( ON ?auto_754974 ?auto_754975 ) ( CLEAR ?auto_754972 ) ( ON ?auto_754973 ?auto_754974 ) ( CLEAR ?auto_754973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_754960 ?auto_754961 ?auto_754962 ?auto_754963 ?auto_754964 ?auto_754965 ?auto_754966 ?auto_754967 ?auto_754968 ?auto_754969 ?auto_754970 ?auto_754971 ?auto_754972 ?auto_754973 )
      ( MAKE-17PILE ?auto_754960 ?auto_754961 ?auto_754962 ?auto_754963 ?auto_754964 ?auto_754965 ?auto_754966 ?auto_754967 ?auto_754968 ?auto_754969 ?auto_754970 ?auto_754971 ?auto_754972 ?auto_754973 ?auto_754974 ?auto_754975 ?auto_754976 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755030 - BLOCK
      ?auto_755031 - BLOCK
      ?auto_755032 - BLOCK
      ?auto_755033 - BLOCK
      ?auto_755034 - BLOCK
      ?auto_755035 - BLOCK
      ?auto_755036 - BLOCK
      ?auto_755037 - BLOCK
      ?auto_755038 - BLOCK
      ?auto_755039 - BLOCK
      ?auto_755040 - BLOCK
      ?auto_755041 - BLOCK
      ?auto_755042 - BLOCK
      ?auto_755043 - BLOCK
      ?auto_755044 - BLOCK
      ?auto_755045 - BLOCK
      ?auto_755046 - BLOCK
    )
    :vars
    (
      ?auto_755047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755046 ?auto_755047 ) ( ON-TABLE ?auto_755030 ) ( ON ?auto_755031 ?auto_755030 ) ( ON ?auto_755032 ?auto_755031 ) ( ON ?auto_755033 ?auto_755032 ) ( ON ?auto_755034 ?auto_755033 ) ( ON ?auto_755035 ?auto_755034 ) ( ON ?auto_755036 ?auto_755035 ) ( ON ?auto_755037 ?auto_755036 ) ( ON ?auto_755038 ?auto_755037 ) ( ON ?auto_755039 ?auto_755038 ) ( ON ?auto_755040 ?auto_755039 ) ( ON ?auto_755041 ?auto_755040 ) ( not ( = ?auto_755030 ?auto_755031 ) ) ( not ( = ?auto_755030 ?auto_755032 ) ) ( not ( = ?auto_755030 ?auto_755033 ) ) ( not ( = ?auto_755030 ?auto_755034 ) ) ( not ( = ?auto_755030 ?auto_755035 ) ) ( not ( = ?auto_755030 ?auto_755036 ) ) ( not ( = ?auto_755030 ?auto_755037 ) ) ( not ( = ?auto_755030 ?auto_755038 ) ) ( not ( = ?auto_755030 ?auto_755039 ) ) ( not ( = ?auto_755030 ?auto_755040 ) ) ( not ( = ?auto_755030 ?auto_755041 ) ) ( not ( = ?auto_755030 ?auto_755042 ) ) ( not ( = ?auto_755030 ?auto_755043 ) ) ( not ( = ?auto_755030 ?auto_755044 ) ) ( not ( = ?auto_755030 ?auto_755045 ) ) ( not ( = ?auto_755030 ?auto_755046 ) ) ( not ( = ?auto_755030 ?auto_755047 ) ) ( not ( = ?auto_755031 ?auto_755032 ) ) ( not ( = ?auto_755031 ?auto_755033 ) ) ( not ( = ?auto_755031 ?auto_755034 ) ) ( not ( = ?auto_755031 ?auto_755035 ) ) ( not ( = ?auto_755031 ?auto_755036 ) ) ( not ( = ?auto_755031 ?auto_755037 ) ) ( not ( = ?auto_755031 ?auto_755038 ) ) ( not ( = ?auto_755031 ?auto_755039 ) ) ( not ( = ?auto_755031 ?auto_755040 ) ) ( not ( = ?auto_755031 ?auto_755041 ) ) ( not ( = ?auto_755031 ?auto_755042 ) ) ( not ( = ?auto_755031 ?auto_755043 ) ) ( not ( = ?auto_755031 ?auto_755044 ) ) ( not ( = ?auto_755031 ?auto_755045 ) ) ( not ( = ?auto_755031 ?auto_755046 ) ) ( not ( = ?auto_755031 ?auto_755047 ) ) ( not ( = ?auto_755032 ?auto_755033 ) ) ( not ( = ?auto_755032 ?auto_755034 ) ) ( not ( = ?auto_755032 ?auto_755035 ) ) ( not ( = ?auto_755032 ?auto_755036 ) ) ( not ( = ?auto_755032 ?auto_755037 ) ) ( not ( = ?auto_755032 ?auto_755038 ) ) ( not ( = ?auto_755032 ?auto_755039 ) ) ( not ( = ?auto_755032 ?auto_755040 ) ) ( not ( = ?auto_755032 ?auto_755041 ) ) ( not ( = ?auto_755032 ?auto_755042 ) ) ( not ( = ?auto_755032 ?auto_755043 ) ) ( not ( = ?auto_755032 ?auto_755044 ) ) ( not ( = ?auto_755032 ?auto_755045 ) ) ( not ( = ?auto_755032 ?auto_755046 ) ) ( not ( = ?auto_755032 ?auto_755047 ) ) ( not ( = ?auto_755033 ?auto_755034 ) ) ( not ( = ?auto_755033 ?auto_755035 ) ) ( not ( = ?auto_755033 ?auto_755036 ) ) ( not ( = ?auto_755033 ?auto_755037 ) ) ( not ( = ?auto_755033 ?auto_755038 ) ) ( not ( = ?auto_755033 ?auto_755039 ) ) ( not ( = ?auto_755033 ?auto_755040 ) ) ( not ( = ?auto_755033 ?auto_755041 ) ) ( not ( = ?auto_755033 ?auto_755042 ) ) ( not ( = ?auto_755033 ?auto_755043 ) ) ( not ( = ?auto_755033 ?auto_755044 ) ) ( not ( = ?auto_755033 ?auto_755045 ) ) ( not ( = ?auto_755033 ?auto_755046 ) ) ( not ( = ?auto_755033 ?auto_755047 ) ) ( not ( = ?auto_755034 ?auto_755035 ) ) ( not ( = ?auto_755034 ?auto_755036 ) ) ( not ( = ?auto_755034 ?auto_755037 ) ) ( not ( = ?auto_755034 ?auto_755038 ) ) ( not ( = ?auto_755034 ?auto_755039 ) ) ( not ( = ?auto_755034 ?auto_755040 ) ) ( not ( = ?auto_755034 ?auto_755041 ) ) ( not ( = ?auto_755034 ?auto_755042 ) ) ( not ( = ?auto_755034 ?auto_755043 ) ) ( not ( = ?auto_755034 ?auto_755044 ) ) ( not ( = ?auto_755034 ?auto_755045 ) ) ( not ( = ?auto_755034 ?auto_755046 ) ) ( not ( = ?auto_755034 ?auto_755047 ) ) ( not ( = ?auto_755035 ?auto_755036 ) ) ( not ( = ?auto_755035 ?auto_755037 ) ) ( not ( = ?auto_755035 ?auto_755038 ) ) ( not ( = ?auto_755035 ?auto_755039 ) ) ( not ( = ?auto_755035 ?auto_755040 ) ) ( not ( = ?auto_755035 ?auto_755041 ) ) ( not ( = ?auto_755035 ?auto_755042 ) ) ( not ( = ?auto_755035 ?auto_755043 ) ) ( not ( = ?auto_755035 ?auto_755044 ) ) ( not ( = ?auto_755035 ?auto_755045 ) ) ( not ( = ?auto_755035 ?auto_755046 ) ) ( not ( = ?auto_755035 ?auto_755047 ) ) ( not ( = ?auto_755036 ?auto_755037 ) ) ( not ( = ?auto_755036 ?auto_755038 ) ) ( not ( = ?auto_755036 ?auto_755039 ) ) ( not ( = ?auto_755036 ?auto_755040 ) ) ( not ( = ?auto_755036 ?auto_755041 ) ) ( not ( = ?auto_755036 ?auto_755042 ) ) ( not ( = ?auto_755036 ?auto_755043 ) ) ( not ( = ?auto_755036 ?auto_755044 ) ) ( not ( = ?auto_755036 ?auto_755045 ) ) ( not ( = ?auto_755036 ?auto_755046 ) ) ( not ( = ?auto_755036 ?auto_755047 ) ) ( not ( = ?auto_755037 ?auto_755038 ) ) ( not ( = ?auto_755037 ?auto_755039 ) ) ( not ( = ?auto_755037 ?auto_755040 ) ) ( not ( = ?auto_755037 ?auto_755041 ) ) ( not ( = ?auto_755037 ?auto_755042 ) ) ( not ( = ?auto_755037 ?auto_755043 ) ) ( not ( = ?auto_755037 ?auto_755044 ) ) ( not ( = ?auto_755037 ?auto_755045 ) ) ( not ( = ?auto_755037 ?auto_755046 ) ) ( not ( = ?auto_755037 ?auto_755047 ) ) ( not ( = ?auto_755038 ?auto_755039 ) ) ( not ( = ?auto_755038 ?auto_755040 ) ) ( not ( = ?auto_755038 ?auto_755041 ) ) ( not ( = ?auto_755038 ?auto_755042 ) ) ( not ( = ?auto_755038 ?auto_755043 ) ) ( not ( = ?auto_755038 ?auto_755044 ) ) ( not ( = ?auto_755038 ?auto_755045 ) ) ( not ( = ?auto_755038 ?auto_755046 ) ) ( not ( = ?auto_755038 ?auto_755047 ) ) ( not ( = ?auto_755039 ?auto_755040 ) ) ( not ( = ?auto_755039 ?auto_755041 ) ) ( not ( = ?auto_755039 ?auto_755042 ) ) ( not ( = ?auto_755039 ?auto_755043 ) ) ( not ( = ?auto_755039 ?auto_755044 ) ) ( not ( = ?auto_755039 ?auto_755045 ) ) ( not ( = ?auto_755039 ?auto_755046 ) ) ( not ( = ?auto_755039 ?auto_755047 ) ) ( not ( = ?auto_755040 ?auto_755041 ) ) ( not ( = ?auto_755040 ?auto_755042 ) ) ( not ( = ?auto_755040 ?auto_755043 ) ) ( not ( = ?auto_755040 ?auto_755044 ) ) ( not ( = ?auto_755040 ?auto_755045 ) ) ( not ( = ?auto_755040 ?auto_755046 ) ) ( not ( = ?auto_755040 ?auto_755047 ) ) ( not ( = ?auto_755041 ?auto_755042 ) ) ( not ( = ?auto_755041 ?auto_755043 ) ) ( not ( = ?auto_755041 ?auto_755044 ) ) ( not ( = ?auto_755041 ?auto_755045 ) ) ( not ( = ?auto_755041 ?auto_755046 ) ) ( not ( = ?auto_755041 ?auto_755047 ) ) ( not ( = ?auto_755042 ?auto_755043 ) ) ( not ( = ?auto_755042 ?auto_755044 ) ) ( not ( = ?auto_755042 ?auto_755045 ) ) ( not ( = ?auto_755042 ?auto_755046 ) ) ( not ( = ?auto_755042 ?auto_755047 ) ) ( not ( = ?auto_755043 ?auto_755044 ) ) ( not ( = ?auto_755043 ?auto_755045 ) ) ( not ( = ?auto_755043 ?auto_755046 ) ) ( not ( = ?auto_755043 ?auto_755047 ) ) ( not ( = ?auto_755044 ?auto_755045 ) ) ( not ( = ?auto_755044 ?auto_755046 ) ) ( not ( = ?auto_755044 ?auto_755047 ) ) ( not ( = ?auto_755045 ?auto_755046 ) ) ( not ( = ?auto_755045 ?auto_755047 ) ) ( not ( = ?auto_755046 ?auto_755047 ) ) ( ON ?auto_755045 ?auto_755046 ) ( ON ?auto_755044 ?auto_755045 ) ( ON ?auto_755043 ?auto_755044 ) ( CLEAR ?auto_755041 ) ( ON ?auto_755042 ?auto_755043 ) ( CLEAR ?auto_755042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_755030 ?auto_755031 ?auto_755032 ?auto_755033 ?auto_755034 ?auto_755035 ?auto_755036 ?auto_755037 ?auto_755038 ?auto_755039 ?auto_755040 ?auto_755041 ?auto_755042 )
      ( MAKE-17PILE ?auto_755030 ?auto_755031 ?auto_755032 ?auto_755033 ?auto_755034 ?auto_755035 ?auto_755036 ?auto_755037 ?auto_755038 ?auto_755039 ?auto_755040 ?auto_755041 ?auto_755042 ?auto_755043 ?auto_755044 ?auto_755045 ?auto_755046 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755100 - BLOCK
      ?auto_755101 - BLOCK
      ?auto_755102 - BLOCK
      ?auto_755103 - BLOCK
      ?auto_755104 - BLOCK
      ?auto_755105 - BLOCK
      ?auto_755106 - BLOCK
      ?auto_755107 - BLOCK
      ?auto_755108 - BLOCK
      ?auto_755109 - BLOCK
      ?auto_755110 - BLOCK
      ?auto_755111 - BLOCK
      ?auto_755112 - BLOCK
      ?auto_755113 - BLOCK
      ?auto_755114 - BLOCK
      ?auto_755115 - BLOCK
      ?auto_755116 - BLOCK
    )
    :vars
    (
      ?auto_755117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755116 ?auto_755117 ) ( ON-TABLE ?auto_755100 ) ( ON ?auto_755101 ?auto_755100 ) ( ON ?auto_755102 ?auto_755101 ) ( ON ?auto_755103 ?auto_755102 ) ( ON ?auto_755104 ?auto_755103 ) ( ON ?auto_755105 ?auto_755104 ) ( ON ?auto_755106 ?auto_755105 ) ( ON ?auto_755107 ?auto_755106 ) ( ON ?auto_755108 ?auto_755107 ) ( ON ?auto_755109 ?auto_755108 ) ( ON ?auto_755110 ?auto_755109 ) ( not ( = ?auto_755100 ?auto_755101 ) ) ( not ( = ?auto_755100 ?auto_755102 ) ) ( not ( = ?auto_755100 ?auto_755103 ) ) ( not ( = ?auto_755100 ?auto_755104 ) ) ( not ( = ?auto_755100 ?auto_755105 ) ) ( not ( = ?auto_755100 ?auto_755106 ) ) ( not ( = ?auto_755100 ?auto_755107 ) ) ( not ( = ?auto_755100 ?auto_755108 ) ) ( not ( = ?auto_755100 ?auto_755109 ) ) ( not ( = ?auto_755100 ?auto_755110 ) ) ( not ( = ?auto_755100 ?auto_755111 ) ) ( not ( = ?auto_755100 ?auto_755112 ) ) ( not ( = ?auto_755100 ?auto_755113 ) ) ( not ( = ?auto_755100 ?auto_755114 ) ) ( not ( = ?auto_755100 ?auto_755115 ) ) ( not ( = ?auto_755100 ?auto_755116 ) ) ( not ( = ?auto_755100 ?auto_755117 ) ) ( not ( = ?auto_755101 ?auto_755102 ) ) ( not ( = ?auto_755101 ?auto_755103 ) ) ( not ( = ?auto_755101 ?auto_755104 ) ) ( not ( = ?auto_755101 ?auto_755105 ) ) ( not ( = ?auto_755101 ?auto_755106 ) ) ( not ( = ?auto_755101 ?auto_755107 ) ) ( not ( = ?auto_755101 ?auto_755108 ) ) ( not ( = ?auto_755101 ?auto_755109 ) ) ( not ( = ?auto_755101 ?auto_755110 ) ) ( not ( = ?auto_755101 ?auto_755111 ) ) ( not ( = ?auto_755101 ?auto_755112 ) ) ( not ( = ?auto_755101 ?auto_755113 ) ) ( not ( = ?auto_755101 ?auto_755114 ) ) ( not ( = ?auto_755101 ?auto_755115 ) ) ( not ( = ?auto_755101 ?auto_755116 ) ) ( not ( = ?auto_755101 ?auto_755117 ) ) ( not ( = ?auto_755102 ?auto_755103 ) ) ( not ( = ?auto_755102 ?auto_755104 ) ) ( not ( = ?auto_755102 ?auto_755105 ) ) ( not ( = ?auto_755102 ?auto_755106 ) ) ( not ( = ?auto_755102 ?auto_755107 ) ) ( not ( = ?auto_755102 ?auto_755108 ) ) ( not ( = ?auto_755102 ?auto_755109 ) ) ( not ( = ?auto_755102 ?auto_755110 ) ) ( not ( = ?auto_755102 ?auto_755111 ) ) ( not ( = ?auto_755102 ?auto_755112 ) ) ( not ( = ?auto_755102 ?auto_755113 ) ) ( not ( = ?auto_755102 ?auto_755114 ) ) ( not ( = ?auto_755102 ?auto_755115 ) ) ( not ( = ?auto_755102 ?auto_755116 ) ) ( not ( = ?auto_755102 ?auto_755117 ) ) ( not ( = ?auto_755103 ?auto_755104 ) ) ( not ( = ?auto_755103 ?auto_755105 ) ) ( not ( = ?auto_755103 ?auto_755106 ) ) ( not ( = ?auto_755103 ?auto_755107 ) ) ( not ( = ?auto_755103 ?auto_755108 ) ) ( not ( = ?auto_755103 ?auto_755109 ) ) ( not ( = ?auto_755103 ?auto_755110 ) ) ( not ( = ?auto_755103 ?auto_755111 ) ) ( not ( = ?auto_755103 ?auto_755112 ) ) ( not ( = ?auto_755103 ?auto_755113 ) ) ( not ( = ?auto_755103 ?auto_755114 ) ) ( not ( = ?auto_755103 ?auto_755115 ) ) ( not ( = ?auto_755103 ?auto_755116 ) ) ( not ( = ?auto_755103 ?auto_755117 ) ) ( not ( = ?auto_755104 ?auto_755105 ) ) ( not ( = ?auto_755104 ?auto_755106 ) ) ( not ( = ?auto_755104 ?auto_755107 ) ) ( not ( = ?auto_755104 ?auto_755108 ) ) ( not ( = ?auto_755104 ?auto_755109 ) ) ( not ( = ?auto_755104 ?auto_755110 ) ) ( not ( = ?auto_755104 ?auto_755111 ) ) ( not ( = ?auto_755104 ?auto_755112 ) ) ( not ( = ?auto_755104 ?auto_755113 ) ) ( not ( = ?auto_755104 ?auto_755114 ) ) ( not ( = ?auto_755104 ?auto_755115 ) ) ( not ( = ?auto_755104 ?auto_755116 ) ) ( not ( = ?auto_755104 ?auto_755117 ) ) ( not ( = ?auto_755105 ?auto_755106 ) ) ( not ( = ?auto_755105 ?auto_755107 ) ) ( not ( = ?auto_755105 ?auto_755108 ) ) ( not ( = ?auto_755105 ?auto_755109 ) ) ( not ( = ?auto_755105 ?auto_755110 ) ) ( not ( = ?auto_755105 ?auto_755111 ) ) ( not ( = ?auto_755105 ?auto_755112 ) ) ( not ( = ?auto_755105 ?auto_755113 ) ) ( not ( = ?auto_755105 ?auto_755114 ) ) ( not ( = ?auto_755105 ?auto_755115 ) ) ( not ( = ?auto_755105 ?auto_755116 ) ) ( not ( = ?auto_755105 ?auto_755117 ) ) ( not ( = ?auto_755106 ?auto_755107 ) ) ( not ( = ?auto_755106 ?auto_755108 ) ) ( not ( = ?auto_755106 ?auto_755109 ) ) ( not ( = ?auto_755106 ?auto_755110 ) ) ( not ( = ?auto_755106 ?auto_755111 ) ) ( not ( = ?auto_755106 ?auto_755112 ) ) ( not ( = ?auto_755106 ?auto_755113 ) ) ( not ( = ?auto_755106 ?auto_755114 ) ) ( not ( = ?auto_755106 ?auto_755115 ) ) ( not ( = ?auto_755106 ?auto_755116 ) ) ( not ( = ?auto_755106 ?auto_755117 ) ) ( not ( = ?auto_755107 ?auto_755108 ) ) ( not ( = ?auto_755107 ?auto_755109 ) ) ( not ( = ?auto_755107 ?auto_755110 ) ) ( not ( = ?auto_755107 ?auto_755111 ) ) ( not ( = ?auto_755107 ?auto_755112 ) ) ( not ( = ?auto_755107 ?auto_755113 ) ) ( not ( = ?auto_755107 ?auto_755114 ) ) ( not ( = ?auto_755107 ?auto_755115 ) ) ( not ( = ?auto_755107 ?auto_755116 ) ) ( not ( = ?auto_755107 ?auto_755117 ) ) ( not ( = ?auto_755108 ?auto_755109 ) ) ( not ( = ?auto_755108 ?auto_755110 ) ) ( not ( = ?auto_755108 ?auto_755111 ) ) ( not ( = ?auto_755108 ?auto_755112 ) ) ( not ( = ?auto_755108 ?auto_755113 ) ) ( not ( = ?auto_755108 ?auto_755114 ) ) ( not ( = ?auto_755108 ?auto_755115 ) ) ( not ( = ?auto_755108 ?auto_755116 ) ) ( not ( = ?auto_755108 ?auto_755117 ) ) ( not ( = ?auto_755109 ?auto_755110 ) ) ( not ( = ?auto_755109 ?auto_755111 ) ) ( not ( = ?auto_755109 ?auto_755112 ) ) ( not ( = ?auto_755109 ?auto_755113 ) ) ( not ( = ?auto_755109 ?auto_755114 ) ) ( not ( = ?auto_755109 ?auto_755115 ) ) ( not ( = ?auto_755109 ?auto_755116 ) ) ( not ( = ?auto_755109 ?auto_755117 ) ) ( not ( = ?auto_755110 ?auto_755111 ) ) ( not ( = ?auto_755110 ?auto_755112 ) ) ( not ( = ?auto_755110 ?auto_755113 ) ) ( not ( = ?auto_755110 ?auto_755114 ) ) ( not ( = ?auto_755110 ?auto_755115 ) ) ( not ( = ?auto_755110 ?auto_755116 ) ) ( not ( = ?auto_755110 ?auto_755117 ) ) ( not ( = ?auto_755111 ?auto_755112 ) ) ( not ( = ?auto_755111 ?auto_755113 ) ) ( not ( = ?auto_755111 ?auto_755114 ) ) ( not ( = ?auto_755111 ?auto_755115 ) ) ( not ( = ?auto_755111 ?auto_755116 ) ) ( not ( = ?auto_755111 ?auto_755117 ) ) ( not ( = ?auto_755112 ?auto_755113 ) ) ( not ( = ?auto_755112 ?auto_755114 ) ) ( not ( = ?auto_755112 ?auto_755115 ) ) ( not ( = ?auto_755112 ?auto_755116 ) ) ( not ( = ?auto_755112 ?auto_755117 ) ) ( not ( = ?auto_755113 ?auto_755114 ) ) ( not ( = ?auto_755113 ?auto_755115 ) ) ( not ( = ?auto_755113 ?auto_755116 ) ) ( not ( = ?auto_755113 ?auto_755117 ) ) ( not ( = ?auto_755114 ?auto_755115 ) ) ( not ( = ?auto_755114 ?auto_755116 ) ) ( not ( = ?auto_755114 ?auto_755117 ) ) ( not ( = ?auto_755115 ?auto_755116 ) ) ( not ( = ?auto_755115 ?auto_755117 ) ) ( not ( = ?auto_755116 ?auto_755117 ) ) ( ON ?auto_755115 ?auto_755116 ) ( ON ?auto_755114 ?auto_755115 ) ( ON ?auto_755113 ?auto_755114 ) ( ON ?auto_755112 ?auto_755113 ) ( CLEAR ?auto_755110 ) ( ON ?auto_755111 ?auto_755112 ) ( CLEAR ?auto_755111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_755100 ?auto_755101 ?auto_755102 ?auto_755103 ?auto_755104 ?auto_755105 ?auto_755106 ?auto_755107 ?auto_755108 ?auto_755109 ?auto_755110 ?auto_755111 )
      ( MAKE-17PILE ?auto_755100 ?auto_755101 ?auto_755102 ?auto_755103 ?auto_755104 ?auto_755105 ?auto_755106 ?auto_755107 ?auto_755108 ?auto_755109 ?auto_755110 ?auto_755111 ?auto_755112 ?auto_755113 ?auto_755114 ?auto_755115 ?auto_755116 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755170 - BLOCK
      ?auto_755171 - BLOCK
      ?auto_755172 - BLOCK
      ?auto_755173 - BLOCK
      ?auto_755174 - BLOCK
      ?auto_755175 - BLOCK
      ?auto_755176 - BLOCK
      ?auto_755177 - BLOCK
      ?auto_755178 - BLOCK
      ?auto_755179 - BLOCK
      ?auto_755180 - BLOCK
      ?auto_755181 - BLOCK
      ?auto_755182 - BLOCK
      ?auto_755183 - BLOCK
      ?auto_755184 - BLOCK
      ?auto_755185 - BLOCK
      ?auto_755186 - BLOCK
    )
    :vars
    (
      ?auto_755187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755186 ?auto_755187 ) ( ON-TABLE ?auto_755170 ) ( ON ?auto_755171 ?auto_755170 ) ( ON ?auto_755172 ?auto_755171 ) ( ON ?auto_755173 ?auto_755172 ) ( ON ?auto_755174 ?auto_755173 ) ( ON ?auto_755175 ?auto_755174 ) ( ON ?auto_755176 ?auto_755175 ) ( ON ?auto_755177 ?auto_755176 ) ( ON ?auto_755178 ?auto_755177 ) ( ON ?auto_755179 ?auto_755178 ) ( not ( = ?auto_755170 ?auto_755171 ) ) ( not ( = ?auto_755170 ?auto_755172 ) ) ( not ( = ?auto_755170 ?auto_755173 ) ) ( not ( = ?auto_755170 ?auto_755174 ) ) ( not ( = ?auto_755170 ?auto_755175 ) ) ( not ( = ?auto_755170 ?auto_755176 ) ) ( not ( = ?auto_755170 ?auto_755177 ) ) ( not ( = ?auto_755170 ?auto_755178 ) ) ( not ( = ?auto_755170 ?auto_755179 ) ) ( not ( = ?auto_755170 ?auto_755180 ) ) ( not ( = ?auto_755170 ?auto_755181 ) ) ( not ( = ?auto_755170 ?auto_755182 ) ) ( not ( = ?auto_755170 ?auto_755183 ) ) ( not ( = ?auto_755170 ?auto_755184 ) ) ( not ( = ?auto_755170 ?auto_755185 ) ) ( not ( = ?auto_755170 ?auto_755186 ) ) ( not ( = ?auto_755170 ?auto_755187 ) ) ( not ( = ?auto_755171 ?auto_755172 ) ) ( not ( = ?auto_755171 ?auto_755173 ) ) ( not ( = ?auto_755171 ?auto_755174 ) ) ( not ( = ?auto_755171 ?auto_755175 ) ) ( not ( = ?auto_755171 ?auto_755176 ) ) ( not ( = ?auto_755171 ?auto_755177 ) ) ( not ( = ?auto_755171 ?auto_755178 ) ) ( not ( = ?auto_755171 ?auto_755179 ) ) ( not ( = ?auto_755171 ?auto_755180 ) ) ( not ( = ?auto_755171 ?auto_755181 ) ) ( not ( = ?auto_755171 ?auto_755182 ) ) ( not ( = ?auto_755171 ?auto_755183 ) ) ( not ( = ?auto_755171 ?auto_755184 ) ) ( not ( = ?auto_755171 ?auto_755185 ) ) ( not ( = ?auto_755171 ?auto_755186 ) ) ( not ( = ?auto_755171 ?auto_755187 ) ) ( not ( = ?auto_755172 ?auto_755173 ) ) ( not ( = ?auto_755172 ?auto_755174 ) ) ( not ( = ?auto_755172 ?auto_755175 ) ) ( not ( = ?auto_755172 ?auto_755176 ) ) ( not ( = ?auto_755172 ?auto_755177 ) ) ( not ( = ?auto_755172 ?auto_755178 ) ) ( not ( = ?auto_755172 ?auto_755179 ) ) ( not ( = ?auto_755172 ?auto_755180 ) ) ( not ( = ?auto_755172 ?auto_755181 ) ) ( not ( = ?auto_755172 ?auto_755182 ) ) ( not ( = ?auto_755172 ?auto_755183 ) ) ( not ( = ?auto_755172 ?auto_755184 ) ) ( not ( = ?auto_755172 ?auto_755185 ) ) ( not ( = ?auto_755172 ?auto_755186 ) ) ( not ( = ?auto_755172 ?auto_755187 ) ) ( not ( = ?auto_755173 ?auto_755174 ) ) ( not ( = ?auto_755173 ?auto_755175 ) ) ( not ( = ?auto_755173 ?auto_755176 ) ) ( not ( = ?auto_755173 ?auto_755177 ) ) ( not ( = ?auto_755173 ?auto_755178 ) ) ( not ( = ?auto_755173 ?auto_755179 ) ) ( not ( = ?auto_755173 ?auto_755180 ) ) ( not ( = ?auto_755173 ?auto_755181 ) ) ( not ( = ?auto_755173 ?auto_755182 ) ) ( not ( = ?auto_755173 ?auto_755183 ) ) ( not ( = ?auto_755173 ?auto_755184 ) ) ( not ( = ?auto_755173 ?auto_755185 ) ) ( not ( = ?auto_755173 ?auto_755186 ) ) ( not ( = ?auto_755173 ?auto_755187 ) ) ( not ( = ?auto_755174 ?auto_755175 ) ) ( not ( = ?auto_755174 ?auto_755176 ) ) ( not ( = ?auto_755174 ?auto_755177 ) ) ( not ( = ?auto_755174 ?auto_755178 ) ) ( not ( = ?auto_755174 ?auto_755179 ) ) ( not ( = ?auto_755174 ?auto_755180 ) ) ( not ( = ?auto_755174 ?auto_755181 ) ) ( not ( = ?auto_755174 ?auto_755182 ) ) ( not ( = ?auto_755174 ?auto_755183 ) ) ( not ( = ?auto_755174 ?auto_755184 ) ) ( not ( = ?auto_755174 ?auto_755185 ) ) ( not ( = ?auto_755174 ?auto_755186 ) ) ( not ( = ?auto_755174 ?auto_755187 ) ) ( not ( = ?auto_755175 ?auto_755176 ) ) ( not ( = ?auto_755175 ?auto_755177 ) ) ( not ( = ?auto_755175 ?auto_755178 ) ) ( not ( = ?auto_755175 ?auto_755179 ) ) ( not ( = ?auto_755175 ?auto_755180 ) ) ( not ( = ?auto_755175 ?auto_755181 ) ) ( not ( = ?auto_755175 ?auto_755182 ) ) ( not ( = ?auto_755175 ?auto_755183 ) ) ( not ( = ?auto_755175 ?auto_755184 ) ) ( not ( = ?auto_755175 ?auto_755185 ) ) ( not ( = ?auto_755175 ?auto_755186 ) ) ( not ( = ?auto_755175 ?auto_755187 ) ) ( not ( = ?auto_755176 ?auto_755177 ) ) ( not ( = ?auto_755176 ?auto_755178 ) ) ( not ( = ?auto_755176 ?auto_755179 ) ) ( not ( = ?auto_755176 ?auto_755180 ) ) ( not ( = ?auto_755176 ?auto_755181 ) ) ( not ( = ?auto_755176 ?auto_755182 ) ) ( not ( = ?auto_755176 ?auto_755183 ) ) ( not ( = ?auto_755176 ?auto_755184 ) ) ( not ( = ?auto_755176 ?auto_755185 ) ) ( not ( = ?auto_755176 ?auto_755186 ) ) ( not ( = ?auto_755176 ?auto_755187 ) ) ( not ( = ?auto_755177 ?auto_755178 ) ) ( not ( = ?auto_755177 ?auto_755179 ) ) ( not ( = ?auto_755177 ?auto_755180 ) ) ( not ( = ?auto_755177 ?auto_755181 ) ) ( not ( = ?auto_755177 ?auto_755182 ) ) ( not ( = ?auto_755177 ?auto_755183 ) ) ( not ( = ?auto_755177 ?auto_755184 ) ) ( not ( = ?auto_755177 ?auto_755185 ) ) ( not ( = ?auto_755177 ?auto_755186 ) ) ( not ( = ?auto_755177 ?auto_755187 ) ) ( not ( = ?auto_755178 ?auto_755179 ) ) ( not ( = ?auto_755178 ?auto_755180 ) ) ( not ( = ?auto_755178 ?auto_755181 ) ) ( not ( = ?auto_755178 ?auto_755182 ) ) ( not ( = ?auto_755178 ?auto_755183 ) ) ( not ( = ?auto_755178 ?auto_755184 ) ) ( not ( = ?auto_755178 ?auto_755185 ) ) ( not ( = ?auto_755178 ?auto_755186 ) ) ( not ( = ?auto_755178 ?auto_755187 ) ) ( not ( = ?auto_755179 ?auto_755180 ) ) ( not ( = ?auto_755179 ?auto_755181 ) ) ( not ( = ?auto_755179 ?auto_755182 ) ) ( not ( = ?auto_755179 ?auto_755183 ) ) ( not ( = ?auto_755179 ?auto_755184 ) ) ( not ( = ?auto_755179 ?auto_755185 ) ) ( not ( = ?auto_755179 ?auto_755186 ) ) ( not ( = ?auto_755179 ?auto_755187 ) ) ( not ( = ?auto_755180 ?auto_755181 ) ) ( not ( = ?auto_755180 ?auto_755182 ) ) ( not ( = ?auto_755180 ?auto_755183 ) ) ( not ( = ?auto_755180 ?auto_755184 ) ) ( not ( = ?auto_755180 ?auto_755185 ) ) ( not ( = ?auto_755180 ?auto_755186 ) ) ( not ( = ?auto_755180 ?auto_755187 ) ) ( not ( = ?auto_755181 ?auto_755182 ) ) ( not ( = ?auto_755181 ?auto_755183 ) ) ( not ( = ?auto_755181 ?auto_755184 ) ) ( not ( = ?auto_755181 ?auto_755185 ) ) ( not ( = ?auto_755181 ?auto_755186 ) ) ( not ( = ?auto_755181 ?auto_755187 ) ) ( not ( = ?auto_755182 ?auto_755183 ) ) ( not ( = ?auto_755182 ?auto_755184 ) ) ( not ( = ?auto_755182 ?auto_755185 ) ) ( not ( = ?auto_755182 ?auto_755186 ) ) ( not ( = ?auto_755182 ?auto_755187 ) ) ( not ( = ?auto_755183 ?auto_755184 ) ) ( not ( = ?auto_755183 ?auto_755185 ) ) ( not ( = ?auto_755183 ?auto_755186 ) ) ( not ( = ?auto_755183 ?auto_755187 ) ) ( not ( = ?auto_755184 ?auto_755185 ) ) ( not ( = ?auto_755184 ?auto_755186 ) ) ( not ( = ?auto_755184 ?auto_755187 ) ) ( not ( = ?auto_755185 ?auto_755186 ) ) ( not ( = ?auto_755185 ?auto_755187 ) ) ( not ( = ?auto_755186 ?auto_755187 ) ) ( ON ?auto_755185 ?auto_755186 ) ( ON ?auto_755184 ?auto_755185 ) ( ON ?auto_755183 ?auto_755184 ) ( ON ?auto_755182 ?auto_755183 ) ( ON ?auto_755181 ?auto_755182 ) ( CLEAR ?auto_755179 ) ( ON ?auto_755180 ?auto_755181 ) ( CLEAR ?auto_755180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_755170 ?auto_755171 ?auto_755172 ?auto_755173 ?auto_755174 ?auto_755175 ?auto_755176 ?auto_755177 ?auto_755178 ?auto_755179 ?auto_755180 )
      ( MAKE-17PILE ?auto_755170 ?auto_755171 ?auto_755172 ?auto_755173 ?auto_755174 ?auto_755175 ?auto_755176 ?auto_755177 ?auto_755178 ?auto_755179 ?auto_755180 ?auto_755181 ?auto_755182 ?auto_755183 ?auto_755184 ?auto_755185 ?auto_755186 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755240 - BLOCK
      ?auto_755241 - BLOCK
      ?auto_755242 - BLOCK
      ?auto_755243 - BLOCK
      ?auto_755244 - BLOCK
      ?auto_755245 - BLOCK
      ?auto_755246 - BLOCK
      ?auto_755247 - BLOCK
      ?auto_755248 - BLOCK
      ?auto_755249 - BLOCK
      ?auto_755250 - BLOCK
      ?auto_755251 - BLOCK
      ?auto_755252 - BLOCK
      ?auto_755253 - BLOCK
      ?auto_755254 - BLOCK
      ?auto_755255 - BLOCK
      ?auto_755256 - BLOCK
    )
    :vars
    (
      ?auto_755257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755256 ?auto_755257 ) ( ON-TABLE ?auto_755240 ) ( ON ?auto_755241 ?auto_755240 ) ( ON ?auto_755242 ?auto_755241 ) ( ON ?auto_755243 ?auto_755242 ) ( ON ?auto_755244 ?auto_755243 ) ( ON ?auto_755245 ?auto_755244 ) ( ON ?auto_755246 ?auto_755245 ) ( ON ?auto_755247 ?auto_755246 ) ( ON ?auto_755248 ?auto_755247 ) ( not ( = ?auto_755240 ?auto_755241 ) ) ( not ( = ?auto_755240 ?auto_755242 ) ) ( not ( = ?auto_755240 ?auto_755243 ) ) ( not ( = ?auto_755240 ?auto_755244 ) ) ( not ( = ?auto_755240 ?auto_755245 ) ) ( not ( = ?auto_755240 ?auto_755246 ) ) ( not ( = ?auto_755240 ?auto_755247 ) ) ( not ( = ?auto_755240 ?auto_755248 ) ) ( not ( = ?auto_755240 ?auto_755249 ) ) ( not ( = ?auto_755240 ?auto_755250 ) ) ( not ( = ?auto_755240 ?auto_755251 ) ) ( not ( = ?auto_755240 ?auto_755252 ) ) ( not ( = ?auto_755240 ?auto_755253 ) ) ( not ( = ?auto_755240 ?auto_755254 ) ) ( not ( = ?auto_755240 ?auto_755255 ) ) ( not ( = ?auto_755240 ?auto_755256 ) ) ( not ( = ?auto_755240 ?auto_755257 ) ) ( not ( = ?auto_755241 ?auto_755242 ) ) ( not ( = ?auto_755241 ?auto_755243 ) ) ( not ( = ?auto_755241 ?auto_755244 ) ) ( not ( = ?auto_755241 ?auto_755245 ) ) ( not ( = ?auto_755241 ?auto_755246 ) ) ( not ( = ?auto_755241 ?auto_755247 ) ) ( not ( = ?auto_755241 ?auto_755248 ) ) ( not ( = ?auto_755241 ?auto_755249 ) ) ( not ( = ?auto_755241 ?auto_755250 ) ) ( not ( = ?auto_755241 ?auto_755251 ) ) ( not ( = ?auto_755241 ?auto_755252 ) ) ( not ( = ?auto_755241 ?auto_755253 ) ) ( not ( = ?auto_755241 ?auto_755254 ) ) ( not ( = ?auto_755241 ?auto_755255 ) ) ( not ( = ?auto_755241 ?auto_755256 ) ) ( not ( = ?auto_755241 ?auto_755257 ) ) ( not ( = ?auto_755242 ?auto_755243 ) ) ( not ( = ?auto_755242 ?auto_755244 ) ) ( not ( = ?auto_755242 ?auto_755245 ) ) ( not ( = ?auto_755242 ?auto_755246 ) ) ( not ( = ?auto_755242 ?auto_755247 ) ) ( not ( = ?auto_755242 ?auto_755248 ) ) ( not ( = ?auto_755242 ?auto_755249 ) ) ( not ( = ?auto_755242 ?auto_755250 ) ) ( not ( = ?auto_755242 ?auto_755251 ) ) ( not ( = ?auto_755242 ?auto_755252 ) ) ( not ( = ?auto_755242 ?auto_755253 ) ) ( not ( = ?auto_755242 ?auto_755254 ) ) ( not ( = ?auto_755242 ?auto_755255 ) ) ( not ( = ?auto_755242 ?auto_755256 ) ) ( not ( = ?auto_755242 ?auto_755257 ) ) ( not ( = ?auto_755243 ?auto_755244 ) ) ( not ( = ?auto_755243 ?auto_755245 ) ) ( not ( = ?auto_755243 ?auto_755246 ) ) ( not ( = ?auto_755243 ?auto_755247 ) ) ( not ( = ?auto_755243 ?auto_755248 ) ) ( not ( = ?auto_755243 ?auto_755249 ) ) ( not ( = ?auto_755243 ?auto_755250 ) ) ( not ( = ?auto_755243 ?auto_755251 ) ) ( not ( = ?auto_755243 ?auto_755252 ) ) ( not ( = ?auto_755243 ?auto_755253 ) ) ( not ( = ?auto_755243 ?auto_755254 ) ) ( not ( = ?auto_755243 ?auto_755255 ) ) ( not ( = ?auto_755243 ?auto_755256 ) ) ( not ( = ?auto_755243 ?auto_755257 ) ) ( not ( = ?auto_755244 ?auto_755245 ) ) ( not ( = ?auto_755244 ?auto_755246 ) ) ( not ( = ?auto_755244 ?auto_755247 ) ) ( not ( = ?auto_755244 ?auto_755248 ) ) ( not ( = ?auto_755244 ?auto_755249 ) ) ( not ( = ?auto_755244 ?auto_755250 ) ) ( not ( = ?auto_755244 ?auto_755251 ) ) ( not ( = ?auto_755244 ?auto_755252 ) ) ( not ( = ?auto_755244 ?auto_755253 ) ) ( not ( = ?auto_755244 ?auto_755254 ) ) ( not ( = ?auto_755244 ?auto_755255 ) ) ( not ( = ?auto_755244 ?auto_755256 ) ) ( not ( = ?auto_755244 ?auto_755257 ) ) ( not ( = ?auto_755245 ?auto_755246 ) ) ( not ( = ?auto_755245 ?auto_755247 ) ) ( not ( = ?auto_755245 ?auto_755248 ) ) ( not ( = ?auto_755245 ?auto_755249 ) ) ( not ( = ?auto_755245 ?auto_755250 ) ) ( not ( = ?auto_755245 ?auto_755251 ) ) ( not ( = ?auto_755245 ?auto_755252 ) ) ( not ( = ?auto_755245 ?auto_755253 ) ) ( not ( = ?auto_755245 ?auto_755254 ) ) ( not ( = ?auto_755245 ?auto_755255 ) ) ( not ( = ?auto_755245 ?auto_755256 ) ) ( not ( = ?auto_755245 ?auto_755257 ) ) ( not ( = ?auto_755246 ?auto_755247 ) ) ( not ( = ?auto_755246 ?auto_755248 ) ) ( not ( = ?auto_755246 ?auto_755249 ) ) ( not ( = ?auto_755246 ?auto_755250 ) ) ( not ( = ?auto_755246 ?auto_755251 ) ) ( not ( = ?auto_755246 ?auto_755252 ) ) ( not ( = ?auto_755246 ?auto_755253 ) ) ( not ( = ?auto_755246 ?auto_755254 ) ) ( not ( = ?auto_755246 ?auto_755255 ) ) ( not ( = ?auto_755246 ?auto_755256 ) ) ( not ( = ?auto_755246 ?auto_755257 ) ) ( not ( = ?auto_755247 ?auto_755248 ) ) ( not ( = ?auto_755247 ?auto_755249 ) ) ( not ( = ?auto_755247 ?auto_755250 ) ) ( not ( = ?auto_755247 ?auto_755251 ) ) ( not ( = ?auto_755247 ?auto_755252 ) ) ( not ( = ?auto_755247 ?auto_755253 ) ) ( not ( = ?auto_755247 ?auto_755254 ) ) ( not ( = ?auto_755247 ?auto_755255 ) ) ( not ( = ?auto_755247 ?auto_755256 ) ) ( not ( = ?auto_755247 ?auto_755257 ) ) ( not ( = ?auto_755248 ?auto_755249 ) ) ( not ( = ?auto_755248 ?auto_755250 ) ) ( not ( = ?auto_755248 ?auto_755251 ) ) ( not ( = ?auto_755248 ?auto_755252 ) ) ( not ( = ?auto_755248 ?auto_755253 ) ) ( not ( = ?auto_755248 ?auto_755254 ) ) ( not ( = ?auto_755248 ?auto_755255 ) ) ( not ( = ?auto_755248 ?auto_755256 ) ) ( not ( = ?auto_755248 ?auto_755257 ) ) ( not ( = ?auto_755249 ?auto_755250 ) ) ( not ( = ?auto_755249 ?auto_755251 ) ) ( not ( = ?auto_755249 ?auto_755252 ) ) ( not ( = ?auto_755249 ?auto_755253 ) ) ( not ( = ?auto_755249 ?auto_755254 ) ) ( not ( = ?auto_755249 ?auto_755255 ) ) ( not ( = ?auto_755249 ?auto_755256 ) ) ( not ( = ?auto_755249 ?auto_755257 ) ) ( not ( = ?auto_755250 ?auto_755251 ) ) ( not ( = ?auto_755250 ?auto_755252 ) ) ( not ( = ?auto_755250 ?auto_755253 ) ) ( not ( = ?auto_755250 ?auto_755254 ) ) ( not ( = ?auto_755250 ?auto_755255 ) ) ( not ( = ?auto_755250 ?auto_755256 ) ) ( not ( = ?auto_755250 ?auto_755257 ) ) ( not ( = ?auto_755251 ?auto_755252 ) ) ( not ( = ?auto_755251 ?auto_755253 ) ) ( not ( = ?auto_755251 ?auto_755254 ) ) ( not ( = ?auto_755251 ?auto_755255 ) ) ( not ( = ?auto_755251 ?auto_755256 ) ) ( not ( = ?auto_755251 ?auto_755257 ) ) ( not ( = ?auto_755252 ?auto_755253 ) ) ( not ( = ?auto_755252 ?auto_755254 ) ) ( not ( = ?auto_755252 ?auto_755255 ) ) ( not ( = ?auto_755252 ?auto_755256 ) ) ( not ( = ?auto_755252 ?auto_755257 ) ) ( not ( = ?auto_755253 ?auto_755254 ) ) ( not ( = ?auto_755253 ?auto_755255 ) ) ( not ( = ?auto_755253 ?auto_755256 ) ) ( not ( = ?auto_755253 ?auto_755257 ) ) ( not ( = ?auto_755254 ?auto_755255 ) ) ( not ( = ?auto_755254 ?auto_755256 ) ) ( not ( = ?auto_755254 ?auto_755257 ) ) ( not ( = ?auto_755255 ?auto_755256 ) ) ( not ( = ?auto_755255 ?auto_755257 ) ) ( not ( = ?auto_755256 ?auto_755257 ) ) ( ON ?auto_755255 ?auto_755256 ) ( ON ?auto_755254 ?auto_755255 ) ( ON ?auto_755253 ?auto_755254 ) ( ON ?auto_755252 ?auto_755253 ) ( ON ?auto_755251 ?auto_755252 ) ( ON ?auto_755250 ?auto_755251 ) ( CLEAR ?auto_755248 ) ( ON ?auto_755249 ?auto_755250 ) ( CLEAR ?auto_755249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_755240 ?auto_755241 ?auto_755242 ?auto_755243 ?auto_755244 ?auto_755245 ?auto_755246 ?auto_755247 ?auto_755248 ?auto_755249 )
      ( MAKE-17PILE ?auto_755240 ?auto_755241 ?auto_755242 ?auto_755243 ?auto_755244 ?auto_755245 ?auto_755246 ?auto_755247 ?auto_755248 ?auto_755249 ?auto_755250 ?auto_755251 ?auto_755252 ?auto_755253 ?auto_755254 ?auto_755255 ?auto_755256 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755310 - BLOCK
      ?auto_755311 - BLOCK
      ?auto_755312 - BLOCK
      ?auto_755313 - BLOCK
      ?auto_755314 - BLOCK
      ?auto_755315 - BLOCK
      ?auto_755316 - BLOCK
      ?auto_755317 - BLOCK
      ?auto_755318 - BLOCK
      ?auto_755319 - BLOCK
      ?auto_755320 - BLOCK
      ?auto_755321 - BLOCK
      ?auto_755322 - BLOCK
      ?auto_755323 - BLOCK
      ?auto_755324 - BLOCK
      ?auto_755325 - BLOCK
      ?auto_755326 - BLOCK
    )
    :vars
    (
      ?auto_755327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755326 ?auto_755327 ) ( ON-TABLE ?auto_755310 ) ( ON ?auto_755311 ?auto_755310 ) ( ON ?auto_755312 ?auto_755311 ) ( ON ?auto_755313 ?auto_755312 ) ( ON ?auto_755314 ?auto_755313 ) ( ON ?auto_755315 ?auto_755314 ) ( ON ?auto_755316 ?auto_755315 ) ( ON ?auto_755317 ?auto_755316 ) ( not ( = ?auto_755310 ?auto_755311 ) ) ( not ( = ?auto_755310 ?auto_755312 ) ) ( not ( = ?auto_755310 ?auto_755313 ) ) ( not ( = ?auto_755310 ?auto_755314 ) ) ( not ( = ?auto_755310 ?auto_755315 ) ) ( not ( = ?auto_755310 ?auto_755316 ) ) ( not ( = ?auto_755310 ?auto_755317 ) ) ( not ( = ?auto_755310 ?auto_755318 ) ) ( not ( = ?auto_755310 ?auto_755319 ) ) ( not ( = ?auto_755310 ?auto_755320 ) ) ( not ( = ?auto_755310 ?auto_755321 ) ) ( not ( = ?auto_755310 ?auto_755322 ) ) ( not ( = ?auto_755310 ?auto_755323 ) ) ( not ( = ?auto_755310 ?auto_755324 ) ) ( not ( = ?auto_755310 ?auto_755325 ) ) ( not ( = ?auto_755310 ?auto_755326 ) ) ( not ( = ?auto_755310 ?auto_755327 ) ) ( not ( = ?auto_755311 ?auto_755312 ) ) ( not ( = ?auto_755311 ?auto_755313 ) ) ( not ( = ?auto_755311 ?auto_755314 ) ) ( not ( = ?auto_755311 ?auto_755315 ) ) ( not ( = ?auto_755311 ?auto_755316 ) ) ( not ( = ?auto_755311 ?auto_755317 ) ) ( not ( = ?auto_755311 ?auto_755318 ) ) ( not ( = ?auto_755311 ?auto_755319 ) ) ( not ( = ?auto_755311 ?auto_755320 ) ) ( not ( = ?auto_755311 ?auto_755321 ) ) ( not ( = ?auto_755311 ?auto_755322 ) ) ( not ( = ?auto_755311 ?auto_755323 ) ) ( not ( = ?auto_755311 ?auto_755324 ) ) ( not ( = ?auto_755311 ?auto_755325 ) ) ( not ( = ?auto_755311 ?auto_755326 ) ) ( not ( = ?auto_755311 ?auto_755327 ) ) ( not ( = ?auto_755312 ?auto_755313 ) ) ( not ( = ?auto_755312 ?auto_755314 ) ) ( not ( = ?auto_755312 ?auto_755315 ) ) ( not ( = ?auto_755312 ?auto_755316 ) ) ( not ( = ?auto_755312 ?auto_755317 ) ) ( not ( = ?auto_755312 ?auto_755318 ) ) ( not ( = ?auto_755312 ?auto_755319 ) ) ( not ( = ?auto_755312 ?auto_755320 ) ) ( not ( = ?auto_755312 ?auto_755321 ) ) ( not ( = ?auto_755312 ?auto_755322 ) ) ( not ( = ?auto_755312 ?auto_755323 ) ) ( not ( = ?auto_755312 ?auto_755324 ) ) ( not ( = ?auto_755312 ?auto_755325 ) ) ( not ( = ?auto_755312 ?auto_755326 ) ) ( not ( = ?auto_755312 ?auto_755327 ) ) ( not ( = ?auto_755313 ?auto_755314 ) ) ( not ( = ?auto_755313 ?auto_755315 ) ) ( not ( = ?auto_755313 ?auto_755316 ) ) ( not ( = ?auto_755313 ?auto_755317 ) ) ( not ( = ?auto_755313 ?auto_755318 ) ) ( not ( = ?auto_755313 ?auto_755319 ) ) ( not ( = ?auto_755313 ?auto_755320 ) ) ( not ( = ?auto_755313 ?auto_755321 ) ) ( not ( = ?auto_755313 ?auto_755322 ) ) ( not ( = ?auto_755313 ?auto_755323 ) ) ( not ( = ?auto_755313 ?auto_755324 ) ) ( not ( = ?auto_755313 ?auto_755325 ) ) ( not ( = ?auto_755313 ?auto_755326 ) ) ( not ( = ?auto_755313 ?auto_755327 ) ) ( not ( = ?auto_755314 ?auto_755315 ) ) ( not ( = ?auto_755314 ?auto_755316 ) ) ( not ( = ?auto_755314 ?auto_755317 ) ) ( not ( = ?auto_755314 ?auto_755318 ) ) ( not ( = ?auto_755314 ?auto_755319 ) ) ( not ( = ?auto_755314 ?auto_755320 ) ) ( not ( = ?auto_755314 ?auto_755321 ) ) ( not ( = ?auto_755314 ?auto_755322 ) ) ( not ( = ?auto_755314 ?auto_755323 ) ) ( not ( = ?auto_755314 ?auto_755324 ) ) ( not ( = ?auto_755314 ?auto_755325 ) ) ( not ( = ?auto_755314 ?auto_755326 ) ) ( not ( = ?auto_755314 ?auto_755327 ) ) ( not ( = ?auto_755315 ?auto_755316 ) ) ( not ( = ?auto_755315 ?auto_755317 ) ) ( not ( = ?auto_755315 ?auto_755318 ) ) ( not ( = ?auto_755315 ?auto_755319 ) ) ( not ( = ?auto_755315 ?auto_755320 ) ) ( not ( = ?auto_755315 ?auto_755321 ) ) ( not ( = ?auto_755315 ?auto_755322 ) ) ( not ( = ?auto_755315 ?auto_755323 ) ) ( not ( = ?auto_755315 ?auto_755324 ) ) ( not ( = ?auto_755315 ?auto_755325 ) ) ( not ( = ?auto_755315 ?auto_755326 ) ) ( not ( = ?auto_755315 ?auto_755327 ) ) ( not ( = ?auto_755316 ?auto_755317 ) ) ( not ( = ?auto_755316 ?auto_755318 ) ) ( not ( = ?auto_755316 ?auto_755319 ) ) ( not ( = ?auto_755316 ?auto_755320 ) ) ( not ( = ?auto_755316 ?auto_755321 ) ) ( not ( = ?auto_755316 ?auto_755322 ) ) ( not ( = ?auto_755316 ?auto_755323 ) ) ( not ( = ?auto_755316 ?auto_755324 ) ) ( not ( = ?auto_755316 ?auto_755325 ) ) ( not ( = ?auto_755316 ?auto_755326 ) ) ( not ( = ?auto_755316 ?auto_755327 ) ) ( not ( = ?auto_755317 ?auto_755318 ) ) ( not ( = ?auto_755317 ?auto_755319 ) ) ( not ( = ?auto_755317 ?auto_755320 ) ) ( not ( = ?auto_755317 ?auto_755321 ) ) ( not ( = ?auto_755317 ?auto_755322 ) ) ( not ( = ?auto_755317 ?auto_755323 ) ) ( not ( = ?auto_755317 ?auto_755324 ) ) ( not ( = ?auto_755317 ?auto_755325 ) ) ( not ( = ?auto_755317 ?auto_755326 ) ) ( not ( = ?auto_755317 ?auto_755327 ) ) ( not ( = ?auto_755318 ?auto_755319 ) ) ( not ( = ?auto_755318 ?auto_755320 ) ) ( not ( = ?auto_755318 ?auto_755321 ) ) ( not ( = ?auto_755318 ?auto_755322 ) ) ( not ( = ?auto_755318 ?auto_755323 ) ) ( not ( = ?auto_755318 ?auto_755324 ) ) ( not ( = ?auto_755318 ?auto_755325 ) ) ( not ( = ?auto_755318 ?auto_755326 ) ) ( not ( = ?auto_755318 ?auto_755327 ) ) ( not ( = ?auto_755319 ?auto_755320 ) ) ( not ( = ?auto_755319 ?auto_755321 ) ) ( not ( = ?auto_755319 ?auto_755322 ) ) ( not ( = ?auto_755319 ?auto_755323 ) ) ( not ( = ?auto_755319 ?auto_755324 ) ) ( not ( = ?auto_755319 ?auto_755325 ) ) ( not ( = ?auto_755319 ?auto_755326 ) ) ( not ( = ?auto_755319 ?auto_755327 ) ) ( not ( = ?auto_755320 ?auto_755321 ) ) ( not ( = ?auto_755320 ?auto_755322 ) ) ( not ( = ?auto_755320 ?auto_755323 ) ) ( not ( = ?auto_755320 ?auto_755324 ) ) ( not ( = ?auto_755320 ?auto_755325 ) ) ( not ( = ?auto_755320 ?auto_755326 ) ) ( not ( = ?auto_755320 ?auto_755327 ) ) ( not ( = ?auto_755321 ?auto_755322 ) ) ( not ( = ?auto_755321 ?auto_755323 ) ) ( not ( = ?auto_755321 ?auto_755324 ) ) ( not ( = ?auto_755321 ?auto_755325 ) ) ( not ( = ?auto_755321 ?auto_755326 ) ) ( not ( = ?auto_755321 ?auto_755327 ) ) ( not ( = ?auto_755322 ?auto_755323 ) ) ( not ( = ?auto_755322 ?auto_755324 ) ) ( not ( = ?auto_755322 ?auto_755325 ) ) ( not ( = ?auto_755322 ?auto_755326 ) ) ( not ( = ?auto_755322 ?auto_755327 ) ) ( not ( = ?auto_755323 ?auto_755324 ) ) ( not ( = ?auto_755323 ?auto_755325 ) ) ( not ( = ?auto_755323 ?auto_755326 ) ) ( not ( = ?auto_755323 ?auto_755327 ) ) ( not ( = ?auto_755324 ?auto_755325 ) ) ( not ( = ?auto_755324 ?auto_755326 ) ) ( not ( = ?auto_755324 ?auto_755327 ) ) ( not ( = ?auto_755325 ?auto_755326 ) ) ( not ( = ?auto_755325 ?auto_755327 ) ) ( not ( = ?auto_755326 ?auto_755327 ) ) ( ON ?auto_755325 ?auto_755326 ) ( ON ?auto_755324 ?auto_755325 ) ( ON ?auto_755323 ?auto_755324 ) ( ON ?auto_755322 ?auto_755323 ) ( ON ?auto_755321 ?auto_755322 ) ( ON ?auto_755320 ?auto_755321 ) ( ON ?auto_755319 ?auto_755320 ) ( CLEAR ?auto_755317 ) ( ON ?auto_755318 ?auto_755319 ) ( CLEAR ?auto_755318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_755310 ?auto_755311 ?auto_755312 ?auto_755313 ?auto_755314 ?auto_755315 ?auto_755316 ?auto_755317 ?auto_755318 )
      ( MAKE-17PILE ?auto_755310 ?auto_755311 ?auto_755312 ?auto_755313 ?auto_755314 ?auto_755315 ?auto_755316 ?auto_755317 ?auto_755318 ?auto_755319 ?auto_755320 ?auto_755321 ?auto_755322 ?auto_755323 ?auto_755324 ?auto_755325 ?auto_755326 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755380 - BLOCK
      ?auto_755381 - BLOCK
      ?auto_755382 - BLOCK
      ?auto_755383 - BLOCK
      ?auto_755384 - BLOCK
      ?auto_755385 - BLOCK
      ?auto_755386 - BLOCK
      ?auto_755387 - BLOCK
      ?auto_755388 - BLOCK
      ?auto_755389 - BLOCK
      ?auto_755390 - BLOCK
      ?auto_755391 - BLOCK
      ?auto_755392 - BLOCK
      ?auto_755393 - BLOCK
      ?auto_755394 - BLOCK
      ?auto_755395 - BLOCK
      ?auto_755396 - BLOCK
    )
    :vars
    (
      ?auto_755397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755396 ?auto_755397 ) ( ON-TABLE ?auto_755380 ) ( ON ?auto_755381 ?auto_755380 ) ( ON ?auto_755382 ?auto_755381 ) ( ON ?auto_755383 ?auto_755382 ) ( ON ?auto_755384 ?auto_755383 ) ( ON ?auto_755385 ?auto_755384 ) ( ON ?auto_755386 ?auto_755385 ) ( not ( = ?auto_755380 ?auto_755381 ) ) ( not ( = ?auto_755380 ?auto_755382 ) ) ( not ( = ?auto_755380 ?auto_755383 ) ) ( not ( = ?auto_755380 ?auto_755384 ) ) ( not ( = ?auto_755380 ?auto_755385 ) ) ( not ( = ?auto_755380 ?auto_755386 ) ) ( not ( = ?auto_755380 ?auto_755387 ) ) ( not ( = ?auto_755380 ?auto_755388 ) ) ( not ( = ?auto_755380 ?auto_755389 ) ) ( not ( = ?auto_755380 ?auto_755390 ) ) ( not ( = ?auto_755380 ?auto_755391 ) ) ( not ( = ?auto_755380 ?auto_755392 ) ) ( not ( = ?auto_755380 ?auto_755393 ) ) ( not ( = ?auto_755380 ?auto_755394 ) ) ( not ( = ?auto_755380 ?auto_755395 ) ) ( not ( = ?auto_755380 ?auto_755396 ) ) ( not ( = ?auto_755380 ?auto_755397 ) ) ( not ( = ?auto_755381 ?auto_755382 ) ) ( not ( = ?auto_755381 ?auto_755383 ) ) ( not ( = ?auto_755381 ?auto_755384 ) ) ( not ( = ?auto_755381 ?auto_755385 ) ) ( not ( = ?auto_755381 ?auto_755386 ) ) ( not ( = ?auto_755381 ?auto_755387 ) ) ( not ( = ?auto_755381 ?auto_755388 ) ) ( not ( = ?auto_755381 ?auto_755389 ) ) ( not ( = ?auto_755381 ?auto_755390 ) ) ( not ( = ?auto_755381 ?auto_755391 ) ) ( not ( = ?auto_755381 ?auto_755392 ) ) ( not ( = ?auto_755381 ?auto_755393 ) ) ( not ( = ?auto_755381 ?auto_755394 ) ) ( not ( = ?auto_755381 ?auto_755395 ) ) ( not ( = ?auto_755381 ?auto_755396 ) ) ( not ( = ?auto_755381 ?auto_755397 ) ) ( not ( = ?auto_755382 ?auto_755383 ) ) ( not ( = ?auto_755382 ?auto_755384 ) ) ( not ( = ?auto_755382 ?auto_755385 ) ) ( not ( = ?auto_755382 ?auto_755386 ) ) ( not ( = ?auto_755382 ?auto_755387 ) ) ( not ( = ?auto_755382 ?auto_755388 ) ) ( not ( = ?auto_755382 ?auto_755389 ) ) ( not ( = ?auto_755382 ?auto_755390 ) ) ( not ( = ?auto_755382 ?auto_755391 ) ) ( not ( = ?auto_755382 ?auto_755392 ) ) ( not ( = ?auto_755382 ?auto_755393 ) ) ( not ( = ?auto_755382 ?auto_755394 ) ) ( not ( = ?auto_755382 ?auto_755395 ) ) ( not ( = ?auto_755382 ?auto_755396 ) ) ( not ( = ?auto_755382 ?auto_755397 ) ) ( not ( = ?auto_755383 ?auto_755384 ) ) ( not ( = ?auto_755383 ?auto_755385 ) ) ( not ( = ?auto_755383 ?auto_755386 ) ) ( not ( = ?auto_755383 ?auto_755387 ) ) ( not ( = ?auto_755383 ?auto_755388 ) ) ( not ( = ?auto_755383 ?auto_755389 ) ) ( not ( = ?auto_755383 ?auto_755390 ) ) ( not ( = ?auto_755383 ?auto_755391 ) ) ( not ( = ?auto_755383 ?auto_755392 ) ) ( not ( = ?auto_755383 ?auto_755393 ) ) ( not ( = ?auto_755383 ?auto_755394 ) ) ( not ( = ?auto_755383 ?auto_755395 ) ) ( not ( = ?auto_755383 ?auto_755396 ) ) ( not ( = ?auto_755383 ?auto_755397 ) ) ( not ( = ?auto_755384 ?auto_755385 ) ) ( not ( = ?auto_755384 ?auto_755386 ) ) ( not ( = ?auto_755384 ?auto_755387 ) ) ( not ( = ?auto_755384 ?auto_755388 ) ) ( not ( = ?auto_755384 ?auto_755389 ) ) ( not ( = ?auto_755384 ?auto_755390 ) ) ( not ( = ?auto_755384 ?auto_755391 ) ) ( not ( = ?auto_755384 ?auto_755392 ) ) ( not ( = ?auto_755384 ?auto_755393 ) ) ( not ( = ?auto_755384 ?auto_755394 ) ) ( not ( = ?auto_755384 ?auto_755395 ) ) ( not ( = ?auto_755384 ?auto_755396 ) ) ( not ( = ?auto_755384 ?auto_755397 ) ) ( not ( = ?auto_755385 ?auto_755386 ) ) ( not ( = ?auto_755385 ?auto_755387 ) ) ( not ( = ?auto_755385 ?auto_755388 ) ) ( not ( = ?auto_755385 ?auto_755389 ) ) ( not ( = ?auto_755385 ?auto_755390 ) ) ( not ( = ?auto_755385 ?auto_755391 ) ) ( not ( = ?auto_755385 ?auto_755392 ) ) ( not ( = ?auto_755385 ?auto_755393 ) ) ( not ( = ?auto_755385 ?auto_755394 ) ) ( not ( = ?auto_755385 ?auto_755395 ) ) ( not ( = ?auto_755385 ?auto_755396 ) ) ( not ( = ?auto_755385 ?auto_755397 ) ) ( not ( = ?auto_755386 ?auto_755387 ) ) ( not ( = ?auto_755386 ?auto_755388 ) ) ( not ( = ?auto_755386 ?auto_755389 ) ) ( not ( = ?auto_755386 ?auto_755390 ) ) ( not ( = ?auto_755386 ?auto_755391 ) ) ( not ( = ?auto_755386 ?auto_755392 ) ) ( not ( = ?auto_755386 ?auto_755393 ) ) ( not ( = ?auto_755386 ?auto_755394 ) ) ( not ( = ?auto_755386 ?auto_755395 ) ) ( not ( = ?auto_755386 ?auto_755396 ) ) ( not ( = ?auto_755386 ?auto_755397 ) ) ( not ( = ?auto_755387 ?auto_755388 ) ) ( not ( = ?auto_755387 ?auto_755389 ) ) ( not ( = ?auto_755387 ?auto_755390 ) ) ( not ( = ?auto_755387 ?auto_755391 ) ) ( not ( = ?auto_755387 ?auto_755392 ) ) ( not ( = ?auto_755387 ?auto_755393 ) ) ( not ( = ?auto_755387 ?auto_755394 ) ) ( not ( = ?auto_755387 ?auto_755395 ) ) ( not ( = ?auto_755387 ?auto_755396 ) ) ( not ( = ?auto_755387 ?auto_755397 ) ) ( not ( = ?auto_755388 ?auto_755389 ) ) ( not ( = ?auto_755388 ?auto_755390 ) ) ( not ( = ?auto_755388 ?auto_755391 ) ) ( not ( = ?auto_755388 ?auto_755392 ) ) ( not ( = ?auto_755388 ?auto_755393 ) ) ( not ( = ?auto_755388 ?auto_755394 ) ) ( not ( = ?auto_755388 ?auto_755395 ) ) ( not ( = ?auto_755388 ?auto_755396 ) ) ( not ( = ?auto_755388 ?auto_755397 ) ) ( not ( = ?auto_755389 ?auto_755390 ) ) ( not ( = ?auto_755389 ?auto_755391 ) ) ( not ( = ?auto_755389 ?auto_755392 ) ) ( not ( = ?auto_755389 ?auto_755393 ) ) ( not ( = ?auto_755389 ?auto_755394 ) ) ( not ( = ?auto_755389 ?auto_755395 ) ) ( not ( = ?auto_755389 ?auto_755396 ) ) ( not ( = ?auto_755389 ?auto_755397 ) ) ( not ( = ?auto_755390 ?auto_755391 ) ) ( not ( = ?auto_755390 ?auto_755392 ) ) ( not ( = ?auto_755390 ?auto_755393 ) ) ( not ( = ?auto_755390 ?auto_755394 ) ) ( not ( = ?auto_755390 ?auto_755395 ) ) ( not ( = ?auto_755390 ?auto_755396 ) ) ( not ( = ?auto_755390 ?auto_755397 ) ) ( not ( = ?auto_755391 ?auto_755392 ) ) ( not ( = ?auto_755391 ?auto_755393 ) ) ( not ( = ?auto_755391 ?auto_755394 ) ) ( not ( = ?auto_755391 ?auto_755395 ) ) ( not ( = ?auto_755391 ?auto_755396 ) ) ( not ( = ?auto_755391 ?auto_755397 ) ) ( not ( = ?auto_755392 ?auto_755393 ) ) ( not ( = ?auto_755392 ?auto_755394 ) ) ( not ( = ?auto_755392 ?auto_755395 ) ) ( not ( = ?auto_755392 ?auto_755396 ) ) ( not ( = ?auto_755392 ?auto_755397 ) ) ( not ( = ?auto_755393 ?auto_755394 ) ) ( not ( = ?auto_755393 ?auto_755395 ) ) ( not ( = ?auto_755393 ?auto_755396 ) ) ( not ( = ?auto_755393 ?auto_755397 ) ) ( not ( = ?auto_755394 ?auto_755395 ) ) ( not ( = ?auto_755394 ?auto_755396 ) ) ( not ( = ?auto_755394 ?auto_755397 ) ) ( not ( = ?auto_755395 ?auto_755396 ) ) ( not ( = ?auto_755395 ?auto_755397 ) ) ( not ( = ?auto_755396 ?auto_755397 ) ) ( ON ?auto_755395 ?auto_755396 ) ( ON ?auto_755394 ?auto_755395 ) ( ON ?auto_755393 ?auto_755394 ) ( ON ?auto_755392 ?auto_755393 ) ( ON ?auto_755391 ?auto_755392 ) ( ON ?auto_755390 ?auto_755391 ) ( ON ?auto_755389 ?auto_755390 ) ( ON ?auto_755388 ?auto_755389 ) ( CLEAR ?auto_755386 ) ( ON ?auto_755387 ?auto_755388 ) ( CLEAR ?auto_755387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_755380 ?auto_755381 ?auto_755382 ?auto_755383 ?auto_755384 ?auto_755385 ?auto_755386 ?auto_755387 )
      ( MAKE-17PILE ?auto_755380 ?auto_755381 ?auto_755382 ?auto_755383 ?auto_755384 ?auto_755385 ?auto_755386 ?auto_755387 ?auto_755388 ?auto_755389 ?auto_755390 ?auto_755391 ?auto_755392 ?auto_755393 ?auto_755394 ?auto_755395 ?auto_755396 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755450 - BLOCK
      ?auto_755451 - BLOCK
      ?auto_755452 - BLOCK
      ?auto_755453 - BLOCK
      ?auto_755454 - BLOCK
      ?auto_755455 - BLOCK
      ?auto_755456 - BLOCK
      ?auto_755457 - BLOCK
      ?auto_755458 - BLOCK
      ?auto_755459 - BLOCK
      ?auto_755460 - BLOCK
      ?auto_755461 - BLOCK
      ?auto_755462 - BLOCK
      ?auto_755463 - BLOCK
      ?auto_755464 - BLOCK
      ?auto_755465 - BLOCK
      ?auto_755466 - BLOCK
    )
    :vars
    (
      ?auto_755467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755466 ?auto_755467 ) ( ON-TABLE ?auto_755450 ) ( ON ?auto_755451 ?auto_755450 ) ( ON ?auto_755452 ?auto_755451 ) ( ON ?auto_755453 ?auto_755452 ) ( ON ?auto_755454 ?auto_755453 ) ( ON ?auto_755455 ?auto_755454 ) ( not ( = ?auto_755450 ?auto_755451 ) ) ( not ( = ?auto_755450 ?auto_755452 ) ) ( not ( = ?auto_755450 ?auto_755453 ) ) ( not ( = ?auto_755450 ?auto_755454 ) ) ( not ( = ?auto_755450 ?auto_755455 ) ) ( not ( = ?auto_755450 ?auto_755456 ) ) ( not ( = ?auto_755450 ?auto_755457 ) ) ( not ( = ?auto_755450 ?auto_755458 ) ) ( not ( = ?auto_755450 ?auto_755459 ) ) ( not ( = ?auto_755450 ?auto_755460 ) ) ( not ( = ?auto_755450 ?auto_755461 ) ) ( not ( = ?auto_755450 ?auto_755462 ) ) ( not ( = ?auto_755450 ?auto_755463 ) ) ( not ( = ?auto_755450 ?auto_755464 ) ) ( not ( = ?auto_755450 ?auto_755465 ) ) ( not ( = ?auto_755450 ?auto_755466 ) ) ( not ( = ?auto_755450 ?auto_755467 ) ) ( not ( = ?auto_755451 ?auto_755452 ) ) ( not ( = ?auto_755451 ?auto_755453 ) ) ( not ( = ?auto_755451 ?auto_755454 ) ) ( not ( = ?auto_755451 ?auto_755455 ) ) ( not ( = ?auto_755451 ?auto_755456 ) ) ( not ( = ?auto_755451 ?auto_755457 ) ) ( not ( = ?auto_755451 ?auto_755458 ) ) ( not ( = ?auto_755451 ?auto_755459 ) ) ( not ( = ?auto_755451 ?auto_755460 ) ) ( not ( = ?auto_755451 ?auto_755461 ) ) ( not ( = ?auto_755451 ?auto_755462 ) ) ( not ( = ?auto_755451 ?auto_755463 ) ) ( not ( = ?auto_755451 ?auto_755464 ) ) ( not ( = ?auto_755451 ?auto_755465 ) ) ( not ( = ?auto_755451 ?auto_755466 ) ) ( not ( = ?auto_755451 ?auto_755467 ) ) ( not ( = ?auto_755452 ?auto_755453 ) ) ( not ( = ?auto_755452 ?auto_755454 ) ) ( not ( = ?auto_755452 ?auto_755455 ) ) ( not ( = ?auto_755452 ?auto_755456 ) ) ( not ( = ?auto_755452 ?auto_755457 ) ) ( not ( = ?auto_755452 ?auto_755458 ) ) ( not ( = ?auto_755452 ?auto_755459 ) ) ( not ( = ?auto_755452 ?auto_755460 ) ) ( not ( = ?auto_755452 ?auto_755461 ) ) ( not ( = ?auto_755452 ?auto_755462 ) ) ( not ( = ?auto_755452 ?auto_755463 ) ) ( not ( = ?auto_755452 ?auto_755464 ) ) ( not ( = ?auto_755452 ?auto_755465 ) ) ( not ( = ?auto_755452 ?auto_755466 ) ) ( not ( = ?auto_755452 ?auto_755467 ) ) ( not ( = ?auto_755453 ?auto_755454 ) ) ( not ( = ?auto_755453 ?auto_755455 ) ) ( not ( = ?auto_755453 ?auto_755456 ) ) ( not ( = ?auto_755453 ?auto_755457 ) ) ( not ( = ?auto_755453 ?auto_755458 ) ) ( not ( = ?auto_755453 ?auto_755459 ) ) ( not ( = ?auto_755453 ?auto_755460 ) ) ( not ( = ?auto_755453 ?auto_755461 ) ) ( not ( = ?auto_755453 ?auto_755462 ) ) ( not ( = ?auto_755453 ?auto_755463 ) ) ( not ( = ?auto_755453 ?auto_755464 ) ) ( not ( = ?auto_755453 ?auto_755465 ) ) ( not ( = ?auto_755453 ?auto_755466 ) ) ( not ( = ?auto_755453 ?auto_755467 ) ) ( not ( = ?auto_755454 ?auto_755455 ) ) ( not ( = ?auto_755454 ?auto_755456 ) ) ( not ( = ?auto_755454 ?auto_755457 ) ) ( not ( = ?auto_755454 ?auto_755458 ) ) ( not ( = ?auto_755454 ?auto_755459 ) ) ( not ( = ?auto_755454 ?auto_755460 ) ) ( not ( = ?auto_755454 ?auto_755461 ) ) ( not ( = ?auto_755454 ?auto_755462 ) ) ( not ( = ?auto_755454 ?auto_755463 ) ) ( not ( = ?auto_755454 ?auto_755464 ) ) ( not ( = ?auto_755454 ?auto_755465 ) ) ( not ( = ?auto_755454 ?auto_755466 ) ) ( not ( = ?auto_755454 ?auto_755467 ) ) ( not ( = ?auto_755455 ?auto_755456 ) ) ( not ( = ?auto_755455 ?auto_755457 ) ) ( not ( = ?auto_755455 ?auto_755458 ) ) ( not ( = ?auto_755455 ?auto_755459 ) ) ( not ( = ?auto_755455 ?auto_755460 ) ) ( not ( = ?auto_755455 ?auto_755461 ) ) ( not ( = ?auto_755455 ?auto_755462 ) ) ( not ( = ?auto_755455 ?auto_755463 ) ) ( not ( = ?auto_755455 ?auto_755464 ) ) ( not ( = ?auto_755455 ?auto_755465 ) ) ( not ( = ?auto_755455 ?auto_755466 ) ) ( not ( = ?auto_755455 ?auto_755467 ) ) ( not ( = ?auto_755456 ?auto_755457 ) ) ( not ( = ?auto_755456 ?auto_755458 ) ) ( not ( = ?auto_755456 ?auto_755459 ) ) ( not ( = ?auto_755456 ?auto_755460 ) ) ( not ( = ?auto_755456 ?auto_755461 ) ) ( not ( = ?auto_755456 ?auto_755462 ) ) ( not ( = ?auto_755456 ?auto_755463 ) ) ( not ( = ?auto_755456 ?auto_755464 ) ) ( not ( = ?auto_755456 ?auto_755465 ) ) ( not ( = ?auto_755456 ?auto_755466 ) ) ( not ( = ?auto_755456 ?auto_755467 ) ) ( not ( = ?auto_755457 ?auto_755458 ) ) ( not ( = ?auto_755457 ?auto_755459 ) ) ( not ( = ?auto_755457 ?auto_755460 ) ) ( not ( = ?auto_755457 ?auto_755461 ) ) ( not ( = ?auto_755457 ?auto_755462 ) ) ( not ( = ?auto_755457 ?auto_755463 ) ) ( not ( = ?auto_755457 ?auto_755464 ) ) ( not ( = ?auto_755457 ?auto_755465 ) ) ( not ( = ?auto_755457 ?auto_755466 ) ) ( not ( = ?auto_755457 ?auto_755467 ) ) ( not ( = ?auto_755458 ?auto_755459 ) ) ( not ( = ?auto_755458 ?auto_755460 ) ) ( not ( = ?auto_755458 ?auto_755461 ) ) ( not ( = ?auto_755458 ?auto_755462 ) ) ( not ( = ?auto_755458 ?auto_755463 ) ) ( not ( = ?auto_755458 ?auto_755464 ) ) ( not ( = ?auto_755458 ?auto_755465 ) ) ( not ( = ?auto_755458 ?auto_755466 ) ) ( not ( = ?auto_755458 ?auto_755467 ) ) ( not ( = ?auto_755459 ?auto_755460 ) ) ( not ( = ?auto_755459 ?auto_755461 ) ) ( not ( = ?auto_755459 ?auto_755462 ) ) ( not ( = ?auto_755459 ?auto_755463 ) ) ( not ( = ?auto_755459 ?auto_755464 ) ) ( not ( = ?auto_755459 ?auto_755465 ) ) ( not ( = ?auto_755459 ?auto_755466 ) ) ( not ( = ?auto_755459 ?auto_755467 ) ) ( not ( = ?auto_755460 ?auto_755461 ) ) ( not ( = ?auto_755460 ?auto_755462 ) ) ( not ( = ?auto_755460 ?auto_755463 ) ) ( not ( = ?auto_755460 ?auto_755464 ) ) ( not ( = ?auto_755460 ?auto_755465 ) ) ( not ( = ?auto_755460 ?auto_755466 ) ) ( not ( = ?auto_755460 ?auto_755467 ) ) ( not ( = ?auto_755461 ?auto_755462 ) ) ( not ( = ?auto_755461 ?auto_755463 ) ) ( not ( = ?auto_755461 ?auto_755464 ) ) ( not ( = ?auto_755461 ?auto_755465 ) ) ( not ( = ?auto_755461 ?auto_755466 ) ) ( not ( = ?auto_755461 ?auto_755467 ) ) ( not ( = ?auto_755462 ?auto_755463 ) ) ( not ( = ?auto_755462 ?auto_755464 ) ) ( not ( = ?auto_755462 ?auto_755465 ) ) ( not ( = ?auto_755462 ?auto_755466 ) ) ( not ( = ?auto_755462 ?auto_755467 ) ) ( not ( = ?auto_755463 ?auto_755464 ) ) ( not ( = ?auto_755463 ?auto_755465 ) ) ( not ( = ?auto_755463 ?auto_755466 ) ) ( not ( = ?auto_755463 ?auto_755467 ) ) ( not ( = ?auto_755464 ?auto_755465 ) ) ( not ( = ?auto_755464 ?auto_755466 ) ) ( not ( = ?auto_755464 ?auto_755467 ) ) ( not ( = ?auto_755465 ?auto_755466 ) ) ( not ( = ?auto_755465 ?auto_755467 ) ) ( not ( = ?auto_755466 ?auto_755467 ) ) ( ON ?auto_755465 ?auto_755466 ) ( ON ?auto_755464 ?auto_755465 ) ( ON ?auto_755463 ?auto_755464 ) ( ON ?auto_755462 ?auto_755463 ) ( ON ?auto_755461 ?auto_755462 ) ( ON ?auto_755460 ?auto_755461 ) ( ON ?auto_755459 ?auto_755460 ) ( ON ?auto_755458 ?auto_755459 ) ( ON ?auto_755457 ?auto_755458 ) ( CLEAR ?auto_755455 ) ( ON ?auto_755456 ?auto_755457 ) ( CLEAR ?auto_755456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_755450 ?auto_755451 ?auto_755452 ?auto_755453 ?auto_755454 ?auto_755455 ?auto_755456 )
      ( MAKE-17PILE ?auto_755450 ?auto_755451 ?auto_755452 ?auto_755453 ?auto_755454 ?auto_755455 ?auto_755456 ?auto_755457 ?auto_755458 ?auto_755459 ?auto_755460 ?auto_755461 ?auto_755462 ?auto_755463 ?auto_755464 ?auto_755465 ?auto_755466 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755520 - BLOCK
      ?auto_755521 - BLOCK
      ?auto_755522 - BLOCK
      ?auto_755523 - BLOCK
      ?auto_755524 - BLOCK
      ?auto_755525 - BLOCK
      ?auto_755526 - BLOCK
      ?auto_755527 - BLOCK
      ?auto_755528 - BLOCK
      ?auto_755529 - BLOCK
      ?auto_755530 - BLOCK
      ?auto_755531 - BLOCK
      ?auto_755532 - BLOCK
      ?auto_755533 - BLOCK
      ?auto_755534 - BLOCK
      ?auto_755535 - BLOCK
      ?auto_755536 - BLOCK
    )
    :vars
    (
      ?auto_755537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755536 ?auto_755537 ) ( ON-TABLE ?auto_755520 ) ( ON ?auto_755521 ?auto_755520 ) ( ON ?auto_755522 ?auto_755521 ) ( ON ?auto_755523 ?auto_755522 ) ( ON ?auto_755524 ?auto_755523 ) ( not ( = ?auto_755520 ?auto_755521 ) ) ( not ( = ?auto_755520 ?auto_755522 ) ) ( not ( = ?auto_755520 ?auto_755523 ) ) ( not ( = ?auto_755520 ?auto_755524 ) ) ( not ( = ?auto_755520 ?auto_755525 ) ) ( not ( = ?auto_755520 ?auto_755526 ) ) ( not ( = ?auto_755520 ?auto_755527 ) ) ( not ( = ?auto_755520 ?auto_755528 ) ) ( not ( = ?auto_755520 ?auto_755529 ) ) ( not ( = ?auto_755520 ?auto_755530 ) ) ( not ( = ?auto_755520 ?auto_755531 ) ) ( not ( = ?auto_755520 ?auto_755532 ) ) ( not ( = ?auto_755520 ?auto_755533 ) ) ( not ( = ?auto_755520 ?auto_755534 ) ) ( not ( = ?auto_755520 ?auto_755535 ) ) ( not ( = ?auto_755520 ?auto_755536 ) ) ( not ( = ?auto_755520 ?auto_755537 ) ) ( not ( = ?auto_755521 ?auto_755522 ) ) ( not ( = ?auto_755521 ?auto_755523 ) ) ( not ( = ?auto_755521 ?auto_755524 ) ) ( not ( = ?auto_755521 ?auto_755525 ) ) ( not ( = ?auto_755521 ?auto_755526 ) ) ( not ( = ?auto_755521 ?auto_755527 ) ) ( not ( = ?auto_755521 ?auto_755528 ) ) ( not ( = ?auto_755521 ?auto_755529 ) ) ( not ( = ?auto_755521 ?auto_755530 ) ) ( not ( = ?auto_755521 ?auto_755531 ) ) ( not ( = ?auto_755521 ?auto_755532 ) ) ( not ( = ?auto_755521 ?auto_755533 ) ) ( not ( = ?auto_755521 ?auto_755534 ) ) ( not ( = ?auto_755521 ?auto_755535 ) ) ( not ( = ?auto_755521 ?auto_755536 ) ) ( not ( = ?auto_755521 ?auto_755537 ) ) ( not ( = ?auto_755522 ?auto_755523 ) ) ( not ( = ?auto_755522 ?auto_755524 ) ) ( not ( = ?auto_755522 ?auto_755525 ) ) ( not ( = ?auto_755522 ?auto_755526 ) ) ( not ( = ?auto_755522 ?auto_755527 ) ) ( not ( = ?auto_755522 ?auto_755528 ) ) ( not ( = ?auto_755522 ?auto_755529 ) ) ( not ( = ?auto_755522 ?auto_755530 ) ) ( not ( = ?auto_755522 ?auto_755531 ) ) ( not ( = ?auto_755522 ?auto_755532 ) ) ( not ( = ?auto_755522 ?auto_755533 ) ) ( not ( = ?auto_755522 ?auto_755534 ) ) ( not ( = ?auto_755522 ?auto_755535 ) ) ( not ( = ?auto_755522 ?auto_755536 ) ) ( not ( = ?auto_755522 ?auto_755537 ) ) ( not ( = ?auto_755523 ?auto_755524 ) ) ( not ( = ?auto_755523 ?auto_755525 ) ) ( not ( = ?auto_755523 ?auto_755526 ) ) ( not ( = ?auto_755523 ?auto_755527 ) ) ( not ( = ?auto_755523 ?auto_755528 ) ) ( not ( = ?auto_755523 ?auto_755529 ) ) ( not ( = ?auto_755523 ?auto_755530 ) ) ( not ( = ?auto_755523 ?auto_755531 ) ) ( not ( = ?auto_755523 ?auto_755532 ) ) ( not ( = ?auto_755523 ?auto_755533 ) ) ( not ( = ?auto_755523 ?auto_755534 ) ) ( not ( = ?auto_755523 ?auto_755535 ) ) ( not ( = ?auto_755523 ?auto_755536 ) ) ( not ( = ?auto_755523 ?auto_755537 ) ) ( not ( = ?auto_755524 ?auto_755525 ) ) ( not ( = ?auto_755524 ?auto_755526 ) ) ( not ( = ?auto_755524 ?auto_755527 ) ) ( not ( = ?auto_755524 ?auto_755528 ) ) ( not ( = ?auto_755524 ?auto_755529 ) ) ( not ( = ?auto_755524 ?auto_755530 ) ) ( not ( = ?auto_755524 ?auto_755531 ) ) ( not ( = ?auto_755524 ?auto_755532 ) ) ( not ( = ?auto_755524 ?auto_755533 ) ) ( not ( = ?auto_755524 ?auto_755534 ) ) ( not ( = ?auto_755524 ?auto_755535 ) ) ( not ( = ?auto_755524 ?auto_755536 ) ) ( not ( = ?auto_755524 ?auto_755537 ) ) ( not ( = ?auto_755525 ?auto_755526 ) ) ( not ( = ?auto_755525 ?auto_755527 ) ) ( not ( = ?auto_755525 ?auto_755528 ) ) ( not ( = ?auto_755525 ?auto_755529 ) ) ( not ( = ?auto_755525 ?auto_755530 ) ) ( not ( = ?auto_755525 ?auto_755531 ) ) ( not ( = ?auto_755525 ?auto_755532 ) ) ( not ( = ?auto_755525 ?auto_755533 ) ) ( not ( = ?auto_755525 ?auto_755534 ) ) ( not ( = ?auto_755525 ?auto_755535 ) ) ( not ( = ?auto_755525 ?auto_755536 ) ) ( not ( = ?auto_755525 ?auto_755537 ) ) ( not ( = ?auto_755526 ?auto_755527 ) ) ( not ( = ?auto_755526 ?auto_755528 ) ) ( not ( = ?auto_755526 ?auto_755529 ) ) ( not ( = ?auto_755526 ?auto_755530 ) ) ( not ( = ?auto_755526 ?auto_755531 ) ) ( not ( = ?auto_755526 ?auto_755532 ) ) ( not ( = ?auto_755526 ?auto_755533 ) ) ( not ( = ?auto_755526 ?auto_755534 ) ) ( not ( = ?auto_755526 ?auto_755535 ) ) ( not ( = ?auto_755526 ?auto_755536 ) ) ( not ( = ?auto_755526 ?auto_755537 ) ) ( not ( = ?auto_755527 ?auto_755528 ) ) ( not ( = ?auto_755527 ?auto_755529 ) ) ( not ( = ?auto_755527 ?auto_755530 ) ) ( not ( = ?auto_755527 ?auto_755531 ) ) ( not ( = ?auto_755527 ?auto_755532 ) ) ( not ( = ?auto_755527 ?auto_755533 ) ) ( not ( = ?auto_755527 ?auto_755534 ) ) ( not ( = ?auto_755527 ?auto_755535 ) ) ( not ( = ?auto_755527 ?auto_755536 ) ) ( not ( = ?auto_755527 ?auto_755537 ) ) ( not ( = ?auto_755528 ?auto_755529 ) ) ( not ( = ?auto_755528 ?auto_755530 ) ) ( not ( = ?auto_755528 ?auto_755531 ) ) ( not ( = ?auto_755528 ?auto_755532 ) ) ( not ( = ?auto_755528 ?auto_755533 ) ) ( not ( = ?auto_755528 ?auto_755534 ) ) ( not ( = ?auto_755528 ?auto_755535 ) ) ( not ( = ?auto_755528 ?auto_755536 ) ) ( not ( = ?auto_755528 ?auto_755537 ) ) ( not ( = ?auto_755529 ?auto_755530 ) ) ( not ( = ?auto_755529 ?auto_755531 ) ) ( not ( = ?auto_755529 ?auto_755532 ) ) ( not ( = ?auto_755529 ?auto_755533 ) ) ( not ( = ?auto_755529 ?auto_755534 ) ) ( not ( = ?auto_755529 ?auto_755535 ) ) ( not ( = ?auto_755529 ?auto_755536 ) ) ( not ( = ?auto_755529 ?auto_755537 ) ) ( not ( = ?auto_755530 ?auto_755531 ) ) ( not ( = ?auto_755530 ?auto_755532 ) ) ( not ( = ?auto_755530 ?auto_755533 ) ) ( not ( = ?auto_755530 ?auto_755534 ) ) ( not ( = ?auto_755530 ?auto_755535 ) ) ( not ( = ?auto_755530 ?auto_755536 ) ) ( not ( = ?auto_755530 ?auto_755537 ) ) ( not ( = ?auto_755531 ?auto_755532 ) ) ( not ( = ?auto_755531 ?auto_755533 ) ) ( not ( = ?auto_755531 ?auto_755534 ) ) ( not ( = ?auto_755531 ?auto_755535 ) ) ( not ( = ?auto_755531 ?auto_755536 ) ) ( not ( = ?auto_755531 ?auto_755537 ) ) ( not ( = ?auto_755532 ?auto_755533 ) ) ( not ( = ?auto_755532 ?auto_755534 ) ) ( not ( = ?auto_755532 ?auto_755535 ) ) ( not ( = ?auto_755532 ?auto_755536 ) ) ( not ( = ?auto_755532 ?auto_755537 ) ) ( not ( = ?auto_755533 ?auto_755534 ) ) ( not ( = ?auto_755533 ?auto_755535 ) ) ( not ( = ?auto_755533 ?auto_755536 ) ) ( not ( = ?auto_755533 ?auto_755537 ) ) ( not ( = ?auto_755534 ?auto_755535 ) ) ( not ( = ?auto_755534 ?auto_755536 ) ) ( not ( = ?auto_755534 ?auto_755537 ) ) ( not ( = ?auto_755535 ?auto_755536 ) ) ( not ( = ?auto_755535 ?auto_755537 ) ) ( not ( = ?auto_755536 ?auto_755537 ) ) ( ON ?auto_755535 ?auto_755536 ) ( ON ?auto_755534 ?auto_755535 ) ( ON ?auto_755533 ?auto_755534 ) ( ON ?auto_755532 ?auto_755533 ) ( ON ?auto_755531 ?auto_755532 ) ( ON ?auto_755530 ?auto_755531 ) ( ON ?auto_755529 ?auto_755530 ) ( ON ?auto_755528 ?auto_755529 ) ( ON ?auto_755527 ?auto_755528 ) ( ON ?auto_755526 ?auto_755527 ) ( CLEAR ?auto_755524 ) ( ON ?auto_755525 ?auto_755526 ) ( CLEAR ?auto_755525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_755520 ?auto_755521 ?auto_755522 ?auto_755523 ?auto_755524 ?auto_755525 )
      ( MAKE-17PILE ?auto_755520 ?auto_755521 ?auto_755522 ?auto_755523 ?auto_755524 ?auto_755525 ?auto_755526 ?auto_755527 ?auto_755528 ?auto_755529 ?auto_755530 ?auto_755531 ?auto_755532 ?auto_755533 ?auto_755534 ?auto_755535 ?auto_755536 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755590 - BLOCK
      ?auto_755591 - BLOCK
      ?auto_755592 - BLOCK
      ?auto_755593 - BLOCK
      ?auto_755594 - BLOCK
      ?auto_755595 - BLOCK
      ?auto_755596 - BLOCK
      ?auto_755597 - BLOCK
      ?auto_755598 - BLOCK
      ?auto_755599 - BLOCK
      ?auto_755600 - BLOCK
      ?auto_755601 - BLOCK
      ?auto_755602 - BLOCK
      ?auto_755603 - BLOCK
      ?auto_755604 - BLOCK
      ?auto_755605 - BLOCK
      ?auto_755606 - BLOCK
    )
    :vars
    (
      ?auto_755607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755606 ?auto_755607 ) ( ON-TABLE ?auto_755590 ) ( ON ?auto_755591 ?auto_755590 ) ( ON ?auto_755592 ?auto_755591 ) ( ON ?auto_755593 ?auto_755592 ) ( not ( = ?auto_755590 ?auto_755591 ) ) ( not ( = ?auto_755590 ?auto_755592 ) ) ( not ( = ?auto_755590 ?auto_755593 ) ) ( not ( = ?auto_755590 ?auto_755594 ) ) ( not ( = ?auto_755590 ?auto_755595 ) ) ( not ( = ?auto_755590 ?auto_755596 ) ) ( not ( = ?auto_755590 ?auto_755597 ) ) ( not ( = ?auto_755590 ?auto_755598 ) ) ( not ( = ?auto_755590 ?auto_755599 ) ) ( not ( = ?auto_755590 ?auto_755600 ) ) ( not ( = ?auto_755590 ?auto_755601 ) ) ( not ( = ?auto_755590 ?auto_755602 ) ) ( not ( = ?auto_755590 ?auto_755603 ) ) ( not ( = ?auto_755590 ?auto_755604 ) ) ( not ( = ?auto_755590 ?auto_755605 ) ) ( not ( = ?auto_755590 ?auto_755606 ) ) ( not ( = ?auto_755590 ?auto_755607 ) ) ( not ( = ?auto_755591 ?auto_755592 ) ) ( not ( = ?auto_755591 ?auto_755593 ) ) ( not ( = ?auto_755591 ?auto_755594 ) ) ( not ( = ?auto_755591 ?auto_755595 ) ) ( not ( = ?auto_755591 ?auto_755596 ) ) ( not ( = ?auto_755591 ?auto_755597 ) ) ( not ( = ?auto_755591 ?auto_755598 ) ) ( not ( = ?auto_755591 ?auto_755599 ) ) ( not ( = ?auto_755591 ?auto_755600 ) ) ( not ( = ?auto_755591 ?auto_755601 ) ) ( not ( = ?auto_755591 ?auto_755602 ) ) ( not ( = ?auto_755591 ?auto_755603 ) ) ( not ( = ?auto_755591 ?auto_755604 ) ) ( not ( = ?auto_755591 ?auto_755605 ) ) ( not ( = ?auto_755591 ?auto_755606 ) ) ( not ( = ?auto_755591 ?auto_755607 ) ) ( not ( = ?auto_755592 ?auto_755593 ) ) ( not ( = ?auto_755592 ?auto_755594 ) ) ( not ( = ?auto_755592 ?auto_755595 ) ) ( not ( = ?auto_755592 ?auto_755596 ) ) ( not ( = ?auto_755592 ?auto_755597 ) ) ( not ( = ?auto_755592 ?auto_755598 ) ) ( not ( = ?auto_755592 ?auto_755599 ) ) ( not ( = ?auto_755592 ?auto_755600 ) ) ( not ( = ?auto_755592 ?auto_755601 ) ) ( not ( = ?auto_755592 ?auto_755602 ) ) ( not ( = ?auto_755592 ?auto_755603 ) ) ( not ( = ?auto_755592 ?auto_755604 ) ) ( not ( = ?auto_755592 ?auto_755605 ) ) ( not ( = ?auto_755592 ?auto_755606 ) ) ( not ( = ?auto_755592 ?auto_755607 ) ) ( not ( = ?auto_755593 ?auto_755594 ) ) ( not ( = ?auto_755593 ?auto_755595 ) ) ( not ( = ?auto_755593 ?auto_755596 ) ) ( not ( = ?auto_755593 ?auto_755597 ) ) ( not ( = ?auto_755593 ?auto_755598 ) ) ( not ( = ?auto_755593 ?auto_755599 ) ) ( not ( = ?auto_755593 ?auto_755600 ) ) ( not ( = ?auto_755593 ?auto_755601 ) ) ( not ( = ?auto_755593 ?auto_755602 ) ) ( not ( = ?auto_755593 ?auto_755603 ) ) ( not ( = ?auto_755593 ?auto_755604 ) ) ( not ( = ?auto_755593 ?auto_755605 ) ) ( not ( = ?auto_755593 ?auto_755606 ) ) ( not ( = ?auto_755593 ?auto_755607 ) ) ( not ( = ?auto_755594 ?auto_755595 ) ) ( not ( = ?auto_755594 ?auto_755596 ) ) ( not ( = ?auto_755594 ?auto_755597 ) ) ( not ( = ?auto_755594 ?auto_755598 ) ) ( not ( = ?auto_755594 ?auto_755599 ) ) ( not ( = ?auto_755594 ?auto_755600 ) ) ( not ( = ?auto_755594 ?auto_755601 ) ) ( not ( = ?auto_755594 ?auto_755602 ) ) ( not ( = ?auto_755594 ?auto_755603 ) ) ( not ( = ?auto_755594 ?auto_755604 ) ) ( not ( = ?auto_755594 ?auto_755605 ) ) ( not ( = ?auto_755594 ?auto_755606 ) ) ( not ( = ?auto_755594 ?auto_755607 ) ) ( not ( = ?auto_755595 ?auto_755596 ) ) ( not ( = ?auto_755595 ?auto_755597 ) ) ( not ( = ?auto_755595 ?auto_755598 ) ) ( not ( = ?auto_755595 ?auto_755599 ) ) ( not ( = ?auto_755595 ?auto_755600 ) ) ( not ( = ?auto_755595 ?auto_755601 ) ) ( not ( = ?auto_755595 ?auto_755602 ) ) ( not ( = ?auto_755595 ?auto_755603 ) ) ( not ( = ?auto_755595 ?auto_755604 ) ) ( not ( = ?auto_755595 ?auto_755605 ) ) ( not ( = ?auto_755595 ?auto_755606 ) ) ( not ( = ?auto_755595 ?auto_755607 ) ) ( not ( = ?auto_755596 ?auto_755597 ) ) ( not ( = ?auto_755596 ?auto_755598 ) ) ( not ( = ?auto_755596 ?auto_755599 ) ) ( not ( = ?auto_755596 ?auto_755600 ) ) ( not ( = ?auto_755596 ?auto_755601 ) ) ( not ( = ?auto_755596 ?auto_755602 ) ) ( not ( = ?auto_755596 ?auto_755603 ) ) ( not ( = ?auto_755596 ?auto_755604 ) ) ( not ( = ?auto_755596 ?auto_755605 ) ) ( not ( = ?auto_755596 ?auto_755606 ) ) ( not ( = ?auto_755596 ?auto_755607 ) ) ( not ( = ?auto_755597 ?auto_755598 ) ) ( not ( = ?auto_755597 ?auto_755599 ) ) ( not ( = ?auto_755597 ?auto_755600 ) ) ( not ( = ?auto_755597 ?auto_755601 ) ) ( not ( = ?auto_755597 ?auto_755602 ) ) ( not ( = ?auto_755597 ?auto_755603 ) ) ( not ( = ?auto_755597 ?auto_755604 ) ) ( not ( = ?auto_755597 ?auto_755605 ) ) ( not ( = ?auto_755597 ?auto_755606 ) ) ( not ( = ?auto_755597 ?auto_755607 ) ) ( not ( = ?auto_755598 ?auto_755599 ) ) ( not ( = ?auto_755598 ?auto_755600 ) ) ( not ( = ?auto_755598 ?auto_755601 ) ) ( not ( = ?auto_755598 ?auto_755602 ) ) ( not ( = ?auto_755598 ?auto_755603 ) ) ( not ( = ?auto_755598 ?auto_755604 ) ) ( not ( = ?auto_755598 ?auto_755605 ) ) ( not ( = ?auto_755598 ?auto_755606 ) ) ( not ( = ?auto_755598 ?auto_755607 ) ) ( not ( = ?auto_755599 ?auto_755600 ) ) ( not ( = ?auto_755599 ?auto_755601 ) ) ( not ( = ?auto_755599 ?auto_755602 ) ) ( not ( = ?auto_755599 ?auto_755603 ) ) ( not ( = ?auto_755599 ?auto_755604 ) ) ( not ( = ?auto_755599 ?auto_755605 ) ) ( not ( = ?auto_755599 ?auto_755606 ) ) ( not ( = ?auto_755599 ?auto_755607 ) ) ( not ( = ?auto_755600 ?auto_755601 ) ) ( not ( = ?auto_755600 ?auto_755602 ) ) ( not ( = ?auto_755600 ?auto_755603 ) ) ( not ( = ?auto_755600 ?auto_755604 ) ) ( not ( = ?auto_755600 ?auto_755605 ) ) ( not ( = ?auto_755600 ?auto_755606 ) ) ( not ( = ?auto_755600 ?auto_755607 ) ) ( not ( = ?auto_755601 ?auto_755602 ) ) ( not ( = ?auto_755601 ?auto_755603 ) ) ( not ( = ?auto_755601 ?auto_755604 ) ) ( not ( = ?auto_755601 ?auto_755605 ) ) ( not ( = ?auto_755601 ?auto_755606 ) ) ( not ( = ?auto_755601 ?auto_755607 ) ) ( not ( = ?auto_755602 ?auto_755603 ) ) ( not ( = ?auto_755602 ?auto_755604 ) ) ( not ( = ?auto_755602 ?auto_755605 ) ) ( not ( = ?auto_755602 ?auto_755606 ) ) ( not ( = ?auto_755602 ?auto_755607 ) ) ( not ( = ?auto_755603 ?auto_755604 ) ) ( not ( = ?auto_755603 ?auto_755605 ) ) ( not ( = ?auto_755603 ?auto_755606 ) ) ( not ( = ?auto_755603 ?auto_755607 ) ) ( not ( = ?auto_755604 ?auto_755605 ) ) ( not ( = ?auto_755604 ?auto_755606 ) ) ( not ( = ?auto_755604 ?auto_755607 ) ) ( not ( = ?auto_755605 ?auto_755606 ) ) ( not ( = ?auto_755605 ?auto_755607 ) ) ( not ( = ?auto_755606 ?auto_755607 ) ) ( ON ?auto_755605 ?auto_755606 ) ( ON ?auto_755604 ?auto_755605 ) ( ON ?auto_755603 ?auto_755604 ) ( ON ?auto_755602 ?auto_755603 ) ( ON ?auto_755601 ?auto_755602 ) ( ON ?auto_755600 ?auto_755601 ) ( ON ?auto_755599 ?auto_755600 ) ( ON ?auto_755598 ?auto_755599 ) ( ON ?auto_755597 ?auto_755598 ) ( ON ?auto_755596 ?auto_755597 ) ( ON ?auto_755595 ?auto_755596 ) ( CLEAR ?auto_755593 ) ( ON ?auto_755594 ?auto_755595 ) ( CLEAR ?auto_755594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_755590 ?auto_755591 ?auto_755592 ?auto_755593 ?auto_755594 )
      ( MAKE-17PILE ?auto_755590 ?auto_755591 ?auto_755592 ?auto_755593 ?auto_755594 ?auto_755595 ?auto_755596 ?auto_755597 ?auto_755598 ?auto_755599 ?auto_755600 ?auto_755601 ?auto_755602 ?auto_755603 ?auto_755604 ?auto_755605 ?auto_755606 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755660 - BLOCK
      ?auto_755661 - BLOCK
      ?auto_755662 - BLOCK
      ?auto_755663 - BLOCK
      ?auto_755664 - BLOCK
      ?auto_755665 - BLOCK
      ?auto_755666 - BLOCK
      ?auto_755667 - BLOCK
      ?auto_755668 - BLOCK
      ?auto_755669 - BLOCK
      ?auto_755670 - BLOCK
      ?auto_755671 - BLOCK
      ?auto_755672 - BLOCK
      ?auto_755673 - BLOCK
      ?auto_755674 - BLOCK
      ?auto_755675 - BLOCK
      ?auto_755676 - BLOCK
    )
    :vars
    (
      ?auto_755677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755676 ?auto_755677 ) ( ON-TABLE ?auto_755660 ) ( ON ?auto_755661 ?auto_755660 ) ( ON ?auto_755662 ?auto_755661 ) ( not ( = ?auto_755660 ?auto_755661 ) ) ( not ( = ?auto_755660 ?auto_755662 ) ) ( not ( = ?auto_755660 ?auto_755663 ) ) ( not ( = ?auto_755660 ?auto_755664 ) ) ( not ( = ?auto_755660 ?auto_755665 ) ) ( not ( = ?auto_755660 ?auto_755666 ) ) ( not ( = ?auto_755660 ?auto_755667 ) ) ( not ( = ?auto_755660 ?auto_755668 ) ) ( not ( = ?auto_755660 ?auto_755669 ) ) ( not ( = ?auto_755660 ?auto_755670 ) ) ( not ( = ?auto_755660 ?auto_755671 ) ) ( not ( = ?auto_755660 ?auto_755672 ) ) ( not ( = ?auto_755660 ?auto_755673 ) ) ( not ( = ?auto_755660 ?auto_755674 ) ) ( not ( = ?auto_755660 ?auto_755675 ) ) ( not ( = ?auto_755660 ?auto_755676 ) ) ( not ( = ?auto_755660 ?auto_755677 ) ) ( not ( = ?auto_755661 ?auto_755662 ) ) ( not ( = ?auto_755661 ?auto_755663 ) ) ( not ( = ?auto_755661 ?auto_755664 ) ) ( not ( = ?auto_755661 ?auto_755665 ) ) ( not ( = ?auto_755661 ?auto_755666 ) ) ( not ( = ?auto_755661 ?auto_755667 ) ) ( not ( = ?auto_755661 ?auto_755668 ) ) ( not ( = ?auto_755661 ?auto_755669 ) ) ( not ( = ?auto_755661 ?auto_755670 ) ) ( not ( = ?auto_755661 ?auto_755671 ) ) ( not ( = ?auto_755661 ?auto_755672 ) ) ( not ( = ?auto_755661 ?auto_755673 ) ) ( not ( = ?auto_755661 ?auto_755674 ) ) ( not ( = ?auto_755661 ?auto_755675 ) ) ( not ( = ?auto_755661 ?auto_755676 ) ) ( not ( = ?auto_755661 ?auto_755677 ) ) ( not ( = ?auto_755662 ?auto_755663 ) ) ( not ( = ?auto_755662 ?auto_755664 ) ) ( not ( = ?auto_755662 ?auto_755665 ) ) ( not ( = ?auto_755662 ?auto_755666 ) ) ( not ( = ?auto_755662 ?auto_755667 ) ) ( not ( = ?auto_755662 ?auto_755668 ) ) ( not ( = ?auto_755662 ?auto_755669 ) ) ( not ( = ?auto_755662 ?auto_755670 ) ) ( not ( = ?auto_755662 ?auto_755671 ) ) ( not ( = ?auto_755662 ?auto_755672 ) ) ( not ( = ?auto_755662 ?auto_755673 ) ) ( not ( = ?auto_755662 ?auto_755674 ) ) ( not ( = ?auto_755662 ?auto_755675 ) ) ( not ( = ?auto_755662 ?auto_755676 ) ) ( not ( = ?auto_755662 ?auto_755677 ) ) ( not ( = ?auto_755663 ?auto_755664 ) ) ( not ( = ?auto_755663 ?auto_755665 ) ) ( not ( = ?auto_755663 ?auto_755666 ) ) ( not ( = ?auto_755663 ?auto_755667 ) ) ( not ( = ?auto_755663 ?auto_755668 ) ) ( not ( = ?auto_755663 ?auto_755669 ) ) ( not ( = ?auto_755663 ?auto_755670 ) ) ( not ( = ?auto_755663 ?auto_755671 ) ) ( not ( = ?auto_755663 ?auto_755672 ) ) ( not ( = ?auto_755663 ?auto_755673 ) ) ( not ( = ?auto_755663 ?auto_755674 ) ) ( not ( = ?auto_755663 ?auto_755675 ) ) ( not ( = ?auto_755663 ?auto_755676 ) ) ( not ( = ?auto_755663 ?auto_755677 ) ) ( not ( = ?auto_755664 ?auto_755665 ) ) ( not ( = ?auto_755664 ?auto_755666 ) ) ( not ( = ?auto_755664 ?auto_755667 ) ) ( not ( = ?auto_755664 ?auto_755668 ) ) ( not ( = ?auto_755664 ?auto_755669 ) ) ( not ( = ?auto_755664 ?auto_755670 ) ) ( not ( = ?auto_755664 ?auto_755671 ) ) ( not ( = ?auto_755664 ?auto_755672 ) ) ( not ( = ?auto_755664 ?auto_755673 ) ) ( not ( = ?auto_755664 ?auto_755674 ) ) ( not ( = ?auto_755664 ?auto_755675 ) ) ( not ( = ?auto_755664 ?auto_755676 ) ) ( not ( = ?auto_755664 ?auto_755677 ) ) ( not ( = ?auto_755665 ?auto_755666 ) ) ( not ( = ?auto_755665 ?auto_755667 ) ) ( not ( = ?auto_755665 ?auto_755668 ) ) ( not ( = ?auto_755665 ?auto_755669 ) ) ( not ( = ?auto_755665 ?auto_755670 ) ) ( not ( = ?auto_755665 ?auto_755671 ) ) ( not ( = ?auto_755665 ?auto_755672 ) ) ( not ( = ?auto_755665 ?auto_755673 ) ) ( not ( = ?auto_755665 ?auto_755674 ) ) ( not ( = ?auto_755665 ?auto_755675 ) ) ( not ( = ?auto_755665 ?auto_755676 ) ) ( not ( = ?auto_755665 ?auto_755677 ) ) ( not ( = ?auto_755666 ?auto_755667 ) ) ( not ( = ?auto_755666 ?auto_755668 ) ) ( not ( = ?auto_755666 ?auto_755669 ) ) ( not ( = ?auto_755666 ?auto_755670 ) ) ( not ( = ?auto_755666 ?auto_755671 ) ) ( not ( = ?auto_755666 ?auto_755672 ) ) ( not ( = ?auto_755666 ?auto_755673 ) ) ( not ( = ?auto_755666 ?auto_755674 ) ) ( not ( = ?auto_755666 ?auto_755675 ) ) ( not ( = ?auto_755666 ?auto_755676 ) ) ( not ( = ?auto_755666 ?auto_755677 ) ) ( not ( = ?auto_755667 ?auto_755668 ) ) ( not ( = ?auto_755667 ?auto_755669 ) ) ( not ( = ?auto_755667 ?auto_755670 ) ) ( not ( = ?auto_755667 ?auto_755671 ) ) ( not ( = ?auto_755667 ?auto_755672 ) ) ( not ( = ?auto_755667 ?auto_755673 ) ) ( not ( = ?auto_755667 ?auto_755674 ) ) ( not ( = ?auto_755667 ?auto_755675 ) ) ( not ( = ?auto_755667 ?auto_755676 ) ) ( not ( = ?auto_755667 ?auto_755677 ) ) ( not ( = ?auto_755668 ?auto_755669 ) ) ( not ( = ?auto_755668 ?auto_755670 ) ) ( not ( = ?auto_755668 ?auto_755671 ) ) ( not ( = ?auto_755668 ?auto_755672 ) ) ( not ( = ?auto_755668 ?auto_755673 ) ) ( not ( = ?auto_755668 ?auto_755674 ) ) ( not ( = ?auto_755668 ?auto_755675 ) ) ( not ( = ?auto_755668 ?auto_755676 ) ) ( not ( = ?auto_755668 ?auto_755677 ) ) ( not ( = ?auto_755669 ?auto_755670 ) ) ( not ( = ?auto_755669 ?auto_755671 ) ) ( not ( = ?auto_755669 ?auto_755672 ) ) ( not ( = ?auto_755669 ?auto_755673 ) ) ( not ( = ?auto_755669 ?auto_755674 ) ) ( not ( = ?auto_755669 ?auto_755675 ) ) ( not ( = ?auto_755669 ?auto_755676 ) ) ( not ( = ?auto_755669 ?auto_755677 ) ) ( not ( = ?auto_755670 ?auto_755671 ) ) ( not ( = ?auto_755670 ?auto_755672 ) ) ( not ( = ?auto_755670 ?auto_755673 ) ) ( not ( = ?auto_755670 ?auto_755674 ) ) ( not ( = ?auto_755670 ?auto_755675 ) ) ( not ( = ?auto_755670 ?auto_755676 ) ) ( not ( = ?auto_755670 ?auto_755677 ) ) ( not ( = ?auto_755671 ?auto_755672 ) ) ( not ( = ?auto_755671 ?auto_755673 ) ) ( not ( = ?auto_755671 ?auto_755674 ) ) ( not ( = ?auto_755671 ?auto_755675 ) ) ( not ( = ?auto_755671 ?auto_755676 ) ) ( not ( = ?auto_755671 ?auto_755677 ) ) ( not ( = ?auto_755672 ?auto_755673 ) ) ( not ( = ?auto_755672 ?auto_755674 ) ) ( not ( = ?auto_755672 ?auto_755675 ) ) ( not ( = ?auto_755672 ?auto_755676 ) ) ( not ( = ?auto_755672 ?auto_755677 ) ) ( not ( = ?auto_755673 ?auto_755674 ) ) ( not ( = ?auto_755673 ?auto_755675 ) ) ( not ( = ?auto_755673 ?auto_755676 ) ) ( not ( = ?auto_755673 ?auto_755677 ) ) ( not ( = ?auto_755674 ?auto_755675 ) ) ( not ( = ?auto_755674 ?auto_755676 ) ) ( not ( = ?auto_755674 ?auto_755677 ) ) ( not ( = ?auto_755675 ?auto_755676 ) ) ( not ( = ?auto_755675 ?auto_755677 ) ) ( not ( = ?auto_755676 ?auto_755677 ) ) ( ON ?auto_755675 ?auto_755676 ) ( ON ?auto_755674 ?auto_755675 ) ( ON ?auto_755673 ?auto_755674 ) ( ON ?auto_755672 ?auto_755673 ) ( ON ?auto_755671 ?auto_755672 ) ( ON ?auto_755670 ?auto_755671 ) ( ON ?auto_755669 ?auto_755670 ) ( ON ?auto_755668 ?auto_755669 ) ( ON ?auto_755667 ?auto_755668 ) ( ON ?auto_755666 ?auto_755667 ) ( ON ?auto_755665 ?auto_755666 ) ( ON ?auto_755664 ?auto_755665 ) ( CLEAR ?auto_755662 ) ( ON ?auto_755663 ?auto_755664 ) ( CLEAR ?auto_755663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_755660 ?auto_755661 ?auto_755662 ?auto_755663 )
      ( MAKE-17PILE ?auto_755660 ?auto_755661 ?auto_755662 ?auto_755663 ?auto_755664 ?auto_755665 ?auto_755666 ?auto_755667 ?auto_755668 ?auto_755669 ?auto_755670 ?auto_755671 ?auto_755672 ?auto_755673 ?auto_755674 ?auto_755675 ?auto_755676 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755730 - BLOCK
      ?auto_755731 - BLOCK
      ?auto_755732 - BLOCK
      ?auto_755733 - BLOCK
      ?auto_755734 - BLOCK
      ?auto_755735 - BLOCK
      ?auto_755736 - BLOCK
      ?auto_755737 - BLOCK
      ?auto_755738 - BLOCK
      ?auto_755739 - BLOCK
      ?auto_755740 - BLOCK
      ?auto_755741 - BLOCK
      ?auto_755742 - BLOCK
      ?auto_755743 - BLOCK
      ?auto_755744 - BLOCK
      ?auto_755745 - BLOCK
      ?auto_755746 - BLOCK
    )
    :vars
    (
      ?auto_755747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755746 ?auto_755747 ) ( ON-TABLE ?auto_755730 ) ( ON ?auto_755731 ?auto_755730 ) ( not ( = ?auto_755730 ?auto_755731 ) ) ( not ( = ?auto_755730 ?auto_755732 ) ) ( not ( = ?auto_755730 ?auto_755733 ) ) ( not ( = ?auto_755730 ?auto_755734 ) ) ( not ( = ?auto_755730 ?auto_755735 ) ) ( not ( = ?auto_755730 ?auto_755736 ) ) ( not ( = ?auto_755730 ?auto_755737 ) ) ( not ( = ?auto_755730 ?auto_755738 ) ) ( not ( = ?auto_755730 ?auto_755739 ) ) ( not ( = ?auto_755730 ?auto_755740 ) ) ( not ( = ?auto_755730 ?auto_755741 ) ) ( not ( = ?auto_755730 ?auto_755742 ) ) ( not ( = ?auto_755730 ?auto_755743 ) ) ( not ( = ?auto_755730 ?auto_755744 ) ) ( not ( = ?auto_755730 ?auto_755745 ) ) ( not ( = ?auto_755730 ?auto_755746 ) ) ( not ( = ?auto_755730 ?auto_755747 ) ) ( not ( = ?auto_755731 ?auto_755732 ) ) ( not ( = ?auto_755731 ?auto_755733 ) ) ( not ( = ?auto_755731 ?auto_755734 ) ) ( not ( = ?auto_755731 ?auto_755735 ) ) ( not ( = ?auto_755731 ?auto_755736 ) ) ( not ( = ?auto_755731 ?auto_755737 ) ) ( not ( = ?auto_755731 ?auto_755738 ) ) ( not ( = ?auto_755731 ?auto_755739 ) ) ( not ( = ?auto_755731 ?auto_755740 ) ) ( not ( = ?auto_755731 ?auto_755741 ) ) ( not ( = ?auto_755731 ?auto_755742 ) ) ( not ( = ?auto_755731 ?auto_755743 ) ) ( not ( = ?auto_755731 ?auto_755744 ) ) ( not ( = ?auto_755731 ?auto_755745 ) ) ( not ( = ?auto_755731 ?auto_755746 ) ) ( not ( = ?auto_755731 ?auto_755747 ) ) ( not ( = ?auto_755732 ?auto_755733 ) ) ( not ( = ?auto_755732 ?auto_755734 ) ) ( not ( = ?auto_755732 ?auto_755735 ) ) ( not ( = ?auto_755732 ?auto_755736 ) ) ( not ( = ?auto_755732 ?auto_755737 ) ) ( not ( = ?auto_755732 ?auto_755738 ) ) ( not ( = ?auto_755732 ?auto_755739 ) ) ( not ( = ?auto_755732 ?auto_755740 ) ) ( not ( = ?auto_755732 ?auto_755741 ) ) ( not ( = ?auto_755732 ?auto_755742 ) ) ( not ( = ?auto_755732 ?auto_755743 ) ) ( not ( = ?auto_755732 ?auto_755744 ) ) ( not ( = ?auto_755732 ?auto_755745 ) ) ( not ( = ?auto_755732 ?auto_755746 ) ) ( not ( = ?auto_755732 ?auto_755747 ) ) ( not ( = ?auto_755733 ?auto_755734 ) ) ( not ( = ?auto_755733 ?auto_755735 ) ) ( not ( = ?auto_755733 ?auto_755736 ) ) ( not ( = ?auto_755733 ?auto_755737 ) ) ( not ( = ?auto_755733 ?auto_755738 ) ) ( not ( = ?auto_755733 ?auto_755739 ) ) ( not ( = ?auto_755733 ?auto_755740 ) ) ( not ( = ?auto_755733 ?auto_755741 ) ) ( not ( = ?auto_755733 ?auto_755742 ) ) ( not ( = ?auto_755733 ?auto_755743 ) ) ( not ( = ?auto_755733 ?auto_755744 ) ) ( not ( = ?auto_755733 ?auto_755745 ) ) ( not ( = ?auto_755733 ?auto_755746 ) ) ( not ( = ?auto_755733 ?auto_755747 ) ) ( not ( = ?auto_755734 ?auto_755735 ) ) ( not ( = ?auto_755734 ?auto_755736 ) ) ( not ( = ?auto_755734 ?auto_755737 ) ) ( not ( = ?auto_755734 ?auto_755738 ) ) ( not ( = ?auto_755734 ?auto_755739 ) ) ( not ( = ?auto_755734 ?auto_755740 ) ) ( not ( = ?auto_755734 ?auto_755741 ) ) ( not ( = ?auto_755734 ?auto_755742 ) ) ( not ( = ?auto_755734 ?auto_755743 ) ) ( not ( = ?auto_755734 ?auto_755744 ) ) ( not ( = ?auto_755734 ?auto_755745 ) ) ( not ( = ?auto_755734 ?auto_755746 ) ) ( not ( = ?auto_755734 ?auto_755747 ) ) ( not ( = ?auto_755735 ?auto_755736 ) ) ( not ( = ?auto_755735 ?auto_755737 ) ) ( not ( = ?auto_755735 ?auto_755738 ) ) ( not ( = ?auto_755735 ?auto_755739 ) ) ( not ( = ?auto_755735 ?auto_755740 ) ) ( not ( = ?auto_755735 ?auto_755741 ) ) ( not ( = ?auto_755735 ?auto_755742 ) ) ( not ( = ?auto_755735 ?auto_755743 ) ) ( not ( = ?auto_755735 ?auto_755744 ) ) ( not ( = ?auto_755735 ?auto_755745 ) ) ( not ( = ?auto_755735 ?auto_755746 ) ) ( not ( = ?auto_755735 ?auto_755747 ) ) ( not ( = ?auto_755736 ?auto_755737 ) ) ( not ( = ?auto_755736 ?auto_755738 ) ) ( not ( = ?auto_755736 ?auto_755739 ) ) ( not ( = ?auto_755736 ?auto_755740 ) ) ( not ( = ?auto_755736 ?auto_755741 ) ) ( not ( = ?auto_755736 ?auto_755742 ) ) ( not ( = ?auto_755736 ?auto_755743 ) ) ( not ( = ?auto_755736 ?auto_755744 ) ) ( not ( = ?auto_755736 ?auto_755745 ) ) ( not ( = ?auto_755736 ?auto_755746 ) ) ( not ( = ?auto_755736 ?auto_755747 ) ) ( not ( = ?auto_755737 ?auto_755738 ) ) ( not ( = ?auto_755737 ?auto_755739 ) ) ( not ( = ?auto_755737 ?auto_755740 ) ) ( not ( = ?auto_755737 ?auto_755741 ) ) ( not ( = ?auto_755737 ?auto_755742 ) ) ( not ( = ?auto_755737 ?auto_755743 ) ) ( not ( = ?auto_755737 ?auto_755744 ) ) ( not ( = ?auto_755737 ?auto_755745 ) ) ( not ( = ?auto_755737 ?auto_755746 ) ) ( not ( = ?auto_755737 ?auto_755747 ) ) ( not ( = ?auto_755738 ?auto_755739 ) ) ( not ( = ?auto_755738 ?auto_755740 ) ) ( not ( = ?auto_755738 ?auto_755741 ) ) ( not ( = ?auto_755738 ?auto_755742 ) ) ( not ( = ?auto_755738 ?auto_755743 ) ) ( not ( = ?auto_755738 ?auto_755744 ) ) ( not ( = ?auto_755738 ?auto_755745 ) ) ( not ( = ?auto_755738 ?auto_755746 ) ) ( not ( = ?auto_755738 ?auto_755747 ) ) ( not ( = ?auto_755739 ?auto_755740 ) ) ( not ( = ?auto_755739 ?auto_755741 ) ) ( not ( = ?auto_755739 ?auto_755742 ) ) ( not ( = ?auto_755739 ?auto_755743 ) ) ( not ( = ?auto_755739 ?auto_755744 ) ) ( not ( = ?auto_755739 ?auto_755745 ) ) ( not ( = ?auto_755739 ?auto_755746 ) ) ( not ( = ?auto_755739 ?auto_755747 ) ) ( not ( = ?auto_755740 ?auto_755741 ) ) ( not ( = ?auto_755740 ?auto_755742 ) ) ( not ( = ?auto_755740 ?auto_755743 ) ) ( not ( = ?auto_755740 ?auto_755744 ) ) ( not ( = ?auto_755740 ?auto_755745 ) ) ( not ( = ?auto_755740 ?auto_755746 ) ) ( not ( = ?auto_755740 ?auto_755747 ) ) ( not ( = ?auto_755741 ?auto_755742 ) ) ( not ( = ?auto_755741 ?auto_755743 ) ) ( not ( = ?auto_755741 ?auto_755744 ) ) ( not ( = ?auto_755741 ?auto_755745 ) ) ( not ( = ?auto_755741 ?auto_755746 ) ) ( not ( = ?auto_755741 ?auto_755747 ) ) ( not ( = ?auto_755742 ?auto_755743 ) ) ( not ( = ?auto_755742 ?auto_755744 ) ) ( not ( = ?auto_755742 ?auto_755745 ) ) ( not ( = ?auto_755742 ?auto_755746 ) ) ( not ( = ?auto_755742 ?auto_755747 ) ) ( not ( = ?auto_755743 ?auto_755744 ) ) ( not ( = ?auto_755743 ?auto_755745 ) ) ( not ( = ?auto_755743 ?auto_755746 ) ) ( not ( = ?auto_755743 ?auto_755747 ) ) ( not ( = ?auto_755744 ?auto_755745 ) ) ( not ( = ?auto_755744 ?auto_755746 ) ) ( not ( = ?auto_755744 ?auto_755747 ) ) ( not ( = ?auto_755745 ?auto_755746 ) ) ( not ( = ?auto_755745 ?auto_755747 ) ) ( not ( = ?auto_755746 ?auto_755747 ) ) ( ON ?auto_755745 ?auto_755746 ) ( ON ?auto_755744 ?auto_755745 ) ( ON ?auto_755743 ?auto_755744 ) ( ON ?auto_755742 ?auto_755743 ) ( ON ?auto_755741 ?auto_755742 ) ( ON ?auto_755740 ?auto_755741 ) ( ON ?auto_755739 ?auto_755740 ) ( ON ?auto_755738 ?auto_755739 ) ( ON ?auto_755737 ?auto_755738 ) ( ON ?auto_755736 ?auto_755737 ) ( ON ?auto_755735 ?auto_755736 ) ( ON ?auto_755734 ?auto_755735 ) ( ON ?auto_755733 ?auto_755734 ) ( CLEAR ?auto_755731 ) ( ON ?auto_755732 ?auto_755733 ) ( CLEAR ?auto_755732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_755730 ?auto_755731 ?auto_755732 )
      ( MAKE-17PILE ?auto_755730 ?auto_755731 ?auto_755732 ?auto_755733 ?auto_755734 ?auto_755735 ?auto_755736 ?auto_755737 ?auto_755738 ?auto_755739 ?auto_755740 ?auto_755741 ?auto_755742 ?auto_755743 ?auto_755744 ?auto_755745 ?auto_755746 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755800 - BLOCK
      ?auto_755801 - BLOCK
      ?auto_755802 - BLOCK
      ?auto_755803 - BLOCK
      ?auto_755804 - BLOCK
      ?auto_755805 - BLOCK
      ?auto_755806 - BLOCK
      ?auto_755807 - BLOCK
      ?auto_755808 - BLOCK
      ?auto_755809 - BLOCK
      ?auto_755810 - BLOCK
      ?auto_755811 - BLOCK
      ?auto_755812 - BLOCK
      ?auto_755813 - BLOCK
      ?auto_755814 - BLOCK
      ?auto_755815 - BLOCK
      ?auto_755816 - BLOCK
    )
    :vars
    (
      ?auto_755817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755816 ?auto_755817 ) ( ON-TABLE ?auto_755800 ) ( not ( = ?auto_755800 ?auto_755801 ) ) ( not ( = ?auto_755800 ?auto_755802 ) ) ( not ( = ?auto_755800 ?auto_755803 ) ) ( not ( = ?auto_755800 ?auto_755804 ) ) ( not ( = ?auto_755800 ?auto_755805 ) ) ( not ( = ?auto_755800 ?auto_755806 ) ) ( not ( = ?auto_755800 ?auto_755807 ) ) ( not ( = ?auto_755800 ?auto_755808 ) ) ( not ( = ?auto_755800 ?auto_755809 ) ) ( not ( = ?auto_755800 ?auto_755810 ) ) ( not ( = ?auto_755800 ?auto_755811 ) ) ( not ( = ?auto_755800 ?auto_755812 ) ) ( not ( = ?auto_755800 ?auto_755813 ) ) ( not ( = ?auto_755800 ?auto_755814 ) ) ( not ( = ?auto_755800 ?auto_755815 ) ) ( not ( = ?auto_755800 ?auto_755816 ) ) ( not ( = ?auto_755800 ?auto_755817 ) ) ( not ( = ?auto_755801 ?auto_755802 ) ) ( not ( = ?auto_755801 ?auto_755803 ) ) ( not ( = ?auto_755801 ?auto_755804 ) ) ( not ( = ?auto_755801 ?auto_755805 ) ) ( not ( = ?auto_755801 ?auto_755806 ) ) ( not ( = ?auto_755801 ?auto_755807 ) ) ( not ( = ?auto_755801 ?auto_755808 ) ) ( not ( = ?auto_755801 ?auto_755809 ) ) ( not ( = ?auto_755801 ?auto_755810 ) ) ( not ( = ?auto_755801 ?auto_755811 ) ) ( not ( = ?auto_755801 ?auto_755812 ) ) ( not ( = ?auto_755801 ?auto_755813 ) ) ( not ( = ?auto_755801 ?auto_755814 ) ) ( not ( = ?auto_755801 ?auto_755815 ) ) ( not ( = ?auto_755801 ?auto_755816 ) ) ( not ( = ?auto_755801 ?auto_755817 ) ) ( not ( = ?auto_755802 ?auto_755803 ) ) ( not ( = ?auto_755802 ?auto_755804 ) ) ( not ( = ?auto_755802 ?auto_755805 ) ) ( not ( = ?auto_755802 ?auto_755806 ) ) ( not ( = ?auto_755802 ?auto_755807 ) ) ( not ( = ?auto_755802 ?auto_755808 ) ) ( not ( = ?auto_755802 ?auto_755809 ) ) ( not ( = ?auto_755802 ?auto_755810 ) ) ( not ( = ?auto_755802 ?auto_755811 ) ) ( not ( = ?auto_755802 ?auto_755812 ) ) ( not ( = ?auto_755802 ?auto_755813 ) ) ( not ( = ?auto_755802 ?auto_755814 ) ) ( not ( = ?auto_755802 ?auto_755815 ) ) ( not ( = ?auto_755802 ?auto_755816 ) ) ( not ( = ?auto_755802 ?auto_755817 ) ) ( not ( = ?auto_755803 ?auto_755804 ) ) ( not ( = ?auto_755803 ?auto_755805 ) ) ( not ( = ?auto_755803 ?auto_755806 ) ) ( not ( = ?auto_755803 ?auto_755807 ) ) ( not ( = ?auto_755803 ?auto_755808 ) ) ( not ( = ?auto_755803 ?auto_755809 ) ) ( not ( = ?auto_755803 ?auto_755810 ) ) ( not ( = ?auto_755803 ?auto_755811 ) ) ( not ( = ?auto_755803 ?auto_755812 ) ) ( not ( = ?auto_755803 ?auto_755813 ) ) ( not ( = ?auto_755803 ?auto_755814 ) ) ( not ( = ?auto_755803 ?auto_755815 ) ) ( not ( = ?auto_755803 ?auto_755816 ) ) ( not ( = ?auto_755803 ?auto_755817 ) ) ( not ( = ?auto_755804 ?auto_755805 ) ) ( not ( = ?auto_755804 ?auto_755806 ) ) ( not ( = ?auto_755804 ?auto_755807 ) ) ( not ( = ?auto_755804 ?auto_755808 ) ) ( not ( = ?auto_755804 ?auto_755809 ) ) ( not ( = ?auto_755804 ?auto_755810 ) ) ( not ( = ?auto_755804 ?auto_755811 ) ) ( not ( = ?auto_755804 ?auto_755812 ) ) ( not ( = ?auto_755804 ?auto_755813 ) ) ( not ( = ?auto_755804 ?auto_755814 ) ) ( not ( = ?auto_755804 ?auto_755815 ) ) ( not ( = ?auto_755804 ?auto_755816 ) ) ( not ( = ?auto_755804 ?auto_755817 ) ) ( not ( = ?auto_755805 ?auto_755806 ) ) ( not ( = ?auto_755805 ?auto_755807 ) ) ( not ( = ?auto_755805 ?auto_755808 ) ) ( not ( = ?auto_755805 ?auto_755809 ) ) ( not ( = ?auto_755805 ?auto_755810 ) ) ( not ( = ?auto_755805 ?auto_755811 ) ) ( not ( = ?auto_755805 ?auto_755812 ) ) ( not ( = ?auto_755805 ?auto_755813 ) ) ( not ( = ?auto_755805 ?auto_755814 ) ) ( not ( = ?auto_755805 ?auto_755815 ) ) ( not ( = ?auto_755805 ?auto_755816 ) ) ( not ( = ?auto_755805 ?auto_755817 ) ) ( not ( = ?auto_755806 ?auto_755807 ) ) ( not ( = ?auto_755806 ?auto_755808 ) ) ( not ( = ?auto_755806 ?auto_755809 ) ) ( not ( = ?auto_755806 ?auto_755810 ) ) ( not ( = ?auto_755806 ?auto_755811 ) ) ( not ( = ?auto_755806 ?auto_755812 ) ) ( not ( = ?auto_755806 ?auto_755813 ) ) ( not ( = ?auto_755806 ?auto_755814 ) ) ( not ( = ?auto_755806 ?auto_755815 ) ) ( not ( = ?auto_755806 ?auto_755816 ) ) ( not ( = ?auto_755806 ?auto_755817 ) ) ( not ( = ?auto_755807 ?auto_755808 ) ) ( not ( = ?auto_755807 ?auto_755809 ) ) ( not ( = ?auto_755807 ?auto_755810 ) ) ( not ( = ?auto_755807 ?auto_755811 ) ) ( not ( = ?auto_755807 ?auto_755812 ) ) ( not ( = ?auto_755807 ?auto_755813 ) ) ( not ( = ?auto_755807 ?auto_755814 ) ) ( not ( = ?auto_755807 ?auto_755815 ) ) ( not ( = ?auto_755807 ?auto_755816 ) ) ( not ( = ?auto_755807 ?auto_755817 ) ) ( not ( = ?auto_755808 ?auto_755809 ) ) ( not ( = ?auto_755808 ?auto_755810 ) ) ( not ( = ?auto_755808 ?auto_755811 ) ) ( not ( = ?auto_755808 ?auto_755812 ) ) ( not ( = ?auto_755808 ?auto_755813 ) ) ( not ( = ?auto_755808 ?auto_755814 ) ) ( not ( = ?auto_755808 ?auto_755815 ) ) ( not ( = ?auto_755808 ?auto_755816 ) ) ( not ( = ?auto_755808 ?auto_755817 ) ) ( not ( = ?auto_755809 ?auto_755810 ) ) ( not ( = ?auto_755809 ?auto_755811 ) ) ( not ( = ?auto_755809 ?auto_755812 ) ) ( not ( = ?auto_755809 ?auto_755813 ) ) ( not ( = ?auto_755809 ?auto_755814 ) ) ( not ( = ?auto_755809 ?auto_755815 ) ) ( not ( = ?auto_755809 ?auto_755816 ) ) ( not ( = ?auto_755809 ?auto_755817 ) ) ( not ( = ?auto_755810 ?auto_755811 ) ) ( not ( = ?auto_755810 ?auto_755812 ) ) ( not ( = ?auto_755810 ?auto_755813 ) ) ( not ( = ?auto_755810 ?auto_755814 ) ) ( not ( = ?auto_755810 ?auto_755815 ) ) ( not ( = ?auto_755810 ?auto_755816 ) ) ( not ( = ?auto_755810 ?auto_755817 ) ) ( not ( = ?auto_755811 ?auto_755812 ) ) ( not ( = ?auto_755811 ?auto_755813 ) ) ( not ( = ?auto_755811 ?auto_755814 ) ) ( not ( = ?auto_755811 ?auto_755815 ) ) ( not ( = ?auto_755811 ?auto_755816 ) ) ( not ( = ?auto_755811 ?auto_755817 ) ) ( not ( = ?auto_755812 ?auto_755813 ) ) ( not ( = ?auto_755812 ?auto_755814 ) ) ( not ( = ?auto_755812 ?auto_755815 ) ) ( not ( = ?auto_755812 ?auto_755816 ) ) ( not ( = ?auto_755812 ?auto_755817 ) ) ( not ( = ?auto_755813 ?auto_755814 ) ) ( not ( = ?auto_755813 ?auto_755815 ) ) ( not ( = ?auto_755813 ?auto_755816 ) ) ( not ( = ?auto_755813 ?auto_755817 ) ) ( not ( = ?auto_755814 ?auto_755815 ) ) ( not ( = ?auto_755814 ?auto_755816 ) ) ( not ( = ?auto_755814 ?auto_755817 ) ) ( not ( = ?auto_755815 ?auto_755816 ) ) ( not ( = ?auto_755815 ?auto_755817 ) ) ( not ( = ?auto_755816 ?auto_755817 ) ) ( ON ?auto_755815 ?auto_755816 ) ( ON ?auto_755814 ?auto_755815 ) ( ON ?auto_755813 ?auto_755814 ) ( ON ?auto_755812 ?auto_755813 ) ( ON ?auto_755811 ?auto_755812 ) ( ON ?auto_755810 ?auto_755811 ) ( ON ?auto_755809 ?auto_755810 ) ( ON ?auto_755808 ?auto_755809 ) ( ON ?auto_755807 ?auto_755808 ) ( ON ?auto_755806 ?auto_755807 ) ( ON ?auto_755805 ?auto_755806 ) ( ON ?auto_755804 ?auto_755805 ) ( ON ?auto_755803 ?auto_755804 ) ( ON ?auto_755802 ?auto_755803 ) ( CLEAR ?auto_755800 ) ( ON ?auto_755801 ?auto_755802 ) ( CLEAR ?auto_755801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_755800 ?auto_755801 )
      ( MAKE-17PILE ?auto_755800 ?auto_755801 ?auto_755802 ?auto_755803 ?auto_755804 ?auto_755805 ?auto_755806 ?auto_755807 ?auto_755808 ?auto_755809 ?auto_755810 ?auto_755811 ?auto_755812 ?auto_755813 ?auto_755814 ?auto_755815 ?auto_755816 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_755870 - BLOCK
      ?auto_755871 - BLOCK
      ?auto_755872 - BLOCK
      ?auto_755873 - BLOCK
      ?auto_755874 - BLOCK
      ?auto_755875 - BLOCK
      ?auto_755876 - BLOCK
      ?auto_755877 - BLOCK
      ?auto_755878 - BLOCK
      ?auto_755879 - BLOCK
      ?auto_755880 - BLOCK
      ?auto_755881 - BLOCK
      ?auto_755882 - BLOCK
      ?auto_755883 - BLOCK
      ?auto_755884 - BLOCK
      ?auto_755885 - BLOCK
      ?auto_755886 - BLOCK
    )
    :vars
    (
      ?auto_755887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_755886 ?auto_755887 ) ( not ( = ?auto_755870 ?auto_755871 ) ) ( not ( = ?auto_755870 ?auto_755872 ) ) ( not ( = ?auto_755870 ?auto_755873 ) ) ( not ( = ?auto_755870 ?auto_755874 ) ) ( not ( = ?auto_755870 ?auto_755875 ) ) ( not ( = ?auto_755870 ?auto_755876 ) ) ( not ( = ?auto_755870 ?auto_755877 ) ) ( not ( = ?auto_755870 ?auto_755878 ) ) ( not ( = ?auto_755870 ?auto_755879 ) ) ( not ( = ?auto_755870 ?auto_755880 ) ) ( not ( = ?auto_755870 ?auto_755881 ) ) ( not ( = ?auto_755870 ?auto_755882 ) ) ( not ( = ?auto_755870 ?auto_755883 ) ) ( not ( = ?auto_755870 ?auto_755884 ) ) ( not ( = ?auto_755870 ?auto_755885 ) ) ( not ( = ?auto_755870 ?auto_755886 ) ) ( not ( = ?auto_755870 ?auto_755887 ) ) ( not ( = ?auto_755871 ?auto_755872 ) ) ( not ( = ?auto_755871 ?auto_755873 ) ) ( not ( = ?auto_755871 ?auto_755874 ) ) ( not ( = ?auto_755871 ?auto_755875 ) ) ( not ( = ?auto_755871 ?auto_755876 ) ) ( not ( = ?auto_755871 ?auto_755877 ) ) ( not ( = ?auto_755871 ?auto_755878 ) ) ( not ( = ?auto_755871 ?auto_755879 ) ) ( not ( = ?auto_755871 ?auto_755880 ) ) ( not ( = ?auto_755871 ?auto_755881 ) ) ( not ( = ?auto_755871 ?auto_755882 ) ) ( not ( = ?auto_755871 ?auto_755883 ) ) ( not ( = ?auto_755871 ?auto_755884 ) ) ( not ( = ?auto_755871 ?auto_755885 ) ) ( not ( = ?auto_755871 ?auto_755886 ) ) ( not ( = ?auto_755871 ?auto_755887 ) ) ( not ( = ?auto_755872 ?auto_755873 ) ) ( not ( = ?auto_755872 ?auto_755874 ) ) ( not ( = ?auto_755872 ?auto_755875 ) ) ( not ( = ?auto_755872 ?auto_755876 ) ) ( not ( = ?auto_755872 ?auto_755877 ) ) ( not ( = ?auto_755872 ?auto_755878 ) ) ( not ( = ?auto_755872 ?auto_755879 ) ) ( not ( = ?auto_755872 ?auto_755880 ) ) ( not ( = ?auto_755872 ?auto_755881 ) ) ( not ( = ?auto_755872 ?auto_755882 ) ) ( not ( = ?auto_755872 ?auto_755883 ) ) ( not ( = ?auto_755872 ?auto_755884 ) ) ( not ( = ?auto_755872 ?auto_755885 ) ) ( not ( = ?auto_755872 ?auto_755886 ) ) ( not ( = ?auto_755872 ?auto_755887 ) ) ( not ( = ?auto_755873 ?auto_755874 ) ) ( not ( = ?auto_755873 ?auto_755875 ) ) ( not ( = ?auto_755873 ?auto_755876 ) ) ( not ( = ?auto_755873 ?auto_755877 ) ) ( not ( = ?auto_755873 ?auto_755878 ) ) ( not ( = ?auto_755873 ?auto_755879 ) ) ( not ( = ?auto_755873 ?auto_755880 ) ) ( not ( = ?auto_755873 ?auto_755881 ) ) ( not ( = ?auto_755873 ?auto_755882 ) ) ( not ( = ?auto_755873 ?auto_755883 ) ) ( not ( = ?auto_755873 ?auto_755884 ) ) ( not ( = ?auto_755873 ?auto_755885 ) ) ( not ( = ?auto_755873 ?auto_755886 ) ) ( not ( = ?auto_755873 ?auto_755887 ) ) ( not ( = ?auto_755874 ?auto_755875 ) ) ( not ( = ?auto_755874 ?auto_755876 ) ) ( not ( = ?auto_755874 ?auto_755877 ) ) ( not ( = ?auto_755874 ?auto_755878 ) ) ( not ( = ?auto_755874 ?auto_755879 ) ) ( not ( = ?auto_755874 ?auto_755880 ) ) ( not ( = ?auto_755874 ?auto_755881 ) ) ( not ( = ?auto_755874 ?auto_755882 ) ) ( not ( = ?auto_755874 ?auto_755883 ) ) ( not ( = ?auto_755874 ?auto_755884 ) ) ( not ( = ?auto_755874 ?auto_755885 ) ) ( not ( = ?auto_755874 ?auto_755886 ) ) ( not ( = ?auto_755874 ?auto_755887 ) ) ( not ( = ?auto_755875 ?auto_755876 ) ) ( not ( = ?auto_755875 ?auto_755877 ) ) ( not ( = ?auto_755875 ?auto_755878 ) ) ( not ( = ?auto_755875 ?auto_755879 ) ) ( not ( = ?auto_755875 ?auto_755880 ) ) ( not ( = ?auto_755875 ?auto_755881 ) ) ( not ( = ?auto_755875 ?auto_755882 ) ) ( not ( = ?auto_755875 ?auto_755883 ) ) ( not ( = ?auto_755875 ?auto_755884 ) ) ( not ( = ?auto_755875 ?auto_755885 ) ) ( not ( = ?auto_755875 ?auto_755886 ) ) ( not ( = ?auto_755875 ?auto_755887 ) ) ( not ( = ?auto_755876 ?auto_755877 ) ) ( not ( = ?auto_755876 ?auto_755878 ) ) ( not ( = ?auto_755876 ?auto_755879 ) ) ( not ( = ?auto_755876 ?auto_755880 ) ) ( not ( = ?auto_755876 ?auto_755881 ) ) ( not ( = ?auto_755876 ?auto_755882 ) ) ( not ( = ?auto_755876 ?auto_755883 ) ) ( not ( = ?auto_755876 ?auto_755884 ) ) ( not ( = ?auto_755876 ?auto_755885 ) ) ( not ( = ?auto_755876 ?auto_755886 ) ) ( not ( = ?auto_755876 ?auto_755887 ) ) ( not ( = ?auto_755877 ?auto_755878 ) ) ( not ( = ?auto_755877 ?auto_755879 ) ) ( not ( = ?auto_755877 ?auto_755880 ) ) ( not ( = ?auto_755877 ?auto_755881 ) ) ( not ( = ?auto_755877 ?auto_755882 ) ) ( not ( = ?auto_755877 ?auto_755883 ) ) ( not ( = ?auto_755877 ?auto_755884 ) ) ( not ( = ?auto_755877 ?auto_755885 ) ) ( not ( = ?auto_755877 ?auto_755886 ) ) ( not ( = ?auto_755877 ?auto_755887 ) ) ( not ( = ?auto_755878 ?auto_755879 ) ) ( not ( = ?auto_755878 ?auto_755880 ) ) ( not ( = ?auto_755878 ?auto_755881 ) ) ( not ( = ?auto_755878 ?auto_755882 ) ) ( not ( = ?auto_755878 ?auto_755883 ) ) ( not ( = ?auto_755878 ?auto_755884 ) ) ( not ( = ?auto_755878 ?auto_755885 ) ) ( not ( = ?auto_755878 ?auto_755886 ) ) ( not ( = ?auto_755878 ?auto_755887 ) ) ( not ( = ?auto_755879 ?auto_755880 ) ) ( not ( = ?auto_755879 ?auto_755881 ) ) ( not ( = ?auto_755879 ?auto_755882 ) ) ( not ( = ?auto_755879 ?auto_755883 ) ) ( not ( = ?auto_755879 ?auto_755884 ) ) ( not ( = ?auto_755879 ?auto_755885 ) ) ( not ( = ?auto_755879 ?auto_755886 ) ) ( not ( = ?auto_755879 ?auto_755887 ) ) ( not ( = ?auto_755880 ?auto_755881 ) ) ( not ( = ?auto_755880 ?auto_755882 ) ) ( not ( = ?auto_755880 ?auto_755883 ) ) ( not ( = ?auto_755880 ?auto_755884 ) ) ( not ( = ?auto_755880 ?auto_755885 ) ) ( not ( = ?auto_755880 ?auto_755886 ) ) ( not ( = ?auto_755880 ?auto_755887 ) ) ( not ( = ?auto_755881 ?auto_755882 ) ) ( not ( = ?auto_755881 ?auto_755883 ) ) ( not ( = ?auto_755881 ?auto_755884 ) ) ( not ( = ?auto_755881 ?auto_755885 ) ) ( not ( = ?auto_755881 ?auto_755886 ) ) ( not ( = ?auto_755881 ?auto_755887 ) ) ( not ( = ?auto_755882 ?auto_755883 ) ) ( not ( = ?auto_755882 ?auto_755884 ) ) ( not ( = ?auto_755882 ?auto_755885 ) ) ( not ( = ?auto_755882 ?auto_755886 ) ) ( not ( = ?auto_755882 ?auto_755887 ) ) ( not ( = ?auto_755883 ?auto_755884 ) ) ( not ( = ?auto_755883 ?auto_755885 ) ) ( not ( = ?auto_755883 ?auto_755886 ) ) ( not ( = ?auto_755883 ?auto_755887 ) ) ( not ( = ?auto_755884 ?auto_755885 ) ) ( not ( = ?auto_755884 ?auto_755886 ) ) ( not ( = ?auto_755884 ?auto_755887 ) ) ( not ( = ?auto_755885 ?auto_755886 ) ) ( not ( = ?auto_755885 ?auto_755887 ) ) ( not ( = ?auto_755886 ?auto_755887 ) ) ( ON ?auto_755885 ?auto_755886 ) ( ON ?auto_755884 ?auto_755885 ) ( ON ?auto_755883 ?auto_755884 ) ( ON ?auto_755882 ?auto_755883 ) ( ON ?auto_755881 ?auto_755882 ) ( ON ?auto_755880 ?auto_755881 ) ( ON ?auto_755879 ?auto_755880 ) ( ON ?auto_755878 ?auto_755879 ) ( ON ?auto_755877 ?auto_755878 ) ( ON ?auto_755876 ?auto_755877 ) ( ON ?auto_755875 ?auto_755876 ) ( ON ?auto_755874 ?auto_755875 ) ( ON ?auto_755873 ?auto_755874 ) ( ON ?auto_755872 ?auto_755873 ) ( ON ?auto_755871 ?auto_755872 ) ( ON ?auto_755870 ?auto_755871 ) ( CLEAR ?auto_755870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_755870 )
      ( MAKE-17PILE ?auto_755870 ?auto_755871 ?auto_755872 ?auto_755873 ?auto_755874 ?auto_755875 ?auto_755876 ?auto_755877 ?auto_755878 ?auto_755879 ?auto_755880 ?auto_755881 ?auto_755882 ?auto_755883 ?auto_755884 ?auto_755885 ?auto_755886 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_755941 - BLOCK
      ?auto_755942 - BLOCK
      ?auto_755943 - BLOCK
      ?auto_755944 - BLOCK
      ?auto_755945 - BLOCK
      ?auto_755946 - BLOCK
      ?auto_755947 - BLOCK
      ?auto_755948 - BLOCK
      ?auto_755949 - BLOCK
      ?auto_755950 - BLOCK
      ?auto_755951 - BLOCK
      ?auto_755952 - BLOCK
      ?auto_755953 - BLOCK
      ?auto_755954 - BLOCK
      ?auto_755955 - BLOCK
      ?auto_755956 - BLOCK
      ?auto_755957 - BLOCK
      ?auto_755958 - BLOCK
    )
    :vars
    (
      ?auto_755959 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_755957 ) ( ON ?auto_755958 ?auto_755959 ) ( CLEAR ?auto_755958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_755941 ) ( ON ?auto_755942 ?auto_755941 ) ( ON ?auto_755943 ?auto_755942 ) ( ON ?auto_755944 ?auto_755943 ) ( ON ?auto_755945 ?auto_755944 ) ( ON ?auto_755946 ?auto_755945 ) ( ON ?auto_755947 ?auto_755946 ) ( ON ?auto_755948 ?auto_755947 ) ( ON ?auto_755949 ?auto_755948 ) ( ON ?auto_755950 ?auto_755949 ) ( ON ?auto_755951 ?auto_755950 ) ( ON ?auto_755952 ?auto_755951 ) ( ON ?auto_755953 ?auto_755952 ) ( ON ?auto_755954 ?auto_755953 ) ( ON ?auto_755955 ?auto_755954 ) ( ON ?auto_755956 ?auto_755955 ) ( ON ?auto_755957 ?auto_755956 ) ( not ( = ?auto_755941 ?auto_755942 ) ) ( not ( = ?auto_755941 ?auto_755943 ) ) ( not ( = ?auto_755941 ?auto_755944 ) ) ( not ( = ?auto_755941 ?auto_755945 ) ) ( not ( = ?auto_755941 ?auto_755946 ) ) ( not ( = ?auto_755941 ?auto_755947 ) ) ( not ( = ?auto_755941 ?auto_755948 ) ) ( not ( = ?auto_755941 ?auto_755949 ) ) ( not ( = ?auto_755941 ?auto_755950 ) ) ( not ( = ?auto_755941 ?auto_755951 ) ) ( not ( = ?auto_755941 ?auto_755952 ) ) ( not ( = ?auto_755941 ?auto_755953 ) ) ( not ( = ?auto_755941 ?auto_755954 ) ) ( not ( = ?auto_755941 ?auto_755955 ) ) ( not ( = ?auto_755941 ?auto_755956 ) ) ( not ( = ?auto_755941 ?auto_755957 ) ) ( not ( = ?auto_755941 ?auto_755958 ) ) ( not ( = ?auto_755941 ?auto_755959 ) ) ( not ( = ?auto_755942 ?auto_755943 ) ) ( not ( = ?auto_755942 ?auto_755944 ) ) ( not ( = ?auto_755942 ?auto_755945 ) ) ( not ( = ?auto_755942 ?auto_755946 ) ) ( not ( = ?auto_755942 ?auto_755947 ) ) ( not ( = ?auto_755942 ?auto_755948 ) ) ( not ( = ?auto_755942 ?auto_755949 ) ) ( not ( = ?auto_755942 ?auto_755950 ) ) ( not ( = ?auto_755942 ?auto_755951 ) ) ( not ( = ?auto_755942 ?auto_755952 ) ) ( not ( = ?auto_755942 ?auto_755953 ) ) ( not ( = ?auto_755942 ?auto_755954 ) ) ( not ( = ?auto_755942 ?auto_755955 ) ) ( not ( = ?auto_755942 ?auto_755956 ) ) ( not ( = ?auto_755942 ?auto_755957 ) ) ( not ( = ?auto_755942 ?auto_755958 ) ) ( not ( = ?auto_755942 ?auto_755959 ) ) ( not ( = ?auto_755943 ?auto_755944 ) ) ( not ( = ?auto_755943 ?auto_755945 ) ) ( not ( = ?auto_755943 ?auto_755946 ) ) ( not ( = ?auto_755943 ?auto_755947 ) ) ( not ( = ?auto_755943 ?auto_755948 ) ) ( not ( = ?auto_755943 ?auto_755949 ) ) ( not ( = ?auto_755943 ?auto_755950 ) ) ( not ( = ?auto_755943 ?auto_755951 ) ) ( not ( = ?auto_755943 ?auto_755952 ) ) ( not ( = ?auto_755943 ?auto_755953 ) ) ( not ( = ?auto_755943 ?auto_755954 ) ) ( not ( = ?auto_755943 ?auto_755955 ) ) ( not ( = ?auto_755943 ?auto_755956 ) ) ( not ( = ?auto_755943 ?auto_755957 ) ) ( not ( = ?auto_755943 ?auto_755958 ) ) ( not ( = ?auto_755943 ?auto_755959 ) ) ( not ( = ?auto_755944 ?auto_755945 ) ) ( not ( = ?auto_755944 ?auto_755946 ) ) ( not ( = ?auto_755944 ?auto_755947 ) ) ( not ( = ?auto_755944 ?auto_755948 ) ) ( not ( = ?auto_755944 ?auto_755949 ) ) ( not ( = ?auto_755944 ?auto_755950 ) ) ( not ( = ?auto_755944 ?auto_755951 ) ) ( not ( = ?auto_755944 ?auto_755952 ) ) ( not ( = ?auto_755944 ?auto_755953 ) ) ( not ( = ?auto_755944 ?auto_755954 ) ) ( not ( = ?auto_755944 ?auto_755955 ) ) ( not ( = ?auto_755944 ?auto_755956 ) ) ( not ( = ?auto_755944 ?auto_755957 ) ) ( not ( = ?auto_755944 ?auto_755958 ) ) ( not ( = ?auto_755944 ?auto_755959 ) ) ( not ( = ?auto_755945 ?auto_755946 ) ) ( not ( = ?auto_755945 ?auto_755947 ) ) ( not ( = ?auto_755945 ?auto_755948 ) ) ( not ( = ?auto_755945 ?auto_755949 ) ) ( not ( = ?auto_755945 ?auto_755950 ) ) ( not ( = ?auto_755945 ?auto_755951 ) ) ( not ( = ?auto_755945 ?auto_755952 ) ) ( not ( = ?auto_755945 ?auto_755953 ) ) ( not ( = ?auto_755945 ?auto_755954 ) ) ( not ( = ?auto_755945 ?auto_755955 ) ) ( not ( = ?auto_755945 ?auto_755956 ) ) ( not ( = ?auto_755945 ?auto_755957 ) ) ( not ( = ?auto_755945 ?auto_755958 ) ) ( not ( = ?auto_755945 ?auto_755959 ) ) ( not ( = ?auto_755946 ?auto_755947 ) ) ( not ( = ?auto_755946 ?auto_755948 ) ) ( not ( = ?auto_755946 ?auto_755949 ) ) ( not ( = ?auto_755946 ?auto_755950 ) ) ( not ( = ?auto_755946 ?auto_755951 ) ) ( not ( = ?auto_755946 ?auto_755952 ) ) ( not ( = ?auto_755946 ?auto_755953 ) ) ( not ( = ?auto_755946 ?auto_755954 ) ) ( not ( = ?auto_755946 ?auto_755955 ) ) ( not ( = ?auto_755946 ?auto_755956 ) ) ( not ( = ?auto_755946 ?auto_755957 ) ) ( not ( = ?auto_755946 ?auto_755958 ) ) ( not ( = ?auto_755946 ?auto_755959 ) ) ( not ( = ?auto_755947 ?auto_755948 ) ) ( not ( = ?auto_755947 ?auto_755949 ) ) ( not ( = ?auto_755947 ?auto_755950 ) ) ( not ( = ?auto_755947 ?auto_755951 ) ) ( not ( = ?auto_755947 ?auto_755952 ) ) ( not ( = ?auto_755947 ?auto_755953 ) ) ( not ( = ?auto_755947 ?auto_755954 ) ) ( not ( = ?auto_755947 ?auto_755955 ) ) ( not ( = ?auto_755947 ?auto_755956 ) ) ( not ( = ?auto_755947 ?auto_755957 ) ) ( not ( = ?auto_755947 ?auto_755958 ) ) ( not ( = ?auto_755947 ?auto_755959 ) ) ( not ( = ?auto_755948 ?auto_755949 ) ) ( not ( = ?auto_755948 ?auto_755950 ) ) ( not ( = ?auto_755948 ?auto_755951 ) ) ( not ( = ?auto_755948 ?auto_755952 ) ) ( not ( = ?auto_755948 ?auto_755953 ) ) ( not ( = ?auto_755948 ?auto_755954 ) ) ( not ( = ?auto_755948 ?auto_755955 ) ) ( not ( = ?auto_755948 ?auto_755956 ) ) ( not ( = ?auto_755948 ?auto_755957 ) ) ( not ( = ?auto_755948 ?auto_755958 ) ) ( not ( = ?auto_755948 ?auto_755959 ) ) ( not ( = ?auto_755949 ?auto_755950 ) ) ( not ( = ?auto_755949 ?auto_755951 ) ) ( not ( = ?auto_755949 ?auto_755952 ) ) ( not ( = ?auto_755949 ?auto_755953 ) ) ( not ( = ?auto_755949 ?auto_755954 ) ) ( not ( = ?auto_755949 ?auto_755955 ) ) ( not ( = ?auto_755949 ?auto_755956 ) ) ( not ( = ?auto_755949 ?auto_755957 ) ) ( not ( = ?auto_755949 ?auto_755958 ) ) ( not ( = ?auto_755949 ?auto_755959 ) ) ( not ( = ?auto_755950 ?auto_755951 ) ) ( not ( = ?auto_755950 ?auto_755952 ) ) ( not ( = ?auto_755950 ?auto_755953 ) ) ( not ( = ?auto_755950 ?auto_755954 ) ) ( not ( = ?auto_755950 ?auto_755955 ) ) ( not ( = ?auto_755950 ?auto_755956 ) ) ( not ( = ?auto_755950 ?auto_755957 ) ) ( not ( = ?auto_755950 ?auto_755958 ) ) ( not ( = ?auto_755950 ?auto_755959 ) ) ( not ( = ?auto_755951 ?auto_755952 ) ) ( not ( = ?auto_755951 ?auto_755953 ) ) ( not ( = ?auto_755951 ?auto_755954 ) ) ( not ( = ?auto_755951 ?auto_755955 ) ) ( not ( = ?auto_755951 ?auto_755956 ) ) ( not ( = ?auto_755951 ?auto_755957 ) ) ( not ( = ?auto_755951 ?auto_755958 ) ) ( not ( = ?auto_755951 ?auto_755959 ) ) ( not ( = ?auto_755952 ?auto_755953 ) ) ( not ( = ?auto_755952 ?auto_755954 ) ) ( not ( = ?auto_755952 ?auto_755955 ) ) ( not ( = ?auto_755952 ?auto_755956 ) ) ( not ( = ?auto_755952 ?auto_755957 ) ) ( not ( = ?auto_755952 ?auto_755958 ) ) ( not ( = ?auto_755952 ?auto_755959 ) ) ( not ( = ?auto_755953 ?auto_755954 ) ) ( not ( = ?auto_755953 ?auto_755955 ) ) ( not ( = ?auto_755953 ?auto_755956 ) ) ( not ( = ?auto_755953 ?auto_755957 ) ) ( not ( = ?auto_755953 ?auto_755958 ) ) ( not ( = ?auto_755953 ?auto_755959 ) ) ( not ( = ?auto_755954 ?auto_755955 ) ) ( not ( = ?auto_755954 ?auto_755956 ) ) ( not ( = ?auto_755954 ?auto_755957 ) ) ( not ( = ?auto_755954 ?auto_755958 ) ) ( not ( = ?auto_755954 ?auto_755959 ) ) ( not ( = ?auto_755955 ?auto_755956 ) ) ( not ( = ?auto_755955 ?auto_755957 ) ) ( not ( = ?auto_755955 ?auto_755958 ) ) ( not ( = ?auto_755955 ?auto_755959 ) ) ( not ( = ?auto_755956 ?auto_755957 ) ) ( not ( = ?auto_755956 ?auto_755958 ) ) ( not ( = ?auto_755956 ?auto_755959 ) ) ( not ( = ?auto_755957 ?auto_755958 ) ) ( not ( = ?auto_755957 ?auto_755959 ) ) ( not ( = ?auto_755958 ?auto_755959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_755958 ?auto_755959 )
      ( !STACK ?auto_755958 ?auto_755957 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_755978 - BLOCK
      ?auto_755979 - BLOCK
      ?auto_755980 - BLOCK
      ?auto_755981 - BLOCK
      ?auto_755982 - BLOCK
      ?auto_755983 - BLOCK
      ?auto_755984 - BLOCK
      ?auto_755985 - BLOCK
      ?auto_755986 - BLOCK
      ?auto_755987 - BLOCK
      ?auto_755988 - BLOCK
      ?auto_755989 - BLOCK
      ?auto_755990 - BLOCK
      ?auto_755991 - BLOCK
      ?auto_755992 - BLOCK
      ?auto_755993 - BLOCK
      ?auto_755994 - BLOCK
      ?auto_755995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_755994 ) ( ON-TABLE ?auto_755995 ) ( CLEAR ?auto_755995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_755978 ) ( ON ?auto_755979 ?auto_755978 ) ( ON ?auto_755980 ?auto_755979 ) ( ON ?auto_755981 ?auto_755980 ) ( ON ?auto_755982 ?auto_755981 ) ( ON ?auto_755983 ?auto_755982 ) ( ON ?auto_755984 ?auto_755983 ) ( ON ?auto_755985 ?auto_755984 ) ( ON ?auto_755986 ?auto_755985 ) ( ON ?auto_755987 ?auto_755986 ) ( ON ?auto_755988 ?auto_755987 ) ( ON ?auto_755989 ?auto_755988 ) ( ON ?auto_755990 ?auto_755989 ) ( ON ?auto_755991 ?auto_755990 ) ( ON ?auto_755992 ?auto_755991 ) ( ON ?auto_755993 ?auto_755992 ) ( ON ?auto_755994 ?auto_755993 ) ( not ( = ?auto_755978 ?auto_755979 ) ) ( not ( = ?auto_755978 ?auto_755980 ) ) ( not ( = ?auto_755978 ?auto_755981 ) ) ( not ( = ?auto_755978 ?auto_755982 ) ) ( not ( = ?auto_755978 ?auto_755983 ) ) ( not ( = ?auto_755978 ?auto_755984 ) ) ( not ( = ?auto_755978 ?auto_755985 ) ) ( not ( = ?auto_755978 ?auto_755986 ) ) ( not ( = ?auto_755978 ?auto_755987 ) ) ( not ( = ?auto_755978 ?auto_755988 ) ) ( not ( = ?auto_755978 ?auto_755989 ) ) ( not ( = ?auto_755978 ?auto_755990 ) ) ( not ( = ?auto_755978 ?auto_755991 ) ) ( not ( = ?auto_755978 ?auto_755992 ) ) ( not ( = ?auto_755978 ?auto_755993 ) ) ( not ( = ?auto_755978 ?auto_755994 ) ) ( not ( = ?auto_755978 ?auto_755995 ) ) ( not ( = ?auto_755979 ?auto_755980 ) ) ( not ( = ?auto_755979 ?auto_755981 ) ) ( not ( = ?auto_755979 ?auto_755982 ) ) ( not ( = ?auto_755979 ?auto_755983 ) ) ( not ( = ?auto_755979 ?auto_755984 ) ) ( not ( = ?auto_755979 ?auto_755985 ) ) ( not ( = ?auto_755979 ?auto_755986 ) ) ( not ( = ?auto_755979 ?auto_755987 ) ) ( not ( = ?auto_755979 ?auto_755988 ) ) ( not ( = ?auto_755979 ?auto_755989 ) ) ( not ( = ?auto_755979 ?auto_755990 ) ) ( not ( = ?auto_755979 ?auto_755991 ) ) ( not ( = ?auto_755979 ?auto_755992 ) ) ( not ( = ?auto_755979 ?auto_755993 ) ) ( not ( = ?auto_755979 ?auto_755994 ) ) ( not ( = ?auto_755979 ?auto_755995 ) ) ( not ( = ?auto_755980 ?auto_755981 ) ) ( not ( = ?auto_755980 ?auto_755982 ) ) ( not ( = ?auto_755980 ?auto_755983 ) ) ( not ( = ?auto_755980 ?auto_755984 ) ) ( not ( = ?auto_755980 ?auto_755985 ) ) ( not ( = ?auto_755980 ?auto_755986 ) ) ( not ( = ?auto_755980 ?auto_755987 ) ) ( not ( = ?auto_755980 ?auto_755988 ) ) ( not ( = ?auto_755980 ?auto_755989 ) ) ( not ( = ?auto_755980 ?auto_755990 ) ) ( not ( = ?auto_755980 ?auto_755991 ) ) ( not ( = ?auto_755980 ?auto_755992 ) ) ( not ( = ?auto_755980 ?auto_755993 ) ) ( not ( = ?auto_755980 ?auto_755994 ) ) ( not ( = ?auto_755980 ?auto_755995 ) ) ( not ( = ?auto_755981 ?auto_755982 ) ) ( not ( = ?auto_755981 ?auto_755983 ) ) ( not ( = ?auto_755981 ?auto_755984 ) ) ( not ( = ?auto_755981 ?auto_755985 ) ) ( not ( = ?auto_755981 ?auto_755986 ) ) ( not ( = ?auto_755981 ?auto_755987 ) ) ( not ( = ?auto_755981 ?auto_755988 ) ) ( not ( = ?auto_755981 ?auto_755989 ) ) ( not ( = ?auto_755981 ?auto_755990 ) ) ( not ( = ?auto_755981 ?auto_755991 ) ) ( not ( = ?auto_755981 ?auto_755992 ) ) ( not ( = ?auto_755981 ?auto_755993 ) ) ( not ( = ?auto_755981 ?auto_755994 ) ) ( not ( = ?auto_755981 ?auto_755995 ) ) ( not ( = ?auto_755982 ?auto_755983 ) ) ( not ( = ?auto_755982 ?auto_755984 ) ) ( not ( = ?auto_755982 ?auto_755985 ) ) ( not ( = ?auto_755982 ?auto_755986 ) ) ( not ( = ?auto_755982 ?auto_755987 ) ) ( not ( = ?auto_755982 ?auto_755988 ) ) ( not ( = ?auto_755982 ?auto_755989 ) ) ( not ( = ?auto_755982 ?auto_755990 ) ) ( not ( = ?auto_755982 ?auto_755991 ) ) ( not ( = ?auto_755982 ?auto_755992 ) ) ( not ( = ?auto_755982 ?auto_755993 ) ) ( not ( = ?auto_755982 ?auto_755994 ) ) ( not ( = ?auto_755982 ?auto_755995 ) ) ( not ( = ?auto_755983 ?auto_755984 ) ) ( not ( = ?auto_755983 ?auto_755985 ) ) ( not ( = ?auto_755983 ?auto_755986 ) ) ( not ( = ?auto_755983 ?auto_755987 ) ) ( not ( = ?auto_755983 ?auto_755988 ) ) ( not ( = ?auto_755983 ?auto_755989 ) ) ( not ( = ?auto_755983 ?auto_755990 ) ) ( not ( = ?auto_755983 ?auto_755991 ) ) ( not ( = ?auto_755983 ?auto_755992 ) ) ( not ( = ?auto_755983 ?auto_755993 ) ) ( not ( = ?auto_755983 ?auto_755994 ) ) ( not ( = ?auto_755983 ?auto_755995 ) ) ( not ( = ?auto_755984 ?auto_755985 ) ) ( not ( = ?auto_755984 ?auto_755986 ) ) ( not ( = ?auto_755984 ?auto_755987 ) ) ( not ( = ?auto_755984 ?auto_755988 ) ) ( not ( = ?auto_755984 ?auto_755989 ) ) ( not ( = ?auto_755984 ?auto_755990 ) ) ( not ( = ?auto_755984 ?auto_755991 ) ) ( not ( = ?auto_755984 ?auto_755992 ) ) ( not ( = ?auto_755984 ?auto_755993 ) ) ( not ( = ?auto_755984 ?auto_755994 ) ) ( not ( = ?auto_755984 ?auto_755995 ) ) ( not ( = ?auto_755985 ?auto_755986 ) ) ( not ( = ?auto_755985 ?auto_755987 ) ) ( not ( = ?auto_755985 ?auto_755988 ) ) ( not ( = ?auto_755985 ?auto_755989 ) ) ( not ( = ?auto_755985 ?auto_755990 ) ) ( not ( = ?auto_755985 ?auto_755991 ) ) ( not ( = ?auto_755985 ?auto_755992 ) ) ( not ( = ?auto_755985 ?auto_755993 ) ) ( not ( = ?auto_755985 ?auto_755994 ) ) ( not ( = ?auto_755985 ?auto_755995 ) ) ( not ( = ?auto_755986 ?auto_755987 ) ) ( not ( = ?auto_755986 ?auto_755988 ) ) ( not ( = ?auto_755986 ?auto_755989 ) ) ( not ( = ?auto_755986 ?auto_755990 ) ) ( not ( = ?auto_755986 ?auto_755991 ) ) ( not ( = ?auto_755986 ?auto_755992 ) ) ( not ( = ?auto_755986 ?auto_755993 ) ) ( not ( = ?auto_755986 ?auto_755994 ) ) ( not ( = ?auto_755986 ?auto_755995 ) ) ( not ( = ?auto_755987 ?auto_755988 ) ) ( not ( = ?auto_755987 ?auto_755989 ) ) ( not ( = ?auto_755987 ?auto_755990 ) ) ( not ( = ?auto_755987 ?auto_755991 ) ) ( not ( = ?auto_755987 ?auto_755992 ) ) ( not ( = ?auto_755987 ?auto_755993 ) ) ( not ( = ?auto_755987 ?auto_755994 ) ) ( not ( = ?auto_755987 ?auto_755995 ) ) ( not ( = ?auto_755988 ?auto_755989 ) ) ( not ( = ?auto_755988 ?auto_755990 ) ) ( not ( = ?auto_755988 ?auto_755991 ) ) ( not ( = ?auto_755988 ?auto_755992 ) ) ( not ( = ?auto_755988 ?auto_755993 ) ) ( not ( = ?auto_755988 ?auto_755994 ) ) ( not ( = ?auto_755988 ?auto_755995 ) ) ( not ( = ?auto_755989 ?auto_755990 ) ) ( not ( = ?auto_755989 ?auto_755991 ) ) ( not ( = ?auto_755989 ?auto_755992 ) ) ( not ( = ?auto_755989 ?auto_755993 ) ) ( not ( = ?auto_755989 ?auto_755994 ) ) ( not ( = ?auto_755989 ?auto_755995 ) ) ( not ( = ?auto_755990 ?auto_755991 ) ) ( not ( = ?auto_755990 ?auto_755992 ) ) ( not ( = ?auto_755990 ?auto_755993 ) ) ( not ( = ?auto_755990 ?auto_755994 ) ) ( not ( = ?auto_755990 ?auto_755995 ) ) ( not ( = ?auto_755991 ?auto_755992 ) ) ( not ( = ?auto_755991 ?auto_755993 ) ) ( not ( = ?auto_755991 ?auto_755994 ) ) ( not ( = ?auto_755991 ?auto_755995 ) ) ( not ( = ?auto_755992 ?auto_755993 ) ) ( not ( = ?auto_755992 ?auto_755994 ) ) ( not ( = ?auto_755992 ?auto_755995 ) ) ( not ( = ?auto_755993 ?auto_755994 ) ) ( not ( = ?auto_755993 ?auto_755995 ) ) ( not ( = ?auto_755994 ?auto_755995 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_755995 )
      ( !STACK ?auto_755995 ?auto_755994 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756014 - BLOCK
      ?auto_756015 - BLOCK
      ?auto_756016 - BLOCK
      ?auto_756017 - BLOCK
      ?auto_756018 - BLOCK
      ?auto_756019 - BLOCK
      ?auto_756020 - BLOCK
      ?auto_756021 - BLOCK
      ?auto_756022 - BLOCK
      ?auto_756023 - BLOCK
      ?auto_756024 - BLOCK
      ?auto_756025 - BLOCK
      ?auto_756026 - BLOCK
      ?auto_756027 - BLOCK
      ?auto_756028 - BLOCK
      ?auto_756029 - BLOCK
      ?auto_756030 - BLOCK
      ?auto_756031 - BLOCK
    )
    :vars
    (
      ?auto_756032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756031 ?auto_756032 ) ( ON-TABLE ?auto_756014 ) ( ON ?auto_756015 ?auto_756014 ) ( ON ?auto_756016 ?auto_756015 ) ( ON ?auto_756017 ?auto_756016 ) ( ON ?auto_756018 ?auto_756017 ) ( ON ?auto_756019 ?auto_756018 ) ( ON ?auto_756020 ?auto_756019 ) ( ON ?auto_756021 ?auto_756020 ) ( ON ?auto_756022 ?auto_756021 ) ( ON ?auto_756023 ?auto_756022 ) ( ON ?auto_756024 ?auto_756023 ) ( ON ?auto_756025 ?auto_756024 ) ( ON ?auto_756026 ?auto_756025 ) ( ON ?auto_756027 ?auto_756026 ) ( ON ?auto_756028 ?auto_756027 ) ( ON ?auto_756029 ?auto_756028 ) ( not ( = ?auto_756014 ?auto_756015 ) ) ( not ( = ?auto_756014 ?auto_756016 ) ) ( not ( = ?auto_756014 ?auto_756017 ) ) ( not ( = ?auto_756014 ?auto_756018 ) ) ( not ( = ?auto_756014 ?auto_756019 ) ) ( not ( = ?auto_756014 ?auto_756020 ) ) ( not ( = ?auto_756014 ?auto_756021 ) ) ( not ( = ?auto_756014 ?auto_756022 ) ) ( not ( = ?auto_756014 ?auto_756023 ) ) ( not ( = ?auto_756014 ?auto_756024 ) ) ( not ( = ?auto_756014 ?auto_756025 ) ) ( not ( = ?auto_756014 ?auto_756026 ) ) ( not ( = ?auto_756014 ?auto_756027 ) ) ( not ( = ?auto_756014 ?auto_756028 ) ) ( not ( = ?auto_756014 ?auto_756029 ) ) ( not ( = ?auto_756014 ?auto_756030 ) ) ( not ( = ?auto_756014 ?auto_756031 ) ) ( not ( = ?auto_756014 ?auto_756032 ) ) ( not ( = ?auto_756015 ?auto_756016 ) ) ( not ( = ?auto_756015 ?auto_756017 ) ) ( not ( = ?auto_756015 ?auto_756018 ) ) ( not ( = ?auto_756015 ?auto_756019 ) ) ( not ( = ?auto_756015 ?auto_756020 ) ) ( not ( = ?auto_756015 ?auto_756021 ) ) ( not ( = ?auto_756015 ?auto_756022 ) ) ( not ( = ?auto_756015 ?auto_756023 ) ) ( not ( = ?auto_756015 ?auto_756024 ) ) ( not ( = ?auto_756015 ?auto_756025 ) ) ( not ( = ?auto_756015 ?auto_756026 ) ) ( not ( = ?auto_756015 ?auto_756027 ) ) ( not ( = ?auto_756015 ?auto_756028 ) ) ( not ( = ?auto_756015 ?auto_756029 ) ) ( not ( = ?auto_756015 ?auto_756030 ) ) ( not ( = ?auto_756015 ?auto_756031 ) ) ( not ( = ?auto_756015 ?auto_756032 ) ) ( not ( = ?auto_756016 ?auto_756017 ) ) ( not ( = ?auto_756016 ?auto_756018 ) ) ( not ( = ?auto_756016 ?auto_756019 ) ) ( not ( = ?auto_756016 ?auto_756020 ) ) ( not ( = ?auto_756016 ?auto_756021 ) ) ( not ( = ?auto_756016 ?auto_756022 ) ) ( not ( = ?auto_756016 ?auto_756023 ) ) ( not ( = ?auto_756016 ?auto_756024 ) ) ( not ( = ?auto_756016 ?auto_756025 ) ) ( not ( = ?auto_756016 ?auto_756026 ) ) ( not ( = ?auto_756016 ?auto_756027 ) ) ( not ( = ?auto_756016 ?auto_756028 ) ) ( not ( = ?auto_756016 ?auto_756029 ) ) ( not ( = ?auto_756016 ?auto_756030 ) ) ( not ( = ?auto_756016 ?auto_756031 ) ) ( not ( = ?auto_756016 ?auto_756032 ) ) ( not ( = ?auto_756017 ?auto_756018 ) ) ( not ( = ?auto_756017 ?auto_756019 ) ) ( not ( = ?auto_756017 ?auto_756020 ) ) ( not ( = ?auto_756017 ?auto_756021 ) ) ( not ( = ?auto_756017 ?auto_756022 ) ) ( not ( = ?auto_756017 ?auto_756023 ) ) ( not ( = ?auto_756017 ?auto_756024 ) ) ( not ( = ?auto_756017 ?auto_756025 ) ) ( not ( = ?auto_756017 ?auto_756026 ) ) ( not ( = ?auto_756017 ?auto_756027 ) ) ( not ( = ?auto_756017 ?auto_756028 ) ) ( not ( = ?auto_756017 ?auto_756029 ) ) ( not ( = ?auto_756017 ?auto_756030 ) ) ( not ( = ?auto_756017 ?auto_756031 ) ) ( not ( = ?auto_756017 ?auto_756032 ) ) ( not ( = ?auto_756018 ?auto_756019 ) ) ( not ( = ?auto_756018 ?auto_756020 ) ) ( not ( = ?auto_756018 ?auto_756021 ) ) ( not ( = ?auto_756018 ?auto_756022 ) ) ( not ( = ?auto_756018 ?auto_756023 ) ) ( not ( = ?auto_756018 ?auto_756024 ) ) ( not ( = ?auto_756018 ?auto_756025 ) ) ( not ( = ?auto_756018 ?auto_756026 ) ) ( not ( = ?auto_756018 ?auto_756027 ) ) ( not ( = ?auto_756018 ?auto_756028 ) ) ( not ( = ?auto_756018 ?auto_756029 ) ) ( not ( = ?auto_756018 ?auto_756030 ) ) ( not ( = ?auto_756018 ?auto_756031 ) ) ( not ( = ?auto_756018 ?auto_756032 ) ) ( not ( = ?auto_756019 ?auto_756020 ) ) ( not ( = ?auto_756019 ?auto_756021 ) ) ( not ( = ?auto_756019 ?auto_756022 ) ) ( not ( = ?auto_756019 ?auto_756023 ) ) ( not ( = ?auto_756019 ?auto_756024 ) ) ( not ( = ?auto_756019 ?auto_756025 ) ) ( not ( = ?auto_756019 ?auto_756026 ) ) ( not ( = ?auto_756019 ?auto_756027 ) ) ( not ( = ?auto_756019 ?auto_756028 ) ) ( not ( = ?auto_756019 ?auto_756029 ) ) ( not ( = ?auto_756019 ?auto_756030 ) ) ( not ( = ?auto_756019 ?auto_756031 ) ) ( not ( = ?auto_756019 ?auto_756032 ) ) ( not ( = ?auto_756020 ?auto_756021 ) ) ( not ( = ?auto_756020 ?auto_756022 ) ) ( not ( = ?auto_756020 ?auto_756023 ) ) ( not ( = ?auto_756020 ?auto_756024 ) ) ( not ( = ?auto_756020 ?auto_756025 ) ) ( not ( = ?auto_756020 ?auto_756026 ) ) ( not ( = ?auto_756020 ?auto_756027 ) ) ( not ( = ?auto_756020 ?auto_756028 ) ) ( not ( = ?auto_756020 ?auto_756029 ) ) ( not ( = ?auto_756020 ?auto_756030 ) ) ( not ( = ?auto_756020 ?auto_756031 ) ) ( not ( = ?auto_756020 ?auto_756032 ) ) ( not ( = ?auto_756021 ?auto_756022 ) ) ( not ( = ?auto_756021 ?auto_756023 ) ) ( not ( = ?auto_756021 ?auto_756024 ) ) ( not ( = ?auto_756021 ?auto_756025 ) ) ( not ( = ?auto_756021 ?auto_756026 ) ) ( not ( = ?auto_756021 ?auto_756027 ) ) ( not ( = ?auto_756021 ?auto_756028 ) ) ( not ( = ?auto_756021 ?auto_756029 ) ) ( not ( = ?auto_756021 ?auto_756030 ) ) ( not ( = ?auto_756021 ?auto_756031 ) ) ( not ( = ?auto_756021 ?auto_756032 ) ) ( not ( = ?auto_756022 ?auto_756023 ) ) ( not ( = ?auto_756022 ?auto_756024 ) ) ( not ( = ?auto_756022 ?auto_756025 ) ) ( not ( = ?auto_756022 ?auto_756026 ) ) ( not ( = ?auto_756022 ?auto_756027 ) ) ( not ( = ?auto_756022 ?auto_756028 ) ) ( not ( = ?auto_756022 ?auto_756029 ) ) ( not ( = ?auto_756022 ?auto_756030 ) ) ( not ( = ?auto_756022 ?auto_756031 ) ) ( not ( = ?auto_756022 ?auto_756032 ) ) ( not ( = ?auto_756023 ?auto_756024 ) ) ( not ( = ?auto_756023 ?auto_756025 ) ) ( not ( = ?auto_756023 ?auto_756026 ) ) ( not ( = ?auto_756023 ?auto_756027 ) ) ( not ( = ?auto_756023 ?auto_756028 ) ) ( not ( = ?auto_756023 ?auto_756029 ) ) ( not ( = ?auto_756023 ?auto_756030 ) ) ( not ( = ?auto_756023 ?auto_756031 ) ) ( not ( = ?auto_756023 ?auto_756032 ) ) ( not ( = ?auto_756024 ?auto_756025 ) ) ( not ( = ?auto_756024 ?auto_756026 ) ) ( not ( = ?auto_756024 ?auto_756027 ) ) ( not ( = ?auto_756024 ?auto_756028 ) ) ( not ( = ?auto_756024 ?auto_756029 ) ) ( not ( = ?auto_756024 ?auto_756030 ) ) ( not ( = ?auto_756024 ?auto_756031 ) ) ( not ( = ?auto_756024 ?auto_756032 ) ) ( not ( = ?auto_756025 ?auto_756026 ) ) ( not ( = ?auto_756025 ?auto_756027 ) ) ( not ( = ?auto_756025 ?auto_756028 ) ) ( not ( = ?auto_756025 ?auto_756029 ) ) ( not ( = ?auto_756025 ?auto_756030 ) ) ( not ( = ?auto_756025 ?auto_756031 ) ) ( not ( = ?auto_756025 ?auto_756032 ) ) ( not ( = ?auto_756026 ?auto_756027 ) ) ( not ( = ?auto_756026 ?auto_756028 ) ) ( not ( = ?auto_756026 ?auto_756029 ) ) ( not ( = ?auto_756026 ?auto_756030 ) ) ( not ( = ?auto_756026 ?auto_756031 ) ) ( not ( = ?auto_756026 ?auto_756032 ) ) ( not ( = ?auto_756027 ?auto_756028 ) ) ( not ( = ?auto_756027 ?auto_756029 ) ) ( not ( = ?auto_756027 ?auto_756030 ) ) ( not ( = ?auto_756027 ?auto_756031 ) ) ( not ( = ?auto_756027 ?auto_756032 ) ) ( not ( = ?auto_756028 ?auto_756029 ) ) ( not ( = ?auto_756028 ?auto_756030 ) ) ( not ( = ?auto_756028 ?auto_756031 ) ) ( not ( = ?auto_756028 ?auto_756032 ) ) ( not ( = ?auto_756029 ?auto_756030 ) ) ( not ( = ?auto_756029 ?auto_756031 ) ) ( not ( = ?auto_756029 ?auto_756032 ) ) ( not ( = ?auto_756030 ?auto_756031 ) ) ( not ( = ?auto_756030 ?auto_756032 ) ) ( not ( = ?auto_756031 ?auto_756032 ) ) ( CLEAR ?auto_756029 ) ( ON ?auto_756030 ?auto_756031 ) ( CLEAR ?auto_756030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_756014 ?auto_756015 ?auto_756016 ?auto_756017 ?auto_756018 ?auto_756019 ?auto_756020 ?auto_756021 ?auto_756022 ?auto_756023 ?auto_756024 ?auto_756025 ?auto_756026 ?auto_756027 ?auto_756028 ?auto_756029 ?auto_756030 )
      ( MAKE-18PILE ?auto_756014 ?auto_756015 ?auto_756016 ?auto_756017 ?auto_756018 ?auto_756019 ?auto_756020 ?auto_756021 ?auto_756022 ?auto_756023 ?auto_756024 ?auto_756025 ?auto_756026 ?auto_756027 ?auto_756028 ?auto_756029 ?auto_756030 ?auto_756031 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756051 - BLOCK
      ?auto_756052 - BLOCK
      ?auto_756053 - BLOCK
      ?auto_756054 - BLOCK
      ?auto_756055 - BLOCK
      ?auto_756056 - BLOCK
      ?auto_756057 - BLOCK
      ?auto_756058 - BLOCK
      ?auto_756059 - BLOCK
      ?auto_756060 - BLOCK
      ?auto_756061 - BLOCK
      ?auto_756062 - BLOCK
      ?auto_756063 - BLOCK
      ?auto_756064 - BLOCK
      ?auto_756065 - BLOCK
      ?auto_756066 - BLOCK
      ?auto_756067 - BLOCK
      ?auto_756068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756068 ) ( ON-TABLE ?auto_756051 ) ( ON ?auto_756052 ?auto_756051 ) ( ON ?auto_756053 ?auto_756052 ) ( ON ?auto_756054 ?auto_756053 ) ( ON ?auto_756055 ?auto_756054 ) ( ON ?auto_756056 ?auto_756055 ) ( ON ?auto_756057 ?auto_756056 ) ( ON ?auto_756058 ?auto_756057 ) ( ON ?auto_756059 ?auto_756058 ) ( ON ?auto_756060 ?auto_756059 ) ( ON ?auto_756061 ?auto_756060 ) ( ON ?auto_756062 ?auto_756061 ) ( ON ?auto_756063 ?auto_756062 ) ( ON ?auto_756064 ?auto_756063 ) ( ON ?auto_756065 ?auto_756064 ) ( ON ?auto_756066 ?auto_756065 ) ( not ( = ?auto_756051 ?auto_756052 ) ) ( not ( = ?auto_756051 ?auto_756053 ) ) ( not ( = ?auto_756051 ?auto_756054 ) ) ( not ( = ?auto_756051 ?auto_756055 ) ) ( not ( = ?auto_756051 ?auto_756056 ) ) ( not ( = ?auto_756051 ?auto_756057 ) ) ( not ( = ?auto_756051 ?auto_756058 ) ) ( not ( = ?auto_756051 ?auto_756059 ) ) ( not ( = ?auto_756051 ?auto_756060 ) ) ( not ( = ?auto_756051 ?auto_756061 ) ) ( not ( = ?auto_756051 ?auto_756062 ) ) ( not ( = ?auto_756051 ?auto_756063 ) ) ( not ( = ?auto_756051 ?auto_756064 ) ) ( not ( = ?auto_756051 ?auto_756065 ) ) ( not ( = ?auto_756051 ?auto_756066 ) ) ( not ( = ?auto_756051 ?auto_756067 ) ) ( not ( = ?auto_756051 ?auto_756068 ) ) ( not ( = ?auto_756052 ?auto_756053 ) ) ( not ( = ?auto_756052 ?auto_756054 ) ) ( not ( = ?auto_756052 ?auto_756055 ) ) ( not ( = ?auto_756052 ?auto_756056 ) ) ( not ( = ?auto_756052 ?auto_756057 ) ) ( not ( = ?auto_756052 ?auto_756058 ) ) ( not ( = ?auto_756052 ?auto_756059 ) ) ( not ( = ?auto_756052 ?auto_756060 ) ) ( not ( = ?auto_756052 ?auto_756061 ) ) ( not ( = ?auto_756052 ?auto_756062 ) ) ( not ( = ?auto_756052 ?auto_756063 ) ) ( not ( = ?auto_756052 ?auto_756064 ) ) ( not ( = ?auto_756052 ?auto_756065 ) ) ( not ( = ?auto_756052 ?auto_756066 ) ) ( not ( = ?auto_756052 ?auto_756067 ) ) ( not ( = ?auto_756052 ?auto_756068 ) ) ( not ( = ?auto_756053 ?auto_756054 ) ) ( not ( = ?auto_756053 ?auto_756055 ) ) ( not ( = ?auto_756053 ?auto_756056 ) ) ( not ( = ?auto_756053 ?auto_756057 ) ) ( not ( = ?auto_756053 ?auto_756058 ) ) ( not ( = ?auto_756053 ?auto_756059 ) ) ( not ( = ?auto_756053 ?auto_756060 ) ) ( not ( = ?auto_756053 ?auto_756061 ) ) ( not ( = ?auto_756053 ?auto_756062 ) ) ( not ( = ?auto_756053 ?auto_756063 ) ) ( not ( = ?auto_756053 ?auto_756064 ) ) ( not ( = ?auto_756053 ?auto_756065 ) ) ( not ( = ?auto_756053 ?auto_756066 ) ) ( not ( = ?auto_756053 ?auto_756067 ) ) ( not ( = ?auto_756053 ?auto_756068 ) ) ( not ( = ?auto_756054 ?auto_756055 ) ) ( not ( = ?auto_756054 ?auto_756056 ) ) ( not ( = ?auto_756054 ?auto_756057 ) ) ( not ( = ?auto_756054 ?auto_756058 ) ) ( not ( = ?auto_756054 ?auto_756059 ) ) ( not ( = ?auto_756054 ?auto_756060 ) ) ( not ( = ?auto_756054 ?auto_756061 ) ) ( not ( = ?auto_756054 ?auto_756062 ) ) ( not ( = ?auto_756054 ?auto_756063 ) ) ( not ( = ?auto_756054 ?auto_756064 ) ) ( not ( = ?auto_756054 ?auto_756065 ) ) ( not ( = ?auto_756054 ?auto_756066 ) ) ( not ( = ?auto_756054 ?auto_756067 ) ) ( not ( = ?auto_756054 ?auto_756068 ) ) ( not ( = ?auto_756055 ?auto_756056 ) ) ( not ( = ?auto_756055 ?auto_756057 ) ) ( not ( = ?auto_756055 ?auto_756058 ) ) ( not ( = ?auto_756055 ?auto_756059 ) ) ( not ( = ?auto_756055 ?auto_756060 ) ) ( not ( = ?auto_756055 ?auto_756061 ) ) ( not ( = ?auto_756055 ?auto_756062 ) ) ( not ( = ?auto_756055 ?auto_756063 ) ) ( not ( = ?auto_756055 ?auto_756064 ) ) ( not ( = ?auto_756055 ?auto_756065 ) ) ( not ( = ?auto_756055 ?auto_756066 ) ) ( not ( = ?auto_756055 ?auto_756067 ) ) ( not ( = ?auto_756055 ?auto_756068 ) ) ( not ( = ?auto_756056 ?auto_756057 ) ) ( not ( = ?auto_756056 ?auto_756058 ) ) ( not ( = ?auto_756056 ?auto_756059 ) ) ( not ( = ?auto_756056 ?auto_756060 ) ) ( not ( = ?auto_756056 ?auto_756061 ) ) ( not ( = ?auto_756056 ?auto_756062 ) ) ( not ( = ?auto_756056 ?auto_756063 ) ) ( not ( = ?auto_756056 ?auto_756064 ) ) ( not ( = ?auto_756056 ?auto_756065 ) ) ( not ( = ?auto_756056 ?auto_756066 ) ) ( not ( = ?auto_756056 ?auto_756067 ) ) ( not ( = ?auto_756056 ?auto_756068 ) ) ( not ( = ?auto_756057 ?auto_756058 ) ) ( not ( = ?auto_756057 ?auto_756059 ) ) ( not ( = ?auto_756057 ?auto_756060 ) ) ( not ( = ?auto_756057 ?auto_756061 ) ) ( not ( = ?auto_756057 ?auto_756062 ) ) ( not ( = ?auto_756057 ?auto_756063 ) ) ( not ( = ?auto_756057 ?auto_756064 ) ) ( not ( = ?auto_756057 ?auto_756065 ) ) ( not ( = ?auto_756057 ?auto_756066 ) ) ( not ( = ?auto_756057 ?auto_756067 ) ) ( not ( = ?auto_756057 ?auto_756068 ) ) ( not ( = ?auto_756058 ?auto_756059 ) ) ( not ( = ?auto_756058 ?auto_756060 ) ) ( not ( = ?auto_756058 ?auto_756061 ) ) ( not ( = ?auto_756058 ?auto_756062 ) ) ( not ( = ?auto_756058 ?auto_756063 ) ) ( not ( = ?auto_756058 ?auto_756064 ) ) ( not ( = ?auto_756058 ?auto_756065 ) ) ( not ( = ?auto_756058 ?auto_756066 ) ) ( not ( = ?auto_756058 ?auto_756067 ) ) ( not ( = ?auto_756058 ?auto_756068 ) ) ( not ( = ?auto_756059 ?auto_756060 ) ) ( not ( = ?auto_756059 ?auto_756061 ) ) ( not ( = ?auto_756059 ?auto_756062 ) ) ( not ( = ?auto_756059 ?auto_756063 ) ) ( not ( = ?auto_756059 ?auto_756064 ) ) ( not ( = ?auto_756059 ?auto_756065 ) ) ( not ( = ?auto_756059 ?auto_756066 ) ) ( not ( = ?auto_756059 ?auto_756067 ) ) ( not ( = ?auto_756059 ?auto_756068 ) ) ( not ( = ?auto_756060 ?auto_756061 ) ) ( not ( = ?auto_756060 ?auto_756062 ) ) ( not ( = ?auto_756060 ?auto_756063 ) ) ( not ( = ?auto_756060 ?auto_756064 ) ) ( not ( = ?auto_756060 ?auto_756065 ) ) ( not ( = ?auto_756060 ?auto_756066 ) ) ( not ( = ?auto_756060 ?auto_756067 ) ) ( not ( = ?auto_756060 ?auto_756068 ) ) ( not ( = ?auto_756061 ?auto_756062 ) ) ( not ( = ?auto_756061 ?auto_756063 ) ) ( not ( = ?auto_756061 ?auto_756064 ) ) ( not ( = ?auto_756061 ?auto_756065 ) ) ( not ( = ?auto_756061 ?auto_756066 ) ) ( not ( = ?auto_756061 ?auto_756067 ) ) ( not ( = ?auto_756061 ?auto_756068 ) ) ( not ( = ?auto_756062 ?auto_756063 ) ) ( not ( = ?auto_756062 ?auto_756064 ) ) ( not ( = ?auto_756062 ?auto_756065 ) ) ( not ( = ?auto_756062 ?auto_756066 ) ) ( not ( = ?auto_756062 ?auto_756067 ) ) ( not ( = ?auto_756062 ?auto_756068 ) ) ( not ( = ?auto_756063 ?auto_756064 ) ) ( not ( = ?auto_756063 ?auto_756065 ) ) ( not ( = ?auto_756063 ?auto_756066 ) ) ( not ( = ?auto_756063 ?auto_756067 ) ) ( not ( = ?auto_756063 ?auto_756068 ) ) ( not ( = ?auto_756064 ?auto_756065 ) ) ( not ( = ?auto_756064 ?auto_756066 ) ) ( not ( = ?auto_756064 ?auto_756067 ) ) ( not ( = ?auto_756064 ?auto_756068 ) ) ( not ( = ?auto_756065 ?auto_756066 ) ) ( not ( = ?auto_756065 ?auto_756067 ) ) ( not ( = ?auto_756065 ?auto_756068 ) ) ( not ( = ?auto_756066 ?auto_756067 ) ) ( not ( = ?auto_756066 ?auto_756068 ) ) ( not ( = ?auto_756067 ?auto_756068 ) ) ( CLEAR ?auto_756066 ) ( ON ?auto_756067 ?auto_756068 ) ( CLEAR ?auto_756067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_756051 ?auto_756052 ?auto_756053 ?auto_756054 ?auto_756055 ?auto_756056 ?auto_756057 ?auto_756058 ?auto_756059 ?auto_756060 ?auto_756061 ?auto_756062 ?auto_756063 ?auto_756064 ?auto_756065 ?auto_756066 ?auto_756067 )
      ( MAKE-18PILE ?auto_756051 ?auto_756052 ?auto_756053 ?auto_756054 ?auto_756055 ?auto_756056 ?auto_756057 ?auto_756058 ?auto_756059 ?auto_756060 ?auto_756061 ?auto_756062 ?auto_756063 ?auto_756064 ?auto_756065 ?auto_756066 ?auto_756067 ?auto_756068 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756087 - BLOCK
      ?auto_756088 - BLOCK
      ?auto_756089 - BLOCK
      ?auto_756090 - BLOCK
      ?auto_756091 - BLOCK
      ?auto_756092 - BLOCK
      ?auto_756093 - BLOCK
      ?auto_756094 - BLOCK
      ?auto_756095 - BLOCK
      ?auto_756096 - BLOCK
      ?auto_756097 - BLOCK
      ?auto_756098 - BLOCK
      ?auto_756099 - BLOCK
      ?auto_756100 - BLOCK
      ?auto_756101 - BLOCK
      ?auto_756102 - BLOCK
      ?auto_756103 - BLOCK
      ?auto_756104 - BLOCK
    )
    :vars
    (
      ?auto_756105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756104 ?auto_756105 ) ( ON-TABLE ?auto_756087 ) ( ON ?auto_756088 ?auto_756087 ) ( ON ?auto_756089 ?auto_756088 ) ( ON ?auto_756090 ?auto_756089 ) ( ON ?auto_756091 ?auto_756090 ) ( ON ?auto_756092 ?auto_756091 ) ( ON ?auto_756093 ?auto_756092 ) ( ON ?auto_756094 ?auto_756093 ) ( ON ?auto_756095 ?auto_756094 ) ( ON ?auto_756096 ?auto_756095 ) ( ON ?auto_756097 ?auto_756096 ) ( ON ?auto_756098 ?auto_756097 ) ( ON ?auto_756099 ?auto_756098 ) ( ON ?auto_756100 ?auto_756099 ) ( ON ?auto_756101 ?auto_756100 ) ( not ( = ?auto_756087 ?auto_756088 ) ) ( not ( = ?auto_756087 ?auto_756089 ) ) ( not ( = ?auto_756087 ?auto_756090 ) ) ( not ( = ?auto_756087 ?auto_756091 ) ) ( not ( = ?auto_756087 ?auto_756092 ) ) ( not ( = ?auto_756087 ?auto_756093 ) ) ( not ( = ?auto_756087 ?auto_756094 ) ) ( not ( = ?auto_756087 ?auto_756095 ) ) ( not ( = ?auto_756087 ?auto_756096 ) ) ( not ( = ?auto_756087 ?auto_756097 ) ) ( not ( = ?auto_756087 ?auto_756098 ) ) ( not ( = ?auto_756087 ?auto_756099 ) ) ( not ( = ?auto_756087 ?auto_756100 ) ) ( not ( = ?auto_756087 ?auto_756101 ) ) ( not ( = ?auto_756087 ?auto_756102 ) ) ( not ( = ?auto_756087 ?auto_756103 ) ) ( not ( = ?auto_756087 ?auto_756104 ) ) ( not ( = ?auto_756087 ?auto_756105 ) ) ( not ( = ?auto_756088 ?auto_756089 ) ) ( not ( = ?auto_756088 ?auto_756090 ) ) ( not ( = ?auto_756088 ?auto_756091 ) ) ( not ( = ?auto_756088 ?auto_756092 ) ) ( not ( = ?auto_756088 ?auto_756093 ) ) ( not ( = ?auto_756088 ?auto_756094 ) ) ( not ( = ?auto_756088 ?auto_756095 ) ) ( not ( = ?auto_756088 ?auto_756096 ) ) ( not ( = ?auto_756088 ?auto_756097 ) ) ( not ( = ?auto_756088 ?auto_756098 ) ) ( not ( = ?auto_756088 ?auto_756099 ) ) ( not ( = ?auto_756088 ?auto_756100 ) ) ( not ( = ?auto_756088 ?auto_756101 ) ) ( not ( = ?auto_756088 ?auto_756102 ) ) ( not ( = ?auto_756088 ?auto_756103 ) ) ( not ( = ?auto_756088 ?auto_756104 ) ) ( not ( = ?auto_756088 ?auto_756105 ) ) ( not ( = ?auto_756089 ?auto_756090 ) ) ( not ( = ?auto_756089 ?auto_756091 ) ) ( not ( = ?auto_756089 ?auto_756092 ) ) ( not ( = ?auto_756089 ?auto_756093 ) ) ( not ( = ?auto_756089 ?auto_756094 ) ) ( not ( = ?auto_756089 ?auto_756095 ) ) ( not ( = ?auto_756089 ?auto_756096 ) ) ( not ( = ?auto_756089 ?auto_756097 ) ) ( not ( = ?auto_756089 ?auto_756098 ) ) ( not ( = ?auto_756089 ?auto_756099 ) ) ( not ( = ?auto_756089 ?auto_756100 ) ) ( not ( = ?auto_756089 ?auto_756101 ) ) ( not ( = ?auto_756089 ?auto_756102 ) ) ( not ( = ?auto_756089 ?auto_756103 ) ) ( not ( = ?auto_756089 ?auto_756104 ) ) ( not ( = ?auto_756089 ?auto_756105 ) ) ( not ( = ?auto_756090 ?auto_756091 ) ) ( not ( = ?auto_756090 ?auto_756092 ) ) ( not ( = ?auto_756090 ?auto_756093 ) ) ( not ( = ?auto_756090 ?auto_756094 ) ) ( not ( = ?auto_756090 ?auto_756095 ) ) ( not ( = ?auto_756090 ?auto_756096 ) ) ( not ( = ?auto_756090 ?auto_756097 ) ) ( not ( = ?auto_756090 ?auto_756098 ) ) ( not ( = ?auto_756090 ?auto_756099 ) ) ( not ( = ?auto_756090 ?auto_756100 ) ) ( not ( = ?auto_756090 ?auto_756101 ) ) ( not ( = ?auto_756090 ?auto_756102 ) ) ( not ( = ?auto_756090 ?auto_756103 ) ) ( not ( = ?auto_756090 ?auto_756104 ) ) ( not ( = ?auto_756090 ?auto_756105 ) ) ( not ( = ?auto_756091 ?auto_756092 ) ) ( not ( = ?auto_756091 ?auto_756093 ) ) ( not ( = ?auto_756091 ?auto_756094 ) ) ( not ( = ?auto_756091 ?auto_756095 ) ) ( not ( = ?auto_756091 ?auto_756096 ) ) ( not ( = ?auto_756091 ?auto_756097 ) ) ( not ( = ?auto_756091 ?auto_756098 ) ) ( not ( = ?auto_756091 ?auto_756099 ) ) ( not ( = ?auto_756091 ?auto_756100 ) ) ( not ( = ?auto_756091 ?auto_756101 ) ) ( not ( = ?auto_756091 ?auto_756102 ) ) ( not ( = ?auto_756091 ?auto_756103 ) ) ( not ( = ?auto_756091 ?auto_756104 ) ) ( not ( = ?auto_756091 ?auto_756105 ) ) ( not ( = ?auto_756092 ?auto_756093 ) ) ( not ( = ?auto_756092 ?auto_756094 ) ) ( not ( = ?auto_756092 ?auto_756095 ) ) ( not ( = ?auto_756092 ?auto_756096 ) ) ( not ( = ?auto_756092 ?auto_756097 ) ) ( not ( = ?auto_756092 ?auto_756098 ) ) ( not ( = ?auto_756092 ?auto_756099 ) ) ( not ( = ?auto_756092 ?auto_756100 ) ) ( not ( = ?auto_756092 ?auto_756101 ) ) ( not ( = ?auto_756092 ?auto_756102 ) ) ( not ( = ?auto_756092 ?auto_756103 ) ) ( not ( = ?auto_756092 ?auto_756104 ) ) ( not ( = ?auto_756092 ?auto_756105 ) ) ( not ( = ?auto_756093 ?auto_756094 ) ) ( not ( = ?auto_756093 ?auto_756095 ) ) ( not ( = ?auto_756093 ?auto_756096 ) ) ( not ( = ?auto_756093 ?auto_756097 ) ) ( not ( = ?auto_756093 ?auto_756098 ) ) ( not ( = ?auto_756093 ?auto_756099 ) ) ( not ( = ?auto_756093 ?auto_756100 ) ) ( not ( = ?auto_756093 ?auto_756101 ) ) ( not ( = ?auto_756093 ?auto_756102 ) ) ( not ( = ?auto_756093 ?auto_756103 ) ) ( not ( = ?auto_756093 ?auto_756104 ) ) ( not ( = ?auto_756093 ?auto_756105 ) ) ( not ( = ?auto_756094 ?auto_756095 ) ) ( not ( = ?auto_756094 ?auto_756096 ) ) ( not ( = ?auto_756094 ?auto_756097 ) ) ( not ( = ?auto_756094 ?auto_756098 ) ) ( not ( = ?auto_756094 ?auto_756099 ) ) ( not ( = ?auto_756094 ?auto_756100 ) ) ( not ( = ?auto_756094 ?auto_756101 ) ) ( not ( = ?auto_756094 ?auto_756102 ) ) ( not ( = ?auto_756094 ?auto_756103 ) ) ( not ( = ?auto_756094 ?auto_756104 ) ) ( not ( = ?auto_756094 ?auto_756105 ) ) ( not ( = ?auto_756095 ?auto_756096 ) ) ( not ( = ?auto_756095 ?auto_756097 ) ) ( not ( = ?auto_756095 ?auto_756098 ) ) ( not ( = ?auto_756095 ?auto_756099 ) ) ( not ( = ?auto_756095 ?auto_756100 ) ) ( not ( = ?auto_756095 ?auto_756101 ) ) ( not ( = ?auto_756095 ?auto_756102 ) ) ( not ( = ?auto_756095 ?auto_756103 ) ) ( not ( = ?auto_756095 ?auto_756104 ) ) ( not ( = ?auto_756095 ?auto_756105 ) ) ( not ( = ?auto_756096 ?auto_756097 ) ) ( not ( = ?auto_756096 ?auto_756098 ) ) ( not ( = ?auto_756096 ?auto_756099 ) ) ( not ( = ?auto_756096 ?auto_756100 ) ) ( not ( = ?auto_756096 ?auto_756101 ) ) ( not ( = ?auto_756096 ?auto_756102 ) ) ( not ( = ?auto_756096 ?auto_756103 ) ) ( not ( = ?auto_756096 ?auto_756104 ) ) ( not ( = ?auto_756096 ?auto_756105 ) ) ( not ( = ?auto_756097 ?auto_756098 ) ) ( not ( = ?auto_756097 ?auto_756099 ) ) ( not ( = ?auto_756097 ?auto_756100 ) ) ( not ( = ?auto_756097 ?auto_756101 ) ) ( not ( = ?auto_756097 ?auto_756102 ) ) ( not ( = ?auto_756097 ?auto_756103 ) ) ( not ( = ?auto_756097 ?auto_756104 ) ) ( not ( = ?auto_756097 ?auto_756105 ) ) ( not ( = ?auto_756098 ?auto_756099 ) ) ( not ( = ?auto_756098 ?auto_756100 ) ) ( not ( = ?auto_756098 ?auto_756101 ) ) ( not ( = ?auto_756098 ?auto_756102 ) ) ( not ( = ?auto_756098 ?auto_756103 ) ) ( not ( = ?auto_756098 ?auto_756104 ) ) ( not ( = ?auto_756098 ?auto_756105 ) ) ( not ( = ?auto_756099 ?auto_756100 ) ) ( not ( = ?auto_756099 ?auto_756101 ) ) ( not ( = ?auto_756099 ?auto_756102 ) ) ( not ( = ?auto_756099 ?auto_756103 ) ) ( not ( = ?auto_756099 ?auto_756104 ) ) ( not ( = ?auto_756099 ?auto_756105 ) ) ( not ( = ?auto_756100 ?auto_756101 ) ) ( not ( = ?auto_756100 ?auto_756102 ) ) ( not ( = ?auto_756100 ?auto_756103 ) ) ( not ( = ?auto_756100 ?auto_756104 ) ) ( not ( = ?auto_756100 ?auto_756105 ) ) ( not ( = ?auto_756101 ?auto_756102 ) ) ( not ( = ?auto_756101 ?auto_756103 ) ) ( not ( = ?auto_756101 ?auto_756104 ) ) ( not ( = ?auto_756101 ?auto_756105 ) ) ( not ( = ?auto_756102 ?auto_756103 ) ) ( not ( = ?auto_756102 ?auto_756104 ) ) ( not ( = ?auto_756102 ?auto_756105 ) ) ( not ( = ?auto_756103 ?auto_756104 ) ) ( not ( = ?auto_756103 ?auto_756105 ) ) ( not ( = ?auto_756104 ?auto_756105 ) ) ( ON ?auto_756103 ?auto_756104 ) ( CLEAR ?auto_756101 ) ( ON ?auto_756102 ?auto_756103 ) ( CLEAR ?auto_756102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_756087 ?auto_756088 ?auto_756089 ?auto_756090 ?auto_756091 ?auto_756092 ?auto_756093 ?auto_756094 ?auto_756095 ?auto_756096 ?auto_756097 ?auto_756098 ?auto_756099 ?auto_756100 ?auto_756101 ?auto_756102 )
      ( MAKE-18PILE ?auto_756087 ?auto_756088 ?auto_756089 ?auto_756090 ?auto_756091 ?auto_756092 ?auto_756093 ?auto_756094 ?auto_756095 ?auto_756096 ?auto_756097 ?auto_756098 ?auto_756099 ?auto_756100 ?auto_756101 ?auto_756102 ?auto_756103 ?auto_756104 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756124 - BLOCK
      ?auto_756125 - BLOCK
      ?auto_756126 - BLOCK
      ?auto_756127 - BLOCK
      ?auto_756128 - BLOCK
      ?auto_756129 - BLOCK
      ?auto_756130 - BLOCK
      ?auto_756131 - BLOCK
      ?auto_756132 - BLOCK
      ?auto_756133 - BLOCK
      ?auto_756134 - BLOCK
      ?auto_756135 - BLOCK
      ?auto_756136 - BLOCK
      ?auto_756137 - BLOCK
      ?auto_756138 - BLOCK
      ?auto_756139 - BLOCK
      ?auto_756140 - BLOCK
      ?auto_756141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756141 ) ( ON-TABLE ?auto_756124 ) ( ON ?auto_756125 ?auto_756124 ) ( ON ?auto_756126 ?auto_756125 ) ( ON ?auto_756127 ?auto_756126 ) ( ON ?auto_756128 ?auto_756127 ) ( ON ?auto_756129 ?auto_756128 ) ( ON ?auto_756130 ?auto_756129 ) ( ON ?auto_756131 ?auto_756130 ) ( ON ?auto_756132 ?auto_756131 ) ( ON ?auto_756133 ?auto_756132 ) ( ON ?auto_756134 ?auto_756133 ) ( ON ?auto_756135 ?auto_756134 ) ( ON ?auto_756136 ?auto_756135 ) ( ON ?auto_756137 ?auto_756136 ) ( ON ?auto_756138 ?auto_756137 ) ( not ( = ?auto_756124 ?auto_756125 ) ) ( not ( = ?auto_756124 ?auto_756126 ) ) ( not ( = ?auto_756124 ?auto_756127 ) ) ( not ( = ?auto_756124 ?auto_756128 ) ) ( not ( = ?auto_756124 ?auto_756129 ) ) ( not ( = ?auto_756124 ?auto_756130 ) ) ( not ( = ?auto_756124 ?auto_756131 ) ) ( not ( = ?auto_756124 ?auto_756132 ) ) ( not ( = ?auto_756124 ?auto_756133 ) ) ( not ( = ?auto_756124 ?auto_756134 ) ) ( not ( = ?auto_756124 ?auto_756135 ) ) ( not ( = ?auto_756124 ?auto_756136 ) ) ( not ( = ?auto_756124 ?auto_756137 ) ) ( not ( = ?auto_756124 ?auto_756138 ) ) ( not ( = ?auto_756124 ?auto_756139 ) ) ( not ( = ?auto_756124 ?auto_756140 ) ) ( not ( = ?auto_756124 ?auto_756141 ) ) ( not ( = ?auto_756125 ?auto_756126 ) ) ( not ( = ?auto_756125 ?auto_756127 ) ) ( not ( = ?auto_756125 ?auto_756128 ) ) ( not ( = ?auto_756125 ?auto_756129 ) ) ( not ( = ?auto_756125 ?auto_756130 ) ) ( not ( = ?auto_756125 ?auto_756131 ) ) ( not ( = ?auto_756125 ?auto_756132 ) ) ( not ( = ?auto_756125 ?auto_756133 ) ) ( not ( = ?auto_756125 ?auto_756134 ) ) ( not ( = ?auto_756125 ?auto_756135 ) ) ( not ( = ?auto_756125 ?auto_756136 ) ) ( not ( = ?auto_756125 ?auto_756137 ) ) ( not ( = ?auto_756125 ?auto_756138 ) ) ( not ( = ?auto_756125 ?auto_756139 ) ) ( not ( = ?auto_756125 ?auto_756140 ) ) ( not ( = ?auto_756125 ?auto_756141 ) ) ( not ( = ?auto_756126 ?auto_756127 ) ) ( not ( = ?auto_756126 ?auto_756128 ) ) ( not ( = ?auto_756126 ?auto_756129 ) ) ( not ( = ?auto_756126 ?auto_756130 ) ) ( not ( = ?auto_756126 ?auto_756131 ) ) ( not ( = ?auto_756126 ?auto_756132 ) ) ( not ( = ?auto_756126 ?auto_756133 ) ) ( not ( = ?auto_756126 ?auto_756134 ) ) ( not ( = ?auto_756126 ?auto_756135 ) ) ( not ( = ?auto_756126 ?auto_756136 ) ) ( not ( = ?auto_756126 ?auto_756137 ) ) ( not ( = ?auto_756126 ?auto_756138 ) ) ( not ( = ?auto_756126 ?auto_756139 ) ) ( not ( = ?auto_756126 ?auto_756140 ) ) ( not ( = ?auto_756126 ?auto_756141 ) ) ( not ( = ?auto_756127 ?auto_756128 ) ) ( not ( = ?auto_756127 ?auto_756129 ) ) ( not ( = ?auto_756127 ?auto_756130 ) ) ( not ( = ?auto_756127 ?auto_756131 ) ) ( not ( = ?auto_756127 ?auto_756132 ) ) ( not ( = ?auto_756127 ?auto_756133 ) ) ( not ( = ?auto_756127 ?auto_756134 ) ) ( not ( = ?auto_756127 ?auto_756135 ) ) ( not ( = ?auto_756127 ?auto_756136 ) ) ( not ( = ?auto_756127 ?auto_756137 ) ) ( not ( = ?auto_756127 ?auto_756138 ) ) ( not ( = ?auto_756127 ?auto_756139 ) ) ( not ( = ?auto_756127 ?auto_756140 ) ) ( not ( = ?auto_756127 ?auto_756141 ) ) ( not ( = ?auto_756128 ?auto_756129 ) ) ( not ( = ?auto_756128 ?auto_756130 ) ) ( not ( = ?auto_756128 ?auto_756131 ) ) ( not ( = ?auto_756128 ?auto_756132 ) ) ( not ( = ?auto_756128 ?auto_756133 ) ) ( not ( = ?auto_756128 ?auto_756134 ) ) ( not ( = ?auto_756128 ?auto_756135 ) ) ( not ( = ?auto_756128 ?auto_756136 ) ) ( not ( = ?auto_756128 ?auto_756137 ) ) ( not ( = ?auto_756128 ?auto_756138 ) ) ( not ( = ?auto_756128 ?auto_756139 ) ) ( not ( = ?auto_756128 ?auto_756140 ) ) ( not ( = ?auto_756128 ?auto_756141 ) ) ( not ( = ?auto_756129 ?auto_756130 ) ) ( not ( = ?auto_756129 ?auto_756131 ) ) ( not ( = ?auto_756129 ?auto_756132 ) ) ( not ( = ?auto_756129 ?auto_756133 ) ) ( not ( = ?auto_756129 ?auto_756134 ) ) ( not ( = ?auto_756129 ?auto_756135 ) ) ( not ( = ?auto_756129 ?auto_756136 ) ) ( not ( = ?auto_756129 ?auto_756137 ) ) ( not ( = ?auto_756129 ?auto_756138 ) ) ( not ( = ?auto_756129 ?auto_756139 ) ) ( not ( = ?auto_756129 ?auto_756140 ) ) ( not ( = ?auto_756129 ?auto_756141 ) ) ( not ( = ?auto_756130 ?auto_756131 ) ) ( not ( = ?auto_756130 ?auto_756132 ) ) ( not ( = ?auto_756130 ?auto_756133 ) ) ( not ( = ?auto_756130 ?auto_756134 ) ) ( not ( = ?auto_756130 ?auto_756135 ) ) ( not ( = ?auto_756130 ?auto_756136 ) ) ( not ( = ?auto_756130 ?auto_756137 ) ) ( not ( = ?auto_756130 ?auto_756138 ) ) ( not ( = ?auto_756130 ?auto_756139 ) ) ( not ( = ?auto_756130 ?auto_756140 ) ) ( not ( = ?auto_756130 ?auto_756141 ) ) ( not ( = ?auto_756131 ?auto_756132 ) ) ( not ( = ?auto_756131 ?auto_756133 ) ) ( not ( = ?auto_756131 ?auto_756134 ) ) ( not ( = ?auto_756131 ?auto_756135 ) ) ( not ( = ?auto_756131 ?auto_756136 ) ) ( not ( = ?auto_756131 ?auto_756137 ) ) ( not ( = ?auto_756131 ?auto_756138 ) ) ( not ( = ?auto_756131 ?auto_756139 ) ) ( not ( = ?auto_756131 ?auto_756140 ) ) ( not ( = ?auto_756131 ?auto_756141 ) ) ( not ( = ?auto_756132 ?auto_756133 ) ) ( not ( = ?auto_756132 ?auto_756134 ) ) ( not ( = ?auto_756132 ?auto_756135 ) ) ( not ( = ?auto_756132 ?auto_756136 ) ) ( not ( = ?auto_756132 ?auto_756137 ) ) ( not ( = ?auto_756132 ?auto_756138 ) ) ( not ( = ?auto_756132 ?auto_756139 ) ) ( not ( = ?auto_756132 ?auto_756140 ) ) ( not ( = ?auto_756132 ?auto_756141 ) ) ( not ( = ?auto_756133 ?auto_756134 ) ) ( not ( = ?auto_756133 ?auto_756135 ) ) ( not ( = ?auto_756133 ?auto_756136 ) ) ( not ( = ?auto_756133 ?auto_756137 ) ) ( not ( = ?auto_756133 ?auto_756138 ) ) ( not ( = ?auto_756133 ?auto_756139 ) ) ( not ( = ?auto_756133 ?auto_756140 ) ) ( not ( = ?auto_756133 ?auto_756141 ) ) ( not ( = ?auto_756134 ?auto_756135 ) ) ( not ( = ?auto_756134 ?auto_756136 ) ) ( not ( = ?auto_756134 ?auto_756137 ) ) ( not ( = ?auto_756134 ?auto_756138 ) ) ( not ( = ?auto_756134 ?auto_756139 ) ) ( not ( = ?auto_756134 ?auto_756140 ) ) ( not ( = ?auto_756134 ?auto_756141 ) ) ( not ( = ?auto_756135 ?auto_756136 ) ) ( not ( = ?auto_756135 ?auto_756137 ) ) ( not ( = ?auto_756135 ?auto_756138 ) ) ( not ( = ?auto_756135 ?auto_756139 ) ) ( not ( = ?auto_756135 ?auto_756140 ) ) ( not ( = ?auto_756135 ?auto_756141 ) ) ( not ( = ?auto_756136 ?auto_756137 ) ) ( not ( = ?auto_756136 ?auto_756138 ) ) ( not ( = ?auto_756136 ?auto_756139 ) ) ( not ( = ?auto_756136 ?auto_756140 ) ) ( not ( = ?auto_756136 ?auto_756141 ) ) ( not ( = ?auto_756137 ?auto_756138 ) ) ( not ( = ?auto_756137 ?auto_756139 ) ) ( not ( = ?auto_756137 ?auto_756140 ) ) ( not ( = ?auto_756137 ?auto_756141 ) ) ( not ( = ?auto_756138 ?auto_756139 ) ) ( not ( = ?auto_756138 ?auto_756140 ) ) ( not ( = ?auto_756138 ?auto_756141 ) ) ( not ( = ?auto_756139 ?auto_756140 ) ) ( not ( = ?auto_756139 ?auto_756141 ) ) ( not ( = ?auto_756140 ?auto_756141 ) ) ( ON ?auto_756140 ?auto_756141 ) ( CLEAR ?auto_756138 ) ( ON ?auto_756139 ?auto_756140 ) ( CLEAR ?auto_756139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_756124 ?auto_756125 ?auto_756126 ?auto_756127 ?auto_756128 ?auto_756129 ?auto_756130 ?auto_756131 ?auto_756132 ?auto_756133 ?auto_756134 ?auto_756135 ?auto_756136 ?auto_756137 ?auto_756138 ?auto_756139 )
      ( MAKE-18PILE ?auto_756124 ?auto_756125 ?auto_756126 ?auto_756127 ?auto_756128 ?auto_756129 ?auto_756130 ?auto_756131 ?auto_756132 ?auto_756133 ?auto_756134 ?auto_756135 ?auto_756136 ?auto_756137 ?auto_756138 ?auto_756139 ?auto_756140 ?auto_756141 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756160 - BLOCK
      ?auto_756161 - BLOCK
      ?auto_756162 - BLOCK
      ?auto_756163 - BLOCK
      ?auto_756164 - BLOCK
      ?auto_756165 - BLOCK
      ?auto_756166 - BLOCK
      ?auto_756167 - BLOCK
      ?auto_756168 - BLOCK
      ?auto_756169 - BLOCK
      ?auto_756170 - BLOCK
      ?auto_756171 - BLOCK
      ?auto_756172 - BLOCK
      ?auto_756173 - BLOCK
      ?auto_756174 - BLOCK
      ?auto_756175 - BLOCK
      ?auto_756176 - BLOCK
      ?auto_756177 - BLOCK
    )
    :vars
    (
      ?auto_756178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756177 ?auto_756178 ) ( ON-TABLE ?auto_756160 ) ( ON ?auto_756161 ?auto_756160 ) ( ON ?auto_756162 ?auto_756161 ) ( ON ?auto_756163 ?auto_756162 ) ( ON ?auto_756164 ?auto_756163 ) ( ON ?auto_756165 ?auto_756164 ) ( ON ?auto_756166 ?auto_756165 ) ( ON ?auto_756167 ?auto_756166 ) ( ON ?auto_756168 ?auto_756167 ) ( ON ?auto_756169 ?auto_756168 ) ( ON ?auto_756170 ?auto_756169 ) ( ON ?auto_756171 ?auto_756170 ) ( ON ?auto_756172 ?auto_756171 ) ( ON ?auto_756173 ?auto_756172 ) ( not ( = ?auto_756160 ?auto_756161 ) ) ( not ( = ?auto_756160 ?auto_756162 ) ) ( not ( = ?auto_756160 ?auto_756163 ) ) ( not ( = ?auto_756160 ?auto_756164 ) ) ( not ( = ?auto_756160 ?auto_756165 ) ) ( not ( = ?auto_756160 ?auto_756166 ) ) ( not ( = ?auto_756160 ?auto_756167 ) ) ( not ( = ?auto_756160 ?auto_756168 ) ) ( not ( = ?auto_756160 ?auto_756169 ) ) ( not ( = ?auto_756160 ?auto_756170 ) ) ( not ( = ?auto_756160 ?auto_756171 ) ) ( not ( = ?auto_756160 ?auto_756172 ) ) ( not ( = ?auto_756160 ?auto_756173 ) ) ( not ( = ?auto_756160 ?auto_756174 ) ) ( not ( = ?auto_756160 ?auto_756175 ) ) ( not ( = ?auto_756160 ?auto_756176 ) ) ( not ( = ?auto_756160 ?auto_756177 ) ) ( not ( = ?auto_756160 ?auto_756178 ) ) ( not ( = ?auto_756161 ?auto_756162 ) ) ( not ( = ?auto_756161 ?auto_756163 ) ) ( not ( = ?auto_756161 ?auto_756164 ) ) ( not ( = ?auto_756161 ?auto_756165 ) ) ( not ( = ?auto_756161 ?auto_756166 ) ) ( not ( = ?auto_756161 ?auto_756167 ) ) ( not ( = ?auto_756161 ?auto_756168 ) ) ( not ( = ?auto_756161 ?auto_756169 ) ) ( not ( = ?auto_756161 ?auto_756170 ) ) ( not ( = ?auto_756161 ?auto_756171 ) ) ( not ( = ?auto_756161 ?auto_756172 ) ) ( not ( = ?auto_756161 ?auto_756173 ) ) ( not ( = ?auto_756161 ?auto_756174 ) ) ( not ( = ?auto_756161 ?auto_756175 ) ) ( not ( = ?auto_756161 ?auto_756176 ) ) ( not ( = ?auto_756161 ?auto_756177 ) ) ( not ( = ?auto_756161 ?auto_756178 ) ) ( not ( = ?auto_756162 ?auto_756163 ) ) ( not ( = ?auto_756162 ?auto_756164 ) ) ( not ( = ?auto_756162 ?auto_756165 ) ) ( not ( = ?auto_756162 ?auto_756166 ) ) ( not ( = ?auto_756162 ?auto_756167 ) ) ( not ( = ?auto_756162 ?auto_756168 ) ) ( not ( = ?auto_756162 ?auto_756169 ) ) ( not ( = ?auto_756162 ?auto_756170 ) ) ( not ( = ?auto_756162 ?auto_756171 ) ) ( not ( = ?auto_756162 ?auto_756172 ) ) ( not ( = ?auto_756162 ?auto_756173 ) ) ( not ( = ?auto_756162 ?auto_756174 ) ) ( not ( = ?auto_756162 ?auto_756175 ) ) ( not ( = ?auto_756162 ?auto_756176 ) ) ( not ( = ?auto_756162 ?auto_756177 ) ) ( not ( = ?auto_756162 ?auto_756178 ) ) ( not ( = ?auto_756163 ?auto_756164 ) ) ( not ( = ?auto_756163 ?auto_756165 ) ) ( not ( = ?auto_756163 ?auto_756166 ) ) ( not ( = ?auto_756163 ?auto_756167 ) ) ( not ( = ?auto_756163 ?auto_756168 ) ) ( not ( = ?auto_756163 ?auto_756169 ) ) ( not ( = ?auto_756163 ?auto_756170 ) ) ( not ( = ?auto_756163 ?auto_756171 ) ) ( not ( = ?auto_756163 ?auto_756172 ) ) ( not ( = ?auto_756163 ?auto_756173 ) ) ( not ( = ?auto_756163 ?auto_756174 ) ) ( not ( = ?auto_756163 ?auto_756175 ) ) ( not ( = ?auto_756163 ?auto_756176 ) ) ( not ( = ?auto_756163 ?auto_756177 ) ) ( not ( = ?auto_756163 ?auto_756178 ) ) ( not ( = ?auto_756164 ?auto_756165 ) ) ( not ( = ?auto_756164 ?auto_756166 ) ) ( not ( = ?auto_756164 ?auto_756167 ) ) ( not ( = ?auto_756164 ?auto_756168 ) ) ( not ( = ?auto_756164 ?auto_756169 ) ) ( not ( = ?auto_756164 ?auto_756170 ) ) ( not ( = ?auto_756164 ?auto_756171 ) ) ( not ( = ?auto_756164 ?auto_756172 ) ) ( not ( = ?auto_756164 ?auto_756173 ) ) ( not ( = ?auto_756164 ?auto_756174 ) ) ( not ( = ?auto_756164 ?auto_756175 ) ) ( not ( = ?auto_756164 ?auto_756176 ) ) ( not ( = ?auto_756164 ?auto_756177 ) ) ( not ( = ?auto_756164 ?auto_756178 ) ) ( not ( = ?auto_756165 ?auto_756166 ) ) ( not ( = ?auto_756165 ?auto_756167 ) ) ( not ( = ?auto_756165 ?auto_756168 ) ) ( not ( = ?auto_756165 ?auto_756169 ) ) ( not ( = ?auto_756165 ?auto_756170 ) ) ( not ( = ?auto_756165 ?auto_756171 ) ) ( not ( = ?auto_756165 ?auto_756172 ) ) ( not ( = ?auto_756165 ?auto_756173 ) ) ( not ( = ?auto_756165 ?auto_756174 ) ) ( not ( = ?auto_756165 ?auto_756175 ) ) ( not ( = ?auto_756165 ?auto_756176 ) ) ( not ( = ?auto_756165 ?auto_756177 ) ) ( not ( = ?auto_756165 ?auto_756178 ) ) ( not ( = ?auto_756166 ?auto_756167 ) ) ( not ( = ?auto_756166 ?auto_756168 ) ) ( not ( = ?auto_756166 ?auto_756169 ) ) ( not ( = ?auto_756166 ?auto_756170 ) ) ( not ( = ?auto_756166 ?auto_756171 ) ) ( not ( = ?auto_756166 ?auto_756172 ) ) ( not ( = ?auto_756166 ?auto_756173 ) ) ( not ( = ?auto_756166 ?auto_756174 ) ) ( not ( = ?auto_756166 ?auto_756175 ) ) ( not ( = ?auto_756166 ?auto_756176 ) ) ( not ( = ?auto_756166 ?auto_756177 ) ) ( not ( = ?auto_756166 ?auto_756178 ) ) ( not ( = ?auto_756167 ?auto_756168 ) ) ( not ( = ?auto_756167 ?auto_756169 ) ) ( not ( = ?auto_756167 ?auto_756170 ) ) ( not ( = ?auto_756167 ?auto_756171 ) ) ( not ( = ?auto_756167 ?auto_756172 ) ) ( not ( = ?auto_756167 ?auto_756173 ) ) ( not ( = ?auto_756167 ?auto_756174 ) ) ( not ( = ?auto_756167 ?auto_756175 ) ) ( not ( = ?auto_756167 ?auto_756176 ) ) ( not ( = ?auto_756167 ?auto_756177 ) ) ( not ( = ?auto_756167 ?auto_756178 ) ) ( not ( = ?auto_756168 ?auto_756169 ) ) ( not ( = ?auto_756168 ?auto_756170 ) ) ( not ( = ?auto_756168 ?auto_756171 ) ) ( not ( = ?auto_756168 ?auto_756172 ) ) ( not ( = ?auto_756168 ?auto_756173 ) ) ( not ( = ?auto_756168 ?auto_756174 ) ) ( not ( = ?auto_756168 ?auto_756175 ) ) ( not ( = ?auto_756168 ?auto_756176 ) ) ( not ( = ?auto_756168 ?auto_756177 ) ) ( not ( = ?auto_756168 ?auto_756178 ) ) ( not ( = ?auto_756169 ?auto_756170 ) ) ( not ( = ?auto_756169 ?auto_756171 ) ) ( not ( = ?auto_756169 ?auto_756172 ) ) ( not ( = ?auto_756169 ?auto_756173 ) ) ( not ( = ?auto_756169 ?auto_756174 ) ) ( not ( = ?auto_756169 ?auto_756175 ) ) ( not ( = ?auto_756169 ?auto_756176 ) ) ( not ( = ?auto_756169 ?auto_756177 ) ) ( not ( = ?auto_756169 ?auto_756178 ) ) ( not ( = ?auto_756170 ?auto_756171 ) ) ( not ( = ?auto_756170 ?auto_756172 ) ) ( not ( = ?auto_756170 ?auto_756173 ) ) ( not ( = ?auto_756170 ?auto_756174 ) ) ( not ( = ?auto_756170 ?auto_756175 ) ) ( not ( = ?auto_756170 ?auto_756176 ) ) ( not ( = ?auto_756170 ?auto_756177 ) ) ( not ( = ?auto_756170 ?auto_756178 ) ) ( not ( = ?auto_756171 ?auto_756172 ) ) ( not ( = ?auto_756171 ?auto_756173 ) ) ( not ( = ?auto_756171 ?auto_756174 ) ) ( not ( = ?auto_756171 ?auto_756175 ) ) ( not ( = ?auto_756171 ?auto_756176 ) ) ( not ( = ?auto_756171 ?auto_756177 ) ) ( not ( = ?auto_756171 ?auto_756178 ) ) ( not ( = ?auto_756172 ?auto_756173 ) ) ( not ( = ?auto_756172 ?auto_756174 ) ) ( not ( = ?auto_756172 ?auto_756175 ) ) ( not ( = ?auto_756172 ?auto_756176 ) ) ( not ( = ?auto_756172 ?auto_756177 ) ) ( not ( = ?auto_756172 ?auto_756178 ) ) ( not ( = ?auto_756173 ?auto_756174 ) ) ( not ( = ?auto_756173 ?auto_756175 ) ) ( not ( = ?auto_756173 ?auto_756176 ) ) ( not ( = ?auto_756173 ?auto_756177 ) ) ( not ( = ?auto_756173 ?auto_756178 ) ) ( not ( = ?auto_756174 ?auto_756175 ) ) ( not ( = ?auto_756174 ?auto_756176 ) ) ( not ( = ?auto_756174 ?auto_756177 ) ) ( not ( = ?auto_756174 ?auto_756178 ) ) ( not ( = ?auto_756175 ?auto_756176 ) ) ( not ( = ?auto_756175 ?auto_756177 ) ) ( not ( = ?auto_756175 ?auto_756178 ) ) ( not ( = ?auto_756176 ?auto_756177 ) ) ( not ( = ?auto_756176 ?auto_756178 ) ) ( not ( = ?auto_756177 ?auto_756178 ) ) ( ON ?auto_756176 ?auto_756177 ) ( ON ?auto_756175 ?auto_756176 ) ( CLEAR ?auto_756173 ) ( ON ?auto_756174 ?auto_756175 ) ( CLEAR ?auto_756174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_756160 ?auto_756161 ?auto_756162 ?auto_756163 ?auto_756164 ?auto_756165 ?auto_756166 ?auto_756167 ?auto_756168 ?auto_756169 ?auto_756170 ?auto_756171 ?auto_756172 ?auto_756173 ?auto_756174 )
      ( MAKE-18PILE ?auto_756160 ?auto_756161 ?auto_756162 ?auto_756163 ?auto_756164 ?auto_756165 ?auto_756166 ?auto_756167 ?auto_756168 ?auto_756169 ?auto_756170 ?auto_756171 ?auto_756172 ?auto_756173 ?auto_756174 ?auto_756175 ?auto_756176 ?auto_756177 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756197 - BLOCK
      ?auto_756198 - BLOCK
      ?auto_756199 - BLOCK
      ?auto_756200 - BLOCK
      ?auto_756201 - BLOCK
      ?auto_756202 - BLOCK
      ?auto_756203 - BLOCK
      ?auto_756204 - BLOCK
      ?auto_756205 - BLOCK
      ?auto_756206 - BLOCK
      ?auto_756207 - BLOCK
      ?auto_756208 - BLOCK
      ?auto_756209 - BLOCK
      ?auto_756210 - BLOCK
      ?auto_756211 - BLOCK
      ?auto_756212 - BLOCK
      ?auto_756213 - BLOCK
      ?auto_756214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756214 ) ( ON-TABLE ?auto_756197 ) ( ON ?auto_756198 ?auto_756197 ) ( ON ?auto_756199 ?auto_756198 ) ( ON ?auto_756200 ?auto_756199 ) ( ON ?auto_756201 ?auto_756200 ) ( ON ?auto_756202 ?auto_756201 ) ( ON ?auto_756203 ?auto_756202 ) ( ON ?auto_756204 ?auto_756203 ) ( ON ?auto_756205 ?auto_756204 ) ( ON ?auto_756206 ?auto_756205 ) ( ON ?auto_756207 ?auto_756206 ) ( ON ?auto_756208 ?auto_756207 ) ( ON ?auto_756209 ?auto_756208 ) ( ON ?auto_756210 ?auto_756209 ) ( not ( = ?auto_756197 ?auto_756198 ) ) ( not ( = ?auto_756197 ?auto_756199 ) ) ( not ( = ?auto_756197 ?auto_756200 ) ) ( not ( = ?auto_756197 ?auto_756201 ) ) ( not ( = ?auto_756197 ?auto_756202 ) ) ( not ( = ?auto_756197 ?auto_756203 ) ) ( not ( = ?auto_756197 ?auto_756204 ) ) ( not ( = ?auto_756197 ?auto_756205 ) ) ( not ( = ?auto_756197 ?auto_756206 ) ) ( not ( = ?auto_756197 ?auto_756207 ) ) ( not ( = ?auto_756197 ?auto_756208 ) ) ( not ( = ?auto_756197 ?auto_756209 ) ) ( not ( = ?auto_756197 ?auto_756210 ) ) ( not ( = ?auto_756197 ?auto_756211 ) ) ( not ( = ?auto_756197 ?auto_756212 ) ) ( not ( = ?auto_756197 ?auto_756213 ) ) ( not ( = ?auto_756197 ?auto_756214 ) ) ( not ( = ?auto_756198 ?auto_756199 ) ) ( not ( = ?auto_756198 ?auto_756200 ) ) ( not ( = ?auto_756198 ?auto_756201 ) ) ( not ( = ?auto_756198 ?auto_756202 ) ) ( not ( = ?auto_756198 ?auto_756203 ) ) ( not ( = ?auto_756198 ?auto_756204 ) ) ( not ( = ?auto_756198 ?auto_756205 ) ) ( not ( = ?auto_756198 ?auto_756206 ) ) ( not ( = ?auto_756198 ?auto_756207 ) ) ( not ( = ?auto_756198 ?auto_756208 ) ) ( not ( = ?auto_756198 ?auto_756209 ) ) ( not ( = ?auto_756198 ?auto_756210 ) ) ( not ( = ?auto_756198 ?auto_756211 ) ) ( not ( = ?auto_756198 ?auto_756212 ) ) ( not ( = ?auto_756198 ?auto_756213 ) ) ( not ( = ?auto_756198 ?auto_756214 ) ) ( not ( = ?auto_756199 ?auto_756200 ) ) ( not ( = ?auto_756199 ?auto_756201 ) ) ( not ( = ?auto_756199 ?auto_756202 ) ) ( not ( = ?auto_756199 ?auto_756203 ) ) ( not ( = ?auto_756199 ?auto_756204 ) ) ( not ( = ?auto_756199 ?auto_756205 ) ) ( not ( = ?auto_756199 ?auto_756206 ) ) ( not ( = ?auto_756199 ?auto_756207 ) ) ( not ( = ?auto_756199 ?auto_756208 ) ) ( not ( = ?auto_756199 ?auto_756209 ) ) ( not ( = ?auto_756199 ?auto_756210 ) ) ( not ( = ?auto_756199 ?auto_756211 ) ) ( not ( = ?auto_756199 ?auto_756212 ) ) ( not ( = ?auto_756199 ?auto_756213 ) ) ( not ( = ?auto_756199 ?auto_756214 ) ) ( not ( = ?auto_756200 ?auto_756201 ) ) ( not ( = ?auto_756200 ?auto_756202 ) ) ( not ( = ?auto_756200 ?auto_756203 ) ) ( not ( = ?auto_756200 ?auto_756204 ) ) ( not ( = ?auto_756200 ?auto_756205 ) ) ( not ( = ?auto_756200 ?auto_756206 ) ) ( not ( = ?auto_756200 ?auto_756207 ) ) ( not ( = ?auto_756200 ?auto_756208 ) ) ( not ( = ?auto_756200 ?auto_756209 ) ) ( not ( = ?auto_756200 ?auto_756210 ) ) ( not ( = ?auto_756200 ?auto_756211 ) ) ( not ( = ?auto_756200 ?auto_756212 ) ) ( not ( = ?auto_756200 ?auto_756213 ) ) ( not ( = ?auto_756200 ?auto_756214 ) ) ( not ( = ?auto_756201 ?auto_756202 ) ) ( not ( = ?auto_756201 ?auto_756203 ) ) ( not ( = ?auto_756201 ?auto_756204 ) ) ( not ( = ?auto_756201 ?auto_756205 ) ) ( not ( = ?auto_756201 ?auto_756206 ) ) ( not ( = ?auto_756201 ?auto_756207 ) ) ( not ( = ?auto_756201 ?auto_756208 ) ) ( not ( = ?auto_756201 ?auto_756209 ) ) ( not ( = ?auto_756201 ?auto_756210 ) ) ( not ( = ?auto_756201 ?auto_756211 ) ) ( not ( = ?auto_756201 ?auto_756212 ) ) ( not ( = ?auto_756201 ?auto_756213 ) ) ( not ( = ?auto_756201 ?auto_756214 ) ) ( not ( = ?auto_756202 ?auto_756203 ) ) ( not ( = ?auto_756202 ?auto_756204 ) ) ( not ( = ?auto_756202 ?auto_756205 ) ) ( not ( = ?auto_756202 ?auto_756206 ) ) ( not ( = ?auto_756202 ?auto_756207 ) ) ( not ( = ?auto_756202 ?auto_756208 ) ) ( not ( = ?auto_756202 ?auto_756209 ) ) ( not ( = ?auto_756202 ?auto_756210 ) ) ( not ( = ?auto_756202 ?auto_756211 ) ) ( not ( = ?auto_756202 ?auto_756212 ) ) ( not ( = ?auto_756202 ?auto_756213 ) ) ( not ( = ?auto_756202 ?auto_756214 ) ) ( not ( = ?auto_756203 ?auto_756204 ) ) ( not ( = ?auto_756203 ?auto_756205 ) ) ( not ( = ?auto_756203 ?auto_756206 ) ) ( not ( = ?auto_756203 ?auto_756207 ) ) ( not ( = ?auto_756203 ?auto_756208 ) ) ( not ( = ?auto_756203 ?auto_756209 ) ) ( not ( = ?auto_756203 ?auto_756210 ) ) ( not ( = ?auto_756203 ?auto_756211 ) ) ( not ( = ?auto_756203 ?auto_756212 ) ) ( not ( = ?auto_756203 ?auto_756213 ) ) ( not ( = ?auto_756203 ?auto_756214 ) ) ( not ( = ?auto_756204 ?auto_756205 ) ) ( not ( = ?auto_756204 ?auto_756206 ) ) ( not ( = ?auto_756204 ?auto_756207 ) ) ( not ( = ?auto_756204 ?auto_756208 ) ) ( not ( = ?auto_756204 ?auto_756209 ) ) ( not ( = ?auto_756204 ?auto_756210 ) ) ( not ( = ?auto_756204 ?auto_756211 ) ) ( not ( = ?auto_756204 ?auto_756212 ) ) ( not ( = ?auto_756204 ?auto_756213 ) ) ( not ( = ?auto_756204 ?auto_756214 ) ) ( not ( = ?auto_756205 ?auto_756206 ) ) ( not ( = ?auto_756205 ?auto_756207 ) ) ( not ( = ?auto_756205 ?auto_756208 ) ) ( not ( = ?auto_756205 ?auto_756209 ) ) ( not ( = ?auto_756205 ?auto_756210 ) ) ( not ( = ?auto_756205 ?auto_756211 ) ) ( not ( = ?auto_756205 ?auto_756212 ) ) ( not ( = ?auto_756205 ?auto_756213 ) ) ( not ( = ?auto_756205 ?auto_756214 ) ) ( not ( = ?auto_756206 ?auto_756207 ) ) ( not ( = ?auto_756206 ?auto_756208 ) ) ( not ( = ?auto_756206 ?auto_756209 ) ) ( not ( = ?auto_756206 ?auto_756210 ) ) ( not ( = ?auto_756206 ?auto_756211 ) ) ( not ( = ?auto_756206 ?auto_756212 ) ) ( not ( = ?auto_756206 ?auto_756213 ) ) ( not ( = ?auto_756206 ?auto_756214 ) ) ( not ( = ?auto_756207 ?auto_756208 ) ) ( not ( = ?auto_756207 ?auto_756209 ) ) ( not ( = ?auto_756207 ?auto_756210 ) ) ( not ( = ?auto_756207 ?auto_756211 ) ) ( not ( = ?auto_756207 ?auto_756212 ) ) ( not ( = ?auto_756207 ?auto_756213 ) ) ( not ( = ?auto_756207 ?auto_756214 ) ) ( not ( = ?auto_756208 ?auto_756209 ) ) ( not ( = ?auto_756208 ?auto_756210 ) ) ( not ( = ?auto_756208 ?auto_756211 ) ) ( not ( = ?auto_756208 ?auto_756212 ) ) ( not ( = ?auto_756208 ?auto_756213 ) ) ( not ( = ?auto_756208 ?auto_756214 ) ) ( not ( = ?auto_756209 ?auto_756210 ) ) ( not ( = ?auto_756209 ?auto_756211 ) ) ( not ( = ?auto_756209 ?auto_756212 ) ) ( not ( = ?auto_756209 ?auto_756213 ) ) ( not ( = ?auto_756209 ?auto_756214 ) ) ( not ( = ?auto_756210 ?auto_756211 ) ) ( not ( = ?auto_756210 ?auto_756212 ) ) ( not ( = ?auto_756210 ?auto_756213 ) ) ( not ( = ?auto_756210 ?auto_756214 ) ) ( not ( = ?auto_756211 ?auto_756212 ) ) ( not ( = ?auto_756211 ?auto_756213 ) ) ( not ( = ?auto_756211 ?auto_756214 ) ) ( not ( = ?auto_756212 ?auto_756213 ) ) ( not ( = ?auto_756212 ?auto_756214 ) ) ( not ( = ?auto_756213 ?auto_756214 ) ) ( ON ?auto_756213 ?auto_756214 ) ( ON ?auto_756212 ?auto_756213 ) ( CLEAR ?auto_756210 ) ( ON ?auto_756211 ?auto_756212 ) ( CLEAR ?auto_756211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_756197 ?auto_756198 ?auto_756199 ?auto_756200 ?auto_756201 ?auto_756202 ?auto_756203 ?auto_756204 ?auto_756205 ?auto_756206 ?auto_756207 ?auto_756208 ?auto_756209 ?auto_756210 ?auto_756211 )
      ( MAKE-18PILE ?auto_756197 ?auto_756198 ?auto_756199 ?auto_756200 ?auto_756201 ?auto_756202 ?auto_756203 ?auto_756204 ?auto_756205 ?auto_756206 ?auto_756207 ?auto_756208 ?auto_756209 ?auto_756210 ?auto_756211 ?auto_756212 ?auto_756213 ?auto_756214 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756233 - BLOCK
      ?auto_756234 - BLOCK
      ?auto_756235 - BLOCK
      ?auto_756236 - BLOCK
      ?auto_756237 - BLOCK
      ?auto_756238 - BLOCK
      ?auto_756239 - BLOCK
      ?auto_756240 - BLOCK
      ?auto_756241 - BLOCK
      ?auto_756242 - BLOCK
      ?auto_756243 - BLOCK
      ?auto_756244 - BLOCK
      ?auto_756245 - BLOCK
      ?auto_756246 - BLOCK
      ?auto_756247 - BLOCK
      ?auto_756248 - BLOCK
      ?auto_756249 - BLOCK
      ?auto_756250 - BLOCK
    )
    :vars
    (
      ?auto_756251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756250 ?auto_756251 ) ( ON-TABLE ?auto_756233 ) ( ON ?auto_756234 ?auto_756233 ) ( ON ?auto_756235 ?auto_756234 ) ( ON ?auto_756236 ?auto_756235 ) ( ON ?auto_756237 ?auto_756236 ) ( ON ?auto_756238 ?auto_756237 ) ( ON ?auto_756239 ?auto_756238 ) ( ON ?auto_756240 ?auto_756239 ) ( ON ?auto_756241 ?auto_756240 ) ( ON ?auto_756242 ?auto_756241 ) ( ON ?auto_756243 ?auto_756242 ) ( ON ?auto_756244 ?auto_756243 ) ( ON ?auto_756245 ?auto_756244 ) ( not ( = ?auto_756233 ?auto_756234 ) ) ( not ( = ?auto_756233 ?auto_756235 ) ) ( not ( = ?auto_756233 ?auto_756236 ) ) ( not ( = ?auto_756233 ?auto_756237 ) ) ( not ( = ?auto_756233 ?auto_756238 ) ) ( not ( = ?auto_756233 ?auto_756239 ) ) ( not ( = ?auto_756233 ?auto_756240 ) ) ( not ( = ?auto_756233 ?auto_756241 ) ) ( not ( = ?auto_756233 ?auto_756242 ) ) ( not ( = ?auto_756233 ?auto_756243 ) ) ( not ( = ?auto_756233 ?auto_756244 ) ) ( not ( = ?auto_756233 ?auto_756245 ) ) ( not ( = ?auto_756233 ?auto_756246 ) ) ( not ( = ?auto_756233 ?auto_756247 ) ) ( not ( = ?auto_756233 ?auto_756248 ) ) ( not ( = ?auto_756233 ?auto_756249 ) ) ( not ( = ?auto_756233 ?auto_756250 ) ) ( not ( = ?auto_756233 ?auto_756251 ) ) ( not ( = ?auto_756234 ?auto_756235 ) ) ( not ( = ?auto_756234 ?auto_756236 ) ) ( not ( = ?auto_756234 ?auto_756237 ) ) ( not ( = ?auto_756234 ?auto_756238 ) ) ( not ( = ?auto_756234 ?auto_756239 ) ) ( not ( = ?auto_756234 ?auto_756240 ) ) ( not ( = ?auto_756234 ?auto_756241 ) ) ( not ( = ?auto_756234 ?auto_756242 ) ) ( not ( = ?auto_756234 ?auto_756243 ) ) ( not ( = ?auto_756234 ?auto_756244 ) ) ( not ( = ?auto_756234 ?auto_756245 ) ) ( not ( = ?auto_756234 ?auto_756246 ) ) ( not ( = ?auto_756234 ?auto_756247 ) ) ( not ( = ?auto_756234 ?auto_756248 ) ) ( not ( = ?auto_756234 ?auto_756249 ) ) ( not ( = ?auto_756234 ?auto_756250 ) ) ( not ( = ?auto_756234 ?auto_756251 ) ) ( not ( = ?auto_756235 ?auto_756236 ) ) ( not ( = ?auto_756235 ?auto_756237 ) ) ( not ( = ?auto_756235 ?auto_756238 ) ) ( not ( = ?auto_756235 ?auto_756239 ) ) ( not ( = ?auto_756235 ?auto_756240 ) ) ( not ( = ?auto_756235 ?auto_756241 ) ) ( not ( = ?auto_756235 ?auto_756242 ) ) ( not ( = ?auto_756235 ?auto_756243 ) ) ( not ( = ?auto_756235 ?auto_756244 ) ) ( not ( = ?auto_756235 ?auto_756245 ) ) ( not ( = ?auto_756235 ?auto_756246 ) ) ( not ( = ?auto_756235 ?auto_756247 ) ) ( not ( = ?auto_756235 ?auto_756248 ) ) ( not ( = ?auto_756235 ?auto_756249 ) ) ( not ( = ?auto_756235 ?auto_756250 ) ) ( not ( = ?auto_756235 ?auto_756251 ) ) ( not ( = ?auto_756236 ?auto_756237 ) ) ( not ( = ?auto_756236 ?auto_756238 ) ) ( not ( = ?auto_756236 ?auto_756239 ) ) ( not ( = ?auto_756236 ?auto_756240 ) ) ( not ( = ?auto_756236 ?auto_756241 ) ) ( not ( = ?auto_756236 ?auto_756242 ) ) ( not ( = ?auto_756236 ?auto_756243 ) ) ( not ( = ?auto_756236 ?auto_756244 ) ) ( not ( = ?auto_756236 ?auto_756245 ) ) ( not ( = ?auto_756236 ?auto_756246 ) ) ( not ( = ?auto_756236 ?auto_756247 ) ) ( not ( = ?auto_756236 ?auto_756248 ) ) ( not ( = ?auto_756236 ?auto_756249 ) ) ( not ( = ?auto_756236 ?auto_756250 ) ) ( not ( = ?auto_756236 ?auto_756251 ) ) ( not ( = ?auto_756237 ?auto_756238 ) ) ( not ( = ?auto_756237 ?auto_756239 ) ) ( not ( = ?auto_756237 ?auto_756240 ) ) ( not ( = ?auto_756237 ?auto_756241 ) ) ( not ( = ?auto_756237 ?auto_756242 ) ) ( not ( = ?auto_756237 ?auto_756243 ) ) ( not ( = ?auto_756237 ?auto_756244 ) ) ( not ( = ?auto_756237 ?auto_756245 ) ) ( not ( = ?auto_756237 ?auto_756246 ) ) ( not ( = ?auto_756237 ?auto_756247 ) ) ( not ( = ?auto_756237 ?auto_756248 ) ) ( not ( = ?auto_756237 ?auto_756249 ) ) ( not ( = ?auto_756237 ?auto_756250 ) ) ( not ( = ?auto_756237 ?auto_756251 ) ) ( not ( = ?auto_756238 ?auto_756239 ) ) ( not ( = ?auto_756238 ?auto_756240 ) ) ( not ( = ?auto_756238 ?auto_756241 ) ) ( not ( = ?auto_756238 ?auto_756242 ) ) ( not ( = ?auto_756238 ?auto_756243 ) ) ( not ( = ?auto_756238 ?auto_756244 ) ) ( not ( = ?auto_756238 ?auto_756245 ) ) ( not ( = ?auto_756238 ?auto_756246 ) ) ( not ( = ?auto_756238 ?auto_756247 ) ) ( not ( = ?auto_756238 ?auto_756248 ) ) ( not ( = ?auto_756238 ?auto_756249 ) ) ( not ( = ?auto_756238 ?auto_756250 ) ) ( not ( = ?auto_756238 ?auto_756251 ) ) ( not ( = ?auto_756239 ?auto_756240 ) ) ( not ( = ?auto_756239 ?auto_756241 ) ) ( not ( = ?auto_756239 ?auto_756242 ) ) ( not ( = ?auto_756239 ?auto_756243 ) ) ( not ( = ?auto_756239 ?auto_756244 ) ) ( not ( = ?auto_756239 ?auto_756245 ) ) ( not ( = ?auto_756239 ?auto_756246 ) ) ( not ( = ?auto_756239 ?auto_756247 ) ) ( not ( = ?auto_756239 ?auto_756248 ) ) ( not ( = ?auto_756239 ?auto_756249 ) ) ( not ( = ?auto_756239 ?auto_756250 ) ) ( not ( = ?auto_756239 ?auto_756251 ) ) ( not ( = ?auto_756240 ?auto_756241 ) ) ( not ( = ?auto_756240 ?auto_756242 ) ) ( not ( = ?auto_756240 ?auto_756243 ) ) ( not ( = ?auto_756240 ?auto_756244 ) ) ( not ( = ?auto_756240 ?auto_756245 ) ) ( not ( = ?auto_756240 ?auto_756246 ) ) ( not ( = ?auto_756240 ?auto_756247 ) ) ( not ( = ?auto_756240 ?auto_756248 ) ) ( not ( = ?auto_756240 ?auto_756249 ) ) ( not ( = ?auto_756240 ?auto_756250 ) ) ( not ( = ?auto_756240 ?auto_756251 ) ) ( not ( = ?auto_756241 ?auto_756242 ) ) ( not ( = ?auto_756241 ?auto_756243 ) ) ( not ( = ?auto_756241 ?auto_756244 ) ) ( not ( = ?auto_756241 ?auto_756245 ) ) ( not ( = ?auto_756241 ?auto_756246 ) ) ( not ( = ?auto_756241 ?auto_756247 ) ) ( not ( = ?auto_756241 ?auto_756248 ) ) ( not ( = ?auto_756241 ?auto_756249 ) ) ( not ( = ?auto_756241 ?auto_756250 ) ) ( not ( = ?auto_756241 ?auto_756251 ) ) ( not ( = ?auto_756242 ?auto_756243 ) ) ( not ( = ?auto_756242 ?auto_756244 ) ) ( not ( = ?auto_756242 ?auto_756245 ) ) ( not ( = ?auto_756242 ?auto_756246 ) ) ( not ( = ?auto_756242 ?auto_756247 ) ) ( not ( = ?auto_756242 ?auto_756248 ) ) ( not ( = ?auto_756242 ?auto_756249 ) ) ( not ( = ?auto_756242 ?auto_756250 ) ) ( not ( = ?auto_756242 ?auto_756251 ) ) ( not ( = ?auto_756243 ?auto_756244 ) ) ( not ( = ?auto_756243 ?auto_756245 ) ) ( not ( = ?auto_756243 ?auto_756246 ) ) ( not ( = ?auto_756243 ?auto_756247 ) ) ( not ( = ?auto_756243 ?auto_756248 ) ) ( not ( = ?auto_756243 ?auto_756249 ) ) ( not ( = ?auto_756243 ?auto_756250 ) ) ( not ( = ?auto_756243 ?auto_756251 ) ) ( not ( = ?auto_756244 ?auto_756245 ) ) ( not ( = ?auto_756244 ?auto_756246 ) ) ( not ( = ?auto_756244 ?auto_756247 ) ) ( not ( = ?auto_756244 ?auto_756248 ) ) ( not ( = ?auto_756244 ?auto_756249 ) ) ( not ( = ?auto_756244 ?auto_756250 ) ) ( not ( = ?auto_756244 ?auto_756251 ) ) ( not ( = ?auto_756245 ?auto_756246 ) ) ( not ( = ?auto_756245 ?auto_756247 ) ) ( not ( = ?auto_756245 ?auto_756248 ) ) ( not ( = ?auto_756245 ?auto_756249 ) ) ( not ( = ?auto_756245 ?auto_756250 ) ) ( not ( = ?auto_756245 ?auto_756251 ) ) ( not ( = ?auto_756246 ?auto_756247 ) ) ( not ( = ?auto_756246 ?auto_756248 ) ) ( not ( = ?auto_756246 ?auto_756249 ) ) ( not ( = ?auto_756246 ?auto_756250 ) ) ( not ( = ?auto_756246 ?auto_756251 ) ) ( not ( = ?auto_756247 ?auto_756248 ) ) ( not ( = ?auto_756247 ?auto_756249 ) ) ( not ( = ?auto_756247 ?auto_756250 ) ) ( not ( = ?auto_756247 ?auto_756251 ) ) ( not ( = ?auto_756248 ?auto_756249 ) ) ( not ( = ?auto_756248 ?auto_756250 ) ) ( not ( = ?auto_756248 ?auto_756251 ) ) ( not ( = ?auto_756249 ?auto_756250 ) ) ( not ( = ?auto_756249 ?auto_756251 ) ) ( not ( = ?auto_756250 ?auto_756251 ) ) ( ON ?auto_756249 ?auto_756250 ) ( ON ?auto_756248 ?auto_756249 ) ( ON ?auto_756247 ?auto_756248 ) ( CLEAR ?auto_756245 ) ( ON ?auto_756246 ?auto_756247 ) ( CLEAR ?auto_756246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_756233 ?auto_756234 ?auto_756235 ?auto_756236 ?auto_756237 ?auto_756238 ?auto_756239 ?auto_756240 ?auto_756241 ?auto_756242 ?auto_756243 ?auto_756244 ?auto_756245 ?auto_756246 )
      ( MAKE-18PILE ?auto_756233 ?auto_756234 ?auto_756235 ?auto_756236 ?auto_756237 ?auto_756238 ?auto_756239 ?auto_756240 ?auto_756241 ?auto_756242 ?auto_756243 ?auto_756244 ?auto_756245 ?auto_756246 ?auto_756247 ?auto_756248 ?auto_756249 ?auto_756250 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756270 - BLOCK
      ?auto_756271 - BLOCK
      ?auto_756272 - BLOCK
      ?auto_756273 - BLOCK
      ?auto_756274 - BLOCK
      ?auto_756275 - BLOCK
      ?auto_756276 - BLOCK
      ?auto_756277 - BLOCK
      ?auto_756278 - BLOCK
      ?auto_756279 - BLOCK
      ?auto_756280 - BLOCK
      ?auto_756281 - BLOCK
      ?auto_756282 - BLOCK
      ?auto_756283 - BLOCK
      ?auto_756284 - BLOCK
      ?auto_756285 - BLOCK
      ?auto_756286 - BLOCK
      ?auto_756287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756287 ) ( ON-TABLE ?auto_756270 ) ( ON ?auto_756271 ?auto_756270 ) ( ON ?auto_756272 ?auto_756271 ) ( ON ?auto_756273 ?auto_756272 ) ( ON ?auto_756274 ?auto_756273 ) ( ON ?auto_756275 ?auto_756274 ) ( ON ?auto_756276 ?auto_756275 ) ( ON ?auto_756277 ?auto_756276 ) ( ON ?auto_756278 ?auto_756277 ) ( ON ?auto_756279 ?auto_756278 ) ( ON ?auto_756280 ?auto_756279 ) ( ON ?auto_756281 ?auto_756280 ) ( ON ?auto_756282 ?auto_756281 ) ( not ( = ?auto_756270 ?auto_756271 ) ) ( not ( = ?auto_756270 ?auto_756272 ) ) ( not ( = ?auto_756270 ?auto_756273 ) ) ( not ( = ?auto_756270 ?auto_756274 ) ) ( not ( = ?auto_756270 ?auto_756275 ) ) ( not ( = ?auto_756270 ?auto_756276 ) ) ( not ( = ?auto_756270 ?auto_756277 ) ) ( not ( = ?auto_756270 ?auto_756278 ) ) ( not ( = ?auto_756270 ?auto_756279 ) ) ( not ( = ?auto_756270 ?auto_756280 ) ) ( not ( = ?auto_756270 ?auto_756281 ) ) ( not ( = ?auto_756270 ?auto_756282 ) ) ( not ( = ?auto_756270 ?auto_756283 ) ) ( not ( = ?auto_756270 ?auto_756284 ) ) ( not ( = ?auto_756270 ?auto_756285 ) ) ( not ( = ?auto_756270 ?auto_756286 ) ) ( not ( = ?auto_756270 ?auto_756287 ) ) ( not ( = ?auto_756271 ?auto_756272 ) ) ( not ( = ?auto_756271 ?auto_756273 ) ) ( not ( = ?auto_756271 ?auto_756274 ) ) ( not ( = ?auto_756271 ?auto_756275 ) ) ( not ( = ?auto_756271 ?auto_756276 ) ) ( not ( = ?auto_756271 ?auto_756277 ) ) ( not ( = ?auto_756271 ?auto_756278 ) ) ( not ( = ?auto_756271 ?auto_756279 ) ) ( not ( = ?auto_756271 ?auto_756280 ) ) ( not ( = ?auto_756271 ?auto_756281 ) ) ( not ( = ?auto_756271 ?auto_756282 ) ) ( not ( = ?auto_756271 ?auto_756283 ) ) ( not ( = ?auto_756271 ?auto_756284 ) ) ( not ( = ?auto_756271 ?auto_756285 ) ) ( not ( = ?auto_756271 ?auto_756286 ) ) ( not ( = ?auto_756271 ?auto_756287 ) ) ( not ( = ?auto_756272 ?auto_756273 ) ) ( not ( = ?auto_756272 ?auto_756274 ) ) ( not ( = ?auto_756272 ?auto_756275 ) ) ( not ( = ?auto_756272 ?auto_756276 ) ) ( not ( = ?auto_756272 ?auto_756277 ) ) ( not ( = ?auto_756272 ?auto_756278 ) ) ( not ( = ?auto_756272 ?auto_756279 ) ) ( not ( = ?auto_756272 ?auto_756280 ) ) ( not ( = ?auto_756272 ?auto_756281 ) ) ( not ( = ?auto_756272 ?auto_756282 ) ) ( not ( = ?auto_756272 ?auto_756283 ) ) ( not ( = ?auto_756272 ?auto_756284 ) ) ( not ( = ?auto_756272 ?auto_756285 ) ) ( not ( = ?auto_756272 ?auto_756286 ) ) ( not ( = ?auto_756272 ?auto_756287 ) ) ( not ( = ?auto_756273 ?auto_756274 ) ) ( not ( = ?auto_756273 ?auto_756275 ) ) ( not ( = ?auto_756273 ?auto_756276 ) ) ( not ( = ?auto_756273 ?auto_756277 ) ) ( not ( = ?auto_756273 ?auto_756278 ) ) ( not ( = ?auto_756273 ?auto_756279 ) ) ( not ( = ?auto_756273 ?auto_756280 ) ) ( not ( = ?auto_756273 ?auto_756281 ) ) ( not ( = ?auto_756273 ?auto_756282 ) ) ( not ( = ?auto_756273 ?auto_756283 ) ) ( not ( = ?auto_756273 ?auto_756284 ) ) ( not ( = ?auto_756273 ?auto_756285 ) ) ( not ( = ?auto_756273 ?auto_756286 ) ) ( not ( = ?auto_756273 ?auto_756287 ) ) ( not ( = ?auto_756274 ?auto_756275 ) ) ( not ( = ?auto_756274 ?auto_756276 ) ) ( not ( = ?auto_756274 ?auto_756277 ) ) ( not ( = ?auto_756274 ?auto_756278 ) ) ( not ( = ?auto_756274 ?auto_756279 ) ) ( not ( = ?auto_756274 ?auto_756280 ) ) ( not ( = ?auto_756274 ?auto_756281 ) ) ( not ( = ?auto_756274 ?auto_756282 ) ) ( not ( = ?auto_756274 ?auto_756283 ) ) ( not ( = ?auto_756274 ?auto_756284 ) ) ( not ( = ?auto_756274 ?auto_756285 ) ) ( not ( = ?auto_756274 ?auto_756286 ) ) ( not ( = ?auto_756274 ?auto_756287 ) ) ( not ( = ?auto_756275 ?auto_756276 ) ) ( not ( = ?auto_756275 ?auto_756277 ) ) ( not ( = ?auto_756275 ?auto_756278 ) ) ( not ( = ?auto_756275 ?auto_756279 ) ) ( not ( = ?auto_756275 ?auto_756280 ) ) ( not ( = ?auto_756275 ?auto_756281 ) ) ( not ( = ?auto_756275 ?auto_756282 ) ) ( not ( = ?auto_756275 ?auto_756283 ) ) ( not ( = ?auto_756275 ?auto_756284 ) ) ( not ( = ?auto_756275 ?auto_756285 ) ) ( not ( = ?auto_756275 ?auto_756286 ) ) ( not ( = ?auto_756275 ?auto_756287 ) ) ( not ( = ?auto_756276 ?auto_756277 ) ) ( not ( = ?auto_756276 ?auto_756278 ) ) ( not ( = ?auto_756276 ?auto_756279 ) ) ( not ( = ?auto_756276 ?auto_756280 ) ) ( not ( = ?auto_756276 ?auto_756281 ) ) ( not ( = ?auto_756276 ?auto_756282 ) ) ( not ( = ?auto_756276 ?auto_756283 ) ) ( not ( = ?auto_756276 ?auto_756284 ) ) ( not ( = ?auto_756276 ?auto_756285 ) ) ( not ( = ?auto_756276 ?auto_756286 ) ) ( not ( = ?auto_756276 ?auto_756287 ) ) ( not ( = ?auto_756277 ?auto_756278 ) ) ( not ( = ?auto_756277 ?auto_756279 ) ) ( not ( = ?auto_756277 ?auto_756280 ) ) ( not ( = ?auto_756277 ?auto_756281 ) ) ( not ( = ?auto_756277 ?auto_756282 ) ) ( not ( = ?auto_756277 ?auto_756283 ) ) ( not ( = ?auto_756277 ?auto_756284 ) ) ( not ( = ?auto_756277 ?auto_756285 ) ) ( not ( = ?auto_756277 ?auto_756286 ) ) ( not ( = ?auto_756277 ?auto_756287 ) ) ( not ( = ?auto_756278 ?auto_756279 ) ) ( not ( = ?auto_756278 ?auto_756280 ) ) ( not ( = ?auto_756278 ?auto_756281 ) ) ( not ( = ?auto_756278 ?auto_756282 ) ) ( not ( = ?auto_756278 ?auto_756283 ) ) ( not ( = ?auto_756278 ?auto_756284 ) ) ( not ( = ?auto_756278 ?auto_756285 ) ) ( not ( = ?auto_756278 ?auto_756286 ) ) ( not ( = ?auto_756278 ?auto_756287 ) ) ( not ( = ?auto_756279 ?auto_756280 ) ) ( not ( = ?auto_756279 ?auto_756281 ) ) ( not ( = ?auto_756279 ?auto_756282 ) ) ( not ( = ?auto_756279 ?auto_756283 ) ) ( not ( = ?auto_756279 ?auto_756284 ) ) ( not ( = ?auto_756279 ?auto_756285 ) ) ( not ( = ?auto_756279 ?auto_756286 ) ) ( not ( = ?auto_756279 ?auto_756287 ) ) ( not ( = ?auto_756280 ?auto_756281 ) ) ( not ( = ?auto_756280 ?auto_756282 ) ) ( not ( = ?auto_756280 ?auto_756283 ) ) ( not ( = ?auto_756280 ?auto_756284 ) ) ( not ( = ?auto_756280 ?auto_756285 ) ) ( not ( = ?auto_756280 ?auto_756286 ) ) ( not ( = ?auto_756280 ?auto_756287 ) ) ( not ( = ?auto_756281 ?auto_756282 ) ) ( not ( = ?auto_756281 ?auto_756283 ) ) ( not ( = ?auto_756281 ?auto_756284 ) ) ( not ( = ?auto_756281 ?auto_756285 ) ) ( not ( = ?auto_756281 ?auto_756286 ) ) ( not ( = ?auto_756281 ?auto_756287 ) ) ( not ( = ?auto_756282 ?auto_756283 ) ) ( not ( = ?auto_756282 ?auto_756284 ) ) ( not ( = ?auto_756282 ?auto_756285 ) ) ( not ( = ?auto_756282 ?auto_756286 ) ) ( not ( = ?auto_756282 ?auto_756287 ) ) ( not ( = ?auto_756283 ?auto_756284 ) ) ( not ( = ?auto_756283 ?auto_756285 ) ) ( not ( = ?auto_756283 ?auto_756286 ) ) ( not ( = ?auto_756283 ?auto_756287 ) ) ( not ( = ?auto_756284 ?auto_756285 ) ) ( not ( = ?auto_756284 ?auto_756286 ) ) ( not ( = ?auto_756284 ?auto_756287 ) ) ( not ( = ?auto_756285 ?auto_756286 ) ) ( not ( = ?auto_756285 ?auto_756287 ) ) ( not ( = ?auto_756286 ?auto_756287 ) ) ( ON ?auto_756286 ?auto_756287 ) ( ON ?auto_756285 ?auto_756286 ) ( ON ?auto_756284 ?auto_756285 ) ( CLEAR ?auto_756282 ) ( ON ?auto_756283 ?auto_756284 ) ( CLEAR ?auto_756283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_756270 ?auto_756271 ?auto_756272 ?auto_756273 ?auto_756274 ?auto_756275 ?auto_756276 ?auto_756277 ?auto_756278 ?auto_756279 ?auto_756280 ?auto_756281 ?auto_756282 ?auto_756283 )
      ( MAKE-18PILE ?auto_756270 ?auto_756271 ?auto_756272 ?auto_756273 ?auto_756274 ?auto_756275 ?auto_756276 ?auto_756277 ?auto_756278 ?auto_756279 ?auto_756280 ?auto_756281 ?auto_756282 ?auto_756283 ?auto_756284 ?auto_756285 ?auto_756286 ?auto_756287 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756306 - BLOCK
      ?auto_756307 - BLOCK
      ?auto_756308 - BLOCK
      ?auto_756309 - BLOCK
      ?auto_756310 - BLOCK
      ?auto_756311 - BLOCK
      ?auto_756312 - BLOCK
      ?auto_756313 - BLOCK
      ?auto_756314 - BLOCK
      ?auto_756315 - BLOCK
      ?auto_756316 - BLOCK
      ?auto_756317 - BLOCK
      ?auto_756318 - BLOCK
      ?auto_756319 - BLOCK
      ?auto_756320 - BLOCK
      ?auto_756321 - BLOCK
      ?auto_756322 - BLOCK
      ?auto_756323 - BLOCK
    )
    :vars
    (
      ?auto_756324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756323 ?auto_756324 ) ( ON-TABLE ?auto_756306 ) ( ON ?auto_756307 ?auto_756306 ) ( ON ?auto_756308 ?auto_756307 ) ( ON ?auto_756309 ?auto_756308 ) ( ON ?auto_756310 ?auto_756309 ) ( ON ?auto_756311 ?auto_756310 ) ( ON ?auto_756312 ?auto_756311 ) ( ON ?auto_756313 ?auto_756312 ) ( ON ?auto_756314 ?auto_756313 ) ( ON ?auto_756315 ?auto_756314 ) ( ON ?auto_756316 ?auto_756315 ) ( ON ?auto_756317 ?auto_756316 ) ( not ( = ?auto_756306 ?auto_756307 ) ) ( not ( = ?auto_756306 ?auto_756308 ) ) ( not ( = ?auto_756306 ?auto_756309 ) ) ( not ( = ?auto_756306 ?auto_756310 ) ) ( not ( = ?auto_756306 ?auto_756311 ) ) ( not ( = ?auto_756306 ?auto_756312 ) ) ( not ( = ?auto_756306 ?auto_756313 ) ) ( not ( = ?auto_756306 ?auto_756314 ) ) ( not ( = ?auto_756306 ?auto_756315 ) ) ( not ( = ?auto_756306 ?auto_756316 ) ) ( not ( = ?auto_756306 ?auto_756317 ) ) ( not ( = ?auto_756306 ?auto_756318 ) ) ( not ( = ?auto_756306 ?auto_756319 ) ) ( not ( = ?auto_756306 ?auto_756320 ) ) ( not ( = ?auto_756306 ?auto_756321 ) ) ( not ( = ?auto_756306 ?auto_756322 ) ) ( not ( = ?auto_756306 ?auto_756323 ) ) ( not ( = ?auto_756306 ?auto_756324 ) ) ( not ( = ?auto_756307 ?auto_756308 ) ) ( not ( = ?auto_756307 ?auto_756309 ) ) ( not ( = ?auto_756307 ?auto_756310 ) ) ( not ( = ?auto_756307 ?auto_756311 ) ) ( not ( = ?auto_756307 ?auto_756312 ) ) ( not ( = ?auto_756307 ?auto_756313 ) ) ( not ( = ?auto_756307 ?auto_756314 ) ) ( not ( = ?auto_756307 ?auto_756315 ) ) ( not ( = ?auto_756307 ?auto_756316 ) ) ( not ( = ?auto_756307 ?auto_756317 ) ) ( not ( = ?auto_756307 ?auto_756318 ) ) ( not ( = ?auto_756307 ?auto_756319 ) ) ( not ( = ?auto_756307 ?auto_756320 ) ) ( not ( = ?auto_756307 ?auto_756321 ) ) ( not ( = ?auto_756307 ?auto_756322 ) ) ( not ( = ?auto_756307 ?auto_756323 ) ) ( not ( = ?auto_756307 ?auto_756324 ) ) ( not ( = ?auto_756308 ?auto_756309 ) ) ( not ( = ?auto_756308 ?auto_756310 ) ) ( not ( = ?auto_756308 ?auto_756311 ) ) ( not ( = ?auto_756308 ?auto_756312 ) ) ( not ( = ?auto_756308 ?auto_756313 ) ) ( not ( = ?auto_756308 ?auto_756314 ) ) ( not ( = ?auto_756308 ?auto_756315 ) ) ( not ( = ?auto_756308 ?auto_756316 ) ) ( not ( = ?auto_756308 ?auto_756317 ) ) ( not ( = ?auto_756308 ?auto_756318 ) ) ( not ( = ?auto_756308 ?auto_756319 ) ) ( not ( = ?auto_756308 ?auto_756320 ) ) ( not ( = ?auto_756308 ?auto_756321 ) ) ( not ( = ?auto_756308 ?auto_756322 ) ) ( not ( = ?auto_756308 ?auto_756323 ) ) ( not ( = ?auto_756308 ?auto_756324 ) ) ( not ( = ?auto_756309 ?auto_756310 ) ) ( not ( = ?auto_756309 ?auto_756311 ) ) ( not ( = ?auto_756309 ?auto_756312 ) ) ( not ( = ?auto_756309 ?auto_756313 ) ) ( not ( = ?auto_756309 ?auto_756314 ) ) ( not ( = ?auto_756309 ?auto_756315 ) ) ( not ( = ?auto_756309 ?auto_756316 ) ) ( not ( = ?auto_756309 ?auto_756317 ) ) ( not ( = ?auto_756309 ?auto_756318 ) ) ( not ( = ?auto_756309 ?auto_756319 ) ) ( not ( = ?auto_756309 ?auto_756320 ) ) ( not ( = ?auto_756309 ?auto_756321 ) ) ( not ( = ?auto_756309 ?auto_756322 ) ) ( not ( = ?auto_756309 ?auto_756323 ) ) ( not ( = ?auto_756309 ?auto_756324 ) ) ( not ( = ?auto_756310 ?auto_756311 ) ) ( not ( = ?auto_756310 ?auto_756312 ) ) ( not ( = ?auto_756310 ?auto_756313 ) ) ( not ( = ?auto_756310 ?auto_756314 ) ) ( not ( = ?auto_756310 ?auto_756315 ) ) ( not ( = ?auto_756310 ?auto_756316 ) ) ( not ( = ?auto_756310 ?auto_756317 ) ) ( not ( = ?auto_756310 ?auto_756318 ) ) ( not ( = ?auto_756310 ?auto_756319 ) ) ( not ( = ?auto_756310 ?auto_756320 ) ) ( not ( = ?auto_756310 ?auto_756321 ) ) ( not ( = ?auto_756310 ?auto_756322 ) ) ( not ( = ?auto_756310 ?auto_756323 ) ) ( not ( = ?auto_756310 ?auto_756324 ) ) ( not ( = ?auto_756311 ?auto_756312 ) ) ( not ( = ?auto_756311 ?auto_756313 ) ) ( not ( = ?auto_756311 ?auto_756314 ) ) ( not ( = ?auto_756311 ?auto_756315 ) ) ( not ( = ?auto_756311 ?auto_756316 ) ) ( not ( = ?auto_756311 ?auto_756317 ) ) ( not ( = ?auto_756311 ?auto_756318 ) ) ( not ( = ?auto_756311 ?auto_756319 ) ) ( not ( = ?auto_756311 ?auto_756320 ) ) ( not ( = ?auto_756311 ?auto_756321 ) ) ( not ( = ?auto_756311 ?auto_756322 ) ) ( not ( = ?auto_756311 ?auto_756323 ) ) ( not ( = ?auto_756311 ?auto_756324 ) ) ( not ( = ?auto_756312 ?auto_756313 ) ) ( not ( = ?auto_756312 ?auto_756314 ) ) ( not ( = ?auto_756312 ?auto_756315 ) ) ( not ( = ?auto_756312 ?auto_756316 ) ) ( not ( = ?auto_756312 ?auto_756317 ) ) ( not ( = ?auto_756312 ?auto_756318 ) ) ( not ( = ?auto_756312 ?auto_756319 ) ) ( not ( = ?auto_756312 ?auto_756320 ) ) ( not ( = ?auto_756312 ?auto_756321 ) ) ( not ( = ?auto_756312 ?auto_756322 ) ) ( not ( = ?auto_756312 ?auto_756323 ) ) ( not ( = ?auto_756312 ?auto_756324 ) ) ( not ( = ?auto_756313 ?auto_756314 ) ) ( not ( = ?auto_756313 ?auto_756315 ) ) ( not ( = ?auto_756313 ?auto_756316 ) ) ( not ( = ?auto_756313 ?auto_756317 ) ) ( not ( = ?auto_756313 ?auto_756318 ) ) ( not ( = ?auto_756313 ?auto_756319 ) ) ( not ( = ?auto_756313 ?auto_756320 ) ) ( not ( = ?auto_756313 ?auto_756321 ) ) ( not ( = ?auto_756313 ?auto_756322 ) ) ( not ( = ?auto_756313 ?auto_756323 ) ) ( not ( = ?auto_756313 ?auto_756324 ) ) ( not ( = ?auto_756314 ?auto_756315 ) ) ( not ( = ?auto_756314 ?auto_756316 ) ) ( not ( = ?auto_756314 ?auto_756317 ) ) ( not ( = ?auto_756314 ?auto_756318 ) ) ( not ( = ?auto_756314 ?auto_756319 ) ) ( not ( = ?auto_756314 ?auto_756320 ) ) ( not ( = ?auto_756314 ?auto_756321 ) ) ( not ( = ?auto_756314 ?auto_756322 ) ) ( not ( = ?auto_756314 ?auto_756323 ) ) ( not ( = ?auto_756314 ?auto_756324 ) ) ( not ( = ?auto_756315 ?auto_756316 ) ) ( not ( = ?auto_756315 ?auto_756317 ) ) ( not ( = ?auto_756315 ?auto_756318 ) ) ( not ( = ?auto_756315 ?auto_756319 ) ) ( not ( = ?auto_756315 ?auto_756320 ) ) ( not ( = ?auto_756315 ?auto_756321 ) ) ( not ( = ?auto_756315 ?auto_756322 ) ) ( not ( = ?auto_756315 ?auto_756323 ) ) ( not ( = ?auto_756315 ?auto_756324 ) ) ( not ( = ?auto_756316 ?auto_756317 ) ) ( not ( = ?auto_756316 ?auto_756318 ) ) ( not ( = ?auto_756316 ?auto_756319 ) ) ( not ( = ?auto_756316 ?auto_756320 ) ) ( not ( = ?auto_756316 ?auto_756321 ) ) ( not ( = ?auto_756316 ?auto_756322 ) ) ( not ( = ?auto_756316 ?auto_756323 ) ) ( not ( = ?auto_756316 ?auto_756324 ) ) ( not ( = ?auto_756317 ?auto_756318 ) ) ( not ( = ?auto_756317 ?auto_756319 ) ) ( not ( = ?auto_756317 ?auto_756320 ) ) ( not ( = ?auto_756317 ?auto_756321 ) ) ( not ( = ?auto_756317 ?auto_756322 ) ) ( not ( = ?auto_756317 ?auto_756323 ) ) ( not ( = ?auto_756317 ?auto_756324 ) ) ( not ( = ?auto_756318 ?auto_756319 ) ) ( not ( = ?auto_756318 ?auto_756320 ) ) ( not ( = ?auto_756318 ?auto_756321 ) ) ( not ( = ?auto_756318 ?auto_756322 ) ) ( not ( = ?auto_756318 ?auto_756323 ) ) ( not ( = ?auto_756318 ?auto_756324 ) ) ( not ( = ?auto_756319 ?auto_756320 ) ) ( not ( = ?auto_756319 ?auto_756321 ) ) ( not ( = ?auto_756319 ?auto_756322 ) ) ( not ( = ?auto_756319 ?auto_756323 ) ) ( not ( = ?auto_756319 ?auto_756324 ) ) ( not ( = ?auto_756320 ?auto_756321 ) ) ( not ( = ?auto_756320 ?auto_756322 ) ) ( not ( = ?auto_756320 ?auto_756323 ) ) ( not ( = ?auto_756320 ?auto_756324 ) ) ( not ( = ?auto_756321 ?auto_756322 ) ) ( not ( = ?auto_756321 ?auto_756323 ) ) ( not ( = ?auto_756321 ?auto_756324 ) ) ( not ( = ?auto_756322 ?auto_756323 ) ) ( not ( = ?auto_756322 ?auto_756324 ) ) ( not ( = ?auto_756323 ?auto_756324 ) ) ( ON ?auto_756322 ?auto_756323 ) ( ON ?auto_756321 ?auto_756322 ) ( ON ?auto_756320 ?auto_756321 ) ( ON ?auto_756319 ?auto_756320 ) ( CLEAR ?auto_756317 ) ( ON ?auto_756318 ?auto_756319 ) ( CLEAR ?auto_756318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_756306 ?auto_756307 ?auto_756308 ?auto_756309 ?auto_756310 ?auto_756311 ?auto_756312 ?auto_756313 ?auto_756314 ?auto_756315 ?auto_756316 ?auto_756317 ?auto_756318 )
      ( MAKE-18PILE ?auto_756306 ?auto_756307 ?auto_756308 ?auto_756309 ?auto_756310 ?auto_756311 ?auto_756312 ?auto_756313 ?auto_756314 ?auto_756315 ?auto_756316 ?auto_756317 ?auto_756318 ?auto_756319 ?auto_756320 ?auto_756321 ?auto_756322 ?auto_756323 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756343 - BLOCK
      ?auto_756344 - BLOCK
      ?auto_756345 - BLOCK
      ?auto_756346 - BLOCK
      ?auto_756347 - BLOCK
      ?auto_756348 - BLOCK
      ?auto_756349 - BLOCK
      ?auto_756350 - BLOCK
      ?auto_756351 - BLOCK
      ?auto_756352 - BLOCK
      ?auto_756353 - BLOCK
      ?auto_756354 - BLOCK
      ?auto_756355 - BLOCK
      ?auto_756356 - BLOCK
      ?auto_756357 - BLOCK
      ?auto_756358 - BLOCK
      ?auto_756359 - BLOCK
      ?auto_756360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756360 ) ( ON-TABLE ?auto_756343 ) ( ON ?auto_756344 ?auto_756343 ) ( ON ?auto_756345 ?auto_756344 ) ( ON ?auto_756346 ?auto_756345 ) ( ON ?auto_756347 ?auto_756346 ) ( ON ?auto_756348 ?auto_756347 ) ( ON ?auto_756349 ?auto_756348 ) ( ON ?auto_756350 ?auto_756349 ) ( ON ?auto_756351 ?auto_756350 ) ( ON ?auto_756352 ?auto_756351 ) ( ON ?auto_756353 ?auto_756352 ) ( ON ?auto_756354 ?auto_756353 ) ( not ( = ?auto_756343 ?auto_756344 ) ) ( not ( = ?auto_756343 ?auto_756345 ) ) ( not ( = ?auto_756343 ?auto_756346 ) ) ( not ( = ?auto_756343 ?auto_756347 ) ) ( not ( = ?auto_756343 ?auto_756348 ) ) ( not ( = ?auto_756343 ?auto_756349 ) ) ( not ( = ?auto_756343 ?auto_756350 ) ) ( not ( = ?auto_756343 ?auto_756351 ) ) ( not ( = ?auto_756343 ?auto_756352 ) ) ( not ( = ?auto_756343 ?auto_756353 ) ) ( not ( = ?auto_756343 ?auto_756354 ) ) ( not ( = ?auto_756343 ?auto_756355 ) ) ( not ( = ?auto_756343 ?auto_756356 ) ) ( not ( = ?auto_756343 ?auto_756357 ) ) ( not ( = ?auto_756343 ?auto_756358 ) ) ( not ( = ?auto_756343 ?auto_756359 ) ) ( not ( = ?auto_756343 ?auto_756360 ) ) ( not ( = ?auto_756344 ?auto_756345 ) ) ( not ( = ?auto_756344 ?auto_756346 ) ) ( not ( = ?auto_756344 ?auto_756347 ) ) ( not ( = ?auto_756344 ?auto_756348 ) ) ( not ( = ?auto_756344 ?auto_756349 ) ) ( not ( = ?auto_756344 ?auto_756350 ) ) ( not ( = ?auto_756344 ?auto_756351 ) ) ( not ( = ?auto_756344 ?auto_756352 ) ) ( not ( = ?auto_756344 ?auto_756353 ) ) ( not ( = ?auto_756344 ?auto_756354 ) ) ( not ( = ?auto_756344 ?auto_756355 ) ) ( not ( = ?auto_756344 ?auto_756356 ) ) ( not ( = ?auto_756344 ?auto_756357 ) ) ( not ( = ?auto_756344 ?auto_756358 ) ) ( not ( = ?auto_756344 ?auto_756359 ) ) ( not ( = ?auto_756344 ?auto_756360 ) ) ( not ( = ?auto_756345 ?auto_756346 ) ) ( not ( = ?auto_756345 ?auto_756347 ) ) ( not ( = ?auto_756345 ?auto_756348 ) ) ( not ( = ?auto_756345 ?auto_756349 ) ) ( not ( = ?auto_756345 ?auto_756350 ) ) ( not ( = ?auto_756345 ?auto_756351 ) ) ( not ( = ?auto_756345 ?auto_756352 ) ) ( not ( = ?auto_756345 ?auto_756353 ) ) ( not ( = ?auto_756345 ?auto_756354 ) ) ( not ( = ?auto_756345 ?auto_756355 ) ) ( not ( = ?auto_756345 ?auto_756356 ) ) ( not ( = ?auto_756345 ?auto_756357 ) ) ( not ( = ?auto_756345 ?auto_756358 ) ) ( not ( = ?auto_756345 ?auto_756359 ) ) ( not ( = ?auto_756345 ?auto_756360 ) ) ( not ( = ?auto_756346 ?auto_756347 ) ) ( not ( = ?auto_756346 ?auto_756348 ) ) ( not ( = ?auto_756346 ?auto_756349 ) ) ( not ( = ?auto_756346 ?auto_756350 ) ) ( not ( = ?auto_756346 ?auto_756351 ) ) ( not ( = ?auto_756346 ?auto_756352 ) ) ( not ( = ?auto_756346 ?auto_756353 ) ) ( not ( = ?auto_756346 ?auto_756354 ) ) ( not ( = ?auto_756346 ?auto_756355 ) ) ( not ( = ?auto_756346 ?auto_756356 ) ) ( not ( = ?auto_756346 ?auto_756357 ) ) ( not ( = ?auto_756346 ?auto_756358 ) ) ( not ( = ?auto_756346 ?auto_756359 ) ) ( not ( = ?auto_756346 ?auto_756360 ) ) ( not ( = ?auto_756347 ?auto_756348 ) ) ( not ( = ?auto_756347 ?auto_756349 ) ) ( not ( = ?auto_756347 ?auto_756350 ) ) ( not ( = ?auto_756347 ?auto_756351 ) ) ( not ( = ?auto_756347 ?auto_756352 ) ) ( not ( = ?auto_756347 ?auto_756353 ) ) ( not ( = ?auto_756347 ?auto_756354 ) ) ( not ( = ?auto_756347 ?auto_756355 ) ) ( not ( = ?auto_756347 ?auto_756356 ) ) ( not ( = ?auto_756347 ?auto_756357 ) ) ( not ( = ?auto_756347 ?auto_756358 ) ) ( not ( = ?auto_756347 ?auto_756359 ) ) ( not ( = ?auto_756347 ?auto_756360 ) ) ( not ( = ?auto_756348 ?auto_756349 ) ) ( not ( = ?auto_756348 ?auto_756350 ) ) ( not ( = ?auto_756348 ?auto_756351 ) ) ( not ( = ?auto_756348 ?auto_756352 ) ) ( not ( = ?auto_756348 ?auto_756353 ) ) ( not ( = ?auto_756348 ?auto_756354 ) ) ( not ( = ?auto_756348 ?auto_756355 ) ) ( not ( = ?auto_756348 ?auto_756356 ) ) ( not ( = ?auto_756348 ?auto_756357 ) ) ( not ( = ?auto_756348 ?auto_756358 ) ) ( not ( = ?auto_756348 ?auto_756359 ) ) ( not ( = ?auto_756348 ?auto_756360 ) ) ( not ( = ?auto_756349 ?auto_756350 ) ) ( not ( = ?auto_756349 ?auto_756351 ) ) ( not ( = ?auto_756349 ?auto_756352 ) ) ( not ( = ?auto_756349 ?auto_756353 ) ) ( not ( = ?auto_756349 ?auto_756354 ) ) ( not ( = ?auto_756349 ?auto_756355 ) ) ( not ( = ?auto_756349 ?auto_756356 ) ) ( not ( = ?auto_756349 ?auto_756357 ) ) ( not ( = ?auto_756349 ?auto_756358 ) ) ( not ( = ?auto_756349 ?auto_756359 ) ) ( not ( = ?auto_756349 ?auto_756360 ) ) ( not ( = ?auto_756350 ?auto_756351 ) ) ( not ( = ?auto_756350 ?auto_756352 ) ) ( not ( = ?auto_756350 ?auto_756353 ) ) ( not ( = ?auto_756350 ?auto_756354 ) ) ( not ( = ?auto_756350 ?auto_756355 ) ) ( not ( = ?auto_756350 ?auto_756356 ) ) ( not ( = ?auto_756350 ?auto_756357 ) ) ( not ( = ?auto_756350 ?auto_756358 ) ) ( not ( = ?auto_756350 ?auto_756359 ) ) ( not ( = ?auto_756350 ?auto_756360 ) ) ( not ( = ?auto_756351 ?auto_756352 ) ) ( not ( = ?auto_756351 ?auto_756353 ) ) ( not ( = ?auto_756351 ?auto_756354 ) ) ( not ( = ?auto_756351 ?auto_756355 ) ) ( not ( = ?auto_756351 ?auto_756356 ) ) ( not ( = ?auto_756351 ?auto_756357 ) ) ( not ( = ?auto_756351 ?auto_756358 ) ) ( not ( = ?auto_756351 ?auto_756359 ) ) ( not ( = ?auto_756351 ?auto_756360 ) ) ( not ( = ?auto_756352 ?auto_756353 ) ) ( not ( = ?auto_756352 ?auto_756354 ) ) ( not ( = ?auto_756352 ?auto_756355 ) ) ( not ( = ?auto_756352 ?auto_756356 ) ) ( not ( = ?auto_756352 ?auto_756357 ) ) ( not ( = ?auto_756352 ?auto_756358 ) ) ( not ( = ?auto_756352 ?auto_756359 ) ) ( not ( = ?auto_756352 ?auto_756360 ) ) ( not ( = ?auto_756353 ?auto_756354 ) ) ( not ( = ?auto_756353 ?auto_756355 ) ) ( not ( = ?auto_756353 ?auto_756356 ) ) ( not ( = ?auto_756353 ?auto_756357 ) ) ( not ( = ?auto_756353 ?auto_756358 ) ) ( not ( = ?auto_756353 ?auto_756359 ) ) ( not ( = ?auto_756353 ?auto_756360 ) ) ( not ( = ?auto_756354 ?auto_756355 ) ) ( not ( = ?auto_756354 ?auto_756356 ) ) ( not ( = ?auto_756354 ?auto_756357 ) ) ( not ( = ?auto_756354 ?auto_756358 ) ) ( not ( = ?auto_756354 ?auto_756359 ) ) ( not ( = ?auto_756354 ?auto_756360 ) ) ( not ( = ?auto_756355 ?auto_756356 ) ) ( not ( = ?auto_756355 ?auto_756357 ) ) ( not ( = ?auto_756355 ?auto_756358 ) ) ( not ( = ?auto_756355 ?auto_756359 ) ) ( not ( = ?auto_756355 ?auto_756360 ) ) ( not ( = ?auto_756356 ?auto_756357 ) ) ( not ( = ?auto_756356 ?auto_756358 ) ) ( not ( = ?auto_756356 ?auto_756359 ) ) ( not ( = ?auto_756356 ?auto_756360 ) ) ( not ( = ?auto_756357 ?auto_756358 ) ) ( not ( = ?auto_756357 ?auto_756359 ) ) ( not ( = ?auto_756357 ?auto_756360 ) ) ( not ( = ?auto_756358 ?auto_756359 ) ) ( not ( = ?auto_756358 ?auto_756360 ) ) ( not ( = ?auto_756359 ?auto_756360 ) ) ( ON ?auto_756359 ?auto_756360 ) ( ON ?auto_756358 ?auto_756359 ) ( ON ?auto_756357 ?auto_756358 ) ( ON ?auto_756356 ?auto_756357 ) ( CLEAR ?auto_756354 ) ( ON ?auto_756355 ?auto_756356 ) ( CLEAR ?auto_756355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_756343 ?auto_756344 ?auto_756345 ?auto_756346 ?auto_756347 ?auto_756348 ?auto_756349 ?auto_756350 ?auto_756351 ?auto_756352 ?auto_756353 ?auto_756354 ?auto_756355 )
      ( MAKE-18PILE ?auto_756343 ?auto_756344 ?auto_756345 ?auto_756346 ?auto_756347 ?auto_756348 ?auto_756349 ?auto_756350 ?auto_756351 ?auto_756352 ?auto_756353 ?auto_756354 ?auto_756355 ?auto_756356 ?auto_756357 ?auto_756358 ?auto_756359 ?auto_756360 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756379 - BLOCK
      ?auto_756380 - BLOCK
      ?auto_756381 - BLOCK
      ?auto_756382 - BLOCK
      ?auto_756383 - BLOCK
      ?auto_756384 - BLOCK
      ?auto_756385 - BLOCK
      ?auto_756386 - BLOCK
      ?auto_756387 - BLOCK
      ?auto_756388 - BLOCK
      ?auto_756389 - BLOCK
      ?auto_756390 - BLOCK
      ?auto_756391 - BLOCK
      ?auto_756392 - BLOCK
      ?auto_756393 - BLOCK
      ?auto_756394 - BLOCK
      ?auto_756395 - BLOCK
      ?auto_756396 - BLOCK
    )
    :vars
    (
      ?auto_756397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756396 ?auto_756397 ) ( ON-TABLE ?auto_756379 ) ( ON ?auto_756380 ?auto_756379 ) ( ON ?auto_756381 ?auto_756380 ) ( ON ?auto_756382 ?auto_756381 ) ( ON ?auto_756383 ?auto_756382 ) ( ON ?auto_756384 ?auto_756383 ) ( ON ?auto_756385 ?auto_756384 ) ( ON ?auto_756386 ?auto_756385 ) ( ON ?auto_756387 ?auto_756386 ) ( ON ?auto_756388 ?auto_756387 ) ( ON ?auto_756389 ?auto_756388 ) ( not ( = ?auto_756379 ?auto_756380 ) ) ( not ( = ?auto_756379 ?auto_756381 ) ) ( not ( = ?auto_756379 ?auto_756382 ) ) ( not ( = ?auto_756379 ?auto_756383 ) ) ( not ( = ?auto_756379 ?auto_756384 ) ) ( not ( = ?auto_756379 ?auto_756385 ) ) ( not ( = ?auto_756379 ?auto_756386 ) ) ( not ( = ?auto_756379 ?auto_756387 ) ) ( not ( = ?auto_756379 ?auto_756388 ) ) ( not ( = ?auto_756379 ?auto_756389 ) ) ( not ( = ?auto_756379 ?auto_756390 ) ) ( not ( = ?auto_756379 ?auto_756391 ) ) ( not ( = ?auto_756379 ?auto_756392 ) ) ( not ( = ?auto_756379 ?auto_756393 ) ) ( not ( = ?auto_756379 ?auto_756394 ) ) ( not ( = ?auto_756379 ?auto_756395 ) ) ( not ( = ?auto_756379 ?auto_756396 ) ) ( not ( = ?auto_756379 ?auto_756397 ) ) ( not ( = ?auto_756380 ?auto_756381 ) ) ( not ( = ?auto_756380 ?auto_756382 ) ) ( not ( = ?auto_756380 ?auto_756383 ) ) ( not ( = ?auto_756380 ?auto_756384 ) ) ( not ( = ?auto_756380 ?auto_756385 ) ) ( not ( = ?auto_756380 ?auto_756386 ) ) ( not ( = ?auto_756380 ?auto_756387 ) ) ( not ( = ?auto_756380 ?auto_756388 ) ) ( not ( = ?auto_756380 ?auto_756389 ) ) ( not ( = ?auto_756380 ?auto_756390 ) ) ( not ( = ?auto_756380 ?auto_756391 ) ) ( not ( = ?auto_756380 ?auto_756392 ) ) ( not ( = ?auto_756380 ?auto_756393 ) ) ( not ( = ?auto_756380 ?auto_756394 ) ) ( not ( = ?auto_756380 ?auto_756395 ) ) ( not ( = ?auto_756380 ?auto_756396 ) ) ( not ( = ?auto_756380 ?auto_756397 ) ) ( not ( = ?auto_756381 ?auto_756382 ) ) ( not ( = ?auto_756381 ?auto_756383 ) ) ( not ( = ?auto_756381 ?auto_756384 ) ) ( not ( = ?auto_756381 ?auto_756385 ) ) ( not ( = ?auto_756381 ?auto_756386 ) ) ( not ( = ?auto_756381 ?auto_756387 ) ) ( not ( = ?auto_756381 ?auto_756388 ) ) ( not ( = ?auto_756381 ?auto_756389 ) ) ( not ( = ?auto_756381 ?auto_756390 ) ) ( not ( = ?auto_756381 ?auto_756391 ) ) ( not ( = ?auto_756381 ?auto_756392 ) ) ( not ( = ?auto_756381 ?auto_756393 ) ) ( not ( = ?auto_756381 ?auto_756394 ) ) ( not ( = ?auto_756381 ?auto_756395 ) ) ( not ( = ?auto_756381 ?auto_756396 ) ) ( not ( = ?auto_756381 ?auto_756397 ) ) ( not ( = ?auto_756382 ?auto_756383 ) ) ( not ( = ?auto_756382 ?auto_756384 ) ) ( not ( = ?auto_756382 ?auto_756385 ) ) ( not ( = ?auto_756382 ?auto_756386 ) ) ( not ( = ?auto_756382 ?auto_756387 ) ) ( not ( = ?auto_756382 ?auto_756388 ) ) ( not ( = ?auto_756382 ?auto_756389 ) ) ( not ( = ?auto_756382 ?auto_756390 ) ) ( not ( = ?auto_756382 ?auto_756391 ) ) ( not ( = ?auto_756382 ?auto_756392 ) ) ( not ( = ?auto_756382 ?auto_756393 ) ) ( not ( = ?auto_756382 ?auto_756394 ) ) ( not ( = ?auto_756382 ?auto_756395 ) ) ( not ( = ?auto_756382 ?auto_756396 ) ) ( not ( = ?auto_756382 ?auto_756397 ) ) ( not ( = ?auto_756383 ?auto_756384 ) ) ( not ( = ?auto_756383 ?auto_756385 ) ) ( not ( = ?auto_756383 ?auto_756386 ) ) ( not ( = ?auto_756383 ?auto_756387 ) ) ( not ( = ?auto_756383 ?auto_756388 ) ) ( not ( = ?auto_756383 ?auto_756389 ) ) ( not ( = ?auto_756383 ?auto_756390 ) ) ( not ( = ?auto_756383 ?auto_756391 ) ) ( not ( = ?auto_756383 ?auto_756392 ) ) ( not ( = ?auto_756383 ?auto_756393 ) ) ( not ( = ?auto_756383 ?auto_756394 ) ) ( not ( = ?auto_756383 ?auto_756395 ) ) ( not ( = ?auto_756383 ?auto_756396 ) ) ( not ( = ?auto_756383 ?auto_756397 ) ) ( not ( = ?auto_756384 ?auto_756385 ) ) ( not ( = ?auto_756384 ?auto_756386 ) ) ( not ( = ?auto_756384 ?auto_756387 ) ) ( not ( = ?auto_756384 ?auto_756388 ) ) ( not ( = ?auto_756384 ?auto_756389 ) ) ( not ( = ?auto_756384 ?auto_756390 ) ) ( not ( = ?auto_756384 ?auto_756391 ) ) ( not ( = ?auto_756384 ?auto_756392 ) ) ( not ( = ?auto_756384 ?auto_756393 ) ) ( not ( = ?auto_756384 ?auto_756394 ) ) ( not ( = ?auto_756384 ?auto_756395 ) ) ( not ( = ?auto_756384 ?auto_756396 ) ) ( not ( = ?auto_756384 ?auto_756397 ) ) ( not ( = ?auto_756385 ?auto_756386 ) ) ( not ( = ?auto_756385 ?auto_756387 ) ) ( not ( = ?auto_756385 ?auto_756388 ) ) ( not ( = ?auto_756385 ?auto_756389 ) ) ( not ( = ?auto_756385 ?auto_756390 ) ) ( not ( = ?auto_756385 ?auto_756391 ) ) ( not ( = ?auto_756385 ?auto_756392 ) ) ( not ( = ?auto_756385 ?auto_756393 ) ) ( not ( = ?auto_756385 ?auto_756394 ) ) ( not ( = ?auto_756385 ?auto_756395 ) ) ( not ( = ?auto_756385 ?auto_756396 ) ) ( not ( = ?auto_756385 ?auto_756397 ) ) ( not ( = ?auto_756386 ?auto_756387 ) ) ( not ( = ?auto_756386 ?auto_756388 ) ) ( not ( = ?auto_756386 ?auto_756389 ) ) ( not ( = ?auto_756386 ?auto_756390 ) ) ( not ( = ?auto_756386 ?auto_756391 ) ) ( not ( = ?auto_756386 ?auto_756392 ) ) ( not ( = ?auto_756386 ?auto_756393 ) ) ( not ( = ?auto_756386 ?auto_756394 ) ) ( not ( = ?auto_756386 ?auto_756395 ) ) ( not ( = ?auto_756386 ?auto_756396 ) ) ( not ( = ?auto_756386 ?auto_756397 ) ) ( not ( = ?auto_756387 ?auto_756388 ) ) ( not ( = ?auto_756387 ?auto_756389 ) ) ( not ( = ?auto_756387 ?auto_756390 ) ) ( not ( = ?auto_756387 ?auto_756391 ) ) ( not ( = ?auto_756387 ?auto_756392 ) ) ( not ( = ?auto_756387 ?auto_756393 ) ) ( not ( = ?auto_756387 ?auto_756394 ) ) ( not ( = ?auto_756387 ?auto_756395 ) ) ( not ( = ?auto_756387 ?auto_756396 ) ) ( not ( = ?auto_756387 ?auto_756397 ) ) ( not ( = ?auto_756388 ?auto_756389 ) ) ( not ( = ?auto_756388 ?auto_756390 ) ) ( not ( = ?auto_756388 ?auto_756391 ) ) ( not ( = ?auto_756388 ?auto_756392 ) ) ( not ( = ?auto_756388 ?auto_756393 ) ) ( not ( = ?auto_756388 ?auto_756394 ) ) ( not ( = ?auto_756388 ?auto_756395 ) ) ( not ( = ?auto_756388 ?auto_756396 ) ) ( not ( = ?auto_756388 ?auto_756397 ) ) ( not ( = ?auto_756389 ?auto_756390 ) ) ( not ( = ?auto_756389 ?auto_756391 ) ) ( not ( = ?auto_756389 ?auto_756392 ) ) ( not ( = ?auto_756389 ?auto_756393 ) ) ( not ( = ?auto_756389 ?auto_756394 ) ) ( not ( = ?auto_756389 ?auto_756395 ) ) ( not ( = ?auto_756389 ?auto_756396 ) ) ( not ( = ?auto_756389 ?auto_756397 ) ) ( not ( = ?auto_756390 ?auto_756391 ) ) ( not ( = ?auto_756390 ?auto_756392 ) ) ( not ( = ?auto_756390 ?auto_756393 ) ) ( not ( = ?auto_756390 ?auto_756394 ) ) ( not ( = ?auto_756390 ?auto_756395 ) ) ( not ( = ?auto_756390 ?auto_756396 ) ) ( not ( = ?auto_756390 ?auto_756397 ) ) ( not ( = ?auto_756391 ?auto_756392 ) ) ( not ( = ?auto_756391 ?auto_756393 ) ) ( not ( = ?auto_756391 ?auto_756394 ) ) ( not ( = ?auto_756391 ?auto_756395 ) ) ( not ( = ?auto_756391 ?auto_756396 ) ) ( not ( = ?auto_756391 ?auto_756397 ) ) ( not ( = ?auto_756392 ?auto_756393 ) ) ( not ( = ?auto_756392 ?auto_756394 ) ) ( not ( = ?auto_756392 ?auto_756395 ) ) ( not ( = ?auto_756392 ?auto_756396 ) ) ( not ( = ?auto_756392 ?auto_756397 ) ) ( not ( = ?auto_756393 ?auto_756394 ) ) ( not ( = ?auto_756393 ?auto_756395 ) ) ( not ( = ?auto_756393 ?auto_756396 ) ) ( not ( = ?auto_756393 ?auto_756397 ) ) ( not ( = ?auto_756394 ?auto_756395 ) ) ( not ( = ?auto_756394 ?auto_756396 ) ) ( not ( = ?auto_756394 ?auto_756397 ) ) ( not ( = ?auto_756395 ?auto_756396 ) ) ( not ( = ?auto_756395 ?auto_756397 ) ) ( not ( = ?auto_756396 ?auto_756397 ) ) ( ON ?auto_756395 ?auto_756396 ) ( ON ?auto_756394 ?auto_756395 ) ( ON ?auto_756393 ?auto_756394 ) ( ON ?auto_756392 ?auto_756393 ) ( ON ?auto_756391 ?auto_756392 ) ( CLEAR ?auto_756389 ) ( ON ?auto_756390 ?auto_756391 ) ( CLEAR ?auto_756390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_756379 ?auto_756380 ?auto_756381 ?auto_756382 ?auto_756383 ?auto_756384 ?auto_756385 ?auto_756386 ?auto_756387 ?auto_756388 ?auto_756389 ?auto_756390 )
      ( MAKE-18PILE ?auto_756379 ?auto_756380 ?auto_756381 ?auto_756382 ?auto_756383 ?auto_756384 ?auto_756385 ?auto_756386 ?auto_756387 ?auto_756388 ?auto_756389 ?auto_756390 ?auto_756391 ?auto_756392 ?auto_756393 ?auto_756394 ?auto_756395 ?auto_756396 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756416 - BLOCK
      ?auto_756417 - BLOCK
      ?auto_756418 - BLOCK
      ?auto_756419 - BLOCK
      ?auto_756420 - BLOCK
      ?auto_756421 - BLOCK
      ?auto_756422 - BLOCK
      ?auto_756423 - BLOCK
      ?auto_756424 - BLOCK
      ?auto_756425 - BLOCK
      ?auto_756426 - BLOCK
      ?auto_756427 - BLOCK
      ?auto_756428 - BLOCK
      ?auto_756429 - BLOCK
      ?auto_756430 - BLOCK
      ?auto_756431 - BLOCK
      ?auto_756432 - BLOCK
      ?auto_756433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756433 ) ( ON-TABLE ?auto_756416 ) ( ON ?auto_756417 ?auto_756416 ) ( ON ?auto_756418 ?auto_756417 ) ( ON ?auto_756419 ?auto_756418 ) ( ON ?auto_756420 ?auto_756419 ) ( ON ?auto_756421 ?auto_756420 ) ( ON ?auto_756422 ?auto_756421 ) ( ON ?auto_756423 ?auto_756422 ) ( ON ?auto_756424 ?auto_756423 ) ( ON ?auto_756425 ?auto_756424 ) ( ON ?auto_756426 ?auto_756425 ) ( not ( = ?auto_756416 ?auto_756417 ) ) ( not ( = ?auto_756416 ?auto_756418 ) ) ( not ( = ?auto_756416 ?auto_756419 ) ) ( not ( = ?auto_756416 ?auto_756420 ) ) ( not ( = ?auto_756416 ?auto_756421 ) ) ( not ( = ?auto_756416 ?auto_756422 ) ) ( not ( = ?auto_756416 ?auto_756423 ) ) ( not ( = ?auto_756416 ?auto_756424 ) ) ( not ( = ?auto_756416 ?auto_756425 ) ) ( not ( = ?auto_756416 ?auto_756426 ) ) ( not ( = ?auto_756416 ?auto_756427 ) ) ( not ( = ?auto_756416 ?auto_756428 ) ) ( not ( = ?auto_756416 ?auto_756429 ) ) ( not ( = ?auto_756416 ?auto_756430 ) ) ( not ( = ?auto_756416 ?auto_756431 ) ) ( not ( = ?auto_756416 ?auto_756432 ) ) ( not ( = ?auto_756416 ?auto_756433 ) ) ( not ( = ?auto_756417 ?auto_756418 ) ) ( not ( = ?auto_756417 ?auto_756419 ) ) ( not ( = ?auto_756417 ?auto_756420 ) ) ( not ( = ?auto_756417 ?auto_756421 ) ) ( not ( = ?auto_756417 ?auto_756422 ) ) ( not ( = ?auto_756417 ?auto_756423 ) ) ( not ( = ?auto_756417 ?auto_756424 ) ) ( not ( = ?auto_756417 ?auto_756425 ) ) ( not ( = ?auto_756417 ?auto_756426 ) ) ( not ( = ?auto_756417 ?auto_756427 ) ) ( not ( = ?auto_756417 ?auto_756428 ) ) ( not ( = ?auto_756417 ?auto_756429 ) ) ( not ( = ?auto_756417 ?auto_756430 ) ) ( not ( = ?auto_756417 ?auto_756431 ) ) ( not ( = ?auto_756417 ?auto_756432 ) ) ( not ( = ?auto_756417 ?auto_756433 ) ) ( not ( = ?auto_756418 ?auto_756419 ) ) ( not ( = ?auto_756418 ?auto_756420 ) ) ( not ( = ?auto_756418 ?auto_756421 ) ) ( not ( = ?auto_756418 ?auto_756422 ) ) ( not ( = ?auto_756418 ?auto_756423 ) ) ( not ( = ?auto_756418 ?auto_756424 ) ) ( not ( = ?auto_756418 ?auto_756425 ) ) ( not ( = ?auto_756418 ?auto_756426 ) ) ( not ( = ?auto_756418 ?auto_756427 ) ) ( not ( = ?auto_756418 ?auto_756428 ) ) ( not ( = ?auto_756418 ?auto_756429 ) ) ( not ( = ?auto_756418 ?auto_756430 ) ) ( not ( = ?auto_756418 ?auto_756431 ) ) ( not ( = ?auto_756418 ?auto_756432 ) ) ( not ( = ?auto_756418 ?auto_756433 ) ) ( not ( = ?auto_756419 ?auto_756420 ) ) ( not ( = ?auto_756419 ?auto_756421 ) ) ( not ( = ?auto_756419 ?auto_756422 ) ) ( not ( = ?auto_756419 ?auto_756423 ) ) ( not ( = ?auto_756419 ?auto_756424 ) ) ( not ( = ?auto_756419 ?auto_756425 ) ) ( not ( = ?auto_756419 ?auto_756426 ) ) ( not ( = ?auto_756419 ?auto_756427 ) ) ( not ( = ?auto_756419 ?auto_756428 ) ) ( not ( = ?auto_756419 ?auto_756429 ) ) ( not ( = ?auto_756419 ?auto_756430 ) ) ( not ( = ?auto_756419 ?auto_756431 ) ) ( not ( = ?auto_756419 ?auto_756432 ) ) ( not ( = ?auto_756419 ?auto_756433 ) ) ( not ( = ?auto_756420 ?auto_756421 ) ) ( not ( = ?auto_756420 ?auto_756422 ) ) ( not ( = ?auto_756420 ?auto_756423 ) ) ( not ( = ?auto_756420 ?auto_756424 ) ) ( not ( = ?auto_756420 ?auto_756425 ) ) ( not ( = ?auto_756420 ?auto_756426 ) ) ( not ( = ?auto_756420 ?auto_756427 ) ) ( not ( = ?auto_756420 ?auto_756428 ) ) ( not ( = ?auto_756420 ?auto_756429 ) ) ( not ( = ?auto_756420 ?auto_756430 ) ) ( not ( = ?auto_756420 ?auto_756431 ) ) ( not ( = ?auto_756420 ?auto_756432 ) ) ( not ( = ?auto_756420 ?auto_756433 ) ) ( not ( = ?auto_756421 ?auto_756422 ) ) ( not ( = ?auto_756421 ?auto_756423 ) ) ( not ( = ?auto_756421 ?auto_756424 ) ) ( not ( = ?auto_756421 ?auto_756425 ) ) ( not ( = ?auto_756421 ?auto_756426 ) ) ( not ( = ?auto_756421 ?auto_756427 ) ) ( not ( = ?auto_756421 ?auto_756428 ) ) ( not ( = ?auto_756421 ?auto_756429 ) ) ( not ( = ?auto_756421 ?auto_756430 ) ) ( not ( = ?auto_756421 ?auto_756431 ) ) ( not ( = ?auto_756421 ?auto_756432 ) ) ( not ( = ?auto_756421 ?auto_756433 ) ) ( not ( = ?auto_756422 ?auto_756423 ) ) ( not ( = ?auto_756422 ?auto_756424 ) ) ( not ( = ?auto_756422 ?auto_756425 ) ) ( not ( = ?auto_756422 ?auto_756426 ) ) ( not ( = ?auto_756422 ?auto_756427 ) ) ( not ( = ?auto_756422 ?auto_756428 ) ) ( not ( = ?auto_756422 ?auto_756429 ) ) ( not ( = ?auto_756422 ?auto_756430 ) ) ( not ( = ?auto_756422 ?auto_756431 ) ) ( not ( = ?auto_756422 ?auto_756432 ) ) ( not ( = ?auto_756422 ?auto_756433 ) ) ( not ( = ?auto_756423 ?auto_756424 ) ) ( not ( = ?auto_756423 ?auto_756425 ) ) ( not ( = ?auto_756423 ?auto_756426 ) ) ( not ( = ?auto_756423 ?auto_756427 ) ) ( not ( = ?auto_756423 ?auto_756428 ) ) ( not ( = ?auto_756423 ?auto_756429 ) ) ( not ( = ?auto_756423 ?auto_756430 ) ) ( not ( = ?auto_756423 ?auto_756431 ) ) ( not ( = ?auto_756423 ?auto_756432 ) ) ( not ( = ?auto_756423 ?auto_756433 ) ) ( not ( = ?auto_756424 ?auto_756425 ) ) ( not ( = ?auto_756424 ?auto_756426 ) ) ( not ( = ?auto_756424 ?auto_756427 ) ) ( not ( = ?auto_756424 ?auto_756428 ) ) ( not ( = ?auto_756424 ?auto_756429 ) ) ( not ( = ?auto_756424 ?auto_756430 ) ) ( not ( = ?auto_756424 ?auto_756431 ) ) ( not ( = ?auto_756424 ?auto_756432 ) ) ( not ( = ?auto_756424 ?auto_756433 ) ) ( not ( = ?auto_756425 ?auto_756426 ) ) ( not ( = ?auto_756425 ?auto_756427 ) ) ( not ( = ?auto_756425 ?auto_756428 ) ) ( not ( = ?auto_756425 ?auto_756429 ) ) ( not ( = ?auto_756425 ?auto_756430 ) ) ( not ( = ?auto_756425 ?auto_756431 ) ) ( not ( = ?auto_756425 ?auto_756432 ) ) ( not ( = ?auto_756425 ?auto_756433 ) ) ( not ( = ?auto_756426 ?auto_756427 ) ) ( not ( = ?auto_756426 ?auto_756428 ) ) ( not ( = ?auto_756426 ?auto_756429 ) ) ( not ( = ?auto_756426 ?auto_756430 ) ) ( not ( = ?auto_756426 ?auto_756431 ) ) ( not ( = ?auto_756426 ?auto_756432 ) ) ( not ( = ?auto_756426 ?auto_756433 ) ) ( not ( = ?auto_756427 ?auto_756428 ) ) ( not ( = ?auto_756427 ?auto_756429 ) ) ( not ( = ?auto_756427 ?auto_756430 ) ) ( not ( = ?auto_756427 ?auto_756431 ) ) ( not ( = ?auto_756427 ?auto_756432 ) ) ( not ( = ?auto_756427 ?auto_756433 ) ) ( not ( = ?auto_756428 ?auto_756429 ) ) ( not ( = ?auto_756428 ?auto_756430 ) ) ( not ( = ?auto_756428 ?auto_756431 ) ) ( not ( = ?auto_756428 ?auto_756432 ) ) ( not ( = ?auto_756428 ?auto_756433 ) ) ( not ( = ?auto_756429 ?auto_756430 ) ) ( not ( = ?auto_756429 ?auto_756431 ) ) ( not ( = ?auto_756429 ?auto_756432 ) ) ( not ( = ?auto_756429 ?auto_756433 ) ) ( not ( = ?auto_756430 ?auto_756431 ) ) ( not ( = ?auto_756430 ?auto_756432 ) ) ( not ( = ?auto_756430 ?auto_756433 ) ) ( not ( = ?auto_756431 ?auto_756432 ) ) ( not ( = ?auto_756431 ?auto_756433 ) ) ( not ( = ?auto_756432 ?auto_756433 ) ) ( ON ?auto_756432 ?auto_756433 ) ( ON ?auto_756431 ?auto_756432 ) ( ON ?auto_756430 ?auto_756431 ) ( ON ?auto_756429 ?auto_756430 ) ( ON ?auto_756428 ?auto_756429 ) ( CLEAR ?auto_756426 ) ( ON ?auto_756427 ?auto_756428 ) ( CLEAR ?auto_756427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_756416 ?auto_756417 ?auto_756418 ?auto_756419 ?auto_756420 ?auto_756421 ?auto_756422 ?auto_756423 ?auto_756424 ?auto_756425 ?auto_756426 ?auto_756427 )
      ( MAKE-18PILE ?auto_756416 ?auto_756417 ?auto_756418 ?auto_756419 ?auto_756420 ?auto_756421 ?auto_756422 ?auto_756423 ?auto_756424 ?auto_756425 ?auto_756426 ?auto_756427 ?auto_756428 ?auto_756429 ?auto_756430 ?auto_756431 ?auto_756432 ?auto_756433 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756452 - BLOCK
      ?auto_756453 - BLOCK
      ?auto_756454 - BLOCK
      ?auto_756455 - BLOCK
      ?auto_756456 - BLOCK
      ?auto_756457 - BLOCK
      ?auto_756458 - BLOCK
      ?auto_756459 - BLOCK
      ?auto_756460 - BLOCK
      ?auto_756461 - BLOCK
      ?auto_756462 - BLOCK
      ?auto_756463 - BLOCK
      ?auto_756464 - BLOCK
      ?auto_756465 - BLOCK
      ?auto_756466 - BLOCK
      ?auto_756467 - BLOCK
      ?auto_756468 - BLOCK
      ?auto_756469 - BLOCK
    )
    :vars
    (
      ?auto_756470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756469 ?auto_756470 ) ( ON-TABLE ?auto_756452 ) ( ON ?auto_756453 ?auto_756452 ) ( ON ?auto_756454 ?auto_756453 ) ( ON ?auto_756455 ?auto_756454 ) ( ON ?auto_756456 ?auto_756455 ) ( ON ?auto_756457 ?auto_756456 ) ( ON ?auto_756458 ?auto_756457 ) ( ON ?auto_756459 ?auto_756458 ) ( ON ?auto_756460 ?auto_756459 ) ( ON ?auto_756461 ?auto_756460 ) ( not ( = ?auto_756452 ?auto_756453 ) ) ( not ( = ?auto_756452 ?auto_756454 ) ) ( not ( = ?auto_756452 ?auto_756455 ) ) ( not ( = ?auto_756452 ?auto_756456 ) ) ( not ( = ?auto_756452 ?auto_756457 ) ) ( not ( = ?auto_756452 ?auto_756458 ) ) ( not ( = ?auto_756452 ?auto_756459 ) ) ( not ( = ?auto_756452 ?auto_756460 ) ) ( not ( = ?auto_756452 ?auto_756461 ) ) ( not ( = ?auto_756452 ?auto_756462 ) ) ( not ( = ?auto_756452 ?auto_756463 ) ) ( not ( = ?auto_756452 ?auto_756464 ) ) ( not ( = ?auto_756452 ?auto_756465 ) ) ( not ( = ?auto_756452 ?auto_756466 ) ) ( not ( = ?auto_756452 ?auto_756467 ) ) ( not ( = ?auto_756452 ?auto_756468 ) ) ( not ( = ?auto_756452 ?auto_756469 ) ) ( not ( = ?auto_756452 ?auto_756470 ) ) ( not ( = ?auto_756453 ?auto_756454 ) ) ( not ( = ?auto_756453 ?auto_756455 ) ) ( not ( = ?auto_756453 ?auto_756456 ) ) ( not ( = ?auto_756453 ?auto_756457 ) ) ( not ( = ?auto_756453 ?auto_756458 ) ) ( not ( = ?auto_756453 ?auto_756459 ) ) ( not ( = ?auto_756453 ?auto_756460 ) ) ( not ( = ?auto_756453 ?auto_756461 ) ) ( not ( = ?auto_756453 ?auto_756462 ) ) ( not ( = ?auto_756453 ?auto_756463 ) ) ( not ( = ?auto_756453 ?auto_756464 ) ) ( not ( = ?auto_756453 ?auto_756465 ) ) ( not ( = ?auto_756453 ?auto_756466 ) ) ( not ( = ?auto_756453 ?auto_756467 ) ) ( not ( = ?auto_756453 ?auto_756468 ) ) ( not ( = ?auto_756453 ?auto_756469 ) ) ( not ( = ?auto_756453 ?auto_756470 ) ) ( not ( = ?auto_756454 ?auto_756455 ) ) ( not ( = ?auto_756454 ?auto_756456 ) ) ( not ( = ?auto_756454 ?auto_756457 ) ) ( not ( = ?auto_756454 ?auto_756458 ) ) ( not ( = ?auto_756454 ?auto_756459 ) ) ( not ( = ?auto_756454 ?auto_756460 ) ) ( not ( = ?auto_756454 ?auto_756461 ) ) ( not ( = ?auto_756454 ?auto_756462 ) ) ( not ( = ?auto_756454 ?auto_756463 ) ) ( not ( = ?auto_756454 ?auto_756464 ) ) ( not ( = ?auto_756454 ?auto_756465 ) ) ( not ( = ?auto_756454 ?auto_756466 ) ) ( not ( = ?auto_756454 ?auto_756467 ) ) ( not ( = ?auto_756454 ?auto_756468 ) ) ( not ( = ?auto_756454 ?auto_756469 ) ) ( not ( = ?auto_756454 ?auto_756470 ) ) ( not ( = ?auto_756455 ?auto_756456 ) ) ( not ( = ?auto_756455 ?auto_756457 ) ) ( not ( = ?auto_756455 ?auto_756458 ) ) ( not ( = ?auto_756455 ?auto_756459 ) ) ( not ( = ?auto_756455 ?auto_756460 ) ) ( not ( = ?auto_756455 ?auto_756461 ) ) ( not ( = ?auto_756455 ?auto_756462 ) ) ( not ( = ?auto_756455 ?auto_756463 ) ) ( not ( = ?auto_756455 ?auto_756464 ) ) ( not ( = ?auto_756455 ?auto_756465 ) ) ( not ( = ?auto_756455 ?auto_756466 ) ) ( not ( = ?auto_756455 ?auto_756467 ) ) ( not ( = ?auto_756455 ?auto_756468 ) ) ( not ( = ?auto_756455 ?auto_756469 ) ) ( not ( = ?auto_756455 ?auto_756470 ) ) ( not ( = ?auto_756456 ?auto_756457 ) ) ( not ( = ?auto_756456 ?auto_756458 ) ) ( not ( = ?auto_756456 ?auto_756459 ) ) ( not ( = ?auto_756456 ?auto_756460 ) ) ( not ( = ?auto_756456 ?auto_756461 ) ) ( not ( = ?auto_756456 ?auto_756462 ) ) ( not ( = ?auto_756456 ?auto_756463 ) ) ( not ( = ?auto_756456 ?auto_756464 ) ) ( not ( = ?auto_756456 ?auto_756465 ) ) ( not ( = ?auto_756456 ?auto_756466 ) ) ( not ( = ?auto_756456 ?auto_756467 ) ) ( not ( = ?auto_756456 ?auto_756468 ) ) ( not ( = ?auto_756456 ?auto_756469 ) ) ( not ( = ?auto_756456 ?auto_756470 ) ) ( not ( = ?auto_756457 ?auto_756458 ) ) ( not ( = ?auto_756457 ?auto_756459 ) ) ( not ( = ?auto_756457 ?auto_756460 ) ) ( not ( = ?auto_756457 ?auto_756461 ) ) ( not ( = ?auto_756457 ?auto_756462 ) ) ( not ( = ?auto_756457 ?auto_756463 ) ) ( not ( = ?auto_756457 ?auto_756464 ) ) ( not ( = ?auto_756457 ?auto_756465 ) ) ( not ( = ?auto_756457 ?auto_756466 ) ) ( not ( = ?auto_756457 ?auto_756467 ) ) ( not ( = ?auto_756457 ?auto_756468 ) ) ( not ( = ?auto_756457 ?auto_756469 ) ) ( not ( = ?auto_756457 ?auto_756470 ) ) ( not ( = ?auto_756458 ?auto_756459 ) ) ( not ( = ?auto_756458 ?auto_756460 ) ) ( not ( = ?auto_756458 ?auto_756461 ) ) ( not ( = ?auto_756458 ?auto_756462 ) ) ( not ( = ?auto_756458 ?auto_756463 ) ) ( not ( = ?auto_756458 ?auto_756464 ) ) ( not ( = ?auto_756458 ?auto_756465 ) ) ( not ( = ?auto_756458 ?auto_756466 ) ) ( not ( = ?auto_756458 ?auto_756467 ) ) ( not ( = ?auto_756458 ?auto_756468 ) ) ( not ( = ?auto_756458 ?auto_756469 ) ) ( not ( = ?auto_756458 ?auto_756470 ) ) ( not ( = ?auto_756459 ?auto_756460 ) ) ( not ( = ?auto_756459 ?auto_756461 ) ) ( not ( = ?auto_756459 ?auto_756462 ) ) ( not ( = ?auto_756459 ?auto_756463 ) ) ( not ( = ?auto_756459 ?auto_756464 ) ) ( not ( = ?auto_756459 ?auto_756465 ) ) ( not ( = ?auto_756459 ?auto_756466 ) ) ( not ( = ?auto_756459 ?auto_756467 ) ) ( not ( = ?auto_756459 ?auto_756468 ) ) ( not ( = ?auto_756459 ?auto_756469 ) ) ( not ( = ?auto_756459 ?auto_756470 ) ) ( not ( = ?auto_756460 ?auto_756461 ) ) ( not ( = ?auto_756460 ?auto_756462 ) ) ( not ( = ?auto_756460 ?auto_756463 ) ) ( not ( = ?auto_756460 ?auto_756464 ) ) ( not ( = ?auto_756460 ?auto_756465 ) ) ( not ( = ?auto_756460 ?auto_756466 ) ) ( not ( = ?auto_756460 ?auto_756467 ) ) ( not ( = ?auto_756460 ?auto_756468 ) ) ( not ( = ?auto_756460 ?auto_756469 ) ) ( not ( = ?auto_756460 ?auto_756470 ) ) ( not ( = ?auto_756461 ?auto_756462 ) ) ( not ( = ?auto_756461 ?auto_756463 ) ) ( not ( = ?auto_756461 ?auto_756464 ) ) ( not ( = ?auto_756461 ?auto_756465 ) ) ( not ( = ?auto_756461 ?auto_756466 ) ) ( not ( = ?auto_756461 ?auto_756467 ) ) ( not ( = ?auto_756461 ?auto_756468 ) ) ( not ( = ?auto_756461 ?auto_756469 ) ) ( not ( = ?auto_756461 ?auto_756470 ) ) ( not ( = ?auto_756462 ?auto_756463 ) ) ( not ( = ?auto_756462 ?auto_756464 ) ) ( not ( = ?auto_756462 ?auto_756465 ) ) ( not ( = ?auto_756462 ?auto_756466 ) ) ( not ( = ?auto_756462 ?auto_756467 ) ) ( not ( = ?auto_756462 ?auto_756468 ) ) ( not ( = ?auto_756462 ?auto_756469 ) ) ( not ( = ?auto_756462 ?auto_756470 ) ) ( not ( = ?auto_756463 ?auto_756464 ) ) ( not ( = ?auto_756463 ?auto_756465 ) ) ( not ( = ?auto_756463 ?auto_756466 ) ) ( not ( = ?auto_756463 ?auto_756467 ) ) ( not ( = ?auto_756463 ?auto_756468 ) ) ( not ( = ?auto_756463 ?auto_756469 ) ) ( not ( = ?auto_756463 ?auto_756470 ) ) ( not ( = ?auto_756464 ?auto_756465 ) ) ( not ( = ?auto_756464 ?auto_756466 ) ) ( not ( = ?auto_756464 ?auto_756467 ) ) ( not ( = ?auto_756464 ?auto_756468 ) ) ( not ( = ?auto_756464 ?auto_756469 ) ) ( not ( = ?auto_756464 ?auto_756470 ) ) ( not ( = ?auto_756465 ?auto_756466 ) ) ( not ( = ?auto_756465 ?auto_756467 ) ) ( not ( = ?auto_756465 ?auto_756468 ) ) ( not ( = ?auto_756465 ?auto_756469 ) ) ( not ( = ?auto_756465 ?auto_756470 ) ) ( not ( = ?auto_756466 ?auto_756467 ) ) ( not ( = ?auto_756466 ?auto_756468 ) ) ( not ( = ?auto_756466 ?auto_756469 ) ) ( not ( = ?auto_756466 ?auto_756470 ) ) ( not ( = ?auto_756467 ?auto_756468 ) ) ( not ( = ?auto_756467 ?auto_756469 ) ) ( not ( = ?auto_756467 ?auto_756470 ) ) ( not ( = ?auto_756468 ?auto_756469 ) ) ( not ( = ?auto_756468 ?auto_756470 ) ) ( not ( = ?auto_756469 ?auto_756470 ) ) ( ON ?auto_756468 ?auto_756469 ) ( ON ?auto_756467 ?auto_756468 ) ( ON ?auto_756466 ?auto_756467 ) ( ON ?auto_756465 ?auto_756466 ) ( ON ?auto_756464 ?auto_756465 ) ( ON ?auto_756463 ?auto_756464 ) ( CLEAR ?auto_756461 ) ( ON ?auto_756462 ?auto_756463 ) ( CLEAR ?auto_756462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_756452 ?auto_756453 ?auto_756454 ?auto_756455 ?auto_756456 ?auto_756457 ?auto_756458 ?auto_756459 ?auto_756460 ?auto_756461 ?auto_756462 )
      ( MAKE-18PILE ?auto_756452 ?auto_756453 ?auto_756454 ?auto_756455 ?auto_756456 ?auto_756457 ?auto_756458 ?auto_756459 ?auto_756460 ?auto_756461 ?auto_756462 ?auto_756463 ?auto_756464 ?auto_756465 ?auto_756466 ?auto_756467 ?auto_756468 ?auto_756469 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756489 - BLOCK
      ?auto_756490 - BLOCK
      ?auto_756491 - BLOCK
      ?auto_756492 - BLOCK
      ?auto_756493 - BLOCK
      ?auto_756494 - BLOCK
      ?auto_756495 - BLOCK
      ?auto_756496 - BLOCK
      ?auto_756497 - BLOCK
      ?auto_756498 - BLOCK
      ?auto_756499 - BLOCK
      ?auto_756500 - BLOCK
      ?auto_756501 - BLOCK
      ?auto_756502 - BLOCK
      ?auto_756503 - BLOCK
      ?auto_756504 - BLOCK
      ?auto_756505 - BLOCK
      ?auto_756506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756506 ) ( ON-TABLE ?auto_756489 ) ( ON ?auto_756490 ?auto_756489 ) ( ON ?auto_756491 ?auto_756490 ) ( ON ?auto_756492 ?auto_756491 ) ( ON ?auto_756493 ?auto_756492 ) ( ON ?auto_756494 ?auto_756493 ) ( ON ?auto_756495 ?auto_756494 ) ( ON ?auto_756496 ?auto_756495 ) ( ON ?auto_756497 ?auto_756496 ) ( ON ?auto_756498 ?auto_756497 ) ( not ( = ?auto_756489 ?auto_756490 ) ) ( not ( = ?auto_756489 ?auto_756491 ) ) ( not ( = ?auto_756489 ?auto_756492 ) ) ( not ( = ?auto_756489 ?auto_756493 ) ) ( not ( = ?auto_756489 ?auto_756494 ) ) ( not ( = ?auto_756489 ?auto_756495 ) ) ( not ( = ?auto_756489 ?auto_756496 ) ) ( not ( = ?auto_756489 ?auto_756497 ) ) ( not ( = ?auto_756489 ?auto_756498 ) ) ( not ( = ?auto_756489 ?auto_756499 ) ) ( not ( = ?auto_756489 ?auto_756500 ) ) ( not ( = ?auto_756489 ?auto_756501 ) ) ( not ( = ?auto_756489 ?auto_756502 ) ) ( not ( = ?auto_756489 ?auto_756503 ) ) ( not ( = ?auto_756489 ?auto_756504 ) ) ( not ( = ?auto_756489 ?auto_756505 ) ) ( not ( = ?auto_756489 ?auto_756506 ) ) ( not ( = ?auto_756490 ?auto_756491 ) ) ( not ( = ?auto_756490 ?auto_756492 ) ) ( not ( = ?auto_756490 ?auto_756493 ) ) ( not ( = ?auto_756490 ?auto_756494 ) ) ( not ( = ?auto_756490 ?auto_756495 ) ) ( not ( = ?auto_756490 ?auto_756496 ) ) ( not ( = ?auto_756490 ?auto_756497 ) ) ( not ( = ?auto_756490 ?auto_756498 ) ) ( not ( = ?auto_756490 ?auto_756499 ) ) ( not ( = ?auto_756490 ?auto_756500 ) ) ( not ( = ?auto_756490 ?auto_756501 ) ) ( not ( = ?auto_756490 ?auto_756502 ) ) ( not ( = ?auto_756490 ?auto_756503 ) ) ( not ( = ?auto_756490 ?auto_756504 ) ) ( not ( = ?auto_756490 ?auto_756505 ) ) ( not ( = ?auto_756490 ?auto_756506 ) ) ( not ( = ?auto_756491 ?auto_756492 ) ) ( not ( = ?auto_756491 ?auto_756493 ) ) ( not ( = ?auto_756491 ?auto_756494 ) ) ( not ( = ?auto_756491 ?auto_756495 ) ) ( not ( = ?auto_756491 ?auto_756496 ) ) ( not ( = ?auto_756491 ?auto_756497 ) ) ( not ( = ?auto_756491 ?auto_756498 ) ) ( not ( = ?auto_756491 ?auto_756499 ) ) ( not ( = ?auto_756491 ?auto_756500 ) ) ( not ( = ?auto_756491 ?auto_756501 ) ) ( not ( = ?auto_756491 ?auto_756502 ) ) ( not ( = ?auto_756491 ?auto_756503 ) ) ( not ( = ?auto_756491 ?auto_756504 ) ) ( not ( = ?auto_756491 ?auto_756505 ) ) ( not ( = ?auto_756491 ?auto_756506 ) ) ( not ( = ?auto_756492 ?auto_756493 ) ) ( not ( = ?auto_756492 ?auto_756494 ) ) ( not ( = ?auto_756492 ?auto_756495 ) ) ( not ( = ?auto_756492 ?auto_756496 ) ) ( not ( = ?auto_756492 ?auto_756497 ) ) ( not ( = ?auto_756492 ?auto_756498 ) ) ( not ( = ?auto_756492 ?auto_756499 ) ) ( not ( = ?auto_756492 ?auto_756500 ) ) ( not ( = ?auto_756492 ?auto_756501 ) ) ( not ( = ?auto_756492 ?auto_756502 ) ) ( not ( = ?auto_756492 ?auto_756503 ) ) ( not ( = ?auto_756492 ?auto_756504 ) ) ( not ( = ?auto_756492 ?auto_756505 ) ) ( not ( = ?auto_756492 ?auto_756506 ) ) ( not ( = ?auto_756493 ?auto_756494 ) ) ( not ( = ?auto_756493 ?auto_756495 ) ) ( not ( = ?auto_756493 ?auto_756496 ) ) ( not ( = ?auto_756493 ?auto_756497 ) ) ( not ( = ?auto_756493 ?auto_756498 ) ) ( not ( = ?auto_756493 ?auto_756499 ) ) ( not ( = ?auto_756493 ?auto_756500 ) ) ( not ( = ?auto_756493 ?auto_756501 ) ) ( not ( = ?auto_756493 ?auto_756502 ) ) ( not ( = ?auto_756493 ?auto_756503 ) ) ( not ( = ?auto_756493 ?auto_756504 ) ) ( not ( = ?auto_756493 ?auto_756505 ) ) ( not ( = ?auto_756493 ?auto_756506 ) ) ( not ( = ?auto_756494 ?auto_756495 ) ) ( not ( = ?auto_756494 ?auto_756496 ) ) ( not ( = ?auto_756494 ?auto_756497 ) ) ( not ( = ?auto_756494 ?auto_756498 ) ) ( not ( = ?auto_756494 ?auto_756499 ) ) ( not ( = ?auto_756494 ?auto_756500 ) ) ( not ( = ?auto_756494 ?auto_756501 ) ) ( not ( = ?auto_756494 ?auto_756502 ) ) ( not ( = ?auto_756494 ?auto_756503 ) ) ( not ( = ?auto_756494 ?auto_756504 ) ) ( not ( = ?auto_756494 ?auto_756505 ) ) ( not ( = ?auto_756494 ?auto_756506 ) ) ( not ( = ?auto_756495 ?auto_756496 ) ) ( not ( = ?auto_756495 ?auto_756497 ) ) ( not ( = ?auto_756495 ?auto_756498 ) ) ( not ( = ?auto_756495 ?auto_756499 ) ) ( not ( = ?auto_756495 ?auto_756500 ) ) ( not ( = ?auto_756495 ?auto_756501 ) ) ( not ( = ?auto_756495 ?auto_756502 ) ) ( not ( = ?auto_756495 ?auto_756503 ) ) ( not ( = ?auto_756495 ?auto_756504 ) ) ( not ( = ?auto_756495 ?auto_756505 ) ) ( not ( = ?auto_756495 ?auto_756506 ) ) ( not ( = ?auto_756496 ?auto_756497 ) ) ( not ( = ?auto_756496 ?auto_756498 ) ) ( not ( = ?auto_756496 ?auto_756499 ) ) ( not ( = ?auto_756496 ?auto_756500 ) ) ( not ( = ?auto_756496 ?auto_756501 ) ) ( not ( = ?auto_756496 ?auto_756502 ) ) ( not ( = ?auto_756496 ?auto_756503 ) ) ( not ( = ?auto_756496 ?auto_756504 ) ) ( not ( = ?auto_756496 ?auto_756505 ) ) ( not ( = ?auto_756496 ?auto_756506 ) ) ( not ( = ?auto_756497 ?auto_756498 ) ) ( not ( = ?auto_756497 ?auto_756499 ) ) ( not ( = ?auto_756497 ?auto_756500 ) ) ( not ( = ?auto_756497 ?auto_756501 ) ) ( not ( = ?auto_756497 ?auto_756502 ) ) ( not ( = ?auto_756497 ?auto_756503 ) ) ( not ( = ?auto_756497 ?auto_756504 ) ) ( not ( = ?auto_756497 ?auto_756505 ) ) ( not ( = ?auto_756497 ?auto_756506 ) ) ( not ( = ?auto_756498 ?auto_756499 ) ) ( not ( = ?auto_756498 ?auto_756500 ) ) ( not ( = ?auto_756498 ?auto_756501 ) ) ( not ( = ?auto_756498 ?auto_756502 ) ) ( not ( = ?auto_756498 ?auto_756503 ) ) ( not ( = ?auto_756498 ?auto_756504 ) ) ( not ( = ?auto_756498 ?auto_756505 ) ) ( not ( = ?auto_756498 ?auto_756506 ) ) ( not ( = ?auto_756499 ?auto_756500 ) ) ( not ( = ?auto_756499 ?auto_756501 ) ) ( not ( = ?auto_756499 ?auto_756502 ) ) ( not ( = ?auto_756499 ?auto_756503 ) ) ( not ( = ?auto_756499 ?auto_756504 ) ) ( not ( = ?auto_756499 ?auto_756505 ) ) ( not ( = ?auto_756499 ?auto_756506 ) ) ( not ( = ?auto_756500 ?auto_756501 ) ) ( not ( = ?auto_756500 ?auto_756502 ) ) ( not ( = ?auto_756500 ?auto_756503 ) ) ( not ( = ?auto_756500 ?auto_756504 ) ) ( not ( = ?auto_756500 ?auto_756505 ) ) ( not ( = ?auto_756500 ?auto_756506 ) ) ( not ( = ?auto_756501 ?auto_756502 ) ) ( not ( = ?auto_756501 ?auto_756503 ) ) ( not ( = ?auto_756501 ?auto_756504 ) ) ( not ( = ?auto_756501 ?auto_756505 ) ) ( not ( = ?auto_756501 ?auto_756506 ) ) ( not ( = ?auto_756502 ?auto_756503 ) ) ( not ( = ?auto_756502 ?auto_756504 ) ) ( not ( = ?auto_756502 ?auto_756505 ) ) ( not ( = ?auto_756502 ?auto_756506 ) ) ( not ( = ?auto_756503 ?auto_756504 ) ) ( not ( = ?auto_756503 ?auto_756505 ) ) ( not ( = ?auto_756503 ?auto_756506 ) ) ( not ( = ?auto_756504 ?auto_756505 ) ) ( not ( = ?auto_756504 ?auto_756506 ) ) ( not ( = ?auto_756505 ?auto_756506 ) ) ( ON ?auto_756505 ?auto_756506 ) ( ON ?auto_756504 ?auto_756505 ) ( ON ?auto_756503 ?auto_756504 ) ( ON ?auto_756502 ?auto_756503 ) ( ON ?auto_756501 ?auto_756502 ) ( ON ?auto_756500 ?auto_756501 ) ( CLEAR ?auto_756498 ) ( ON ?auto_756499 ?auto_756500 ) ( CLEAR ?auto_756499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_756489 ?auto_756490 ?auto_756491 ?auto_756492 ?auto_756493 ?auto_756494 ?auto_756495 ?auto_756496 ?auto_756497 ?auto_756498 ?auto_756499 )
      ( MAKE-18PILE ?auto_756489 ?auto_756490 ?auto_756491 ?auto_756492 ?auto_756493 ?auto_756494 ?auto_756495 ?auto_756496 ?auto_756497 ?auto_756498 ?auto_756499 ?auto_756500 ?auto_756501 ?auto_756502 ?auto_756503 ?auto_756504 ?auto_756505 ?auto_756506 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756525 - BLOCK
      ?auto_756526 - BLOCK
      ?auto_756527 - BLOCK
      ?auto_756528 - BLOCK
      ?auto_756529 - BLOCK
      ?auto_756530 - BLOCK
      ?auto_756531 - BLOCK
      ?auto_756532 - BLOCK
      ?auto_756533 - BLOCK
      ?auto_756534 - BLOCK
      ?auto_756535 - BLOCK
      ?auto_756536 - BLOCK
      ?auto_756537 - BLOCK
      ?auto_756538 - BLOCK
      ?auto_756539 - BLOCK
      ?auto_756540 - BLOCK
      ?auto_756541 - BLOCK
      ?auto_756542 - BLOCK
    )
    :vars
    (
      ?auto_756543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756542 ?auto_756543 ) ( ON-TABLE ?auto_756525 ) ( ON ?auto_756526 ?auto_756525 ) ( ON ?auto_756527 ?auto_756526 ) ( ON ?auto_756528 ?auto_756527 ) ( ON ?auto_756529 ?auto_756528 ) ( ON ?auto_756530 ?auto_756529 ) ( ON ?auto_756531 ?auto_756530 ) ( ON ?auto_756532 ?auto_756531 ) ( ON ?auto_756533 ?auto_756532 ) ( not ( = ?auto_756525 ?auto_756526 ) ) ( not ( = ?auto_756525 ?auto_756527 ) ) ( not ( = ?auto_756525 ?auto_756528 ) ) ( not ( = ?auto_756525 ?auto_756529 ) ) ( not ( = ?auto_756525 ?auto_756530 ) ) ( not ( = ?auto_756525 ?auto_756531 ) ) ( not ( = ?auto_756525 ?auto_756532 ) ) ( not ( = ?auto_756525 ?auto_756533 ) ) ( not ( = ?auto_756525 ?auto_756534 ) ) ( not ( = ?auto_756525 ?auto_756535 ) ) ( not ( = ?auto_756525 ?auto_756536 ) ) ( not ( = ?auto_756525 ?auto_756537 ) ) ( not ( = ?auto_756525 ?auto_756538 ) ) ( not ( = ?auto_756525 ?auto_756539 ) ) ( not ( = ?auto_756525 ?auto_756540 ) ) ( not ( = ?auto_756525 ?auto_756541 ) ) ( not ( = ?auto_756525 ?auto_756542 ) ) ( not ( = ?auto_756525 ?auto_756543 ) ) ( not ( = ?auto_756526 ?auto_756527 ) ) ( not ( = ?auto_756526 ?auto_756528 ) ) ( not ( = ?auto_756526 ?auto_756529 ) ) ( not ( = ?auto_756526 ?auto_756530 ) ) ( not ( = ?auto_756526 ?auto_756531 ) ) ( not ( = ?auto_756526 ?auto_756532 ) ) ( not ( = ?auto_756526 ?auto_756533 ) ) ( not ( = ?auto_756526 ?auto_756534 ) ) ( not ( = ?auto_756526 ?auto_756535 ) ) ( not ( = ?auto_756526 ?auto_756536 ) ) ( not ( = ?auto_756526 ?auto_756537 ) ) ( not ( = ?auto_756526 ?auto_756538 ) ) ( not ( = ?auto_756526 ?auto_756539 ) ) ( not ( = ?auto_756526 ?auto_756540 ) ) ( not ( = ?auto_756526 ?auto_756541 ) ) ( not ( = ?auto_756526 ?auto_756542 ) ) ( not ( = ?auto_756526 ?auto_756543 ) ) ( not ( = ?auto_756527 ?auto_756528 ) ) ( not ( = ?auto_756527 ?auto_756529 ) ) ( not ( = ?auto_756527 ?auto_756530 ) ) ( not ( = ?auto_756527 ?auto_756531 ) ) ( not ( = ?auto_756527 ?auto_756532 ) ) ( not ( = ?auto_756527 ?auto_756533 ) ) ( not ( = ?auto_756527 ?auto_756534 ) ) ( not ( = ?auto_756527 ?auto_756535 ) ) ( not ( = ?auto_756527 ?auto_756536 ) ) ( not ( = ?auto_756527 ?auto_756537 ) ) ( not ( = ?auto_756527 ?auto_756538 ) ) ( not ( = ?auto_756527 ?auto_756539 ) ) ( not ( = ?auto_756527 ?auto_756540 ) ) ( not ( = ?auto_756527 ?auto_756541 ) ) ( not ( = ?auto_756527 ?auto_756542 ) ) ( not ( = ?auto_756527 ?auto_756543 ) ) ( not ( = ?auto_756528 ?auto_756529 ) ) ( not ( = ?auto_756528 ?auto_756530 ) ) ( not ( = ?auto_756528 ?auto_756531 ) ) ( not ( = ?auto_756528 ?auto_756532 ) ) ( not ( = ?auto_756528 ?auto_756533 ) ) ( not ( = ?auto_756528 ?auto_756534 ) ) ( not ( = ?auto_756528 ?auto_756535 ) ) ( not ( = ?auto_756528 ?auto_756536 ) ) ( not ( = ?auto_756528 ?auto_756537 ) ) ( not ( = ?auto_756528 ?auto_756538 ) ) ( not ( = ?auto_756528 ?auto_756539 ) ) ( not ( = ?auto_756528 ?auto_756540 ) ) ( not ( = ?auto_756528 ?auto_756541 ) ) ( not ( = ?auto_756528 ?auto_756542 ) ) ( not ( = ?auto_756528 ?auto_756543 ) ) ( not ( = ?auto_756529 ?auto_756530 ) ) ( not ( = ?auto_756529 ?auto_756531 ) ) ( not ( = ?auto_756529 ?auto_756532 ) ) ( not ( = ?auto_756529 ?auto_756533 ) ) ( not ( = ?auto_756529 ?auto_756534 ) ) ( not ( = ?auto_756529 ?auto_756535 ) ) ( not ( = ?auto_756529 ?auto_756536 ) ) ( not ( = ?auto_756529 ?auto_756537 ) ) ( not ( = ?auto_756529 ?auto_756538 ) ) ( not ( = ?auto_756529 ?auto_756539 ) ) ( not ( = ?auto_756529 ?auto_756540 ) ) ( not ( = ?auto_756529 ?auto_756541 ) ) ( not ( = ?auto_756529 ?auto_756542 ) ) ( not ( = ?auto_756529 ?auto_756543 ) ) ( not ( = ?auto_756530 ?auto_756531 ) ) ( not ( = ?auto_756530 ?auto_756532 ) ) ( not ( = ?auto_756530 ?auto_756533 ) ) ( not ( = ?auto_756530 ?auto_756534 ) ) ( not ( = ?auto_756530 ?auto_756535 ) ) ( not ( = ?auto_756530 ?auto_756536 ) ) ( not ( = ?auto_756530 ?auto_756537 ) ) ( not ( = ?auto_756530 ?auto_756538 ) ) ( not ( = ?auto_756530 ?auto_756539 ) ) ( not ( = ?auto_756530 ?auto_756540 ) ) ( not ( = ?auto_756530 ?auto_756541 ) ) ( not ( = ?auto_756530 ?auto_756542 ) ) ( not ( = ?auto_756530 ?auto_756543 ) ) ( not ( = ?auto_756531 ?auto_756532 ) ) ( not ( = ?auto_756531 ?auto_756533 ) ) ( not ( = ?auto_756531 ?auto_756534 ) ) ( not ( = ?auto_756531 ?auto_756535 ) ) ( not ( = ?auto_756531 ?auto_756536 ) ) ( not ( = ?auto_756531 ?auto_756537 ) ) ( not ( = ?auto_756531 ?auto_756538 ) ) ( not ( = ?auto_756531 ?auto_756539 ) ) ( not ( = ?auto_756531 ?auto_756540 ) ) ( not ( = ?auto_756531 ?auto_756541 ) ) ( not ( = ?auto_756531 ?auto_756542 ) ) ( not ( = ?auto_756531 ?auto_756543 ) ) ( not ( = ?auto_756532 ?auto_756533 ) ) ( not ( = ?auto_756532 ?auto_756534 ) ) ( not ( = ?auto_756532 ?auto_756535 ) ) ( not ( = ?auto_756532 ?auto_756536 ) ) ( not ( = ?auto_756532 ?auto_756537 ) ) ( not ( = ?auto_756532 ?auto_756538 ) ) ( not ( = ?auto_756532 ?auto_756539 ) ) ( not ( = ?auto_756532 ?auto_756540 ) ) ( not ( = ?auto_756532 ?auto_756541 ) ) ( not ( = ?auto_756532 ?auto_756542 ) ) ( not ( = ?auto_756532 ?auto_756543 ) ) ( not ( = ?auto_756533 ?auto_756534 ) ) ( not ( = ?auto_756533 ?auto_756535 ) ) ( not ( = ?auto_756533 ?auto_756536 ) ) ( not ( = ?auto_756533 ?auto_756537 ) ) ( not ( = ?auto_756533 ?auto_756538 ) ) ( not ( = ?auto_756533 ?auto_756539 ) ) ( not ( = ?auto_756533 ?auto_756540 ) ) ( not ( = ?auto_756533 ?auto_756541 ) ) ( not ( = ?auto_756533 ?auto_756542 ) ) ( not ( = ?auto_756533 ?auto_756543 ) ) ( not ( = ?auto_756534 ?auto_756535 ) ) ( not ( = ?auto_756534 ?auto_756536 ) ) ( not ( = ?auto_756534 ?auto_756537 ) ) ( not ( = ?auto_756534 ?auto_756538 ) ) ( not ( = ?auto_756534 ?auto_756539 ) ) ( not ( = ?auto_756534 ?auto_756540 ) ) ( not ( = ?auto_756534 ?auto_756541 ) ) ( not ( = ?auto_756534 ?auto_756542 ) ) ( not ( = ?auto_756534 ?auto_756543 ) ) ( not ( = ?auto_756535 ?auto_756536 ) ) ( not ( = ?auto_756535 ?auto_756537 ) ) ( not ( = ?auto_756535 ?auto_756538 ) ) ( not ( = ?auto_756535 ?auto_756539 ) ) ( not ( = ?auto_756535 ?auto_756540 ) ) ( not ( = ?auto_756535 ?auto_756541 ) ) ( not ( = ?auto_756535 ?auto_756542 ) ) ( not ( = ?auto_756535 ?auto_756543 ) ) ( not ( = ?auto_756536 ?auto_756537 ) ) ( not ( = ?auto_756536 ?auto_756538 ) ) ( not ( = ?auto_756536 ?auto_756539 ) ) ( not ( = ?auto_756536 ?auto_756540 ) ) ( not ( = ?auto_756536 ?auto_756541 ) ) ( not ( = ?auto_756536 ?auto_756542 ) ) ( not ( = ?auto_756536 ?auto_756543 ) ) ( not ( = ?auto_756537 ?auto_756538 ) ) ( not ( = ?auto_756537 ?auto_756539 ) ) ( not ( = ?auto_756537 ?auto_756540 ) ) ( not ( = ?auto_756537 ?auto_756541 ) ) ( not ( = ?auto_756537 ?auto_756542 ) ) ( not ( = ?auto_756537 ?auto_756543 ) ) ( not ( = ?auto_756538 ?auto_756539 ) ) ( not ( = ?auto_756538 ?auto_756540 ) ) ( not ( = ?auto_756538 ?auto_756541 ) ) ( not ( = ?auto_756538 ?auto_756542 ) ) ( not ( = ?auto_756538 ?auto_756543 ) ) ( not ( = ?auto_756539 ?auto_756540 ) ) ( not ( = ?auto_756539 ?auto_756541 ) ) ( not ( = ?auto_756539 ?auto_756542 ) ) ( not ( = ?auto_756539 ?auto_756543 ) ) ( not ( = ?auto_756540 ?auto_756541 ) ) ( not ( = ?auto_756540 ?auto_756542 ) ) ( not ( = ?auto_756540 ?auto_756543 ) ) ( not ( = ?auto_756541 ?auto_756542 ) ) ( not ( = ?auto_756541 ?auto_756543 ) ) ( not ( = ?auto_756542 ?auto_756543 ) ) ( ON ?auto_756541 ?auto_756542 ) ( ON ?auto_756540 ?auto_756541 ) ( ON ?auto_756539 ?auto_756540 ) ( ON ?auto_756538 ?auto_756539 ) ( ON ?auto_756537 ?auto_756538 ) ( ON ?auto_756536 ?auto_756537 ) ( ON ?auto_756535 ?auto_756536 ) ( CLEAR ?auto_756533 ) ( ON ?auto_756534 ?auto_756535 ) ( CLEAR ?auto_756534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_756525 ?auto_756526 ?auto_756527 ?auto_756528 ?auto_756529 ?auto_756530 ?auto_756531 ?auto_756532 ?auto_756533 ?auto_756534 )
      ( MAKE-18PILE ?auto_756525 ?auto_756526 ?auto_756527 ?auto_756528 ?auto_756529 ?auto_756530 ?auto_756531 ?auto_756532 ?auto_756533 ?auto_756534 ?auto_756535 ?auto_756536 ?auto_756537 ?auto_756538 ?auto_756539 ?auto_756540 ?auto_756541 ?auto_756542 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756562 - BLOCK
      ?auto_756563 - BLOCK
      ?auto_756564 - BLOCK
      ?auto_756565 - BLOCK
      ?auto_756566 - BLOCK
      ?auto_756567 - BLOCK
      ?auto_756568 - BLOCK
      ?auto_756569 - BLOCK
      ?auto_756570 - BLOCK
      ?auto_756571 - BLOCK
      ?auto_756572 - BLOCK
      ?auto_756573 - BLOCK
      ?auto_756574 - BLOCK
      ?auto_756575 - BLOCK
      ?auto_756576 - BLOCK
      ?auto_756577 - BLOCK
      ?auto_756578 - BLOCK
      ?auto_756579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756579 ) ( ON-TABLE ?auto_756562 ) ( ON ?auto_756563 ?auto_756562 ) ( ON ?auto_756564 ?auto_756563 ) ( ON ?auto_756565 ?auto_756564 ) ( ON ?auto_756566 ?auto_756565 ) ( ON ?auto_756567 ?auto_756566 ) ( ON ?auto_756568 ?auto_756567 ) ( ON ?auto_756569 ?auto_756568 ) ( ON ?auto_756570 ?auto_756569 ) ( not ( = ?auto_756562 ?auto_756563 ) ) ( not ( = ?auto_756562 ?auto_756564 ) ) ( not ( = ?auto_756562 ?auto_756565 ) ) ( not ( = ?auto_756562 ?auto_756566 ) ) ( not ( = ?auto_756562 ?auto_756567 ) ) ( not ( = ?auto_756562 ?auto_756568 ) ) ( not ( = ?auto_756562 ?auto_756569 ) ) ( not ( = ?auto_756562 ?auto_756570 ) ) ( not ( = ?auto_756562 ?auto_756571 ) ) ( not ( = ?auto_756562 ?auto_756572 ) ) ( not ( = ?auto_756562 ?auto_756573 ) ) ( not ( = ?auto_756562 ?auto_756574 ) ) ( not ( = ?auto_756562 ?auto_756575 ) ) ( not ( = ?auto_756562 ?auto_756576 ) ) ( not ( = ?auto_756562 ?auto_756577 ) ) ( not ( = ?auto_756562 ?auto_756578 ) ) ( not ( = ?auto_756562 ?auto_756579 ) ) ( not ( = ?auto_756563 ?auto_756564 ) ) ( not ( = ?auto_756563 ?auto_756565 ) ) ( not ( = ?auto_756563 ?auto_756566 ) ) ( not ( = ?auto_756563 ?auto_756567 ) ) ( not ( = ?auto_756563 ?auto_756568 ) ) ( not ( = ?auto_756563 ?auto_756569 ) ) ( not ( = ?auto_756563 ?auto_756570 ) ) ( not ( = ?auto_756563 ?auto_756571 ) ) ( not ( = ?auto_756563 ?auto_756572 ) ) ( not ( = ?auto_756563 ?auto_756573 ) ) ( not ( = ?auto_756563 ?auto_756574 ) ) ( not ( = ?auto_756563 ?auto_756575 ) ) ( not ( = ?auto_756563 ?auto_756576 ) ) ( not ( = ?auto_756563 ?auto_756577 ) ) ( not ( = ?auto_756563 ?auto_756578 ) ) ( not ( = ?auto_756563 ?auto_756579 ) ) ( not ( = ?auto_756564 ?auto_756565 ) ) ( not ( = ?auto_756564 ?auto_756566 ) ) ( not ( = ?auto_756564 ?auto_756567 ) ) ( not ( = ?auto_756564 ?auto_756568 ) ) ( not ( = ?auto_756564 ?auto_756569 ) ) ( not ( = ?auto_756564 ?auto_756570 ) ) ( not ( = ?auto_756564 ?auto_756571 ) ) ( not ( = ?auto_756564 ?auto_756572 ) ) ( not ( = ?auto_756564 ?auto_756573 ) ) ( not ( = ?auto_756564 ?auto_756574 ) ) ( not ( = ?auto_756564 ?auto_756575 ) ) ( not ( = ?auto_756564 ?auto_756576 ) ) ( not ( = ?auto_756564 ?auto_756577 ) ) ( not ( = ?auto_756564 ?auto_756578 ) ) ( not ( = ?auto_756564 ?auto_756579 ) ) ( not ( = ?auto_756565 ?auto_756566 ) ) ( not ( = ?auto_756565 ?auto_756567 ) ) ( not ( = ?auto_756565 ?auto_756568 ) ) ( not ( = ?auto_756565 ?auto_756569 ) ) ( not ( = ?auto_756565 ?auto_756570 ) ) ( not ( = ?auto_756565 ?auto_756571 ) ) ( not ( = ?auto_756565 ?auto_756572 ) ) ( not ( = ?auto_756565 ?auto_756573 ) ) ( not ( = ?auto_756565 ?auto_756574 ) ) ( not ( = ?auto_756565 ?auto_756575 ) ) ( not ( = ?auto_756565 ?auto_756576 ) ) ( not ( = ?auto_756565 ?auto_756577 ) ) ( not ( = ?auto_756565 ?auto_756578 ) ) ( not ( = ?auto_756565 ?auto_756579 ) ) ( not ( = ?auto_756566 ?auto_756567 ) ) ( not ( = ?auto_756566 ?auto_756568 ) ) ( not ( = ?auto_756566 ?auto_756569 ) ) ( not ( = ?auto_756566 ?auto_756570 ) ) ( not ( = ?auto_756566 ?auto_756571 ) ) ( not ( = ?auto_756566 ?auto_756572 ) ) ( not ( = ?auto_756566 ?auto_756573 ) ) ( not ( = ?auto_756566 ?auto_756574 ) ) ( not ( = ?auto_756566 ?auto_756575 ) ) ( not ( = ?auto_756566 ?auto_756576 ) ) ( not ( = ?auto_756566 ?auto_756577 ) ) ( not ( = ?auto_756566 ?auto_756578 ) ) ( not ( = ?auto_756566 ?auto_756579 ) ) ( not ( = ?auto_756567 ?auto_756568 ) ) ( not ( = ?auto_756567 ?auto_756569 ) ) ( not ( = ?auto_756567 ?auto_756570 ) ) ( not ( = ?auto_756567 ?auto_756571 ) ) ( not ( = ?auto_756567 ?auto_756572 ) ) ( not ( = ?auto_756567 ?auto_756573 ) ) ( not ( = ?auto_756567 ?auto_756574 ) ) ( not ( = ?auto_756567 ?auto_756575 ) ) ( not ( = ?auto_756567 ?auto_756576 ) ) ( not ( = ?auto_756567 ?auto_756577 ) ) ( not ( = ?auto_756567 ?auto_756578 ) ) ( not ( = ?auto_756567 ?auto_756579 ) ) ( not ( = ?auto_756568 ?auto_756569 ) ) ( not ( = ?auto_756568 ?auto_756570 ) ) ( not ( = ?auto_756568 ?auto_756571 ) ) ( not ( = ?auto_756568 ?auto_756572 ) ) ( not ( = ?auto_756568 ?auto_756573 ) ) ( not ( = ?auto_756568 ?auto_756574 ) ) ( not ( = ?auto_756568 ?auto_756575 ) ) ( not ( = ?auto_756568 ?auto_756576 ) ) ( not ( = ?auto_756568 ?auto_756577 ) ) ( not ( = ?auto_756568 ?auto_756578 ) ) ( not ( = ?auto_756568 ?auto_756579 ) ) ( not ( = ?auto_756569 ?auto_756570 ) ) ( not ( = ?auto_756569 ?auto_756571 ) ) ( not ( = ?auto_756569 ?auto_756572 ) ) ( not ( = ?auto_756569 ?auto_756573 ) ) ( not ( = ?auto_756569 ?auto_756574 ) ) ( not ( = ?auto_756569 ?auto_756575 ) ) ( not ( = ?auto_756569 ?auto_756576 ) ) ( not ( = ?auto_756569 ?auto_756577 ) ) ( not ( = ?auto_756569 ?auto_756578 ) ) ( not ( = ?auto_756569 ?auto_756579 ) ) ( not ( = ?auto_756570 ?auto_756571 ) ) ( not ( = ?auto_756570 ?auto_756572 ) ) ( not ( = ?auto_756570 ?auto_756573 ) ) ( not ( = ?auto_756570 ?auto_756574 ) ) ( not ( = ?auto_756570 ?auto_756575 ) ) ( not ( = ?auto_756570 ?auto_756576 ) ) ( not ( = ?auto_756570 ?auto_756577 ) ) ( not ( = ?auto_756570 ?auto_756578 ) ) ( not ( = ?auto_756570 ?auto_756579 ) ) ( not ( = ?auto_756571 ?auto_756572 ) ) ( not ( = ?auto_756571 ?auto_756573 ) ) ( not ( = ?auto_756571 ?auto_756574 ) ) ( not ( = ?auto_756571 ?auto_756575 ) ) ( not ( = ?auto_756571 ?auto_756576 ) ) ( not ( = ?auto_756571 ?auto_756577 ) ) ( not ( = ?auto_756571 ?auto_756578 ) ) ( not ( = ?auto_756571 ?auto_756579 ) ) ( not ( = ?auto_756572 ?auto_756573 ) ) ( not ( = ?auto_756572 ?auto_756574 ) ) ( not ( = ?auto_756572 ?auto_756575 ) ) ( not ( = ?auto_756572 ?auto_756576 ) ) ( not ( = ?auto_756572 ?auto_756577 ) ) ( not ( = ?auto_756572 ?auto_756578 ) ) ( not ( = ?auto_756572 ?auto_756579 ) ) ( not ( = ?auto_756573 ?auto_756574 ) ) ( not ( = ?auto_756573 ?auto_756575 ) ) ( not ( = ?auto_756573 ?auto_756576 ) ) ( not ( = ?auto_756573 ?auto_756577 ) ) ( not ( = ?auto_756573 ?auto_756578 ) ) ( not ( = ?auto_756573 ?auto_756579 ) ) ( not ( = ?auto_756574 ?auto_756575 ) ) ( not ( = ?auto_756574 ?auto_756576 ) ) ( not ( = ?auto_756574 ?auto_756577 ) ) ( not ( = ?auto_756574 ?auto_756578 ) ) ( not ( = ?auto_756574 ?auto_756579 ) ) ( not ( = ?auto_756575 ?auto_756576 ) ) ( not ( = ?auto_756575 ?auto_756577 ) ) ( not ( = ?auto_756575 ?auto_756578 ) ) ( not ( = ?auto_756575 ?auto_756579 ) ) ( not ( = ?auto_756576 ?auto_756577 ) ) ( not ( = ?auto_756576 ?auto_756578 ) ) ( not ( = ?auto_756576 ?auto_756579 ) ) ( not ( = ?auto_756577 ?auto_756578 ) ) ( not ( = ?auto_756577 ?auto_756579 ) ) ( not ( = ?auto_756578 ?auto_756579 ) ) ( ON ?auto_756578 ?auto_756579 ) ( ON ?auto_756577 ?auto_756578 ) ( ON ?auto_756576 ?auto_756577 ) ( ON ?auto_756575 ?auto_756576 ) ( ON ?auto_756574 ?auto_756575 ) ( ON ?auto_756573 ?auto_756574 ) ( ON ?auto_756572 ?auto_756573 ) ( CLEAR ?auto_756570 ) ( ON ?auto_756571 ?auto_756572 ) ( CLEAR ?auto_756571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_756562 ?auto_756563 ?auto_756564 ?auto_756565 ?auto_756566 ?auto_756567 ?auto_756568 ?auto_756569 ?auto_756570 ?auto_756571 )
      ( MAKE-18PILE ?auto_756562 ?auto_756563 ?auto_756564 ?auto_756565 ?auto_756566 ?auto_756567 ?auto_756568 ?auto_756569 ?auto_756570 ?auto_756571 ?auto_756572 ?auto_756573 ?auto_756574 ?auto_756575 ?auto_756576 ?auto_756577 ?auto_756578 ?auto_756579 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756598 - BLOCK
      ?auto_756599 - BLOCK
      ?auto_756600 - BLOCK
      ?auto_756601 - BLOCK
      ?auto_756602 - BLOCK
      ?auto_756603 - BLOCK
      ?auto_756604 - BLOCK
      ?auto_756605 - BLOCK
      ?auto_756606 - BLOCK
      ?auto_756607 - BLOCK
      ?auto_756608 - BLOCK
      ?auto_756609 - BLOCK
      ?auto_756610 - BLOCK
      ?auto_756611 - BLOCK
      ?auto_756612 - BLOCK
      ?auto_756613 - BLOCK
      ?auto_756614 - BLOCK
      ?auto_756615 - BLOCK
    )
    :vars
    (
      ?auto_756616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756615 ?auto_756616 ) ( ON-TABLE ?auto_756598 ) ( ON ?auto_756599 ?auto_756598 ) ( ON ?auto_756600 ?auto_756599 ) ( ON ?auto_756601 ?auto_756600 ) ( ON ?auto_756602 ?auto_756601 ) ( ON ?auto_756603 ?auto_756602 ) ( ON ?auto_756604 ?auto_756603 ) ( ON ?auto_756605 ?auto_756604 ) ( not ( = ?auto_756598 ?auto_756599 ) ) ( not ( = ?auto_756598 ?auto_756600 ) ) ( not ( = ?auto_756598 ?auto_756601 ) ) ( not ( = ?auto_756598 ?auto_756602 ) ) ( not ( = ?auto_756598 ?auto_756603 ) ) ( not ( = ?auto_756598 ?auto_756604 ) ) ( not ( = ?auto_756598 ?auto_756605 ) ) ( not ( = ?auto_756598 ?auto_756606 ) ) ( not ( = ?auto_756598 ?auto_756607 ) ) ( not ( = ?auto_756598 ?auto_756608 ) ) ( not ( = ?auto_756598 ?auto_756609 ) ) ( not ( = ?auto_756598 ?auto_756610 ) ) ( not ( = ?auto_756598 ?auto_756611 ) ) ( not ( = ?auto_756598 ?auto_756612 ) ) ( not ( = ?auto_756598 ?auto_756613 ) ) ( not ( = ?auto_756598 ?auto_756614 ) ) ( not ( = ?auto_756598 ?auto_756615 ) ) ( not ( = ?auto_756598 ?auto_756616 ) ) ( not ( = ?auto_756599 ?auto_756600 ) ) ( not ( = ?auto_756599 ?auto_756601 ) ) ( not ( = ?auto_756599 ?auto_756602 ) ) ( not ( = ?auto_756599 ?auto_756603 ) ) ( not ( = ?auto_756599 ?auto_756604 ) ) ( not ( = ?auto_756599 ?auto_756605 ) ) ( not ( = ?auto_756599 ?auto_756606 ) ) ( not ( = ?auto_756599 ?auto_756607 ) ) ( not ( = ?auto_756599 ?auto_756608 ) ) ( not ( = ?auto_756599 ?auto_756609 ) ) ( not ( = ?auto_756599 ?auto_756610 ) ) ( not ( = ?auto_756599 ?auto_756611 ) ) ( not ( = ?auto_756599 ?auto_756612 ) ) ( not ( = ?auto_756599 ?auto_756613 ) ) ( not ( = ?auto_756599 ?auto_756614 ) ) ( not ( = ?auto_756599 ?auto_756615 ) ) ( not ( = ?auto_756599 ?auto_756616 ) ) ( not ( = ?auto_756600 ?auto_756601 ) ) ( not ( = ?auto_756600 ?auto_756602 ) ) ( not ( = ?auto_756600 ?auto_756603 ) ) ( not ( = ?auto_756600 ?auto_756604 ) ) ( not ( = ?auto_756600 ?auto_756605 ) ) ( not ( = ?auto_756600 ?auto_756606 ) ) ( not ( = ?auto_756600 ?auto_756607 ) ) ( not ( = ?auto_756600 ?auto_756608 ) ) ( not ( = ?auto_756600 ?auto_756609 ) ) ( not ( = ?auto_756600 ?auto_756610 ) ) ( not ( = ?auto_756600 ?auto_756611 ) ) ( not ( = ?auto_756600 ?auto_756612 ) ) ( not ( = ?auto_756600 ?auto_756613 ) ) ( not ( = ?auto_756600 ?auto_756614 ) ) ( not ( = ?auto_756600 ?auto_756615 ) ) ( not ( = ?auto_756600 ?auto_756616 ) ) ( not ( = ?auto_756601 ?auto_756602 ) ) ( not ( = ?auto_756601 ?auto_756603 ) ) ( not ( = ?auto_756601 ?auto_756604 ) ) ( not ( = ?auto_756601 ?auto_756605 ) ) ( not ( = ?auto_756601 ?auto_756606 ) ) ( not ( = ?auto_756601 ?auto_756607 ) ) ( not ( = ?auto_756601 ?auto_756608 ) ) ( not ( = ?auto_756601 ?auto_756609 ) ) ( not ( = ?auto_756601 ?auto_756610 ) ) ( not ( = ?auto_756601 ?auto_756611 ) ) ( not ( = ?auto_756601 ?auto_756612 ) ) ( not ( = ?auto_756601 ?auto_756613 ) ) ( not ( = ?auto_756601 ?auto_756614 ) ) ( not ( = ?auto_756601 ?auto_756615 ) ) ( not ( = ?auto_756601 ?auto_756616 ) ) ( not ( = ?auto_756602 ?auto_756603 ) ) ( not ( = ?auto_756602 ?auto_756604 ) ) ( not ( = ?auto_756602 ?auto_756605 ) ) ( not ( = ?auto_756602 ?auto_756606 ) ) ( not ( = ?auto_756602 ?auto_756607 ) ) ( not ( = ?auto_756602 ?auto_756608 ) ) ( not ( = ?auto_756602 ?auto_756609 ) ) ( not ( = ?auto_756602 ?auto_756610 ) ) ( not ( = ?auto_756602 ?auto_756611 ) ) ( not ( = ?auto_756602 ?auto_756612 ) ) ( not ( = ?auto_756602 ?auto_756613 ) ) ( not ( = ?auto_756602 ?auto_756614 ) ) ( not ( = ?auto_756602 ?auto_756615 ) ) ( not ( = ?auto_756602 ?auto_756616 ) ) ( not ( = ?auto_756603 ?auto_756604 ) ) ( not ( = ?auto_756603 ?auto_756605 ) ) ( not ( = ?auto_756603 ?auto_756606 ) ) ( not ( = ?auto_756603 ?auto_756607 ) ) ( not ( = ?auto_756603 ?auto_756608 ) ) ( not ( = ?auto_756603 ?auto_756609 ) ) ( not ( = ?auto_756603 ?auto_756610 ) ) ( not ( = ?auto_756603 ?auto_756611 ) ) ( not ( = ?auto_756603 ?auto_756612 ) ) ( not ( = ?auto_756603 ?auto_756613 ) ) ( not ( = ?auto_756603 ?auto_756614 ) ) ( not ( = ?auto_756603 ?auto_756615 ) ) ( not ( = ?auto_756603 ?auto_756616 ) ) ( not ( = ?auto_756604 ?auto_756605 ) ) ( not ( = ?auto_756604 ?auto_756606 ) ) ( not ( = ?auto_756604 ?auto_756607 ) ) ( not ( = ?auto_756604 ?auto_756608 ) ) ( not ( = ?auto_756604 ?auto_756609 ) ) ( not ( = ?auto_756604 ?auto_756610 ) ) ( not ( = ?auto_756604 ?auto_756611 ) ) ( not ( = ?auto_756604 ?auto_756612 ) ) ( not ( = ?auto_756604 ?auto_756613 ) ) ( not ( = ?auto_756604 ?auto_756614 ) ) ( not ( = ?auto_756604 ?auto_756615 ) ) ( not ( = ?auto_756604 ?auto_756616 ) ) ( not ( = ?auto_756605 ?auto_756606 ) ) ( not ( = ?auto_756605 ?auto_756607 ) ) ( not ( = ?auto_756605 ?auto_756608 ) ) ( not ( = ?auto_756605 ?auto_756609 ) ) ( not ( = ?auto_756605 ?auto_756610 ) ) ( not ( = ?auto_756605 ?auto_756611 ) ) ( not ( = ?auto_756605 ?auto_756612 ) ) ( not ( = ?auto_756605 ?auto_756613 ) ) ( not ( = ?auto_756605 ?auto_756614 ) ) ( not ( = ?auto_756605 ?auto_756615 ) ) ( not ( = ?auto_756605 ?auto_756616 ) ) ( not ( = ?auto_756606 ?auto_756607 ) ) ( not ( = ?auto_756606 ?auto_756608 ) ) ( not ( = ?auto_756606 ?auto_756609 ) ) ( not ( = ?auto_756606 ?auto_756610 ) ) ( not ( = ?auto_756606 ?auto_756611 ) ) ( not ( = ?auto_756606 ?auto_756612 ) ) ( not ( = ?auto_756606 ?auto_756613 ) ) ( not ( = ?auto_756606 ?auto_756614 ) ) ( not ( = ?auto_756606 ?auto_756615 ) ) ( not ( = ?auto_756606 ?auto_756616 ) ) ( not ( = ?auto_756607 ?auto_756608 ) ) ( not ( = ?auto_756607 ?auto_756609 ) ) ( not ( = ?auto_756607 ?auto_756610 ) ) ( not ( = ?auto_756607 ?auto_756611 ) ) ( not ( = ?auto_756607 ?auto_756612 ) ) ( not ( = ?auto_756607 ?auto_756613 ) ) ( not ( = ?auto_756607 ?auto_756614 ) ) ( not ( = ?auto_756607 ?auto_756615 ) ) ( not ( = ?auto_756607 ?auto_756616 ) ) ( not ( = ?auto_756608 ?auto_756609 ) ) ( not ( = ?auto_756608 ?auto_756610 ) ) ( not ( = ?auto_756608 ?auto_756611 ) ) ( not ( = ?auto_756608 ?auto_756612 ) ) ( not ( = ?auto_756608 ?auto_756613 ) ) ( not ( = ?auto_756608 ?auto_756614 ) ) ( not ( = ?auto_756608 ?auto_756615 ) ) ( not ( = ?auto_756608 ?auto_756616 ) ) ( not ( = ?auto_756609 ?auto_756610 ) ) ( not ( = ?auto_756609 ?auto_756611 ) ) ( not ( = ?auto_756609 ?auto_756612 ) ) ( not ( = ?auto_756609 ?auto_756613 ) ) ( not ( = ?auto_756609 ?auto_756614 ) ) ( not ( = ?auto_756609 ?auto_756615 ) ) ( not ( = ?auto_756609 ?auto_756616 ) ) ( not ( = ?auto_756610 ?auto_756611 ) ) ( not ( = ?auto_756610 ?auto_756612 ) ) ( not ( = ?auto_756610 ?auto_756613 ) ) ( not ( = ?auto_756610 ?auto_756614 ) ) ( not ( = ?auto_756610 ?auto_756615 ) ) ( not ( = ?auto_756610 ?auto_756616 ) ) ( not ( = ?auto_756611 ?auto_756612 ) ) ( not ( = ?auto_756611 ?auto_756613 ) ) ( not ( = ?auto_756611 ?auto_756614 ) ) ( not ( = ?auto_756611 ?auto_756615 ) ) ( not ( = ?auto_756611 ?auto_756616 ) ) ( not ( = ?auto_756612 ?auto_756613 ) ) ( not ( = ?auto_756612 ?auto_756614 ) ) ( not ( = ?auto_756612 ?auto_756615 ) ) ( not ( = ?auto_756612 ?auto_756616 ) ) ( not ( = ?auto_756613 ?auto_756614 ) ) ( not ( = ?auto_756613 ?auto_756615 ) ) ( not ( = ?auto_756613 ?auto_756616 ) ) ( not ( = ?auto_756614 ?auto_756615 ) ) ( not ( = ?auto_756614 ?auto_756616 ) ) ( not ( = ?auto_756615 ?auto_756616 ) ) ( ON ?auto_756614 ?auto_756615 ) ( ON ?auto_756613 ?auto_756614 ) ( ON ?auto_756612 ?auto_756613 ) ( ON ?auto_756611 ?auto_756612 ) ( ON ?auto_756610 ?auto_756611 ) ( ON ?auto_756609 ?auto_756610 ) ( ON ?auto_756608 ?auto_756609 ) ( ON ?auto_756607 ?auto_756608 ) ( CLEAR ?auto_756605 ) ( ON ?auto_756606 ?auto_756607 ) ( CLEAR ?auto_756606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_756598 ?auto_756599 ?auto_756600 ?auto_756601 ?auto_756602 ?auto_756603 ?auto_756604 ?auto_756605 ?auto_756606 )
      ( MAKE-18PILE ?auto_756598 ?auto_756599 ?auto_756600 ?auto_756601 ?auto_756602 ?auto_756603 ?auto_756604 ?auto_756605 ?auto_756606 ?auto_756607 ?auto_756608 ?auto_756609 ?auto_756610 ?auto_756611 ?auto_756612 ?auto_756613 ?auto_756614 ?auto_756615 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756635 - BLOCK
      ?auto_756636 - BLOCK
      ?auto_756637 - BLOCK
      ?auto_756638 - BLOCK
      ?auto_756639 - BLOCK
      ?auto_756640 - BLOCK
      ?auto_756641 - BLOCK
      ?auto_756642 - BLOCK
      ?auto_756643 - BLOCK
      ?auto_756644 - BLOCK
      ?auto_756645 - BLOCK
      ?auto_756646 - BLOCK
      ?auto_756647 - BLOCK
      ?auto_756648 - BLOCK
      ?auto_756649 - BLOCK
      ?auto_756650 - BLOCK
      ?auto_756651 - BLOCK
      ?auto_756652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756652 ) ( ON-TABLE ?auto_756635 ) ( ON ?auto_756636 ?auto_756635 ) ( ON ?auto_756637 ?auto_756636 ) ( ON ?auto_756638 ?auto_756637 ) ( ON ?auto_756639 ?auto_756638 ) ( ON ?auto_756640 ?auto_756639 ) ( ON ?auto_756641 ?auto_756640 ) ( ON ?auto_756642 ?auto_756641 ) ( not ( = ?auto_756635 ?auto_756636 ) ) ( not ( = ?auto_756635 ?auto_756637 ) ) ( not ( = ?auto_756635 ?auto_756638 ) ) ( not ( = ?auto_756635 ?auto_756639 ) ) ( not ( = ?auto_756635 ?auto_756640 ) ) ( not ( = ?auto_756635 ?auto_756641 ) ) ( not ( = ?auto_756635 ?auto_756642 ) ) ( not ( = ?auto_756635 ?auto_756643 ) ) ( not ( = ?auto_756635 ?auto_756644 ) ) ( not ( = ?auto_756635 ?auto_756645 ) ) ( not ( = ?auto_756635 ?auto_756646 ) ) ( not ( = ?auto_756635 ?auto_756647 ) ) ( not ( = ?auto_756635 ?auto_756648 ) ) ( not ( = ?auto_756635 ?auto_756649 ) ) ( not ( = ?auto_756635 ?auto_756650 ) ) ( not ( = ?auto_756635 ?auto_756651 ) ) ( not ( = ?auto_756635 ?auto_756652 ) ) ( not ( = ?auto_756636 ?auto_756637 ) ) ( not ( = ?auto_756636 ?auto_756638 ) ) ( not ( = ?auto_756636 ?auto_756639 ) ) ( not ( = ?auto_756636 ?auto_756640 ) ) ( not ( = ?auto_756636 ?auto_756641 ) ) ( not ( = ?auto_756636 ?auto_756642 ) ) ( not ( = ?auto_756636 ?auto_756643 ) ) ( not ( = ?auto_756636 ?auto_756644 ) ) ( not ( = ?auto_756636 ?auto_756645 ) ) ( not ( = ?auto_756636 ?auto_756646 ) ) ( not ( = ?auto_756636 ?auto_756647 ) ) ( not ( = ?auto_756636 ?auto_756648 ) ) ( not ( = ?auto_756636 ?auto_756649 ) ) ( not ( = ?auto_756636 ?auto_756650 ) ) ( not ( = ?auto_756636 ?auto_756651 ) ) ( not ( = ?auto_756636 ?auto_756652 ) ) ( not ( = ?auto_756637 ?auto_756638 ) ) ( not ( = ?auto_756637 ?auto_756639 ) ) ( not ( = ?auto_756637 ?auto_756640 ) ) ( not ( = ?auto_756637 ?auto_756641 ) ) ( not ( = ?auto_756637 ?auto_756642 ) ) ( not ( = ?auto_756637 ?auto_756643 ) ) ( not ( = ?auto_756637 ?auto_756644 ) ) ( not ( = ?auto_756637 ?auto_756645 ) ) ( not ( = ?auto_756637 ?auto_756646 ) ) ( not ( = ?auto_756637 ?auto_756647 ) ) ( not ( = ?auto_756637 ?auto_756648 ) ) ( not ( = ?auto_756637 ?auto_756649 ) ) ( not ( = ?auto_756637 ?auto_756650 ) ) ( not ( = ?auto_756637 ?auto_756651 ) ) ( not ( = ?auto_756637 ?auto_756652 ) ) ( not ( = ?auto_756638 ?auto_756639 ) ) ( not ( = ?auto_756638 ?auto_756640 ) ) ( not ( = ?auto_756638 ?auto_756641 ) ) ( not ( = ?auto_756638 ?auto_756642 ) ) ( not ( = ?auto_756638 ?auto_756643 ) ) ( not ( = ?auto_756638 ?auto_756644 ) ) ( not ( = ?auto_756638 ?auto_756645 ) ) ( not ( = ?auto_756638 ?auto_756646 ) ) ( not ( = ?auto_756638 ?auto_756647 ) ) ( not ( = ?auto_756638 ?auto_756648 ) ) ( not ( = ?auto_756638 ?auto_756649 ) ) ( not ( = ?auto_756638 ?auto_756650 ) ) ( not ( = ?auto_756638 ?auto_756651 ) ) ( not ( = ?auto_756638 ?auto_756652 ) ) ( not ( = ?auto_756639 ?auto_756640 ) ) ( not ( = ?auto_756639 ?auto_756641 ) ) ( not ( = ?auto_756639 ?auto_756642 ) ) ( not ( = ?auto_756639 ?auto_756643 ) ) ( not ( = ?auto_756639 ?auto_756644 ) ) ( not ( = ?auto_756639 ?auto_756645 ) ) ( not ( = ?auto_756639 ?auto_756646 ) ) ( not ( = ?auto_756639 ?auto_756647 ) ) ( not ( = ?auto_756639 ?auto_756648 ) ) ( not ( = ?auto_756639 ?auto_756649 ) ) ( not ( = ?auto_756639 ?auto_756650 ) ) ( not ( = ?auto_756639 ?auto_756651 ) ) ( not ( = ?auto_756639 ?auto_756652 ) ) ( not ( = ?auto_756640 ?auto_756641 ) ) ( not ( = ?auto_756640 ?auto_756642 ) ) ( not ( = ?auto_756640 ?auto_756643 ) ) ( not ( = ?auto_756640 ?auto_756644 ) ) ( not ( = ?auto_756640 ?auto_756645 ) ) ( not ( = ?auto_756640 ?auto_756646 ) ) ( not ( = ?auto_756640 ?auto_756647 ) ) ( not ( = ?auto_756640 ?auto_756648 ) ) ( not ( = ?auto_756640 ?auto_756649 ) ) ( not ( = ?auto_756640 ?auto_756650 ) ) ( not ( = ?auto_756640 ?auto_756651 ) ) ( not ( = ?auto_756640 ?auto_756652 ) ) ( not ( = ?auto_756641 ?auto_756642 ) ) ( not ( = ?auto_756641 ?auto_756643 ) ) ( not ( = ?auto_756641 ?auto_756644 ) ) ( not ( = ?auto_756641 ?auto_756645 ) ) ( not ( = ?auto_756641 ?auto_756646 ) ) ( not ( = ?auto_756641 ?auto_756647 ) ) ( not ( = ?auto_756641 ?auto_756648 ) ) ( not ( = ?auto_756641 ?auto_756649 ) ) ( not ( = ?auto_756641 ?auto_756650 ) ) ( not ( = ?auto_756641 ?auto_756651 ) ) ( not ( = ?auto_756641 ?auto_756652 ) ) ( not ( = ?auto_756642 ?auto_756643 ) ) ( not ( = ?auto_756642 ?auto_756644 ) ) ( not ( = ?auto_756642 ?auto_756645 ) ) ( not ( = ?auto_756642 ?auto_756646 ) ) ( not ( = ?auto_756642 ?auto_756647 ) ) ( not ( = ?auto_756642 ?auto_756648 ) ) ( not ( = ?auto_756642 ?auto_756649 ) ) ( not ( = ?auto_756642 ?auto_756650 ) ) ( not ( = ?auto_756642 ?auto_756651 ) ) ( not ( = ?auto_756642 ?auto_756652 ) ) ( not ( = ?auto_756643 ?auto_756644 ) ) ( not ( = ?auto_756643 ?auto_756645 ) ) ( not ( = ?auto_756643 ?auto_756646 ) ) ( not ( = ?auto_756643 ?auto_756647 ) ) ( not ( = ?auto_756643 ?auto_756648 ) ) ( not ( = ?auto_756643 ?auto_756649 ) ) ( not ( = ?auto_756643 ?auto_756650 ) ) ( not ( = ?auto_756643 ?auto_756651 ) ) ( not ( = ?auto_756643 ?auto_756652 ) ) ( not ( = ?auto_756644 ?auto_756645 ) ) ( not ( = ?auto_756644 ?auto_756646 ) ) ( not ( = ?auto_756644 ?auto_756647 ) ) ( not ( = ?auto_756644 ?auto_756648 ) ) ( not ( = ?auto_756644 ?auto_756649 ) ) ( not ( = ?auto_756644 ?auto_756650 ) ) ( not ( = ?auto_756644 ?auto_756651 ) ) ( not ( = ?auto_756644 ?auto_756652 ) ) ( not ( = ?auto_756645 ?auto_756646 ) ) ( not ( = ?auto_756645 ?auto_756647 ) ) ( not ( = ?auto_756645 ?auto_756648 ) ) ( not ( = ?auto_756645 ?auto_756649 ) ) ( not ( = ?auto_756645 ?auto_756650 ) ) ( not ( = ?auto_756645 ?auto_756651 ) ) ( not ( = ?auto_756645 ?auto_756652 ) ) ( not ( = ?auto_756646 ?auto_756647 ) ) ( not ( = ?auto_756646 ?auto_756648 ) ) ( not ( = ?auto_756646 ?auto_756649 ) ) ( not ( = ?auto_756646 ?auto_756650 ) ) ( not ( = ?auto_756646 ?auto_756651 ) ) ( not ( = ?auto_756646 ?auto_756652 ) ) ( not ( = ?auto_756647 ?auto_756648 ) ) ( not ( = ?auto_756647 ?auto_756649 ) ) ( not ( = ?auto_756647 ?auto_756650 ) ) ( not ( = ?auto_756647 ?auto_756651 ) ) ( not ( = ?auto_756647 ?auto_756652 ) ) ( not ( = ?auto_756648 ?auto_756649 ) ) ( not ( = ?auto_756648 ?auto_756650 ) ) ( not ( = ?auto_756648 ?auto_756651 ) ) ( not ( = ?auto_756648 ?auto_756652 ) ) ( not ( = ?auto_756649 ?auto_756650 ) ) ( not ( = ?auto_756649 ?auto_756651 ) ) ( not ( = ?auto_756649 ?auto_756652 ) ) ( not ( = ?auto_756650 ?auto_756651 ) ) ( not ( = ?auto_756650 ?auto_756652 ) ) ( not ( = ?auto_756651 ?auto_756652 ) ) ( ON ?auto_756651 ?auto_756652 ) ( ON ?auto_756650 ?auto_756651 ) ( ON ?auto_756649 ?auto_756650 ) ( ON ?auto_756648 ?auto_756649 ) ( ON ?auto_756647 ?auto_756648 ) ( ON ?auto_756646 ?auto_756647 ) ( ON ?auto_756645 ?auto_756646 ) ( ON ?auto_756644 ?auto_756645 ) ( CLEAR ?auto_756642 ) ( ON ?auto_756643 ?auto_756644 ) ( CLEAR ?auto_756643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_756635 ?auto_756636 ?auto_756637 ?auto_756638 ?auto_756639 ?auto_756640 ?auto_756641 ?auto_756642 ?auto_756643 )
      ( MAKE-18PILE ?auto_756635 ?auto_756636 ?auto_756637 ?auto_756638 ?auto_756639 ?auto_756640 ?auto_756641 ?auto_756642 ?auto_756643 ?auto_756644 ?auto_756645 ?auto_756646 ?auto_756647 ?auto_756648 ?auto_756649 ?auto_756650 ?auto_756651 ?auto_756652 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756671 - BLOCK
      ?auto_756672 - BLOCK
      ?auto_756673 - BLOCK
      ?auto_756674 - BLOCK
      ?auto_756675 - BLOCK
      ?auto_756676 - BLOCK
      ?auto_756677 - BLOCK
      ?auto_756678 - BLOCK
      ?auto_756679 - BLOCK
      ?auto_756680 - BLOCK
      ?auto_756681 - BLOCK
      ?auto_756682 - BLOCK
      ?auto_756683 - BLOCK
      ?auto_756684 - BLOCK
      ?auto_756685 - BLOCK
      ?auto_756686 - BLOCK
      ?auto_756687 - BLOCK
      ?auto_756688 - BLOCK
    )
    :vars
    (
      ?auto_756689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756688 ?auto_756689 ) ( ON-TABLE ?auto_756671 ) ( ON ?auto_756672 ?auto_756671 ) ( ON ?auto_756673 ?auto_756672 ) ( ON ?auto_756674 ?auto_756673 ) ( ON ?auto_756675 ?auto_756674 ) ( ON ?auto_756676 ?auto_756675 ) ( ON ?auto_756677 ?auto_756676 ) ( not ( = ?auto_756671 ?auto_756672 ) ) ( not ( = ?auto_756671 ?auto_756673 ) ) ( not ( = ?auto_756671 ?auto_756674 ) ) ( not ( = ?auto_756671 ?auto_756675 ) ) ( not ( = ?auto_756671 ?auto_756676 ) ) ( not ( = ?auto_756671 ?auto_756677 ) ) ( not ( = ?auto_756671 ?auto_756678 ) ) ( not ( = ?auto_756671 ?auto_756679 ) ) ( not ( = ?auto_756671 ?auto_756680 ) ) ( not ( = ?auto_756671 ?auto_756681 ) ) ( not ( = ?auto_756671 ?auto_756682 ) ) ( not ( = ?auto_756671 ?auto_756683 ) ) ( not ( = ?auto_756671 ?auto_756684 ) ) ( not ( = ?auto_756671 ?auto_756685 ) ) ( not ( = ?auto_756671 ?auto_756686 ) ) ( not ( = ?auto_756671 ?auto_756687 ) ) ( not ( = ?auto_756671 ?auto_756688 ) ) ( not ( = ?auto_756671 ?auto_756689 ) ) ( not ( = ?auto_756672 ?auto_756673 ) ) ( not ( = ?auto_756672 ?auto_756674 ) ) ( not ( = ?auto_756672 ?auto_756675 ) ) ( not ( = ?auto_756672 ?auto_756676 ) ) ( not ( = ?auto_756672 ?auto_756677 ) ) ( not ( = ?auto_756672 ?auto_756678 ) ) ( not ( = ?auto_756672 ?auto_756679 ) ) ( not ( = ?auto_756672 ?auto_756680 ) ) ( not ( = ?auto_756672 ?auto_756681 ) ) ( not ( = ?auto_756672 ?auto_756682 ) ) ( not ( = ?auto_756672 ?auto_756683 ) ) ( not ( = ?auto_756672 ?auto_756684 ) ) ( not ( = ?auto_756672 ?auto_756685 ) ) ( not ( = ?auto_756672 ?auto_756686 ) ) ( not ( = ?auto_756672 ?auto_756687 ) ) ( not ( = ?auto_756672 ?auto_756688 ) ) ( not ( = ?auto_756672 ?auto_756689 ) ) ( not ( = ?auto_756673 ?auto_756674 ) ) ( not ( = ?auto_756673 ?auto_756675 ) ) ( not ( = ?auto_756673 ?auto_756676 ) ) ( not ( = ?auto_756673 ?auto_756677 ) ) ( not ( = ?auto_756673 ?auto_756678 ) ) ( not ( = ?auto_756673 ?auto_756679 ) ) ( not ( = ?auto_756673 ?auto_756680 ) ) ( not ( = ?auto_756673 ?auto_756681 ) ) ( not ( = ?auto_756673 ?auto_756682 ) ) ( not ( = ?auto_756673 ?auto_756683 ) ) ( not ( = ?auto_756673 ?auto_756684 ) ) ( not ( = ?auto_756673 ?auto_756685 ) ) ( not ( = ?auto_756673 ?auto_756686 ) ) ( not ( = ?auto_756673 ?auto_756687 ) ) ( not ( = ?auto_756673 ?auto_756688 ) ) ( not ( = ?auto_756673 ?auto_756689 ) ) ( not ( = ?auto_756674 ?auto_756675 ) ) ( not ( = ?auto_756674 ?auto_756676 ) ) ( not ( = ?auto_756674 ?auto_756677 ) ) ( not ( = ?auto_756674 ?auto_756678 ) ) ( not ( = ?auto_756674 ?auto_756679 ) ) ( not ( = ?auto_756674 ?auto_756680 ) ) ( not ( = ?auto_756674 ?auto_756681 ) ) ( not ( = ?auto_756674 ?auto_756682 ) ) ( not ( = ?auto_756674 ?auto_756683 ) ) ( not ( = ?auto_756674 ?auto_756684 ) ) ( not ( = ?auto_756674 ?auto_756685 ) ) ( not ( = ?auto_756674 ?auto_756686 ) ) ( not ( = ?auto_756674 ?auto_756687 ) ) ( not ( = ?auto_756674 ?auto_756688 ) ) ( not ( = ?auto_756674 ?auto_756689 ) ) ( not ( = ?auto_756675 ?auto_756676 ) ) ( not ( = ?auto_756675 ?auto_756677 ) ) ( not ( = ?auto_756675 ?auto_756678 ) ) ( not ( = ?auto_756675 ?auto_756679 ) ) ( not ( = ?auto_756675 ?auto_756680 ) ) ( not ( = ?auto_756675 ?auto_756681 ) ) ( not ( = ?auto_756675 ?auto_756682 ) ) ( not ( = ?auto_756675 ?auto_756683 ) ) ( not ( = ?auto_756675 ?auto_756684 ) ) ( not ( = ?auto_756675 ?auto_756685 ) ) ( not ( = ?auto_756675 ?auto_756686 ) ) ( not ( = ?auto_756675 ?auto_756687 ) ) ( not ( = ?auto_756675 ?auto_756688 ) ) ( not ( = ?auto_756675 ?auto_756689 ) ) ( not ( = ?auto_756676 ?auto_756677 ) ) ( not ( = ?auto_756676 ?auto_756678 ) ) ( not ( = ?auto_756676 ?auto_756679 ) ) ( not ( = ?auto_756676 ?auto_756680 ) ) ( not ( = ?auto_756676 ?auto_756681 ) ) ( not ( = ?auto_756676 ?auto_756682 ) ) ( not ( = ?auto_756676 ?auto_756683 ) ) ( not ( = ?auto_756676 ?auto_756684 ) ) ( not ( = ?auto_756676 ?auto_756685 ) ) ( not ( = ?auto_756676 ?auto_756686 ) ) ( not ( = ?auto_756676 ?auto_756687 ) ) ( not ( = ?auto_756676 ?auto_756688 ) ) ( not ( = ?auto_756676 ?auto_756689 ) ) ( not ( = ?auto_756677 ?auto_756678 ) ) ( not ( = ?auto_756677 ?auto_756679 ) ) ( not ( = ?auto_756677 ?auto_756680 ) ) ( not ( = ?auto_756677 ?auto_756681 ) ) ( not ( = ?auto_756677 ?auto_756682 ) ) ( not ( = ?auto_756677 ?auto_756683 ) ) ( not ( = ?auto_756677 ?auto_756684 ) ) ( not ( = ?auto_756677 ?auto_756685 ) ) ( not ( = ?auto_756677 ?auto_756686 ) ) ( not ( = ?auto_756677 ?auto_756687 ) ) ( not ( = ?auto_756677 ?auto_756688 ) ) ( not ( = ?auto_756677 ?auto_756689 ) ) ( not ( = ?auto_756678 ?auto_756679 ) ) ( not ( = ?auto_756678 ?auto_756680 ) ) ( not ( = ?auto_756678 ?auto_756681 ) ) ( not ( = ?auto_756678 ?auto_756682 ) ) ( not ( = ?auto_756678 ?auto_756683 ) ) ( not ( = ?auto_756678 ?auto_756684 ) ) ( not ( = ?auto_756678 ?auto_756685 ) ) ( not ( = ?auto_756678 ?auto_756686 ) ) ( not ( = ?auto_756678 ?auto_756687 ) ) ( not ( = ?auto_756678 ?auto_756688 ) ) ( not ( = ?auto_756678 ?auto_756689 ) ) ( not ( = ?auto_756679 ?auto_756680 ) ) ( not ( = ?auto_756679 ?auto_756681 ) ) ( not ( = ?auto_756679 ?auto_756682 ) ) ( not ( = ?auto_756679 ?auto_756683 ) ) ( not ( = ?auto_756679 ?auto_756684 ) ) ( not ( = ?auto_756679 ?auto_756685 ) ) ( not ( = ?auto_756679 ?auto_756686 ) ) ( not ( = ?auto_756679 ?auto_756687 ) ) ( not ( = ?auto_756679 ?auto_756688 ) ) ( not ( = ?auto_756679 ?auto_756689 ) ) ( not ( = ?auto_756680 ?auto_756681 ) ) ( not ( = ?auto_756680 ?auto_756682 ) ) ( not ( = ?auto_756680 ?auto_756683 ) ) ( not ( = ?auto_756680 ?auto_756684 ) ) ( not ( = ?auto_756680 ?auto_756685 ) ) ( not ( = ?auto_756680 ?auto_756686 ) ) ( not ( = ?auto_756680 ?auto_756687 ) ) ( not ( = ?auto_756680 ?auto_756688 ) ) ( not ( = ?auto_756680 ?auto_756689 ) ) ( not ( = ?auto_756681 ?auto_756682 ) ) ( not ( = ?auto_756681 ?auto_756683 ) ) ( not ( = ?auto_756681 ?auto_756684 ) ) ( not ( = ?auto_756681 ?auto_756685 ) ) ( not ( = ?auto_756681 ?auto_756686 ) ) ( not ( = ?auto_756681 ?auto_756687 ) ) ( not ( = ?auto_756681 ?auto_756688 ) ) ( not ( = ?auto_756681 ?auto_756689 ) ) ( not ( = ?auto_756682 ?auto_756683 ) ) ( not ( = ?auto_756682 ?auto_756684 ) ) ( not ( = ?auto_756682 ?auto_756685 ) ) ( not ( = ?auto_756682 ?auto_756686 ) ) ( not ( = ?auto_756682 ?auto_756687 ) ) ( not ( = ?auto_756682 ?auto_756688 ) ) ( not ( = ?auto_756682 ?auto_756689 ) ) ( not ( = ?auto_756683 ?auto_756684 ) ) ( not ( = ?auto_756683 ?auto_756685 ) ) ( not ( = ?auto_756683 ?auto_756686 ) ) ( not ( = ?auto_756683 ?auto_756687 ) ) ( not ( = ?auto_756683 ?auto_756688 ) ) ( not ( = ?auto_756683 ?auto_756689 ) ) ( not ( = ?auto_756684 ?auto_756685 ) ) ( not ( = ?auto_756684 ?auto_756686 ) ) ( not ( = ?auto_756684 ?auto_756687 ) ) ( not ( = ?auto_756684 ?auto_756688 ) ) ( not ( = ?auto_756684 ?auto_756689 ) ) ( not ( = ?auto_756685 ?auto_756686 ) ) ( not ( = ?auto_756685 ?auto_756687 ) ) ( not ( = ?auto_756685 ?auto_756688 ) ) ( not ( = ?auto_756685 ?auto_756689 ) ) ( not ( = ?auto_756686 ?auto_756687 ) ) ( not ( = ?auto_756686 ?auto_756688 ) ) ( not ( = ?auto_756686 ?auto_756689 ) ) ( not ( = ?auto_756687 ?auto_756688 ) ) ( not ( = ?auto_756687 ?auto_756689 ) ) ( not ( = ?auto_756688 ?auto_756689 ) ) ( ON ?auto_756687 ?auto_756688 ) ( ON ?auto_756686 ?auto_756687 ) ( ON ?auto_756685 ?auto_756686 ) ( ON ?auto_756684 ?auto_756685 ) ( ON ?auto_756683 ?auto_756684 ) ( ON ?auto_756682 ?auto_756683 ) ( ON ?auto_756681 ?auto_756682 ) ( ON ?auto_756680 ?auto_756681 ) ( ON ?auto_756679 ?auto_756680 ) ( CLEAR ?auto_756677 ) ( ON ?auto_756678 ?auto_756679 ) ( CLEAR ?auto_756678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_756671 ?auto_756672 ?auto_756673 ?auto_756674 ?auto_756675 ?auto_756676 ?auto_756677 ?auto_756678 )
      ( MAKE-18PILE ?auto_756671 ?auto_756672 ?auto_756673 ?auto_756674 ?auto_756675 ?auto_756676 ?auto_756677 ?auto_756678 ?auto_756679 ?auto_756680 ?auto_756681 ?auto_756682 ?auto_756683 ?auto_756684 ?auto_756685 ?auto_756686 ?auto_756687 ?auto_756688 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756708 - BLOCK
      ?auto_756709 - BLOCK
      ?auto_756710 - BLOCK
      ?auto_756711 - BLOCK
      ?auto_756712 - BLOCK
      ?auto_756713 - BLOCK
      ?auto_756714 - BLOCK
      ?auto_756715 - BLOCK
      ?auto_756716 - BLOCK
      ?auto_756717 - BLOCK
      ?auto_756718 - BLOCK
      ?auto_756719 - BLOCK
      ?auto_756720 - BLOCK
      ?auto_756721 - BLOCK
      ?auto_756722 - BLOCK
      ?auto_756723 - BLOCK
      ?auto_756724 - BLOCK
      ?auto_756725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756725 ) ( ON-TABLE ?auto_756708 ) ( ON ?auto_756709 ?auto_756708 ) ( ON ?auto_756710 ?auto_756709 ) ( ON ?auto_756711 ?auto_756710 ) ( ON ?auto_756712 ?auto_756711 ) ( ON ?auto_756713 ?auto_756712 ) ( ON ?auto_756714 ?auto_756713 ) ( not ( = ?auto_756708 ?auto_756709 ) ) ( not ( = ?auto_756708 ?auto_756710 ) ) ( not ( = ?auto_756708 ?auto_756711 ) ) ( not ( = ?auto_756708 ?auto_756712 ) ) ( not ( = ?auto_756708 ?auto_756713 ) ) ( not ( = ?auto_756708 ?auto_756714 ) ) ( not ( = ?auto_756708 ?auto_756715 ) ) ( not ( = ?auto_756708 ?auto_756716 ) ) ( not ( = ?auto_756708 ?auto_756717 ) ) ( not ( = ?auto_756708 ?auto_756718 ) ) ( not ( = ?auto_756708 ?auto_756719 ) ) ( not ( = ?auto_756708 ?auto_756720 ) ) ( not ( = ?auto_756708 ?auto_756721 ) ) ( not ( = ?auto_756708 ?auto_756722 ) ) ( not ( = ?auto_756708 ?auto_756723 ) ) ( not ( = ?auto_756708 ?auto_756724 ) ) ( not ( = ?auto_756708 ?auto_756725 ) ) ( not ( = ?auto_756709 ?auto_756710 ) ) ( not ( = ?auto_756709 ?auto_756711 ) ) ( not ( = ?auto_756709 ?auto_756712 ) ) ( not ( = ?auto_756709 ?auto_756713 ) ) ( not ( = ?auto_756709 ?auto_756714 ) ) ( not ( = ?auto_756709 ?auto_756715 ) ) ( not ( = ?auto_756709 ?auto_756716 ) ) ( not ( = ?auto_756709 ?auto_756717 ) ) ( not ( = ?auto_756709 ?auto_756718 ) ) ( not ( = ?auto_756709 ?auto_756719 ) ) ( not ( = ?auto_756709 ?auto_756720 ) ) ( not ( = ?auto_756709 ?auto_756721 ) ) ( not ( = ?auto_756709 ?auto_756722 ) ) ( not ( = ?auto_756709 ?auto_756723 ) ) ( not ( = ?auto_756709 ?auto_756724 ) ) ( not ( = ?auto_756709 ?auto_756725 ) ) ( not ( = ?auto_756710 ?auto_756711 ) ) ( not ( = ?auto_756710 ?auto_756712 ) ) ( not ( = ?auto_756710 ?auto_756713 ) ) ( not ( = ?auto_756710 ?auto_756714 ) ) ( not ( = ?auto_756710 ?auto_756715 ) ) ( not ( = ?auto_756710 ?auto_756716 ) ) ( not ( = ?auto_756710 ?auto_756717 ) ) ( not ( = ?auto_756710 ?auto_756718 ) ) ( not ( = ?auto_756710 ?auto_756719 ) ) ( not ( = ?auto_756710 ?auto_756720 ) ) ( not ( = ?auto_756710 ?auto_756721 ) ) ( not ( = ?auto_756710 ?auto_756722 ) ) ( not ( = ?auto_756710 ?auto_756723 ) ) ( not ( = ?auto_756710 ?auto_756724 ) ) ( not ( = ?auto_756710 ?auto_756725 ) ) ( not ( = ?auto_756711 ?auto_756712 ) ) ( not ( = ?auto_756711 ?auto_756713 ) ) ( not ( = ?auto_756711 ?auto_756714 ) ) ( not ( = ?auto_756711 ?auto_756715 ) ) ( not ( = ?auto_756711 ?auto_756716 ) ) ( not ( = ?auto_756711 ?auto_756717 ) ) ( not ( = ?auto_756711 ?auto_756718 ) ) ( not ( = ?auto_756711 ?auto_756719 ) ) ( not ( = ?auto_756711 ?auto_756720 ) ) ( not ( = ?auto_756711 ?auto_756721 ) ) ( not ( = ?auto_756711 ?auto_756722 ) ) ( not ( = ?auto_756711 ?auto_756723 ) ) ( not ( = ?auto_756711 ?auto_756724 ) ) ( not ( = ?auto_756711 ?auto_756725 ) ) ( not ( = ?auto_756712 ?auto_756713 ) ) ( not ( = ?auto_756712 ?auto_756714 ) ) ( not ( = ?auto_756712 ?auto_756715 ) ) ( not ( = ?auto_756712 ?auto_756716 ) ) ( not ( = ?auto_756712 ?auto_756717 ) ) ( not ( = ?auto_756712 ?auto_756718 ) ) ( not ( = ?auto_756712 ?auto_756719 ) ) ( not ( = ?auto_756712 ?auto_756720 ) ) ( not ( = ?auto_756712 ?auto_756721 ) ) ( not ( = ?auto_756712 ?auto_756722 ) ) ( not ( = ?auto_756712 ?auto_756723 ) ) ( not ( = ?auto_756712 ?auto_756724 ) ) ( not ( = ?auto_756712 ?auto_756725 ) ) ( not ( = ?auto_756713 ?auto_756714 ) ) ( not ( = ?auto_756713 ?auto_756715 ) ) ( not ( = ?auto_756713 ?auto_756716 ) ) ( not ( = ?auto_756713 ?auto_756717 ) ) ( not ( = ?auto_756713 ?auto_756718 ) ) ( not ( = ?auto_756713 ?auto_756719 ) ) ( not ( = ?auto_756713 ?auto_756720 ) ) ( not ( = ?auto_756713 ?auto_756721 ) ) ( not ( = ?auto_756713 ?auto_756722 ) ) ( not ( = ?auto_756713 ?auto_756723 ) ) ( not ( = ?auto_756713 ?auto_756724 ) ) ( not ( = ?auto_756713 ?auto_756725 ) ) ( not ( = ?auto_756714 ?auto_756715 ) ) ( not ( = ?auto_756714 ?auto_756716 ) ) ( not ( = ?auto_756714 ?auto_756717 ) ) ( not ( = ?auto_756714 ?auto_756718 ) ) ( not ( = ?auto_756714 ?auto_756719 ) ) ( not ( = ?auto_756714 ?auto_756720 ) ) ( not ( = ?auto_756714 ?auto_756721 ) ) ( not ( = ?auto_756714 ?auto_756722 ) ) ( not ( = ?auto_756714 ?auto_756723 ) ) ( not ( = ?auto_756714 ?auto_756724 ) ) ( not ( = ?auto_756714 ?auto_756725 ) ) ( not ( = ?auto_756715 ?auto_756716 ) ) ( not ( = ?auto_756715 ?auto_756717 ) ) ( not ( = ?auto_756715 ?auto_756718 ) ) ( not ( = ?auto_756715 ?auto_756719 ) ) ( not ( = ?auto_756715 ?auto_756720 ) ) ( not ( = ?auto_756715 ?auto_756721 ) ) ( not ( = ?auto_756715 ?auto_756722 ) ) ( not ( = ?auto_756715 ?auto_756723 ) ) ( not ( = ?auto_756715 ?auto_756724 ) ) ( not ( = ?auto_756715 ?auto_756725 ) ) ( not ( = ?auto_756716 ?auto_756717 ) ) ( not ( = ?auto_756716 ?auto_756718 ) ) ( not ( = ?auto_756716 ?auto_756719 ) ) ( not ( = ?auto_756716 ?auto_756720 ) ) ( not ( = ?auto_756716 ?auto_756721 ) ) ( not ( = ?auto_756716 ?auto_756722 ) ) ( not ( = ?auto_756716 ?auto_756723 ) ) ( not ( = ?auto_756716 ?auto_756724 ) ) ( not ( = ?auto_756716 ?auto_756725 ) ) ( not ( = ?auto_756717 ?auto_756718 ) ) ( not ( = ?auto_756717 ?auto_756719 ) ) ( not ( = ?auto_756717 ?auto_756720 ) ) ( not ( = ?auto_756717 ?auto_756721 ) ) ( not ( = ?auto_756717 ?auto_756722 ) ) ( not ( = ?auto_756717 ?auto_756723 ) ) ( not ( = ?auto_756717 ?auto_756724 ) ) ( not ( = ?auto_756717 ?auto_756725 ) ) ( not ( = ?auto_756718 ?auto_756719 ) ) ( not ( = ?auto_756718 ?auto_756720 ) ) ( not ( = ?auto_756718 ?auto_756721 ) ) ( not ( = ?auto_756718 ?auto_756722 ) ) ( not ( = ?auto_756718 ?auto_756723 ) ) ( not ( = ?auto_756718 ?auto_756724 ) ) ( not ( = ?auto_756718 ?auto_756725 ) ) ( not ( = ?auto_756719 ?auto_756720 ) ) ( not ( = ?auto_756719 ?auto_756721 ) ) ( not ( = ?auto_756719 ?auto_756722 ) ) ( not ( = ?auto_756719 ?auto_756723 ) ) ( not ( = ?auto_756719 ?auto_756724 ) ) ( not ( = ?auto_756719 ?auto_756725 ) ) ( not ( = ?auto_756720 ?auto_756721 ) ) ( not ( = ?auto_756720 ?auto_756722 ) ) ( not ( = ?auto_756720 ?auto_756723 ) ) ( not ( = ?auto_756720 ?auto_756724 ) ) ( not ( = ?auto_756720 ?auto_756725 ) ) ( not ( = ?auto_756721 ?auto_756722 ) ) ( not ( = ?auto_756721 ?auto_756723 ) ) ( not ( = ?auto_756721 ?auto_756724 ) ) ( not ( = ?auto_756721 ?auto_756725 ) ) ( not ( = ?auto_756722 ?auto_756723 ) ) ( not ( = ?auto_756722 ?auto_756724 ) ) ( not ( = ?auto_756722 ?auto_756725 ) ) ( not ( = ?auto_756723 ?auto_756724 ) ) ( not ( = ?auto_756723 ?auto_756725 ) ) ( not ( = ?auto_756724 ?auto_756725 ) ) ( ON ?auto_756724 ?auto_756725 ) ( ON ?auto_756723 ?auto_756724 ) ( ON ?auto_756722 ?auto_756723 ) ( ON ?auto_756721 ?auto_756722 ) ( ON ?auto_756720 ?auto_756721 ) ( ON ?auto_756719 ?auto_756720 ) ( ON ?auto_756718 ?auto_756719 ) ( ON ?auto_756717 ?auto_756718 ) ( ON ?auto_756716 ?auto_756717 ) ( CLEAR ?auto_756714 ) ( ON ?auto_756715 ?auto_756716 ) ( CLEAR ?auto_756715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_756708 ?auto_756709 ?auto_756710 ?auto_756711 ?auto_756712 ?auto_756713 ?auto_756714 ?auto_756715 )
      ( MAKE-18PILE ?auto_756708 ?auto_756709 ?auto_756710 ?auto_756711 ?auto_756712 ?auto_756713 ?auto_756714 ?auto_756715 ?auto_756716 ?auto_756717 ?auto_756718 ?auto_756719 ?auto_756720 ?auto_756721 ?auto_756722 ?auto_756723 ?auto_756724 ?auto_756725 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756744 - BLOCK
      ?auto_756745 - BLOCK
      ?auto_756746 - BLOCK
      ?auto_756747 - BLOCK
      ?auto_756748 - BLOCK
      ?auto_756749 - BLOCK
      ?auto_756750 - BLOCK
      ?auto_756751 - BLOCK
      ?auto_756752 - BLOCK
      ?auto_756753 - BLOCK
      ?auto_756754 - BLOCK
      ?auto_756755 - BLOCK
      ?auto_756756 - BLOCK
      ?auto_756757 - BLOCK
      ?auto_756758 - BLOCK
      ?auto_756759 - BLOCK
      ?auto_756760 - BLOCK
      ?auto_756761 - BLOCK
    )
    :vars
    (
      ?auto_756762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756761 ?auto_756762 ) ( ON-TABLE ?auto_756744 ) ( ON ?auto_756745 ?auto_756744 ) ( ON ?auto_756746 ?auto_756745 ) ( ON ?auto_756747 ?auto_756746 ) ( ON ?auto_756748 ?auto_756747 ) ( ON ?auto_756749 ?auto_756748 ) ( not ( = ?auto_756744 ?auto_756745 ) ) ( not ( = ?auto_756744 ?auto_756746 ) ) ( not ( = ?auto_756744 ?auto_756747 ) ) ( not ( = ?auto_756744 ?auto_756748 ) ) ( not ( = ?auto_756744 ?auto_756749 ) ) ( not ( = ?auto_756744 ?auto_756750 ) ) ( not ( = ?auto_756744 ?auto_756751 ) ) ( not ( = ?auto_756744 ?auto_756752 ) ) ( not ( = ?auto_756744 ?auto_756753 ) ) ( not ( = ?auto_756744 ?auto_756754 ) ) ( not ( = ?auto_756744 ?auto_756755 ) ) ( not ( = ?auto_756744 ?auto_756756 ) ) ( not ( = ?auto_756744 ?auto_756757 ) ) ( not ( = ?auto_756744 ?auto_756758 ) ) ( not ( = ?auto_756744 ?auto_756759 ) ) ( not ( = ?auto_756744 ?auto_756760 ) ) ( not ( = ?auto_756744 ?auto_756761 ) ) ( not ( = ?auto_756744 ?auto_756762 ) ) ( not ( = ?auto_756745 ?auto_756746 ) ) ( not ( = ?auto_756745 ?auto_756747 ) ) ( not ( = ?auto_756745 ?auto_756748 ) ) ( not ( = ?auto_756745 ?auto_756749 ) ) ( not ( = ?auto_756745 ?auto_756750 ) ) ( not ( = ?auto_756745 ?auto_756751 ) ) ( not ( = ?auto_756745 ?auto_756752 ) ) ( not ( = ?auto_756745 ?auto_756753 ) ) ( not ( = ?auto_756745 ?auto_756754 ) ) ( not ( = ?auto_756745 ?auto_756755 ) ) ( not ( = ?auto_756745 ?auto_756756 ) ) ( not ( = ?auto_756745 ?auto_756757 ) ) ( not ( = ?auto_756745 ?auto_756758 ) ) ( not ( = ?auto_756745 ?auto_756759 ) ) ( not ( = ?auto_756745 ?auto_756760 ) ) ( not ( = ?auto_756745 ?auto_756761 ) ) ( not ( = ?auto_756745 ?auto_756762 ) ) ( not ( = ?auto_756746 ?auto_756747 ) ) ( not ( = ?auto_756746 ?auto_756748 ) ) ( not ( = ?auto_756746 ?auto_756749 ) ) ( not ( = ?auto_756746 ?auto_756750 ) ) ( not ( = ?auto_756746 ?auto_756751 ) ) ( not ( = ?auto_756746 ?auto_756752 ) ) ( not ( = ?auto_756746 ?auto_756753 ) ) ( not ( = ?auto_756746 ?auto_756754 ) ) ( not ( = ?auto_756746 ?auto_756755 ) ) ( not ( = ?auto_756746 ?auto_756756 ) ) ( not ( = ?auto_756746 ?auto_756757 ) ) ( not ( = ?auto_756746 ?auto_756758 ) ) ( not ( = ?auto_756746 ?auto_756759 ) ) ( not ( = ?auto_756746 ?auto_756760 ) ) ( not ( = ?auto_756746 ?auto_756761 ) ) ( not ( = ?auto_756746 ?auto_756762 ) ) ( not ( = ?auto_756747 ?auto_756748 ) ) ( not ( = ?auto_756747 ?auto_756749 ) ) ( not ( = ?auto_756747 ?auto_756750 ) ) ( not ( = ?auto_756747 ?auto_756751 ) ) ( not ( = ?auto_756747 ?auto_756752 ) ) ( not ( = ?auto_756747 ?auto_756753 ) ) ( not ( = ?auto_756747 ?auto_756754 ) ) ( not ( = ?auto_756747 ?auto_756755 ) ) ( not ( = ?auto_756747 ?auto_756756 ) ) ( not ( = ?auto_756747 ?auto_756757 ) ) ( not ( = ?auto_756747 ?auto_756758 ) ) ( not ( = ?auto_756747 ?auto_756759 ) ) ( not ( = ?auto_756747 ?auto_756760 ) ) ( not ( = ?auto_756747 ?auto_756761 ) ) ( not ( = ?auto_756747 ?auto_756762 ) ) ( not ( = ?auto_756748 ?auto_756749 ) ) ( not ( = ?auto_756748 ?auto_756750 ) ) ( not ( = ?auto_756748 ?auto_756751 ) ) ( not ( = ?auto_756748 ?auto_756752 ) ) ( not ( = ?auto_756748 ?auto_756753 ) ) ( not ( = ?auto_756748 ?auto_756754 ) ) ( not ( = ?auto_756748 ?auto_756755 ) ) ( not ( = ?auto_756748 ?auto_756756 ) ) ( not ( = ?auto_756748 ?auto_756757 ) ) ( not ( = ?auto_756748 ?auto_756758 ) ) ( not ( = ?auto_756748 ?auto_756759 ) ) ( not ( = ?auto_756748 ?auto_756760 ) ) ( not ( = ?auto_756748 ?auto_756761 ) ) ( not ( = ?auto_756748 ?auto_756762 ) ) ( not ( = ?auto_756749 ?auto_756750 ) ) ( not ( = ?auto_756749 ?auto_756751 ) ) ( not ( = ?auto_756749 ?auto_756752 ) ) ( not ( = ?auto_756749 ?auto_756753 ) ) ( not ( = ?auto_756749 ?auto_756754 ) ) ( not ( = ?auto_756749 ?auto_756755 ) ) ( not ( = ?auto_756749 ?auto_756756 ) ) ( not ( = ?auto_756749 ?auto_756757 ) ) ( not ( = ?auto_756749 ?auto_756758 ) ) ( not ( = ?auto_756749 ?auto_756759 ) ) ( not ( = ?auto_756749 ?auto_756760 ) ) ( not ( = ?auto_756749 ?auto_756761 ) ) ( not ( = ?auto_756749 ?auto_756762 ) ) ( not ( = ?auto_756750 ?auto_756751 ) ) ( not ( = ?auto_756750 ?auto_756752 ) ) ( not ( = ?auto_756750 ?auto_756753 ) ) ( not ( = ?auto_756750 ?auto_756754 ) ) ( not ( = ?auto_756750 ?auto_756755 ) ) ( not ( = ?auto_756750 ?auto_756756 ) ) ( not ( = ?auto_756750 ?auto_756757 ) ) ( not ( = ?auto_756750 ?auto_756758 ) ) ( not ( = ?auto_756750 ?auto_756759 ) ) ( not ( = ?auto_756750 ?auto_756760 ) ) ( not ( = ?auto_756750 ?auto_756761 ) ) ( not ( = ?auto_756750 ?auto_756762 ) ) ( not ( = ?auto_756751 ?auto_756752 ) ) ( not ( = ?auto_756751 ?auto_756753 ) ) ( not ( = ?auto_756751 ?auto_756754 ) ) ( not ( = ?auto_756751 ?auto_756755 ) ) ( not ( = ?auto_756751 ?auto_756756 ) ) ( not ( = ?auto_756751 ?auto_756757 ) ) ( not ( = ?auto_756751 ?auto_756758 ) ) ( not ( = ?auto_756751 ?auto_756759 ) ) ( not ( = ?auto_756751 ?auto_756760 ) ) ( not ( = ?auto_756751 ?auto_756761 ) ) ( not ( = ?auto_756751 ?auto_756762 ) ) ( not ( = ?auto_756752 ?auto_756753 ) ) ( not ( = ?auto_756752 ?auto_756754 ) ) ( not ( = ?auto_756752 ?auto_756755 ) ) ( not ( = ?auto_756752 ?auto_756756 ) ) ( not ( = ?auto_756752 ?auto_756757 ) ) ( not ( = ?auto_756752 ?auto_756758 ) ) ( not ( = ?auto_756752 ?auto_756759 ) ) ( not ( = ?auto_756752 ?auto_756760 ) ) ( not ( = ?auto_756752 ?auto_756761 ) ) ( not ( = ?auto_756752 ?auto_756762 ) ) ( not ( = ?auto_756753 ?auto_756754 ) ) ( not ( = ?auto_756753 ?auto_756755 ) ) ( not ( = ?auto_756753 ?auto_756756 ) ) ( not ( = ?auto_756753 ?auto_756757 ) ) ( not ( = ?auto_756753 ?auto_756758 ) ) ( not ( = ?auto_756753 ?auto_756759 ) ) ( not ( = ?auto_756753 ?auto_756760 ) ) ( not ( = ?auto_756753 ?auto_756761 ) ) ( not ( = ?auto_756753 ?auto_756762 ) ) ( not ( = ?auto_756754 ?auto_756755 ) ) ( not ( = ?auto_756754 ?auto_756756 ) ) ( not ( = ?auto_756754 ?auto_756757 ) ) ( not ( = ?auto_756754 ?auto_756758 ) ) ( not ( = ?auto_756754 ?auto_756759 ) ) ( not ( = ?auto_756754 ?auto_756760 ) ) ( not ( = ?auto_756754 ?auto_756761 ) ) ( not ( = ?auto_756754 ?auto_756762 ) ) ( not ( = ?auto_756755 ?auto_756756 ) ) ( not ( = ?auto_756755 ?auto_756757 ) ) ( not ( = ?auto_756755 ?auto_756758 ) ) ( not ( = ?auto_756755 ?auto_756759 ) ) ( not ( = ?auto_756755 ?auto_756760 ) ) ( not ( = ?auto_756755 ?auto_756761 ) ) ( not ( = ?auto_756755 ?auto_756762 ) ) ( not ( = ?auto_756756 ?auto_756757 ) ) ( not ( = ?auto_756756 ?auto_756758 ) ) ( not ( = ?auto_756756 ?auto_756759 ) ) ( not ( = ?auto_756756 ?auto_756760 ) ) ( not ( = ?auto_756756 ?auto_756761 ) ) ( not ( = ?auto_756756 ?auto_756762 ) ) ( not ( = ?auto_756757 ?auto_756758 ) ) ( not ( = ?auto_756757 ?auto_756759 ) ) ( not ( = ?auto_756757 ?auto_756760 ) ) ( not ( = ?auto_756757 ?auto_756761 ) ) ( not ( = ?auto_756757 ?auto_756762 ) ) ( not ( = ?auto_756758 ?auto_756759 ) ) ( not ( = ?auto_756758 ?auto_756760 ) ) ( not ( = ?auto_756758 ?auto_756761 ) ) ( not ( = ?auto_756758 ?auto_756762 ) ) ( not ( = ?auto_756759 ?auto_756760 ) ) ( not ( = ?auto_756759 ?auto_756761 ) ) ( not ( = ?auto_756759 ?auto_756762 ) ) ( not ( = ?auto_756760 ?auto_756761 ) ) ( not ( = ?auto_756760 ?auto_756762 ) ) ( not ( = ?auto_756761 ?auto_756762 ) ) ( ON ?auto_756760 ?auto_756761 ) ( ON ?auto_756759 ?auto_756760 ) ( ON ?auto_756758 ?auto_756759 ) ( ON ?auto_756757 ?auto_756758 ) ( ON ?auto_756756 ?auto_756757 ) ( ON ?auto_756755 ?auto_756756 ) ( ON ?auto_756754 ?auto_756755 ) ( ON ?auto_756753 ?auto_756754 ) ( ON ?auto_756752 ?auto_756753 ) ( ON ?auto_756751 ?auto_756752 ) ( CLEAR ?auto_756749 ) ( ON ?auto_756750 ?auto_756751 ) ( CLEAR ?auto_756750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_756744 ?auto_756745 ?auto_756746 ?auto_756747 ?auto_756748 ?auto_756749 ?auto_756750 )
      ( MAKE-18PILE ?auto_756744 ?auto_756745 ?auto_756746 ?auto_756747 ?auto_756748 ?auto_756749 ?auto_756750 ?auto_756751 ?auto_756752 ?auto_756753 ?auto_756754 ?auto_756755 ?auto_756756 ?auto_756757 ?auto_756758 ?auto_756759 ?auto_756760 ?auto_756761 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756781 - BLOCK
      ?auto_756782 - BLOCK
      ?auto_756783 - BLOCK
      ?auto_756784 - BLOCK
      ?auto_756785 - BLOCK
      ?auto_756786 - BLOCK
      ?auto_756787 - BLOCK
      ?auto_756788 - BLOCK
      ?auto_756789 - BLOCK
      ?auto_756790 - BLOCK
      ?auto_756791 - BLOCK
      ?auto_756792 - BLOCK
      ?auto_756793 - BLOCK
      ?auto_756794 - BLOCK
      ?auto_756795 - BLOCK
      ?auto_756796 - BLOCK
      ?auto_756797 - BLOCK
      ?auto_756798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756798 ) ( ON-TABLE ?auto_756781 ) ( ON ?auto_756782 ?auto_756781 ) ( ON ?auto_756783 ?auto_756782 ) ( ON ?auto_756784 ?auto_756783 ) ( ON ?auto_756785 ?auto_756784 ) ( ON ?auto_756786 ?auto_756785 ) ( not ( = ?auto_756781 ?auto_756782 ) ) ( not ( = ?auto_756781 ?auto_756783 ) ) ( not ( = ?auto_756781 ?auto_756784 ) ) ( not ( = ?auto_756781 ?auto_756785 ) ) ( not ( = ?auto_756781 ?auto_756786 ) ) ( not ( = ?auto_756781 ?auto_756787 ) ) ( not ( = ?auto_756781 ?auto_756788 ) ) ( not ( = ?auto_756781 ?auto_756789 ) ) ( not ( = ?auto_756781 ?auto_756790 ) ) ( not ( = ?auto_756781 ?auto_756791 ) ) ( not ( = ?auto_756781 ?auto_756792 ) ) ( not ( = ?auto_756781 ?auto_756793 ) ) ( not ( = ?auto_756781 ?auto_756794 ) ) ( not ( = ?auto_756781 ?auto_756795 ) ) ( not ( = ?auto_756781 ?auto_756796 ) ) ( not ( = ?auto_756781 ?auto_756797 ) ) ( not ( = ?auto_756781 ?auto_756798 ) ) ( not ( = ?auto_756782 ?auto_756783 ) ) ( not ( = ?auto_756782 ?auto_756784 ) ) ( not ( = ?auto_756782 ?auto_756785 ) ) ( not ( = ?auto_756782 ?auto_756786 ) ) ( not ( = ?auto_756782 ?auto_756787 ) ) ( not ( = ?auto_756782 ?auto_756788 ) ) ( not ( = ?auto_756782 ?auto_756789 ) ) ( not ( = ?auto_756782 ?auto_756790 ) ) ( not ( = ?auto_756782 ?auto_756791 ) ) ( not ( = ?auto_756782 ?auto_756792 ) ) ( not ( = ?auto_756782 ?auto_756793 ) ) ( not ( = ?auto_756782 ?auto_756794 ) ) ( not ( = ?auto_756782 ?auto_756795 ) ) ( not ( = ?auto_756782 ?auto_756796 ) ) ( not ( = ?auto_756782 ?auto_756797 ) ) ( not ( = ?auto_756782 ?auto_756798 ) ) ( not ( = ?auto_756783 ?auto_756784 ) ) ( not ( = ?auto_756783 ?auto_756785 ) ) ( not ( = ?auto_756783 ?auto_756786 ) ) ( not ( = ?auto_756783 ?auto_756787 ) ) ( not ( = ?auto_756783 ?auto_756788 ) ) ( not ( = ?auto_756783 ?auto_756789 ) ) ( not ( = ?auto_756783 ?auto_756790 ) ) ( not ( = ?auto_756783 ?auto_756791 ) ) ( not ( = ?auto_756783 ?auto_756792 ) ) ( not ( = ?auto_756783 ?auto_756793 ) ) ( not ( = ?auto_756783 ?auto_756794 ) ) ( not ( = ?auto_756783 ?auto_756795 ) ) ( not ( = ?auto_756783 ?auto_756796 ) ) ( not ( = ?auto_756783 ?auto_756797 ) ) ( not ( = ?auto_756783 ?auto_756798 ) ) ( not ( = ?auto_756784 ?auto_756785 ) ) ( not ( = ?auto_756784 ?auto_756786 ) ) ( not ( = ?auto_756784 ?auto_756787 ) ) ( not ( = ?auto_756784 ?auto_756788 ) ) ( not ( = ?auto_756784 ?auto_756789 ) ) ( not ( = ?auto_756784 ?auto_756790 ) ) ( not ( = ?auto_756784 ?auto_756791 ) ) ( not ( = ?auto_756784 ?auto_756792 ) ) ( not ( = ?auto_756784 ?auto_756793 ) ) ( not ( = ?auto_756784 ?auto_756794 ) ) ( not ( = ?auto_756784 ?auto_756795 ) ) ( not ( = ?auto_756784 ?auto_756796 ) ) ( not ( = ?auto_756784 ?auto_756797 ) ) ( not ( = ?auto_756784 ?auto_756798 ) ) ( not ( = ?auto_756785 ?auto_756786 ) ) ( not ( = ?auto_756785 ?auto_756787 ) ) ( not ( = ?auto_756785 ?auto_756788 ) ) ( not ( = ?auto_756785 ?auto_756789 ) ) ( not ( = ?auto_756785 ?auto_756790 ) ) ( not ( = ?auto_756785 ?auto_756791 ) ) ( not ( = ?auto_756785 ?auto_756792 ) ) ( not ( = ?auto_756785 ?auto_756793 ) ) ( not ( = ?auto_756785 ?auto_756794 ) ) ( not ( = ?auto_756785 ?auto_756795 ) ) ( not ( = ?auto_756785 ?auto_756796 ) ) ( not ( = ?auto_756785 ?auto_756797 ) ) ( not ( = ?auto_756785 ?auto_756798 ) ) ( not ( = ?auto_756786 ?auto_756787 ) ) ( not ( = ?auto_756786 ?auto_756788 ) ) ( not ( = ?auto_756786 ?auto_756789 ) ) ( not ( = ?auto_756786 ?auto_756790 ) ) ( not ( = ?auto_756786 ?auto_756791 ) ) ( not ( = ?auto_756786 ?auto_756792 ) ) ( not ( = ?auto_756786 ?auto_756793 ) ) ( not ( = ?auto_756786 ?auto_756794 ) ) ( not ( = ?auto_756786 ?auto_756795 ) ) ( not ( = ?auto_756786 ?auto_756796 ) ) ( not ( = ?auto_756786 ?auto_756797 ) ) ( not ( = ?auto_756786 ?auto_756798 ) ) ( not ( = ?auto_756787 ?auto_756788 ) ) ( not ( = ?auto_756787 ?auto_756789 ) ) ( not ( = ?auto_756787 ?auto_756790 ) ) ( not ( = ?auto_756787 ?auto_756791 ) ) ( not ( = ?auto_756787 ?auto_756792 ) ) ( not ( = ?auto_756787 ?auto_756793 ) ) ( not ( = ?auto_756787 ?auto_756794 ) ) ( not ( = ?auto_756787 ?auto_756795 ) ) ( not ( = ?auto_756787 ?auto_756796 ) ) ( not ( = ?auto_756787 ?auto_756797 ) ) ( not ( = ?auto_756787 ?auto_756798 ) ) ( not ( = ?auto_756788 ?auto_756789 ) ) ( not ( = ?auto_756788 ?auto_756790 ) ) ( not ( = ?auto_756788 ?auto_756791 ) ) ( not ( = ?auto_756788 ?auto_756792 ) ) ( not ( = ?auto_756788 ?auto_756793 ) ) ( not ( = ?auto_756788 ?auto_756794 ) ) ( not ( = ?auto_756788 ?auto_756795 ) ) ( not ( = ?auto_756788 ?auto_756796 ) ) ( not ( = ?auto_756788 ?auto_756797 ) ) ( not ( = ?auto_756788 ?auto_756798 ) ) ( not ( = ?auto_756789 ?auto_756790 ) ) ( not ( = ?auto_756789 ?auto_756791 ) ) ( not ( = ?auto_756789 ?auto_756792 ) ) ( not ( = ?auto_756789 ?auto_756793 ) ) ( not ( = ?auto_756789 ?auto_756794 ) ) ( not ( = ?auto_756789 ?auto_756795 ) ) ( not ( = ?auto_756789 ?auto_756796 ) ) ( not ( = ?auto_756789 ?auto_756797 ) ) ( not ( = ?auto_756789 ?auto_756798 ) ) ( not ( = ?auto_756790 ?auto_756791 ) ) ( not ( = ?auto_756790 ?auto_756792 ) ) ( not ( = ?auto_756790 ?auto_756793 ) ) ( not ( = ?auto_756790 ?auto_756794 ) ) ( not ( = ?auto_756790 ?auto_756795 ) ) ( not ( = ?auto_756790 ?auto_756796 ) ) ( not ( = ?auto_756790 ?auto_756797 ) ) ( not ( = ?auto_756790 ?auto_756798 ) ) ( not ( = ?auto_756791 ?auto_756792 ) ) ( not ( = ?auto_756791 ?auto_756793 ) ) ( not ( = ?auto_756791 ?auto_756794 ) ) ( not ( = ?auto_756791 ?auto_756795 ) ) ( not ( = ?auto_756791 ?auto_756796 ) ) ( not ( = ?auto_756791 ?auto_756797 ) ) ( not ( = ?auto_756791 ?auto_756798 ) ) ( not ( = ?auto_756792 ?auto_756793 ) ) ( not ( = ?auto_756792 ?auto_756794 ) ) ( not ( = ?auto_756792 ?auto_756795 ) ) ( not ( = ?auto_756792 ?auto_756796 ) ) ( not ( = ?auto_756792 ?auto_756797 ) ) ( not ( = ?auto_756792 ?auto_756798 ) ) ( not ( = ?auto_756793 ?auto_756794 ) ) ( not ( = ?auto_756793 ?auto_756795 ) ) ( not ( = ?auto_756793 ?auto_756796 ) ) ( not ( = ?auto_756793 ?auto_756797 ) ) ( not ( = ?auto_756793 ?auto_756798 ) ) ( not ( = ?auto_756794 ?auto_756795 ) ) ( not ( = ?auto_756794 ?auto_756796 ) ) ( not ( = ?auto_756794 ?auto_756797 ) ) ( not ( = ?auto_756794 ?auto_756798 ) ) ( not ( = ?auto_756795 ?auto_756796 ) ) ( not ( = ?auto_756795 ?auto_756797 ) ) ( not ( = ?auto_756795 ?auto_756798 ) ) ( not ( = ?auto_756796 ?auto_756797 ) ) ( not ( = ?auto_756796 ?auto_756798 ) ) ( not ( = ?auto_756797 ?auto_756798 ) ) ( ON ?auto_756797 ?auto_756798 ) ( ON ?auto_756796 ?auto_756797 ) ( ON ?auto_756795 ?auto_756796 ) ( ON ?auto_756794 ?auto_756795 ) ( ON ?auto_756793 ?auto_756794 ) ( ON ?auto_756792 ?auto_756793 ) ( ON ?auto_756791 ?auto_756792 ) ( ON ?auto_756790 ?auto_756791 ) ( ON ?auto_756789 ?auto_756790 ) ( ON ?auto_756788 ?auto_756789 ) ( CLEAR ?auto_756786 ) ( ON ?auto_756787 ?auto_756788 ) ( CLEAR ?auto_756787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_756781 ?auto_756782 ?auto_756783 ?auto_756784 ?auto_756785 ?auto_756786 ?auto_756787 )
      ( MAKE-18PILE ?auto_756781 ?auto_756782 ?auto_756783 ?auto_756784 ?auto_756785 ?auto_756786 ?auto_756787 ?auto_756788 ?auto_756789 ?auto_756790 ?auto_756791 ?auto_756792 ?auto_756793 ?auto_756794 ?auto_756795 ?auto_756796 ?auto_756797 ?auto_756798 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756817 - BLOCK
      ?auto_756818 - BLOCK
      ?auto_756819 - BLOCK
      ?auto_756820 - BLOCK
      ?auto_756821 - BLOCK
      ?auto_756822 - BLOCK
      ?auto_756823 - BLOCK
      ?auto_756824 - BLOCK
      ?auto_756825 - BLOCK
      ?auto_756826 - BLOCK
      ?auto_756827 - BLOCK
      ?auto_756828 - BLOCK
      ?auto_756829 - BLOCK
      ?auto_756830 - BLOCK
      ?auto_756831 - BLOCK
      ?auto_756832 - BLOCK
      ?auto_756833 - BLOCK
      ?auto_756834 - BLOCK
    )
    :vars
    (
      ?auto_756835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756834 ?auto_756835 ) ( ON-TABLE ?auto_756817 ) ( ON ?auto_756818 ?auto_756817 ) ( ON ?auto_756819 ?auto_756818 ) ( ON ?auto_756820 ?auto_756819 ) ( ON ?auto_756821 ?auto_756820 ) ( not ( = ?auto_756817 ?auto_756818 ) ) ( not ( = ?auto_756817 ?auto_756819 ) ) ( not ( = ?auto_756817 ?auto_756820 ) ) ( not ( = ?auto_756817 ?auto_756821 ) ) ( not ( = ?auto_756817 ?auto_756822 ) ) ( not ( = ?auto_756817 ?auto_756823 ) ) ( not ( = ?auto_756817 ?auto_756824 ) ) ( not ( = ?auto_756817 ?auto_756825 ) ) ( not ( = ?auto_756817 ?auto_756826 ) ) ( not ( = ?auto_756817 ?auto_756827 ) ) ( not ( = ?auto_756817 ?auto_756828 ) ) ( not ( = ?auto_756817 ?auto_756829 ) ) ( not ( = ?auto_756817 ?auto_756830 ) ) ( not ( = ?auto_756817 ?auto_756831 ) ) ( not ( = ?auto_756817 ?auto_756832 ) ) ( not ( = ?auto_756817 ?auto_756833 ) ) ( not ( = ?auto_756817 ?auto_756834 ) ) ( not ( = ?auto_756817 ?auto_756835 ) ) ( not ( = ?auto_756818 ?auto_756819 ) ) ( not ( = ?auto_756818 ?auto_756820 ) ) ( not ( = ?auto_756818 ?auto_756821 ) ) ( not ( = ?auto_756818 ?auto_756822 ) ) ( not ( = ?auto_756818 ?auto_756823 ) ) ( not ( = ?auto_756818 ?auto_756824 ) ) ( not ( = ?auto_756818 ?auto_756825 ) ) ( not ( = ?auto_756818 ?auto_756826 ) ) ( not ( = ?auto_756818 ?auto_756827 ) ) ( not ( = ?auto_756818 ?auto_756828 ) ) ( not ( = ?auto_756818 ?auto_756829 ) ) ( not ( = ?auto_756818 ?auto_756830 ) ) ( not ( = ?auto_756818 ?auto_756831 ) ) ( not ( = ?auto_756818 ?auto_756832 ) ) ( not ( = ?auto_756818 ?auto_756833 ) ) ( not ( = ?auto_756818 ?auto_756834 ) ) ( not ( = ?auto_756818 ?auto_756835 ) ) ( not ( = ?auto_756819 ?auto_756820 ) ) ( not ( = ?auto_756819 ?auto_756821 ) ) ( not ( = ?auto_756819 ?auto_756822 ) ) ( not ( = ?auto_756819 ?auto_756823 ) ) ( not ( = ?auto_756819 ?auto_756824 ) ) ( not ( = ?auto_756819 ?auto_756825 ) ) ( not ( = ?auto_756819 ?auto_756826 ) ) ( not ( = ?auto_756819 ?auto_756827 ) ) ( not ( = ?auto_756819 ?auto_756828 ) ) ( not ( = ?auto_756819 ?auto_756829 ) ) ( not ( = ?auto_756819 ?auto_756830 ) ) ( not ( = ?auto_756819 ?auto_756831 ) ) ( not ( = ?auto_756819 ?auto_756832 ) ) ( not ( = ?auto_756819 ?auto_756833 ) ) ( not ( = ?auto_756819 ?auto_756834 ) ) ( not ( = ?auto_756819 ?auto_756835 ) ) ( not ( = ?auto_756820 ?auto_756821 ) ) ( not ( = ?auto_756820 ?auto_756822 ) ) ( not ( = ?auto_756820 ?auto_756823 ) ) ( not ( = ?auto_756820 ?auto_756824 ) ) ( not ( = ?auto_756820 ?auto_756825 ) ) ( not ( = ?auto_756820 ?auto_756826 ) ) ( not ( = ?auto_756820 ?auto_756827 ) ) ( not ( = ?auto_756820 ?auto_756828 ) ) ( not ( = ?auto_756820 ?auto_756829 ) ) ( not ( = ?auto_756820 ?auto_756830 ) ) ( not ( = ?auto_756820 ?auto_756831 ) ) ( not ( = ?auto_756820 ?auto_756832 ) ) ( not ( = ?auto_756820 ?auto_756833 ) ) ( not ( = ?auto_756820 ?auto_756834 ) ) ( not ( = ?auto_756820 ?auto_756835 ) ) ( not ( = ?auto_756821 ?auto_756822 ) ) ( not ( = ?auto_756821 ?auto_756823 ) ) ( not ( = ?auto_756821 ?auto_756824 ) ) ( not ( = ?auto_756821 ?auto_756825 ) ) ( not ( = ?auto_756821 ?auto_756826 ) ) ( not ( = ?auto_756821 ?auto_756827 ) ) ( not ( = ?auto_756821 ?auto_756828 ) ) ( not ( = ?auto_756821 ?auto_756829 ) ) ( not ( = ?auto_756821 ?auto_756830 ) ) ( not ( = ?auto_756821 ?auto_756831 ) ) ( not ( = ?auto_756821 ?auto_756832 ) ) ( not ( = ?auto_756821 ?auto_756833 ) ) ( not ( = ?auto_756821 ?auto_756834 ) ) ( not ( = ?auto_756821 ?auto_756835 ) ) ( not ( = ?auto_756822 ?auto_756823 ) ) ( not ( = ?auto_756822 ?auto_756824 ) ) ( not ( = ?auto_756822 ?auto_756825 ) ) ( not ( = ?auto_756822 ?auto_756826 ) ) ( not ( = ?auto_756822 ?auto_756827 ) ) ( not ( = ?auto_756822 ?auto_756828 ) ) ( not ( = ?auto_756822 ?auto_756829 ) ) ( not ( = ?auto_756822 ?auto_756830 ) ) ( not ( = ?auto_756822 ?auto_756831 ) ) ( not ( = ?auto_756822 ?auto_756832 ) ) ( not ( = ?auto_756822 ?auto_756833 ) ) ( not ( = ?auto_756822 ?auto_756834 ) ) ( not ( = ?auto_756822 ?auto_756835 ) ) ( not ( = ?auto_756823 ?auto_756824 ) ) ( not ( = ?auto_756823 ?auto_756825 ) ) ( not ( = ?auto_756823 ?auto_756826 ) ) ( not ( = ?auto_756823 ?auto_756827 ) ) ( not ( = ?auto_756823 ?auto_756828 ) ) ( not ( = ?auto_756823 ?auto_756829 ) ) ( not ( = ?auto_756823 ?auto_756830 ) ) ( not ( = ?auto_756823 ?auto_756831 ) ) ( not ( = ?auto_756823 ?auto_756832 ) ) ( not ( = ?auto_756823 ?auto_756833 ) ) ( not ( = ?auto_756823 ?auto_756834 ) ) ( not ( = ?auto_756823 ?auto_756835 ) ) ( not ( = ?auto_756824 ?auto_756825 ) ) ( not ( = ?auto_756824 ?auto_756826 ) ) ( not ( = ?auto_756824 ?auto_756827 ) ) ( not ( = ?auto_756824 ?auto_756828 ) ) ( not ( = ?auto_756824 ?auto_756829 ) ) ( not ( = ?auto_756824 ?auto_756830 ) ) ( not ( = ?auto_756824 ?auto_756831 ) ) ( not ( = ?auto_756824 ?auto_756832 ) ) ( not ( = ?auto_756824 ?auto_756833 ) ) ( not ( = ?auto_756824 ?auto_756834 ) ) ( not ( = ?auto_756824 ?auto_756835 ) ) ( not ( = ?auto_756825 ?auto_756826 ) ) ( not ( = ?auto_756825 ?auto_756827 ) ) ( not ( = ?auto_756825 ?auto_756828 ) ) ( not ( = ?auto_756825 ?auto_756829 ) ) ( not ( = ?auto_756825 ?auto_756830 ) ) ( not ( = ?auto_756825 ?auto_756831 ) ) ( not ( = ?auto_756825 ?auto_756832 ) ) ( not ( = ?auto_756825 ?auto_756833 ) ) ( not ( = ?auto_756825 ?auto_756834 ) ) ( not ( = ?auto_756825 ?auto_756835 ) ) ( not ( = ?auto_756826 ?auto_756827 ) ) ( not ( = ?auto_756826 ?auto_756828 ) ) ( not ( = ?auto_756826 ?auto_756829 ) ) ( not ( = ?auto_756826 ?auto_756830 ) ) ( not ( = ?auto_756826 ?auto_756831 ) ) ( not ( = ?auto_756826 ?auto_756832 ) ) ( not ( = ?auto_756826 ?auto_756833 ) ) ( not ( = ?auto_756826 ?auto_756834 ) ) ( not ( = ?auto_756826 ?auto_756835 ) ) ( not ( = ?auto_756827 ?auto_756828 ) ) ( not ( = ?auto_756827 ?auto_756829 ) ) ( not ( = ?auto_756827 ?auto_756830 ) ) ( not ( = ?auto_756827 ?auto_756831 ) ) ( not ( = ?auto_756827 ?auto_756832 ) ) ( not ( = ?auto_756827 ?auto_756833 ) ) ( not ( = ?auto_756827 ?auto_756834 ) ) ( not ( = ?auto_756827 ?auto_756835 ) ) ( not ( = ?auto_756828 ?auto_756829 ) ) ( not ( = ?auto_756828 ?auto_756830 ) ) ( not ( = ?auto_756828 ?auto_756831 ) ) ( not ( = ?auto_756828 ?auto_756832 ) ) ( not ( = ?auto_756828 ?auto_756833 ) ) ( not ( = ?auto_756828 ?auto_756834 ) ) ( not ( = ?auto_756828 ?auto_756835 ) ) ( not ( = ?auto_756829 ?auto_756830 ) ) ( not ( = ?auto_756829 ?auto_756831 ) ) ( not ( = ?auto_756829 ?auto_756832 ) ) ( not ( = ?auto_756829 ?auto_756833 ) ) ( not ( = ?auto_756829 ?auto_756834 ) ) ( not ( = ?auto_756829 ?auto_756835 ) ) ( not ( = ?auto_756830 ?auto_756831 ) ) ( not ( = ?auto_756830 ?auto_756832 ) ) ( not ( = ?auto_756830 ?auto_756833 ) ) ( not ( = ?auto_756830 ?auto_756834 ) ) ( not ( = ?auto_756830 ?auto_756835 ) ) ( not ( = ?auto_756831 ?auto_756832 ) ) ( not ( = ?auto_756831 ?auto_756833 ) ) ( not ( = ?auto_756831 ?auto_756834 ) ) ( not ( = ?auto_756831 ?auto_756835 ) ) ( not ( = ?auto_756832 ?auto_756833 ) ) ( not ( = ?auto_756832 ?auto_756834 ) ) ( not ( = ?auto_756832 ?auto_756835 ) ) ( not ( = ?auto_756833 ?auto_756834 ) ) ( not ( = ?auto_756833 ?auto_756835 ) ) ( not ( = ?auto_756834 ?auto_756835 ) ) ( ON ?auto_756833 ?auto_756834 ) ( ON ?auto_756832 ?auto_756833 ) ( ON ?auto_756831 ?auto_756832 ) ( ON ?auto_756830 ?auto_756831 ) ( ON ?auto_756829 ?auto_756830 ) ( ON ?auto_756828 ?auto_756829 ) ( ON ?auto_756827 ?auto_756828 ) ( ON ?auto_756826 ?auto_756827 ) ( ON ?auto_756825 ?auto_756826 ) ( ON ?auto_756824 ?auto_756825 ) ( ON ?auto_756823 ?auto_756824 ) ( CLEAR ?auto_756821 ) ( ON ?auto_756822 ?auto_756823 ) ( CLEAR ?auto_756822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_756817 ?auto_756818 ?auto_756819 ?auto_756820 ?auto_756821 ?auto_756822 )
      ( MAKE-18PILE ?auto_756817 ?auto_756818 ?auto_756819 ?auto_756820 ?auto_756821 ?auto_756822 ?auto_756823 ?auto_756824 ?auto_756825 ?auto_756826 ?auto_756827 ?auto_756828 ?auto_756829 ?auto_756830 ?auto_756831 ?auto_756832 ?auto_756833 ?auto_756834 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756854 - BLOCK
      ?auto_756855 - BLOCK
      ?auto_756856 - BLOCK
      ?auto_756857 - BLOCK
      ?auto_756858 - BLOCK
      ?auto_756859 - BLOCK
      ?auto_756860 - BLOCK
      ?auto_756861 - BLOCK
      ?auto_756862 - BLOCK
      ?auto_756863 - BLOCK
      ?auto_756864 - BLOCK
      ?auto_756865 - BLOCK
      ?auto_756866 - BLOCK
      ?auto_756867 - BLOCK
      ?auto_756868 - BLOCK
      ?auto_756869 - BLOCK
      ?auto_756870 - BLOCK
      ?auto_756871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756871 ) ( ON-TABLE ?auto_756854 ) ( ON ?auto_756855 ?auto_756854 ) ( ON ?auto_756856 ?auto_756855 ) ( ON ?auto_756857 ?auto_756856 ) ( ON ?auto_756858 ?auto_756857 ) ( not ( = ?auto_756854 ?auto_756855 ) ) ( not ( = ?auto_756854 ?auto_756856 ) ) ( not ( = ?auto_756854 ?auto_756857 ) ) ( not ( = ?auto_756854 ?auto_756858 ) ) ( not ( = ?auto_756854 ?auto_756859 ) ) ( not ( = ?auto_756854 ?auto_756860 ) ) ( not ( = ?auto_756854 ?auto_756861 ) ) ( not ( = ?auto_756854 ?auto_756862 ) ) ( not ( = ?auto_756854 ?auto_756863 ) ) ( not ( = ?auto_756854 ?auto_756864 ) ) ( not ( = ?auto_756854 ?auto_756865 ) ) ( not ( = ?auto_756854 ?auto_756866 ) ) ( not ( = ?auto_756854 ?auto_756867 ) ) ( not ( = ?auto_756854 ?auto_756868 ) ) ( not ( = ?auto_756854 ?auto_756869 ) ) ( not ( = ?auto_756854 ?auto_756870 ) ) ( not ( = ?auto_756854 ?auto_756871 ) ) ( not ( = ?auto_756855 ?auto_756856 ) ) ( not ( = ?auto_756855 ?auto_756857 ) ) ( not ( = ?auto_756855 ?auto_756858 ) ) ( not ( = ?auto_756855 ?auto_756859 ) ) ( not ( = ?auto_756855 ?auto_756860 ) ) ( not ( = ?auto_756855 ?auto_756861 ) ) ( not ( = ?auto_756855 ?auto_756862 ) ) ( not ( = ?auto_756855 ?auto_756863 ) ) ( not ( = ?auto_756855 ?auto_756864 ) ) ( not ( = ?auto_756855 ?auto_756865 ) ) ( not ( = ?auto_756855 ?auto_756866 ) ) ( not ( = ?auto_756855 ?auto_756867 ) ) ( not ( = ?auto_756855 ?auto_756868 ) ) ( not ( = ?auto_756855 ?auto_756869 ) ) ( not ( = ?auto_756855 ?auto_756870 ) ) ( not ( = ?auto_756855 ?auto_756871 ) ) ( not ( = ?auto_756856 ?auto_756857 ) ) ( not ( = ?auto_756856 ?auto_756858 ) ) ( not ( = ?auto_756856 ?auto_756859 ) ) ( not ( = ?auto_756856 ?auto_756860 ) ) ( not ( = ?auto_756856 ?auto_756861 ) ) ( not ( = ?auto_756856 ?auto_756862 ) ) ( not ( = ?auto_756856 ?auto_756863 ) ) ( not ( = ?auto_756856 ?auto_756864 ) ) ( not ( = ?auto_756856 ?auto_756865 ) ) ( not ( = ?auto_756856 ?auto_756866 ) ) ( not ( = ?auto_756856 ?auto_756867 ) ) ( not ( = ?auto_756856 ?auto_756868 ) ) ( not ( = ?auto_756856 ?auto_756869 ) ) ( not ( = ?auto_756856 ?auto_756870 ) ) ( not ( = ?auto_756856 ?auto_756871 ) ) ( not ( = ?auto_756857 ?auto_756858 ) ) ( not ( = ?auto_756857 ?auto_756859 ) ) ( not ( = ?auto_756857 ?auto_756860 ) ) ( not ( = ?auto_756857 ?auto_756861 ) ) ( not ( = ?auto_756857 ?auto_756862 ) ) ( not ( = ?auto_756857 ?auto_756863 ) ) ( not ( = ?auto_756857 ?auto_756864 ) ) ( not ( = ?auto_756857 ?auto_756865 ) ) ( not ( = ?auto_756857 ?auto_756866 ) ) ( not ( = ?auto_756857 ?auto_756867 ) ) ( not ( = ?auto_756857 ?auto_756868 ) ) ( not ( = ?auto_756857 ?auto_756869 ) ) ( not ( = ?auto_756857 ?auto_756870 ) ) ( not ( = ?auto_756857 ?auto_756871 ) ) ( not ( = ?auto_756858 ?auto_756859 ) ) ( not ( = ?auto_756858 ?auto_756860 ) ) ( not ( = ?auto_756858 ?auto_756861 ) ) ( not ( = ?auto_756858 ?auto_756862 ) ) ( not ( = ?auto_756858 ?auto_756863 ) ) ( not ( = ?auto_756858 ?auto_756864 ) ) ( not ( = ?auto_756858 ?auto_756865 ) ) ( not ( = ?auto_756858 ?auto_756866 ) ) ( not ( = ?auto_756858 ?auto_756867 ) ) ( not ( = ?auto_756858 ?auto_756868 ) ) ( not ( = ?auto_756858 ?auto_756869 ) ) ( not ( = ?auto_756858 ?auto_756870 ) ) ( not ( = ?auto_756858 ?auto_756871 ) ) ( not ( = ?auto_756859 ?auto_756860 ) ) ( not ( = ?auto_756859 ?auto_756861 ) ) ( not ( = ?auto_756859 ?auto_756862 ) ) ( not ( = ?auto_756859 ?auto_756863 ) ) ( not ( = ?auto_756859 ?auto_756864 ) ) ( not ( = ?auto_756859 ?auto_756865 ) ) ( not ( = ?auto_756859 ?auto_756866 ) ) ( not ( = ?auto_756859 ?auto_756867 ) ) ( not ( = ?auto_756859 ?auto_756868 ) ) ( not ( = ?auto_756859 ?auto_756869 ) ) ( not ( = ?auto_756859 ?auto_756870 ) ) ( not ( = ?auto_756859 ?auto_756871 ) ) ( not ( = ?auto_756860 ?auto_756861 ) ) ( not ( = ?auto_756860 ?auto_756862 ) ) ( not ( = ?auto_756860 ?auto_756863 ) ) ( not ( = ?auto_756860 ?auto_756864 ) ) ( not ( = ?auto_756860 ?auto_756865 ) ) ( not ( = ?auto_756860 ?auto_756866 ) ) ( not ( = ?auto_756860 ?auto_756867 ) ) ( not ( = ?auto_756860 ?auto_756868 ) ) ( not ( = ?auto_756860 ?auto_756869 ) ) ( not ( = ?auto_756860 ?auto_756870 ) ) ( not ( = ?auto_756860 ?auto_756871 ) ) ( not ( = ?auto_756861 ?auto_756862 ) ) ( not ( = ?auto_756861 ?auto_756863 ) ) ( not ( = ?auto_756861 ?auto_756864 ) ) ( not ( = ?auto_756861 ?auto_756865 ) ) ( not ( = ?auto_756861 ?auto_756866 ) ) ( not ( = ?auto_756861 ?auto_756867 ) ) ( not ( = ?auto_756861 ?auto_756868 ) ) ( not ( = ?auto_756861 ?auto_756869 ) ) ( not ( = ?auto_756861 ?auto_756870 ) ) ( not ( = ?auto_756861 ?auto_756871 ) ) ( not ( = ?auto_756862 ?auto_756863 ) ) ( not ( = ?auto_756862 ?auto_756864 ) ) ( not ( = ?auto_756862 ?auto_756865 ) ) ( not ( = ?auto_756862 ?auto_756866 ) ) ( not ( = ?auto_756862 ?auto_756867 ) ) ( not ( = ?auto_756862 ?auto_756868 ) ) ( not ( = ?auto_756862 ?auto_756869 ) ) ( not ( = ?auto_756862 ?auto_756870 ) ) ( not ( = ?auto_756862 ?auto_756871 ) ) ( not ( = ?auto_756863 ?auto_756864 ) ) ( not ( = ?auto_756863 ?auto_756865 ) ) ( not ( = ?auto_756863 ?auto_756866 ) ) ( not ( = ?auto_756863 ?auto_756867 ) ) ( not ( = ?auto_756863 ?auto_756868 ) ) ( not ( = ?auto_756863 ?auto_756869 ) ) ( not ( = ?auto_756863 ?auto_756870 ) ) ( not ( = ?auto_756863 ?auto_756871 ) ) ( not ( = ?auto_756864 ?auto_756865 ) ) ( not ( = ?auto_756864 ?auto_756866 ) ) ( not ( = ?auto_756864 ?auto_756867 ) ) ( not ( = ?auto_756864 ?auto_756868 ) ) ( not ( = ?auto_756864 ?auto_756869 ) ) ( not ( = ?auto_756864 ?auto_756870 ) ) ( not ( = ?auto_756864 ?auto_756871 ) ) ( not ( = ?auto_756865 ?auto_756866 ) ) ( not ( = ?auto_756865 ?auto_756867 ) ) ( not ( = ?auto_756865 ?auto_756868 ) ) ( not ( = ?auto_756865 ?auto_756869 ) ) ( not ( = ?auto_756865 ?auto_756870 ) ) ( not ( = ?auto_756865 ?auto_756871 ) ) ( not ( = ?auto_756866 ?auto_756867 ) ) ( not ( = ?auto_756866 ?auto_756868 ) ) ( not ( = ?auto_756866 ?auto_756869 ) ) ( not ( = ?auto_756866 ?auto_756870 ) ) ( not ( = ?auto_756866 ?auto_756871 ) ) ( not ( = ?auto_756867 ?auto_756868 ) ) ( not ( = ?auto_756867 ?auto_756869 ) ) ( not ( = ?auto_756867 ?auto_756870 ) ) ( not ( = ?auto_756867 ?auto_756871 ) ) ( not ( = ?auto_756868 ?auto_756869 ) ) ( not ( = ?auto_756868 ?auto_756870 ) ) ( not ( = ?auto_756868 ?auto_756871 ) ) ( not ( = ?auto_756869 ?auto_756870 ) ) ( not ( = ?auto_756869 ?auto_756871 ) ) ( not ( = ?auto_756870 ?auto_756871 ) ) ( ON ?auto_756870 ?auto_756871 ) ( ON ?auto_756869 ?auto_756870 ) ( ON ?auto_756868 ?auto_756869 ) ( ON ?auto_756867 ?auto_756868 ) ( ON ?auto_756866 ?auto_756867 ) ( ON ?auto_756865 ?auto_756866 ) ( ON ?auto_756864 ?auto_756865 ) ( ON ?auto_756863 ?auto_756864 ) ( ON ?auto_756862 ?auto_756863 ) ( ON ?auto_756861 ?auto_756862 ) ( ON ?auto_756860 ?auto_756861 ) ( CLEAR ?auto_756858 ) ( ON ?auto_756859 ?auto_756860 ) ( CLEAR ?auto_756859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_756854 ?auto_756855 ?auto_756856 ?auto_756857 ?auto_756858 ?auto_756859 )
      ( MAKE-18PILE ?auto_756854 ?auto_756855 ?auto_756856 ?auto_756857 ?auto_756858 ?auto_756859 ?auto_756860 ?auto_756861 ?auto_756862 ?auto_756863 ?auto_756864 ?auto_756865 ?auto_756866 ?auto_756867 ?auto_756868 ?auto_756869 ?auto_756870 ?auto_756871 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756890 - BLOCK
      ?auto_756891 - BLOCK
      ?auto_756892 - BLOCK
      ?auto_756893 - BLOCK
      ?auto_756894 - BLOCK
      ?auto_756895 - BLOCK
      ?auto_756896 - BLOCK
      ?auto_756897 - BLOCK
      ?auto_756898 - BLOCK
      ?auto_756899 - BLOCK
      ?auto_756900 - BLOCK
      ?auto_756901 - BLOCK
      ?auto_756902 - BLOCK
      ?auto_756903 - BLOCK
      ?auto_756904 - BLOCK
      ?auto_756905 - BLOCK
      ?auto_756906 - BLOCK
      ?auto_756907 - BLOCK
    )
    :vars
    (
      ?auto_756908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756907 ?auto_756908 ) ( ON-TABLE ?auto_756890 ) ( ON ?auto_756891 ?auto_756890 ) ( ON ?auto_756892 ?auto_756891 ) ( ON ?auto_756893 ?auto_756892 ) ( not ( = ?auto_756890 ?auto_756891 ) ) ( not ( = ?auto_756890 ?auto_756892 ) ) ( not ( = ?auto_756890 ?auto_756893 ) ) ( not ( = ?auto_756890 ?auto_756894 ) ) ( not ( = ?auto_756890 ?auto_756895 ) ) ( not ( = ?auto_756890 ?auto_756896 ) ) ( not ( = ?auto_756890 ?auto_756897 ) ) ( not ( = ?auto_756890 ?auto_756898 ) ) ( not ( = ?auto_756890 ?auto_756899 ) ) ( not ( = ?auto_756890 ?auto_756900 ) ) ( not ( = ?auto_756890 ?auto_756901 ) ) ( not ( = ?auto_756890 ?auto_756902 ) ) ( not ( = ?auto_756890 ?auto_756903 ) ) ( not ( = ?auto_756890 ?auto_756904 ) ) ( not ( = ?auto_756890 ?auto_756905 ) ) ( not ( = ?auto_756890 ?auto_756906 ) ) ( not ( = ?auto_756890 ?auto_756907 ) ) ( not ( = ?auto_756890 ?auto_756908 ) ) ( not ( = ?auto_756891 ?auto_756892 ) ) ( not ( = ?auto_756891 ?auto_756893 ) ) ( not ( = ?auto_756891 ?auto_756894 ) ) ( not ( = ?auto_756891 ?auto_756895 ) ) ( not ( = ?auto_756891 ?auto_756896 ) ) ( not ( = ?auto_756891 ?auto_756897 ) ) ( not ( = ?auto_756891 ?auto_756898 ) ) ( not ( = ?auto_756891 ?auto_756899 ) ) ( not ( = ?auto_756891 ?auto_756900 ) ) ( not ( = ?auto_756891 ?auto_756901 ) ) ( not ( = ?auto_756891 ?auto_756902 ) ) ( not ( = ?auto_756891 ?auto_756903 ) ) ( not ( = ?auto_756891 ?auto_756904 ) ) ( not ( = ?auto_756891 ?auto_756905 ) ) ( not ( = ?auto_756891 ?auto_756906 ) ) ( not ( = ?auto_756891 ?auto_756907 ) ) ( not ( = ?auto_756891 ?auto_756908 ) ) ( not ( = ?auto_756892 ?auto_756893 ) ) ( not ( = ?auto_756892 ?auto_756894 ) ) ( not ( = ?auto_756892 ?auto_756895 ) ) ( not ( = ?auto_756892 ?auto_756896 ) ) ( not ( = ?auto_756892 ?auto_756897 ) ) ( not ( = ?auto_756892 ?auto_756898 ) ) ( not ( = ?auto_756892 ?auto_756899 ) ) ( not ( = ?auto_756892 ?auto_756900 ) ) ( not ( = ?auto_756892 ?auto_756901 ) ) ( not ( = ?auto_756892 ?auto_756902 ) ) ( not ( = ?auto_756892 ?auto_756903 ) ) ( not ( = ?auto_756892 ?auto_756904 ) ) ( not ( = ?auto_756892 ?auto_756905 ) ) ( not ( = ?auto_756892 ?auto_756906 ) ) ( not ( = ?auto_756892 ?auto_756907 ) ) ( not ( = ?auto_756892 ?auto_756908 ) ) ( not ( = ?auto_756893 ?auto_756894 ) ) ( not ( = ?auto_756893 ?auto_756895 ) ) ( not ( = ?auto_756893 ?auto_756896 ) ) ( not ( = ?auto_756893 ?auto_756897 ) ) ( not ( = ?auto_756893 ?auto_756898 ) ) ( not ( = ?auto_756893 ?auto_756899 ) ) ( not ( = ?auto_756893 ?auto_756900 ) ) ( not ( = ?auto_756893 ?auto_756901 ) ) ( not ( = ?auto_756893 ?auto_756902 ) ) ( not ( = ?auto_756893 ?auto_756903 ) ) ( not ( = ?auto_756893 ?auto_756904 ) ) ( not ( = ?auto_756893 ?auto_756905 ) ) ( not ( = ?auto_756893 ?auto_756906 ) ) ( not ( = ?auto_756893 ?auto_756907 ) ) ( not ( = ?auto_756893 ?auto_756908 ) ) ( not ( = ?auto_756894 ?auto_756895 ) ) ( not ( = ?auto_756894 ?auto_756896 ) ) ( not ( = ?auto_756894 ?auto_756897 ) ) ( not ( = ?auto_756894 ?auto_756898 ) ) ( not ( = ?auto_756894 ?auto_756899 ) ) ( not ( = ?auto_756894 ?auto_756900 ) ) ( not ( = ?auto_756894 ?auto_756901 ) ) ( not ( = ?auto_756894 ?auto_756902 ) ) ( not ( = ?auto_756894 ?auto_756903 ) ) ( not ( = ?auto_756894 ?auto_756904 ) ) ( not ( = ?auto_756894 ?auto_756905 ) ) ( not ( = ?auto_756894 ?auto_756906 ) ) ( not ( = ?auto_756894 ?auto_756907 ) ) ( not ( = ?auto_756894 ?auto_756908 ) ) ( not ( = ?auto_756895 ?auto_756896 ) ) ( not ( = ?auto_756895 ?auto_756897 ) ) ( not ( = ?auto_756895 ?auto_756898 ) ) ( not ( = ?auto_756895 ?auto_756899 ) ) ( not ( = ?auto_756895 ?auto_756900 ) ) ( not ( = ?auto_756895 ?auto_756901 ) ) ( not ( = ?auto_756895 ?auto_756902 ) ) ( not ( = ?auto_756895 ?auto_756903 ) ) ( not ( = ?auto_756895 ?auto_756904 ) ) ( not ( = ?auto_756895 ?auto_756905 ) ) ( not ( = ?auto_756895 ?auto_756906 ) ) ( not ( = ?auto_756895 ?auto_756907 ) ) ( not ( = ?auto_756895 ?auto_756908 ) ) ( not ( = ?auto_756896 ?auto_756897 ) ) ( not ( = ?auto_756896 ?auto_756898 ) ) ( not ( = ?auto_756896 ?auto_756899 ) ) ( not ( = ?auto_756896 ?auto_756900 ) ) ( not ( = ?auto_756896 ?auto_756901 ) ) ( not ( = ?auto_756896 ?auto_756902 ) ) ( not ( = ?auto_756896 ?auto_756903 ) ) ( not ( = ?auto_756896 ?auto_756904 ) ) ( not ( = ?auto_756896 ?auto_756905 ) ) ( not ( = ?auto_756896 ?auto_756906 ) ) ( not ( = ?auto_756896 ?auto_756907 ) ) ( not ( = ?auto_756896 ?auto_756908 ) ) ( not ( = ?auto_756897 ?auto_756898 ) ) ( not ( = ?auto_756897 ?auto_756899 ) ) ( not ( = ?auto_756897 ?auto_756900 ) ) ( not ( = ?auto_756897 ?auto_756901 ) ) ( not ( = ?auto_756897 ?auto_756902 ) ) ( not ( = ?auto_756897 ?auto_756903 ) ) ( not ( = ?auto_756897 ?auto_756904 ) ) ( not ( = ?auto_756897 ?auto_756905 ) ) ( not ( = ?auto_756897 ?auto_756906 ) ) ( not ( = ?auto_756897 ?auto_756907 ) ) ( not ( = ?auto_756897 ?auto_756908 ) ) ( not ( = ?auto_756898 ?auto_756899 ) ) ( not ( = ?auto_756898 ?auto_756900 ) ) ( not ( = ?auto_756898 ?auto_756901 ) ) ( not ( = ?auto_756898 ?auto_756902 ) ) ( not ( = ?auto_756898 ?auto_756903 ) ) ( not ( = ?auto_756898 ?auto_756904 ) ) ( not ( = ?auto_756898 ?auto_756905 ) ) ( not ( = ?auto_756898 ?auto_756906 ) ) ( not ( = ?auto_756898 ?auto_756907 ) ) ( not ( = ?auto_756898 ?auto_756908 ) ) ( not ( = ?auto_756899 ?auto_756900 ) ) ( not ( = ?auto_756899 ?auto_756901 ) ) ( not ( = ?auto_756899 ?auto_756902 ) ) ( not ( = ?auto_756899 ?auto_756903 ) ) ( not ( = ?auto_756899 ?auto_756904 ) ) ( not ( = ?auto_756899 ?auto_756905 ) ) ( not ( = ?auto_756899 ?auto_756906 ) ) ( not ( = ?auto_756899 ?auto_756907 ) ) ( not ( = ?auto_756899 ?auto_756908 ) ) ( not ( = ?auto_756900 ?auto_756901 ) ) ( not ( = ?auto_756900 ?auto_756902 ) ) ( not ( = ?auto_756900 ?auto_756903 ) ) ( not ( = ?auto_756900 ?auto_756904 ) ) ( not ( = ?auto_756900 ?auto_756905 ) ) ( not ( = ?auto_756900 ?auto_756906 ) ) ( not ( = ?auto_756900 ?auto_756907 ) ) ( not ( = ?auto_756900 ?auto_756908 ) ) ( not ( = ?auto_756901 ?auto_756902 ) ) ( not ( = ?auto_756901 ?auto_756903 ) ) ( not ( = ?auto_756901 ?auto_756904 ) ) ( not ( = ?auto_756901 ?auto_756905 ) ) ( not ( = ?auto_756901 ?auto_756906 ) ) ( not ( = ?auto_756901 ?auto_756907 ) ) ( not ( = ?auto_756901 ?auto_756908 ) ) ( not ( = ?auto_756902 ?auto_756903 ) ) ( not ( = ?auto_756902 ?auto_756904 ) ) ( not ( = ?auto_756902 ?auto_756905 ) ) ( not ( = ?auto_756902 ?auto_756906 ) ) ( not ( = ?auto_756902 ?auto_756907 ) ) ( not ( = ?auto_756902 ?auto_756908 ) ) ( not ( = ?auto_756903 ?auto_756904 ) ) ( not ( = ?auto_756903 ?auto_756905 ) ) ( not ( = ?auto_756903 ?auto_756906 ) ) ( not ( = ?auto_756903 ?auto_756907 ) ) ( not ( = ?auto_756903 ?auto_756908 ) ) ( not ( = ?auto_756904 ?auto_756905 ) ) ( not ( = ?auto_756904 ?auto_756906 ) ) ( not ( = ?auto_756904 ?auto_756907 ) ) ( not ( = ?auto_756904 ?auto_756908 ) ) ( not ( = ?auto_756905 ?auto_756906 ) ) ( not ( = ?auto_756905 ?auto_756907 ) ) ( not ( = ?auto_756905 ?auto_756908 ) ) ( not ( = ?auto_756906 ?auto_756907 ) ) ( not ( = ?auto_756906 ?auto_756908 ) ) ( not ( = ?auto_756907 ?auto_756908 ) ) ( ON ?auto_756906 ?auto_756907 ) ( ON ?auto_756905 ?auto_756906 ) ( ON ?auto_756904 ?auto_756905 ) ( ON ?auto_756903 ?auto_756904 ) ( ON ?auto_756902 ?auto_756903 ) ( ON ?auto_756901 ?auto_756902 ) ( ON ?auto_756900 ?auto_756901 ) ( ON ?auto_756899 ?auto_756900 ) ( ON ?auto_756898 ?auto_756899 ) ( ON ?auto_756897 ?auto_756898 ) ( ON ?auto_756896 ?auto_756897 ) ( ON ?auto_756895 ?auto_756896 ) ( CLEAR ?auto_756893 ) ( ON ?auto_756894 ?auto_756895 ) ( CLEAR ?auto_756894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_756890 ?auto_756891 ?auto_756892 ?auto_756893 ?auto_756894 )
      ( MAKE-18PILE ?auto_756890 ?auto_756891 ?auto_756892 ?auto_756893 ?auto_756894 ?auto_756895 ?auto_756896 ?auto_756897 ?auto_756898 ?auto_756899 ?auto_756900 ?auto_756901 ?auto_756902 ?auto_756903 ?auto_756904 ?auto_756905 ?auto_756906 ?auto_756907 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756927 - BLOCK
      ?auto_756928 - BLOCK
      ?auto_756929 - BLOCK
      ?auto_756930 - BLOCK
      ?auto_756931 - BLOCK
      ?auto_756932 - BLOCK
      ?auto_756933 - BLOCK
      ?auto_756934 - BLOCK
      ?auto_756935 - BLOCK
      ?auto_756936 - BLOCK
      ?auto_756937 - BLOCK
      ?auto_756938 - BLOCK
      ?auto_756939 - BLOCK
      ?auto_756940 - BLOCK
      ?auto_756941 - BLOCK
      ?auto_756942 - BLOCK
      ?auto_756943 - BLOCK
      ?auto_756944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_756944 ) ( ON-TABLE ?auto_756927 ) ( ON ?auto_756928 ?auto_756927 ) ( ON ?auto_756929 ?auto_756928 ) ( ON ?auto_756930 ?auto_756929 ) ( not ( = ?auto_756927 ?auto_756928 ) ) ( not ( = ?auto_756927 ?auto_756929 ) ) ( not ( = ?auto_756927 ?auto_756930 ) ) ( not ( = ?auto_756927 ?auto_756931 ) ) ( not ( = ?auto_756927 ?auto_756932 ) ) ( not ( = ?auto_756927 ?auto_756933 ) ) ( not ( = ?auto_756927 ?auto_756934 ) ) ( not ( = ?auto_756927 ?auto_756935 ) ) ( not ( = ?auto_756927 ?auto_756936 ) ) ( not ( = ?auto_756927 ?auto_756937 ) ) ( not ( = ?auto_756927 ?auto_756938 ) ) ( not ( = ?auto_756927 ?auto_756939 ) ) ( not ( = ?auto_756927 ?auto_756940 ) ) ( not ( = ?auto_756927 ?auto_756941 ) ) ( not ( = ?auto_756927 ?auto_756942 ) ) ( not ( = ?auto_756927 ?auto_756943 ) ) ( not ( = ?auto_756927 ?auto_756944 ) ) ( not ( = ?auto_756928 ?auto_756929 ) ) ( not ( = ?auto_756928 ?auto_756930 ) ) ( not ( = ?auto_756928 ?auto_756931 ) ) ( not ( = ?auto_756928 ?auto_756932 ) ) ( not ( = ?auto_756928 ?auto_756933 ) ) ( not ( = ?auto_756928 ?auto_756934 ) ) ( not ( = ?auto_756928 ?auto_756935 ) ) ( not ( = ?auto_756928 ?auto_756936 ) ) ( not ( = ?auto_756928 ?auto_756937 ) ) ( not ( = ?auto_756928 ?auto_756938 ) ) ( not ( = ?auto_756928 ?auto_756939 ) ) ( not ( = ?auto_756928 ?auto_756940 ) ) ( not ( = ?auto_756928 ?auto_756941 ) ) ( not ( = ?auto_756928 ?auto_756942 ) ) ( not ( = ?auto_756928 ?auto_756943 ) ) ( not ( = ?auto_756928 ?auto_756944 ) ) ( not ( = ?auto_756929 ?auto_756930 ) ) ( not ( = ?auto_756929 ?auto_756931 ) ) ( not ( = ?auto_756929 ?auto_756932 ) ) ( not ( = ?auto_756929 ?auto_756933 ) ) ( not ( = ?auto_756929 ?auto_756934 ) ) ( not ( = ?auto_756929 ?auto_756935 ) ) ( not ( = ?auto_756929 ?auto_756936 ) ) ( not ( = ?auto_756929 ?auto_756937 ) ) ( not ( = ?auto_756929 ?auto_756938 ) ) ( not ( = ?auto_756929 ?auto_756939 ) ) ( not ( = ?auto_756929 ?auto_756940 ) ) ( not ( = ?auto_756929 ?auto_756941 ) ) ( not ( = ?auto_756929 ?auto_756942 ) ) ( not ( = ?auto_756929 ?auto_756943 ) ) ( not ( = ?auto_756929 ?auto_756944 ) ) ( not ( = ?auto_756930 ?auto_756931 ) ) ( not ( = ?auto_756930 ?auto_756932 ) ) ( not ( = ?auto_756930 ?auto_756933 ) ) ( not ( = ?auto_756930 ?auto_756934 ) ) ( not ( = ?auto_756930 ?auto_756935 ) ) ( not ( = ?auto_756930 ?auto_756936 ) ) ( not ( = ?auto_756930 ?auto_756937 ) ) ( not ( = ?auto_756930 ?auto_756938 ) ) ( not ( = ?auto_756930 ?auto_756939 ) ) ( not ( = ?auto_756930 ?auto_756940 ) ) ( not ( = ?auto_756930 ?auto_756941 ) ) ( not ( = ?auto_756930 ?auto_756942 ) ) ( not ( = ?auto_756930 ?auto_756943 ) ) ( not ( = ?auto_756930 ?auto_756944 ) ) ( not ( = ?auto_756931 ?auto_756932 ) ) ( not ( = ?auto_756931 ?auto_756933 ) ) ( not ( = ?auto_756931 ?auto_756934 ) ) ( not ( = ?auto_756931 ?auto_756935 ) ) ( not ( = ?auto_756931 ?auto_756936 ) ) ( not ( = ?auto_756931 ?auto_756937 ) ) ( not ( = ?auto_756931 ?auto_756938 ) ) ( not ( = ?auto_756931 ?auto_756939 ) ) ( not ( = ?auto_756931 ?auto_756940 ) ) ( not ( = ?auto_756931 ?auto_756941 ) ) ( not ( = ?auto_756931 ?auto_756942 ) ) ( not ( = ?auto_756931 ?auto_756943 ) ) ( not ( = ?auto_756931 ?auto_756944 ) ) ( not ( = ?auto_756932 ?auto_756933 ) ) ( not ( = ?auto_756932 ?auto_756934 ) ) ( not ( = ?auto_756932 ?auto_756935 ) ) ( not ( = ?auto_756932 ?auto_756936 ) ) ( not ( = ?auto_756932 ?auto_756937 ) ) ( not ( = ?auto_756932 ?auto_756938 ) ) ( not ( = ?auto_756932 ?auto_756939 ) ) ( not ( = ?auto_756932 ?auto_756940 ) ) ( not ( = ?auto_756932 ?auto_756941 ) ) ( not ( = ?auto_756932 ?auto_756942 ) ) ( not ( = ?auto_756932 ?auto_756943 ) ) ( not ( = ?auto_756932 ?auto_756944 ) ) ( not ( = ?auto_756933 ?auto_756934 ) ) ( not ( = ?auto_756933 ?auto_756935 ) ) ( not ( = ?auto_756933 ?auto_756936 ) ) ( not ( = ?auto_756933 ?auto_756937 ) ) ( not ( = ?auto_756933 ?auto_756938 ) ) ( not ( = ?auto_756933 ?auto_756939 ) ) ( not ( = ?auto_756933 ?auto_756940 ) ) ( not ( = ?auto_756933 ?auto_756941 ) ) ( not ( = ?auto_756933 ?auto_756942 ) ) ( not ( = ?auto_756933 ?auto_756943 ) ) ( not ( = ?auto_756933 ?auto_756944 ) ) ( not ( = ?auto_756934 ?auto_756935 ) ) ( not ( = ?auto_756934 ?auto_756936 ) ) ( not ( = ?auto_756934 ?auto_756937 ) ) ( not ( = ?auto_756934 ?auto_756938 ) ) ( not ( = ?auto_756934 ?auto_756939 ) ) ( not ( = ?auto_756934 ?auto_756940 ) ) ( not ( = ?auto_756934 ?auto_756941 ) ) ( not ( = ?auto_756934 ?auto_756942 ) ) ( not ( = ?auto_756934 ?auto_756943 ) ) ( not ( = ?auto_756934 ?auto_756944 ) ) ( not ( = ?auto_756935 ?auto_756936 ) ) ( not ( = ?auto_756935 ?auto_756937 ) ) ( not ( = ?auto_756935 ?auto_756938 ) ) ( not ( = ?auto_756935 ?auto_756939 ) ) ( not ( = ?auto_756935 ?auto_756940 ) ) ( not ( = ?auto_756935 ?auto_756941 ) ) ( not ( = ?auto_756935 ?auto_756942 ) ) ( not ( = ?auto_756935 ?auto_756943 ) ) ( not ( = ?auto_756935 ?auto_756944 ) ) ( not ( = ?auto_756936 ?auto_756937 ) ) ( not ( = ?auto_756936 ?auto_756938 ) ) ( not ( = ?auto_756936 ?auto_756939 ) ) ( not ( = ?auto_756936 ?auto_756940 ) ) ( not ( = ?auto_756936 ?auto_756941 ) ) ( not ( = ?auto_756936 ?auto_756942 ) ) ( not ( = ?auto_756936 ?auto_756943 ) ) ( not ( = ?auto_756936 ?auto_756944 ) ) ( not ( = ?auto_756937 ?auto_756938 ) ) ( not ( = ?auto_756937 ?auto_756939 ) ) ( not ( = ?auto_756937 ?auto_756940 ) ) ( not ( = ?auto_756937 ?auto_756941 ) ) ( not ( = ?auto_756937 ?auto_756942 ) ) ( not ( = ?auto_756937 ?auto_756943 ) ) ( not ( = ?auto_756937 ?auto_756944 ) ) ( not ( = ?auto_756938 ?auto_756939 ) ) ( not ( = ?auto_756938 ?auto_756940 ) ) ( not ( = ?auto_756938 ?auto_756941 ) ) ( not ( = ?auto_756938 ?auto_756942 ) ) ( not ( = ?auto_756938 ?auto_756943 ) ) ( not ( = ?auto_756938 ?auto_756944 ) ) ( not ( = ?auto_756939 ?auto_756940 ) ) ( not ( = ?auto_756939 ?auto_756941 ) ) ( not ( = ?auto_756939 ?auto_756942 ) ) ( not ( = ?auto_756939 ?auto_756943 ) ) ( not ( = ?auto_756939 ?auto_756944 ) ) ( not ( = ?auto_756940 ?auto_756941 ) ) ( not ( = ?auto_756940 ?auto_756942 ) ) ( not ( = ?auto_756940 ?auto_756943 ) ) ( not ( = ?auto_756940 ?auto_756944 ) ) ( not ( = ?auto_756941 ?auto_756942 ) ) ( not ( = ?auto_756941 ?auto_756943 ) ) ( not ( = ?auto_756941 ?auto_756944 ) ) ( not ( = ?auto_756942 ?auto_756943 ) ) ( not ( = ?auto_756942 ?auto_756944 ) ) ( not ( = ?auto_756943 ?auto_756944 ) ) ( ON ?auto_756943 ?auto_756944 ) ( ON ?auto_756942 ?auto_756943 ) ( ON ?auto_756941 ?auto_756942 ) ( ON ?auto_756940 ?auto_756941 ) ( ON ?auto_756939 ?auto_756940 ) ( ON ?auto_756938 ?auto_756939 ) ( ON ?auto_756937 ?auto_756938 ) ( ON ?auto_756936 ?auto_756937 ) ( ON ?auto_756935 ?auto_756936 ) ( ON ?auto_756934 ?auto_756935 ) ( ON ?auto_756933 ?auto_756934 ) ( ON ?auto_756932 ?auto_756933 ) ( CLEAR ?auto_756930 ) ( ON ?auto_756931 ?auto_756932 ) ( CLEAR ?auto_756931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_756927 ?auto_756928 ?auto_756929 ?auto_756930 ?auto_756931 )
      ( MAKE-18PILE ?auto_756927 ?auto_756928 ?auto_756929 ?auto_756930 ?auto_756931 ?auto_756932 ?auto_756933 ?auto_756934 ?auto_756935 ?auto_756936 ?auto_756937 ?auto_756938 ?auto_756939 ?auto_756940 ?auto_756941 ?auto_756942 ?auto_756943 ?auto_756944 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_756963 - BLOCK
      ?auto_756964 - BLOCK
      ?auto_756965 - BLOCK
      ?auto_756966 - BLOCK
      ?auto_756967 - BLOCK
      ?auto_756968 - BLOCK
      ?auto_756969 - BLOCK
      ?auto_756970 - BLOCK
      ?auto_756971 - BLOCK
      ?auto_756972 - BLOCK
      ?auto_756973 - BLOCK
      ?auto_756974 - BLOCK
      ?auto_756975 - BLOCK
      ?auto_756976 - BLOCK
      ?auto_756977 - BLOCK
      ?auto_756978 - BLOCK
      ?auto_756979 - BLOCK
      ?auto_756980 - BLOCK
    )
    :vars
    (
      ?auto_756981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756980 ?auto_756981 ) ( ON-TABLE ?auto_756963 ) ( ON ?auto_756964 ?auto_756963 ) ( ON ?auto_756965 ?auto_756964 ) ( not ( = ?auto_756963 ?auto_756964 ) ) ( not ( = ?auto_756963 ?auto_756965 ) ) ( not ( = ?auto_756963 ?auto_756966 ) ) ( not ( = ?auto_756963 ?auto_756967 ) ) ( not ( = ?auto_756963 ?auto_756968 ) ) ( not ( = ?auto_756963 ?auto_756969 ) ) ( not ( = ?auto_756963 ?auto_756970 ) ) ( not ( = ?auto_756963 ?auto_756971 ) ) ( not ( = ?auto_756963 ?auto_756972 ) ) ( not ( = ?auto_756963 ?auto_756973 ) ) ( not ( = ?auto_756963 ?auto_756974 ) ) ( not ( = ?auto_756963 ?auto_756975 ) ) ( not ( = ?auto_756963 ?auto_756976 ) ) ( not ( = ?auto_756963 ?auto_756977 ) ) ( not ( = ?auto_756963 ?auto_756978 ) ) ( not ( = ?auto_756963 ?auto_756979 ) ) ( not ( = ?auto_756963 ?auto_756980 ) ) ( not ( = ?auto_756963 ?auto_756981 ) ) ( not ( = ?auto_756964 ?auto_756965 ) ) ( not ( = ?auto_756964 ?auto_756966 ) ) ( not ( = ?auto_756964 ?auto_756967 ) ) ( not ( = ?auto_756964 ?auto_756968 ) ) ( not ( = ?auto_756964 ?auto_756969 ) ) ( not ( = ?auto_756964 ?auto_756970 ) ) ( not ( = ?auto_756964 ?auto_756971 ) ) ( not ( = ?auto_756964 ?auto_756972 ) ) ( not ( = ?auto_756964 ?auto_756973 ) ) ( not ( = ?auto_756964 ?auto_756974 ) ) ( not ( = ?auto_756964 ?auto_756975 ) ) ( not ( = ?auto_756964 ?auto_756976 ) ) ( not ( = ?auto_756964 ?auto_756977 ) ) ( not ( = ?auto_756964 ?auto_756978 ) ) ( not ( = ?auto_756964 ?auto_756979 ) ) ( not ( = ?auto_756964 ?auto_756980 ) ) ( not ( = ?auto_756964 ?auto_756981 ) ) ( not ( = ?auto_756965 ?auto_756966 ) ) ( not ( = ?auto_756965 ?auto_756967 ) ) ( not ( = ?auto_756965 ?auto_756968 ) ) ( not ( = ?auto_756965 ?auto_756969 ) ) ( not ( = ?auto_756965 ?auto_756970 ) ) ( not ( = ?auto_756965 ?auto_756971 ) ) ( not ( = ?auto_756965 ?auto_756972 ) ) ( not ( = ?auto_756965 ?auto_756973 ) ) ( not ( = ?auto_756965 ?auto_756974 ) ) ( not ( = ?auto_756965 ?auto_756975 ) ) ( not ( = ?auto_756965 ?auto_756976 ) ) ( not ( = ?auto_756965 ?auto_756977 ) ) ( not ( = ?auto_756965 ?auto_756978 ) ) ( not ( = ?auto_756965 ?auto_756979 ) ) ( not ( = ?auto_756965 ?auto_756980 ) ) ( not ( = ?auto_756965 ?auto_756981 ) ) ( not ( = ?auto_756966 ?auto_756967 ) ) ( not ( = ?auto_756966 ?auto_756968 ) ) ( not ( = ?auto_756966 ?auto_756969 ) ) ( not ( = ?auto_756966 ?auto_756970 ) ) ( not ( = ?auto_756966 ?auto_756971 ) ) ( not ( = ?auto_756966 ?auto_756972 ) ) ( not ( = ?auto_756966 ?auto_756973 ) ) ( not ( = ?auto_756966 ?auto_756974 ) ) ( not ( = ?auto_756966 ?auto_756975 ) ) ( not ( = ?auto_756966 ?auto_756976 ) ) ( not ( = ?auto_756966 ?auto_756977 ) ) ( not ( = ?auto_756966 ?auto_756978 ) ) ( not ( = ?auto_756966 ?auto_756979 ) ) ( not ( = ?auto_756966 ?auto_756980 ) ) ( not ( = ?auto_756966 ?auto_756981 ) ) ( not ( = ?auto_756967 ?auto_756968 ) ) ( not ( = ?auto_756967 ?auto_756969 ) ) ( not ( = ?auto_756967 ?auto_756970 ) ) ( not ( = ?auto_756967 ?auto_756971 ) ) ( not ( = ?auto_756967 ?auto_756972 ) ) ( not ( = ?auto_756967 ?auto_756973 ) ) ( not ( = ?auto_756967 ?auto_756974 ) ) ( not ( = ?auto_756967 ?auto_756975 ) ) ( not ( = ?auto_756967 ?auto_756976 ) ) ( not ( = ?auto_756967 ?auto_756977 ) ) ( not ( = ?auto_756967 ?auto_756978 ) ) ( not ( = ?auto_756967 ?auto_756979 ) ) ( not ( = ?auto_756967 ?auto_756980 ) ) ( not ( = ?auto_756967 ?auto_756981 ) ) ( not ( = ?auto_756968 ?auto_756969 ) ) ( not ( = ?auto_756968 ?auto_756970 ) ) ( not ( = ?auto_756968 ?auto_756971 ) ) ( not ( = ?auto_756968 ?auto_756972 ) ) ( not ( = ?auto_756968 ?auto_756973 ) ) ( not ( = ?auto_756968 ?auto_756974 ) ) ( not ( = ?auto_756968 ?auto_756975 ) ) ( not ( = ?auto_756968 ?auto_756976 ) ) ( not ( = ?auto_756968 ?auto_756977 ) ) ( not ( = ?auto_756968 ?auto_756978 ) ) ( not ( = ?auto_756968 ?auto_756979 ) ) ( not ( = ?auto_756968 ?auto_756980 ) ) ( not ( = ?auto_756968 ?auto_756981 ) ) ( not ( = ?auto_756969 ?auto_756970 ) ) ( not ( = ?auto_756969 ?auto_756971 ) ) ( not ( = ?auto_756969 ?auto_756972 ) ) ( not ( = ?auto_756969 ?auto_756973 ) ) ( not ( = ?auto_756969 ?auto_756974 ) ) ( not ( = ?auto_756969 ?auto_756975 ) ) ( not ( = ?auto_756969 ?auto_756976 ) ) ( not ( = ?auto_756969 ?auto_756977 ) ) ( not ( = ?auto_756969 ?auto_756978 ) ) ( not ( = ?auto_756969 ?auto_756979 ) ) ( not ( = ?auto_756969 ?auto_756980 ) ) ( not ( = ?auto_756969 ?auto_756981 ) ) ( not ( = ?auto_756970 ?auto_756971 ) ) ( not ( = ?auto_756970 ?auto_756972 ) ) ( not ( = ?auto_756970 ?auto_756973 ) ) ( not ( = ?auto_756970 ?auto_756974 ) ) ( not ( = ?auto_756970 ?auto_756975 ) ) ( not ( = ?auto_756970 ?auto_756976 ) ) ( not ( = ?auto_756970 ?auto_756977 ) ) ( not ( = ?auto_756970 ?auto_756978 ) ) ( not ( = ?auto_756970 ?auto_756979 ) ) ( not ( = ?auto_756970 ?auto_756980 ) ) ( not ( = ?auto_756970 ?auto_756981 ) ) ( not ( = ?auto_756971 ?auto_756972 ) ) ( not ( = ?auto_756971 ?auto_756973 ) ) ( not ( = ?auto_756971 ?auto_756974 ) ) ( not ( = ?auto_756971 ?auto_756975 ) ) ( not ( = ?auto_756971 ?auto_756976 ) ) ( not ( = ?auto_756971 ?auto_756977 ) ) ( not ( = ?auto_756971 ?auto_756978 ) ) ( not ( = ?auto_756971 ?auto_756979 ) ) ( not ( = ?auto_756971 ?auto_756980 ) ) ( not ( = ?auto_756971 ?auto_756981 ) ) ( not ( = ?auto_756972 ?auto_756973 ) ) ( not ( = ?auto_756972 ?auto_756974 ) ) ( not ( = ?auto_756972 ?auto_756975 ) ) ( not ( = ?auto_756972 ?auto_756976 ) ) ( not ( = ?auto_756972 ?auto_756977 ) ) ( not ( = ?auto_756972 ?auto_756978 ) ) ( not ( = ?auto_756972 ?auto_756979 ) ) ( not ( = ?auto_756972 ?auto_756980 ) ) ( not ( = ?auto_756972 ?auto_756981 ) ) ( not ( = ?auto_756973 ?auto_756974 ) ) ( not ( = ?auto_756973 ?auto_756975 ) ) ( not ( = ?auto_756973 ?auto_756976 ) ) ( not ( = ?auto_756973 ?auto_756977 ) ) ( not ( = ?auto_756973 ?auto_756978 ) ) ( not ( = ?auto_756973 ?auto_756979 ) ) ( not ( = ?auto_756973 ?auto_756980 ) ) ( not ( = ?auto_756973 ?auto_756981 ) ) ( not ( = ?auto_756974 ?auto_756975 ) ) ( not ( = ?auto_756974 ?auto_756976 ) ) ( not ( = ?auto_756974 ?auto_756977 ) ) ( not ( = ?auto_756974 ?auto_756978 ) ) ( not ( = ?auto_756974 ?auto_756979 ) ) ( not ( = ?auto_756974 ?auto_756980 ) ) ( not ( = ?auto_756974 ?auto_756981 ) ) ( not ( = ?auto_756975 ?auto_756976 ) ) ( not ( = ?auto_756975 ?auto_756977 ) ) ( not ( = ?auto_756975 ?auto_756978 ) ) ( not ( = ?auto_756975 ?auto_756979 ) ) ( not ( = ?auto_756975 ?auto_756980 ) ) ( not ( = ?auto_756975 ?auto_756981 ) ) ( not ( = ?auto_756976 ?auto_756977 ) ) ( not ( = ?auto_756976 ?auto_756978 ) ) ( not ( = ?auto_756976 ?auto_756979 ) ) ( not ( = ?auto_756976 ?auto_756980 ) ) ( not ( = ?auto_756976 ?auto_756981 ) ) ( not ( = ?auto_756977 ?auto_756978 ) ) ( not ( = ?auto_756977 ?auto_756979 ) ) ( not ( = ?auto_756977 ?auto_756980 ) ) ( not ( = ?auto_756977 ?auto_756981 ) ) ( not ( = ?auto_756978 ?auto_756979 ) ) ( not ( = ?auto_756978 ?auto_756980 ) ) ( not ( = ?auto_756978 ?auto_756981 ) ) ( not ( = ?auto_756979 ?auto_756980 ) ) ( not ( = ?auto_756979 ?auto_756981 ) ) ( not ( = ?auto_756980 ?auto_756981 ) ) ( ON ?auto_756979 ?auto_756980 ) ( ON ?auto_756978 ?auto_756979 ) ( ON ?auto_756977 ?auto_756978 ) ( ON ?auto_756976 ?auto_756977 ) ( ON ?auto_756975 ?auto_756976 ) ( ON ?auto_756974 ?auto_756975 ) ( ON ?auto_756973 ?auto_756974 ) ( ON ?auto_756972 ?auto_756973 ) ( ON ?auto_756971 ?auto_756972 ) ( ON ?auto_756970 ?auto_756971 ) ( ON ?auto_756969 ?auto_756970 ) ( ON ?auto_756968 ?auto_756969 ) ( ON ?auto_756967 ?auto_756968 ) ( CLEAR ?auto_756965 ) ( ON ?auto_756966 ?auto_756967 ) ( CLEAR ?auto_756966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_756963 ?auto_756964 ?auto_756965 ?auto_756966 )
      ( MAKE-18PILE ?auto_756963 ?auto_756964 ?auto_756965 ?auto_756966 ?auto_756967 ?auto_756968 ?auto_756969 ?auto_756970 ?auto_756971 ?auto_756972 ?auto_756973 ?auto_756974 ?auto_756975 ?auto_756976 ?auto_756977 ?auto_756978 ?auto_756979 ?auto_756980 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757000 - BLOCK
      ?auto_757001 - BLOCK
      ?auto_757002 - BLOCK
      ?auto_757003 - BLOCK
      ?auto_757004 - BLOCK
      ?auto_757005 - BLOCK
      ?auto_757006 - BLOCK
      ?auto_757007 - BLOCK
      ?auto_757008 - BLOCK
      ?auto_757009 - BLOCK
      ?auto_757010 - BLOCK
      ?auto_757011 - BLOCK
      ?auto_757012 - BLOCK
      ?auto_757013 - BLOCK
      ?auto_757014 - BLOCK
      ?auto_757015 - BLOCK
      ?auto_757016 - BLOCK
      ?auto_757017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_757017 ) ( ON-TABLE ?auto_757000 ) ( ON ?auto_757001 ?auto_757000 ) ( ON ?auto_757002 ?auto_757001 ) ( not ( = ?auto_757000 ?auto_757001 ) ) ( not ( = ?auto_757000 ?auto_757002 ) ) ( not ( = ?auto_757000 ?auto_757003 ) ) ( not ( = ?auto_757000 ?auto_757004 ) ) ( not ( = ?auto_757000 ?auto_757005 ) ) ( not ( = ?auto_757000 ?auto_757006 ) ) ( not ( = ?auto_757000 ?auto_757007 ) ) ( not ( = ?auto_757000 ?auto_757008 ) ) ( not ( = ?auto_757000 ?auto_757009 ) ) ( not ( = ?auto_757000 ?auto_757010 ) ) ( not ( = ?auto_757000 ?auto_757011 ) ) ( not ( = ?auto_757000 ?auto_757012 ) ) ( not ( = ?auto_757000 ?auto_757013 ) ) ( not ( = ?auto_757000 ?auto_757014 ) ) ( not ( = ?auto_757000 ?auto_757015 ) ) ( not ( = ?auto_757000 ?auto_757016 ) ) ( not ( = ?auto_757000 ?auto_757017 ) ) ( not ( = ?auto_757001 ?auto_757002 ) ) ( not ( = ?auto_757001 ?auto_757003 ) ) ( not ( = ?auto_757001 ?auto_757004 ) ) ( not ( = ?auto_757001 ?auto_757005 ) ) ( not ( = ?auto_757001 ?auto_757006 ) ) ( not ( = ?auto_757001 ?auto_757007 ) ) ( not ( = ?auto_757001 ?auto_757008 ) ) ( not ( = ?auto_757001 ?auto_757009 ) ) ( not ( = ?auto_757001 ?auto_757010 ) ) ( not ( = ?auto_757001 ?auto_757011 ) ) ( not ( = ?auto_757001 ?auto_757012 ) ) ( not ( = ?auto_757001 ?auto_757013 ) ) ( not ( = ?auto_757001 ?auto_757014 ) ) ( not ( = ?auto_757001 ?auto_757015 ) ) ( not ( = ?auto_757001 ?auto_757016 ) ) ( not ( = ?auto_757001 ?auto_757017 ) ) ( not ( = ?auto_757002 ?auto_757003 ) ) ( not ( = ?auto_757002 ?auto_757004 ) ) ( not ( = ?auto_757002 ?auto_757005 ) ) ( not ( = ?auto_757002 ?auto_757006 ) ) ( not ( = ?auto_757002 ?auto_757007 ) ) ( not ( = ?auto_757002 ?auto_757008 ) ) ( not ( = ?auto_757002 ?auto_757009 ) ) ( not ( = ?auto_757002 ?auto_757010 ) ) ( not ( = ?auto_757002 ?auto_757011 ) ) ( not ( = ?auto_757002 ?auto_757012 ) ) ( not ( = ?auto_757002 ?auto_757013 ) ) ( not ( = ?auto_757002 ?auto_757014 ) ) ( not ( = ?auto_757002 ?auto_757015 ) ) ( not ( = ?auto_757002 ?auto_757016 ) ) ( not ( = ?auto_757002 ?auto_757017 ) ) ( not ( = ?auto_757003 ?auto_757004 ) ) ( not ( = ?auto_757003 ?auto_757005 ) ) ( not ( = ?auto_757003 ?auto_757006 ) ) ( not ( = ?auto_757003 ?auto_757007 ) ) ( not ( = ?auto_757003 ?auto_757008 ) ) ( not ( = ?auto_757003 ?auto_757009 ) ) ( not ( = ?auto_757003 ?auto_757010 ) ) ( not ( = ?auto_757003 ?auto_757011 ) ) ( not ( = ?auto_757003 ?auto_757012 ) ) ( not ( = ?auto_757003 ?auto_757013 ) ) ( not ( = ?auto_757003 ?auto_757014 ) ) ( not ( = ?auto_757003 ?auto_757015 ) ) ( not ( = ?auto_757003 ?auto_757016 ) ) ( not ( = ?auto_757003 ?auto_757017 ) ) ( not ( = ?auto_757004 ?auto_757005 ) ) ( not ( = ?auto_757004 ?auto_757006 ) ) ( not ( = ?auto_757004 ?auto_757007 ) ) ( not ( = ?auto_757004 ?auto_757008 ) ) ( not ( = ?auto_757004 ?auto_757009 ) ) ( not ( = ?auto_757004 ?auto_757010 ) ) ( not ( = ?auto_757004 ?auto_757011 ) ) ( not ( = ?auto_757004 ?auto_757012 ) ) ( not ( = ?auto_757004 ?auto_757013 ) ) ( not ( = ?auto_757004 ?auto_757014 ) ) ( not ( = ?auto_757004 ?auto_757015 ) ) ( not ( = ?auto_757004 ?auto_757016 ) ) ( not ( = ?auto_757004 ?auto_757017 ) ) ( not ( = ?auto_757005 ?auto_757006 ) ) ( not ( = ?auto_757005 ?auto_757007 ) ) ( not ( = ?auto_757005 ?auto_757008 ) ) ( not ( = ?auto_757005 ?auto_757009 ) ) ( not ( = ?auto_757005 ?auto_757010 ) ) ( not ( = ?auto_757005 ?auto_757011 ) ) ( not ( = ?auto_757005 ?auto_757012 ) ) ( not ( = ?auto_757005 ?auto_757013 ) ) ( not ( = ?auto_757005 ?auto_757014 ) ) ( not ( = ?auto_757005 ?auto_757015 ) ) ( not ( = ?auto_757005 ?auto_757016 ) ) ( not ( = ?auto_757005 ?auto_757017 ) ) ( not ( = ?auto_757006 ?auto_757007 ) ) ( not ( = ?auto_757006 ?auto_757008 ) ) ( not ( = ?auto_757006 ?auto_757009 ) ) ( not ( = ?auto_757006 ?auto_757010 ) ) ( not ( = ?auto_757006 ?auto_757011 ) ) ( not ( = ?auto_757006 ?auto_757012 ) ) ( not ( = ?auto_757006 ?auto_757013 ) ) ( not ( = ?auto_757006 ?auto_757014 ) ) ( not ( = ?auto_757006 ?auto_757015 ) ) ( not ( = ?auto_757006 ?auto_757016 ) ) ( not ( = ?auto_757006 ?auto_757017 ) ) ( not ( = ?auto_757007 ?auto_757008 ) ) ( not ( = ?auto_757007 ?auto_757009 ) ) ( not ( = ?auto_757007 ?auto_757010 ) ) ( not ( = ?auto_757007 ?auto_757011 ) ) ( not ( = ?auto_757007 ?auto_757012 ) ) ( not ( = ?auto_757007 ?auto_757013 ) ) ( not ( = ?auto_757007 ?auto_757014 ) ) ( not ( = ?auto_757007 ?auto_757015 ) ) ( not ( = ?auto_757007 ?auto_757016 ) ) ( not ( = ?auto_757007 ?auto_757017 ) ) ( not ( = ?auto_757008 ?auto_757009 ) ) ( not ( = ?auto_757008 ?auto_757010 ) ) ( not ( = ?auto_757008 ?auto_757011 ) ) ( not ( = ?auto_757008 ?auto_757012 ) ) ( not ( = ?auto_757008 ?auto_757013 ) ) ( not ( = ?auto_757008 ?auto_757014 ) ) ( not ( = ?auto_757008 ?auto_757015 ) ) ( not ( = ?auto_757008 ?auto_757016 ) ) ( not ( = ?auto_757008 ?auto_757017 ) ) ( not ( = ?auto_757009 ?auto_757010 ) ) ( not ( = ?auto_757009 ?auto_757011 ) ) ( not ( = ?auto_757009 ?auto_757012 ) ) ( not ( = ?auto_757009 ?auto_757013 ) ) ( not ( = ?auto_757009 ?auto_757014 ) ) ( not ( = ?auto_757009 ?auto_757015 ) ) ( not ( = ?auto_757009 ?auto_757016 ) ) ( not ( = ?auto_757009 ?auto_757017 ) ) ( not ( = ?auto_757010 ?auto_757011 ) ) ( not ( = ?auto_757010 ?auto_757012 ) ) ( not ( = ?auto_757010 ?auto_757013 ) ) ( not ( = ?auto_757010 ?auto_757014 ) ) ( not ( = ?auto_757010 ?auto_757015 ) ) ( not ( = ?auto_757010 ?auto_757016 ) ) ( not ( = ?auto_757010 ?auto_757017 ) ) ( not ( = ?auto_757011 ?auto_757012 ) ) ( not ( = ?auto_757011 ?auto_757013 ) ) ( not ( = ?auto_757011 ?auto_757014 ) ) ( not ( = ?auto_757011 ?auto_757015 ) ) ( not ( = ?auto_757011 ?auto_757016 ) ) ( not ( = ?auto_757011 ?auto_757017 ) ) ( not ( = ?auto_757012 ?auto_757013 ) ) ( not ( = ?auto_757012 ?auto_757014 ) ) ( not ( = ?auto_757012 ?auto_757015 ) ) ( not ( = ?auto_757012 ?auto_757016 ) ) ( not ( = ?auto_757012 ?auto_757017 ) ) ( not ( = ?auto_757013 ?auto_757014 ) ) ( not ( = ?auto_757013 ?auto_757015 ) ) ( not ( = ?auto_757013 ?auto_757016 ) ) ( not ( = ?auto_757013 ?auto_757017 ) ) ( not ( = ?auto_757014 ?auto_757015 ) ) ( not ( = ?auto_757014 ?auto_757016 ) ) ( not ( = ?auto_757014 ?auto_757017 ) ) ( not ( = ?auto_757015 ?auto_757016 ) ) ( not ( = ?auto_757015 ?auto_757017 ) ) ( not ( = ?auto_757016 ?auto_757017 ) ) ( ON ?auto_757016 ?auto_757017 ) ( ON ?auto_757015 ?auto_757016 ) ( ON ?auto_757014 ?auto_757015 ) ( ON ?auto_757013 ?auto_757014 ) ( ON ?auto_757012 ?auto_757013 ) ( ON ?auto_757011 ?auto_757012 ) ( ON ?auto_757010 ?auto_757011 ) ( ON ?auto_757009 ?auto_757010 ) ( ON ?auto_757008 ?auto_757009 ) ( ON ?auto_757007 ?auto_757008 ) ( ON ?auto_757006 ?auto_757007 ) ( ON ?auto_757005 ?auto_757006 ) ( ON ?auto_757004 ?auto_757005 ) ( CLEAR ?auto_757002 ) ( ON ?auto_757003 ?auto_757004 ) ( CLEAR ?auto_757003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_757000 ?auto_757001 ?auto_757002 ?auto_757003 )
      ( MAKE-18PILE ?auto_757000 ?auto_757001 ?auto_757002 ?auto_757003 ?auto_757004 ?auto_757005 ?auto_757006 ?auto_757007 ?auto_757008 ?auto_757009 ?auto_757010 ?auto_757011 ?auto_757012 ?auto_757013 ?auto_757014 ?auto_757015 ?auto_757016 ?auto_757017 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757036 - BLOCK
      ?auto_757037 - BLOCK
      ?auto_757038 - BLOCK
      ?auto_757039 - BLOCK
      ?auto_757040 - BLOCK
      ?auto_757041 - BLOCK
      ?auto_757042 - BLOCK
      ?auto_757043 - BLOCK
      ?auto_757044 - BLOCK
      ?auto_757045 - BLOCK
      ?auto_757046 - BLOCK
      ?auto_757047 - BLOCK
      ?auto_757048 - BLOCK
      ?auto_757049 - BLOCK
      ?auto_757050 - BLOCK
      ?auto_757051 - BLOCK
      ?auto_757052 - BLOCK
      ?auto_757053 - BLOCK
    )
    :vars
    (
      ?auto_757054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757053 ?auto_757054 ) ( ON-TABLE ?auto_757036 ) ( ON ?auto_757037 ?auto_757036 ) ( not ( = ?auto_757036 ?auto_757037 ) ) ( not ( = ?auto_757036 ?auto_757038 ) ) ( not ( = ?auto_757036 ?auto_757039 ) ) ( not ( = ?auto_757036 ?auto_757040 ) ) ( not ( = ?auto_757036 ?auto_757041 ) ) ( not ( = ?auto_757036 ?auto_757042 ) ) ( not ( = ?auto_757036 ?auto_757043 ) ) ( not ( = ?auto_757036 ?auto_757044 ) ) ( not ( = ?auto_757036 ?auto_757045 ) ) ( not ( = ?auto_757036 ?auto_757046 ) ) ( not ( = ?auto_757036 ?auto_757047 ) ) ( not ( = ?auto_757036 ?auto_757048 ) ) ( not ( = ?auto_757036 ?auto_757049 ) ) ( not ( = ?auto_757036 ?auto_757050 ) ) ( not ( = ?auto_757036 ?auto_757051 ) ) ( not ( = ?auto_757036 ?auto_757052 ) ) ( not ( = ?auto_757036 ?auto_757053 ) ) ( not ( = ?auto_757036 ?auto_757054 ) ) ( not ( = ?auto_757037 ?auto_757038 ) ) ( not ( = ?auto_757037 ?auto_757039 ) ) ( not ( = ?auto_757037 ?auto_757040 ) ) ( not ( = ?auto_757037 ?auto_757041 ) ) ( not ( = ?auto_757037 ?auto_757042 ) ) ( not ( = ?auto_757037 ?auto_757043 ) ) ( not ( = ?auto_757037 ?auto_757044 ) ) ( not ( = ?auto_757037 ?auto_757045 ) ) ( not ( = ?auto_757037 ?auto_757046 ) ) ( not ( = ?auto_757037 ?auto_757047 ) ) ( not ( = ?auto_757037 ?auto_757048 ) ) ( not ( = ?auto_757037 ?auto_757049 ) ) ( not ( = ?auto_757037 ?auto_757050 ) ) ( not ( = ?auto_757037 ?auto_757051 ) ) ( not ( = ?auto_757037 ?auto_757052 ) ) ( not ( = ?auto_757037 ?auto_757053 ) ) ( not ( = ?auto_757037 ?auto_757054 ) ) ( not ( = ?auto_757038 ?auto_757039 ) ) ( not ( = ?auto_757038 ?auto_757040 ) ) ( not ( = ?auto_757038 ?auto_757041 ) ) ( not ( = ?auto_757038 ?auto_757042 ) ) ( not ( = ?auto_757038 ?auto_757043 ) ) ( not ( = ?auto_757038 ?auto_757044 ) ) ( not ( = ?auto_757038 ?auto_757045 ) ) ( not ( = ?auto_757038 ?auto_757046 ) ) ( not ( = ?auto_757038 ?auto_757047 ) ) ( not ( = ?auto_757038 ?auto_757048 ) ) ( not ( = ?auto_757038 ?auto_757049 ) ) ( not ( = ?auto_757038 ?auto_757050 ) ) ( not ( = ?auto_757038 ?auto_757051 ) ) ( not ( = ?auto_757038 ?auto_757052 ) ) ( not ( = ?auto_757038 ?auto_757053 ) ) ( not ( = ?auto_757038 ?auto_757054 ) ) ( not ( = ?auto_757039 ?auto_757040 ) ) ( not ( = ?auto_757039 ?auto_757041 ) ) ( not ( = ?auto_757039 ?auto_757042 ) ) ( not ( = ?auto_757039 ?auto_757043 ) ) ( not ( = ?auto_757039 ?auto_757044 ) ) ( not ( = ?auto_757039 ?auto_757045 ) ) ( not ( = ?auto_757039 ?auto_757046 ) ) ( not ( = ?auto_757039 ?auto_757047 ) ) ( not ( = ?auto_757039 ?auto_757048 ) ) ( not ( = ?auto_757039 ?auto_757049 ) ) ( not ( = ?auto_757039 ?auto_757050 ) ) ( not ( = ?auto_757039 ?auto_757051 ) ) ( not ( = ?auto_757039 ?auto_757052 ) ) ( not ( = ?auto_757039 ?auto_757053 ) ) ( not ( = ?auto_757039 ?auto_757054 ) ) ( not ( = ?auto_757040 ?auto_757041 ) ) ( not ( = ?auto_757040 ?auto_757042 ) ) ( not ( = ?auto_757040 ?auto_757043 ) ) ( not ( = ?auto_757040 ?auto_757044 ) ) ( not ( = ?auto_757040 ?auto_757045 ) ) ( not ( = ?auto_757040 ?auto_757046 ) ) ( not ( = ?auto_757040 ?auto_757047 ) ) ( not ( = ?auto_757040 ?auto_757048 ) ) ( not ( = ?auto_757040 ?auto_757049 ) ) ( not ( = ?auto_757040 ?auto_757050 ) ) ( not ( = ?auto_757040 ?auto_757051 ) ) ( not ( = ?auto_757040 ?auto_757052 ) ) ( not ( = ?auto_757040 ?auto_757053 ) ) ( not ( = ?auto_757040 ?auto_757054 ) ) ( not ( = ?auto_757041 ?auto_757042 ) ) ( not ( = ?auto_757041 ?auto_757043 ) ) ( not ( = ?auto_757041 ?auto_757044 ) ) ( not ( = ?auto_757041 ?auto_757045 ) ) ( not ( = ?auto_757041 ?auto_757046 ) ) ( not ( = ?auto_757041 ?auto_757047 ) ) ( not ( = ?auto_757041 ?auto_757048 ) ) ( not ( = ?auto_757041 ?auto_757049 ) ) ( not ( = ?auto_757041 ?auto_757050 ) ) ( not ( = ?auto_757041 ?auto_757051 ) ) ( not ( = ?auto_757041 ?auto_757052 ) ) ( not ( = ?auto_757041 ?auto_757053 ) ) ( not ( = ?auto_757041 ?auto_757054 ) ) ( not ( = ?auto_757042 ?auto_757043 ) ) ( not ( = ?auto_757042 ?auto_757044 ) ) ( not ( = ?auto_757042 ?auto_757045 ) ) ( not ( = ?auto_757042 ?auto_757046 ) ) ( not ( = ?auto_757042 ?auto_757047 ) ) ( not ( = ?auto_757042 ?auto_757048 ) ) ( not ( = ?auto_757042 ?auto_757049 ) ) ( not ( = ?auto_757042 ?auto_757050 ) ) ( not ( = ?auto_757042 ?auto_757051 ) ) ( not ( = ?auto_757042 ?auto_757052 ) ) ( not ( = ?auto_757042 ?auto_757053 ) ) ( not ( = ?auto_757042 ?auto_757054 ) ) ( not ( = ?auto_757043 ?auto_757044 ) ) ( not ( = ?auto_757043 ?auto_757045 ) ) ( not ( = ?auto_757043 ?auto_757046 ) ) ( not ( = ?auto_757043 ?auto_757047 ) ) ( not ( = ?auto_757043 ?auto_757048 ) ) ( not ( = ?auto_757043 ?auto_757049 ) ) ( not ( = ?auto_757043 ?auto_757050 ) ) ( not ( = ?auto_757043 ?auto_757051 ) ) ( not ( = ?auto_757043 ?auto_757052 ) ) ( not ( = ?auto_757043 ?auto_757053 ) ) ( not ( = ?auto_757043 ?auto_757054 ) ) ( not ( = ?auto_757044 ?auto_757045 ) ) ( not ( = ?auto_757044 ?auto_757046 ) ) ( not ( = ?auto_757044 ?auto_757047 ) ) ( not ( = ?auto_757044 ?auto_757048 ) ) ( not ( = ?auto_757044 ?auto_757049 ) ) ( not ( = ?auto_757044 ?auto_757050 ) ) ( not ( = ?auto_757044 ?auto_757051 ) ) ( not ( = ?auto_757044 ?auto_757052 ) ) ( not ( = ?auto_757044 ?auto_757053 ) ) ( not ( = ?auto_757044 ?auto_757054 ) ) ( not ( = ?auto_757045 ?auto_757046 ) ) ( not ( = ?auto_757045 ?auto_757047 ) ) ( not ( = ?auto_757045 ?auto_757048 ) ) ( not ( = ?auto_757045 ?auto_757049 ) ) ( not ( = ?auto_757045 ?auto_757050 ) ) ( not ( = ?auto_757045 ?auto_757051 ) ) ( not ( = ?auto_757045 ?auto_757052 ) ) ( not ( = ?auto_757045 ?auto_757053 ) ) ( not ( = ?auto_757045 ?auto_757054 ) ) ( not ( = ?auto_757046 ?auto_757047 ) ) ( not ( = ?auto_757046 ?auto_757048 ) ) ( not ( = ?auto_757046 ?auto_757049 ) ) ( not ( = ?auto_757046 ?auto_757050 ) ) ( not ( = ?auto_757046 ?auto_757051 ) ) ( not ( = ?auto_757046 ?auto_757052 ) ) ( not ( = ?auto_757046 ?auto_757053 ) ) ( not ( = ?auto_757046 ?auto_757054 ) ) ( not ( = ?auto_757047 ?auto_757048 ) ) ( not ( = ?auto_757047 ?auto_757049 ) ) ( not ( = ?auto_757047 ?auto_757050 ) ) ( not ( = ?auto_757047 ?auto_757051 ) ) ( not ( = ?auto_757047 ?auto_757052 ) ) ( not ( = ?auto_757047 ?auto_757053 ) ) ( not ( = ?auto_757047 ?auto_757054 ) ) ( not ( = ?auto_757048 ?auto_757049 ) ) ( not ( = ?auto_757048 ?auto_757050 ) ) ( not ( = ?auto_757048 ?auto_757051 ) ) ( not ( = ?auto_757048 ?auto_757052 ) ) ( not ( = ?auto_757048 ?auto_757053 ) ) ( not ( = ?auto_757048 ?auto_757054 ) ) ( not ( = ?auto_757049 ?auto_757050 ) ) ( not ( = ?auto_757049 ?auto_757051 ) ) ( not ( = ?auto_757049 ?auto_757052 ) ) ( not ( = ?auto_757049 ?auto_757053 ) ) ( not ( = ?auto_757049 ?auto_757054 ) ) ( not ( = ?auto_757050 ?auto_757051 ) ) ( not ( = ?auto_757050 ?auto_757052 ) ) ( not ( = ?auto_757050 ?auto_757053 ) ) ( not ( = ?auto_757050 ?auto_757054 ) ) ( not ( = ?auto_757051 ?auto_757052 ) ) ( not ( = ?auto_757051 ?auto_757053 ) ) ( not ( = ?auto_757051 ?auto_757054 ) ) ( not ( = ?auto_757052 ?auto_757053 ) ) ( not ( = ?auto_757052 ?auto_757054 ) ) ( not ( = ?auto_757053 ?auto_757054 ) ) ( ON ?auto_757052 ?auto_757053 ) ( ON ?auto_757051 ?auto_757052 ) ( ON ?auto_757050 ?auto_757051 ) ( ON ?auto_757049 ?auto_757050 ) ( ON ?auto_757048 ?auto_757049 ) ( ON ?auto_757047 ?auto_757048 ) ( ON ?auto_757046 ?auto_757047 ) ( ON ?auto_757045 ?auto_757046 ) ( ON ?auto_757044 ?auto_757045 ) ( ON ?auto_757043 ?auto_757044 ) ( ON ?auto_757042 ?auto_757043 ) ( ON ?auto_757041 ?auto_757042 ) ( ON ?auto_757040 ?auto_757041 ) ( ON ?auto_757039 ?auto_757040 ) ( CLEAR ?auto_757037 ) ( ON ?auto_757038 ?auto_757039 ) ( CLEAR ?auto_757038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_757036 ?auto_757037 ?auto_757038 )
      ( MAKE-18PILE ?auto_757036 ?auto_757037 ?auto_757038 ?auto_757039 ?auto_757040 ?auto_757041 ?auto_757042 ?auto_757043 ?auto_757044 ?auto_757045 ?auto_757046 ?auto_757047 ?auto_757048 ?auto_757049 ?auto_757050 ?auto_757051 ?auto_757052 ?auto_757053 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757073 - BLOCK
      ?auto_757074 - BLOCK
      ?auto_757075 - BLOCK
      ?auto_757076 - BLOCK
      ?auto_757077 - BLOCK
      ?auto_757078 - BLOCK
      ?auto_757079 - BLOCK
      ?auto_757080 - BLOCK
      ?auto_757081 - BLOCK
      ?auto_757082 - BLOCK
      ?auto_757083 - BLOCK
      ?auto_757084 - BLOCK
      ?auto_757085 - BLOCK
      ?auto_757086 - BLOCK
      ?auto_757087 - BLOCK
      ?auto_757088 - BLOCK
      ?auto_757089 - BLOCK
      ?auto_757090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_757090 ) ( ON-TABLE ?auto_757073 ) ( ON ?auto_757074 ?auto_757073 ) ( not ( = ?auto_757073 ?auto_757074 ) ) ( not ( = ?auto_757073 ?auto_757075 ) ) ( not ( = ?auto_757073 ?auto_757076 ) ) ( not ( = ?auto_757073 ?auto_757077 ) ) ( not ( = ?auto_757073 ?auto_757078 ) ) ( not ( = ?auto_757073 ?auto_757079 ) ) ( not ( = ?auto_757073 ?auto_757080 ) ) ( not ( = ?auto_757073 ?auto_757081 ) ) ( not ( = ?auto_757073 ?auto_757082 ) ) ( not ( = ?auto_757073 ?auto_757083 ) ) ( not ( = ?auto_757073 ?auto_757084 ) ) ( not ( = ?auto_757073 ?auto_757085 ) ) ( not ( = ?auto_757073 ?auto_757086 ) ) ( not ( = ?auto_757073 ?auto_757087 ) ) ( not ( = ?auto_757073 ?auto_757088 ) ) ( not ( = ?auto_757073 ?auto_757089 ) ) ( not ( = ?auto_757073 ?auto_757090 ) ) ( not ( = ?auto_757074 ?auto_757075 ) ) ( not ( = ?auto_757074 ?auto_757076 ) ) ( not ( = ?auto_757074 ?auto_757077 ) ) ( not ( = ?auto_757074 ?auto_757078 ) ) ( not ( = ?auto_757074 ?auto_757079 ) ) ( not ( = ?auto_757074 ?auto_757080 ) ) ( not ( = ?auto_757074 ?auto_757081 ) ) ( not ( = ?auto_757074 ?auto_757082 ) ) ( not ( = ?auto_757074 ?auto_757083 ) ) ( not ( = ?auto_757074 ?auto_757084 ) ) ( not ( = ?auto_757074 ?auto_757085 ) ) ( not ( = ?auto_757074 ?auto_757086 ) ) ( not ( = ?auto_757074 ?auto_757087 ) ) ( not ( = ?auto_757074 ?auto_757088 ) ) ( not ( = ?auto_757074 ?auto_757089 ) ) ( not ( = ?auto_757074 ?auto_757090 ) ) ( not ( = ?auto_757075 ?auto_757076 ) ) ( not ( = ?auto_757075 ?auto_757077 ) ) ( not ( = ?auto_757075 ?auto_757078 ) ) ( not ( = ?auto_757075 ?auto_757079 ) ) ( not ( = ?auto_757075 ?auto_757080 ) ) ( not ( = ?auto_757075 ?auto_757081 ) ) ( not ( = ?auto_757075 ?auto_757082 ) ) ( not ( = ?auto_757075 ?auto_757083 ) ) ( not ( = ?auto_757075 ?auto_757084 ) ) ( not ( = ?auto_757075 ?auto_757085 ) ) ( not ( = ?auto_757075 ?auto_757086 ) ) ( not ( = ?auto_757075 ?auto_757087 ) ) ( not ( = ?auto_757075 ?auto_757088 ) ) ( not ( = ?auto_757075 ?auto_757089 ) ) ( not ( = ?auto_757075 ?auto_757090 ) ) ( not ( = ?auto_757076 ?auto_757077 ) ) ( not ( = ?auto_757076 ?auto_757078 ) ) ( not ( = ?auto_757076 ?auto_757079 ) ) ( not ( = ?auto_757076 ?auto_757080 ) ) ( not ( = ?auto_757076 ?auto_757081 ) ) ( not ( = ?auto_757076 ?auto_757082 ) ) ( not ( = ?auto_757076 ?auto_757083 ) ) ( not ( = ?auto_757076 ?auto_757084 ) ) ( not ( = ?auto_757076 ?auto_757085 ) ) ( not ( = ?auto_757076 ?auto_757086 ) ) ( not ( = ?auto_757076 ?auto_757087 ) ) ( not ( = ?auto_757076 ?auto_757088 ) ) ( not ( = ?auto_757076 ?auto_757089 ) ) ( not ( = ?auto_757076 ?auto_757090 ) ) ( not ( = ?auto_757077 ?auto_757078 ) ) ( not ( = ?auto_757077 ?auto_757079 ) ) ( not ( = ?auto_757077 ?auto_757080 ) ) ( not ( = ?auto_757077 ?auto_757081 ) ) ( not ( = ?auto_757077 ?auto_757082 ) ) ( not ( = ?auto_757077 ?auto_757083 ) ) ( not ( = ?auto_757077 ?auto_757084 ) ) ( not ( = ?auto_757077 ?auto_757085 ) ) ( not ( = ?auto_757077 ?auto_757086 ) ) ( not ( = ?auto_757077 ?auto_757087 ) ) ( not ( = ?auto_757077 ?auto_757088 ) ) ( not ( = ?auto_757077 ?auto_757089 ) ) ( not ( = ?auto_757077 ?auto_757090 ) ) ( not ( = ?auto_757078 ?auto_757079 ) ) ( not ( = ?auto_757078 ?auto_757080 ) ) ( not ( = ?auto_757078 ?auto_757081 ) ) ( not ( = ?auto_757078 ?auto_757082 ) ) ( not ( = ?auto_757078 ?auto_757083 ) ) ( not ( = ?auto_757078 ?auto_757084 ) ) ( not ( = ?auto_757078 ?auto_757085 ) ) ( not ( = ?auto_757078 ?auto_757086 ) ) ( not ( = ?auto_757078 ?auto_757087 ) ) ( not ( = ?auto_757078 ?auto_757088 ) ) ( not ( = ?auto_757078 ?auto_757089 ) ) ( not ( = ?auto_757078 ?auto_757090 ) ) ( not ( = ?auto_757079 ?auto_757080 ) ) ( not ( = ?auto_757079 ?auto_757081 ) ) ( not ( = ?auto_757079 ?auto_757082 ) ) ( not ( = ?auto_757079 ?auto_757083 ) ) ( not ( = ?auto_757079 ?auto_757084 ) ) ( not ( = ?auto_757079 ?auto_757085 ) ) ( not ( = ?auto_757079 ?auto_757086 ) ) ( not ( = ?auto_757079 ?auto_757087 ) ) ( not ( = ?auto_757079 ?auto_757088 ) ) ( not ( = ?auto_757079 ?auto_757089 ) ) ( not ( = ?auto_757079 ?auto_757090 ) ) ( not ( = ?auto_757080 ?auto_757081 ) ) ( not ( = ?auto_757080 ?auto_757082 ) ) ( not ( = ?auto_757080 ?auto_757083 ) ) ( not ( = ?auto_757080 ?auto_757084 ) ) ( not ( = ?auto_757080 ?auto_757085 ) ) ( not ( = ?auto_757080 ?auto_757086 ) ) ( not ( = ?auto_757080 ?auto_757087 ) ) ( not ( = ?auto_757080 ?auto_757088 ) ) ( not ( = ?auto_757080 ?auto_757089 ) ) ( not ( = ?auto_757080 ?auto_757090 ) ) ( not ( = ?auto_757081 ?auto_757082 ) ) ( not ( = ?auto_757081 ?auto_757083 ) ) ( not ( = ?auto_757081 ?auto_757084 ) ) ( not ( = ?auto_757081 ?auto_757085 ) ) ( not ( = ?auto_757081 ?auto_757086 ) ) ( not ( = ?auto_757081 ?auto_757087 ) ) ( not ( = ?auto_757081 ?auto_757088 ) ) ( not ( = ?auto_757081 ?auto_757089 ) ) ( not ( = ?auto_757081 ?auto_757090 ) ) ( not ( = ?auto_757082 ?auto_757083 ) ) ( not ( = ?auto_757082 ?auto_757084 ) ) ( not ( = ?auto_757082 ?auto_757085 ) ) ( not ( = ?auto_757082 ?auto_757086 ) ) ( not ( = ?auto_757082 ?auto_757087 ) ) ( not ( = ?auto_757082 ?auto_757088 ) ) ( not ( = ?auto_757082 ?auto_757089 ) ) ( not ( = ?auto_757082 ?auto_757090 ) ) ( not ( = ?auto_757083 ?auto_757084 ) ) ( not ( = ?auto_757083 ?auto_757085 ) ) ( not ( = ?auto_757083 ?auto_757086 ) ) ( not ( = ?auto_757083 ?auto_757087 ) ) ( not ( = ?auto_757083 ?auto_757088 ) ) ( not ( = ?auto_757083 ?auto_757089 ) ) ( not ( = ?auto_757083 ?auto_757090 ) ) ( not ( = ?auto_757084 ?auto_757085 ) ) ( not ( = ?auto_757084 ?auto_757086 ) ) ( not ( = ?auto_757084 ?auto_757087 ) ) ( not ( = ?auto_757084 ?auto_757088 ) ) ( not ( = ?auto_757084 ?auto_757089 ) ) ( not ( = ?auto_757084 ?auto_757090 ) ) ( not ( = ?auto_757085 ?auto_757086 ) ) ( not ( = ?auto_757085 ?auto_757087 ) ) ( not ( = ?auto_757085 ?auto_757088 ) ) ( not ( = ?auto_757085 ?auto_757089 ) ) ( not ( = ?auto_757085 ?auto_757090 ) ) ( not ( = ?auto_757086 ?auto_757087 ) ) ( not ( = ?auto_757086 ?auto_757088 ) ) ( not ( = ?auto_757086 ?auto_757089 ) ) ( not ( = ?auto_757086 ?auto_757090 ) ) ( not ( = ?auto_757087 ?auto_757088 ) ) ( not ( = ?auto_757087 ?auto_757089 ) ) ( not ( = ?auto_757087 ?auto_757090 ) ) ( not ( = ?auto_757088 ?auto_757089 ) ) ( not ( = ?auto_757088 ?auto_757090 ) ) ( not ( = ?auto_757089 ?auto_757090 ) ) ( ON ?auto_757089 ?auto_757090 ) ( ON ?auto_757088 ?auto_757089 ) ( ON ?auto_757087 ?auto_757088 ) ( ON ?auto_757086 ?auto_757087 ) ( ON ?auto_757085 ?auto_757086 ) ( ON ?auto_757084 ?auto_757085 ) ( ON ?auto_757083 ?auto_757084 ) ( ON ?auto_757082 ?auto_757083 ) ( ON ?auto_757081 ?auto_757082 ) ( ON ?auto_757080 ?auto_757081 ) ( ON ?auto_757079 ?auto_757080 ) ( ON ?auto_757078 ?auto_757079 ) ( ON ?auto_757077 ?auto_757078 ) ( ON ?auto_757076 ?auto_757077 ) ( CLEAR ?auto_757074 ) ( ON ?auto_757075 ?auto_757076 ) ( CLEAR ?auto_757075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_757073 ?auto_757074 ?auto_757075 )
      ( MAKE-18PILE ?auto_757073 ?auto_757074 ?auto_757075 ?auto_757076 ?auto_757077 ?auto_757078 ?auto_757079 ?auto_757080 ?auto_757081 ?auto_757082 ?auto_757083 ?auto_757084 ?auto_757085 ?auto_757086 ?auto_757087 ?auto_757088 ?auto_757089 ?auto_757090 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757109 - BLOCK
      ?auto_757110 - BLOCK
      ?auto_757111 - BLOCK
      ?auto_757112 - BLOCK
      ?auto_757113 - BLOCK
      ?auto_757114 - BLOCK
      ?auto_757115 - BLOCK
      ?auto_757116 - BLOCK
      ?auto_757117 - BLOCK
      ?auto_757118 - BLOCK
      ?auto_757119 - BLOCK
      ?auto_757120 - BLOCK
      ?auto_757121 - BLOCK
      ?auto_757122 - BLOCK
      ?auto_757123 - BLOCK
      ?auto_757124 - BLOCK
      ?auto_757125 - BLOCK
      ?auto_757126 - BLOCK
    )
    :vars
    (
      ?auto_757127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757126 ?auto_757127 ) ( ON-TABLE ?auto_757109 ) ( not ( = ?auto_757109 ?auto_757110 ) ) ( not ( = ?auto_757109 ?auto_757111 ) ) ( not ( = ?auto_757109 ?auto_757112 ) ) ( not ( = ?auto_757109 ?auto_757113 ) ) ( not ( = ?auto_757109 ?auto_757114 ) ) ( not ( = ?auto_757109 ?auto_757115 ) ) ( not ( = ?auto_757109 ?auto_757116 ) ) ( not ( = ?auto_757109 ?auto_757117 ) ) ( not ( = ?auto_757109 ?auto_757118 ) ) ( not ( = ?auto_757109 ?auto_757119 ) ) ( not ( = ?auto_757109 ?auto_757120 ) ) ( not ( = ?auto_757109 ?auto_757121 ) ) ( not ( = ?auto_757109 ?auto_757122 ) ) ( not ( = ?auto_757109 ?auto_757123 ) ) ( not ( = ?auto_757109 ?auto_757124 ) ) ( not ( = ?auto_757109 ?auto_757125 ) ) ( not ( = ?auto_757109 ?auto_757126 ) ) ( not ( = ?auto_757109 ?auto_757127 ) ) ( not ( = ?auto_757110 ?auto_757111 ) ) ( not ( = ?auto_757110 ?auto_757112 ) ) ( not ( = ?auto_757110 ?auto_757113 ) ) ( not ( = ?auto_757110 ?auto_757114 ) ) ( not ( = ?auto_757110 ?auto_757115 ) ) ( not ( = ?auto_757110 ?auto_757116 ) ) ( not ( = ?auto_757110 ?auto_757117 ) ) ( not ( = ?auto_757110 ?auto_757118 ) ) ( not ( = ?auto_757110 ?auto_757119 ) ) ( not ( = ?auto_757110 ?auto_757120 ) ) ( not ( = ?auto_757110 ?auto_757121 ) ) ( not ( = ?auto_757110 ?auto_757122 ) ) ( not ( = ?auto_757110 ?auto_757123 ) ) ( not ( = ?auto_757110 ?auto_757124 ) ) ( not ( = ?auto_757110 ?auto_757125 ) ) ( not ( = ?auto_757110 ?auto_757126 ) ) ( not ( = ?auto_757110 ?auto_757127 ) ) ( not ( = ?auto_757111 ?auto_757112 ) ) ( not ( = ?auto_757111 ?auto_757113 ) ) ( not ( = ?auto_757111 ?auto_757114 ) ) ( not ( = ?auto_757111 ?auto_757115 ) ) ( not ( = ?auto_757111 ?auto_757116 ) ) ( not ( = ?auto_757111 ?auto_757117 ) ) ( not ( = ?auto_757111 ?auto_757118 ) ) ( not ( = ?auto_757111 ?auto_757119 ) ) ( not ( = ?auto_757111 ?auto_757120 ) ) ( not ( = ?auto_757111 ?auto_757121 ) ) ( not ( = ?auto_757111 ?auto_757122 ) ) ( not ( = ?auto_757111 ?auto_757123 ) ) ( not ( = ?auto_757111 ?auto_757124 ) ) ( not ( = ?auto_757111 ?auto_757125 ) ) ( not ( = ?auto_757111 ?auto_757126 ) ) ( not ( = ?auto_757111 ?auto_757127 ) ) ( not ( = ?auto_757112 ?auto_757113 ) ) ( not ( = ?auto_757112 ?auto_757114 ) ) ( not ( = ?auto_757112 ?auto_757115 ) ) ( not ( = ?auto_757112 ?auto_757116 ) ) ( not ( = ?auto_757112 ?auto_757117 ) ) ( not ( = ?auto_757112 ?auto_757118 ) ) ( not ( = ?auto_757112 ?auto_757119 ) ) ( not ( = ?auto_757112 ?auto_757120 ) ) ( not ( = ?auto_757112 ?auto_757121 ) ) ( not ( = ?auto_757112 ?auto_757122 ) ) ( not ( = ?auto_757112 ?auto_757123 ) ) ( not ( = ?auto_757112 ?auto_757124 ) ) ( not ( = ?auto_757112 ?auto_757125 ) ) ( not ( = ?auto_757112 ?auto_757126 ) ) ( not ( = ?auto_757112 ?auto_757127 ) ) ( not ( = ?auto_757113 ?auto_757114 ) ) ( not ( = ?auto_757113 ?auto_757115 ) ) ( not ( = ?auto_757113 ?auto_757116 ) ) ( not ( = ?auto_757113 ?auto_757117 ) ) ( not ( = ?auto_757113 ?auto_757118 ) ) ( not ( = ?auto_757113 ?auto_757119 ) ) ( not ( = ?auto_757113 ?auto_757120 ) ) ( not ( = ?auto_757113 ?auto_757121 ) ) ( not ( = ?auto_757113 ?auto_757122 ) ) ( not ( = ?auto_757113 ?auto_757123 ) ) ( not ( = ?auto_757113 ?auto_757124 ) ) ( not ( = ?auto_757113 ?auto_757125 ) ) ( not ( = ?auto_757113 ?auto_757126 ) ) ( not ( = ?auto_757113 ?auto_757127 ) ) ( not ( = ?auto_757114 ?auto_757115 ) ) ( not ( = ?auto_757114 ?auto_757116 ) ) ( not ( = ?auto_757114 ?auto_757117 ) ) ( not ( = ?auto_757114 ?auto_757118 ) ) ( not ( = ?auto_757114 ?auto_757119 ) ) ( not ( = ?auto_757114 ?auto_757120 ) ) ( not ( = ?auto_757114 ?auto_757121 ) ) ( not ( = ?auto_757114 ?auto_757122 ) ) ( not ( = ?auto_757114 ?auto_757123 ) ) ( not ( = ?auto_757114 ?auto_757124 ) ) ( not ( = ?auto_757114 ?auto_757125 ) ) ( not ( = ?auto_757114 ?auto_757126 ) ) ( not ( = ?auto_757114 ?auto_757127 ) ) ( not ( = ?auto_757115 ?auto_757116 ) ) ( not ( = ?auto_757115 ?auto_757117 ) ) ( not ( = ?auto_757115 ?auto_757118 ) ) ( not ( = ?auto_757115 ?auto_757119 ) ) ( not ( = ?auto_757115 ?auto_757120 ) ) ( not ( = ?auto_757115 ?auto_757121 ) ) ( not ( = ?auto_757115 ?auto_757122 ) ) ( not ( = ?auto_757115 ?auto_757123 ) ) ( not ( = ?auto_757115 ?auto_757124 ) ) ( not ( = ?auto_757115 ?auto_757125 ) ) ( not ( = ?auto_757115 ?auto_757126 ) ) ( not ( = ?auto_757115 ?auto_757127 ) ) ( not ( = ?auto_757116 ?auto_757117 ) ) ( not ( = ?auto_757116 ?auto_757118 ) ) ( not ( = ?auto_757116 ?auto_757119 ) ) ( not ( = ?auto_757116 ?auto_757120 ) ) ( not ( = ?auto_757116 ?auto_757121 ) ) ( not ( = ?auto_757116 ?auto_757122 ) ) ( not ( = ?auto_757116 ?auto_757123 ) ) ( not ( = ?auto_757116 ?auto_757124 ) ) ( not ( = ?auto_757116 ?auto_757125 ) ) ( not ( = ?auto_757116 ?auto_757126 ) ) ( not ( = ?auto_757116 ?auto_757127 ) ) ( not ( = ?auto_757117 ?auto_757118 ) ) ( not ( = ?auto_757117 ?auto_757119 ) ) ( not ( = ?auto_757117 ?auto_757120 ) ) ( not ( = ?auto_757117 ?auto_757121 ) ) ( not ( = ?auto_757117 ?auto_757122 ) ) ( not ( = ?auto_757117 ?auto_757123 ) ) ( not ( = ?auto_757117 ?auto_757124 ) ) ( not ( = ?auto_757117 ?auto_757125 ) ) ( not ( = ?auto_757117 ?auto_757126 ) ) ( not ( = ?auto_757117 ?auto_757127 ) ) ( not ( = ?auto_757118 ?auto_757119 ) ) ( not ( = ?auto_757118 ?auto_757120 ) ) ( not ( = ?auto_757118 ?auto_757121 ) ) ( not ( = ?auto_757118 ?auto_757122 ) ) ( not ( = ?auto_757118 ?auto_757123 ) ) ( not ( = ?auto_757118 ?auto_757124 ) ) ( not ( = ?auto_757118 ?auto_757125 ) ) ( not ( = ?auto_757118 ?auto_757126 ) ) ( not ( = ?auto_757118 ?auto_757127 ) ) ( not ( = ?auto_757119 ?auto_757120 ) ) ( not ( = ?auto_757119 ?auto_757121 ) ) ( not ( = ?auto_757119 ?auto_757122 ) ) ( not ( = ?auto_757119 ?auto_757123 ) ) ( not ( = ?auto_757119 ?auto_757124 ) ) ( not ( = ?auto_757119 ?auto_757125 ) ) ( not ( = ?auto_757119 ?auto_757126 ) ) ( not ( = ?auto_757119 ?auto_757127 ) ) ( not ( = ?auto_757120 ?auto_757121 ) ) ( not ( = ?auto_757120 ?auto_757122 ) ) ( not ( = ?auto_757120 ?auto_757123 ) ) ( not ( = ?auto_757120 ?auto_757124 ) ) ( not ( = ?auto_757120 ?auto_757125 ) ) ( not ( = ?auto_757120 ?auto_757126 ) ) ( not ( = ?auto_757120 ?auto_757127 ) ) ( not ( = ?auto_757121 ?auto_757122 ) ) ( not ( = ?auto_757121 ?auto_757123 ) ) ( not ( = ?auto_757121 ?auto_757124 ) ) ( not ( = ?auto_757121 ?auto_757125 ) ) ( not ( = ?auto_757121 ?auto_757126 ) ) ( not ( = ?auto_757121 ?auto_757127 ) ) ( not ( = ?auto_757122 ?auto_757123 ) ) ( not ( = ?auto_757122 ?auto_757124 ) ) ( not ( = ?auto_757122 ?auto_757125 ) ) ( not ( = ?auto_757122 ?auto_757126 ) ) ( not ( = ?auto_757122 ?auto_757127 ) ) ( not ( = ?auto_757123 ?auto_757124 ) ) ( not ( = ?auto_757123 ?auto_757125 ) ) ( not ( = ?auto_757123 ?auto_757126 ) ) ( not ( = ?auto_757123 ?auto_757127 ) ) ( not ( = ?auto_757124 ?auto_757125 ) ) ( not ( = ?auto_757124 ?auto_757126 ) ) ( not ( = ?auto_757124 ?auto_757127 ) ) ( not ( = ?auto_757125 ?auto_757126 ) ) ( not ( = ?auto_757125 ?auto_757127 ) ) ( not ( = ?auto_757126 ?auto_757127 ) ) ( ON ?auto_757125 ?auto_757126 ) ( ON ?auto_757124 ?auto_757125 ) ( ON ?auto_757123 ?auto_757124 ) ( ON ?auto_757122 ?auto_757123 ) ( ON ?auto_757121 ?auto_757122 ) ( ON ?auto_757120 ?auto_757121 ) ( ON ?auto_757119 ?auto_757120 ) ( ON ?auto_757118 ?auto_757119 ) ( ON ?auto_757117 ?auto_757118 ) ( ON ?auto_757116 ?auto_757117 ) ( ON ?auto_757115 ?auto_757116 ) ( ON ?auto_757114 ?auto_757115 ) ( ON ?auto_757113 ?auto_757114 ) ( ON ?auto_757112 ?auto_757113 ) ( ON ?auto_757111 ?auto_757112 ) ( CLEAR ?auto_757109 ) ( ON ?auto_757110 ?auto_757111 ) ( CLEAR ?auto_757110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_757109 ?auto_757110 )
      ( MAKE-18PILE ?auto_757109 ?auto_757110 ?auto_757111 ?auto_757112 ?auto_757113 ?auto_757114 ?auto_757115 ?auto_757116 ?auto_757117 ?auto_757118 ?auto_757119 ?auto_757120 ?auto_757121 ?auto_757122 ?auto_757123 ?auto_757124 ?auto_757125 ?auto_757126 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757146 - BLOCK
      ?auto_757147 - BLOCK
      ?auto_757148 - BLOCK
      ?auto_757149 - BLOCK
      ?auto_757150 - BLOCK
      ?auto_757151 - BLOCK
      ?auto_757152 - BLOCK
      ?auto_757153 - BLOCK
      ?auto_757154 - BLOCK
      ?auto_757155 - BLOCK
      ?auto_757156 - BLOCK
      ?auto_757157 - BLOCK
      ?auto_757158 - BLOCK
      ?auto_757159 - BLOCK
      ?auto_757160 - BLOCK
      ?auto_757161 - BLOCK
      ?auto_757162 - BLOCK
      ?auto_757163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_757163 ) ( ON-TABLE ?auto_757146 ) ( not ( = ?auto_757146 ?auto_757147 ) ) ( not ( = ?auto_757146 ?auto_757148 ) ) ( not ( = ?auto_757146 ?auto_757149 ) ) ( not ( = ?auto_757146 ?auto_757150 ) ) ( not ( = ?auto_757146 ?auto_757151 ) ) ( not ( = ?auto_757146 ?auto_757152 ) ) ( not ( = ?auto_757146 ?auto_757153 ) ) ( not ( = ?auto_757146 ?auto_757154 ) ) ( not ( = ?auto_757146 ?auto_757155 ) ) ( not ( = ?auto_757146 ?auto_757156 ) ) ( not ( = ?auto_757146 ?auto_757157 ) ) ( not ( = ?auto_757146 ?auto_757158 ) ) ( not ( = ?auto_757146 ?auto_757159 ) ) ( not ( = ?auto_757146 ?auto_757160 ) ) ( not ( = ?auto_757146 ?auto_757161 ) ) ( not ( = ?auto_757146 ?auto_757162 ) ) ( not ( = ?auto_757146 ?auto_757163 ) ) ( not ( = ?auto_757147 ?auto_757148 ) ) ( not ( = ?auto_757147 ?auto_757149 ) ) ( not ( = ?auto_757147 ?auto_757150 ) ) ( not ( = ?auto_757147 ?auto_757151 ) ) ( not ( = ?auto_757147 ?auto_757152 ) ) ( not ( = ?auto_757147 ?auto_757153 ) ) ( not ( = ?auto_757147 ?auto_757154 ) ) ( not ( = ?auto_757147 ?auto_757155 ) ) ( not ( = ?auto_757147 ?auto_757156 ) ) ( not ( = ?auto_757147 ?auto_757157 ) ) ( not ( = ?auto_757147 ?auto_757158 ) ) ( not ( = ?auto_757147 ?auto_757159 ) ) ( not ( = ?auto_757147 ?auto_757160 ) ) ( not ( = ?auto_757147 ?auto_757161 ) ) ( not ( = ?auto_757147 ?auto_757162 ) ) ( not ( = ?auto_757147 ?auto_757163 ) ) ( not ( = ?auto_757148 ?auto_757149 ) ) ( not ( = ?auto_757148 ?auto_757150 ) ) ( not ( = ?auto_757148 ?auto_757151 ) ) ( not ( = ?auto_757148 ?auto_757152 ) ) ( not ( = ?auto_757148 ?auto_757153 ) ) ( not ( = ?auto_757148 ?auto_757154 ) ) ( not ( = ?auto_757148 ?auto_757155 ) ) ( not ( = ?auto_757148 ?auto_757156 ) ) ( not ( = ?auto_757148 ?auto_757157 ) ) ( not ( = ?auto_757148 ?auto_757158 ) ) ( not ( = ?auto_757148 ?auto_757159 ) ) ( not ( = ?auto_757148 ?auto_757160 ) ) ( not ( = ?auto_757148 ?auto_757161 ) ) ( not ( = ?auto_757148 ?auto_757162 ) ) ( not ( = ?auto_757148 ?auto_757163 ) ) ( not ( = ?auto_757149 ?auto_757150 ) ) ( not ( = ?auto_757149 ?auto_757151 ) ) ( not ( = ?auto_757149 ?auto_757152 ) ) ( not ( = ?auto_757149 ?auto_757153 ) ) ( not ( = ?auto_757149 ?auto_757154 ) ) ( not ( = ?auto_757149 ?auto_757155 ) ) ( not ( = ?auto_757149 ?auto_757156 ) ) ( not ( = ?auto_757149 ?auto_757157 ) ) ( not ( = ?auto_757149 ?auto_757158 ) ) ( not ( = ?auto_757149 ?auto_757159 ) ) ( not ( = ?auto_757149 ?auto_757160 ) ) ( not ( = ?auto_757149 ?auto_757161 ) ) ( not ( = ?auto_757149 ?auto_757162 ) ) ( not ( = ?auto_757149 ?auto_757163 ) ) ( not ( = ?auto_757150 ?auto_757151 ) ) ( not ( = ?auto_757150 ?auto_757152 ) ) ( not ( = ?auto_757150 ?auto_757153 ) ) ( not ( = ?auto_757150 ?auto_757154 ) ) ( not ( = ?auto_757150 ?auto_757155 ) ) ( not ( = ?auto_757150 ?auto_757156 ) ) ( not ( = ?auto_757150 ?auto_757157 ) ) ( not ( = ?auto_757150 ?auto_757158 ) ) ( not ( = ?auto_757150 ?auto_757159 ) ) ( not ( = ?auto_757150 ?auto_757160 ) ) ( not ( = ?auto_757150 ?auto_757161 ) ) ( not ( = ?auto_757150 ?auto_757162 ) ) ( not ( = ?auto_757150 ?auto_757163 ) ) ( not ( = ?auto_757151 ?auto_757152 ) ) ( not ( = ?auto_757151 ?auto_757153 ) ) ( not ( = ?auto_757151 ?auto_757154 ) ) ( not ( = ?auto_757151 ?auto_757155 ) ) ( not ( = ?auto_757151 ?auto_757156 ) ) ( not ( = ?auto_757151 ?auto_757157 ) ) ( not ( = ?auto_757151 ?auto_757158 ) ) ( not ( = ?auto_757151 ?auto_757159 ) ) ( not ( = ?auto_757151 ?auto_757160 ) ) ( not ( = ?auto_757151 ?auto_757161 ) ) ( not ( = ?auto_757151 ?auto_757162 ) ) ( not ( = ?auto_757151 ?auto_757163 ) ) ( not ( = ?auto_757152 ?auto_757153 ) ) ( not ( = ?auto_757152 ?auto_757154 ) ) ( not ( = ?auto_757152 ?auto_757155 ) ) ( not ( = ?auto_757152 ?auto_757156 ) ) ( not ( = ?auto_757152 ?auto_757157 ) ) ( not ( = ?auto_757152 ?auto_757158 ) ) ( not ( = ?auto_757152 ?auto_757159 ) ) ( not ( = ?auto_757152 ?auto_757160 ) ) ( not ( = ?auto_757152 ?auto_757161 ) ) ( not ( = ?auto_757152 ?auto_757162 ) ) ( not ( = ?auto_757152 ?auto_757163 ) ) ( not ( = ?auto_757153 ?auto_757154 ) ) ( not ( = ?auto_757153 ?auto_757155 ) ) ( not ( = ?auto_757153 ?auto_757156 ) ) ( not ( = ?auto_757153 ?auto_757157 ) ) ( not ( = ?auto_757153 ?auto_757158 ) ) ( not ( = ?auto_757153 ?auto_757159 ) ) ( not ( = ?auto_757153 ?auto_757160 ) ) ( not ( = ?auto_757153 ?auto_757161 ) ) ( not ( = ?auto_757153 ?auto_757162 ) ) ( not ( = ?auto_757153 ?auto_757163 ) ) ( not ( = ?auto_757154 ?auto_757155 ) ) ( not ( = ?auto_757154 ?auto_757156 ) ) ( not ( = ?auto_757154 ?auto_757157 ) ) ( not ( = ?auto_757154 ?auto_757158 ) ) ( not ( = ?auto_757154 ?auto_757159 ) ) ( not ( = ?auto_757154 ?auto_757160 ) ) ( not ( = ?auto_757154 ?auto_757161 ) ) ( not ( = ?auto_757154 ?auto_757162 ) ) ( not ( = ?auto_757154 ?auto_757163 ) ) ( not ( = ?auto_757155 ?auto_757156 ) ) ( not ( = ?auto_757155 ?auto_757157 ) ) ( not ( = ?auto_757155 ?auto_757158 ) ) ( not ( = ?auto_757155 ?auto_757159 ) ) ( not ( = ?auto_757155 ?auto_757160 ) ) ( not ( = ?auto_757155 ?auto_757161 ) ) ( not ( = ?auto_757155 ?auto_757162 ) ) ( not ( = ?auto_757155 ?auto_757163 ) ) ( not ( = ?auto_757156 ?auto_757157 ) ) ( not ( = ?auto_757156 ?auto_757158 ) ) ( not ( = ?auto_757156 ?auto_757159 ) ) ( not ( = ?auto_757156 ?auto_757160 ) ) ( not ( = ?auto_757156 ?auto_757161 ) ) ( not ( = ?auto_757156 ?auto_757162 ) ) ( not ( = ?auto_757156 ?auto_757163 ) ) ( not ( = ?auto_757157 ?auto_757158 ) ) ( not ( = ?auto_757157 ?auto_757159 ) ) ( not ( = ?auto_757157 ?auto_757160 ) ) ( not ( = ?auto_757157 ?auto_757161 ) ) ( not ( = ?auto_757157 ?auto_757162 ) ) ( not ( = ?auto_757157 ?auto_757163 ) ) ( not ( = ?auto_757158 ?auto_757159 ) ) ( not ( = ?auto_757158 ?auto_757160 ) ) ( not ( = ?auto_757158 ?auto_757161 ) ) ( not ( = ?auto_757158 ?auto_757162 ) ) ( not ( = ?auto_757158 ?auto_757163 ) ) ( not ( = ?auto_757159 ?auto_757160 ) ) ( not ( = ?auto_757159 ?auto_757161 ) ) ( not ( = ?auto_757159 ?auto_757162 ) ) ( not ( = ?auto_757159 ?auto_757163 ) ) ( not ( = ?auto_757160 ?auto_757161 ) ) ( not ( = ?auto_757160 ?auto_757162 ) ) ( not ( = ?auto_757160 ?auto_757163 ) ) ( not ( = ?auto_757161 ?auto_757162 ) ) ( not ( = ?auto_757161 ?auto_757163 ) ) ( not ( = ?auto_757162 ?auto_757163 ) ) ( ON ?auto_757162 ?auto_757163 ) ( ON ?auto_757161 ?auto_757162 ) ( ON ?auto_757160 ?auto_757161 ) ( ON ?auto_757159 ?auto_757160 ) ( ON ?auto_757158 ?auto_757159 ) ( ON ?auto_757157 ?auto_757158 ) ( ON ?auto_757156 ?auto_757157 ) ( ON ?auto_757155 ?auto_757156 ) ( ON ?auto_757154 ?auto_757155 ) ( ON ?auto_757153 ?auto_757154 ) ( ON ?auto_757152 ?auto_757153 ) ( ON ?auto_757151 ?auto_757152 ) ( ON ?auto_757150 ?auto_757151 ) ( ON ?auto_757149 ?auto_757150 ) ( ON ?auto_757148 ?auto_757149 ) ( CLEAR ?auto_757146 ) ( ON ?auto_757147 ?auto_757148 ) ( CLEAR ?auto_757147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_757146 ?auto_757147 )
      ( MAKE-18PILE ?auto_757146 ?auto_757147 ?auto_757148 ?auto_757149 ?auto_757150 ?auto_757151 ?auto_757152 ?auto_757153 ?auto_757154 ?auto_757155 ?auto_757156 ?auto_757157 ?auto_757158 ?auto_757159 ?auto_757160 ?auto_757161 ?auto_757162 ?auto_757163 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757182 - BLOCK
      ?auto_757183 - BLOCK
      ?auto_757184 - BLOCK
      ?auto_757185 - BLOCK
      ?auto_757186 - BLOCK
      ?auto_757187 - BLOCK
      ?auto_757188 - BLOCK
      ?auto_757189 - BLOCK
      ?auto_757190 - BLOCK
      ?auto_757191 - BLOCK
      ?auto_757192 - BLOCK
      ?auto_757193 - BLOCK
      ?auto_757194 - BLOCK
      ?auto_757195 - BLOCK
      ?auto_757196 - BLOCK
      ?auto_757197 - BLOCK
      ?auto_757198 - BLOCK
      ?auto_757199 - BLOCK
    )
    :vars
    (
      ?auto_757200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757199 ?auto_757200 ) ( not ( = ?auto_757182 ?auto_757183 ) ) ( not ( = ?auto_757182 ?auto_757184 ) ) ( not ( = ?auto_757182 ?auto_757185 ) ) ( not ( = ?auto_757182 ?auto_757186 ) ) ( not ( = ?auto_757182 ?auto_757187 ) ) ( not ( = ?auto_757182 ?auto_757188 ) ) ( not ( = ?auto_757182 ?auto_757189 ) ) ( not ( = ?auto_757182 ?auto_757190 ) ) ( not ( = ?auto_757182 ?auto_757191 ) ) ( not ( = ?auto_757182 ?auto_757192 ) ) ( not ( = ?auto_757182 ?auto_757193 ) ) ( not ( = ?auto_757182 ?auto_757194 ) ) ( not ( = ?auto_757182 ?auto_757195 ) ) ( not ( = ?auto_757182 ?auto_757196 ) ) ( not ( = ?auto_757182 ?auto_757197 ) ) ( not ( = ?auto_757182 ?auto_757198 ) ) ( not ( = ?auto_757182 ?auto_757199 ) ) ( not ( = ?auto_757182 ?auto_757200 ) ) ( not ( = ?auto_757183 ?auto_757184 ) ) ( not ( = ?auto_757183 ?auto_757185 ) ) ( not ( = ?auto_757183 ?auto_757186 ) ) ( not ( = ?auto_757183 ?auto_757187 ) ) ( not ( = ?auto_757183 ?auto_757188 ) ) ( not ( = ?auto_757183 ?auto_757189 ) ) ( not ( = ?auto_757183 ?auto_757190 ) ) ( not ( = ?auto_757183 ?auto_757191 ) ) ( not ( = ?auto_757183 ?auto_757192 ) ) ( not ( = ?auto_757183 ?auto_757193 ) ) ( not ( = ?auto_757183 ?auto_757194 ) ) ( not ( = ?auto_757183 ?auto_757195 ) ) ( not ( = ?auto_757183 ?auto_757196 ) ) ( not ( = ?auto_757183 ?auto_757197 ) ) ( not ( = ?auto_757183 ?auto_757198 ) ) ( not ( = ?auto_757183 ?auto_757199 ) ) ( not ( = ?auto_757183 ?auto_757200 ) ) ( not ( = ?auto_757184 ?auto_757185 ) ) ( not ( = ?auto_757184 ?auto_757186 ) ) ( not ( = ?auto_757184 ?auto_757187 ) ) ( not ( = ?auto_757184 ?auto_757188 ) ) ( not ( = ?auto_757184 ?auto_757189 ) ) ( not ( = ?auto_757184 ?auto_757190 ) ) ( not ( = ?auto_757184 ?auto_757191 ) ) ( not ( = ?auto_757184 ?auto_757192 ) ) ( not ( = ?auto_757184 ?auto_757193 ) ) ( not ( = ?auto_757184 ?auto_757194 ) ) ( not ( = ?auto_757184 ?auto_757195 ) ) ( not ( = ?auto_757184 ?auto_757196 ) ) ( not ( = ?auto_757184 ?auto_757197 ) ) ( not ( = ?auto_757184 ?auto_757198 ) ) ( not ( = ?auto_757184 ?auto_757199 ) ) ( not ( = ?auto_757184 ?auto_757200 ) ) ( not ( = ?auto_757185 ?auto_757186 ) ) ( not ( = ?auto_757185 ?auto_757187 ) ) ( not ( = ?auto_757185 ?auto_757188 ) ) ( not ( = ?auto_757185 ?auto_757189 ) ) ( not ( = ?auto_757185 ?auto_757190 ) ) ( not ( = ?auto_757185 ?auto_757191 ) ) ( not ( = ?auto_757185 ?auto_757192 ) ) ( not ( = ?auto_757185 ?auto_757193 ) ) ( not ( = ?auto_757185 ?auto_757194 ) ) ( not ( = ?auto_757185 ?auto_757195 ) ) ( not ( = ?auto_757185 ?auto_757196 ) ) ( not ( = ?auto_757185 ?auto_757197 ) ) ( not ( = ?auto_757185 ?auto_757198 ) ) ( not ( = ?auto_757185 ?auto_757199 ) ) ( not ( = ?auto_757185 ?auto_757200 ) ) ( not ( = ?auto_757186 ?auto_757187 ) ) ( not ( = ?auto_757186 ?auto_757188 ) ) ( not ( = ?auto_757186 ?auto_757189 ) ) ( not ( = ?auto_757186 ?auto_757190 ) ) ( not ( = ?auto_757186 ?auto_757191 ) ) ( not ( = ?auto_757186 ?auto_757192 ) ) ( not ( = ?auto_757186 ?auto_757193 ) ) ( not ( = ?auto_757186 ?auto_757194 ) ) ( not ( = ?auto_757186 ?auto_757195 ) ) ( not ( = ?auto_757186 ?auto_757196 ) ) ( not ( = ?auto_757186 ?auto_757197 ) ) ( not ( = ?auto_757186 ?auto_757198 ) ) ( not ( = ?auto_757186 ?auto_757199 ) ) ( not ( = ?auto_757186 ?auto_757200 ) ) ( not ( = ?auto_757187 ?auto_757188 ) ) ( not ( = ?auto_757187 ?auto_757189 ) ) ( not ( = ?auto_757187 ?auto_757190 ) ) ( not ( = ?auto_757187 ?auto_757191 ) ) ( not ( = ?auto_757187 ?auto_757192 ) ) ( not ( = ?auto_757187 ?auto_757193 ) ) ( not ( = ?auto_757187 ?auto_757194 ) ) ( not ( = ?auto_757187 ?auto_757195 ) ) ( not ( = ?auto_757187 ?auto_757196 ) ) ( not ( = ?auto_757187 ?auto_757197 ) ) ( not ( = ?auto_757187 ?auto_757198 ) ) ( not ( = ?auto_757187 ?auto_757199 ) ) ( not ( = ?auto_757187 ?auto_757200 ) ) ( not ( = ?auto_757188 ?auto_757189 ) ) ( not ( = ?auto_757188 ?auto_757190 ) ) ( not ( = ?auto_757188 ?auto_757191 ) ) ( not ( = ?auto_757188 ?auto_757192 ) ) ( not ( = ?auto_757188 ?auto_757193 ) ) ( not ( = ?auto_757188 ?auto_757194 ) ) ( not ( = ?auto_757188 ?auto_757195 ) ) ( not ( = ?auto_757188 ?auto_757196 ) ) ( not ( = ?auto_757188 ?auto_757197 ) ) ( not ( = ?auto_757188 ?auto_757198 ) ) ( not ( = ?auto_757188 ?auto_757199 ) ) ( not ( = ?auto_757188 ?auto_757200 ) ) ( not ( = ?auto_757189 ?auto_757190 ) ) ( not ( = ?auto_757189 ?auto_757191 ) ) ( not ( = ?auto_757189 ?auto_757192 ) ) ( not ( = ?auto_757189 ?auto_757193 ) ) ( not ( = ?auto_757189 ?auto_757194 ) ) ( not ( = ?auto_757189 ?auto_757195 ) ) ( not ( = ?auto_757189 ?auto_757196 ) ) ( not ( = ?auto_757189 ?auto_757197 ) ) ( not ( = ?auto_757189 ?auto_757198 ) ) ( not ( = ?auto_757189 ?auto_757199 ) ) ( not ( = ?auto_757189 ?auto_757200 ) ) ( not ( = ?auto_757190 ?auto_757191 ) ) ( not ( = ?auto_757190 ?auto_757192 ) ) ( not ( = ?auto_757190 ?auto_757193 ) ) ( not ( = ?auto_757190 ?auto_757194 ) ) ( not ( = ?auto_757190 ?auto_757195 ) ) ( not ( = ?auto_757190 ?auto_757196 ) ) ( not ( = ?auto_757190 ?auto_757197 ) ) ( not ( = ?auto_757190 ?auto_757198 ) ) ( not ( = ?auto_757190 ?auto_757199 ) ) ( not ( = ?auto_757190 ?auto_757200 ) ) ( not ( = ?auto_757191 ?auto_757192 ) ) ( not ( = ?auto_757191 ?auto_757193 ) ) ( not ( = ?auto_757191 ?auto_757194 ) ) ( not ( = ?auto_757191 ?auto_757195 ) ) ( not ( = ?auto_757191 ?auto_757196 ) ) ( not ( = ?auto_757191 ?auto_757197 ) ) ( not ( = ?auto_757191 ?auto_757198 ) ) ( not ( = ?auto_757191 ?auto_757199 ) ) ( not ( = ?auto_757191 ?auto_757200 ) ) ( not ( = ?auto_757192 ?auto_757193 ) ) ( not ( = ?auto_757192 ?auto_757194 ) ) ( not ( = ?auto_757192 ?auto_757195 ) ) ( not ( = ?auto_757192 ?auto_757196 ) ) ( not ( = ?auto_757192 ?auto_757197 ) ) ( not ( = ?auto_757192 ?auto_757198 ) ) ( not ( = ?auto_757192 ?auto_757199 ) ) ( not ( = ?auto_757192 ?auto_757200 ) ) ( not ( = ?auto_757193 ?auto_757194 ) ) ( not ( = ?auto_757193 ?auto_757195 ) ) ( not ( = ?auto_757193 ?auto_757196 ) ) ( not ( = ?auto_757193 ?auto_757197 ) ) ( not ( = ?auto_757193 ?auto_757198 ) ) ( not ( = ?auto_757193 ?auto_757199 ) ) ( not ( = ?auto_757193 ?auto_757200 ) ) ( not ( = ?auto_757194 ?auto_757195 ) ) ( not ( = ?auto_757194 ?auto_757196 ) ) ( not ( = ?auto_757194 ?auto_757197 ) ) ( not ( = ?auto_757194 ?auto_757198 ) ) ( not ( = ?auto_757194 ?auto_757199 ) ) ( not ( = ?auto_757194 ?auto_757200 ) ) ( not ( = ?auto_757195 ?auto_757196 ) ) ( not ( = ?auto_757195 ?auto_757197 ) ) ( not ( = ?auto_757195 ?auto_757198 ) ) ( not ( = ?auto_757195 ?auto_757199 ) ) ( not ( = ?auto_757195 ?auto_757200 ) ) ( not ( = ?auto_757196 ?auto_757197 ) ) ( not ( = ?auto_757196 ?auto_757198 ) ) ( not ( = ?auto_757196 ?auto_757199 ) ) ( not ( = ?auto_757196 ?auto_757200 ) ) ( not ( = ?auto_757197 ?auto_757198 ) ) ( not ( = ?auto_757197 ?auto_757199 ) ) ( not ( = ?auto_757197 ?auto_757200 ) ) ( not ( = ?auto_757198 ?auto_757199 ) ) ( not ( = ?auto_757198 ?auto_757200 ) ) ( not ( = ?auto_757199 ?auto_757200 ) ) ( ON ?auto_757198 ?auto_757199 ) ( ON ?auto_757197 ?auto_757198 ) ( ON ?auto_757196 ?auto_757197 ) ( ON ?auto_757195 ?auto_757196 ) ( ON ?auto_757194 ?auto_757195 ) ( ON ?auto_757193 ?auto_757194 ) ( ON ?auto_757192 ?auto_757193 ) ( ON ?auto_757191 ?auto_757192 ) ( ON ?auto_757190 ?auto_757191 ) ( ON ?auto_757189 ?auto_757190 ) ( ON ?auto_757188 ?auto_757189 ) ( ON ?auto_757187 ?auto_757188 ) ( ON ?auto_757186 ?auto_757187 ) ( ON ?auto_757185 ?auto_757186 ) ( ON ?auto_757184 ?auto_757185 ) ( ON ?auto_757183 ?auto_757184 ) ( ON ?auto_757182 ?auto_757183 ) ( CLEAR ?auto_757182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757182 )
      ( MAKE-18PILE ?auto_757182 ?auto_757183 ?auto_757184 ?auto_757185 ?auto_757186 ?auto_757187 ?auto_757188 ?auto_757189 ?auto_757190 ?auto_757191 ?auto_757192 ?auto_757193 ?auto_757194 ?auto_757195 ?auto_757196 ?auto_757197 ?auto_757198 ?auto_757199 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757219 - BLOCK
      ?auto_757220 - BLOCK
      ?auto_757221 - BLOCK
      ?auto_757222 - BLOCK
      ?auto_757223 - BLOCK
      ?auto_757224 - BLOCK
      ?auto_757225 - BLOCK
      ?auto_757226 - BLOCK
      ?auto_757227 - BLOCK
      ?auto_757228 - BLOCK
      ?auto_757229 - BLOCK
      ?auto_757230 - BLOCK
      ?auto_757231 - BLOCK
      ?auto_757232 - BLOCK
      ?auto_757233 - BLOCK
      ?auto_757234 - BLOCK
      ?auto_757235 - BLOCK
      ?auto_757236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_757236 ) ( not ( = ?auto_757219 ?auto_757220 ) ) ( not ( = ?auto_757219 ?auto_757221 ) ) ( not ( = ?auto_757219 ?auto_757222 ) ) ( not ( = ?auto_757219 ?auto_757223 ) ) ( not ( = ?auto_757219 ?auto_757224 ) ) ( not ( = ?auto_757219 ?auto_757225 ) ) ( not ( = ?auto_757219 ?auto_757226 ) ) ( not ( = ?auto_757219 ?auto_757227 ) ) ( not ( = ?auto_757219 ?auto_757228 ) ) ( not ( = ?auto_757219 ?auto_757229 ) ) ( not ( = ?auto_757219 ?auto_757230 ) ) ( not ( = ?auto_757219 ?auto_757231 ) ) ( not ( = ?auto_757219 ?auto_757232 ) ) ( not ( = ?auto_757219 ?auto_757233 ) ) ( not ( = ?auto_757219 ?auto_757234 ) ) ( not ( = ?auto_757219 ?auto_757235 ) ) ( not ( = ?auto_757219 ?auto_757236 ) ) ( not ( = ?auto_757220 ?auto_757221 ) ) ( not ( = ?auto_757220 ?auto_757222 ) ) ( not ( = ?auto_757220 ?auto_757223 ) ) ( not ( = ?auto_757220 ?auto_757224 ) ) ( not ( = ?auto_757220 ?auto_757225 ) ) ( not ( = ?auto_757220 ?auto_757226 ) ) ( not ( = ?auto_757220 ?auto_757227 ) ) ( not ( = ?auto_757220 ?auto_757228 ) ) ( not ( = ?auto_757220 ?auto_757229 ) ) ( not ( = ?auto_757220 ?auto_757230 ) ) ( not ( = ?auto_757220 ?auto_757231 ) ) ( not ( = ?auto_757220 ?auto_757232 ) ) ( not ( = ?auto_757220 ?auto_757233 ) ) ( not ( = ?auto_757220 ?auto_757234 ) ) ( not ( = ?auto_757220 ?auto_757235 ) ) ( not ( = ?auto_757220 ?auto_757236 ) ) ( not ( = ?auto_757221 ?auto_757222 ) ) ( not ( = ?auto_757221 ?auto_757223 ) ) ( not ( = ?auto_757221 ?auto_757224 ) ) ( not ( = ?auto_757221 ?auto_757225 ) ) ( not ( = ?auto_757221 ?auto_757226 ) ) ( not ( = ?auto_757221 ?auto_757227 ) ) ( not ( = ?auto_757221 ?auto_757228 ) ) ( not ( = ?auto_757221 ?auto_757229 ) ) ( not ( = ?auto_757221 ?auto_757230 ) ) ( not ( = ?auto_757221 ?auto_757231 ) ) ( not ( = ?auto_757221 ?auto_757232 ) ) ( not ( = ?auto_757221 ?auto_757233 ) ) ( not ( = ?auto_757221 ?auto_757234 ) ) ( not ( = ?auto_757221 ?auto_757235 ) ) ( not ( = ?auto_757221 ?auto_757236 ) ) ( not ( = ?auto_757222 ?auto_757223 ) ) ( not ( = ?auto_757222 ?auto_757224 ) ) ( not ( = ?auto_757222 ?auto_757225 ) ) ( not ( = ?auto_757222 ?auto_757226 ) ) ( not ( = ?auto_757222 ?auto_757227 ) ) ( not ( = ?auto_757222 ?auto_757228 ) ) ( not ( = ?auto_757222 ?auto_757229 ) ) ( not ( = ?auto_757222 ?auto_757230 ) ) ( not ( = ?auto_757222 ?auto_757231 ) ) ( not ( = ?auto_757222 ?auto_757232 ) ) ( not ( = ?auto_757222 ?auto_757233 ) ) ( not ( = ?auto_757222 ?auto_757234 ) ) ( not ( = ?auto_757222 ?auto_757235 ) ) ( not ( = ?auto_757222 ?auto_757236 ) ) ( not ( = ?auto_757223 ?auto_757224 ) ) ( not ( = ?auto_757223 ?auto_757225 ) ) ( not ( = ?auto_757223 ?auto_757226 ) ) ( not ( = ?auto_757223 ?auto_757227 ) ) ( not ( = ?auto_757223 ?auto_757228 ) ) ( not ( = ?auto_757223 ?auto_757229 ) ) ( not ( = ?auto_757223 ?auto_757230 ) ) ( not ( = ?auto_757223 ?auto_757231 ) ) ( not ( = ?auto_757223 ?auto_757232 ) ) ( not ( = ?auto_757223 ?auto_757233 ) ) ( not ( = ?auto_757223 ?auto_757234 ) ) ( not ( = ?auto_757223 ?auto_757235 ) ) ( not ( = ?auto_757223 ?auto_757236 ) ) ( not ( = ?auto_757224 ?auto_757225 ) ) ( not ( = ?auto_757224 ?auto_757226 ) ) ( not ( = ?auto_757224 ?auto_757227 ) ) ( not ( = ?auto_757224 ?auto_757228 ) ) ( not ( = ?auto_757224 ?auto_757229 ) ) ( not ( = ?auto_757224 ?auto_757230 ) ) ( not ( = ?auto_757224 ?auto_757231 ) ) ( not ( = ?auto_757224 ?auto_757232 ) ) ( not ( = ?auto_757224 ?auto_757233 ) ) ( not ( = ?auto_757224 ?auto_757234 ) ) ( not ( = ?auto_757224 ?auto_757235 ) ) ( not ( = ?auto_757224 ?auto_757236 ) ) ( not ( = ?auto_757225 ?auto_757226 ) ) ( not ( = ?auto_757225 ?auto_757227 ) ) ( not ( = ?auto_757225 ?auto_757228 ) ) ( not ( = ?auto_757225 ?auto_757229 ) ) ( not ( = ?auto_757225 ?auto_757230 ) ) ( not ( = ?auto_757225 ?auto_757231 ) ) ( not ( = ?auto_757225 ?auto_757232 ) ) ( not ( = ?auto_757225 ?auto_757233 ) ) ( not ( = ?auto_757225 ?auto_757234 ) ) ( not ( = ?auto_757225 ?auto_757235 ) ) ( not ( = ?auto_757225 ?auto_757236 ) ) ( not ( = ?auto_757226 ?auto_757227 ) ) ( not ( = ?auto_757226 ?auto_757228 ) ) ( not ( = ?auto_757226 ?auto_757229 ) ) ( not ( = ?auto_757226 ?auto_757230 ) ) ( not ( = ?auto_757226 ?auto_757231 ) ) ( not ( = ?auto_757226 ?auto_757232 ) ) ( not ( = ?auto_757226 ?auto_757233 ) ) ( not ( = ?auto_757226 ?auto_757234 ) ) ( not ( = ?auto_757226 ?auto_757235 ) ) ( not ( = ?auto_757226 ?auto_757236 ) ) ( not ( = ?auto_757227 ?auto_757228 ) ) ( not ( = ?auto_757227 ?auto_757229 ) ) ( not ( = ?auto_757227 ?auto_757230 ) ) ( not ( = ?auto_757227 ?auto_757231 ) ) ( not ( = ?auto_757227 ?auto_757232 ) ) ( not ( = ?auto_757227 ?auto_757233 ) ) ( not ( = ?auto_757227 ?auto_757234 ) ) ( not ( = ?auto_757227 ?auto_757235 ) ) ( not ( = ?auto_757227 ?auto_757236 ) ) ( not ( = ?auto_757228 ?auto_757229 ) ) ( not ( = ?auto_757228 ?auto_757230 ) ) ( not ( = ?auto_757228 ?auto_757231 ) ) ( not ( = ?auto_757228 ?auto_757232 ) ) ( not ( = ?auto_757228 ?auto_757233 ) ) ( not ( = ?auto_757228 ?auto_757234 ) ) ( not ( = ?auto_757228 ?auto_757235 ) ) ( not ( = ?auto_757228 ?auto_757236 ) ) ( not ( = ?auto_757229 ?auto_757230 ) ) ( not ( = ?auto_757229 ?auto_757231 ) ) ( not ( = ?auto_757229 ?auto_757232 ) ) ( not ( = ?auto_757229 ?auto_757233 ) ) ( not ( = ?auto_757229 ?auto_757234 ) ) ( not ( = ?auto_757229 ?auto_757235 ) ) ( not ( = ?auto_757229 ?auto_757236 ) ) ( not ( = ?auto_757230 ?auto_757231 ) ) ( not ( = ?auto_757230 ?auto_757232 ) ) ( not ( = ?auto_757230 ?auto_757233 ) ) ( not ( = ?auto_757230 ?auto_757234 ) ) ( not ( = ?auto_757230 ?auto_757235 ) ) ( not ( = ?auto_757230 ?auto_757236 ) ) ( not ( = ?auto_757231 ?auto_757232 ) ) ( not ( = ?auto_757231 ?auto_757233 ) ) ( not ( = ?auto_757231 ?auto_757234 ) ) ( not ( = ?auto_757231 ?auto_757235 ) ) ( not ( = ?auto_757231 ?auto_757236 ) ) ( not ( = ?auto_757232 ?auto_757233 ) ) ( not ( = ?auto_757232 ?auto_757234 ) ) ( not ( = ?auto_757232 ?auto_757235 ) ) ( not ( = ?auto_757232 ?auto_757236 ) ) ( not ( = ?auto_757233 ?auto_757234 ) ) ( not ( = ?auto_757233 ?auto_757235 ) ) ( not ( = ?auto_757233 ?auto_757236 ) ) ( not ( = ?auto_757234 ?auto_757235 ) ) ( not ( = ?auto_757234 ?auto_757236 ) ) ( not ( = ?auto_757235 ?auto_757236 ) ) ( ON ?auto_757235 ?auto_757236 ) ( ON ?auto_757234 ?auto_757235 ) ( ON ?auto_757233 ?auto_757234 ) ( ON ?auto_757232 ?auto_757233 ) ( ON ?auto_757231 ?auto_757232 ) ( ON ?auto_757230 ?auto_757231 ) ( ON ?auto_757229 ?auto_757230 ) ( ON ?auto_757228 ?auto_757229 ) ( ON ?auto_757227 ?auto_757228 ) ( ON ?auto_757226 ?auto_757227 ) ( ON ?auto_757225 ?auto_757226 ) ( ON ?auto_757224 ?auto_757225 ) ( ON ?auto_757223 ?auto_757224 ) ( ON ?auto_757222 ?auto_757223 ) ( ON ?auto_757221 ?auto_757222 ) ( ON ?auto_757220 ?auto_757221 ) ( ON ?auto_757219 ?auto_757220 ) ( CLEAR ?auto_757219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757219 )
      ( MAKE-18PILE ?auto_757219 ?auto_757220 ?auto_757221 ?auto_757222 ?auto_757223 ?auto_757224 ?auto_757225 ?auto_757226 ?auto_757227 ?auto_757228 ?auto_757229 ?auto_757230 ?auto_757231 ?auto_757232 ?auto_757233 ?auto_757234 ?auto_757235 ?auto_757236 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_757255 - BLOCK
      ?auto_757256 - BLOCK
      ?auto_757257 - BLOCK
      ?auto_757258 - BLOCK
      ?auto_757259 - BLOCK
      ?auto_757260 - BLOCK
      ?auto_757261 - BLOCK
      ?auto_757262 - BLOCK
      ?auto_757263 - BLOCK
      ?auto_757264 - BLOCK
      ?auto_757265 - BLOCK
      ?auto_757266 - BLOCK
      ?auto_757267 - BLOCK
      ?auto_757268 - BLOCK
      ?auto_757269 - BLOCK
      ?auto_757270 - BLOCK
      ?auto_757271 - BLOCK
      ?auto_757272 - BLOCK
    )
    :vars
    (
      ?auto_757273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_757255 ?auto_757256 ) ) ( not ( = ?auto_757255 ?auto_757257 ) ) ( not ( = ?auto_757255 ?auto_757258 ) ) ( not ( = ?auto_757255 ?auto_757259 ) ) ( not ( = ?auto_757255 ?auto_757260 ) ) ( not ( = ?auto_757255 ?auto_757261 ) ) ( not ( = ?auto_757255 ?auto_757262 ) ) ( not ( = ?auto_757255 ?auto_757263 ) ) ( not ( = ?auto_757255 ?auto_757264 ) ) ( not ( = ?auto_757255 ?auto_757265 ) ) ( not ( = ?auto_757255 ?auto_757266 ) ) ( not ( = ?auto_757255 ?auto_757267 ) ) ( not ( = ?auto_757255 ?auto_757268 ) ) ( not ( = ?auto_757255 ?auto_757269 ) ) ( not ( = ?auto_757255 ?auto_757270 ) ) ( not ( = ?auto_757255 ?auto_757271 ) ) ( not ( = ?auto_757255 ?auto_757272 ) ) ( not ( = ?auto_757256 ?auto_757257 ) ) ( not ( = ?auto_757256 ?auto_757258 ) ) ( not ( = ?auto_757256 ?auto_757259 ) ) ( not ( = ?auto_757256 ?auto_757260 ) ) ( not ( = ?auto_757256 ?auto_757261 ) ) ( not ( = ?auto_757256 ?auto_757262 ) ) ( not ( = ?auto_757256 ?auto_757263 ) ) ( not ( = ?auto_757256 ?auto_757264 ) ) ( not ( = ?auto_757256 ?auto_757265 ) ) ( not ( = ?auto_757256 ?auto_757266 ) ) ( not ( = ?auto_757256 ?auto_757267 ) ) ( not ( = ?auto_757256 ?auto_757268 ) ) ( not ( = ?auto_757256 ?auto_757269 ) ) ( not ( = ?auto_757256 ?auto_757270 ) ) ( not ( = ?auto_757256 ?auto_757271 ) ) ( not ( = ?auto_757256 ?auto_757272 ) ) ( not ( = ?auto_757257 ?auto_757258 ) ) ( not ( = ?auto_757257 ?auto_757259 ) ) ( not ( = ?auto_757257 ?auto_757260 ) ) ( not ( = ?auto_757257 ?auto_757261 ) ) ( not ( = ?auto_757257 ?auto_757262 ) ) ( not ( = ?auto_757257 ?auto_757263 ) ) ( not ( = ?auto_757257 ?auto_757264 ) ) ( not ( = ?auto_757257 ?auto_757265 ) ) ( not ( = ?auto_757257 ?auto_757266 ) ) ( not ( = ?auto_757257 ?auto_757267 ) ) ( not ( = ?auto_757257 ?auto_757268 ) ) ( not ( = ?auto_757257 ?auto_757269 ) ) ( not ( = ?auto_757257 ?auto_757270 ) ) ( not ( = ?auto_757257 ?auto_757271 ) ) ( not ( = ?auto_757257 ?auto_757272 ) ) ( not ( = ?auto_757258 ?auto_757259 ) ) ( not ( = ?auto_757258 ?auto_757260 ) ) ( not ( = ?auto_757258 ?auto_757261 ) ) ( not ( = ?auto_757258 ?auto_757262 ) ) ( not ( = ?auto_757258 ?auto_757263 ) ) ( not ( = ?auto_757258 ?auto_757264 ) ) ( not ( = ?auto_757258 ?auto_757265 ) ) ( not ( = ?auto_757258 ?auto_757266 ) ) ( not ( = ?auto_757258 ?auto_757267 ) ) ( not ( = ?auto_757258 ?auto_757268 ) ) ( not ( = ?auto_757258 ?auto_757269 ) ) ( not ( = ?auto_757258 ?auto_757270 ) ) ( not ( = ?auto_757258 ?auto_757271 ) ) ( not ( = ?auto_757258 ?auto_757272 ) ) ( not ( = ?auto_757259 ?auto_757260 ) ) ( not ( = ?auto_757259 ?auto_757261 ) ) ( not ( = ?auto_757259 ?auto_757262 ) ) ( not ( = ?auto_757259 ?auto_757263 ) ) ( not ( = ?auto_757259 ?auto_757264 ) ) ( not ( = ?auto_757259 ?auto_757265 ) ) ( not ( = ?auto_757259 ?auto_757266 ) ) ( not ( = ?auto_757259 ?auto_757267 ) ) ( not ( = ?auto_757259 ?auto_757268 ) ) ( not ( = ?auto_757259 ?auto_757269 ) ) ( not ( = ?auto_757259 ?auto_757270 ) ) ( not ( = ?auto_757259 ?auto_757271 ) ) ( not ( = ?auto_757259 ?auto_757272 ) ) ( not ( = ?auto_757260 ?auto_757261 ) ) ( not ( = ?auto_757260 ?auto_757262 ) ) ( not ( = ?auto_757260 ?auto_757263 ) ) ( not ( = ?auto_757260 ?auto_757264 ) ) ( not ( = ?auto_757260 ?auto_757265 ) ) ( not ( = ?auto_757260 ?auto_757266 ) ) ( not ( = ?auto_757260 ?auto_757267 ) ) ( not ( = ?auto_757260 ?auto_757268 ) ) ( not ( = ?auto_757260 ?auto_757269 ) ) ( not ( = ?auto_757260 ?auto_757270 ) ) ( not ( = ?auto_757260 ?auto_757271 ) ) ( not ( = ?auto_757260 ?auto_757272 ) ) ( not ( = ?auto_757261 ?auto_757262 ) ) ( not ( = ?auto_757261 ?auto_757263 ) ) ( not ( = ?auto_757261 ?auto_757264 ) ) ( not ( = ?auto_757261 ?auto_757265 ) ) ( not ( = ?auto_757261 ?auto_757266 ) ) ( not ( = ?auto_757261 ?auto_757267 ) ) ( not ( = ?auto_757261 ?auto_757268 ) ) ( not ( = ?auto_757261 ?auto_757269 ) ) ( not ( = ?auto_757261 ?auto_757270 ) ) ( not ( = ?auto_757261 ?auto_757271 ) ) ( not ( = ?auto_757261 ?auto_757272 ) ) ( not ( = ?auto_757262 ?auto_757263 ) ) ( not ( = ?auto_757262 ?auto_757264 ) ) ( not ( = ?auto_757262 ?auto_757265 ) ) ( not ( = ?auto_757262 ?auto_757266 ) ) ( not ( = ?auto_757262 ?auto_757267 ) ) ( not ( = ?auto_757262 ?auto_757268 ) ) ( not ( = ?auto_757262 ?auto_757269 ) ) ( not ( = ?auto_757262 ?auto_757270 ) ) ( not ( = ?auto_757262 ?auto_757271 ) ) ( not ( = ?auto_757262 ?auto_757272 ) ) ( not ( = ?auto_757263 ?auto_757264 ) ) ( not ( = ?auto_757263 ?auto_757265 ) ) ( not ( = ?auto_757263 ?auto_757266 ) ) ( not ( = ?auto_757263 ?auto_757267 ) ) ( not ( = ?auto_757263 ?auto_757268 ) ) ( not ( = ?auto_757263 ?auto_757269 ) ) ( not ( = ?auto_757263 ?auto_757270 ) ) ( not ( = ?auto_757263 ?auto_757271 ) ) ( not ( = ?auto_757263 ?auto_757272 ) ) ( not ( = ?auto_757264 ?auto_757265 ) ) ( not ( = ?auto_757264 ?auto_757266 ) ) ( not ( = ?auto_757264 ?auto_757267 ) ) ( not ( = ?auto_757264 ?auto_757268 ) ) ( not ( = ?auto_757264 ?auto_757269 ) ) ( not ( = ?auto_757264 ?auto_757270 ) ) ( not ( = ?auto_757264 ?auto_757271 ) ) ( not ( = ?auto_757264 ?auto_757272 ) ) ( not ( = ?auto_757265 ?auto_757266 ) ) ( not ( = ?auto_757265 ?auto_757267 ) ) ( not ( = ?auto_757265 ?auto_757268 ) ) ( not ( = ?auto_757265 ?auto_757269 ) ) ( not ( = ?auto_757265 ?auto_757270 ) ) ( not ( = ?auto_757265 ?auto_757271 ) ) ( not ( = ?auto_757265 ?auto_757272 ) ) ( not ( = ?auto_757266 ?auto_757267 ) ) ( not ( = ?auto_757266 ?auto_757268 ) ) ( not ( = ?auto_757266 ?auto_757269 ) ) ( not ( = ?auto_757266 ?auto_757270 ) ) ( not ( = ?auto_757266 ?auto_757271 ) ) ( not ( = ?auto_757266 ?auto_757272 ) ) ( not ( = ?auto_757267 ?auto_757268 ) ) ( not ( = ?auto_757267 ?auto_757269 ) ) ( not ( = ?auto_757267 ?auto_757270 ) ) ( not ( = ?auto_757267 ?auto_757271 ) ) ( not ( = ?auto_757267 ?auto_757272 ) ) ( not ( = ?auto_757268 ?auto_757269 ) ) ( not ( = ?auto_757268 ?auto_757270 ) ) ( not ( = ?auto_757268 ?auto_757271 ) ) ( not ( = ?auto_757268 ?auto_757272 ) ) ( not ( = ?auto_757269 ?auto_757270 ) ) ( not ( = ?auto_757269 ?auto_757271 ) ) ( not ( = ?auto_757269 ?auto_757272 ) ) ( not ( = ?auto_757270 ?auto_757271 ) ) ( not ( = ?auto_757270 ?auto_757272 ) ) ( not ( = ?auto_757271 ?auto_757272 ) ) ( ON ?auto_757255 ?auto_757273 ) ( not ( = ?auto_757272 ?auto_757273 ) ) ( not ( = ?auto_757271 ?auto_757273 ) ) ( not ( = ?auto_757270 ?auto_757273 ) ) ( not ( = ?auto_757269 ?auto_757273 ) ) ( not ( = ?auto_757268 ?auto_757273 ) ) ( not ( = ?auto_757267 ?auto_757273 ) ) ( not ( = ?auto_757266 ?auto_757273 ) ) ( not ( = ?auto_757265 ?auto_757273 ) ) ( not ( = ?auto_757264 ?auto_757273 ) ) ( not ( = ?auto_757263 ?auto_757273 ) ) ( not ( = ?auto_757262 ?auto_757273 ) ) ( not ( = ?auto_757261 ?auto_757273 ) ) ( not ( = ?auto_757260 ?auto_757273 ) ) ( not ( = ?auto_757259 ?auto_757273 ) ) ( not ( = ?auto_757258 ?auto_757273 ) ) ( not ( = ?auto_757257 ?auto_757273 ) ) ( not ( = ?auto_757256 ?auto_757273 ) ) ( not ( = ?auto_757255 ?auto_757273 ) ) ( ON ?auto_757256 ?auto_757255 ) ( ON ?auto_757257 ?auto_757256 ) ( ON ?auto_757258 ?auto_757257 ) ( ON ?auto_757259 ?auto_757258 ) ( ON ?auto_757260 ?auto_757259 ) ( ON ?auto_757261 ?auto_757260 ) ( ON ?auto_757262 ?auto_757261 ) ( ON ?auto_757263 ?auto_757262 ) ( ON ?auto_757264 ?auto_757263 ) ( ON ?auto_757265 ?auto_757264 ) ( ON ?auto_757266 ?auto_757265 ) ( ON ?auto_757267 ?auto_757266 ) ( ON ?auto_757268 ?auto_757267 ) ( ON ?auto_757269 ?auto_757268 ) ( ON ?auto_757270 ?auto_757269 ) ( ON ?auto_757271 ?auto_757270 ) ( ON ?auto_757272 ?auto_757271 ) ( CLEAR ?auto_757272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_757272 ?auto_757271 ?auto_757270 ?auto_757269 ?auto_757268 ?auto_757267 ?auto_757266 ?auto_757265 ?auto_757264 ?auto_757263 ?auto_757262 ?auto_757261 ?auto_757260 ?auto_757259 ?auto_757258 ?auto_757257 ?auto_757256 ?auto_757255 )
      ( MAKE-18PILE ?auto_757255 ?auto_757256 ?auto_757257 ?auto_757258 ?auto_757259 ?auto_757260 ?auto_757261 ?auto_757262 ?auto_757263 ?auto_757264 ?auto_757265 ?auto_757266 ?auto_757267 ?auto_757268 ?auto_757269 ?auto_757270 ?auto_757271 ?auto_757272 ) )
  )

)

