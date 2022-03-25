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
      ?auto_78601 - BLOCK
      ?auto_78602 - BLOCK
      ?auto_78603 - BLOCK
      ?auto_78604 - BLOCK
      ?auto_78605 - BLOCK
      ?auto_78606 - BLOCK
      ?auto_78607 - BLOCK
    )
    :vars
    (
      ?auto_78608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78608 ?auto_78607 ) ( CLEAR ?auto_78608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78601 ) ( ON ?auto_78602 ?auto_78601 ) ( ON ?auto_78603 ?auto_78602 ) ( ON ?auto_78604 ?auto_78603 ) ( ON ?auto_78605 ?auto_78604 ) ( ON ?auto_78606 ?auto_78605 ) ( ON ?auto_78607 ?auto_78606 ) ( not ( = ?auto_78601 ?auto_78602 ) ) ( not ( = ?auto_78601 ?auto_78603 ) ) ( not ( = ?auto_78601 ?auto_78604 ) ) ( not ( = ?auto_78601 ?auto_78605 ) ) ( not ( = ?auto_78601 ?auto_78606 ) ) ( not ( = ?auto_78601 ?auto_78607 ) ) ( not ( = ?auto_78601 ?auto_78608 ) ) ( not ( = ?auto_78602 ?auto_78603 ) ) ( not ( = ?auto_78602 ?auto_78604 ) ) ( not ( = ?auto_78602 ?auto_78605 ) ) ( not ( = ?auto_78602 ?auto_78606 ) ) ( not ( = ?auto_78602 ?auto_78607 ) ) ( not ( = ?auto_78602 ?auto_78608 ) ) ( not ( = ?auto_78603 ?auto_78604 ) ) ( not ( = ?auto_78603 ?auto_78605 ) ) ( not ( = ?auto_78603 ?auto_78606 ) ) ( not ( = ?auto_78603 ?auto_78607 ) ) ( not ( = ?auto_78603 ?auto_78608 ) ) ( not ( = ?auto_78604 ?auto_78605 ) ) ( not ( = ?auto_78604 ?auto_78606 ) ) ( not ( = ?auto_78604 ?auto_78607 ) ) ( not ( = ?auto_78604 ?auto_78608 ) ) ( not ( = ?auto_78605 ?auto_78606 ) ) ( not ( = ?auto_78605 ?auto_78607 ) ) ( not ( = ?auto_78605 ?auto_78608 ) ) ( not ( = ?auto_78606 ?auto_78607 ) ) ( not ( = ?auto_78606 ?auto_78608 ) ) ( not ( = ?auto_78607 ?auto_78608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78608 ?auto_78607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78610 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_78610 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_78610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78611 - BLOCK
    )
    :vars
    (
      ?auto_78612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78611 ?auto_78612 ) ( CLEAR ?auto_78611 ) ( HAND-EMPTY ) ( not ( = ?auto_78611 ?auto_78612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78611 ?auto_78612 )
      ( MAKE-1PILE ?auto_78611 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78619 - BLOCK
      ?auto_78620 - BLOCK
      ?auto_78621 - BLOCK
      ?auto_78622 - BLOCK
      ?auto_78623 - BLOCK
      ?auto_78624 - BLOCK
    )
    :vars
    (
      ?auto_78625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78625 ?auto_78624 ) ( CLEAR ?auto_78625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78619 ) ( ON ?auto_78620 ?auto_78619 ) ( ON ?auto_78621 ?auto_78620 ) ( ON ?auto_78622 ?auto_78621 ) ( ON ?auto_78623 ?auto_78622 ) ( ON ?auto_78624 ?auto_78623 ) ( not ( = ?auto_78619 ?auto_78620 ) ) ( not ( = ?auto_78619 ?auto_78621 ) ) ( not ( = ?auto_78619 ?auto_78622 ) ) ( not ( = ?auto_78619 ?auto_78623 ) ) ( not ( = ?auto_78619 ?auto_78624 ) ) ( not ( = ?auto_78619 ?auto_78625 ) ) ( not ( = ?auto_78620 ?auto_78621 ) ) ( not ( = ?auto_78620 ?auto_78622 ) ) ( not ( = ?auto_78620 ?auto_78623 ) ) ( not ( = ?auto_78620 ?auto_78624 ) ) ( not ( = ?auto_78620 ?auto_78625 ) ) ( not ( = ?auto_78621 ?auto_78622 ) ) ( not ( = ?auto_78621 ?auto_78623 ) ) ( not ( = ?auto_78621 ?auto_78624 ) ) ( not ( = ?auto_78621 ?auto_78625 ) ) ( not ( = ?auto_78622 ?auto_78623 ) ) ( not ( = ?auto_78622 ?auto_78624 ) ) ( not ( = ?auto_78622 ?auto_78625 ) ) ( not ( = ?auto_78623 ?auto_78624 ) ) ( not ( = ?auto_78623 ?auto_78625 ) ) ( not ( = ?auto_78624 ?auto_78625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78625 ?auto_78624 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78626 - BLOCK
      ?auto_78627 - BLOCK
      ?auto_78628 - BLOCK
      ?auto_78629 - BLOCK
      ?auto_78630 - BLOCK
      ?auto_78631 - BLOCK
    )
    :vars
    (
      ?auto_78632 - BLOCK
      ?auto_78633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78632 ?auto_78631 ) ( CLEAR ?auto_78632 ) ( ON-TABLE ?auto_78626 ) ( ON ?auto_78627 ?auto_78626 ) ( ON ?auto_78628 ?auto_78627 ) ( ON ?auto_78629 ?auto_78628 ) ( ON ?auto_78630 ?auto_78629 ) ( ON ?auto_78631 ?auto_78630 ) ( not ( = ?auto_78626 ?auto_78627 ) ) ( not ( = ?auto_78626 ?auto_78628 ) ) ( not ( = ?auto_78626 ?auto_78629 ) ) ( not ( = ?auto_78626 ?auto_78630 ) ) ( not ( = ?auto_78626 ?auto_78631 ) ) ( not ( = ?auto_78626 ?auto_78632 ) ) ( not ( = ?auto_78627 ?auto_78628 ) ) ( not ( = ?auto_78627 ?auto_78629 ) ) ( not ( = ?auto_78627 ?auto_78630 ) ) ( not ( = ?auto_78627 ?auto_78631 ) ) ( not ( = ?auto_78627 ?auto_78632 ) ) ( not ( = ?auto_78628 ?auto_78629 ) ) ( not ( = ?auto_78628 ?auto_78630 ) ) ( not ( = ?auto_78628 ?auto_78631 ) ) ( not ( = ?auto_78628 ?auto_78632 ) ) ( not ( = ?auto_78629 ?auto_78630 ) ) ( not ( = ?auto_78629 ?auto_78631 ) ) ( not ( = ?auto_78629 ?auto_78632 ) ) ( not ( = ?auto_78630 ?auto_78631 ) ) ( not ( = ?auto_78630 ?auto_78632 ) ) ( not ( = ?auto_78631 ?auto_78632 ) ) ( HOLDING ?auto_78633 ) ( not ( = ?auto_78626 ?auto_78633 ) ) ( not ( = ?auto_78627 ?auto_78633 ) ) ( not ( = ?auto_78628 ?auto_78633 ) ) ( not ( = ?auto_78629 ?auto_78633 ) ) ( not ( = ?auto_78630 ?auto_78633 ) ) ( not ( = ?auto_78631 ?auto_78633 ) ) ( not ( = ?auto_78632 ?auto_78633 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_78633 )
      ( MAKE-6PILE ?auto_78626 ?auto_78627 ?auto_78628 ?auto_78629 ?auto_78630 ?auto_78631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78634 - BLOCK
      ?auto_78635 - BLOCK
      ?auto_78636 - BLOCK
      ?auto_78637 - BLOCK
      ?auto_78638 - BLOCK
      ?auto_78639 - BLOCK
    )
    :vars
    (
      ?auto_78640 - BLOCK
      ?auto_78641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78640 ?auto_78639 ) ( ON-TABLE ?auto_78634 ) ( ON ?auto_78635 ?auto_78634 ) ( ON ?auto_78636 ?auto_78635 ) ( ON ?auto_78637 ?auto_78636 ) ( ON ?auto_78638 ?auto_78637 ) ( ON ?auto_78639 ?auto_78638 ) ( not ( = ?auto_78634 ?auto_78635 ) ) ( not ( = ?auto_78634 ?auto_78636 ) ) ( not ( = ?auto_78634 ?auto_78637 ) ) ( not ( = ?auto_78634 ?auto_78638 ) ) ( not ( = ?auto_78634 ?auto_78639 ) ) ( not ( = ?auto_78634 ?auto_78640 ) ) ( not ( = ?auto_78635 ?auto_78636 ) ) ( not ( = ?auto_78635 ?auto_78637 ) ) ( not ( = ?auto_78635 ?auto_78638 ) ) ( not ( = ?auto_78635 ?auto_78639 ) ) ( not ( = ?auto_78635 ?auto_78640 ) ) ( not ( = ?auto_78636 ?auto_78637 ) ) ( not ( = ?auto_78636 ?auto_78638 ) ) ( not ( = ?auto_78636 ?auto_78639 ) ) ( not ( = ?auto_78636 ?auto_78640 ) ) ( not ( = ?auto_78637 ?auto_78638 ) ) ( not ( = ?auto_78637 ?auto_78639 ) ) ( not ( = ?auto_78637 ?auto_78640 ) ) ( not ( = ?auto_78638 ?auto_78639 ) ) ( not ( = ?auto_78638 ?auto_78640 ) ) ( not ( = ?auto_78639 ?auto_78640 ) ) ( not ( = ?auto_78634 ?auto_78641 ) ) ( not ( = ?auto_78635 ?auto_78641 ) ) ( not ( = ?auto_78636 ?auto_78641 ) ) ( not ( = ?auto_78637 ?auto_78641 ) ) ( not ( = ?auto_78638 ?auto_78641 ) ) ( not ( = ?auto_78639 ?auto_78641 ) ) ( not ( = ?auto_78640 ?auto_78641 ) ) ( ON ?auto_78641 ?auto_78640 ) ( CLEAR ?auto_78641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78634 ?auto_78635 ?auto_78636 ?auto_78637 ?auto_78638 ?auto_78639 ?auto_78640 )
      ( MAKE-6PILE ?auto_78634 ?auto_78635 ?auto_78636 ?auto_78637 ?auto_78638 ?auto_78639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78644 - BLOCK
      ?auto_78645 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_78645 ) ( CLEAR ?auto_78644 ) ( ON-TABLE ?auto_78644 ) ( not ( = ?auto_78644 ?auto_78645 ) ) )
    :subtasks
    ( ( !STACK ?auto_78645 ?auto_78644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78646 - BLOCK
      ?auto_78647 - BLOCK
    )
    :vars
    (
      ?auto_78648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78646 ) ( ON-TABLE ?auto_78646 ) ( not ( = ?auto_78646 ?auto_78647 ) ) ( ON ?auto_78647 ?auto_78648 ) ( CLEAR ?auto_78647 ) ( HAND-EMPTY ) ( not ( = ?auto_78646 ?auto_78648 ) ) ( not ( = ?auto_78647 ?auto_78648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78647 ?auto_78648 )
      ( MAKE-2PILE ?auto_78646 ?auto_78647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78649 - BLOCK
      ?auto_78650 - BLOCK
    )
    :vars
    (
      ?auto_78651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78649 ?auto_78650 ) ) ( ON ?auto_78650 ?auto_78651 ) ( CLEAR ?auto_78650 ) ( not ( = ?auto_78649 ?auto_78651 ) ) ( not ( = ?auto_78650 ?auto_78651 ) ) ( HOLDING ?auto_78649 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78649 )
      ( MAKE-2PILE ?auto_78649 ?auto_78650 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78652 - BLOCK
      ?auto_78653 - BLOCK
    )
    :vars
    (
      ?auto_78654 - BLOCK
      ?auto_78655 - BLOCK
      ?auto_78659 - BLOCK
      ?auto_78658 - BLOCK
      ?auto_78657 - BLOCK
      ?auto_78656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78652 ?auto_78653 ) ) ( ON ?auto_78653 ?auto_78654 ) ( not ( = ?auto_78652 ?auto_78654 ) ) ( not ( = ?auto_78653 ?auto_78654 ) ) ( ON ?auto_78652 ?auto_78653 ) ( CLEAR ?auto_78652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78655 ) ( ON ?auto_78659 ?auto_78655 ) ( ON ?auto_78658 ?auto_78659 ) ( ON ?auto_78657 ?auto_78658 ) ( ON ?auto_78656 ?auto_78657 ) ( ON ?auto_78654 ?auto_78656 ) ( not ( = ?auto_78655 ?auto_78659 ) ) ( not ( = ?auto_78655 ?auto_78658 ) ) ( not ( = ?auto_78655 ?auto_78657 ) ) ( not ( = ?auto_78655 ?auto_78656 ) ) ( not ( = ?auto_78655 ?auto_78654 ) ) ( not ( = ?auto_78655 ?auto_78653 ) ) ( not ( = ?auto_78655 ?auto_78652 ) ) ( not ( = ?auto_78659 ?auto_78658 ) ) ( not ( = ?auto_78659 ?auto_78657 ) ) ( not ( = ?auto_78659 ?auto_78656 ) ) ( not ( = ?auto_78659 ?auto_78654 ) ) ( not ( = ?auto_78659 ?auto_78653 ) ) ( not ( = ?auto_78659 ?auto_78652 ) ) ( not ( = ?auto_78658 ?auto_78657 ) ) ( not ( = ?auto_78658 ?auto_78656 ) ) ( not ( = ?auto_78658 ?auto_78654 ) ) ( not ( = ?auto_78658 ?auto_78653 ) ) ( not ( = ?auto_78658 ?auto_78652 ) ) ( not ( = ?auto_78657 ?auto_78656 ) ) ( not ( = ?auto_78657 ?auto_78654 ) ) ( not ( = ?auto_78657 ?auto_78653 ) ) ( not ( = ?auto_78657 ?auto_78652 ) ) ( not ( = ?auto_78656 ?auto_78654 ) ) ( not ( = ?auto_78656 ?auto_78653 ) ) ( not ( = ?auto_78656 ?auto_78652 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78655 ?auto_78659 ?auto_78658 ?auto_78657 ?auto_78656 ?auto_78654 ?auto_78653 )
      ( MAKE-2PILE ?auto_78652 ?auto_78653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78665 - BLOCK
      ?auto_78666 - BLOCK
      ?auto_78667 - BLOCK
      ?auto_78668 - BLOCK
      ?auto_78669 - BLOCK
    )
    :vars
    (
      ?auto_78670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78670 ?auto_78669 ) ( CLEAR ?auto_78670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78665 ) ( ON ?auto_78666 ?auto_78665 ) ( ON ?auto_78667 ?auto_78666 ) ( ON ?auto_78668 ?auto_78667 ) ( ON ?auto_78669 ?auto_78668 ) ( not ( = ?auto_78665 ?auto_78666 ) ) ( not ( = ?auto_78665 ?auto_78667 ) ) ( not ( = ?auto_78665 ?auto_78668 ) ) ( not ( = ?auto_78665 ?auto_78669 ) ) ( not ( = ?auto_78665 ?auto_78670 ) ) ( not ( = ?auto_78666 ?auto_78667 ) ) ( not ( = ?auto_78666 ?auto_78668 ) ) ( not ( = ?auto_78666 ?auto_78669 ) ) ( not ( = ?auto_78666 ?auto_78670 ) ) ( not ( = ?auto_78667 ?auto_78668 ) ) ( not ( = ?auto_78667 ?auto_78669 ) ) ( not ( = ?auto_78667 ?auto_78670 ) ) ( not ( = ?auto_78668 ?auto_78669 ) ) ( not ( = ?auto_78668 ?auto_78670 ) ) ( not ( = ?auto_78669 ?auto_78670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78670 ?auto_78669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78671 - BLOCK
      ?auto_78672 - BLOCK
      ?auto_78673 - BLOCK
      ?auto_78674 - BLOCK
      ?auto_78675 - BLOCK
    )
    :vars
    (
      ?auto_78676 - BLOCK
      ?auto_78677 - BLOCK
      ?auto_78678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78676 ?auto_78675 ) ( CLEAR ?auto_78676 ) ( ON-TABLE ?auto_78671 ) ( ON ?auto_78672 ?auto_78671 ) ( ON ?auto_78673 ?auto_78672 ) ( ON ?auto_78674 ?auto_78673 ) ( ON ?auto_78675 ?auto_78674 ) ( not ( = ?auto_78671 ?auto_78672 ) ) ( not ( = ?auto_78671 ?auto_78673 ) ) ( not ( = ?auto_78671 ?auto_78674 ) ) ( not ( = ?auto_78671 ?auto_78675 ) ) ( not ( = ?auto_78671 ?auto_78676 ) ) ( not ( = ?auto_78672 ?auto_78673 ) ) ( not ( = ?auto_78672 ?auto_78674 ) ) ( not ( = ?auto_78672 ?auto_78675 ) ) ( not ( = ?auto_78672 ?auto_78676 ) ) ( not ( = ?auto_78673 ?auto_78674 ) ) ( not ( = ?auto_78673 ?auto_78675 ) ) ( not ( = ?auto_78673 ?auto_78676 ) ) ( not ( = ?auto_78674 ?auto_78675 ) ) ( not ( = ?auto_78674 ?auto_78676 ) ) ( not ( = ?auto_78675 ?auto_78676 ) ) ( HOLDING ?auto_78677 ) ( CLEAR ?auto_78678 ) ( not ( = ?auto_78671 ?auto_78677 ) ) ( not ( = ?auto_78671 ?auto_78678 ) ) ( not ( = ?auto_78672 ?auto_78677 ) ) ( not ( = ?auto_78672 ?auto_78678 ) ) ( not ( = ?auto_78673 ?auto_78677 ) ) ( not ( = ?auto_78673 ?auto_78678 ) ) ( not ( = ?auto_78674 ?auto_78677 ) ) ( not ( = ?auto_78674 ?auto_78678 ) ) ( not ( = ?auto_78675 ?auto_78677 ) ) ( not ( = ?auto_78675 ?auto_78678 ) ) ( not ( = ?auto_78676 ?auto_78677 ) ) ( not ( = ?auto_78676 ?auto_78678 ) ) ( not ( = ?auto_78677 ?auto_78678 ) ) )
    :subtasks
    ( ( !STACK ?auto_78677 ?auto_78678 )
      ( MAKE-5PILE ?auto_78671 ?auto_78672 ?auto_78673 ?auto_78674 ?auto_78675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78679 - BLOCK
      ?auto_78680 - BLOCK
      ?auto_78681 - BLOCK
      ?auto_78682 - BLOCK
      ?auto_78683 - BLOCK
    )
    :vars
    (
      ?auto_78685 - BLOCK
      ?auto_78686 - BLOCK
      ?auto_78684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78685 ?auto_78683 ) ( ON-TABLE ?auto_78679 ) ( ON ?auto_78680 ?auto_78679 ) ( ON ?auto_78681 ?auto_78680 ) ( ON ?auto_78682 ?auto_78681 ) ( ON ?auto_78683 ?auto_78682 ) ( not ( = ?auto_78679 ?auto_78680 ) ) ( not ( = ?auto_78679 ?auto_78681 ) ) ( not ( = ?auto_78679 ?auto_78682 ) ) ( not ( = ?auto_78679 ?auto_78683 ) ) ( not ( = ?auto_78679 ?auto_78685 ) ) ( not ( = ?auto_78680 ?auto_78681 ) ) ( not ( = ?auto_78680 ?auto_78682 ) ) ( not ( = ?auto_78680 ?auto_78683 ) ) ( not ( = ?auto_78680 ?auto_78685 ) ) ( not ( = ?auto_78681 ?auto_78682 ) ) ( not ( = ?auto_78681 ?auto_78683 ) ) ( not ( = ?auto_78681 ?auto_78685 ) ) ( not ( = ?auto_78682 ?auto_78683 ) ) ( not ( = ?auto_78682 ?auto_78685 ) ) ( not ( = ?auto_78683 ?auto_78685 ) ) ( CLEAR ?auto_78686 ) ( not ( = ?auto_78679 ?auto_78684 ) ) ( not ( = ?auto_78679 ?auto_78686 ) ) ( not ( = ?auto_78680 ?auto_78684 ) ) ( not ( = ?auto_78680 ?auto_78686 ) ) ( not ( = ?auto_78681 ?auto_78684 ) ) ( not ( = ?auto_78681 ?auto_78686 ) ) ( not ( = ?auto_78682 ?auto_78684 ) ) ( not ( = ?auto_78682 ?auto_78686 ) ) ( not ( = ?auto_78683 ?auto_78684 ) ) ( not ( = ?auto_78683 ?auto_78686 ) ) ( not ( = ?auto_78685 ?auto_78684 ) ) ( not ( = ?auto_78685 ?auto_78686 ) ) ( not ( = ?auto_78684 ?auto_78686 ) ) ( ON ?auto_78684 ?auto_78685 ) ( CLEAR ?auto_78684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78679 ?auto_78680 ?auto_78681 ?auto_78682 ?auto_78683 ?auto_78685 )
      ( MAKE-5PILE ?auto_78679 ?auto_78680 ?auto_78681 ?auto_78682 ?auto_78683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78687 - BLOCK
      ?auto_78688 - BLOCK
      ?auto_78689 - BLOCK
      ?auto_78690 - BLOCK
      ?auto_78691 - BLOCK
    )
    :vars
    (
      ?auto_78692 - BLOCK
      ?auto_78693 - BLOCK
      ?auto_78694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78692 ?auto_78691 ) ( ON-TABLE ?auto_78687 ) ( ON ?auto_78688 ?auto_78687 ) ( ON ?auto_78689 ?auto_78688 ) ( ON ?auto_78690 ?auto_78689 ) ( ON ?auto_78691 ?auto_78690 ) ( not ( = ?auto_78687 ?auto_78688 ) ) ( not ( = ?auto_78687 ?auto_78689 ) ) ( not ( = ?auto_78687 ?auto_78690 ) ) ( not ( = ?auto_78687 ?auto_78691 ) ) ( not ( = ?auto_78687 ?auto_78692 ) ) ( not ( = ?auto_78688 ?auto_78689 ) ) ( not ( = ?auto_78688 ?auto_78690 ) ) ( not ( = ?auto_78688 ?auto_78691 ) ) ( not ( = ?auto_78688 ?auto_78692 ) ) ( not ( = ?auto_78689 ?auto_78690 ) ) ( not ( = ?auto_78689 ?auto_78691 ) ) ( not ( = ?auto_78689 ?auto_78692 ) ) ( not ( = ?auto_78690 ?auto_78691 ) ) ( not ( = ?auto_78690 ?auto_78692 ) ) ( not ( = ?auto_78691 ?auto_78692 ) ) ( not ( = ?auto_78687 ?auto_78693 ) ) ( not ( = ?auto_78687 ?auto_78694 ) ) ( not ( = ?auto_78688 ?auto_78693 ) ) ( not ( = ?auto_78688 ?auto_78694 ) ) ( not ( = ?auto_78689 ?auto_78693 ) ) ( not ( = ?auto_78689 ?auto_78694 ) ) ( not ( = ?auto_78690 ?auto_78693 ) ) ( not ( = ?auto_78690 ?auto_78694 ) ) ( not ( = ?auto_78691 ?auto_78693 ) ) ( not ( = ?auto_78691 ?auto_78694 ) ) ( not ( = ?auto_78692 ?auto_78693 ) ) ( not ( = ?auto_78692 ?auto_78694 ) ) ( not ( = ?auto_78693 ?auto_78694 ) ) ( ON ?auto_78693 ?auto_78692 ) ( CLEAR ?auto_78693 ) ( HOLDING ?auto_78694 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78694 )
      ( MAKE-5PILE ?auto_78687 ?auto_78688 ?auto_78689 ?auto_78690 ?auto_78691 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78695 - BLOCK
      ?auto_78696 - BLOCK
      ?auto_78697 - BLOCK
      ?auto_78698 - BLOCK
      ?auto_78699 - BLOCK
    )
    :vars
    (
      ?auto_78701 - BLOCK
      ?auto_78702 - BLOCK
      ?auto_78700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78701 ?auto_78699 ) ( ON-TABLE ?auto_78695 ) ( ON ?auto_78696 ?auto_78695 ) ( ON ?auto_78697 ?auto_78696 ) ( ON ?auto_78698 ?auto_78697 ) ( ON ?auto_78699 ?auto_78698 ) ( not ( = ?auto_78695 ?auto_78696 ) ) ( not ( = ?auto_78695 ?auto_78697 ) ) ( not ( = ?auto_78695 ?auto_78698 ) ) ( not ( = ?auto_78695 ?auto_78699 ) ) ( not ( = ?auto_78695 ?auto_78701 ) ) ( not ( = ?auto_78696 ?auto_78697 ) ) ( not ( = ?auto_78696 ?auto_78698 ) ) ( not ( = ?auto_78696 ?auto_78699 ) ) ( not ( = ?auto_78696 ?auto_78701 ) ) ( not ( = ?auto_78697 ?auto_78698 ) ) ( not ( = ?auto_78697 ?auto_78699 ) ) ( not ( = ?auto_78697 ?auto_78701 ) ) ( not ( = ?auto_78698 ?auto_78699 ) ) ( not ( = ?auto_78698 ?auto_78701 ) ) ( not ( = ?auto_78699 ?auto_78701 ) ) ( not ( = ?auto_78695 ?auto_78702 ) ) ( not ( = ?auto_78695 ?auto_78700 ) ) ( not ( = ?auto_78696 ?auto_78702 ) ) ( not ( = ?auto_78696 ?auto_78700 ) ) ( not ( = ?auto_78697 ?auto_78702 ) ) ( not ( = ?auto_78697 ?auto_78700 ) ) ( not ( = ?auto_78698 ?auto_78702 ) ) ( not ( = ?auto_78698 ?auto_78700 ) ) ( not ( = ?auto_78699 ?auto_78702 ) ) ( not ( = ?auto_78699 ?auto_78700 ) ) ( not ( = ?auto_78701 ?auto_78702 ) ) ( not ( = ?auto_78701 ?auto_78700 ) ) ( not ( = ?auto_78702 ?auto_78700 ) ) ( ON ?auto_78702 ?auto_78701 ) ( ON ?auto_78700 ?auto_78702 ) ( CLEAR ?auto_78700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78695 ?auto_78696 ?auto_78697 ?auto_78698 ?auto_78699 ?auto_78701 ?auto_78702 )
      ( MAKE-5PILE ?auto_78695 ?auto_78696 ?auto_78697 ?auto_78698 ?auto_78699 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78706 - BLOCK
      ?auto_78707 - BLOCK
      ?auto_78708 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_78708 ) ( CLEAR ?auto_78707 ) ( ON-TABLE ?auto_78706 ) ( ON ?auto_78707 ?auto_78706 ) ( not ( = ?auto_78706 ?auto_78707 ) ) ( not ( = ?auto_78706 ?auto_78708 ) ) ( not ( = ?auto_78707 ?auto_78708 ) ) )
    :subtasks
    ( ( !STACK ?auto_78708 ?auto_78707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78709 - BLOCK
      ?auto_78710 - BLOCK
      ?auto_78711 - BLOCK
    )
    :vars
    (
      ?auto_78712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78710 ) ( ON-TABLE ?auto_78709 ) ( ON ?auto_78710 ?auto_78709 ) ( not ( = ?auto_78709 ?auto_78710 ) ) ( not ( = ?auto_78709 ?auto_78711 ) ) ( not ( = ?auto_78710 ?auto_78711 ) ) ( ON ?auto_78711 ?auto_78712 ) ( CLEAR ?auto_78711 ) ( HAND-EMPTY ) ( not ( = ?auto_78709 ?auto_78712 ) ) ( not ( = ?auto_78710 ?auto_78712 ) ) ( not ( = ?auto_78711 ?auto_78712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78711 ?auto_78712 )
      ( MAKE-3PILE ?auto_78709 ?auto_78710 ?auto_78711 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78713 - BLOCK
      ?auto_78714 - BLOCK
      ?auto_78715 - BLOCK
    )
    :vars
    (
      ?auto_78716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78713 ) ( not ( = ?auto_78713 ?auto_78714 ) ) ( not ( = ?auto_78713 ?auto_78715 ) ) ( not ( = ?auto_78714 ?auto_78715 ) ) ( ON ?auto_78715 ?auto_78716 ) ( CLEAR ?auto_78715 ) ( not ( = ?auto_78713 ?auto_78716 ) ) ( not ( = ?auto_78714 ?auto_78716 ) ) ( not ( = ?auto_78715 ?auto_78716 ) ) ( HOLDING ?auto_78714 ) ( CLEAR ?auto_78713 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78713 ?auto_78714 )
      ( MAKE-3PILE ?auto_78713 ?auto_78714 ?auto_78715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78717 - BLOCK
      ?auto_78718 - BLOCK
      ?auto_78719 - BLOCK
    )
    :vars
    (
      ?auto_78720 - BLOCK
      ?auto_78722 - BLOCK
      ?auto_78724 - BLOCK
      ?auto_78721 - BLOCK
      ?auto_78723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78717 ) ( not ( = ?auto_78717 ?auto_78718 ) ) ( not ( = ?auto_78717 ?auto_78719 ) ) ( not ( = ?auto_78718 ?auto_78719 ) ) ( ON ?auto_78719 ?auto_78720 ) ( not ( = ?auto_78717 ?auto_78720 ) ) ( not ( = ?auto_78718 ?auto_78720 ) ) ( not ( = ?auto_78719 ?auto_78720 ) ) ( CLEAR ?auto_78717 ) ( ON ?auto_78718 ?auto_78719 ) ( CLEAR ?auto_78718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78722 ) ( ON ?auto_78724 ?auto_78722 ) ( ON ?auto_78721 ?auto_78724 ) ( ON ?auto_78723 ?auto_78721 ) ( ON ?auto_78720 ?auto_78723 ) ( not ( = ?auto_78722 ?auto_78724 ) ) ( not ( = ?auto_78722 ?auto_78721 ) ) ( not ( = ?auto_78722 ?auto_78723 ) ) ( not ( = ?auto_78722 ?auto_78720 ) ) ( not ( = ?auto_78722 ?auto_78719 ) ) ( not ( = ?auto_78722 ?auto_78718 ) ) ( not ( = ?auto_78724 ?auto_78721 ) ) ( not ( = ?auto_78724 ?auto_78723 ) ) ( not ( = ?auto_78724 ?auto_78720 ) ) ( not ( = ?auto_78724 ?auto_78719 ) ) ( not ( = ?auto_78724 ?auto_78718 ) ) ( not ( = ?auto_78721 ?auto_78723 ) ) ( not ( = ?auto_78721 ?auto_78720 ) ) ( not ( = ?auto_78721 ?auto_78719 ) ) ( not ( = ?auto_78721 ?auto_78718 ) ) ( not ( = ?auto_78723 ?auto_78720 ) ) ( not ( = ?auto_78723 ?auto_78719 ) ) ( not ( = ?auto_78723 ?auto_78718 ) ) ( not ( = ?auto_78717 ?auto_78722 ) ) ( not ( = ?auto_78717 ?auto_78724 ) ) ( not ( = ?auto_78717 ?auto_78721 ) ) ( not ( = ?auto_78717 ?auto_78723 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78722 ?auto_78724 ?auto_78721 ?auto_78723 ?auto_78720 ?auto_78719 )
      ( MAKE-3PILE ?auto_78717 ?auto_78718 ?auto_78719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78725 - BLOCK
      ?auto_78726 - BLOCK
      ?auto_78727 - BLOCK
    )
    :vars
    (
      ?auto_78728 - BLOCK
      ?auto_78730 - BLOCK
      ?auto_78729 - BLOCK
      ?auto_78731 - BLOCK
      ?auto_78732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78725 ?auto_78726 ) ) ( not ( = ?auto_78725 ?auto_78727 ) ) ( not ( = ?auto_78726 ?auto_78727 ) ) ( ON ?auto_78727 ?auto_78728 ) ( not ( = ?auto_78725 ?auto_78728 ) ) ( not ( = ?auto_78726 ?auto_78728 ) ) ( not ( = ?auto_78727 ?auto_78728 ) ) ( ON ?auto_78726 ?auto_78727 ) ( CLEAR ?auto_78726 ) ( ON-TABLE ?auto_78730 ) ( ON ?auto_78729 ?auto_78730 ) ( ON ?auto_78731 ?auto_78729 ) ( ON ?auto_78732 ?auto_78731 ) ( ON ?auto_78728 ?auto_78732 ) ( not ( = ?auto_78730 ?auto_78729 ) ) ( not ( = ?auto_78730 ?auto_78731 ) ) ( not ( = ?auto_78730 ?auto_78732 ) ) ( not ( = ?auto_78730 ?auto_78728 ) ) ( not ( = ?auto_78730 ?auto_78727 ) ) ( not ( = ?auto_78730 ?auto_78726 ) ) ( not ( = ?auto_78729 ?auto_78731 ) ) ( not ( = ?auto_78729 ?auto_78732 ) ) ( not ( = ?auto_78729 ?auto_78728 ) ) ( not ( = ?auto_78729 ?auto_78727 ) ) ( not ( = ?auto_78729 ?auto_78726 ) ) ( not ( = ?auto_78731 ?auto_78732 ) ) ( not ( = ?auto_78731 ?auto_78728 ) ) ( not ( = ?auto_78731 ?auto_78727 ) ) ( not ( = ?auto_78731 ?auto_78726 ) ) ( not ( = ?auto_78732 ?auto_78728 ) ) ( not ( = ?auto_78732 ?auto_78727 ) ) ( not ( = ?auto_78732 ?auto_78726 ) ) ( not ( = ?auto_78725 ?auto_78730 ) ) ( not ( = ?auto_78725 ?auto_78729 ) ) ( not ( = ?auto_78725 ?auto_78731 ) ) ( not ( = ?auto_78725 ?auto_78732 ) ) ( HOLDING ?auto_78725 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78725 )
      ( MAKE-3PILE ?auto_78725 ?auto_78726 ?auto_78727 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78733 - BLOCK
      ?auto_78734 - BLOCK
      ?auto_78735 - BLOCK
    )
    :vars
    (
      ?auto_78737 - BLOCK
      ?auto_78739 - BLOCK
      ?auto_78738 - BLOCK
      ?auto_78740 - BLOCK
      ?auto_78736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78733 ?auto_78734 ) ) ( not ( = ?auto_78733 ?auto_78735 ) ) ( not ( = ?auto_78734 ?auto_78735 ) ) ( ON ?auto_78735 ?auto_78737 ) ( not ( = ?auto_78733 ?auto_78737 ) ) ( not ( = ?auto_78734 ?auto_78737 ) ) ( not ( = ?auto_78735 ?auto_78737 ) ) ( ON ?auto_78734 ?auto_78735 ) ( ON-TABLE ?auto_78739 ) ( ON ?auto_78738 ?auto_78739 ) ( ON ?auto_78740 ?auto_78738 ) ( ON ?auto_78736 ?auto_78740 ) ( ON ?auto_78737 ?auto_78736 ) ( not ( = ?auto_78739 ?auto_78738 ) ) ( not ( = ?auto_78739 ?auto_78740 ) ) ( not ( = ?auto_78739 ?auto_78736 ) ) ( not ( = ?auto_78739 ?auto_78737 ) ) ( not ( = ?auto_78739 ?auto_78735 ) ) ( not ( = ?auto_78739 ?auto_78734 ) ) ( not ( = ?auto_78738 ?auto_78740 ) ) ( not ( = ?auto_78738 ?auto_78736 ) ) ( not ( = ?auto_78738 ?auto_78737 ) ) ( not ( = ?auto_78738 ?auto_78735 ) ) ( not ( = ?auto_78738 ?auto_78734 ) ) ( not ( = ?auto_78740 ?auto_78736 ) ) ( not ( = ?auto_78740 ?auto_78737 ) ) ( not ( = ?auto_78740 ?auto_78735 ) ) ( not ( = ?auto_78740 ?auto_78734 ) ) ( not ( = ?auto_78736 ?auto_78737 ) ) ( not ( = ?auto_78736 ?auto_78735 ) ) ( not ( = ?auto_78736 ?auto_78734 ) ) ( not ( = ?auto_78733 ?auto_78739 ) ) ( not ( = ?auto_78733 ?auto_78738 ) ) ( not ( = ?auto_78733 ?auto_78740 ) ) ( not ( = ?auto_78733 ?auto_78736 ) ) ( ON ?auto_78733 ?auto_78734 ) ( CLEAR ?auto_78733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78739 ?auto_78738 ?auto_78740 ?auto_78736 ?auto_78737 ?auto_78735 ?auto_78734 )
      ( MAKE-3PILE ?auto_78733 ?auto_78734 ?auto_78735 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78745 - BLOCK
      ?auto_78746 - BLOCK
      ?auto_78747 - BLOCK
      ?auto_78748 - BLOCK
    )
    :vars
    (
      ?auto_78749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78749 ?auto_78748 ) ( CLEAR ?auto_78749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78745 ) ( ON ?auto_78746 ?auto_78745 ) ( ON ?auto_78747 ?auto_78746 ) ( ON ?auto_78748 ?auto_78747 ) ( not ( = ?auto_78745 ?auto_78746 ) ) ( not ( = ?auto_78745 ?auto_78747 ) ) ( not ( = ?auto_78745 ?auto_78748 ) ) ( not ( = ?auto_78745 ?auto_78749 ) ) ( not ( = ?auto_78746 ?auto_78747 ) ) ( not ( = ?auto_78746 ?auto_78748 ) ) ( not ( = ?auto_78746 ?auto_78749 ) ) ( not ( = ?auto_78747 ?auto_78748 ) ) ( not ( = ?auto_78747 ?auto_78749 ) ) ( not ( = ?auto_78748 ?auto_78749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78749 ?auto_78748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78750 - BLOCK
      ?auto_78751 - BLOCK
      ?auto_78752 - BLOCK
      ?auto_78753 - BLOCK
    )
    :vars
    (
      ?auto_78754 - BLOCK
      ?auto_78755 - BLOCK
      ?auto_78756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78754 ?auto_78753 ) ( CLEAR ?auto_78754 ) ( ON-TABLE ?auto_78750 ) ( ON ?auto_78751 ?auto_78750 ) ( ON ?auto_78752 ?auto_78751 ) ( ON ?auto_78753 ?auto_78752 ) ( not ( = ?auto_78750 ?auto_78751 ) ) ( not ( = ?auto_78750 ?auto_78752 ) ) ( not ( = ?auto_78750 ?auto_78753 ) ) ( not ( = ?auto_78750 ?auto_78754 ) ) ( not ( = ?auto_78751 ?auto_78752 ) ) ( not ( = ?auto_78751 ?auto_78753 ) ) ( not ( = ?auto_78751 ?auto_78754 ) ) ( not ( = ?auto_78752 ?auto_78753 ) ) ( not ( = ?auto_78752 ?auto_78754 ) ) ( not ( = ?auto_78753 ?auto_78754 ) ) ( HOLDING ?auto_78755 ) ( CLEAR ?auto_78756 ) ( not ( = ?auto_78750 ?auto_78755 ) ) ( not ( = ?auto_78750 ?auto_78756 ) ) ( not ( = ?auto_78751 ?auto_78755 ) ) ( not ( = ?auto_78751 ?auto_78756 ) ) ( not ( = ?auto_78752 ?auto_78755 ) ) ( not ( = ?auto_78752 ?auto_78756 ) ) ( not ( = ?auto_78753 ?auto_78755 ) ) ( not ( = ?auto_78753 ?auto_78756 ) ) ( not ( = ?auto_78754 ?auto_78755 ) ) ( not ( = ?auto_78754 ?auto_78756 ) ) ( not ( = ?auto_78755 ?auto_78756 ) ) )
    :subtasks
    ( ( !STACK ?auto_78755 ?auto_78756 )
      ( MAKE-4PILE ?auto_78750 ?auto_78751 ?auto_78752 ?auto_78753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78757 - BLOCK
      ?auto_78758 - BLOCK
      ?auto_78759 - BLOCK
      ?auto_78760 - BLOCK
    )
    :vars
    (
      ?auto_78761 - BLOCK
      ?auto_78762 - BLOCK
      ?auto_78763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78761 ?auto_78760 ) ( ON-TABLE ?auto_78757 ) ( ON ?auto_78758 ?auto_78757 ) ( ON ?auto_78759 ?auto_78758 ) ( ON ?auto_78760 ?auto_78759 ) ( not ( = ?auto_78757 ?auto_78758 ) ) ( not ( = ?auto_78757 ?auto_78759 ) ) ( not ( = ?auto_78757 ?auto_78760 ) ) ( not ( = ?auto_78757 ?auto_78761 ) ) ( not ( = ?auto_78758 ?auto_78759 ) ) ( not ( = ?auto_78758 ?auto_78760 ) ) ( not ( = ?auto_78758 ?auto_78761 ) ) ( not ( = ?auto_78759 ?auto_78760 ) ) ( not ( = ?auto_78759 ?auto_78761 ) ) ( not ( = ?auto_78760 ?auto_78761 ) ) ( CLEAR ?auto_78762 ) ( not ( = ?auto_78757 ?auto_78763 ) ) ( not ( = ?auto_78757 ?auto_78762 ) ) ( not ( = ?auto_78758 ?auto_78763 ) ) ( not ( = ?auto_78758 ?auto_78762 ) ) ( not ( = ?auto_78759 ?auto_78763 ) ) ( not ( = ?auto_78759 ?auto_78762 ) ) ( not ( = ?auto_78760 ?auto_78763 ) ) ( not ( = ?auto_78760 ?auto_78762 ) ) ( not ( = ?auto_78761 ?auto_78763 ) ) ( not ( = ?auto_78761 ?auto_78762 ) ) ( not ( = ?auto_78763 ?auto_78762 ) ) ( ON ?auto_78763 ?auto_78761 ) ( CLEAR ?auto_78763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78757 ?auto_78758 ?auto_78759 ?auto_78760 ?auto_78761 )
      ( MAKE-4PILE ?auto_78757 ?auto_78758 ?auto_78759 ?auto_78760 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78764 - BLOCK
      ?auto_78765 - BLOCK
      ?auto_78766 - BLOCK
      ?auto_78767 - BLOCK
    )
    :vars
    (
      ?auto_78768 - BLOCK
      ?auto_78769 - BLOCK
      ?auto_78770 - BLOCK
      ?auto_78771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78768 ?auto_78767 ) ( ON-TABLE ?auto_78764 ) ( ON ?auto_78765 ?auto_78764 ) ( ON ?auto_78766 ?auto_78765 ) ( ON ?auto_78767 ?auto_78766 ) ( not ( = ?auto_78764 ?auto_78765 ) ) ( not ( = ?auto_78764 ?auto_78766 ) ) ( not ( = ?auto_78764 ?auto_78767 ) ) ( not ( = ?auto_78764 ?auto_78768 ) ) ( not ( = ?auto_78765 ?auto_78766 ) ) ( not ( = ?auto_78765 ?auto_78767 ) ) ( not ( = ?auto_78765 ?auto_78768 ) ) ( not ( = ?auto_78766 ?auto_78767 ) ) ( not ( = ?auto_78766 ?auto_78768 ) ) ( not ( = ?auto_78767 ?auto_78768 ) ) ( not ( = ?auto_78764 ?auto_78769 ) ) ( not ( = ?auto_78764 ?auto_78770 ) ) ( not ( = ?auto_78765 ?auto_78769 ) ) ( not ( = ?auto_78765 ?auto_78770 ) ) ( not ( = ?auto_78766 ?auto_78769 ) ) ( not ( = ?auto_78766 ?auto_78770 ) ) ( not ( = ?auto_78767 ?auto_78769 ) ) ( not ( = ?auto_78767 ?auto_78770 ) ) ( not ( = ?auto_78768 ?auto_78769 ) ) ( not ( = ?auto_78768 ?auto_78770 ) ) ( not ( = ?auto_78769 ?auto_78770 ) ) ( ON ?auto_78769 ?auto_78768 ) ( CLEAR ?auto_78769 ) ( HOLDING ?auto_78770 ) ( CLEAR ?auto_78771 ) ( ON-TABLE ?auto_78771 ) ( not ( = ?auto_78771 ?auto_78770 ) ) ( not ( = ?auto_78764 ?auto_78771 ) ) ( not ( = ?auto_78765 ?auto_78771 ) ) ( not ( = ?auto_78766 ?auto_78771 ) ) ( not ( = ?auto_78767 ?auto_78771 ) ) ( not ( = ?auto_78768 ?auto_78771 ) ) ( not ( = ?auto_78769 ?auto_78771 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78771 ?auto_78770 )
      ( MAKE-4PILE ?auto_78764 ?auto_78765 ?auto_78766 ?auto_78767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78772 - BLOCK
      ?auto_78773 - BLOCK
      ?auto_78774 - BLOCK
      ?auto_78775 - BLOCK
    )
    :vars
    (
      ?auto_78777 - BLOCK
      ?auto_78779 - BLOCK
      ?auto_78778 - BLOCK
      ?auto_78776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78777 ?auto_78775 ) ( ON-TABLE ?auto_78772 ) ( ON ?auto_78773 ?auto_78772 ) ( ON ?auto_78774 ?auto_78773 ) ( ON ?auto_78775 ?auto_78774 ) ( not ( = ?auto_78772 ?auto_78773 ) ) ( not ( = ?auto_78772 ?auto_78774 ) ) ( not ( = ?auto_78772 ?auto_78775 ) ) ( not ( = ?auto_78772 ?auto_78777 ) ) ( not ( = ?auto_78773 ?auto_78774 ) ) ( not ( = ?auto_78773 ?auto_78775 ) ) ( not ( = ?auto_78773 ?auto_78777 ) ) ( not ( = ?auto_78774 ?auto_78775 ) ) ( not ( = ?auto_78774 ?auto_78777 ) ) ( not ( = ?auto_78775 ?auto_78777 ) ) ( not ( = ?auto_78772 ?auto_78779 ) ) ( not ( = ?auto_78772 ?auto_78778 ) ) ( not ( = ?auto_78773 ?auto_78779 ) ) ( not ( = ?auto_78773 ?auto_78778 ) ) ( not ( = ?auto_78774 ?auto_78779 ) ) ( not ( = ?auto_78774 ?auto_78778 ) ) ( not ( = ?auto_78775 ?auto_78779 ) ) ( not ( = ?auto_78775 ?auto_78778 ) ) ( not ( = ?auto_78777 ?auto_78779 ) ) ( not ( = ?auto_78777 ?auto_78778 ) ) ( not ( = ?auto_78779 ?auto_78778 ) ) ( ON ?auto_78779 ?auto_78777 ) ( CLEAR ?auto_78776 ) ( ON-TABLE ?auto_78776 ) ( not ( = ?auto_78776 ?auto_78778 ) ) ( not ( = ?auto_78772 ?auto_78776 ) ) ( not ( = ?auto_78773 ?auto_78776 ) ) ( not ( = ?auto_78774 ?auto_78776 ) ) ( not ( = ?auto_78775 ?auto_78776 ) ) ( not ( = ?auto_78777 ?auto_78776 ) ) ( not ( = ?auto_78779 ?auto_78776 ) ) ( ON ?auto_78778 ?auto_78779 ) ( CLEAR ?auto_78778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78772 ?auto_78773 ?auto_78774 ?auto_78775 ?auto_78777 ?auto_78779 )
      ( MAKE-4PILE ?auto_78772 ?auto_78773 ?auto_78774 ?auto_78775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78780 - BLOCK
      ?auto_78781 - BLOCK
      ?auto_78782 - BLOCK
      ?auto_78783 - BLOCK
    )
    :vars
    (
      ?auto_78787 - BLOCK
      ?auto_78786 - BLOCK
      ?auto_78784 - BLOCK
      ?auto_78785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78787 ?auto_78783 ) ( ON-TABLE ?auto_78780 ) ( ON ?auto_78781 ?auto_78780 ) ( ON ?auto_78782 ?auto_78781 ) ( ON ?auto_78783 ?auto_78782 ) ( not ( = ?auto_78780 ?auto_78781 ) ) ( not ( = ?auto_78780 ?auto_78782 ) ) ( not ( = ?auto_78780 ?auto_78783 ) ) ( not ( = ?auto_78780 ?auto_78787 ) ) ( not ( = ?auto_78781 ?auto_78782 ) ) ( not ( = ?auto_78781 ?auto_78783 ) ) ( not ( = ?auto_78781 ?auto_78787 ) ) ( not ( = ?auto_78782 ?auto_78783 ) ) ( not ( = ?auto_78782 ?auto_78787 ) ) ( not ( = ?auto_78783 ?auto_78787 ) ) ( not ( = ?auto_78780 ?auto_78786 ) ) ( not ( = ?auto_78780 ?auto_78784 ) ) ( not ( = ?auto_78781 ?auto_78786 ) ) ( not ( = ?auto_78781 ?auto_78784 ) ) ( not ( = ?auto_78782 ?auto_78786 ) ) ( not ( = ?auto_78782 ?auto_78784 ) ) ( not ( = ?auto_78783 ?auto_78786 ) ) ( not ( = ?auto_78783 ?auto_78784 ) ) ( not ( = ?auto_78787 ?auto_78786 ) ) ( not ( = ?auto_78787 ?auto_78784 ) ) ( not ( = ?auto_78786 ?auto_78784 ) ) ( ON ?auto_78786 ?auto_78787 ) ( not ( = ?auto_78785 ?auto_78784 ) ) ( not ( = ?auto_78780 ?auto_78785 ) ) ( not ( = ?auto_78781 ?auto_78785 ) ) ( not ( = ?auto_78782 ?auto_78785 ) ) ( not ( = ?auto_78783 ?auto_78785 ) ) ( not ( = ?auto_78787 ?auto_78785 ) ) ( not ( = ?auto_78786 ?auto_78785 ) ) ( ON ?auto_78784 ?auto_78786 ) ( CLEAR ?auto_78784 ) ( HOLDING ?auto_78785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78785 )
      ( MAKE-4PILE ?auto_78780 ?auto_78781 ?auto_78782 ?auto_78783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78788 - BLOCK
      ?auto_78789 - BLOCK
      ?auto_78790 - BLOCK
      ?auto_78791 - BLOCK
    )
    :vars
    (
      ?auto_78792 - BLOCK
      ?auto_78795 - BLOCK
      ?auto_78794 - BLOCK
      ?auto_78793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78792 ?auto_78791 ) ( ON-TABLE ?auto_78788 ) ( ON ?auto_78789 ?auto_78788 ) ( ON ?auto_78790 ?auto_78789 ) ( ON ?auto_78791 ?auto_78790 ) ( not ( = ?auto_78788 ?auto_78789 ) ) ( not ( = ?auto_78788 ?auto_78790 ) ) ( not ( = ?auto_78788 ?auto_78791 ) ) ( not ( = ?auto_78788 ?auto_78792 ) ) ( not ( = ?auto_78789 ?auto_78790 ) ) ( not ( = ?auto_78789 ?auto_78791 ) ) ( not ( = ?auto_78789 ?auto_78792 ) ) ( not ( = ?auto_78790 ?auto_78791 ) ) ( not ( = ?auto_78790 ?auto_78792 ) ) ( not ( = ?auto_78791 ?auto_78792 ) ) ( not ( = ?auto_78788 ?auto_78795 ) ) ( not ( = ?auto_78788 ?auto_78794 ) ) ( not ( = ?auto_78789 ?auto_78795 ) ) ( not ( = ?auto_78789 ?auto_78794 ) ) ( not ( = ?auto_78790 ?auto_78795 ) ) ( not ( = ?auto_78790 ?auto_78794 ) ) ( not ( = ?auto_78791 ?auto_78795 ) ) ( not ( = ?auto_78791 ?auto_78794 ) ) ( not ( = ?auto_78792 ?auto_78795 ) ) ( not ( = ?auto_78792 ?auto_78794 ) ) ( not ( = ?auto_78795 ?auto_78794 ) ) ( ON ?auto_78795 ?auto_78792 ) ( not ( = ?auto_78793 ?auto_78794 ) ) ( not ( = ?auto_78788 ?auto_78793 ) ) ( not ( = ?auto_78789 ?auto_78793 ) ) ( not ( = ?auto_78790 ?auto_78793 ) ) ( not ( = ?auto_78791 ?auto_78793 ) ) ( not ( = ?auto_78792 ?auto_78793 ) ) ( not ( = ?auto_78795 ?auto_78793 ) ) ( ON ?auto_78794 ?auto_78795 ) ( ON ?auto_78793 ?auto_78794 ) ( CLEAR ?auto_78793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78788 ?auto_78789 ?auto_78790 ?auto_78791 ?auto_78792 ?auto_78795 ?auto_78794 )
      ( MAKE-4PILE ?auto_78788 ?auto_78789 ?auto_78790 ?auto_78791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78800 - BLOCK
      ?auto_78801 - BLOCK
      ?auto_78802 - BLOCK
      ?auto_78803 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_78803 ) ( CLEAR ?auto_78802 ) ( ON-TABLE ?auto_78800 ) ( ON ?auto_78801 ?auto_78800 ) ( ON ?auto_78802 ?auto_78801 ) ( not ( = ?auto_78800 ?auto_78801 ) ) ( not ( = ?auto_78800 ?auto_78802 ) ) ( not ( = ?auto_78800 ?auto_78803 ) ) ( not ( = ?auto_78801 ?auto_78802 ) ) ( not ( = ?auto_78801 ?auto_78803 ) ) ( not ( = ?auto_78802 ?auto_78803 ) ) )
    :subtasks
    ( ( !STACK ?auto_78803 ?auto_78802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78804 - BLOCK
      ?auto_78805 - BLOCK
      ?auto_78806 - BLOCK
      ?auto_78807 - BLOCK
    )
    :vars
    (
      ?auto_78808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78806 ) ( ON-TABLE ?auto_78804 ) ( ON ?auto_78805 ?auto_78804 ) ( ON ?auto_78806 ?auto_78805 ) ( not ( = ?auto_78804 ?auto_78805 ) ) ( not ( = ?auto_78804 ?auto_78806 ) ) ( not ( = ?auto_78804 ?auto_78807 ) ) ( not ( = ?auto_78805 ?auto_78806 ) ) ( not ( = ?auto_78805 ?auto_78807 ) ) ( not ( = ?auto_78806 ?auto_78807 ) ) ( ON ?auto_78807 ?auto_78808 ) ( CLEAR ?auto_78807 ) ( HAND-EMPTY ) ( not ( = ?auto_78804 ?auto_78808 ) ) ( not ( = ?auto_78805 ?auto_78808 ) ) ( not ( = ?auto_78806 ?auto_78808 ) ) ( not ( = ?auto_78807 ?auto_78808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78807 ?auto_78808 )
      ( MAKE-4PILE ?auto_78804 ?auto_78805 ?auto_78806 ?auto_78807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78809 - BLOCK
      ?auto_78810 - BLOCK
      ?auto_78811 - BLOCK
      ?auto_78812 - BLOCK
    )
    :vars
    (
      ?auto_78813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78809 ) ( ON ?auto_78810 ?auto_78809 ) ( not ( = ?auto_78809 ?auto_78810 ) ) ( not ( = ?auto_78809 ?auto_78811 ) ) ( not ( = ?auto_78809 ?auto_78812 ) ) ( not ( = ?auto_78810 ?auto_78811 ) ) ( not ( = ?auto_78810 ?auto_78812 ) ) ( not ( = ?auto_78811 ?auto_78812 ) ) ( ON ?auto_78812 ?auto_78813 ) ( CLEAR ?auto_78812 ) ( not ( = ?auto_78809 ?auto_78813 ) ) ( not ( = ?auto_78810 ?auto_78813 ) ) ( not ( = ?auto_78811 ?auto_78813 ) ) ( not ( = ?auto_78812 ?auto_78813 ) ) ( HOLDING ?auto_78811 ) ( CLEAR ?auto_78810 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78809 ?auto_78810 ?auto_78811 )
      ( MAKE-4PILE ?auto_78809 ?auto_78810 ?auto_78811 ?auto_78812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78814 - BLOCK
      ?auto_78815 - BLOCK
      ?auto_78816 - BLOCK
      ?auto_78817 - BLOCK
    )
    :vars
    (
      ?auto_78818 - BLOCK
      ?auto_78819 - BLOCK
      ?auto_78820 - BLOCK
      ?auto_78821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78814 ) ( ON ?auto_78815 ?auto_78814 ) ( not ( = ?auto_78814 ?auto_78815 ) ) ( not ( = ?auto_78814 ?auto_78816 ) ) ( not ( = ?auto_78814 ?auto_78817 ) ) ( not ( = ?auto_78815 ?auto_78816 ) ) ( not ( = ?auto_78815 ?auto_78817 ) ) ( not ( = ?auto_78816 ?auto_78817 ) ) ( ON ?auto_78817 ?auto_78818 ) ( not ( = ?auto_78814 ?auto_78818 ) ) ( not ( = ?auto_78815 ?auto_78818 ) ) ( not ( = ?auto_78816 ?auto_78818 ) ) ( not ( = ?auto_78817 ?auto_78818 ) ) ( CLEAR ?auto_78815 ) ( ON ?auto_78816 ?auto_78817 ) ( CLEAR ?auto_78816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78819 ) ( ON ?auto_78820 ?auto_78819 ) ( ON ?auto_78821 ?auto_78820 ) ( ON ?auto_78818 ?auto_78821 ) ( not ( = ?auto_78819 ?auto_78820 ) ) ( not ( = ?auto_78819 ?auto_78821 ) ) ( not ( = ?auto_78819 ?auto_78818 ) ) ( not ( = ?auto_78819 ?auto_78817 ) ) ( not ( = ?auto_78819 ?auto_78816 ) ) ( not ( = ?auto_78820 ?auto_78821 ) ) ( not ( = ?auto_78820 ?auto_78818 ) ) ( not ( = ?auto_78820 ?auto_78817 ) ) ( not ( = ?auto_78820 ?auto_78816 ) ) ( not ( = ?auto_78821 ?auto_78818 ) ) ( not ( = ?auto_78821 ?auto_78817 ) ) ( not ( = ?auto_78821 ?auto_78816 ) ) ( not ( = ?auto_78814 ?auto_78819 ) ) ( not ( = ?auto_78814 ?auto_78820 ) ) ( not ( = ?auto_78814 ?auto_78821 ) ) ( not ( = ?auto_78815 ?auto_78819 ) ) ( not ( = ?auto_78815 ?auto_78820 ) ) ( not ( = ?auto_78815 ?auto_78821 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78819 ?auto_78820 ?auto_78821 ?auto_78818 ?auto_78817 )
      ( MAKE-4PILE ?auto_78814 ?auto_78815 ?auto_78816 ?auto_78817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78822 - BLOCK
      ?auto_78823 - BLOCK
      ?auto_78824 - BLOCK
      ?auto_78825 - BLOCK
    )
    :vars
    (
      ?auto_78828 - BLOCK
      ?auto_78827 - BLOCK
      ?auto_78829 - BLOCK
      ?auto_78826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78822 ) ( not ( = ?auto_78822 ?auto_78823 ) ) ( not ( = ?auto_78822 ?auto_78824 ) ) ( not ( = ?auto_78822 ?auto_78825 ) ) ( not ( = ?auto_78823 ?auto_78824 ) ) ( not ( = ?auto_78823 ?auto_78825 ) ) ( not ( = ?auto_78824 ?auto_78825 ) ) ( ON ?auto_78825 ?auto_78828 ) ( not ( = ?auto_78822 ?auto_78828 ) ) ( not ( = ?auto_78823 ?auto_78828 ) ) ( not ( = ?auto_78824 ?auto_78828 ) ) ( not ( = ?auto_78825 ?auto_78828 ) ) ( ON ?auto_78824 ?auto_78825 ) ( CLEAR ?auto_78824 ) ( ON-TABLE ?auto_78827 ) ( ON ?auto_78829 ?auto_78827 ) ( ON ?auto_78826 ?auto_78829 ) ( ON ?auto_78828 ?auto_78826 ) ( not ( = ?auto_78827 ?auto_78829 ) ) ( not ( = ?auto_78827 ?auto_78826 ) ) ( not ( = ?auto_78827 ?auto_78828 ) ) ( not ( = ?auto_78827 ?auto_78825 ) ) ( not ( = ?auto_78827 ?auto_78824 ) ) ( not ( = ?auto_78829 ?auto_78826 ) ) ( not ( = ?auto_78829 ?auto_78828 ) ) ( not ( = ?auto_78829 ?auto_78825 ) ) ( not ( = ?auto_78829 ?auto_78824 ) ) ( not ( = ?auto_78826 ?auto_78828 ) ) ( not ( = ?auto_78826 ?auto_78825 ) ) ( not ( = ?auto_78826 ?auto_78824 ) ) ( not ( = ?auto_78822 ?auto_78827 ) ) ( not ( = ?auto_78822 ?auto_78829 ) ) ( not ( = ?auto_78822 ?auto_78826 ) ) ( not ( = ?auto_78823 ?auto_78827 ) ) ( not ( = ?auto_78823 ?auto_78829 ) ) ( not ( = ?auto_78823 ?auto_78826 ) ) ( HOLDING ?auto_78823 ) ( CLEAR ?auto_78822 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78822 ?auto_78823 )
      ( MAKE-4PILE ?auto_78822 ?auto_78823 ?auto_78824 ?auto_78825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78830 - BLOCK
      ?auto_78831 - BLOCK
      ?auto_78832 - BLOCK
      ?auto_78833 - BLOCK
    )
    :vars
    (
      ?auto_78835 - BLOCK
      ?auto_78836 - BLOCK
      ?auto_78837 - BLOCK
      ?auto_78834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78830 ) ( not ( = ?auto_78830 ?auto_78831 ) ) ( not ( = ?auto_78830 ?auto_78832 ) ) ( not ( = ?auto_78830 ?auto_78833 ) ) ( not ( = ?auto_78831 ?auto_78832 ) ) ( not ( = ?auto_78831 ?auto_78833 ) ) ( not ( = ?auto_78832 ?auto_78833 ) ) ( ON ?auto_78833 ?auto_78835 ) ( not ( = ?auto_78830 ?auto_78835 ) ) ( not ( = ?auto_78831 ?auto_78835 ) ) ( not ( = ?auto_78832 ?auto_78835 ) ) ( not ( = ?auto_78833 ?auto_78835 ) ) ( ON ?auto_78832 ?auto_78833 ) ( ON-TABLE ?auto_78836 ) ( ON ?auto_78837 ?auto_78836 ) ( ON ?auto_78834 ?auto_78837 ) ( ON ?auto_78835 ?auto_78834 ) ( not ( = ?auto_78836 ?auto_78837 ) ) ( not ( = ?auto_78836 ?auto_78834 ) ) ( not ( = ?auto_78836 ?auto_78835 ) ) ( not ( = ?auto_78836 ?auto_78833 ) ) ( not ( = ?auto_78836 ?auto_78832 ) ) ( not ( = ?auto_78837 ?auto_78834 ) ) ( not ( = ?auto_78837 ?auto_78835 ) ) ( not ( = ?auto_78837 ?auto_78833 ) ) ( not ( = ?auto_78837 ?auto_78832 ) ) ( not ( = ?auto_78834 ?auto_78835 ) ) ( not ( = ?auto_78834 ?auto_78833 ) ) ( not ( = ?auto_78834 ?auto_78832 ) ) ( not ( = ?auto_78830 ?auto_78836 ) ) ( not ( = ?auto_78830 ?auto_78837 ) ) ( not ( = ?auto_78830 ?auto_78834 ) ) ( not ( = ?auto_78831 ?auto_78836 ) ) ( not ( = ?auto_78831 ?auto_78837 ) ) ( not ( = ?auto_78831 ?auto_78834 ) ) ( CLEAR ?auto_78830 ) ( ON ?auto_78831 ?auto_78832 ) ( CLEAR ?auto_78831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78836 ?auto_78837 ?auto_78834 ?auto_78835 ?auto_78833 ?auto_78832 )
      ( MAKE-4PILE ?auto_78830 ?auto_78831 ?auto_78832 ?auto_78833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78838 - BLOCK
      ?auto_78839 - BLOCK
      ?auto_78840 - BLOCK
      ?auto_78841 - BLOCK
    )
    :vars
    (
      ?auto_78844 - BLOCK
      ?auto_78843 - BLOCK
      ?auto_78845 - BLOCK
      ?auto_78842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78838 ?auto_78839 ) ) ( not ( = ?auto_78838 ?auto_78840 ) ) ( not ( = ?auto_78838 ?auto_78841 ) ) ( not ( = ?auto_78839 ?auto_78840 ) ) ( not ( = ?auto_78839 ?auto_78841 ) ) ( not ( = ?auto_78840 ?auto_78841 ) ) ( ON ?auto_78841 ?auto_78844 ) ( not ( = ?auto_78838 ?auto_78844 ) ) ( not ( = ?auto_78839 ?auto_78844 ) ) ( not ( = ?auto_78840 ?auto_78844 ) ) ( not ( = ?auto_78841 ?auto_78844 ) ) ( ON ?auto_78840 ?auto_78841 ) ( ON-TABLE ?auto_78843 ) ( ON ?auto_78845 ?auto_78843 ) ( ON ?auto_78842 ?auto_78845 ) ( ON ?auto_78844 ?auto_78842 ) ( not ( = ?auto_78843 ?auto_78845 ) ) ( not ( = ?auto_78843 ?auto_78842 ) ) ( not ( = ?auto_78843 ?auto_78844 ) ) ( not ( = ?auto_78843 ?auto_78841 ) ) ( not ( = ?auto_78843 ?auto_78840 ) ) ( not ( = ?auto_78845 ?auto_78842 ) ) ( not ( = ?auto_78845 ?auto_78844 ) ) ( not ( = ?auto_78845 ?auto_78841 ) ) ( not ( = ?auto_78845 ?auto_78840 ) ) ( not ( = ?auto_78842 ?auto_78844 ) ) ( not ( = ?auto_78842 ?auto_78841 ) ) ( not ( = ?auto_78842 ?auto_78840 ) ) ( not ( = ?auto_78838 ?auto_78843 ) ) ( not ( = ?auto_78838 ?auto_78845 ) ) ( not ( = ?auto_78838 ?auto_78842 ) ) ( not ( = ?auto_78839 ?auto_78843 ) ) ( not ( = ?auto_78839 ?auto_78845 ) ) ( not ( = ?auto_78839 ?auto_78842 ) ) ( ON ?auto_78839 ?auto_78840 ) ( CLEAR ?auto_78839 ) ( HOLDING ?auto_78838 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78838 )
      ( MAKE-4PILE ?auto_78838 ?auto_78839 ?auto_78840 ?auto_78841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_78846 - BLOCK
      ?auto_78847 - BLOCK
      ?auto_78848 - BLOCK
      ?auto_78849 - BLOCK
    )
    :vars
    (
      ?auto_78852 - BLOCK
      ?auto_78851 - BLOCK
      ?auto_78850 - BLOCK
      ?auto_78853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78846 ?auto_78847 ) ) ( not ( = ?auto_78846 ?auto_78848 ) ) ( not ( = ?auto_78846 ?auto_78849 ) ) ( not ( = ?auto_78847 ?auto_78848 ) ) ( not ( = ?auto_78847 ?auto_78849 ) ) ( not ( = ?auto_78848 ?auto_78849 ) ) ( ON ?auto_78849 ?auto_78852 ) ( not ( = ?auto_78846 ?auto_78852 ) ) ( not ( = ?auto_78847 ?auto_78852 ) ) ( not ( = ?auto_78848 ?auto_78852 ) ) ( not ( = ?auto_78849 ?auto_78852 ) ) ( ON ?auto_78848 ?auto_78849 ) ( ON-TABLE ?auto_78851 ) ( ON ?auto_78850 ?auto_78851 ) ( ON ?auto_78853 ?auto_78850 ) ( ON ?auto_78852 ?auto_78853 ) ( not ( = ?auto_78851 ?auto_78850 ) ) ( not ( = ?auto_78851 ?auto_78853 ) ) ( not ( = ?auto_78851 ?auto_78852 ) ) ( not ( = ?auto_78851 ?auto_78849 ) ) ( not ( = ?auto_78851 ?auto_78848 ) ) ( not ( = ?auto_78850 ?auto_78853 ) ) ( not ( = ?auto_78850 ?auto_78852 ) ) ( not ( = ?auto_78850 ?auto_78849 ) ) ( not ( = ?auto_78850 ?auto_78848 ) ) ( not ( = ?auto_78853 ?auto_78852 ) ) ( not ( = ?auto_78853 ?auto_78849 ) ) ( not ( = ?auto_78853 ?auto_78848 ) ) ( not ( = ?auto_78846 ?auto_78851 ) ) ( not ( = ?auto_78846 ?auto_78850 ) ) ( not ( = ?auto_78846 ?auto_78853 ) ) ( not ( = ?auto_78847 ?auto_78851 ) ) ( not ( = ?auto_78847 ?auto_78850 ) ) ( not ( = ?auto_78847 ?auto_78853 ) ) ( ON ?auto_78847 ?auto_78848 ) ( ON ?auto_78846 ?auto_78847 ) ( CLEAR ?auto_78846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78851 ?auto_78850 ?auto_78853 ?auto_78852 ?auto_78849 ?auto_78848 ?auto_78847 )
      ( MAKE-4PILE ?auto_78846 ?auto_78847 ?auto_78848 ?auto_78849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78857 - BLOCK
      ?auto_78858 - BLOCK
      ?auto_78859 - BLOCK
    )
    :vars
    (
      ?auto_78860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78860 ?auto_78859 ) ( CLEAR ?auto_78860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78857 ) ( ON ?auto_78858 ?auto_78857 ) ( ON ?auto_78859 ?auto_78858 ) ( not ( = ?auto_78857 ?auto_78858 ) ) ( not ( = ?auto_78857 ?auto_78859 ) ) ( not ( = ?auto_78857 ?auto_78860 ) ) ( not ( = ?auto_78858 ?auto_78859 ) ) ( not ( = ?auto_78858 ?auto_78860 ) ) ( not ( = ?auto_78859 ?auto_78860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78860 ?auto_78859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78861 - BLOCK
      ?auto_78862 - BLOCK
      ?auto_78863 - BLOCK
    )
    :vars
    (
      ?auto_78864 - BLOCK
      ?auto_78865 - BLOCK
      ?auto_78866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78864 ?auto_78863 ) ( CLEAR ?auto_78864 ) ( ON-TABLE ?auto_78861 ) ( ON ?auto_78862 ?auto_78861 ) ( ON ?auto_78863 ?auto_78862 ) ( not ( = ?auto_78861 ?auto_78862 ) ) ( not ( = ?auto_78861 ?auto_78863 ) ) ( not ( = ?auto_78861 ?auto_78864 ) ) ( not ( = ?auto_78862 ?auto_78863 ) ) ( not ( = ?auto_78862 ?auto_78864 ) ) ( not ( = ?auto_78863 ?auto_78864 ) ) ( HOLDING ?auto_78865 ) ( CLEAR ?auto_78866 ) ( not ( = ?auto_78861 ?auto_78865 ) ) ( not ( = ?auto_78861 ?auto_78866 ) ) ( not ( = ?auto_78862 ?auto_78865 ) ) ( not ( = ?auto_78862 ?auto_78866 ) ) ( not ( = ?auto_78863 ?auto_78865 ) ) ( not ( = ?auto_78863 ?auto_78866 ) ) ( not ( = ?auto_78864 ?auto_78865 ) ) ( not ( = ?auto_78864 ?auto_78866 ) ) ( not ( = ?auto_78865 ?auto_78866 ) ) )
    :subtasks
    ( ( !STACK ?auto_78865 ?auto_78866 )
      ( MAKE-3PILE ?auto_78861 ?auto_78862 ?auto_78863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78867 - BLOCK
      ?auto_78868 - BLOCK
      ?auto_78869 - BLOCK
    )
    :vars
    (
      ?auto_78871 - BLOCK
      ?auto_78872 - BLOCK
      ?auto_78870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78871 ?auto_78869 ) ( ON-TABLE ?auto_78867 ) ( ON ?auto_78868 ?auto_78867 ) ( ON ?auto_78869 ?auto_78868 ) ( not ( = ?auto_78867 ?auto_78868 ) ) ( not ( = ?auto_78867 ?auto_78869 ) ) ( not ( = ?auto_78867 ?auto_78871 ) ) ( not ( = ?auto_78868 ?auto_78869 ) ) ( not ( = ?auto_78868 ?auto_78871 ) ) ( not ( = ?auto_78869 ?auto_78871 ) ) ( CLEAR ?auto_78872 ) ( not ( = ?auto_78867 ?auto_78870 ) ) ( not ( = ?auto_78867 ?auto_78872 ) ) ( not ( = ?auto_78868 ?auto_78870 ) ) ( not ( = ?auto_78868 ?auto_78872 ) ) ( not ( = ?auto_78869 ?auto_78870 ) ) ( not ( = ?auto_78869 ?auto_78872 ) ) ( not ( = ?auto_78871 ?auto_78870 ) ) ( not ( = ?auto_78871 ?auto_78872 ) ) ( not ( = ?auto_78870 ?auto_78872 ) ) ( ON ?auto_78870 ?auto_78871 ) ( CLEAR ?auto_78870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78867 ?auto_78868 ?auto_78869 ?auto_78871 )
      ( MAKE-3PILE ?auto_78867 ?auto_78868 ?auto_78869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78873 - BLOCK
      ?auto_78874 - BLOCK
      ?auto_78875 - BLOCK
    )
    :vars
    (
      ?auto_78878 - BLOCK
      ?auto_78876 - BLOCK
      ?auto_78877 - BLOCK
      ?auto_78879 - BLOCK
      ?auto_78880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78878 ?auto_78875 ) ( ON-TABLE ?auto_78873 ) ( ON ?auto_78874 ?auto_78873 ) ( ON ?auto_78875 ?auto_78874 ) ( not ( = ?auto_78873 ?auto_78874 ) ) ( not ( = ?auto_78873 ?auto_78875 ) ) ( not ( = ?auto_78873 ?auto_78878 ) ) ( not ( = ?auto_78874 ?auto_78875 ) ) ( not ( = ?auto_78874 ?auto_78878 ) ) ( not ( = ?auto_78875 ?auto_78878 ) ) ( not ( = ?auto_78873 ?auto_78876 ) ) ( not ( = ?auto_78873 ?auto_78877 ) ) ( not ( = ?auto_78874 ?auto_78876 ) ) ( not ( = ?auto_78874 ?auto_78877 ) ) ( not ( = ?auto_78875 ?auto_78876 ) ) ( not ( = ?auto_78875 ?auto_78877 ) ) ( not ( = ?auto_78878 ?auto_78876 ) ) ( not ( = ?auto_78878 ?auto_78877 ) ) ( not ( = ?auto_78876 ?auto_78877 ) ) ( ON ?auto_78876 ?auto_78878 ) ( CLEAR ?auto_78876 ) ( HOLDING ?auto_78877 ) ( CLEAR ?auto_78879 ) ( ON-TABLE ?auto_78880 ) ( ON ?auto_78879 ?auto_78880 ) ( not ( = ?auto_78880 ?auto_78879 ) ) ( not ( = ?auto_78880 ?auto_78877 ) ) ( not ( = ?auto_78879 ?auto_78877 ) ) ( not ( = ?auto_78873 ?auto_78879 ) ) ( not ( = ?auto_78873 ?auto_78880 ) ) ( not ( = ?auto_78874 ?auto_78879 ) ) ( not ( = ?auto_78874 ?auto_78880 ) ) ( not ( = ?auto_78875 ?auto_78879 ) ) ( not ( = ?auto_78875 ?auto_78880 ) ) ( not ( = ?auto_78878 ?auto_78879 ) ) ( not ( = ?auto_78878 ?auto_78880 ) ) ( not ( = ?auto_78876 ?auto_78879 ) ) ( not ( = ?auto_78876 ?auto_78880 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78880 ?auto_78879 ?auto_78877 )
      ( MAKE-3PILE ?auto_78873 ?auto_78874 ?auto_78875 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78881 - BLOCK
      ?auto_78882 - BLOCK
      ?auto_78883 - BLOCK
    )
    :vars
    (
      ?auto_78884 - BLOCK
      ?auto_78888 - BLOCK
      ?auto_78887 - BLOCK
      ?auto_78886 - BLOCK
      ?auto_78885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78884 ?auto_78883 ) ( ON-TABLE ?auto_78881 ) ( ON ?auto_78882 ?auto_78881 ) ( ON ?auto_78883 ?auto_78882 ) ( not ( = ?auto_78881 ?auto_78882 ) ) ( not ( = ?auto_78881 ?auto_78883 ) ) ( not ( = ?auto_78881 ?auto_78884 ) ) ( not ( = ?auto_78882 ?auto_78883 ) ) ( not ( = ?auto_78882 ?auto_78884 ) ) ( not ( = ?auto_78883 ?auto_78884 ) ) ( not ( = ?auto_78881 ?auto_78888 ) ) ( not ( = ?auto_78881 ?auto_78887 ) ) ( not ( = ?auto_78882 ?auto_78888 ) ) ( not ( = ?auto_78882 ?auto_78887 ) ) ( not ( = ?auto_78883 ?auto_78888 ) ) ( not ( = ?auto_78883 ?auto_78887 ) ) ( not ( = ?auto_78884 ?auto_78888 ) ) ( not ( = ?auto_78884 ?auto_78887 ) ) ( not ( = ?auto_78888 ?auto_78887 ) ) ( ON ?auto_78888 ?auto_78884 ) ( CLEAR ?auto_78886 ) ( ON-TABLE ?auto_78885 ) ( ON ?auto_78886 ?auto_78885 ) ( not ( = ?auto_78885 ?auto_78886 ) ) ( not ( = ?auto_78885 ?auto_78887 ) ) ( not ( = ?auto_78886 ?auto_78887 ) ) ( not ( = ?auto_78881 ?auto_78886 ) ) ( not ( = ?auto_78881 ?auto_78885 ) ) ( not ( = ?auto_78882 ?auto_78886 ) ) ( not ( = ?auto_78882 ?auto_78885 ) ) ( not ( = ?auto_78883 ?auto_78886 ) ) ( not ( = ?auto_78883 ?auto_78885 ) ) ( not ( = ?auto_78884 ?auto_78886 ) ) ( not ( = ?auto_78884 ?auto_78885 ) ) ( not ( = ?auto_78888 ?auto_78886 ) ) ( not ( = ?auto_78888 ?auto_78885 ) ) ( ON ?auto_78887 ?auto_78888 ) ( CLEAR ?auto_78887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78881 ?auto_78882 ?auto_78883 ?auto_78884 ?auto_78888 )
      ( MAKE-3PILE ?auto_78881 ?auto_78882 ?auto_78883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78889 - BLOCK
      ?auto_78890 - BLOCK
      ?auto_78891 - BLOCK
    )
    :vars
    (
      ?auto_78893 - BLOCK
      ?auto_78892 - BLOCK
      ?auto_78894 - BLOCK
      ?auto_78896 - BLOCK
      ?auto_78895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78893 ?auto_78891 ) ( ON-TABLE ?auto_78889 ) ( ON ?auto_78890 ?auto_78889 ) ( ON ?auto_78891 ?auto_78890 ) ( not ( = ?auto_78889 ?auto_78890 ) ) ( not ( = ?auto_78889 ?auto_78891 ) ) ( not ( = ?auto_78889 ?auto_78893 ) ) ( not ( = ?auto_78890 ?auto_78891 ) ) ( not ( = ?auto_78890 ?auto_78893 ) ) ( not ( = ?auto_78891 ?auto_78893 ) ) ( not ( = ?auto_78889 ?auto_78892 ) ) ( not ( = ?auto_78889 ?auto_78894 ) ) ( not ( = ?auto_78890 ?auto_78892 ) ) ( not ( = ?auto_78890 ?auto_78894 ) ) ( not ( = ?auto_78891 ?auto_78892 ) ) ( not ( = ?auto_78891 ?auto_78894 ) ) ( not ( = ?auto_78893 ?auto_78892 ) ) ( not ( = ?auto_78893 ?auto_78894 ) ) ( not ( = ?auto_78892 ?auto_78894 ) ) ( ON ?auto_78892 ?auto_78893 ) ( ON-TABLE ?auto_78896 ) ( not ( = ?auto_78896 ?auto_78895 ) ) ( not ( = ?auto_78896 ?auto_78894 ) ) ( not ( = ?auto_78895 ?auto_78894 ) ) ( not ( = ?auto_78889 ?auto_78895 ) ) ( not ( = ?auto_78889 ?auto_78896 ) ) ( not ( = ?auto_78890 ?auto_78895 ) ) ( not ( = ?auto_78890 ?auto_78896 ) ) ( not ( = ?auto_78891 ?auto_78895 ) ) ( not ( = ?auto_78891 ?auto_78896 ) ) ( not ( = ?auto_78893 ?auto_78895 ) ) ( not ( = ?auto_78893 ?auto_78896 ) ) ( not ( = ?auto_78892 ?auto_78895 ) ) ( not ( = ?auto_78892 ?auto_78896 ) ) ( ON ?auto_78894 ?auto_78892 ) ( CLEAR ?auto_78894 ) ( HOLDING ?auto_78895 ) ( CLEAR ?auto_78896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78896 ?auto_78895 )
      ( MAKE-3PILE ?auto_78889 ?auto_78890 ?auto_78891 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78897 - BLOCK
      ?auto_78898 - BLOCK
      ?auto_78899 - BLOCK
    )
    :vars
    (
      ?auto_78902 - BLOCK
      ?auto_78900 - BLOCK
      ?auto_78904 - BLOCK
      ?auto_78901 - BLOCK
      ?auto_78903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78902 ?auto_78899 ) ( ON-TABLE ?auto_78897 ) ( ON ?auto_78898 ?auto_78897 ) ( ON ?auto_78899 ?auto_78898 ) ( not ( = ?auto_78897 ?auto_78898 ) ) ( not ( = ?auto_78897 ?auto_78899 ) ) ( not ( = ?auto_78897 ?auto_78902 ) ) ( not ( = ?auto_78898 ?auto_78899 ) ) ( not ( = ?auto_78898 ?auto_78902 ) ) ( not ( = ?auto_78899 ?auto_78902 ) ) ( not ( = ?auto_78897 ?auto_78900 ) ) ( not ( = ?auto_78897 ?auto_78904 ) ) ( not ( = ?auto_78898 ?auto_78900 ) ) ( not ( = ?auto_78898 ?auto_78904 ) ) ( not ( = ?auto_78899 ?auto_78900 ) ) ( not ( = ?auto_78899 ?auto_78904 ) ) ( not ( = ?auto_78902 ?auto_78900 ) ) ( not ( = ?auto_78902 ?auto_78904 ) ) ( not ( = ?auto_78900 ?auto_78904 ) ) ( ON ?auto_78900 ?auto_78902 ) ( ON-TABLE ?auto_78901 ) ( not ( = ?auto_78901 ?auto_78903 ) ) ( not ( = ?auto_78901 ?auto_78904 ) ) ( not ( = ?auto_78903 ?auto_78904 ) ) ( not ( = ?auto_78897 ?auto_78903 ) ) ( not ( = ?auto_78897 ?auto_78901 ) ) ( not ( = ?auto_78898 ?auto_78903 ) ) ( not ( = ?auto_78898 ?auto_78901 ) ) ( not ( = ?auto_78899 ?auto_78903 ) ) ( not ( = ?auto_78899 ?auto_78901 ) ) ( not ( = ?auto_78902 ?auto_78903 ) ) ( not ( = ?auto_78902 ?auto_78901 ) ) ( not ( = ?auto_78900 ?auto_78903 ) ) ( not ( = ?auto_78900 ?auto_78901 ) ) ( ON ?auto_78904 ?auto_78900 ) ( CLEAR ?auto_78901 ) ( ON ?auto_78903 ?auto_78904 ) ( CLEAR ?auto_78903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78897 ?auto_78898 ?auto_78899 ?auto_78902 ?auto_78900 ?auto_78904 )
      ( MAKE-3PILE ?auto_78897 ?auto_78898 ?auto_78899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78905 - BLOCK
      ?auto_78906 - BLOCK
      ?auto_78907 - BLOCK
    )
    :vars
    (
      ?auto_78908 - BLOCK
      ?auto_78911 - BLOCK
      ?auto_78910 - BLOCK
      ?auto_78912 - BLOCK
      ?auto_78909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78908 ?auto_78907 ) ( ON-TABLE ?auto_78905 ) ( ON ?auto_78906 ?auto_78905 ) ( ON ?auto_78907 ?auto_78906 ) ( not ( = ?auto_78905 ?auto_78906 ) ) ( not ( = ?auto_78905 ?auto_78907 ) ) ( not ( = ?auto_78905 ?auto_78908 ) ) ( not ( = ?auto_78906 ?auto_78907 ) ) ( not ( = ?auto_78906 ?auto_78908 ) ) ( not ( = ?auto_78907 ?auto_78908 ) ) ( not ( = ?auto_78905 ?auto_78911 ) ) ( not ( = ?auto_78905 ?auto_78910 ) ) ( not ( = ?auto_78906 ?auto_78911 ) ) ( not ( = ?auto_78906 ?auto_78910 ) ) ( not ( = ?auto_78907 ?auto_78911 ) ) ( not ( = ?auto_78907 ?auto_78910 ) ) ( not ( = ?auto_78908 ?auto_78911 ) ) ( not ( = ?auto_78908 ?auto_78910 ) ) ( not ( = ?auto_78911 ?auto_78910 ) ) ( ON ?auto_78911 ?auto_78908 ) ( not ( = ?auto_78912 ?auto_78909 ) ) ( not ( = ?auto_78912 ?auto_78910 ) ) ( not ( = ?auto_78909 ?auto_78910 ) ) ( not ( = ?auto_78905 ?auto_78909 ) ) ( not ( = ?auto_78905 ?auto_78912 ) ) ( not ( = ?auto_78906 ?auto_78909 ) ) ( not ( = ?auto_78906 ?auto_78912 ) ) ( not ( = ?auto_78907 ?auto_78909 ) ) ( not ( = ?auto_78907 ?auto_78912 ) ) ( not ( = ?auto_78908 ?auto_78909 ) ) ( not ( = ?auto_78908 ?auto_78912 ) ) ( not ( = ?auto_78911 ?auto_78909 ) ) ( not ( = ?auto_78911 ?auto_78912 ) ) ( ON ?auto_78910 ?auto_78911 ) ( ON ?auto_78909 ?auto_78910 ) ( CLEAR ?auto_78909 ) ( HOLDING ?auto_78912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78912 )
      ( MAKE-3PILE ?auto_78905 ?auto_78906 ?auto_78907 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_78913 - BLOCK
      ?auto_78914 - BLOCK
      ?auto_78915 - BLOCK
    )
    :vars
    (
      ?auto_78920 - BLOCK
      ?auto_78918 - BLOCK
      ?auto_78917 - BLOCK
      ?auto_78916 - BLOCK
      ?auto_78919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78920 ?auto_78915 ) ( ON-TABLE ?auto_78913 ) ( ON ?auto_78914 ?auto_78913 ) ( ON ?auto_78915 ?auto_78914 ) ( not ( = ?auto_78913 ?auto_78914 ) ) ( not ( = ?auto_78913 ?auto_78915 ) ) ( not ( = ?auto_78913 ?auto_78920 ) ) ( not ( = ?auto_78914 ?auto_78915 ) ) ( not ( = ?auto_78914 ?auto_78920 ) ) ( not ( = ?auto_78915 ?auto_78920 ) ) ( not ( = ?auto_78913 ?auto_78918 ) ) ( not ( = ?auto_78913 ?auto_78917 ) ) ( not ( = ?auto_78914 ?auto_78918 ) ) ( not ( = ?auto_78914 ?auto_78917 ) ) ( not ( = ?auto_78915 ?auto_78918 ) ) ( not ( = ?auto_78915 ?auto_78917 ) ) ( not ( = ?auto_78920 ?auto_78918 ) ) ( not ( = ?auto_78920 ?auto_78917 ) ) ( not ( = ?auto_78918 ?auto_78917 ) ) ( ON ?auto_78918 ?auto_78920 ) ( not ( = ?auto_78916 ?auto_78919 ) ) ( not ( = ?auto_78916 ?auto_78917 ) ) ( not ( = ?auto_78919 ?auto_78917 ) ) ( not ( = ?auto_78913 ?auto_78919 ) ) ( not ( = ?auto_78913 ?auto_78916 ) ) ( not ( = ?auto_78914 ?auto_78919 ) ) ( not ( = ?auto_78914 ?auto_78916 ) ) ( not ( = ?auto_78915 ?auto_78919 ) ) ( not ( = ?auto_78915 ?auto_78916 ) ) ( not ( = ?auto_78920 ?auto_78919 ) ) ( not ( = ?auto_78920 ?auto_78916 ) ) ( not ( = ?auto_78918 ?auto_78919 ) ) ( not ( = ?auto_78918 ?auto_78916 ) ) ( ON ?auto_78917 ?auto_78918 ) ( ON ?auto_78919 ?auto_78917 ) ( ON ?auto_78916 ?auto_78919 ) ( CLEAR ?auto_78916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78913 ?auto_78914 ?auto_78915 ?auto_78920 ?auto_78918 ?auto_78917 ?auto_78919 )
      ( MAKE-3PILE ?auto_78913 ?auto_78914 ?auto_78915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78926 - BLOCK
      ?auto_78927 - BLOCK
      ?auto_78928 - BLOCK
      ?auto_78929 - BLOCK
      ?auto_78930 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_78930 ) ( CLEAR ?auto_78929 ) ( ON-TABLE ?auto_78926 ) ( ON ?auto_78927 ?auto_78926 ) ( ON ?auto_78928 ?auto_78927 ) ( ON ?auto_78929 ?auto_78928 ) ( not ( = ?auto_78926 ?auto_78927 ) ) ( not ( = ?auto_78926 ?auto_78928 ) ) ( not ( = ?auto_78926 ?auto_78929 ) ) ( not ( = ?auto_78926 ?auto_78930 ) ) ( not ( = ?auto_78927 ?auto_78928 ) ) ( not ( = ?auto_78927 ?auto_78929 ) ) ( not ( = ?auto_78927 ?auto_78930 ) ) ( not ( = ?auto_78928 ?auto_78929 ) ) ( not ( = ?auto_78928 ?auto_78930 ) ) ( not ( = ?auto_78929 ?auto_78930 ) ) )
    :subtasks
    ( ( !STACK ?auto_78930 ?auto_78929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78931 - BLOCK
      ?auto_78932 - BLOCK
      ?auto_78933 - BLOCK
      ?auto_78934 - BLOCK
      ?auto_78935 - BLOCK
    )
    :vars
    (
      ?auto_78936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78934 ) ( ON-TABLE ?auto_78931 ) ( ON ?auto_78932 ?auto_78931 ) ( ON ?auto_78933 ?auto_78932 ) ( ON ?auto_78934 ?auto_78933 ) ( not ( = ?auto_78931 ?auto_78932 ) ) ( not ( = ?auto_78931 ?auto_78933 ) ) ( not ( = ?auto_78931 ?auto_78934 ) ) ( not ( = ?auto_78931 ?auto_78935 ) ) ( not ( = ?auto_78932 ?auto_78933 ) ) ( not ( = ?auto_78932 ?auto_78934 ) ) ( not ( = ?auto_78932 ?auto_78935 ) ) ( not ( = ?auto_78933 ?auto_78934 ) ) ( not ( = ?auto_78933 ?auto_78935 ) ) ( not ( = ?auto_78934 ?auto_78935 ) ) ( ON ?auto_78935 ?auto_78936 ) ( CLEAR ?auto_78935 ) ( HAND-EMPTY ) ( not ( = ?auto_78931 ?auto_78936 ) ) ( not ( = ?auto_78932 ?auto_78936 ) ) ( not ( = ?auto_78933 ?auto_78936 ) ) ( not ( = ?auto_78934 ?auto_78936 ) ) ( not ( = ?auto_78935 ?auto_78936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78935 ?auto_78936 )
      ( MAKE-5PILE ?auto_78931 ?auto_78932 ?auto_78933 ?auto_78934 ?auto_78935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78937 - BLOCK
      ?auto_78938 - BLOCK
      ?auto_78939 - BLOCK
      ?auto_78940 - BLOCK
      ?auto_78941 - BLOCK
    )
    :vars
    (
      ?auto_78942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78937 ) ( ON ?auto_78938 ?auto_78937 ) ( ON ?auto_78939 ?auto_78938 ) ( not ( = ?auto_78937 ?auto_78938 ) ) ( not ( = ?auto_78937 ?auto_78939 ) ) ( not ( = ?auto_78937 ?auto_78940 ) ) ( not ( = ?auto_78937 ?auto_78941 ) ) ( not ( = ?auto_78938 ?auto_78939 ) ) ( not ( = ?auto_78938 ?auto_78940 ) ) ( not ( = ?auto_78938 ?auto_78941 ) ) ( not ( = ?auto_78939 ?auto_78940 ) ) ( not ( = ?auto_78939 ?auto_78941 ) ) ( not ( = ?auto_78940 ?auto_78941 ) ) ( ON ?auto_78941 ?auto_78942 ) ( CLEAR ?auto_78941 ) ( not ( = ?auto_78937 ?auto_78942 ) ) ( not ( = ?auto_78938 ?auto_78942 ) ) ( not ( = ?auto_78939 ?auto_78942 ) ) ( not ( = ?auto_78940 ?auto_78942 ) ) ( not ( = ?auto_78941 ?auto_78942 ) ) ( HOLDING ?auto_78940 ) ( CLEAR ?auto_78939 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78937 ?auto_78938 ?auto_78939 ?auto_78940 )
      ( MAKE-5PILE ?auto_78937 ?auto_78938 ?auto_78939 ?auto_78940 ?auto_78941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78943 - BLOCK
      ?auto_78944 - BLOCK
      ?auto_78945 - BLOCK
      ?auto_78946 - BLOCK
      ?auto_78947 - BLOCK
    )
    :vars
    (
      ?auto_78948 - BLOCK
      ?auto_78950 - BLOCK
      ?auto_78949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78943 ) ( ON ?auto_78944 ?auto_78943 ) ( ON ?auto_78945 ?auto_78944 ) ( not ( = ?auto_78943 ?auto_78944 ) ) ( not ( = ?auto_78943 ?auto_78945 ) ) ( not ( = ?auto_78943 ?auto_78946 ) ) ( not ( = ?auto_78943 ?auto_78947 ) ) ( not ( = ?auto_78944 ?auto_78945 ) ) ( not ( = ?auto_78944 ?auto_78946 ) ) ( not ( = ?auto_78944 ?auto_78947 ) ) ( not ( = ?auto_78945 ?auto_78946 ) ) ( not ( = ?auto_78945 ?auto_78947 ) ) ( not ( = ?auto_78946 ?auto_78947 ) ) ( ON ?auto_78947 ?auto_78948 ) ( not ( = ?auto_78943 ?auto_78948 ) ) ( not ( = ?auto_78944 ?auto_78948 ) ) ( not ( = ?auto_78945 ?auto_78948 ) ) ( not ( = ?auto_78946 ?auto_78948 ) ) ( not ( = ?auto_78947 ?auto_78948 ) ) ( CLEAR ?auto_78945 ) ( ON ?auto_78946 ?auto_78947 ) ( CLEAR ?auto_78946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78950 ) ( ON ?auto_78949 ?auto_78950 ) ( ON ?auto_78948 ?auto_78949 ) ( not ( = ?auto_78950 ?auto_78949 ) ) ( not ( = ?auto_78950 ?auto_78948 ) ) ( not ( = ?auto_78950 ?auto_78947 ) ) ( not ( = ?auto_78950 ?auto_78946 ) ) ( not ( = ?auto_78949 ?auto_78948 ) ) ( not ( = ?auto_78949 ?auto_78947 ) ) ( not ( = ?auto_78949 ?auto_78946 ) ) ( not ( = ?auto_78943 ?auto_78950 ) ) ( not ( = ?auto_78943 ?auto_78949 ) ) ( not ( = ?auto_78944 ?auto_78950 ) ) ( not ( = ?auto_78944 ?auto_78949 ) ) ( not ( = ?auto_78945 ?auto_78950 ) ) ( not ( = ?auto_78945 ?auto_78949 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78950 ?auto_78949 ?auto_78948 ?auto_78947 )
      ( MAKE-5PILE ?auto_78943 ?auto_78944 ?auto_78945 ?auto_78946 ?auto_78947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78951 - BLOCK
      ?auto_78952 - BLOCK
      ?auto_78953 - BLOCK
      ?auto_78954 - BLOCK
      ?auto_78955 - BLOCK
    )
    :vars
    (
      ?auto_78958 - BLOCK
      ?auto_78957 - BLOCK
      ?auto_78956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78951 ) ( ON ?auto_78952 ?auto_78951 ) ( not ( = ?auto_78951 ?auto_78952 ) ) ( not ( = ?auto_78951 ?auto_78953 ) ) ( not ( = ?auto_78951 ?auto_78954 ) ) ( not ( = ?auto_78951 ?auto_78955 ) ) ( not ( = ?auto_78952 ?auto_78953 ) ) ( not ( = ?auto_78952 ?auto_78954 ) ) ( not ( = ?auto_78952 ?auto_78955 ) ) ( not ( = ?auto_78953 ?auto_78954 ) ) ( not ( = ?auto_78953 ?auto_78955 ) ) ( not ( = ?auto_78954 ?auto_78955 ) ) ( ON ?auto_78955 ?auto_78958 ) ( not ( = ?auto_78951 ?auto_78958 ) ) ( not ( = ?auto_78952 ?auto_78958 ) ) ( not ( = ?auto_78953 ?auto_78958 ) ) ( not ( = ?auto_78954 ?auto_78958 ) ) ( not ( = ?auto_78955 ?auto_78958 ) ) ( ON ?auto_78954 ?auto_78955 ) ( CLEAR ?auto_78954 ) ( ON-TABLE ?auto_78957 ) ( ON ?auto_78956 ?auto_78957 ) ( ON ?auto_78958 ?auto_78956 ) ( not ( = ?auto_78957 ?auto_78956 ) ) ( not ( = ?auto_78957 ?auto_78958 ) ) ( not ( = ?auto_78957 ?auto_78955 ) ) ( not ( = ?auto_78957 ?auto_78954 ) ) ( not ( = ?auto_78956 ?auto_78958 ) ) ( not ( = ?auto_78956 ?auto_78955 ) ) ( not ( = ?auto_78956 ?auto_78954 ) ) ( not ( = ?auto_78951 ?auto_78957 ) ) ( not ( = ?auto_78951 ?auto_78956 ) ) ( not ( = ?auto_78952 ?auto_78957 ) ) ( not ( = ?auto_78952 ?auto_78956 ) ) ( not ( = ?auto_78953 ?auto_78957 ) ) ( not ( = ?auto_78953 ?auto_78956 ) ) ( HOLDING ?auto_78953 ) ( CLEAR ?auto_78952 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78951 ?auto_78952 ?auto_78953 )
      ( MAKE-5PILE ?auto_78951 ?auto_78952 ?auto_78953 ?auto_78954 ?auto_78955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78959 - BLOCK
      ?auto_78960 - BLOCK
      ?auto_78961 - BLOCK
      ?auto_78962 - BLOCK
      ?auto_78963 - BLOCK
    )
    :vars
    (
      ?auto_78964 - BLOCK
      ?auto_78965 - BLOCK
      ?auto_78966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78959 ) ( ON ?auto_78960 ?auto_78959 ) ( not ( = ?auto_78959 ?auto_78960 ) ) ( not ( = ?auto_78959 ?auto_78961 ) ) ( not ( = ?auto_78959 ?auto_78962 ) ) ( not ( = ?auto_78959 ?auto_78963 ) ) ( not ( = ?auto_78960 ?auto_78961 ) ) ( not ( = ?auto_78960 ?auto_78962 ) ) ( not ( = ?auto_78960 ?auto_78963 ) ) ( not ( = ?auto_78961 ?auto_78962 ) ) ( not ( = ?auto_78961 ?auto_78963 ) ) ( not ( = ?auto_78962 ?auto_78963 ) ) ( ON ?auto_78963 ?auto_78964 ) ( not ( = ?auto_78959 ?auto_78964 ) ) ( not ( = ?auto_78960 ?auto_78964 ) ) ( not ( = ?auto_78961 ?auto_78964 ) ) ( not ( = ?auto_78962 ?auto_78964 ) ) ( not ( = ?auto_78963 ?auto_78964 ) ) ( ON ?auto_78962 ?auto_78963 ) ( ON-TABLE ?auto_78965 ) ( ON ?auto_78966 ?auto_78965 ) ( ON ?auto_78964 ?auto_78966 ) ( not ( = ?auto_78965 ?auto_78966 ) ) ( not ( = ?auto_78965 ?auto_78964 ) ) ( not ( = ?auto_78965 ?auto_78963 ) ) ( not ( = ?auto_78965 ?auto_78962 ) ) ( not ( = ?auto_78966 ?auto_78964 ) ) ( not ( = ?auto_78966 ?auto_78963 ) ) ( not ( = ?auto_78966 ?auto_78962 ) ) ( not ( = ?auto_78959 ?auto_78965 ) ) ( not ( = ?auto_78959 ?auto_78966 ) ) ( not ( = ?auto_78960 ?auto_78965 ) ) ( not ( = ?auto_78960 ?auto_78966 ) ) ( not ( = ?auto_78961 ?auto_78965 ) ) ( not ( = ?auto_78961 ?auto_78966 ) ) ( CLEAR ?auto_78960 ) ( ON ?auto_78961 ?auto_78962 ) ( CLEAR ?auto_78961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78965 ?auto_78966 ?auto_78964 ?auto_78963 ?auto_78962 )
      ( MAKE-5PILE ?auto_78959 ?auto_78960 ?auto_78961 ?auto_78962 ?auto_78963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78967 - BLOCK
      ?auto_78968 - BLOCK
      ?auto_78969 - BLOCK
      ?auto_78970 - BLOCK
      ?auto_78971 - BLOCK
    )
    :vars
    (
      ?auto_78973 - BLOCK
      ?auto_78972 - BLOCK
      ?auto_78974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78967 ) ( not ( = ?auto_78967 ?auto_78968 ) ) ( not ( = ?auto_78967 ?auto_78969 ) ) ( not ( = ?auto_78967 ?auto_78970 ) ) ( not ( = ?auto_78967 ?auto_78971 ) ) ( not ( = ?auto_78968 ?auto_78969 ) ) ( not ( = ?auto_78968 ?auto_78970 ) ) ( not ( = ?auto_78968 ?auto_78971 ) ) ( not ( = ?auto_78969 ?auto_78970 ) ) ( not ( = ?auto_78969 ?auto_78971 ) ) ( not ( = ?auto_78970 ?auto_78971 ) ) ( ON ?auto_78971 ?auto_78973 ) ( not ( = ?auto_78967 ?auto_78973 ) ) ( not ( = ?auto_78968 ?auto_78973 ) ) ( not ( = ?auto_78969 ?auto_78973 ) ) ( not ( = ?auto_78970 ?auto_78973 ) ) ( not ( = ?auto_78971 ?auto_78973 ) ) ( ON ?auto_78970 ?auto_78971 ) ( ON-TABLE ?auto_78972 ) ( ON ?auto_78974 ?auto_78972 ) ( ON ?auto_78973 ?auto_78974 ) ( not ( = ?auto_78972 ?auto_78974 ) ) ( not ( = ?auto_78972 ?auto_78973 ) ) ( not ( = ?auto_78972 ?auto_78971 ) ) ( not ( = ?auto_78972 ?auto_78970 ) ) ( not ( = ?auto_78974 ?auto_78973 ) ) ( not ( = ?auto_78974 ?auto_78971 ) ) ( not ( = ?auto_78974 ?auto_78970 ) ) ( not ( = ?auto_78967 ?auto_78972 ) ) ( not ( = ?auto_78967 ?auto_78974 ) ) ( not ( = ?auto_78968 ?auto_78972 ) ) ( not ( = ?auto_78968 ?auto_78974 ) ) ( not ( = ?auto_78969 ?auto_78972 ) ) ( not ( = ?auto_78969 ?auto_78974 ) ) ( ON ?auto_78969 ?auto_78970 ) ( CLEAR ?auto_78969 ) ( HOLDING ?auto_78968 ) ( CLEAR ?auto_78967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78967 ?auto_78968 )
      ( MAKE-5PILE ?auto_78967 ?auto_78968 ?auto_78969 ?auto_78970 ?auto_78971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78975 - BLOCK
      ?auto_78976 - BLOCK
      ?auto_78977 - BLOCK
      ?auto_78978 - BLOCK
      ?auto_78979 - BLOCK
    )
    :vars
    (
      ?auto_78982 - BLOCK
      ?auto_78981 - BLOCK
      ?auto_78980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78975 ) ( not ( = ?auto_78975 ?auto_78976 ) ) ( not ( = ?auto_78975 ?auto_78977 ) ) ( not ( = ?auto_78975 ?auto_78978 ) ) ( not ( = ?auto_78975 ?auto_78979 ) ) ( not ( = ?auto_78976 ?auto_78977 ) ) ( not ( = ?auto_78976 ?auto_78978 ) ) ( not ( = ?auto_78976 ?auto_78979 ) ) ( not ( = ?auto_78977 ?auto_78978 ) ) ( not ( = ?auto_78977 ?auto_78979 ) ) ( not ( = ?auto_78978 ?auto_78979 ) ) ( ON ?auto_78979 ?auto_78982 ) ( not ( = ?auto_78975 ?auto_78982 ) ) ( not ( = ?auto_78976 ?auto_78982 ) ) ( not ( = ?auto_78977 ?auto_78982 ) ) ( not ( = ?auto_78978 ?auto_78982 ) ) ( not ( = ?auto_78979 ?auto_78982 ) ) ( ON ?auto_78978 ?auto_78979 ) ( ON-TABLE ?auto_78981 ) ( ON ?auto_78980 ?auto_78981 ) ( ON ?auto_78982 ?auto_78980 ) ( not ( = ?auto_78981 ?auto_78980 ) ) ( not ( = ?auto_78981 ?auto_78982 ) ) ( not ( = ?auto_78981 ?auto_78979 ) ) ( not ( = ?auto_78981 ?auto_78978 ) ) ( not ( = ?auto_78980 ?auto_78982 ) ) ( not ( = ?auto_78980 ?auto_78979 ) ) ( not ( = ?auto_78980 ?auto_78978 ) ) ( not ( = ?auto_78975 ?auto_78981 ) ) ( not ( = ?auto_78975 ?auto_78980 ) ) ( not ( = ?auto_78976 ?auto_78981 ) ) ( not ( = ?auto_78976 ?auto_78980 ) ) ( not ( = ?auto_78977 ?auto_78981 ) ) ( not ( = ?auto_78977 ?auto_78980 ) ) ( ON ?auto_78977 ?auto_78978 ) ( CLEAR ?auto_78975 ) ( ON ?auto_78976 ?auto_78977 ) ( CLEAR ?auto_78976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78981 ?auto_78980 ?auto_78982 ?auto_78979 ?auto_78978 ?auto_78977 )
      ( MAKE-5PILE ?auto_78975 ?auto_78976 ?auto_78977 ?auto_78978 ?auto_78979 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78983 - BLOCK
      ?auto_78984 - BLOCK
      ?auto_78985 - BLOCK
      ?auto_78986 - BLOCK
      ?auto_78987 - BLOCK
    )
    :vars
    (
      ?auto_78989 - BLOCK
      ?auto_78990 - BLOCK
      ?auto_78988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78983 ?auto_78984 ) ) ( not ( = ?auto_78983 ?auto_78985 ) ) ( not ( = ?auto_78983 ?auto_78986 ) ) ( not ( = ?auto_78983 ?auto_78987 ) ) ( not ( = ?auto_78984 ?auto_78985 ) ) ( not ( = ?auto_78984 ?auto_78986 ) ) ( not ( = ?auto_78984 ?auto_78987 ) ) ( not ( = ?auto_78985 ?auto_78986 ) ) ( not ( = ?auto_78985 ?auto_78987 ) ) ( not ( = ?auto_78986 ?auto_78987 ) ) ( ON ?auto_78987 ?auto_78989 ) ( not ( = ?auto_78983 ?auto_78989 ) ) ( not ( = ?auto_78984 ?auto_78989 ) ) ( not ( = ?auto_78985 ?auto_78989 ) ) ( not ( = ?auto_78986 ?auto_78989 ) ) ( not ( = ?auto_78987 ?auto_78989 ) ) ( ON ?auto_78986 ?auto_78987 ) ( ON-TABLE ?auto_78990 ) ( ON ?auto_78988 ?auto_78990 ) ( ON ?auto_78989 ?auto_78988 ) ( not ( = ?auto_78990 ?auto_78988 ) ) ( not ( = ?auto_78990 ?auto_78989 ) ) ( not ( = ?auto_78990 ?auto_78987 ) ) ( not ( = ?auto_78990 ?auto_78986 ) ) ( not ( = ?auto_78988 ?auto_78989 ) ) ( not ( = ?auto_78988 ?auto_78987 ) ) ( not ( = ?auto_78988 ?auto_78986 ) ) ( not ( = ?auto_78983 ?auto_78990 ) ) ( not ( = ?auto_78983 ?auto_78988 ) ) ( not ( = ?auto_78984 ?auto_78990 ) ) ( not ( = ?auto_78984 ?auto_78988 ) ) ( not ( = ?auto_78985 ?auto_78990 ) ) ( not ( = ?auto_78985 ?auto_78988 ) ) ( ON ?auto_78985 ?auto_78986 ) ( ON ?auto_78984 ?auto_78985 ) ( CLEAR ?auto_78984 ) ( HOLDING ?auto_78983 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78983 )
      ( MAKE-5PILE ?auto_78983 ?auto_78984 ?auto_78985 ?auto_78986 ?auto_78987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_78991 - BLOCK
      ?auto_78992 - BLOCK
      ?auto_78993 - BLOCK
      ?auto_78994 - BLOCK
      ?auto_78995 - BLOCK
    )
    :vars
    (
      ?auto_78997 - BLOCK
      ?auto_78996 - BLOCK
      ?auto_78998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78991 ?auto_78992 ) ) ( not ( = ?auto_78991 ?auto_78993 ) ) ( not ( = ?auto_78991 ?auto_78994 ) ) ( not ( = ?auto_78991 ?auto_78995 ) ) ( not ( = ?auto_78992 ?auto_78993 ) ) ( not ( = ?auto_78992 ?auto_78994 ) ) ( not ( = ?auto_78992 ?auto_78995 ) ) ( not ( = ?auto_78993 ?auto_78994 ) ) ( not ( = ?auto_78993 ?auto_78995 ) ) ( not ( = ?auto_78994 ?auto_78995 ) ) ( ON ?auto_78995 ?auto_78997 ) ( not ( = ?auto_78991 ?auto_78997 ) ) ( not ( = ?auto_78992 ?auto_78997 ) ) ( not ( = ?auto_78993 ?auto_78997 ) ) ( not ( = ?auto_78994 ?auto_78997 ) ) ( not ( = ?auto_78995 ?auto_78997 ) ) ( ON ?auto_78994 ?auto_78995 ) ( ON-TABLE ?auto_78996 ) ( ON ?auto_78998 ?auto_78996 ) ( ON ?auto_78997 ?auto_78998 ) ( not ( = ?auto_78996 ?auto_78998 ) ) ( not ( = ?auto_78996 ?auto_78997 ) ) ( not ( = ?auto_78996 ?auto_78995 ) ) ( not ( = ?auto_78996 ?auto_78994 ) ) ( not ( = ?auto_78998 ?auto_78997 ) ) ( not ( = ?auto_78998 ?auto_78995 ) ) ( not ( = ?auto_78998 ?auto_78994 ) ) ( not ( = ?auto_78991 ?auto_78996 ) ) ( not ( = ?auto_78991 ?auto_78998 ) ) ( not ( = ?auto_78992 ?auto_78996 ) ) ( not ( = ?auto_78992 ?auto_78998 ) ) ( not ( = ?auto_78993 ?auto_78996 ) ) ( not ( = ?auto_78993 ?auto_78998 ) ) ( ON ?auto_78993 ?auto_78994 ) ( ON ?auto_78992 ?auto_78993 ) ( ON ?auto_78991 ?auto_78992 ) ( CLEAR ?auto_78991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78996 ?auto_78998 ?auto_78997 ?auto_78995 ?auto_78994 ?auto_78993 ?auto_78992 )
      ( MAKE-5PILE ?auto_78991 ?auto_78992 ?auto_78993 ?auto_78994 ?auto_78995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79001 - BLOCK
      ?auto_79002 - BLOCK
    )
    :vars
    (
      ?auto_79003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79003 ?auto_79002 ) ( CLEAR ?auto_79003 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79001 ) ( ON ?auto_79002 ?auto_79001 ) ( not ( = ?auto_79001 ?auto_79002 ) ) ( not ( = ?auto_79001 ?auto_79003 ) ) ( not ( = ?auto_79002 ?auto_79003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79003 ?auto_79002 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79004 - BLOCK
      ?auto_79005 - BLOCK
    )
    :vars
    (
      ?auto_79006 - BLOCK
      ?auto_79007 - BLOCK
      ?auto_79008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79006 ?auto_79005 ) ( CLEAR ?auto_79006 ) ( ON-TABLE ?auto_79004 ) ( ON ?auto_79005 ?auto_79004 ) ( not ( = ?auto_79004 ?auto_79005 ) ) ( not ( = ?auto_79004 ?auto_79006 ) ) ( not ( = ?auto_79005 ?auto_79006 ) ) ( HOLDING ?auto_79007 ) ( CLEAR ?auto_79008 ) ( not ( = ?auto_79004 ?auto_79007 ) ) ( not ( = ?auto_79004 ?auto_79008 ) ) ( not ( = ?auto_79005 ?auto_79007 ) ) ( not ( = ?auto_79005 ?auto_79008 ) ) ( not ( = ?auto_79006 ?auto_79007 ) ) ( not ( = ?auto_79006 ?auto_79008 ) ) ( not ( = ?auto_79007 ?auto_79008 ) ) )
    :subtasks
    ( ( !STACK ?auto_79007 ?auto_79008 )
      ( MAKE-2PILE ?auto_79004 ?auto_79005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79009 - BLOCK
      ?auto_79010 - BLOCK
    )
    :vars
    (
      ?auto_79012 - BLOCK
      ?auto_79011 - BLOCK
      ?auto_79013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79012 ?auto_79010 ) ( ON-TABLE ?auto_79009 ) ( ON ?auto_79010 ?auto_79009 ) ( not ( = ?auto_79009 ?auto_79010 ) ) ( not ( = ?auto_79009 ?auto_79012 ) ) ( not ( = ?auto_79010 ?auto_79012 ) ) ( CLEAR ?auto_79011 ) ( not ( = ?auto_79009 ?auto_79013 ) ) ( not ( = ?auto_79009 ?auto_79011 ) ) ( not ( = ?auto_79010 ?auto_79013 ) ) ( not ( = ?auto_79010 ?auto_79011 ) ) ( not ( = ?auto_79012 ?auto_79013 ) ) ( not ( = ?auto_79012 ?auto_79011 ) ) ( not ( = ?auto_79013 ?auto_79011 ) ) ( ON ?auto_79013 ?auto_79012 ) ( CLEAR ?auto_79013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79009 ?auto_79010 ?auto_79012 )
      ( MAKE-2PILE ?auto_79009 ?auto_79010 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79014 - BLOCK
      ?auto_79015 - BLOCK
    )
    :vars
    (
      ?auto_79018 - BLOCK
      ?auto_79017 - BLOCK
      ?auto_79016 - BLOCK
      ?auto_79020 - BLOCK
      ?auto_79019 - BLOCK
      ?auto_79021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79018 ?auto_79015 ) ( ON-TABLE ?auto_79014 ) ( ON ?auto_79015 ?auto_79014 ) ( not ( = ?auto_79014 ?auto_79015 ) ) ( not ( = ?auto_79014 ?auto_79018 ) ) ( not ( = ?auto_79015 ?auto_79018 ) ) ( not ( = ?auto_79014 ?auto_79017 ) ) ( not ( = ?auto_79014 ?auto_79016 ) ) ( not ( = ?auto_79015 ?auto_79017 ) ) ( not ( = ?auto_79015 ?auto_79016 ) ) ( not ( = ?auto_79018 ?auto_79017 ) ) ( not ( = ?auto_79018 ?auto_79016 ) ) ( not ( = ?auto_79017 ?auto_79016 ) ) ( ON ?auto_79017 ?auto_79018 ) ( CLEAR ?auto_79017 ) ( HOLDING ?auto_79016 ) ( CLEAR ?auto_79020 ) ( ON-TABLE ?auto_79019 ) ( ON ?auto_79021 ?auto_79019 ) ( ON ?auto_79020 ?auto_79021 ) ( not ( = ?auto_79019 ?auto_79021 ) ) ( not ( = ?auto_79019 ?auto_79020 ) ) ( not ( = ?auto_79019 ?auto_79016 ) ) ( not ( = ?auto_79021 ?auto_79020 ) ) ( not ( = ?auto_79021 ?auto_79016 ) ) ( not ( = ?auto_79020 ?auto_79016 ) ) ( not ( = ?auto_79014 ?auto_79020 ) ) ( not ( = ?auto_79014 ?auto_79019 ) ) ( not ( = ?auto_79014 ?auto_79021 ) ) ( not ( = ?auto_79015 ?auto_79020 ) ) ( not ( = ?auto_79015 ?auto_79019 ) ) ( not ( = ?auto_79015 ?auto_79021 ) ) ( not ( = ?auto_79018 ?auto_79020 ) ) ( not ( = ?auto_79018 ?auto_79019 ) ) ( not ( = ?auto_79018 ?auto_79021 ) ) ( not ( = ?auto_79017 ?auto_79020 ) ) ( not ( = ?auto_79017 ?auto_79019 ) ) ( not ( = ?auto_79017 ?auto_79021 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79019 ?auto_79021 ?auto_79020 ?auto_79016 )
      ( MAKE-2PILE ?auto_79014 ?auto_79015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79022 - BLOCK
      ?auto_79023 - BLOCK
    )
    :vars
    (
      ?auto_79026 - BLOCK
      ?auto_79024 - BLOCK
      ?auto_79028 - BLOCK
      ?auto_79029 - BLOCK
      ?auto_79027 - BLOCK
      ?auto_79025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79026 ?auto_79023 ) ( ON-TABLE ?auto_79022 ) ( ON ?auto_79023 ?auto_79022 ) ( not ( = ?auto_79022 ?auto_79023 ) ) ( not ( = ?auto_79022 ?auto_79026 ) ) ( not ( = ?auto_79023 ?auto_79026 ) ) ( not ( = ?auto_79022 ?auto_79024 ) ) ( not ( = ?auto_79022 ?auto_79028 ) ) ( not ( = ?auto_79023 ?auto_79024 ) ) ( not ( = ?auto_79023 ?auto_79028 ) ) ( not ( = ?auto_79026 ?auto_79024 ) ) ( not ( = ?auto_79026 ?auto_79028 ) ) ( not ( = ?auto_79024 ?auto_79028 ) ) ( ON ?auto_79024 ?auto_79026 ) ( CLEAR ?auto_79029 ) ( ON-TABLE ?auto_79027 ) ( ON ?auto_79025 ?auto_79027 ) ( ON ?auto_79029 ?auto_79025 ) ( not ( = ?auto_79027 ?auto_79025 ) ) ( not ( = ?auto_79027 ?auto_79029 ) ) ( not ( = ?auto_79027 ?auto_79028 ) ) ( not ( = ?auto_79025 ?auto_79029 ) ) ( not ( = ?auto_79025 ?auto_79028 ) ) ( not ( = ?auto_79029 ?auto_79028 ) ) ( not ( = ?auto_79022 ?auto_79029 ) ) ( not ( = ?auto_79022 ?auto_79027 ) ) ( not ( = ?auto_79022 ?auto_79025 ) ) ( not ( = ?auto_79023 ?auto_79029 ) ) ( not ( = ?auto_79023 ?auto_79027 ) ) ( not ( = ?auto_79023 ?auto_79025 ) ) ( not ( = ?auto_79026 ?auto_79029 ) ) ( not ( = ?auto_79026 ?auto_79027 ) ) ( not ( = ?auto_79026 ?auto_79025 ) ) ( not ( = ?auto_79024 ?auto_79029 ) ) ( not ( = ?auto_79024 ?auto_79027 ) ) ( not ( = ?auto_79024 ?auto_79025 ) ) ( ON ?auto_79028 ?auto_79024 ) ( CLEAR ?auto_79028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79022 ?auto_79023 ?auto_79026 ?auto_79024 )
      ( MAKE-2PILE ?auto_79022 ?auto_79023 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79030 - BLOCK
      ?auto_79031 - BLOCK
    )
    :vars
    (
      ?auto_79036 - BLOCK
      ?auto_79032 - BLOCK
      ?auto_79035 - BLOCK
      ?auto_79034 - BLOCK
      ?auto_79037 - BLOCK
      ?auto_79033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79036 ?auto_79031 ) ( ON-TABLE ?auto_79030 ) ( ON ?auto_79031 ?auto_79030 ) ( not ( = ?auto_79030 ?auto_79031 ) ) ( not ( = ?auto_79030 ?auto_79036 ) ) ( not ( = ?auto_79031 ?auto_79036 ) ) ( not ( = ?auto_79030 ?auto_79032 ) ) ( not ( = ?auto_79030 ?auto_79035 ) ) ( not ( = ?auto_79031 ?auto_79032 ) ) ( not ( = ?auto_79031 ?auto_79035 ) ) ( not ( = ?auto_79036 ?auto_79032 ) ) ( not ( = ?auto_79036 ?auto_79035 ) ) ( not ( = ?auto_79032 ?auto_79035 ) ) ( ON ?auto_79032 ?auto_79036 ) ( ON-TABLE ?auto_79034 ) ( ON ?auto_79037 ?auto_79034 ) ( not ( = ?auto_79034 ?auto_79037 ) ) ( not ( = ?auto_79034 ?auto_79033 ) ) ( not ( = ?auto_79034 ?auto_79035 ) ) ( not ( = ?auto_79037 ?auto_79033 ) ) ( not ( = ?auto_79037 ?auto_79035 ) ) ( not ( = ?auto_79033 ?auto_79035 ) ) ( not ( = ?auto_79030 ?auto_79033 ) ) ( not ( = ?auto_79030 ?auto_79034 ) ) ( not ( = ?auto_79030 ?auto_79037 ) ) ( not ( = ?auto_79031 ?auto_79033 ) ) ( not ( = ?auto_79031 ?auto_79034 ) ) ( not ( = ?auto_79031 ?auto_79037 ) ) ( not ( = ?auto_79036 ?auto_79033 ) ) ( not ( = ?auto_79036 ?auto_79034 ) ) ( not ( = ?auto_79036 ?auto_79037 ) ) ( not ( = ?auto_79032 ?auto_79033 ) ) ( not ( = ?auto_79032 ?auto_79034 ) ) ( not ( = ?auto_79032 ?auto_79037 ) ) ( ON ?auto_79035 ?auto_79032 ) ( CLEAR ?auto_79035 ) ( HOLDING ?auto_79033 ) ( CLEAR ?auto_79037 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79034 ?auto_79037 ?auto_79033 )
      ( MAKE-2PILE ?auto_79030 ?auto_79031 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79038 - BLOCK
      ?auto_79039 - BLOCK
    )
    :vars
    (
      ?auto_79043 - BLOCK
      ?auto_79040 - BLOCK
      ?auto_79045 - BLOCK
      ?auto_79044 - BLOCK
      ?auto_79041 - BLOCK
      ?auto_79042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79043 ?auto_79039 ) ( ON-TABLE ?auto_79038 ) ( ON ?auto_79039 ?auto_79038 ) ( not ( = ?auto_79038 ?auto_79039 ) ) ( not ( = ?auto_79038 ?auto_79043 ) ) ( not ( = ?auto_79039 ?auto_79043 ) ) ( not ( = ?auto_79038 ?auto_79040 ) ) ( not ( = ?auto_79038 ?auto_79045 ) ) ( not ( = ?auto_79039 ?auto_79040 ) ) ( not ( = ?auto_79039 ?auto_79045 ) ) ( not ( = ?auto_79043 ?auto_79040 ) ) ( not ( = ?auto_79043 ?auto_79045 ) ) ( not ( = ?auto_79040 ?auto_79045 ) ) ( ON ?auto_79040 ?auto_79043 ) ( ON-TABLE ?auto_79044 ) ( ON ?auto_79041 ?auto_79044 ) ( not ( = ?auto_79044 ?auto_79041 ) ) ( not ( = ?auto_79044 ?auto_79042 ) ) ( not ( = ?auto_79044 ?auto_79045 ) ) ( not ( = ?auto_79041 ?auto_79042 ) ) ( not ( = ?auto_79041 ?auto_79045 ) ) ( not ( = ?auto_79042 ?auto_79045 ) ) ( not ( = ?auto_79038 ?auto_79042 ) ) ( not ( = ?auto_79038 ?auto_79044 ) ) ( not ( = ?auto_79038 ?auto_79041 ) ) ( not ( = ?auto_79039 ?auto_79042 ) ) ( not ( = ?auto_79039 ?auto_79044 ) ) ( not ( = ?auto_79039 ?auto_79041 ) ) ( not ( = ?auto_79043 ?auto_79042 ) ) ( not ( = ?auto_79043 ?auto_79044 ) ) ( not ( = ?auto_79043 ?auto_79041 ) ) ( not ( = ?auto_79040 ?auto_79042 ) ) ( not ( = ?auto_79040 ?auto_79044 ) ) ( not ( = ?auto_79040 ?auto_79041 ) ) ( ON ?auto_79045 ?auto_79040 ) ( CLEAR ?auto_79041 ) ( ON ?auto_79042 ?auto_79045 ) ( CLEAR ?auto_79042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79038 ?auto_79039 ?auto_79043 ?auto_79040 ?auto_79045 )
      ( MAKE-2PILE ?auto_79038 ?auto_79039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79046 - BLOCK
      ?auto_79047 - BLOCK
    )
    :vars
    (
      ?auto_79053 - BLOCK
      ?auto_79050 - BLOCK
      ?auto_79051 - BLOCK
      ?auto_79052 - BLOCK
      ?auto_79049 - BLOCK
      ?auto_79048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79053 ?auto_79047 ) ( ON-TABLE ?auto_79046 ) ( ON ?auto_79047 ?auto_79046 ) ( not ( = ?auto_79046 ?auto_79047 ) ) ( not ( = ?auto_79046 ?auto_79053 ) ) ( not ( = ?auto_79047 ?auto_79053 ) ) ( not ( = ?auto_79046 ?auto_79050 ) ) ( not ( = ?auto_79046 ?auto_79051 ) ) ( not ( = ?auto_79047 ?auto_79050 ) ) ( not ( = ?auto_79047 ?auto_79051 ) ) ( not ( = ?auto_79053 ?auto_79050 ) ) ( not ( = ?auto_79053 ?auto_79051 ) ) ( not ( = ?auto_79050 ?auto_79051 ) ) ( ON ?auto_79050 ?auto_79053 ) ( ON-TABLE ?auto_79052 ) ( not ( = ?auto_79052 ?auto_79049 ) ) ( not ( = ?auto_79052 ?auto_79048 ) ) ( not ( = ?auto_79052 ?auto_79051 ) ) ( not ( = ?auto_79049 ?auto_79048 ) ) ( not ( = ?auto_79049 ?auto_79051 ) ) ( not ( = ?auto_79048 ?auto_79051 ) ) ( not ( = ?auto_79046 ?auto_79048 ) ) ( not ( = ?auto_79046 ?auto_79052 ) ) ( not ( = ?auto_79046 ?auto_79049 ) ) ( not ( = ?auto_79047 ?auto_79048 ) ) ( not ( = ?auto_79047 ?auto_79052 ) ) ( not ( = ?auto_79047 ?auto_79049 ) ) ( not ( = ?auto_79053 ?auto_79048 ) ) ( not ( = ?auto_79053 ?auto_79052 ) ) ( not ( = ?auto_79053 ?auto_79049 ) ) ( not ( = ?auto_79050 ?auto_79048 ) ) ( not ( = ?auto_79050 ?auto_79052 ) ) ( not ( = ?auto_79050 ?auto_79049 ) ) ( ON ?auto_79051 ?auto_79050 ) ( ON ?auto_79048 ?auto_79051 ) ( CLEAR ?auto_79048 ) ( HOLDING ?auto_79049 ) ( CLEAR ?auto_79052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79052 ?auto_79049 )
      ( MAKE-2PILE ?auto_79046 ?auto_79047 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79054 - BLOCK
      ?auto_79055 - BLOCK
    )
    :vars
    (
      ?auto_79058 - BLOCK
      ?auto_79059 - BLOCK
      ?auto_79057 - BLOCK
      ?auto_79060 - BLOCK
      ?auto_79056 - BLOCK
      ?auto_79061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79058 ?auto_79055 ) ( ON-TABLE ?auto_79054 ) ( ON ?auto_79055 ?auto_79054 ) ( not ( = ?auto_79054 ?auto_79055 ) ) ( not ( = ?auto_79054 ?auto_79058 ) ) ( not ( = ?auto_79055 ?auto_79058 ) ) ( not ( = ?auto_79054 ?auto_79059 ) ) ( not ( = ?auto_79054 ?auto_79057 ) ) ( not ( = ?auto_79055 ?auto_79059 ) ) ( not ( = ?auto_79055 ?auto_79057 ) ) ( not ( = ?auto_79058 ?auto_79059 ) ) ( not ( = ?auto_79058 ?auto_79057 ) ) ( not ( = ?auto_79059 ?auto_79057 ) ) ( ON ?auto_79059 ?auto_79058 ) ( ON-TABLE ?auto_79060 ) ( not ( = ?auto_79060 ?auto_79056 ) ) ( not ( = ?auto_79060 ?auto_79061 ) ) ( not ( = ?auto_79060 ?auto_79057 ) ) ( not ( = ?auto_79056 ?auto_79061 ) ) ( not ( = ?auto_79056 ?auto_79057 ) ) ( not ( = ?auto_79061 ?auto_79057 ) ) ( not ( = ?auto_79054 ?auto_79061 ) ) ( not ( = ?auto_79054 ?auto_79060 ) ) ( not ( = ?auto_79054 ?auto_79056 ) ) ( not ( = ?auto_79055 ?auto_79061 ) ) ( not ( = ?auto_79055 ?auto_79060 ) ) ( not ( = ?auto_79055 ?auto_79056 ) ) ( not ( = ?auto_79058 ?auto_79061 ) ) ( not ( = ?auto_79058 ?auto_79060 ) ) ( not ( = ?auto_79058 ?auto_79056 ) ) ( not ( = ?auto_79059 ?auto_79061 ) ) ( not ( = ?auto_79059 ?auto_79060 ) ) ( not ( = ?auto_79059 ?auto_79056 ) ) ( ON ?auto_79057 ?auto_79059 ) ( ON ?auto_79061 ?auto_79057 ) ( CLEAR ?auto_79060 ) ( ON ?auto_79056 ?auto_79061 ) ( CLEAR ?auto_79056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79054 ?auto_79055 ?auto_79058 ?auto_79059 ?auto_79057 ?auto_79061 )
      ( MAKE-2PILE ?auto_79054 ?auto_79055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79062 - BLOCK
      ?auto_79063 - BLOCK
    )
    :vars
    (
      ?auto_79068 - BLOCK
      ?auto_79065 - BLOCK
      ?auto_79064 - BLOCK
      ?auto_79066 - BLOCK
      ?auto_79067 - BLOCK
      ?auto_79069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79068 ?auto_79063 ) ( ON-TABLE ?auto_79062 ) ( ON ?auto_79063 ?auto_79062 ) ( not ( = ?auto_79062 ?auto_79063 ) ) ( not ( = ?auto_79062 ?auto_79068 ) ) ( not ( = ?auto_79063 ?auto_79068 ) ) ( not ( = ?auto_79062 ?auto_79065 ) ) ( not ( = ?auto_79062 ?auto_79064 ) ) ( not ( = ?auto_79063 ?auto_79065 ) ) ( not ( = ?auto_79063 ?auto_79064 ) ) ( not ( = ?auto_79068 ?auto_79065 ) ) ( not ( = ?auto_79068 ?auto_79064 ) ) ( not ( = ?auto_79065 ?auto_79064 ) ) ( ON ?auto_79065 ?auto_79068 ) ( not ( = ?auto_79066 ?auto_79067 ) ) ( not ( = ?auto_79066 ?auto_79069 ) ) ( not ( = ?auto_79066 ?auto_79064 ) ) ( not ( = ?auto_79067 ?auto_79069 ) ) ( not ( = ?auto_79067 ?auto_79064 ) ) ( not ( = ?auto_79069 ?auto_79064 ) ) ( not ( = ?auto_79062 ?auto_79069 ) ) ( not ( = ?auto_79062 ?auto_79066 ) ) ( not ( = ?auto_79062 ?auto_79067 ) ) ( not ( = ?auto_79063 ?auto_79069 ) ) ( not ( = ?auto_79063 ?auto_79066 ) ) ( not ( = ?auto_79063 ?auto_79067 ) ) ( not ( = ?auto_79068 ?auto_79069 ) ) ( not ( = ?auto_79068 ?auto_79066 ) ) ( not ( = ?auto_79068 ?auto_79067 ) ) ( not ( = ?auto_79065 ?auto_79069 ) ) ( not ( = ?auto_79065 ?auto_79066 ) ) ( not ( = ?auto_79065 ?auto_79067 ) ) ( ON ?auto_79064 ?auto_79065 ) ( ON ?auto_79069 ?auto_79064 ) ( ON ?auto_79067 ?auto_79069 ) ( CLEAR ?auto_79067 ) ( HOLDING ?auto_79066 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79066 )
      ( MAKE-2PILE ?auto_79062 ?auto_79063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79070 - BLOCK
      ?auto_79071 - BLOCK
    )
    :vars
    (
      ?auto_79072 - BLOCK
      ?auto_79076 - BLOCK
      ?auto_79075 - BLOCK
      ?auto_79073 - BLOCK
      ?auto_79074 - BLOCK
      ?auto_79077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79072 ?auto_79071 ) ( ON-TABLE ?auto_79070 ) ( ON ?auto_79071 ?auto_79070 ) ( not ( = ?auto_79070 ?auto_79071 ) ) ( not ( = ?auto_79070 ?auto_79072 ) ) ( not ( = ?auto_79071 ?auto_79072 ) ) ( not ( = ?auto_79070 ?auto_79076 ) ) ( not ( = ?auto_79070 ?auto_79075 ) ) ( not ( = ?auto_79071 ?auto_79076 ) ) ( not ( = ?auto_79071 ?auto_79075 ) ) ( not ( = ?auto_79072 ?auto_79076 ) ) ( not ( = ?auto_79072 ?auto_79075 ) ) ( not ( = ?auto_79076 ?auto_79075 ) ) ( ON ?auto_79076 ?auto_79072 ) ( not ( = ?auto_79073 ?auto_79074 ) ) ( not ( = ?auto_79073 ?auto_79077 ) ) ( not ( = ?auto_79073 ?auto_79075 ) ) ( not ( = ?auto_79074 ?auto_79077 ) ) ( not ( = ?auto_79074 ?auto_79075 ) ) ( not ( = ?auto_79077 ?auto_79075 ) ) ( not ( = ?auto_79070 ?auto_79077 ) ) ( not ( = ?auto_79070 ?auto_79073 ) ) ( not ( = ?auto_79070 ?auto_79074 ) ) ( not ( = ?auto_79071 ?auto_79077 ) ) ( not ( = ?auto_79071 ?auto_79073 ) ) ( not ( = ?auto_79071 ?auto_79074 ) ) ( not ( = ?auto_79072 ?auto_79077 ) ) ( not ( = ?auto_79072 ?auto_79073 ) ) ( not ( = ?auto_79072 ?auto_79074 ) ) ( not ( = ?auto_79076 ?auto_79077 ) ) ( not ( = ?auto_79076 ?auto_79073 ) ) ( not ( = ?auto_79076 ?auto_79074 ) ) ( ON ?auto_79075 ?auto_79076 ) ( ON ?auto_79077 ?auto_79075 ) ( ON ?auto_79074 ?auto_79077 ) ( ON ?auto_79073 ?auto_79074 ) ( CLEAR ?auto_79073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79070 ?auto_79071 ?auto_79072 ?auto_79076 ?auto_79075 ?auto_79077 ?auto_79074 )
      ( MAKE-2PILE ?auto_79070 ?auto_79071 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79084 - BLOCK
      ?auto_79085 - BLOCK
      ?auto_79086 - BLOCK
      ?auto_79087 - BLOCK
      ?auto_79088 - BLOCK
      ?auto_79089 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79089 ) ( CLEAR ?auto_79088 ) ( ON-TABLE ?auto_79084 ) ( ON ?auto_79085 ?auto_79084 ) ( ON ?auto_79086 ?auto_79085 ) ( ON ?auto_79087 ?auto_79086 ) ( ON ?auto_79088 ?auto_79087 ) ( not ( = ?auto_79084 ?auto_79085 ) ) ( not ( = ?auto_79084 ?auto_79086 ) ) ( not ( = ?auto_79084 ?auto_79087 ) ) ( not ( = ?auto_79084 ?auto_79088 ) ) ( not ( = ?auto_79084 ?auto_79089 ) ) ( not ( = ?auto_79085 ?auto_79086 ) ) ( not ( = ?auto_79085 ?auto_79087 ) ) ( not ( = ?auto_79085 ?auto_79088 ) ) ( not ( = ?auto_79085 ?auto_79089 ) ) ( not ( = ?auto_79086 ?auto_79087 ) ) ( not ( = ?auto_79086 ?auto_79088 ) ) ( not ( = ?auto_79086 ?auto_79089 ) ) ( not ( = ?auto_79087 ?auto_79088 ) ) ( not ( = ?auto_79087 ?auto_79089 ) ) ( not ( = ?auto_79088 ?auto_79089 ) ) )
    :subtasks
    ( ( !STACK ?auto_79089 ?auto_79088 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79090 - BLOCK
      ?auto_79091 - BLOCK
      ?auto_79092 - BLOCK
      ?auto_79093 - BLOCK
      ?auto_79094 - BLOCK
      ?auto_79095 - BLOCK
    )
    :vars
    (
      ?auto_79096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79094 ) ( ON-TABLE ?auto_79090 ) ( ON ?auto_79091 ?auto_79090 ) ( ON ?auto_79092 ?auto_79091 ) ( ON ?auto_79093 ?auto_79092 ) ( ON ?auto_79094 ?auto_79093 ) ( not ( = ?auto_79090 ?auto_79091 ) ) ( not ( = ?auto_79090 ?auto_79092 ) ) ( not ( = ?auto_79090 ?auto_79093 ) ) ( not ( = ?auto_79090 ?auto_79094 ) ) ( not ( = ?auto_79090 ?auto_79095 ) ) ( not ( = ?auto_79091 ?auto_79092 ) ) ( not ( = ?auto_79091 ?auto_79093 ) ) ( not ( = ?auto_79091 ?auto_79094 ) ) ( not ( = ?auto_79091 ?auto_79095 ) ) ( not ( = ?auto_79092 ?auto_79093 ) ) ( not ( = ?auto_79092 ?auto_79094 ) ) ( not ( = ?auto_79092 ?auto_79095 ) ) ( not ( = ?auto_79093 ?auto_79094 ) ) ( not ( = ?auto_79093 ?auto_79095 ) ) ( not ( = ?auto_79094 ?auto_79095 ) ) ( ON ?auto_79095 ?auto_79096 ) ( CLEAR ?auto_79095 ) ( HAND-EMPTY ) ( not ( = ?auto_79090 ?auto_79096 ) ) ( not ( = ?auto_79091 ?auto_79096 ) ) ( not ( = ?auto_79092 ?auto_79096 ) ) ( not ( = ?auto_79093 ?auto_79096 ) ) ( not ( = ?auto_79094 ?auto_79096 ) ) ( not ( = ?auto_79095 ?auto_79096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79095 ?auto_79096 )
      ( MAKE-6PILE ?auto_79090 ?auto_79091 ?auto_79092 ?auto_79093 ?auto_79094 ?auto_79095 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79097 - BLOCK
      ?auto_79098 - BLOCK
      ?auto_79099 - BLOCK
      ?auto_79100 - BLOCK
      ?auto_79101 - BLOCK
      ?auto_79102 - BLOCK
    )
    :vars
    (
      ?auto_79103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79097 ) ( ON ?auto_79098 ?auto_79097 ) ( ON ?auto_79099 ?auto_79098 ) ( ON ?auto_79100 ?auto_79099 ) ( not ( = ?auto_79097 ?auto_79098 ) ) ( not ( = ?auto_79097 ?auto_79099 ) ) ( not ( = ?auto_79097 ?auto_79100 ) ) ( not ( = ?auto_79097 ?auto_79101 ) ) ( not ( = ?auto_79097 ?auto_79102 ) ) ( not ( = ?auto_79098 ?auto_79099 ) ) ( not ( = ?auto_79098 ?auto_79100 ) ) ( not ( = ?auto_79098 ?auto_79101 ) ) ( not ( = ?auto_79098 ?auto_79102 ) ) ( not ( = ?auto_79099 ?auto_79100 ) ) ( not ( = ?auto_79099 ?auto_79101 ) ) ( not ( = ?auto_79099 ?auto_79102 ) ) ( not ( = ?auto_79100 ?auto_79101 ) ) ( not ( = ?auto_79100 ?auto_79102 ) ) ( not ( = ?auto_79101 ?auto_79102 ) ) ( ON ?auto_79102 ?auto_79103 ) ( CLEAR ?auto_79102 ) ( not ( = ?auto_79097 ?auto_79103 ) ) ( not ( = ?auto_79098 ?auto_79103 ) ) ( not ( = ?auto_79099 ?auto_79103 ) ) ( not ( = ?auto_79100 ?auto_79103 ) ) ( not ( = ?auto_79101 ?auto_79103 ) ) ( not ( = ?auto_79102 ?auto_79103 ) ) ( HOLDING ?auto_79101 ) ( CLEAR ?auto_79100 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79097 ?auto_79098 ?auto_79099 ?auto_79100 ?auto_79101 )
      ( MAKE-6PILE ?auto_79097 ?auto_79098 ?auto_79099 ?auto_79100 ?auto_79101 ?auto_79102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79104 - BLOCK
      ?auto_79105 - BLOCK
      ?auto_79106 - BLOCK
      ?auto_79107 - BLOCK
      ?auto_79108 - BLOCK
      ?auto_79109 - BLOCK
    )
    :vars
    (
      ?auto_79110 - BLOCK
      ?auto_79111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79104 ) ( ON ?auto_79105 ?auto_79104 ) ( ON ?auto_79106 ?auto_79105 ) ( ON ?auto_79107 ?auto_79106 ) ( not ( = ?auto_79104 ?auto_79105 ) ) ( not ( = ?auto_79104 ?auto_79106 ) ) ( not ( = ?auto_79104 ?auto_79107 ) ) ( not ( = ?auto_79104 ?auto_79108 ) ) ( not ( = ?auto_79104 ?auto_79109 ) ) ( not ( = ?auto_79105 ?auto_79106 ) ) ( not ( = ?auto_79105 ?auto_79107 ) ) ( not ( = ?auto_79105 ?auto_79108 ) ) ( not ( = ?auto_79105 ?auto_79109 ) ) ( not ( = ?auto_79106 ?auto_79107 ) ) ( not ( = ?auto_79106 ?auto_79108 ) ) ( not ( = ?auto_79106 ?auto_79109 ) ) ( not ( = ?auto_79107 ?auto_79108 ) ) ( not ( = ?auto_79107 ?auto_79109 ) ) ( not ( = ?auto_79108 ?auto_79109 ) ) ( ON ?auto_79109 ?auto_79110 ) ( not ( = ?auto_79104 ?auto_79110 ) ) ( not ( = ?auto_79105 ?auto_79110 ) ) ( not ( = ?auto_79106 ?auto_79110 ) ) ( not ( = ?auto_79107 ?auto_79110 ) ) ( not ( = ?auto_79108 ?auto_79110 ) ) ( not ( = ?auto_79109 ?auto_79110 ) ) ( CLEAR ?auto_79107 ) ( ON ?auto_79108 ?auto_79109 ) ( CLEAR ?auto_79108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79111 ) ( ON ?auto_79110 ?auto_79111 ) ( not ( = ?auto_79111 ?auto_79110 ) ) ( not ( = ?auto_79111 ?auto_79109 ) ) ( not ( = ?auto_79111 ?auto_79108 ) ) ( not ( = ?auto_79104 ?auto_79111 ) ) ( not ( = ?auto_79105 ?auto_79111 ) ) ( not ( = ?auto_79106 ?auto_79111 ) ) ( not ( = ?auto_79107 ?auto_79111 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79111 ?auto_79110 ?auto_79109 )
      ( MAKE-6PILE ?auto_79104 ?auto_79105 ?auto_79106 ?auto_79107 ?auto_79108 ?auto_79109 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79112 - BLOCK
      ?auto_79113 - BLOCK
      ?auto_79114 - BLOCK
      ?auto_79115 - BLOCK
      ?auto_79116 - BLOCK
      ?auto_79117 - BLOCK
    )
    :vars
    (
      ?auto_79119 - BLOCK
      ?auto_79118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79112 ) ( ON ?auto_79113 ?auto_79112 ) ( ON ?auto_79114 ?auto_79113 ) ( not ( = ?auto_79112 ?auto_79113 ) ) ( not ( = ?auto_79112 ?auto_79114 ) ) ( not ( = ?auto_79112 ?auto_79115 ) ) ( not ( = ?auto_79112 ?auto_79116 ) ) ( not ( = ?auto_79112 ?auto_79117 ) ) ( not ( = ?auto_79113 ?auto_79114 ) ) ( not ( = ?auto_79113 ?auto_79115 ) ) ( not ( = ?auto_79113 ?auto_79116 ) ) ( not ( = ?auto_79113 ?auto_79117 ) ) ( not ( = ?auto_79114 ?auto_79115 ) ) ( not ( = ?auto_79114 ?auto_79116 ) ) ( not ( = ?auto_79114 ?auto_79117 ) ) ( not ( = ?auto_79115 ?auto_79116 ) ) ( not ( = ?auto_79115 ?auto_79117 ) ) ( not ( = ?auto_79116 ?auto_79117 ) ) ( ON ?auto_79117 ?auto_79119 ) ( not ( = ?auto_79112 ?auto_79119 ) ) ( not ( = ?auto_79113 ?auto_79119 ) ) ( not ( = ?auto_79114 ?auto_79119 ) ) ( not ( = ?auto_79115 ?auto_79119 ) ) ( not ( = ?auto_79116 ?auto_79119 ) ) ( not ( = ?auto_79117 ?auto_79119 ) ) ( ON ?auto_79116 ?auto_79117 ) ( CLEAR ?auto_79116 ) ( ON-TABLE ?auto_79118 ) ( ON ?auto_79119 ?auto_79118 ) ( not ( = ?auto_79118 ?auto_79119 ) ) ( not ( = ?auto_79118 ?auto_79117 ) ) ( not ( = ?auto_79118 ?auto_79116 ) ) ( not ( = ?auto_79112 ?auto_79118 ) ) ( not ( = ?auto_79113 ?auto_79118 ) ) ( not ( = ?auto_79114 ?auto_79118 ) ) ( not ( = ?auto_79115 ?auto_79118 ) ) ( HOLDING ?auto_79115 ) ( CLEAR ?auto_79114 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79112 ?auto_79113 ?auto_79114 ?auto_79115 )
      ( MAKE-6PILE ?auto_79112 ?auto_79113 ?auto_79114 ?auto_79115 ?auto_79116 ?auto_79117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79120 - BLOCK
      ?auto_79121 - BLOCK
      ?auto_79122 - BLOCK
      ?auto_79123 - BLOCK
      ?auto_79124 - BLOCK
      ?auto_79125 - BLOCK
    )
    :vars
    (
      ?auto_79127 - BLOCK
      ?auto_79126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79120 ) ( ON ?auto_79121 ?auto_79120 ) ( ON ?auto_79122 ?auto_79121 ) ( not ( = ?auto_79120 ?auto_79121 ) ) ( not ( = ?auto_79120 ?auto_79122 ) ) ( not ( = ?auto_79120 ?auto_79123 ) ) ( not ( = ?auto_79120 ?auto_79124 ) ) ( not ( = ?auto_79120 ?auto_79125 ) ) ( not ( = ?auto_79121 ?auto_79122 ) ) ( not ( = ?auto_79121 ?auto_79123 ) ) ( not ( = ?auto_79121 ?auto_79124 ) ) ( not ( = ?auto_79121 ?auto_79125 ) ) ( not ( = ?auto_79122 ?auto_79123 ) ) ( not ( = ?auto_79122 ?auto_79124 ) ) ( not ( = ?auto_79122 ?auto_79125 ) ) ( not ( = ?auto_79123 ?auto_79124 ) ) ( not ( = ?auto_79123 ?auto_79125 ) ) ( not ( = ?auto_79124 ?auto_79125 ) ) ( ON ?auto_79125 ?auto_79127 ) ( not ( = ?auto_79120 ?auto_79127 ) ) ( not ( = ?auto_79121 ?auto_79127 ) ) ( not ( = ?auto_79122 ?auto_79127 ) ) ( not ( = ?auto_79123 ?auto_79127 ) ) ( not ( = ?auto_79124 ?auto_79127 ) ) ( not ( = ?auto_79125 ?auto_79127 ) ) ( ON ?auto_79124 ?auto_79125 ) ( ON-TABLE ?auto_79126 ) ( ON ?auto_79127 ?auto_79126 ) ( not ( = ?auto_79126 ?auto_79127 ) ) ( not ( = ?auto_79126 ?auto_79125 ) ) ( not ( = ?auto_79126 ?auto_79124 ) ) ( not ( = ?auto_79120 ?auto_79126 ) ) ( not ( = ?auto_79121 ?auto_79126 ) ) ( not ( = ?auto_79122 ?auto_79126 ) ) ( not ( = ?auto_79123 ?auto_79126 ) ) ( CLEAR ?auto_79122 ) ( ON ?auto_79123 ?auto_79124 ) ( CLEAR ?auto_79123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79126 ?auto_79127 ?auto_79125 ?auto_79124 )
      ( MAKE-6PILE ?auto_79120 ?auto_79121 ?auto_79122 ?auto_79123 ?auto_79124 ?auto_79125 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79128 - BLOCK
      ?auto_79129 - BLOCK
      ?auto_79130 - BLOCK
      ?auto_79131 - BLOCK
      ?auto_79132 - BLOCK
      ?auto_79133 - BLOCK
    )
    :vars
    (
      ?auto_79134 - BLOCK
      ?auto_79135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79128 ) ( ON ?auto_79129 ?auto_79128 ) ( not ( = ?auto_79128 ?auto_79129 ) ) ( not ( = ?auto_79128 ?auto_79130 ) ) ( not ( = ?auto_79128 ?auto_79131 ) ) ( not ( = ?auto_79128 ?auto_79132 ) ) ( not ( = ?auto_79128 ?auto_79133 ) ) ( not ( = ?auto_79129 ?auto_79130 ) ) ( not ( = ?auto_79129 ?auto_79131 ) ) ( not ( = ?auto_79129 ?auto_79132 ) ) ( not ( = ?auto_79129 ?auto_79133 ) ) ( not ( = ?auto_79130 ?auto_79131 ) ) ( not ( = ?auto_79130 ?auto_79132 ) ) ( not ( = ?auto_79130 ?auto_79133 ) ) ( not ( = ?auto_79131 ?auto_79132 ) ) ( not ( = ?auto_79131 ?auto_79133 ) ) ( not ( = ?auto_79132 ?auto_79133 ) ) ( ON ?auto_79133 ?auto_79134 ) ( not ( = ?auto_79128 ?auto_79134 ) ) ( not ( = ?auto_79129 ?auto_79134 ) ) ( not ( = ?auto_79130 ?auto_79134 ) ) ( not ( = ?auto_79131 ?auto_79134 ) ) ( not ( = ?auto_79132 ?auto_79134 ) ) ( not ( = ?auto_79133 ?auto_79134 ) ) ( ON ?auto_79132 ?auto_79133 ) ( ON-TABLE ?auto_79135 ) ( ON ?auto_79134 ?auto_79135 ) ( not ( = ?auto_79135 ?auto_79134 ) ) ( not ( = ?auto_79135 ?auto_79133 ) ) ( not ( = ?auto_79135 ?auto_79132 ) ) ( not ( = ?auto_79128 ?auto_79135 ) ) ( not ( = ?auto_79129 ?auto_79135 ) ) ( not ( = ?auto_79130 ?auto_79135 ) ) ( not ( = ?auto_79131 ?auto_79135 ) ) ( ON ?auto_79131 ?auto_79132 ) ( CLEAR ?auto_79131 ) ( HOLDING ?auto_79130 ) ( CLEAR ?auto_79129 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79128 ?auto_79129 ?auto_79130 )
      ( MAKE-6PILE ?auto_79128 ?auto_79129 ?auto_79130 ?auto_79131 ?auto_79132 ?auto_79133 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79136 - BLOCK
      ?auto_79137 - BLOCK
      ?auto_79138 - BLOCK
      ?auto_79139 - BLOCK
      ?auto_79140 - BLOCK
      ?auto_79141 - BLOCK
    )
    :vars
    (
      ?auto_79143 - BLOCK
      ?auto_79142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79136 ) ( ON ?auto_79137 ?auto_79136 ) ( not ( = ?auto_79136 ?auto_79137 ) ) ( not ( = ?auto_79136 ?auto_79138 ) ) ( not ( = ?auto_79136 ?auto_79139 ) ) ( not ( = ?auto_79136 ?auto_79140 ) ) ( not ( = ?auto_79136 ?auto_79141 ) ) ( not ( = ?auto_79137 ?auto_79138 ) ) ( not ( = ?auto_79137 ?auto_79139 ) ) ( not ( = ?auto_79137 ?auto_79140 ) ) ( not ( = ?auto_79137 ?auto_79141 ) ) ( not ( = ?auto_79138 ?auto_79139 ) ) ( not ( = ?auto_79138 ?auto_79140 ) ) ( not ( = ?auto_79138 ?auto_79141 ) ) ( not ( = ?auto_79139 ?auto_79140 ) ) ( not ( = ?auto_79139 ?auto_79141 ) ) ( not ( = ?auto_79140 ?auto_79141 ) ) ( ON ?auto_79141 ?auto_79143 ) ( not ( = ?auto_79136 ?auto_79143 ) ) ( not ( = ?auto_79137 ?auto_79143 ) ) ( not ( = ?auto_79138 ?auto_79143 ) ) ( not ( = ?auto_79139 ?auto_79143 ) ) ( not ( = ?auto_79140 ?auto_79143 ) ) ( not ( = ?auto_79141 ?auto_79143 ) ) ( ON ?auto_79140 ?auto_79141 ) ( ON-TABLE ?auto_79142 ) ( ON ?auto_79143 ?auto_79142 ) ( not ( = ?auto_79142 ?auto_79143 ) ) ( not ( = ?auto_79142 ?auto_79141 ) ) ( not ( = ?auto_79142 ?auto_79140 ) ) ( not ( = ?auto_79136 ?auto_79142 ) ) ( not ( = ?auto_79137 ?auto_79142 ) ) ( not ( = ?auto_79138 ?auto_79142 ) ) ( not ( = ?auto_79139 ?auto_79142 ) ) ( ON ?auto_79139 ?auto_79140 ) ( CLEAR ?auto_79137 ) ( ON ?auto_79138 ?auto_79139 ) ( CLEAR ?auto_79138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79142 ?auto_79143 ?auto_79141 ?auto_79140 ?auto_79139 )
      ( MAKE-6PILE ?auto_79136 ?auto_79137 ?auto_79138 ?auto_79139 ?auto_79140 ?auto_79141 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79144 - BLOCK
      ?auto_79145 - BLOCK
      ?auto_79146 - BLOCK
      ?auto_79147 - BLOCK
      ?auto_79148 - BLOCK
      ?auto_79149 - BLOCK
    )
    :vars
    (
      ?auto_79151 - BLOCK
      ?auto_79150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79144 ) ( not ( = ?auto_79144 ?auto_79145 ) ) ( not ( = ?auto_79144 ?auto_79146 ) ) ( not ( = ?auto_79144 ?auto_79147 ) ) ( not ( = ?auto_79144 ?auto_79148 ) ) ( not ( = ?auto_79144 ?auto_79149 ) ) ( not ( = ?auto_79145 ?auto_79146 ) ) ( not ( = ?auto_79145 ?auto_79147 ) ) ( not ( = ?auto_79145 ?auto_79148 ) ) ( not ( = ?auto_79145 ?auto_79149 ) ) ( not ( = ?auto_79146 ?auto_79147 ) ) ( not ( = ?auto_79146 ?auto_79148 ) ) ( not ( = ?auto_79146 ?auto_79149 ) ) ( not ( = ?auto_79147 ?auto_79148 ) ) ( not ( = ?auto_79147 ?auto_79149 ) ) ( not ( = ?auto_79148 ?auto_79149 ) ) ( ON ?auto_79149 ?auto_79151 ) ( not ( = ?auto_79144 ?auto_79151 ) ) ( not ( = ?auto_79145 ?auto_79151 ) ) ( not ( = ?auto_79146 ?auto_79151 ) ) ( not ( = ?auto_79147 ?auto_79151 ) ) ( not ( = ?auto_79148 ?auto_79151 ) ) ( not ( = ?auto_79149 ?auto_79151 ) ) ( ON ?auto_79148 ?auto_79149 ) ( ON-TABLE ?auto_79150 ) ( ON ?auto_79151 ?auto_79150 ) ( not ( = ?auto_79150 ?auto_79151 ) ) ( not ( = ?auto_79150 ?auto_79149 ) ) ( not ( = ?auto_79150 ?auto_79148 ) ) ( not ( = ?auto_79144 ?auto_79150 ) ) ( not ( = ?auto_79145 ?auto_79150 ) ) ( not ( = ?auto_79146 ?auto_79150 ) ) ( not ( = ?auto_79147 ?auto_79150 ) ) ( ON ?auto_79147 ?auto_79148 ) ( ON ?auto_79146 ?auto_79147 ) ( CLEAR ?auto_79146 ) ( HOLDING ?auto_79145 ) ( CLEAR ?auto_79144 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79144 ?auto_79145 )
      ( MAKE-6PILE ?auto_79144 ?auto_79145 ?auto_79146 ?auto_79147 ?auto_79148 ?auto_79149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79152 - BLOCK
      ?auto_79153 - BLOCK
      ?auto_79154 - BLOCK
      ?auto_79155 - BLOCK
      ?auto_79156 - BLOCK
      ?auto_79157 - BLOCK
    )
    :vars
    (
      ?auto_79159 - BLOCK
      ?auto_79158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79152 ) ( not ( = ?auto_79152 ?auto_79153 ) ) ( not ( = ?auto_79152 ?auto_79154 ) ) ( not ( = ?auto_79152 ?auto_79155 ) ) ( not ( = ?auto_79152 ?auto_79156 ) ) ( not ( = ?auto_79152 ?auto_79157 ) ) ( not ( = ?auto_79153 ?auto_79154 ) ) ( not ( = ?auto_79153 ?auto_79155 ) ) ( not ( = ?auto_79153 ?auto_79156 ) ) ( not ( = ?auto_79153 ?auto_79157 ) ) ( not ( = ?auto_79154 ?auto_79155 ) ) ( not ( = ?auto_79154 ?auto_79156 ) ) ( not ( = ?auto_79154 ?auto_79157 ) ) ( not ( = ?auto_79155 ?auto_79156 ) ) ( not ( = ?auto_79155 ?auto_79157 ) ) ( not ( = ?auto_79156 ?auto_79157 ) ) ( ON ?auto_79157 ?auto_79159 ) ( not ( = ?auto_79152 ?auto_79159 ) ) ( not ( = ?auto_79153 ?auto_79159 ) ) ( not ( = ?auto_79154 ?auto_79159 ) ) ( not ( = ?auto_79155 ?auto_79159 ) ) ( not ( = ?auto_79156 ?auto_79159 ) ) ( not ( = ?auto_79157 ?auto_79159 ) ) ( ON ?auto_79156 ?auto_79157 ) ( ON-TABLE ?auto_79158 ) ( ON ?auto_79159 ?auto_79158 ) ( not ( = ?auto_79158 ?auto_79159 ) ) ( not ( = ?auto_79158 ?auto_79157 ) ) ( not ( = ?auto_79158 ?auto_79156 ) ) ( not ( = ?auto_79152 ?auto_79158 ) ) ( not ( = ?auto_79153 ?auto_79158 ) ) ( not ( = ?auto_79154 ?auto_79158 ) ) ( not ( = ?auto_79155 ?auto_79158 ) ) ( ON ?auto_79155 ?auto_79156 ) ( ON ?auto_79154 ?auto_79155 ) ( CLEAR ?auto_79152 ) ( ON ?auto_79153 ?auto_79154 ) ( CLEAR ?auto_79153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79158 ?auto_79159 ?auto_79157 ?auto_79156 ?auto_79155 ?auto_79154 )
      ( MAKE-6PILE ?auto_79152 ?auto_79153 ?auto_79154 ?auto_79155 ?auto_79156 ?auto_79157 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79160 - BLOCK
      ?auto_79161 - BLOCK
      ?auto_79162 - BLOCK
      ?auto_79163 - BLOCK
      ?auto_79164 - BLOCK
      ?auto_79165 - BLOCK
    )
    :vars
    (
      ?auto_79167 - BLOCK
      ?auto_79166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79160 ?auto_79161 ) ) ( not ( = ?auto_79160 ?auto_79162 ) ) ( not ( = ?auto_79160 ?auto_79163 ) ) ( not ( = ?auto_79160 ?auto_79164 ) ) ( not ( = ?auto_79160 ?auto_79165 ) ) ( not ( = ?auto_79161 ?auto_79162 ) ) ( not ( = ?auto_79161 ?auto_79163 ) ) ( not ( = ?auto_79161 ?auto_79164 ) ) ( not ( = ?auto_79161 ?auto_79165 ) ) ( not ( = ?auto_79162 ?auto_79163 ) ) ( not ( = ?auto_79162 ?auto_79164 ) ) ( not ( = ?auto_79162 ?auto_79165 ) ) ( not ( = ?auto_79163 ?auto_79164 ) ) ( not ( = ?auto_79163 ?auto_79165 ) ) ( not ( = ?auto_79164 ?auto_79165 ) ) ( ON ?auto_79165 ?auto_79167 ) ( not ( = ?auto_79160 ?auto_79167 ) ) ( not ( = ?auto_79161 ?auto_79167 ) ) ( not ( = ?auto_79162 ?auto_79167 ) ) ( not ( = ?auto_79163 ?auto_79167 ) ) ( not ( = ?auto_79164 ?auto_79167 ) ) ( not ( = ?auto_79165 ?auto_79167 ) ) ( ON ?auto_79164 ?auto_79165 ) ( ON-TABLE ?auto_79166 ) ( ON ?auto_79167 ?auto_79166 ) ( not ( = ?auto_79166 ?auto_79167 ) ) ( not ( = ?auto_79166 ?auto_79165 ) ) ( not ( = ?auto_79166 ?auto_79164 ) ) ( not ( = ?auto_79160 ?auto_79166 ) ) ( not ( = ?auto_79161 ?auto_79166 ) ) ( not ( = ?auto_79162 ?auto_79166 ) ) ( not ( = ?auto_79163 ?auto_79166 ) ) ( ON ?auto_79163 ?auto_79164 ) ( ON ?auto_79162 ?auto_79163 ) ( ON ?auto_79161 ?auto_79162 ) ( CLEAR ?auto_79161 ) ( HOLDING ?auto_79160 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79160 )
      ( MAKE-6PILE ?auto_79160 ?auto_79161 ?auto_79162 ?auto_79163 ?auto_79164 ?auto_79165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79168 - BLOCK
      ?auto_79169 - BLOCK
      ?auto_79170 - BLOCK
      ?auto_79171 - BLOCK
      ?auto_79172 - BLOCK
      ?auto_79173 - BLOCK
    )
    :vars
    (
      ?auto_79174 - BLOCK
      ?auto_79175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79168 ?auto_79169 ) ) ( not ( = ?auto_79168 ?auto_79170 ) ) ( not ( = ?auto_79168 ?auto_79171 ) ) ( not ( = ?auto_79168 ?auto_79172 ) ) ( not ( = ?auto_79168 ?auto_79173 ) ) ( not ( = ?auto_79169 ?auto_79170 ) ) ( not ( = ?auto_79169 ?auto_79171 ) ) ( not ( = ?auto_79169 ?auto_79172 ) ) ( not ( = ?auto_79169 ?auto_79173 ) ) ( not ( = ?auto_79170 ?auto_79171 ) ) ( not ( = ?auto_79170 ?auto_79172 ) ) ( not ( = ?auto_79170 ?auto_79173 ) ) ( not ( = ?auto_79171 ?auto_79172 ) ) ( not ( = ?auto_79171 ?auto_79173 ) ) ( not ( = ?auto_79172 ?auto_79173 ) ) ( ON ?auto_79173 ?auto_79174 ) ( not ( = ?auto_79168 ?auto_79174 ) ) ( not ( = ?auto_79169 ?auto_79174 ) ) ( not ( = ?auto_79170 ?auto_79174 ) ) ( not ( = ?auto_79171 ?auto_79174 ) ) ( not ( = ?auto_79172 ?auto_79174 ) ) ( not ( = ?auto_79173 ?auto_79174 ) ) ( ON ?auto_79172 ?auto_79173 ) ( ON-TABLE ?auto_79175 ) ( ON ?auto_79174 ?auto_79175 ) ( not ( = ?auto_79175 ?auto_79174 ) ) ( not ( = ?auto_79175 ?auto_79173 ) ) ( not ( = ?auto_79175 ?auto_79172 ) ) ( not ( = ?auto_79168 ?auto_79175 ) ) ( not ( = ?auto_79169 ?auto_79175 ) ) ( not ( = ?auto_79170 ?auto_79175 ) ) ( not ( = ?auto_79171 ?auto_79175 ) ) ( ON ?auto_79171 ?auto_79172 ) ( ON ?auto_79170 ?auto_79171 ) ( ON ?auto_79169 ?auto_79170 ) ( ON ?auto_79168 ?auto_79169 ) ( CLEAR ?auto_79168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79175 ?auto_79174 ?auto_79173 ?auto_79172 ?auto_79171 ?auto_79170 ?auto_79169 )
      ( MAKE-6PILE ?auto_79168 ?auto_79169 ?auto_79170 ?auto_79171 ?auto_79172 ?auto_79173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79177 - BLOCK
    )
    :vars
    (
      ?auto_79178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79178 ?auto_79177 ) ( CLEAR ?auto_79178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79177 ) ( not ( = ?auto_79177 ?auto_79178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79178 ?auto_79177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79179 - BLOCK
    )
    :vars
    (
      ?auto_79180 - BLOCK
      ?auto_79181 - BLOCK
      ?auto_79182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79180 ?auto_79179 ) ( CLEAR ?auto_79180 ) ( ON-TABLE ?auto_79179 ) ( not ( = ?auto_79179 ?auto_79180 ) ) ( HOLDING ?auto_79181 ) ( CLEAR ?auto_79182 ) ( not ( = ?auto_79179 ?auto_79181 ) ) ( not ( = ?auto_79179 ?auto_79182 ) ) ( not ( = ?auto_79180 ?auto_79181 ) ) ( not ( = ?auto_79180 ?auto_79182 ) ) ( not ( = ?auto_79181 ?auto_79182 ) ) )
    :subtasks
    ( ( !STACK ?auto_79181 ?auto_79182 )
      ( MAKE-1PILE ?auto_79179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79183 - BLOCK
    )
    :vars
    (
      ?auto_79184 - BLOCK
      ?auto_79185 - BLOCK
      ?auto_79186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79184 ?auto_79183 ) ( ON-TABLE ?auto_79183 ) ( not ( = ?auto_79183 ?auto_79184 ) ) ( CLEAR ?auto_79185 ) ( not ( = ?auto_79183 ?auto_79186 ) ) ( not ( = ?auto_79183 ?auto_79185 ) ) ( not ( = ?auto_79184 ?auto_79186 ) ) ( not ( = ?auto_79184 ?auto_79185 ) ) ( not ( = ?auto_79186 ?auto_79185 ) ) ( ON ?auto_79186 ?auto_79184 ) ( CLEAR ?auto_79186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79183 ?auto_79184 )
      ( MAKE-1PILE ?auto_79183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79187 - BLOCK
    )
    :vars
    (
      ?auto_79189 - BLOCK
      ?auto_79190 - BLOCK
      ?auto_79188 - BLOCK
      ?auto_79194 - BLOCK
      ?auto_79191 - BLOCK
      ?auto_79192 - BLOCK
      ?auto_79193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79189 ?auto_79187 ) ( ON-TABLE ?auto_79187 ) ( not ( = ?auto_79187 ?auto_79189 ) ) ( not ( = ?auto_79187 ?auto_79190 ) ) ( not ( = ?auto_79187 ?auto_79188 ) ) ( not ( = ?auto_79189 ?auto_79190 ) ) ( not ( = ?auto_79189 ?auto_79188 ) ) ( not ( = ?auto_79190 ?auto_79188 ) ) ( ON ?auto_79190 ?auto_79189 ) ( CLEAR ?auto_79190 ) ( HOLDING ?auto_79188 ) ( CLEAR ?auto_79194 ) ( ON-TABLE ?auto_79191 ) ( ON ?auto_79192 ?auto_79191 ) ( ON ?auto_79193 ?auto_79192 ) ( ON ?auto_79194 ?auto_79193 ) ( not ( = ?auto_79191 ?auto_79192 ) ) ( not ( = ?auto_79191 ?auto_79193 ) ) ( not ( = ?auto_79191 ?auto_79194 ) ) ( not ( = ?auto_79191 ?auto_79188 ) ) ( not ( = ?auto_79192 ?auto_79193 ) ) ( not ( = ?auto_79192 ?auto_79194 ) ) ( not ( = ?auto_79192 ?auto_79188 ) ) ( not ( = ?auto_79193 ?auto_79194 ) ) ( not ( = ?auto_79193 ?auto_79188 ) ) ( not ( = ?auto_79194 ?auto_79188 ) ) ( not ( = ?auto_79187 ?auto_79194 ) ) ( not ( = ?auto_79187 ?auto_79191 ) ) ( not ( = ?auto_79187 ?auto_79192 ) ) ( not ( = ?auto_79187 ?auto_79193 ) ) ( not ( = ?auto_79189 ?auto_79194 ) ) ( not ( = ?auto_79189 ?auto_79191 ) ) ( not ( = ?auto_79189 ?auto_79192 ) ) ( not ( = ?auto_79189 ?auto_79193 ) ) ( not ( = ?auto_79190 ?auto_79194 ) ) ( not ( = ?auto_79190 ?auto_79191 ) ) ( not ( = ?auto_79190 ?auto_79192 ) ) ( not ( = ?auto_79190 ?auto_79193 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79191 ?auto_79192 ?auto_79193 ?auto_79194 ?auto_79188 )
      ( MAKE-1PILE ?auto_79187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79195 - BLOCK
    )
    :vars
    (
      ?auto_79201 - BLOCK
      ?auto_79200 - BLOCK
      ?auto_79198 - BLOCK
      ?auto_79199 - BLOCK
      ?auto_79196 - BLOCK
      ?auto_79202 - BLOCK
      ?auto_79197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79201 ?auto_79195 ) ( ON-TABLE ?auto_79195 ) ( not ( = ?auto_79195 ?auto_79201 ) ) ( not ( = ?auto_79195 ?auto_79200 ) ) ( not ( = ?auto_79195 ?auto_79198 ) ) ( not ( = ?auto_79201 ?auto_79200 ) ) ( not ( = ?auto_79201 ?auto_79198 ) ) ( not ( = ?auto_79200 ?auto_79198 ) ) ( ON ?auto_79200 ?auto_79201 ) ( CLEAR ?auto_79199 ) ( ON-TABLE ?auto_79196 ) ( ON ?auto_79202 ?auto_79196 ) ( ON ?auto_79197 ?auto_79202 ) ( ON ?auto_79199 ?auto_79197 ) ( not ( = ?auto_79196 ?auto_79202 ) ) ( not ( = ?auto_79196 ?auto_79197 ) ) ( not ( = ?auto_79196 ?auto_79199 ) ) ( not ( = ?auto_79196 ?auto_79198 ) ) ( not ( = ?auto_79202 ?auto_79197 ) ) ( not ( = ?auto_79202 ?auto_79199 ) ) ( not ( = ?auto_79202 ?auto_79198 ) ) ( not ( = ?auto_79197 ?auto_79199 ) ) ( not ( = ?auto_79197 ?auto_79198 ) ) ( not ( = ?auto_79199 ?auto_79198 ) ) ( not ( = ?auto_79195 ?auto_79199 ) ) ( not ( = ?auto_79195 ?auto_79196 ) ) ( not ( = ?auto_79195 ?auto_79202 ) ) ( not ( = ?auto_79195 ?auto_79197 ) ) ( not ( = ?auto_79201 ?auto_79199 ) ) ( not ( = ?auto_79201 ?auto_79196 ) ) ( not ( = ?auto_79201 ?auto_79202 ) ) ( not ( = ?auto_79201 ?auto_79197 ) ) ( not ( = ?auto_79200 ?auto_79199 ) ) ( not ( = ?auto_79200 ?auto_79196 ) ) ( not ( = ?auto_79200 ?auto_79202 ) ) ( not ( = ?auto_79200 ?auto_79197 ) ) ( ON ?auto_79198 ?auto_79200 ) ( CLEAR ?auto_79198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79195 ?auto_79201 ?auto_79200 )
      ( MAKE-1PILE ?auto_79195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79203 - BLOCK
    )
    :vars
    (
      ?auto_79210 - BLOCK
      ?auto_79205 - BLOCK
      ?auto_79207 - BLOCK
      ?auto_79206 - BLOCK
      ?auto_79209 - BLOCK
      ?auto_79208 - BLOCK
      ?auto_79204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79210 ?auto_79203 ) ( ON-TABLE ?auto_79203 ) ( not ( = ?auto_79203 ?auto_79210 ) ) ( not ( = ?auto_79203 ?auto_79205 ) ) ( not ( = ?auto_79203 ?auto_79207 ) ) ( not ( = ?auto_79210 ?auto_79205 ) ) ( not ( = ?auto_79210 ?auto_79207 ) ) ( not ( = ?auto_79205 ?auto_79207 ) ) ( ON ?auto_79205 ?auto_79210 ) ( ON-TABLE ?auto_79206 ) ( ON ?auto_79209 ?auto_79206 ) ( ON ?auto_79208 ?auto_79209 ) ( not ( = ?auto_79206 ?auto_79209 ) ) ( not ( = ?auto_79206 ?auto_79208 ) ) ( not ( = ?auto_79206 ?auto_79204 ) ) ( not ( = ?auto_79206 ?auto_79207 ) ) ( not ( = ?auto_79209 ?auto_79208 ) ) ( not ( = ?auto_79209 ?auto_79204 ) ) ( not ( = ?auto_79209 ?auto_79207 ) ) ( not ( = ?auto_79208 ?auto_79204 ) ) ( not ( = ?auto_79208 ?auto_79207 ) ) ( not ( = ?auto_79204 ?auto_79207 ) ) ( not ( = ?auto_79203 ?auto_79204 ) ) ( not ( = ?auto_79203 ?auto_79206 ) ) ( not ( = ?auto_79203 ?auto_79209 ) ) ( not ( = ?auto_79203 ?auto_79208 ) ) ( not ( = ?auto_79210 ?auto_79204 ) ) ( not ( = ?auto_79210 ?auto_79206 ) ) ( not ( = ?auto_79210 ?auto_79209 ) ) ( not ( = ?auto_79210 ?auto_79208 ) ) ( not ( = ?auto_79205 ?auto_79204 ) ) ( not ( = ?auto_79205 ?auto_79206 ) ) ( not ( = ?auto_79205 ?auto_79209 ) ) ( not ( = ?auto_79205 ?auto_79208 ) ) ( ON ?auto_79207 ?auto_79205 ) ( CLEAR ?auto_79207 ) ( HOLDING ?auto_79204 ) ( CLEAR ?auto_79208 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79206 ?auto_79209 ?auto_79208 ?auto_79204 )
      ( MAKE-1PILE ?auto_79203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79211 - BLOCK
    )
    :vars
    (
      ?auto_79217 - BLOCK
      ?auto_79216 - BLOCK
      ?auto_79218 - BLOCK
      ?auto_79214 - BLOCK
      ?auto_79215 - BLOCK
      ?auto_79213 - BLOCK
      ?auto_79212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79217 ?auto_79211 ) ( ON-TABLE ?auto_79211 ) ( not ( = ?auto_79211 ?auto_79217 ) ) ( not ( = ?auto_79211 ?auto_79216 ) ) ( not ( = ?auto_79211 ?auto_79218 ) ) ( not ( = ?auto_79217 ?auto_79216 ) ) ( not ( = ?auto_79217 ?auto_79218 ) ) ( not ( = ?auto_79216 ?auto_79218 ) ) ( ON ?auto_79216 ?auto_79217 ) ( ON-TABLE ?auto_79214 ) ( ON ?auto_79215 ?auto_79214 ) ( ON ?auto_79213 ?auto_79215 ) ( not ( = ?auto_79214 ?auto_79215 ) ) ( not ( = ?auto_79214 ?auto_79213 ) ) ( not ( = ?auto_79214 ?auto_79212 ) ) ( not ( = ?auto_79214 ?auto_79218 ) ) ( not ( = ?auto_79215 ?auto_79213 ) ) ( not ( = ?auto_79215 ?auto_79212 ) ) ( not ( = ?auto_79215 ?auto_79218 ) ) ( not ( = ?auto_79213 ?auto_79212 ) ) ( not ( = ?auto_79213 ?auto_79218 ) ) ( not ( = ?auto_79212 ?auto_79218 ) ) ( not ( = ?auto_79211 ?auto_79212 ) ) ( not ( = ?auto_79211 ?auto_79214 ) ) ( not ( = ?auto_79211 ?auto_79215 ) ) ( not ( = ?auto_79211 ?auto_79213 ) ) ( not ( = ?auto_79217 ?auto_79212 ) ) ( not ( = ?auto_79217 ?auto_79214 ) ) ( not ( = ?auto_79217 ?auto_79215 ) ) ( not ( = ?auto_79217 ?auto_79213 ) ) ( not ( = ?auto_79216 ?auto_79212 ) ) ( not ( = ?auto_79216 ?auto_79214 ) ) ( not ( = ?auto_79216 ?auto_79215 ) ) ( not ( = ?auto_79216 ?auto_79213 ) ) ( ON ?auto_79218 ?auto_79216 ) ( CLEAR ?auto_79213 ) ( ON ?auto_79212 ?auto_79218 ) ( CLEAR ?auto_79212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79211 ?auto_79217 ?auto_79216 ?auto_79218 )
      ( MAKE-1PILE ?auto_79211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79219 - BLOCK
    )
    :vars
    (
      ?auto_79221 - BLOCK
      ?auto_79222 - BLOCK
      ?auto_79226 - BLOCK
      ?auto_79220 - BLOCK
      ?auto_79224 - BLOCK
      ?auto_79225 - BLOCK
      ?auto_79223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79221 ?auto_79219 ) ( ON-TABLE ?auto_79219 ) ( not ( = ?auto_79219 ?auto_79221 ) ) ( not ( = ?auto_79219 ?auto_79222 ) ) ( not ( = ?auto_79219 ?auto_79226 ) ) ( not ( = ?auto_79221 ?auto_79222 ) ) ( not ( = ?auto_79221 ?auto_79226 ) ) ( not ( = ?auto_79222 ?auto_79226 ) ) ( ON ?auto_79222 ?auto_79221 ) ( ON-TABLE ?auto_79220 ) ( ON ?auto_79224 ?auto_79220 ) ( not ( = ?auto_79220 ?auto_79224 ) ) ( not ( = ?auto_79220 ?auto_79225 ) ) ( not ( = ?auto_79220 ?auto_79223 ) ) ( not ( = ?auto_79220 ?auto_79226 ) ) ( not ( = ?auto_79224 ?auto_79225 ) ) ( not ( = ?auto_79224 ?auto_79223 ) ) ( not ( = ?auto_79224 ?auto_79226 ) ) ( not ( = ?auto_79225 ?auto_79223 ) ) ( not ( = ?auto_79225 ?auto_79226 ) ) ( not ( = ?auto_79223 ?auto_79226 ) ) ( not ( = ?auto_79219 ?auto_79223 ) ) ( not ( = ?auto_79219 ?auto_79220 ) ) ( not ( = ?auto_79219 ?auto_79224 ) ) ( not ( = ?auto_79219 ?auto_79225 ) ) ( not ( = ?auto_79221 ?auto_79223 ) ) ( not ( = ?auto_79221 ?auto_79220 ) ) ( not ( = ?auto_79221 ?auto_79224 ) ) ( not ( = ?auto_79221 ?auto_79225 ) ) ( not ( = ?auto_79222 ?auto_79223 ) ) ( not ( = ?auto_79222 ?auto_79220 ) ) ( not ( = ?auto_79222 ?auto_79224 ) ) ( not ( = ?auto_79222 ?auto_79225 ) ) ( ON ?auto_79226 ?auto_79222 ) ( ON ?auto_79223 ?auto_79226 ) ( CLEAR ?auto_79223 ) ( HOLDING ?auto_79225 ) ( CLEAR ?auto_79224 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79220 ?auto_79224 ?auto_79225 )
      ( MAKE-1PILE ?auto_79219 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79227 - BLOCK
    )
    :vars
    (
      ?auto_79232 - BLOCK
      ?auto_79229 - BLOCK
      ?auto_79228 - BLOCK
      ?auto_79234 - BLOCK
      ?auto_79231 - BLOCK
      ?auto_79233 - BLOCK
      ?auto_79230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79232 ?auto_79227 ) ( ON-TABLE ?auto_79227 ) ( not ( = ?auto_79227 ?auto_79232 ) ) ( not ( = ?auto_79227 ?auto_79229 ) ) ( not ( = ?auto_79227 ?auto_79228 ) ) ( not ( = ?auto_79232 ?auto_79229 ) ) ( not ( = ?auto_79232 ?auto_79228 ) ) ( not ( = ?auto_79229 ?auto_79228 ) ) ( ON ?auto_79229 ?auto_79232 ) ( ON-TABLE ?auto_79234 ) ( ON ?auto_79231 ?auto_79234 ) ( not ( = ?auto_79234 ?auto_79231 ) ) ( not ( = ?auto_79234 ?auto_79233 ) ) ( not ( = ?auto_79234 ?auto_79230 ) ) ( not ( = ?auto_79234 ?auto_79228 ) ) ( not ( = ?auto_79231 ?auto_79233 ) ) ( not ( = ?auto_79231 ?auto_79230 ) ) ( not ( = ?auto_79231 ?auto_79228 ) ) ( not ( = ?auto_79233 ?auto_79230 ) ) ( not ( = ?auto_79233 ?auto_79228 ) ) ( not ( = ?auto_79230 ?auto_79228 ) ) ( not ( = ?auto_79227 ?auto_79230 ) ) ( not ( = ?auto_79227 ?auto_79234 ) ) ( not ( = ?auto_79227 ?auto_79231 ) ) ( not ( = ?auto_79227 ?auto_79233 ) ) ( not ( = ?auto_79232 ?auto_79230 ) ) ( not ( = ?auto_79232 ?auto_79234 ) ) ( not ( = ?auto_79232 ?auto_79231 ) ) ( not ( = ?auto_79232 ?auto_79233 ) ) ( not ( = ?auto_79229 ?auto_79230 ) ) ( not ( = ?auto_79229 ?auto_79234 ) ) ( not ( = ?auto_79229 ?auto_79231 ) ) ( not ( = ?auto_79229 ?auto_79233 ) ) ( ON ?auto_79228 ?auto_79229 ) ( ON ?auto_79230 ?auto_79228 ) ( CLEAR ?auto_79231 ) ( ON ?auto_79233 ?auto_79230 ) ( CLEAR ?auto_79233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79227 ?auto_79232 ?auto_79229 ?auto_79228 ?auto_79230 )
      ( MAKE-1PILE ?auto_79227 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79235 - BLOCK
    )
    :vars
    (
      ?auto_79237 - BLOCK
      ?auto_79240 - BLOCK
      ?auto_79238 - BLOCK
      ?auto_79242 - BLOCK
      ?auto_79241 - BLOCK
      ?auto_79239 - BLOCK
      ?auto_79236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79237 ?auto_79235 ) ( ON-TABLE ?auto_79235 ) ( not ( = ?auto_79235 ?auto_79237 ) ) ( not ( = ?auto_79235 ?auto_79240 ) ) ( not ( = ?auto_79235 ?auto_79238 ) ) ( not ( = ?auto_79237 ?auto_79240 ) ) ( not ( = ?auto_79237 ?auto_79238 ) ) ( not ( = ?auto_79240 ?auto_79238 ) ) ( ON ?auto_79240 ?auto_79237 ) ( ON-TABLE ?auto_79242 ) ( not ( = ?auto_79242 ?auto_79241 ) ) ( not ( = ?auto_79242 ?auto_79239 ) ) ( not ( = ?auto_79242 ?auto_79236 ) ) ( not ( = ?auto_79242 ?auto_79238 ) ) ( not ( = ?auto_79241 ?auto_79239 ) ) ( not ( = ?auto_79241 ?auto_79236 ) ) ( not ( = ?auto_79241 ?auto_79238 ) ) ( not ( = ?auto_79239 ?auto_79236 ) ) ( not ( = ?auto_79239 ?auto_79238 ) ) ( not ( = ?auto_79236 ?auto_79238 ) ) ( not ( = ?auto_79235 ?auto_79236 ) ) ( not ( = ?auto_79235 ?auto_79242 ) ) ( not ( = ?auto_79235 ?auto_79241 ) ) ( not ( = ?auto_79235 ?auto_79239 ) ) ( not ( = ?auto_79237 ?auto_79236 ) ) ( not ( = ?auto_79237 ?auto_79242 ) ) ( not ( = ?auto_79237 ?auto_79241 ) ) ( not ( = ?auto_79237 ?auto_79239 ) ) ( not ( = ?auto_79240 ?auto_79236 ) ) ( not ( = ?auto_79240 ?auto_79242 ) ) ( not ( = ?auto_79240 ?auto_79241 ) ) ( not ( = ?auto_79240 ?auto_79239 ) ) ( ON ?auto_79238 ?auto_79240 ) ( ON ?auto_79236 ?auto_79238 ) ( ON ?auto_79239 ?auto_79236 ) ( CLEAR ?auto_79239 ) ( HOLDING ?auto_79241 ) ( CLEAR ?auto_79242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79242 ?auto_79241 )
      ( MAKE-1PILE ?auto_79235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79243 - BLOCK
    )
    :vars
    (
      ?auto_79250 - BLOCK
      ?auto_79247 - BLOCK
      ?auto_79244 - BLOCK
      ?auto_79249 - BLOCK
      ?auto_79246 - BLOCK
      ?auto_79248 - BLOCK
      ?auto_79245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79250 ?auto_79243 ) ( ON-TABLE ?auto_79243 ) ( not ( = ?auto_79243 ?auto_79250 ) ) ( not ( = ?auto_79243 ?auto_79247 ) ) ( not ( = ?auto_79243 ?auto_79244 ) ) ( not ( = ?auto_79250 ?auto_79247 ) ) ( not ( = ?auto_79250 ?auto_79244 ) ) ( not ( = ?auto_79247 ?auto_79244 ) ) ( ON ?auto_79247 ?auto_79250 ) ( ON-TABLE ?auto_79249 ) ( not ( = ?auto_79249 ?auto_79246 ) ) ( not ( = ?auto_79249 ?auto_79248 ) ) ( not ( = ?auto_79249 ?auto_79245 ) ) ( not ( = ?auto_79249 ?auto_79244 ) ) ( not ( = ?auto_79246 ?auto_79248 ) ) ( not ( = ?auto_79246 ?auto_79245 ) ) ( not ( = ?auto_79246 ?auto_79244 ) ) ( not ( = ?auto_79248 ?auto_79245 ) ) ( not ( = ?auto_79248 ?auto_79244 ) ) ( not ( = ?auto_79245 ?auto_79244 ) ) ( not ( = ?auto_79243 ?auto_79245 ) ) ( not ( = ?auto_79243 ?auto_79249 ) ) ( not ( = ?auto_79243 ?auto_79246 ) ) ( not ( = ?auto_79243 ?auto_79248 ) ) ( not ( = ?auto_79250 ?auto_79245 ) ) ( not ( = ?auto_79250 ?auto_79249 ) ) ( not ( = ?auto_79250 ?auto_79246 ) ) ( not ( = ?auto_79250 ?auto_79248 ) ) ( not ( = ?auto_79247 ?auto_79245 ) ) ( not ( = ?auto_79247 ?auto_79249 ) ) ( not ( = ?auto_79247 ?auto_79246 ) ) ( not ( = ?auto_79247 ?auto_79248 ) ) ( ON ?auto_79244 ?auto_79247 ) ( ON ?auto_79245 ?auto_79244 ) ( ON ?auto_79248 ?auto_79245 ) ( CLEAR ?auto_79249 ) ( ON ?auto_79246 ?auto_79248 ) ( CLEAR ?auto_79246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79243 ?auto_79250 ?auto_79247 ?auto_79244 ?auto_79245 ?auto_79248 )
      ( MAKE-1PILE ?auto_79243 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79251 - BLOCK
    )
    :vars
    (
      ?auto_79255 - BLOCK
      ?auto_79256 - BLOCK
      ?auto_79253 - BLOCK
      ?auto_79258 - BLOCK
      ?auto_79257 - BLOCK
      ?auto_79252 - BLOCK
      ?auto_79254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79255 ?auto_79251 ) ( ON-TABLE ?auto_79251 ) ( not ( = ?auto_79251 ?auto_79255 ) ) ( not ( = ?auto_79251 ?auto_79256 ) ) ( not ( = ?auto_79251 ?auto_79253 ) ) ( not ( = ?auto_79255 ?auto_79256 ) ) ( not ( = ?auto_79255 ?auto_79253 ) ) ( not ( = ?auto_79256 ?auto_79253 ) ) ( ON ?auto_79256 ?auto_79255 ) ( not ( = ?auto_79258 ?auto_79257 ) ) ( not ( = ?auto_79258 ?auto_79252 ) ) ( not ( = ?auto_79258 ?auto_79254 ) ) ( not ( = ?auto_79258 ?auto_79253 ) ) ( not ( = ?auto_79257 ?auto_79252 ) ) ( not ( = ?auto_79257 ?auto_79254 ) ) ( not ( = ?auto_79257 ?auto_79253 ) ) ( not ( = ?auto_79252 ?auto_79254 ) ) ( not ( = ?auto_79252 ?auto_79253 ) ) ( not ( = ?auto_79254 ?auto_79253 ) ) ( not ( = ?auto_79251 ?auto_79254 ) ) ( not ( = ?auto_79251 ?auto_79258 ) ) ( not ( = ?auto_79251 ?auto_79257 ) ) ( not ( = ?auto_79251 ?auto_79252 ) ) ( not ( = ?auto_79255 ?auto_79254 ) ) ( not ( = ?auto_79255 ?auto_79258 ) ) ( not ( = ?auto_79255 ?auto_79257 ) ) ( not ( = ?auto_79255 ?auto_79252 ) ) ( not ( = ?auto_79256 ?auto_79254 ) ) ( not ( = ?auto_79256 ?auto_79258 ) ) ( not ( = ?auto_79256 ?auto_79257 ) ) ( not ( = ?auto_79256 ?auto_79252 ) ) ( ON ?auto_79253 ?auto_79256 ) ( ON ?auto_79254 ?auto_79253 ) ( ON ?auto_79252 ?auto_79254 ) ( ON ?auto_79257 ?auto_79252 ) ( CLEAR ?auto_79257 ) ( HOLDING ?auto_79258 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79258 )
      ( MAKE-1PILE ?auto_79251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79259 - BLOCK
    )
    :vars
    (
      ?auto_79264 - BLOCK
      ?auto_79266 - BLOCK
      ?auto_79261 - BLOCK
      ?auto_79265 - BLOCK
      ?auto_79262 - BLOCK
      ?auto_79260 - BLOCK
      ?auto_79263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79264 ?auto_79259 ) ( ON-TABLE ?auto_79259 ) ( not ( = ?auto_79259 ?auto_79264 ) ) ( not ( = ?auto_79259 ?auto_79266 ) ) ( not ( = ?auto_79259 ?auto_79261 ) ) ( not ( = ?auto_79264 ?auto_79266 ) ) ( not ( = ?auto_79264 ?auto_79261 ) ) ( not ( = ?auto_79266 ?auto_79261 ) ) ( ON ?auto_79266 ?auto_79264 ) ( not ( = ?auto_79265 ?auto_79262 ) ) ( not ( = ?auto_79265 ?auto_79260 ) ) ( not ( = ?auto_79265 ?auto_79263 ) ) ( not ( = ?auto_79265 ?auto_79261 ) ) ( not ( = ?auto_79262 ?auto_79260 ) ) ( not ( = ?auto_79262 ?auto_79263 ) ) ( not ( = ?auto_79262 ?auto_79261 ) ) ( not ( = ?auto_79260 ?auto_79263 ) ) ( not ( = ?auto_79260 ?auto_79261 ) ) ( not ( = ?auto_79263 ?auto_79261 ) ) ( not ( = ?auto_79259 ?auto_79263 ) ) ( not ( = ?auto_79259 ?auto_79265 ) ) ( not ( = ?auto_79259 ?auto_79262 ) ) ( not ( = ?auto_79259 ?auto_79260 ) ) ( not ( = ?auto_79264 ?auto_79263 ) ) ( not ( = ?auto_79264 ?auto_79265 ) ) ( not ( = ?auto_79264 ?auto_79262 ) ) ( not ( = ?auto_79264 ?auto_79260 ) ) ( not ( = ?auto_79266 ?auto_79263 ) ) ( not ( = ?auto_79266 ?auto_79265 ) ) ( not ( = ?auto_79266 ?auto_79262 ) ) ( not ( = ?auto_79266 ?auto_79260 ) ) ( ON ?auto_79261 ?auto_79266 ) ( ON ?auto_79263 ?auto_79261 ) ( ON ?auto_79260 ?auto_79263 ) ( ON ?auto_79262 ?auto_79260 ) ( ON ?auto_79265 ?auto_79262 ) ( CLEAR ?auto_79265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79259 ?auto_79264 ?auto_79266 ?auto_79261 ?auto_79263 ?auto_79260 ?auto_79262 )
      ( MAKE-1PILE ?auto_79259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79274 - BLOCK
      ?auto_79275 - BLOCK
      ?auto_79276 - BLOCK
      ?auto_79277 - BLOCK
      ?auto_79278 - BLOCK
      ?auto_79279 - BLOCK
      ?auto_79280 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79280 ) ( CLEAR ?auto_79279 ) ( ON-TABLE ?auto_79274 ) ( ON ?auto_79275 ?auto_79274 ) ( ON ?auto_79276 ?auto_79275 ) ( ON ?auto_79277 ?auto_79276 ) ( ON ?auto_79278 ?auto_79277 ) ( ON ?auto_79279 ?auto_79278 ) ( not ( = ?auto_79274 ?auto_79275 ) ) ( not ( = ?auto_79274 ?auto_79276 ) ) ( not ( = ?auto_79274 ?auto_79277 ) ) ( not ( = ?auto_79274 ?auto_79278 ) ) ( not ( = ?auto_79274 ?auto_79279 ) ) ( not ( = ?auto_79274 ?auto_79280 ) ) ( not ( = ?auto_79275 ?auto_79276 ) ) ( not ( = ?auto_79275 ?auto_79277 ) ) ( not ( = ?auto_79275 ?auto_79278 ) ) ( not ( = ?auto_79275 ?auto_79279 ) ) ( not ( = ?auto_79275 ?auto_79280 ) ) ( not ( = ?auto_79276 ?auto_79277 ) ) ( not ( = ?auto_79276 ?auto_79278 ) ) ( not ( = ?auto_79276 ?auto_79279 ) ) ( not ( = ?auto_79276 ?auto_79280 ) ) ( not ( = ?auto_79277 ?auto_79278 ) ) ( not ( = ?auto_79277 ?auto_79279 ) ) ( not ( = ?auto_79277 ?auto_79280 ) ) ( not ( = ?auto_79278 ?auto_79279 ) ) ( not ( = ?auto_79278 ?auto_79280 ) ) ( not ( = ?auto_79279 ?auto_79280 ) ) )
    :subtasks
    ( ( !STACK ?auto_79280 ?auto_79279 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79281 - BLOCK
      ?auto_79282 - BLOCK
      ?auto_79283 - BLOCK
      ?auto_79284 - BLOCK
      ?auto_79285 - BLOCK
      ?auto_79286 - BLOCK
      ?auto_79287 - BLOCK
    )
    :vars
    (
      ?auto_79288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79286 ) ( ON-TABLE ?auto_79281 ) ( ON ?auto_79282 ?auto_79281 ) ( ON ?auto_79283 ?auto_79282 ) ( ON ?auto_79284 ?auto_79283 ) ( ON ?auto_79285 ?auto_79284 ) ( ON ?auto_79286 ?auto_79285 ) ( not ( = ?auto_79281 ?auto_79282 ) ) ( not ( = ?auto_79281 ?auto_79283 ) ) ( not ( = ?auto_79281 ?auto_79284 ) ) ( not ( = ?auto_79281 ?auto_79285 ) ) ( not ( = ?auto_79281 ?auto_79286 ) ) ( not ( = ?auto_79281 ?auto_79287 ) ) ( not ( = ?auto_79282 ?auto_79283 ) ) ( not ( = ?auto_79282 ?auto_79284 ) ) ( not ( = ?auto_79282 ?auto_79285 ) ) ( not ( = ?auto_79282 ?auto_79286 ) ) ( not ( = ?auto_79282 ?auto_79287 ) ) ( not ( = ?auto_79283 ?auto_79284 ) ) ( not ( = ?auto_79283 ?auto_79285 ) ) ( not ( = ?auto_79283 ?auto_79286 ) ) ( not ( = ?auto_79283 ?auto_79287 ) ) ( not ( = ?auto_79284 ?auto_79285 ) ) ( not ( = ?auto_79284 ?auto_79286 ) ) ( not ( = ?auto_79284 ?auto_79287 ) ) ( not ( = ?auto_79285 ?auto_79286 ) ) ( not ( = ?auto_79285 ?auto_79287 ) ) ( not ( = ?auto_79286 ?auto_79287 ) ) ( ON ?auto_79287 ?auto_79288 ) ( CLEAR ?auto_79287 ) ( HAND-EMPTY ) ( not ( = ?auto_79281 ?auto_79288 ) ) ( not ( = ?auto_79282 ?auto_79288 ) ) ( not ( = ?auto_79283 ?auto_79288 ) ) ( not ( = ?auto_79284 ?auto_79288 ) ) ( not ( = ?auto_79285 ?auto_79288 ) ) ( not ( = ?auto_79286 ?auto_79288 ) ) ( not ( = ?auto_79287 ?auto_79288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79287 ?auto_79288 )
      ( MAKE-7PILE ?auto_79281 ?auto_79282 ?auto_79283 ?auto_79284 ?auto_79285 ?auto_79286 ?auto_79287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79289 - BLOCK
      ?auto_79290 - BLOCK
      ?auto_79291 - BLOCK
      ?auto_79292 - BLOCK
      ?auto_79293 - BLOCK
      ?auto_79294 - BLOCK
      ?auto_79295 - BLOCK
    )
    :vars
    (
      ?auto_79296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79289 ) ( ON ?auto_79290 ?auto_79289 ) ( ON ?auto_79291 ?auto_79290 ) ( ON ?auto_79292 ?auto_79291 ) ( ON ?auto_79293 ?auto_79292 ) ( not ( = ?auto_79289 ?auto_79290 ) ) ( not ( = ?auto_79289 ?auto_79291 ) ) ( not ( = ?auto_79289 ?auto_79292 ) ) ( not ( = ?auto_79289 ?auto_79293 ) ) ( not ( = ?auto_79289 ?auto_79294 ) ) ( not ( = ?auto_79289 ?auto_79295 ) ) ( not ( = ?auto_79290 ?auto_79291 ) ) ( not ( = ?auto_79290 ?auto_79292 ) ) ( not ( = ?auto_79290 ?auto_79293 ) ) ( not ( = ?auto_79290 ?auto_79294 ) ) ( not ( = ?auto_79290 ?auto_79295 ) ) ( not ( = ?auto_79291 ?auto_79292 ) ) ( not ( = ?auto_79291 ?auto_79293 ) ) ( not ( = ?auto_79291 ?auto_79294 ) ) ( not ( = ?auto_79291 ?auto_79295 ) ) ( not ( = ?auto_79292 ?auto_79293 ) ) ( not ( = ?auto_79292 ?auto_79294 ) ) ( not ( = ?auto_79292 ?auto_79295 ) ) ( not ( = ?auto_79293 ?auto_79294 ) ) ( not ( = ?auto_79293 ?auto_79295 ) ) ( not ( = ?auto_79294 ?auto_79295 ) ) ( ON ?auto_79295 ?auto_79296 ) ( CLEAR ?auto_79295 ) ( not ( = ?auto_79289 ?auto_79296 ) ) ( not ( = ?auto_79290 ?auto_79296 ) ) ( not ( = ?auto_79291 ?auto_79296 ) ) ( not ( = ?auto_79292 ?auto_79296 ) ) ( not ( = ?auto_79293 ?auto_79296 ) ) ( not ( = ?auto_79294 ?auto_79296 ) ) ( not ( = ?auto_79295 ?auto_79296 ) ) ( HOLDING ?auto_79294 ) ( CLEAR ?auto_79293 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79289 ?auto_79290 ?auto_79291 ?auto_79292 ?auto_79293 ?auto_79294 )
      ( MAKE-7PILE ?auto_79289 ?auto_79290 ?auto_79291 ?auto_79292 ?auto_79293 ?auto_79294 ?auto_79295 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79297 - BLOCK
      ?auto_79298 - BLOCK
      ?auto_79299 - BLOCK
      ?auto_79300 - BLOCK
      ?auto_79301 - BLOCK
      ?auto_79302 - BLOCK
      ?auto_79303 - BLOCK
    )
    :vars
    (
      ?auto_79304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79297 ) ( ON ?auto_79298 ?auto_79297 ) ( ON ?auto_79299 ?auto_79298 ) ( ON ?auto_79300 ?auto_79299 ) ( ON ?auto_79301 ?auto_79300 ) ( not ( = ?auto_79297 ?auto_79298 ) ) ( not ( = ?auto_79297 ?auto_79299 ) ) ( not ( = ?auto_79297 ?auto_79300 ) ) ( not ( = ?auto_79297 ?auto_79301 ) ) ( not ( = ?auto_79297 ?auto_79302 ) ) ( not ( = ?auto_79297 ?auto_79303 ) ) ( not ( = ?auto_79298 ?auto_79299 ) ) ( not ( = ?auto_79298 ?auto_79300 ) ) ( not ( = ?auto_79298 ?auto_79301 ) ) ( not ( = ?auto_79298 ?auto_79302 ) ) ( not ( = ?auto_79298 ?auto_79303 ) ) ( not ( = ?auto_79299 ?auto_79300 ) ) ( not ( = ?auto_79299 ?auto_79301 ) ) ( not ( = ?auto_79299 ?auto_79302 ) ) ( not ( = ?auto_79299 ?auto_79303 ) ) ( not ( = ?auto_79300 ?auto_79301 ) ) ( not ( = ?auto_79300 ?auto_79302 ) ) ( not ( = ?auto_79300 ?auto_79303 ) ) ( not ( = ?auto_79301 ?auto_79302 ) ) ( not ( = ?auto_79301 ?auto_79303 ) ) ( not ( = ?auto_79302 ?auto_79303 ) ) ( ON ?auto_79303 ?auto_79304 ) ( not ( = ?auto_79297 ?auto_79304 ) ) ( not ( = ?auto_79298 ?auto_79304 ) ) ( not ( = ?auto_79299 ?auto_79304 ) ) ( not ( = ?auto_79300 ?auto_79304 ) ) ( not ( = ?auto_79301 ?auto_79304 ) ) ( not ( = ?auto_79302 ?auto_79304 ) ) ( not ( = ?auto_79303 ?auto_79304 ) ) ( CLEAR ?auto_79301 ) ( ON ?auto_79302 ?auto_79303 ) ( CLEAR ?auto_79302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79304 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79304 ?auto_79303 )
      ( MAKE-7PILE ?auto_79297 ?auto_79298 ?auto_79299 ?auto_79300 ?auto_79301 ?auto_79302 ?auto_79303 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79305 - BLOCK
      ?auto_79306 - BLOCK
      ?auto_79307 - BLOCK
      ?auto_79308 - BLOCK
      ?auto_79309 - BLOCK
      ?auto_79310 - BLOCK
      ?auto_79311 - BLOCK
    )
    :vars
    (
      ?auto_79312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79305 ) ( ON ?auto_79306 ?auto_79305 ) ( ON ?auto_79307 ?auto_79306 ) ( ON ?auto_79308 ?auto_79307 ) ( not ( = ?auto_79305 ?auto_79306 ) ) ( not ( = ?auto_79305 ?auto_79307 ) ) ( not ( = ?auto_79305 ?auto_79308 ) ) ( not ( = ?auto_79305 ?auto_79309 ) ) ( not ( = ?auto_79305 ?auto_79310 ) ) ( not ( = ?auto_79305 ?auto_79311 ) ) ( not ( = ?auto_79306 ?auto_79307 ) ) ( not ( = ?auto_79306 ?auto_79308 ) ) ( not ( = ?auto_79306 ?auto_79309 ) ) ( not ( = ?auto_79306 ?auto_79310 ) ) ( not ( = ?auto_79306 ?auto_79311 ) ) ( not ( = ?auto_79307 ?auto_79308 ) ) ( not ( = ?auto_79307 ?auto_79309 ) ) ( not ( = ?auto_79307 ?auto_79310 ) ) ( not ( = ?auto_79307 ?auto_79311 ) ) ( not ( = ?auto_79308 ?auto_79309 ) ) ( not ( = ?auto_79308 ?auto_79310 ) ) ( not ( = ?auto_79308 ?auto_79311 ) ) ( not ( = ?auto_79309 ?auto_79310 ) ) ( not ( = ?auto_79309 ?auto_79311 ) ) ( not ( = ?auto_79310 ?auto_79311 ) ) ( ON ?auto_79311 ?auto_79312 ) ( not ( = ?auto_79305 ?auto_79312 ) ) ( not ( = ?auto_79306 ?auto_79312 ) ) ( not ( = ?auto_79307 ?auto_79312 ) ) ( not ( = ?auto_79308 ?auto_79312 ) ) ( not ( = ?auto_79309 ?auto_79312 ) ) ( not ( = ?auto_79310 ?auto_79312 ) ) ( not ( = ?auto_79311 ?auto_79312 ) ) ( ON ?auto_79310 ?auto_79311 ) ( CLEAR ?auto_79310 ) ( ON-TABLE ?auto_79312 ) ( HOLDING ?auto_79309 ) ( CLEAR ?auto_79308 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79305 ?auto_79306 ?auto_79307 ?auto_79308 ?auto_79309 )
      ( MAKE-7PILE ?auto_79305 ?auto_79306 ?auto_79307 ?auto_79308 ?auto_79309 ?auto_79310 ?auto_79311 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79313 - BLOCK
      ?auto_79314 - BLOCK
      ?auto_79315 - BLOCK
      ?auto_79316 - BLOCK
      ?auto_79317 - BLOCK
      ?auto_79318 - BLOCK
      ?auto_79319 - BLOCK
    )
    :vars
    (
      ?auto_79320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79313 ) ( ON ?auto_79314 ?auto_79313 ) ( ON ?auto_79315 ?auto_79314 ) ( ON ?auto_79316 ?auto_79315 ) ( not ( = ?auto_79313 ?auto_79314 ) ) ( not ( = ?auto_79313 ?auto_79315 ) ) ( not ( = ?auto_79313 ?auto_79316 ) ) ( not ( = ?auto_79313 ?auto_79317 ) ) ( not ( = ?auto_79313 ?auto_79318 ) ) ( not ( = ?auto_79313 ?auto_79319 ) ) ( not ( = ?auto_79314 ?auto_79315 ) ) ( not ( = ?auto_79314 ?auto_79316 ) ) ( not ( = ?auto_79314 ?auto_79317 ) ) ( not ( = ?auto_79314 ?auto_79318 ) ) ( not ( = ?auto_79314 ?auto_79319 ) ) ( not ( = ?auto_79315 ?auto_79316 ) ) ( not ( = ?auto_79315 ?auto_79317 ) ) ( not ( = ?auto_79315 ?auto_79318 ) ) ( not ( = ?auto_79315 ?auto_79319 ) ) ( not ( = ?auto_79316 ?auto_79317 ) ) ( not ( = ?auto_79316 ?auto_79318 ) ) ( not ( = ?auto_79316 ?auto_79319 ) ) ( not ( = ?auto_79317 ?auto_79318 ) ) ( not ( = ?auto_79317 ?auto_79319 ) ) ( not ( = ?auto_79318 ?auto_79319 ) ) ( ON ?auto_79319 ?auto_79320 ) ( not ( = ?auto_79313 ?auto_79320 ) ) ( not ( = ?auto_79314 ?auto_79320 ) ) ( not ( = ?auto_79315 ?auto_79320 ) ) ( not ( = ?auto_79316 ?auto_79320 ) ) ( not ( = ?auto_79317 ?auto_79320 ) ) ( not ( = ?auto_79318 ?auto_79320 ) ) ( not ( = ?auto_79319 ?auto_79320 ) ) ( ON ?auto_79318 ?auto_79319 ) ( ON-TABLE ?auto_79320 ) ( CLEAR ?auto_79316 ) ( ON ?auto_79317 ?auto_79318 ) ( CLEAR ?auto_79317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79320 ?auto_79319 ?auto_79318 )
      ( MAKE-7PILE ?auto_79313 ?auto_79314 ?auto_79315 ?auto_79316 ?auto_79317 ?auto_79318 ?auto_79319 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79321 - BLOCK
      ?auto_79322 - BLOCK
      ?auto_79323 - BLOCK
      ?auto_79324 - BLOCK
      ?auto_79325 - BLOCK
      ?auto_79326 - BLOCK
      ?auto_79327 - BLOCK
    )
    :vars
    (
      ?auto_79328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79321 ) ( ON ?auto_79322 ?auto_79321 ) ( ON ?auto_79323 ?auto_79322 ) ( not ( = ?auto_79321 ?auto_79322 ) ) ( not ( = ?auto_79321 ?auto_79323 ) ) ( not ( = ?auto_79321 ?auto_79324 ) ) ( not ( = ?auto_79321 ?auto_79325 ) ) ( not ( = ?auto_79321 ?auto_79326 ) ) ( not ( = ?auto_79321 ?auto_79327 ) ) ( not ( = ?auto_79322 ?auto_79323 ) ) ( not ( = ?auto_79322 ?auto_79324 ) ) ( not ( = ?auto_79322 ?auto_79325 ) ) ( not ( = ?auto_79322 ?auto_79326 ) ) ( not ( = ?auto_79322 ?auto_79327 ) ) ( not ( = ?auto_79323 ?auto_79324 ) ) ( not ( = ?auto_79323 ?auto_79325 ) ) ( not ( = ?auto_79323 ?auto_79326 ) ) ( not ( = ?auto_79323 ?auto_79327 ) ) ( not ( = ?auto_79324 ?auto_79325 ) ) ( not ( = ?auto_79324 ?auto_79326 ) ) ( not ( = ?auto_79324 ?auto_79327 ) ) ( not ( = ?auto_79325 ?auto_79326 ) ) ( not ( = ?auto_79325 ?auto_79327 ) ) ( not ( = ?auto_79326 ?auto_79327 ) ) ( ON ?auto_79327 ?auto_79328 ) ( not ( = ?auto_79321 ?auto_79328 ) ) ( not ( = ?auto_79322 ?auto_79328 ) ) ( not ( = ?auto_79323 ?auto_79328 ) ) ( not ( = ?auto_79324 ?auto_79328 ) ) ( not ( = ?auto_79325 ?auto_79328 ) ) ( not ( = ?auto_79326 ?auto_79328 ) ) ( not ( = ?auto_79327 ?auto_79328 ) ) ( ON ?auto_79326 ?auto_79327 ) ( ON-TABLE ?auto_79328 ) ( ON ?auto_79325 ?auto_79326 ) ( CLEAR ?auto_79325 ) ( HOLDING ?auto_79324 ) ( CLEAR ?auto_79323 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79321 ?auto_79322 ?auto_79323 ?auto_79324 )
      ( MAKE-7PILE ?auto_79321 ?auto_79322 ?auto_79323 ?auto_79324 ?auto_79325 ?auto_79326 ?auto_79327 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79329 - BLOCK
      ?auto_79330 - BLOCK
      ?auto_79331 - BLOCK
      ?auto_79332 - BLOCK
      ?auto_79333 - BLOCK
      ?auto_79334 - BLOCK
      ?auto_79335 - BLOCK
    )
    :vars
    (
      ?auto_79336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79329 ) ( ON ?auto_79330 ?auto_79329 ) ( ON ?auto_79331 ?auto_79330 ) ( not ( = ?auto_79329 ?auto_79330 ) ) ( not ( = ?auto_79329 ?auto_79331 ) ) ( not ( = ?auto_79329 ?auto_79332 ) ) ( not ( = ?auto_79329 ?auto_79333 ) ) ( not ( = ?auto_79329 ?auto_79334 ) ) ( not ( = ?auto_79329 ?auto_79335 ) ) ( not ( = ?auto_79330 ?auto_79331 ) ) ( not ( = ?auto_79330 ?auto_79332 ) ) ( not ( = ?auto_79330 ?auto_79333 ) ) ( not ( = ?auto_79330 ?auto_79334 ) ) ( not ( = ?auto_79330 ?auto_79335 ) ) ( not ( = ?auto_79331 ?auto_79332 ) ) ( not ( = ?auto_79331 ?auto_79333 ) ) ( not ( = ?auto_79331 ?auto_79334 ) ) ( not ( = ?auto_79331 ?auto_79335 ) ) ( not ( = ?auto_79332 ?auto_79333 ) ) ( not ( = ?auto_79332 ?auto_79334 ) ) ( not ( = ?auto_79332 ?auto_79335 ) ) ( not ( = ?auto_79333 ?auto_79334 ) ) ( not ( = ?auto_79333 ?auto_79335 ) ) ( not ( = ?auto_79334 ?auto_79335 ) ) ( ON ?auto_79335 ?auto_79336 ) ( not ( = ?auto_79329 ?auto_79336 ) ) ( not ( = ?auto_79330 ?auto_79336 ) ) ( not ( = ?auto_79331 ?auto_79336 ) ) ( not ( = ?auto_79332 ?auto_79336 ) ) ( not ( = ?auto_79333 ?auto_79336 ) ) ( not ( = ?auto_79334 ?auto_79336 ) ) ( not ( = ?auto_79335 ?auto_79336 ) ) ( ON ?auto_79334 ?auto_79335 ) ( ON-TABLE ?auto_79336 ) ( ON ?auto_79333 ?auto_79334 ) ( CLEAR ?auto_79331 ) ( ON ?auto_79332 ?auto_79333 ) ( CLEAR ?auto_79332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79336 ?auto_79335 ?auto_79334 ?auto_79333 )
      ( MAKE-7PILE ?auto_79329 ?auto_79330 ?auto_79331 ?auto_79332 ?auto_79333 ?auto_79334 ?auto_79335 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79337 - BLOCK
      ?auto_79338 - BLOCK
      ?auto_79339 - BLOCK
      ?auto_79340 - BLOCK
      ?auto_79341 - BLOCK
      ?auto_79342 - BLOCK
      ?auto_79343 - BLOCK
    )
    :vars
    (
      ?auto_79344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79337 ) ( ON ?auto_79338 ?auto_79337 ) ( not ( = ?auto_79337 ?auto_79338 ) ) ( not ( = ?auto_79337 ?auto_79339 ) ) ( not ( = ?auto_79337 ?auto_79340 ) ) ( not ( = ?auto_79337 ?auto_79341 ) ) ( not ( = ?auto_79337 ?auto_79342 ) ) ( not ( = ?auto_79337 ?auto_79343 ) ) ( not ( = ?auto_79338 ?auto_79339 ) ) ( not ( = ?auto_79338 ?auto_79340 ) ) ( not ( = ?auto_79338 ?auto_79341 ) ) ( not ( = ?auto_79338 ?auto_79342 ) ) ( not ( = ?auto_79338 ?auto_79343 ) ) ( not ( = ?auto_79339 ?auto_79340 ) ) ( not ( = ?auto_79339 ?auto_79341 ) ) ( not ( = ?auto_79339 ?auto_79342 ) ) ( not ( = ?auto_79339 ?auto_79343 ) ) ( not ( = ?auto_79340 ?auto_79341 ) ) ( not ( = ?auto_79340 ?auto_79342 ) ) ( not ( = ?auto_79340 ?auto_79343 ) ) ( not ( = ?auto_79341 ?auto_79342 ) ) ( not ( = ?auto_79341 ?auto_79343 ) ) ( not ( = ?auto_79342 ?auto_79343 ) ) ( ON ?auto_79343 ?auto_79344 ) ( not ( = ?auto_79337 ?auto_79344 ) ) ( not ( = ?auto_79338 ?auto_79344 ) ) ( not ( = ?auto_79339 ?auto_79344 ) ) ( not ( = ?auto_79340 ?auto_79344 ) ) ( not ( = ?auto_79341 ?auto_79344 ) ) ( not ( = ?auto_79342 ?auto_79344 ) ) ( not ( = ?auto_79343 ?auto_79344 ) ) ( ON ?auto_79342 ?auto_79343 ) ( ON-TABLE ?auto_79344 ) ( ON ?auto_79341 ?auto_79342 ) ( ON ?auto_79340 ?auto_79341 ) ( CLEAR ?auto_79340 ) ( HOLDING ?auto_79339 ) ( CLEAR ?auto_79338 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79337 ?auto_79338 ?auto_79339 )
      ( MAKE-7PILE ?auto_79337 ?auto_79338 ?auto_79339 ?auto_79340 ?auto_79341 ?auto_79342 ?auto_79343 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79345 - BLOCK
      ?auto_79346 - BLOCK
      ?auto_79347 - BLOCK
      ?auto_79348 - BLOCK
      ?auto_79349 - BLOCK
      ?auto_79350 - BLOCK
      ?auto_79351 - BLOCK
    )
    :vars
    (
      ?auto_79352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79345 ) ( ON ?auto_79346 ?auto_79345 ) ( not ( = ?auto_79345 ?auto_79346 ) ) ( not ( = ?auto_79345 ?auto_79347 ) ) ( not ( = ?auto_79345 ?auto_79348 ) ) ( not ( = ?auto_79345 ?auto_79349 ) ) ( not ( = ?auto_79345 ?auto_79350 ) ) ( not ( = ?auto_79345 ?auto_79351 ) ) ( not ( = ?auto_79346 ?auto_79347 ) ) ( not ( = ?auto_79346 ?auto_79348 ) ) ( not ( = ?auto_79346 ?auto_79349 ) ) ( not ( = ?auto_79346 ?auto_79350 ) ) ( not ( = ?auto_79346 ?auto_79351 ) ) ( not ( = ?auto_79347 ?auto_79348 ) ) ( not ( = ?auto_79347 ?auto_79349 ) ) ( not ( = ?auto_79347 ?auto_79350 ) ) ( not ( = ?auto_79347 ?auto_79351 ) ) ( not ( = ?auto_79348 ?auto_79349 ) ) ( not ( = ?auto_79348 ?auto_79350 ) ) ( not ( = ?auto_79348 ?auto_79351 ) ) ( not ( = ?auto_79349 ?auto_79350 ) ) ( not ( = ?auto_79349 ?auto_79351 ) ) ( not ( = ?auto_79350 ?auto_79351 ) ) ( ON ?auto_79351 ?auto_79352 ) ( not ( = ?auto_79345 ?auto_79352 ) ) ( not ( = ?auto_79346 ?auto_79352 ) ) ( not ( = ?auto_79347 ?auto_79352 ) ) ( not ( = ?auto_79348 ?auto_79352 ) ) ( not ( = ?auto_79349 ?auto_79352 ) ) ( not ( = ?auto_79350 ?auto_79352 ) ) ( not ( = ?auto_79351 ?auto_79352 ) ) ( ON ?auto_79350 ?auto_79351 ) ( ON-TABLE ?auto_79352 ) ( ON ?auto_79349 ?auto_79350 ) ( ON ?auto_79348 ?auto_79349 ) ( CLEAR ?auto_79346 ) ( ON ?auto_79347 ?auto_79348 ) ( CLEAR ?auto_79347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79352 ?auto_79351 ?auto_79350 ?auto_79349 ?auto_79348 )
      ( MAKE-7PILE ?auto_79345 ?auto_79346 ?auto_79347 ?auto_79348 ?auto_79349 ?auto_79350 ?auto_79351 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79353 - BLOCK
      ?auto_79354 - BLOCK
      ?auto_79355 - BLOCK
      ?auto_79356 - BLOCK
      ?auto_79357 - BLOCK
      ?auto_79358 - BLOCK
      ?auto_79359 - BLOCK
    )
    :vars
    (
      ?auto_79360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79353 ) ( not ( = ?auto_79353 ?auto_79354 ) ) ( not ( = ?auto_79353 ?auto_79355 ) ) ( not ( = ?auto_79353 ?auto_79356 ) ) ( not ( = ?auto_79353 ?auto_79357 ) ) ( not ( = ?auto_79353 ?auto_79358 ) ) ( not ( = ?auto_79353 ?auto_79359 ) ) ( not ( = ?auto_79354 ?auto_79355 ) ) ( not ( = ?auto_79354 ?auto_79356 ) ) ( not ( = ?auto_79354 ?auto_79357 ) ) ( not ( = ?auto_79354 ?auto_79358 ) ) ( not ( = ?auto_79354 ?auto_79359 ) ) ( not ( = ?auto_79355 ?auto_79356 ) ) ( not ( = ?auto_79355 ?auto_79357 ) ) ( not ( = ?auto_79355 ?auto_79358 ) ) ( not ( = ?auto_79355 ?auto_79359 ) ) ( not ( = ?auto_79356 ?auto_79357 ) ) ( not ( = ?auto_79356 ?auto_79358 ) ) ( not ( = ?auto_79356 ?auto_79359 ) ) ( not ( = ?auto_79357 ?auto_79358 ) ) ( not ( = ?auto_79357 ?auto_79359 ) ) ( not ( = ?auto_79358 ?auto_79359 ) ) ( ON ?auto_79359 ?auto_79360 ) ( not ( = ?auto_79353 ?auto_79360 ) ) ( not ( = ?auto_79354 ?auto_79360 ) ) ( not ( = ?auto_79355 ?auto_79360 ) ) ( not ( = ?auto_79356 ?auto_79360 ) ) ( not ( = ?auto_79357 ?auto_79360 ) ) ( not ( = ?auto_79358 ?auto_79360 ) ) ( not ( = ?auto_79359 ?auto_79360 ) ) ( ON ?auto_79358 ?auto_79359 ) ( ON-TABLE ?auto_79360 ) ( ON ?auto_79357 ?auto_79358 ) ( ON ?auto_79356 ?auto_79357 ) ( ON ?auto_79355 ?auto_79356 ) ( CLEAR ?auto_79355 ) ( HOLDING ?auto_79354 ) ( CLEAR ?auto_79353 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79353 ?auto_79354 )
      ( MAKE-7PILE ?auto_79353 ?auto_79354 ?auto_79355 ?auto_79356 ?auto_79357 ?auto_79358 ?auto_79359 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79361 - BLOCK
      ?auto_79362 - BLOCK
      ?auto_79363 - BLOCK
      ?auto_79364 - BLOCK
      ?auto_79365 - BLOCK
      ?auto_79366 - BLOCK
      ?auto_79367 - BLOCK
    )
    :vars
    (
      ?auto_79368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79361 ) ( not ( = ?auto_79361 ?auto_79362 ) ) ( not ( = ?auto_79361 ?auto_79363 ) ) ( not ( = ?auto_79361 ?auto_79364 ) ) ( not ( = ?auto_79361 ?auto_79365 ) ) ( not ( = ?auto_79361 ?auto_79366 ) ) ( not ( = ?auto_79361 ?auto_79367 ) ) ( not ( = ?auto_79362 ?auto_79363 ) ) ( not ( = ?auto_79362 ?auto_79364 ) ) ( not ( = ?auto_79362 ?auto_79365 ) ) ( not ( = ?auto_79362 ?auto_79366 ) ) ( not ( = ?auto_79362 ?auto_79367 ) ) ( not ( = ?auto_79363 ?auto_79364 ) ) ( not ( = ?auto_79363 ?auto_79365 ) ) ( not ( = ?auto_79363 ?auto_79366 ) ) ( not ( = ?auto_79363 ?auto_79367 ) ) ( not ( = ?auto_79364 ?auto_79365 ) ) ( not ( = ?auto_79364 ?auto_79366 ) ) ( not ( = ?auto_79364 ?auto_79367 ) ) ( not ( = ?auto_79365 ?auto_79366 ) ) ( not ( = ?auto_79365 ?auto_79367 ) ) ( not ( = ?auto_79366 ?auto_79367 ) ) ( ON ?auto_79367 ?auto_79368 ) ( not ( = ?auto_79361 ?auto_79368 ) ) ( not ( = ?auto_79362 ?auto_79368 ) ) ( not ( = ?auto_79363 ?auto_79368 ) ) ( not ( = ?auto_79364 ?auto_79368 ) ) ( not ( = ?auto_79365 ?auto_79368 ) ) ( not ( = ?auto_79366 ?auto_79368 ) ) ( not ( = ?auto_79367 ?auto_79368 ) ) ( ON ?auto_79366 ?auto_79367 ) ( ON-TABLE ?auto_79368 ) ( ON ?auto_79365 ?auto_79366 ) ( ON ?auto_79364 ?auto_79365 ) ( ON ?auto_79363 ?auto_79364 ) ( CLEAR ?auto_79361 ) ( ON ?auto_79362 ?auto_79363 ) ( CLEAR ?auto_79362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79368 ?auto_79367 ?auto_79366 ?auto_79365 ?auto_79364 ?auto_79363 )
      ( MAKE-7PILE ?auto_79361 ?auto_79362 ?auto_79363 ?auto_79364 ?auto_79365 ?auto_79366 ?auto_79367 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79369 - BLOCK
      ?auto_79370 - BLOCK
      ?auto_79371 - BLOCK
      ?auto_79372 - BLOCK
      ?auto_79373 - BLOCK
      ?auto_79374 - BLOCK
      ?auto_79375 - BLOCK
    )
    :vars
    (
      ?auto_79376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79369 ?auto_79370 ) ) ( not ( = ?auto_79369 ?auto_79371 ) ) ( not ( = ?auto_79369 ?auto_79372 ) ) ( not ( = ?auto_79369 ?auto_79373 ) ) ( not ( = ?auto_79369 ?auto_79374 ) ) ( not ( = ?auto_79369 ?auto_79375 ) ) ( not ( = ?auto_79370 ?auto_79371 ) ) ( not ( = ?auto_79370 ?auto_79372 ) ) ( not ( = ?auto_79370 ?auto_79373 ) ) ( not ( = ?auto_79370 ?auto_79374 ) ) ( not ( = ?auto_79370 ?auto_79375 ) ) ( not ( = ?auto_79371 ?auto_79372 ) ) ( not ( = ?auto_79371 ?auto_79373 ) ) ( not ( = ?auto_79371 ?auto_79374 ) ) ( not ( = ?auto_79371 ?auto_79375 ) ) ( not ( = ?auto_79372 ?auto_79373 ) ) ( not ( = ?auto_79372 ?auto_79374 ) ) ( not ( = ?auto_79372 ?auto_79375 ) ) ( not ( = ?auto_79373 ?auto_79374 ) ) ( not ( = ?auto_79373 ?auto_79375 ) ) ( not ( = ?auto_79374 ?auto_79375 ) ) ( ON ?auto_79375 ?auto_79376 ) ( not ( = ?auto_79369 ?auto_79376 ) ) ( not ( = ?auto_79370 ?auto_79376 ) ) ( not ( = ?auto_79371 ?auto_79376 ) ) ( not ( = ?auto_79372 ?auto_79376 ) ) ( not ( = ?auto_79373 ?auto_79376 ) ) ( not ( = ?auto_79374 ?auto_79376 ) ) ( not ( = ?auto_79375 ?auto_79376 ) ) ( ON ?auto_79374 ?auto_79375 ) ( ON-TABLE ?auto_79376 ) ( ON ?auto_79373 ?auto_79374 ) ( ON ?auto_79372 ?auto_79373 ) ( ON ?auto_79371 ?auto_79372 ) ( ON ?auto_79370 ?auto_79371 ) ( CLEAR ?auto_79370 ) ( HOLDING ?auto_79369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79369 )
      ( MAKE-7PILE ?auto_79369 ?auto_79370 ?auto_79371 ?auto_79372 ?auto_79373 ?auto_79374 ?auto_79375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79377 - BLOCK
      ?auto_79378 - BLOCK
      ?auto_79379 - BLOCK
      ?auto_79380 - BLOCK
      ?auto_79381 - BLOCK
      ?auto_79382 - BLOCK
      ?auto_79383 - BLOCK
    )
    :vars
    (
      ?auto_79384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79377 ?auto_79378 ) ) ( not ( = ?auto_79377 ?auto_79379 ) ) ( not ( = ?auto_79377 ?auto_79380 ) ) ( not ( = ?auto_79377 ?auto_79381 ) ) ( not ( = ?auto_79377 ?auto_79382 ) ) ( not ( = ?auto_79377 ?auto_79383 ) ) ( not ( = ?auto_79378 ?auto_79379 ) ) ( not ( = ?auto_79378 ?auto_79380 ) ) ( not ( = ?auto_79378 ?auto_79381 ) ) ( not ( = ?auto_79378 ?auto_79382 ) ) ( not ( = ?auto_79378 ?auto_79383 ) ) ( not ( = ?auto_79379 ?auto_79380 ) ) ( not ( = ?auto_79379 ?auto_79381 ) ) ( not ( = ?auto_79379 ?auto_79382 ) ) ( not ( = ?auto_79379 ?auto_79383 ) ) ( not ( = ?auto_79380 ?auto_79381 ) ) ( not ( = ?auto_79380 ?auto_79382 ) ) ( not ( = ?auto_79380 ?auto_79383 ) ) ( not ( = ?auto_79381 ?auto_79382 ) ) ( not ( = ?auto_79381 ?auto_79383 ) ) ( not ( = ?auto_79382 ?auto_79383 ) ) ( ON ?auto_79383 ?auto_79384 ) ( not ( = ?auto_79377 ?auto_79384 ) ) ( not ( = ?auto_79378 ?auto_79384 ) ) ( not ( = ?auto_79379 ?auto_79384 ) ) ( not ( = ?auto_79380 ?auto_79384 ) ) ( not ( = ?auto_79381 ?auto_79384 ) ) ( not ( = ?auto_79382 ?auto_79384 ) ) ( not ( = ?auto_79383 ?auto_79384 ) ) ( ON ?auto_79382 ?auto_79383 ) ( ON-TABLE ?auto_79384 ) ( ON ?auto_79381 ?auto_79382 ) ( ON ?auto_79380 ?auto_79381 ) ( ON ?auto_79379 ?auto_79380 ) ( ON ?auto_79378 ?auto_79379 ) ( ON ?auto_79377 ?auto_79378 ) ( CLEAR ?auto_79377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79384 ?auto_79383 ?auto_79382 ?auto_79381 ?auto_79380 ?auto_79379 ?auto_79378 )
      ( MAKE-7PILE ?auto_79377 ?auto_79378 ?auto_79379 ?auto_79380 ?auto_79381 ?auto_79382 ?auto_79383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79391 - BLOCK
      ?auto_79392 - BLOCK
      ?auto_79393 - BLOCK
      ?auto_79394 - BLOCK
      ?auto_79395 - BLOCK
      ?auto_79396 - BLOCK
    )
    :vars
    (
      ?auto_79397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79397 ?auto_79396 ) ( CLEAR ?auto_79397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79391 ) ( ON ?auto_79392 ?auto_79391 ) ( ON ?auto_79393 ?auto_79392 ) ( ON ?auto_79394 ?auto_79393 ) ( ON ?auto_79395 ?auto_79394 ) ( ON ?auto_79396 ?auto_79395 ) ( not ( = ?auto_79391 ?auto_79392 ) ) ( not ( = ?auto_79391 ?auto_79393 ) ) ( not ( = ?auto_79391 ?auto_79394 ) ) ( not ( = ?auto_79391 ?auto_79395 ) ) ( not ( = ?auto_79391 ?auto_79396 ) ) ( not ( = ?auto_79391 ?auto_79397 ) ) ( not ( = ?auto_79392 ?auto_79393 ) ) ( not ( = ?auto_79392 ?auto_79394 ) ) ( not ( = ?auto_79392 ?auto_79395 ) ) ( not ( = ?auto_79392 ?auto_79396 ) ) ( not ( = ?auto_79392 ?auto_79397 ) ) ( not ( = ?auto_79393 ?auto_79394 ) ) ( not ( = ?auto_79393 ?auto_79395 ) ) ( not ( = ?auto_79393 ?auto_79396 ) ) ( not ( = ?auto_79393 ?auto_79397 ) ) ( not ( = ?auto_79394 ?auto_79395 ) ) ( not ( = ?auto_79394 ?auto_79396 ) ) ( not ( = ?auto_79394 ?auto_79397 ) ) ( not ( = ?auto_79395 ?auto_79396 ) ) ( not ( = ?auto_79395 ?auto_79397 ) ) ( not ( = ?auto_79396 ?auto_79397 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79397 ?auto_79396 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79413 - BLOCK
      ?auto_79414 - BLOCK
      ?auto_79415 - BLOCK
      ?auto_79416 - BLOCK
      ?auto_79417 - BLOCK
      ?auto_79418 - BLOCK
    )
    :vars
    (
      ?auto_79419 - BLOCK
      ?auto_79420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79413 ) ( ON ?auto_79414 ?auto_79413 ) ( ON ?auto_79415 ?auto_79414 ) ( ON ?auto_79416 ?auto_79415 ) ( ON ?auto_79417 ?auto_79416 ) ( not ( = ?auto_79413 ?auto_79414 ) ) ( not ( = ?auto_79413 ?auto_79415 ) ) ( not ( = ?auto_79413 ?auto_79416 ) ) ( not ( = ?auto_79413 ?auto_79417 ) ) ( not ( = ?auto_79413 ?auto_79418 ) ) ( not ( = ?auto_79413 ?auto_79419 ) ) ( not ( = ?auto_79414 ?auto_79415 ) ) ( not ( = ?auto_79414 ?auto_79416 ) ) ( not ( = ?auto_79414 ?auto_79417 ) ) ( not ( = ?auto_79414 ?auto_79418 ) ) ( not ( = ?auto_79414 ?auto_79419 ) ) ( not ( = ?auto_79415 ?auto_79416 ) ) ( not ( = ?auto_79415 ?auto_79417 ) ) ( not ( = ?auto_79415 ?auto_79418 ) ) ( not ( = ?auto_79415 ?auto_79419 ) ) ( not ( = ?auto_79416 ?auto_79417 ) ) ( not ( = ?auto_79416 ?auto_79418 ) ) ( not ( = ?auto_79416 ?auto_79419 ) ) ( not ( = ?auto_79417 ?auto_79418 ) ) ( not ( = ?auto_79417 ?auto_79419 ) ) ( not ( = ?auto_79418 ?auto_79419 ) ) ( ON ?auto_79419 ?auto_79420 ) ( CLEAR ?auto_79419 ) ( not ( = ?auto_79413 ?auto_79420 ) ) ( not ( = ?auto_79414 ?auto_79420 ) ) ( not ( = ?auto_79415 ?auto_79420 ) ) ( not ( = ?auto_79416 ?auto_79420 ) ) ( not ( = ?auto_79417 ?auto_79420 ) ) ( not ( = ?auto_79418 ?auto_79420 ) ) ( not ( = ?auto_79419 ?auto_79420 ) ) ( HOLDING ?auto_79418 ) ( CLEAR ?auto_79417 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79413 ?auto_79414 ?auto_79415 ?auto_79416 ?auto_79417 ?auto_79418 ?auto_79419 )
      ( MAKE-6PILE ?auto_79413 ?auto_79414 ?auto_79415 ?auto_79416 ?auto_79417 ?auto_79418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79421 - BLOCK
      ?auto_79422 - BLOCK
      ?auto_79423 - BLOCK
      ?auto_79424 - BLOCK
      ?auto_79425 - BLOCK
      ?auto_79426 - BLOCK
    )
    :vars
    (
      ?auto_79427 - BLOCK
      ?auto_79428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79421 ) ( ON ?auto_79422 ?auto_79421 ) ( ON ?auto_79423 ?auto_79422 ) ( ON ?auto_79424 ?auto_79423 ) ( ON ?auto_79425 ?auto_79424 ) ( not ( = ?auto_79421 ?auto_79422 ) ) ( not ( = ?auto_79421 ?auto_79423 ) ) ( not ( = ?auto_79421 ?auto_79424 ) ) ( not ( = ?auto_79421 ?auto_79425 ) ) ( not ( = ?auto_79421 ?auto_79426 ) ) ( not ( = ?auto_79421 ?auto_79427 ) ) ( not ( = ?auto_79422 ?auto_79423 ) ) ( not ( = ?auto_79422 ?auto_79424 ) ) ( not ( = ?auto_79422 ?auto_79425 ) ) ( not ( = ?auto_79422 ?auto_79426 ) ) ( not ( = ?auto_79422 ?auto_79427 ) ) ( not ( = ?auto_79423 ?auto_79424 ) ) ( not ( = ?auto_79423 ?auto_79425 ) ) ( not ( = ?auto_79423 ?auto_79426 ) ) ( not ( = ?auto_79423 ?auto_79427 ) ) ( not ( = ?auto_79424 ?auto_79425 ) ) ( not ( = ?auto_79424 ?auto_79426 ) ) ( not ( = ?auto_79424 ?auto_79427 ) ) ( not ( = ?auto_79425 ?auto_79426 ) ) ( not ( = ?auto_79425 ?auto_79427 ) ) ( not ( = ?auto_79426 ?auto_79427 ) ) ( ON ?auto_79427 ?auto_79428 ) ( not ( = ?auto_79421 ?auto_79428 ) ) ( not ( = ?auto_79422 ?auto_79428 ) ) ( not ( = ?auto_79423 ?auto_79428 ) ) ( not ( = ?auto_79424 ?auto_79428 ) ) ( not ( = ?auto_79425 ?auto_79428 ) ) ( not ( = ?auto_79426 ?auto_79428 ) ) ( not ( = ?auto_79427 ?auto_79428 ) ) ( CLEAR ?auto_79425 ) ( ON ?auto_79426 ?auto_79427 ) ( CLEAR ?auto_79426 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79428 ?auto_79427 )
      ( MAKE-6PILE ?auto_79421 ?auto_79422 ?auto_79423 ?auto_79424 ?auto_79425 ?auto_79426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79429 - BLOCK
      ?auto_79430 - BLOCK
      ?auto_79431 - BLOCK
      ?auto_79432 - BLOCK
      ?auto_79433 - BLOCK
      ?auto_79434 - BLOCK
    )
    :vars
    (
      ?auto_79435 - BLOCK
      ?auto_79436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79429 ) ( ON ?auto_79430 ?auto_79429 ) ( ON ?auto_79431 ?auto_79430 ) ( ON ?auto_79432 ?auto_79431 ) ( not ( = ?auto_79429 ?auto_79430 ) ) ( not ( = ?auto_79429 ?auto_79431 ) ) ( not ( = ?auto_79429 ?auto_79432 ) ) ( not ( = ?auto_79429 ?auto_79433 ) ) ( not ( = ?auto_79429 ?auto_79434 ) ) ( not ( = ?auto_79429 ?auto_79435 ) ) ( not ( = ?auto_79430 ?auto_79431 ) ) ( not ( = ?auto_79430 ?auto_79432 ) ) ( not ( = ?auto_79430 ?auto_79433 ) ) ( not ( = ?auto_79430 ?auto_79434 ) ) ( not ( = ?auto_79430 ?auto_79435 ) ) ( not ( = ?auto_79431 ?auto_79432 ) ) ( not ( = ?auto_79431 ?auto_79433 ) ) ( not ( = ?auto_79431 ?auto_79434 ) ) ( not ( = ?auto_79431 ?auto_79435 ) ) ( not ( = ?auto_79432 ?auto_79433 ) ) ( not ( = ?auto_79432 ?auto_79434 ) ) ( not ( = ?auto_79432 ?auto_79435 ) ) ( not ( = ?auto_79433 ?auto_79434 ) ) ( not ( = ?auto_79433 ?auto_79435 ) ) ( not ( = ?auto_79434 ?auto_79435 ) ) ( ON ?auto_79435 ?auto_79436 ) ( not ( = ?auto_79429 ?auto_79436 ) ) ( not ( = ?auto_79430 ?auto_79436 ) ) ( not ( = ?auto_79431 ?auto_79436 ) ) ( not ( = ?auto_79432 ?auto_79436 ) ) ( not ( = ?auto_79433 ?auto_79436 ) ) ( not ( = ?auto_79434 ?auto_79436 ) ) ( not ( = ?auto_79435 ?auto_79436 ) ) ( ON ?auto_79434 ?auto_79435 ) ( CLEAR ?auto_79434 ) ( ON-TABLE ?auto_79436 ) ( HOLDING ?auto_79433 ) ( CLEAR ?auto_79432 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79429 ?auto_79430 ?auto_79431 ?auto_79432 ?auto_79433 )
      ( MAKE-6PILE ?auto_79429 ?auto_79430 ?auto_79431 ?auto_79432 ?auto_79433 ?auto_79434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79437 - BLOCK
      ?auto_79438 - BLOCK
      ?auto_79439 - BLOCK
      ?auto_79440 - BLOCK
      ?auto_79441 - BLOCK
      ?auto_79442 - BLOCK
    )
    :vars
    (
      ?auto_79444 - BLOCK
      ?auto_79443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79437 ) ( ON ?auto_79438 ?auto_79437 ) ( ON ?auto_79439 ?auto_79438 ) ( ON ?auto_79440 ?auto_79439 ) ( not ( = ?auto_79437 ?auto_79438 ) ) ( not ( = ?auto_79437 ?auto_79439 ) ) ( not ( = ?auto_79437 ?auto_79440 ) ) ( not ( = ?auto_79437 ?auto_79441 ) ) ( not ( = ?auto_79437 ?auto_79442 ) ) ( not ( = ?auto_79437 ?auto_79444 ) ) ( not ( = ?auto_79438 ?auto_79439 ) ) ( not ( = ?auto_79438 ?auto_79440 ) ) ( not ( = ?auto_79438 ?auto_79441 ) ) ( not ( = ?auto_79438 ?auto_79442 ) ) ( not ( = ?auto_79438 ?auto_79444 ) ) ( not ( = ?auto_79439 ?auto_79440 ) ) ( not ( = ?auto_79439 ?auto_79441 ) ) ( not ( = ?auto_79439 ?auto_79442 ) ) ( not ( = ?auto_79439 ?auto_79444 ) ) ( not ( = ?auto_79440 ?auto_79441 ) ) ( not ( = ?auto_79440 ?auto_79442 ) ) ( not ( = ?auto_79440 ?auto_79444 ) ) ( not ( = ?auto_79441 ?auto_79442 ) ) ( not ( = ?auto_79441 ?auto_79444 ) ) ( not ( = ?auto_79442 ?auto_79444 ) ) ( ON ?auto_79444 ?auto_79443 ) ( not ( = ?auto_79437 ?auto_79443 ) ) ( not ( = ?auto_79438 ?auto_79443 ) ) ( not ( = ?auto_79439 ?auto_79443 ) ) ( not ( = ?auto_79440 ?auto_79443 ) ) ( not ( = ?auto_79441 ?auto_79443 ) ) ( not ( = ?auto_79442 ?auto_79443 ) ) ( not ( = ?auto_79444 ?auto_79443 ) ) ( ON ?auto_79442 ?auto_79444 ) ( ON-TABLE ?auto_79443 ) ( CLEAR ?auto_79440 ) ( ON ?auto_79441 ?auto_79442 ) ( CLEAR ?auto_79441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79443 ?auto_79444 ?auto_79442 )
      ( MAKE-6PILE ?auto_79437 ?auto_79438 ?auto_79439 ?auto_79440 ?auto_79441 ?auto_79442 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79445 - BLOCK
      ?auto_79446 - BLOCK
      ?auto_79447 - BLOCK
      ?auto_79448 - BLOCK
      ?auto_79449 - BLOCK
      ?auto_79450 - BLOCK
    )
    :vars
    (
      ?auto_79452 - BLOCK
      ?auto_79451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79445 ) ( ON ?auto_79446 ?auto_79445 ) ( ON ?auto_79447 ?auto_79446 ) ( not ( = ?auto_79445 ?auto_79446 ) ) ( not ( = ?auto_79445 ?auto_79447 ) ) ( not ( = ?auto_79445 ?auto_79448 ) ) ( not ( = ?auto_79445 ?auto_79449 ) ) ( not ( = ?auto_79445 ?auto_79450 ) ) ( not ( = ?auto_79445 ?auto_79452 ) ) ( not ( = ?auto_79446 ?auto_79447 ) ) ( not ( = ?auto_79446 ?auto_79448 ) ) ( not ( = ?auto_79446 ?auto_79449 ) ) ( not ( = ?auto_79446 ?auto_79450 ) ) ( not ( = ?auto_79446 ?auto_79452 ) ) ( not ( = ?auto_79447 ?auto_79448 ) ) ( not ( = ?auto_79447 ?auto_79449 ) ) ( not ( = ?auto_79447 ?auto_79450 ) ) ( not ( = ?auto_79447 ?auto_79452 ) ) ( not ( = ?auto_79448 ?auto_79449 ) ) ( not ( = ?auto_79448 ?auto_79450 ) ) ( not ( = ?auto_79448 ?auto_79452 ) ) ( not ( = ?auto_79449 ?auto_79450 ) ) ( not ( = ?auto_79449 ?auto_79452 ) ) ( not ( = ?auto_79450 ?auto_79452 ) ) ( ON ?auto_79452 ?auto_79451 ) ( not ( = ?auto_79445 ?auto_79451 ) ) ( not ( = ?auto_79446 ?auto_79451 ) ) ( not ( = ?auto_79447 ?auto_79451 ) ) ( not ( = ?auto_79448 ?auto_79451 ) ) ( not ( = ?auto_79449 ?auto_79451 ) ) ( not ( = ?auto_79450 ?auto_79451 ) ) ( not ( = ?auto_79452 ?auto_79451 ) ) ( ON ?auto_79450 ?auto_79452 ) ( ON-TABLE ?auto_79451 ) ( ON ?auto_79449 ?auto_79450 ) ( CLEAR ?auto_79449 ) ( HOLDING ?auto_79448 ) ( CLEAR ?auto_79447 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79445 ?auto_79446 ?auto_79447 ?auto_79448 )
      ( MAKE-6PILE ?auto_79445 ?auto_79446 ?auto_79447 ?auto_79448 ?auto_79449 ?auto_79450 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79453 - BLOCK
      ?auto_79454 - BLOCK
      ?auto_79455 - BLOCK
      ?auto_79456 - BLOCK
      ?auto_79457 - BLOCK
      ?auto_79458 - BLOCK
    )
    :vars
    (
      ?auto_79459 - BLOCK
      ?auto_79460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79453 ) ( ON ?auto_79454 ?auto_79453 ) ( ON ?auto_79455 ?auto_79454 ) ( not ( = ?auto_79453 ?auto_79454 ) ) ( not ( = ?auto_79453 ?auto_79455 ) ) ( not ( = ?auto_79453 ?auto_79456 ) ) ( not ( = ?auto_79453 ?auto_79457 ) ) ( not ( = ?auto_79453 ?auto_79458 ) ) ( not ( = ?auto_79453 ?auto_79459 ) ) ( not ( = ?auto_79454 ?auto_79455 ) ) ( not ( = ?auto_79454 ?auto_79456 ) ) ( not ( = ?auto_79454 ?auto_79457 ) ) ( not ( = ?auto_79454 ?auto_79458 ) ) ( not ( = ?auto_79454 ?auto_79459 ) ) ( not ( = ?auto_79455 ?auto_79456 ) ) ( not ( = ?auto_79455 ?auto_79457 ) ) ( not ( = ?auto_79455 ?auto_79458 ) ) ( not ( = ?auto_79455 ?auto_79459 ) ) ( not ( = ?auto_79456 ?auto_79457 ) ) ( not ( = ?auto_79456 ?auto_79458 ) ) ( not ( = ?auto_79456 ?auto_79459 ) ) ( not ( = ?auto_79457 ?auto_79458 ) ) ( not ( = ?auto_79457 ?auto_79459 ) ) ( not ( = ?auto_79458 ?auto_79459 ) ) ( ON ?auto_79459 ?auto_79460 ) ( not ( = ?auto_79453 ?auto_79460 ) ) ( not ( = ?auto_79454 ?auto_79460 ) ) ( not ( = ?auto_79455 ?auto_79460 ) ) ( not ( = ?auto_79456 ?auto_79460 ) ) ( not ( = ?auto_79457 ?auto_79460 ) ) ( not ( = ?auto_79458 ?auto_79460 ) ) ( not ( = ?auto_79459 ?auto_79460 ) ) ( ON ?auto_79458 ?auto_79459 ) ( ON-TABLE ?auto_79460 ) ( ON ?auto_79457 ?auto_79458 ) ( CLEAR ?auto_79455 ) ( ON ?auto_79456 ?auto_79457 ) ( CLEAR ?auto_79456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79460 ?auto_79459 ?auto_79458 ?auto_79457 )
      ( MAKE-6PILE ?auto_79453 ?auto_79454 ?auto_79455 ?auto_79456 ?auto_79457 ?auto_79458 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79461 - BLOCK
      ?auto_79462 - BLOCK
      ?auto_79463 - BLOCK
      ?auto_79464 - BLOCK
      ?auto_79465 - BLOCK
      ?auto_79466 - BLOCK
    )
    :vars
    (
      ?auto_79468 - BLOCK
      ?auto_79467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79461 ) ( ON ?auto_79462 ?auto_79461 ) ( not ( = ?auto_79461 ?auto_79462 ) ) ( not ( = ?auto_79461 ?auto_79463 ) ) ( not ( = ?auto_79461 ?auto_79464 ) ) ( not ( = ?auto_79461 ?auto_79465 ) ) ( not ( = ?auto_79461 ?auto_79466 ) ) ( not ( = ?auto_79461 ?auto_79468 ) ) ( not ( = ?auto_79462 ?auto_79463 ) ) ( not ( = ?auto_79462 ?auto_79464 ) ) ( not ( = ?auto_79462 ?auto_79465 ) ) ( not ( = ?auto_79462 ?auto_79466 ) ) ( not ( = ?auto_79462 ?auto_79468 ) ) ( not ( = ?auto_79463 ?auto_79464 ) ) ( not ( = ?auto_79463 ?auto_79465 ) ) ( not ( = ?auto_79463 ?auto_79466 ) ) ( not ( = ?auto_79463 ?auto_79468 ) ) ( not ( = ?auto_79464 ?auto_79465 ) ) ( not ( = ?auto_79464 ?auto_79466 ) ) ( not ( = ?auto_79464 ?auto_79468 ) ) ( not ( = ?auto_79465 ?auto_79466 ) ) ( not ( = ?auto_79465 ?auto_79468 ) ) ( not ( = ?auto_79466 ?auto_79468 ) ) ( ON ?auto_79468 ?auto_79467 ) ( not ( = ?auto_79461 ?auto_79467 ) ) ( not ( = ?auto_79462 ?auto_79467 ) ) ( not ( = ?auto_79463 ?auto_79467 ) ) ( not ( = ?auto_79464 ?auto_79467 ) ) ( not ( = ?auto_79465 ?auto_79467 ) ) ( not ( = ?auto_79466 ?auto_79467 ) ) ( not ( = ?auto_79468 ?auto_79467 ) ) ( ON ?auto_79466 ?auto_79468 ) ( ON-TABLE ?auto_79467 ) ( ON ?auto_79465 ?auto_79466 ) ( ON ?auto_79464 ?auto_79465 ) ( CLEAR ?auto_79464 ) ( HOLDING ?auto_79463 ) ( CLEAR ?auto_79462 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79461 ?auto_79462 ?auto_79463 )
      ( MAKE-6PILE ?auto_79461 ?auto_79462 ?auto_79463 ?auto_79464 ?auto_79465 ?auto_79466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79469 - BLOCK
      ?auto_79470 - BLOCK
      ?auto_79471 - BLOCK
      ?auto_79472 - BLOCK
      ?auto_79473 - BLOCK
      ?auto_79474 - BLOCK
    )
    :vars
    (
      ?auto_79476 - BLOCK
      ?auto_79475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79469 ) ( ON ?auto_79470 ?auto_79469 ) ( not ( = ?auto_79469 ?auto_79470 ) ) ( not ( = ?auto_79469 ?auto_79471 ) ) ( not ( = ?auto_79469 ?auto_79472 ) ) ( not ( = ?auto_79469 ?auto_79473 ) ) ( not ( = ?auto_79469 ?auto_79474 ) ) ( not ( = ?auto_79469 ?auto_79476 ) ) ( not ( = ?auto_79470 ?auto_79471 ) ) ( not ( = ?auto_79470 ?auto_79472 ) ) ( not ( = ?auto_79470 ?auto_79473 ) ) ( not ( = ?auto_79470 ?auto_79474 ) ) ( not ( = ?auto_79470 ?auto_79476 ) ) ( not ( = ?auto_79471 ?auto_79472 ) ) ( not ( = ?auto_79471 ?auto_79473 ) ) ( not ( = ?auto_79471 ?auto_79474 ) ) ( not ( = ?auto_79471 ?auto_79476 ) ) ( not ( = ?auto_79472 ?auto_79473 ) ) ( not ( = ?auto_79472 ?auto_79474 ) ) ( not ( = ?auto_79472 ?auto_79476 ) ) ( not ( = ?auto_79473 ?auto_79474 ) ) ( not ( = ?auto_79473 ?auto_79476 ) ) ( not ( = ?auto_79474 ?auto_79476 ) ) ( ON ?auto_79476 ?auto_79475 ) ( not ( = ?auto_79469 ?auto_79475 ) ) ( not ( = ?auto_79470 ?auto_79475 ) ) ( not ( = ?auto_79471 ?auto_79475 ) ) ( not ( = ?auto_79472 ?auto_79475 ) ) ( not ( = ?auto_79473 ?auto_79475 ) ) ( not ( = ?auto_79474 ?auto_79475 ) ) ( not ( = ?auto_79476 ?auto_79475 ) ) ( ON ?auto_79474 ?auto_79476 ) ( ON-TABLE ?auto_79475 ) ( ON ?auto_79473 ?auto_79474 ) ( ON ?auto_79472 ?auto_79473 ) ( CLEAR ?auto_79470 ) ( ON ?auto_79471 ?auto_79472 ) ( CLEAR ?auto_79471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79475 ?auto_79476 ?auto_79474 ?auto_79473 ?auto_79472 )
      ( MAKE-6PILE ?auto_79469 ?auto_79470 ?auto_79471 ?auto_79472 ?auto_79473 ?auto_79474 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79477 - BLOCK
      ?auto_79478 - BLOCK
      ?auto_79479 - BLOCK
      ?auto_79480 - BLOCK
      ?auto_79481 - BLOCK
      ?auto_79482 - BLOCK
    )
    :vars
    (
      ?auto_79484 - BLOCK
      ?auto_79483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79477 ) ( not ( = ?auto_79477 ?auto_79478 ) ) ( not ( = ?auto_79477 ?auto_79479 ) ) ( not ( = ?auto_79477 ?auto_79480 ) ) ( not ( = ?auto_79477 ?auto_79481 ) ) ( not ( = ?auto_79477 ?auto_79482 ) ) ( not ( = ?auto_79477 ?auto_79484 ) ) ( not ( = ?auto_79478 ?auto_79479 ) ) ( not ( = ?auto_79478 ?auto_79480 ) ) ( not ( = ?auto_79478 ?auto_79481 ) ) ( not ( = ?auto_79478 ?auto_79482 ) ) ( not ( = ?auto_79478 ?auto_79484 ) ) ( not ( = ?auto_79479 ?auto_79480 ) ) ( not ( = ?auto_79479 ?auto_79481 ) ) ( not ( = ?auto_79479 ?auto_79482 ) ) ( not ( = ?auto_79479 ?auto_79484 ) ) ( not ( = ?auto_79480 ?auto_79481 ) ) ( not ( = ?auto_79480 ?auto_79482 ) ) ( not ( = ?auto_79480 ?auto_79484 ) ) ( not ( = ?auto_79481 ?auto_79482 ) ) ( not ( = ?auto_79481 ?auto_79484 ) ) ( not ( = ?auto_79482 ?auto_79484 ) ) ( ON ?auto_79484 ?auto_79483 ) ( not ( = ?auto_79477 ?auto_79483 ) ) ( not ( = ?auto_79478 ?auto_79483 ) ) ( not ( = ?auto_79479 ?auto_79483 ) ) ( not ( = ?auto_79480 ?auto_79483 ) ) ( not ( = ?auto_79481 ?auto_79483 ) ) ( not ( = ?auto_79482 ?auto_79483 ) ) ( not ( = ?auto_79484 ?auto_79483 ) ) ( ON ?auto_79482 ?auto_79484 ) ( ON-TABLE ?auto_79483 ) ( ON ?auto_79481 ?auto_79482 ) ( ON ?auto_79480 ?auto_79481 ) ( ON ?auto_79479 ?auto_79480 ) ( CLEAR ?auto_79479 ) ( HOLDING ?auto_79478 ) ( CLEAR ?auto_79477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79477 ?auto_79478 )
      ( MAKE-6PILE ?auto_79477 ?auto_79478 ?auto_79479 ?auto_79480 ?auto_79481 ?auto_79482 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79485 - BLOCK
      ?auto_79486 - BLOCK
      ?auto_79487 - BLOCK
      ?auto_79488 - BLOCK
      ?auto_79489 - BLOCK
      ?auto_79490 - BLOCK
    )
    :vars
    (
      ?auto_79491 - BLOCK
      ?auto_79492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79485 ) ( not ( = ?auto_79485 ?auto_79486 ) ) ( not ( = ?auto_79485 ?auto_79487 ) ) ( not ( = ?auto_79485 ?auto_79488 ) ) ( not ( = ?auto_79485 ?auto_79489 ) ) ( not ( = ?auto_79485 ?auto_79490 ) ) ( not ( = ?auto_79485 ?auto_79491 ) ) ( not ( = ?auto_79486 ?auto_79487 ) ) ( not ( = ?auto_79486 ?auto_79488 ) ) ( not ( = ?auto_79486 ?auto_79489 ) ) ( not ( = ?auto_79486 ?auto_79490 ) ) ( not ( = ?auto_79486 ?auto_79491 ) ) ( not ( = ?auto_79487 ?auto_79488 ) ) ( not ( = ?auto_79487 ?auto_79489 ) ) ( not ( = ?auto_79487 ?auto_79490 ) ) ( not ( = ?auto_79487 ?auto_79491 ) ) ( not ( = ?auto_79488 ?auto_79489 ) ) ( not ( = ?auto_79488 ?auto_79490 ) ) ( not ( = ?auto_79488 ?auto_79491 ) ) ( not ( = ?auto_79489 ?auto_79490 ) ) ( not ( = ?auto_79489 ?auto_79491 ) ) ( not ( = ?auto_79490 ?auto_79491 ) ) ( ON ?auto_79491 ?auto_79492 ) ( not ( = ?auto_79485 ?auto_79492 ) ) ( not ( = ?auto_79486 ?auto_79492 ) ) ( not ( = ?auto_79487 ?auto_79492 ) ) ( not ( = ?auto_79488 ?auto_79492 ) ) ( not ( = ?auto_79489 ?auto_79492 ) ) ( not ( = ?auto_79490 ?auto_79492 ) ) ( not ( = ?auto_79491 ?auto_79492 ) ) ( ON ?auto_79490 ?auto_79491 ) ( ON-TABLE ?auto_79492 ) ( ON ?auto_79489 ?auto_79490 ) ( ON ?auto_79488 ?auto_79489 ) ( ON ?auto_79487 ?auto_79488 ) ( CLEAR ?auto_79485 ) ( ON ?auto_79486 ?auto_79487 ) ( CLEAR ?auto_79486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79492 ?auto_79491 ?auto_79490 ?auto_79489 ?auto_79488 ?auto_79487 )
      ( MAKE-6PILE ?auto_79485 ?auto_79486 ?auto_79487 ?auto_79488 ?auto_79489 ?auto_79490 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79493 - BLOCK
      ?auto_79494 - BLOCK
      ?auto_79495 - BLOCK
      ?auto_79496 - BLOCK
      ?auto_79497 - BLOCK
      ?auto_79498 - BLOCK
    )
    :vars
    (
      ?auto_79500 - BLOCK
      ?auto_79499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79493 ?auto_79494 ) ) ( not ( = ?auto_79493 ?auto_79495 ) ) ( not ( = ?auto_79493 ?auto_79496 ) ) ( not ( = ?auto_79493 ?auto_79497 ) ) ( not ( = ?auto_79493 ?auto_79498 ) ) ( not ( = ?auto_79493 ?auto_79500 ) ) ( not ( = ?auto_79494 ?auto_79495 ) ) ( not ( = ?auto_79494 ?auto_79496 ) ) ( not ( = ?auto_79494 ?auto_79497 ) ) ( not ( = ?auto_79494 ?auto_79498 ) ) ( not ( = ?auto_79494 ?auto_79500 ) ) ( not ( = ?auto_79495 ?auto_79496 ) ) ( not ( = ?auto_79495 ?auto_79497 ) ) ( not ( = ?auto_79495 ?auto_79498 ) ) ( not ( = ?auto_79495 ?auto_79500 ) ) ( not ( = ?auto_79496 ?auto_79497 ) ) ( not ( = ?auto_79496 ?auto_79498 ) ) ( not ( = ?auto_79496 ?auto_79500 ) ) ( not ( = ?auto_79497 ?auto_79498 ) ) ( not ( = ?auto_79497 ?auto_79500 ) ) ( not ( = ?auto_79498 ?auto_79500 ) ) ( ON ?auto_79500 ?auto_79499 ) ( not ( = ?auto_79493 ?auto_79499 ) ) ( not ( = ?auto_79494 ?auto_79499 ) ) ( not ( = ?auto_79495 ?auto_79499 ) ) ( not ( = ?auto_79496 ?auto_79499 ) ) ( not ( = ?auto_79497 ?auto_79499 ) ) ( not ( = ?auto_79498 ?auto_79499 ) ) ( not ( = ?auto_79500 ?auto_79499 ) ) ( ON ?auto_79498 ?auto_79500 ) ( ON-TABLE ?auto_79499 ) ( ON ?auto_79497 ?auto_79498 ) ( ON ?auto_79496 ?auto_79497 ) ( ON ?auto_79495 ?auto_79496 ) ( ON ?auto_79494 ?auto_79495 ) ( CLEAR ?auto_79494 ) ( HOLDING ?auto_79493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79493 )
      ( MAKE-6PILE ?auto_79493 ?auto_79494 ?auto_79495 ?auto_79496 ?auto_79497 ?auto_79498 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79501 - BLOCK
      ?auto_79502 - BLOCK
      ?auto_79503 - BLOCK
      ?auto_79504 - BLOCK
      ?auto_79505 - BLOCK
      ?auto_79506 - BLOCK
    )
    :vars
    (
      ?auto_79508 - BLOCK
      ?auto_79507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79501 ?auto_79502 ) ) ( not ( = ?auto_79501 ?auto_79503 ) ) ( not ( = ?auto_79501 ?auto_79504 ) ) ( not ( = ?auto_79501 ?auto_79505 ) ) ( not ( = ?auto_79501 ?auto_79506 ) ) ( not ( = ?auto_79501 ?auto_79508 ) ) ( not ( = ?auto_79502 ?auto_79503 ) ) ( not ( = ?auto_79502 ?auto_79504 ) ) ( not ( = ?auto_79502 ?auto_79505 ) ) ( not ( = ?auto_79502 ?auto_79506 ) ) ( not ( = ?auto_79502 ?auto_79508 ) ) ( not ( = ?auto_79503 ?auto_79504 ) ) ( not ( = ?auto_79503 ?auto_79505 ) ) ( not ( = ?auto_79503 ?auto_79506 ) ) ( not ( = ?auto_79503 ?auto_79508 ) ) ( not ( = ?auto_79504 ?auto_79505 ) ) ( not ( = ?auto_79504 ?auto_79506 ) ) ( not ( = ?auto_79504 ?auto_79508 ) ) ( not ( = ?auto_79505 ?auto_79506 ) ) ( not ( = ?auto_79505 ?auto_79508 ) ) ( not ( = ?auto_79506 ?auto_79508 ) ) ( ON ?auto_79508 ?auto_79507 ) ( not ( = ?auto_79501 ?auto_79507 ) ) ( not ( = ?auto_79502 ?auto_79507 ) ) ( not ( = ?auto_79503 ?auto_79507 ) ) ( not ( = ?auto_79504 ?auto_79507 ) ) ( not ( = ?auto_79505 ?auto_79507 ) ) ( not ( = ?auto_79506 ?auto_79507 ) ) ( not ( = ?auto_79508 ?auto_79507 ) ) ( ON ?auto_79506 ?auto_79508 ) ( ON-TABLE ?auto_79507 ) ( ON ?auto_79505 ?auto_79506 ) ( ON ?auto_79504 ?auto_79505 ) ( ON ?auto_79503 ?auto_79504 ) ( ON ?auto_79502 ?auto_79503 ) ( ON ?auto_79501 ?auto_79502 ) ( CLEAR ?auto_79501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79507 ?auto_79508 ?auto_79506 ?auto_79505 ?auto_79504 ?auto_79503 ?auto_79502 )
      ( MAKE-6PILE ?auto_79501 ?auto_79502 ?auto_79503 ?auto_79504 ?auto_79505 ?auto_79506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79510 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79510 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_79510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79511 - BLOCK
    )
    :vars
    (
      ?auto_79512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79511 ?auto_79512 ) ( CLEAR ?auto_79511 ) ( HAND-EMPTY ) ( not ( = ?auto_79511 ?auto_79512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79511 ?auto_79512 )
      ( MAKE-1PILE ?auto_79511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79513 - BLOCK
    )
    :vars
    (
      ?auto_79514 - BLOCK
      ?auto_79515 - BLOCK
      ?auto_79517 - BLOCK
      ?auto_79516 - BLOCK
      ?auto_79519 - BLOCK
      ?auto_79518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79513 ?auto_79514 ) ) ( HOLDING ?auto_79513 ) ( CLEAR ?auto_79514 ) ( ON-TABLE ?auto_79515 ) ( ON ?auto_79517 ?auto_79515 ) ( ON ?auto_79516 ?auto_79517 ) ( ON ?auto_79519 ?auto_79516 ) ( ON ?auto_79518 ?auto_79519 ) ( ON ?auto_79514 ?auto_79518 ) ( not ( = ?auto_79515 ?auto_79517 ) ) ( not ( = ?auto_79515 ?auto_79516 ) ) ( not ( = ?auto_79515 ?auto_79519 ) ) ( not ( = ?auto_79515 ?auto_79518 ) ) ( not ( = ?auto_79515 ?auto_79514 ) ) ( not ( = ?auto_79515 ?auto_79513 ) ) ( not ( = ?auto_79517 ?auto_79516 ) ) ( not ( = ?auto_79517 ?auto_79519 ) ) ( not ( = ?auto_79517 ?auto_79518 ) ) ( not ( = ?auto_79517 ?auto_79514 ) ) ( not ( = ?auto_79517 ?auto_79513 ) ) ( not ( = ?auto_79516 ?auto_79519 ) ) ( not ( = ?auto_79516 ?auto_79518 ) ) ( not ( = ?auto_79516 ?auto_79514 ) ) ( not ( = ?auto_79516 ?auto_79513 ) ) ( not ( = ?auto_79519 ?auto_79518 ) ) ( not ( = ?auto_79519 ?auto_79514 ) ) ( not ( = ?auto_79519 ?auto_79513 ) ) ( not ( = ?auto_79518 ?auto_79514 ) ) ( not ( = ?auto_79518 ?auto_79513 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79515 ?auto_79517 ?auto_79516 ?auto_79519 ?auto_79518 ?auto_79514 ?auto_79513 )
      ( MAKE-1PILE ?auto_79513 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79520 - BLOCK
    )
    :vars
    (
      ?auto_79526 - BLOCK
      ?auto_79525 - BLOCK
      ?auto_79522 - BLOCK
      ?auto_79523 - BLOCK
      ?auto_79524 - BLOCK
      ?auto_79521 - BLOCK
      ?auto_79527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79520 ?auto_79526 ) ) ( CLEAR ?auto_79526 ) ( ON-TABLE ?auto_79525 ) ( ON ?auto_79522 ?auto_79525 ) ( ON ?auto_79523 ?auto_79522 ) ( ON ?auto_79524 ?auto_79523 ) ( ON ?auto_79521 ?auto_79524 ) ( ON ?auto_79526 ?auto_79521 ) ( not ( = ?auto_79525 ?auto_79522 ) ) ( not ( = ?auto_79525 ?auto_79523 ) ) ( not ( = ?auto_79525 ?auto_79524 ) ) ( not ( = ?auto_79525 ?auto_79521 ) ) ( not ( = ?auto_79525 ?auto_79526 ) ) ( not ( = ?auto_79525 ?auto_79520 ) ) ( not ( = ?auto_79522 ?auto_79523 ) ) ( not ( = ?auto_79522 ?auto_79524 ) ) ( not ( = ?auto_79522 ?auto_79521 ) ) ( not ( = ?auto_79522 ?auto_79526 ) ) ( not ( = ?auto_79522 ?auto_79520 ) ) ( not ( = ?auto_79523 ?auto_79524 ) ) ( not ( = ?auto_79523 ?auto_79521 ) ) ( not ( = ?auto_79523 ?auto_79526 ) ) ( not ( = ?auto_79523 ?auto_79520 ) ) ( not ( = ?auto_79524 ?auto_79521 ) ) ( not ( = ?auto_79524 ?auto_79526 ) ) ( not ( = ?auto_79524 ?auto_79520 ) ) ( not ( = ?auto_79521 ?auto_79526 ) ) ( not ( = ?auto_79521 ?auto_79520 ) ) ( ON ?auto_79520 ?auto_79527 ) ( CLEAR ?auto_79520 ) ( HAND-EMPTY ) ( not ( = ?auto_79520 ?auto_79527 ) ) ( not ( = ?auto_79526 ?auto_79527 ) ) ( not ( = ?auto_79525 ?auto_79527 ) ) ( not ( = ?auto_79522 ?auto_79527 ) ) ( not ( = ?auto_79523 ?auto_79527 ) ) ( not ( = ?auto_79524 ?auto_79527 ) ) ( not ( = ?auto_79521 ?auto_79527 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79520 ?auto_79527 )
      ( MAKE-1PILE ?auto_79520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79528 - BLOCK
    )
    :vars
    (
      ?auto_79534 - BLOCK
      ?auto_79532 - BLOCK
      ?auto_79535 - BLOCK
      ?auto_79529 - BLOCK
      ?auto_79530 - BLOCK
      ?auto_79533 - BLOCK
      ?auto_79531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79528 ?auto_79534 ) ) ( ON-TABLE ?auto_79532 ) ( ON ?auto_79535 ?auto_79532 ) ( ON ?auto_79529 ?auto_79535 ) ( ON ?auto_79530 ?auto_79529 ) ( ON ?auto_79533 ?auto_79530 ) ( not ( = ?auto_79532 ?auto_79535 ) ) ( not ( = ?auto_79532 ?auto_79529 ) ) ( not ( = ?auto_79532 ?auto_79530 ) ) ( not ( = ?auto_79532 ?auto_79533 ) ) ( not ( = ?auto_79532 ?auto_79534 ) ) ( not ( = ?auto_79532 ?auto_79528 ) ) ( not ( = ?auto_79535 ?auto_79529 ) ) ( not ( = ?auto_79535 ?auto_79530 ) ) ( not ( = ?auto_79535 ?auto_79533 ) ) ( not ( = ?auto_79535 ?auto_79534 ) ) ( not ( = ?auto_79535 ?auto_79528 ) ) ( not ( = ?auto_79529 ?auto_79530 ) ) ( not ( = ?auto_79529 ?auto_79533 ) ) ( not ( = ?auto_79529 ?auto_79534 ) ) ( not ( = ?auto_79529 ?auto_79528 ) ) ( not ( = ?auto_79530 ?auto_79533 ) ) ( not ( = ?auto_79530 ?auto_79534 ) ) ( not ( = ?auto_79530 ?auto_79528 ) ) ( not ( = ?auto_79533 ?auto_79534 ) ) ( not ( = ?auto_79533 ?auto_79528 ) ) ( ON ?auto_79528 ?auto_79531 ) ( CLEAR ?auto_79528 ) ( not ( = ?auto_79528 ?auto_79531 ) ) ( not ( = ?auto_79534 ?auto_79531 ) ) ( not ( = ?auto_79532 ?auto_79531 ) ) ( not ( = ?auto_79535 ?auto_79531 ) ) ( not ( = ?auto_79529 ?auto_79531 ) ) ( not ( = ?auto_79530 ?auto_79531 ) ) ( not ( = ?auto_79533 ?auto_79531 ) ) ( HOLDING ?auto_79534 ) ( CLEAR ?auto_79533 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79532 ?auto_79535 ?auto_79529 ?auto_79530 ?auto_79533 ?auto_79534 )
      ( MAKE-1PILE ?auto_79528 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79536 - BLOCK
    )
    :vars
    (
      ?auto_79539 - BLOCK
      ?auto_79540 - BLOCK
      ?auto_79537 - BLOCK
      ?auto_79541 - BLOCK
      ?auto_79538 - BLOCK
      ?auto_79542 - BLOCK
      ?auto_79543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79536 ?auto_79539 ) ) ( ON-TABLE ?auto_79540 ) ( ON ?auto_79537 ?auto_79540 ) ( ON ?auto_79541 ?auto_79537 ) ( ON ?auto_79538 ?auto_79541 ) ( ON ?auto_79542 ?auto_79538 ) ( not ( = ?auto_79540 ?auto_79537 ) ) ( not ( = ?auto_79540 ?auto_79541 ) ) ( not ( = ?auto_79540 ?auto_79538 ) ) ( not ( = ?auto_79540 ?auto_79542 ) ) ( not ( = ?auto_79540 ?auto_79539 ) ) ( not ( = ?auto_79540 ?auto_79536 ) ) ( not ( = ?auto_79537 ?auto_79541 ) ) ( not ( = ?auto_79537 ?auto_79538 ) ) ( not ( = ?auto_79537 ?auto_79542 ) ) ( not ( = ?auto_79537 ?auto_79539 ) ) ( not ( = ?auto_79537 ?auto_79536 ) ) ( not ( = ?auto_79541 ?auto_79538 ) ) ( not ( = ?auto_79541 ?auto_79542 ) ) ( not ( = ?auto_79541 ?auto_79539 ) ) ( not ( = ?auto_79541 ?auto_79536 ) ) ( not ( = ?auto_79538 ?auto_79542 ) ) ( not ( = ?auto_79538 ?auto_79539 ) ) ( not ( = ?auto_79538 ?auto_79536 ) ) ( not ( = ?auto_79542 ?auto_79539 ) ) ( not ( = ?auto_79542 ?auto_79536 ) ) ( ON ?auto_79536 ?auto_79543 ) ( not ( = ?auto_79536 ?auto_79543 ) ) ( not ( = ?auto_79539 ?auto_79543 ) ) ( not ( = ?auto_79540 ?auto_79543 ) ) ( not ( = ?auto_79537 ?auto_79543 ) ) ( not ( = ?auto_79541 ?auto_79543 ) ) ( not ( = ?auto_79538 ?auto_79543 ) ) ( not ( = ?auto_79542 ?auto_79543 ) ) ( CLEAR ?auto_79542 ) ( ON ?auto_79539 ?auto_79536 ) ( CLEAR ?auto_79539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79543 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79543 ?auto_79536 )
      ( MAKE-1PILE ?auto_79536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79544 - BLOCK
    )
    :vars
    (
      ?auto_79547 - BLOCK
      ?auto_79548 - BLOCK
      ?auto_79545 - BLOCK
      ?auto_79549 - BLOCK
      ?auto_79551 - BLOCK
      ?auto_79546 - BLOCK
      ?auto_79550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79544 ?auto_79547 ) ) ( ON-TABLE ?auto_79548 ) ( ON ?auto_79545 ?auto_79548 ) ( ON ?auto_79549 ?auto_79545 ) ( ON ?auto_79551 ?auto_79549 ) ( not ( = ?auto_79548 ?auto_79545 ) ) ( not ( = ?auto_79548 ?auto_79549 ) ) ( not ( = ?auto_79548 ?auto_79551 ) ) ( not ( = ?auto_79548 ?auto_79546 ) ) ( not ( = ?auto_79548 ?auto_79547 ) ) ( not ( = ?auto_79548 ?auto_79544 ) ) ( not ( = ?auto_79545 ?auto_79549 ) ) ( not ( = ?auto_79545 ?auto_79551 ) ) ( not ( = ?auto_79545 ?auto_79546 ) ) ( not ( = ?auto_79545 ?auto_79547 ) ) ( not ( = ?auto_79545 ?auto_79544 ) ) ( not ( = ?auto_79549 ?auto_79551 ) ) ( not ( = ?auto_79549 ?auto_79546 ) ) ( not ( = ?auto_79549 ?auto_79547 ) ) ( not ( = ?auto_79549 ?auto_79544 ) ) ( not ( = ?auto_79551 ?auto_79546 ) ) ( not ( = ?auto_79551 ?auto_79547 ) ) ( not ( = ?auto_79551 ?auto_79544 ) ) ( not ( = ?auto_79546 ?auto_79547 ) ) ( not ( = ?auto_79546 ?auto_79544 ) ) ( ON ?auto_79544 ?auto_79550 ) ( not ( = ?auto_79544 ?auto_79550 ) ) ( not ( = ?auto_79547 ?auto_79550 ) ) ( not ( = ?auto_79548 ?auto_79550 ) ) ( not ( = ?auto_79545 ?auto_79550 ) ) ( not ( = ?auto_79549 ?auto_79550 ) ) ( not ( = ?auto_79551 ?auto_79550 ) ) ( not ( = ?auto_79546 ?auto_79550 ) ) ( ON ?auto_79547 ?auto_79544 ) ( CLEAR ?auto_79547 ) ( ON-TABLE ?auto_79550 ) ( HOLDING ?auto_79546 ) ( CLEAR ?auto_79551 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79548 ?auto_79545 ?auto_79549 ?auto_79551 ?auto_79546 )
      ( MAKE-1PILE ?auto_79544 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79552 - BLOCK
    )
    :vars
    (
      ?auto_79557 - BLOCK
      ?auto_79558 - BLOCK
      ?auto_79555 - BLOCK
      ?auto_79556 - BLOCK
      ?auto_79559 - BLOCK
      ?auto_79553 - BLOCK
      ?auto_79554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79552 ?auto_79557 ) ) ( ON-TABLE ?auto_79558 ) ( ON ?auto_79555 ?auto_79558 ) ( ON ?auto_79556 ?auto_79555 ) ( ON ?auto_79559 ?auto_79556 ) ( not ( = ?auto_79558 ?auto_79555 ) ) ( not ( = ?auto_79558 ?auto_79556 ) ) ( not ( = ?auto_79558 ?auto_79559 ) ) ( not ( = ?auto_79558 ?auto_79553 ) ) ( not ( = ?auto_79558 ?auto_79557 ) ) ( not ( = ?auto_79558 ?auto_79552 ) ) ( not ( = ?auto_79555 ?auto_79556 ) ) ( not ( = ?auto_79555 ?auto_79559 ) ) ( not ( = ?auto_79555 ?auto_79553 ) ) ( not ( = ?auto_79555 ?auto_79557 ) ) ( not ( = ?auto_79555 ?auto_79552 ) ) ( not ( = ?auto_79556 ?auto_79559 ) ) ( not ( = ?auto_79556 ?auto_79553 ) ) ( not ( = ?auto_79556 ?auto_79557 ) ) ( not ( = ?auto_79556 ?auto_79552 ) ) ( not ( = ?auto_79559 ?auto_79553 ) ) ( not ( = ?auto_79559 ?auto_79557 ) ) ( not ( = ?auto_79559 ?auto_79552 ) ) ( not ( = ?auto_79553 ?auto_79557 ) ) ( not ( = ?auto_79553 ?auto_79552 ) ) ( ON ?auto_79552 ?auto_79554 ) ( not ( = ?auto_79552 ?auto_79554 ) ) ( not ( = ?auto_79557 ?auto_79554 ) ) ( not ( = ?auto_79558 ?auto_79554 ) ) ( not ( = ?auto_79555 ?auto_79554 ) ) ( not ( = ?auto_79556 ?auto_79554 ) ) ( not ( = ?auto_79559 ?auto_79554 ) ) ( not ( = ?auto_79553 ?auto_79554 ) ) ( ON ?auto_79557 ?auto_79552 ) ( ON-TABLE ?auto_79554 ) ( CLEAR ?auto_79559 ) ( ON ?auto_79553 ?auto_79557 ) ( CLEAR ?auto_79553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79554 ?auto_79552 ?auto_79557 )
      ( MAKE-1PILE ?auto_79552 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79560 - BLOCK
    )
    :vars
    (
      ?auto_79563 - BLOCK
      ?auto_79561 - BLOCK
      ?auto_79562 - BLOCK
      ?auto_79564 - BLOCK
      ?auto_79567 - BLOCK
      ?auto_79565 - BLOCK
      ?auto_79566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79560 ?auto_79563 ) ) ( ON-TABLE ?auto_79561 ) ( ON ?auto_79562 ?auto_79561 ) ( ON ?auto_79564 ?auto_79562 ) ( not ( = ?auto_79561 ?auto_79562 ) ) ( not ( = ?auto_79561 ?auto_79564 ) ) ( not ( = ?auto_79561 ?auto_79567 ) ) ( not ( = ?auto_79561 ?auto_79565 ) ) ( not ( = ?auto_79561 ?auto_79563 ) ) ( not ( = ?auto_79561 ?auto_79560 ) ) ( not ( = ?auto_79562 ?auto_79564 ) ) ( not ( = ?auto_79562 ?auto_79567 ) ) ( not ( = ?auto_79562 ?auto_79565 ) ) ( not ( = ?auto_79562 ?auto_79563 ) ) ( not ( = ?auto_79562 ?auto_79560 ) ) ( not ( = ?auto_79564 ?auto_79567 ) ) ( not ( = ?auto_79564 ?auto_79565 ) ) ( not ( = ?auto_79564 ?auto_79563 ) ) ( not ( = ?auto_79564 ?auto_79560 ) ) ( not ( = ?auto_79567 ?auto_79565 ) ) ( not ( = ?auto_79567 ?auto_79563 ) ) ( not ( = ?auto_79567 ?auto_79560 ) ) ( not ( = ?auto_79565 ?auto_79563 ) ) ( not ( = ?auto_79565 ?auto_79560 ) ) ( ON ?auto_79560 ?auto_79566 ) ( not ( = ?auto_79560 ?auto_79566 ) ) ( not ( = ?auto_79563 ?auto_79566 ) ) ( not ( = ?auto_79561 ?auto_79566 ) ) ( not ( = ?auto_79562 ?auto_79566 ) ) ( not ( = ?auto_79564 ?auto_79566 ) ) ( not ( = ?auto_79567 ?auto_79566 ) ) ( not ( = ?auto_79565 ?auto_79566 ) ) ( ON ?auto_79563 ?auto_79560 ) ( ON-TABLE ?auto_79566 ) ( ON ?auto_79565 ?auto_79563 ) ( CLEAR ?auto_79565 ) ( HOLDING ?auto_79567 ) ( CLEAR ?auto_79564 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79561 ?auto_79562 ?auto_79564 ?auto_79567 )
      ( MAKE-1PILE ?auto_79560 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79568 - BLOCK
    )
    :vars
    (
      ?auto_79569 - BLOCK
      ?auto_79570 - BLOCK
      ?auto_79571 - BLOCK
      ?auto_79574 - BLOCK
      ?auto_79572 - BLOCK
      ?auto_79573 - BLOCK
      ?auto_79575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79568 ?auto_79569 ) ) ( ON-TABLE ?auto_79570 ) ( ON ?auto_79571 ?auto_79570 ) ( ON ?auto_79574 ?auto_79571 ) ( not ( = ?auto_79570 ?auto_79571 ) ) ( not ( = ?auto_79570 ?auto_79574 ) ) ( not ( = ?auto_79570 ?auto_79572 ) ) ( not ( = ?auto_79570 ?auto_79573 ) ) ( not ( = ?auto_79570 ?auto_79569 ) ) ( not ( = ?auto_79570 ?auto_79568 ) ) ( not ( = ?auto_79571 ?auto_79574 ) ) ( not ( = ?auto_79571 ?auto_79572 ) ) ( not ( = ?auto_79571 ?auto_79573 ) ) ( not ( = ?auto_79571 ?auto_79569 ) ) ( not ( = ?auto_79571 ?auto_79568 ) ) ( not ( = ?auto_79574 ?auto_79572 ) ) ( not ( = ?auto_79574 ?auto_79573 ) ) ( not ( = ?auto_79574 ?auto_79569 ) ) ( not ( = ?auto_79574 ?auto_79568 ) ) ( not ( = ?auto_79572 ?auto_79573 ) ) ( not ( = ?auto_79572 ?auto_79569 ) ) ( not ( = ?auto_79572 ?auto_79568 ) ) ( not ( = ?auto_79573 ?auto_79569 ) ) ( not ( = ?auto_79573 ?auto_79568 ) ) ( ON ?auto_79568 ?auto_79575 ) ( not ( = ?auto_79568 ?auto_79575 ) ) ( not ( = ?auto_79569 ?auto_79575 ) ) ( not ( = ?auto_79570 ?auto_79575 ) ) ( not ( = ?auto_79571 ?auto_79575 ) ) ( not ( = ?auto_79574 ?auto_79575 ) ) ( not ( = ?auto_79572 ?auto_79575 ) ) ( not ( = ?auto_79573 ?auto_79575 ) ) ( ON ?auto_79569 ?auto_79568 ) ( ON-TABLE ?auto_79575 ) ( ON ?auto_79573 ?auto_79569 ) ( CLEAR ?auto_79574 ) ( ON ?auto_79572 ?auto_79573 ) ( CLEAR ?auto_79572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79575 ?auto_79568 ?auto_79569 ?auto_79573 )
      ( MAKE-1PILE ?auto_79568 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79576 - BLOCK
    )
    :vars
    (
      ?auto_79577 - BLOCK
      ?auto_79581 - BLOCK
      ?auto_79580 - BLOCK
      ?auto_79583 - BLOCK
      ?auto_79578 - BLOCK
      ?auto_79582 - BLOCK
      ?auto_79579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79576 ?auto_79577 ) ) ( ON-TABLE ?auto_79581 ) ( ON ?auto_79580 ?auto_79581 ) ( not ( = ?auto_79581 ?auto_79580 ) ) ( not ( = ?auto_79581 ?auto_79583 ) ) ( not ( = ?auto_79581 ?auto_79578 ) ) ( not ( = ?auto_79581 ?auto_79582 ) ) ( not ( = ?auto_79581 ?auto_79577 ) ) ( not ( = ?auto_79581 ?auto_79576 ) ) ( not ( = ?auto_79580 ?auto_79583 ) ) ( not ( = ?auto_79580 ?auto_79578 ) ) ( not ( = ?auto_79580 ?auto_79582 ) ) ( not ( = ?auto_79580 ?auto_79577 ) ) ( not ( = ?auto_79580 ?auto_79576 ) ) ( not ( = ?auto_79583 ?auto_79578 ) ) ( not ( = ?auto_79583 ?auto_79582 ) ) ( not ( = ?auto_79583 ?auto_79577 ) ) ( not ( = ?auto_79583 ?auto_79576 ) ) ( not ( = ?auto_79578 ?auto_79582 ) ) ( not ( = ?auto_79578 ?auto_79577 ) ) ( not ( = ?auto_79578 ?auto_79576 ) ) ( not ( = ?auto_79582 ?auto_79577 ) ) ( not ( = ?auto_79582 ?auto_79576 ) ) ( ON ?auto_79576 ?auto_79579 ) ( not ( = ?auto_79576 ?auto_79579 ) ) ( not ( = ?auto_79577 ?auto_79579 ) ) ( not ( = ?auto_79581 ?auto_79579 ) ) ( not ( = ?auto_79580 ?auto_79579 ) ) ( not ( = ?auto_79583 ?auto_79579 ) ) ( not ( = ?auto_79578 ?auto_79579 ) ) ( not ( = ?auto_79582 ?auto_79579 ) ) ( ON ?auto_79577 ?auto_79576 ) ( ON-TABLE ?auto_79579 ) ( ON ?auto_79582 ?auto_79577 ) ( ON ?auto_79578 ?auto_79582 ) ( CLEAR ?auto_79578 ) ( HOLDING ?auto_79583 ) ( CLEAR ?auto_79580 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79581 ?auto_79580 ?auto_79583 )
      ( MAKE-1PILE ?auto_79576 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79584 - BLOCK
    )
    :vars
    (
      ?auto_79589 - BLOCK
      ?auto_79591 - BLOCK
      ?auto_79588 - BLOCK
      ?auto_79586 - BLOCK
      ?auto_79590 - BLOCK
      ?auto_79585 - BLOCK
      ?auto_79587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79584 ?auto_79589 ) ) ( ON-TABLE ?auto_79591 ) ( ON ?auto_79588 ?auto_79591 ) ( not ( = ?auto_79591 ?auto_79588 ) ) ( not ( = ?auto_79591 ?auto_79586 ) ) ( not ( = ?auto_79591 ?auto_79590 ) ) ( not ( = ?auto_79591 ?auto_79585 ) ) ( not ( = ?auto_79591 ?auto_79589 ) ) ( not ( = ?auto_79591 ?auto_79584 ) ) ( not ( = ?auto_79588 ?auto_79586 ) ) ( not ( = ?auto_79588 ?auto_79590 ) ) ( not ( = ?auto_79588 ?auto_79585 ) ) ( not ( = ?auto_79588 ?auto_79589 ) ) ( not ( = ?auto_79588 ?auto_79584 ) ) ( not ( = ?auto_79586 ?auto_79590 ) ) ( not ( = ?auto_79586 ?auto_79585 ) ) ( not ( = ?auto_79586 ?auto_79589 ) ) ( not ( = ?auto_79586 ?auto_79584 ) ) ( not ( = ?auto_79590 ?auto_79585 ) ) ( not ( = ?auto_79590 ?auto_79589 ) ) ( not ( = ?auto_79590 ?auto_79584 ) ) ( not ( = ?auto_79585 ?auto_79589 ) ) ( not ( = ?auto_79585 ?auto_79584 ) ) ( ON ?auto_79584 ?auto_79587 ) ( not ( = ?auto_79584 ?auto_79587 ) ) ( not ( = ?auto_79589 ?auto_79587 ) ) ( not ( = ?auto_79591 ?auto_79587 ) ) ( not ( = ?auto_79588 ?auto_79587 ) ) ( not ( = ?auto_79586 ?auto_79587 ) ) ( not ( = ?auto_79590 ?auto_79587 ) ) ( not ( = ?auto_79585 ?auto_79587 ) ) ( ON ?auto_79589 ?auto_79584 ) ( ON-TABLE ?auto_79587 ) ( ON ?auto_79585 ?auto_79589 ) ( ON ?auto_79590 ?auto_79585 ) ( CLEAR ?auto_79588 ) ( ON ?auto_79586 ?auto_79590 ) ( CLEAR ?auto_79586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79587 ?auto_79584 ?auto_79589 ?auto_79585 ?auto_79590 )
      ( MAKE-1PILE ?auto_79584 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79592 - BLOCK
    )
    :vars
    (
      ?auto_79594 - BLOCK
      ?auto_79597 - BLOCK
      ?auto_79598 - BLOCK
      ?auto_79596 - BLOCK
      ?auto_79595 - BLOCK
      ?auto_79593 - BLOCK
      ?auto_79599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79592 ?auto_79594 ) ) ( ON-TABLE ?auto_79597 ) ( not ( = ?auto_79597 ?auto_79598 ) ) ( not ( = ?auto_79597 ?auto_79596 ) ) ( not ( = ?auto_79597 ?auto_79595 ) ) ( not ( = ?auto_79597 ?auto_79593 ) ) ( not ( = ?auto_79597 ?auto_79594 ) ) ( not ( = ?auto_79597 ?auto_79592 ) ) ( not ( = ?auto_79598 ?auto_79596 ) ) ( not ( = ?auto_79598 ?auto_79595 ) ) ( not ( = ?auto_79598 ?auto_79593 ) ) ( not ( = ?auto_79598 ?auto_79594 ) ) ( not ( = ?auto_79598 ?auto_79592 ) ) ( not ( = ?auto_79596 ?auto_79595 ) ) ( not ( = ?auto_79596 ?auto_79593 ) ) ( not ( = ?auto_79596 ?auto_79594 ) ) ( not ( = ?auto_79596 ?auto_79592 ) ) ( not ( = ?auto_79595 ?auto_79593 ) ) ( not ( = ?auto_79595 ?auto_79594 ) ) ( not ( = ?auto_79595 ?auto_79592 ) ) ( not ( = ?auto_79593 ?auto_79594 ) ) ( not ( = ?auto_79593 ?auto_79592 ) ) ( ON ?auto_79592 ?auto_79599 ) ( not ( = ?auto_79592 ?auto_79599 ) ) ( not ( = ?auto_79594 ?auto_79599 ) ) ( not ( = ?auto_79597 ?auto_79599 ) ) ( not ( = ?auto_79598 ?auto_79599 ) ) ( not ( = ?auto_79596 ?auto_79599 ) ) ( not ( = ?auto_79595 ?auto_79599 ) ) ( not ( = ?auto_79593 ?auto_79599 ) ) ( ON ?auto_79594 ?auto_79592 ) ( ON-TABLE ?auto_79599 ) ( ON ?auto_79593 ?auto_79594 ) ( ON ?auto_79595 ?auto_79593 ) ( ON ?auto_79596 ?auto_79595 ) ( CLEAR ?auto_79596 ) ( HOLDING ?auto_79598 ) ( CLEAR ?auto_79597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79597 ?auto_79598 )
      ( MAKE-1PILE ?auto_79592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79600 - BLOCK
    )
    :vars
    (
      ?auto_79602 - BLOCK
      ?auto_79601 - BLOCK
      ?auto_79606 - BLOCK
      ?auto_79607 - BLOCK
      ?auto_79603 - BLOCK
      ?auto_79605 - BLOCK
      ?auto_79604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79600 ?auto_79602 ) ) ( ON-TABLE ?auto_79601 ) ( not ( = ?auto_79601 ?auto_79606 ) ) ( not ( = ?auto_79601 ?auto_79607 ) ) ( not ( = ?auto_79601 ?auto_79603 ) ) ( not ( = ?auto_79601 ?auto_79605 ) ) ( not ( = ?auto_79601 ?auto_79602 ) ) ( not ( = ?auto_79601 ?auto_79600 ) ) ( not ( = ?auto_79606 ?auto_79607 ) ) ( not ( = ?auto_79606 ?auto_79603 ) ) ( not ( = ?auto_79606 ?auto_79605 ) ) ( not ( = ?auto_79606 ?auto_79602 ) ) ( not ( = ?auto_79606 ?auto_79600 ) ) ( not ( = ?auto_79607 ?auto_79603 ) ) ( not ( = ?auto_79607 ?auto_79605 ) ) ( not ( = ?auto_79607 ?auto_79602 ) ) ( not ( = ?auto_79607 ?auto_79600 ) ) ( not ( = ?auto_79603 ?auto_79605 ) ) ( not ( = ?auto_79603 ?auto_79602 ) ) ( not ( = ?auto_79603 ?auto_79600 ) ) ( not ( = ?auto_79605 ?auto_79602 ) ) ( not ( = ?auto_79605 ?auto_79600 ) ) ( ON ?auto_79600 ?auto_79604 ) ( not ( = ?auto_79600 ?auto_79604 ) ) ( not ( = ?auto_79602 ?auto_79604 ) ) ( not ( = ?auto_79601 ?auto_79604 ) ) ( not ( = ?auto_79606 ?auto_79604 ) ) ( not ( = ?auto_79607 ?auto_79604 ) ) ( not ( = ?auto_79603 ?auto_79604 ) ) ( not ( = ?auto_79605 ?auto_79604 ) ) ( ON ?auto_79602 ?auto_79600 ) ( ON-TABLE ?auto_79604 ) ( ON ?auto_79605 ?auto_79602 ) ( ON ?auto_79603 ?auto_79605 ) ( ON ?auto_79607 ?auto_79603 ) ( CLEAR ?auto_79601 ) ( ON ?auto_79606 ?auto_79607 ) ( CLEAR ?auto_79606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79604 ?auto_79600 ?auto_79602 ?auto_79605 ?auto_79603 ?auto_79607 )
      ( MAKE-1PILE ?auto_79600 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79608 - BLOCK
    )
    :vars
    (
      ?auto_79609 - BLOCK
      ?auto_79611 - BLOCK
      ?auto_79615 - BLOCK
      ?auto_79614 - BLOCK
      ?auto_79612 - BLOCK
      ?auto_79613 - BLOCK
      ?auto_79610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79608 ?auto_79609 ) ) ( not ( = ?auto_79611 ?auto_79615 ) ) ( not ( = ?auto_79611 ?auto_79614 ) ) ( not ( = ?auto_79611 ?auto_79612 ) ) ( not ( = ?auto_79611 ?auto_79613 ) ) ( not ( = ?auto_79611 ?auto_79609 ) ) ( not ( = ?auto_79611 ?auto_79608 ) ) ( not ( = ?auto_79615 ?auto_79614 ) ) ( not ( = ?auto_79615 ?auto_79612 ) ) ( not ( = ?auto_79615 ?auto_79613 ) ) ( not ( = ?auto_79615 ?auto_79609 ) ) ( not ( = ?auto_79615 ?auto_79608 ) ) ( not ( = ?auto_79614 ?auto_79612 ) ) ( not ( = ?auto_79614 ?auto_79613 ) ) ( not ( = ?auto_79614 ?auto_79609 ) ) ( not ( = ?auto_79614 ?auto_79608 ) ) ( not ( = ?auto_79612 ?auto_79613 ) ) ( not ( = ?auto_79612 ?auto_79609 ) ) ( not ( = ?auto_79612 ?auto_79608 ) ) ( not ( = ?auto_79613 ?auto_79609 ) ) ( not ( = ?auto_79613 ?auto_79608 ) ) ( ON ?auto_79608 ?auto_79610 ) ( not ( = ?auto_79608 ?auto_79610 ) ) ( not ( = ?auto_79609 ?auto_79610 ) ) ( not ( = ?auto_79611 ?auto_79610 ) ) ( not ( = ?auto_79615 ?auto_79610 ) ) ( not ( = ?auto_79614 ?auto_79610 ) ) ( not ( = ?auto_79612 ?auto_79610 ) ) ( not ( = ?auto_79613 ?auto_79610 ) ) ( ON ?auto_79609 ?auto_79608 ) ( ON-TABLE ?auto_79610 ) ( ON ?auto_79613 ?auto_79609 ) ( ON ?auto_79612 ?auto_79613 ) ( ON ?auto_79614 ?auto_79612 ) ( ON ?auto_79615 ?auto_79614 ) ( CLEAR ?auto_79615 ) ( HOLDING ?auto_79611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79611 )
      ( MAKE-1PILE ?auto_79608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79616 - BLOCK
    )
    :vars
    (
      ?auto_79623 - BLOCK
      ?auto_79621 - BLOCK
      ?auto_79620 - BLOCK
      ?auto_79617 - BLOCK
      ?auto_79618 - BLOCK
      ?auto_79619 - BLOCK
      ?auto_79622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79616 ?auto_79623 ) ) ( not ( = ?auto_79621 ?auto_79620 ) ) ( not ( = ?auto_79621 ?auto_79617 ) ) ( not ( = ?auto_79621 ?auto_79618 ) ) ( not ( = ?auto_79621 ?auto_79619 ) ) ( not ( = ?auto_79621 ?auto_79623 ) ) ( not ( = ?auto_79621 ?auto_79616 ) ) ( not ( = ?auto_79620 ?auto_79617 ) ) ( not ( = ?auto_79620 ?auto_79618 ) ) ( not ( = ?auto_79620 ?auto_79619 ) ) ( not ( = ?auto_79620 ?auto_79623 ) ) ( not ( = ?auto_79620 ?auto_79616 ) ) ( not ( = ?auto_79617 ?auto_79618 ) ) ( not ( = ?auto_79617 ?auto_79619 ) ) ( not ( = ?auto_79617 ?auto_79623 ) ) ( not ( = ?auto_79617 ?auto_79616 ) ) ( not ( = ?auto_79618 ?auto_79619 ) ) ( not ( = ?auto_79618 ?auto_79623 ) ) ( not ( = ?auto_79618 ?auto_79616 ) ) ( not ( = ?auto_79619 ?auto_79623 ) ) ( not ( = ?auto_79619 ?auto_79616 ) ) ( ON ?auto_79616 ?auto_79622 ) ( not ( = ?auto_79616 ?auto_79622 ) ) ( not ( = ?auto_79623 ?auto_79622 ) ) ( not ( = ?auto_79621 ?auto_79622 ) ) ( not ( = ?auto_79620 ?auto_79622 ) ) ( not ( = ?auto_79617 ?auto_79622 ) ) ( not ( = ?auto_79618 ?auto_79622 ) ) ( not ( = ?auto_79619 ?auto_79622 ) ) ( ON ?auto_79623 ?auto_79616 ) ( ON-TABLE ?auto_79622 ) ( ON ?auto_79619 ?auto_79623 ) ( ON ?auto_79618 ?auto_79619 ) ( ON ?auto_79617 ?auto_79618 ) ( ON ?auto_79620 ?auto_79617 ) ( ON ?auto_79621 ?auto_79620 ) ( CLEAR ?auto_79621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79622 ?auto_79616 ?auto_79623 ?auto_79619 ?auto_79618 ?auto_79617 ?auto_79620 )
      ( MAKE-1PILE ?auto_79616 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79629 - BLOCK
      ?auto_79630 - BLOCK
      ?auto_79631 - BLOCK
      ?auto_79632 - BLOCK
      ?auto_79633 - BLOCK
    )
    :vars
    (
      ?auto_79634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79634 ?auto_79633 ) ( CLEAR ?auto_79634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79629 ) ( ON ?auto_79630 ?auto_79629 ) ( ON ?auto_79631 ?auto_79630 ) ( ON ?auto_79632 ?auto_79631 ) ( ON ?auto_79633 ?auto_79632 ) ( not ( = ?auto_79629 ?auto_79630 ) ) ( not ( = ?auto_79629 ?auto_79631 ) ) ( not ( = ?auto_79629 ?auto_79632 ) ) ( not ( = ?auto_79629 ?auto_79633 ) ) ( not ( = ?auto_79629 ?auto_79634 ) ) ( not ( = ?auto_79630 ?auto_79631 ) ) ( not ( = ?auto_79630 ?auto_79632 ) ) ( not ( = ?auto_79630 ?auto_79633 ) ) ( not ( = ?auto_79630 ?auto_79634 ) ) ( not ( = ?auto_79631 ?auto_79632 ) ) ( not ( = ?auto_79631 ?auto_79633 ) ) ( not ( = ?auto_79631 ?auto_79634 ) ) ( not ( = ?auto_79632 ?auto_79633 ) ) ( not ( = ?auto_79632 ?auto_79634 ) ) ( not ( = ?auto_79633 ?auto_79634 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79634 ?auto_79633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79635 - BLOCK
      ?auto_79636 - BLOCK
      ?auto_79637 - BLOCK
      ?auto_79638 - BLOCK
      ?auto_79639 - BLOCK
    )
    :vars
    (
      ?auto_79640 - BLOCK
      ?auto_79641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79640 ?auto_79639 ) ( CLEAR ?auto_79640 ) ( ON-TABLE ?auto_79635 ) ( ON ?auto_79636 ?auto_79635 ) ( ON ?auto_79637 ?auto_79636 ) ( ON ?auto_79638 ?auto_79637 ) ( ON ?auto_79639 ?auto_79638 ) ( not ( = ?auto_79635 ?auto_79636 ) ) ( not ( = ?auto_79635 ?auto_79637 ) ) ( not ( = ?auto_79635 ?auto_79638 ) ) ( not ( = ?auto_79635 ?auto_79639 ) ) ( not ( = ?auto_79635 ?auto_79640 ) ) ( not ( = ?auto_79636 ?auto_79637 ) ) ( not ( = ?auto_79636 ?auto_79638 ) ) ( not ( = ?auto_79636 ?auto_79639 ) ) ( not ( = ?auto_79636 ?auto_79640 ) ) ( not ( = ?auto_79637 ?auto_79638 ) ) ( not ( = ?auto_79637 ?auto_79639 ) ) ( not ( = ?auto_79637 ?auto_79640 ) ) ( not ( = ?auto_79638 ?auto_79639 ) ) ( not ( = ?auto_79638 ?auto_79640 ) ) ( not ( = ?auto_79639 ?auto_79640 ) ) ( HOLDING ?auto_79641 ) ( not ( = ?auto_79635 ?auto_79641 ) ) ( not ( = ?auto_79636 ?auto_79641 ) ) ( not ( = ?auto_79637 ?auto_79641 ) ) ( not ( = ?auto_79638 ?auto_79641 ) ) ( not ( = ?auto_79639 ?auto_79641 ) ) ( not ( = ?auto_79640 ?auto_79641 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_79641 )
      ( MAKE-5PILE ?auto_79635 ?auto_79636 ?auto_79637 ?auto_79638 ?auto_79639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79642 - BLOCK
      ?auto_79643 - BLOCK
      ?auto_79644 - BLOCK
      ?auto_79645 - BLOCK
      ?auto_79646 - BLOCK
    )
    :vars
    (
      ?auto_79647 - BLOCK
      ?auto_79648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79647 ?auto_79646 ) ( ON-TABLE ?auto_79642 ) ( ON ?auto_79643 ?auto_79642 ) ( ON ?auto_79644 ?auto_79643 ) ( ON ?auto_79645 ?auto_79644 ) ( ON ?auto_79646 ?auto_79645 ) ( not ( = ?auto_79642 ?auto_79643 ) ) ( not ( = ?auto_79642 ?auto_79644 ) ) ( not ( = ?auto_79642 ?auto_79645 ) ) ( not ( = ?auto_79642 ?auto_79646 ) ) ( not ( = ?auto_79642 ?auto_79647 ) ) ( not ( = ?auto_79643 ?auto_79644 ) ) ( not ( = ?auto_79643 ?auto_79645 ) ) ( not ( = ?auto_79643 ?auto_79646 ) ) ( not ( = ?auto_79643 ?auto_79647 ) ) ( not ( = ?auto_79644 ?auto_79645 ) ) ( not ( = ?auto_79644 ?auto_79646 ) ) ( not ( = ?auto_79644 ?auto_79647 ) ) ( not ( = ?auto_79645 ?auto_79646 ) ) ( not ( = ?auto_79645 ?auto_79647 ) ) ( not ( = ?auto_79646 ?auto_79647 ) ) ( not ( = ?auto_79642 ?auto_79648 ) ) ( not ( = ?auto_79643 ?auto_79648 ) ) ( not ( = ?auto_79644 ?auto_79648 ) ) ( not ( = ?auto_79645 ?auto_79648 ) ) ( not ( = ?auto_79646 ?auto_79648 ) ) ( not ( = ?auto_79647 ?auto_79648 ) ) ( ON ?auto_79648 ?auto_79647 ) ( CLEAR ?auto_79648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79642 ?auto_79643 ?auto_79644 ?auto_79645 ?auto_79646 ?auto_79647 )
      ( MAKE-5PILE ?auto_79642 ?auto_79643 ?auto_79644 ?auto_79645 ?auto_79646 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79649 - BLOCK
      ?auto_79650 - BLOCK
      ?auto_79651 - BLOCK
      ?auto_79652 - BLOCK
      ?auto_79653 - BLOCK
    )
    :vars
    (
      ?auto_79654 - BLOCK
      ?auto_79655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79654 ?auto_79653 ) ( ON-TABLE ?auto_79649 ) ( ON ?auto_79650 ?auto_79649 ) ( ON ?auto_79651 ?auto_79650 ) ( ON ?auto_79652 ?auto_79651 ) ( ON ?auto_79653 ?auto_79652 ) ( not ( = ?auto_79649 ?auto_79650 ) ) ( not ( = ?auto_79649 ?auto_79651 ) ) ( not ( = ?auto_79649 ?auto_79652 ) ) ( not ( = ?auto_79649 ?auto_79653 ) ) ( not ( = ?auto_79649 ?auto_79654 ) ) ( not ( = ?auto_79650 ?auto_79651 ) ) ( not ( = ?auto_79650 ?auto_79652 ) ) ( not ( = ?auto_79650 ?auto_79653 ) ) ( not ( = ?auto_79650 ?auto_79654 ) ) ( not ( = ?auto_79651 ?auto_79652 ) ) ( not ( = ?auto_79651 ?auto_79653 ) ) ( not ( = ?auto_79651 ?auto_79654 ) ) ( not ( = ?auto_79652 ?auto_79653 ) ) ( not ( = ?auto_79652 ?auto_79654 ) ) ( not ( = ?auto_79653 ?auto_79654 ) ) ( not ( = ?auto_79649 ?auto_79655 ) ) ( not ( = ?auto_79650 ?auto_79655 ) ) ( not ( = ?auto_79651 ?auto_79655 ) ) ( not ( = ?auto_79652 ?auto_79655 ) ) ( not ( = ?auto_79653 ?auto_79655 ) ) ( not ( = ?auto_79654 ?auto_79655 ) ) ( HOLDING ?auto_79655 ) ( CLEAR ?auto_79654 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79649 ?auto_79650 ?auto_79651 ?auto_79652 ?auto_79653 ?auto_79654 ?auto_79655 )
      ( MAKE-5PILE ?auto_79649 ?auto_79650 ?auto_79651 ?auto_79652 ?auto_79653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79656 - BLOCK
      ?auto_79657 - BLOCK
      ?auto_79658 - BLOCK
      ?auto_79659 - BLOCK
      ?auto_79660 - BLOCK
    )
    :vars
    (
      ?auto_79661 - BLOCK
      ?auto_79662 - BLOCK
      ?auto_79663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79661 ?auto_79660 ) ( ON-TABLE ?auto_79656 ) ( ON ?auto_79657 ?auto_79656 ) ( ON ?auto_79658 ?auto_79657 ) ( ON ?auto_79659 ?auto_79658 ) ( ON ?auto_79660 ?auto_79659 ) ( not ( = ?auto_79656 ?auto_79657 ) ) ( not ( = ?auto_79656 ?auto_79658 ) ) ( not ( = ?auto_79656 ?auto_79659 ) ) ( not ( = ?auto_79656 ?auto_79660 ) ) ( not ( = ?auto_79656 ?auto_79661 ) ) ( not ( = ?auto_79657 ?auto_79658 ) ) ( not ( = ?auto_79657 ?auto_79659 ) ) ( not ( = ?auto_79657 ?auto_79660 ) ) ( not ( = ?auto_79657 ?auto_79661 ) ) ( not ( = ?auto_79658 ?auto_79659 ) ) ( not ( = ?auto_79658 ?auto_79660 ) ) ( not ( = ?auto_79658 ?auto_79661 ) ) ( not ( = ?auto_79659 ?auto_79660 ) ) ( not ( = ?auto_79659 ?auto_79661 ) ) ( not ( = ?auto_79660 ?auto_79661 ) ) ( not ( = ?auto_79656 ?auto_79662 ) ) ( not ( = ?auto_79657 ?auto_79662 ) ) ( not ( = ?auto_79658 ?auto_79662 ) ) ( not ( = ?auto_79659 ?auto_79662 ) ) ( not ( = ?auto_79660 ?auto_79662 ) ) ( not ( = ?auto_79661 ?auto_79662 ) ) ( CLEAR ?auto_79661 ) ( ON ?auto_79662 ?auto_79663 ) ( CLEAR ?auto_79662 ) ( HAND-EMPTY ) ( not ( = ?auto_79656 ?auto_79663 ) ) ( not ( = ?auto_79657 ?auto_79663 ) ) ( not ( = ?auto_79658 ?auto_79663 ) ) ( not ( = ?auto_79659 ?auto_79663 ) ) ( not ( = ?auto_79660 ?auto_79663 ) ) ( not ( = ?auto_79661 ?auto_79663 ) ) ( not ( = ?auto_79662 ?auto_79663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79662 ?auto_79663 )
      ( MAKE-5PILE ?auto_79656 ?auto_79657 ?auto_79658 ?auto_79659 ?auto_79660 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79680 - BLOCK
      ?auto_79681 - BLOCK
      ?auto_79682 - BLOCK
      ?auto_79683 - BLOCK
      ?auto_79684 - BLOCK
    )
    :vars
    (
      ?auto_79685 - BLOCK
      ?auto_79686 - BLOCK
      ?auto_79687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79680 ) ( ON ?auto_79681 ?auto_79680 ) ( ON ?auto_79682 ?auto_79681 ) ( ON ?auto_79683 ?auto_79682 ) ( not ( = ?auto_79680 ?auto_79681 ) ) ( not ( = ?auto_79680 ?auto_79682 ) ) ( not ( = ?auto_79680 ?auto_79683 ) ) ( not ( = ?auto_79680 ?auto_79684 ) ) ( not ( = ?auto_79680 ?auto_79685 ) ) ( not ( = ?auto_79681 ?auto_79682 ) ) ( not ( = ?auto_79681 ?auto_79683 ) ) ( not ( = ?auto_79681 ?auto_79684 ) ) ( not ( = ?auto_79681 ?auto_79685 ) ) ( not ( = ?auto_79682 ?auto_79683 ) ) ( not ( = ?auto_79682 ?auto_79684 ) ) ( not ( = ?auto_79682 ?auto_79685 ) ) ( not ( = ?auto_79683 ?auto_79684 ) ) ( not ( = ?auto_79683 ?auto_79685 ) ) ( not ( = ?auto_79684 ?auto_79685 ) ) ( not ( = ?auto_79680 ?auto_79686 ) ) ( not ( = ?auto_79681 ?auto_79686 ) ) ( not ( = ?auto_79682 ?auto_79686 ) ) ( not ( = ?auto_79683 ?auto_79686 ) ) ( not ( = ?auto_79684 ?auto_79686 ) ) ( not ( = ?auto_79685 ?auto_79686 ) ) ( ON ?auto_79686 ?auto_79687 ) ( not ( = ?auto_79680 ?auto_79687 ) ) ( not ( = ?auto_79681 ?auto_79687 ) ) ( not ( = ?auto_79682 ?auto_79687 ) ) ( not ( = ?auto_79683 ?auto_79687 ) ) ( not ( = ?auto_79684 ?auto_79687 ) ) ( not ( = ?auto_79685 ?auto_79687 ) ) ( not ( = ?auto_79686 ?auto_79687 ) ) ( ON ?auto_79685 ?auto_79686 ) ( CLEAR ?auto_79685 ) ( HOLDING ?auto_79684 ) ( CLEAR ?auto_79683 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79680 ?auto_79681 ?auto_79682 ?auto_79683 ?auto_79684 ?auto_79685 )
      ( MAKE-5PILE ?auto_79680 ?auto_79681 ?auto_79682 ?auto_79683 ?auto_79684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79688 - BLOCK
      ?auto_79689 - BLOCK
      ?auto_79690 - BLOCK
      ?auto_79691 - BLOCK
      ?auto_79692 - BLOCK
    )
    :vars
    (
      ?auto_79695 - BLOCK
      ?auto_79693 - BLOCK
      ?auto_79694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79688 ) ( ON ?auto_79689 ?auto_79688 ) ( ON ?auto_79690 ?auto_79689 ) ( ON ?auto_79691 ?auto_79690 ) ( not ( = ?auto_79688 ?auto_79689 ) ) ( not ( = ?auto_79688 ?auto_79690 ) ) ( not ( = ?auto_79688 ?auto_79691 ) ) ( not ( = ?auto_79688 ?auto_79692 ) ) ( not ( = ?auto_79688 ?auto_79695 ) ) ( not ( = ?auto_79689 ?auto_79690 ) ) ( not ( = ?auto_79689 ?auto_79691 ) ) ( not ( = ?auto_79689 ?auto_79692 ) ) ( not ( = ?auto_79689 ?auto_79695 ) ) ( not ( = ?auto_79690 ?auto_79691 ) ) ( not ( = ?auto_79690 ?auto_79692 ) ) ( not ( = ?auto_79690 ?auto_79695 ) ) ( not ( = ?auto_79691 ?auto_79692 ) ) ( not ( = ?auto_79691 ?auto_79695 ) ) ( not ( = ?auto_79692 ?auto_79695 ) ) ( not ( = ?auto_79688 ?auto_79693 ) ) ( not ( = ?auto_79689 ?auto_79693 ) ) ( not ( = ?auto_79690 ?auto_79693 ) ) ( not ( = ?auto_79691 ?auto_79693 ) ) ( not ( = ?auto_79692 ?auto_79693 ) ) ( not ( = ?auto_79695 ?auto_79693 ) ) ( ON ?auto_79693 ?auto_79694 ) ( not ( = ?auto_79688 ?auto_79694 ) ) ( not ( = ?auto_79689 ?auto_79694 ) ) ( not ( = ?auto_79690 ?auto_79694 ) ) ( not ( = ?auto_79691 ?auto_79694 ) ) ( not ( = ?auto_79692 ?auto_79694 ) ) ( not ( = ?auto_79695 ?auto_79694 ) ) ( not ( = ?auto_79693 ?auto_79694 ) ) ( ON ?auto_79695 ?auto_79693 ) ( CLEAR ?auto_79691 ) ( ON ?auto_79692 ?auto_79695 ) ( CLEAR ?auto_79692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79694 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79694 ?auto_79693 ?auto_79695 )
      ( MAKE-5PILE ?auto_79688 ?auto_79689 ?auto_79690 ?auto_79691 ?auto_79692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79696 - BLOCK
      ?auto_79697 - BLOCK
      ?auto_79698 - BLOCK
      ?auto_79699 - BLOCK
      ?auto_79700 - BLOCK
    )
    :vars
    (
      ?auto_79702 - BLOCK
      ?auto_79701 - BLOCK
      ?auto_79703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79696 ) ( ON ?auto_79697 ?auto_79696 ) ( ON ?auto_79698 ?auto_79697 ) ( not ( = ?auto_79696 ?auto_79697 ) ) ( not ( = ?auto_79696 ?auto_79698 ) ) ( not ( = ?auto_79696 ?auto_79699 ) ) ( not ( = ?auto_79696 ?auto_79700 ) ) ( not ( = ?auto_79696 ?auto_79702 ) ) ( not ( = ?auto_79697 ?auto_79698 ) ) ( not ( = ?auto_79697 ?auto_79699 ) ) ( not ( = ?auto_79697 ?auto_79700 ) ) ( not ( = ?auto_79697 ?auto_79702 ) ) ( not ( = ?auto_79698 ?auto_79699 ) ) ( not ( = ?auto_79698 ?auto_79700 ) ) ( not ( = ?auto_79698 ?auto_79702 ) ) ( not ( = ?auto_79699 ?auto_79700 ) ) ( not ( = ?auto_79699 ?auto_79702 ) ) ( not ( = ?auto_79700 ?auto_79702 ) ) ( not ( = ?auto_79696 ?auto_79701 ) ) ( not ( = ?auto_79697 ?auto_79701 ) ) ( not ( = ?auto_79698 ?auto_79701 ) ) ( not ( = ?auto_79699 ?auto_79701 ) ) ( not ( = ?auto_79700 ?auto_79701 ) ) ( not ( = ?auto_79702 ?auto_79701 ) ) ( ON ?auto_79701 ?auto_79703 ) ( not ( = ?auto_79696 ?auto_79703 ) ) ( not ( = ?auto_79697 ?auto_79703 ) ) ( not ( = ?auto_79698 ?auto_79703 ) ) ( not ( = ?auto_79699 ?auto_79703 ) ) ( not ( = ?auto_79700 ?auto_79703 ) ) ( not ( = ?auto_79702 ?auto_79703 ) ) ( not ( = ?auto_79701 ?auto_79703 ) ) ( ON ?auto_79702 ?auto_79701 ) ( ON ?auto_79700 ?auto_79702 ) ( CLEAR ?auto_79700 ) ( ON-TABLE ?auto_79703 ) ( HOLDING ?auto_79699 ) ( CLEAR ?auto_79698 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79696 ?auto_79697 ?auto_79698 ?auto_79699 )
      ( MAKE-5PILE ?auto_79696 ?auto_79697 ?auto_79698 ?auto_79699 ?auto_79700 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79704 - BLOCK
      ?auto_79705 - BLOCK
      ?auto_79706 - BLOCK
      ?auto_79707 - BLOCK
      ?auto_79708 - BLOCK
    )
    :vars
    (
      ?auto_79710 - BLOCK
      ?auto_79711 - BLOCK
      ?auto_79709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79704 ) ( ON ?auto_79705 ?auto_79704 ) ( ON ?auto_79706 ?auto_79705 ) ( not ( = ?auto_79704 ?auto_79705 ) ) ( not ( = ?auto_79704 ?auto_79706 ) ) ( not ( = ?auto_79704 ?auto_79707 ) ) ( not ( = ?auto_79704 ?auto_79708 ) ) ( not ( = ?auto_79704 ?auto_79710 ) ) ( not ( = ?auto_79705 ?auto_79706 ) ) ( not ( = ?auto_79705 ?auto_79707 ) ) ( not ( = ?auto_79705 ?auto_79708 ) ) ( not ( = ?auto_79705 ?auto_79710 ) ) ( not ( = ?auto_79706 ?auto_79707 ) ) ( not ( = ?auto_79706 ?auto_79708 ) ) ( not ( = ?auto_79706 ?auto_79710 ) ) ( not ( = ?auto_79707 ?auto_79708 ) ) ( not ( = ?auto_79707 ?auto_79710 ) ) ( not ( = ?auto_79708 ?auto_79710 ) ) ( not ( = ?auto_79704 ?auto_79711 ) ) ( not ( = ?auto_79705 ?auto_79711 ) ) ( not ( = ?auto_79706 ?auto_79711 ) ) ( not ( = ?auto_79707 ?auto_79711 ) ) ( not ( = ?auto_79708 ?auto_79711 ) ) ( not ( = ?auto_79710 ?auto_79711 ) ) ( ON ?auto_79711 ?auto_79709 ) ( not ( = ?auto_79704 ?auto_79709 ) ) ( not ( = ?auto_79705 ?auto_79709 ) ) ( not ( = ?auto_79706 ?auto_79709 ) ) ( not ( = ?auto_79707 ?auto_79709 ) ) ( not ( = ?auto_79708 ?auto_79709 ) ) ( not ( = ?auto_79710 ?auto_79709 ) ) ( not ( = ?auto_79711 ?auto_79709 ) ) ( ON ?auto_79710 ?auto_79711 ) ( ON ?auto_79708 ?auto_79710 ) ( ON-TABLE ?auto_79709 ) ( CLEAR ?auto_79706 ) ( ON ?auto_79707 ?auto_79708 ) ( CLEAR ?auto_79707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79709 ?auto_79711 ?auto_79710 ?auto_79708 )
      ( MAKE-5PILE ?auto_79704 ?auto_79705 ?auto_79706 ?auto_79707 ?auto_79708 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79712 - BLOCK
      ?auto_79713 - BLOCK
      ?auto_79714 - BLOCK
      ?auto_79715 - BLOCK
      ?auto_79716 - BLOCK
    )
    :vars
    (
      ?auto_79719 - BLOCK
      ?auto_79718 - BLOCK
      ?auto_79717 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79712 ) ( ON ?auto_79713 ?auto_79712 ) ( not ( = ?auto_79712 ?auto_79713 ) ) ( not ( = ?auto_79712 ?auto_79714 ) ) ( not ( = ?auto_79712 ?auto_79715 ) ) ( not ( = ?auto_79712 ?auto_79716 ) ) ( not ( = ?auto_79712 ?auto_79719 ) ) ( not ( = ?auto_79713 ?auto_79714 ) ) ( not ( = ?auto_79713 ?auto_79715 ) ) ( not ( = ?auto_79713 ?auto_79716 ) ) ( not ( = ?auto_79713 ?auto_79719 ) ) ( not ( = ?auto_79714 ?auto_79715 ) ) ( not ( = ?auto_79714 ?auto_79716 ) ) ( not ( = ?auto_79714 ?auto_79719 ) ) ( not ( = ?auto_79715 ?auto_79716 ) ) ( not ( = ?auto_79715 ?auto_79719 ) ) ( not ( = ?auto_79716 ?auto_79719 ) ) ( not ( = ?auto_79712 ?auto_79718 ) ) ( not ( = ?auto_79713 ?auto_79718 ) ) ( not ( = ?auto_79714 ?auto_79718 ) ) ( not ( = ?auto_79715 ?auto_79718 ) ) ( not ( = ?auto_79716 ?auto_79718 ) ) ( not ( = ?auto_79719 ?auto_79718 ) ) ( ON ?auto_79718 ?auto_79717 ) ( not ( = ?auto_79712 ?auto_79717 ) ) ( not ( = ?auto_79713 ?auto_79717 ) ) ( not ( = ?auto_79714 ?auto_79717 ) ) ( not ( = ?auto_79715 ?auto_79717 ) ) ( not ( = ?auto_79716 ?auto_79717 ) ) ( not ( = ?auto_79719 ?auto_79717 ) ) ( not ( = ?auto_79718 ?auto_79717 ) ) ( ON ?auto_79719 ?auto_79718 ) ( ON ?auto_79716 ?auto_79719 ) ( ON-TABLE ?auto_79717 ) ( ON ?auto_79715 ?auto_79716 ) ( CLEAR ?auto_79715 ) ( HOLDING ?auto_79714 ) ( CLEAR ?auto_79713 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79712 ?auto_79713 ?auto_79714 )
      ( MAKE-5PILE ?auto_79712 ?auto_79713 ?auto_79714 ?auto_79715 ?auto_79716 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79720 - BLOCK
      ?auto_79721 - BLOCK
      ?auto_79722 - BLOCK
      ?auto_79723 - BLOCK
      ?auto_79724 - BLOCK
    )
    :vars
    (
      ?auto_79725 - BLOCK
      ?auto_79727 - BLOCK
      ?auto_79726 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79720 ) ( ON ?auto_79721 ?auto_79720 ) ( not ( = ?auto_79720 ?auto_79721 ) ) ( not ( = ?auto_79720 ?auto_79722 ) ) ( not ( = ?auto_79720 ?auto_79723 ) ) ( not ( = ?auto_79720 ?auto_79724 ) ) ( not ( = ?auto_79720 ?auto_79725 ) ) ( not ( = ?auto_79721 ?auto_79722 ) ) ( not ( = ?auto_79721 ?auto_79723 ) ) ( not ( = ?auto_79721 ?auto_79724 ) ) ( not ( = ?auto_79721 ?auto_79725 ) ) ( not ( = ?auto_79722 ?auto_79723 ) ) ( not ( = ?auto_79722 ?auto_79724 ) ) ( not ( = ?auto_79722 ?auto_79725 ) ) ( not ( = ?auto_79723 ?auto_79724 ) ) ( not ( = ?auto_79723 ?auto_79725 ) ) ( not ( = ?auto_79724 ?auto_79725 ) ) ( not ( = ?auto_79720 ?auto_79727 ) ) ( not ( = ?auto_79721 ?auto_79727 ) ) ( not ( = ?auto_79722 ?auto_79727 ) ) ( not ( = ?auto_79723 ?auto_79727 ) ) ( not ( = ?auto_79724 ?auto_79727 ) ) ( not ( = ?auto_79725 ?auto_79727 ) ) ( ON ?auto_79727 ?auto_79726 ) ( not ( = ?auto_79720 ?auto_79726 ) ) ( not ( = ?auto_79721 ?auto_79726 ) ) ( not ( = ?auto_79722 ?auto_79726 ) ) ( not ( = ?auto_79723 ?auto_79726 ) ) ( not ( = ?auto_79724 ?auto_79726 ) ) ( not ( = ?auto_79725 ?auto_79726 ) ) ( not ( = ?auto_79727 ?auto_79726 ) ) ( ON ?auto_79725 ?auto_79727 ) ( ON ?auto_79724 ?auto_79725 ) ( ON-TABLE ?auto_79726 ) ( ON ?auto_79723 ?auto_79724 ) ( CLEAR ?auto_79721 ) ( ON ?auto_79722 ?auto_79723 ) ( CLEAR ?auto_79722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79726 ?auto_79727 ?auto_79725 ?auto_79724 ?auto_79723 )
      ( MAKE-5PILE ?auto_79720 ?auto_79721 ?auto_79722 ?auto_79723 ?auto_79724 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79728 - BLOCK
      ?auto_79729 - BLOCK
      ?auto_79730 - BLOCK
      ?auto_79731 - BLOCK
      ?auto_79732 - BLOCK
    )
    :vars
    (
      ?auto_79734 - BLOCK
      ?auto_79735 - BLOCK
      ?auto_79733 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79728 ) ( not ( = ?auto_79728 ?auto_79729 ) ) ( not ( = ?auto_79728 ?auto_79730 ) ) ( not ( = ?auto_79728 ?auto_79731 ) ) ( not ( = ?auto_79728 ?auto_79732 ) ) ( not ( = ?auto_79728 ?auto_79734 ) ) ( not ( = ?auto_79729 ?auto_79730 ) ) ( not ( = ?auto_79729 ?auto_79731 ) ) ( not ( = ?auto_79729 ?auto_79732 ) ) ( not ( = ?auto_79729 ?auto_79734 ) ) ( not ( = ?auto_79730 ?auto_79731 ) ) ( not ( = ?auto_79730 ?auto_79732 ) ) ( not ( = ?auto_79730 ?auto_79734 ) ) ( not ( = ?auto_79731 ?auto_79732 ) ) ( not ( = ?auto_79731 ?auto_79734 ) ) ( not ( = ?auto_79732 ?auto_79734 ) ) ( not ( = ?auto_79728 ?auto_79735 ) ) ( not ( = ?auto_79729 ?auto_79735 ) ) ( not ( = ?auto_79730 ?auto_79735 ) ) ( not ( = ?auto_79731 ?auto_79735 ) ) ( not ( = ?auto_79732 ?auto_79735 ) ) ( not ( = ?auto_79734 ?auto_79735 ) ) ( ON ?auto_79735 ?auto_79733 ) ( not ( = ?auto_79728 ?auto_79733 ) ) ( not ( = ?auto_79729 ?auto_79733 ) ) ( not ( = ?auto_79730 ?auto_79733 ) ) ( not ( = ?auto_79731 ?auto_79733 ) ) ( not ( = ?auto_79732 ?auto_79733 ) ) ( not ( = ?auto_79734 ?auto_79733 ) ) ( not ( = ?auto_79735 ?auto_79733 ) ) ( ON ?auto_79734 ?auto_79735 ) ( ON ?auto_79732 ?auto_79734 ) ( ON-TABLE ?auto_79733 ) ( ON ?auto_79731 ?auto_79732 ) ( ON ?auto_79730 ?auto_79731 ) ( CLEAR ?auto_79730 ) ( HOLDING ?auto_79729 ) ( CLEAR ?auto_79728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79728 ?auto_79729 )
      ( MAKE-5PILE ?auto_79728 ?auto_79729 ?auto_79730 ?auto_79731 ?auto_79732 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79736 - BLOCK
      ?auto_79737 - BLOCK
      ?auto_79738 - BLOCK
      ?auto_79739 - BLOCK
      ?auto_79740 - BLOCK
    )
    :vars
    (
      ?auto_79743 - BLOCK
      ?auto_79742 - BLOCK
      ?auto_79741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79736 ) ( not ( = ?auto_79736 ?auto_79737 ) ) ( not ( = ?auto_79736 ?auto_79738 ) ) ( not ( = ?auto_79736 ?auto_79739 ) ) ( not ( = ?auto_79736 ?auto_79740 ) ) ( not ( = ?auto_79736 ?auto_79743 ) ) ( not ( = ?auto_79737 ?auto_79738 ) ) ( not ( = ?auto_79737 ?auto_79739 ) ) ( not ( = ?auto_79737 ?auto_79740 ) ) ( not ( = ?auto_79737 ?auto_79743 ) ) ( not ( = ?auto_79738 ?auto_79739 ) ) ( not ( = ?auto_79738 ?auto_79740 ) ) ( not ( = ?auto_79738 ?auto_79743 ) ) ( not ( = ?auto_79739 ?auto_79740 ) ) ( not ( = ?auto_79739 ?auto_79743 ) ) ( not ( = ?auto_79740 ?auto_79743 ) ) ( not ( = ?auto_79736 ?auto_79742 ) ) ( not ( = ?auto_79737 ?auto_79742 ) ) ( not ( = ?auto_79738 ?auto_79742 ) ) ( not ( = ?auto_79739 ?auto_79742 ) ) ( not ( = ?auto_79740 ?auto_79742 ) ) ( not ( = ?auto_79743 ?auto_79742 ) ) ( ON ?auto_79742 ?auto_79741 ) ( not ( = ?auto_79736 ?auto_79741 ) ) ( not ( = ?auto_79737 ?auto_79741 ) ) ( not ( = ?auto_79738 ?auto_79741 ) ) ( not ( = ?auto_79739 ?auto_79741 ) ) ( not ( = ?auto_79740 ?auto_79741 ) ) ( not ( = ?auto_79743 ?auto_79741 ) ) ( not ( = ?auto_79742 ?auto_79741 ) ) ( ON ?auto_79743 ?auto_79742 ) ( ON ?auto_79740 ?auto_79743 ) ( ON-TABLE ?auto_79741 ) ( ON ?auto_79739 ?auto_79740 ) ( ON ?auto_79738 ?auto_79739 ) ( CLEAR ?auto_79736 ) ( ON ?auto_79737 ?auto_79738 ) ( CLEAR ?auto_79737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79741 ?auto_79742 ?auto_79743 ?auto_79740 ?auto_79739 ?auto_79738 )
      ( MAKE-5PILE ?auto_79736 ?auto_79737 ?auto_79738 ?auto_79739 ?auto_79740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79744 - BLOCK
      ?auto_79745 - BLOCK
      ?auto_79746 - BLOCK
      ?auto_79747 - BLOCK
      ?auto_79748 - BLOCK
    )
    :vars
    (
      ?auto_79749 - BLOCK
      ?auto_79750 - BLOCK
      ?auto_79751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79744 ?auto_79745 ) ) ( not ( = ?auto_79744 ?auto_79746 ) ) ( not ( = ?auto_79744 ?auto_79747 ) ) ( not ( = ?auto_79744 ?auto_79748 ) ) ( not ( = ?auto_79744 ?auto_79749 ) ) ( not ( = ?auto_79745 ?auto_79746 ) ) ( not ( = ?auto_79745 ?auto_79747 ) ) ( not ( = ?auto_79745 ?auto_79748 ) ) ( not ( = ?auto_79745 ?auto_79749 ) ) ( not ( = ?auto_79746 ?auto_79747 ) ) ( not ( = ?auto_79746 ?auto_79748 ) ) ( not ( = ?auto_79746 ?auto_79749 ) ) ( not ( = ?auto_79747 ?auto_79748 ) ) ( not ( = ?auto_79747 ?auto_79749 ) ) ( not ( = ?auto_79748 ?auto_79749 ) ) ( not ( = ?auto_79744 ?auto_79750 ) ) ( not ( = ?auto_79745 ?auto_79750 ) ) ( not ( = ?auto_79746 ?auto_79750 ) ) ( not ( = ?auto_79747 ?auto_79750 ) ) ( not ( = ?auto_79748 ?auto_79750 ) ) ( not ( = ?auto_79749 ?auto_79750 ) ) ( ON ?auto_79750 ?auto_79751 ) ( not ( = ?auto_79744 ?auto_79751 ) ) ( not ( = ?auto_79745 ?auto_79751 ) ) ( not ( = ?auto_79746 ?auto_79751 ) ) ( not ( = ?auto_79747 ?auto_79751 ) ) ( not ( = ?auto_79748 ?auto_79751 ) ) ( not ( = ?auto_79749 ?auto_79751 ) ) ( not ( = ?auto_79750 ?auto_79751 ) ) ( ON ?auto_79749 ?auto_79750 ) ( ON ?auto_79748 ?auto_79749 ) ( ON-TABLE ?auto_79751 ) ( ON ?auto_79747 ?auto_79748 ) ( ON ?auto_79746 ?auto_79747 ) ( ON ?auto_79745 ?auto_79746 ) ( CLEAR ?auto_79745 ) ( HOLDING ?auto_79744 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79744 )
      ( MAKE-5PILE ?auto_79744 ?auto_79745 ?auto_79746 ?auto_79747 ?auto_79748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79752 - BLOCK
      ?auto_79753 - BLOCK
      ?auto_79754 - BLOCK
      ?auto_79755 - BLOCK
      ?auto_79756 - BLOCK
    )
    :vars
    (
      ?auto_79758 - BLOCK
      ?auto_79757 - BLOCK
      ?auto_79759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79752 ?auto_79753 ) ) ( not ( = ?auto_79752 ?auto_79754 ) ) ( not ( = ?auto_79752 ?auto_79755 ) ) ( not ( = ?auto_79752 ?auto_79756 ) ) ( not ( = ?auto_79752 ?auto_79758 ) ) ( not ( = ?auto_79753 ?auto_79754 ) ) ( not ( = ?auto_79753 ?auto_79755 ) ) ( not ( = ?auto_79753 ?auto_79756 ) ) ( not ( = ?auto_79753 ?auto_79758 ) ) ( not ( = ?auto_79754 ?auto_79755 ) ) ( not ( = ?auto_79754 ?auto_79756 ) ) ( not ( = ?auto_79754 ?auto_79758 ) ) ( not ( = ?auto_79755 ?auto_79756 ) ) ( not ( = ?auto_79755 ?auto_79758 ) ) ( not ( = ?auto_79756 ?auto_79758 ) ) ( not ( = ?auto_79752 ?auto_79757 ) ) ( not ( = ?auto_79753 ?auto_79757 ) ) ( not ( = ?auto_79754 ?auto_79757 ) ) ( not ( = ?auto_79755 ?auto_79757 ) ) ( not ( = ?auto_79756 ?auto_79757 ) ) ( not ( = ?auto_79758 ?auto_79757 ) ) ( ON ?auto_79757 ?auto_79759 ) ( not ( = ?auto_79752 ?auto_79759 ) ) ( not ( = ?auto_79753 ?auto_79759 ) ) ( not ( = ?auto_79754 ?auto_79759 ) ) ( not ( = ?auto_79755 ?auto_79759 ) ) ( not ( = ?auto_79756 ?auto_79759 ) ) ( not ( = ?auto_79758 ?auto_79759 ) ) ( not ( = ?auto_79757 ?auto_79759 ) ) ( ON ?auto_79758 ?auto_79757 ) ( ON ?auto_79756 ?auto_79758 ) ( ON-TABLE ?auto_79759 ) ( ON ?auto_79755 ?auto_79756 ) ( ON ?auto_79754 ?auto_79755 ) ( ON ?auto_79753 ?auto_79754 ) ( ON ?auto_79752 ?auto_79753 ) ( CLEAR ?auto_79752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79759 ?auto_79757 ?auto_79758 ?auto_79756 ?auto_79755 ?auto_79754 ?auto_79753 )
      ( MAKE-5PILE ?auto_79752 ?auto_79753 ?auto_79754 ?auto_79755 ?auto_79756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79762 - BLOCK
      ?auto_79763 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79763 ) ( CLEAR ?auto_79762 ) ( ON-TABLE ?auto_79762 ) ( not ( = ?auto_79762 ?auto_79763 ) ) )
    :subtasks
    ( ( !STACK ?auto_79763 ?auto_79762 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79764 - BLOCK
      ?auto_79765 - BLOCK
    )
    :vars
    (
      ?auto_79766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79764 ) ( ON-TABLE ?auto_79764 ) ( not ( = ?auto_79764 ?auto_79765 ) ) ( ON ?auto_79765 ?auto_79766 ) ( CLEAR ?auto_79765 ) ( HAND-EMPTY ) ( not ( = ?auto_79764 ?auto_79766 ) ) ( not ( = ?auto_79765 ?auto_79766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79765 ?auto_79766 )
      ( MAKE-2PILE ?auto_79764 ?auto_79765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79767 - BLOCK
      ?auto_79768 - BLOCK
    )
    :vars
    (
      ?auto_79769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79767 ?auto_79768 ) ) ( ON ?auto_79768 ?auto_79769 ) ( CLEAR ?auto_79768 ) ( not ( = ?auto_79767 ?auto_79769 ) ) ( not ( = ?auto_79768 ?auto_79769 ) ) ( HOLDING ?auto_79767 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79767 )
      ( MAKE-2PILE ?auto_79767 ?auto_79768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79770 - BLOCK
      ?auto_79771 - BLOCK
    )
    :vars
    (
      ?auto_79772 - BLOCK
      ?auto_79773 - BLOCK
      ?auto_79774 - BLOCK
      ?auto_79776 - BLOCK
      ?auto_79775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79770 ?auto_79771 ) ) ( ON ?auto_79771 ?auto_79772 ) ( not ( = ?auto_79770 ?auto_79772 ) ) ( not ( = ?auto_79771 ?auto_79772 ) ) ( ON ?auto_79770 ?auto_79771 ) ( CLEAR ?auto_79770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79773 ) ( ON ?auto_79774 ?auto_79773 ) ( ON ?auto_79776 ?auto_79774 ) ( ON ?auto_79775 ?auto_79776 ) ( ON ?auto_79772 ?auto_79775 ) ( not ( = ?auto_79773 ?auto_79774 ) ) ( not ( = ?auto_79773 ?auto_79776 ) ) ( not ( = ?auto_79773 ?auto_79775 ) ) ( not ( = ?auto_79773 ?auto_79772 ) ) ( not ( = ?auto_79773 ?auto_79771 ) ) ( not ( = ?auto_79773 ?auto_79770 ) ) ( not ( = ?auto_79774 ?auto_79776 ) ) ( not ( = ?auto_79774 ?auto_79775 ) ) ( not ( = ?auto_79774 ?auto_79772 ) ) ( not ( = ?auto_79774 ?auto_79771 ) ) ( not ( = ?auto_79774 ?auto_79770 ) ) ( not ( = ?auto_79776 ?auto_79775 ) ) ( not ( = ?auto_79776 ?auto_79772 ) ) ( not ( = ?auto_79776 ?auto_79771 ) ) ( not ( = ?auto_79776 ?auto_79770 ) ) ( not ( = ?auto_79775 ?auto_79772 ) ) ( not ( = ?auto_79775 ?auto_79771 ) ) ( not ( = ?auto_79775 ?auto_79770 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79773 ?auto_79774 ?auto_79776 ?auto_79775 ?auto_79772 ?auto_79771 )
      ( MAKE-2PILE ?auto_79770 ?auto_79771 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79777 - BLOCK
      ?auto_79778 - BLOCK
    )
    :vars
    (
      ?auto_79780 - BLOCK
      ?auto_79779 - BLOCK
      ?auto_79782 - BLOCK
      ?auto_79783 - BLOCK
      ?auto_79781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79777 ?auto_79778 ) ) ( ON ?auto_79778 ?auto_79780 ) ( not ( = ?auto_79777 ?auto_79780 ) ) ( not ( = ?auto_79778 ?auto_79780 ) ) ( ON-TABLE ?auto_79779 ) ( ON ?auto_79782 ?auto_79779 ) ( ON ?auto_79783 ?auto_79782 ) ( ON ?auto_79781 ?auto_79783 ) ( ON ?auto_79780 ?auto_79781 ) ( not ( = ?auto_79779 ?auto_79782 ) ) ( not ( = ?auto_79779 ?auto_79783 ) ) ( not ( = ?auto_79779 ?auto_79781 ) ) ( not ( = ?auto_79779 ?auto_79780 ) ) ( not ( = ?auto_79779 ?auto_79778 ) ) ( not ( = ?auto_79779 ?auto_79777 ) ) ( not ( = ?auto_79782 ?auto_79783 ) ) ( not ( = ?auto_79782 ?auto_79781 ) ) ( not ( = ?auto_79782 ?auto_79780 ) ) ( not ( = ?auto_79782 ?auto_79778 ) ) ( not ( = ?auto_79782 ?auto_79777 ) ) ( not ( = ?auto_79783 ?auto_79781 ) ) ( not ( = ?auto_79783 ?auto_79780 ) ) ( not ( = ?auto_79783 ?auto_79778 ) ) ( not ( = ?auto_79783 ?auto_79777 ) ) ( not ( = ?auto_79781 ?auto_79780 ) ) ( not ( = ?auto_79781 ?auto_79778 ) ) ( not ( = ?auto_79781 ?auto_79777 ) ) ( HOLDING ?auto_79777 ) ( CLEAR ?auto_79778 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79779 ?auto_79782 ?auto_79783 ?auto_79781 ?auto_79780 ?auto_79778 ?auto_79777 )
      ( MAKE-2PILE ?auto_79777 ?auto_79778 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79784 - BLOCK
      ?auto_79785 - BLOCK
    )
    :vars
    (
      ?auto_79788 - BLOCK
      ?auto_79786 - BLOCK
      ?auto_79790 - BLOCK
      ?auto_79789 - BLOCK
      ?auto_79787 - BLOCK
      ?auto_79791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79784 ?auto_79785 ) ) ( ON ?auto_79785 ?auto_79788 ) ( not ( = ?auto_79784 ?auto_79788 ) ) ( not ( = ?auto_79785 ?auto_79788 ) ) ( ON-TABLE ?auto_79786 ) ( ON ?auto_79790 ?auto_79786 ) ( ON ?auto_79789 ?auto_79790 ) ( ON ?auto_79787 ?auto_79789 ) ( ON ?auto_79788 ?auto_79787 ) ( not ( = ?auto_79786 ?auto_79790 ) ) ( not ( = ?auto_79786 ?auto_79789 ) ) ( not ( = ?auto_79786 ?auto_79787 ) ) ( not ( = ?auto_79786 ?auto_79788 ) ) ( not ( = ?auto_79786 ?auto_79785 ) ) ( not ( = ?auto_79786 ?auto_79784 ) ) ( not ( = ?auto_79790 ?auto_79789 ) ) ( not ( = ?auto_79790 ?auto_79787 ) ) ( not ( = ?auto_79790 ?auto_79788 ) ) ( not ( = ?auto_79790 ?auto_79785 ) ) ( not ( = ?auto_79790 ?auto_79784 ) ) ( not ( = ?auto_79789 ?auto_79787 ) ) ( not ( = ?auto_79789 ?auto_79788 ) ) ( not ( = ?auto_79789 ?auto_79785 ) ) ( not ( = ?auto_79789 ?auto_79784 ) ) ( not ( = ?auto_79787 ?auto_79788 ) ) ( not ( = ?auto_79787 ?auto_79785 ) ) ( not ( = ?auto_79787 ?auto_79784 ) ) ( CLEAR ?auto_79785 ) ( ON ?auto_79784 ?auto_79791 ) ( CLEAR ?auto_79784 ) ( HAND-EMPTY ) ( not ( = ?auto_79784 ?auto_79791 ) ) ( not ( = ?auto_79785 ?auto_79791 ) ) ( not ( = ?auto_79788 ?auto_79791 ) ) ( not ( = ?auto_79786 ?auto_79791 ) ) ( not ( = ?auto_79790 ?auto_79791 ) ) ( not ( = ?auto_79789 ?auto_79791 ) ) ( not ( = ?auto_79787 ?auto_79791 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79784 ?auto_79791 )
      ( MAKE-2PILE ?auto_79784 ?auto_79785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79792 - BLOCK
      ?auto_79793 - BLOCK
    )
    :vars
    (
      ?auto_79798 - BLOCK
      ?auto_79795 - BLOCK
      ?auto_79794 - BLOCK
      ?auto_79796 - BLOCK
      ?auto_79797 - BLOCK
      ?auto_79799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79792 ?auto_79793 ) ) ( not ( = ?auto_79792 ?auto_79798 ) ) ( not ( = ?auto_79793 ?auto_79798 ) ) ( ON-TABLE ?auto_79795 ) ( ON ?auto_79794 ?auto_79795 ) ( ON ?auto_79796 ?auto_79794 ) ( ON ?auto_79797 ?auto_79796 ) ( ON ?auto_79798 ?auto_79797 ) ( not ( = ?auto_79795 ?auto_79794 ) ) ( not ( = ?auto_79795 ?auto_79796 ) ) ( not ( = ?auto_79795 ?auto_79797 ) ) ( not ( = ?auto_79795 ?auto_79798 ) ) ( not ( = ?auto_79795 ?auto_79793 ) ) ( not ( = ?auto_79795 ?auto_79792 ) ) ( not ( = ?auto_79794 ?auto_79796 ) ) ( not ( = ?auto_79794 ?auto_79797 ) ) ( not ( = ?auto_79794 ?auto_79798 ) ) ( not ( = ?auto_79794 ?auto_79793 ) ) ( not ( = ?auto_79794 ?auto_79792 ) ) ( not ( = ?auto_79796 ?auto_79797 ) ) ( not ( = ?auto_79796 ?auto_79798 ) ) ( not ( = ?auto_79796 ?auto_79793 ) ) ( not ( = ?auto_79796 ?auto_79792 ) ) ( not ( = ?auto_79797 ?auto_79798 ) ) ( not ( = ?auto_79797 ?auto_79793 ) ) ( not ( = ?auto_79797 ?auto_79792 ) ) ( ON ?auto_79792 ?auto_79799 ) ( CLEAR ?auto_79792 ) ( not ( = ?auto_79792 ?auto_79799 ) ) ( not ( = ?auto_79793 ?auto_79799 ) ) ( not ( = ?auto_79798 ?auto_79799 ) ) ( not ( = ?auto_79795 ?auto_79799 ) ) ( not ( = ?auto_79794 ?auto_79799 ) ) ( not ( = ?auto_79796 ?auto_79799 ) ) ( not ( = ?auto_79797 ?auto_79799 ) ) ( HOLDING ?auto_79793 ) ( CLEAR ?auto_79798 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79795 ?auto_79794 ?auto_79796 ?auto_79797 ?auto_79798 ?auto_79793 )
      ( MAKE-2PILE ?auto_79792 ?auto_79793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79800 - BLOCK
      ?auto_79801 - BLOCK
    )
    :vars
    (
      ?auto_79802 - BLOCK
      ?auto_79805 - BLOCK
      ?auto_79806 - BLOCK
      ?auto_79803 - BLOCK
      ?auto_79804 - BLOCK
      ?auto_79807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79800 ?auto_79801 ) ) ( not ( = ?auto_79800 ?auto_79802 ) ) ( not ( = ?auto_79801 ?auto_79802 ) ) ( ON-TABLE ?auto_79805 ) ( ON ?auto_79806 ?auto_79805 ) ( ON ?auto_79803 ?auto_79806 ) ( ON ?auto_79804 ?auto_79803 ) ( ON ?auto_79802 ?auto_79804 ) ( not ( = ?auto_79805 ?auto_79806 ) ) ( not ( = ?auto_79805 ?auto_79803 ) ) ( not ( = ?auto_79805 ?auto_79804 ) ) ( not ( = ?auto_79805 ?auto_79802 ) ) ( not ( = ?auto_79805 ?auto_79801 ) ) ( not ( = ?auto_79805 ?auto_79800 ) ) ( not ( = ?auto_79806 ?auto_79803 ) ) ( not ( = ?auto_79806 ?auto_79804 ) ) ( not ( = ?auto_79806 ?auto_79802 ) ) ( not ( = ?auto_79806 ?auto_79801 ) ) ( not ( = ?auto_79806 ?auto_79800 ) ) ( not ( = ?auto_79803 ?auto_79804 ) ) ( not ( = ?auto_79803 ?auto_79802 ) ) ( not ( = ?auto_79803 ?auto_79801 ) ) ( not ( = ?auto_79803 ?auto_79800 ) ) ( not ( = ?auto_79804 ?auto_79802 ) ) ( not ( = ?auto_79804 ?auto_79801 ) ) ( not ( = ?auto_79804 ?auto_79800 ) ) ( ON ?auto_79800 ?auto_79807 ) ( not ( = ?auto_79800 ?auto_79807 ) ) ( not ( = ?auto_79801 ?auto_79807 ) ) ( not ( = ?auto_79802 ?auto_79807 ) ) ( not ( = ?auto_79805 ?auto_79807 ) ) ( not ( = ?auto_79806 ?auto_79807 ) ) ( not ( = ?auto_79803 ?auto_79807 ) ) ( not ( = ?auto_79804 ?auto_79807 ) ) ( CLEAR ?auto_79802 ) ( ON ?auto_79801 ?auto_79800 ) ( CLEAR ?auto_79801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79807 ?auto_79800 )
      ( MAKE-2PILE ?auto_79800 ?auto_79801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79808 - BLOCK
      ?auto_79809 - BLOCK
    )
    :vars
    (
      ?auto_79810 - BLOCK
      ?auto_79812 - BLOCK
      ?auto_79813 - BLOCK
      ?auto_79814 - BLOCK
      ?auto_79815 - BLOCK
      ?auto_79811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79808 ?auto_79809 ) ) ( not ( = ?auto_79808 ?auto_79810 ) ) ( not ( = ?auto_79809 ?auto_79810 ) ) ( ON-TABLE ?auto_79812 ) ( ON ?auto_79813 ?auto_79812 ) ( ON ?auto_79814 ?auto_79813 ) ( ON ?auto_79815 ?auto_79814 ) ( not ( = ?auto_79812 ?auto_79813 ) ) ( not ( = ?auto_79812 ?auto_79814 ) ) ( not ( = ?auto_79812 ?auto_79815 ) ) ( not ( = ?auto_79812 ?auto_79810 ) ) ( not ( = ?auto_79812 ?auto_79809 ) ) ( not ( = ?auto_79812 ?auto_79808 ) ) ( not ( = ?auto_79813 ?auto_79814 ) ) ( not ( = ?auto_79813 ?auto_79815 ) ) ( not ( = ?auto_79813 ?auto_79810 ) ) ( not ( = ?auto_79813 ?auto_79809 ) ) ( not ( = ?auto_79813 ?auto_79808 ) ) ( not ( = ?auto_79814 ?auto_79815 ) ) ( not ( = ?auto_79814 ?auto_79810 ) ) ( not ( = ?auto_79814 ?auto_79809 ) ) ( not ( = ?auto_79814 ?auto_79808 ) ) ( not ( = ?auto_79815 ?auto_79810 ) ) ( not ( = ?auto_79815 ?auto_79809 ) ) ( not ( = ?auto_79815 ?auto_79808 ) ) ( ON ?auto_79808 ?auto_79811 ) ( not ( = ?auto_79808 ?auto_79811 ) ) ( not ( = ?auto_79809 ?auto_79811 ) ) ( not ( = ?auto_79810 ?auto_79811 ) ) ( not ( = ?auto_79812 ?auto_79811 ) ) ( not ( = ?auto_79813 ?auto_79811 ) ) ( not ( = ?auto_79814 ?auto_79811 ) ) ( not ( = ?auto_79815 ?auto_79811 ) ) ( ON ?auto_79809 ?auto_79808 ) ( CLEAR ?auto_79809 ) ( ON-TABLE ?auto_79811 ) ( HOLDING ?auto_79810 ) ( CLEAR ?auto_79815 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79812 ?auto_79813 ?auto_79814 ?auto_79815 ?auto_79810 )
      ( MAKE-2PILE ?auto_79808 ?auto_79809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79816 - BLOCK
      ?auto_79817 - BLOCK
    )
    :vars
    (
      ?auto_79822 - BLOCK
      ?auto_79819 - BLOCK
      ?auto_79823 - BLOCK
      ?auto_79818 - BLOCK
      ?auto_79821 - BLOCK
      ?auto_79820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79816 ?auto_79817 ) ) ( not ( = ?auto_79816 ?auto_79822 ) ) ( not ( = ?auto_79817 ?auto_79822 ) ) ( ON-TABLE ?auto_79819 ) ( ON ?auto_79823 ?auto_79819 ) ( ON ?auto_79818 ?auto_79823 ) ( ON ?auto_79821 ?auto_79818 ) ( not ( = ?auto_79819 ?auto_79823 ) ) ( not ( = ?auto_79819 ?auto_79818 ) ) ( not ( = ?auto_79819 ?auto_79821 ) ) ( not ( = ?auto_79819 ?auto_79822 ) ) ( not ( = ?auto_79819 ?auto_79817 ) ) ( not ( = ?auto_79819 ?auto_79816 ) ) ( not ( = ?auto_79823 ?auto_79818 ) ) ( not ( = ?auto_79823 ?auto_79821 ) ) ( not ( = ?auto_79823 ?auto_79822 ) ) ( not ( = ?auto_79823 ?auto_79817 ) ) ( not ( = ?auto_79823 ?auto_79816 ) ) ( not ( = ?auto_79818 ?auto_79821 ) ) ( not ( = ?auto_79818 ?auto_79822 ) ) ( not ( = ?auto_79818 ?auto_79817 ) ) ( not ( = ?auto_79818 ?auto_79816 ) ) ( not ( = ?auto_79821 ?auto_79822 ) ) ( not ( = ?auto_79821 ?auto_79817 ) ) ( not ( = ?auto_79821 ?auto_79816 ) ) ( ON ?auto_79816 ?auto_79820 ) ( not ( = ?auto_79816 ?auto_79820 ) ) ( not ( = ?auto_79817 ?auto_79820 ) ) ( not ( = ?auto_79822 ?auto_79820 ) ) ( not ( = ?auto_79819 ?auto_79820 ) ) ( not ( = ?auto_79823 ?auto_79820 ) ) ( not ( = ?auto_79818 ?auto_79820 ) ) ( not ( = ?auto_79821 ?auto_79820 ) ) ( ON ?auto_79817 ?auto_79816 ) ( ON-TABLE ?auto_79820 ) ( CLEAR ?auto_79821 ) ( ON ?auto_79822 ?auto_79817 ) ( CLEAR ?auto_79822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79820 ?auto_79816 ?auto_79817 )
      ( MAKE-2PILE ?auto_79816 ?auto_79817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79824 - BLOCK
      ?auto_79825 - BLOCK
    )
    :vars
    (
      ?auto_79830 - BLOCK
      ?auto_79826 - BLOCK
      ?auto_79831 - BLOCK
      ?auto_79827 - BLOCK
      ?auto_79829 - BLOCK
      ?auto_79828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79824 ?auto_79825 ) ) ( not ( = ?auto_79824 ?auto_79830 ) ) ( not ( = ?auto_79825 ?auto_79830 ) ) ( ON-TABLE ?auto_79826 ) ( ON ?auto_79831 ?auto_79826 ) ( ON ?auto_79827 ?auto_79831 ) ( not ( = ?auto_79826 ?auto_79831 ) ) ( not ( = ?auto_79826 ?auto_79827 ) ) ( not ( = ?auto_79826 ?auto_79829 ) ) ( not ( = ?auto_79826 ?auto_79830 ) ) ( not ( = ?auto_79826 ?auto_79825 ) ) ( not ( = ?auto_79826 ?auto_79824 ) ) ( not ( = ?auto_79831 ?auto_79827 ) ) ( not ( = ?auto_79831 ?auto_79829 ) ) ( not ( = ?auto_79831 ?auto_79830 ) ) ( not ( = ?auto_79831 ?auto_79825 ) ) ( not ( = ?auto_79831 ?auto_79824 ) ) ( not ( = ?auto_79827 ?auto_79829 ) ) ( not ( = ?auto_79827 ?auto_79830 ) ) ( not ( = ?auto_79827 ?auto_79825 ) ) ( not ( = ?auto_79827 ?auto_79824 ) ) ( not ( = ?auto_79829 ?auto_79830 ) ) ( not ( = ?auto_79829 ?auto_79825 ) ) ( not ( = ?auto_79829 ?auto_79824 ) ) ( ON ?auto_79824 ?auto_79828 ) ( not ( = ?auto_79824 ?auto_79828 ) ) ( not ( = ?auto_79825 ?auto_79828 ) ) ( not ( = ?auto_79830 ?auto_79828 ) ) ( not ( = ?auto_79826 ?auto_79828 ) ) ( not ( = ?auto_79831 ?auto_79828 ) ) ( not ( = ?auto_79827 ?auto_79828 ) ) ( not ( = ?auto_79829 ?auto_79828 ) ) ( ON ?auto_79825 ?auto_79824 ) ( ON-TABLE ?auto_79828 ) ( ON ?auto_79830 ?auto_79825 ) ( CLEAR ?auto_79830 ) ( HOLDING ?auto_79829 ) ( CLEAR ?auto_79827 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79826 ?auto_79831 ?auto_79827 ?auto_79829 )
      ( MAKE-2PILE ?auto_79824 ?auto_79825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79832 - BLOCK
      ?auto_79833 - BLOCK
    )
    :vars
    (
      ?auto_79834 - BLOCK
      ?auto_79835 - BLOCK
      ?auto_79838 - BLOCK
      ?auto_79837 - BLOCK
      ?auto_79839 - BLOCK
      ?auto_79836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79832 ?auto_79833 ) ) ( not ( = ?auto_79832 ?auto_79834 ) ) ( not ( = ?auto_79833 ?auto_79834 ) ) ( ON-TABLE ?auto_79835 ) ( ON ?auto_79838 ?auto_79835 ) ( ON ?auto_79837 ?auto_79838 ) ( not ( = ?auto_79835 ?auto_79838 ) ) ( not ( = ?auto_79835 ?auto_79837 ) ) ( not ( = ?auto_79835 ?auto_79839 ) ) ( not ( = ?auto_79835 ?auto_79834 ) ) ( not ( = ?auto_79835 ?auto_79833 ) ) ( not ( = ?auto_79835 ?auto_79832 ) ) ( not ( = ?auto_79838 ?auto_79837 ) ) ( not ( = ?auto_79838 ?auto_79839 ) ) ( not ( = ?auto_79838 ?auto_79834 ) ) ( not ( = ?auto_79838 ?auto_79833 ) ) ( not ( = ?auto_79838 ?auto_79832 ) ) ( not ( = ?auto_79837 ?auto_79839 ) ) ( not ( = ?auto_79837 ?auto_79834 ) ) ( not ( = ?auto_79837 ?auto_79833 ) ) ( not ( = ?auto_79837 ?auto_79832 ) ) ( not ( = ?auto_79839 ?auto_79834 ) ) ( not ( = ?auto_79839 ?auto_79833 ) ) ( not ( = ?auto_79839 ?auto_79832 ) ) ( ON ?auto_79832 ?auto_79836 ) ( not ( = ?auto_79832 ?auto_79836 ) ) ( not ( = ?auto_79833 ?auto_79836 ) ) ( not ( = ?auto_79834 ?auto_79836 ) ) ( not ( = ?auto_79835 ?auto_79836 ) ) ( not ( = ?auto_79838 ?auto_79836 ) ) ( not ( = ?auto_79837 ?auto_79836 ) ) ( not ( = ?auto_79839 ?auto_79836 ) ) ( ON ?auto_79833 ?auto_79832 ) ( ON-TABLE ?auto_79836 ) ( ON ?auto_79834 ?auto_79833 ) ( CLEAR ?auto_79837 ) ( ON ?auto_79839 ?auto_79834 ) ( CLEAR ?auto_79839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79836 ?auto_79832 ?auto_79833 ?auto_79834 )
      ( MAKE-2PILE ?auto_79832 ?auto_79833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79840 - BLOCK
      ?auto_79841 - BLOCK
    )
    :vars
    (
      ?auto_79845 - BLOCK
      ?auto_79844 - BLOCK
      ?auto_79842 - BLOCK
      ?auto_79843 - BLOCK
      ?auto_79847 - BLOCK
      ?auto_79846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79840 ?auto_79841 ) ) ( not ( = ?auto_79840 ?auto_79845 ) ) ( not ( = ?auto_79841 ?auto_79845 ) ) ( ON-TABLE ?auto_79844 ) ( ON ?auto_79842 ?auto_79844 ) ( not ( = ?auto_79844 ?auto_79842 ) ) ( not ( = ?auto_79844 ?auto_79843 ) ) ( not ( = ?auto_79844 ?auto_79847 ) ) ( not ( = ?auto_79844 ?auto_79845 ) ) ( not ( = ?auto_79844 ?auto_79841 ) ) ( not ( = ?auto_79844 ?auto_79840 ) ) ( not ( = ?auto_79842 ?auto_79843 ) ) ( not ( = ?auto_79842 ?auto_79847 ) ) ( not ( = ?auto_79842 ?auto_79845 ) ) ( not ( = ?auto_79842 ?auto_79841 ) ) ( not ( = ?auto_79842 ?auto_79840 ) ) ( not ( = ?auto_79843 ?auto_79847 ) ) ( not ( = ?auto_79843 ?auto_79845 ) ) ( not ( = ?auto_79843 ?auto_79841 ) ) ( not ( = ?auto_79843 ?auto_79840 ) ) ( not ( = ?auto_79847 ?auto_79845 ) ) ( not ( = ?auto_79847 ?auto_79841 ) ) ( not ( = ?auto_79847 ?auto_79840 ) ) ( ON ?auto_79840 ?auto_79846 ) ( not ( = ?auto_79840 ?auto_79846 ) ) ( not ( = ?auto_79841 ?auto_79846 ) ) ( not ( = ?auto_79845 ?auto_79846 ) ) ( not ( = ?auto_79844 ?auto_79846 ) ) ( not ( = ?auto_79842 ?auto_79846 ) ) ( not ( = ?auto_79843 ?auto_79846 ) ) ( not ( = ?auto_79847 ?auto_79846 ) ) ( ON ?auto_79841 ?auto_79840 ) ( ON-TABLE ?auto_79846 ) ( ON ?auto_79845 ?auto_79841 ) ( ON ?auto_79847 ?auto_79845 ) ( CLEAR ?auto_79847 ) ( HOLDING ?auto_79843 ) ( CLEAR ?auto_79842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79844 ?auto_79842 ?auto_79843 )
      ( MAKE-2PILE ?auto_79840 ?auto_79841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79848 - BLOCK
      ?auto_79849 - BLOCK
    )
    :vars
    (
      ?auto_79850 - BLOCK
      ?auto_79851 - BLOCK
      ?auto_79852 - BLOCK
      ?auto_79853 - BLOCK
      ?auto_79855 - BLOCK
      ?auto_79854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79848 ?auto_79849 ) ) ( not ( = ?auto_79848 ?auto_79850 ) ) ( not ( = ?auto_79849 ?auto_79850 ) ) ( ON-TABLE ?auto_79851 ) ( ON ?auto_79852 ?auto_79851 ) ( not ( = ?auto_79851 ?auto_79852 ) ) ( not ( = ?auto_79851 ?auto_79853 ) ) ( not ( = ?auto_79851 ?auto_79855 ) ) ( not ( = ?auto_79851 ?auto_79850 ) ) ( not ( = ?auto_79851 ?auto_79849 ) ) ( not ( = ?auto_79851 ?auto_79848 ) ) ( not ( = ?auto_79852 ?auto_79853 ) ) ( not ( = ?auto_79852 ?auto_79855 ) ) ( not ( = ?auto_79852 ?auto_79850 ) ) ( not ( = ?auto_79852 ?auto_79849 ) ) ( not ( = ?auto_79852 ?auto_79848 ) ) ( not ( = ?auto_79853 ?auto_79855 ) ) ( not ( = ?auto_79853 ?auto_79850 ) ) ( not ( = ?auto_79853 ?auto_79849 ) ) ( not ( = ?auto_79853 ?auto_79848 ) ) ( not ( = ?auto_79855 ?auto_79850 ) ) ( not ( = ?auto_79855 ?auto_79849 ) ) ( not ( = ?auto_79855 ?auto_79848 ) ) ( ON ?auto_79848 ?auto_79854 ) ( not ( = ?auto_79848 ?auto_79854 ) ) ( not ( = ?auto_79849 ?auto_79854 ) ) ( not ( = ?auto_79850 ?auto_79854 ) ) ( not ( = ?auto_79851 ?auto_79854 ) ) ( not ( = ?auto_79852 ?auto_79854 ) ) ( not ( = ?auto_79853 ?auto_79854 ) ) ( not ( = ?auto_79855 ?auto_79854 ) ) ( ON ?auto_79849 ?auto_79848 ) ( ON-TABLE ?auto_79854 ) ( ON ?auto_79850 ?auto_79849 ) ( ON ?auto_79855 ?auto_79850 ) ( CLEAR ?auto_79852 ) ( ON ?auto_79853 ?auto_79855 ) ( CLEAR ?auto_79853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79854 ?auto_79848 ?auto_79849 ?auto_79850 ?auto_79855 )
      ( MAKE-2PILE ?auto_79848 ?auto_79849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79856 - BLOCK
      ?auto_79857 - BLOCK
    )
    :vars
    (
      ?auto_79863 - BLOCK
      ?auto_79861 - BLOCK
      ?auto_79860 - BLOCK
      ?auto_79859 - BLOCK
      ?auto_79862 - BLOCK
      ?auto_79858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79856 ?auto_79857 ) ) ( not ( = ?auto_79856 ?auto_79863 ) ) ( not ( = ?auto_79857 ?auto_79863 ) ) ( ON-TABLE ?auto_79861 ) ( not ( = ?auto_79861 ?auto_79860 ) ) ( not ( = ?auto_79861 ?auto_79859 ) ) ( not ( = ?auto_79861 ?auto_79862 ) ) ( not ( = ?auto_79861 ?auto_79863 ) ) ( not ( = ?auto_79861 ?auto_79857 ) ) ( not ( = ?auto_79861 ?auto_79856 ) ) ( not ( = ?auto_79860 ?auto_79859 ) ) ( not ( = ?auto_79860 ?auto_79862 ) ) ( not ( = ?auto_79860 ?auto_79863 ) ) ( not ( = ?auto_79860 ?auto_79857 ) ) ( not ( = ?auto_79860 ?auto_79856 ) ) ( not ( = ?auto_79859 ?auto_79862 ) ) ( not ( = ?auto_79859 ?auto_79863 ) ) ( not ( = ?auto_79859 ?auto_79857 ) ) ( not ( = ?auto_79859 ?auto_79856 ) ) ( not ( = ?auto_79862 ?auto_79863 ) ) ( not ( = ?auto_79862 ?auto_79857 ) ) ( not ( = ?auto_79862 ?auto_79856 ) ) ( ON ?auto_79856 ?auto_79858 ) ( not ( = ?auto_79856 ?auto_79858 ) ) ( not ( = ?auto_79857 ?auto_79858 ) ) ( not ( = ?auto_79863 ?auto_79858 ) ) ( not ( = ?auto_79861 ?auto_79858 ) ) ( not ( = ?auto_79860 ?auto_79858 ) ) ( not ( = ?auto_79859 ?auto_79858 ) ) ( not ( = ?auto_79862 ?auto_79858 ) ) ( ON ?auto_79857 ?auto_79856 ) ( ON-TABLE ?auto_79858 ) ( ON ?auto_79863 ?auto_79857 ) ( ON ?auto_79862 ?auto_79863 ) ( ON ?auto_79859 ?auto_79862 ) ( CLEAR ?auto_79859 ) ( HOLDING ?auto_79860 ) ( CLEAR ?auto_79861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79861 ?auto_79860 )
      ( MAKE-2PILE ?auto_79856 ?auto_79857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79864 - BLOCK
      ?auto_79865 - BLOCK
    )
    :vars
    (
      ?auto_79870 - BLOCK
      ?auto_79869 - BLOCK
      ?auto_79871 - BLOCK
      ?auto_79867 - BLOCK
      ?auto_79866 - BLOCK
      ?auto_79868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79864 ?auto_79865 ) ) ( not ( = ?auto_79864 ?auto_79870 ) ) ( not ( = ?auto_79865 ?auto_79870 ) ) ( ON-TABLE ?auto_79869 ) ( not ( = ?auto_79869 ?auto_79871 ) ) ( not ( = ?auto_79869 ?auto_79867 ) ) ( not ( = ?auto_79869 ?auto_79866 ) ) ( not ( = ?auto_79869 ?auto_79870 ) ) ( not ( = ?auto_79869 ?auto_79865 ) ) ( not ( = ?auto_79869 ?auto_79864 ) ) ( not ( = ?auto_79871 ?auto_79867 ) ) ( not ( = ?auto_79871 ?auto_79866 ) ) ( not ( = ?auto_79871 ?auto_79870 ) ) ( not ( = ?auto_79871 ?auto_79865 ) ) ( not ( = ?auto_79871 ?auto_79864 ) ) ( not ( = ?auto_79867 ?auto_79866 ) ) ( not ( = ?auto_79867 ?auto_79870 ) ) ( not ( = ?auto_79867 ?auto_79865 ) ) ( not ( = ?auto_79867 ?auto_79864 ) ) ( not ( = ?auto_79866 ?auto_79870 ) ) ( not ( = ?auto_79866 ?auto_79865 ) ) ( not ( = ?auto_79866 ?auto_79864 ) ) ( ON ?auto_79864 ?auto_79868 ) ( not ( = ?auto_79864 ?auto_79868 ) ) ( not ( = ?auto_79865 ?auto_79868 ) ) ( not ( = ?auto_79870 ?auto_79868 ) ) ( not ( = ?auto_79869 ?auto_79868 ) ) ( not ( = ?auto_79871 ?auto_79868 ) ) ( not ( = ?auto_79867 ?auto_79868 ) ) ( not ( = ?auto_79866 ?auto_79868 ) ) ( ON ?auto_79865 ?auto_79864 ) ( ON-TABLE ?auto_79868 ) ( ON ?auto_79870 ?auto_79865 ) ( ON ?auto_79866 ?auto_79870 ) ( ON ?auto_79867 ?auto_79866 ) ( CLEAR ?auto_79869 ) ( ON ?auto_79871 ?auto_79867 ) ( CLEAR ?auto_79871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79868 ?auto_79864 ?auto_79865 ?auto_79870 ?auto_79866 ?auto_79867 )
      ( MAKE-2PILE ?auto_79864 ?auto_79865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79872 - BLOCK
      ?auto_79873 - BLOCK
    )
    :vars
    (
      ?auto_79879 - BLOCK
      ?auto_79878 - BLOCK
      ?auto_79877 - BLOCK
      ?auto_79875 - BLOCK
      ?auto_79874 - BLOCK
      ?auto_79876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79872 ?auto_79873 ) ) ( not ( = ?auto_79872 ?auto_79879 ) ) ( not ( = ?auto_79873 ?auto_79879 ) ) ( not ( = ?auto_79878 ?auto_79877 ) ) ( not ( = ?auto_79878 ?auto_79875 ) ) ( not ( = ?auto_79878 ?auto_79874 ) ) ( not ( = ?auto_79878 ?auto_79879 ) ) ( not ( = ?auto_79878 ?auto_79873 ) ) ( not ( = ?auto_79878 ?auto_79872 ) ) ( not ( = ?auto_79877 ?auto_79875 ) ) ( not ( = ?auto_79877 ?auto_79874 ) ) ( not ( = ?auto_79877 ?auto_79879 ) ) ( not ( = ?auto_79877 ?auto_79873 ) ) ( not ( = ?auto_79877 ?auto_79872 ) ) ( not ( = ?auto_79875 ?auto_79874 ) ) ( not ( = ?auto_79875 ?auto_79879 ) ) ( not ( = ?auto_79875 ?auto_79873 ) ) ( not ( = ?auto_79875 ?auto_79872 ) ) ( not ( = ?auto_79874 ?auto_79879 ) ) ( not ( = ?auto_79874 ?auto_79873 ) ) ( not ( = ?auto_79874 ?auto_79872 ) ) ( ON ?auto_79872 ?auto_79876 ) ( not ( = ?auto_79872 ?auto_79876 ) ) ( not ( = ?auto_79873 ?auto_79876 ) ) ( not ( = ?auto_79879 ?auto_79876 ) ) ( not ( = ?auto_79878 ?auto_79876 ) ) ( not ( = ?auto_79877 ?auto_79876 ) ) ( not ( = ?auto_79875 ?auto_79876 ) ) ( not ( = ?auto_79874 ?auto_79876 ) ) ( ON ?auto_79873 ?auto_79872 ) ( ON-TABLE ?auto_79876 ) ( ON ?auto_79879 ?auto_79873 ) ( ON ?auto_79874 ?auto_79879 ) ( ON ?auto_79875 ?auto_79874 ) ( ON ?auto_79877 ?auto_79875 ) ( CLEAR ?auto_79877 ) ( HOLDING ?auto_79878 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79878 )
      ( MAKE-2PILE ?auto_79872 ?auto_79873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79880 - BLOCK
      ?auto_79881 - BLOCK
    )
    :vars
    (
      ?auto_79882 - BLOCK
      ?auto_79887 - BLOCK
      ?auto_79886 - BLOCK
      ?auto_79885 - BLOCK
      ?auto_79884 - BLOCK
      ?auto_79883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79880 ?auto_79881 ) ) ( not ( = ?auto_79880 ?auto_79882 ) ) ( not ( = ?auto_79881 ?auto_79882 ) ) ( not ( = ?auto_79887 ?auto_79886 ) ) ( not ( = ?auto_79887 ?auto_79885 ) ) ( not ( = ?auto_79887 ?auto_79884 ) ) ( not ( = ?auto_79887 ?auto_79882 ) ) ( not ( = ?auto_79887 ?auto_79881 ) ) ( not ( = ?auto_79887 ?auto_79880 ) ) ( not ( = ?auto_79886 ?auto_79885 ) ) ( not ( = ?auto_79886 ?auto_79884 ) ) ( not ( = ?auto_79886 ?auto_79882 ) ) ( not ( = ?auto_79886 ?auto_79881 ) ) ( not ( = ?auto_79886 ?auto_79880 ) ) ( not ( = ?auto_79885 ?auto_79884 ) ) ( not ( = ?auto_79885 ?auto_79882 ) ) ( not ( = ?auto_79885 ?auto_79881 ) ) ( not ( = ?auto_79885 ?auto_79880 ) ) ( not ( = ?auto_79884 ?auto_79882 ) ) ( not ( = ?auto_79884 ?auto_79881 ) ) ( not ( = ?auto_79884 ?auto_79880 ) ) ( ON ?auto_79880 ?auto_79883 ) ( not ( = ?auto_79880 ?auto_79883 ) ) ( not ( = ?auto_79881 ?auto_79883 ) ) ( not ( = ?auto_79882 ?auto_79883 ) ) ( not ( = ?auto_79887 ?auto_79883 ) ) ( not ( = ?auto_79886 ?auto_79883 ) ) ( not ( = ?auto_79885 ?auto_79883 ) ) ( not ( = ?auto_79884 ?auto_79883 ) ) ( ON ?auto_79881 ?auto_79880 ) ( ON-TABLE ?auto_79883 ) ( ON ?auto_79882 ?auto_79881 ) ( ON ?auto_79884 ?auto_79882 ) ( ON ?auto_79885 ?auto_79884 ) ( ON ?auto_79886 ?auto_79885 ) ( ON ?auto_79887 ?auto_79886 ) ( CLEAR ?auto_79887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79883 ?auto_79880 ?auto_79881 ?auto_79882 ?auto_79884 ?auto_79885 ?auto_79886 )
      ( MAKE-2PILE ?auto_79880 ?auto_79881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79892 - BLOCK
      ?auto_79893 - BLOCK
      ?auto_79894 - BLOCK
      ?auto_79895 - BLOCK
    )
    :vars
    (
      ?auto_79896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79896 ?auto_79895 ) ( CLEAR ?auto_79896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79892 ) ( ON ?auto_79893 ?auto_79892 ) ( ON ?auto_79894 ?auto_79893 ) ( ON ?auto_79895 ?auto_79894 ) ( not ( = ?auto_79892 ?auto_79893 ) ) ( not ( = ?auto_79892 ?auto_79894 ) ) ( not ( = ?auto_79892 ?auto_79895 ) ) ( not ( = ?auto_79892 ?auto_79896 ) ) ( not ( = ?auto_79893 ?auto_79894 ) ) ( not ( = ?auto_79893 ?auto_79895 ) ) ( not ( = ?auto_79893 ?auto_79896 ) ) ( not ( = ?auto_79894 ?auto_79895 ) ) ( not ( = ?auto_79894 ?auto_79896 ) ) ( not ( = ?auto_79895 ?auto_79896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79896 ?auto_79895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79897 - BLOCK
      ?auto_79898 - BLOCK
      ?auto_79899 - BLOCK
      ?auto_79900 - BLOCK
    )
    :vars
    (
      ?auto_79901 - BLOCK
      ?auto_79902 - BLOCK
      ?auto_79903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79901 ?auto_79900 ) ( CLEAR ?auto_79901 ) ( ON-TABLE ?auto_79897 ) ( ON ?auto_79898 ?auto_79897 ) ( ON ?auto_79899 ?auto_79898 ) ( ON ?auto_79900 ?auto_79899 ) ( not ( = ?auto_79897 ?auto_79898 ) ) ( not ( = ?auto_79897 ?auto_79899 ) ) ( not ( = ?auto_79897 ?auto_79900 ) ) ( not ( = ?auto_79897 ?auto_79901 ) ) ( not ( = ?auto_79898 ?auto_79899 ) ) ( not ( = ?auto_79898 ?auto_79900 ) ) ( not ( = ?auto_79898 ?auto_79901 ) ) ( not ( = ?auto_79899 ?auto_79900 ) ) ( not ( = ?auto_79899 ?auto_79901 ) ) ( not ( = ?auto_79900 ?auto_79901 ) ) ( HOLDING ?auto_79902 ) ( CLEAR ?auto_79903 ) ( not ( = ?auto_79897 ?auto_79902 ) ) ( not ( = ?auto_79897 ?auto_79903 ) ) ( not ( = ?auto_79898 ?auto_79902 ) ) ( not ( = ?auto_79898 ?auto_79903 ) ) ( not ( = ?auto_79899 ?auto_79902 ) ) ( not ( = ?auto_79899 ?auto_79903 ) ) ( not ( = ?auto_79900 ?auto_79902 ) ) ( not ( = ?auto_79900 ?auto_79903 ) ) ( not ( = ?auto_79901 ?auto_79902 ) ) ( not ( = ?auto_79901 ?auto_79903 ) ) ( not ( = ?auto_79902 ?auto_79903 ) ) )
    :subtasks
    ( ( !STACK ?auto_79902 ?auto_79903 )
      ( MAKE-4PILE ?auto_79897 ?auto_79898 ?auto_79899 ?auto_79900 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79904 - BLOCK
      ?auto_79905 - BLOCK
      ?auto_79906 - BLOCK
      ?auto_79907 - BLOCK
    )
    :vars
    (
      ?auto_79908 - BLOCK
      ?auto_79909 - BLOCK
      ?auto_79910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79908 ?auto_79907 ) ( ON-TABLE ?auto_79904 ) ( ON ?auto_79905 ?auto_79904 ) ( ON ?auto_79906 ?auto_79905 ) ( ON ?auto_79907 ?auto_79906 ) ( not ( = ?auto_79904 ?auto_79905 ) ) ( not ( = ?auto_79904 ?auto_79906 ) ) ( not ( = ?auto_79904 ?auto_79907 ) ) ( not ( = ?auto_79904 ?auto_79908 ) ) ( not ( = ?auto_79905 ?auto_79906 ) ) ( not ( = ?auto_79905 ?auto_79907 ) ) ( not ( = ?auto_79905 ?auto_79908 ) ) ( not ( = ?auto_79906 ?auto_79907 ) ) ( not ( = ?auto_79906 ?auto_79908 ) ) ( not ( = ?auto_79907 ?auto_79908 ) ) ( CLEAR ?auto_79909 ) ( not ( = ?auto_79904 ?auto_79910 ) ) ( not ( = ?auto_79904 ?auto_79909 ) ) ( not ( = ?auto_79905 ?auto_79910 ) ) ( not ( = ?auto_79905 ?auto_79909 ) ) ( not ( = ?auto_79906 ?auto_79910 ) ) ( not ( = ?auto_79906 ?auto_79909 ) ) ( not ( = ?auto_79907 ?auto_79910 ) ) ( not ( = ?auto_79907 ?auto_79909 ) ) ( not ( = ?auto_79908 ?auto_79910 ) ) ( not ( = ?auto_79908 ?auto_79909 ) ) ( not ( = ?auto_79910 ?auto_79909 ) ) ( ON ?auto_79910 ?auto_79908 ) ( CLEAR ?auto_79910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79904 ?auto_79905 ?auto_79906 ?auto_79907 ?auto_79908 )
      ( MAKE-4PILE ?auto_79904 ?auto_79905 ?auto_79906 ?auto_79907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79911 - BLOCK
      ?auto_79912 - BLOCK
      ?auto_79913 - BLOCK
      ?auto_79914 - BLOCK
    )
    :vars
    (
      ?auto_79917 - BLOCK
      ?auto_79915 - BLOCK
      ?auto_79916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79917 ?auto_79914 ) ( ON-TABLE ?auto_79911 ) ( ON ?auto_79912 ?auto_79911 ) ( ON ?auto_79913 ?auto_79912 ) ( ON ?auto_79914 ?auto_79913 ) ( not ( = ?auto_79911 ?auto_79912 ) ) ( not ( = ?auto_79911 ?auto_79913 ) ) ( not ( = ?auto_79911 ?auto_79914 ) ) ( not ( = ?auto_79911 ?auto_79917 ) ) ( not ( = ?auto_79912 ?auto_79913 ) ) ( not ( = ?auto_79912 ?auto_79914 ) ) ( not ( = ?auto_79912 ?auto_79917 ) ) ( not ( = ?auto_79913 ?auto_79914 ) ) ( not ( = ?auto_79913 ?auto_79917 ) ) ( not ( = ?auto_79914 ?auto_79917 ) ) ( not ( = ?auto_79911 ?auto_79915 ) ) ( not ( = ?auto_79911 ?auto_79916 ) ) ( not ( = ?auto_79912 ?auto_79915 ) ) ( not ( = ?auto_79912 ?auto_79916 ) ) ( not ( = ?auto_79913 ?auto_79915 ) ) ( not ( = ?auto_79913 ?auto_79916 ) ) ( not ( = ?auto_79914 ?auto_79915 ) ) ( not ( = ?auto_79914 ?auto_79916 ) ) ( not ( = ?auto_79917 ?auto_79915 ) ) ( not ( = ?auto_79917 ?auto_79916 ) ) ( not ( = ?auto_79915 ?auto_79916 ) ) ( ON ?auto_79915 ?auto_79917 ) ( CLEAR ?auto_79915 ) ( HOLDING ?auto_79916 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79916 )
      ( MAKE-4PILE ?auto_79911 ?auto_79912 ?auto_79913 ?auto_79914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79918 - BLOCK
      ?auto_79919 - BLOCK
      ?auto_79920 - BLOCK
      ?auto_79921 - BLOCK
    )
    :vars
    (
      ?auto_79923 - BLOCK
      ?auto_79922 - BLOCK
      ?auto_79924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79923 ?auto_79921 ) ( ON-TABLE ?auto_79918 ) ( ON ?auto_79919 ?auto_79918 ) ( ON ?auto_79920 ?auto_79919 ) ( ON ?auto_79921 ?auto_79920 ) ( not ( = ?auto_79918 ?auto_79919 ) ) ( not ( = ?auto_79918 ?auto_79920 ) ) ( not ( = ?auto_79918 ?auto_79921 ) ) ( not ( = ?auto_79918 ?auto_79923 ) ) ( not ( = ?auto_79919 ?auto_79920 ) ) ( not ( = ?auto_79919 ?auto_79921 ) ) ( not ( = ?auto_79919 ?auto_79923 ) ) ( not ( = ?auto_79920 ?auto_79921 ) ) ( not ( = ?auto_79920 ?auto_79923 ) ) ( not ( = ?auto_79921 ?auto_79923 ) ) ( not ( = ?auto_79918 ?auto_79922 ) ) ( not ( = ?auto_79918 ?auto_79924 ) ) ( not ( = ?auto_79919 ?auto_79922 ) ) ( not ( = ?auto_79919 ?auto_79924 ) ) ( not ( = ?auto_79920 ?auto_79922 ) ) ( not ( = ?auto_79920 ?auto_79924 ) ) ( not ( = ?auto_79921 ?auto_79922 ) ) ( not ( = ?auto_79921 ?auto_79924 ) ) ( not ( = ?auto_79923 ?auto_79922 ) ) ( not ( = ?auto_79923 ?auto_79924 ) ) ( not ( = ?auto_79922 ?auto_79924 ) ) ( ON ?auto_79922 ?auto_79923 ) ( ON ?auto_79924 ?auto_79922 ) ( CLEAR ?auto_79924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79918 ?auto_79919 ?auto_79920 ?auto_79921 ?auto_79923 ?auto_79922 )
      ( MAKE-4PILE ?auto_79918 ?auto_79919 ?auto_79920 ?auto_79921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79925 - BLOCK
      ?auto_79926 - BLOCK
      ?auto_79927 - BLOCK
      ?auto_79928 - BLOCK
    )
    :vars
    (
      ?auto_79931 - BLOCK
      ?auto_79929 - BLOCK
      ?auto_79930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79931 ?auto_79928 ) ( ON-TABLE ?auto_79925 ) ( ON ?auto_79926 ?auto_79925 ) ( ON ?auto_79927 ?auto_79926 ) ( ON ?auto_79928 ?auto_79927 ) ( not ( = ?auto_79925 ?auto_79926 ) ) ( not ( = ?auto_79925 ?auto_79927 ) ) ( not ( = ?auto_79925 ?auto_79928 ) ) ( not ( = ?auto_79925 ?auto_79931 ) ) ( not ( = ?auto_79926 ?auto_79927 ) ) ( not ( = ?auto_79926 ?auto_79928 ) ) ( not ( = ?auto_79926 ?auto_79931 ) ) ( not ( = ?auto_79927 ?auto_79928 ) ) ( not ( = ?auto_79927 ?auto_79931 ) ) ( not ( = ?auto_79928 ?auto_79931 ) ) ( not ( = ?auto_79925 ?auto_79929 ) ) ( not ( = ?auto_79925 ?auto_79930 ) ) ( not ( = ?auto_79926 ?auto_79929 ) ) ( not ( = ?auto_79926 ?auto_79930 ) ) ( not ( = ?auto_79927 ?auto_79929 ) ) ( not ( = ?auto_79927 ?auto_79930 ) ) ( not ( = ?auto_79928 ?auto_79929 ) ) ( not ( = ?auto_79928 ?auto_79930 ) ) ( not ( = ?auto_79931 ?auto_79929 ) ) ( not ( = ?auto_79931 ?auto_79930 ) ) ( not ( = ?auto_79929 ?auto_79930 ) ) ( ON ?auto_79929 ?auto_79931 ) ( HOLDING ?auto_79930 ) ( CLEAR ?auto_79929 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79925 ?auto_79926 ?auto_79927 ?auto_79928 ?auto_79931 ?auto_79929 ?auto_79930 )
      ( MAKE-4PILE ?auto_79925 ?auto_79926 ?auto_79927 ?auto_79928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79932 - BLOCK
      ?auto_79933 - BLOCK
      ?auto_79934 - BLOCK
      ?auto_79935 - BLOCK
    )
    :vars
    (
      ?auto_79938 - BLOCK
      ?auto_79937 - BLOCK
      ?auto_79936 - BLOCK
      ?auto_79939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79938 ?auto_79935 ) ( ON-TABLE ?auto_79932 ) ( ON ?auto_79933 ?auto_79932 ) ( ON ?auto_79934 ?auto_79933 ) ( ON ?auto_79935 ?auto_79934 ) ( not ( = ?auto_79932 ?auto_79933 ) ) ( not ( = ?auto_79932 ?auto_79934 ) ) ( not ( = ?auto_79932 ?auto_79935 ) ) ( not ( = ?auto_79932 ?auto_79938 ) ) ( not ( = ?auto_79933 ?auto_79934 ) ) ( not ( = ?auto_79933 ?auto_79935 ) ) ( not ( = ?auto_79933 ?auto_79938 ) ) ( not ( = ?auto_79934 ?auto_79935 ) ) ( not ( = ?auto_79934 ?auto_79938 ) ) ( not ( = ?auto_79935 ?auto_79938 ) ) ( not ( = ?auto_79932 ?auto_79937 ) ) ( not ( = ?auto_79932 ?auto_79936 ) ) ( not ( = ?auto_79933 ?auto_79937 ) ) ( not ( = ?auto_79933 ?auto_79936 ) ) ( not ( = ?auto_79934 ?auto_79937 ) ) ( not ( = ?auto_79934 ?auto_79936 ) ) ( not ( = ?auto_79935 ?auto_79937 ) ) ( not ( = ?auto_79935 ?auto_79936 ) ) ( not ( = ?auto_79938 ?auto_79937 ) ) ( not ( = ?auto_79938 ?auto_79936 ) ) ( not ( = ?auto_79937 ?auto_79936 ) ) ( ON ?auto_79937 ?auto_79938 ) ( CLEAR ?auto_79937 ) ( ON ?auto_79936 ?auto_79939 ) ( CLEAR ?auto_79936 ) ( HAND-EMPTY ) ( not ( = ?auto_79932 ?auto_79939 ) ) ( not ( = ?auto_79933 ?auto_79939 ) ) ( not ( = ?auto_79934 ?auto_79939 ) ) ( not ( = ?auto_79935 ?auto_79939 ) ) ( not ( = ?auto_79938 ?auto_79939 ) ) ( not ( = ?auto_79937 ?auto_79939 ) ) ( not ( = ?auto_79936 ?auto_79939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79936 ?auto_79939 )
      ( MAKE-4PILE ?auto_79932 ?auto_79933 ?auto_79934 ?auto_79935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79940 - BLOCK
      ?auto_79941 - BLOCK
      ?auto_79942 - BLOCK
      ?auto_79943 - BLOCK
    )
    :vars
    (
      ?auto_79944 - BLOCK
      ?auto_79946 - BLOCK
      ?auto_79947 - BLOCK
      ?auto_79945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79944 ?auto_79943 ) ( ON-TABLE ?auto_79940 ) ( ON ?auto_79941 ?auto_79940 ) ( ON ?auto_79942 ?auto_79941 ) ( ON ?auto_79943 ?auto_79942 ) ( not ( = ?auto_79940 ?auto_79941 ) ) ( not ( = ?auto_79940 ?auto_79942 ) ) ( not ( = ?auto_79940 ?auto_79943 ) ) ( not ( = ?auto_79940 ?auto_79944 ) ) ( not ( = ?auto_79941 ?auto_79942 ) ) ( not ( = ?auto_79941 ?auto_79943 ) ) ( not ( = ?auto_79941 ?auto_79944 ) ) ( not ( = ?auto_79942 ?auto_79943 ) ) ( not ( = ?auto_79942 ?auto_79944 ) ) ( not ( = ?auto_79943 ?auto_79944 ) ) ( not ( = ?auto_79940 ?auto_79946 ) ) ( not ( = ?auto_79940 ?auto_79947 ) ) ( not ( = ?auto_79941 ?auto_79946 ) ) ( not ( = ?auto_79941 ?auto_79947 ) ) ( not ( = ?auto_79942 ?auto_79946 ) ) ( not ( = ?auto_79942 ?auto_79947 ) ) ( not ( = ?auto_79943 ?auto_79946 ) ) ( not ( = ?auto_79943 ?auto_79947 ) ) ( not ( = ?auto_79944 ?auto_79946 ) ) ( not ( = ?auto_79944 ?auto_79947 ) ) ( not ( = ?auto_79946 ?auto_79947 ) ) ( ON ?auto_79947 ?auto_79945 ) ( CLEAR ?auto_79947 ) ( not ( = ?auto_79940 ?auto_79945 ) ) ( not ( = ?auto_79941 ?auto_79945 ) ) ( not ( = ?auto_79942 ?auto_79945 ) ) ( not ( = ?auto_79943 ?auto_79945 ) ) ( not ( = ?auto_79944 ?auto_79945 ) ) ( not ( = ?auto_79946 ?auto_79945 ) ) ( not ( = ?auto_79947 ?auto_79945 ) ) ( HOLDING ?auto_79946 ) ( CLEAR ?auto_79944 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79940 ?auto_79941 ?auto_79942 ?auto_79943 ?auto_79944 ?auto_79946 )
      ( MAKE-4PILE ?auto_79940 ?auto_79941 ?auto_79942 ?auto_79943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79948 - BLOCK
      ?auto_79949 - BLOCK
      ?auto_79950 - BLOCK
      ?auto_79951 - BLOCK
    )
    :vars
    (
      ?auto_79953 - BLOCK
      ?auto_79952 - BLOCK
      ?auto_79955 - BLOCK
      ?auto_79954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79953 ?auto_79951 ) ( ON-TABLE ?auto_79948 ) ( ON ?auto_79949 ?auto_79948 ) ( ON ?auto_79950 ?auto_79949 ) ( ON ?auto_79951 ?auto_79950 ) ( not ( = ?auto_79948 ?auto_79949 ) ) ( not ( = ?auto_79948 ?auto_79950 ) ) ( not ( = ?auto_79948 ?auto_79951 ) ) ( not ( = ?auto_79948 ?auto_79953 ) ) ( not ( = ?auto_79949 ?auto_79950 ) ) ( not ( = ?auto_79949 ?auto_79951 ) ) ( not ( = ?auto_79949 ?auto_79953 ) ) ( not ( = ?auto_79950 ?auto_79951 ) ) ( not ( = ?auto_79950 ?auto_79953 ) ) ( not ( = ?auto_79951 ?auto_79953 ) ) ( not ( = ?auto_79948 ?auto_79952 ) ) ( not ( = ?auto_79948 ?auto_79955 ) ) ( not ( = ?auto_79949 ?auto_79952 ) ) ( not ( = ?auto_79949 ?auto_79955 ) ) ( not ( = ?auto_79950 ?auto_79952 ) ) ( not ( = ?auto_79950 ?auto_79955 ) ) ( not ( = ?auto_79951 ?auto_79952 ) ) ( not ( = ?auto_79951 ?auto_79955 ) ) ( not ( = ?auto_79953 ?auto_79952 ) ) ( not ( = ?auto_79953 ?auto_79955 ) ) ( not ( = ?auto_79952 ?auto_79955 ) ) ( ON ?auto_79955 ?auto_79954 ) ( not ( = ?auto_79948 ?auto_79954 ) ) ( not ( = ?auto_79949 ?auto_79954 ) ) ( not ( = ?auto_79950 ?auto_79954 ) ) ( not ( = ?auto_79951 ?auto_79954 ) ) ( not ( = ?auto_79953 ?auto_79954 ) ) ( not ( = ?auto_79952 ?auto_79954 ) ) ( not ( = ?auto_79955 ?auto_79954 ) ) ( CLEAR ?auto_79953 ) ( ON ?auto_79952 ?auto_79955 ) ( CLEAR ?auto_79952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79954 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79954 ?auto_79955 )
      ( MAKE-4PILE ?auto_79948 ?auto_79949 ?auto_79950 ?auto_79951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79972 - BLOCK
      ?auto_79973 - BLOCK
      ?auto_79974 - BLOCK
      ?auto_79975 - BLOCK
    )
    :vars
    (
      ?auto_79977 - BLOCK
      ?auto_79979 - BLOCK
      ?auto_79978 - BLOCK
      ?auto_79976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79972 ) ( ON ?auto_79973 ?auto_79972 ) ( ON ?auto_79974 ?auto_79973 ) ( not ( = ?auto_79972 ?auto_79973 ) ) ( not ( = ?auto_79972 ?auto_79974 ) ) ( not ( = ?auto_79972 ?auto_79975 ) ) ( not ( = ?auto_79972 ?auto_79977 ) ) ( not ( = ?auto_79973 ?auto_79974 ) ) ( not ( = ?auto_79973 ?auto_79975 ) ) ( not ( = ?auto_79973 ?auto_79977 ) ) ( not ( = ?auto_79974 ?auto_79975 ) ) ( not ( = ?auto_79974 ?auto_79977 ) ) ( not ( = ?auto_79975 ?auto_79977 ) ) ( not ( = ?auto_79972 ?auto_79979 ) ) ( not ( = ?auto_79972 ?auto_79978 ) ) ( not ( = ?auto_79973 ?auto_79979 ) ) ( not ( = ?auto_79973 ?auto_79978 ) ) ( not ( = ?auto_79974 ?auto_79979 ) ) ( not ( = ?auto_79974 ?auto_79978 ) ) ( not ( = ?auto_79975 ?auto_79979 ) ) ( not ( = ?auto_79975 ?auto_79978 ) ) ( not ( = ?auto_79977 ?auto_79979 ) ) ( not ( = ?auto_79977 ?auto_79978 ) ) ( not ( = ?auto_79979 ?auto_79978 ) ) ( ON ?auto_79978 ?auto_79976 ) ( not ( = ?auto_79972 ?auto_79976 ) ) ( not ( = ?auto_79973 ?auto_79976 ) ) ( not ( = ?auto_79974 ?auto_79976 ) ) ( not ( = ?auto_79975 ?auto_79976 ) ) ( not ( = ?auto_79977 ?auto_79976 ) ) ( not ( = ?auto_79979 ?auto_79976 ) ) ( not ( = ?auto_79978 ?auto_79976 ) ) ( ON ?auto_79979 ?auto_79978 ) ( ON-TABLE ?auto_79976 ) ( ON ?auto_79977 ?auto_79979 ) ( CLEAR ?auto_79977 ) ( HOLDING ?auto_79975 ) ( CLEAR ?auto_79974 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79972 ?auto_79973 ?auto_79974 ?auto_79975 ?auto_79977 )
      ( MAKE-4PILE ?auto_79972 ?auto_79973 ?auto_79974 ?auto_79975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79980 - BLOCK
      ?auto_79981 - BLOCK
      ?auto_79982 - BLOCK
      ?auto_79983 - BLOCK
    )
    :vars
    (
      ?auto_79987 - BLOCK
      ?auto_79984 - BLOCK
      ?auto_79985 - BLOCK
      ?auto_79986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79980 ) ( ON ?auto_79981 ?auto_79980 ) ( ON ?auto_79982 ?auto_79981 ) ( not ( = ?auto_79980 ?auto_79981 ) ) ( not ( = ?auto_79980 ?auto_79982 ) ) ( not ( = ?auto_79980 ?auto_79983 ) ) ( not ( = ?auto_79980 ?auto_79987 ) ) ( not ( = ?auto_79981 ?auto_79982 ) ) ( not ( = ?auto_79981 ?auto_79983 ) ) ( not ( = ?auto_79981 ?auto_79987 ) ) ( not ( = ?auto_79982 ?auto_79983 ) ) ( not ( = ?auto_79982 ?auto_79987 ) ) ( not ( = ?auto_79983 ?auto_79987 ) ) ( not ( = ?auto_79980 ?auto_79984 ) ) ( not ( = ?auto_79980 ?auto_79985 ) ) ( not ( = ?auto_79981 ?auto_79984 ) ) ( not ( = ?auto_79981 ?auto_79985 ) ) ( not ( = ?auto_79982 ?auto_79984 ) ) ( not ( = ?auto_79982 ?auto_79985 ) ) ( not ( = ?auto_79983 ?auto_79984 ) ) ( not ( = ?auto_79983 ?auto_79985 ) ) ( not ( = ?auto_79987 ?auto_79984 ) ) ( not ( = ?auto_79987 ?auto_79985 ) ) ( not ( = ?auto_79984 ?auto_79985 ) ) ( ON ?auto_79985 ?auto_79986 ) ( not ( = ?auto_79980 ?auto_79986 ) ) ( not ( = ?auto_79981 ?auto_79986 ) ) ( not ( = ?auto_79982 ?auto_79986 ) ) ( not ( = ?auto_79983 ?auto_79986 ) ) ( not ( = ?auto_79987 ?auto_79986 ) ) ( not ( = ?auto_79984 ?auto_79986 ) ) ( not ( = ?auto_79985 ?auto_79986 ) ) ( ON ?auto_79984 ?auto_79985 ) ( ON-TABLE ?auto_79986 ) ( ON ?auto_79987 ?auto_79984 ) ( CLEAR ?auto_79982 ) ( ON ?auto_79983 ?auto_79987 ) ( CLEAR ?auto_79983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79986 ?auto_79985 ?auto_79984 ?auto_79987 )
      ( MAKE-4PILE ?auto_79980 ?auto_79981 ?auto_79982 ?auto_79983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79988 - BLOCK
      ?auto_79989 - BLOCK
      ?auto_79990 - BLOCK
      ?auto_79991 - BLOCK
    )
    :vars
    (
      ?auto_79994 - BLOCK
      ?auto_79992 - BLOCK
      ?auto_79995 - BLOCK
      ?auto_79993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79988 ) ( ON ?auto_79989 ?auto_79988 ) ( not ( = ?auto_79988 ?auto_79989 ) ) ( not ( = ?auto_79988 ?auto_79990 ) ) ( not ( = ?auto_79988 ?auto_79991 ) ) ( not ( = ?auto_79988 ?auto_79994 ) ) ( not ( = ?auto_79989 ?auto_79990 ) ) ( not ( = ?auto_79989 ?auto_79991 ) ) ( not ( = ?auto_79989 ?auto_79994 ) ) ( not ( = ?auto_79990 ?auto_79991 ) ) ( not ( = ?auto_79990 ?auto_79994 ) ) ( not ( = ?auto_79991 ?auto_79994 ) ) ( not ( = ?auto_79988 ?auto_79992 ) ) ( not ( = ?auto_79988 ?auto_79995 ) ) ( not ( = ?auto_79989 ?auto_79992 ) ) ( not ( = ?auto_79989 ?auto_79995 ) ) ( not ( = ?auto_79990 ?auto_79992 ) ) ( not ( = ?auto_79990 ?auto_79995 ) ) ( not ( = ?auto_79991 ?auto_79992 ) ) ( not ( = ?auto_79991 ?auto_79995 ) ) ( not ( = ?auto_79994 ?auto_79992 ) ) ( not ( = ?auto_79994 ?auto_79995 ) ) ( not ( = ?auto_79992 ?auto_79995 ) ) ( ON ?auto_79995 ?auto_79993 ) ( not ( = ?auto_79988 ?auto_79993 ) ) ( not ( = ?auto_79989 ?auto_79993 ) ) ( not ( = ?auto_79990 ?auto_79993 ) ) ( not ( = ?auto_79991 ?auto_79993 ) ) ( not ( = ?auto_79994 ?auto_79993 ) ) ( not ( = ?auto_79992 ?auto_79993 ) ) ( not ( = ?auto_79995 ?auto_79993 ) ) ( ON ?auto_79992 ?auto_79995 ) ( ON-TABLE ?auto_79993 ) ( ON ?auto_79994 ?auto_79992 ) ( ON ?auto_79991 ?auto_79994 ) ( CLEAR ?auto_79991 ) ( HOLDING ?auto_79990 ) ( CLEAR ?auto_79989 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79988 ?auto_79989 ?auto_79990 )
      ( MAKE-4PILE ?auto_79988 ?auto_79989 ?auto_79990 ?auto_79991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79996 - BLOCK
      ?auto_79997 - BLOCK
      ?auto_79998 - BLOCK
      ?auto_79999 - BLOCK
    )
    :vars
    (
      ?auto_80003 - BLOCK
      ?auto_80001 - BLOCK
      ?auto_80000 - BLOCK
      ?auto_80002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79996 ) ( ON ?auto_79997 ?auto_79996 ) ( not ( = ?auto_79996 ?auto_79997 ) ) ( not ( = ?auto_79996 ?auto_79998 ) ) ( not ( = ?auto_79996 ?auto_79999 ) ) ( not ( = ?auto_79996 ?auto_80003 ) ) ( not ( = ?auto_79997 ?auto_79998 ) ) ( not ( = ?auto_79997 ?auto_79999 ) ) ( not ( = ?auto_79997 ?auto_80003 ) ) ( not ( = ?auto_79998 ?auto_79999 ) ) ( not ( = ?auto_79998 ?auto_80003 ) ) ( not ( = ?auto_79999 ?auto_80003 ) ) ( not ( = ?auto_79996 ?auto_80001 ) ) ( not ( = ?auto_79996 ?auto_80000 ) ) ( not ( = ?auto_79997 ?auto_80001 ) ) ( not ( = ?auto_79997 ?auto_80000 ) ) ( not ( = ?auto_79998 ?auto_80001 ) ) ( not ( = ?auto_79998 ?auto_80000 ) ) ( not ( = ?auto_79999 ?auto_80001 ) ) ( not ( = ?auto_79999 ?auto_80000 ) ) ( not ( = ?auto_80003 ?auto_80001 ) ) ( not ( = ?auto_80003 ?auto_80000 ) ) ( not ( = ?auto_80001 ?auto_80000 ) ) ( ON ?auto_80000 ?auto_80002 ) ( not ( = ?auto_79996 ?auto_80002 ) ) ( not ( = ?auto_79997 ?auto_80002 ) ) ( not ( = ?auto_79998 ?auto_80002 ) ) ( not ( = ?auto_79999 ?auto_80002 ) ) ( not ( = ?auto_80003 ?auto_80002 ) ) ( not ( = ?auto_80001 ?auto_80002 ) ) ( not ( = ?auto_80000 ?auto_80002 ) ) ( ON ?auto_80001 ?auto_80000 ) ( ON-TABLE ?auto_80002 ) ( ON ?auto_80003 ?auto_80001 ) ( ON ?auto_79999 ?auto_80003 ) ( CLEAR ?auto_79997 ) ( ON ?auto_79998 ?auto_79999 ) ( CLEAR ?auto_79998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80002 ?auto_80000 ?auto_80001 ?auto_80003 ?auto_79999 )
      ( MAKE-4PILE ?auto_79996 ?auto_79997 ?auto_79998 ?auto_79999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80004 - BLOCK
      ?auto_80005 - BLOCK
      ?auto_80006 - BLOCK
      ?auto_80007 - BLOCK
    )
    :vars
    (
      ?auto_80008 - BLOCK
      ?auto_80010 - BLOCK
      ?auto_80009 - BLOCK
      ?auto_80011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80004 ) ( not ( = ?auto_80004 ?auto_80005 ) ) ( not ( = ?auto_80004 ?auto_80006 ) ) ( not ( = ?auto_80004 ?auto_80007 ) ) ( not ( = ?auto_80004 ?auto_80008 ) ) ( not ( = ?auto_80005 ?auto_80006 ) ) ( not ( = ?auto_80005 ?auto_80007 ) ) ( not ( = ?auto_80005 ?auto_80008 ) ) ( not ( = ?auto_80006 ?auto_80007 ) ) ( not ( = ?auto_80006 ?auto_80008 ) ) ( not ( = ?auto_80007 ?auto_80008 ) ) ( not ( = ?auto_80004 ?auto_80010 ) ) ( not ( = ?auto_80004 ?auto_80009 ) ) ( not ( = ?auto_80005 ?auto_80010 ) ) ( not ( = ?auto_80005 ?auto_80009 ) ) ( not ( = ?auto_80006 ?auto_80010 ) ) ( not ( = ?auto_80006 ?auto_80009 ) ) ( not ( = ?auto_80007 ?auto_80010 ) ) ( not ( = ?auto_80007 ?auto_80009 ) ) ( not ( = ?auto_80008 ?auto_80010 ) ) ( not ( = ?auto_80008 ?auto_80009 ) ) ( not ( = ?auto_80010 ?auto_80009 ) ) ( ON ?auto_80009 ?auto_80011 ) ( not ( = ?auto_80004 ?auto_80011 ) ) ( not ( = ?auto_80005 ?auto_80011 ) ) ( not ( = ?auto_80006 ?auto_80011 ) ) ( not ( = ?auto_80007 ?auto_80011 ) ) ( not ( = ?auto_80008 ?auto_80011 ) ) ( not ( = ?auto_80010 ?auto_80011 ) ) ( not ( = ?auto_80009 ?auto_80011 ) ) ( ON ?auto_80010 ?auto_80009 ) ( ON-TABLE ?auto_80011 ) ( ON ?auto_80008 ?auto_80010 ) ( ON ?auto_80007 ?auto_80008 ) ( ON ?auto_80006 ?auto_80007 ) ( CLEAR ?auto_80006 ) ( HOLDING ?auto_80005 ) ( CLEAR ?auto_80004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80004 ?auto_80005 )
      ( MAKE-4PILE ?auto_80004 ?auto_80005 ?auto_80006 ?auto_80007 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80012 - BLOCK
      ?auto_80013 - BLOCK
      ?auto_80014 - BLOCK
      ?auto_80015 - BLOCK
    )
    :vars
    (
      ?auto_80017 - BLOCK
      ?auto_80019 - BLOCK
      ?auto_80016 - BLOCK
      ?auto_80018 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80012 ) ( not ( = ?auto_80012 ?auto_80013 ) ) ( not ( = ?auto_80012 ?auto_80014 ) ) ( not ( = ?auto_80012 ?auto_80015 ) ) ( not ( = ?auto_80012 ?auto_80017 ) ) ( not ( = ?auto_80013 ?auto_80014 ) ) ( not ( = ?auto_80013 ?auto_80015 ) ) ( not ( = ?auto_80013 ?auto_80017 ) ) ( not ( = ?auto_80014 ?auto_80015 ) ) ( not ( = ?auto_80014 ?auto_80017 ) ) ( not ( = ?auto_80015 ?auto_80017 ) ) ( not ( = ?auto_80012 ?auto_80019 ) ) ( not ( = ?auto_80012 ?auto_80016 ) ) ( not ( = ?auto_80013 ?auto_80019 ) ) ( not ( = ?auto_80013 ?auto_80016 ) ) ( not ( = ?auto_80014 ?auto_80019 ) ) ( not ( = ?auto_80014 ?auto_80016 ) ) ( not ( = ?auto_80015 ?auto_80019 ) ) ( not ( = ?auto_80015 ?auto_80016 ) ) ( not ( = ?auto_80017 ?auto_80019 ) ) ( not ( = ?auto_80017 ?auto_80016 ) ) ( not ( = ?auto_80019 ?auto_80016 ) ) ( ON ?auto_80016 ?auto_80018 ) ( not ( = ?auto_80012 ?auto_80018 ) ) ( not ( = ?auto_80013 ?auto_80018 ) ) ( not ( = ?auto_80014 ?auto_80018 ) ) ( not ( = ?auto_80015 ?auto_80018 ) ) ( not ( = ?auto_80017 ?auto_80018 ) ) ( not ( = ?auto_80019 ?auto_80018 ) ) ( not ( = ?auto_80016 ?auto_80018 ) ) ( ON ?auto_80019 ?auto_80016 ) ( ON-TABLE ?auto_80018 ) ( ON ?auto_80017 ?auto_80019 ) ( ON ?auto_80015 ?auto_80017 ) ( ON ?auto_80014 ?auto_80015 ) ( CLEAR ?auto_80012 ) ( ON ?auto_80013 ?auto_80014 ) ( CLEAR ?auto_80013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80018 ?auto_80016 ?auto_80019 ?auto_80017 ?auto_80015 ?auto_80014 )
      ( MAKE-4PILE ?auto_80012 ?auto_80013 ?auto_80014 ?auto_80015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80020 - BLOCK
      ?auto_80021 - BLOCK
      ?auto_80022 - BLOCK
      ?auto_80023 - BLOCK
    )
    :vars
    (
      ?auto_80027 - BLOCK
      ?auto_80026 - BLOCK
      ?auto_80025 - BLOCK
      ?auto_80024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80020 ?auto_80021 ) ) ( not ( = ?auto_80020 ?auto_80022 ) ) ( not ( = ?auto_80020 ?auto_80023 ) ) ( not ( = ?auto_80020 ?auto_80027 ) ) ( not ( = ?auto_80021 ?auto_80022 ) ) ( not ( = ?auto_80021 ?auto_80023 ) ) ( not ( = ?auto_80021 ?auto_80027 ) ) ( not ( = ?auto_80022 ?auto_80023 ) ) ( not ( = ?auto_80022 ?auto_80027 ) ) ( not ( = ?auto_80023 ?auto_80027 ) ) ( not ( = ?auto_80020 ?auto_80026 ) ) ( not ( = ?auto_80020 ?auto_80025 ) ) ( not ( = ?auto_80021 ?auto_80026 ) ) ( not ( = ?auto_80021 ?auto_80025 ) ) ( not ( = ?auto_80022 ?auto_80026 ) ) ( not ( = ?auto_80022 ?auto_80025 ) ) ( not ( = ?auto_80023 ?auto_80026 ) ) ( not ( = ?auto_80023 ?auto_80025 ) ) ( not ( = ?auto_80027 ?auto_80026 ) ) ( not ( = ?auto_80027 ?auto_80025 ) ) ( not ( = ?auto_80026 ?auto_80025 ) ) ( ON ?auto_80025 ?auto_80024 ) ( not ( = ?auto_80020 ?auto_80024 ) ) ( not ( = ?auto_80021 ?auto_80024 ) ) ( not ( = ?auto_80022 ?auto_80024 ) ) ( not ( = ?auto_80023 ?auto_80024 ) ) ( not ( = ?auto_80027 ?auto_80024 ) ) ( not ( = ?auto_80026 ?auto_80024 ) ) ( not ( = ?auto_80025 ?auto_80024 ) ) ( ON ?auto_80026 ?auto_80025 ) ( ON-TABLE ?auto_80024 ) ( ON ?auto_80027 ?auto_80026 ) ( ON ?auto_80023 ?auto_80027 ) ( ON ?auto_80022 ?auto_80023 ) ( ON ?auto_80021 ?auto_80022 ) ( CLEAR ?auto_80021 ) ( HOLDING ?auto_80020 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80020 )
      ( MAKE-4PILE ?auto_80020 ?auto_80021 ?auto_80022 ?auto_80023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80028 - BLOCK
      ?auto_80029 - BLOCK
      ?auto_80030 - BLOCK
      ?auto_80031 - BLOCK
    )
    :vars
    (
      ?auto_80034 - BLOCK
      ?auto_80033 - BLOCK
      ?auto_80035 - BLOCK
      ?auto_80032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80028 ?auto_80029 ) ) ( not ( = ?auto_80028 ?auto_80030 ) ) ( not ( = ?auto_80028 ?auto_80031 ) ) ( not ( = ?auto_80028 ?auto_80034 ) ) ( not ( = ?auto_80029 ?auto_80030 ) ) ( not ( = ?auto_80029 ?auto_80031 ) ) ( not ( = ?auto_80029 ?auto_80034 ) ) ( not ( = ?auto_80030 ?auto_80031 ) ) ( not ( = ?auto_80030 ?auto_80034 ) ) ( not ( = ?auto_80031 ?auto_80034 ) ) ( not ( = ?auto_80028 ?auto_80033 ) ) ( not ( = ?auto_80028 ?auto_80035 ) ) ( not ( = ?auto_80029 ?auto_80033 ) ) ( not ( = ?auto_80029 ?auto_80035 ) ) ( not ( = ?auto_80030 ?auto_80033 ) ) ( not ( = ?auto_80030 ?auto_80035 ) ) ( not ( = ?auto_80031 ?auto_80033 ) ) ( not ( = ?auto_80031 ?auto_80035 ) ) ( not ( = ?auto_80034 ?auto_80033 ) ) ( not ( = ?auto_80034 ?auto_80035 ) ) ( not ( = ?auto_80033 ?auto_80035 ) ) ( ON ?auto_80035 ?auto_80032 ) ( not ( = ?auto_80028 ?auto_80032 ) ) ( not ( = ?auto_80029 ?auto_80032 ) ) ( not ( = ?auto_80030 ?auto_80032 ) ) ( not ( = ?auto_80031 ?auto_80032 ) ) ( not ( = ?auto_80034 ?auto_80032 ) ) ( not ( = ?auto_80033 ?auto_80032 ) ) ( not ( = ?auto_80035 ?auto_80032 ) ) ( ON ?auto_80033 ?auto_80035 ) ( ON-TABLE ?auto_80032 ) ( ON ?auto_80034 ?auto_80033 ) ( ON ?auto_80031 ?auto_80034 ) ( ON ?auto_80030 ?auto_80031 ) ( ON ?auto_80029 ?auto_80030 ) ( ON ?auto_80028 ?auto_80029 ) ( CLEAR ?auto_80028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80032 ?auto_80035 ?auto_80033 ?auto_80034 ?auto_80031 ?auto_80030 ?auto_80029 )
      ( MAKE-4PILE ?auto_80028 ?auto_80029 ?auto_80030 ?auto_80031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80039 - BLOCK
      ?auto_80040 - BLOCK
      ?auto_80041 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_80041 ) ( CLEAR ?auto_80040 ) ( ON-TABLE ?auto_80039 ) ( ON ?auto_80040 ?auto_80039 ) ( not ( = ?auto_80039 ?auto_80040 ) ) ( not ( = ?auto_80039 ?auto_80041 ) ) ( not ( = ?auto_80040 ?auto_80041 ) ) )
    :subtasks
    ( ( !STACK ?auto_80041 ?auto_80040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80042 - BLOCK
      ?auto_80043 - BLOCK
      ?auto_80044 - BLOCK
    )
    :vars
    (
      ?auto_80045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80043 ) ( ON-TABLE ?auto_80042 ) ( ON ?auto_80043 ?auto_80042 ) ( not ( = ?auto_80042 ?auto_80043 ) ) ( not ( = ?auto_80042 ?auto_80044 ) ) ( not ( = ?auto_80043 ?auto_80044 ) ) ( ON ?auto_80044 ?auto_80045 ) ( CLEAR ?auto_80044 ) ( HAND-EMPTY ) ( not ( = ?auto_80042 ?auto_80045 ) ) ( not ( = ?auto_80043 ?auto_80045 ) ) ( not ( = ?auto_80044 ?auto_80045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80044 ?auto_80045 )
      ( MAKE-3PILE ?auto_80042 ?auto_80043 ?auto_80044 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80046 - BLOCK
      ?auto_80047 - BLOCK
      ?auto_80048 - BLOCK
    )
    :vars
    (
      ?auto_80049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80046 ) ( not ( = ?auto_80046 ?auto_80047 ) ) ( not ( = ?auto_80046 ?auto_80048 ) ) ( not ( = ?auto_80047 ?auto_80048 ) ) ( ON ?auto_80048 ?auto_80049 ) ( CLEAR ?auto_80048 ) ( not ( = ?auto_80046 ?auto_80049 ) ) ( not ( = ?auto_80047 ?auto_80049 ) ) ( not ( = ?auto_80048 ?auto_80049 ) ) ( HOLDING ?auto_80047 ) ( CLEAR ?auto_80046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80046 ?auto_80047 )
      ( MAKE-3PILE ?auto_80046 ?auto_80047 ?auto_80048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80050 - BLOCK
      ?auto_80051 - BLOCK
      ?auto_80052 - BLOCK
    )
    :vars
    (
      ?auto_80053 - BLOCK
      ?auto_80055 - BLOCK
      ?auto_80056 - BLOCK
      ?auto_80054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80050 ) ( not ( = ?auto_80050 ?auto_80051 ) ) ( not ( = ?auto_80050 ?auto_80052 ) ) ( not ( = ?auto_80051 ?auto_80052 ) ) ( ON ?auto_80052 ?auto_80053 ) ( not ( = ?auto_80050 ?auto_80053 ) ) ( not ( = ?auto_80051 ?auto_80053 ) ) ( not ( = ?auto_80052 ?auto_80053 ) ) ( CLEAR ?auto_80050 ) ( ON ?auto_80051 ?auto_80052 ) ( CLEAR ?auto_80051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80055 ) ( ON ?auto_80056 ?auto_80055 ) ( ON ?auto_80054 ?auto_80056 ) ( ON ?auto_80053 ?auto_80054 ) ( not ( = ?auto_80055 ?auto_80056 ) ) ( not ( = ?auto_80055 ?auto_80054 ) ) ( not ( = ?auto_80055 ?auto_80053 ) ) ( not ( = ?auto_80055 ?auto_80052 ) ) ( not ( = ?auto_80055 ?auto_80051 ) ) ( not ( = ?auto_80056 ?auto_80054 ) ) ( not ( = ?auto_80056 ?auto_80053 ) ) ( not ( = ?auto_80056 ?auto_80052 ) ) ( not ( = ?auto_80056 ?auto_80051 ) ) ( not ( = ?auto_80054 ?auto_80053 ) ) ( not ( = ?auto_80054 ?auto_80052 ) ) ( not ( = ?auto_80054 ?auto_80051 ) ) ( not ( = ?auto_80050 ?auto_80055 ) ) ( not ( = ?auto_80050 ?auto_80056 ) ) ( not ( = ?auto_80050 ?auto_80054 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80055 ?auto_80056 ?auto_80054 ?auto_80053 ?auto_80052 )
      ( MAKE-3PILE ?auto_80050 ?auto_80051 ?auto_80052 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80057 - BLOCK
      ?auto_80058 - BLOCK
      ?auto_80059 - BLOCK
    )
    :vars
    (
      ?auto_80061 - BLOCK
      ?auto_80060 - BLOCK
      ?auto_80063 - BLOCK
      ?auto_80062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80057 ?auto_80058 ) ) ( not ( = ?auto_80057 ?auto_80059 ) ) ( not ( = ?auto_80058 ?auto_80059 ) ) ( ON ?auto_80059 ?auto_80061 ) ( not ( = ?auto_80057 ?auto_80061 ) ) ( not ( = ?auto_80058 ?auto_80061 ) ) ( not ( = ?auto_80059 ?auto_80061 ) ) ( ON ?auto_80058 ?auto_80059 ) ( CLEAR ?auto_80058 ) ( ON-TABLE ?auto_80060 ) ( ON ?auto_80063 ?auto_80060 ) ( ON ?auto_80062 ?auto_80063 ) ( ON ?auto_80061 ?auto_80062 ) ( not ( = ?auto_80060 ?auto_80063 ) ) ( not ( = ?auto_80060 ?auto_80062 ) ) ( not ( = ?auto_80060 ?auto_80061 ) ) ( not ( = ?auto_80060 ?auto_80059 ) ) ( not ( = ?auto_80060 ?auto_80058 ) ) ( not ( = ?auto_80063 ?auto_80062 ) ) ( not ( = ?auto_80063 ?auto_80061 ) ) ( not ( = ?auto_80063 ?auto_80059 ) ) ( not ( = ?auto_80063 ?auto_80058 ) ) ( not ( = ?auto_80062 ?auto_80061 ) ) ( not ( = ?auto_80062 ?auto_80059 ) ) ( not ( = ?auto_80062 ?auto_80058 ) ) ( not ( = ?auto_80057 ?auto_80060 ) ) ( not ( = ?auto_80057 ?auto_80063 ) ) ( not ( = ?auto_80057 ?auto_80062 ) ) ( HOLDING ?auto_80057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80057 )
      ( MAKE-3PILE ?auto_80057 ?auto_80058 ?auto_80059 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80064 - BLOCK
      ?auto_80065 - BLOCK
      ?auto_80066 - BLOCK
    )
    :vars
    (
      ?auto_80069 - BLOCK
      ?auto_80070 - BLOCK
      ?auto_80068 - BLOCK
      ?auto_80067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80064 ?auto_80065 ) ) ( not ( = ?auto_80064 ?auto_80066 ) ) ( not ( = ?auto_80065 ?auto_80066 ) ) ( ON ?auto_80066 ?auto_80069 ) ( not ( = ?auto_80064 ?auto_80069 ) ) ( not ( = ?auto_80065 ?auto_80069 ) ) ( not ( = ?auto_80066 ?auto_80069 ) ) ( ON ?auto_80065 ?auto_80066 ) ( ON-TABLE ?auto_80070 ) ( ON ?auto_80068 ?auto_80070 ) ( ON ?auto_80067 ?auto_80068 ) ( ON ?auto_80069 ?auto_80067 ) ( not ( = ?auto_80070 ?auto_80068 ) ) ( not ( = ?auto_80070 ?auto_80067 ) ) ( not ( = ?auto_80070 ?auto_80069 ) ) ( not ( = ?auto_80070 ?auto_80066 ) ) ( not ( = ?auto_80070 ?auto_80065 ) ) ( not ( = ?auto_80068 ?auto_80067 ) ) ( not ( = ?auto_80068 ?auto_80069 ) ) ( not ( = ?auto_80068 ?auto_80066 ) ) ( not ( = ?auto_80068 ?auto_80065 ) ) ( not ( = ?auto_80067 ?auto_80069 ) ) ( not ( = ?auto_80067 ?auto_80066 ) ) ( not ( = ?auto_80067 ?auto_80065 ) ) ( not ( = ?auto_80064 ?auto_80070 ) ) ( not ( = ?auto_80064 ?auto_80068 ) ) ( not ( = ?auto_80064 ?auto_80067 ) ) ( ON ?auto_80064 ?auto_80065 ) ( CLEAR ?auto_80064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80070 ?auto_80068 ?auto_80067 ?auto_80069 ?auto_80066 ?auto_80065 )
      ( MAKE-3PILE ?auto_80064 ?auto_80065 ?auto_80066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80071 - BLOCK
      ?auto_80072 - BLOCK
      ?auto_80073 - BLOCK
    )
    :vars
    (
      ?auto_80074 - BLOCK
      ?auto_80076 - BLOCK
      ?auto_80075 - BLOCK
      ?auto_80077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80071 ?auto_80072 ) ) ( not ( = ?auto_80071 ?auto_80073 ) ) ( not ( = ?auto_80072 ?auto_80073 ) ) ( ON ?auto_80073 ?auto_80074 ) ( not ( = ?auto_80071 ?auto_80074 ) ) ( not ( = ?auto_80072 ?auto_80074 ) ) ( not ( = ?auto_80073 ?auto_80074 ) ) ( ON ?auto_80072 ?auto_80073 ) ( ON-TABLE ?auto_80076 ) ( ON ?auto_80075 ?auto_80076 ) ( ON ?auto_80077 ?auto_80075 ) ( ON ?auto_80074 ?auto_80077 ) ( not ( = ?auto_80076 ?auto_80075 ) ) ( not ( = ?auto_80076 ?auto_80077 ) ) ( not ( = ?auto_80076 ?auto_80074 ) ) ( not ( = ?auto_80076 ?auto_80073 ) ) ( not ( = ?auto_80076 ?auto_80072 ) ) ( not ( = ?auto_80075 ?auto_80077 ) ) ( not ( = ?auto_80075 ?auto_80074 ) ) ( not ( = ?auto_80075 ?auto_80073 ) ) ( not ( = ?auto_80075 ?auto_80072 ) ) ( not ( = ?auto_80077 ?auto_80074 ) ) ( not ( = ?auto_80077 ?auto_80073 ) ) ( not ( = ?auto_80077 ?auto_80072 ) ) ( not ( = ?auto_80071 ?auto_80076 ) ) ( not ( = ?auto_80071 ?auto_80075 ) ) ( not ( = ?auto_80071 ?auto_80077 ) ) ( HOLDING ?auto_80071 ) ( CLEAR ?auto_80072 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80076 ?auto_80075 ?auto_80077 ?auto_80074 ?auto_80073 ?auto_80072 ?auto_80071 )
      ( MAKE-3PILE ?auto_80071 ?auto_80072 ?auto_80073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80078 - BLOCK
      ?auto_80079 - BLOCK
      ?auto_80080 - BLOCK
    )
    :vars
    (
      ?auto_80081 - BLOCK
      ?auto_80082 - BLOCK
      ?auto_80083 - BLOCK
      ?auto_80084 - BLOCK
      ?auto_80085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80078 ?auto_80079 ) ) ( not ( = ?auto_80078 ?auto_80080 ) ) ( not ( = ?auto_80079 ?auto_80080 ) ) ( ON ?auto_80080 ?auto_80081 ) ( not ( = ?auto_80078 ?auto_80081 ) ) ( not ( = ?auto_80079 ?auto_80081 ) ) ( not ( = ?auto_80080 ?auto_80081 ) ) ( ON ?auto_80079 ?auto_80080 ) ( ON-TABLE ?auto_80082 ) ( ON ?auto_80083 ?auto_80082 ) ( ON ?auto_80084 ?auto_80083 ) ( ON ?auto_80081 ?auto_80084 ) ( not ( = ?auto_80082 ?auto_80083 ) ) ( not ( = ?auto_80082 ?auto_80084 ) ) ( not ( = ?auto_80082 ?auto_80081 ) ) ( not ( = ?auto_80082 ?auto_80080 ) ) ( not ( = ?auto_80082 ?auto_80079 ) ) ( not ( = ?auto_80083 ?auto_80084 ) ) ( not ( = ?auto_80083 ?auto_80081 ) ) ( not ( = ?auto_80083 ?auto_80080 ) ) ( not ( = ?auto_80083 ?auto_80079 ) ) ( not ( = ?auto_80084 ?auto_80081 ) ) ( not ( = ?auto_80084 ?auto_80080 ) ) ( not ( = ?auto_80084 ?auto_80079 ) ) ( not ( = ?auto_80078 ?auto_80082 ) ) ( not ( = ?auto_80078 ?auto_80083 ) ) ( not ( = ?auto_80078 ?auto_80084 ) ) ( CLEAR ?auto_80079 ) ( ON ?auto_80078 ?auto_80085 ) ( CLEAR ?auto_80078 ) ( HAND-EMPTY ) ( not ( = ?auto_80078 ?auto_80085 ) ) ( not ( = ?auto_80079 ?auto_80085 ) ) ( not ( = ?auto_80080 ?auto_80085 ) ) ( not ( = ?auto_80081 ?auto_80085 ) ) ( not ( = ?auto_80082 ?auto_80085 ) ) ( not ( = ?auto_80083 ?auto_80085 ) ) ( not ( = ?auto_80084 ?auto_80085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80078 ?auto_80085 )
      ( MAKE-3PILE ?auto_80078 ?auto_80079 ?auto_80080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80086 - BLOCK
      ?auto_80087 - BLOCK
      ?auto_80088 - BLOCK
    )
    :vars
    (
      ?auto_80093 - BLOCK
      ?auto_80091 - BLOCK
      ?auto_80089 - BLOCK
      ?auto_80092 - BLOCK
      ?auto_80090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80086 ?auto_80087 ) ) ( not ( = ?auto_80086 ?auto_80088 ) ) ( not ( = ?auto_80087 ?auto_80088 ) ) ( ON ?auto_80088 ?auto_80093 ) ( not ( = ?auto_80086 ?auto_80093 ) ) ( not ( = ?auto_80087 ?auto_80093 ) ) ( not ( = ?auto_80088 ?auto_80093 ) ) ( ON-TABLE ?auto_80091 ) ( ON ?auto_80089 ?auto_80091 ) ( ON ?auto_80092 ?auto_80089 ) ( ON ?auto_80093 ?auto_80092 ) ( not ( = ?auto_80091 ?auto_80089 ) ) ( not ( = ?auto_80091 ?auto_80092 ) ) ( not ( = ?auto_80091 ?auto_80093 ) ) ( not ( = ?auto_80091 ?auto_80088 ) ) ( not ( = ?auto_80091 ?auto_80087 ) ) ( not ( = ?auto_80089 ?auto_80092 ) ) ( not ( = ?auto_80089 ?auto_80093 ) ) ( not ( = ?auto_80089 ?auto_80088 ) ) ( not ( = ?auto_80089 ?auto_80087 ) ) ( not ( = ?auto_80092 ?auto_80093 ) ) ( not ( = ?auto_80092 ?auto_80088 ) ) ( not ( = ?auto_80092 ?auto_80087 ) ) ( not ( = ?auto_80086 ?auto_80091 ) ) ( not ( = ?auto_80086 ?auto_80089 ) ) ( not ( = ?auto_80086 ?auto_80092 ) ) ( ON ?auto_80086 ?auto_80090 ) ( CLEAR ?auto_80086 ) ( not ( = ?auto_80086 ?auto_80090 ) ) ( not ( = ?auto_80087 ?auto_80090 ) ) ( not ( = ?auto_80088 ?auto_80090 ) ) ( not ( = ?auto_80093 ?auto_80090 ) ) ( not ( = ?auto_80091 ?auto_80090 ) ) ( not ( = ?auto_80089 ?auto_80090 ) ) ( not ( = ?auto_80092 ?auto_80090 ) ) ( HOLDING ?auto_80087 ) ( CLEAR ?auto_80088 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80091 ?auto_80089 ?auto_80092 ?auto_80093 ?auto_80088 ?auto_80087 )
      ( MAKE-3PILE ?auto_80086 ?auto_80087 ?auto_80088 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80094 - BLOCK
      ?auto_80095 - BLOCK
      ?auto_80096 - BLOCK
    )
    :vars
    (
      ?auto_80101 - BLOCK
      ?auto_80097 - BLOCK
      ?auto_80099 - BLOCK
      ?auto_80100 - BLOCK
      ?auto_80098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80094 ?auto_80095 ) ) ( not ( = ?auto_80094 ?auto_80096 ) ) ( not ( = ?auto_80095 ?auto_80096 ) ) ( ON ?auto_80096 ?auto_80101 ) ( not ( = ?auto_80094 ?auto_80101 ) ) ( not ( = ?auto_80095 ?auto_80101 ) ) ( not ( = ?auto_80096 ?auto_80101 ) ) ( ON-TABLE ?auto_80097 ) ( ON ?auto_80099 ?auto_80097 ) ( ON ?auto_80100 ?auto_80099 ) ( ON ?auto_80101 ?auto_80100 ) ( not ( = ?auto_80097 ?auto_80099 ) ) ( not ( = ?auto_80097 ?auto_80100 ) ) ( not ( = ?auto_80097 ?auto_80101 ) ) ( not ( = ?auto_80097 ?auto_80096 ) ) ( not ( = ?auto_80097 ?auto_80095 ) ) ( not ( = ?auto_80099 ?auto_80100 ) ) ( not ( = ?auto_80099 ?auto_80101 ) ) ( not ( = ?auto_80099 ?auto_80096 ) ) ( not ( = ?auto_80099 ?auto_80095 ) ) ( not ( = ?auto_80100 ?auto_80101 ) ) ( not ( = ?auto_80100 ?auto_80096 ) ) ( not ( = ?auto_80100 ?auto_80095 ) ) ( not ( = ?auto_80094 ?auto_80097 ) ) ( not ( = ?auto_80094 ?auto_80099 ) ) ( not ( = ?auto_80094 ?auto_80100 ) ) ( ON ?auto_80094 ?auto_80098 ) ( not ( = ?auto_80094 ?auto_80098 ) ) ( not ( = ?auto_80095 ?auto_80098 ) ) ( not ( = ?auto_80096 ?auto_80098 ) ) ( not ( = ?auto_80101 ?auto_80098 ) ) ( not ( = ?auto_80097 ?auto_80098 ) ) ( not ( = ?auto_80099 ?auto_80098 ) ) ( not ( = ?auto_80100 ?auto_80098 ) ) ( CLEAR ?auto_80096 ) ( ON ?auto_80095 ?auto_80094 ) ( CLEAR ?auto_80095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80098 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80098 ?auto_80094 )
      ( MAKE-3PILE ?auto_80094 ?auto_80095 ?auto_80096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80102 - BLOCK
      ?auto_80103 - BLOCK
      ?auto_80104 - BLOCK
    )
    :vars
    (
      ?auto_80108 - BLOCK
      ?auto_80109 - BLOCK
      ?auto_80106 - BLOCK
      ?auto_80105 - BLOCK
      ?auto_80107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80102 ?auto_80103 ) ) ( not ( = ?auto_80102 ?auto_80104 ) ) ( not ( = ?auto_80103 ?auto_80104 ) ) ( not ( = ?auto_80102 ?auto_80108 ) ) ( not ( = ?auto_80103 ?auto_80108 ) ) ( not ( = ?auto_80104 ?auto_80108 ) ) ( ON-TABLE ?auto_80109 ) ( ON ?auto_80106 ?auto_80109 ) ( ON ?auto_80105 ?auto_80106 ) ( ON ?auto_80108 ?auto_80105 ) ( not ( = ?auto_80109 ?auto_80106 ) ) ( not ( = ?auto_80109 ?auto_80105 ) ) ( not ( = ?auto_80109 ?auto_80108 ) ) ( not ( = ?auto_80109 ?auto_80104 ) ) ( not ( = ?auto_80109 ?auto_80103 ) ) ( not ( = ?auto_80106 ?auto_80105 ) ) ( not ( = ?auto_80106 ?auto_80108 ) ) ( not ( = ?auto_80106 ?auto_80104 ) ) ( not ( = ?auto_80106 ?auto_80103 ) ) ( not ( = ?auto_80105 ?auto_80108 ) ) ( not ( = ?auto_80105 ?auto_80104 ) ) ( not ( = ?auto_80105 ?auto_80103 ) ) ( not ( = ?auto_80102 ?auto_80109 ) ) ( not ( = ?auto_80102 ?auto_80106 ) ) ( not ( = ?auto_80102 ?auto_80105 ) ) ( ON ?auto_80102 ?auto_80107 ) ( not ( = ?auto_80102 ?auto_80107 ) ) ( not ( = ?auto_80103 ?auto_80107 ) ) ( not ( = ?auto_80104 ?auto_80107 ) ) ( not ( = ?auto_80108 ?auto_80107 ) ) ( not ( = ?auto_80109 ?auto_80107 ) ) ( not ( = ?auto_80106 ?auto_80107 ) ) ( not ( = ?auto_80105 ?auto_80107 ) ) ( ON ?auto_80103 ?auto_80102 ) ( CLEAR ?auto_80103 ) ( ON-TABLE ?auto_80107 ) ( HOLDING ?auto_80104 ) ( CLEAR ?auto_80108 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80109 ?auto_80106 ?auto_80105 ?auto_80108 ?auto_80104 )
      ( MAKE-3PILE ?auto_80102 ?auto_80103 ?auto_80104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80110 - BLOCK
      ?auto_80111 - BLOCK
      ?auto_80112 - BLOCK
    )
    :vars
    (
      ?auto_80113 - BLOCK
      ?auto_80115 - BLOCK
      ?auto_80114 - BLOCK
      ?auto_80117 - BLOCK
      ?auto_80116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80110 ?auto_80111 ) ) ( not ( = ?auto_80110 ?auto_80112 ) ) ( not ( = ?auto_80111 ?auto_80112 ) ) ( not ( = ?auto_80110 ?auto_80113 ) ) ( not ( = ?auto_80111 ?auto_80113 ) ) ( not ( = ?auto_80112 ?auto_80113 ) ) ( ON-TABLE ?auto_80115 ) ( ON ?auto_80114 ?auto_80115 ) ( ON ?auto_80117 ?auto_80114 ) ( ON ?auto_80113 ?auto_80117 ) ( not ( = ?auto_80115 ?auto_80114 ) ) ( not ( = ?auto_80115 ?auto_80117 ) ) ( not ( = ?auto_80115 ?auto_80113 ) ) ( not ( = ?auto_80115 ?auto_80112 ) ) ( not ( = ?auto_80115 ?auto_80111 ) ) ( not ( = ?auto_80114 ?auto_80117 ) ) ( not ( = ?auto_80114 ?auto_80113 ) ) ( not ( = ?auto_80114 ?auto_80112 ) ) ( not ( = ?auto_80114 ?auto_80111 ) ) ( not ( = ?auto_80117 ?auto_80113 ) ) ( not ( = ?auto_80117 ?auto_80112 ) ) ( not ( = ?auto_80117 ?auto_80111 ) ) ( not ( = ?auto_80110 ?auto_80115 ) ) ( not ( = ?auto_80110 ?auto_80114 ) ) ( not ( = ?auto_80110 ?auto_80117 ) ) ( ON ?auto_80110 ?auto_80116 ) ( not ( = ?auto_80110 ?auto_80116 ) ) ( not ( = ?auto_80111 ?auto_80116 ) ) ( not ( = ?auto_80112 ?auto_80116 ) ) ( not ( = ?auto_80113 ?auto_80116 ) ) ( not ( = ?auto_80115 ?auto_80116 ) ) ( not ( = ?auto_80114 ?auto_80116 ) ) ( not ( = ?auto_80117 ?auto_80116 ) ) ( ON ?auto_80111 ?auto_80110 ) ( ON-TABLE ?auto_80116 ) ( CLEAR ?auto_80113 ) ( ON ?auto_80112 ?auto_80111 ) ( CLEAR ?auto_80112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80116 ?auto_80110 ?auto_80111 )
      ( MAKE-3PILE ?auto_80110 ?auto_80111 ?auto_80112 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80118 - BLOCK
      ?auto_80119 - BLOCK
      ?auto_80120 - BLOCK
    )
    :vars
    (
      ?auto_80125 - BLOCK
      ?auto_80121 - BLOCK
      ?auto_80122 - BLOCK
      ?auto_80124 - BLOCK
      ?auto_80123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80118 ?auto_80119 ) ) ( not ( = ?auto_80118 ?auto_80120 ) ) ( not ( = ?auto_80119 ?auto_80120 ) ) ( not ( = ?auto_80118 ?auto_80125 ) ) ( not ( = ?auto_80119 ?auto_80125 ) ) ( not ( = ?auto_80120 ?auto_80125 ) ) ( ON-TABLE ?auto_80121 ) ( ON ?auto_80122 ?auto_80121 ) ( ON ?auto_80124 ?auto_80122 ) ( not ( = ?auto_80121 ?auto_80122 ) ) ( not ( = ?auto_80121 ?auto_80124 ) ) ( not ( = ?auto_80121 ?auto_80125 ) ) ( not ( = ?auto_80121 ?auto_80120 ) ) ( not ( = ?auto_80121 ?auto_80119 ) ) ( not ( = ?auto_80122 ?auto_80124 ) ) ( not ( = ?auto_80122 ?auto_80125 ) ) ( not ( = ?auto_80122 ?auto_80120 ) ) ( not ( = ?auto_80122 ?auto_80119 ) ) ( not ( = ?auto_80124 ?auto_80125 ) ) ( not ( = ?auto_80124 ?auto_80120 ) ) ( not ( = ?auto_80124 ?auto_80119 ) ) ( not ( = ?auto_80118 ?auto_80121 ) ) ( not ( = ?auto_80118 ?auto_80122 ) ) ( not ( = ?auto_80118 ?auto_80124 ) ) ( ON ?auto_80118 ?auto_80123 ) ( not ( = ?auto_80118 ?auto_80123 ) ) ( not ( = ?auto_80119 ?auto_80123 ) ) ( not ( = ?auto_80120 ?auto_80123 ) ) ( not ( = ?auto_80125 ?auto_80123 ) ) ( not ( = ?auto_80121 ?auto_80123 ) ) ( not ( = ?auto_80122 ?auto_80123 ) ) ( not ( = ?auto_80124 ?auto_80123 ) ) ( ON ?auto_80119 ?auto_80118 ) ( ON-TABLE ?auto_80123 ) ( ON ?auto_80120 ?auto_80119 ) ( CLEAR ?auto_80120 ) ( HOLDING ?auto_80125 ) ( CLEAR ?auto_80124 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80121 ?auto_80122 ?auto_80124 ?auto_80125 )
      ( MAKE-3PILE ?auto_80118 ?auto_80119 ?auto_80120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80126 - BLOCK
      ?auto_80127 - BLOCK
      ?auto_80128 - BLOCK
    )
    :vars
    (
      ?auto_80129 - BLOCK
      ?auto_80133 - BLOCK
      ?auto_80130 - BLOCK
      ?auto_80131 - BLOCK
      ?auto_80132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80126 ?auto_80127 ) ) ( not ( = ?auto_80126 ?auto_80128 ) ) ( not ( = ?auto_80127 ?auto_80128 ) ) ( not ( = ?auto_80126 ?auto_80129 ) ) ( not ( = ?auto_80127 ?auto_80129 ) ) ( not ( = ?auto_80128 ?auto_80129 ) ) ( ON-TABLE ?auto_80133 ) ( ON ?auto_80130 ?auto_80133 ) ( ON ?auto_80131 ?auto_80130 ) ( not ( = ?auto_80133 ?auto_80130 ) ) ( not ( = ?auto_80133 ?auto_80131 ) ) ( not ( = ?auto_80133 ?auto_80129 ) ) ( not ( = ?auto_80133 ?auto_80128 ) ) ( not ( = ?auto_80133 ?auto_80127 ) ) ( not ( = ?auto_80130 ?auto_80131 ) ) ( not ( = ?auto_80130 ?auto_80129 ) ) ( not ( = ?auto_80130 ?auto_80128 ) ) ( not ( = ?auto_80130 ?auto_80127 ) ) ( not ( = ?auto_80131 ?auto_80129 ) ) ( not ( = ?auto_80131 ?auto_80128 ) ) ( not ( = ?auto_80131 ?auto_80127 ) ) ( not ( = ?auto_80126 ?auto_80133 ) ) ( not ( = ?auto_80126 ?auto_80130 ) ) ( not ( = ?auto_80126 ?auto_80131 ) ) ( ON ?auto_80126 ?auto_80132 ) ( not ( = ?auto_80126 ?auto_80132 ) ) ( not ( = ?auto_80127 ?auto_80132 ) ) ( not ( = ?auto_80128 ?auto_80132 ) ) ( not ( = ?auto_80129 ?auto_80132 ) ) ( not ( = ?auto_80133 ?auto_80132 ) ) ( not ( = ?auto_80130 ?auto_80132 ) ) ( not ( = ?auto_80131 ?auto_80132 ) ) ( ON ?auto_80127 ?auto_80126 ) ( ON-TABLE ?auto_80132 ) ( ON ?auto_80128 ?auto_80127 ) ( CLEAR ?auto_80131 ) ( ON ?auto_80129 ?auto_80128 ) ( CLEAR ?auto_80129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80132 ?auto_80126 ?auto_80127 ?auto_80128 )
      ( MAKE-3PILE ?auto_80126 ?auto_80127 ?auto_80128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80134 - BLOCK
      ?auto_80135 - BLOCK
      ?auto_80136 - BLOCK
    )
    :vars
    (
      ?auto_80141 - BLOCK
      ?auto_80140 - BLOCK
      ?auto_80139 - BLOCK
      ?auto_80137 - BLOCK
      ?auto_80138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80134 ?auto_80135 ) ) ( not ( = ?auto_80134 ?auto_80136 ) ) ( not ( = ?auto_80135 ?auto_80136 ) ) ( not ( = ?auto_80134 ?auto_80141 ) ) ( not ( = ?auto_80135 ?auto_80141 ) ) ( not ( = ?auto_80136 ?auto_80141 ) ) ( ON-TABLE ?auto_80140 ) ( ON ?auto_80139 ?auto_80140 ) ( not ( = ?auto_80140 ?auto_80139 ) ) ( not ( = ?auto_80140 ?auto_80137 ) ) ( not ( = ?auto_80140 ?auto_80141 ) ) ( not ( = ?auto_80140 ?auto_80136 ) ) ( not ( = ?auto_80140 ?auto_80135 ) ) ( not ( = ?auto_80139 ?auto_80137 ) ) ( not ( = ?auto_80139 ?auto_80141 ) ) ( not ( = ?auto_80139 ?auto_80136 ) ) ( not ( = ?auto_80139 ?auto_80135 ) ) ( not ( = ?auto_80137 ?auto_80141 ) ) ( not ( = ?auto_80137 ?auto_80136 ) ) ( not ( = ?auto_80137 ?auto_80135 ) ) ( not ( = ?auto_80134 ?auto_80140 ) ) ( not ( = ?auto_80134 ?auto_80139 ) ) ( not ( = ?auto_80134 ?auto_80137 ) ) ( ON ?auto_80134 ?auto_80138 ) ( not ( = ?auto_80134 ?auto_80138 ) ) ( not ( = ?auto_80135 ?auto_80138 ) ) ( not ( = ?auto_80136 ?auto_80138 ) ) ( not ( = ?auto_80141 ?auto_80138 ) ) ( not ( = ?auto_80140 ?auto_80138 ) ) ( not ( = ?auto_80139 ?auto_80138 ) ) ( not ( = ?auto_80137 ?auto_80138 ) ) ( ON ?auto_80135 ?auto_80134 ) ( ON-TABLE ?auto_80138 ) ( ON ?auto_80136 ?auto_80135 ) ( ON ?auto_80141 ?auto_80136 ) ( CLEAR ?auto_80141 ) ( HOLDING ?auto_80137 ) ( CLEAR ?auto_80139 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80140 ?auto_80139 ?auto_80137 )
      ( MAKE-3PILE ?auto_80134 ?auto_80135 ?auto_80136 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80142 - BLOCK
      ?auto_80143 - BLOCK
      ?auto_80144 - BLOCK
    )
    :vars
    (
      ?auto_80149 - BLOCK
      ?auto_80145 - BLOCK
      ?auto_80148 - BLOCK
      ?auto_80146 - BLOCK
      ?auto_80147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80142 ?auto_80143 ) ) ( not ( = ?auto_80142 ?auto_80144 ) ) ( not ( = ?auto_80143 ?auto_80144 ) ) ( not ( = ?auto_80142 ?auto_80149 ) ) ( not ( = ?auto_80143 ?auto_80149 ) ) ( not ( = ?auto_80144 ?auto_80149 ) ) ( ON-TABLE ?auto_80145 ) ( ON ?auto_80148 ?auto_80145 ) ( not ( = ?auto_80145 ?auto_80148 ) ) ( not ( = ?auto_80145 ?auto_80146 ) ) ( not ( = ?auto_80145 ?auto_80149 ) ) ( not ( = ?auto_80145 ?auto_80144 ) ) ( not ( = ?auto_80145 ?auto_80143 ) ) ( not ( = ?auto_80148 ?auto_80146 ) ) ( not ( = ?auto_80148 ?auto_80149 ) ) ( not ( = ?auto_80148 ?auto_80144 ) ) ( not ( = ?auto_80148 ?auto_80143 ) ) ( not ( = ?auto_80146 ?auto_80149 ) ) ( not ( = ?auto_80146 ?auto_80144 ) ) ( not ( = ?auto_80146 ?auto_80143 ) ) ( not ( = ?auto_80142 ?auto_80145 ) ) ( not ( = ?auto_80142 ?auto_80148 ) ) ( not ( = ?auto_80142 ?auto_80146 ) ) ( ON ?auto_80142 ?auto_80147 ) ( not ( = ?auto_80142 ?auto_80147 ) ) ( not ( = ?auto_80143 ?auto_80147 ) ) ( not ( = ?auto_80144 ?auto_80147 ) ) ( not ( = ?auto_80149 ?auto_80147 ) ) ( not ( = ?auto_80145 ?auto_80147 ) ) ( not ( = ?auto_80148 ?auto_80147 ) ) ( not ( = ?auto_80146 ?auto_80147 ) ) ( ON ?auto_80143 ?auto_80142 ) ( ON-TABLE ?auto_80147 ) ( ON ?auto_80144 ?auto_80143 ) ( ON ?auto_80149 ?auto_80144 ) ( CLEAR ?auto_80148 ) ( ON ?auto_80146 ?auto_80149 ) ( CLEAR ?auto_80146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80147 ?auto_80142 ?auto_80143 ?auto_80144 ?auto_80149 )
      ( MAKE-3PILE ?auto_80142 ?auto_80143 ?auto_80144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80150 - BLOCK
      ?auto_80151 - BLOCK
      ?auto_80152 - BLOCK
    )
    :vars
    (
      ?auto_80154 - BLOCK
      ?auto_80157 - BLOCK
      ?auto_80155 - BLOCK
      ?auto_80153 - BLOCK
      ?auto_80156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80150 ?auto_80151 ) ) ( not ( = ?auto_80150 ?auto_80152 ) ) ( not ( = ?auto_80151 ?auto_80152 ) ) ( not ( = ?auto_80150 ?auto_80154 ) ) ( not ( = ?auto_80151 ?auto_80154 ) ) ( not ( = ?auto_80152 ?auto_80154 ) ) ( ON-TABLE ?auto_80157 ) ( not ( = ?auto_80157 ?auto_80155 ) ) ( not ( = ?auto_80157 ?auto_80153 ) ) ( not ( = ?auto_80157 ?auto_80154 ) ) ( not ( = ?auto_80157 ?auto_80152 ) ) ( not ( = ?auto_80157 ?auto_80151 ) ) ( not ( = ?auto_80155 ?auto_80153 ) ) ( not ( = ?auto_80155 ?auto_80154 ) ) ( not ( = ?auto_80155 ?auto_80152 ) ) ( not ( = ?auto_80155 ?auto_80151 ) ) ( not ( = ?auto_80153 ?auto_80154 ) ) ( not ( = ?auto_80153 ?auto_80152 ) ) ( not ( = ?auto_80153 ?auto_80151 ) ) ( not ( = ?auto_80150 ?auto_80157 ) ) ( not ( = ?auto_80150 ?auto_80155 ) ) ( not ( = ?auto_80150 ?auto_80153 ) ) ( ON ?auto_80150 ?auto_80156 ) ( not ( = ?auto_80150 ?auto_80156 ) ) ( not ( = ?auto_80151 ?auto_80156 ) ) ( not ( = ?auto_80152 ?auto_80156 ) ) ( not ( = ?auto_80154 ?auto_80156 ) ) ( not ( = ?auto_80157 ?auto_80156 ) ) ( not ( = ?auto_80155 ?auto_80156 ) ) ( not ( = ?auto_80153 ?auto_80156 ) ) ( ON ?auto_80151 ?auto_80150 ) ( ON-TABLE ?auto_80156 ) ( ON ?auto_80152 ?auto_80151 ) ( ON ?auto_80154 ?auto_80152 ) ( ON ?auto_80153 ?auto_80154 ) ( CLEAR ?auto_80153 ) ( HOLDING ?auto_80155 ) ( CLEAR ?auto_80157 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80157 ?auto_80155 )
      ( MAKE-3PILE ?auto_80150 ?auto_80151 ?auto_80152 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80158 - BLOCK
      ?auto_80159 - BLOCK
      ?auto_80160 - BLOCK
    )
    :vars
    (
      ?auto_80165 - BLOCK
      ?auto_80161 - BLOCK
      ?auto_80162 - BLOCK
      ?auto_80163 - BLOCK
      ?auto_80164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80158 ?auto_80159 ) ) ( not ( = ?auto_80158 ?auto_80160 ) ) ( not ( = ?auto_80159 ?auto_80160 ) ) ( not ( = ?auto_80158 ?auto_80165 ) ) ( not ( = ?auto_80159 ?auto_80165 ) ) ( not ( = ?auto_80160 ?auto_80165 ) ) ( ON-TABLE ?auto_80161 ) ( not ( = ?auto_80161 ?auto_80162 ) ) ( not ( = ?auto_80161 ?auto_80163 ) ) ( not ( = ?auto_80161 ?auto_80165 ) ) ( not ( = ?auto_80161 ?auto_80160 ) ) ( not ( = ?auto_80161 ?auto_80159 ) ) ( not ( = ?auto_80162 ?auto_80163 ) ) ( not ( = ?auto_80162 ?auto_80165 ) ) ( not ( = ?auto_80162 ?auto_80160 ) ) ( not ( = ?auto_80162 ?auto_80159 ) ) ( not ( = ?auto_80163 ?auto_80165 ) ) ( not ( = ?auto_80163 ?auto_80160 ) ) ( not ( = ?auto_80163 ?auto_80159 ) ) ( not ( = ?auto_80158 ?auto_80161 ) ) ( not ( = ?auto_80158 ?auto_80162 ) ) ( not ( = ?auto_80158 ?auto_80163 ) ) ( ON ?auto_80158 ?auto_80164 ) ( not ( = ?auto_80158 ?auto_80164 ) ) ( not ( = ?auto_80159 ?auto_80164 ) ) ( not ( = ?auto_80160 ?auto_80164 ) ) ( not ( = ?auto_80165 ?auto_80164 ) ) ( not ( = ?auto_80161 ?auto_80164 ) ) ( not ( = ?auto_80162 ?auto_80164 ) ) ( not ( = ?auto_80163 ?auto_80164 ) ) ( ON ?auto_80159 ?auto_80158 ) ( ON-TABLE ?auto_80164 ) ( ON ?auto_80160 ?auto_80159 ) ( ON ?auto_80165 ?auto_80160 ) ( ON ?auto_80163 ?auto_80165 ) ( CLEAR ?auto_80161 ) ( ON ?auto_80162 ?auto_80163 ) ( CLEAR ?auto_80162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80164 ?auto_80158 ?auto_80159 ?auto_80160 ?auto_80165 ?auto_80163 )
      ( MAKE-3PILE ?auto_80158 ?auto_80159 ?auto_80160 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80166 - BLOCK
      ?auto_80167 - BLOCK
      ?auto_80168 - BLOCK
    )
    :vars
    (
      ?auto_80173 - BLOCK
      ?auto_80172 - BLOCK
      ?auto_80171 - BLOCK
      ?auto_80169 - BLOCK
      ?auto_80170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80166 ?auto_80167 ) ) ( not ( = ?auto_80166 ?auto_80168 ) ) ( not ( = ?auto_80167 ?auto_80168 ) ) ( not ( = ?auto_80166 ?auto_80173 ) ) ( not ( = ?auto_80167 ?auto_80173 ) ) ( not ( = ?auto_80168 ?auto_80173 ) ) ( not ( = ?auto_80172 ?auto_80171 ) ) ( not ( = ?auto_80172 ?auto_80169 ) ) ( not ( = ?auto_80172 ?auto_80173 ) ) ( not ( = ?auto_80172 ?auto_80168 ) ) ( not ( = ?auto_80172 ?auto_80167 ) ) ( not ( = ?auto_80171 ?auto_80169 ) ) ( not ( = ?auto_80171 ?auto_80173 ) ) ( not ( = ?auto_80171 ?auto_80168 ) ) ( not ( = ?auto_80171 ?auto_80167 ) ) ( not ( = ?auto_80169 ?auto_80173 ) ) ( not ( = ?auto_80169 ?auto_80168 ) ) ( not ( = ?auto_80169 ?auto_80167 ) ) ( not ( = ?auto_80166 ?auto_80172 ) ) ( not ( = ?auto_80166 ?auto_80171 ) ) ( not ( = ?auto_80166 ?auto_80169 ) ) ( ON ?auto_80166 ?auto_80170 ) ( not ( = ?auto_80166 ?auto_80170 ) ) ( not ( = ?auto_80167 ?auto_80170 ) ) ( not ( = ?auto_80168 ?auto_80170 ) ) ( not ( = ?auto_80173 ?auto_80170 ) ) ( not ( = ?auto_80172 ?auto_80170 ) ) ( not ( = ?auto_80171 ?auto_80170 ) ) ( not ( = ?auto_80169 ?auto_80170 ) ) ( ON ?auto_80167 ?auto_80166 ) ( ON-TABLE ?auto_80170 ) ( ON ?auto_80168 ?auto_80167 ) ( ON ?auto_80173 ?auto_80168 ) ( ON ?auto_80169 ?auto_80173 ) ( ON ?auto_80171 ?auto_80169 ) ( CLEAR ?auto_80171 ) ( HOLDING ?auto_80172 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80172 )
      ( MAKE-3PILE ?auto_80166 ?auto_80167 ?auto_80168 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80174 - BLOCK
      ?auto_80175 - BLOCK
      ?auto_80176 - BLOCK
    )
    :vars
    (
      ?auto_80180 - BLOCK
      ?auto_80178 - BLOCK
      ?auto_80179 - BLOCK
      ?auto_80181 - BLOCK
      ?auto_80177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80174 ?auto_80175 ) ) ( not ( = ?auto_80174 ?auto_80176 ) ) ( not ( = ?auto_80175 ?auto_80176 ) ) ( not ( = ?auto_80174 ?auto_80180 ) ) ( not ( = ?auto_80175 ?auto_80180 ) ) ( not ( = ?auto_80176 ?auto_80180 ) ) ( not ( = ?auto_80178 ?auto_80179 ) ) ( not ( = ?auto_80178 ?auto_80181 ) ) ( not ( = ?auto_80178 ?auto_80180 ) ) ( not ( = ?auto_80178 ?auto_80176 ) ) ( not ( = ?auto_80178 ?auto_80175 ) ) ( not ( = ?auto_80179 ?auto_80181 ) ) ( not ( = ?auto_80179 ?auto_80180 ) ) ( not ( = ?auto_80179 ?auto_80176 ) ) ( not ( = ?auto_80179 ?auto_80175 ) ) ( not ( = ?auto_80181 ?auto_80180 ) ) ( not ( = ?auto_80181 ?auto_80176 ) ) ( not ( = ?auto_80181 ?auto_80175 ) ) ( not ( = ?auto_80174 ?auto_80178 ) ) ( not ( = ?auto_80174 ?auto_80179 ) ) ( not ( = ?auto_80174 ?auto_80181 ) ) ( ON ?auto_80174 ?auto_80177 ) ( not ( = ?auto_80174 ?auto_80177 ) ) ( not ( = ?auto_80175 ?auto_80177 ) ) ( not ( = ?auto_80176 ?auto_80177 ) ) ( not ( = ?auto_80180 ?auto_80177 ) ) ( not ( = ?auto_80178 ?auto_80177 ) ) ( not ( = ?auto_80179 ?auto_80177 ) ) ( not ( = ?auto_80181 ?auto_80177 ) ) ( ON ?auto_80175 ?auto_80174 ) ( ON-TABLE ?auto_80177 ) ( ON ?auto_80176 ?auto_80175 ) ( ON ?auto_80180 ?auto_80176 ) ( ON ?auto_80181 ?auto_80180 ) ( ON ?auto_80179 ?auto_80181 ) ( ON ?auto_80178 ?auto_80179 ) ( CLEAR ?auto_80178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80177 ?auto_80174 ?auto_80175 ?auto_80176 ?auto_80180 ?auto_80181 ?auto_80179 )
      ( MAKE-3PILE ?auto_80174 ?auto_80175 ?auto_80176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80185 - BLOCK
      ?auto_80186 - BLOCK
      ?auto_80187 - BLOCK
    )
    :vars
    (
      ?auto_80188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80188 ?auto_80187 ) ( CLEAR ?auto_80188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80185 ) ( ON ?auto_80186 ?auto_80185 ) ( ON ?auto_80187 ?auto_80186 ) ( not ( = ?auto_80185 ?auto_80186 ) ) ( not ( = ?auto_80185 ?auto_80187 ) ) ( not ( = ?auto_80185 ?auto_80188 ) ) ( not ( = ?auto_80186 ?auto_80187 ) ) ( not ( = ?auto_80186 ?auto_80188 ) ) ( not ( = ?auto_80187 ?auto_80188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80188 ?auto_80187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80189 - BLOCK
      ?auto_80190 - BLOCK
      ?auto_80191 - BLOCK
    )
    :vars
    (
      ?auto_80192 - BLOCK
      ?auto_80193 - BLOCK
      ?auto_80194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80192 ?auto_80191 ) ( CLEAR ?auto_80192 ) ( ON-TABLE ?auto_80189 ) ( ON ?auto_80190 ?auto_80189 ) ( ON ?auto_80191 ?auto_80190 ) ( not ( = ?auto_80189 ?auto_80190 ) ) ( not ( = ?auto_80189 ?auto_80191 ) ) ( not ( = ?auto_80189 ?auto_80192 ) ) ( not ( = ?auto_80190 ?auto_80191 ) ) ( not ( = ?auto_80190 ?auto_80192 ) ) ( not ( = ?auto_80191 ?auto_80192 ) ) ( HOLDING ?auto_80193 ) ( CLEAR ?auto_80194 ) ( not ( = ?auto_80189 ?auto_80193 ) ) ( not ( = ?auto_80189 ?auto_80194 ) ) ( not ( = ?auto_80190 ?auto_80193 ) ) ( not ( = ?auto_80190 ?auto_80194 ) ) ( not ( = ?auto_80191 ?auto_80193 ) ) ( not ( = ?auto_80191 ?auto_80194 ) ) ( not ( = ?auto_80192 ?auto_80193 ) ) ( not ( = ?auto_80192 ?auto_80194 ) ) ( not ( = ?auto_80193 ?auto_80194 ) ) )
    :subtasks
    ( ( !STACK ?auto_80193 ?auto_80194 )
      ( MAKE-3PILE ?auto_80189 ?auto_80190 ?auto_80191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80195 - BLOCK
      ?auto_80196 - BLOCK
      ?auto_80197 - BLOCK
    )
    :vars
    (
      ?auto_80200 - BLOCK
      ?auto_80198 - BLOCK
      ?auto_80199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80200 ?auto_80197 ) ( ON-TABLE ?auto_80195 ) ( ON ?auto_80196 ?auto_80195 ) ( ON ?auto_80197 ?auto_80196 ) ( not ( = ?auto_80195 ?auto_80196 ) ) ( not ( = ?auto_80195 ?auto_80197 ) ) ( not ( = ?auto_80195 ?auto_80200 ) ) ( not ( = ?auto_80196 ?auto_80197 ) ) ( not ( = ?auto_80196 ?auto_80200 ) ) ( not ( = ?auto_80197 ?auto_80200 ) ) ( CLEAR ?auto_80198 ) ( not ( = ?auto_80195 ?auto_80199 ) ) ( not ( = ?auto_80195 ?auto_80198 ) ) ( not ( = ?auto_80196 ?auto_80199 ) ) ( not ( = ?auto_80196 ?auto_80198 ) ) ( not ( = ?auto_80197 ?auto_80199 ) ) ( not ( = ?auto_80197 ?auto_80198 ) ) ( not ( = ?auto_80200 ?auto_80199 ) ) ( not ( = ?auto_80200 ?auto_80198 ) ) ( not ( = ?auto_80199 ?auto_80198 ) ) ( ON ?auto_80199 ?auto_80200 ) ( CLEAR ?auto_80199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80195 ?auto_80196 ?auto_80197 ?auto_80200 )
      ( MAKE-3PILE ?auto_80195 ?auto_80196 ?auto_80197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80201 - BLOCK
      ?auto_80202 - BLOCK
      ?auto_80203 - BLOCK
    )
    :vars
    (
      ?auto_80206 - BLOCK
      ?auto_80205 - BLOCK
      ?auto_80204 - BLOCK
      ?auto_80207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80206 ?auto_80203 ) ( ON-TABLE ?auto_80201 ) ( ON ?auto_80202 ?auto_80201 ) ( ON ?auto_80203 ?auto_80202 ) ( not ( = ?auto_80201 ?auto_80202 ) ) ( not ( = ?auto_80201 ?auto_80203 ) ) ( not ( = ?auto_80201 ?auto_80206 ) ) ( not ( = ?auto_80202 ?auto_80203 ) ) ( not ( = ?auto_80202 ?auto_80206 ) ) ( not ( = ?auto_80203 ?auto_80206 ) ) ( not ( = ?auto_80201 ?auto_80205 ) ) ( not ( = ?auto_80201 ?auto_80204 ) ) ( not ( = ?auto_80202 ?auto_80205 ) ) ( not ( = ?auto_80202 ?auto_80204 ) ) ( not ( = ?auto_80203 ?auto_80205 ) ) ( not ( = ?auto_80203 ?auto_80204 ) ) ( not ( = ?auto_80206 ?auto_80205 ) ) ( not ( = ?auto_80206 ?auto_80204 ) ) ( not ( = ?auto_80205 ?auto_80204 ) ) ( ON ?auto_80205 ?auto_80206 ) ( CLEAR ?auto_80205 ) ( HOLDING ?auto_80204 ) ( CLEAR ?auto_80207 ) ( ON-TABLE ?auto_80207 ) ( not ( = ?auto_80207 ?auto_80204 ) ) ( not ( = ?auto_80201 ?auto_80207 ) ) ( not ( = ?auto_80202 ?auto_80207 ) ) ( not ( = ?auto_80203 ?auto_80207 ) ) ( not ( = ?auto_80206 ?auto_80207 ) ) ( not ( = ?auto_80205 ?auto_80207 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80207 ?auto_80204 )
      ( MAKE-3PILE ?auto_80201 ?auto_80202 ?auto_80203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80208 - BLOCK
      ?auto_80209 - BLOCK
      ?auto_80210 - BLOCK
    )
    :vars
    (
      ?auto_80214 - BLOCK
      ?auto_80213 - BLOCK
      ?auto_80212 - BLOCK
      ?auto_80211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80214 ?auto_80210 ) ( ON-TABLE ?auto_80208 ) ( ON ?auto_80209 ?auto_80208 ) ( ON ?auto_80210 ?auto_80209 ) ( not ( = ?auto_80208 ?auto_80209 ) ) ( not ( = ?auto_80208 ?auto_80210 ) ) ( not ( = ?auto_80208 ?auto_80214 ) ) ( not ( = ?auto_80209 ?auto_80210 ) ) ( not ( = ?auto_80209 ?auto_80214 ) ) ( not ( = ?auto_80210 ?auto_80214 ) ) ( not ( = ?auto_80208 ?auto_80213 ) ) ( not ( = ?auto_80208 ?auto_80212 ) ) ( not ( = ?auto_80209 ?auto_80213 ) ) ( not ( = ?auto_80209 ?auto_80212 ) ) ( not ( = ?auto_80210 ?auto_80213 ) ) ( not ( = ?auto_80210 ?auto_80212 ) ) ( not ( = ?auto_80214 ?auto_80213 ) ) ( not ( = ?auto_80214 ?auto_80212 ) ) ( not ( = ?auto_80213 ?auto_80212 ) ) ( ON ?auto_80213 ?auto_80214 ) ( CLEAR ?auto_80211 ) ( ON-TABLE ?auto_80211 ) ( not ( = ?auto_80211 ?auto_80212 ) ) ( not ( = ?auto_80208 ?auto_80211 ) ) ( not ( = ?auto_80209 ?auto_80211 ) ) ( not ( = ?auto_80210 ?auto_80211 ) ) ( not ( = ?auto_80214 ?auto_80211 ) ) ( not ( = ?auto_80213 ?auto_80211 ) ) ( ON ?auto_80212 ?auto_80213 ) ( CLEAR ?auto_80212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80208 ?auto_80209 ?auto_80210 ?auto_80214 ?auto_80213 )
      ( MAKE-3PILE ?auto_80208 ?auto_80209 ?auto_80210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80215 - BLOCK
      ?auto_80216 - BLOCK
      ?auto_80217 - BLOCK
    )
    :vars
    (
      ?auto_80219 - BLOCK
      ?auto_80220 - BLOCK
      ?auto_80221 - BLOCK
      ?auto_80218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80219 ?auto_80217 ) ( ON-TABLE ?auto_80215 ) ( ON ?auto_80216 ?auto_80215 ) ( ON ?auto_80217 ?auto_80216 ) ( not ( = ?auto_80215 ?auto_80216 ) ) ( not ( = ?auto_80215 ?auto_80217 ) ) ( not ( = ?auto_80215 ?auto_80219 ) ) ( not ( = ?auto_80216 ?auto_80217 ) ) ( not ( = ?auto_80216 ?auto_80219 ) ) ( not ( = ?auto_80217 ?auto_80219 ) ) ( not ( = ?auto_80215 ?auto_80220 ) ) ( not ( = ?auto_80215 ?auto_80221 ) ) ( not ( = ?auto_80216 ?auto_80220 ) ) ( not ( = ?auto_80216 ?auto_80221 ) ) ( not ( = ?auto_80217 ?auto_80220 ) ) ( not ( = ?auto_80217 ?auto_80221 ) ) ( not ( = ?auto_80219 ?auto_80220 ) ) ( not ( = ?auto_80219 ?auto_80221 ) ) ( not ( = ?auto_80220 ?auto_80221 ) ) ( ON ?auto_80220 ?auto_80219 ) ( not ( = ?auto_80218 ?auto_80221 ) ) ( not ( = ?auto_80215 ?auto_80218 ) ) ( not ( = ?auto_80216 ?auto_80218 ) ) ( not ( = ?auto_80217 ?auto_80218 ) ) ( not ( = ?auto_80219 ?auto_80218 ) ) ( not ( = ?auto_80220 ?auto_80218 ) ) ( ON ?auto_80221 ?auto_80220 ) ( CLEAR ?auto_80221 ) ( HOLDING ?auto_80218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80218 )
      ( MAKE-3PILE ?auto_80215 ?auto_80216 ?auto_80217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80222 - BLOCK
      ?auto_80223 - BLOCK
      ?auto_80224 - BLOCK
    )
    :vars
    (
      ?auto_80225 - BLOCK
      ?auto_80227 - BLOCK
      ?auto_80228 - BLOCK
      ?auto_80226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80225 ?auto_80224 ) ( ON-TABLE ?auto_80222 ) ( ON ?auto_80223 ?auto_80222 ) ( ON ?auto_80224 ?auto_80223 ) ( not ( = ?auto_80222 ?auto_80223 ) ) ( not ( = ?auto_80222 ?auto_80224 ) ) ( not ( = ?auto_80222 ?auto_80225 ) ) ( not ( = ?auto_80223 ?auto_80224 ) ) ( not ( = ?auto_80223 ?auto_80225 ) ) ( not ( = ?auto_80224 ?auto_80225 ) ) ( not ( = ?auto_80222 ?auto_80227 ) ) ( not ( = ?auto_80222 ?auto_80228 ) ) ( not ( = ?auto_80223 ?auto_80227 ) ) ( not ( = ?auto_80223 ?auto_80228 ) ) ( not ( = ?auto_80224 ?auto_80227 ) ) ( not ( = ?auto_80224 ?auto_80228 ) ) ( not ( = ?auto_80225 ?auto_80227 ) ) ( not ( = ?auto_80225 ?auto_80228 ) ) ( not ( = ?auto_80227 ?auto_80228 ) ) ( ON ?auto_80227 ?auto_80225 ) ( not ( = ?auto_80226 ?auto_80228 ) ) ( not ( = ?auto_80222 ?auto_80226 ) ) ( not ( = ?auto_80223 ?auto_80226 ) ) ( not ( = ?auto_80224 ?auto_80226 ) ) ( not ( = ?auto_80225 ?auto_80226 ) ) ( not ( = ?auto_80227 ?auto_80226 ) ) ( ON ?auto_80228 ?auto_80227 ) ( ON ?auto_80226 ?auto_80228 ) ( CLEAR ?auto_80226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80222 ?auto_80223 ?auto_80224 ?auto_80225 ?auto_80227 ?auto_80228 )
      ( MAKE-3PILE ?auto_80222 ?auto_80223 ?auto_80224 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80229 - BLOCK
      ?auto_80230 - BLOCK
      ?auto_80231 - BLOCK
    )
    :vars
    (
      ?auto_80232 - BLOCK
      ?auto_80233 - BLOCK
      ?auto_80235 - BLOCK
      ?auto_80234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80232 ?auto_80231 ) ( ON-TABLE ?auto_80229 ) ( ON ?auto_80230 ?auto_80229 ) ( ON ?auto_80231 ?auto_80230 ) ( not ( = ?auto_80229 ?auto_80230 ) ) ( not ( = ?auto_80229 ?auto_80231 ) ) ( not ( = ?auto_80229 ?auto_80232 ) ) ( not ( = ?auto_80230 ?auto_80231 ) ) ( not ( = ?auto_80230 ?auto_80232 ) ) ( not ( = ?auto_80231 ?auto_80232 ) ) ( not ( = ?auto_80229 ?auto_80233 ) ) ( not ( = ?auto_80229 ?auto_80235 ) ) ( not ( = ?auto_80230 ?auto_80233 ) ) ( not ( = ?auto_80230 ?auto_80235 ) ) ( not ( = ?auto_80231 ?auto_80233 ) ) ( not ( = ?auto_80231 ?auto_80235 ) ) ( not ( = ?auto_80232 ?auto_80233 ) ) ( not ( = ?auto_80232 ?auto_80235 ) ) ( not ( = ?auto_80233 ?auto_80235 ) ) ( ON ?auto_80233 ?auto_80232 ) ( not ( = ?auto_80234 ?auto_80235 ) ) ( not ( = ?auto_80229 ?auto_80234 ) ) ( not ( = ?auto_80230 ?auto_80234 ) ) ( not ( = ?auto_80231 ?auto_80234 ) ) ( not ( = ?auto_80232 ?auto_80234 ) ) ( not ( = ?auto_80233 ?auto_80234 ) ) ( ON ?auto_80235 ?auto_80233 ) ( HOLDING ?auto_80234 ) ( CLEAR ?auto_80235 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80229 ?auto_80230 ?auto_80231 ?auto_80232 ?auto_80233 ?auto_80235 ?auto_80234 )
      ( MAKE-3PILE ?auto_80229 ?auto_80230 ?auto_80231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80236 - BLOCK
      ?auto_80237 - BLOCK
      ?auto_80238 - BLOCK
    )
    :vars
    (
      ?auto_80239 - BLOCK
      ?auto_80241 - BLOCK
      ?auto_80242 - BLOCK
      ?auto_80240 - BLOCK
      ?auto_80243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80239 ?auto_80238 ) ( ON-TABLE ?auto_80236 ) ( ON ?auto_80237 ?auto_80236 ) ( ON ?auto_80238 ?auto_80237 ) ( not ( = ?auto_80236 ?auto_80237 ) ) ( not ( = ?auto_80236 ?auto_80238 ) ) ( not ( = ?auto_80236 ?auto_80239 ) ) ( not ( = ?auto_80237 ?auto_80238 ) ) ( not ( = ?auto_80237 ?auto_80239 ) ) ( not ( = ?auto_80238 ?auto_80239 ) ) ( not ( = ?auto_80236 ?auto_80241 ) ) ( not ( = ?auto_80236 ?auto_80242 ) ) ( not ( = ?auto_80237 ?auto_80241 ) ) ( not ( = ?auto_80237 ?auto_80242 ) ) ( not ( = ?auto_80238 ?auto_80241 ) ) ( not ( = ?auto_80238 ?auto_80242 ) ) ( not ( = ?auto_80239 ?auto_80241 ) ) ( not ( = ?auto_80239 ?auto_80242 ) ) ( not ( = ?auto_80241 ?auto_80242 ) ) ( ON ?auto_80241 ?auto_80239 ) ( not ( = ?auto_80240 ?auto_80242 ) ) ( not ( = ?auto_80236 ?auto_80240 ) ) ( not ( = ?auto_80237 ?auto_80240 ) ) ( not ( = ?auto_80238 ?auto_80240 ) ) ( not ( = ?auto_80239 ?auto_80240 ) ) ( not ( = ?auto_80241 ?auto_80240 ) ) ( ON ?auto_80242 ?auto_80241 ) ( CLEAR ?auto_80242 ) ( ON ?auto_80240 ?auto_80243 ) ( CLEAR ?auto_80240 ) ( HAND-EMPTY ) ( not ( = ?auto_80236 ?auto_80243 ) ) ( not ( = ?auto_80237 ?auto_80243 ) ) ( not ( = ?auto_80238 ?auto_80243 ) ) ( not ( = ?auto_80239 ?auto_80243 ) ) ( not ( = ?auto_80241 ?auto_80243 ) ) ( not ( = ?auto_80242 ?auto_80243 ) ) ( not ( = ?auto_80240 ?auto_80243 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80240 ?auto_80243 )
      ( MAKE-3PILE ?auto_80236 ?auto_80237 ?auto_80238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80244 - BLOCK
      ?auto_80245 - BLOCK
      ?auto_80246 - BLOCK
    )
    :vars
    (
      ?auto_80250 - BLOCK
      ?auto_80249 - BLOCK
      ?auto_80247 - BLOCK
      ?auto_80251 - BLOCK
      ?auto_80248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80250 ?auto_80246 ) ( ON-TABLE ?auto_80244 ) ( ON ?auto_80245 ?auto_80244 ) ( ON ?auto_80246 ?auto_80245 ) ( not ( = ?auto_80244 ?auto_80245 ) ) ( not ( = ?auto_80244 ?auto_80246 ) ) ( not ( = ?auto_80244 ?auto_80250 ) ) ( not ( = ?auto_80245 ?auto_80246 ) ) ( not ( = ?auto_80245 ?auto_80250 ) ) ( not ( = ?auto_80246 ?auto_80250 ) ) ( not ( = ?auto_80244 ?auto_80249 ) ) ( not ( = ?auto_80244 ?auto_80247 ) ) ( not ( = ?auto_80245 ?auto_80249 ) ) ( not ( = ?auto_80245 ?auto_80247 ) ) ( not ( = ?auto_80246 ?auto_80249 ) ) ( not ( = ?auto_80246 ?auto_80247 ) ) ( not ( = ?auto_80250 ?auto_80249 ) ) ( not ( = ?auto_80250 ?auto_80247 ) ) ( not ( = ?auto_80249 ?auto_80247 ) ) ( ON ?auto_80249 ?auto_80250 ) ( not ( = ?auto_80251 ?auto_80247 ) ) ( not ( = ?auto_80244 ?auto_80251 ) ) ( not ( = ?auto_80245 ?auto_80251 ) ) ( not ( = ?auto_80246 ?auto_80251 ) ) ( not ( = ?auto_80250 ?auto_80251 ) ) ( not ( = ?auto_80249 ?auto_80251 ) ) ( ON ?auto_80251 ?auto_80248 ) ( CLEAR ?auto_80251 ) ( not ( = ?auto_80244 ?auto_80248 ) ) ( not ( = ?auto_80245 ?auto_80248 ) ) ( not ( = ?auto_80246 ?auto_80248 ) ) ( not ( = ?auto_80250 ?auto_80248 ) ) ( not ( = ?auto_80249 ?auto_80248 ) ) ( not ( = ?auto_80247 ?auto_80248 ) ) ( not ( = ?auto_80251 ?auto_80248 ) ) ( HOLDING ?auto_80247 ) ( CLEAR ?auto_80249 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80244 ?auto_80245 ?auto_80246 ?auto_80250 ?auto_80249 ?auto_80247 )
      ( MAKE-3PILE ?auto_80244 ?auto_80245 ?auto_80246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80252 - BLOCK
      ?auto_80253 - BLOCK
      ?auto_80254 - BLOCK
    )
    :vars
    (
      ?auto_80256 - BLOCK
      ?auto_80255 - BLOCK
      ?auto_80258 - BLOCK
      ?auto_80259 - BLOCK
      ?auto_80257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80256 ?auto_80254 ) ( ON-TABLE ?auto_80252 ) ( ON ?auto_80253 ?auto_80252 ) ( ON ?auto_80254 ?auto_80253 ) ( not ( = ?auto_80252 ?auto_80253 ) ) ( not ( = ?auto_80252 ?auto_80254 ) ) ( not ( = ?auto_80252 ?auto_80256 ) ) ( not ( = ?auto_80253 ?auto_80254 ) ) ( not ( = ?auto_80253 ?auto_80256 ) ) ( not ( = ?auto_80254 ?auto_80256 ) ) ( not ( = ?auto_80252 ?auto_80255 ) ) ( not ( = ?auto_80252 ?auto_80258 ) ) ( not ( = ?auto_80253 ?auto_80255 ) ) ( not ( = ?auto_80253 ?auto_80258 ) ) ( not ( = ?auto_80254 ?auto_80255 ) ) ( not ( = ?auto_80254 ?auto_80258 ) ) ( not ( = ?auto_80256 ?auto_80255 ) ) ( not ( = ?auto_80256 ?auto_80258 ) ) ( not ( = ?auto_80255 ?auto_80258 ) ) ( ON ?auto_80255 ?auto_80256 ) ( not ( = ?auto_80259 ?auto_80258 ) ) ( not ( = ?auto_80252 ?auto_80259 ) ) ( not ( = ?auto_80253 ?auto_80259 ) ) ( not ( = ?auto_80254 ?auto_80259 ) ) ( not ( = ?auto_80256 ?auto_80259 ) ) ( not ( = ?auto_80255 ?auto_80259 ) ) ( ON ?auto_80259 ?auto_80257 ) ( not ( = ?auto_80252 ?auto_80257 ) ) ( not ( = ?auto_80253 ?auto_80257 ) ) ( not ( = ?auto_80254 ?auto_80257 ) ) ( not ( = ?auto_80256 ?auto_80257 ) ) ( not ( = ?auto_80255 ?auto_80257 ) ) ( not ( = ?auto_80258 ?auto_80257 ) ) ( not ( = ?auto_80259 ?auto_80257 ) ) ( CLEAR ?auto_80255 ) ( ON ?auto_80258 ?auto_80259 ) ( CLEAR ?auto_80258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80257 ?auto_80259 )
      ( MAKE-3PILE ?auto_80252 ?auto_80253 ?auto_80254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80260 - BLOCK
      ?auto_80261 - BLOCK
      ?auto_80262 - BLOCK
    )
    :vars
    (
      ?auto_80266 - BLOCK
      ?auto_80263 - BLOCK
      ?auto_80265 - BLOCK
      ?auto_80264 - BLOCK
      ?auto_80267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80266 ?auto_80262 ) ( ON-TABLE ?auto_80260 ) ( ON ?auto_80261 ?auto_80260 ) ( ON ?auto_80262 ?auto_80261 ) ( not ( = ?auto_80260 ?auto_80261 ) ) ( not ( = ?auto_80260 ?auto_80262 ) ) ( not ( = ?auto_80260 ?auto_80266 ) ) ( not ( = ?auto_80261 ?auto_80262 ) ) ( not ( = ?auto_80261 ?auto_80266 ) ) ( not ( = ?auto_80262 ?auto_80266 ) ) ( not ( = ?auto_80260 ?auto_80263 ) ) ( not ( = ?auto_80260 ?auto_80265 ) ) ( not ( = ?auto_80261 ?auto_80263 ) ) ( not ( = ?auto_80261 ?auto_80265 ) ) ( not ( = ?auto_80262 ?auto_80263 ) ) ( not ( = ?auto_80262 ?auto_80265 ) ) ( not ( = ?auto_80266 ?auto_80263 ) ) ( not ( = ?auto_80266 ?auto_80265 ) ) ( not ( = ?auto_80263 ?auto_80265 ) ) ( not ( = ?auto_80264 ?auto_80265 ) ) ( not ( = ?auto_80260 ?auto_80264 ) ) ( not ( = ?auto_80261 ?auto_80264 ) ) ( not ( = ?auto_80262 ?auto_80264 ) ) ( not ( = ?auto_80266 ?auto_80264 ) ) ( not ( = ?auto_80263 ?auto_80264 ) ) ( ON ?auto_80264 ?auto_80267 ) ( not ( = ?auto_80260 ?auto_80267 ) ) ( not ( = ?auto_80261 ?auto_80267 ) ) ( not ( = ?auto_80262 ?auto_80267 ) ) ( not ( = ?auto_80266 ?auto_80267 ) ) ( not ( = ?auto_80263 ?auto_80267 ) ) ( not ( = ?auto_80265 ?auto_80267 ) ) ( not ( = ?auto_80264 ?auto_80267 ) ) ( ON ?auto_80265 ?auto_80264 ) ( CLEAR ?auto_80265 ) ( ON-TABLE ?auto_80267 ) ( HOLDING ?auto_80263 ) ( CLEAR ?auto_80266 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80260 ?auto_80261 ?auto_80262 ?auto_80266 ?auto_80263 )
      ( MAKE-3PILE ?auto_80260 ?auto_80261 ?auto_80262 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80268 - BLOCK
      ?auto_80269 - BLOCK
      ?auto_80270 - BLOCK
    )
    :vars
    (
      ?auto_80274 - BLOCK
      ?auto_80275 - BLOCK
      ?auto_80273 - BLOCK
      ?auto_80271 - BLOCK
      ?auto_80272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80274 ?auto_80270 ) ( ON-TABLE ?auto_80268 ) ( ON ?auto_80269 ?auto_80268 ) ( ON ?auto_80270 ?auto_80269 ) ( not ( = ?auto_80268 ?auto_80269 ) ) ( not ( = ?auto_80268 ?auto_80270 ) ) ( not ( = ?auto_80268 ?auto_80274 ) ) ( not ( = ?auto_80269 ?auto_80270 ) ) ( not ( = ?auto_80269 ?auto_80274 ) ) ( not ( = ?auto_80270 ?auto_80274 ) ) ( not ( = ?auto_80268 ?auto_80275 ) ) ( not ( = ?auto_80268 ?auto_80273 ) ) ( not ( = ?auto_80269 ?auto_80275 ) ) ( not ( = ?auto_80269 ?auto_80273 ) ) ( not ( = ?auto_80270 ?auto_80275 ) ) ( not ( = ?auto_80270 ?auto_80273 ) ) ( not ( = ?auto_80274 ?auto_80275 ) ) ( not ( = ?auto_80274 ?auto_80273 ) ) ( not ( = ?auto_80275 ?auto_80273 ) ) ( not ( = ?auto_80271 ?auto_80273 ) ) ( not ( = ?auto_80268 ?auto_80271 ) ) ( not ( = ?auto_80269 ?auto_80271 ) ) ( not ( = ?auto_80270 ?auto_80271 ) ) ( not ( = ?auto_80274 ?auto_80271 ) ) ( not ( = ?auto_80275 ?auto_80271 ) ) ( ON ?auto_80271 ?auto_80272 ) ( not ( = ?auto_80268 ?auto_80272 ) ) ( not ( = ?auto_80269 ?auto_80272 ) ) ( not ( = ?auto_80270 ?auto_80272 ) ) ( not ( = ?auto_80274 ?auto_80272 ) ) ( not ( = ?auto_80275 ?auto_80272 ) ) ( not ( = ?auto_80273 ?auto_80272 ) ) ( not ( = ?auto_80271 ?auto_80272 ) ) ( ON ?auto_80273 ?auto_80271 ) ( ON-TABLE ?auto_80272 ) ( CLEAR ?auto_80274 ) ( ON ?auto_80275 ?auto_80273 ) ( CLEAR ?auto_80275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80272 ?auto_80271 ?auto_80273 )
      ( MAKE-3PILE ?auto_80268 ?auto_80269 ?auto_80270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80292 - BLOCK
      ?auto_80293 - BLOCK
      ?auto_80294 - BLOCK
    )
    :vars
    (
      ?auto_80295 - BLOCK
      ?auto_80297 - BLOCK
      ?auto_80296 - BLOCK
      ?auto_80299 - BLOCK
      ?auto_80298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80292 ) ( ON ?auto_80293 ?auto_80292 ) ( not ( = ?auto_80292 ?auto_80293 ) ) ( not ( = ?auto_80292 ?auto_80294 ) ) ( not ( = ?auto_80292 ?auto_80295 ) ) ( not ( = ?auto_80293 ?auto_80294 ) ) ( not ( = ?auto_80293 ?auto_80295 ) ) ( not ( = ?auto_80294 ?auto_80295 ) ) ( not ( = ?auto_80292 ?auto_80297 ) ) ( not ( = ?auto_80292 ?auto_80296 ) ) ( not ( = ?auto_80293 ?auto_80297 ) ) ( not ( = ?auto_80293 ?auto_80296 ) ) ( not ( = ?auto_80294 ?auto_80297 ) ) ( not ( = ?auto_80294 ?auto_80296 ) ) ( not ( = ?auto_80295 ?auto_80297 ) ) ( not ( = ?auto_80295 ?auto_80296 ) ) ( not ( = ?auto_80297 ?auto_80296 ) ) ( not ( = ?auto_80299 ?auto_80296 ) ) ( not ( = ?auto_80292 ?auto_80299 ) ) ( not ( = ?auto_80293 ?auto_80299 ) ) ( not ( = ?auto_80294 ?auto_80299 ) ) ( not ( = ?auto_80295 ?auto_80299 ) ) ( not ( = ?auto_80297 ?auto_80299 ) ) ( ON ?auto_80299 ?auto_80298 ) ( not ( = ?auto_80292 ?auto_80298 ) ) ( not ( = ?auto_80293 ?auto_80298 ) ) ( not ( = ?auto_80294 ?auto_80298 ) ) ( not ( = ?auto_80295 ?auto_80298 ) ) ( not ( = ?auto_80297 ?auto_80298 ) ) ( not ( = ?auto_80296 ?auto_80298 ) ) ( not ( = ?auto_80299 ?auto_80298 ) ) ( ON ?auto_80296 ?auto_80299 ) ( ON-TABLE ?auto_80298 ) ( ON ?auto_80297 ?auto_80296 ) ( ON ?auto_80295 ?auto_80297 ) ( CLEAR ?auto_80295 ) ( HOLDING ?auto_80294 ) ( CLEAR ?auto_80293 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80292 ?auto_80293 ?auto_80294 ?auto_80295 )
      ( MAKE-3PILE ?auto_80292 ?auto_80293 ?auto_80294 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80300 - BLOCK
      ?auto_80301 - BLOCK
      ?auto_80302 - BLOCK
    )
    :vars
    (
      ?auto_80303 - BLOCK
      ?auto_80304 - BLOCK
      ?auto_80306 - BLOCK
      ?auto_80305 - BLOCK
      ?auto_80307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80300 ) ( ON ?auto_80301 ?auto_80300 ) ( not ( = ?auto_80300 ?auto_80301 ) ) ( not ( = ?auto_80300 ?auto_80302 ) ) ( not ( = ?auto_80300 ?auto_80303 ) ) ( not ( = ?auto_80301 ?auto_80302 ) ) ( not ( = ?auto_80301 ?auto_80303 ) ) ( not ( = ?auto_80302 ?auto_80303 ) ) ( not ( = ?auto_80300 ?auto_80304 ) ) ( not ( = ?auto_80300 ?auto_80306 ) ) ( not ( = ?auto_80301 ?auto_80304 ) ) ( not ( = ?auto_80301 ?auto_80306 ) ) ( not ( = ?auto_80302 ?auto_80304 ) ) ( not ( = ?auto_80302 ?auto_80306 ) ) ( not ( = ?auto_80303 ?auto_80304 ) ) ( not ( = ?auto_80303 ?auto_80306 ) ) ( not ( = ?auto_80304 ?auto_80306 ) ) ( not ( = ?auto_80305 ?auto_80306 ) ) ( not ( = ?auto_80300 ?auto_80305 ) ) ( not ( = ?auto_80301 ?auto_80305 ) ) ( not ( = ?auto_80302 ?auto_80305 ) ) ( not ( = ?auto_80303 ?auto_80305 ) ) ( not ( = ?auto_80304 ?auto_80305 ) ) ( ON ?auto_80305 ?auto_80307 ) ( not ( = ?auto_80300 ?auto_80307 ) ) ( not ( = ?auto_80301 ?auto_80307 ) ) ( not ( = ?auto_80302 ?auto_80307 ) ) ( not ( = ?auto_80303 ?auto_80307 ) ) ( not ( = ?auto_80304 ?auto_80307 ) ) ( not ( = ?auto_80306 ?auto_80307 ) ) ( not ( = ?auto_80305 ?auto_80307 ) ) ( ON ?auto_80306 ?auto_80305 ) ( ON-TABLE ?auto_80307 ) ( ON ?auto_80304 ?auto_80306 ) ( ON ?auto_80303 ?auto_80304 ) ( CLEAR ?auto_80301 ) ( ON ?auto_80302 ?auto_80303 ) ( CLEAR ?auto_80302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80307 ?auto_80305 ?auto_80306 ?auto_80304 ?auto_80303 )
      ( MAKE-3PILE ?auto_80300 ?auto_80301 ?auto_80302 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80308 - BLOCK
      ?auto_80309 - BLOCK
      ?auto_80310 - BLOCK
    )
    :vars
    (
      ?auto_80314 - BLOCK
      ?auto_80313 - BLOCK
      ?auto_80315 - BLOCK
      ?auto_80311 - BLOCK
      ?auto_80312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80308 ) ( not ( = ?auto_80308 ?auto_80309 ) ) ( not ( = ?auto_80308 ?auto_80310 ) ) ( not ( = ?auto_80308 ?auto_80314 ) ) ( not ( = ?auto_80309 ?auto_80310 ) ) ( not ( = ?auto_80309 ?auto_80314 ) ) ( not ( = ?auto_80310 ?auto_80314 ) ) ( not ( = ?auto_80308 ?auto_80313 ) ) ( not ( = ?auto_80308 ?auto_80315 ) ) ( not ( = ?auto_80309 ?auto_80313 ) ) ( not ( = ?auto_80309 ?auto_80315 ) ) ( not ( = ?auto_80310 ?auto_80313 ) ) ( not ( = ?auto_80310 ?auto_80315 ) ) ( not ( = ?auto_80314 ?auto_80313 ) ) ( not ( = ?auto_80314 ?auto_80315 ) ) ( not ( = ?auto_80313 ?auto_80315 ) ) ( not ( = ?auto_80311 ?auto_80315 ) ) ( not ( = ?auto_80308 ?auto_80311 ) ) ( not ( = ?auto_80309 ?auto_80311 ) ) ( not ( = ?auto_80310 ?auto_80311 ) ) ( not ( = ?auto_80314 ?auto_80311 ) ) ( not ( = ?auto_80313 ?auto_80311 ) ) ( ON ?auto_80311 ?auto_80312 ) ( not ( = ?auto_80308 ?auto_80312 ) ) ( not ( = ?auto_80309 ?auto_80312 ) ) ( not ( = ?auto_80310 ?auto_80312 ) ) ( not ( = ?auto_80314 ?auto_80312 ) ) ( not ( = ?auto_80313 ?auto_80312 ) ) ( not ( = ?auto_80315 ?auto_80312 ) ) ( not ( = ?auto_80311 ?auto_80312 ) ) ( ON ?auto_80315 ?auto_80311 ) ( ON-TABLE ?auto_80312 ) ( ON ?auto_80313 ?auto_80315 ) ( ON ?auto_80314 ?auto_80313 ) ( ON ?auto_80310 ?auto_80314 ) ( CLEAR ?auto_80310 ) ( HOLDING ?auto_80309 ) ( CLEAR ?auto_80308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80308 ?auto_80309 )
      ( MAKE-3PILE ?auto_80308 ?auto_80309 ?auto_80310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80316 - BLOCK
      ?auto_80317 - BLOCK
      ?auto_80318 - BLOCK
    )
    :vars
    (
      ?auto_80320 - BLOCK
      ?auto_80322 - BLOCK
      ?auto_80323 - BLOCK
      ?auto_80319 - BLOCK
      ?auto_80321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80316 ) ( not ( = ?auto_80316 ?auto_80317 ) ) ( not ( = ?auto_80316 ?auto_80318 ) ) ( not ( = ?auto_80316 ?auto_80320 ) ) ( not ( = ?auto_80317 ?auto_80318 ) ) ( not ( = ?auto_80317 ?auto_80320 ) ) ( not ( = ?auto_80318 ?auto_80320 ) ) ( not ( = ?auto_80316 ?auto_80322 ) ) ( not ( = ?auto_80316 ?auto_80323 ) ) ( not ( = ?auto_80317 ?auto_80322 ) ) ( not ( = ?auto_80317 ?auto_80323 ) ) ( not ( = ?auto_80318 ?auto_80322 ) ) ( not ( = ?auto_80318 ?auto_80323 ) ) ( not ( = ?auto_80320 ?auto_80322 ) ) ( not ( = ?auto_80320 ?auto_80323 ) ) ( not ( = ?auto_80322 ?auto_80323 ) ) ( not ( = ?auto_80319 ?auto_80323 ) ) ( not ( = ?auto_80316 ?auto_80319 ) ) ( not ( = ?auto_80317 ?auto_80319 ) ) ( not ( = ?auto_80318 ?auto_80319 ) ) ( not ( = ?auto_80320 ?auto_80319 ) ) ( not ( = ?auto_80322 ?auto_80319 ) ) ( ON ?auto_80319 ?auto_80321 ) ( not ( = ?auto_80316 ?auto_80321 ) ) ( not ( = ?auto_80317 ?auto_80321 ) ) ( not ( = ?auto_80318 ?auto_80321 ) ) ( not ( = ?auto_80320 ?auto_80321 ) ) ( not ( = ?auto_80322 ?auto_80321 ) ) ( not ( = ?auto_80323 ?auto_80321 ) ) ( not ( = ?auto_80319 ?auto_80321 ) ) ( ON ?auto_80323 ?auto_80319 ) ( ON-TABLE ?auto_80321 ) ( ON ?auto_80322 ?auto_80323 ) ( ON ?auto_80320 ?auto_80322 ) ( ON ?auto_80318 ?auto_80320 ) ( CLEAR ?auto_80316 ) ( ON ?auto_80317 ?auto_80318 ) ( CLEAR ?auto_80317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80321 ?auto_80319 ?auto_80323 ?auto_80322 ?auto_80320 ?auto_80318 )
      ( MAKE-3PILE ?auto_80316 ?auto_80317 ?auto_80318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80324 - BLOCK
      ?auto_80325 - BLOCK
      ?auto_80326 - BLOCK
    )
    :vars
    (
      ?auto_80331 - BLOCK
      ?auto_80329 - BLOCK
      ?auto_80327 - BLOCK
      ?auto_80330 - BLOCK
      ?auto_80328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80324 ?auto_80325 ) ) ( not ( = ?auto_80324 ?auto_80326 ) ) ( not ( = ?auto_80324 ?auto_80331 ) ) ( not ( = ?auto_80325 ?auto_80326 ) ) ( not ( = ?auto_80325 ?auto_80331 ) ) ( not ( = ?auto_80326 ?auto_80331 ) ) ( not ( = ?auto_80324 ?auto_80329 ) ) ( not ( = ?auto_80324 ?auto_80327 ) ) ( not ( = ?auto_80325 ?auto_80329 ) ) ( not ( = ?auto_80325 ?auto_80327 ) ) ( not ( = ?auto_80326 ?auto_80329 ) ) ( not ( = ?auto_80326 ?auto_80327 ) ) ( not ( = ?auto_80331 ?auto_80329 ) ) ( not ( = ?auto_80331 ?auto_80327 ) ) ( not ( = ?auto_80329 ?auto_80327 ) ) ( not ( = ?auto_80330 ?auto_80327 ) ) ( not ( = ?auto_80324 ?auto_80330 ) ) ( not ( = ?auto_80325 ?auto_80330 ) ) ( not ( = ?auto_80326 ?auto_80330 ) ) ( not ( = ?auto_80331 ?auto_80330 ) ) ( not ( = ?auto_80329 ?auto_80330 ) ) ( ON ?auto_80330 ?auto_80328 ) ( not ( = ?auto_80324 ?auto_80328 ) ) ( not ( = ?auto_80325 ?auto_80328 ) ) ( not ( = ?auto_80326 ?auto_80328 ) ) ( not ( = ?auto_80331 ?auto_80328 ) ) ( not ( = ?auto_80329 ?auto_80328 ) ) ( not ( = ?auto_80327 ?auto_80328 ) ) ( not ( = ?auto_80330 ?auto_80328 ) ) ( ON ?auto_80327 ?auto_80330 ) ( ON-TABLE ?auto_80328 ) ( ON ?auto_80329 ?auto_80327 ) ( ON ?auto_80331 ?auto_80329 ) ( ON ?auto_80326 ?auto_80331 ) ( ON ?auto_80325 ?auto_80326 ) ( CLEAR ?auto_80325 ) ( HOLDING ?auto_80324 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80324 )
      ( MAKE-3PILE ?auto_80324 ?auto_80325 ?auto_80326 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80332 - BLOCK
      ?auto_80333 - BLOCK
      ?auto_80334 - BLOCK
    )
    :vars
    (
      ?auto_80338 - BLOCK
      ?auto_80339 - BLOCK
      ?auto_80335 - BLOCK
      ?auto_80336 - BLOCK
      ?auto_80337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80332 ?auto_80333 ) ) ( not ( = ?auto_80332 ?auto_80334 ) ) ( not ( = ?auto_80332 ?auto_80338 ) ) ( not ( = ?auto_80333 ?auto_80334 ) ) ( not ( = ?auto_80333 ?auto_80338 ) ) ( not ( = ?auto_80334 ?auto_80338 ) ) ( not ( = ?auto_80332 ?auto_80339 ) ) ( not ( = ?auto_80332 ?auto_80335 ) ) ( not ( = ?auto_80333 ?auto_80339 ) ) ( not ( = ?auto_80333 ?auto_80335 ) ) ( not ( = ?auto_80334 ?auto_80339 ) ) ( not ( = ?auto_80334 ?auto_80335 ) ) ( not ( = ?auto_80338 ?auto_80339 ) ) ( not ( = ?auto_80338 ?auto_80335 ) ) ( not ( = ?auto_80339 ?auto_80335 ) ) ( not ( = ?auto_80336 ?auto_80335 ) ) ( not ( = ?auto_80332 ?auto_80336 ) ) ( not ( = ?auto_80333 ?auto_80336 ) ) ( not ( = ?auto_80334 ?auto_80336 ) ) ( not ( = ?auto_80338 ?auto_80336 ) ) ( not ( = ?auto_80339 ?auto_80336 ) ) ( ON ?auto_80336 ?auto_80337 ) ( not ( = ?auto_80332 ?auto_80337 ) ) ( not ( = ?auto_80333 ?auto_80337 ) ) ( not ( = ?auto_80334 ?auto_80337 ) ) ( not ( = ?auto_80338 ?auto_80337 ) ) ( not ( = ?auto_80339 ?auto_80337 ) ) ( not ( = ?auto_80335 ?auto_80337 ) ) ( not ( = ?auto_80336 ?auto_80337 ) ) ( ON ?auto_80335 ?auto_80336 ) ( ON-TABLE ?auto_80337 ) ( ON ?auto_80339 ?auto_80335 ) ( ON ?auto_80338 ?auto_80339 ) ( ON ?auto_80334 ?auto_80338 ) ( ON ?auto_80333 ?auto_80334 ) ( ON ?auto_80332 ?auto_80333 ) ( CLEAR ?auto_80332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80337 ?auto_80336 ?auto_80335 ?auto_80339 ?auto_80338 ?auto_80334 ?auto_80333 )
      ( MAKE-3PILE ?auto_80332 ?auto_80333 ?auto_80334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80344 - BLOCK
      ?auto_80345 - BLOCK
      ?auto_80346 - BLOCK
      ?auto_80347 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_80347 ) ( CLEAR ?auto_80346 ) ( ON-TABLE ?auto_80344 ) ( ON ?auto_80345 ?auto_80344 ) ( ON ?auto_80346 ?auto_80345 ) ( not ( = ?auto_80344 ?auto_80345 ) ) ( not ( = ?auto_80344 ?auto_80346 ) ) ( not ( = ?auto_80344 ?auto_80347 ) ) ( not ( = ?auto_80345 ?auto_80346 ) ) ( not ( = ?auto_80345 ?auto_80347 ) ) ( not ( = ?auto_80346 ?auto_80347 ) ) )
    :subtasks
    ( ( !STACK ?auto_80347 ?auto_80346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80348 - BLOCK
      ?auto_80349 - BLOCK
      ?auto_80350 - BLOCK
      ?auto_80351 - BLOCK
    )
    :vars
    (
      ?auto_80352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80350 ) ( ON-TABLE ?auto_80348 ) ( ON ?auto_80349 ?auto_80348 ) ( ON ?auto_80350 ?auto_80349 ) ( not ( = ?auto_80348 ?auto_80349 ) ) ( not ( = ?auto_80348 ?auto_80350 ) ) ( not ( = ?auto_80348 ?auto_80351 ) ) ( not ( = ?auto_80349 ?auto_80350 ) ) ( not ( = ?auto_80349 ?auto_80351 ) ) ( not ( = ?auto_80350 ?auto_80351 ) ) ( ON ?auto_80351 ?auto_80352 ) ( CLEAR ?auto_80351 ) ( HAND-EMPTY ) ( not ( = ?auto_80348 ?auto_80352 ) ) ( not ( = ?auto_80349 ?auto_80352 ) ) ( not ( = ?auto_80350 ?auto_80352 ) ) ( not ( = ?auto_80351 ?auto_80352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80351 ?auto_80352 )
      ( MAKE-4PILE ?auto_80348 ?auto_80349 ?auto_80350 ?auto_80351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80353 - BLOCK
      ?auto_80354 - BLOCK
      ?auto_80355 - BLOCK
      ?auto_80356 - BLOCK
    )
    :vars
    (
      ?auto_80357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80353 ) ( ON ?auto_80354 ?auto_80353 ) ( not ( = ?auto_80353 ?auto_80354 ) ) ( not ( = ?auto_80353 ?auto_80355 ) ) ( not ( = ?auto_80353 ?auto_80356 ) ) ( not ( = ?auto_80354 ?auto_80355 ) ) ( not ( = ?auto_80354 ?auto_80356 ) ) ( not ( = ?auto_80355 ?auto_80356 ) ) ( ON ?auto_80356 ?auto_80357 ) ( CLEAR ?auto_80356 ) ( not ( = ?auto_80353 ?auto_80357 ) ) ( not ( = ?auto_80354 ?auto_80357 ) ) ( not ( = ?auto_80355 ?auto_80357 ) ) ( not ( = ?auto_80356 ?auto_80357 ) ) ( HOLDING ?auto_80355 ) ( CLEAR ?auto_80354 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80353 ?auto_80354 ?auto_80355 )
      ( MAKE-4PILE ?auto_80353 ?auto_80354 ?auto_80355 ?auto_80356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80358 - BLOCK
      ?auto_80359 - BLOCK
      ?auto_80360 - BLOCK
      ?auto_80361 - BLOCK
    )
    :vars
    (
      ?auto_80362 - BLOCK
      ?auto_80364 - BLOCK
      ?auto_80363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80358 ) ( ON ?auto_80359 ?auto_80358 ) ( not ( = ?auto_80358 ?auto_80359 ) ) ( not ( = ?auto_80358 ?auto_80360 ) ) ( not ( = ?auto_80358 ?auto_80361 ) ) ( not ( = ?auto_80359 ?auto_80360 ) ) ( not ( = ?auto_80359 ?auto_80361 ) ) ( not ( = ?auto_80360 ?auto_80361 ) ) ( ON ?auto_80361 ?auto_80362 ) ( not ( = ?auto_80358 ?auto_80362 ) ) ( not ( = ?auto_80359 ?auto_80362 ) ) ( not ( = ?auto_80360 ?auto_80362 ) ) ( not ( = ?auto_80361 ?auto_80362 ) ) ( CLEAR ?auto_80359 ) ( ON ?auto_80360 ?auto_80361 ) ( CLEAR ?auto_80360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80364 ) ( ON ?auto_80363 ?auto_80364 ) ( ON ?auto_80362 ?auto_80363 ) ( not ( = ?auto_80364 ?auto_80363 ) ) ( not ( = ?auto_80364 ?auto_80362 ) ) ( not ( = ?auto_80364 ?auto_80361 ) ) ( not ( = ?auto_80364 ?auto_80360 ) ) ( not ( = ?auto_80363 ?auto_80362 ) ) ( not ( = ?auto_80363 ?auto_80361 ) ) ( not ( = ?auto_80363 ?auto_80360 ) ) ( not ( = ?auto_80358 ?auto_80364 ) ) ( not ( = ?auto_80358 ?auto_80363 ) ) ( not ( = ?auto_80359 ?auto_80364 ) ) ( not ( = ?auto_80359 ?auto_80363 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80364 ?auto_80363 ?auto_80362 ?auto_80361 )
      ( MAKE-4PILE ?auto_80358 ?auto_80359 ?auto_80360 ?auto_80361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80365 - BLOCK
      ?auto_80366 - BLOCK
      ?auto_80367 - BLOCK
      ?auto_80368 - BLOCK
    )
    :vars
    (
      ?auto_80371 - BLOCK
      ?auto_80369 - BLOCK
      ?auto_80370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80365 ) ( not ( = ?auto_80365 ?auto_80366 ) ) ( not ( = ?auto_80365 ?auto_80367 ) ) ( not ( = ?auto_80365 ?auto_80368 ) ) ( not ( = ?auto_80366 ?auto_80367 ) ) ( not ( = ?auto_80366 ?auto_80368 ) ) ( not ( = ?auto_80367 ?auto_80368 ) ) ( ON ?auto_80368 ?auto_80371 ) ( not ( = ?auto_80365 ?auto_80371 ) ) ( not ( = ?auto_80366 ?auto_80371 ) ) ( not ( = ?auto_80367 ?auto_80371 ) ) ( not ( = ?auto_80368 ?auto_80371 ) ) ( ON ?auto_80367 ?auto_80368 ) ( CLEAR ?auto_80367 ) ( ON-TABLE ?auto_80369 ) ( ON ?auto_80370 ?auto_80369 ) ( ON ?auto_80371 ?auto_80370 ) ( not ( = ?auto_80369 ?auto_80370 ) ) ( not ( = ?auto_80369 ?auto_80371 ) ) ( not ( = ?auto_80369 ?auto_80368 ) ) ( not ( = ?auto_80369 ?auto_80367 ) ) ( not ( = ?auto_80370 ?auto_80371 ) ) ( not ( = ?auto_80370 ?auto_80368 ) ) ( not ( = ?auto_80370 ?auto_80367 ) ) ( not ( = ?auto_80365 ?auto_80369 ) ) ( not ( = ?auto_80365 ?auto_80370 ) ) ( not ( = ?auto_80366 ?auto_80369 ) ) ( not ( = ?auto_80366 ?auto_80370 ) ) ( HOLDING ?auto_80366 ) ( CLEAR ?auto_80365 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80365 ?auto_80366 )
      ( MAKE-4PILE ?auto_80365 ?auto_80366 ?auto_80367 ?auto_80368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80372 - BLOCK
      ?auto_80373 - BLOCK
      ?auto_80374 - BLOCK
      ?auto_80375 - BLOCK
    )
    :vars
    (
      ?auto_80376 - BLOCK
      ?auto_80377 - BLOCK
      ?auto_80378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80372 ) ( not ( = ?auto_80372 ?auto_80373 ) ) ( not ( = ?auto_80372 ?auto_80374 ) ) ( not ( = ?auto_80372 ?auto_80375 ) ) ( not ( = ?auto_80373 ?auto_80374 ) ) ( not ( = ?auto_80373 ?auto_80375 ) ) ( not ( = ?auto_80374 ?auto_80375 ) ) ( ON ?auto_80375 ?auto_80376 ) ( not ( = ?auto_80372 ?auto_80376 ) ) ( not ( = ?auto_80373 ?auto_80376 ) ) ( not ( = ?auto_80374 ?auto_80376 ) ) ( not ( = ?auto_80375 ?auto_80376 ) ) ( ON ?auto_80374 ?auto_80375 ) ( ON-TABLE ?auto_80377 ) ( ON ?auto_80378 ?auto_80377 ) ( ON ?auto_80376 ?auto_80378 ) ( not ( = ?auto_80377 ?auto_80378 ) ) ( not ( = ?auto_80377 ?auto_80376 ) ) ( not ( = ?auto_80377 ?auto_80375 ) ) ( not ( = ?auto_80377 ?auto_80374 ) ) ( not ( = ?auto_80378 ?auto_80376 ) ) ( not ( = ?auto_80378 ?auto_80375 ) ) ( not ( = ?auto_80378 ?auto_80374 ) ) ( not ( = ?auto_80372 ?auto_80377 ) ) ( not ( = ?auto_80372 ?auto_80378 ) ) ( not ( = ?auto_80373 ?auto_80377 ) ) ( not ( = ?auto_80373 ?auto_80378 ) ) ( CLEAR ?auto_80372 ) ( ON ?auto_80373 ?auto_80374 ) ( CLEAR ?auto_80373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80377 ?auto_80378 ?auto_80376 ?auto_80375 ?auto_80374 )
      ( MAKE-4PILE ?auto_80372 ?auto_80373 ?auto_80374 ?auto_80375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80379 - BLOCK
      ?auto_80380 - BLOCK
      ?auto_80381 - BLOCK
      ?auto_80382 - BLOCK
    )
    :vars
    (
      ?auto_80384 - BLOCK
      ?auto_80385 - BLOCK
      ?auto_80383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80379 ?auto_80380 ) ) ( not ( = ?auto_80379 ?auto_80381 ) ) ( not ( = ?auto_80379 ?auto_80382 ) ) ( not ( = ?auto_80380 ?auto_80381 ) ) ( not ( = ?auto_80380 ?auto_80382 ) ) ( not ( = ?auto_80381 ?auto_80382 ) ) ( ON ?auto_80382 ?auto_80384 ) ( not ( = ?auto_80379 ?auto_80384 ) ) ( not ( = ?auto_80380 ?auto_80384 ) ) ( not ( = ?auto_80381 ?auto_80384 ) ) ( not ( = ?auto_80382 ?auto_80384 ) ) ( ON ?auto_80381 ?auto_80382 ) ( ON-TABLE ?auto_80385 ) ( ON ?auto_80383 ?auto_80385 ) ( ON ?auto_80384 ?auto_80383 ) ( not ( = ?auto_80385 ?auto_80383 ) ) ( not ( = ?auto_80385 ?auto_80384 ) ) ( not ( = ?auto_80385 ?auto_80382 ) ) ( not ( = ?auto_80385 ?auto_80381 ) ) ( not ( = ?auto_80383 ?auto_80384 ) ) ( not ( = ?auto_80383 ?auto_80382 ) ) ( not ( = ?auto_80383 ?auto_80381 ) ) ( not ( = ?auto_80379 ?auto_80385 ) ) ( not ( = ?auto_80379 ?auto_80383 ) ) ( not ( = ?auto_80380 ?auto_80385 ) ) ( not ( = ?auto_80380 ?auto_80383 ) ) ( ON ?auto_80380 ?auto_80381 ) ( CLEAR ?auto_80380 ) ( HOLDING ?auto_80379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80379 )
      ( MAKE-4PILE ?auto_80379 ?auto_80380 ?auto_80381 ?auto_80382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80386 - BLOCK
      ?auto_80387 - BLOCK
      ?auto_80388 - BLOCK
      ?auto_80389 - BLOCK
    )
    :vars
    (
      ?auto_80392 - BLOCK
      ?auto_80391 - BLOCK
      ?auto_80390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80386 ?auto_80387 ) ) ( not ( = ?auto_80386 ?auto_80388 ) ) ( not ( = ?auto_80386 ?auto_80389 ) ) ( not ( = ?auto_80387 ?auto_80388 ) ) ( not ( = ?auto_80387 ?auto_80389 ) ) ( not ( = ?auto_80388 ?auto_80389 ) ) ( ON ?auto_80389 ?auto_80392 ) ( not ( = ?auto_80386 ?auto_80392 ) ) ( not ( = ?auto_80387 ?auto_80392 ) ) ( not ( = ?auto_80388 ?auto_80392 ) ) ( not ( = ?auto_80389 ?auto_80392 ) ) ( ON ?auto_80388 ?auto_80389 ) ( ON-TABLE ?auto_80391 ) ( ON ?auto_80390 ?auto_80391 ) ( ON ?auto_80392 ?auto_80390 ) ( not ( = ?auto_80391 ?auto_80390 ) ) ( not ( = ?auto_80391 ?auto_80392 ) ) ( not ( = ?auto_80391 ?auto_80389 ) ) ( not ( = ?auto_80391 ?auto_80388 ) ) ( not ( = ?auto_80390 ?auto_80392 ) ) ( not ( = ?auto_80390 ?auto_80389 ) ) ( not ( = ?auto_80390 ?auto_80388 ) ) ( not ( = ?auto_80386 ?auto_80391 ) ) ( not ( = ?auto_80386 ?auto_80390 ) ) ( not ( = ?auto_80387 ?auto_80391 ) ) ( not ( = ?auto_80387 ?auto_80390 ) ) ( ON ?auto_80387 ?auto_80388 ) ( ON ?auto_80386 ?auto_80387 ) ( CLEAR ?auto_80386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80391 ?auto_80390 ?auto_80392 ?auto_80389 ?auto_80388 ?auto_80387 )
      ( MAKE-4PILE ?auto_80386 ?auto_80387 ?auto_80388 ?auto_80389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80393 - BLOCK
      ?auto_80394 - BLOCK
      ?auto_80395 - BLOCK
      ?auto_80396 - BLOCK
    )
    :vars
    (
      ?auto_80398 - BLOCK
      ?auto_80397 - BLOCK
      ?auto_80399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80393 ?auto_80394 ) ) ( not ( = ?auto_80393 ?auto_80395 ) ) ( not ( = ?auto_80393 ?auto_80396 ) ) ( not ( = ?auto_80394 ?auto_80395 ) ) ( not ( = ?auto_80394 ?auto_80396 ) ) ( not ( = ?auto_80395 ?auto_80396 ) ) ( ON ?auto_80396 ?auto_80398 ) ( not ( = ?auto_80393 ?auto_80398 ) ) ( not ( = ?auto_80394 ?auto_80398 ) ) ( not ( = ?auto_80395 ?auto_80398 ) ) ( not ( = ?auto_80396 ?auto_80398 ) ) ( ON ?auto_80395 ?auto_80396 ) ( ON-TABLE ?auto_80397 ) ( ON ?auto_80399 ?auto_80397 ) ( ON ?auto_80398 ?auto_80399 ) ( not ( = ?auto_80397 ?auto_80399 ) ) ( not ( = ?auto_80397 ?auto_80398 ) ) ( not ( = ?auto_80397 ?auto_80396 ) ) ( not ( = ?auto_80397 ?auto_80395 ) ) ( not ( = ?auto_80399 ?auto_80398 ) ) ( not ( = ?auto_80399 ?auto_80396 ) ) ( not ( = ?auto_80399 ?auto_80395 ) ) ( not ( = ?auto_80393 ?auto_80397 ) ) ( not ( = ?auto_80393 ?auto_80399 ) ) ( not ( = ?auto_80394 ?auto_80397 ) ) ( not ( = ?auto_80394 ?auto_80399 ) ) ( ON ?auto_80394 ?auto_80395 ) ( HOLDING ?auto_80393 ) ( CLEAR ?auto_80394 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80397 ?auto_80399 ?auto_80398 ?auto_80396 ?auto_80395 ?auto_80394 ?auto_80393 )
      ( MAKE-4PILE ?auto_80393 ?auto_80394 ?auto_80395 ?auto_80396 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80400 - BLOCK
      ?auto_80401 - BLOCK
      ?auto_80402 - BLOCK
      ?auto_80403 - BLOCK
    )
    :vars
    (
      ?auto_80405 - BLOCK
      ?auto_80404 - BLOCK
      ?auto_80406 - BLOCK
      ?auto_80407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80400 ?auto_80401 ) ) ( not ( = ?auto_80400 ?auto_80402 ) ) ( not ( = ?auto_80400 ?auto_80403 ) ) ( not ( = ?auto_80401 ?auto_80402 ) ) ( not ( = ?auto_80401 ?auto_80403 ) ) ( not ( = ?auto_80402 ?auto_80403 ) ) ( ON ?auto_80403 ?auto_80405 ) ( not ( = ?auto_80400 ?auto_80405 ) ) ( not ( = ?auto_80401 ?auto_80405 ) ) ( not ( = ?auto_80402 ?auto_80405 ) ) ( not ( = ?auto_80403 ?auto_80405 ) ) ( ON ?auto_80402 ?auto_80403 ) ( ON-TABLE ?auto_80404 ) ( ON ?auto_80406 ?auto_80404 ) ( ON ?auto_80405 ?auto_80406 ) ( not ( = ?auto_80404 ?auto_80406 ) ) ( not ( = ?auto_80404 ?auto_80405 ) ) ( not ( = ?auto_80404 ?auto_80403 ) ) ( not ( = ?auto_80404 ?auto_80402 ) ) ( not ( = ?auto_80406 ?auto_80405 ) ) ( not ( = ?auto_80406 ?auto_80403 ) ) ( not ( = ?auto_80406 ?auto_80402 ) ) ( not ( = ?auto_80400 ?auto_80404 ) ) ( not ( = ?auto_80400 ?auto_80406 ) ) ( not ( = ?auto_80401 ?auto_80404 ) ) ( not ( = ?auto_80401 ?auto_80406 ) ) ( ON ?auto_80401 ?auto_80402 ) ( CLEAR ?auto_80401 ) ( ON ?auto_80400 ?auto_80407 ) ( CLEAR ?auto_80400 ) ( HAND-EMPTY ) ( not ( = ?auto_80400 ?auto_80407 ) ) ( not ( = ?auto_80401 ?auto_80407 ) ) ( not ( = ?auto_80402 ?auto_80407 ) ) ( not ( = ?auto_80403 ?auto_80407 ) ) ( not ( = ?auto_80405 ?auto_80407 ) ) ( not ( = ?auto_80404 ?auto_80407 ) ) ( not ( = ?auto_80406 ?auto_80407 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80400 ?auto_80407 )
      ( MAKE-4PILE ?auto_80400 ?auto_80401 ?auto_80402 ?auto_80403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80408 - BLOCK
      ?auto_80409 - BLOCK
      ?auto_80410 - BLOCK
      ?auto_80411 - BLOCK
    )
    :vars
    (
      ?auto_80412 - BLOCK
      ?auto_80414 - BLOCK
      ?auto_80415 - BLOCK
      ?auto_80413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80408 ?auto_80409 ) ) ( not ( = ?auto_80408 ?auto_80410 ) ) ( not ( = ?auto_80408 ?auto_80411 ) ) ( not ( = ?auto_80409 ?auto_80410 ) ) ( not ( = ?auto_80409 ?auto_80411 ) ) ( not ( = ?auto_80410 ?auto_80411 ) ) ( ON ?auto_80411 ?auto_80412 ) ( not ( = ?auto_80408 ?auto_80412 ) ) ( not ( = ?auto_80409 ?auto_80412 ) ) ( not ( = ?auto_80410 ?auto_80412 ) ) ( not ( = ?auto_80411 ?auto_80412 ) ) ( ON ?auto_80410 ?auto_80411 ) ( ON-TABLE ?auto_80414 ) ( ON ?auto_80415 ?auto_80414 ) ( ON ?auto_80412 ?auto_80415 ) ( not ( = ?auto_80414 ?auto_80415 ) ) ( not ( = ?auto_80414 ?auto_80412 ) ) ( not ( = ?auto_80414 ?auto_80411 ) ) ( not ( = ?auto_80414 ?auto_80410 ) ) ( not ( = ?auto_80415 ?auto_80412 ) ) ( not ( = ?auto_80415 ?auto_80411 ) ) ( not ( = ?auto_80415 ?auto_80410 ) ) ( not ( = ?auto_80408 ?auto_80414 ) ) ( not ( = ?auto_80408 ?auto_80415 ) ) ( not ( = ?auto_80409 ?auto_80414 ) ) ( not ( = ?auto_80409 ?auto_80415 ) ) ( ON ?auto_80408 ?auto_80413 ) ( CLEAR ?auto_80408 ) ( not ( = ?auto_80408 ?auto_80413 ) ) ( not ( = ?auto_80409 ?auto_80413 ) ) ( not ( = ?auto_80410 ?auto_80413 ) ) ( not ( = ?auto_80411 ?auto_80413 ) ) ( not ( = ?auto_80412 ?auto_80413 ) ) ( not ( = ?auto_80414 ?auto_80413 ) ) ( not ( = ?auto_80415 ?auto_80413 ) ) ( HOLDING ?auto_80409 ) ( CLEAR ?auto_80410 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80414 ?auto_80415 ?auto_80412 ?auto_80411 ?auto_80410 ?auto_80409 )
      ( MAKE-4PILE ?auto_80408 ?auto_80409 ?auto_80410 ?auto_80411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80416 - BLOCK
      ?auto_80417 - BLOCK
      ?auto_80418 - BLOCK
      ?auto_80419 - BLOCK
    )
    :vars
    (
      ?auto_80422 - BLOCK
      ?auto_80420 - BLOCK
      ?auto_80421 - BLOCK
      ?auto_80423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80416 ?auto_80417 ) ) ( not ( = ?auto_80416 ?auto_80418 ) ) ( not ( = ?auto_80416 ?auto_80419 ) ) ( not ( = ?auto_80417 ?auto_80418 ) ) ( not ( = ?auto_80417 ?auto_80419 ) ) ( not ( = ?auto_80418 ?auto_80419 ) ) ( ON ?auto_80419 ?auto_80422 ) ( not ( = ?auto_80416 ?auto_80422 ) ) ( not ( = ?auto_80417 ?auto_80422 ) ) ( not ( = ?auto_80418 ?auto_80422 ) ) ( not ( = ?auto_80419 ?auto_80422 ) ) ( ON ?auto_80418 ?auto_80419 ) ( ON-TABLE ?auto_80420 ) ( ON ?auto_80421 ?auto_80420 ) ( ON ?auto_80422 ?auto_80421 ) ( not ( = ?auto_80420 ?auto_80421 ) ) ( not ( = ?auto_80420 ?auto_80422 ) ) ( not ( = ?auto_80420 ?auto_80419 ) ) ( not ( = ?auto_80420 ?auto_80418 ) ) ( not ( = ?auto_80421 ?auto_80422 ) ) ( not ( = ?auto_80421 ?auto_80419 ) ) ( not ( = ?auto_80421 ?auto_80418 ) ) ( not ( = ?auto_80416 ?auto_80420 ) ) ( not ( = ?auto_80416 ?auto_80421 ) ) ( not ( = ?auto_80417 ?auto_80420 ) ) ( not ( = ?auto_80417 ?auto_80421 ) ) ( ON ?auto_80416 ?auto_80423 ) ( not ( = ?auto_80416 ?auto_80423 ) ) ( not ( = ?auto_80417 ?auto_80423 ) ) ( not ( = ?auto_80418 ?auto_80423 ) ) ( not ( = ?auto_80419 ?auto_80423 ) ) ( not ( = ?auto_80422 ?auto_80423 ) ) ( not ( = ?auto_80420 ?auto_80423 ) ) ( not ( = ?auto_80421 ?auto_80423 ) ) ( CLEAR ?auto_80418 ) ( ON ?auto_80417 ?auto_80416 ) ( CLEAR ?auto_80417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80423 ?auto_80416 )
      ( MAKE-4PILE ?auto_80416 ?auto_80417 ?auto_80418 ?auto_80419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80424 - BLOCK
      ?auto_80425 - BLOCK
      ?auto_80426 - BLOCK
      ?auto_80427 - BLOCK
    )
    :vars
    (
      ?auto_80428 - BLOCK
      ?auto_80430 - BLOCK
      ?auto_80431 - BLOCK
      ?auto_80429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80424 ?auto_80425 ) ) ( not ( = ?auto_80424 ?auto_80426 ) ) ( not ( = ?auto_80424 ?auto_80427 ) ) ( not ( = ?auto_80425 ?auto_80426 ) ) ( not ( = ?auto_80425 ?auto_80427 ) ) ( not ( = ?auto_80426 ?auto_80427 ) ) ( ON ?auto_80427 ?auto_80428 ) ( not ( = ?auto_80424 ?auto_80428 ) ) ( not ( = ?auto_80425 ?auto_80428 ) ) ( not ( = ?auto_80426 ?auto_80428 ) ) ( not ( = ?auto_80427 ?auto_80428 ) ) ( ON-TABLE ?auto_80430 ) ( ON ?auto_80431 ?auto_80430 ) ( ON ?auto_80428 ?auto_80431 ) ( not ( = ?auto_80430 ?auto_80431 ) ) ( not ( = ?auto_80430 ?auto_80428 ) ) ( not ( = ?auto_80430 ?auto_80427 ) ) ( not ( = ?auto_80430 ?auto_80426 ) ) ( not ( = ?auto_80431 ?auto_80428 ) ) ( not ( = ?auto_80431 ?auto_80427 ) ) ( not ( = ?auto_80431 ?auto_80426 ) ) ( not ( = ?auto_80424 ?auto_80430 ) ) ( not ( = ?auto_80424 ?auto_80431 ) ) ( not ( = ?auto_80425 ?auto_80430 ) ) ( not ( = ?auto_80425 ?auto_80431 ) ) ( ON ?auto_80424 ?auto_80429 ) ( not ( = ?auto_80424 ?auto_80429 ) ) ( not ( = ?auto_80425 ?auto_80429 ) ) ( not ( = ?auto_80426 ?auto_80429 ) ) ( not ( = ?auto_80427 ?auto_80429 ) ) ( not ( = ?auto_80428 ?auto_80429 ) ) ( not ( = ?auto_80430 ?auto_80429 ) ) ( not ( = ?auto_80431 ?auto_80429 ) ) ( ON ?auto_80425 ?auto_80424 ) ( CLEAR ?auto_80425 ) ( ON-TABLE ?auto_80429 ) ( HOLDING ?auto_80426 ) ( CLEAR ?auto_80427 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80430 ?auto_80431 ?auto_80428 ?auto_80427 ?auto_80426 )
      ( MAKE-4PILE ?auto_80424 ?auto_80425 ?auto_80426 ?auto_80427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80432 - BLOCK
      ?auto_80433 - BLOCK
      ?auto_80434 - BLOCK
      ?auto_80435 - BLOCK
    )
    :vars
    (
      ?auto_80436 - BLOCK
      ?auto_80437 - BLOCK
      ?auto_80438 - BLOCK
      ?auto_80439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80432 ?auto_80433 ) ) ( not ( = ?auto_80432 ?auto_80434 ) ) ( not ( = ?auto_80432 ?auto_80435 ) ) ( not ( = ?auto_80433 ?auto_80434 ) ) ( not ( = ?auto_80433 ?auto_80435 ) ) ( not ( = ?auto_80434 ?auto_80435 ) ) ( ON ?auto_80435 ?auto_80436 ) ( not ( = ?auto_80432 ?auto_80436 ) ) ( not ( = ?auto_80433 ?auto_80436 ) ) ( not ( = ?auto_80434 ?auto_80436 ) ) ( not ( = ?auto_80435 ?auto_80436 ) ) ( ON-TABLE ?auto_80437 ) ( ON ?auto_80438 ?auto_80437 ) ( ON ?auto_80436 ?auto_80438 ) ( not ( = ?auto_80437 ?auto_80438 ) ) ( not ( = ?auto_80437 ?auto_80436 ) ) ( not ( = ?auto_80437 ?auto_80435 ) ) ( not ( = ?auto_80437 ?auto_80434 ) ) ( not ( = ?auto_80438 ?auto_80436 ) ) ( not ( = ?auto_80438 ?auto_80435 ) ) ( not ( = ?auto_80438 ?auto_80434 ) ) ( not ( = ?auto_80432 ?auto_80437 ) ) ( not ( = ?auto_80432 ?auto_80438 ) ) ( not ( = ?auto_80433 ?auto_80437 ) ) ( not ( = ?auto_80433 ?auto_80438 ) ) ( ON ?auto_80432 ?auto_80439 ) ( not ( = ?auto_80432 ?auto_80439 ) ) ( not ( = ?auto_80433 ?auto_80439 ) ) ( not ( = ?auto_80434 ?auto_80439 ) ) ( not ( = ?auto_80435 ?auto_80439 ) ) ( not ( = ?auto_80436 ?auto_80439 ) ) ( not ( = ?auto_80437 ?auto_80439 ) ) ( not ( = ?auto_80438 ?auto_80439 ) ) ( ON ?auto_80433 ?auto_80432 ) ( ON-TABLE ?auto_80439 ) ( CLEAR ?auto_80435 ) ( ON ?auto_80434 ?auto_80433 ) ( CLEAR ?auto_80434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80439 ?auto_80432 ?auto_80433 )
      ( MAKE-4PILE ?auto_80432 ?auto_80433 ?auto_80434 ?auto_80435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80440 - BLOCK
      ?auto_80441 - BLOCK
      ?auto_80442 - BLOCK
      ?auto_80443 - BLOCK
    )
    :vars
    (
      ?auto_80447 - BLOCK
      ?auto_80445 - BLOCK
      ?auto_80444 - BLOCK
      ?auto_80446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80440 ?auto_80441 ) ) ( not ( = ?auto_80440 ?auto_80442 ) ) ( not ( = ?auto_80440 ?auto_80443 ) ) ( not ( = ?auto_80441 ?auto_80442 ) ) ( not ( = ?auto_80441 ?auto_80443 ) ) ( not ( = ?auto_80442 ?auto_80443 ) ) ( not ( = ?auto_80440 ?auto_80447 ) ) ( not ( = ?auto_80441 ?auto_80447 ) ) ( not ( = ?auto_80442 ?auto_80447 ) ) ( not ( = ?auto_80443 ?auto_80447 ) ) ( ON-TABLE ?auto_80445 ) ( ON ?auto_80444 ?auto_80445 ) ( ON ?auto_80447 ?auto_80444 ) ( not ( = ?auto_80445 ?auto_80444 ) ) ( not ( = ?auto_80445 ?auto_80447 ) ) ( not ( = ?auto_80445 ?auto_80443 ) ) ( not ( = ?auto_80445 ?auto_80442 ) ) ( not ( = ?auto_80444 ?auto_80447 ) ) ( not ( = ?auto_80444 ?auto_80443 ) ) ( not ( = ?auto_80444 ?auto_80442 ) ) ( not ( = ?auto_80440 ?auto_80445 ) ) ( not ( = ?auto_80440 ?auto_80444 ) ) ( not ( = ?auto_80441 ?auto_80445 ) ) ( not ( = ?auto_80441 ?auto_80444 ) ) ( ON ?auto_80440 ?auto_80446 ) ( not ( = ?auto_80440 ?auto_80446 ) ) ( not ( = ?auto_80441 ?auto_80446 ) ) ( not ( = ?auto_80442 ?auto_80446 ) ) ( not ( = ?auto_80443 ?auto_80446 ) ) ( not ( = ?auto_80447 ?auto_80446 ) ) ( not ( = ?auto_80445 ?auto_80446 ) ) ( not ( = ?auto_80444 ?auto_80446 ) ) ( ON ?auto_80441 ?auto_80440 ) ( ON-TABLE ?auto_80446 ) ( ON ?auto_80442 ?auto_80441 ) ( CLEAR ?auto_80442 ) ( HOLDING ?auto_80443 ) ( CLEAR ?auto_80447 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80445 ?auto_80444 ?auto_80447 ?auto_80443 )
      ( MAKE-4PILE ?auto_80440 ?auto_80441 ?auto_80442 ?auto_80443 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80448 - BLOCK
      ?auto_80449 - BLOCK
      ?auto_80450 - BLOCK
      ?auto_80451 - BLOCK
    )
    :vars
    (
      ?auto_80453 - BLOCK
      ?auto_80452 - BLOCK
      ?auto_80454 - BLOCK
      ?auto_80455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80448 ?auto_80449 ) ) ( not ( = ?auto_80448 ?auto_80450 ) ) ( not ( = ?auto_80448 ?auto_80451 ) ) ( not ( = ?auto_80449 ?auto_80450 ) ) ( not ( = ?auto_80449 ?auto_80451 ) ) ( not ( = ?auto_80450 ?auto_80451 ) ) ( not ( = ?auto_80448 ?auto_80453 ) ) ( not ( = ?auto_80449 ?auto_80453 ) ) ( not ( = ?auto_80450 ?auto_80453 ) ) ( not ( = ?auto_80451 ?auto_80453 ) ) ( ON-TABLE ?auto_80452 ) ( ON ?auto_80454 ?auto_80452 ) ( ON ?auto_80453 ?auto_80454 ) ( not ( = ?auto_80452 ?auto_80454 ) ) ( not ( = ?auto_80452 ?auto_80453 ) ) ( not ( = ?auto_80452 ?auto_80451 ) ) ( not ( = ?auto_80452 ?auto_80450 ) ) ( not ( = ?auto_80454 ?auto_80453 ) ) ( not ( = ?auto_80454 ?auto_80451 ) ) ( not ( = ?auto_80454 ?auto_80450 ) ) ( not ( = ?auto_80448 ?auto_80452 ) ) ( not ( = ?auto_80448 ?auto_80454 ) ) ( not ( = ?auto_80449 ?auto_80452 ) ) ( not ( = ?auto_80449 ?auto_80454 ) ) ( ON ?auto_80448 ?auto_80455 ) ( not ( = ?auto_80448 ?auto_80455 ) ) ( not ( = ?auto_80449 ?auto_80455 ) ) ( not ( = ?auto_80450 ?auto_80455 ) ) ( not ( = ?auto_80451 ?auto_80455 ) ) ( not ( = ?auto_80453 ?auto_80455 ) ) ( not ( = ?auto_80452 ?auto_80455 ) ) ( not ( = ?auto_80454 ?auto_80455 ) ) ( ON ?auto_80449 ?auto_80448 ) ( ON-TABLE ?auto_80455 ) ( ON ?auto_80450 ?auto_80449 ) ( CLEAR ?auto_80453 ) ( ON ?auto_80451 ?auto_80450 ) ( CLEAR ?auto_80451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80455 ?auto_80448 ?auto_80449 ?auto_80450 )
      ( MAKE-4PILE ?auto_80448 ?auto_80449 ?auto_80450 ?auto_80451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80456 - BLOCK
      ?auto_80457 - BLOCK
      ?auto_80458 - BLOCK
      ?auto_80459 - BLOCK
    )
    :vars
    (
      ?auto_80462 - BLOCK
      ?auto_80463 - BLOCK
      ?auto_80461 - BLOCK
      ?auto_80460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80456 ?auto_80457 ) ) ( not ( = ?auto_80456 ?auto_80458 ) ) ( not ( = ?auto_80456 ?auto_80459 ) ) ( not ( = ?auto_80457 ?auto_80458 ) ) ( not ( = ?auto_80457 ?auto_80459 ) ) ( not ( = ?auto_80458 ?auto_80459 ) ) ( not ( = ?auto_80456 ?auto_80462 ) ) ( not ( = ?auto_80457 ?auto_80462 ) ) ( not ( = ?auto_80458 ?auto_80462 ) ) ( not ( = ?auto_80459 ?auto_80462 ) ) ( ON-TABLE ?auto_80463 ) ( ON ?auto_80461 ?auto_80463 ) ( not ( = ?auto_80463 ?auto_80461 ) ) ( not ( = ?auto_80463 ?auto_80462 ) ) ( not ( = ?auto_80463 ?auto_80459 ) ) ( not ( = ?auto_80463 ?auto_80458 ) ) ( not ( = ?auto_80461 ?auto_80462 ) ) ( not ( = ?auto_80461 ?auto_80459 ) ) ( not ( = ?auto_80461 ?auto_80458 ) ) ( not ( = ?auto_80456 ?auto_80463 ) ) ( not ( = ?auto_80456 ?auto_80461 ) ) ( not ( = ?auto_80457 ?auto_80463 ) ) ( not ( = ?auto_80457 ?auto_80461 ) ) ( ON ?auto_80456 ?auto_80460 ) ( not ( = ?auto_80456 ?auto_80460 ) ) ( not ( = ?auto_80457 ?auto_80460 ) ) ( not ( = ?auto_80458 ?auto_80460 ) ) ( not ( = ?auto_80459 ?auto_80460 ) ) ( not ( = ?auto_80462 ?auto_80460 ) ) ( not ( = ?auto_80463 ?auto_80460 ) ) ( not ( = ?auto_80461 ?auto_80460 ) ) ( ON ?auto_80457 ?auto_80456 ) ( ON-TABLE ?auto_80460 ) ( ON ?auto_80458 ?auto_80457 ) ( ON ?auto_80459 ?auto_80458 ) ( CLEAR ?auto_80459 ) ( HOLDING ?auto_80462 ) ( CLEAR ?auto_80461 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80463 ?auto_80461 ?auto_80462 )
      ( MAKE-4PILE ?auto_80456 ?auto_80457 ?auto_80458 ?auto_80459 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80464 - BLOCK
      ?auto_80465 - BLOCK
      ?auto_80466 - BLOCK
      ?auto_80467 - BLOCK
    )
    :vars
    (
      ?auto_80469 - BLOCK
      ?auto_80470 - BLOCK
      ?auto_80468 - BLOCK
      ?auto_80471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80464 ?auto_80465 ) ) ( not ( = ?auto_80464 ?auto_80466 ) ) ( not ( = ?auto_80464 ?auto_80467 ) ) ( not ( = ?auto_80465 ?auto_80466 ) ) ( not ( = ?auto_80465 ?auto_80467 ) ) ( not ( = ?auto_80466 ?auto_80467 ) ) ( not ( = ?auto_80464 ?auto_80469 ) ) ( not ( = ?auto_80465 ?auto_80469 ) ) ( not ( = ?auto_80466 ?auto_80469 ) ) ( not ( = ?auto_80467 ?auto_80469 ) ) ( ON-TABLE ?auto_80470 ) ( ON ?auto_80468 ?auto_80470 ) ( not ( = ?auto_80470 ?auto_80468 ) ) ( not ( = ?auto_80470 ?auto_80469 ) ) ( not ( = ?auto_80470 ?auto_80467 ) ) ( not ( = ?auto_80470 ?auto_80466 ) ) ( not ( = ?auto_80468 ?auto_80469 ) ) ( not ( = ?auto_80468 ?auto_80467 ) ) ( not ( = ?auto_80468 ?auto_80466 ) ) ( not ( = ?auto_80464 ?auto_80470 ) ) ( not ( = ?auto_80464 ?auto_80468 ) ) ( not ( = ?auto_80465 ?auto_80470 ) ) ( not ( = ?auto_80465 ?auto_80468 ) ) ( ON ?auto_80464 ?auto_80471 ) ( not ( = ?auto_80464 ?auto_80471 ) ) ( not ( = ?auto_80465 ?auto_80471 ) ) ( not ( = ?auto_80466 ?auto_80471 ) ) ( not ( = ?auto_80467 ?auto_80471 ) ) ( not ( = ?auto_80469 ?auto_80471 ) ) ( not ( = ?auto_80470 ?auto_80471 ) ) ( not ( = ?auto_80468 ?auto_80471 ) ) ( ON ?auto_80465 ?auto_80464 ) ( ON-TABLE ?auto_80471 ) ( ON ?auto_80466 ?auto_80465 ) ( ON ?auto_80467 ?auto_80466 ) ( CLEAR ?auto_80468 ) ( ON ?auto_80469 ?auto_80467 ) ( CLEAR ?auto_80469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80471 ?auto_80464 ?auto_80465 ?auto_80466 ?auto_80467 )
      ( MAKE-4PILE ?auto_80464 ?auto_80465 ?auto_80466 ?auto_80467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80472 - BLOCK
      ?auto_80473 - BLOCK
      ?auto_80474 - BLOCK
      ?auto_80475 - BLOCK
    )
    :vars
    (
      ?auto_80479 - BLOCK
      ?auto_80476 - BLOCK
      ?auto_80477 - BLOCK
      ?auto_80478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80472 ?auto_80473 ) ) ( not ( = ?auto_80472 ?auto_80474 ) ) ( not ( = ?auto_80472 ?auto_80475 ) ) ( not ( = ?auto_80473 ?auto_80474 ) ) ( not ( = ?auto_80473 ?auto_80475 ) ) ( not ( = ?auto_80474 ?auto_80475 ) ) ( not ( = ?auto_80472 ?auto_80479 ) ) ( not ( = ?auto_80473 ?auto_80479 ) ) ( not ( = ?auto_80474 ?auto_80479 ) ) ( not ( = ?auto_80475 ?auto_80479 ) ) ( ON-TABLE ?auto_80476 ) ( not ( = ?auto_80476 ?auto_80477 ) ) ( not ( = ?auto_80476 ?auto_80479 ) ) ( not ( = ?auto_80476 ?auto_80475 ) ) ( not ( = ?auto_80476 ?auto_80474 ) ) ( not ( = ?auto_80477 ?auto_80479 ) ) ( not ( = ?auto_80477 ?auto_80475 ) ) ( not ( = ?auto_80477 ?auto_80474 ) ) ( not ( = ?auto_80472 ?auto_80476 ) ) ( not ( = ?auto_80472 ?auto_80477 ) ) ( not ( = ?auto_80473 ?auto_80476 ) ) ( not ( = ?auto_80473 ?auto_80477 ) ) ( ON ?auto_80472 ?auto_80478 ) ( not ( = ?auto_80472 ?auto_80478 ) ) ( not ( = ?auto_80473 ?auto_80478 ) ) ( not ( = ?auto_80474 ?auto_80478 ) ) ( not ( = ?auto_80475 ?auto_80478 ) ) ( not ( = ?auto_80479 ?auto_80478 ) ) ( not ( = ?auto_80476 ?auto_80478 ) ) ( not ( = ?auto_80477 ?auto_80478 ) ) ( ON ?auto_80473 ?auto_80472 ) ( ON-TABLE ?auto_80478 ) ( ON ?auto_80474 ?auto_80473 ) ( ON ?auto_80475 ?auto_80474 ) ( ON ?auto_80479 ?auto_80475 ) ( CLEAR ?auto_80479 ) ( HOLDING ?auto_80477 ) ( CLEAR ?auto_80476 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80476 ?auto_80477 )
      ( MAKE-4PILE ?auto_80472 ?auto_80473 ?auto_80474 ?auto_80475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80480 - BLOCK
      ?auto_80481 - BLOCK
      ?auto_80482 - BLOCK
      ?auto_80483 - BLOCK
    )
    :vars
    (
      ?auto_80486 - BLOCK
      ?auto_80484 - BLOCK
      ?auto_80485 - BLOCK
      ?auto_80487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80480 ?auto_80481 ) ) ( not ( = ?auto_80480 ?auto_80482 ) ) ( not ( = ?auto_80480 ?auto_80483 ) ) ( not ( = ?auto_80481 ?auto_80482 ) ) ( not ( = ?auto_80481 ?auto_80483 ) ) ( not ( = ?auto_80482 ?auto_80483 ) ) ( not ( = ?auto_80480 ?auto_80486 ) ) ( not ( = ?auto_80481 ?auto_80486 ) ) ( not ( = ?auto_80482 ?auto_80486 ) ) ( not ( = ?auto_80483 ?auto_80486 ) ) ( ON-TABLE ?auto_80484 ) ( not ( = ?auto_80484 ?auto_80485 ) ) ( not ( = ?auto_80484 ?auto_80486 ) ) ( not ( = ?auto_80484 ?auto_80483 ) ) ( not ( = ?auto_80484 ?auto_80482 ) ) ( not ( = ?auto_80485 ?auto_80486 ) ) ( not ( = ?auto_80485 ?auto_80483 ) ) ( not ( = ?auto_80485 ?auto_80482 ) ) ( not ( = ?auto_80480 ?auto_80484 ) ) ( not ( = ?auto_80480 ?auto_80485 ) ) ( not ( = ?auto_80481 ?auto_80484 ) ) ( not ( = ?auto_80481 ?auto_80485 ) ) ( ON ?auto_80480 ?auto_80487 ) ( not ( = ?auto_80480 ?auto_80487 ) ) ( not ( = ?auto_80481 ?auto_80487 ) ) ( not ( = ?auto_80482 ?auto_80487 ) ) ( not ( = ?auto_80483 ?auto_80487 ) ) ( not ( = ?auto_80486 ?auto_80487 ) ) ( not ( = ?auto_80484 ?auto_80487 ) ) ( not ( = ?auto_80485 ?auto_80487 ) ) ( ON ?auto_80481 ?auto_80480 ) ( ON-TABLE ?auto_80487 ) ( ON ?auto_80482 ?auto_80481 ) ( ON ?auto_80483 ?auto_80482 ) ( ON ?auto_80486 ?auto_80483 ) ( CLEAR ?auto_80484 ) ( ON ?auto_80485 ?auto_80486 ) ( CLEAR ?auto_80485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80487 ?auto_80480 ?auto_80481 ?auto_80482 ?auto_80483 ?auto_80486 )
      ( MAKE-4PILE ?auto_80480 ?auto_80481 ?auto_80482 ?auto_80483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80488 - BLOCK
      ?auto_80489 - BLOCK
      ?auto_80490 - BLOCK
      ?auto_80491 - BLOCK
    )
    :vars
    (
      ?auto_80493 - BLOCK
      ?auto_80494 - BLOCK
      ?auto_80492 - BLOCK
      ?auto_80495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80488 ?auto_80489 ) ) ( not ( = ?auto_80488 ?auto_80490 ) ) ( not ( = ?auto_80488 ?auto_80491 ) ) ( not ( = ?auto_80489 ?auto_80490 ) ) ( not ( = ?auto_80489 ?auto_80491 ) ) ( not ( = ?auto_80490 ?auto_80491 ) ) ( not ( = ?auto_80488 ?auto_80493 ) ) ( not ( = ?auto_80489 ?auto_80493 ) ) ( not ( = ?auto_80490 ?auto_80493 ) ) ( not ( = ?auto_80491 ?auto_80493 ) ) ( not ( = ?auto_80494 ?auto_80492 ) ) ( not ( = ?auto_80494 ?auto_80493 ) ) ( not ( = ?auto_80494 ?auto_80491 ) ) ( not ( = ?auto_80494 ?auto_80490 ) ) ( not ( = ?auto_80492 ?auto_80493 ) ) ( not ( = ?auto_80492 ?auto_80491 ) ) ( not ( = ?auto_80492 ?auto_80490 ) ) ( not ( = ?auto_80488 ?auto_80494 ) ) ( not ( = ?auto_80488 ?auto_80492 ) ) ( not ( = ?auto_80489 ?auto_80494 ) ) ( not ( = ?auto_80489 ?auto_80492 ) ) ( ON ?auto_80488 ?auto_80495 ) ( not ( = ?auto_80488 ?auto_80495 ) ) ( not ( = ?auto_80489 ?auto_80495 ) ) ( not ( = ?auto_80490 ?auto_80495 ) ) ( not ( = ?auto_80491 ?auto_80495 ) ) ( not ( = ?auto_80493 ?auto_80495 ) ) ( not ( = ?auto_80494 ?auto_80495 ) ) ( not ( = ?auto_80492 ?auto_80495 ) ) ( ON ?auto_80489 ?auto_80488 ) ( ON-TABLE ?auto_80495 ) ( ON ?auto_80490 ?auto_80489 ) ( ON ?auto_80491 ?auto_80490 ) ( ON ?auto_80493 ?auto_80491 ) ( ON ?auto_80492 ?auto_80493 ) ( CLEAR ?auto_80492 ) ( HOLDING ?auto_80494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80494 )
      ( MAKE-4PILE ?auto_80488 ?auto_80489 ?auto_80490 ?auto_80491 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80496 - BLOCK
      ?auto_80497 - BLOCK
      ?auto_80498 - BLOCK
      ?auto_80499 - BLOCK
    )
    :vars
    (
      ?auto_80501 - BLOCK
      ?auto_80502 - BLOCK
      ?auto_80503 - BLOCK
      ?auto_80500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80496 ?auto_80497 ) ) ( not ( = ?auto_80496 ?auto_80498 ) ) ( not ( = ?auto_80496 ?auto_80499 ) ) ( not ( = ?auto_80497 ?auto_80498 ) ) ( not ( = ?auto_80497 ?auto_80499 ) ) ( not ( = ?auto_80498 ?auto_80499 ) ) ( not ( = ?auto_80496 ?auto_80501 ) ) ( not ( = ?auto_80497 ?auto_80501 ) ) ( not ( = ?auto_80498 ?auto_80501 ) ) ( not ( = ?auto_80499 ?auto_80501 ) ) ( not ( = ?auto_80502 ?auto_80503 ) ) ( not ( = ?auto_80502 ?auto_80501 ) ) ( not ( = ?auto_80502 ?auto_80499 ) ) ( not ( = ?auto_80502 ?auto_80498 ) ) ( not ( = ?auto_80503 ?auto_80501 ) ) ( not ( = ?auto_80503 ?auto_80499 ) ) ( not ( = ?auto_80503 ?auto_80498 ) ) ( not ( = ?auto_80496 ?auto_80502 ) ) ( not ( = ?auto_80496 ?auto_80503 ) ) ( not ( = ?auto_80497 ?auto_80502 ) ) ( not ( = ?auto_80497 ?auto_80503 ) ) ( ON ?auto_80496 ?auto_80500 ) ( not ( = ?auto_80496 ?auto_80500 ) ) ( not ( = ?auto_80497 ?auto_80500 ) ) ( not ( = ?auto_80498 ?auto_80500 ) ) ( not ( = ?auto_80499 ?auto_80500 ) ) ( not ( = ?auto_80501 ?auto_80500 ) ) ( not ( = ?auto_80502 ?auto_80500 ) ) ( not ( = ?auto_80503 ?auto_80500 ) ) ( ON ?auto_80497 ?auto_80496 ) ( ON-TABLE ?auto_80500 ) ( ON ?auto_80498 ?auto_80497 ) ( ON ?auto_80499 ?auto_80498 ) ( ON ?auto_80501 ?auto_80499 ) ( ON ?auto_80503 ?auto_80501 ) ( ON ?auto_80502 ?auto_80503 ) ( CLEAR ?auto_80502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80500 ?auto_80496 ?auto_80497 ?auto_80498 ?auto_80499 ?auto_80501 ?auto_80503 )
      ( MAKE-4PILE ?auto_80496 ?auto_80497 ?auto_80498 ?auto_80499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80506 - BLOCK
      ?auto_80507 - BLOCK
    )
    :vars
    (
      ?auto_80508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80508 ?auto_80507 ) ( CLEAR ?auto_80508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80506 ) ( ON ?auto_80507 ?auto_80506 ) ( not ( = ?auto_80506 ?auto_80507 ) ) ( not ( = ?auto_80506 ?auto_80508 ) ) ( not ( = ?auto_80507 ?auto_80508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80508 ?auto_80507 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80509 - BLOCK
      ?auto_80510 - BLOCK
    )
    :vars
    (
      ?auto_80511 - BLOCK
      ?auto_80512 - BLOCK
      ?auto_80513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80511 ?auto_80510 ) ( CLEAR ?auto_80511 ) ( ON-TABLE ?auto_80509 ) ( ON ?auto_80510 ?auto_80509 ) ( not ( = ?auto_80509 ?auto_80510 ) ) ( not ( = ?auto_80509 ?auto_80511 ) ) ( not ( = ?auto_80510 ?auto_80511 ) ) ( HOLDING ?auto_80512 ) ( CLEAR ?auto_80513 ) ( not ( = ?auto_80509 ?auto_80512 ) ) ( not ( = ?auto_80509 ?auto_80513 ) ) ( not ( = ?auto_80510 ?auto_80512 ) ) ( not ( = ?auto_80510 ?auto_80513 ) ) ( not ( = ?auto_80511 ?auto_80512 ) ) ( not ( = ?auto_80511 ?auto_80513 ) ) ( not ( = ?auto_80512 ?auto_80513 ) ) )
    :subtasks
    ( ( !STACK ?auto_80512 ?auto_80513 )
      ( MAKE-2PILE ?auto_80509 ?auto_80510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80514 - BLOCK
      ?auto_80515 - BLOCK
    )
    :vars
    (
      ?auto_80518 - BLOCK
      ?auto_80516 - BLOCK
      ?auto_80517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80518 ?auto_80515 ) ( ON-TABLE ?auto_80514 ) ( ON ?auto_80515 ?auto_80514 ) ( not ( = ?auto_80514 ?auto_80515 ) ) ( not ( = ?auto_80514 ?auto_80518 ) ) ( not ( = ?auto_80515 ?auto_80518 ) ) ( CLEAR ?auto_80516 ) ( not ( = ?auto_80514 ?auto_80517 ) ) ( not ( = ?auto_80514 ?auto_80516 ) ) ( not ( = ?auto_80515 ?auto_80517 ) ) ( not ( = ?auto_80515 ?auto_80516 ) ) ( not ( = ?auto_80518 ?auto_80517 ) ) ( not ( = ?auto_80518 ?auto_80516 ) ) ( not ( = ?auto_80517 ?auto_80516 ) ) ( ON ?auto_80517 ?auto_80518 ) ( CLEAR ?auto_80517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80514 ?auto_80515 ?auto_80518 )
      ( MAKE-2PILE ?auto_80514 ?auto_80515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80519 - BLOCK
      ?auto_80520 - BLOCK
    )
    :vars
    (
      ?auto_80521 - BLOCK
      ?auto_80522 - BLOCK
      ?auto_80523 - BLOCK
      ?auto_80525 - BLOCK
      ?auto_80524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80521 ?auto_80520 ) ( ON-TABLE ?auto_80519 ) ( ON ?auto_80520 ?auto_80519 ) ( not ( = ?auto_80519 ?auto_80520 ) ) ( not ( = ?auto_80519 ?auto_80521 ) ) ( not ( = ?auto_80520 ?auto_80521 ) ) ( not ( = ?auto_80519 ?auto_80522 ) ) ( not ( = ?auto_80519 ?auto_80523 ) ) ( not ( = ?auto_80520 ?auto_80522 ) ) ( not ( = ?auto_80520 ?auto_80523 ) ) ( not ( = ?auto_80521 ?auto_80522 ) ) ( not ( = ?auto_80521 ?auto_80523 ) ) ( not ( = ?auto_80522 ?auto_80523 ) ) ( ON ?auto_80522 ?auto_80521 ) ( CLEAR ?auto_80522 ) ( HOLDING ?auto_80523 ) ( CLEAR ?auto_80525 ) ( ON-TABLE ?auto_80524 ) ( ON ?auto_80525 ?auto_80524 ) ( not ( = ?auto_80524 ?auto_80525 ) ) ( not ( = ?auto_80524 ?auto_80523 ) ) ( not ( = ?auto_80525 ?auto_80523 ) ) ( not ( = ?auto_80519 ?auto_80525 ) ) ( not ( = ?auto_80519 ?auto_80524 ) ) ( not ( = ?auto_80520 ?auto_80525 ) ) ( not ( = ?auto_80520 ?auto_80524 ) ) ( not ( = ?auto_80521 ?auto_80525 ) ) ( not ( = ?auto_80521 ?auto_80524 ) ) ( not ( = ?auto_80522 ?auto_80525 ) ) ( not ( = ?auto_80522 ?auto_80524 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80524 ?auto_80525 ?auto_80523 )
      ( MAKE-2PILE ?auto_80519 ?auto_80520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80526 - BLOCK
      ?auto_80527 - BLOCK
    )
    :vars
    (
      ?auto_80532 - BLOCK
      ?auto_80531 - BLOCK
      ?auto_80530 - BLOCK
      ?auto_80529 - BLOCK
      ?auto_80528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80532 ?auto_80527 ) ( ON-TABLE ?auto_80526 ) ( ON ?auto_80527 ?auto_80526 ) ( not ( = ?auto_80526 ?auto_80527 ) ) ( not ( = ?auto_80526 ?auto_80532 ) ) ( not ( = ?auto_80527 ?auto_80532 ) ) ( not ( = ?auto_80526 ?auto_80531 ) ) ( not ( = ?auto_80526 ?auto_80530 ) ) ( not ( = ?auto_80527 ?auto_80531 ) ) ( not ( = ?auto_80527 ?auto_80530 ) ) ( not ( = ?auto_80532 ?auto_80531 ) ) ( not ( = ?auto_80532 ?auto_80530 ) ) ( not ( = ?auto_80531 ?auto_80530 ) ) ( ON ?auto_80531 ?auto_80532 ) ( CLEAR ?auto_80529 ) ( ON-TABLE ?auto_80528 ) ( ON ?auto_80529 ?auto_80528 ) ( not ( = ?auto_80528 ?auto_80529 ) ) ( not ( = ?auto_80528 ?auto_80530 ) ) ( not ( = ?auto_80529 ?auto_80530 ) ) ( not ( = ?auto_80526 ?auto_80529 ) ) ( not ( = ?auto_80526 ?auto_80528 ) ) ( not ( = ?auto_80527 ?auto_80529 ) ) ( not ( = ?auto_80527 ?auto_80528 ) ) ( not ( = ?auto_80532 ?auto_80529 ) ) ( not ( = ?auto_80532 ?auto_80528 ) ) ( not ( = ?auto_80531 ?auto_80529 ) ) ( not ( = ?auto_80531 ?auto_80528 ) ) ( ON ?auto_80530 ?auto_80531 ) ( CLEAR ?auto_80530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80526 ?auto_80527 ?auto_80532 ?auto_80531 )
      ( MAKE-2PILE ?auto_80526 ?auto_80527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80533 - BLOCK
      ?auto_80534 - BLOCK
    )
    :vars
    (
      ?auto_80536 - BLOCK
      ?auto_80537 - BLOCK
      ?auto_80535 - BLOCK
      ?auto_80538 - BLOCK
      ?auto_80539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80536 ?auto_80534 ) ( ON-TABLE ?auto_80533 ) ( ON ?auto_80534 ?auto_80533 ) ( not ( = ?auto_80533 ?auto_80534 ) ) ( not ( = ?auto_80533 ?auto_80536 ) ) ( not ( = ?auto_80534 ?auto_80536 ) ) ( not ( = ?auto_80533 ?auto_80537 ) ) ( not ( = ?auto_80533 ?auto_80535 ) ) ( not ( = ?auto_80534 ?auto_80537 ) ) ( not ( = ?auto_80534 ?auto_80535 ) ) ( not ( = ?auto_80536 ?auto_80537 ) ) ( not ( = ?auto_80536 ?auto_80535 ) ) ( not ( = ?auto_80537 ?auto_80535 ) ) ( ON ?auto_80537 ?auto_80536 ) ( ON-TABLE ?auto_80538 ) ( not ( = ?auto_80538 ?auto_80539 ) ) ( not ( = ?auto_80538 ?auto_80535 ) ) ( not ( = ?auto_80539 ?auto_80535 ) ) ( not ( = ?auto_80533 ?auto_80539 ) ) ( not ( = ?auto_80533 ?auto_80538 ) ) ( not ( = ?auto_80534 ?auto_80539 ) ) ( not ( = ?auto_80534 ?auto_80538 ) ) ( not ( = ?auto_80536 ?auto_80539 ) ) ( not ( = ?auto_80536 ?auto_80538 ) ) ( not ( = ?auto_80537 ?auto_80539 ) ) ( not ( = ?auto_80537 ?auto_80538 ) ) ( ON ?auto_80535 ?auto_80537 ) ( CLEAR ?auto_80535 ) ( HOLDING ?auto_80539 ) ( CLEAR ?auto_80538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80538 ?auto_80539 )
      ( MAKE-2PILE ?auto_80533 ?auto_80534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80540 - BLOCK
      ?auto_80541 - BLOCK
    )
    :vars
    (
      ?auto_80546 - BLOCK
      ?auto_80545 - BLOCK
      ?auto_80542 - BLOCK
      ?auto_80543 - BLOCK
      ?auto_80544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80546 ?auto_80541 ) ( ON-TABLE ?auto_80540 ) ( ON ?auto_80541 ?auto_80540 ) ( not ( = ?auto_80540 ?auto_80541 ) ) ( not ( = ?auto_80540 ?auto_80546 ) ) ( not ( = ?auto_80541 ?auto_80546 ) ) ( not ( = ?auto_80540 ?auto_80545 ) ) ( not ( = ?auto_80540 ?auto_80542 ) ) ( not ( = ?auto_80541 ?auto_80545 ) ) ( not ( = ?auto_80541 ?auto_80542 ) ) ( not ( = ?auto_80546 ?auto_80545 ) ) ( not ( = ?auto_80546 ?auto_80542 ) ) ( not ( = ?auto_80545 ?auto_80542 ) ) ( ON ?auto_80545 ?auto_80546 ) ( ON-TABLE ?auto_80543 ) ( not ( = ?auto_80543 ?auto_80544 ) ) ( not ( = ?auto_80543 ?auto_80542 ) ) ( not ( = ?auto_80544 ?auto_80542 ) ) ( not ( = ?auto_80540 ?auto_80544 ) ) ( not ( = ?auto_80540 ?auto_80543 ) ) ( not ( = ?auto_80541 ?auto_80544 ) ) ( not ( = ?auto_80541 ?auto_80543 ) ) ( not ( = ?auto_80546 ?auto_80544 ) ) ( not ( = ?auto_80546 ?auto_80543 ) ) ( not ( = ?auto_80545 ?auto_80544 ) ) ( not ( = ?auto_80545 ?auto_80543 ) ) ( ON ?auto_80542 ?auto_80545 ) ( CLEAR ?auto_80543 ) ( ON ?auto_80544 ?auto_80542 ) ( CLEAR ?auto_80544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80540 ?auto_80541 ?auto_80546 ?auto_80545 ?auto_80542 )
      ( MAKE-2PILE ?auto_80540 ?auto_80541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80547 - BLOCK
      ?auto_80548 - BLOCK
    )
    :vars
    (
      ?auto_80549 - BLOCK
      ?auto_80552 - BLOCK
      ?auto_80551 - BLOCK
      ?auto_80553 - BLOCK
      ?auto_80550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80549 ?auto_80548 ) ( ON-TABLE ?auto_80547 ) ( ON ?auto_80548 ?auto_80547 ) ( not ( = ?auto_80547 ?auto_80548 ) ) ( not ( = ?auto_80547 ?auto_80549 ) ) ( not ( = ?auto_80548 ?auto_80549 ) ) ( not ( = ?auto_80547 ?auto_80552 ) ) ( not ( = ?auto_80547 ?auto_80551 ) ) ( not ( = ?auto_80548 ?auto_80552 ) ) ( not ( = ?auto_80548 ?auto_80551 ) ) ( not ( = ?auto_80549 ?auto_80552 ) ) ( not ( = ?auto_80549 ?auto_80551 ) ) ( not ( = ?auto_80552 ?auto_80551 ) ) ( ON ?auto_80552 ?auto_80549 ) ( not ( = ?auto_80553 ?auto_80550 ) ) ( not ( = ?auto_80553 ?auto_80551 ) ) ( not ( = ?auto_80550 ?auto_80551 ) ) ( not ( = ?auto_80547 ?auto_80550 ) ) ( not ( = ?auto_80547 ?auto_80553 ) ) ( not ( = ?auto_80548 ?auto_80550 ) ) ( not ( = ?auto_80548 ?auto_80553 ) ) ( not ( = ?auto_80549 ?auto_80550 ) ) ( not ( = ?auto_80549 ?auto_80553 ) ) ( not ( = ?auto_80552 ?auto_80550 ) ) ( not ( = ?auto_80552 ?auto_80553 ) ) ( ON ?auto_80551 ?auto_80552 ) ( ON ?auto_80550 ?auto_80551 ) ( CLEAR ?auto_80550 ) ( HOLDING ?auto_80553 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80553 )
      ( MAKE-2PILE ?auto_80547 ?auto_80548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80554 - BLOCK
      ?auto_80555 - BLOCK
    )
    :vars
    (
      ?auto_80560 - BLOCK
      ?auto_80557 - BLOCK
      ?auto_80559 - BLOCK
      ?auto_80558 - BLOCK
      ?auto_80556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80560 ?auto_80555 ) ( ON-TABLE ?auto_80554 ) ( ON ?auto_80555 ?auto_80554 ) ( not ( = ?auto_80554 ?auto_80555 ) ) ( not ( = ?auto_80554 ?auto_80560 ) ) ( not ( = ?auto_80555 ?auto_80560 ) ) ( not ( = ?auto_80554 ?auto_80557 ) ) ( not ( = ?auto_80554 ?auto_80559 ) ) ( not ( = ?auto_80555 ?auto_80557 ) ) ( not ( = ?auto_80555 ?auto_80559 ) ) ( not ( = ?auto_80560 ?auto_80557 ) ) ( not ( = ?auto_80560 ?auto_80559 ) ) ( not ( = ?auto_80557 ?auto_80559 ) ) ( ON ?auto_80557 ?auto_80560 ) ( not ( = ?auto_80558 ?auto_80556 ) ) ( not ( = ?auto_80558 ?auto_80559 ) ) ( not ( = ?auto_80556 ?auto_80559 ) ) ( not ( = ?auto_80554 ?auto_80556 ) ) ( not ( = ?auto_80554 ?auto_80558 ) ) ( not ( = ?auto_80555 ?auto_80556 ) ) ( not ( = ?auto_80555 ?auto_80558 ) ) ( not ( = ?auto_80560 ?auto_80556 ) ) ( not ( = ?auto_80560 ?auto_80558 ) ) ( not ( = ?auto_80557 ?auto_80556 ) ) ( not ( = ?auto_80557 ?auto_80558 ) ) ( ON ?auto_80559 ?auto_80557 ) ( ON ?auto_80556 ?auto_80559 ) ( ON ?auto_80558 ?auto_80556 ) ( CLEAR ?auto_80558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80554 ?auto_80555 ?auto_80560 ?auto_80557 ?auto_80559 ?auto_80556 )
      ( MAKE-2PILE ?auto_80554 ?auto_80555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80561 - BLOCK
      ?auto_80562 - BLOCK
    )
    :vars
    (
      ?auto_80564 - BLOCK
      ?auto_80566 - BLOCK
      ?auto_80565 - BLOCK
      ?auto_80563 - BLOCK
      ?auto_80567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80564 ?auto_80562 ) ( ON-TABLE ?auto_80561 ) ( ON ?auto_80562 ?auto_80561 ) ( not ( = ?auto_80561 ?auto_80562 ) ) ( not ( = ?auto_80561 ?auto_80564 ) ) ( not ( = ?auto_80562 ?auto_80564 ) ) ( not ( = ?auto_80561 ?auto_80566 ) ) ( not ( = ?auto_80561 ?auto_80565 ) ) ( not ( = ?auto_80562 ?auto_80566 ) ) ( not ( = ?auto_80562 ?auto_80565 ) ) ( not ( = ?auto_80564 ?auto_80566 ) ) ( not ( = ?auto_80564 ?auto_80565 ) ) ( not ( = ?auto_80566 ?auto_80565 ) ) ( ON ?auto_80566 ?auto_80564 ) ( not ( = ?auto_80563 ?auto_80567 ) ) ( not ( = ?auto_80563 ?auto_80565 ) ) ( not ( = ?auto_80567 ?auto_80565 ) ) ( not ( = ?auto_80561 ?auto_80567 ) ) ( not ( = ?auto_80561 ?auto_80563 ) ) ( not ( = ?auto_80562 ?auto_80567 ) ) ( not ( = ?auto_80562 ?auto_80563 ) ) ( not ( = ?auto_80564 ?auto_80567 ) ) ( not ( = ?auto_80564 ?auto_80563 ) ) ( not ( = ?auto_80566 ?auto_80567 ) ) ( not ( = ?auto_80566 ?auto_80563 ) ) ( ON ?auto_80565 ?auto_80566 ) ( ON ?auto_80567 ?auto_80565 ) ( HOLDING ?auto_80563 ) ( CLEAR ?auto_80567 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80561 ?auto_80562 ?auto_80564 ?auto_80566 ?auto_80565 ?auto_80567 ?auto_80563 )
      ( MAKE-2PILE ?auto_80561 ?auto_80562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80568 - BLOCK
      ?auto_80569 - BLOCK
    )
    :vars
    (
      ?auto_80572 - BLOCK
      ?auto_80570 - BLOCK
      ?auto_80573 - BLOCK
      ?auto_80574 - BLOCK
      ?auto_80571 - BLOCK
      ?auto_80575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80572 ?auto_80569 ) ( ON-TABLE ?auto_80568 ) ( ON ?auto_80569 ?auto_80568 ) ( not ( = ?auto_80568 ?auto_80569 ) ) ( not ( = ?auto_80568 ?auto_80572 ) ) ( not ( = ?auto_80569 ?auto_80572 ) ) ( not ( = ?auto_80568 ?auto_80570 ) ) ( not ( = ?auto_80568 ?auto_80573 ) ) ( not ( = ?auto_80569 ?auto_80570 ) ) ( not ( = ?auto_80569 ?auto_80573 ) ) ( not ( = ?auto_80572 ?auto_80570 ) ) ( not ( = ?auto_80572 ?auto_80573 ) ) ( not ( = ?auto_80570 ?auto_80573 ) ) ( ON ?auto_80570 ?auto_80572 ) ( not ( = ?auto_80574 ?auto_80571 ) ) ( not ( = ?auto_80574 ?auto_80573 ) ) ( not ( = ?auto_80571 ?auto_80573 ) ) ( not ( = ?auto_80568 ?auto_80571 ) ) ( not ( = ?auto_80568 ?auto_80574 ) ) ( not ( = ?auto_80569 ?auto_80571 ) ) ( not ( = ?auto_80569 ?auto_80574 ) ) ( not ( = ?auto_80572 ?auto_80571 ) ) ( not ( = ?auto_80572 ?auto_80574 ) ) ( not ( = ?auto_80570 ?auto_80571 ) ) ( not ( = ?auto_80570 ?auto_80574 ) ) ( ON ?auto_80573 ?auto_80570 ) ( ON ?auto_80571 ?auto_80573 ) ( CLEAR ?auto_80571 ) ( ON ?auto_80574 ?auto_80575 ) ( CLEAR ?auto_80574 ) ( HAND-EMPTY ) ( not ( = ?auto_80568 ?auto_80575 ) ) ( not ( = ?auto_80569 ?auto_80575 ) ) ( not ( = ?auto_80572 ?auto_80575 ) ) ( not ( = ?auto_80570 ?auto_80575 ) ) ( not ( = ?auto_80573 ?auto_80575 ) ) ( not ( = ?auto_80574 ?auto_80575 ) ) ( not ( = ?auto_80571 ?auto_80575 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80574 ?auto_80575 )
      ( MAKE-2PILE ?auto_80568 ?auto_80569 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80576 - BLOCK
      ?auto_80577 - BLOCK
    )
    :vars
    (
      ?auto_80579 - BLOCK
      ?auto_80581 - BLOCK
      ?auto_80578 - BLOCK
      ?auto_80580 - BLOCK
      ?auto_80583 - BLOCK
      ?auto_80582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80579 ?auto_80577 ) ( ON-TABLE ?auto_80576 ) ( ON ?auto_80577 ?auto_80576 ) ( not ( = ?auto_80576 ?auto_80577 ) ) ( not ( = ?auto_80576 ?auto_80579 ) ) ( not ( = ?auto_80577 ?auto_80579 ) ) ( not ( = ?auto_80576 ?auto_80581 ) ) ( not ( = ?auto_80576 ?auto_80578 ) ) ( not ( = ?auto_80577 ?auto_80581 ) ) ( not ( = ?auto_80577 ?auto_80578 ) ) ( not ( = ?auto_80579 ?auto_80581 ) ) ( not ( = ?auto_80579 ?auto_80578 ) ) ( not ( = ?auto_80581 ?auto_80578 ) ) ( ON ?auto_80581 ?auto_80579 ) ( not ( = ?auto_80580 ?auto_80583 ) ) ( not ( = ?auto_80580 ?auto_80578 ) ) ( not ( = ?auto_80583 ?auto_80578 ) ) ( not ( = ?auto_80576 ?auto_80583 ) ) ( not ( = ?auto_80576 ?auto_80580 ) ) ( not ( = ?auto_80577 ?auto_80583 ) ) ( not ( = ?auto_80577 ?auto_80580 ) ) ( not ( = ?auto_80579 ?auto_80583 ) ) ( not ( = ?auto_80579 ?auto_80580 ) ) ( not ( = ?auto_80581 ?auto_80583 ) ) ( not ( = ?auto_80581 ?auto_80580 ) ) ( ON ?auto_80578 ?auto_80581 ) ( ON ?auto_80580 ?auto_80582 ) ( CLEAR ?auto_80580 ) ( not ( = ?auto_80576 ?auto_80582 ) ) ( not ( = ?auto_80577 ?auto_80582 ) ) ( not ( = ?auto_80579 ?auto_80582 ) ) ( not ( = ?auto_80581 ?auto_80582 ) ) ( not ( = ?auto_80578 ?auto_80582 ) ) ( not ( = ?auto_80580 ?auto_80582 ) ) ( not ( = ?auto_80583 ?auto_80582 ) ) ( HOLDING ?auto_80583 ) ( CLEAR ?auto_80578 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80576 ?auto_80577 ?auto_80579 ?auto_80581 ?auto_80578 ?auto_80583 )
      ( MAKE-2PILE ?auto_80576 ?auto_80577 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80584 - BLOCK
      ?auto_80585 - BLOCK
    )
    :vars
    (
      ?auto_80589 - BLOCK
      ?auto_80591 - BLOCK
      ?auto_80588 - BLOCK
      ?auto_80587 - BLOCK
      ?auto_80586 - BLOCK
      ?auto_80590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80589 ?auto_80585 ) ( ON-TABLE ?auto_80584 ) ( ON ?auto_80585 ?auto_80584 ) ( not ( = ?auto_80584 ?auto_80585 ) ) ( not ( = ?auto_80584 ?auto_80589 ) ) ( not ( = ?auto_80585 ?auto_80589 ) ) ( not ( = ?auto_80584 ?auto_80591 ) ) ( not ( = ?auto_80584 ?auto_80588 ) ) ( not ( = ?auto_80585 ?auto_80591 ) ) ( not ( = ?auto_80585 ?auto_80588 ) ) ( not ( = ?auto_80589 ?auto_80591 ) ) ( not ( = ?auto_80589 ?auto_80588 ) ) ( not ( = ?auto_80591 ?auto_80588 ) ) ( ON ?auto_80591 ?auto_80589 ) ( not ( = ?auto_80587 ?auto_80586 ) ) ( not ( = ?auto_80587 ?auto_80588 ) ) ( not ( = ?auto_80586 ?auto_80588 ) ) ( not ( = ?auto_80584 ?auto_80586 ) ) ( not ( = ?auto_80584 ?auto_80587 ) ) ( not ( = ?auto_80585 ?auto_80586 ) ) ( not ( = ?auto_80585 ?auto_80587 ) ) ( not ( = ?auto_80589 ?auto_80586 ) ) ( not ( = ?auto_80589 ?auto_80587 ) ) ( not ( = ?auto_80591 ?auto_80586 ) ) ( not ( = ?auto_80591 ?auto_80587 ) ) ( ON ?auto_80588 ?auto_80591 ) ( ON ?auto_80587 ?auto_80590 ) ( not ( = ?auto_80584 ?auto_80590 ) ) ( not ( = ?auto_80585 ?auto_80590 ) ) ( not ( = ?auto_80589 ?auto_80590 ) ) ( not ( = ?auto_80591 ?auto_80590 ) ) ( not ( = ?auto_80588 ?auto_80590 ) ) ( not ( = ?auto_80587 ?auto_80590 ) ) ( not ( = ?auto_80586 ?auto_80590 ) ) ( CLEAR ?auto_80588 ) ( ON ?auto_80586 ?auto_80587 ) ( CLEAR ?auto_80586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80590 ?auto_80587 )
      ( MAKE-2PILE ?auto_80584 ?auto_80585 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80592 - BLOCK
      ?auto_80593 - BLOCK
    )
    :vars
    (
      ?auto_80595 - BLOCK
      ?auto_80599 - BLOCK
      ?auto_80596 - BLOCK
      ?auto_80594 - BLOCK
      ?auto_80597 - BLOCK
      ?auto_80598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80595 ?auto_80593 ) ( ON-TABLE ?auto_80592 ) ( ON ?auto_80593 ?auto_80592 ) ( not ( = ?auto_80592 ?auto_80593 ) ) ( not ( = ?auto_80592 ?auto_80595 ) ) ( not ( = ?auto_80593 ?auto_80595 ) ) ( not ( = ?auto_80592 ?auto_80599 ) ) ( not ( = ?auto_80592 ?auto_80596 ) ) ( not ( = ?auto_80593 ?auto_80599 ) ) ( not ( = ?auto_80593 ?auto_80596 ) ) ( not ( = ?auto_80595 ?auto_80599 ) ) ( not ( = ?auto_80595 ?auto_80596 ) ) ( not ( = ?auto_80599 ?auto_80596 ) ) ( ON ?auto_80599 ?auto_80595 ) ( not ( = ?auto_80594 ?auto_80597 ) ) ( not ( = ?auto_80594 ?auto_80596 ) ) ( not ( = ?auto_80597 ?auto_80596 ) ) ( not ( = ?auto_80592 ?auto_80597 ) ) ( not ( = ?auto_80592 ?auto_80594 ) ) ( not ( = ?auto_80593 ?auto_80597 ) ) ( not ( = ?auto_80593 ?auto_80594 ) ) ( not ( = ?auto_80595 ?auto_80597 ) ) ( not ( = ?auto_80595 ?auto_80594 ) ) ( not ( = ?auto_80599 ?auto_80597 ) ) ( not ( = ?auto_80599 ?auto_80594 ) ) ( ON ?auto_80594 ?auto_80598 ) ( not ( = ?auto_80592 ?auto_80598 ) ) ( not ( = ?auto_80593 ?auto_80598 ) ) ( not ( = ?auto_80595 ?auto_80598 ) ) ( not ( = ?auto_80599 ?auto_80598 ) ) ( not ( = ?auto_80596 ?auto_80598 ) ) ( not ( = ?auto_80594 ?auto_80598 ) ) ( not ( = ?auto_80597 ?auto_80598 ) ) ( ON ?auto_80597 ?auto_80594 ) ( CLEAR ?auto_80597 ) ( ON-TABLE ?auto_80598 ) ( HOLDING ?auto_80596 ) ( CLEAR ?auto_80599 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80592 ?auto_80593 ?auto_80595 ?auto_80599 ?auto_80596 )
      ( MAKE-2PILE ?auto_80592 ?auto_80593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80600 - BLOCK
      ?auto_80601 - BLOCK
    )
    :vars
    (
      ?auto_80603 - BLOCK
      ?auto_80602 - BLOCK
      ?auto_80605 - BLOCK
      ?auto_80604 - BLOCK
      ?auto_80606 - BLOCK
      ?auto_80607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80603 ?auto_80601 ) ( ON-TABLE ?auto_80600 ) ( ON ?auto_80601 ?auto_80600 ) ( not ( = ?auto_80600 ?auto_80601 ) ) ( not ( = ?auto_80600 ?auto_80603 ) ) ( not ( = ?auto_80601 ?auto_80603 ) ) ( not ( = ?auto_80600 ?auto_80602 ) ) ( not ( = ?auto_80600 ?auto_80605 ) ) ( not ( = ?auto_80601 ?auto_80602 ) ) ( not ( = ?auto_80601 ?auto_80605 ) ) ( not ( = ?auto_80603 ?auto_80602 ) ) ( not ( = ?auto_80603 ?auto_80605 ) ) ( not ( = ?auto_80602 ?auto_80605 ) ) ( ON ?auto_80602 ?auto_80603 ) ( not ( = ?auto_80604 ?auto_80606 ) ) ( not ( = ?auto_80604 ?auto_80605 ) ) ( not ( = ?auto_80606 ?auto_80605 ) ) ( not ( = ?auto_80600 ?auto_80606 ) ) ( not ( = ?auto_80600 ?auto_80604 ) ) ( not ( = ?auto_80601 ?auto_80606 ) ) ( not ( = ?auto_80601 ?auto_80604 ) ) ( not ( = ?auto_80603 ?auto_80606 ) ) ( not ( = ?auto_80603 ?auto_80604 ) ) ( not ( = ?auto_80602 ?auto_80606 ) ) ( not ( = ?auto_80602 ?auto_80604 ) ) ( ON ?auto_80604 ?auto_80607 ) ( not ( = ?auto_80600 ?auto_80607 ) ) ( not ( = ?auto_80601 ?auto_80607 ) ) ( not ( = ?auto_80603 ?auto_80607 ) ) ( not ( = ?auto_80602 ?auto_80607 ) ) ( not ( = ?auto_80605 ?auto_80607 ) ) ( not ( = ?auto_80604 ?auto_80607 ) ) ( not ( = ?auto_80606 ?auto_80607 ) ) ( ON ?auto_80606 ?auto_80604 ) ( ON-TABLE ?auto_80607 ) ( CLEAR ?auto_80602 ) ( ON ?auto_80605 ?auto_80606 ) ( CLEAR ?auto_80605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80607 ?auto_80604 ?auto_80606 )
      ( MAKE-2PILE ?auto_80600 ?auto_80601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80608 - BLOCK
      ?auto_80609 - BLOCK
    )
    :vars
    (
      ?auto_80615 - BLOCK
      ?auto_80613 - BLOCK
      ?auto_80614 - BLOCK
      ?auto_80610 - BLOCK
      ?auto_80611 - BLOCK
      ?auto_80612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80615 ?auto_80609 ) ( ON-TABLE ?auto_80608 ) ( ON ?auto_80609 ?auto_80608 ) ( not ( = ?auto_80608 ?auto_80609 ) ) ( not ( = ?auto_80608 ?auto_80615 ) ) ( not ( = ?auto_80609 ?auto_80615 ) ) ( not ( = ?auto_80608 ?auto_80613 ) ) ( not ( = ?auto_80608 ?auto_80614 ) ) ( not ( = ?auto_80609 ?auto_80613 ) ) ( not ( = ?auto_80609 ?auto_80614 ) ) ( not ( = ?auto_80615 ?auto_80613 ) ) ( not ( = ?auto_80615 ?auto_80614 ) ) ( not ( = ?auto_80613 ?auto_80614 ) ) ( not ( = ?auto_80610 ?auto_80611 ) ) ( not ( = ?auto_80610 ?auto_80614 ) ) ( not ( = ?auto_80611 ?auto_80614 ) ) ( not ( = ?auto_80608 ?auto_80611 ) ) ( not ( = ?auto_80608 ?auto_80610 ) ) ( not ( = ?auto_80609 ?auto_80611 ) ) ( not ( = ?auto_80609 ?auto_80610 ) ) ( not ( = ?auto_80615 ?auto_80611 ) ) ( not ( = ?auto_80615 ?auto_80610 ) ) ( not ( = ?auto_80613 ?auto_80611 ) ) ( not ( = ?auto_80613 ?auto_80610 ) ) ( ON ?auto_80610 ?auto_80612 ) ( not ( = ?auto_80608 ?auto_80612 ) ) ( not ( = ?auto_80609 ?auto_80612 ) ) ( not ( = ?auto_80615 ?auto_80612 ) ) ( not ( = ?auto_80613 ?auto_80612 ) ) ( not ( = ?auto_80614 ?auto_80612 ) ) ( not ( = ?auto_80610 ?auto_80612 ) ) ( not ( = ?auto_80611 ?auto_80612 ) ) ( ON ?auto_80611 ?auto_80610 ) ( ON-TABLE ?auto_80612 ) ( ON ?auto_80614 ?auto_80611 ) ( CLEAR ?auto_80614 ) ( HOLDING ?auto_80613 ) ( CLEAR ?auto_80615 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80608 ?auto_80609 ?auto_80615 ?auto_80613 )
      ( MAKE-2PILE ?auto_80608 ?auto_80609 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80616 - BLOCK
      ?auto_80617 - BLOCK
    )
    :vars
    (
      ?auto_80622 - BLOCK
      ?auto_80620 - BLOCK
      ?auto_80623 - BLOCK
      ?auto_80619 - BLOCK
      ?auto_80621 - BLOCK
      ?auto_80618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80622 ?auto_80617 ) ( ON-TABLE ?auto_80616 ) ( ON ?auto_80617 ?auto_80616 ) ( not ( = ?auto_80616 ?auto_80617 ) ) ( not ( = ?auto_80616 ?auto_80622 ) ) ( not ( = ?auto_80617 ?auto_80622 ) ) ( not ( = ?auto_80616 ?auto_80620 ) ) ( not ( = ?auto_80616 ?auto_80623 ) ) ( not ( = ?auto_80617 ?auto_80620 ) ) ( not ( = ?auto_80617 ?auto_80623 ) ) ( not ( = ?auto_80622 ?auto_80620 ) ) ( not ( = ?auto_80622 ?auto_80623 ) ) ( not ( = ?auto_80620 ?auto_80623 ) ) ( not ( = ?auto_80619 ?auto_80621 ) ) ( not ( = ?auto_80619 ?auto_80623 ) ) ( not ( = ?auto_80621 ?auto_80623 ) ) ( not ( = ?auto_80616 ?auto_80621 ) ) ( not ( = ?auto_80616 ?auto_80619 ) ) ( not ( = ?auto_80617 ?auto_80621 ) ) ( not ( = ?auto_80617 ?auto_80619 ) ) ( not ( = ?auto_80622 ?auto_80621 ) ) ( not ( = ?auto_80622 ?auto_80619 ) ) ( not ( = ?auto_80620 ?auto_80621 ) ) ( not ( = ?auto_80620 ?auto_80619 ) ) ( ON ?auto_80619 ?auto_80618 ) ( not ( = ?auto_80616 ?auto_80618 ) ) ( not ( = ?auto_80617 ?auto_80618 ) ) ( not ( = ?auto_80622 ?auto_80618 ) ) ( not ( = ?auto_80620 ?auto_80618 ) ) ( not ( = ?auto_80623 ?auto_80618 ) ) ( not ( = ?auto_80619 ?auto_80618 ) ) ( not ( = ?auto_80621 ?auto_80618 ) ) ( ON ?auto_80621 ?auto_80619 ) ( ON-TABLE ?auto_80618 ) ( ON ?auto_80623 ?auto_80621 ) ( CLEAR ?auto_80622 ) ( ON ?auto_80620 ?auto_80623 ) ( CLEAR ?auto_80620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80618 ?auto_80619 ?auto_80621 ?auto_80623 )
      ( MAKE-2PILE ?auto_80616 ?auto_80617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80640 - BLOCK
      ?auto_80641 - BLOCK
    )
    :vars
    (
      ?auto_80643 - BLOCK
      ?auto_80642 - BLOCK
      ?auto_80645 - BLOCK
      ?auto_80647 - BLOCK
      ?auto_80646 - BLOCK
      ?auto_80644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80640 ) ( not ( = ?auto_80640 ?auto_80641 ) ) ( not ( = ?auto_80640 ?auto_80643 ) ) ( not ( = ?auto_80641 ?auto_80643 ) ) ( not ( = ?auto_80640 ?auto_80642 ) ) ( not ( = ?auto_80640 ?auto_80645 ) ) ( not ( = ?auto_80641 ?auto_80642 ) ) ( not ( = ?auto_80641 ?auto_80645 ) ) ( not ( = ?auto_80643 ?auto_80642 ) ) ( not ( = ?auto_80643 ?auto_80645 ) ) ( not ( = ?auto_80642 ?auto_80645 ) ) ( not ( = ?auto_80647 ?auto_80646 ) ) ( not ( = ?auto_80647 ?auto_80645 ) ) ( not ( = ?auto_80646 ?auto_80645 ) ) ( not ( = ?auto_80640 ?auto_80646 ) ) ( not ( = ?auto_80640 ?auto_80647 ) ) ( not ( = ?auto_80641 ?auto_80646 ) ) ( not ( = ?auto_80641 ?auto_80647 ) ) ( not ( = ?auto_80643 ?auto_80646 ) ) ( not ( = ?auto_80643 ?auto_80647 ) ) ( not ( = ?auto_80642 ?auto_80646 ) ) ( not ( = ?auto_80642 ?auto_80647 ) ) ( ON ?auto_80647 ?auto_80644 ) ( not ( = ?auto_80640 ?auto_80644 ) ) ( not ( = ?auto_80641 ?auto_80644 ) ) ( not ( = ?auto_80643 ?auto_80644 ) ) ( not ( = ?auto_80642 ?auto_80644 ) ) ( not ( = ?auto_80645 ?auto_80644 ) ) ( not ( = ?auto_80647 ?auto_80644 ) ) ( not ( = ?auto_80646 ?auto_80644 ) ) ( ON ?auto_80646 ?auto_80647 ) ( ON-TABLE ?auto_80644 ) ( ON ?auto_80645 ?auto_80646 ) ( ON ?auto_80642 ?auto_80645 ) ( ON ?auto_80643 ?auto_80642 ) ( CLEAR ?auto_80643 ) ( HOLDING ?auto_80641 ) ( CLEAR ?auto_80640 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80640 ?auto_80641 ?auto_80643 )
      ( MAKE-2PILE ?auto_80640 ?auto_80641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80648 - BLOCK
      ?auto_80649 - BLOCK
    )
    :vars
    (
      ?auto_80650 - BLOCK
      ?auto_80652 - BLOCK
      ?auto_80651 - BLOCK
      ?auto_80655 - BLOCK
      ?auto_80654 - BLOCK
      ?auto_80653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80648 ) ( not ( = ?auto_80648 ?auto_80649 ) ) ( not ( = ?auto_80648 ?auto_80650 ) ) ( not ( = ?auto_80649 ?auto_80650 ) ) ( not ( = ?auto_80648 ?auto_80652 ) ) ( not ( = ?auto_80648 ?auto_80651 ) ) ( not ( = ?auto_80649 ?auto_80652 ) ) ( not ( = ?auto_80649 ?auto_80651 ) ) ( not ( = ?auto_80650 ?auto_80652 ) ) ( not ( = ?auto_80650 ?auto_80651 ) ) ( not ( = ?auto_80652 ?auto_80651 ) ) ( not ( = ?auto_80655 ?auto_80654 ) ) ( not ( = ?auto_80655 ?auto_80651 ) ) ( not ( = ?auto_80654 ?auto_80651 ) ) ( not ( = ?auto_80648 ?auto_80654 ) ) ( not ( = ?auto_80648 ?auto_80655 ) ) ( not ( = ?auto_80649 ?auto_80654 ) ) ( not ( = ?auto_80649 ?auto_80655 ) ) ( not ( = ?auto_80650 ?auto_80654 ) ) ( not ( = ?auto_80650 ?auto_80655 ) ) ( not ( = ?auto_80652 ?auto_80654 ) ) ( not ( = ?auto_80652 ?auto_80655 ) ) ( ON ?auto_80655 ?auto_80653 ) ( not ( = ?auto_80648 ?auto_80653 ) ) ( not ( = ?auto_80649 ?auto_80653 ) ) ( not ( = ?auto_80650 ?auto_80653 ) ) ( not ( = ?auto_80652 ?auto_80653 ) ) ( not ( = ?auto_80651 ?auto_80653 ) ) ( not ( = ?auto_80655 ?auto_80653 ) ) ( not ( = ?auto_80654 ?auto_80653 ) ) ( ON ?auto_80654 ?auto_80655 ) ( ON-TABLE ?auto_80653 ) ( ON ?auto_80651 ?auto_80654 ) ( ON ?auto_80652 ?auto_80651 ) ( ON ?auto_80650 ?auto_80652 ) ( CLEAR ?auto_80648 ) ( ON ?auto_80649 ?auto_80650 ) ( CLEAR ?auto_80649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80653 ?auto_80655 ?auto_80654 ?auto_80651 ?auto_80652 ?auto_80650 )
      ( MAKE-2PILE ?auto_80648 ?auto_80649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80656 - BLOCK
      ?auto_80657 - BLOCK
    )
    :vars
    (
      ?auto_80659 - BLOCK
      ?auto_80662 - BLOCK
      ?auto_80663 - BLOCK
      ?auto_80658 - BLOCK
      ?auto_80661 - BLOCK
      ?auto_80660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80656 ?auto_80657 ) ) ( not ( = ?auto_80656 ?auto_80659 ) ) ( not ( = ?auto_80657 ?auto_80659 ) ) ( not ( = ?auto_80656 ?auto_80662 ) ) ( not ( = ?auto_80656 ?auto_80663 ) ) ( not ( = ?auto_80657 ?auto_80662 ) ) ( not ( = ?auto_80657 ?auto_80663 ) ) ( not ( = ?auto_80659 ?auto_80662 ) ) ( not ( = ?auto_80659 ?auto_80663 ) ) ( not ( = ?auto_80662 ?auto_80663 ) ) ( not ( = ?auto_80658 ?auto_80661 ) ) ( not ( = ?auto_80658 ?auto_80663 ) ) ( not ( = ?auto_80661 ?auto_80663 ) ) ( not ( = ?auto_80656 ?auto_80661 ) ) ( not ( = ?auto_80656 ?auto_80658 ) ) ( not ( = ?auto_80657 ?auto_80661 ) ) ( not ( = ?auto_80657 ?auto_80658 ) ) ( not ( = ?auto_80659 ?auto_80661 ) ) ( not ( = ?auto_80659 ?auto_80658 ) ) ( not ( = ?auto_80662 ?auto_80661 ) ) ( not ( = ?auto_80662 ?auto_80658 ) ) ( ON ?auto_80658 ?auto_80660 ) ( not ( = ?auto_80656 ?auto_80660 ) ) ( not ( = ?auto_80657 ?auto_80660 ) ) ( not ( = ?auto_80659 ?auto_80660 ) ) ( not ( = ?auto_80662 ?auto_80660 ) ) ( not ( = ?auto_80663 ?auto_80660 ) ) ( not ( = ?auto_80658 ?auto_80660 ) ) ( not ( = ?auto_80661 ?auto_80660 ) ) ( ON ?auto_80661 ?auto_80658 ) ( ON-TABLE ?auto_80660 ) ( ON ?auto_80663 ?auto_80661 ) ( ON ?auto_80662 ?auto_80663 ) ( ON ?auto_80659 ?auto_80662 ) ( ON ?auto_80657 ?auto_80659 ) ( CLEAR ?auto_80657 ) ( HOLDING ?auto_80656 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80656 )
      ( MAKE-2PILE ?auto_80656 ?auto_80657 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80664 - BLOCK
      ?auto_80665 - BLOCK
    )
    :vars
    (
      ?auto_80670 - BLOCK
      ?auto_80667 - BLOCK
      ?auto_80669 - BLOCK
      ?auto_80666 - BLOCK
      ?auto_80671 - BLOCK
      ?auto_80668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80664 ?auto_80665 ) ) ( not ( = ?auto_80664 ?auto_80670 ) ) ( not ( = ?auto_80665 ?auto_80670 ) ) ( not ( = ?auto_80664 ?auto_80667 ) ) ( not ( = ?auto_80664 ?auto_80669 ) ) ( not ( = ?auto_80665 ?auto_80667 ) ) ( not ( = ?auto_80665 ?auto_80669 ) ) ( not ( = ?auto_80670 ?auto_80667 ) ) ( not ( = ?auto_80670 ?auto_80669 ) ) ( not ( = ?auto_80667 ?auto_80669 ) ) ( not ( = ?auto_80666 ?auto_80671 ) ) ( not ( = ?auto_80666 ?auto_80669 ) ) ( not ( = ?auto_80671 ?auto_80669 ) ) ( not ( = ?auto_80664 ?auto_80671 ) ) ( not ( = ?auto_80664 ?auto_80666 ) ) ( not ( = ?auto_80665 ?auto_80671 ) ) ( not ( = ?auto_80665 ?auto_80666 ) ) ( not ( = ?auto_80670 ?auto_80671 ) ) ( not ( = ?auto_80670 ?auto_80666 ) ) ( not ( = ?auto_80667 ?auto_80671 ) ) ( not ( = ?auto_80667 ?auto_80666 ) ) ( ON ?auto_80666 ?auto_80668 ) ( not ( = ?auto_80664 ?auto_80668 ) ) ( not ( = ?auto_80665 ?auto_80668 ) ) ( not ( = ?auto_80670 ?auto_80668 ) ) ( not ( = ?auto_80667 ?auto_80668 ) ) ( not ( = ?auto_80669 ?auto_80668 ) ) ( not ( = ?auto_80666 ?auto_80668 ) ) ( not ( = ?auto_80671 ?auto_80668 ) ) ( ON ?auto_80671 ?auto_80666 ) ( ON-TABLE ?auto_80668 ) ( ON ?auto_80669 ?auto_80671 ) ( ON ?auto_80667 ?auto_80669 ) ( ON ?auto_80670 ?auto_80667 ) ( ON ?auto_80665 ?auto_80670 ) ( ON ?auto_80664 ?auto_80665 ) ( CLEAR ?auto_80664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80668 ?auto_80666 ?auto_80671 ?auto_80669 ?auto_80667 ?auto_80670 ?auto_80665 )
      ( MAKE-2PILE ?auto_80664 ?auto_80665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80677 - BLOCK
      ?auto_80678 - BLOCK
      ?auto_80679 - BLOCK
      ?auto_80680 - BLOCK
      ?auto_80681 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_80681 ) ( CLEAR ?auto_80680 ) ( ON-TABLE ?auto_80677 ) ( ON ?auto_80678 ?auto_80677 ) ( ON ?auto_80679 ?auto_80678 ) ( ON ?auto_80680 ?auto_80679 ) ( not ( = ?auto_80677 ?auto_80678 ) ) ( not ( = ?auto_80677 ?auto_80679 ) ) ( not ( = ?auto_80677 ?auto_80680 ) ) ( not ( = ?auto_80677 ?auto_80681 ) ) ( not ( = ?auto_80678 ?auto_80679 ) ) ( not ( = ?auto_80678 ?auto_80680 ) ) ( not ( = ?auto_80678 ?auto_80681 ) ) ( not ( = ?auto_80679 ?auto_80680 ) ) ( not ( = ?auto_80679 ?auto_80681 ) ) ( not ( = ?auto_80680 ?auto_80681 ) ) )
    :subtasks
    ( ( !STACK ?auto_80681 ?auto_80680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80682 - BLOCK
      ?auto_80683 - BLOCK
      ?auto_80684 - BLOCK
      ?auto_80685 - BLOCK
      ?auto_80686 - BLOCK
    )
    :vars
    (
      ?auto_80687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_80685 ) ( ON-TABLE ?auto_80682 ) ( ON ?auto_80683 ?auto_80682 ) ( ON ?auto_80684 ?auto_80683 ) ( ON ?auto_80685 ?auto_80684 ) ( not ( = ?auto_80682 ?auto_80683 ) ) ( not ( = ?auto_80682 ?auto_80684 ) ) ( not ( = ?auto_80682 ?auto_80685 ) ) ( not ( = ?auto_80682 ?auto_80686 ) ) ( not ( = ?auto_80683 ?auto_80684 ) ) ( not ( = ?auto_80683 ?auto_80685 ) ) ( not ( = ?auto_80683 ?auto_80686 ) ) ( not ( = ?auto_80684 ?auto_80685 ) ) ( not ( = ?auto_80684 ?auto_80686 ) ) ( not ( = ?auto_80685 ?auto_80686 ) ) ( ON ?auto_80686 ?auto_80687 ) ( CLEAR ?auto_80686 ) ( HAND-EMPTY ) ( not ( = ?auto_80682 ?auto_80687 ) ) ( not ( = ?auto_80683 ?auto_80687 ) ) ( not ( = ?auto_80684 ?auto_80687 ) ) ( not ( = ?auto_80685 ?auto_80687 ) ) ( not ( = ?auto_80686 ?auto_80687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80686 ?auto_80687 )
      ( MAKE-5PILE ?auto_80682 ?auto_80683 ?auto_80684 ?auto_80685 ?auto_80686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80688 - BLOCK
      ?auto_80689 - BLOCK
      ?auto_80690 - BLOCK
      ?auto_80691 - BLOCK
      ?auto_80692 - BLOCK
    )
    :vars
    (
      ?auto_80693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80688 ) ( ON ?auto_80689 ?auto_80688 ) ( ON ?auto_80690 ?auto_80689 ) ( not ( = ?auto_80688 ?auto_80689 ) ) ( not ( = ?auto_80688 ?auto_80690 ) ) ( not ( = ?auto_80688 ?auto_80691 ) ) ( not ( = ?auto_80688 ?auto_80692 ) ) ( not ( = ?auto_80689 ?auto_80690 ) ) ( not ( = ?auto_80689 ?auto_80691 ) ) ( not ( = ?auto_80689 ?auto_80692 ) ) ( not ( = ?auto_80690 ?auto_80691 ) ) ( not ( = ?auto_80690 ?auto_80692 ) ) ( not ( = ?auto_80691 ?auto_80692 ) ) ( ON ?auto_80692 ?auto_80693 ) ( CLEAR ?auto_80692 ) ( not ( = ?auto_80688 ?auto_80693 ) ) ( not ( = ?auto_80689 ?auto_80693 ) ) ( not ( = ?auto_80690 ?auto_80693 ) ) ( not ( = ?auto_80691 ?auto_80693 ) ) ( not ( = ?auto_80692 ?auto_80693 ) ) ( HOLDING ?auto_80691 ) ( CLEAR ?auto_80690 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80688 ?auto_80689 ?auto_80690 ?auto_80691 )
      ( MAKE-5PILE ?auto_80688 ?auto_80689 ?auto_80690 ?auto_80691 ?auto_80692 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80694 - BLOCK
      ?auto_80695 - BLOCK
      ?auto_80696 - BLOCK
      ?auto_80697 - BLOCK
      ?auto_80698 - BLOCK
    )
    :vars
    (
      ?auto_80699 - BLOCK
      ?auto_80700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80694 ) ( ON ?auto_80695 ?auto_80694 ) ( ON ?auto_80696 ?auto_80695 ) ( not ( = ?auto_80694 ?auto_80695 ) ) ( not ( = ?auto_80694 ?auto_80696 ) ) ( not ( = ?auto_80694 ?auto_80697 ) ) ( not ( = ?auto_80694 ?auto_80698 ) ) ( not ( = ?auto_80695 ?auto_80696 ) ) ( not ( = ?auto_80695 ?auto_80697 ) ) ( not ( = ?auto_80695 ?auto_80698 ) ) ( not ( = ?auto_80696 ?auto_80697 ) ) ( not ( = ?auto_80696 ?auto_80698 ) ) ( not ( = ?auto_80697 ?auto_80698 ) ) ( ON ?auto_80698 ?auto_80699 ) ( not ( = ?auto_80694 ?auto_80699 ) ) ( not ( = ?auto_80695 ?auto_80699 ) ) ( not ( = ?auto_80696 ?auto_80699 ) ) ( not ( = ?auto_80697 ?auto_80699 ) ) ( not ( = ?auto_80698 ?auto_80699 ) ) ( CLEAR ?auto_80696 ) ( ON ?auto_80697 ?auto_80698 ) ( CLEAR ?auto_80697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80700 ) ( ON ?auto_80699 ?auto_80700 ) ( not ( = ?auto_80700 ?auto_80699 ) ) ( not ( = ?auto_80700 ?auto_80698 ) ) ( not ( = ?auto_80700 ?auto_80697 ) ) ( not ( = ?auto_80694 ?auto_80700 ) ) ( not ( = ?auto_80695 ?auto_80700 ) ) ( not ( = ?auto_80696 ?auto_80700 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80700 ?auto_80699 ?auto_80698 )
      ( MAKE-5PILE ?auto_80694 ?auto_80695 ?auto_80696 ?auto_80697 ?auto_80698 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80701 - BLOCK
      ?auto_80702 - BLOCK
      ?auto_80703 - BLOCK
      ?auto_80704 - BLOCK
      ?auto_80705 - BLOCK
    )
    :vars
    (
      ?auto_80707 - BLOCK
      ?auto_80706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80701 ) ( ON ?auto_80702 ?auto_80701 ) ( not ( = ?auto_80701 ?auto_80702 ) ) ( not ( = ?auto_80701 ?auto_80703 ) ) ( not ( = ?auto_80701 ?auto_80704 ) ) ( not ( = ?auto_80701 ?auto_80705 ) ) ( not ( = ?auto_80702 ?auto_80703 ) ) ( not ( = ?auto_80702 ?auto_80704 ) ) ( not ( = ?auto_80702 ?auto_80705 ) ) ( not ( = ?auto_80703 ?auto_80704 ) ) ( not ( = ?auto_80703 ?auto_80705 ) ) ( not ( = ?auto_80704 ?auto_80705 ) ) ( ON ?auto_80705 ?auto_80707 ) ( not ( = ?auto_80701 ?auto_80707 ) ) ( not ( = ?auto_80702 ?auto_80707 ) ) ( not ( = ?auto_80703 ?auto_80707 ) ) ( not ( = ?auto_80704 ?auto_80707 ) ) ( not ( = ?auto_80705 ?auto_80707 ) ) ( ON ?auto_80704 ?auto_80705 ) ( CLEAR ?auto_80704 ) ( ON-TABLE ?auto_80706 ) ( ON ?auto_80707 ?auto_80706 ) ( not ( = ?auto_80706 ?auto_80707 ) ) ( not ( = ?auto_80706 ?auto_80705 ) ) ( not ( = ?auto_80706 ?auto_80704 ) ) ( not ( = ?auto_80701 ?auto_80706 ) ) ( not ( = ?auto_80702 ?auto_80706 ) ) ( not ( = ?auto_80703 ?auto_80706 ) ) ( HOLDING ?auto_80703 ) ( CLEAR ?auto_80702 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80701 ?auto_80702 ?auto_80703 )
      ( MAKE-5PILE ?auto_80701 ?auto_80702 ?auto_80703 ?auto_80704 ?auto_80705 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80708 - BLOCK
      ?auto_80709 - BLOCK
      ?auto_80710 - BLOCK
      ?auto_80711 - BLOCK
      ?auto_80712 - BLOCK
    )
    :vars
    (
      ?auto_80714 - BLOCK
      ?auto_80713 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80708 ) ( ON ?auto_80709 ?auto_80708 ) ( not ( = ?auto_80708 ?auto_80709 ) ) ( not ( = ?auto_80708 ?auto_80710 ) ) ( not ( = ?auto_80708 ?auto_80711 ) ) ( not ( = ?auto_80708 ?auto_80712 ) ) ( not ( = ?auto_80709 ?auto_80710 ) ) ( not ( = ?auto_80709 ?auto_80711 ) ) ( not ( = ?auto_80709 ?auto_80712 ) ) ( not ( = ?auto_80710 ?auto_80711 ) ) ( not ( = ?auto_80710 ?auto_80712 ) ) ( not ( = ?auto_80711 ?auto_80712 ) ) ( ON ?auto_80712 ?auto_80714 ) ( not ( = ?auto_80708 ?auto_80714 ) ) ( not ( = ?auto_80709 ?auto_80714 ) ) ( not ( = ?auto_80710 ?auto_80714 ) ) ( not ( = ?auto_80711 ?auto_80714 ) ) ( not ( = ?auto_80712 ?auto_80714 ) ) ( ON ?auto_80711 ?auto_80712 ) ( ON-TABLE ?auto_80713 ) ( ON ?auto_80714 ?auto_80713 ) ( not ( = ?auto_80713 ?auto_80714 ) ) ( not ( = ?auto_80713 ?auto_80712 ) ) ( not ( = ?auto_80713 ?auto_80711 ) ) ( not ( = ?auto_80708 ?auto_80713 ) ) ( not ( = ?auto_80709 ?auto_80713 ) ) ( not ( = ?auto_80710 ?auto_80713 ) ) ( CLEAR ?auto_80709 ) ( ON ?auto_80710 ?auto_80711 ) ( CLEAR ?auto_80710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80713 ?auto_80714 ?auto_80712 ?auto_80711 )
      ( MAKE-5PILE ?auto_80708 ?auto_80709 ?auto_80710 ?auto_80711 ?auto_80712 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80715 - BLOCK
      ?auto_80716 - BLOCK
      ?auto_80717 - BLOCK
      ?auto_80718 - BLOCK
      ?auto_80719 - BLOCK
    )
    :vars
    (
      ?auto_80720 - BLOCK
      ?auto_80721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80715 ) ( not ( = ?auto_80715 ?auto_80716 ) ) ( not ( = ?auto_80715 ?auto_80717 ) ) ( not ( = ?auto_80715 ?auto_80718 ) ) ( not ( = ?auto_80715 ?auto_80719 ) ) ( not ( = ?auto_80716 ?auto_80717 ) ) ( not ( = ?auto_80716 ?auto_80718 ) ) ( not ( = ?auto_80716 ?auto_80719 ) ) ( not ( = ?auto_80717 ?auto_80718 ) ) ( not ( = ?auto_80717 ?auto_80719 ) ) ( not ( = ?auto_80718 ?auto_80719 ) ) ( ON ?auto_80719 ?auto_80720 ) ( not ( = ?auto_80715 ?auto_80720 ) ) ( not ( = ?auto_80716 ?auto_80720 ) ) ( not ( = ?auto_80717 ?auto_80720 ) ) ( not ( = ?auto_80718 ?auto_80720 ) ) ( not ( = ?auto_80719 ?auto_80720 ) ) ( ON ?auto_80718 ?auto_80719 ) ( ON-TABLE ?auto_80721 ) ( ON ?auto_80720 ?auto_80721 ) ( not ( = ?auto_80721 ?auto_80720 ) ) ( not ( = ?auto_80721 ?auto_80719 ) ) ( not ( = ?auto_80721 ?auto_80718 ) ) ( not ( = ?auto_80715 ?auto_80721 ) ) ( not ( = ?auto_80716 ?auto_80721 ) ) ( not ( = ?auto_80717 ?auto_80721 ) ) ( ON ?auto_80717 ?auto_80718 ) ( CLEAR ?auto_80717 ) ( HOLDING ?auto_80716 ) ( CLEAR ?auto_80715 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80715 ?auto_80716 )
      ( MAKE-5PILE ?auto_80715 ?auto_80716 ?auto_80717 ?auto_80718 ?auto_80719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80722 - BLOCK
      ?auto_80723 - BLOCK
      ?auto_80724 - BLOCK
      ?auto_80725 - BLOCK
      ?auto_80726 - BLOCK
    )
    :vars
    (
      ?auto_80727 - BLOCK
      ?auto_80728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80722 ) ( not ( = ?auto_80722 ?auto_80723 ) ) ( not ( = ?auto_80722 ?auto_80724 ) ) ( not ( = ?auto_80722 ?auto_80725 ) ) ( not ( = ?auto_80722 ?auto_80726 ) ) ( not ( = ?auto_80723 ?auto_80724 ) ) ( not ( = ?auto_80723 ?auto_80725 ) ) ( not ( = ?auto_80723 ?auto_80726 ) ) ( not ( = ?auto_80724 ?auto_80725 ) ) ( not ( = ?auto_80724 ?auto_80726 ) ) ( not ( = ?auto_80725 ?auto_80726 ) ) ( ON ?auto_80726 ?auto_80727 ) ( not ( = ?auto_80722 ?auto_80727 ) ) ( not ( = ?auto_80723 ?auto_80727 ) ) ( not ( = ?auto_80724 ?auto_80727 ) ) ( not ( = ?auto_80725 ?auto_80727 ) ) ( not ( = ?auto_80726 ?auto_80727 ) ) ( ON ?auto_80725 ?auto_80726 ) ( ON-TABLE ?auto_80728 ) ( ON ?auto_80727 ?auto_80728 ) ( not ( = ?auto_80728 ?auto_80727 ) ) ( not ( = ?auto_80728 ?auto_80726 ) ) ( not ( = ?auto_80728 ?auto_80725 ) ) ( not ( = ?auto_80722 ?auto_80728 ) ) ( not ( = ?auto_80723 ?auto_80728 ) ) ( not ( = ?auto_80724 ?auto_80728 ) ) ( ON ?auto_80724 ?auto_80725 ) ( CLEAR ?auto_80722 ) ( ON ?auto_80723 ?auto_80724 ) ( CLEAR ?auto_80723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80728 ?auto_80727 ?auto_80726 ?auto_80725 ?auto_80724 )
      ( MAKE-5PILE ?auto_80722 ?auto_80723 ?auto_80724 ?auto_80725 ?auto_80726 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80729 - BLOCK
      ?auto_80730 - BLOCK
      ?auto_80731 - BLOCK
      ?auto_80732 - BLOCK
      ?auto_80733 - BLOCK
    )
    :vars
    (
      ?auto_80734 - BLOCK
      ?auto_80735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80729 ?auto_80730 ) ) ( not ( = ?auto_80729 ?auto_80731 ) ) ( not ( = ?auto_80729 ?auto_80732 ) ) ( not ( = ?auto_80729 ?auto_80733 ) ) ( not ( = ?auto_80730 ?auto_80731 ) ) ( not ( = ?auto_80730 ?auto_80732 ) ) ( not ( = ?auto_80730 ?auto_80733 ) ) ( not ( = ?auto_80731 ?auto_80732 ) ) ( not ( = ?auto_80731 ?auto_80733 ) ) ( not ( = ?auto_80732 ?auto_80733 ) ) ( ON ?auto_80733 ?auto_80734 ) ( not ( = ?auto_80729 ?auto_80734 ) ) ( not ( = ?auto_80730 ?auto_80734 ) ) ( not ( = ?auto_80731 ?auto_80734 ) ) ( not ( = ?auto_80732 ?auto_80734 ) ) ( not ( = ?auto_80733 ?auto_80734 ) ) ( ON ?auto_80732 ?auto_80733 ) ( ON-TABLE ?auto_80735 ) ( ON ?auto_80734 ?auto_80735 ) ( not ( = ?auto_80735 ?auto_80734 ) ) ( not ( = ?auto_80735 ?auto_80733 ) ) ( not ( = ?auto_80735 ?auto_80732 ) ) ( not ( = ?auto_80729 ?auto_80735 ) ) ( not ( = ?auto_80730 ?auto_80735 ) ) ( not ( = ?auto_80731 ?auto_80735 ) ) ( ON ?auto_80731 ?auto_80732 ) ( ON ?auto_80730 ?auto_80731 ) ( CLEAR ?auto_80730 ) ( HOLDING ?auto_80729 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80729 )
      ( MAKE-5PILE ?auto_80729 ?auto_80730 ?auto_80731 ?auto_80732 ?auto_80733 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80736 - BLOCK
      ?auto_80737 - BLOCK
      ?auto_80738 - BLOCK
      ?auto_80739 - BLOCK
      ?auto_80740 - BLOCK
    )
    :vars
    (
      ?auto_80741 - BLOCK
      ?auto_80742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80736 ?auto_80737 ) ) ( not ( = ?auto_80736 ?auto_80738 ) ) ( not ( = ?auto_80736 ?auto_80739 ) ) ( not ( = ?auto_80736 ?auto_80740 ) ) ( not ( = ?auto_80737 ?auto_80738 ) ) ( not ( = ?auto_80737 ?auto_80739 ) ) ( not ( = ?auto_80737 ?auto_80740 ) ) ( not ( = ?auto_80738 ?auto_80739 ) ) ( not ( = ?auto_80738 ?auto_80740 ) ) ( not ( = ?auto_80739 ?auto_80740 ) ) ( ON ?auto_80740 ?auto_80741 ) ( not ( = ?auto_80736 ?auto_80741 ) ) ( not ( = ?auto_80737 ?auto_80741 ) ) ( not ( = ?auto_80738 ?auto_80741 ) ) ( not ( = ?auto_80739 ?auto_80741 ) ) ( not ( = ?auto_80740 ?auto_80741 ) ) ( ON ?auto_80739 ?auto_80740 ) ( ON-TABLE ?auto_80742 ) ( ON ?auto_80741 ?auto_80742 ) ( not ( = ?auto_80742 ?auto_80741 ) ) ( not ( = ?auto_80742 ?auto_80740 ) ) ( not ( = ?auto_80742 ?auto_80739 ) ) ( not ( = ?auto_80736 ?auto_80742 ) ) ( not ( = ?auto_80737 ?auto_80742 ) ) ( not ( = ?auto_80738 ?auto_80742 ) ) ( ON ?auto_80738 ?auto_80739 ) ( ON ?auto_80737 ?auto_80738 ) ( ON ?auto_80736 ?auto_80737 ) ( CLEAR ?auto_80736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80742 ?auto_80741 ?auto_80740 ?auto_80739 ?auto_80738 ?auto_80737 )
      ( MAKE-5PILE ?auto_80736 ?auto_80737 ?auto_80738 ?auto_80739 ?auto_80740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80743 - BLOCK
      ?auto_80744 - BLOCK
      ?auto_80745 - BLOCK
      ?auto_80746 - BLOCK
      ?auto_80747 - BLOCK
    )
    :vars
    (
      ?auto_80749 - BLOCK
      ?auto_80748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80743 ?auto_80744 ) ) ( not ( = ?auto_80743 ?auto_80745 ) ) ( not ( = ?auto_80743 ?auto_80746 ) ) ( not ( = ?auto_80743 ?auto_80747 ) ) ( not ( = ?auto_80744 ?auto_80745 ) ) ( not ( = ?auto_80744 ?auto_80746 ) ) ( not ( = ?auto_80744 ?auto_80747 ) ) ( not ( = ?auto_80745 ?auto_80746 ) ) ( not ( = ?auto_80745 ?auto_80747 ) ) ( not ( = ?auto_80746 ?auto_80747 ) ) ( ON ?auto_80747 ?auto_80749 ) ( not ( = ?auto_80743 ?auto_80749 ) ) ( not ( = ?auto_80744 ?auto_80749 ) ) ( not ( = ?auto_80745 ?auto_80749 ) ) ( not ( = ?auto_80746 ?auto_80749 ) ) ( not ( = ?auto_80747 ?auto_80749 ) ) ( ON ?auto_80746 ?auto_80747 ) ( ON-TABLE ?auto_80748 ) ( ON ?auto_80749 ?auto_80748 ) ( not ( = ?auto_80748 ?auto_80749 ) ) ( not ( = ?auto_80748 ?auto_80747 ) ) ( not ( = ?auto_80748 ?auto_80746 ) ) ( not ( = ?auto_80743 ?auto_80748 ) ) ( not ( = ?auto_80744 ?auto_80748 ) ) ( not ( = ?auto_80745 ?auto_80748 ) ) ( ON ?auto_80745 ?auto_80746 ) ( ON ?auto_80744 ?auto_80745 ) ( HOLDING ?auto_80743 ) ( CLEAR ?auto_80744 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80748 ?auto_80749 ?auto_80747 ?auto_80746 ?auto_80745 ?auto_80744 ?auto_80743 )
      ( MAKE-5PILE ?auto_80743 ?auto_80744 ?auto_80745 ?auto_80746 ?auto_80747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80750 - BLOCK
      ?auto_80751 - BLOCK
      ?auto_80752 - BLOCK
      ?auto_80753 - BLOCK
      ?auto_80754 - BLOCK
    )
    :vars
    (
      ?auto_80755 - BLOCK
      ?auto_80756 - BLOCK
      ?auto_80757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80750 ?auto_80751 ) ) ( not ( = ?auto_80750 ?auto_80752 ) ) ( not ( = ?auto_80750 ?auto_80753 ) ) ( not ( = ?auto_80750 ?auto_80754 ) ) ( not ( = ?auto_80751 ?auto_80752 ) ) ( not ( = ?auto_80751 ?auto_80753 ) ) ( not ( = ?auto_80751 ?auto_80754 ) ) ( not ( = ?auto_80752 ?auto_80753 ) ) ( not ( = ?auto_80752 ?auto_80754 ) ) ( not ( = ?auto_80753 ?auto_80754 ) ) ( ON ?auto_80754 ?auto_80755 ) ( not ( = ?auto_80750 ?auto_80755 ) ) ( not ( = ?auto_80751 ?auto_80755 ) ) ( not ( = ?auto_80752 ?auto_80755 ) ) ( not ( = ?auto_80753 ?auto_80755 ) ) ( not ( = ?auto_80754 ?auto_80755 ) ) ( ON ?auto_80753 ?auto_80754 ) ( ON-TABLE ?auto_80756 ) ( ON ?auto_80755 ?auto_80756 ) ( not ( = ?auto_80756 ?auto_80755 ) ) ( not ( = ?auto_80756 ?auto_80754 ) ) ( not ( = ?auto_80756 ?auto_80753 ) ) ( not ( = ?auto_80750 ?auto_80756 ) ) ( not ( = ?auto_80751 ?auto_80756 ) ) ( not ( = ?auto_80752 ?auto_80756 ) ) ( ON ?auto_80752 ?auto_80753 ) ( ON ?auto_80751 ?auto_80752 ) ( CLEAR ?auto_80751 ) ( ON ?auto_80750 ?auto_80757 ) ( CLEAR ?auto_80750 ) ( HAND-EMPTY ) ( not ( = ?auto_80750 ?auto_80757 ) ) ( not ( = ?auto_80751 ?auto_80757 ) ) ( not ( = ?auto_80752 ?auto_80757 ) ) ( not ( = ?auto_80753 ?auto_80757 ) ) ( not ( = ?auto_80754 ?auto_80757 ) ) ( not ( = ?auto_80755 ?auto_80757 ) ) ( not ( = ?auto_80756 ?auto_80757 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80750 ?auto_80757 )
      ( MAKE-5PILE ?auto_80750 ?auto_80751 ?auto_80752 ?auto_80753 ?auto_80754 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80758 - BLOCK
      ?auto_80759 - BLOCK
      ?auto_80760 - BLOCK
      ?auto_80761 - BLOCK
      ?auto_80762 - BLOCK
    )
    :vars
    (
      ?auto_80765 - BLOCK
      ?auto_80764 - BLOCK
      ?auto_80763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80758 ?auto_80759 ) ) ( not ( = ?auto_80758 ?auto_80760 ) ) ( not ( = ?auto_80758 ?auto_80761 ) ) ( not ( = ?auto_80758 ?auto_80762 ) ) ( not ( = ?auto_80759 ?auto_80760 ) ) ( not ( = ?auto_80759 ?auto_80761 ) ) ( not ( = ?auto_80759 ?auto_80762 ) ) ( not ( = ?auto_80760 ?auto_80761 ) ) ( not ( = ?auto_80760 ?auto_80762 ) ) ( not ( = ?auto_80761 ?auto_80762 ) ) ( ON ?auto_80762 ?auto_80765 ) ( not ( = ?auto_80758 ?auto_80765 ) ) ( not ( = ?auto_80759 ?auto_80765 ) ) ( not ( = ?auto_80760 ?auto_80765 ) ) ( not ( = ?auto_80761 ?auto_80765 ) ) ( not ( = ?auto_80762 ?auto_80765 ) ) ( ON ?auto_80761 ?auto_80762 ) ( ON-TABLE ?auto_80764 ) ( ON ?auto_80765 ?auto_80764 ) ( not ( = ?auto_80764 ?auto_80765 ) ) ( not ( = ?auto_80764 ?auto_80762 ) ) ( not ( = ?auto_80764 ?auto_80761 ) ) ( not ( = ?auto_80758 ?auto_80764 ) ) ( not ( = ?auto_80759 ?auto_80764 ) ) ( not ( = ?auto_80760 ?auto_80764 ) ) ( ON ?auto_80760 ?auto_80761 ) ( ON ?auto_80758 ?auto_80763 ) ( CLEAR ?auto_80758 ) ( not ( = ?auto_80758 ?auto_80763 ) ) ( not ( = ?auto_80759 ?auto_80763 ) ) ( not ( = ?auto_80760 ?auto_80763 ) ) ( not ( = ?auto_80761 ?auto_80763 ) ) ( not ( = ?auto_80762 ?auto_80763 ) ) ( not ( = ?auto_80765 ?auto_80763 ) ) ( not ( = ?auto_80764 ?auto_80763 ) ) ( HOLDING ?auto_80759 ) ( CLEAR ?auto_80760 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80764 ?auto_80765 ?auto_80762 ?auto_80761 ?auto_80760 ?auto_80759 )
      ( MAKE-5PILE ?auto_80758 ?auto_80759 ?auto_80760 ?auto_80761 ?auto_80762 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80766 - BLOCK
      ?auto_80767 - BLOCK
      ?auto_80768 - BLOCK
      ?auto_80769 - BLOCK
      ?auto_80770 - BLOCK
    )
    :vars
    (
      ?auto_80772 - BLOCK
      ?auto_80773 - BLOCK
      ?auto_80771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80766 ?auto_80767 ) ) ( not ( = ?auto_80766 ?auto_80768 ) ) ( not ( = ?auto_80766 ?auto_80769 ) ) ( not ( = ?auto_80766 ?auto_80770 ) ) ( not ( = ?auto_80767 ?auto_80768 ) ) ( not ( = ?auto_80767 ?auto_80769 ) ) ( not ( = ?auto_80767 ?auto_80770 ) ) ( not ( = ?auto_80768 ?auto_80769 ) ) ( not ( = ?auto_80768 ?auto_80770 ) ) ( not ( = ?auto_80769 ?auto_80770 ) ) ( ON ?auto_80770 ?auto_80772 ) ( not ( = ?auto_80766 ?auto_80772 ) ) ( not ( = ?auto_80767 ?auto_80772 ) ) ( not ( = ?auto_80768 ?auto_80772 ) ) ( not ( = ?auto_80769 ?auto_80772 ) ) ( not ( = ?auto_80770 ?auto_80772 ) ) ( ON ?auto_80769 ?auto_80770 ) ( ON-TABLE ?auto_80773 ) ( ON ?auto_80772 ?auto_80773 ) ( not ( = ?auto_80773 ?auto_80772 ) ) ( not ( = ?auto_80773 ?auto_80770 ) ) ( not ( = ?auto_80773 ?auto_80769 ) ) ( not ( = ?auto_80766 ?auto_80773 ) ) ( not ( = ?auto_80767 ?auto_80773 ) ) ( not ( = ?auto_80768 ?auto_80773 ) ) ( ON ?auto_80768 ?auto_80769 ) ( ON ?auto_80766 ?auto_80771 ) ( not ( = ?auto_80766 ?auto_80771 ) ) ( not ( = ?auto_80767 ?auto_80771 ) ) ( not ( = ?auto_80768 ?auto_80771 ) ) ( not ( = ?auto_80769 ?auto_80771 ) ) ( not ( = ?auto_80770 ?auto_80771 ) ) ( not ( = ?auto_80772 ?auto_80771 ) ) ( not ( = ?auto_80773 ?auto_80771 ) ) ( CLEAR ?auto_80768 ) ( ON ?auto_80767 ?auto_80766 ) ( CLEAR ?auto_80767 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80771 ?auto_80766 )
      ( MAKE-5PILE ?auto_80766 ?auto_80767 ?auto_80768 ?auto_80769 ?auto_80770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80774 - BLOCK
      ?auto_80775 - BLOCK
      ?auto_80776 - BLOCK
      ?auto_80777 - BLOCK
      ?auto_80778 - BLOCK
    )
    :vars
    (
      ?auto_80780 - BLOCK
      ?auto_80781 - BLOCK
      ?auto_80779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80774 ?auto_80775 ) ) ( not ( = ?auto_80774 ?auto_80776 ) ) ( not ( = ?auto_80774 ?auto_80777 ) ) ( not ( = ?auto_80774 ?auto_80778 ) ) ( not ( = ?auto_80775 ?auto_80776 ) ) ( not ( = ?auto_80775 ?auto_80777 ) ) ( not ( = ?auto_80775 ?auto_80778 ) ) ( not ( = ?auto_80776 ?auto_80777 ) ) ( not ( = ?auto_80776 ?auto_80778 ) ) ( not ( = ?auto_80777 ?auto_80778 ) ) ( ON ?auto_80778 ?auto_80780 ) ( not ( = ?auto_80774 ?auto_80780 ) ) ( not ( = ?auto_80775 ?auto_80780 ) ) ( not ( = ?auto_80776 ?auto_80780 ) ) ( not ( = ?auto_80777 ?auto_80780 ) ) ( not ( = ?auto_80778 ?auto_80780 ) ) ( ON ?auto_80777 ?auto_80778 ) ( ON-TABLE ?auto_80781 ) ( ON ?auto_80780 ?auto_80781 ) ( not ( = ?auto_80781 ?auto_80780 ) ) ( not ( = ?auto_80781 ?auto_80778 ) ) ( not ( = ?auto_80781 ?auto_80777 ) ) ( not ( = ?auto_80774 ?auto_80781 ) ) ( not ( = ?auto_80775 ?auto_80781 ) ) ( not ( = ?auto_80776 ?auto_80781 ) ) ( ON ?auto_80774 ?auto_80779 ) ( not ( = ?auto_80774 ?auto_80779 ) ) ( not ( = ?auto_80775 ?auto_80779 ) ) ( not ( = ?auto_80776 ?auto_80779 ) ) ( not ( = ?auto_80777 ?auto_80779 ) ) ( not ( = ?auto_80778 ?auto_80779 ) ) ( not ( = ?auto_80780 ?auto_80779 ) ) ( not ( = ?auto_80781 ?auto_80779 ) ) ( ON ?auto_80775 ?auto_80774 ) ( CLEAR ?auto_80775 ) ( ON-TABLE ?auto_80779 ) ( HOLDING ?auto_80776 ) ( CLEAR ?auto_80777 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80781 ?auto_80780 ?auto_80778 ?auto_80777 ?auto_80776 )
      ( MAKE-5PILE ?auto_80774 ?auto_80775 ?auto_80776 ?auto_80777 ?auto_80778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80782 - BLOCK
      ?auto_80783 - BLOCK
      ?auto_80784 - BLOCK
      ?auto_80785 - BLOCK
      ?auto_80786 - BLOCK
    )
    :vars
    (
      ?auto_80787 - BLOCK
      ?auto_80789 - BLOCK
      ?auto_80788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80782 ?auto_80783 ) ) ( not ( = ?auto_80782 ?auto_80784 ) ) ( not ( = ?auto_80782 ?auto_80785 ) ) ( not ( = ?auto_80782 ?auto_80786 ) ) ( not ( = ?auto_80783 ?auto_80784 ) ) ( not ( = ?auto_80783 ?auto_80785 ) ) ( not ( = ?auto_80783 ?auto_80786 ) ) ( not ( = ?auto_80784 ?auto_80785 ) ) ( not ( = ?auto_80784 ?auto_80786 ) ) ( not ( = ?auto_80785 ?auto_80786 ) ) ( ON ?auto_80786 ?auto_80787 ) ( not ( = ?auto_80782 ?auto_80787 ) ) ( not ( = ?auto_80783 ?auto_80787 ) ) ( not ( = ?auto_80784 ?auto_80787 ) ) ( not ( = ?auto_80785 ?auto_80787 ) ) ( not ( = ?auto_80786 ?auto_80787 ) ) ( ON ?auto_80785 ?auto_80786 ) ( ON-TABLE ?auto_80789 ) ( ON ?auto_80787 ?auto_80789 ) ( not ( = ?auto_80789 ?auto_80787 ) ) ( not ( = ?auto_80789 ?auto_80786 ) ) ( not ( = ?auto_80789 ?auto_80785 ) ) ( not ( = ?auto_80782 ?auto_80789 ) ) ( not ( = ?auto_80783 ?auto_80789 ) ) ( not ( = ?auto_80784 ?auto_80789 ) ) ( ON ?auto_80782 ?auto_80788 ) ( not ( = ?auto_80782 ?auto_80788 ) ) ( not ( = ?auto_80783 ?auto_80788 ) ) ( not ( = ?auto_80784 ?auto_80788 ) ) ( not ( = ?auto_80785 ?auto_80788 ) ) ( not ( = ?auto_80786 ?auto_80788 ) ) ( not ( = ?auto_80787 ?auto_80788 ) ) ( not ( = ?auto_80789 ?auto_80788 ) ) ( ON ?auto_80783 ?auto_80782 ) ( ON-TABLE ?auto_80788 ) ( CLEAR ?auto_80785 ) ( ON ?auto_80784 ?auto_80783 ) ( CLEAR ?auto_80784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80788 ?auto_80782 ?auto_80783 )
      ( MAKE-5PILE ?auto_80782 ?auto_80783 ?auto_80784 ?auto_80785 ?auto_80786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80790 - BLOCK
      ?auto_80791 - BLOCK
      ?auto_80792 - BLOCK
      ?auto_80793 - BLOCK
      ?auto_80794 - BLOCK
    )
    :vars
    (
      ?auto_80796 - BLOCK
      ?auto_80795 - BLOCK
      ?auto_80797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80790 ?auto_80791 ) ) ( not ( = ?auto_80790 ?auto_80792 ) ) ( not ( = ?auto_80790 ?auto_80793 ) ) ( not ( = ?auto_80790 ?auto_80794 ) ) ( not ( = ?auto_80791 ?auto_80792 ) ) ( not ( = ?auto_80791 ?auto_80793 ) ) ( not ( = ?auto_80791 ?auto_80794 ) ) ( not ( = ?auto_80792 ?auto_80793 ) ) ( not ( = ?auto_80792 ?auto_80794 ) ) ( not ( = ?auto_80793 ?auto_80794 ) ) ( ON ?auto_80794 ?auto_80796 ) ( not ( = ?auto_80790 ?auto_80796 ) ) ( not ( = ?auto_80791 ?auto_80796 ) ) ( not ( = ?auto_80792 ?auto_80796 ) ) ( not ( = ?auto_80793 ?auto_80796 ) ) ( not ( = ?auto_80794 ?auto_80796 ) ) ( ON-TABLE ?auto_80795 ) ( ON ?auto_80796 ?auto_80795 ) ( not ( = ?auto_80795 ?auto_80796 ) ) ( not ( = ?auto_80795 ?auto_80794 ) ) ( not ( = ?auto_80795 ?auto_80793 ) ) ( not ( = ?auto_80790 ?auto_80795 ) ) ( not ( = ?auto_80791 ?auto_80795 ) ) ( not ( = ?auto_80792 ?auto_80795 ) ) ( ON ?auto_80790 ?auto_80797 ) ( not ( = ?auto_80790 ?auto_80797 ) ) ( not ( = ?auto_80791 ?auto_80797 ) ) ( not ( = ?auto_80792 ?auto_80797 ) ) ( not ( = ?auto_80793 ?auto_80797 ) ) ( not ( = ?auto_80794 ?auto_80797 ) ) ( not ( = ?auto_80796 ?auto_80797 ) ) ( not ( = ?auto_80795 ?auto_80797 ) ) ( ON ?auto_80791 ?auto_80790 ) ( ON-TABLE ?auto_80797 ) ( ON ?auto_80792 ?auto_80791 ) ( CLEAR ?auto_80792 ) ( HOLDING ?auto_80793 ) ( CLEAR ?auto_80794 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80795 ?auto_80796 ?auto_80794 ?auto_80793 )
      ( MAKE-5PILE ?auto_80790 ?auto_80791 ?auto_80792 ?auto_80793 ?auto_80794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80798 - BLOCK
      ?auto_80799 - BLOCK
      ?auto_80800 - BLOCK
      ?auto_80801 - BLOCK
      ?auto_80802 - BLOCK
    )
    :vars
    (
      ?auto_80805 - BLOCK
      ?auto_80803 - BLOCK
      ?auto_80804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80798 ?auto_80799 ) ) ( not ( = ?auto_80798 ?auto_80800 ) ) ( not ( = ?auto_80798 ?auto_80801 ) ) ( not ( = ?auto_80798 ?auto_80802 ) ) ( not ( = ?auto_80799 ?auto_80800 ) ) ( not ( = ?auto_80799 ?auto_80801 ) ) ( not ( = ?auto_80799 ?auto_80802 ) ) ( not ( = ?auto_80800 ?auto_80801 ) ) ( not ( = ?auto_80800 ?auto_80802 ) ) ( not ( = ?auto_80801 ?auto_80802 ) ) ( ON ?auto_80802 ?auto_80805 ) ( not ( = ?auto_80798 ?auto_80805 ) ) ( not ( = ?auto_80799 ?auto_80805 ) ) ( not ( = ?auto_80800 ?auto_80805 ) ) ( not ( = ?auto_80801 ?auto_80805 ) ) ( not ( = ?auto_80802 ?auto_80805 ) ) ( ON-TABLE ?auto_80803 ) ( ON ?auto_80805 ?auto_80803 ) ( not ( = ?auto_80803 ?auto_80805 ) ) ( not ( = ?auto_80803 ?auto_80802 ) ) ( not ( = ?auto_80803 ?auto_80801 ) ) ( not ( = ?auto_80798 ?auto_80803 ) ) ( not ( = ?auto_80799 ?auto_80803 ) ) ( not ( = ?auto_80800 ?auto_80803 ) ) ( ON ?auto_80798 ?auto_80804 ) ( not ( = ?auto_80798 ?auto_80804 ) ) ( not ( = ?auto_80799 ?auto_80804 ) ) ( not ( = ?auto_80800 ?auto_80804 ) ) ( not ( = ?auto_80801 ?auto_80804 ) ) ( not ( = ?auto_80802 ?auto_80804 ) ) ( not ( = ?auto_80805 ?auto_80804 ) ) ( not ( = ?auto_80803 ?auto_80804 ) ) ( ON ?auto_80799 ?auto_80798 ) ( ON-TABLE ?auto_80804 ) ( ON ?auto_80800 ?auto_80799 ) ( CLEAR ?auto_80802 ) ( ON ?auto_80801 ?auto_80800 ) ( CLEAR ?auto_80801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80804 ?auto_80798 ?auto_80799 ?auto_80800 )
      ( MAKE-5PILE ?auto_80798 ?auto_80799 ?auto_80800 ?auto_80801 ?auto_80802 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80806 - BLOCK
      ?auto_80807 - BLOCK
      ?auto_80808 - BLOCK
      ?auto_80809 - BLOCK
      ?auto_80810 - BLOCK
    )
    :vars
    (
      ?auto_80811 - BLOCK
      ?auto_80813 - BLOCK
      ?auto_80812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80806 ?auto_80807 ) ) ( not ( = ?auto_80806 ?auto_80808 ) ) ( not ( = ?auto_80806 ?auto_80809 ) ) ( not ( = ?auto_80806 ?auto_80810 ) ) ( not ( = ?auto_80807 ?auto_80808 ) ) ( not ( = ?auto_80807 ?auto_80809 ) ) ( not ( = ?auto_80807 ?auto_80810 ) ) ( not ( = ?auto_80808 ?auto_80809 ) ) ( not ( = ?auto_80808 ?auto_80810 ) ) ( not ( = ?auto_80809 ?auto_80810 ) ) ( not ( = ?auto_80806 ?auto_80811 ) ) ( not ( = ?auto_80807 ?auto_80811 ) ) ( not ( = ?auto_80808 ?auto_80811 ) ) ( not ( = ?auto_80809 ?auto_80811 ) ) ( not ( = ?auto_80810 ?auto_80811 ) ) ( ON-TABLE ?auto_80813 ) ( ON ?auto_80811 ?auto_80813 ) ( not ( = ?auto_80813 ?auto_80811 ) ) ( not ( = ?auto_80813 ?auto_80810 ) ) ( not ( = ?auto_80813 ?auto_80809 ) ) ( not ( = ?auto_80806 ?auto_80813 ) ) ( not ( = ?auto_80807 ?auto_80813 ) ) ( not ( = ?auto_80808 ?auto_80813 ) ) ( ON ?auto_80806 ?auto_80812 ) ( not ( = ?auto_80806 ?auto_80812 ) ) ( not ( = ?auto_80807 ?auto_80812 ) ) ( not ( = ?auto_80808 ?auto_80812 ) ) ( not ( = ?auto_80809 ?auto_80812 ) ) ( not ( = ?auto_80810 ?auto_80812 ) ) ( not ( = ?auto_80811 ?auto_80812 ) ) ( not ( = ?auto_80813 ?auto_80812 ) ) ( ON ?auto_80807 ?auto_80806 ) ( ON-TABLE ?auto_80812 ) ( ON ?auto_80808 ?auto_80807 ) ( ON ?auto_80809 ?auto_80808 ) ( CLEAR ?auto_80809 ) ( HOLDING ?auto_80810 ) ( CLEAR ?auto_80811 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80813 ?auto_80811 ?auto_80810 )
      ( MAKE-5PILE ?auto_80806 ?auto_80807 ?auto_80808 ?auto_80809 ?auto_80810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80814 - BLOCK
      ?auto_80815 - BLOCK
      ?auto_80816 - BLOCK
      ?auto_80817 - BLOCK
      ?auto_80818 - BLOCK
    )
    :vars
    (
      ?auto_80820 - BLOCK
      ?auto_80821 - BLOCK
      ?auto_80819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80814 ?auto_80815 ) ) ( not ( = ?auto_80814 ?auto_80816 ) ) ( not ( = ?auto_80814 ?auto_80817 ) ) ( not ( = ?auto_80814 ?auto_80818 ) ) ( not ( = ?auto_80815 ?auto_80816 ) ) ( not ( = ?auto_80815 ?auto_80817 ) ) ( not ( = ?auto_80815 ?auto_80818 ) ) ( not ( = ?auto_80816 ?auto_80817 ) ) ( not ( = ?auto_80816 ?auto_80818 ) ) ( not ( = ?auto_80817 ?auto_80818 ) ) ( not ( = ?auto_80814 ?auto_80820 ) ) ( not ( = ?auto_80815 ?auto_80820 ) ) ( not ( = ?auto_80816 ?auto_80820 ) ) ( not ( = ?auto_80817 ?auto_80820 ) ) ( not ( = ?auto_80818 ?auto_80820 ) ) ( ON-TABLE ?auto_80821 ) ( ON ?auto_80820 ?auto_80821 ) ( not ( = ?auto_80821 ?auto_80820 ) ) ( not ( = ?auto_80821 ?auto_80818 ) ) ( not ( = ?auto_80821 ?auto_80817 ) ) ( not ( = ?auto_80814 ?auto_80821 ) ) ( not ( = ?auto_80815 ?auto_80821 ) ) ( not ( = ?auto_80816 ?auto_80821 ) ) ( ON ?auto_80814 ?auto_80819 ) ( not ( = ?auto_80814 ?auto_80819 ) ) ( not ( = ?auto_80815 ?auto_80819 ) ) ( not ( = ?auto_80816 ?auto_80819 ) ) ( not ( = ?auto_80817 ?auto_80819 ) ) ( not ( = ?auto_80818 ?auto_80819 ) ) ( not ( = ?auto_80820 ?auto_80819 ) ) ( not ( = ?auto_80821 ?auto_80819 ) ) ( ON ?auto_80815 ?auto_80814 ) ( ON-TABLE ?auto_80819 ) ( ON ?auto_80816 ?auto_80815 ) ( ON ?auto_80817 ?auto_80816 ) ( CLEAR ?auto_80820 ) ( ON ?auto_80818 ?auto_80817 ) ( CLEAR ?auto_80818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80819 ?auto_80814 ?auto_80815 ?auto_80816 ?auto_80817 )
      ( MAKE-5PILE ?auto_80814 ?auto_80815 ?auto_80816 ?auto_80817 ?auto_80818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80822 - BLOCK
      ?auto_80823 - BLOCK
      ?auto_80824 - BLOCK
      ?auto_80825 - BLOCK
      ?auto_80826 - BLOCK
    )
    :vars
    (
      ?auto_80829 - BLOCK
      ?auto_80827 - BLOCK
      ?auto_80828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80822 ?auto_80823 ) ) ( not ( = ?auto_80822 ?auto_80824 ) ) ( not ( = ?auto_80822 ?auto_80825 ) ) ( not ( = ?auto_80822 ?auto_80826 ) ) ( not ( = ?auto_80823 ?auto_80824 ) ) ( not ( = ?auto_80823 ?auto_80825 ) ) ( not ( = ?auto_80823 ?auto_80826 ) ) ( not ( = ?auto_80824 ?auto_80825 ) ) ( not ( = ?auto_80824 ?auto_80826 ) ) ( not ( = ?auto_80825 ?auto_80826 ) ) ( not ( = ?auto_80822 ?auto_80829 ) ) ( not ( = ?auto_80823 ?auto_80829 ) ) ( not ( = ?auto_80824 ?auto_80829 ) ) ( not ( = ?auto_80825 ?auto_80829 ) ) ( not ( = ?auto_80826 ?auto_80829 ) ) ( ON-TABLE ?auto_80827 ) ( not ( = ?auto_80827 ?auto_80829 ) ) ( not ( = ?auto_80827 ?auto_80826 ) ) ( not ( = ?auto_80827 ?auto_80825 ) ) ( not ( = ?auto_80822 ?auto_80827 ) ) ( not ( = ?auto_80823 ?auto_80827 ) ) ( not ( = ?auto_80824 ?auto_80827 ) ) ( ON ?auto_80822 ?auto_80828 ) ( not ( = ?auto_80822 ?auto_80828 ) ) ( not ( = ?auto_80823 ?auto_80828 ) ) ( not ( = ?auto_80824 ?auto_80828 ) ) ( not ( = ?auto_80825 ?auto_80828 ) ) ( not ( = ?auto_80826 ?auto_80828 ) ) ( not ( = ?auto_80829 ?auto_80828 ) ) ( not ( = ?auto_80827 ?auto_80828 ) ) ( ON ?auto_80823 ?auto_80822 ) ( ON-TABLE ?auto_80828 ) ( ON ?auto_80824 ?auto_80823 ) ( ON ?auto_80825 ?auto_80824 ) ( ON ?auto_80826 ?auto_80825 ) ( CLEAR ?auto_80826 ) ( HOLDING ?auto_80829 ) ( CLEAR ?auto_80827 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80827 ?auto_80829 )
      ( MAKE-5PILE ?auto_80822 ?auto_80823 ?auto_80824 ?auto_80825 ?auto_80826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80830 - BLOCK
      ?auto_80831 - BLOCK
      ?auto_80832 - BLOCK
      ?auto_80833 - BLOCK
      ?auto_80834 - BLOCK
    )
    :vars
    (
      ?auto_80835 - BLOCK
      ?auto_80836 - BLOCK
      ?auto_80837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80830 ?auto_80831 ) ) ( not ( = ?auto_80830 ?auto_80832 ) ) ( not ( = ?auto_80830 ?auto_80833 ) ) ( not ( = ?auto_80830 ?auto_80834 ) ) ( not ( = ?auto_80831 ?auto_80832 ) ) ( not ( = ?auto_80831 ?auto_80833 ) ) ( not ( = ?auto_80831 ?auto_80834 ) ) ( not ( = ?auto_80832 ?auto_80833 ) ) ( not ( = ?auto_80832 ?auto_80834 ) ) ( not ( = ?auto_80833 ?auto_80834 ) ) ( not ( = ?auto_80830 ?auto_80835 ) ) ( not ( = ?auto_80831 ?auto_80835 ) ) ( not ( = ?auto_80832 ?auto_80835 ) ) ( not ( = ?auto_80833 ?auto_80835 ) ) ( not ( = ?auto_80834 ?auto_80835 ) ) ( ON-TABLE ?auto_80836 ) ( not ( = ?auto_80836 ?auto_80835 ) ) ( not ( = ?auto_80836 ?auto_80834 ) ) ( not ( = ?auto_80836 ?auto_80833 ) ) ( not ( = ?auto_80830 ?auto_80836 ) ) ( not ( = ?auto_80831 ?auto_80836 ) ) ( not ( = ?auto_80832 ?auto_80836 ) ) ( ON ?auto_80830 ?auto_80837 ) ( not ( = ?auto_80830 ?auto_80837 ) ) ( not ( = ?auto_80831 ?auto_80837 ) ) ( not ( = ?auto_80832 ?auto_80837 ) ) ( not ( = ?auto_80833 ?auto_80837 ) ) ( not ( = ?auto_80834 ?auto_80837 ) ) ( not ( = ?auto_80835 ?auto_80837 ) ) ( not ( = ?auto_80836 ?auto_80837 ) ) ( ON ?auto_80831 ?auto_80830 ) ( ON-TABLE ?auto_80837 ) ( ON ?auto_80832 ?auto_80831 ) ( ON ?auto_80833 ?auto_80832 ) ( ON ?auto_80834 ?auto_80833 ) ( CLEAR ?auto_80836 ) ( ON ?auto_80835 ?auto_80834 ) ( CLEAR ?auto_80835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80837 ?auto_80830 ?auto_80831 ?auto_80832 ?auto_80833 ?auto_80834 )
      ( MAKE-5PILE ?auto_80830 ?auto_80831 ?auto_80832 ?auto_80833 ?auto_80834 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80838 - BLOCK
      ?auto_80839 - BLOCK
      ?auto_80840 - BLOCK
      ?auto_80841 - BLOCK
      ?auto_80842 - BLOCK
    )
    :vars
    (
      ?auto_80844 - BLOCK
      ?auto_80843 - BLOCK
      ?auto_80845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80838 ?auto_80839 ) ) ( not ( = ?auto_80838 ?auto_80840 ) ) ( not ( = ?auto_80838 ?auto_80841 ) ) ( not ( = ?auto_80838 ?auto_80842 ) ) ( not ( = ?auto_80839 ?auto_80840 ) ) ( not ( = ?auto_80839 ?auto_80841 ) ) ( not ( = ?auto_80839 ?auto_80842 ) ) ( not ( = ?auto_80840 ?auto_80841 ) ) ( not ( = ?auto_80840 ?auto_80842 ) ) ( not ( = ?auto_80841 ?auto_80842 ) ) ( not ( = ?auto_80838 ?auto_80844 ) ) ( not ( = ?auto_80839 ?auto_80844 ) ) ( not ( = ?auto_80840 ?auto_80844 ) ) ( not ( = ?auto_80841 ?auto_80844 ) ) ( not ( = ?auto_80842 ?auto_80844 ) ) ( not ( = ?auto_80843 ?auto_80844 ) ) ( not ( = ?auto_80843 ?auto_80842 ) ) ( not ( = ?auto_80843 ?auto_80841 ) ) ( not ( = ?auto_80838 ?auto_80843 ) ) ( not ( = ?auto_80839 ?auto_80843 ) ) ( not ( = ?auto_80840 ?auto_80843 ) ) ( ON ?auto_80838 ?auto_80845 ) ( not ( = ?auto_80838 ?auto_80845 ) ) ( not ( = ?auto_80839 ?auto_80845 ) ) ( not ( = ?auto_80840 ?auto_80845 ) ) ( not ( = ?auto_80841 ?auto_80845 ) ) ( not ( = ?auto_80842 ?auto_80845 ) ) ( not ( = ?auto_80844 ?auto_80845 ) ) ( not ( = ?auto_80843 ?auto_80845 ) ) ( ON ?auto_80839 ?auto_80838 ) ( ON-TABLE ?auto_80845 ) ( ON ?auto_80840 ?auto_80839 ) ( ON ?auto_80841 ?auto_80840 ) ( ON ?auto_80842 ?auto_80841 ) ( ON ?auto_80844 ?auto_80842 ) ( CLEAR ?auto_80844 ) ( HOLDING ?auto_80843 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80843 )
      ( MAKE-5PILE ?auto_80838 ?auto_80839 ?auto_80840 ?auto_80841 ?auto_80842 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80846 - BLOCK
      ?auto_80847 - BLOCK
      ?auto_80848 - BLOCK
      ?auto_80849 - BLOCK
      ?auto_80850 - BLOCK
    )
    :vars
    (
      ?auto_80853 - BLOCK
      ?auto_80852 - BLOCK
      ?auto_80851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80846 ?auto_80847 ) ) ( not ( = ?auto_80846 ?auto_80848 ) ) ( not ( = ?auto_80846 ?auto_80849 ) ) ( not ( = ?auto_80846 ?auto_80850 ) ) ( not ( = ?auto_80847 ?auto_80848 ) ) ( not ( = ?auto_80847 ?auto_80849 ) ) ( not ( = ?auto_80847 ?auto_80850 ) ) ( not ( = ?auto_80848 ?auto_80849 ) ) ( not ( = ?auto_80848 ?auto_80850 ) ) ( not ( = ?auto_80849 ?auto_80850 ) ) ( not ( = ?auto_80846 ?auto_80853 ) ) ( not ( = ?auto_80847 ?auto_80853 ) ) ( not ( = ?auto_80848 ?auto_80853 ) ) ( not ( = ?auto_80849 ?auto_80853 ) ) ( not ( = ?auto_80850 ?auto_80853 ) ) ( not ( = ?auto_80852 ?auto_80853 ) ) ( not ( = ?auto_80852 ?auto_80850 ) ) ( not ( = ?auto_80852 ?auto_80849 ) ) ( not ( = ?auto_80846 ?auto_80852 ) ) ( not ( = ?auto_80847 ?auto_80852 ) ) ( not ( = ?auto_80848 ?auto_80852 ) ) ( ON ?auto_80846 ?auto_80851 ) ( not ( = ?auto_80846 ?auto_80851 ) ) ( not ( = ?auto_80847 ?auto_80851 ) ) ( not ( = ?auto_80848 ?auto_80851 ) ) ( not ( = ?auto_80849 ?auto_80851 ) ) ( not ( = ?auto_80850 ?auto_80851 ) ) ( not ( = ?auto_80853 ?auto_80851 ) ) ( not ( = ?auto_80852 ?auto_80851 ) ) ( ON ?auto_80847 ?auto_80846 ) ( ON-TABLE ?auto_80851 ) ( ON ?auto_80848 ?auto_80847 ) ( ON ?auto_80849 ?auto_80848 ) ( ON ?auto_80850 ?auto_80849 ) ( ON ?auto_80853 ?auto_80850 ) ( ON ?auto_80852 ?auto_80853 ) ( CLEAR ?auto_80852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80851 ?auto_80846 ?auto_80847 ?auto_80848 ?auto_80849 ?auto_80850 ?auto_80853 )
      ( MAKE-5PILE ?auto_80846 ?auto_80847 ?auto_80848 ?auto_80849 ?auto_80850 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80855 - BLOCK
    )
    :vars
    (
      ?auto_80856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80856 ?auto_80855 ) ( CLEAR ?auto_80856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80855 ) ( not ( = ?auto_80855 ?auto_80856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80856 ?auto_80855 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80857 - BLOCK
    )
    :vars
    (
      ?auto_80858 - BLOCK
      ?auto_80859 - BLOCK
      ?auto_80860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80858 ?auto_80857 ) ( CLEAR ?auto_80858 ) ( ON-TABLE ?auto_80857 ) ( not ( = ?auto_80857 ?auto_80858 ) ) ( HOLDING ?auto_80859 ) ( CLEAR ?auto_80860 ) ( not ( = ?auto_80857 ?auto_80859 ) ) ( not ( = ?auto_80857 ?auto_80860 ) ) ( not ( = ?auto_80858 ?auto_80859 ) ) ( not ( = ?auto_80858 ?auto_80860 ) ) ( not ( = ?auto_80859 ?auto_80860 ) ) )
    :subtasks
    ( ( !STACK ?auto_80859 ?auto_80860 )
      ( MAKE-1PILE ?auto_80857 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80861 - BLOCK
    )
    :vars
    (
      ?auto_80863 - BLOCK
      ?auto_80864 - BLOCK
      ?auto_80862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80863 ?auto_80861 ) ( ON-TABLE ?auto_80861 ) ( not ( = ?auto_80861 ?auto_80863 ) ) ( CLEAR ?auto_80864 ) ( not ( = ?auto_80861 ?auto_80862 ) ) ( not ( = ?auto_80861 ?auto_80864 ) ) ( not ( = ?auto_80863 ?auto_80862 ) ) ( not ( = ?auto_80863 ?auto_80864 ) ) ( not ( = ?auto_80862 ?auto_80864 ) ) ( ON ?auto_80862 ?auto_80863 ) ( CLEAR ?auto_80862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80861 ?auto_80863 )
      ( MAKE-1PILE ?auto_80861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80865 - BLOCK
    )
    :vars
    (
      ?auto_80867 - BLOCK
      ?auto_80868 - BLOCK
      ?auto_80866 - BLOCK
      ?auto_80869 - BLOCK
      ?auto_80871 - BLOCK
      ?auto_80870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80867 ?auto_80865 ) ( ON-TABLE ?auto_80865 ) ( not ( = ?auto_80865 ?auto_80867 ) ) ( not ( = ?auto_80865 ?auto_80868 ) ) ( not ( = ?auto_80865 ?auto_80866 ) ) ( not ( = ?auto_80867 ?auto_80868 ) ) ( not ( = ?auto_80867 ?auto_80866 ) ) ( not ( = ?auto_80868 ?auto_80866 ) ) ( ON ?auto_80868 ?auto_80867 ) ( CLEAR ?auto_80868 ) ( HOLDING ?auto_80866 ) ( CLEAR ?auto_80869 ) ( ON-TABLE ?auto_80871 ) ( ON ?auto_80870 ?auto_80871 ) ( ON ?auto_80869 ?auto_80870 ) ( not ( = ?auto_80871 ?auto_80870 ) ) ( not ( = ?auto_80871 ?auto_80869 ) ) ( not ( = ?auto_80871 ?auto_80866 ) ) ( not ( = ?auto_80870 ?auto_80869 ) ) ( not ( = ?auto_80870 ?auto_80866 ) ) ( not ( = ?auto_80869 ?auto_80866 ) ) ( not ( = ?auto_80865 ?auto_80869 ) ) ( not ( = ?auto_80865 ?auto_80871 ) ) ( not ( = ?auto_80865 ?auto_80870 ) ) ( not ( = ?auto_80867 ?auto_80869 ) ) ( not ( = ?auto_80867 ?auto_80871 ) ) ( not ( = ?auto_80867 ?auto_80870 ) ) ( not ( = ?auto_80868 ?auto_80869 ) ) ( not ( = ?auto_80868 ?auto_80871 ) ) ( not ( = ?auto_80868 ?auto_80870 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80871 ?auto_80870 ?auto_80869 ?auto_80866 )
      ( MAKE-1PILE ?auto_80865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80872 - BLOCK
    )
    :vars
    (
      ?auto_80875 - BLOCK
      ?auto_80876 - BLOCK
      ?auto_80877 - BLOCK
      ?auto_80878 - BLOCK
      ?auto_80874 - BLOCK
      ?auto_80873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80875 ?auto_80872 ) ( ON-TABLE ?auto_80872 ) ( not ( = ?auto_80872 ?auto_80875 ) ) ( not ( = ?auto_80872 ?auto_80876 ) ) ( not ( = ?auto_80872 ?auto_80877 ) ) ( not ( = ?auto_80875 ?auto_80876 ) ) ( not ( = ?auto_80875 ?auto_80877 ) ) ( not ( = ?auto_80876 ?auto_80877 ) ) ( ON ?auto_80876 ?auto_80875 ) ( CLEAR ?auto_80878 ) ( ON-TABLE ?auto_80874 ) ( ON ?auto_80873 ?auto_80874 ) ( ON ?auto_80878 ?auto_80873 ) ( not ( = ?auto_80874 ?auto_80873 ) ) ( not ( = ?auto_80874 ?auto_80878 ) ) ( not ( = ?auto_80874 ?auto_80877 ) ) ( not ( = ?auto_80873 ?auto_80878 ) ) ( not ( = ?auto_80873 ?auto_80877 ) ) ( not ( = ?auto_80878 ?auto_80877 ) ) ( not ( = ?auto_80872 ?auto_80878 ) ) ( not ( = ?auto_80872 ?auto_80874 ) ) ( not ( = ?auto_80872 ?auto_80873 ) ) ( not ( = ?auto_80875 ?auto_80878 ) ) ( not ( = ?auto_80875 ?auto_80874 ) ) ( not ( = ?auto_80875 ?auto_80873 ) ) ( not ( = ?auto_80876 ?auto_80878 ) ) ( not ( = ?auto_80876 ?auto_80874 ) ) ( not ( = ?auto_80876 ?auto_80873 ) ) ( ON ?auto_80877 ?auto_80876 ) ( CLEAR ?auto_80877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80872 ?auto_80875 ?auto_80876 )
      ( MAKE-1PILE ?auto_80872 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80879 - BLOCK
    )
    :vars
    (
      ?auto_80880 - BLOCK
      ?auto_80881 - BLOCK
      ?auto_80885 - BLOCK
      ?auto_80882 - BLOCK
      ?auto_80883 - BLOCK
      ?auto_80884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80880 ?auto_80879 ) ( ON-TABLE ?auto_80879 ) ( not ( = ?auto_80879 ?auto_80880 ) ) ( not ( = ?auto_80879 ?auto_80881 ) ) ( not ( = ?auto_80879 ?auto_80885 ) ) ( not ( = ?auto_80880 ?auto_80881 ) ) ( not ( = ?auto_80880 ?auto_80885 ) ) ( not ( = ?auto_80881 ?auto_80885 ) ) ( ON ?auto_80881 ?auto_80880 ) ( ON-TABLE ?auto_80882 ) ( ON ?auto_80883 ?auto_80882 ) ( not ( = ?auto_80882 ?auto_80883 ) ) ( not ( = ?auto_80882 ?auto_80884 ) ) ( not ( = ?auto_80882 ?auto_80885 ) ) ( not ( = ?auto_80883 ?auto_80884 ) ) ( not ( = ?auto_80883 ?auto_80885 ) ) ( not ( = ?auto_80884 ?auto_80885 ) ) ( not ( = ?auto_80879 ?auto_80884 ) ) ( not ( = ?auto_80879 ?auto_80882 ) ) ( not ( = ?auto_80879 ?auto_80883 ) ) ( not ( = ?auto_80880 ?auto_80884 ) ) ( not ( = ?auto_80880 ?auto_80882 ) ) ( not ( = ?auto_80880 ?auto_80883 ) ) ( not ( = ?auto_80881 ?auto_80884 ) ) ( not ( = ?auto_80881 ?auto_80882 ) ) ( not ( = ?auto_80881 ?auto_80883 ) ) ( ON ?auto_80885 ?auto_80881 ) ( CLEAR ?auto_80885 ) ( HOLDING ?auto_80884 ) ( CLEAR ?auto_80883 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80882 ?auto_80883 ?auto_80884 )
      ( MAKE-1PILE ?auto_80879 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80886 - BLOCK
    )
    :vars
    (
      ?auto_80889 - BLOCK
      ?auto_80890 - BLOCK
      ?auto_80892 - BLOCK
      ?auto_80887 - BLOCK
      ?auto_80888 - BLOCK
      ?auto_80891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80889 ?auto_80886 ) ( ON-TABLE ?auto_80886 ) ( not ( = ?auto_80886 ?auto_80889 ) ) ( not ( = ?auto_80886 ?auto_80890 ) ) ( not ( = ?auto_80886 ?auto_80892 ) ) ( not ( = ?auto_80889 ?auto_80890 ) ) ( not ( = ?auto_80889 ?auto_80892 ) ) ( not ( = ?auto_80890 ?auto_80892 ) ) ( ON ?auto_80890 ?auto_80889 ) ( ON-TABLE ?auto_80887 ) ( ON ?auto_80888 ?auto_80887 ) ( not ( = ?auto_80887 ?auto_80888 ) ) ( not ( = ?auto_80887 ?auto_80891 ) ) ( not ( = ?auto_80887 ?auto_80892 ) ) ( not ( = ?auto_80888 ?auto_80891 ) ) ( not ( = ?auto_80888 ?auto_80892 ) ) ( not ( = ?auto_80891 ?auto_80892 ) ) ( not ( = ?auto_80886 ?auto_80891 ) ) ( not ( = ?auto_80886 ?auto_80887 ) ) ( not ( = ?auto_80886 ?auto_80888 ) ) ( not ( = ?auto_80889 ?auto_80891 ) ) ( not ( = ?auto_80889 ?auto_80887 ) ) ( not ( = ?auto_80889 ?auto_80888 ) ) ( not ( = ?auto_80890 ?auto_80891 ) ) ( not ( = ?auto_80890 ?auto_80887 ) ) ( not ( = ?auto_80890 ?auto_80888 ) ) ( ON ?auto_80892 ?auto_80890 ) ( CLEAR ?auto_80888 ) ( ON ?auto_80891 ?auto_80892 ) ( CLEAR ?auto_80891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80886 ?auto_80889 ?auto_80890 ?auto_80892 )
      ( MAKE-1PILE ?auto_80886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80893 - BLOCK
    )
    :vars
    (
      ?auto_80898 - BLOCK
      ?auto_80897 - BLOCK
      ?auto_80894 - BLOCK
      ?auto_80895 - BLOCK
      ?auto_80896 - BLOCK
      ?auto_80899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80898 ?auto_80893 ) ( ON-TABLE ?auto_80893 ) ( not ( = ?auto_80893 ?auto_80898 ) ) ( not ( = ?auto_80893 ?auto_80897 ) ) ( not ( = ?auto_80893 ?auto_80894 ) ) ( not ( = ?auto_80898 ?auto_80897 ) ) ( not ( = ?auto_80898 ?auto_80894 ) ) ( not ( = ?auto_80897 ?auto_80894 ) ) ( ON ?auto_80897 ?auto_80898 ) ( ON-TABLE ?auto_80895 ) ( not ( = ?auto_80895 ?auto_80896 ) ) ( not ( = ?auto_80895 ?auto_80899 ) ) ( not ( = ?auto_80895 ?auto_80894 ) ) ( not ( = ?auto_80896 ?auto_80899 ) ) ( not ( = ?auto_80896 ?auto_80894 ) ) ( not ( = ?auto_80899 ?auto_80894 ) ) ( not ( = ?auto_80893 ?auto_80899 ) ) ( not ( = ?auto_80893 ?auto_80895 ) ) ( not ( = ?auto_80893 ?auto_80896 ) ) ( not ( = ?auto_80898 ?auto_80899 ) ) ( not ( = ?auto_80898 ?auto_80895 ) ) ( not ( = ?auto_80898 ?auto_80896 ) ) ( not ( = ?auto_80897 ?auto_80899 ) ) ( not ( = ?auto_80897 ?auto_80895 ) ) ( not ( = ?auto_80897 ?auto_80896 ) ) ( ON ?auto_80894 ?auto_80897 ) ( ON ?auto_80899 ?auto_80894 ) ( CLEAR ?auto_80899 ) ( HOLDING ?auto_80896 ) ( CLEAR ?auto_80895 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80895 ?auto_80896 )
      ( MAKE-1PILE ?auto_80893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80900 - BLOCK
    )
    :vars
    (
      ?auto_80906 - BLOCK
      ?auto_80904 - BLOCK
      ?auto_80905 - BLOCK
      ?auto_80902 - BLOCK
      ?auto_80903 - BLOCK
      ?auto_80901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80906 ?auto_80900 ) ( ON-TABLE ?auto_80900 ) ( not ( = ?auto_80900 ?auto_80906 ) ) ( not ( = ?auto_80900 ?auto_80904 ) ) ( not ( = ?auto_80900 ?auto_80905 ) ) ( not ( = ?auto_80906 ?auto_80904 ) ) ( not ( = ?auto_80906 ?auto_80905 ) ) ( not ( = ?auto_80904 ?auto_80905 ) ) ( ON ?auto_80904 ?auto_80906 ) ( ON-TABLE ?auto_80902 ) ( not ( = ?auto_80902 ?auto_80903 ) ) ( not ( = ?auto_80902 ?auto_80901 ) ) ( not ( = ?auto_80902 ?auto_80905 ) ) ( not ( = ?auto_80903 ?auto_80901 ) ) ( not ( = ?auto_80903 ?auto_80905 ) ) ( not ( = ?auto_80901 ?auto_80905 ) ) ( not ( = ?auto_80900 ?auto_80901 ) ) ( not ( = ?auto_80900 ?auto_80902 ) ) ( not ( = ?auto_80900 ?auto_80903 ) ) ( not ( = ?auto_80906 ?auto_80901 ) ) ( not ( = ?auto_80906 ?auto_80902 ) ) ( not ( = ?auto_80906 ?auto_80903 ) ) ( not ( = ?auto_80904 ?auto_80901 ) ) ( not ( = ?auto_80904 ?auto_80902 ) ) ( not ( = ?auto_80904 ?auto_80903 ) ) ( ON ?auto_80905 ?auto_80904 ) ( ON ?auto_80901 ?auto_80905 ) ( CLEAR ?auto_80902 ) ( ON ?auto_80903 ?auto_80901 ) ( CLEAR ?auto_80903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80900 ?auto_80906 ?auto_80904 ?auto_80905 ?auto_80901 )
      ( MAKE-1PILE ?auto_80900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80907 - BLOCK
    )
    :vars
    (
      ?auto_80910 - BLOCK
      ?auto_80908 - BLOCK
      ?auto_80909 - BLOCK
      ?auto_80912 - BLOCK
      ?auto_80913 - BLOCK
      ?auto_80911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80910 ?auto_80907 ) ( ON-TABLE ?auto_80907 ) ( not ( = ?auto_80907 ?auto_80910 ) ) ( not ( = ?auto_80907 ?auto_80908 ) ) ( not ( = ?auto_80907 ?auto_80909 ) ) ( not ( = ?auto_80910 ?auto_80908 ) ) ( not ( = ?auto_80910 ?auto_80909 ) ) ( not ( = ?auto_80908 ?auto_80909 ) ) ( ON ?auto_80908 ?auto_80910 ) ( not ( = ?auto_80912 ?auto_80913 ) ) ( not ( = ?auto_80912 ?auto_80911 ) ) ( not ( = ?auto_80912 ?auto_80909 ) ) ( not ( = ?auto_80913 ?auto_80911 ) ) ( not ( = ?auto_80913 ?auto_80909 ) ) ( not ( = ?auto_80911 ?auto_80909 ) ) ( not ( = ?auto_80907 ?auto_80911 ) ) ( not ( = ?auto_80907 ?auto_80912 ) ) ( not ( = ?auto_80907 ?auto_80913 ) ) ( not ( = ?auto_80910 ?auto_80911 ) ) ( not ( = ?auto_80910 ?auto_80912 ) ) ( not ( = ?auto_80910 ?auto_80913 ) ) ( not ( = ?auto_80908 ?auto_80911 ) ) ( not ( = ?auto_80908 ?auto_80912 ) ) ( not ( = ?auto_80908 ?auto_80913 ) ) ( ON ?auto_80909 ?auto_80908 ) ( ON ?auto_80911 ?auto_80909 ) ( ON ?auto_80913 ?auto_80911 ) ( CLEAR ?auto_80913 ) ( HOLDING ?auto_80912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80912 )
      ( MAKE-1PILE ?auto_80907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80914 - BLOCK
    )
    :vars
    (
      ?auto_80918 - BLOCK
      ?auto_80916 - BLOCK
      ?auto_80917 - BLOCK
      ?auto_80919 - BLOCK
      ?auto_80915 - BLOCK
      ?auto_80920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80918 ?auto_80914 ) ( ON-TABLE ?auto_80914 ) ( not ( = ?auto_80914 ?auto_80918 ) ) ( not ( = ?auto_80914 ?auto_80916 ) ) ( not ( = ?auto_80914 ?auto_80917 ) ) ( not ( = ?auto_80918 ?auto_80916 ) ) ( not ( = ?auto_80918 ?auto_80917 ) ) ( not ( = ?auto_80916 ?auto_80917 ) ) ( ON ?auto_80916 ?auto_80918 ) ( not ( = ?auto_80919 ?auto_80915 ) ) ( not ( = ?auto_80919 ?auto_80920 ) ) ( not ( = ?auto_80919 ?auto_80917 ) ) ( not ( = ?auto_80915 ?auto_80920 ) ) ( not ( = ?auto_80915 ?auto_80917 ) ) ( not ( = ?auto_80920 ?auto_80917 ) ) ( not ( = ?auto_80914 ?auto_80920 ) ) ( not ( = ?auto_80914 ?auto_80919 ) ) ( not ( = ?auto_80914 ?auto_80915 ) ) ( not ( = ?auto_80918 ?auto_80920 ) ) ( not ( = ?auto_80918 ?auto_80919 ) ) ( not ( = ?auto_80918 ?auto_80915 ) ) ( not ( = ?auto_80916 ?auto_80920 ) ) ( not ( = ?auto_80916 ?auto_80919 ) ) ( not ( = ?auto_80916 ?auto_80915 ) ) ( ON ?auto_80917 ?auto_80916 ) ( ON ?auto_80920 ?auto_80917 ) ( ON ?auto_80915 ?auto_80920 ) ( ON ?auto_80919 ?auto_80915 ) ( CLEAR ?auto_80919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80914 ?auto_80918 ?auto_80916 ?auto_80917 ?auto_80920 ?auto_80915 )
      ( MAKE-1PILE ?auto_80914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80921 - BLOCK
    )
    :vars
    (
      ?auto_80923 - BLOCK
      ?auto_80926 - BLOCK
      ?auto_80924 - BLOCK
      ?auto_80922 - BLOCK
      ?auto_80925 - BLOCK
      ?auto_80927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80923 ?auto_80921 ) ( ON-TABLE ?auto_80921 ) ( not ( = ?auto_80921 ?auto_80923 ) ) ( not ( = ?auto_80921 ?auto_80926 ) ) ( not ( = ?auto_80921 ?auto_80924 ) ) ( not ( = ?auto_80923 ?auto_80926 ) ) ( not ( = ?auto_80923 ?auto_80924 ) ) ( not ( = ?auto_80926 ?auto_80924 ) ) ( ON ?auto_80926 ?auto_80923 ) ( not ( = ?auto_80922 ?auto_80925 ) ) ( not ( = ?auto_80922 ?auto_80927 ) ) ( not ( = ?auto_80922 ?auto_80924 ) ) ( not ( = ?auto_80925 ?auto_80927 ) ) ( not ( = ?auto_80925 ?auto_80924 ) ) ( not ( = ?auto_80927 ?auto_80924 ) ) ( not ( = ?auto_80921 ?auto_80927 ) ) ( not ( = ?auto_80921 ?auto_80922 ) ) ( not ( = ?auto_80921 ?auto_80925 ) ) ( not ( = ?auto_80923 ?auto_80927 ) ) ( not ( = ?auto_80923 ?auto_80922 ) ) ( not ( = ?auto_80923 ?auto_80925 ) ) ( not ( = ?auto_80926 ?auto_80927 ) ) ( not ( = ?auto_80926 ?auto_80922 ) ) ( not ( = ?auto_80926 ?auto_80925 ) ) ( ON ?auto_80924 ?auto_80926 ) ( ON ?auto_80927 ?auto_80924 ) ( ON ?auto_80925 ?auto_80927 ) ( HOLDING ?auto_80922 ) ( CLEAR ?auto_80925 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80921 ?auto_80923 ?auto_80926 ?auto_80924 ?auto_80927 ?auto_80925 ?auto_80922 )
      ( MAKE-1PILE ?auto_80921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80928 - BLOCK
    )
    :vars
    (
      ?auto_80934 - BLOCK
      ?auto_80929 - BLOCK
      ?auto_80933 - BLOCK
      ?auto_80931 - BLOCK
      ?auto_80932 - BLOCK
      ?auto_80930 - BLOCK
      ?auto_80935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80934 ?auto_80928 ) ( ON-TABLE ?auto_80928 ) ( not ( = ?auto_80928 ?auto_80934 ) ) ( not ( = ?auto_80928 ?auto_80929 ) ) ( not ( = ?auto_80928 ?auto_80933 ) ) ( not ( = ?auto_80934 ?auto_80929 ) ) ( not ( = ?auto_80934 ?auto_80933 ) ) ( not ( = ?auto_80929 ?auto_80933 ) ) ( ON ?auto_80929 ?auto_80934 ) ( not ( = ?auto_80931 ?auto_80932 ) ) ( not ( = ?auto_80931 ?auto_80930 ) ) ( not ( = ?auto_80931 ?auto_80933 ) ) ( not ( = ?auto_80932 ?auto_80930 ) ) ( not ( = ?auto_80932 ?auto_80933 ) ) ( not ( = ?auto_80930 ?auto_80933 ) ) ( not ( = ?auto_80928 ?auto_80930 ) ) ( not ( = ?auto_80928 ?auto_80931 ) ) ( not ( = ?auto_80928 ?auto_80932 ) ) ( not ( = ?auto_80934 ?auto_80930 ) ) ( not ( = ?auto_80934 ?auto_80931 ) ) ( not ( = ?auto_80934 ?auto_80932 ) ) ( not ( = ?auto_80929 ?auto_80930 ) ) ( not ( = ?auto_80929 ?auto_80931 ) ) ( not ( = ?auto_80929 ?auto_80932 ) ) ( ON ?auto_80933 ?auto_80929 ) ( ON ?auto_80930 ?auto_80933 ) ( ON ?auto_80932 ?auto_80930 ) ( CLEAR ?auto_80932 ) ( ON ?auto_80931 ?auto_80935 ) ( CLEAR ?auto_80931 ) ( HAND-EMPTY ) ( not ( = ?auto_80928 ?auto_80935 ) ) ( not ( = ?auto_80934 ?auto_80935 ) ) ( not ( = ?auto_80929 ?auto_80935 ) ) ( not ( = ?auto_80933 ?auto_80935 ) ) ( not ( = ?auto_80931 ?auto_80935 ) ) ( not ( = ?auto_80932 ?auto_80935 ) ) ( not ( = ?auto_80930 ?auto_80935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80931 ?auto_80935 )
      ( MAKE-1PILE ?auto_80928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80936 - BLOCK
    )
    :vars
    (
      ?auto_80939 - BLOCK
      ?auto_80943 - BLOCK
      ?auto_80937 - BLOCK
      ?auto_80940 - BLOCK
      ?auto_80938 - BLOCK
      ?auto_80941 - BLOCK
      ?auto_80942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80939 ?auto_80936 ) ( ON-TABLE ?auto_80936 ) ( not ( = ?auto_80936 ?auto_80939 ) ) ( not ( = ?auto_80936 ?auto_80943 ) ) ( not ( = ?auto_80936 ?auto_80937 ) ) ( not ( = ?auto_80939 ?auto_80943 ) ) ( not ( = ?auto_80939 ?auto_80937 ) ) ( not ( = ?auto_80943 ?auto_80937 ) ) ( ON ?auto_80943 ?auto_80939 ) ( not ( = ?auto_80940 ?auto_80938 ) ) ( not ( = ?auto_80940 ?auto_80941 ) ) ( not ( = ?auto_80940 ?auto_80937 ) ) ( not ( = ?auto_80938 ?auto_80941 ) ) ( not ( = ?auto_80938 ?auto_80937 ) ) ( not ( = ?auto_80941 ?auto_80937 ) ) ( not ( = ?auto_80936 ?auto_80941 ) ) ( not ( = ?auto_80936 ?auto_80940 ) ) ( not ( = ?auto_80936 ?auto_80938 ) ) ( not ( = ?auto_80939 ?auto_80941 ) ) ( not ( = ?auto_80939 ?auto_80940 ) ) ( not ( = ?auto_80939 ?auto_80938 ) ) ( not ( = ?auto_80943 ?auto_80941 ) ) ( not ( = ?auto_80943 ?auto_80940 ) ) ( not ( = ?auto_80943 ?auto_80938 ) ) ( ON ?auto_80937 ?auto_80943 ) ( ON ?auto_80941 ?auto_80937 ) ( ON ?auto_80940 ?auto_80942 ) ( CLEAR ?auto_80940 ) ( not ( = ?auto_80936 ?auto_80942 ) ) ( not ( = ?auto_80939 ?auto_80942 ) ) ( not ( = ?auto_80943 ?auto_80942 ) ) ( not ( = ?auto_80937 ?auto_80942 ) ) ( not ( = ?auto_80940 ?auto_80942 ) ) ( not ( = ?auto_80938 ?auto_80942 ) ) ( not ( = ?auto_80941 ?auto_80942 ) ) ( HOLDING ?auto_80938 ) ( CLEAR ?auto_80941 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80936 ?auto_80939 ?auto_80943 ?auto_80937 ?auto_80941 ?auto_80938 )
      ( MAKE-1PILE ?auto_80936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80944 - BLOCK
    )
    :vars
    (
      ?auto_80949 - BLOCK
      ?auto_80945 - BLOCK
      ?auto_80948 - BLOCK
      ?auto_80950 - BLOCK
      ?auto_80947 - BLOCK
      ?auto_80951 - BLOCK
      ?auto_80946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80949 ?auto_80944 ) ( ON-TABLE ?auto_80944 ) ( not ( = ?auto_80944 ?auto_80949 ) ) ( not ( = ?auto_80944 ?auto_80945 ) ) ( not ( = ?auto_80944 ?auto_80948 ) ) ( not ( = ?auto_80949 ?auto_80945 ) ) ( not ( = ?auto_80949 ?auto_80948 ) ) ( not ( = ?auto_80945 ?auto_80948 ) ) ( ON ?auto_80945 ?auto_80949 ) ( not ( = ?auto_80950 ?auto_80947 ) ) ( not ( = ?auto_80950 ?auto_80951 ) ) ( not ( = ?auto_80950 ?auto_80948 ) ) ( not ( = ?auto_80947 ?auto_80951 ) ) ( not ( = ?auto_80947 ?auto_80948 ) ) ( not ( = ?auto_80951 ?auto_80948 ) ) ( not ( = ?auto_80944 ?auto_80951 ) ) ( not ( = ?auto_80944 ?auto_80950 ) ) ( not ( = ?auto_80944 ?auto_80947 ) ) ( not ( = ?auto_80949 ?auto_80951 ) ) ( not ( = ?auto_80949 ?auto_80950 ) ) ( not ( = ?auto_80949 ?auto_80947 ) ) ( not ( = ?auto_80945 ?auto_80951 ) ) ( not ( = ?auto_80945 ?auto_80950 ) ) ( not ( = ?auto_80945 ?auto_80947 ) ) ( ON ?auto_80948 ?auto_80945 ) ( ON ?auto_80951 ?auto_80948 ) ( ON ?auto_80950 ?auto_80946 ) ( not ( = ?auto_80944 ?auto_80946 ) ) ( not ( = ?auto_80949 ?auto_80946 ) ) ( not ( = ?auto_80945 ?auto_80946 ) ) ( not ( = ?auto_80948 ?auto_80946 ) ) ( not ( = ?auto_80950 ?auto_80946 ) ) ( not ( = ?auto_80947 ?auto_80946 ) ) ( not ( = ?auto_80951 ?auto_80946 ) ) ( CLEAR ?auto_80951 ) ( ON ?auto_80947 ?auto_80950 ) ( CLEAR ?auto_80947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80946 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80946 ?auto_80950 )
      ( MAKE-1PILE ?auto_80944 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80952 - BLOCK
    )
    :vars
    (
      ?auto_80958 - BLOCK
      ?auto_80954 - BLOCK
      ?auto_80959 - BLOCK
      ?auto_80956 - BLOCK
      ?auto_80953 - BLOCK
      ?auto_80957 - BLOCK
      ?auto_80955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80958 ?auto_80952 ) ( ON-TABLE ?auto_80952 ) ( not ( = ?auto_80952 ?auto_80958 ) ) ( not ( = ?auto_80952 ?auto_80954 ) ) ( not ( = ?auto_80952 ?auto_80959 ) ) ( not ( = ?auto_80958 ?auto_80954 ) ) ( not ( = ?auto_80958 ?auto_80959 ) ) ( not ( = ?auto_80954 ?auto_80959 ) ) ( ON ?auto_80954 ?auto_80958 ) ( not ( = ?auto_80956 ?auto_80953 ) ) ( not ( = ?auto_80956 ?auto_80957 ) ) ( not ( = ?auto_80956 ?auto_80959 ) ) ( not ( = ?auto_80953 ?auto_80957 ) ) ( not ( = ?auto_80953 ?auto_80959 ) ) ( not ( = ?auto_80957 ?auto_80959 ) ) ( not ( = ?auto_80952 ?auto_80957 ) ) ( not ( = ?auto_80952 ?auto_80956 ) ) ( not ( = ?auto_80952 ?auto_80953 ) ) ( not ( = ?auto_80958 ?auto_80957 ) ) ( not ( = ?auto_80958 ?auto_80956 ) ) ( not ( = ?auto_80958 ?auto_80953 ) ) ( not ( = ?auto_80954 ?auto_80957 ) ) ( not ( = ?auto_80954 ?auto_80956 ) ) ( not ( = ?auto_80954 ?auto_80953 ) ) ( ON ?auto_80959 ?auto_80954 ) ( ON ?auto_80956 ?auto_80955 ) ( not ( = ?auto_80952 ?auto_80955 ) ) ( not ( = ?auto_80958 ?auto_80955 ) ) ( not ( = ?auto_80954 ?auto_80955 ) ) ( not ( = ?auto_80959 ?auto_80955 ) ) ( not ( = ?auto_80956 ?auto_80955 ) ) ( not ( = ?auto_80953 ?auto_80955 ) ) ( not ( = ?auto_80957 ?auto_80955 ) ) ( ON ?auto_80953 ?auto_80956 ) ( CLEAR ?auto_80953 ) ( ON-TABLE ?auto_80955 ) ( HOLDING ?auto_80957 ) ( CLEAR ?auto_80959 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80952 ?auto_80958 ?auto_80954 ?auto_80959 ?auto_80957 )
      ( MAKE-1PILE ?auto_80952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80960 - BLOCK
    )
    :vars
    (
      ?auto_80961 - BLOCK
      ?auto_80964 - BLOCK
      ?auto_80966 - BLOCK
      ?auto_80963 - BLOCK
      ?auto_80962 - BLOCK
      ?auto_80967 - BLOCK
      ?auto_80965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80961 ?auto_80960 ) ( ON-TABLE ?auto_80960 ) ( not ( = ?auto_80960 ?auto_80961 ) ) ( not ( = ?auto_80960 ?auto_80964 ) ) ( not ( = ?auto_80960 ?auto_80966 ) ) ( not ( = ?auto_80961 ?auto_80964 ) ) ( not ( = ?auto_80961 ?auto_80966 ) ) ( not ( = ?auto_80964 ?auto_80966 ) ) ( ON ?auto_80964 ?auto_80961 ) ( not ( = ?auto_80963 ?auto_80962 ) ) ( not ( = ?auto_80963 ?auto_80967 ) ) ( not ( = ?auto_80963 ?auto_80966 ) ) ( not ( = ?auto_80962 ?auto_80967 ) ) ( not ( = ?auto_80962 ?auto_80966 ) ) ( not ( = ?auto_80967 ?auto_80966 ) ) ( not ( = ?auto_80960 ?auto_80967 ) ) ( not ( = ?auto_80960 ?auto_80963 ) ) ( not ( = ?auto_80960 ?auto_80962 ) ) ( not ( = ?auto_80961 ?auto_80967 ) ) ( not ( = ?auto_80961 ?auto_80963 ) ) ( not ( = ?auto_80961 ?auto_80962 ) ) ( not ( = ?auto_80964 ?auto_80967 ) ) ( not ( = ?auto_80964 ?auto_80963 ) ) ( not ( = ?auto_80964 ?auto_80962 ) ) ( ON ?auto_80966 ?auto_80964 ) ( ON ?auto_80963 ?auto_80965 ) ( not ( = ?auto_80960 ?auto_80965 ) ) ( not ( = ?auto_80961 ?auto_80965 ) ) ( not ( = ?auto_80964 ?auto_80965 ) ) ( not ( = ?auto_80966 ?auto_80965 ) ) ( not ( = ?auto_80963 ?auto_80965 ) ) ( not ( = ?auto_80962 ?auto_80965 ) ) ( not ( = ?auto_80967 ?auto_80965 ) ) ( ON ?auto_80962 ?auto_80963 ) ( ON-TABLE ?auto_80965 ) ( CLEAR ?auto_80966 ) ( ON ?auto_80967 ?auto_80962 ) ( CLEAR ?auto_80967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80965 ?auto_80963 ?auto_80962 )
      ( MAKE-1PILE ?auto_80960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80968 - BLOCK
    )
    :vars
    (
      ?auto_80975 - BLOCK
      ?auto_80970 - BLOCK
      ?auto_80971 - BLOCK
      ?auto_80974 - BLOCK
      ?auto_80973 - BLOCK
      ?auto_80969 - BLOCK
      ?auto_80972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80975 ?auto_80968 ) ( ON-TABLE ?auto_80968 ) ( not ( = ?auto_80968 ?auto_80975 ) ) ( not ( = ?auto_80968 ?auto_80970 ) ) ( not ( = ?auto_80968 ?auto_80971 ) ) ( not ( = ?auto_80975 ?auto_80970 ) ) ( not ( = ?auto_80975 ?auto_80971 ) ) ( not ( = ?auto_80970 ?auto_80971 ) ) ( ON ?auto_80970 ?auto_80975 ) ( not ( = ?auto_80974 ?auto_80973 ) ) ( not ( = ?auto_80974 ?auto_80969 ) ) ( not ( = ?auto_80974 ?auto_80971 ) ) ( not ( = ?auto_80973 ?auto_80969 ) ) ( not ( = ?auto_80973 ?auto_80971 ) ) ( not ( = ?auto_80969 ?auto_80971 ) ) ( not ( = ?auto_80968 ?auto_80969 ) ) ( not ( = ?auto_80968 ?auto_80974 ) ) ( not ( = ?auto_80968 ?auto_80973 ) ) ( not ( = ?auto_80975 ?auto_80969 ) ) ( not ( = ?auto_80975 ?auto_80974 ) ) ( not ( = ?auto_80975 ?auto_80973 ) ) ( not ( = ?auto_80970 ?auto_80969 ) ) ( not ( = ?auto_80970 ?auto_80974 ) ) ( not ( = ?auto_80970 ?auto_80973 ) ) ( ON ?auto_80974 ?auto_80972 ) ( not ( = ?auto_80968 ?auto_80972 ) ) ( not ( = ?auto_80975 ?auto_80972 ) ) ( not ( = ?auto_80970 ?auto_80972 ) ) ( not ( = ?auto_80971 ?auto_80972 ) ) ( not ( = ?auto_80974 ?auto_80972 ) ) ( not ( = ?auto_80973 ?auto_80972 ) ) ( not ( = ?auto_80969 ?auto_80972 ) ) ( ON ?auto_80973 ?auto_80974 ) ( ON-TABLE ?auto_80972 ) ( ON ?auto_80969 ?auto_80973 ) ( CLEAR ?auto_80969 ) ( HOLDING ?auto_80971 ) ( CLEAR ?auto_80970 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80968 ?auto_80975 ?auto_80970 ?auto_80971 )
      ( MAKE-1PILE ?auto_80968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80976 - BLOCK
    )
    :vars
    (
      ?auto_80983 - BLOCK
      ?auto_80979 - BLOCK
      ?auto_80980 - BLOCK
      ?auto_80977 - BLOCK
      ?auto_80982 - BLOCK
      ?auto_80978 - BLOCK
      ?auto_80981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80983 ?auto_80976 ) ( ON-TABLE ?auto_80976 ) ( not ( = ?auto_80976 ?auto_80983 ) ) ( not ( = ?auto_80976 ?auto_80979 ) ) ( not ( = ?auto_80976 ?auto_80980 ) ) ( not ( = ?auto_80983 ?auto_80979 ) ) ( not ( = ?auto_80983 ?auto_80980 ) ) ( not ( = ?auto_80979 ?auto_80980 ) ) ( ON ?auto_80979 ?auto_80983 ) ( not ( = ?auto_80977 ?auto_80982 ) ) ( not ( = ?auto_80977 ?auto_80978 ) ) ( not ( = ?auto_80977 ?auto_80980 ) ) ( not ( = ?auto_80982 ?auto_80978 ) ) ( not ( = ?auto_80982 ?auto_80980 ) ) ( not ( = ?auto_80978 ?auto_80980 ) ) ( not ( = ?auto_80976 ?auto_80978 ) ) ( not ( = ?auto_80976 ?auto_80977 ) ) ( not ( = ?auto_80976 ?auto_80982 ) ) ( not ( = ?auto_80983 ?auto_80978 ) ) ( not ( = ?auto_80983 ?auto_80977 ) ) ( not ( = ?auto_80983 ?auto_80982 ) ) ( not ( = ?auto_80979 ?auto_80978 ) ) ( not ( = ?auto_80979 ?auto_80977 ) ) ( not ( = ?auto_80979 ?auto_80982 ) ) ( ON ?auto_80977 ?auto_80981 ) ( not ( = ?auto_80976 ?auto_80981 ) ) ( not ( = ?auto_80983 ?auto_80981 ) ) ( not ( = ?auto_80979 ?auto_80981 ) ) ( not ( = ?auto_80980 ?auto_80981 ) ) ( not ( = ?auto_80977 ?auto_80981 ) ) ( not ( = ?auto_80982 ?auto_80981 ) ) ( not ( = ?auto_80978 ?auto_80981 ) ) ( ON ?auto_80982 ?auto_80977 ) ( ON-TABLE ?auto_80981 ) ( ON ?auto_80978 ?auto_80982 ) ( CLEAR ?auto_80979 ) ( ON ?auto_80980 ?auto_80978 ) ( CLEAR ?auto_80980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80981 ?auto_80977 ?auto_80982 ?auto_80978 )
      ( MAKE-1PILE ?auto_80976 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80984 - BLOCK
    )
    :vars
    (
      ?auto_80991 - BLOCK
      ?auto_80985 - BLOCK
      ?auto_80988 - BLOCK
      ?auto_80990 - BLOCK
      ?auto_80986 - BLOCK
      ?auto_80989 - BLOCK
      ?auto_80987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80991 ?auto_80984 ) ( ON-TABLE ?auto_80984 ) ( not ( = ?auto_80984 ?auto_80991 ) ) ( not ( = ?auto_80984 ?auto_80985 ) ) ( not ( = ?auto_80984 ?auto_80988 ) ) ( not ( = ?auto_80991 ?auto_80985 ) ) ( not ( = ?auto_80991 ?auto_80988 ) ) ( not ( = ?auto_80985 ?auto_80988 ) ) ( not ( = ?auto_80990 ?auto_80986 ) ) ( not ( = ?auto_80990 ?auto_80989 ) ) ( not ( = ?auto_80990 ?auto_80988 ) ) ( not ( = ?auto_80986 ?auto_80989 ) ) ( not ( = ?auto_80986 ?auto_80988 ) ) ( not ( = ?auto_80989 ?auto_80988 ) ) ( not ( = ?auto_80984 ?auto_80989 ) ) ( not ( = ?auto_80984 ?auto_80990 ) ) ( not ( = ?auto_80984 ?auto_80986 ) ) ( not ( = ?auto_80991 ?auto_80989 ) ) ( not ( = ?auto_80991 ?auto_80990 ) ) ( not ( = ?auto_80991 ?auto_80986 ) ) ( not ( = ?auto_80985 ?auto_80989 ) ) ( not ( = ?auto_80985 ?auto_80990 ) ) ( not ( = ?auto_80985 ?auto_80986 ) ) ( ON ?auto_80990 ?auto_80987 ) ( not ( = ?auto_80984 ?auto_80987 ) ) ( not ( = ?auto_80991 ?auto_80987 ) ) ( not ( = ?auto_80985 ?auto_80987 ) ) ( not ( = ?auto_80988 ?auto_80987 ) ) ( not ( = ?auto_80990 ?auto_80987 ) ) ( not ( = ?auto_80986 ?auto_80987 ) ) ( not ( = ?auto_80989 ?auto_80987 ) ) ( ON ?auto_80986 ?auto_80990 ) ( ON-TABLE ?auto_80987 ) ( ON ?auto_80989 ?auto_80986 ) ( ON ?auto_80988 ?auto_80989 ) ( CLEAR ?auto_80988 ) ( HOLDING ?auto_80985 ) ( CLEAR ?auto_80991 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80984 ?auto_80991 ?auto_80985 )
      ( MAKE-1PILE ?auto_80984 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80992 - BLOCK
    )
    :vars
    (
      ?auto_80995 - BLOCK
      ?auto_80999 - BLOCK
      ?auto_80997 - BLOCK
      ?auto_80993 - BLOCK
      ?auto_80994 - BLOCK
      ?auto_80998 - BLOCK
      ?auto_80996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80995 ?auto_80992 ) ( ON-TABLE ?auto_80992 ) ( not ( = ?auto_80992 ?auto_80995 ) ) ( not ( = ?auto_80992 ?auto_80999 ) ) ( not ( = ?auto_80992 ?auto_80997 ) ) ( not ( = ?auto_80995 ?auto_80999 ) ) ( not ( = ?auto_80995 ?auto_80997 ) ) ( not ( = ?auto_80999 ?auto_80997 ) ) ( not ( = ?auto_80993 ?auto_80994 ) ) ( not ( = ?auto_80993 ?auto_80998 ) ) ( not ( = ?auto_80993 ?auto_80997 ) ) ( not ( = ?auto_80994 ?auto_80998 ) ) ( not ( = ?auto_80994 ?auto_80997 ) ) ( not ( = ?auto_80998 ?auto_80997 ) ) ( not ( = ?auto_80992 ?auto_80998 ) ) ( not ( = ?auto_80992 ?auto_80993 ) ) ( not ( = ?auto_80992 ?auto_80994 ) ) ( not ( = ?auto_80995 ?auto_80998 ) ) ( not ( = ?auto_80995 ?auto_80993 ) ) ( not ( = ?auto_80995 ?auto_80994 ) ) ( not ( = ?auto_80999 ?auto_80998 ) ) ( not ( = ?auto_80999 ?auto_80993 ) ) ( not ( = ?auto_80999 ?auto_80994 ) ) ( ON ?auto_80993 ?auto_80996 ) ( not ( = ?auto_80992 ?auto_80996 ) ) ( not ( = ?auto_80995 ?auto_80996 ) ) ( not ( = ?auto_80999 ?auto_80996 ) ) ( not ( = ?auto_80997 ?auto_80996 ) ) ( not ( = ?auto_80993 ?auto_80996 ) ) ( not ( = ?auto_80994 ?auto_80996 ) ) ( not ( = ?auto_80998 ?auto_80996 ) ) ( ON ?auto_80994 ?auto_80993 ) ( ON-TABLE ?auto_80996 ) ( ON ?auto_80998 ?auto_80994 ) ( ON ?auto_80997 ?auto_80998 ) ( CLEAR ?auto_80995 ) ( ON ?auto_80999 ?auto_80997 ) ( CLEAR ?auto_80999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80996 ?auto_80993 ?auto_80994 ?auto_80998 ?auto_80997 )
      ( MAKE-1PILE ?auto_80992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81016 - BLOCK
    )
    :vars
    (
      ?auto_81023 - BLOCK
      ?auto_81020 - BLOCK
      ?auto_81019 - BLOCK
      ?auto_81017 - BLOCK
      ?auto_81022 - BLOCK
      ?auto_81021 - BLOCK
      ?auto_81018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81016 ?auto_81023 ) ) ( not ( = ?auto_81016 ?auto_81020 ) ) ( not ( = ?auto_81016 ?auto_81019 ) ) ( not ( = ?auto_81023 ?auto_81020 ) ) ( not ( = ?auto_81023 ?auto_81019 ) ) ( not ( = ?auto_81020 ?auto_81019 ) ) ( not ( = ?auto_81017 ?auto_81022 ) ) ( not ( = ?auto_81017 ?auto_81021 ) ) ( not ( = ?auto_81017 ?auto_81019 ) ) ( not ( = ?auto_81022 ?auto_81021 ) ) ( not ( = ?auto_81022 ?auto_81019 ) ) ( not ( = ?auto_81021 ?auto_81019 ) ) ( not ( = ?auto_81016 ?auto_81021 ) ) ( not ( = ?auto_81016 ?auto_81017 ) ) ( not ( = ?auto_81016 ?auto_81022 ) ) ( not ( = ?auto_81023 ?auto_81021 ) ) ( not ( = ?auto_81023 ?auto_81017 ) ) ( not ( = ?auto_81023 ?auto_81022 ) ) ( not ( = ?auto_81020 ?auto_81021 ) ) ( not ( = ?auto_81020 ?auto_81017 ) ) ( not ( = ?auto_81020 ?auto_81022 ) ) ( ON ?auto_81017 ?auto_81018 ) ( not ( = ?auto_81016 ?auto_81018 ) ) ( not ( = ?auto_81023 ?auto_81018 ) ) ( not ( = ?auto_81020 ?auto_81018 ) ) ( not ( = ?auto_81019 ?auto_81018 ) ) ( not ( = ?auto_81017 ?auto_81018 ) ) ( not ( = ?auto_81022 ?auto_81018 ) ) ( not ( = ?auto_81021 ?auto_81018 ) ) ( ON ?auto_81022 ?auto_81017 ) ( ON-TABLE ?auto_81018 ) ( ON ?auto_81021 ?auto_81022 ) ( ON ?auto_81019 ?auto_81021 ) ( ON ?auto_81020 ?auto_81019 ) ( ON ?auto_81023 ?auto_81020 ) ( CLEAR ?auto_81023 ) ( HOLDING ?auto_81016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81016 ?auto_81023 )
      ( MAKE-1PILE ?auto_81016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81024 - BLOCK
    )
    :vars
    (
      ?auto_81026 - BLOCK
      ?auto_81025 - BLOCK
      ?auto_81027 - BLOCK
      ?auto_81029 - BLOCK
      ?auto_81028 - BLOCK
      ?auto_81031 - BLOCK
      ?auto_81030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81024 ?auto_81026 ) ) ( not ( = ?auto_81024 ?auto_81025 ) ) ( not ( = ?auto_81024 ?auto_81027 ) ) ( not ( = ?auto_81026 ?auto_81025 ) ) ( not ( = ?auto_81026 ?auto_81027 ) ) ( not ( = ?auto_81025 ?auto_81027 ) ) ( not ( = ?auto_81029 ?auto_81028 ) ) ( not ( = ?auto_81029 ?auto_81031 ) ) ( not ( = ?auto_81029 ?auto_81027 ) ) ( not ( = ?auto_81028 ?auto_81031 ) ) ( not ( = ?auto_81028 ?auto_81027 ) ) ( not ( = ?auto_81031 ?auto_81027 ) ) ( not ( = ?auto_81024 ?auto_81031 ) ) ( not ( = ?auto_81024 ?auto_81029 ) ) ( not ( = ?auto_81024 ?auto_81028 ) ) ( not ( = ?auto_81026 ?auto_81031 ) ) ( not ( = ?auto_81026 ?auto_81029 ) ) ( not ( = ?auto_81026 ?auto_81028 ) ) ( not ( = ?auto_81025 ?auto_81031 ) ) ( not ( = ?auto_81025 ?auto_81029 ) ) ( not ( = ?auto_81025 ?auto_81028 ) ) ( ON ?auto_81029 ?auto_81030 ) ( not ( = ?auto_81024 ?auto_81030 ) ) ( not ( = ?auto_81026 ?auto_81030 ) ) ( not ( = ?auto_81025 ?auto_81030 ) ) ( not ( = ?auto_81027 ?auto_81030 ) ) ( not ( = ?auto_81029 ?auto_81030 ) ) ( not ( = ?auto_81028 ?auto_81030 ) ) ( not ( = ?auto_81031 ?auto_81030 ) ) ( ON ?auto_81028 ?auto_81029 ) ( ON-TABLE ?auto_81030 ) ( ON ?auto_81031 ?auto_81028 ) ( ON ?auto_81027 ?auto_81031 ) ( ON ?auto_81025 ?auto_81027 ) ( ON ?auto_81026 ?auto_81025 ) ( ON ?auto_81024 ?auto_81026 ) ( CLEAR ?auto_81024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81030 ?auto_81029 ?auto_81028 ?auto_81031 ?auto_81027 ?auto_81025 ?auto_81026 )
      ( MAKE-1PILE ?auto_81024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81038 - BLOCK
      ?auto_81039 - BLOCK
      ?auto_81040 - BLOCK
      ?auto_81041 - BLOCK
      ?auto_81042 - BLOCK
      ?auto_81043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81043 ) ( CLEAR ?auto_81042 ) ( ON-TABLE ?auto_81038 ) ( ON ?auto_81039 ?auto_81038 ) ( ON ?auto_81040 ?auto_81039 ) ( ON ?auto_81041 ?auto_81040 ) ( ON ?auto_81042 ?auto_81041 ) ( not ( = ?auto_81038 ?auto_81039 ) ) ( not ( = ?auto_81038 ?auto_81040 ) ) ( not ( = ?auto_81038 ?auto_81041 ) ) ( not ( = ?auto_81038 ?auto_81042 ) ) ( not ( = ?auto_81038 ?auto_81043 ) ) ( not ( = ?auto_81039 ?auto_81040 ) ) ( not ( = ?auto_81039 ?auto_81041 ) ) ( not ( = ?auto_81039 ?auto_81042 ) ) ( not ( = ?auto_81039 ?auto_81043 ) ) ( not ( = ?auto_81040 ?auto_81041 ) ) ( not ( = ?auto_81040 ?auto_81042 ) ) ( not ( = ?auto_81040 ?auto_81043 ) ) ( not ( = ?auto_81041 ?auto_81042 ) ) ( not ( = ?auto_81041 ?auto_81043 ) ) ( not ( = ?auto_81042 ?auto_81043 ) ) )
    :subtasks
    ( ( !STACK ?auto_81043 ?auto_81042 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81044 - BLOCK
      ?auto_81045 - BLOCK
      ?auto_81046 - BLOCK
      ?auto_81047 - BLOCK
      ?auto_81048 - BLOCK
      ?auto_81049 - BLOCK
    )
    :vars
    (
      ?auto_81050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81048 ) ( ON-TABLE ?auto_81044 ) ( ON ?auto_81045 ?auto_81044 ) ( ON ?auto_81046 ?auto_81045 ) ( ON ?auto_81047 ?auto_81046 ) ( ON ?auto_81048 ?auto_81047 ) ( not ( = ?auto_81044 ?auto_81045 ) ) ( not ( = ?auto_81044 ?auto_81046 ) ) ( not ( = ?auto_81044 ?auto_81047 ) ) ( not ( = ?auto_81044 ?auto_81048 ) ) ( not ( = ?auto_81044 ?auto_81049 ) ) ( not ( = ?auto_81045 ?auto_81046 ) ) ( not ( = ?auto_81045 ?auto_81047 ) ) ( not ( = ?auto_81045 ?auto_81048 ) ) ( not ( = ?auto_81045 ?auto_81049 ) ) ( not ( = ?auto_81046 ?auto_81047 ) ) ( not ( = ?auto_81046 ?auto_81048 ) ) ( not ( = ?auto_81046 ?auto_81049 ) ) ( not ( = ?auto_81047 ?auto_81048 ) ) ( not ( = ?auto_81047 ?auto_81049 ) ) ( not ( = ?auto_81048 ?auto_81049 ) ) ( ON ?auto_81049 ?auto_81050 ) ( CLEAR ?auto_81049 ) ( HAND-EMPTY ) ( not ( = ?auto_81044 ?auto_81050 ) ) ( not ( = ?auto_81045 ?auto_81050 ) ) ( not ( = ?auto_81046 ?auto_81050 ) ) ( not ( = ?auto_81047 ?auto_81050 ) ) ( not ( = ?auto_81048 ?auto_81050 ) ) ( not ( = ?auto_81049 ?auto_81050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81049 ?auto_81050 )
      ( MAKE-6PILE ?auto_81044 ?auto_81045 ?auto_81046 ?auto_81047 ?auto_81048 ?auto_81049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81051 - BLOCK
      ?auto_81052 - BLOCK
      ?auto_81053 - BLOCK
      ?auto_81054 - BLOCK
      ?auto_81055 - BLOCK
      ?auto_81056 - BLOCK
    )
    :vars
    (
      ?auto_81057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81051 ) ( ON ?auto_81052 ?auto_81051 ) ( ON ?auto_81053 ?auto_81052 ) ( ON ?auto_81054 ?auto_81053 ) ( not ( = ?auto_81051 ?auto_81052 ) ) ( not ( = ?auto_81051 ?auto_81053 ) ) ( not ( = ?auto_81051 ?auto_81054 ) ) ( not ( = ?auto_81051 ?auto_81055 ) ) ( not ( = ?auto_81051 ?auto_81056 ) ) ( not ( = ?auto_81052 ?auto_81053 ) ) ( not ( = ?auto_81052 ?auto_81054 ) ) ( not ( = ?auto_81052 ?auto_81055 ) ) ( not ( = ?auto_81052 ?auto_81056 ) ) ( not ( = ?auto_81053 ?auto_81054 ) ) ( not ( = ?auto_81053 ?auto_81055 ) ) ( not ( = ?auto_81053 ?auto_81056 ) ) ( not ( = ?auto_81054 ?auto_81055 ) ) ( not ( = ?auto_81054 ?auto_81056 ) ) ( not ( = ?auto_81055 ?auto_81056 ) ) ( ON ?auto_81056 ?auto_81057 ) ( CLEAR ?auto_81056 ) ( not ( = ?auto_81051 ?auto_81057 ) ) ( not ( = ?auto_81052 ?auto_81057 ) ) ( not ( = ?auto_81053 ?auto_81057 ) ) ( not ( = ?auto_81054 ?auto_81057 ) ) ( not ( = ?auto_81055 ?auto_81057 ) ) ( not ( = ?auto_81056 ?auto_81057 ) ) ( HOLDING ?auto_81055 ) ( CLEAR ?auto_81054 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81051 ?auto_81052 ?auto_81053 ?auto_81054 ?auto_81055 )
      ( MAKE-6PILE ?auto_81051 ?auto_81052 ?auto_81053 ?auto_81054 ?auto_81055 ?auto_81056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81058 - BLOCK
      ?auto_81059 - BLOCK
      ?auto_81060 - BLOCK
      ?auto_81061 - BLOCK
      ?auto_81062 - BLOCK
      ?auto_81063 - BLOCK
    )
    :vars
    (
      ?auto_81064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81058 ) ( ON ?auto_81059 ?auto_81058 ) ( ON ?auto_81060 ?auto_81059 ) ( ON ?auto_81061 ?auto_81060 ) ( not ( = ?auto_81058 ?auto_81059 ) ) ( not ( = ?auto_81058 ?auto_81060 ) ) ( not ( = ?auto_81058 ?auto_81061 ) ) ( not ( = ?auto_81058 ?auto_81062 ) ) ( not ( = ?auto_81058 ?auto_81063 ) ) ( not ( = ?auto_81059 ?auto_81060 ) ) ( not ( = ?auto_81059 ?auto_81061 ) ) ( not ( = ?auto_81059 ?auto_81062 ) ) ( not ( = ?auto_81059 ?auto_81063 ) ) ( not ( = ?auto_81060 ?auto_81061 ) ) ( not ( = ?auto_81060 ?auto_81062 ) ) ( not ( = ?auto_81060 ?auto_81063 ) ) ( not ( = ?auto_81061 ?auto_81062 ) ) ( not ( = ?auto_81061 ?auto_81063 ) ) ( not ( = ?auto_81062 ?auto_81063 ) ) ( ON ?auto_81063 ?auto_81064 ) ( not ( = ?auto_81058 ?auto_81064 ) ) ( not ( = ?auto_81059 ?auto_81064 ) ) ( not ( = ?auto_81060 ?auto_81064 ) ) ( not ( = ?auto_81061 ?auto_81064 ) ) ( not ( = ?auto_81062 ?auto_81064 ) ) ( not ( = ?auto_81063 ?auto_81064 ) ) ( CLEAR ?auto_81061 ) ( ON ?auto_81062 ?auto_81063 ) ( CLEAR ?auto_81062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81064 ?auto_81063 )
      ( MAKE-6PILE ?auto_81058 ?auto_81059 ?auto_81060 ?auto_81061 ?auto_81062 ?auto_81063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81065 - BLOCK
      ?auto_81066 - BLOCK
      ?auto_81067 - BLOCK
      ?auto_81068 - BLOCK
      ?auto_81069 - BLOCK
      ?auto_81070 - BLOCK
    )
    :vars
    (
      ?auto_81071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81065 ) ( ON ?auto_81066 ?auto_81065 ) ( ON ?auto_81067 ?auto_81066 ) ( not ( = ?auto_81065 ?auto_81066 ) ) ( not ( = ?auto_81065 ?auto_81067 ) ) ( not ( = ?auto_81065 ?auto_81068 ) ) ( not ( = ?auto_81065 ?auto_81069 ) ) ( not ( = ?auto_81065 ?auto_81070 ) ) ( not ( = ?auto_81066 ?auto_81067 ) ) ( not ( = ?auto_81066 ?auto_81068 ) ) ( not ( = ?auto_81066 ?auto_81069 ) ) ( not ( = ?auto_81066 ?auto_81070 ) ) ( not ( = ?auto_81067 ?auto_81068 ) ) ( not ( = ?auto_81067 ?auto_81069 ) ) ( not ( = ?auto_81067 ?auto_81070 ) ) ( not ( = ?auto_81068 ?auto_81069 ) ) ( not ( = ?auto_81068 ?auto_81070 ) ) ( not ( = ?auto_81069 ?auto_81070 ) ) ( ON ?auto_81070 ?auto_81071 ) ( not ( = ?auto_81065 ?auto_81071 ) ) ( not ( = ?auto_81066 ?auto_81071 ) ) ( not ( = ?auto_81067 ?auto_81071 ) ) ( not ( = ?auto_81068 ?auto_81071 ) ) ( not ( = ?auto_81069 ?auto_81071 ) ) ( not ( = ?auto_81070 ?auto_81071 ) ) ( ON ?auto_81069 ?auto_81070 ) ( CLEAR ?auto_81069 ) ( ON-TABLE ?auto_81071 ) ( HOLDING ?auto_81068 ) ( CLEAR ?auto_81067 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81065 ?auto_81066 ?auto_81067 ?auto_81068 )
      ( MAKE-6PILE ?auto_81065 ?auto_81066 ?auto_81067 ?auto_81068 ?auto_81069 ?auto_81070 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81072 - BLOCK
      ?auto_81073 - BLOCK
      ?auto_81074 - BLOCK
      ?auto_81075 - BLOCK
      ?auto_81076 - BLOCK
      ?auto_81077 - BLOCK
    )
    :vars
    (
      ?auto_81078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81072 ) ( ON ?auto_81073 ?auto_81072 ) ( ON ?auto_81074 ?auto_81073 ) ( not ( = ?auto_81072 ?auto_81073 ) ) ( not ( = ?auto_81072 ?auto_81074 ) ) ( not ( = ?auto_81072 ?auto_81075 ) ) ( not ( = ?auto_81072 ?auto_81076 ) ) ( not ( = ?auto_81072 ?auto_81077 ) ) ( not ( = ?auto_81073 ?auto_81074 ) ) ( not ( = ?auto_81073 ?auto_81075 ) ) ( not ( = ?auto_81073 ?auto_81076 ) ) ( not ( = ?auto_81073 ?auto_81077 ) ) ( not ( = ?auto_81074 ?auto_81075 ) ) ( not ( = ?auto_81074 ?auto_81076 ) ) ( not ( = ?auto_81074 ?auto_81077 ) ) ( not ( = ?auto_81075 ?auto_81076 ) ) ( not ( = ?auto_81075 ?auto_81077 ) ) ( not ( = ?auto_81076 ?auto_81077 ) ) ( ON ?auto_81077 ?auto_81078 ) ( not ( = ?auto_81072 ?auto_81078 ) ) ( not ( = ?auto_81073 ?auto_81078 ) ) ( not ( = ?auto_81074 ?auto_81078 ) ) ( not ( = ?auto_81075 ?auto_81078 ) ) ( not ( = ?auto_81076 ?auto_81078 ) ) ( not ( = ?auto_81077 ?auto_81078 ) ) ( ON ?auto_81076 ?auto_81077 ) ( ON-TABLE ?auto_81078 ) ( CLEAR ?auto_81074 ) ( ON ?auto_81075 ?auto_81076 ) ( CLEAR ?auto_81075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81078 ?auto_81077 ?auto_81076 )
      ( MAKE-6PILE ?auto_81072 ?auto_81073 ?auto_81074 ?auto_81075 ?auto_81076 ?auto_81077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81079 - BLOCK
      ?auto_81080 - BLOCK
      ?auto_81081 - BLOCK
      ?auto_81082 - BLOCK
      ?auto_81083 - BLOCK
      ?auto_81084 - BLOCK
    )
    :vars
    (
      ?auto_81085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81079 ) ( ON ?auto_81080 ?auto_81079 ) ( not ( = ?auto_81079 ?auto_81080 ) ) ( not ( = ?auto_81079 ?auto_81081 ) ) ( not ( = ?auto_81079 ?auto_81082 ) ) ( not ( = ?auto_81079 ?auto_81083 ) ) ( not ( = ?auto_81079 ?auto_81084 ) ) ( not ( = ?auto_81080 ?auto_81081 ) ) ( not ( = ?auto_81080 ?auto_81082 ) ) ( not ( = ?auto_81080 ?auto_81083 ) ) ( not ( = ?auto_81080 ?auto_81084 ) ) ( not ( = ?auto_81081 ?auto_81082 ) ) ( not ( = ?auto_81081 ?auto_81083 ) ) ( not ( = ?auto_81081 ?auto_81084 ) ) ( not ( = ?auto_81082 ?auto_81083 ) ) ( not ( = ?auto_81082 ?auto_81084 ) ) ( not ( = ?auto_81083 ?auto_81084 ) ) ( ON ?auto_81084 ?auto_81085 ) ( not ( = ?auto_81079 ?auto_81085 ) ) ( not ( = ?auto_81080 ?auto_81085 ) ) ( not ( = ?auto_81081 ?auto_81085 ) ) ( not ( = ?auto_81082 ?auto_81085 ) ) ( not ( = ?auto_81083 ?auto_81085 ) ) ( not ( = ?auto_81084 ?auto_81085 ) ) ( ON ?auto_81083 ?auto_81084 ) ( ON-TABLE ?auto_81085 ) ( ON ?auto_81082 ?auto_81083 ) ( CLEAR ?auto_81082 ) ( HOLDING ?auto_81081 ) ( CLEAR ?auto_81080 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81079 ?auto_81080 ?auto_81081 )
      ( MAKE-6PILE ?auto_81079 ?auto_81080 ?auto_81081 ?auto_81082 ?auto_81083 ?auto_81084 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81086 - BLOCK
      ?auto_81087 - BLOCK
      ?auto_81088 - BLOCK
      ?auto_81089 - BLOCK
      ?auto_81090 - BLOCK
      ?auto_81091 - BLOCK
    )
    :vars
    (
      ?auto_81092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81086 ) ( ON ?auto_81087 ?auto_81086 ) ( not ( = ?auto_81086 ?auto_81087 ) ) ( not ( = ?auto_81086 ?auto_81088 ) ) ( not ( = ?auto_81086 ?auto_81089 ) ) ( not ( = ?auto_81086 ?auto_81090 ) ) ( not ( = ?auto_81086 ?auto_81091 ) ) ( not ( = ?auto_81087 ?auto_81088 ) ) ( not ( = ?auto_81087 ?auto_81089 ) ) ( not ( = ?auto_81087 ?auto_81090 ) ) ( not ( = ?auto_81087 ?auto_81091 ) ) ( not ( = ?auto_81088 ?auto_81089 ) ) ( not ( = ?auto_81088 ?auto_81090 ) ) ( not ( = ?auto_81088 ?auto_81091 ) ) ( not ( = ?auto_81089 ?auto_81090 ) ) ( not ( = ?auto_81089 ?auto_81091 ) ) ( not ( = ?auto_81090 ?auto_81091 ) ) ( ON ?auto_81091 ?auto_81092 ) ( not ( = ?auto_81086 ?auto_81092 ) ) ( not ( = ?auto_81087 ?auto_81092 ) ) ( not ( = ?auto_81088 ?auto_81092 ) ) ( not ( = ?auto_81089 ?auto_81092 ) ) ( not ( = ?auto_81090 ?auto_81092 ) ) ( not ( = ?auto_81091 ?auto_81092 ) ) ( ON ?auto_81090 ?auto_81091 ) ( ON-TABLE ?auto_81092 ) ( ON ?auto_81089 ?auto_81090 ) ( CLEAR ?auto_81087 ) ( ON ?auto_81088 ?auto_81089 ) ( CLEAR ?auto_81088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81092 ?auto_81091 ?auto_81090 ?auto_81089 )
      ( MAKE-6PILE ?auto_81086 ?auto_81087 ?auto_81088 ?auto_81089 ?auto_81090 ?auto_81091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81093 - BLOCK
      ?auto_81094 - BLOCK
      ?auto_81095 - BLOCK
      ?auto_81096 - BLOCK
      ?auto_81097 - BLOCK
      ?auto_81098 - BLOCK
    )
    :vars
    (
      ?auto_81099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81093 ) ( not ( = ?auto_81093 ?auto_81094 ) ) ( not ( = ?auto_81093 ?auto_81095 ) ) ( not ( = ?auto_81093 ?auto_81096 ) ) ( not ( = ?auto_81093 ?auto_81097 ) ) ( not ( = ?auto_81093 ?auto_81098 ) ) ( not ( = ?auto_81094 ?auto_81095 ) ) ( not ( = ?auto_81094 ?auto_81096 ) ) ( not ( = ?auto_81094 ?auto_81097 ) ) ( not ( = ?auto_81094 ?auto_81098 ) ) ( not ( = ?auto_81095 ?auto_81096 ) ) ( not ( = ?auto_81095 ?auto_81097 ) ) ( not ( = ?auto_81095 ?auto_81098 ) ) ( not ( = ?auto_81096 ?auto_81097 ) ) ( not ( = ?auto_81096 ?auto_81098 ) ) ( not ( = ?auto_81097 ?auto_81098 ) ) ( ON ?auto_81098 ?auto_81099 ) ( not ( = ?auto_81093 ?auto_81099 ) ) ( not ( = ?auto_81094 ?auto_81099 ) ) ( not ( = ?auto_81095 ?auto_81099 ) ) ( not ( = ?auto_81096 ?auto_81099 ) ) ( not ( = ?auto_81097 ?auto_81099 ) ) ( not ( = ?auto_81098 ?auto_81099 ) ) ( ON ?auto_81097 ?auto_81098 ) ( ON-TABLE ?auto_81099 ) ( ON ?auto_81096 ?auto_81097 ) ( ON ?auto_81095 ?auto_81096 ) ( CLEAR ?auto_81095 ) ( HOLDING ?auto_81094 ) ( CLEAR ?auto_81093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81093 ?auto_81094 )
      ( MAKE-6PILE ?auto_81093 ?auto_81094 ?auto_81095 ?auto_81096 ?auto_81097 ?auto_81098 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81100 - BLOCK
      ?auto_81101 - BLOCK
      ?auto_81102 - BLOCK
      ?auto_81103 - BLOCK
      ?auto_81104 - BLOCK
      ?auto_81105 - BLOCK
    )
    :vars
    (
      ?auto_81106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81100 ) ( not ( = ?auto_81100 ?auto_81101 ) ) ( not ( = ?auto_81100 ?auto_81102 ) ) ( not ( = ?auto_81100 ?auto_81103 ) ) ( not ( = ?auto_81100 ?auto_81104 ) ) ( not ( = ?auto_81100 ?auto_81105 ) ) ( not ( = ?auto_81101 ?auto_81102 ) ) ( not ( = ?auto_81101 ?auto_81103 ) ) ( not ( = ?auto_81101 ?auto_81104 ) ) ( not ( = ?auto_81101 ?auto_81105 ) ) ( not ( = ?auto_81102 ?auto_81103 ) ) ( not ( = ?auto_81102 ?auto_81104 ) ) ( not ( = ?auto_81102 ?auto_81105 ) ) ( not ( = ?auto_81103 ?auto_81104 ) ) ( not ( = ?auto_81103 ?auto_81105 ) ) ( not ( = ?auto_81104 ?auto_81105 ) ) ( ON ?auto_81105 ?auto_81106 ) ( not ( = ?auto_81100 ?auto_81106 ) ) ( not ( = ?auto_81101 ?auto_81106 ) ) ( not ( = ?auto_81102 ?auto_81106 ) ) ( not ( = ?auto_81103 ?auto_81106 ) ) ( not ( = ?auto_81104 ?auto_81106 ) ) ( not ( = ?auto_81105 ?auto_81106 ) ) ( ON ?auto_81104 ?auto_81105 ) ( ON-TABLE ?auto_81106 ) ( ON ?auto_81103 ?auto_81104 ) ( ON ?auto_81102 ?auto_81103 ) ( CLEAR ?auto_81100 ) ( ON ?auto_81101 ?auto_81102 ) ( CLEAR ?auto_81101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81106 ?auto_81105 ?auto_81104 ?auto_81103 ?auto_81102 )
      ( MAKE-6PILE ?auto_81100 ?auto_81101 ?auto_81102 ?auto_81103 ?auto_81104 ?auto_81105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81107 - BLOCK
      ?auto_81108 - BLOCK
      ?auto_81109 - BLOCK
      ?auto_81110 - BLOCK
      ?auto_81111 - BLOCK
      ?auto_81112 - BLOCK
    )
    :vars
    (
      ?auto_81113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81107 ?auto_81108 ) ) ( not ( = ?auto_81107 ?auto_81109 ) ) ( not ( = ?auto_81107 ?auto_81110 ) ) ( not ( = ?auto_81107 ?auto_81111 ) ) ( not ( = ?auto_81107 ?auto_81112 ) ) ( not ( = ?auto_81108 ?auto_81109 ) ) ( not ( = ?auto_81108 ?auto_81110 ) ) ( not ( = ?auto_81108 ?auto_81111 ) ) ( not ( = ?auto_81108 ?auto_81112 ) ) ( not ( = ?auto_81109 ?auto_81110 ) ) ( not ( = ?auto_81109 ?auto_81111 ) ) ( not ( = ?auto_81109 ?auto_81112 ) ) ( not ( = ?auto_81110 ?auto_81111 ) ) ( not ( = ?auto_81110 ?auto_81112 ) ) ( not ( = ?auto_81111 ?auto_81112 ) ) ( ON ?auto_81112 ?auto_81113 ) ( not ( = ?auto_81107 ?auto_81113 ) ) ( not ( = ?auto_81108 ?auto_81113 ) ) ( not ( = ?auto_81109 ?auto_81113 ) ) ( not ( = ?auto_81110 ?auto_81113 ) ) ( not ( = ?auto_81111 ?auto_81113 ) ) ( not ( = ?auto_81112 ?auto_81113 ) ) ( ON ?auto_81111 ?auto_81112 ) ( ON-TABLE ?auto_81113 ) ( ON ?auto_81110 ?auto_81111 ) ( ON ?auto_81109 ?auto_81110 ) ( ON ?auto_81108 ?auto_81109 ) ( CLEAR ?auto_81108 ) ( HOLDING ?auto_81107 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81107 )
      ( MAKE-6PILE ?auto_81107 ?auto_81108 ?auto_81109 ?auto_81110 ?auto_81111 ?auto_81112 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81114 - BLOCK
      ?auto_81115 - BLOCK
      ?auto_81116 - BLOCK
      ?auto_81117 - BLOCK
      ?auto_81118 - BLOCK
      ?auto_81119 - BLOCK
    )
    :vars
    (
      ?auto_81120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81114 ?auto_81115 ) ) ( not ( = ?auto_81114 ?auto_81116 ) ) ( not ( = ?auto_81114 ?auto_81117 ) ) ( not ( = ?auto_81114 ?auto_81118 ) ) ( not ( = ?auto_81114 ?auto_81119 ) ) ( not ( = ?auto_81115 ?auto_81116 ) ) ( not ( = ?auto_81115 ?auto_81117 ) ) ( not ( = ?auto_81115 ?auto_81118 ) ) ( not ( = ?auto_81115 ?auto_81119 ) ) ( not ( = ?auto_81116 ?auto_81117 ) ) ( not ( = ?auto_81116 ?auto_81118 ) ) ( not ( = ?auto_81116 ?auto_81119 ) ) ( not ( = ?auto_81117 ?auto_81118 ) ) ( not ( = ?auto_81117 ?auto_81119 ) ) ( not ( = ?auto_81118 ?auto_81119 ) ) ( ON ?auto_81119 ?auto_81120 ) ( not ( = ?auto_81114 ?auto_81120 ) ) ( not ( = ?auto_81115 ?auto_81120 ) ) ( not ( = ?auto_81116 ?auto_81120 ) ) ( not ( = ?auto_81117 ?auto_81120 ) ) ( not ( = ?auto_81118 ?auto_81120 ) ) ( not ( = ?auto_81119 ?auto_81120 ) ) ( ON ?auto_81118 ?auto_81119 ) ( ON-TABLE ?auto_81120 ) ( ON ?auto_81117 ?auto_81118 ) ( ON ?auto_81116 ?auto_81117 ) ( ON ?auto_81115 ?auto_81116 ) ( ON ?auto_81114 ?auto_81115 ) ( CLEAR ?auto_81114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81120 ?auto_81119 ?auto_81118 ?auto_81117 ?auto_81116 ?auto_81115 )
      ( MAKE-6PILE ?auto_81114 ?auto_81115 ?auto_81116 ?auto_81117 ?auto_81118 ?auto_81119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81121 - BLOCK
      ?auto_81122 - BLOCK
      ?auto_81123 - BLOCK
      ?auto_81124 - BLOCK
      ?auto_81125 - BLOCK
      ?auto_81126 - BLOCK
    )
    :vars
    (
      ?auto_81127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81121 ?auto_81122 ) ) ( not ( = ?auto_81121 ?auto_81123 ) ) ( not ( = ?auto_81121 ?auto_81124 ) ) ( not ( = ?auto_81121 ?auto_81125 ) ) ( not ( = ?auto_81121 ?auto_81126 ) ) ( not ( = ?auto_81122 ?auto_81123 ) ) ( not ( = ?auto_81122 ?auto_81124 ) ) ( not ( = ?auto_81122 ?auto_81125 ) ) ( not ( = ?auto_81122 ?auto_81126 ) ) ( not ( = ?auto_81123 ?auto_81124 ) ) ( not ( = ?auto_81123 ?auto_81125 ) ) ( not ( = ?auto_81123 ?auto_81126 ) ) ( not ( = ?auto_81124 ?auto_81125 ) ) ( not ( = ?auto_81124 ?auto_81126 ) ) ( not ( = ?auto_81125 ?auto_81126 ) ) ( ON ?auto_81126 ?auto_81127 ) ( not ( = ?auto_81121 ?auto_81127 ) ) ( not ( = ?auto_81122 ?auto_81127 ) ) ( not ( = ?auto_81123 ?auto_81127 ) ) ( not ( = ?auto_81124 ?auto_81127 ) ) ( not ( = ?auto_81125 ?auto_81127 ) ) ( not ( = ?auto_81126 ?auto_81127 ) ) ( ON ?auto_81125 ?auto_81126 ) ( ON-TABLE ?auto_81127 ) ( ON ?auto_81124 ?auto_81125 ) ( ON ?auto_81123 ?auto_81124 ) ( ON ?auto_81122 ?auto_81123 ) ( HOLDING ?auto_81121 ) ( CLEAR ?auto_81122 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81127 ?auto_81126 ?auto_81125 ?auto_81124 ?auto_81123 ?auto_81122 ?auto_81121 )
      ( MAKE-6PILE ?auto_81121 ?auto_81122 ?auto_81123 ?auto_81124 ?auto_81125 ?auto_81126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81128 - BLOCK
      ?auto_81129 - BLOCK
      ?auto_81130 - BLOCK
      ?auto_81131 - BLOCK
      ?auto_81132 - BLOCK
      ?auto_81133 - BLOCK
    )
    :vars
    (
      ?auto_81134 - BLOCK
      ?auto_81135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81128 ?auto_81129 ) ) ( not ( = ?auto_81128 ?auto_81130 ) ) ( not ( = ?auto_81128 ?auto_81131 ) ) ( not ( = ?auto_81128 ?auto_81132 ) ) ( not ( = ?auto_81128 ?auto_81133 ) ) ( not ( = ?auto_81129 ?auto_81130 ) ) ( not ( = ?auto_81129 ?auto_81131 ) ) ( not ( = ?auto_81129 ?auto_81132 ) ) ( not ( = ?auto_81129 ?auto_81133 ) ) ( not ( = ?auto_81130 ?auto_81131 ) ) ( not ( = ?auto_81130 ?auto_81132 ) ) ( not ( = ?auto_81130 ?auto_81133 ) ) ( not ( = ?auto_81131 ?auto_81132 ) ) ( not ( = ?auto_81131 ?auto_81133 ) ) ( not ( = ?auto_81132 ?auto_81133 ) ) ( ON ?auto_81133 ?auto_81134 ) ( not ( = ?auto_81128 ?auto_81134 ) ) ( not ( = ?auto_81129 ?auto_81134 ) ) ( not ( = ?auto_81130 ?auto_81134 ) ) ( not ( = ?auto_81131 ?auto_81134 ) ) ( not ( = ?auto_81132 ?auto_81134 ) ) ( not ( = ?auto_81133 ?auto_81134 ) ) ( ON ?auto_81132 ?auto_81133 ) ( ON-TABLE ?auto_81134 ) ( ON ?auto_81131 ?auto_81132 ) ( ON ?auto_81130 ?auto_81131 ) ( ON ?auto_81129 ?auto_81130 ) ( CLEAR ?auto_81129 ) ( ON ?auto_81128 ?auto_81135 ) ( CLEAR ?auto_81128 ) ( HAND-EMPTY ) ( not ( = ?auto_81128 ?auto_81135 ) ) ( not ( = ?auto_81129 ?auto_81135 ) ) ( not ( = ?auto_81130 ?auto_81135 ) ) ( not ( = ?auto_81131 ?auto_81135 ) ) ( not ( = ?auto_81132 ?auto_81135 ) ) ( not ( = ?auto_81133 ?auto_81135 ) ) ( not ( = ?auto_81134 ?auto_81135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81128 ?auto_81135 )
      ( MAKE-6PILE ?auto_81128 ?auto_81129 ?auto_81130 ?auto_81131 ?auto_81132 ?auto_81133 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81136 - BLOCK
      ?auto_81137 - BLOCK
      ?auto_81138 - BLOCK
      ?auto_81139 - BLOCK
      ?auto_81140 - BLOCK
      ?auto_81141 - BLOCK
    )
    :vars
    (
      ?auto_81142 - BLOCK
      ?auto_81143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81136 ?auto_81137 ) ) ( not ( = ?auto_81136 ?auto_81138 ) ) ( not ( = ?auto_81136 ?auto_81139 ) ) ( not ( = ?auto_81136 ?auto_81140 ) ) ( not ( = ?auto_81136 ?auto_81141 ) ) ( not ( = ?auto_81137 ?auto_81138 ) ) ( not ( = ?auto_81137 ?auto_81139 ) ) ( not ( = ?auto_81137 ?auto_81140 ) ) ( not ( = ?auto_81137 ?auto_81141 ) ) ( not ( = ?auto_81138 ?auto_81139 ) ) ( not ( = ?auto_81138 ?auto_81140 ) ) ( not ( = ?auto_81138 ?auto_81141 ) ) ( not ( = ?auto_81139 ?auto_81140 ) ) ( not ( = ?auto_81139 ?auto_81141 ) ) ( not ( = ?auto_81140 ?auto_81141 ) ) ( ON ?auto_81141 ?auto_81142 ) ( not ( = ?auto_81136 ?auto_81142 ) ) ( not ( = ?auto_81137 ?auto_81142 ) ) ( not ( = ?auto_81138 ?auto_81142 ) ) ( not ( = ?auto_81139 ?auto_81142 ) ) ( not ( = ?auto_81140 ?auto_81142 ) ) ( not ( = ?auto_81141 ?auto_81142 ) ) ( ON ?auto_81140 ?auto_81141 ) ( ON-TABLE ?auto_81142 ) ( ON ?auto_81139 ?auto_81140 ) ( ON ?auto_81138 ?auto_81139 ) ( ON ?auto_81136 ?auto_81143 ) ( CLEAR ?auto_81136 ) ( not ( = ?auto_81136 ?auto_81143 ) ) ( not ( = ?auto_81137 ?auto_81143 ) ) ( not ( = ?auto_81138 ?auto_81143 ) ) ( not ( = ?auto_81139 ?auto_81143 ) ) ( not ( = ?auto_81140 ?auto_81143 ) ) ( not ( = ?auto_81141 ?auto_81143 ) ) ( not ( = ?auto_81142 ?auto_81143 ) ) ( HOLDING ?auto_81137 ) ( CLEAR ?auto_81138 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81142 ?auto_81141 ?auto_81140 ?auto_81139 ?auto_81138 ?auto_81137 )
      ( MAKE-6PILE ?auto_81136 ?auto_81137 ?auto_81138 ?auto_81139 ?auto_81140 ?auto_81141 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81144 - BLOCK
      ?auto_81145 - BLOCK
      ?auto_81146 - BLOCK
      ?auto_81147 - BLOCK
      ?auto_81148 - BLOCK
      ?auto_81149 - BLOCK
    )
    :vars
    (
      ?auto_81151 - BLOCK
      ?auto_81150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81144 ?auto_81145 ) ) ( not ( = ?auto_81144 ?auto_81146 ) ) ( not ( = ?auto_81144 ?auto_81147 ) ) ( not ( = ?auto_81144 ?auto_81148 ) ) ( not ( = ?auto_81144 ?auto_81149 ) ) ( not ( = ?auto_81145 ?auto_81146 ) ) ( not ( = ?auto_81145 ?auto_81147 ) ) ( not ( = ?auto_81145 ?auto_81148 ) ) ( not ( = ?auto_81145 ?auto_81149 ) ) ( not ( = ?auto_81146 ?auto_81147 ) ) ( not ( = ?auto_81146 ?auto_81148 ) ) ( not ( = ?auto_81146 ?auto_81149 ) ) ( not ( = ?auto_81147 ?auto_81148 ) ) ( not ( = ?auto_81147 ?auto_81149 ) ) ( not ( = ?auto_81148 ?auto_81149 ) ) ( ON ?auto_81149 ?auto_81151 ) ( not ( = ?auto_81144 ?auto_81151 ) ) ( not ( = ?auto_81145 ?auto_81151 ) ) ( not ( = ?auto_81146 ?auto_81151 ) ) ( not ( = ?auto_81147 ?auto_81151 ) ) ( not ( = ?auto_81148 ?auto_81151 ) ) ( not ( = ?auto_81149 ?auto_81151 ) ) ( ON ?auto_81148 ?auto_81149 ) ( ON-TABLE ?auto_81151 ) ( ON ?auto_81147 ?auto_81148 ) ( ON ?auto_81146 ?auto_81147 ) ( ON ?auto_81144 ?auto_81150 ) ( not ( = ?auto_81144 ?auto_81150 ) ) ( not ( = ?auto_81145 ?auto_81150 ) ) ( not ( = ?auto_81146 ?auto_81150 ) ) ( not ( = ?auto_81147 ?auto_81150 ) ) ( not ( = ?auto_81148 ?auto_81150 ) ) ( not ( = ?auto_81149 ?auto_81150 ) ) ( not ( = ?auto_81151 ?auto_81150 ) ) ( CLEAR ?auto_81146 ) ( ON ?auto_81145 ?auto_81144 ) ( CLEAR ?auto_81145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81150 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81150 ?auto_81144 )
      ( MAKE-6PILE ?auto_81144 ?auto_81145 ?auto_81146 ?auto_81147 ?auto_81148 ?auto_81149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81152 - BLOCK
      ?auto_81153 - BLOCK
      ?auto_81154 - BLOCK
      ?auto_81155 - BLOCK
      ?auto_81156 - BLOCK
      ?auto_81157 - BLOCK
    )
    :vars
    (
      ?auto_81159 - BLOCK
      ?auto_81158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81152 ?auto_81153 ) ) ( not ( = ?auto_81152 ?auto_81154 ) ) ( not ( = ?auto_81152 ?auto_81155 ) ) ( not ( = ?auto_81152 ?auto_81156 ) ) ( not ( = ?auto_81152 ?auto_81157 ) ) ( not ( = ?auto_81153 ?auto_81154 ) ) ( not ( = ?auto_81153 ?auto_81155 ) ) ( not ( = ?auto_81153 ?auto_81156 ) ) ( not ( = ?auto_81153 ?auto_81157 ) ) ( not ( = ?auto_81154 ?auto_81155 ) ) ( not ( = ?auto_81154 ?auto_81156 ) ) ( not ( = ?auto_81154 ?auto_81157 ) ) ( not ( = ?auto_81155 ?auto_81156 ) ) ( not ( = ?auto_81155 ?auto_81157 ) ) ( not ( = ?auto_81156 ?auto_81157 ) ) ( ON ?auto_81157 ?auto_81159 ) ( not ( = ?auto_81152 ?auto_81159 ) ) ( not ( = ?auto_81153 ?auto_81159 ) ) ( not ( = ?auto_81154 ?auto_81159 ) ) ( not ( = ?auto_81155 ?auto_81159 ) ) ( not ( = ?auto_81156 ?auto_81159 ) ) ( not ( = ?auto_81157 ?auto_81159 ) ) ( ON ?auto_81156 ?auto_81157 ) ( ON-TABLE ?auto_81159 ) ( ON ?auto_81155 ?auto_81156 ) ( ON ?auto_81152 ?auto_81158 ) ( not ( = ?auto_81152 ?auto_81158 ) ) ( not ( = ?auto_81153 ?auto_81158 ) ) ( not ( = ?auto_81154 ?auto_81158 ) ) ( not ( = ?auto_81155 ?auto_81158 ) ) ( not ( = ?auto_81156 ?auto_81158 ) ) ( not ( = ?auto_81157 ?auto_81158 ) ) ( not ( = ?auto_81159 ?auto_81158 ) ) ( ON ?auto_81153 ?auto_81152 ) ( CLEAR ?auto_81153 ) ( ON-TABLE ?auto_81158 ) ( HOLDING ?auto_81154 ) ( CLEAR ?auto_81155 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81159 ?auto_81157 ?auto_81156 ?auto_81155 ?auto_81154 )
      ( MAKE-6PILE ?auto_81152 ?auto_81153 ?auto_81154 ?auto_81155 ?auto_81156 ?auto_81157 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81160 - BLOCK
      ?auto_81161 - BLOCK
      ?auto_81162 - BLOCK
      ?auto_81163 - BLOCK
      ?auto_81164 - BLOCK
      ?auto_81165 - BLOCK
    )
    :vars
    (
      ?auto_81167 - BLOCK
      ?auto_81166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81160 ?auto_81161 ) ) ( not ( = ?auto_81160 ?auto_81162 ) ) ( not ( = ?auto_81160 ?auto_81163 ) ) ( not ( = ?auto_81160 ?auto_81164 ) ) ( not ( = ?auto_81160 ?auto_81165 ) ) ( not ( = ?auto_81161 ?auto_81162 ) ) ( not ( = ?auto_81161 ?auto_81163 ) ) ( not ( = ?auto_81161 ?auto_81164 ) ) ( not ( = ?auto_81161 ?auto_81165 ) ) ( not ( = ?auto_81162 ?auto_81163 ) ) ( not ( = ?auto_81162 ?auto_81164 ) ) ( not ( = ?auto_81162 ?auto_81165 ) ) ( not ( = ?auto_81163 ?auto_81164 ) ) ( not ( = ?auto_81163 ?auto_81165 ) ) ( not ( = ?auto_81164 ?auto_81165 ) ) ( ON ?auto_81165 ?auto_81167 ) ( not ( = ?auto_81160 ?auto_81167 ) ) ( not ( = ?auto_81161 ?auto_81167 ) ) ( not ( = ?auto_81162 ?auto_81167 ) ) ( not ( = ?auto_81163 ?auto_81167 ) ) ( not ( = ?auto_81164 ?auto_81167 ) ) ( not ( = ?auto_81165 ?auto_81167 ) ) ( ON ?auto_81164 ?auto_81165 ) ( ON-TABLE ?auto_81167 ) ( ON ?auto_81163 ?auto_81164 ) ( ON ?auto_81160 ?auto_81166 ) ( not ( = ?auto_81160 ?auto_81166 ) ) ( not ( = ?auto_81161 ?auto_81166 ) ) ( not ( = ?auto_81162 ?auto_81166 ) ) ( not ( = ?auto_81163 ?auto_81166 ) ) ( not ( = ?auto_81164 ?auto_81166 ) ) ( not ( = ?auto_81165 ?auto_81166 ) ) ( not ( = ?auto_81167 ?auto_81166 ) ) ( ON ?auto_81161 ?auto_81160 ) ( ON-TABLE ?auto_81166 ) ( CLEAR ?auto_81163 ) ( ON ?auto_81162 ?auto_81161 ) ( CLEAR ?auto_81162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81166 ?auto_81160 ?auto_81161 )
      ( MAKE-6PILE ?auto_81160 ?auto_81161 ?auto_81162 ?auto_81163 ?auto_81164 ?auto_81165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81168 - BLOCK
      ?auto_81169 - BLOCK
      ?auto_81170 - BLOCK
      ?auto_81171 - BLOCK
      ?auto_81172 - BLOCK
      ?auto_81173 - BLOCK
    )
    :vars
    (
      ?auto_81174 - BLOCK
      ?auto_81175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81168 ?auto_81169 ) ) ( not ( = ?auto_81168 ?auto_81170 ) ) ( not ( = ?auto_81168 ?auto_81171 ) ) ( not ( = ?auto_81168 ?auto_81172 ) ) ( not ( = ?auto_81168 ?auto_81173 ) ) ( not ( = ?auto_81169 ?auto_81170 ) ) ( not ( = ?auto_81169 ?auto_81171 ) ) ( not ( = ?auto_81169 ?auto_81172 ) ) ( not ( = ?auto_81169 ?auto_81173 ) ) ( not ( = ?auto_81170 ?auto_81171 ) ) ( not ( = ?auto_81170 ?auto_81172 ) ) ( not ( = ?auto_81170 ?auto_81173 ) ) ( not ( = ?auto_81171 ?auto_81172 ) ) ( not ( = ?auto_81171 ?auto_81173 ) ) ( not ( = ?auto_81172 ?auto_81173 ) ) ( ON ?auto_81173 ?auto_81174 ) ( not ( = ?auto_81168 ?auto_81174 ) ) ( not ( = ?auto_81169 ?auto_81174 ) ) ( not ( = ?auto_81170 ?auto_81174 ) ) ( not ( = ?auto_81171 ?auto_81174 ) ) ( not ( = ?auto_81172 ?auto_81174 ) ) ( not ( = ?auto_81173 ?auto_81174 ) ) ( ON ?auto_81172 ?auto_81173 ) ( ON-TABLE ?auto_81174 ) ( ON ?auto_81168 ?auto_81175 ) ( not ( = ?auto_81168 ?auto_81175 ) ) ( not ( = ?auto_81169 ?auto_81175 ) ) ( not ( = ?auto_81170 ?auto_81175 ) ) ( not ( = ?auto_81171 ?auto_81175 ) ) ( not ( = ?auto_81172 ?auto_81175 ) ) ( not ( = ?auto_81173 ?auto_81175 ) ) ( not ( = ?auto_81174 ?auto_81175 ) ) ( ON ?auto_81169 ?auto_81168 ) ( ON-TABLE ?auto_81175 ) ( ON ?auto_81170 ?auto_81169 ) ( CLEAR ?auto_81170 ) ( HOLDING ?auto_81171 ) ( CLEAR ?auto_81172 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81174 ?auto_81173 ?auto_81172 ?auto_81171 )
      ( MAKE-6PILE ?auto_81168 ?auto_81169 ?auto_81170 ?auto_81171 ?auto_81172 ?auto_81173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81176 - BLOCK
      ?auto_81177 - BLOCK
      ?auto_81178 - BLOCK
      ?auto_81179 - BLOCK
      ?auto_81180 - BLOCK
      ?auto_81181 - BLOCK
    )
    :vars
    (
      ?auto_81183 - BLOCK
      ?auto_81182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81176 ?auto_81177 ) ) ( not ( = ?auto_81176 ?auto_81178 ) ) ( not ( = ?auto_81176 ?auto_81179 ) ) ( not ( = ?auto_81176 ?auto_81180 ) ) ( not ( = ?auto_81176 ?auto_81181 ) ) ( not ( = ?auto_81177 ?auto_81178 ) ) ( not ( = ?auto_81177 ?auto_81179 ) ) ( not ( = ?auto_81177 ?auto_81180 ) ) ( not ( = ?auto_81177 ?auto_81181 ) ) ( not ( = ?auto_81178 ?auto_81179 ) ) ( not ( = ?auto_81178 ?auto_81180 ) ) ( not ( = ?auto_81178 ?auto_81181 ) ) ( not ( = ?auto_81179 ?auto_81180 ) ) ( not ( = ?auto_81179 ?auto_81181 ) ) ( not ( = ?auto_81180 ?auto_81181 ) ) ( ON ?auto_81181 ?auto_81183 ) ( not ( = ?auto_81176 ?auto_81183 ) ) ( not ( = ?auto_81177 ?auto_81183 ) ) ( not ( = ?auto_81178 ?auto_81183 ) ) ( not ( = ?auto_81179 ?auto_81183 ) ) ( not ( = ?auto_81180 ?auto_81183 ) ) ( not ( = ?auto_81181 ?auto_81183 ) ) ( ON ?auto_81180 ?auto_81181 ) ( ON-TABLE ?auto_81183 ) ( ON ?auto_81176 ?auto_81182 ) ( not ( = ?auto_81176 ?auto_81182 ) ) ( not ( = ?auto_81177 ?auto_81182 ) ) ( not ( = ?auto_81178 ?auto_81182 ) ) ( not ( = ?auto_81179 ?auto_81182 ) ) ( not ( = ?auto_81180 ?auto_81182 ) ) ( not ( = ?auto_81181 ?auto_81182 ) ) ( not ( = ?auto_81183 ?auto_81182 ) ) ( ON ?auto_81177 ?auto_81176 ) ( ON-TABLE ?auto_81182 ) ( ON ?auto_81178 ?auto_81177 ) ( CLEAR ?auto_81180 ) ( ON ?auto_81179 ?auto_81178 ) ( CLEAR ?auto_81179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81182 ?auto_81176 ?auto_81177 ?auto_81178 )
      ( MAKE-6PILE ?auto_81176 ?auto_81177 ?auto_81178 ?auto_81179 ?auto_81180 ?auto_81181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81184 - BLOCK
      ?auto_81185 - BLOCK
      ?auto_81186 - BLOCK
      ?auto_81187 - BLOCK
      ?auto_81188 - BLOCK
      ?auto_81189 - BLOCK
    )
    :vars
    (
      ?auto_81191 - BLOCK
      ?auto_81190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81184 ?auto_81185 ) ) ( not ( = ?auto_81184 ?auto_81186 ) ) ( not ( = ?auto_81184 ?auto_81187 ) ) ( not ( = ?auto_81184 ?auto_81188 ) ) ( not ( = ?auto_81184 ?auto_81189 ) ) ( not ( = ?auto_81185 ?auto_81186 ) ) ( not ( = ?auto_81185 ?auto_81187 ) ) ( not ( = ?auto_81185 ?auto_81188 ) ) ( not ( = ?auto_81185 ?auto_81189 ) ) ( not ( = ?auto_81186 ?auto_81187 ) ) ( not ( = ?auto_81186 ?auto_81188 ) ) ( not ( = ?auto_81186 ?auto_81189 ) ) ( not ( = ?auto_81187 ?auto_81188 ) ) ( not ( = ?auto_81187 ?auto_81189 ) ) ( not ( = ?auto_81188 ?auto_81189 ) ) ( ON ?auto_81189 ?auto_81191 ) ( not ( = ?auto_81184 ?auto_81191 ) ) ( not ( = ?auto_81185 ?auto_81191 ) ) ( not ( = ?auto_81186 ?auto_81191 ) ) ( not ( = ?auto_81187 ?auto_81191 ) ) ( not ( = ?auto_81188 ?auto_81191 ) ) ( not ( = ?auto_81189 ?auto_81191 ) ) ( ON-TABLE ?auto_81191 ) ( ON ?auto_81184 ?auto_81190 ) ( not ( = ?auto_81184 ?auto_81190 ) ) ( not ( = ?auto_81185 ?auto_81190 ) ) ( not ( = ?auto_81186 ?auto_81190 ) ) ( not ( = ?auto_81187 ?auto_81190 ) ) ( not ( = ?auto_81188 ?auto_81190 ) ) ( not ( = ?auto_81189 ?auto_81190 ) ) ( not ( = ?auto_81191 ?auto_81190 ) ) ( ON ?auto_81185 ?auto_81184 ) ( ON-TABLE ?auto_81190 ) ( ON ?auto_81186 ?auto_81185 ) ( ON ?auto_81187 ?auto_81186 ) ( CLEAR ?auto_81187 ) ( HOLDING ?auto_81188 ) ( CLEAR ?auto_81189 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81191 ?auto_81189 ?auto_81188 )
      ( MAKE-6PILE ?auto_81184 ?auto_81185 ?auto_81186 ?auto_81187 ?auto_81188 ?auto_81189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81192 - BLOCK
      ?auto_81193 - BLOCK
      ?auto_81194 - BLOCK
      ?auto_81195 - BLOCK
      ?auto_81196 - BLOCK
      ?auto_81197 - BLOCK
    )
    :vars
    (
      ?auto_81198 - BLOCK
      ?auto_81199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81192 ?auto_81193 ) ) ( not ( = ?auto_81192 ?auto_81194 ) ) ( not ( = ?auto_81192 ?auto_81195 ) ) ( not ( = ?auto_81192 ?auto_81196 ) ) ( not ( = ?auto_81192 ?auto_81197 ) ) ( not ( = ?auto_81193 ?auto_81194 ) ) ( not ( = ?auto_81193 ?auto_81195 ) ) ( not ( = ?auto_81193 ?auto_81196 ) ) ( not ( = ?auto_81193 ?auto_81197 ) ) ( not ( = ?auto_81194 ?auto_81195 ) ) ( not ( = ?auto_81194 ?auto_81196 ) ) ( not ( = ?auto_81194 ?auto_81197 ) ) ( not ( = ?auto_81195 ?auto_81196 ) ) ( not ( = ?auto_81195 ?auto_81197 ) ) ( not ( = ?auto_81196 ?auto_81197 ) ) ( ON ?auto_81197 ?auto_81198 ) ( not ( = ?auto_81192 ?auto_81198 ) ) ( not ( = ?auto_81193 ?auto_81198 ) ) ( not ( = ?auto_81194 ?auto_81198 ) ) ( not ( = ?auto_81195 ?auto_81198 ) ) ( not ( = ?auto_81196 ?auto_81198 ) ) ( not ( = ?auto_81197 ?auto_81198 ) ) ( ON-TABLE ?auto_81198 ) ( ON ?auto_81192 ?auto_81199 ) ( not ( = ?auto_81192 ?auto_81199 ) ) ( not ( = ?auto_81193 ?auto_81199 ) ) ( not ( = ?auto_81194 ?auto_81199 ) ) ( not ( = ?auto_81195 ?auto_81199 ) ) ( not ( = ?auto_81196 ?auto_81199 ) ) ( not ( = ?auto_81197 ?auto_81199 ) ) ( not ( = ?auto_81198 ?auto_81199 ) ) ( ON ?auto_81193 ?auto_81192 ) ( ON-TABLE ?auto_81199 ) ( ON ?auto_81194 ?auto_81193 ) ( ON ?auto_81195 ?auto_81194 ) ( CLEAR ?auto_81197 ) ( ON ?auto_81196 ?auto_81195 ) ( CLEAR ?auto_81196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81199 ?auto_81192 ?auto_81193 ?auto_81194 ?auto_81195 )
      ( MAKE-6PILE ?auto_81192 ?auto_81193 ?auto_81194 ?auto_81195 ?auto_81196 ?auto_81197 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81200 - BLOCK
      ?auto_81201 - BLOCK
      ?auto_81202 - BLOCK
      ?auto_81203 - BLOCK
      ?auto_81204 - BLOCK
      ?auto_81205 - BLOCK
    )
    :vars
    (
      ?auto_81206 - BLOCK
      ?auto_81207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81200 ?auto_81201 ) ) ( not ( = ?auto_81200 ?auto_81202 ) ) ( not ( = ?auto_81200 ?auto_81203 ) ) ( not ( = ?auto_81200 ?auto_81204 ) ) ( not ( = ?auto_81200 ?auto_81205 ) ) ( not ( = ?auto_81201 ?auto_81202 ) ) ( not ( = ?auto_81201 ?auto_81203 ) ) ( not ( = ?auto_81201 ?auto_81204 ) ) ( not ( = ?auto_81201 ?auto_81205 ) ) ( not ( = ?auto_81202 ?auto_81203 ) ) ( not ( = ?auto_81202 ?auto_81204 ) ) ( not ( = ?auto_81202 ?auto_81205 ) ) ( not ( = ?auto_81203 ?auto_81204 ) ) ( not ( = ?auto_81203 ?auto_81205 ) ) ( not ( = ?auto_81204 ?auto_81205 ) ) ( not ( = ?auto_81200 ?auto_81206 ) ) ( not ( = ?auto_81201 ?auto_81206 ) ) ( not ( = ?auto_81202 ?auto_81206 ) ) ( not ( = ?auto_81203 ?auto_81206 ) ) ( not ( = ?auto_81204 ?auto_81206 ) ) ( not ( = ?auto_81205 ?auto_81206 ) ) ( ON-TABLE ?auto_81206 ) ( ON ?auto_81200 ?auto_81207 ) ( not ( = ?auto_81200 ?auto_81207 ) ) ( not ( = ?auto_81201 ?auto_81207 ) ) ( not ( = ?auto_81202 ?auto_81207 ) ) ( not ( = ?auto_81203 ?auto_81207 ) ) ( not ( = ?auto_81204 ?auto_81207 ) ) ( not ( = ?auto_81205 ?auto_81207 ) ) ( not ( = ?auto_81206 ?auto_81207 ) ) ( ON ?auto_81201 ?auto_81200 ) ( ON-TABLE ?auto_81207 ) ( ON ?auto_81202 ?auto_81201 ) ( ON ?auto_81203 ?auto_81202 ) ( ON ?auto_81204 ?auto_81203 ) ( CLEAR ?auto_81204 ) ( HOLDING ?auto_81205 ) ( CLEAR ?auto_81206 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81206 ?auto_81205 )
      ( MAKE-6PILE ?auto_81200 ?auto_81201 ?auto_81202 ?auto_81203 ?auto_81204 ?auto_81205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81208 - BLOCK
      ?auto_81209 - BLOCK
      ?auto_81210 - BLOCK
      ?auto_81211 - BLOCK
      ?auto_81212 - BLOCK
      ?auto_81213 - BLOCK
    )
    :vars
    (
      ?auto_81214 - BLOCK
      ?auto_81215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81208 ?auto_81209 ) ) ( not ( = ?auto_81208 ?auto_81210 ) ) ( not ( = ?auto_81208 ?auto_81211 ) ) ( not ( = ?auto_81208 ?auto_81212 ) ) ( not ( = ?auto_81208 ?auto_81213 ) ) ( not ( = ?auto_81209 ?auto_81210 ) ) ( not ( = ?auto_81209 ?auto_81211 ) ) ( not ( = ?auto_81209 ?auto_81212 ) ) ( not ( = ?auto_81209 ?auto_81213 ) ) ( not ( = ?auto_81210 ?auto_81211 ) ) ( not ( = ?auto_81210 ?auto_81212 ) ) ( not ( = ?auto_81210 ?auto_81213 ) ) ( not ( = ?auto_81211 ?auto_81212 ) ) ( not ( = ?auto_81211 ?auto_81213 ) ) ( not ( = ?auto_81212 ?auto_81213 ) ) ( not ( = ?auto_81208 ?auto_81214 ) ) ( not ( = ?auto_81209 ?auto_81214 ) ) ( not ( = ?auto_81210 ?auto_81214 ) ) ( not ( = ?auto_81211 ?auto_81214 ) ) ( not ( = ?auto_81212 ?auto_81214 ) ) ( not ( = ?auto_81213 ?auto_81214 ) ) ( ON-TABLE ?auto_81214 ) ( ON ?auto_81208 ?auto_81215 ) ( not ( = ?auto_81208 ?auto_81215 ) ) ( not ( = ?auto_81209 ?auto_81215 ) ) ( not ( = ?auto_81210 ?auto_81215 ) ) ( not ( = ?auto_81211 ?auto_81215 ) ) ( not ( = ?auto_81212 ?auto_81215 ) ) ( not ( = ?auto_81213 ?auto_81215 ) ) ( not ( = ?auto_81214 ?auto_81215 ) ) ( ON ?auto_81209 ?auto_81208 ) ( ON-TABLE ?auto_81215 ) ( ON ?auto_81210 ?auto_81209 ) ( ON ?auto_81211 ?auto_81210 ) ( ON ?auto_81212 ?auto_81211 ) ( CLEAR ?auto_81214 ) ( ON ?auto_81213 ?auto_81212 ) ( CLEAR ?auto_81213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81215 ?auto_81208 ?auto_81209 ?auto_81210 ?auto_81211 ?auto_81212 )
      ( MAKE-6PILE ?auto_81208 ?auto_81209 ?auto_81210 ?auto_81211 ?auto_81212 ?auto_81213 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81216 - BLOCK
      ?auto_81217 - BLOCK
      ?auto_81218 - BLOCK
      ?auto_81219 - BLOCK
      ?auto_81220 - BLOCK
      ?auto_81221 - BLOCK
    )
    :vars
    (
      ?auto_81223 - BLOCK
      ?auto_81222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81216 ?auto_81217 ) ) ( not ( = ?auto_81216 ?auto_81218 ) ) ( not ( = ?auto_81216 ?auto_81219 ) ) ( not ( = ?auto_81216 ?auto_81220 ) ) ( not ( = ?auto_81216 ?auto_81221 ) ) ( not ( = ?auto_81217 ?auto_81218 ) ) ( not ( = ?auto_81217 ?auto_81219 ) ) ( not ( = ?auto_81217 ?auto_81220 ) ) ( not ( = ?auto_81217 ?auto_81221 ) ) ( not ( = ?auto_81218 ?auto_81219 ) ) ( not ( = ?auto_81218 ?auto_81220 ) ) ( not ( = ?auto_81218 ?auto_81221 ) ) ( not ( = ?auto_81219 ?auto_81220 ) ) ( not ( = ?auto_81219 ?auto_81221 ) ) ( not ( = ?auto_81220 ?auto_81221 ) ) ( not ( = ?auto_81216 ?auto_81223 ) ) ( not ( = ?auto_81217 ?auto_81223 ) ) ( not ( = ?auto_81218 ?auto_81223 ) ) ( not ( = ?auto_81219 ?auto_81223 ) ) ( not ( = ?auto_81220 ?auto_81223 ) ) ( not ( = ?auto_81221 ?auto_81223 ) ) ( ON ?auto_81216 ?auto_81222 ) ( not ( = ?auto_81216 ?auto_81222 ) ) ( not ( = ?auto_81217 ?auto_81222 ) ) ( not ( = ?auto_81218 ?auto_81222 ) ) ( not ( = ?auto_81219 ?auto_81222 ) ) ( not ( = ?auto_81220 ?auto_81222 ) ) ( not ( = ?auto_81221 ?auto_81222 ) ) ( not ( = ?auto_81223 ?auto_81222 ) ) ( ON ?auto_81217 ?auto_81216 ) ( ON-TABLE ?auto_81222 ) ( ON ?auto_81218 ?auto_81217 ) ( ON ?auto_81219 ?auto_81218 ) ( ON ?auto_81220 ?auto_81219 ) ( ON ?auto_81221 ?auto_81220 ) ( CLEAR ?auto_81221 ) ( HOLDING ?auto_81223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81223 )
      ( MAKE-6PILE ?auto_81216 ?auto_81217 ?auto_81218 ?auto_81219 ?auto_81220 ?auto_81221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81224 - BLOCK
      ?auto_81225 - BLOCK
      ?auto_81226 - BLOCK
      ?auto_81227 - BLOCK
      ?auto_81228 - BLOCK
      ?auto_81229 - BLOCK
    )
    :vars
    (
      ?auto_81231 - BLOCK
      ?auto_81230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81224 ?auto_81225 ) ) ( not ( = ?auto_81224 ?auto_81226 ) ) ( not ( = ?auto_81224 ?auto_81227 ) ) ( not ( = ?auto_81224 ?auto_81228 ) ) ( not ( = ?auto_81224 ?auto_81229 ) ) ( not ( = ?auto_81225 ?auto_81226 ) ) ( not ( = ?auto_81225 ?auto_81227 ) ) ( not ( = ?auto_81225 ?auto_81228 ) ) ( not ( = ?auto_81225 ?auto_81229 ) ) ( not ( = ?auto_81226 ?auto_81227 ) ) ( not ( = ?auto_81226 ?auto_81228 ) ) ( not ( = ?auto_81226 ?auto_81229 ) ) ( not ( = ?auto_81227 ?auto_81228 ) ) ( not ( = ?auto_81227 ?auto_81229 ) ) ( not ( = ?auto_81228 ?auto_81229 ) ) ( not ( = ?auto_81224 ?auto_81231 ) ) ( not ( = ?auto_81225 ?auto_81231 ) ) ( not ( = ?auto_81226 ?auto_81231 ) ) ( not ( = ?auto_81227 ?auto_81231 ) ) ( not ( = ?auto_81228 ?auto_81231 ) ) ( not ( = ?auto_81229 ?auto_81231 ) ) ( ON ?auto_81224 ?auto_81230 ) ( not ( = ?auto_81224 ?auto_81230 ) ) ( not ( = ?auto_81225 ?auto_81230 ) ) ( not ( = ?auto_81226 ?auto_81230 ) ) ( not ( = ?auto_81227 ?auto_81230 ) ) ( not ( = ?auto_81228 ?auto_81230 ) ) ( not ( = ?auto_81229 ?auto_81230 ) ) ( not ( = ?auto_81231 ?auto_81230 ) ) ( ON ?auto_81225 ?auto_81224 ) ( ON-TABLE ?auto_81230 ) ( ON ?auto_81226 ?auto_81225 ) ( ON ?auto_81227 ?auto_81226 ) ( ON ?auto_81228 ?auto_81227 ) ( ON ?auto_81229 ?auto_81228 ) ( ON ?auto_81231 ?auto_81229 ) ( CLEAR ?auto_81231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81230 ?auto_81224 ?auto_81225 ?auto_81226 ?auto_81227 ?auto_81228 ?auto_81229 )
      ( MAKE-6PILE ?auto_81224 ?auto_81225 ?auto_81226 ?auto_81227 ?auto_81228 ?auto_81229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81239 - BLOCK
      ?auto_81240 - BLOCK
      ?auto_81241 - BLOCK
      ?auto_81242 - BLOCK
      ?auto_81243 - BLOCK
      ?auto_81244 - BLOCK
      ?auto_81245 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81245 ) ( CLEAR ?auto_81244 ) ( ON-TABLE ?auto_81239 ) ( ON ?auto_81240 ?auto_81239 ) ( ON ?auto_81241 ?auto_81240 ) ( ON ?auto_81242 ?auto_81241 ) ( ON ?auto_81243 ?auto_81242 ) ( ON ?auto_81244 ?auto_81243 ) ( not ( = ?auto_81239 ?auto_81240 ) ) ( not ( = ?auto_81239 ?auto_81241 ) ) ( not ( = ?auto_81239 ?auto_81242 ) ) ( not ( = ?auto_81239 ?auto_81243 ) ) ( not ( = ?auto_81239 ?auto_81244 ) ) ( not ( = ?auto_81239 ?auto_81245 ) ) ( not ( = ?auto_81240 ?auto_81241 ) ) ( not ( = ?auto_81240 ?auto_81242 ) ) ( not ( = ?auto_81240 ?auto_81243 ) ) ( not ( = ?auto_81240 ?auto_81244 ) ) ( not ( = ?auto_81240 ?auto_81245 ) ) ( not ( = ?auto_81241 ?auto_81242 ) ) ( not ( = ?auto_81241 ?auto_81243 ) ) ( not ( = ?auto_81241 ?auto_81244 ) ) ( not ( = ?auto_81241 ?auto_81245 ) ) ( not ( = ?auto_81242 ?auto_81243 ) ) ( not ( = ?auto_81242 ?auto_81244 ) ) ( not ( = ?auto_81242 ?auto_81245 ) ) ( not ( = ?auto_81243 ?auto_81244 ) ) ( not ( = ?auto_81243 ?auto_81245 ) ) ( not ( = ?auto_81244 ?auto_81245 ) ) )
    :subtasks
    ( ( !STACK ?auto_81245 ?auto_81244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81246 - BLOCK
      ?auto_81247 - BLOCK
      ?auto_81248 - BLOCK
      ?auto_81249 - BLOCK
      ?auto_81250 - BLOCK
      ?auto_81251 - BLOCK
      ?auto_81252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81251 ) ( ON-TABLE ?auto_81246 ) ( ON ?auto_81247 ?auto_81246 ) ( ON ?auto_81248 ?auto_81247 ) ( ON ?auto_81249 ?auto_81248 ) ( ON ?auto_81250 ?auto_81249 ) ( ON ?auto_81251 ?auto_81250 ) ( not ( = ?auto_81246 ?auto_81247 ) ) ( not ( = ?auto_81246 ?auto_81248 ) ) ( not ( = ?auto_81246 ?auto_81249 ) ) ( not ( = ?auto_81246 ?auto_81250 ) ) ( not ( = ?auto_81246 ?auto_81251 ) ) ( not ( = ?auto_81246 ?auto_81252 ) ) ( not ( = ?auto_81247 ?auto_81248 ) ) ( not ( = ?auto_81247 ?auto_81249 ) ) ( not ( = ?auto_81247 ?auto_81250 ) ) ( not ( = ?auto_81247 ?auto_81251 ) ) ( not ( = ?auto_81247 ?auto_81252 ) ) ( not ( = ?auto_81248 ?auto_81249 ) ) ( not ( = ?auto_81248 ?auto_81250 ) ) ( not ( = ?auto_81248 ?auto_81251 ) ) ( not ( = ?auto_81248 ?auto_81252 ) ) ( not ( = ?auto_81249 ?auto_81250 ) ) ( not ( = ?auto_81249 ?auto_81251 ) ) ( not ( = ?auto_81249 ?auto_81252 ) ) ( not ( = ?auto_81250 ?auto_81251 ) ) ( not ( = ?auto_81250 ?auto_81252 ) ) ( not ( = ?auto_81251 ?auto_81252 ) ) ( ON-TABLE ?auto_81252 ) ( CLEAR ?auto_81252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_81252 )
      ( MAKE-7PILE ?auto_81246 ?auto_81247 ?auto_81248 ?auto_81249 ?auto_81250 ?auto_81251 ?auto_81252 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81253 - BLOCK
      ?auto_81254 - BLOCK
      ?auto_81255 - BLOCK
      ?auto_81256 - BLOCK
      ?auto_81257 - BLOCK
      ?auto_81258 - BLOCK
      ?auto_81259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81253 ) ( ON ?auto_81254 ?auto_81253 ) ( ON ?auto_81255 ?auto_81254 ) ( ON ?auto_81256 ?auto_81255 ) ( ON ?auto_81257 ?auto_81256 ) ( not ( = ?auto_81253 ?auto_81254 ) ) ( not ( = ?auto_81253 ?auto_81255 ) ) ( not ( = ?auto_81253 ?auto_81256 ) ) ( not ( = ?auto_81253 ?auto_81257 ) ) ( not ( = ?auto_81253 ?auto_81258 ) ) ( not ( = ?auto_81253 ?auto_81259 ) ) ( not ( = ?auto_81254 ?auto_81255 ) ) ( not ( = ?auto_81254 ?auto_81256 ) ) ( not ( = ?auto_81254 ?auto_81257 ) ) ( not ( = ?auto_81254 ?auto_81258 ) ) ( not ( = ?auto_81254 ?auto_81259 ) ) ( not ( = ?auto_81255 ?auto_81256 ) ) ( not ( = ?auto_81255 ?auto_81257 ) ) ( not ( = ?auto_81255 ?auto_81258 ) ) ( not ( = ?auto_81255 ?auto_81259 ) ) ( not ( = ?auto_81256 ?auto_81257 ) ) ( not ( = ?auto_81256 ?auto_81258 ) ) ( not ( = ?auto_81256 ?auto_81259 ) ) ( not ( = ?auto_81257 ?auto_81258 ) ) ( not ( = ?auto_81257 ?auto_81259 ) ) ( not ( = ?auto_81258 ?auto_81259 ) ) ( ON-TABLE ?auto_81259 ) ( CLEAR ?auto_81259 ) ( HOLDING ?auto_81258 ) ( CLEAR ?auto_81257 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81253 ?auto_81254 ?auto_81255 ?auto_81256 ?auto_81257 ?auto_81258 )
      ( MAKE-7PILE ?auto_81253 ?auto_81254 ?auto_81255 ?auto_81256 ?auto_81257 ?auto_81258 ?auto_81259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81260 - BLOCK
      ?auto_81261 - BLOCK
      ?auto_81262 - BLOCK
      ?auto_81263 - BLOCK
      ?auto_81264 - BLOCK
      ?auto_81265 - BLOCK
      ?auto_81266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81260 ) ( ON ?auto_81261 ?auto_81260 ) ( ON ?auto_81262 ?auto_81261 ) ( ON ?auto_81263 ?auto_81262 ) ( ON ?auto_81264 ?auto_81263 ) ( not ( = ?auto_81260 ?auto_81261 ) ) ( not ( = ?auto_81260 ?auto_81262 ) ) ( not ( = ?auto_81260 ?auto_81263 ) ) ( not ( = ?auto_81260 ?auto_81264 ) ) ( not ( = ?auto_81260 ?auto_81265 ) ) ( not ( = ?auto_81260 ?auto_81266 ) ) ( not ( = ?auto_81261 ?auto_81262 ) ) ( not ( = ?auto_81261 ?auto_81263 ) ) ( not ( = ?auto_81261 ?auto_81264 ) ) ( not ( = ?auto_81261 ?auto_81265 ) ) ( not ( = ?auto_81261 ?auto_81266 ) ) ( not ( = ?auto_81262 ?auto_81263 ) ) ( not ( = ?auto_81262 ?auto_81264 ) ) ( not ( = ?auto_81262 ?auto_81265 ) ) ( not ( = ?auto_81262 ?auto_81266 ) ) ( not ( = ?auto_81263 ?auto_81264 ) ) ( not ( = ?auto_81263 ?auto_81265 ) ) ( not ( = ?auto_81263 ?auto_81266 ) ) ( not ( = ?auto_81264 ?auto_81265 ) ) ( not ( = ?auto_81264 ?auto_81266 ) ) ( not ( = ?auto_81265 ?auto_81266 ) ) ( ON-TABLE ?auto_81266 ) ( CLEAR ?auto_81264 ) ( ON ?auto_81265 ?auto_81266 ) ( CLEAR ?auto_81265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81266 )
      ( MAKE-7PILE ?auto_81260 ?auto_81261 ?auto_81262 ?auto_81263 ?auto_81264 ?auto_81265 ?auto_81266 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81267 - BLOCK
      ?auto_81268 - BLOCK
      ?auto_81269 - BLOCK
      ?auto_81270 - BLOCK
      ?auto_81271 - BLOCK
      ?auto_81272 - BLOCK
      ?auto_81273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81267 ) ( ON ?auto_81268 ?auto_81267 ) ( ON ?auto_81269 ?auto_81268 ) ( ON ?auto_81270 ?auto_81269 ) ( not ( = ?auto_81267 ?auto_81268 ) ) ( not ( = ?auto_81267 ?auto_81269 ) ) ( not ( = ?auto_81267 ?auto_81270 ) ) ( not ( = ?auto_81267 ?auto_81271 ) ) ( not ( = ?auto_81267 ?auto_81272 ) ) ( not ( = ?auto_81267 ?auto_81273 ) ) ( not ( = ?auto_81268 ?auto_81269 ) ) ( not ( = ?auto_81268 ?auto_81270 ) ) ( not ( = ?auto_81268 ?auto_81271 ) ) ( not ( = ?auto_81268 ?auto_81272 ) ) ( not ( = ?auto_81268 ?auto_81273 ) ) ( not ( = ?auto_81269 ?auto_81270 ) ) ( not ( = ?auto_81269 ?auto_81271 ) ) ( not ( = ?auto_81269 ?auto_81272 ) ) ( not ( = ?auto_81269 ?auto_81273 ) ) ( not ( = ?auto_81270 ?auto_81271 ) ) ( not ( = ?auto_81270 ?auto_81272 ) ) ( not ( = ?auto_81270 ?auto_81273 ) ) ( not ( = ?auto_81271 ?auto_81272 ) ) ( not ( = ?auto_81271 ?auto_81273 ) ) ( not ( = ?auto_81272 ?auto_81273 ) ) ( ON-TABLE ?auto_81273 ) ( ON ?auto_81272 ?auto_81273 ) ( CLEAR ?auto_81272 ) ( HOLDING ?auto_81271 ) ( CLEAR ?auto_81270 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81267 ?auto_81268 ?auto_81269 ?auto_81270 ?auto_81271 )
      ( MAKE-7PILE ?auto_81267 ?auto_81268 ?auto_81269 ?auto_81270 ?auto_81271 ?auto_81272 ?auto_81273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81274 - BLOCK
      ?auto_81275 - BLOCK
      ?auto_81276 - BLOCK
      ?auto_81277 - BLOCK
      ?auto_81278 - BLOCK
      ?auto_81279 - BLOCK
      ?auto_81280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81274 ) ( ON ?auto_81275 ?auto_81274 ) ( ON ?auto_81276 ?auto_81275 ) ( ON ?auto_81277 ?auto_81276 ) ( not ( = ?auto_81274 ?auto_81275 ) ) ( not ( = ?auto_81274 ?auto_81276 ) ) ( not ( = ?auto_81274 ?auto_81277 ) ) ( not ( = ?auto_81274 ?auto_81278 ) ) ( not ( = ?auto_81274 ?auto_81279 ) ) ( not ( = ?auto_81274 ?auto_81280 ) ) ( not ( = ?auto_81275 ?auto_81276 ) ) ( not ( = ?auto_81275 ?auto_81277 ) ) ( not ( = ?auto_81275 ?auto_81278 ) ) ( not ( = ?auto_81275 ?auto_81279 ) ) ( not ( = ?auto_81275 ?auto_81280 ) ) ( not ( = ?auto_81276 ?auto_81277 ) ) ( not ( = ?auto_81276 ?auto_81278 ) ) ( not ( = ?auto_81276 ?auto_81279 ) ) ( not ( = ?auto_81276 ?auto_81280 ) ) ( not ( = ?auto_81277 ?auto_81278 ) ) ( not ( = ?auto_81277 ?auto_81279 ) ) ( not ( = ?auto_81277 ?auto_81280 ) ) ( not ( = ?auto_81278 ?auto_81279 ) ) ( not ( = ?auto_81278 ?auto_81280 ) ) ( not ( = ?auto_81279 ?auto_81280 ) ) ( ON-TABLE ?auto_81280 ) ( ON ?auto_81279 ?auto_81280 ) ( CLEAR ?auto_81277 ) ( ON ?auto_81278 ?auto_81279 ) ( CLEAR ?auto_81278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81280 ?auto_81279 )
      ( MAKE-7PILE ?auto_81274 ?auto_81275 ?auto_81276 ?auto_81277 ?auto_81278 ?auto_81279 ?auto_81280 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81281 - BLOCK
      ?auto_81282 - BLOCK
      ?auto_81283 - BLOCK
      ?auto_81284 - BLOCK
      ?auto_81285 - BLOCK
      ?auto_81286 - BLOCK
      ?auto_81287 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81281 ) ( ON ?auto_81282 ?auto_81281 ) ( ON ?auto_81283 ?auto_81282 ) ( not ( = ?auto_81281 ?auto_81282 ) ) ( not ( = ?auto_81281 ?auto_81283 ) ) ( not ( = ?auto_81281 ?auto_81284 ) ) ( not ( = ?auto_81281 ?auto_81285 ) ) ( not ( = ?auto_81281 ?auto_81286 ) ) ( not ( = ?auto_81281 ?auto_81287 ) ) ( not ( = ?auto_81282 ?auto_81283 ) ) ( not ( = ?auto_81282 ?auto_81284 ) ) ( not ( = ?auto_81282 ?auto_81285 ) ) ( not ( = ?auto_81282 ?auto_81286 ) ) ( not ( = ?auto_81282 ?auto_81287 ) ) ( not ( = ?auto_81283 ?auto_81284 ) ) ( not ( = ?auto_81283 ?auto_81285 ) ) ( not ( = ?auto_81283 ?auto_81286 ) ) ( not ( = ?auto_81283 ?auto_81287 ) ) ( not ( = ?auto_81284 ?auto_81285 ) ) ( not ( = ?auto_81284 ?auto_81286 ) ) ( not ( = ?auto_81284 ?auto_81287 ) ) ( not ( = ?auto_81285 ?auto_81286 ) ) ( not ( = ?auto_81285 ?auto_81287 ) ) ( not ( = ?auto_81286 ?auto_81287 ) ) ( ON-TABLE ?auto_81287 ) ( ON ?auto_81286 ?auto_81287 ) ( ON ?auto_81285 ?auto_81286 ) ( CLEAR ?auto_81285 ) ( HOLDING ?auto_81284 ) ( CLEAR ?auto_81283 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81281 ?auto_81282 ?auto_81283 ?auto_81284 )
      ( MAKE-7PILE ?auto_81281 ?auto_81282 ?auto_81283 ?auto_81284 ?auto_81285 ?auto_81286 ?auto_81287 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81288 - BLOCK
      ?auto_81289 - BLOCK
      ?auto_81290 - BLOCK
      ?auto_81291 - BLOCK
      ?auto_81292 - BLOCK
      ?auto_81293 - BLOCK
      ?auto_81294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81288 ) ( ON ?auto_81289 ?auto_81288 ) ( ON ?auto_81290 ?auto_81289 ) ( not ( = ?auto_81288 ?auto_81289 ) ) ( not ( = ?auto_81288 ?auto_81290 ) ) ( not ( = ?auto_81288 ?auto_81291 ) ) ( not ( = ?auto_81288 ?auto_81292 ) ) ( not ( = ?auto_81288 ?auto_81293 ) ) ( not ( = ?auto_81288 ?auto_81294 ) ) ( not ( = ?auto_81289 ?auto_81290 ) ) ( not ( = ?auto_81289 ?auto_81291 ) ) ( not ( = ?auto_81289 ?auto_81292 ) ) ( not ( = ?auto_81289 ?auto_81293 ) ) ( not ( = ?auto_81289 ?auto_81294 ) ) ( not ( = ?auto_81290 ?auto_81291 ) ) ( not ( = ?auto_81290 ?auto_81292 ) ) ( not ( = ?auto_81290 ?auto_81293 ) ) ( not ( = ?auto_81290 ?auto_81294 ) ) ( not ( = ?auto_81291 ?auto_81292 ) ) ( not ( = ?auto_81291 ?auto_81293 ) ) ( not ( = ?auto_81291 ?auto_81294 ) ) ( not ( = ?auto_81292 ?auto_81293 ) ) ( not ( = ?auto_81292 ?auto_81294 ) ) ( not ( = ?auto_81293 ?auto_81294 ) ) ( ON-TABLE ?auto_81294 ) ( ON ?auto_81293 ?auto_81294 ) ( ON ?auto_81292 ?auto_81293 ) ( CLEAR ?auto_81290 ) ( ON ?auto_81291 ?auto_81292 ) ( CLEAR ?auto_81291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81294 ?auto_81293 ?auto_81292 )
      ( MAKE-7PILE ?auto_81288 ?auto_81289 ?auto_81290 ?auto_81291 ?auto_81292 ?auto_81293 ?auto_81294 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81295 - BLOCK
      ?auto_81296 - BLOCK
      ?auto_81297 - BLOCK
      ?auto_81298 - BLOCK
      ?auto_81299 - BLOCK
      ?auto_81300 - BLOCK
      ?auto_81301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81295 ) ( ON ?auto_81296 ?auto_81295 ) ( not ( = ?auto_81295 ?auto_81296 ) ) ( not ( = ?auto_81295 ?auto_81297 ) ) ( not ( = ?auto_81295 ?auto_81298 ) ) ( not ( = ?auto_81295 ?auto_81299 ) ) ( not ( = ?auto_81295 ?auto_81300 ) ) ( not ( = ?auto_81295 ?auto_81301 ) ) ( not ( = ?auto_81296 ?auto_81297 ) ) ( not ( = ?auto_81296 ?auto_81298 ) ) ( not ( = ?auto_81296 ?auto_81299 ) ) ( not ( = ?auto_81296 ?auto_81300 ) ) ( not ( = ?auto_81296 ?auto_81301 ) ) ( not ( = ?auto_81297 ?auto_81298 ) ) ( not ( = ?auto_81297 ?auto_81299 ) ) ( not ( = ?auto_81297 ?auto_81300 ) ) ( not ( = ?auto_81297 ?auto_81301 ) ) ( not ( = ?auto_81298 ?auto_81299 ) ) ( not ( = ?auto_81298 ?auto_81300 ) ) ( not ( = ?auto_81298 ?auto_81301 ) ) ( not ( = ?auto_81299 ?auto_81300 ) ) ( not ( = ?auto_81299 ?auto_81301 ) ) ( not ( = ?auto_81300 ?auto_81301 ) ) ( ON-TABLE ?auto_81301 ) ( ON ?auto_81300 ?auto_81301 ) ( ON ?auto_81299 ?auto_81300 ) ( ON ?auto_81298 ?auto_81299 ) ( CLEAR ?auto_81298 ) ( HOLDING ?auto_81297 ) ( CLEAR ?auto_81296 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81295 ?auto_81296 ?auto_81297 )
      ( MAKE-7PILE ?auto_81295 ?auto_81296 ?auto_81297 ?auto_81298 ?auto_81299 ?auto_81300 ?auto_81301 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81302 - BLOCK
      ?auto_81303 - BLOCK
      ?auto_81304 - BLOCK
      ?auto_81305 - BLOCK
      ?auto_81306 - BLOCK
      ?auto_81307 - BLOCK
      ?auto_81308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81302 ) ( ON ?auto_81303 ?auto_81302 ) ( not ( = ?auto_81302 ?auto_81303 ) ) ( not ( = ?auto_81302 ?auto_81304 ) ) ( not ( = ?auto_81302 ?auto_81305 ) ) ( not ( = ?auto_81302 ?auto_81306 ) ) ( not ( = ?auto_81302 ?auto_81307 ) ) ( not ( = ?auto_81302 ?auto_81308 ) ) ( not ( = ?auto_81303 ?auto_81304 ) ) ( not ( = ?auto_81303 ?auto_81305 ) ) ( not ( = ?auto_81303 ?auto_81306 ) ) ( not ( = ?auto_81303 ?auto_81307 ) ) ( not ( = ?auto_81303 ?auto_81308 ) ) ( not ( = ?auto_81304 ?auto_81305 ) ) ( not ( = ?auto_81304 ?auto_81306 ) ) ( not ( = ?auto_81304 ?auto_81307 ) ) ( not ( = ?auto_81304 ?auto_81308 ) ) ( not ( = ?auto_81305 ?auto_81306 ) ) ( not ( = ?auto_81305 ?auto_81307 ) ) ( not ( = ?auto_81305 ?auto_81308 ) ) ( not ( = ?auto_81306 ?auto_81307 ) ) ( not ( = ?auto_81306 ?auto_81308 ) ) ( not ( = ?auto_81307 ?auto_81308 ) ) ( ON-TABLE ?auto_81308 ) ( ON ?auto_81307 ?auto_81308 ) ( ON ?auto_81306 ?auto_81307 ) ( ON ?auto_81305 ?auto_81306 ) ( CLEAR ?auto_81303 ) ( ON ?auto_81304 ?auto_81305 ) ( CLEAR ?auto_81304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81308 ?auto_81307 ?auto_81306 ?auto_81305 )
      ( MAKE-7PILE ?auto_81302 ?auto_81303 ?auto_81304 ?auto_81305 ?auto_81306 ?auto_81307 ?auto_81308 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81309 - BLOCK
      ?auto_81310 - BLOCK
      ?auto_81311 - BLOCK
      ?auto_81312 - BLOCK
      ?auto_81313 - BLOCK
      ?auto_81314 - BLOCK
      ?auto_81315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81309 ) ( not ( = ?auto_81309 ?auto_81310 ) ) ( not ( = ?auto_81309 ?auto_81311 ) ) ( not ( = ?auto_81309 ?auto_81312 ) ) ( not ( = ?auto_81309 ?auto_81313 ) ) ( not ( = ?auto_81309 ?auto_81314 ) ) ( not ( = ?auto_81309 ?auto_81315 ) ) ( not ( = ?auto_81310 ?auto_81311 ) ) ( not ( = ?auto_81310 ?auto_81312 ) ) ( not ( = ?auto_81310 ?auto_81313 ) ) ( not ( = ?auto_81310 ?auto_81314 ) ) ( not ( = ?auto_81310 ?auto_81315 ) ) ( not ( = ?auto_81311 ?auto_81312 ) ) ( not ( = ?auto_81311 ?auto_81313 ) ) ( not ( = ?auto_81311 ?auto_81314 ) ) ( not ( = ?auto_81311 ?auto_81315 ) ) ( not ( = ?auto_81312 ?auto_81313 ) ) ( not ( = ?auto_81312 ?auto_81314 ) ) ( not ( = ?auto_81312 ?auto_81315 ) ) ( not ( = ?auto_81313 ?auto_81314 ) ) ( not ( = ?auto_81313 ?auto_81315 ) ) ( not ( = ?auto_81314 ?auto_81315 ) ) ( ON-TABLE ?auto_81315 ) ( ON ?auto_81314 ?auto_81315 ) ( ON ?auto_81313 ?auto_81314 ) ( ON ?auto_81312 ?auto_81313 ) ( ON ?auto_81311 ?auto_81312 ) ( CLEAR ?auto_81311 ) ( HOLDING ?auto_81310 ) ( CLEAR ?auto_81309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81309 ?auto_81310 )
      ( MAKE-7PILE ?auto_81309 ?auto_81310 ?auto_81311 ?auto_81312 ?auto_81313 ?auto_81314 ?auto_81315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81316 - BLOCK
      ?auto_81317 - BLOCK
      ?auto_81318 - BLOCK
      ?auto_81319 - BLOCK
      ?auto_81320 - BLOCK
      ?auto_81321 - BLOCK
      ?auto_81322 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81316 ) ( not ( = ?auto_81316 ?auto_81317 ) ) ( not ( = ?auto_81316 ?auto_81318 ) ) ( not ( = ?auto_81316 ?auto_81319 ) ) ( not ( = ?auto_81316 ?auto_81320 ) ) ( not ( = ?auto_81316 ?auto_81321 ) ) ( not ( = ?auto_81316 ?auto_81322 ) ) ( not ( = ?auto_81317 ?auto_81318 ) ) ( not ( = ?auto_81317 ?auto_81319 ) ) ( not ( = ?auto_81317 ?auto_81320 ) ) ( not ( = ?auto_81317 ?auto_81321 ) ) ( not ( = ?auto_81317 ?auto_81322 ) ) ( not ( = ?auto_81318 ?auto_81319 ) ) ( not ( = ?auto_81318 ?auto_81320 ) ) ( not ( = ?auto_81318 ?auto_81321 ) ) ( not ( = ?auto_81318 ?auto_81322 ) ) ( not ( = ?auto_81319 ?auto_81320 ) ) ( not ( = ?auto_81319 ?auto_81321 ) ) ( not ( = ?auto_81319 ?auto_81322 ) ) ( not ( = ?auto_81320 ?auto_81321 ) ) ( not ( = ?auto_81320 ?auto_81322 ) ) ( not ( = ?auto_81321 ?auto_81322 ) ) ( ON-TABLE ?auto_81322 ) ( ON ?auto_81321 ?auto_81322 ) ( ON ?auto_81320 ?auto_81321 ) ( ON ?auto_81319 ?auto_81320 ) ( ON ?auto_81318 ?auto_81319 ) ( CLEAR ?auto_81316 ) ( ON ?auto_81317 ?auto_81318 ) ( CLEAR ?auto_81317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81322 ?auto_81321 ?auto_81320 ?auto_81319 ?auto_81318 )
      ( MAKE-7PILE ?auto_81316 ?auto_81317 ?auto_81318 ?auto_81319 ?auto_81320 ?auto_81321 ?auto_81322 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81323 - BLOCK
      ?auto_81324 - BLOCK
      ?auto_81325 - BLOCK
      ?auto_81326 - BLOCK
      ?auto_81327 - BLOCK
      ?auto_81328 - BLOCK
      ?auto_81329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81323 ?auto_81324 ) ) ( not ( = ?auto_81323 ?auto_81325 ) ) ( not ( = ?auto_81323 ?auto_81326 ) ) ( not ( = ?auto_81323 ?auto_81327 ) ) ( not ( = ?auto_81323 ?auto_81328 ) ) ( not ( = ?auto_81323 ?auto_81329 ) ) ( not ( = ?auto_81324 ?auto_81325 ) ) ( not ( = ?auto_81324 ?auto_81326 ) ) ( not ( = ?auto_81324 ?auto_81327 ) ) ( not ( = ?auto_81324 ?auto_81328 ) ) ( not ( = ?auto_81324 ?auto_81329 ) ) ( not ( = ?auto_81325 ?auto_81326 ) ) ( not ( = ?auto_81325 ?auto_81327 ) ) ( not ( = ?auto_81325 ?auto_81328 ) ) ( not ( = ?auto_81325 ?auto_81329 ) ) ( not ( = ?auto_81326 ?auto_81327 ) ) ( not ( = ?auto_81326 ?auto_81328 ) ) ( not ( = ?auto_81326 ?auto_81329 ) ) ( not ( = ?auto_81327 ?auto_81328 ) ) ( not ( = ?auto_81327 ?auto_81329 ) ) ( not ( = ?auto_81328 ?auto_81329 ) ) ( ON-TABLE ?auto_81329 ) ( ON ?auto_81328 ?auto_81329 ) ( ON ?auto_81327 ?auto_81328 ) ( ON ?auto_81326 ?auto_81327 ) ( ON ?auto_81325 ?auto_81326 ) ( ON ?auto_81324 ?auto_81325 ) ( CLEAR ?auto_81324 ) ( HOLDING ?auto_81323 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81323 )
      ( MAKE-7PILE ?auto_81323 ?auto_81324 ?auto_81325 ?auto_81326 ?auto_81327 ?auto_81328 ?auto_81329 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81330 - BLOCK
      ?auto_81331 - BLOCK
      ?auto_81332 - BLOCK
      ?auto_81333 - BLOCK
      ?auto_81334 - BLOCK
      ?auto_81335 - BLOCK
      ?auto_81336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81330 ?auto_81331 ) ) ( not ( = ?auto_81330 ?auto_81332 ) ) ( not ( = ?auto_81330 ?auto_81333 ) ) ( not ( = ?auto_81330 ?auto_81334 ) ) ( not ( = ?auto_81330 ?auto_81335 ) ) ( not ( = ?auto_81330 ?auto_81336 ) ) ( not ( = ?auto_81331 ?auto_81332 ) ) ( not ( = ?auto_81331 ?auto_81333 ) ) ( not ( = ?auto_81331 ?auto_81334 ) ) ( not ( = ?auto_81331 ?auto_81335 ) ) ( not ( = ?auto_81331 ?auto_81336 ) ) ( not ( = ?auto_81332 ?auto_81333 ) ) ( not ( = ?auto_81332 ?auto_81334 ) ) ( not ( = ?auto_81332 ?auto_81335 ) ) ( not ( = ?auto_81332 ?auto_81336 ) ) ( not ( = ?auto_81333 ?auto_81334 ) ) ( not ( = ?auto_81333 ?auto_81335 ) ) ( not ( = ?auto_81333 ?auto_81336 ) ) ( not ( = ?auto_81334 ?auto_81335 ) ) ( not ( = ?auto_81334 ?auto_81336 ) ) ( not ( = ?auto_81335 ?auto_81336 ) ) ( ON-TABLE ?auto_81336 ) ( ON ?auto_81335 ?auto_81336 ) ( ON ?auto_81334 ?auto_81335 ) ( ON ?auto_81333 ?auto_81334 ) ( ON ?auto_81332 ?auto_81333 ) ( ON ?auto_81331 ?auto_81332 ) ( ON ?auto_81330 ?auto_81331 ) ( CLEAR ?auto_81330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81336 ?auto_81335 ?auto_81334 ?auto_81333 ?auto_81332 ?auto_81331 )
      ( MAKE-7PILE ?auto_81330 ?auto_81331 ?auto_81332 ?auto_81333 ?auto_81334 ?auto_81335 ?auto_81336 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81337 - BLOCK
      ?auto_81338 - BLOCK
      ?auto_81339 - BLOCK
      ?auto_81340 - BLOCK
      ?auto_81341 - BLOCK
      ?auto_81342 - BLOCK
      ?auto_81343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81337 ?auto_81338 ) ) ( not ( = ?auto_81337 ?auto_81339 ) ) ( not ( = ?auto_81337 ?auto_81340 ) ) ( not ( = ?auto_81337 ?auto_81341 ) ) ( not ( = ?auto_81337 ?auto_81342 ) ) ( not ( = ?auto_81337 ?auto_81343 ) ) ( not ( = ?auto_81338 ?auto_81339 ) ) ( not ( = ?auto_81338 ?auto_81340 ) ) ( not ( = ?auto_81338 ?auto_81341 ) ) ( not ( = ?auto_81338 ?auto_81342 ) ) ( not ( = ?auto_81338 ?auto_81343 ) ) ( not ( = ?auto_81339 ?auto_81340 ) ) ( not ( = ?auto_81339 ?auto_81341 ) ) ( not ( = ?auto_81339 ?auto_81342 ) ) ( not ( = ?auto_81339 ?auto_81343 ) ) ( not ( = ?auto_81340 ?auto_81341 ) ) ( not ( = ?auto_81340 ?auto_81342 ) ) ( not ( = ?auto_81340 ?auto_81343 ) ) ( not ( = ?auto_81341 ?auto_81342 ) ) ( not ( = ?auto_81341 ?auto_81343 ) ) ( not ( = ?auto_81342 ?auto_81343 ) ) ( ON-TABLE ?auto_81343 ) ( ON ?auto_81342 ?auto_81343 ) ( ON ?auto_81341 ?auto_81342 ) ( ON ?auto_81340 ?auto_81341 ) ( ON ?auto_81339 ?auto_81340 ) ( ON ?auto_81338 ?auto_81339 ) ( HOLDING ?auto_81337 ) ( CLEAR ?auto_81338 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81343 ?auto_81342 ?auto_81341 ?auto_81340 ?auto_81339 ?auto_81338 ?auto_81337 )
      ( MAKE-7PILE ?auto_81337 ?auto_81338 ?auto_81339 ?auto_81340 ?auto_81341 ?auto_81342 ?auto_81343 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81344 - BLOCK
      ?auto_81345 - BLOCK
      ?auto_81346 - BLOCK
      ?auto_81347 - BLOCK
      ?auto_81348 - BLOCK
      ?auto_81349 - BLOCK
      ?auto_81350 - BLOCK
    )
    :vars
    (
      ?auto_81351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81344 ?auto_81345 ) ) ( not ( = ?auto_81344 ?auto_81346 ) ) ( not ( = ?auto_81344 ?auto_81347 ) ) ( not ( = ?auto_81344 ?auto_81348 ) ) ( not ( = ?auto_81344 ?auto_81349 ) ) ( not ( = ?auto_81344 ?auto_81350 ) ) ( not ( = ?auto_81345 ?auto_81346 ) ) ( not ( = ?auto_81345 ?auto_81347 ) ) ( not ( = ?auto_81345 ?auto_81348 ) ) ( not ( = ?auto_81345 ?auto_81349 ) ) ( not ( = ?auto_81345 ?auto_81350 ) ) ( not ( = ?auto_81346 ?auto_81347 ) ) ( not ( = ?auto_81346 ?auto_81348 ) ) ( not ( = ?auto_81346 ?auto_81349 ) ) ( not ( = ?auto_81346 ?auto_81350 ) ) ( not ( = ?auto_81347 ?auto_81348 ) ) ( not ( = ?auto_81347 ?auto_81349 ) ) ( not ( = ?auto_81347 ?auto_81350 ) ) ( not ( = ?auto_81348 ?auto_81349 ) ) ( not ( = ?auto_81348 ?auto_81350 ) ) ( not ( = ?auto_81349 ?auto_81350 ) ) ( ON-TABLE ?auto_81350 ) ( ON ?auto_81349 ?auto_81350 ) ( ON ?auto_81348 ?auto_81349 ) ( ON ?auto_81347 ?auto_81348 ) ( ON ?auto_81346 ?auto_81347 ) ( ON ?auto_81345 ?auto_81346 ) ( CLEAR ?auto_81345 ) ( ON ?auto_81344 ?auto_81351 ) ( CLEAR ?auto_81344 ) ( HAND-EMPTY ) ( not ( = ?auto_81344 ?auto_81351 ) ) ( not ( = ?auto_81345 ?auto_81351 ) ) ( not ( = ?auto_81346 ?auto_81351 ) ) ( not ( = ?auto_81347 ?auto_81351 ) ) ( not ( = ?auto_81348 ?auto_81351 ) ) ( not ( = ?auto_81349 ?auto_81351 ) ) ( not ( = ?auto_81350 ?auto_81351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81344 ?auto_81351 )
      ( MAKE-7PILE ?auto_81344 ?auto_81345 ?auto_81346 ?auto_81347 ?auto_81348 ?auto_81349 ?auto_81350 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81352 - BLOCK
      ?auto_81353 - BLOCK
      ?auto_81354 - BLOCK
      ?auto_81355 - BLOCK
      ?auto_81356 - BLOCK
      ?auto_81357 - BLOCK
      ?auto_81358 - BLOCK
    )
    :vars
    (
      ?auto_81359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81352 ?auto_81353 ) ) ( not ( = ?auto_81352 ?auto_81354 ) ) ( not ( = ?auto_81352 ?auto_81355 ) ) ( not ( = ?auto_81352 ?auto_81356 ) ) ( not ( = ?auto_81352 ?auto_81357 ) ) ( not ( = ?auto_81352 ?auto_81358 ) ) ( not ( = ?auto_81353 ?auto_81354 ) ) ( not ( = ?auto_81353 ?auto_81355 ) ) ( not ( = ?auto_81353 ?auto_81356 ) ) ( not ( = ?auto_81353 ?auto_81357 ) ) ( not ( = ?auto_81353 ?auto_81358 ) ) ( not ( = ?auto_81354 ?auto_81355 ) ) ( not ( = ?auto_81354 ?auto_81356 ) ) ( not ( = ?auto_81354 ?auto_81357 ) ) ( not ( = ?auto_81354 ?auto_81358 ) ) ( not ( = ?auto_81355 ?auto_81356 ) ) ( not ( = ?auto_81355 ?auto_81357 ) ) ( not ( = ?auto_81355 ?auto_81358 ) ) ( not ( = ?auto_81356 ?auto_81357 ) ) ( not ( = ?auto_81356 ?auto_81358 ) ) ( not ( = ?auto_81357 ?auto_81358 ) ) ( ON-TABLE ?auto_81358 ) ( ON ?auto_81357 ?auto_81358 ) ( ON ?auto_81356 ?auto_81357 ) ( ON ?auto_81355 ?auto_81356 ) ( ON ?auto_81354 ?auto_81355 ) ( ON ?auto_81352 ?auto_81359 ) ( CLEAR ?auto_81352 ) ( not ( = ?auto_81352 ?auto_81359 ) ) ( not ( = ?auto_81353 ?auto_81359 ) ) ( not ( = ?auto_81354 ?auto_81359 ) ) ( not ( = ?auto_81355 ?auto_81359 ) ) ( not ( = ?auto_81356 ?auto_81359 ) ) ( not ( = ?auto_81357 ?auto_81359 ) ) ( not ( = ?auto_81358 ?auto_81359 ) ) ( HOLDING ?auto_81353 ) ( CLEAR ?auto_81354 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81358 ?auto_81357 ?auto_81356 ?auto_81355 ?auto_81354 ?auto_81353 )
      ( MAKE-7PILE ?auto_81352 ?auto_81353 ?auto_81354 ?auto_81355 ?auto_81356 ?auto_81357 ?auto_81358 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81360 - BLOCK
      ?auto_81361 - BLOCK
      ?auto_81362 - BLOCK
      ?auto_81363 - BLOCK
      ?auto_81364 - BLOCK
      ?auto_81365 - BLOCK
      ?auto_81366 - BLOCK
    )
    :vars
    (
      ?auto_81367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81360 ?auto_81361 ) ) ( not ( = ?auto_81360 ?auto_81362 ) ) ( not ( = ?auto_81360 ?auto_81363 ) ) ( not ( = ?auto_81360 ?auto_81364 ) ) ( not ( = ?auto_81360 ?auto_81365 ) ) ( not ( = ?auto_81360 ?auto_81366 ) ) ( not ( = ?auto_81361 ?auto_81362 ) ) ( not ( = ?auto_81361 ?auto_81363 ) ) ( not ( = ?auto_81361 ?auto_81364 ) ) ( not ( = ?auto_81361 ?auto_81365 ) ) ( not ( = ?auto_81361 ?auto_81366 ) ) ( not ( = ?auto_81362 ?auto_81363 ) ) ( not ( = ?auto_81362 ?auto_81364 ) ) ( not ( = ?auto_81362 ?auto_81365 ) ) ( not ( = ?auto_81362 ?auto_81366 ) ) ( not ( = ?auto_81363 ?auto_81364 ) ) ( not ( = ?auto_81363 ?auto_81365 ) ) ( not ( = ?auto_81363 ?auto_81366 ) ) ( not ( = ?auto_81364 ?auto_81365 ) ) ( not ( = ?auto_81364 ?auto_81366 ) ) ( not ( = ?auto_81365 ?auto_81366 ) ) ( ON-TABLE ?auto_81366 ) ( ON ?auto_81365 ?auto_81366 ) ( ON ?auto_81364 ?auto_81365 ) ( ON ?auto_81363 ?auto_81364 ) ( ON ?auto_81362 ?auto_81363 ) ( ON ?auto_81360 ?auto_81367 ) ( not ( = ?auto_81360 ?auto_81367 ) ) ( not ( = ?auto_81361 ?auto_81367 ) ) ( not ( = ?auto_81362 ?auto_81367 ) ) ( not ( = ?auto_81363 ?auto_81367 ) ) ( not ( = ?auto_81364 ?auto_81367 ) ) ( not ( = ?auto_81365 ?auto_81367 ) ) ( not ( = ?auto_81366 ?auto_81367 ) ) ( CLEAR ?auto_81362 ) ( ON ?auto_81361 ?auto_81360 ) ( CLEAR ?auto_81361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81367 ?auto_81360 )
      ( MAKE-7PILE ?auto_81360 ?auto_81361 ?auto_81362 ?auto_81363 ?auto_81364 ?auto_81365 ?auto_81366 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81368 - BLOCK
      ?auto_81369 - BLOCK
      ?auto_81370 - BLOCK
      ?auto_81371 - BLOCK
      ?auto_81372 - BLOCK
      ?auto_81373 - BLOCK
      ?auto_81374 - BLOCK
    )
    :vars
    (
      ?auto_81375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81368 ?auto_81369 ) ) ( not ( = ?auto_81368 ?auto_81370 ) ) ( not ( = ?auto_81368 ?auto_81371 ) ) ( not ( = ?auto_81368 ?auto_81372 ) ) ( not ( = ?auto_81368 ?auto_81373 ) ) ( not ( = ?auto_81368 ?auto_81374 ) ) ( not ( = ?auto_81369 ?auto_81370 ) ) ( not ( = ?auto_81369 ?auto_81371 ) ) ( not ( = ?auto_81369 ?auto_81372 ) ) ( not ( = ?auto_81369 ?auto_81373 ) ) ( not ( = ?auto_81369 ?auto_81374 ) ) ( not ( = ?auto_81370 ?auto_81371 ) ) ( not ( = ?auto_81370 ?auto_81372 ) ) ( not ( = ?auto_81370 ?auto_81373 ) ) ( not ( = ?auto_81370 ?auto_81374 ) ) ( not ( = ?auto_81371 ?auto_81372 ) ) ( not ( = ?auto_81371 ?auto_81373 ) ) ( not ( = ?auto_81371 ?auto_81374 ) ) ( not ( = ?auto_81372 ?auto_81373 ) ) ( not ( = ?auto_81372 ?auto_81374 ) ) ( not ( = ?auto_81373 ?auto_81374 ) ) ( ON-TABLE ?auto_81374 ) ( ON ?auto_81373 ?auto_81374 ) ( ON ?auto_81372 ?auto_81373 ) ( ON ?auto_81371 ?auto_81372 ) ( ON ?auto_81368 ?auto_81375 ) ( not ( = ?auto_81368 ?auto_81375 ) ) ( not ( = ?auto_81369 ?auto_81375 ) ) ( not ( = ?auto_81370 ?auto_81375 ) ) ( not ( = ?auto_81371 ?auto_81375 ) ) ( not ( = ?auto_81372 ?auto_81375 ) ) ( not ( = ?auto_81373 ?auto_81375 ) ) ( not ( = ?auto_81374 ?auto_81375 ) ) ( ON ?auto_81369 ?auto_81368 ) ( CLEAR ?auto_81369 ) ( ON-TABLE ?auto_81375 ) ( HOLDING ?auto_81370 ) ( CLEAR ?auto_81371 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81374 ?auto_81373 ?auto_81372 ?auto_81371 ?auto_81370 )
      ( MAKE-7PILE ?auto_81368 ?auto_81369 ?auto_81370 ?auto_81371 ?auto_81372 ?auto_81373 ?auto_81374 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81376 - BLOCK
      ?auto_81377 - BLOCK
      ?auto_81378 - BLOCK
      ?auto_81379 - BLOCK
      ?auto_81380 - BLOCK
      ?auto_81381 - BLOCK
      ?auto_81382 - BLOCK
    )
    :vars
    (
      ?auto_81383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81376 ?auto_81377 ) ) ( not ( = ?auto_81376 ?auto_81378 ) ) ( not ( = ?auto_81376 ?auto_81379 ) ) ( not ( = ?auto_81376 ?auto_81380 ) ) ( not ( = ?auto_81376 ?auto_81381 ) ) ( not ( = ?auto_81376 ?auto_81382 ) ) ( not ( = ?auto_81377 ?auto_81378 ) ) ( not ( = ?auto_81377 ?auto_81379 ) ) ( not ( = ?auto_81377 ?auto_81380 ) ) ( not ( = ?auto_81377 ?auto_81381 ) ) ( not ( = ?auto_81377 ?auto_81382 ) ) ( not ( = ?auto_81378 ?auto_81379 ) ) ( not ( = ?auto_81378 ?auto_81380 ) ) ( not ( = ?auto_81378 ?auto_81381 ) ) ( not ( = ?auto_81378 ?auto_81382 ) ) ( not ( = ?auto_81379 ?auto_81380 ) ) ( not ( = ?auto_81379 ?auto_81381 ) ) ( not ( = ?auto_81379 ?auto_81382 ) ) ( not ( = ?auto_81380 ?auto_81381 ) ) ( not ( = ?auto_81380 ?auto_81382 ) ) ( not ( = ?auto_81381 ?auto_81382 ) ) ( ON-TABLE ?auto_81382 ) ( ON ?auto_81381 ?auto_81382 ) ( ON ?auto_81380 ?auto_81381 ) ( ON ?auto_81379 ?auto_81380 ) ( ON ?auto_81376 ?auto_81383 ) ( not ( = ?auto_81376 ?auto_81383 ) ) ( not ( = ?auto_81377 ?auto_81383 ) ) ( not ( = ?auto_81378 ?auto_81383 ) ) ( not ( = ?auto_81379 ?auto_81383 ) ) ( not ( = ?auto_81380 ?auto_81383 ) ) ( not ( = ?auto_81381 ?auto_81383 ) ) ( not ( = ?auto_81382 ?auto_81383 ) ) ( ON ?auto_81377 ?auto_81376 ) ( ON-TABLE ?auto_81383 ) ( CLEAR ?auto_81379 ) ( ON ?auto_81378 ?auto_81377 ) ( CLEAR ?auto_81378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81383 ?auto_81376 ?auto_81377 )
      ( MAKE-7PILE ?auto_81376 ?auto_81377 ?auto_81378 ?auto_81379 ?auto_81380 ?auto_81381 ?auto_81382 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81384 - BLOCK
      ?auto_81385 - BLOCK
      ?auto_81386 - BLOCK
      ?auto_81387 - BLOCK
      ?auto_81388 - BLOCK
      ?auto_81389 - BLOCK
      ?auto_81390 - BLOCK
    )
    :vars
    (
      ?auto_81391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81384 ?auto_81385 ) ) ( not ( = ?auto_81384 ?auto_81386 ) ) ( not ( = ?auto_81384 ?auto_81387 ) ) ( not ( = ?auto_81384 ?auto_81388 ) ) ( not ( = ?auto_81384 ?auto_81389 ) ) ( not ( = ?auto_81384 ?auto_81390 ) ) ( not ( = ?auto_81385 ?auto_81386 ) ) ( not ( = ?auto_81385 ?auto_81387 ) ) ( not ( = ?auto_81385 ?auto_81388 ) ) ( not ( = ?auto_81385 ?auto_81389 ) ) ( not ( = ?auto_81385 ?auto_81390 ) ) ( not ( = ?auto_81386 ?auto_81387 ) ) ( not ( = ?auto_81386 ?auto_81388 ) ) ( not ( = ?auto_81386 ?auto_81389 ) ) ( not ( = ?auto_81386 ?auto_81390 ) ) ( not ( = ?auto_81387 ?auto_81388 ) ) ( not ( = ?auto_81387 ?auto_81389 ) ) ( not ( = ?auto_81387 ?auto_81390 ) ) ( not ( = ?auto_81388 ?auto_81389 ) ) ( not ( = ?auto_81388 ?auto_81390 ) ) ( not ( = ?auto_81389 ?auto_81390 ) ) ( ON-TABLE ?auto_81390 ) ( ON ?auto_81389 ?auto_81390 ) ( ON ?auto_81388 ?auto_81389 ) ( ON ?auto_81384 ?auto_81391 ) ( not ( = ?auto_81384 ?auto_81391 ) ) ( not ( = ?auto_81385 ?auto_81391 ) ) ( not ( = ?auto_81386 ?auto_81391 ) ) ( not ( = ?auto_81387 ?auto_81391 ) ) ( not ( = ?auto_81388 ?auto_81391 ) ) ( not ( = ?auto_81389 ?auto_81391 ) ) ( not ( = ?auto_81390 ?auto_81391 ) ) ( ON ?auto_81385 ?auto_81384 ) ( ON-TABLE ?auto_81391 ) ( ON ?auto_81386 ?auto_81385 ) ( CLEAR ?auto_81386 ) ( HOLDING ?auto_81387 ) ( CLEAR ?auto_81388 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81390 ?auto_81389 ?auto_81388 ?auto_81387 )
      ( MAKE-7PILE ?auto_81384 ?auto_81385 ?auto_81386 ?auto_81387 ?auto_81388 ?auto_81389 ?auto_81390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81392 - BLOCK
      ?auto_81393 - BLOCK
      ?auto_81394 - BLOCK
      ?auto_81395 - BLOCK
      ?auto_81396 - BLOCK
      ?auto_81397 - BLOCK
      ?auto_81398 - BLOCK
    )
    :vars
    (
      ?auto_81399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81392 ?auto_81393 ) ) ( not ( = ?auto_81392 ?auto_81394 ) ) ( not ( = ?auto_81392 ?auto_81395 ) ) ( not ( = ?auto_81392 ?auto_81396 ) ) ( not ( = ?auto_81392 ?auto_81397 ) ) ( not ( = ?auto_81392 ?auto_81398 ) ) ( not ( = ?auto_81393 ?auto_81394 ) ) ( not ( = ?auto_81393 ?auto_81395 ) ) ( not ( = ?auto_81393 ?auto_81396 ) ) ( not ( = ?auto_81393 ?auto_81397 ) ) ( not ( = ?auto_81393 ?auto_81398 ) ) ( not ( = ?auto_81394 ?auto_81395 ) ) ( not ( = ?auto_81394 ?auto_81396 ) ) ( not ( = ?auto_81394 ?auto_81397 ) ) ( not ( = ?auto_81394 ?auto_81398 ) ) ( not ( = ?auto_81395 ?auto_81396 ) ) ( not ( = ?auto_81395 ?auto_81397 ) ) ( not ( = ?auto_81395 ?auto_81398 ) ) ( not ( = ?auto_81396 ?auto_81397 ) ) ( not ( = ?auto_81396 ?auto_81398 ) ) ( not ( = ?auto_81397 ?auto_81398 ) ) ( ON-TABLE ?auto_81398 ) ( ON ?auto_81397 ?auto_81398 ) ( ON ?auto_81396 ?auto_81397 ) ( ON ?auto_81392 ?auto_81399 ) ( not ( = ?auto_81392 ?auto_81399 ) ) ( not ( = ?auto_81393 ?auto_81399 ) ) ( not ( = ?auto_81394 ?auto_81399 ) ) ( not ( = ?auto_81395 ?auto_81399 ) ) ( not ( = ?auto_81396 ?auto_81399 ) ) ( not ( = ?auto_81397 ?auto_81399 ) ) ( not ( = ?auto_81398 ?auto_81399 ) ) ( ON ?auto_81393 ?auto_81392 ) ( ON-TABLE ?auto_81399 ) ( ON ?auto_81394 ?auto_81393 ) ( CLEAR ?auto_81396 ) ( ON ?auto_81395 ?auto_81394 ) ( CLEAR ?auto_81395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81399 ?auto_81392 ?auto_81393 ?auto_81394 )
      ( MAKE-7PILE ?auto_81392 ?auto_81393 ?auto_81394 ?auto_81395 ?auto_81396 ?auto_81397 ?auto_81398 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81400 - BLOCK
      ?auto_81401 - BLOCK
      ?auto_81402 - BLOCK
      ?auto_81403 - BLOCK
      ?auto_81404 - BLOCK
      ?auto_81405 - BLOCK
      ?auto_81406 - BLOCK
    )
    :vars
    (
      ?auto_81407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81400 ?auto_81401 ) ) ( not ( = ?auto_81400 ?auto_81402 ) ) ( not ( = ?auto_81400 ?auto_81403 ) ) ( not ( = ?auto_81400 ?auto_81404 ) ) ( not ( = ?auto_81400 ?auto_81405 ) ) ( not ( = ?auto_81400 ?auto_81406 ) ) ( not ( = ?auto_81401 ?auto_81402 ) ) ( not ( = ?auto_81401 ?auto_81403 ) ) ( not ( = ?auto_81401 ?auto_81404 ) ) ( not ( = ?auto_81401 ?auto_81405 ) ) ( not ( = ?auto_81401 ?auto_81406 ) ) ( not ( = ?auto_81402 ?auto_81403 ) ) ( not ( = ?auto_81402 ?auto_81404 ) ) ( not ( = ?auto_81402 ?auto_81405 ) ) ( not ( = ?auto_81402 ?auto_81406 ) ) ( not ( = ?auto_81403 ?auto_81404 ) ) ( not ( = ?auto_81403 ?auto_81405 ) ) ( not ( = ?auto_81403 ?auto_81406 ) ) ( not ( = ?auto_81404 ?auto_81405 ) ) ( not ( = ?auto_81404 ?auto_81406 ) ) ( not ( = ?auto_81405 ?auto_81406 ) ) ( ON-TABLE ?auto_81406 ) ( ON ?auto_81405 ?auto_81406 ) ( ON ?auto_81400 ?auto_81407 ) ( not ( = ?auto_81400 ?auto_81407 ) ) ( not ( = ?auto_81401 ?auto_81407 ) ) ( not ( = ?auto_81402 ?auto_81407 ) ) ( not ( = ?auto_81403 ?auto_81407 ) ) ( not ( = ?auto_81404 ?auto_81407 ) ) ( not ( = ?auto_81405 ?auto_81407 ) ) ( not ( = ?auto_81406 ?auto_81407 ) ) ( ON ?auto_81401 ?auto_81400 ) ( ON-TABLE ?auto_81407 ) ( ON ?auto_81402 ?auto_81401 ) ( ON ?auto_81403 ?auto_81402 ) ( CLEAR ?auto_81403 ) ( HOLDING ?auto_81404 ) ( CLEAR ?auto_81405 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81406 ?auto_81405 ?auto_81404 )
      ( MAKE-7PILE ?auto_81400 ?auto_81401 ?auto_81402 ?auto_81403 ?auto_81404 ?auto_81405 ?auto_81406 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81408 - BLOCK
      ?auto_81409 - BLOCK
      ?auto_81410 - BLOCK
      ?auto_81411 - BLOCK
      ?auto_81412 - BLOCK
      ?auto_81413 - BLOCK
      ?auto_81414 - BLOCK
    )
    :vars
    (
      ?auto_81415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81408 ?auto_81409 ) ) ( not ( = ?auto_81408 ?auto_81410 ) ) ( not ( = ?auto_81408 ?auto_81411 ) ) ( not ( = ?auto_81408 ?auto_81412 ) ) ( not ( = ?auto_81408 ?auto_81413 ) ) ( not ( = ?auto_81408 ?auto_81414 ) ) ( not ( = ?auto_81409 ?auto_81410 ) ) ( not ( = ?auto_81409 ?auto_81411 ) ) ( not ( = ?auto_81409 ?auto_81412 ) ) ( not ( = ?auto_81409 ?auto_81413 ) ) ( not ( = ?auto_81409 ?auto_81414 ) ) ( not ( = ?auto_81410 ?auto_81411 ) ) ( not ( = ?auto_81410 ?auto_81412 ) ) ( not ( = ?auto_81410 ?auto_81413 ) ) ( not ( = ?auto_81410 ?auto_81414 ) ) ( not ( = ?auto_81411 ?auto_81412 ) ) ( not ( = ?auto_81411 ?auto_81413 ) ) ( not ( = ?auto_81411 ?auto_81414 ) ) ( not ( = ?auto_81412 ?auto_81413 ) ) ( not ( = ?auto_81412 ?auto_81414 ) ) ( not ( = ?auto_81413 ?auto_81414 ) ) ( ON-TABLE ?auto_81414 ) ( ON ?auto_81413 ?auto_81414 ) ( ON ?auto_81408 ?auto_81415 ) ( not ( = ?auto_81408 ?auto_81415 ) ) ( not ( = ?auto_81409 ?auto_81415 ) ) ( not ( = ?auto_81410 ?auto_81415 ) ) ( not ( = ?auto_81411 ?auto_81415 ) ) ( not ( = ?auto_81412 ?auto_81415 ) ) ( not ( = ?auto_81413 ?auto_81415 ) ) ( not ( = ?auto_81414 ?auto_81415 ) ) ( ON ?auto_81409 ?auto_81408 ) ( ON-TABLE ?auto_81415 ) ( ON ?auto_81410 ?auto_81409 ) ( ON ?auto_81411 ?auto_81410 ) ( CLEAR ?auto_81413 ) ( ON ?auto_81412 ?auto_81411 ) ( CLEAR ?auto_81412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81415 ?auto_81408 ?auto_81409 ?auto_81410 ?auto_81411 )
      ( MAKE-7PILE ?auto_81408 ?auto_81409 ?auto_81410 ?auto_81411 ?auto_81412 ?auto_81413 ?auto_81414 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81416 - BLOCK
      ?auto_81417 - BLOCK
      ?auto_81418 - BLOCK
      ?auto_81419 - BLOCK
      ?auto_81420 - BLOCK
      ?auto_81421 - BLOCK
      ?auto_81422 - BLOCK
    )
    :vars
    (
      ?auto_81423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81416 ?auto_81417 ) ) ( not ( = ?auto_81416 ?auto_81418 ) ) ( not ( = ?auto_81416 ?auto_81419 ) ) ( not ( = ?auto_81416 ?auto_81420 ) ) ( not ( = ?auto_81416 ?auto_81421 ) ) ( not ( = ?auto_81416 ?auto_81422 ) ) ( not ( = ?auto_81417 ?auto_81418 ) ) ( not ( = ?auto_81417 ?auto_81419 ) ) ( not ( = ?auto_81417 ?auto_81420 ) ) ( not ( = ?auto_81417 ?auto_81421 ) ) ( not ( = ?auto_81417 ?auto_81422 ) ) ( not ( = ?auto_81418 ?auto_81419 ) ) ( not ( = ?auto_81418 ?auto_81420 ) ) ( not ( = ?auto_81418 ?auto_81421 ) ) ( not ( = ?auto_81418 ?auto_81422 ) ) ( not ( = ?auto_81419 ?auto_81420 ) ) ( not ( = ?auto_81419 ?auto_81421 ) ) ( not ( = ?auto_81419 ?auto_81422 ) ) ( not ( = ?auto_81420 ?auto_81421 ) ) ( not ( = ?auto_81420 ?auto_81422 ) ) ( not ( = ?auto_81421 ?auto_81422 ) ) ( ON-TABLE ?auto_81422 ) ( ON ?auto_81416 ?auto_81423 ) ( not ( = ?auto_81416 ?auto_81423 ) ) ( not ( = ?auto_81417 ?auto_81423 ) ) ( not ( = ?auto_81418 ?auto_81423 ) ) ( not ( = ?auto_81419 ?auto_81423 ) ) ( not ( = ?auto_81420 ?auto_81423 ) ) ( not ( = ?auto_81421 ?auto_81423 ) ) ( not ( = ?auto_81422 ?auto_81423 ) ) ( ON ?auto_81417 ?auto_81416 ) ( ON-TABLE ?auto_81423 ) ( ON ?auto_81418 ?auto_81417 ) ( ON ?auto_81419 ?auto_81418 ) ( ON ?auto_81420 ?auto_81419 ) ( CLEAR ?auto_81420 ) ( HOLDING ?auto_81421 ) ( CLEAR ?auto_81422 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81422 ?auto_81421 )
      ( MAKE-7PILE ?auto_81416 ?auto_81417 ?auto_81418 ?auto_81419 ?auto_81420 ?auto_81421 ?auto_81422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81424 - BLOCK
      ?auto_81425 - BLOCK
      ?auto_81426 - BLOCK
      ?auto_81427 - BLOCK
      ?auto_81428 - BLOCK
      ?auto_81429 - BLOCK
      ?auto_81430 - BLOCK
    )
    :vars
    (
      ?auto_81431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81424 ?auto_81425 ) ) ( not ( = ?auto_81424 ?auto_81426 ) ) ( not ( = ?auto_81424 ?auto_81427 ) ) ( not ( = ?auto_81424 ?auto_81428 ) ) ( not ( = ?auto_81424 ?auto_81429 ) ) ( not ( = ?auto_81424 ?auto_81430 ) ) ( not ( = ?auto_81425 ?auto_81426 ) ) ( not ( = ?auto_81425 ?auto_81427 ) ) ( not ( = ?auto_81425 ?auto_81428 ) ) ( not ( = ?auto_81425 ?auto_81429 ) ) ( not ( = ?auto_81425 ?auto_81430 ) ) ( not ( = ?auto_81426 ?auto_81427 ) ) ( not ( = ?auto_81426 ?auto_81428 ) ) ( not ( = ?auto_81426 ?auto_81429 ) ) ( not ( = ?auto_81426 ?auto_81430 ) ) ( not ( = ?auto_81427 ?auto_81428 ) ) ( not ( = ?auto_81427 ?auto_81429 ) ) ( not ( = ?auto_81427 ?auto_81430 ) ) ( not ( = ?auto_81428 ?auto_81429 ) ) ( not ( = ?auto_81428 ?auto_81430 ) ) ( not ( = ?auto_81429 ?auto_81430 ) ) ( ON-TABLE ?auto_81430 ) ( ON ?auto_81424 ?auto_81431 ) ( not ( = ?auto_81424 ?auto_81431 ) ) ( not ( = ?auto_81425 ?auto_81431 ) ) ( not ( = ?auto_81426 ?auto_81431 ) ) ( not ( = ?auto_81427 ?auto_81431 ) ) ( not ( = ?auto_81428 ?auto_81431 ) ) ( not ( = ?auto_81429 ?auto_81431 ) ) ( not ( = ?auto_81430 ?auto_81431 ) ) ( ON ?auto_81425 ?auto_81424 ) ( ON-TABLE ?auto_81431 ) ( ON ?auto_81426 ?auto_81425 ) ( ON ?auto_81427 ?auto_81426 ) ( ON ?auto_81428 ?auto_81427 ) ( CLEAR ?auto_81430 ) ( ON ?auto_81429 ?auto_81428 ) ( CLEAR ?auto_81429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81431 ?auto_81424 ?auto_81425 ?auto_81426 ?auto_81427 ?auto_81428 )
      ( MAKE-7PILE ?auto_81424 ?auto_81425 ?auto_81426 ?auto_81427 ?auto_81428 ?auto_81429 ?auto_81430 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81432 - BLOCK
      ?auto_81433 - BLOCK
      ?auto_81434 - BLOCK
      ?auto_81435 - BLOCK
      ?auto_81436 - BLOCK
      ?auto_81437 - BLOCK
      ?auto_81438 - BLOCK
    )
    :vars
    (
      ?auto_81439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81432 ?auto_81433 ) ) ( not ( = ?auto_81432 ?auto_81434 ) ) ( not ( = ?auto_81432 ?auto_81435 ) ) ( not ( = ?auto_81432 ?auto_81436 ) ) ( not ( = ?auto_81432 ?auto_81437 ) ) ( not ( = ?auto_81432 ?auto_81438 ) ) ( not ( = ?auto_81433 ?auto_81434 ) ) ( not ( = ?auto_81433 ?auto_81435 ) ) ( not ( = ?auto_81433 ?auto_81436 ) ) ( not ( = ?auto_81433 ?auto_81437 ) ) ( not ( = ?auto_81433 ?auto_81438 ) ) ( not ( = ?auto_81434 ?auto_81435 ) ) ( not ( = ?auto_81434 ?auto_81436 ) ) ( not ( = ?auto_81434 ?auto_81437 ) ) ( not ( = ?auto_81434 ?auto_81438 ) ) ( not ( = ?auto_81435 ?auto_81436 ) ) ( not ( = ?auto_81435 ?auto_81437 ) ) ( not ( = ?auto_81435 ?auto_81438 ) ) ( not ( = ?auto_81436 ?auto_81437 ) ) ( not ( = ?auto_81436 ?auto_81438 ) ) ( not ( = ?auto_81437 ?auto_81438 ) ) ( ON ?auto_81432 ?auto_81439 ) ( not ( = ?auto_81432 ?auto_81439 ) ) ( not ( = ?auto_81433 ?auto_81439 ) ) ( not ( = ?auto_81434 ?auto_81439 ) ) ( not ( = ?auto_81435 ?auto_81439 ) ) ( not ( = ?auto_81436 ?auto_81439 ) ) ( not ( = ?auto_81437 ?auto_81439 ) ) ( not ( = ?auto_81438 ?auto_81439 ) ) ( ON ?auto_81433 ?auto_81432 ) ( ON-TABLE ?auto_81439 ) ( ON ?auto_81434 ?auto_81433 ) ( ON ?auto_81435 ?auto_81434 ) ( ON ?auto_81436 ?auto_81435 ) ( ON ?auto_81437 ?auto_81436 ) ( CLEAR ?auto_81437 ) ( HOLDING ?auto_81438 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81438 )
      ( MAKE-7PILE ?auto_81432 ?auto_81433 ?auto_81434 ?auto_81435 ?auto_81436 ?auto_81437 ?auto_81438 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81440 - BLOCK
      ?auto_81441 - BLOCK
      ?auto_81442 - BLOCK
      ?auto_81443 - BLOCK
      ?auto_81444 - BLOCK
      ?auto_81445 - BLOCK
      ?auto_81446 - BLOCK
    )
    :vars
    (
      ?auto_81447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81440 ?auto_81441 ) ) ( not ( = ?auto_81440 ?auto_81442 ) ) ( not ( = ?auto_81440 ?auto_81443 ) ) ( not ( = ?auto_81440 ?auto_81444 ) ) ( not ( = ?auto_81440 ?auto_81445 ) ) ( not ( = ?auto_81440 ?auto_81446 ) ) ( not ( = ?auto_81441 ?auto_81442 ) ) ( not ( = ?auto_81441 ?auto_81443 ) ) ( not ( = ?auto_81441 ?auto_81444 ) ) ( not ( = ?auto_81441 ?auto_81445 ) ) ( not ( = ?auto_81441 ?auto_81446 ) ) ( not ( = ?auto_81442 ?auto_81443 ) ) ( not ( = ?auto_81442 ?auto_81444 ) ) ( not ( = ?auto_81442 ?auto_81445 ) ) ( not ( = ?auto_81442 ?auto_81446 ) ) ( not ( = ?auto_81443 ?auto_81444 ) ) ( not ( = ?auto_81443 ?auto_81445 ) ) ( not ( = ?auto_81443 ?auto_81446 ) ) ( not ( = ?auto_81444 ?auto_81445 ) ) ( not ( = ?auto_81444 ?auto_81446 ) ) ( not ( = ?auto_81445 ?auto_81446 ) ) ( ON ?auto_81440 ?auto_81447 ) ( not ( = ?auto_81440 ?auto_81447 ) ) ( not ( = ?auto_81441 ?auto_81447 ) ) ( not ( = ?auto_81442 ?auto_81447 ) ) ( not ( = ?auto_81443 ?auto_81447 ) ) ( not ( = ?auto_81444 ?auto_81447 ) ) ( not ( = ?auto_81445 ?auto_81447 ) ) ( not ( = ?auto_81446 ?auto_81447 ) ) ( ON ?auto_81441 ?auto_81440 ) ( ON-TABLE ?auto_81447 ) ( ON ?auto_81442 ?auto_81441 ) ( ON ?auto_81443 ?auto_81442 ) ( ON ?auto_81444 ?auto_81443 ) ( ON ?auto_81445 ?auto_81444 ) ( ON ?auto_81446 ?auto_81445 ) ( CLEAR ?auto_81446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81447 ?auto_81440 ?auto_81441 ?auto_81442 ?auto_81443 ?auto_81444 ?auto_81445 )
      ( MAKE-7PILE ?auto_81440 ?auto_81441 ?auto_81442 ?auto_81443 ?auto_81444 ?auto_81445 ?auto_81446 ) )
  )

)

