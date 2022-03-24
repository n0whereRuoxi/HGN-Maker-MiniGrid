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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33568 - BLOCK
      ?auto_33569 - BLOCK
      ?auto_33570 - BLOCK
      ?auto_33571 - BLOCK
      ?auto_33572 - BLOCK
    )
    :vars
    (
      ?auto_33573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33573 ?auto_33572 ) ( CLEAR ?auto_33573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33568 ) ( ON ?auto_33569 ?auto_33568 ) ( ON ?auto_33570 ?auto_33569 ) ( ON ?auto_33571 ?auto_33570 ) ( ON ?auto_33572 ?auto_33571 ) ( not ( = ?auto_33568 ?auto_33569 ) ) ( not ( = ?auto_33568 ?auto_33570 ) ) ( not ( = ?auto_33568 ?auto_33571 ) ) ( not ( = ?auto_33568 ?auto_33572 ) ) ( not ( = ?auto_33568 ?auto_33573 ) ) ( not ( = ?auto_33569 ?auto_33570 ) ) ( not ( = ?auto_33569 ?auto_33571 ) ) ( not ( = ?auto_33569 ?auto_33572 ) ) ( not ( = ?auto_33569 ?auto_33573 ) ) ( not ( = ?auto_33570 ?auto_33571 ) ) ( not ( = ?auto_33570 ?auto_33572 ) ) ( not ( = ?auto_33570 ?auto_33573 ) ) ( not ( = ?auto_33571 ?auto_33572 ) ) ( not ( = ?auto_33571 ?auto_33573 ) ) ( not ( = ?auto_33572 ?auto_33573 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33573 ?auto_33572 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33575 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33575 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_33575 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33576 - BLOCK
    )
    :vars
    (
      ?auto_33577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33576 ?auto_33577 ) ( CLEAR ?auto_33576 ) ( HAND-EMPTY ) ( not ( = ?auto_33576 ?auto_33577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33576 ?auto_33577 )
      ( MAKE-1PILE ?auto_33576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33582 - BLOCK
      ?auto_33583 - BLOCK
      ?auto_33584 - BLOCK
      ?auto_33585 - BLOCK
    )
    :vars
    (
      ?auto_33586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33586 ?auto_33585 ) ( CLEAR ?auto_33586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33582 ) ( ON ?auto_33583 ?auto_33582 ) ( ON ?auto_33584 ?auto_33583 ) ( ON ?auto_33585 ?auto_33584 ) ( not ( = ?auto_33582 ?auto_33583 ) ) ( not ( = ?auto_33582 ?auto_33584 ) ) ( not ( = ?auto_33582 ?auto_33585 ) ) ( not ( = ?auto_33582 ?auto_33586 ) ) ( not ( = ?auto_33583 ?auto_33584 ) ) ( not ( = ?auto_33583 ?auto_33585 ) ) ( not ( = ?auto_33583 ?auto_33586 ) ) ( not ( = ?auto_33584 ?auto_33585 ) ) ( not ( = ?auto_33584 ?auto_33586 ) ) ( not ( = ?auto_33585 ?auto_33586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33586 ?auto_33585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33587 - BLOCK
      ?auto_33588 - BLOCK
      ?auto_33589 - BLOCK
      ?auto_33590 - BLOCK
    )
    :vars
    (
      ?auto_33591 - BLOCK
      ?auto_33592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33591 ?auto_33590 ) ( CLEAR ?auto_33591 ) ( ON-TABLE ?auto_33587 ) ( ON ?auto_33588 ?auto_33587 ) ( ON ?auto_33589 ?auto_33588 ) ( ON ?auto_33590 ?auto_33589 ) ( not ( = ?auto_33587 ?auto_33588 ) ) ( not ( = ?auto_33587 ?auto_33589 ) ) ( not ( = ?auto_33587 ?auto_33590 ) ) ( not ( = ?auto_33587 ?auto_33591 ) ) ( not ( = ?auto_33588 ?auto_33589 ) ) ( not ( = ?auto_33588 ?auto_33590 ) ) ( not ( = ?auto_33588 ?auto_33591 ) ) ( not ( = ?auto_33589 ?auto_33590 ) ) ( not ( = ?auto_33589 ?auto_33591 ) ) ( not ( = ?auto_33590 ?auto_33591 ) ) ( HOLDING ?auto_33592 ) ( not ( = ?auto_33587 ?auto_33592 ) ) ( not ( = ?auto_33588 ?auto_33592 ) ) ( not ( = ?auto_33589 ?auto_33592 ) ) ( not ( = ?auto_33590 ?auto_33592 ) ) ( not ( = ?auto_33591 ?auto_33592 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_33592 )
      ( MAKE-4PILE ?auto_33587 ?auto_33588 ?auto_33589 ?auto_33590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33593 - BLOCK
      ?auto_33594 - BLOCK
      ?auto_33595 - BLOCK
      ?auto_33596 - BLOCK
    )
    :vars
    (
      ?auto_33597 - BLOCK
      ?auto_33598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33597 ?auto_33596 ) ( ON-TABLE ?auto_33593 ) ( ON ?auto_33594 ?auto_33593 ) ( ON ?auto_33595 ?auto_33594 ) ( ON ?auto_33596 ?auto_33595 ) ( not ( = ?auto_33593 ?auto_33594 ) ) ( not ( = ?auto_33593 ?auto_33595 ) ) ( not ( = ?auto_33593 ?auto_33596 ) ) ( not ( = ?auto_33593 ?auto_33597 ) ) ( not ( = ?auto_33594 ?auto_33595 ) ) ( not ( = ?auto_33594 ?auto_33596 ) ) ( not ( = ?auto_33594 ?auto_33597 ) ) ( not ( = ?auto_33595 ?auto_33596 ) ) ( not ( = ?auto_33595 ?auto_33597 ) ) ( not ( = ?auto_33596 ?auto_33597 ) ) ( not ( = ?auto_33593 ?auto_33598 ) ) ( not ( = ?auto_33594 ?auto_33598 ) ) ( not ( = ?auto_33595 ?auto_33598 ) ) ( not ( = ?auto_33596 ?auto_33598 ) ) ( not ( = ?auto_33597 ?auto_33598 ) ) ( ON ?auto_33598 ?auto_33597 ) ( CLEAR ?auto_33598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33593 ?auto_33594 ?auto_33595 ?auto_33596 ?auto_33597 )
      ( MAKE-4PILE ?auto_33593 ?auto_33594 ?auto_33595 ?auto_33596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33601 - BLOCK
      ?auto_33602 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33602 ) ( CLEAR ?auto_33601 ) ( ON-TABLE ?auto_33601 ) ( not ( = ?auto_33601 ?auto_33602 ) ) )
    :subtasks
    ( ( !STACK ?auto_33602 ?auto_33601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33603 - BLOCK
      ?auto_33604 - BLOCK
    )
    :vars
    (
      ?auto_33605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33603 ) ( ON-TABLE ?auto_33603 ) ( not ( = ?auto_33603 ?auto_33604 ) ) ( ON ?auto_33604 ?auto_33605 ) ( CLEAR ?auto_33604 ) ( HAND-EMPTY ) ( not ( = ?auto_33603 ?auto_33605 ) ) ( not ( = ?auto_33604 ?auto_33605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33604 ?auto_33605 )
      ( MAKE-2PILE ?auto_33603 ?auto_33604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33606 - BLOCK
      ?auto_33607 - BLOCK
    )
    :vars
    (
      ?auto_33608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33606 ?auto_33607 ) ) ( ON ?auto_33607 ?auto_33608 ) ( CLEAR ?auto_33607 ) ( not ( = ?auto_33606 ?auto_33608 ) ) ( not ( = ?auto_33607 ?auto_33608 ) ) ( HOLDING ?auto_33606 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33606 )
      ( MAKE-2PILE ?auto_33606 ?auto_33607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33609 - BLOCK
      ?auto_33610 - BLOCK
    )
    :vars
    (
      ?auto_33611 - BLOCK
      ?auto_33613 - BLOCK
      ?auto_33612 - BLOCK
      ?auto_33614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33609 ?auto_33610 ) ) ( ON ?auto_33610 ?auto_33611 ) ( not ( = ?auto_33609 ?auto_33611 ) ) ( not ( = ?auto_33610 ?auto_33611 ) ) ( ON ?auto_33609 ?auto_33610 ) ( CLEAR ?auto_33609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33613 ) ( ON ?auto_33612 ?auto_33613 ) ( ON ?auto_33614 ?auto_33612 ) ( ON ?auto_33611 ?auto_33614 ) ( not ( = ?auto_33613 ?auto_33612 ) ) ( not ( = ?auto_33613 ?auto_33614 ) ) ( not ( = ?auto_33613 ?auto_33611 ) ) ( not ( = ?auto_33613 ?auto_33610 ) ) ( not ( = ?auto_33613 ?auto_33609 ) ) ( not ( = ?auto_33612 ?auto_33614 ) ) ( not ( = ?auto_33612 ?auto_33611 ) ) ( not ( = ?auto_33612 ?auto_33610 ) ) ( not ( = ?auto_33612 ?auto_33609 ) ) ( not ( = ?auto_33614 ?auto_33611 ) ) ( not ( = ?auto_33614 ?auto_33610 ) ) ( not ( = ?auto_33614 ?auto_33609 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33613 ?auto_33612 ?auto_33614 ?auto_33611 ?auto_33610 )
      ( MAKE-2PILE ?auto_33609 ?auto_33610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33618 - BLOCK
      ?auto_33619 - BLOCK
      ?auto_33620 - BLOCK
    )
    :vars
    (
      ?auto_33621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33621 ?auto_33620 ) ( CLEAR ?auto_33621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33618 ) ( ON ?auto_33619 ?auto_33618 ) ( ON ?auto_33620 ?auto_33619 ) ( not ( = ?auto_33618 ?auto_33619 ) ) ( not ( = ?auto_33618 ?auto_33620 ) ) ( not ( = ?auto_33618 ?auto_33621 ) ) ( not ( = ?auto_33619 ?auto_33620 ) ) ( not ( = ?auto_33619 ?auto_33621 ) ) ( not ( = ?auto_33620 ?auto_33621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33621 ?auto_33620 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33622 - BLOCK
      ?auto_33623 - BLOCK
      ?auto_33624 - BLOCK
    )
    :vars
    (
      ?auto_33625 - BLOCK
      ?auto_33626 - BLOCK
      ?auto_33627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33625 ?auto_33624 ) ( CLEAR ?auto_33625 ) ( ON-TABLE ?auto_33622 ) ( ON ?auto_33623 ?auto_33622 ) ( ON ?auto_33624 ?auto_33623 ) ( not ( = ?auto_33622 ?auto_33623 ) ) ( not ( = ?auto_33622 ?auto_33624 ) ) ( not ( = ?auto_33622 ?auto_33625 ) ) ( not ( = ?auto_33623 ?auto_33624 ) ) ( not ( = ?auto_33623 ?auto_33625 ) ) ( not ( = ?auto_33624 ?auto_33625 ) ) ( HOLDING ?auto_33626 ) ( CLEAR ?auto_33627 ) ( not ( = ?auto_33622 ?auto_33626 ) ) ( not ( = ?auto_33622 ?auto_33627 ) ) ( not ( = ?auto_33623 ?auto_33626 ) ) ( not ( = ?auto_33623 ?auto_33627 ) ) ( not ( = ?auto_33624 ?auto_33626 ) ) ( not ( = ?auto_33624 ?auto_33627 ) ) ( not ( = ?auto_33625 ?auto_33626 ) ) ( not ( = ?auto_33625 ?auto_33627 ) ) ( not ( = ?auto_33626 ?auto_33627 ) ) )
    :subtasks
    ( ( !STACK ?auto_33626 ?auto_33627 )
      ( MAKE-3PILE ?auto_33622 ?auto_33623 ?auto_33624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33990 - BLOCK
      ?auto_33991 - BLOCK
      ?auto_33992 - BLOCK
    )
    :vars
    (
      ?auto_33993 - BLOCK
      ?auto_33994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33993 ?auto_33992 ) ( ON-TABLE ?auto_33990 ) ( ON ?auto_33991 ?auto_33990 ) ( ON ?auto_33992 ?auto_33991 ) ( not ( = ?auto_33990 ?auto_33991 ) ) ( not ( = ?auto_33990 ?auto_33992 ) ) ( not ( = ?auto_33990 ?auto_33993 ) ) ( not ( = ?auto_33991 ?auto_33992 ) ) ( not ( = ?auto_33991 ?auto_33993 ) ) ( not ( = ?auto_33992 ?auto_33993 ) ) ( not ( = ?auto_33990 ?auto_33994 ) ) ( not ( = ?auto_33991 ?auto_33994 ) ) ( not ( = ?auto_33992 ?auto_33994 ) ) ( not ( = ?auto_33993 ?auto_33994 ) ) ( ON ?auto_33994 ?auto_33993 ) ( CLEAR ?auto_33994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33990 ?auto_33991 ?auto_33992 ?auto_33993 )
      ( MAKE-3PILE ?auto_33990 ?auto_33991 ?auto_33992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33634 - BLOCK
      ?auto_33635 - BLOCK
      ?auto_33636 - BLOCK
    )
    :vars
    (
      ?auto_33639 - BLOCK
      ?auto_33638 - BLOCK
      ?auto_33637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33639 ?auto_33636 ) ( ON-TABLE ?auto_33634 ) ( ON ?auto_33635 ?auto_33634 ) ( ON ?auto_33636 ?auto_33635 ) ( not ( = ?auto_33634 ?auto_33635 ) ) ( not ( = ?auto_33634 ?auto_33636 ) ) ( not ( = ?auto_33634 ?auto_33639 ) ) ( not ( = ?auto_33635 ?auto_33636 ) ) ( not ( = ?auto_33635 ?auto_33639 ) ) ( not ( = ?auto_33636 ?auto_33639 ) ) ( not ( = ?auto_33634 ?auto_33638 ) ) ( not ( = ?auto_33634 ?auto_33637 ) ) ( not ( = ?auto_33635 ?auto_33638 ) ) ( not ( = ?auto_33635 ?auto_33637 ) ) ( not ( = ?auto_33636 ?auto_33638 ) ) ( not ( = ?auto_33636 ?auto_33637 ) ) ( not ( = ?auto_33639 ?auto_33638 ) ) ( not ( = ?auto_33639 ?auto_33637 ) ) ( not ( = ?auto_33638 ?auto_33637 ) ) ( ON ?auto_33638 ?auto_33639 ) ( CLEAR ?auto_33638 ) ( HOLDING ?auto_33637 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33637 )
      ( MAKE-3PILE ?auto_33634 ?auto_33635 ?auto_33636 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33640 - BLOCK
      ?auto_33641 - BLOCK
      ?auto_33642 - BLOCK
    )
    :vars
    (
      ?auto_33643 - BLOCK
      ?auto_33644 - BLOCK
      ?auto_33645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33643 ?auto_33642 ) ( ON-TABLE ?auto_33640 ) ( ON ?auto_33641 ?auto_33640 ) ( ON ?auto_33642 ?auto_33641 ) ( not ( = ?auto_33640 ?auto_33641 ) ) ( not ( = ?auto_33640 ?auto_33642 ) ) ( not ( = ?auto_33640 ?auto_33643 ) ) ( not ( = ?auto_33641 ?auto_33642 ) ) ( not ( = ?auto_33641 ?auto_33643 ) ) ( not ( = ?auto_33642 ?auto_33643 ) ) ( not ( = ?auto_33640 ?auto_33644 ) ) ( not ( = ?auto_33640 ?auto_33645 ) ) ( not ( = ?auto_33641 ?auto_33644 ) ) ( not ( = ?auto_33641 ?auto_33645 ) ) ( not ( = ?auto_33642 ?auto_33644 ) ) ( not ( = ?auto_33642 ?auto_33645 ) ) ( not ( = ?auto_33643 ?auto_33644 ) ) ( not ( = ?auto_33643 ?auto_33645 ) ) ( not ( = ?auto_33644 ?auto_33645 ) ) ( ON ?auto_33644 ?auto_33643 ) ( ON ?auto_33645 ?auto_33644 ) ( CLEAR ?auto_33645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33640 ?auto_33641 ?auto_33642 ?auto_33643 ?auto_33644 )
      ( MAKE-3PILE ?auto_33640 ?auto_33641 ?auto_33642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33649 - BLOCK
      ?auto_33650 - BLOCK
      ?auto_33651 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33651 ) ( CLEAR ?auto_33650 ) ( ON-TABLE ?auto_33649 ) ( ON ?auto_33650 ?auto_33649 ) ( not ( = ?auto_33649 ?auto_33650 ) ) ( not ( = ?auto_33649 ?auto_33651 ) ) ( not ( = ?auto_33650 ?auto_33651 ) ) )
    :subtasks
    ( ( !STACK ?auto_33651 ?auto_33650 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33652 - BLOCK
      ?auto_33653 - BLOCK
      ?auto_33654 - BLOCK
    )
    :vars
    (
      ?auto_33655 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33653 ) ( ON-TABLE ?auto_33652 ) ( ON ?auto_33653 ?auto_33652 ) ( not ( = ?auto_33652 ?auto_33653 ) ) ( not ( = ?auto_33652 ?auto_33654 ) ) ( not ( = ?auto_33653 ?auto_33654 ) ) ( ON ?auto_33654 ?auto_33655 ) ( CLEAR ?auto_33654 ) ( HAND-EMPTY ) ( not ( = ?auto_33652 ?auto_33655 ) ) ( not ( = ?auto_33653 ?auto_33655 ) ) ( not ( = ?auto_33654 ?auto_33655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33654 ?auto_33655 )
      ( MAKE-3PILE ?auto_33652 ?auto_33653 ?auto_33654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33656 - BLOCK
      ?auto_33657 - BLOCK
      ?auto_33658 - BLOCK
    )
    :vars
    (
      ?auto_33659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33656 ) ( not ( = ?auto_33656 ?auto_33657 ) ) ( not ( = ?auto_33656 ?auto_33658 ) ) ( not ( = ?auto_33657 ?auto_33658 ) ) ( ON ?auto_33658 ?auto_33659 ) ( CLEAR ?auto_33658 ) ( not ( = ?auto_33656 ?auto_33659 ) ) ( not ( = ?auto_33657 ?auto_33659 ) ) ( not ( = ?auto_33658 ?auto_33659 ) ) ( HOLDING ?auto_33657 ) ( CLEAR ?auto_33656 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33656 ?auto_33657 )
      ( MAKE-3PILE ?auto_33656 ?auto_33657 ?auto_33658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33660 - BLOCK
      ?auto_33661 - BLOCK
      ?auto_33662 - BLOCK
    )
    :vars
    (
      ?auto_33663 - BLOCK
      ?auto_33665 - BLOCK
      ?auto_33664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33660 ) ( not ( = ?auto_33660 ?auto_33661 ) ) ( not ( = ?auto_33660 ?auto_33662 ) ) ( not ( = ?auto_33661 ?auto_33662 ) ) ( ON ?auto_33662 ?auto_33663 ) ( not ( = ?auto_33660 ?auto_33663 ) ) ( not ( = ?auto_33661 ?auto_33663 ) ) ( not ( = ?auto_33662 ?auto_33663 ) ) ( CLEAR ?auto_33660 ) ( ON ?auto_33661 ?auto_33662 ) ( CLEAR ?auto_33661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33665 ) ( ON ?auto_33664 ?auto_33665 ) ( ON ?auto_33663 ?auto_33664 ) ( not ( = ?auto_33665 ?auto_33664 ) ) ( not ( = ?auto_33665 ?auto_33663 ) ) ( not ( = ?auto_33665 ?auto_33662 ) ) ( not ( = ?auto_33665 ?auto_33661 ) ) ( not ( = ?auto_33664 ?auto_33663 ) ) ( not ( = ?auto_33664 ?auto_33662 ) ) ( not ( = ?auto_33664 ?auto_33661 ) ) ( not ( = ?auto_33660 ?auto_33665 ) ) ( not ( = ?auto_33660 ?auto_33664 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33665 ?auto_33664 ?auto_33663 ?auto_33662 )
      ( MAKE-3PILE ?auto_33660 ?auto_33661 ?auto_33662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33666 - BLOCK
      ?auto_33667 - BLOCK
      ?auto_33668 - BLOCK
    )
    :vars
    (
      ?auto_33671 - BLOCK
      ?auto_33669 - BLOCK
      ?auto_33670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33666 ?auto_33667 ) ) ( not ( = ?auto_33666 ?auto_33668 ) ) ( not ( = ?auto_33667 ?auto_33668 ) ) ( ON ?auto_33668 ?auto_33671 ) ( not ( = ?auto_33666 ?auto_33671 ) ) ( not ( = ?auto_33667 ?auto_33671 ) ) ( not ( = ?auto_33668 ?auto_33671 ) ) ( ON ?auto_33667 ?auto_33668 ) ( CLEAR ?auto_33667 ) ( ON-TABLE ?auto_33669 ) ( ON ?auto_33670 ?auto_33669 ) ( ON ?auto_33671 ?auto_33670 ) ( not ( = ?auto_33669 ?auto_33670 ) ) ( not ( = ?auto_33669 ?auto_33671 ) ) ( not ( = ?auto_33669 ?auto_33668 ) ) ( not ( = ?auto_33669 ?auto_33667 ) ) ( not ( = ?auto_33670 ?auto_33671 ) ) ( not ( = ?auto_33670 ?auto_33668 ) ) ( not ( = ?auto_33670 ?auto_33667 ) ) ( not ( = ?auto_33666 ?auto_33669 ) ) ( not ( = ?auto_33666 ?auto_33670 ) ) ( HOLDING ?auto_33666 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33666 )
      ( MAKE-3PILE ?auto_33666 ?auto_33667 ?auto_33668 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33672 - BLOCK
      ?auto_33673 - BLOCK
      ?auto_33674 - BLOCK
    )
    :vars
    (
      ?auto_33677 - BLOCK
      ?auto_33675 - BLOCK
      ?auto_33676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33672 ?auto_33673 ) ) ( not ( = ?auto_33672 ?auto_33674 ) ) ( not ( = ?auto_33673 ?auto_33674 ) ) ( ON ?auto_33674 ?auto_33677 ) ( not ( = ?auto_33672 ?auto_33677 ) ) ( not ( = ?auto_33673 ?auto_33677 ) ) ( not ( = ?auto_33674 ?auto_33677 ) ) ( ON ?auto_33673 ?auto_33674 ) ( ON-TABLE ?auto_33675 ) ( ON ?auto_33676 ?auto_33675 ) ( ON ?auto_33677 ?auto_33676 ) ( not ( = ?auto_33675 ?auto_33676 ) ) ( not ( = ?auto_33675 ?auto_33677 ) ) ( not ( = ?auto_33675 ?auto_33674 ) ) ( not ( = ?auto_33675 ?auto_33673 ) ) ( not ( = ?auto_33676 ?auto_33677 ) ) ( not ( = ?auto_33676 ?auto_33674 ) ) ( not ( = ?auto_33676 ?auto_33673 ) ) ( not ( = ?auto_33672 ?auto_33675 ) ) ( not ( = ?auto_33672 ?auto_33676 ) ) ( ON ?auto_33672 ?auto_33673 ) ( CLEAR ?auto_33672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33675 ?auto_33676 ?auto_33677 ?auto_33674 ?auto_33673 )
      ( MAKE-3PILE ?auto_33672 ?auto_33673 ?auto_33674 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33680 - BLOCK
      ?auto_33681 - BLOCK
    )
    :vars
    (
      ?auto_33682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33682 ?auto_33681 ) ( CLEAR ?auto_33682 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33680 ) ( ON ?auto_33681 ?auto_33680 ) ( not ( = ?auto_33680 ?auto_33681 ) ) ( not ( = ?auto_33680 ?auto_33682 ) ) ( not ( = ?auto_33681 ?auto_33682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33682 ?auto_33681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33683 - BLOCK
      ?auto_33684 - BLOCK
    )
    :vars
    (
      ?auto_33685 - BLOCK
      ?auto_33686 - BLOCK
      ?auto_33687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33685 ?auto_33684 ) ( CLEAR ?auto_33685 ) ( ON-TABLE ?auto_33683 ) ( ON ?auto_33684 ?auto_33683 ) ( not ( = ?auto_33683 ?auto_33684 ) ) ( not ( = ?auto_33683 ?auto_33685 ) ) ( not ( = ?auto_33684 ?auto_33685 ) ) ( HOLDING ?auto_33686 ) ( CLEAR ?auto_33687 ) ( not ( = ?auto_33683 ?auto_33686 ) ) ( not ( = ?auto_33683 ?auto_33687 ) ) ( not ( = ?auto_33684 ?auto_33686 ) ) ( not ( = ?auto_33684 ?auto_33687 ) ) ( not ( = ?auto_33685 ?auto_33686 ) ) ( not ( = ?auto_33685 ?auto_33687 ) ) ( not ( = ?auto_33686 ?auto_33687 ) ) )
    :subtasks
    ( ( !STACK ?auto_33686 ?auto_33687 )
      ( MAKE-2PILE ?auto_33683 ?auto_33684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33688 - BLOCK
      ?auto_33689 - BLOCK
    )
    :vars
    (
      ?auto_33691 - BLOCK
      ?auto_33692 - BLOCK
      ?auto_33690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33691 ?auto_33689 ) ( ON-TABLE ?auto_33688 ) ( ON ?auto_33689 ?auto_33688 ) ( not ( = ?auto_33688 ?auto_33689 ) ) ( not ( = ?auto_33688 ?auto_33691 ) ) ( not ( = ?auto_33689 ?auto_33691 ) ) ( CLEAR ?auto_33692 ) ( not ( = ?auto_33688 ?auto_33690 ) ) ( not ( = ?auto_33688 ?auto_33692 ) ) ( not ( = ?auto_33689 ?auto_33690 ) ) ( not ( = ?auto_33689 ?auto_33692 ) ) ( not ( = ?auto_33691 ?auto_33690 ) ) ( not ( = ?auto_33691 ?auto_33692 ) ) ( not ( = ?auto_33690 ?auto_33692 ) ) ( ON ?auto_33690 ?auto_33691 ) ( CLEAR ?auto_33690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33688 ?auto_33689 ?auto_33691 )
      ( MAKE-2PILE ?auto_33688 ?auto_33689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33693 - BLOCK
      ?auto_33694 - BLOCK
    )
    :vars
    (
      ?auto_33697 - BLOCK
      ?auto_33695 - BLOCK
      ?auto_33696 - BLOCK
      ?auto_33698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33697 ?auto_33694 ) ( ON-TABLE ?auto_33693 ) ( ON ?auto_33694 ?auto_33693 ) ( not ( = ?auto_33693 ?auto_33694 ) ) ( not ( = ?auto_33693 ?auto_33697 ) ) ( not ( = ?auto_33694 ?auto_33697 ) ) ( not ( = ?auto_33693 ?auto_33695 ) ) ( not ( = ?auto_33693 ?auto_33696 ) ) ( not ( = ?auto_33694 ?auto_33695 ) ) ( not ( = ?auto_33694 ?auto_33696 ) ) ( not ( = ?auto_33697 ?auto_33695 ) ) ( not ( = ?auto_33697 ?auto_33696 ) ) ( not ( = ?auto_33695 ?auto_33696 ) ) ( ON ?auto_33695 ?auto_33697 ) ( CLEAR ?auto_33695 ) ( HOLDING ?auto_33696 ) ( CLEAR ?auto_33698 ) ( ON-TABLE ?auto_33698 ) ( not ( = ?auto_33698 ?auto_33696 ) ) ( not ( = ?auto_33693 ?auto_33698 ) ) ( not ( = ?auto_33694 ?auto_33698 ) ) ( not ( = ?auto_33697 ?auto_33698 ) ) ( not ( = ?auto_33695 ?auto_33698 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33698 ?auto_33696 )
      ( MAKE-2PILE ?auto_33693 ?auto_33694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34117 - BLOCK
      ?auto_34118 - BLOCK
    )
    :vars
    (
      ?auto_34121 - BLOCK
      ?auto_34120 - BLOCK
      ?auto_34119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34121 ?auto_34118 ) ( ON-TABLE ?auto_34117 ) ( ON ?auto_34118 ?auto_34117 ) ( not ( = ?auto_34117 ?auto_34118 ) ) ( not ( = ?auto_34117 ?auto_34121 ) ) ( not ( = ?auto_34118 ?auto_34121 ) ) ( not ( = ?auto_34117 ?auto_34120 ) ) ( not ( = ?auto_34117 ?auto_34119 ) ) ( not ( = ?auto_34118 ?auto_34120 ) ) ( not ( = ?auto_34118 ?auto_34119 ) ) ( not ( = ?auto_34121 ?auto_34120 ) ) ( not ( = ?auto_34121 ?auto_34119 ) ) ( not ( = ?auto_34120 ?auto_34119 ) ) ( ON ?auto_34120 ?auto_34121 ) ( ON ?auto_34119 ?auto_34120 ) ( CLEAR ?auto_34119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34117 ?auto_34118 ?auto_34121 ?auto_34120 )
      ( MAKE-2PILE ?auto_34117 ?auto_34118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33705 - BLOCK
      ?auto_33706 - BLOCK
    )
    :vars
    (
      ?auto_33707 - BLOCK
      ?auto_33708 - BLOCK
      ?auto_33709 - BLOCK
      ?auto_33710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33707 ?auto_33706 ) ( ON-TABLE ?auto_33705 ) ( ON ?auto_33706 ?auto_33705 ) ( not ( = ?auto_33705 ?auto_33706 ) ) ( not ( = ?auto_33705 ?auto_33707 ) ) ( not ( = ?auto_33706 ?auto_33707 ) ) ( not ( = ?auto_33705 ?auto_33708 ) ) ( not ( = ?auto_33705 ?auto_33709 ) ) ( not ( = ?auto_33706 ?auto_33708 ) ) ( not ( = ?auto_33706 ?auto_33709 ) ) ( not ( = ?auto_33707 ?auto_33708 ) ) ( not ( = ?auto_33707 ?auto_33709 ) ) ( not ( = ?auto_33708 ?auto_33709 ) ) ( ON ?auto_33708 ?auto_33707 ) ( not ( = ?auto_33710 ?auto_33709 ) ) ( not ( = ?auto_33705 ?auto_33710 ) ) ( not ( = ?auto_33706 ?auto_33710 ) ) ( not ( = ?auto_33707 ?auto_33710 ) ) ( not ( = ?auto_33708 ?auto_33710 ) ) ( ON ?auto_33709 ?auto_33708 ) ( CLEAR ?auto_33709 ) ( HOLDING ?auto_33710 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33710 )
      ( MAKE-2PILE ?auto_33705 ?auto_33706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_33711 - BLOCK
      ?auto_33712 - BLOCK
    )
    :vars
    (
      ?auto_33713 - BLOCK
      ?auto_33715 - BLOCK
      ?auto_33714 - BLOCK
      ?auto_33716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33713 ?auto_33712 ) ( ON-TABLE ?auto_33711 ) ( ON ?auto_33712 ?auto_33711 ) ( not ( = ?auto_33711 ?auto_33712 ) ) ( not ( = ?auto_33711 ?auto_33713 ) ) ( not ( = ?auto_33712 ?auto_33713 ) ) ( not ( = ?auto_33711 ?auto_33715 ) ) ( not ( = ?auto_33711 ?auto_33714 ) ) ( not ( = ?auto_33712 ?auto_33715 ) ) ( not ( = ?auto_33712 ?auto_33714 ) ) ( not ( = ?auto_33713 ?auto_33715 ) ) ( not ( = ?auto_33713 ?auto_33714 ) ) ( not ( = ?auto_33715 ?auto_33714 ) ) ( ON ?auto_33715 ?auto_33713 ) ( not ( = ?auto_33716 ?auto_33714 ) ) ( not ( = ?auto_33711 ?auto_33716 ) ) ( not ( = ?auto_33712 ?auto_33716 ) ) ( not ( = ?auto_33713 ?auto_33716 ) ) ( not ( = ?auto_33715 ?auto_33716 ) ) ( ON ?auto_33714 ?auto_33715 ) ( ON ?auto_33716 ?auto_33714 ) ( CLEAR ?auto_33716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33711 ?auto_33712 ?auto_33713 ?auto_33715 ?auto_33714 )
      ( MAKE-2PILE ?auto_33711 ?auto_33712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33721 - BLOCK
      ?auto_33722 - BLOCK
      ?auto_33723 - BLOCK
      ?auto_33724 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33724 ) ( CLEAR ?auto_33723 ) ( ON-TABLE ?auto_33721 ) ( ON ?auto_33722 ?auto_33721 ) ( ON ?auto_33723 ?auto_33722 ) ( not ( = ?auto_33721 ?auto_33722 ) ) ( not ( = ?auto_33721 ?auto_33723 ) ) ( not ( = ?auto_33721 ?auto_33724 ) ) ( not ( = ?auto_33722 ?auto_33723 ) ) ( not ( = ?auto_33722 ?auto_33724 ) ) ( not ( = ?auto_33723 ?auto_33724 ) ) )
    :subtasks
    ( ( !STACK ?auto_33724 ?auto_33723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33725 - BLOCK
      ?auto_33726 - BLOCK
      ?auto_33727 - BLOCK
      ?auto_33728 - BLOCK
    )
    :vars
    (
      ?auto_33729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33727 ) ( ON-TABLE ?auto_33725 ) ( ON ?auto_33726 ?auto_33725 ) ( ON ?auto_33727 ?auto_33726 ) ( not ( = ?auto_33725 ?auto_33726 ) ) ( not ( = ?auto_33725 ?auto_33727 ) ) ( not ( = ?auto_33725 ?auto_33728 ) ) ( not ( = ?auto_33726 ?auto_33727 ) ) ( not ( = ?auto_33726 ?auto_33728 ) ) ( not ( = ?auto_33727 ?auto_33728 ) ) ( ON ?auto_33728 ?auto_33729 ) ( CLEAR ?auto_33728 ) ( HAND-EMPTY ) ( not ( = ?auto_33725 ?auto_33729 ) ) ( not ( = ?auto_33726 ?auto_33729 ) ) ( not ( = ?auto_33727 ?auto_33729 ) ) ( not ( = ?auto_33728 ?auto_33729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33728 ?auto_33729 )
      ( MAKE-4PILE ?auto_33725 ?auto_33726 ?auto_33727 ?auto_33728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33730 - BLOCK
      ?auto_33731 - BLOCK
      ?auto_33732 - BLOCK
      ?auto_33733 - BLOCK
    )
    :vars
    (
      ?auto_33734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33730 ) ( ON ?auto_33731 ?auto_33730 ) ( not ( = ?auto_33730 ?auto_33731 ) ) ( not ( = ?auto_33730 ?auto_33732 ) ) ( not ( = ?auto_33730 ?auto_33733 ) ) ( not ( = ?auto_33731 ?auto_33732 ) ) ( not ( = ?auto_33731 ?auto_33733 ) ) ( not ( = ?auto_33732 ?auto_33733 ) ) ( ON ?auto_33733 ?auto_33734 ) ( CLEAR ?auto_33733 ) ( not ( = ?auto_33730 ?auto_33734 ) ) ( not ( = ?auto_33731 ?auto_33734 ) ) ( not ( = ?auto_33732 ?auto_33734 ) ) ( not ( = ?auto_33733 ?auto_33734 ) ) ( HOLDING ?auto_33732 ) ( CLEAR ?auto_33731 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33730 ?auto_33731 ?auto_33732 )
      ( MAKE-4PILE ?auto_33730 ?auto_33731 ?auto_33732 ?auto_33733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33735 - BLOCK
      ?auto_33736 - BLOCK
      ?auto_33737 - BLOCK
      ?auto_33738 - BLOCK
    )
    :vars
    (
      ?auto_33739 - BLOCK
      ?auto_33740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33735 ) ( ON ?auto_33736 ?auto_33735 ) ( not ( = ?auto_33735 ?auto_33736 ) ) ( not ( = ?auto_33735 ?auto_33737 ) ) ( not ( = ?auto_33735 ?auto_33738 ) ) ( not ( = ?auto_33736 ?auto_33737 ) ) ( not ( = ?auto_33736 ?auto_33738 ) ) ( not ( = ?auto_33737 ?auto_33738 ) ) ( ON ?auto_33738 ?auto_33739 ) ( not ( = ?auto_33735 ?auto_33739 ) ) ( not ( = ?auto_33736 ?auto_33739 ) ) ( not ( = ?auto_33737 ?auto_33739 ) ) ( not ( = ?auto_33738 ?auto_33739 ) ) ( CLEAR ?auto_33736 ) ( ON ?auto_33737 ?auto_33738 ) ( CLEAR ?auto_33737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33740 ) ( ON ?auto_33739 ?auto_33740 ) ( not ( = ?auto_33740 ?auto_33739 ) ) ( not ( = ?auto_33740 ?auto_33738 ) ) ( not ( = ?auto_33740 ?auto_33737 ) ) ( not ( = ?auto_33735 ?auto_33740 ) ) ( not ( = ?auto_33736 ?auto_33740 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33740 ?auto_33739 ?auto_33738 )
      ( MAKE-4PILE ?auto_33735 ?auto_33736 ?auto_33737 ?auto_33738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33741 - BLOCK
      ?auto_33742 - BLOCK
      ?auto_33743 - BLOCK
      ?auto_33744 - BLOCK
    )
    :vars
    (
      ?auto_33746 - BLOCK
      ?auto_33745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33741 ) ( not ( = ?auto_33741 ?auto_33742 ) ) ( not ( = ?auto_33741 ?auto_33743 ) ) ( not ( = ?auto_33741 ?auto_33744 ) ) ( not ( = ?auto_33742 ?auto_33743 ) ) ( not ( = ?auto_33742 ?auto_33744 ) ) ( not ( = ?auto_33743 ?auto_33744 ) ) ( ON ?auto_33744 ?auto_33746 ) ( not ( = ?auto_33741 ?auto_33746 ) ) ( not ( = ?auto_33742 ?auto_33746 ) ) ( not ( = ?auto_33743 ?auto_33746 ) ) ( not ( = ?auto_33744 ?auto_33746 ) ) ( ON ?auto_33743 ?auto_33744 ) ( CLEAR ?auto_33743 ) ( ON-TABLE ?auto_33745 ) ( ON ?auto_33746 ?auto_33745 ) ( not ( = ?auto_33745 ?auto_33746 ) ) ( not ( = ?auto_33745 ?auto_33744 ) ) ( not ( = ?auto_33745 ?auto_33743 ) ) ( not ( = ?auto_33741 ?auto_33745 ) ) ( not ( = ?auto_33742 ?auto_33745 ) ) ( HOLDING ?auto_33742 ) ( CLEAR ?auto_33741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33741 ?auto_33742 )
      ( MAKE-4PILE ?auto_33741 ?auto_33742 ?auto_33743 ?auto_33744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33747 - BLOCK
      ?auto_33748 - BLOCK
      ?auto_33749 - BLOCK
      ?auto_33750 - BLOCK
    )
    :vars
    (
      ?auto_33751 - BLOCK
      ?auto_33752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33747 ) ( not ( = ?auto_33747 ?auto_33748 ) ) ( not ( = ?auto_33747 ?auto_33749 ) ) ( not ( = ?auto_33747 ?auto_33750 ) ) ( not ( = ?auto_33748 ?auto_33749 ) ) ( not ( = ?auto_33748 ?auto_33750 ) ) ( not ( = ?auto_33749 ?auto_33750 ) ) ( ON ?auto_33750 ?auto_33751 ) ( not ( = ?auto_33747 ?auto_33751 ) ) ( not ( = ?auto_33748 ?auto_33751 ) ) ( not ( = ?auto_33749 ?auto_33751 ) ) ( not ( = ?auto_33750 ?auto_33751 ) ) ( ON ?auto_33749 ?auto_33750 ) ( ON-TABLE ?auto_33752 ) ( ON ?auto_33751 ?auto_33752 ) ( not ( = ?auto_33752 ?auto_33751 ) ) ( not ( = ?auto_33752 ?auto_33750 ) ) ( not ( = ?auto_33752 ?auto_33749 ) ) ( not ( = ?auto_33747 ?auto_33752 ) ) ( not ( = ?auto_33748 ?auto_33752 ) ) ( CLEAR ?auto_33747 ) ( ON ?auto_33748 ?auto_33749 ) ( CLEAR ?auto_33748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33752 ?auto_33751 ?auto_33750 ?auto_33749 )
      ( MAKE-4PILE ?auto_33747 ?auto_33748 ?auto_33749 ?auto_33750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33753 - BLOCK
      ?auto_33754 - BLOCK
      ?auto_33755 - BLOCK
      ?auto_33756 - BLOCK
    )
    :vars
    (
      ?auto_33757 - BLOCK
      ?auto_33758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33753 ?auto_33754 ) ) ( not ( = ?auto_33753 ?auto_33755 ) ) ( not ( = ?auto_33753 ?auto_33756 ) ) ( not ( = ?auto_33754 ?auto_33755 ) ) ( not ( = ?auto_33754 ?auto_33756 ) ) ( not ( = ?auto_33755 ?auto_33756 ) ) ( ON ?auto_33756 ?auto_33757 ) ( not ( = ?auto_33753 ?auto_33757 ) ) ( not ( = ?auto_33754 ?auto_33757 ) ) ( not ( = ?auto_33755 ?auto_33757 ) ) ( not ( = ?auto_33756 ?auto_33757 ) ) ( ON ?auto_33755 ?auto_33756 ) ( ON-TABLE ?auto_33758 ) ( ON ?auto_33757 ?auto_33758 ) ( not ( = ?auto_33758 ?auto_33757 ) ) ( not ( = ?auto_33758 ?auto_33756 ) ) ( not ( = ?auto_33758 ?auto_33755 ) ) ( not ( = ?auto_33753 ?auto_33758 ) ) ( not ( = ?auto_33754 ?auto_33758 ) ) ( ON ?auto_33754 ?auto_33755 ) ( CLEAR ?auto_33754 ) ( HOLDING ?auto_33753 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33753 )
      ( MAKE-4PILE ?auto_33753 ?auto_33754 ?auto_33755 ?auto_33756 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_33759 - BLOCK
      ?auto_33760 - BLOCK
      ?auto_33761 - BLOCK
      ?auto_33762 - BLOCK
    )
    :vars
    (
      ?auto_33764 - BLOCK
      ?auto_33763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33759 ?auto_33760 ) ) ( not ( = ?auto_33759 ?auto_33761 ) ) ( not ( = ?auto_33759 ?auto_33762 ) ) ( not ( = ?auto_33760 ?auto_33761 ) ) ( not ( = ?auto_33760 ?auto_33762 ) ) ( not ( = ?auto_33761 ?auto_33762 ) ) ( ON ?auto_33762 ?auto_33764 ) ( not ( = ?auto_33759 ?auto_33764 ) ) ( not ( = ?auto_33760 ?auto_33764 ) ) ( not ( = ?auto_33761 ?auto_33764 ) ) ( not ( = ?auto_33762 ?auto_33764 ) ) ( ON ?auto_33761 ?auto_33762 ) ( ON-TABLE ?auto_33763 ) ( ON ?auto_33764 ?auto_33763 ) ( not ( = ?auto_33763 ?auto_33764 ) ) ( not ( = ?auto_33763 ?auto_33762 ) ) ( not ( = ?auto_33763 ?auto_33761 ) ) ( not ( = ?auto_33759 ?auto_33763 ) ) ( not ( = ?auto_33760 ?auto_33763 ) ) ( ON ?auto_33760 ?auto_33761 ) ( ON ?auto_33759 ?auto_33760 ) ( CLEAR ?auto_33759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33763 ?auto_33764 ?auto_33762 ?auto_33761 ?auto_33760 )
      ( MAKE-4PILE ?auto_33759 ?auto_33760 ?auto_33761 ?auto_33762 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33766 - BLOCK
    )
    :vars
    (
      ?auto_33767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33767 ?auto_33766 ) ( CLEAR ?auto_33767 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33766 ) ( not ( = ?auto_33766 ?auto_33767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33767 ?auto_33766 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33768 - BLOCK
    )
    :vars
    (
      ?auto_33769 - BLOCK
      ?auto_33770 - BLOCK
      ?auto_33771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33769 ?auto_33768 ) ( CLEAR ?auto_33769 ) ( ON-TABLE ?auto_33768 ) ( not ( = ?auto_33768 ?auto_33769 ) ) ( HOLDING ?auto_33770 ) ( CLEAR ?auto_33771 ) ( not ( = ?auto_33768 ?auto_33770 ) ) ( not ( = ?auto_33768 ?auto_33771 ) ) ( not ( = ?auto_33769 ?auto_33770 ) ) ( not ( = ?auto_33769 ?auto_33771 ) ) ( not ( = ?auto_33770 ?auto_33771 ) ) )
    :subtasks
    ( ( !STACK ?auto_33770 ?auto_33771 )
      ( MAKE-1PILE ?auto_33768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33772 - BLOCK
    )
    :vars
    (
      ?auto_33774 - BLOCK
      ?auto_33773 - BLOCK
      ?auto_33775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33774 ?auto_33772 ) ( ON-TABLE ?auto_33772 ) ( not ( = ?auto_33772 ?auto_33774 ) ) ( CLEAR ?auto_33773 ) ( not ( = ?auto_33772 ?auto_33775 ) ) ( not ( = ?auto_33772 ?auto_33773 ) ) ( not ( = ?auto_33774 ?auto_33775 ) ) ( not ( = ?auto_33774 ?auto_33773 ) ) ( not ( = ?auto_33775 ?auto_33773 ) ) ( ON ?auto_33775 ?auto_33774 ) ( CLEAR ?auto_33775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33772 ?auto_33774 )
      ( MAKE-1PILE ?auto_33772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33776 - BLOCK
    )
    :vars
    (
      ?auto_33779 - BLOCK
      ?auto_33778 - BLOCK
      ?auto_33777 - BLOCK
      ?auto_33781 - BLOCK
      ?auto_33780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33779 ?auto_33776 ) ( ON-TABLE ?auto_33776 ) ( not ( = ?auto_33776 ?auto_33779 ) ) ( not ( = ?auto_33776 ?auto_33778 ) ) ( not ( = ?auto_33776 ?auto_33777 ) ) ( not ( = ?auto_33779 ?auto_33778 ) ) ( not ( = ?auto_33779 ?auto_33777 ) ) ( not ( = ?auto_33778 ?auto_33777 ) ) ( ON ?auto_33778 ?auto_33779 ) ( CLEAR ?auto_33778 ) ( HOLDING ?auto_33777 ) ( CLEAR ?auto_33781 ) ( ON-TABLE ?auto_33780 ) ( ON ?auto_33781 ?auto_33780 ) ( not ( = ?auto_33780 ?auto_33781 ) ) ( not ( = ?auto_33780 ?auto_33777 ) ) ( not ( = ?auto_33781 ?auto_33777 ) ) ( not ( = ?auto_33776 ?auto_33781 ) ) ( not ( = ?auto_33776 ?auto_33780 ) ) ( not ( = ?auto_33779 ?auto_33781 ) ) ( not ( = ?auto_33779 ?auto_33780 ) ) ( not ( = ?auto_33778 ?auto_33781 ) ) ( not ( = ?auto_33778 ?auto_33780 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33780 ?auto_33781 ?auto_33777 )
      ( MAKE-1PILE ?auto_33776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33782 - BLOCK
    )
    :vars
    (
      ?auto_33786 - BLOCK
      ?auto_33784 - BLOCK
      ?auto_33783 - BLOCK
      ?auto_33787 - BLOCK
      ?auto_33785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33786 ?auto_33782 ) ( ON-TABLE ?auto_33782 ) ( not ( = ?auto_33782 ?auto_33786 ) ) ( not ( = ?auto_33782 ?auto_33784 ) ) ( not ( = ?auto_33782 ?auto_33783 ) ) ( not ( = ?auto_33786 ?auto_33784 ) ) ( not ( = ?auto_33786 ?auto_33783 ) ) ( not ( = ?auto_33784 ?auto_33783 ) ) ( ON ?auto_33784 ?auto_33786 ) ( CLEAR ?auto_33787 ) ( ON-TABLE ?auto_33785 ) ( ON ?auto_33787 ?auto_33785 ) ( not ( = ?auto_33785 ?auto_33787 ) ) ( not ( = ?auto_33785 ?auto_33783 ) ) ( not ( = ?auto_33787 ?auto_33783 ) ) ( not ( = ?auto_33782 ?auto_33787 ) ) ( not ( = ?auto_33782 ?auto_33785 ) ) ( not ( = ?auto_33786 ?auto_33787 ) ) ( not ( = ?auto_33786 ?auto_33785 ) ) ( not ( = ?auto_33784 ?auto_33787 ) ) ( not ( = ?auto_33784 ?auto_33785 ) ) ( ON ?auto_33783 ?auto_33784 ) ( CLEAR ?auto_33783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33782 ?auto_33786 ?auto_33784 )
      ( MAKE-1PILE ?auto_33782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33788 - BLOCK
    )
    :vars
    (
      ?auto_33791 - BLOCK
      ?auto_33792 - BLOCK
      ?auto_33790 - BLOCK
      ?auto_33793 - BLOCK
      ?auto_33789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33791 ?auto_33788 ) ( ON-TABLE ?auto_33788 ) ( not ( = ?auto_33788 ?auto_33791 ) ) ( not ( = ?auto_33788 ?auto_33792 ) ) ( not ( = ?auto_33788 ?auto_33790 ) ) ( not ( = ?auto_33791 ?auto_33792 ) ) ( not ( = ?auto_33791 ?auto_33790 ) ) ( not ( = ?auto_33792 ?auto_33790 ) ) ( ON ?auto_33792 ?auto_33791 ) ( ON-TABLE ?auto_33793 ) ( not ( = ?auto_33793 ?auto_33789 ) ) ( not ( = ?auto_33793 ?auto_33790 ) ) ( not ( = ?auto_33789 ?auto_33790 ) ) ( not ( = ?auto_33788 ?auto_33789 ) ) ( not ( = ?auto_33788 ?auto_33793 ) ) ( not ( = ?auto_33791 ?auto_33789 ) ) ( not ( = ?auto_33791 ?auto_33793 ) ) ( not ( = ?auto_33792 ?auto_33789 ) ) ( not ( = ?auto_33792 ?auto_33793 ) ) ( ON ?auto_33790 ?auto_33792 ) ( CLEAR ?auto_33790 ) ( HOLDING ?auto_33789 ) ( CLEAR ?auto_33793 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33793 ?auto_33789 )
      ( MAKE-1PILE ?auto_33788 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34257 - BLOCK
    )
    :vars
    (
      ?auto_34258 - BLOCK
      ?auto_34259 - BLOCK
      ?auto_34260 - BLOCK
      ?auto_34261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34258 ?auto_34257 ) ( ON-TABLE ?auto_34257 ) ( not ( = ?auto_34257 ?auto_34258 ) ) ( not ( = ?auto_34257 ?auto_34259 ) ) ( not ( = ?auto_34257 ?auto_34260 ) ) ( not ( = ?auto_34258 ?auto_34259 ) ) ( not ( = ?auto_34258 ?auto_34260 ) ) ( not ( = ?auto_34259 ?auto_34260 ) ) ( ON ?auto_34259 ?auto_34258 ) ( not ( = ?auto_34261 ?auto_34260 ) ) ( not ( = ?auto_34257 ?auto_34261 ) ) ( not ( = ?auto_34258 ?auto_34261 ) ) ( not ( = ?auto_34259 ?auto_34261 ) ) ( ON ?auto_34260 ?auto_34259 ) ( ON ?auto_34261 ?auto_34260 ) ( CLEAR ?auto_34261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34257 ?auto_34258 ?auto_34259 ?auto_34260 )
      ( MAKE-1PILE ?auto_34257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33800 - BLOCK
    )
    :vars
    (
      ?auto_33803 - BLOCK
      ?auto_33802 - BLOCK
      ?auto_33801 - BLOCK
      ?auto_33804 - BLOCK
      ?auto_33805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33803 ?auto_33800 ) ( ON-TABLE ?auto_33800 ) ( not ( = ?auto_33800 ?auto_33803 ) ) ( not ( = ?auto_33800 ?auto_33802 ) ) ( not ( = ?auto_33800 ?auto_33801 ) ) ( not ( = ?auto_33803 ?auto_33802 ) ) ( not ( = ?auto_33803 ?auto_33801 ) ) ( not ( = ?auto_33802 ?auto_33801 ) ) ( ON ?auto_33802 ?auto_33803 ) ( not ( = ?auto_33804 ?auto_33805 ) ) ( not ( = ?auto_33804 ?auto_33801 ) ) ( not ( = ?auto_33805 ?auto_33801 ) ) ( not ( = ?auto_33800 ?auto_33805 ) ) ( not ( = ?auto_33800 ?auto_33804 ) ) ( not ( = ?auto_33803 ?auto_33805 ) ) ( not ( = ?auto_33803 ?auto_33804 ) ) ( not ( = ?auto_33802 ?auto_33805 ) ) ( not ( = ?auto_33802 ?auto_33804 ) ) ( ON ?auto_33801 ?auto_33802 ) ( ON ?auto_33805 ?auto_33801 ) ( CLEAR ?auto_33805 ) ( HOLDING ?auto_33804 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33804 )
      ( MAKE-1PILE ?auto_33800 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33806 - BLOCK
    )
    :vars
    (
      ?auto_33807 - BLOCK
      ?auto_33811 - BLOCK
      ?auto_33809 - BLOCK
      ?auto_33810 - BLOCK
      ?auto_33808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33807 ?auto_33806 ) ( ON-TABLE ?auto_33806 ) ( not ( = ?auto_33806 ?auto_33807 ) ) ( not ( = ?auto_33806 ?auto_33811 ) ) ( not ( = ?auto_33806 ?auto_33809 ) ) ( not ( = ?auto_33807 ?auto_33811 ) ) ( not ( = ?auto_33807 ?auto_33809 ) ) ( not ( = ?auto_33811 ?auto_33809 ) ) ( ON ?auto_33811 ?auto_33807 ) ( not ( = ?auto_33810 ?auto_33808 ) ) ( not ( = ?auto_33810 ?auto_33809 ) ) ( not ( = ?auto_33808 ?auto_33809 ) ) ( not ( = ?auto_33806 ?auto_33808 ) ) ( not ( = ?auto_33806 ?auto_33810 ) ) ( not ( = ?auto_33807 ?auto_33808 ) ) ( not ( = ?auto_33807 ?auto_33810 ) ) ( not ( = ?auto_33811 ?auto_33808 ) ) ( not ( = ?auto_33811 ?auto_33810 ) ) ( ON ?auto_33809 ?auto_33811 ) ( ON ?auto_33808 ?auto_33809 ) ( ON ?auto_33810 ?auto_33808 ) ( CLEAR ?auto_33810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33806 ?auto_33807 ?auto_33811 ?auto_33809 ?auto_33808 )
      ( MAKE-1PILE ?auto_33806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33817 - BLOCK
      ?auto_33818 - BLOCK
      ?auto_33819 - BLOCK
      ?auto_33820 - BLOCK
      ?auto_33821 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_33821 ) ( CLEAR ?auto_33820 ) ( ON-TABLE ?auto_33817 ) ( ON ?auto_33818 ?auto_33817 ) ( ON ?auto_33819 ?auto_33818 ) ( ON ?auto_33820 ?auto_33819 ) ( not ( = ?auto_33817 ?auto_33818 ) ) ( not ( = ?auto_33817 ?auto_33819 ) ) ( not ( = ?auto_33817 ?auto_33820 ) ) ( not ( = ?auto_33817 ?auto_33821 ) ) ( not ( = ?auto_33818 ?auto_33819 ) ) ( not ( = ?auto_33818 ?auto_33820 ) ) ( not ( = ?auto_33818 ?auto_33821 ) ) ( not ( = ?auto_33819 ?auto_33820 ) ) ( not ( = ?auto_33819 ?auto_33821 ) ) ( not ( = ?auto_33820 ?auto_33821 ) ) )
    :subtasks
    ( ( !STACK ?auto_33821 ?auto_33820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33822 - BLOCK
      ?auto_33823 - BLOCK
      ?auto_33824 - BLOCK
      ?auto_33825 - BLOCK
      ?auto_33826 - BLOCK
    )
    :vars
    (
      ?auto_33827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_33825 ) ( ON-TABLE ?auto_33822 ) ( ON ?auto_33823 ?auto_33822 ) ( ON ?auto_33824 ?auto_33823 ) ( ON ?auto_33825 ?auto_33824 ) ( not ( = ?auto_33822 ?auto_33823 ) ) ( not ( = ?auto_33822 ?auto_33824 ) ) ( not ( = ?auto_33822 ?auto_33825 ) ) ( not ( = ?auto_33822 ?auto_33826 ) ) ( not ( = ?auto_33823 ?auto_33824 ) ) ( not ( = ?auto_33823 ?auto_33825 ) ) ( not ( = ?auto_33823 ?auto_33826 ) ) ( not ( = ?auto_33824 ?auto_33825 ) ) ( not ( = ?auto_33824 ?auto_33826 ) ) ( not ( = ?auto_33825 ?auto_33826 ) ) ( ON ?auto_33826 ?auto_33827 ) ( CLEAR ?auto_33826 ) ( HAND-EMPTY ) ( not ( = ?auto_33822 ?auto_33827 ) ) ( not ( = ?auto_33823 ?auto_33827 ) ) ( not ( = ?auto_33824 ?auto_33827 ) ) ( not ( = ?auto_33825 ?auto_33827 ) ) ( not ( = ?auto_33826 ?auto_33827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33826 ?auto_33827 )
      ( MAKE-5PILE ?auto_33822 ?auto_33823 ?auto_33824 ?auto_33825 ?auto_33826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33828 - BLOCK
      ?auto_33829 - BLOCK
      ?auto_33830 - BLOCK
      ?auto_33831 - BLOCK
      ?auto_33832 - BLOCK
    )
    :vars
    (
      ?auto_33833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33828 ) ( ON ?auto_33829 ?auto_33828 ) ( ON ?auto_33830 ?auto_33829 ) ( not ( = ?auto_33828 ?auto_33829 ) ) ( not ( = ?auto_33828 ?auto_33830 ) ) ( not ( = ?auto_33828 ?auto_33831 ) ) ( not ( = ?auto_33828 ?auto_33832 ) ) ( not ( = ?auto_33829 ?auto_33830 ) ) ( not ( = ?auto_33829 ?auto_33831 ) ) ( not ( = ?auto_33829 ?auto_33832 ) ) ( not ( = ?auto_33830 ?auto_33831 ) ) ( not ( = ?auto_33830 ?auto_33832 ) ) ( not ( = ?auto_33831 ?auto_33832 ) ) ( ON ?auto_33832 ?auto_33833 ) ( CLEAR ?auto_33832 ) ( not ( = ?auto_33828 ?auto_33833 ) ) ( not ( = ?auto_33829 ?auto_33833 ) ) ( not ( = ?auto_33830 ?auto_33833 ) ) ( not ( = ?auto_33831 ?auto_33833 ) ) ( not ( = ?auto_33832 ?auto_33833 ) ) ( HOLDING ?auto_33831 ) ( CLEAR ?auto_33830 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33828 ?auto_33829 ?auto_33830 ?auto_33831 )
      ( MAKE-5PILE ?auto_33828 ?auto_33829 ?auto_33830 ?auto_33831 ?auto_33832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33834 - BLOCK
      ?auto_33835 - BLOCK
      ?auto_33836 - BLOCK
      ?auto_33837 - BLOCK
      ?auto_33838 - BLOCK
    )
    :vars
    (
      ?auto_33839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33834 ) ( ON ?auto_33835 ?auto_33834 ) ( ON ?auto_33836 ?auto_33835 ) ( not ( = ?auto_33834 ?auto_33835 ) ) ( not ( = ?auto_33834 ?auto_33836 ) ) ( not ( = ?auto_33834 ?auto_33837 ) ) ( not ( = ?auto_33834 ?auto_33838 ) ) ( not ( = ?auto_33835 ?auto_33836 ) ) ( not ( = ?auto_33835 ?auto_33837 ) ) ( not ( = ?auto_33835 ?auto_33838 ) ) ( not ( = ?auto_33836 ?auto_33837 ) ) ( not ( = ?auto_33836 ?auto_33838 ) ) ( not ( = ?auto_33837 ?auto_33838 ) ) ( ON ?auto_33838 ?auto_33839 ) ( not ( = ?auto_33834 ?auto_33839 ) ) ( not ( = ?auto_33835 ?auto_33839 ) ) ( not ( = ?auto_33836 ?auto_33839 ) ) ( not ( = ?auto_33837 ?auto_33839 ) ) ( not ( = ?auto_33838 ?auto_33839 ) ) ( CLEAR ?auto_33836 ) ( ON ?auto_33837 ?auto_33838 ) ( CLEAR ?auto_33837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33839 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33839 ?auto_33838 )
      ( MAKE-5PILE ?auto_33834 ?auto_33835 ?auto_33836 ?auto_33837 ?auto_33838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33840 - BLOCK
      ?auto_33841 - BLOCK
      ?auto_33842 - BLOCK
      ?auto_33843 - BLOCK
      ?auto_33844 - BLOCK
    )
    :vars
    (
      ?auto_33845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33840 ) ( ON ?auto_33841 ?auto_33840 ) ( not ( = ?auto_33840 ?auto_33841 ) ) ( not ( = ?auto_33840 ?auto_33842 ) ) ( not ( = ?auto_33840 ?auto_33843 ) ) ( not ( = ?auto_33840 ?auto_33844 ) ) ( not ( = ?auto_33841 ?auto_33842 ) ) ( not ( = ?auto_33841 ?auto_33843 ) ) ( not ( = ?auto_33841 ?auto_33844 ) ) ( not ( = ?auto_33842 ?auto_33843 ) ) ( not ( = ?auto_33842 ?auto_33844 ) ) ( not ( = ?auto_33843 ?auto_33844 ) ) ( ON ?auto_33844 ?auto_33845 ) ( not ( = ?auto_33840 ?auto_33845 ) ) ( not ( = ?auto_33841 ?auto_33845 ) ) ( not ( = ?auto_33842 ?auto_33845 ) ) ( not ( = ?auto_33843 ?auto_33845 ) ) ( not ( = ?auto_33844 ?auto_33845 ) ) ( ON ?auto_33843 ?auto_33844 ) ( CLEAR ?auto_33843 ) ( ON-TABLE ?auto_33845 ) ( HOLDING ?auto_33842 ) ( CLEAR ?auto_33841 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33840 ?auto_33841 ?auto_33842 )
      ( MAKE-5PILE ?auto_33840 ?auto_33841 ?auto_33842 ?auto_33843 ?auto_33844 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33846 - BLOCK
      ?auto_33847 - BLOCK
      ?auto_33848 - BLOCK
      ?auto_33849 - BLOCK
      ?auto_33850 - BLOCK
    )
    :vars
    (
      ?auto_33851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33846 ) ( ON ?auto_33847 ?auto_33846 ) ( not ( = ?auto_33846 ?auto_33847 ) ) ( not ( = ?auto_33846 ?auto_33848 ) ) ( not ( = ?auto_33846 ?auto_33849 ) ) ( not ( = ?auto_33846 ?auto_33850 ) ) ( not ( = ?auto_33847 ?auto_33848 ) ) ( not ( = ?auto_33847 ?auto_33849 ) ) ( not ( = ?auto_33847 ?auto_33850 ) ) ( not ( = ?auto_33848 ?auto_33849 ) ) ( not ( = ?auto_33848 ?auto_33850 ) ) ( not ( = ?auto_33849 ?auto_33850 ) ) ( ON ?auto_33850 ?auto_33851 ) ( not ( = ?auto_33846 ?auto_33851 ) ) ( not ( = ?auto_33847 ?auto_33851 ) ) ( not ( = ?auto_33848 ?auto_33851 ) ) ( not ( = ?auto_33849 ?auto_33851 ) ) ( not ( = ?auto_33850 ?auto_33851 ) ) ( ON ?auto_33849 ?auto_33850 ) ( ON-TABLE ?auto_33851 ) ( CLEAR ?auto_33847 ) ( ON ?auto_33848 ?auto_33849 ) ( CLEAR ?auto_33848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33851 ?auto_33850 ?auto_33849 )
      ( MAKE-5PILE ?auto_33846 ?auto_33847 ?auto_33848 ?auto_33849 ?auto_33850 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33852 - BLOCK
      ?auto_33853 - BLOCK
      ?auto_33854 - BLOCK
      ?auto_33855 - BLOCK
      ?auto_33856 - BLOCK
    )
    :vars
    (
      ?auto_33857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33852 ) ( not ( = ?auto_33852 ?auto_33853 ) ) ( not ( = ?auto_33852 ?auto_33854 ) ) ( not ( = ?auto_33852 ?auto_33855 ) ) ( not ( = ?auto_33852 ?auto_33856 ) ) ( not ( = ?auto_33853 ?auto_33854 ) ) ( not ( = ?auto_33853 ?auto_33855 ) ) ( not ( = ?auto_33853 ?auto_33856 ) ) ( not ( = ?auto_33854 ?auto_33855 ) ) ( not ( = ?auto_33854 ?auto_33856 ) ) ( not ( = ?auto_33855 ?auto_33856 ) ) ( ON ?auto_33856 ?auto_33857 ) ( not ( = ?auto_33852 ?auto_33857 ) ) ( not ( = ?auto_33853 ?auto_33857 ) ) ( not ( = ?auto_33854 ?auto_33857 ) ) ( not ( = ?auto_33855 ?auto_33857 ) ) ( not ( = ?auto_33856 ?auto_33857 ) ) ( ON ?auto_33855 ?auto_33856 ) ( ON-TABLE ?auto_33857 ) ( ON ?auto_33854 ?auto_33855 ) ( CLEAR ?auto_33854 ) ( HOLDING ?auto_33853 ) ( CLEAR ?auto_33852 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33852 ?auto_33853 )
      ( MAKE-5PILE ?auto_33852 ?auto_33853 ?auto_33854 ?auto_33855 ?auto_33856 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33858 - BLOCK
      ?auto_33859 - BLOCK
      ?auto_33860 - BLOCK
      ?auto_33861 - BLOCK
      ?auto_33862 - BLOCK
    )
    :vars
    (
      ?auto_33863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_33858 ) ( not ( = ?auto_33858 ?auto_33859 ) ) ( not ( = ?auto_33858 ?auto_33860 ) ) ( not ( = ?auto_33858 ?auto_33861 ) ) ( not ( = ?auto_33858 ?auto_33862 ) ) ( not ( = ?auto_33859 ?auto_33860 ) ) ( not ( = ?auto_33859 ?auto_33861 ) ) ( not ( = ?auto_33859 ?auto_33862 ) ) ( not ( = ?auto_33860 ?auto_33861 ) ) ( not ( = ?auto_33860 ?auto_33862 ) ) ( not ( = ?auto_33861 ?auto_33862 ) ) ( ON ?auto_33862 ?auto_33863 ) ( not ( = ?auto_33858 ?auto_33863 ) ) ( not ( = ?auto_33859 ?auto_33863 ) ) ( not ( = ?auto_33860 ?auto_33863 ) ) ( not ( = ?auto_33861 ?auto_33863 ) ) ( not ( = ?auto_33862 ?auto_33863 ) ) ( ON ?auto_33861 ?auto_33862 ) ( ON-TABLE ?auto_33863 ) ( ON ?auto_33860 ?auto_33861 ) ( CLEAR ?auto_33858 ) ( ON ?auto_33859 ?auto_33860 ) ( CLEAR ?auto_33859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33863 ?auto_33862 ?auto_33861 ?auto_33860 )
      ( MAKE-5PILE ?auto_33858 ?auto_33859 ?auto_33860 ?auto_33861 ?auto_33862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33864 - BLOCK
      ?auto_33865 - BLOCK
      ?auto_33866 - BLOCK
      ?auto_33867 - BLOCK
      ?auto_33868 - BLOCK
    )
    :vars
    (
      ?auto_33869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33864 ?auto_33865 ) ) ( not ( = ?auto_33864 ?auto_33866 ) ) ( not ( = ?auto_33864 ?auto_33867 ) ) ( not ( = ?auto_33864 ?auto_33868 ) ) ( not ( = ?auto_33865 ?auto_33866 ) ) ( not ( = ?auto_33865 ?auto_33867 ) ) ( not ( = ?auto_33865 ?auto_33868 ) ) ( not ( = ?auto_33866 ?auto_33867 ) ) ( not ( = ?auto_33866 ?auto_33868 ) ) ( not ( = ?auto_33867 ?auto_33868 ) ) ( ON ?auto_33868 ?auto_33869 ) ( not ( = ?auto_33864 ?auto_33869 ) ) ( not ( = ?auto_33865 ?auto_33869 ) ) ( not ( = ?auto_33866 ?auto_33869 ) ) ( not ( = ?auto_33867 ?auto_33869 ) ) ( not ( = ?auto_33868 ?auto_33869 ) ) ( ON ?auto_33867 ?auto_33868 ) ( ON-TABLE ?auto_33869 ) ( ON ?auto_33866 ?auto_33867 ) ( ON ?auto_33865 ?auto_33866 ) ( CLEAR ?auto_33865 ) ( HOLDING ?auto_33864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33864 )
      ( MAKE-5PILE ?auto_33864 ?auto_33865 ?auto_33866 ?auto_33867 ?auto_33868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_33870 - BLOCK
      ?auto_33871 - BLOCK
      ?auto_33872 - BLOCK
      ?auto_33873 - BLOCK
      ?auto_33874 - BLOCK
    )
    :vars
    (
      ?auto_33875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_33870 ?auto_33871 ) ) ( not ( = ?auto_33870 ?auto_33872 ) ) ( not ( = ?auto_33870 ?auto_33873 ) ) ( not ( = ?auto_33870 ?auto_33874 ) ) ( not ( = ?auto_33871 ?auto_33872 ) ) ( not ( = ?auto_33871 ?auto_33873 ) ) ( not ( = ?auto_33871 ?auto_33874 ) ) ( not ( = ?auto_33872 ?auto_33873 ) ) ( not ( = ?auto_33872 ?auto_33874 ) ) ( not ( = ?auto_33873 ?auto_33874 ) ) ( ON ?auto_33874 ?auto_33875 ) ( not ( = ?auto_33870 ?auto_33875 ) ) ( not ( = ?auto_33871 ?auto_33875 ) ) ( not ( = ?auto_33872 ?auto_33875 ) ) ( not ( = ?auto_33873 ?auto_33875 ) ) ( not ( = ?auto_33874 ?auto_33875 ) ) ( ON ?auto_33873 ?auto_33874 ) ( ON-TABLE ?auto_33875 ) ( ON ?auto_33872 ?auto_33873 ) ( ON ?auto_33871 ?auto_33872 ) ( ON ?auto_33870 ?auto_33871 ) ( CLEAR ?auto_33870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33875 ?auto_33874 ?auto_33873 ?auto_33872 ?auto_33871 )
      ( MAKE-5PILE ?auto_33870 ?auto_33871 ?auto_33872 ?auto_33873 ?auto_33874 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33934 - BLOCK
    )
    :vars
    (
      ?auto_33935 - BLOCK
      ?auto_33936 - BLOCK
      ?auto_33937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33934 ?auto_33935 ) ( CLEAR ?auto_33934 ) ( not ( = ?auto_33934 ?auto_33935 ) ) ( HOLDING ?auto_33936 ) ( CLEAR ?auto_33937 ) ( not ( = ?auto_33934 ?auto_33936 ) ) ( not ( = ?auto_33934 ?auto_33937 ) ) ( not ( = ?auto_33935 ?auto_33936 ) ) ( not ( = ?auto_33935 ?auto_33937 ) ) ( not ( = ?auto_33936 ?auto_33937 ) ) )
    :subtasks
    ( ( !STACK ?auto_33936 ?auto_33937 )
      ( MAKE-1PILE ?auto_33934 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33938 - BLOCK
    )
    :vars
    (
      ?auto_33940 - BLOCK
      ?auto_33939 - BLOCK
      ?auto_33941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33938 ?auto_33940 ) ( not ( = ?auto_33938 ?auto_33940 ) ) ( CLEAR ?auto_33939 ) ( not ( = ?auto_33938 ?auto_33941 ) ) ( not ( = ?auto_33938 ?auto_33939 ) ) ( not ( = ?auto_33940 ?auto_33941 ) ) ( not ( = ?auto_33940 ?auto_33939 ) ) ( not ( = ?auto_33941 ?auto_33939 ) ) ( ON ?auto_33941 ?auto_33938 ) ( CLEAR ?auto_33941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_33940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33940 ?auto_33938 )
      ( MAKE-1PILE ?auto_33938 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33942 - BLOCK
    )
    :vars
    (
      ?auto_33945 - BLOCK
      ?auto_33944 - BLOCK
      ?auto_33943 - BLOCK
      ?auto_33947 - BLOCK
      ?auto_33946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33942 ?auto_33945 ) ( not ( = ?auto_33942 ?auto_33945 ) ) ( not ( = ?auto_33942 ?auto_33944 ) ) ( not ( = ?auto_33942 ?auto_33943 ) ) ( not ( = ?auto_33945 ?auto_33944 ) ) ( not ( = ?auto_33945 ?auto_33943 ) ) ( not ( = ?auto_33944 ?auto_33943 ) ) ( ON ?auto_33944 ?auto_33942 ) ( CLEAR ?auto_33944 ) ( ON-TABLE ?auto_33945 ) ( HOLDING ?auto_33943 ) ( CLEAR ?auto_33947 ) ( ON-TABLE ?auto_33946 ) ( ON ?auto_33947 ?auto_33946 ) ( not ( = ?auto_33946 ?auto_33947 ) ) ( not ( = ?auto_33946 ?auto_33943 ) ) ( not ( = ?auto_33947 ?auto_33943 ) ) ( not ( = ?auto_33942 ?auto_33947 ) ) ( not ( = ?auto_33942 ?auto_33946 ) ) ( not ( = ?auto_33945 ?auto_33947 ) ) ( not ( = ?auto_33945 ?auto_33946 ) ) ( not ( = ?auto_33944 ?auto_33947 ) ) ( not ( = ?auto_33944 ?auto_33946 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33946 ?auto_33947 ?auto_33943 )
      ( MAKE-1PILE ?auto_33942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33948 - BLOCK
    )
    :vars
    (
      ?auto_33951 - BLOCK
      ?auto_33949 - BLOCK
      ?auto_33953 - BLOCK
      ?auto_33950 - BLOCK
      ?auto_33952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33948 ?auto_33951 ) ( not ( = ?auto_33948 ?auto_33951 ) ) ( not ( = ?auto_33948 ?auto_33949 ) ) ( not ( = ?auto_33948 ?auto_33953 ) ) ( not ( = ?auto_33951 ?auto_33949 ) ) ( not ( = ?auto_33951 ?auto_33953 ) ) ( not ( = ?auto_33949 ?auto_33953 ) ) ( ON ?auto_33949 ?auto_33948 ) ( ON-TABLE ?auto_33951 ) ( CLEAR ?auto_33950 ) ( ON-TABLE ?auto_33952 ) ( ON ?auto_33950 ?auto_33952 ) ( not ( = ?auto_33952 ?auto_33950 ) ) ( not ( = ?auto_33952 ?auto_33953 ) ) ( not ( = ?auto_33950 ?auto_33953 ) ) ( not ( = ?auto_33948 ?auto_33950 ) ) ( not ( = ?auto_33948 ?auto_33952 ) ) ( not ( = ?auto_33951 ?auto_33950 ) ) ( not ( = ?auto_33951 ?auto_33952 ) ) ( not ( = ?auto_33949 ?auto_33950 ) ) ( not ( = ?auto_33949 ?auto_33952 ) ) ( ON ?auto_33953 ?auto_33949 ) ( CLEAR ?auto_33953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_33951 ?auto_33948 ?auto_33949 )
      ( MAKE-1PILE ?auto_33948 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33954 - BLOCK
    )
    :vars
    (
      ?auto_33955 - BLOCK
      ?auto_33959 - BLOCK
      ?auto_33958 - BLOCK
      ?auto_33957 - BLOCK
      ?auto_33956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33954 ?auto_33955 ) ( not ( = ?auto_33954 ?auto_33955 ) ) ( not ( = ?auto_33954 ?auto_33959 ) ) ( not ( = ?auto_33954 ?auto_33958 ) ) ( not ( = ?auto_33955 ?auto_33959 ) ) ( not ( = ?auto_33955 ?auto_33958 ) ) ( not ( = ?auto_33959 ?auto_33958 ) ) ( ON ?auto_33959 ?auto_33954 ) ( ON-TABLE ?auto_33955 ) ( ON-TABLE ?auto_33957 ) ( not ( = ?auto_33957 ?auto_33956 ) ) ( not ( = ?auto_33957 ?auto_33958 ) ) ( not ( = ?auto_33956 ?auto_33958 ) ) ( not ( = ?auto_33954 ?auto_33956 ) ) ( not ( = ?auto_33954 ?auto_33957 ) ) ( not ( = ?auto_33955 ?auto_33956 ) ) ( not ( = ?auto_33955 ?auto_33957 ) ) ( not ( = ?auto_33959 ?auto_33956 ) ) ( not ( = ?auto_33959 ?auto_33957 ) ) ( ON ?auto_33958 ?auto_33959 ) ( CLEAR ?auto_33958 ) ( HOLDING ?auto_33956 ) ( CLEAR ?auto_33957 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_33957 ?auto_33956 )
      ( MAKE-1PILE ?auto_33954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33960 - BLOCK
    )
    :vars
    (
      ?auto_33964 - BLOCK
      ?auto_33961 - BLOCK
      ?auto_33962 - BLOCK
      ?auto_33963 - BLOCK
      ?auto_33965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33960 ?auto_33964 ) ( not ( = ?auto_33960 ?auto_33964 ) ) ( not ( = ?auto_33960 ?auto_33961 ) ) ( not ( = ?auto_33960 ?auto_33962 ) ) ( not ( = ?auto_33964 ?auto_33961 ) ) ( not ( = ?auto_33964 ?auto_33962 ) ) ( not ( = ?auto_33961 ?auto_33962 ) ) ( ON ?auto_33961 ?auto_33960 ) ( ON-TABLE ?auto_33964 ) ( ON-TABLE ?auto_33963 ) ( not ( = ?auto_33963 ?auto_33965 ) ) ( not ( = ?auto_33963 ?auto_33962 ) ) ( not ( = ?auto_33965 ?auto_33962 ) ) ( not ( = ?auto_33960 ?auto_33965 ) ) ( not ( = ?auto_33960 ?auto_33963 ) ) ( not ( = ?auto_33964 ?auto_33965 ) ) ( not ( = ?auto_33964 ?auto_33963 ) ) ( not ( = ?auto_33961 ?auto_33965 ) ) ( not ( = ?auto_33961 ?auto_33963 ) ) ( ON ?auto_33962 ?auto_33961 ) ( CLEAR ?auto_33963 ) ( ON ?auto_33965 ?auto_33962 ) ( CLEAR ?auto_33965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_33964 ?auto_33960 ?auto_33961 ?auto_33962 )
      ( MAKE-1PILE ?auto_33960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33966 - BLOCK
    )
    :vars
    (
      ?auto_33969 - BLOCK
      ?auto_33967 - BLOCK
      ?auto_33968 - BLOCK
      ?auto_33971 - BLOCK
      ?auto_33970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33966 ?auto_33969 ) ( not ( = ?auto_33966 ?auto_33969 ) ) ( not ( = ?auto_33966 ?auto_33967 ) ) ( not ( = ?auto_33966 ?auto_33968 ) ) ( not ( = ?auto_33969 ?auto_33967 ) ) ( not ( = ?auto_33969 ?auto_33968 ) ) ( not ( = ?auto_33967 ?auto_33968 ) ) ( ON ?auto_33967 ?auto_33966 ) ( ON-TABLE ?auto_33969 ) ( not ( = ?auto_33971 ?auto_33970 ) ) ( not ( = ?auto_33971 ?auto_33968 ) ) ( not ( = ?auto_33970 ?auto_33968 ) ) ( not ( = ?auto_33966 ?auto_33970 ) ) ( not ( = ?auto_33966 ?auto_33971 ) ) ( not ( = ?auto_33969 ?auto_33970 ) ) ( not ( = ?auto_33969 ?auto_33971 ) ) ( not ( = ?auto_33967 ?auto_33970 ) ) ( not ( = ?auto_33967 ?auto_33971 ) ) ( ON ?auto_33968 ?auto_33967 ) ( ON ?auto_33970 ?auto_33968 ) ( CLEAR ?auto_33970 ) ( HOLDING ?auto_33971 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_33971 )
      ( MAKE-1PILE ?auto_33966 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33972 - BLOCK
    )
    :vars
    (
      ?auto_33977 - BLOCK
      ?auto_33974 - BLOCK
      ?auto_33975 - BLOCK
      ?auto_33973 - BLOCK
      ?auto_33976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33972 ?auto_33977 ) ( not ( = ?auto_33972 ?auto_33977 ) ) ( not ( = ?auto_33972 ?auto_33974 ) ) ( not ( = ?auto_33972 ?auto_33975 ) ) ( not ( = ?auto_33977 ?auto_33974 ) ) ( not ( = ?auto_33977 ?auto_33975 ) ) ( not ( = ?auto_33974 ?auto_33975 ) ) ( ON ?auto_33974 ?auto_33972 ) ( ON-TABLE ?auto_33977 ) ( not ( = ?auto_33973 ?auto_33976 ) ) ( not ( = ?auto_33973 ?auto_33975 ) ) ( not ( = ?auto_33976 ?auto_33975 ) ) ( not ( = ?auto_33972 ?auto_33976 ) ) ( not ( = ?auto_33972 ?auto_33973 ) ) ( not ( = ?auto_33977 ?auto_33976 ) ) ( not ( = ?auto_33977 ?auto_33973 ) ) ( not ( = ?auto_33974 ?auto_33976 ) ) ( not ( = ?auto_33974 ?auto_33973 ) ) ( ON ?auto_33975 ?auto_33974 ) ( ON ?auto_33976 ?auto_33975 ) ( ON ?auto_33973 ?auto_33976 ) ( CLEAR ?auto_33973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_33977 ?auto_33972 ?auto_33974 ?auto_33975 ?auto_33976 )
      ( MAKE-1PILE ?auto_33972 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_33985 - BLOCK
      ?auto_33986 - BLOCK
      ?auto_33987 - BLOCK
    )
    :vars
    (
      ?auto_33988 - BLOCK
      ?auto_33989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33988 ?auto_33987 ) ( CLEAR ?auto_33988 ) ( ON-TABLE ?auto_33985 ) ( ON ?auto_33986 ?auto_33985 ) ( ON ?auto_33987 ?auto_33986 ) ( not ( = ?auto_33985 ?auto_33986 ) ) ( not ( = ?auto_33985 ?auto_33987 ) ) ( not ( = ?auto_33985 ?auto_33988 ) ) ( not ( = ?auto_33986 ?auto_33987 ) ) ( not ( = ?auto_33986 ?auto_33988 ) ) ( not ( = ?auto_33987 ?auto_33988 ) ) ( HOLDING ?auto_33989 ) ( not ( = ?auto_33985 ?auto_33989 ) ) ( not ( = ?auto_33986 ?auto_33989 ) ) ( not ( = ?auto_33987 ?auto_33989 ) ) ( not ( = ?auto_33988 ?auto_33989 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_33989 )
      ( MAKE-3PILE ?auto_33985 ?auto_33986 ?auto_33987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34038 - BLOCK
      ?auto_34039 - BLOCK
    )
    :vars
    (
      ?auto_34040 - BLOCK
      ?auto_34042 - BLOCK
      ?auto_34041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34038 ?auto_34039 ) ) ( ON ?auto_34039 ?auto_34040 ) ( not ( = ?auto_34038 ?auto_34040 ) ) ( not ( = ?auto_34039 ?auto_34040 ) ) ( ON ?auto_34038 ?auto_34039 ) ( CLEAR ?auto_34038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34042 ) ( ON ?auto_34041 ?auto_34042 ) ( ON ?auto_34040 ?auto_34041 ) ( not ( = ?auto_34042 ?auto_34041 ) ) ( not ( = ?auto_34042 ?auto_34040 ) ) ( not ( = ?auto_34042 ?auto_34039 ) ) ( not ( = ?auto_34042 ?auto_34038 ) ) ( not ( = ?auto_34041 ?auto_34040 ) ) ( not ( = ?auto_34041 ?auto_34039 ) ) ( not ( = ?auto_34041 ?auto_34038 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34042 ?auto_34041 ?auto_34040 ?auto_34039 )
      ( MAKE-2PILE ?auto_34038 ?auto_34039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34045 - BLOCK
      ?auto_34046 - BLOCK
    )
    :vars
    (
      ?auto_34047 - BLOCK
      ?auto_34048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34045 ?auto_34046 ) ) ( ON ?auto_34046 ?auto_34047 ) ( CLEAR ?auto_34046 ) ( not ( = ?auto_34045 ?auto_34047 ) ) ( not ( = ?auto_34046 ?auto_34047 ) ) ( ON ?auto_34045 ?auto_34048 ) ( CLEAR ?auto_34045 ) ( HAND-EMPTY ) ( not ( = ?auto_34045 ?auto_34048 ) ) ( not ( = ?auto_34046 ?auto_34048 ) ) ( not ( = ?auto_34047 ?auto_34048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34045 ?auto_34048 )
      ( MAKE-2PILE ?auto_34045 ?auto_34046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34049 - BLOCK
      ?auto_34050 - BLOCK
    )
    :vars
    (
      ?auto_34052 - BLOCK
      ?auto_34051 - BLOCK
      ?auto_34054 - BLOCK
      ?auto_34053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34049 ?auto_34050 ) ) ( not ( = ?auto_34049 ?auto_34052 ) ) ( not ( = ?auto_34050 ?auto_34052 ) ) ( ON ?auto_34049 ?auto_34051 ) ( CLEAR ?auto_34049 ) ( not ( = ?auto_34049 ?auto_34051 ) ) ( not ( = ?auto_34050 ?auto_34051 ) ) ( not ( = ?auto_34052 ?auto_34051 ) ) ( HOLDING ?auto_34050 ) ( CLEAR ?auto_34052 ) ( ON-TABLE ?auto_34054 ) ( ON ?auto_34053 ?auto_34054 ) ( ON ?auto_34052 ?auto_34053 ) ( not ( = ?auto_34054 ?auto_34053 ) ) ( not ( = ?auto_34054 ?auto_34052 ) ) ( not ( = ?auto_34054 ?auto_34050 ) ) ( not ( = ?auto_34053 ?auto_34052 ) ) ( not ( = ?auto_34053 ?auto_34050 ) ) ( not ( = ?auto_34049 ?auto_34054 ) ) ( not ( = ?auto_34049 ?auto_34053 ) ) ( not ( = ?auto_34051 ?auto_34054 ) ) ( not ( = ?auto_34051 ?auto_34053 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34054 ?auto_34053 ?auto_34052 ?auto_34050 )
      ( MAKE-2PILE ?auto_34049 ?auto_34050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34055 - BLOCK
      ?auto_34056 - BLOCK
    )
    :vars
    (
      ?auto_34060 - BLOCK
      ?auto_34059 - BLOCK
      ?auto_34058 - BLOCK
      ?auto_34057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34055 ?auto_34056 ) ) ( not ( = ?auto_34055 ?auto_34060 ) ) ( not ( = ?auto_34056 ?auto_34060 ) ) ( ON ?auto_34055 ?auto_34059 ) ( not ( = ?auto_34055 ?auto_34059 ) ) ( not ( = ?auto_34056 ?auto_34059 ) ) ( not ( = ?auto_34060 ?auto_34059 ) ) ( CLEAR ?auto_34060 ) ( ON-TABLE ?auto_34058 ) ( ON ?auto_34057 ?auto_34058 ) ( ON ?auto_34060 ?auto_34057 ) ( not ( = ?auto_34058 ?auto_34057 ) ) ( not ( = ?auto_34058 ?auto_34060 ) ) ( not ( = ?auto_34058 ?auto_34056 ) ) ( not ( = ?auto_34057 ?auto_34060 ) ) ( not ( = ?auto_34057 ?auto_34056 ) ) ( not ( = ?auto_34055 ?auto_34058 ) ) ( not ( = ?auto_34055 ?auto_34057 ) ) ( not ( = ?auto_34059 ?auto_34058 ) ) ( not ( = ?auto_34059 ?auto_34057 ) ) ( ON ?auto_34056 ?auto_34055 ) ( CLEAR ?auto_34056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34059 ?auto_34055 )
      ( MAKE-2PILE ?auto_34055 ?auto_34056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34061 - BLOCK
      ?auto_34062 - BLOCK
    )
    :vars
    (
      ?auto_34065 - BLOCK
      ?auto_34064 - BLOCK
      ?auto_34066 - BLOCK
      ?auto_34063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34061 ?auto_34062 ) ) ( not ( = ?auto_34061 ?auto_34065 ) ) ( not ( = ?auto_34062 ?auto_34065 ) ) ( ON ?auto_34061 ?auto_34064 ) ( not ( = ?auto_34061 ?auto_34064 ) ) ( not ( = ?auto_34062 ?auto_34064 ) ) ( not ( = ?auto_34065 ?auto_34064 ) ) ( ON-TABLE ?auto_34066 ) ( ON ?auto_34063 ?auto_34066 ) ( not ( = ?auto_34066 ?auto_34063 ) ) ( not ( = ?auto_34066 ?auto_34065 ) ) ( not ( = ?auto_34066 ?auto_34062 ) ) ( not ( = ?auto_34063 ?auto_34065 ) ) ( not ( = ?auto_34063 ?auto_34062 ) ) ( not ( = ?auto_34061 ?auto_34066 ) ) ( not ( = ?auto_34061 ?auto_34063 ) ) ( not ( = ?auto_34064 ?auto_34066 ) ) ( not ( = ?auto_34064 ?auto_34063 ) ) ( ON ?auto_34062 ?auto_34061 ) ( CLEAR ?auto_34062 ) ( ON-TABLE ?auto_34064 ) ( HOLDING ?auto_34065 ) ( CLEAR ?auto_34063 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34066 ?auto_34063 ?auto_34065 )
      ( MAKE-2PILE ?auto_34061 ?auto_34062 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34067 - BLOCK
      ?auto_34068 - BLOCK
    )
    :vars
    (
      ?auto_34072 - BLOCK
      ?auto_34069 - BLOCK
      ?auto_34071 - BLOCK
      ?auto_34070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34067 ?auto_34068 ) ) ( not ( = ?auto_34067 ?auto_34072 ) ) ( not ( = ?auto_34068 ?auto_34072 ) ) ( ON ?auto_34067 ?auto_34069 ) ( not ( = ?auto_34067 ?auto_34069 ) ) ( not ( = ?auto_34068 ?auto_34069 ) ) ( not ( = ?auto_34072 ?auto_34069 ) ) ( ON-TABLE ?auto_34071 ) ( ON ?auto_34070 ?auto_34071 ) ( not ( = ?auto_34071 ?auto_34070 ) ) ( not ( = ?auto_34071 ?auto_34072 ) ) ( not ( = ?auto_34071 ?auto_34068 ) ) ( not ( = ?auto_34070 ?auto_34072 ) ) ( not ( = ?auto_34070 ?auto_34068 ) ) ( not ( = ?auto_34067 ?auto_34071 ) ) ( not ( = ?auto_34067 ?auto_34070 ) ) ( not ( = ?auto_34069 ?auto_34071 ) ) ( not ( = ?auto_34069 ?auto_34070 ) ) ( ON ?auto_34068 ?auto_34067 ) ( ON-TABLE ?auto_34069 ) ( CLEAR ?auto_34070 ) ( ON ?auto_34072 ?auto_34068 ) ( CLEAR ?auto_34072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34069 ?auto_34067 ?auto_34068 )
      ( MAKE-2PILE ?auto_34067 ?auto_34068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34073 - BLOCK
      ?auto_34074 - BLOCK
    )
    :vars
    (
      ?auto_34076 - BLOCK
      ?auto_34077 - BLOCK
      ?auto_34075 - BLOCK
      ?auto_34078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34073 ?auto_34074 ) ) ( not ( = ?auto_34073 ?auto_34076 ) ) ( not ( = ?auto_34074 ?auto_34076 ) ) ( ON ?auto_34073 ?auto_34077 ) ( not ( = ?auto_34073 ?auto_34077 ) ) ( not ( = ?auto_34074 ?auto_34077 ) ) ( not ( = ?auto_34076 ?auto_34077 ) ) ( ON-TABLE ?auto_34075 ) ( not ( = ?auto_34075 ?auto_34078 ) ) ( not ( = ?auto_34075 ?auto_34076 ) ) ( not ( = ?auto_34075 ?auto_34074 ) ) ( not ( = ?auto_34078 ?auto_34076 ) ) ( not ( = ?auto_34078 ?auto_34074 ) ) ( not ( = ?auto_34073 ?auto_34075 ) ) ( not ( = ?auto_34073 ?auto_34078 ) ) ( not ( = ?auto_34077 ?auto_34075 ) ) ( not ( = ?auto_34077 ?auto_34078 ) ) ( ON ?auto_34074 ?auto_34073 ) ( ON-TABLE ?auto_34077 ) ( ON ?auto_34076 ?auto_34074 ) ( CLEAR ?auto_34076 ) ( HOLDING ?auto_34078 ) ( CLEAR ?auto_34075 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34075 ?auto_34078 )
      ( MAKE-2PILE ?auto_34073 ?auto_34074 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34079 - BLOCK
      ?auto_34080 - BLOCK
    )
    :vars
    (
      ?auto_34083 - BLOCK
      ?auto_34082 - BLOCK
      ?auto_34081 - BLOCK
      ?auto_34084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34079 ?auto_34080 ) ) ( not ( = ?auto_34079 ?auto_34083 ) ) ( not ( = ?auto_34080 ?auto_34083 ) ) ( ON ?auto_34079 ?auto_34082 ) ( not ( = ?auto_34079 ?auto_34082 ) ) ( not ( = ?auto_34080 ?auto_34082 ) ) ( not ( = ?auto_34083 ?auto_34082 ) ) ( ON-TABLE ?auto_34081 ) ( not ( = ?auto_34081 ?auto_34084 ) ) ( not ( = ?auto_34081 ?auto_34083 ) ) ( not ( = ?auto_34081 ?auto_34080 ) ) ( not ( = ?auto_34084 ?auto_34083 ) ) ( not ( = ?auto_34084 ?auto_34080 ) ) ( not ( = ?auto_34079 ?auto_34081 ) ) ( not ( = ?auto_34079 ?auto_34084 ) ) ( not ( = ?auto_34082 ?auto_34081 ) ) ( not ( = ?auto_34082 ?auto_34084 ) ) ( ON ?auto_34080 ?auto_34079 ) ( ON-TABLE ?auto_34082 ) ( ON ?auto_34083 ?auto_34080 ) ( CLEAR ?auto_34081 ) ( ON ?auto_34084 ?auto_34083 ) ( CLEAR ?auto_34084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34082 ?auto_34079 ?auto_34080 ?auto_34083 )
      ( MAKE-2PILE ?auto_34079 ?auto_34080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34085 - BLOCK
      ?auto_34086 - BLOCK
    )
    :vars
    (
      ?auto_34090 - BLOCK
      ?auto_34088 - BLOCK
      ?auto_34087 - BLOCK
      ?auto_34089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34085 ?auto_34086 ) ) ( not ( = ?auto_34085 ?auto_34090 ) ) ( not ( = ?auto_34086 ?auto_34090 ) ) ( ON ?auto_34085 ?auto_34088 ) ( not ( = ?auto_34085 ?auto_34088 ) ) ( not ( = ?auto_34086 ?auto_34088 ) ) ( not ( = ?auto_34090 ?auto_34088 ) ) ( not ( = ?auto_34087 ?auto_34089 ) ) ( not ( = ?auto_34087 ?auto_34090 ) ) ( not ( = ?auto_34087 ?auto_34086 ) ) ( not ( = ?auto_34089 ?auto_34090 ) ) ( not ( = ?auto_34089 ?auto_34086 ) ) ( not ( = ?auto_34085 ?auto_34087 ) ) ( not ( = ?auto_34085 ?auto_34089 ) ) ( not ( = ?auto_34088 ?auto_34087 ) ) ( not ( = ?auto_34088 ?auto_34089 ) ) ( ON ?auto_34086 ?auto_34085 ) ( ON-TABLE ?auto_34088 ) ( ON ?auto_34090 ?auto_34086 ) ( ON ?auto_34089 ?auto_34090 ) ( CLEAR ?auto_34089 ) ( HOLDING ?auto_34087 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34087 )
      ( MAKE-2PILE ?auto_34085 ?auto_34086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34091 - BLOCK
      ?auto_34092 - BLOCK
    )
    :vars
    (
      ?auto_34094 - BLOCK
      ?auto_34095 - BLOCK
      ?auto_34093 - BLOCK
      ?auto_34096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34091 ?auto_34092 ) ) ( not ( = ?auto_34091 ?auto_34094 ) ) ( not ( = ?auto_34092 ?auto_34094 ) ) ( ON ?auto_34091 ?auto_34095 ) ( not ( = ?auto_34091 ?auto_34095 ) ) ( not ( = ?auto_34092 ?auto_34095 ) ) ( not ( = ?auto_34094 ?auto_34095 ) ) ( not ( = ?auto_34093 ?auto_34096 ) ) ( not ( = ?auto_34093 ?auto_34094 ) ) ( not ( = ?auto_34093 ?auto_34092 ) ) ( not ( = ?auto_34096 ?auto_34094 ) ) ( not ( = ?auto_34096 ?auto_34092 ) ) ( not ( = ?auto_34091 ?auto_34093 ) ) ( not ( = ?auto_34091 ?auto_34096 ) ) ( not ( = ?auto_34095 ?auto_34093 ) ) ( not ( = ?auto_34095 ?auto_34096 ) ) ( ON ?auto_34092 ?auto_34091 ) ( ON-TABLE ?auto_34095 ) ( ON ?auto_34094 ?auto_34092 ) ( ON ?auto_34096 ?auto_34094 ) ( ON ?auto_34093 ?auto_34096 ) ( CLEAR ?auto_34093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34095 ?auto_34091 ?auto_34092 ?auto_34094 ?auto_34096 )
      ( MAKE-2PILE ?auto_34091 ?auto_34092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34112 - BLOCK
      ?auto_34113 - BLOCK
    )
    :vars
    (
      ?auto_34115 - BLOCK
      ?auto_34114 - BLOCK
      ?auto_34116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34115 ?auto_34113 ) ( ON-TABLE ?auto_34112 ) ( ON ?auto_34113 ?auto_34112 ) ( not ( = ?auto_34112 ?auto_34113 ) ) ( not ( = ?auto_34112 ?auto_34115 ) ) ( not ( = ?auto_34113 ?auto_34115 ) ) ( not ( = ?auto_34112 ?auto_34114 ) ) ( not ( = ?auto_34112 ?auto_34116 ) ) ( not ( = ?auto_34113 ?auto_34114 ) ) ( not ( = ?auto_34113 ?auto_34116 ) ) ( not ( = ?auto_34115 ?auto_34114 ) ) ( not ( = ?auto_34115 ?auto_34116 ) ) ( not ( = ?auto_34114 ?auto_34116 ) ) ( ON ?auto_34114 ?auto_34115 ) ( CLEAR ?auto_34114 ) ( HOLDING ?auto_34116 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34116 )
      ( MAKE-2PILE ?auto_34112 ?auto_34113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34159 - BLOCK
      ?auto_34160 - BLOCK
      ?auto_34161 - BLOCK
    )
    :vars
    (
      ?auto_34162 - BLOCK
      ?auto_34163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34159 ) ( not ( = ?auto_34159 ?auto_34160 ) ) ( not ( = ?auto_34159 ?auto_34161 ) ) ( not ( = ?auto_34160 ?auto_34161 ) ) ( ON ?auto_34161 ?auto_34162 ) ( not ( = ?auto_34159 ?auto_34162 ) ) ( not ( = ?auto_34160 ?auto_34162 ) ) ( not ( = ?auto_34161 ?auto_34162 ) ) ( CLEAR ?auto_34159 ) ( ON ?auto_34160 ?auto_34161 ) ( CLEAR ?auto_34160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34163 ) ( ON ?auto_34162 ?auto_34163 ) ( not ( = ?auto_34163 ?auto_34162 ) ) ( not ( = ?auto_34163 ?auto_34161 ) ) ( not ( = ?auto_34163 ?auto_34160 ) ) ( not ( = ?auto_34159 ?auto_34163 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34163 ?auto_34162 ?auto_34161 )
      ( MAKE-3PILE ?auto_34159 ?auto_34160 ?auto_34161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34164 - BLOCK
      ?auto_34165 - BLOCK
      ?auto_34166 - BLOCK
    )
    :vars
    (
      ?auto_34167 - BLOCK
      ?auto_34168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34164 ?auto_34165 ) ) ( not ( = ?auto_34164 ?auto_34166 ) ) ( not ( = ?auto_34165 ?auto_34166 ) ) ( ON ?auto_34166 ?auto_34167 ) ( not ( = ?auto_34164 ?auto_34167 ) ) ( not ( = ?auto_34165 ?auto_34167 ) ) ( not ( = ?auto_34166 ?auto_34167 ) ) ( ON ?auto_34165 ?auto_34166 ) ( CLEAR ?auto_34165 ) ( ON-TABLE ?auto_34168 ) ( ON ?auto_34167 ?auto_34168 ) ( not ( = ?auto_34168 ?auto_34167 ) ) ( not ( = ?auto_34168 ?auto_34166 ) ) ( not ( = ?auto_34168 ?auto_34165 ) ) ( not ( = ?auto_34164 ?auto_34168 ) ) ( HOLDING ?auto_34164 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34164 )
      ( MAKE-3PILE ?auto_34164 ?auto_34165 ?auto_34166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34169 - BLOCK
      ?auto_34170 - BLOCK
      ?auto_34171 - BLOCK
    )
    :vars
    (
      ?auto_34172 - BLOCK
      ?auto_34173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34169 ?auto_34170 ) ) ( not ( = ?auto_34169 ?auto_34171 ) ) ( not ( = ?auto_34170 ?auto_34171 ) ) ( ON ?auto_34171 ?auto_34172 ) ( not ( = ?auto_34169 ?auto_34172 ) ) ( not ( = ?auto_34170 ?auto_34172 ) ) ( not ( = ?auto_34171 ?auto_34172 ) ) ( ON ?auto_34170 ?auto_34171 ) ( ON-TABLE ?auto_34173 ) ( ON ?auto_34172 ?auto_34173 ) ( not ( = ?auto_34173 ?auto_34172 ) ) ( not ( = ?auto_34173 ?auto_34171 ) ) ( not ( = ?auto_34173 ?auto_34170 ) ) ( not ( = ?auto_34169 ?auto_34173 ) ) ( ON ?auto_34169 ?auto_34170 ) ( CLEAR ?auto_34169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34173 ?auto_34172 ?auto_34171 ?auto_34170 )
      ( MAKE-3PILE ?auto_34169 ?auto_34170 ?auto_34171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34177 - BLOCK
      ?auto_34178 - BLOCK
      ?auto_34179 - BLOCK
    )
    :vars
    (
      ?auto_34180 - BLOCK
      ?auto_34181 - BLOCK
      ?auto_34182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34177 ?auto_34178 ) ) ( not ( = ?auto_34177 ?auto_34179 ) ) ( not ( = ?auto_34178 ?auto_34179 ) ) ( ON ?auto_34179 ?auto_34180 ) ( not ( = ?auto_34177 ?auto_34180 ) ) ( not ( = ?auto_34178 ?auto_34180 ) ) ( not ( = ?auto_34179 ?auto_34180 ) ) ( ON ?auto_34178 ?auto_34179 ) ( CLEAR ?auto_34178 ) ( ON-TABLE ?auto_34181 ) ( ON ?auto_34180 ?auto_34181 ) ( not ( = ?auto_34181 ?auto_34180 ) ) ( not ( = ?auto_34181 ?auto_34179 ) ) ( not ( = ?auto_34181 ?auto_34178 ) ) ( not ( = ?auto_34177 ?auto_34181 ) ) ( ON ?auto_34177 ?auto_34182 ) ( CLEAR ?auto_34177 ) ( HAND-EMPTY ) ( not ( = ?auto_34177 ?auto_34182 ) ) ( not ( = ?auto_34178 ?auto_34182 ) ) ( not ( = ?auto_34179 ?auto_34182 ) ) ( not ( = ?auto_34180 ?auto_34182 ) ) ( not ( = ?auto_34181 ?auto_34182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34177 ?auto_34182 )
      ( MAKE-3PILE ?auto_34177 ?auto_34178 ?auto_34179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34183 - BLOCK
      ?auto_34184 - BLOCK
      ?auto_34185 - BLOCK
    )
    :vars
    (
      ?auto_34186 - BLOCK
      ?auto_34188 - BLOCK
      ?auto_34187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34183 ?auto_34184 ) ) ( not ( = ?auto_34183 ?auto_34185 ) ) ( not ( = ?auto_34184 ?auto_34185 ) ) ( ON ?auto_34185 ?auto_34186 ) ( not ( = ?auto_34183 ?auto_34186 ) ) ( not ( = ?auto_34184 ?auto_34186 ) ) ( not ( = ?auto_34185 ?auto_34186 ) ) ( ON-TABLE ?auto_34188 ) ( ON ?auto_34186 ?auto_34188 ) ( not ( = ?auto_34188 ?auto_34186 ) ) ( not ( = ?auto_34188 ?auto_34185 ) ) ( not ( = ?auto_34188 ?auto_34184 ) ) ( not ( = ?auto_34183 ?auto_34188 ) ) ( ON ?auto_34183 ?auto_34187 ) ( CLEAR ?auto_34183 ) ( not ( = ?auto_34183 ?auto_34187 ) ) ( not ( = ?auto_34184 ?auto_34187 ) ) ( not ( = ?auto_34185 ?auto_34187 ) ) ( not ( = ?auto_34186 ?auto_34187 ) ) ( not ( = ?auto_34188 ?auto_34187 ) ) ( HOLDING ?auto_34184 ) ( CLEAR ?auto_34185 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34188 ?auto_34186 ?auto_34185 ?auto_34184 )
      ( MAKE-3PILE ?auto_34183 ?auto_34184 ?auto_34185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34189 - BLOCK
      ?auto_34190 - BLOCK
      ?auto_34191 - BLOCK
    )
    :vars
    (
      ?auto_34194 - BLOCK
      ?auto_34193 - BLOCK
      ?auto_34192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34189 ?auto_34190 ) ) ( not ( = ?auto_34189 ?auto_34191 ) ) ( not ( = ?auto_34190 ?auto_34191 ) ) ( ON ?auto_34191 ?auto_34194 ) ( not ( = ?auto_34189 ?auto_34194 ) ) ( not ( = ?auto_34190 ?auto_34194 ) ) ( not ( = ?auto_34191 ?auto_34194 ) ) ( ON-TABLE ?auto_34193 ) ( ON ?auto_34194 ?auto_34193 ) ( not ( = ?auto_34193 ?auto_34194 ) ) ( not ( = ?auto_34193 ?auto_34191 ) ) ( not ( = ?auto_34193 ?auto_34190 ) ) ( not ( = ?auto_34189 ?auto_34193 ) ) ( ON ?auto_34189 ?auto_34192 ) ( not ( = ?auto_34189 ?auto_34192 ) ) ( not ( = ?auto_34190 ?auto_34192 ) ) ( not ( = ?auto_34191 ?auto_34192 ) ) ( not ( = ?auto_34194 ?auto_34192 ) ) ( not ( = ?auto_34193 ?auto_34192 ) ) ( CLEAR ?auto_34191 ) ( ON ?auto_34190 ?auto_34189 ) ( CLEAR ?auto_34190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34192 ?auto_34189 )
      ( MAKE-3PILE ?auto_34189 ?auto_34190 ?auto_34191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34195 - BLOCK
      ?auto_34196 - BLOCK
      ?auto_34197 - BLOCK
    )
    :vars
    (
      ?auto_34200 - BLOCK
      ?auto_34198 - BLOCK
      ?auto_34199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34195 ?auto_34196 ) ) ( not ( = ?auto_34195 ?auto_34197 ) ) ( not ( = ?auto_34196 ?auto_34197 ) ) ( not ( = ?auto_34195 ?auto_34200 ) ) ( not ( = ?auto_34196 ?auto_34200 ) ) ( not ( = ?auto_34197 ?auto_34200 ) ) ( ON-TABLE ?auto_34198 ) ( ON ?auto_34200 ?auto_34198 ) ( not ( = ?auto_34198 ?auto_34200 ) ) ( not ( = ?auto_34198 ?auto_34197 ) ) ( not ( = ?auto_34198 ?auto_34196 ) ) ( not ( = ?auto_34195 ?auto_34198 ) ) ( ON ?auto_34195 ?auto_34199 ) ( not ( = ?auto_34195 ?auto_34199 ) ) ( not ( = ?auto_34196 ?auto_34199 ) ) ( not ( = ?auto_34197 ?auto_34199 ) ) ( not ( = ?auto_34200 ?auto_34199 ) ) ( not ( = ?auto_34198 ?auto_34199 ) ) ( ON ?auto_34196 ?auto_34195 ) ( CLEAR ?auto_34196 ) ( ON-TABLE ?auto_34199 ) ( HOLDING ?auto_34197 ) ( CLEAR ?auto_34200 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34198 ?auto_34200 ?auto_34197 )
      ( MAKE-3PILE ?auto_34195 ?auto_34196 ?auto_34197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34201 - BLOCK
      ?auto_34202 - BLOCK
      ?auto_34203 - BLOCK
    )
    :vars
    (
      ?auto_34205 - BLOCK
      ?auto_34204 - BLOCK
      ?auto_34206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34201 ?auto_34202 ) ) ( not ( = ?auto_34201 ?auto_34203 ) ) ( not ( = ?auto_34202 ?auto_34203 ) ) ( not ( = ?auto_34201 ?auto_34205 ) ) ( not ( = ?auto_34202 ?auto_34205 ) ) ( not ( = ?auto_34203 ?auto_34205 ) ) ( ON-TABLE ?auto_34204 ) ( ON ?auto_34205 ?auto_34204 ) ( not ( = ?auto_34204 ?auto_34205 ) ) ( not ( = ?auto_34204 ?auto_34203 ) ) ( not ( = ?auto_34204 ?auto_34202 ) ) ( not ( = ?auto_34201 ?auto_34204 ) ) ( ON ?auto_34201 ?auto_34206 ) ( not ( = ?auto_34201 ?auto_34206 ) ) ( not ( = ?auto_34202 ?auto_34206 ) ) ( not ( = ?auto_34203 ?auto_34206 ) ) ( not ( = ?auto_34205 ?auto_34206 ) ) ( not ( = ?auto_34204 ?auto_34206 ) ) ( ON ?auto_34202 ?auto_34201 ) ( ON-TABLE ?auto_34206 ) ( CLEAR ?auto_34205 ) ( ON ?auto_34203 ?auto_34202 ) ( CLEAR ?auto_34203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34206 ?auto_34201 ?auto_34202 )
      ( MAKE-3PILE ?auto_34201 ?auto_34202 ?auto_34203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34207 - BLOCK
      ?auto_34208 - BLOCK
      ?auto_34209 - BLOCK
    )
    :vars
    (
      ?auto_34210 - BLOCK
      ?auto_34212 - BLOCK
      ?auto_34211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34207 ?auto_34208 ) ) ( not ( = ?auto_34207 ?auto_34209 ) ) ( not ( = ?auto_34208 ?auto_34209 ) ) ( not ( = ?auto_34207 ?auto_34210 ) ) ( not ( = ?auto_34208 ?auto_34210 ) ) ( not ( = ?auto_34209 ?auto_34210 ) ) ( ON-TABLE ?auto_34212 ) ( not ( = ?auto_34212 ?auto_34210 ) ) ( not ( = ?auto_34212 ?auto_34209 ) ) ( not ( = ?auto_34212 ?auto_34208 ) ) ( not ( = ?auto_34207 ?auto_34212 ) ) ( ON ?auto_34207 ?auto_34211 ) ( not ( = ?auto_34207 ?auto_34211 ) ) ( not ( = ?auto_34208 ?auto_34211 ) ) ( not ( = ?auto_34209 ?auto_34211 ) ) ( not ( = ?auto_34210 ?auto_34211 ) ) ( not ( = ?auto_34212 ?auto_34211 ) ) ( ON ?auto_34208 ?auto_34207 ) ( ON-TABLE ?auto_34211 ) ( ON ?auto_34209 ?auto_34208 ) ( CLEAR ?auto_34209 ) ( HOLDING ?auto_34210 ) ( CLEAR ?auto_34212 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34212 ?auto_34210 )
      ( MAKE-3PILE ?auto_34207 ?auto_34208 ?auto_34209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34213 - BLOCK
      ?auto_34214 - BLOCK
      ?auto_34215 - BLOCK
    )
    :vars
    (
      ?auto_34217 - BLOCK
      ?auto_34218 - BLOCK
      ?auto_34216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34213 ?auto_34214 ) ) ( not ( = ?auto_34213 ?auto_34215 ) ) ( not ( = ?auto_34214 ?auto_34215 ) ) ( not ( = ?auto_34213 ?auto_34217 ) ) ( not ( = ?auto_34214 ?auto_34217 ) ) ( not ( = ?auto_34215 ?auto_34217 ) ) ( ON-TABLE ?auto_34218 ) ( not ( = ?auto_34218 ?auto_34217 ) ) ( not ( = ?auto_34218 ?auto_34215 ) ) ( not ( = ?auto_34218 ?auto_34214 ) ) ( not ( = ?auto_34213 ?auto_34218 ) ) ( ON ?auto_34213 ?auto_34216 ) ( not ( = ?auto_34213 ?auto_34216 ) ) ( not ( = ?auto_34214 ?auto_34216 ) ) ( not ( = ?auto_34215 ?auto_34216 ) ) ( not ( = ?auto_34217 ?auto_34216 ) ) ( not ( = ?auto_34218 ?auto_34216 ) ) ( ON ?auto_34214 ?auto_34213 ) ( ON-TABLE ?auto_34216 ) ( ON ?auto_34215 ?auto_34214 ) ( CLEAR ?auto_34218 ) ( ON ?auto_34217 ?auto_34215 ) ( CLEAR ?auto_34217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34216 ?auto_34213 ?auto_34214 ?auto_34215 )
      ( MAKE-3PILE ?auto_34213 ?auto_34214 ?auto_34215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34219 - BLOCK
      ?auto_34220 - BLOCK
      ?auto_34221 - BLOCK
    )
    :vars
    (
      ?auto_34223 - BLOCK
      ?auto_34224 - BLOCK
      ?auto_34222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34219 ?auto_34220 ) ) ( not ( = ?auto_34219 ?auto_34221 ) ) ( not ( = ?auto_34220 ?auto_34221 ) ) ( not ( = ?auto_34219 ?auto_34223 ) ) ( not ( = ?auto_34220 ?auto_34223 ) ) ( not ( = ?auto_34221 ?auto_34223 ) ) ( not ( = ?auto_34224 ?auto_34223 ) ) ( not ( = ?auto_34224 ?auto_34221 ) ) ( not ( = ?auto_34224 ?auto_34220 ) ) ( not ( = ?auto_34219 ?auto_34224 ) ) ( ON ?auto_34219 ?auto_34222 ) ( not ( = ?auto_34219 ?auto_34222 ) ) ( not ( = ?auto_34220 ?auto_34222 ) ) ( not ( = ?auto_34221 ?auto_34222 ) ) ( not ( = ?auto_34223 ?auto_34222 ) ) ( not ( = ?auto_34224 ?auto_34222 ) ) ( ON ?auto_34220 ?auto_34219 ) ( ON-TABLE ?auto_34222 ) ( ON ?auto_34221 ?auto_34220 ) ( ON ?auto_34223 ?auto_34221 ) ( CLEAR ?auto_34223 ) ( HOLDING ?auto_34224 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34224 )
      ( MAKE-3PILE ?auto_34219 ?auto_34220 ?auto_34221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34225 - BLOCK
      ?auto_34226 - BLOCK
      ?auto_34227 - BLOCK
    )
    :vars
    (
      ?auto_34230 - BLOCK
      ?auto_34229 - BLOCK
      ?auto_34228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34225 ?auto_34226 ) ) ( not ( = ?auto_34225 ?auto_34227 ) ) ( not ( = ?auto_34226 ?auto_34227 ) ) ( not ( = ?auto_34225 ?auto_34230 ) ) ( not ( = ?auto_34226 ?auto_34230 ) ) ( not ( = ?auto_34227 ?auto_34230 ) ) ( not ( = ?auto_34229 ?auto_34230 ) ) ( not ( = ?auto_34229 ?auto_34227 ) ) ( not ( = ?auto_34229 ?auto_34226 ) ) ( not ( = ?auto_34225 ?auto_34229 ) ) ( ON ?auto_34225 ?auto_34228 ) ( not ( = ?auto_34225 ?auto_34228 ) ) ( not ( = ?auto_34226 ?auto_34228 ) ) ( not ( = ?auto_34227 ?auto_34228 ) ) ( not ( = ?auto_34230 ?auto_34228 ) ) ( not ( = ?auto_34229 ?auto_34228 ) ) ( ON ?auto_34226 ?auto_34225 ) ( ON-TABLE ?auto_34228 ) ( ON ?auto_34227 ?auto_34226 ) ( ON ?auto_34230 ?auto_34227 ) ( ON ?auto_34229 ?auto_34230 ) ( CLEAR ?auto_34229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34228 ?auto_34225 ?auto_34226 ?auto_34227 ?auto_34230 )
      ( MAKE-3PILE ?auto_34225 ?auto_34226 ?auto_34227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34242 - BLOCK
    )
    :vars
    (
      ?auto_34243 - BLOCK
      ?auto_34244 - BLOCK
      ?auto_34245 - BLOCK
      ?auto_34246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34243 ?auto_34242 ) ( ON-TABLE ?auto_34242 ) ( not ( = ?auto_34242 ?auto_34243 ) ) ( not ( = ?auto_34242 ?auto_34244 ) ) ( not ( = ?auto_34242 ?auto_34245 ) ) ( not ( = ?auto_34243 ?auto_34244 ) ) ( not ( = ?auto_34243 ?auto_34245 ) ) ( not ( = ?auto_34244 ?auto_34245 ) ) ( ON ?auto_34244 ?auto_34243 ) ( CLEAR ?auto_34244 ) ( HOLDING ?auto_34245 ) ( CLEAR ?auto_34246 ) ( ON-TABLE ?auto_34246 ) ( not ( = ?auto_34246 ?auto_34245 ) ) ( not ( = ?auto_34242 ?auto_34246 ) ) ( not ( = ?auto_34243 ?auto_34246 ) ) ( not ( = ?auto_34244 ?auto_34246 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34246 ?auto_34245 )
      ( MAKE-1PILE ?auto_34242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34247 - BLOCK
    )
    :vars
    (
      ?auto_34251 - BLOCK
      ?auto_34249 - BLOCK
      ?auto_34250 - BLOCK
      ?auto_34248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34251 ?auto_34247 ) ( ON-TABLE ?auto_34247 ) ( not ( = ?auto_34247 ?auto_34251 ) ) ( not ( = ?auto_34247 ?auto_34249 ) ) ( not ( = ?auto_34247 ?auto_34250 ) ) ( not ( = ?auto_34251 ?auto_34249 ) ) ( not ( = ?auto_34251 ?auto_34250 ) ) ( not ( = ?auto_34249 ?auto_34250 ) ) ( ON ?auto_34249 ?auto_34251 ) ( CLEAR ?auto_34248 ) ( ON-TABLE ?auto_34248 ) ( not ( = ?auto_34248 ?auto_34250 ) ) ( not ( = ?auto_34247 ?auto_34248 ) ) ( not ( = ?auto_34251 ?auto_34248 ) ) ( not ( = ?auto_34249 ?auto_34248 ) ) ( ON ?auto_34250 ?auto_34249 ) ( CLEAR ?auto_34250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34247 ?auto_34251 ?auto_34249 )
      ( MAKE-1PILE ?auto_34247 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34252 - BLOCK
    )
    :vars
    (
      ?auto_34254 - BLOCK
      ?auto_34253 - BLOCK
      ?auto_34255 - BLOCK
      ?auto_34256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34254 ?auto_34252 ) ( ON-TABLE ?auto_34252 ) ( not ( = ?auto_34252 ?auto_34254 ) ) ( not ( = ?auto_34252 ?auto_34253 ) ) ( not ( = ?auto_34252 ?auto_34255 ) ) ( not ( = ?auto_34254 ?auto_34253 ) ) ( not ( = ?auto_34254 ?auto_34255 ) ) ( not ( = ?auto_34253 ?auto_34255 ) ) ( ON ?auto_34253 ?auto_34254 ) ( not ( = ?auto_34256 ?auto_34255 ) ) ( not ( = ?auto_34252 ?auto_34256 ) ) ( not ( = ?auto_34254 ?auto_34256 ) ) ( not ( = ?auto_34253 ?auto_34256 ) ) ( ON ?auto_34255 ?auto_34253 ) ( CLEAR ?auto_34255 ) ( HOLDING ?auto_34256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34256 )
      ( MAKE-1PILE ?auto_34252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34263 - BLOCK
    )
    :vars
    (
      ?auto_34264 - BLOCK
      ?auto_34265 - BLOCK
      ?auto_34267 - BLOCK
      ?auto_34266 - BLOCK
      ?auto_34268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34264 ?auto_34263 ) ( ON-TABLE ?auto_34263 ) ( not ( = ?auto_34263 ?auto_34264 ) ) ( not ( = ?auto_34263 ?auto_34265 ) ) ( not ( = ?auto_34263 ?auto_34267 ) ) ( not ( = ?auto_34264 ?auto_34265 ) ) ( not ( = ?auto_34264 ?auto_34267 ) ) ( not ( = ?auto_34265 ?auto_34267 ) ) ( ON ?auto_34265 ?auto_34264 ) ( not ( = ?auto_34266 ?auto_34267 ) ) ( not ( = ?auto_34263 ?auto_34266 ) ) ( not ( = ?auto_34264 ?auto_34266 ) ) ( not ( = ?auto_34265 ?auto_34266 ) ) ( ON ?auto_34267 ?auto_34265 ) ( CLEAR ?auto_34267 ) ( ON ?auto_34266 ?auto_34268 ) ( CLEAR ?auto_34266 ) ( HAND-EMPTY ) ( not ( = ?auto_34263 ?auto_34268 ) ) ( not ( = ?auto_34264 ?auto_34268 ) ) ( not ( = ?auto_34265 ?auto_34268 ) ) ( not ( = ?auto_34267 ?auto_34268 ) ) ( not ( = ?auto_34266 ?auto_34268 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34266 ?auto_34268 )
      ( MAKE-1PILE ?auto_34263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34269 - BLOCK
    )
    :vars
    (
      ?auto_34270 - BLOCK
      ?auto_34272 - BLOCK
      ?auto_34271 - BLOCK
      ?auto_34273 - BLOCK
      ?auto_34274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34270 ?auto_34269 ) ( ON-TABLE ?auto_34269 ) ( not ( = ?auto_34269 ?auto_34270 ) ) ( not ( = ?auto_34269 ?auto_34272 ) ) ( not ( = ?auto_34269 ?auto_34271 ) ) ( not ( = ?auto_34270 ?auto_34272 ) ) ( not ( = ?auto_34270 ?auto_34271 ) ) ( not ( = ?auto_34272 ?auto_34271 ) ) ( ON ?auto_34272 ?auto_34270 ) ( not ( = ?auto_34273 ?auto_34271 ) ) ( not ( = ?auto_34269 ?auto_34273 ) ) ( not ( = ?auto_34270 ?auto_34273 ) ) ( not ( = ?auto_34272 ?auto_34273 ) ) ( ON ?auto_34273 ?auto_34274 ) ( CLEAR ?auto_34273 ) ( not ( = ?auto_34269 ?auto_34274 ) ) ( not ( = ?auto_34270 ?auto_34274 ) ) ( not ( = ?auto_34272 ?auto_34274 ) ) ( not ( = ?auto_34271 ?auto_34274 ) ) ( not ( = ?auto_34273 ?auto_34274 ) ) ( HOLDING ?auto_34271 ) ( CLEAR ?auto_34272 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34269 ?auto_34270 ?auto_34272 ?auto_34271 )
      ( MAKE-1PILE ?auto_34269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34303 - BLOCK
      ?auto_34304 - BLOCK
      ?auto_34305 - BLOCK
      ?auto_34306 - BLOCK
    )
    :vars
    (
      ?auto_34307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34303 ) ( ON ?auto_34304 ?auto_34303 ) ( not ( = ?auto_34303 ?auto_34304 ) ) ( not ( = ?auto_34303 ?auto_34305 ) ) ( not ( = ?auto_34303 ?auto_34306 ) ) ( not ( = ?auto_34304 ?auto_34305 ) ) ( not ( = ?auto_34304 ?auto_34306 ) ) ( not ( = ?auto_34305 ?auto_34306 ) ) ( ON ?auto_34306 ?auto_34307 ) ( not ( = ?auto_34303 ?auto_34307 ) ) ( not ( = ?auto_34304 ?auto_34307 ) ) ( not ( = ?auto_34305 ?auto_34307 ) ) ( not ( = ?auto_34306 ?auto_34307 ) ) ( CLEAR ?auto_34304 ) ( ON ?auto_34305 ?auto_34306 ) ( CLEAR ?auto_34305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34307 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34307 ?auto_34306 )
      ( MAKE-4PILE ?auto_34303 ?auto_34304 ?auto_34305 ?auto_34306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34308 - BLOCK
      ?auto_34309 - BLOCK
      ?auto_34310 - BLOCK
      ?auto_34311 - BLOCK
    )
    :vars
    (
      ?auto_34312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34308 ) ( not ( = ?auto_34308 ?auto_34309 ) ) ( not ( = ?auto_34308 ?auto_34310 ) ) ( not ( = ?auto_34308 ?auto_34311 ) ) ( not ( = ?auto_34309 ?auto_34310 ) ) ( not ( = ?auto_34309 ?auto_34311 ) ) ( not ( = ?auto_34310 ?auto_34311 ) ) ( ON ?auto_34311 ?auto_34312 ) ( not ( = ?auto_34308 ?auto_34312 ) ) ( not ( = ?auto_34309 ?auto_34312 ) ) ( not ( = ?auto_34310 ?auto_34312 ) ) ( not ( = ?auto_34311 ?auto_34312 ) ) ( ON ?auto_34310 ?auto_34311 ) ( CLEAR ?auto_34310 ) ( ON-TABLE ?auto_34312 ) ( HOLDING ?auto_34309 ) ( CLEAR ?auto_34308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34308 ?auto_34309 )
      ( MAKE-4PILE ?auto_34308 ?auto_34309 ?auto_34310 ?auto_34311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34313 - BLOCK
      ?auto_34314 - BLOCK
      ?auto_34315 - BLOCK
      ?auto_34316 - BLOCK
    )
    :vars
    (
      ?auto_34317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34313 ) ( not ( = ?auto_34313 ?auto_34314 ) ) ( not ( = ?auto_34313 ?auto_34315 ) ) ( not ( = ?auto_34313 ?auto_34316 ) ) ( not ( = ?auto_34314 ?auto_34315 ) ) ( not ( = ?auto_34314 ?auto_34316 ) ) ( not ( = ?auto_34315 ?auto_34316 ) ) ( ON ?auto_34316 ?auto_34317 ) ( not ( = ?auto_34313 ?auto_34317 ) ) ( not ( = ?auto_34314 ?auto_34317 ) ) ( not ( = ?auto_34315 ?auto_34317 ) ) ( not ( = ?auto_34316 ?auto_34317 ) ) ( ON ?auto_34315 ?auto_34316 ) ( ON-TABLE ?auto_34317 ) ( CLEAR ?auto_34313 ) ( ON ?auto_34314 ?auto_34315 ) ( CLEAR ?auto_34314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34317 ?auto_34316 ?auto_34315 )
      ( MAKE-4PILE ?auto_34313 ?auto_34314 ?auto_34315 ?auto_34316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34318 - BLOCK
      ?auto_34319 - BLOCK
      ?auto_34320 - BLOCK
      ?auto_34321 - BLOCK
    )
    :vars
    (
      ?auto_34322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34318 ?auto_34319 ) ) ( not ( = ?auto_34318 ?auto_34320 ) ) ( not ( = ?auto_34318 ?auto_34321 ) ) ( not ( = ?auto_34319 ?auto_34320 ) ) ( not ( = ?auto_34319 ?auto_34321 ) ) ( not ( = ?auto_34320 ?auto_34321 ) ) ( ON ?auto_34321 ?auto_34322 ) ( not ( = ?auto_34318 ?auto_34322 ) ) ( not ( = ?auto_34319 ?auto_34322 ) ) ( not ( = ?auto_34320 ?auto_34322 ) ) ( not ( = ?auto_34321 ?auto_34322 ) ) ( ON ?auto_34320 ?auto_34321 ) ( ON-TABLE ?auto_34322 ) ( ON ?auto_34319 ?auto_34320 ) ( CLEAR ?auto_34319 ) ( HOLDING ?auto_34318 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34318 )
      ( MAKE-4PILE ?auto_34318 ?auto_34319 ?auto_34320 ?auto_34321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34323 - BLOCK
      ?auto_34324 - BLOCK
      ?auto_34325 - BLOCK
      ?auto_34326 - BLOCK
    )
    :vars
    (
      ?auto_34327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34323 ?auto_34324 ) ) ( not ( = ?auto_34323 ?auto_34325 ) ) ( not ( = ?auto_34323 ?auto_34326 ) ) ( not ( = ?auto_34324 ?auto_34325 ) ) ( not ( = ?auto_34324 ?auto_34326 ) ) ( not ( = ?auto_34325 ?auto_34326 ) ) ( ON ?auto_34326 ?auto_34327 ) ( not ( = ?auto_34323 ?auto_34327 ) ) ( not ( = ?auto_34324 ?auto_34327 ) ) ( not ( = ?auto_34325 ?auto_34327 ) ) ( not ( = ?auto_34326 ?auto_34327 ) ) ( ON ?auto_34325 ?auto_34326 ) ( ON-TABLE ?auto_34327 ) ( ON ?auto_34324 ?auto_34325 ) ( ON ?auto_34323 ?auto_34324 ) ( CLEAR ?auto_34323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34327 ?auto_34326 ?auto_34325 ?auto_34324 )
      ( MAKE-4PILE ?auto_34323 ?auto_34324 ?auto_34325 ?auto_34326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34332 - BLOCK
      ?auto_34333 - BLOCK
      ?auto_34334 - BLOCK
      ?auto_34335 - BLOCK
    )
    :vars
    (
      ?auto_34336 - BLOCK
      ?auto_34337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34332 ?auto_34333 ) ) ( not ( = ?auto_34332 ?auto_34334 ) ) ( not ( = ?auto_34332 ?auto_34335 ) ) ( not ( = ?auto_34333 ?auto_34334 ) ) ( not ( = ?auto_34333 ?auto_34335 ) ) ( not ( = ?auto_34334 ?auto_34335 ) ) ( ON ?auto_34335 ?auto_34336 ) ( not ( = ?auto_34332 ?auto_34336 ) ) ( not ( = ?auto_34333 ?auto_34336 ) ) ( not ( = ?auto_34334 ?auto_34336 ) ) ( not ( = ?auto_34335 ?auto_34336 ) ) ( ON ?auto_34334 ?auto_34335 ) ( ON-TABLE ?auto_34336 ) ( ON ?auto_34333 ?auto_34334 ) ( CLEAR ?auto_34333 ) ( ON ?auto_34332 ?auto_34337 ) ( CLEAR ?auto_34332 ) ( HAND-EMPTY ) ( not ( = ?auto_34332 ?auto_34337 ) ) ( not ( = ?auto_34333 ?auto_34337 ) ) ( not ( = ?auto_34334 ?auto_34337 ) ) ( not ( = ?auto_34335 ?auto_34337 ) ) ( not ( = ?auto_34336 ?auto_34337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34332 ?auto_34337 )
      ( MAKE-4PILE ?auto_34332 ?auto_34333 ?auto_34334 ?auto_34335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34338 - BLOCK
      ?auto_34339 - BLOCK
      ?auto_34340 - BLOCK
      ?auto_34341 - BLOCK
    )
    :vars
    (
      ?auto_34342 - BLOCK
      ?auto_34343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34338 ?auto_34339 ) ) ( not ( = ?auto_34338 ?auto_34340 ) ) ( not ( = ?auto_34338 ?auto_34341 ) ) ( not ( = ?auto_34339 ?auto_34340 ) ) ( not ( = ?auto_34339 ?auto_34341 ) ) ( not ( = ?auto_34340 ?auto_34341 ) ) ( ON ?auto_34341 ?auto_34342 ) ( not ( = ?auto_34338 ?auto_34342 ) ) ( not ( = ?auto_34339 ?auto_34342 ) ) ( not ( = ?auto_34340 ?auto_34342 ) ) ( not ( = ?auto_34341 ?auto_34342 ) ) ( ON ?auto_34340 ?auto_34341 ) ( ON-TABLE ?auto_34342 ) ( ON ?auto_34338 ?auto_34343 ) ( CLEAR ?auto_34338 ) ( not ( = ?auto_34338 ?auto_34343 ) ) ( not ( = ?auto_34339 ?auto_34343 ) ) ( not ( = ?auto_34340 ?auto_34343 ) ) ( not ( = ?auto_34341 ?auto_34343 ) ) ( not ( = ?auto_34342 ?auto_34343 ) ) ( HOLDING ?auto_34339 ) ( CLEAR ?auto_34340 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34342 ?auto_34341 ?auto_34340 ?auto_34339 )
      ( MAKE-4PILE ?auto_34338 ?auto_34339 ?auto_34340 ?auto_34341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34344 - BLOCK
      ?auto_34345 - BLOCK
      ?auto_34346 - BLOCK
      ?auto_34347 - BLOCK
    )
    :vars
    (
      ?auto_34349 - BLOCK
      ?auto_34348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34344 ?auto_34345 ) ) ( not ( = ?auto_34344 ?auto_34346 ) ) ( not ( = ?auto_34344 ?auto_34347 ) ) ( not ( = ?auto_34345 ?auto_34346 ) ) ( not ( = ?auto_34345 ?auto_34347 ) ) ( not ( = ?auto_34346 ?auto_34347 ) ) ( ON ?auto_34347 ?auto_34349 ) ( not ( = ?auto_34344 ?auto_34349 ) ) ( not ( = ?auto_34345 ?auto_34349 ) ) ( not ( = ?auto_34346 ?auto_34349 ) ) ( not ( = ?auto_34347 ?auto_34349 ) ) ( ON ?auto_34346 ?auto_34347 ) ( ON-TABLE ?auto_34349 ) ( ON ?auto_34344 ?auto_34348 ) ( not ( = ?auto_34344 ?auto_34348 ) ) ( not ( = ?auto_34345 ?auto_34348 ) ) ( not ( = ?auto_34346 ?auto_34348 ) ) ( not ( = ?auto_34347 ?auto_34348 ) ) ( not ( = ?auto_34349 ?auto_34348 ) ) ( CLEAR ?auto_34346 ) ( ON ?auto_34345 ?auto_34344 ) ( CLEAR ?auto_34345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34348 ?auto_34344 )
      ( MAKE-4PILE ?auto_34344 ?auto_34345 ?auto_34346 ?auto_34347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34350 - BLOCK
      ?auto_34351 - BLOCK
      ?auto_34352 - BLOCK
      ?auto_34353 - BLOCK
    )
    :vars
    (
      ?auto_34355 - BLOCK
      ?auto_34354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34350 ?auto_34351 ) ) ( not ( = ?auto_34350 ?auto_34352 ) ) ( not ( = ?auto_34350 ?auto_34353 ) ) ( not ( = ?auto_34351 ?auto_34352 ) ) ( not ( = ?auto_34351 ?auto_34353 ) ) ( not ( = ?auto_34352 ?auto_34353 ) ) ( ON ?auto_34353 ?auto_34355 ) ( not ( = ?auto_34350 ?auto_34355 ) ) ( not ( = ?auto_34351 ?auto_34355 ) ) ( not ( = ?auto_34352 ?auto_34355 ) ) ( not ( = ?auto_34353 ?auto_34355 ) ) ( ON-TABLE ?auto_34355 ) ( ON ?auto_34350 ?auto_34354 ) ( not ( = ?auto_34350 ?auto_34354 ) ) ( not ( = ?auto_34351 ?auto_34354 ) ) ( not ( = ?auto_34352 ?auto_34354 ) ) ( not ( = ?auto_34353 ?auto_34354 ) ) ( not ( = ?auto_34355 ?auto_34354 ) ) ( ON ?auto_34351 ?auto_34350 ) ( CLEAR ?auto_34351 ) ( ON-TABLE ?auto_34354 ) ( HOLDING ?auto_34352 ) ( CLEAR ?auto_34353 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34355 ?auto_34353 ?auto_34352 )
      ( MAKE-4PILE ?auto_34350 ?auto_34351 ?auto_34352 ?auto_34353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34356 - BLOCK
      ?auto_34357 - BLOCK
      ?auto_34358 - BLOCK
      ?auto_34359 - BLOCK
    )
    :vars
    (
      ?auto_34360 - BLOCK
      ?auto_34361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34356 ?auto_34357 ) ) ( not ( = ?auto_34356 ?auto_34358 ) ) ( not ( = ?auto_34356 ?auto_34359 ) ) ( not ( = ?auto_34357 ?auto_34358 ) ) ( not ( = ?auto_34357 ?auto_34359 ) ) ( not ( = ?auto_34358 ?auto_34359 ) ) ( ON ?auto_34359 ?auto_34360 ) ( not ( = ?auto_34356 ?auto_34360 ) ) ( not ( = ?auto_34357 ?auto_34360 ) ) ( not ( = ?auto_34358 ?auto_34360 ) ) ( not ( = ?auto_34359 ?auto_34360 ) ) ( ON-TABLE ?auto_34360 ) ( ON ?auto_34356 ?auto_34361 ) ( not ( = ?auto_34356 ?auto_34361 ) ) ( not ( = ?auto_34357 ?auto_34361 ) ) ( not ( = ?auto_34358 ?auto_34361 ) ) ( not ( = ?auto_34359 ?auto_34361 ) ) ( not ( = ?auto_34360 ?auto_34361 ) ) ( ON ?auto_34357 ?auto_34356 ) ( ON-TABLE ?auto_34361 ) ( CLEAR ?auto_34359 ) ( ON ?auto_34358 ?auto_34357 ) ( CLEAR ?auto_34358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34361 ?auto_34356 ?auto_34357 )
      ( MAKE-4PILE ?auto_34356 ?auto_34357 ?auto_34358 ?auto_34359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34362 - BLOCK
      ?auto_34363 - BLOCK
      ?auto_34364 - BLOCK
      ?auto_34365 - BLOCK
    )
    :vars
    (
      ?auto_34367 - BLOCK
      ?auto_34366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34362 ?auto_34363 ) ) ( not ( = ?auto_34362 ?auto_34364 ) ) ( not ( = ?auto_34362 ?auto_34365 ) ) ( not ( = ?auto_34363 ?auto_34364 ) ) ( not ( = ?auto_34363 ?auto_34365 ) ) ( not ( = ?auto_34364 ?auto_34365 ) ) ( not ( = ?auto_34362 ?auto_34367 ) ) ( not ( = ?auto_34363 ?auto_34367 ) ) ( not ( = ?auto_34364 ?auto_34367 ) ) ( not ( = ?auto_34365 ?auto_34367 ) ) ( ON-TABLE ?auto_34367 ) ( ON ?auto_34362 ?auto_34366 ) ( not ( = ?auto_34362 ?auto_34366 ) ) ( not ( = ?auto_34363 ?auto_34366 ) ) ( not ( = ?auto_34364 ?auto_34366 ) ) ( not ( = ?auto_34365 ?auto_34366 ) ) ( not ( = ?auto_34367 ?auto_34366 ) ) ( ON ?auto_34363 ?auto_34362 ) ( ON-TABLE ?auto_34366 ) ( ON ?auto_34364 ?auto_34363 ) ( CLEAR ?auto_34364 ) ( HOLDING ?auto_34365 ) ( CLEAR ?auto_34367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34367 ?auto_34365 )
      ( MAKE-4PILE ?auto_34362 ?auto_34363 ?auto_34364 ?auto_34365 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34368 - BLOCK
      ?auto_34369 - BLOCK
      ?auto_34370 - BLOCK
      ?auto_34371 - BLOCK
    )
    :vars
    (
      ?auto_34373 - BLOCK
      ?auto_34372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34368 ?auto_34369 ) ) ( not ( = ?auto_34368 ?auto_34370 ) ) ( not ( = ?auto_34368 ?auto_34371 ) ) ( not ( = ?auto_34369 ?auto_34370 ) ) ( not ( = ?auto_34369 ?auto_34371 ) ) ( not ( = ?auto_34370 ?auto_34371 ) ) ( not ( = ?auto_34368 ?auto_34373 ) ) ( not ( = ?auto_34369 ?auto_34373 ) ) ( not ( = ?auto_34370 ?auto_34373 ) ) ( not ( = ?auto_34371 ?auto_34373 ) ) ( ON-TABLE ?auto_34373 ) ( ON ?auto_34368 ?auto_34372 ) ( not ( = ?auto_34368 ?auto_34372 ) ) ( not ( = ?auto_34369 ?auto_34372 ) ) ( not ( = ?auto_34370 ?auto_34372 ) ) ( not ( = ?auto_34371 ?auto_34372 ) ) ( not ( = ?auto_34373 ?auto_34372 ) ) ( ON ?auto_34369 ?auto_34368 ) ( ON-TABLE ?auto_34372 ) ( ON ?auto_34370 ?auto_34369 ) ( CLEAR ?auto_34373 ) ( ON ?auto_34371 ?auto_34370 ) ( CLEAR ?auto_34371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34372 ?auto_34368 ?auto_34369 ?auto_34370 )
      ( MAKE-4PILE ?auto_34368 ?auto_34369 ?auto_34370 ?auto_34371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34374 - BLOCK
      ?auto_34375 - BLOCK
      ?auto_34376 - BLOCK
      ?auto_34377 - BLOCK
    )
    :vars
    (
      ?auto_34379 - BLOCK
      ?auto_34378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34374 ?auto_34375 ) ) ( not ( = ?auto_34374 ?auto_34376 ) ) ( not ( = ?auto_34374 ?auto_34377 ) ) ( not ( = ?auto_34375 ?auto_34376 ) ) ( not ( = ?auto_34375 ?auto_34377 ) ) ( not ( = ?auto_34376 ?auto_34377 ) ) ( not ( = ?auto_34374 ?auto_34379 ) ) ( not ( = ?auto_34375 ?auto_34379 ) ) ( not ( = ?auto_34376 ?auto_34379 ) ) ( not ( = ?auto_34377 ?auto_34379 ) ) ( ON ?auto_34374 ?auto_34378 ) ( not ( = ?auto_34374 ?auto_34378 ) ) ( not ( = ?auto_34375 ?auto_34378 ) ) ( not ( = ?auto_34376 ?auto_34378 ) ) ( not ( = ?auto_34377 ?auto_34378 ) ) ( not ( = ?auto_34379 ?auto_34378 ) ) ( ON ?auto_34375 ?auto_34374 ) ( ON-TABLE ?auto_34378 ) ( ON ?auto_34376 ?auto_34375 ) ( ON ?auto_34377 ?auto_34376 ) ( CLEAR ?auto_34377 ) ( HOLDING ?auto_34379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34379 )
      ( MAKE-4PILE ?auto_34374 ?auto_34375 ?auto_34376 ?auto_34377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34380 - BLOCK
      ?auto_34381 - BLOCK
      ?auto_34382 - BLOCK
      ?auto_34383 - BLOCK
    )
    :vars
    (
      ?auto_34385 - BLOCK
      ?auto_34384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34380 ?auto_34381 ) ) ( not ( = ?auto_34380 ?auto_34382 ) ) ( not ( = ?auto_34380 ?auto_34383 ) ) ( not ( = ?auto_34381 ?auto_34382 ) ) ( not ( = ?auto_34381 ?auto_34383 ) ) ( not ( = ?auto_34382 ?auto_34383 ) ) ( not ( = ?auto_34380 ?auto_34385 ) ) ( not ( = ?auto_34381 ?auto_34385 ) ) ( not ( = ?auto_34382 ?auto_34385 ) ) ( not ( = ?auto_34383 ?auto_34385 ) ) ( ON ?auto_34380 ?auto_34384 ) ( not ( = ?auto_34380 ?auto_34384 ) ) ( not ( = ?auto_34381 ?auto_34384 ) ) ( not ( = ?auto_34382 ?auto_34384 ) ) ( not ( = ?auto_34383 ?auto_34384 ) ) ( not ( = ?auto_34385 ?auto_34384 ) ) ( ON ?auto_34381 ?auto_34380 ) ( ON-TABLE ?auto_34384 ) ( ON ?auto_34382 ?auto_34381 ) ( ON ?auto_34383 ?auto_34382 ) ( ON ?auto_34385 ?auto_34383 ) ( CLEAR ?auto_34385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34384 ?auto_34380 ?auto_34381 ?auto_34382 ?auto_34383 )
      ( MAKE-4PILE ?auto_34380 ?auto_34381 ?auto_34382 ?auto_34383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34396 - BLOCK
      ?auto_34397 - BLOCK
      ?auto_34398 - BLOCK
      ?auto_34399 - BLOCK
      ?auto_34400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34399 ) ( ON-TABLE ?auto_34396 ) ( ON ?auto_34397 ?auto_34396 ) ( ON ?auto_34398 ?auto_34397 ) ( ON ?auto_34399 ?auto_34398 ) ( not ( = ?auto_34396 ?auto_34397 ) ) ( not ( = ?auto_34396 ?auto_34398 ) ) ( not ( = ?auto_34396 ?auto_34399 ) ) ( not ( = ?auto_34396 ?auto_34400 ) ) ( not ( = ?auto_34397 ?auto_34398 ) ) ( not ( = ?auto_34397 ?auto_34399 ) ) ( not ( = ?auto_34397 ?auto_34400 ) ) ( not ( = ?auto_34398 ?auto_34399 ) ) ( not ( = ?auto_34398 ?auto_34400 ) ) ( not ( = ?auto_34399 ?auto_34400 ) ) ( ON-TABLE ?auto_34400 ) ( CLEAR ?auto_34400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_34400 )
      ( MAKE-5PILE ?auto_34396 ?auto_34397 ?auto_34398 ?auto_34399 ?auto_34400 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34401 - BLOCK
      ?auto_34402 - BLOCK
      ?auto_34403 - BLOCK
      ?auto_34404 - BLOCK
      ?auto_34405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34401 ) ( ON ?auto_34402 ?auto_34401 ) ( ON ?auto_34403 ?auto_34402 ) ( not ( = ?auto_34401 ?auto_34402 ) ) ( not ( = ?auto_34401 ?auto_34403 ) ) ( not ( = ?auto_34401 ?auto_34404 ) ) ( not ( = ?auto_34401 ?auto_34405 ) ) ( not ( = ?auto_34402 ?auto_34403 ) ) ( not ( = ?auto_34402 ?auto_34404 ) ) ( not ( = ?auto_34402 ?auto_34405 ) ) ( not ( = ?auto_34403 ?auto_34404 ) ) ( not ( = ?auto_34403 ?auto_34405 ) ) ( not ( = ?auto_34404 ?auto_34405 ) ) ( ON-TABLE ?auto_34405 ) ( CLEAR ?auto_34405 ) ( HOLDING ?auto_34404 ) ( CLEAR ?auto_34403 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34401 ?auto_34402 ?auto_34403 ?auto_34404 )
      ( MAKE-5PILE ?auto_34401 ?auto_34402 ?auto_34403 ?auto_34404 ?auto_34405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34406 - BLOCK
      ?auto_34407 - BLOCK
      ?auto_34408 - BLOCK
      ?auto_34409 - BLOCK
      ?auto_34410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34406 ) ( ON ?auto_34407 ?auto_34406 ) ( ON ?auto_34408 ?auto_34407 ) ( not ( = ?auto_34406 ?auto_34407 ) ) ( not ( = ?auto_34406 ?auto_34408 ) ) ( not ( = ?auto_34406 ?auto_34409 ) ) ( not ( = ?auto_34406 ?auto_34410 ) ) ( not ( = ?auto_34407 ?auto_34408 ) ) ( not ( = ?auto_34407 ?auto_34409 ) ) ( not ( = ?auto_34407 ?auto_34410 ) ) ( not ( = ?auto_34408 ?auto_34409 ) ) ( not ( = ?auto_34408 ?auto_34410 ) ) ( not ( = ?auto_34409 ?auto_34410 ) ) ( ON-TABLE ?auto_34410 ) ( CLEAR ?auto_34408 ) ( ON ?auto_34409 ?auto_34410 ) ( CLEAR ?auto_34409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34410 )
      ( MAKE-5PILE ?auto_34406 ?auto_34407 ?auto_34408 ?auto_34409 ?auto_34410 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34411 - BLOCK
      ?auto_34412 - BLOCK
      ?auto_34413 - BLOCK
      ?auto_34414 - BLOCK
      ?auto_34415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34411 ) ( ON ?auto_34412 ?auto_34411 ) ( not ( = ?auto_34411 ?auto_34412 ) ) ( not ( = ?auto_34411 ?auto_34413 ) ) ( not ( = ?auto_34411 ?auto_34414 ) ) ( not ( = ?auto_34411 ?auto_34415 ) ) ( not ( = ?auto_34412 ?auto_34413 ) ) ( not ( = ?auto_34412 ?auto_34414 ) ) ( not ( = ?auto_34412 ?auto_34415 ) ) ( not ( = ?auto_34413 ?auto_34414 ) ) ( not ( = ?auto_34413 ?auto_34415 ) ) ( not ( = ?auto_34414 ?auto_34415 ) ) ( ON-TABLE ?auto_34415 ) ( ON ?auto_34414 ?auto_34415 ) ( CLEAR ?auto_34414 ) ( HOLDING ?auto_34413 ) ( CLEAR ?auto_34412 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34411 ?auto_34412 ?auto_34413 )
      ( MAKE-5PILE ?auto_34411 ?auto_34412 ?auto_34413 ?auto_34414 ?auto_34415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34416 - BLOCK
      ?auto_34417 - BLOCK
      ?auto_34418 - BLOCK
      ?auto_34419 - BLOCK
      ?auto_34420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34416 ) ( ON ?auto_34417 ?auto_34416 ) ( not ( = ?auto_34416 ?auto_34417 ) ) ( not ( = ?auto_34416 ?auto_34418 ) ) ( not ( = ?auto_34416 ?auto_34419 ) ) ( not ( = ?auto_34416 ?auto_34420 ) ) ( not ( = ?auto_34417 ?auto_34418 ) ) ( not ( = ?auto_34417 ?auto_34419 ) ) ( not ( = ?auto_34417 ?auto_34420 ) ) ( not ( = ?auto_34418 ?auto_34419 ) ) ( not ( = ?auto_34418 ?auto_34420 ) ) ( not ( = ?auto_34419 ?auto_34420 ) ) ( ON-TABLE ?auto_34420 ) ( ON ?auto_34419 ?auto_34420 ) ( CLEAR ?auto_34417 ) ( ON ?auto_34418 ?auto_34419 ) ( CLEAR ?auto_34418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34420 ?auto_34419 )
      ( MAKE-5PILE ?auto_34416 ?auto_34417 ?auto_34418 ?auto_34419 ?auto_34420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34421 - BLOCK
      ?auto_34422 - BLOCK
      ?auto_34423 - BLOCK
      ?auto_34424 - BLOCK
      ?auto_34425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34421 ) ( not ( = ?auto_34421 ?auto_34422 ) ) ( not ( = ?auto_34421 ?auto_34423 ) ) ( not ( = ?auto_34421 ?auto_34424 ) ) ( not ( = ?auto_34421 ?auto_34425 ) ) ( not ( = ?auto_34422 ?auto_34423 ) ) ( not ( = ?auto_34422 ?auto_34424 ) ) ( not ( = ?auto_34422 ?auto_34425 ) ) ( not ( = ?auto_34423 ?auto_34424 ) ) ( not ( = ?auto_34423 ?auto_34425 ) ) ( not ( = ?auto_34424 ?auto_34425 ) ) ( ON-TABLE ?auto_34425 ) ( ON ?auto_34424 ?auto_34425 ) ( ON ?auto_34423 ?auto_34424 ) ( CLEAR ?auto_34423 ) ( HOLDING ?auto_34422 ) ( CLEAR ?auto_34421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34421 ?auto_34422 )
      ( MAKE-5PILE ?auto_34421 ?auto_34422 ?auto_34423 ?auto_34424 ?auto_34425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34426 - BLOCK
      ?auto_34427 - BLOCK
      ?auto_34428 - BLOCK
      ?auto_34429 - BLOCK
      ?auto_34430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34426 ) ( not ( = ?auto_34426 ?auto_34427 ) ) ( not ( = ?auto_34426 ?auto_34428 ) ) ( not ( = ?auto_34426 ?auto_34429 ) ) ( not ( = ?auto_34426 ?auto_34430 ) ) ( not ( = ?auto_34427 ?auto_34428 ) ) ( not ( = ?auto_34427 ?auto_34429 ) ) ( not ( = ?auto_34427 ?auto_34430 ) ) ( not ( = ?auto_34428 ?auto_34429 ) ) ( not ( = ?auto_34428 ?auto_34430 ) ) ( not ( = ?auto_34429 ?auto_34430 ) ) ( ON-TABLE ?auto_34430 ) ( ON ?auto_34429 ?auto_34430 ) ( ON ?auto_34428 ?auto_34429 ) ( CLEAR ?auto_34426 ) ( ON ?auto_34427 ?auto_34428 ) ( CLEAR ?auto_34427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34430 ?auto_34429 ?auto_34428 )
      ( MAKE-5PILE ?auto_34426 ?auto_34427 ?auto_34428 ?auto_34429 ?auto_34430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34431 - BLOCK
      ?auto_34432 - BLOCK
      ?auto_34433 - BLOCK
      ?auto_34434 - BLOCK
      ?auto_34435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34431 ?auto_34432 ) ) ( not ( = ?auto_34431 ?auto_34433 ) ) ( not ( = ?auto_34431 ?auto_34434 ) ) ( not ( = ?auto_34431 ?auto_34435 ) ) ( not ( = ?auto_34432 ?auto_34433 ) ) ( not ( = ?auto_34432 ?auto_34434 ) ) ( not ( = ?auto_34432 ?auto_34435 ) ) ( not ( = ?auto_34433 ?auto_34434 ) ) ( not ( = ?auto_34433 ?auto_34435 ) ) ( not ( = ?auto_34434 ?auto_34435 ) ) ( ON-TABLE ?auto_34435 ) ( ON ?auto_34434 ?auto_34435 ) ( ON ?auto_34433 ?auto_34434 ) ( ON ?auto_34432 ?auto_34433 ) ( CLEAR ?auto_34432 ) ( HOLDING ?auto_34431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34431 )
      ( MAKE-5PILE ?auto_34431 ?auto_34432 ?auto_34433 ?auto_34434 ?auto_34435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34436 - BLOCK
      ?auto_34437 - BLOCK
      ?auto_34438 - BLOCK
      ?auto_34439 - BLOCK
      ?auto_34440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34436 ?auto_34437 ) ) ( not ( = ?auto_34436 ?auto_34438 ) ) ( not ( = ?auto_34436 ?auto_34439 ) ) ( not ( = ?auto_34436 ?auto_34440 ) ) ( not ( = ?auto_34437 ?auto_34438 ) ) ( not ( = ?auto_34437 ?auto_34439 ) ) ( not ( = ?auto_34437 ?auto_34440 ) ) ( not ( = ?auto_34438 ?auto_34439 ) ) ( not ( = ?auto_34438 ?auto_34440 ) ) ( not ( = ?auto_34439 ?auto_34440 ) ) ( ON-TABLE ?auto_34440 ) ( ON ?auto_34439 ?auto_34440 ) ( ON ?auto_34438 ?auto_34439 ) ( ON ?auto_34437 ?auto_34438 ) ( ON ?auto_34436 ?auto_34437 ) ( CLEAR ?auto_34436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34440 ?auto_34439 ?auto_34438 ?auto_34437 )
      ( MAKE-5PILE ?auto_34436 ?auto_34437 ?auto_34438 ?auto_34439 ?auto_34440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34446 - BLOCK
      ?auto_34447 - BLOCK
      ?auto_34448 - BLOCK
      ?auto_34449 - BLOCK
      ?auto_34450 - BLOCK
    )
    :vars
    (
      ?auto_34451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34446 ?auto_34447 ) ) ( not ( = ?auto_34446 ?auto_34448 ) ) ( not ( = ?auto_34446 ?auto_34449 ) ) ( not ( = ?auto_34446 ?auto_34450 ) ) ( not ( = ?auto_34447 ?auto_34448 ) ) ( not ( = ?auto_34447 ?auto_34449 ) ) ( not ( = ?auto_34447 ?auto_34450 ) ) ( not ( = ?auto_34448 ?auto_34449 ) ) ( not ( = ?auto_34448 ?auto_34450 ) ) ( not ( = ?auto_34449 ?auto_34450 ) ) ( ON-TABLE ?auto_34450 ) ( ON ?auto_34449 ?auto_34450 ) ( ON ?auto_34448 ?auto_34449 ) ( ON ?auto_34447 ?auto_34448 ) ( CLEAR ?auto_34447 ) ( ON ?auto_34446 ?auto_34451 ) ( CLEAR ?auto_34446 ) ( HAND-EMPTY ) ( not ( = ?auto_34446 ?auto_34451 ) ) ( not ( = ?auto_34447 ?auto_34451 ) ) ( not ( = ?auto_34448 ?auto_34451 ) ) ( not ( = ?auto_34449 ?auto_34451 ) ) ( not ( = ?auto_34450 ?auto_34451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34446 ?auto_34451 )
      ( MAKE-5PILE ?auto_34446 ?auto_34447 ?auto_34448 ?auto_34449 ?auto_34450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34452 - BLOCK
      ?auto_34453 - BLOCK
      ?auto_34454 - BLOCK
      ?auto_34455 - BLOCK
      ?auto_34456 - BLOCK
    )
    :vars
    (
      ?auto_34457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34452 ?auto_34453 ) ) ( not ( = ?auto_34452 ?auto_34454 ) ) ( not ( = ?auto_34452 ?auto_34455 ) ) ( not ( = ?auto_34452 ?auto_34456 ) ) ( not ( = ?auto_34453 ?auto_34454 ) ) ( not ( = ?auto_34453 ?auto_34455 ) ) ( not ( = ?auto_34453 ?auto_34456 ) ) ( not ( = ?auto_34454 ?auto_34455 ) ) ( not ( = ?auto_34454 ?auto_34456 ) ) ( not ( = ?auto_34455 ?auto_34456 ) ) ( ON-TABLE ?auto_34456 ) ( ON ?auto_34455 ?auto_34456 ) ( ON ?auto_34454 ?auto_34455 ) ( ON ?auto_34452 ?auto_34457 ) ( CLEAR ?auto_34452 ) ( not ( = ?auto_34452 ?auto_34457 ) ) ( not ( = ?auto_34453 ?auto_34457 ) ) ( not ( = ?auto_34454 ?auto_34457 ) ) ( not ( = ?auto_34455 ?auto_34457 ) ) ( not ( = ?auto_34456 ?auto_34457 ) ) ( HOLDING ?auto_34453 ) ( CLEAR ?auto_34454 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34456 ?auto_34455 ?auto_34454 ?auto_34453 )
      ( MAKE-5PILE ?auto_34452 ?auto_34453 ?auto_34454 ?auto_34455 ?auto_34456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34458 - BLOCK
      ?auto_34459 - BLOCK
      ?auto_34460 - BLOCK
      ?auto_34461 - BLOCK
      ?auto_34462 - BLOCK
    )
    :vars
    (
      ?auto_34463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34458 ?auto_34459 ) ) ( not ( = ?auto_34458 ?auto_34460 ) ) ( not ( = ?auto_34458 ?auto_34461 ) ) ( not ( = ?auto_34458 ?auto_34462 ) ) ( not ( = ?auto_34459 ?auto_34460 ) ) ( not ( = ?auto_34459 ?auto_34461 ) ) ( not ( = ?auto_34459 ?auto_34462 ) ) ( not ( = ?auto_34460 ?auto_34461 ) ) ( not ( = ?auto_34460 ?auto_34462 ) ) ( not ( = ?auto_34461 ?auto_34462 ) ) ( ON-TABLE ?auto_34462 ) ( ON ?auto_34461 ?auto_34462 ) ( ON ?auto_34460 ?auto_34461 ) ( ON ?auto_34458 ?auto_34463 ) ( not ( = ?auto_34458 ?auto_34463 ) ) ( not ( = ?auto_34459 ?auto_34463 ) ) ( not ( = ?auto_34460 ?auto_34463 ) ) ( not ( = ?auto_34461 ?auto_34463 ) ) ( not ( = ?auto_34462 ?auto_34463 ) ) ( CLEAR ?auto_34460 ) ( ON ?auto_34459 ?auto_34458 ) ( CLEAR ?auto_34459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34463 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34463 ?auto_34458 )
      ( MAKE-5PILE ?auto_34458 ?auto_34459 ?auto_34460 ?auto_34461 ?auto_34462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34464 - BLOCK
      ?auto_34465 - BLOCK
      ?auto_34466 - BLOCK
      ?auto_34467 - BLOCK
      ?auto_34468 - BLOCK
    )
    :vars
    (
      ?auto_34469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34464 ?auto_34465 ) ) ( not ( = ?auto_34464 ?auto_34466 ) ) ( not ( = ?auto_34464 ?auto_34467 ) ) ( not ( = ?auto_34464 ?auto_34468 ) ) ( not ( = ?auto_34465 ?auto_34466 ) ) ( not ( = ?auto_34465 ?auto_34467 ) ) ( not ( = ?auto_34465 ?auto_34468 ) ) ( not ( = ?auto_34466 ?auto_34467 ) ) ( not ( = ?auto_34466 ?auto_34468 ) ) ( not ( = ?auto_34467 ?auto_34468 ) ) ( ON-TABLE ?auto_34468 ) ( ON ?auto_34467 ?auto_34468 ) ( ON ?auto_34464 ?auto_34469 ) ( not ( = ?auto_34464 ?auto_34469 ) ) ( not ( = ?auto_34465 ?auto_34469 ) ) ( not ( = ?auto_34466 ?auto_34469 ) ) ( not ( = ?auto_34467 ?auto_34469 ) ) ( not ( = ?auto_34468 ?auto_34469 ) ) ( ON ?auto_34465 ?auto_34464 ) ( CLEAR ?auto_34465 ) ( ON-TABLE ?auto_34469 ) ( HOLDING ?auto_34466 ) ( CLEAR ?auto_34467 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34468 ?auto_34467 ?auto_34466 )
      ( MAKE-5PILE ?auto_34464 ?auto_34465 ?auto_34466 ?auto_34467 ?auto_34468 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34470 - BLOCK
      ?auto_34471 - BLOCK
      ?auto_34472 - BLOCK
      ?auto_34473 - BLOCK
      ?auto_34474 - BLOCK
    )
    :vars
    (
      ?auto_34475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34470 ?auto_34471 ) ) ( not ( = ?auto_34470 ?auto_34472 ) ) ( not ( = ?auto_34470 ?auto_34473 ) ) ( not ( = ?auto_34470 ?auto_34474 ) ) ( not ( = ?auto_34471 ?auto_34472 ) ) ( not ( = ?auto_34471 ?auto_34473 ) ) ( not ( = ?auto_34471 ?auto_34474 ) ) ( not ( = ?auto_34472 ?auto_34473 ) ) ( not ( = ?auto_34472 ?auto_34474 ) ) ( not ( = ?auto_34473 ?auto_34474 ) ) ( ON-TABLE ?auto_34474 ) ( ON ?auto_34473 ?auto_34474 ) ( ON ?auto_34470 ?auto_34475 ) ( not ( = ?auto_34470 ?auto_34475 ) ) ( not ( = ?auto_34471 ?auto_34475 ) ) ( not ( = ?auto_34472 ?auto_34475 ) ) ( not ( = ?auto_34473 ?auto_34475 ) ) ( not ( = ?auto_34474 ?auto_34475 ) ) ( ON ?auto_34471 ?auto_34470 ) ( ON-TABLE ?auto_34475 ) ( CLEAR ?auto_34473 ) ( ON ?auto_34472 ?auto_34471 ) ( CLEAR ?auto_34472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34475 ?auto_34470 ?auto_34471 )
      ( MAKE-5PILE ?auto_34470 ?auto_34471 ?auto_34472 ?auto_34473 ?auto_34474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34476 - BLOCK
      ?auto_34477 - BLOCK
      ?auto_34478 - BLOCK
      ?auto_34479 - BLOCK
      ?auto_34480 - BLOCK
    )
    :vars
    (
      ?auto_34481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34476 ?auto_34477 ) ) ( not ( = ?auto_34476 ?auto_34478 ) ) ( not ( = ?auto_34476 ?auto_34479 ) ) ( not ( = ?auto_34476 ?auto_34480 ) ) ( not ( = ?auto_34477 ?auto_34478 ) ) ( not ( = ?auto_34477 ?auto_34479 ) ) ( not ( = ?auto_34477 ?auto_34480 ) ) ( not ( = ?auto_34478 ?auto_34479 ) ) ( not ( = ?auto_34478 ?auto_34480 ) ) ( not ( = ?auto_34479 ?auto_34480 ) ) ( ON-TABLE ?auto_34480 ) ( ON ?auto_34476 ?auto_34481 ) ( not ( = ?auto_34476 ?auto_34481 ) ) ( not ( = ?auto_34477 ?auto_34481 ) ) ( not ( = ?auto_34478 ?auto_34481 ) ) ( not ( = ?auto_34479 ?auto_34481 ) ) ( not ( = ?auto_34480 ?auto_34481 ) ) ( ON ?auto_34477 ?auto_34476 ) ( ON-TABLE ?auto_34481 ) ( ON ?auto_34478 ?auto_34477 ) ( CLEAR ?auto_34478 ) ( HOLDING ?auto_34479 ) ( CLEAR ?auto_34480 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34480 ?auto_34479 )
      ( MAKE-5PILE ?auto_34476 ?auto_34477 ?auto_34478 ?auto_34479 ?auto_34480 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34482 - BLOCK
      ?auto_34483 - BLOCK
      ?auto_34484 - BLOCK
      ?auto_34485 - BLOCK
      ?auto_34486 - BLOCK
    )
    :vars
    (
      ?auto_34487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34482 ?auto_34483 ) ) ( not ( = ?auto_34482 ?auto_34484 ) ) ( not ( = ?auto_34482 ?auto_34485 ) ) ( not ( = ?auto_34482 ?auto_34486 ) ) ( not ( = ?auto_34483 ?auto_34484 ) ) ( not ( = ?auto_34483 ?auto_34485 ) ) ( not ( = ?auto_34483 ?auto_34486 ) ) ( not ( = ?auto_34484 ?auto_34485 ) ) ( not ( = ?auto_34484 ?auto_34486 ) ) ( not ( = ?auto_34485 ?auto_34486 ) ) ( ON-TABLE ?auto_34486 ) ( ON ?auto_34482 ?auto_34487 ) ( not ( = ?auto_34482 ?auto_34487 ) ) ( not ( = ?auto_34483 ?auto_34487 ) ) ( not ( = ?auto_34484 ?auto_34487 ) ) ( not ( = ?auto_34485 ?auto_34487 ) ) ( not ( = ?auto_34486 ?auto_34487 ) ) ( ON ?auto_34483 ?auto_34482 ) ( ON-TABLE ?auto_34487 ) ( ON ?auto_34484 ?auto_34483 ) ( CLEAR ?auto_34486 ) ( ON ?auto_34485 ?auto_34484 ) ( CLEAR ?auto_34485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34487 ?auto_34482 ?auto_34483 ?auto_34484 )
      ( MAKE-5PILE ?auto_34482 ?auto_34483 ?auto_34484 ?auto_34485 ?auto_34486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34488 - BLOCK
      ?auto_34489 - BLOCK
      ?auto_34490 - BLOCK
      ?auto_34491 - BLOCK
      ?auto_34492 - BLOCK
    )
    :vars
    (
      ?auto_34493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34488 ?auto_34489 ) ) ( not ( = ?auto_34488 ?auto_34490 ) ) ( not ( = ?auto_34488 ?auto_34491 ) ) ( not ( = ?auto_34488 ?auto_34492 ) ) ( not ( = ?auto_34489 ?auto_34490 ) ) ( not ( = ?auto_34489 ?auto_34491 ) ) ( not ( = ?auto_34489 ?auto_34492 ) ) ( not ( = ?auto_34490 ?auto_34491 ) ) ( not ( = ?auto_34490 ?auto_34492 ) ) ( not ( = ?auto_34491 ?auto_34492 ) ) ( ON ?auto_34488 ?auto_34493 ) ( not ( = ?auto_34488 ?auto_34493 ) ) ( not ( = ?auto_34489 ?auto_34493 ) ) ( not ( = ?auto_34490 ?auto_34493 ) ) ( not ( = ?auto_34491 ?auto_34493 ) ) ( not ( = ?auto_34492 ?auto_34493 ) ) ( ON ?auto_34489 ?auto_34488 ) ( ON-TABLE ?auto_34493 ) ( ON ?auto_34490 ?auto_34489 ) ( ON ?auto_34491 ?auto_34490 ) ( CLEAR ?auto_34491 ) ( HOLDING ?auto_34492 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34492 )
      ( MAKE-5PILE ?auto_34488 ?auto_34489 ?auto_34490 ?auto_34491 ?auto_34492 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34494 - BLOCK
      ?auto_34495 - BLOCK
      ?auto_34496 - BLOCK
      ?auto_34497 - BLOCK
      ?auto_34498 - BLOCK
    )
    :vars
    (
      ?auto_34499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34494 ?auto_34495 ) ) ( not ( = ?auto_34494 ?auto_34496 ) ) ( not ( = ?auto_34494 ?auto_34497 ) ) ( not ( = ?auto_34494 ?auto_34498 ) ) ( not ( = ?auto_34495 ?auto_34496 ) ) ( not ( = ?auto_34495 ?auto_34497 ) ) ( not ( = ?auto_34495 ?auto_34498 ) ) ( not ( = ?auto_34496 ?auto_34497 ) ) ( not ( = ?auto_34496 ?auto_34498 ) ) ( not ( = ?auto_34497 ?auto_34498 ) ) ( ON ?auto_34494 ?auto_34499 ) ( not ( = ?auto_34494 ?auto_34499 ) ) ( not ( = ?auto_34495 ?auto_34499 ) ) ( not ( = ?auto_34496 ?auto_34499 ) ) ( not ( = ?auto_34497 ?auto_34499 ) ) ( not ( = ?auto_34498 ?auto_34499 ) ) ( ON ?auto_34495 ?auto_34494 ) ( ON-TABLE ?auto_34499 ) ( ON ?auto_34496 ?auto_34495 ) ( ON ?auto_34497 ?auto_34496 ) ( ON ?auto_34498 ?auto_34497 ) ( CLEAR ?auto_34498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34499 ?auto_34494 ?auto_34495 ?auto_34496 ?auto_34497 )
      ( MAKE-5PILE ?auto_34494 ?auto_34495 ?auto_34496 ?auto_34497 ?auto_34498 ) )
  )

)

