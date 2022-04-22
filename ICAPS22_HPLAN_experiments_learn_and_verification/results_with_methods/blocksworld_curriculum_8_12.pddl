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
      ?auto_41545 - BLOCK
    )
    :vars
    (
      ?auto_41546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41545 ?auto_41546 ) ( CLEAR ?auto_41545 ) ( HAND-EMPTY ) ( not ( = ?auto_41545 ?auto_41546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41545 ?auto_41546 )
      ( !PUTDOWN ?auto_41545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_41548 - BLOCK
    )
    :vars
    (
      ?auto_41549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41548 ?auto_41549 ) ( CLEAR ?auto_41548 ) ( HAND-EMPTY ) ( not ( = ?auto_41548 ?auto_41549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41548 ?auto_41549 )
      ( !PUTDOWN ?auto_41548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41552 - BLOCK
      ?auto_41553 - BLOCK
    )
    :vars
    (
      ?auto_41554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41552 ) ( ON ?auto_41553 ?auto_41554 ) ( CLEAR ?auto_41553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41552 ) ( not ( = ?auto_41552 ?auto_41553 ) ) ( not ( = ?auto_41552 ?auto_41554 ) ) ( not ( = ?auto_41553 ?auto_41554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41553 ?auto_41554 )
      ( !STACK ?auto_41553 ?auto_41552 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41557 - BLOCK
      ?auto_41558 - BLOCK
    )
    :vars
    (
      ?auto_41559 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41557 ) ( ON ?auto_41558 ?auto_41559 ) ( CLEAR ?auto_41558 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41557 ) ( not ( = ?auto_41557 ?auto_41558 ) ) ( not ( = ?auto_41557 ?auto_41559 ) ) ( not ( = ?auto_41558 ?auto_41559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41558 ?auto_41559 )
      ( !STACK ?auto_41558 ?auto_41557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41562 - BLOCK
      ?auto_41563 - BLOCK
    )
    :vars
    (
      ?auto_41564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41563 ?auto_41564 ) ( not ( = ?auto_41562 ?auto_41563 ) ) ( not ( = ?auto_41562 ?auto_41564 ) ) ( not ( = ?auto_41563 ?auto_41564 ) ) ( ON ?auto_41562 ?auto_41563 ) ( CLEAR ?auto_41562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41562 )
      ( MAKE-2PILE ?auto_41562 ?auto_41563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_41567 - BLOCK
      ?auto_41568 - BLOCK
    )
    :vars
    (
      ?auto_41569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41568 ?auto_41569 ) ( not ( = ?auto_41567 ?auto_41568 ) ) ( not ( = ?auto_41567 ?auto_41569 ) ) ( not ( = ?auto_41568 ?auto_41569 ) ) ( ON ?auto_41567 ?auto_41568 ) ( CLEAR ?auto_41567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41567 )
      ( MAKE-2PILE ?auto_41567 ?auto_41568 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41573 - BLOCK
      ?auto_41574 - BLOCK
      ?auto_41575 - BLOCK
    )
    :vars
    (
      ?auto_41576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41574 ) ( ON ?auto_41575 ?auto_41576 ) ( CLEAR ?auto_41575 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41573 ) ( ON ?auto_41574 ?auto_41573 ) ( not ( = ?auto_41573 ?auto_41574 ) ) ( not ( = ?auto_41573 ?auto_41575 ) ) ( not ( = ?auto_41573 ?auto_41576 ) ) ( not ( = ?auto_41574 ?auto_41575 ) ) ( not ( = ?auto_41574 ?auto_41576 ) ) ( not ( = ?auto_41575 ?auto_41576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41575 ?auto_41576 )
      ( !STACK ?auto_41575 ?auto_41574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41580 - BLOCK
      ?auto_41581 - BLOCK
      ?auto_41582 - BLOCK
    )
    :vars
    (
      ?auto_41583 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41581 ) ( ON ?auto_41582 ?auto_41583 ) ( CLEAR ?auto_41582 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41580 ) ( ON ?auto_41581 ?auto_41580 ) ( not ( = ?auto_41580 ?auto_41581 ) ) ( not ( = ?auto_41580 ?auto_41582 ) ) ( not ( = ?auto_41580 ?auto_41583 ) ) ( not ( = ?auto_41581 ?auto_41582 ) ) ( not ( = ?auto_41581 ?auto_41583 ) ) ( not ( = ?auto_41582 ?auto_41583 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41582 ?auto_41583 )
      ( !STACK ?auto_41582 ?auto_41581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41587 - BLOCK
      ?auto_41588 - BLOCK
      ?auto_41589 - BLOCK
    )
    :vars
    (
      ?auto_41590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41589 ?auto_41590 ) ( ON-TABLE ?auto_41587 ) ( not ( = ?auto_41587 ?auto_41588 ) ) ( not ( = ?auto_41587 ?auto_41589 ) ) ( not ( = ?auto_41587 ?auto_41590 ) ) ( not ( = ?auto_41588 ?auto_41589 ) ) ( not ( = ?auto_41588 ?auto_41590 ) ) ( not ( = ?auto_41589 ?auto_41590 ) ) ( CLEAR ?auto_41587 ) ( ON ?auto_41588 ?auto_41589 ) ( CLEAR ?auto_41588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41587 ?auto_41588 )
      ( MAKE-3PILE ?auto_41587 ?auto_41588 ?auto_41589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41594 - BLOCK
      ?auto_41595 - BLOCK
      ?auto_41596 - BLOCK
    )
    :vars
    (
      ?auto_41597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41596 ?auto_41597 ) ( ON-TABLE ?auto_41594 ) ( not ( = ?auto_41594 ?auto_41595 ) ) ( not ( = ?auto_41594 ?auto_41596 ) ) ( not ( = ?auto_41594 ?auto_41597 ) ) ( not ( = ?auto_41595 ?auto_41596 ) ) ( not ( = ?auto_41595 ?auto_41597 ) ) ( not ( = ?auto_41596 ?auto_41597 ) ) ( CLEAR ?auto_41594 ) ( ON ?auto_41595 ?auto_41596 ) ( CLEAR ?auto_41595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41594 ?auto_41595 )
      ( MAKE-3PILE ?auto_41594 ?auto_41595 ?auto_41596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41601 - BLOCK
      ?auto_41602 - BLOCK
      ?auto_41603 - BLOCK
    )
    :vars
    (
      ?auto_41604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41603 ?auto_41604 ) ( not ( = ?auto_41601 ?auto_41602 ) ) ( not ( = ?auto_41601 ?auto_41603 ) ) ( not ( = ?auto_41601 ?auto_41604 ) ) ( not ( = ?auto_41602 ?auto_41603 ) ) ( not ( = ?auto_41602 ?auto_41604 ) ) ( not ( = ?auto_41603 ?auto_41604 ) ) ( ON ?auto_41602 ?auto_41603 ) ( ON ?auto_41601 ?auto_41602 ) ( CLEAR ?auto_41601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41601 )
      ( MAKE-3PILE ?auto_41601 ?auto_41602 ?auto_41603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_41608 - BLOCK
      ?auto_41609 - BLOCK
      ?auto_41610 - BLOCK
    )
    :vars
    (
      ?auto_41611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41610 ?auto_41611 ) ( not ( = ?auto_41608 ?auto_41609 ) ) ( not ( = ?auto_41608 ?auto_41610 ) ) ( not ( = ?auto_41608 ?auto_41611 ) ) ( not ( = ?auto_41609 ?auto_41610 ) ) ( not ( = ?auto_41609 ?auto_41611 ) ) ( not ( = ?auto_41610 ?auto_41611 ) ) ( ON ?auto_41609 ?auto_41610 ) ( ON ?auto_41608 ?auto_41609 ) ( CLEAR ?auto_41608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41608 )
      ( MAKE-3PILE ?auto_41608 ?auto_41609 ?auto_41610 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41616 - BLOCK
      ?auto_41617 - BLOCK
      ?auto_41618 - BLOCK
      ?auto_41619 - BLOCK
    )
    :vars
    (
      ?auto_41620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41618 ) ( ON ?auto_41619 ?auto_41620 ) ( CLEAR ?auto_41619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41616 ) ( ON ?auto_41617 ?auto_41616 ) ( ON ?auto_41618 ?auto_41617 ) ( not ( = ?auto_41616 ?auto_41617 ) ) ( not ( = ?auto_41616 ?auto_41618 ) ) ( not ( = ?auto_41616 ?auto_41619 ) ) ( not ( = ?auto_41616 ?auto_41620 ) ) ( not ( = ?auto_41617 ?auto_41618 ) ) ( not ( = ?auto_41617 ?auto_41619 ) ) ( not ( = ?auto_41617 ?auto_41620 ) ) ( not ( = ?auto_41618 ?auto_41619 ) ) ( not ( = ?auto_41618 ?auto_41620 ) ) ( not ( = ?auto_41619 ?auto_41620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41619 ?auto_41620 )
      ( !STACK ?auto_41619 ?auto_41618 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41625 - BLOCK
      ?auto_41626 - BLOCK
      ?auto_41627 - BLOCK
      ?auto_41628 - BLOCK
    )
    :vars
    (
      ?auto_41629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41627 ) ( ON ?auto_41628 ?auto_41629 ) ( CLEAR ?auto_41628 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41625 ) ( ON ?auto_41626 ?auto_41625 ) ( ON ?auto_41627 ?auto_41626 ) ( not ( = ?auto_41625 ?auto_41626 ) ) ( not ( = ?auto_41625 ?auto_41627 ) ) ( not ( = ?auto_41625 ?auto_41628 ) ) ( not ( = ?auto_41625 ?auto_41629 ) ) ( not ( = ?auto_41626 ?auto_41627 ) ) ( not ( = ?auto_41626 ?auto_41628 ) ) ( not ( = ?auto_41626 ?auto_41629 ) ) ( not ( = ?auto_41627 ?auto_41628 ) ) ( not ( = ?auto_41627 ?auto_41629 ) ) ( not ( = ?auto_41628 ?auto_41629 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41628 ?auto_41629 )
      ( !STACK ?auto_41628 ?auto_41627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41634 - BLOCK
      ?auto_41635 - BLOCK
      ?auto_41636 - BLOCK
      ?auto_41637 - BLOCK
    )
    :vars
    (
      ?auto_41638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41637 ?auto_41638 ) ( ON-TABLE ?auto_41634 ) ( ON ?auto_41635 ?auto_41634 ) ( not ( = ?auto_41634 ?auto_41635 ) ) ( not ( = ?auto_41634 ?auto_41636 ) ) ( not ( = ?auto_41634 ?auto_41637 ) ) ( not ( = ?auto_41634 ?auto_41638 ) ) ( not ( = ?auto_41635 ?auto_41636 ) ) ( not ( = ?auto_41635 ?auto_41637 ) ) ( not ( = ?auto_41635 ?auto_41638 ) ) ( not ( = ?auto_41636 ?auto_41637 ) ) ( not ( = ?auto_41636 ?auto_41638 ) ) ( not ( = ?auto_41637 ?auto_41638 ) ) ( CLEAR ?auto_41635 ) ( ON ?auto_41636 ?auto_41637 ) ( CLEAR ?auto_41636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41634 ?auto_41635 ?auto_41636 )
      ( MAKE-4PILE ?auto_41634 ?auto_41635 ?auto_41636 ?auto_41637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41643 - BLOCK
      ?auto_41644 - BLOCK
      ?auto_41645 - BLOCK
      ?auto_41646 - BLOCK
    )
    :vars
    (
      ?auto_41647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41646 ?auto_41647 ) ( ON-TABLE ?auto_41643 ) ( ON ?auto_41644 ?auto_41643 ) ( not ( = ?auto_41643 ?auto_41644 ) ) ( not ( = ?auto_41643 ?auto_41645 ) ) ( not ( = ?auto_41643 ?auto_41646 ) ) ( not ( = ?auto_41643 ?auto_41647 ) ) ( not ( = ?auto_41644 ?auto_41645 ) ) ( not ( = ?auto_41644 ?auto_41646 ) ) ( not ( = ?auto_41644 ?auto_41647 ) ) ( not ( = ?auto_41645 ?auto_41646 ) ) ( not ( = ?auto_41645 ?auto_41647 ) ) ( not ( = ?auto_41646 ?auto_41647 ) ) ( CLEAR ?auto_41644 ) ( ON ?auto_41645 ?auto_41646 ) ( CLEAR ?auto_41645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41643 ?auto_41644 ?auto_41645 )
      ( MAKE-4PILE ?auto_41643 ?auto_41644 ?auto_41645 ?auto_41646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41652 - BLOCK
      ?auto_41653 - BLOCK
      ?auto_41654 - BLOCK
      ?auto_41655 - BLOCK
    )
    :vars
    (
      ?auto_41656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41655 ?auto_41656 ) ( ON-TABLE ?auto_41652 ) ( not ( = ?auto_41652 ?auto_41653 ) ) ( not ( = ?auto_41652 ?auto_41654 ) ) ( not ( = ?auto_41652 ?auto_41655 ) ) ( not ( = ?auto_41652 ?auto_41656 ) ) ( not ( = ?auto_41653 ?auto_41654 ) ) ( not ( = ?auto_41653 ?auto_41655 ) ) ( not ( = ?auto_41653 ?auto_41656 ) ) ( not ( = ?auto_41654 ?auto_41655 ) ) ( not ( = ?auto_41654 ?auto_41656 ) ) ( not ( = ?auto_41655 ?auto_41656 ) ) ( ON ?auto_41654 ?auto_41655 ) ( CLEAR ?auto_41652 ) ( ON ?auto_41653 ?auto_41654 ) ( CLEAR ?auto_41653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41652 ?auto_41653 )
      ( MAKE-4PILE ?auto_41652 ?auto_41653 ?auto_41654 ?auto_41655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41661 - BLOCK
      ?auto_41662 - BLOCK
      ?auto_41663 - BLOCK
      ?auto_41664 - BLOCK
    )
    :vars
    (
      ?auto_41665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41664 ?auto_41665 ) ( ON-TABLE ?auto_41661 ) ( not ( = ?auto_41661 ?auto_41662 ) ) ( not ( = ?auto_41661 ?auto_41663 ) ) ( not ( = ?auto_41661 ?auto_41664 ) ) ( not ( = ?auto_41661 ?auto_41665 ) ) ( not ( = ?auto_41662 ?auto_41663 ) ) ( not ( = ?auto_41662 ?auto_41664 ) ) ( not ( = ?auto_41662 ?auto_41665 ) ) ( not ( = ?auto_41663 ?auto_41664 ) ) ( not ( = ?auto_41663 ?auto_41665 ) ) ( not ( = ?auto_41664 ?auto_41665 ) ) ( ON ?auto_41663 ?auto_41664 ) ( CLEAR ?auto_41661 ) ( ON ?auto_41662 ?auto_41663 ) ( CLEAR ?auto_41662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41661 ?auto_41662 )
      ( MAKE-4PILE ?auto_41661 ?auto_41662 ?auto_41663 ?auto_41664 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41670 - BLOCK
      ?auto_41671 - BLOCK
      ?auto_41672 - BLOCK
      ?auto_41673 - BLOCK
    )
    :vars
    (
      ?auto_41674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41673 ?auto_41674 ) ( not ( = ?auto_41670 ?auto_41671 ) ) ( not ( = ?auto_41670 ?auto_41672 ) ) ( not ( = ?auto_41670 ?auto_41673 ) ) ( not ( = ?auto_41670 ?auto_41674 ) ) ( not ( = ?auto_41671 ?auto_41672 ) ) ( not ( = ?auto_41671 ?auto_41673 ) ) ( not ( = ?auto_41671 ?auto_41674 ) ) ( not ( = ?auto_41672 ?auto_41673 ) ) ( not ( = ?auto_41672 ?auto_41674 ) ) ( not ( = ?auto_41673 ?auto_41674 ) ) ( ON ?auto_41672 ?auto_41673 ) ( ON ?auto_41671 ?auto_41672 ) ( ON ?auto_41670 ?auto_41671 ) ( CLEAR ?auto_41670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41670 )
      ( MAKE-4PILE ?auto_41670 ?auto_41671 ?auto_41672 ?auto_41673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_41679 - BLOCK
      ?auto_41680 - BLOCK
      ?auto_41681 - BLOCK
      ?auto_41682 - BLOCK
    )
    :vars
    (
      ?auto_41683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41682 ?auto_41683 ) ( not ( = ?auto_41679 ?auto_41680 ) ) ( not ( = ?auto_41679 ?auto_41681 ) ) ( not ( = ?auto_41679 ?auto_41682 ) ) ( not ( = ?auto_41679 ?auto_41683 ) ) ( not ( = ?auto_41680 ?auto_41681 ) ) ( not ( = ?auto_41680 ?auto_41682 ) ) ( not ( = ?auto_41680 ?auto_41683 ) ) ( not ( = ?auto_41681 ?auto_41682 ) ) ( not ( = ?auto_41681 ?auto_41683 ) ) ( not ( = ?auto_41682 ?auto_41683 ) ) ( ON ?auto_41681 ?auto_41682 ) ( ON ?auto_41680 ?auto_41681 ) ( ON ?auto_41679 ?auto_41680 ) ( CLEAR ?auto_41679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41679 )
      ( MAKE-4PILE ?auto_41679 ?auto_41680 ?auto_41681 ?auto_41682 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41689 - BLOCK
      ?auto_41690 - BLOCK
      ?auto_41691 - BLOCK
      ?auto_41692 - BLOCK
      ?auto_41693 - BLOCK
    )
    :vars
    (
      ?auto_41694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41692 ) ( ON ?auto_41693 ?auto_41694 ) ( CLEAR ?auto_41693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41689 ) ( ON ?auto_41690 ?auto_41689 ) ( ON ?auto_41691 ?auto_41690 ) ( ON ?auto_41692 ?auto_41691 ) ( not ( = ?auto_41689 ?auto_41690 ) ) ( not ( = ?auto_41689 ?auto_41691 ) ) ( not ( = ?auto_41689 ?auto_41692 ) ) ( not ( = ?auto_41689 ?auto_41693 ) ) ( not ( = ?auto_41689 ?auto_41694 ) ) ( not ( = ?auto_41690 ?auto_41691 ) ) ( not ( = ?auto_41690 ?auto_41692 ) ) ( not ( = ?auto_41690 ?auto_41693 ) ) ( not ( = ?auto_41690 ?auto_41694 ) ) ( not ( = ?auto_41691 ?auto_41692 ) ) ( not ( = ?auto_41691 ?auto_41693 ) ) ( not ( = ?auto_41691 ?auto_41694 ) ) ( not ( = ?auto_41692 ?auto_41693 ) ) ( not ( = ?auto_41692 ?auto_41694 ) ) ( not ( = ?auto_41693 ?auto_41694 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41693 ?auto_41694 )
      ( !STACK ?auto_41693 ?auto_41692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41700 - BLOCK
      ?auto_41701 - BLOCK
      ?auto_41702 - BLOCK
      ?auto_41703 - BLOCK
      ?auto_41704 - BLOCK
    )
    :vars
    (
      ?auto_41705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41703 ) ( ON ?auto_41704 ?auto_41705 ) ( CLEAR ?auto_41704 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41700 ) ( ON ?auto_41701 ?auto_41700 ) ( ON ?auto_41702 ?auto_41701 ) ( ON ?auto_41703 ?auto_41702 ) ( not ( = ?auto_41700 ?auto_41701 ) ) ( not ( = ?auto_41700 ?auto_41702 ) ) ( not ( = ?auto_41700 ?auto_41703 ) ) ( not ( = ?auto_41700 ?auto_41704 ) ) ( not ( = ?auto_41700 ?auto_41705 ) ) ( not ( = ?auto_41701 ?auto_41702 ) ) ( not ( = ?auto_41701 ?auto_41703 ) ) ( not ( = ?auto_41701 ?auto_41704 ) ) ( not ( = ?auto_41701 ?auto_41705 ) ) ( not ( = ?auto_41702 ?auto_41703 ) ) ( not ( = ?auto_41702 ?auto_41704 ) ) ( not ( = ?auto_41702 ?auto_41705 ) ) ( not ( = ?auto_41703 ?auto_41704 ) ) ( not ( = ?auto_41703 ?auto_41705 ) ) ( not ( = ?auto_41704 ?auto_41705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41704 ?auto_41705 )
      ( !STACK ?auto_41704 ?auto_41703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41711 - BLOCK
      ?auto_41712 - BLOCK
      ?auto_41713 - BLOCK
      ?auto_41714 - BLOCK
      ?auto_41715 - BLOCK
    )
    :vars
    (
      ?auto_41716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41715 ?auto_41716 ) ( ON-TABLE ?auto_41711 ) ( ON ?auto_41712 ?auto_41711 ) ( ON ?auto_41713 ?auto_41712 ) ( not ( = ?auto_41711 ?auto_41712 ) ) ( not ( = ?auto_41711 ?auto_41713 ) ) ( not ( = ?auto_41711 ?auto_41714 ) ) ( not ( = ?auto_41711 ?auto_41715 ) ) ( not ( = ?auto_41711 ?auto_41716 ) ) ( not ( = ?auto_41712 ?auto_41713 ) ) ( not ( = ?auto_41712 ?auto_41714 ) ) ( not ( = ?auto_41712 ?auto_41715 ) ) ( not ( = ?auto_41712 ?auto_41716 ) ) ( not ( = ?auto_41713 ?auto_41714 ) ) ( not ( = ?auto_41713 ?auto_41715 ) ) ( not ( = ?auto_41713 ?auto_41716 ) ) ( not ( = ?auto_41714 ?auto_41715 ) ) ( not ( = ?auto_41714 ?auto_41716 ) ) ( not ( = ?auto_41715 ?auto_41716 ) ) ( CLEAR ?auto_41713 ) ( ON ?auto_41714 ?auto_41715 ) ( CLEAR ?auto_41714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41711 ?auto_41712 ?auto_41713 ?auto_41714 )
      ( MAKE-5PILE ?auto_41711 ?auto_41712 ?auto_41713 ?auto_41714 ?auto_41715 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41722 - BLOCK
      ?auto_41723 - BLOCK
      ?auto_41724 - BLOCK
      ?auto_41725 - BLOCK
      ?auto_41726 - BLOCK
    )
    :vars
    (
      ?auto_41727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41726 ?auto_41727 ) ( ON-TABLE ?auto_41722 ) ( ON ?auto_41723 ?auto_41722 ) ( ON ?auto_41724 ?auto_41723 ) ( not ( = ?auto_41722 ?auto_41723 ) ) ( not ( = ?auto_41722 ?auto_41724 ) ) ( not ( = ?auto_41722 ?auto_41725 ) ) ( not ( = ?auto_41722 ?auto_41726 ) ) ( not ( = ?auto_41722 ?auto_41727 ) ) ( not ( = ?auto_41723 ?auto_41724 ) ) ( not ( = ?auto_41723 ?auto_41725 ) ) ( not ( = ?auto_41723 ?auto_41726 ) ) ( not ( = ?auto_41723 ?auto_41727 ) ) ( not ( = ?auto_41724 ?auto_41725 ) ) ( not ( = ?auto_41724 ?auto_41726 ) ) ( not ( = ?auto_41724 ?auto_41727 ) ) ( not ( = ?auto_41725 ?auto_41726 ) ) ( not ( = ?auto_41725 ?auto_41727 ) ) ( not ( = ?auto_41726 ?auto_41727 ) ) ( CLEAR ?auto_41724 ) ( ON ?auto_41725 ?auto_41726 ) ( CLEAR ?auto_41725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41722 ?auto_41723 ?auto_41724 ?auto_41725 )
      ( MAKE-5PILE ?auto_41722 ?auto_41723 ?auto_41724 ?auto_41725 ?auto_41726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41733 - BLOCK
      ?auto_41734 - BLOCK
      ?auto_41735 - BLOCK
      ?auto_41736 - BLOCK
      ?auto_41737 - BLOCK
    )
    :vars
    (
      ?auto_41738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41737 ?auto_41738 ) ( ON-TABLE ?auto_41733 ) ( ON ?auto_41734 ?auto_41733 ) ( not ( = ?auto_41733 ?auto_41734 ) ) ( not ( = ?auto_41733 ?auto_41735 ) ) ( not ( = ?auto_41733 ?auto_41736 ) ) ( not ( = ?auto_41733 ?auto_41737 ) ) ( not ( = ?auto_41733 ?auto_41738 ) ) ( not ( = ?auto_41734 ?auto_41735 ) ) ( not ( = ?auto_41734 ?auto_41736 ) ) ( not ( = ?auto_41734 ?auto_41737 ) ) ( not ( = ?auto_41734 ?auto_41738 ) ) ( not ( = ?auto_41735 ?auto_41736 ) ) ( not ( = ?auto_41735 ?auto_41737 ) ) ( not ( = ?auto_41735 ?auto_41738 ) ) ( not ( = ?auto_41736 ?auto_41737 ) ) ( not ( = ?auto_41736 ?auto_41738 ) ) ( not ( = ?auto_41737 ?auto_41738 ) ) ( ON ?auto_41736 ?auto_41737 ) ( CLEAR ?auto_41734 ) ( ON ?auto_41735 ?auto_41736 ) ( CLEAR ?auto_41735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41733 ?auto_41734 ?auto_41735 )
      ( MAKE-5PILE ?auto_41733 ?auto_41734 ?auto_41735 ?auto_41736 ?auto_41737 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41744 - BLOCK
      ?auto_41745 - BLOCK
      ?auto_41746 - BLOCK
      ?auto_41747 - BLOCK
      ?auto_41748 - BLOCK
    )
    :vars
    (
      ?auto_41749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41748 ?auto_41749 ) ( ON-TABLE ?auto_41744 ) ( ON ?auto_41745 ?auto_41744 ) ( not ( = ?auto_41744 ?auto_41745 ) ) ( not ( = ?auto_41744 ?auto_41746 ) ) ( not ( = ?auto_41744 ?auto_41747 ) ) ( not ( = ?auto_41744 ?auto_41748 ) ) ( not ( = ?auto_41744 ?auto_41749 ) ) ( not ( = ?auto_41745 ?auto_41746 ) ) ( not ( = ?auto_41745 ?auto_41747 ) ) ( not ( = ?auto_41745 ?auto_41748 ) ) ( not ( = ?auto_41745 ?auto_41749 ) ) ( not ( = ?auto_41746 ?auto_41747 ) ) ( not ( = ?auto_41746 ?auto_41748 ) ) ( not ( = ?auto_41746 ?auto_41749 ) ) ( not ( = ?auto_41747 ?auto_41748 ) ) ( not ( = ?auto_41747 ?auto_41749 ) ) ( not ( = ?auto_41748 ?auto_41749 ) ) ( ON ?auto_41747 ?auto_41748 ) ( CLEAR ?auto_41745 ) ( ON ?auto_41746 ?auto_41747 ) ( CLEAR ?auto_41746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41744 ?auto_41745 ?auto_41746 )
      ( MAKE-5PILE ?auto_41744 ?auto_41745 ?auto_41746 ?auto_41747 ?auto_41748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41755 - BLOCK
      ?auto_41756 - BLOCK
      ?auto_41757 - BLOCK
      ?auto_41758 - BLOCK
      ?auto_41759 - BLOCK
    )
    :vars
    (
      ?auto_41760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41759 ?auto_41760 ) ( ON-TABLE ?auto_41755 ) ( not ( = ?auto_41755 ?auto_41756 ) ) ( not ( = ?auto_41755 ?auto_41757 ) ) ( not ( = ?auto_41755 ?auto_41758 ) ) ( not ( = ?auto_41755 ?auto_41759 ) ) ( not ( = ?auto_41755 ?auto_41760 ) ) ( not ( = ?auto_41756 ?auto_41757 ) ) ( not ( = ?auto_41756 ?auto_41758 ) ) ( not ( = ?auto_41756 ?auto_41759 ) ) ( not ( = ?auto_41756 ?auto_41760 ) ) ( not ( = ?auto_41757 ?auto_41758 ) ) ( not ( = ?auto_41757 ?auto_41759 ) ) ( not ( = ?auto_41757 ?auto_41760 ) ) ( not ( = ?auto_41758 ?auto_41759 ) ) ( not ( = ?auto_41758 ?auto_41760 ) ) ( not ( = ?auto_41759 ?auto_41760 ) ) ( ON ?auto_41758 ?auto_41759 ) ( ON ?auto_41757 ?auto_41758 ) ( CLEAR ?auto_41755 ) ( ON ?auto_41756 ?auto_41757 ) ( CLEAR ?auto_41756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41755 ?auto_41756 )
      ( MAKE-5PILE ?auto_41755 ?auto_41756 ?auto_41757 ?auto_41758 ?auto_41759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41766 - BLOCK
      ?auto_41767 - BLOCK
      ?auto_41768 - BLOCK
      ?auto_41769 - BLOCK
      ?auto_41770 - BLOCK
    )
    :vars
    (
      ?auto_41771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41770 ?auto_41771 ) ( ON-TABLE ?auto_41766 ) ( not ( = ?auto_41766 ?auto_41767 ) ) ( not ( = ?auto_41766 ?auto_41768 ) ) ( not ( = ?auto_41766 ?auto_41769 ) ) ( not ( = ?auto_41766 ?auto_41770 ) ) ( not ( = ?auto_41766 ?auto_41771 ) ) ( not ( = ?auto_41767 ?auto_41768 ) ) ( not ( = ?auto_41767 ?auto_41769 ) ) ( not ( = ?auto_41767 ?auto_41770 ) ) ( not ( = ?auto_41767 ?auto_41771 ) ) ( not ( = ?auto_41768 ?auto_41769 ) ) ( not ( = ?auto_41768 ?auto_41770 ) ) ( not ( = ?auto_41768 ?auto_41771 ) ) ( not ( = ?auto_41769 ?auto_41770 ) ) ( not ( = ?auto_41769 ?auto_41771 ) ) ( not ( = ?auto_41770 ?auto_41771 ) ) ( ON ?auto_41769 ?auto_41770 ) ( ON ?auto_41768 ?auto_41769 ) ( CLEAR ?auto_41766 ) ( ON ?auto_41767 ?auto_41768 ) ( CLEAR ?auto_41767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41766 ?auto_41767 )
      ( MAKE-5PILE ?auto_41766 ?auto_41767 ?auto_41768 ?auto_41769 ?auto_41770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41777 - BLOCK
      ?auto_41778 - BLOCK
      ?auto_41779 - BLOCK
      ?auto_41780 - BLOCK
      ?auto_41781 - BLOCK
    )
    :vars
    (
      ?auto_41782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41781 ?auto_41782 ) ( not ( = ?auto_41777 ?auto_41778 ) ) ( not ( = ?auto_41777 ?auto_41779 ) ) ( not ( = ?auto_41777 ?auto_41780 ) ) ( not ( = ?auto_41777 ?auto_41781 ) ) ( not ( = ?auto_41777 ?auto_41782 ) ) ( not ( = ?auto_41778 ?auto_41779 ) ) ( not ( = ?auto_41778 ?auto_41780 ) ) ( not ( = ?auto_41778 ?auto_41781 ) ) ( not ( = ?auto_41778 ?auto_41782 ) ) ( not ( = ?auto_41779 ?auto_41780 ) ) ( not ( = ?auto_41779 ?auto_41781 ) ) ( not ( = ?auto_41779 ?auto_41782 ) ) ( not ( = ?auto_41780 ?auto_41781 ) ) ( not ( = ?auto_41780 ?auto_41782 ) ) ( not ( = ?auto_41781 ?auto_41782 ) ) ( ON ?auto_41780 ?auto_41781 ) ( ON ?auto_41779 ?auto_41780 ) ( ON ?auto_41778 ?auto_41779 ) ( ON ?auto_41777 ?auto_41778 ) ( CLEAR ?auto_41777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41777 )
      ( MAKE-5PILE ?auto_41777 ?auto_41778 ?auto_41779 ?auto_41780 ?auto_41781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_41788 - BLOCK
      ?auto_41789 - BLOCK
      ?auto_41790 - BLOCK
      ?auto_41791 - BLOCK
      ?auto_41792 - BLOCK
    )
    :vars
    (
      ?auto_41793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41792 ?auto_41793 ) ( not ( = ?auto_41788 ?auto_41789 ) ) ( not ( = ?auto_41788 ?auto_41790 ) ) ( not ( = ?auto_41788 ?auto_41791 ) ) ( not ( = ?auto_41788 ?auto_41792 ) ) ( not ( = ?auto_41788 ?auto_41793 ) ) ( not ( = ?auto_41789 ?auto_41790 ) ) ( not ( = ?auto_41789 ?auto_41791 ) ) ( not ( = ?auto_41789 ?auto_41792 ) ) ( not ( = ?auto_41789 ?auto_41793 ) ) ( not ( = ?auto_41790 ?auto_41791 ) ) ( not ( = ?auto_41790 ?auto_41792 ) ) ( not ( = ?auto_41790 ?auto_41793 ) ) ( not ( = ?auto_41791 ?auto_41792 ) ) ( not ( = ?auto_41791 ?auto_41793 ) ) ( not ( = ?auto_41792 ?auto_41793 ) ) ( ON ?auto_41791 ?auto_41792 ) ( ON ?auto_41790 ?auto_41791 ) ( ON ?auto_41789 ?auto_41790 ) ( ON ?auto_41788 ?auto_41789 ) ( CLEAR ?auto_41788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41788 )
      ( MAKE-5PILE ?auto_41788 ?auto_41789 ?auto_41790 ?auto_41791 ?auto_41792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41800 - BLOCK
      ?auto_41801 - BLOCK
      ?auto_41802 - BLOCK
      ?auto_41803 - BLOCK
      ?auto_41804 - BLOCK
      ?auto_41805 - BLOCK
    )
    :vars
    (
      ?auto_41806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41804 ) ( ON ?auto_41805 ?auto_41806 ) ( CLEAR ?auto_41805 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41800 ) ( ON ?auto_41801 ?auto_41800 ) ( ON ?auto_41802 ?auto_41801 ) ( ON ?auto_41803 ?auto_41802 ) ( ON ?auto_41804 ?auto_41803 ) ( not ( = ?auto_41800 ?auto_41801 ) ) ( not ( = ?auto_41800 ?auto_41802 ) ) ( not ( = ?auto_41800 ?auto_41803 ) ) ( not ( = ?auto_41800 ?auto_41804 ) ) ( not ( = ?auto_41800 ?auto_41805 ) ) ( not ( = ?auto_41800 ?auto_41806 ) ) ( not ( = ?auto_41801 ?auto_41802 ) ) ( not ( = ?auto_41801 ?auto_41803 ) ) ( not ( = ?auto_41801 ?auto_41804 ) ) ( not ( = ?auto_41801 ?auto_41805 ) ) ( not ( = ?auto_41801 ?auto_41806 ) ) ( not ( = ?auto_41802 ?auto_41803 ) ) ( not ( = ?auto_41802 ?auto_41804 ) ) ( not ( = ?auto_41802 ?auto_41805 ) ) ( not ( = ?auto_41802 ?auto_41806 ) ) ( not ( = ?auto_41803 ?auto_41804 ) ) ( not ( = ?auto_41803 ?auto_41805 ) ) ( not ( = ?auto_41803 ?auto_41806 ) ) ( not ( = ?auto_41804 ?auto_41805 ) ) ( not ( = ?auto_41804 ?auto_41806 ) ) ( not ( = ?auto_41805 ?auto_41806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41805 ?auto_41806 )
      ( !STACK ?auto_41805 ?auto_41804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41813 - BLOCK
      ?auto_41814 - BLOCK
      ?auto_41815 - BLOCK
      ?auto_41816 - BLOCK
      ?auto_41817 - BLOCK
      ?auto_41818 - BLOCK
    )
    :vars
    (
      ?auto_41819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41817 ) ( ON ?auto_41818 ?auto_41819 ) ( CLEAR ?auto_41818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41813 ) ( ON ?auto_41814 ?auto_41813 ) ( ON ?auto_41815 ?auto_41814 ) ( ON ?auto_41816 ?auto_41815 ) ( ON ?auto_41817 ?auto_41816 ) ( not ( = ?auto_41813 ?auto_41814 ) ) ( not ( = ?auto_41813 ?auto_41815 ) ) ( not ( = ?auto_41813 ?auto_41816 ) ) ( not ( = ?auto_41813 ?auto_41817 ) ) ( not ( = ?auto_41813 ?auto_41818 ) ) ( not ( = ?auto_41813 ?auto_41819 ) ) ( not ( = ?auto_41814 ?auto_41815 ) ) ( not ( = ?auto_41814 ?auto_41816 ) ) ( not ( = ?auto_41814 ?auto_41817 ) ) ( not ( = ?auto_41814 ?auto_41818 ) ) ( not ( = ?auto_41814 ?auto_41819 ) ) ( not ( = ?auto_41815 ?auto_41816 ) ) ( not ( = ?auto_41815 ?auto_41817 ) ) ( not ( = ?auto_41815 ?auto_41818 ) ) ( not ( = ?auto_41815 ?auto_41819 ) ) ( not ( = ?auto_41816 ?auto_41817 ) ) ( not ( = ?auto_41816 ?auto_41818 ) ) ( not ( = ?auto_41816 ?auto_41819 ) ) ( not ( = ?auto_41817 ?auto_41818 ) ) ( not ( = ?auto_41817 ?auto_41819 ) ) ( not ( = ?auto_41818 ?auto_41819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41818 ?auto_41819 )
      ( !STACK ?auto_41818 ?auto_41817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41826 - BLOCK
      ?auto_41827 - BLOCK
      ?auto_41828 - BLOCK
      ?auto_41829 - BLOCK
      ?auto_41830 - BLOCK
      ?auto_41831 - BLOCK
    )
    :vars
    (
      ?auto_41832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41831 ?auto_41832 ) ( ON-TABLE ?auto_41826 ) ( ON ?auto_41827 ?auto_41826 ) ( ON ?auto_41828 ?auto_41827 ) ( ON ?auto_41829 ?auto_41828 ) ( not ( = ?auto_41826 ?auto_41827 ) ) ( not ( = ?auto_41826 ?auto_41828 ) ) ( not ( = ?auto_41826 ?auto_41829 ) ) ( not ( = ?auto_41826 ?auto_41830 ) ) ( not ( = ?auto_41826 ?auto_41831 ) ) ( not ( = ?auto_41826 ?auto_41832 ) ) ( not ( = ?auto_41827 ?auto_41828 ) ) ( not ( = ?auto_41827 ?auto_41829 ) ) ( not ( = ?auto_41827 ?auto_41830 ) ) ( not ( = ?auto_41827 ?auto_41831 ) ) ( not ( = ?auto_41827 ?auto_41832 ) ) ( not ( = ?auto_41828 ?auto_41829 ) ) ( not ( = ?auto_41828 ?auto_41830 ) ) ( not ( = ?auto_41828 ?auto_41831 ) ) ( not ( = ?auto_41828 ?auto_41832 ) ) ( not ( = ?auto_41829 ?auto_41830 ) ) ( not ( = ?auto_41829 ?auto_41831 ) ) ( not ( = ?auto_41829 ?auto_41832 ) ) ( not ( = ?auto_41830 ?auto_41831 ) ) ( not ( = ?auto_41830 ?auto_41832 ) ) ( not ( = ?auto_41831 ?auto_41832 ) ) ( CLEAR ?auto_41829 ) ( ON ?auto_41830 ?auto_41831 ) ( CLEAR ?auto_41830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41826 ?auto_41827 ?auto_41828 ?auto_41829 ?auto_41830 )
      ( MAKE-6PILE ?auto_41826 ?auto_41827 ?auto_41828 ?auto_41829 ?auto_41830 ?auto_41831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41839 - BLOCK
      ?auto_41840 - BLOCK
      ?auto_41841 - BLOCK
      ?auto_41842 - BLOCK
      ?auto_41843 - BLOCK
      ?auto_41844 - BLOCK
    )
    :vars
    (
      ?auto_41845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41844 ?auto_41845 ) ( ON-TABLE ?auto_41839 ) ( ON ?auto_41840 ?auto_41839 ) ( ON ?auto_41841 ?auto_41840 ) ( ON ?auto_41842 ?auto_41841 ) ( not ( = ?auto_41839 ?auto_41840 ) ) ( not ( = ?auto_41839 ?auto_41841 ) ) ( not ( = ?auto_41839 ?auto_41842 ) ) ( not ( = ?auto_41839 ?auto_41843 ) ) ( not ( = ?auto_41839 ?auto_41844 ) ) ( not ( = ?auto_41839 ?auto_41845 ) ) ( not ( = ?auto_41840 ?auto_41841 ) ) ( not ( = ?auto_41840 ?auto_41842 ) ) ( not ( = ?auto_41840 ?auto_41843 ) ) ( not ( = ?auto_41840 ?auto_41844 ) ) ( not ( = ?auto_41840 ?auto_41845 ) ) ( not ( = ?auto_41841 ?auto_41842 ) ) ( not ( = ?auto_41841 ?auto_41843 ) ) ( not ( = ?auto_41841 ?auto_41844 ) ) ( not ( = ?auto_41841 ?auto_41845 ) ) ( not ( = ?auto_41842 ?auto_41843 ) ) ( not ( = ?auto_41842 ?auto_41844 ) ) ( not ( = ?auto_41842 ?auto_41845 ) ) ( not ( = ?auto_41843 ?auto_41844 ) ) ( not ( = ?auto_41843 ?auto_41845 ) ) ( not ( = ?auto_41844 ?auto_41845 ) ) ( CLEAR ?auto_41842 ) ( ON ?auto_41843 ?auto_41844 ) ( CLEAR ?auto_41843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_41839 ?auto_41840 ?auto_41841 ?auto_41842 ?auto_41843 )
      ( MAKE-6PILE ?auto_41839 ?auto_41840 ?auto_41841 ?auto_41842 ?auto_41843 ?auto_41844 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41852 - BLOCK
      ?auto_41853 - BLOCK
      ?auto_41854 - BLOCK
      ?auto_41855 - BLOCK
      ?auto_41856 - BLOCK
      ?auto_41857 - BLOCK
    )
    :vars
    (
      ?auto_41858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41857 ?auto_41858 ) ( ON-TABLE ?auto_41852 ) ( ON ?auto_41853 ?auto_41852 ) ( ON ?auto_41854 ?auto_41853 ) ( not ( = ?auto_41852 ?auto_41853 ) ) ( not ( = ?auto_41852 ?auto_41854 ) ) ( not ( = ?auto_41852 ?auto_41855 ) ) ( not ( = ?auto_41852 ?auto_41856 ) ) ( not ( = ?auto_41852 ?auto_41857 ) ) ( not ( = ?auto_41852 ?auto_41858 ) ) ( not ( = ?auto_41853 ?auto_41854 ) ) ( not ( = ?auto_41853 ?auto_41855 ) ) ( not ( = ?auto_41853 ?auto_41856 ) ) ( not ( = ?auto_41853 ?auto_41857 ) ) ( not ( = ?auto_41853 ?auto_41858 ) ) ( not ( = ?auto_41854 ?auto_41855 ) ) ( not ( = ?auto_41854 ?auto_41856 ) ) ( not ( = ?auto_41854 ?auto_41857 ) ) ( not ( = ?auto_41854 ?auto_41858 ) ) ( not ( = ?auto_41855 ?auto_41856 ) ) ( not ( = ?auto_41855 ?auto_41857 ) ) ( not ( = ?auto_41855 ?auto_41858 ) ) ( not ( = ?auto_41856 ?auto_41857 ) ) ( not ( = ?auto_41856 ?auto_41858 ) ) ( not ( = ?auto_41857 ?auto_41858 ) ) ( ON ?auto_41856 ?auto_41857 ) ( CLEAR ?auto_41854 ) ( ON ?auto_41855 ?auto_41856 ) ( CLEAR ?auto_41855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41852 ?auto_41853 ?auto_41854 ?auto_41855 )
      ( MAKE-6PILE ?auto_41852 ?auto_41853 ?auto_41854 ?auto_41855 ?auto_41856 ?auto_41857 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41865 - BLOCK
      ?auto_41866 - BLOCK
      ?auto_41867 - BLOCK
      ?auto_41868 - BLOCK
      ?auto_41869 - BLOCK
      ?auto_41870 - BLOCK
    )
    :vars
    (
      ?auto_41871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41870 ?auto_41871 ) ( ON-TABLE ?auto_41865 ) ( ON ?auto_41866 ?auto_41865 ) ( ON ?auto_41867 ?auto_41866 ) ( not ( = ?auto_41865 ?auto_41866 ) ) ( not ( = ?auto_41865 ?auto_41867 ) ) ( not ( = ?auto_41865 ?auto_41868 ) ) ( not ( = ?auto_41865 ?auto_41869 ) ) ( not ( = ?auto_41865 ?auto_41870 ) ) ( not ( = ?auto_41865 ?auto_41871 ) ) ( not ( = ?auto_41866 ?auto_41867 ) ) ( not ( = ?auto_41866 ?auto_41868 ) ) ( not ( = ?auto_41866 ?auto_41869 ) ) ( not ( = ?auto_41866 ?auto_41870 ) ) ( not ( = ?auto_41866 ?auto_41871 ) ) ( not ( = ?auto_41867 ?auto_41868 ) ) ( not ( = ?auto_41867 ?auto_41869 ) ) ( not ( = ?auto_41867 ?auto_41870 ) ) ( not ( = ?auto_41867 ?auto_41871 ) ) ( not ( = ?auto_41868 ?auto_41869 ) ) ( not ( = ?auto_41868 ?auto_41870 ) ) ( not ( = ?auto_41868 ?auto_41871 ) ) ( not ( = ?auto_41869 ?auto_41870 ) ) ( not ( = ?auto_41869 ?auto_41871 ) ) ( not ( = ?auto_41870 ?auto_41871 ) ) ( ON ?auto_41869 ?auto_41870 ) ( CLEAR ?auto_41867 ) ( ON ?auto_41868 ?auto_41869 ) ( CLEAR ?auto_41868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_41865 ?auto_41866 ?auto_41867 ?auto_41868 )
      ( MAKE-6PILE ?auto_41865 ?auto_41866 ?auto_41867 ?auto_41868 ?auto_41869 ?auto_41870 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41878 - BLOCK
      ?auto_41879 - BLOCK
      ?auto_41880 - BLOCK
      ?auto_41881 - BLOCK
      ?auto_41882 - BLOCK
      ?auto_41883 - BLOCK
    )
    :vars
    (
      ?auto_41884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41883 ?auto_41884 ) ( ON-TABLE ?auto_41878 ) ( ON ?auto_41879 ?auto_41878 ) ( not ( = ?auto_41878 ?auto_41879 ) ) ( not ( = ?auto_41878 ?auto_41880 ) ) ( not ( = ?auto_41878 ?auto_41881 ) ) ( not ( = ?auto_41878 ?auto_41882 ) ) ( not ( = ?auto_41878 ?auto_41883 ) ) ( not ( = ?auto_41878 ?auto_41884 ) ) ( not ( = ?auto_41879 ?auto_41880 ) ) ( not ( = ?auto_41879 ?auto_41881 ) ) ( not ( = ?auto_41879 ?auto_41882 ) ) ( not ( = ?auto_41879 ?auto_41883 ) ) ( not ( = ?auto_41879 ?auto_41884 ) ) ( not ( = ?auto_41880 ?auto_41881 ) ) ( not ( = ?auto_41880 ?auto_41882 ) ) ( not ( = ?auto_41880 ?auto_41883 ) ) ( not ( = ?auto_41880 ?auto_41884 ) ) ( not ( = ?auto_41881 ?auto_41882 ) ) ( not ( = ?auto_41881 ?auto_41883 ) ) ( not ( = ?auto_41881 ?auto_41884 ) ) ( not ( = ?auto_41882 ?auto_41883 ) ) ( not ( = ?auto_41882 ?auto_41884 ) ) ( not ( = ?auto_41883 ?auto_41884 ) ) ( ON ?auto_41882 ?auto_41883 ) ( ON ?auto_41881 ?auto_41882 ) ( CLEAR ?auto_41879 ) ( ON ?auto_41880 ?auto_41881 ) ( CLEAR ?auto_41880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41878 ?auto_41879 ?auto_41880 )
      ( MAKE-6PILE ?auto_41878 ?auto_41879 ?auto_41880 ?auto_41881 ?auto_41882 ?auto_41883 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41891 - BLOCK
      ?auto_41892 - BLOCK
      ?auto_41893 - BLOCK
      ?auto_41894 - BLOCK
      ?auto_41895 - BLOCK
      ?auto_41896 - BLOCK
    )
    :vars
    (
      ?auto_41897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41896 ?auto_41897 ) ( ON-TABLE ?auto_41891 ) ( ON ?auto_41892 ?auto_41891 ) ( not ( = ?auto_41891 ?auto_41892 ) ) ( not ( = ?auto_41891 ?auto_41893 ) ) ( not ( = ?auto_41891 ?auto_41894 ) ) ( not ( = ?auto_41891 ?auto_41895 ) ) ( not ( = ?auto_41891 ?auto_41896 ) ) ( not ( = ?auto_41891 ?auto_41897 ) ) ( not ( = ?auto_41892 ?auto_41893 ) ) ( not ( = ?auto_41892 ?auto_41894 ) ) ( not ( = ?auto_41892 ?auto_41895 ) ) ( not ( = ?auto_41892 ?auto_41896 ) ) ( not ( = ?auto_41892 ?auto_41897 ) ) ( not ( = ?auto_41893 ?auto_41894 ) ) ( not ( = ?auto_41893 ?auto_41895 ) ) ( not ( = ?auto_41893 ?auto_41896 ) ) ( not ( = ?auto_41893 ?auto_41897 ) ) ( not ( = ?auto_41894 ?auto_41895 ) ) ( not ( = ?auto_41894 ?auto_41896 ) ) ( not ( = ?auto_41894 ?auto_41897 ) ) ( not ( = ?auto_41895 ?auto_41896 ) ) ( not ( = ?auto_41895 ?auto_41897 ) ) ( not ( = ?auto_41896 ?auto_41897 ) ) ( ON ?auto_41895 ?auto_41896 ) ( ON ?auto_41894 ?auto_41895 ) ( CLEAR ?auto_41892 ) ( ON ?auto_41893 ?auto_41894 ) ( CLEAR ?auto_41893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_41891 ?auto_41892 ?auto_41893 )
      ( MAKE-6PILE ?auto_41891 ?auto_41892 ?auto_41893 ?auto_41894 ?auto_41895 ?auto_41896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41904 - BLOCK
      ?auto_41905 - BLOCK
      ?auto_41906 - BLOCK
      ?auto_41907 - BLOCK
      ?auto_41908 - BLOCK
      ?auto_41909 - BLOCK
    )
    :vars
    (
      ?auto_41910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41909 ?auto_41910 ) ( ON-TABLE ?auto_41904 ) ( not ( = ?auto_41904 ?auto_41905 ) ) ( not ( = ?auto_41904 ?auto_41906 ) ) ( not ( = ?auto_41904 ?auto_41907 ) ) ( not ( = ?auto_41904 ?auto_41908 ) ) ( not ( = ?auto_41904 ?auto_41909 ) ) ( not ( = ?auto_41904 ?auto_41910 ) ) ( not ( = ?auto_41905 ?auto_41906 ) ) ( not ( = ?auto_41905 ?auto_41907 ) ) ( not ( = ?auto_41905 ?auto_41908 ) ) ( not ( = ?auto_41905 ?auto_41909 ) ) ( not ( = ?auto_41905 ?auto_41910 ) ) ( not ( = ?auto_41906 ?auto_41907 ) ) ( not ( = ?auto_41906 ?auto_41908 ) ) ( not ( = ?auto_41906 ?auto_41909 ) ) ( not ( = ?auto_41906 ?auto_41910 ) ) ( not ( = ?auto_41907 ?auto_41908 ) ) ( not ( = ?auto_41907 ?auto_41909 ) ) ( not ( = ?auto_41907 ?auto_41910 ) ) ( not ( = ?auto_41908 ?auto_41909 ) ) ( not ( = ?auto_41908 ?auto_41910 ) ) ( not ( = ?auto_41909 ?auto_41910 ) ) ( ON ?auto_41908 ?auto_41909 ) ( ON ?auto_41907 ?auto_41908 ) ( ON ?auto_41906 ?auto_41907 ) ( CLEAR ?auto_41904 ) ( ON ?auto_41905 ?auto_41906 ) ( CLEAR ?auto_41905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41904 ?auto_41905 )
      ( MAKE-6PILE ?auto_41904 ?auto_41905 ?auto_41906 ?auto_41907 ?auto_41908 ?auto_41909 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41917 - BLOCK
      ?auto_41918 - BLOCK
      ?auto_41919 - BLOCK
      ?auto_41920 - BLOCK
      ?auto_41921 - BLOCK
      ?auto_41922 - BLOCK
    )
    :vars
    (
      ?auto_41923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41922 ?auto_41923 ) ( ON-TABLE ?auto_41917 ) ( not ( = ?auto_41917 ?auto_41918 ) ) ( not ( = ?auto_41917 ?auto_41919 ) ) ( not ( = ?auto_41917 ?auto_41920 ) ) ( not ( = ?auto_41917 ?auto_41921 ) ) ( not ( = ?auto_41917 ?auto_41922 ) ) ( not ( = ?auto_41917 ?auto_41923 ) ) ( not ( = ?auto_41918 ?auto_41919 ) ) ( not ( = ?auto_41918 ?auto_41920 ) ) ( not ( = ?auto_41918 ?auto_41921 ) ) ( not ( = ?auto_41918 ?auto_41922 ) ) ( not ( = ?auto_41918 ?auto_41923 ) ) ( not ( = ?auto_41919 ?auto_41920 ) ) ( not ( = ?auto_41919 ?auto_41921 ) ) ( not ( = ?auto_41919 ?auto_41922 ) ) ( not ( = ?auto_41919 ?auto_41923 ) ) ( not ( = ?auto_41920 ?auto_41921 ) ) ( not ( = ?auto_41920 ?auto_41922 ) ) ( not ( = ?auto_41920 ?auto_41923 ) ) ( not ( = ?auto_41921 ?auto_41922 ) ) ( not ( = ?auto_41921 ?auto_41923 ) ) ( not ( = ?auto_41922 ?auto_41923 ) ) ( ON ?auto_41921 ?auto_41922 ) ( ON ?auto_41920 ?auto_41921 ) ( ON ?auto_41919 ?auto_41920 ) ( CLEAR ?auto_41917 ) ( ON ?auto_41918 ?auto_41919 ) ( CLEAR ?auto_41918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_41917 ?auto_41918 )
      ( MAKE-6PILE ?auto_41917 ?auto_41918 ?auto_41919 ?auto_41920 ?auto_41921 ?auto_41922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41930 - BLOCK
      ?auto_41931 - BLOCK
      ?auto_41932 - BLOCK
      ?auto_41933 - BLOCK
      ?auto_41934 - BLOCK
      ?auto_41935 - BLOCK
    )
    :vars
    (
      ?auto_41936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41935 ?auto_41936 ) ( not ( = ?auto_41930 ?auto_41931 ) ) ( not ( = ?auto_41930 ?auto_41932 ) ) ( not ( = ?auto_41930 ?auto_41933 ) ) ( not ( = ?auto_41930 ?auto_41934 ) ) ( not ( = ?auto_41930 ?auto_41935 ) ) ( not ( = ?auto_41930 ?auto_41936 ) ) ( not ( = ?auto_41931 ?auto_41932 ) ) ( not ( = ?auto_41931 ?auto_41933 ) ) ( not ( = ?auto_41931 ?auto_41934 ) ) ( not ( = ?auto_41931 ?auto_41935 ) ) ( not ( = ?auto_41931 ?auto_41936 ) ) ( not ( = ?auto_41932 ?auto_41933 ) ) ( not ( = ?auto_41932 ?auto_41934 ) ) ( not ( = ?auto_41932 ?auto_41935 ) ) ( not ( = ?auto_41932 ?auto_41936 ) ) ( not ( = ?auto_41933 ?auto_41934 ) ) ( not ( = ?auto_41933 ?auto_41935 ) ) ( not ( = ?auto_41933 ?auto_41936 ) ) ( not ( = ?auto_41934 ?auto_41935 ) ) ( not ( = ?auto_41934 ?auto_41936 ) ) ( not ( = ?auto_41935 ?auto_41936 ) ) ( ON ?auto_41934 ?auto_41935 ) ( ON ?auto_41933 ?auto_41934 ) ( ON ?auto_41932 ?auto_41933 ) ( ON ?auto_41931 ?auto_41932 ) ( ON ?auto_41930 ?auto_41931 ) ( CLEAR ?auto_41930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41930 )
      ( MAKE-6PILE ?auto_41930 ?auto_41931 ?auto_41932 ?auto_41933 ?auto_41934 ?auto_41935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_41943 - BLOCK
      ?auto_41944 - BLOCK
      ?auto_41945 - BLOCK
      ?auto_41946 - BLOCK
      ?auto_41947 - BLOCK
      ?auto_41948 - BLOCK
    )
    :vars
    (
      ?auto_41949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41948 ?auto_41949 ) ( not ( = ?auto_41943 ?auto_41944 ) ) ( not ( = ?auto_41943 ?auto_41945 ) ) ( not ( = ?auto_41943 ?auto_41946 ) ) ( not ( = ?auto_41943 ?auto_41947 ) ) ( not ( = ?auto_41943 ?auto_41948 ) ) ( not ( = ?auto_41943 ?auto_41949 ) ) ( not ( = ?auto_41944 ?auto_41945 ) ) ( not ( = ?auto_41944 ?auto_41946 ) ) ( not ( = ?auto_41944 ?auto_41947 ) ) ( not ( = ?auto_41944 ?auto_41948 ) ) ( not ( = ?auto_41944 ?auto_41949 ) ) ( not ( = ?auto_41945 ?auto_41946 ) ) ( not ( = ?auto_41945 ?auto_41947 ) ) ( not ( = ?auto_41945 ?auto_41948 ) ) ( not ( = ?auto_41945 ?auto_41949 ) ) ( not ( = ?auto_41946 ?auto_41947 ) ) ( not ( = ?auto_41946 ?auto_41948 ) ) ( not ( = ?auto_41946 ?auto_41949 ) ) ( not ( = ?auto_41947 ?auto_41948 ) ) ( not ( = ?auto_41947 ?auto_41949 ) ) ( not ( = ?auto_41948 ?auto_41949 ) ) ( ON ?auto_41947 ?auto_41948 ) ( ON ?auto_41946 ?auto_41947 ) ( ON ?auto_41945 ?auto_41946 ) ( ON ?auto_41944 ?auto_41945 ) ( ON ?auto_41943 ?auto_41944 ) ( CLEAR ?auto_41943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_41943 )
      ( MAKE-6PILE ?auto_41943 ?auto_41944 ?auto_41945 ?auto_41946 ?auto_41947 ?auto_41948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41957 - BLOCK
      ?auto_41958 - BLOCK
      ?auto_41959 - BLOCK
      ?auto_41960 - BLOCK
      ?auto_41961 - BLOCK
      ?auto_41962 - BLOCK
      ?auto_41963 - BLOCK
    )
    :vars
    (
      ?auto_41964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41962 ) ( ON ?auto_41963 ?auto_41964 ) ( CLEAR ?auto_41963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41957 ) ( ON ?auto_41958 ?auto_41957 ) ( ON ?auto_41959 ?auto_41958 ) ( ON ?auto_41960 ?auto_41959 ) ( ON ?auto_41961 ?auto_41960 ) ( ON ?auto_41962 ?auto_41961 ) ( not ( = ?auto_41957 ?auto_41958 ) ) ( not ( = ?auto_41957 ?auto_41959 ) ) ( not ( = ?auto_41957 ?auto_41960 ) ) ( not ( = ?auto_41957 ?auto_41961 ) ) ( not ( = ?auto_41957 ?auto_41962 ) ) ( not ( = ?auto_41957 ?auto_41963 ) ) ( not ( = ?auto_41957 ?auto_41964 ) ) ( not ( = ?auto_41958 ?auto_41959 ) ) ( not ( = ?auto_41958 ?auto_41960 ) ) ( not ( = ?auto_41958 ?auto_41961 ) ) ( not ( = ?auto_41958 ?auto_41962 ) ) ( not ( = ?auto_41958 ?auto_41963 ) ) ( not ( = ?auto_41958 ?auto_41964 ) ) ( not ( = ?auto_41959 ?auto_41960 ) ) ( not ( = ?auto_41959 ?auto_41961 ) ) ( not ( = ?auto_41959 ?auto_41962 ) ) ( not ( = ?auto_41959 ?auto_41963 ) ) ( not ( = ?auto_41959 ?auto_41964 ) ) ( not ( = ?auto_41960 ?auto_41961 ) ) ( not ( = ?auto_41960 ?auto_41962 ) ) ( not ( = ?auto_41960 ?auto_41963 ) ) ( not ( = ?auto_41960 ?auto_41964 ) ) ( not ( = ?auto_41961 ?auto_41962 ) ) ( not ( = ?auto_41961 ?auto_41963 ) ) ( not ( = ?auto_41961 ?auto_41964 ) ) ( not ( = ?auto_41962 ?auto_41963 ) ) ( not ( = ?auto_41962 ?auto_41964 ) ) ( not ( = ?auto_41963 ?auto_41964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41963 ?auto_41964 )
      ( !STACK ?auto_41963 ?auto_41962 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41972 - BLOCK
      ?auto_41973 - BLOCK
      ?auto_41974 - BLOCK
      ?auto_41975 - BLOCK
      ?auto_41976 - BLOCK
      ?auto_41977 - BLOCK
      ?auto_41978 - BLOCK
    )
    :vars
    (
      ?auto_41979 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_41977 ) ( ON ?auto_41978 ?auto_41979 ) ( CLEAR ?auto_41978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_41972 ) ( ON ?auto_41973 ?auto_41972 ) ( ON ?auto_41974 ?auto_41973 ) ( ON ?auto_41975 ?auto_41974 ) ( ON ?auto_41976 ?auto_41975 ) ( ON ?auto_41977 ?auto_41976 ) ( not ( = ?auto_41972 ?auto_41973 ) ) ( not ( = ?auto_41972 ?auto_41974 ) ) ( not ( = ?auto_41972 ?auto_41975 ) ) ( not ( = ?auto_41972 ?auto_41976 ) ) ( not ( = ?auto_41972 ?auto_41977 ) ) ( not ( = ?auto_41972 ?auto_41978 ) ) ( not ( = ?auto_41972 ?auto_41979 ) ) ( not ( = ?auto_41973 ?auto_41974 ) ) ( not ( = ?auto_41973 ?auto_41975 ) ) ( not ( = ?auto_41973 ?auto_41976 ) ) ( not ( = ?auto_41973 ?auto_41977 ) ) ( not ( = ?auto_41973 ?auto_41978 ) ) ( not ( = ?auto_41973 ?auto_41979 ) ) ( not ( = ?auto_41974 ?auto_41975 ) ) ( not ( = ?auto_41974 ?auto_41976 ) ) ( not ( = ?auto_41974 ?auto_41977 ) ) ( not ( = ?auto_41974 ?auto_41978 ) ) ( not ( = ?auto_41974 ?auto_41979 ) ) ( not ( = ?auto_41975 ?auto_41976 ) ) ( not ( = ?auto_41975 ?auto_41977 ) ) ( not ( = ?auto_41975 ?auto_41978 ) ) ( not ( = ?auto_41975 ?auto_41979 ) ) ( not ( = ?auto_41976 ?auto_41977 ) ) ( not ( = ?auto_41976 ?auto_41978 ) ) ( not ( = ?auto_41976 ?auto_41979 ) ) ( not ( = ?auto_41977 ?auto_41978 ) ) ( not ( = ?auto_41977 ?auto_41979 ) ) ( not ( = ?auto_41978 ?auto_41979 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_41978 ?auto_41979 )
      ( !STACK ?auto_41978 ?auto_41977 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_41987 - BLOCK
      ?auto_41988 - BLOCK
      ?auto_41989 - BLOCK
      ?auto_41990 - BLOCK
      ?auto_41991 - BLOCK
      ?auto_41992 - BLOCK
      ?auto_41993 - BLOCK
    )
    :vars
    (
      ?auto_41994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_41993 ?auto_41994 ) ( ON-TABLE ?auto_41987 ) ( ON ?auto_41988 ?auto_41987 ) ( ON ?auto_41989 ?auto_41988 ) ( ON ?auto_41990 ?auto_41989 ) ( ON ?auto_41991 ?auto_41990 ) ( not ( = ?auto_41987 ?auto_41988 ) ) ( not ( = ?auto_41987 ?auto_41989 ) ) ( not ( = ?auto_41987 ?auto_41990 ) ) ( not ( = ?auto_41987 ?auto_41991 ) ) ( not ( = ?auto_41987 ?auto_41992 ) ) ( not ( = ?auto_41987 ?auto_41993 ) ) ( not ( = ?auto_41987 ?auto_41994 ) ) ( not ( = ?auto_41988 ?auto_41989 ) ) ( not ( = ?auto_41988 ?auto_41990 ) ) ( not ( = ?auto_41988 ?auto_41991 ) ) ( not ( = ?auto_41988 ?auto_41992 ) ) ( not ( = ?auto_41988 ?auto_41993 ) ) ( not ( = ?auto_41988 ?auto_41994 ) ) ( not ( = ?auto_41989 ?auto_41990 ) ) ( not ( = ?auto_41989 ?auto_41991 ) ) ( not ( = ?auto_41989 ?auto_41992 ) ) ( not ( = ?auto_41989 ?auto_41993 ) ) ( not ( = ?auto_41989 ?auto_41994 ) ) ( not ( = ?auto_41990 ?auto_41991 ) ) ( not ( = ?auto_41990 ?auto_41992 ) ) ( not ( = ?auto_41990 ?auto_41993 ) ) ( not ( = ?auto_41990 ?auto_41994 ) ) ( not ( = ?auto_41991 ?auto_41992 ) ) ( not ( = ?auto_41991 ?auto_41993 ) ) ( not ( = ?auto_41991 ?auto_41994 ) ) ( not ( = ?auto_41992 ?auto_41993 ) ) ( not ( = ?auto_41992 ?auto_41994 ) ) ( not ( = ?auto_41993 ?auto_41994 ) ) ( CLEAR ?auto_41991 ) ( ON ?auto_41992 ?auto_41993 ) ( CLEAR ?auto_41992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_41987 ?auto_41988 ?auto_41989 ?auto_41990 ?auto_41991 ?auto_41992 )
      ( MAKE-7PILE ?auto_41987 ?auto_41988 ?auto_41989 ?auto_41990 ?auto_41991 ?auto_41992 ?auto_41993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42002 - BLOCK
      ?auto_42003 - BLOCK
      ?auto_42004 - BLOCK
      ?auto_42005 - BLOCK
      ?auto_42006 - BLOCK
      ?auto_42007 - BLOCK
      ?auto_42008 - BLOCK
    )
    :vars
    (
      ?auto_42009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42008 ?auto_42009 ) ( ON-TABLE ?auto_42002 ) ( ON ?auto_42003 ?auto_42002 ) ( ON ?auto_42004 ?auto_42003 ) ( ON ?auto_42005 ?auto_42004 ) ( ON ?auto_42006 ?auto_42005 ) ( not ( = ?auto_42002 ?auto_42003 ) ) ( not ( = ?auto_42002 ?auto_42004 ) ) ( not ( = ?auto_42002 ?auto_42005 ) ) ( not ( = ?auto_42002 ?auto_42006 ) ) ( not ( = ?auto_42002 ?auto_42007 ) ) ( not ( = ?auto_42002 ?auto_42008 ) ) ( not ( = ?auto_42002 ?auto_42009 ) ) ( not ( = ?auto_42003 ?auto_42004 ) ) ( not ( = ?auto_42003 ?auto_42005 ) ) ( not ( = ?auto_42003 ?auto_42006 ) ) ( not ( = ?auto_42003 ?auto_42007 ) ) ( not ( = ?auto_42003 ?auto_42008 ) ) ( not ( = ?auto_42003 ?auto_42009 ) ) ( not ( = ?auto_42004 ?auto_42005 ) ) ( not ( = ?auto_42004 ?auto_42006 ) ) ( not ( = ?auto_42004 ?auto_42007 ) ) ( not ( = ?auto_42004 ?auto_42008 ) ) ( not ( = ?auto_42004 ?auto_42009 ) ) ( not ( = ?auto_42005 ?auto_42006 ) ) ( not ( = ?auto_42005 ?auto_42007 ) ) ( not ( = ?auto_42005 ?auto_42008 ) ) ( not ( = ?auto_42005 ?auto_42009 ) ) ( not ( = ?auto_42006 ?auto_42007 ) ) ( not ( = ?auto_42006 ?auto_42008 ) ) ( not ( = ?auto_42006 ?auto_42009 ) ) ( not ( = ?auto_42007 ?auto_42008 ) ) ( not ( = ?auto_42007 ?auto_42009 ) ) ( not ( = ?auto_42008 ?auto_42009 ) ) ( CLEAR ?auto_42006 ) ( ON ?auto_42007 ?auto_42008 ) ( CLEAR ?auto_42007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42002 ?auto_42003 ?auto_42004 ?auto_42005 ?auto_42006 ?auto_42007 )
      ( MAKE-7PILE ?auto_42002 ?auto_42003 ?auto_42004 ?auto_42005 ?auto_42006 ?auto_42007 ?auto_42008 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42017 - BLOCK
      ?auto_42018 - BLOCK
      ?auto_42019 - BLOCK
      ?auto_42020 - BLOCK
      ?auto_42021 - BLOCK
      ?auto_42022 - BLOCK
      ?auto_42023 - BLOCK
    )
    :vars
    (
      ?auto_42024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42023 ?auto_42024 ) ( ON-TABLE ?auto_42017 ) ( ON ?auto_42018 ?auto_42017 ) ( ON ?auto_42019 ?auto_42018 ) ( ON ?auto_42020 ?auto_42019 ) ( not ( = ?auto_42017 ?auto_42018 ) ) ( not ( = ?auto_42017 ?auto_42019 ) ) ( not ( = ?auto_42017 ?auto_42020 ) ) ( not ( = ?auto_42017 ?auto_42021 ) ) ( not ( = ?auto_42017 ?auto_42022 ) ) ( not ( = ?auto_42017 ?auto_42023 ) ) ( not ( = ?auto_42017 ?auto_42024 ) ) ( not ( = ?auto_42018 ?auto_42019 ) ) ( not ( = ?auto_42018 ?auto_42020 ) ) ( not ( = ?auto_42018 ?auto_42021 ) ) ( not ( = ?auto_42018 ?auto_42022 ) ) ( not ( = ?auto_42018 ?auto_42023 ) ) ( not ( = ?auto_42018 ?auto_42024 ) ) ( not ( = ?auto_42019 ?auto_42020 ) ) ( not ( = ?auto_42019 ?auto_42021 ) ) ( not ( = ?auto_42019 ?auto_42022 ) ) ( not ( = ?auto_42019 ?auto_42023 ) ) ( not ( = ?auto_42019 ?auto_42024 ) ) ( not ( = ?auto_42020 ?auto_42021 ) ) ( not ( = ?auto_42020 ?auto_42022 ) ) ( not ( = ?auto_42020 ?auto_42023 ) ) ( not ( = ?auto_42020 ?auto_42024 ) ) ( not ( = ?auto_42021 ?auto_42022 ) ) ( not ( = ?auto_42021 ?auto_42023 ) ) ( not ( = ?auto_42021 ?auto_42024 ) ) ( not ( = ?auto_42022 ?auto_42023 ) ) ( not ( = ?auto_42022 ?auto_42024 ) ) ( not ( = ?auto_42023 ?auto_42024 ) ) ( ON ?auto_42022 ?auto_42023 ) ( CLEAR ?auto_42020 ) ( ON ?auto_42021 ?auto_42022 ) ( CLEAR ?auto_42021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42017 ?auto_42018 ?auto_42019 ?auto_42020 ?auto_42021 )
      ( MAKE-7PILE ?auto_42017 ?auto_42018 ?auto_42019 ?auto_42020 ?auto_42021 ?auto_42022 ?auto_42023 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42032 - BLOCK
      ?auto_42033 - BLOCK
      ?auto_42034 - BLOCK
      ?auto_42035 - BLOCK
      ?auto_42036 - BLOCK
      ?auto_42037 - BLOCK
      ?auto_42038 - BLOCK
    )
    :vars
    (
      ?auto_42039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42038 ?auto_42039 ) ( ON-TABLE ?auto_42032 ) ( ON ?auto_42033 ?auto_42032 ) ( ON ?auto_42034 ?auto_42033 ) ( ON ?auto_42035 ?auto_42034 ) ( not ( = ?auto_42032 ?auto_42033 ) ) ( not ( = ?auto_42032 ?auto_42034 ) ) ( not ( = ?auto_42032 ?auto_42035 ) ) ( not ( = ?auto_42032 ?auto_42036 ) ) ( not ( = ?auto_42032 ?auto_42037 ) ) ( not ( = ?auto_42032 ?auto_42038 ) ) ( not ( = ?auto_42032 ?auto_42039 ) ) ( not ( = ?auto_42033 ?auto_42034 ) ) ( not ( = ?auto_42033 ?auto_42035 ) ) ( not ( = ?auto_42033 ?auto_42036 ) ) ( not ( = ?auto_42033 ?auto_42037 ) ) ( not ( = ?auto_42033 ?auto_42038 ) ) ( not ( = ?auto_42033 ?auto_42039 ) ) ( not ( = ?auto_42034 ?auto_42035 ) ) ( not ( = ?auto_42034 ?auto_42036 ) ) ( not ( = ?auto_42034 ?auto_42037 ) ) ( not ( = ?auto_42034 ?auto_42038 ) ) ( not ( = ?auto_42034 ?auto_42039 ) ) ( not ( = ?auto_42035 ?auto_42036 ) ) ( not ( = ?auto_42035 ?auto_42037 ) ) ( not ( = ?auto_42035 ?auto_42038 ) ) ( not ( = ?auto_42035 ?auto_42039 ) ) ( not ( = ?auto_42036 ?auto_42037 ) ) ( not ( = ?auto_42036 ?auto_42038 ) ) ( not ( = ?auto_42036 ?auto_42039 ) ) ( not ( = ?auto_42037 ?auto_42038 ) ) ( not ( = ?auto_42037 ?auto_42039 ) ) ( not ( = ?auto_42038 ?auto_42039 ) ) ( ON ?auto_42037 ?auto_42038 ) ( CLEAR ?auto_42035 ) ( ON ?auto_42036 ?auto_42037 ) ( CLEAR ?auto_42036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42032 ?auto_42033 ?auto_42034 ?auto_42035 ?auto_42036 )
      ( MAKE-7PILE ?auto_42032 ?auto_42033 ?auto_42034 ?auto_42035 ?auto_42036 ?auto_42037 ?auto_42038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42047 - BLOCK
      ?auto_42048 - BLOCK
      ?auto_42049 - BLOCK
      ?auto_42050 - BLOCK
      ?auto_42051 - BLOCK
      ?auto_42052 - BLOCK
      ?auto_42053 - BLOCK
    )
    :vars
    (
      ?auto_42054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42053 ?auto_42054 ) ( ON-TABLE ?auto_42047 ) ( ON ?auto_42048 ?auto_42047 ) ( ON ?auto_42049 ?auto_42048 ) ( not ( = ?auto_42047 ?auto_42048 ) ) ( not ( = ?auto_42047 ?auto_42049 ) ) ( not ( = ?auto_42047 ?auto_42050 ) ) ( not ( = ?auto_42047 ?auto_42051 ) ) ( not ( = ?auto_42047 ?auto_42052 ) ) ( not ( = ?auto_42047 ?auto_42053 ) ) ( not ( = ?auto_42047 ?auto_42054 ) ) ( not ( = ?auto_42048 ?auto_42049 ) ) ( not ( = ?auto_42048 ?auto_42050 ) ) ( not ( = ?auto_42048 ?auto_42051 ) ) ( not ( = ?auto_42048 ?auto_42052 ) ) ( not ( = ?auto_42048 ?auto_42053 ) ) ( not ( = ?auto_42048 ?auto_42054 ) ) ( not ( = ?auto_42049 ?auto_42050 ) ) ( not ( = ?auto_42049 ?auto_42051 ) ) ( not ( = ?auto_42049 ?auto_42052 ) ) ( not ( = ?auto_42049 ?auto_42053 ) ) ( not ( = ?auto_42049 ?auto_42054 ) ) ( not ( = ?auto_42050 ?auto_42051 ) ) ( not ( = ?auto_42050 ?auto_42052 ) ) ( not ( = ?auto_42050 ?auto_42053 ) ) ( not ( = ?auto_42050 ?auto_42054 ) ) ( not ( = ?auto_42051 ?auto_42052 ) ) ( not ( = ?auto_42051 ?auto_42053 ) ) ( not ( = ?auto_42051 ?auto_42054 ) ) ( not ( = ?auto_42052 ?auto_42053 ) ) ( not ( = ?auto_42052 ?auto_42054 ) ) ( not ( = ?auto_42053 ?auto_42054 ) ) ( ON ?auto_42052 ?auto_42053 ) ( ON ?auto_42051 ?auto_42052 ) ( CLEAR ?auto_42049 ) ( ON ?auto_42050 ?auto_42051 ) ( CLEAR ?auto_42050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42047 ?auto_42048 ?auto_42049 ?auto_42050 )
      ( MAKE-7PILE ?auto_42047 ?auto_42048 ?auto_42049 ?auto_42050 ?auto_42051 ?auto_42052 ?auto_42053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42062 - BLOCK
      ?auto_42063 - BLOCK
      ?auto_42064 - BLOCK
      ?auto_42065 - BLOCK
      ?auto_42066 - BLOCK
      ?auto_42067 - BLOCK
      ?auto_42068 - BLOCK
    )
    :vars
    (
      ?auto_42069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42068 ?auto_42069 ) ( ON-TABLE ?auto_42062 ) ( ON ?auto_42063 ?auto_42062 ) ( ON ?auto_42064 ?auto_42063 ) ( not ( = ?auto_42062 ?auto_42063 ) ) ( not ( = ?auto_42062 ?auto_42064 ) ) ( not ( = ?auto_42062 ?auto_42065 ) ) ( not ( = ?auto_42062 ?auto_42066 ) ) ( not ( = ?auto_42062 ?auto_42067 ) ) ( not ( = ?auto_42062 ?auto_42068 ) ) ( not ( = ?auto_42062 ?auto_42069 ) ) ( not ( = ?auto_42063 ?auto_42064 ) ) ( not ( = ?auto_42063 ?auto_42065 ) ) ( not ( = ?auto_42063 ?auto_42066 ) ) ( not ( = ?auto_42063 ?auto_42067 ) ) ( not ( = ?auto_42063 ?auto_42068 ) ) ( not ( = ?auto_42063 ?auto_42069 ) ) ( not ( = ?auto_42064 ?auto_42065 ) ) ( not ( = ?auto_42064 ?auto_42066 ) ) ( not ( = ?auto_42064 ?auto_42067 ) ) ( not ( = ?auto_42064 ?auto_42068 ) ) ( not ( = ?auto_42064 ?auto_42069 ) ) ( not ( = ?auto_42065 ?auto_42066 ) ) ( not ( = ?auto_42065 ?auto_42067 ) ) ( not ( = ?auto_42065 ?auto_42068 ) ) ( not ( = ?auto_42065 ?auto_42069 ) ) ( not ( = ?auto_42066 ?auto_42067 ) ) ( not ( = ?auto_42066 ?auto_42068 ) ) ( not ( = ?auto_42066 ?auto_42069 ) ) ( not ( = ?auto_42067 ?auto_42068 ) ) ( not ( = ?auto_42067 ?auto_42069 ) ) ( not ( = ?auto_42068 ?auto_42069 ) ) ( ON ?auto_42067 ?auto_42068 ) ( ON ?auto_42066 ?auto_42067 ) ( CLEAR ?auto_42064 ) ( ON ?auto_42065 ?auto_42066 ) ( CLEAR ?auto_42065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42062 ?auto_42063 ?auto_42064 ?auto_42065 )
      ( MAKE-7PILE ?auto_42062 ?auto_42063 ?auto_42064 ?auto_42065 ?auto_42066 ?auto_42067 ?auto_42068 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42077 - BLOCK
      ?auto_42078 - BLOCK
      ?auto_42079 - BLOCK
      ?auto_42080 - BLOCK
      ?auto_42081 - BLOCK
      ?auto_42082 - BLOCK
      ?auto_42083 - BLOCK
    )
    :vars
    (
      ?auto_42084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42083 ?auto_42084 ) ( ON-TABLE ?auto_42077 ) ( ON ?auto_42078 ?auto_42077 ) ( not ( = ?auto_42077 ?auto_42078 ) ) ( not ( = ?auto_42077 ?auto_42079 ) ) ( not ( = ?auto_42077 ?auto_42080 ) ) ( not ( = ?auto_42077 ?auto_42081 ) ) ( not ( = ?auto_42077 ?auto_42082 ) ) ( not ( = ?auto_42077 ?auto_42083 ) ) ( not ( = ?auto_42077 ?auto_42084 ) ) ( not ( = ?auto_42078 ?auto_42079 ) ) ( not ( = ?auto_42078 ?auto_42080 ) ) ( not ( = ?auto_42078 ?auto_42081 ) ) ( not ( = ?auto_42078 ?auto_42082 ) ) ( not ( = ?auto_42078 ?auto_42083 ) ) ( not ( = ?auto_42078 ?auto_42084 ) ) ( not ( = ?auto_42079 ?auto_42080 ) ) ( not ( = ?auto_42079 ?auto_42081 ) ) ( not ( = ?auto_42079 ?auto_42082 ) ) ( not ( = ?auto_42079 ?auto_42083 ) ) ( not ( = ?auto_42079 ?auto_42084 ) ) ( not ( = ?auto_42080 ?auto_42081 ) ) ( not ( = ?auto_42080 ?auto_42082 ) ) ( not ( = ?auto_42080 ?auto_42083 ) ) ( not ( = ?auto_42080 ?auto_42084 ) ) ( not ( = ?auto_42081 ?auto_42082 ) ) ( not ( = ?auto_42081 ?auto_42083 ) ) ( not ( = ?auto_42081 ?auto_42084 ) ) ( not ( = ?auto_42082 ?auto_42083 ) ) ( not ( = ?auto_42082 ?auto_42084 ) ) ( not ( = ?auto_42083 ?auto_42084 ) ) ( ON ?auto_42082 ?auto_42083 ) ( ON ?auto_42081 ?auto_42082 ) ( ON ?auto_42080 ?auto_42081 ) ( CLEAR ?auto_42078 ) ( ON ?auto_42079 ?auto_42080 ) ( CLEAR ?auto_42079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42077 ?auto_42078 ?auto_42079 )
      ( MAKE-7PILE ?auto_42077 ?auto_42078 ?auto_42079 ?auto_42080 ?auto_42081 ?auto_42082 ?auto_42083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42092 - BLOCK
      ?auto_42093 - BLOCK
      ?auto_42094 - BLOCK
      ?auto_42095 - BLOCK
      ?auto_42096 - BLOCK
      ?auto_42097 - BLOCK
      ?auto_42098 - BLOCK
    )
    :vars
    (
      ?auto_42099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42098 ?auto_42099 ) ( ON-TABLE ?auto_42092 ) ( ON ?auto_42093 ?auto_42092 ) ( not ( = ?auto_42092 ?auto_42093 ) ) ( not ( = ?auto_42092 ?auto_42094 ) ) ( not ( = ?auto_42092 ?auto_42095 ) ) ( not ( = ?auto_42092 ?auto_42096 ) ) ( not ( = ?auto_42092 ?auto_42097 ) ) ( not ( = ?auto_42092 ?auto_42098 ) ) ( not ( = ?auto_42092 ?auto_42099 ) ) ( not ( = ?auto_42093 ?auto_42094 ) ) ( not ( = ?auto_42093 ?auto_42095 ) ) ( not ( = ?auto_42093 ?auto_42096 ) ) ( not ( = ?auto_42093 ?auto_42097 ) ) ( not ( = ?auto_42093 ?auto_42098 ) ) ( not ( = ?auto_42093 ?auto_42099 ) ) ( not ( = ?auto_42094 ?auto_42095 ) ) ( not ( = ?auto_42094 ?auto_42096 ) ) ( not ( = ?auto_42094 ?auto_42097 ) ) ( not ( = ?auto_42094 ?auto_42098 ) ) ( not ( = ?auto_42094 ?auto_42099 ) ) ( not ( = ?auto_42095 ?auto_42096 ) ) ( not ( = ?auto_42095 ?auto_42097 ) ) ( not ( = ?auto_42095 ?auto_42098 ) ) ( not ( = ?auto_42095 ?auto_42099 ) ) ( not ( = ?auto_42096 ?auto_42097 ) ) ( not ( = ?auto_42096 ?auto_42098 ) ) ( not ( = ?auto_42096 ?auto_42099 ) ) ( not ( = ?auto_42097 ?auto_42098 ) ) ( not ( = ?auto_42097 ?auto_42099 ) ) ( not ( = ?auto_42098 ?auto_42099 ) ) ( ON ?auto_42097 ?auto_42098 ) ( ON ?auto_42096 ?auto_42097 ) ( ON ?auto_42095 ?auto_42096 ) ( CLEAR ?auto_42093 ) ( ON ?auto_42094 ?auto_42095 ) ( CLEAR ?auto_42094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42092 ?auto_42093 ?auto_42094 )
      ( MAKE-7PILE ?auto_42092 ?auto_42093 ?auto_42094 ?auto_42095 ?auto_42096 ?auto_42097 ?auto_42098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42107 - BLOCK
      ?auto_42108 - BLOCK
      ?auto_42109 - BLOCK
      ?auto_42110 - BLOCK
      ?auto_42111 - BLOCK
      ?auto_42112 - BLOCK
      ?auto_42113 - BLOCK
    )
    :vars
    (
      ?auto_42114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42113 ?auto_42114 ) ( ON-TABLE ?auto_42107 ) ( not ( = ?auto_42107 ?auto_42108 ) ) ( not ( = ?auto_42107 ?auto_42109 ) ) ( not ( = ?auto_42107 ?auto_42110 ) ) ( not ( = ?auto_42107 ?auto_42111 ) ) ( not ( = ?auto_42107 ?auto_42112 ) ) ( not ( = ?auto_42107 ?auto_42113 ) ) ( not ( = ?auto_42107 ?auto_42114 ) ) ( not ( = ?auto_42108 ?auto_42109 ) ) ( not ( = ?auto_42108 ?auto_42110 ) ) ( not ( = ?auto_42108 ?auto_42111 ) ) ( not ( = ?auto_42108 ?auto_42112 ) ) ( not ( = ?auto_42108 ?auto_42113 ) ) ( not ( = ?auto_42108 ?auto_42114 ) ) ( not ( = ?auto_42109 ?auto_42110 ) ) ( not ( = ?auto_42109 ?auto_42111 ) ) ( not ( = ?auto_42109 ?auto_42112 ) ) ( not ( = ?auto_42109 ?auto_42113 ) ) ( not ( = ?auto_42109 ?auto_42114 ) ) ( not ( = ?auto_42110 ?auto_42111 ) ) ( not ( = ?auto_42110 ?auto_42112 ) ) ( not ( = ?auto_42110 ?auto_42113 ) ) ( not ( = ?auto_42110 ?auto_42114 ) ) ( not ( = ?auto_42111 ?auto_42112 ) ) ( not ( = ?auto_42111 ?auto_42113 ) ) ( not ( = ?auto_42111 ?auto_42114 ) ) ( not ( = ?auto_42112 ?auto_42113 ) ) ( not ( = ?auto_42112 ?auto_42114 ) ) ( not ( = ?auto_42113 ?auto_42114 ) ) ( ON ?auto_42112 ?auto_42113 ) ( ON ?auto_42111 ?auto_42112 ) ( ON ?auto_42110 ?auto_42111 ) ( ON ?auto_42109 ?auto_42110 ) ( CLEAR ?auto_42107 ) ( ON ?auto_42108 ?auto_42109 ) ( CLEAR ?auto_42108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42107 ?auto_42108 )
      ( MAKE-7PILE ?auto_42107 ?auto_42108 ?auto_42109 ?auto_42110 ?auto_42111 ?auto_42112 ?auto_42113 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42122 - BLOCK
      ?auto_42123 - BLOCK
      ?auto_42124 - BLOCK
      ?auto_42125 - BLOCK
      ?auto_42126 - BLOCK
      ?auto_42127 - BLOCK
      ?auto_42128 - BLOCK
    )
    :vars
    (
      ?auto_42129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42128 ?auto_42129 ) ( ON-TABLE ?auto_42122 ) ( not ( = ?auto_42122 ?auto_42123 ) ) ( not ( = ?auto_42122 ?auto_42124 ) ) ( not ( = ?auto_42122 ?auto_42125 ) ) ( not ( = ?auto_42122 ?auto_42126 ) ) ( not ( = ?auto_42122 ?auto_42127 ) ) ( not ( = ?auto_42122 ?auto_42128 ) ) ( not ( = ?auto_42122 ?auto_42129 ) ) ( not ( = ?auto_42123 ?auto_42124 ) ) ( not ( = ?auto_42123 ?auto_42125 ) ) ( not ( = ?auto_42123 ?auto_42126 ) ) ( not ( = ?auto_42123 ?auto_42127 ) ) ( not ( = ?auto_42123 ?auto_42128 ) ) ( not ( = ?auto_42123 ?auto_42129 ) ) ( not ( = ?auto_42124 ?auto_42125 ) ) ( not ( = ?auto_42124 ?auto_42126 ) ) ( not ( = ?auto_42124 ?auto_42127 ) ) ( not ( = ?auto_42124 ?auto_42128 ) ) ( not ( = ?auto_42124 ?auto_42129 ) ) ( not ( = ?auto_42125 ?auto_42126 ) ) ( not ( = ?auto_42125 ?auto_42127 ) ) ( not ( = ?auto_42125 ?auto_42128 ) ) ( not ( = ?auto_42125 ?auto_42129 ) ) ( not ( = ?auto_42126 ?auto_42127 ) ) ( not ( = ?auto_42126 ?auto_42128 ) ) ( not ( = ?auto_42126 ?auto_42129 ) ) ( not ( = ?auto_42127 ?auto_42128 ) ) ( not ( = ?auto_42127 ?auto_42129 ) ) ( not ( = ?auto_42128 ?auto_42129 ) ) ( ON ?auto_42127 ?auto_42128 ) ( ON ?auto_42126 ?auto_42127 ) ( ON ?auto_42125 ?auto_42126 ) ( ON ?auto_42124 ?auto_42125 ) ( CLEAR ?auto_42122 ) ( ON ?auto_42123 ?auto_42124 ) ( CLEAR ?auto_42123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42122 ?auto_42123 )
      ( MAKE-7PILE ?auto_42122 ?auto_42123 ?auto_42124 ?auto_42125 ?auto_42126 ?auto_42127 ?auto_42128 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42137 - BLOCK
      ?auto_42138 - BLOCK
      ?auto_42139 - BLOCK
      ?auto_42140 - BLOCK
      ?auto_42141 - BLOCK
      ?auto_42142 - BLOCK
      ?auto_42143 - BLOCK
    )
    :vars
    (
      ?auto_42144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42143 ?auto_42144 ) ( not ( = ?auto_42137 ?auto_42138 ) ) ( not ( = ?auto_42137 ?auto_42139 ) ) ( not ( = ?auto_42137 ?auto_42140 ) ) ( not ( = ?auto_42137 ?auto_42141 ) ) ( not ( = ?auto_42137 ?auto_42142 ) ) ( not ( = ?auto_42137 ?auto_42143 ) ) ( not ( = ?auto_42137 ?auto_42144 ) ) ( not ( = ?auto_42138 ?auto_42139 ) ) ( not ( = ?auto_42138 ?auto_42140 ) ) ( not ( = ?auto_42138 ?auto_42141 ) ) ( not ( = ?auto_42138 ?auto_42142 ) ) ( not ( = ?auto_42138 ?auto_42143 ) ) ( not ( = ?auto_42138 ?auto_42144 ) ) ( not ( = ?auto_42139 ?auto_42140 ) ) ( not ( = ?auto_42139 ?auto_42141 ) ) ( not ( = ?auto_42139 ?auto_42142 ) ) ( not ( = ?auto_42139 ?auto_42143 ) ) ( not ( = ?auto_42139 ?auto_42144 ) ) ( not ( = ?auto_42140 ?auto_42141 ) ) ( not ( = ?auto_42140 ?auto_42142 ) ) ( not ( = ?auto_42140 ?auto_42143 ) ) ( not ( = ?auto_42140 ?auto_42144 ) ) ( not ( = ?auto_42141 ?auto_42142 ) ) ( not ( = ?auto_42141 ?auto_42143 ) ) ( not ( = ?auto_42141 ?auto_42144 ) ) ( not ( = ?auto_42142 ?auto_42143 ) ) ( not ( = ?auto_42142 ?auto_42144 ) ) ( not ( = ?auto_42143 ?auto_42144 ) ) ( ON ?auto_42142 ?auto_42143 ) ( ON ?auto_42141 ?auto_42142 ) ( ON ?auto_42140 ?auto_42141 ) ( ON ?auto_42139 ?auto_42140 ) ( ON ?auto_42138 ?auto_42139 ) ( ON ?auto_42137 ?auto_42138 ) ( CLEAR ?auto_42137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42137 )
      ( MAKE-7PILE ?auto_42137 ?auto_42138 ?auto_42139 ?auto_42140 ?auto_42141 ?auto_42142 ?auto_42143 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_42152 - BLOCK
      ?auto_42153 - BLOCK
      ?auto_42154 - BLOCK
      ?auto_42155 - BLOCK
      ?auto_42156 - BLOCK
      ?auto_42157 - BLOCK
      ?auto_42158 - BLOCK
    )
    :vars
    (
      ?auto_42159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42158 ?auto_42159 ) ( not ( = ?auto_42152 ?auto_42153 ) ) ( not ( = ?auto_42152 ?auto_42154 ) ) ( not ( = ?auto_42152 ?auto_42155 ) ) ( not ( = ?auto_42152 ?auto_42156 ) ) ( not ( = ?auto_42152 ?auto_42157 ) ) ( not ( = ?auto_42152 ?auto_42158 ) ) ( not ( = ?auto_42152 ?auto_42159 ) ) ( not ( = ?auto_42153 ?auto_42154 ) ) ( not ( = ?auto_42153 ?auto_42155 ) ) ( not ( = ?auto_42153 ?auto_42156 ) ) ( not ( = ?auto_42153 ?auto_42157 ) ) ( not ( = ?auto_42153 ?auto_42158 ) ) ( not ( = ?auto_42153 ?auto_42159 ) ) ( not ( = ?auto_42154 ?auto_42155 ) ) ( not ( = ?auto_42154 ?auto_42156 ) ) ( not ( = ?auto_42154 ?auto_42157 ) ) ( not ( = ?auto_42154 ?auto_42158 ) ) ( not ( = ?auto_42154 ?auto_42159 ) ) ( not ( = ?auto_42155 ?auto_42156 ) ) ( not ( = ?auto_42155 ?auto_42157 ) ) ( not ( = ?auto_42155 ?auto_42158 ) ) ( not ( = ?auto_42155 ?auto_42159 ) ) ( not ( = ?auto_42156 ?auto_42157 ) ) ( not ( = ?auto_42156 ?auto_42158 ) ) ( not ( = ?auto_42156 ?auto_42159 ) ) ( not ( = ?auto_42157 ?auto_42158 ) ) ( not ( = ?auto_42157 ?auto_42159 ) ) ( not ( = ?auto_42158 ?auto_42159 ) ) ( ON ?auto_42157 ?auto_42158 ) ( ON ?auto_42156 ?auto_42157 ) ( ON ?auto_42155 ?auto_42156 ) ( ON ?auto_42154 ?auto_42155 ) ( ON ?auto_42153 ?auto_42154 ) ( ON ?auto_42152 ?auto_42153 ) ( CLEAR ?auto_42152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42152 )
      ( MAKE-7PILE ?auto_42152 ?auto_42153 ?auto_42154 ?auto_42155 ?auto_42156 ?auto_42157 ?auto_42158 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42168 - BLOCK
      ?auto_42169 - BLOCK
      ?auto_42170 - BLOCK
      ?auto_42171 - BLOCK
      ?auto_42172 - BLOCK
      ?auto_42173 - BLOCK
      ?auto_42174 - BLOCK
      ?auto_42175 - BLOCK
    )
    :vars
    (
      ?auto_42176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42174 ) ( ON ?auto_42175 ?auto_42176 ) ( CLEAR ?auto_42175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42168 ) ( ON ?auto_42169 ?auto_42168 ) ( ON ?auto_42170 ?auto_42169 ) ( ON ?auto_42171 ?auto_42170 ) ( ON ?auto_42172 ?auto_42171 ) ( ON ?auto_42173 ?auto_42172 ) ( ON ?auto_42174 ?auto_42173 ) ( not ( = ?auto_42168 ?auto_42169 ) ) ( not ( = ?auto_42168 ?auto_42170 ) ) ( not ( = ?auto_42168 ?auto_42171 ) ) ( not ( = ?auto_42168 ?auto_42172 ) ) ( not ( = ?auto_42168 ?auto_42173 ) ) ( not ( = ?auto_42168 ?auto_42174 ) ) ( not ( = ?auto_42168 ?auto_42175 ) ) ( not ( = ?auto_42168 ?auto_42176 ) ) ( not ( = ?auto_42169 ?auto_42170 ) ) ( not ( = ?auto_42169 ?auto_42171 ) ) ( not ( = ?auto_42169 ?auto_42172 ) ) ( not ( = ?auto_42169 ?auto_42173 ) ) ( not ( = ?auto_42169 ?auto_42174 ) ) ( not ( = ?auto_42169 ?auto_42175 ) ) ( not ( = ?auto_42169 ?auto_42176 ) ) ( not ( = ?auto_42170 ?auto_42171 ) ) ( not ( = ?auto_42170 ?auto_42172 ) ) ( not ( = ?auto_42170 ?auto_42173 ) ) ( not ( = ?auto_42170 ?auto_42174 ) ) ( not ( = ?auto_42170 ?auto_42175 ) ) ( not ( = ?auto_42170 ?auto_42176 ) ) ( not ( = ?auto_42171 ?auto_42172 ) ) ( not ( = ?auto_42171 ?auto_42173 ) ) ( not ( = ?auto_42171 ?auto_42174 ) ) ( not ( = ?auto_42171 ?auto_42175 ) ) ( not ( = ?auto_42171 ?auto_42176 ) ) ( not ( = ?auto_42172 ?auto_42173 ) ) ( not ( = ?auto_42172 ?auto_42174 ) ) ( not ( = ?auto_42172 ?auto_42175 ) ) ( not ( = ?auto_42172 ?auto_42176 ) ) ( not ( = ?auto_42173 ?auto_42174 ) ) ( not ( = ?auto_42173 ?auto_42175 ) ) ( not ( = ?auto_42173 ?auto_42176 ) ) ( not ( = ?auto_42174 ?auto_42175 ) ) ( not ( = ?auto_42174 ?auto_42176 ) ) ( not ( = ?auto_42175 ?auto_42176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42175 ?auto_42176 )
      ( !STACK ?auto_42175 ?auto_42174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42185 - BLOCK
      ?auto_42186 - BLOCK
      ?auto_42187 - BLOCK
      ?auto_42188 - BLOCK
      ?auto_42189 - BLOCK
      ?auto_42190 - BLOCK
      ?auto_42191 - BLOCK
      ?auto_42192 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42191 ) ( ON-TABLE ?auto_42192 ) ( CLEAR ?auto_42192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42185 ) ( ON ?auto_42186 ?auto_42185 ) ( ON ?auto_42187 ?auto_42186 ) ( ON ?auto_42188 ?auto_42187 ) ( ON ?auto_42189 ?auto_42188 ) ( ON ?auto_42190 ?auto_42189 ) ( ON ?auto_42191 ?auto_42190 ) ( not ( = ?auto_42185 ?auto_42186 ) ) ( not ( = ?auto_42185 ?auto_42187 ) ) ( not ( = ?auto_42185 ?auto_42188 ) ) ( not ( = ?auto_42185 ?auto_42189 ) ) ( not ( = ?auto_42185 ?auto_42190 ) ) ( not ( = ?auto_42185 ?auto_42191 ) ) ( not ( = ?auto_42185 ?auto_42192 ) ) ( not ( = ?auto_42186 ?auto_42187 ) ) ( not ( = ?auto_42186 ?auto_42188 ) ) ( not ( = ?auto_42186 ?auto_42189 ) ) ( not ( = ?auto_42186 ?auto_42190 ) ) ( not ( = ?auto_42186 ?auto_42191 ) ) ( not ( = ?auto_42186 ?auto_42192 ) ) ( not ( = ?auto_42187 ?auto_42188 ) ) ( not ( = ?auto_42187 ?auto_42189 ) ) ( not ( = ?auto_42187 ?auto_42190 ) ) ( not ( = ?auto_42187 ?auto_42191 ) ) ( not ( = ?auto_42187 ?auto_42192 ) ) ( not ( = ?auto_42188 ?auto_42189 ) ) ( not ( = ?auto_42188 ?auto_42190 ) ) ( not ( = ?auto_42188 ?auto_42191 ) ) ( not ( = ?auto_42188 ?auto_42192 ) ) ( not ( = ?auto_42189 ?auto_42190 ) ) ( not ( = ?auto_42189 ?auto_42191 ) ) ( not ( = ?auto_42189 ?auto_42192 ) ) ( not ( = ?auto_42190 ?auto_42191 ) ) ( not ( = ?auto_42190 ?auto_42192 ) ) ( not ( = ?auto_42191 ?auto_42192 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_42192 )
      ( !STACK ?auto_42192 ?auto_42191 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42201 - BLOCK
      ?auto_42202 - BLOCK
      ?auto_42203 - BLOCK
      ?auto_42204 - BLOCK
      ?auto_42205 - BLOCK
      ?auto_42206 - BLOCK
      ?auto_42207 - BLOCK
      ?auto_42208 - BLOCK
    )
    :vars
    (
      ?auto_42209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42208 ?auto_42209 ) ( ON-TABLE ?auto_42201 ) ( ON ?auto_42202 ?auto_42201 ) ( ON ?auto_42203 ?auto_42202 ) ( ON ?auto_42204 ?auto_42203 ) ( ON ?auto_42205 ?auto_42204 ) ( ON ?auto_42206 ?auto_42205 ) ( not ( = ?auto_42201 ?auto_42202 ) ) ( not ( = ?auto_42201 ?auto_42203 ) ) ( not ( = ?auto_42201 ?auto_42204 ) ) ( not ( = ?auto_42201 ?auto_42205 ) ) ( not ( = ?auto_42201 ?auto_42206 ) ) ( not ( = ?auto_42201 ?auto_42207 ) ) ( not ( = ?auto_42201 ?auto_42208 ) ) ( not ( = ?auto_42201 ?auto_42209 ) ) ( not ( = ?auto_42202 ?auto_42203 ) ) ( not ( = ?auto_42202 ?auto_42204 ) ) ( not ( = ?auto_42202 ?auto_42205 ) ) ( not ( = ?auto_42202 ?auto_42206 ) ) ( not ( = ?auto_42202 ?auto_42207 ) ) ( not ( = ?auto_42202 ?auto_42208 ) ) ( not ( = ?auto_42202 ?auto_42209 ) ) ( not ( = ?auto_42203 ?auto_42204 ) ) ( not ( = ?auto_42203 ?auto_42205 ) ) ( not ( = ?auto_42203 ?auto_42206 ) ) ( not ( = ?auto_42203 ?auto_42207 ) ) ( not ( = ?auto_42203 ?auto_42208 ) ) ( not ( = ?auto_42203 ?auto_42209 ) ) ( not ( = ?auto_42204 ?auto_42205 ) ) ( not ( = ?auto_42204 ?auto_42206 ) ) ( not ( = ?auto_42204 ?auto_42207 ) ) ( not ( = ?auto_42204 ?auto_42208 ) ) ( not ( = ?auto_42204 ?auto_42209 ) ) ( not ( = ?auto_42205 ?auto_42206 ) ) ( not ( = ?auto_42205 ?auto_42207 ) ) ( not ( = ?auto_42205 ?auto_42208 ) ) ( not ( = ?auto_42205 ?auto_42209 ) ) ( not ( = ?auto_42206 ?auto_42207 ) ) ( not ( = ?auto_42206 ?auto_42208 ) ) ( not ( = ?auto_42206 ?auto_42209 ) ) ( not ( = ?auto_42207 ?auto_42208 ) ) ( not ( = ?auto_42207 ?auto_42209 ) ) ( not ( = ?auto_42208 ?auto_42209 ) ) ( CLEAR ?auto_42206 ) ( ON ?auto_42207 ?auto_42208 ) ( CLEAR ?auto_42207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_42201 ?auto_42202 ?auto_42203 ?auto_42204 ?auto_42205 ?auto_42206 ?auto_42207 )
      ( MAKE-8PILE ?auto_42201 ?auto_42202 ?auto_42203 ?auto_42204 ?auto_42205 ?auto_42206 ?auto_42207 ?auto_42208 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42218 - BLOCK
      ?auto_42219 - BLOCK
      ?auto_42220 - BLOCK
      ?auto_42221 - BLOCK
      ?auto_42222 - BLOCK
      ?auto_42223 - BLOCK
      ?auto_42224 - BLOCK
      ?auto_42225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42225 ) ( ON-TABLE ?auto_42218 ) ( ON ?auto_42219 ?auto_42218 ) ( ON ?auto_42220 ?auto_42219 ) ( ON ?auto_42221 ?auto_42220 ) ( ON ?auto_42222 ?auto_42221 ) ( ON ?auto_42223 ?auto_42222 ) ( not ( = ?auto_42218 ?auto_42219 ) ) ( not ( = ?auto_42218 ?auto_42220 ) ) ( not ( = ?auto_42218 ?auto_42221 ) ) ( not ( = ?auto_42218 ?auto_42222 ) ) ( not ( = ?auto_42218 ?auto_42223 ) ) ( not ( = ?auto_42218 ?auto_42224 ) ) ( not ( = ?auto_42218 ?auto_42225 ) ) ( not ( = ?auto_42219 ?auto_42220 ) ) ( not ( = ?auto_42219 ?auto_42221 ) ) ( not ( = ?auto_42219 ?auto_42222 ) ) ( not ( = ?auto_42219 ?auto_42223 ) ) ( not ( = ?auto_42219 ?auto_42224 ) ) ( not ( = ?auto_42219 ?auto_42225 ) ) ( not ( = ?auto_42220 ?auto_42221 ) ) ( not ( = ?auto_42220 ?auto_42222 ) ) ( not ( = ?auto_42220 ?auto_42223 ) ) ( not ( = ?auto_42220 ?auto_42224 ) ) ( not ( = ?auto_42220 ?auto_42225 ) ) ( not ( = ?auto_42221 ?auto_42222 ) ) ( not ( = ?auto_42221 ?auto_42223 ) ) ( not ( = ?auto_42221 ?auto_42224 ) ) ( not ( = ?auto_42221 ?auto_42225 ) ) ( not ( = ?auto_42222 ?auto_42223 ) ) ( not ( = ?auto_42222 ?auto_42224 ) ) ( not ( = ?auto_42222 ?auto_42225 ) ) ( not ( = ?auto_42223 ?auto_42224 ) ) ( not ( = ?auto_42223 ?auto_42225 ) ) ( not ( = ?auto_42224 ?auto_42225 ) ) ( CLEAR ?auto_42223 ) ( ON ?auto_42224 ?auto_42225 ) ( CLEAR ?auto_42224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_42218 ?auto_42219 ?auto_42220 ?auto_42221 ?auto_42222 ?auto_42223 ?auto_42224 )
      ( MAKE-8PILE ?auto_42218 ?auto_42219 ?auto_42220 ?auto_42221 ?auto_42222 ?auto_42223 ?auto_42224 ?auto_42225 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42234 - BLOCK
      ?auto_42235 - BLOCK
      ?auto_42236 - BLOCK
      ?auto_42237 - BLOCK
      ?auto_42238 - BLOCK
      ?auto_42239 - BLOCK
      ?auto_42240 - BLOCK
      ?auto_42241 - BLOCK
    )
    :vars
    (
      ?auto_42242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42241 ?auto_42242 ) ( ON-TABLE ?auto_42234 ) ( ON ?auto_42235 ?auto_42234 ) ( ON ?auto_42236 ?auto_42235 ) ( ON ?auto_42237 ?auto_42236 ) ( ON ?auto_42238 ?auto_42237 ) ( not ( = ?auto_42234 ?auto_42235 ) ) ( not ( = ?auto_42234 ?auto_42236 ) ) ( not ( = ?auto_42234 ?auto_42237 ) ) ( not ( = ?auto_42234 ?auto_42238 ) ) ( not ( = ?auto_42234 ?auto_42239 ) ) ( not ( = ?auto_42234 ?auto_42240 ) ) ( not ( = ?auto_42234 ?auto_42241 ) ) ( not ( = ?auto_42234 ?auto_42242 ) ) ( not ( = ?auto_42235 ?auto_42236 ) ) ( not ( = ?auto_42235 ?auto_42237 ) ) ( not ( = ?auto_42235 ?auto_42238 ) ) ( not ( = ?auto_42235 ?auto_42239 ) ) ( not ( = ?auto_42235 ?auto_42240 ) ) ( not ( = ?auto_42235 ?auto_42241 ) ) ( not ( = ?auto_42235 ?auto_42242 ) ) ( not ( = ?auto_42236 ?auto_42237 ) ) ( not ( = ?auto_42236 ?auto_42238 ) ) ( not ( = ?auto_42236 ?auto_42239 ) ) ( not ( = ?auto_42236 ?auto_42240 ) ) ( not ( = ?auto_42236 ?auto_42241 ) ) ( not ( = ?auto_42236 ?auto_42242 ) ) ( not ( = ?auto_42237 ?auto_42238 ) ) ( not ( = ?auto_42237 ?auto_42239 ) ) ( not ( = ?auto_42237 ?auto_42240 ) ) ( not ( = ?auto_42237 ?auto_42241 ) ) ( not ( = ?auto_42237 ?auto_42242 ) ) ( not ( = ?auto_42238 ?auto_42239 ) ) ( not ( = ?auto_42238 ?auto_42240 ) ) ( not ( = ?auto_42238 ?auto_42241 ) ) ( not ( = ?auto_42238 ?auto_42242 ) ) ( not ( = ?auto_42239 ?auto_42240 ) ) ( not ( = ?auto_42239 ?auto_42241 ) ) ( not ( = ?auto_42239 ?auto_42242 ) ) ( not ( = ?auto_42240 ?auto_42241 ) ) ( not ( = ?auto_42240 ?auto_42242 ) ) ( not ( = ?auto_42241 ?auto_42242 ) ) ( ON ?auto_42240 ?auto_42241 ) ( CLEAR ?auto_42238 ) ( ON ?auto_42239 ?auto_42240 ) ( CLEAR ?auto_42239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42234 ?auto_42235 ?auto_42236 ?auto_42237 ?auto_42238 ?auto_42239 )
      ( MAKE-8PILE ?auto_42234 ?auto_42235 ?auto_42236 ?auto_42237 ?auto_42238 ?auto_42239 ?auto_42240 ?auto_42241 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42251 - BLOCK
      ?auto_42252 - BLOCK
      ?auto_42253 - BLOCK
      ?auto_42254 - BLOCK
      ?auto_42255 - BLOCK
      ?auto_42256 - BLOCK
      ?auto_42257 - BLOCK
      ?auto_42258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42258 ) ( ON-TABLE ?auto_42251 ) ( ON ?auto_42252 ?auto_42251 ) ( ON ?auto_42253 ?auto_42252 ) ( ON ?auto_42254 ?auto_42253 ) ( ON ?auto_42255 ?auto_42254 ) ( not ( = ?auto_42251 ?auto_42252 ) ) ( not ( = ?auto_42251 ?auto_42253 ) ) ( not ( = ?auto_42251 ?auto_42254 ) ) ( not ( = ?auto_42251 ?auto_42255 ) ) ( not ( = ?auto_42251 ?auto_42256 ) ) ( not ( = ?auto_42251 ?auto_42257 ) ) ( not ( = ?auto_42251 ?auto_42258 ) ) ( not ( = ?auto_42252 ?auto_42253 ) ) ( not ( = ?auto_42252 ?auto_42254 ) ) ( not ( = ?auto_42252 ?auto_42255 ) ) ( not ( = ?auto_42252 ?auto_42256 ) ) ( not ( = ?auto_42252 ?auto_42257 ) ) ( not ( = ?auto_42252 ?auto_42258 ) ) ( not ( = ?auto_42253 ?auto_42254 ) ) ( not ( = ?auto_42253 ?auto_42255 ) ) ( not ( = ?auto_42253 ?auto_42256 ) ) ( not ( = ?auto_42253 ?auto_42257 ) ) ( not ( = ?auto_42253 ?auto_42258 ) ) ( not ( = ?auto_42254 ?auto_42255 ) ) ( not ( = ?auto_42254 ?auto_42256 ) ) ( not ( = ?auto_42254 ?auto_42257 ) ) ( not ( = ?auto_42254 ?auto_42258 ) ) ( not ( = ?auto_42255 ?auto_42256 ) ) ( not ( = ?auto_42255 ?auto_42257 ) ) ( not ( = ?auto_42255 ?auto_42258 ) ) ( not ( = ?auto_42256 ?auto_42257 ) ) ( not ( = ?auto_42256 ?auto_42258 ) ) ( not ( = ?auto_42257 ?auto_42258 ) ) ( ON ?auto_42257 ?auto_42258 ) ( CLEAR ?auto_42255 ) ( ON ?auto_42256 ?auto_42257 ) ( CLEAR ?auto_42256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42251 ?auto_42252 ?auto_42253 ?auto_42254 ?auto_42255 ?auto_42256 )
      ( MAKE-8PILE ?auto_42251 ?auto_42252 ?auto_42253 ?auto_42254 ?auto_42255 ?auto_42256 ?auto_42257 ?auto_42258 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42267 - BLOCK
      ?auto_42268 - BLOCK
      ?auto_42269 - BLOCK
      ?auto_42270 - BLOCK
      ?auto_42271 - BLOCK
      ?auto_42272 - BLOCK
      ?auto_42273 - BLOCK
      ?auto_42274 - BLOCK
    )
    :vars
    (
      ?auto_42275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42274 ?auto_42275 ) ( ON-TABLE ?auto_42267 ) ( ON ?auto_42268 ?auto_42267 ) ( ON ?auto_42269 ?auto_42268 ) ( ON ?auto_42270 ?auto_42269 ) ( not ( = ?auto_42267 ?auto_42268 ) ) ( not ( = ?auto_42267 ?auto_42269 ) ) ( not ( = ?auto_42267 ?auto_42270 ) ) ( not ( = ?auto_42267 ?auto_42271 ) ) ( not ( = ?auto_42267 ?auto_42272 ) ) ( not ( = ?auto_42267 ?auto_42273 ) ) ( not ( = ?auto_42267 ?auto_42274 ) ) ( not ( = ?auto_42267 ?auto_42275 ) ) ( not ( = ?auto_42268 ?auto_42269 ) ) ( not ( = ?auto_42268 ?auto_42270 ) ) ( not ( = ?auto_42268 ?auto_42271 ) ) ( not ( = ?auto_42268 ?auto_42272 ) ) ( not ( = ?auto_42268 ?auto_42273 ) ) ( not ( = ?auto_42268 ?auto_42274 ) ) ( not ( = ?auto_42268 ?auto_42275 ) ) ( not ( = ?auto_42269 ?auto_42270 ) ) ( not ( = ?auto_42269 ?auto_42271 ) ) ( not ( = ?auto_42269 ?auto_42272 ) ) ( not ( = ?auto_42269 ?auto_42273 ) ) ( not ( = ?auto_42269 ?auto_42274 ) ) ( not ( = ?auto_42269 ?auto_42275 ) ) ( not ( = ?auto_42270 ?auto_42271 ) ) ( not ( = ?auto_42270 ?auto_42272 ) ) ( not ( = ?auto_42270 ?auto_42273 ) ) ( not ( = ?auto_42270 ?auto_42274 ) ) ( not ( = ?auto_42270 ?auto_42275 ) ) ( not ( = ?auto_42271 ?auto_42272 ) ) ( not ( = ?auto_42271 ?auto_42273 ) ) ( not ( = ?auto_42271 ?auto_42274 ) ) ( not ( = ?auto_42271 ?auto_42275 ) ) ( not ( = ?auto_42272 ?auto_42273 ) ) ( not ( = ?auto_42272 ?auto_42274 ) ) ( not ( = ?auto_42272 ?auto_42275 ) ) ( not ( = ?auto_42273 ?auto_42274 ) ) ( not ( = ?auto_42273 ?auto_42275 ) ) ( not ( = ?auto_42274 ?auto_42275 ) ) ( ON ?auto_42273 ?auto_42274 ) ( ON ?auto_42272 ?auto_42273 ) ( CLEAR ?auto_42270 ) ( ON ?auto_42271 ?auto_42272 ) ( CLEAR ?auto_42271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42267 ?auto_42268 ?auto_42269 ?auto_42270 ?auto_42271 )
      ( MAKE-8PILE ?auto_42267 ?auto_42268 ?auto_42269 ?auto_42270 ?auto_42271 ?auto_42272 ?auto_42273 ?auto_42274 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42284 - BLOCK
      ?auto_42285 - BLOCK
      ?auto_42286 - BLOCK
      ?auto_42287 - BLOCK
      ?auto_42288 - BLOCK
      ?auto_42289 - BLOCK
      ?auto_42290 - BLOCK
      ?auto_42291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42291 ) ( ON-TABLE ?auto_42284 ) ( ON ?auto_42285 ?auto_42284 ) ( ON ?auto_42286 ?auto_42285 ) ( ON ?auto_42287 ?auto_42286 ) ( not ( = ?auto_42284 ?auto_42285 ) ) ( not ( = ?auto_42284 ?auto_42286 ) ) ( not ( = ?auto_42284 ?auto_42287 ) ) ( not ( = ?auto_42284 ?auto_42288 ) ) ( not ( = ?auto_42284 ?auto_42289 ) ) ( not ( = ?auto_42284 ?auto_42290 ) ) ( not ( = ?auto_42284 ?auto_42291 ) ) ( not ( = ?auto_42285 ?auto_42286 ) ) ( not ( = ?auto_42285 ?auto_42287 ) ) ( not ( = ?auto_42285 ?auto_42288 ) ) ( not ( = ?auto_42285 ?auto_42289 ) ) ( not ( = ?auto_42285 ?auto_42290 ) ) ( not ( = ?auto_42285 ?auto_42291 ) ) ( not ( = ?auto_42286 ?auto_42287 ) ) ( not ( = ?auto_42286 ?auto_42288 ) ) ( not ( = ?auto_42286 ?auto_42289 ) ) ( not ( = ?auto_42286 ?auto_42290 ) ) ( not ( = ?auto_42286 ?auto_42291 ) ) ( not ( = ?auto_42287 ?auto_42288 ) ) ( not ( = ?auto_42287 ?auto_42289 ) ) ( not ( = ?auto_42287 ?auto_42290 ) ) ( not ( = ?auto_42287 ?auto_42291 ) ) ( not ( = ?auto_42288 ?auto_42289 ) ) ( not ( = ?auto_42288 ?auto_42290 ) ) ( not ( = ?auto_42288 ?auto_42291 ) ) ( not ( = ?auto_42289 ?auto_42290 ) ) ( not ( = ?auto_42289 ?auto_42291 ) ) ( not ( = ?auto_42290 ?auto_42291 ) ) ( ON ?auto_42290 ?auto_42291 ) ( ON ?auto_42289 ?auto_42290 ) ( CLEAR ?auto_42287 ) ( ON ?auto_42288 ?auto_42289 ) ( CLEAR ?auto_42288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42284 ?auto_42285 ?auto_42286 ?auto_42287 ?auto_42288 )
      ( MAKE-8PILE ?auto_42284 ?auto_42285 ?auto_42286 ?auto_42287 ?auto_42288 ?auto_42289 ?auto_42290 ?auto_42291 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42300 - BLOCK
      ?auto_42301 - BLOCK
      ?auto_42302 - BLOCK
      ?auto_42303 - BLOCK
      ?auto_42304 - BLOCK
      ?auto_42305 - BLOCK
      ?auto_42306 - BLOCK
      ?auto_42307 - BLOCK
    )
    :vars
    (
      ?auto_42308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42307 ?auto_42308 ) ( ON-TABLE ?auto_42300 ) ( ON ?auto_42301 ?auto_42300 ) ( ON ?auto_42302 ?auto_42301 ) ( not ( = ?auto_42300 ?auto_42301 ) ) ( not ( = ?auto_42300 ?auto_42302 ) ) ( not ( = ?auto_42300 ?auto_42303 ) ) ( not ( = ?auto_42300 ?auto_42304 ) ) ( not ( = ?auto_42300 ?auto_42305 ) ) ( not ( = ?auto_42300 ?auto_42306 ) ) ( not ( = ?auto_42300 ?auto_42307 ) ) ( not ( = ?auto_42300 ?auto_42308 ) ) ( not ( = ?auto_42301 ?auto_42302 ) ) ( not ( = ?auto_42301 ?auto_42303 ) ) ( not ( = ?auto_42301 ?auto_42304 ) ) ( not ( = ?auto_42301 ?auto_42305 ) ) ( not ( = ?auto_42301 ?auto_42306 ) ) ( not ( = ?auto_42301 ?auto_42307 ) ) ( not ( = ?auto_42301 ?auto_42308 ) ) ( not ( = ?auto_42302 ?auto_42303 ) ) ( not ( = ?auto_42302 ?auto_42304 ) ) ( not ( = ?auto_42302 ?auto_42305 ) ) ( not ( = ?auto_42302 ?auto_42306 ) ) ( not ( = ?auto_42302 ?auto_42307 ) ) ( not ( = ?auto_42302 ?auto_42308 ) ) ( not ( = ?auto_42303 ?auto_42304 ) ) ( not ( = ?auto_42303 ?auto_42305 ) ) ( not ( = ?auto_42303 ?auto_42306 ) ) ( not ( = ?auto_42303 ?auto_42307 ) ) ( not ( = ?auto_42303 ?auto_42308 ) ) ( not ( = ?auto_42304 ?auto_42305 ) ) ( not ( = ?auto_42304 ?auto_42306 ) ) ( not ( = ?auto_42304 ?auto_42307 ) ) ( not ( = ?auto_42304 ?auto_42308 ) ) ( not ( = ?auto_42305 ?auto_42306 ) ) ( not ( = ?auto_42305 ?auto_42307 ) ) ( not ( = ?auto_42305 ?auto_42308 ) ) ( not ( = ?auto_42306 ?auto_42307 ) ) ( not ( = ?auto_42306 ?auto_42308 ) ) ( not ( = ?auto_42307 ?auto_42308 ) ) ( ON ?auto_42306 ?auto_42307 ) ( ON ?auto_42305 ?auto_42306 ) ( ON ?auto_42304 ?auto_42305 ) ( CLEAR ?auto_42302 ) ( ON ?auto_42303 ?auto_42304 ) ( CLEAR ?auto_42303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42300 ?auto_42301 ?auto_42302 ?auto_42303 )
      ( MAKE-8PILE ?auto_42300 ?auto_42301 ?auto_42302 ?auto_42303 ?auto_42304 ?auto_42305 ?auto_42306 ?auto_42307 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42317 - BLOCK
      ?auto_42318 - BLOCK
      ?auto_42319 - BLOCK
      ?auto_42320 - BLOCK
      ?auto_42321 - BLOCK
      ?auto_42322 - BLOCK
      ?auto_42323 - BLOCK
      ?auto_42324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42324 ) ( ON-TABLE ?auto_42317 ) ( ON ?auto_42318 ?auto_42317 ) ( ON ?auto_42319 ?auto_42318 ) ( not ( = ?auto_42317 ?auto_42318 ) ) ( not ( = ?auto_42317 ?auto_42319 ) ) ( not ( = ?auto_42317 ?auto_42320 ) ) ( not ( = ?auto_42317 ?auto_42321 ) ) ( not ( = ?auto_42317 ?auto_42322 ) ) ( not ( = ?auto_42317 ?auto_42323 ) ) ( not ( = ?auto_42317 ?auto_42324 ) ) ( not ( = ?auto_42318 ?auto_42319 ) ) ( not ( = ?auto_42318 ?auto_42320 ) ) ( not ( = ?auto_42318 ?auto_42321 ) ) ( not ( = ?auto_42318 ?auto_42322 ) ) ( not ( = ?auto_42318 ?auto_42323 ) ) ( not ( = ?auto_42318 ?auto_42324 ) ) ( not ( = ?auto_42319 ?auto_42320 ) ) ( not ( = ?auto_42319 ?auto_42321 ) ) ( not ( = ?auto_42319 ?auto_42322 ) ) ( not ( = ?auto_42319 ?auto_42323 ) ) ( not ( = ?auto_42319 ?auto_42324 ) ) ( not ( = ?auto_42320 ?auto_42321 ) ) ( not ( = ?auto_42320 ?auto_42322 ) ) ( not ( = ?auto_42320 ?auto_42323 ) ) ( not ( = ?auto_42320 ?auto_42324 ) ) ( not ( = ?auto_42321 ?auto_42322 ) ) ( not ( = ?auto_42321 ?auto_42323 ) ) ( not ( = ?auto_42321 ?auto_42324 ) ) ( not ( = ?auto_42322 ?auto_42323 ) ) ( not ( = ?auto_42322 ?auto_42324 ) ) ( not ( = ?auto_42323 ?auto_42324 ) ) ( ON ?auto_42323 ?auto_42324 ) ( ON ?auto_42322 ?auto_42323 ) ( ON ?auto_42321 ?auto_42322 ) ( CLEAR ?auto_42319 ) ( ON ?auto_42320 ?auto_42321 ) ( CLEAR ?auto_42320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42317 ?auto_42318 ?auto_42319 ?auto_42320 )
      ( MAKE-8PILE ?auto_42317 ?auto_42318 ?auto_42319 ?auto_42320 ?auto_42321 ?auto_42322 ?auto_42323 ?auto_42324 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42333 - BLOCK
      ?auto_42334 - BLOCK
      ?auto_42335 - BLOCK
      ?auto_42336 - BLOCK
      ?auto_42337 - BLOCK
      ?auto_42338 - BLOCK
      ?auto_42339 - BLOCK
      ?auto_42340 - BLOCK
    )
    :vars
    (
      ?auto_42341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42340 ?auto_42341 ) ( ON-TABLE ?auto_42333 ) ( ON ?auto_42334 ?auto_42333 ) ( not ( = ?auto_42333 ?auto_42334 ) ) ( not ( = ?auto_42333 ?auto_42335 ) ) ( not ( = ?auto_42333 ?auto_42336 ) ) ( not ( = ?auto_42333 ?auto_42337 ) ) ( not ( = ?auto_42333 ?auto_42338 ) ) ( not ( = ?auto_42333 ?auto_42339 ) ) ( not ( = ?auto_42333 ?auto_42340 ) ) ( not ( = ?auto_42333 ?auto_42341 ) ) ( not ( = ?auto_42334 ?auto_42335 ) ) ( not ( = ?auto_42334 ?auto_42336 ) ) ( not ( = ?auto_42334 ?auto_42337 ) ) ( not ( = ?auto_42334 ?auto_42338 ) ) ( not ( = ?auto_42334 ?auto_42339 ) ) ( not ( = ?auto_42334 ?auto_42340 ) ) ( not ( = ?auto_42334 ?auto_42341 ) ) ( not ( = ?auto_42335 ?auto_42336 ) ) ( not ( = ?auto_42335 ?auto_42337 ) ) ( not ( = ?auto_42335 ?auto_42338 ) ) ( not ( = ?auto_42335 ?auto_42339 ) ) ( not ( = ?auto_42335 ?auto_42340 ) ) ( not ( = ?auto_42335 ?auto_42341 ) ) ( not ( = ?auto_42336 ?auto_42337 ) ) ( not ( = ?auto_42336 ?auto_42338 ) ) ( not ( = ?auto_42336 ?auto_42339 ) ) ( not ( = ?auto_42336 ?auto_42340 ) ) ( not ( = ?auto_42336 ?auto_42341 ) ) ( not ( = ?auto_42337 ?auto_42338 ) ) ( not ( = ?auto_42337 ?auto_42339 ) ) ( not ( = ?auto_42337 ?auto_42340 ) ) ( not ( = ?auto_42337 ?auto_42341 ) ) ( not ( = ?auto_42338 ?auto_42339 ) ) ( not ( = ?auto_42338 ?auto_42340 ) ) ( not ( = ?auto_42338 ?auto_42341 ) ) ( not ( = ?auto_42339 ?auto_42340 ) ) ( not ( = ?auto_42339 ?auto_42341 ) ) ( not ( = ?auto_42340 ?auto_42341 ) ) ( ON ?auto_42339 ?auto_42340 ) ( ON ?auto_42338 ?auto_42339 ) ( ON ?auto_42337 ?auto_42338 ) ( ON ?auto_42336 ?auto_42337 ) ( CLEAR ?auto_42334 ) ( ON ?auto_42335 ?auto_42336 ) ( CLEAR ?auto_42335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42333 ?auto_42334 ?auto_42335 )
      ( MAKE-8PILE ?auto_42333 ?auto_42334 ?auto_42335 ?auto_42336 ?auto_42337 ?auto_42338 ?auto_42339 ?auto_42340 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42350 - BLOCK
      ?auto_42351 - BLOCK
      ?auto_42352 - BLOCK
      ?auto_42353 - BLOCK
      ?auto_42354 - BLOCK
      ?auto_42355 - BLOCK
      ?auto_42356 - BLOCK
      ?auto_42357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42357 ) ( ON-TABLE ?auto_42350 ) ( ON ?auto_42351 ?auto_42350 ) ( not ( = ?auto_42350 ?auto_42351 ) ) ( not ( = ?auto_42350 ?auto_42352 ) ) ( not ( = ?auto_42350 ?auto_42353 ) ) ( not ( = ?auto_42350 ?auto_42354 ) ) ( not ( = ?auto_42350 ?auto_42355 ) ) ( not ( = ?auto_42350 ?auto_42356 ) ) ( not ( = ?auto_42350 ?auto_42357 ) ) ( not ( = ?auto_42351 ?auto_42352 ) ) ( not ( = ?auto_42351 ?auto_42353 ) ) ( not ( = ?auto_42351 ?auto_42354 ) ) ( not ( = ?auto_42351 ?auto_42355 ) ) ( not ( = ?auto_42351 ?auto_42356 ) ) ( not ( = ?auto_42351 ?auto_42357 ) ) ( not ( = ?auto_42352 ?auto_42353 ) ) ( not ( = ?auto_42352 ?auto_42354 ) ) ( not ( = ?auto_42352 ?auto_42355 ) ) ( not ( = ?auto_42352 ?auto_42356 ) ) ( not ( = ?auto_42352 ?auto_42357 ) ) ( not ( = ?auto_42353 ?auto_42354 ) ) ( not ( = ?auto_42353 ?auto_42355 ) ) ( not ( = ?auto_42353 ?auto_42356 ) ) ( not ( = ?auto_42353 ?auto_42357 ) ) ( not ( = ?auto_42354 ?auto_42355 ) ) ( not ( = ?auto_42354 ?auto_42356 ) ) ( not ( = ?auto_42354 ?auto_42357 ) ) ( not ( = ?auto_42355 ?auto_42356 ) ) ( not ( = ?auto_42355 ?auto_42357 ) ) ( not ( = ?auto_42356 ?auto_42357 ) ) ( ON ?auto_42356 ?auto_42357 ) ( ON ?auto_42355 ?auto_42356 ) ( ON ?auto_42354 ?auto_42355 ) ( ON ?auto_42353 ?auto_42354 ) ( CLEAR ?auto_42351 ) ( ON ?auto_42352 ?auto_42353 ) ( CLEAR ?auto_42352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42350 ?auto_42351 ?auto_42352 )
      ( MAKE-8PILE ?auto_42350 ?auto_42351 ?auto_42352 ?auto_42353 ?auto_42354 ?auto_42355 ?auto_42356 ?auto_42357 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42366 - BLOCK
      ?auto_42367 - BLOCK
      ?auto_42368 - BLOCK
      ?auto_42369 - BLOCK
      ?auto_42370 - BLOCK
      ?auto_42371 - BLOCK
      ?auto_42372 - BLOCK
      ?auto_42373 - BLOCK
    )
    :vars
    (
      ?auto_42374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42373 ?auto_42374 ) ( ON-TABLE ?auto_42366 ) ( not ( = ?auto_42366 ?auto_42367 ) ) ( not ( = ?auto_42366 ?auto_42368 ) ) ( not ( = ?auto_42366 ?auto_42369 ) ) ( not ( = ?auto_42366 ?auto_42370 ) ) ( not ( = ?auto_42366 ?auto_42371 ) ) ( not ( = ?auto_42366 ?auto_42372 ) ) ( not ( = ?auto_42366 ?auto_42373 ) ) ( not ( = ?auto_42366 ?auto_42374 ) ) ( not ( = ?auto_42367 ?auto_42368 ) ) ( not ( = ?auto_42367 ?auto_42369 ) ) ( not ( = ?auto_42367 ?auto_42370 ) ) ( not ( = ?auto_42367 ?auto_42371 ) ) ( not ( = ?auto_42367 ?auto_42372 ) ) ( not ( = ?auto_42367 ?auto_42373 ) ) ( not ( = ?auto_42367 ?auto_42374 ) ) ( not ( = ?auto_42368 ?auto_42369 ) ) ( not ( = ?auto_42368 ?auto_42370 ) ) ( not ( = ?auto_42368 ?auto_42371 ) ) ( not ( = ?auto_42368 ?auto_42372 ) ) ( not ( = ?auto_42368 ?auto_42373 ) ) ( not ( = ?auto_42368 ?auto_42374 ) ) ( not ( = ?auto_42369 ?auto_42370 ) ) ( not ( = ?auto_42369 ?auto_42371 ) ) ( not ( = ?auto_42369 ?auto_42372 ) ) ( not ( = ?auto_42369 ?auto_42373 ) ) ( not ( = ?auto_42369 ?auto_42374 ) ) ( not ( = ?auto_42370 ?auto_42371 ) ) ( not ( = ?auto_42370 ?auto_42372 ) ) ( not ( = ?auto_42370 ?auto_42373 ) ) ( not ( = ?auto_42370 ?auto_42374 ) ) ( not ( = ?auto_42371 ?auto_42372 ) ) ( not ( = ?auto_42371 ?auto_42373 ) ) ( not ( = ?auto_42371 ?auto_42374 ) ) ( not ( = ?auto_42372 ?auto_42373 ) ) ( not ( = ?auto_42372 ?auto_42374 ) ) ( not ( = ?auto_42373 ?auto_42374 ) ) ( ON ?auto_42372 ?auto_42373 ) ( ON ?auto_42371 ?auto_42372 ) ( ON ?auto_42370 ?auto_42371 ) ( ON ?auto_42369 ?auto_42370 ) ( ON ?auto_42368 ?auto_42369 ) ( CLEAR ?auto_42366 ) ( ON ?auto_42367 ?auto_42368 ) ( CLEAR ?auto_42367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42366 ?auto_42367 )
      ( MAKE-8PILE ?auto_42366 ?auto_42367 ?auto_42368 ?auto_42369 ?auto_42370 ?auto_42371 ?auto_42372 ?auto_42373 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42383 - BLOCK
      ?auto_42384 - BLOCK
      ?auto_42385 - BLOCK
      ?auto_42386 - BLOCK
      ?auto_42387 - BLOCK
      ?auto_42388 - BLOCK
      ?auto_42389 - BLOCK
      ?auto_42390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42390 ) ( ON-TABLE ?auto_42383 ) ( not ( = ?auto_42383 ?auto_42384 ) ) ( not ( = ?auto_42383 ?auto_42385 ) ) ( not ( = ?auto_42383 ?auto_42386 ) ) ( not ( = ?auto_42383 ?auto_42387 ) ) ( not ( = ?auto_42383 ?auto_42388 ) ) ( not ( = ?auto_42383 ?auto_42389 ) ) ( not ( = ?auto_42383 ?auto_42390 ) ) ( not ( = ?auto_42384 ?auto_42385 ) ) ( not ( = ?auto_42384 ?auto_42386 ) ) ( not ( = ?auto_42384 ?auto_42387 ) ) ( not ( = ?auto_42384 ?auto_42388 ) ) ( not ( = ?auto_42384 ?auto_42389 ) ) ( not ( = ?auto_42384 ?auto_42390 ) ) ( not ( = ?auto_42385 ?auto_42386 ) ) ( not ( = ?auto_42385 ?auto_42387 ) ) ( not ( = ?auto_42385 ?auto_42388 ) ) ( not ( = ?auto_42385 ?auto_42389 ) ) ( not ( = ?auto_42385 ?auto_42390 ) ) ( not ( = ?auto_42386 ?auto_42387 ) ) ( not ( = ?auto_42386 ?auto_42388 ) ) ( not ( = ?auto_42386 ?auto_42389 ) ) ( not ( = ?auto_42386 ?auto_42390 ) ) ( not ( = ?auto_42387 ?auto_42388 ) ) ( not ( = ?auto_42387 ?auto_42389 ) ) ( not ( = ?auto_42387 ?auto_42390 ) ) ( not ( = ?auto_42388 ?auto_42389 ) ) ( not ( = ?auto_42388 ?auto_42390 ) ) ( not ( = ?auto_42389 ?auto_42390 ) ) ( ON ?auto_42389 ?auto_42390 ) ( ON ?auto_42388 ?auto_42389 ) ( ON ?auto_42387 ?auto_42388 ) ( ON ?auto_42386 ?auto_42387 ) ( ON ?auto_42385 ?auto_42386 ) ( CLEAR ?auto_42383 ) ( ON ?auto_42384 ?auto_42385 ) ( CLEAR ?auto_42384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42383 ?auto_42384 )
      ( MAKE-8PILE ?auto_42383 ?auto_42384 ?auto_42385 ?auto_42386 ?auto_42387 ?auto_42388 ?auto_42389 ?auto_42390 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42399 - BLOCK
      ?auto_42400 - BLOCK
      ?auto_42401 - BLOCK
      ?auto_42402 - BLOCK
      ?auto_42403 - BLOCK
      ?auto_42404 - BLOCK
      ?auto_42405 - BLOCK
      ?auto_42406 - BLOCK
    )
    :vars
    (
      ?auto_42407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42406 ?auto_42407 ) ( not ( = ?auto_42399 ?auto_42400 ) ) ( not ( = ?auto_42399 ?auto_42401 ) ) ( not ( = ?auto_42399 ?auto_42402 ) ) ( not ( = ?auto_42399 ?auto_42403 ) ) ( not ( = ?auto_42399 ?auto_42404 ) ) ( not ( = ?auto_42399 ?auto_42405 ) ) ( not ( = ?auto_42399 ?auto_42406 ) ) ( not ( = ?auto_42399 ?auto_42407 ) ) ( not ( = ?auto_42400 ?auto_42401 ) ) ( not ( = ?auto_42400 ?auto_42402 ) ) ( not ( = ?auto_42400 ?auto_42403 ) ) ( not ( = ?auto_42400 ?auto_42404 ) ) ( not ( = ?auto_42400 ?auto_42405 ) ) ( not ( = ?auto_42400 ?auto_42406 ) ) ( not ( = ?auto_42400 ?auto_42407 ) ) ( not ( = ?auto_42401 ?auto_42402 ) ) ( not ( = ?auto_42401 ?auto_42403 ) ) ( not ( = ?auto_42401 ?auto_42404 ) ) ( not ( = ?auto_42401 ?auto_42405 ) ) ( not ( = ?auto_42401 ?auto_42406 ) ) ( not ( = ?auto_42401 ?auto_42407 ) ) ( not ( = ?auto_42402 ?auto_42403 ) ) ( not ( = ?auto_42402 ?auto_42404 ) ) ( not ( = ?auto_42402 ?auto_42405 ) ) ( not ( = ?auto_42402 ?auto_42406 ) ) ( not ( = ?auto_42402 ?auto_42407 ) ) ( not ( = ?auto_42403 ?auto_42404 ) ) ( not ( = ?auto_42403 ?auto_42405 ) ) ( not ( = ?auto_42403 ?auto_42406 ) ) ( not ( = ?auto_42403 ?auto_42407 ) ) ( not ( = ?auto_42404 ?auto_42405 ) ) ( not ( = ?auto_42404 ?auto_42406 ) ) ( not ( = ?auto_42404 ?auto_42407 ) ) ( not ( = ?auto_42405 ?auto_42406 ) ) ( not ( = ?auto_42405 ?auto_42407 ) ) ( not ( = ?auto_42406 ?auto_42407 ) ) ( ON ?auto_42405 ?auto_42406 ) ( ON ?auto_42404 ?auto_42405 ) ( ON ?auto_42403 ?auto_42404 ) ( ON ?auto_42402 ?auto_42403 ) ( ON ?auto_42401 ?auto_42402 ) ( ON ?auto_42400 ?auto_42401 ) ( ON ?auto_42399 ?auto_42400 ) ( CLEAR ?auto_42399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42399 )
      ( MAKE-8PILE ?auto_42399 ?auto_42400 ?auto_42401 ?auto_42402 ?auto_42403 ?auto_42404 ?auto_42405 ?auto_42406 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42416 - BLOCK
      ?auto_42417 - BLOCK
      ?auto_42418 - BLOCK
      ?auto_42419 - BLOCK
      ?auto_42420 - BLOCK
      ?auto_42421 - BLOCK
      ?auto_42422 - BLOCK
      ?auto_42423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42423 ) ( not ( = ?auto_42416 ?auto_42417 ) ) ( not ( = ?auto_42416 ?auto_42418 ) ) ( not ( = ?auto_42416 ?auto_42419 ) ) ( not ( = ?auto_42416 ?auto_42420 ) ) ( not ( = ?auto_42416 ?auto_42421 ) ) ( not ( = ?auto_42416 ?auto_42422 ) ) ( not ( = ?auto_42416 ?auto_42423 ) ) ( not ( = ?auto_42417 ?auto_42418 ) ) ( not ( = ?auto_42417 ?auto_42419 ) ) ( not ( = ?auto_42417 ?auto_42420 ) ) ( not ( = ?auto_42417 ?auto_42421 ) ) ( not ( = ?auto_42417 ?auto_42422 ) ) ( not ( = ?auto_42417 ?auto_42423 ) ) ( not ( = ?auto_42418 ?auto_42419 ) ) ( not ( = ?auto_42418 ?auto_42420 ) ) ( not ( = ?auto_42418 ?auto_42421 ) ) ( not ( = ?auto_42418 ?auto_42422 ) ) ( not ( = ?auto_42418 ?auto_42423 ) ) ( not ( = ?auto_42419 ?auto_42420 ) ) ( not ( = ?auto_42419 ?auto_42421 ) ) ( not ( = ?auto_42419 ?auto_42422 ) ) ( not ( = ?auto_42419 ?auto_42423 ) ) ( not ( = ?auto_42420 ?auto_42421 ) ) ( not ( = ?auto_42420 ?auto_42422 ) ) ( not ( = ?auto_42420 ?auto_42423 ) ) ( not ( = ?auto_42421 ?auto_42422 ) ) ( not ( = ?auto_42421 ?auto_42423 ) ) ( not ( = ?auto_42422 ?auto_42423 ) ) ( ON ?auto_42422 ?auto_42423 ) ( ON ?auto_42421 ?auto_42422 ) ( ON ?auto_42420 ?auto_42421 ) ( ON ?auto_42419 ?auto_42420 ) ( ON ?auto_42418 ?auto_42419 ) ( ON ?auto_42417 ?auto_42418 ) ( ON ?auto_42416 ?auto_42417 ) ( CLEAR ?auto_42416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42416 )
      ( MAKE-8PILE ?auto_42416 ?auto_42417 ?auto_42418 ?auto_42419 ?auto_42420 ?auto_42421 ?auto_42422 ?auto_42423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_42432 - BLOCK
      ?auto_42433 - BLOCK
      ?auto_42434 - BLOCK
      ?auto_42435 - BLOCK
      ?auto_42436 - BLOCK
      ?auto_42437 - BLOCK
      ?auto_42438 - BLOCK
      ?auto_42439 - BLOCK
    )
    :vars
    (
      ?auto_42440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42432 ?auto_42433 ) ) ( not ( = ?auto_42432 ?auto_42434 ) ) ( not ( = ?auto_42432 ?auto_42435 ) ) ( not ( = ?auto_42432 ?auto_42436 ) ) ( not ( = ?auto_42432 ?auto_42437 ) ) ( not ( = ?auto_42432 ?auto_42438 ) ) ( not ( = ?auto_42432 ?auto_42439 ) ) ( not ( = ?auto_42433 ?auto_42434 ) ) ( not ( = ?auto_42433 ?auto_42435 ) ) ( not ( = ?auto_42433 ?auto_42436 ) ) ( not ( = ?auto_42433 ?auto_42437 ) ) ( not ( = ?auto_42433 ?auto_42438 ) ) ( not ( = ?auto_42433 ?auto_42439 ) ) ( not ( = ?auto_42434 ?auto_42435 ) ) ( not ( = ?auto_42434 ?auto_42436 ) ) ( not ( = ?auto_42434 ?auto_42437 ) ) ( not ( = ?auto_42434 ?auto_42438 ) ) ( not ( = ?auto_42434 ?auto_42439 ) ) ( not ( = ?auto_42435 ?auto_42436 ) ) ( not ( = ?auto_42435 ?auto_42437 ) ) ( not ( = ?auto_42435 ?auto_42438 ) ) ( not ( = ?auto_42435 ?auto_42439 ) ) ( not ( = ?auto_42436 ?auto_42437 ) ) ( not ( = ?auto_42436 ?auto_42438 ) ) ( not ( = ?auto_42436 ?auto_42439 ) ) ( not ( = ?auto_42437 ?auto_42438 ) ) ( not ( = ?auto_42437 ?auto_42439 ) ) ( not ( = ?auto_42438 ?auto_42439 ) ) ( ON ?auto_42432 ?auto_42440 ) ( not ( = ?auto_42439 ?auto_42440 ) ) ( not ( = ?auto_42438 ?auto_42440 ) ) ( not ( = ?auto_42437 ?auto_42440 ) ) ( not ( = ?auto_42436 ?auto_42440 ) ) ( not ( = ?auto_42435 ?auto_42440 ) ) ( not ( = ?auto_42434 ?auto_42440 ) ) ( not ( = ?auto_42433 ?auto_42440 ) ) ( not ( = ?auto_42432 ?auto_42440 ) ) ( ON ?auto_42433 ?auto_42432 ) ( ON ?auto_42434 ?auto_42433 ) ( ON ?auto_42435 ?auto_42434 ) ( ON ?auto_42436 ?auto_42435 ) ( ON ?auto_42437 ?auto_42436 ) ( ON ?auto_42438 ?auto_42437 ) ( ON ?auto_42439 ?auto_42438 ) ( CLEAR ?auto_42439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_42439 ?auto_42438 ?auto_42437 ?auto_42436 ?auto_42435 ?auto_42434 ?auto_42433 ?auto_42432 )
      ( MAKE-8PILE ?auto_42432 ?auto_42433 ?auto_42434 ?auto_42435 ?auto_42436 ?auto_42437 ?auto_42438 ?auto_42439 ) )
  )

)

