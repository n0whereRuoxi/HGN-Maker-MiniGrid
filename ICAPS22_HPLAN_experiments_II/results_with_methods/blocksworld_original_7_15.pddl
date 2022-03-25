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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118557 - BLOCK
      ?auto_118558 - BLOCK
      ?auto_118559 - BLOCK
      ?auto_118560 - BLOCK
      ?auto_118561 - BLOCK
      ?auto_118562 - BLOCK
      ?auto_118563 - BLOCK
    )
    :vars
    (
      ?auto_118564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118564 ?auto_118563 ) ( CLEAR ?auto_118564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118557 ) ( ON ?auto_118558 ?auto_118557 ) ( ON ?auto_118559 ?auto_118558 ) ( ON ?auto_118560 ?auto_118559 ) ( ON ?auto_118561 ?auto_118560 ) ( ON ?auto_118562 ?auto_118561 ) ( ON ?auto_118563 ?auto_118562 ) ( not ( = ?auto_118557 ?auto_118558 ) ) ( not ( = ?auto_118557 ?auto_118559 ) ) ( not ( = ?auto_118557 ?auto_118560 ) ) ( not ( = ?auto_118557 ?auto_118561 ) ) ( not ( = ?auto_118557 ?auto_118562 ) ) ( not ( = ?auto_118557 ?auto_118563 ) ) ( not ( = ?auto_118557 ?auto_118564 ) ) ( not ( = ?auto_118558 ?auto_118559 ) ) ( not ( = ?auto_118558 ?auto_118560 ) ) ( not ( = ?auto_118558 ?auto_118561 ) ) ( not ( = ?auto_118558 ?auto_118562 ) ) ( not ( = ?auto_118558 ?auto_118563 ) ) ( not ( = ?auto_118558 ?auto_118564 ) ) ( not ( = ?auto_118559 ?auto_118560 ) ) ( not ( = ?auto_118559 ?auto_118561 ) ) ( not ( = ?auto_118559 ?auto_118562 ) ) ( not ( = ?auto_118559 ?auto_118563 ) ) ( not ( = ?auto_118559 ?auto_118564 ) ) ( not ( = ?auto_118560 ?auto_118561 ) ) ( not ( = ?auto_118560 ?auto_118562 ) ) ( not ( = ?auto_118560 ?auto_118563 ) ) ( not ( = ?auto_118560 ?auto_118564 ) ) ( not ( = ?auto_118561 ?auto_118562 ) ) ( not ( = ?auto_118561 ?auto_118563 ) ) ( not ( = ?auto_118561 ?auto_118564 ) ) ( not ( = ?auto_118562 ?auto_118563 ) ) ( not ( = ?auto_118562 ?auto_118564 ) ) ( not ( = ?auto_118563 ?auto_118564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118564 ?auto_118563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118566 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_118566 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_118566 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_118567 - BLOCK
    )
    :vars
    (
      ?auto_118568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118567 ?auto_118568 ) ( CLEAR ?auto_118567 ) ( HAND-EMPTY ) ( not ( = ?auto_118567 ?auto_118568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118567 ?auto_118568 )
      ( MAKE-1PILE ?auto_118567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118575 - BLOCK
      ?auto_118576 - BLOCK
      ?auto_118577 - BLOCK
      ?auto_118578 - BLOCK
      ?auto_118579 - BLOCK
      ?auto_118580 - BLOCK
    )
    :vars
    (
      ?auto_118581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118581 ?auto_118580 ) ( CLEAR ?auto_118581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118575 ) ( ON ?auto_118576 ?auto_118575 ) ( ON ?auto_118577 ?auto_118576 ) ( ON ?auto_118578 ?auto_118577 ) ( ON ?auto_118579 ?auto_118578 ) ( ON ?auto_118580 ?auto_118579 ) ( not ( = ?auto_118575 ?auto_118576 ) ) ( not ( = ?auto_118575 ?auto_118577 ) ) ( not ( = ?auto_118575 ?auto_118578 ) ) ( not ( = ?auto_118575 ?auto_118579 ) ) ( not ( = ?auto_118575 ?auto_118580 ) ) ( not ( = ?auto_118575 ?auto_118581 ) ) ( not ( = ?auto_118576 ?auto_118577 ) ) ( not ( = ?auto_118576 ?auto_118578 ) ) ( not ( = ?auto_118576 ?auto_118579 ) ) ( not ( = ?auto_118576 ?auto_118580 ) ) ( not ( = ?auto_118576 ?auto_118581 ) ) ( not ( = ?auto_118577 ?auto_118578 ) ) ( not ( = ?auto_118577 ?auto_118579 ) ) ( not ( = ?auto_118577 ?auto_118580 ) ) ( not ( = ?auto_118577 ?auto_118581 ) ) ( not ( = ?auto_118578 ?auto_118579 ) ) ( not ( = ?auto_118578 ?auto_118580 ) ) ( not ( = ?auto_118578 ?auto_118581 ) ) ( not ( = ?auto_118579 ?auto_118580 ) ) ( not ( = ?auto_118579 ?auto_118581 ) ) ( not ( = ?auto_118580 ?auto_118581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118581 ?auto_118580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118582 - BLOCK
      ?auto_118583 - BLOCK
      ?auto_118584 - BLOCK
      ?auto_118585 - BLOCK
      ?auto_118586 - BLOCK
      ?auto_118587 - BLOCK
    )
    :vars
    (
      ?auto_118588 - BLOCK
      ?auto_118589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118588 ?auto_118587 ) ( CLEAR ?auto_118588 ) ( ON-TABLE ?auto_118582 ) ( ON ?auto_118583 ?auto_118582 ) ( ON ?auto_118584 ?auto_118583 ) ( ON ?auto_118585 ?auto_118584 ) ( ON ?auto_118586 ?auto_118585 ) ( ON ?auto_118587 ?auto_118586 ) ( not ( = ?auto_118582 ?auto_118583 ) ) ( not ( = ?auto_118582 ?auto_118584 ) ) ( not ( = ?auto_118582 ?auto_118585 ) ) ( not ( = ?auto_118582 ?auto_118586 ) ) ( not ( = ?auto_118582 ?auto_118587 ) ) ( not ( = ?auto_118582 ?auto_118588 ) ) ( not ( = ?auto_118583 ?auto_118584 ) ) ( not ( = ?auto_118583 ?auto_118585 ) ) ( not ( = ?auto_118583 ?auto_118586 ) ) ( not ( = ?auto_118583 ?auto_118587 ) ) ( not ( = ?auto_118583 ?auto_118588 ) ) ( not ( = ?auto_118584 ?auto_118585 ) ) ( not ( = ?auto_118584 ?auto_118586 ) ) ( not ( = ?auto_118584 ?auto_118587 ) ) ( not ( = ?auto_118584 ?auto_118588 ) ) ( not ( = ?auto_118585 ?auto_118586 ) ) ( not ( = ?auto_118585 ?auto_118587 ) ) ( not ( = ?auto_118585 ?auto_118588 ) ) ( not ( = ?auto_118586 ?auto_118587 ) ) ( not ( = ?auto_118586 ?auto_118588 ) ) ( not ( = ?auto_118587 ?auto_118588 ) ) ( HOLDING ?auto_118589 ) ( not ( = ?auto_118582 ?auto_118589 ) ) ( not ( = ?auto_118583 ?auto_118589 ) ) ( not ( = ?auto_118584 ?auto_118589 ) ) ( not ( = ?auto_118585 ?auto_118589 ) ) ( not ( = ?auto_118586 ?auto_118589 ) ) ( not ( = ?auto_118587 ?auto_118589 ) ) ( not ( = ?auto_118588 ?auto_118589 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_118589 )
      ( MAKE-6PILE ?auto_118582 ?auto_118583 ?auto_118584 ?auto_118585 ?auto_118586 ?auto_118587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_118590 - BLOCK
      ?auto_118591 - BLOCK
      ?auto_118592 - BLOCK
      ?auto_118593 - BLOCK
      ?auto_118594 - BLOCK
      ?auto_118595 - BLOCK
    )
    :vars
    (
      ?auto_118597 - BLOCK
      ?auto_118596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118597 ?auto_118595 ) ( ON-TABLE ?auto_118590 ) ( ON ?auto_118591 ?auto_118590 ) ( ON ?auto_118592 ?auto_118591 ) ( ON ?auto_118593 ?auto_118592 ) ( ON ?auto_118594 ?auto_118593 ) ( ON ?auto_118595 ?auto_118594 ) ( not ( = ?auto_118590 ?auto_118591 ) ) ( not ( = ?auto_118590 ?auto_118592 ) ) ( not ( = ?auto_118590 ?auto_118593 ) ) ( not ( = ?auto_118590 ?auto_118594 ) ) ( not ( = ?auto_118590 ?auto_118595 ) ) ( not ( = ?auto_118590 ?auto_118597 ) ) ( not ( = ?auto_118591 ?auto_118592 ) ) ( not ( = ?auto_118591 ?auto_118593 ) ) ( not ( = ?auto_118591 ?auto_118594 ) ) ( not ( = ?auto_118591 ?auto_118595 ) ) ( not ( = ?auto_118591 ?auto_118597 ) ) ( not ( = ?auto_118592 ?auto_118593 ) ) ( not ( = ?auto_118592 ?auto_118594 ) ) ( not ( = ?auto_118592 ?auto_118595 ) ) ( not ( = ?auto_118592 ?auto_118597 ) ) ( not ( = ?auto_118593 ?auto_118594 ) ) ( not ( = ?auto_118593 ?auto_118595 ) ) ( not ( = ?auto_118593 ?auto_118597 ) ) ( not ( = ?auto_118594 ?auto_118595 ) ) ( not ( = ?auto_118594 ?auto_118597 ) ) ( not ( = ?auto_118595 ?auto_118597 ) ) ( not ( = ?auto_118590 ?auto_118596 ) ) ( not ( = ?auto_118591 ?auto_118596 ) ) ( not ( = ?auto_118592 ?auto_118596 ) ) ( not ( = ?auto_118593 ?auto_118596 ) ) ( not ( = ?auto_118594 ?auto_118596 ) ) ( not ( = ?auto_118595 ?auto_118596 ) ) ( not ( = ?auto_118597 ?auto_118596 ) ) ( ON ?auto_118596 ?auto_118597 ) ( CLEAR ?auto_118596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118590 ?auto_118591 ?auto_118592 ?auto_118593 ?auto_118594 ?auto_118595 ?auto_118597 )
      ( MAKE-6PILE ?auto_118590 ?auto_118591 ?auto_118592 ?auto_118593 ?auto_118594 ?auto_118595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118600 - BLOCK
      ?auto_118601 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_118601 ) ( CLEAR ?auto_118600 ) ( ON-TABLE ?auto_118600 ) ( not ( = ?auto_118600 ?auto_118601 ) ) )
    :subtasks
    ( ( !STACK ?auto_118601 ?auto_118600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118602 - BLOCK
      ?auto_118603 - BLOCK
    )
    :vars
    (
      ?auto_118604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118602 ) ( ON-TABLE ?auto_118602 ) ( not ( = ?auto_118602 ?auto_118603 ) ) ( ON ?auto_118603 ?auto_118604 ) ( CLEAR ?auto_118603 ) ( HAND-EMPTY ) ( not ( = ?auto_118602 ?auto_118604 ) ) ( not ( = ?auto_118603 ?auto_118604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118603 ?auto_118604 )
      ( MAKE-2PILE ?auto_118602 ?auto_118603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118605 - BLOCK
      ?auto_118606 - BLOCK
    )
    :vars
    (
      ?auto_118607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118605 ?auto_118606 ) ) ( ON ?auto_118606 ?auto_118607 ) ( CLEAR ?auto_118606 ) ( not ( = ?auto_118605 ?auto_118607 ) ) ( not ( = ?auto_118606 ?auto_118607 ) ) ( HOLDING ?auto_118605 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118605 )
      ( MAKE-2PILE ?auto_118605 ?auto_118606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118608 - BLOCK
      ?auto_118609 - BLOCK
    )
    :vars
    (
      ?auto_118610 - BLOCK
      ?auto_118613 - BLOCK
      ?auto_118614 - BLOCK
      ?auto_118611 - BLOCK
      ?auto_118615 - BLOCK
      ?auto_118612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118608 ?auto_118609 ) ) ( ON ?auto_118609 ?auto_118610 ) ( not ( = ?auto_118608 ?auto_118610 ) ) ( not ( = ?auto_118609 ?auto_118610 ) ) ( ON ?auto_118608 ?auto_118609 ) ( CLEAR ?auto_118608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118613 ) ( ON ?auto_118614 ?auto_118613 ) ( ON ?auto_118611 ?auto_118614 ) ( ON ?auto_118615 ?auto_118611 ) ( ON ?auto_118612 ?auto_118615 ) ( ON ?auto_118610 ?auto_118612 ) ( not ( = ?auto_118613 ?auto_118614 ) ) ( not ( = ?auto_118613 ?auto_118611 ) ) ( not ( = ?auto_118613 ?auto_118615 ) ) ( not ( = ?auto_118613 ?auto_118612 ) ) ( not ( = ?auto_118613 ?auto_118610 ) ) ( not ( = ?auto_118613 ?auto_118609 ) ) ( not ( = ?auto_118613 ?auto_118608 ) ) ( not ( = ?auto_118614 ?auto_118611 ) ) ( not ( = ?auto_118614 ?auto_118615 ) ) ( not ( = ?auto_118614 ?auto_118612 ) ) ( not ( = ?auto_118614 ?auto_118610 ) ) ( not ( = ?auto_118614 ?auto_118609 ) ) ( not ( = ?auto_118614 ?auto_118608 ) ) ( not ( = ?auto_118611 ?auto_118615 ) ) ( not ( = ?auto_118611 ?auto_118612 ) ) ( not ( = ?auto_118611 ?auto_118610 ) ) ( not ( = ?auto_118611 ?auto_118609 ) ) ( not ( = ?auto_118611 ?auto_118608 ) ) ( not ( = ?auto_118615 ?auto_118612 ) ) ( not ( = ?auto_118615 ?auto_118610 ) ) ( not ( = ?auto_118615 ?auto_118609 ) ) ( not ( = ?auto_118615 ?auto_118608 ) ) ( not ( = ?auto_118612 ?auto_118610 ) ) ( not ( = ?auto_118612 ?auto_118609 ) ) ( not ( = ?auto_118612 ?auto_118608 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118613 ?auto_118614 ?auto_118611 ?auto_118615 ?auto_118612 ?auto_118610 ?auto_118609 )
      ( MAKE-2PILE ?auto_118608 ?auto_118609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118621 - BLOCK
      ?auto_118622 - BLOCK
      ?auto_118623 - BLOCK
      ?auto_118624 - BLOCK
      ?auto_118625 - BLOCK
    )
    :vars
    (
      ?auto_118626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118626 ?auto_118625 ) ( CLEAR ?auto_118626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118621 ) ( ON ?auto_118622 ?auto_118621 ) ( ON ?auto_118623 ?auto_118622 ) ( ON ?auto_118624 ?auto_118623 ) ( ON ?auto_118625 ?auto_118624 ) ( not ( = ?auto_118621 ?auto_118622 ) ) ( not ( = ?auto_118621 ?auto_118623 ) ) ( not ( = ?auto_118621 ?auto_118624 ) ) ( not ( = ?auto_118621 ?auto_118625 ) ) ( not ( = ?auto_118621 ?auto_118626 ) ) ( not ( = ?auto_118622 ?auto_118623 ) ) ( not ( = ?auto_118622 ?auto_118624 ) ) ( not ( = ?auto_118622 ?auto_118625 ) ) ( not ( = ?auto_118622 ?auto_118626 ) ) ( not ( = ?auto_118623 ?auto_118624 ) ) ( not ( = ?auto_118623 ?auto_118625 ) ) ( not ( = ?auto_118623 ?auto_118626 ) ) ( not ( = ?auto_118624 ?auto_118625 ) ) ( not ( = ?auto_118624 ?auto_118626 ) ) ( not ( = ?auto_118625 ?auto_118626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118626 ?auto_118625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118627 - BLOCK
      ?auto_118628 - BLOCK
      ?auto_118629 - BLOCK
      ?auto_118630 - BLOCK
      ?auto_118631 - BLOCK
    )
    :vars
    (
      ?auto_118632 - BLOCK
      ?auto_118633 - BLOCK
      ?auto_118634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118632 ?auto_118631 ) ( CLEAR ?auto_118632 ) ( ON-TABLE ?auto_118627 ) ( ON ?auto_118628 ?auto_118627 ) ( ON ?auto_118629 ?auto_118628 ) ( ON ?auto_118630 ?auto_118629 ) ( ON ?auto_118631 ?auto_118630 ) ( not ( = ?auto_118627 ?auto_118628 ) ) ( not ( = ?auto_118627 ?auto_118629 ) ) ( not ( = ?auto_118627 ?auto_118630 ) ) ( not ( = ?auto_118627 ?auto_118631 ) ) ( not ( = ?auto_118627 ?auto_118632 ) ) ( not ( = ?auto_118628 ?auto_118629 ) ) ( not ( = ?auto_118628 ?auto_118630 ) ) ( not ( = ?auto_118628 ?auto_118631 ) ) ( not ( = ?auto_118628 ?auto_118632 ) ) ( not ( = ?auto_118629 ?auto_118630 ) ) ( not ( = ?auto_118629 ?auto_118631 ) ) ( not ( = ?auto_118629 ?auto_118632 ) ) ( not ( = ?auto_118630 ?auto_118631 ) ) ( not ( = ?auto_118630 ?auto_118632 ) ) ( not ( = ?auto_118631 ?auto_118632 ) ) ( HOLDING ?auto_118633 ) ( CLEAR ?auto_118634 ) ( not ( = ?auto_118627 ?auto_118633 ) ) ( not ( = ?auto_118627 ?auto_118634 ) ) ( not ( = ?auto_118628 ?auto_118633 ) ) ( not ( = ?auto_118628 ?auto_118634 ) ) ( not ( = ?auto_118629 ?auto_118633 ) ) ( not ( = ?auto_118629 ?auto_118634 ) ) ( not ( = ?auto_118630 ?auto_118633 ) ) ( not ( = ?auto_118630 ?auto_118634 ) ) ( not ( = ?auto_118631 ?auto_118633 ) ) ( not ( = ?auto_118631 ?auto_118634 ) ) ( not ( = ?auto_118632 ?auto_118633 ) ) ( not ( = ?auto_118632 ?auto_118634 ) ) ( not ( = ?auto_118633 ?auto_118634 ) ) )
    :subtasks
    ( ( !STACK ?auto_118633 ?auto_118634 )
      ( MAKE-5PILE ?auto_118627 ?auto_118628 ?auto_118629 ?auto_118630 ?auto_118631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118635 - BLOCK
      ?auto_118636 - BLOCK
      ?auto_118637 - BLOCK
      ?auto_118638 - BLOCK
      ?auto_118639 - BLOCK
    )
    :vars
    (
      ?auto_118640 - BLOCK
      ?auto_118641 - BLOCK
      ?auto_118642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118640 ?auto_118639 ) ( ON-TABLE ?auto_118635 ) ( ON ?auto_118636 ?auto_118635 ) ( ON ?auto_118637 ?auto_118636 ) ( ON ?auto_118638 ?auto_118637 ) ( ON ?auto_118639 ?auto_118638 ) ( not ( = ?auto_118635 ?auto_118636 ) ) ( not ( = ?auto_118635 ?auto_118637 ) ) ( not ( = ?auto_118635 ?auto_118638 ) ) ( not ( = ?auto_118635 ?auto_118639 ) ) ( not ( = ?auto_118635 ?auto_118640 ) ) ( not ( = ?auto_118636 ?auto_118637 ) ) ( not ( = ?auto_118636 ?auto_118638 ) ) ( not ( = ?auto_118636 ?auto_118639 ) ) ( not ( = ?auto_118636 ?auto_118640 ) ) ( not ( = ?auto_118637 ?auto_118638 ) ) ( not ( = ?auto_118637 ?auto_118639 ) ) ( not ( = ?auto_118637 ?auto_118640 ) ) ( not ( = ?auto_118638 ?auto_118639 ) ) ( not ( = ?auto_118638 ?auto_118640 ) ) ( not ( = ?auto_118639 ?auto_118640 ) ) ( CLEAR ?auto_118641 ) ( not ( = ?auto_118635 ?auto_118642 ) ) ( not ( = ?auto_118635 ?auto_118641 ) ) ( not ( = ?auto_118636 ?auto_118642 ) ) ( not ( = ?auto_118636 ?auto_118641 ) ) ( not ( = ?auto_118637 ?auto_118642 ) ) ( not ( = ?auto_118637 ?auto_118641 ) ) ( not ( = ?auto_118638 ?auto_118642 ) ) ( not ( = ?auto_118638 ?auto_118641 ) ) ( not ( = ?auto_118639 ?auto_118642 ) ) ( not ( = ?auto_118639 ?auto_118641 ) ) ( not ( = ?auto_118640 ?auto_118642 ) ) ( not ( = ?auto_118640 ?auto_118641 ) ) ( not ( = ?auto_118642 ?auto_118641 ) ) ( ON ?auto_118642 ?auto_118640 ) ( CLEAR ?auto_118642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118635 ?auto_118636 ?auto_118637 ?auto_118638 ?auto_118639 ?auto_118640 )
      ( MAKE-5PILE ?auto_118635 ?auto_118636 ?auto_118637 ?auto_118638 ?auto_118639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118643 - BLOCK
      ?auto_118644 - BLOCK
      ?auto_118645 - BLOCK
      ?auto_118646 - BLOCK
      ?auto_118647 - BLOCK
    )
    :vars
    (
      ?auto_118648 - BLOCK
      ?auto_118650 - BLOCK
      ?auto_118649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118648 ?auto_118647 ) ( ON-TABLE ?auto_118643 ) ( ON ?auto_118644 ?auto_118643 ) ( ON ?auto_118645 ?auto_118644 ) ( ON ?auto_118646 ?auto_118645 ) ( ON ?auto_118647 ?auto_118646 ) ( not ( = ?auto_118643 ?auto_118644 ) ) ( not ( = ?auto_118643 ?auto_118645 ) ) ( not ( = ?auto_118643 ?auto_118646 ) ) ( not ( = ?auto_118643 ?auto_118647 ) ) ( not ( = ?auto_118643 ?auto_118648 ) ) ( not ( = ?auto_118644 ?auto_118645 ) ) ( not ( = ?auto_118644 ?auto_118646 ) ) ( not ( = ?auto_118644 ?auto_118647 ) ) ( not ( = ?auto_118644 ?auto_118648 ) ) ( not ( = ?auto_118645 ?auto_118646 ) ) ( not ( = ?auto_118645 ?auto_118647 ) ) ( not ( = ?auto_118645 ?auto_118648 ) ) ( not ( = ?auto_118646 ?auto_118647 ) ) ( not ( = ?auto_118646 ?auto_118648 ) ) ( not ( = ?auto_118647 ?auto_118648 ) ) ( not ( = ?auto_118643 ?auto_118650 ) ) ( not ( = ?auto_118643 ?auto_118649 ) ) ( not ( = ?auto_118644 ?auto_118650 ) ) ( not ( = ?auto_118644 ?auto_118649 ) ) ( not ( = ?auto_118645 ?auto_118650 ) ) ( not ( = ?auto_118645 ?auto_118649 ) ) ( not ( = ?auto_118646 ?auto_118650 ) ) ( not ( = ?auto_118646 ?auto_118649 ) ) ( not ( = ?auto_118647 ?auto_118650 ) ) ( not ( = ?auto_118647 ?auto_118649 ) ) ( not ( = ?auto_118648 ?auto_118650 ) ) ( not ( = ?auto_118648 ?auto_118649 ) ) ( not ( = ?auto_118650 ?auto_118649 ) ) ( ON ?auto_118650 ?auto_118648 ) ( CLEAR ?auto_118650 ) ( HOLDING ?auto_118649 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118649 )
      ( MAKE-5PILE ?auto_118643 ?auto_118644 ?auto_118645 ?auto_118646 ?auto_118647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118651 - BLOCK
      ?auto_118652 - BLOCK
      ?auto_118653 - BLOCK
      ?auto_118654 - BLOCK
      ?auto_118655 - BLOCK
    )
    :vars
    (
      ?auto_118657 - BLOCK
      ?auto_118658 - BLOCK
      ?auto_118656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118657 ?auto_118655 ) ( ON-TABLE ?auto_118651 ) ( ON ?auto_118652 ?auto_118651 ) ( ON ?auto_118653 ?auto_118652 ) ( ON ?auto_118654 ?auto_118653 ) ( ON ?auto_118655 ?auto_118654 ) ( not ( = ?auto_118651 ?auto_118652 ) ) ( not ( = ?auto_118651 ?auto_118653 ) ) ( not ( = ?auto_118651 ?auto_118654 ) ) ( not ( = ?auto_118651 ?auto_118655 ) ) ( not ( = ?auto_118651 ?auto_118657 ) ) ( not ( = ?auto_118652 ?auto_118653 ) ) ( not ( = ?auto_118652 ?auto_118654 ) ) ( not ( = ?auto_118652 ?auto_118655 ) ) ( not ( = ?auto_118652 ?auto_118657 ) ) ( not ( = ?auto_118653 ?auto_118654 ) ) ( not ( = ?auto_118653 ?auto_118655 ) ) ( not ( = ?auto_118653 ?auto_118657 ) ) ( not ( = ?auto_118654 ?auto_118655 ) ) ( not ( = ?auto_118654 ?auto_118657 ) ) ( not ( = ?auto_118655 ?auto_118657 ) ) ( not ( = ?auto_118651 ?auto_118658 ) ) ( not ( = ?auto_118651 ?auto_118656 ) ) ( not ( = ?auto_118652 ?auto_118658 ) ) ( not ( = ?auto_118652 ?auto_118656 ) ) ( not ( = ?auto_118653 ?auto_118658 ) ) ( not ( = ?auto_118653 ?auto_118656 ) ) ( not ( = ?auto_118654 ?auto_118658 ) ) ( not ( = ?auto_118654 ?auto_118656 ) ) ( not ( = ?auto_118655 ?auto_118658 ) ) ( not ( = ?auto_118655 ?auto_118656 ) ) ( not ( = ?auto_118657 ?auto_118658 ) ) ( not ( = ?auto_118657 ?auto_118656 ) ) ( not ( = ?auto_118658 ?auto_118656 ) ) ( ON ?auto_118658 ?auto_118657 ) ( ON ?auto_118656 ?auto_118658 ) ( CLEAR ?auto_118656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118651 ?auto_118652 ?auto_118653 ?auto_118654 ?auto_118655 ?auto_118657 ?auto_118658 )
      ( MAKE-5PILE ?auto_118651 ?auto_118652 ?auto_118653 ?auto_118654 ?auto_118655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118662 - BLOCK
      ?auto_118663 - BLOCK
      ?auto_118664 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_118664 ) ( CLEAR ?auto_118663 ) ( ON-TABLE ?auto_118662 ) ( ON ?auto_118663 ?auto_118662 ) ( not ( = ?auto_118662 ?auto_118663 ) ) ( not ( = ?auto_118662 ?auto_118664 ) ) ( not ( = ?auto_118663 ?auto_118664 ) ) )
    :subtasks
    ( ( !STACK ?auto_118664 ?auto_118663 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118665 - BLOCK
      ?auto_118666 - BLOCK
      ?auto_118667 - BLOCK
    )
    :vars
    (
      ?auto_118668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118666 ) ( ON-TABLE ?auto_118665 ) ( ON ?auto_118666 ?auto_118665 ) ( not ( = ?auto_118665 ?auto_118666 ) ) ( not ( = ?auto_118665 ?auto_118667 ) ) ( not ( = ?auto_118666 ?auto_118667 ) ) ( ON ?auto_118667 ?auto_118668 ) ( CLEAR ?auto_118667 ) ( HAND-EMPTY ) ( not ( = ?auto_118665 ?auto_118668 ) ) ( not ( = ?auto_118666 ?auto_118668 ) ) ( not ( = ?auto_118667 ?auto_118668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118667 ?auto_118668 )
      ( MAKE-3PILE ?auto_118665 ?auto_118666 ?auto_118667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118669 - BLOCK
      ?auto_118670 - BLOCK
      ?auto_118671 - BLOCK
    )
    :vars
    (
      ?auto_118672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118669 ) ( not ( = ?auto_118669 ?auto_118670 ) ) ( not ( = ?auto_118669 ?auto_118671 ) ) ( not ( = ?auto_118670 ?auto_118671 ) ) ( ON ?auto_118671 ?auto_118672 ) ( CLEAR ?auto_118671 ) ( not ( = ?auto_118669 ?auto_118672 ) ) ( not ( = ?auto_118670 ?auto_118672 ) ) ( not ( = ?auto_118671 ?auto_118672 ) ) ( HOLDING ?auto_118670 ) ( CLEAR ?auto_118669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118669 ?auto_118670 )
      ( MAKE-3PILE ?auto_118669 ?auto_118670 ?auto_118671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118673 - BLOCK
      ?auto_118674 - BLOCK
      ?auto_118675 - BLOCK
    )
    :vars
    (
      ?auto_118676 - BLOCK
      ?auto_118679 - BLOCK
      ?auto_118677 - BLOCK
      ?auto_118680 - BLOCK
      ?auto_118678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118673 ) ( not ( = ?auto_118673 ?auto_118674 ) ) ( not ( = ?auto_118673 ?auto_118675 ) ) ( not ( = ?auto_118674 ?auto_118675 ) ) ( ON ?auto_118675 ?auto_118676 ) ( not ( = ?auto_118673 ?auto_118676 ) ) ( not ( = ?auto_118674 ?auto_118676 ) ) ( not ( = ?auto_118675 ?auto_118676 ) ) ( CLEAR ?auto_118673 ) ( ON ?auto_118674 ?auto_118675 ) ( CLEAR ?auto_118674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118679 ) ( ON ?auto_118677 ?auto_118679 ) ( ON ?auto_118680 ?auto_118677 ) ( ON ?auto_118678 ?auto_118680 ) ( ON ?auto_118676 ?auto_118678 ) ( not ( = ?auto_118679 ?auto_118677 ) ) ( not ( = ?auto_118679 ?auto_118680 ) ) ( not ( = ?auto_118679 ?auto_118678 ) ) ( not ( = ?auto_118679 ?auto_118676 ) ) ( not ( = ?auto_118679 ?auto_118675 ) ) ( not ( = ?auto_118679 ?auto_118674 ) ) ( not ( = ?auto_118677 ?auto_118680 ) ) ( not ( = ?auto_118677 ?auto_118678 ) ) ( not ( = ?auto_118677 ?auto_118676 ) ) ( not ( = ?auto_118677 ?auto_118675 ) ) ( not ( = ?auto_118677 ?auto_118674 ) ) ( not ( = ?auto_118680 ?auto_118678 ) ) ( not ( = ?auto_118680 ?auto_118676 ) ) ( not ( = ?auto_118680 ?auto_118675 ) ) ( not ( = ?auto_118680 ?auto_118674 ) ) ( not ( = ?auto_118678 ?auto_118676 ) ) ( not ( = ?auto_118678 ?auto_118675 ) ) ( not ( = ?auto_118678 ?auto_118674 ) ) ( not ( = ?auto_118673 ?auto_118679 ) ) ( not ( = ?auto_118673 ?auto_118677 ) ) ( not ( = ?auto_118673 ?auto_118680 ) ) ( not ( = ?auto_118673 ?auto_118678 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118679 ?auto_118677 ?auto_118680 ?auto_118678 ?auto_118676 ?auto_118675 )
      ( MAKE-3PILE ?auto_118673 ?auto_118674 ?auto_118675 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118681 - BLOCK
      ?auto_118682 - BLOCK
      ?auto_118683 - BLOCK
    )
    :vars
    (
      ?auto_118687 - BLOCK
      ?auto_118686 - BLOCK
      ?auto_118684 - BLOCK
      ?auto_118685 - BLOCK
      ?auto_118688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118681 ?auto_118682 ) ) ( not ( = ?auto_118681 ?auto_118683 ) ) ( not ( = ?auto_118682 ?auto_118683 ) ) ( ON ?auto_118683 ?auto_118687 ) ( not ( = ?auto_118681 ?auto_118687 ) ) ( not ( = ?auto_118682 ?auto_118687 ) ) ( not ( = ?auto_118683 ?auto_118687 ) ) ( ON ?auto_118682 ?auto_118683 ) ( CLEAR ?auto_118682 ) ( ON-TABLE ?auto_118686 ) ( ON ?auto_118684 ?auto_118686 ) ( ON ?auto_118685 ?auto_118684 ) ( ON ?auto_118688 ?auto_118685 ) ( ON ?auto_118687 ?auto_118688 ) ( not ( = ?auto_118686 ?auto_118684 ) ) ( not ( = ?auto_118686 ?auto_118685 ) ) ( not ( = ?auto_118686 ?auto_118688 ) ) ( not ( = ?auto_118686 ?auto_118687 ) ) ( not ( = ?auto_118686 ?auto_118683 ) ) ( not ( = ?auto_118686 ?auto_118682 ) ) ( not ( = ?auto_118684 ?auto_118685 ) ) ( not ( = ?auto_118684 ?auto_118688 ) ) ( not ( = ?auto_118684 ?auto_118687 ) ) ( not ( = ?auto_118684 ?auto_118683 ) ) ( not ( = ?auto_118684 ?auto_118682 ) ) ( not ( = ?auto_118685 ?auto_118688 ) ) ( not ( = ?auto_118685 ?auto_118687 ) ) ( not ( = ?auto_118685 ?auto_118683 ) ) ( not ( = ?auto_118685 ?auto_118682 ) ) ( not ( = ?auto_118688 ?auto_118687 ) ) ( not ( = ?auto_118688 ?auto_118683 ) ) ( not ( = ?auto_118688 ?auto_118682 ) ) ( not ( = ?auto_118681 ?auto_118686 ) ) ( not ( = ?auto_118681 ?auto_118684 ) ) ( not ( = ?auto_118681 ?auto_118685 ) ) ( not ( = ?auto_118681 ?auto_118688 ) ) ( HOLDING ?auto_118681 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118681 )
      ( MAKE-3PILE ?auto_118681 ?auto_118682 ?auto_118683 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118689 - BLOCK
      ?auto_118690 - BLOCK
      ?auto_118691 - BLOCK
    )
    :vars
    (
      ?auto_118692 - BLOCK
      ?auto_118696 - BLOCK
      ?auto_118693 - BLOCK
      ?auto_118695 - BLOCK
      ?auto_118694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118689 ?auto_118690 ) ) ( not ( = ?auto_118689 ?auto_118691 ) ) ( not ( = ?auto_118690 ?auto_118691 ) ) ( ON ?auto_118691 ?auto_118692 ) ( not ( = ?auto_118689 ?auto_118692 ) ) ( not ( = ?auto_118690 ?auto_118692 ) ) ( not ( = ?auto_118691 ?auto_118692 ) ) ( ON ?auto_118690 ?auto_118691 ) ( ON-TABLE ?auto_118696 ) ( ON ?auto_118693 ?auto_118696 ) ( ON ?auto_118695 ?auto_118693 ) ( ON ?auto_118694 ?auto_118695 ) ( ON ?auto_118692 ?auto_118694 ) ( not ( = ?auto_118696 ?auto_118693 ) ) ( not ( = ?auto_118696 ?auto_118695 ) ) ( not ( = ?auto_118696 ?auto_118694 ) ) ( not ( = ?auto_118696 ?auto_118692 ) ) ( not ( = ?auto_118696 ?auto_118691 ) ) ( not ( = ?auto_118696 ?auto_118690 ) ) ( not ( = ?auto_118693 ?auto_118695 ) ) ( not ( = ?auto_118693 ?auto_118694 ) ) ( not ( = ?auto_118693 ?auto_118692 ) ) ( not ( = ?auto_118693 ?auto_118691 ) ) ( not ( = ?auto_118693 ?auto_118690 ) ) ( not ( = ?auto_118695 ?auto_118694 ) ) ( not ( = ?auto_118695 ?auto_118692 ) ) ( not ( = ?auto_118695 ?auto_118691 ) ) ( not ( = ?auto_118695 ?auto_118690 ) ) ( not ( = ?auto_118694 ?auto_118692 ) ) ( not ( = ?auto_118694 ?auto_118691 ) ) ( not ( = ?auto_118694 ?auto_118690 ) ) ( not ( = ?auto_118689 ?auto_118696 ) ) ( not ( = ?auto_118689 ?auto_118693 ) ) ( not ( = ?auto_118689 ?auto_118695 ) ) ( not ( = ?auto_118689 ?auto_118694 ) ) ( ON ?auto_118689 ?auto_118690 ) ( CLEAR ?auto_118689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118696 ?auto_118693 ?auto_118695 ?auto_118694 ?auto_118692 ?auto_118691 ?auto_118690 )
      ( MAKE-3PILE ?auto_118689 ?auto_118690 ?auto_118691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118701 - BLOCK
      ?auto_118702 - BLOCK
      ?auto_118703 - BLOCK
      ?auto_118704 - BLOCK
    )
    :vars
    (
      ?auto_118705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118705 ?auto_118704 ) ( CLEAR ?auto_118705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118701 ) ( ON ?auto_118702 ?auto_118701 ) ( ON ?auto_118703 ?auto_118702 ) ( ON ?auto_118704 ?auto_118703 ) ( not ( = ?auto_118701 ?auto_118702 ) ) ( not ( = ?auto_118701 ?auto_118703 ) ) ( not ( = ?auto_118701 ?auto_118704 ) ) ( not ( = ?auto_118701 ?auto_118705 ) ) ( not ( = ?auto_118702 ?auto_118703 ) ) ( not ( = ?auto_118702 ?auto_118704 ) ) ( not ( = ?auto_118702 ?auto_118705 ) ) ( not ( = ?auto_118703 ?auto_118704 ) ) ( not ( = ?auto_118703 ?auto_118705 ) ) ( not ( = ?auto_118704 ?auto_118705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118705 ?auto_118704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118706 - BLOCK
      ?auto_118707 - BLOCK
      ?auto_118708 - BLOCK
      ?auto_118709 - BLOCK
    )
    :vars
    (
      ?auto_118710 - BLOCK
      ?auto_118711 - BLOCK
      ?auto_118712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118710 ?auto_118709 ) ( CLEAR ?auto_118710 ) ( ON-TABLE ?auto_118706 ) ( ON ?auto_118707 ?auto_118706 ) ( ON ?auto_118708 ?auto_118707 ) ( ON ?auto_118709 ?auto_118708 ) ( not ( = ?auto_118706 ?auto_118707 ) ) ( not ( = ?auto_118706 ?auto_118708 ) ) ( not ( = ?auto_118706 ?auto_118709 ) ) ( not ( = ?auto_118706 ?auto_118710 ) ) ( not ( = ?auto_118707 ?auto_118708 ) ) ( not ( = ?auto_118707 ?auto_118709 ) ) ( not ( = ?auto_118707 ?auto_118710 ) ) ( not ( = ?auto_118708 ?auto_118709 ) ) ( not ( = ?auto_118708 ?auto_118710 ) ) ( not ( = ?auto_118709 ?auto_118710 ) ) ( HOLDING ?auto_118711 ) ( CLEAR ?auto_118712 ) ( not ( = ?auto_118706 ?auto_118711 ) ) ( not ( = ?auto_118706 ?auto_118712 ) ) ( not ( = ?auto_118707 ?auto_118711 ) ) ( not ( = ?auto_118707 ?auto_118712 ) ) ( not ( = ?auto_118708 ?auto_118711 ) ) ( not ( = ?auto_118708 ?auto_118712 ) ) ( not ( = ?auto_118709 ?auto_118711 ) ) ( not ( = ?auto_118709 ?auto_118712 ) ) ( not ( = ?auto_118710 ?auto_118711 ) ) ( not ( = ?auto_118710 ?auto_118712 ) ) ( not ( = ?auto_118711 ?auto_118712 ) ) )
    :subtasks
    ( ( !STACK ?auto_118711 ?auto_118712 )
      ( MAKE-4PILE ?auto_118706 ?auto_118707 ?auto_118708 ?auto_118709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118713 - BLOCK
      ?auto_118714 - BLOCK
      ?auto_118715 - BLOCK
      ?auto_118716 - BLOCK
    )
    :vars
    (
      ?auto_118718 - BLOCK
      ?auto_118717 - BLOCK
      ?auto_118719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118718 ?auto_118716 ) ( ON-TABLE ?auto_118713 ) ( ON ?auto_118714 ?auto_118713 ) ( ON ?auto_118715 ?auto_118714 ) ( ON ?auto_118716 ?auto_118715 ) ( not ( = ?auto_118713 ?auto_118714 ) ) ( not ( = ?auto_118713 ?auto_118715 ) ) ( not ( = ?auto_118713 ?auto_118716 ) ) ( not ( = ?auto_118713 ?auto_118718 ) ) ( not ( = ?auto_118714 ?auto_118715 ) ) ( not ( = ?auto_118714 ?auto_118716 ) ) ( not ( = ?auto_118714 ?auto_118718 ) ) ( not ( = ?auto_118715 ?auto_118716 ) ) ( not ( = ?auto_118715 ?auto_118718 ) ) ( not ( = ?auto_118716 ?auto_118718 ) ) ( CLEAR ?auto_118717 ) ( not ( = ?auto_118713 ?auto_118719 ) ) ( not ( = ?auto_118713 ?auto_118717 ) ) ( not ( = ?auto_118714 ?auto_118719 ) ) ( not ( = ?auto_118714 ?auto_118717 ) ) ( not ( = ?auto_118715 ?auto_118719 ) ) ( not ( = ?auto_118715 ?auto_118717 ) ) ( not ( = ?auto_118716 ?auto_118719 ) ) ( not ( = ?auto_118716 ?auto_118717 ) ) ( not ( = ?auto_118718 ?auto_118719 ) ) ( not ( = ?auto_118718 ?auto_118717 ) ) ( not ( = ?auto_118719 ?auto_118717 ) ) ( ON ?auto_118719 ?auto_118718 ) ( CLEAR ?auto_118719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118713 ?auto_118714 ?auto_118715 ?auto_118716 ?auto_118718 )
      ( MAKE-4PILE ?auto_118713 ?auto_118714 ?auto_118715 ?auto_118716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118720 - BLOCK
      ?auto_118721 - BLOCK
      ?auto_118722 - BLOCK
      ?auto_118723 - BLOCK
    )
    :vars
    (
      ?auto_118726 - BLOCK
      ?auto_118724 - BLOCK
      ?auto_118725 - BLOCK
      ?auto_118727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118726 ?auto_118723 ) ( ON-TABLE ?auto_118720 ) ( ON ?auto_118721 ?auto_118720 ) ( ON ?auto_118722 ?auto_118721 ) ( ON ?auto_118723 ?auto_118722 ) ( not ( = ?auto_118720 ?auto_118721 ) ) ( not ( = ?auto_118720 ?auto_118722 ) ) ( not ( = ?auto_118720 ?auto_118723 ) ) ( not ( = ?auto_118720 ?auto_118726 ) ) ( not ( = ?auto_118721 ?auto_118722 ) ) ( not ( = ?auto_118721 ?auto_118723 ) ) ( not ( = ?auto_118721 ?auto_118726 ) ) ( not ( = ?auto_118722 ?auto_118723 ) ) ( not ( = ?auto_118722 ?auto_118726 ) ) ( not ( = ?auto_118723 ?auto_118726 ) ) ( not ( = ?auto_118720 ?auto_118724 ) ) ( not ( = ?auto_118720 ?auto_118725 ) ) ( not ( = ?auto_118721 ?auto_118724 ) ) ( not ( = ?auto_118721 ?auto_118725 ) ) ( not ( = ?auto_118722 ?auto_118724 ) ) ( not ( = ?auto_118722 ?auto_118725 ) ) ( not ( = ?auto_118723 ?auto_118724 ) ) ( not ( = ?auto_118723 ?auto_118725 ) ) ( not ( = ?auto_118726 ?auto_118724 ) ) ( not ( = ?auto_118726 ?auto_118725 ) ) ( not ( = ?auto_118724 ?auto_118725 ) ) ( ON ?auto_118724 ?auto_118726 ) ( CLEAR ?auto_118724 ) ( HOLDING ?auto_118725 ) ( CLEAR ?auto_118727 ) ( ON-TABLE ?auto_118727 ) ( not ( = ?auto_118727 ?auto_118725 ) ) ( not ( = ?auto_118720 ?auto_118727 ) ) ( not ( = ?auto_118721 ?auto_118727 ) ) ( not ( = ?auto_118722 ?auto_118727 ) ) ( not ( = ?auto_118723 ?auto_118727 ) ) ( not ( = ?auto_118726 ?auto_118727 ) ) ( not ( = ?auto_118724 ?auto_118727 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118727 ?auto_118725 )
      ( MAKE-4PILE ?auto_118720 ?auto_118721 ?auto_118722 ?auto_118723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118728 - BLOCK
      ?auto_118729 - BLOCK
      ?auto_118730 - BLOCK
      ?auto_118731 - BLOCK
    )
    :vars
    (
      ?auto_118735 - BLOCK
      ?auto_118732 - BLOCK
      ?auto_118734 - BLOCK
      ?auto_118733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118735 ?auto_118731 ) ( ON-TABLE ?auto_118728 ) ( ON ?auto_118729 ?auto_118728 ) ( ON ?auto_118730 ?auto_118729 ) ( ON ?auto_118731 ?auto_118730 ) ( not ( = ?auto_118728 ?auto_118729 ) ) ( not ( = ?auto_118728 ?auto_118730 ) ) ( not ( = ?auto_118728 ?auto_118731 ) ) ( not ( = ?auto_118728 ?auto_118735 ) ) ( not ( = ?auto_118729 ?auto_118730 ) ) ( not ( = ?auto_118729 ?auto_118731 ) ) ( not ( = ?auto_118729 ?auto_118735 ) ) ( not ( = ?auto_118730 ?auto_118731 ) ) ( not ( = ?auto_118730 ?auto_118735 ) ) ( not ( = ?auto_118731 ?auto_118735 ) ) ( not ( = ?auto_118728 ?auto_118732 ) ) ( not ( = ?auto_118728 ?auto_118734 ) ) ( not ( = ?auto_118729 ?auto_118732 ) ) ( not ( = ?auto_118729 ?auto_118734 ) ) ( not ( = ?auto_118730 ?auto_118732 ) ) ( not ( = ?auto_118730 ?auto_118734 ) ) ( not ( = ?auto_118731 ?auto_118732 ) ) ( not ( = ?auto_118731 ?auto_118734 ) ) ( not ( = ?auto_118735 ?auto_118732 ) ) ( not ( = ?auto_118735 ?auto_118734 ) ) ( not ( = ?auto_118732 ?auto_118734 ) ) ( ON ?auto_118732 ?auto_118735 ) ( CLEAR ?auto_118733 ) ( ON-TABLE ?auto_118733 ) ( not ( = ?auto_118733 ?auto_118734 ) ) ( not ( = ?auto_118728 ?auto_118733 ) ) ( not ( = ?auto_118729 ?auto_118733 ) ) ( not ( = ?auto_118730 ?auto_118733 ) ) ( not ( = ?auto_118731 ?auto_118733 ) ) ( not ( = ?auto_118735 ?auto_118733 ) ) ( not ( = ?auto_118732 ?auto_118733 ) ) ( ON ?auto_118734 ?auto_118732 ) ( CLEAR ?auto_118734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118728 ?auto_118729 ?auto_118730 ?auto_118731 ?auto_118735 ?auto_118732 )
      ( MAKE-4PILE ?auto_118728 ?auto_118729 ?auto_118730 ?auto_118731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118736 - BLOCK
      ?auto_118737 - BLOCK
      ?auto_118738 - BLOCK
      ?auto_118739 - BLOCK
    )
    :vars
    (
      ?auto_118741 - BLOCK
      ?auto_118743 - BLOCK
      ?auto_118742 - BLOCK
      ?auto_118740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118741 ?auto_118739 ) ( ON-TABLE ?auto_118736 ) ( ON ?auto_118737 ?auto_118736 ) ( ON ?auto_118738 ?auto_118737 ) ( ON ?auto_118739 ?auto_118738 ) ( not ( = ?auto_118736 ?auto_118737 ) ) ( not ( = ?auto_118736 ?auto_118738 ) ) ( not ( = ?auto_118736 ?auto_118739 ) ) ( not ( = ?auto_118736 ?auto_118741 ) ) ( not ( = ?auto_118737 ?auto_118738 ) ) ( not ( = ?auto_118737 ?auto_118739 ) ) ( not ( = ?auto_118737 ?auto_118741 ) ) ( not ( = ?auto_118738 ?auto_118739 ) ) ( not ( = ?auto_118738 ?auto_118741 ) ) ( not ( = ?auto_118739 ?auto_118741 ) ) ( not ( = ?auto_118736 ?auto_118743 ) ) ( not ( = ?auto_118736 ?auto_118742 ) ) ( not ( = ?auto_118737 ?auto_118743 ) ) ( not ( = ?auto_118737 ?auto_118742 ) ) ( not ( = ?auto_118738 ?auto_118743 ) ) ( not ( = ?auto_118738 ?auto_118742 ) ) ( not ( = ?auto_118739 ?auto_118743 ) ) ( not ( = ?auto_118739 ?auto_118742 ) ) ( not ( = ?auto_118741 ?auto_118743 ) ) ( not ( = ?auto_118741 ?auto_118742 ) ) ( not ( = ?auto_118743 ?auto_118742 ) ) ( ON ?auto_118743 ?auto_118741 ) ( not ( = ?auto_118740 ?auto_118742 ) ) ( not ( = ?auto_118736 ?auto_118740 ) ) ( not ( = ?auto_118737 ?auto_118740 ) ) ( not ( = ?auto_118738 ?auto_118740 ) ) ( not ( = ?auto_118739 ?auto_118740 ) ) ( not ( = ?auto_118741 ?auto_118740 ) ) ( not ( = ?auto_118743 ?auto_118740 ) ) ( ON ?auto_118742 ?auto_118743 ) ( CLEAR ?auto_118742 ) ( HOLDING ?auto_118740 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118740 )
      ( MAKE-4PILE ?auto_118736 ?auto_118737 ?auto_118738 ?auto_118739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118744 - BLOCK
      ?auto_118745 - BLOCK
      ?auto_118746 - BLOCK
      ?auto_118747 - BLOCK
    )
    :vars
    (
      ?auto_118750 - BLOCK
      ?auto_118748 - BLOCK
      ?auto_118749 - BLOCK
      ?auto_118751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118750 ?auto_118747 ) ( ON-TABLE ?auto_118744 ) ( ON ?auto_118745 ?auto_118744 ) ( ON ?auto_118746 ?auto_118745 ) ( ON ?auto_118747 ?auto_118746 ) ( not ( = ?auto_118744 ?auto_118745 ) ) ( not ( = ?auto_118744 ?auto_118746 ) ) ( not ( = ?auto_118744 ?auto_118747 ) ) ( not ( = ?auto_118744 ?auto_118750 ) ) ( not ( = ?auto_118745 ?auto_118746 ) ) ( not ( = ?auto_118745 ?auto_118747 ) ) ( not ( = ?auto_118745 ?auto_118750 ) ) ( not ( = ?auto_118746 ?auto_118747 ) ) ( not ( = ?auto_118746 ?auto_118750 ) ) ( not ( = ?auto_118747 ?auto_118750 ) ) ( not ( = ?auto_118744 ?auto_118748 ) ) ( not ( = ?auto_118744 ?auto_118749 ) ) ( not ( = ?auto_118745 ?auto_118748 ) ) ( not ( = ?auto_118745 ?auto_118749 ) ) ( not ( = ?auto_118746 ?auto_118748 ) ) ( not ( = ?auto_118746 ?auto_118749 ) ) ( not ( = ?auto_118747 ?auto_118748 ) ) ( not ( = ?auto_118747 ?auto_118749 ) ) ( not ( = ?auto_118750 ?auto_118748 ) ) ( not ( = ?auto_118750 ?auto_118749 ) ) ( not ( = ?auto_118748 ?auto_118749 ) ) ( ON ?auto_118748 ?auto_118750 ) ( not ( = ?auto_118751 ?auto_118749 ) ) ( not ( = ?auto_118744 ?auto_118751 ) ) ( not ( = ?auto_118745 ?auto_118751 ) ) ( not ( = ?auto_118746 ?auto_118751 ) ) ( not ( = ?auto_118747 ?auto_118751 ) ) ( not ( = ?auto_118750 ?auto_118751 ) ) ( not ( = ?auto_118748 ?auto_118751 ) ) ( ON ?auto_118749 ?auto_118748 ) ( ON ?auto_118751 ?auto_118749 ) ( CLEAR ?auto_118751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118744 ?auto_118745 ?auto_118746 ?auto_118747 ?auto_118750 ?auto_118748 ?auto_118749 )
      ( MAKE-4PILE ?auto_118744 ?auto_118745 ?auto_118746 ?auto_118747 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118756 - BLOCK
      ?auto_118757 - BLOCK
      ?auto_118758 - BLOCK
      ?auto_118759 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_118759 ) ( CLEAR ?auto_118758 ) ( ON-TABLE ?auto_118756 ) ( ON ?auto_118757 ?auto_118756 ) ( ON ?auto_118758 ?auto_118757 ) ( not ( = ?auto_118756 ?auto_118757 ) ) ( not ( = ?auto_118756 ?auto_118758 ) ) ( not ( = ?auto_118756 ?auto_118759 ) ) ( not ( = ?auto_118757 ?auto_118758 ) ) ( not ( = ?auto_118757 ?auto_118759 ) ) ( not ( = ?auto_118758 ?auto_118759 ) ) )
    :subtasks
    ( ( !STACK ?auto_118759 ?auto_118758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118760 - BLOCK
      ?auto_118761 - BLOCK
      ?auto_118762 - BLOCK
      ?auto_118763 - BLOCK
    )
    :vars
    (
      ?auto_118764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118762 ) ( ON-TABLE ?auto_118760 ) ( ON ?auto_118761 ?auto_118760 ) ( ON ?auto_118762 ?auto_118761 ) ( not ( = ?auto_118760 ?auto_118761 ) ) ( not ( = ?auto_118760 ?auto_118762 ) ) ( not ( = ?auto_118760 ?auto_118763 ) ) ( not ( = ?auto_118761 ?auto_118762 ) ) ( not ( = ?auto_118761 ?auto_118763 ) ) ( not ( = ?auto_118762 ?auto_118763 ) ) ( ON ?auto_118763 ?auto_118764 ) ( CLEAR ?auto_118763 ) ( HAND-EMPTY ) ( not ( = ?auto_118760 ?auto_118764 ) ) ( not ( = ?auto_118761 ?auto_118764 ) ) ( not ( = ?auto_118762 ?auto_118764 ) ) ( not ( = ?auto_118763 ?auto_118764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118763 ?auto_118764 )
      ( MAKE-4PILE ?auto_118760 ?auto_118761 ?auto_118762 ?auto_118763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118765 - BLOCK
      ?auto_118766 - BLOCK
      ?auto_118767 - BLOCK
      ?auto_118768 - BLOCK
    )
    :vars
    (
      ?auto_118769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118765 ) ( ON ?auto_118766 ?auto_118765 ) ( not ( = ?auto_118765 ?auto_118766 ) ) ( not ( = ?auto_118765 ?auto_118767 ) ) ( not ( = ?auto_118765 ?auto_118768 ) ) ( not ( = ?auto_118766 ?auto_118767 ) ) ( not ( = ?auto_118766 ?auto_118768 ) ) ( not ( = ?auto_118767 ?auto_118768 ) ) ( ON ?auto_118768 ?auto_118769 ) ( CLEAR ?auto_118768 ) ( not ( = ?auto_118765 ?auto_118769 ) ) ( not ( = ?auto_118766 ?auto_118769 ) ) ( not ( = ?auto_118767 ?auto_118769 ) ) ( not ( = ?auto_118768 ?auto_118769 ) ) ( HOLDING ?auto_118767 ) ( CLEAR ?auto_118766 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118765 ?auto_118766 ?auto_118767 )
      ( MAKE-4PILE ?auto_118765 ?auto_118766 ?auto_118767 ?auto_118768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118770 - BLOCK
      ?auto_118771 - BLOCK
      ?auto_118772 - BLOCK
      ?auto_118773 - BLOCK
    )
    :vars
    (
      ?auto_118774 - BLOCK
      ?auto_118777 - BLOCK
      ?auto_118776 - BLOCK
      ?auto_118775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118770 ) ( ON ?auto_118771 ?auto_118770 ) ( not ( = ?auto_118770 ?auto_118771 ) ) ( not ( = ?auto_118770 ?auto_118772 ) ) ( not ( = ?auto_118770 ?auto_118773 ) ) ( not ( = ?auto_118771 ?auto_118772 ) ) ( not ( = ?auto_118771 ?auto_118773 ) ) ( not ( = ?auto_118772 ?auto_118773 ) ) ( ON ?auto_118773 ?auto_118774 ) ( not ( = ?auto_118770 ?auto_118774 ) ) ( not ( = ?auto_118771 ?auto_118774 ) ) ( not ( = ?auto_118772 ?auto_118774 ) ) ( not ( = ?auto_118773 ?auto_118774 ) ) ( CLEAR ?auto_118771 ) ( ON ?auto_118772 ?auto_118773 ) ( CLEAR ?auto_118772 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118777 ) ( ON ?auto_118776 ?auto_118777 ) ( ON ?auto_118775 ?auto_118776 ) ( ON ?auto_118774 ?auto_118775 ) ( not ( = ?auto_118777 ?auto_118776 ) ) ( not ( = ?auto_118777 ?auto_118775 ) ) ( not ( = ?auto_118777 ?auto_118774 ) ) ( not ( = ?auto_118777 ?auto_118773 ) ) ( not ( = ?auto_118777 ?auto_118772 ) ) ( not ( = ?auto_118776 ?auto_118775 ) ) ( not ( = ?auto_118776 ?auto_118774 ) ) ( not ( = ?auto_118776 ?auto_118773 ) ) ( not ( = ?auto_118776 ?auto_118772 ) ) ( not ( = ?auto_118775 ?auto_118774 ) ) ( not ( = ?auto_118775 ?auto_118773 ) ) ( not ( = ?auto_118775 ?auto_118772 ) ) ( not ( = ?auto_118770 ?auto_118777 ) ) ( not ( = ?auto_118770 ?auto_118776 ) ) ( not ( = ?auto_118770 ?auto_118775 ) ) ( not ( = ?auto_118771 ?auto_118777 ) ) ( not ( = ?auto_118771 ?auto_118776 ) ) ( not ( = ?auto_118771 ?auto_118775 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118777 ?auto_118776 ?auto_118775 ?auto_118774 ?auto_118773 )
      ( MAKE-4PILE ?auto_118770 ?auto_118771 ?auto_118772 ?auto_118773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118778 - BLOCK
      ?auto_118779 - BLOCK
      ?auto_118780 - BLOCK
      ?auto_118781 - BLOCK
    )
    :vars
    (
      ?auto_118783 - BLOCK
      ?auto_118782 - BLOCK
      ?auto_118784 - BLOCK
      ?auto_118785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118778 ) ( not ( = ?auto_118778 ?auto_118779 ) ) ( not ( = ?auto_118778 ?auto_118780 ) ) ( not ( = ?auto_118778 ?auto_118781 ) ) ( not ( = ?auto_118779 ?auto_118780 ) ) ( not ( = ?auto_118779 ?auto_118781 ) ) ( not ( = ?auto_118780 ?auto_118781 ) ) ( ON ?auto_118781 ?auto_118783 ) ( not ( = ?auto_118778 ?auto_118783 ) ) ( not ( = ?auto_118779 ?auto_118783 ) ) ( not ( = ?auto_118780 ?auto_118783 ) ) ( not ( = ?auto_118781 ?auto_118783 ) ) ( ON ?auto_118780 ?auto_118781 ) ( CLEAR ?auto_118780 ) ( ON-TABLE ?auto_118782 ) ( ON ?auto_118784 ?auto_118782 ) ( ON ?auto_118785 ?auto_118784 ) ( ON ?auto_118783 ?auto_118785 ) ( not ( = ?auto_118782 ?auto_118784 ) ) ( not ( = ?auto_118782 ?auto_118785 ) ) ( not ( = ?auto_118782 ?auto_118783 ) ) ( not ( = ?auto_118782 ?auto_118781 ) ) ( not ( = ?auto_118782 ?auto_118780 ) ) ( not ( = ?auto_118784 ?auto_118785 ) ) ( not ( = ?auto_118784 ?auto_118783 ) ) ( not ( = ?auto_118784 ?auto_118781 ) ) ( not ( = ?auto_118784 ?auto_118780 ) ) ( not ( = ?auto_118785 ?auto_118783 ) ) ( not ( = ?auto_118785 ?auto_118781 ) ) ( not ( = ?auto_118785 ?auto_118780 ) ) ( not ( = ?auto_118778 ?auto_118782 ) ) ( not ( = ?auto_118778 ?auto_118784 ) ) ( not ( = ?auto_118778 ?auto_118785 ) ) ( not ( = ?auto_118779 ?auto_118782 ) ) ( not ( = ?auto_118779 ?auto_118784 ) ) ( not ( = ?auto_118779 ?auto_118785 ) ) ( HOLDING ?auto_118779 ) ( CLEAR ?auto_118778 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118778 ?auto_118779 )
      ( MAKE-4PILE ?auto_118778 ?auto_118779 ?auto_118780 ?auto_118781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118786 - BLOCK
      ?auto_118787 - BLOCK
      ?auto_118788 - BLOCK
      ?auto_118789 - BLOCK
    )
    :vars
    (
      ?auto_118792 - BLOCK
      ?auto_118790 - BLOCK
      ?auto_118793 - BLOCK
      ?auto_118791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118786 ) ( not ( = ?auto_118786 ?auto_118787 ) ) ( not ( = ?auto_118786 ?auto_118788 ) ) ( not ( = ?auto_118786 ?auto_118789 ) ) ( not ( = ?auto_118787 ?auto_118788 ) ) ( not ( = ?auto_118787 ?auto_118789 ) ) ( not ( = ?auto_118788 ?auto_118789 ) ) ( ON ?auto_118789 ?auto_118792 ) ( not ( = ?auto_118786 ?auto_118792 ) ) ( not ( = ?auto_118787 ?auto_118792 ) ) ( not ( = ?auto_118788 ?auto_118792 ) ) ( not ( = ?auto_118789 ?auto_118792 ) ) ( ON ?auto_118788 ?auto_118789 ) ( ON-TABLE ?auto_118790 ) ( ON ?auto_118793 ?auto_118790 ) ( ON ?auto_118791 ?auto_118793 ) ( ON ?auto_118792 ?auto_118791 ) ( not ( = ?auto_118790 ?auto_118793 ) ) ( not ( = ?auto_118790 ?auto_118791 ) ) ( not ( = ?auto_118790 ?auto_118792 ) ) ( not ( = ?auto_118790 ?auto_118789 ) ) ( not ( = ?auto_118790 ?auto_118788 ) ) ( not ( = ?auto_118793 ?auto_118791 ) ) ( not ( = ?auto_118793 ?auto_118792 ) ) ( not ( = ?auto_118793 ?auto_118789 ) ) ( not ( = ?auto_118793 ?auto_118788 ) ) ( not ( = ?auto_118791 ?auto_118792 ) ) ( not ( = ?auto_118791 ?auto_118789 ) ) ( not ( = ?auto_118791 ?auto_118788 ) ) ( not ( = ?auto_118786 ?auto_118790 ) ) ( not ( = ?auto_118786 ?auto_118793 ) ) ( not ( = ?auto_118786 ?auto_118791 ) ) ( not ( = ?auto_118787 ?auto_118790 ) ) ( not ( = ?auto_118787 ?auto_118793 ) ) ( not ( = ?auto_118787 ?auto_118791 ) ) ( CLEAR ?auto_118786 ) ( ON ?auto_118787 ?auto_118788 ) ( CLEAR ?auto_118787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118790 ?auto_118793 ?auto_118791 ?auto_118792 ?auto_118789 ?auto_118788 )
      ( MAKE-4PILE ?auto_118786 ?auto_118787 ?auto_118788 ?auto_118789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118794 - BLOCK
      ?auto_118795 - BLOCK
      ?auto_118796 - BLOCK
      ?auto_118797 - BLOCK
    )
    :vars
    (
      ?auto_118799 - BLOCK
      ?auto_118801 - BLOCK
      ?auto_118800 - BLOCK
      ?auto_118798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118794 ?auto_118795 ) ) ( not ( = ?auto_118794 ?auto_118796 ) ) ( not ( = ?auto_118794 ?auto_118797 ) ) ( not ( = ?auto_118795 ?auto_118796 ) ) ( not ( = ?auto_118795 ?auto_118797 ) ) ( not ( = ?auto_118796 ?auto_118797 ) ) ( ON ?auto_118797 ?auto_118799 ) ( not ( = ?auto_118794 ?auto_118799 ) ) ( not ( = ?auto_118795 ?auto_118799 ) ) ( not ( = ?auto_118796 ?auto_118799 ) ) ( not ( = ?auto_118797 ?auto_118799 ) ) ( ON ?auto_118796 ?auto_118797 ) ( ON-TABLE ?auto_118801 ) ( ON ?auto_118800 ?auto_118801 ) ( ON ?auto_118798 ?auto_118800 ) ( ON ?auto_118799 ?auto_118798 ) ( not ( = ?auto_118801 ?auto_118800 ) ) ( not ( = ?auto_118801 ?auto_118798 ) ) ( not ( = ?auto_118801 ?auto_118799 ) ) ( not ( = ?auto_118801 ?auto_118797 ) ) ( not ( = ?auto_118801 ?auto_118796 ) ) ( not ( = ?auto_118800 ?auto_118798 ) ) ( not ( = ?auto_118800 ?auto_118799 ) ) ( not ( = ?auto_118800 ?auto_118797 ) ) ( not ( = ?auto_118800 ?auto_118796 ) ) ( not ( = ?auto_118798 ?auto_118799 ) ) ( not ( = ?auto_118798 ?auto_118797 ) ) ( not ( = ?auto_118798 ?auto_118796 ) ) ( not ( = ?auto_118794 ?auto_118801 ) ) ( not ( = ?auto_118794 ?auto_118800 ) ) ( not ( = ?auto_118794 ?auto_118798 ) ) ( not ( = ?auto_118795 ?auto_118801 ) ) ( not ( = ?auto_118795 ?auto_118800 ) ) ( not ( = ?auto_118795 ?auto_118798 ) ) ( ON ?auto_118795 ?auto_118796 ) ( CLEAR ?auto_118795 ) ( HOLDING ?auto_118794 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118794 )
      ( MAKE-4PILE ?auto_118794 ?auto_118795 ?auto_118796 ?auto_118797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_118802 - BLOCK
      ?auto_118803 - BLOCK
      ?auto_118804 - BLOCK
      ?auto_118805 - BLOCK
    )
    :vars
    (
      ?auto_118807 - BLOCK
      ?auto_118809 - BLOCK
      ?auto_118806 - BLOCK
      ?auto_118808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118802 ?auto_118803 ) ) ( not ( = ?auto_118802 ?auto_118804 ) ) ( not ( = ?auto_118802 ?auto_118805 ) ) ( not ( = ?auto_118803 ?auto_118804 ) ) ( not ( = ?auto_118803 ?auto_118805 ) ) ( not ( = ?auto_118804 ?auto_118805 ) ) ( ON ?auto_118805 ?auto_118807 ) ( not ( = ?auto_118802 ?auto_118807 ) ) ( not ( = ?auto_118803 ?auto_118807 ) ) ( not ( = ?auto_118804 ?auto_118807 ) ) ( not ( = ?auto_118805 ?auto_118807 ) ) ( ON ?auto_118804 ?auto_118805 ) ( ON-TABLE ?auto_118809 ) ( ON ?auto_118806 ?auto_118809 ) ( ON ?auto_118808 ?auto_118806 ) ( ON ?auto_118807 ?auto_118808 ) ( not ( = ?auto_118809 ?auto_118806 ) ) ( not ( = ?auto_118809 ?auto_118808 ) ) ( not ( = ?auto_118809 ?auto_118807 ) ) ( not ( = ?auto_118809 ?auto_118805 ) ) ( not ( = ?auto_118809 ?auto_118804 ) ) ( not ( = ?auto_118806 ?auto_118808 ) ) ( not ( = ?auto_118806 ?auto_118807 ) ) ( not ( = ?auto_118806 ?auto_118805 ) ) ( not ( = ?auto_118806 ?auto_118804 ) ) ( not ( = ?auto_118808 ?auto_118807 ) ) ( not ( = ?auto_118808 ?auto_118805 ) ) ( not ( = ?auto_118808 ?auto_118804 ) ) ( not ( = ?auto_118802 ?auto_118809 ) ) ( not ( = ?auto_118802 ?auto_118806 ) ) ( not ( = ?auto_118802 ?auto_118808 ) ) ( not ( = ?auto_118803 ?auto_118809 ) ) ( not ( = ?auto_118803 ?auto_118806 ) ) ( not ( = ?auto_118803 ?auto_118808 ) ) ( ON ?auto_118803 ?auto_118804 ) ( ON ?auto_118802 ?auto_118803 ) ( CLEAR ?auto_118802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118809 ?auto_118806 ?auto_118808 ?auto_118807 ?auto_118805 ?auto_118804 ?auto_118803 )
      ( MAKE-4PILE ?auto_118802 ?auto_118803 ?auto_118804 ?auto_118805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118813 - BLOCK
      ?auto_118814 - BLOCK
      ?auto_118815 - BLOCK
    )
    :vars
    (
      ?auto_118816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118816 ?auto_118815 ) ( CLEAR ?auto_118816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118813 ) ( ON ?auto_118814 ?auto_118813 ) ( ON ?auto_118815 ?auto_118814 ) ( not ( = ?auto_118813 ?auto_118814 ) ) ( not ( = ?auto_118813 ?auto_118815 ) ) ( not ( = ?auto_118813 ?auto_118816 ) ) ( not ( = ?auto_118814 ?auto_118815 ) ) ( not ( = ?auto_118814 ?auto_118816 ) ) ( not ( = ?auto_118815 ?auto_118816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118816 ?auto_118815 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118817 - BLOCK
      ?auto_118818 - BLOCK
      ?auto_118819 - BLOCK
    )
    :vars
    (
      ?auto_118820 - BLOCK
      ?auto_118821 - BLOCK
      ?auto_118822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118820 ?auto_118819 ) ( CLEAR ?auto_118820 ) ( ON-TABLE ?auto_118817 ) ( ON ?auto_118818 ?auto_118817 ) ( ON ?auto_118819 ?auto_118818 ) ( not ( = ?auto_118817 ?auto_118818 ) ) ( not ( = ?auto_118817 ?auto_118819 ) ) ( not ( = ?auto_118817 ?auto_118820 ) ) ( not ( = ?auto_118818 ?auto_118819 ) ) ( not ( = ?auto_118818 ?auto_118820 ) ) ( not ( = ?auto_118819 ?auto_118820 ) ) ( HOLDING ?auto_118821 ) ( CLEAR ?auto_118822 ) ( not ( = ?auto_118817 ?auto_118821 ) ) ( not ( = ?auto_118817 ?auto_118822 ) ) ( not ( = ?auto_118818 ?auto_118821 ) ) ( not ( = ?auto_118818 ?auto_118822 ) ) ( not ( = ?auto_118819 ?auto_118821 ) ) ( not ( = ?auto_118819 ?auto_118822 ) ) ( not ( = ?auto_118820 ?auto_118821 ) ) ( not ( = ?auto_118820 ?auto_118822 ) ) ( not ( = ?auto_118821 ?auto_118822 ) ) )
    :subtasks
    ( ( !STACK ?auto_118821 ?auto_118822 )
      ( MAKE-3PILE ?auto_118817 ?auto_118818 ?auto_118819 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118823 - BLOCK
      ?auto_118824 - BLOCK
      ?auto_118825 - BLOCK
    )
    :vars
    (
      ?auto_118827 - BLOCK
      ?auto_118828 - BLOCK
      ?auto_118826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118827 ?auto_118825 ) ( ON-TABLE ?auto_118823 ) ( ON ?auto_118824 ?auto_118823 ) ( ON ?auto_118825 ?auto_118824 ) ( not ( = ?auto_118823 ?auto_118824 ) ) ( not ( = ?auto_118823 ?auto_118825 ) ) ( not ( = ?auto_118823 ?auto_118827 ) ) ( not ( = ?auto_118824 ?auto_118825 ) ) ( not ( = ?auto_118824 ?auto_118827 ) ) ( not ( = ?auto_118825 ?auto_118827 ) ) ( CLEAR ?auto_118828 ) ( not ( = ?auto_118823 ?auto_118826 ) ) ( not ( = ?auto_118823 ?auto_118828 ) ) ( not ( = ?auto_118824 ?auto_118826 ) ) ( not ( = ?auto_118824 ?auto_118828 ) ) ( not ( = ?auto_118825 ?auto_118826 ) ) ( not ( = ?auto_118825 ?auto_118828 ) ) ( not ( = ?auto_118827 ?auto_118826 ) ) ( not ( = ?auto_118827 ?auto_118828 ) ) ( not ( = ?auto_118826 ?auto_118828 ) ) ( ON ?auto_118826 ?auto_118827 ) ( CLEAR ?auto_118826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118823 ?auto_118824 ?auto_118825 ?auto_118827 )
      ( MAKE-3PILE ?auto_118823 ?auto_118824 ?auto_118825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118829 - BLOCK
      ?auto_118830 - BLOCK
      ?auto_118831 - BLOCK
    )
    :vars
    (
      ?auto_118834 - BLOCK
      ?auto_118833 - BLOCK
      ?auto_118832 - BLOCK
      ?auto_118835 - BLOCK
      ?auto_118836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118834 ?auto_118831 ) ( ON-TABLE ?auto_118829 ) ( ON ?auto_118830 ?auto_118829 ) ( ON ?auto_118831 ?auto_118830 ) ( not ( = ?auto_118829 ?auto_118830 ) ) ( not ( = ?auto_118829 ?auto_118831 ) ) ( not ( = ?auto_118829 ?auto_118834 ) ) ( not ( = ?auto_118830 ?auto_118831 ) ) ( not ( = ?auto_118830 ?auto_118834 ) ) ( not ( = ?auto_118831 ?auto_118834 ) ) ( not ( = ?auto_118829 ?auto_118833 ) ) ( not ( = ?auto_118829 ?auto_118832 ) ) ( not ( = ?auto_118830 ?auto_118833 ) ) ( not ( = ?auto_118830 ?auto_118832 ) ) ( not ( = ?auto_118831 ?auto_118833 ) ) ( not ( = ?auto_118831 ?auto_118832 ) ) ( not ( = ?auto_118834 ?auto_118833 ) ) ( not ( = ?auto_118834 ?auto_118832 ) ) ( not ( = ?auto_118833 ?auto_118832 ) ) ( ON ?auto_118833 ?auto_118834 ) ( CLEAR ?auto_118833 ) ( HOLDING ?auto_118832 ) ( CLEAR ?auto_118835 ) ( ON-TABLE ?auto_118836 ) ( ON ?auto_118835 ?auto_118836 ) ( not ( = ?auto_118836 ?auto_118835 ) ) ( not ( = ?auto_118836 ?auto_118832 ) ) ( not ( = ?auto_118835 ?auto_118832 ) ) ( not ( = ?auto_118829 ?auto_118835 ) ) ( not ( = ?auto_118829 ?auto_118836 ) ) ( not ( = ?auto_118830 ?auto_118835 ) ) ( not ( = ?auto_118830 ?auto_118836 ) ) ( not ( = ?auto_118831 ?auto_118835 ) ) ( not ( = ?auto_118831 ?auto_118836 ) ) ( not ( = ?auto_118834 ?auto_118835 ) ) ( not ( = ?auto_118834 ?auto_118836 ) ) ( not ( = ?auto_118833 ?auto_118835 ) ) ( not ( = ?auto_118833 ?auto_118836 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118836 ?auto_118835 ?auto_118832 )
      ( MAKE-3PILE ?auto_118829 ?auto_118830 ?auto_118831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118837 - BLOCK
      ?auto_118838 - BLOCK
      ?auto_118839 - BLOCK
    )
    :vars
    (
      ?auto_118840 - BLOCK
      ?auto_118842 - BLOCK
      ?auto_118841 - BLOCK
      ?auto_118844 - BLOCK
      ?auto_118843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118840 ?auto_118839 ) ( ON-TABLE ?auto_118837 ) ( ON ?auto_118838 ?auto_118837 ) ( ON ?auto_118839 ?auto_118838 ) ( not ( = ?auto_118837 ?auto_118838 ) ) ( not ( = ?auto_118837 ?auto_118839 ) ) ( not ( = ?auto_118837 ?auto_118840 ) ) ( not ( = ?auto_118838 ?auto_118839 ) ) ( not ( = ?auto_118838 ?auto_118840 ) ) ( not ( = ?auto_118839 ?auto_118840 ) ) ( not ( = ?auto_118837 ?auto_118842 ) ) ( not ( = ?auto_118837 ?auto_118841 ) ) ( not ( = ?auto_118838 ?auto_118842 ) ) ( not ( = ?auto_118838 ?auto_118841 ) ) ( not ( = ?auto_118839 ?auto_118842 ) ) ( not ( = ?auto_118839 ?auto_118841 ) ) ( not ( = ?auto_118840 ?auto_118842 ) ) ( not ( = ?auto_118840 ?auto_118841 ) ) ( not ( = ?auto_118842 ?auto_118841 ) ) ( ON ?auto_118842 ?auto_118840 ) ( CLEAR ?auto_118844 ) ( ON-TABLE ?auto_118843 ) ( ON ?auto_118844 ?auto_118843 ) ( not ( = ?auto_118843 ?auto_118844 ) ) ( not ( = ?auto_118843 ?auto_118841 ) ) ( not ( = ?auto_118844 ?auto_118841 ) ) ( not ( = ?auto_118837 ?auto_118844 ) ) ( not ( = ?auto_118837 ?auto_118843 ) ) ( not ( = ?auto_118838 ?auto_118844 ) ) ( not ( = ?auto_118838 ?auto_118843 ) ) ( not ( = ?auto_118839 ?auto_118844 ) ) ( not ( = ?auto_118839 ?auto_118843 ) ) ( not ( = ?auto_118840 ?auto_118844 ) ) ( not ( = ?auto_118840 ?auto_118843 ) ) ( not ( = ?auto_118842 ?auto_118844 ) ) ( not ( = ?auto_118842 ?auto_118843 ) ) ( ON ?auto_118841 ?auto_118842 ) ( CLEAR ?auto_118841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118837 ?auto_118838 ?auto_118839 ?auto_118840 ?auto_118842 )
      ( MAKE-3PILE ?auto_118837 ?auto_118838 ?auto_118839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118845 - BLOCK
      ?auto_118846 - BLOCK
      ?auto_118847 - BLOCK
    )
    :vars
    (
      ?auto_118850 - BLOCK
      ?auto_118851 - BLOCK
      ?auto_118852 - BLOCK
      ?auto_118849 - BLOCK
      ?auto_118848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118850 ?auto_118847 ) ( ON-TABLE ?auto_118845 ) ( ON ?auto_118846 ?auto_118845 ) ( ON ?auto_118847 ?auto_118846 ) ( not ( = ?auto_118845 ?auto_118846 ) ) ( not ( = ?auto_118845 ?auto_118847 ) ) ( not ( = ?auto_118845 ?auto_118850 ) ) ( not ( = ?auto_118846 ?auto_118847 ) ) ( not ( = ?auto_118846 ?auto_118850 ) ) ( not ( = ?auto_118847 ?auto_118850 ) ) ( not ( = ?auto_118845 ?auto_118851 ) ) ( not ( = ?auto_118845 ?auto_118852 ) ) ( not ( = ?auto_118846 ?auto_118851 ) ) ( not ( = ?auto_118846 ?auto_118852 ) ) ( not ( = ?auto_118847 ?auto_118851 ) ) ( not ( = ?auto_118847 ?auto_118852 ) ) ( not ( = ?auto_118850 ?auto_118851 ) ) ( not ( = ?auto_118850 ?auto_118852 ) ) ( not ( = ?auto_118851 ?auto_118852 ) ) ( ON ?auto_118851 ?auto_118850 ) ( ON-TABLE ?auto_118849 ) ( not ( = ?auto_118849 ?auto_118848 ) ) ( not ( = ?auto_118849 ?auto_118852 ) ) ( not ( = ?auto_118848 ?auto_118852 ) ) ( not ( = ?auto_118845 ?auto_118848 ) ) ( not ( = ?auto_118845 ?auto_118849 ) ) ( not ( = ?auto_118846 ?auto_118848 ) ) ( not ( = ?auto_118846 ?auto_118849 ) ) ( not ( = ?auto_118847 ?auto_118848 ) ) ( not ( = ?auto_118847 ?auto_118849 ) ) ( not ( = ?auto_118850 ?auto_118848 ) ) ( not ( = ?auto_118850 ?auto_118849 ) ) ( not ( = ?auto_118851 ?auto_118848 ) ) ( not ( = ?auto_118851 ?auto_118849 ) ) ( ON ?auto_118852 ?auto_118851 ) ( CLEAR ?auto_118852 ) ( HOLDING ?auto_118848 ) ( CLEAR ?auto_118849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118849 ?auto_118848 )
      ( MAKE-3PILE ?auto_118845 ?auto_118846 ?auto_118847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118853 - BLOCK
      ?auto_118854 - BLOCK
      ?auto_118855 - BLOCK
    )
    :vars
    (
      ?auto_118859 - BLOCK
      ?auto_118858 - BLOCK
      ?auto_118856 - BLOCK
      ?auto_118860 - BLOCK
      ?auto_118857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118859 ?auto_118855 ) ( ON-TABLE ?auto_118853 ) ( ON ?auto_118854 ?auto_118853 ) ( ON ?auto_118855 ?auto_118854 ) ( not ( = ?auto_118853 ?auto_118854 ) ) ( not ( = ?auto_118853 ?auto_118855 ) ) ( not ( = ?auto_118853 ?auto_118859 ) ) ( not ( = ?auto_118854 ?auto_118855 ) ) ( not ( = ?auto_118854 ?auto_118859 ) ) ( not ( = ?auto_118855 ?auto_118859 ) ) ( not ( = ?auto_118853 ?auto_118858 ) ) ( not ( = ?auto_118853 ?auto_118856 ) ) ( not ( = ?auto_118854 ?auto_118858 ) ) ( not ( = ?auto_118854 ?auto_118856 ) ) ( not ( = ?auto_118855 ?auto_118858 ) ) ( not ( = ?auto_118855 ?auto_118856 ) ) ( not ( = ?auto_118859 ?auto_118858 ) ) ( not ( = ?auto_118859 ?auto_118856 ) ) ( not ( = ?auto_118858 ?auto_118856 ) ) ( ON ?auto_118858 ?auto_118859 ) ( ON-TABLE ?auto_118860 ) ( not ( = ?auto_118860 ?auto_118857 ) ) ( not ( = ?auto_118860 ?auto_118856 ) ) ( not ( = ?auto_118857 ?auto_118856 ) ) ( not ( = ?auto_118853 ?auto_118857 ) ) ( not ( = ?auto_118853 ?auto_118860 ) ) ( not ( = ?auto_118854 ?auto_118857 ) ) ( not ( = ?auto_118854 ?auto_118860 ) ) ( not ( = ?auto_118855 ?auto_118857 ) ) ( not ( = ?auto_118855 ?auto_118860 ) ) ( not ( = ?auto_118859 ?auto_118857 ) ) ( not ( = ?auto_118859 ?auto_118860 ) ) ( not ( = ?auto_118858 ?auto_118857 ) ) ( not ( = ?auto_118858 ?auto_118860 ) ) ( ON ?auto_118856 ?auto_118858 ) ( CLEAR ?auto_118860 ) ( ON ?auto_118857 ?auto_118856 ) ( CLEAR ?auto_118857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118853 ?auto_118854 ?auto_118855 ?auto_118859 ?auto_118858 ?auto_118856 )
      ( MAKE-3PILE ?auto_118853 ?auto_118854 ?auto_118855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118861 - BLOCK
      ?auto_118862 - BLOCK
      ?auto_118863 - BLOCK
    )
    :vars
    (
      ?auto_118867 - BLOCK
      ?auto_118866 - BLOCK
      ?auto_118868 - BLOCK
      ?auto_118864 - BLOCK
      ?auto_118865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118867 ?auto_118863 ) ( ON-TABLE ?auto_118861 ) ( ON ?auto_118862 ?auto_118861 ) ( ON ?auto_118863 ?auto_118862 ) ( not ( = ?auto_118861 ?auto_118862 ) ) ( not ( = ?auto_118861 ?auto_118863 ) ) ( not ( = ?auto_118861 ?auto_118867 ) ) ( not ( = ?auto_118862 ?auto_118863 ) ) ( not ( = ?auto_118862 ?auto_118867 ) ) ( not ( = ?auto_118863 ?auto_118867 ) ) ( not ( = ?auto_118861 ?auto_118866 ) ) ( not ( = ?auto_118861 ?auto_118868 ) ) ( not ( = ?auto_118862 ?auto_118866 ) ) ( not ( = ?auto_118862 ?auto_118868 ) ) ( not ( = ?auto_118863 ?auto_118866 ) ) ( not ( = ?auto_118863 ?auto_118868 ) ) ( not ( = ?auto_118867 ?auto_118866 ) ) ( not ( = ?auto_118867 ?auto_118868 ) ) ( not ( = ?auto_118866 ?auto_118868 ) ) ( ON ?auto_118866 ?auto_118867 ) ( not ( = ?auto_118864 ?auto_118865 ) ) ( not ( = ?auto_118864 ?auto_118868 ) ) ( not ( = ?auto_118865 ?auto_118868 ) ) ( not ( = ?auto_118861 ?auto_118865 ) ) ( not ( = ?auto_118861 ?auto_118864 ) ) ( not ( = ?auto_118862 ?auto_118865 ) ) ( not ( = ?auto_118862 ?auto_118864 ) ) ( not ( = ?auto_118863 ?auto_118865 ) ) ( not ( = ?auto_118863 ?auto_118864 ) ) ( not ( = ?auto_118867 ?auto_118865 ) ) ( not ( = ?auto_118867 ?auto_118864 ) ) ( not ( = ?auto_118866 ?auto_118865 ) ) ( not ( = ?auto_118866 ?auto_118864 ) ) ( ON ?auto_118868 ?auto_118866 ) ( ON ?auto_118865 ?auto_118868 ) ( CLEAR ?auto_118865 ) ( HOLDING ?auto_118864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118864 )
      ( MAKE-3PILE ?auto_118861 ?auto_118862 ?auto_118863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_118869 - BLOCK
      ?auto_118870 - BLOCK
      ?auto_118871 - BLOCK
    )
    :vars
    (
      ?auto_118875 - BLOCK
      ?auto_118872 - BLOCK
      ?auto_118876 - BLOCK
      ?auto_118873 - BLOCK
      ?auto_118874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118875 ?auto_118871 ) ( ON-TABLE ?auto_118869 ) ( ON ?auto_118870 ?auto_118869 ) ( ON ?auto_118871 ?auto_118870 ) ( not ( = ?auto_118869 ?auto_118870 ) ) ( not ( = ?auto_118869 ?auto_118871 ) ) ( not ( = ?auto_118869 ?auto_118875 ) ) ( not ( = ?auto_118870 ?auto_118871 ) ) ( not ( = ?auto_118870 ?auto_118875 ) ) ( not ( = ?auto_118871 ?auto_118875 ) ) ( not ( = ?auto_118869 ?auto_118872 ) ) ( not ( = ?auto_118869 ?auto_118876 ) ) ( not ( = ?auto_118870 ?auto_118872 ) ) ( not ( = ?auto_118870 ?auto_118876 ) ) ( not ( = ?auto_118871 ?auto_118872 ) ) ( not ( = ?auto_118871 ?auto_118876 ) ) ( not ( = ?auto_118875 ?auto_118872 ) ) ( not ( = ?auto_118875 ?auto_118876 ) ) ( not ( = ?auto_118872 ?auto_118876 ) ) ( ON ?auto_118872 ?auto_118875 ) ( not ( = ?auto_118873 ?auto_118874 ) ) ( not ( = ?auto_118873 ?auto_118876 ) ) ( not ( = ?auto_118874 ?auto_118876 ) ) ( not ( = ?auto_118869 ?auto_118874 ) ) ( not ( = ?auto_118869 ?auto_118873 ) ) ( not ( = ?auto_118870 ?auto_118874 ) ) ( not ( = ?auto_118870 ?auto_118873 ) ) ( not ( = ?auto_118871 ?auto_118874 ) ) ( not ( = ?auto_118871 ?auto_118873 ) ) ( not ( = ?auto_118875 ?auto_118874 ) ) ( not ( = ?auto_118875 ?auto_118873 ) ) ( not ( = ?auto_118872 ?auto_118874 ) ) ( not ( = ?auto_118872 ?auto_118873 ) ) ( ON ?auto_118876 ?auto_118872 ) ( ON ?auto_118874 ?auto_118876 ) ( ON ?auto_118873 ?auto_118874 ) ( CLEAR ?auto_118873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118869 ?auto_118870 ?auto_118871 ?auto_118875 ?auto_118872 ?auto_118876 ?auto_118874 )
      ( MAKE-3PILE ?auto_118869 ?auto_118870 ?auto_118871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118882 - BLOCK
      ?auto_118883 - BLOCK
      ?auto_118884 - BLOCK
      ?auto_118885 - BLOCK
      ?auto_118886 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_118886 ) ( CLEAR ?auto_118885 ) ( ON-TABLE ?auto_118882 ) ( ON ?auto_118883 ?auto_118882 ) ( ON ?auto_118884 ?auto_118883 ) ( ON ?auto_118885 ?auto_118884 ) ( not ( = ?auto_118882 ?auto_118883 ) ) ( not ( = ?auto_118882 ?auto_118884 ) ) ( not ( = ?auto_118882 ?auto_118885 ) ) ( not ( = ?auto_118882 ?auto_118886 ) ) ( not ( = ?auto_118883 ?auto_118884 ) ) ( not ( = ?auto_118883 ?auto_118885 ) ) ( not ( = ?auto_118883 ?auto_118886 ) ) ( not ( = ?auto_118884 ?auto_118885 ) ) ( not ( = ?auto_118884 ?auto_118886 ) ) ( not ( = ?auto_118885 ?auto_118886 ) ) )
    :subtasks
    ( ( !STACK ?auto_118886 ?auto_118885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118887 - BLOCK
      ?auto_118888 - BLOCK
      ?auto_118889 - BLOCK
      ?auto_118890 - BLOCK
      ?auto_118891 - BLOCK
    )
    :vars
    (
      ?auto_118892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118890 ) ( ON-TABLE ?auto_118887 ) ( ON ?auto_118888 ?auto_118887 ) ( ON ?auto_118889 ?auto_118888 ) ( ON ?auto_118890 ?auto_118889 ) ( not ( = ?auto_118887 ?auto_118888 ) ) ( not ( = ?auto_118887 ?auto_118889 ) ) ( not ( = ?auto_118887 ?auto_118890 ) ) ( not ( = ?auto_118887 ?auto_118891 ) ) ( not ( = ?auto_118888 ?auto_118889 ) ) ( not ( = ?auto_118888 ?auto_118890 ) ) ( not ( = ?auto_118888 ?auto_118891 ) ) ( not ( = ?auto_118889 ?auto_118890 ) ) ( not ( = ?auto_118889 ?auto_118891 ) ) ( not ( = ?auto_118890 ?auto_118891 ) ) ( ON ?auto_118891 ?auto_118892 ) ( CLEAR ?auto_118891 ) ( HAND-EMPTY ) ( not ( = ?auto_118887 ?auto_118892 ) ) ( not ( = ?auto_118888 ?auto_118892 ) ) ( not ( = ?auto_118889 ?auto_118892 ) ) ( not ( = ?auto_118890 ?auto_118892 ) ) ( not ( = ?auto_118891 ?auto_118892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118891 ?auto_118892 )
      ( MAKE-5PILE ?auto_118887 ?auto_118888 ?auto_118889 ?auto_118890 ?auto_118891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118893 - BLOCK
      ?auto_118894 - BLOCK
      ?auto_118895 - BLOCK
      ?auto_118896 - BLOCK
      ?auto_118897 - BLOCK
    )
    :vars
    (
      ?auto_118898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118893 ) ( ON ?auto_118894 ?auto_118893 ) ( ON ?auto_118895 ?auto_118894 ) ( not ( = ?auto_118893 ?auto_118894 ) ) ( not ( = ?auto_118893 ?auto_118895 ) ) ( not ( = ?auto_118893 ?auto_118896 ) ) ( not ( = ?auto_118893 ?auto_118897 ) ) ( not ( = ?auto_118894 ?auto_118895 ) ) ( not ( = ?auto_118894 ?auto_118896 ) ) ( not ( = ?auto_118894 ?auto_118897 ) ) ( not ( = ?auto_118895 ?auto_118896 ) ) ( not ( = ?auto_118895 ?auto_118897 ) ) ( not ( = ?auto_118896 ?auto_118897 ) ) ( ON ?auto_118897 ?auto_118898 ) ( CLEAR ?auto_118897 ) ( not ( = ?auto_118893 ?auto_118898 ) ) ( not ( = ?auto_118894 ?auto_118898 ) ) ( not ( = ?auto_118895 ?auto_118898 ) ) ( not ( = ?auto_118896 ?auto_118898 ) ) ( not ( = ?auto_118897 ?auto_118898 ) ) ( HOLDING ?auto_118896 ) ( CLEAR ?auto_118895 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118893 ?auto_118894 ?auto_118895 ?auto_118896 )
      ( MAKE-5PILE ?auto_118893 ?auto_118894 ?auto_118895 ?auto_118896 ?auto_118897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118899 - BLOCK
      ?auto_118900 - BLOCK
      ?auto_118901 - BLOCK
      ?auto_118902 - BLOCK
      ?auto_118903 - BLOCK
    )
    :vars
    (
      ?auto_118904 - BLOCK
      ?auto_118905 - BLOCK
      ?auto_118906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118899 ) ( ON ?auto_118900 ?auto_118899 ) ( ON ?auto_118901 ?auto_118900 ) ( not ( = ?auto_118899 ?auto_118900 ) ) ( not ( = ?auto_118899 ?auto_118901 ) ) ( not ( = ?auto_118899 ?auto_118902 ) ) ( not ( = ?auto_118899 ?auto_118903 ) ) ( not ( = ?auto_118900 ?auto_118901 ) ) ( not ( = ?auto_118900 ?auto_118902 ) ) ( not ( = ?auto_118900 ?auto_118903 ) ) ( not ( = ?auto_118901 ?auto_118902 ) ) ( not ( = ?auto_118901 ?auto_118903 ) ) ( not ( = ?auto_118902 ?auto_118903 ) ) ( ON ?auto_118903 ?auto_118904 ) ( not ( = ?auto_118899 ?auto_118904 ) ) ( not ( = ?auto_118900 ?auto_118904 ) ) ( not ( = ?auto_118901 ?auto_118904 ) ) ( not ( = ?auto_118902 ?auto_118904 ) ) ( not ( = ?auto_118903 ?auto_118904 ) ) ( CLEAR ?auto_118901 ) ( ON ?auto_118902 ?auto_118903 ) ( CLEAR ?auto_118902 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118905 ) ( ON ?auto_118906 ?auto_118905 ) ( ON ?auto_118904 ?auto_118906 ) ( not ( = ?auto_118905 ?auto_118906 ) ) ( not ( = ?auto_118905 ?auto_118904 ) ) ( not ( = ?auto_118905 ?auto_118903 ) ) ( not ( = ?auto_118905 ?auto_118902 ) ) ( not ( = ?auto_118906 ?auto_118904 ) ) ( not ( = ?auto_118906 ?auto_118903 ) ) ( not ( = ?auto_118906 ?auto_118902 ) ) ( not ( = ?auto_118899 ?auto_118905 ) ) ( not ( = ?auto_118899 ?auto_118906 ) ) ( not ( = ?auto_118900 ?auto_118905 ) ) ( not ( = ?auto_118900 ?auto_118906 ) ) ( not ( = ?auto_118901 ?auto_118905 ) ) ( not ( = ?auto_118901 ?auto_118906 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118905 ?auto_118906 ?auto_118904 ?auto_118903 )
      ( MAKE-5PILE ?auto_118899 ?auto_118900 ?auto_118901 ?auto_118902 ?auto_118903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118907 - BLOCK
      ?auto_118908 - BLOCK
      ?auto_118909 - BLOCK
      ?auto_118910 - BLOCK
      ?auto_118911 - BLOCK
    )
    :vars
    (
      ?auto_118912 - BLOCK
      ?auto_118913 - BLOCK
      ?auto_118914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118907 ) ( ON ?auto_118908 ?auto_118907 ) ( not ( = ?auto_118907 ?auto_118908 ) ) ( not ( = ?auto_118907 ?auto_118909 ) ) ( not ( = ?auto_118907 ?auto_118910 ) ) ( not ( = ?auto_118907 ?auto_118911 ) ) ( not ( = ?auto_118908 ?auto_118909 ) ) ( not ( = ?auto_118908 ?auto_118910 ) ) ( not ( = ?auto_118908 ?auto_118911 ) ) ( not ( = ?auto_118909 ?auto_118910 ) ) ( not ( = ?auto_118909 ?auto_118911 ) ) ( not ( = ?auto_118910 ?auto_118911 ) ) ( ON ?auto_118911 ?auto_118912 ) ( not ( = ?auto_118907 ?auto_118912 ) ) ( not ( = ?auto_118908 ?auto_118912 ) ) ( not ( = ?auto_118909 ?auto_118912 ) ) ( not ( = ?auto_118910 ?auto_118912 ) ) ( not ( = ?auto_118911 ?auto_118912 ) ) ( ON ?auto_118910 ?auto_118911 ) ( CLEAR ?auto_118910 ) ( ON-TABLE ?auto_118913 ) ( ON ?auto_118914 ?auto_118913 ) ( ON ?auto_118912 ?auto_118914 ) ( not ( = ?auto_118913 ?auto_118914 ) ) ( not ( = ?auto_118913 ?auto_118912 ) ) ( not ( = ?auto_118913 ?auto_118911 ) ) ( not ( = ?auto_118913 ?auto_118910 ) ) ( not ( = ?auto_118914 ?auto_118912 ) ) ( not ( = ?auto_118914 ?auto_118911 ) ) ( not ( = ?auto_118914 ?auto_118910 ) ) ( not ( = ?auto_118907 ?auto_118913 ) ) ( not ( = ?auto_118907 ?auto_118914 ) ) ( not ( = ?auto_118908 ?auto_118913 ) ) ( not ( = ?auto_118908 ?auto_118914 ) ) ( not ( = ?auto_118909 ?auto_118913 ) ) ( not ( = ?auto_118909 ?auto_118914 ) ) ( HOLDING ?auto_118909 ) ( CLEAR ?auto_118908 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118907 ?auto_118908 ?auto_118909 )
      ( MAKE-5PILE ?auto_118907 ?auto_118908 ?auto_118909 ?auto_118910 ?auto_118911 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118915 - BLOCK
      ?auto_118916 - BLOCK
      ?auto_118917 - BLOCK
      ?auto_118918 - BLOCK
      ?auto_118919 - BLOCK
    )
    :vars
    (
      ?auto_118920 - BLOCK
      ?auto_118922 - BLOCK
      ?auto_118921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118915 ) ( ON ?auto_118916 ?auto_118915 ) ( not ( = ?auto_118915 ?auto_118916 ) ) ( not ( = ?auto_118915 ?auto_118917 ) ) ( not ( = ?auto_118915 ?auto_118918 ) ) ( not ( = ?auto_118915 ?auto_118919 ) ) ( not ( = ?auto_118916 ?auto_118917 ) ) ( not ( = ?auto_118916 ?auto_118918 ) ) ( not ( = ?auto_118916 ?auto_118919 ) ) ( not ( = ?auto_118917 ?auto_118918 ) ) ( not ( = ?auto_118917 ?auto_118919 ) ) ( not ( = ?auto_118918 ?auto_118919 ) ) ( ON ?auto_118919 ?auto_118920 ) ( not ( = ?auto_118915 ?auto_118920 ) ) ( not ( = ?auto_118916 ?auto_118920 ) ) ( not ( = ?auto_118917 ?auto_118920 ) ) ( not ( = ?auto_118918 ?auto_118920 ) ) ( not ( = ?auto_118919 ?auto_118920 ) ) ( ON ?auto_118918 ?auto_118919 ) ( ON-TABLE ?auto_118922 ) ( ON ?auto_118921 ?auto_118922 ) ( ON ?auto_118920 ?auto_118921 ) ( not ( = ?auto_118922 ?auto_118921 ) ) ( not ( = ?auto_118922 ?auto_118920 ) ) ( not ( = ?auto_118922 ?auto_118919 ) ) ( not ( = ?auto_118922 ?auto_118918 ) ) ( not ( = ?auto_118921 ?auto_118920 ) ) ( not ( = ?auto_118921 ?auto_118919 ) ) ( not ( = ?auto_118921 ?auto_118918 ) ) ( not ( = ?auto_118915 ?auto_118922 ) ) ( not ( = ?auto_118915 ?auto_118921 ) ) ( not ( = ?auto_118916 ?auto_118922 ) ) ( not ( = ?auto_118916 ?auto_118921 ) ) ( not ( = ?auto_118917 ?auto_118922 ) ) ( not ( = ?auto_118917 ?auto_118921 ) ) ( CLEAR ?auto_118916 ) ( ON ?auto_118917 ?auto_118918 ) ( CLEAR ?auto_118917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118922 ?auto_118921 ?auto_118920 ?auto_118919 ?auto_118918 )
      ( MAKE-5PILE ?auto_118915 ?auto_118916 ?auto_118917 ?auto_118918 ?auto_118919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118923 - BLOCK
      ?auto_118924 - BLOCK
      ?auto_118925 - BLOCK
      ?auto_118926 - BLOCK
      ?auto_118927 - BLOCK
    )
    :vars
    (
      ?auto_118928 - BLOCK
      ?auto_118929 - BLOCK
      ?auto_118930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118923 ) ( not ( = ?auto_118923 ?auto_118924 ) ) ( not ( = ?auto_118923 ?auto_118925 ) ) ( not ( = ?auto_118923 ?auto_118926 ) ) ( not ( = ?auto_118923 ?auto_118927 ) ) ( not ( = ?auto_118924 ?auto_118925 ) ) ( not ( = ?auto_118924 ?auto_118926 ) ) ( not ( = ?auto_118924 ?auto_118927 ) ) ( not ( = ?auto_118925 ?auto_118926 ) ) ( not ( = ?auto_118925 ?auto_118927 ) ) ( not ( = ?auto_118926 ?auto_118927 ) ) ( ON ?auto_118927 ?auto_118928 ) ( not ( = ?auto_118923 ?auto_118928 ) ) ( not ( = ?auto_118924 ?auto_118928 ) ) ( not ( = ?auto_118925 ?auto_118928 ) ) ( not ( = ?auto_118926 ?auto_118928 ) ) ( not ( = ?auto_118927 ?auto_118928 ) ) ( ON ?auto_118926 ?auto_118927 ) ( ON-TABLE ?auto_118929 ) ( ON ?auto_118930 ?auto_118929 ) ( ON ?auto_118928 ?auto_118930 ) ( not ( = ?auto_118929 ?auto_118930 ) ) ( not ( = ?auto_118929 ?auto_118928 ) ) ( not ( = ?auto_118929 ?auto_118927 ) ) ( not ( = ?auto_118929 ?auto_118926 ) ) ( not ( = ?auto_118930 ?auto_118928 ) ) ( not ( = ?auto_118930 ?auto_118927 ) ) ( not ( = ?auto_118930 ?auto_118926 ) ) ( not ( = ?auto_118923 ?auto_118929 ) ) ( not ( = ?auto_118923 ?auto_118930 ) ) ( not ( = ?auto_118924 ?auto_118929 ) ) ( not ( = ?auto_118924 ?auto_118930 ) ) ( not ( = ?auto_118925 ?auto_118929 ) ) ( not ( = ?auto_118925 ?auto_118930 ) ) ( ON ?auto_118925 ?auto_118926 ) ( CLEAR ?auto_118925 ) ( HOLDING ?auto_118924 ) ( CLEAR ?auto_118923 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118923 ?auto_118924 )
      ( MAKE-5PILE ?auto_118923 ?auto_118924 ?auto_118925 ?auto_118926 ?auto_118927 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118931 - BLOCK
      ?auto_118932 - BLOCK
      ?auto_118933 - BLOCK
      ?auto_118934 - BLOCK
      ?auto_118935 - BLOCK
    )
    :vars
    (
      ?auto_118938 - BLOCK
      ?auto_118937 - BLOCK
      ?auto_118936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_118931 ) ( not ( = ?auto_118931 ?auto_118932 ) ) ( not ( = ?auto_118931 ?auto_118933 ) ) ( not ( = ?auto_118931 ?auto_118934 ) ) ( not ( = ?auto_118931 ?auto_118935 ) ) ( not ( = ?auto_118932 ?auto_118933 ) ) ( not ( = ?auto_118932 ?auto_118934 ) ) ( not ( = ?auto_118932 ?auto_118935 ) ) ( not ( = ?auto_118933 ?auto_118934 ) ) ( not ( = ?auto_118933 ?auto_118935 ) ) ( not ( = ?auto_118934 ?auto_118935 ) ) ( ON ?auto_118935 ?auto_118938 ) ( not ( = ?auto_118931 ?auto_118938 ) ) ( not ( = ?auto_118932 ?auto_118938 ) ) ( not ( = ?auto_118933 ?auto_118938 ) ) ( not ( = ?auto_118934 ?auto_118938 ) ) ( not ( = ?auto_118935 ?auto_118938 ) ) ( ON ?auto_118934 ?auto_118935 ) ( ON-TABLE ?auto_118937 ) ( ON ?auto_118936 ?auto_118937 ) ( ON ?auto_118938 ?auto_118936 ) ( not ( = ?auto_118937 ?auto_118936 ) ) ( not ( = ?auto_118937 ?auto_118938 ) ) ( not ( = ?auto_118937 ?auto_118935 ) ) ( not ( = ?auto_118937 ?auto_118934 ) ) ( not ( = ?auto_118936 ?auto_118938 ) ) ( not ( = ?auto_118936 ?auto_118935 ) ) ( not ( = ?auto_118936 ?auto_118934 ) ) ( not ( = ?auto_118931 ?auto_118937 ) ) ( not ( = ?auto_118931 ?auto_118936 ) ) ( not ( = ?auto_118932 ?auto_118937 ) ) ( not ( = ?auto_118932 ?auto_118936 ) ) ( not ( = ?auto_118933 ?auto_118937 ) ) ( not ( = ?auto_118933 ?auto_118936 ) ) ( ON ?auto_118933 ?auto_118934 ) ( CLEAR ?auto_118931 ) ( ON ?auto_118932 ?auto_118933 ) ( CLEAR ?auto_118932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118937 ?auto_118936 ?auto_118938 ?auto_118935 ?auto_118934 ?auto_118933 )
      ( MAKE-5PILE ?auto_118931 ?auto_118932 ?auto_118933 ?auto_118934 ?auto_118935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118939 - BLOCK
      ?auto_118940 - BLOCK
      ?auto_118941 - BLOCK
      ?auto_118942 - BLOCK
      ?auto_118943 - BLOCK
    )
    :vars
    (
      ?auto_118944 - BLOCK
      ?auto_118946 - BLOCK
      ?auto_118945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118939 ?auto_118940 ) ) ( not ( = ?auto_118939 ?auto_118941 ) ) ( not ( = ?auto_118939 ?auto_118942 ) ) ( not ( = ?auto_118939 ?auto_118943 ) ) ( not ( = ?auto_118940 ?auto_118941 ) ) ( not ( = ?auto_118940 ?auto_118942 ) ) ( not ( = ?auto_118940 ?auto_118943 ) ) ( not ( = ?auto_118941 ?auto_118942 ) ) ( not ( = ?auto_118941 ?auto_118943 ) ) ( not ( = ?auto_118942 ?auto_118943 ) ) ( ON ?auto_118943 ?auto_118944 ) ( not ( = ?auto_118939 ?auto_118944 ) ) ( not ( = ?auto_118940 ?auto_118944 ) ) ( not ( = ?auto_118941 ?auto_118944 ) ) ( not ( = ?auto_118942 ?auto_118944 ) ) ( not ( = ?auto_118943 ?auto_118944 ) ) ( ON ?auto_118942 ?auto_118943 ) ( ON-TABLE ?auto_118946 ) ( ON ?auto_118945 ?auto_118946 ) ( ON ?auto_118944 ?auto_118945 ) ( not ( = ?auto_118946 ?auto_118945 ) ) ( not ( = ?auto_118946 ?auto_118944 ) ) ( not ( = ?auto_118946 ?auto_118943 ) ) ( not ( = ?auto_118946 ?auto_118942 ) ) ( not ( = ?auto_118945 ?auto_118944 ) ) ( not ( = ?auto_118945 ?auto_118943 ) ) ( not ( = ?auto_118945 ?auto_118942 ) ) ( not ( = ?auto_118939 ?auto_118946 ) ) ( not ( = ?auto_118939 ?auto_118945 ) ) ( not ( = ?auto_118940 ?auto_118946 ) ) ( not ( = ?auto_118940 ?auto_118945 ) ) ( not ( = ?auto_118941 ?auto_118946 ) ) ( not ( = ?auto_118941 ?auto_118945 ) ) ( ON ?auto_118941 ?auto_118942 ) ( ON ?auto_118940 ?auto_118941 ) ( CLEAR ?auto_118940 ) ( HOLDING ?auto_118939 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118939 )
      ( MAKE-5PILE ?auto_118939 ?auto_118940 ?auto_118941 ?auto_118942 ?auto_118943 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_118947 - BLOCK
      ?auto_118948 - BLOCK
      ?auto_118949 - BLOCK
      ?auto_118950 - BLOCK
      ?auto_118951 - BLOCK
    )
    :vars
    (
      ?auto_118954 - BLOCK
      ?auto_118953 - BLOCK
      ?auto_118952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_118947 ?auto_118948 ) ) ( not ( = ?auto_118947 ?auto_118949 ) ) ( not ( = ?auto_118947 ?auto_118950 ) ) ( not ( = ?auto_118947 ?auto_118951 ) ) ( not ( = ?auto_118948 ?auto_118949 ) ) ( not ( = ?auto_118948 ?auto_118950 ) ) ( not ( = ?auto_118948 ?auto_118951 ) ) ( not ( = ?auto_118949 ?auto_118950 ) ) ( not ( = ?auto_118949 ?auto_118951 ) ) ( not ( = ?auto_118950 ?auto_118951 ) ) ( ON ?auto_118951 ?auto_118954 ) ( not ( = ?auto_118947 ?auto_118954 ) ) ( not ( = ?auto_118948 ?auto_118954 ) ) ( not ( = ?auto_118949 ?auto_118954 ) ) ( not ( = ?auto_118950 ?auto_118954 ) ) ( not ( = ?auto_118951 ?auto_118954 ) ) ( ON ?auto_118950 ?auto_118951 ) ( ON-TABLE ?auto_118953 ) ( ON ?auto_118952 ?auto_118953 ) ( ON ?auto_118954 ?auto_118952 ) ( not ( = ?auto_118953 ?auto_118952 ) ) ( not ( = ?auto_118953 ?auto_118954 ) ) ( not ( = ?auto_118953 ?auto_118951 ) ) ( not ( = ?auto_118953 ?auto_118950 ) ) ( not ( = ?auto_118952 ?auto_118954 ) ) ( not ( = ?auto_118952 ?auto_118951 ) ) ( not ( = ?auto_118952 ?auto_118950 ) ) ( not ( = ?auto_118947 ?auto_118953 ) ) ( not ( = ?auto_118947 ?auto_118952 ) ) ( not ( = ?auto_118948 ?auto_118953 ) ) ( not ( = ?auto_118948 ?auto_118952 ) ) ( not ( = ?auto_118949 ?auto_118953 ) ) ( not ( = ?auto_118949 ?auto_118952 ) ) ( ON ?auto_118949 ?auto_118950 ) ( ON ?auto_118948 ?auto_118949 ) ( ON ?auto_118947 ?auto_118948 ) ( CLEAR ?auto_118947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118953 ?auto_118952 ?auto_118954 ?auto_118951 ?auto_118950 ?auto_118949 ?auto_118948 )
      ( MAKE-5PILE ?auto_118947 ?auto_118948 ?auto_118949 ?auto_118950 ?auto_118951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118957 - BLOCK
      ?auto_118958 - BLOCK
    )
    :vars
    (
      ?auto_118959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118959 ?auto_118958 ) ( CLEAR ?auto_118959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118957 ) ( ON ?auto_118958 ?auto_118957 ) ( not ( = ?auto_118957 ?auto_118958 ) ) ( not ( = ?auto_118957 ?auto_118959 ) ) ( not ( = ?auto_118958 ?auto_118959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118959 ?auto_118958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118960 - BLOCK
      ?auto_118961 - BLOCK
    )
    :vars
    (
      ?auto_118962 - BLOCK
      ?auto_118963 - BLOCK
      ?auto_118964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118962 ?auto_118961 ) ( CLEAR ?auto_118962 ) ( ON-TABLE ?auto_118960 ) ( ON ?auto_118961 ?auto_118960 ) ( not ( = ?auto_118960 ?auto_118961 ) ) ( not ( = ?auto_118960 ?auto_118962 ) ) ( not ( = ?auto_118961 ?auto_118962 ) ) ( HOLDING ?auto_118963 ) ( CLEAR ?auto_118964 ) ( not ( = ?auto_118960 ?auto_118963 ) ) ( not ( = ?auto_118960 ?auto_118964 ) ) ( not ( = ?auto_118961 ?auto_118963 ) ) ( not ( = ?auto_118961 ?auto_118964 ) ) ( not ( = ?auto_118962 ?auto_118963 ) ) ( not ( = ?auto_118962 ?auto_118964 ) ) ( not ( = ?auto_118963 ?auto_118964 ) ) )
    :subtasks
    ( ( !STACK ?auto_118963 ?auto_118964 )
      ( MAKE-2PILE ?auto_118960 ?auto_118961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118965 - BLOCK
      ?auto_118966 - BLOCK
    )
    :vars
    (
      ?auto_118969 - BLOCK
      ?auto_118968 - BLOCK
      ?auto_118967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118969 ?auto_118966 ) ( ON-TABLE ?auto_118965 ) ( ON ?auto_118966 ?auto_118965 ) ( not ( = ?auto_118965 ?auto_118966 ) ) ( not ( = ?auto_118965 ?auto_118969 ) ) ( not ( = ?auto_118966 ?auto_118969 ) ) ( CLEAR ?auto_118968 ) ( not ( = ?auto_118965 ?auto_118967 ) ) ( not ( = ?auto_118965 ?auto_118968 ) ) ( not ( = ?auto_118966 ?auto_118967 ) ) ( not ( = ?auto_118966 ?auto_118968 ) ) ( not ( = ?auto_118969 ?auto_118967 ) ) ( not ( = ?auto_118969 ?auto_118968 ) ) ( not ( = ?auto_118967 ?auto_118968 ) ) ( ON ?auto_118967 ?auto_118969 ) ( CLEAR ?auto_118967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118965 ?auto_118966 ?auto_118969 )
      ( MAKE-2PILE ?auto_118965 ?auto_118966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118970 - BLOCK
      ?auto_118971 - BLOCK
    )
    :vars
    (
      ?auto_118973 - BLOCK
      ?auto_118974 - BLOCK
      ?auto_118972 - BLOCK
      ?auto_118976 - BLOCK
      ?auto_118975 - BLOCK
      ?auto_118977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118973 ?auto_118971 ) ( ON-TABLE ?auto_118970 ) ( ON ?auto_118971 ?auto_118970 ) ( not ( = ?auto_118970 ?auto_118971 ) ) ( not ( = ?auto_118970 ?auto_118973 ) ) ( not ( = ?auto_118971 ?auto_118973 ) ) ( not ( = ?auto_118970 ?auto_118974 ) ) ( not ( = ?auto_118970 ?auto_118972 ) ) ( not ( = ?auto_118971 ?auto_118974 ) ) ( not ( = ?auto_118971 ?auto_118972 ) ) ( not ( = ?auto_118973 ?auto_118974 ) ) ( not ( = ?auto_118973 ?auto_118972 ) ) ( not ( = ?auto_118974 ?auto_118972 ) ) ( ON ?auto_118974 ?auto_118973 ) ( CLEAR ?auto_118974 ) ( HOLDING ?auto_118972 ) ( CLEAR ?auto_118976 ) ( ON-TABLE ?auto_118975 ) ( ON ?auto_118977 ?auto_118975 ) ( ON ?auto_118976 ?auto_118977 ) ( not ( = ?auto_118975 ?auto_118977 ) ) ( not ( = ?auto_118975 ?auto_118976 ) ) ( not ( = ?auto_118975 ?auto_118972 ) ) ( not ( = ?auto_118977 ?auto_118976 ) ) ( not ( = ?auto_118977 ?auto_118972 ) ) ( not ( = ?auto_118976 ?auto_118972 ) ) ( not ( = ?auto_118970 ?auto_118976 ) ) ( not ( = ?auto_118970 ?auto_118975 ) ) ( not ( = ?auto_118970 ?auto_118977 ) ) ( not ( = ?auto_118971 ?auto_118976 ) ) ( not ( = ?auto_118971 ?auto_118975 ) ) ( not ( = ?auto_118971 ?auto_118977 ) ) ( not ( = ?auto_118973 ?auto_118976 ) ) ( not ( = ?auto_118973 ?auto_118975 ) ) ( not ( = ?auto_118973 ?auto_118977 ) ) ( not ( = ?auto_118974 ?auto_118976 ) ) ( not ( = ?auto_118974 ?auto_118975 ) ) ( not ( = ?auto_118974 ?auto_118977 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118975 ?auto_118977 ?auto_118976 ?auto_118972 )
      ( MAKE-2PILE ?auto_118970 ?auto_118971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118978 - BLOCK
      ?auto_118979 - BLOCK
    )
    :vars
    (
      ?auto_118984 - BLOCK
      ?auto_118981 - BLOCK
      ?auto_118982 - BLOCK
      ?auto_118985 - BLOCK
      ?auto_118983 - BLOCK
      ?auto_118980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118984 ?auto_118979 ) ( ON-TABLE ?auto_118978 ) ( ON ?auto_118979 ?auto_118978 ) ( not ( = ?auto_118978 ?auto_118979 ) ) ( not ( = ?auto_118978 ?auto_118984 ) ) ( not ( = ?auto_118979 ?auto_118984 ) ) ( not ( = ?auto_118978 ?auto_118981 ) ) ( not ( = ?auto_118978 ?auto_118982 ) ) ( not ( = ?auto_118979 ?auto_118981 ) ) ( not ( = ?auto_118979 ?auto_118982 ) ) ( not ( = ?auto_118984 ?auto_118981 ) ) ( not ( = ?auto_118984 ?auto_118982 ) ) ( not ( = ?auto_118981 ?auto_118982 ) ) ( ON ?auto_118981 ?auto_118984 ) ( CLEAR ?auto_118985 ) ( ON-TABLE ?auto_118983 ) ( ON ?auto_118980 ?auto_118983 ) ( ON ?auto_118985 ?auto_118980 ) ( not ( = ?auto_118983 ?auto_118980 ) ) ( not ( = ?auto_118983 ?auto_118985 ) ) ( not ( = ?auto_118983 ?auto_118982 ) ) ( not ( = ?auto_118980 ?auto_118985 ) ) ( not ( = ?auto_118980 ?auto_118982 ) ) ( not ( = ?auto_118985 ?auto_118982 ) ) ( not ( = ?auto_118978 ?auto_118985 ) ) ( not ( = ?auto_118978 ?auto_118983 ) ) ( not ( = ?auto_118978 ?auto_118980 ) ) ( not ( = ?auto_118979 ?auto_118985 ) ) ( not ( = ?auto_118979 ?auto_118983 ) ) ( not ( = ?auto_118979 ?auto_118980 ) ) ( not ( = ?auto_118984 ?auto_118985 ) ) ( not ( = ?auto_118984 ?auto_118983 ) ) ( not ( = ?auto_118984 ?auto_118980 ) ) ( not ( = ?auto_118981 ?auto_118985 ) ) ( not ( = ?auto_118981 ?auto_118983 ) ) ( not ( = ?auto_118981 ?auto_118980 ) ) ( ON ?auto_118982 ?auto_118981 ) ( CLEAR ?auto_118982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118978 ?auto_118979 ?auto_118984 ?auto_118981 )
      ( MAKE-2PILE ?auto_118978 ?auto_118979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118986 - BLOCK
      ?auto_118987 - BLOCK
    )
    :vars
    (
      ?auto_118992 - BLOCK
      ?auto_118990 - BLOCK
      ?auto_118991 - BLOCK
      ?auto_118993 - BLOCK
      ?auto_118989 - BLOCK
      ?auto_118988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118992 ?auto_118987 ) ( ON-TABLE ?auto_118986 ) ( ON ?auto_118987 ?auto_118986 ) ( not ( = ?auto_118986 ?auto_118987 ) ) ( not ( = ?auto_118986 ?auto_118992 ) ) ( not ( = ?auto_118987 ?auto_118992 ) ) ( not ( = ?auto_118986 ?auto_118990 ) ) ( not ( = ?auto_118986 ?auto_118991 ) ) ( not ( = ?auto_118987 ?auto_118990 ) ) ( not ( = ?auto_118987 ?auto_118991 ) ) ( not ( = ?auto_118992 ?auto_118990 ) ) ( not ( = ?auto_118992 ?auto_118991 ) ) ( not ( = ?auto_118990 ?auto_118991 ) ) ( ON ?auto_118990 ?auto_118992 ) ( ON-TABLE ?auto_118993 ) ( ON ?auto_118989 ?auto_118993 ) ( not ( = ?auto_118993 ?auto_118989 ) ) ( not ( = ?auto_118993 ?auto_118988 ) ) ( not ( = ?auto_118993 ?auto_118991 ) ) ( not ( = ?auto_118989 ?auto_118988 ) ) ( not ( = ?auto_118989 ?auto_118991 ) ) ( not ( = ?auto_118988 ?auto_118991 ) ) ( not ( = ?auto_118986 ?auto_118988 ) ) ( not ( = ?auto_118986 ?auto_118993 ) ) ( not ( = ?auto_118986 ?auto_118989 ) ) ( not ( = ?auto_118987 ?auto_118988 ) ) ( not ( = ?auto_118987 ?auto_118993 ) ) ( not ( = ?auto_118987 ?auto_118989 ) ) ( not ( = ?auto_118992 ?auto_118988 ) ) ( not ( = ?auto_118992 ?auto_118993 ) ) ( not ( = ?auto_118992 ?auto_118989 ) ) ( not ( = ?auto_118990 ?auto_118988 ) ) ( not ( = ?auto_118990 ?auto_118993 ) ) ( not ( = ?auto_118990 ?auto_118989 ) ) ( ON ?auto_118991 ?auto_118990 ) ( CLEAR ?auto_118991 ) ( HOLDING ?auto_118988 ) ( CLEAR ?auto_118989 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118993 ?auto_118989 ?auto_118988 )
      ( MAKE-2PILE ?auto_118986 ?auto_118987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_118994 - BLOCK
      ?auto_118995 - BLOCK
    )
    :vars
    (
      ?auto_118996 - BLOCK
      ?auto_118998 - BLOCK
      ?auto_118997 - BLOCK
      ?auto_119001 - BLOCK
      ?auto_119000 - BLOCK
      ?auto_118999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118996 ?auto_118995 ) ( ON-TABLE ?auto_118994 ) ( ON ?auto_118995 ?auto_118994 ) ( not ( = ?auto_118994 ?auto_118995 ) ) ( not ( = ?auto_118994 ?auto_118996 ) ) ( not ( = ?auto_118995 ?auto_118996 ) ) ( not ( = ?auto_118994 ?auto_118998 ) ) ( not ( = ?auto_118994 ?auto_118997 ) ) ( not ( = ?auto_118995 ?auto_118998 ) ) ( not ( = ?auto_118995 ?auto_118997 ) ) ( not ( = ?auto_118996 ?auto_118998 ) ) ( not ( = ?auto_118996 ?auto_118997 ) ) ( not ( = ?auto_118998 ?auto_118997 ) ) ( ON ?auto_118998 ?auto_118996 ) ( ON-TABLE ?auto_119001 ) ( ON ?auto_119000 ?auto_119001 ) ( not ( = ?auto_119001 ?auto_119000 ) ) ( not ( = ?auto_119001 ?auto_118999 ) ) ( not ( = ?auto_119001 ?auto_118997 ) ) ( not ( = ?auto_119000 ?auto_118999 ) ) ( not ( = ?auto_119000 ?auto_118997 ) ) ( not ( = ?auto_118999 ?auto_118997 ) ) ( not ( = ?auto_118994 ?auto_118999 ) ) ( not ( = ?auto_118994 ?auto_119001 ) ) ( not ( = ?auto_118994 ?auto_119000 ) ) ( not ( = ?auto_118995 ?auto_118999 ) ) ( not ( = ?auto_118995 ?auto_119001 ) ) ( not ( = ?auto_118995 ?auto_119000 ) ) ( not ( = ?auto_118996 ?auto_118999 ) ) ( not ( = ?auto_118996 ?auto_119001 ) ) ( not ( = ?auto_118996 ?auto_119000 ) ) ( not ( = ?auto_118998 ?auto_118999 ) ) ( not ( = ?auto_118998 ?auto_119001 ) ) ( not ( = ?auto_118998 ?auto_119000 ) ) ( ON ?auto_118997 ?auto_118998 ) ( CLEAR ?auto_119000 ) ( ON ?auto_118999 ?auto_118997 ) ( CLEAR ?auto_118999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118994 ?auto_118995 ?auto_118996 ?auto_118998 ?auto_118997 )
      ( MAKE-2PILE ?auto_118994 ?auto_118995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119002 - BLOCK
      ?auto_119003 - BLOCK
    )
    :vars
    (
      ?auto_119009 - BLOCK
      ?auto_119006 - BLOCK
      ?auto_119007 - BLOCK
      ?auto_119004 - BLOCK
      ?auto_119008 - BLOCK
      ?auto_119005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119009 ?auto_119003 ) ( ON-TABLE ?auto_119002 ) ( ON ?auto_119003 ?auto_119002 ) ( not ( = ?auto_119002 ?auto_119003 ) ) ( not ( = ?auto_119002 ?auto_119009 ) ) ( not ( = ?auto_119003 ?auto_119009 ) ) ( not ( = ?auto_119002 ?auto_119006 ) ) ( not ( = ?auto_119002 ?auto_119007 ) ) ( not ( = ?auto_119003 ?auto_119006 ) ) ( not ( = ?auto_119003 ?auto_119007 ) ) ( not ( = ?auto_119009 ?auto_119006 ) ) ( not ( = ?auto_119009 ?auto_119007 ) ) ( not ( = ?auto_119006 ?auto_119007 ) ) ( ON ?auto_119006 ?auto_119009 ) ( ON-TABLE ?auto_119004 ) ( not ( = ?auto_119004 ?auto_119008 ) ) ( not ( = ?auto_119004 ?auto_119005 ) ) ( not ( = ?auto_119004 ?auto_119007 ) ) ( not ( = ?auto_119008 ?auto_119005 ) ) ( not ( = ?auto_119008 ?auto_119007 ) ) ( not ( = ?auto_119005 ?auto_119007 ) ) ( not ( = ?auto_119002 ?auto_119005 ) ) ( not ( = ?auto_119002 ?auto_119004 ) ) ( not ( = ?auto_119002 ?auto_119008 ) ) ( not ( = ?auto_119003 ?auto_119005 ) ) ( not ( = ?auto_119003 ?auto_119004 ) ) ( not ( = ?auto_119003 ?auto_119008 ) ) ( not ( = ?auto_119009 ?auto_119005 ) ) ( not ( = ?auto_119009 ?auto_119004 ) ) ( not ( = ?auto_119009 ?auto_119008 ) ) ( not ( = ?auto_119006 ?auto_119005 ) ) ( not ( = ?auto_119006 ?auto_119004 ) ) ( not ( = ?auto_119006 ?auto_119008 ) ) ( ON ?auto_119007 ?auto_119006 ) ( ON ?auto_119005 ?auto_119007 ) ( CLEAR ?auto_119005 ) ( HOLDING ?auto_119008 ) ( CLEAR ?auto_119004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119004 ?auto_119008 )
      ( MAKE-2PILE ?auto_119002 ?auto_119003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119010 - BLOCK
      ?auto_119011 - BLOCK
    )
    :vars
    (
      ?auto_119013 - BLOCK
      ?auto_119017 - BLOCK
      ?auto_119015 - BLOCK
      ?auto_119012 - BLOCK
      ?auto_119014 - BLOCK
      ?auto_119016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119013 ?auto_119011 ) ( ON-TABLE ?auto_119010 ) ( ON ?auto_119011 ?auto_119010 ) ( not ( = ?auto_119010 ?auto_119011 ) ) ( not ( = ?auto_119010 ?auto_119013 ) ) ( not ( = ?auto_119011 ?auto_119013 ) ) ( not ( = ?auto_119010 ?auto_119017 ) ) ( not ( = ?auto_119010 ?auto_119015 ) ) ( not ( = ?auto_119011 ?auto_119017 ) ) ( not ( = ?auto_119011 ?auto_119015 ) ) ( not ( = ?auto_119013 ?auto_119017 ) ) ( not ( = ?auto_119013 ?auto_119015 ) ) ( not ( = ?auto_119017 ?auto_119015 ) ) ( ON ?auto_119017 ?auto_119013 ) ( ON-TABLE ?auto_119012 ) ( not ( = ?auto_119012 ?auto_119014 ) ) ( not ( = ?auto_119012 ?auto_119016 ) ) ( not ( = ?auto_119012 ?auto_119015 ) ) ( not ( = ?auto_119014 ?auto_119016 ) ) ( not ( = ?auto_119014 ?auto_119015 ) ) ( not ( = ?auto_119016 ?auto_119015 ) ) ( not ( = ?auto_119010 ?auto_119016 ) ) ( not ( = ?auto_119010 ?auto_119012 ) ) ( not ( = ?auto_119010 ?auto_119014 ) ) ( not ( = ?auto_119011 ?auto_119016 ) ) ( not ( = ?auto_119011 ?auto_119012 ) ) ( not ( = ?auto_119011 ?auto_119014 ) ) ( not ( = ?auto_119013 ?auto_119016 ) ) ( not ( = ?auto_119013 ?auto_119012 ) ) ( not ( = ?auto_119013 ?auto_119014 ) ) ( not ( = ?auto_119017 ?auto_119016 ) ) ( not ( = ?auto_119017 ?auto_119012 ) ) ( not ( = ?auto_119017 ?auto_119014 ) ) ( ON ?auto_119015 ?auto_119017 ) ( ON ?auto_119016 ?auto_119015 ) ( CLEAR ?auto_119012 ) ( ON ?auto_119014 ?auto_119016 ) ( CLEAR ?auto_119014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119010 ?auto_119011 ?auto_119013 ?auto_119017 ?auto_119015 ?auto_119016 )
      ( MAKE-2PILE ?auto_119010 ?auto_119011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119018 - BLOCK
      ?auto_119019 - BLOCK
    )
    :vars
    (
      ?auto_119023 - BLOCK
      ?auto_119020 - BLOCK
      ?auto_119022 - BLOCK
      ?auto_119021 - BLOCK
      ?auto_119024 - BLOCK
      ?auto_119025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119023 ?auto_119019 ) ( ON-TABLE ?auto_119018 ) ( ON ?auto_119019 ?auto_119018 ) ( not ( = ?auto_119018 ?auto_119019 ) ) ( not ( = ?auto_119018 ?auto_119023 ) ) ( not ( = ?auto_119019 ?auto_119023 ) ) ( not ( = ?auto_119018 ?auto_119020 ) ) ( not ( = ?auto_119018 ?auto_119022 ) ) ( not ( = ?auto_119019 ?auto_119020 ) ) ( not ( = ?auto_119019 ?auto_119022 ) ) ( not ( = ?auto_119023 ?auto_119020 ) ) ( not ( = ?auto_119023 ?auto_119022 ) ) ( not ( = ?auto_119020 ?auto_119022 ) ) ( ON ?auto_119020 ?auto_119023 ) ( not ( = ?auto_119021 ?auto_119024 ) ) ( not ( = ?auto_119021 ?auto_119025 ) ) ( not ( = ?auto_119021 ?auto_119022 ) ) ( not ( = ?auto_119024 ?auto_119025 ) ) ( not ( = ?auto_119024 ?auto_119022 ) ) ( not ( = ?auto_119025 ?auto_119022 ) ) ( not ( = ?auto_119018 ?auto_119025 ) ) ( not ( = ?auto_119018 ?auto_119021 ) ) ( not ( = ?auto_119018 ?auto_119024 ) ) ( not ( = ?auto_119019 ?auto_119025 ) ) ( not ( = ?auto_119019 ?auto_119021 ) ) ( not ( = ?auto_119019 ?auto_119024 ) ) ( not ( = ?auto_119023 ?auto_119025 ) ) ( not ( = ?auto_119023 ?auto_119021 ) ) ( not ( = ?auto_119023 ?auto_119024 ) ) ( not ( = ?auto_119020 ?auto_119025 ) ) ( not ( = ?auto_119020 ?auto_119021 ) ) ( not ( = ?auto_119020 ?auto_119024 ) ) ( ON ?auto_119022 ?auto_119020 ) ( ON ?auto_119025 ?auto_119022 ) ( ON ?auto_119024 ?auto_119025 ) ( CLEAR ?auto_119024 ) ( HOLDING ?auto_119021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119021 )
      ( MAKE-2PILE ?auto_119018 ?auto_119019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119026 - BLOCK
      ?auto_119027 - BLOCK
    )
    :vars
    (
      ?auto_119031 - BLOCK
      ?auto_119033 - BLOCK
      ?auto_119030 - BLOCK
      ?auto_119029 - BLOCK
      ?auto_119028 - BLOCK
      ?auto_119032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119031 ?auto_119027 ) ( ON-TABLE ?auto_119026 ) ( ON ?auto_119027 ?auto_119026 ) ( not ( = ?auto_119026 ?auto_119027 ) ) ( not ( = ?auto_119026 ?auto_119031 ) ) ( not ( = ?auto_119027 ?auto_119031 ) ) ( not ( = ?auto_119026 ?auto_119033 ) ) ( not ( = ?auto_119026 ?auto_119030 ) ) ( not ( = ?auto_119027 ?auto_119033 ) ) ( not ( = ?auto_119027 ?auto_119030 ) ) ( not ( = ?auto_119031 ?auto_119033 ) ) ( not ( = ?auto_119031 ?auto_119030 ) ) ( not ( = ?auto_119033 ?auto_119030 ) ) ( ON ?auto_119033 ?auto_119031 ) ( not ( = ?auto_119029 ?auto_119028 ) ) ( not ( = ?auto_119029 ?auto_119032 ) ) ( not ( = ?auto_119029 ?auto_119030 ) ) ( not ( = ?auto_119028 ?auto_119032 ) ) ( not ( = ?auto_119028 ?auto_119030 ) ) ( not ( = ?auto_119032 ?auto_119030 ) ) ( not ( = ?auto_119026 ?auto_119032 ) ) ( not ( = ?auto_119026 ?auto_119029 ) ) ( not ( = ?auto_119026 ?auto_119028 ) ) ( not ( = ?auto_119027 ?auto_119032 ) ) ( not ( = ?auto_119027 ?auto_119029 ) ) ( not ( = ?auto_119027 ?auto_119028 ) ) ( not ( = ?auto_119031 ?auto_119032 ) ) ( not ( = ?auto_119031 ?auto_119029 ) ) ( not ( = ?auto_119031 ?auto_119028 ) ) ( not ( = ?auto_119033 ?auto_119032 ) ) ( not ( = ?auto_119033 ?auto_119029 ) ) ( not ( = ?auto_119033 ?auto_119028 ) ) ( ON ?auto_119030 ?auto_119033 ) ( ON ?auto_119032 ?auto_119030 ) ( ON ?auto_119028 ?auto_119032 ) ( ON ?auto_119029 ?auto_119028 ) ( CLEAR ?auto_119029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119026 ?auto_119027 ?auto_119031 ?auto_119033 ?auto_119030 ?auto_119032 ?auto_119028 )
      ( MAKE-2PILE ?auto_119026 ?auto_119027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119040 - BLOCK
      ?auto_119041 - BLOCK
      ?auto_119042 - BLOCK
      ?auto_119043 - BLOCK
      ?auto_119044 - BLOCK
      ?auto_119045 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_119045 ) ( CLEAR ?auto_119044 ) ( ON-TABLE ?auto_119040 ) ( ON ?auto_119041 ?auto_119040 ) ( ON ?auto_119042 ?auto_119041 ) ( ON ?auto_119043 ?auto_119042 ) ( ON ?auto_119044 ?auto_119043 ) ( not ( = ?auto_119040 ?auto_119041 ) ) ( not ( = ?auto_119040 ?auto_119042 ) ) ( not ( = ?auto_119040 ?auto_119043 ) ) ( not ( = ?auto_119040 ?auto_119044 ) ) ( not ( = ?auto_119040 ?auto_119045 ) ) ( not ( = ?auto_119041 ?auto_119042 ) ) ( not ( = ?auto_119041 ?auto_119043 ) ) ( not ( = ?auto_119041 ?auto_119044 ) ) ( not ( = ?auto_119041 ?auto_119045 ) ) ( not ( = ?auto_119042 ?auto_119043 ) ) ( not ( = ?auto_119042 ?auto_119044 ) ) ( not ( = ?auto_119042 ?auto_119045 ) ) ( not ( = ?auto_119043 ?auto_119044 ) ) ( not ( = ?auto_119043 ?auto_119045 ) ) ( not ( = ?auto_119044 ?auto_119045 ) ) )
    :subtasks
    ( ( !STACK ?auto_119045 ?auto_119044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119046 - BLOCK
      ?auto_119047 - BLOCK
      ?auto_119048 - BLOCK
      ?auto_119049 - BLOCK
      ?auto_119050 - BLOCK
      ?auto_119051 - BLOCK
    )
    :vars
    (
      ?auto_119052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119050 ) ( ON-TABLE ?auto_119046 ) ( ON ?auto_119047 ?auto_119046 ) ( ON ?auto_119048 ?auto_119047 ) ( ON ?auto_119049 ?auto_119048 ) ( ON ?auto_119050 ?auto_119049 ) ( not ( = ?auto_119046 ?auto_119047 ) ) ( not ( = ?auto_119046 ?auto_119048 ) ) ( not ( = ?auto_119046 ?auto_119049 ) ) ( not ( = ?auto_119046 ?auto_119050 ) ) ( not ( = ?auto_119046 ?auto_119051 ) ) ( not ( = ?auto_119047 ?auto_119048 ) ) ( not ( = ?auto_119047 ?auto_119049 ) ) ( not ( = ?auto_119047 ?auto_119050 ) ) ( not ( = ?auto_119047 ?auto_119051 ) ) ( not ( = ?auto_119048 ?auto_119049 ) ) ( not ( = ?auto_119048 ?auto_119050 ) ) ( not ( = ?auto_119048 ?auto_119051 ) ) ( not ( = ?auto_119049 ?auto_119050 ) ) ( not ( = ?auto_119049 ?auto_119051 ) ) ( not ( = ?auto_119050 ?auto_119051 ) ) ( ON ?auto_119051 ?auto_119052 ) ( CLEAR ?auto_119051 ) ( HAND-EMPTY ) ( not ( = ?auto_119046 ?auto_119052 ) ) ( not ( = ?auto_119047 ?auto_119052 ) ) ( not ( = ?auto_119048 ?auto_119052 ) ) ( not ( = ?auto_119049 ?auto_119052 ) ) ( not ( = ?auto_119050 ?auto_119052 ) ) ( not ( = ?auto_119051 ?auto_119052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119051 ?auto_119052 )
      ( MAKE-6PILE ?auto_119046 ?auto_119047 ?auto_119048 ?auto_119049 ?auto_119050 ?auto_119051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119053 - BLOCK
      ?auto_119054 - BLOCK
      ?auto_119055 - BLOCK
      ?auto_119056 - BLOCK
      ?auto_119057 - BLOCK
      ?auto_119058 - BLOCK
    )
    :vars
    (
      ?auto_119059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119053 ) ( ON ?auto_119054 ?auto_119053 ) ( ON ?auto_119055 ?auto_119054 ) ( ON ?auto_119056 ?auto_119055 ) ( not ( = ?auto_119053 ?auto_119054 ) ) ( not ( = ?auto_119053 ?auto_119055 ) ) ( not ( = ?auto_119053 ?auto_119056 ) ) ( not ( = ?auto_119053 ?auto_119057 ) ) ( not ( = ?auto_119053 ?auto_119058 ) ) ( not ( = ?auto_119054 ?auto_119055 ) ) ( not ( = ?auto_119054 ?auto_119056 ) ) ( not ( = ?auto_119054 ?auto_119057 ) ) ( not ( = ?auto_119054 ?auto_119058 ) ) ( not ( = ?auto_119055 ?auto_119056 ) ) ( not ( = ?auto_119055 ?auto_119057 ) ) ( not ( = ?auto_119055 ?auto_119058 ) ) ( not ( = ?auto_119056 ?auto_119057 ) ) ( not ( = ?auto_119056 ?auto_119058 ) ) ( not ( = ?auto_119057 ?auto_119058 ) ) ( ON ?auto_119058 ?auto_119059 ) ( CLEAR ?auto_119058 ) ( not ( = ?auto_119053 ?auto_119059 ) ) ( not ( = ?auto_119054 ?auto_119059 ) ) ( not ( = ?auto_119055 ?auto_119059 ) ) ( not ( = ?auto_119056 ?auto_119059 ) ) ( not ( = ?auto_119057 ?auto_119059 ) ) ( not ( = ?auto_119058 ?auto_119059 ) ) ( HOLDING ?auto_119057 ) ( CLEAR ?auto_119056 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119053 ?auto_119054 ?auto_119055 ?auto_119056 ?auto_119057 )
      ( MAKE-6PILE ?auto_119053 ?auto_119054 ?auto_119055 ?auto_119056 ?auto_119057 ?auto_119058 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119060 - BLOCK
      ?auto_119061 - BLOCK
      ?auto_119062 - BLOCK
      ?auto_119063 - BLOCK
      ?auto_119064 - BLOCK
      ?auto_119065 - BLOCK
    )
    :vars
    (
      ?auto_119066 - BLOCK
      ?auto_119067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119060 ) ( ON ?auto_119061 ?auto_119060 ) ( ON ?auto_119062 ?auto_119061 ) ( ON ?auto_119063 ?auto_119062 ) ( not ( = ?auto_119060 ?auto_119061 ) ) ( not ( = ?auto_119060 ?auto_119062 ) ) ( not ( = ?auto_119060 ?auto_119063 ) ) ( not ( = ?auto_119060 ?auto_119064 ) ) ( not ( = ?auto_119060 ?auto_119065 ) ) ( not ( = ?auto_119061 ?auto_119062 ) ) ( not ( = ?auto_119061 ?auto_119063 ) ) ( not ( = ?auto_119061 ?auto_119064 ) ) ( not ( = ?auto_119061 ?auto_119065 ) ) ( not ( = ?auto_119062 ?auto_119063 ) ) ( not ( = ?auto_119062 ?auto_119064 ) ) ( not ( = ?auto_119062 ?auto_119065 ) ) ( not ( = ?auto_119063 ?auto_119064 ) ) ( not ( = ?auto_119063 ?auto_119065 ) ) ( not ( = ?auto_119064 ?auto_119065 ) ) ( ON ?auto_119065 ?auto_119066 ) ( not ( = ?auto_119060 ?auto_119066 ) ) ( not ( = ?auto_119061 ?auto_119066 ) ) ( not ( = ?auto_119062 ?auto_119066 ) ) ( not ( = ?auto_119063 ?auto_119066 ) ) ( not ( = ?auto_119064 ?auto_119066 ) ) ( not ( = ?auto_119065 ?auto_119066 ) ) ( CLEAR ?auto_119063 ) ( ON ?auto_119064 ?auto_119065 ) ( CLEAR ?auto_119064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119067 ) ( ON ?auto_119066 ?auto_119067 ) ( not ( = ?auto_119067 ?auto_119066 ) ) ( not ( = ?auto_119067 ?auto_119065 ) ) ( not ( = ?auto_119067 ?auto_119064 ) ) ( not ( = ?auto_119060 ?auto_119067 ) ) ( not ( = ?auto_119061 ?auto_119067 ) ) ( not ( = ?auto_119062 ?auto_119067 ) ) ( not ( = ?auto_119063 ?auto_119067 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119067 ?auto_119066 ?auto_119065 )
      ( MAKE-6PILE ?auto_119060 ?auto_119061 ?auto_119062 ?auto_119063 ?auto_119064 ?auto_119065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119068 - BLOCK
      ?auto_119069 - BLOCK
      ?auto_119070 - BLOCK
      ?auto_119071 - BLOCK
      ?auto_119072 - BLOCK
      ?auto_119073 - BLOCK
    )
    :vars
    (
      ?auto_119074 - BLOCK
      ?auto_119075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119068 ) ( ON ?auto_119069 ?auto_119068 ) ( ON ?auto_119070 ?auto_119069 ) ( not ( = ?auto_119068 ?auto_119069 ) ) ( not ( = ?auto_119068 ?auto_119070 ) ) ( not ( = ?auto_119068 ?auto_119071 ) ) ( not ( = ?auto_119068 ?auto_119072 ) ) ( not ( = ?auto_119068 ?auto_119073 ) ) ( not ( = ?auto_119069 ?auto_119070 ) ) ( not ( = ?auto_119069 ?auto_119071 ) ) ( not ( = ?auto_119069 ?auto_119072 ) ) ( not ( = ?auto_119069 ?auto_119073 ) ) ( not ( = ?auto_119070 ?auto_119071 ) ) ( not ( = ?auto_119070 ?auto_119072 ) ) ( not ( = ?auto_119070 ?auto_119073 ) ) ( not ( = ?auto_119071 ?auto_119072 ) ) ( not ( = ?auto_119071 ?auto_119073 ) ) ( not ( = ?auto_119072 ?auto_119073 ) ) ( ON ?auto_119073 ?auto_119074 ) ( not ( = ?auto_119068 ?auto_119074 ) ) ( not ( = ?auto_119069 ?auto_119074 ) ) ( not ( = ?auto_119070 ?auto_119074 ) ) ( not ( = ?auto_119071 ?auto_119074 ) ) ( not ( = ?auto_119072 ?auto_119074 ) ) ( not ( = ?auto_119073 ?auto_119074 ) ) ( ON ?auto_119072 ?auto_119073 ) ( CLEAR ?auto_119072 ) ( ON-TABLE ?auto_119075 ) ( ON ?auto_119074 ?auto_119075 ) ( not ( = ?auto_119075 ?auto_119074 ) ) ( not ( = ?auto_119075 ?auto_119073 ) ) ( not ( = ?auto_119075 ?auto_119072 ) ) ( not ( = ?auto_119068 ?auto_119075 ) ) ( not ( = ?auto_119069 ?auto_119075 ) ) ( not ( = ?auto_119070 ?auto_119075 ) ) ( not ( = ?auto_119071 ?auto_119075 ) ) ( HOLDING ?auto_119071 ) ( CLEAR ?auto_119070 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119068 ?auto_119069 ?auto_119070 ?auto_119071 )
      ( MAKE-6PILE ?auto_119068 ?auto_119069 ?auto_119070 ?auto_119071 ?auto_119072 ?auto_119073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119076 - BLOCK
      ?auto_119077 - BLOCK
      ?auto_119078 - BLOCK
      ?auto_119079 - BLOCK
      ?auto_119080 - BLOCK
      ?auto_119081 - BLOCK
    )
    :vars
    (
      ?auto_119082 - BLOCK
      ?auto_119083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119076 ) ( ON ?auto_119077 ?auto_119076 ) ( ON ?auto_119078 ?auto_119077 ) ( not ( = ?auto_119076 ?auto_119077 ) ) ( not ( = ?auto_119076 ?auto_119078 ) ) ( not ( = ?auto_119076 ?auto_119079 ) ) ( not ( = ?auto_119076 ?auto_119080 ) ) ( not ( = ?auto_119076 ?auto_119081 ) ) ( not ( = ?auto_119077 ?auto_119078 ) ) ( not ( = ?auto_119077 ?auto_119079 ) ) ( not ( = ?auto_119077 ?auto_119080 ) ) ( not ( = ?auto_119077 ?auto_119081 ) ) ( not ( = ?auto_119078 ?auto_119079 ) ) ( not ( = ?auto_119078 ?auto_119080 ) ) ( not ( = ?auto_119078 ?auto_119081 ) ) ( not ( = ?auto_119079 ?auto_119080 ) ) ( not ( = ?auto_119079 ?auto_119081 ) ) ( not ( = ?auto_119080 ?auto_119081 ) ) ( ON ?auto_119081 ?auto_119082 ) ( not ( = ?auto_119076 ?auto_119082 ) ) ( not ( = ?auto_119077 ?auto_119082 ) ) ( not ( = ?auto_119078 ?auto_119082 ) ) ( not ( = ?auto_119079 ?auto_119082 ) ) ( not ( = ?auto_119080 ?auto_119082 ) ) ( not ( = ?auto_119081 ?auto_119082 ) ) ( ON ?auto_119080 ?auto_119081 ) ( ON-TABLE ?auto_119083 ) ( ON ?auto_119082 ?auto_119083 ) ( not ( = ?auto_119083 ?auto_119082 ) ) ( not ( = ?auto_119083 ?auto_119081 ) ) ( not ( = ?auto_119083 ?auto_119080 ) ) ( not ( = ?auto_119076 ?auto_119083 ) ) ( not ( = ?auto_119077 ?auto_119083 ) ) ( not ( = ?auto_119078 ?auto_119083 ) ) ( not ( = ?auto_119079 ?auto_119083 ) ) ( CLEAR ?auto_119078 ) ( ON ?auto_119079 ?auto_119080 ) ( CLEAR ?auto_119079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119083 ?auto_119082 ?auto_119081 ?auto_119080 )
      ( MAKE-6PILE ?auto_119076 ?auto_119077 ?auto_119078 ?auto_119079 ?auto_119080 ?auto_119081 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119084 - BLOCK
      ?auto_119085 - BLOCK
      ?auto_119086 - BLOCK
      ?auto_119087 - BLOCK
      ?auto_119088 - BLOCK
      ?auto_119089 - BLOCK
    )
    :vars
    (
      ?auto_119090 - BLOCK
      ?auto_119091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119084 ) ( ON ?auto_119085 ?auto_119084 ) ( not ( = ?auto_119084 ?auto_119085 ) ) ( not ( = ?auto_119084 ?auto_119086 ) ) ( not ( = ?auto_119084 ?auto_119087 ) ) ( not ( = ?auto_119084 ?auto_119088 ) ) ( not ( = ?auto_119084 ?auto_119089 ) ) ( not ( = ?auto_119085 ?auto_119086 ) ) ( not ( = ?auto_119085 ?auto_119087 ) ) ( not ( = ?auto_119085 ?auto_119088 ) ) ( not ( = ?auto_119085 ?auto_119089 ) ) ( not ( = ?auto_119086 ?auto_119087 ) ) ( not ( = ?auto_119086 ?auto_119088 ) ) ( not ( = ?auto_119086 ?auto_119089 ) ) ( not ( = ?auto_119087 ?auto_119088 ) ) ( not ( = ?auto_119087 ?auto_119089 ) ) ( not ( = ?auto_119088 ?auto_119089 ) ) ( ON ?auto_119089 ?auto_119090 ) ( not ( = ?auto_119084 ?auto_119090 ) ) ( not ( = ?auto_119085 ?auto_119090 ) ) ( not ( = ?auto_119086 ?auto_119090 ) ) ( not ( = ?auto_119087 ?auto_119090 ) ) ( not ( = ?auto_119088 ?auto_119090 ) ) ( not ( = ?auto_119089 ?auto_119090 ) ) ( ON ?auto_119088 ?auto_119089 ) ( ON-TABLE ?auto_119091 ) ( ON ?auto_119090 ?auto_119091 ) ( not ( = ?auto_119091 ?auto_119090 ) ) ( not ( = ?auto_119091 ?auto_119089 ) ) ( not ( = ?auto_119091 ?auto_119088 ) ) ( not ( = ?auto_119084 ?auto_119091 ) ) ( not ( = ?auto_119085 ?auto_119091 ) ) ( not ( = ?auto_119086 ?auto_119091 ) ) ( not ( = ?auto_119087 ?auto_119091 ) ) ( ON ?auto_119087 ?auto_119088 ) ( CLEAR ?auto_119087 ) ( HOLDING ?auto_119086 ) ( CLEAR ?auto_119085 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119084 ?auto_119085 ?auto_119086 )
      ( MAKE-6PILE ?auto_119084 ?auto_119085 ?auto_119086 ?auto_119087 ?auto_119088 ?auto_119089 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119092 - BLOCK
      ?auto_119093 - BLOCK
      ?auto_119094 - BLOCK
      ?auto_119095 - BLOCK
      ?auto_119096 - BLOCK
      ?auto_119097 - BLOCK
    )
    :vars
    (
      ?auto_119098 - BLOCK
      ?auto_119099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119092 ) ( ON ?auto_119093 ?auto_119092 ) ( not ( = ?auto_119092 ?auto_119093 ) ) ( not ( = ?auto_119092 ?auto_119094 ) ) ( not ( = ?auto_119092 ?auto_119095 ) ) ( not ( = ?auto_119092 ?auto_119096 ) ) ( not ( = ?auto_119092 ?auto_119097 ) ) ( not ( = ?auto_119093 ?auto_119094 ) ) ( not ( = ?auto_119093 ?auto_119095 ) ) ( not ( = ?auto_119093 ?auto_119096 ) ) ( not ( = ?auto_119093 ?auto_119097 ) ) ( not ( = ?auto_119094 ?auto_119095 ) ) ( not ( = ?auto_119094 ?auto_119096 ) ) ( not ( = ?auto_119094 ?auto_119097 ) ) ( not ( = ?auto_119095 ?auto_119096 ) ) ( not ( = ?auto_119095 ?auto_119097 ) ) ( not ( = ?auto_119096 ?auto_119097 ) ) ( ON ?auto_119097 ?auto_119098 ) ( not ( = ?auto_119092 ?auto_119098 ) ) ( not ( = ?auto_119093 ?auto_119098 ) ) ( not ( = ?auto_119094 ?auto_119098 ) ) ( not ( = ?auto_119095 ?auto_119098 ) ) ( not ( = ?auto_119096 ?auto_119098 ) ) ( not ( = ?auto_119097 ?auto_119098 ) ) ( ON ?auto_119096 ?auto_119097 ) ( ON-TABLE ?auto_119099 ) ( ON ?auto_119098 ?auto_119099 ) ( not ( = ?auto_119099 ?auto_119098 ) ) ( not ( = ?auto_119099 ?auto_119097 ) ) ( not ( = ?auto_119099 ?auto_119096 ) ) ( not ( = ?auto_119092 ?auto_119099 ) ) ( not ( = ?auto_119093 ?auto_119099 ) ) ( not ( = ?auto_119094 ?auto_119099 ) ) ( not ( = ?auto_119095 ?auto_119099 ) ) ( ON ?auto_119095 ?auto_119096 ) ( CLEAR ?auto_119093 ) ( ON ?auto_119094 ?auto_119095 ) ( CLEAR ?auto_119094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119099 ?auto_119098 ?auto_119097 ?auto_119096 ?auto_119095 )
      ( MAKE-6PILE ?auto_119092 ?auto_119093 ?auto_119094 ?auto_119095 ?auto_119096 ?auto_119097 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119100 - BLOCK
      ?auto_119101 - BLOCK
      ?auto_119102 - BLOCK
      ?auto_119103 - BLOCK
      ?auto_119104 - BLOCK
      ?auto_119105 - BLOCK
    )
    :vars
    (
      ?auto_119107 - BLOCK
      ?auto_119106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119100 ) ( not ( = ?auto_119100 ?auto_119101 ) ) ( not ( = ?auto_119100 ?auto_119102 ) ) ( not ( = ?auto_119100 ?auto_119103 ) ) ( not ( = ?auto_119100 ?auto_119104 ) ) ( not ( = ?auto_119100 ?auto_119105 ) ) ( not ( = ?auto_119101 ?auto_119102 ) ) ( not ( = ?auto_119101 ?auto_119103 ) ) ( not ( = ?auto_119101 ?auto_119104 ) ) ( not ( = ?auto_119101 ?auto_119105 ) ) ( not ( = ?auto_119102 ?auto_119103 ) ) ( not ( = ?auto_119102 ?auto_119104 ) ) ( not ( = ?auto_119102 ?auto_119105 ) ) ( not ( = ?auto_119103 ?auto_119104 ) ) ( not ( = ?auto_119103 ?auto_119105 ) ) ( not ( = ?auto_119104 ?auto_119105 ) ) ( ON ?auto_119105 ?auto_119107 ) ( not ( = ?auto_119100 ?auto_119107 ) ) ( not ( = ?auto_119101 ?auto_119107 ) ) ( not ( = ?auto_119102 ?auto_119107 ) ) ( not ( = ?auto_119103 ?auto_119107 ) ) ( not ( = ?auto_119104 ?auto_119107 ) ) ( not ( = ?auto_119105 ?auto_119107 ) ) ( ON ?auto_119104 ?auto_119105 ) ( ON-TABLE ?auto_119106 ) ( ON ?auto_119107 ?auto_119106 ) ( not ( = ?auto_119106 ?auto_119107 ) ) ( not ( = ?auto_119106 ?auto_119105 ) ) ( not ( = ?auto_119106 ?auto_119104 ) ) ( not ( = ?auto_119100 ?auto_119106 ) ) ( not ( = ?auto_119101 ?auto_119106 ) ) ( not ( = ?auto_119102 ?auto_119106 ) ) ( not ( = ?auto_119103 ?auto_119106 ) ) ( ON ?auto_119103 ?auto_119104 ) ( ON ?auto_119102 ?auto_119103 ) ( CLEAR ?auto_119102 ) ( HOLDING ?auto_119101 ) ( CLEAR ?auto_119100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119100 ?auto_119101 )
      ( MAKE-6PILE ?auto_119100 ?auto_119101 ?auto_119102 ?auto_119103 ?auto_119104 ?auto_119105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119108 - BLOCK
      ?auto_119109 - BLOCK
      ?auto_119110 - BLOCK
      ?auto_119111 - BLOCK
      ?auto_119112 - BLOCK
      ?auto_119113 - BLOCK
    )
    :vars
    (
      ?auto_119114 - BLOCK
      ?auto_119115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119108 ) ( not ( = ?auto_119108 ?auto_119109 ) ) ( not ( = ?auto_119108 ?auto_119110 ) ) ( not ( = ?auto_119108 ?auto_119111 ) ) ( not ( = ?auto_119108 ?auto_119112 ) ) ( not ( = ?auto_119108 ?auto_119113 ) ) ( not ( = ?auto_119109 ?auto_119110 ) ) ( not ( = ?auto_119109 ?auto_119111 ) ) ( not ( = ?auto_119109 ?auto_119112 ) ) ( not ( = ?auto_119109 ?auto_119113 ) ) ( not ( = ?auto_119110 ?auto_119111 ) ) ( not ( = ?auto_119110 ?auto_119112 ) ) ( not ( = ?auto_119110 ?auto_119113 ) ) ( not ( = ?auto_119111 ?auto_119112 ) ) ( not ( = ?auto_119111 ?auto_119113 ) ) ( not ( = ?auto_119112 ?auto_119113 ) ) ( ON ?auto_119113 ?auto_119114 ) ( not ( = ?auto_119108 ?auto_119114 ) ) ( not ( = ?auto_119109 ?auto_119114 ) ) ( not ( = ?auto_119110 ?auto_119114 ) ) ( not ( = ?auto_119111 ?auto_119114 ) ) ( not ( = ?auto_119112 ?auto_119114 ) ) ( not ( = ?auto_119113 ?auto_119114 ) ) ( ON ?auto_119112 ?auto_119113 ) ( ON-TABLE ?auto_119115 ) ( ON ?auto_119114 ?auto_119115 ) ( not ( = ?auto_119115 ?auto_119114 ) ) ( not ( = ?auto_119115 ?auto_119113 ) ) ( not ( = ?auto_119115 ?auto_119112 ) ) ( not ( = ?auto_119108 ?auto_119115 ) ) ( not ( = ?auto_119109 ?auto_119115 ) ) ( not ( = ?auto_119110 ?auto_119115 ) ) ( not ( = ?auto_119111 ?auto_119115 ) ) ( ON ?auto_119111 ?auto_119112 ) ( ON ?auto_119110 ?auto_119111 ) ( CLEAR ?auto_119108 ) ( ON ?auto_119109 ?auto_119110 ) ( CLEAR ?auto_119109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119115 ?auto_119114 ?auto_119113 ?auto_119112 ?auto_119111 ?auto_119110 )
      ( MAKE-6PILE ?auto_119108 ?auto_119109 ?auto_119110 ?auto_119111 ?auto_119112 ?auto_119113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119116 - BLOCK
      ?auto_119117 - BLOCK
      ?auto_119118 - BLOCK
      ?auto_119119 - BLOCK
      ?auto_119120 - BLOCK
      ?auto_119121 - BLOCK
    )
    :vars
    (
      ?auto_119122 - BLOCK
      ?auto_119123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119116 ?auto_119117 ) ) ( not ( = ?auto_119116 ?auto_119118 ) ) ( not ( = ?auto_119116 ?auto_119119 ) ) ( not ( = ?auto_119116 ?auto_119120 ) ) ( not ( = ?auto_119116 ?auto_119121 ) ) ( not ( = ?auto_119117 ?auto_119118 ) ) ( not ( = ?auto_119117 ?auto_119119 ) ) ( not ( = ?auto_119117 ?auto_119120 ) ) ( not ( = ?auto_119117 ?auto_119121 ) ) ( not ( = ?auto_119118 ?auto_119119 ) ) ( not ( = ?auto_119118 ?auto_119120 ) ) ( not ( = ?auto_119118 ?auto_119121 ) ) ( not ( = ?auto_119119 ?auto_119120 ) ) ( not ( = ?auto_119119 ?auto_119121 ) ) ( not ( = ?auto_119120 ?auto_119121 ) ) ( ON ?auto_119121 ?auto_119122 ) ( not ( = ?auto_119116 ?auto_119122 ) ) ( not ( = ?auto_119117 ?auto_119122 ) ) ( not ( = ?auto_119118 ?auto_119122 ) ) ( not ( = ?auto_119119 ?auto_119122 ) ) ( not ( = ?auto_119120 ?auto_119122 ) ) ( not ( = ?auto_119121 ?auto_119122 ) ) ( ON ?auto_119120 ?auto_119121 ) ( ON-TABLE ?auto_119123 ) ( ON ?auto_119122 ?auto_119123 ) ( not ( = ?auto_119123 ?auto_119122 ) ) ( not ( = ?auto_119123 ?auto_119121 ) ) ( not ( = ?auto_119123 ?auto_119120 ) ) ( not ( = ?auto_119116 ?auto_119123 ) ) ( not ( = ?auto_119117 ?auto_119123 ) ) ( not ( = ?auto_119118 ?auto_119123 ) ) ( not ( = ?auto_119119 ?auto_119123 ) ) ( ON ?auto_119119 ?auto_119120 ) ( ON ?auto_119118 ?auto_119119 ) ( ON ?auto_119117 ?auto_119118 ) ( CLEAR ?auto_119117 ) ( HOLDING ?auto_119116 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119116 )
      ( MAKE-6PILE ?auto_119116 ?auto_119117 ?auto_119118 ?auto_119119 ?auto_119120 ?auto_119121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119124 - BLOCK
      ?auto_119125 - BLOCK
      ?auto_119126 - BLOCK
      ?auto_119127 - BLOCK
      ?auto_119128 - BLOCK
      ?auto_119129 - BLOCK
    )
    :vars
    (
      ?auto_119131 - BLOCK
      ?auto_119130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119124 ?auto_119125 ) ) ( not ( = ?auto_119124 ?auto_119126 ) ) ( not ( = ?auto_119124 ?auto_119127 ) ) ( not ( = ?auto_119124 ?auto_119128 ) ) ( not ( = ?auto_119124 ?auto_119129 ) ) ( not ( = ?auto_119125 ?auto_119126 ) ) ( not ( = ?auto_119125 ?auto_119127 ) ) ( not ( = ?auto_119125 ?auto_119128 ) ) ( not ( = ?auto_119125 ?auto_119129 ) ) ( not ( = ?auto_119126 ?auto_119127 ) ) ( not ( = ?auto_119126 ?auto_119128 ) ) ( not ( = ?auto_119126 ?auto_119129 ) ) ( not ( = ?auto_119127 ?auto_119128 ) ) ( not ( = ?auto_119127 ?auto_119129 ) ) ( not ( = ?auto_119128 ?auto_119129 ) ) ( ON ?auto_119129 ?auto_119131 ) ( not ( = ?auto_119124 ?auto_119131 ) ) ( not ( = ?auto_119125 ?auto_119131 ) ) ( not ( = ?auto_119126 ?auto_119131 ) ) ( not ( = ?auto_119127 ?auto_119131 ) ) ( not ( = ?auto_119128 ?auto_119131 ) ) ( not ( = ?auto_119129 ?auto_119131 ) ) ( ON ?auto_119128 ?auto_119129 ) ( ON-TABLE ?auto_119130 ) ( ON ?auto_119131 ?auto_119130 ) ( not ( = ?auto_119130 ?auto_119131 ) ) ( not ( = ?auto_119130 ?auto_119129 ) ) ( not ( = ?auto_119130 ?auto_119128 ) ) ( not ( = ?auto_119124 ?auto_119130 ) ) ( not ( = ?auto_119125 ?auto_119130 ) ) ( not ( = ?auto_119126 ?auto_119130 ) ) ( not ( = ?auto_119127 ?auto_119130 ) ) ( ON ?auto_119127 ?auto_119128 ) ( ON ?auto_119126 ?auto_119127 ) ( ON ?auto_119125 ?auto_119126 ) ( ON ?auto_119124 ?auto_119125 ) ( CLEAR ?auto_119124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119130 ?auto_119131 ?auto_119129 ?auto_119128 ?auto_119127 ?auto_119126 ?auto_119125 )
      ( MAKE-6PILE ?auto_119124 ?auto_119125 ?auto_119126 ?auto_119127 ?auto_119128 ?auto_119129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119133 - BLOCK
    )
    :vars
    (
      ?auto_119134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119134 ?auto_119133 ) ( CLEAR ?auto_119134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119133 ) ( not ( = ?auto_119133 ?auto_119134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119134 ?auto_119133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119135 - BLOCK
    )
    :vars
    (
      ?auto_119136 - BLOCK
      ?auto_119137 - BLOCK
      ?auto_119138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119136 ?auto_119135 ) ( CLEAR ?auto_119136 ) ( ON-TABLE ?auto_119135 ) ( not ( = ?auto_119135 ?auto_119136 ) ) ( HOLDING ?auto_119137 ) ( CLEAR ?auto_119138 ) ( not ( = ?auto_119135 ?auto_119137 ) ) ( not ( = ?auto_119135 ?auto_119138 ) ) ( not ( = ?auto_119136 ?auto_119137 ) ) ( not ( = ?auto_119136 ?auto_119138 ) ) ( not ( = ?auto_119137 ?auto_119138 ) ) )
    :subtasks
    ( ( !STACK ?auto_119137 ?auto_119138 )
      ( MAKE-1PILE ?auto_119135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119139 - BLOCK
    )
    :vars
    (
      ?auto_119142 - BLOCK
      ?auto_119140 - BLOCK
      ?auto_119141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119142 ?auto_119139 ) ( ON-TABLE ?auto_119139 ) ( not ( = ?auto_119139 ?auto_119142 ) ) ( CLEAR ?auto_119140 ) ( not ( = ?auto_119139 ?auto_119141 ) ) ( not ( = ?auto_119139 ?auto_119140 ) ) ( not ( = ?auto_119142 ?auto_119141 ) ) ( not ( = ?auto_119142 ?auto_119140 ) ) ( not ( = ?auto_119141 ?auto_119140 ) ) ( ON ?auto_119141 ?auto_119142 ) ( CLEAR ?auto_119141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119139 ?auto_119142 )
      ( MAKE-1PILE ?auto_119139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119143 - BLOCK
    )
    :vars
    (
      ?auto_119146 - BLOCK
      ?auto_119145 - BLOCK
      ?auto_119144 - BLOCK
      ?auto_119148 - BLOCK
      ?auto_119147 - BLOCK
      ?auto_119149 - BLOCK
      ?auto_119150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119146 ?auto_119143 ) ( ON-TABLE ?auto_119143 ) ( not ( = ?auto_119143 ?auto_119146 ) ) ( not ( = ?auto_119143 ?auto_119145 ) ) ( not ( = ?auto_119143 ?auto_119144 ) ) ( not ( = ?auto_119146 ?auto_119145 ) ) ( not ( = ?auto_119146 ?auto_119144 ) ) ( not ( = ?auto_119145 ?auto_119144 ) ) ( ON ?auto_119145 ?auto_119146 ) ( CLEAR ?auto_119145 ) ( HOLDING ?auto_119144 ) ( CLEAR ?auto_119148 ) ( ON-TABLE ?auto_119147 ) ( ON ?auto_119149 ?auto_119147 ) ( ON ?auto_119150 ?auto_119149 ) ( ON ?auto_119148 ?auto_119150 ) ( not ( = ?auto_119147 ?auto_119149 ) ) ( not ( = ?auto_119147 ?auto_119150 ) ) ( not ( = ?auto_119147 ?auto_119148 ) ) ( not ( = ?auto_119147 ?auto_119144 ) ) ( not ( = ?auto_119149 ?auto_119150 ) ) ( not ( = ?auto_119149 ?auto_119148 ) ) ( not ( = ?auto_119149 ?auto_119144 ) ) ( not ( = ?auto_119150 ?auto_119148 ) ) ( not ( = ?auto_119150 ?auto_119144 ) ) ( not ( = ?auto_119148 ?auto_119144 ) ) ( not ( = ?auto_119143 ?auto_119148 ) ) ( not ( = ?auto_119143 ?auto_119147 ) ) ( not ( = ?auto_119143 ?auto_119149 ) ) ( not ( = ?auto_119143 ?auto_119150 ) ) ( not ( = ?auto_119146 ?auto_119148 ) ) ( not ( = ?auto_119146 ?auto_119147 ) ) ( not ( = ?auto_119146 ?auto_119149 ) ) ( not ( = ?auto_119146 ?auto_119150 ) ) ( not ( = ?auto_119145 ?auto_119148 ) ) ( not ( = ?auto_119145 ?auto_119147 ) ) ( not ( = ?auto_119145 ?auto_119149 ) ) ( not ( = ?auto_119145 ?auto_119150 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119147 ?auto_119149 ?auto_119150 ?auto_119148 ?auto_119144 )
      ( MAKE-1PILE ?auto_119143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119151 - BLOCK
    )
    :vars
    (
      ?auto_119153 - BLOCK
      ?auto_119157 - BLOCK
      ?auto_119156 - BLOCK
      ?auto_119154 - BLOCK
      ?auto_119152 - BLOCK
      ?auto_119158 - BLOCK
      ?auto_119155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119153 ?auto_119151 ) ( ON-TABLE ?auto_119151 ) ( not ( = ?auto_119151 ?auto_119153 ) ) ( not ( = ?auto_119151 ?auto_119157 ) ) ( not ( = ?auto_119151 ?auto_119156 ) ) ( not ( = ?auto_119153 ?auto_119157 ) ) ( not ( = ?auto_119153 ?auto_119156 ) ) ( not ( = ?auto_119157 ?auto_119156 ) ) ( ON ?auto_119157 ?auto_119153 ) ( CLEAR ?auto_119154 ) ( ON-TABLE ?auto_119152 ) ( ON ?auto_119158 ?auto_119152 ) ( ON ?auto_119155 ?auto_119158 ) ( ON ?auto_119154 ?auto_119155 ) ( not ( = ?auto_119152 ?auto_119158 ) ) ( not ( = ?auto_119152 ?auto_119155 ) ) ( not ( = ?auto_119152 ?auto_119154 ) ) ( not ( = ?auto_119152 ?auto_119156 ) ) ( not ( = ?auto_119158 ?auto_119155 ) ) ( not ( = ?auto_119158 ?auto_119154 ) ) ( not ( = ?auto_119158 ?auto_119156 ) ) ( not ( = ?auto_119155 ?auto_119154 ) ) ( not ( = ?auto_119155 ?auto_119156 ) ) ( not ( = ?auto_119154 ?auto_119156 ) ) ( not ( = ?auto_119151 ?auto_119154 ) ) ( not ( = ?auto_119151 ?auto_119152 ) ) ( not ( = ?auto_119151 ?auto_119158 ) ) ( not ( = ?auto_119151 ?auto_119155 ) ) ( not ( = ?auto_119153 ?auto_119154 ) ) ( not ( = ?auto_119153 ?auto_119152 ) ) ( not ( = ?auto_119153 ?auto_119158 ) ) ( not ( = ?auto_119153 ?auto_119155 ) ) ( not ( = ?auto_119157 ?auto_119154 ) ) ( not ( = ?auto_119157 ?auto_119152 ) ) ( not ( = ?auto_119157 ?auto_119158 ) ) ( not ( = ?auto_119157 ?auto_119155 ) ) ( ON ?auto_119156 ?auto_119157 ) ( CLEAR ?auto_119156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119151 ?auto_119153 ?auto_119157 )
      ( MAKE-1PILE ?auto_119151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119159 - BLOCK
    )
    :vars
    (
      ?auto_119161 - BLOCK
      ?auto_119166 - BLOCK
      ?auto_119160 - BLOCK
      ?auto_119165 - BLOCK
      ?auto_119162 - BLOCK
      ?auto_119163 - BLOCK
      ?auto_119164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119161 ?auto_119159 ) ( ON-TABLE ?auto_119159 ) ( not ( = ?auto_119159 ?auto_119161 ) ) ( not ( = ?auto_119159 ?auto_119166 ) ) ( not ( = ?auto_119159 ?auto_119160 ) ) ( not ( = ?auto_119161 ?auto_119166 ) ) ( not ( = ?auto_119161 ?auto_119160 ) ) ( not ( = ?auto_119166 ?auto_119160 ) ) ( ON ?auto_119166 ?auto_119161 ) ( ON-TABLE ?auto_119165 ) ( ON ?auto_119162 ?auto_119165 ) ( ON ?auto_119163 ?auto_119162 ) ( not ( = ?auto_119165 ?auto_119162 ) ) ( not ( = ?auto_119165 ?auto_119163 ) ) ( not ( = ?auto_119165 ?auto_119164 ) ) ( not ( = ?auto_119165 ?auto_119160 ) ) ( not ( = ?auto_119162 ?auto_119163 ) ) ( not ( = ?auto_119162 ?auto_119164 ) ) ( not ( = ?auto_119162 ?auto_119160 ) ) ( not ( = ?auto_119163 ?auto_119164 ) ) ( not ( = ?auto_119163 ?auto_119160 ) ) ( not ( = ?auto_119164 ?auto_119160 ) ) ( not ( = ?auto_119159 ?auto_119164 ) ) ( not ( = ?auto_119159 ?auto_119165 ) ) ( not ( = ?auto_119159 ?auto_119162 ) ) ( not ( = ?auto_119159 ?auto_119163 ) ) ( not ( = ?auto_119161 ?auto_119164 ) ) ( not ( = ?auto_119161 ?auto_119165 ) ) ( not ( = ?auto_119161 ?auto_119162 ) ) ( not ( = ?auto_119161 ?auto_119163 ) ) ( not ( = ?auto_119166 ?auto_119164 ) ) ( not ( = ?auto_119166 ?auto_119165 ) ) ( not ( = ?auto_119166 ?auto_119162 ) ) ( not ( = ?auto_119166 ?auto_119163 ) ) ( ON ?auto_119160 ?auto_119166 ) ( CLEAR ?auto_119160 ) ( HOLDING ?auto_119164 ) ( CLEAR ?auto_119163 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119165 ?auto_119162 ?auto_119163 ?auto_119164 )
      ( MAKE-1PILE ?auto_119159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119167 - BLOCK
    )
    :vars
    (
      ?auto_119174 - BLOCK
      ?auto_119168 - BLOCK
      ?auto_119173 - BLOCK
      ?auto_119171 - BLOCK
      ?auto_119172 - BLOCK
      ?auto_119169 - BLOCK
      ?auto_119170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119174 ?auto_119167 ) ( ON-TABLE ?auto_119167 ) ( not ( = ?auto_119167 ?auto_119174 ) ) ( not ( = ?auto_119167 ?auto_119168 ) ) ( not ( = ?auto_119167 ?auto_119173 ) ) ( not ( = ?auto_119174 ?auto_119168 ) ) ( not ( = ?auto_119174 ?auto_119173 ) ) ( not ( = ?auto_119168 ?auto_119173 ) ) ( ON ?auto_119168 ?auto_119174 ) ( ON-TABLE ?auto_119171 ) ( ON ?auto_119172 ?auto_119171 ) ( ON ?auto_119169 ?auto_119172 ) ( not ( = ?auto_119171 ?auto_119172 ) ) ( not ( = ?auto_119171 ?auto_119169 ) ) ( not ( = ?auto_119171 ?auto_119170 ) ) ( not ( = ?auto_119171 ?auto_119173 ) ) ( not ( = ?auto_119172 ?auto_119169 ) ) ( not ( = ?auto_119172 ?auto_119170 ) ) ( not ( = ?auto_119172 ?auto_119173 ) ) ( not ( = ?auto_119169 ?auto_119170 ) ) ( not ( = ?auto_119169 ?auto_119173 ) ) ( not ( = ?auto_119170 ?auto_119173 ) ) ( not ( = ?auto_119167 ?auto_119170 ) ) ( not ( = ?auto_119167 ?auto_119171 ) ) ( not ( = ?auto_119167 ?auto_119172 ) ) ( not ( = ?auto_119167 ?auto_119169 ) ) ( not ( = ?auto_119174 ?auto_119170 ) ) ( not ( = ?auto_119174 ?auto_119171 ) ) ( not ( = ?auto_119174 ?auto_119172 ) ) ( not ( = ?auto_119174 ?auto_119169 ) ) ( not ( = ?auto_119168 ?auto_119170 ) ) ( not ( = ?auto_119168 ?auto_119171 ) ) ( not ( = ?auto_119168 ?auto_119172 ) ) ( not ( = ?auto_119168 ?auto_119169 ) ) ( ON ?auto_119173 ?auto_119168 ) ( CLEAR ?auto_119169 ) ( ON ?auto_119170 ?auto_119173 ) ( CLEAR ?auto_119170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119167 ?auto_119174 ?auto_119168 ?auto_119173 )
      ( MAKE-1PILE ?auto_119167 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119175 - BLOCK
    )
    :vars
    (
      ?auto_119182 - BLOCK
      ?auto_119181 - BLOCK
      ?auto_119179 - BLOCK
      ?auto_119177 - BLOCK
      ?auto_119176 - BLOCK
      ?auto_119178 - BLOCK
      ?auto_119180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119182 ?auto_119175 ) ( ON-TABLE ?auto_119175 ) ( not ( = ?auto_119175 ?auto_119182 ) ) ( not ( = ?auto_119175 ?auto_119181 ) ) ( not ( = ?auto_119175 ?auto_119179 ) ) ( not ( = ?auto_119182 ?auto_119181 ) ) ( not ( = ?auto_119182 ?auto_119179 ) ) ( not ( = ?auto_119181 ?auto_119179 ) ) ( ON ?auto_119181 ?auto_119182 ) ( ON-TABLE ?auto_119177 ) ( ON ?auto_119176 ?auto_119177 ) ( not ( = ?auto_119177 ?auto_119176 ) ) ( not ( = ?auto_119177 ?auto_119178 ) ) ( not ( = ?auto_119177 ?auto_119180 ) ) ( not ( = ?auto_119177 ?auto_119179 ) ) ( not ( = ?auto_119176 ?auto_119178 ) ) ( not ( = ?auto_119176 ?auto_119180 ) ) ( not ( = ?auto_119176 ?auto_119179 ) ) ( not ( = ?auto_119178 ?auto_119180 ) ) ( not ( = ?auto_119178 ?auto_119179 ) ) ( not ( = ?auto_119180 ?auto_119179 ) ) ( not ( = ?auto_119175 ?auto_119180 ) ) ( not ( = ?auto_119175 ?auto_119177 ) ) ( not ( = ?auto_119175 ?auto_119176 ) ) ( not ( = ?auto_119175 ?auto_119178 ) ) ( not ( = ?auto_119182 ?auto_119180 ) ) ( not ( = ?auto_119182 ?auto_119177 ) ) ( not ( = ?auto_119182 ?auto_119176 ) ) ( not ( = ?auto_119182 ?auto_119178 ) ) ( not ( = ?auto_119181 ?auto_119180 ) ) ( not ( = ?auto_119181 ?auto_119177 ) ) ( not ( = ?auto_119181 ?auto_119176 ) ) ( not ( = ?auto_119181 ?auto_119178 ) ) ( ON ?auto_119179 ?auto_119181 ) ( ON ?auto_119180 ?auto_119179 ) ( CLEAR ?auto_119180 ) ( HOLDING ?auto_119178 ) ( CLEAR ?auto_119176 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119177 ?auto_119176 ?auto_119178 )
      ( MAKE-1PILE ?auto_119175 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119183 - BLOCK
    )
    :vars
    (
      ?auto_119187 - BLOCK
      ?auto_119189 - BLOCK
      ?auto_119188 - BLOCK
      ?auto_119184 - BLOCK
      ?auto_119186 - BLOCK
      ?auto_119190 - BLOCK
      ?auto_119185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119187 ?auto_119183 ) ( ON-TABLE ?auto_119183 ) ( not ( = ?auto_119183 ?auto_119187 ) ) ( not ( = ?auto_119183 ?auto_119189 ) ) ( not ( = ?auto_119183 ?auto_119188 ) ) ( not ( = ?auto_119187 ?auto_119189 ) ) ( not ( = ?auto_119187 ?auto_119188 ) ) ( not ( = ?auto_119189 ?auto_119188 ) ) ( ON ?auto_119189 ?auto_119187 ) ( ON-TABLE ?auto_119184 ) ( ON ?auto_119186 ?auto_119184 ) ( not ( = ?auto_119184 ?auto_119186 ) ) ( not ( = ?auto_119184 ?auto_119190 ) ) ( not ( = ?auto_119184 ?auto_119185 ) ) ( not ( = ?auto_119184 ?auto_119188 ) ) ( not ( = ?auto_119186 ?auto_119190 ) ) ( not ( = ?auto_119186 ?auto_119185 ) ) ( not ( = ?auto_119186 ?auto_119188 ) ) ( not ( = ?auto_119190 ?auto_119185 ) ) ( not ( = ?auto_119190 ?auto_119188 ) ) ( not ( = ?auto_119185 ?auto_119188 ) ) ( not ( = ?auto_119183 ?auto_119185 ) ) ( not ( = ?auto_119183 ?auto_119184 ) ) ( not ( = ?auto_119183 ?auto_119186 ) ) ( not ( = ?auto_119183 ?auto_119190 ) ) ( not ( = ?auto_119187 ?auto_119185 ) ) ( not ( = ?auto_119187 ?auto_119184 ) ) ( not ( = ?auto_119187 ?auto_119186 ) ) ( not ( = ?auto_119187 ?auto_119190 ) ) ( not ( = ?auto_119189 ?auto_119185 ) ) ( not ( = ?auto_119189 ?auto_119184 ) ) ( not ( = ?auto_119189 ?auto_119186 ) ) ( not ( = ?auto_119189 ?auto_119190 ) ) ( ON ?auto_119188 ?auto_119189 ) ( ON ?auto_119185 ?auto_119188 ) ( CLEAR ?auto_119186 ) ( ON ?auto_119190 ?auto_119185 ) ( CLEAR ?auto_119190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119183 ?auto_119187 ?auto_119189 ?auto_119188 ?auto_119185 )
      ( MAKE-1PILE ?auto_119183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119191 - BLOCK
    )
    :vars
    (
      ?auto_119198 - BLOCK
      ?auto_119196 - BLOCK
      ?auto_119193 - BLOCK
      ?auto_119194 - BLOCK
      ?auto_119197 - BLOCK
      ?auto_119192 - BLOCK
      ?auto_119195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119198 ?auto_119191 ) ( ON-TABLE ?auto_119191 ) ( not ( = ?auto_119191 ?auto_119198 ) ) ( not ( = ?auto_119191 ?auto_119196 ) ) ( not ( = ?auto_119191 ?auto_119193 ) ) ( not ( = ?auto_119198 ?auto_119196 ) ) ( not ( = ?auto_119198 ?auto_119193 ) ) ( not ( = ?auto_119196 ?auto_119193 ) ) ( ON ?auto_119196 ?auto_119198 ) ( ON-TABLE ?auto_119194 ) ( not ( = ?auto_119194 ?auto_119197 ) ) ( not ( = ?auto_119194 ?auto_119192 ) ) ( not ( = ?auto_119194 ?auto_119195 ) ) ( not ( = ?auto_119194 ?auto_119193 ) ) ( not ( = ?auto_119197 ?auto_119192 ) ) ( not ( = ?auto_119197 ?auto_119195 ) ) ( not ( = ?auto_119197 ?auto_119193 ) ) ( not ( = ?auto_119192 ?auto_119195 ) ) ( not ( = ?auto_119192 ?auto_119193 ) ) ( not ( = ?auto_119195 ?auto_119193 ) ) ( not ( = ?auto_119191 ?auto_119195 ) ) ( not ( = ?auto_119191 ?auto_119194 ) ) ( not ( = ?auto_119191 ?auto_119197 ) ) ( not ( = ?auto_119191 ?auto_119192 ) ) ( not ( = ?auto_119198 ?auto_119195 ) ) ( not ( = ?auto_119198 ?auto_119194 ) ) ( not ( = ?auto_119198 ?auto_119197 ) ) ( not ( = ?auto_119198 ?auto_119192 ) ) ( not ( = ?auto_119196 ?auto_119195 ) ) ( not ( = ?auto_119196 ?auto_119194 ) ) ( not ( = ?auto_119196 ?auto_119197 ) ) ( not ( = ?auto_119196 ?auto_119192 ) ) ( ON ?auto_119193 ?auto_119196 ) ( ON ?auto_119195 ?auto_119193 ) ( ON ?auto_119192 ?auto_119195 ) ( CLEAR ?auto_119192 ) ( HOLDING ?auto_119197 ) ( CLEAR ?auto_119194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119194 ?auto_119197 )
      ( MAKE-1PILE ?auto_119191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119199 - BLOCK
    )
    :vars
    (
      ?auto_119206 - BLOCK
      ?auto_119201 - BLOCK
      ?auto_119204 - BLOCK
      ?auto_119200 - BLOCK
      ?auto_119205 - BLOCK
      ?auto_119202 - BLOCK
      ?auto_119203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119206 ?auto_119199 ) ( ON-TABLE ?auto_119199 ) ( not ( = ?auto_119199 ?auto_119206 ) ) ( not ( = ?auto_119199 ?auto_119201 ) ) ( not ( = ?auto_119199 ?auto_119204 ) ) ( not ( = ?auto_119206 ?auto_119201 ) ) ( not ( = ?auto_119206 ?auto_119204 ) ) ( not ( = ?auto_119201 ?auto_119204 ) ) ( ON ?auto_119201 ?auto_119206 ) ( ON-TABLE ?auto_119200 ) ( not ( = ?auto_119200 ?auto_119205 ) ) ( not ( = ?auto_119200 ?auto_119202 ) ) ( not ( = ?auto_119200 ?auto_119203 ) ) ( not ( = ?auto_119200 ?auto_119204 ) ) ( not ( = ?auto_119205 ?auto_119202 ) ) ( not ( = ?auto_119205 ?auto_119203 ) ) ( not ( = ?auto_119205 ?auto_119204 ) ) ( not ( = ?auto_119202 ?auto_119203 ) ) ( not ( = ?auto_119202 ?auto_119204 ) ) ( not ( = ?auto_119203 ?auto_119204 ) ) ( not ( = ?auto_119199 ?auto_119203 ) ) ( not ( = ?auto_119199 ?auto_119200 ) ) ( not ( = ?auto_119199 ?auto_119205 ) ) ( not ( = ?auto_119199 ?auto_119202 ) ) ( not ( = ?auto_119206 ?auto_119203 ) ) ( not ( = ?auto_119206 ?auto_119200 ) ) ( not ( = ?auto_119206 ?auto_119205 ) ) ( not ( = ?auto_119206 ?auto_119202 ) ) ( not ( = ?auto_119201 ?auto_119203 ) ) ( not ( = ?auto_119201 ?auto_119200 ) ) ( not ( = ?auto_119201 ?auto_119205 ) ) ( not ( = ?auto_119201 ?auto_119202 ) ) ( ON ?auto_119204 ?auto_119201 ) ( ON ?auto_119203 ?auto_119204 ) ( ON ?auto_119202 ?auto_119203 ) ( CLEAR ?auto_119200 ) ( ON ?auto_119205 ?auto_119202 ) ( CLEAR ?auto_119205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119199 ?auto_119206 ?auto_119201 ?auto_119204 ?auto_119203 ?auto_119202 )
      ( MAKE-1PILE ?auto_119199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119207 - BLOCK
    )
    :vars
    (
      ?auto_119210 - BLOCK
      ?auto_119212 - BLOCK
      ?auto_119208 - BLOCK
      ?auto_119214 - BLOCK
      ?auto_119209 - BLOCK
      ?auto_119213 - BLOCK
      ?auto_119211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119210 ?auto_119207 ) ( ON-TABLE ?auto_119207 ) ( not ( = ?auto_119207 ?auto_119210 ) ) ( not ( = ?auto_119207 ?auto_119212 ) ) ( not ( = ?auto_119207 ?auto_119208 ) ) ( not ( = ?auto_119210 ?auto_119212 ) ) ( not ( = ?auto_119210 ?auto_119208 ) ) ( not ( = ?auto_119212 ?auto_119208 ) ) ( ON ?auto_119212 ?auto_119210 ) ( not ( = ?auto_119214 ?auto_119209 ) ) ( not ( = ?auto_119214 ?auto_119213 ) ) ( not ( = ?auto_119214 ?auto_119211 ) ) ( not ( = ?auto_119214 ?auto_119208 ) ) ( not ( = ?auto_119209 ?auto_119213 ) ) ( not ( = ?auto_119209 ?auto_119211 ) ) ( not ( = ?auto_119209 ?auto_119208 ) ) ( not ( = ?auto_119213 ?auto_119211 ) ) ( not ( = ?auto_119213 ?auto_119208 ) ) ( not ( = ?auto_119211 ?auto_119208 ) ) ( not ( = ?auto_119207 ?auto_119211 ) ) ( not ( = ?auto_119207 ?auto_119214 ) ) ( not ( = ?auto_119207 ?auto_119209 ) ) ( not ( = ?auto_119207 ?auto_119213 ) ) ( not ( = ?auto_119210 ?auto_119211 ) ) ( not ( = ?auto_119210 ?auto_119214 ) ) ( not ( = ?auto_119210 ?auto_119209 ) ) ( not ( = ?auto_119210 ?auto_119213 ) ) ( not ( = ?auto_119212 ?auto_119211 ) ) ( not ( = ?auto_119212 ?auto_119214 ) ) ( not ( = ?auto_119212 ?auto_119209 ) ) ( not ( = ?auto_119212 ?auto_119213 ) ) ( ON ?auto_119208 ?auto_119212 ) ( ON ?auto_119211 ?auto_119208 ) ( ON ?auto_119213 ?auto_119211 ) ( ON ?auto_119209 ?auto_119213 ) ( CLEAR ?auto_119209 ) ( HOLDING ?auto_119214 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119214 )
      ( MAKE-1PILE ?auto_119207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119215 - BLOCK
    )
    :vars
    (
      ?auto_119218 - BLOCK
      ?auto_119221 - BLOCK
      ?auto_119216 - BLOCK
      ?auto_119220 - BLOCK
      ?auto_119217 - BLOCK
      ?auto_119222 - BLOCK
      ?auto_119219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119218 ?auto_119215 ) ( ON-TABLE ?auto_119215 ) ( not ( = ?auto_119215 ?auto_119218 ) ) ( not ( = ?auto_119215 ?auto_119221 ) ) ( not ( = ?auto_119215 ?auto_119216 ) ) ( not ( = ?auto_119218 ?auto_119221 ) ) ( not ( = ?auto_119218 ?auto_119216 ) ) ( not ( = ?auto_119221 ?auto_119216 ) ) ( ON ?auto_119221 ?auto_119218 ) ( not ( = ?auto_119220 ?auto_119217 ) ) ( not ( = ?auto_119220 ?auto_119222 ) ) ( not ( = ?auto_119220 ?auto_119219 ) ) ( not ( = ?auto_119220 ?auto_119216 ) ) ( not ( = ?auto_119217 ?auto_119222 ) ) ( not ( = ?auto_119217 ?auto_119219 ) ) ( not ( = ?auto_119217 ?auto_119216 ) ) ( not ( = ?auto_119222 ?auto_119219 ) ) ( not ( = ?auto_119222 ?auto_119216 ) ) ( not ( = ?auto_119219 ?auto_119216 ) ) ( not ( = ?auto_119215 ?auto_119219 ) ) ( not ( = ?auto_119215 ?auto_119220 ) ) ( not ( = ?auto_119215 ?auto_119217 ) ) ( not ( = ?auto_119215 ?auto_119222 ) ) ( not ( = ?auto_119218 ?auto_119219 ) ) ( not ( = ?auto_119218 ?auto_119220 ) ) ( not ( = ?auto_119218 ?auto_119217 ) ) ( not ( = ?auto_119218 ?auto_119222 ) ) ( not ( = ?auto_119221 ?auto_119219 ) ) ( not ( = ?auto_119221 ?auto_119220 ) ) ( not ( = ?auto_119221 ?auto_119217 ) ) ( not ( = ?auto_119221 ?auto_119222 ) ) ( ON ?auto_119216 ?auto_119221 ) ( ON ?auto_119219 ?auto_119216 ) ( ON ?auto_119222 ?auto_119219 ) ( ON ?auto_119217 ?auto_119222 ) ( ON ?auto_119220 ?auto_119217 ) ( CLEAR ?auto_119220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119215 ?auto_119218 ?auto_119221 ?auto_119216 ?auto_119219 ?auto_119222 ?auto_119217 )
      ( MAKE-1PILE ?auto_119215 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119230 - BLOCK
      ?auto_119231 - BLOCK
      ?auto_119232 - BLOCK
      ?auto_119233 - BLOCK
      ?auto_119234 - BLOCK
      ?auto_119235 - BLOCK
      ?auto_119236 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_119236 ) ( CLEAR ?auto_119235 ) ( ON-TABLE ?auto_119230 ) ( ON ?auto_119231 ?auto_119230 ) ( ON ?auto_119232 ?auto_119231 ) ( ON ?auto_119233 ?auto_119232 ) ( ON ?auto_119234 ?auto_119233 ) ( ON ?auto_119235 ?auto_119234 ) ( not ( = ?auto_119230 ?auto_119231 ) ) ( not ( = ?auto_119230 ?auto_119232 ) ) ( not ( = ?auto_119230 ?auto_119233 ) ) ( not ( = ?auto_119230 ?auto_119234 ) ) ( not ( = ?auto_119230 ?auto_119235 ) ) ( not ( = ?auto_119230 ?auto_119236 ) ) ( not ( = ?auto_119231 ?auto_119232 ) ) ( not ( = ?auto_119231 ?auto_119233 ) ) ( not ( = ?auto_119231 ?auto_119234 ) ) ( not ( = ?auto_119231 ?auto_119235 ) ) ( not ( = ?auto_119231 ?auto_119236 ) ) ( not ( = ?auto_119232 ?auto_119233 ) ) ( not ( = ?auto_119232 ?auto_119234 ) ) ( not ( = ?auto_119232 ?auto_119235 ) ) ( not ( = ?auto_119232 ?auto_119236 ) ) ( not ( = ?auto_119233 ?auto_119234 ) ) ( not ( = ?auto_119233 ?auto_119235 ) ) ( not ( = ?auto_119233 ?auto_119236 ) ) ( not ( = ?auto_119234 ?auto_119235 ) ) ( not ( = ?auto_119234 ?auto_119236 ) ) ( not ( = ?auto_119235 ?auto_119236 ) ) )
    :subtasks
    ( ( !STACK ?auto_119236 ?auto_119235 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119237 - BLOCK
      ?auto_119238 - BLOCK
      ?auto_119239 - BLOCK
      ?auto_119240 - BLOCK
      ?auto_119241 - BLOCK
      ?auto_119242 - BLOCK
      ?auto_119243 - BLOCK
    )
    :vars
    (
      ?auto_119244 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119242 ) ( ON-TABLE ?auto_119237 ) ( ON ?auto_119238 ?auto_119237 ) ( ON ?auto_119239 ?auto_119238 ) ( ON ?auto_119240 ?auto_119239 ) ( ON ?auto_119241 ?auto_119240 ) ( ON ?auto_119242 ?auto_119241 ) ( not ( = ?auto_119237 ?auto_119238 ) ) ( not ( = ?auto_119237 ?auto_119239 ) ) ( not ( = ?auto_119237 ?auto_119240 ) ) ( not ( = ?auto_119237 ?auto_119241 ) ) ( not ( = ?auto_119237 ?auto_119242 ) ) ( not ( = ?auto_119237 ?auto_119243 ) ) ( not ( = ?auto_119238 ?auto_119239 ) ) ( not ( = ?auto_119238 ?auto_119240 ) ) ( not ( = ?auto_119238 ?auto_119241 ) ) ( not ( = ?auto_119238 ?auto_119242 ) ) ( not ( = ?auto_119238 ?auto_119243 ) ) ( not ( = ?auto_119239 ?auto_119240 ) ) ( not ( = ?auto_119239 ?auto_119241 ) ) ( not ( = ?auto_119239 ?auto_119242 ) ) ( not ( = ?auto_119239 ?auto_119243 ) ) ( not ( = ?auto_119240 ?auto_119241 ) ) ( not ( = ?auto_119240 ?auto_119242 ) ) ( not ( = ?auto_119240 ?auto_119243 ) ) ( not ( = ?auto_119241 ?auto_119242 ) ) ( not ( = ?auto_119241 ?auto_119243 ) ) ( not ( = ?auto_119242 ?auto_119243 ) ) ( ON ?auto_119243 ?auto_119244 ) ( CLEAR ?auto_119243 ) ( HAND-EMPTY ) ( not ( = ?auto_119237 ?auto_119244 ) ) ( not ( = ?auto_119238 ?auto_119244 ) ) ( not ( = ?auto_119239 ?auto_119244 ) ) ( not ( = ?auto_119240 ?auto_119244 ) ) ( not ( = ?auto_119241 ?auto_119244 ) ) ( not ( = ?auto_119242 ?auto_119244 ) ) ( not ( = ?auto_119243 ?auto_119244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119243 ?auto_119244 )
      ( MAKE-7PILE ?auto_119237 ?auto_119238 ?auto_119239 ?auto_119240 ?auto_119241 ?auto_119242 ?auto_119243 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119245 - BLOCK
      ?auto_119246 - BLOCK
      ?auto_119247 - BLOCK
      ?auto_119248 - BLOCK
      ?auto_119249 - BLOCK
      ?auto_119250 - BLOCK
      ?auto_119251 - BLOCK
    )
    :vars
    (
      ?auto_119252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119245 ) ( ON ?auto_119246 ?auto_119245 ) ( ON ?auto_119247 ?auto_119246 ) ( ON ?auto_119248 ?auto_119247 ) ( ON ?auto_119249 ?auto_119248 ) ( not ( = ?auto_119245 ?auto_119246 ) ) ( not ( = ?auto_119245 ?auto_119247 ) ) ( not ( = ?auto_119245 ?auto_119248 ) ) ( not ( = ?auto_119245 ?auto_119249 ) ) ( not ( = ?auto_119245 ?auto_119250 ) ) ( not ( = ?auto_119245 ?auto_119251 ) ) ( not ( = ?auto_119246 ?auto_119247 ) ) ( not ( = ?auto_119246 ?auto_119248 ) ) ( not ( = ?auto_119246 ?auto_119249 ) ) ( not ( = ?auto_119246 ?auto_119250 ) ) ( not ( = ?auto_119246 ?auto_119251 ) ) ( not ( = ?auto_119247 ?auto_119248 ) ) ( not ( = ?auto_119247 ?auto_119249 ) ) ( not ( = ?auto_119247 ?auto_119250 ) ) ( not ( = ?auto_119247 ?auto_119251 ) ) ( not ( = ?auto_119248 ?auto_119249 ) ) ( not ( = ?auto_119248 ?auto_119250 ) ) ( not ( = ?auto_119248 ?auto_119251 ) ) ( not ( = ?auto_119249 ?auto_119250 ) ) ( not ( = ?auto_119249 ?auto_119251 ) ) ( not ( = ?auto_119250 ?auto_119251 ) ) ( ON ?auto_119251 ?auto_119252 ) ( CLEAR ?auto_119251 ) ( not ( = ?auto_119245 ?auto_119252 ) ) ( not ( = ?auto_119246 ?auto_119252 ) ) ( not ( = ?auto_119247 ?auto_119252 ) ) ( not ( = ?auto_119248 ?auto_119252 ) ) ( not ( = ?auto_119249 ?auto_119252 ) ) ( not ( = ?auto_119250 ?auto_119252 ) ) ( not ( = ?auto_119251 ?auto_119252 ) ) ( HOLDING ?auto_119250 ) ( CLEAR ?auto_119249 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119245 ?auto_119246 ?auto_119247 ?auto_119248 ?auto_119249 ?auto_119250 )
      ( MAKE-7PILE ?auto_119245 ?auto_119246 ?auto_119247 ?auto_119248 ?auto_119249 ?auto_119250 ?auto_119251 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119253 - BLOCK
      ?auto_119254 - BLOCK
      ?auto_119255 - BLOCK
      ?auto_119256 - BLOCK
      ?auto_119257 - BLOCK
      ?auto_119258 - BLOCK
      ?auto_119259 - BLOCK
    )
    :vars
    (
      ?auto_119260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119253 ) ( ON ?auto_119254 ?auto_119253 ) ( ON ?auto_119255 ?auto_119254 ) ( ON ?auto_119256 ?auto_119255 ) ( ON ?auto_119257 ?auto_119256 ) ( not ( = ?auto_119253 ?auto_119254 ) ) ( not ( = ?auto_119253 ?auto_119255 ) ) ( not ( = ?auto_119253 ?auto_119256 ) ) ( not ( = ?auto_119253 ?auto_119257 ) ) ( not ( = ?auto_119253 ?auto_119258 ) ) ( not ( = ?auto_119253 ?auto_119259 ) ) ( not ( = ?auto_119254 ?auto_119255 ) ) ( not ( = ?auto_119254 ?auto_119256 ) ) ( not ( = ?auto_119254 ?auto_119257 ) ) ( not ( = ?auto_119254 ?auto_119258 ) ) ( not ( = ?auto_119254 ?auto_119259 ) ) ( not ( = ?auto_119255 ?auto_119256 ) ) ( not ( = ?auto_119255 ?auto_119257 ) ) ( not ( = ?auto_119255 ?auto_119258 ) ) ( not ( = ?auto_119255 ?auto_119259 ) ) ( not ( = ?auto_119256 ?auto_119257 ) ) ( not ( = ?auto_119256 ?auto_119258 ) ) ( not ( = ?auto_119256 ?auto_119259 ) ) ( not ( = ?auto_119257 ?auto_119258 ) ) ( not ( = ?auto_119257 ?auto_119259 ) ) ( not ( = ?auto_119258 ?auto_119259 ) ) ( ON ?auto_119259 ?auto_119260 ) ( not ( = ?auto_119253 ?auto_119260 ) ) ( not ( = ?auto_119254 ?auto_119260 ) ) ( not ( = ?auto_119255 ?auto_119260 ) ) ( not ( = ?auto_119256 ?auto_119260 ) ) ( not ( = ?auto_119257 ?auto_119260 ) ) ( not ( = ?auto_119258 ?auto_119260 ) ) ( not ( = ?auto_119259 ?auto_119260 ) ) ( CLEAR ?auto_119257 ) ( ON ?auto_119258 ?auto_119259 ) ( CLEAR ?auto_119258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119260 ?auto_119259 )
      ( MAKE-7PILE ?auto_119253 ?auto_119254 ?auto_119255 ?auto_119256 ?auto_119257 ?auto_119258 ?auto_119259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119261 - BLOCK
      ?auto_119262 - BLOCK
      ?auto_119263 - BLOCK
      ?auto_119264 - BLOCK
      ?auto_119265 - BLOCK
      ?auto_119266 - BLOCK
      ?auto_119267 - BLOCK
    )
    :vars
    (
      ?auto_119268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119261 ) ( ON ?auto_119262 ?auto_119261 ) ( ON ?auto_119263 ?auto_119262 ) ( ON ?auto_119264 ?auto_119263 ) ( not ( = ?auto_119261 ?auto_119262 ) ) ( not ( = ?auto_119261 ?auto_119263 ) ) ( not ( = ?auto_119261 ?auto_119264 ) ) ( not ( = ?auto_119261 ?auto_119265 ) ) ( not ( = ?auto_119261 ?auto_119266 ) ) ( not ( = ?auto_119261 ?auto_119267 ) ) ( not ( = ?auto_119262 ?auto_119263 ) ) ( not ( = ?auto_119262 ?auto_119264 ) ) ( not ( = ?auto_119262 ?auto_119265 ) ) ( not ( = ?auto_119262 ?auto_119266 ) ) ( not ( = ?auto_119262 ?auto_119267 ) ) ( not ( = ?auto_119263 ?auto_119264 ) ) ( not ( = ?auto_119263 ?auto_119265 ) ) ( not ( = ?auto_119263 ?auto_119266 ) ) ( not ( = ?auto_119263 ?auto_119267 ) ) ( not ( = ?auto_119264 ?auto_119265 ) ) ( not ( = ?auto_119264 ?auto_119266 ) ) ( not ( = ?auto_119264 ?auto_119267 ) ) ( not ( = ?auto_119265 ?auto_119266 ) ) ( not ( = ?auto_119265 ?auto_119267 ) ) ( not ( = ?auto_119266 ?auto_119267 ) ) ( ON ?auto_119267 ?auto_119268 ) ( not ( = ?auto_119261 ?auto_119268 ) ) ( not ( = ?auto_119262 ?auto_119268 ) ) ( not ( = ?auto_119263 ?auto_119268 ) ) ( not ( = ?auto_119264 ?auto_119268 ) ) ( not ( = ?auto_119265 ?auto_119268 ) ) ( not ( = ?auto_119266 ?auto_119268 ) ) ( not ( = ?auto_119267 ?auto_119268 ) ) ( ON ?auto_119266 ?auto_119267 ) ( CLEAR ?auto_119266 ) ( ON-TABLE ?auto_119268 ) ( HOLDING ?auto_119265 ) ( CLEAR ?auto_119264 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119261 ?auto_119262 ?auto_119263 ?auto_119264 ?auto_119265 )
      ( MAKE-7PILE ?auto_119261 ?auto_119262 ?auto_119263 ?auto_119264 ?auto_119265 ?auto_119266 ?auto_119267 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119269 - BLOCK
      ?auto_119270 - BLOCK
      ?auto_119271 - BLOCK
      ?auto_119272 - BLOCK
      ?auto_119273 - BLOCK
      ?auto_119274 - BLOCK
      ?auto_119275 - BLOCK
    )
    :vars
    (
      ?auto_119276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119269 ) ( ON ?auto_119270 ?auto_119269 ) ( ON ?auto_119271 ?auto_119270 ) ( ON ?auto_119272 ?auto_119271 ) ( not ( = ?auto_119269 ?auto_119270 ) ) ( not ( = ?auto_119269 ?auto_119271 ) ) ( not ( = ?auto_119269 ?auto_119272 ) ) ( not ( = ?auto_119269 ?auto_119273 ) ) ( not ( = ?auto_119269 ?auto_119274 ) ) ( not ( = ?auto_119269 ?auto_119275 ) ) ( not ( = ?auto_119270 ?auto_119271 ) ) ( not ( = ?auto_119270 ?auto_119272 ) ) ( not ( = ?auto_119270 ?auto_119273 ) ) ( not ( = ?auto_119270 ?auto_119274 ) ) ( not ( = ?auto_119270 ?auto_119275 ) ) ( not ( = ?auto_119271 ?auto_119272 ) ) ( not ( = ?auto_119271 ?auto_119273 ) ) ( not ( = ?auto_119271 ?auto_119274 ) ) ( not ( = ?auto_119271 ?auto_119275 ) ) ( not ( = ?auto_119272 ?auto_119273 ) ) ( not ( = ?auto_119272 ?auto_119274 ) ) ( not ( = ?auto_119272 ?auto_119275 ) ) ( not ( = ?auto_119273 ?auto_119274 ) ) ( not ( = ?auto_119273 ?auto_119275 ) ) ( not ( = ?auto_119274 ?auto_119275 ) ) ( ON ?auto_119275 ?auto_119276 ) ( not ( = ?auto_119269 ?auto_119276 ) ) ( not ( = ?auto_119270 ?auto_119276 ) ) ( not ( = ?auto_119271 ?auto_119276 ) ) ( not ( = ?auto_119272 ?auto_119276 ) ) ( not ( = ?auto_119273 ?auto_119276 ) ) ( not ( = ?auto_119274 ?auto_119276 ) ) ( not ( = ?auto_119275 ?auto_119276 ) ) ( ON ?auto_119274 ?auto_119275 ) ( ON-TABLE ?auto_119276 ) ( CLEAR ?auto_119272 ) ( ON ?auto_119273 ?auto_119274 ) ( CLEAR ?auto_119273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119276 ?auto_119275 ?auto_119274 )
      ( MAKE-7PILE ?auto_119269 ?auto_119270 ?auto_119271 ?auto_119272 ?auto_119273 ?auto_119274 ?auto_119275 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119277 - BLOCK
      ?auto_119278 - BLOCK
      ?auto_119279 - BLOCK
      ?auto_119280 - BLOCK
      ?auto_119281 - BLOCK
      ?auto_119282 - BLOCK
      ?auto_119283 - BLOCK
    )
    :vars
    (
      ?auto_119284 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119277 ) ( ON ?auto_119278 ?auto_119277 ) ( ON ?auto_119279 ?auto_119278 ) ( not ( = ?auto_119277 ?auto_119278 ) ) ( not ( = ?auto_119277 ?auto_119279 ) ) ( not ( = ?auto_119277 ?auto_119280 ) ) ( not ( = ?auto_119277 ?auto_119281 ) ) ( not ( = ?auto_119277 ?auto_119282 ) ) ( not ( = ?auto_119277 ?auto_119283 ) ) ( not ( = ?auto_119278 ?auto_119279 ) ) ( not ( = ?auto_119278 ?auto_119280 ) ) ( not ( = ?auto_119278 ?auto_119281 ) ) ( not ( = ?auto_119278 ?auto_119282 ) ) ( not ( = ?auto_119278 ?auto_119283 ) ) ( not ( = ?auto_119279 ?auto_119280 ) ) ( not ( = ?auto_119279 ?auto_119281 ) ) ( not ( = ?auto_119279 ?auto_119282 ) ) ( not ( = ?auto_119279 ?auto_119283 ) ) ( not ( = ?auto_119280 ?auto_119281 ) ) ( not ( = ?auto_119280 ?auto_119282 ) ) ( not ( = ?auto_119280 ?auto_119283 ) ) ( not ( = ?auto_119281 ?auto_119282 ) ) ( not ( = ?auto_119281 ?auto_119283 ) ) ( not ( = ?auto_119282 ?auto_119283 ) ) ( ON ?auto_119283 ?auto_119284 ) ( not ( = ?auto_119277 ?auto_119284 ) ) ( not ( = ?auto_119278 ?auto_119284 ) ) ( not ( = ?auto_119279 ?auto_119284 ) ) ( not ( = ?auto_119280 ?auto_119284 ) ) ( not ( = ?auto_119281 ?auto_119284 ) ) ( not ( = ?auto_119282 ?auto_119284 ) ) ( not ( = ?auto_119283 ?auto_119284 ) ) ( ON ?auto_119282 ?auto_119283 ) ( ON-TABLE ?auto_119284 ) ( ON ?auto_119281 ?auto_119282 ) ( CLEAR ?auto_119281 ) ( HOLDING ?auto_119280 ) ( CLEAR ?auto_119279 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119277 ?auto_119278 ?auto_119279 ?auto_119280 )
      ( MAKE-7PILE ?auto_119277 ?auto_119278 ?auto_119279 ?auto_119280 ?auto_119281 ?auto_119282 ?auto_119283 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119285 - BLOCK
      ?auto_119286 - BLOCK
      ?auto_119287 - BLOCK
      ?auto_119288 - BLOCK
      ?auto_119289 - BLOCK
      ?auto_119290 - BLOCK
      ?auto_119291 - BLOCK
    )
    :vars
    (
      ?auto_119292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119285 ) ( ON ?auto_119286 ?auto_119285 ) ( ON ?auto_119287 ?auto_119286 ) ( not ( = ?auto_119285 ?auto_119286 ) ) ( not ( = ?auto_119285 ?auto_119287 ) ) ( not ( = ?auto_119285 ?auto_119288 ) ) ( not ( = ?auto_119285 ?auto_119289 ) ) ( not ( = ?auto_119285 ?auto_119290 ) ) ( not ( = ?auto_119285 ?auto_119291 ) ) ( not ( = ?auto_119286 ?auto_119287 ) ) ( not ( = ?auto_119286 ?auto_119288 ) ) ( not ( = ?auto_119286 ?auto_119289 ) ) ( not ( = ?auto_119286 ?auto_119290 ) ) ( not ( = ?auto_119286 ?auto_119291 ) ) ( not ( = ?auto_119287 ?auto_119288 ) ) ( not ( = ?auto_119287 ?auto_119289 ) ) ( not ( = ?auto_119287 ?auto_119290 ) ) ( not ( = ?auto_119287 ?auto_119291 ) ) ( not ( = ?auto_119288 ?auto_119289 ) ) ( not ( = ?auto_119288 ?auto_119290 ) ) ( not ( = ?auto_119288 ?auto_119291 ) ) ( not ( = ?auto_119289 ?auto_119290 ) ) ( not ( = ?auto_119289 ?auto_119291 ) ) ( not ( = ?auto_119290 ?auto_119291 ) ) ( ON ?auto_119291 ?auto_119292 ) ( not ( = ?auto_119285 ?auto_119292 ) ) ( not ( = ?auto_119286 ?auto_119292 ) ) ( not ( = ?auto_119287 ?auto_119292 ) ) ( not ( = ?auto_119288 ?auto_119292 ) ) ( not ( = ?auto_119289 ?auto_119292 ) ) ( not ( = ?auto_119290 ?auto_119292 ) ) ( not ( = ?auto_119291 ?auto_119292 ) ) ( ON ?auto_119290 ?auto_119291 ) ( ON-TABLE ?auto_119292 ) ( ON ?auto_119289 ?auto_119290 ) ( CLEAR ?auto_119287 ) ( ON ?auto_119288 ?auto_119289 ) ( CLEAR ?auto_119288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119292 ?auto_119291 ?auto_119290 ?auto_119289 )
      ( MAKE-7PILE ?auto_119285 ?auto_119286 ?auto_119287 ?auto_119288 ?auto_119289 ?auto_119290 ?auto_119291 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119293 - BLOCK
      ?auto_119294 - BLOCK
      ?auto_119295 - BLOCK
      ?auto_119296 - BLOCK
      ?auto_119297 - BLOCK
      ?auto_119298 - BLOCK
      ?auto_119299 - BLOCK
    )
    :vars
    (
      ?auto_119300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119293 ) ( ON ?auto_119294 ?auto_119293 ) ( not ( = ?auto_119293 ?auto_119294 ) ) ( not ( = ?auto_119293 ?auto_119295 ) ) ( not ( = ?auto_119293 ?auto_119296 ) ) ( not ( = ?auto_119293 ?auto_119297 ) ) ( not ( = ?auto_119293 ?auto_119298 ) ) ( not ( = ?auto_119293 ?auto_119299 ) ) ( not ( = ?auto_119294 ?auto_119295 ) ) ( not ( = ?auto_119294 ?auto_119296 ) ) ( not ( = ?auto_119294 ?auto_119297 ) ) ( not ( = ?auto_119294 ?auto_119298 ) ) ( not ( = ?auto_119294 ?auto_119299 ) ) ( not ( = ?auto_119295 ?auto_119296 ) ) ( not ( = ?auto_119295 ?auto_119297 ) ) ( not ( = ?auto_119295 ?auto_119298 ) ) ( not ( = ?auto_119295 ?auto_119299 ) ) ( not ( = ?auto_119296 ?auto_119297 ) ) ( not ( = ?auto_119296 ?auto_119298 ) ) ( not ( = ?auto_119296 ?auto_119299 ) ) ( not ( = ?auto_119297 ?auto_119298 ) ) ( not ( = ?auto_119297 ?auto_119299 ) ) ( not ( = ?auto_119298 ?auto_119299 ) ) ( ON ?auto_119299 ?auto_119300 ) ( not ( = ?auto_119293 ?auto_119300 ) ) ( not ( = ?auto_119294 ?auto_119300 ) ) ( not ( = ?auto_119295 ?auto_119300 ) ) ( not ( = ?auto_119296 ?auto_119300 ) ) ( not ( = ?auto_119297 ?auto_119300 ) ) ( not ( = ?auto_119298 ?auto_119300 ) ) ( not ( = ?auto_119299 ?auto_119300 ) ) ( ON ?auto_119298 ?auto_119299 ) ( ON-TABLE ?auto_119300 ) ( ON ?auto_119297 ?auto_119298 ) ( ON ?auto_119296 ?auto_119297 ) ( CLEAR ?auto_119296 ) ( HOLDING ?auto_119295 ) ( CLEAR ?auto_119294 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119293 ?auto_119294 ?auto_119295 )
      ( MAKE-7PILE ?auto_119293 ?auto_119294 ?auto_119295 ?auto_119296 ?auto_119297 ?auto_119298 ?auto_119299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119301 - BLOCK
      ?auto_119302 - BLOCK
      ?auto_119303 - BLOCK
      ?auto_119304 - BLOCK
      ?auto_119305 - BLOCK
      ?auto_119306 - BLOCK
      ?auto_119307 - BLOCK
    )
    :vars
    (
      ?auto_119308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119301 ) ( ON ?auto_119302 ?auto_119301 ) ( not ( = ?auto_119301 ?auto_119302 ) ) ( not ( = ?auto_119301 ?auto_119303 ) ) ( not ( = ?auto_119301 ?auto_119304 ) ) ( not ( = ?auto_119301 ?auto_119305 ) ) ( not ( = ?auto_119301 ?auto_119306 ) ) ( not ( = ?auto_119301 ?auto_119307 ) ) ( not ( = ?auto_119302 ?auto_119303 ) ) ( not ( = ?auto_119302 ?auto_119304 ) ) ( not ( = ?auto_119302 ?auto_119305 ) ) ( not ( = ?auto_119302 ?auto_119306 ) ) ( not ( = ?auto_119302 ?auto_119307 ) ) ( not ( = ?auto_119303 ?auto_119304 ) ) ( not ( = ?auto_119303 ?auto_119305 ) ) ( not ( = ?auto_119303 ?auto_119306 ) ) ( not ( = ?auto_119303 ?auto_119307 ) ) ( not ( = ?auto_119304 ?auto_119305 ) ) ( not ( = ?auto_119304 ?auto_119306 ) ) ( not ( = ?auto_119304 ?auto_119307 ) ) ( not ( = ?auto_119305 ?auto_119306 ) ) ( not ( = ?auto_119305 ?auto_119307 ) ) ( not ( = ?auto_119306 ?auto_119307 ) ) ( ON ?auto_119307 ?auto_119308 ) ( not ( = ?auto_119301 ?auto_119308 ) ) ( not ( = ?auto_119302 ?auto_119308 ) ) ( not ( = ?auto_119303 ?auto_119308 ) ) ( not ( = ?auto_119304 ?auto_119308 ) ) ( not ( = ?auto_119305 ?auto_119308 ) ) ( not ( = ?auto_119306 ?auto_119308 ) ) ( not ( = ?auto_119307 ?auto_119308 ) ) ( ON ?auto_119306 ?auto_119307 ) ( ON-TABLE ?auto_119308 ) ( ON ?auto_119305 ?auto_119306 ) ( ON ?auto_119304 ?auto_119305 ) ( CLEAR ?auto_119302 ) ( ON ?auto_119303 ?auto_119304 ) ( CLEAR ?auto_119303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119308 ?auto_119307 ?auto_119306 ?auto_119305 ?auto_119304 )
      ( MAKE-7PILE ?auto_119301 ?auto_119302 ?auto_119303 ?auto_119304 ?auto_119305 ?auto_119306 ?auto_119307 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119309 - BLOCK
      ?auto_119310 - BLOCK
      ?auto_119311 - BLOCK
      ?auto_119312 - BLOCK
      ?auto_119313 - BLOCK
      ?auto_119314 - BLOCK
      ?auto_119315 - BLOCK
    )
    :vars
    (
      ?auto_119316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119309 ) ( not ( = ?auto_119309 ?auto_119310 ) ) ( not ( = ?auto_119309 ?auto_119311 ) ) ( not ( = ?auto_119309 ?auto_119312 ) ) ( not ( = ?auto_119309 ?auto_119313 ) ) ( not ( = ?auto_119309 ?auto_119314 ) ) ( not ( = ?auto_119309 ?auto_119315 ) ) ( not ( = ?auto_119310 ?auto_119311 ) ) ( not ( = ?auto_119310 ?auto_119312 ) ) ( not ( = ?auto_119310 ?auto_119313 ) ) ( not ( = ?auto_119310 ?auto_119314 ) ) ( not ( = ?auto_119310 ?auto_119315 ) ) ( not ( = ?auto_119311 ?auto_119312 ) ) ( not ( = ?auto_119311 ?auto_119313 ) ) ( not ( = ?auto_119311 ?auto_119314 ) ) ( not ( = ?auto_119311 ?auto_119315 ) ) ( not ( = ?auto_119312 ?auto_119313 ) ) ( not ( = ?auto_119312 ?auto_119314 ) ) ( not ( = ?auto_119312 ?auto_119315 ) ) ( not ( = ?auto_119313 ?auto_119314 ) ) ( not ( = ?auto_119313 ?auto_119315 ) ) ( not ( = ?auto_119314 ?auto_119315 ) ) ( ON ?auto_119315 ?auto_119316 ) ( not ( = ?auto_119309 ?auto_119316 ) ) ( not ( = ?auto_119310 ?auto_119316 ) ) ( not ( = ?auto_119311 ?auto_119316 ) ) ( not ( = ?auto_119312 ?auto_119316 ) ) ( not ( = ?auto_119313 ?auto_119316 ) ) ( not ( = ?auto_119314 ?auto_119316 ) ) ( not ( = ?auto_119315 ?auto_119316 ) ) ( ON ?auto_119314 ?auto_119315 ) ( ON-TABLE ?auto_119316 ) ( ON ?auto_119313 ?auto_119314 ) ( ON ?auto_119312 ?auto_119313 ) ( ON ?auto_119311 ?auto_119312 ) ( CLEAR ?auto_119311 ) ( HOLDING ?auto_119310 ) ( CLEAR ?auto_119309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119309 ?auto_119310 )
      ( MAKE-7PILE ?auto_119309 ?auto_119310 ?auto_119311 ?auto_119312 ?auto_119313 ?auto_119314 ?auto_119315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119317 - BLOCK
      ?auto_119318 - BLOCK
      ?auto_119319 - BLOCK
      ?auto_119320 - BLOCK
      ?auto_119321 - BLOCK
      ?auto_119322 - BLOCK
      ?auto_119323 - BLOCK
    )
    :vars
    (
      ?auto_119324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119317 ) ( not ( = ?auto_119317 ?auto_119318 ) ) ( not ( = ?auto_119317 ?auto_119319 ) ) ( not ( = ?auto_119317 ?auto_119320 ) ) ( not ( = ?auto_119317 ?auto_119321 ) ) ( not ( = ?auto_119317 ?auto_119322 ) ) ( not ( = ?auto_119317 ?auto_119323 ) ) ( not ( = ?auto_119318 ?auto_119319 ) ) ( not ( = ?auto_119318 ?auto_119320 ) ) ( not ( = ?auto_119318 ?auto_119321 ) ) ( not ( = ?auto_119318 ?auto_119322 ) ) ( not ( = ?auto_119318 ?auto_119323 ) ) ( not ( = ?auto_119319 ?auto_119320 ) ) ( not ( = ?auto_119319 ?auto_119321 ) ) ( not ( = ?auto_119319 ?auto_119322 ) ) ( not ( = ?auto_119319 ?auto_119323 ) ) ( not ( = ?auto_119320 ?auto_119321 ) ) ( not ( = ?auto_119320 ?auto_119322 ) ) ( not ( = ?auto_119320 ?auto_119323 ) ) ( not ( = ?auto_119321 ?auto_119322 ) ) ( not ( = ?auto_119321 ?auto_119323 ) ) ( not ( = ?auto_119322 ?auto_119323 ) ) ( ON ?auto_119323 ?auto_119324 ) ( not ( = ?auto_119317 ?auto_119324 ) ) ( not ( = ?auto_119318 ?auto_119324 ) ) ( not ( = ?auto_119319 ?auto_119324 ) ) ( not ( = ?auto_119320 ?auto_119324 ) ) ( not ( = ?auto_119321 ?auto_119324 ) ) ( not ( = ?auto_119322 ?auto_119324 ) ) ( not ( = ?auto_119323 ?auto_119324 ) ) ( ON ?auto_119322 ?auto_119323 ) ( ON-TABLE ?auto_119324 ) ( ON ?auto_119321 ?auto_119322 ) ( ON ?auto_119320 ?auto_119321 ) ( ON ?auto_119319 ?auto_119320 ) ( CLEAR ?auto_119317 ) ( ON ?auto_119318 ?auto_119319 ) ( CLEAR ?auto_119318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119324 ?auto_119323 ?auto_119322 ?auto_119321 ?auto_119320 ?auto_119319 )
      ( MAKE-7PILE ?auto_119317 ?auto_119318 ?auto_119319 ?auto_119320 ?auto_119321 ?auto_119322 ?auto_119323 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119325 - BLOCK
      ?auto_119326 - BLOCK
      ?auto_119327 - BLOCK
      ?auto_119328 - BLOCK
      ?auto_119329 - BLOCK
      ?auto_119330 - BLOCK
      ?auto_119331 - BLOCK
    )
    :vars
    (
      ?auto_119332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119325 ?auto_119326 ) ) ( not ( = ?auto_119325 ?auto_119327 ) ) ( not ( = ?auto_119325 ?auto_119328 ) ) ( not ( = ?auto_119325 ?auto_119329 ) ) ( not ( = ?auto_119325 ?auto_119330 ) ) ( not ( = ?auto_119325 ?auto_119331 ) ) ( not ( = ?auto_119326 ?auto_119327 ) ) ( not ( = ?auto_119326 ?auto_119328 ) ) ( not ( = ?auto_119326 ?auto_119329 ) ) ( not ( = ?auto_119326 ?auto_119330 ) ) ( not ( = ?auto_119326 ?auto_119331 ) ) ( not ( = ?auto_119327 ?auto_119328 ) ) ( not ( = ?auto_119327 ?auto_119329 ) ) ( not ( = ?auto_119327 ?auto_119330 ) ) ( not ( = ?auto_119327 ?auto_119331 ) ) ( not ( = ?auto_119328 ?auto_119329 ) ) ( not ( = ?auto_119328 ?auto_119330 ) ) ( not ( = ?auto_119328 ?auto_119331 ) ) ( not ( = ?auto_119329 ?auto_119330 ) ) ( not ( = ?auto_119329 ?auto_119331 ) ) ( not ( = ?auto_119330 ?auto_119331 ) ) ( ON ?auto_119331 ?auto_119332 ) ( not ( = ?auto_119325 ?auto_119332 ) ) ( not ( = ?auto_119326 ?auto_119332 ) ) ( not ( = ?auto_119327 ?auto_119332 ) ) ( not ( = ?auto_119328 ?auto_119332 ) ) ( not ( = ?auto_119329 ?auto_119332 ) ) ( not ( = ?auto_119330 ?auto_119332 ) ) ( not ( = ?auto_119331 ?auto_119332 ) ) ( ON ?auto_119330 ?auto_119331 ) ( ON-TABLE ?auto_119332 ) ( ON ?auto_119329 ?auto_119330 ) ( ON ?auto_119328 ?auto_119329 ) ( ON ?auto_119327 ?auto_119328 ) ( ON ?auto_119326 ?auto_119327 ) ( CLEAR ?auto_119326 ) ( HOLDING ?auto_119325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119325 )
      ( MAKE-7PILE ?auto_119325 ?auto_119326 ?auto_119327 ?auto_119328 ?auto_119329 ?auto_119330 ?auto_119331 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_119333 - BLOCK
      ?auto_119334 - BLOCK
      ?auto_119335 - BLOCK
      ?auto_119336 - BLOCK
      ?auto_119337 - BLOCK
      ?auto_119338 - BLOCK
      ?auto_119339 - BLOCK
    )
    :vars
    (
      ?auto_119340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119333 ?auto_119334 ) ) ( not ( = ?auto_119333 ?auto_119335 ) ) ( not ( = ?auto_119333 ?auto_119336 ) ) ( not ( = ?auto_119333 ?auto_119337 ) ) ( not ( = ?auto_119333 ?auto_119338 ) ) ( not ( = ?auto_119333 ?auto_119339 ) ) ( not ( = ?auto_119334 ?auto_119335 ) ) ( not ( = ?auto_119334 ?auto_119336 ) ) ( not ( = ?auto_119334 ?auto_119337 ) ) ( not ( = ?auto_119334 ?auto_119338 ) ) ( not ( = ?auto_119334 ?auto_119339 ) ) ( not ( = ?auto_119335 ?auto_119336 ) ) ( not ( = ?auto_119335 ?auto_119337 ) ) ( not ( = ?auto_119335 ?auto_119338 ) ) ( not ( = ?auto_119335 ?auto_119339 ) ) ( not ( = ?auto_119336 ?auto_119337 ) ) ( not ( = ?auto_119336 ?auto_119338 ) ) ( not ( = ?auto_119336 ?auto_119339 ) ) ( not ( = ?auto_119337 ?auto_119338 ) ) ( not ( = ?auto_119337 ?auto_119339 ) ) ( not ( = ?auto_119338 ?auto_119339 ) ) ( ON ?auto_119339 ?auto_119340 ) ( not ( = ?auto_119333 ?auto_119340 ) ) ( not ( = ?auto_119334 ?auto_119340 ) ) ( not ( = ?auto_119335 ?auto_119340 ) ) ( not ( = ?auto_119336 ?auto_119340 ) ) ( not ( = ?auto_119337 ?auto_119340 ) ) ( not ( = ?auto_119338 ?auto_119340 ) ) ( not ( = ?auto_119339 ?auto_119340 ) ) ( ON ?auto_119338 ?auto_119339 ) ( ON-TABLE ?auto_119340 ) ( ON ?auto_119337 ?auto_119338 ) ( ON ?auto_119336 ?auto_119337 ) ( ON ?auto_119335 ?auto_119336 ) ( ON ?auto_119334 ?auto_119335 ) ( ON ?auto_119333 ?auto_119334 ) ( CLEAR ?auto_119333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119340 ?auto_119339 ?auto_119338 ?auto_119337 ?auto_119336 ?auto_119335 ?auto_119334 )
      ( MAKE-7PILE ?auto_119333 ?auto_119334 ?auto_119335 ?auto_119336 ?auto_119337 ?auto_119338 ?auto_119339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119347 - BLOCK
      ?auto_119348 - BLOCK
      ?auto_119349 - BLOCK
      ?auto_119350 - BLOCK
      ?auto_119351 - BLOCK
      ?auto_119352 - BLOCK
    )
    :vars
    (
      ?auto_119353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119353 ?auto_119352 ) ( CLEAR ?auto_119353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119347 ) ( ON ?auto_119348 ?auto_119347 ) ( ON ?auto_119349 ?auto_119348 ) ( ON ?auto_119350 ?auto_119349 ) ( ON ?auto_119351 ?auto_119350 ) ( ON ?auto_119352 ?auto_119351 ) ( not ( = ?auto_119347 ?auto_119348 ) ) ( not ( = ?auto_119347 ?auto_119349 ) ) ( not ( = ?auto_119347 ?auto_119350 ) ) ( not ( = ?auto_119347 ?auto_119351 ) ) ( not ( = ?auto_119347 ?auto_119352 ) ) ( not ( = ?auto_119347 ?auto_119353 ) ) ( not ( = ?auto_119348 ?auto_119349 ) ) ( not ( = ?auto_119348 ?auto_119350 ) ) ( not ( = ?auto_119348 ?auto_119351 ) ) ( not ( = ?auto_119348 ?auto_119352 ) ) ( not ( = ?auto_119348 ?auto_119353 ) ) ( not ( = ?auto_119349 ?auto_119350 ) ) ( not ( = ?auto_119349 ?auto_119351 ) ) ( not ( = ?auto_119349 ?auto_119352 ) ) ( not ( = ?auto_119349 ?auto_119353 ) ) ( not ( = ?auto_119350 ?auto_119351 ) ) ( not ( = ?auto_119350 ?auto_119352 ) ) ( not ( = ?auto_119350 ?auto_119353 ) ) ( not ( = ?auto_119351 ?auto_119352 ) ) ( not ( = ?auto_119351 ?auto_119353 ) ) ( not ( = ?auto_119352 ?auto_119353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119353 ?auto_119352 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119369 - BLOCK
      ?auto_119370 - BLOCK
      ?auto_119371 - BLOCK
      ?auto_119372 - BLOCK
      ?auto_119373 - BLOCK
      ?auto_119374 - BLOCK
    )
    :vars
    (
      ?auto_119375 - BLOCK
      ?auto_119376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119369 ) ( ON ?auto_119370 ?auto_119369 ) ( ON ?auto_119371 ?auto_119370 ) ( ON ?auto_119372 ?auto_119371 ) ( ON ?auto_119373 ?auto_119372 ) ( not ( = ?auto_119369 ?auto_119370 ) ) ( not ( = ?auto_119369 ?auto_119371 ) ) ( not ( = ?auto_119369 ?auto_119372 ) ) ( not ( = ?auto_119369 ?auto_119373 ) ) ( not ( = ?auto_119369 ?auto_119374 ) ) ( not ( = ?auto_119369 ?auto_119375 ) ) ( not ( = ?auto_119370 ?auto_119371 ) ) ( not ( = ?auto_119370 ?auto_119372 ) ) ( not ( = ?auto_119370 ?auto_119373 ) ) ( not ( = ?auto_119370 ?auto_119374 ) ) ( not ( = ?auto_119370 ?auto_119375 ) ) ( not ( = ?auto_119371 ?auto_119372 ) ) ( not ( = ?auto_119371 ?auto_119373 ) ) ( not ( = ?auto_119371 ?auto_119374 ) ) ( not ( = ?auto_119371 ?auto_119375 ) ) ( not ( = ?auto_119372 ?auto_119373 ) ) ( not ( = ?auto_119372 ?auto_119374 ) ) ( not ( = ?auto_119372 ?auto_119375 ) ) ( not ( = ?auto_119373 ?auto_119374 ) ) ( not ( = ?auto_119373 ?auto_119375 ) ) ( not ( = ?auto_119374 ?auto_119375 ) ) ( ON ?auto_119375 ?auto_119376 ) ( CLEAR ?auto_119375 ) ( not ( = ?auto_119369 ?auto_119376 ) ) ( not ( = ?auto_119370 ?auto_119376 ) ) ( not ( = ?auto_119371 ?auto_119376 ) ) ( not ( = ?auto_119372 ?auto_119376 ) ) ( not ( = ?auto_119373 ?auto_119376 ) ) ( not ( = ?auto_119374 ?auto_119376 ) ) ( not ( = ?auto_119375 ?auto_119376 ) ) ( HOLDING ?auto_119374 ) ( CLEAR ?auto_119373 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119369 ?auto_119370 ?auto_119371 ?auto_119372 ?auto_119373 ?auto_119374 ?auto_119375 )
      ( MAKE-6PILE ?auto_119369 ?auto_119370 ?auto_119371 ?auto_119372 ?auto_119373 ?auto_119374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119377 - BLOCK
      ?auto_119378 - BLOCK
      ?auto_119379 - BLOCK
      ?auto_119380 - BLOCK
      ?auto_119381 - BLOCK
      ?auto_119382 - BLOCK
    )
    :vars
    (
      ?auto_119383 - BLOCK
      ?auto_119384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119377 ) ( ON ?auto_119378 ?auto_119377 ) ( ON ?auto_119379 ?auto_119378 ) ( ON ?auto_119380 ?auto_119379 ) ( ON ?auto_119381 ?auto_119380 ) ( not ( = ?auto_119377 ?auto_119378 ) ) ( not ( = ?auto_119377 ?auto_119379 ) ) ( not ( = ?auto_119377 ?auto_119380 ) ) ( not ( = ?auto_119377 ?auto_119381 ) ) ( not ( = ?auto_119377 ?auto_119382 ) ) ( not ( = ?auto_119377 ?auto_119383 ) ) ( not ( = ?auto_119378 ?auto_119379 ) ) ( not ( = ?auto_119378 ?auto_119380 ) ) ( not ( = ?auto_119378 ?auto_119381 ) ) ( not ( = ?auto_119378 ?auto_119382 ) ) ( not ( = ?auto_119378 ?auto_119383 ) ) ( not ( = ?auto_119379 ?auto_119380 ) ) ( not ( = ?auto_119379 ?auto_119381 ) ) ( not ( = ?auto_119379 ?auto_119382 ) ) ( not ( = ?auto_119379 ?auto_119383 ) ) ( not ( = ?auto_119380 ?auto_119381 ) ) ( not ( = ?auto_119380 ?auto_119382 ) ) ( not ( = ?auto_119380 ?auto_119383 ) ) ( not ( = ?auto_119381 ?auto_119382 ) ) ( not ( = ?auto_119381 ?auto_119383 ) ) ( not ( = ?auto_119382 ?auto_119383 ) ) ( ON ?auto_119383 ?auto_119384 ) ( not ( = ?auto_119377 ?auto_119384 ) ) ( not ( = ?auto_119378 ?auto_119384 ) ) ( not ( = ?auto_119379 ?auto_119384 ) ) ( not ( = ?auto_119380 ?auto_119384 ) ) ( not ( = ?auto_119381 ?auto_119384 ) ) ( not ( = ?auto_119382 ?auto_119384 ) ) ( not ( = ?auto_119383 ?auto_119384 ) ) ( CLEAR ?auto_119381 ) ( ON ?auto_119382 ?auto_119383 ) ( CLEAR ?auto_119382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119384 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119384 ?auto_119383 )
      ( MAKE-6PILE ?auto_119377 ?auto_119378 ?auto_119379 ?auto_119380 ?auto_119381 ?auto_119382 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119385 - BLOCK
      ?auto_119386 - BLOCK
      ?auto_119387 - BLOCK
      ?auto_119388 - BLOCK
      ?auto_119389 - BLOCK
      ?auto_119390 - BLOCK
    )
    :vars
    (
      ?auto_119392 - BLOCK
      ?auto_119391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119385 ) ( ON ?auto_119386 ?auto_119385 ) ( ON ?auto_119387 ?auto_119386 ) ( ON ?auto_119388 ?auto_119387 ) ( not ( = ?auto_119385 ?auto_119386 ) ) ( not ( = ?auto_119385 ?auto_119387 ) ) ( not ( = ?auto_119385 ?auto_119388 ) ) ( not ( = ?auto_119385 ?auto_119389 ) ) ( not ( = ?auto_119385 ?auto_119390 ) ) ( not ( = ?auto_119385 ?auto_119392 ) ) ( not ( = ?auto_119386 ?auto_119387 ) ) ( not ( = ?auto_119386 ?auto_119388 ) ) ( not ( = ?auto_119386 ?auto_119389 ) ) ( not ( = ?auto_119386 ?auto_119390 ) ) ( not ( = ?auto_119386 ?auto_119392 ) ) ( not ( = ?auto_119387 ?auto_119388 ) ) ( not ( = ?auto_119387 ?auto_119389 ) ) ( not ( = ?auto_119387 ?auto_119390 ) ) ( not ( = ?auto_119387 ?auto_119392 ) ) ( not ( = ?auto_119388 ?auto_119389 ) ) ( not ( = ?auto_119388 ?auto_119390 ) ) ( not ( = ?auto_119388 ?auto_119392 ) ) ( not ( = ?auto_119389 ?auto_119390 ) ) ( not ( = ?auto_119389 ?auto_119392 ) ) ( not ( = ?auto_119390 ?auto_119392 ) ) ( ON ?auto_119392 ?auto_119391 ) ( not ( = ?auto_119385 ?auto_119391 ) ) ( not ( = ?auto_119386 ?auto_119391 ) ) ( not ( = ?auto_119387 ?auto_119391 ) ) ( not ( = ?auto_119388 ?auto_119391 ) ) ( not ( = ?auto_119389 ?auto_119391 ) ) ( not ( = ?auto_119390 ?auto_119391 ) ) ( not ( = ?auto_119392 ?auto_119391 ) ) ( ON ?auto_119390 ?auto_119392 ) ( CLEAR ?auto_119390 ) ( ON-TABLE ?auto_119391 ) ( HOLDING ?auto_119389 ) ( CLEAR ?auto_119388 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119385 ?auto_119386 ?auto_119387 ?auto_119388 ?auto_119389 )
      ( MAKE-6PILE ?auto_119385 ?auto_119386 ?auto_119387 ?auto_119388 ?auto_119389 ?auto_119390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119393 - BLOCK
      ?auto_119394 - BLOCK
      ?auto_119395 - BLOCK
      ?auto_119396 - BLOCK
      ?auto_119397 - BLOCK
      ?auto_119398 - BLOCK
    )
    :vars
    (
      ?auto_119399 - BLOCK
      ?auto_119400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119393 ) ( ON ?auto_119394 ?auto_119393 ) ( ON ?auto_119395 ?auto_119394 ) ( ON ?auto_119396 ?auto_119395 ) ( not ( = ?auto_119393 ?auto_119394 ) ) ( not ( = ?auto_119393 ?auto_119395 ) ) ( not ( = ?auto_119393 ?auto_119396 ) ) ( not ( = ?auto_119393 ?auto_119397 ) ) ( not ( = ?auto_119393 ?auto_119398 ) ) ( not ( = ?auto_119393 ?auto_119399 ) ) ( not ( = ?auto_119394 ?auto_119395 ) ) ( not ( = ?auto_119394 ?auto_119396 ) ) ( not ( = ?auto_119394 ?auto_119397 ) ) ( not ( = ?auto_119394 ?auto_119398 ) ) ( not ( = ?auto_119394 ?auto_119399 ) ) ( not ( = ?auto_119395 ?auto_119396 ) ) ( not ( = ?auto_119395 ?auto_119397 ) ) ( not ( = ?auto_119395 ?auto_119398 ) ) ( not ( = ?auto_119395 ?auto_119399 ) ) ( not ( = ?auto_119396 ?auto_119397 ) ) ( not ( = ?auto_119396 ?auto_119398 ) ) ( not ( = ?auto_119396 ?auto_119399 ) ) ( not ( = ?auto_119397 ?auto_119398 ) ) ( not ( = ?auto_119397 ?auto_119399 ) ) ( not ( = ?auto_119398 ?auto_119399 ) ) ( ON ?auto_119399 ?auto_119400 ) ( not ( = ?auto_119393 ?auto_119400 ) ) ( not ( = ?auto_119394 ?auto_119400 ) ) ( not ( = ?auto_119395 ?auto_119400 ) ) ( not ( = ?auto_119396 ?auto_119400 ) ) ( not ( = ?auto_119397 ?auto_119400 ) ) ( not ( = ?auto_119398 ?auto_119400 ) ) ( not ( = ?auto_119399 ?auto_119400 ) ) ( ON ?auto_119398 ?auto_119399 ) ( ON-TABLE ?auto_119400 ) ( CLEAR ?auto_119396 ) ( ON ?auto_119397 ?auto_119398 ) ( CLEAR ?auto_119397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119400 ?auto_119399 ?auto_119398 )
      ( MAKE-6PILE ?auto_119393 ?auto_119394 ?auto_119395 ?auto_119396 ?auto_119397 ?auto_119398 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119401 - BLOCK
      ?auto_119402 - BLOCK
      ?auto_119403 - BLOCK
      ?auto_119404 - BLOCK
      ?auto_119405 - BLOCK
      ?auto_119406 - BLOCK
    )
    :vars
    (
      ?auto_119408 - BLOCK
      ?auto_119407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119401 ) ( ON ?auto_119402 ?auto_119401 ) ( ON ?auto_119403 ?auto_119402 ) ( not ( = ?auto_119401 ?auto_119402 ) ) ( not ( = ?auto_119401 ?auto_119403 ) ) ( not ( = ?auto_119401 ?auto_119404 ) ) ( not ( = ?auto_119401 ?auto_119405 ) ) ( not ( = ?auto_119401 ?auto_119406 ) ) ( not ( = ?auto_119401 ?auto_119408 ) ) ( not ( = ?auto_119402 ?auto_119403 ) ) ( not ( = ?auto_119402 ?auto_119404 ) ) ( not ( = ?auto_119402 ?auto_119405 ) ) ( not ( = ?auto_119402 ?auto_119406 ) ) ( not ( = ?auto_119402 ?auto_119408 ) ) ( not ( = ?auto_119403 ?auto_119404 ) ) ( not ( = ?auto_119403 ?auto_119405 ) ) ( not ( = ?auto_119403 ?auto_119406 ) ) ( not ( = ?auto_119403 ?auto_119408 ) ) ( not ( = ?auto_119404 ?auto_119405 ) ) ( not ( = ?auto_119404 ?auto_119406 ) ) ( not ( = ?auto_119404 ?auto_119408 ) ) ( not ( = ?auto_119405 ?auto_119406 ) ) ( not ( = ?auto_119405 ?auto_119408 ) ) ( not ( = ?auto_119406 ?auto_119408 ) ) ( ON ?auto_119408 ?auto_119407 ) ( not ( = ?auto_119401 ?auto_119407 ) ) ( not ( = ?auto_119402 ?auto_119407 ) ) ( not ( = ?auto_119403 ?auto_119407 ) ) ( not ( = ?auto_119404 ?auto_119407 ) ) ( not ( = ?auto_119405 ?auto_119407 ) ) ( not ( = ?auto_119406 ?auto_119407 ) ) ( not ( = ?auto_119408 ?auto_119407 ) ) ( ON ?auto_119406 ?auto_119408 ) ( ON-TABLE ?auto_119407 ) ( ON ?auto_119405 ?auto_119406 ) ( CLEAR ?auto_119405 ) ( HOLDING ?auto_119404 ) ( CLEAR ?auto_119403 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119401 ?auto_119402 ?auto_119403 ?auto_119404 )
      ( MAKE-6PILE ?auto_119401 ?auto_119402 ?auto_119403 ?auto_119404 ?auto_119405 ?auto_119406 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119409 - BLOCK
      ?auto_119410 - BLOCK
      ?auto_119411 - BLOCK
      ?auto_119412 - BLOCK
      ?auto_119413 - BLOCK
      ?auto_119414 - BLOCK
    )
    :vars
    (
      ?auto_119415 - BLOCK
      ?auto_119416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119409 ) ( ON ?auto_119410 ?auto_119409 ) ( ON ?auto_119411 ?auto_119410 ) ( not ( = ?auto_119409 ?auto_119410 ) ) ( not ( = ?auto_119409 ?auto_119411 ) ) ( not ( = ?auto_119409 ?auto_119412 ) ) ( not ( = ?auto_119409 ?auto_119413 ) ) ( not ( = ?auto_119409 ?auto_119414 ) ) ( not ( = ?auto_119409 ?auto_119415 ) ) ( not ( = ?auto_119410 ?auto_119411 ) ) ( not ( = ?auto_119410 ?auto_119412 ) ) ( not ( = ?auto_119410 ?auto_119413 ) ) ( not ( = ?auto_119410 ?auto_119414 ) ) ( not ( = ?auto_119410 ?auto_119415 ) ) ( not ( = ?auto_119411 ?auto_119412 ) ) ( not ( = ?auto_119411 ?auto_119413 ) ) ( not ( = ?auto_119411 ?auto_119414 ) ) ( not ( = ?auto_119411 ?auto_119415 ) ) ( not ( = ?auto_119412 ?auto_119413 ) ) ( not ( = ?auto_119412 ?auto_119414 ) ) ( not ( = ?auto_119412 ?auto_119415 ) ) ( not ( = ?auto_119413 ?auto_119414 ) ) ( not ( = ?auto_119413 ?auto_119415 ) ) ( not ( = ?auto_119414 ?auto_119415 ) ) ( ON ?auto_119415 ?auto_119416 ) ( not ( = ?auto_119409 ?auto_119416 ) ) ( not ( = ?auto_119410 ?auto_119416 ) ) ( not ( = ?auto_119411 ?auto_119416 ) ) ( not ( = ?auto_119412 ?auto_119416 ) ) ( not ( = ?auto_119413 ?auto_119416 ) ) ( not ( = ?auto_119414 ?auto_119416 ) ) ( not ( = ?auto_119415 ?auto_119416 ) ) ( ON ?auto_119414 ?auto_119415 ) ( ON-TABLE ?auto_119416 ) ( ON ?auto_119413 ?auto_119414 ) ( CLEAR ?auto_119411 ) ( ON ?auto_119412 ?auto_119413 ) ( CLEAR ?auto_119412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119416 ?auto_119415 ?auto_119414 ?auto_119413 )
      ( MAKE-6PILE ?auto_119409 ?auto_119410 ?auto_119411 ?auto_119412 ?auto_119413 ?auto_119414 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119417 - BLOCK
      ?auto_119418 - BLOCK
      ?auto_119419 - BLOCK
      ?auto_119420 - BLOCK
      ?auto_119421 - BLOCK
      ?auto_119422 - BLOCK
    )
    :vars
    (
      ?auto_119423 - BLOCK
      ?auto_119424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119417 ) ( ON ?auto_119418 ?auto_119417 ) ( not ( = ?auto_119417 ?auto_119418 ) ) ( not ( = ?auto_119417 ?auto_119419 ) ) ( not ( = ?auto_119417 ?auto_119420 ) ) ( not ( = ?auto_119417 ?auto_119421 ) ) ( not ( = ?auto_119417 ?auto_119422 ) ) ( not ( = ?auto_119417 ?auto_119423 ) ) ( not ( = ?auto_119418 ?auto_119419 ) ) ( not ( = ?auto_119418 ?auto_119420 ) ) ( not ( = ?auto_119418 ?auto_119421 ) ) ( not ( = ?auto_119418 ?auto_119422 ) ) ( not ( = ?auto_119418 ?auto_119423 ) ) ( not ( = ?auto_119419 ?auto_119420 ) ) ( not ( = ?auto_119419 ?auto_119421 ) ) ( not ( = ?auto_119419 ?auto_119422 ) ) ( not ( = ?auto_119419 ?auto_119423 ) ) ( not ( = ?auto_119420 ?auto_119421 ) ) ( not ( = ?auto_119420 ?auto_119422 ) ) ( not ( = ?auto_119420 ?auto_119423 ) ) ( not ( = ?auto_119421 ?auto_119422 ) ) ( not ( = ?auto_119421 ?auto_119423 ) ) ( not ( = ?auto_119422 ?auto_119423 ) ) ( ON ?auto_119423 ?auto_119424 ) ( not ( = ?auto_119417 ?auto_119424 ) ) ( not ( = ?auto_119418 ?auto_119424 ) ) ( not ( = ?auto_119419 ?auto_119424 ) ) ( not ( = ?auto_119420 ?auto_119424 ) ) ( not ( = ?auto_119421 ?auto_119424 ) ) ( not ( = ?auto_119422 ?auto_119424 ) ) ( not ( = ?auto_119423 ?auto_119424 ) ) ( ON ?auto_119422 ?auto_119423 ) ( ON-TABLE ?auto_119424 ) ( ON ?auto_119421 ?auto_119422 ) ( ON ?auto_119420 ?auto_119421 ) ( CLEAR ?auto_119420 ) ( HOLDING ?auto_119419 ) ( CLEAR ?auto_119418 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119417 ?auto_119418 ?auto_119419 )
      ( MAKE-6PILE ?auto_119417 ?auto_119418 ?auto_119419 ?auto_119420 ?auto_119421 ?auto_119422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119425 - BLOCK
      ?auto_119426 - BLOCK
      ?auto_119427 - BLOCK
      ?auto_119428 - BLOCK
      ?auto_119429 - BLOCK
      ?auto_119430 - BLOCK
    )
    :vars
    (
      ?auto_119431 - BLOCK
      ?auto_119432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119425 ) ( ON ?auto_119426 ?auto_119425 ) ( not ( = ?auto_119425 ?auto_119426 ) ) ( not ( = ?auto_119425 ?auto_119427 ) ) ( not ( = ?auto_119425 ?auto_119428 ) ) ( not ( = ?auto_119425 ?auto_119429 ) ) ( not ( = ?auto_119425 ?auto_119430 ) ) ( not ( = ?auto_119425 ?auto_119431 ) ) ( not ( = ?auto_119426 ?auto_119427 ) ) ( not ( = ?auto_119426 ?auto_119428 ) ) ( not ( = ?auto_119426 ?auto_119429 ) ) ( not ( = ?auto_119426 ?auto_119430 ) ) ( not ( = ?auto_119426 ?auto_119431 ) ) ( not ( = ?auto_119427 ?auto_119428 ) ) ( not ( = ?auto_119427 ?auto_119429 ) ) ( not ( = ?auto_119427 ?auto_119430 ) ) ( not ( = ?auto_119427 ?auto_119431 ) ) ( not ( = ?auto_119428 ?auto_119429 ) ) ( not ( = ?auto_119428 ?auto_119430 ) ) ( not ( = ?auto_119428 ?auto_119431 ) ) ( not ( = ?auto_119429 ?auto_119430 ) ) ( not ( = ?auto_119429 ?auto_119431 ) ) ( not ( = ?auto_119430 ?auto_119431 ) ) ( ON ?auto_119431 ?auto_119432 ) ( not ( = ?auto_119425 ?auto_119432 ) ) ( not ( = ?auto_119426 ?auto_119432 ) ) ( not ( = ?auto_119427 ?auto_119432 ) ) ( not ( = ?auto_119428 ?auto_119432 ) ) ( not ( = ?auto_119429 ?auto_119432 ) ) ( not ( = ?auto_119430 ?auto_119432 ) ) ( not ( = ?auto_119431 ?auto_119432 ) ) ( ON ?auto_119430 ?auto_119431 ) ( ON-TABLE ?auto_119432 ) ( ON ?auto_119429 ?auto_119430 ) ( ON ?auto_119428 ?auto_119429 ) ( CLEAR ?auto_119426 ) ( ON ?auto_119427 ?auto_119428 ) ( CLEAR ?auto_119427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119432 ?auto_119431 ?auto_119430 ?auto_119429 ?auto_119428 )
      ( MAKE-6PILE ?auto_119425 ?auto_119426 ?auto_119427 ?auto_119428 ?auto_119429 ?auto_119430 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119433 - BLOCK
      ?auto_119434 - BLOCK
      ?auto_119435 - BLOCK
      ?auto_119436 - BLOCK
      ?auto_119437 - BLOCK
      ?auto_119438 - BLOCK
    )
    :vars
    (
      ?auto_119439 - BLOCK
      ?auto_119440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119433 ) ( not ( = ?auto_119433 ?auto_119434 ) ) ( not ( = ?auto_119433 ?auto_119435 ) ) ( not ( = ?auto_119433 ?auto_119436 ) ) ( not ( = ?auto_119433 ?auto_119437 ) ) ( not ( = ?auto_119433 ?auto_119438 ) ) ( not ( = ?auto_119433 ?auto_119439 ) ) ( not ( = ?auto_119434 ?auto_119435 ) ) ( not ( = ?auto_119434 ?auto_119436 ) ) ( not ( = ?auto_119434 ?auto_119437 ) ) ( not ( = ?auto_119434 ?auto_119438 ) ) ( not ( = ?auto_119434 ?auto_119439 ) ) ( not ( = ?auto_119435 ?auto_119436 ) ) ( not ( = ?auto_119435 ?auto_119437 ) ) ( not ( = ?auto_119435 ?auto_119438 ) ) ( not ( = ?auto_119435 ?auto_119439 ) ) ( not ( = ?auto_119436 ?auto_119437 ) ) ( not ( = ?auto_119436 ?auto_119438 ) ) ( not ( = ?auto_119436 ?auto_119439 ) ) ( not ( = ?auto_119437 ?auto_119438 ) ) ( not ( = ?auto_119437 ?auto_119439 ) ) ( not ( = ?auto_119438 ?auto_119439 ) ) ( ON ?auto_119439 ?auto_119440 ) ( not ( = ?auto_119433 ?auto_119440 ) ) ( not ( = ?auto_119434 ?auto_119440 ) ) ( not ( = ?auto_119435 ?auto_119440 ) ) ( not ( = ?auto_119436 ?auto_119440 ) ) ( not ( = ?auto_119437 ?auto_119440 ) ) ( not ( = ?auto_119438 ?auto_119440 ) ) ( not ( = ?auto_119439 ?auto_119440 ) ) ( ON ?auto_119438 ?auto_119439 ) ( ON-TABLE ?auto_119440 ) ( ON ?auto_119437 ?auto_119438 ) ( ON ?auto_119436 ?auto_119437 ) ( ON ?auto_119435 ?auto_119436 ) ( CLEAR ?auto_119435 ) ( HOLDING ?auto_119434 ) ( CLEAR ?auto_119433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119433 ?auto_119434 )
      ( MAKE-6PILE ?auto_119433 ?auto_119434 ?auto_119435 ?auto_119436 ?auto_119437 ?auto_119438 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119441 - BLOCK
      ?auto_119442 - BLOCK
      ?auto_119443 - BLOCK
      ?auto_119444 - BLOCK
      ?auto_119445 - BLOCK
      ?auto_119446 - BLOCK
    )
    :vars
    (
      ?auto_119448 - BLOCK
      ?auto_119447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119441 ) ( not ( = ?auto_119441 ?auto_119442 ) ) ( not ( = ?auto_119441 ?auto_119443 ) ) ( not ( = ?auto_119441 ?auto_119444 ) ) ( not ( = ?auto_119441 ?auto_119445 ) ) ( not ( = ?auto_119441 ?auto_119446 ) ) ( not ( = ?auto_119441 ?auto_119448 ) ) ( not ( = ?auto_119442 ?auto_119443 ) ) ( not ( = ?auto_119442 ?auto_119444 ) ) ( not ( = ?auto_119442 ?auto_119445 ) ) ( not ( = ?auto_119442 ?auto_119446 ) ) ( not ( = ?auto_119442 ?auto_119448 ) ) ( not ( = ?auto_119443 ?auto_119444 ) ) ( not ( = ?auto_119443 ?auto_119445 ) ) ( not ( = ?auto_119443 ?auto_119446 ) ) ( not ( = ?auto_119443 ?auto_119448 ) ) ( not ( = ?auto_119444 ?auto_119445 ) ) ( not ( = ?auto_119444 ?auto_119446 ) ) ( not ( = ?auto_119444 ?auto_119448 ) ) ( not ( = ?auto_119445 ?auto_119446 ) ) ( not ( = ?auto_119445 ?auto_119448 ) ) ( not ( = ?auto_119446 ?auto_119448 ) ) ( ON ?auto_119448 ?auto_119447 ) ( not ( = ?auto_119441 ?auto_119447 ) ) ( not ( = ?auto_119442 ?auto_119447 ) ) ( not ( = ?auto_119443 ?auto_119447 ) ) ( not ( = ?auto_119444 ?auto_119447 ) ) ( not ( = ?auto_119445 ?auto_119447 ) ) ( not ( = ?auto_119446 ?auto_119447 ) ) ( not ( = ?auto_119448 ?auto_119447 ) ) ( ON ?auto_119446 ?auto_119448 ) ( ON-TABLE ?auto_119447 ) ( ON ?auto_119445 ?auto_119446 ) ( ON ?auto_119444 ?auto_119445 ) ( ON ?auto_119443 ?auto_119444 ) ( CLEAR ?auto_119441 ) ( ON ?auto_119442 ?auto_119443 ) ( CLEAR ?auto_119442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119447 ?auto_119448 ?auto_119446 ?auto_119445 ?auto_119444 ?auto_119443 )
      ( MAKE-6PILE ?auto_119441 ?auto_119442 ?auto_119443 ?auto_119444 ?auto_119445 ?auto_119446 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119449 - BLOCK
      ?auto_119450 - BLOCK
      ?auto_119451 - BLOCK
      ?auto_119452 - BLOCK
      ?auto_119453 - BLOCK
      ?auto_119454 - BLOCK
    )
    :vars
    (
      ?auto_119456 - BLOCK
      ?auto_119455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119449 ?auto_119450 ) ) ( not ( = ?auto_119449 ?auto_119451 ) ) ( not ( = ?auto_119449 ?auto_119452 ) ) ( not ( = ?auto_119449 ?auto_119453 ) ) ( not ( = ?auto_119449 ?auto_119454 ) ) ( not ( = ?auto_119449 ?auto_119456 ) ) ( not ( = ?auto_119450 ?auto_119451 ) ) ( not ( = ?auto_119450 ?auto_119452 ) ) ( not ( = ?auto_119450 ?auto_119453 ) ) ( not ( = ?auto_119450 ?auto_119454 ) ) ( not ( = ?auto_119450 ?auto_119456 ) ) ( not ( = ?auto_119451 ?auto_119452 ) ) ( not ( = ?auto_119451 ?auto_119453 ) ) ( not ( = ?auto_119451 ?auto_119454 ) ) ( not ( = ?auto_119451 ?auto_119456 ) ) ( not ( = ?auto_119452 ?auto_119453 ) ) ( not ( = ?auto_119452 ?auto_119454 ) ) ( not ( = ?auto_119452 ?auto_119456 ) ) ( not ( = ?auto_119453 ?auto_119454 ) ) ( not ( = ?auto_119453 ?auto_119456 ) ) ( not ( = ?auto_119454 ?auto_119456 ) ) ( ON ?auto_119456 ?auto_119455 ) ( not ( = ?auto_119449 ?auto_119455 ) ) ( not ( = ?auto_119450 ?auto_119455 ) ) ( not ( = ?auto_119451 ?auto_119455 ) ) ( not ( = ?auto_119452 ?auto_119455 ) ) ( not ( = ?auto_119453 ?auto_119455 ) ) ( not ( = ?auto_119454 ?auto_119455 ) ) ( not ( = ?auto_119456 ?auto_119455 ) ) ( ON ?auto_119454 ?auto_119456 ) ( ON-TABLE ?auto_119455 ) ( ON ?auto_119453 ?auto_119454 ) ( ON ?auto_119452 ?auto_119453 ) ( ON ?auto_119451 ?auto_119452 ) ( ON ?auto_119450 ?auto_119451 ) ( CLEAR ?auto_119450 ) ( HOLDING ?auto_119449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119449 )
      ( MAKE-6PILE ?auto_119449 ?auto_119450 ?auto_119451 ?auto_119452 ?auto_119453 ?auto_119454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_119457 - BLOCK
      ?auto_119458 - BLOCK
      ?auto_119459 - BLOCK
      ?auto_119460 - BLOCK
      ?auto_119461 - BLOCK
      ?auto_119462 - BLOCK
    )
    :vars
    (
      ?auto_119464 - BLOCK
      ?auto_119463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119457 ?auto_119458 ) ) ( not ( = ?auto_119457 ?auto_119459 ) ) ( not ( = ?auto_119457 ?auto_119460 ) ) ( not ( = ?auto_119457 ?auto_119461 ) ) ( not ( = ?auto_119457 ?auto_119462 ) ) ( not ( = ?auto_119457 ?auto_119464 ) ) ( not ( = ?auto_119458 ?auto_119459 ) ) ( not ( = ?auto_119458 ?auto_119460 ) ) ( not ( = ?auto_119458 ?auto_119461 ) ) ( not ( = ?auto_119458 ?auto_119462 ) ) ( not ( = ?auto_119458 ?auto_119464 ) ) ( not ( = ?auto_119459 ?auto_119460 ) ) ( not ( = ?auto_119459 ?auto_119461 ) ) ( not ( = ?auto_119459 ?auto_119462 ) ) ( not ( = ?auto_119459 ?auto_119464 ) ) ( not ( = ?auto_119460 ?auto_119461 ) ) ( not ( = ?auto_119460 ?auto_119462 ) ) ( not ( = ?auto_119460 ?auto_119464 ) ) ( not ( = ?auto_119461 ?auto_119462 ) ) ( not ( = ?auto_119461 ?auto_119464 ) ) ( not ( = ?auto_119462 ?auto_119464 ) ) ( ON ?auto_119464 ?auto_119463 ) ( not ( = ?auto_119457 ?auto_119463 ) ) ( not ( = ?auto_119458 ?auto_119463 ) ) ( not ( = ?auto_119459 ?auto_119463 ) ) ( not ( = ?auto_119460 ?auto_119463 ) ) ( not ( = ?auto_119461 ?auto_119463 ) ) ( not ( = ?auto_119462 ?auto_119463 ) ) ( not ( = ?auto_119464 ?auto_119463 ) ) ( ON ?auto_119462 ?auto_119464 ) ( ON-TABLE ?auto_119463 ) ( ON ?auto_119461 ?auto_119462 ) ( ON ?auto_119460 ?auto_119461 ) ( ON ?auto_119459 ?auto_119460 ) ( ON ?auto_119458 ?auto_119459 ) ( ON ?auto_119457 ?auto_119458 ) ( CLEAR ?auto_119457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119463 ?auto_119464 ?auto_119462 ?auto_119461 ?auto_119460 ?auto_119459 ?auto_119458 )
      ( MAKE-6PILE ?auto_119457 ?auto_119458 ?auto_119459 ?auto_119460 ?auto_119461 ?auto_119462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119466 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_119466 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_119466 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119467 - BLOCK
    )
    :vars
    (
      ?auto_119468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119467 ?auto_119468 ) ( CLEAR ?auto_119467 ) ( HAND-EMPTY ) ( not ( = ?auto_119467 ?auto_119468 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119467 ?auto_119468 )
      ( MAKE-1PILE ?auto_119467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119469 - BLOCK
    )
    :vars
    (
      ?auto_119470 - BLOCK
      ?auto_119474 - BLOCK
      ?auto_119471 - BLOCK
      ?auto_119472 - BLOCK
      ?auto_119475 - BLOCK
      ?auto_119473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119469 ?auto_119470 ) ) ( HOLDING ?auto_119469 ) ( CLEAR ?auto_119470 ) ( ON-TABLE ?auto_119474 ) ( ON ?auto_119471 ?auto_119474 ) ( ON ?auto_119472 ?auto_119471 ) ( ON ?auto_119475 ?auto_119472 ) ( ON ?auto_119473 ?auto_119475 ) ( ON ?auto_119470 ?auto_119473 ) ( not ( = ?auto_119474 ?auto_119471 ) ) ( not ( = ?auto_119474 ?auto_119472 ) ) ( not ( = ?auto_119474 ?auto_119475 ) ) ( not ( = ?auto_119474 ?auto_119473 ) ) ( not ( = ?auto_119474 ?auto_119470 ) ) ( not ( = ?auto_119474 ?auto_119469 ) ) ( not ( = ?auto_119471 ?auto_119472 ) ) ( not ( = ?auto_119471 ?auto_119475 ) ) ( not ( = ?auto_119471 ?auto_119473 ) ) ( not ( = ?auto_119471 ?auto_119470 ) ) ( not ( = ?auto_119471 ?auto_119469 ) ) ( not ( = ?auto_119472 ?auto_119475 ) ) ( not ( = ?auto_119472 ?auto_119473 ) ) ( not ( = ?auto_119472 ?auto_119470 ) ) ( not ( = ?auto_119472 ?auto_119469 ) ) ( not ( = ?auto_119475 ?auto_119473 ) ) ( not ( = ?auto_119475 ?auto_119470 ) ) ( not ( = ?auto_119475 ?auto_119469 ) ) ( not ( = ?auto_119473 ?auto_119470 ) ) ( not ( = ?auto_119473 ?auto_119469 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119474 ?auto_119471 ?auto_119472 ?auto_119475 ?auto_119473 ?auto_119470 ?auto_119469 )
      ( MAKE-1PILE ?auto_119469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119476 - BLOCK
    )
    :vars
    (
      ?auto_119480 - BLOCK
      ?auto_119479 - BLOCK
      ?auto_119481 - BLOCK
      ?auto_119478 - BLOCK
      ?auto_119482 - BLOCK
      ?auto_119477 - BLOCK
      ?auto_119483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119476 ?auto_119480 ) ) ( CLEAR ?auto_119480 ) ( ON-TABLE ?auto_119479 ) ( ON ?auto_119481 ?auto_119479 ) ( ON ?auto_119478 ?auto_119481 ) ( ON ?auto_119482 ?auto_119478 ) ( ON ?auto_119477 ?auto_119482 ) ( ON ?auto_119480 ?auto_119477 ) ( not ( = ?auto_119479 ?auto_119481 ) ) ( not ( = ?auto_119479 ?auto_119478 ) ) ( not ( = ?auto_119479 ?auto_119482 ) ) ( not ( = ?auto_119479 ?auto_119477 ) ) ( not ( = ?auto_119479 ?auto_119480 ) ) ( not ( = ?auto_119479 ?auto_119476 ) ) ( not ( = ?auto_119481 ?auto_119478 ) ) ( not ( = ?auto_119481 ?auto_119482 ) ) ( not ( = ?auto_119481 ?auto_119477 ) ) ( not ( = ?auto_119481 ?auto_119480 ) ) ( not ( = ?auto_119481 ?auto_119476 ) ) ( not ( = ?auto_119478 ?auto_119482 ) ) ( not ( = ?auto_119478 ?auto_119477 ) ) ( not ( = ?auto_119478 ?auto_119480 ) ) ( not ( = ?auto_119478 ?auto_119476 ) ) ( not ( = ?auto_119482 ?auto_119477 ) ) ( not ( = ?auto_119482 ?auto_119480 ) ) ( not ( = ?auto_119482 ?auto_119476 ) ) ( not ( = ?auto_119477 ?auto_119480 ) ) ( not ( = ?auto_119477 ?auto_119476 ) ) ( ON ?auto_119476 ?auto_119483 ) ( CLEAR ?auto_119476 ) ( HAND-EMPTY ) ( not ( = ?auto_119476 ?auto_119483 ) ) ( not ( = ?auto_119480 ?auto_119483 ) ) ( not ( = ?auto_119479 ?auto_119483 ) ) ( not ( = ?auto_119481 ?auto_119483 ) ) ( not ( = ?auto_119478 ?auto_119483 ) ) ( not ( = ?auto_119482 ?auto_119483 ) ) ( not ( = ?auto_119477 ?auto_119483 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119476 ?auto_119483 )
      ( MAKE-1PILE ?auto_119476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119484 - BLOCK
    )
    :vars
    (
      ?auto_119485 - BLOCK
      ?auto_119490 - BLOCK
      ?auto_119491 - BLOCK
      ?auto_119487 - BLOCK
      ?auto_119486 - BLOCK
      ?auto_119489 - BLOCK
      ?auto_119488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119484 ?auto_119485 ) ) ( ON-TABLE ?auto_119490 ) ( ON ?auto_119491 ?auto_119490 ) ( ON ?auto_119487 ?auto_119491 ) ( ON ?auto_119486 ?auto_119487 ) ( ON ?auto_119489 ?auto_119486 ) ( not ( = ?auto_119490 ?auto_119491 ) ) ( not ( = ?auto_119490 ?auto_119487 ) ) ( not ( = ?auto_119490 ?auto_119486 ) ) ( not ( = ?auto_119490 ?auto_119489 ) ) ( not ( = ?auto_119490 ?auto_119485 ) ) ( not ( = ?auto_119490 ?auto_119484 ) ) ( not ( = ?auto_119491 ?auto_119487 ) ) ( not ( = ?auto_119491 ?auto_119486 ) ) ( not ( = ?auto_119491 ?auto_119489 ) ) ( not ( = ?auto_119491 ?auto_119485 ) ) ( not ( = ?auto_119491 ?auto_119484 ) ) ( not ( = ?auto_119487 ?auto_119486 ) ) ( not ( = ?auto_119487 ?auto_119489 ) ) ( not ( = ?auto_119487 ?auto_119485 ) ) ( not ( = ?auto_119487 ?auto_119484 ) ) ( not ( = ?auto_119486 ?auto_119489 ) ) ( not ( = ?auto_119486 ?auto_119485 ) ) ( not ( = ?auto_119486 ?auto_119484 ) ) ( not ( = ?auto_119489 ?auto_119485 ) ) ( not ( = ?auto_119489 ?auto_119484 ) ) ( ON ?auto_119484 ?auto_119488 ) ( CLEAR ?auto_119484 ) ( not ( = ?auto_119484 ?auto_119488 ) ) ( not ( = ?auto_119485 ?auto_119488 ) ) ( not ( = ?auto_119490 ?auto_119488 ) ) ( not ( = ?auto_119491 ?auto_119488 ) ) ( not ( = ?auto_119487 ?auto_119488 ) ) ( not ( = ?auto_119486 ?auto_119488 ) ) ( not ( = ?auto_119489 ?auto_119488 ) ) ( HOLDING ?auto_119485 ) ( CLEAR ?auto_119489 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119490 ?auto_119491 ?auto_119487 ?auto_119486 ?auto_119489 ?auto_119485 )
      ( MAKE-1PILE ?auto_119484 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119492 - BLOCK
    )
    :vars
    (
      ?auto_119496 - BLOCK
      ?auto_119499 - BLOCK
      ?auto_119495 - BLOCK
      ?auto_119498 - BLOCK
      ?auto_119493 - BLOCK
      ?auto_119497 - BLOCK
      ?auto_119494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119492 ?auto_119496 ) ) ( ON-TABLE ?auto_119499 ) ( ON ?auto_119495 ?auto_119499 ) ( ON ?auto_119498 ?auto_119495 ) ( ON ?auto_119493 ?auto_119498 ) ( ON ?auto_119497 ?auto_119493 ) ( not ( = ?auto_119499 ?auto_119495 ) ) ( not ( = ?auto_119499 ?auto_119498 ) ) ( not ( = ?auto_119499 ?auto_119493 ) ) ( not ( = ?auto_119499 ?auto_119497 ) ) ( not ( = ?auto_119499 ?auto_119496 ) ) ( not ( = ?auto_119499 ?auto_119492 ) ) ( not ( = ?auto_119495 ?auto_119498 ) ) ( not ( = ?auto_119495 ?auto_119493 ) ) ( not ( = ?auto_119495 ?auto_119497 ) ) ( not ( = ?auto_119495 ?auto_119496 ) ) ( not ( = ?auto_119495 ?auto_119492 ) ) ( not ( = ?auto_119498 ?auto_119493 ) ) ( not ( = ?auto_119498 ?auto_119497 ) ) ( not ( = ?auto_119498 ?auto_119496 ) ) ( not ( = ?auto_119498 ?auto_119492 ) ) ( not ( = ?auto_119493 ?auto_119497 ) ) ( not ( = ?auto_119493 ?auto_119496 ) ) ( not ( = ?auto_119493 ?auto_119492 ) ) ( not ( = ?auto_119497 ?auto_119496 ) ) ( not ( = ?auto_119497 ?auto_119492 ) ) ( ON ?auto_119492 ?auto_119494 ) ( not ( = ?auto_119492 ?auto_119494 ) ) ( not ( = ?auto_119496 ?auto_119494 ) ) ( not ( = ?auto_119499 ?auto_119494 ) ) ( not ( = ?auto_119495 ?auto_119494 ) ) ( not ( = ?auto_119498 ?auto_119494 ) ) ( not ( = ?auto_119493 ?auto_119494 ) ) ( not ( = ?auto_119497 ?auto_119494 ) ) ( CLEAR ?auto_119497 ) ( ON ?auto_119496 ?auto_119492 ) ( CLEAR ?auto_119496 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119494 ?auto_119492 )
      ( MAKE-1PILE ?auto_119492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119500 - BLOCK
    )
    :vars
    (
      ?auto_119501 - BLOCK
      ?auto_119505 - BLOCK
      ?auto_119503 - BLOCK
      ?auto_119504 - BLOCK
      ?auto_119507 - BLOCK
      ?auto_119502 - BLOCK
      ?auto_119506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119500 ?auto_119501 ) ) ( ON-TABLE ?auto_119505 ) ( ON ?auto_119503 ?auto_119505 ) ( ON ?auto_119504 ?auto_119503 ) ( ON ?auto_119507 ?auto_119504 ) ( not ( = ?auto_119505 ?auto_119503 ) ) ( not ( = ?auto_119505 ?auto_119504 ) ) ( not ( = ?auto_119505 ?auto_119507 ) ) ( not ( = ?auto_119505 ?auto_119502 ) ) ( not ( = ?auto_119505 ?auto_119501 ) ) ( not ( = ?auto_119505 ?auto_119500 ) ) ( not ( = ?auto_119503 ?auto_119504 ) ) ( not ( = ?auto_119503 ?auto_119507 ) ) ( not ( = ?auto_119503 ?auto_119502 ) ) ( not ( = ?auto_119503 ?auto_119501 ) ) ( not ( = ?auto_119503 ?auto_119500 ) ) ( not ( = ?auto_119504 ?auto_119507 ) ) ( not ( = ?auto_119504 ?auto_119502 ) ) ( not ( = ?auto_119504 ?auto_119501 ) ) ( not ( = ?auto_119504 ?auto_119500 ) ) ( not ( = ?auto_119507 ?auto_119502 ) ) ( not ( = ?auto_119507 ?auto_119501 ) ) ( not ( = ?auto_119507 ?auto_119500 ) ) ( not ( = ?auto_119502 ?auto_119501 ) ) ( not ( = ?auto_119502 ?auto_119500 ) ) ( ON ?auto_119500 ?auto_119506 ) ( not ( = ?auto_119500 ?auto_119506 ) ) ( not ( = ?auto_119501 ?auto_119506 ) ) ( not ( = ?auto_119505 ?auto_119506 ) ) ( not ( = ?auto_119503 ?auto_119506 ) ) ( not ( = ?auto_119504 ?auto_119506 ) ) ( not ( = ?auto_119507 ?auto_119506 ) ) ( not ( = ?auto_119502 ?auto_119506 ) ) ( ON ?auto_119501 ?auto_119500 ) ( CLEAR ?auto_119501 ) ( ON-TABLE ?auto_119506 ) ( HOLDING ?auto_119502 ) ( CLEAR ?auto_119507 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119505 ?auto_119503 ?auto_119504 ?auto_119507 ?auto_119502 )
      ( MAKE-1PILE ?auto_119500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119508 - BLOCK
    )
    :vars
    (
      ?auto_119515 - BLOCK
      ?auto_119514 - BLOCK
      ?auto_119510 - BLOCK
      ?auto_119509 - BLOCK
      ?auto_119511 - BLOCK
      ?auto_119513 - BLOCK
      ?auto_119512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119508 ?auto_119515 ) ) ( ON-TABLE ?auto_119514 ) ( ON ?auto_119510 ?auto_119514 ) ( ON ?auto_119509 ?auto_119510 ) ( ON ?auto_119511 ?auto_119509 ) ( not ( = ?auto_119514 ?auto_119510 ) ) ( not ( = ?auto_119514 ?auto_119509 ) ) ( not ( = ?auto_119514 ?auto_119511 ) ) ( not ( = ?auto_119514 ?auto_119513 ) ) ( not ( = ?auto_119514 ?auto_119515 ) ) ( not ( = ?auto_119514 ?auto_119508 ) ) ( not ( = ?auto_119510 ?auto_119509 ) ) ( not ( = ?auto_119510 ?auto_119511 ) ) ( not ( = ?auto_119510 ?auto_119513 ) ) ( not ( = ?auto_119510 ?auto_119515 ) ) ( not ( = ?auto_119510 ?auto_119508 ) ) ( not ( = ?auto_119509 ?auto_119511 ) ) ( not ( = ?auto_119509 ?auto_119513 ) ) ( not ( = ?auto_119509 ?auto_119515 ) ) ( not ( = ?auto_119509 ?auto_119508 ) ) ( not ( = ?auto_119511 ?auto_119513 ) ) ( not ( = ?auto_119511 ?auto_119515 ) ) ( not ( = ?auto_119511 ?auto_119508 ) ) ( not ( = ?auto_119513 ?auto_119515 ) ) ( not ( = ?auto_119513 ?auto_119508 ) ) ( ON ?auto_119508 ?auto_119512 ) ( not ( = ?auto_119508 ?auto_119512 ) ) ( not ( = ?auto_119515 ?auto_119512 ) ) ( not ( = ?auto_119514 ?auto_119512 ) ) ( not ( = ?auto_119510 ?auto_119512 ) ) ( not ( = ?auto_119509 ?auto_119512 ) ) ( not ( = ?auto_119511 ?auto_119512 ) ) ( not ( = ?auto_119513 ?auto_119512 ) ) ( ON ?auto_119515 ?auto_119508 ) ( ON-TABLE ?auto_119512 ) ( CLEAR ?auto_119511 ) ( ON ?auto_119513 ?auto_119515 ) ( CLEAR ?auto_119513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119512 ?auto_119508 ?auto_119515 )
      ( MAKE-1PILE ?auto_119508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119516 - BLOCK
    )
    :vars
    (
      ?auto_119517 - BLOCK
      ?auto_119522 - BLOCK
      ?auto_119518 - BLOCK
      ?auto_119521 - BLOCK
      ?auto_119523 - BLOCK
      ?auto_119520 - BLOCK
      ?auto_119519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119516 ?auto_119517 ) ) ( ON-TABLE ?auto_119522 ) ( ON ?auto_119518 ?auto_119522 ) ( ON ?auto_119521 ?auto_119518 ) ( not ( = ?auto_119522 ?auto_119518 ) ) ( not ( = ?auto_119522 ?auto_119521 ) ) ( not ( = ?auto_119522 ?auto_119523 ) ) ( not ( = ?auto_119522 ?auto_119520 ) ) ( not ( = ?auto_119522 ?auto_119517 ) ) ( not ( = ?auto_119522 ?auto_119516 ) ) ( not ( = ?auto_119518 ?auto_119521 ) ) ( not ( = ?auto_119518 ?auto_119523 ) ) ( not ( = ?auto_119518 ?auto_119520 ) ) ( not ( = ?auto_119518 ?auto_119517 ) ) ( not ( = ?auto_119518 ?auto_119516 ) ) ( not ( = ?auto_119521 ?auto_119523 ) ) ( not ( = ?auto_119521 ?auto_119520 ) ) ( not ( = ?auto_119521 ?auto_119517 ) ) ( not ( = ?auto_119521 ?auto_119516 ) ) ( not ( = ?auto_119523 ?auto_119520 ) ) ( not ( = ?auto_119523 ?auto_119517 ) ) ( not ( = ?auto_119523 ?auto_119516 ) ) ( not ( = ?auto_119520 ?auto_119517 ) ) ( not ( = ?auto_119520 ?auto_119516 ) ) ( ON ?auto_119516 ?auto_119519 ) ( not ( = ?auto_119516 ?auto_119519 ) ) ( not ( = ?auto_119517 ?auto_119519 ) ) ( not ( = ?auto_119522 ?auto_119519 ) ) ( not ( = ?auto_119518 ?auto_119519 ) ) ( not ( = ?auto_119521 ?auto_119519 ) ) ( not ( = ?auto_119523 ?auto_119519 ) ) ( not ( = ?auto_119520 ?auto_119519 ) ) ( ON ?auto_119517 ?auto_119516 ) ( ON-TABLE ?auto_119519 ) ( ON ?auto_119520 ?auto_119517 ) ( CLEAR ?auto_119520 ) ( HOLDING ?auto_119523 ) ( CLEAR ?auto_119521 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119522 ?auto_119518 ?auto_119521 ?auto_119523 )
      ( MAKE-1PILE ?auto_119516 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119524 - BLOCK
    )
    :vars
    (
      ?auto_119529 - BLOCK
      ?auto_119526 - BLOCK
      ?auto_119531 - BLOCK
      ?auto_119527 - BLOCK
      ?auto_119525 - BLOCK
      ?auto_119528 - BLOCK
      ?auto_119530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119524 ?auto_119529 ) ) ( ON-TABLE ?auto_119526 ) ( ON ?auto_119531 ?auto_119526 ) ( ON ?auto_119527 ?auto_119531 ) ( not ( = ?auto_119526 ?auto_119531 ) ) ( not ( = ?auto_119526 ?auto_119527 ) ) ( not ( = ?auto_119526 ?auto_119525 ) ) ( not ( = ?auto_119526 ?auto_119528 ) ) ( not ( = ?auto_119526 ?auto_119529 ) ) ( not ( = ?auto_119526 ?auto_119524 ) ) ( not ( = ?auto_119531 ?auto_119527 ) ) ( not ( = ?auto_119531 ?auto_119525 ) ) ( not ( = ?auto_119531 ?auto_119528 ) ) ( not ( = ?auto_119531 ?auto_119529 ) ) ( not ( = ?auto_119531 ?auto_119524 ) ) ( not ( = ?auto_119527 ?auto_119525 ) ) ( not ( = ?auto_119527 ?auto_119528 ) ) ( not ( = ?auto_119527 ?auto_119529 ) ) ( not ( = ?auto_119527 ?auto_119524 ) ) ( not ( = ?auto_119525 ?auto_119528 ) ) ( not ( = ?auto_119525 ?auto_119529 ) ) ( not ( = ?auto_119525 ?auto_119524 ) ) ( not ( = ?auto_119528 ?auto_119529 ) ) ( not ( = ?auto_119528 ?auto_119524 ) ) ( ON ?auto_119524 ?auto_119530 ) ( not ( = ?auto_119524 ?auto_119530 ) ) ( not ( = ?auto_119529 ?auto_119530 ) ) ( not ( = ?auto_119526 ?auto_119530 ) ) ( not ( = ?auto_119531 ?auto_119530 ) ) ( not ( = ?auto_119527 ?auto_119530 ) ) ( not ( = ?auto_119525 ?auto_119530 ) ) ( not ( = ?auto_119528 ?auto_119530 ) ) ( ON ?auto_119529 ?auto_119524 ) ( ON-TABLE ?auto_119530 ) ( ON ?auto_119528 ?auto_119529 ) ( CLEAR ?auto_119527 ) ( ON ?auto_119525 ?auto_119528 ) ( CLEAR ?auto_119525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119530 ?auto_119524 ?auto_119529 ?auto_119528 )
      ( MAKE-1PILE ?auto_119524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119532 - BLOCK
    )
    :vars
    (
      ?auto_119537 - BLOCK
      ?auto_119539 - BLOCK
      ?auto_119535 - BLOCK
      ?auto_119534 - BLOCK
      ?auto_119538 - BLOCK
      ?auto_119533 - BLOCK
      ?auto_119536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119532 ?auto_119537 ) ) ( ON-TABLE ?auto_119539 ) ( ON ?auto_119535 ?auto_119539 ) ( not ( = ?auto_119539 ?auto_119535 ) ) ( not ( = ?auto_119539 ?auto_119534 ) ) ( not ( = ?auto_119539 ?auto_119538 ) ) ( not ( = ?auto_119539 ?auto_119533 ) ) ( not ( = ?auto_119539 ?auto_119537 ) ) ( not ( = ?auto_119539 ?auto_119532 ) ) ( not ( = ?auto_119535 ?auto_119534 ) ) ( not ( = ?auto_119535 ?auto_119538 ) ) ( not ( = ?auto_119535 ?auto_119533 ) ) ( not ( = ?auto_119535 ?auto_119537 ) ) ( not ( = ?auto_119535 ?auto_119532 ) ) ( not ( = ?auto_119534 ?auto_119538 ) ) ( not ( = ?auto_119534 ?auto_119533 ) ) ( not ( = ?auto_119534 ?auto_119537 ) ) ( not ( = ?auto_119534 ?auto_119532 ) ) ( not ( = ?auto_119538 ?auto_119533 ) ) ( not ( = ?auto_119538 ?auto_119537 ) ) ( not ( = ?auto_119538 ?auto_119532 ) ) ( not ( = ?auto_119533 ?auto_119537 ) ) ( not ( = ?auto_119533 ?auto_119532 ) ) ( ON ?auto_119532 ?auto_119536 ) ( not ( = ?auto_119532 ?auto_119536 ) ) ( not ( = ?auto_119537 ?auto_119536 ) ) ( not ( = ?auto_119539 ?auto_119536 ) ) ( not ( = ?auto_119535 ?auto_119536 ) ) ( not ( = ?auto_119534 ?auto_119536 ) ) ( not ( = ?auto_119538 ?auto_119536 ) ) ( not ( = ?auto_119533 ?auto_119536 ) ) ( ON ?auto_119537 ?auto_119532 ) ( ON-TABLE ?auto_119536 ) ( ON ?auto_119533 ?auto_119537 ) ( ON ?auto_119538 ?auto_119533 ) ( CLEAR ?auto_119538 ) ( HOLDING ?auto_119534 ) ( CLEAR ?auto_119535 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119539 ?auto_119535 ?auto_119534 )
      ( MAKE-1PILE ?auto_119532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119540 - BLOCK
    )
    :vars
    (
      ?auto_119542 - BLOCK
      ?auto_119546 - BLOCK
      ?auto_119544 - BLOCK
      ?auto_119547 - BLOCK
      ?auto_119543 - BLOCK
      ?auto_119545 - BLOCK
      ?auto_119541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119540 ?auto_119542 ) ) ( ON-TABLE ?auto_119546 ) ( ON ?auto_119544 ?auto_119546 ) ( not ( = ?auto_119546 ?auto_119544 ) ) ( not ( = ?auto_119546 ?auto_119547 ) ) ( not ( = ?auto_119546 ?auto_119543 ) ) ( not ( = ?auto_119546 ?auto_119545 ) ) ( not ( = ?auto_119546 ?auto_119542 ) ) ( not ( = ?auto_119546 ?auto_119540 ) ) ( not ( = ?auto_119544 ?auto_119547 ) ) ( not ( = ?auto_119544 ?auto_119543 ) ) ( not ( = ?auto_119544 ?auto_119545 ) ) ( not ( = ?auto_119544 ?auto_119542 ) ) ( not ( = ?auto_119544 ?auto_119540 ) ) ( not ( = ?auto_119547 ?auto_119543 ) ) ( not ( = ?auto_119547 ?auto_119545 ) ) ( not ( = ?auto_119547 ?auto_119542 ) ) ( not ( = ?auto_119547 ?auto_119540 ) ) ( not ( = ?auto_119543 ?auto_119545 ) ) ( not ( = ?auto_119543 ?auto_119542 ) ) ( not ( = ?auto_119543 ?auto_119540 ) ) ( not ( = ?auto_119545 ?auto_119542 ) ) ( not ( = ?auto_119545 ?auto_119540 ) ) ( ON ?auto_119540 ?auto_119541 ) ( not ( = ?auto_119540 ?auto_119541 ) ) ( not ( = ?auto_119542 ?auto_119541 ) ) ( not ( = ?auto_119546 ?auto_119541 ) ) ( not ( = ?auto_119544 ?auto_119541 ) ) ( not ( = ?auto_119547 ?auto_119541 ) ) ( not ( = ?auto_119543 ?auto_119541 ) ) ( not ( = ?auto_119545 ?auto_119541 ) ) ( ON ?auto_119542 ?auto_119540 ) ( ON-TABLE ?auto_119541 ) ( ON ?auto_119545 ?auto_119542 ) ( ON ?auto_119543 ?auto_119545 ) ( CLEAR ?auto_119544 ) ( ON ?auto_119547 ?auto_119543 ) ( CLEAR ?auto_119547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119541 ?auto_119540 ?auto_119542 ?auto_119545 ?auto_119543 )
      ( MAKE-1PILE ?auto_119540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119548 - BLOCK
    )
    :vars
    (
      ?auto_119550 - BLOCK
      ?auto_119549 - BLOCK
      ?auto_119552 - BLOCK
      ?auto_119551 - BLOCK
      ?auto_119553 - BLOCK
      ?auto_119555 - BLOCK
      ?auto_119554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119548 ?auto_119550 ) ) ( ON-TABLE ?auto_119549 ) ( not ( = ?auto_119549 ?auto_119552 ) ) ( not ( = ?auto_119549 ?auto_119551 ) ) ( not ( = ?auto_119549 ?auto_119553 ) ) ( not ( = ?auto_119549 ?auto_119555 ) ) ( not ( = ?auto_119549 ?auto_119550 ) ) ( not ( = ?auto_119549 ?auto_119548 ) ) ( not ( = ?auto_119552 ?auto_119551 ) ) ( not ( = ?auto_119552 ?auto_119553 ) ) ( not ( = ?auto_119552 ?auto_119555 ) ) ( not ( = ?auto_119552 ?auto_119550 ) ) ( not ( = ?auto_119552 ?auto_119548 ) ) ( not ( = ?auto_119551 ?auto_119553 ) ) ( not ( = ?auto_119551 ?auto_119555 ) ) ( not ( = ?auto_119551 ?auto_119550 ) ) ( not ( = ?auto_119551 ?auto_119548 ) ) ( not ( = ?auto_119553 ?auto_119555 ) ) ( not ( = ?auto_119553 ?auto_119550 ) ) ( not ( = ?auto_119553 ?auto_119548 ) ) ( not ( = ?auto_119555 ?auto_119550 ) ) ( not ( = ?auto_119555 ?auto_119548 ) ) ( ON ?auto_119548 ?auto_119554 ) ( not ( = ?auto_119548 ?auto_119554 ) ) ( not ( = ?auto_119550 ?auto_119554 ) ) ( not ( = ?auto_119549 ?auto_119554 ) ) ( not ( = ?auto_119552 ?auto_119554 ) ) ( not ( = ?auto_119551 ?auto_119554 ) ) ( not ( = ?auto_119553 ?auto_119554 ) ) ( not ( = ?auto_119555 ?auto_119554 ) ) ( ON ?auto_119550 ?auto_119548 ) ( ON-TABLE ?auto_119554 ) ( ON ?auto_119555 ?auto_119550 ) ( ON ?auto_119553 ?auto_119555 ) ( ON ?auto_119551 ?auto_119553 ) ( CLEAR ?auto_119551 ) ( HOLDING ?auto_119552 ) ( CLEAR ?auto_119549 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119549 ?auto_119552 )
      ( MAKE-1PILE ?auto_119548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119556 - BLOCK
    )
    :vars
    (
      ?auto_119563 - BLOCK
      ?auto_119561 - BLOCK
      ?auto_119559 - BLOCK
      ?auto_119558 - BLOCK
      ?auto_119557 - BLOCK
      ?auto_119560 - BLOCK
      ?auto_119562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119556 ?auto_119563 ) ) ( ON-TABLE ?auto_119561 ) ( not ( = ?auto_119561 ?auto_119559 ) ) ( not ( = ?auto_119561 ?auto_119558 ) ) ( not ( = ?auto_119561 ?auto_119557 ) ) ( not ( = ?auto_119561 ?auto_119560 ) ) ( not ( = ?auto_119561 ?auto_119563 ) ) ( not ( = ?auto_119561 ?auto_119556 ) ) ( not ( = ?auto_119559 ?auto_119558 ) ) ( not ( = ?auto_119559 ?auto_119557 ) ) ( not ( = ?auto_119559 ?auto_119560 ) ) ( not ( = ?auto_119559 ?auto_119563 ) ) ( not ( = ?auto_119559 ?auto_119556 ) ) ( not ( = ?auto_119558 ?auto_119557 ) ) ( not ( = ?auto_119558 ?auto_119560 ) ) ( not ( = ?auto_119558 ?auto_119563 ) ) ( not ( = ?auto_119558 ?auto_119556 ) ) ( not ( = ?auto_119557 ?auto_119560 ) ) ( not ( = ?auto_119557 ?auto_119563 ) ) ( not ( = ?auto_119557 ?auto_119556 ) ) ( not ( = ?auto_119560 ?auto_119563 ) ) ( not ( = ?auto_119560 ?auto_119556 ) ) ( ON ?auto_119556 ?auto_119562 ) ( not ( = ?auto_119556 ?auto_119562 ) ) ( not ( = ?auto_119563 ?auto_119562 ) ) ( not ( = ?auto_119561 ?auto_119562 ) ) ( not ( = ?auto_119559 ?auto_119562 ) ) ( not ( = ?auto_119558 ?auto_119562 ) ) ( not ( = ?auto_119557 ?auto_119562 ) ) ( not ( = ?auto_119560 ?auto_119562 ) ) ( ON ?auto_119563 ?auto_119556 ) ( ON-TABLE ?auto_119562 ) ( ON ?auto_119560 ?auto_119563 ) ( ON ?auto_119557 ?auto_119560 ) ( ON ?auto_119558 ?auto_119557 ) ( CLEAR ?auto_119561 ) ( ON ?auto_119559 ?auto_119558 ) ( CLEAR ?auto_119559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119562 ?auto_119556 ?auto_119563 ?auto_119560 ?auto_119557 ?auto_119558 )
      ( MAKE-1PILE ?auto_119556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119564 - BLOCK
    )
    :vars
    (
      ?auto_119567 - BLOCK
      ?auto_119566 - BLOCK
      ?auto_119569 - BLOCK
      ?auto_119570 - BLOCK
      ?auto_119571 - BLOCK
      ?auto_119565 - BLOCK
      ?auto_119568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119564 ?auto_119567 ) ) ( not ( = ?auto_119566 ?auto_119569 ) ) ( not ( = ?auto_119566 ?auto_119570 ) ) ( not ( = ?auto_119566 ?auto_119571 ) ) ( not ( = ?auto_119566 ?auto_119565 ) ) ( not ( = ?auto_119566 ?auto_119567 ) ) ( not ( = ?auto_119566 ?auto_119564 ) ) ( not ( = ?auto_119569 ?auto_119570 ) ) ( not ( = ?auto_119569 ?auto_119571 ) ) ( not ( = ?auto_119569 ?auto_119565 ) ) ( not ( = ?auto_119569 ?auto_119567 ) ) ( not ( = ?auto_119569 ?auto_119564 ) ) ( not ( = ?auto_119570 ?auto_119571 ) ) ( not ( = ?auto_119570 ?auto_119565 ) ) ( not ( = ?auto_119570 ?auto_119567 ) ) ( not ( = ?auto_119570 ?auto_119564 ) ) ( not ( = ?auto_119571 ?auto_119565 ) ) ( not ( = ?auto_119571 ?auto_119567 ) ) ( not ( = ?auto_119571 ?auto_119564 ) ) ( not ( = ?auto_119565 ?auto_119567 ) ) ( not ( = ?auto_119565 ?auto_119564 ) ) ( ON ?auto_119564 ?auto_119568 ) ( not ( = ?auto_119564 ?auto_119568 ) ) ( not ( = ?auto_119567 ?auto_119568 ) ) ( not ( = ?auto_119566 ?auto_119568 ) ) ( not ( = ?auto_119569 ?auto_119568 ) ) ( not ( = ?auto_119570 ?auto_119568 ) ) ( not ( = ?auto_119571 ?auto_119568 ) ) ( not ( = ?auto_119565 ?auto_119568 ) ) ( ON ?auto_119567 ?auto_119564 ) ( ON-TABLE ?auto_119568 ) ( ON ?auto_119565 ?auto_119567 ) ( ON ?auto_119571 ?auto_119565 ) ( ON ?auto_119570 ?auto_119571 ) ( ON ?auto_119569 ?auto_119570 ) ( CLEAR ?auto_119569 ) ( HOLDING ?auto_119566 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119566 )
      ( MAKE-1PILE ?auto_119564 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_119572 - BLOCK
    )
    :vars
    (
      ?auto_119577 - BLOCK
      ?auto_119575 - BLOCK
      ?auto_119576 - BLOCK
      ?auto_119573 - BLOCK
      ?auto_119578 - BLOCK
      ?auto_119579 - BLOCK
      ?auto_119574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119572 ?auto_119577 ) ) ( not ( = ?auto_119575 ?auto_119576 ) ) ( not ( = ?auto_119575 ?auto_119573 ) ) ( not ( = ?auto_119575 ?auto_119578 ) ) ( not ( = ?auto_119575 ?auto_119579 ) ) ( not ( = ?auto_119575 ?auto_119577 ) ) ( not ( = ?auto_119575 ?auto_119572 ) ) ( not ( = ?auto_119576 ?auto_119573 ) ) ( not ( = ?auto_119576 ?auto_119578 ) ) ( not ( = ?auto_119576 ?auto_119579 ) ) ( not ( = ?auto_119576 ?auto_119577 ) ) ( not ( = ?auto_119576 ?auto_119572 ) ) ( not ( = ?auto_119573 ?auto_119578 ) ) ( not ( = ?auto_119573 ?auto_119579 ) ) ( not ( = ?auto_119573 ?auto_119577 ) ) ( not ( = ?auto_119573 ?auto_119572 ) ) ( not ( = ?auto_119578 ?auto_119579 ) ) ( not ( = ?auto_119578 ?auto_119577 ) ) ( not ( = ?auto_119578 ?auto_119572 ) ) ( not ( = ?auto_119579 ?auto_119577 ) ) ( not ( = ?auto_119579 ?auto_119572 ) ) ( ON ?auto_119572 ?auto_119574 ) ( not ( = ?auto_119572 ?auto_119574 ) ) ( not ( = ?auto_119577 ?auto_119574 ) ) ( not ( = ?auto_119575 ?auto_119574 ) ) ( not ( = ?auto_119576 ?auto_119574 ) ) ( not ( = ?auto_119573 ?auto_119574 ) ) ( not ( = ?auto_119578 ?auto_119574 ) ) ( not ( = ?auto_119579 ?auto_119574 ) ) ( ON ?auto_119577 ?auto_119572 ) ( ON-TABLE ?auto_119574 ) ( ON ?auto_119579 ?auto_119577 ) ( ON ?auto_119578 ?auto_119579 ) ( ON ?auto_119573 ?auto_119578 ) ( ON ?auto_119576 ?auto_119573 ) ( ON ?auto_119575 ?auto_119576 ) ( CLEAR ?auto_119575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119574 ?auto_119572 ?auto_119577 ?auto_119579 ?auto_119578 ?auto_119573 ?auto_119576 )
      ( MAKE-1PILE ?auto_119572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119585 - BLOCK
      ?auto_119586 - BLOCK
      ?auto_119587 - BLOCK
      ?auto_119588 - BLOCK
      ?auto_119589 - BLOCK
    )
    :vars
    (
      ?auto_119590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119590 ?auto_119589 ) ( CLEAR ?auto_119590 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119585 ) ( ON ?auto_119586 ?auto_119585 ) ( ON ?auto_119587 ?auto_119586 ) ( ON ?auto_119588 ?auto_119587 ) ( ON ?auto_119589 ?auto_119588 ) ( not ( = ?auto_119585 ?auto_119586 ) ) ( not ( = ?auto_119585 ?auto_119587 ) ) ( not ( = ?auto_119585 ?auto_119588 ) ) ( not ( = ?auto_119585 ?auto_119589 ) ) ( not ( = ?auto_119585 ?auto_119590 ) ) ( not ( = ?auto_119586 ?auto_119587 ) ) ( not ( = ?auto_119586 ?auto_119588 ) ) ( not ( = ?auto_119586 ?auto_119589 ) ) ( not ( = ?auto_119586 ?auto_119590 ) ) ( not ( = ?auto_119587 ?auto_119588 ) ) ( not ( = ?auto_119587 ?auto_119589 ) ) ( not ( = ?auto_119587 ?auto_119590 ) ) ( not ( = ?auto_119588 ?auto_119589 ) ) ( not ( = ?auto_119588 ?auto_119590 ) ) ( not ( = ?auto_119589 ?auto_119590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119590 ?auto_119589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119591 - BLOCK
      ?auto_119592 - BLOCK
      ?auto_119593 - BLOCK
      ?auto_119594 - BLOCK
      ?auto_119595 - BLOCK
    )
    :vars
    (
      ?auto_119596 - BLOCK
      ?auto_119597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119596 ?auto_119595 ) ( CLEAR ?auto_119596 ) ( ON-TABLE ?auto_119591 ) ( ON ?auto_119592 ?auto_119591 ) ( ON ?auto_119593 ?auto_119592 ) ( ON ?auto_119594 ?auto_119593 ) ( ON ?auto_119595 ?auto_119594 ) ( not ( = ?auto_119591 ?auto_119592 ) ) ( not ( = ?auto_119591 ?auto_119593 ) ) ( not ( = ?auto_119591 ?auto_119594 ) ) ( not ( = ?auto_119591 ?auto_119595 ) ) ( not ( = ?auto_119591 ?auto_119596 ) ) ( not ( = ?auto_119592 ?auto_119593 ) ) ( not ( = ?auto_119592 ?auto_119594 ) ) ( not ( = ?auto_119592 ?auto_119595 ) ) ( not ( = ?auto_119592 ?auto_119596 ) ) ( not ( = ?auto_119593 ?auto_119594 ) ) ( not ( = ?auto_119593 ?auto_119595 ) ) ( not ( = ?auto_119593 ?auto_119596 ) ) ( not ( = ?auto_119594 ?auto_119595 ) ) ( not ( = ?auto_119594 ?auto_119596 ) ) ( not ( = ?auto_119595 ?auto_119596 ) ) ( HOLDING ?auto_119597 ) ( not ( = ?auto_119591 ?auto_119597 ) ) ( not ( = ?auto_119592 ?auto_119597 ) ) ( not ( = ?auto_119593 ?auto_119597 ) ) ( not ( = ?auto_119594 ?auto_119597 ) ) ( not ( = ?auto_119595 ?auto_119597 ) ) ( not ( = ?auto_119596 ?auto_119597 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_119597 )
      ( MAKE-5PILE ?auto_119591 ?auto_119592 ?auto_119593 ?auto_119594 ?auto_119595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119598 - BLOCK
      ?auto_119599 - BLOCK
      ?auto_119600 - BLOCK
      ?auto_119601 - BLOCK
      ?auto_119602 - BLOCK
    )
    :vars
    (
      ?auto_119603 - BLOCK
      ?auto_119604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119603 ?auto_119602 ) ( ON-TABLE ?auto_119598 ) ( ON ?auto_119599 ?auto_119598 ) ( ON ?auto_119600 ?auto_119599 ) ( ON ?auto_119601 ?auto_119600 ) ( ON ?auto_119602 ?auto_119601 ) ( not ( = ?auto_119598 ?auto_119599 ) ) ( not ( = ?auto_119598 ?auto_119600 ) ) ( not ( = ?auto_119598 ?auto_119601 ) ) ( not ( = ?auto_119598 ?auto_119602 ) ) ( not ( = ?auto_119598 ?auto_119603 ) ) ( not ( = ?auto_119599 ?auto_119600 ) ) ( not ( = ?auto_119599 ?auto_119601 ) ) ( not ( = ?auto_119599 ?auto_119602 ) ) ( not ( = ?auto_119599 ?auto_119603 ) ) ( not ( = ?auto_119600 ?auto_119601 ) ) ( not ( = ?auto_119600 ?auto_119602 ) ) ( not ( = ?auto_119600 ?auto_119603 ) ) ( not ( = ?auto_119601 ?auto_119602 ) ) ( not ( = ?auto_119601 ?auto_119603 ) ) ( not ( = ?auto_119602 ?auto_119603 ) ) ( not ( = ?auto_119598 ?auto_119604 ) ) ( not ( = ?auto_119599 ?auto_119604 ) ) ( not ( = ?auto_119600 ?auto_119604 ) ) ( not ( = ?auto_119601 ?auto_119604 ) ) ( not ( = ?auto_119602 ?auto_119604 ) ) ( not ( = ?auto_119603 ?auto_119604 ) ) ( ON ?auto_119604 ?auto_119603 ) ( CLEAR ?auto_119604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119598 ?auto_119599 ?auto_119600 ?auto_119601 ?auto_119602 ?auto_119603 )
      ( MAKE-5PILE ?auto_119598 ?auto_119599 ?auto_119600 ?auto_119601 ?auto_119602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119605 - BLOCK
      ?auto_119606 - BLOCK
      ?auto_119607 - BLOCK
      ?auto_119608 - BLOCK
      ?auto_119609 - BLOCK
    )
    :vars
    (
      ?auto_119610 - BLOCK
      ?auto_119611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119610 ?auto_119609 ) ( ON-TABLE ?auto_119605 ) ( ON ?auto_119606 ?auto_119605 ) ( ON ?auto_119607 ?auto_119606 ) ( ON ?auto_119608 ?auto_119607 ) ( ON ?auto_119609 ?auto_119608 ) ( not ( = ?auto_119605 ?auto_119606 ) ) ( not ( = ?auto_119605 ?auto_119607 ) ) ( not ( = ?auto_119605 ?auto_119608 ) ) ( not ( = ?auto_119605 ?auto_119609 ) ) ( not ( = ?auto_119605 ?auto_119610 ) ) ( not ( = ?auto_119606 ?auto_119607 ) ) ( not ( = ?auto_119606 ?auto_119608 ) ) ( not ( = ?auto_119606 ?auto_119609 ) ) ( not ( = ?auto_119606 ?auto_119610 ) ) ( not ( = ?auto_119607 ?auto_119608 ) ) ( not ( = ?auto_119607 ?auto_119609 ) ) ( not ( = ?auto_119607 ?auto_119610 ) ) ( not ( = ?auto_119608 ?auto_119609 ) ) ( not ( = ?auto_119608 ?auto_119610 ) ) ( not ( = ?auto_119609 ?auto_119610 ) ) ( not ( = ?auto_119605 ?auto_119611 ) ) ( not ( = ?auto_119606 ?auto_119611 ) ) ( not ( = ?auto_119607 ?auto_119611 ) ) ( not ( = ?auto_119608 ?auto_119611 ) ) ( not ( = ?auto_119609 ?auto_119611 ) ) ( not ( = ?auto_119610 ?auto_119611 ) ) ( HOLDING ?auto_119611 ) ( CLEAR ?auto_119610 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119605 ?auto_119606 ?auto_119607 ?auto_119608 ?auto_119609 ?auto_119610 ?auto_119611 )
      ( MAKE-5PILE ?auto_119605 ?auto_119606 ?auto_119607 ?auto_119608 ?auto_119609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119612 - BLOCK
      ?auto_119613 - BLOCK
      ?auto_119614 - BLOCK
      ?auto_119615 - BLOCK
      ?auto_119616 - BLOCK
    )
    :vars
    (
      ?auto_119618 - BLOCK
      ?auto_119617 - BLOCK
      ?auto_119619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119618 ?auto_119616 ) ( ON-TABLE ?auto_119612 ) ( ON ?auto_119613 ?auto_119612 ) ( ON ?auto_119614 ?auto_119613 ) ( ON ?auto_119615 ?auto_119614 ) ( ON ?auto_119616 ?auto_119615 ) ( not ( = ?auto_119612 ?auto_119613 ) ) ( not ( = ?auto_119612 ?auto_119614 ) ) ( not ( = ?auto_119612 ?auto_119615 ) ) ( not ( = ?auto_119612 ?auto_119616 ) ) ( not ( = ?auto_119612 ?auto_119618 ) ) ( not ( = ?auto_119613 ?auto_119614 ) ) ( not ( = ?auto_119613 ?auto_119615 ) ) ( not ( = ?auto_119613 ?auto_119616 ) ) ( not ( = ?auto_119613 ?auto_119618 ) ) ( not ( = ?auto_119614 ?auto_119615 ) ) ( not ( = ?auto_119614 ?auto_119616 ) ) ( not ( = ?auto_119614 ?auto_119618 ) ) ( not ( = ?auto_119615 ?auto_119616 ) ) ( not ( = ?auto_119615 ?auto_119618 ) ) ( not ( = ?auto_119616 ?auto_119618 ) ) ( not ( = ?auto_119612 ?auto_119617 ) ) ( not ( = ?auto_119613 ?auto_119617 ) ) ( not ( = ?auto_119614 ?auto_119617 ) ) ( not ( = ?auto_119615 ?auto_119617 ) ) ( not ( = ?auto_119616 ?auto_119617 ) ) ( not ( = ?auto_119618 ?auto_119617 ) ) ( CLEAR ?auto_119618 ) ( ON ?auto_119617 ?auto_119619 ) ( CLEAR ?auto_119617 ) ( HAND-EMPTY ) ( not ( = ?auto_119612 ?auto_119619 ) ) ( not ( = ?auto_119613 ?auto_119619 ) ) ( not ( = ?auto_119614 ?auto_119619 ) ) ( not ( = ?auto_119615 ?auto_119619 ) ) ( not ( = ?auto_119616 ?auto_119619 ) ) ( not ( = ?auto_119618 ?auto_119619 ) ) ( not ( = ?auto_119617 ?auto_119619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119617 ?auto_119619 )
      ( MAKE-5PILE ?auto_119612 ?auto_119613 ?auto_119614 ?auto_119615 ?auto_119616 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119636 - BLOCK
      ?auto_119637 - BLOCK
      ?auto_119638 - BLOCK
      ?auto_119639 - BLOCK
      ?auto_119640 - BLOCK
    )
    :vars
    (
      ?auto_119642 - BLOCK
      ?auto_119641 - BLOCK
      ?auto_119643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119636 ) ( ON ?auto_119637 ?auto_119636 ) ( ON ?auto_119638 ?auto_119637 ) ( ON ?auto_119639 ?auto_119638 ) ( not ( = ?auto_119636 ?auto_119637 ) ) ( not ( = ?auto_119636 ?auto_119638 ) ) ( not ( = ?auto_119636 ?auto_119639 ) ) ( not ( = ?auto_119636 ?auto_119640 ) ) ( not ( = ?auto_119636 ?auto_119642 ) ) ( not ( = ?auto_119637 ?auto_119638 ) ) ( not ( = ?auto_119637 ?auto_119639 ) ) ( not ( = ?auto_119637 ?auto_119640 ) ) ( not ( = ?auto_119637 ?auto_119642 ) ) ( not ( = ?auto_119638 ?auto_119639 ) ) ( not ( = ?auto_119638 ?auto_119640 ) ) ( not ( = ?auto_119638 ?auto_119642 ) ) ( not ( = ?auto_119639 ?auto_119640 ) ) ( not ( = ?auto_119639 ?auto_119642 ) ) ( not ( = ?auto_119640 ?auto_119642 ) ) ( not ( = ?auto_119636 ?auto_119641 ) ) ( not ( = ?auto_119637 ?auto_119641 ) ) ( not ( = ?auto_119638 ?auto_119641 ) ) ( not ( = ?auto_119639 ?auto_119641 ) ) ( not ( = ?auto_119640 ?auto_119641 ) ) ( not ( = ?auto_119642 ?auto_119641 ) ) ( ON ?auto_119641 ?auto_119643 ) ( not ( = ?auto_119636 ?auto_119643 ) ) ( not ( = ?auto_119637 ?auto_119643 ) ) ( not ( = ?auto_119638 ?auto_119643 ) ) ( not ( = ?auto_119639 ?auto_119643 ) ) ( not ( = ?auto_119640 ?auto_119643 ) ) ( not ( = ?auto_119642 ?auto_119643 ) ) ( not ( = ?auto_119641 ?auto_119643 ) ) ( ON ?auto_119642 ?auto_119641 ) ( CLEAR ?auto_119642 ) ( HOLDING ?auto_119640 ) ( CLEAR ?auto_119639 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119636 ?auto_119637 ?auto_119638 ?auto_119639 ?auto_119640 ?auto_119642 )
      ( MAKE-5PILE ?auto_119636 ?auto_119637 ?auto_119638 ?auto_119639 ?auto_119640 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119644 - BLOCK
      ?auto_119645 - BLOCK
      ?auto_119646 - BLOCK
      ?auto_119647 - BLOCK
      ?auto_119648 - BLOCK
    )
    :vars
    (
      ?auto_119651 - BLOCK
      ?auto_119649 - BLOCK
      ?auto_119650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119644 ) ( ON ?auto_119645 ?auto_119644 ) ( ON ?auto_119646 ?auto_119645 ) ( ON ?auto_119647 ?auto_119646 ) ( not ( = ?auto_119644 ?auto_119645 ) ) ( not ( = ?auto_119644 ?auto_119646 ) ) ( not ( = ?auto_119644 ?auto_119647 ) ) ( not ( = ?auto_119644 ?auto_119648 ) ) ( not ( = ?auto_119644 ?auto_119651 ) ) ( not ( = ?auto_119645 ?auto_119646 ) ) ( not ( = ?auto_119645 ?auto_119647 ) ) ( not ( = ?auto_119645 ?auto_119648 ) ) ( not ( = ?auto_119645 ?auto_119651 ) ) ( not ( = ?auto_119646 ?auto_119647 ) ) ( not ( = ?auto_119646 ?auto_119648 ) ) ( not ( = ?auto_119646 ?auto_119651 ) ) ( not ( = ?auto_119647 ?auto_119648 ) ) ( not ( = ?auto_119647 ?auto_119651 ) ) ( not ( = ?auto_119648 ?auto_119651 ) ) ( not ( = ?auto_119644 ?auto_119649 ) ) ( not ( = ?auto_119645 ?auto_119649 ) ) ( not ( = ?auto_119646 ?auto_119649 ) ) ( not ( = ?auto_119647 ?auto_119649 ) ) ( not ( = ?auto_119648 ?auto_119649 ) ) ( not ( = ?auto_119651 ?auto_119649 ) ) ( ON ?auto_119649 ?auto_119650 ) ( not ( = ?auto_119644 ?auto_119650 ) ) ( not ( = ?auto_119645 ?auto_119650 ) ) ( not ( = ?auto_119646 ?auto_119650 ) ) ( not ( = ?auto_119647 ?auto_119650 ) ) ( not ( = ?auto_119648 ?auto_119650 ) ) ( not ( = ?auto_119651 ?auto_119650 ) ) ( not ( = ?auto_119649 ?auto_119650 ) ) ( ON ?auto_119651 ?auto_119649 ) ( CLEAR ?auto_119647 ) ( ON ?auto_119648 ?auto_119651 ) ( CLEAR ?auto_119648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119650 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119650 ?auto_119649 ?auto_119651 )
      ( MAKE-5PILE ?auto_119644 ?auto_119645 ?auto_119646 ?auto_119647 ?auto_119648 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119652 - BLOCK
      ?auto_119653 - BLOCK
      ?auto_119654 - BLOCK
      ?auto_119655 - BLOCK
      ?auto_119656 - BLOCK
    )
    :vars
    (
      ?auto_119658 - BLOCK
      ?auto_119659 - BLOCK
      ?auto_119657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119652 ) ( ON ?auto_119653 ?auto_119652 ) ( ON ?auto_119654 ?auto_119653 ) ( not ( = ?auto_119652 ?auto_119653 ) ) ( not ( = ?auto_119652 ?auto_119654 ) ) ( not ( = ?auto_119652 ?auto_119655 ) ) ( not ( = ?auto_119652 ?auto_119656 ) ) ( not ( = ?auto_119652 ?auto_119658 ) ) ( not ( = ?auto_119653 ?auto_119654 ) ) ( not ( = ?auto_119653 ?auto_119655 ) ) ( not ( = ?auto_119653 ?auto_119656 ) ) ( not ( = ?auto_119653 ?auto_119658 ) ) ( not ( = ?auto_119654 ?auto_119655 ) ) ( not ( = ?auto_119654 ?auto_119656 ) ) ( not ( = ?auto_119654 ?auto_119658 ) ) ( not ( = ?auto_119655 ?auto_119656 ) ) ( not ( = ?auto_119655 ?auto_119658 ) ) ( not ( = ?auto_119656 ?auto_119658 ) ) ( not ( = ?auto_119652 ?auto_119659 ) ) ( not ( = ?auto_119653 ?auto_119659 ) ) ( not ( = ?auto_119654 ?auto_119659 ) ) ( not ( = ?auto_119655 ?auto_119659 ) ) ( not ( = ?auto_119656 ?auto_119659 ) ) ( not ( = ?auto_119658 ?auto_119659 ) ) ( ON ?auto_119659 ?auto_119657 ) ( not ( = ?auto_119652 ?auto_119657 ) ) ( not ( = ?auto_119653 ?auto_119657 ) ) ( not ( = ?auto_119654 ?auto_119657 ) ) ( not ( = ?auto_119655 ?auto_119657 ) ) ( not ( = ?auto_119656 ?auto_119657 ) ) ( not ( = ?auto_119658 ?auto_119657 ) ) ( not ( = ?auto_119659 ?auto_119657 ) ) ( ON ?auto_119658 ?auto_119659 ) ( ON ?auto_119656 ?auto_119658 ) ( CLEAR ?auto_119656 ) ( ON-TABLE ?auto_119657 ) ( HOLDING ?auto_119655 ) ( CLEAR ?auto_119654 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119652 ?auto_119653 ?auto_119654 ?auto_119655 )
      ( MAKE-5PILE ?auto_119652 ?auto_119653 ?auto_119654 ?auto_119655 ?auto_119656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119660 - BLOCK
      ?auto_119661 - BLOCK
      ?auto_119662 - BLOCK
      ?auto_119663 - BLOCK
      ?auto_119664 - BLOCK
    )
    :vars
    (
      ?auto_119665 - BLOCK
      ?auto_119667 - BLOCK
      ?auto_119666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119660 ) ( ON ?auto_119661 ?auto_119660 ) ( ON ?auto_119662 ?auto_119661 ) ( not ( = ?auto_119660 ?auto_119661 ) ) ( not ( = ?auto_119660 ?auto_119662 ) ) ( not ( = ?auto_119660 ?auto_119663 ) ) ( not ( = ?auto_119660 ?auto_119664 ) ) ( not ( = ?auto_119660 ?auto_119665 ) ) ( not ( = ?auto_119661 ?auto_119662 ) ) ( not ( = ?auto_119661 ?auto_119663 ) ) ( not ( = ?auto_119661 ?auto_119664 ) ) ( not ( = ?auto_119661 ?auto_119665 ) ) ( not ( = ?auto_119662 ?auto_119663 ) ) ( not ( = ?auto_119662 ?auto_119664 ) ) ( not ( = ?auto_119662 ?auto_119665 ) ) ( not ( = ?auto_119663 ?auto_119664 ) ) ( not ( = ?auto_119663 ?auto_119665 ) ) ( not ( = ?auto_119664 ?auto_119665 ) ) ( not ( = ?auto_119660 ?auto_119667 ) ) ( not ( = ?auto_119661 ?auto_119667 ) ) ( not ( = ?auto_119662 ?auto_119667 ) ) ( not ( = ?auto_119663 ?auto_119667 ) ) ( not ( = ?auto_119664 ?auto_119667 ) ) ( not ( = ?auto_119665 ?auto_119667 ) ) ( ON ?auto_119667 ?auto_119666 ) ( not ( = ?auto_119660 ?auto_119666 ) ) ( not ( = ?auto_119661 ?auto_119666 ) ) ( not ( = ?auto_119662 ?auto_119666 ) ) ( not ( = ?auto_119663 ?auto_119666 ) ) ( not ( = ?auto_119664 ?auto_119666 ) ) ( not ( = ?auto_119665 ?auto_119666 ) ) ( not ( = ?auto_119667 ?auto_119666 ) ) ( ON ?auto_119665 ?auto_119667 ) ( ON ?auto_119664 ?auto_119665 ) ( ON-TABLE ?auto_119666 ) ( CLEAR ?auto_119662 ) ( ON ?auto_119663 ?auto_119664 ) ( CLEAR ?auto_119663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119666 ?auto_119667 ?auto_119665 ?auto_119664 )
      ( MAKE-5PILE ?auto_119660 ?auto_119661 ?auto_119662 ?auto_119663 ?auto_119664 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119668 - BLOCK
      ?auto_119669 - BLOCK
      ?auto_119670 - BLOCK
      ?auto_119671 - BLOCK
      ?auto_119672 - BLOCK
    )
    :vars
    (
      ?auto_119675 - BLOCK
      ?auto_119673 - BLOCK
      ?auto_119674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119668 ) ( ON ?auto_119669 ?auto_119668 ) ( not ( = ?auto_119668 ?auto_119669 ) ) ( not ( = ?auto_119668 ?auto_119670 ) ) ( not ( = ?auto_119668 ?auto_119671 ) ) ( not ( = ?auto_119668 ?auto_119672 ) ) ( not ( = ?auto_119668 ?auto_119675 ) ) ( not ( = ?auto_119669 ?auto_119670 ) ) ( not ( = ?auto_119669 ?auto_119671 ) ) ( not ( = ?auto_119669 ?auto_119672 ) ) ( not ( = ?auto_119669 ?auto_119675 ) ) ( not ( = ?auto_119670 ?auto_119671 ) ) ( not ( = ?auto_119670 ?auto_119672 ) ) ( not ( = ?auto_119670 ?auto_119675 ) ) ( not ( = ?auto_119671 ?auto_119672 ) ) ( not ( = ?auto_119671 ?auto_119675 ) ) ( not ( = ?auto_119672 ?auto_119675 ) ) ( not ( = ?auto_119668 ?auto_119673 ) ) ( not ( = ?auto_119669 ?auto_119673 ) ) ( not ( = ?auto_119670 ?auto_119673 ) ) ( not ( = ?auto_119671 ?auto_119673 ) ) ( not ( = ?auto_119672 ?auto_119673 ) ) ( not ( = ?auto_119675 ?auto_119673 ) ) ( ON ?auto_119673 ?auto_119674 ) ( not ( = ?auto_119668 ?auto_119674 ) ) ( not ( = ?auto_119669 ?auto_119674 ) ) ( not ( = ?auto_119670 ?auto_119674 ) ) ( not ( = ?auto_119671 ?auto_119674 ) ) ( not ( = ?auto_119672 ?auto_119674 ) ) ( not ( = ?auto_119675 ?auto_119674 ) ) ( not ( = ?auto_119673 ?auto_119674 ) ) ( ON ?auto_119675 ?auto_119673 ) ( ON ?auto_119672 ?auto_119675 ) ( ON-TABLE ?auto_119674 ) ( ON ?auto_119671 ?auto_119672 ) ( CLEAR ?auto_119671 ) ( HOLDING ?auto_119670 ) ( CLEAR ?auto_119669 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119668 ?auto_119669 ?auto_119670 )
      ( MAKE-5PILE ?auto_119668 ?auto_119669 ?auto_119670 ?auto_119671 ?auto_119672 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119676 - BLOCK
      ?auto_119677 - BLOCK
      ?auto_119678 - BLOCK
      ?auto_119679 - BLOCK
      ?auto_119680 - BLOCK
    )
    :vars
    (
      ?auto_119682 - BLOCK
      ?auto_119683 - BLOCK
      ?auto_119681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119676 ) ( ON ?auto_119677 ?auto_119676 ) ( not ( = ?auto_119676 ?auto_119677 ) ) ( not ( = ?auto_119676 ?auto_119678 ) ) ( not ( = ?auto_119676 ?auto_119679 ) ) ( not ( = ?auto_119676 ?auto_119680 ) ) ( not ( = ?auto_119676 ?auto_119682 ) ) ( not ( = ?auto_119677 ?auto_119678 ) ) ( not ( = ?auto_119677 ?auto_119679 ) ) ( not ( = ?auto_119677 ?auto_119680 ) ) ( not ( = ?auto_119677 ?auto_119682 ) ) ( not ( = ?auto_119678 ?auto_119679 ) ) ( not ( = ?auto_119678 ?auto_119680 ) ) ( not ( = ?auto_119678 ?auto_119682 ) ) ( not ( = ?auto_119679 ?auto_119680 ) ) ( not ( = ?auto_119679 ?auto_119682 ) ) ( not ( = ?auto_119680 ?auto_119682 ) ) ( not ( = ?auto_119676 ?auto_119683 ) ) ( not ( = ?auto_119677 ?auto_119683 ) ) ( not ( = ?auto_119678 ?auto_119683 ) ) ( not ( = ?auto_119679 ?auto_119683 ) ) ( not ( = ?auto_119680 ?auto_119683 ) ) ( not ( = ?auto_119682 ?auto_119683 ) ) ( ON ?auto_119683 ?auto_119681 ) ( not ( = ?auto_119676 ?auto_119681 ) ) ( not ( = ?auto_119677 ?auto_119681 ) ) ( not ( = ?auto_119678 ?auto_119681 ) ) ( not ( = ?auto_119679 ?auto_119681 ) ) ( not ( = ?auto_119680 ?auto_119681 ) ) ( not ( = ?auto_119682 ?auto_119681 ) ) ( not ( = ?auto_119683 ?auto_119681 ) ) ( ON ?auto_119682 ?auto_119683 ) ( ON ?auto_119680 ?auto_119682 ) ( ON-TABLE ?auto_119681 ) ( ON ?auto_119679 ?auto_119680 ) ( CLEAR ?auto_119677 ) ( ON ?auto_119678 ?auto_119679 ) ( CLEAR ?auto_119678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119681 ?auto_119683 ?auto_119682 ?auto_119680 ?auto_119679 )
      ( MAKE-5PILE ?auto_119676 ?auto_119677 ?auto_119678 ?auto_119679 ?auto_119680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119684 - BLOCK
      ?auto_119685 - BLOCK
      ?auto_119686 - BLOCK
      ?auto_119687 - BLOCK
      ?auto_119688 - BLOCK
    )
    :vars
    (
      ?auto_119691 - BLOCK
      ?auto_119690 - BLOCK
      ?auto_119689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119684 ) ( not ( = ?auto_119684 ?auto_119685 ) ) ( not ( = ?auto_119684 ?auto_119686 ) ) ( not ( = ?auto_119684 ?auto_119687 ) ) ( not ( = ?auto_119684 ?auto_119688 ) ) ( not ( = ?auto_119684 ?auto_119691 ) ) ( not ( = ?auto_119685 ?auto_119686 ) ) ( not ( = ?auto_119685 ?auto_119687 ) ) ( not ( = ?auto_119685 ?auto_119688 ) ) ( not ( = ?auto_119685 ?auto_119691 ) ) ( not ( = ?auto_119686 ?auto_119687 ) ) ( not ( = ?auto_119686 ?auto_119688 ) ) ( not ( = ?auto_119686 ?auto_119691 ) ) ( not ( = ?auto_119687 ?auto_119688 ) ) ( not ( = ?auto_119687 ?auto_119691 ) ) ( not ( = ?auto_119688 ?auto_119691 ) ) ( not ( = ?auto_119684 ?auto_119690 ) ) ( not ( = ?auto_119685 ?auto_119690 ) ) ( not ( = ?auto_119686 ?auto_119690 ) ) ( not ( = ?auto_119687 ?auto_119690 ) ) ( not ( = ?auto_119688 ?auto_119690 ) ) ( not ( = ?auto_119691 ?auto_119690 ) ) ( ON ?auto_119690 ?auto_119689 ) ( not ( = ?auto_119684 ?auto_119689 ) ) ( not ( = ?auto_119685 ?auto_119689 ) ) ( not ( = ?auto_119686 ?auto_119689 ) ) ( not ( = ?auto_119687 ?auto_119689 ) ) ( not ( = ?auto_119688 ?auto_119689 ) ) ( not ( = ?auto_119691 ?auto_119689 ) ) ( not ( = ?auto_119690 ?auto_119689 ) ) ( ON ?auto_119691 ?auto_119690 ) ( ON ?auto_119688 ?auto_119691 ) ( ON-TABLE ?auto_119689 ) ( ON ?auto_119687 ?auto_119688 ) ( ON ?auto_119686 ?auto_119687 ) ( CLEAR ?auto_119686 ) ( HOLDING ?auto_119685 ) ( CLEAR ?auto_119684 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119684 ?auto_119685 )
      ( MAKE-5PILE ?auto_119684 ?auto_119685 ?auto_119686 ?auto_119687 ?auto_119688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119692 - BLOCK
      ?auto_119693 - BLOCK
      ?auto_119694 - BLOCK
      ?auto_119695 - BLOCK
      ?auto_119696 - BLOCK
    )
    :vars
    (
      ?auto_119699 - BLOCK
      ?auto_119697 - BLOCK
      ?auto_119698 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119692 ) ( not ( = ?auto_119692 ?auto_119693 ) ) ( not ( = ?auto_119692 ?auto_119694 ) ) ( not ( = ?auto_119692 ?auto_119695 ) ) ( not ( = ?auto_119692 ?auto_119696 ) ) ( not ( = ?auto_119692 ?auto_119699 ) ) ( not ( = ?auto_119693 ?auto_119694 ) ) ( not ( = ?auto_119693 ?auto_119695 ) ) ( not ( = ?auto_119693 ?auto_119696 ) ) ( not ( = ?auto_119693 ?auto_119699 ) ) ( not ( = ?auto_119694 ?auto_119695 ) ) ( not ( = ?auto_119694 ?auto_119696 ) ) ( not ( = ?auto_119694 ?auto_119699 ) ) ( not ( = ?auto_119695 ?auto_119696 ) ) ( not ( = ?auto_119695 ?auto_119699 ) ) ( not ( = ?auto_119696 ?auto_119699 ) ) ( not ( = ?auto_119692 ?auto_119697 ) ) ( not ( = ?auto_119693 ?auto_119697 ) ) ( not ( = ?auto_119694 ?auto_119697 ) ) ( not ( = ?auto_119695 ?auto_119697 ) ) ( not ( = ?auto_119696 ?auto_119697 ) ) ( not ( = ?auto_119699 ?auto_119697 ) ) ( ON ?auto_119697 ?auto_119698 ) ( not ( = ?auto_119692 ?auto_119698 ) ) ( not ( = ?auto_119693 ?auto_119698 ) ) ( not ( = ?auto_119694 ?auto_119698 ) ) ( not ( = ?auto_119695 ?auto_119698 ) ) ( not ( = ?auto_119696 ?auto_119698 ) ) ( not ( = ?auto_119699 ?auto_119698 ) ) ( not ( = ?auto_119697 ?auto_119698 ) ) ( ON ?auto_119699 ?auto_119697 ) ( ON ?auto_119696 ?auto_119699 ) ( ON-TABLE ?auto_119698 ) ( ON ?auto_119695 ?auto_119696 ) ( ON ?auto_119694 ?auto_119695 ) ( CLEAR ?auto_119692 ) ( ON ?auto_119693 ?auto_119694 ) ( CLEAR ?auto_119693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119698 ?auto_119697 ?auto_119699 ?auto_119696 ?auto_119695 ?auto_119694 )
      ( MAKE-5PILE ?auto_119692 ?auto_119693 ?auto_119694 ?auto_119695 ?auto_119696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119700 - BLOCK
      ?auto_119701 - BLOCK
      ?auto_119702 - BLOCK
      ?auto_119703 - BLOCK
      ?auto_119704 - BLOCK
    )
    :vars
    (
      ?auto_119706 - BLOCK
      ?auto_119707 - BLOCK
      ?auto_119705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119700 ?auto_119701 ) ) ( not ( = ?auto_119700 ?auto_119702 ) ) ( not ( = ?auto_119700 ?auto_119703 ) ) ( not ( = ?auto_119700 ?auto_119704 ) ) ( not ( = ?auto_119700 ?auto_119706 ) ) ( not ( = ?auto_119701 ?auto_119702 ) ) ( not ( = ?auto_119701 ?auto_119703 ) ) ( not ( = ?auto_119701 ?auto_119704 ) ) ( not ( = ?auto_119701 ?auto_119706 ) ) ( not ( = ?auto_119702 ?auto_119703 ) ) ( not ( = ?auto_119702 ?auto_119704 ) ) ( not ( = ?auto_119702 ?auto_119706 ) ) ( not ( = ?auto_119703 ?auto_119704 ) ) ( not ( = ?auto_119703 ?auto_119706 ) ) ( not ( = ?auto_119704 ?auto_119706 ) ) ( not ( = ?auto_119700 ?auto_119707 ) ) ( not ( = ?auto_119701 ?auto_119707 ) ) ( not ( = ?auto_119702 ?auto_119707 ) ) ( not ( = ?auto_119703 ?auto_119707 ) ) ( not ( = ?auto_119704 ?auto_119707 ) ) ( not ( = ?auto_119706 ?auto_119707 ) ) ( ON ?auto_119707 ?auto_119705 ) ( not ( = ?auto_119700 ?auto_119705 ) ) ( not ( = ?auto_119701 ?auto_119705 ) ) ( not ( = ?auto_119702 ?auto_119705 ) ) ( not ( = ?auto_119703 ?auto_119705 ) ) ( not ( = ?auto_119704 ?auto_119705 ) ) ( not ( = ?auto_119706 ?auto_119705 ) ) ( not ( = ?auto_119707 ?auto_119705 ) ) ( ON ?auto_119706 ?auto_119707 ) ( ON ?auto_119704 ?auto_119706 ) ( ON-TABLE ?auto_119705 ) ( ON ?auto_119703 ?auto_119704 ) ( ON ?auto_119702 ?auto_119703 ) ( ON ?auto_119701 ?auto_119702 ) ( CLEAR ?auto_119701 ) ( HOLDING ?auto_119700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119700 )
      ( MAKE-5PILE ?auto_119700 ?auto_119701 ?auto_119702 ?auto_119703 ?auto_119704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_119708 - BLOCK
      ?auto_119709 - BLOCK
      ?auto_119710 - BLOCK
      ?auto_119711 - BLOCK
      ?auto_119712 - BLOCK
    )
    :vars
    (
      ?auto_119715 - BLOCK
      ?auto_119714 - BLOCK
      ?auto_119713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119708 ?auto_119709 ) ) ( not ( = ?auto_119708 ?auto_119710 ) ) ( not ( = ?auto_119708 ?auto_119711 ) ) ( not ( = ?auto_119708 ?auto_119712 ) ) ( not ( = ?auto_119708 ?auto_119715 ) ) ( not ( = ?auto_119709 ?auto_119710 ) ) ( not ( = ?auto_119709 ?auto_119711 ) ) ( not ( = ?auto_119709 ?auto_119712 ) ) ( not ( = ?auto_119709 ?auto_119715 ) ) ( not ( = ?auto_119710 ?auto_119711 ) ) ( not ( = ?auto_119710 ?auto_119712 ) ) ( not ( = ?auto_119710 ?auto_119715 ) ) ( not ( = ?auto_119711 ?auto_119712 ) ) ( not ( = ?auto_119711 ?auto_119715 ) ) ( not ( = ?auto_119712 ?auto_119715 ) ) ( not ( = ?auto_119708 ?auto_119714 ) ) ( not ( = ?auto_119709 ?auto_119714 ) ) ( not ( = ?auto_119710 ?auto_119714 ) ) ( not ( = ?auto_119711 ?auto_119714 ) ) ( not ( = ?auto_119712 ?auto_119714 ) ) ( not ( = ?auto_119715 ?auto_119714 ) ) ( ON ?auto_119714 ?auto_119713 ) ( not ( = ?auto_119708 ?auto_119713 ) ) ( not ( = ?auto_119709 ?auto_119713 ) ) ( not ( = ?auto_119710 ?auto_119713 ) ) ( not ( = ?auto_119711 ?auto_119713 ) ) ( not ( = ?auto_119712 ?auto_119713 ) ) ( not ( = ?auto_119715 ?auto_119713 ) ) ( not ( = ?auto_119714 ?auto_119713 ) ) ( ON ?auto_119715 ?auto_119714 ) ( ON ?auto_119712 ?auto_119715 ) ( ON-TABLE ?auto_119713 ) ( ON ?auto_119711 ?auto_119712 ) ( ON ?auto_119710 ?auto_119711 ) ( ON ?auto_119709 ?auto_119710 ) ( ON ?auto_119708 ?auto_119709 ) ( CLEAR ?auto_119708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119713 ?auto_119714 ?auto_119715 ?auto_119712 ?auto_119711 ?auto_119710 ?auto_119709 )
      ( MAKE-5PILE ?auto_119708 ?auto_119709 ?auto_119710 ?auto_119711 ?auto_119712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119718 - BLOCK
      ?auto_119719 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_119719 ) ( CLEAR ?auto_119718 ) ( ON-TABLE ?auto_119718 ) ( not ( = ?auto_119718 ?auto_119719 ) ) )
    :subtasks
    ( ( !STACK ?auto_119719 ?auto_119718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119720 - BLOCK
      ?auto_119721 - BLOCK
    )
    :vars
    (
      ?auto_119722 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119720 ) ( ON-TABLE ?auto_119720 ) ( not ( = ?auto_119720 ?auto_119721 ) ) ( ON ?auto_119721 ?auto_119722 ) ( CLEAR ?auto_119721 ) ( HAND-EMPTY ) ( not ( = ?auto_119720 ?auto_119722 ) ) ( not ( = ?auto_119721 ?auto_119722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119721 ?auto_119722 )
      ( MAKE-2PILE ?auto_119720 ?auto_119721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119723 - BLOCK
      ?auto_119724 - BLOCK
    )
    :vars
    (
      ?auto_119725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119723 ?auto_119724 ) ) ( ON ?auto_119724 ?auto_119725 ) ( CLEAR ?auto_119724 ) ( not ( = ?auto_119723 ?auto_119725 ) ) ( not ( = ?auto_119724 ?auto_119725 ) ) ( HOLDING ?auto_119723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119723 )
      ( MAKE-2PILE ?auto_119723 ?auto_119724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119726 - BLOCK
      ?auto_119727 - BLOCK
    )
    :vars
    (
      ?auto_119728 - BLOCK
      ?auto_119729 - BLOCK
      ?auto_119730 - BLOCK
      ?auto_119732 - BLOCK
      ?auto_119731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119726 ?auto_119727 ) ) ( ON ?auto_119727 ?auto_119728 ) ( not ( = ?auto_119726 ?auto_119728 ) ) ( not ( = ?auto_119727 ?auto_119728 ) ) ( ON ?auto_119726 ?auto_119727 ) ( CLEAR ?auto_119726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119729 ) ( ON ?auto_119730 ?auto_119729 ) ( ON ?auto_119732 ?auto_119730 ) ( ON ?auto_119731 ?auto_119732 ) ( ON ?auto_119728 ?auto_119731 ) ( not ( = ?auto_119729 ?auto_119730 ) ) ( not ( = ?auto_119729 ?auto_119732 ) ) ( not ( = ?auto_119729 ?auto_119731 ) ) ( not ( = ?auto_119729 ?auto_119728 ) ) ( not ( = ?auto_119729 ?auto_119727 ) ) ( not ( = ?auto_119729 ?auto_119726 ) ) ( not ( = ?auto_119730 ?auto_119732 ) ) ( not ( = ?auto_119730 ?auto_119731 ) ) ( not ( = ?auto_119730 ?auto_119728 ) ) ( not ( = ?auto_119730 ?auto_119727 ) ) ( not ( = ?auto_119730 ?auto_119726 ) ) ( not ( = ?auto_119732 ?auto_119731 ) ) ( not ( = ?auto_119732 ?auto_119728 ) ) ( not ( = ?auto_119732 ?auto_119727 ) ) ( not ( = ?auto_119732 ?auto_119726 ) ) ( not ( = ?auto_119731 ?auto_119728 ) ) ( not ( = ?auto_119731 ?auto_119727 ) ) ( not ( = ?auto_119731 ?auto_119726 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119729 ?auto_119730 ?auto_119732 ?auto_119731 ?auto_119728 ?auto_119727 )
      ( MAKE-2PILE ?auto_119726 ?auto_119727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119733 - BLOCK
      ?auto_119734 - BLOCK
    )
    :vars
    (
      ?auto_119735 - BLOCK
      ?auto_119736 - BLOCK
      ?auto_119739 - BLOCK
      ?auto_119737 - BLOCK
      ?auto_119738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119733 ?auto_119734 ) ) ( ON ?auto_119734 ?auto_119735 ) ( not ( = ?auto_119733 ?auto_119735 ) ) ( not ( = ?auto_119734 ?auto_119735 ) ) ( ON-TABLE ?auto_119736 ) ( ON ?auto_119739 ?auto_119736 ) ( ON ?auto_119737 ?auto_119739 ) ( ON ?auto_119738 ?auto_119737 ) ( ON ?auto_119735 ?auto_119738 ) ( not ( = ?auto_119736 ?auto_119739 ) ) ( not ( = ?auto_119736 ?auto_119737 ) ) ( not ( = ?auto_119736 ?auto_119738 ) ) ( not ( = ?auto_119736 ?auto_119735 ) ) ( not ( = ?auto_119736 ?auto_119734 ) ) ( not ( = ?auto_119736 ?auto_119733 ) ) ( not ( = ?auto_119739 ?auto_119737 ) ) ( not ( = ?auto_119739 ?auto_119738 ) ) ( not ( = ?auto_119739 ?auto_119735 ) ) ( not ( = ?auto_119739 ?auto_119734 ) ) ( not ( = ?auto_119739 ?auto_119733 ) ) ( not ( = ?auto_119737 ?auto_119738 ) ) ( not ( = ?auto_119737 ?auto_119735 ) ) ( not ( = ?auto_119737 ?auto_119734 ) ) ( not ( = ?auto_119737 ?auto_119733 ) ) ( not ( = ?auto_119738 ?auto_119735 ) ) ( not ( = ?auto_119738 ?auto_119734 ) ) ( not ( = ?auto_119738 ?auto_119733 ) ) ( HOLDING ?auto_119733 ) ( CLEAR ?auto_119734 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119736 ?auto_119739 ?auto_119737 ?auto_119738 ?auto_119735 ?auto_119734 ?auto_119733 )
      ( MAKE-2PILE ?auto_119733 ?auto_119734 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119740 - BLOCK
      ?auto_119741 - BLOCK
    )
    :vars
    (
      ?auto_119745 - BLOCK
      ?auto_119743 - BLOCK
      ?auto_119742 - BLOCK
      ?auto_119746 - BLOCK
      ?auto_119744 - BLOCK
      ?auto_119747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119740 ?auto_119741 ) ) ( ON ?auto_119741 ?auto_119745 ) ( not ( = ?auto_119740 ?auto_119745 ) ) ( not ( = ?auto_119741 ?auto_119745 ) ) ( ON-TABLE ?auto_119743 ) ( ON ?auto_119742 ?auto_119743 ) ( ON ?auto_119746 ?auto_119742 ) ( ON ?auto_119744 ?auto_119746 ) ( ON ?auto_119745 ?auto_119744 ) ( not ( = ?auto_119743 ?auto_119742 ) ) ( not ( = ?auto_119743 ?auto_119746 ) ) ( not ( = ?auto_119743 ?auto_119744 ) ) ( not ( = ?auto_119743 ?auto_119745 ) ) ( not ( = ?auto_119743 ?auto_119741 ) ) ( not ( = ?auto_119743 ?auto_119740 ) ) ( not ( = ?auto_119742 ?auto_119746 ) ) ( not ( = ?auto_119742 ?auto_119744 ) ) ( not ( = ?auto_119742 ?auto_119745 ) ) ( not ( = ?auto_119742 ?auto_119741 ) ) ( not ( = ?auto_119742 ?auto_119740 ) ) ( not ( = ?auto_119746 ?auto_119744 ) ) ( not ( = ?auto_119746 ?auto_119745 ) ) ( not ( = ?auto_119746 ?auto_119741 ) ) ( not ( = ?auto_119746 ?auto_119740 ) ) ( not ( = ?auto_119744 ?auto_119745 ) ) ( not ( = ?auto_119744 ?auto_119741 ) ) ( not ( = ?auto_119744 ?auto_119740 ) ) ( CLEAR ?auto_119741 ) ( ON ?auto_119740 ?auto_119747 ) ( CLEAR ?auto_119740 ) ( HAND-EMPTY ) ( not ( = ?auto_119740 ?auto_119747 ) ) ( not ( = ?auto_119741 ?auto_119747 ) ) ( not ( = ?auto_119745 ?auto_119747 ) ) ( not ( = ?auto_119743 ?auto_119747 ) ) ( not ( = ?auto_119742 ?auto_119747 ) ) ( not ( = ?auto_119746 ?auto_119747 ) ) ( not ( = ?auto_119744 ?auto_119747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119740 ?auto_119747 )
      ( MAKE-2PILE ?auto_119740 ?auto_119741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119748 - BLOCK
      ?auto_119749 - BLOCK
    )
    :vars
    (
      ?auto_119752 - BLOCK
      ?auto_119753 - BLOCK
      ?auto_119750 - BLOCK
      ?auto_119755 - BLOCK
      ?auto_119751 - BLOCK
      ?auto_119754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119748 ?auto_119749 ) ) ( not ( = ?auto_119748 ?auto_119752 ) ) ( not ( = ?auto_119749 ?auto_119752 ) ) ( ON-TABLE ?auto_119753 ) ( ON ?auto_119750 ?auto_119753 ) ( ON ?auto_119755 ?auto_119750 ) ( ON ?auto_119751 ?auto_119755 ) ( ON ?auto_119752 ?auto_119751 ) ( not ( = ?auto_119753 ?auto_119750 ) ) ( not ( = ?auto_119753 ?auto_119755 ) ) ( not ( = ?auto_119753 ?auto_119751 ) ) ( not ( = ?auto_119753 ?auto_119752 ) ) ( not ( = ?auto_119753 ?auto_119749 ) ) ( not ( = ?auto_119753 ?auto_119748 ) ) ( not ( = ?auto_119750 ?auto_119755 ) ) ( not ( = ?auto_119750 ?auto_119751 ) ) ( not ( = ?auto_119750 ?auto_119752 ) ) ( not ( = ?auto_119750 ?auto_119749 ) ) ( not ( = ?auto_119750 ?auto_119748 ) ) ( not ( = ?auto_119755 ?auto_119751 ) ) ( not ( = ?auto_119755 ?auto_119752 ) ) ( not ( = ?auto_119755 ?auto_119749 ) ) ( not ( = ?auto_119755 ?auto_119748 ) ) ( not ( = ?auto_119751 ?auto_119752 ) ) ( not ( = ?auto_119751 ?auto_119749 ) ) ( not ( = ?auto_119751 ?auto_119748 ) ) ( ON ?auto_119748 ?auto_119754 ) ( CLEAR ?auto_119748 ) ( not ( = ?auto_119748 ?auto_119754 ) ) ( not ( = ?auto_119749 ?auto_119754 ) ) ( not ( = ?auto_119752 ?auto_119754 ) ) ( not ( = ?auto_119753 ?auto_119754 ) ) ( not ( = ?auto_119750 ?auto_119754 ) ) ( not ( = ?auto_119755 ?auto_119754 ) ) ( not ( = ?auto_119751 ?auto_119754 ) ) ( HOLDING ?auto_119749 ) ( CLEAR ?auto_119752 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119753 ?auto_119750 ?auto_119755 ?auto_119751 ?auto_119752 ?auto_119749 )
      ( MAKE-2PILE ?auto_119748 ?auto_119749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119756 - BLOCK
      ?auto_119757 - BLOCK
    )
    :vars
    (
      ?auto_119763 - BLOCK
      ?auto_119761 - BLOCK
      ?auto_119760 - BLOCK
      ?auto_119762 - BLOCK
      ?auto_119759 - BLOCK
      ?auto_119758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119756 ?auto_119757 ) ) ( not ( = ?auto_119756 ?auto_119763 ) ) ( not ( = ?auto_119757 ?auto_119763 ) ) ( ON-TABLE ?auto_119761 ) ( ON ?auto_119760 ?auto_119761 ) ( ON ?auto_119762 ?auto_119760 ) ( ON ?auto_119759 ?auto_119762 ) ( ON ?auto_119763 ?auto_119759 ) ( not ( = ?auto_119761 ?auto_119760 ) ) ( not ( = ?auto_119761 ?auto_119762 ) ) ( not ( = ?auto_119761 ?auto_119759 ) ) ( not ( = ?auto_119761 ?auto_119763 ) ) ( not ( = ?auto_119761 ?auto_119757 ) ) ( not ( = ?auto_119761 ?auto_119756 ) ) ( not ( = ?auto_119760 ?auto_119762 ) ) ( not ( = ?auto_119760 ?auto_119759 ) ) ( not ( = ?auto_119760 ?auto_119763 ) ) ( not ( = ?auto_119760 ?auto_119757 ) ) ( not ( = ?auto_119760 ?auto_119756 ) ) ( not ( = ?auto_119762 ?auto_119759 ) ) ( not ( = ?auto_119762 ?auto_119763 ) ) ( not ( = ?auto_119762 ?auto_119757 ) ) ( not ( = ?auto_119762 ?auto_119756 ) ) ( not ( = ?auto_119759 ?auto_119763 ) ) ( not ( = ?auto_119759 ?auto_119757 ) ) ( not ( = ?auto_119759 ?auto_119756 ) ) ( ON ?auto_119756 ?auto_119758 ) ( not ( = ?auto_119756 ?auto_119758 ) ) ( not ( = ?auto_119757 ?auto_119758 ) ) ( not ( = ?auto_119763 ?auto_119758 ) ) ( not ( = ?auto_119761 ?auto_119758 ) ) ( not ( = ?auto_119760 ?auto_119758 ) ) ( not ( = ?auto_119762 ?auto_119758 ) ) ( not ( = ?auto_119759 ?auto_119758 ) ) ( CLEAR ?auto_119763 ) ( ON ?auto_119757 ?auto_119756 ) ( CLEAR ?auto_119757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119758 ?auto_119756 )
      ( MAKE-2PILE ?auto_119756 ?auto_119757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119764 - BLOCK
      ?auto_119765 - BLOCK
    )
    :vars
    (
      ?auto_119771 - BLOCK
      ?auto_119769 - BLOCK
      ?auto_119767 - BLOCK
      ?auto_119768 - BLOCK
      ?auto_119770 - BLOCK
      ?auto_119766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119764 ?auto_119765 ) ) ( not ( = ?auto_119764 ?auto_119771 ) ) ( not ( = ?auto_119765 ?auto_119771 ) ) ( ON-TABLE ?auto_119769 ) ( ON ?auto_119767 ?auto_119769 ) ( ON ?auto_119768 ?auto_119767 ) ( ON ?auto_119770 ?auto_119768 ) ( not ( = ?auto_119769 ?auto_119767 ) ) ( not ( = ?auto_119769 ?auto_119768 ) ) ( not ( = ?auto_119769 ?auto_119770 ) ) ( not ( = ?auto_119769 ?auto_119771 ) ) ( not ( = ?auto_119769 ?auto_119765 ) ) ( not ( = ?auto_119769 ?auto_119764 ) ) ( not ( = ?auto_119767 ?auto_119768 ) ) ( not ( = ?auto_119767 ?auto_119770 ) ) ( not ( = ?auto_119767 ?auto_119771 ) ) ( not ( = ?auto_119767 ?auto_119765 ) ) ( not ( = ?auto_119767 ?auto_119764 ) ) ( not ( = ?auto_119768 ?auto_119770 ) ) ( not ( = ?auto_119768 ?auto_119771 ) ) ( not ( = ?auto_119768 ?auto_119765 ) ) ( not ( = ?auto_119768 ?auto_119764 ) ) ( not ( = ?auto_119770 ?auto_119771 ) ) ( not ( = ?auto_119770 ?auto_119765 ) ) ( not ( = ?auto_119770 ?auto_119764 ) ) ( ON ?auto_119764 ?auto_119766 ) ( not ( = ?auto_119764 ?auto_119766 ) ) ( not ( = ?auto_119765 ?auto_119766 ) ) ( not ( = ?auto_119771 ?auto_119766 ) ) ( not ( = ?auto_119769 ?auto_119766 ) ) ( not ( = ?auto_119767 ?auto_119766 ) ) ( not ( = ?auto_119768 ?auto_119766 ) ) ( not ( = ?auto_119770 ?auto_119766 ) ) ( ON ?auto_119765 ?auto_119764 ) ( CLEAR ?auto_119765 ) ( ON-TABLE ?auto_119766 ) ( HOLDING ?auto_119771 ) ( CLEAR ?auto_119770 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119769 ?auto_119767 ?auto_119768 ?auto_119770 ?auto_119771 )
      ( MAKE-2PILE ?auto_119764 ?auto_119765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119772 - BLOCK
      ?auto_119773 - BLOCK
    )
    :vars
    (
      ?auto_119777 - BLOCK
      ?auto_119778 - BLOCK
      ?auto_119775 - BLOCK
      ?auto_119776 - BLOCK
      ?auto_119774 - BLOCK
      ?auto_119779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119772 ?auto_119773 ) ) ( not ( = ?auto_119772 ?auto_119777 ) ) ( not ( = ?auto_119773 ?auto_119777 ) ) ( ON-TABLE ?auto_119778 ) ( ON ?auto_119775 ?auto_119778 ) ( ON ?auto_119776 ?auto_119775 ) ( ON ?auto_119774 ?auto_119776 ) ( not ( = ?auto_119778 ?auto_119775 ) ) ( not ( = ?auto_119778 ?auto_119776 ) ) ( not ( = ?auto_119778 ?auto_119774 ) ) ( not ( = ?auto_119778 ?auto_119777 ) ) ( not ( = ?auto_119778 ?auto_119773 ) ) ( not ( = ?auto_119778 ?auto_119772 ) ) ( not ( = ?auto_119775 ?auto_119776 ) ) ( not ( = ?auto_119775 ?auto_119774 ) ) ( not ( = ?auto_119775 ?auto_119777 ) ) ( not ( = ?auto_119775 ?auto_119773 ) ) ( not ( = ?auto_119775 ?auto_119772 ) ) ( not ( = ?auto_119776 ?auto_119774 ) ) ( not ( = ?auto_119776 ?auto_119777 ) ) ( not ( = ?auto_119776 ?auto_119773 ) ) ( not ( = ?auto_119776 ?auto_119772 ) ) ( not ( = ?auto_119774 ?auto_119777 ) ) ( not ( = ?auto_119774 ?auto_119773 ) ) ( not ( = ?auto_119774 ?auto_119772 ) ) ( ON ?auto_119772 ?auto_119779 ) ( not ( = ?auto_119772 ?auto_119779 ) ) ( not ( = ?auto_119773 ?auto_119779 ) ) ( not ( = ?auto_119777 ?auto_119779 ) ) ( not ( = ?auto_119778 ?auto_119779 ) ) ( not ( = ?auto_119775 ?auto_119779 ) ) ( not ( = ?auto_119776 ?auto_119779 ) ) ( not ( = ?auto_119774 ?auto_119779 ) ) ( ON ?auto_119773 ?auto_119772 ) ( ON-TABLE ?auto_119779 ) ( CLEAR ?auto_119774 ) ( ON ?auto_119777 ?auto_119773 ) ( CLEAR ?auto_119777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119779 ?auto_119772 ?auto_119773 )
      ( MAKE-2PILE ?auto_119772 ?auto_119773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119780 - BLOCK
      ?auto_119781 - BLOCK
    )
    :vars
    (
      ?auto_119787 - BLOCK
      ?auto_119783 - BLOCK
      ?auto_119786 - BLOCK
      ?auto_119784 - BLOCK
      ?auto_119785 - BLOCK
      ?auto_119782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119780 ?auto_119781 ) ) ( not ( = ?auto_119780 ?auto_119787 ) ) ( not ( = ?auto_119781 ?auto_119787 ) ) ( ON-TABLE ?auto_119783 ) ( ON ?auto_119786 ?auto_119783 ) ( ON ?auto_119784 ?auto_119786 ) ( not ( = ?auto_119783 ?auto_119786 ) ) ( not ( = ?auto_119783 ?auto_119784 ) ) ( not ( = ?auto_119783 ?auto_119785 ) ) ( not ( = ?auto_119783 ?auto_119787 ) ) ( not ( = ?auto_119783 ?auto_119781 ) ) ( not ( = ?auto_119783 ?auto_119780 ) ) ( not ( = ?auto_119786 ?auto_119784 ) ) ( not ( = ?auto_119786 ?auto_119785 ) ) ( not ( = ?auto_119786 ?auto_119787 ) ) ( not ( = ?auto_119786 ?auto_119781 ) ) ( not ( = ?auto_119786 ?auto_119780 ) ) ( not ( = ?auto_119784 ?auto_119785 ) ) ( not ( = ?auto_119784 ?auto_119787 ) ) ( not ( = ?auto_119784 ?auto_119781 ) ) ( not ( = ?auto_119784 ?auto_119780 ) ) ( not ( = ?auto_119785 ?auto_119787 ) ) ( not ( = ?auto_119785 ?auto_119781 ) ) ( not ( = ?auto_119785 ?auto_119780 ) ) ( ON ?auto_119780 ?auto_119782 ) ( not ( = ?auto_119780 ?auto_119782 ) ) ( not ( = ?auto_119781 ?auto_119782 ) ) ( not ( = ?auto_119787 ?auto_119782 ) ) ( not ( = ?auto_119783 ?auto_119782 ) ) ( not ( = ?auto_119786 ?auto_119782 ) ) ( not ( = ?auto_119784 ?auto_119782 ) ) ( not ( = ?auto_119785 ?auto_119782 ) ) ( ON ?auto_119781 ?auto_119780 ) ( ON-TABLE ?auto_119782 ) ( ON ?auto_119787 ?auto_119781 ) ( CLEAR ?auto_119787 ) ( HOLDING ?auto_119785 ) ( CLEAR ?auto_119784 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119783 ?auto_119786 ?auto_119784 ?auto_119785 )
      ( MAKE-2PILE ?auto_119780 ?auto_119781 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119788 - BLOCK
      ?auto_119789 - BLOCK
    )
    :vars
    (
      ?auto_119794 - BLOCK
      ?auto_119795 - BLOCK
      ?auto_119792 - BLOCK
      ?auto_119791 - BLOCK
      ?auto_119793 - BLOCK
      ?auto_119790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119788 ?auto_119789 ) ) ( not ( = ?auto_119788 ?auto_119794 ) ) ( not ( = ?auto_119789 ?auto_119794 ) ) ( ON-TABLE ?auto_119795 ) ( ON ?auto_119792 ?auto_119795 ) ( ON ?auto_119791 ?auto_119792 ) ( not ( = ?auto_119795 ?auto_119792 ) ) ( not ( = ?auto_119795 ?auto_119791 ) ) ( not ( = ?auto_119795 ?auto_119793 ) ) ( not ( = ?auto_119795 ?auto_119794 ) ) ( not ( = ?auto_119795 ?auto_119789 ) ) ( not ( = ?auto_119795 ?auto_119788 ) ) ( not ( = ?auto_119792 ?auto_119791 ) ) ( not ( = ?auto_119792 ?auto_119793 ) ) ( not ( = ?auto_119792 ?auto_119794 ) ) ( not ( = ?auto_119792 ?auto_119789 ) ) ( not ( = ?auto_119792 ?auto_119788 ) ) ( not ( = ?auto_119791 ?auto_119793 ) ) ( not ( = ?auto_119791 ?auto_119794 ) ) ( not ( = ?auto_119791 ?auto_119789 ) ) ( not ( = ?auto_119791 ?auto_119788 ) ) ( not ( = ?auto_119793 ?auto_119794 ) ) ( not ( = ?auto_119793 ?auto_119789 ) ) ( not ( = ?auto_119793 ?auto_119788 ) ) ( ON ?auto_119788 ?auto_119790 ) ( not ( = ?auto_119788 ?auto_119790 ) ) ( not ( = ?auto_119789 ?auto_119790 ) ) ( not ( = ?auto_119794 ?auto_119790 ) ) ( not ( = ?auto_119795 ?auto_119790 ) ) ( not ( = ?auto_119792 ?auto_119790 ) ) ( not ( = ?auto_119791 ?auto_119790 ) ) ( not ( = ?auto_119793 ?auto_119790 ) ) ( ON ?auto_119789 ?auto_119788 ) ( ON-TABLE ?auto_119790 ) ( ON ?auto_119794 ?auto_119789 ) ( CLEAR ?auto_119791 ) ( ON ?auto_119793 ?auto_119794 ) ( CLEAR ?auto_119793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119790 ?auto_119788 ?auto_119789 ?auto_119794 )
      ( MAKE-2PILE ?auto_119788 ?auto_119789 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119796 - BLOCK
      ?auto_119797 - BLOCK
    )
    :vars
    (
      ?auto_119803 - BLOCK
      ?auto_119798 - BLOCK
      ?auto_119800 - BLOCK
      ?auto_119801 - BLOCK
      ?auto_119802 - BLOCK
      ?auto_119799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119796 ?auto_119797 ) ) ( not ( = ?auto_119796 ?auto_119803 ) ) ( not ( = ?auto_119797 ?auto_119803 ) ) ( ON-TABLE ?auto_119798 ) ( ON ?auto_119800 ?auto_119798 ) ( not ( = ?auto_119798 ?auto_119800 ) ) ( not ( = ?auto_119798 ?auto_119801 ) ) ( not ( = ?auto_119798 ?auto_119802 ) ) ( not ( = ?auto_119798 ?auto_119803 ) ) ( not ( = ?auto_119798 ?auto_119797 ) ) ( not ( = ?auto_119798 ?auto_119796 ) ) ( not ( = ?auto_119800 ?auto_119801 ) ) ( not ( = ?auto_119800 ?auto_119802 ) ) ( not ( = ?auto_119800 ?auto_119803 ) ) ( not ( = ?auto_119800 ?auto_119797 ) ) ( not ( = ?auto_119800 ?auto_119796 ) ) ( not ( = ?auto_119801 ?auto_119802 ) ) ( not ( = ?auto_119801 ?auto_119803 ) ) ( not ( = ?auto_119801 ?auto_119797 ) ) ( not ( = ?auto_119801 ?auto_119796 ) ) ( not ( = ?auto_119802 ?auto_119803 ) ) ( not ( = ?auto_119802 ?auto_119797 ) ) ( not ( = ?auto_119802 ?auto_119796 ) ) ( ON ?auto_119796 ?auto_119799 ) ( not ( = ?auto_119796 ?auto_119799 ) ) ( not ( = ?auto_119797 ?auto_119799 ) ) ( not ( = ?auto_119803 ?auto_119799 ) ) ( not ( = ?auto_119798 ?auto_119799 ) ) ( not ( = ?auto_119800 ?auto_119799 ) ) ( not ( = ?auto_119801 ?auto_119799 ) ) ( not ( = ?auto_119802 ?auto_119799 ) ) ( ON ?auto_119797 ?auto_119796 ) ( ON-TABLE ?auto_119799 ) ( ON ?auto_119803 ?auto_119797 ) ( ON ?auto_119802 ?auto_119803 ) ( CLEAR ?auto_119802 ) ( HOLDING ?auto_119801 ) ( CLEAR ?auto_119800 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119798 ?auto_119800 ?auto_119801 )
      ( MAKE-2PILE ?auto_119796 ?auto_119797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119804 - BLOCK
      ?auto_119805 - BLOCK
    )
    :vars
    (
      ?auto_119808 - BLOCK
      ?auto_119810 - BLOCK
      ?auto_119811 - BLOCK
      ?auto_119807 - BLOCK
      ?auto_119809 - BLOCK
      ?auto_119806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119804 ?auto_119805 ) ) ( not ( = ?auto_119804 ?auto_119808 ) ) ( not ( = ?auto_119805 ?auto_119808 ) ) ( ON-TABLE ?auto_119810 ) ( ON ?auto_119811 ?auto_119810 ) ( not ( = ?auto_119810 ?auto_119811 ) ) ( not ( = ?auto_119810 ?auto_119807 ) ) ( not ( = ?auto_119810 ?auto_119809 ) ) ( not ( = ?auto_119810 ?auto_119808 ) ) ( not ( = ?auto_119810 ?auto_119805 ) ) ( not ( = ?auto_119810 ?auto_119804 ) ) ( not ( = ?auto_119811 ?auto_119807 ) ) ( not ( = ?auto_119811 ?auto_119809 ) ) ( not ( = ?auto_119811 ?auto_119808 ) ) ( not ( = ?auto_119811 ?auto_119805 ) ) ( not ( = ?auto_119811 ?auto_119804 ) ) ( not ( = ?auto_119807 ?auto_119809 ) ) ( not ( = ?auto_119807 ?auto_119808 ) ) ( not ( = ?auto_119807 ?auto_119805 ) ) ( not ( = ?auto_119807 ?auto_119804 ) ) ( not ( = ?auto_119809 ?auto_119808 ) ) ( not ( = ?auto_119809 ?auto_119805 ) ) ( not ( = ?auto_119809 ?auto_119804 ) ) ( ON ?auto_119804 ?auto_119806 ) ( not ( = ?auto_119804 ?auto_119806 ) ) ( not ( = ?auto_119805 ?auto_119806 ) ) ( not ( = ?auto_119808 ?auto_119806 ) ) ( not ( = ?auto_119810 ?auto_119806 ) ) ( not ( = ?auto_119811 ?auto_119806 ) ) ( not ( = ?auto_119807 ?auto_119806 ) ) ( not ( = ?auto_119809 ?auto_119806 ) ) ( ON ?auto_119805 ?auto_119804 ) ( ON-TABLE ?auto_119806 ) ( ON ?auto_119808 ?auto_119805 ) ( ON ?auto_119809 ?auto_119808 ) ( CLEAR ?auto_119811 ) ( ON ?auto_119807 ?auto_119809 ) ( CLEAR ?auto_119807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119806 ?auto_119804 ?auto_119805 ?auto_119808 ?auto_119809 )
      ( MAKE-2PILE ?auto_119804 ?auto_119805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119812 - BLOCK
      ?auto_119813 - BLOCK
    )
    :vars
    (
      ?auto_119819 - BLOCK
      ?auto_119815 - BLOCK
      ?auto_119817 - BLOCK
      ?auto_119816 - BLOCK
      ?auto_119814 - BLOCK
      ?auto_119818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119812 ?auto_119813 ) ) ( not ( = ?auto_119812 ?auto_119819 ) ) ( not ( = ?auto_119813 ?auto_119819 ) ) ( ON-TABLE ?auto_119815 ) ( not ( = ?auto_119815 ?auto_119817 ) ) ( not ( = ?auto_119815 ?auto_119816 ) ) ( not ( = ?auto_119815 ?auto_119814 ) ) ( not ( = ?auto_119815 ?auto_119819 ) ) ( not ( = ?auto_119815 ?auto_119813 ) ) ( not ( = ?auto_119815 ?auto_119812 ) ) ( not ( = ?auto_119817 ?auto_119816 ) ) ( not ( = ?auto_119817 ?auto_119814 ) ) ( not ( = ?auto_119817 ?auto_119819 ) ) ( not ( = ?auto_119817 ?auto_119813 ) ) ( not ( = ?auto_119817 ?auto_119812 ) ) ( not ( = ?auto_119816 ?auto_119814 ) ) ( not ( = ?auto_119816 ?auto_119819 ) ) ( not ( = ?auto_119816 ?auto_119813 ) ) ( not ( = ?auto_119816 ?auto_119812 ) ) ( not ( = ?auto_119814 ?auto_119819 ) ) ( not ( = ?auto_119814 ?auto_119813 ) ) ( not ( = ?auto_119814 ?auto_119812 ) ) ( ON ?auto_119812 ?auto_119818 ) ( not ( = ?auto_119812 ?auto_119818 ) ) ( not ( = ?auto_119813 ?auto_119818 ) ) ( not ( = ?auto_119819 ?auto_119818 ) ) ( not ( = ?auto_119815 ?auto_119818 ) ) ( not ( = ?auto_119817 ?auto_119818 ) ) ( not ( = ?auto_119816 ?auto_119818 ) ) ( not ( = ?auto_119814 ?auto_119818 ) ) ( ON ?auto_119813 ?auto_119812 ) ( ON-TABLE ?auto_119818 ) ( ON ?auto_119819 ?auto_119813 ) ( ON ?auto_119814 ?auto_119819 ) ( ON ?auto_119816 ?auto_119814 ) ( CLEAR ?auto_119816 ) ( HOLDING ?auto_119817 ) ( CLEAR ?auto_119815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119815 ?auto_119817 )
      ( MAKE-2PILE ?auto_119812 ?auto_119813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119820 - BLOCK
      ?auto_119821 - BLOCK
    )
    :vars
    (
      ?auto_119824 - BLOCK
      ?auto_119822 - BLOCK
      ?auto_119826 - BLOCK
      ?auto_119827 - BLOCK
      ?auto_119823 - BLOCK
      ?auto_119825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119820 ?auto_119821 ) ) ( not ( = ?auto_119820 ?auto_119824 ) ) ( not ( = ?auto_119821 ?auto_119824 ) ) ( ON-TABLE ?auto_119822 ) ( not ( = ?auto_119822 ?auto_119826 ) ) ( not ( = ?auto_119822 ?auto_119827 ) ) ( not ( = ?auto_119822 ?auto_119823 ) ) ( not ( = ?auto_119822 ?auto_119824 ) ) ( not ( = ?auto_119822 ?auto_119821 ) ) ( not ( = ?auto_119822 ?auto_119820 ) ) ( not ( = ?auto_119826 ?auto_119827 ) ) ( not ( = ?auto_119826 ?auto_119823 ) ) ( not ( = ?auto_119826 ?auto_119824 ) ) ( not ( = ?auto_119826 ?auto_119821 ) ) ( not ( = ?auto_119826 ?auto_119820 ) ) ( not ( = ?auto_119827 ?auto_119823 ) ) ( not ( = ?auto_119827 ?auto_119824 ) ) ( not ( = ?auto_119827 ?auto_119821 ) ) ( not ( = ?auto_119827 ?auto_119820 ) ) ( not ( = ?auto_119823 ?auto_119824 ) ) ( not ( = ?auto_119823 ?auto_119821 ) ) ( not ( = ?auto_119823 ?auto_119820 ) ) ( ON ?auto_119820 ?auto_119825 ) ( not ( = ?auto_119820 ?auto_119825 ) ) ( not ( = ?auto_119821 ?auto_119825 ) ) ( not ( = ?auto_119824 ?auto_119825 ) ) ( not ( = ?auto_119822 ?auto_119825 ) ) ( not ( = ?auto_119826 ?auto_119825 ) ) ( not ( = ?auto_119827 ?auto_119825 ) ) ( not ( = ?auto_119823 ?auto_119825 ) ) ( ON ?auto_119821 ?auto_119820 ) ( ON-TABLE ?auto_119825 ) ( ON ?auto_119824 ?auto_119821 ) ( ON ?auto_119823 ?auto_119824 ) ( ON ?auto_119827 ?auto_119823 ) ( CLEAR ?auto_119822 ) ( ON ?auto_119826 ?auto_119827 ) ( CLEAR ?auto_119826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119825 ?auto_119820 ?auto_119821 ?auto_119824 ?auto_119823 ?auto_119827 )
      ( MAKE-2PILE ?auto_119820 ?auto_119821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119828 - BLOCK
      ?auto_119829 - BLOCK
    )
    :vars
    (
      ?auto_119834 - BLOCK
      ?auto_119835 - BLOCK
      ?auto_119832 - BLOCK
      ?auto_119830 - BLOCK
      ?auto_119833 - BLOCK
      ?auto_119831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119828 ?auto_119829 ) ) ( not ( = ?auto_119828 ?auto_119834 ) ) ( not ( = ?auto_119829 ?auto_119834 ) ) ( not ( = ?auto_119835 ?auto_119832 ) ) ( not ( = ?auto_119835 ?auto_119830 ) ) ( not ( = ?auto_119835 ?auto_119833 ) ) ( not ( = ?auto_119835 ?auto_119834 ) ) ( not ( = ?auto_119835 ?auto_119829 ) ) ( not ( = ?auto_119835 ?auto_119828 ) ) ( not ( = ?auto_119832 ?auto_119830 ) ) ( not ( = ?auto_119832 ?auto_119833 ) ) ( not ( = ?auto_119832 ?auto_119834 ) ) ( not ( = ?auto_119832 ?auto_119829 ) ) ( not ( = ?auto_119832 ?auto_119828 ) ) ( not ( = ?auto_119830 ?auto_119833 ) ) ( not ( = ?auto_119830 ?auto_119834 ) ) ( not ( = ?auto_119830 ?auto_119829 ) ) ( not ( = ?auto_119830 ?auto_119828 ) ) ( not ( = ?auto_119833 ?auto_119834 ) ) ( not ( = ?auto_119833 ?auto_119829 ) ) ( not ( = ?auto_119833 ?auto_119828 ) ) ( ON ?auto_119828 ?auto_119831 ) ( not ( = ?auto_119828 ?auto_119831 ) ) ( not ( = ?auto_119829 ?auto_119831 ) ) ( not ( = ?auto_119834 ?auto_119831 ) ) ( not ( = ?auto_119835 ?auto_119831 ) ) ( not ( = ?auto_119832 ?auto_119831 ) ) ( not ( = ?auto_119830 ?auto_119831 ) ) ( not ( = ?auto_119833 ?auto_119831 ) ) ( ON ?auto_119829 ?auto_119828 ) ( ON-TABLE ?auto_119831 ) ( ON ?auto_119834 ?auto_119829 ) ( ON ?auto_119833 ?auto_119834 ) ( ON ?auto_119830 ?auto_119833 ) ( ON ?auto_119832 ?auto_119830 ) ( CLEAR ?auto_119832 ) ( HOLDING ?auto_119835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119835 )
      ( MAKE-2PILE ?auto_119828 ?auto_119829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_119836 - BLOCK
      ?auto_119837 - BLOCK
    )
    :vars
    (
      ?auto_119840 - BLOCK
      ?auto_119839 - BLOCK
      ?auto_119842 - BLOCK
      ?auto_119841 - BLOCK
      ?auto_119838 - BLOCK
      ?auto_119843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119836 ?auto_119837 ) ) ( not ( = ?auto_119836 ?auto_119840 ) ) ( not ( = ?auto_119837 ?auto_119840 ) ) ( not ( = ?auto_119839 ?auto_119842 ) ) ( not ( = ?auto_119839 ?auto_119841 ) ) ( not ( = ?auto_119839 ?auto_119838 ) ) ( not ( = ?auto_119839 ?auto_119840 ) ) ( not ( = ?auto_119839 ?auto_119837 ) ) ( not ( = ?auto_119839 ?auto_119836 ) ) ( not ( = ?auto_119842 ?auto_119841 ) ) ( not ( = ?auto_119842 ?auto_119838 ) ) ( not ( = ?auto_119842 ?auto_119840 ) ) ( not ( = ?auto_119842 ?auto_119837 ) ) ( not ( = ?auto_119842 ?auto_119836 ) ) ( not ( = ?auto_119841 ?auto_119838 ) ) ( not ( = ?auto_119841 ?auto_119840 ) ) ( not ( = ?auto_119841 ?auto_119837 ) ) ( not ( = ?auto_119841 ?auto_119836 ) ) ( not ( = ?auto_119838 ?auto_119840 ) ) ( not ( = ?auto_119838 ?auto_119837 ) ) ( not ( = ?auto_119838 ?auto_119836 ) ) ( ON ?auto_119836 ?auto_119843 ) ( not ( = ?auto_119836 ?auto_119843 ) ) ( not ( = ?auto_119837 ?auto_119843 ) ) ( not ( = ?auto_119840 ?auto_119843 ) ) ( not ( = ?auto_119839 ?auto_119843 ) ) ( not ( = ?auto_119842 ?auto_119843 ) ) ( not ( = ?auto_119841 ?auto_119843 ) ) ( not ( = ?auto_119838 ?auto_119843 ) ) ( ON ?auto_119837 ?auto_119836 ) ( ON-TABLE ?auto_119843 ) ( ON ?auto_119840 ?auto_119837 ) ( ON ?auto_119838 ?auto_119840 ) ( ON ?auto_119841 ?auto_119838 ) ( ON ?auto_119842 ?auto_119841 ) ( ON ?auto_119839 ?auto_119842 ) ( CLEAR ?auto_119839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119843 ?auto_119836 ?auto_119837 ?auto_119840 ?auto_119838 ?auto_119841 ?auto_119842 )
      ( MAKE-2PILE ?auto_119836 ?auto_119837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119848 - BLOCK
      ?auto_119849 - BLOCK
      ?auto_119850 - BLOCK
      ?auto_119851 - BLOCK
    )
    :vars
    (
      ?auto_119852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119852 ?auto_119851 ) ( CLEAR ?auto_119852 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119848 ) ( ON ?auto_119849 ?auto_119848 ) ( ON ?auto_119850 ?auto_119849 ) ( ON ?auto_119851 ?auto_119850 ) ( not ( = ?auto_119848 ?auto_119849 ) ) ( not ( = ?auto_119848 ?auto_119850 ) ) ( not ( = ?auto_119848 ?auto_119851 ) ) ( not ( = ?auto_119848 ?auto_119852 ) ) ( not ( = ?auto_119849 ?auto_119850 ) ) ( not ( = ?auto_119849 ?auto_119851 ) ) ( not ( = ?auto_119849 ?auto_119852 ) ) ( not ( = ?auto_119850 ?auto_119851 ) ) ( not ( = ?auto_119850 ?auto_119852 ) ) ( not ( = ?auto_119851 ?auto_119852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119852 ?auto_119851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119853 - BLOCK
      ?auto_119854 - BLOCK
      ?auto_119855 - BLOCK
      ?auto_119856 - BLOCK
    )
    :vars
    (
      ?auto_119857 - BLOCK
      ?auto_119858 - BLOCK
      ?auto_119859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119857 ?auto_119856 ) ( CLEAR ?auto_119857 ) ( ON-TABLE ?auto_119853 ) ( ON ?auto_119854 ?auto_119853 ) ( ON ?auto_119855 ?auto_119854 ) ( ON ?auto_119856 ?auto_119855 ) ( not ( = ?auto_119853 ?auto_119854 ) ) ( not ( = ?auto_119853 ?auto_119855 ) ) ( not ( = ?auto_119853 ?auto_119856 ) ) ( not ( = ?auto_119853 ?auto_119857 ) ) ( not ( = ?auto_119854 ?auto_119855 ) ) ( not ( = ?auto_119854 ?auto_119856 ) ) ( not ( = ?auto_119854 ?auto_119857 ) ) ( not ( = ?auto_119855 ?auto_119856 ) ) ( not ( = ?auto_119855 ?auto_119857 ) ) ( not ( = ?auto_119856 ?auto_119857 ) ) ( HOLDING ?auto_119858 ) ( CLEAR ?auto_119859 ) ( not ( = ?auto_119853 ?auto_119858 ) ) ( not ( = ?auto_119853 ?auto_119859 ) ) ( not ( = ?auto_119854 ?auto_119858 ) ) ( not ( = ?auto_119854 ?auto_119859 ) ) ( not ( = ?auto_119855 ?auto_119858 ) ) ( not ( = ?auto_119855 ?auto_119859 ) ) ( not ( = ?auto_119856 ?auto_119858 ) ) ( not ( = ?auto_119856 ?auto_119859 ) ) ( not ( = ?auto_119857 ?auto_119858 ) ) ( not ( = ?auto_119857 ?auto_119859 ) ) ( not ( = ?auto_119858 ?auto_119859 ) ) )
    :subtasks
    ( ( !STACK ?auto_119858 ?auto_119859 )
      ( MAKE-4PILE ?auto_119853 ?auto_119854 ?auto_119855 ?auto_119856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119860 - BLOCK
      ?auto_119861 - BLOCK
      ?auto_119862 - BLOCK
      ?auto_119863 - BLOCK
    )
    :vars
    (
      ?auto_119864 - BLOCK
      ?auto_119865 - BLOCK
      ?auto_119866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119864 ?auto_119863 ) ( ON-TABLE ?auto_119860 ) ( ON ?auto_119861 ?auto_119860 ) ( ON ?auto_119862 ?auto_119861 ) ( ON ?auto_119863 ?auto_119862 ) ( not ( = ?auto_119860 ?auto_119861 ) ) ( not ( = ?auto_119860 ?auto_119862 ) ) ( not ( = ?auto_119860 ?auto_119863 ) ) ( not ( = ?auto_119860 ?auto_119864 ) ) ( not ( = ?auto_119861 ?auto_119862 ) ) ( not ( = ?auto_119861 ?auto_119863 ) ) ( not ( = ?auto_119861 ?auto_119864 ) ) ( not ( = ?auto_119862 ?auto_119863 ) ) ( not ( = ?auto_119862 ?auto_119864 ) ) ( not ( = ?auto_119863 ?auto_119864 ) ) ( CLEAR ?auto_119865 ) ( not ( = ?auto_119860 ?auto_119866 ) ) ( not ( = ?auto_119860 ?auto_119865 ) ) ( not ( = ?auto_119861 ?auto_119866 ) ) ( not ( = ?auto_119861 ?auto_119865 ) ) ( not ( = ?auto_119862 ?auto_119866 ) ) ( not ( = ?auto_119862 ?auto_119865 ) ) ( not ( = ?auto_119863 ?auto_119866 ) ) ( not ( = ?auto_119863 ?auto_119865 ) ) ( not ( = ?auto_119864 ?auto_119866 ) ) ( not ( = ?auto_119864 ?auto_119865 ) ) ( not ( = ?auto_119866 ?auto_119865 ) ) ( ON ?auto_119866 ?auto_119864 ) ( CLEAR ?auto_119866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119860 ?auto_119861 ?auto_119862 ?auto_119863 ?auto_119864 )
      ( MAKE-4PILE ?auto_119860 ?auto_119861 ?auto_119862 ?auto_119863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119867 - BLOCK
      ?auto_119868 - BLOCK
      ?auto_119869 - BLOCK
      ?auto_119870 - BLOCK
    )
    :vars
    (
      ?auto_119873 - BLOCK
      ?auto_119871 - BLOCK
      ?auto_119872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119873 ?auto_119870 ) ( ON-TABLE ?auto_119867 ) ( ON ?auto_119868 ?auto_119867 ) ( ON ?auto_119869 ?auto_119868 ) ( ON ?auto_119870 ?auto_119869 ) ( not ( = ?auto_119867 ?auto_119868 ) ) ( not ( = ?auto_119867 ?auto_119869 ) ) ( not ( = ?auto_119867 ?auto_119870 ) ) ( not ( = ?auto_119867 ?auto_119873 ) ) ( not ( = ?auto_119868 ?auto_119869 ) ) ( not ( = ?auto_119868 ?auto_119870 ) ) ( not ( = ?auto_119868 ?auto_119873 ) ) ( not ( = ?auto_119869 ?auto_119870 ) ) ( not ( = ?auto_119869 ?auto_119873 ) ) ( not ( = ?auto_119870 ?auto_119873 ) ) ( not ( = ?auto_119867 ?auto_119871 ) ) ( not ( = ?auto_119867 ?auto_119872 ) ) ( not ( = ?auto_119868 ?auto_119871 ) ) ( not ( = ?auto_119868 ?auto_119872 ) ) ( not ( = ?auto_119869 ?auto_119871 ) ) ( not ( = ?auto_119869 ?auto_119872 ) ) ( not ( = ?auto_119870 ?auto_119871 ) ) ( not ( = ?auto_119870 ?auto_119872 ) ) ( not ( = ?auto_119873 ?auto_119871 ) ) ( not ( = ?auto_119873 ?auto_119872 ) ) ( not ( = ?auto_119871 ?auto_119872 ) ) ( ON ?auto_119871 ?auto_119873 ) ( CLEAR ?auto_119871 ) ( HOLDING ?auto_119872 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119872 )
      ( MAKE-4PILE ?auto_119867 ?auto_119868 ?auto_119869 ?auto_119870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119874 - BLOCK
      ?auto_119875 - BLOCK
      ?auto_119876 - BLOCK
      ?auto_119877 - BLOCK
    )
    :vars
    (
      ?auto_119879 - BLOCK
      ?auto_119878 - BLOCK
      ?auto_119880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119879 ?auto_119877 ) ( ON-TABLE ?auto_119874 ) ( ON ?auto_119875 ?auto_119874 ) ( ON ?auto_119876 ?auto_119875 ) ( ON ?auto_119877 ?auto_119876 ) ( not ( = ?auto_119874 ?auto_119875 ) ) ( not ( = ?auto_119874 ?auto_119876 ) ) ( not ( = ?auto_119874 ?auto_119877 ) ) ( not ( = ?auto_119874 ?auto_119879 ) ) ( not ( = ?auto_119875 ?auto_119876 ) ) ( not ( = ?auto_119875 ?auto_119877 ) ) ( not ( = ?auto_119875 ?auto_119879 ) ) ( not ( = ?auto_119876 ?auto_119877 ) ) ( not ( = ?auto_119876 ?auto_119879 ) ) ( not ( = ?auto_119877 ?auto_119879 ) ) ( not ( = ?auto_119874 ?auto_119878 ) ) ( not ( = ?auto_119874 ?auto_119880 ) ) ( not ( = ?auto_119875 ?auto_119878 ) ) ( not ( = ?auto_119875 ?auto_119880 ) ) ( not ( = ?auto_119876 ?auto_119878 ) ) ( not ( = ?auto_119876 ?auto_119880 ) ) ( not ( = ?auto_119877 ?auto_119878 ) ) ( not ( = ?auto_119877 ?auto_119880 ) ) ( not ( = ?auto_119879 ?auto_119878 ) ) ( not ( = ?auto_119879 ?auto_119880 ) ) ( not ( = ?auto_119878 ?auto_119880 ) ) ( ON ?auto_119878 ?auto_119879 ) ( ON ?auto_119880 ?auto_119878 ) ( CLEAR ?auto_119880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119874 ?auto_119875 ?auto_119876 ?auto_119877 ?auto_119879 ?auto_119878 )
      ( MAKE-4PILE ?auto_119874 ?auto_119875 ?auto_119876 ?auto_119877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119881 - BLOCK
      ?auto_119882 - BLOCK
      ?auto_119883 - BLOCK
      ?auto_119884 - BLOCK
    )
    :vars
    (
      ?auto_119887 - BLOCK
      ?auto_119885 - BLOCK
      ?auto_119886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119887 ?auto_119884 ) ( ON-TABLE ?auto_119881 ) ( ON ?auto_119882 ?auto_119881 ) ( ON ?auto_119883 ?auto_119882 ) ( ON ?auto_119884 ?auto_119883 ) ( not ( = ?auto_119881 ?auto_119882 ) ) ( not ( = ?auto_119881 ?auto_119883 ) ) ( not ( = ?auto_119881 ?auto_119884 ) ) ( not ( = ?auto_119881 ?auto_119887 ) ) ( not ( = ?auto_119882 ?auto_119883 ) ) ( not ( = ?auto_119882 ?auto_119884 ) ) ( not ( = ?auto_119882 ?auto_119887 ) ) ( not ( = ?auto_119883 ?auto_119884 ) ) ( not ( = ?auto_119883 ?auto_119887 ) ) ( not ( = ?auto_119884 ?auto_119887 ) ) ( not ( = ?auto_119881 ?auto_119885 ) ) ( not ( = ?auto_119881 ?auto_119886 ) ) ( not ( = ?auto_119882 ?auto_119885 ) ) ( not ( = ?auto_119882 ?auto_119886 ) ) ( not ( = ?auto_119883 ?auto_119885 ) ) ( not ( = ?auto_119883 ?auto_119886 ) ) ( not ( = ?auto_119884 ?auto_119885 ) ) ( not ( = ?auto_119884 ?auto_119886 ) ) ( not ( = ?auto_119887 ?auto_119885 ) ) ( not ( = ?auto_119887 ?auto_119886 ) ) ( not ( = ?auto_119885 ?auto_119886 ) ) ( ON ?auto_119885 ?auto_119887 ) ( HOLDING ?auto_119886 ) ( CLEAR ?auto_119885 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119881 ?auto_119882 ?auto_119883 ?auto_119884 ?auto_119887 ?auto_119885 ?auto_119886 )
      ( MAKE-4PILE ?auto_119881 ?auto_119882 ?auto_119883 ?auto_119884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119888 - BLOCK
      ?auto_119889 - BLOCK
      ?auto_119890 - BLOCK
      ?auto_119891 - BLOCK
    )
    :vars
    (
      ?auto_119894 - BLOCK
      ?auto_119892 - BLOCK
      ?auto_119893 - BLOCK
      ?auto_119895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119894 ?auto_119891 ) ( ON-TABLE ?auto_119888 ) ( ON ?auto_119889 ?auto_119888 ) ( ON ?auto_119890 ?auto_119889 ) ( ON ?auto_119891 ?auto_119890 ) ( not ( = ?auto_119888 ?auto_119889 ) ) ( not ( = ?auto_119888 ?auto_119890 ) ) ( not ( = ?auto_119888 ?auto_119891 ) ) ( not ( = ?auto_119888 ?auto_119894 ) ) ( not ( = ?auto_119889 ?auto_119890 ) ) ( not ( = ?auto_119889 ?auto_119891 ) ) ( not ( = ?auto_119889 ?auto_119894 ) ) ( not ( = ?auto_119890 ?auto_119891 ) ) ( not ( = ?auto_119890 ?auto_119894 ) ) ( not ( = ?auto_119891 ?auto_119894 ) ) ( not ( = ?auto_119888 ?auto_119892 ) ) ( not ( = ?auto_119888 ?auto_119893 ) ) ( not ( = ?auto_119889 ?auto_119892 ) ) ( not ( = ?auto_119889 ?auto_119893 ) ) ( not ( = ?auto_119890 ?auto_119892 ) ) ( not ( = ?auto_119890 ?auto_119893 ) ) ( not ( = ?auto_119891 ?auto_119892 ) ) ( not ( = ?auto_119891 ?auto_119893 ) ) ( not ( = ?auto_119894 ?auto_119892 ) ) ( not ( = ?auto_119894 ?auto_119893 ) ) ( not ( = ?auto_119892 ?auto_119893 ) ) ( ON ?auto_119892 ?auto_119894 ) ( CLEAR ?auto_119892 ) ( ON ?auto_119893 ?auto_119895 ) ( CLEAR ?auto_119893 ) ( HAND-EMPTY ) ( not ( = ?auto_119888 ?auto_119895 ) ) ( not ( = ?auto_119889 ?auto_119895 ) ) ( not ( = ?auto_119890 ?auto_119895 ) ) ( not ( = ?auto_119891 ?auto_119895 ) ) ( not ( = ?auto_119894 ?auto_119895 ) ) ( not ( = ?auto_119892 ?auto_119895 ) ) ( not ( = ?auto_119893 ?auto_119895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119893 ?auto_119895 )
      ( MAKE-4PILE ?auto_119888 ?auto_119889 ?auto_119890 ?auto_119891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119896 - BLOCK
      ?auto_119897 - BLOCK
      ?auto_119898 - BLOCK
      ?auto_119899 - BLOCK
    )
    :vars
    (
      ?auto_119900 - BLOCK
      ?auto_119903 - BLOCK
      ?auto_119901 - BLOCK
      ?auto_119902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119900 ?auto_119899 ) ( ON-TABLE ?auto_119896 ) ( ON ?auto_119897 ?auto_119896 ) ( ON ?auto_119898 ?auto_119897 ) ( ON ?auto_119899 ?auto_119898 ) ( not ( = ?auto_119896 ?auto_119897 ) ) ( not ( = ?auto_119896 ?auto_119898 ) ) ( not ( = ?auto_119896 ?auto_119899 ) ) ( not ( = ?auto_119896 ?auto_119900 ) ) ( not ( = ?auto_119897 ?auto_119898 ) ) ( not ( = ?auto_119897 ?auto_119899 ) ) ( not ( = ?auto_119897 ?auto_119900 ) ) ( not ( = ?auto_119898 ?auto_119899 ) ) ( not ( = ?auto_119898 ?auto_119900 ) ) ( not ( = ?auto_119899 ?auto_119900 ) ) ( not ( = ?auto_119896 ?auto_119903 ) ) ( not ( = ?auto_119896 ?auto_119901 ) ) ( not ( = ?auto_119897 ?auto_119903 ) ) ( not ( = ?auto_119897 ?auto_119901 ) ) ( not ( = ?auto_119898 ?auto_119903 ) ) ( not ( = ?auto_119898 ?auto_119901 ) ) ( not ( = ?auto_119899 ?auto_119903 ) ) ( not ( = ?auto_119899 ?auto_119901 ) ) ( not ( = ?auto_119900 ?auto_119903 ) ) ( not ( = ?auto_119900 ?auto_119901 ) ) ( not ( = ?auto_119903 ?auto_119901 ) ) ( ON ?auto_119901 ?auto_119902 ) ( CLEAR ?auto_119901 ) ( not ( = ?auto_119896 ?auto_119902 ) ) ( not ( = ?auto_119897 ?auto_119902 ) ) ( not ( = ?auto_119898 ?auto_119902 ) ) ( not ( = ?auto_119899 ?auto_119902 ) ) ( not ( = ?auto_119900 ?auto_119902 ) ) ( not ( = ?auto_119903 ?auto_119902 ) ) ( not ( = ?auto_119901 ?auto_119902 ) ) ( HOLDING ?auto_119903 ) ( CLEAR ?auto_119900 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119896 ?auto_119897 ?auto_119898 ?auto_119899 ?auto_119900 ?auto_119903 )
      ( MAKE-4PILE ?auto_119896 ?auto_119897 ?auto_119898 ?auto_119899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119904 - BLOCK
      ?auto_119905 - BLOCK
      ?auto_119906 - BLOCK
      ?auto_119907 - BLOCK
    )
    :vars
    (
      ?auto_119909 - BLOCK
      ?auto_119908 - BLOCK
      ?auto_119911 - BLOCK
      ?auto_119910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119909 ?auto_119907 ) ( ON-TABLE ?auto_119904 ) ( ON ?auto_119905 ?auto_119904 ) ( ON ?auto_119906 ?auto_119905 ) ( ON ?auto_119907 ?auto_119906 ) ( not ( = ?auto_119904 ?auto_119905 ) ) ( not ( = ?auto_119904 ?auto_119906 ) ) ( not ( = ?auto_119904 ?auto_119907 ) ) ( not ( = ?auto_119904 ?auto_119909 ) ) ( not ( = ?auto_119905 ?auto_119906 ) ) ( not ( = ?auto_119905 ?auto_119907 ) ) ( not ( = ?auto_119905 ?auto_119909 ) ) ( not ( = ?auto_119906 ?auto_119907 ) ) ( not ( = ?auto_119906 ?auto_119909 ) ) ( not ( = ?auto_119907 ?auto_119909 ) ) ( not ( = ?auto_119904 ?auto_119908 ) ) ( not ( = ?auto_119904 ?auto_119911 ) ) ( not ( = ?auto_119905 ?auto_119908 ) ) ( not ( = ?auto_119905 ?auto_119911 ) ) ( not ( = ?auto_119906 ?auto_119908 ) ) ( not ( = ?auto_119906 ?auto_119911 ) ) ( not ( = ?auto_119907 ?auto_119908 ) ) ( not ( = ?auto_119907 ?auto_119911 ) ) ( not ( = ?auto_119909 ?auto_119908 ) ) ( not ( = ?auto_119909 ?auto_119911 ) ) ( not ( = ?auto_119908 ?auto_119911 ) ) ( ON ?auto_119911 ?auto_119910 ) ( not ( = ?auto_119904 ?auto_119910 ) ) ( not ( = ?auto_119905 ?auto_119910 ) ) ( not ( = ?auto_119906 ?auto_119910 ) ) ( not ( = ?auto_119907 ?auto_119910 ) ) ( not ( = ?auto_119909 ?auto_119910 ) ) ( not ( = ?auto_119908 ?auto_119910 ) ) ( not ( = ?auto_119911 ?auto_119910 ) ) ( CLEAR ?auto_119909 ) ( ON ?auto_119908 ?auto_119911 ) ( CLEAR ?auto_119908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119910 ?auto_119911 )
      ( MAKE-4PILE ?auto_119904 ?auto_119905 ?auto_119906 ?auto_119907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119928 - BLOCK
      ?auto_119929 - BLOCK
      ?auto_119930 - BLOCK
      ?auto_119931 - BLOCK
    )
    :vars
    (
      ?auto_119932 - BLOCK
      ?auto_119933 - BLOCK
      ?auto_119935 - BLOCK
      ?auto_119934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119928 ) ( ON ?auto_119929 ?auto_119928 ) ( ON ?auto_119930 ?auto_119929 ) ( not ( = ?auto_119928 ?auto_119929 ) ) ( not ( = ?auto_119928 ?auto_119930 ) ) ( not ( = ?auto_119928 ?auto_119931 ) ) ( not ( = ?auto_119928 ?auto_119932 ) ) ( not ( = ?auto_119929 ?auto_119930 ) ) ( not ( = ?auto_119929 ?auto_119931 ) ) ( not ( = ?auto_119929 ?auto_119932 ) ) ( not ( = ?auto_119930 ?auto_119931 ) ) ( not ( = ?auto_119930 ?auto_119932 ) ) ( not ( = ?auto_119931 ?auto_119932 ) ) ( not ( = ?auto_119928 ?auto_119933 ) ) ( not ( = ?auto_119928 ?auto_119935 ) ) ( not ( = ?auto_119929 ?auto_119933 ) ) ( not ( = ?auto_119929 ?auto_119935 ) ) ( not ( = ?auto_119930 ?auto_119933 ) ) ( not ( = ?auto_119930 ?auto_119935 ) ) ( not ( = ?auto_119931 ?auto_119933 ) ) ( not ( = ?auto_119931 ?auto_119935 ) ) ( not ( = ?auto_119932 ?auto_119933 ) ) ( not ( = ?auto_119932 ?auto_119935 ) ) ( not ( = ?auto_119933 ?auto_119935 ) ) ( ON ?auto_119935 ?auto_119934 ) ( not ( = ?auto_119928 ?auto_119934 ) ) ( not ( = ?auto_119929 ?auto_119934 ) ) ( not ( = ?auto_119930 ?auto_119934 ) ) ( not ( = ?auto_119931 ?auto_119934 ) ) ( not ( = ?auto_119932 ?auto_119934 ) ) ( not ( = ?auto_119933 ?auto_119934 ) ) ( not ( = ?auto_119935 ?auto_119934 ) ) ( ON ?auto_119933 ?auto_119935 ) ( ON-TABLE ?auto_119934 ) ( ON ?auto_119932 ?auto_119933 ) ( CLEAR ?auto_119932 ) ( HOLDING ?auto_119931 ) ( CLEAR ?auto_119930 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119928 ?auto_119929 ?auto_119930 ?auto_119931 ?auto_119932 )
      ( MAKE-4PILE ?auto_119928 ?auto_119929 ?auto_119930 ?auto_119931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119936 - BLOCK
      ?auto_119937 - BLOCK
      ?auto_119938 - BLOCK
      ?auto_119939 - BLOCK
    )
    :vars
    (
      ?auto_119941 - BLOCK
      ?auto_119942 - BLOCK
      ?auto_119940 - BLOCK
      ?auto_119943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119936 ) ( ON ?auto_119937 ?auto_119936 ) ( ON ?auto_119938 ?auto_119937 ) ( not ( = ?auto_119936 ?auto_119937 ) ) ( not ( = ?auto_119936 ?auto_119938 ) ) ( not ( = ?auto_119936 ?auto_119939 ) ) ( not ( = ?auto_119936 ?auto_119941 ) ) ( not ( = ?auto_119937 ?auto_119938 ) ) ( not ( = ?auto_119937 ?auto_119939 ) ) ( not ( = ?auto_119937 ?auto_119941 ) ) ( not ( = ?auto_119938 ?auto_119939 ) ) ( not ( = ?auto_119938 ?auto_119941 ) ) ( not ( = ?auto_119939 ?auto_119941 ) ) ( not ( = ?auto_119936 ?auto_119942 ) ) ( not ( = ?auto_119936 ?auto_119940 ) ) ( not ( = ?auto_119937 ?auto_119942 ) ) ( not ( = ?auto_119937 ?auto_119940 ) ) ( not ( = ?auto_119938 ?auto_119942 ) ) ( not ( = ?auto_119938 ?auto_119940 ) ) ( not ( = ?auto_119939 ?auto_119942 ) ) ( not ( = ?auto_119939 ?auto_119940 ) ) ( not ( = ?auto_119941 ?auto_119942 ) ) ( not ( = ?auto_119941 ?auto_119940 ) ) ( not ( = ?auto_119942 ?auto_119940 ) ) ( ON ?auto_119940 ?auto_119943 ) ( not ( = ?auto_119936 ?auto_119943 ) ) ( not ( = ?auto_119937 ?auto_119943 ) ) ( not ( = ?auto_119938 ?auto_119943 ) ) ( not ( = ?auto_119939 ?auto_119943 ) ) ( not ( = ?auto_119941 ?auto_119943 ) ) ( not ( = ?auto_119942 ?auto_119943 ) ) ( not ( = ?auto_119940 ?auto_119943 ) ) ( ON ?auto_119942 ?auto_119940 ) ( ON-TABLE ?auto_119943 ) ( ON ?auto_119941 ?auto_119942 ) ( CLEAR ?auto_119938 ) ( ON ?auto_119939 ?auto_119941 ) ( CLEAR ?auto_119939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119943 ?auto_119940 ?auto_119942 ?auto_119941 )
      ( MAKE-4PILE ?auto_119936 ?auto_119937 ?auto_119938 ?auto_119939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119944 - BLOCK
      ?auto_119945 - BLOCK
      ?auto_119946 - BLOCK
      ?auto_119947 - BLOCK
    )
    :vars
    (
      ?auto_119950 - BLOCK
      ?auto_119949 - BLOCK
      ?auto_119948 - BLOCK
      ?auto_119951 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119944 ) ( ON ?auto_119945 ?auto_119944 ) ( not ( = ?auto_119944 ?auto_119945 ) ) ( not ( = ?auto_119944 ?auto_119946 ) ) ( not ( = ?auto_119944 ?auto_119947 ) ) ( not ( = ?auto_119944 ?auto_119950 ) ) ( not ( = ?auto_119945 ?auto_119946 ) ) ( not ( = ?auto_119945 ?auto_119947 ) ) ( not ( = ?auto_119945 ?auto_119950 ) ) ( not ( = ?auto_119946 ?auto_119947 ) ) ( not ( = ?auto_119946 ?auto_119950 ) ) ( not ( = ?auto_119947 ?auto_119950 ) ) ( not ( = ?auto_119944 ?auto_119949 ) ) ( not ( = ?auto_119944 ?auto_119948 ) ) ( not ( = ?auto_119945 ?auto_119949 ) ) ( not ( = ?auto_119945 ?auto_119948 ) ) ( not ( = ?auto_119946 ?auto_119949 ) ) ( not ( = ?auto_119946 ?auto_119948 ) ) ( not ( = ?auto_119947 ?auto_119949 ) ) ( not ( = ?auto_119947 ?auto_119948 ) ) ( not ( = ?auto_119950 ?auto_119949 ) ) ( not ( = ?auto_119950 ?auto_119948 ) ) ( not ( = ?auto_119949 ?auto_119948 ) ) ( ON ?auto_119948 ?auto_119951 ) ( not ( = ?auto_119944 ?auto_119951 ) ) ( not ( = ?auto_119945 ?auto_119951 ) ) ( not ( = ?auto_119946 ?auto_119951 ) ) ( not ( = ?auto_119947 ?auto_119951 ) ) ( not ( = ?auto_119950 ?auto_119951 ) ) ( not ( = ?auto_119949 ?auto_119951 ) ) ( not ( = ?auto_119948 ?auto_119951 ) ) ( ON ?auto_119949 ?auto_119948 ) ( ON-TABLE ?auto_119951 ) ( ON ?auto_119950 ?auto_119949 ) ( ON ?auto_119947 ?auto_119950 ) ( CLEAR ?auto_119947 ) ( HOLDING ?auto_119946 ) ( CLEAR ?auto_119945 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119944 ?auto_119945 ?auto_119946 )
      ( MAKE-4PILE ?auto_119944 ?auto_119945 ?auto_119946 ?auto_119947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119952 - BLOCK
      ?auto_119953 - BLOCK
      ?auto_119954 - BLOCK
      ?auto_119955 - BLOCK
    )
    :vars
    (
      ?auto_119956 - BLOCK
      ?auto_119958 - BLOCK
      ?auto_119959 - BLOCK
      ?auto_119957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119952 ) ( ON ?auto_119953 ?auto_119952 ) ( not ( = ?auto_119952 ?auto_119953 ) ) ( not ( = ?auto_119952 ?auto_119954 ) ) ( not ( = ?auto_119952 ?auto_119955 ) ) ( not ( = ?auto_119952 ?auto_119956 ) ) ( not ( = ?auto_119953 ?auto_119954 ) ) ( not ( = ?auto_119953 ?auto_119955 ) ) ( not ( = ?auto_119953 ?auto_119956 ) ) ( not ( = ?auto_119954 ?auto_119955 ) ) ( not ( = ?auto_119954 ?auto_119956 ) ) ( not ( = ?auto_119955 ?auto_119956 ) ) ( not ( = ?auto_119952 ?auto_119958 ) ) ( not ( = ?auto_119952 ?auto_119959 ) ) ( not ( = ?auto_119953 ?auto_119958 ) ) ( not ( = ?auto_119953 ?auto_119959 ) ) ( not ( = ?auto_119954 ?auto_119958 ) ) ( not ( = ?auto_119954 ?auto_119959 ) ) ( not ( = ?auto_119955 ?auto_119958 ) ) ( not ( = ?auto_119955 ?auto_119959 ) ) ( not ( = ?auto_119956 ?auto_119958 ) ) ( not ( = ?auto_119956 ?auto_119959 ) ) ( not ( = ?auto_119958 ?auto_119959 ) ) ( ON ?auto_119959 ?auto_119957 ) ( not ( = ?auto_119952 ?auto_119957 ) ) ( not ( = ?auto_119953 ?auto_119957 ) ) ( not ( = ?auto_119954 ?auto_119957 ) ) ( not ( = ?auto_119955 ?auto_119957 ) ) ( not ( = ?auto_119956 ?auto_119957 ) ) ( not ( = ?auto_119958 ?auto_119957 ) ) ( not ( = ?auto_119959 ?auto_119957 ) ) ( ON ?auto_119958 ?auto_119959 ) ( ON-TABLE ?auto_119957 ) ( ON ?auto_119956 ?auto_119958 ) ( ON ?auto_119955 ?auto_119956 ) ( CLEAR ?auto_119953 ) ( ON ?auto_119954 ?auto_119955 ) ( CLEAR ?auto_119954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119957 ?auto_119959 ?auto_119958 ?auto_119956 ?auto_119955 )
      ( MAKE-4PILE ?auto_119952 ?auto_119953 ?auto_119954 ?auto_119955 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119960 - BLOCK
      ?auto_119961 - BLOCK
      ?auto_119962 - BLOCK
      ?auto_119963 - BLOCK
    )
    :vars
    (
      ?auto_119964 - BLOCK
      ?auto_119966 - BLOCK
      ?auto_119965 - BLOCK
      ?auto_119967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119960 ) ( not ( = ?auto_119960 ?auto_119961 ) ) ( not ( = ?auto_119960 ?auto_119962 ) ) ( not ( = ?auto_119960 ?auto_119963 ) ) ( not ( = ?auto_119960 ?auto_119964 ) ) ( not ( = ?auto_119961 ?auto_119962 ) ) ( not ( = ?auto_119961 ?auto_119963 ) ) ( not ( = ?auto_119961 ?auto_119964 ) ) ( not ( = ?auto_119962 ?auto_119963 ) ) ( not ( = ?auto_119962 ?auto_119964 ) ) ( not ( = ?auto_119963 ?auto_119964 ) ) ( not ( = ?auto_119960 ?auto_119966 ) ) ( not ( = ?auto_119960 ?auto_119965 ) ) ( not ( = ?auto_119961 ?auto_119966 ) ) ( not ( = ?auto_119961 ?auto_119965 ) ) ( not ( = ?auto_119962 ?auto_119966 ) ) ( not ( = ?auto_119962 ?auto_119965 ) ) ( not ( = ?auto_119963 ?auto_119966 ) ) ( not ( = ?auto_119963 ?auto_119965 ) ) ( not ( = ?auto_119964 ?auto_119966 ) ) ( not ( = ?auto_119964 ?auto_119965 ) ) ( not ( = ?auto_119966 ?auto_119965 ) ) ( ON ?auto_119965 ?auto_119967 ) ( not ( = ?auto_119960 ?auto_119967 ) ) ( not ( = ?auto_119961 ?auto_119967 ) ) ( not ( = ?auto_119962 ?auto_119967 ) ) ( not ( = ?auto_119963 ?auto_119967 ) ) ( not ( = ?auto_119964 ?auto_119967 ) ) ( not ( = ?auto_119966 ?auto_119967 ) ) ( not ( = ?auto_119965 ?auto_119967 ) ) ( ON ?auto_119966 ?auto_119965 ) ( ON-TABLE ?auto_119967 ) ( ON ?auto_119964 ?auto_119966 ) ( ON ?auto_119963 ?auto_119964 ) ( ON ?auto_119962 ?auto_119963 ) ( CLEAR ?auto_119962 ) ( HOLDING ?auto_119961 ) ( CLEAR ?auto_119960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119960 ?auto_119961 )
      ( MAKE-4PILE ?auto_119960 ?auto_119961 ?auto_119962 ?auto_119963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119968 - BLOCK
      ?auto_119969 - BLOCK
      ?auto_119970 - BLOCK
      ?auto_119971 - BLOCK
    )
    :vars
    (
      ?auto_119972 - BLOCK
      ?auto_119974 - BLOCK
      ?auto_119973 - BLOCK
      ?auto_119975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119968 ) ( not ( = ?auto_119968 ?auto_119969 ) ) ( not ( = ?auto_119968 ?auto_119970 ) ) ( not ( = ?auto_119968 ?auto_119971 ) ) ( not ( = ?auto_119968 ?auto_119972 ) ) ( not ( = ?auto_119969 ?auto_119970 ) ) ( not ( = ?auto_119969 ?auto_119971 ) ) ( not ( = ?auto_119969 ?auto_119972 ) ) ( not ( = ?auto_119970 ?auto_119971 ) ) ( not ( = ?auto_119970 ?auto_119972 ) ) ( not ( = ?auto_119971 ?auto_119972 ) ) ( not ( = ?auto_119968 ?auto_119974 ) ) ( not ( = ?auto_119968 ?auto_119973 ) ) ( not ( = ?auto_119969 ?auto_119974 ) ) ( not ( = ?auto_119969 ?auto_119973 ) ) ( not ( = ?auto_119970 ?auto_119974 ) ) ( not ( = ?auto_119970 ?auto_119973 ) ) ( not ( = ?auto_119971 ?auto_119974 ) ) ( not ( = ?auto_119971 ?auto_119973 ) ) ( not ( = ?auto_119972 ?auto_119974 ) ) ( not ( = ?auto_119972 ?auto_119973 ) ) ( not ( = ?auto_119974 ?auto_119973 ) ) ( ON ?auto_119973 ?auto_119975 ) ( not ( = ?auto_119968 ?auto_119975 ) ) ( not ( = ?auto_119969 ?auto_119975 ) ) ( not ( = ?auto_119970 ?auto_119975 ) ) ( not ( = ?auto_119971 ?auto_119975 ) ) ( not ( = ?auto_119972 ?auto_119975 ) ) ( not ( = ?auto_119974 ?auto_119975 ) ) ( not ( = ?auto_119973 ?auto_119975 ) ) ( ON ?auto_119974 ?auto_119973 ) ( ON-TABLE ?auto_119975 ) ( ON ?auto_119972 ?auto_119974 ) ( ON ?auto_119971 ?auto_119972 ) ( ON ?auto_119970 ?auto_119971 ) ( CLEAR ?auto_119968 ) ( ON ?auto_119969 ?auto_119970 ) ( CLEAR ?auto_119969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119975 ?auto_119973 ?auto_119974 ?auto_119972 ?auto_119971 ?auto_119970 )
      ( MAKE-4PILE ?auto_119968 ?auto_119969 ?auto_119970 ?auto_119971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119976 - BLOCK
      ?auto_119977 - BLOCK
      ?auto_119978 - BLOCK
      ?auto_119979 - BLOCK
    )
    :vars
    (
      ?auto_119981 - BLOCK
      ?auto_119983 - BLOCK
      ?auto_119982 - BLOCK
      ?auto_119980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119976 ?auto_119977 ) ) ( not ( = ?auto_119976 ?auto_119978 ) ) ( not ( = ?auto_119976 ?auto_119979 ) ) ( not ( = ?auto_119976 ?auto_119981 ) ) ( not ( = ?auto_119977 ?auto_119978 ) ) ( not ( = ?auto_119977 ?auto_119979 ) ) ( not ( = ?auto_119977 ?auto_119981 ) ) ( not ( = ?auto_119978 ?auto_119979 ) ) ( not ( = ?auto_119978 ?auto_119981 ) ) ( not ( = ?auto_119979 ?auto_119981 ) ) ( not ( = ?auto_119976 ?auto_119983 ) ) ( not ( = ?auto_119976 ?auto_119982 ) ) ( not ( = ?auto_119977 ?auto_119983 ) ) ( not ( = ?auto_119977 ?auto_119982 ) ) ( not ( = ?auto_119978 ?auto_119983 ) ) ( not ( = ?auto_119978 ?auto_119982 ) ) ( not ( = ?auto_119979 ?auto_119983 ) ) ( not ( = ?auto_119979 ?auto_119982 ) ) ( not ( = ?auto_119981 ?auto_119983 ) ) ( not ( = ?auto_119981 ?auto_119982 ) ) ( not ( = ?auto_119983 ?auto_119982 ) ) ( ON ?auto_119982 ?auto_119980 ) ( not ( = ?auto_119976 ?auto_119980 ) ) ( not ( = ?auto_119977 ?auto_119980 ) ) ( not ( = ?auto_119978 ?auto_119980 ) ) ( not ( = ?auto_119979 ?auto_119980 ) ) ( not ( = ?auto_119981 ?auto_119980 ) ) ( not ( = ?auto_119983 ?auto_119980 ) ) ( not ( = ?auto_119982 ?auto_119980 ) ) ( ON ?auto_119983 ?auto_119982 ) ( ON-TABLE ?auto_119980 ) ( ON ?auto_119981 ?auto_119983 ) ( ON ?auto_119979 ?auto_119981 ) ( ON ?auto_119978 ?auto_119979 ) ( ON ?auto_119977 ?auto_119978 ) ( CLEAR ?auto_119977 ) ( HOLDING ?auto_119976 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119976 )
      ( MAKE-4PILE ?auto_119976 ?auto_119977 ?auto_119978 ?auto_119979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_119984 - BLOCK
      ?auto_119985 - BLOCK
      ?auto_119986 - BLOCK
      ?auto_119987 - BLOCK
    )
    :vars
    (
      ?auto_119989 - BLOCK
      ?auto_119988 - BLOCK
      ?auto_119990 - BLOCK
      ?auto_119991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119984 ?auto_119985 ) ) ( not ( = ?auto_119984 ?auto_119986 ) ) ( not ( = ?auto_119984 ?auto_119987 ) ) ( not ( = ?auto_119984 ?auto_119989 ) ) ( not ( = ?auto_119985 ?auto_119986 ) ) ( not ( = ?auto_119985 ?auto_119987 ) ) ( not ( = ?auto_119985 ?auto_119989 ) ) ( not ( = ?auto_119986 ?auto_119987 ) ) ( not ( = ?auto_119986 ?auto_119989 ) ) ( not ( = ?auto_119987 ?auto_119989 ) ) ( not ( = ?auto_119984 ?auto_119988 ) ) ( not ( = ?auto_119984 ?auto_119990 ) ) ( not ( = ?auto_119985 ?auto_119988 ) ) ( not ( = ?auto_119985 ?auto_119990 ) ) ( not ( = ?auto_119986 ?auto_119988 ) ) ( not ( = ?auto_119986 ?auto_119990 ) ) ( not ( = ?auto_119987 ?auto_119988 ) ) ( not ( = ?auto_119987 ?auto_119990 ) ) ( not ( = ?auto_119989 ?auto_119988 ) ) ( not ( = ?auto_119989 ?auto_119990 ) ) ( not ( = ?auto_119988 ?auto_119990 ) ) ( ON ?auto_119990 ?auto_119991 ) ( not ( = ?auto_119984 ?auto_119991 ) ) ( not ( = ?auto_119985 ?auto_119991 ) ) ( not ( = ?auto_119986 ?auto_119991 ) ) ( not ( = ?auto_119987 ?auto_119991 ) ) ( not ( = ?auto_119989 ?auto_119991 ) ) ( not ( = ?auto_119988 ?auto_119991 ) ) ( not ( = ?auto_119990 ?auto_119991 ) ) ( ON ?auto_119988 ?auto_119990 ) ( ON-TABLE ?auto_119991 ) ( ON ?auto_119989 ?auto_119988 ) ( ON ?auto_119987 ?auto_119989 ) ( ON ?auto_119986 ?auto_119987 ) ( ON ?auto_119985 ?auto_119986 ) ( ON ?auto_119984 ?auto_119985 ) ( CLEAR ?auto_119984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119991 ?auto_119990 ?auto_119988 ?auto_119989 ?auto_119987 ?auto_119986 ?auto_119985 )
      ( MAKE-4PILE ?auto_119984 ?auto_119985 ?auto_119986 ?auto_119987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119995 - BLOCK
      ?auto_119996 - BLOCK
      ?auto_119997 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_119997 ) ( CLEAR ?auto_119996 ) ( ON-TABLE ?auto_119995 ) ( ON ?auto_119996 ?auto_119995 ) ( not ( = ?auto_119995 ?auto_119996 ) ) ( not ( = ?auto_119995 ?auto_119997 ) ) ( not ( = ?auto_119996 ?auto_119997 ) ) )
    :subtasks
    ( ( !STACK ?auto_119997 ?auto_119996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_119998 - BLOCK
      ?auto_119999 - BLOCK
      ?auto_120000 - BLOCK
    )
    :vars
    (
      ?auto_120001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119999 ) ( ON-TABLE ?auto_119998 ) ( ON ?auto_119999 ?auto_119998 ) ( not ( = ?auto_119998 ?auto_119999 ) ) ( not ( = ?auto_119998 ?auto_120000 ) ) ( not ( = ?auto_119999 ?auto_120000 ) ) ( ON ?auto_120000 ?auto_120001 ) ( CLEAR ?auto_120000 ) ( HAND-EMPTY ) ( not ( = ?auto_119998 ?auto_120001 ) ) ( not ( = ?auto_119999 ?auto_120001 ) ) ( not ( = ?auto_120000 ?auto_120001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120000 ?auto_120001 )
      ( MAKE-3PILE ?auto_119998 ?auto_119999 ?auto_120000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120002 - BLOCK
      ?auto_120003 - BLOCK
      ?auto_120004 - BLOCK
    )
    :vars
    (
      ?auto_120005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120002 ) ( not ( = ?auto_120002 ?auto_120003 ) ) ( not ( = ?auto_120002 ?auto_120004 ) ) ( not ( = ?auto_120003 ?auto_120004 ) ) ( ON ?auto_120004 ?auto_120005 ) ( CLEAR ?auto_120004 ) ( not ( = ?auto_120002 ?auto_120005 ) ) ( not ( = ?auto_120003 ?auto_120005 ) ) ( not ( = ?auto_120004 ?auto_120005 ) ) ( HOLDING ?auto_120003 ) ( CLEAR ?auto_120002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120002 ?auto_120003 )
      ( MAKE-3PILE ?auto_120002 ?auto_120003 ?auto_120004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120006 - BLOCK
      ?auto_120007 - BLOCK
      ?auto_120008 - BLOCK
    )
    :vars
    (
      ?auto_120009 - BLOCK
      ?auto_120012 - BLOCK
      ?auto_120010 - BLOCK
      ?auto_120011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120006 ) ( not ( = ?auto_120006 ?auto_120007 ) ) ( not ( = ?auto_120006 ?auto_120008 ) ) ( not ( = ?auto_120007 ?auto_120008 ) ) ( ON ?auto_120008 ?auto_120009 ) ( not ( = ?auto_120006 ?auto_120009 ) ) ( not ( = ?auto_120007 ?auto_120009 ) ) ( not ( = ?auto_120008 ?auto_120009 ) ) ( CLEAR ?auto_120006 ) ( ON ?auto_120007 ?auto_120008 ) ( CLEAR ?auto_120007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120012 ) ( ON ?auto_120010 ?auto_120012 ) ( ON ?auto_120011 ?auto_120010 ) ( ON ?auto_120009 ?auto_120011 ) ( not ( = ?auto_120012 ?auto_120010 ) ) ( not ( = ?auto_120012 ?auto_120011 ) ) ( not ( = ?auto_120012 ?auto_120009 ) ) ( not ( = ?auto_120012 ?auto_120008 ) ) ( not ( = ?auto_120012 ?auto_120007 ) ) ( not ( = ?auto_120010 ?auto_120011 ) ) ( not ( = ?auto_120010 ?auto_120009 ) ) ( not ( = ?auto_120010 ?auto_120008 ) ) ( not ( = ?auto_120010 ?auto_120007 ) ) ( not ( = ?auto_120011 ?auto_120009 ) ) ( not ( = ?auto_120011 ?auto_120008 ) ) ( not ( = ?auto_120011 ?auto_120007 ) ) ( not ( = ?auto_120006 ?auto_120012 ) ) ( not ( = ?auto_120006 ?auto_120010 ) ) ( not ( = ?auto_120006 ?auto_120011 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120012 ?auto_120010 ?auto_120011 ?auto_120009 ?auto_120008 )
      ( MAKE-3PILE ?auto_120006 ?auto_120007 ?auto_120008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120013 - BLOCK
      ?auto_120014 - BLOCK
      ?auto_120015 - BLOCK
    )
    :vars
    (
      ?auto_120017 - BLOCK
      ?auto_120019 - BLOCK
      ?auto_120016 - BLOCK
      ?auto_120018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120013 ?auto_120014 ) ) ( not ( = ?auto_120013 ?auto_120015 ) ) ( not ( = ?auto_120014 ?auto_120015 ) ) ( ON ?auto_120015 ?auto_120017 ) ( not ( = ?auto_120013 ?auto_120017 ) ) ( not ( = ?auto_120014 ?auto_120017 ) ) ( not ( = ?auto_120015 ?auto_120017 ) ) ( ON ?auto_120014 ?auto_120015 ) ( CLEAR ?auto_120014 ) ( ON-TABLE ?auto_120019 ) ( ON ?auto_120016 ?auto_120019 ) ( ON ?auto_120018 ?auto_120016 ) ( ON ?auto_120017 ?auto_120018 ) ( not ( = ?auto_120019 ?auto_120016 ) ) ( not ( = ?auto_120019 ?auto_120018 ) ) ( not ( = ?auto_120019 ?auto_120017 ) ) ( not ( = ?auto_120019 ?auto_120015 ) ) ( not ( = ?auto_120019 ?auto_120014 ) ) ( not ( = ?auto_120016 ?auto_120018 ) ) ( not ( = ?auto_120016 ?auto_120017 ) ) ( not ( = ?auto_120016 ?auto_120015 ) ) ( not ( = ?auto_120016 ?auto_120014 ) ) ( not ( = ?auto_120018 ?auto_120017 ) ) ( not ( = ?auto_120018 ?auto_120015 ) ) ( not ( = ?auto_120018 ?auto_120014 ) ) ( not ( = ?auto_120013 ?auto_120019 ) ) ( not ( = ?auto_120013 ?auto_120016 ) ) ( not ( = ?auto_120013 ?auto_120018 ) ) ( HOLDING ?auto_120013 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120013 )
      ( MAKE-3PILE ?auto_120013 ?auto_120014 ?auto_120015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120020 - BLOCK
      ?auto_120021 - BLOCK
      ?auto_120022 - BLOCK
    )
    :vars
    (
      ?auto_120026 - BLOCK
      ?auto_120024 - BLOCK
      ?auto_120025 - BLOCK
      ?auto_120023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120020 ?auto_120021 ) ) ( not ( = ?auto_120020 ?auto_120022 ) ) ( not ( = ?auto_120021 ?auto_120022 ) ) ( ON ?auto_120022 ?auto_120026 ) ( not ( = ?auto_120020 ?auto_120026 ) ) ( not ( = ?auto_120021 ?auto_120026 ) ) ( not ( = ?auto_120022 ?auto_120026 ) ) ( ON ?auto_120021 ?auto_120022 ) ( ON-TABLE ?auto_120024 ) ( ON ?auto_120025 ?auto_120024 ) ( ON ?auto_120023 ?auto_120025 ) ( ON ?auto_120026 ?auto_120023 ) ( not ( = ?auto_120024 ?auto_120025 ) ) ( not ( = ?auto_120024 ?auto_120023 ) ) ( not ( = ?auto_120024 ?auto_120026 ) ) ( not ( = ?auto_120024 ?auto_120022 ) ) ( not ( = ?auto_120024 ?auto_120021 ) ) ( not ( = ?auto_120025 ?auto_120023 ) ) ( not ( = ?auto_120025 ?auto_120026 ) ) ( not ( = ?auto_120025 ?auto_120022 ) ) ( not ( = ?auto_120025 ?auto_120021 ) ) ( not ( = ?auto_120023 ?auto_120026 ) ) ( not ( = ?auto_120023 ?auto_120022 ) ) ( not ( = ?auto_120023 ?auto_120021 ) ) ( not ( = ?auto_120020 ?auto_120024 ) ) ( not ( = ?auto_120020 ?auto_120025 ) ) ( not ( = ?auto_120020 ?auto_120023 ) ) ( ON ?auto_120020 ?auto_120021 ) ( CLEAR ?auto_120020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120024 ?auto_120025 ?auto_120023 ?auto_120026 ?auto_120022 ?auto_120021 )
      ( MAKE-3PILE ?auto_120020 ?auto_120021 ?auto_120022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120027 - BLOCK
      ?auto_120028 - BLOCK
      ?auto_120029 - BLOCK
    )
    :vars
    (
      ?auto_120033 - BLOCK
      ?auto_120032 - BLOCK
      ?auto_120031 - BLOCK
      ?auto_120030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120027 ?auto_120028 ) ) ( not ( = ?auto_120027 ?auto_120029 ) ) ( not ( = ?auto_120028 ?auto_120029 ) ) ( ON ?auto_120029 ?auto_120033 ) ( not ( = ?auto_120027 ?auto_120033 ) ) ( not ( = ?auto_120028 ?auto_120033 ) ) ( not ( = ?auto_120029 ?auto_120033 ) ) ( ON ?auto_120028 ?auto_120029 ) ( ON-TABLE ?auto_120032 ) ( ON ?auto_120031 ?auto_120032 ) ( ON ?auto_120030 ?auto_120031 ) ( ON ?auto_120033 ?auto_120030 ) ( not ( = ?auto_120032 ?auto_120031 ) ) ( not ( = ?auto_120032 ?auto_120030 ) ) ( not ( = ?auto_120032 ?auto_120033 ) ) ( not ( = ?auto_120032 ?auto_120029 ) ) ( not ( = ?auto_120032 ?auto_120028 ) ) ( not ( = ?auto_120031 ?auto_120030 ) ) ( not ( = ?auto_120031 ?auto_120033 ) ) ( not ( = ?auto_120031 ?auto_120029 ) ) ( not ( = ?auto_120031 ?auto_120028 ) ) ( not ( = ?auto_120030 ?auto_120033 ) ) ( not ( = ?auto_120030 ?auto_120029 ) ) ( not ( = ?auto_120030 ?auto_120028 ) ) ( not ( = ?auto_120027 ?auto_120032 ) ) ( not ( = ?auto_120027 ?auto_120031 ) ) ( not ( = ?auto_120027 ?auto_120030 ) ) ( HOLDING ?auto_120027 ) ( CLEAR ?auto_120028 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120032 ?auto_120031 ?auto_120030 ?auto_120033 ?auto_120029 ?auto_120028 ?auto_120027 )
      ( MAKE-3PILE ?auto_120027 ?auto_120028 ?auto_120029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120034 - BLOCK
      ?auto_120035 - BLOCK
      ?auto_120036 - BLOCK
    )
    :vars
    (
      ?auto_120040 - BLOCK
      ?auto_120039 - BLOCK
      ?auto_120037 - BLOCK
      ?auto_120038 - BLOCK
      ?auto_120041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120034 ?auto_120035 ) ) ( not ( = ?auto_120034 ?auto_120036 ) ) ( not ( = ?auto_120035 ?auto_120036 ) ) ( ON ?auto_120036 ?auto_120040 ) ( not ( = ?auto_120034 ?auto_120040 ) ) ( not ( = ?auto_120035 ?auto_120040 ) ) ( not ( = ?auto_120036 ?auto_120040 ) ) ( ON ?auto_120035 ?auto_120036 ) ( ON-TABLE ?auto_120039 ) ( ON ?auto_120037 ?auto_120039 ) ( ON ?auto_120038 ?auto_120037 ) ( ON ?auto_120040 ?auto_120038 ) ( not ( = ?auto_120039 ?auto_120037 ) ) ( not ( = ?auto_120039 ?auto_120038 ) ) ( not ( = ?auto_120039 ?auto_120040 ) ) ( not ( = ?auto_120039 ?auto_120036 ) ) ( not ( = ?auto_120039 ?auto_120035 ) ) ( not ( = ?auto_120037 ?auto_120038 ) ) ( not ( = ?auto_120037 ?auto_120040 ) ) ( not ( = ?auto_120037 ?auto_120036 ) ) ( not ( = ?auto_120037 ?auto_120035 ) ) ( not ( = ?auto_120038 ?auto_120040 ) ) ( not ( = ?auto_120038 ?auto_120036 ) ) ( not ( = ?auto_120038 ?auto_120035 ) ) ( not ( = ?auto_120034 ?auto_120039 ) ) ( not ( = ?auto_120034 ?auto_120037 ) ) ( not ( = ?auto_120034 ?auto_120038 ) ) ( CLEAR ?auto_120035 ) ( ON ?auto_120034 ?auto_120041 ) ( CLEAR ?auto_120034 ) ( HAND-EMPTY ) ( not ( = ?auto_120034 ?auto_120041 ) ) ( not ( = ?auto_120035 ?auto_120041 ) ) ( not ( = ?auto_120036 ?auto_120041 ) ) ( not ( = ?auto_120040 ?auto_120041 ) ) ( not ( = ?auto_120039 ?auto_120041 ) ) ( not ( = ?auto_120037 ?auto_120041 ) ) ( not ( = ?auto_120038 ?auto_120041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120034 ?auto_120041 )
      ( MAKE-3PILE ?auto_120034 ?auto_120035 ?auto_120036 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120042 - BLOCK
      ?auto_120043 - BLOCK
      ?auto_120044 - BLOCK
    )
    :vars
    (
      ?auto_120048 - BLOCK
      ?auto_120045 - BLOCK
      ?auto_120046 - BLOCK
      ?auto_120049 - BLOCK
      ?auto_120047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120042 ?auto_120043 ) ) ( not ( = ?auto_120042 ?auto_120044 ) ) ( not ( = ?auto_120043 ?auto_120044 ) ) ( ON ?auto_120044 ?auto_120048 ) ( not ( = ?auto_120042 ?auto_120048 ) ) ( not ( = ?auto_120043 ?auto_120048 ) ) ( not ( = ?auto_120044 ?auto_120048 ) ) ( ON-TABLE ?auto_120045 ) ( ON ?auto_120046 ?auto_120045 ) ( ON ?auto_120049 ?auto_120046 ) ( ON ?auto_120048 ?auto_120049 ) ( not ( = ?auto_120045 ?auto_120046 ) ) ( not ( = ?auto_120045 ?auto_120049 ) ) ( not ( = ?auto_120045 ?auto_120048 ) ) ( not ( = ?auto_120045 ?auto_120044 ) ) ( not ( = ?auto_120045 ?auto_120043 ) ) ( not ( = ?auto_120046 ?auto_120049 ) ) ( not ( = ?auto_120046 ?auto_120048 ) ) ( not ( = ?auto_120046 ?auto_120044 ) ) ( not ( = ?auto_120046 ?auto_120043 ) ) ( not ( = ?auto_120049 ?auto_120048 ) ) ( not ( = ?auto_120049 ?auto_120044 ) ) ( not ( = ?auto_120049 ?auto_120043 ) ) ( not ( = ?auto_120042 ?auto_120045 ) ) ( not ( = ?auto_120042 ?auto_120046 ) ) ( not ( = ?auto_120042 ?auto_120049 ) ) ( ON ?auto_120042 ?auto_120047 ) ( CLEAR ?auto_120042 ) ( not ( = ?auto_120042 ?auto_120047 ) ) ( not ( = ?auto_120043 ?auto_120047 ) ) ( not ( = ?auto_120044 ?auto_120047 ) ) ( not ( = ?auto_120048 ?auto_120047 ) ) ( not ( = ?auto_120045 ?auto_120047 ) ) ( not ( = ?auto_120046 ?auto_120047 ) ) ( not ( = ?auto_120049 ?auto_120047 ) ) ( HOLDING ?auto_120043 ) ( CLEAR ?auto_120044 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120045 ?auto_120046 ?auto_120049 ?auto_120048 ?auto_120044 ?auto_120043 )
      ( MAKE-3PILE ?auto_120042 ?auto_120043 ?auto_120044 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120050 - BLOCK
      ?auto_120051 - BLOCK
      ?auto_120052 - BLOCK
    )
    :vars
    (
      ?auto_120054 - BLOCK
      ?auto_120056 - BLOCK
      ?auto_120053 - BLOCK
      ?auto_120055 - BLOCK
      ?auto_120057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120050 ?auto_120051 ) ) ( not ( = ?auto_120050 ?auto_120052 ) ) ( not ( = ?auto_120051 ?auto_120052 ) ) ( ON ?auto_120052 ?auto_120054 ) ( not ( = ?auto_120050 ?auto_120054 ) ) ( not ( = ?auto_120051 ?auto_120054 ) ) ( not ( = ?auto_120052 ?auto_120054 ) ) ( ON-TABLE ?auto_120056 ) ( ON ?auto_120053 ?auto_120056 ) ( ON ?auto_120055 ?auto_120053 ) ( ON ?auto_120054 ?auto_120055 ) ( not ( = ?auto_120056 ?auto_120053 ) ) ( not ( = ?auto_120056 ?auto_120055 ) ) ( not ( = ?auto_120056 ?auto_120054 ) ) ( not ( = ?auto_120056 ?auto_120052 ) ) ( not ( = ?auto_120056 ?auto_120051 ) ) ( not ( = ?auto_120053 ?auto_120055 ) ) ( not ( = ?auto_120053 ?auto_120054 ) ) ( not ( = ?auto_120053 ?auto_120052 ) ) ( not ( = ?auto_120053 ?auto_120051 ) ) ( not ( = ?auto_120055 ?auto_120054 ) ) ( not ( = ?auto_120055 ?auto_120052 ) ) ( not ( = ?auto_120055 ?auto_120051 ) ) ( not ( = ?auto_120050 ?auto_120056 ) ) ( not ( = ?auto_120050 ?auto_120053 ) ) ( not ( = ?auto_120050 ?auto_120055 ) ) ( ON ?auto_120050 ?auto_120057 ) ( not ( = ?auto_120050 ?auto_120057 ) ) ( not ( = ?auto_120051 ?auto_120057 ) ) ( not ( = ?auto_120052 ?auto_120057 ) ) ( not ( = ?auto_120054 ?auto_120057 ) ) ( not ( = ?auto_120056 ?auto_120057 ) ) ( not ( = ?auto_120053 ?auto_120057 ) ) ( not ( = ?auto_120055 ?auto_120057 ) ) ( CLEAR ?auto_120052 ) ( ON ?auto_120051 ?auto_120050 ) ( CLEAR ?auto_120051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120057 ?auto_120050 )
      ( MAKE-3PILE ?auto_120050 ?auto_120051 ?auto_120052 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120058 - BLOCK
      ?auto_120059 - BLOCK
      ?auto_120060 - BLOCK
    )
    :vars
    (
      ?auto_120063 - BLOCK
      ?auto_120064 - BLOCK
      ?auto_120062 - BLOCK
      ?auto_120065 - BLOCK
      ?auto_120061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120058 ?auto_120059 ) ) ( not ( = ?auto_120058 ?auto_120060 ) ) ( not ( = ?auto_120059 ?auto_120060 ) ) ( not ( = ?auto_120058 ?auto_120063 ) ) ( not ( = ?auto_120059 ?auto_120063 ) ) ( not ( = ?auto_120060 ?auto_120063 ) ) ( ON-TABLE ?auto_120064 ) ( ON ?auto_120062 ?auto_120064 ) ( ON ?auto_120065 ?auto_120062 ) ( ON ?auto_120063 ?auto_120065 ) ( not ( = ?auto_120064 ?auto_120062 ) ) ( not ( = ?auto_120064 ?auto_120065 ) ) ( not ( = ?auto_120064 ?auto_120063 ) ) ( not ( = ?auto_120064 ?auto_120060 ) ) ( not ( = ?auto_120064 ?auto_120059 ) ) ( not ( = ?auto_120062 ?auto_120065 ) ) ( not ( = ?auto_120062 ?auto_120063 ) ) ( not ( = ?auto_120062 ?auto_120060 ) ) ( not ( = ?auto_120062 ?auto_120059 ) ) ( not ( = ?auto_120065 ?auto_120063 ) ) ( not ( = ?auto_120065 ?auto_120060 ) ) ( not ( = ?auto_120065 ?auto_120059 ) ) ( not ( = ?auto_120058 ?auto_120064 ) ) ( not ( = ?auto_120058 ?auto_120062 ) ) ( not ( = ?auto_120058 ?auto_120065 ) ) ( ON ?auto_120058 ?auto_120061 ) ( not ( = ?auto_120058 ?auto_120061 ) ) ( not ( = ?auto_120059 ?auto_120061 ) ) ( not ( = ?auto_120060 ?auto_120061 ) ) ( not ( = ?auto_120063 ?auto_120061 ) ) ( not ( = ?auto_120064 ?auto_120061 ) ) ( not ( = ?auto_120062 ?auto_120061 ) ) ( not ( = ?auto_120065 ?auto_120061 ) ) ( ON ?auto_120059 ?auto_120058 ) ( CLEAR ?auto_120059 ) ( ON-TABLE ?auto_120061 ) ( HOLDING ?auto_120060 ) ( CLEAR ?auto_120063 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120064 ?auto_120062 ?auto_120065 ?auto_120063 ?auto_120060 )
      ( MAKE-3PILE ?auto_120058 ?auto_120059 ?auto_120060 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120066 - BLOCK
      ?auto_120067 - BLOCK
      ?auto_120068 - BLOCK
    )
    :vars
    (
      ?auto_120073 - BLOCK
      ?auto_120069 - BLOCK
      ?auto_120070 - BLOCK
      ?auto_120072 - BLOCK
      ?auto_120071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120066 ?auto_120067 ) ) ( not ( = ?auto_120066 ?auto_120068 ) ) ( not ( = ?auto_120067 ?auto_120068 ) ) ( not ( = ?auto_120066 ?auto_120073 ) ) ( not ( = ?auto_120067 ?auto_120073 ) ) ( not ( = ?auto_120068 ?auto_120073 ) ) ( ON-TABLE ?auto_120069 ) ( ON ?auto_120070 ?auto_120069 ) ( ON ?auto_120072 ?auto_120070 ) ( ON ?auto_120073 ?auto_120072 ) ( not ( = ?auto_120069 ?auto_120070 ) ) ( not ( = ?auto_120069 ?auto_120072 ) ) ( not ( = ?auto_120069 ?auto_120073 ) ) ( not ( = ?auto_120069 ?auto_120068 ) ) ( not ( = ?auto_120069 ?auto_120067 ) ) ( not ( = ?auto_120070 ?auto_120072 ) ) ( not ( = ?auto_120070 ?auto_120073 ) ) ( not ( = ?auto_120070 ?auto_120068 ) ) ( not ( = ?auto_120070 ?auto_120067 ) ) ( not ( = ?auto_120072 ?auto_120073 ) ) ( not ( = ?auto_120072 ?auto_120068 ) ) ( not ( = ?auto_120072 ?auto_120067 ) ) ( not ( = ?auto_120066 ?auto_120069 ) ) ( not ( = ?auto_120066 ?auto_120070 ) ) ( not ( = ?auto_120066 ?auto_120072 ) ) ( ON ?auto_120066 ?auto_120071 ) ( not ( = ?auto_120066 ?auto_120071 ) ) ( not ( = ?auto_120067 ?auto_120071 ) ) ( not ( = ?auto_120068 ?auto_120071 ) ) ( not ( = ?auto_120073 ?auto_120071 ) ) ( not ( = ?auto_120069 ?auto_120071 ) ) ( not ( = ?auto_120070 ?auto_120071 ) ) ( not ( = ?auto_120072 ?auto_120071 ) ) ( ON ?auto_120067 ?auto_120066 ) ( ON-TABLE ?auto_120071 ) ( CLEAR ?auto_120073 ) ( ON ?auto_120068 ?auto_120067 ) ( CLEAR ?auto_120068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120071 ?auto_120066 ?auto_120067 )
      ( MAKE-3PILE ?auto_120066 ?auto_120067 ?auto_120068 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120074 - BLOCK
      ?auto_120075 - BLOCK
      ?auto_120076 - BLOCK
    )
    :vars
    (
      ?auto_120077 - BLOCK
      ?auto_120081 - BLOCK
      ?auto_120078 - BLOCK
      ?auto_120079 - BLOCK
      ?auto_120080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120074 ?auto_120075 ) ) ( not ( = ?auto_120074 ?auto_120076 ) ) ( not ( = ?auto_120075 ?auto_120076 ) ) ( not ( = ?auto_120074 ?auto_120077 ) ) ( not ( = ?auto_120075 ?auto_120077 ) ) ( not ( = ?auto_120076 ?auto_120077 ) ) ( ON-TABLE ?auto_120081 ) ( ON ?auto_120078 ?auto_120081 ) ( ON ?auto_120079 ?auto_120078 ) ( not ( = ?auto_120081 ?auto_120078 ) ) ( not ( = ?auto_120081 ?auto_120079 ) ) ( not ( = ?auto_120081 ?auto_120077 ) ) ( not ( = ?auto_120081 ?auto_120076 ) ) ( not ( = ?auto_120081 ?auto_120075 ) ) ( not ( = ?auto_120078 ?auto_120079 ) ) ( not ( = ?auto_120078 ?auto_120077 ) ) ( not ( = ?auto_120078 ?auto_120076 ) ) ( not ( = ?auto_120078 ?auto_120075 ) ) ( not ( = ?auto_120079 ?auto_120077 ) ) ( not ( = ?auto_120079 ?auto_120076 ) ) ( not ( = ?auto_120079 ?auto_120075 ) ) ( not ( = ?auto_120074 ?auto_120081 ) ) ( not ( = ?auto_120074 ?auto_120078 ) ) ( not ( = ?auto_120074 ?auto_120079 ) ) ( ON ?auto_120074 ?auto_120080 ) ( not ( = ?auto_120074 ?auto_120080 ) ) ( not ( = ?auto_120075 ?auto_120080 ) ) ( not ( = ?auto_120076 ?auto_120080 ) ) ( not ( = ?auto_120077 ?auto_120080 ) ) ( not ( = ?auto_120081 ?auto_120080 ) ) ( not ( = ?auto_120078 ?auto_120080 ) ) ( not ( = ?auto_120079 ?auto_120080 ) ) ( ON ?auto_120075 ?auto_120074 ) ( ON-TABLE ?auto_120080 ) ( ON ?auto_120076 ?auto_120075 ) ( CLEAR ?auto_120076 ) ( HOLDING ?auto_120077 ) ( CLEAR ?auto_120079 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120081 ?auto_120078 ?auto_120079 ?auto_120077 )
      ( MAKE-3PILE ?auto_120074 ?auto_120075 ?auto_120076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120082 - BLOCK
      ?auto_120083 - BLOCK
      ?auto_120084 - BLOCK
    )
    :vars
    (
      ?auto_120085 - BLOCK
      ?auto_120088 - BLOCK
      ?auto_120087 - BLOCK
      ?auto_120086 - BLOCK
      ?auto_120089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120082 ?auto_120083 ) ) ( not ( = ?auto_120082 ?auto_120084 ) ) ( not ( = ?auto_120083 ?auto_120084 ) ) ( not ( = ?auto_120082 ?auto_120085 ) ) ( not ( = ?auto_120083 ?auto_120085 ) ) ( not ( = ?auto_120084 ?auto_120085 ) ) ( ON-TABLE ?auto_120088 ) ( ON ?auto_120087 ?auto_120088 ) ( ON ?auto_120086 ?auto_120087 ) ( not ( = ?auto_120088 ?auto_120087 ) ) ( not ( = ?auto_120088 ?auto_120086 ) ) ( not ( = ?auto_120088 ?auto_120085 ) ) ( not ( = ?auto_120088 ?auto_120084 ) ) ( not ( = ?auto_120088 ?auto_120083 ) ) ( not ( = ?auto_120087 ?auto_120086 ) ) ( not ( = ?auto_120087 ?auto_120085 ) ) ( not ( = ?auto_120087 ?auto_120084 ) ) ( not ( = ?auto_120087 ?auto_120083 ) ) ( not ( = ?auto_120086 ?auto_120085 ) ) ( not ( = ?auto_120086 ?auto_120084 ) ) ( not ( = ?auto_120086 ?auto_120083 ) ) ( not ( = ?auto_120082 ?auto_120088 ) ) ( not ( = ?auto_120082 ?auto_120087 ) ) ( not ( = ?auto_120082 ?auto_120086 ) ) ( ON ?auto_120082 ?auto_120089 ) ( not ( = ?auto_120082 ?auto_120089 ) ) ( not ( = ?auto_120083 ?auto_120089 ) ) ( not ( = ?auto_120084 ?auto_120089 ) ) ( not ( = ?auto_120085 ?auto_120089 ) ) ( not ( = ?auto_120088 ?auto_120089 ) ) ( not ( = ?auto_120087 ?auto_120089 ) ) ( not ( = ?auto_120086 ?auto_120089 ) ) ( ON ?auto_120083 ?auto_120082 ) ( ON-TABLE ?auto_120089 ) ( ON ?auto_120084 ?auto_120083 ) ( CLEAR ?auto_120086 ) ( ON ?auto_120085 ?auto_120084 ) ( CLEAR ?auto_120085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120089 ?auto_120082 ?auto_120083 ?auto_120084 )
      ( MAKE-3PILE ?auto_120082 ?auto_120083 ?auto_120084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120090 - BLOCK
      ?auto_120091 - BLOCK
      ?auto_120092 - BLOCK
    )
    :vars
    (
      ?auto_120095 - BLOCK
      ?auto_120097 - BLOCK
      ?auto_120096 - BLOCK
      ?auto_120093 - BLOCK
      ?auto_120094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120090 ?auto_120091 ) ) ( not ( = ?auto_120090 ?auto_120092 ) ) ( not ( = ?auto_120091 ?auto_120092 ) ) ( not ( = ?auto_120090 ?auto_120095 ) ) ( not ( = ?auto_120091 ?auto_120095 ) ) ( not ( = ?auto_120092 ?auto_120095 ) ) ( ON-TABLE ?auto_120097 ) ( ON ?auto_120096 ?auto_120097 ) ( not ( = ?auto_120097 ?auto_120096 ) ) ( not ( = ?auto_120097 ?auto_120093 ) ) ( not ( = ?auto_120097 ?auto_120095 ) ) ( not ( = ?auto_120097 ?auto_120092 ) ) ( not ( = ?auto_120097 ?auto_120091 ) ) ( not ( = ?auto_120096 ?auto_120093 ) ) ( not ( = ?auto_120096 ?auto_120095 ) ) ( not ( = ?auto_120096 ?auto_120092 ) ) ( not ( = ?auto_120096 ?auto_120091 ) ) ( not ( = ?auto_120093 ?auto_120095 ) ) ( not ( = ?auto_120093 ?auto_120092 ) ) ( not ( = ?auto_120093 ?auto_120091 ) ) ( not ( = ?auto_120090 ?auto_120097 ) ) ( not ( = ?auto_120090 ?auto_120096 ) ) ( not ( = ?auto_120090 ?auto_120093 ) ) ( ON ?auto_120090 ?auto_120094 ) ( not ( = ?auto_120090 ?auto_120094 ) ) ( not ( = ?auto_120091 ?auto_120094 ) ) ( not ( = ?auto_120092 ?auto_120094 ) ) ( not ( = ?auto_120095 ?auto_120094 ) ) ( not ( = ?auto_120097 ?auto_120094 ) ) ( not ( = ?auto_120096 ?auto_120094 ) ) ( not ( = ?auto_120093 ?auto_120094 ) ) ( ON ?auto_120091 ?auto_120090 ) ( ON-TABLE ?auto_120094 ) ( ON ?auto_120092 ?auto_120091 ) ( ON ?auto_120095 ?auto_120092 ) ( CLEAR ?auto_120095 ) ( HOLDING ?auto_120093 ) ( CLEAR ?auto_120096 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120097 ?auto_120096 ?auto_120093 )
      ( MAKE-3PILE ?auto_120090 ?auto_120091 ?auto_120092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120098 - BLOCK
      ?auto_120099 - BLOCK
      ?auto_120100 - BLOCK
    )
    :vars
    (
      ?auto_120105 - BLOCK
      ?auto_120103 - BLOCK
      ?auto_120104 - BLOCK
      ?auto_120101 - BLOCK
      ?auto_120102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120098 ?auto_120099 ) ) ( not ( = ?auto_120098 ?auto_120100 ) ) ( not ( = ?auto_120099 ?auto_120100 ) ) ( not ( = ?auto_120098 ?auto_120105 ) ) ( not ( = ?auto_120099 ?auto_120105 ) ) ( not ( = ?auto_120100 ?auto_120105 ) ) ( ON-TABLE ?auto_120103 ) ( ON ?auto_120104 ?auto_120103 ) ( not ( = ?auto_120103 ?auto_120104 ) ) ( not ( = ?auto_120103 ?auto_120101 ) ) ( not ( = ?auto_120103 ?auto_120105 ) ) ( not ( = ?auto_120103 ?auto_120100 ) ) ( not ( = ?auto_120103 ?auto_120099 ) ) ( not ( = ?auto_120104 ?auto_120101 ) ) ( not ( = ?auto_120104 ?auto_120105 ) ) ( not ( = ?auto_120104 ?auto_120100 ) ) ( not ( = ?auto_120104 ?auto_120099 ) ) ( not ( = ?auto_120101 ?auto_120105 ) ) ( not ( = ?auto_120101 ?auto_120100 ) ) ( not ( = ?auto_120101 ?auto_120099 ) ) ( not ( = ?auto_120098 ?auto_120103 ) ) ( not ( = ?auto_120098 ?auto_120104 ) ) ( not ( = ?auto_120098 ?auto_120101 ) ) ( ON ?auto_120098 ?auto_120102 ) ( not ( = ?auto_120098 ?auto_120102 ) ) ( not ( = ?auto_120099 ?auto_120102 ) ) ( not ( = ?auto_120100 ?auto_120102 ) ) ( not ( = ?auto_120105 ?auto_120102 ) ) ( not ( = ?auto_120103 ?auto_120102 ) ) ( not ( = ?auto_120104 ?auto_120102 ) ) ( not ( = ?auto_120101 ?auto_120102 ) ) ( ON ?auto_120099 ?auto_120098 ) ( ON-TABLE ?auto_120102 ) ( ON ?auto_120100 ?auto_120099 ) ( ON ?auto_120105 ?auto_120100 ) ( CLEAR ?auto_120104 ) ( ON ?auto_120101 ?auto_120105 ) ( CLEAR ?auto_120101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120102 ?auto_120098 ?auto_120099 ?auto_120100 ?auto_120105 )
      ( MAKE-3PILE ?auto_120098 ?auto_120099 ?auto_120100 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120106 - BLOCK
      ?auto_120107 - BLOCK
      ?auto_120108 - BLOCK
    )
    :vars
    (
      ?auto_120110 - BLOCK
      ?auto_120111 - BLOCK
      ?auto_120109 - BLOCK
      ?auto_120112 - BLOCK
      ?auto_120113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120106 ?auto_120107 ) ) ( not ( = ?auto_120106 ?auto_120108 ) ) ( not ( = ?auto_120107 ?auto_120108 ) ) ( not ( = ?auto_120106 ?auto_120110 ) ) ( not ( = ?auto_120107 ?auto_120110 ) ) ( not ( = ?auto_120108 ?auto_120110 ) ) ( ON-TABLE ?auto_120111 ) ( not ( = ?auto_120111 ?auto_120109 ) ) ( not ( = ?auto_120111 ?auto_120112 ) ) ( not ( = ?auto_120111 ?auto_120110 ) ) ( not ( = ?auto_120111 ?auto_120108 ) ) ( not ( = ?auto_120111 ?auto_120107 ) ) ( not ( = ?auto_120109 ?auto_120112 ) ) ( not ( = ?auto_120109 ?auto_120110 ) ) ( not ( = ?auto_120109 ?auto_120108 ) ) ( not ( = ?auto_120109 ?auto_120107 ) ) ( not ( = ?auto_120112 ?auto_120110 ) ) ( not ( = ?auto_120112 ?auto_120108 ) ) ( not ( = ?auto_120112 ?auto_120107 ) ) ( not ( = ?auto_120106 ?auto_120111 ) ) ( not ( = ?auto_120106 ?auto_120109 ) ) ( not ( = ?auto_120106 ?auto_120112 ) ) ( ON ?auto_120106 ?auto_120113 ) ( not ( = ?auto_120106 ?auto_120113 ) ) ( not ( = ?auto_120107 ?auto_120113 ) ) ( not ( = ?auto_120108 ?auto_120113 ) ) ( not ( = ?auto_120110 ?auto_120113 ) ) ( not ( = ?auto_120111 ?auto_120113 ) ) ( not ( = ?auto_120109 ?auto_120113 ) ) ( not ( = ?auto_120112 ?auto_120113 ) ) ( ON ?auto_120107 ?auto_120106 ) ( ON-TABLE ?auto_120113 ) ( ON ?auto_120108 ?auto_120107 ) ( ON ?auto_120110 ?auto_120108 ) ( ON ?auto_120112 ?auto_120110 ) ( CLEAR ?auto_120112 ) ( HOLDING ?auto_120109 ) ( CLEAR ?auto_120111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120111 ?auto_120109 )
      ( MAKE-3PILE ?auto_120106 ?auto_120107 ?auto_120108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120114 - BLOCK
      ?auto_120115 - BLOCK
      ?auto_120116 - BLOCK
    )
    :vars
    (
      ?auto_120121 - BLOCK
      ?auto_120117 - BLOCK
      ?auto_120120 - BLOCK
      ?auto_120119 - BLOCK
      ?auto_120118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120114 ?auto_120115 ) ) ( not ( = ?auto_120114 ?auto_120116 ) ) ( not ( = ?auto_120115 ?auto_120116 ) ) ( not ( = ?auto_120114 ?auto_120121 ) ) ( not ( = ?auto_120115 ?auto_120121 ) ) ( not ( = ?auto_120116 ?auto_120121 ) ) ( ON-TABLE ?auto_120117 ) ( not ( = ?auto_120117 ?auto_120120 ) ) ( not ( = ?auto_120117 ?auto_120119 ) ) ( not ( = ?auto_120117 ?auto_120121 ) ) ( not ( = ?auto_120117 ?auto_120116 ) ) ( not ( = ?auto_120117 ?auto_120115 ) ) ( not ( = ?auto_120120 ?auto_120119 ) ) ( not ( = ?auto_120120 ?auto_120121 ) ) ( not ( = ?auto_120120 ?auto_120116 ) ) ( not ( = ?auto_120120 ?auto_120115 ) ) ( not ( = ?auto_120119 ?auto_120121 ) ) ( not ( = ?auto_120119 ?auto_120116 ) ) ( not ( = ?auto_120119 ?auto_120115 ) ) ( not ( = ?auto_120114 ?auto_120117 ) ) ( not ( = ?auto_120114 ?auto_120120 ) ) ( not ( = ?auto_120114 ?auto_120119 ) ) ( ON ?auto_120114 ?auto_120118 ) ( not ( = ?auto_120114 ?auto_120118 ) ) ( not ( = ?auto_120115 ?auto_120118 ) ) ( not ( = ?auto_120116 ?auto_120118 ) ) ( not ( = ?auto_120121 ?auto_120118 ) ) ( not ( = ?auto_120117 ?auto_120118 ) ) ( not ( = ?auto_120120 ?auto_120118 ) ) ( not ( = ?auto_120119 ?auto_120118 ) ) ( ON ?auto_120115 ?auto_120114 ) ( ON-TABLE ?auto_120118 ) ( ON ?auto_120116 ?auto_120115 ) ( ON ?auto_120121 ?auto_120116 ) ( ON ?auto_120119 ?auto_120121 ) ( CLEAR ?auto_120117 ) ( ON ?auto_120120 ?auto_120119 ) ( CLEAR ?auto_120120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120118 ?auto_120114 ?auto_120115 ?auto_120116 ?auto_120121 ?auto_120119 )
      ( MAKE-3PILE ?auto_120114 ?auto_120115 ?auto_120116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120122 - BLOCK
      ?auto_120123 - BLOCK
      ?auto_120124 - BLOCK
    )
    :vars
    (
      ?auto_120128 - BLOCK
      ?auto_120125 - BLOCK
      ?auto_120127 - BLOCK
      ?auto_120129 - BLOCK
      ?auto_120126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120122 ?auto_120123 ) ) ( not ( = ?auto_120122 ?auto_120124 ) ) ( not ( = ?auto_120123 ?auto_120124 ) ) ( not ( = ?auto_120122 ?auto_120128 ) ) ( not ( = ?auto_120123 ?auto_120128 ) ) ( not ( = ?auto_120124 ?auto_120128 ) ) ( not ( = ?auto_120125 ?auto_120127 ) ) ( not ( = ?auto_120125 ?auto_120129 ) ) ( not ( = ?auto_120125 ?auto_120128 ) ) ( not ( = ?auto_120125 ?auto_120124 ) ) ( not ( = ?auto_120125 ?auto_120123 ) ) ( not ( = ?auto_120127 ?auto_120129 ) ) ( not ( = ?auto_120127 ?auto_120128 ) ) ( not ( = ?auto_120127 ?auto_120124 ) ) ( not ( = ?auto_120127 ?auto_120123 ) ) ( not ( = ?auto_120129 ?auto_120128 ) ) ( not ( = ?auto_120129 ?auto_120124 ) ) ( not ( = ?auto_120129 ?auto_120123 ) ) ( not ( = ?auto_120122 ?auto_120125 ) ) ( not ( = ?auto_120122 ?auto_120127 ) ) ( not ( = ?auto_120122 ?auto_120129 ) ) ( ON ?auto_120122 ?auto_120126 ) ( not ( = ?auto_120122 ?auto_120126 ) ) ( not ( = ?auto_120123 ?auto_120126 ) ) ( not ( = ?auto_120124 ?auto_120126 ) ) ( not ( = ?auto_120128 ?auto_120126 ) ) ( not ( = ?auto_120125 ?auto_120126 ) ) ( not ( = ?auto_120127 ?auto_120126 ) ) ( not ( = ?auto_120129 ?auto_120126 ) ) ( ON ?auto_120123 ?auto_120122 ) ( ON-TABLE ?auto_120126 ) ( ON ?auto_120124 ?auto_120123 ) ( ON ?auto_120128 ?auto_120124 ) ( ON ?auto_120129 ?auto_120128 ) ( ON ?auto_120127 ?auto_120129 ) ( CLEAR ?auto_120127 ) ( HOLDING ?auto_120125 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120125 )
      ( MAKE-3PILE ?auto_120122 ?auto_120123 ?auto_120124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120130 - BLOCK
      ?auto_120131 - BLOCK
      ?auto_120132 - BLOCK
    )
    :vars
    (
      ?auto_120136 - BLOCK
      ?auto_120134 - BLOCK
      ?auto_120133 - BLOCK
      ?auto_120135 - BLOCK
      ?auto_120137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120130 ?auto_120131 ) ) ( not ( = ?auto_120130 ?auto_120132 ) ) ( not ( = ?auto_120131 ?auto_120132 ) ) ( not ( = ?auto_120130 ?auto_120136 ) ) ( not ( = ?auto_120131 ?auto_120136 ) ) ( not ( = ?auto_120132 ?auto_120136 ) ) ( not ( = ?auto_120134 ?auto_120133 ) ) ( not ( = ?auto_120134 ?auto_120135 ) ) ( not ( = ?auto_120134 ?auto_120136 ) ) ( not ( = ?auto_120134 ?auto_120132 ) ) ( not ( = ?auto_120134 ?auto_120131 ) ) ( not ( = ?auto_120133 ?auto_120135 ) ) ( not ( = ?auto_120133 ?auto_120136 ) ) ( not ( = ?auto_120133 ?auto_120132 ) ) ( not ( = ?auto_120133 ?auto_120131 ) ) ( not ( = ?auto_120135 ?auto_120136 ) ) ( not ( = ?auto_120135 ?auto_120132 ) ) ( not ( = ?auto_120135 ?auto_120131 ) ) ( not ( = ?auto_120130 ?auto_120134 ) ) ( not ( = ?auto_120130 ?auto_120133 ) ) ( not ( = ?auto_120130 ?auto_120135 ) ) ( ON ?auto_120130 ?auto_120137 ) ( not ( = ?auto_120130 ?auto_120137 ) ) ( not ( = ?auto_120131 ?auto_120137 ) ) ( not ( = ?auto_120132 ?auto_120137 ) ) ( not ( = ?auto_120136 ?auto_120137 ) ) ( not ( = ?auto_120134 ?auto_120137 ) ) ( not ( = ?auto_120133 ?auto_120137 ) ) ( not ( = ?auto_120135 ?auto_120137 ) ) ( ON ?auto_120131 ?auto_120130 ) ( ON-TABLE ?auto_120137 ) ( ON ?auto_120132 ?auto_120131 ) ( ON ?auto_120136 ?auto_120132 ) ( ON ?auto_120135 ?auto_120136 ) ( ON ?auto_120133 ?auto_120135 ) ( ON ?auto_120134 ?auto_120133 ) ( CLEAR ?auto_120134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120137 ?auto_120130 ?auto_120131 ?auto_120132 ?auto_120136 ?auto_120135 ?auto_120133 )
      ( MAKE-3PILE ?auto_120130 ?auto_120131 ?auto_120132 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120141 - BLOCK
      ?auto_120142 - BLOCK
      ?auto_120143 - BLOCK
    )
    :vars
    (
      ?auto_120144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120144 ?auto_120143 ) ( CLEAR ?auto_120144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120141 ) ( ON ?auto_120142 ?auto_120141 ) ( ON ?auto_120143 ?auto_120142 ) ( not ( = ?auto_120141 ?auto_120142 ) ) ( not ( = ?auto_120141 ?auto_120143 ) ) ( not ( = ?auto_120141 ?auto_120144 ) ) ( not ( = ?auto_120142 ?auto_120143 ) ) ( not ( = ?auto_120142 ?auto_120144 ) ) ( not ( = ?auto_120143 ?auto_120144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120144 ?auto_120143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120145 - BLOCK
      ?auto_120146 - BLOCK
      ?auto_120147 - BLOCK
    )
    :vars
    (
      ?auto_120148 - BLOCK
      ?auto_120149 - BLOCK
      ?auto_120150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120148 ?auto_120147 ) ( CLEAR ?auto_120148 ) ( ON-TABLE ?auto_120145 ) ( ON ?auto_120146 ?auto_120145 ) ( ON ?auto_120147 ?auto_120146 ) ( not ( = ?auto_120145 ?auto_120146 ) ) ( not ( = ?auto_120145 ?auto_120147 ) ) ( not ( = ?auto_120145 ?auto_120148 ) ) ( not ( = ?auto_120146 ?auto_120147 ) ) ( not ( = ?auto_120146 ?auto_120148 ) ) ( not ( = ?auto_120147 ?auto_120148 ) ) ( HOLDING ?auto_120149 ) ( CLEAR ?auto_120150 ) ( not ( = ?auto_120145 ?auto_120149 ) ) ( not ( = ?auto_120145 ?auto_120150 ) ) ( not ( = ?auto_120146 ?auto_120149 ) ) ( not ( = ?auto_120146 ?auto_120150 ) ) ( not ( = ?auto_120147 ?auto_120149 ) ) ( not ( = ?auto_120147 ?auto_120150 ) ) ( not ( = ?auto_120148 ?auto_120149 ) ) ( not ( = ?auto_120148 ?auto_120150 ) ) ( not ( = ?auto_120149 ?auto_120150 ) ) )
    :subtasks
    ( ( !STACK ?auto_120149 ?auto_120150 )
      ( MAKE-3PILE ?auto_120145 ?auto_120146 ?auto_120147 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120151 - BLOCK
      ?auto_120152 - BLOCK
      ?auto_120153 - BLOCK
    )
    :vars
    (
      ?auto_120155 - BLOCK
      ?auto_120154 - BLOCK
      ?auto_120156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120155 ?auto_120153 ) ( ON-TABLE ?auto_120151 ) ( ON ?auto_120152 ?auto_120151 ) ( ON ?auto_120153 ?auto_120152 ) ( not ( = ?auto_120151 ?auto_120152 ) ) ( not ( = ?auto_120151 ?auto_120153 ) ) ( not ( = ?auto_120151 ?auto_120155 ) ) ( not ( = ?auto_120152 ?auto_120153 ) ) ( not ( = ?auto_120152 ?auto_120155 ) ) ( not ( = ?auto_120153 ?auto_120155 ) ) ( CLEAR ?auto_120154 ) ( not ( = ?auto_120151 ?auto_120156 ) ) ( not ( = ?auto_120151 ?auto_120154 ) ) ( not ( = ?auto_120152 ?auto_120156 ) ) ( not ( = ?auto_120152 ?auto_120154 ) ) ( not ( = ?auto_120153 ?auto_120156 ) ) ( not ( = ?auto_120153 ?auto_120154 ) ) ( not ( = ?auto_120155 ?auto_120156 ) ) ( not ( = ?auto_120155 ?auto_120154 ) ) ( not ( = ?auto_120156 ?auto_120154 ) ) ( ON ?auto_120156 ?auto_120155 ) ( CLEAR ?auto_120156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120151 ?auto_120152 ?auto_120153 ?auto_120155 )
      ( MAKE-3PILE ?auto_120151 ?auto_120152 ?auto_120153 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120157 - BLOCK
      ?auto_120158 - BLOCK
      ?auto_120159 - BLOCK
    )
    :vars
    (
      ?auto_120161 - BLOCK
      ?auto_120162 - BLOCK
      ?auto_120160 - BLOCK
      ?auto_120163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120161 ?auto_120159 ) ( ON-TABLE ?auto_120157 ) ( ON ?auto_120158 ?auto_120157 ) ( ON ?auto_120159 ?auto_120158 ) ( not ( = ?auto_120157 ?auto_120158 ) ) ( not ( = ?auto_120157 ?auto_120159 ) ) ( not ( = ?auto_120157 ?auto_120161 ) ) ( not ( = ?auto_120158 ?auto_120159 ) ) ( not ( = ?auto_120158 ?auto_120161 ) ) ( not ( = ?auto_120159 ?auto_120161 ) ) ( not ( = ?auto_120157 ?auto_120162 ) ) ( not ( = ?auto_120157 ?auto_120160 ) ) ( not ( = ?auto_120158 ?auto_120162 ) ) ( not ( = ?auto_120158 ?auto_120160 ) ) ( not ( = ?auto_120159 ?auto_120162 ) ) ( not ( = ?auto_120159 ?auto_120160 ) ) ( not ( = ?auto_120161 ?auto_120162 ) ) ( not ( = ?auto_120161 ?auto_120160 ) ) ( not ( = ?auto_120162 ?auto_120160 ) ) ( ON ?auto_120162 ?auto_120161 ) ( CLEAR ?auto_120162 ) ( HOLDING ?auto_120160 ) ( CLEAR ?auto_120163 ) ( ON-TABLE ?auto_120163 ) ( not ( = ?auto_120163 ?auto_120160 ) ) ( not ( = ?auto_120157 ?auto_120163 ) ) ( not ( = ?auto_120158 ?auto_120163 ) ) ( not ( = ?auto_120159 ?auto_120163 ) ) ( not ( = ?auto_120161 ?auto_120163 ) ) ( not ( = ?auto_120162 ?auto_120163 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120163 ?auto_120160 )
      ( MAKE-3PILE ?auto_120157 ?auto_120158 ?auto_120159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120164 - BLOCK
      ?auto_120165 - BLOCK
      ?auto_120166 - BLOCK
    )
    :vars
    (
      ?auto_120168 - BLOCK
      ?auto_120169 - BLOCK
      ?auto_120167 - BLOCK
      ?auto_120170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120168 ?auto_120166 ) ( ON-TABLE ?auto_120164 ) ( ON ?auto_120165 ?auto_120164 ) ( ON ?auto_120166 ?auto_120165 ) ( not ( = ?auto_120164 ?auto_120165 ) ) ( not ( = ?auto_120164 ?auto_120166 ) ) ( not ( = ?auto_120164 ?auto_120168 ) ) ( not ( = ?auto_120165 ?auto_120166 ) ) ( not ( = ?auto_120165 ?auto_120168 ) ) ( not ( = ?auto_120166 ?auto_120168 ) ) ( not ( = ?auto_120164 ?auto_120169 ) ) ( not ( = ?auto_120164 ?auto_120167 ) ) ( not ( = ?auto_120165 ?auto_120169 ) ) ( not ( = ?auto_120165 ?auto_120167 ) ) ( not ( = ?auto_120166 ?auto_120169 ) ) ( not ( = ?auto_120166 ?auto_120167 ) ) ( not ( = ?auto_120168 ?auto_120169 ) ) ( not ( = ?auto_120168 ?auto_120167 ) ) ( not ( = ?auto_120169 ?auto_120167 ) ) ( ON ?auto_120169 ?auto_120168 ) ( CLEAR ?auto_120170 ) ( ON-TABLE ?auto_120170 ) ( not ( = ?auto_120170 ?auto_120167 ) ) ( not ( = ?auto_120164 ?auto_120170 ) ) ( not ( = ?auto_120165 ?auto_120170 ) ) ( not ( = ?auto_120166 ?auto_120170 ) ) ( not ( = ?auto_120168 ?auto_120170 ) ) ( not ( = ?auto_120169 ?auto_120170 ) ) ( ON ?auto_120167 ?auto_120169 ) ( CLEAR ?auto_120167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120164 ?auto_120165 ?auto_120166 ?auto_120168 ?auto_120169 )
      ( MAKE-3PILE ?auto_120164 ?auto_120165 ?auto_120166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120171 - BLOCK
      ?auto_120172 - BLOCK
      ?auto_120173 - BLOCK
    )
    :vars
    (
      ?auto_120176 - BLOCK
      ?auto_120174 - BLOCK
      ?auto_120175 - BLOCK
      ?auto_120177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120176 ?auto_120173 ) ( ON-TABLE ?auto_120171 ) ( ON ?auto_120172 ?auto_120171 ) ( ON ?auto_120173 ?auto_120172 ) ( not ( = ?auto_120171 ?auto_120172 ) ) ( not ( = ?auto_120171 ?auto_120173 ) ) ( not ( = ?auto_120171 ?auto_120176 ) ) ( not ( = ?auto_120172 ?auto_120173 ) ) ( not ( = ?auto_120172 ?auto_120176 ) ) ( not ( = ?auto_120173 ?auto_120176 ) ) ( not ( = ?auto_120171 ?auto_120174 ) ) ( not ( = ?auto_120171 ?auto_120175 ) ) ( not ( = ?auto_120172 ?auto_120174 ) ) ( not ( = ?auto_120172 ?auto_120175 ) ) ( not ( = ?auto_120173 ?auto_120174 ) ) ( not ( = ?auto_120173 ?auto_120175 ) ) ( not ( = ?auto_120176 ?auto_120174 ) ) ( not ( = ?auto_120176 ?auto_120175 ) ) ( not ( = ?auto_120174 ?auto_120175 ) ) ( ON ?auto_120174 ?auto_120176 ) ( not ( = ?auto_120177 ?auto_120175 ) ) ( not ( = ?auto_120171 ?auto_120177 ) ) ( not ( = ?auto_120172 ?auto_120177 ) ) ( not ( = ?auto_120173 ?auto_120177 ) ) ( not ( = ?auto_120176 ?auto_120177 ) ) ( not ( = ?auto_120174 ?auto_120177 ) ) ( ON ?auto_120175 ?auto_120174 ) ( CLEAR ?auto_120175 ) ( HOLDING ?auto_120177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120177 )
      ( MAKE-3PILE ?auto_120171 ?auto_120172 ?auto_120173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120178 - BLOCK
      ?auto_120179 - BLOCK
      ?auto_120180 - BLOCK
    )
    :vars
    (
      ?auto_120181 - BLOCK
      ?auto_120182 - BLOCK
      ?auto_120183 - BLOCK
      ?auto_120184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120181 ?auto_120180 ) ( ON-TABLE ?auto_120178 ) ( ON ?auto_120179 ?auto_120178 ) ( ON ?auto_120180 ?auto_120179 ) ( not ( = ?auto_120178 ?auto_120179 ) ) ( not ( = ?auto_120178 ?auto_120180 ) ) ( not ( = ?auto_120178 ?auto_120181 ) ) ( not ( = ?auto_120179 ?auto_120180 ) ) ( not ( = ?auto_120179 ?auto_120181 ) ) ( not ( = ?auto_120180 ?auto_120181 ) ) ( not ( = ?auto_120178 ?auto_120182 ) ) ( not ( = ?auto_120178 ?auto_120183 ) ) ( not ( = ?auto_120179 ?auto_120182 ) ) ( not ( = ?auto_120179 ?auto_120183 ) ) ( not ( = ?auto_120180 ?auto_120182 ) ) ( not ( = ?auto_120180 ?auto_120183 ) ) ( not ( = ?auto_120181 ?auto_120182 ) ) ( not ( = ?auto_120181 ?auto_120183 ) ) ( not ( = ?auto_120182 ?auto_120183 ) ) ( ON ?auto_120182 ?auto_120181 ) ( not ( = ?auto_120184 ?auto_120183 ) ) ( not ( = ?auto_120178 ?auto_120184 ) ) ( not ( = ?auto_120179 ?auto_120184 ) ) ( not ( = ?auto_120180 ?auto_120184 ) ) ( not ( = ?auto_120181 ?auto_120184 ) ) ( not ( = ?auto_120182 ?auto_120184 ) ) ( ON ?auto_120183 ?auto_120182 ) ( ON ?auto_120184 ?auto_120183 ) ( CLEAR ?auto_120184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120178 ?auto_120179 ?auto_120180 ?auto_120181 ?auto_120182 ?auto_120183 )
      ( MAKE-3PILE ?auto_120178 ?auto_120179 ?auto_120180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120185 - BLOCK
      ?auto_120186 - BLOCK
      ?auto_120187 - BLOCK
    )
    :vars
    (
      ?auto_120188 - BLOCK
      ?auto_120189 - BLOCK
      ?auto_120191 - BLOCK
      ?auto_120190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120188 ?auto_120187 ) ( ON-TABLE ?auto_120185 ) ( ON ?auto_120186 ?auto_120185 ) ( ON ?auto_120187 ?auto_120186 ) ( not ( = ?auto_120185 ?auto_120186 ) ) ( not ( = ?auto_120185 ?auto_120187 ) ) ( not ( = ?auto_120185 ?auto_120188 ) ) ( not ( = ?auto_120186 ?auto_120187 ) ) ( not ( = ?auto_120186 ?auto_120188 ) ) ( not ( = ?auto_120187 ?auto_120188 ) ) ( not ( = ?auto_120185 ?auto_120189 ) ) ( not ( = ?auto_120185 ?auto_120191 ) ) ( not ( = ?auto_120186 ?auto_120189 ) ) ( not ( = ?auto_120186 ?auto_120191 ) ) ( not ( = ?auto_120187 ?auto_120189 ) ) ( not ( = ?auto_120187 ?auto_120191 ) ) ( not ( = ?auto_120188 ?auto_120189 ) ) ( not ( = ?auto_120188 ?auto_120191 ) ) ( not ( = ?auto_120189 ?auto_120191 ) ) ( ON ?auto_120189 ?auto_120188 ) ( not ( = ?auto_120190 ?auto_120191 ) ) ( not ( = ?auto_120185 ?auto_120190 ) ) ( not ( = ?auto_120186 ?auto_120190 ) ) ( not ( = ?auto_120187 ?auto_120190 ) ) ( not ( = ?auto_120188 ?auto_120190 ) ) ( not ( = ?auto_120189 ?auto_120190 ) ) ( ON ?auto_120191 ?auto_120189 ) ( HOLDING ?auto_120190 ) ( CLEAR ?auto_120191 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120185 ?auto_120186 ?auto_120187 ?auto_120188 ?auto_120189 ?auto_120191 ?auto_120190 )
      ( MAKE-3PILE ?auto_120185 ?auto_120186 ?auto_120187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120192 - BLOCK
      ?auto_120193 - BLOCK
      ?auto_120194 - BLOCK
    )
    :vars
    (
      ?auto_120196 - BLOCK
      ?auto_120197 - BLOCK
      ?auto_120198 - BLOCK
      ?auto_120195 - BLOCK
      ?auto_120199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120196 ?auto_120194 ) ( ON-TABLE ?auto_120192 ) ( ON ?auto_120193 ?auto_120192 ) ( ON ?auto_120194 ?auto_120193 ) ( not ( = ?auto_120192 ?auto_120193 ) ) ( not ( = ?auto_120192 ?auto_120194 ) ) ( not ( = ?auto_120192 ?auto_120196 ) ) ( not ( = ?auto_120193 ?auto_120194 ) ) ( not ( = ?auto_120193 ?auto_120196 ) ) ( not ( = ?auto_120194 ?auto_120196 ) ) ( not ( = ?auto_120192 ?auto_120197 ) ) ( not ( = ?auto_120192 ?auto_120198 ) ) ( not ( = ?auto_120193 ?auto_120197 ) ) ( not ( = ?auto_120193 ?auto_120198 ) ) ( not ( = ?auto_120194 ?auto_120197 ) ) ( not ( = ?auto_120194 ?auto_120198 ) ) ( not ( = ?auto_120196 ?auto_120197 ) ) ( not ( = ?auto_120196 ?auto_120198 ) ) ( not ( = ?auto_120197 ?auto_120198 ) ) ( ON ?auto_120197 ?auto_120196 ) ( not ( = ?auto_120195 ?auto_120198 ) ) ( not ( = ?auto_120192 ?auto_120195 ) ) ( not ( = ?auto_120193 ?auto_120195 ) ) ( not ( = ?auto_120194 ?auto_120195 ) ) ( not ( = ?auto_120196 ?auto_120195 ) ) ( not ( = ?auto_120197 ?auto_120195 ) ) ( ON ?auto_120198 ?auto_120197 ) ( CLEAR ?auto_120198 ) ( ON ?auto_120195 ?auto_120199 ) ( CLEAR ?auto_120195 ) ( HAND-EMPTY ) ( not ( = ?auto_120192 ?auto_120199 ) ) ( not ( = ?auto_120193 ?auto_120199 ) ) ( not ( = ?auto_120194 ?auto_120199 ) ) ( not ( = ?auto_120196 ?auto_120199 ) ) ( not ( = ?auto_120197 ?auto_120199 ) ) ( not ( = ?auto_120198 ?auto_120199 ) ) ( not ( = ?auto_120195 ?auto_120199 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120195 ?auto_120199 )
      ( MAKE-3PILE ?auto_120192 ?auto_120193 ?auto_120194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120200 - BLOCK
      ?auto_120201 - BLOCK
      ?auto_120202 - BLOCK
    )
    :vars
    (
      ?auto_120203 - BLOCK
      ?auto_120205 - BLOCK
      ?auto_120206 - BLOCK
      ?auto_120204 - BLOCK
      ?auto_120207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120203 ?auto_120202 ) ( ON-TABLE ?auto_120200 ) ( ON ?auto_120201 ?auto_120200 ) ( ON ?auto_120202 ?auto_120201 ) ( not ( = ?auto_120200 ?auto_120201 ) ) ( not ( = ?auto_120200 ?auto_120202 ) ) ( not ( = ?auto_120200 ?auto_120203 ) ) ( not ( = ?auto_120201 ?auto_120202 ) ) ( not ( = ?auto_120201 ?auto_120203 ) ) ( not ( = ?auto_120202 ?auto_120203 ) ) ( not ( = ?auto_120200 ?auto_120205 ) ) ( not ( = ?auto_120200 ?auto_120206 ) ) ( not ( = ?auto_120201 ?auto_120205 ) ) ( not ( = ?auto_120201 ?auto_120206 ) ) ( not ( = ?auto_120202 ?auto_120205 ) ) ( not ( = ?auto_120202 ?auto_120206 ) ) ( not ( = ?auto_120203 ?auto_120205 ) ) ( not ( = ?auto_120203 ?auto_120206 ) ) ( not ( = ?auto_120205 ?auto_120206 ) ) ( ON ?auto_120205 ?auto_120203 ) ( not ( = ?auto_120204 ?auto_120206 ) ) ( not ( = ?auto_120200 ?auto_120204 ) ) ( not ( = ?auto_120201 ?auto_120204 ) ) ( not ( = ?auto_120202 ?auto_120204 ) ) ( not ( = ?auto_120203 ?auto_120204 ) ) ( not ( = ?auto_120205 ?auto_120204 ) ) ( ON ?auto_120204 ?auto_120207 ) ( CLEAR ?auto_120204 ) ( not ( = ?auto_120200 ?auto_120207 ) ) ( not ( = ?auto_120201 ?auto_120207 ) ) ( not ( = ?auto_120202 ?auto_120207 ) ) ( not ( = ?auto_120203 ?auto_120207 ) ) ( not ( = ?auto_120205 ?auto_120207 ) ) ( not ( = ?auto_120206 ?auto_120207 ) ) ( not ( = ?auto_120204 ?auto_120207 ) ) ( HOLDING ?auto_120206 ) ( CLEAR ?auto_120205 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120200 ?auto_120201 ?auto_120202 ?auto_120203 ?auto_120205 ?auto_120206 )
      ( MAKE-3PILE ?auto_120200 ?auto_120201 ?auto_120202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120208 - BLOCK
      ?auto_120209 - BLOCK
      ?auto_120210 - BLOCK
    )
    :vars
    (
      ?auto_120214 - BLOCK
      ?auto_120211 - BLOCK
      ?auto_120215 - BLOCK
      ?auto_120212 - BLOCK
      ?auto_120213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120214 ?auto_120210 ) ( ON-TABLE ?auto_120208 ) ( ON ?auto_120209 ?auto_120208 ) ( ON ?auto_120210 ?auto_120209 ) ( not ( = ?auto_120208 ?auto_120209 ) ) ( not ( = ?auto_120208 ?auto_120210 ) ) ( not ( = ?auto_120208 ?auto_120214 ) ) ( not ( = ?auto_120209 ?auto_120210 ) ) ( not ( = ?auto_120209 ?auto_120214 ) ) ( not ( = ?auto_120210 ?auto_120214 ) ) ( not ( = ?auto_120208 ?auto_120211 ) ) ( not ( = ?auto_120208 ?auto_120215 ) ) ( not ( = ?auto_120209 ?auto_120211 ) ) ( not ( = ?auto_120209 ?auto_120215 ) ) ( not ( = ?auto_120210 ?auto_120211 ) ) ( not ( = ?auto_120210 ?auto_120215 ) ) ( not ( = ?auto_120214 ?auto_120211 ) ) ( not ( = ?auto_120214 ?auto_120215 ) ) ( not ( = ?auto_120211 ?auto_120215 ) ) ( ON ?auto_120211 ?auto_120214 ) ( not ( = ?auto_120212 ?auto_120215 ) ) ( not ( = ?auto_120208 ?auto_120212 ) ) ( not ( = ?auto_120209 ?auto_120212 ) ) ( not ( = ?auto_120210 ?auto_120212 ) ) ( not ( = ?auto_120214 ?auto_120212 ) ) ( not ( = ?auto_120211 ?auto_120212 ) ) ( ON ?auto_120212 ?auto_120213 ) ( not ( = ?auto_120208 ?auto_120213 ) ) ( not ( = ?auto_120209 ?auto_120213 ) ) ( not ( = ?auto_120210 ?auto_120213 ) ) ( not ( = ?auto_120214 ?auto_120213 ) ) ( not ( = ?auto_120211 ?auto_120213 ) ) ( not ( = ?auto_120215 ?auto_120213 ) ) ( not ( = ?auto_120212 ?auto_120213 ) ) ( CLEAR ?auto_120211 ) ( ON ?auto_120215 ?auto_120212 ) ( CLEAR ?auto_120215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120213 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120213 ?auto_120212 )
      ( MAKE-3PILE ?auto_120208 ?auto_120209 ?auto_120210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120216 - BLOCK
      ?auto_120217 - BLOCK
      ?auto_120218 - BLOCK
    )
    :vars
    (
      ?auto_120219 - BLOCK
      ?auto_120223 - BLOCK
      ?auto_120221 - BLOCK
      ?auto_120222 - BLOCK
      ?auto_120220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120219 ?auto_120218 ) ( ON-TABLE ?auto_120216 ) ( ON ?auto_120217 ?auto_120216 ) ( ON ?auto_120218 ?auto_120217 ) ( not ( = ?auto_120216 ?auto_120217 ) ) ( not ( = ?auto_120216 ?auto_120218 ) ) ( not ( = ?auto_120216 ?auto_120219 ) ) ( not ( = ?auto_120217 ?auto_120218 ) ) ( not ( = ?auto_120217 ?auto_120219 ) ) ( not ( = ?auto_120218 ?auto_120219 ) ) ( not ( = ?auto_120216 ?auto_120223 ) ) ( not ( = ?auto_120216 ?auto_120221 ) ) ( not ( = ?auto_120217 ?auto_120223 ) ) ( not ( = ?auto_120217 ?auto_120221 ) ) ( not ( = ?auto_120218 ?auto_120223 ) ) ( not ( = ?auto_120218 ?auto_120221 ) ) ( not ( = ?auto_120219 ?auto_120223 ) ) ( not ( = ?auto_120219 ?auto_120221 ) ) ( not ( = ?auto_120223 ?auto_120221 ) ) ( not ( = ?auto_120222 ?auto_120221 ) ) ( not ( = ?auto_120216 ?auto_120222 ) ) ( not ( = ?auto_120217 ?auto_120222 ) ) ( not ( = ?auto_120218 ?auto_120222 ) ) ( not ( = ?auto_120219 ?auto_120222 ) ) ( not ( = ?auto_120223 ?auto_120222 ) ) ( ON ?auto_120222 ?auto_120220 ) ( not ( = ?auto_120216 ?auto_120220 ) ) ( not ( = ?auto_120217 ?auto_120220 ) ) ( not ( = ?auto_120218 ?auto_120220 ) ) ( not ( = ?auto_120219 ?auto_120220 ) ) ( not ( = ?auto_120223 ?auto_120220 ) ) ( not ( = ?auto_120221 ?auto_120220 ) ) ( not ( = ?auto_120222 ?auto_120220 ) ) ( ON ?auto_120221 ?auto_120222 ) ( CLEAR ?auto_120221 ) ( ON-TABLE ?auto_120220 ) ( HOLDING ?auto_120223 ) ( CLEAR ?auto_120219 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120216 ?auto_120217 ?auto_120218 ?auto_120219 ?auto_120223 )
      ( MAKE-3PILE ?auto_120216 ?auto_120217 ?auto_120218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120224 - BLOCK
      ?auto_120225 - BLOCK
      ?auto_120226 - BLOCK
    )
    :vars
    (
      ?auto_120231 - BLOCK
      ?auto_120228 - BLOCK
      ?auto_120229 - BLOCK
      ?auto_120227 - BLOCK
      ?auto_120230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120231 ?auto_120226 ) ( ON-TABLE ?auto_120224 ) ( ON ?auto_120225 ?auto_120224 ) ( ON ?auto_120226 ?auto_120225 ) ( not ( = ?auto_120224 ?auto_120225 ) ) ( not ( = ?auto_120224 ?auto_120226 ) ) ( not ( = ?auto_120224 ?auto_120231 ) ) ( not ( = ?auto_120225 ?auto_120226 ) ) ( not ( = ?auto_120225 ?auto_120231 ) ) ( not ( = ?auto_120226 ?auto_120231 ) ) ( not ( = ?auto_120224 ?auto_120228 ) ) ( not ( = ?auto_120224 ?auto_120229 ) ) ( not ( = ?auto_120225 ?auto_120228 ) ) ( not ( = ?auto_120225 ?auto_120229 ) ) ( not ( = ?auto_120226 ?auto_120228 ) ) ( not ( = ?auto_120226 ?auto_120229 ) ) ( not ( = ?auto_120231 ?auto_120228 ) ) ( not ( = ?auto_120231 ?auto_120229 ) ) ( not ( = ?auto_120228 ?auto_120229 ) ) ( not ( = ?auto_120227 ?auto_120229 ) ) ( not ( = ?auto_120224 ?auto_120227 ) ) ( not ( = ?auto_120225 ?auto_120227 ) ) ( not ( = ?auto_120226 ?auto_120227 ) ) ( not ( = ?auto_120231 ?auto_120227 ) ) ( not ( = ?auto_120228 ?auto_120227 ) ) ( ON ?auto_120227 ?auto_120230 ) ( not ( = ?auto_120224 ?auto_120230 ) ) ( not ( = ?auto_120225 ?auto_120230 ) ) ( not ( = ?auto_120226 ?auto_120230 ) ) ( not ( = ?auto_120231 ?auto_120230 ) ) ( not ( = ?auto_120228 ?auto_120230 ) ) ( not ( = ?auto_120229 ?auto_120230 ) ) ( not ( = ?auto_120227 ?auto_120230 ) ) ( ON ?auto_120229 ?auto_120227 ) ( ON-TABLE ?auto_120230 ) ( CLEAR ?auto_120231 ) ( ON ?auto_120228 ?auto_120229 ) ( CLEAR ?auto_120228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120230 ?auto_120227 ?auto_120229 )
      ( MAKE-3PILE ?auto_120224 ?auto_120225 ?auto_120226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120248 - BLOCK
      ?auto_120249 - BLOCK
      ?auto_120250 - BLOCK
    )
    :vars
    (
      ?auto_120251 - BLOCK
      ?auto_120252 - BLOCK
      ?auto_120254 - BLOCK
      ?auto_120253 - BLOCK
      ?auto_120255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120248 ) ( ON ?auto_120249 ?auto_120248 ) ( not ( = ?auto_120248 ?auto_120249 ) ) ( not ( = ?auto_120248 ?auto_120250 ) ) ( not ( = ?auto_120248 ?auto_120251 ) ) ( not ( = ?auto_120249 ?auto_120250 ) ) ( not ( = ?auto_120249 ?auto_120251 ) ) ( not ( = ?auto_120250 ?auto_120251 ) ) ( not ( = ?auto_120248 ?auto_120252 ) ) ( not ( = ?auto_120248 ?auto_120254 ) ) ( not ( = ?auto_120249 ?auto_120252 ) ) ( not ( = ?auto_120249 ?auto_120254 ) ) ( not ( = ?auto_120250 ?auto_120252 ) ) ( not ( = ?auto_120250 ?auto_120254 ) ) ( not ( = ?auto_120251 ?auto_120252 ) ) ( not ( = ?auto_120251 ?auto_120254 ) ) ( not ( = ?auto_120252 ?auto_120254 ) ) ( not ( = ?auto_120253 ?auto_120254 ) ) ( not ( = ?auto_120248 ?auto_120253 ) ) ( not ( = ?auto_120249 ?auto_120253 ) ) ( not ( = ?auto_120250 ?auto_120253 ) ) ( not ( = ?auto_120251 ?auto_120253 ) ) ( not ( = ?auto_120252 ?auto_120253 ) ) ( ON ?auto_120253 ?auto_120255 ) ( not ( = ?auto_120248 ?auto_120255 ) ) ( not ( = ?auto_120249 ?auto_120255 ) ) ( not ( = ?auto_120250 ?auto_120255 ) ) ( not ( = ?auto_120251 ?auto_120255 ) ) ( not ( = ?auto_120252 ?auto_120255 ) ) ( not ( = ?auto_120254 ?auto_120255 ) ) ( not ( = ?auto_120253 ?auto_120255 ) ) ( ON ?auto_120254 ?auto_120253 ) ( ON-TABLE ?auto_120255 ) ( ON ?auto_120252 ?auto_120254 ) ( ON ?auto_120251 ?auto_120252 ) ( CLEAR ?auto_120251 ) ( HOLDING ?auto_120250 ) ( CLEAR ?auto_120249 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120248 ?auto_120249 ?auto_120250 ?auto_120251 )
      ( MAKE-3PILE ?auto_120248 ?auto_120249 ?auto_120250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120256 - BLOCK
      ?auto_120257 - BLOCK
      ?auto_120258 - BLOCK
    )
    :vars
    (
      ?auto_120259 - BLOCK
      ?auto_120260 - BLOCK
      ?auto_120262 - BLOCK
      ?auto_120263 - BLOCK
      ?auto_120261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120256 ) ( ON ?auto_120257 ?auto_120256 ) ( not ( = ?auto_120256 ?auto_120257 ) ) ( not ( = ?auto_120256 ?auto_120258 ) ) ( not ( = ?auto_120256 ?auto_120259 ) ) ( not ( = ?auto_120257 ?auto_120258 ) ) ( not ( = ?auto_120257 ?auto_120259 ) ) ( not ( = ?auto_120258 ?auto_120259 ) ) ( not ( = ?auto_120256 ?auto_120260 ) ) ( not ( = ?auto_120256 ?auto_120262 ) ) ( not ( = ?auto_120257 ?auto_120260 ) ) ( not ( = ?auto_120257 ?auto_120262 ) ) ( not ( = ?auto_120258 ?auto_120260 ) ) ( not ( = ?auto_120258 ?auto_120262 ) ) ( not ( = ?auto_120259 ?auto_120260 ) ) ( not ( = ?auto_120259 ?auto_120262 ) ) ( not ( = ?auto_120260 ?auto_120262 ) ) ( not ( = ?auto_120263 ?auto_120262 ) ) ( not ( = ?auto_120256 ?auto_120263 ) ) ( not ( = ?auto_120257 ?auto_120263 ) ) ( not ( = ?auto_120258 ?auto_120263 ) ) ( not ( = ?auto_120259 ?auto_120263 ) ) ( not ( = ?auto_120260 ?auto_120263 ) ) ( ON ?auto_120263 ?auto_120261 ) ( not ( = ?auto_120256 ?auto_120261 ) ) ( not ( = ?auto_120257 ?auto_120261 ) ) ( not ( = ?auto_120258 ?auto_120261 ) ) ( not ( = ?auto_120259 ?auto_120261 ) ) ( not ( = ?auto_120260 ?auto_120261 ) ) ( not ( = ?auto_120262 ?auto_120261 ) ) ( not ( = ?auto_120263 ?auto_120261 ) ) ( ON ?auto_120262 ?auto_120263 ) ( ON-TABLE ?auto_120261 ) ( ON ?auto_120260 ?auto_120262 ) ( ON ?auto_120259 ?auto_120260 ) ( CLEAR ?auto_120257 ) ( ON ?auto_120258 ?auto_120259 ) ( CLEAR ?auto_120258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120261 ?auto_120263 ?auto_120262 ?auto_120260 ?auto_120259 )
      ( MAKE-3PILE ?auto_120256 ?auto_120257 ?auto_120258 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120264 - BLOCK
      ?auto_120265 - BLOCK
      ?auto_120266 - BLOCK
    )
    :vars
    (
      ?auto_120269 - BLOCK
      ?auto_120268 - BLOCK
      ?auto_120270 - BLOCK
      ?auto_120267 - BLOCK
      ?auto_120271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120264 ) ( not ( = ?auto_120264 ?auto_120265 ) ) ( not ( = ?auto_120264 ?auto_120266 ) ) ( not ( = ?auto_120264 ?auto_120269 ) ) ( not ( = ?auto_120265 ?auto_120266 ) ) ( not ( = ?auto_120265 ?auto_120269 ) ) ( not ( = ?auto_120266 ?auto_120269 ) ) ( not ( = ?auto_120264 ?auto_120268 ) ) ( not ( = ?auto_120264 ?auto_120270 ) ) ( not ( = ?auto_120265 ?auto_120268 ) ) ( not ( = ?auto_120265 ?auto_120270 ) ) ( not ( = ?auto_120266 ?auto_120268 ) ) ( not ( = ?auto_120266 ?auto_120270 ) ) ( not ( = ?auto_120269 ?auto_120268 ) ) ( not ( = ?auto_120269 ?auto_120270 ) ) ( not ( = ?auto_120268 ?auto_120270 ) ) ( not ( = ?auto_120267 ?auto_120270 ) ) ( not ( = ?auto_120264 ?auto_120267 ) ) ( not ( = ?auto_120265 ?auto_120267 ) ) ( not ( = ?auto_120266 ?auto_120267 ) ) ( not ( = ?auto_120269 ?auto_120267 ) ) ( not ( = ?auto_120268 ?auto_120267 ) ) ( ON ?auto_120267 ?auto_120271 ) ( not ( = ?auto_120264 ?auto_120271 ) ) ( not ( = ?auto_120265 ?auto_120271 ) ) ( not ( = ?auto_120266 ?auto_120271 ) ) ( not ( = ?auto_120269 ?auto_120271 ) ) ( not ( = ?auto_120268 ?auto_120271 ) ) ( not ( = ?auto_120270 ?auto_120271 ) ) ( not ( = ?auto_120267 ?auto_120271 ) ) ( ON ?auto_120270 ?auto_120267 ) ( ON-TABLE ?auto_120271 ) ( ON ?auto_120268 ?auto_120270 ) ( ON ?auto_120269 ?auto_120268 ) ( ON ?auto_120266 ?auto_120269 ) ( CLEAR ?auto_120266 ) ( HOLDING ?auto_120265 ) ( CLEAR ?auto_120264 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120264 ?auto_120265 )
      ( MAKE-3PILE ?auto_120264 ?auto_120265 ?auto_120266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120272 - BLOCK
      ?auto_120273 - BLOCK
      ?auto_120274 - BLOCK
    )
    :vars
    (
      ?auto_120278 - BLOCK
      ?auto_120275 - BLOCK
      ?auto_120279 - BLOCK
      ?auto_120276 - BLOCK
      ?auto_120277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120272 ) ( not ( = ?auto_120272 ?auto_120273 ) ) ( not ( = ?auto_120272 ?auto_120274 ) ) ( not ( = ?auto_120272 ?auto_120278 ) ) ( not ( = ?auto_120273 ?auto_120274 ) ) ( not ( = ?auto_120273 ?auto_120278 ) ) ( not ( = ?auto_120274 ?auto_120278 ) ) ( not ( = ?auto_120272 ?auto_120275 ) ) ( not ( = ?auto_120272 ?auto_120279 ) ) ( not ( = ?auto_120273 ?auto_120275 ) ) ( not ( = ?auto_120273 ?auto_120279 ) ) ( not ( = ?auto_120274 ?auto_120275 ) ) ( not ( = ?auto_120274 ?auto_120279 ) ) ( not ( = ?auto_120278 ?auto_120275 ) ) ( not ( = ?auto_120278 ?auto_120279 ) ) ( not ( = ?auto_120275 ?auto_120279 ) ) ( not ( = ?auto_120276 ?auto_120279 ) ) ( not ( = ?auto_120272 ?auto_120276 ) ) ( not ( = ?auto_120273 ?auto_120276 ) ) ( not ( = ?auto_120274 ?auto_120276 ) ) ( not ( = ?auto_120278 ?auto_120276 ) ) ( not ( = ?auto_120275 ?auto_120276 ) ) ( ON ?auto_120276 ?auto_120277 ) ( not ( = ?auto_120272 ?auto_120277 ) ) ( not ( = ?auto_120273 ?auto_120277 ) ) ( not ( = ?auto_120274 ?auto_120277 ) ) ( not ( = ?auto_120278 ?auto_120277 ) ) ( not ( = ?auto_120275 ?auto_120277 ) ) ( not ( = ?auto_120279 ?auto_120277 ) ) ( not ( = ?auto_120276 ?auto_120277 ) ) ( ON ?auto_120279 ?auto_120276 ) ( ON-TABLE ?auto_120277 ) ( ON ?auto_120275 ?auto_120279 ) ( ON ?auto_120278 ?auto_120275 ) ( ON ?auto_120274 ?auto_120278 ) ( CLEAR ?auto_120272 ) ( ON ?auto_120273 ?auto_120274 ) ( CLEAR ?auto_120273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120277 ?auto_120276 ?auto_120279 ?auto_120275 ?auto_120278 ?auto_120274 )
      ( MAKE-3PILE ?auto_120272 ?auto_120273 ?auto_120274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120280 - BLOCK
      ?auto_120281 - BLOCK
      ?auto_120282 - BLOCK
    )
    :vars
    (
      ?auto_120285 - BLOCK
      ?auto_120286 - BLOCK
      ?auto_120284 - BLOCK
      ?auto_120287 - BLOCK
      ?auto_120283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120280 ?auto_120281 ) ) ( not ( = ?auto_120280 ?auto_120282 ) ) ( not ( = ?auto_120280 ?auto_120285 ) ) ( not ( = ?auto_120281 ?auto_120282 ) ) ( not ( = ?auto_120281 ?auto_120285 ) ) ( not ( = ?auto_120282 ?auto_120285 ) ) ( not ( = ?auto_120280 ?auto_120286 ) ) ( not ( = ?auto_120280 ?auto_120284 ) ) ( not ( = ?auto_120281 ?auto_120286 ) ) ( not ( = ?auto_120281 ?auto_120284 ) ) ( not ( = ?auto_120282 ?auto_120286 ) ) ( not ( = ?auto_120282 ?auto_120284 ) ) ( not ( = ?auto_120285 ?auto_120286 ) ) ( not ( = ?auto_120285 ?auto_120284 ) ) ( not ( = ?auto_120286 ?auto_120284 ) ) ( not ( = ?auto_120287 ?auto_120284 ) ) ( not ( = ?auto_120280 ?auto_120287 ) ) ( not ( = ?auto_120281 ?auto_120287 ) ) ( not ( = ?auto_120282 ?auto_120287 ) ) ( not ( = ?auto_120285 ?auto_120287 ) ) ( not ( = ?auto_120286 ?auto_120287 ) ) ( ON ?auto_120287 ?auto_120283 ) ( not ( = ?auto_120280 ?auto_120283 ) ) ( not ( = ?auto_120281 ?auto_120283 ) ) ( not ( = ?auto_120282 ?auto_120283 ) ) ( not ( = ?auto_120285 ?auto_120283 ) ) ( not ( = ?auto_120286 ?auto_120283 ) ) ( not ( = ?auto_120284 ?auto_120283 ) ) ( not ( = ?auto_120287 ?auto_120283 ) ) ( ON ?auto_120284 ?auto_120287 ) ( ON-TABLE ?auto_120283 ) ( ON ?auto_120286 ?auto_120284 ) ( ON ?auto_120285 ?auto_120286 ) ( ON ?auto_120282 ?auto_120285 ) ( ON ?auto_120281 ?auto_120282 ) ( CLEAR ?auto_120281 ) ( HOLDING ?auto_120280 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120280 )
      ( MAKE-3PILE ?auto_120280 ?auto_120281 ?auto_120282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_120288 - BLOCK
      ?auto_120289 - BLOCK
      ?auto_120290 - BLOCK
    )
    :vars
    (
      ?auto_120294 - BLOCK
      ?auto_120291 - BLOCK
      ?auto_120295 - BLOCK
      ?auto_120293 - BLOCK
      ?auto_120292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120288 ?auto_120289 ) ) ( not ( = ?auto_120288 ?auto_120290 ) ) ( not ( = ?auto_120288 ?auto_120294 ) ) ( not ( = ?auto_120289 ?auto_120290 ) ) ( not ( = ?auto_120289 ?auto_120294 ) ) ( not ( = ?auto_120290 ?auto_120294 ) ) ( not ( = ?auto_120288 ?auto_120291 ) ) ( not ( = ?auto_120288 ?auto_120295 ) ) ( not ( = ?auto_120289 ?auto_120291 ) ) ( not ( = ?auto_120289 ?auto_120295 ) ) ( not ( = ?auto_120290 ?auto_120291 ) ) ( not ( = ?auto_120290 ?auto_120295 ) ) ( not ( = ?auto_120294 ?auto_120291 ) ) ( not ( = ?auto_120294 ?auto_120295 ) ) ( not ( = ?auto_120291 ?auto_120295 ) ) ( not ( = ?auto_120293 ?auto_120295 ) ) ( not ( = ?auto_120288 ?auto_120293 ) ) ( not ( = ?auto_120289 ?auto_120293 ) ) ( not ( = ?auto_120290 ?auto_120293 ) ) ( not ( = ?auto_120294 ?auto_120293 ) ) ( not ( = ?auto_120291 ?auto_120293 ) ) ( ON ?auto_120293 ?auto_120292 ) ( not ( = ?auto_120288 ?auto_120292 ) ) ( not ( = ?auto_120289 ?auto_120292 ) ) ( not ( = ?auto_120290 ?auto_120292 ) ) ( not ( = ?auto_120294 ?auto_120292 ) ) ( not ( = ?auto_120291 ?auto_120292 ) ) ( not ( = ?auto_120295 ?auto_120292 ) ) ( not ( = ?auto_120293 ?auto_120292 ) ) ( ON ?auto_120295 ?auto_120293 ) ( ON-TABLE ?auto_120292 ) ( ON ?auto_120291 ?auto_120295 ) ( ON ?auto_120294 ?auto_120291 ) ( ON ?auto_120290 ?auto_120294 ) ( ON ?auto_120289 ?auto_120290 ) ( ON ?auto_120288 ?auto_120289 ) ( CLEAR ?auto_120288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120292 ?auto_120293 ?auto_120295 ?auto_120291 ?auto_120294 ?auto_120290 ?auto_120289 )
      ( MAKE-3PILE ?auto_120288 ?auto_120289 ?auto_120290 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120300 - BLOCK
      ?auto_120301 - BLOCK
      ?auto_120302 - BLOCK
      ?auto_120303 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_120303 ) ( CLEAR ?auto_120302 ) ( ON-TABLE ?auto_120300 ) ( ON ?auto_120301 ?auto_120300 ) ( ON ?auto_120302 ?auto_120301 ) ( not ( = ?auto_120300 ?auto_120301 ) ) ( not ( = ?auto_120300 ?auto_120302 ) ) ( not ( = ?auto_120300 ?auto_120303 ) ) ( not ( = ?auto_120301 ?auto_120302 ) ) ( not ( = ?auto_120301 ?auto_120303 ) ) ( not ( = ?auto_120302 ?auto_120303 ) ) )
    :subtasks
    ( ( !STACK ?auto_120303 ?auto_120302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120304 - BLOCK
      ?auto_120305 - BLOCK
      ?auto_120306 - BLOCK
      ?auto_120307 - BLOCK
    )
    :vars
    (
      ?auto_120308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120306 ) ( ON-TABLE ?auto_120304 ) ( ON ?auto_120305 ?auto_120304 ) ( ON ?auto_120306 ?auto_120305 ) ( not ( = ?auto_120304 ?auto_120305 ) ) ( not ( = ?auto_120304 ?auto_120306 ) ) ( not ( = ?auto_120304 ?auto_120307 ) ) ( not ( = ?auto_120305 ?auto_120306 ) ) ( not ( = ?auto_120305 ?auto_120307 ) ) ( not ( = ?auto_120306 ?auto_120307 ) ) ( ON ?auto_120307 ?auto_120308 ) ( CLEAR ?auto_120307 ) ( HAND-EMPTY ) ( not ( = ?auto_120304 ?auto_120308 ) ) ( not ( = ?auto_120305 ?auto_120308 ) ) ( not ( = ?auto_120306 ?auto_120308 ) ) ( not ( = ?auto_120307 ?auto_120308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120307 ?auto_120308 )
      ( MAKE-4PILE ?auto_120304 ?auto_120305 ?auto_120306 ?auto_120307 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120309 - BLOCK
      ?auto_120310 - BLOCK
      ?auto_120311 - BLOCK
      ?auto_120312 - BLOCK
    )
    :vars
    (
      ?auto_120313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120309 ) ( ON ?auto_120310 ?auto_120309 ) ( not ( = ?auto_120309 ?auto_120310 ) ) ( not ( = ?auto_120309 ?auto_120311 ) ) ( not ( = ?auto_120309 ?auto_120312 ) ) ( not ( = ?auto_120310 ?auto_120311 ) ) ( not ( = ?auto_120310 ?auto_120312 ) ) ( not ( = ?auto_120311 ?auto_120312 ) ) ( ON ?auto_120312 ?auto_120313 ) ( CLEAR ?auto_120312 ) ( not ( = ?auto_120309 ?auto_120313 ) ) ( not ( = ?auto_120310 ?auto_120313 ) ) ( not ( = ?auto_120311 ?auto_120313 ) ) ( not ( = ?auto_120312 ?auto_120313 ) ) ( HOLDING ?auto_120311 ) ( CLEAR ?auto_120310 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120309 ?auto_120310 ?auto_120311 )
      ( MAKE-4PILE ?auto_120309 ?auto_120310 ?auto_120311 ?auto_120312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120314 - BLOCK
      ?auto_120315 - BLOCK
      ?auto_120316 - BLOCK
      ?auto_120317 - BLOCK
    )
    :vars
    (
      ?auto_120318 - BLOCK
      ?auto_120319 - BLOCK
      ?auto_120320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120314 ) ( ON ?auto_120315 ?auto_120314 ) ( not ( = ?auto_120314 ?auto_120315 ) ) ( not ( = ?auto_120314 ?auto_120316 ) ) ( not ( = ?auto_120314 ?auto_120317 ) ) ( not ( = ?auto_120315 ?auto_120316 ) ) ( not ( = ?auto_120315 ?auto_120317 ) ) ( not ( = ?auto_120316 ?auto_120317 ) ) ( ON ?auto_120317 ?auto_120318 ) ( not ( = ?auto_120314 ?auto_120318 ) ) ( not ( = ?auto_120315 ?auto_120318 ) ) ( not ( = ?auto_120316 ?auto_120318 ) ) ( not ( = ?auto_120317 ?auto_120318 ) ) ( CLEAR ?auto_120315 ) ( ON ?auto_120316 ?auto_120317 ) ( CLEAR ?auto_120316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120319 ) ( ON ?auto_120320 ?auto_120319 ) ( ON ?auto_120318 ?auto_120320 ) ( not ( = ?auto_120319 ?auto_120320 ) ) ( not ( = ?auto_120319 ?auto_120318 ) ) ( not ( = ?auto_120319 ?auto_120317 ) ) ( not ( = ?auto_120319 ?auto_120316 ) ) ( not ( = ?auto_120320 ?auto_120318 ) ) ( not ( = ?auto_120320 ?auto_120317 ) ) ( not ( = ?auto_120320 ?auto_120316 ) ) ( not ( = ?auto_120314 ?auto_120319 ) ) ( not ( = ?auto_120314 ?auto_120320 ) ) ( not ( = ?auto_120315 ?auto_120319 ) ) ( not ( = ?auto_120315 ?auto_120320 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120319 ?auto_120320 ?auto_120318 ?auto_120317 )
      ( MAKE-4PILE ?auto_120314 ?auto_120315 ?auto_120316 ?auto_120317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120321 - BLOCK
      ?auto_120322 - BLOCK
      ?auto_120323 - BLOCK
      ?auto_120324 - BLOCK
    )
    :vars
    (
      ?auto_120325 - BLOCK
      ?auto_120327 - BLOCK
      ?auto_120326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120321 ) ( not ( = ?auto_120321 ?auto_120322 ) ) ( not ( = ?auto_120321 ?auto_120323 ) ) ( not ( = ?auto_120321 ?auto_120324 ) ) ( not ( = ?auto_120322 ?auto_120323 ) ) ( not ( = ?auto_120322 ?auto_120324 ) ) ( not ( = ?auto_120323 ?auto_120324 ) ) ( ON ?auto_120324 ?auto_120325 ) ( not ( = ?auto_120321 ?auto_120325 ) ) ( not ( = ?auto_120322 ?auto_120325 ) ) ( not ( = ?auto_120323 ?auto_120325 ) ) ( not ( = ?auto_120324 ?auto_120325 ) ) ( ON ?auto_120323 ?auto_120324 ) ( CLEAR ?auto_120323 ) ( ON-TABLE ?auto_120327 ) ( ON ?auto_120326 ?auto_120327 ) ( ON ?auto_120325 ?auto_120326 ) ( not ( = ?auto_120327 ?auto_120326 ) ) ( not ( = ?auto_120327 ?auto_120325 ) ) ( not ( = ?auto_120327 ?auto_120324 ) ) ( not ( = ?auto_120327 ?auto_120323 ) ) ( not ( = ?auto_120326 ?auto_120325 ) ) ( not ( = ?auto_120326 ?auto_120324 ) ) ( not ( = ?auto_120326 ?auto_120323 ) ) ( not ( = ?auto_120321 ?auto_120327 ) ) ( not ( = ?auto_120321 ?auto_120326 ) ) ( not ( = ?auto_120322 ?auto_120327 ) ) ( not ( = ?auto_120322 ?auto_120326 ) ) ( HOLDING ?auto_120322 ) ( CLEAR ?auto_120321 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120321 ?auto_120322 )
      ( MAKE-4PILE ?auto_120321 ?auto_120322 ?auto_120323 ?auto_120324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120328 - BLOCK
      ?auto_120329 - BLOCK
      ?auto_120330 - BLOCK
      ?auto_120331 - BLOCK
    )
    :vars
    (
      ?auto_120333 - BLOCK
      ?auto_120334 - BLOCK
      ?auto_120332 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120328 ) ( not ( = ?auto_120328 ?auto_120329 ) ) ( not ( = ?auto_120328 ?auto_120330 ) ) ( not ( = ?auto_120328 ?auto_120331 ) ) ( not ( = ?auto_120329 ?auto_120330 ) ) ( not ( = ?auto_120329 ?auto_120331 ) ) ( not ( = ?auto_120330 ?auto_120331 ) ) ( ON ?auto_120331 ?auto_120333 ) ( not ( = ?auto_120328 ?auto_120333 ) ) ( not ( = ?auto_120329 ?auto_120333 ) ) ( not ( = ?auto_120330 ?auto_120333 ) ) ( not ( = ?auto_120331 ?auto_120333 ) ) ( ON ?auto_120330 ?auto_120331 ) ( ON-TABLE ?auto_120334 ) ( ON ?auto_120332 ?auto_120334 ) ( ON ?auto_120333 ?auto_120332 ) ( not ( = ?auto_120334 ?auto_120332 ) ) ( not ( = ?auto_120334 ?auto_120333 ) ) ( not ( = ?auto_120334 ?auto_120331 ) ) ( not ( = ?auto_120334 ?auto_120330 ) ) ( not ( = ?auto_120332 ?auto_120333 ) ) ( not ( = ?auto_120332 ?auto_120331 ) ) ( not ( = ?auto_120332 ?auto_120330 ) ) ( not ( = ?auto_120328 ?auto_120334 ) ) ( not ( = ?auto_120328 ?auto_120332 ) ) ( not ( = ?auto_120329 ?auto_120334 ) ) ( not ( = ?auto_120329 ?auto_120332 ) ) ( CLEAR ?auto_120328 ) ( ON ?auto_120329 ?auto_120330 ) ( CLEAR ?auto_120329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120334 ?auto_120332 ?auto_120333 ?auto_120331 ?auto_120330 )
      ( MAKE-4PILE ?auto_120328 ?auto_120329 ?auto_120330 ?auto_120331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120335 - BLOCK
      ?auto_120336 - BLOCK
      ?auto_120337 - BLOCK
      ?auto_120338 - BLOCK
    )
    :vars
    (
      ?auto_120341 - BLOCK
      ?auto_120340 - BLOCK
      ?auto_120339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120335 ?auto_120336 ) ) ( not ( = ?auto_120335 ?auto_120337 ) ) ( not ( = ?auto_120335 ?auto_120338 ) ) ( not ( = ?auto_120336 ?auto_120337 ) ) ( not ( = ?auto_120336 ?auto_120338 ) ) ( not ( = ?auto_120337 ?auto_120338 ) ) ( ON ?auto_120338 ?auto_120341 ) ( not ( = ?auto_120335 ?auto_120341 ) ) ( not ( = ?auto_120336 ?auto_120341 ) ) ( not ( = ?auto_120337 ?auto_120341 ) ) ( not ( = ?auto_120338 ?auto_120341 ) ) ( ON ?auto_120337 ?auto_120338 ) ( ON-TABLE ?auto_120340 ) ( ON ?auto_120339 ?auto_120340 ) ( ON ?auto_120341 ?auto_120339 ) ( not ( = ?auto_120340 ?auto_120339 ) ) ( not ( = ?auto_120340 ?auto_120341 ) ) ( not ( = ?auto_120340 ?auto_120338 ) ) ( not ( = ?auto_120340 ?auto_120337 ) ) ( not ( = ?auto_120339 ?auto_120341 ) ) ( not ( = ?auto_120339 ?auto_120338 ) ) ( not ( = ?auto_120339 ?auto_120337 ) ) ( not ( = ?auto_120335 ?auto_120340 ) ) ( not ( = ?auto_120335 ?auto_120339 ) ) ( not ( = ?auto_120336 ?auto_120340 ) ) ( not ( = ?auto_120336 ?auto_120339 ) ) ( ON ?auto_120336 ?auto_120337 ) ( CLEAR ?auto_120336 ) ( HOLDING ?auto_120335 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120335 )
      ( MAKE-4PILE ?auto_120335 ?auto_120336 ?auto_120337 ?auto_120338 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120342 - BLOCK
      ?auto_120343 - BLOCK
      ?auto_120344 - BLOCK
      ?auto_120345 - BLOCK
    )
    :vars
    (
      ?auto_120348 - BLOCK
      ?auto_120346 - BLOCK
      ?auto_120347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120342 ?auto_120343 ) ) ( not ( = ?auto_120342 ?auto_120344 ) ) ( not ( = ?auto_120342 ?auto_120345 ) ) ( not ( = ?auto_120343 ?auto_120344 ) ) ( not ( = ?auto_120343 ?auto_120345 ) ) ( not ( = ?auto_120344 ?auto_120345 ) ) ( ON ?auto_120345 ?auto_120348 ) ( not ( = ?auto_120342 ?auto_120348 ) ) ( not ( = ?auto_120343 ?auto_120348 ) ) ( not ( = ?auto_120344 ?auto_120348 ) ) ( not ( = ?auto_120345 ?auto_120348 ) ) ( ON ?auto_120344 ?auto_120345 ) ( ON-TABLE ?auto_120346 ) ( ON ?auto_120347 ?auto_120346 ) ( ON ?auto_120348 ?auto_120347 ) ( not ( = ?auto_120346 ?auto_120347 ) ) ( not ( = ?auto_120346 ?auto_120348 ) ) ( not ( = ?auto_120346 ?auto_120345 ) ) ( not ( = ?auto_120346 ?auto_120344 ) ) ( not ( = ?auto_120347 ?auto_120348 ) ) ( not ( = ?auto_120347 ?auto_120345 ) ) ( not ( = ?auto_120347 ?auto_120344 ) ) ( not ( = ?auto_120342 ?auto_120346 ) ) ( not ( = ?auto_120342 ?auto_120347 ) ) ( not ( = ?auto_120343 ?auto_120346 ) ) ( not ( = ?auto_120343 ?auto_120347 ) ) ( ON ?auto_120343 ?auto_120344 ) ( ON ?auto_120342 ?auto_120343 ) ( CLEAR ?auto_120342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120346 ?auto_120347 ?auto_120348 ?auto_120345 ?auto_120344 ?auto_120343 )
      ( MAKE-4PILE ?auto_120342 ?auto_120343 ?auto_120344 ?auto_120345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120349 - BLOCK
      ?auto_120350 - BLOCK
      ?auto_120351 - BLOCK
      ?auto_120352 - BLOCK
    )
    :vars
    (
      ?auto_120354 - BLOCK
      ?auto_120355 - BLOCK
      ?auto_120353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120349 ?auto_120350 ) ) ( not ( = ?auto_120349 ?auto_120351 ) ) ( not ( = ?auto_120349 ?auto_120352 ) ) ( not ( = ?auto_120350 ?auto_120351 ) ) ( not ( = ?auto_120350 ?auto_120352 ) ) ( not ( = ?auto_120351 ?auto_120352 ) ) ( ON ?auto_120352 ?auto_120354 ) ( not ( = ?auto_120349 ?auto_120354 ) ) ( not ( = ?auto_120350 ?auto_120354 ) ) ( not ( = ?auto_120351 ?auto_120354 ) ) ( not ( = ?auto_120352 ?auto_120354 ) ) ( ON ?auto_120351 ?auto_120352 ) ( ON-TABLE ?auto_120355 ) ( ON ?auto_120353 ?auto_120355 ) ( ON ?auto_120354 ?auto_120353 ) ( not ( = ?auto_120355 ?auto_120353 ) ) ( not ( = ?auto_120355 ?auto_120354 ) ) ( not ( = ?auto_120355 ?auto_120352 ) ) ( not ( = ?auto_120355 ?auto_120351 ) ) ( not ( = ?auto_120353 ?auto_120354 ) ) ( not ( = ?auto_120353 ?auto_120352 ) ) ( not ( = ?auto_120353 ?auto_120351 ) ) ( not ( = ?auto_120349 ?auto_120355 ) ) ( not ( = ?auto_120349 ?auto_120353 ) ) ( not ( = ?auto_120350 ?auto_120355 ) ) ( not ( = ?auto_120350 ?auto_120353 ) ) ( ON ?auto_120350 ?auto_120351 ) ( HOLDING ?auto_120349 ) ( CLEAR ?auto_120350 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120355 ?auto_120353 ?auto_120354 ?auto_120352 ?auto_120351 ?auto_120350 ?auto_120349 )
      ( MAKE-4PILE ?auto_120349 ?auto_120350 ?auto_120351 ?auto_120352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120356 - BLOCK
      ?auto_120357 - BLOCK
      ?auto_120358 - BLOCK
      ?auto_120359 - BLOCK
    )
    :vars
    (
      ?auto_120362 - BLOCK
      ?auto_120361 - BLOCK
      ?auto_120360 - BLOCK
      ?auto_120363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120356 ?auto_120357 ) ) ( not ( = ?auto_120356 ?auto_120358 ) ) ( not ( = ?auto_120356 ?auto_120359 ) ) ( not ( = ?auto_120357 ?auto_120358 ) ) ( not ( = ?auto_120357 ?auto_120359 ) ) ( not ( = ?auto_120358 ?auto_120359 ) ) ( ON ?auto_120359 ?auto_120362 ) ( not ( = ?auto_120356 ?auto_120362 ) ) ( not ( = ?auto_120357 ?auto_120362 ) ) ( not ( = ?auto_120358 ?auto_120362 ) ) ( not ( = ?auto_120359 ?auto_120362 ) ) ( ON ?auto_120358 ?auto_120359 ) ( ON-TABLE ?auto_120361 ) ( ON ?auto_120360 ?auto_120361 ) ( ON ?auto_120362 ?auto_120360 ) ( not ( = ?auto_120361 ?auto_120360 ) ) ( not ( = ?auto_120361 ?auto_120362 ) ) ( not ( = ?auto_120361 ?auto_120359 ) ) ( not ( = ?auto_120361 ?auto_120358 ) ) ( not ( = ?auto_120360 ?auto_120362 ) ) ( not ( = ?auto_120360 ?auto_120359 ) ) ( not ( = ?auto_120360 ?auto_120358 ) ) ( not ( = ?auto_120356 ?auto_120361 ) ) ( not ( = ?auto_120356 ?auto_120360 ) ) ( not ( = ?auto_120357 ?auto_120361 ) ) ( not ( = ?auto_120357 ?auto_120360 ) ) ( ON ?auto_120357 ?auto_120358 ) ( CLEAR ?auto_120357 ) ( ON ?auto_120356 ?auto_120363 ) ( CLEAR ?auto_120356 ) ( HAND-EMPTY ) ( not ( = ?auto_120356 ?auto_120363 ) ) ( not ( = ?auto_120357 ?auto_120363 ) ) ( not ( = ?auto_120358 ?auto_120363 ) ) ( not ( = ?auto_120359 ?auto_120363 ) ) ( not ( = ?auto_120362 ?auto_120363 ) ) ( not ( = ?auto_120361 ?auto_120363 ) ) ( not ( = ?auto_120360 ?auto_120363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120356 ?auto_120363 )
      ( MAKE-4PILE ?auto_120356 ?auto_120357 ?auto_120358 ?auto_120359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120364 - BLOCK
      ?auto_120365 - BLOCK
      ?auto_120366 - BLOCK
      ?auto_120367 - BLOCK
    )
    :vars
    (
      ?auto_120368 - BLOCK
      ?auto_120370 - BLOCK
      ?auto_120369 - BLOCK
      ?auto_120371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120364 ?auto_120365 ) ) ( not ( = ?auto_120364 ?auto_120366 ) ) ( not ( = ?auto_120364 ?auto_120367 ) ) ( not ( = ?auto_120365 ?auto_120366 ) ) ( not ( = ?auto_120365 ?auto_120367 ) ) ( not ( = ?auto_120366 ?auto_120367 ) ) ( ON ?auto_120367 ?auto_120368 ) ( not ( = ?auto_120364 ?auto_120368 ) ) ( not ( = ?auto_120365 ?auto_120368 ) ) ( not ( = ?auto_120366 ?auto_120368 ) ) ( not ( = ?auto_120367 ?auto_120368 ) ) ( ON ?auto_120366 ?auto_120367 ) ( ON-TABLE ?auto_120370 ) ( ON ?auto_120369 ?auto_120370 ) ( ON ?auto_120368 ?auto_120369 ) ( not ( = ?auto_120370 ?auto_120369 ) ) ( not ( = ?auto_120370 ?auto_120368 ) ) ( not ( = ?auto_120370 ?auto_120367 ) ) ( not ( = ?auto_120370 ?auto_120366 ) ) ( not ( = ?auto_120369 ?auto_120368 ) ) ( not ( = ?auto_120369 ?auto_120367 ) ) ( not ( = ?auto_120369 ?auto_120366 ) ) ( not ( = ?auto_120364 ?auto_120370 ) ) ( not ( = ?auto_120364 ?auto_120369 ) ) ( not ( = ?auto_120365 ?auto_120370 ) ) ( not ( = ?auto_120365 ?auto_120369 ) ) ( ON ?auto_120364 ?auto_120371 ) ( CLEAR ?auto_120364 ) ( not ( = ?auto_120364 ?auto_120371 ) ) ( not ( = ?auto_120365 ?auto_120371 ) ) ( not ( = ?auto_120366 ?auto_120371 ) ) ( not ( = ?auto_120367 ?auto_120371 ) ) ( not ( = ?auto_120368 ?auto_120371 ) ) ( not ( = ?auto_120370 ?auto_120371 ) ) ( not ( = ?auto_120369 ?auto_120371 ) ) ( HOLDING ?auto_120365 ) ( CLEAR ?auto_120366 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120370 ?auto_120369 ?auto_120368 ?auto_120367 ?auto_120366 ?auto_120365 )
      ( MAKE-4PILE ?auto_120364 ?auto_120365 ?auto_120366 ?auto_120367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120372 - BLOCK
      ?auto_120373 - BLOCK
      ?auto_120374 - BLOCK
      ?auto_120375 - BLOCK
    )
    :vars
    (
      ?auto_120376 - BLOCK
      ?auto_120378 - BLOCK
      ?auto_120379 - BLOCK
      ?auto_120377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120372 ?auto_120373 ) ) ( not ( = ?auto_120372 ?auto_120374 ) ) ( not ( = ?auto_120372 ?auto_120375 ) ) ( not ( = ?auto_120373 ?auto_120374 ) ) ( not ( = ?auto_120373 ?auto_120375 ) ) ( not ( = ?auto_120374 ?auto_120375 ) ) ( ON ?auto_120375 ?auto_120376 ) ( not ( = ?auto_120372 ?auto_120376 ) ) ( not ( = ?auto_120373 ?auto_120376 ) ) ( not ( = ?auto_120374 ?auto_120376 ) ) ( not ( = ?auto_120375 ?auto_120376 ) ) ( ON ?auto_120374 ?auto_120375 ) ( ON-TABLE ?auto_120378 ) ( ON ?auto_120379 ?auto_120378 ) ( ON ?auto_120376 ?auto_120379 ) ( not ( = ?auto_120378 ?auto_120379 ) ) ( not ( = ?auto_120378 ?auto_120376 ) ) ( not ( = ?auto_120378 ?auto_120375 ) ) ( not ( = ?auto_120378 ?auto_120374 ) ) ( not ( = ?auto_120379 ?auto_120376 ) ) ( not ( = ?auto_120379 ?auto_120375 ) ) ( not ( = ?auto_120379 ?auto_120374 ) ) ( not ( = ?auto_120372 ?auto_120378 ) ) ( not ( = ?auto_120372 ?auto_120379 ) ) ( not ( = ?auto_120373 ?auto_120378 ) ) ( not ( = ?auto_120373 ?auto_120379 ) ) ( ON ?auto_120372 ?auto_120377 ) ( not ( = ?auto_120372 ?auto_120377 ) ) ( not ( = ?auto_120373 ?auto_120377 ) ) ( not ( = ?auto_120374 ?auto_120377 ) ) ( not ( = ?auto_120375 ?auto_120377 ) ) ( not ( = ?auto_120376 ?auto_120377 ) ) ( not ( = ?auto_120378 ?auto_120377 ) ) ( not ( = ?auto_120379 ?auto_120377 ) ) ( CLEAR ?auto_120374 ) ( ON ?auto_120373 ?auto_120372 ) ( CLEAR ?auto_120373 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120377 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120377 ?auto_120372 )
      ( MAKE-4PILE ?auto_120372 ?auto_120373 ?auto_120374 ?auto_120375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120380 - BLOCK
      ?auto_120381 - BLOCK
      ?auto_120382 - BLOCK
      ?auto_120383 - BLOCK
    )
    :vars
    (
      ?auto_120387 - BLOCK
      ?auto_120386 - BLOCK
      ?auto_120385 - BLOCK
      ?auto_120384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120380 ?auto_120381 ) ) ( not ( = ?auto_120380 ?auto_120382 ) ) ( not ( = ?auto_120380 ?auto_120383 ) ) ( not ( = ?auto_120381 ?auto_120382 ) ) ( not ( = ?auto_120381 ?auto_120383 ) ) ( not ( = ?auto_120382 ?auto_120383 ) ) ( ON ?auto_120383 ?auto_120387 ) ( not ( = ?auto_120380 ?auto_120387 ) ) ( not ( = ?auto_120381 ?auto_120387 ) ) ( not ( = ?auto_120382 ?auto_120387 ) ) ( not ( = ?auto_120383 ?auto_120387 ) ) ( ON-TABLE ?auto_120386 ) ( ON ?auto_120385 ?auto_120386 ) ( ON ?auto_120387 ?auto_120385 ) ( not ( = ?auto_120386 ?auto_120385 ) ) ( not ( = ?auto_120386 ?auto_120387 ) ) ( not ( = ?auto_120386 ?auto_120383 ) ) ( not ( = ?auto_120386 ?auto_120382 ) ) ( not ( = ?auto_120385 ?auto_120387 ) ) ( not ( = ?auto_120385 ?auto_120383 ) ) ( not ( = ?auto_120385 ?auto_120382 ) ) ( not ( = ?auto_120380 ?auto_120386 ) ) ( not ( = ?auto_120380 ?auto_120385 ) ) ( not ( = ?auto_120381 ?auto_120386 ) ) ( not ( = ?auto_120381 ?auto_120385 ) ) ( ON ?auto_120380 ?auto_120384 ) ( not ( = ?auto_120380 ?auto_120384 ) ) ( not ( = ?auto_120381 ?auto_120384 ) ) ( not ( = ?auto_120382 ?auto_120384 ) ) ( not ( = ?auto_120383 ?auto_120384 ) ) ( not ( = ?auto_120387 ?auto_120384 ) ) ( not ( = ?auto_120386 ?auto_120384 ) ) ( not ( = ?auto_120385 ?auto_120384 ) ) ( ON ?auto_120381 ?auto_120380 ) ( CLEAR ?auto_120381 ) ( ON-TABLE ?auto_120384 ) ( HOLDING ?auto_120382 ) ( CLEAR ?auto_120383 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120386 ?auto_120385 ?auto_120387 ?auto_120383 ?auto_120382 )
      ( MAKE-4PILE ?auto_120380 ?auto_120381 ?auto_120382 ?auto_120383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120388 - BLOCK
      ?auto_120389 - BLOCK
      ?auto_120390 - BLOCK
      ?auto_120391 - BLOCK
    )
    :vars
    (
      ?auto_120394 - BLOCK
      ?auto_120395 - BLOCK
      ?auto_120392 - BLOCK
      ?auto_120393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120388 ?auto_120389 ) ) ( not ( = ?auto_120388 ?auto_120390 ) ) ( not ( = ?auto_120388 ?auto_120391 ) ) ( not ( = ?auto_120389 ?auto_120390 ) ) ( not ( = ?auto_120389 ?auto_120391 ) ) ( not ( = ?auto_120390 ?auto_120391 ) ) ( ON ?auto_120391 ?auto_120394 ) ( not ( = ?auto_120388 ?auto_120394 ) ) ( not ( = ?auto_120389 ?auto_120394 ) ) ( not ( = ?auto_120390 ?auto_120394 ) ) ( not ( = ?auto_120391 ?auto_120394 ) ) ( ON-TABLE ?auto_120395 ) ( ON ?auto_120392 ?auto_120395 ) ( ON ?auto_120394 ?auto_120392 ) ( not ( = ?auto_120395 ?auto_120392 ) ) ( not ( = ?auto_120395 ?auto_120394 ) ) ( not ( = ?auto_120395 ?auto_120391 ) ) ( not ( = ?auto_120395 ?auto_120390 ) ) ( not ( = ?auto_120392 ?auto_120394 ) ) ( not ( = ?auto_120392 ?auto_120391 ) ) ( not ( = ?auto_120392 ?auto_120390 ) ) ( not ( = ?auto_120388 ?auto_120395 ) ) ( not ( = ?auto_120388 ?auto_120392 ) ) ( not ( = ?auto_120389 ?auto_120395 ) ) ( not ( = ?auto_120389 ?auto_120392 ) ) ( ON ?auto_120388 ?auto_120393 ) ( not ( = ?auto_120388 ?auto_120393 ) ) ( not ( = ?auto_120389 ?auto_120393 ) ) ( not ( = ?auto_120390 ?auto_120393 ) ) ( not ( = ?auto_120391 ?auto_120393 ) ) ( not ( = ?auto_120394 ?auto_120393 ) ) ( not ( = ?auto_120395 ?auto_120393 ) ) ( not ( = ?auto_120392 ?auto_120393 ) ) ( ON ?auto_120389 ?auto_120388 ) ( ON-TABLE ?auto_120393 ) ( CLEAR ?auto_120391 ) ( ON ?auto_120390 ?auto_120389 ) ( CLEAR ?auto_120390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120393 ?auto_120388 ?auto_120389 )
      ( MAKE-4PILE ?auto_120388 ?auto_120389 ?auto_120390 ?auto_120391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120396 - BLOCK
      ?auto_120397 - BLOCK
      ?auto_120398 - BLOCK
      ?auto_120399 - BLOCK
    )
    :vars
    (
      ?auto_120403 - BLOCK
      ?auto_120402 - BLOCK
      ?auto_120401 - BLOCK
      ?auto_120400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120396 ?auto_120397 ) ) ( not ( = ?auto_120396 ?auto_120398 ) ) ( not ( = ?auto_120396 ?auto_120399 ) ) ( not ( = ?auto_120397 ?auto_120398 ) ) ( not ( = ?auto_120397 ?auto_120399 ) ) ( not ( = ?auto_120398 ?auto_120399 ) ) ( not ( = ?auto_120396 ?auto_120403 ) ) ( not ( = ?auto_120397 ?auto_120403 ) ) ( not ( = ?auto_120398 ?auto_120403 ) ) ( not ( = ?auto_120399 ?auto_120403 ) ) ( ON-TABLE ?auto_120402 ) ( ON ?auto_120401 ?auto_120402 ) ( ON ?auto_120403 ?auto_120401 ) ( not ( = ?auto_120402 ?auto_120401 ) ) ( not ( = ?auto_120402 ?auto_120403 ) ) ( not ( = ?auto_120402 ?auto_120399 ) ) ( not ( = ?auto_120402 ?auto_120398 ) ) ( not ( = ?auto_120401 ?auto_120403 ) ) ( not ( = ?auto_120401 ?auto_120399 ) ) ( not ( = ?auto_120401 ?auto_120398 ) ) ( not ( = ?auto_120396 ?auto_120402 ) ) ( not ( = ?auto_120396 ?auto_120401 ) ) ( not ( = ?auto_120397 ?auto_120402 ) ) ( not ( = ?auto_120397 ?auto_120401 ) ) ( ON ?auto_120396 ?auto_120400 ) ( not ( = ?auto_120396 ?auto_120400 ) ) ( not ( = ?auto_120397 ?auto_120400 ) ) ( not ( = ?auto_120398 ?auto_120400 ) ) ( not ( = ?auto_120399 ?auto_120400 ) ) ( not ( = ?auto_120403 ?auto_120400 ) ) ( not ( = ?auto_120402 ?auto_120400 ) ) ( not ( = ?auto_120401 ?auto_120400 ) ) ( ON ?auto_120397 ?auto_120396 ) ( ON-TABLE ?auto_120400 ) ( ON ?auto_120398 ?auto_120397 ) ( CLEAR ?auto_120398 ) ( HOLDING ?auto_120399 ) ( CLEAR ?auto_120403 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120402 ?auto_120401 ?auto_120403 ?auto_120399 )
      ( MAKE-4PILE ?auto_120396 ?auto_120397 ?auto_120398 ?auto_120399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120404 - BLOCK
      ?auto_120405 - BLOCK
      ?auto_120406 - BLOCK
      ?auto_120407 - BLOCK
    )
    :vars
    (
      ?auto_120408 - BLOCK
      ?auto_120411 - BLOCK
      ?auto_120409 - BLOCK
      ?auto_120410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120404 ?auto_120405 ) ) ( not ( = ?auto_120404 ?auto_120406 ) ) ( not ( = ?auto_120404 ?auto_120407 ) ) ( not ( = ?auto_120405 ?auto_120406 ) ) ( not ( = ?auto_120405 ?auto_120407 ) ) ( not ( = ?auto_120406 ?auto_120407 ) ) ( not ( = ?auto_120404 ?auto_120408 ) ) ( not ( = ?auto_120405 ?auto_120408 ) ) ( not ( = ?auto_120406 ?auto_120408 ) ) ( not ( = ?auto_120407 ?auto_120408 ) ) ( ON-TABLE ?auto_120411 ) ( ON ?auto_120409 ?auto_120411 ) ( ON ?auto_120408 ?auto_120409 ) ( not ( = ?auto_120411 ?auto_120409 ) ) ( not ( = ?auto_120411 ?auto_120408 ) ) ( not ( = ?auto_120411 ?auto_120407 ) ) ( not ( = ?auto_120411 ?auto_120406 ) ) ( not ( = ?auto_120409 ?auto_120408 ) ) ( not ( = ?auto_120409 ?auto_120407 ) ) ( not ( = ?auto_120409 ?auto_120406 ) ) ( not ( = ?auto_120404 ?auto_120411 ) ) ( not ( = ?auto_120404 ?auto_120409 ) ) ( not ( = ?auto_120405 ?auto_120411 ) ) ( not ( = ?auto_120405 ?auto_120409 ) ) ( ON ?auto_120404 ?auto_120410 ) ( not ( = ?auto_120404 ?auto_120410 ) ) ( not ( = ?auto_120405 ?auto_120410 ) ) ( not ( = ?auto_120406 ?auto_120410 ) ) ( not ( = ?auto_120407 ?auto_120410 ) ) ( not ( = ?auto_120408 ?auto_120410 ) ) ( not ( = ?auto_120411 ?auto_120410 ) ) ( not ( = ?auto_120409 ?auto_120410 ) ) ( ON ?auto_120405 ?auto_120404 ) ( ON-TABLE ?auto_120410 ) ( ON ?auto_120406 ?auto_120405 ) ( CLEAR ?auto_120408 ) ( ON ?auto_120407 ?auto_120406 ) ( CLEAR ?auto_120407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120410 ?auto_120404 ?auto_120405 ?auto_120406 )
      ( MAKE-4PILE ?auto_120404 ?auto_120405 ?auto_120406 ?auto_120407 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120412 - BLOCK
      ?auto_120413 - BLOCK
      ?auto_120414 - BLOCK
      ?auto_120415 - BLOCK
    )
    :vars
    (
      ?auto_120417 - BLOCK
      ?auto_120419 - BLOCK
      ?auto_120418 - BLOCK
      ?auto_120416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120412 ?auto_120413 ) ) ( not ( = ?auto_120412 ?auto_120414 ) ) ( not ( = ?auto_120412 ?auto_120415 ) ) ( not ( = ?auto_120413 ?auto_120414 ) ) ( not ( = ?auto_120413 ?auto_120415 ) ) ( not ( = ?auto_120414 ?auto_120415 ) ) ( not ( = ?auto_120412 ?auto_120417 ) ) ( not ( = ?auto_120413 ?auto_120417 ) ) ( not ( = ?auto_120414 ?auto_120417 ) ) ( not ( = ?auto_120415 ?auto_120417 ) ) ( ON-TABLE ?auto_120419 ) ( ON ?auto_120418 ?auto_120419 ) ( not ( = ?auto_120419 ?auto_120418 ) ) ( not ( = ?auto_120419 ?auto_120417 ) ) ( not ( = ?auto_120419 ?auto_120415 ) ) ( not ( = ?auto_120419 ?auto_120414 ) ) ( not ( = ?auto_120418 ?auto_120417 ) ) ( not ( = ?auto_120418 ?auto_120415 ) ) ( not ( = ?auto_120418 ?auto_120414 ) ) ( not ( = ?auto_120412 ?auto_120419 ) ) ( not ( = ?auto_120412 ?auto_120418 ) ) ( not ( = ?auto_120413 ?auto_120419 ) ) ( not ( = ?auto_120413 ?auto_120418 ) ) ( ON ?auto_120412 ?auto_120416 ) ( not ( = ?auto_120412 ?auto_120416 ) ) ( not ( = ?auto_120413 ?auto_120416 ) ) ( not ( = ?auto_120414 ?auto_120416 ) ) ( not ( = ?auto_120415 ?auto_120416 ) ) ( not ( = ?auto_120417 ?auto_120416 ) ) ( not ( = ?auto_120419 ?auto_120416 ) ) ( not ( = ?auto_120418 ?auto_120416 ) ) ( ON ?auto_120413 ?auto_120412 ) ( ON-TABLE ?auto_120416 ) ( ON ?auto_120414 ?auto_120413 ) ( ON ?auto_120415 ?auto_120414 ) ( CLEAR ?auto_120415 ) ( HOLDING ?auto_120417 ) ( CLEAR ?auto_120418 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120419 ?auto_120418 ?auto_120417 )
      ( MAKE-4PILE ?auto_120412 ?auto_120413 ?auto_120414 ?auto_120415 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120420 - BLOCK
      ?auto_120421 - BLOCK
      ?auto_120422 - BLOCK
      ?auto_120423 - BLOCK
    )
    :vars
    (
      ?auto_120424 - BLOCK
      ?auto_120425 - BLOCK
      ?auto_120427 - BLOCK
      ?auto_120426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120420 ?auto_120421 ) ) ( not ( = ?auto_120420 ?auto_120422 ) ) ( not ( = ?auto_120420 ?auto_120423 ) ) ( not ( = ?auto_120421 ?auto_120422 ) ) ( not ( = ?auto_120421 ?auto_120423 ) ) ( not ( = ?auto_120422 ?auto_120423 ) ) ( not ( = ?auto_120420 ?auto_120424 ) ) ( not ( = ?auto_120421 ?auto_120424 ) ) ( not ( = ?auto_120422 ?auto_120424 ) ) ( not ( = ?auto_120423 ?auto_120424 ) ) ( ON-TABLE ?auto_120425 ) ( ON ?auto_120427 ?auto_120425 ) ( not ( = ?auto_120425 ?auto_120427 ) ) ( not ( = ?auto_120425 ?auto_120424 ) ) ( not ( = ?auto_120425 ?auto_120423 ) ) ( not ( = ?auto_120425 ?auto_120422 ) ) ( not ( = ?auto_120427 ?auto_120424 ) ) ( not ( = ?auto_120427 ?auto_120423 ) ) ( not ( = ?auto_120427 ?auto_120422 ) ) ( not ( = ?auto_120420 ?auto_120425 ) ) ( not ( = ?auto_120420 ?auto_120427 ) ) ( not ( = ?auto_120421 ?auto_120425 ) ) ( not ( = ?auto_120421 ?auto_120427 ) ) ( ON ?auto_120420 ?auto_120426 ) ( not ( = ?auto_120420 ?auto_120426 ) ) ( not ( = ?auto_120421 ?auto_120426 ) ) ( not ( = ?auto_120422 ?auto_120426 ) ) ( not ( = ?auto_120423 ?auto_120426 ) ) ( not ( = ?auto_120424 ?auto_120426 ) ) ( not ( = ?auto_120425 ?auto_120426 ) ) ( not ( = ?auto_120427 ?auto_120426 ) ) ( ON ?auto_120421 ?auto_120420 ) ( ON-TABLE ?auto_120426 ) ( ON ?auto_120422 ?auto_120421 ) ( ON ?auto_120423 ?auto_120422 ) ( CLEAR ?auto_120427 ) ( ON ?auto_120424 ?auto_120423 ) ( CLEAR ?auto_120424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120426 ?auto_120420 ?auto_120421 ?auto_120422 ?auto_120423 )
      ( MAKE-4PILE ?auto_120420 ?auto_120421 ?auto_120422 ?auto_120423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120428 - BLOCK
      ?auto_120429 - BLOCK
      ?auto_120430 - BLOCK
      ?auto_120431 - BLOCK
    )
    :vars
    (
      ?auto_120434 - BLOCK
      ?auto_120433 - BLOCK
      ?auto_120435 - BLOCK
      ?auto_120432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120428 ?auto_120429 ) ) ( not ( = ?auto_120428 ?auto_120430 ) ) ( not ( = ?auto_120428 ?auto_120431 ) ) ( not ( = ?auto_120429 ?auto_120430 ) ) ( not ( = ?auto_120429 ?auto_120431 ) ) ( not ( = ?auto_120430 ?auto_120431 ) ) ( not ( = ?auto_120428 ?auto_120434 ) ) ( not ( = ?auto_120429 ?auto_120434 ) ) ( not ( = ?auto_120430 ?auto_120434 ) ) ( not ( = ?auto_120431 ?auto_120434 ) ) ( ON-TABLE ?auto_120433 ) ( not ( = ?auto_120433 ?auto_120435 ) ) ( not ( = ?auto_120433 ?auto_120434 ) ) ( not ( = ?auto_120433 ?auto_120431 ) ) ( not ( = ?auto_120433 ?auto_120430 ) ) ( not ( = ?auto_120435 ?auto_120434 ) ) ( not ( = ?auto_120435 ?auto_120431 ) ) ( not ( = ?auto_120435 ?auto_120430 ) ) ( not ( = ?auto_120428 ?auto_120433 ) ) ( not ( = ?auto_120428 ?auto_120435 ) ) ( not ( = ?auto_120429 ?auto_120433 ) ) ( not ( = ?auto_120429 ?auto_120435 ) ) ( ON ?auto_120428 ?auto_120432 ) ( not ( = ?auto_120428 ?auto_120432 ) ) ( not ( = ?auto_120429 ?auto_120432 ) ) ( not ( = ?auto_120430 ?auto_120432 ) ) ( not ( = ?auto_120431 ?auto_120432 ) ) ( not ( = ?auto_120434 ?auto_120432 ) ) ( not ( = ?auto_120433 ?auto_120432 ) ) ( not ( = ?auto_120435 ?auto_120432 ) ) ( ON ?auto_120429 ?auto_120428 ) ( ON-TABLE ?auto_120432 ) ( ON ?auto_120430 ?auto_120429 ) ( ON ?auto_120431 ?auto_120430 ) ( ON ?auto_120434 ?auto_120431 ) ( CLEAR ?auto_120434 ) ( HOLDING ?auto_120435 ) ( CLEAR ?auto_120433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120433 ?auto_120435 )
      ( MAKE-4PILE ?auto_120428 ?auto_120429 ?auto_120430 ?auto_120431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120436 - BLOCK
      ?auto_120437 - BLOCK
      ?auto_120438 - BLOCK
      ?auto_120439 - BLOCK
    )
    :vars
    (
      ?auto_120440 - BLOCK
      ?auto_120442 - BLOCK
      ?auto_120443 - BLOCK
      ?auto_120441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120436 ?auto_120437 ) ) ( not ( = ?auto_120436 ?auto_120438 ) ) ( not ( = ?auto_120436 ?auto_120439 ) ) ( not ( = ?auto_120437 ?auto_120438 ) ) ( not ( = ?auto_120437 ?auto_120439 ) ) ( not ( = ?auto_120438 ?auto_120439 ) ) ( not ( = ?auto_120436 ?auto_120440 ) ) ( not ( = ?auto_120437 ?auto_120440 ) ) ( not ( = ?auto_120438 ?auto_120440 ) ) ( not ( = ?auto_120439 ?auto_120440 ) ) ( ON-TABLE ?auto_120442 ) ( not ( = ?auto_120442 ?auto_120443 ) ) ( not ( = ?auto_120442 ?auto_120440 ) ) ( not ( = ?auto_120442 ?auto_120439 ) ) ( not ( = ?auto_120442 ?auto_120438 ) ) ( not ( = ?auto_120443 ?auto_120440 ) ) ( not ( = ?auto_120443 ?auto_120439 ) ) ( not ( = ?auto_120443 ?auto_120438 ) ) ( not ( = ?auto_120436 ?auto_120442 ) ) ( not ( = ?auto_120436 ?auto_120443 ) ) ( not ( = ?auto_120437 ?auto_120442 ) ) ( not ( = ?auto_120437 ?auto_120443 ) ) ( ON ?auto_120436 ?auto_120441 ) ( not ( = ?auto_120436 ?auto_120441 ) ) ( not ( = ?auto_120437 ?auto_120441 ) ) ( not ( = ?auto_120438 ?auto_120441 ) ) ( not ( = ?auto_120439 ?auto_120441 ) ) ( not ( = ?auto_120440 ?auto_120441 ) ) ( not ( = ?auto_120442 ?auto_120441 ) ) ( not ( = ?auto_120443 ?auto_120441 ) ) ( ON ?auto_120437 ?auto_120436 ) ( ON-TABLE ?auto_120441 ) ( ON ?auto_120438 ?auto_120437 ) ( ON ?auto_120439 ?auto_120438 ) ( ON ?auto_120440 ?auto_120439 ) ( CLEAR ?auto_120442 ) ( ON ?auto_120443 ?auto_120440 ) ( CLEAR ?auto_120443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120441 ?auto_120436 ?auto_120437 ?auto_120438 ?auto_120439 ?auto_120440 )
      ( MAKE-4PILE ?auto_120436 ?auto_120437 ?auto_120438 ?auto_120439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120444 - BLOCK
      ?auto_120445 - BLOCK
      ?auto_120446 - BLOCK
      ?auto_120447 - BLOCK
    )
    :vars
    (
      ?auto_120448 - BLOCK
      ?auto_120449 - BLOCK
      ?auto_120451 - BLOCK
      ?auto_120450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120444 ?auto_120445 ) ) ( not ( = ?auto_120444 ?auto_120446 ) ) ( not ( = ?auto_120444 ?auto_120447 ) ) ( not ( = ?auto_120445 ?auto_120446 ) ) ( not ( = ?auto_120445 ?auto_120447 ) ) ( not ( = ?auto_120446 ?auto_120447 ) ) ( not ( = ?auto_120444 ?auto_120448 ) ) ( not ( = ?auto_120445 ?auto_120448 ) ) ( not ( = ?auto_120446 ?auto_120448 ) ) ( not ( = ?auto_120447 ?auto_120448 ) ) ( not ( = ?auto_120449 ?auto_120451 ) ) ( not ( = ?auto_120449 ?auto_120448 ) ) ( not ( = ?auto_120449 ?auto_120447 ) ) ( not ( = ?auto_120449 ?auto_120446 ) ) ( not ( = ?auto_120451 ?auto_120448 ) ) ( not ( = ?auto_120451 ?auto_120447 ) ) ( not ( = ?auto_120451 ?auto_120446 ) ) ( not ( = ?auto_120444 ?auto_120449 ) ) ( not ( = ?auto_120444 ?auto_120451 ) ) ( not ( = ?auto_120445 ?auto_120449 ) ) ( not ( = ?auto_120445 ?auto_120451 ) ) ( ON ?auto_120444 ?auto_120450 ) ( not ( = ?auto_120444 ?auto_120450 ) ) ( not ( = ?auto_120445 ?auto_120450 ) ) ( not ( = ?auto_120446 ?auto_120450 ) ) ( not ( = ?auto_120447 ?auto_120450 ) ) ( not ( = ?auto_120448 ?auto_120450 ) ) ( not ( = ?auto_120449 ?auto_120450 ) ) ( not ( = ?auto_120451 ?auto_120450 ) ) ( ON ?auto_120445 ?auto_120444 ) ( ON-TABLE ?auto_120450 ) ( ON ?auto_120446 ?auto_120445 ) ( ON ?auto_120447 ?auto_120446 ) ( ON ?auto_120448 ?auto_120447 ) ( ON ?auto_120451 ?auto_120448 ) ( CLEAR ?auto_120451 ) ( HOLDING ?auto_120449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120449 )
      ( MAKE-4PILE ?auto_120444 ?auto_120445 ?auto_120446 ?auto_120447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_120452 - BLOCK
      ?auto_120453 - BLOCK
      ?auto_120454 - BLOCK
      ?auto_120455 - BLOCK
    )
    :vars
    (
      ?auto_120456 - BLOCK
      ?auto_120458 - BLOCK
      ?auto_120459 - BLOCK
      ?auto_120457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120452 ?auto_120453 ) ) ( not ( = ?auto_120452 ?auto_120454 ) ) ( not ( = ?auto_120452 ?auto_120455 ) ) ( not ( = ?auto_120453 ?auto_120454 ) ) ( not ( = ?auto_120453 ?auto_120455 ) ) ( not ( = ?auto_120454 ?auto_120455 ) ) ( not ( = ?auto_120452 ?auto_120456 ) ) ( not ( = ?auto_120453 ?auto_120456 ) ) ( not ( = ?auto_120454 ?auto_120456 ) ) ( not ( = ?auto_120455 ?auto_120456 ) ) ( not ( = ?auto_120458 ?auto_120459 ) ) ( not ( = ?auto_120458 ?auto_120456 ) ) ( not ( = ?auto_120458 ?auto_120455 ) ) ( not ( = ?auto_120458 ?auto_120454 ) ) ( not ( = ?auto_120459 ?auto_120456 ) ) ( not ( = ?auto_120459 ?auto_120455 ) ) ( not ( = ?auto_120459 ?auto_120454 ) ) ( not ( = ?auto_120452 ?auto_120458 ) ) ( not ( = ?auto_120452 ?auto_120459 ) ) ( not ( = ?auto_120453 ?auto_120458 ) ) ( not ( = ?auto_120453 ?auto_120459 ) ) ( ON ?auto_120452 ?auto_120457 ) ( not ( = ?auto_120452 ?auto_120457 ) ) ( not ( = ?auto_120453 ?auto_120457 ) ) ( not ( = ?auto_120454 ?auto_120457 ) ) ( not ( = ?auto_120455 ?auto_120457 ) ) ( not ( = ?auto_120456 ?auto_120457 ) ) ( not ( = ?auto_120458 ?auto_120457 ) ) ( not ( = ?auto_120459 ?auto_120457 ) ) ( ON ?auto_120453 ?auto_120452 ) ( ON-TABLE ?auto_120457 ) ( ON ?auto_120454 ?auto_120453 ) ( ON ?auto_120455 ?auto_120454 ) ( ON ?auto_120456 ?auto_120455 ) ( ON ?auto_120459 ?auto_120456 ) ( ON ?auto_120458 ?auto_120459 ) ( CLEAR ?auto_120458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120457 ?auto_120452 ?auto_120453 ?auto_120454 ?auto_120455 ?auto_120456 ?auto_120459 )
      ( MAKE-4PILE ?auto_120452 ?auto_120453 ?auto_120454 ?auto_120455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120462 - BLOCK
      ?auto_120463 - BLOCK
    )
    :vars
    (
      ?auto_120464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120464 ?auto_120463 ) ( CLEAR ?auto_120464 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120462 ) ( ON ?auto_120463 ?auto_120462 ) ( not ( = ?auto_120462 ?auto_120463 ) ) ( not ( = ?auto_120462 ?auto_120464 ) ) ( not ( = ?auto_120463 ?auto_120464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120464 ?auto_120463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120465 - BLOCK
      ?auto_120466 - BLOCK
    )
    :vars
    (
      ?auto_120467 - BLOCK
      ?auto_120468 - BLOCK
      ?auto_120469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120467 ?auto_120466 ) ( CLEAR ?auto_120467 ) ( ON-TABLE ?auto_120465 ) ( ON ?auto_120466 ?auto_120465 ) ( not ( = ?auto_120465 ?auto_120466 ) ) ( not ( = ?auto_120465 ?auto_120467 ) ) ( not ( = ?auto_120466 ?auto_120467 ) ) ( HOLDING ?auto_120468 ) ( CLEAR ?auto_120469 ) ( not ( = ?auto_120465 ?auto_120468 ) ) ( not ( = ?auto_120465 ?auto_120469 ) ) ( not ( = ?auto_120466 ?auto_120468 ) ) ( not ( = ?auto_120466 ?auto_120469 ) ) ( not ( = ?auto_120467 ?auto_120468 ) ) ( not ( = ?auto_120467 ?auto_120469 ) ) ( not ( = ?auto_120468 ?auto_120469 ) ) )
    :subtasks
    ( ( !STACK ?auto_120468 ?auto_120469 )
      ( MAKE-2PILE ?auto_120465 ?auto_120466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120470 - BLOCK
      ?auto_120471 - BLOCK
    )
    :vars
    (
      ?auto_120474 - BLOCK
      ?auto_120472 - BLOCK
      ?auto_120473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120474 ?auto_120471 ) ( ON-TABLE ?auto_120470 ) ( ON ?auto_120471 ?auto_120470 ) ( not ( = ?auto_120470 ?auto_120471 ) ) ( not ( = ?auto_120470 ?auto_120474 ) ) ( not ( = ?auto_120471 ?auto_120474 ) ) ( CLEAR ?auto_120472 ) ( not ( = ?auto_120470 ?auto_120473 ) ) ( not ( = ?auto_120470 ?auto_120472 ) ) ( not ( = ?auto_120471 ?auto_120473 ) ) ( not ( = ?auto_120471 ?auto_120472 ) ) ( not ( = ?auto_120474 ?auto_120473 ) ) ( not ( = ?auto_120474 ?auto_120472 ) ) ( not ( = ?auto_120473 ?auto_120472 ) ) ( ON ?auto_120473 ?auto_120474 ) ( CLEAR ?auto_120473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120470 ?auto_120471 ?auto_120474 )
      ( MAKE-2PILE ?auto_120470 ?auto_120471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120475 - BLOCK
      ?auto_120476 - BLOCK
    )
    :vars
    (
      ?auto_120479 - BLOCK
      ?auto_120477 - BLOCK
      ?auto_120478 - BLOCK
      ?auto_120481 - BLOCK
      ?auto_120480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120479 ?auto_120476 ) ( ON-TABLE ?auto_120475 ) ( ON ?auto_120476 ?auto_120475 ) ( not ( = ?auto_120475 ?auto_120476 ) ) ( not ( = ?auto_120475 ?auto_120479 ) ) ( not ( = ?auto_120476 ?auto_120479 ) ) ( not ( = ?auto_120475 ?auto_120477 ) ) ( not ( = ?auto_120475 ?auto_120478 ) ) ( not ( = ?auto_120476 ?auto_120477 ) ) ( not ( = ?auto_120476 ?auto_120478 ) ) ( not ( = ?auto_120479 ?auto_120477 ) ) ( not ( = ?auto_120479 ?auto_120478 ) ) ( not ( = ?auto_120477 ?auto_120478 ) ) ( ON ?auto_120477 ?auto_120479 ) ( CLEAR ?auto_120477 ) ( HOLDING ?auto_120478 ) ( CLEAR ?auto_120481 ) ( ON-TABLE ?auto_120480 ) ( ON ?auto_120481 ?auto_120480 ) ( not ( = ?auto_120480 ?auto_120481 ) ) ( not ( = ?auto_120480 ?auto_120478 ) ) ( not ( = ?auto_120481 ?auto_120478 ) ) ( not ( = ?auto_120475 ?auto_120481 ) ) ( not ( = ?auto_120475 ?auto_120480 ) ) ( not ( = ?auto_120476 ?auto_120481 ) ) ( not ( = ?auto_120476 ?auto_120480 ) ) ( not ( = ?auto_120479 ?auto_120481 ) ) ( not ( = ?auto_120479 ?auto_120480 ) ) ( not ( = ?auto_120477 ?auto_120481 ) ) ( not ( = ?auto_120477 ?auto_120480 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120480 ?auto_120481 ?auto_120478 )
      ( MAKE-2PILE ?auto_120475 ?auto_120476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120482 - BLOCK
      ?auto_120483 - BLOCK
    )
    :vars
    (
      ?auto_120488 - BLOCK
      ?auto_120487 - BLOCK
      ?auto_120486 - BLOCK
      ?auto_120485 - BLOCK
      ?auto_120484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120488 ?auto_120483 ) ( ON-TABLE ?auto_120482 ) ( ON ?auto_120483 ?auto_120482 ) ( not ( = ?auto_120482 ?auto_120483 ) ) ( not ( = ?auto_120482 ?auto_120488 ) ) ( not ( = ?auto_120483 ?auto_120488 ) ) ( not ( = ?auto_120482 ?auto_120487 ) ) ( not ( = ?auto_120482 ?auto_120486 ) ) ( not ( = ?auto_120483 ?auto_120487 ) ) ( not ( = ?auto_120483 ?auto_120486 ) ) ( not ( = ?auto_120488 ?auto_120487 ) ) ( not ( = ?auto_120488 ?auto_120486 ) ) ( not ( = ?auto_120487 ?auto_120486 ) ) ( ON ?auto_120487 ?auto_120488 ) ( CLEAR ?auto_120485 ) ( ON-TABLE ?auto_120484 ) ( ON ?auto_120485 ?auto_120484 ) ( not ( = ?auto_120484 ?auto_120485 ) ) ( not ( = ?auto_120484 ?auto_120486 ) ) ( not ( = ?auto_120485 ?auto_120486 ) ) ( not ( = ?auto_120482 ?auto_120485 ) ) ( not ( = ?auto_120482 ?auto_120484 ) ) ( not ( = ?auto_120483 ?auto_120485 ) ) ( not ( = ?auto_120483 ?auto_120484 ) ) ( not ( = ?auto_120488 ?auto_120485 ) ) ( not ( = ?auto_120488 ?auto_120484 ) ) ( not ( = ?auto_120487 ?auto_120485 ) ) ( not ( = ?auto_120487 ?auto_120484 ) ) ( ON ?auto_120486 ?auto_120487 ) ( CLEAR ?auto_120486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120482 ?auto_120483 ?auto_120488 ?auto_120487 )
      ( MAKE-2PILE ?auto_120482 ?auto_120483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120489 - BLOCK
      ?auto_120490 - BLOCK
    )
    :vars
    (
      ?auto_120493 - BLOCK
      ?auto_120491 - BLOCK
      ?auto_120492 - BLOCK
      ?auto_120494 - BLOCK
      ?auto_120495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120493 ?auto_120490 ) ( ON-TABLE ?auto_120489 ) ( ON ?auto_120490 ?auto_120489 ) ( not ( = ?auto_120489 ?auto_120490 ) ) ( not ( = ?auto_120489 ?auto_120493 ) ) ( not ( = ?auto_120490 ?auto_120493 ) ) ( not ( = ?auto_120489 ?auto_120491 ) ) ( not ( = ?auto_120489 ?auto_120492 ) ) ( not ( = ?auto_120490 ?auto_120491 ) ) ( not ( = ?auto_120490 ?auto_120492 ) ) ( not ( = ?auto_120493 ?auto_120491 ) ) ( not ( = ?auto_120493 ?auto_120492 ) ) ( not ( = ?auto_120491 ?auto_120492 ) ) ( ON ?auto_120491 ?auto_120493 ) ( ON-TABLE ?auto_120494 ) ( not ( = ?auto_120494 ?auto_120495 ) ) ( not ( = ?auto_120494 ?auto_120492 ) ) ( not ( = ?auto_120495 ?auto_120492 ) ) ( not ( = ?auto_120489 ?auto_120495 ) ) ( not ( = ?auto_120489 ?auto_120494 ) ) ( not ( = ?auto_120490 ?auto_120495 ) ) ( not ( = ?auto_120490 ?auto_120494 ) ) ( not ( = ?auto_120493 ?auto_120495 ) ) ( not ( = ?auto_120493 ?auto_120494 ) ) ( not ( = ?auto_120491 ?auto_120495 ) ) ( not ( = ?auto_120491 ?auto_120494 ) ) ( ON ?auto_120492 ?auto_120491 ) ( CLEAR ?auto_120492 ) ( HOLDING ?auto_120495 ) ( CLEAR ?auto_120494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120494 ?auto_120495 )
      ( MAKE-2PILE ?auto_120489 ?auto_120490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120496 - BLOCK
      ?auto_120497 - BLOCK
    )
    :vars
    (
      ?auto_120499 - BLOCK
      ?auto_120501 - BLOCK
      ?auto_120502 - BLOCK
      ?auto_120500 - BLOCK
      ?auto_120498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120499 ?auto_120497 ) ( ON-TABLE ?auto_120496 ) ( ON ?auto_120497 ?auto_120496 ) ( not ( = ?auto_120496 ?auto_120497 ) ) ( not ( = ?auto_120496 ?auto_120499 ) ) ( not ( = ?auto_120497 ?auto_120499 ) ) ( not ( = ?auto_120496 ?auto_120501 ) ) ( not ( = ?auto_120496 ?auto_120502 ) ) ( not ( = ?auto_120497 ?auto_120501 ) ) ( not ( = ?auto_120497 ?auto_120502 ) ) ( not ( = ?auto_120499 ?auto_120501 ) ) ( not ( = ?auto_120499 ?auto_120502 ) ) ( not ( = ?auto_120501 ?auto_120502 ) ) ( ON ?auto_120501 ?auto_120499 ) ( ON-TABLE ?auto_120500 ) ( not ( = ?auto_120500 ?auto_120498 ) ) ( not ( = ?auto_120500 ?auto_120502 ) ) ( not ( = ?auto_120498 ?auto_120502 ) ) ( not ( = ?auto_120496 ?auto_120498 ) ) ( not ( = ?auto_120496 ?auto_120500 ) ) ( not ( = ?auto_120497 ?auto_120498 ) ) ( not ( = ?auto_120497 ?auto_120500 ) ) ( not ( = ?auto_120499 ?auto_120498 ) ) ( not ( = ?auto_120499 ?auto_120500 ) ) ( not ( = ?auto_120501 ?auto_120498 ) ) ( not ( = ?auto_120501 ?auto_120500 ) ) ( ON ?auto_120502 ?auto_120501 ) ( CLEAR ?auto_120500 ) ( ON ?auto_120498 ?auto_120502 ) ( CLEAR ?auto_120498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120496 ?auto_120497 ?auto_120499 ?auto_120501 ?auto_120502 )
      ( MAKE-2PILE ?auto_120496 ?auto_120497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120503 - BLOCK
      ?auto_120504 - BLOCK
    )
    :vars
    (
      ?auto_120507 - BLOCK
      ?auto_120508 - BLOCK
      ?auto_120506 - BLOCK
      ?auto_120505 - BLOCK
      ?auto_120509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120507 ?auto_120504 ) ( ON-TABLE ?auto_120503 ) ( ON ?auto_120504 ?auto_120503 ) ( not ( = ?auto_120503 ?auto_120504 ) ) ( not ( = ?auto_120503 ?auto_120507 ) ) ( not ( = ?auto_120504 ?auto_120507 ) ) ( not ( = ?auto_120503 ?auto_120508 ) ) ( not ( = ?auto_120503 ?auto_120506 ) ) ( not ( = ?auto_120504 ?auto_120508 ) ) ( not ( = ?auto_120504 ?auto_120506 ) ) ( not ( = ?auto_120507 ?auto_120508 ) ) ( not ( = ?auto_120507 ?auto_120506 ) ) ( not ( = ?auto_120508 ?auto_120506 ) ) ( ON ?auto_120508 ?auto_120507 ) ( not ( = ?auto_120505 ?auto_120509 ) ) ( not ( = ?auto_120505 ?auto_120506 ) ) ( not ( = ?auto_120509 ?auto_120506 ) ) ( not ( = ?auto_120503 ?auto_120509 ) ) ( not ( = ?auto_120503 ?auto_120505 ) ) ( not ( = ?auto_120504 ?auto_120509 ) ) ( not ( = ?auto_120504 ?auto_120505 ) ) ( not ( = ?auto_120507 ?auto_120509 ) ) ( not ( = ?auto_120507 ?auto_120505 ) ) ( not ( = ?auto_120508 ?auto_120509 ) ) ( not ( = ?auto_120508 ?auto_120505 ) ) ( ON ?auto_120506 ?auto_120508 ) ( ON ?auto_120509 ?auto_120506 ) ( CLEAR ?auto_120509 ) ( HOLDING ?auto_120505 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120505 )
      ( MAKE-2PILE ?auto_120503 ?auto_120504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120510 - BLOCK
      ?auto_120511 - BLOCK
    )
    :vars
    (
      ?auto_120513 - BLOCK
      ?auto_120512 - BLOCK
      ?auto_120515 - BLOCK
      ?auto_120516 - BLOCK
      ?auto_120514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120513 ?auto_120511 ) ( ON-TABLE ?auto_120510 ) ( ON ?auto_120511 ?auto_120510 ) ( not ( = ?auto_120510 ?auto_120511 ) ) ( not ( = ?auto_120510 ?auto_120513 ) ) ( not ( = ?auto_120511 ?auto_120513 ) ) ( not ( = ?auto_120510 ?auto_120512 ) ) ( not ( = ?auto_120510 ?auto_120515 ) ) ( not ( = ?auto_120511 ?auto_120512 ) ) ( not ( = ?auto_120511 ?auto_120515 ) ) ( not ( = ?auto_120513 ?auto_120512 ) ) ( not ( = ?auto_120513 ?auto_120515 ) ) ( not ( = ?auto_120512 ?auto_120515 ) ) ( ON ?auto_120512 ?auto_120513 ) ( not ( = ?auto_120516 ?auto_120514 ) ) ( not ( = ?auto_120516 ?auto_120515 ) ) ( not ( = ?auto_120514 ?auto_120515 ) ) ( not ( = ?auto_120510 ?auto_120514 ) ) ( not ( = ?auto_120510 ?auto_120516 ) ) ( not ( = ?auto_120511 ?auto_120514 ) ) ( not ( = ?auto_120511 ?auto_120516 ) ) ( not ( = ?auto_120513 ?auto_120514 ) ) ( not ( = ?auto_120513 ?auto_120516 ) ) ( not ( = ?auto_120512 ?auto_120514 ) ) ( not ( = ?auto_120512 ?auto_120516 ) ) ( ON ?auto_120515 ?auto_120512 ) ( ON ?auto_120514 ?auto_120515 ) ( ON ?auto_120516 ?auto_120514 ) ( CLEAR ?auto_120516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120510 ?auto_120511 ?auto_120513 ?auto_120512 ?auto_120515 ?auto_120514 )
      ( MAKE-2PILE ?auto_120510 ?auto_120511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120517 - BLOCK
      ?auto_120518 - BLOCK
    )
    :vars
    (
      ?auto_120523 - BLOCK
      ?auto_120520 - BLOCK
      ?auto_120519 - BLOCK
      ?auto_120522 - BLOCK
      ?auto_120521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120523 ?auto_120518 ) ( ON-TABLE ?auto_120517 ) ( ON ?auto_120518 ?auto_120517 ) ( not ( = ?auto_120517 ?auto_120518 ) ) ( not ( = ?auto_120517 ?auto_120523 ) ) ( not ( = ?auto_120518 ?auto_120523 ) ) ( not ( = ?auto_120517 ?auto_120520 ) ) ( not ( = ?auto_120517 ?auto_120519 ) ) ( not ( = ?auto_120518 ?auto_120520 ) ) ( not ( = ?auto_120518 ?auto_120519 ) ) ( not ( = ?auto_120523 ?auto_120520 ) ) ( not ( = ?auto_120523 ?auto_120519 ) ) ( not ( = ?auto_120520 ?auto_120519 ) ) ( ON ?auto_120520 ?auto_120523 ) ( not ( = ?auto_120522 ?auto_120521 ) ) ( not ( = ?auto_120522 ?auto_120519 ) ) ( not ( = ?auto_120521 ?auto_120519 ) ) ( not ( = ?auto_120517 ?auto_120521 ) ) ( not ( = ?auto_120517 ?auto_120522 ) ) ( not ( = ?auto_120518 ?auto_120521 ) ) ( not ( = ?auto_120518 ?auto_120522 ) ) ( not ( = ?auto_120523 ?auto_120521 ) ) ( not ( = ?auto_120523 ?auto_120522 ) ) ( not ( = ?auto_120520 ?auto_120521 ) ) ( not ( = ?auto_120520 ?auto_120522 ) ) ( ON ?auto_120519 ?auto_120520 ) ( ON ?auto_120521 ?auto_120519 ) ( HOLDING ?auto_120522 ) ( CLEAR ?auto_120521 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120517 ?auto_120518 ?auto_120523 ?auto_120520 ?auto_120519 ?auto_120521 ?auto_120522 )
      ( MAKE-2PILE ?auto_120517 ?auto_120518 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120524 - BLOCK
      ?auto_120525 - BLOCK
    )
    :vars
    (
      ?auto_120527 - BLOCK
      ?auto_120530 - BLOCK
      ?auto_120526 - BLOCK
      ?auto_120529 - BLOCK
      ?auto_120528 - BLOCK
      ?auto_120531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120527 ?auto_120525 ) ( ON-TABLE ?auto_120524 ) ( ON ?auto_120525 ?auto_120524 ) ( not ( = ?auto_120524 ?auto_120525 ) ) ( not ( = ?auto_120524 ?auto_120527 ) ) ( not ( = ?auto_120525 ?auto_120527 ) ) ( not ( = ?auto_120524 ?auto_120530 ) ) ( not ( = ?auto_120524 ?auto_120526 ) ) ( not ( = ?auto_120525 ?auto_120530 ) ) ( not ( = ?auto_120525 ?auto_120526 ) ) ( not ( = ?auto_120527 ?auto_120530 ) ) ( not ( = ?auto_120527 ?auto_120526 ) ) ( not ( = ?auto_120530 ?auto_120526 ) ) ( ON ?auto_120530 ?auto_120527 ) ( not ( = ?auto_120529 ?auto_120528 ) ) ( not ( = ?auto_120529 ?auto_120526 ) ) ( not ( = ?auto_120528 ?auto_120526 ) ) ( not ( = ?auto_120524 ?auto_120528 ) ) ( not ( = ?auto_120524 ?auto_120529 ) ) ( not ( = ?auto_120525 ?auto_120528 ) ) ( not ( = ?auto_120525 ?auto_120529 ) ) ( not ( = ?auto_120527 ?auto_120528 ) ) ( not ( = ?auto_120527 ?auto_120529 ) ) ( not ( = ?auto_120530 ?auto_120528 ) ) ( not ( = ?auto_120530 ?auto_120529 ) ) ( ON ?auto_120526 ?auto_120530 ) ( ON ?auto_120528 ?auto_120526 ) ( CLEAR ?auto_120528 ) ( ON ?auto_120529 ?auto_120531 ) ( CLEAR ?auto_120529 ) ( HAND-EMPTY ) ( not ( = ?auto_120524 ?auto_120531 ) ) ( not ( = ?auto_120525 ?auto_120531 ) ) ( not ( = ?auto_120527 ?auto_120531 ) ) ( not ( = ?auto_120530 ?auto_120531 ) ) ( not ( = ?auto_120526 ?auto_120531 ) ) ( not ( = ?auto_120529 ?auto_120531 ) ) ( not ( = ?auto_120528 ?auto_120531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120529 ?auto_120531 )
      ( MAKE-2PILE ?auto_120524 ?auto_120525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120532 - BLOCK
      ?auto_120533 - BLOCK
    )
    :vars
    (
      ?auto_120535 - BLOCK
      ?auto_120538 - BLOCK
      ?auto_120539 - BLOCK
      ?auto_120536 - BLOCK
      ?auto_120534 - BLOCK
      ?auto_120537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120535 ?auto_120533 ) ( ON-TABLE ?auto_120532 ) ( ON ?auto_120533 ?auto_120532 ) ( not ( = ?auto_120532 ?auto_120533 ) ) ( not ( = ?auto_120532 ?auto_120535 ) ) ( not ( = ?auto_120533 ?auto_120535 ) ) ( not ( = ?auto_120532 ?auto_120538 ) ) ( not ( = ?auto_120532 ?auto_120539 ) ) ( not ( = ?auto_120533 ?auto_120538 ) ) ( not ( = ?auto_120533 ?auto_120539 ) ) ( not ( = ?auto_120535 ?auto_120538 ) ) ( not ( = ?auto_120535 ?auto_120539 ) ) ( not ( = ?auto_120538 ?auto_120539 ) ) ( ON ?auto_120538 ?auto_120535 ) ( not ( = ?auto_120536 ?auto_120534 ) ) ( not ( = ?auto_120536 ?auto_120539 ) ) ( not ( = ?auto_120534 ?auto_120539 ) ) ( not ( = ?auto_120532 ?auto_120534 ) ) ( not ( = ?auto_120532 ?auto_120536 ) ) ( not ( = ?auto_120533 ?auto_120534 ) ) ( not ( = ?auto_120533 ?auto_120536 ) ) ( not ( = ?auto_120535 ?auto_120534 ) ) ( not ( = ?auto_120535 ?auto_120536 ) ) ( not ( = ?auto_120538 ?auto_120534 ) ) ( not ( = ?auto_120538 ?auto_120536 ) ) ( ON ?auto_120539 ?auto_120538 ) ( ON ?auto_120536 ?auto_120537 ) ( CLEAR ?auto_120536 ) ( not ( = ?auto_120532 ?auto_120537 ) ) ( not ( = ?auto_120533 ?auto_120537 ) ) ( not ( = ?auto_120535 ?auto_120537 ) ) ( not ( = ?auto_120538 ?auto_120537 ) ) ( not ( = ?auto_120539 ?auto_120537 ) ) ( not ( = ?auto_120536 ?auto_120537 ) ) ( not ( = ?auto_120534 ?auto_120537 ) ) ( HOLDING ?auto_120534 ) ( CLEAR ?auto_120539 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120532 ?auto_120533 ?auto_120535 ?auto_120538 ?auto_120539 ?auto_120534 )
      ( MAKE-2PILE ?auto_120532 ?auto_120533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120540 - BLOCK
      ?auto_120541 - BLOCK
    )
    :vars
    (
      ?auto_120542 - BLOCK
      ?auto_120546 - BLOCK
      ?auto_120544 - BLOCK
      ?auto_120547 - BLOCK
      ?auto_120545 - BLOCK
      ?auto_120543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120542 ?auto_120541 ) ( ON-TABLE ?auto_120540 ) ( ON ?auto_120541 ?auto_120540 ) ( not ( = ?auto_120540 ?auto_120541 ) ) ( not ( = ?auto_120540 ?auto_120542 ) ) ( not ( = ?auto_120541 ?auto_120542 ) ) ( not ( = ?auto_120540 ?auto_120546 ) ) ( not ( = ?auto_120540 ?auto_120544 ) ) ( not ( = ?auto_120541 ?auto_120546 ) ) ( not ( = ?auto_120541 ?auto_120544 ) ) ( not ( = ?auto_120542 ?auto_120546 ) ) ( not ( = ?auto_120542 ?auto_120544 ) ) ( not ( = ?auto_120546 ?auto_120544 ) ) ( ON ?auto_120546 ?auto_120542 ) ( not ( = ?auto_120547 ?auto_120545 ) ) ( not ( = ?auto_120547 ?auto_120544 ) ) ( not ( = ?auto_120545 ?auto_120544 ) ) ( not ( = ?auto_120540 ?auto_120545 ) ) ( not ( = ?auto_120540 ?auto_120547 ) ) ( not ( = ?auto_120541 ?auto_120545 ) ) ( not ( = ?auto_120541 ?auto_120547 ) ) ( not ( = ?auto_120542 ?auto_120545 ) ) ( not ( = ?auto_120542 ?auto_120547 ) ) ( not ( = ?auto_120546 ?auto_120545 ) ) ( not ( = ?auto_120546 ?auto_120547 ) ) ( ON ?auto_120544 ?auto_120546 ) ( ON ?auto_120547 ?auto_120543 ) ( not ( = ?auto_120540 ?auto_120543 ) ) ( not ( = ?auto_120541 ?auto_120543 ) ) ( not ( = ?auto_120542 ?auto_120543 ) ) ( not ( = ?auto_120546 ?auto_120543 ) ) ( not ( = ?auto_120544 ?auto_120543 ) ) ( not ( = ?auto_120547 ?auto_120543 ) ) ( not ( = ?auto_120545 ?auto_120543 ) ) ( CLEAR ?auto_120544 ) ( ON ?auto_120545 ?auto_120547 ) ( CLEAR ?auto_120545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120543 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120543 ?auto_120547 )
      ( MAKE-2PILE ?auto_120540 ?auto_120541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120548 - BLOCK
      ?auto_120549 - BLOCK
    )
    :vars
    (
      ?auto_120551 - BLOCK
      ?auto_120554 - BLOCK
      ?auto_120550 - BLOCK
      ?auto_120555 - BLOCK
      ?auto_120552 - BLOCK
      ?auto_120553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120551 ?auto_120549 ) ( ON-TABLE ?auto_120548 ) ( ON ?auto_120549 ?auto_120548 ) ( not ( = ?auto_120548 ?auto_120549 ) ) ( not ( = ?auto_120548 ?auto_120551 ) ) ( not ( = ?auto_120549 ?auto_120551 ) ) ( not ( = ?auto_120548 ?auto_120554 ) ) ( not ( = ?auto_120548 ?auto_120550 ) ) ( not ( = ?auto_120549 ?auto_120554 ) ) ( not ( = ?auto_120549 ?auto_120550 ) ) ( not ( = ?auto_120551 ?auto_120554 ) ) ( not ( = ?auto_120551 ?auto_120550 ) ) ( not ( = ?auto_120554 ?auto_120550 ) ) ( ON ?auto_120554 ?auto_120551 ) ( not ( = ?auto_120555 ?auto_120552 ) ) ( not ( = ?auto_120555 ?auto_120550 ) ) ( not ( = ?auto_120552 ?auto_120550 ) ) ( not ( = ?auto_120548 ?auto_120552 ) ) ( not ( = ?auto_120548 ?auto_120555 ) ) ( not ( = ?auto_120549 ?auto_120552 ) ) ( not ( = ?auto_120549 ?auto_120555 ) ) ( not ( = ?auto_120551 ?auto_120552 ) ) ( not ( = ?auto_120551 ?auto_120555 ) ) ( not ( = ?auto_120554 ?auto_120552 ) ) ( not ( = ?auto_120554 ?auto_120555 ) ) ( ON ?auto_120555 ?auto_120553 ) ( not ( = ?auto_120548 ?auto_120553 ) ) ( not ( = ?auto_120549 ?auto_120553 ) ) ( not ( = ?auto_120551 ?auto_120553 ) ) ( not ( = ?auto_120554 ?auto_120553 ) ) ( not ( = ?auto_120550 ?auto_120553 ) ) ( not ( = ?auto_120555 ?auto_120553 ) ) ( not ( = ?auto_120552 ?auto_120553 ) ) ( ON ?auto_120552 ?auto_120555 ) ( CLEAR ?auto_120552 ) ( ON-TABLE ?auto_120553 ) ( HOLDING ?auto_120550 ) ( CLEAR ?auto_120554 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120548 ?auto_120549 ?auto_120551 ?auto_120554 ?auto_120550 )
      ( MAKE-2PILE ?auto_120548 ?auto_120549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120556 - BLOCK
      ?auto_120557 - BLOCK
    )
    :vars
    (
      ?auto_120563 - BLOCK
      ?auto_120562 - BLOCK
      ?auto_120558 - BLOCK
      ?auto_120561 - BLOCK
      ?auto_120560 - BLOCK
      ?auto_120559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120563 ?auto_120557 ) ( ON-TABLE ?auto_120556 ) ( ON ?auto_120557 ?auto_120556 ) ( not ( = ?auto_120556 ?auto_120557 ) ) ( not ( = ?auto_120556 ?auto_120563 ) ) ( not ( = ?auto_120557 ?auto_120563 ) ) ( not ( = ?auto_120556 ?auto_120562 ) ) ( not ( = ?auto_120556 ?auto_120558 ) ) ( not ( = ?auto_120557 ?auto_120562 ) ) ( not ( = ?auto_120557 ?auto_120558 ) ) ( not ( = ?auto_120563 ?auto_120562 ) ) ( not ( = ?auto_120563 ?auto_120558 ) ) ( not ( = ?auto_120562 ?auto_120558 ) ) ( ON ?auto_120562 ?auto_120563 ) ( not ( = ?auto_120561 ?auto_120560 ) ) ( not ( = ?auto_120561 ?auto_120558 ) ) ( not ( = ?auto_120560 ?auto_120558 ) ) ( not ( = ?auto_120556 ?auto_120560 ) ) ( not ( = ?auto_120556 ?auto_120561 ) ) ( not ( = ?auto_120557 ?auto_120560 ) ) ( not ( = ?auto_120557 ?auto_120561 ) ) ( not ( = ?auto_120563 ?auto_120560 ) ) ( not ( = ?auto_120563 ?auto_120561 ) ) ( not ( = ?auto_120562 ?auto_120560 ) ) ( not ( = ?auto_120562 ?auto_120561 ) ) ( ON ?auto_120561 ?auto_120559 ) ( not ( = ?auto_120556 ?auto_120559 ) ) ( not ( = ?auto_120557 ?auto_120559 ) ) ( not ( = ?auto_120563 ?auto_120559 ) ) ( not ( = ?auto_120562 ?auto_120559 ) ) ( not ( = ?auto_120558 ?auto_120559 ) ) ( not ( = ?auto_120561 ?auto_120559 ) ) ( not ( = ?auto_120560 ?auto_120559 ) ) ( ON ?auto_120560 ?auto_120561 ) ( ON-TABLE ?auto_120559 ) ( CLEAR ?auto_120562 ) ( ON ?auto_120558 ?auto_120560 ) ( CLEAR ?auto_120558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120559 ?auto_120561 ?auto_120560 )
      ( MAKE-2PILE ?auto_120556 ?auto_120557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120564 - BLOCK
      ?auto_120565 - BLOCK
    )
    :vars
    (
      ?auto_120566 - BLOCK
      ?auto_120567 - BLOCK
      ?auto_120568 - BLOCK
      ?auto_120570 - BLOCK
      ?auto_120569 - BLOCK
      ?auto_120571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120566 ?auto_120565 ) ( ON-TABLE ?auto_120564 ) ( ON ?auto_120565 ?auto_120564 ) ( not ( = ?auto_120564 ?auto_120565 ) ) ( not ( = ?auto_120564 ?auto_120566 ) ) ( not ( = ?auto_120565 ?auto_120566 ) ) ( not ( = ?auto_120564 ?auto_120567 ) ) ( not ( = ?auto_120564 ?auto_120568 ) ) ( not ( = ?auto_120565 ?auto_120567 ) ) ( not ( = ?auto_120565 ?auto_120568 ) ) ( not ( = ?auto_120566 ?auto_120567 ) ) ( not ( = ?auto_120566 ?auto_120568 ) ) ( not ( = ?auto_120567 ?auto_120568 ) ) ( not ( = ?auto_120570 ?auto_120569 ) ) ( not ( = ?auto_120570 ?auto_120568 ) ) ( not ( = ?auto_120569 ?auto_120568 ) ) ( not ( = ?auto_120564 ?auto_120569 ) ) ( not ( = ?auto_120564 ?auto_120570 ) ) ( not ( = ?auto_120565 ?auto_120569 ) ) ( not ( = ?auto_120565 ?auto_120570 ) ) ( not ( = ?auto_120566 ?auto_120569 ) ) ( not ( = ?auto_120566 ?auto_120570 ) ) ( not ( = ?auto_120567 ?auto_120569 ) ) ( not ( = ?auto_120567 ?auto_120570 ) ) ( ON ?auto_120570 ?auto_120571 ) ( not ( = ?auto_120564 ?auto_120571 ) ) ( not ( = ?auto_120565 ?auto_120571 ) ) ( not ( = ?auto_120566 ?auto_120571 ) ) ( not ( = ?auto_120567 ?auto_120571 ) ) ( not ( = ?auto_120568 ?auto_120571 ) ) ( not ( = ?auto_120570 ?auto_120571 ) ) ( not ( = ?auto_120569 ?auto_120571 ) ) ( ON ?auto_120569 ?auto_120570 ) ( ON-TABLE ?auto_120571 ) ( ON ?auto_120568 ?auto_120569 ) ( CLEAR ?auto_120568 ) ( HOLDING ?auto_120567 ) ( CLEAR ?auto_120566 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120564 ?auto_120565 ?auto_120566 ?auto_120567 )
      ( MAKE-2PILE ?auto_120564 ?auto_120565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120572 - BLOCK
      ?auto_120573 - BLOCK
    )
    :vars
    (
      ?auto_120575 - BLOCK
      ?auto_120576 - BLOCK
      ?auto_120577 - BLOCK
      ?auto_120574 - BLOCK
      ?auto_120578 - BLOCK
      ?auto_120579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120575 ?auto_120573 ) ( ON-TABLE ?auto_120572 ) ( ON ?auto_120573 ?auto_120572 ) ( not ( = ?auto_120572 ?auto_120573 ) ) ( not ( = ?auto_120572 ?auto_120575 ) ) ( not ( = ?auto_120573 ?auto_120575 ) ) ( not ( = ?auto_120572 ?auto_120576 ) ) ( not ( = ?auto_120572 ?auto_120577 ) ) ( not ( = ?auto_120573 ?auto_120576 ) ) ( not ( = ?auto_120573 ?auto_120577 ) ) ( not ( = ?auto_120575 ?auto_120576 ) ) ( not ( = ?auto_120575 ?auto_120577 ) ) ( not ( = ?auto_120576 ?auto_120577 ) ) ( not ( = ?auto_120574 ?auto_120578 ) ) ( not ( = ?auto_120574 ?auto_120577 ) ) ( not ( = ?auto_120578 ?auto_120577 ) ) ( not ( = ?auto_120572 ?auto_120578 ) ) ( not ( = ?auto_120572 ?auto_120574 ) ) ( not ( = ?auto_120573 ?auto_120578 ) ) ( not ( = ?auto_120573 ?auto_120574 ) ) ( not ( = ?auto_120575 ?auto_120578 ) ) ( not ( = ?auto_120575 ?auto_120574 ) ) ( not ( = ?auto_120576 ?auto_120578 ) ) ( not ( = ?auto_120576 ?auto_120574 ) ) ( ON ?auto_120574 ?auto_120579 ) ( not ( = ?auto_120572 ?auto_120579 ) ) ( not ( = ?auto_120573 ?auto_120579 ) ) ( not ( = ?auto_120575 ?auto_120579 ) ) ( not ( = ?auto_120576 ?auto_120579 ) ) ( not ( = ?auto_120577 ?auto_120579 ) ) ( not ( = ?auto_120574 ?auto_120579 ) ) ( not ( = ?auto_120578 ?auto_120579 ) ) ( ON ?auto_120578 ?auto_120574 ) ( ON-TABLE ?auto_120579 ) ( ON ?auto_120577 ?auto_120578 ) ( CLEAR ?auto_120575 ) ( ON ?auto_120576 ?auto_120577 ) ( CLEAR ?auto_120576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120579 ?auto_120574 ?auto_120578 ?auto_120577 )
      ( MAKE-2PILE ?auto_120572 ?auto_120573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120596 - BLOCK
      ?auto_120597 - BLOCK
    )
    :vars
    (
      ?auto_120600 - BLOCK
      ?auto_120602 - BLOCK
      ?auto_120601 - BLOCK
      ?auto_120599 - BLOCK
      ?auto_120603 - BLOCK
      ?auto_120598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120596 ) ( not ( = ?auto_120596 ?auto_120597 ) ) ( not ( = ?auto_120596 ?auto_120600 ) ) ( not ( = ?auto_120597 ?auto_120600 ) ) ( not ( = ?auto_120596 ?auto_120602 ) ) ( not ( = ?auto_120596 ?auto_120601 ) ) ( not ( = ?auto_120597 ?auto_120602 ) ) ( not ( = ?auto_120597 ?auto_120601 ) ) ( not ( = ?auto_120600 ?auto_120602 ) ) ( not ( = ?auto_120600 ?auto_120601 ) ) ( not ( = ?auto_120602 ?auto_120601 ) ) ( not ( = ?auto_120599 ?auto_120603 ) ) ( not ( = ?auto_120599 ?auto_120601 ) ) ( not ( = ?auto_120603 ?auto_120601 ) ) ( not ( = ?auto_120596 ?auto_120603 ) ) ( not ( = ?auto_120596 ?auto_120599 ) ) ( not ( = ?auto_120597 ?auto_120603 ) ) ( not ( = ?auto_120597 ?auto_120599 ) ) ( not ( = ?auto_120600 ?auto_120603 ) ) ( not ( = ?auto_120600 ?auto_120599 ) ) ( not ( = ?auto_120602 ?auto_120603 ) ) ( not ( = ?auto_120602 ?auto_120599 ) ) ( ON ?auto_120599 ?auto_120598 ) ( not ( = ?auto_120596 ?auto_120598 ) ) ( not ( = ?auto_120597 ?auto_120598 ) ) ( not ( = ?auto_120600 ?auto_120598 ) ) ( not ( = ?auto_120602 ?auto_120598 ) ) ( not ( = ?auto_120601 ?auto_120598 ) ) ( not ( = ?auto_120599 ?auto_120598 ) ) ( not ( = ?auto_120603 ?auto_120598 ) ) ( ON ?auto_120603 ?auto_120599 ) ( ON-TABLE ?auto_120598 ) ( ON ?auto_120601 ?auto_120603 ) ( ON ?auto_120602 ?auto_120601 ) ( ON ?auto_120600 ?auto_120602 ) ( CLEAR ?auto_120600 ) ( HOLDING ?auto_120597 ) ( CLEAR ?auto_120596 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120596 ?auto_120597 ?auto_120600 )
      ( MAKE-2PILE ?auto_120596 ?auto_120597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120604 - BLOCK
      ?auto_120605 - BLOCK
    )
    :vars
    (
      ?auto_120607 - BLOCK
      ?auto_120610 - BLOCK
      ?auto_120606 - BLOCK
      ?auto_120611 - BLOCK
      ?auto_120608 - BLOCK
      ?auto_120609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120604 ) ( not ( = ?auto_120604 ?auto_120605 ) ) ( not ( = ?auto_120604 ?auto_120607 ) ) ( not ( = ?auto_120605 ?auto_120607 ) ) ( not ( = ?auto_120604 ?auto_120610 ) ) ( not ( = ?auto_120604 ?auto_120606 ) ) ( not ( = ?auto_120605 ?auto_120610 ) ) ( not ( = ?auto_120605 ?auto_120606 ) ) ( not ( = ?auto_120607 ?auto_120610 ) ) ( not ( = ?auto_120607 ?auto_120606 ) ) ( not ( = ?auto_120610 ?auto_120606 ) ) ( not ( = ?auto_120611 ?auto_120608 ) ) ( not ( = ?auto_120611 ?auto_120606 ) ) ( not ( = ?auto_120608 ?auto_120606 ) ) ( not ( = ?auto_120604 ?auto_120608 ) ) ( not ( = ?auto_120604 ?auto_120611 ) ) ( not ( = ?auto_120605 ?auto_120608 ) ) ( not ( = ?auto_120605 ?auto_120611 ) ) ( not ( = ?auto_120607 ?auto_120608 ) ) ( not ( = ?auto_120607 ?auto_120611 ) ) ( not ( = ?auto_120610 ?auto_120608 ) ) ( not ( = ?auto_120610 ?auto_120611 ) ) ( ON ?auto_120611 ?auto_120609 ) ( not ( = ?auto_120604 ?auto_120609 ) ) ( not ( = ?auto_120605 ?auto_120609 ) ) ( not ( = ?auto_120607 ?auto_120609 ) ) ( not ( = ?auto_120610 ?auto_120609 ) ) ( not ( = ?auto_120606 ?auto_120609 ) ) ( not ( = ?auto_120611 ?auto_120609 ) ) ( not ( = ?auto_120608 ?auto_120609 ) ) ( ON ?auto_120608 ?auto_120611 ) ( ON-TABLE ?auto_120609 ) ( ON ?auto_120606 ?auto_120608 ) ( ON ?auto_120610 ?auto_120606 ) ( ON ?auto_120607 ?auto_120610 ) ( CLEAR ?auto_120604 ) ( ON ?auto_120605 ?auto_120607 ) ( CLEAR ?auto_120605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120609 ?auto_120611 ?auto_120608 ?auto_120606 ?auto_120610 ?auto_120607 )
      ( MAKE-2PILE ?auto_120604 ?auto_120605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120612 - BLOCK
      ?auto_120613 - BLOCK
    )
    :vars
    (
      ?auto_120619 - BLOCK
      ?auto_120618 - BLOCK
      ?auto_120617 - BLOCK
      ?auto_120615 - BLOCK
      ?auto_120614 - BLOCK
      ?auto_120616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120612 ?auto_120613 ) ) ( not ( = ?auto_120612 ?auto_120619 ) ) ( not ( = ?auto_120613 ?auto_120619 ) ) ( not ( = ?auto_120612 ?auto_120618 ) ) ( not ( = ?auto_120612 ?auto_120617 ) ) ( not ( = ?auto_120613 ?auto_120618 ) ) ( not ( = ?auto_120613 ?auto_120617 ) ) ( not ( = ?auto_120619 ?auto_120618 ) ) ( not ( = ?auto_120619 ?auto_120617 ) ) ( not ( = ?auto_120618 ?auto_120617 ) ) ( not ( = ?auto_120615 ?auto_120614 ) ) ( not ( = ?auto_120615 ?auto_120617 ) ) ( not ( = ?auto_120614 ?auto_120617 ) ) ( not ( = ?auto_120612 ?auto_120614 ) ) ( not ( = ?auto_120612 ?auto_120615 ) ) ( not ( = ?auto_120613 ?auto_120614 ) ) ( not ( = ?auto_120613 ?auto_120615 ) ) ( not ( = ?auto_120619 ?auto_120614 ) ) ( not ( = ?auto_120619 ?auto_120615 ) ) ( not ( = ?auto_120618 ?auto_120614 ) ) ( not ( = ?auto_120618 ?auto_120615 ) ) ( ON ?auto_120615 ?auto_120616 ) ( not ( = ?auto_120612 ?auto_120616 ) ) ( not ( = ?auto_120613 ?auto_120616 ) ) ( not ( = ?auto_120619 ?auto_120616 ) ) ( not ( = ?auto_120618 ?auto_120616 ) ) ( not ( = ?auto_120617 ?auto_120616 ) ) ( not ( = ?auto_120615 ?auto_120616 ) ) ( not ( = ?auto_120614 ?auto_120616 ) ) ( ON ?auto_120614 ?auto_120615 ) ( ON-TABLE ?auto_120616 ) ( ON ?auto_120617 ?auto_120614 ) ( ON ?auto_120618 ?auto_120617 ) ( ON ?auto_120619 ?auto_120618 ) ( ON ?auto_120613 ?auto_120619 ) ( CLEAR ?auto_120613 ) ( HOLDING ?auto_120612 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120612 )
      ( MAKE-2PILE ?auto_120612 ?auto_120613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_120620 - BLOCK
      ?auto_120621 - BLOCK
    )
    :vars
    (
      ?auto_120626 - BLOCK
      ?auto_120624 - BLOCK
      ?auto_120625 - BLOCK
      ?auto_120622 - BLOCK
      ?auto_120623 - BLOCK
      ?auto_120627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120620 ?auto_120621 ) ) ( not ( = ?auto_120620 ?auto_120626 ) ) ( not ( = ?auto_120621 ?auto_120626 ) ) ( not ( = ?auto_120620 ?auto_120624 ) ) ( not ( = ?auto_120620 ?auto_120625 ) ) ( not ( = ?auto_120621 ?auto_120624 ) ) ( not ( = ?auto_120621 ?auto_120625 ) ) ( not ( = ?auto_120626 ?auto_120624 ) ) ( not ( = ?auto_120626 ?auto_120625 ) ) ( not ( = ?auto_120624 ?auto_120625 ) ) ( not ( = ?auto_120622 ?auto_120623 ) ) ( not ( = ?auto_120622 ?auto_120625 ) ) ( not ( = ?auto_120623 ?auto_120625 ) ) ( not ( = ?auto_120620 ?auto_120623 ) ) ( not ( = ?auto_120620 ?auto_120622 ) ) ( not ( = ?auto_120621 ?auto_120623 ) ) ( not ( = ?auto_120621 ?auto_120622 ) ) ( not ( = ?auto_120626 ?auto_120623 ) ) ( not ( = ?auto_120626 ?auto_120622 ) ) ( not ( = ?auto_120624 ?auto_120623 ) ) ( not ( = ?auto_120624 ?auto_120622 ) ) ( ON ?auto_120622 ?auto_120627 ) ( not ( = ?auto_120620 ?auto_120627 ) ) ( not ( = ?auto_120621 ?auto_120627 ) ) ( not ( = ?auto_120626 ?auto_120627 ) ) ( not ( = ?auto_120624 ?auto_120627 ) ) ( not ( = ?auto_120625 ?auto_120627 ) ) ( not ( = ?auto_120622 ?auto_120627 ) ) ( not ( = ?auto_120623 ?auto_120627 ) ) ( ON ?auto_120623 ?auto_120622 ) ( ON-TABLE ?auto_120627 ) ( ON ?auto_120625 ?auto_120623 ) ( ON ?auto_120624 ?auto_120625 ) ( ON ?auto_120626 ?auto_120624 ) ( ON ?auto_120621 ?auto_120626 ) ( ON ?auto_120620 ?auto_120621 ) ( CLEAR ?auto_120620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120627 ?auto_120622 ?auto_120623 ?auto_120625 ?auto_120624 ?auto_120626 ?auto_120621 )
      ( MAKE-2PILE ?auto_120620 ?auto_120621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120633 - BLOCK
      ?auto_120634 - BLOCK
      ?auto_120635 - BLOCK
      ?auto_120636 - BLOCK
      ?auto_120637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_120637 ) ( CLEAR ?auto_120636 ) ( ON-TABLE ?auto_120633 ) ( ON ?auto_120634 ?auto_120633 ) ( ON ?auto_120635 ?auto_120634 ) ( ON ?auto_120636 ?auto_120635 ) ( not ( = ?auto_120633 ?auto_120634 ) ) ( not ( = ?auto_120633 ?auto_120635 ) ) ( not ( = ?auto_120633 ?auto_120636 ) ) ( not ( = ?auto_120633 ?auto_120637 ) ) ( not ( = ?auto_120634 ?auto_120635 ) ) ( not ( = ?auto_120634 ?auto_120636 ) ) ( not ( = ?auto_120634 ?auto_120637 ) ) ( not ( = ?auto_120635 ?auto_120636 ) ) ( not ( = ?auto_120635 ?auto_120637 ) ) ( not ( = ?auto_120636 ?auto_120637 ) ) )
    :subtasks
    ( ( !STACK ?auto_120637 ?auto_120636 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120638 - BLOCK
      ?auto_120639 - BLOCK
      ?auto_120640 - BLOCK
      ?auto_120641 - BLOCK
      ?auto_120642 - BLOCK
    )
    :vars
    (
      ?auto_120643 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_120641 ) ( ON-TABLE ?auto_120638 ) ( ON ?auto_120639 ?auto_120638 ) ( ON ?auto_120640 ?auto_120639 ) ( ON ?auto_120641 ?auto_120640 ) ( not ( = ?auto_120638 ?auto_120639 ) ) ( not ( = ?auto_120638 ?auto_120640 ) ) ( not ( = ?auto_120638 ?auto_120641 ) ) ( not ( = ?auto_120638 ?auto_120642 ) ) ( not ( = ?auto_120639 ?auto_120640 ) ) ( not ( = ?auto_120639 ?auto_120641 ) ) ( not ( = ?auto_120639 ?auto_120642 ) ) ( not ( = ?auto_120640 ?auto_120641 ) ) ( not ( = ?auto_120640 ?auto_120642 ) ) ( not ( = ?auto_120641 ?auto_120642 ) ) ( ON ?auto_120642 ?auto_120643 ) ( CLEAR ?auto_120642 ) ( HAND-EMPTY ) ( not ( = ?auto_120638 ?auto_120643 ) ) ( not ( = ?auto_120639 ?auto_120643 ) ) ( not ( = ?auto_120640 ?auto_120643 ) ) ( not ( = ?auto_120641 ?auto_120643 ) ) ( not ( = ?auto_120642 ?auto_120643 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120642 ?auto_120643 )
      ( MAKE-5PILE ?auto_120638 ?auto_120639 ?auto_120640 ?auto_120641 ?auto_120642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120644 - BLOCK
      ?auto_120645 - BLOCK
      ?auto_120646 - BLOCK
      ?auto_120647 - BLOCK
      ?auto_120648 - BLOCK
    )
    :vars
    (
      ?auto_120649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120644 ) ( ON ?auto_120645 ?auto_120644 ) ( ON ?auto_120646 ?auto_120645 ) ( not ( = ?auto_120644 ?auto_120645 ) ) ( not ( = ?auto_120644 ?auto_120646 ) ) ( not ( = ?auto_120644 ?auto_120647 ) ) ( not ( = ?auto_120644 ?auto_120648 ) ) ( not ( = ?auto_120645 ?auto_120646 ) ) ( not ( = ?auto_120645 ?auto_120647 ) ) ( not ( = ?auto_120645 ?auto_120648 ) ) ( not ( = ?auto_120646 ?auto_120647 ) ) ( not ( = ?auto_120646 ?auto_120648 ) ) ( not ( = ?auto_120647 ?auto_120648 ) ) ( ON ?auto_120648 ?auto_120649 ) ( CLEAR ?auto_120648 ) ( not ( = ?auto_120644 ?auto_120649 ) ) ( not ( = ?auto_120645 ?auto_120649 ) ) ( not ( = ?auto_120646 ?auto_120649 ) ) ( not ( = ?auto_120647 ?auto_120649 ) ) ( not ( = ?auto_120648 ?auto_120649 ) ) ( HOLDING ?auto_120647 ) ( CLEAR ?auto_120646 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120644 ?auto_120645 ?auto_120646 ?auto_120647 )
      ( MAKE-5PILE ?auto_120644 ?auto_120645 ?auto_120646 ?auto_120647 ?auto_120648 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120650 - BLOCK
      ?auto_120651 - BLOCK
      ?auto_120652 - BLOCK
      ?auto_120653 - BLOCK
      ?auto_120654 - BLOCK
    )
    :vars
    (
      ?auto_120655 - BLOCK
      ?auto_120656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120650 ) ( ON ?auto_120651 ?auto_120650 ) ( ON ?auto_120652 ?auto_120651 ) ( not ( = ?auto_120650 ?auto_120651 ) ) ( not ( = ?auto_120650 ?auto_120652 ) ) ( not ( = ?auto_120650 ?auto_120653 ) ) ( not ( = ?auto_120650 ?auto_120654 ) ) ( not ( = ?auto_120651 ?auto_120652 ) ) ( not ( = ?auto_120651 ?auto_120653 ) ) ( not ( = ?auto_120651 ?auto_120654 ) ) ( not ( = ?auto_120652 ?auto_120653 ) ) ( not ( = ?auto_120652 ?auto_120654 ) ) ( not ( = ?auto_120653 ?auto_120654 ) ) ( ON ?auto_120654 ?auto_120655 ) ( not ( = ?auto_120650 ?auto_120655 ) ) ( not ( = ?auto_120651 ?auto_120655 ) ) ( not ( = ?auto_120652 ?auto_120655 ) ) ( not ( = ?auto_120653 ?auto_120655 ) ) ( not ( = ?auto_120654 ?auto_120655 ) ) ( CLEAR ?auto_120652 ) ( ON ?auto_120653 ?auto_120654 ) ( CLEAR ?auto_120653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120656 ) ( ON ?auto_120655 ?auto_120656 ) ( not ( = ?auto_120656 ?auto_120655 ) ) ( not ( = ?auto_120656 ?auto_120654 ) ) ( not ( = ?auto_120656 ?auto_120653 ) ) ( not ( = ?auto_120650 ?auto_120656 ) ) ( not ( = ?auto_120651 ?auto_120656 ) ) ( not ( = ?auto_120652 ?auto_120656 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120656 ?auto_120655 ?auto_120654 )
      ( MAKE-5PILE ?auto_120650 ?auto_120651 ?auto_120652 ?auto_120653 ?auto_120654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120657 - BLOCK
      ?auto_120658 - BLOCK
      ?auto_120659 - BLOCK
      ?auto_120660 - BLOCK
      ?auto_120661 - BLOCK
    )
    :vars
    (
      ?auto_120662 - BLOCK
      ?auto_120663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120657 ) ( ON ?auto_120658 ?auto_120657 ) ( not ( = ?auto_120657 ?auto_120658 ) ) ( not ( = ?auto_120657 ?auto_120659 ) ) ( not ( = ?auto_120657 ?auto_120660 ) ) ( not ( = ?auto_120657 ?auto_120661 ) ) ( not ( = ?auto_120658 ?auto_120659 ) ) ( not ( = ?auto_120658 ?auto_120660 ) ) ( not ( = ?auto_120658 ?auto_120661 ) ) ( not ( = ?auto_120659 ?auto_120660 ) ) ( not ( = ?auto_120659 ?auto_120661 ) ) ( not ( = ?auto_120660 ?auto_120661 ) ) ( ON ?auto_120661 ?auto_120662 ) ( not ( = ?auto_120657 ?auto_120662 ) ) ( not ( = ?auto_120658 ?auto_120662 ) ) ( not ( = ?auto_120659 ?auto_120662 ) ) ( not ( = ?auto_120660 ?auto_120662 ) ) ( not ( = ?auto_120661 ?auto_120662 ) ) ( ON ?auto_120660 ?auto_120661 ) ( CLEAR ?auto_120660 ) ( ON-TABLE ?auto_120663 ) ( ON ?auto_120662 ?auto_120663 ) ( not ( = ?auto_120663 ?auto_120662 ) ) ( not ( = ?auto_120663 ?auto_120661 ) ) ( not ( = ?auto_120663 ?auto_120660 ) ) ( not ( = ?auto_120657 ?auto_120663 ) ) ( not ( = ?auto_120658 ?auto_120663 ) ) ( not ( = ?auto_120659 ?auto_120663 ) ) ( HOLDING ?auto_120659 ) ( CLEAR ?auto_120658 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120657 ?auto_120658 ?auto_120659 )
      ( MAKE-5PILE ?auto_120657 ?auto_120658 ?auto_120659 ?auto_120660 ?auto_120661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120664 - BLOCK
      ?auto_120665 - BLOCK
      ?auto_120666 - BLOCK
      ?auto_120667 - BLOCK
      ?auto_120668 - BLOCK
    )
    :vars
    (
      ?auto_120669 - BLOCK
      ?auto_120670 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120664 ) ( ON ?auto_120665 ?auto_120664 ) ( not ( = ?auto_120664 ?auto_120665 ) ) ( not ( = ?auto_120664 ?auto_120666 ) ) ( not ( = ?auto_120664 ?auto_120667 ) ) ( not ( = ?auto_120664 ?auto_120668 ) ) ( not ( = ?auto_120665 ?auto_120666 ) ) ( not ( = ?auto_120665 ?auto_120667 ) ) ( not ( = ?auto_120665 ?auto_120668 ) ) ( not ( = ?auto_120666 ?auto_120667 ) ) ( not ( = ?auto_120666 ?auto_120668 ) ) ( not ( = ?auto_120667 ?auto_120668 ) ) ( ON ?auto_120668 ?auto_120669 ) ( not ( = ?auto_120664 ?auto_120669 ) ) ( not ( = ?auto_120665 ?auto_120669 ) ) ( not ( = ?auto_120666 ?auto_120669 ) ) ( not ( = ?auto_120667 ?auto_120669 ) ) ( not ( = ?auto_120668 ?auto_120669 ) ) ( ON ?auto_120667 ?auto_120668 ) ( ON-TABLE ?auto_120670 ) ( ON ?auto_120669 ?auto_120670 ) ( not ( = ?auto_120670 ?auto_120669 ) ) ( not ( = ?auto_120670 ?auto_120668 ) ) ( not ( = ?auto_120670 ?auto_120667 ) ) ( not ( = ?auto_120664 ?auto_120670 ) ) ( not ( = ?auto_120665 ?auto_120670 ) ) ( not ( = ?auto_120666 ?auto_120670 ) ) ( CLEAR ?auto_120665 ) ( ON ?auto_120666 ?auto_120667 ) ( CLEAR ?auto_120666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120670 ?auto_120669 ?auto_120668 ?auto_120667 )
      ( MAKE-5PILE ?auto_120664 ?auto_120665 ?auto_120666 ?auto_120667 ?auto_120668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120671 - BLOCK
      ?auto_120672 - BLOCK
      ?auto_120673 - BLOCK
      ?auto_120674 - BLOCK
      ?auto_120675 - BLOCK
    )
    :vars
    (
      ?auto_120677 - BLOCK
      ?auto_120676 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120671 ) ( not ( = ?auto_120671 ?auto_120672 ) ) ( not ( = ?auto_120671 ?auto_120673 ) ) ( not ( = ?auto_120671 ?auto_120674 ) ) ( not ( = ?auto_120671 ?auto_120675 ) ) ( not ( = ?auto_120672 ?auto_120673 ) ) ( not ( = ?auto_120672 ?auto_120674 ) ) ( not ( = ?auto_120672 ?auto_120675 ) ) ( not ( = ?auto_120673 ?auto_120674 ) ) ( not ( = ?auto_120673 ?auto_120675 ) ) ( not ( = ?auto_120674 ?auto_120675 ) ) ( ON ?auto_120675 ?auto_120677 ) ( not ( = ?auto_120671 ?auto_120677 ) ) ( not ( = ?auto_120672 ?auto_120677 ) ) ( not ( = ?auto_120673 ?auto_120677 ) ) ( not ( = ?auto_120674 ?auto_120677 ) ) ( not ( = ?auto_120675 ?auto_120677 ) ) ( ON ?auto_120674 ?auto_120675 ) ( ON-TABLE ?auto_120676 ) ( ON ?auto_120677 ?auto_120676 ) ( not ( = ?auto_120676 ?auto_120677 ) ) ( not ( = ?auto_120676 ?auto_120675 ) ) ( not ( = ?auto_120676 ?auto_120674 ) ) ( not ( = ?auto_120671 ?auto_120676 ) ) ( not ( = ?auto_120672 ?auto_120676 ) ) ( not ( = ?auto_120673 ?auto_120676 ) ) ( ON ?auto_120673 ?auto_120674 ) ( CLEAR ?auto_120673 ) ( HOLDING ?auto_120672 ) ( CLEAR ?auto_120671 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120671 ?auto_120672 )
      ( MAKE-5PILE ?auto_120671 ?auto_120672 ?auto_120673 ?auto_120674 ?auto_120675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120678 - BLOCK
      ?auto_120679 - BLOCK
      ?auto_120680 - BLOCK
      ?auto_120681 - BLOCK
      ?auto_120682 - BLOCK
    )
    :vars
    (
      ?auto_120683 - BLOCK
      ?auto_120684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_120678 ) ( not ( = ?auto_120678 ?auto_120679 ) ) ( not ( = ?auto_120678 ?auto_120680 ) ) ( not ( = ?auto_120678 ?auto_120681 ) ) ( not ( = ?auto_120678 ?auto_120682 ) ) ( not ( = ?auto_120679 ?auto_120680 ) ) ( not ( = ?auto_120679 ?auto_120681 ) ) ( not ( = ?auto_120679 ?auto_120682 ) ) ( not ( = ?auto_120680 ?auto_120681 ) ) ( not ( = ?auto_120680 ?auto_120682 ) ) ( not ( = ?auto_120681 ?auto_120682 ) ) ( ON ?auto_120682 ?auto_120683 ) ( not ( = ?auto_120678 ?auto_120683 ) ) ( not ( = ?auto_120679 ?auto_120683 ) ) ( not ( = ?auto_120680 ?auto_120683 ) ) ( not ( = ?auto_120681 ?auto_120683 ) ) ( not ( = ?auto_120682 ?auto_120683 ) ) ( ON ?auto_120681 ?auto_120682 ) ( ON-TABLE ?auto_120684 ) ( ON ?auto_120683 ?auto_120684 ) ( not ( = ?auto_120684 ?auto_120683 ) ) ( not ( = ?auto_120684 ?auto_120682 ) ) ( not ( = ?auto_120684 ?auto_120681 ) ) ( not ( = ?auto_120678 ?auto_120684 ) ) ( not ( = ?auto_120679 ?auto_120684 ) ) ( not ( = ?auto_120680 ?auto_120684 ) ) ( ON ?auto_120680 ?auto_120681 ) ( CLEAR ?auto_120678 ) ( ON ?auto_120679 ?auto_120680 ) ( CLEAR ?auto_120679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120684 ?auto_120683 ?auto_120682 ?auto_120681 ?auto_120680 )
      ( MAKE-5PILE ?auto_120678 ?auto_120679 ?auto_120680 ?auto_120681 ?auto_120682 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120685 - BLOCK
      ?auto_120686 - BLOCK
      ?auto_120687 - BLOCK
      ?auto_120688 - BLOCK
      ?auto_120689 - BLOCK
    )
    :vars
    (
      ?auto_120690 - BLOCK
      ?auto_120691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120685 ?auto_120686 ) ) ( not ( = ?auto_120685 ?auto_120687 ) ) ( not ( = ?auto_120685 ?auto_120688 ) ) ( not ( = ?auto_120685 ?auto_120689 ) ) ( not ( = ?auto_120686 ?auto_120687 ) ) ( not ( = ?auto_120686 ?auto_120688 ) ) ( not ( = ?auto_120686 ?auto_120689 ) ) ( not ( = ?auto_120687 ?auto_120688 ) ) ( not ( = ?auto_120687 ?auto_120689 ) ) ( not ( = ?auto_120688 ?auto_120689 ) ) ( ON ?auto_120689 ?auto_120690 ) ( not ( = ?auto_120685 ?auto_120690 ) ) ( not ( = ?auto_120686 ?auto_120690 ) ) ( not ( = ?auto_120687 ?auto_120690 ) ) ( not ( = ?auto_120688 ?auto_120690 ) ) ( not ( = ?auto_120689 ?auto_120690 ) ) ( ON ?auto_120688 ?auto_120689 ) ( ON-TABLE ?auto_120691 ) ( ON ?auto_120690 ?auto_120691 ) ( not ( = ?auto_120691 ?auto_120690 ) ) ( not ( = ?auto_120691 ?auto_120689 ) ) ( not ( = ?auto_120691 ?auto_120688 ) ) ( not ( = ?auto_120685 ?auto_120691 ) ) ( not ( = ?auto_120686 ?auto_120691 ) ) ( not ( = ?auto_120687 ?auto_120691 ) ) ( ON ?auto_120687 ?auto_120688 ) ( ON ?auto_120686 ?auto_120687 ) ( CLEAR ?auto_120686 ) ( HOLDING ?auto_120685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120685 )
      ( MAKE-5PILE ?auto_120685 ?auto_120686 ?auto_120687 ?auto_120688 ?auto_120689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120692 - BLOCK
      ?auto_120693 - BLOCK
      ?auto_120694 - BLOCK
      ?auto_120695 - BLOCK
      ?auto_120696 - BLOCK
    )
    :vars
    (
      ?auto_120697 - BLOCK
      ?auto_120698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120692 ?auto_120693 ) ) ( not ( = ?auto_120692 ?auto_120694 ) ) ( not ( = ?auto_120692 ?auto_120695 ) ) ( not ( = ?auto_120692 ?auto_120696 ) ) ( not ( = ?auto_120693 ?auto_120694 ) ) ( not ( = ?auto_120693 ?auto_120695 ) ) ( not ( = ?auto_120693 ?auto_120696 ) ) ( not ( = ?auto_120694 ?auto_120695 ) ) ( not ( = ?auto_120694 ?auto_120696 ) ) ( not ( = ?auto_120695 ?auto_120696 ) ) ( ON ?auto_120696 ?auto_120697 ) ( not ( = ?auto_120692 ?auto_120697 ) ) ( not ( = ?auto_120693 ?auto_120697 ) ) ( not ( = ?auto_120694 ?auto_120697 ) ) ( not ( = ?auto_120695 ?auto_120697 ) ) ( not ( = ?auto_120696 ?auto_120697 ) ) ( ON ?auto_120695 ?auto_120696 ) ( ON-TABLE ?auto_120698 ) ( ON ?auto_120697 ?auto_120698 ) ( not ( = ?auto_120698 ?auto_120697 ) ) ( not ( = ?auto_120698 ?auto_120696 ) ) ( not ( = ?auto_120698 ?auto_120695 ) ) ( not ( = ?auto_120692 ?auto_120698 ) ) ( not ( = ?auto_120693 ?auto_120698 ) ) ( not ( = ?auto_120694 ?auto_120698 ) ) ( ON ?auto_120694 ?auto_120695 ) ( ON ?auto_120693 ?auto_120694 ) ( ON ?auto_120692 ?auto_120693 ) ( CLEAR ?auto_120692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120698 ?auto_120697 ?auto_120696 ?auto_120695 ?auto_120694 ?auto_120693 )
      ( MAKE-5PILE ?auto_120692 ?auto_120693 ?auto_120694 ?auto_120695 ?auto_120696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120699 - BLOCK
      ?auto_120700 - BLOCK
      ?auto_120701 - BLOCK
      ?auto_120702 - BLOCK
      ?auto_120703 - BLOCK
    )
    :vars
    (
      ?auto_120705 - BLOCK
      ?auto_120704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120699 ?auto_120700 ) ) ( not ( = ?auto_120699 ?auto_120701 ) ) ( not ( = ?auto_120699 ?auto_120702 ) ) ( not ( = ?auto_120699 ?auto_120703 ) ) ( not ( = ?auto_120700 ?auto_120701 ) ) ( not ( = ?auto_120700 ?auto_120702 ) ) ( not ( = ?auto_120700 ?auto_120703 ) ) ( not ( = ?auto_120701 ?auto_120702 ) ) ( not ( = ?auto_120701 ?auto_120703 ) ) ( not ( = ?auto_120702 ?auto_120703 ) ) ( ON ?auto_120703 ?auto_120705 ) ( not ( = ?auto_120699 ?auto_120705 ) ) ( not ( = ?auto_120700 ?auto_120705 ) ) ( not ( = ?auto_120701 ?auto_120705 ) ) ( not ( = ?auto_120702 ?auto_120705 ) ) ( not ( = ?auto_120703 ?auto_120705 ) ) ( ON ?auto_120702 ?auto_120703 ) ( ON-TABLE ?auto_120704 ) ( ON ?auto_120705 ?auto_120704 ) ( not ( = ?auto_120704 ?auto_120705 ) ) ( not ( = ?auto_120704 ?auto_120703 ) ) ( not ( = ?auto_120704 ?auto_120702 ) ) ( not ( = ?auto_120699 ?auto_120704 ) ) ( not ( = ?auto_120700 ?auto_120704 ) ) ( not ( = ?auto_120701 ?auto_120704 ) ) ( ON ?auto_120701 ?auto_120702 ) ( ON ?auto_120700 ?auto_120701 ) ( HOLDING ?auto_120699 ) ( CLEAR ?auto_120700 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120704 ?auto_120705 ?auto_120703 ?auto_120702 ?auto_120701 ?auto_120700 ?auto_120699 )
      ( MAKE-5PILE ?auto_120699 ?auto_120700 ?auto_120701 ?auto_120702 ?auto_120703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120706 - BLOCK
      ?auto_120707 - BLOCK
      ?auto_120708 - BLOCK
      ?auto_120709 - BLOCK
      ?auto_120710 - BLOCK
    )
    :vars
    (
      ?auto_120711 - BLOCK
      ?auto_120712 - BLOCK
      ?auto_120713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120706 ?auto_120707 ) ) ( not ( = ?auto_120706 ?auto_120708 ) ) ( not ( = ?auto_120706 ?auto_120709 ) ) ( not ( = ?auto_120706 ?auto_120710 ) ) ( not ( = ?auto_120707 ?auto_120708 ) ) ( not ( = ?auto_120707 ?auto_120709 ) ) ( not ( = ?auto_120707 ?auto_120710 ) ) ( not ( = ?auto_120708 ?auto_120709 ) ) ( not ( = ?auto_120708 ?auto_120710 ) ) ( not ( = ?auto_120709 ?auto_120710 ) ) ( ON ?auto_120710 ?auto_120711 ) ( not ( = ?auto_120706 ?auto_120711 ) ) ( not ( = ?auto_120707 ?auto_120711 ) ) ( not ( = ?auto_120708 ?auto_120711 ) ) ( not ( = ?auto_120709 ?auto_120711 ) ) ( not ( = ?auto_120710 ?auto_120711 ) ) ( ON ?auto_120709 ?auto_120710 ) ( ON-TABLE ?auto_120712 ) ( ON ?auto_120711 ?auto_120712 ) ( not ( = ?auto_120712 ?auto_120711 ) ) ( not ( = ?auto_120712 ?auto_120710 ) ) ( not ( = ?auto_120712 ?auto_120709 ) ) ( not ( = ?auto_120706 ?auto_120712 ) ) ( not ( = ?auto_120707 ?auto_120712 ) ) ( not ( = ?auto_120708 ?auto_120712 ) ) ( ON ?auto_120708 ?auto_120709 ) ( ON ?auto_120707 ?auto_120708 ) ( CLEAR ?auto_120707 ) ( ON ?auto_120706 ?auto_120713 ) ( CLEAR ?auto_120706 ) ( HAND-EMPTY ) ( not ( = ?auto_120706 ?auto_120713 ) ) ( not ( = ?auto_120707 ?auto_120713 ) ) ( not ( = ?auto_120708 ?auto_120713 ) ) ( not ( = ?auto_120709 ?auto_120713 ) ) ( not ( = ?auto_120710 ?auto_120713 ) ) ( not ( = ?auto_120711 ?auto_120713 ) ) ( not ( = ?auto_120712 ?auto_120713 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120706 ?auto_120713 )
      ( MAKE-5PILE ?auto_120706 ?auto_120707 ?auto_120708 ?auto_120709 ?auto_120710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120714 - BLOCK
      ?auto_120715 - BLOCK
      ?auto_120716 - BLOCK
      ?auto_120717 - BLOCK
      ?auto_120718 - BLOCK
    )
    :vars
    (
      ?auto_120719 - BLOCK
      ?auto_120720 - BLOCK
      ?auto_120721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120714 ?auto_120715 ) ) ( not ( = ?auto_120714 ?auto_120716 ) ) ( not ( = ?auto_120714 ?auto_120717 ) ) ( not ( = ?auto_120714 ?auto_120718 ) ) ( not ( = ?auto_120715 ?auto_120716 ) ) ( not ( = ?auto_120715 ?auto_120717 ) ) ( not ( = ?auto_120715 ?auto_120718 ) ) ( not ( = ?auto_120716 ?auto_120717 ) ) ( not ( = ?auto_120716 ?auto_120718 ) ) ( not ( = ?auto_120717 ?auto_120718 ) ) ( ON ?auto_120718 ?auto_120719 ) ( not ( = ?auto_120714 ?auto_120719 ) ) ( not ( = ?auto_120715 ?auto_120719 ) ) ( not ( = ?auto_120716 ?auto_120719 ) ) ( not ( = ?auto_120717 ?auto_120719 ) ) ( not ( = ?auto_120718 ?auto_120719 ) ) ( ON ?auto_120717 ?auto_120718 ) ( ON-TABLE ?auto_120720 ) ( ON ?auto_120719 ?auto_120720 ) ( not ( = ?auto_120720 ?auto_120719 ) ) ( not ( = ?auto_120720 ?auto_120718 ) ) ( not ( = ?auto_120720 ?auto_120717 ) ) ( not ( = ?auto_120714 ?auto_120720 ) ) ( not ( = ?auto_120715 ?auto_120720 ) ) ( not ( = ?auto_120716 ?auto_120720 ) ) ( ON ?auto_120716 ?auto_120717 ) ( ON ?auto_120714 ?auto_120721 ) ( CLEAR ?auto_120714 ) ( not ( = ?auto_120714 ?auto_120721 ) ) ( not ( = ?auto_120715 ?auto_120721 ) ) ( not ( = ?auto_120716 ?auto_120721 ) ) ( not ( = ?auto_120717 ?auto_120721 ) ) ( not ( = ?auto_120718 ?auto_120721 ) ) ( not ( = ?auto_120719 ?auto_120721 ) ) ( not ( = ?auto_120720 ?auto_120721 ) ) ( HOLDING ?auto_120715 ) ( CLEAR ?auto_120716 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120720 ?auto_120719 ?auto_120718 ?auto_120717 ?auto_120716 ?auto_120715 )
      ( MAKE-5PILE ?auto_120714 ?auto_120715 ?auto_120716 ?auto_120717 ?auto_120718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120722 - BLOCK
      ?auto_120723 - BLOCK
      ?auto_120724 - BLOCK
      ?auto_120725 - BLOCK
      ?auto_120726 - BLOCK
    )
    :vars
    (
      ?auto_120727 - BLOCK
      ?auto_120729 - BLOCK
      ?auto_120728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120722 ?auto_120723 ) ) ( not ( = ?auto_120722 ?auto_120724 ) ) ( not ( = ?auto_120722 ?auto_120725 ) ) ( not ( = ?auto_120722 ?auto_120726 ) ) ( not ( = ?auto_120723 ?auto_120724 ) ) ( not ( = ?auto_120723 ?auto_120725 ) ) ( not ( = ?auto_120723 ?auto_120726 ) ) ( not ( = ?auto_120724 ?auto_120725 ) ) ( not ( = ?auto_120724 ?auto_120726 ) ) ( not ( = ?auto_120725 ?auto_120726 ) ) ( ON ?auto_120726 ?auto_120727 ) ( not ( = ?auto_120722 ?auto_120727 ) ) ( not ( = ?auto_120723 ?auto_120727 ) ) ( not ( = ?auto_120724 ?auto_120727 ) ) ( not ( = ?auto_120725 ?auto_120727 ) ) ( not ( = ?auto_120726 ?auto_120727 ) ) ( ON ?auto_120725 ?auto_120726 ) ( ON-TABLE ?auto_120729 ) ( ON ?auto_120727 ?auto_120729 ) ( not ( = ?auto_120729 ?auto_120727 ) ) ( not ( = ?auto_120729 ?auto_120726 ) ) ( not ( = ?auto_120729 ?auto_120725 ) ) ( not ( = ?auto_120722 ?auto_120729 ) ) ( not ( = ?auto_120723 ?auto_120729 ) ) ( not ( = ?auto_120724 ?auto_120729 ) ) ( ON ?auto_120724 ?auto_120725 ) ( ON ?auto_120722 ?auto_120728 ) ( not ( = ?auto_120722 ?auto_120728 ) ) ( not ( = ?auto_120723 ?auto_120728 ) ) ( not ( = ?auto_120724 ?auto_120728 ) ) ( not ( = ?auto_120725 ?auto_120728 ) ) ( not ( = ?auto_120726 ?auto_120728 ) ) ( not ( = ?auto_120727 ?auto_120728 ) ) ( not ( = ?auto_120729 ?auto_120728 ) ) ( CLEAR ?auto_120724 ) ( ON ?auto_120723 ?auto_120722 ) ( CLEAR ?auto_120723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120728 ?auto_120722 )
      ( MAKE-5PILE ?auto_120722 ?auto_120723 ?auto_120724 ?auto_120725 ?auto_120726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120730 - BLOCK
      ?auto_120731 - BLOCK
      ?auto_120732 - BLOCK
      ?auto_120733 - BLOCK
      ?auto_120734 - BLOCK
    )
    :vars
    (
      ?auto_120736 - BLOCK
      ?auto_120735 - BLOCK
      ?auto_120737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120730 ?auto_120731 ) ) ( not ( = ?auto_120730 ?auto_120732 ) ) ( not ( = ?auto_120730 ?auto_120733 ) ) ( not ( = ?auto_120730 ?auto_120734 ) ) ( not ( = ?auto_120731 ?auto_120732 ) ) ( not ( = ?auto_120731 ?auto_120733 ) ) ( not ( = ?auto_120731 ?auto_120734 ) ) ( not ( = ?auto_120732 ?auto_120733 ) ) ( not ( = ?auto_120732 ?auto_120734 ) ) ( not ( = ?auto_120733 ?auto_120734 ) ) ( ON ?auto_120734 ?auto_120736 ) ( not ( = ?auto_120730 ?auto_120736 ) ) ( not ( = ?auto_120731 ?auto_120736 ) ) ( not ( = ?auto_120732 ?auto_120736 ) ) ( not ( = ?auto_120733 ?auto_120736 ) ) ( not ( = ?auto_120734 ?auto_120736 ) ) ( ON ?auto_120733 ?auto_120734 ) ( ON-TABLE ?auto_120735 ) ( ON ?auto_120736 ?auto_120735 ) ( not ( = ?auto_120735 ?auto_120736 ) ) ( not ( = ?auto_120735 ?auto_120734 ) ) ( not ( = ?auto_120735 ?auto_120733 ) ) ( not ( = ?auto_120730 ?auto_120735 ) ) ( not ( = ?auto_120731 ?auto_120735 ) ) ( not ( = ?auto_120732 ?auto_120735 ) ) ( ON ?auto_120730 ?auto_120737 ) ( not ( = ?auto_120730 ?auto_120737 ) ) ( not ( = ?auto_120731 ?auto_120737 ) ) ( not ( = ?auto_120732 ?auto_120737 ) ) ( not ( = ?auto_120733 ?auto_120737 ) ) ( not ( = ?auto_120734 ?auto_120737 ) ) ( not ( = ?auto_120736 ?auto_120737 ) ) ( not ( = ?auto_120735 ?auto_120737 ) ) ( ON ?auto_120731 ?auto_120730 ) ( CLEAR ?auto_120731 ) ( ON-TABLE ?auto_120737 ) ( HOLDING ?auto_120732 ) ( CLEAR ?auto_120733 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120735 ?auto_120736 ?auto_120734 ?auto_120733 ?auto_120732 )
      ( MAKE-5PILE ?auto_120730 ?auto_120731 ?auto_120732 ?auto_120733 ?auto_120734 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120738 - BLOCK
      ?auto_120739 - BLOCK
      ?auto_120740 - BLOCK
      ?auto_120741 - BLOCK
      ?auto_120742 - BLOCK
    )
    :vars
    (
      ?auto_120744 - BLOCK
      ?auto_120745 - BLOCK
      ?auto_120743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120738 ?auto_120739 ) ) ( not ( = ?auto_120738 ?auto_120740 ) ) ( not ( = ?auto_120738 ?auto_120741 ) ) ( not ( = ?auto_120738 ?auto_120742 ) ) ( not ( = ?auto_120739 ?auto_120740 ) ) ( not ( = ?auto_120739 ?auto_120741 ) ) ( not ( = ?auto_120739 ?auto_120742 ) ) ( not ( = ?auto_120740 ?auto_120741 ) ) ( not ( = ?auto_120740 ?auto_120742 ) ) ( not ( = ?auto_120741 ?auto_120742 ) ) ( ON ?auto_120742 ?auto_120744 ) ( not ( = ?auto_120738 ?auto_120744 ) ) ( not ( = ?auto_120739 ?auto_120744 ) ) ( not ( = ?auto_120740 ?auto_120744 ) ) ( not ( = ?auto_120741 ?auto_120744 ) ) ( not ( = ?auto_120742 ?auto_120744 ) ) ( ON ?auto_120741 ?auto_120742 ) ( ON-TABLE ?auto_120745 ) ( ON ?auto_120744 ?auto_120745 ) ( not ( = ?auto_120745 ?auto_120744 ) ) ( not ( = ?auto_120745 ?auto_120742 ) ) ( not ( = ?auto_120745 ?auto_120741 ) ) ( not ( = ?auto_120738 ?auto_120745 ) ) ( not ( = ?auto_120739 ?auto_120745 ) ) ( not ( = ?auto_120740 ?auto_120745 ) ) ( ON ?auto_120738 ?auto_120743 ) ( not ( = ?auto_120738 ?auto_120743 ) ) ( not ( = ?auto_120739 ?auto_120743 ) ) ( not ( = ?auto_120740 ?auto_120743 ) ) ( not ( = ?auto_120741 ?auto_120743 ) ) ( not ( = ?auto_120742 ?auto_120743 ) ) ( not ( = ?auto_120744 ?auto_120743 ) ) ( not ( = ?auto_120745 ?auto_120743 ) ) ( ON ?auto_120739 ?auto_120738 ) ( ON-TABLE ?auto_120743 ) ( CLEAR ?auto_120741 ) ( ON ?auto_120740 ?auto_120739 ) ( CLEAR ?auto_120740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120743 ?auto_120738 ?auto_120739 )
      ( MAKE-5PILE ?auto_120738 ?auto_120739 ?auto_120740 ?auto_120741 ?auto_120742 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120746 - BLOCK
      ?auto_120747 - BLOCK
      ?auto_120748 - BLOCK
      ?auto_120749 - BLOCK
      ?auto_120750 - BLOCK
    )
    :vars
    (
      ?auto_120751 - BLOCK
      ?auto_120752 - BLOCK
      ?auto_120753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120746 ?auto_120747 ) ) ( not ( = ?auto_120746 ?auto_120748 ) ) ( not ( = ?auto_120746 ?auto_120749 ) ) ( not ( = ?auto_120746 ?auto_120750 ) ) ( not ( = ?auto_120747 ?auto_120748 ) ) ( not ( = ?auto_120747 ?auto_120749 ) ) ( not ( = ?auto_120747 ?auto_120750 ) ) ( not ( = ?auto_120748 ?auto_120749 ) ) ( not ( = ?auto_120748 ?auto_120750 ) ) ( not ( = ?auto_120749 ?auto_120750 ) ) ( ON ?auto_120750 ?auto_120751 ) ( not ( = ?auto_120746 ?auto_120751 ) ) ( not ( = ?auto_120747 ?auto_120751 ) ) ( not ( = ?auto_120748 ?auto_120751 ) ) ( not ( = ?auto_120749 ?auto_120751 ) ) ( not ( = ?auto_120750 ?auto_120751 ) ) ( ON-TABLE ?auto_120752 ) ( ON ?auto_120751 ?auto_120752 ) ( not ( = ?auto_120752 ?auto_120751 ) ) ( not ( = ?auto_120752 ?auto_120750 ) ) ( not ( = ?auto_120752 ?auto_120749 ) ) ( not ( = ?auto_120746 ?auto_120752 ) ) ( not ( = ?auto_120747 ?auto_120752 ) ) ( not ( = ?auto_120748 ?auto_120752 ) ) ( ON ?auto_120746 ?auto_120753 ) ( not ( = ?auto_120746 ?auto_120753 ) ) ( not ( = ?auto_120747 ?auto_120753 ) ) ( not ( = ?auto_120748 ?auto_120753 ) ) ( not ( = ?auto_120749 ?auto_120753 ) ) ( not ( = ?auto_120750 ?auto_120753 ) ) ( not ( = ?auto_120751 ?auto_120753 ) ) ( not ( = ?auto_120752 ?auto_120753 ) ) ( ON ?auto_120747 ?auto_120746 ) ( ON-TABLE ?auto_120753 ) ( ON ?auto_120748 ?auto_120747 ) ( CLEAR ?auto_120748 ) ( HOLDING ?auto_120749 ) ( CLEAR ?auto_120750 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120752 ?auto_120751 ?auto_120750 ?auto_120749 )
      ( MAKE-5PILE ?auto_120746 ?auto_120747 ?auto_120748 ?auto_120749 ?auto_120750 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120754 - BLOCK
      ?auto_120755 - BLOCK
      ?auto_120756 - BLOCK
      ?auto_120757 - BLOCK
      ?auto_120758 - BLOCK
    )
    :vars
    (
      ?auto_120760 - BLOCK
      ?auto_120761 - BLOCK
      ?auto_120759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120754 ?auto_120755 ) ) ( not ( = ?auto_120754 ?auto_120756 ) ) ( not ( = ?auto_120754 ?auto_120757 ) ) ( not ( = ?auto_120754 ?auto_120758 ) ) ( not ( = ?auto_120755 ?auto_120756 ) ) ( not ( = ?auto_120755 ?auto_120757 ) ) ( not ( = ?auto_120755 ?auto_120758 ) ) ( not ( = ?auto_120756 ?auto_120757 ) ) ( not ( = ?auto_120756 ?auto_120758 ) ) ( not ( = ?auto_120757 ?auto_120758 ) ) ( ON ?auto_120758 ?auto_120760 ) ( not ( = ?auto_120754 ?auto_120760 ) ) ( not ( = ?auto_120755 ?auto_120760 ) ) ( not ( = ?auto_120756 ?auto_120760 ) ) ( not ( = ?auto_120757 ?auto_120760 ) ) ( not ( = ?auto_120758 ?auto_120760 ) ) ( ON-TABLE ?auto_120761 ) ( ON ?auto_120760 ?auto_120761 ) ( not ( = ?auto_120761 ?auto_120760 ) ) ( not ( = ?auto_120761 ?auto_120758 ) ) ( not ( = ?auto_120761 ?auto_120757 ) ) ( not ( = ?auto_120754 ?auto_120761 ) ) ( not ( = ?auto_120755 ?auto_120761 ) ) ( not ( = ?auto_120756 ?auto_120761 ) ) ( ON ?auto_120754 ?auto_120759 ) ( not ( = ?auto_120754 ?auto_120759 ) ) ( not ( = ?auto_120755 ?auto_120759 ) ) ( not ( = ?auto_120756 ?auto_120759 ) ) ( not ( = ?auto_120757 ?auto_120759 ) ) ( not ( = ?auto_120758 ?auto_120759 ) ) ( not ( = ?auto_120760 ?auto_120759 ) ) ( not ( = ?auto_120761 ?auto_120759 ) ) ( ON ?auto_120755 ?auto_120754 ) ( ON-TABLE ?auto_120759 ) ( ON ?auto_120756 ?auto_120755 ) ( CLEAR ?auto_120758 ) ( ON ?auto_120757 ?auto_120756 ) ( CLEAR ?auto_120757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120759 ?auto_120754 ?auto_120755 ?auto_120756 )
      ( MAKE-5PILE ?auto_120754 ?auto_120755 ?auto_120756 ?auto_120757 ?auto_120758 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120762 - BLOCK
      ?auto_120763 - BLOCK
      ?auto_120764 - BLOCK
      ?auto_120765 - BLOCK
      ?auto_120766 - BLOCK
    )
    :vars
    (
      ?auto_120768 - BLOCK
      ?auto_120769 - BLOCK
      ?auto_120767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120762 ?auto_120763 ) ) ( not ( = ?auto_120762 ?auto_120764 ) ) ( not ( = ?auto_120762 ?auto_120765 ) ) ( not ( = ?auto_120762 ?auto_120766 ) ) ( not ( = ?auto_120763 ?auto_120764 ) ) ( not ( = ?auto_120763 ?auto_120765 ) ) ( not ( = ?auto_120763 ?auto_120766 ) ) ( not ( = ?auto_120764 ?auto_120765 ) ) ( not ( = ?auto_120764 ?auto_120766 ) ) ( not ( = ?auto_120765 ?auto_120766 ) ) ( not ( = ?auto_120762 ?auto_120768 ) ) ( not ( = ?auto_120763 ?auto_120768 ) ) ( not ( = ?auto_120764 ?auto_120768 ) ) ( not ( = ?auto_120765 ?auto_120768 ) ) ( not ( = ?auto_120766 ?auto_120768 ) ) ( ON-TABLE ?auto_120769 ) ( ON ?auto_120768 ?auto_120769 ) ( not ( = ?auto_120769 ?auto_120768 ) ) ( not ( = ?auto_120769 ?auto_120766 ) ) ( not ( = ?auto_120769 ?auto_120765 ) ) ( not ( = ?auto_120762 ?auto_120769 ) ) ( not ( = ?auto_120763 ?auto_120769 ) ) ( not ( = ?auto_120764 ?auto_120769 ) ) ( ON ?auto_120762 ?auto_120767 ) ( not ( = ?auto_120762 ?auto_120767 ) ) ( not ( = ?auto_120763 ?auto_120767 ) ) ( not ( = ?auto_120764 ?auto_120767 ) ) ( not ( = ?auto_120765 ?auto_120767 ) ) ( not ( = ?auto_120766 ?auto_120767 ) ) ( not ( = ?auto_120768 ?auto_120767 ) ) ( not ( = ?auto_120769 ?auto_120767 ) ) ( ON ?auto_120763 ?auto_120762 ) ( ON-TABLE ?auto_120767 ) ( ON ?auto_120764 ?auto_120763 ) ( ON ?auto_120765 ?auto_120764 ) ( CLEAR ?auto_120765 ) ( HOLDING ?auto_120766 ) ( CLEAR ?auto_120768 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120769 ?auto_120768 ?auto_120766 )
      ( MAKE-5PILE ?auto_120762 ?auto_120763 ?auto_120764 ?auto_120765 ?auto_120766 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120770 - BLOCK
      ?auto_120771 - BLOCK
      ?auto_120772 - BLOCK
      ?auto_120773 - BLOCK
      ?auto_120774 - BLOCK
    )
    :vars
    (
      ?auto_120776 - BLOCK
      ?auto_120777 - BLOCK
      ?auto_120775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120770 ?auto_120771 ) ) ( not ( = ?auto_120770 ?auto_120772 ) ) ( not ( = ?auto_120770 ?auto_120773 ) ) ( not ( = ?auto_120770 ?auto_120774 ) ) ( not ( = ?auto_120771 ?auto_120772 ) ) ( not ( = ?auto_120771 ?auto_120773 ) ) ( not ( = ?auto_120771 ?auto_120774 ) ) ( not ( = ?auto_120772 ?auto_120773 ) ) ( not ( = ?auto_120772 ?auto_120774 ) ) ( not ( = ?auto_120773 ?auto_120774 ) ) ( not ( = ?auto_120770 ?auto_120776 ) ) ( not ( = ?auto_120771 ?auto_120776 ) ) ( not ( = ?auto_120772 ?auto_120776 ) ) ( not ( = ?auto_120773 ?auto_120776 ) ) ( not ( = ?auto_120774 ?auto_120776 ) ) ( ON-TABLE ?auto_120777 ) ( ON ?auto_120776 ?auto_120777 ) ( not ( = ?auto_120777 ?auto_120776 ) ) ( not ( = ?auto_120777 ?auto_120774 ) ) ( not ( = ?auto_120777 ?auto_120773 ) ) ( not ( = ?auto_120770 ?auto_120777 ) ) ( not ( = ?auto_120771 ?auto_120777 ) ) ( not ( = ?auto_120772 ?auto_120777 ) ) ( ON ?auto_120770 ?auto_120775 ) ( not ( = ?auto_120770 ?auto_120775 ) ) ( not ( = ?auto_120771 ?auto_120775 ) ) ( not ( = ?auto_120772 ?auto_120775 ) ) ( not ( = ?auto_120773 ?auto_120775 ) ) ( not ( = ?auto_120774 ?auto_120775 ) ) ( not ( = ?auto_120776 ?auto_120775 ) ) ( not ( = ?auto_120777 ?auto_120775 ) ) ( ON ?auto_120771 ?auto_120770 ) ( ON-TABLE ?auto_120775 ) ( ON ?auto_120772 ?auto_120771 ) ( ON ?auto_120773 ?auto_120772 ) ( CLEAR ?auto_120776 ) ( ON ?auto_120774 ?auto_120773 ) ( CLEAR ?auto_120774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120775 ?auto_120770 ?auto_120771 ?auto_120772 ?auto_120773 )
      ( MAKE-5PILE ?auto_120770 ?auto_120771 ?auto_120772 ?auto_120773 ?auto_120774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120778 - BLOCK
      ?auto_120779 - BLOCK
      ?auto_120780 - BLOCK
      ?auto_120781 - BLOCK
      ?auto_120782 - BLOCK
    )
    :vars
    (
      ?auto_120785 - BLOCK
      ?auto_120784 - BLOCK
      ?auto_120783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120778 ?auto_120779 ) ) ( not ( = ?auto_120778 ?auto_120780 ) ) ( not ( = ?auto_120778 ?auto_120781 ) ) ( not ( = ?auto_120778 ?auto_120782 ) ) ( not ( = ?auto_120779 ?auto_120780 ) ) ( not ( = ?auto_120779 ?auto_120781 ) ) ( not ( = ?auto_120779 ?auto_120782 ) ) ( not ( = ?auto_120780 ?auto_120781 ) ) ( not ( = ?auto_120780 ?auto_120782 ) ) ( not ( = ?auto_120781 ?auto_120782 ) ) ( not ( = ?auto_120778 ?auto_120785 ) ) ( not ( = ?auto_120779 ?auto_120785 ) ) ( not ( = ?auto_120780 ?auto_120785 ) ) ( not ( = ?auto_120781 ?auto_120785 ) ) ( not ( = ?auto_120782 ?auto_120785 ) ) ( ON-TABLE ?auto_120784 ) ( not ( = ?auto_120784 ?auto_120785 ) ) ( not ( = ?auto_120784 ?auto_120782 ) ) ( not ( = ?auto_120784 ?auto_120781 ) ) ( not ( = ?auto_120778 ?auto_120784 ) ) ( not ( = ?auto_120779 ?auto_120784 ) ) ( not ( = ?auto_120780 ?auto_120784 ) ) ( ON ?auto_120778 ?auto_120783 ) ( not ( = ?auto_120778 ?auto_120783 ) ) ( not ( = ?auto_120779 ?auto_120783 ) ) ( not ( = ?auto_120780 ?auto_120783 ) ) ( not ( = ?auto_120781 ?auto_120783 ) ) ( not ( = ?auto_120782 ?auto_120783 ) ) ( not ( = ?auto_120785 ?auto_120783 ) ) ( not ( = ?auto_120784 ?auto_120783 ) ) ( ON ?auto_120779 ?auto_120778 ) ( ON-TABLE ?auto_120783 ) ( ON ?auto_120780 ?auto_120779 ) ( ON ?auto_120781 ?auto_120780 ) ( ON ?auto_120782 ?auto_120781 ) ( CLEAR ?auto_120782 ) ( HOLDING ?auto_120785 ) ( CLEAR ?auto_120784 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120784 ?auto_120785 )
      ( MAKE-5PILE ?auto_120778 ?auto_120779 ?auto_120780 ?auto_120781 ?auto_120782 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120786 - BLOCK
      ?auto_120787 - BLOCK
      ?auto_120788 - BLOCK
      ?auto_120789 - BLOCK
      ?auto_120790 - BLOCK
    )
    :vars
    (
      ?auto_120793 - BLOCK
      ?auto_120791 - BLOCK
      ?auto_120792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120786 ?auto_120787 ) ) ( not ( = ?auto_120786 ?auto_120788 ) ) ( not ( = ?auto_120786 ?auto_120789 ) ) ( not ( = ?auto_120786 ?auto_120790 ) ) ( not ( = ?auto_120787 ?auto_120788 ) ) ( not ( = ?auto_120787 ?auto_120789 ) ) ( not ( = ?auto_120787 ?auto_120790 ) ) ( not ( = ?auto_120788 ?auto_120789 ) ) ( not ( = ?auto_120788 ?auto_120790 ) ) ( not ( = ?auto_120789 ?auto_120790 ) ) ( not ( = ?auto_120786 ?auto_120793 ) ) ( not ( = ?auto_120787 ?auto_120793 ) ) ( not ( = ?auto_120788 ?auto_120793 ) ) ( not ( = ?auto_120789 ?auto_120793 ) ) ( not ( = ?auto_120790 ?auto_120793 ) ) ( ON-TABLE ?auto_120791 ) ( not ( = ?auto_120791 ?auto_120793 ) ) ( not ( = ?auto_120791 ?auto_120790 ) ) ( not ( = ?auto_120791 ?auto_120789 ) ) ( not ( = ?auto_120786 ?auto_120791 ) ) ( not ( = ?auto_120787 ?auto_120791 ) ) ( not ( = ?auto_120788 ?auto_120791 ) ) ( ON ?auto_120786 ?auto_120792 ) ( not ( = ?auto_120786 ?auto_120792 ) ) ( not ( = ?auto_120787 ?auto_120792 ) ) ( not ( = ?auto_120788 ?auto_120792 ) ) ( not ( = ?auto_120789 ?auto_120792 ) ) ( not ( = ?auto_120790 ?auto_120792 ) ) ( not ( = ?auto_120793 ?auto_120792 ) ) ( not ( = ?auto_120791 ?auto_120792 ) ) ( ON ?auto_120787 ?auto_120786 ) ( ON-TABLE ?auto_120792 ) ( ON ?auto_120788 ?auto_120787 ) ( ON ?auto_120789 ?auto_120788 ) ( ON ?auto_120790 ?auto_120789 ) ( CLEAR ?auto_120791 ) ( ON ?auto_120793 ?auto_120790 ) ( CLEAR ?auto_120793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120792 ?auto_120786 ?auto_120787 ?auto_120788 ?auto_120789 ?auto_120790 )
      ( MAKE-5PILE ?auto_120786 ?auto_120787 ?auto_120788 ?auto_120789 ?auto_120790 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120794 - BLOCK
      ?auto_120795 - BLOCK
      ?auto_120796 - BLOCK
      ?auto_120797 - BLOCK
      ?auto_120798 - BLOCK
    )
    :vars
    (
      ?auto_120799 - BLOCK
      ?auto_120800 - BLOCK
      ?auto_120801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120794 ?auto_120795 ) ) ( not ( = ?auto_120794 ?auto_120796 ) ) ( not ( = ?auto_120794 ?auto_120797 ) ) ( not ( = ?auto_120794 ?auto_120798 ) ) ( not ( = ?auto_120795 ?auto_120796 ) ) ( not ( = ?auto_120795 ?auto_120797 ) ) ( not ( = ?auto_120795 ?auto_120798 ) ) ( not ( = ?auto_120796 ?auto_120797 ) ) ( not ( = ?auto_120796 ?auto_120798 ) ) ( not ( = ?auto_120797 ?auto_120798 ) ) ( not ( = ?auto_120794 ?auto_120799 ) ) ( not ( = ?auto_120795 ?auto_120799 ) ) ( not ( = ?auto_120796 ?auto_120799 ) ) ( not ( = ?auto_120797 ?auto_120799 ) ) ( not ( = ?auto_120798 ?auto_120799 ) ) ( not ( = ?auto_120800 ?auto_120799 ) ) ( not ( = ?auto_120800 ?auto_120798 ) ) ( not ( = ?auto_120800 ?auto_120797 ) ) ( not ( = ?auto_120794 ?auto_120800 ) ) ( not ( = ?auto_120795 ?auto_120800 ) ) ( not ( = ?auto_120796 ?auto_120800 ) ) ( ON ?auto_120794 ?auto_120801 ) ( not ( = ?auto_120794 ?auto_120801 ) ) ( not ( = ?auto_120795 ?auto_120801 ) ) ( not ( = ?auto_120796 ?auto_120801 ) ) ( not ( = ?auto_120797 ?auto_120801 ) ) ( not ( = ?auto_120798 ?auto_120801 ) ) ( not ( = ?auto_120799 ?auto_120801 ) ) ( not ( = ?auto_120800 ?auto_120801 ) ) ( ON ?auto_120795 ?auto_120794 ) ( ON-TABLE ?auto_120801 ) ( ON ?auto_120796 ?auto_120795 ) ( ON ?auto_120797 ?auto_120796 ) ( ON ?auto_120798 ?auto_120797 ) ( ON ?auto_120799 ?auto_120798 ) ( CLEAR ?auto_120799 ) ( HOLDING ?auto_120800 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120800 )
      ( MAKE-5PILE ?auto_120794 ?auto_120795 ?auto_120796 ?auto_120797 ?auto_120798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_120802 - BLOCK
      ?auto_120803 - BLOCK
      ?auto_120804 - BLOCK
      ?auto_120805 - BLOCK
      ?auto_120806 - BLOCK
    )
    :vars
    (
      ?auto_120807 - BLOCK
      ?auto_120809 - BLOCK
      ?auto_120808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120802 ?auto_120803 ) ) ( not ( = ?auto_120802 ?auto_120804 ) ) ( not ( = ?auto_120802 ?auto_120805 ) ) ( not ( = ?auto_120802 ?auto_120806 ) ) ( not ( = ?auto_120803 ?auto_120804 ) ) ( not ( = ?auto_120803 ?auto_120805 ) ) ( not ( = ?auto_120803 ?auto_120806 ) ) ( not ( = ?auto_120804 ?auto_120805 ) ) ( not ( = ?auto_120804 ?auto_120806 ) ) ( not ( = ?auto_120805 ?auto_120806 ) ) ( not ( = ?auto_120802 ?auto_120807 ) ) ( not ( = ?auto_120803 ?auto_120807 ) ) ( not ( = ?auto_120804 ?auto_120807 ) ) ( not ( = ?auto_120805 ?auto_120807 ) ) ( not ( = ?auto_120806 ?auto_120807 ) ) ( not ( = ?auto_120809 ?auto_120807 ) ) ( not ( = ?auto_120809 ?auto_120806 ) ) ( not ( = ?auto_120809 ?auto_120805 ) ) ( not ( = ?auto_120802 ?auto_120809 ) ) ( not ( = ?auto_120803 ?auto_120809 ) ) ( not ( = ?auto_120804 ?auto_120809 ) ) ( ON ?auto_120802 ?auto_120808 ) ( not ( = ?auto_120802 ?auto_120808 ) ) ( not ( = ?auto_120803 ?auto_120808 ) ) ( not ( = ?auto_120804 ?auto_120808 ) ) ( not ( = ?auto_120805 ?auto_120808 ) ) ( not ( = ?auto_120806 ?auto_120808 ) ) ( not ( = ?auto_120807 ?auto_120808 ) ) ( not ( = ?auto_120809 ?auto_120808 ) ) ( ON ?auto_120803 ?auto_120802 ) ( ON-TABLE ?auto_120808 ) ( ON ?auto_120804 ?auto_120803 ) ( ON ?auto_120805 ?auto_120804 ) ( ON ?auto_120806 ?auto_120805 ) ( ON ?auto_120807 ?auto_120806 ) ( ON ?auto_120809 ?auto_120807 ) ( CLEAR ?auto_120809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120808 ?auto_120802 ?auto_120803 ?auto_120804 ?auto_120805 ?auto_120806 ?auto_120807 )
      ( MAKE-5PILE ?auto_120802 ?auto_120803 ?auto_120804 ?auto_120805 ?auto_120806 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120811 - BLOCK
    )
    :vars
    (
      ?auto_120812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120812 ?auto_120811 ) ( CLEAR ?auto_120812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120811 ) ( not ( = ?auto_120811 ?auto_120812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120812 ?auto_120811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120813 - BLOCK
    )
    :vars
    (
      ?auto_120814 - BLOCK
      ?auto_120815 - BLOCK
      ?auto_120816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120814 ?auto_120813 ) ( CLEAR ?auto_120814 ) ( ON-TABLE ?auto_120813 ) ( not ( = ?auto_120813 ?auto_120814 ) ) ( HOLDING ?auto_120815 ) ( CLEAR ?auto_120816 ) ( not ( = ?auto_120813 ?auto_120815 ) ) ( not ( = ?auto_120813 ?auto_120816 ) ) ( not ( = ?auto_120814 ?auto_120815 ) ) ( not ( = ?auto_120814 ?auto_120816 ) ) ( not ( = ?auto_120815 ?auto_120816 ) ) )
    :subtasks
    ( ( !STACK ?auto_120815 ?auto_120816 )
      ( MAKE-1PILE ?auto_120813 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120817 - BLOCK
    )
    :vars
    (
      ?auto_120818 - BLOCK
      ?auto_120820 - BLOCK
      ?auto_120819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120818 ?auto_120817 ) ( ON-TABLE ?auto_120817 ) ( not ( = ?auto_120817 ?auto_120818 ) ) ( CLEAR ?auto_120820 ) ( not ( = ?auto_120817 ?auto_120819 ) ) ( not ( = ?auto_120817 ?auto_120820 ) ) ( not ( = ?auto_120818 ?auto_120819 ) ) ( not ( = ?auto_120818 ?auto_120820 ) ) ( not ( = ?auto_120819 ?auto_120820 ) ) ( ON ?auto_120819 ?auto_120818 ) ( CLEAR ?auto_120819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120817 ?auto_120818 )
      ( MAKE-1PILE ?auto_120817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120821 - BLOCK
    )
    :vars
    (
      ?auto_120823 - BLOCK
      ?auto_120822 - BLOCK
      ?auto_120824 - BLOCK
      ?auto_120825 - BLOCK
      ?auto_120826 - BLOCK
      ?auto_120827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120823 ?auto_120821 ) ( ON-TABLE ?auto_120821 ) ( not ( = ?auto_120821 ?auto_120823 ) ) ( not ( = ?auto_120821 ?auto_120822 ) ) ( not ( = ?auto_120821 ?auto_120824 ) ) ( not ( = ?auto_120823 ?auto_120822 ) ) ( not ( = ?auto_120823 ?auto_120824 ) ) ( not ( = ?auto_120822 ?auto_120824 ) ) ( ON ?auto_120822 ?auto_120823 ) ( CLEAR ?auto_120822 ) ( HOLDING ?auto_120824 ) ( CLEAR ?auto_120825 ) ( ON-TABLE ?auto_120826 ) ( ON ?auto_120827 ?auto_120826 ) ( ON ?auto_120825 ?auto_120827 ) ( not ( = ?auto_120826 ?auto_120827 ) ) ( not ( = ?auto_120826 ?auto_120825 ) ) ( not ( = ?auto_120826 ?auto_120824 ) ) ( not ( = ?auto_120827 ?auto_120825 ) ) ( not ( = ?auto_120827 ?auto_120824 ) ) ( not ( = ?auto_120825 ?auto_120824 ) ) ( not ( = ?auto_120821 ?auto_120825 ) ) ( not ( = ?auto_120821 ?auto_120826 ) ) ( not ( = ?auto_120821 ?auto_120827 ) ) ( not ( = ?auto_120823 ?auto_120825 ) ) ( not ( = ?auto_120823 ?auto_120826 ) ) ( not ( = ?auto_120823 ?auto_120827 ) ) ( not ( = ?auto_120822 ?auto_120825 ) ) ( not ( = ?auto_120822 ?auto_120826 ) ) ( not ( = ?auto_120822 ?auto_120827 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120826 ?auto_120827 ?auto_120825 ?auto_120824 )
      ( MAKE-1PILE ?auto_120821 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120828 - BLOCK
    )
    :vars
    (
      ?auto_120833 - BLOCK
      ?auto_120834 - BLOCK
      ?auto_120831 - BLOCK
      ?auto_120832 - BLOCK
      ?auto_120830 - BLOCK
      ?auto_120829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120833 ?auto_120828 ) ( ON-TABLE ?auto_120828 ) ( not ( = ?auto_120828 ?auto_120833 ) ) ( not ( = ?auto_120828 ?auto_120834 ) ) ( not ( = ?auto_120828 ?auto_120831 ) ) ( not ( = ?auto_120833 ?auto_120834 ) ) ( not ( = ?auto_120833 ?auto_120831 ) ) ( not ( = ?auto_120834 ?auto_120831 ) ) ( ON ?auto_120834 ?auto_120833 ) ( CLEAR ?auto_120832 ) ( ON-TABLE ?auto_120830 ) ( ON ?auto_120829 ?auto_120830 ) ( ON ?auto_120832 ?auto_120829 ) ( not ( = ?auto_120830 ?auto_120829 ) ) ( not ( = ?auto_120830 ?auto_120832 ) ) ( not ( = ?auto_120830 ?auto_120831 ) ) ( not ( = ?auto_120829 ?auto_120832 ) ) ( not ( = ?auto_120829 ?auto_120831 ) ) ( not ( = ?auto_120832 ?auto_120831 ) ) ( not ( = ?auto_120828 ?auto_120832 ) ) ( not ( = ?auto_120828 ?auto_120830 ) ) ( not ( = ?auto_120828 ?auto_120829 ) ) ( not ( = ?auto_120833 ?auto_120832 ) ) ( not ( = ?auto_120833 ?auto_120830 ) ) ( not ( = ?auto_120833 ?auto_120829 ) ) ( not ( = ?auto_120834 ?auto_120832 ) ) ( not ( = ?auto_120834 ?auto_120830 ) ) ( not ( = ?auto_120834 ?auto_120829 ) ) ( ON ?auto_120831 ?auto_120834 ) ( CLEAR ?auto_120831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120828 ?auto_120833 ?auto_120834 )
      ( MAKE-1PILE ?auto_120828 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120835 - BLOCK
    )
    :vars
    (
      ?auto_120838 - BLOCK
      ?auto_120837 - BLOCK
      ?auto_120840 - BLOCK
      ?auto_120839 - BLOCK
      ?auto_120841 - BLOCK
      ?auto_120836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120838 ?auto_120835 ) ( ON-TABLE ?auto_120835 ) ( not ( = ?auto_120835 ?auto_120838 ) ) ( not ( = ?auto_120835 ?auto_120837 ) ) ( not ( = ?auto_120835 ?auto_120840 ) ) ( not ( = ?auto_120838 ?auto_120837 ) ) ( not ( = ?auto_120838 ?auto_120840 ) ) ( not ( = ?auto_120837 ?auto_120840 ) ) ( ON ?auto_120837 ?auto_120838 ) ( ON-TABLE ?auto_120839 ) ( ON ?auto_120841 ?auto_120839 ) ( not ( = ?auto_120839 ?auto_120841 ) ) ( not ( = ?auto_120839 ?auto_120836 ) ) ( not ( = ?auto_120839 ?auto_120840 ) ) ( not ( = ?auto_120841 ?auto_120836 ) ) ( not ( = ?auto_120841 ?auto_120840 ) ) ( not ( = ?auto_120836 ?auto_120840 ) ) ( not ( = ?auto_120835 ?auto_120836 ) ) ( not ( = ?auto_120835 ?auto_120839 ) ) ( not ( = ?auto_120835 ?auto_120841 ) ) ( not ( = ?auto_120838 ?auto_120836 ) ) ( not ( = ?auto_120838 ?auto_120839 ) ) ( not ( = ?auto_120838 ?auto_120841 ) ) ( not ( = ?auto_120837 ?auto_120836 ) ) ( not ( = ?auto_120837 ?auto_120839 ) ) ( not ( = ?auto_120837 ?auto_120841 ) ) ( ON ?auto_120840 ?auto_120837 ) ( CLEAR ?auto_120840 ) ( HOLDING ?auto_120836 ) ( CLEAR ?auto_120841 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120839 ?auto_120841 ?auto_120836 )
      ( MAKE-1PILE ?auto_120835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120842 - BLOCK
    )
    :vars
    (
      ?auto_120847 - BLOCK
      ?auto_120844 - BLOCK
      ?auto_120845 - BLOCK
      ?auto_120848 - BLOCK
      ?auto_120846 - BLOCK
      ?auto_120843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120847 ?auto_120842 ) ( ON-TABLE ?auto_120842 ) ( not ( = ?auto_120842 ?auto_120847 ) ) ( not ( = ?auto_120842 ?auto_120844 ) ) ( not ( = ?auto_120842 ?auto_120845 ) ) ( not ( = ?auto_120847 ?auto_120844 ) ) ( not ( = ?auto_120847 ?auto_120845 ) ) ( not ( = ?auto_120844 ?auto_120845 ) ) ( ON ?auto_120844 ?auto_120847 ) ( ON-TABLE ?auto_120848 ) ( ON ?auto_120846 ?auto_120848 ) ( not ( = ?auto_120848 ?auto_120846 ) ) ( not ( = ?auto_120848 ?auto_120843 ) ) ( not ( = ?auto_120848 ?auto_120845 ) ) ( not ( = ?auto_120846 ?auto_120843 ) ) ( not ( = ?auto_120846 ?auto_120845 ) ) ( not ( = ?auto_120843 ?auto_120845 ) ) ( not ( = ?auto_120842 ?auto_120843 ) ) ( not ( = ?auto_120842 ?auto_120848 ) ) ( not ( = ?auto_120842 ?auto_120846 ) ) ( not ( = ?auto_120847 ?auto_120843 ) ) ( not ( = ?auto_120847 ?auto_120848 ) ) ( not ( = ?auto_120847 ?auto_120846 ) ) ( not ( = ?auto_120844 ?auto_120843 ) ) ( not ( = ?auto_120844 ?auto_120848 ) ) ( not ( = ?auto_120844 ?auto_120846 ) ) ( ON ?auto_120845 ?auto_120844 ) ( CLEAR ?auto_120846 ) ( ON ?auto_120843 ?auto_120845 ) ( CLEAR ?auto_120843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120842 ?auto_120847 ?auto_120844 ?auto_120845 )
      ( MAKE-1PILE ?auto_120842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120849 - BLOCK
    )
    :vars
    (
      ?auto_120852 - BLOCK
      ?auto_120855 - BLOCK
      ?auto_120851 - BLOCK
      ?auto_120853 - BLOCK
      ?auto_120850 - BLOCK
      ?auto_120854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120852 ?auto_120849 ) ( ON-TABLE ?auto_120849 ) ( not ( = ?auto_120849 ?auto_120852 ) ) ( not ( = ?auto_120849 ?auto_120855 ) ) ( not ( = ?auto_120849 ?auto_120851 ) ) ( not ( = ?auto_120852 ?auto_120855 ) ) ( not ( = ?auto_120852 ?auto_120851 ) ) ( not ( = ?auto_120855 ?auto_120851 ) ) ( ON ?auto_120855 ?auto_120852 ) ( ON-TABLE ?auto_120853 ) ( not ( = ?auto_120853 ?auto_120850 ) ) ( not ( = ?auto_120853 ?auto_120854 ) ) ( not ( = ?auto_120853 ?auto_120851 ) ) ( not ( = ?auto_120850 ?auto_120854 ) ) ( not ( = ?auto_120850 ?auto_120851 ) ) ( not ( = ?auto_120854 ?auto_120851 ) ) ( not ( = ?auto_120849 ?auto_120854 ) ) ( not ( = ?auto_120849 ?auto_120853 ) ) ( not ( = ?auto_120849 ?auto_120850 ) ) ( not ( = ?auto_120852 ?auto_120854 ) ) ( not ( = ?auto_120852 ?auto_120853 ) ) ( not ( = ?auto_120852 ?auto_120850 ) ) ( not ( = ?auto_120855 ?auto_120854 ) ) ( not ( = ?auto_120855 ?auto_120853 ) ) ( not ( = ?auto_120855 ?auto_120850 ) ) ( ON ?auto_120851 ?auto_120855 ) ( ON ?auto_120854 ?auto_120851 ) ( CLEAR ?auto_120854 ) ( HOLDING ?auto_120850 ) ( CLEAR ?auto_120853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120853 ?auto_120850 )
      ( MAKE-1PILE ?auto_120849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120856 - BLOCK
    )
    :vars
    (
      ?auto_120862 - BLOCK
      ?auto_120859 - BLOCK
      ?auto_120857 - BLOCK
      ?auto_120858 - BLOCK
      ?auto_120860 - BLOCK
      ?auto_120861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120862 ?auto_120856 ) ( ON-TABLE ?auto_120856 ) ( not ( = ?auto_120856 ?auto_120862 ) ) ( not ( = ?auto_120856 ?auto_120859 ) ) ( not ( = ?auto_120856 ?auto_120857 ) ) ( not ( = ?auto_120862 ?auto_120859 ) ) ( not ( = ?auto_120862 ?auto_120857 ) ) ( not ( = ?auto_120859 ?auto_120857 ) ) ( ON ?auto_120859 ?auto_120862 ) ( ON-TABLE ?auto_120858 ) ( not ( = ?auto_120858 ?auto_120860 ) ) ( not ( = ?auto_120858 ?auto_120861 ) ) ( not ( = ?auto_120858 ?auto_120857 ) ) ( not ( = ?auto_120860 ?auto_120861 ) ) ( not ( = ?auto_120860 ?auto_120857 ) ) ( not ( = ?auto_120861 ?auto_120857 ) ) ( not ( = ?auto_120856 ?auto_120861 ) ) ( not ( = ?auto_120856 ?auto_120858 ) ) ( not ( = ?auto_120856 ?auto_120860 ) ) ( not ( = ?auto_120862 ?auto_120861 ) ) ( not ( = ?auto_120862 ?auto_120858 ) ) ( not ( = ?auto_120862 ?auto_120860 ) ) ( not ( = ?auto_120859 ?auto_120861 ) ) ( not ( = ?auto_120859 ?auto_120858 ) ) ( not ( = ?auto_120859 ?auto_120860 ) ) ( ON ?auto_120857 ?auto_120859 ) ( ON ?auto_120861 ?auto_120857 ) ( CLEAR ?auto_120858 ) ( ON ?auto_120860 ?auto_120861 ) ( CLEAR ?auto_120860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120856 ?auto_120862 ?auto_120859 ?auto_120857 ?auto_120861 )
      ( MAKE-1PILE ?auto_120856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120863 - BLOCK
    )
    :vars
    (
      ?auto_120868 - BLOCK
      ?auto_120864 - BLOCK
      ?auto_120869 - BLOCK
      ?auto_120866 - BLOCK
      ?auto_120865 - BLOCK
      ?auto_120867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120868 ?auto_120863 ) ( ON-TABLE ?auto_120863 ) ( not ( = ?auto_120863 ?auto_120868 ) ) ( not ( = ?auto_120863 ?auto_120864 ) ) ( not ( = ?auto_120863 ?auto_120869 ) ) ( not ( = ?auto_120868 ?auto_120864 ) ) ( not ( = ?auto_120868 ?auto_120869 ) ) ( not ( = ?auto_120864 ?auto_120869 ) ) ( ON ?auto_120864 ?auto_120868 ) ( not ( = ?auto_120866 ?auto_120865 ) ) ( not ( = ?auto_120866 ?auto_120867 ) ) ( not ( = ?auto_120866 ?auto_120869 ) ) ( not ( = ?auto_120865 ?auto_120867 ) ) ( not ( = ?auto_120865 ?auto_120869 ) ) ( not ( = ?auto_120867 ?auto_120869 ) ) ( not ( = ?auto_120863 ?auto_120867 ) ) ( not ( = ?auto_120863 ?auto_120866 ) ) ( not ( = ?auto_120863 ?auto_120865 ) ) ( not ( = ?auto_120868 ?auto_120867 ) ) ( not ( = ?auto_120868 ?auto_120866 ) ) ( not ( = ?auto_120868 ?auto_120865 ) ) ( not ( = ?auto_120864 ?auto_120867 ) ) ( not ( = ?auto_120864 ?auto_120866 ) ) ( not ( = ?auto_120864 ?auto_120865 ) ) ( ON ?auto_120869 ?auto_120864 ) ( ON ?auto_120867 ?auto_120869 ) ( ON ?auto_120865 ?auto_120867 ) ( CLEAR ?auto_120865 ) ( HOLDING ?auto_120866 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_120866 )
      ( MAKE-1PILE ?auto_120863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120870 - BLOCK
    )
    :vars
    (
      ?auto_120875 - BLOCK
      ?auto_120873 - BLOCK
      ?auto_120874 - BLOCK
      ?auto_120872 - BLOCK
      ?auto_120871 - BLOCK
      ?auto_120876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120875 ?auto_120870 ) ( ON-TABLE ?auto_120870 ) ( not ( = ?auto_120870 ?auto_120875 ) ) ( not ( = ?auto_120870 ?auto_120873 ) ) ( not ( = ?auto_120870 ?auto_120874 ) ) ( not ( = ?auto_120875 ?auto_120873 ) ) ( not ( = ?auto_120875 ?auto_120874 ) ) ( not ( = ?auto_120873 ?auto_120874 ) ) ( ON ?auto_120873 ?auto_120875 ) ( not ( = ?auto_120872 ?auto_120871 ) ) ( not ( = ?auto_120872 ?auto_120876 ) ) ( not ( = ?auto_120872 ?auto_120874 ) ) ( not ( = ?auto_120871 ?auto_120876 ) ) ( not ( = ?auto_120871 ?auto_120874 ) ) ( not ( = ?auto_120876 ?auto_120874 ) ) ( not ( = ?auto_120870 ?auto_120876 ) ) ( not ( = ?auto_120870 ?auto_120872 ) ) ( not ( = ?auto_120870 ?auto_120871 ) ) ( not ( = ?auto_120875 ?auto_120876 ) ) ( not ( = ?auto_120875 ?auto_120872 ) ) ( not ( = ?auto_120875 ?auto_120871 ) ) ( not ( = ?auto_120873 ?auto_120876 ) ) ( not ( = ?auto_120873 ?auto_120872 ) ) ( not ( = ?auto_120873 ?auto_120871 ) ) ( ON ?auto_120874 ?auto_120873 ) ( ON ?auto_120876 ?auto_120874 ) ( ON ?auto_120871 ?auto_120876 ) ( ON ?auto_120872 ?auto_120871 ) ( CLEAR ?auto_120872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120870 ?auto_120875 ?auto_120873 ?auto_120874 ?auto_120876 ?auto_120871 )
      ( MAKE-1PILE ?auto_120870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120877 - BLOCK
    )
    :vars
    (
      ?auto_120878 - BLOCK
      ?auto_120882 - BLOCK
      ?auto_120879 - BLOCK
      ?auto_120881 - BLOCK
      ?auto_120880 - BLOCK
      ?auto_120883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120878 ?auto_120877 ) ( ON-TABLE ?auto_120877 ) ( not ( = ?auto_120877 ?auto_120878 ) ) ( not ( = ?auto_120877 ?auto_120882 ) ) ( not ( = ?auto_120877 ?auto_120879 ) ) ( not ( = ?auto_120878 ?auto_120882 ) ) ( not ( = ?auto_120878 ?auto_120879 ) ) ( not ( = ?auto_120882 ?auto_120879 ) ) ( ON ?auto_120882 ?auto_120878 ) ( not ( = ?auto_120881 ?auto_120880 ) ) ( not ( = ?auto_120881 ?auto_120883 ) ) ( not ( = ?auto_120881 ?auto_120879 ) ) ( not ( = ?auto_120880 ?auto_120883 ) ) ( not ( = ?auto_120880 ?auto_120879 ) ) ( not ( = ?auto_120883 ?auto_120879 ) ) ( not ( = ?auto_120877 ?auto_120883 ) ) ( not ( = ?auto_120877 ?auto_120881 ) ) ( not ( = ?auto_120877 ?auto_120880 ) ) ( not ( = ?auto_120878 ?auto_120883 ) ) ( not ( = ?auto_120878 ?auto_120881 ) ) ( not ( = ?auto_120878 ?auto_120880 ) ) ( not ( = ?auto_120882 ?auto_120883 ) ) ( not ( = ?auto_120882 ?auto_120881 ) ) ( not ( = ?auto_120882 ?auto_120880 ) ) ( ON ?auto_120879 ?auto_120882 ) ( ON ?auto_120883 ?auto_120879 ) ( ON ?auto_120880 ?auto_120883 ) ( HOLDING ?auto_120881 ) ( CLEAR ?auto_120880 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120877 ?auto_120878 ?auto_120882 ?auto_120879 ?auto_120883 ?auto_120880 ?auto_120881 )
      ( MAKE-1PILE ?auto_120877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120884 - BLOCK
    )
    :vars
    (
      ?auto_120888 - BLOCK
      ?auto_120885 - BLOCK
      ?auto_120887 - BLOCK
      ?auto_120890 - BLOCK
      ?auto_120886 - BLOCK
      ?auto_120889 - BLOCK
      ?auto_120891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120888 ?auto_120884 ) ( ON-TABLE ?auto_120884 ) ( not ( = ?auto_120884 ?auto_120888 ) ) ( not ( = ?auto_120884 ?auto_120885 ) ) ( not ( = ?auto_120884 ?auto_120887 ) ) ( not ( = ?auto_120888 ?auto_120885 ) ) ( not ( = ?auto_120888 ?auto_120887 ) ) ( not ( = ?auto_120885 ?auto_120887 ) ) ( ON ?auto_120885 ?auto_120888 ) ( not ( = ?auto_120890 ?auto_120886 ) ) ( not ( = ?auto_120890 ?auto_120889 ) ) ( not ( = ?auto_120890 ?auto_120887 ) ) ( not ( = ?auto_120886 ?auto_120889 ) ) ( not ( = ?auto_120886 ?auto_120887 ) ) ( not ( = ?auto_120889 ?auto_120887 ) ) ( not ( = ?auto_120884 ?auto_120889 ) ) ( not ( = ?auto_120884 ?auto_120890 ) ) ( not ( = ?auto_120884 ?auto_120886 ) ) ( not ( = ?auto_120888 ?auto_120889 ) ) ( not ( = ?auto_120888 ?auto_120890 ) ) ( not ( = ?auto_120888 ?auto_120886 ) ) ( not ( = ?auto_120885 ?auto_120889 ) ) ( not ( = ?auto_120885 ?auto_120890 ) ) ( not ( = ?auto_120885 ?auto_120886 ) ) ( ON ?auto_120887 ?auto_120885 ) ( ON ?auto_120889 ?auto_120887 ) ( ON ?auto_120886 ?auto_120889 ) ( CLEAR ?auto_120886 ) ( ON ?auto_120890 ?auto_120891 ) ( CLEAR ?auto_120890 ) ( HAND-EMPTY ) ( not ( = ?auto_120884 ?auto_120891 ) ) ( not ( = ?auto_120888 ?auto_120891 ) ) ( not ( = ?auto_120885 ?auto_120891 ) ) ( not ( = ?auto_120887 ?auto_120891 ) ) ( not ( = ?auto_120890 ?auto_120891 ) ) ( not ( = ?auto_120886 ?auto_120891 ) ) ( not ( = ?auto_120889 ?auto_120891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_120890 ?auto_120891 )
      ( MAKE-1PILE ?auto_120884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120892 - BLOCK
    )
    :vars
    (
      ?auto_120893 - BLOCK
      ?auto_120896 - BLOCK
      ?auto_120894 - BLOCK
      ?auto_120898 - BLOCK
      ?auto_120895 - BLOCK
      ?auto_120899 - BLOCK
      ?auto_120897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120893 ?auto_120892 ) ( ON-TABLE ?auto_120892 ) ( not ( = ?auto_120892 ?auto_120893 ) ) ( not ( = ?auto_120892 ?auto_120896 ) ) ( not ( = ?auto_120892 ?auto_120894 ) ) ( not ( = ?auto_120893 ?auto_120896 ) ) ( not ( = ?auto_120893 ?auto_120894 ) ) ( not ( = ?auto_120896 ?auto_120894 ) ) ( ON ?auto_120896 ?auto_120893 ) ( not ( = ?auto_120898 ?auto_120895 ) ) ( not ( = ?auto_120898 ?auto_120899 ) ) ( not ( = ?auto_120898 ?auto_120894 ) ) ( not ( = ?auto_120895 ?auto_120899 ) ) ( not ( = ?auto_120895 ?auto_120894 ) ) ( not ( = ?auto_120899 ?auto_120894 ) ) ( not ( = ?auto_120892 ?auto_120899 ) ) ( not ( = ?auto_120892 ?auto_120898 ) ) ( not ( = ?auto_120892 ?auto_120895 ) ) ( not ( = ?auto_120893 ?auto_120899 ) ) ( not ( = ?auto_120893 ?auto_120898 ) ) ( not ( = ?auto_120893 ?auto_120895 ) ) ( not ( = ?auto_120896 ?auto_120899 ) ) ( not ( = ?auto_120896 ?auto_120898 ) ) ( not ( = ?auto_120896 ?auto_120895 ) ) ( ON ?auto_120894 ?auto_120896 ) ( ON ?auto_120899 ?auto_120894 ) ( ON ?auto_120898 ?auto_120897 ) ( CLEAR ?auto_120898 ) ( not ( = ?auto_120892 ?auto_120897 ) ) ( not ( = ?auto_120893 ?auto_120897 ) ) ( not ( = ?auto_120896 ?auto_120897 ) ) ( not ( = ?auto_120894 ?auto_120897 ) ) ( not ( = ?auto_120898 ?auto_120897 ) ) ( not ( = ?auto_120895 ?auto_120897 ) ) ( not ( = ?auto_120899 ?auto_120897 ) ) ( HOLDING ?auto_120895 ) ( CLEAR ?auto_120899 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_120892 ?auto_120893 ?auto_120896 ?auto_120894 ?auto_120899 ?auto_120895 )
      ( MAKE-1PILE ?auto_120892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120900 - BLOCK
    )
    :vars
    (
      ?auto_120901 - BLOCK
      ?auto_120904 - BLOCK
      ?auto_120903 - BLOCK
      ?auto_120907 - BLOCK
      ?auto_120902 - BLOCK
      ?auto_120906 - BLOCK
      ?auto_120905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120901 ?auto_120900 ) ( ON-TABLE ?auto_120900 ) ( not ( = ?auto_120900 ?auto_120901 ) ) ( not ( = ?auto_120900 ?auto_120904 ) ) ( not ( = ?auto_120900 ?auto_120903 ) ) ( not ( = ?auto_120901 ?auto_120904 ) ) ( not ( = ?auto_120901 ?auto_120903 ) ) ( not ( = ?auto_120904 ?auto_120903 ) ) ( ON ?auto_120904 ?auto_120901 ) ( not ( = ?auto_120907 ?auto_120902 ) ) ( not ( = ?auto_120907 ?auto_120906 ) ) ( not ( = ?auto_120907 ?auto_120903 ) ) ( not ( = ?auto_120902 ?auto_120906 ) ) ( not ( = ?auto_120902 ?auto_120903 ) ) ( not ( = ?auto_120906 ?auto_120903 ) ) ( not ( = ?auto_120900 ?auto_120906 ) ) ( not ( = ?auto_120900 ?auto_120907 ) ) ( not ( = ?auto_120900 ?auto_120902 ) ) ( not ( = ?auto_120901 ?auto_120906 ) ) ( not ( = ?auto_120901 ?auto_120907 ) ) ( not ( = ?auto_120901 ?auto_120902 ) ) ( not ( = ?auto_120904 ?auto_120906 ) ) ( not ( = ?auto_120904 ?auto_120907 ) ) ( not ( = ?auto_120904 ?auto_120902 ) ) ( ON ?auto_120903 ?auto_120904 ) ( ON ?auto_120906 ?auto_120903 ) ( ON ?auto_120907 ?auto_120905 ) ( not ( = ?auto_120900 ?auto_120905 ) ) ( not ( = ?auto_120901 ?auto_120905 ) ) ( not ( = ?auto_120904 ?auto_120905 ) ) ( not ( = ?auto_120903 ?auto_120905 ) ) ( not ( = ?auto_120907 ?auto_120905 ) ) ( not ( = ?auto_120902 ?auto_120905 ) ) ( not ( = ?auto_120906 ?auto_120905 ) ) ( CLEAR ?auto_120906 ) ( ON ?auto_120902 ?auto_120907 ) ( CLEAR ?auto_120902 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_120905 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120905 ?auto_120907 )
      ( MAKE-1PILE ?auto_120900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120908 - BLOCK
    )
    :vars
    (
      ?auto_120915 - BLOCK
      ?auto_120912 - BLOCK
      ?auto_120913 - BLOCK
      ?auto_120914 - BLOCK
      ?auto_120910 - BLOCK
      ?auto_120909 - BLOCK
      ?auto_120911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120915 ?auto_120908 ) ( ON-TABLE ?auto_120908 ) ( not ( = ?auto_120908 ?auto_120915 ) ) ( not ( = ?auto_120908 ?auto_120912 ) ) ( not ( = ?auto_120908 ?auto_120913 ) ) ( not ( = ?auto_120915 ?auto_120912 ) ) ( not ( = ?auto_120915 ?auto_120913 ) ) ( not ( = ?auto_120912 ?auto_120913 ) ) ( ON ?auto_120912 ?auto_120915 ) ( not ( = ?auto_120914 ?auto_120910 ) ) ( not ( = ?auto_120914 ?auto_120909 ) ) ( not ( = ?auto_120914 ?auto_120913 ) ) ( not ( = ?auto_120910 ?auto_120909 ) ) ( not ( = ?auto_120910 ?auto_120913 ) ) ( not ( = ?auto_120909 ?auto_120913 ) ) ( not ( = ?auto_120908 ?auto_120909 ) ) ( not ( = ?auto_120908 ?auto_120914 ) ) ( not ( = ?auto_120908 ?auto_120910 ) ) ( not ( = ?auto_120915 ?auto_120909 ) ) ( not ( = ?auto_120915 ?auto_120914 ) ) ( not ( = ?auto_120915 ?auto_120910 ) ) ( not ( = ?auto_120912 ?auto_120909 ) ) ( not ( = ?auto_120912 ?auto_120914 ) ) ( not ( = ?auto_120912 ?auto_120910 ) ) ( ON ?auto_120913 ?auto_120912 ) ( ON ?auto_120914 ?auto_120911 ) ( not ( = ?auto_120908 ?auto_120911 ) ) ( not ( = ?auto_120915 ?auto_120911 ) ) ( not ( = ?auto_120912 ?auto_120911 ) ) ( not ( = ?auto_120913 ?auto_120911 ) ) ( not ( = ?auto_120914 ?auto_120911 ) ) ( not ( = ?auto_120910 ?auto_120911 ) ) ( not ( = ?auto_120909 ?auto_120911 ) ) ( ON ?auto_120910 ?auto_120914 ) ( CLEAR ?auto_120910 ) ( ON-TABLE ?auto_120911 ) ( HOLDING ?auto_120909 ) ( CLEAR ?auto_120913 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120908 ?auto_120915 ?auto_120912 ?auto_120913 ?auto_120909 )
      ( MAKE-1PILE ?auto_120908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120916 - BLOCK
    )
    :vars
    (
      ?auto_120920 - BLOCK
      ?auto_120923 - BLOCK
      ?auto_120922 - BLOCK
      ?auto_120917 - BLOCK
      ?auto_120919 - BLOCK
      ?auto_120921 - BLOCK
      ?auto_120918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120920 ?auto_120916 ) ( ON-TABLE ?auto_120916 ) ( not ( = ?auto_120916 ?auto_120920 ) ) ( not ( = ?auto_120916 ?auto_120923 ) ) ( not ( = ?auto_120916 ?auto_120922 ) ) ( not ( = ?auto_120920 ?auto_120923 ) ) ( not ( = ?auto_120920 ?auto_120922 ) ) ( not ( = ?auto_120923 ?auto_120922 ) ) ( ON ?auto_120923 ?auto_120920 ) ( not ( = ?auto_120917 ?auto_120919 ) ) ( not ( = ?auto_120917 ?auto_120921 ) ) ( not ( = ?auto_120917 ?auto_120922 ) ) ( not ( = ?auto_120919 ?auto_120921 ) ) ( not ( = ?auto_120919 ?auto_120922 ) ) ( not ( = ?auto_120921 ?auto_120922 ) ) ( not ( = ?auto_120916 ?auto_120921 ) ) ( not ( = ?auto_120916 ?auto_120917 ) ) ( not ( = ?auto_120916 ?auto_120919 ) ) ( not ( = ?auto_120920 ?auto_120921 ) ) ( not ( = ?auto_120920 ?auto_120917 ) ) ( not ( = ?auto_120920 ?auto_120919 ) ) ( not ( = ?auto_120923 ?auto_120921 ) ) ( not ( = ?auto_120923 ?auto_120917 ) ) ( not ( = ?auto_120923 ?auto_120919 ) ) ( ON ?auto_120922 ?auto_120923 ) ( ON ?auto_120917 ?auto_120918 ) ( not ( = ?auto_120916 ?auto_120918 ) ) ( not ( = ?auto_120920 ?auto_120918 ) ) ( not ( = ?auto_120923 ?auto_120918 ) ) ( not ( = ?auto_120922 ?auto_120918 ) ) ( not ( = ?auto_120917 ?auto_120918 ) ) ( not ( = ?auto_120919 ?auto_120918 ) ) ( not ( = ?auto_120921 ?auto_120918 ) ) ( ON ?auto_120919 ?auto_120917 ) ( ON-TABLE ?auto_120918 ) ( CLEAR ?auto_120922 ) ( ON ?auto_120921 ?auto_120919 ) ( CLEAR ?auto_120921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120918 ?auto_120917 ?auto_120919 )
      ( MAKE-1PILE ?auto_120916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120924 - BLOCK
    )
    :vars
    (
      ?auto_120930 - BLOCK
      ?auto_120925 - BLOCK
      ?auto_120927 - BLOCK
      ?auto_120929 - BLOCK
      ?auto_120928 - BLOCK
      ?auto_120926 - BLOCK
      ?auto_120931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120930 ?auto_120924 ) ( ON-TABLE ?auto_120924 ) ( not ( = ?auto_120924 ?auto_120930 ) ) ( not ( = ?auto_120924 ?auto_120925 ) ) ( not ( = ?auto_120924 ?auto_120927 ) ) ( not ( = ?auto_120930 ?auto_120925 ) ) ( not ( = ?auto_120930 ?auto_120927 ) ) ( not ( = ?auto_120925 ?auto_120927 ) ) ( ON ?auto_120925 ?auto_120930 ) ( not ( = ?auto_120929 ?auto_120928 ) ) ( not ( = ?auto_120929 ?auto_120926 ) ) ( not ( = ?auto_120929 ?auto_120927 ) ) ( not ( = ?auto_120928 ?auto_120926 ) ) ( not ( = ?auto_120928 ?auto_120927 ) ) ( not ( = ?auto_120926 ?auto_120927 ) ) ( not ( = ?auto_120924 ?auto_120926 ) ) ( not ( = ?auto_120924 ?auto_120929 ) ) ( not ( = ?auto_120924 ?auto_120928 ) ) ( not ( = ?auto_120930 ?auto_120926 ) ) ( not ( = ?auto_120930 ?auto_120929 ) ) ( not ( = ?auto_120930 ?auto_120928 ) ) ( not ( = ?auto_120925 ?auto_120926 ) ) ( not ( = ?auto_120925 ?auto_120929 ) ) ( not ( = ?auto_120925 ?auto_120928 ) ) ( ON ?auto_120929 ?auto_120931 ) ( not ( = ?auto_120924 ?auto_120931 ) ) ( not ( = ?auto_120930 ?auto_120931 ) ) ( not ( = ?auto_120925 ?auto_120931 ) ) ( not ( = ?auto_120927 ?auto_120931 ) ) ( not ( = ?auto_120929 ?auto_120931 ) ) ( not ( = ?auto_120928 ?auto_120931 ) ) ( not ( = ?auto_120926 ?auto_120931 ) ) ( ON ?auto_120928 ?auto_120929 ) ( ON-TABLE ?auto_120931 ) ( ON ?auto_120926 ?auto_120928 ) ( CLEAR ?auto_120926 ) ( HOLDING ?auto_120927 ) ( CLEAR ?auto_120925 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120924 ?auto_120930 ?auto_120925 ?auto_120927 )
      ( MAKE-1PILE ?auto_120924 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120932 - BLOCK
    )
    :vars
    (
      ?auto_120939 - BLOCK
      ?auto_120933 - BLOCK
      ?auto_120934 - BLOCK
      ?auto_120938 - BLOCK
      ?auto_120936 - BLOCK
      ?auto_120935 - BLOCK
      ?auto_120937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120939 ?auto_120932 ) ( ON-TABLE ?auto_120932 ) ( not ( = ?auto_120932 ?auto_120939 ) ) ( not ( = ?auto_120932 ?auto_120933 ) ) ( not ( = ?auto_120932 ?auto_120934 ) ) ( not ( = ?auto_120939 ?auto_120933 ) ) ( not ( = ?auto_120939 ?auto_120934 ) ) ( not ( = ?auto_120933 ?auto_120934 ) ) ( ON ?auto_120933 ?auto_120939 ) ( not ( = ?auto_120938 ?auto_120936 ) ) ( not ( = ?auto_120938 ?auto_120935 ) ) ( not ( = ?auto_120938 ?auto_120934 ) ) ( not ( = ?auto_120936 ?auto_120935 ) ) ( not ( = ?auto_120936 ?auto_120934 ) ) ( not ( = ?auto_120935 ?auto_120934 ) ) ( not ( = ?auto_120932 ?auto_120935 ) ) ( not ( = ?auto_120932 ?auto_120938 ) ) ( not ( = ?auto_120932 ?auto_120936 ) ) ( not ( = ?auto_120939 ?auto_120935 ) ) ( not ( = ?auto_120939 ?auto_120938 ) ) ( not ( = ?auto_120939 ?auto_120936 ) ) ( not ( = ?auto_120933 ?auto_120935 ) ) ( not ( = ?auto_120933 ?auto_120938 ) ) ( not ( = ?auto_120933 ?auto_120936 ) ) ( ON ?auto_120938 ?auto_120937 ) ( not ( = ?auto_120932 ?auto_120937 ) ) ( not ( = ?auto_120939 ?auto_120937 ) ) ( not ( = ?auto_120933 ?auto_120937 ) ) ( not ( = ?auto_120934 ?auto_120937 ) ) ( not ( = ?auto_120938 ?auto_120937 ) ) ( not ( = ?auto_120936 ?auto_120937 ) ) ( not ( = ?auto_120935 ?auto_120937 ) ) ( ON ?auto_120936 ?auto_120938 ) ( ON-TABLE ?auto_120937 ) ( ON ?auto_120935 ?auto_120936 ) ( CLEAR ?auto_120933 ) ( ON ?auto_120934 ?auto_120935 ) ( CLEAR ?auto_120934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_120937 ?auto_120938 ?auto_120936 ?auto_120935 )
      ( MAKE-1PILE ?auto_120932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120940 - BLOCK
    )
    :vars
    (
      ?auto_120945 - BLOCK
      ?auto_120947 - BLOCK
      ?auto_120946 - BLOCK
      ?auto_120944 - BLOCK
      ?auto_120942 - BLOCK
      ?auto_120941 - BLOCK
      ?auto_120943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120945 ?auto_120940 ) ( ON-TABLE ?auto_120940 ) ( not ( = ?auto_120940 ?auto_120945 ) ) ( not ( = ?auto_120940 ?auto_120947 ) ) ( not ( = ?auto_120940 ?auto_120946 ) ) ( not ( = ?auto_120945 ?auto_120947 ) ) ( not ( = ?auto_120945 ?auto_120946 ) ) ( not ( = ?auto_120947 ?auto_120946 ) ) ( not ( = ?auto_120944 ?auto_120942 ) ) ( not ( = ?auto_120944 ?auto_120941 ) ) ( not ( = ?auto_120944 ?auto_120946 ) ) ( not ( = ?auto_120942 ?auto_120941 ) ) ( not ( = ?auto_120942 ?auto_120946 ) ) ( not ( = ?auto_120941 ?auto_120946 ) ) ( not ( = ?auto_120940 ?auto_120941 ) ) ( not ( = ?auto_120940 ?auto_120944 ) ) ( not ( = ?auto_120940 ?auto_120942 ) ) ( not ( = ?auto_120945 ?auto_120941 ) ) ( not ( = ?auto_120945 ?auto_120944 ) ) ( not ( = ?auto_120945 ?auto_120942 ) ) ( not ( = ?auto_120947 ?auto_120941 ) ) ( not ( = ?auto_120947 ?auto_120944 ) ) ( not ( = ?auto_120947 ?auto_120942 ) ) ( ON ?auto_120944 ?auto_120943 ) ( not ( = ?auto_120940 ?auto_120943 ) ) ( not ( = ?auto_120945 ?auto_120943 ) ) ( not ( = ?auto_120947 ?auto_120943 ) ) ( not ( = ?auto_120946 ?auto_120943 ) ) ( not ( = ?auto_120944 ?auto_120943 ) ) ( not ( = ?auto_120942 ?auto_120943 ) ) ( not ( = ?auto_120941 ?auto_120943 ) ) ( ON ?auto_120942 ?auto_120944 ) ( ON-TABLE ?auto_120943 ) ( ON ?auto_120941 ?auto_120942 ) ( ON ?auto_120946 ?auto_120941 ) ( CLEAR ?auto_120946 ) ( HOLDING ?auto_120947 ) ( CLEAR ?auto_120945 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_120940 ?auto_120945 ?auto_120947 )
      ( MAKE-1PILE ?auto_120940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120948 - BLOCK
    )
    :vars
    (
      ?auto_120954 - BLOCK
      ?auto_120951 - BLOCK
      ?auto_120949 - BLOCK
      ?auto_120953 - BLOCK
      ?auto_120950 - BLOCK
      ?auto_120955 - BLOCK
      ?auto_120952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_120954 ?auto_120948 ) ( ON-TABLE ?auto_120948 ) ( not ( = ?auto_120948 ?auto_120954 ) ) ( not ( = ?auto_120948 ?auto_120951 ) ) ( not ( = ?auto_120948 ?auto_120949 ) ) ( not ( = ?auto_120954 ?auto_120951 ) ) ( not ( = ?auto_120954 ?auto_120949 ) ) ( not ( = ?auto_120951 ?auto_120949 ) ) ( not ( = ?auto_120953 ?auto_120950 ) ) ( not ( = ?auto_120953 ?auto_120955 ) ) ( not ( = ?auto_120953 ?auto_120949 ) ) ( not ( = ?auto_120950 ?auto_120955 ) ) ( not ( = ?auto_120950 ?auto_120949 ) ) ( not ( = ?auto_120955 ?auto_120949 ) ) ( not ( = ?auto_120948 ?auto_120955 ) ) ( not ( = ?auto_120948 ?auto_120953 ) ) ( not ( = ?auto_120948 ?auto_120950 ) ) ( not ( = ?auto_120954 ?auto_120955 ) ) ( not ( = ?auto_120954 ?auto_120953 ) ) ( not ( = ?auto_120954 ?auto_120950 ) ) ( not ( = ?auto_120951 ?auto_120955 ) ) ( not ( = ?auto_120951 ?auto_120953 ) ) ( not ( = ?auto_120951 ?auto_120950 ) ) ( ON ?auto_120953 ?auto_120952 ) ( not ( = ?auto_120948 ?auto_120952 ) ) ( not ( = ?auto_120954 ?auto_120952 ) ) ( not ( = ?auto_120951 ?auto_120952 ) ) ( not ( = ?auto_120949 ?auto_120952 ) ) ( not ( = ?auto_120953 ?auto_120952 ) ) ( not ( = ?auto_120950 ?auto_120952 ) ) ( not ( = ?auto_120955 ?auto_120952 ) ) ( ON ?auto_120950 ?auto_120953 ) ( ON-TABLE ?auto_120952 ) ( ON ?auto_120955 ?auto_120950 ) ( ON ?auto_120949 ?auto_120955 ) ( CLEAR ?auto_120954 ) ( ON ?auto_120951 ?auto_120949 ) ( CLEAR ?auto_120951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_120952 ?auto_120953 ?auto_120950 ?auto_120955 ?auto_120949 )
      ( MAKE-1PILE ?auto_120948 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120972 - BLOCK
    )
    :vars
    (
      ?auto_120974 - BLOCK
      ?auto_120973 - BLOCK
      ?auto_120978 - BLOCK
      ?auto_120977 - BLOCK
      ?auto_120975 - BLOCK
      ?auto_120979 - BLOCK
      ?auto_120976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120972 ?auto_120974 ) ) ( not ( = ?auto_120972 ?auto_120973 ) ) ( not ( = ?auto_120972 ?auto_120978 ) ) ( not ( = ?auto_120974 ?auto_120973 ) ) ( not ( = ?auto_120974 ?auto_120978 ) ) ( not ( = ?auto_120973 ?auto_120978 ) ) ( not ( = ?auto_120977 ?auto_120975 ) ) ( not ( = ?auto_120977 ?auto_120979 ) ) ( not ( = ?auto_120977 ?auto_120978 ) ) ( not ( = ?auto_120975 ?auto_120979 ) ) ( not ( = ?auto_120975 ?auto_120978 ) ) ( not ( = ?auto_120979 ?auto_120978 ) ) ( not ( = ?auto_120972 ?auto_120979 ) ) ( not ( = ?auto_120972 ?auto_120977 ) ) ( not ( = ?auto_120972 ?auto_120975 ) ) ( not ( = ?auto_120974 ?auto_120979 ) ) ( not ( = ?auto_120974 ?auto_120977 ) ) ( not ( = ?auto_120974 ?auto_120975 ) ) ( not ( = ?auto_120973 ?auto_120979 ) ) ( not ( = ?auto_120973 ?auto_120977 ) ) ( not ( = ?auto_120973 ?auto_120975 ) ) ( ON ?auto_120977 ?auto_120976 ) ( not ( = ?auto_120972 ?auto_120976 ) ) ( not ( = ?auto_120974 ?auto_120976 ) ) ( not ( = ?auto_120973 ?auto_120976 ) ) ( not ( = ?auto_120978 ?auto_120976 ) ) ( not ( = ?auto_120977 ?auto_120976 ) ) ( not ( = ?auto_120975 ?auto_120976 ) ) ( not ( = ?auto_120979 ?auto_120976 ) ) ( ON ?auto_120975 ?auto_120977 ) ( ON-TABLE ?auto_120976 ) ( ON ?auto_120979 ?auto_120975 ) ( ON ?auto_120978 ?auto_120979 ) ( ON ?auto_120973 ?auto_120978 ) ( ON ?auto_120974 ?auto_120973 ) ( CLEAR ?auto_120974 ) ( HOLDING ?auto_120972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_120972 ?auto_120974 )
      ( MAKE-1PILE ?auto_120972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_120980 - BLOCK
    )
    :vars
    (
      ?auto_120983 - BLOCK
      ?auto_120985 - BLOCK
      ?auto_120982 - BLOCK
      ?auto_120986 - BLOCK
      ?auto_120984 - BLOCK
      ?auto_120981 - BLOCK
      ?auto_120987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_120980 ?auto_120983 ) ) ( not ( = ?auto_120980 ?auto_120985 ) ) ( not ( = ?auto_120980 ?auto_120982 ) ) ( not ( = ?auto_120983 ?auto_120985 ) ) ( not ( = ?auto_120983 ?auto_120982 ) ) ( not ( = ?auto_120985 ?auto_120982 ) ) ( not ( = ?auto_120986 ?auto_120984 ) ) ( not ( = ?auto_120986 ?auto_120981 ) ) ( not ( = ?auto_120986 ?auto_120982 ) ) ( not ( = ?auto_120984 ?auto_120981 ) ) ( not ( = ?auto_120984 ?auto_120982 ) ) ( not ( = ?auto_120981 ?auto_120982 ) ) ( not ( = ?auto_120980 ?auto_120981 ) ) ( not ( = ?auto_120980 ?auto_120986 ) ) ( not ( = ?auto_120980 ?auto_120984 ) ) ( not ( = ?auto_120983 ?auto_120981 ) ) ( not ( = ?auto_120983 ?auto_120986 ) ) ( not ( = ?auto_120983 ?auto_120984 ) ) ( not ( = ?auto_120985 ?auto_120981 ) ) ( not ( = ?auto_120985 ?auto_120986 ) ) ( not ( = ?auto_120985 ?auto_120984 ) ) ( ON ?auto_120986 ?auto_120987 ) ( not ( = ?auto_120980 ?auto_120987 ) ) ( not ( = ?auto_120983 ?auto_120987 ) ) ( not ( = ?auto_120985 ?auto_120987 ) ) ( not ( = ?auto_120982 ?auto_120987 ) ) ( not ( = ?auto_120986 ?auto_120987 ) ) ( not ( = ?auto_120984 ?auto_120987 ) ) ( not ( = ?auto_120981 ?auto_120987 ) ) ( ON ?auto_120984 ?auto_120986 ) ( ON-TABLE ?auto_120987 ) ( ON ?auto_120981 ?auto_120984 ) ( ON ?auto_120982 ?auto_120981 ) ( ON ?auto_120985 ?auto_120982 ) ( ON ?auto_120983 ?auto_120985 ) ( ON ?auto_120980 ?auto_120983 ) ( CLEAR ?auto_120980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_120987 ?auto_120986 ?auto_120984 ?auto_120981 ?auto_120982 ?auto_120985 ?auto_120983 )
      ( MAKE-1PILE ?auto_120980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_120994 - BLOCK
      ?auto_120995 - BLOCK
      ?auto_120996 - BLOCK
      ?auto_120997 - BLOCK
      ?auto_120998 - BLOCK
      ?auto_120999 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_120999 ) ( CLEAR ?auto_120998 ) ( ON-TABLE ?auto_120994 ) ( ON ?auto_120995 ?auto_120994 ) ( ON ?auto_120996 ?auto_120995 ) ( ON ?auto_120997 ?auto_120996 ) ( ON ?auto_120998 ?auto_120997 ) ( not ( = ?auto_120994 ?auto_120995 ) ) ( not ( = ?auto_120994 ?auto_120996 ) ) ( not ( = ?auto_120994 ?auto_120997 ) ) ( not ( = ?auto_120994 ?auto_120998 ) ) ( not ( = ?auto_120994 ?auto_120999 ) ) ( not ( = ?auto_120995 ?auto_120996 ) ) ( not ( = ?auto_120995 ?auto_120997 ) ) ( not ( = ?auto_120995 ?auto_120998 ) ) ( not ( = ?auto_120995 ?auto_120999 ) ) ( not ( = ?auto_120996 ?auto_120997 ) ) ( not ( = ?auto_120996 ?auto_120998 ) ) ( not ( = ?auto_120996 ?auto_120999 ) ) ( not ( = ?auto_120997 ?auto_120998 ) ) ( not ( = ?auto_120997 ?auto_120999 ) ) ( not ( = ?auto_120998 ?auto_120999 ) ) )
    :subtasks
    ( ( !STACK ?auto_120999 ?auto_120998 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121000 - BLOCK
      ?auto_121001 - BLOCK
      ?auto_121002 - BLOCK
      ?auto_121003 - BLOCK
      ?auto_121004 - BLOCK
      ?auto_121005 - BLOCK
    )
    :vars
    (
      ?auto_121006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121004 ) ( ON-TABLE ?auto_121000 ) ( ON ?auto_121001 ?auto_121000 ) ( ON ?auto_121002 ?auto_121001 ) ( ON ?auto_121003 ?auto_121002 ) ( ON ?auto_121004 ?auto_121003 ) ( not ( = ?auto_121000 ?auto_121001 ) ) ( not ( = ?auto_121000 ?auto_121002 ) ) ( not ( = ?auto_121000 ?auto_121003 ) ) ( not ( = ?auto_121000 ?auto_121004 ) ) ( not ( = ?auto_121000 ?auto_121005 ) ) ( not ( = ?auto_121001 ?auto_121002 ) ) ( not ( = ?auto_121001 ?auto_121003 ) ) ( not ( = ?auto_121001 ?auto_121004 ) ) ( not ( = ?auto_121001 ?auto_121005 ) ) ( not ( = ?auto_121002 ?auto_121003 ) ) ( not ( = ?auto_121002 ?auto_121004 ) ) ( not ( = ?auto_121002 ?auto_121005 ) ) ( not ( = ?auto_121003 ?auto_121004 ) ) ( not ( = ?auto_121003 ?auto_121005 ) ) ( not ( = ?auto_121004 ?auto_121005 ) ) ( ON ?auto_121005 ?auto_121006 ) ( CLEAR ?auto_121005 ) ( HAND-EMPTY ) ( not ( = ?auto_121000 ?auto_121006 ) ) ( not ( = ?auto_121001 ?auto_121006 ) ) ( not ( = ?auto_121002 ?auto_121006 ) ) ( not ( = ?auto_121003 ?auto_121006 ) ) ( not ( = ?auto_121004 ?auto_121006 ) ) ( not ( = ?auto_121005 ?auto_121006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121005 ?auto_121006 )
      ( MAKE-6PILE ?auto_121000 ?auto_121001 ?auto_121002 ?auto_121003 ?auto_121004 ?auto_121005 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121007 - BLOCK
      ?auto_121008 - BLOCK
      ?auto_121009 - BLOCK
      ?auto_121010 - BLOCK
      ?auto_121011 - BLOCK
      ?auto_121012 - BLOCK
    )
    :vars
    (
      ?auto_121013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121007 ) ( ON ?auto_121008 ?auto_121007 ) ( ON ?auto_121009 ?auto_121008 ) ( ON ?auto_121010 ?auto_121009 ) ( not ( = ?auto_121007 ?auto_121008 ) ) ( not ( = ?auto_121007 ?auto_121009 ) ) ( not ( = ?auto_121007 ?auto_121010 ) ) ( not ( = ?auto_121007 ?auto_121011 ) ) ( not ( = ?auto_121007 ?auto_121012 ) ) ( not ( = ?auto_121008 ?auto_121009 ) ) ( not ( = ?auto_121008 ?auto_121010 ) ) ( not ( = ?auto_121008 ?auto_121011 ) ) ( not ( = ?auto_121008 ?auto_121012 ) ) ( not ( = ?auto_121009 ?auto_121010 ) ) ( not ( = ?auto_121009 ?auto_121011 ) ) ( not ( = ?auto_121009 ?auto_121012 ) ) ( not ( = ?auto_121010 ?auto_121011 ) ) ( not ( = ?auto_121010 ?auto_121012 ) ) ( not ( = ?auto_121011 ?auto_121012 ) ) ( ON ?auto_121012 ?auto_121013 ) ( CLEAR ?auto_121012 ) ( not ( = ?auto_121007 ?auto_121013 ) ) ( not ( = ?auto_121008 ?auto_121013 ) ) ( not ( = ?auto_121009 ?auto_121013 ) ) ( not ( = ?auto_121010 ?auto_121013 ) ) ( not ( = ?auto_121011 ?auto_121013 ) ) ( not ( = ?auto_121012 ?auto_121013 ) ) ( HOLDING ?auto_121011 ) ( CLEAR ?auto_121010 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121007 ?auto_121008 ?auto_121009 ?auto_121010 ?auto_121011 )
      ( MAKE-6PILE ?auto_121007 ?auto_121008 ?auto_121009 ?auto_121010 ?auto_121011 ?auto_121012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121014 - BLOCK
      ?auto_121015 - BLOCK
      ?auto_121016 - BLOCK
      ?auto_121017 - BLOCK
      ?auto_121018 - BLOCK
      ?auto_121019 - BLOCK
    )
    :vars
    (
      ?auto_121020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121014 ) ( ON ?auto_121015 ?auto_121014 ) ( ON ?auto_121016 ?auto_121015 ) ( ON ?auto_121017 ?auto_121016 ) ( not ( = ?auto_121014 ?auto_121015 ) ) ( not ( = ?auto_121014 ?auto_121016 ) ) ( not ( = ?auto_121014 ?auto_121017 ) ) ( not ( = ?auto_121014 ?auto_121018 ) ) ( not ( = ?auto_121014 ?auto_121019 ) ) ( not ( = ?auto_121015 ?auto_121016 ) ) ( not ( = ?auto_121015 ?auto_121017 ) ) ( not ( = ?auto_121015 ?auto_121018 ) ) ( not ( = ?auto_121015 ?auto_121019 ) ) ( not ( = ?auto_121016 ?auto_121017 ) ) ( not ( = ?auto_121016 ?auto_121018 ) ) ( not ( = ?auto_121016 ?auto_121019 ) ) ( not ( = ?auto_121017 ?auto_121018 ) ) ( not ( = ?auto_121017 ?auto_121019 ) ) ( not ( = ?auto_121018 ?auto_121019 ) ) ( ON ?auto_121019 ?auto_121020 ) ( not ( = ?auto_121014 ?auto_121020 ) ) ( not ( = ?auto_121015 ?auto_121020 ) ) ( not ( = ?auto_121016 ?auto_121020 ) ) ( not ( = ?auto_121017 ?auto_121020 ) ) ( not ( = ?auto_121018 ?auto_121020 ) ) ( not ( = ?auto_121019 ?auto_121020 ) ) ( CLEAR ?auto_121017 ) ( ON ?auto_121018 ?auto_121019 ) ( CLEAR ?auto_121018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121020 ?auto_121019 )
      ( MAKE-6PILE ?auto_121014 ?auto_121015 ?auto_121016 ?auto_121017 ?auto_121018 ?auto_121019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121021 - BLOCK
      ?auto_121022 - BLOCK
      ?auto_121023 - BLOCK
      ?auto_121024 - BLOCK
      ?auto_121025 - BLOCK
      ?auto_121026 - BLOCK
    )
    :vars
    (
      ?auto_121027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121021 ) ( ON ?auto_121022 ?auto_121021 ) ( ON ?auto_121023 ?auto_121022 ) ( not ( = ?auto_121021 ?auto_121022 ) ) ( not ( = ?auto_121021 ?auto_121023 ) ) ( not ( = ?auto_121021 ?auto_121024 ) ) ( not ( = ?auto_121021 ?auto_121025 ) ) ( not ( = ?auto_121021 ?auto_121026 ) ) ( not ( = ?auto_121022 ?auto_121023 ) ) ( not ( = ?auto_121022 ?auto_121024 ) ) ( not ( = ?auto_121022 ?auto_121025 ) ) ( not ( = ?auto_121022 ?auto_121026 ) ) ( not ( = ?auto_121023 ?auto_121024 ) ) ( not ( = ?auto_121023 ?auto_121025 ) ) ( not ( = ?auto_121023 ?auto_121026 ) ) ( not ( = ?auto_121024 ?auto_121025 ) ) ( not ( = ?auto_121024 ?auto_121026 ) ) ( not ( = ?auto_121025 ?auto_121026 ) ) ( ON ?auto_121026 ?auto_121027 ) ( not ( = ?auto_121021 ?auto_121027 ) ) ( not ( = ?auto_121022 ?auto_121027 ) ) ( not ( = ?auto_121023 ?auto_121027 ) ) ( not ( = ?auto_121024 ?auto_121027 ) ) ( not ( = ?auto_121025 ?auto_121027 ) ) ( not ( = ?auto_121026 ?auto_121027 ) ) ( ON ?auto_121025 ?auto_121026 ) ( CLEAR ?auto_121025 ) ( ON-TABLE ?auto_121027 ) ( HOLDING ?auto_121024 ) ( CLEAR ?auto_121023 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121021 ?auto_121022 ?auto_121023 ?auto_121024 )
      ( MAKE-6PILE ?auto_121021 ?auto_121022 ?auto_121023 ?auto_121024 ?auto_121025 ?auto_121026 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121028 - BLOCK
      ?auto_121029 - BLOCK
      ?auto_121030 - BLOCK
      ?auto_121031 - BLOCK
      ?auto_121032 - BLOCK
      ?auto_121033 - BLOCK
    )
    :vars
    (
      ?auto_121034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121028 ) ( ON ?auto_121029 ?auto_121028 ) ( ON ?auto_121030 ?auto_121029 ) ( not ( = ?auto_121028 ?auto_121029 ) ) ( not ( = ?auto_121028 ?auto_121030 ) ) ( not ( = ?auto_121028 ?auto_121031 ) ) ( not ( = ?auto_121028 ?auto_121032 ) ) ( not ( = ?auto_121028 ?auto_121033 ) ) ( not ( = ?auto_121029 ?auto_121030 ) ) ( not ( = ?auto_121029 ?auto_121031 ) ) ( not ( = ?auto_121029 ?auto_121032 ) ) ( not ( = ?auto_121029 ?auto_121033 ) ) ( not ( = ?auto_121030 ?auto_121031 ) ) ( not ( = ?auto_121030 ?auto_121032 ) ) ( not ( = ?auto_121030 ?auto_121033 ) ) ( not ( = ?auto_121031 ?auto_121032 ) ) ( not ( = ?auto_121031 ?auto_121033 ) ) ( not ( = ?auto_121032 ?auto_121033 ) ) ( ON ?auto_121033 ?auto_121034 ) ( not ( = ?auto_121028 ?auto_121034 ) ) ( not ( = ?auto_121029 ?auto_121034 ) ) ( not ( = ?auto_121030 ?auto_121034 ) ) ( not ( = ?auto_121031 ?auto_121034 ) ) ( not ( = ?auto_121032 ?auto_121034 ) ) ( not ( = ?auto_121033 ?auto_121034 ) ) ( ON ?auto_121032 ?auto_121033 ) ( ON-TABLE ?auto_121034 ) ( CLEAR ?auto_121030 ) ( ON ?auto_121031 ?auto_121032 ) ( CLEAR ?auto_121031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121034 ?auto_121033 ?auto_121032 )
      ( MAKE-6PILE ?auto_121028 ?auto_121029 ?auto_121030 ?auto_121031 ?auto_121032 ?auto_121033 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121035 - BLOCK
      ?auto_121036 - BLOCK
      ?auto_121037 - BLOCK
      ?auto_121038 - BLOCK
      ?auto_121039 - BLOCK
      ?auto_121040 - BLOCK
    )
    :vars
    (
      ?auto_121041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121035 ) ( ON ?auto_121036 ?auto_121035 ) ( not ( = ?auto_121035 ?auto_121036 ) ) ( not ( = ?auto_121035 ?auto_121037 ) ) ( not ( = ?auto_121035 ?auto_121038 ) ) ( not ( = ?auto_121035 ?auto_121039 ) ) ( not ( = ?auto_121035 ?auto_121040 ) ) ( not ( = ?auto_121036 ?auto_121037 ) ) ( not ( = ?auto_121036 ?auto_121038 ) ) ( not ( = ?auto_121036 ?auto_121039 ) ) ( not ( = ?auto_121036 ?auto_121040 ) ) ( not ( = ?auto_121037 ?auto_121038 ) ) ( not ( = ?auto_121037 ?auto_121039 ) ) ( not ( = ?auto_121037 ?auto_121040 ) ) ( not ( = ?auto_121038 ?auto_121039 ) ) ( not ( = ?auto_121038 ?auto_121040 ) ) ( not ( = ?auto_121039 ?auto_121040 ) ) ( ON ?auto_121040 ?auto_121041 ) ( not ( = ?auto_121035 ?auto_121041 ) ) ( not ( = ?auto_121036 ?auto_121041 ) ) ( not ( = ?auto_121037 ?auto_121041 ) ) ( not ( = ?auto_121038 ?auto_121041 ) ) ( not ( = ?auto_121039 ?auto_121041 ) ) ( not ( = ?auto_121040 ?auto_121041 ) ) ( ON ?auto_121039 ?auto_121040 ) ( ON-TABLE ?auto_121041 ) ( ON ?auto_121038 ?auto_121039 ) ( CLEAR ?auto_121038 ) ( HOLDING ?auto_121037 ) ( CLEAR ?auto_121036 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121035 ?auto_121036 ?auto_121037 )
      ( MAKE-6PILE ?auto_121035 ?auto_121036 ?auto_121037 ?auto_121038 ?auto_121039 ?auto_121040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121042 - BLOCK
      ?auto_121043 - BLOCK
      ?auto_121044 - BLOCK
      ?auto_121045 - BLOCK
      ?auto_121046 - BLOCK
      ?auto_121047 - BLOCK
    )
    :vars
    (
      ?auto_121048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121042 ) ( ON ?auto_121043 ?auto_121042 ) ( not ( = ?auto_121042 ?auto_121043 ) ) ( not ( = ?auto_121042 ?auto_121044 ) ) ( not ( = ?auto_121042 ?auto_121045 ) ) ( not ( = ?auto_121042 ?auto_121046 ) ) ( not ( = ?auto_121042 ?auto_121047 ) ) ( not ( = ?auto_121043 ?auto_121044 ) ) ( not ( = ?auto_121043 ?auto_121045 ) ) ( not ( = ?auto_121043 ?auto_121046 ) ) ( not ( = ?auto_121043 ?auto_121047 ) ) ( not ( = ?auto_121044 ?auto_121045 ) ) ( not ( = ?auto_121044 ?auto_121046 ) ) ( not ( = ?auto_121044 ?auto_121047 ) ) ( not ( = ?auto_121045 ?auto_121046 ) ) ( not ( = ?auto_121045 ?auto_121047 ) ) ( not ( = ?auto_121046 ?auto_121047 ) ) ( ON ?auto_121047 ?auto_121048 ) ( not ( = ?auto_121042 ?auto_121048 ) ) ( not ( = ?auto_121043 ?auto_121048 ) ) ( not ( = ?auto_121044 ?auto_121048 ) ) ( not ( = ?auto_121045 ?auto_121048 ) ) ( not ( = ?auto_121046 ?auto_121048 ) ) ( not ( = ?auto_121047 ?auto_121048 ) ) ( ON ?auto_121046 ?auto_121047 ) ( ON-TABLE ?auto_121048 ) ( ON ?auto_121045 ?auto_121046 ) ( CLEAR ?auto_121043 ) ( ON ?auto_121044 ?auto_121045 ) ( CLEAR ?auto_121044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121048 ?auto_121047 ?auto_121046 ?auto_121045 )
      ( MAKE-6PILE ?auto_121042 ?auto_121043 ?auto_121044 ?auto_121045 ?auto_121046 ?auto_121047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121049 - BLOCK
      ?auto_121050 - BLOCK
      ?auto_121051 - BLOCK
      ?auto_121052 - BLOCK
      ?auto_121053 - BLOCK
      ?auto_121054 - BLOCK
    )
    :vars
    (
      ?auto_121055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121049 ) ( not ( = ?auto_121049 ?auto_121050 ) ) ( not ( = ?auto_121049 ?auto_121051 ) ) ( not ( = ?auto_121049 ?auto_121052 ) ) ( not ( = ?auto_121049 ?auto_121053 ) ) ( not ( = ?auto_121049 ?auto_121054 ) ) ( not ( = ?auto_121050 ?auto_121051 ) ) ( not ( = ?auto_121050 ?auto_121052 ) ) ( not ( = ?auto_121050 ?auto_121053 ) ) ( not ( = ?auto_121050 ?auto_121054 ) ) ( not ( = ?auto_121051 ?auto_121052 ) ) ( not ( = ?auto_121051 ?auto_121053 ) ) ( not ( = ?auto_121051 ?auto_121054 ) ) ( not ( = ?auto_121052 ?auto_121053 ) ) ( not ( = ?auto_121052 ?auto_121054 ) ) ( not ( = ?auto_121053 ?auto_121054 ) ) ( ON ?auto_121054 ?auto_121055 ) ( not ( = ?auto_121049 ?auto_121055 ) ) ( not ( = ?auto_121050 ?auto_121055 ) ) ( not ( = ?auto_121051 ?auto_121055 ) ) ( not ( = ?auto_121052 ?auto_121055 ) ) ( not ( = ?auto_121053 ?auto_121055 ) ) ( not ( = ?auto_121054 ?auto_121055 ) ) ( ON ?auto_121053 ?auto_121054 ) ( ON-TABLE ?auto_121055 ) ( ON ?auto_121052 ?auto_121053 ) ( ON ?auto_121051 ?auto_121052 ) ( CLEAR ?auto_121051 ) ( HOLDING ?auto_121050 ) ( CLEAR ?auto_121049 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121049 ?auto_121050 )
      ( MAKE-6PILE ?auto_121049 ?auto_121050 ?auto_121051 ?auto_121052 ?auto_121053 ?auto_121054 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121056 - BLOCK
      ?auto_121057 - BLOCK
      ?auto_121058 - BLOCK
      ?auto_121059 - BLOCK
      ?auto_121060 - BLOCK
      ?auto_121061 - BLOCK
    )
    :vars
    (
      ?auto_121062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121056 ) ( not ( = ?auto_121056 ?auto_121057 ) ) ( not ( = ?auto_121056 ?auto_121058 ) ) ( not ( = ?auto_121056 ?auto_121059 ) ) ( not ( = ?auto_121056 ?auto_121060 ) ) ( not ( = ?auto_121056 ?auto_121061 ) ) ( not ( = ?auto_121057 ?auto_121058 ) ) ( not ( = ?auto_121057 ?auto_121059 ) ) ( not ( = ?auto_121057 ?auto_121060 ) ) ( not ( = ?auto_121057 ?auto_121061 ) ) ( not ( = ?auto_121058 ?auto_121059 ) ) ( not ( = ?auto_121058 ?auto_121060 ) ) ( not ( = ?auto_121058 ?auto_121061 ) ) ( not ( = ?auto_121059 ?auto_121060 ) ) ( not ( = ?auto_121059 ?auto_121061 ) ) ( not ( = ?auto_121060 ?auto_121061 ) ) ( ON ?auto_121061 ?auto_121062 ) ( not ( = ?auto_121056 ?auto_121062 ) ) ( not ( = ?auto_121057 ?auto_121062 ) ) ( not ( = ?auto_121058 ?auto_121062 ) ) ( not ( = ?auto_121059 ?auto_121062 ) ) ( not ( = ?auto_121060 ?auto_121062 ) ) ( not ( = ?auto_121061 ?auto_121062 ) ) ( ON ?auto_121060 ?auto_121061 ) ( ON-TABLE ?auto_121062 ) ( ON ?auto_121059 ?auto_121060 ) ( ON ?auto_121058 ?auto_121059 ) ( CLEAR ?auto_121056 ) ( ON ?auto_121057 ?auto_121058 ) ( CLEAR ?auto_121057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121062 ?auto_121061 ?auto_121060 ?auto_121059 ?auto_121058 )
      ( MAKE-6PILE ?auto_121056 ?auto_121057 ?auto_121058 ?auto_121059 ?auto_121060 ?auto_121061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121063 - BLOCK
      ?auto_121064 - BLOCK
      ?auto_121065 - BLOCK
      ?auto_121066 - BLOCK
      ?auto_121067 - BLOCK
      ?auto_121068 - BLOCK
    )
    :vars
    (
      ?auto_121069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121063 ?auto_121064 ) ) ( not ( = ?auto_121063 ?auto_121065 ) ) ( not ( = ?auto_121063 ?auto_121066 ) ) ( not ( = ?auto_121063 ?auto_121067 ) ) ( not ( = ?auto_121063 ?auto_121068 ) ) ( not ( = ?auto_121064 ?auto_121065 ) ) ( not ( = ?auto_121064 ?auto_121066 ) ) ( not ( = ?auto_121064 ?auto_121067 ) ) ( not ( = ?auto_121064 ?auto_121068 ) ) ( not ( = ?auto_121065 ?auto_121066 ) ) ( not ( = ?auto_121065 ?auto_121067 ) ) ( not ( = ?auto_121065 ?auto_121068 ) ) ( not ( = ?auto_121066 ?auto_121067 ) ) ( not ( = ?auto_121066 ?auto_121068 ) ) ( not ( = ?auto_121067 ?auto_121068 ) ) ( ON ?auto_121068 ?auto_121069 ) ( not ( = ?auto_121063 ?auto_121069 ) ) ( not ( = ?auto_121064 ?auto_121069 ) ) ( not ( = ?auto_121065 ?auto_121069 ) ) ( not ( = ?auto_121066 ?auto_121069 ) ) ( not ( = ?auto_121067 ?auto_121069 ) ) ( not ( = ?auto_121068 ?auto_121069 ) ) ( ON ?auto_121067 ?auto_121068 ) ( ON-TABLE ?auto_121069 ) ( ON ?auto_121066 ?auto_121067 ) ( ON ?auto_121065 ?auto_121066 ) ( ON ?auto_121064 ?auto_121065 ) ( CLEAR ?auto_121064 ) ( HOLDING ?auto_121063 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121063 )
      ( MAKE-6PILE ?auto_121063 ?auto_121064 ?auto_121065 ?auto_121066 ?auto_121067 ?auto_121068 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121070 - BLOCK
      ?auto_121071 - BLOCK
      ?auto_121072 - BLOCK
      ?auto_121073 - BLOCK
      ?auto_121074 - BLOCK
      ?auto_121075 - BLOCK
    )
    :vars
    (
      ?auto_121076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121070 ?auto_121071 ) ) ( not ( = ?auto_121070 ?auto_121072 ) ) ( not ( = ?auto_121070 ?auto_121073 ) ) ( not ( = ?auto_121070 ?auto_121074 ) ) ( not ( = ?auto_121070 ?auto_121075 ) ) ( not ( = ?auto_121071 ?auto_121072 ) ) ( not ( = ?auto_121071 ?auto_121073 ) ) ( not ( = ?auto_121071 ?auto_121074 ) ) ( not ( = ?auto_121071 ?auto_121075 ) ) ( not ( = ?auto_121072 ?auto_121073 ) ) ( not ( = ?auto_121072 ?auto_121074 ) ) ( not ( = ?auto_121072 ?auto_121075 ) ) ( not ( = ?auto_121073 ?auto_121074 ) ) ( not ( = ?auto_121073 ?auto_121075 ) ) ( not ( = ?auto_121074 ?auto_121075 ) ) ( ON ?auto_121075 ?auto_121076 ) ( not ( = ?auto_121070 ?auto_121076 ) ) ( not ( = ?auto_121071 ?auto_121076 ) ) ( not ( = ?auto_121072 ?auto_121076 ) ) ( not ( = ?auto_121073 ?auto_121076 ) ) ( not ( = ?auto_121074 ?auto_121076 ) ) ( not ( = ?auto_121075 ?auto_121076 ) ) ( ON ?auto_121074 ?auto_121075 ) ( ON-TABLE ?auto_121076 ) ( ON ?auto_121073 ?auto_121074 ) ( ON ?auto_121072 ?auto_121073 ) ( ON ?auto_121071 ?auto_121072 ) ( ON ?auto_121070 ?auto_121071 ) ( CLEAR ?auto_121070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121076 ?auto_121075 ?auto_121074 ?auto_121073 ?auto_121072 ?auto_121071 )
      ( MAKE-6PILE ?auto_121070 ?auto_121071 ?auto_121072 ?auto_121073 ?auto_121074 ?auto_121075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121077 - BLOCK
      ?auto_121078 - BLOCK
      ?auto_121079 - BLOCK
      ?auto_121080 - BLOCK
      ?auto_121081 - BLOCK
      ?auto_121082 - BLOCK
    )
    :vars
    (
      ?auto_121083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121077 ?auto_121078 ) ) ( not ( = ?auto_121077 ?auto_121079 ) ) ( not ( = ?auto_121077 ?auto_121080 ) ) ( not ( = ?auto_121077 ?auto_121081 ) ) ( not ( = ?auto_121077 ?auto_121082 ) ) ( not ( = ?auto_121078 ?auto_121079 ) ) ( not ( = ?auto_121078 ?auto_121080 ) ) ( not ( = ?auto_121078 ?auto_121081 ) ) ( not ( = ?auto_121078 ?auto_121082 ) ) ( not ( = ?auto_121079 ?auto_121080 ) ) ( not ( = ?auto_121079 ?auto_121081 ) ) ( not ( = ?auto_121079 ?auto_121082 ) ) ( not ( = ?auto_121080 ?auto_121081 ) ) ( not ( = ?auto_121080 ?auto_121082 ) ) ( not ( = ?auto_121081 ?auto_121082 ) ) ( ON ?auto_121082 ?auto_121083 ) ( not ( = ?auto_121077 ?auto_121083 ) ) ( not ( = ?auto_121078 ?auto_121083 ) ) ( not ( = ?auto_121079 ?auto_121083 ) ) ( not ( = ?auto_121080 ?auto_121083 ) ) ( not ( = ?auto_121081 ?auto_121083 ) ) ( not ( = ?auto_121082 ?auto_121083 ) ) ( ON ?auto_121081 ?auto_121082 ) ( ON-TABLE ?auto_121083 ) ( ON ?auto_121080 ?auto_121081 ) ( ON ?auto_121079 ?auto_121080 ) ( ON ?auto_121078 ?auto_121079 ) ( HOLDING ?auto_121077 ) ( CLEAR ?auto_121078 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121083 ?auto_121082 ?auto_121081 ?auto_121080 ?auto_121079 ?auto_121078 ?auto_121077 )
      ( MAKE-6PILE ?auto_121077 ?auto_121078 ?auto_121079 ?auto_121080 ?auto_121081 ?auto_121082 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121084 - BLOCK
      ?auto_121085 - BLOCK
      ?auto_121086 - BLOCK
      ?auto_121087 - BLOCK
      ?auto_121088 - BLOCK
      ?auto_121089 - BLOCK
    )
    :vars
    (
      ?auto_121090 - BLOCK
      ?auto_121091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121084 ?auto_121085 ) ) ( not ( = ?auto_121084 ?auto_121086 ) ) ( not ( = ?auto_121084 ?auto_121087 ) ) ( not ( = ?auto_121084 ?auto_121088 ) ) ( not ( = ?auto_121084 ?auto_121089 ) ) ( not ( = ?auto_121085 ?auto_121086 ) ) ( not ( = ?auto_121085 ?auto_121087 ) ) ( not ( = ?auto_121085 ?auto_121088 ) ) ( not ( = ?auto_121085 ?auto_121089 ) ) ( not ( = ?auto_121086 ?auto_121087 ) ) ( not ( = ?auto_121086 ?auto_121088 ) ) ( not ( = ?auto_121086 ?auto_121089 ) ) ( not ( = ?auto_121087 ?auto_121088 ) ) ( not ( = ?auto_121087 ?auto_121089 ) ) ( not ( = ?auto_121088 ?auto_121089 ) ) ( ON ?auto_121089 ?auto_121090 ) ( not ( = ?auto_121084 ?auto_121090 ) ) ( not ( = ?auto_121085 ?auto_121090 ) ) ( not ( = ?auto_121086 ?auto_121090 ) ) ( not ( = ?auto_121087 ?auto_121090 ) ) ( not ( = ?auto_121088 ?auto_121090 ) ) ( not ( = ?auto_121089 ?auto_121090 ) ) ( ON ?auto_121088 ?auto_121089 ) ( ON-TABLE ?auto_121090 ) ( ON ?auto_121087 ?auto_121088 ) ( ON ?auto_121086 ?auto_121087 ) ( ON ?auto_121085 ?auto_121086 ) ( CLEAR ?auto_121085 ) ( ON ?auto_121084 ?auto_121091 ) ( CLEAR ?auto_121084 ) ( HAND-EMPTY ) ( not ( = ?auto_121084 ?auto_121091 ) ) ( not ( = ?auto_121085 ?auto_121091 ) ) ( not ( = ?auto_121086 ?auto_121091 ) ) ( not ( = ?auto_121087 ?auto_121091 ) ) ( not ( = ?auto_121088 ?auto_121091 ) ) ( not ( = ?auto_121089 ?auto_121091 ) ) ( not ( = ?auto_121090 ?auto_121091 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121084 ?auto_121091 )
      ( MAKE-6PILE ?auto_121084 ?auto_121085 ?auto_121086 ?auto_121087 ?auto_121088 ?auto_121089 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121092 - BLOCK
      ?auto_121093 - BLOCK
      ?auto_121094 - BLOCK
      ?auto_121095 - BLOCK
      ?auto_121096 - BLOCK
      ?auto_121097 - BLOCK
    )
    :vars
    (
      ?auto_121099 - BLOCK
      ?auto_121098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121092 ?auto_121093 ) ) ( not ( = ?auto_121092 ?auto_121094 ) ) ( not ( = ?auto_121092 ?auto_121095 ) ) ( not ( = ?auto_121092 ?auto_121096 ) ) ( not ( = ?auto_121092 ?auto_121097 ) ) ( not ( = ?auto_121093 ?auto_121094 ) ) ( not ( = ?auto_121093 ?auto_121095 ) ) ( not ( = ?auto_121093 ?auto_121096 ) ) ( not ( = ?auto_121093 ?auto_121097 ) ) ( not ( = ?auto_121094 ?auto_121095 ) ) ( not ( = ?auto_121094 ?auto_121096 ) ) ( not ( = ?auto_121094 ?auto_121097 ) ) ( not ( = ?auto_121095 ?auto_121096 ) ) ( not ( = ?auto_121095 ?auto_121097 ) ) ( not ( = ?auto_121096 ?auto_121097 ) ) ( ON ?auto_121097 ?auto_121099 ) ( not ( = ?auto_121092 ?auto_121099 ) ) ( not ( = ?auto_121093 ?auto_121099 ) ) ( not ( = ?auto_121094 ?auto_121099 ) ) ( not ( = ?auto_121095 ?auto_121099 ) ) ( not ( = ?auto_121096 ?auto_121099 ) ) ( not ( = ?auto_121097 ?auto_121099 ) ) ( ON ?auto_121096 ?auto_121097 ) ( ON-TABLE ?auto_121099 ) ( ON ?auto_121095 ?auto_121096 ) ( ON ?auto_121094 ?auto_121095 ) ( ON ?auto_121092 ?auto_121098 ) ( CLEAR ?auto_121092 ) ( not ( = ?auto_121092 ?auto_121098 ) ) ( not ( = ?auto_121093 ?auto_121098 ) ) ( not ( = ?auto_121094 ?auto_121098 ) ) ( not ( = ?auto_121095 ?auto_121098 ) ) ( not ( = ?auto_121096 ?auto_121098 ) ) ( not ( = ?auto_121097 ?auto_121098 ) ) ( not ( = ?auto_121099 ?auto_121098 ) ) ( HOLDING ?auto_121093 ) ( CLEAR ?auto_121094 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121099 ?auto_121097 ?auto_121096 ?auto_121095 ?auto_121094 ?auto_121093 )
      ( MAKE-6PILE ?auto_121092 ?auto_121093 ?auto_121094 ?auto_121095 ?auto_121096 ?auto_121097 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121100 - BLOCK
      ?auto_121101 - BLOCK
      ?auto_121102 - BLOCK
      ?auto_121103 - BLOCK
      ?auto_121104 - BLOCK
      ?auto_121105 - BLOCK
    )
    :vars
    (
      ?auto_121107 - BLOCK
      ?auto_121106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121100 ?auto_121101 ) ) ( not ( = ?auto_121100 ?auto_121102 ) ) ( not ( = ?auto_121100 ?auto_121103 ) ) ( not ( = ?auto_121100 ?auto_121104 ) ) ( not ( = ?auto_121100 ?auto_121105 ) ) ( not ( = ?auto_121101 ?auto_121102 ) ) ( not ( = ?auto_121101 ?auto_121103 ) ) ( not ( = ?auto_121101 ?auto_121104 ) ) ( not ( = ?auto_121101 ?auto_121105 ) ) ( not ( = ?auto_121102 ?auto_121103 ) ) ( not ( = ?auto_121102 ?auto_121104 ) ) ( not ( = ?auto_121102 ?auto_121105 ) ) ( not ( = ?auto_121103 ?auto_121104 ) ) ( not ( = ?auto_121103 ?auto_121105 ) ) ( not ( = ?auto_121104 ?auto_121105 ) ) ( ON ?auto_121105 ?auto_121107 ) ( not ( = ?auto_121100 ?auto_121107 ) ) ( not ( = ?auto_121101 ?auto_121107 ) ) ( not ( = ?auto_121102 ?auto_121107 ) ) ( not ( = ?auto_121103 ?auto_121107 ) ) ( not ( = ?auto_121104 ?auto_121107 ) ) ( not ( = ?auto_121105 ?auto_121107 ) ) ( ON ?auto_121104 ?auto_121105 ) ( ON-TABLE ?auto_121107 ) ( ON ?auto_121103 ?auto_121104 ) ( ON ?auto_121102 ?auto_121103 ) ( ON ?auto_121100 ?auto_121106 ) ( not ( = ?auto_121100 ?auto_121106 ) ) ( not ( = ?auto_121101 ?auto_121106 ) ) ( not ( = ?auto_121102 ?auto_121106 ) ) ( not ( = ?auto_121103 ?auto_121106 ) ) ( not ( = ?auto_121104 ?auto_121106 ) ) ( not ( = ?auto_121105 ?auto_121106 ) ) ( not ( = ?auto_121107 ?auto_121106 ) ) ( CLEAR ?auto_121102 ) ( ON ?auto_121101 ?auto_121100 ) ( CLEAR ?auto_121101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121106 ?auto_121100 )
      ( MAKE-6PILE ?auto_121100 ?auto_121101 ?auto_121102 ?auto_121103 ?auto_121104 ?auto_121105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121108 - BLOCK
      ?auto_121109 - BLOCK
      ?auto_121110 - BLOCK
      ?auto_121111 - BLOCK
      ?auto_121112 - BLOCK
      ?auto_121113 - BLOCK
    )
    :vars
    (
      ?auto_121115 - BLOCK
      ?auto_121114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121108 ?auto_121109 ) ) ( not ( = ?auto_121108 ?auto_121110 ) ) ( not ( = ?auto_121108 ?auto_121111 ) ) ( not ( = ?auto_121108 ?auto_121112 ) ) ( not ( = ?auto_121108 ?auto_121113 ) ) ( not ( = ?auto_121109 ?auto_121110 ) ) ( not ( = ?auto_121109 ?auto_121111 ) ) ( not ( = ?auto_121109 ?auto_121112 ) ) ( not ( = ?auto_121109 ?auto_121113 ) ) ( not ( = ?auto_121110 ?auto_121111 ) ) ( not ( = ?auto_121110 ?auto_121112 ) ) ( not ( = ?auto_121110 ?auto_121113 ) ) ( not ( = ?auto_121111 ?auto_121112 ) ) ( not ( = ?auto_121111 ?auto_121113 ) ) ( not ( = ?auto_121112 ?auto_121113 ) ) ( ON ?auto_121113 ?auto_121115 ) ( not ( = ?auto_121108 ?auto_121115 ) ) ( not ( = ?auto_121109 ?auto_121115 ) ) ( not ( = ?auto_121110 ?auto_121115 ) ) ( not ( = ?auto_121111 ?auto_121115 ) ) ( not ( = ?auto_121112 ?auto_121115 ) ) ( not ( = ?auto_121113 ?auto_121115 ) ) ( ON ?auto_121112 ?auto_121113 ) ( ON-TABLE ?auto_121115 ) ( ON ?auto_121111 ?auto_121112 ) ( ON ?auto_121108 ?auto_121114 ) ( not ( = ?auto_121108 ?auto_121114 ) ) ( not ( = ?auto_121109 ?auto_121114 ) ) ( not ( = ?auto_121110 ?auto_121114 ) ) ( not ( = ?auto_121111 ?auto_121114 ) ) ( not ( = ?auto_121112 ?auto_121114 ) ) ( not ( = ?auto_121113 ?auto_121114 ) ) ( not ( = ?auto_121115 ?auto_121114 ) ) ( ON ?auto_121109 ?auto_121108 ) ( CLEAR ?auto_121109 ) ( ON-TABLE ?auto_121114 ) ( HOLDING ?auto_121110 ) ( CLEAR ?auto_121111 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121115 ?auto_121113 ?auto_121112 ?auto_121111 ?auto_121110 )
      ( MAKE-6PILE ?auto_121108 ?auto_121109 ?auto_121110 ?auto_121111 ?auto_121112 ?auto_121113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121116 - BLOCK
      ?auto_121117 - BLOCK
      ?auto_121118 - BLOCK
      ?auto_121119 - BLOCK
      ?auto_121120 - BLOCK
      ?auto_121121 - BLOCK
    )
    :vars
    (
      ?auto_121123 - BLOCK
      ?auto_121122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121116 ?auto_121117 ) ) ( not ( = ?auto_121116 ?auto_121118 ) ) ( not ( = ?auto_121116 ?auto_121119 ) ) ( not ( = ?auto_121116 ?auto_121120 ) ) ( not ( = ?auto_121116 ?auto_121121 ) ) ( not ( = ?auto_121117 ?auto_121118 ) ) ( not ( = ?auto_121117 ?auto_121119 ) ) ( not ( = ?auto_121117 ?auto_121120 ) ) ( not ( = ?auto_121117 ?auto_121121 ) ) ( not ( = ?auto_121118 ?auto_121119 ) ) ( not ( = ?auto_121118 ?auto_121120 ) ) ( not ( = ?auto_121118 ?auto_121121 ) ) ( not ( = ?auto_121119 ?auto_121120 ) ) ( not ( = ?auto_121119 ?auto_121121 ) ) ( not ( = ?auto_121120 ?auto_121121 ) ) ( ON ?auto_121121 ?auto_121123 ) ( not ( = ?auto_121116 ?auto_121123 ) ) ( not ( = ?auto_121117 ?auto_121123 ) ) ( not ( = ?auto_121118 ?auto_121123 ) ) ( not ( = ?auto_121119 ?auto_121123 ) ) ( not ( = ?auto_121120 ?auto_121123 ) ) ( not ( = ?auto_121121 ?auto_121123 ) ) ( ON ?auto_121120 ?auto_121121 ) ( ON-TABLE ?auto_121123 ) ( ON ?auto_121119 ?auto_121120 ) ( ON ?auto_121116 ?auto_121122 ) ( not ( = ?auto_121116 ?auto_121122 ) ) ( not ( = ?auto_121117 ?auto_121122 ) ) ( not ( = ?auto_121118 ?auto_121122 ) ) ( not ( = ?auto_121119 ?auto_121122 ) ) ( not ( = ?auto_121120 ?auto_121122 ) ) ( not ( = ?auto_121121 ?auto_121122 ) ) ( not ( = ?auto_121123 ?auto_121122 ) ) ( ON ?auto_121117 ?auto_121116 ) ( ON-TABLE ?auto_121122 ) ( CLEAR ?auto_121119 ) ( ON ?auto_121118 ?auto_121117 ) ( CLEAR ?auto_121118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121122 ?auto_121116 ?auto_121117 )
      ( MAKE-6PILE ?auto_121116 ?auto_121117 ?auto_121118 ?auto_121119 ?auto_121120 ?auto_121121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121124 - BLOCK
      ?auto_121125 - BLOCK
      ?auto_121126 - BLOCK
      ?auto_121127 - BLOCK
      ?auto_121128 - BLOCK
      ?auto_121129 - BLOCK
    )
    :vars
    (
      ?auto_121130 - BLOCK
      ?auto_121131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121124 ?auto_121125 ) ) ( not ( = ?auto_121124 ?auto_121126 ) ) ( not ( = ?auto_121124 ?auto_121127 ) ) ( not ( = ?auto_121124 ?auto_121128 ) ) ( not ( = ?auto_121124 ?auto_121129 ) ) ( not ( = ?auto_121125 ?auto_121126 ) ) ( not ( = ?auto_121125 ?auto_121127 ) ) ( not ( = ?auto_121125 ?auto_121128 ) ) ( not ( = ?auto_121125 ?auto_121129 ) ) ( not ( = ?auto_121126 ?auto_121127 ) ) ( not ( = ?auto_121126 ?auto_121128 ) ) ( not ( = ?auto_121126 ?auto_121129 ) ) ( not ( = ?auto_121127 ?auto_121128 ) ) ( not ( = ?auto_121127 ?auto_121129 ) ) ( not ( = ?auto_121128 ?auto_121129 ) ) ( ON ?auto_121129 ?auto_121130 ) ( not ( = ?auto_121124 ?auto_121130 ) ) ( not ( = ?auto_121125 ?auto_121130 ) ) ( not ( = ?auto_121126 ?auto_121130 ) ) ( not ( = ?auto_121127 ?auto_121130 ) ) ( not ( = ?auto_121128 ?auto_121130 ) ) ( not ( = ?auto_121129 ?auto_121130 ) ) ( ON ?auto_121128 ?auto_121129 ) ( ON-TABLE ?auto_121130 ) ( ON ?auto_121124 ?auto_121131 ) ( not ( = ?auto_121124 ?auto_121131 ) ) ( not ( = ?auto_121125 ?auto_121131 ) ) ( not ( = ?auto_121126 ?auto_121131 ) ) ( not ( = ?auto_121127 ?auto_121131 ) ) ( not ( = ?auto_121128 ?auto_121131 ) ) ( not ( = ?auto_121129 ?auto_121131 ) ) ( not ( = ?auto_121130 ?auto_121131 ) ) ( ON ?auto_121125 ?auto_121124 ) ( ON-TABLE ?auto_121131 ) ( ON ?auto_121126 ?auto_121125 ) ( CLEAR ?auto_121126 ) ( HOLDING ?auto_121127 ) ( CLEAR ?auto_121128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121130 ?auto_121129 ?auto_121128 ?auto_121127 )
      ( MAKE-6PILE ?auto_121124 ?auto_121125 ?auto_121126 ?auto_121127 ?auto_121128 ?auto_121129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121132 - BLOCK
      ?auto_121133 - BLOCK
      ?auto_121134 - BLOCK
      ?auto_121135 - BLOCK
      ?auto_121136 - BLOCK
      ?auto_121137 - BLOCK
    )
    :vars
    (
      ?auto_121139 - BLOCK
      ?auto_121138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121132 ?auto_121133 ) ) ( not ( = ?auto_121132 ?auto_121134 ) ) ( not ( = ?auto_121132 ?auto_121135 ) ) ( not ( = ?auto_121132 ?auto_121136 ) ) ( not ( = ?auto_121132 ?auto_121137 ) ) ( not ( = ?auto_121133 ?auto_121134 ) ) ( not ( = ?auto_121133 ?auto_121135 ) ) ( not ( = ?auto_121133 ?auto_121136 ) ) ( not ( = ?auto_121133 ?auto_121137 ) ) ( not ( = ?auto_121134 ?auto_121135 ) ) ( not ( = ?auto_121134 ?auto_121136 ) ) ( not ( = ?auto_121134 ?auto_121137 ) ) ( not ( = ?auto_121135 ?auto_121136 ) ) ( not ( = ?auto_121135 ?auto_121137 ) ) ( not ( = ?auto_121136 ?auto_121137 ) ) ( ON ?auto_121137 ?auto_121139 ) ( not ( = ?auto_121132 ?auto_121139 ) ) ( not ( = ?auto_121133 ?auto_121139 ) ) ( not ( = ?auto_121134 ?auto_121139 ) ) ( not ( = ?auto_121135 ?auto_121139 ) ) ( not ( = ?auto_121136 ?auto_121139 ) ) ( not ( = ?auto_121137 ?auto_121139 ) ) ( ON ?auto_121136 ?auto_121137 ) ( ON-TABLE ?auto_121139 ) ( ON ?auto_121132 ?auto_121138 ) ( not ( = ?auto_121132 ?auto_121138 ) ) ( not ( = ?auto_121133 ?auto_121138 ) ) ( not ( = ?auto_121134 ?auto_121138 ) ) ( not ( = ?auto_121135 ?auto_121138 ) ) ( not ( = ?auto_121136 ?auto_121138 ) ) ( not ( = ?auto_121137 ?auto_121138 ) ) ( not ( = ?auto_121139 ?auto_121138 ) ) ( ON ?auto_121133 ?auto_121132 ) ( ON-TABLE ?auto_121138 ) ( ON ?auto_121134 ?auto_121133 ) ( CLEAR ?auto_121136 ) ( ON ?auto_121135 ?auto_121134 ) ( CLEAR ?auto_121135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121138 ?auto_121132 ?auto_121133 ?auto_121134 )
      ( MAKE-6PILE ?auto_121132 ?auto_121133 ?auto_121134 ?auto_121135 ?auto_121136 ?auto_121137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121140 - BLOCK
      ?auto_121141 - BLOCK
      ?auto_121142 - BLOCK
      ?auto_121143 - BLOCK
      ?auto_121144 - BLOCK
      ?auto_121145 - BLOCK
    )
    :vars
    (
      ?auto_121147 - BLOCK
      ?auto_121146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121140 ?auto_121141 ) ) ( not ( = ?auto_121140 ?auto_121142 ) ) ( not ( = ?auto_121140 ?auto_121143 ) ) ( not ( = ?auto_121140 ?auto_121144 ) ) ( not ( = ?auto_121140 ?auto_121145 ) ) ( not ( = ?auto_121141 ?auto_121142 ) ) ( not ( = ?auto_121141 ?auto_121143 ) ) ( not ( = ?auto_121141 ?auto_121144 ) ) ( not ( = ?auto_121141 ?auto_121145 ) ) ( not ( = ?auto_121142 ?auto_121143 ) ) ( not ( = ?auto_121142 ?auto_121144 ) ) ( not ( = ?auto_121142 ?auto_121145 ) ) ( not ( = ?auto_121143 ?auto_121144 ) ) ( not ( = ?auto_121143 ?auto_121145 ) ) ( not ( = ?auto_121144 ?auto_121145 ) ) ( ON ?auto_121145 ?auto_121147 ) ( not ( = ?auto_121140 ?auto_121147 ) ) ( not ( = ?auto_121141 ?auto_121147 ) ) ( not ( = ?auto_121142 ?auto_121147 ) ) ( not ( = ?auto_121143 ?auto_121147 ) ) ( not ( = ?auto_121144 ?auto_121147 ) ) ( not ( = ?auto_121145 ?auto_121147 ) ) ( ON-TABLE ?auto_121147 ) ( ON ?auto_121140 ?auto_121146 ) ( not ( = ?auto_121140 ?auto_121146 ) ) ( not ( = ?auto_121141 ?auto_121146 ) ) ( not ( = ?auto_121142 ?auto_121146 ) ) ( not ( = ?auto_121143 ?auto_121146 ) ) ( not ( = ?auto_121144 ?auto_121146 ) ) ( not ( = ?auto_121145 ?auto_121146 ) ) ( not ( = ?auto_121147 ?auto_121146 ) ) ( ON ?auto_121141 ?auto_121140 ) ( ON-TABLE ?auto_121146 ) ( ON ?auto_121142 ?auto_121141 ) ( ON ?auto_121143 ?auto_121142 ) ( CLEAR ?auto_121143 ) ( HOLDING ?auto_121144 ) ( CLEAR ?auto_121145 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121147 ?auto_121145 ?auto_121144 )
      ( MAKE-6PILE ?auto_121140 ?auto_121141 ?auto_121142 ?auto_121143 ?auto_121144 ?auto_121145 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121148 - BLOCK
      ?auto_121149 - BLOCK
      ?auto_121150 - BLOCK
      ?auto_121151 - BLOCK
      ?auto_121152 - BLOCK
      ?auto_121153 - BLOCK
    )
    :vars
    (
      ?auto_121154 - BLOCK
      ?auto_121155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121148 ?auto_121149 ) ) ( not ( = ?auto_121148 ?auto_121150 ) ) ( not ( = ?auto_121148 ?auto_121151 ) ) ( not ( = ?auto_121148 ?auto_121152 ) ) ( not ( = ?auto_121148 ?auto_121153 ) ) ( not ( = ?auto_121149 ?auto_121150 ) ) ( not ( = ?auto_121149 ?auto_121151 ) ) ( not ( = ?auto_121149 ?auto_121152 ) ) ( not ( = ?auto_121149 ?auto_121153 ) ) ( not ( = ?auto_121150 ?auto_121151 ) ) ( not ( = ?auto_121150 ?auto_121152 ) ) ( not ( = ?auto_121150 ?auto_121153 ) ) ( not ( = ?auto_121151 ?auto_121152 ) ) ( not ( = ?auto_121151 ?auto_121153 ) ) ( not ( = ?auto_121152 ?auto_121153 ) ) ( ON ?auto_121153 ?auto_121154 ) ( not ( = ?auto_121148 ?auto_121154 ) ) ( not ( = ?auto_121149 ?auto_121154 ) ) ( not ( = ?auto_121150 ?auto_121154 ) ) ( not ( = ?auto_121151 ?auto_121154 ) ) ( not ( = ?auto_121152 ?auto_121154 ) ) ( not ( = ?auto_121153 ?auto_121154 ) ) ( ON-TABLE ?auto_121154 ) ( ON ?auto_121148 ?auto_121155 ) ( not ( = ?auto_121148 ?auto_121155 ) ) ( not ( = ?auto_121149 ?auto_121155 ) ) ( not ( = ?auto_121150 ?auto_121155 ) ) ( not ( = ?auto_121151 ?auto_121155 ) ) ( not ( = ?auto_121152 ?auto_121155 ) ) ( not ( = ?auto_121153 ?auto_121155 ) ) ( not ( = ?auto_121154 ?auto_121155 ) ) ( ON ?auto_121149 ?auto_121148 ) ( ON-TABLE ?auto_121155 ) ( ON ?auto_121150 ?auto_121149 ) ( ON ?auto_121151 ?auto_121150 ) ( CLEAR ?auto_121153 ) ( ON ?auto_121152 ?auto_121151 ) ( CLEAR ?auto_121152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121155 ?auto_121148 ?auto_121149 ?auto_121150 ?auto_121151 )
      ( MAKE-6PILE ?auto_121148 ?auto_121149 ?auto_121150 ?auto_121151 ?auto_121152 ?auto_121153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121156 - BLOCK
      ?auto_121157 - BLOCK
      ?auto_121158 - BLOCK
      ?auto_121159 - BLOCK
      ?auto_121160 - BLOCK
      ?auto_121161 - BLOCK
    )
    :vars
    (
      ?auto_121162 - BLOCK
      ?auto_121163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121156 ?auto_121157 ) ) ( not ( = ?auto_121156 ?auto_121158 ) ) ( not ( = ?auto_121156 ?auto_121159 ) ) ( not ( = ?auto_121156 ?auto_121160 ) ) ( not ( = ?auto_121156 ?auto_121161 ) ) ( not ( = ?auto_121157 ?auto_121158 ) ) ( not ( = ?auto_121157 ?auto_121159 ) ) ( not ( = ?auto_121157 ?auto_121160 ) ) ( not ( = ?auto_121157 ?auto_121161 ) ) ( not ( = ?auto_121158 ?auto_121159 ) ) ( not ( = ?auto_121158 ?auto_121160 ) ) ( not ( = ?auto_121158 ?auto_121161 ) ) ( not ( = ?auto_121159 ?auto_121160 ) ) ( not ( = ?auto_121159 ?auto_121161 ) ) ( not ( = ?auto_121160 ?auto_121161 ) ) ( not ( = ?auto_121156 ?auto_121162 ) ) ( not ( = ?auto_121157 ?auto_121162 ) ) ( not ( = ?auto_121158 ?auto_121162 ) ) ( not ( = ?auto_121159 ?auto_121162 ) ) ( not ( = ?auto_121160 ?auto_121162 ) ) ( not ( = ?auto_121161 ?auto_121162 ) ) ( ON-TABLE ?auto_121162 ) ( ON ?auto_121156 ?auto_121163 ) ( not ( = ?auto_121156 ?auto_121163 ) ) ( not ( = ?auto_121157 ?auto_121163 ) ) ( not ( = ?auto_121158 ?auto_121163 ) ) ( not ( = ?auto_121159 ?auto_121163 ) ) ( not ( = ?auto_121160 ?auto_121163 ) ) ( not ( = ?auto_121161 ?auto_121163 ) ) ( not ( = ?auto_121162 ?auto_121163 ) ) ( ON ?auto_121157 ?auto_121156 ) ( ON-TABLE ?auto_121163 ) ( ON ?auto_121158 ?auto_121157 ) ( ON ?auto_121159 ?auto_121158 ) ( ON ?auto_121160 ?auto_121159 ) ( CLEAR ?auto_121160 ) ( HOLDING ?auto_121161 ) ( CLEAR ?auto_121162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121162 ?auto_121161 )
      ( MAKE-6PILE ?auto_121156 ?auto_121157 ?auto_121158 ?auto_121159 ?auto_121160 ?auto_121161 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121164 - BLOCK
      ?auto_121165 - BLOCK
      ?auto_121166 - BLOCK
      ?auto_121167 - BLOCK
      ?auto_121168 - BLOCK
      ?auto_121169 - BLOCK
    )
    :vars
    (
      ?auto_121170 - BLOCK
      ?auto_121171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121164 ?auto_121165 ) ) ( not ( = ?auto_121164 ?auto_121166 ) ) ( not ( = ?auto_121164 ?auto_121167 ) ) ( not ( = ?auto_121164 ?auto_121168 ) ) ( not ( = ?auto_121164 ?auto_121169 ) ) ( not ( = ?auto_121165 ?auto_121166 ) ) ( not ( = ?auto_121165 ?auto_121167 ) ) ( not ( = ?auto_121165 ?auto_121168 ) ) ( not ( = ?auto_121165 ?auto_121169 ) ) ( not ( = ?auto_121166 ?auto_121167 ) ) ( not ( = ?auto_121166 ?auto_121168 ) ) ( not ( = ?auto_121166 ?auto_121169 ) ) ( not ( = ?auto_121167 ?auto_121168 ) ) ( not ( = ?auto_121167 ?auto_121169 ) ) ( not ( = ?auto_121168 ?auto_121169 ) ) ( not ( = ?auto_121164 ?auto_121170 ) ) ( not ( = ?auto_121165 ?auto_121170 ) ) ( not ( = ?auto_121166 ?auto_121170 ) ) ( not ( = ?auto_121167 ?auto_121170 ) ) ( not ( = ?auto_121168 ?auto_121170 ) ) ( not ( = ?auto_121169 ?auto_121170 ) ) ( ON-TABLE ?auto_121170 ) ( ON ?auto_121164 ?auto_121171 ) ( not ( = ?auto_121164 ?auto_121171 ) ) ( not ( = ?auto_121165 ?auto_121171 ) ) ( not ( = ?auto_121166 ?auto_121171 ) ) ( not ( = ?auto_121167 ?auto_121171 ) ) ( not ( = ?auto_121168 ?auto_121171 ) ) ( not ( = ?auto_121169 ?auto_121171 ) ) ( not ( = ?auto_121170 ?auto_121171 ) ) ( ON ?auto_121165 ?auto_121164 ) ( ON-TABLE ?auto_121171 ) ( ON ?auto_121166 ?auto_121165 ) ( ON ?auto_121167 ?auto_121166 ) ( ON ?auto_121168 ?auto_121167 ) ( CLEAR ?auto_121170 ) ( ON ?auto_121169 ?auto_121168 ) ( CLEAR ?auto_121169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121171 ?auto_121164 ?auto_121165 ?auto_121166 ?auto_121167 ?auto_121168 )
      ( MAKE-6PILE ?auto_121164 ?auto_121165 ?auto_121166 ?auto_121167 ?auto_121168 ?auto_121169 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121172 - BLOCK
      ?auto_121173 - BLOCK
      ?auto_121174 - BLOCK
      ?auto_121175 - BLOCK
      ?auto_121176 - BLOCK
      ?auto_121177 - BLOCK
    )
    :vars
    (
      ?auto_121178 - BLOCK
      ?auto_121179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121172 ?auto_121173 ) ) ( not ( = ?auto_121172 ?auto_121174 ) ) ( not ( = ?auto_121172 ?auto_121175 ) ) ( not ( = ?auto_121172 ?auto_121176 ) ) ( not ( = ?auto_121172 ?auto_121177 ) ) ( not ( = ?auto_121173 ?auto_121174 ) ) ( not ( = ?auto_121173 ?auto_121175 ) ) ( not ( = ?auto_121173 ?auto_121176 ) ) ( not ( = ?auto_121173 ?auto_121177 ) ) ( not ( = ?auto_121174 ?auto_121175 ) ) ( not ( = ?auto_121174 ?auto_121176 ) ) ( not ( = ?auto_121174 ?auto_121177 ) ) ( not ( = ?auto_121175 ?auto_121176 ) ) ( not ( = ?auto_121175 ?auto_121177 ) ) ( not ( = ?auto_121176 ?auto_121177 ) ) ( not ( = ?auto_121172 ?auto_121178 ) ) ( not ( = ?auto_121173 ?auto_121178 ) ) ( not ( = ?auto_121174 ?auto_121178 ) ) ( not ( = ?auto_121175 ?auto_121178 ) ) ( not ( = ?auto_121176 ?auto_121178 ) ) ( not ( = ?auto_121177 ?auto_121178 ) ) ( ON ?auto_121172 ?auto_121179 ) ( not ( = ?auto_121172 ?auto_121179 ) ) ( not ( = ?auto_121173 ?auto_121179 ) ) ( not ( = ?auto_121174 ?auto_121179 ) ) ( not ( = ?auto_121175 ?auto_121179 ) ) ( not ( = ?auto_121176 ?auto_121179 ) ) ( not ( = ?auto_121177 ?auto_121179 ) ) ( not ( = ?auto_121178 ?auto_121179 ) ) ( ON ?auto_121173 ?auto_121172 ) ( ON-TABLE ?auto_121179 ) ( ON ?auto_121174 ?auto_121173 ) ( ON ?auto_121175 ?auto_121174 ) ( ON ?auto_121176 ?auto_121175 ) ( ON ?auto_121177 ?auto_121176 ) ( CLEAR ?auto_121177 ) ( HOLDING ?auto_121178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121178 )
      ( MAKE-6PILE ?auto_121172 ?auto_121173 ?auto_121174 ?auto_121175 ?auto_121176 ?auto_121177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121180 - BLOCK
      ?auto_121181 - BLOCK
      ?auto_121182 - BLOCK
      ?auto_121183 - BLOCK
      ?auto_121184 - BLOCK
      ?auto_121185 - BLOCK
    )
    :vars
    (
      ?auto_121186 - BLOCK
      ?auto_121187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121180 ?auto_121181 ) ) ( not ( = ?auto_121180 ?auto_121182 ) ) ( not ( = ?auto_121180 ?auto_121183 ) ) ( not ( = ?auto_121180 ?auto_121184 ) ) ( not ( = ?auto_121180 ?auto_121185 ) ) ( not ( = ?auto_121181 ?auto_121182 ) ) ( not ( = ?auto_121181 ?auto_121183 ) ) ( not ( = ?auto_121181 ?auto_121184 ) ) ( not ( = ?auto_121181 ?auto_121185 ) ) ( not ( = ?auto_121182 ?auto_121183 ) ) ( not ( = ?auto_121182 ?auto_121184 ) ) ( not ( = ?auto_121182 ?auto_121185 ) ) ( not ( = ?auto_121183 ?auto_121184 ) ) ( not ( = ?auto_121183 ?auto_121185 ) ) ( not ( = ?auto_121184 ?auto_121185 ) ) ( not ( = ?auto_121180 ?auto_121186 ) ) ( not ( = ?auto_121181 ?auto_121186 ) ) ( not ( = ?auto_121182 ?auto_121186 ) ) ( not ( = ?auto_121183 ?auto_121186 ) ) ( not ( = ?auto_121184 ?auto_121186 ) ) ( not ( = ?auto_121185 ?auto_121186 ) ) ( ON ?auto_121180 ?auto_121187 ) ( not ( = ?auto_121180 ?auto_121187 ) ) ( not ( = ?auto_121181 ?auto_121187 ) ) ( not ( = ?auto_121182 ?auto_121187 ) ) ( not ( = ?auto_121183 ?auto_121187 ) ) ( not ( = ?auto_121184 ?auto_121187 ) ) ( not ( = ?auto_121185 ?auto_121187 ) ) ( not ( = ?auto_121186 ?auto_121187 ) ) ( ON ?auto_121181 ?auto_121180 ) ( ON-TABLE ?auto_121187 ) ( ON ?auto_121182 ?auto_121181 ) ( ON ?auto_121183 ?auto_121182 ) ( ON ?auto_121184 ?auto_121183 ) ( ON ?auto_121185 ?auto_121184 ) ( ON ?auto_121186 ?auto_121185 ) ( CLEAR ?auto_121186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121187 ?auto_121180 ?auto_121181 ?auto_121182 ?auto_121183 ?auto_121184 ?auto_121185 )
      ( MAKE-6PILE ?auto_121180 ?auto_121181 ?auto_121182 ?auto_121183 ?auto_121184 ?auto_121185 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121195 - BLOCK
      ?auto_121196 - BLOCK
      ?auto_121197 - BLOCK
      ?auto_121198 - BLOCK
      ?auto_121199 - BLOCK
      ?auto_121200 - BLOCK
      ?auto_121201 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121201 ) ( CLEAR ?auto_121200 ) ( ON-TABLE ?auto_121195 ) ( ON ?auto_121196 ?auto_121195 ) ( ON ?auto_121197 ?auto_121196 ) ( ON ?auto_121198 ?auto_121197 ) ( ON ?auto_121199 ?auto_121198 ) ( ON ?auto_121200 ?auto_121199 ) ( not ( = ?auto_121195 ?auto_121196 ) ) ( not ( = ?auto_121195 ?auto_121197 ) ) ( not ( = ?auto_121195 ?auto_121198 ) ) ( not ( = ?auto_121195 ?auto_121199 ) ) ( not ( = ?auto_121195 ?auto_121200 ) ) ( not ( = ?auto_121195 ?auto_121201 ) ) ( not ( = ?auto_121196 ?auto_121197 ) ) ( not ( = ?auto_121196 ?auto_121198 ) ) ( not ( = ?auto_121196 ?auto_121199 ) ) ( not ( = ?auto_121196 ?auto_121200 ) ) ( not ( = ?auto_121196 ?auto_121201 ) ) ( not ( = ?auto_121197 ?auto_121198 ) ) ( not ( = ?auto_121197 ?auto_121199 ) ) ( not ( = ?auto_121197 ?auto_121200 ) ) ( not ( = ?auto_121197 ?auto_121201 ) ) ( not ( = ?auto_121198 ?auto_121199 ) ) ( not ( = ?auto_121198 ?auto_121200 ) ) ( not ( = ?auto_121198 ?auto_121201 ) ) ( not ( = ?auto_121199 ?auto_121200 ) ) ( not ( = ?auto_121199 ?auto_121201 ) ) ( not ( = ?auto_121200 ?auto_121201 ) ) )
    :subtasks
    ( ( !STACK ?auto_121201 ?auto_121200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121202 - BLOCK
      ?auto_121203 - BLOCK
      ?auto_121204 - BLOCK
      ?auto_121205 - BLOCK
      ?auto_121206 - BLOCK
      ?auto_121207 - BLOCK
      ?auto_121208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121207 ) ( ON-TABLE ?auto_121202 ) ( ON ?auto_121203 ?auto_121202 ) ( ON ?auto_121204 ?auto_121203 ) ( ON ?auto_121205 ?auto_121204 ) ( ON ?auto_121206 ?auto_121205 ) ( ON ?auto_121207 ?auto_121206 ) ( not ( = ?auto_121202 ?auto_121203 ) ) ( not ( = ?auto_121202 ?auto_121204 ) ) ( not ( = ?auto_121202 ?auto_121205 ) ) ( not ( = ?auto_121202 ?auto_121206 ) ) ( not ( = ?auto_121202 ?auto_121207 ) ) ( not ( = ?auto_121202 ?auto_121208 ) ) ( not ( = ?auto_121203 ?auto_121204 ) ) ( not ( = ?auto_121203 ?auto_121205 ) ) ( not ( = ?auto_121203 ?auto_121206 ) ) ( not ( = ?auto_121203 ?auto_121207 ) ) ( not ( = ?auto_121203 ?auto_121208 ) ) ( not ( = ?auto_121204 ?auto_121205 ) ) ( not ( = ?auto_121204 ?auto_121206 ) ) ( not ( = ?auto_121204 ?auto_121207 ) ) ( not ( = ?auto_121204 ?auto_121208 ) ) ( not ( = ?auto_121205 ?auto_121206 ) ) ( not ( = ?auto_121205 ?auto_121207 ) ) ( not ( = ?auto_121205 ?auto_121208 ) ) ( not ( = ?auto_121206 ?auto_121207 ) ) ( not ( = ?auto_121206 ?auto_121208 ) ) ( not ( = ?auto_121207 ?auto_121208 ) ) ( ON-TABLE ?auto_121208 ) ( CLEAR ?auto_121208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_121208 )
      ( MAKE-7PILE ?auto_121202 ?auto_121203 ?auto_121204 ?auto_121205 ?auto_121206 ?auto_121207 ?auto_121208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121209 - BLOCK
      ?auto_121210 - BLOCK
      ?auto_121211 - BLOCK
      ?auto_121212 - BLOCK
      ?auto_121213 - BLOCK
      ?auto_121214 - BLOCK
      ?auto_121215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121209 ) ( ON ?auto_121210 ?auto_121209 ) ( ON ?auto_121211 ?auto_121210 ) ( ON ?auto_121212 ?auto_121211 ) ( ON ?auto_121213 ?auto_121212 ) ( not ( = ?auto_121209 ?auto_121210 ) ) ( not ( = ?auto_121209 ?auto_121211 ) ) ( not ( = ?auto_121209 ?auto_121212 ) ) ( not ( = ?auto_121209 ?auto_121213 ) ) ( not ( = ?auto_121209 ?auto_121214 ) ) ( not ( = ?auto_121209 ?auto_121215 ) ) ( not ( = ?auto_121210 ?auto_121211 ) ) ( not ( = ?auto_121210 ?auto_121212 ) ) ( not ( = ?auto_121210 ?auto_121213 ) ) ( not ( = ?auto_121210 ?auto_121214 ) ) ( not ( = ?auto_121210 ?auto_121215 ) ) ( not ( = ?auto_121211 ?auto_121212 ) ) ( not ( = ?auto_121211 ?auto_121213 ) ) ( not ( = ?auto_121211 ?auto_121214 ) ) ( not ( = ?auto_121211 ?auto_121215 ) ) ( not ( = ?auto_121212 ?auto_121213 ) ) ( not ( = ?auto_121212 ?auto_121214 ) ) ( not ( = ?auto_121212 ?auto_121215 ) ) ( not ( = ?auto_121213 ?auto_121214 ) ) ( not ( = ?auto_121213 ?auto_121215 ) ) ( not ( = ?auto_121214 ?auto_121215 ) ) ( ON-TABLE ?auto_121215 ) ( CLEAR ?auto_121215 ) ( HOLDING ?auto_121214 ) ( CLEAR ?auto_121213 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121209 ?auto_121210 ?auto_121211 ?auto_121212 ?auto_121213 ?auto_121214 )
      ( MAKE-7PILE ?auto_121209 ?auto_121210 ?auto_121211 ?auto_121212 ?auto_121213 ?auto_121214 ?auto_121215 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121216 - BLOCK
      ?auto_121217 - BLOCK
      ?auto_121218 - BLOCK
      ?auto_121219 - BLOCK
      ?auto_121220 - BLOCK
      ?auto_121221 - BLOCK
      ?auto_121222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121216 ) ( ON ?auto_121217 ?auto_121216 ) ( ON ?auto_121218 ?auto_121217 ) ( ON ?auto_121219 ?auto_121218 ) ( ON ?auto_121220 ?auto_121219 ) ( not ( = ?auto_121216 ?auto_121217 ) ) ( not ( = ?auto_121216 ?auto_121218 ) ) ( not ( = ?auto_121216 ?auto_121219 ) ) ( not ( = ?auto_121216 ?auto_121220 ) ) ( not ( = ?auto_121216 ?auto_121221 ) ) ( not ( = ?auto_121216 ?auto_121222 ) ) ( not ( = ?auto_121217 ?auto_121218 ) ) ( not ( = ?auto_121217 ?auto_121219 ) ) ( not ( = ?auto_121217 ?auto_121220 ) ) ( not ( = ?auto_121217 ?auto_121221 ) ) ( not ( = ?auto_121217 ?auto_121222 ) ) ( not ( = ?auto_121218 ?auto_121219 ) ) ( not ( = ?auto_121218 ?auto_121220 ) ) ( not ( = ?auto_121218 ?auto_121221 ) ) ( not ( = ?auto_121218 ?auto_121222 ) ) ( not ( = ?auto_121219 ?auto_121220 ) ) ( not ( = ?auto_121219 ?auto_121221 ) ) ( not ( = ?auto_121219 ?auto_121222 ) ) ( not ( = ?auto_121220 ?auto_121221 ) ) ( not ( = ?auto_121220 ?auto_121222 ) ) ( not ( = ?auto_121221 ?auto_121222 ) ) ( ON-TABLE ?auto_121222 ) ( CLEAR ?auto_121220 ) ( ON ?auto_121221 ?auto_121222 ) ( CLEAR ?auto_121221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121222 )
      ( MAKE-7PILE ?auto_121216 ?auto_121217 ?auto_121218 ?auto_121219 ?auto_121220 ?auto_121221 ?auto_121222 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121223 - BLOCK
      ?auto_121224 - BLOCK
      ?auto_121225 - BLOCK
      ?auto_121226 - BLOCK
      ?auto_121227 - BLOCK
      ?auto_121228 - BLOCK
      ?auto_121229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121223 ) ( ON ?auto_121224 ?auto_121223 ) ( ON ?auto_121225 ?auto_121224 ) ( ON ?auto_121226 ?auto_121225 ) ( not ( = ?auto_121223 ?auto_121224 ) ) ( not ( = ?auto_121223 ?auto_121225 ) ) ( not ( = ?auto_121223 ?auto_121226 ) ) ( not ( = ?auto_121223 ?auto_121227 ) ) ( not ( = ?auto_121223 ?auto_121228 ) ) ( not ( = ?auto_121223 ?auto_121229 ) ) ( not ( = ?auto_121224 ?auto_121225 ) ) ( not ( = ?auto_121224 ?auto_121226 ) ) ( not ( = ?auto_121224 ?auto_121227 ) ) ( not ( = ?auto_121224 ?auto_121228 ) ) ( not ( = ?auto_121224 ?auto_121229 ) ) ( not ( = ?auto_121225 ?auto_121226 ) ) ( not ( = ?auto_121225 ?auto_121227 ) ) ( not ( = ?auto_121225 ?auto_121228 ) ) ( not ( = ?auto_121225 ?auto_121229 ) ) ( not ( = ?auto_121226 ?auto_121227 ) ) ( not ( = ?auto_121226 ?auto_121228 ) ) ( not ( = ?auto_121226 ?auto_121229 ) ) ( not ( = ?auto_121227 ?auto_121228 ) ) ( not ( = ?auto_121227 ?auto_121229 ) ) ( not ( = ?auto_121228 ?auto_121229 ) ) ( ON-TABLE ?auto_121229 ) ( ON ?auto_121228 ?auto_121229 ) ( CLEAR ?auto_121228 ) ( HOLDING ?auto_121227 ) ( CLEAR ?auto_121226 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121223 ?auto_121224 ?auto_121225 ?auto_121226 ?auto_121227 )
      ( MAKE-7PILE ?auto_121223 ?auto_121224 ?auto_121225 ?auto_121226 ?auto_121227 ?auto_121228 ?auto_121229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121230 - BLOCK
      ?auto_121231 - BLOCK
      ?auto_121232 - BLOCK
      ?auto_121233 - BLOCK
      ?auto_121234 - BLOCK
      ?auto_121235 - BLOCK
      ?auto_121236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121230 ) ( ON ?auto_121231 ?auto_121230 ) ( ON ?auto_121232 ?auto_121231 ) ( ON ?auto_121233 ?auto_121232 ) ( not ( = ?auto_121230 ?auto_121231 ) ) ( not ( = ?auto_121230 ?auto_121232 ) ) ( not ( = ?auto_121230 ?auto_121233 ) ) ( not ( = ?auto_121230 ?auto_121234 ) ) ( not ( = ?auto_121230 ?auto_121235 ) ) ( not ( = ?auto_121230 ?auto_121236 ) ) ( not ( = ?auto_121231 ?auto_121232 ) ) ( not ( = ?auto_121231 ?auto_121233 ) ) ( not ( = ?auto_121231 ?auto_121234 ) ) ( not ( = ?auto_121231 ?auto_121235 ) ) ( not ( = ?auto_121231 ?auto_121236 ) ) ( not ( = ?auto_121232 ?auto_121233 ) ) ( not ( = ?auto_121232 ?auto_121234 ) ) ( not ( = ?auto_121232 ?auto_121235 ) ) ( not ( = ?auto_121232 ?auto_121236 ) ) ( not ( = ?auto_121233 ?auto_121234 ) ) ( not ( = ?auto_121233 ?auto_121235 ) ) ( not ( = ?auto_121233 ?auto_121236 ) ) ( not ( = ?auto_121234 ?auto_121235 ) ) ( not ( = ?auto_121234 ?auto_121236 ) ) ( not ( = ?auto_121235 ?auto_121236 ) ) ( ON-TABLE ?auto_121236 ) ( ON ?auto_121235 ?auto_121236 ) ( CLEAR ?auto_121233 ) ( ON ?auto_121234 ?auto_121235 ) ( CLEAR ?auto_121234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121236 ?auto_121235 )
      ( MAKE-7PILE ?auto_121230 ?auto_121231 ?auto_121232 ?auto_121233 ?auto_121234 ?auto_121235 ?auto_121236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121237 - BLOCK
      ?auto_121238 - BLOCK
      ?auto_121239 - BLOCK
      ?auto_121240 - BLOCK
      ?auto_121241 - BLOCK
      ?auto_121242 - BLOCK
      ?auto_121243 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121237 ) ( ON ?auto_121238 ?auto_121237 ) ( ON ?auto_121239 ?auto_121238 ) ( not ( = ?auto_121237 ?auto_121238 ) ) ( not ( = ?auto_121237 ?auto_121239 ) ) ( not ( = ?auto_121237 ?auto_121240 ) ) ( not ( = ?auto_121237 ?auto_121241 ) ) ( not ( = ?auto_121237 ?auto_121242 ) ) ( not ( = ?auto_121237 ?auto_121243 ) ) ( not ( = ?auto_121238 ?auto_121239 ) ) ( not ( = ?auto_121238 ?auto_121240 ) ) ( not ( = ?auto_121238 ?auto_121241 ) ) ( not ( = ?auto_121238 ?auto_121242 ) ) ( not ( = ?auto_121238 ?auto_121243 ) ) ( not ( = ?auto_121239 ?auto_121240 ) ) ( not ( = ?auto_121239 ?auto_121241 ) ) ( not ( = ?auto_121239 ?auto_121242 ) ) ( not ( = ?auto_121239 ?auto_121243 ) ) ( not ( = ?auto_121240 ?auto_121241 ) ) ( not ( = ?auto_121240 ?auto_121242 ) ) ( not ( = ?auto_121240 ?auto_121243 ) ) ( not ( = ?auto_121241 ?auto_121242 ) ) ( not ( = ?auto_121241 ?auto_121243 ) ) ( not ( = ?auto_121242 ?auto_121243 ) ) ( ON-TABLE ?auto_121243 ) ( ON ?auto_121242 ?auto_121243 ) ( ON ?auto_121241 ?auto_121242 ) ( CLEAR ?auto_121241 ) ( HOLDING ?auto_121240 ) ( CLEAR ?auto_121239 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121237 ?auto_121238 ?auto_121239 ?auto_121240 )
      ( MAKE-7PILE ?auto_121237 ?auto_121238 ?auto_121239 ?auto_121240 ?auto_121241 ?auto_121242 ?auto_121243 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121244 - BLOCK
      ?auto_121245 - BLOCK
      ?auto_121246 - BLOCK
      ?auto_121247 - BLOCK
      ?auto_121248 - BLOCK
      ?auto_121249 - BLOCK
      ?auto_121250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121244 ) ( ON ?auto_121245 ?auto_121244 ) ( ON ?auto_121246 ?auto_121245 ) ( not ( = ?auto_121244 ?auto_121245 ) ) ( not ( = ?auto_121244 ?auto_121246 ) ) ( not ( = ?auto_121244 ?auto_121247 ) ) ( not ( = ?auto_121244 ?auto_121248 ) ) ( not ( = ?auto_121244 ?auto_121249 ) ) ( not ( = ?auto_121244 ?auto_121250 ) ) ( not ( = ?auto_121245 ?auto_121246 ) ) ( not ( = ?auto_121245 ?auto_121247 ) ) ( not ( = ?auto_121245 ?auto_121248 ) ) ( not ( = ?auto_121245 ?auto_121249 ) ) ( not ( = ?auto_121245 ?auto_121250 ) ) ( not ( = ?auto_121246 ?auto_121247 ) ) ( not ( = ?auto_121246 ?auto_121248 ) ) ( not ( = ?auto_121246 ?auto_121249 ) ) ( not ( = ?auto_121246 ?auto_121250 ) ) ( not ( = ?auto_121247 ?auto_121248 ) ) ( not ( = ?auto_121247 ?auto_121249 ) ) ( not ( = ?auto_121247 ?auto_121250 ) ) ( not ( = ?auto_121248 ?auto_121249 ) ) ( not ( = ?auto_121248 ?auto_121250 ) ) ( not ( = ?auto_121249 ?auto_121250 ) ) ( ON-TABLE ?auto_121250 ) ( ON ?auto_121249 ?auto_121250 ) ( ON ?auto_121248 ?auto_121249 ) ( CLEAR ?auto_121246 ) ( ON ?auto_121247 ?auto_121248 ) ( CLEAR ?auto_121247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121250 ?auto_121249 ?auto_121248 )
      ( MAKE-7PILE ?auto_121244 ?auto_121245 ?auto_121246 ?auto_121247 ?auto_121248 ?auto_121249 ?auto_121250 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121251 - BLOCK
      ?auto_121252 - BLOCK
      ?auto_121253 - BLOCK
      ?auto_121254 - BLOCK
      ?auto_121255 - BLOCK
      ?auto_121256 - BLOCK
      ?auto_121257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121251 ) ( ON ?auto_121252 ?auto_121251 ) ( not ( = ?auto_121251 ?auto_121252 ) ) ( not ( = ?auto_121251 ?auto_121253 ) ) ( not ( = ?auto_121251 ?auto_121254 ) ) ( not ( = ?auto_121251 ?auto_121255 ) ) ( not ( = ?auto_121251 ?auto_121256 ) ) ( not ( = ?auto_121251 ?auto_121257 ) ) ( not ( = ?auto_121252 ?auto_121253 ) ) ( not ( = ?auto_121252 ?auto_121254 ) ) ( not ( = ?auto_121252 ?auto_121255 ) ) ( not ( = ?auto_121252 ?auto_121256 ) ) ( not ( = ?auto_121252 ?auto_121257 ) ) ( not ( = ?auto_121253 ?auto_121254 ) ) ( not ( = ?auto_121253 ?auto_121255 ) ) ( not ( = ?auto_121253 ?auto_121256 ) ) ( not ( = ?auto_121253 ?auto_121257 ) ) ( not ( = ?auto_121254 ?auto_121255 ) ) ( not ( = ?auto_121254 ?auto_121256 ) ) ( not ( = ?auto_121254 ?auto_121257 ) ) ( not ( = ?auto_121255 ?auto_121256 ) ) ( not ( = ?auto_121255 ?auto_121257 ) ) ( not ( = ?auto_121256 ?auto_121257 ) ) ( ON-TABLE ?auto_121257 ) ( ON ?auto_121256 ?auto_121257 ) ( ON ?auto_121255 ?auto_121256 ) ( ON ?auto_121254 ?auto_121255 ) ( CLEAR ?auto_121254 ) ( HOLDING ?auto_121253 ) ( CLEAR ?auto_121252 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121251 ?auto_121252 ?auto_121253 )
      ( MAKE-7PILE ?auto_121251 ?auto_121252 ?auto_121253 ?auto_121254 ?auto_121255 ?auto_121256 ?auto_121257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121258 - BLOCK
      ?auto_121259 - BLOCK
      ?auto_121260 - BLOCK
      ?auto_121261 - BLOCK
      ?auto_121262 - BLOCK
      ?auto_121263 - BLOCK
      ?auto_121264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121258 ) ( ON ?auto_121259 ?auto_121258 ) ( not ( = ?auto_121258 ?auto_121259 ) ) ( not ( = ?auto_121258 ?auto_121260 ) ) ( not ( = ?auto_121258 ?auto_121261 ) ) ( not ( = ?auto_121258 ?auto_121262 ) ) ( not ( = ?auto_121258 ?auto_121263 ) ) ( not ( = ?auto_121258 ?auto_121264 ) ) ( not ( = ?auto_121259 ?auto_121260 ) ) ( not ( = ?auto_121259 ?auto_121261 ) ) ( not ( = ?auto_121259 ?auto_121262 ) ) ( not ( = ?auto_121259 ?auto_121263 ) ) ( not ( = ?auto_121259 ?auto_121264 ) ) ( not ( = ?auto_121260 ?auto_121261 ) ) ( not ( = ?auto_121260 ?auto_121262 ) ) ( not ( = ?auto_121260 ?auto_121263 ) ) ( not ( = ?auto_121260 ?auto_121264 ) ) ( not ( = ?auto_121261 ?auto_121262 ) ) ( not ( = ?auto_121261 ?auto_121263 ) ) ( not ( = ?auto_121261 ?auto_121264 ) ) ( not ( = ?auto_121262 ?auto_121263 ) ) ( not ( = ?auto_121262 ?auto_121264 ) ) ( not ( = ?auto_121263 ?auto_121264 ) ) ( ON-TABLE ?auto_121264 ) ( ON ?auto_121263 ?auto_121264 ) ( ON ?auto_121262 ?auto_121263 ) ( ON ?auto_121261 ?auto_121262 ) ( CLEAR ?auto_121259 ) ( ON ?auto_121260 ?auto_121261 ) ( CLEAR ?auto_121260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121264 ?auto_121263 ?auto_121262 ?auto_121261 )
      ( MAKE-7PILE ?auto_121258 ?auto_121259 ?auto_121260 ?auto_121261 ?auto_121262 ?auto_121263 ?auto_121264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121265 - BLOCK
      ?auto_121266 - BLOCK
      ?auto_121267 - BLOCK
      ?auto_121268 - BLOCK
      ?auto_121269 - BLOCK
      ?auto_121270 - BLOCK
      ?auto_121271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121265 ) ( not ( = ?auto_121265 ?auto_121266 ) ) ( not ( = ?auto_121265 ?auto_121267 ) ) ( not ( = ?auto_121265 ?auto_121268 ) ) ( not ( = ?auto_121265 ?auto_121269 ) ) ( not ( = ?auto_121265 ?auto_121270 ) ) ( not ( = ?auto_121265 ?auto_121271 ) ) ( not ( = ?auto_121266 ?auto_121267 ) ) ( not ( = ?auto_121266 ?auto_121268 ) ) ( not ( = ?auto_121266 ?auto_121269 ) ) ( not ( = ?auto_121266 ?auto_121270 ) ) ( not ( = ?auto_121266 ?auto_121271 ) ) ( not ( = ?auto_121267 ?auto_121268 ) ) ( not ( = ?auto_121267 ?auto_121269 ) ) ( not ( = ?auto_121267 ?auto_121270 ) ) ( not ( = ?auto_121267 ?auto_121271 ) ) ( not ( = ?auto_121268 ?auto_121269 ) ) ( not ( = ?auto_121268 ?auto_121270 ) ) ( not ( = ?auto_121268 ?auto_121271 ) ) ( not ( = ?auto_121269 ?auto_121270 ) ) ( not ( = ?auto_121269 ?auto_121271 ) ) ( not ( = ?auto_121270 ?auto_121271 ) ) ( ON-TABLE ?auto_121271 ) ( ON ?auto_121270 ?auto_121271 ) ( ON ?auto_121269 ?auto_121270 ) ( ON ?auto_121268 ?auto_121269 ) ( ON ?auto_121267 ?auto_121268 ) ( CLEAR ?auto_121267 ) ( HOLDING ?auto_121266 ) ( CLEAR ?auto_121265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121265 ?auto_121266 )
      ( MAKE-7PILE ?auto_121265 ?auto_121266 ?auto_121267 ?auto_121268 ?auto_121269 ?auto_121270 ?auto_121271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121272 - BLOCK
      ?auto_121273 - BLOCK
      ?auto_121274 - BLOCK
      ?auto_121275 - BLOCK
      ?auto_121276 - BLOCK
      ?auto_121277 - BLOCK
      ?auto_121278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121272 ) ( not ( = ?auto_121272 ?auto_121273 ) ) ( not ( = ?auto_121272 ?auto_121274 ) ) ( not ( = ?auto_121272 ?auto_121275 ) ) ( not ( = ?auto_121272 ?auto_121276 ) ) ( not ( = ?auto_121272 ?auto_121277 ) ) ( not ( = ?auto_121272 ?auto_121278 ) ) ( not ( = ?auto_121273 ?auto_121274 ) ) ( not ( = ?auto_121273 ?auto_121275 ) ) ( not ( = ?auto_121273 ?auto_121276 ) ) ( not ( = ?auto_121273 ?auto_121277 ) ) ( not ( = ?auto_121273 ?auto_121278 ) ) ( not ( = ?auto_121274 ?auto_121275 ) ) ( not ( = ?auto_121274 ?auto_121276 ) ) ( not ( = ?auto_121274 ?auto_121277 ) ) ( not ( = ?auto_121274 ?auto_121278 ) ) ( not ( = ?auto_121275 ?auto_121276 ) ) ( not ( = ?auto_121275 ?auto_121277 ) ) ( not ( = ?auto_121275 ?auto_121278 ) ) ( not ( = ?auto_121276 ?auto_121277 ) ) ( not ( = ?auto_121276 ?auto_121278 ) ) ( not ( = ?auto_121277 ?auto_121278 ) ) ( ON-TABLE ?auto_121278 ) ( ON ?auto_121277 ?auto_121278 ) ( ON ?auto_121276 ?auto_121277 ) ( ON ?auto_121275 ?auto_121276 ) ( ON ?auto_121274 ?auto_121275 ) ( CLEAR ?auto_121272 ) ( ON ?auto_121273 ?auto_121274 ) ( CLEAR ?auto_121273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121278 ?auto_121277 ?auto_121276 ?auto_121275 ?auto_121274 )
      ( MAKE-7PILE ?auto_121272 ?auto_121273 ?auto_121274 ?auto_121275 ?auto_121276 ?auto_121277 ?auto_121278 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121279 - BLOCK
      ?auto_121280 - BLOCK
      ?auto_121281 - BLOCK
      ?auto_121282 - BLOCK
      ?auto_121283 - BLOCK
      ?auto_121284 - BLOCK
      ?auto_121285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121279 ?auto_121280 ) ) ( not ( = ?auto_121279 ?auto_121281 ) ) ( not ( = ?auto_121279 ?auto_121282 ) ) ( not ( = ?auto_121279 ?auto_121283 ) ) ( not ( = ?auto_121279 ?auto_121284 ) ) ( not ( = ?auto_121279 ?auto_121285 ) ) ( not ( = ?auto_121280 ?auto_121281 ) ) ( not ( = ?auto_121280 ?auto_121282 ) ) ( not ( = ?auto_121280 ?auto_121283 ) ) ( not ( = ?auto_121280 ?auto_121284 ) ) ( not ( = ?auto_121280 ?auto_121285 ) ) ( not ( = ?auto_121281 ?auto_121282 ) ) ( not ( = ?auto_121281 ?auto_121283 ) ) ( not ( = ?auto_121281 ?auto_121284 ) ) ( not ( = ?auto_121281 ?auto_121285 ) ) ( not ( = ?auto_121282 ?auto_121283 ) ) ( not ( = ?auto_121282 ?auto_121284 ) ) ( not ( = ?auto_121282 ?auto_121285 ) ) ( not ( = ?auto_121283 ?auto_121284 ) ) ( not ( = ?auto_121283 ?auto_121285 ) ) ( not ( = ?auto_121284 ?auto_121285 ) ) ( ON-TABLE ?auto_121285 ) ( ON ?auto_121284 ?auto_121285 ) ( ON ?auto_121283 ?auto_121284 ) ( ON ?auto_121282 ?auto_121283 ) ( ON ?auto_121281 ?auto_121282 ) ( ON ?auto_121280 ?auto_121281 ) ( CLEAR ?auto_121280 ) ( HOLDING ?auto_121279 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121279 )
      ( MAKE-7PILE ?auto_121279 ?auto_121280 ?auto_121281 ?auto_121282 ?auto_121283 ?auto_121284 ?auto_121285 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121286 - BLOCK
      ?auto_121287 - BLOCK
      ?auto_121288 - BLOCK
      ?auto_121289 - BLOCK
      ?auto_121290 - BLOCK
      ?auto_121291 - BLOCK
      ?auto_121292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121286 ?auto_121287 ) ) ( not ( = ?auto_121286 ?auto_121288 ) ) ( not ( = ?auto_121286 ?auto_121289 ) ) ( not ( = ?auto_121286 ?auto_121290 ) ) ( not ( = ?auto_121286 ?auto_121291 ) ) ( not ( = ?auto_121286 ?auto_121292 ) ) ( not ( = ?auto_121287 ?auto_121288 ) ) ( not ( = ?auto_121287 ?auto_121289 ) ) ( not ( = ?auto_121287 ?auto_121290 ) ) ( not ( = ?auto_121287 ?auto_121291 ) ) ( not ( = ?auto_121287 ?auto_121292 ) ) ( not ( = ?auto_121288 ?auto_121289 ) ) ( not ( = ?auto_121288 ?auto_121290 ) ) ( not ( = ?auto_121288 ?auto_121291 ) ) ( not ( = ?auto_121288 ?auto_121292 ) ) ( not ( = ?auto_121289 ?auto_121290 ) ) ( not ( = ?auto_121289 ?auto_121291 ) ) ( not ( = ?auto_121289 ?auto_121292 ) ) ( not ( = ?auto_121290 ?auto_121291 ) ) ( not ( = ?auto_121290 ?auto_121292 ) ) ( not ( = ?auto_121291 ?auto_121292 ) ) ( ON-TABLE ?auto_121292 ) ( ON ?auto_121291 ?auto_121292 ) ( ON ?auto_121290 ?auto_121291 ) ( ON ?auto_121289 ?auto_121290 ) ( ON ?auto_121288 ?auto_121289 ) ( ON ?auto_121287 ?auto_121288 ) ( ON ?auto_121286 ?auto_121287 ) ( CLEAR ?auto_121286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121292 ?auto_121291 ?auto_121290 ?auto_121289 ?auto_121288 ?auto_121287 )
      ( MAKE-7PILE ?auto_121286 ?auto_121287 ?auto_121288 ?auto_121289 ?auto_121290 ?auto_121291 ?auto_121292 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121293 - BLOCK
      ?auto_121294 - BLOCK
      ?auto_121295 - BLOCK
      ?auto_121296 - BLOCK
      ?auto_121297 - BLOCK
      ?auto_121298 - BLOCK
      ?auto_121299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121293 ?auto_121294 ) ) ( not ( = ?auto_121293 ?auto_121295 ) ) ( not ( = ?auto_121293 ?auto_121296 ) ) ( not ( = ?auto_121293 ?auto_121297 ) ) ( not ( = ?auto_121293 ?auto_121298 ) ) ( not ( = ?auto_121293 ?auto_121299 ) ) ( not ( = ?auto_121294 ?auto_121295 ) ) ( not ( = ?auto_121294 ?auto_121296 ) ) ( not ( = ?auto_121294 ?auto_121297 ) ) ( not ( = ?auto_121294 ?auto_121298 ) ) ( not ( = ?auto_121294 ?auto_121299 ) ) ( not ( = ?auto_121295 ?auto_121296 ) ) ( not ( = ?auto_121295 ?auto_121297 ) ) ( not ( = ?auto_121295 ?auto_121298 ) ) ( not ( = ?auto_121295 ?auto_121299 ) ) ( not ( = ?auto_121296 ?auto_121297 ) ) ( not ( = ?auto_121296 ?auto_121298 ) ) ( not ( = ?auto_121296 ?auto_121299 ) ) ( not ( = ?auto_121297 ?auto_121298 ) ) ( not ( = ?auto_121297 ?auto_121299 ) ) ( not ( = ?auto_121298 ?auto_121299 ) ) ( ON-TABLE ?auto_121299 ) ( ON ?auto_121298 ?auto_121299 ) ( ON ?auto_121297 ?auto_121298 ) ( ON ?auto_121296 ?auto_121297 ) ( ON ?auto_121295 ?auto_121296 ) ( ON ?auto_121294 ?auto_121295 ) ( HOLDING ?auto_121293 ) ( CLEAR ?auto_121294 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121299 ?auto_121298 ?auto_121297 ?auto_121296 ?auto_121295 ?auto_121294 ?auto_121293 )
      ( MAKE-7PILE ?auto_121293 ?auto_121294 ?auto_121295 ?auto_121296 ?auto_121297 ?auto_121298 ?auto_121299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121300 - BLOCK
      ?auto_121301 - BLOCK
      ?auto_121302 - BLOCK
      ?auto_121303 - BLOCK
      ?auto_121304 - BLOCK
      ?auto_121305 - BLOCK
      ?auto_121306 - BLOCK
    )
    :vars
    (
      ?auto_121307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121300 ?auto_121301 ) ) ( not ( = ?auto_121300 ?auto_121302 ) ) ( not ( = ?auto_121300 ?auto_121303 ) ) ( not ( = ?auto_121300 ?auto_121304 ) ) ( not ( = ?auto_121300 ?auto_121305 ) ) ( not ( = ?auto_121300 ?auto_121306 ) ) ( not ( = ?auto_121301 ?auto_121302 ) ) ( not ( = ?auto_121301 ?auto_121303 ) ) ( not ( = ?auto_121301 ?auto_121304 ) ) ( not ( = ?auto_121301 ?auto_121305 ) ) ( not ( = ?auto_121301 ?auto_121306 ) ) ( not ( = ?auto_121302 ?auto_121303 ) ) ( not ( = ?auto_121302 ?auto_121304 ) ) ( not ( = ?auto_121302 ?auto_121305 ) ) ( not ( = ?auto_121302 ?auto_121306 ) ) ( not ( = ?auto_121303 ?auto_121304 ) ) ( not ( = ?auto_121303 ?auto_121305 ) ) ( not ( = ?auto_121303 ?auto_121306 ) ) ( not ( = ?auto_121304 ?auto_121305 ) ) ( not ( = ?auto_121304 ?auto_121306 ) ) ( not ( = ?auto_121305 ?auto_121306 ) ) ( ON-TABLE ?auto_121306 ) ( ON ?auto_121305 ?auto_121306 ) ( ON ?auto_121304 ?auto_121305 ) ( ON ?auto_121303 ?auto_121304 ) ( ON ?auto_121302 ?auto_121303 ) ( ON ?auto_121301 ?auto_121302 ) ( CLEAR ?auto_121301 ) ( ON ?auto_121300 ?auto_121307 ) ( CLEAR ?auto_121300 ) ( HAND-EMPTY ) ( not ( = ?auto_121300 ?auto_121307 ) ) ( not ( = ?auto_121301 ?auto_121307 ) ) ( not ( = ?auto_121302 ?auto_121307 ) ) ( not ( = ?auto_121303 ?auto_121307 ) ) ( not ( = ?auto_121304 ?auto_121307 ) ) ( not ( = ?auto_121305 ?auto_121307 ) ) ( not ( = ?auto_121306 ?auto_121307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121300 ?auto_121307 )
      ( MAKE-7PILE ?auto_121300 ?auto_121301 ?auto_121302 ?auto_121303 ?auto_121304 ?auto_121305 ?auto_121306 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121308 - BLOCK
      ?auto_121309 - BLOCK
      ?auto_121310 - BLOCK
      ?auto_121311 - BLOCK
      ?auto_121312 - BLOCK
      ?auto_121313 - BLOCK
      ?auto_121314 - BLOCK
    )
    :vars
    (
      ?auto_121315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121308 ?auto_121309 ) ) ( not ( = ?auto_121308 ?auto_121310 ) ) ( not ( = ?auto_121308 ?auto_121311 ) ) ( not ( = ?auto_121308 ?auto_121312 ) ) ( not ( = ?auto_121308 ?auto_121313 ) ) ( not ( = ?auto_121308 ?auto_121314 ) ) ( not ( = ?auto_121309 ?auto_121310 ) ) ( not ( = ?auto_121309 ?auto_121311 ) ) ( not ( = ?auto_121309 ?auto_121312 ) ) ( not ( = ?auto_121309 ?auto_121313 ) ) ( not ( = ?auto_121309 ?auto_121314 ) ) ( not ( = ?auto_121310 ?auto_121311 ) ) ( not ( = ?auto_121310 ?auto_121312 ) ) ( not ( = ?auto_121310 ?auto_121313 ) ) ( not ( = ?auto_121310 ?auto_121314 ) ) ( not ( = ?auto_121311 ?auto_121312 ) ) ( not ( = ?auto_121311 ?auto_121313 ) ) ( not ( = ?auto_121311 ?auto_121314 ) ) ( not ( = ?auto_121312 ?auto_121313 ) ) ( not ( = ?auto_121312 ?auto_121314 ) ) ( not ( = ?auto_121313 ?auto_121314 ) ) ( ON-TABLE ?auto_121314 ) ( ON ?auto_121313 ?auto_121314 ) ( ON ?auto_121312 ?auto_121313 ) ( ON ?auto_121311 ?auto_121312 ) ( ON ?auto_121310 ?auto_121311 ) ( ON ?auto_121308 ?auto_121315 ) ( CLEAR ?auto_121308 ) ( not ( = ?auto_121308 ?auto_121315 ) ) ( not ( = ?auto_121309 ?auto_121315 ) ) ( not ( = ?auto_121310 ?auto_121315 ) ) ( not ( = ?auto_121311 ?auto_121315 ) ) ( not ( = ?auto_121312 ?auto_121315 ) ) ( not ( = ?auto_121313 ?auto_121315 ) ) ( not ( = ?auto_121314 ?auto_121315 ) ) ( HOLDING ?auto_121309 ) ( CLEAR ?auto_121310 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121314 ?auto_121313 ?auto_121312 ?auto_121311 ?auto_121310 ?auto_121309 )
      ( MAKE-7PILE ?auto_121308 ?auto_121309 ?auto_121310 ?auto_121311 ?auto_121312 ?auto_121313 ?auto_121314 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121316 - BLOCK
      ?auto_121317 - BLOCK
      ?auto_121318 - BLOCK
      ?auto_121319 - BLOCK
      ?auto_121320 - BLOCK
      ?auto_121321 - BLOCK
      ?auto_121322 - BLOCK
    )
    :vars
    (
      ?auto_121323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121316 ?auto_121317 ) ) ( not ( = ?auto_121316 ?auto_121318 ) ) ( not ( = ?auto_121316 ?auto_121319 ) ) ( not ( = ?auto_121316 ?auto_121320 ) ) ( not ( = ?auto_121316 ?auto_121321 ) ) ( not ( = ?auto_121316 ?auto_121322 ) ) ( not ( = ?auto_121317 ?auto_121318 ) ) ( not ( = ?auto_121317 ?auto_121319 ) ) ( not ( = ?auto_121317 ?auto_121320 ) ) ( not ( = ?auto_121317 ?auto_121321 ) ) ( not ( = ?auto_121317 ?auto_121322 ) ) ( not ( = ?auto_121318 ?auto_121319 ) ) ( not ( = ?auto_121318 ?auto_121320 ) ) ( not ( = ?auto_121318 ?auto_121321 ) ) ( not ( = ?auto_121318 ?auto_121322 ) ) ( not ( = ?auto_121319 ?auto_121320 ) ) ( not ( = ?auto_121319 ?auto_121321 ) ) ( not ( = ?auto_121319 ?auto_121322 ) ) ( not ( = ?auto_121320 ?auto_121321 ) ) ( not ( = ?auto_121320 ?auto_121322 ) ) ( not ( = ?auto_121321 ?auto_121322 ) ) ( ON-TABLE ?auto_121322 ) ( ON ?auto_121321 ?auto_121322 ) ( ON ?auto_121320 ?auto_121321 ) ( ON ?auto_121319 ?auto_121320 ) ( ON ?auto_121318 ?auto_121319 ) ( ON ?auto_121316 ?auto_121323 ) ( not ( = ?auto_121316 ?auto_121323 ) ) ( not ( = ?auto_121317 ?auto_121323 ) ) ( not ( = ?auto_121318 ?auto_121323 ) ) ( not ( = ?auto_121319 ?auto_121323 ) ) ( not ( = ?auto_121320 ?auto_121323 ) ) ( not ( = ?auto_121321 ?auto_121323 ) ) ( not ( = ?auto_121322 ?auto_121323 ) ) ( CLEAR ?auto_121318 ) ( ON ?auto_121317 ?auto_121316 ) ( CLEAR ?auto_121317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121323 ?auto_121316 )
      ( MAKE-7PILE ?auto_121316 ?auto_121317 ?auto_121318 ?auto_121319 ?auto_121320 ?auto_121321 ?auto_121322 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121324 - BLOCK
      ?auto_121325 - BLOCK
      ?auto_121326 - BLOCK
      ?auto_121327 - BLOCK
      ?auto_121328 - BLOCK
      ?auto_121329 - BLOCK
      ?auto_121330 - BLOCK
    )
    :vars
    (
      ?auto_121331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121324 ?auto_121325 ) ) ( not ( = ?auto_121324 ?auto_121326 ) ) ( not ( = ?auto_121324 ?auto_121327 ) ) ( not ( = ?auto_121324 ?auto_121328 ) ) ( not ( = ?auto_121324 ?auto_121329 ) ) ( not ( = ?auto_121324 ?auto_121330 ) ) ( not ( = ?auto_121325 ?auto_121326 ) ) ( not ( = ?auto_121325 ?auto_121327 ) ) ( not ( = ?auto_121325 ?auto_121328 ) ) ( not ( = ?auto_121325 ?auto_121329 ) ) ( not ( = ?auto_121325 ?auto_121330 ) ) ( not ( = ?auto_121326 ?auto_121327 ) ) ( not ( = ?auto_121326 ?auto_121328 ) ) ( not ( = ?auto_121326 ?auto_121329 ) ) ( not ( = ?auto_121326 ?auto_121330 ) ) ( not ( = ?auto_121327 ?auto_121328 ) ) ( not ( = ?auto_121327 ?auto_121329 ) ) ( not ( = ?auto_121327 ?auto_121330 ) ) ( not ( = ?auto_121328 ?auto_121329 ) ) ( not ( = ?auto_121328 ?auto_121330 ) ) ( not ( = ?auto_121329 ?auto_121330 ) ) ( ON-TABLE ?auto_121330 ) ( ON ?auto_121329 ?auto_121330 ) ( ON ?auto_121328 ?auto_121329 ) ( ON ?auto_121327 ?auto_121328 ) ( ON ?auto_121324 ?auto_121331 ) ( not ( = ?auto_121324 ?auto_121331 ) ) ( not ( = ?auto_121325 ?auto_121331 ) ) ( not ( = ?auto_121326 ?auto_121331 ) ) ( not ( = ?auto_121327 ?auto_121331 ) ) ( not ( = ?auto_121328 ?auto_121331 ) ) ( not ( = ?auto_121329 ?auto_121331 ) ) ( not ( = ?auto_121330 ?auto_121331 ) ) ( ON ?auto_121325 ?auto_121324 ) ( CLEAR ?auto_121325 ) ( ON-TABLE ?auto_121331 ) ( HOLDING ?auto_121326 ) ( CLEAR ?auto_121327 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121330 ?auto_121329 ?auto_121328 ?auto_121327 ?auto_121326 )
      ( MAKE-7PILE ?auto_121324 ?auto_121325 ?auto_121326 ?auto_121327 ?auto_121328 ?auto_121329 ?auto_121330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121332 - BLOCK
      ?auto_121333 - BLOCK
      ?auto_121334 - BLOCK
      ?auto_121335 - BLOCK
      ?auto_121336 - BLOCK
      ?auto_121337 - BLOCK
      ?auto_121338 - BLOCK
    )
    :vars
    (
      ?auto_121339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121332 ?auto_121333 ) ) ( not ( = ?auto_121332 ?auto_121334 ) ) ( not ( = ?auto_121332 ?auto_121335 ) ) ( not ( = ?auto_121332 ?auto_121336 ) ) ( not ( = ?auto_121332 ?auto_121337 ) ) ( not ( = ?auto_121332 ?auto_121338 ) ) ( not ( = ?auto_121333 ?auto_121334 ) ) ( not ( = ?auto_121333 ?auto_121335 ) ) ( not ( = ?auto_121333 ?auto_121336 ) ) ( not ( = ?auto_121333 ?auto_121337 ) ) ( not ( = ?auto_121333 ?auto_121338 ) ) ( not ( = ?auto_121334 ?auto_121335 ) ) ( not ( = ?auto_121334 ?auto_121336 ) ) ( not ( = ?auto_121334 ?auto_121337 ) ) ( not ( = ?auto_121334 ?auto_121338 ) ) ( not ( = ?auto_121335 ?auto_121336 ) ) ( not ( = ?auto_121335 ?auto_121337 ) ) ( not ( = ?auto_121335 ?auto_121338 ) ) ( not ( = ?auto_121336 ?auto_121337 ) ) ( not ( = ?auto_121336 ?auto_121338 ) ) ( not ( = ?auto_121337 ?auto_121338 ) ) ( ON-TABLE ?auto_121338 ) ( ON ?auto_121337 ?auto_121338 ) ( ON ?auto_121336 ?auto_121337 ) ( ON ?auto_121335 ?auto_121336 ) ( ON ?auto_121332 ?auto_121339 ) ( not ( = ?auto_121332 ?auto_121339 ) ) ( not ( = ?auto_121333 ?auto_121339 ) ) ( not ( = ?auto_121334 ?auto_121339 ) ) ( not ( = ?auto_121335 ?auto_121339 ) ) ( not ( = ?auto_121336 ?auto_121339 ) ) ( not ( = ?auto_121337 ?auto_121339 ) ) ( not ( = ?auto_121338 ?auto_121339 ) ) ( ON ?auto_121333 ?auto_121332 ) ( ON-TABLE ?auto_121339 ) ( CLEAR ?auto_121335 ) ( ON ?auto_121334 ?auto_121333 ) ( CLEAR ?auto_121334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121339 ?auto_121332 ?auto_121333 )
      ( MAKE-7PILE ?auto_121332 ?auto_121333 ?auto_121334 ?auto_121335 ?auto_121336 ?auto_121337 ?auto_121338 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121340 - BLOCK
      ?auto_121341 - BLOCK
      ?auto_121342 - BLOCK
      ?auto_121343 - BLOCK
      ?auto_121344 - BLOCK
      ?auto_121345 - BLOCK
      ?auto_121346 - BLOCK
    )
    :vars
    (
      ?auto_121347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121340 ?auto_121341 ) ) ( not ( = ?auto_121340 ?auto_121342 ) ) ( not ( = ?auto_121340 ?auto_121343 ) ) ( not ( = ?auto_121340 ?auto_121344 ) ) ( not ( = ?auto_121340 ?auto_121345 ) ) ( not ( = ?auto_121340 ?auto_121346 ) ) ( not ( = ?auto_121341 ?auto_121342 ) ) ( not ( = ?auto_121341 ?auto_121343 ) ) ( not ( = ?auto_121341 ?auto_121344 ) ) ( not ( = ?auto_121341 ?auto_121345 ) ) ( not ( = ?auto_121341 ?auto_121346 ) ) ( not ( = ?auto_121342 ?auto_121343 ) ) ( not ( = ?auto_121342 ?auto_121344 ) ) ( not ( = ?auto_121342 ?auto_121345 ) ) ( not ( = ?auto_121342 ?auto_121346 ) ) ( not ( = ?auto_121343 ?auto_121344 ) ) ( not ( = ?auto_121343 ?auto_121345 ) ) ( not ( = ?auto_121343 ?auto_121346 ) ) ( not ( = ?auto_121344 ?auto_121345 ) ) ( not ( = ?auto_121344 ?auto_121346 ) ) ( not ( = ?auto_121345 ?auto_121346 ) ) ( ON-TABLE ?auto_121346 ) ( ON ?auto_121345 ?auto_121346 ) ( ON ?auto_121344 ?auto_121345 ) ( ON ?auto_121340 ?auto_121347 ) ( not ( = ?auto_121340 ?auto_121347 ) ) ( not ( = ?auto_121341 ?auto_121347 ) ) ( not ( = ?auto_121342 ?auto_121347 ) ) ( not ( = ?auto_121343 ?auto_121347 ) ) ( not ( = ?auto_121344 ?auto_121347 ) ) ( not ( = ?auto_121345 ?auto_121347 ) ) ( not ( = ?auto_121346 ?auto_121347 ) ) ( ON ?auto_121341 ?auto_121340 ) ( ON-TABLE ?auto_121347 ) ( ON ?auto_121342 ?auto_121341 ) ( CLEAR ?auto_121342 ) ( HOLDING ?auto_121343 ) ( CLEAR ?auto_121344 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121346 ?auto_121345 ?auto_121344 ?auto_121343 )
      ( MAKE-7PILE ?auto_121340 ?auto_121341 ?auto_121342 ?auto_121343 ?auto_121344 ?auto_121345 ?auto_121346 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121348 - BLOCK
      ?auto_121349 - BLOCK
      ?auto_121350 - BLOCK
      ?auto_121351 - BLOCK
      ?auto_121352 - BLOCK
      ?auto_121353 - BLOCK
      ?auto_121354 - BLOCK
    )
    :vars
    (
      ?auto_121355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121348 ?auto_121349 ) ) ( not ( = ?auto_121348 ?auto_121350 ) ) ( not ( = ?auto_121348 ?auto_121351 ) ) ( not ( = ?auto_121348 ?auto_121352 ) ) ( not ( = ?auto_121348 ?auto_121353 ) ) ( not ( = ?auto_121348 ?auto_121354 ) ) ( not ( = ?auto_121349 ?auto_121350 ) ) ( not ( = ?auto_121349 ?auto_121351 ) ) ( not ( = ?auto_121349 ?auto_121352 ) ) ( not ( = ?auto_121349 ?auto_121353 ) ) ( not ( = ?auto_121349 ?auto_121354 ) ) ( not ( = ?auto_121350 ?auto_121351 ) ) ( not ( = ?auto_121350 ?auto_121352 ) ) ( not ( = ?auto_121350 ?auto_121353 ) ) ( not ( = ?auto_121350 ?auto_121354 ) ) ( not ( = ?auto_121351 ?auto_121352 ) ) ( not ( = ?auto_121351 ?auto_121353 ) ) ( not ( = ?auto_121351 ?auto_121354 ) ) ( not ( = ?auto_121352 ?auto_121353 ) ) ( not ( = ?auto_121352 ?auto_121354 ) ) ( not ( = ?auto_121353 ?auto_121354 ) ) ( ON-TABLE ?auto_121354 ) ( ON ?auto_121353 ?auto_121354 ) ( ON ?auto_121352 ?auto_121353 ) ( ON ?auto_121348 ?auto_121355 ) ( not ( = ?auto_121348 ?auto_121355 ) ) ( not ( = ?auto_121349 ?auto_121355 ) ) ( not ( = ?auto_121350 ?auto_121355 ) ) ( not ( = ?auto_121351 ?auto_121355 ) ) ( not ( = ?auto_121352 ?auto_121355 ) ) ( not ( = ?auto_121353 ?auto_121355 ) ) ( not ( = ?auto_121354 ?auto_121355 ) ) ( ON ?auto_121349 ?auto_121348 ) ( ON-TABLE ?auto_121355 ) ( ON ?auto_121350 ?auto_121349 ) ( CLEAR ?auto_121352 ) ( ON ?auto_121351 ?auto_121350 ) ( CLEAR ?auto_121351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121355 ?auto_121348 ?auto_121349 ?auto_121350 )
      ( MAKE-7PILE ?auto_121348 ?auto_121349 ?auto_121350 ?auto_121351 ?auto_121352 ?auto_121353 ?auto_121354 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121356 - BLOCK
      ?auto_121357 - BLOCK
      ?auto_121358 - BLOCK
      ?auto_121359 - BLOCK
      ?auto_121360 - BLOCK
      ?auto_121361 - BLOCK
      ?auto_121362 - BLOCK
    )
    :vars
    (
      ?auto_121363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121356 ?auto_121357 ) ) ( not ( = ?auto_121356 ?auto_121358 ) ) ( not ( = ?auto_121356 ?auto_121359 ) ) ( not ( = ?auto_121356 ?auto_121360 ) ) ( not ( = ?auto_121356 ?auto_121361 ) ) ( not ( = ?auto_121356 ?auto_121362 ) ) ( not ( = ?auto_121357 ?auto_121358 ) ) ( not ( = ?auto_121357 ?auto_121359 ) ) ( not ( = ?auto_121357 ?auto_121360 ) ) ( not ( = ?auto_121357 ?auto_121361 ) ) ( not ( = ?auto_121357 ?auto_121362 ) ) ( not ( = ?auto_121358 ?auto_121359 ) ) ( not ( = ?auto_121358 ?auto_121360 ) ) ( not ( = ?auto_121358 ?auto_121361 ) ) ( not ( = ?auto_121358 ?auto_121362 ) ) ( not ( = ?auto_121359 ?auto_121360 ) ) ( not ( = ?auto_121359 ?auto_121361 ) ) ( not ( = ?auto_121359 ?auto_121362 ) ) ( not ( = ?auto_121360 ?auto_121361 ) ) ( not ( = ?auto_121360 ?auto_121362 ) ) ( not ( = ?auto_121361 ?auto_121362 ) ) ( ON-TABLE ?auto_121362 ) ( ON ?auto_121361 ?auto_121362 ) ( ON ?auto_121356 ?auto_121363 ) ( not ( = ?auto_121356 ?auto_121363 ) ) ( not ( = ?auto_121357 ?auto_121363 ) ) ( not ( = ?auto_121358 ?auto_121363 ) ) ( not ( = ?auto_121359 ?auto_121363 ) ) ( not ( = ?auto_121360 ?auto_121363 ) ) ( not ( = ?auto_121361 ?auto_121363 ) ) ( not ( = ?auto_121362 ?auto_121363 ) ) ( ON ?auto_121357 ?auto_121356 ) ( ON-TABLE ?auto_121363 ) ( ON ?auto_121358 ?auto_121357 ) ( ON ?auto_121359 ?auto_121358 ) ( CLEAR ?auto_121359 ) ( HOLDING ?auto_121360 ) ( CLEAR ?auto_121361 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121362 ?auto_121361 ?auto_121360 )
      ( MAKE-7PILE ?auto_121356 ?auto_121357 ?auto_121358 ?auto_121359 ?auto_121360 ?auto_121361 ?auto_121362 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121364 - BLOCK
      ?auto_121365 - BLOCK
      ?auto_121366 - BLOCK
      ?auto_121367 - BLOCK
      ?auto_121368 - BLOCK
      ?auto_121369 - BLOCK
      ?auto_121370 - BLOCK
    )
    :vars
    (
      ?auto_121371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121364 ?auto_121365 ) ) ( not ( = ?auto_121364 ?auto_121366 ) ) ( not ( = ?auto_121364 ?auto_121367 ) ) ( not ( = ?auto_121364 ?auto_121368 ) ) ( not ( = ?auto_121364 ?auto_121369 ) ) ( not ( = ?auto_121364 ?auto_121370 ) ) ( not ( = ?auto_121365 ?auto_121366 ) ) ( not ( = ?auto_121365 ?auto_121367 ) ) ( not ( = ?auto_121365 ?auto_121368 ) ) ( not ( = ?auto_121365 ?auto_121369 ) ) ( not ( = ?auto_121365 ?auto_121370 ) ) ( not ( = ?auto_121366 ?auto_121367 ) ) ( not ( = ?auto_121366 ?auto_121368 ) ) ( not ( = ?auto_121366 ?auto_121369 ) ) ( not ( = ?auto_121366 ?auto_121370 ) ) ( not ( = ?auto_121367 ?auto_121368 ) ) ( not ( = ?auto_121367 ?auto_121369 ) ) ( not ( = ?auto_121367 ?auto_121370 ) ) ( not ( = ?auto_121368 ?auto_121369 ) ) ( not ( = ?auto_121368 ?auto_121370 ) ) ( not ( = ?auto_121369 ?auto_121370 ) ) ( ON-TABLE ?auto_121370 ) ( ON ?auto_121369 ?auto_121370 ) ( ON ?auto_121364 ?auto_121371 ) ( not ( = ?auto_121364 ?auto_121371 ) ) ( not ( = ?auto_121365 ?auto_121371 ) ) ( not ( = ?auto_121366 ?auto_121371 ) ) ( not ( = ?auto_121367 ?auto_121371 ) ) ( not ( = ?auto_121368 ?auto_121371 ) ) ( not ( = ?auto_121369 ?auto_121371 ) ) ( not ( = ?auto_121370 ?auto_121371 ) ) ( ON ?auto_121365 ?auto_121364 ) ( ON-TABLE ?auto_121371 ) ( ON ?auto_121366 ?auto_121365 ) ( ON ?auto_121367 ?auto_121366 ) ( CLEAR ?auto_121369 ) ( ON ?auto_121368 ?auto_121367 ) ( CLEAR ?auto_121368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121371 ?auto_121364 ?auto_121365 ?auto_121366 ?auto_121367 )
      ( MAKE-7PILE ?auto_121364 ?auto_121365 ?auto_121366 ?auto_121367 ?auto_121368 ?auto_121369 ?auto_121370 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121372 - BLOCK
      ?auto_121373 - BLOCK
      ?auto_121374 - BLOCK
      ?auto_121375 - BLOCK
      ?auto_121376 - BLOCK
      ?auto_121377 - BLOCK
      ?auto_121378 - BLOCK
    )
    :vars
    (
      ?auto_121379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121372 ?auto_121373 ) ) ( not ( = ?auto_121372 ?auto_121374 ) ) ( not ( = ?auto_121372 ?auto_121375 ) ) ( not ( = ?auto_121372 ?auto_121376 ) ) ( not ( = ?auto_121372 ?auto_121377 ) ) ( not ( = ?auto_121372 ?auto_121378 ) ) ( not ( = ?auto_121373 ?auto_121374 ) ) ( not ( = ?auto_121373 ?auto_121375 ) ) ( not ( = ?auto_121373 ?auto_121376 ) ) ( not ( = ?auto_121373 ?auto_121377 ) ) ( not ( = ?auto_121373 ?auto_121378 ) ) ( not ( = ?auto_121374 ?auto_121375 ) ) ( not ( = ?auto_121374 ?auto_121376 ) ) ( not ( = ?auto_121374 ?auto_121377 ) ) ( not ( = ?auto_121374 ?auto_121378 ) ) ( not ( = ?auto_121375 ?auto_121376 ) ) ( not ( = ?auto_121375 ?auto_121377 ) ) ( not ( = ?auto_121375 ?auto_121378 ) ) ( not ( = ?auto_121376 ?auto_121377 ) ) ( not ( = ?auto_121376 ?auto_121378 ) ) ( not ( = ?auto_121377 ?auto_121378 ) ) ( ON-TABLE ?auto_121378 ) ( ON ?auto_121372 ?auto_121379 ) ( not ( = ?auto_121372 ?auto_121379 ) ) ( not ( = ?auto_121373 ?auto_121379 ) ) ( not ( = ?auto_121374 ?auto_121379 ) ) ( not ( = ?auto_121375 ?auto_121379 ) ) ( not ( = ?auto_121376 ?auto_121379 ) ) ( not ( = ?auto_121377 ?auto_121379 ) ) ( not ( = ?auto_121378 ?auto_121379 ) ) ( ON ?auto_121373 ?auto_121372 ) ( ON-TABLE ?auto_121379 ) ( ON ?auto_121374 ?auto_121373 ) ( ON ?auto_121375 ?auto_121374 ) ( ON ?auto_121376 ?auto_121375 ) ( CLEAR ?auto_121376 ) ( HOLDING ?auto_121377 ) ( CLEAR ?auto_121378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121378 ?auto_121377 )
      ( MAKE-7PILE ?auto_121372 ?auto_121373 ?auto_121374 ?auto_121375 ?auto_121376 ?auto_121377 ?auto_121378 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121380 - BLOCK
      ?auto_121381 - BLOCK
      ?auto_121382 - BLOCK
      ?auto_121383 - BLOCK
      ?auto_121384 - BLOCK
      ?auto_121385 - BLOCK
      ?auto_121386 - BLOCK
    )
    :vars
    (
      ?auto_121387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121380 ?auto_121381 ) ) ( not ( = ?auto_121380 ?auto_121382 ) ) ( not ( = ?auto_121380 ?auto_121383 ) ) ( not ( = ?auto_121380 ?auto_121384 ) ) ( not ( = ?auto_121380 ?auto_121385 ) ) ( not ( = ?auto_121380 ?auto_121386 ) ) ( not ( = ?auto_121381 ?auto_121382 ) ) ( not ( = ?auto_121381 ?auto_121383 ) ) ( not ( = ?auto_121381 ?auto_121384 ) ) ( not ( = ?auto_121381 ?auto_121385 ) ) ( not ( = ?auto_121381 ?auto_121386 ) ) ( not ( = ?auto_121382 ?auto_121383 ) ) ( not ( = ?auto_121382 ?auto_121384 ) ) ( not ( = ?auto_121382 ?auto_121385 ) ) ( not ( = ?auto_121382 ?auto_121386 ) ) ( not ( = ?auto_121383 ?auto_121384 ) ) ( not ( = ?auto_121383 ?auto_121385 ) ) ( not ( = ?auto_121383 ?auto_121386 ) ) ( not ( = ?auto_121384 ?auto_121385 ) ) ( not ( = ?auto_121384 ?auto_121386 ) ) ( not ( = ?auto_121385 ?auto_121386 ) ) ( ON-TABLE ?auto_121386 ) ( ON ?auto_121380 ?auto_121387 ) ( not ( = ?auto_121380 ?auto_121387 ) ) ( not ( = ?auto_121381 ?auto_121387 ) ) ( not ( = ?auto_121382 ?auto_121387 ) ) ( not ( = ?auto_121383 ?auto_121387 ) ) ( not ( = ?auto_121384 ?auto_121387 ) ) ( not ( = ?auto_121385 ?auto_121387 ) ) ( not ( = ?auto_121386 ?auto_121387 ) ) ( ON ?auto_121381 ?auto_121380 ) ( ON-TABLE ?auto_121387 ) ( ON ?auto_121382 ?auto_121381 ) ( ON ?auto_121383 ?auto_121382 ) ( ON ?auto_121384 ?auto_121383 ) ( CLEAR ?auto_121386 ) ( ON ?auto_121385 ?auto_121384 ) ( CLEAR ?auto_121385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121387 ?auto_121380 ?auto_121381 ?auto_121382 ?auto_121383 ?auto_121384 )
      ( MAKE-7PILE ?auto_121380 ?auto_121381 ?auto_121382 ?auto_121383 ?auto_121384 ?auto_121385 ?auto_121386 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121388 - BLOCK
      ?auto_121389 - BLOCK
      ?auto_121390 - BLOCK
      ?auto_121391 - BLOCK
      ?auto_121392 - BLOCK
      ?auto_121393 - BLOCK
      ?auto_121394 - BLOCK
    )
    :vars
    (
      ?auto_121395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121388 ?auto_121389 ) ) ( not ( = ?auto_121388 ?auto_121390 ) ) ( not ( = ?auto_121388 ?auto_121391 ) ) ( not ( = ?auto_121388 ?auto_121392 ) ) ( not ( = ?auto_121388 ?auto_121393 ) ) ( not ( = ?auto_121388 ?auto_121394 ) ) ( not ( = ?auto_121389 ?auto_121390 ) ) ( not ( = ?auto_121389 ?auto_121391 ) ) ( not ( = ?auto_121389 ?auto_121392 ) ) ( not ( = ?auto_121389 ?auto_121393 ) ) ( not ( = ?auto_121389 ?auto_121394 ) ) ( not ( = ?auto_121390 ?auto_121391 ) ) ( not ( = ?auto_121390 ?auto_121392 ) ) ( not ( = ?auto_121390 ?auto_121393 ) ) ( not ( = ?auto_121390 ?auto_121394 ) ) ( not ( = ?auto_121391 ?auto_121392 ) ) ( not ( = ?auto_121391 ?auto_121393 ) ) ( not ( = ?auto_121391 ?auto_121394 ) ) ( not ( = ?auto_121392 ?auto_121393 ) ) ( not ( = ?auto_121392 ?auto_121394 ) ) ( not ( = ?auto_121393 ?auto_121394 ) ) ( ON ?auto_121388 ?auto_121395 ) ( not ( = ?auto_121388 ?auto_121395 ) ) ( not ( = ?auto_121389 ?auto_121395 ) ) ( not ( = ?auto_121390 ?auto_121395 ) ) ( not ( = ?auto_121391 ?auto_121395 ) ) ( not ( = ?auto_121392 ?auto_121395 ) ) ( not ( = ?auto_121393 ?auto_121395 ) ) ( not ( = ?auto_121394 ?auto_121395 ) ) ( ON ?auto_121389 ?auto_121388 ) ( ON-TABLE ?auto_121395 ) ( ON ?auto_121390 ?auto_121389 ) ( ON ?auto_121391 ?auto_121390 ) ( ON ?auto_121392 ?auto_121391 ) ( ON ?auto_121393 ?auto_121392 ) ( CLEAR ?auto_121393 ) ( HOLDING ?auto_121394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121394 )
      ( MAKE-7PILE ?auto_121388 ?auto_121389 ?auto_121390 ?auto_121391 ?auto_121392 ?auto_121393 ?auto_121394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121396 - BLOCK
      ?auto_121397 - BLOCK
      ?auto_121398 - BLOCK
      ?auto_121399 - BLOCK
      ?auto_121400 - BLOCK
      ?auto_121401 - BLOCK
      ?auto_121402 - BLOCK
    )
    :vars
    (
      ?auto_121403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121396 ?auto_121397 ) ) ( not ( = ?auto_121396 ?auto_121398 ) ) ( not ( = ?auto_121396 ?auto_121399 ) ) ( not ( = ?auto_121396 ?auto_121400 ) ) ( not ( = ?auto_121396 ?auto_121401 ) ) ( not ( = ?auto_121396 ?auto_121402 ) ) ( not ( = ?auto_121397 ?auto_121398 ) ) ( not ( = ?auto_121397 ?auto_121399 ) ) ( not ( = ?auto_121397 ?auto_121400 ) ) ( not ( = ?auto_121397 ?auto_121401 ) ) ( not ( = ?auto_121397 ?auto_121402 ) ) ( not ( = ?auto_121398 ?auto_121399 ) ) ( not ( = ?auto_121398 ?auto_121400 ) ) ( not ( = ?auto_121398 ?auto_121401 ) ) ( not ( = ?auto_121398 ?auto_121402 ) ) ( not ( = ?auto_121399 ?auto_121400 ) ) ( not ( = ?auto_121399 ?auto_121401 ) ) ( not ( = ?auto_121399 ?auto_121402 ) ) ( not ( = ?auto_121400 ?auto_121401 ) ) ( not ( = ?auto_121400 ?auto_121402 ) ) ( not ( = ?auto_121401 ?auto_121402 ) ) ( ON ?auto_121396 ?auto_121403 ) ( not ( = ?auto_121396 ?auto_121403 ) ) ( not ( = ?auto_121397 ?auto_121403 ) ) ( not ( = ?auto_121398 ?auto_121403 ) ) ( not ( = ?auto_121399 ?auto_121403 ) ) ( not ( = ?auto_121400 ?auto_121403 ) ) ( not ( = ?auto_121401 ?auto_121403 ) ) ( not ( = ?auto_121402 ?auto_121403 ) ) ( ON ?auto_121397 ?auto_121396 ) ( ON-TABLE ?auto_121403 ) ( ON ?auto_121398 ?auto_121397 ) ( ON ?auto_121399 ?auto_121398 ) ( ON ?auto_121400 ?auto_121399 ) ( ON ?auto_121401 ?auto_121400 ) ( ON ?auto_121402 ?auto_121401 ) ( CLEAR ?auto_121402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121403 ?auto_121396 ?auto_121397 ?auto_121398 ?auto_121399 ?auto_121400 ?auto_121401 )
      ( MAKE-7PILE ?auto_121396 ?auto_121397 ?auto_121398 ?auto_121399 ?auto_121400 ?auto_121401 ?auto_121402 ) )
  )

)

