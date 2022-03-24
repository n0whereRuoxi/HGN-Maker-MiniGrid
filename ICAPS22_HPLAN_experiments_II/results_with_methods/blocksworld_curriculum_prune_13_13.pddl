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
      ?auto_250617 - BLOCK
    )
    :vars
    (
      ?auto_250618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250617 ?auto_250618 ) ( CLEAR ?auto_250617 ) ( HAND-EMPTY ) ( not ( = ?auto_250617 ?auto_250618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_250617 ?auto_250618 )
      ( !PUTDOWN ?auto_250617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_250624 - BLOCK
      ?auto_250625 - BLOCK
    )
    :vars
    (
      ?auto_250626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_250624 ) ( ON ?auto_250625 ?auto_250626 ) ( CLEAR ?auto_250625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_250624 ) ( not ( = ?auto_250624 ?auto_250625 ) ) ( not ( = ?auto_250624 ?auto_250626 ) ) ( not ( = ?auto_250625 ?auto_250626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_250625 ?auto_250626 )
      ( !STACK ?auto_250625 ?auto_250624 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_250634 - BLOCK
      ?auto_250635 - BLOCK
    )
    :vars
    (
      ?auto_250636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250635 ?auto_250636 ) ( not ( = ?auto_250634 ?auto_250635 ) ) ( not ( = ?auto_250634 ?auto_250636 ) ) ( not ( = ?auto_250635 ?auto_250636 ) ) ( ON ?auto_250634 ?auto_250635 ) ( CLEAR ?auto_250634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250634 )
      ( MAKE-2PILE ?auto_250634 ?auto_250635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_250645 - BLOCK
      ?auto_250646 - BLOCK
      ?auto_250647 - BLOCK
    )
    :vars
    (
      ?auto_250648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_250646 ) ( ON ?auto_250647 ?auto_250648 ) ( CLEAR ?auto_250647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_250645 ) ( ON ?auto_250646 ?auto_250645 ) ( not ( = ?auto_250645 ?auto_250646 ) ) ( not ( = ?auto_250645 ?auto_250647 ) ) ( not ( = ?auto_250645 ?auto_250648 ) ) ( not ( = ?auto_250646 ?auto_250647 ) ) ( not ( = ?auto_250646 ?auto_250648 ) ) ( not ( = ?auto_250647 ?auto_250648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_250647 ?auto_250648 )
      ( !STACK ?auto_250647 ?auto_250646 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_250659 - BLOCK
      ?auto_250660 - BLOCK
      ?auto_250661 - BLOCK
    )
    :vars
    (
      ?auto_250662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250661 ?auto_250662 ) ( ON-TABLE ?auto_250659 ) ( not ( = ?auto_250659 ?auto_250660 ) ) ( not ( = ?auto_250659 ?auto_250661 ) ) ( not ( = ?auto_250659 ?auto_250662 ) ) ( not ( = ?auto_250660 ?auto_250661 ) ) ( not ( = ?auto_250660 ?auto_250662 ) ) ( not ( = ?auto_250661 ?auto_250662 ) ) ( CLEAR ?auto_250659 ) ( ON ?auto_250660 ?auto_250661 ) ( CLEAR ?auto_250660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250659 ?auto_250660 )
      ( MAKE-3PILE ?auto_250659 ?auto_250660 ?auto_250661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_250673 - BLOCK
      ?auto_250674 - BLOCK
      ?auto_250675 - BLOCK
    )
    :vars
    (
      ?auto_250676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250675 ?auto_250676 ) ( not ( = ?auto_250673 ?auto_250674 ) ) ( not ( = ?auto_250673 ?auto_250675 ) ) ( not ( = ?auto_250673 ?auto_250676 ) ) ( not ( = ?auto_250674 ?auto_250675 ) ) ( not ( = ?auto_250674 ?auto_250676 ) ) ( not ( = ?auto_250675 ?auto_250676 ) ) ( ON ?auto_250674 ?auto_250675 ) ( ON ?auto_250673 ?auto_250674 ) ( CLEAR ?auto_250673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250673 )
      ( MAKE-3PILE ?auto_250673 ?auto_250674 ?auto_250675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_250688 - BLOCK
      ?auto_250689 - BLOCK
      ?auto_250690 - BLOCK
      ?auto_250691 - BLOCK
    )
    :vars
    (
      ?auto_250692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_250690 ) ( ON ?auto_250691 ?auto_250692 ) ( CLEAR ?auto_250691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_250688 ) ( ON ?auto_250689 ?auto_250688 ) ( ON ?auto_250690 ?auto_250689 ) ( not ( = ?auto_250688 ?auto_250689 ) ) ( not ( = ?auto_250688 ?auto_250690 ) ) ( not ( = ?auto_250688 ?auto_250691 ) ) ( not ( = ?auto_250688 ?auto_250692 ) ) ( not ( = ?auto_250689 ?auto_250690 ) ) ( not ( = ?auto_250689 ?auto_250691 ) ) ( not ( = ?auto_250689 ?auto_250692 ) ) ( not ( = ?auto_250690 ?auto_250691 ) ) ( not ( = ?auto_250690 ?auto_250692 ) ) ( not ( = ?auto_250691 ?auto_250692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_250691 ?auto_250692 )
      ( !STACK ?auto_250691 ?auto_250690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_250706 - BLOCK
      ?auto_250707 - BLOCK
      ?auto_250708 - BLOCK
      ?auto_250709 - BLOCK
    )
    :vars
    (
      ?auto_250710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250709 ?auto_250710 ) ( ON-TABLE ?auto_250706 ) ( ON ?auto_250707 ?auto_250706 ) ( not ( = ?auto_250706 ?auto_250707 ) ) ( not ( = ?auto_250706 ?auto_250708 ) ) ( not ( = ?auto_250706 ?auto_250709 ) ) ( not ( = ?auto_250706 ?auto_250710 ) ) ( not ( = ?auto_250707 ?auto_250708 ) ) ( not ( = ?auto_250707 ?auto_250709 ) ) ( not ( = ?auto_250707 ?auto_250710 ) ) ( not ( = ?auto_250708 ?auto_250709 ) ) ( not ( = ?auto_250708 ?auto_250710 ) ) ( not ( = ?auto_250709 ?auto_250710 ) ) ( CLEAR ?auto_250707 ) ( ON ?auto_250708 ?auto_250709 ) ( CLEAR ?auto_250708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_250706 ?auto_250707 ?auto_250708 )
      ( MAKE-4PILE ?auto_250706 ?auto_250707 ?auto_250708 ?auto_250709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_250724 - BLOCK
      ?auto_250725 - BLOCK
      ?auto_250726 - BLOCK
      ?auto_250727 - BLOCK
    )
    :vars
    (
      ?auto_250728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250727 ?auto_250728 ) ( ON-TABLE ?auto_250724 ) ( not ( = ?auto_250724 ?auto_250725 ) ) ( not ( = ?auto_250724 ?auto_250726 ) ) ( not ( = ?auto_250724 ?auto_250727 ) ) ( not ( = ?auto_250724 ?auto_250728 ) ) ( not ( = ?auto_250725 ?auto_250726 ) ) ( not ( = ?auto_250725 ?auto_250727 ) ) ( not ( = ?auto_250725 ?auto_250728 ) ) ( not ( = ?auto_250726 ?auto_250727 ) ) ( not ( = ?auto_250726 ?auto_250728 ) ) ( not ( = ?auto_250727 ?auto_250728 ) ) ( ON ?auto_250726 ?auto_250727 ) ( CLEAR ?auto_250724 ) ( ON ?auto_250725 ?auto_250726 ) ( CLEAR ?auto_250725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250724 ?auto_250725 )
      ( MAKE-4PILE ?auto_250724 ?auto_250725 ?auto_250726 ?auto_250727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_250742 - BLOCK
      ?auto_250743 - BLOCK
      ?auto_250744 - BLOCK
      ?auto_250745 - BLOCK
    )
    :vars
    (
      ?auto_250746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250745 ?auto_250746 ) ( not ( = ?auto_250742 ?auto_250743 ) ) ( not ( = ?auto_250742 ?auto_250744 ) ) ( not ( = ?auto_250742 ?auto_250745 ) ) ( not ( = ?auto_250742 ?auto_250746 ) ) ( not ( = ?auto_250743 ?auto_250744 ) ) ( not ( = ?auto_250743 ?auto_250745 ) ) ( not ( = ?auto_250743 ?auto_250746 ) ) ( not ( = ?auto_250744 ?auto_250745 ) ) ( not ( = ?auto_250744 ?auto_250746 ) ) ( not ( = ?auto_250745 ?auto_250746 ) ) ( ON ?auto_250744 ?auto_250745 ) ( ON ?auto_250743 ?auto_250744 ) ( ON ?auto_250742 ?auto_250743 ) ( CLEAR ?auto_250742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250742 )
      ( MAKE-4PILE ?auto_250742 ?auto_250743 ?auto_250744 ?auto_250745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_250761 - BLOCK
      ?auto_250762 - BLOCK
      ?auto_250763 - BLOCK
      ?auto_250764 - BLOCK
      ?auto_250765 - BLOCK
    )
    :vars
    (
      ?auto_250766 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_250764 ) ( ON ?auto_250765 ?auto_250766 ) ( CLEAR ?auto_250765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_250761 ) ( ON ?auto_250762 ?auto_250761 ) ( ON ?auto_250763 ?auto_250762 ) ( ON ?auto_250764 ?auto_250763 ) ( not ( = ?auto_250761 ?auto_250762 ) ) ( not ( = ?auto_250761 ?auto_250763 ) ) ( not ( = ?auto_250761 ?auto_250764 ) ) ( not ( = ?auto_250761 ?auto_250765 ) ) ( not ( = ?auto_250761 ?auto_250766 ) ) ( not ( = ?auto_250762 ?auto_250763 ) ) ( not ( = ?auto_250762 ?auto_250764 ) ) ( not ( = ?auto_250762 ?auto_250765 ) ) ( not ( = ?auto_250762 ?auto_250766 ) ) ( not ( = ?auto_250763 ?auto_250764 ) ) ( not ( = ?auto_250763 ?auto_250765 ) ) ( not ( = ?auto_250763 ?auto_250766 ) ) ( not ( = ?auto_250764 ?auto_250765 ) ) ( not ( = ?auto_250764 ?auto_250766 ) ) ( not ( = ?auto_250765 ?auto_250766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_250765 ?auto_250766 )
      ( !STACK ?auto_250765 ?auto_250764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_250783 - BLOCK
      ?auto_250784 - BLOCK
      ?auto_250785 - BLOCK
      ?auto_250786 - BLOCK
      ?auto_250787 - BLOCK
    )
    :vars
    (
      ?auto_250788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250787 ?auto_250788 ) ( ON-TABLE ?auto_250783 ) ( ON ?auto_250784 ?auto_250783 ) ( ON ?auto_250785 ?auto_250784 ) ( not ( = ?auto_250783 ?auto_250784 ) ) ( not ( = ?auto_250783 ?auto_250785 ) ) ( not ( = ?auto_250783 ?auto_250786 ) ) ( not ( = ?auto_250783 ?auto_250787 ) ) ( not ( = ?auto_250783 ?auto_250788 ) ) ( not ( = ?auto_250784 ?auto_250785 ) ) ( not ( = ?auto_250784 ?auto_250786 ) ) ( not ( = ?auto_250784 ?auto_250787 ) ) ( not ( = ?auto_250784 ?auto_250788 ) ) ( not ( = ?auto_250785 ?auto_250786 ) ) ( not ( = ?auto_250785 ?auto_250787 ) ) ( not ( = ?auto_250785 ?auto_250788 ) ) ( not ( = ?auto_250786 ?auto_250787 ) ) ( not ( = ?auto_250786 ?auto_250788 ) ) ( not ( = ?auto_250787 ?auto_250788 ) ) ( CLEAR ?auto_250785 ) ( ON ?auto_250786 ?auto_250787 ) ( CLEAR ?auto_250786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_250783 ?auto_250784 ?auto_250785 ?auto_250786 )
      ( MAKE-5PILE ?auto_250783 ?auto_250784 ?auto_250785 ?auto_250786 ?auto_250787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_250805 - BLOCK
      ?auto_250806 - BLOCK
      ?auto_250807 - BLOCK
      ?auto_250808 - BLOCK
      ?auto_250809 - BLOCK
    )
    :vars
    (
      ?auto_250810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250809 ?auto_250810 ) ( ON-TABLE ?auto_250805 ) ( ON ?auto_250806 ?auto_250805 ) ( not ( = ?auto_250805 ?auto_250806 ) ) ( not ( = ?auto_250805 ?auto_250807 ) ) ( not ( = ?auto_250805 ?auto_250808 ) ) ( not ( = ?auto_250805 ?auto_250809 ) ) ( not ( = ?auto_250805 ?auto_250810 ) ) ( not ( = ?auto_250806 ?auto_250807 ) ) ( not ( = ?auto_250806 ?auto_250808 ) ) ( not ( = ?auto_250806 ?auto_250809 ) ) ( not ( = ?auto_250806 ?auto_250810 ) ) ( not ( = ?auto_250807 ?auto_250808 ) ) ( not ( = ?auto_250807 ?auto_250809 ) ) ( not ( = ?auto_250807 ?auto_250810 ) ) ( not ( = ?auto_250808 ?auto_250809 ) ) ( not ( = ?auto_250808 ?auto_250810 ) ) ( not ( = ?auto_250809 ?auto_250810 ) ) ( ON ?auto_250808 ?auto_250809 ) ( CLEAR ?auto_250806 ) ( ON ?auto_250807 ?auto_250808 ) ( CLEAR ?auto_250807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_250805 ?auto_250806 ?auto_250807 )
      ( MAKE-5PILE ?auto_250805 ?auto_250806 ?auto_250807 ?auto_250808 ?auto_250809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_250827 - BLOCK
      ?auto_250828 - BLOCK
      ?auto_250829 - BLOCK
      ?auto_250830 - BLOCK
      ?auto_250831 - BLOCK
    )
    :vars
    (
      ?auto_250832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250831 ?auto_250832 ) ( ON-TABLE ?auto_250827 ) ( not ( = ?auto_250827 ?auto_250828 ) ) ( not ( = ?auto_250827 ?auto_250829 ) ) ( not ( = ?auto_250827 ?auto_250830 ) ) ( not ( = ?auto_250827 ?auto_250831 ) ) ( not ( = ?auto_250827 ?auto_250832 ) ) ( not ( = ?auto_250828 ?auto_250829 ) ) ( not ( = ?auto_250828 ?auto_250830 ) ) ( not ( = ?auto_250828 ?auto_250831 ) ) ( not ( = ?auto_250828 ?auto_250832 ) ) ( not ( = ?auto_250829 ?auto_250830 ) ) ( not ( = ?auto_250829 ?auto_250831 ) ) ( not ( = ?auto_250829 ?auto_250832 ) ) ( not ( = ?auto_250830 ?auto_250831 ) ) ( not ( = ?auto_250830 ?auto_250832 ) ) ( not ( = ?auto_250831 ?auto_250832 ) ) ( ON ?auto_250830 ?auto_250831 ) ( ON ?auto_250829 ?auto_250830 ) ( CLEAR ?auto_250827 ) ( ON ?auto_250828 ?auto_250829 ) ( CLEAR ?auto_250828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250827 ?auto_250828 )
      ( MAKE-5PILE ?auto_250827 ?auto_250828 ?auto_250829 ?auto_250830 ?auto_250831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_250849 - BLOCK
      ?auto_250850 - BLOCK
      ?auto_250851 - BLOCK
      ?auto_250852 - BLOCK
      ?auto_250853 - BLOCK
    )
    :vars
    (
      ?auto_250854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250853 ?auto_250854 ) ( not ( = ?auto_250849 ?auto_250850 ) ) ( not ( = ?auto_250849 ?auto_250851 ) ) ( not ( = ?auto_250849 ?auto_250852 ) ) ( not ( = ?auto_250849 ?auto_250853 ) ) ( not ( = ?auto_250849 ?auto_250854 ) ) ( not ( = ?auto_250850 ?auto_250851 ) ) ( not ( = ?auto_250850 ?auto_250852 ) ) ( not ( = ?auto_250850 ?auto_250853 ) ) ( not ( = ?auto_250850 ?auto_250854 ) ) ( not ( = ?auto_250851 ?auto_250852 ) ) ( not ( = ?auto_250851 ?auto_250853 ) ) ( not ( = ?auto_250851 ?auto_250854 ) ) ( not ( = ?auto_250852 ?auto_250853 ) ) ( not ( = ?auto_250852 ?auto_250854 ) ) ( not ( = ?auto_250853 ?auto_250854 ) ) ( ON ?auto_250852 ?auto_250853 ) ( ON ?auto_250851 ?auto_250852 ) ( ON ?auto_250850 ?auto_250851 ) ( ON ?auto_250849 ?auto_250850 ) ( CLEAR ?auto_250849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_250849 )
      ( MAKE-5PILE ?auto_250849 ?auto_250850 ?auto_250851 ?auto_250852 ?auto_250853 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_250872 - BLOCK
      ?auto_250873 - BLOCK
      ?auto_250874 - BLOCK
      ?auto_250875 - BLOCK
      ?auto_250876 - BLOCK
      ?auto_250877 - BLOCK
    )
    :vars
    (
      ?auto_250878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_250876 ) ( ON ?auto_250877 ?auto_250878 ) ( CLEAR ?auto_250877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_250872 ) ( ON ?auto_250873 ?auto_250872 ) ( ON ?auto_250874 ?auto_250873 ) ( ON ?auto_250875 ?auto_250874 ) ( ON ?auto_250876 ?auto_250875 ) ( not ( = ?auto_250872 ?auto_250873 ) ) ( not ( = ?auto_250872 ?auto_250874 ) ) ( not ( = ?auto_250872 ?auto_250875 ) ) ( not ( = ?auto_250872 ?auto_250876 ) ) ( not ( = ?auto_250872 ?auto_250877 ) ) ( not ( = ?auto_250872 ?auto_250878 ) ) ( not ( = ?auto_250873 ?auto_250874 ) ) ( not ( = ?auto_250873 ?auto_250875 ) ) ( not ( = ?auto_250873 ?auto_250876 ) ) ( not ( = ?auto_250873 ?auto_250877 ) ) ( not ( = ?auto_250873 ?auto_250878 ) ) ( not ( = ?auto_250874 ?auto_250875 ) ) ( not ( = ?auto_250874 ?auto_250876 ) ) ( not ( = ?auto_250874 ?auto_250877 ) ) ( not ( = ?auto_250874 ?auto_250878 ) ) ( not ( = ?auto_250875 ?auto_250876 ) ) ( not ( = ?auto_250875 ?auto_250877 ) ) ( not ( = ?auto_250875 ?auto_250878 ) ) ( not ( = ?auto_250876 ?auto_250877 ) ) ( not ( = ?auto_250876 ?auto_250878 ) ) ( not ( = ?auto_250877 ?auto_250878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_250877 ?auto_250878 )
      ( !STACK ?auto_250877 ?auto_250876 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_250898 - BLOCK
      ?auto_250899 - BLOCK
      ?auto_250900 - BLOCK
      ?auto_250901 - BLOCK
      ?auto_250902 - BLOCK
      ?auto_250903 - BLOCK
    )
    :vars
    (
      ?auto_250904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250903 ?auto_250904 ) ( ON-TABLE ?auto_250898 ) ( ON ?auto_250899 ?auto_250898 ) ( ON ?auto_250900 ?auto_250899 ) ( ON ?auto_250901 ?auto_250900 ) ( not ( = ?auto_250898 ?auto_250899 ) ) ( not ( = ?auto_250898 ?auto_250900 ) ) ( not ( = ?auto_250898 ?auto_250901 ) ) ( not ( = ?auto_250898 ?auto_250902 ) ) ( not ( = ?auto_250898 ?auto_250903 ) ) ( not ( = ?auto_250898 ?auto_250904 ) ) ( not ( = ?auto_250899 ?auto_250900 ) ) ( not ( = ?auto_250899 ?auto_250901 ) ) ( not ( = ?auto_250899 ?auto_250902 ) ) ( not ( = ?auto_250899 ?auto_250903 ) ) ( not ( = ?auto_250899 ?auto_250904 ) ) ( not ( = ?auto_250900 ?auto_250901 ) ) ( not ( = ?auto_250900 ?auto_250902 ) ) ( not ( = ?auto_250900 ?auto_250903 ) ) ( not ( = ?auto_250900 ?auto_250904 ) ) ( not ( = ?auto_250901 ?auto_250902 ) ) ( not ( = ?auto_250901 ?auto_250903 ) ) ( not ( = ?auto_250901 ?auto_250904 ) ) ( not ( = ?auto_250902 ?auto_250903 ) ) ( not ( = ?auto_250902 ?auto_250904 ) ) ( not ( = ?auto_250903 ?auto_250904 ) ) ( CLEAR ?auto_250901 ) ( ON ?auto_250902 ?auto_250903 ) ( CLEAR ?auto_250902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_250898 ?auto_250899 ?auto_250900 ?auto_250901 ?auto_250902 )
      ( MAKE-6PILE ?auto_250898 ?auto_250899 ?auto_250900 ?auto_250901 ?auto_250902 ?auto_250903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_250924 - BLOCK
      ?auto_250925 - BLOCK
      ?auto_250926 - BLOCK
      ?auto_250927 - BLOCK
      ?auto_250928 - BLOCK
      ?auto_250929 - BLOCK
    )
    :vars
    (
      ?auto_250930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250929 ?auto_250930 ) ( ON-TABLE ?auto_250924 ) ( ON ?auto_250925 ?auto_250924 ) ( ON ?auto_250926 ?auto_250925 ) ( not ( = ?auto_250924 ?auto_250925 ) ) ( not ( = ?auto_250924 ?auto_250926 ) ) ( not ( = ?auto_250924 ?auto_250927 ) ) ( not ( = ?auto_250924 ?auto_250928 ) ) ( not ( = ?auto_250924 ?auto_250929 ) ) ( not ( = ?auto_250924 ?auto_250930 ) ) ( not ( = ?auto_250925 ?auto_250926 ) ) ( not ( = ?auto_250925 ?auto_250927 ) ) ( not ( = ?auto_250925 ?auto_250928 ) ) ( not ( = ?auto_250925 ?auto_250929 ) ) ( not ( = ?auto_250925 ?auto_250930 ) ) ( not ( = ?auto_250926 ?auto_250927 ) ) ( not ( = ?auto_250926 ?auto_250928 ) ) ( not ( = ?auto_250926 ?auto_250929 ) ) ( not ( = ?auto_250926 ?auto_250930 ) ) ( not ( = ?auto_250927 ?auto_250928 ) ) ( not ( = ?auto_250927 ?auto_250929 ) ) ( not ( = ?auto_250927 ?auto_250930 ) ) ( not ( = ?auto_250928 ?auto_250929 ) ) ( not ( = ?auto_250928 ?auto_250930 ) ) ( not ( = ?auto_250929 ?auto_250930 ) ) ( ON ?auto_250928 ?auto_250929 ) ( CLEAR ?auto_250926 ) ( ON ?auto_250927 ?auto_250928 ) ( CLEAR ?auto_250927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_250924 ?auto_250925 ?auto_250926 ?auto_250927 )
      ( MAKE-6PILE ?auto_250924 ?auto_250925 ?auto_250926 ?auto_250927 ?auto_250928 ?auto_250929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_250950 - BLOCK
      ?auto_250951 - BLOCK
      ?auto_250952 - BLOCK
      ?auto_250953 - BLOCK
      ?auto_250954 - BLOCK
      ?auto_250955 - BLOCK
    )
    :vars
    (
      ?auto_250956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250955 ?auto_250956 ) ( ON-TABLE ?auto_250950 ) ( ON ?auto_250951 ?auto_250950 ) ( not ( = ?auto_250950 ?auto_250951 ) ) ( not ( = ?auto_250950 ?auto_250952 ) ) ( not ( = ?auto_250950 ?auto_250953 ) ) ( not ( = ?auto_250950 ?auto_250954 ) ) ( not ( = ?auto_250950 ?auto_250955 ) ) ( not ( = ?auto_250950 ?auto_250956 ) ) ( not ( = ?auto_250951 ?auto_250952 ) ) ( not ( = ?auto_250951 ?auto_250953 ) ) ( not ( = ?auto_250951 ?auto_250954 ) ) ( not ( = ?auto_250951 ?auto_250955 ) ) ( not ( = ?auto_250951 ?auto_250956 ) ) ( not ( = ?auto_250952 ?auto_250953 ) ) ( not ( = ?auto_250952 ?auto_250954 ) ) ( not ( = ?auto_250952 ?auto_250955 ) ) ( not ( = ?auto_250952 ?auto_250956 ) ) ( not ( = ?auto_250953 ?auto_250954 ) ) ( not ( = ?auto_250953 ?auto_250955 ) ) ( not ( = ?auto_250953 ?auto_250956 ) ) ( not ( = ?auto_250954 ?auto_250955 ) ) ( not ( = ?auto_250954 ?auto_250956 ) ) ( not ( = ?auto_250955 ?auto_250956 ) ) ( ON ?auto_250954 ?auto_250955 ) ( ON ?auto_250953 ?auto_250954 ) ( CLEAR ?auto_250951 ) ( ON ?auto_250952 ?auto_250953 ) ( CLEAR ?auto_250952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_250950 ?auto_250951 ?auto_250952 )
      ( MAKE-6PILE ?auto_250950 ?auto_250951 ?auto_250952 ?auto_250953 ?auto_250954 ?auto_250955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_250976 - BLOCK
      ?auto_250977 - BLOCK
      ?auto_250978 - BLOCK
      ?auto_250979 - BLOCK
      ?auto_250980 - BLOCK
      ?auto_250981 - BLOCK
    )
    :vars
    (
      ?auto_250982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250981 ?auto_250982 ) ( ON-TABLE ?auto_250976 ) ( not ( = ?auto_250976 ?auto_250977 ) ) ( not ( = ?auto_250976 ?auto_250978 ) ) ( not ( = ?auto_250976 ?auto_250979 ) ) ( not ( = ?auto_250976 ?auto_250980 ) ) ( not ( = ?auto_250976 ?auto_250981 ) ) ( not ( = ?auto_250976 ?auto_250982 ) ) ( not ( = ?auto_250977 ?auto_250978 ) ) ( not ( = ?auto_250977 ?auto_250979 ) ) ( not ( = ?auto_250977 ?auto_250980 ) ) ( not ( = ?auto_250977 ?auto_250981 ) ) ( not ( = ?auto_250977 ?auto_250982 ) ) ( not ( = ?auto_250978 ?auto_250979 ) ) ( not ( = ?auto_250978 ?auto_250980 ) ) ( not ( = ?auto_250978 ?auto_250981 ) ) ( not ( = ?auto_250978 ?auto_250982 ) ) ( not ( = ?auto_250979 ?auto_250980 ) ) ( not ( = ?auto_250979 ?auto_250981 ) ) ( not ( = ?auto_250979 ?auto_250982 ) ) ( not ( = ?auto_250980 ?auto_250981 ) ) ( not ( = ?auto_250980 ?auto_250982 ) ) ( not ( = ?auto_250981 ?auto_250982 ) ) ( ON ?auto_250980 ?auto_250981 ) ( ON ?auto_250979 ?auto_250980 ) ( ON ?auto_250978 ?auto_250979 ) ( CLEAR ?auto_250976 ) ( ON ?auto_250977 ?auto_250978 ) ( CLEAR ?auto_250977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_250976 ?auto_250977 )
      ( MAKE-6PILE ?auto_250976 ?auto_250977 ?auto_250978 ?auto_250979 ?auto_250980 ?auto_250981 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_251002 - BLOCK
      ?auto_251003 - BLOCK
      ?auto_251004 - BLOCK
      ?auto_251005 - BLOCK
      ?auto_251006 - BLOCK
      ?auto_251007 - BLOCK
    )
    :vars
    (
      ?auto_251008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251007 ?auto_251008 ) ( not ( = ?auto_251002 ?auto_251003 ) ) ( not ( = ?auto_251002 ?auto_251004 ) ) ( not ( = ?auto_251002 ?auto_251005 ) ) ( not ( = ?auto_251002 ?auto_251006 ) ) ( not ( = ?auto_251002 ?auto_251007 ) ) ( not ( = ?auto_251002 ?auto_251008 ) ) ( not ( = ?auto_251003 ?auto_251004 ) ) ( not ( = ?auto_251003 ?auto_251005 ) ) ( not ( = ?auto_251003 ?auto_251006 ) ) ( not ( = ?auto_251003 ?auto_251007 ) ) ( not ( = ?auto_251003 ?auto_251008 ) ) ( not ( = ?auto_251004 ?auto_251005 ) ) ( not ( = ?auto_251004 ?auto_251006 ) ) ( not ( = ?auto_251004 ?auto_251007 ) ) ( not ( = ?auto_251004 ?auto_251008 ) ) ( not ( = ?auto_251005 ?auto_251006 ) ) ( not ( = ?auto_251005 ?auto_251007 ) ) ( not ( = ?auto_251005 ?auto_251008 ) ) ( not ( = ?auto_251006 ?auto_251007 ) ) ( not ( = ?auto_251006 ?auto_251008 ) ) ( not ( = ?auto_251007 ?auto_251008 ) ) ( ON ?auto_251006 ?auto_251007 ) ( ON ?auto_251005 ?auto_251006 ) ( ON ?auto_251004 ?auto_251005 ) ( ON ?auto_251003 ?auto_251004 ) ( ON ?auto_251002 ?auto_251003 ) ( CLEAR ?auto_251002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_251002 )
      ( MAKE-6PILE ?auto_251002 ?auto_251003 ?auto_251004 ?auto_251005 ?auto_251006 ?auto_251007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_251029 - BLOCK
      ?auto_251030 - BLOCK
      ?auto_251031 - BLOCK
      ?auto_251032 - BLOCK
      ?auto_251033 - BLOCK
      ?auto_251034 - BLOCK
      ?auto_251035 - BLOCK
    )
    :vars
    (
      ?auto_251036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_251034 ) ( ON ?auto_251035 ?auto_251036 ) ( CLEAR ?auto_251035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_251029 ) ( ON ?auto_251030 ?auto_251029 ) ( ON ?auto_251031 ?auto_251030 ) ( ON ?auto_251032 ?auto_251031 ) ( ON ?auto_251033 ?auto_251032 ) ( ON ?auto_251034 ?auto_251033 ) ( not ( = ?auto_251029 ?auto_251030 ) ) ( not ( = ?auto_251029 ?auto_251031 ) ) ( not ( = ?auto_251029 ?auto_251032 ) ) ( not ( = ?auto_251029 ?auto_251033 ) ) ( not ( = ?auto_251029 ?auto_251034 ) ) ( not ( = ?auto_251029 ?auto_251035 ) ) ( not ( = ?auto_251029 ?auto_251036 ) ) ( not ( = ?auto_251030 ?auto_251031 ) ) ( not ( = ?auto_251030 ?auto_251032 ) ) ( not ( = ?auto_251030 ?auto_251033 ) ) ( not ( = ?auto_251030 ?auto_251034 ) ) ( not ( = ?auto_251030 ?auto_251035 ) ) ( not ( = ?auto_251030 ?auto_251036 ) ) ( not ( = ?auto_251031 ?auto_251032 ) ) ( not ( = ?auto_251031 ?auto_251033 ) ) ( not ( = ?auto_251031 ?auto_251034 ) ) ( not ( = ?auto_251031 ?auto_251035 ) ) ( not ( = ?auto_251031 ?auto_251036 ) ) ( not ( = ?auto_251032 ?auto_251033 ) ) ( not ( = ?auto_251032 ?auto_251034 ) ) ( not ( = ?auto_251032 ?auto_251035 ) ) ( not ( = ?auto_251032 ?auto_251036 ) ) ( not ( = ?auto_251033 ?auto_251034 ) ) ( not ( = ?auto_251033 ?auto_251035 ) ) ( not ( = ?auto_251033 ?auto_251036 ) ) ( not ( = ?auto_251034 ?auto_251035 ) ) ( not ( = ?auto_251034 ?auto_251036 ) ) ( not ( = ?auto_251035 ?auto_251036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_251035 ?auto_251036 )
      ( !STACK ?auto_251035 ?auto_251034 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_251059 - BLOCK
      ?auto_251060 - BLOCK
      ?auto_251061 - BLOCK
      ?auto_251062 - BLOCK
      ?auto_251063 - BLOCK
      ?auto_251064 - BLOCK
      ?auto_251065 - BLOCK
    )
    :vars
    (
      ?auto_251066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251065 ?auto_251066 ) ( ON-TABLE ?auto_251059 ) ( ON ?auto_251060 ?auto_251059 ) ( ON ?auto_251061 ?auto_251060 ) ( ON ?auto_251062 ?auto_251061 ) ( ON ?auto_251063 ?auto_251062 ) ( not ( = ?auto_251059 ?auto_251060 ) ) ( not ( = ?auto_251059 ?auto_251061 ) ) ( not ( = ?auto_251059 ?auto_251062 ) ) ( not ( = ?auto_251059 ?auto_251063 ) ) ( not ( = ?auto_251059 ?auto_251064 ) ) ( not ( = ?auto_251059 ?auto_251065 ) ) ( not ( = ?auto_251059 ?auto_251066 ) ) ( not ( = ?auto_251060 ?auto_251061 ) ) ( not ( = ?auto_251060 ?auto_251062 ) ) ( not ( = ?auto_251060 ?auto_251063 ) ) ( not ( = ?auto_251060 ?auto_251064 ) ) ( not ( = ?auto_251060 ?auto_251065 ) ) ( not ( = ?auto_251060 ?auto_251066 ) ) ( not ( = ?auto_251061 ?auto_251062 ) ) ( not ( = ?auto_251061 ?auto_251063 ) ) ( not ( = ?auto_251061 ?auto_251064 ) ) ( not ( = ?auto_251061 ?auto_251065 ) ) ( not ( = ?auto_251061 ?auto_251066 ) ) ( not ( = ?auto_251062 ?auto_251063 ) ) ( not ( = ?auto_251062 ?auto_251064 ) ) ( not ( = ?auto_251062 ?auto_251065 ) ) ( not ( = ?auto_251062 ?auto_251066 ) ) ( not ( = ?auto_251063 ?auto_251064 ) ) ( not ( = ?auto_251063 ?auto_251065 ) ) ( not ( = ?auto_251063 ?auto_251066 ) ) ( not ( = ?auto_251064 ?auto_251065 ) ) ( not ( = ?auto_251064 ?auto_251066 ) ) ( not ( = ?auto_251065 ?auto_251066 ) ) ( CLEAR ?auto_251063 ) ( ON ?auto_251064 ?auto_251065 ) ( CLEAR ?auto_251064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_251059 ?auto_251060 ?auto_251061 ?auto_251062 ?auto_251063 ?auto_251064 )
      ( MAKE-7PILE ?auto_251059 ?auto_251060 ?auto_251061 ?auto_251062 ?auto_251063 ?auto_251064 ?auto_251065 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_251089 - BLOCK
      ?auto_251090 - BLOCK
      ?auto_251091 - BLOCK
      ?auto_251092 - BLOCK
      ?auto_251093 - BLOCK
      ?auto_251094 - BLOCK
      ?auto_251095 - BLOCK
    )
    :vars
    (
      ?auto_251096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251095 ?auto_251096 ) ( ON-TABLE ?auto_251089 ) ( ON ?auto_251090 ?auto_251089 ) ( ON ?auto_251091 ?auto_251090 ) ( ON ?auto_251092 ?auto_251091 ) ( not ( = ?auto_251089 ?auto_251090 ) ) ( not ( = ?auto_251089 ?auto_251091 ) ) ( not ( = ?auto_251089 ?auto_251092 ) ) ( not ( = ?auto_251089 ?auto_251093 ) ) ( not ( = ?auto_251089 ?auto_251094 ) ) ( not ( = ?auto_251089 ?auto_251095 ) ) ( not ( = ?auto_251089 ?auto_251096 ) ) ( not ( = ?auto_251090 ?auto_251091 ) ) ( not ( = ?auto_251090 ?auto_251092 ) ) ( not ( = ?auto_251090 ?auto_251093 ) ) ( not ( = ?auto_251090 ?auto_251094 ) ) ( not ( = ?auto_251090 ?auto_251095 ) ) ( not ( = ?auto_251090 ?auto_251096 ) ) ( not ( = ?auto_251091 ?auto_251092 ) ) ( not ( = ?auto_251091 ?auto_251093 ) ) ( not ( = ?auto_251091 ?auto_251094 ) ) ( not ( = ?auto_251091 ?auto_251095 ) ) ( not ( = ?auto_251091 ?auto_251096 ) ) ( not ( = ?auto_251092 ?auto_251093 ) ) ( not ( = ?auto_251092 ?auto_251094 ) ) ( not ( = ?auto_251092 ?auto_251095 ) ) ( not ( = ?auto_251092 ?auto_251096 ) ) ( not ( = ?auto_251093 ?auto_251094 ) ) ( not ( = ?auto_251093 ?auto_251095 ) ) ( not ( = ?auto_251093 ?auto_251096 ) ) ( not ( = ?auto_251094 ?auto_251095 ) ) ( not ( = ?auto_251094 ?auto_251096 ) ) ( not ( = ?auto_251095 ?auto_251096 ) ) ( ON ?auto_251094 ?auto_251095 ) ( CLEAR ?auto_251092 ) ( ON ?auto_251093 ?auto_251094 ) ( CLEAR ?auto_251093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_251089 ?auto_251090 ?auto_251091 ?auto_251092 ?auto_251093 )
      ( MAKE-7PILE ?auto_251089 ?auto_251090 ?auto_251091 ?auto_251092 ?auto_251093 ?auto_251094 ?auto_251095 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_251119 - BLOCK
      ?auto_251120 - BLOCK
      ?auto_251121 - BLOCK
      ?auto_251122 - BLOCK
      ?auto_251123 - BLOCK
      ?auto_251124 - BLOCK
      ?auto_251125 - BLOCK
    )
    :vars
    (
      ?auto_251126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251125 ?auto_251126 ) ( ON-TABLE ?auto_251119 ) ( ON ?auto_251120 ?auto_251119 ) ( ON ?auto_251121 ?auto_251120 ) ( not ( = ?auto_251119 ?auto_251120 ) ) ( not ( = ?auto_251119 ?auto_251121 ) ) ( not ( = ?auto_251119 ?auto_251122 ) ) ( not ( = ?auto_251119 ?auto_251123 ) ) ( not ( = ?auto_251119 ?auto_251124 ) ) ( not ( = ?auto_251119 ?auto_251125 ) ) ( not ( = ?auto_251119 ?auto_251126 ) ) ( not ( = ?auto_251120 ?auto_251121 ) ) ( not ( = ?auto_251120 ?auto_251122 ) ) ( not ( = ?auto_251120 ?auto_251123 ) ) ( not ( = ?auto_251120 ?auto_251124 ) ) ( not ( = ?auto_251120 ?auto_251125 ) ) ( not ( = ?auto_251120 ?auto_251126 ) ) ( not ( = ?auto_251121 ?auto_251122 ) ) ( not ( = ?auto_251121 ?auto_251123 ) ) ( not ( = ?auto_251121 ?auto_251124 ) ) ( not ( = ?auto_251121 ?auto_251125 ) ) ( not ( = ?auto_251121 ?auto_251126 ) ) ( not ( = ?auto_251122 ?auto_251123 ) ) ( not ( = ?auto_251122 ?auto_251124 ) ) ( not ( = ?auto_251122 ?auto_251125 ) ) ( not ( = ?auto_251122 ?auto_251126 ) ) ( not ( = ?auto_251123 ?auto_251124 ) ) ( not ( = ?auto_251123 ?auto_251125 ) ) ( not ( = ?auto_251123 ?auto_251126 ) ) ( not ( = ?auto_251124 ?auto_251125 ) ) ( not ( = ?auto_251124 ?auto_251126 ) ) ( not ( = ?auto_251125 ?auto_251126 ) ) ( ON ?auto_251124 ?auto_251125 ) ( ON ?auto_251123 ?auto_251124 ) ( CLEAR ?auto_251121 ) ( ON ?auto_251122 ?auto_251123 ) ( CLEAR ?auto_251122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_251119 ?auto_251120 ?auto_251121 ?auto_251122 )
      ( MAKE-7PILE ?auto_251119 ?auto_251120 ?auto_251121 ?auto_251122 ?auto_251123 ?auto_251124 ?auto_251125 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_251149 - BLOCK
      ?auto_251150 - BLOCK
      ?auto_251151 - BLOCK
      ?auto_251152 - BLOCK
      ?auto_251153 - BLOCK
      ?auto_251154 - BLOCK
      ?auto_251155 - BLOCK
    )
    :vars
    (
      ?auto_251156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251155 ?auto_251156 ) ( ON-TABLE ?auto_251149 ) ( ON ?auto_251150 ?auto_251149 ) ( not ( = ?auto_251149 ?auto_251150 ) ) ( not ( = ?auto_251149 ?auto_251151 ) ) ( not ( = ?auto_251149 ?auto_251152 ) ) ( not ( = ?auto_251149 ?auto_251153 ) ) ( not ( = ?auto_251149 ?auto_251154 ) ) ( not ( = ?auto_251149 ?auto_251155 ) ) ( not ( = ?auto_251149 ?auto_251156 ) ) ( not ( = ?auto_251150 ?auto_251151 ) ) ( not ( = ?auto_251150 ?auto_251152 ) ) ( not ( = ?auto_251150 ?auto_251153 ) ) ( not ( = ?auto_251150 ?auto_251154 ) ) ( not ( = ?auto_251150 ?auto_251155 ) ) ( not ( = ?auto_251150 ?auto_251156 ) ) ( not ( = ?auto_251151 ?auto_251152 ) ) ( not ( = ?auto_251151 ?auto_251153 ) ) ( not ( = ?auto_251151 ?auto_251154 ) ) ( not ( = ?auto_251151 ?auto_251155 ) ) ( not ( = ?auto_251151 ?auto_251156 ) ) ( not ( = ?auto_251152 ?auto_251153 ) ) ( not ( = ?auto_251152 ?auto_251154 ) ) ( not ( = ?auto_251152 ?auto_251155 ) ) ( not ( = ?auto_251152 ?auto_251156 ) ) ( not ( = ?auto_251153 ?auto_251154 ) ) ( not ( = ?auto_251153 ?auto_251155 ) ) ( not ( = ?auto_251153 ?auto_251156 ) ) ( not ( = ?auto_251154 ?auto_251155 ) ) ( not ( = ?auto_251154 ?auto_251156 ) ) ( not ( = ?auto_251155 ?auto_251156 ) ) ( ON ?auto_251154 ?auto_251155 ) ( ON ?auto_251153 ?auto_251154 ) ( ON ?auto_251152 ?auto_251153 ) ( CLEAR ?auto_251150 ) ( ON ?auto_251151 ?auto_251152 ) ( CLEAR ?auto_251151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_251149 ?auto_251150 ?auto_251151 )
      ( MAKE-7PILE ?auto_251149 ?auto_251150 ?auto_251151 ?auto_251152 ?auto_251153 ?auto_251154 ?auto_251155 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_251179 - BLOCK
      ?auto_251180 - BLOCK
      ?auto_251181 - BLOCK
      ?auto_251182 - BLOCK
      ?auto_251183 - BLOCK
      ?auto_251184 - BLOCK
      ?auto_251185 - BLOCK
    )
    :vars
    (
      ?auto_251186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251185 ?auto_251186 ) ( ON-TABLE ?auto_251179 ) ( not ( = ?auto_251179 ?auto_251180 ) ) ( not ( = ?auto_251179 ?auto_251181 ) ) ( not ( = ?auto_251179 ?auto_251182 ) ) ( not ( = ?auto_251179 ?auto_251183 ) ) ( not ( = ?auto_251179 ?auto_251184 ) ) ( not ( = ?auto_251179 ?auto_251185 ) ) ( not ( = ?auto_251179 ?auto_251186 ) ) ( not ( = ?auto_251180 ?auto_251181 ) ) ( not ( = ?auto_251180 ?auto_251182 ) ) ( not ( = ?auto_251180 ?auto_251183 ) ) ( not ( = ?auto_251180 ?auto_251184 ) ) ( not ( = ?auto_251180 ?auto_251185 ) ) ( not ( = ?auto_251180 ?auto_251186 ) ) ( not ( = ?auto_251181 ?auto_251182 ) ) ( not ( = ?auto_251181 ?auto_251183 ) ) ( not ( = ?auto_251181 ?auto_251184 ) ) ( not ( = ?auto_251181 ?auto_251185 ) ) ( not ( = ?auto_251181 ?auto_251186 ) ) ( not ( = ?auto_251182 ?auto_251183 ) ) ( not ( = ?auto_251182 ?auto_251184 ) ) ( not ( = ?auto_251182 ?auto_251185 ) ) ( not ( = ?auto_251182 ?auto_251186 ) ) ( not ( = ?auto_251183 ?auto_251184 ) ) ( not ( = ?auto_251183 ?auto_251185 ) ) ( not ( = ?auto_251183 ?auto_251186 ) ) ( not ( = ?auto_251184 ?auto_251185 ) ) ( not ( = ?auto_251184 ?auto_251186 ) ) ( not ( = ?auto_251185 ?auto_251186 ) ) ( ON ?auto_251184 ?auto_251185 ) ( ON ?auto_251183 ?auto_251184 ) ( ON ?auto_251182 ?auto_251183 ) ( ON ?auto_251181 ?auto_251182 ) ( CLEAR ?auto_251179 ) ( ON ?auto_251180 ?auto_251181 ) ( CLEAR ?auto_251180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_251179 ?auto_251180 )
      ( MAKE-7PILE ?auto_251179 ?auto_251180 ?auto_251181 ?auto_251182 ?auto_251183 ?auto_251184 ?auto_251185 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_251209 - BLOCK
      ?auto_251210 - BLOCK
      ?auto_251211 - BLOCK
      ?auto_251212 - BLOCK
      ?auto_251213 - BLOCK
      ?auto_251214 - BLOCK
      ?auto_251215 - BLOCK
    )
    :vars
    (
      ?auto_251216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251215 ?auto_251216 ) ( not ( = ?auto_251209 ?auto_251210 ) ) ( not ( = ?auto_251209 ?auto_251211 ) ) ( not ( = ?auto_251209 ?auto_251212 ) ) ( not ( = ?auto_251209 ?auto_251213 ) ) ( not ( = ?auto_251209 ?auto_251214 ) ) ( not ( = ?auto_251209 ?auto_251215 ) ) ( not ( = ?auto_251209 ?auto_251216 ) ) ( not ( = ?auto_251210 ?auto_251211 ) ) ( not ( = ?auto_251210 ?auto_251212 ) ) ( not ( = ?auto_251210 ?auto_251213 ) ) ( not ( = ?auto_251210 ?auto_251214 ) ) ( not ( = ?auto_251210 ?auto_251215 ) ) ( not ( = ?auto_251210 ?auto_251216 ) ) ( not ( = ?auto_251211 ?auto_251212 ) ) ( not ( = ?auto_251211 ?auto_251213 ) ) ( not ( = ?auto_251211 ?auto_251214 ) ) ( not ( = ?auto_251211 ?auto_251215 ) ) ( not ( = ?auto_251211 ?auto_251216 ) ) ( not ( = ?auto_251212 ?auto_251213 ) ) ( not ( = ?auto_251212 ?auto_251214 ) ) ( not ( = ?auto_251212 ?auto_251215 ) ) ( not ( = ?auto_251212 ?auto_251216 ) ) ( not ( = ?auto_251213 ?auto_251214 ) ) ( not ( = ?auto_251213 ?auto_251215 ) ) ( not ( = ?auto_251213 ?auto_251216 ) ) ( not ( = ?auto_251214 ?auto_251215 ) ) ( not ( = ?auto_251214 ?auto_251216 ) ) ( not ( = ?auto_251215 ?auto_251216 ) ) ( ON ?auto_251214 ?auto_251215 ) ( ON ?auto_251213 ?auto_251214 ) ( ON ?auto_251212 ?auto_251213 ) ( ON ?auto_251211 ?auto_251212 ) ( ON ?auto_251210 ?auto_251211 ) ( ON ?auto_251209 ?auto_251210 ) ( CLEAR ?auto_251209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_251209 )
      ( MAKE-7PILE ?auto_251209 ?auto_251210 ?auto_251211 ?auto_251212 ?auto_251213 ?auto_251214 ?auto_251215 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251240 - BLOCK
      ?auto_251241 - BLOCK
      ?auto_251242 - BLOCK
      ?auto_251243 - BLOCK
      ?auto_251244 - BLOCK
      ?auto_251245 - BLOCK
      ?auto_251246 - BLOCK
      ?auto_251247 - BLOCK
    )
    :vars
    (
      ?auto_251248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_251246 ) ( ON ?auto_251247 ?auto_251248 ) ( CLEAR ?auto_251247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_251240 ) ( ON ?auto_251241 ?auto_251240 ) ( ON ?auto_251242 ?auto_251241 ) ( ON ?auto_251243 ?auto_251242 ) ( ON ?auto_251244 ?auto_251243 ) ( ON ?auto_251245 ?auto_251244 ) ( ON ?auto_251246 ?auto_251245 ) ( not ( = ?auto_251240 ?auto_251241 ) ) ( not ( = ?auto_251240 ?auto_251242 ) ) ( not ( = ?auto_251240 ?auto_251243 ) ) ( not ( = ?auto_251240 ?auto_251244 ) ) ( not ( = ?auto_251240 ?auto_251245 ) ) ( not ( = ?auto_251240 ?auto_251246 ) ) ( not ( = ?auto_251240 ?auto_251247 ) ) ( not ( = ?auto_251240 ?auto_251248 ) ) ( not ( = ?auto_251241 ?auto_251242 ) ) ( not ( = ?auto_251241 ?auto_251243 ) ) ( not ( = ?auto_251241 ?auto_251244 ) ) ( not ( = ?auto_251241 ?auto_251245 ) ) ( not ( = ?auto_251241 ?auto_251246 ) ) ( not ( = ?auto_251241 ?auto_251247 ) ) ( not ( = ?auto_251241 ?auto_251248 ) ) ( not ( = ?auto_251242 ?auto_251243 ) ) ( not ( = ?auto_251242 ?auto_251244 ) ) ( not ( = ?auto_251242 ?auto_251245 ) ) ( not ( = ?auto_251242 ?auto_251246 ) ) ( not ( = ?auto_251242 ?auto_251247 ) ) ( not ( = ?auto_251242 ?auto_251248 ) ) ( not ( = ?auto_251243 ?auto_251244 ) ) ( not ( = ?auto_251243 ?auto_251245 ) ) ( not ( = ?auto_251243 ?auto_251246 ) ) ( not ( = ?auto_251243 ?auto_251247 ) ) ( not ( = ?auto_251243 ?auto_251248 ) ) ( not ( = ?auto_251244 ?auto_251245 ) ) ( not ( = ?auto_251244 ?auto_251246 ) ) ( not ( = ?auto_251244 ?auto_251247 ) ) ( not ( = ?auto_251244 ?auto_251248 ) ) ( not ( = ?auto_251245 ?auto_251246 ) ) ( not ( = ?auto_251245 ?auto_251247 ) ) ( not ( = ?auto_251245 ?auto_251248 ) ) ( not ( = ?auto_251246 ?auto_251247 ) ) ( not ( = ?auto_251246 ?auto_251248 ) ) ( not ( = ?auto_251247 ?auto_251248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_251247 ?auto_251248 )
      ( !STACK ?auto_251247 ?auto_251246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251274 - BLOCK
      ?auto_251275 - BLOCK
      ?auto_251276 - BLOCK
      ?auto_251277 - BLOCK
      ?auto_251278 - BLOCK
      ?auto_251279 - BLOCK
      ?auto_251280 - BLOCK
      ?auto_251281 - BLOCK
    )
    :vars
    (
      ?auto_251282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251281 ?auto_251282 ) ( ON-TABLE ?auto_251274 ) ( ON ?auto_251275 ?auto_251274 ) ( ON ?auto_251276 ?auto_251275 ) ( ON ?auto_251277 ?auto_251276 ) ( ON ?auto_251278 ?auto_251277 ) ( ON ?auto_251279 ?auto_251278 ) ( not ( = ?auto_251274 ?auto_251275 ) ) ( not ( = ?auto_251274 ?auto_251276 ) ) ( not ( = ?auto_251274 ?auto_251277 ) ) ( not ( = ?auto_251274 ?auto_251278 ) ) ( not ( = ?auto_251274 ?auto_251279 ) ) ( not ( = ?auto_251274 ?auto_251280 ) ) ( not ( = ?auto_251274 ?auto_251281 ) ) ( not ( = ?auto_251274 ?auto_251282 ) ) ( not ( = ?auto_251275 ?auto_251276 ) ) ( not ( = ?auto_251275 ?auto_251277 ) ) ( not ( = ?auto_251275 ?auto_251278 ) ) ( not ( = ?auto_251275 ?auto_251279 ) ) ( not ( = ?auto_251275 ?auto_251280 ) ) ( not ( = ?auto_251275 ?auto_251281 ) ) ( not ( = ?auto_251275 ?auto_251282 ) ) ( not ( = ?auto_251276 ?auto_251277 ) ) ( not ( = ?auto_251276 ?auto_251278 ) ) ( not ( = ?auto_251276 ?auto_251279 ) ) ( not ( = ?auto_251276 ?auto_251280 ) ) ( not ( = ?auto_251276 ?auto_251281 ) ) ( not ( = ?auto_251276 ?auto_251282 ) ) ( not ( = ?auto_251277 ?auto_251278 ) ) ( not ( = ?auto_251277 ?auto_251279 ) ) ( not ( = ?auto_251277 ?auto_251280 ) ) ( not ( = ?auto_251277 ?auto_251281 ) ) ( not ( = ?auto_251277 ?auto_251282 ) ) ( not ( = ?auto_251278 ?auto_251279 ) ) ( not ( = ?auto_251278 ?auto_251280 ) ) ( not ( = ?auto_251278 ?auto_251281 ) ) ( not ( = ?auto_251278 ?auto_251282 ) ) ( not ( = ?auto_251279 ?auto_251280 ) ) ( not ( = ?auto_251279 ?auto_251281 ) ) ( not ( = ?auto_251279 ?auto_251282 ) ) ( not ( = ?auto_251280 ?auto_251281 ) ) ( not ( = ?auto_251280 ?auto_251282 ) ) ( not ( = ?auto_251281 ?auto_251282 ) ) ( CLEAR ?auto_251279 ) ( ON ?auto_251280 ?auto_251281 ) ( CLEAR ?auto_251280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_251274 ?auto_251275 ?auto_251276 ?auto_251277 ?auto_251278 ?auto_251279 ?auto_251280 )
      ( MAKE-8PILE ?auto_251274 ?auto_251275 ?auto_251276 ?auto_251277 ?auto_251278 ?auto_251279 ?auto_251280 ?auto_251281 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251308 - BLOCK
      ?auto_251309 - BLOCK
      ?auto_251310 - BLOCK
      ?auto_251311 - BLOCK
      ?auto_251312 - BLOCK
      ?auto_251313 - BLOCK
      ?auto_251314 - BLOCK
      ?auto_251315 - BLOCK
    )
    :vars
    (
      ?auto_251316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251315 ?auto_251316 ) ( ON-TABLE ?auto_251308 ) ( ON ?auto_251309 ?auto_251308 ) ( ON ?auto_251310 ?auto_251309 ) ( ON ?auto_251311 ?auto_251310 ) ( ON ?auto_251312 ?auto_251311 ) ( not ( = ?auto_251308 ?auto_251309 ) ) ( not ( = ?auto_251308 ?auto_251310 ) ) ( not ( = ?auto_251308 ?auto_251311 ) ) ( not ( = ?auto_251308 ?auto_251312 ) ) ( not ( = ?auto_251308 ?auto_251313 ) ) ( not ( = ?auto_251308 ?auto_251314 ) ) ( not ( = ?auto_251308 ?auto_251315 ) ) ( not ( = ?auto_251308 ?auto_251316 ) ) ( not ( = ?auto_251309 ?auto_251310 ) ) ( not ( = ?auto_251309 ?auto_251311 ) ) ( not ( = ?auto_251309 ?auto_251312 ) ) ( not ( = ?auto_251309 ?auto_251313 ) ) ( not ( = ?auto_251309 ?auto_251314 ) ) ( not ( = ?auto_251309 ?auto_251315 ) ) ( not ( = ?auto_251309 ?auto_251316 ) ) ( not ( = ?auto_251310 ?auto_251311 ) ) ( not ( = ?auto_251310 ?auto_251312 ) ) ( not ( = ?auto_251310 ?auto_251313 ) ) ( not ( = ?auto_251310 ?auto_251314 ) ) ( not ( = ?auto_251310 ?auto_251315 ) ) ( not ( = ?auto_251310 ?auto_251316 ) ) ( not ( = ?auto_251311 ?auto_251312 ) ) ( not ( = ?auto_251311 ?auto_251313 ) ) ( not ( = ?auto_251311 ?auto_251314 ) ) ( not ( = ?auto_251311 ?auto_251315 ) ) ( not ( = ?auto_251311 ?auto_251316 ) ) ( not ( = ?auto_251312 ?auto_251313 ) ) ( not ( = ?auto_251312 ?auto_251314 ) ) ( not ( = ?auto_251312 ?auto_251315 ) ) ( not ( = ?auto_251312 ?auto_251316 ) ) ( not ( = ?auto_251313 ?auto_251314 ) ) ( not ( = ?auto_251313 ?auto_251315 ) ) ( not ( = ?auto_251313 ?auto_251316 ) ) ( not ( = ?auto_251314 ?auto_251315 ) ) ( not ( = ?auto_251314 ?auto_251316 ) ) ( not ( = ?auto_251315 ?auto_251316 ) ) ( ON ?auto_251314 ?auto_251315 ) ( CLEAR ?auto_251312 ) ( ON ?auto_251313 ?auto_251314 ) ( CLEAR ?auto_251313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_251308 ?auto_251309 ?auto_251310 ?auto_251311 ?auto_251312 ?auto_251313 )
      ( MAKE-8PILE ?auto_251308 ?auto_251309 ?auto_251310 ?auto_251311 ?auto_251312 ?auto_251313 ?auto_251314 ?auto_251315 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251342 - BLOCK
      ?auto_251343 - BLOCK
      ?auto_251344 - BLOCK
      ?auto_251345 - BLOCK
      ?auto_251346 - BLOCK
      ?auto_251347 - BLOCK
      ?auto_251348 - BLOCK
      ?auto_251349 - BLOCK
    )
    :vars
    (
      ?auto_251350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251349 ?auto_251350 ) ( ON-TABLE ?auto_251342 ) ( ON ?auto_251343 ?auto_251342 ) ( ON ?auto_251344 ?auto_251343 ) ( ON ?auto_251345 ?auto_251344 ) ( not ( = ?auto_251342 ?auto_251343 ) ) ( not ( = ?auto_251342 ?auto_251344 ) ) ( not ( = ?auto_251342 ?auto_251345 ) ) ( not ( = ?auto_251342 ?auto_251346 ) ) ( not ( = ?auto_251342 ?auto_251347 ) ) ( not ( = ?auto_251342 ?auto_251348 ) ) ( not ( = ?auto_251342 ?auto_251349 ) ) ( not ( = ?auto_251342 ?auto_251350 ) ) ( not ( = ?auto_251343 ?auto_251344 ) ) ( not ( = ?auto_251343 ?auto_251345 ) ) ( not ( = ?auto_251343 ?auto_251346 ) ) ( not ( = ?auto_251343 ?auto_251347 ) ) ( not ( = ?auto_251343 ?auto_251348 ) ) ( not ( = ?auto_251343 ?auto_251349 ) ) ( not ( = ?auto_251343 ?auto_251350 ) ) ( not ( = ?auto_251344 ?auto_251345 ) ) ( not ( = ?auto_251344 ?auto_251346 ) ) ( not ( = ?auto_251344 ?auto_251347 ) ) ( not ( = ?auto_251344 ?auto_251348 ) ) ( not ( = ?auto_251344 ?auto_251349 ) ) ( not ( = ?auto_251344 ?auto_251350 ) ) ( not ( = ?auto_251345 ?auto_251346 ) ) ( not ( = ?auto_251345 ?auto_251347 ) ) ( not ( = ?auto_251345 ?auto_251348 ) ) ( not ( = ?auto_251345 ?auto_251349 ) ) ( not ( = ?auto_251345 ?auto_251350 ) ) ( not ( = ?auto_251346 ?auto_251347 ) ) ( not ( = ?auto_251346 ?auto_251348 ) ) ( not ( = ?auto_251346 ?auto_251349 ) ) ( not ( = ?auto_251346 ?auto_251350 ) ) ( not ( = ?auto_251347 ?auto_251348 ) ) ( not ( = ?auto_251347 ?auto_251349 ) ) ( not ( = ?auto_251347 ?auto_251350 ) ) ( not ( = ?auto_251348 ?auto_251349 ) ) ( not ( = ?auto_251348 ?auto_251350 ) ) ( not ( = ?auto_251349 ?auto_251350 ) ) ( ON ?auto_251348 ?auto_251349 ) ( ON ?auto_251347 ?auto_251348 ) ( CLEAR ?auto_251345 ) ( ON ?auto_251346 ?auto_251347 ) ( CLEAR ?auto_251346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_251342 ?auto_251343 ?auto_251344 ?auto_251345 ?auto_251346 )
      ( MAKE-8PILE ?auto_251342 ?auto_251343 ?auto_251344 ?auto_251345 ?auto_251346 ?auto_251347 ?auto_251348 ?auto_251349 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251376 - BLOCK
      ?auto_251377 - BLOCK
      ?auto_251378 - BLOCK
      ?auto_251379 - BLOCK
      ?auto_251380 - BLOCK
      ?auto_251381 - BLOCK
      ?auto_251382 - BLOCK
      ?auto_251383 - BLOCK
    )
    :vars
    (
      ?auto_251384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251383 ?auto_251384 ) ( ON-TABLE ?auto_251376 ) ( ON ?auto_251377 ?auto_251376 ) ( ON ?auto_251378 ?auto_251377 ) ( not ( = ?auto_251376 ?auto_251377 ) ) ( not ( = ?auto_251376 ?auto_251378 ) ) ( not ( = ?auto_251376 ?auto_251379 ) ) ( not ( = ?auto_251376 ?auto_251380 ) ) ( not ( = ?auto_251376 ?auto_251381 ) ) ( not ( = ?auto_251376 ?auto_251382 ) ) ( not ( = ?auto_251376 ?auto_251383 ) ) ( not ( = ?auto_251376 ?auto_251384 ) ) ( not ( = ?auto_251377 ?auto_251378 ) ) ( not ( = ?auto_251377 ?auto_251379 ) ) ( not ( = ?auto_251377 ?auto_251380 ) ) ( not ( = ?auto_251377 ?auto_251381 ) ) ( not ( = ?auto_251377 ?auto_251382 ) ) ( not ( = ?auto_251377 ?auto_251383 ) ) ( not ( = ?auto_251377 ?auto_251384 ) ) ( not ( = ?auto_251378 ?auto_251379 ) ) ( not ( = ?auto_251378 ?auto_251380 ) ) ( not ( = ?auto_251378 ?auto_251381 ) ) ( not ( = ?auto_251378 ?auto_251382 ) ) ( not ( = ?auto_251378 ?auto_251383 ) ) ( not ( = ?auto_251378 ?auto_251384 ) ) ( not ( = ?auto_251379 ?auto_251380 ) ) ( not ( = ?auto_251379 ?auto_251381 ) ) ( not ( = ?auto_251379 ?auto_251382 ) ) ( not ( = ?auto_251379 ?auto_251383 ) ) ( not ( = ?auto_251379 ?auto_251384 ) ) ( not ( = ?auto_251380 ?auto_251381 ) ) ( not ( = ?auto_251380 ?auto_251382 ) ) ( not ( = ?auto_251380 ?auto_251383 ) ) ( not ( = ?auto_251380 ?auto_251384 ) ) ( not ( = ?auto_251381 ?auto_251382 ) ) ( not ( = ?auto_251381 ?auto_251383 ) ) ( not ( = ?auto_251381 ?auto_251384 ) ) ( not ( = ?auto_251382 ?auto_251383 ) ) ( not ( = ?auto_251382 ?auto_251384 ) ) ( not ( = ?auto_251383 ?auto_251384 ) ) ( ON ?auto_251382 ?auto_251383 ) ( ON ?auto_251381 ?auto_251382 ) ( ON ?auto_251380 ?auto_251381 ) ( CLEAR ?auto_251378 ) ( ON ?auto_251379 ?auto_251380 ) ( CLEAR ?auto_251379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_251376 ?auto_251377 ?auto_251378 ?auto_251379 )
      ( MAKE-8PILE ?auto_251376 ?auto_251377 ?auto_251378 ?auto_251379 ?auto_251380 ?auto_251381 ?auto_251382 ?auto_251383 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251410 - BLOCK
      ?auto_251411 - BLOCK
      ?auto_251412 - BLOCK
      ?auto_251413 - BLOCK
      ?auto_251414 - BLOCK
      ?auto_251415 - BLOCK
      ?auto_251416 - BLOCK
      ?auto_251417 - BLOCK
    )
    :vars
    (
      ?auto_251418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251417 ?auto_251418 ) ( ON-TABLE ?auto_251410 ) ( ON ?auto_251411 ?auto_251410 ) ( not ( = ?auto_251410 ?auto_251411 ) ) ( not ( = ?auto_251410 ?auto_251412 ) ) ( not ( = ?auto_251410 ?auto_251413 ) ) ( not ( = ?auto_251410 ?auto_251414 ) ) ( not ( = ?auto_251410 ?auto_251415 ) ) ( not ( = ?auto_251410 ?auto_251416 ) ) ( not ( = ?auto_251410 ?auto_251417 ) ) ( not ( = ?auto_251410 ?auto_251418 ) ) ( not ( = ?auto_251411 ?auto_251412 ) ) ( not ( = ?auto_251411 ?auto_251413 ) ) ( not ( = ?auto_251411 ?auto_251414 ) ) ( not ( = ?auto_251411 ?auto_251415 ) ) ( not ( = ?auto_251411 ?auto_251416 ) ) ( not ( = ?auto_251411 ?auto_251417 ) ) ( not ( = ?auto_251411 ?auto_251418 ) ) ( not ( = ?auto_251412 ?auto_251413 ) ) ( not ( = ?auto_251412 ?auto_251414 ) ) ( not ( = ?auto_251412 ?auto_251415 ) ) ( not ( = ?auto_251412 ?auto_251416 ) ) ( not ( = ?auto_251412 ?auto_251417 ) ) ( not ( = ?auto_251412 ?auto_251418 ) ) ( not ( = ?auto_251413 ?auto_251414 ) ) ( not ( = ?auto_251413 ?auto_251415 ) ) ( not ( = ?auto_251413 ?auto_251416 ) ) ( not ( = ?auto_251413 ?auto_251417 ) ) ( not ( = ?auto_251413 ?auto_251418 ) ) ( not ( = ?auto_251414 ?auto_251415 ) ) ( not ( = ?auto_251414 ?auto_251416 ) ) ( not ( = ?auto_251414 ?auto_251417 ) ) ( not ( = ?auto_251414 ?auto_251418 ) ) ( not ( = ?auto_251415 ?auto_251416 ) ) ( not ( = ?auto_251415 ?auto_251417 ) ) ( not ( = ?auto_251415 ?auto_251418 ) ) ( not ( = ?auto_251416 ?auto_251417 ) ) ( not ( = ?auto_251416 ?auto_251418 ) ) ( not ( = ?auto_251417 ?auto_251418 ) ) ( ON ?auto_251416 ?auto_251417 ) ( ON ?auto_251415 ?auto_251416 ) ( ON ?auto_251414 ?auto_251415 ) ( ON ?auto_251413 ?auto_251414 ) ( CLEAR ?auto_251411 ) ( ON ?auto_251412 ?auto_251413 ) ( CLEAR ?auto_251412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_251410 ?auto_251411 ?auto_251412 )
      ( MAKE-8PILE ?auto_251410 ?auto_251411 ?auto_251412 ?auto_251413 ?auto_251414 ?auto_251415 ?auto_251416 ?auto_251417 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251444 - BLOCK
      ?auto_251445 - BLOCK
      ?auto_251446 - BLOCK
      ?auto_251447 - BLOCK
      ?auto_251448 - BLOCK
      ?auto_251449 - BLOCK
      ?auto_251450 - BLOCK
      ?auto_251451 - BLOCK
    )
    :vars
    (
      ?auto_251452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251451 ?auto_251452 ) ( ON-TABLE ?auto_251444 ) ( not ( = ?auto_251444 ?auto_251445 ) ) ( not ( = ?auto_251444 ?auto_251446 ) ) ( not ( = ?auto_251444 ?auto_251447 ) ) ( not ( = ?auto_251444 ?auto_251448 ) ) ( not ( = ?auto_251444 ?auto_251449 ) ) ( not ( = ?auto_251444 ?auto_251450 ) ) ( not ( = ?auto_251444 ?auto_251451 ) ) ( not ( = ?auto_251444 ?auto_251452 ) ) ( not ( = ?auto_251445 ?auto_251446 ) ) ( not ( = ?auto_251445 ?auto_251447 ) ) ( not ( = ?auto_251445 ?auto_251448 ) ) ( not ( = ?auto_251445 ?auto_251449 ) ) ( not ( = ?auto_251445 ?auto_251450 ) ) ( not ( = ?auto_251445 ?auto_251451 ) ) ( not ( = ?auto_251445 ?auto_251452 ) ) ( not ( = ?auto_251446 ?auto_251447 ) ) ( not ( = ?auto_251446 ?auto_251448 ) ) ( not ( = ?auto_251446 ?auto_251449 ) ) ( not ( = ?auto_251446 ?auto_251450 ) ) ( not ( = ?auto_251446 ?auto_251451 ) ) ( not ( = ?auto_251446 ?auto_251452 ) ) ( not ( = ?auto_251447 ?auto_251448 ) ) ( not ( = ?auto_251447 ?auto_251449 ) ) ( not ( = ?auto_251447 ?auto_251450 ) ) ( not ( = ?auto_251447 ?auto_251451 ) ) ( not ( = ?auto_251447 ?auto_251452 ) ) ( not ( = ?auto_251448 ?auto_251449 ) ) ( not ( = ?auto_251448 ?auto_251450 ) ) ( not ( = ?auto_251448 ?auto_251451 ) ) ( not ( = ?auto_251448 ?auto_251452 ) ) ( not ( = ?auto_251449 ?auto_251450 ) ) ( not ( = ?auto_251449 ?auto_251451 ) ) ( not ( = ?auto_251449 ?auto_251452 ) ) ( not ( = ?auto_251450 ?auto_251451 ) ) ( not ( = ?auto_251450 ?auto_251452 ) ) ( not ( = ?auto_251451 ?auto_251452 ) ) ( ON ?auto_251450 ?auto_251451 ) ( ON ?auto_251449 ?auto_251450 ) ( ON ?auto_251448 ?auto_251449 ) ( ON ?auto_251447 ?auto_251448 ) ( ON ?auto_251446 ?auto_251447 ) ( CLEAR ?auto_251444 ) ( ON ?auto_251445 ?auto_251446 ) ( CLEAR ?auto_251445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_251444 ?auto_251445 )
      ( MAKE-8PILE ?auto_251444 ?auto_251445 ?auto_251446 ?auto_251447 ?auto_251448 ?auto_251449 ?auto_251450 ?auto_251451 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_251478 - BLOCK
      ?auto_251479 - BLOCK
      ?auto_251480 - BLOCK
      ?auto_251481 - BLOCK
      ?auto_251482 - BLOCK
      ?auto_251483 - BLOCK
      ?auto_251484 - BLOCK
      ?auto_251485 - BLOCK
    )
    :vars
    (
      ?auto_251486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251485 ?auto_251486 ) ( not ( = ?auto_251478 ?auto_251479 ) ) ( not ( = ?auto_251478 ?auto_251480 ) ) ( not ( = ?auto_251478 ?auto_251481 ) ) ( not ( = ?auto_251478 ?auto_251482 ) ) ( not ( = ?auto_251478 ?auto_251483 ) ) ( not ( = ?auto_251478 ?auto_251484 ) ) ( not ( = ?auto_251478 ?auto_251485 ) ) ( not ( = ?auto_251478 ?auto_251486 ) ) ( not ( = ?auto_251479 ?auto_251480 ) ) ( not ( = ?auto_251479 ?auto_251481 ) ) ( not ( = ?auto_251479 ?auto_251482 ) ) ( not ( = ?auto_251479 ?auto_251483 ) ) ( not ( = ?auto_251479 ?auto_251484 ) ) ( not ( = ?auto_251479 ?auto_251485 ) ) ( not ( = ?auto_251479 ?auto_251486 ) ) ( not ( = ?auto_251480 ?auto_251481 ) ) ( not ( = ?auto_251480 ?auto_251482 ) ) ( not ( = ?auto_251480 ?auto_251483 ) ) ( not ( = ?auto_251480 ?auto_251484 ) ) ( not ( = ?auto_251480 ?auto_251485 ) ) ( not ( = ?auto_251480 ?auto_251486 ) ) ( not ( = ?auto_251481 ?auto_251482 ) ) ( not ( = ?auto_251481 ?auto_251483 ) ) ( not ( = ?auto_251481 ?auto_251484 ) ) ( not ( = ?auto_251481 ?auto_251485 ) ) ( not ( = ?auto_251481 ?auto_251486 ) ) ( not ( = ?auto_251482 ?auto_251483 ) ) ( not ( = ?auto_251482 ?auto_251484 ) ) ( not ( = ?auto_251482 ?auto_251485 ) ) ( not ( = ?auto_251482 ?auto_251486 ) ) ( not ( = ?auto_251483 ?auto_251484 ) ) ( not ( = ?auto_251483 ?auto_251485 ) ) ( not ( = ?auto_251483 ?auto_251486 ) ) ( not ( = ?auto_251484 ?auto_251485 ) ) ( not ( = ?auto_251484 ?auto_251486 ) ) ( not ( = ?auto_251485 ?auto_251486 ) ) ( ON ?auto_251484 ?auto_251485 ) ( ON ?auto_251483 ?auto_251484 ) ( ON ?auto_251482 ?auto_251483 ) ( ON ?auto_251481 ?auto_251482 ) ( ON ?auto_251480 ?auto_251481 ) ( ON ?auto_251479 ?auto_251480 ) ( ON ?auto_251478 ?auto_251479 ) ( CLEAR ?auto_251478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_251478 )
      ( MAKE-8PILE ?auto_251478 ?auto_251479 ?auto_251480 ?auto_251481 ?auto_251482 ?auto_251483 ?auto_251484 ?auto_251485 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251513 - BLOCK
      ?auto_251514 - BLOCK
      ?auto_251515 - BLOCK
      ?auto_251516 - BLOCK
      ?auto_251517 - BLOCK
      ?auto_251518 - BLOCK
      ?auto_251519 - BLOCK
      ?auto_251520 - BLOCK
      ?auto_251521 - BLOCK
    )
    :vars
    (
      ?auto_251522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_251520 ) ( ON ?auto_251521 ?auto_251522 ) ( CLEAR ?auto_251521 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_251513 ) ( ON ?auto_251514 ?auto_251513 ) ( ON ?auto_251515 ?auto_251514 ) ( ON ?auto_251516 ?auto_251515 ) ( ON ?auto_251517 ?auto_251516 ) ( ON ?auto_251518 ?auto_251517 ) ( ON ?auto_251519 ?auto_251518 ) ( ON ?auto_251520 ?auto_251519 ) ( not ( = ?auto_251513 ?auto_251514 ) ) ( not ( = ?auto_251513 ?auto_251515 ) ) ( not ( = ?auto_251513 ?auto_251516 ) ) ( not ( = ?auto_251513 ?auto_251517 ) ) ( not ( = ?auto_251513 ?auto_251518 ) ) ( not ( = ?auto_251513 ?auto_251519 ) ) ( not ( = ?auto_251513 ?auto_251520 ) ) ( not ( = ?auto_251513 ?auto_251521 ) ) ( not ( = ?auto_251513 ?auto_251522 ) ) ( not ( = ?auto_251514 ?auto_251515 ) ) ( not ( = ?auto_251514 ?auto_251516 ) ) ( not ( = ?auto_251514 ?auto_251517 ) ) ( not ( = ?auto_251514 ?auto_251518 ) ) ( not ( = ?auto_251514 ?auto_251519 ) ) ( not ( = ?auto_251514 ?auto_251520 ) ) ( not ( = ?auto_251514 ?auto_251521 ) ) ( not ( = ?auto_251514 ?auto_251522 ) ) ( not ( = ?auto_251515 ?auto_251516 ) ) ( not ( = ?auto_251515 ?auto_251517 ) ) ( not ( = ?auto_251515 ?auto_251518 ) ) ( not ( = ?auto_251515 ?auto_251519 ) ) ( not ( = ?auto_251515 ?auto_251520 ) ) ( not ( = ?auto_251515 ?auto_251521 ) ) ( not ( = ?auto_251515 ?auto_251522 ) ) ( not ( = ?auto_251516 ?auto_251517 ) ) ( not ( = ?auto_251516 ?auto_251518 ) ) ( not ( = ?auto_251516 ?auto_251519 ) ) ( not ( = ?auto_251516 ?auto_251520 ) ) ( not ( = ?auto_251516 ?auto_251521 ) ) ( not ( = ?auto_251516 ?auto_251522 ) ) ( not ( = ?auto_251517 ?auto_251518 ) ) ( not ( = ?auto_251517 ?auto_251519 ) ) ( not ( = ?auto_251517 ?auto_251520 ) ) ( not ( = ?auto_251517 ?auto_251521 ) ) ( not ( = ?auto_251517 ?auto_251522 ) ) ( not ( = ?auto_251518 ?auto_251519 ) ) ( not ( = ?auto_251518 ?auto_251520 ) ) ( not ( = ?auto_251518 ?auto_251521 ) ) ( not ( = ?auto_251518 ?auto_251522 ) ) ( not ( = ?auto_251519 ?auto_251520 ) ) ( not ( = ?auto_251519 ?auto_251521 ) ) ( not ( = ?auto_251519 ?auto_251522 ) ) ( not ( = ?auto_251520 ?auto_251521 ) ) ( not ( = ?auto_251520 ?auto_251522 ) ) ( not ( = ?auto_251521 ?auto_251522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_251521 ?auto_251522 )
      ( !STACK ?auto_251521 ?auto_251520 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251551 - BLOCK
      ?auto_251552 - BLOCK
      ?auto_251553 - BLOCK
      ?auto_251554 - BLOCK
      ?auto_251555 - BLOCK
      ?auto_251556 - BLOCK
      ?auto_251557 - BLOCK
      ?auto_251558 - BLOCK
      ?auto_251559 - BLOCK
    )
    :vars
    (
      ?auto_251560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251559 ?auto_251560 ) ( ON-TABLE ?auto_251551 ) ( ON ?auto_251552 ?auto_251551 ) ( ON ?auto_251553 ?auto_251552 ) ( ON ?auto_251554 ?auto_251553 ) ( ON ?auto_251555 ?auto_251554 ) ( ON ?auto_251556 ?auto_251555 ) ( ON ?auto_251557 ?auto_251556 ) ( not ( = ?auto_251551 ?auto_251552 ) ) ( not ( = ?auto_251551 ?auto_251553 ) ) ( not ( = ?auto_251551 ?auto_251554 ) ) ( not ( = ?auto_251551 ?auto_251555 ) ) ( not ( = ?auto_251551 ?auto_251556 ) ) ( not ( = ?auto_251551 ?auto_251557 ) ) ( not ( = ?auto_251551 ?auto_251558 ) ) ( not ( = ?auto_251551 ?auto_251559 ) ) ( not ( = ?auto_251551 ?auto_251560 ) ) ( not ( = ?auto_251552 ?auto_251553 ) ) ( not ( = ?auto_251552 ?auto_251554 ) ) ( not ( = ?auto_251552 ?auto_251555 ) ) ( not ( = ?auto_251552 ?auto_251556 ) ) ( not ( = ?auto_251552 ?auto_251557 ) ) ( not ( = ?auto_251552 ?auto_251558 ) ) ( not ( = ?auto_251552 ?auto_251559 ) ) ( not ( = ?auto_251552 ?auto_251560 ) ) ( not ( = ?auto_251553 ?auto_251554 ) ) ( not ( = ?auto_251553 ?auto_251555 ) ) ( not ( = ?auto_251553 ?auto_251556 ) ) ( not ( = ?auto_251553 ?auto_251557 ) ) ( not ( = ?auto_251553 ?auto_251558 ) ) ( not ( = ?auto_251553 ?auto_251559 ) ) ( not ( = ?auto_251553 ?auto_251560 ) ) ( not ( = ?auto_251554 ?auto_251555 ) ) ( not ( = ?auto_251554 ?auto_251556 ) ) ( not ( = ?auto_251554 ?auto_251557 ) ) ( not ( = ?auto_251554 ?auto_251558 ) ) ( not ( = ?auto_251554 ?auto_251559 ) ) ( not ( = ?auto_251554 ?auto_251560 ) ) ( not ( = ?auto_251555 ?auto_251556 ) ) ( not ( = ?auto_251555 ?auto_251557 ) ) ( not ( = ?auto_251555 ?auto_251558 ) ) ( not ( = ?auto_251555 ?auto_251559 ) ) ( not ( = ?auto_251555 ?auto_251560 ) ) ( not ( = ?auto_251556 ?auto_251557 ) ) ( not ( = ?auto_251556 ?auto_251558 ) ) ( not ( = ?auto_251556 ?auto_251559 ) ) ( not ( = ?auto_251556 ?auto_251560 ) ) ( not ( = ?auto_251557 ?auto_251558 ) ) ( not ( = ?auto_251557 ?auto_251559 ) ) ( not ( = ?auto_251557 ?auto_251560 ) ) ( not ( = ?auto_251558 ?auto_251559 ) ) ( not ( = ?auto_251558 ?auto_251560 ) ) ( not ( = ?auto_251559 ?auto_251560 ) ) ( CLEAR ?auto_251557 ) ( ON ?auto_251558 ?auto_251559 ) ( CLEAR ?auto_251558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_251551 ?auto_251552 ?auto_251553 ?auto_251554 ?auto_251555 ?auto_251556 ?auto_251557 ?auto_251558 )
      ( MAKE-9PILE ?auto_251551 ?auto_251552 ?auto_251553 ?auto_251554 ?auto_251555 ?auto_251556 ?auto_251557 ?auto_251558 ?auto_251559 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251589 - BLOCK
      ?auto_251590 - BLOCK
      ?auto_251591 - BLOCK
      ?auto_251592 - BLOCK
      ?auto_251593 - BLOCK
      ?auto_251594 - BLOCK
      ?auto_251595 - BLOCK
      ?auto_251596 - BLOCK
      ?auto_251597 - BLOCK
    )
    :vars
    (
      ?auto_251598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251597 ?auto_251598 ) ( ON-TABLE ?auto_251589 ) ( ON ?auto_251590 ?auto_251589 ) ( ON ?auto_251591 ?auto_251590 ) ( ON ?auto_251592 ?auto_251591 ) ( ON ?auto_251593 ?auto_251592 ) ( ON ?auto_251594 ?auto_251593 ) ( not ( = ?auto_251589 ?auto_251590 ) ) ( not ( = ?auto_251589 ?auto_251591 ) ) ( not ( = ?auto_251589 ?auto_251592 ) ) ( not ( = ?auto_251589 ?auto_251593 ) ) ( not ( = ?auto_251589 ?auto_251594 ) ) ( not ( = ?auto_251589 ?auto_251595 ) ) ( not ( = ?auto_251589 ?auto_251596 ) ) ( not ( = ?auto_251589 ?auto_251597 ) ) ( not ( = ?auto_251589 ?auto_251598 ) ) ( not ( = ?auto_251590 ?auto_251591 ) ) ( not ( = ?auto_251590 ?auto_251592 ) ) ( not ( = ?auto_251590 ?auto_251593 ) ) ( not ( = ?auto_251590 ?auto_251594 ) ) ( not ( = ?auto_251590 ?auto_251595 ) ) ( not ( = ?auto_251590 ?auto_251596 ) ) ( not ( = ?auto_251590 ?auto_251597 ) ) ( not ( = ?auto_251590 ?auto_251598 ) ) ( not ( = ?auto_251591 ?auto_251592 ) ) ( not ( = ?auto_251591 ?auto_251593 ) ) ( not ( = ?auto_251591 ?auto_251594 ) ) ( not ( = ?auto_251591 ?auto_251595 ) ) ( not ( = ?auto_251591 ?auto_251596 ) ) ( not ( = ?auto_251591 ?auto_251597 ) ) ( not ( = ?auto_251591 ?auto_251598 ) ) ( not ( = ?auto_251592 ?auto_251593 ) ) ( not ( = ?auto_251592 ?auto_251594 ) ) ( not ( = ?auto_251592 ?auto_251595 ) ) ( not ( = ?auto_251592 ?auto_251596 ) ) ( not ( = ?auto_251592 ?auto_251597 ) ) ( not ( = ?auto_251592 ?auto_251598 ) ) ( not ( = ?auto_251593 ?auto_251594 ) ) ( not ( = ?auto_251593 ?auto_251595 ) ) ( not ( = ?auto_251593 ?auto_251596 ) ) ( not ( = ?auto_251593 ?auto_251597 ) ) ( not ( = ?auto_251593 ?auto_251598 ) ) ( not ( = ?auto_251594 ?auto_251595 ) ) ( not ( = ?auto_251594 ?auto_251596 ) ) ( not ( = ?auto_251594 ?auto_251597 ) ) ( not ( = ?auto_251594 ?auto_251598 ) ) ( not ( = ?auto_251595 ?auto_251596 ) ) ( not ( = ?auto_251595 ?auto_251597 ) ) ( not ( = ?auto_251595 ?auto_251598 ) ) ( not ( = ?auto_251596 ?auto_251597 ) ) ( not ( = ?auto_251596 ?auto_251598 ) ) ( not ( = ?auto_251597 ?auto_251598 ) ) ( ON ?auto_251596 ?auto_251597 ) ( CLEAR ?auto_251594 ) ( ON ?auto_251595 ?auto_251596 ) ( CLEAR ?auto_251595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_251589 ?auto_251590 ?auto_251591 ?auto_251592 ?auto_251593 ?auto_251594 ?auto_251595 )
      ( MAKE-9PILE ?auto_251589 ?auto_251590 ?auto_251591 ?auto_251592 ?auto_251593 ?auto_251594 ?auto_251595 ?auto_251596 ?auto_251597 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251627 - BLOCK
      ?auto_251628 - BLOCK
      ?auto_251629 - BLOCK
      ?auto_251630 - BLOCK
      ?auto_251631 - BLOCK
      ?auto_251632 - BLOCK
      ?auto_251633 - BLOCK
      ?auto_251634 - BLOCK
      ?auto_251635 - BLOCK
    )
    :vars
    (
      ?auto_251636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251635 ?auto_251636 ) ( ON-TABLE ?auto_251627 ) ( ON ?auto_251628 ?auto_251627 ) ( ON ?auto_251629 ?auto_251628 ) ( ON ?auto_251630 ?auto_251629 ) ( ON ?auto_251631 ?auto_251630 ) ( not ( = ?auto_251627 ?auto_251628 ) ) ( not ( = ?auto_251627 ?auto_251629 ) ) ( not ( = ?auto_251627 ?auto_251630 ) ) ( not ( = ?auto_251627 ?auto_251631 ) ) ( not ( = ?auto_251627 ?auto_251632 ) ) ( not ( = ?auto_251627 ?auto_251633 ) ) ( not ( = ?auto_251627 ?auto_251634 ) ) ( not ( = ?auto_251627 ?auto_251635 ) ) ( not ( = ?auto_251627 ?auto_251636 ) ) ( not ( = ?auto_251628 ?auto_251629 ) ) ( not ( = ?auto_251628 ?auto_251630 ) ) ( not ( = ?auto_251628 ?auto_251631 ) ) ( not ( = ?auto_251628 ?auto_251632 ) ) ( not ( = ?auto_251628 ?auto_251633 ) ) ( not ( = ?auto_251628 ?auto_251634 ) ) ( not ( = ?auto_251628 ?auto_251635 ) ) ( not ( = ?auto_251628 ?auto_251636 ) ) ( not ( = ?auto_251629 ?auto_251630 ) ) ( not ( = ?auto_251629 ?auto_251631 ) ) ( not ( = ?auto_251629 ?auto_251632 ) ) ( not ( = ?auto_251629 ?auto_251633 ) ) ( not ( = ?auto_251629 ?auto_251634 ) ) ( not ( = ?auto_251629 ?auto_251635 ) ) ( not ( = ?auto_251629 ?auto_251636 ) ) ( not ( = ?auto_251630 ?auto_251631 ) ) ( not ( = ?auto_251630 ?auto_251632 ) ) ( not ( = ?auto_251630 ?auto_251633 ) ) ( not ( = ?auto_251630 ?auto_251634 ) ) ( not ( = ?auto_251630 ?auto_251635 ) ) ( not ( = ?auto_251630 ?auto_251636 ) ) ( not ( = ?auto_251631 ?auto_251632 ) ) ( not ( = ?auto_251631 ?auto_251633 ) ) ( not ( = ?auto_251631 ?auto_251634 ) ) ( not ( = ?auto_251631 ?auto_251635 ) ) ( not ( = ?auto_251631 ?auto_251636 ) ) ( not ( = ?auto_251632 ?auto_251633 ) ) ( not ( = ?auto_251632 ?auto_251634 ) ) ( not ( = ?auto_251632 ?auto_251635 ) ) ( not ( = ?auto_251632 ?auto_251636 ) ) ( not ( = ?auto_251633 ?auto_251634 ) ) ( not ( = ?auto_251633 ?auto_251635 ) ) ( not ( = ?auto_251633 ?auto_251636 ) ) ( not ( = ?auto_251634 ?auto_251635 ) ) ( not ( = ?auto_251634 ?auto_251636 ) ) ( not ( = ?auto_251635 ?auto_251636 ) ) ( ON ?auto_251634 ?auto_251635 ) ( ON ?auto_251633 ?auto_251634 ) ( CLEAR ?auto_251631 ) ( ON ?auto_251632 ?auto_251633 ) ( CLEAR ?auto_251632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_251627 ?auto_251628 ?auto_251629 ?auto_251630 ?auto_251631 ?auto_251632 )
      ( MAKE-9PILE ?auto_251627 ?auto_251628 ?auto_251629 ?auto_251630 ?auto_251631 ?auto_251632 ?auto_251633 ?auto_251634 ?auto_251635 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251665 - BLOCK
      ?auto_251666 - BLOCK
      ?auto_251667 - BLOCK
      ?auto_251668 - BLOCK
      ?auto_251669 - BLOCK
      ?auto_251670 - BLOCK
      ?auto_251671 - BLOCK
      ?auto_251672 - BLOCK
      ?auto_251673 - BLOCK
    )
    :vars
    (
      ?auto_251674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251673 ?auto_251674 ) ( ON-TABLE ?auto_251665 ) ( ON ?auto_251666 ?auto_251665 ) ( ON ?auto_251667 ?auto_251666 ) ( ON ?auto_251668 ?auto_251667 ) ( not ( = ?auto_251665 ?auto_251666 ) ) ( not ( = ?auto_251665 ?auto_251667 ) ) ( not ( = ?auto_251665 ?auto_251668 ) ) ( not ( = ?auto_251665 ?auto_251669 ) ) ( not ( = ?auto_251665 ?auto_251670 ) ) ( not ( = ?auto_251665 ?auto_251671 ) ) ( not ( = ?auto_251665 ?auto_251672 ) ) ( not ( = ?auto_251665 ?auto_251673 ) ) ( not ( = ?auto_251665 ?auto_251674 ) ) ( not ( = ?auto_251666 ?auto_251667 ) ) ( not ( = ?auto_251666 ?auto_251668 ) ) ( not ( = ?auto_251666 ?auto_251669 ) ) ( not ( = ?auto_251666 ?auto_251670 ) ) ( not ( = ?auto_251666 ?auto_251671 ) ) ( not ( = ?auto_251666 ?auto_251672 ) ) ( not ( = ?auto_251666 ?auto_251673 ) ) ( not ( = ?auto_251666 ?auto_251674 ) ) ( not ( = ?auto_251667 ?auto_251668 ) ) ( not ( = ?auto_251667 ?auto_251669 ) ) ( not ( = ?auto_251667 ?auto_251670 ) ) ( not ( = ?auto_251667 ?auto_251671 ) ) ( not ( = ?auto_251667 ?auto_251672 ) ) ( not ( = ?auto_251667 ?auto_251673 ) ) ( not ( = ?auto_251667 ?auto_251674 ) ) ( not ( = ?auto_251668 ?auto_251669 ) ) ( not ( = ?auto_251668 ?auto_251670 ) ) ( not ( = ?auto_251668 ?auto_251671 ) ) ( not ( = ?auto_251668 ?auto_251672 ) ) ( not ( = ?auto_251668 ?auto_251673 ) ) ( not ( = ?auto_251668 ?auto_251674 ) ) ( not ( = ?auto_251669 ?auto_251670 ) ) ( not ( = ?auto_251669 ?auto_251671 ) ) ( not ( = ?auto_251669 ?auto_251672 ) ) ( not ( = ?auto_251669 ?auto_251673 ) ) ( not ( = ?auto_251669 ?auto_251674 ) ) ( not ( = ?auto_251670 ?auto_251671 ) ) ( not ( = ?auto_251670 ?auto_251672 ) ) ( not ( = ?auto_251670 ?auto_251673 ) ) ( not ( = ?auto_251670 ?auto_251674 ) ) ( not ( = ?auto_251671 ?auto_251672 ) ) ( not ( = ?auto_251671 ?auto_251673 ) ) ( not ( = ?auto_251671 ?auto_251674 ) ) ( not ( = ?auto_251672 ?auto_251673 ) ) ( not ( = ?auto_251672 ?auto_251674 ) ) ( not ( = ?auto_251673 ?auto_251674 ) ) ( ON ?auto_251672 ?auto_251673 ) ( ON ?auto_251671 ?auto_251672 ) ( ON ?auto_251670 ?auto_251671 ) ( CLEAR ?auto_251668 ) ( ON ?auto_251669 ?auto_251670 ) ( CLEAR ?auto_251669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_251665 ?auto_251666 ?auto_251667 ?auto_251668 ?auto_251669 )
      ( MAKE-9PILE ?auto_251665 ?auto_251666 ?auto_251667 ?auto_251668 ?auto_251669 ?auto_251670 ?auto_251671 ?auto_251672 ?auto_251673 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251703 - BLOCK
      ?auto_251704 - BLOCK
      ?auto_251705 - BLOCK
      ?auto_251706 - BLOCK
      ?auto_251707 - BLOCK
      ?auto_251708 - BLOCK
      ?auto_251709 - BLOCK
      ?auto_251710 - BLOCK
      ?auto_251711 - BLOCK
    )
    :vars
    (
      ?auto_251712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251711 ?auto_251712 ) ( ON-TABLE ?auto_251703 ) ( ON ?auto_251704 ?auto_251703 ) ( ON ?auto_251705 ?auto_251704 ) ( not ( = ?auto_251703 ?auto_251704 ) ) ( not ( = ?auto_251703 ?auto_251705 ) ) ( not ( = ?auto_251703 ?auto_251706 ) ) ( not ( = ?auto_251703 ?auto_251707 ) ) ( not ( = ?auto_251703 ?auto_251708 ) ) ( not ( = ?auto_251703 ?auto_251709 ) ) ( not ( = ?auto_251703 ?auto_251710 ) ) ( not ( = ?auto_251703 ?auto_251711 ) ) ( not ( = ?auto_251703 ?auto_251712 ) ) ( not ( = ?auto_251704 ?auto_251705 ) ) ( not ( = ?auto_251704 ?auto_251706 ) ) ( not ( = ?auto_251704 ?auto_251707 ) ) ( not ( = ?auto_251704 ?auto_251708 ) ) ( not ( = ?auto_251704 ?auto_251709 ) ) ( not ( = ?auto_251704 ?auto_251710 ) ) ( not ( = ?auto_251704 ?auto_251711 ) ) ( not ( = ?auto_251704 ?auto_251712 ) ) ( not ( = ?auto_251705 ?auto_251706 ) ) ( not ( = ?auto_251705 ?auto_251707 ) ) ( not ( = ?auto_251705 ?auto_251708 ) ) ( not ( = ?auto_251705 ?auto_251709 ) ) ( not ( = ?auto_251705 ?auto_251710 ) ) ( not ( = ?auto_251705 ?auto_251711 ) ) ( not ( = ?auto_251705 ?auto_251712 ) ) ( not ( = ?auto_251706 ?auto_251707 ) ) ( not ( = ?auto_251706 ?auto_251708 ) ) ( not ( = ?auto_251706 ?auto_251709 ) ) ( not ( = ?auto_251706 ?auto_251710 ) ) ( not ( = ?auto_251706 ?auto_251711 ) ) ( not ( = ?auto_251706 ?auto_251712 ) ) ( not ( = ?auto_251707 ?auto_251708 ) ) ( not ( = ?auto_251707 ?auto_251709 ) ) ( not ( = ?auto_251707 ?auto_251710 ) ) ( not ( = ?auto_251707 ?auto_251711 ) ) ( not ( = ?auto_251707 ?auto_251712 ) ) ( not ( = ?auto_251708 ?auto_251709 ) ) ( not ( = ?auto_251708 ?auto_251710 ) ) ( not ( = ?auto_251708 ?auto_251711 ) ) ( not ( = ?auto_251708 ?auto_251712 ) ) ( not ( = ?auto_251709 ?auto_251710 ) ) ( not ( = ?auto_251709 ?auto_251711 ) ) ( not ( = ?auto_251709 ?auto_251712 ) ) ( not ( = ?auto_251710 ?auto_251711 ) ) ( not ( = ?auto_251710 ?auto_251712 ) ) ( not ( = ?auto_251711 ?auto_251712 ) ) ( ON ?auto_251710 ?auto_251711 ) ( ON ?auto_251709 ?auto_251710 ) ( ON ?auto_251708 ?auto_251709 ) ( ON ?auto_251707 ?auto_251708 ) ( CLEAR ?auto_251705 ) ( ON ?auto_251706 ?auto_251707 ) ( CLEAR ?auto_251706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_251703 ?auto_251704 ?auto_251705 ?auto_251706 )
      ( MAKE-9PILE ?auto_251703 ?auto_251704 ?auto_251705 ?auto_251706 ?auto_251707 ?auto_251708 ?auto_251709 ?auto_251710 ?auto_251711 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251741 - BLOCK
      ?auto_251742 - BLOCK
      ?auto_251743 - BLOCK
      ?auto_251744 - BLOCK
      ?auto_251745 - BLOCK
      ?auto_251746 - BLOCK
      ?auto_251747 - BLOCK
      ?auto_251748 - BLOCK
      ?auto_251749 - BLOCK
    )
    :vars
    (
      ?auto_251750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251749 ?auto_251750 ) ( ON-TABLE ?auto_251741 ) ( ON ?auto_251742 ?auto_251741 ) ( not ( = ?auto_251741 ?auto_251742 ) ) ( not ( = ?auto_251741 ?auto_251743 ) ) ( not ( = ?auto_251741 ?auto_251744 ) ) ( not ( = ?auto_251741 ?auto_251745 ) ) ( not ( = ?auto_251741 ?auto_251746 ) ) ( not ( = ?auto_251741 ?auto_251747 ) ) ( not ( = ?auto_251741 ?auto_251748 ) ) ( not ( = ?auto_251741 ?auto_251749 ) ) ( not ( = ?auto_251741 ?auto_251750 ) ) ( not ( = ?auto_251742 ?auto_251743 ) ) ( not ( = ?auto_251742 ?auto_251744 ) ) ( not ( = ?auto_251742 ?auto_251745 ) ) ( not ( = ?auto_251742 ?auto_251746 ) ) ( not ( = ?auto_251742 ?auto_251747 ) ) ( not ( = ?auto_251742 ?auto_251748 ) ) ( not ( = ?auto_251742 ?auto_251749 ) ) ( not ( = ?auto_251742 ?auto_251750 ) ) ( not ( = ?auto_251743 ?auto_251744 ) ) ( not ( = ?auto_251743 ?auto_251745 ) ) ( not ( = ?auto_251743 ?auto_251746 ) ) ( not ( = ?auto_251743 ?auto_251747 ) ) ( not ( = ?auto_251743 ?auto_251748 ) ) ( not ( = ?auto_251743 ?auto_251749 ) ) ( not ( = ?auto_251743 ?auto_251750 ) ) ( not ( = ?auto_251744 ?auto_251745 ) ) ( not ( = ?auto_251744 ?auto_251746 ) ) ( not ( = ?auto_251744 ?auto_251747 ) ) ( not ( = ?auto_251744 ?auto_251748 ) ) ( not ( = ?auto_251744 ?auto_251749 ) ) ( not ( = ?auto_251744 ?auto_251750 ) ) ( not ( = ?auto_251745 ?auto_251746 ) ) ( not ( = ?auto_251745 ?auto_251747 ) ) ( not ( = ?auto_251745 ?auto_251748 ) ) ( not ( = ?auto_251745 ?auto_251749 ) ) ( not ( = ?auto_251745 ?auto_251750 ) ) ( not ( = ?auto_251746 ?auto_251747 ) ) ( not ( = ?auto_251746 ?auto_251748 ) ) ( not ( = ?auto_251746 ?auto_251749 ) ) ( not ( = ?auto_251746 ?auto_251750 ) ) ( not ( = ?auto_251747 ?auto_251748 ) ) ( not ( = ?auto_251747 ?auto_251749 ) ) ( not ( = ?auto_251747 ?auto_251750 ) ) ( not ( = ?auto_251748 ?auto_251749 ) ) ( not ( = ?auto_251748 ?auto_251750 ) ) ( not ( = ?auto_251749 ?auto_251750 ) ) ( ON ?auto_251748 ?auto_251749 ) ( ON ?auto_251747 ?auto_251748 ) ( ON ?auto_251746 ?auto_251747 ) ( ON ?auto_251745 ?auto_251746 ) ( ON ?auto_251744 ?auto_251745 ) ( CLEAR ?auto_251742 ) ( ON ?auto_251743 ?auto_251744 ) ( CLEAR ?auto_251743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_251741 ?auto_251742 ?auto_251743 )
      ( MAKE-9PILE ?auto_251741 ?auto_251742 ?auto_251743 ?auto_251744 ?auto_251745 ?auto_251746 ?auto_251747 ?auto_251748 ?auto_251749 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251779 - BLOCK
      ?auto_251780 - BLOCK
      ?auto_251781 - BLOCK
      ?auto_251782 - BLOCK
      ?auto_251783 - BLOCK
      ?auto_251784 - BLOCK
      ?auto_251785 - BLOCK
      ?auto_251786 - BLOCK
      ?auto_251787 - BLOCK
    )
    :vars
    (
      ?auto_251788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251787 ?auto_251788 ) ( ON-TABLE ?auto_251779 ) ( not ( = ?auto_251779 ?auto_251780 ) ) ( not ( = ?auto_251779 ?auto_251781 ) ) ( not ( = ?auto_251779 ?auto_251782 ) ) ( not ( = ?auto_251779 ?auto_251783 ) ) ( not ( = ?auto_251779 ?auto_251784 ) ) ( not ( = ?auto_251779 ?auto_251785 ) ) ( not ( = ?auto_251779 ?auto_251786 ) ) ( not ( = ?auto_251779 ?auto_251787 ) ) ( not ( = ?auto_251779 ?auto_251788 ) ) ( not ( = ?auto_251780 ?auto_251781 ) ) ( not ( = ?auto_251780 ?auto_251782 ) ) ( not ( = ?auto_251780 ?auto_251783 ) ) ( not ( = ?auto_251780 ?auto_251784 ) ) ( not ( = ?auto_251780 ?auto_251785 ) ) ( not ( = ?auto_251780 ?auto_251786 ) ) ( not ( = ?auto_251780 ?auto_251787 ) ) ( not ( = ?auto_251780 ?auto_251788 ) ) ( not ( = ?auto_251781 ?auto_251782 ) ) ( not ( = ?auto_251781 ?auto_251783 ) ) ( not ( = ?auto_251781 ?auto_251784 ) ) ( not ( = ?auto_251781 ?auto_251785 ) ) ( not ( = ?auto_251781 ?auto_251786 ) ) ( not ( = ?auto_251781 ?auto_251787 ) ) ( not ( = ?auto_251781 ?auto_251788 ) ) ( not ( = ?auto_251782 ?auto_251783 ) ) ( not ( = ?auto_251782 ?auto_251784 ) ) ( not ( = ?auto_251782 ?auto_251785 ) ) ( not ( = ?auto_251782 ?auto_251786 ) ) ( not ( = ?auto_251782 ?auto_251787 ) ) ( not ( = ?auto_251782 ?auto_251788 ) ) ( not ( = ?auto_251783 ?auto_251784 ) ) ( not ( = ?auto_251783 ?auto_251785 ) ) ( not ( = ?auto_251783 ?auto_251786 ) ) ( not ( = ?auto_251783 ?auto_251787 ) ) ( not ( = ?auto_251783 ?auto_251788 ) ) ( not ( = ?auto_251784 ?auto_251785 ) ) ( not ( = ?auto_251784 ?auto_251786 ) ) ( not ( = ?auto_251784 ?auto_251787 ) ) ( not ( = ?auto_251784 ?auto_251788 ) ) ( not ( = ?auto_251785 ?auto_251786 ) ) ( not ( = ?auto_251785 ?auto_251787 ) ) ( not ( = ?auto_251785 ?auto_251788 ) ) ( not ( = ?auto_251786 ?auto_251787 ) ) ( not ( = ?auto_251786 ?auto_251788 ) ) ( not ( = ?auto_251787 ?auto_251788 ) ) ( ON ?auto_251786 ?auto_251787 ) ( ON ?auto_251785 ?auto_251786 ) ( ON ?auto_251784 ?auto_251785 ) ( ON ?auto_251783 ?auto_251784 ) ( ON ?auto_251782 ?auto_251783 ) ( ON ?auto_251781 ?auto_251782 ) ( CLEAR ?auto_251779 ) ( ON ?auto_251780 ?auto_251781 ) ( CLEAR ?auto_251780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_251779 ?auto_251780 )
      ( MAKE-9PILE ?auto_251779 ?auto_251780 ?auto_251781 ?auto_251782 ?auto_251783 ?auto_251784 ?auto_251785 ?auto_251786 ?auto_251787 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_251817 - BLOCK
      ?auto_251818 - BLOCK
      ?auto_251819 - BLOCK
      ?auto_251820 - BLOCK
      ?auto_251821 - BLOCK
      ?auto_251822 - BLOCK
      ?auto_251823 - BLOCK
      ?auto_251824 - BLOCK
      ?auto_251825 - BLOCK
    )
    :vars
    (
      ?auto_251826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251825 ?auto_251826 ) ( not ( = ?auto_251817 ?auto_251818 ) ) ( not ( = ?auto_251817 ?auto_251819 ) ) ( not ( = ?auto_251817 ?auto_251820 ) ) ( not ( = ?auto_251817 ?auto_251821 ) ) ( not ( = ?auto_251817 ?auto_251822 ) ) ( not ( = ?auto_251817 ?auto_251823 ) ) ( not ( = ?auto_251817 ?auto_251824 ) ) ( not ( = ?auto_251817 ?auto_251825 ) ) ( not ( = ?auto_251817 ?auto_251826 ) ) ( not ( = ?auto_251818 ?auto_251819 ) ) ( not ( = ?auto_251818 ?auto_251820 ) ) ( not ( = ?auto_251818 ?auto_251821 ) ) ( not ( = ?auto_251818 ?auto_251822 ) ) ( not ( = ?auto_251818 ?auto_251823 ) ) ( not ( = ?auto_251818 ?auto_251824 ) ) ( not ( = ?auto_251818 ?auto_251825 ) ) ( not ( = ?auto_251818 ?auto_251826 ) ) ( not ( = ?auto_251819 ?auto_251820 ) ) ( not ( = ?auto_251819 ?auto_251821 ) ) ( not ( = ?auto_251819 ?auto_251822 ) ) ( not ( = ?auto_251819 ?auto_251823 ) ) ( not ( = ?auto_251819 ?auto_251824 ) ) ( not ( = ?auto_251819 ?auto_251825 ) ) ( not ( = ?auto_251819 ?auto_251826 ) ) ( not ( = ?auto_251820 ?auto_251821 ) ) ( not ( = ?auto_251820 ?auto_251822 ) ) ( not ( = ?auto_251820 ?auto_251823 ) ) ( not ( = ?auto_251820 ?auto_251824 ) ) ( not ( = ?auto_251820 ?auto_251825 ) ) ( not ( = ?auto_251820 ?auto_251826 ) ) ( not ( = ?auto_251821 ?auto_251822 ) ) ( not ( = ?auto_251821 ?auto_251823 ) ) ( not ( = ?auto_251821 ?auto_251824 ) ) ( not ( = ?auto_251821 ?auto_251825 ) ) ( not ( = ?auto_251821 ?auto_251826 ) ) ( not ( = ?auto_251822 ?auto_251823 ) ) ( not ( = ?auto_251822 ?auto_251824 ) ) ( not ( = ?auto_251822 ?auto_251825 ) ) ( not ( = ?auto_251822 ?auto_251826 ) ) ( not ( = ?auto_251823 ?auto_251824 ) ) ( not ( = ?auto_251823 ?auto_251825 ) ) ( not ( = ?auto_251823 ?auto_251826 ) ) ( not ( = ?auto_251824 ?auto_251825 ) ) ( not ( = ?auto_251824 ?auto_251826 ) ) ( not ( = ?auto_251825 ?auto_251826 ) ) ( ON ?auto_251824 ?auto_251825 ) ( ON ?auto_251823 ?auto_251824 ) ( ON ?auto_251822 ?auto_251823 ) ( ON ?auto_251821 ?auto_251822 ) ( ON ?auto_251820 ?auto_251821 ) ( ON ?auto_251819 ?auto_251820 ) ( ON ?auto_251818 ?auto_251819 ) ( ON ?auto_251817 ?auto_251818 ) ( CLEAR ?auto_251817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_251817 )
      ( MAKE-9PILE ?auto_251817 ?auto_251818 ?auto_251819 ?auto_251820 ?auto_251821 ?auto_251822 ?auto_251823 ?auto_251824 ?auto_251825 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_251856 - BLOCK
      ?auto_251857 - BLOCK
      ?auto_251858 - BLOCK
      ?auto_251859 - BLOCK
      ?auto_251860 - BLOCK
      ?auto_251861 - BLOCK
      ?auto_251862 - BLOCK
      ?auto_251863 - BLOCK
      ?auto_251864 - BLOCK
      ?auto_251865 - BLOCK
    )
    :vars
    (
      ?auto_251866 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_251864 ) ( ON ?auto_251865 ?auto_251866 ) ( CLEAR ?auto_251865 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_251856 ) ( ON ?auto_251857 ?auto_251856 ) ( ON ?auto_251858 ?auto_251857 ) ( ON ?auto_251859 ?auto_251858 ) ( ON ?auto_251860 ?auto_251859 ) ( ON ?auto_251861 ?auto_251860 ) ( ON ?auto_251862 ?auto_251861 ) ( ON ?auto_251863 ?auto_251862 ) ( ON ?auto_251864 ?auto_251863 ) ( not ( = ?auto_251856 ?auto_251857 ) ) ( not ( = ?auto_251856 ?auto_251858 ) ) ( not ( = ?auto_251856 ?auto_251859 ) ) ( not ( = ?auto_251856 ?auto_251860 ) ) ( not ( = ?auto_251856 ?auto_251861 ) ) ( not ( = ?auto_251856 ?auto_251862 ) ) ( not ( = ?auto_251856 ?auto_251863 ) ) ( not ( = ?auto_251856 ?auto_251864 ) ) ( not ( = ?auto_251856 ?auto_251865 ) ) ( not ( = ?auto_251856 ?auto_251866 ) ) ( not ( = ?auto_251857 ?auto_251858 ) ) ( not ( = ?auto_251857 ?auto_251859 ) ) ( not ( = ?auto_251857 ?auto_251860 ) ) ( not ( = ?auto_251857 ?auto_251861 ) ) ( not ( = ?auto_251857 ?auto_251862 ) ) ( not ( = ?auto_251857 ?auto_251863 ) ) ( not ( = ?auto_251857 ?auto_251864 ) ) ( not ( = ?auto_251857 ?auto_251865 ) ) ( not ( = ?auto_251857 ?auto_251866 ) ) ( not ( = ?auto_251858 ?auto_251859 ) ) ( not ( = ?auto_251858 ?auto_251860 ) ) ( not ( = ?auto_251858 ?auto_251861 ) ) ( not ( = ?auto_251858 ?auto_251862 ) ) ( not ( = ?auto_251858 ?auto_251863 ) ) ( not ( = ?auto_251858 ?auto_251864 ) ) ( not ( = ?auto_251858 ?auto_251865 ) ) ( not ( = ?auto_251858 ?auto_251866 ) ) ( not ( = ?auto_251859 ?auto_251860 ) ) ( not ( = ?auto_251859 ?auto_251861 ) ) ( not ( = ?auto_251859 ?auto_251862 ) ) ( not ( = ?auto_251859 ?auto_251863 ) ) ( not ( = ?auto_251859 ?auto_251864 ) ) ( not ( = ?auto_251859 ?auto_251865 ) ) ( not ( = ?auto_251859 ?auto_251866 ) ) ( not ( = ?auto_251860 ?auto_251861 ) ) ( not ( = ?auto_251860 ?auto_251862 ) ) ( not ( = ?auto_251860 ?auto_251863 ) ) ( not ( = ?auto_251860 ?auto_251864 ) ) ( not ( = ?auto_251860 ?auto_251865 ) ) ( not ( = ?auto_251860 ?auto_251866 ) ) ( not ( = ?auto_251861 ?auto_251862 ) ) ( not ( = ?auto_251861 ?auto_251863 ) ) ( not ( = ?auto_251861 ?auto_251864 ) ) ( not ( = ?auto_251861 ?auto_251865 ) ) ( not ( = ?auto_251861 ?auto_251866 ) ) ( not ( = ?auto_251862 ?auto_251863 ) ) ( not ( = ?auto_251862 ?auto_251864 ) ) ( not ( = ?auto_251862 ?auto_251865 ) ) ( not ( = ?auto_251862 ?auto_251866 ) ) ( not ( = ?auto_251863 ?auto_251864 ) ) ( not ( = ?auto_251863 ?auto_251865 ) ) ( not ( = ?auto_251863 ?auto_251866 ) ) ( not ( = ?auto_251864 ?auto_251865 ) ) ( not ( = ?auto_251864 ?auto_251866 ) ) ( not ( = ?auto_251865 ?auto_251866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_251865 ?auto_251866 )
      ( !STACK ?auto_251865 ?auto_251864 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_251898 - BLOCK
      ?auto_251899 - BLOCK
      ?auto_251900 - BLOCK
      ?auto_251901 - BLOCK
      ?auto_251902 - BLOCK
      ?auto_251903 - BLOCK
      ?auto_251904 - BLOCK
      ?auto_251905 - BLOCK
      ?auto_251906 - BLOCK
      ?auto_251907 - BLOCK
    )
    :vars
    (
      ?auto_251908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251907 ?auto_251908 ) ( ON-TABLE ?auto_251898 ) ( ON ?auto_251899 ?auto_251898 ) ( ON ?auto_251900 ?auto_251899 ) ( ON ?auto_251901 ?auto_251900 ) ( ON ?auto_251902 ?auto_251901 ) ( ON ?auto_251903 ?auto_251902 ) ( ON ?auto_251904 ?auto_251903 ) ( ON ?auto_251905 ?auto_251904 ) ( not ( = ?auto_251898 ?auto_251899 ) ) ( not ( = ?auto_251898 ?auto_251900 ) ) ( not ( = ?auto_251898 ?auto_251901 ) ) ( not ( = ?auto_251898 ?auto_251902 ) ) ( not ( = ?auto_251898 ?auto_251903 ) ) ( not ( = ?auto_251898 ?auto_251904 ) ) ( not ( = ?auto_251898 ?auto_251905 ) ) ( not ( = ?auto_251898 ?auto_251906 ) ) ( not ( = ?auto_251898 ?auto_251907 ) ) ( not ( = ?auto_251898 ?auto_251908 ) ) ( not ( = ?auto_251899 ?auto_251900 ) ) ( not ( = ?auto_251899 ?auto_251901 ) ) ( not ( = ?auto_251899 ?auto_251902 ) ) ( not ( = ?auto_251899 ?auto_251903 ) ) ( not ( = ?auto_251899 ?auto_251904 ) ) ( not ( = ?auto_251899 ?auto_251905 ) ) ( not ( = ?auto_251899 ?auto_251906 ) ) ( not ( = ?auto_251899 ?auto_251907 ) ) ( not ( = ?auto_251899 ?auto_251908 ) ) ( not ( = ?auto_251900 ?auto_251901 ) ) ( not ( = ?auto_251900 ?auto_251902 ) ) ( not ( = ?auto_251900 ?auto_251903 ) ) ( not ( = ?auto_251900 ?auto_251904 ) ) ( not ( = ?auto_251900 ?auto_251905 ) ) ( not ( = ?auto_251900 ?auto_251906 ) ) ( not ( = ?auto_251900 ?auto_251907 ) ) ( not ( = ?auto_251900 ?auto_251908 ) ) ( not ( = ?auto_251901 ?auto_251902 ) ) ( not ( = ?auto_251901 ?auto_251903 ) ) ( not ( = ?auto_251901 ?auto_251904 ) ) ( not ( = ?auto_251901 ?auto_251905 ) ) ( not ( = ?auto_251901 ?auto_251906 ) ) ( not ( = ?auto_251901 ?auto_251907 ) ) ( not ( = ?auto_251901 ?auto_251908 ) ) ( not ( = ?auto_251902 ?auto_251903 ) ) ( not ( = ?auto_251902 ?auto_251904 ) ) ( not ( = ?auto_251902 ?auto_251905 ) ) ( not ( = ?auto_251902 ?auto_251906 ) ) ( not ( = ?auto_251902 ?auto_251907 ) ) ( not ( = ?auto_251902 ?auto_251908 ) ) ( not ( = ?auto_251903 ?auto_251904 ) ) ( not ( = ?auto_251903 ?auto_251905 ) ) ( not ( = ?auto_251903 ?auto_251906 ) ) ( not ( = ?auto_251903 ?auto_251907 ) ) ( not ( = ?auto_251903 ?auto_251908 ) ) ( not ( = ?auto_251904 ?auto_251905 ) ) ( not ( = ?auto_251904 ?auto_251906 ) ) ( not ( = ?auto_251904 ?auto_251907 ) ) ( not ( = ?auto_251904 ?auto_251908 ) ) ( not ( = ?auto_251905 ?auto_251906 ) ) ( not ( = ?auto_251905 ?auto_251907 ) ) ( not ( = ?auto_251905 ?auto_251908 ) ) ( not ( = ?auto_251906 ?auto_251907 ) ) ( not ( = ?auto_251906 ?auto_251908 ) ) ( not ( = ?auto_251907 ?auto_251908 ) ) ( CLEAR ?auto_251905 ) ( ON ?auto_251906 ?auto_251907 ) ( CLEAR ?auto_251906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_251898 ?auto_251899 ?auto_251900 ?auto_251901 ?auto_251902 ?auto_251903 ?auto_251904 ?auto_251905 ?auto_251906 )
      ( MAKE-10PILE ?auto_251898 ?auto_251899 ?auto_251900 ?auto_251901 ?auto_251902 ?auto_251903 ?auto_251904 ?auto_251905 ?auto_251906 ?auto_251907 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_251940 - BLOCK
      ?auto_251941 - BLOCK
      ?auto_251942 - BLOCK
      ?auto_251943 - BLOCK
      ?auto_251944 - BLOCK
      ?auto_251945 - BLOCK
      ?auto_251946 - BLOCK
      ?auto_251947 - BLOCK
      ?auto_251948 - BLOCK
      ?auto_251949 - BLOCK
    )
    :vars
    (
      ?auto_251950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251949 ?auto_251950 ) ( ON-TABLE ?auto_251940 ) ( ON ?auto_251941 ?auto_251940 ) ( ON ?auto_251942 ?auto_251941 ) ( ON ?auto_251943 ?auto_251942 ) ( ON ?auto_251944 ?auto_251943 ) ( ON ?auto_251945 ?auto_251944 ) ( ON ?auto_251946 ?auto_251945 ) ( not ( = ?auto_251940 ?auto_251941 ) ) ( not ( = ?auto_251940 ?auto_251942 ) ) ( not ( = ?auto_251940 ?auto_251943 ) ) ( not ( = ?auto_251940 ?auto_251944 ) ) ( not ( = ?auto_251940 ?auto_251945 ) ) ( not ( = ?auto_251940 ?auto_251946 ) ) ( not ( = ?auto_251940 ?auto_251947 ) ) ( not ( = ?auto_251940 ?auto_251948 ) ) ( not ( = ?auto_251940 ?auto_251949 ) ) ( not ( = ?auto_251940 ?auto_251950 ) ) ( not ( = ?auto_251941 ?auto_251942 ) ) ( not ( = ?auto_251941 ?auto_251943 ) ) ( not ( = ?auto_251941 ?auto_251944 ) ) ( not ( = ?auto_251941 ?auto_251945 ) ) ( not ( = ?auto_251941 ?auto_251946 ) ) ( not ( = ?auto_251941 ?auto_251947 ) ) ( not ( = ?auto_251941 ?auto_251948 ) ) ( not ( = ?auto_251941 ?auto_251949 ) ) ( not ( = ?auto_251941 ?auto_251950 ) ) ( not ( = ?auto_251942 ?auto_251943 ) ) ( not ( = ?auto_251942 ?auto_251944 ) ) ( not ( = ?auto_251942 ?auto_251945 ) ) ( not ( = ?auto_251942 ?auto_251946 ) ) ( not ( = ?auto_251942 ?auto_251947 ) ) ( not ( = ?auto_251942 ?auto_251948 ) ) ( not ( = ?auto_251942 ?auto_251949 ) ) ( not ( = ?auto_251942 ?auto_251950 ) ) ( not ( = ?auto_251943 ?auto_251944 ) ) ( not ( = ?auto_251943 ?auto_251945 ) ) ( not ( = ?auto_251943 ?auto_251946 ) ) ( not ( = ?auto_251943 ?auto_251947 ) ) ( not ( = ?auto_251943 ?auto_251948 ) ) ( not ( = ?auto_251943 ?auto_251949 ) ) ( not ( = ?auto_251943 ?auto_251950 ) ) ( not ( = ?auto_251944 ?auto_251945 ) ) ( not ( = ?auto_251944 ?auto_251946 ) ) ( not ( = ?auto_251944 ?auto_251947 ) ) ( not ( = ?auto_251944 ?auto_251948 ) ) ( not ( = ?auto_251944 ?auto_251949 ) ) ( not ( = ?auto_251944 ?auto_251950 ) ) ( not ( = ?auto_251945 ?auto_251946 ) ) ( not ( = ?auto_251945 ?auto_251947 ) ) ( not ( = ?auto_251945 ?auto_251948 ) ) ( not ( = ?auto_251945 ?auto_251949 ) ) ( not ( = ?auto_251945 ?auto_251950 ) ) ( not ( = ?auto_251946 ?auto_251947 ) ) ( not ( = ?auto_251946 ?auto_251948 ) ) ( not ( = ?auto_251946 ?auto_251949 ) ) ( not ( = ?auto_251946 ?auto_251950 ) ) ( not ( = ?auto_251947 ?auto_251948 ) ) ( not ( = ?auto_251947 ?auto_251949 ) ) ( not ( = ?auto_251947 ?auto_251950 ) ) ( not ( = ?auto_251948 ?auto_251949 ) ) ( not ( = ?auto_251948 ?auto_251950 ) ) ( not ( = ?auto_251949 ?auto_251950 ) ) ( ON ?auto_251948 ?auto_251949 ) ( CLEAR ?auto_251946 ) ( ON ?auto_251947 ?auto_251948 ) ( CLEAR ?auto_251947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_251940 ?auto_251941 ?auto_251942 ?auto_251943 ?auto_251944 ?auto_251945 ?auto_251946 ?auto_251947 )
      ( MAKE-10PILE ?auto_251940 ?auto_251941 ?auto_251942 ?auto_251943 ?auto_251944 ?auto_251945 ?auto_251946 ?auto_251947 ?auto_251948 ?auto_251949 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_251982 - BLOCK
      ?auto_251983 - BLOCK
      ?auto_251984 - BLOCK
      ?auto_251985 - BLOCK
      ?auto_251986 - BLOCK
      ?auto_251987 - BLOCK
      ?auto_251988 - BLOCK
      ?auto_251989 - BLOCK
      ?auto_251990 - BLOCK
      ?auto_251991 - BLOCK
    )
    :vars
    (
      ?auto_251992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_251991 ?auto_251992 ) ( ON-TABLE ?auto_251982 ) ( ON ?auto_251983 ?auto_251982 ) ( ON ?auto_251984 ?auto_251983 ) ( ON ?auto_251985 ?auto_251984 ) ( ON ?auto_251986 ?auto_251985 ) ( ON ?auto_251987 ?auto_251986 ) ( not ( = ?auto_251982 ?auto_251983 ) ) ( not ( = ?auto_251982 ?auto_251984 ) ) ( not ( = ?auto_251982 ?auto_251985 ) ) ( not ( = ?auto_251982 ?auto_251986 ) ) ( not ( = ?auto_251982 ?auto_251987 ) ) ( not ( = ?auto_251982 ?auto_251988 ) ) ( not ( = ?auto_251982 ?auto_251989 ) ) ( not ( = ?auto_251982 ?auto_251990 ) ) ( not ( = ?auto_251982 ?auto_251991 ) ) ( not ( = ?auto_251982 ?auto_251992 ) ) ( not ( = ?auto_251983 ?auto_251984 ) ) ( not ( = ?auto_251983 ?auto_251985 ) ) ( not ( = ?auto_251983 ?auto_251986 ) ) ( not ( = ?auto_251983 ?auto_251987 ) ) ( not ( = ?auto_251983 ?auto_251988 ) ) ( not ( = ?auto_251983 ?auto_251989 ) ) ( not ( = ?auto_251983 ?auto_251990 ) ) ( not ( = ?auto_251983 ?auto_251991 ) ) ( not ( = ?auto_251983 ?auto_251992 ) ) ( not ( = ?auto_251984 ?auto_251985 ) ) ( not ( = ?auto_251984 ?auto_251986 ) ) ( not ( = ?auto_251984 ?auto_251987 ) ) ( not ( = ?auto_251984 ?auto_251988 ) ) ( not ( = ?auto_251984 ?auto_251989 ) ) ( not ( = ?auto_251984 ?auto_251990 ) ) ( not ( = ?auto_251984 ?auto_251991 ) ) ( not ( = ?auto_251984 ?auto_251992 ) ) ( not ( = ?auto_251985 ?auto_251986 ) ) ( not ( = ?auto_251985 ?auto_251987 ) ) ( not ( = ?auto_251985 ?auto_251988 ) ) ( not ( = ?auto_251985 ?auto_251989 ) ) ( not ( = ?auto_251985 ?auto_251990 ) ) ( not ( = ?auto_251985 ?auto_251991 ) ) ( not ( = ?auto_251985 ?auto_251992 ) ) ( not ( = ?auto_251986 ?auto_251987 ) ) ( not ( = ?auto_251986 ?auto_251988 ) ) ( not ( = ?auto_251986 ?auto_251989 ) ) ( not ( = ?auto_251986 ?auto_251990 ) ) ( not ( = ?auto_251986 ?auto_251991 ) ) ( not ( = ?auto_251986 ?auto_251992 ) ) ( not ( = ?auto_251987 ?auto_251988 ) ) ( not ( = ?auto_251987 ?auto_251989 ) ) ( not ( = ?auto_251987 ?auto_251990 ) ) ( not ( = ?auto_251987 ?auto_251991 ) ) ( not ( = ?auto_251987 ?auto_251992 ) ) ( not ( = ?auto_251988 ?auto_251989 ) ) ( not ( = ?auto_251988 ?auto_251990 ) ) ( not ( = ?auto_251988 ?auto_251991 ) ) ( not ( = ?auto_251988 ?auto_251992 ) ) ( not ( = ?auto_251989 ?auto_251990 ) ) ( not ( = ?auto_251989 ?auto_251991 ) ) ( not ( = ?auto_251989 ?auto_251992 ) ) ( not ( = ?auto_251990 ?auto_251991 ) ) ( not ( = ?auto_251990 ?auto_251992 ) ) ( not ( = ?auto_251991 ?auto_251992 ) ) ( ON ?auto_251990 ?auto_251991 ) ( ON ?auto_251989 ?auto_251990 ) ( CLEAR ?auto_251987 ) ( ON ?auto_251988 ?auto_251989 ) ( CLEAR ?auto_251988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_251982 ?auto_251983 ?auto_251984 ?auto_251985 ?auto_251986 ?auto_251987 ?auto_251988 )
      ( MAKE-10PILE ?auto_251982 ?auto_251983 ?auto_251984 ?auto_251985 ?auto_251986 ?auto_251987 ?auto_251988 ?auto_251989 ?auto_251990 ?auto_251991 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_252024 - BLOCK
      ?auto_252025 - BLOCK
      ?auto_252026 - BLOCK
      ?auto_252027 - BLOCK
      ?auto_252028 - BLOCK
      ?auto_252029 - BLOCK
      ?auto_252030 - BLOCK
      ?auto_252031 - BLOCK
      ?auto_252032 - BLOCK
      ?auto_252033 - BLOCK
    )
    :vars
    (
      ?auto_252034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252033 ?auto_252034 ) ( ON-TABLE ?auto_252024 ) ( ON ?auto_252025 ?auto_252024 ) ( ON ?auto_252026 ?auto_252025 ) ( ON ?auto_252027 ?auto_252026 ) ( ON ?auto_252028 ?auto_252027 ) ( not ( = ?auto_252024 ?auto_252025 ) ) ( not ( = ?auto_252024 ?auto_252026 ) ) ( not ( = ?auto_252024 ?auto_252027 ) ) ( not ( = ?auto_252024 ?auto_252028 ) ) ( not ( = ?auto_252024 ?auto_252029 ) ) ( not ( = ?auto_252024 ?auto_252030 ) ) ( not ( = ?auto_252024 ?auto_252031 ) ) ( not ( = ?auto_252024 ?auto_252032 ) ) ( not ( = ?auto_252024 ?auto_252033 ) ) ( not ( = ?auto_252024 ?auto_252034 ) ) ( not ( = ?auto_252025 ?auto_252026 ) ) ( not ( = ?auto_252025 ?auto_252027 ) ) ( not ( = ?auto_252025 ?auto_252028 ) ) ( not ( = ?auto_252025 ?auto_252029 ) ) ( not ( = ?auto_252025 ?auto_252030 ) ) ( not ( = ?auto_252025 ?auto_252031 ) ) ( not ( = ?auto_252025 ?auto_252032 ) ) ( not ( = ?auto_252025 ?auto_252033 ) ) ( not ( = ?auto_252025 ?auto_252034 ) ) ( not ( = ?auto_252026 ?auto_252027 ) ) ( not ( = ?auto_252026 ?auto_252028 ) ) ( not ( = ?auto_252026 ?auto_252029 ) ) ( not ( = ?auto_252026 ?auto_252030 ) ) ( not ( = ?auto_252026 ?auto_252031 ) ) ( not ( = ?auto_252026 ?auto_252032 ) ) ( not ( = ?auto_252026 ?auto_252033 ) ) ( not ( = ?auto_252026 ?auto_252034 ) ) ( not ( = ?auto_252027 ?auto_252028 ) ) ( not ( = ?auto_252027 ?auto_252029 ) ) ( not ( = ?auto_252027 ?auto_252030 ) ) ( not ( = ?auto_252027 ?auto_252031 ) ) ( not ( = ?auto_252027 ?auto_252032 ) ) ( not ( = ?auto_252027 ?auto_252033 ) ) ( not ( = ?auto_252027 ?auto_252034 ) ) ( not ( = ?auto_252028 ?auto_252029 ) ) ( not ( = ?auto_252028 ?auto_252030 ) ) ( not ( = ?auto_252028 ?auto_252031 ) ) ( not ( = ?auto_252028 ?auto_252032 ) ) ( not ( = ?auto_252028 ?auto_252033 ) ) ( not ( = ?auto_252028 ?auto_252034 ) ) ( not ( = ?auto_252029 ?auto_252030 ) ) ( not ( = ?auto_252029 ?auto_252031 ) ) ( not ( = ?auto_252029 ?auto_252032 ) ) ( not ( = ?auto_252029 ?auto_252033 ) ) ( not ( = ?auto_252029 ?auto_252034 ) ) ( not ( = ?auto_252030 ?auto_252031 ) ) ( not ( = ?auto_252030 ?auto_252032 ) ) ( not ( = ?auto_252030 ?auto_252033 ) ) ( not ( = ?auto_252030 ?auto_252034 ) ) ( not ( = ?auto_252031 ?auto_252032 ) ) ( not ( = ?auto_252031 ?auto_252033 ) ) ( not ( = ?auto_252031 ?auto_252034 ) ) ( not ( = ?auto_252032 ?auto_252033 ) ) ( not ( = ?auto_252032 ?auto_252034 ) ) ( not ( = ?auto_252033 ?auto_252034 ) ) ( ON ?auto_252032 ?auto_252033 ) ( ON ?auto_252031 ?auto_252032 ) ( ON ?auto_252030 ?auto_252031 ) ( CLEAR ?auto_252028 ) ( ON ?auto_252029 ?auto_252030 ) ( CLEAR ?auto_252029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_252024 ?auto_252025 ?auto_252026 ?auto_252027 ?auto_252028 ?auto_252029 )
      ( MAKE-10PILE ?auto_252024 ?auto_252025 ?auto_252026 ?auto_252027 ?auto_252028 ?auto_252029 ?auto_252030 ?auto_252031 ?auto_252032 ?auto_252033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_252066 - BLOCK
      ?auto_252067 - BLOCK
      ?auto_252068 - BLOCK
      ?auto_252069 - BLOCK
      ?auto_252070 - BLOCK
      ?auto_252071 - BLOCK
      ?auto_252072 - BLOCK
      ?auto_252073 - BLOCK
      ?auto_252074 - BLOCK
      ?auto_252075 - BLOCK
    )
    :vars
    (
      ?auto_252076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252075 ?auto_252076 ) ( ON-TABLE ?auto_252066 ) ( ON ?auto_252067 ?auto_252066 ) ( ON ?auto_252068 ?auto_252067 ) ( ON ?auto_252069 ?auto_252068 ) ( not ( = ?auto_252066 ?auto_252067 ) ) ( not ( = ?auto_252066 ?auto_252068 ) ) ( not ( = ?auto_252066 ?auto_252069 ) ) ( not ( = ?auto_252066 ?auto_252070 ) ) ( not ( = ?auto_252066 ?auto_252071 ) ) ( not ( = ?auto_252066 ?auto_252072 ) ) ( not ( = ?auto_252066 ?auto_252073 ) ) ( not ( = ?auto_252066 ?auto_252074 ) ) ( not ( = ?auto_252066 ?auto_252075 ) ) ( not ( = ?auto_252066 ?auto_252076 ) ) ( not ( = ?auto_252067 ?auto_252068 ) ) ( not ( = ?auto_252067 ?auto_252069 ) ) ( not ( = ?auto_252067 ?auto_252070 ) ) ( not ( = ?auto_252067 ?auto_252071 ) ) ( not ( = ?auto_252067 ?auto_252072 ) ) ( not ( = ?auto_252067 ?auto_252073 ) ) ( not ( = ?auto_252067 ?auto_252074 ) ) ( not ( = ?auto_252067 ?auto_252075 ) ) ( not ( = ?auto_252067 ?auto_252076 ) ) ( not ( = ?auto_252068 ?auto_252069 ) ) ( not ( = ?auto_252068 ?auto_252070 ) ) ( not ( = ?auto_252068 ?auto_252071 ) ) ( not ( = ?auto_252068 ?auto_252072 ) ) ( not ( = ?auto_252068 ?auto_252073 ) ) ( not ( = ?auto_252068 ?auto_252074 ) ) ( not ( = ?auto_252068 ?auto_252075 ) ) ( not ( = ?auto_252068 ?auto_252076 ) ) ( not ( = ?auto_252069 ?auto_252070 ) ) ( not ( = ?auto_252069 ?auto_252071 ) ) ( not ( = ?auto_252069 ?auto_252072 ) ) ( not ( = ?auto_252069 ?auto_252073 ) ) ( not ( = ?auto_252069 ?auto_252074 ) ) ( not ( = ?auto_252069 ?auto_252075 ) ) ( not ( = ?auto_252069 ?auto_252076 ) ) ( not ( = ?auto_252070 ?auto_252071 ) ) ( not ( = ?auto_252070 ?auto_252072 ) ) ( not ( = ?auto_252070 ?auto_252073 ) ) ( not ( = ?auto_252070 ?auto_252074 ) ) ( not ( = ?auto_252070 ?auto_252075 ) ) ( not ( = ?auto_252070 ?auto_252076 ) ) ( not ( = ?auto_252071 ?auto_252072 ) ) ( not ( = ?auto_252071 ?auto_252073 ) ) ( not ( = ?auto_252071 ?auto_252074 ) ) ( not ( = ?auto_252071 ?auto_252075 ) ) ( not ( = ?auto_252071 ?auto_252076 ) ) ( not ( = ?auto_252072 ?auto_252073 ) ) ( not ( = ?auto_252072 ?auto_252074 ) ) ( not ( = ?auto_252072 ?auto_252075 ) ) ( not ( = ?auto_252072 ?auto_252076 ) ) ( not ( = ?auto_252073 ?auto_252074 ) ) ( not ( = ?auto_252073 ?auto_252075 ) ) ( not ( = ?auto_252073 ?auto_252076 ) ) ( not ( = ?auto_252074 ?auto_252075 ) ) ( not ( = ?auto_252074 ?auto_252076 ) ) ( not ( = ?auto_252075 ?auto_252076 ) ) ( ON ?auto_252074 ?auto_252075 ) ( ON ?auto_252073 ?auto_252074 ) ( ON ?auto_252072 ?auto_252073 ) ( ON ?auto_252071 ?auto_252072 ) ( CLEAR ?auto_252069 ) ( ON ?auto_252070 ?auto_252071 ) ( CLEAR ?auto_252070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_252066 ?auto_252067 ?auto_252068 ?auto_252069 ?auto_252070 )
      ( MAKE-10PILE ?auto_252066 ?auto_252067 ?auto_252068 ?auto_252069 ?auto_252070 ?auto_252071 ?auto_252072 ?auto_252073 ?auto_252074 ?auto_252075 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_252108 - BLOCK
      ?auto_252109 - BLOCK
      ?auto_252110 - BLOCK
      ?auto_252111 - BLOCK
      ?auto_252112 - BLOCK
      ?auto_252113 - BLOCK
      ?auto_252114 - BLOCK
      ?auto_252115 - BLOCK
      ?auto_252116 - BLOCK
      ?auto_252117 - BLOCK
    )
    :vars
    (
      ?auto_252118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252117 ?auto_252118 ) ( ON-TABLE ?auto_252108 ) ( ON ?auto_252109 ?auto_252108 ) ( ON ?auto_252110 ?auto_252109 ) ( not ( = ?auto_252108 ?auto_252109 ) ) ( not ( = ?auto_252108 ?auto_252110 ) ) ( not ( = ?auto_252108 ?auto_252111 ) ) ( not ( = ?auto_252108 ?auto_252112 ) ) ( not ( = ?auto_252108 ?auto_252113 ) ) ( not ( = ?auto_252108 ?auto_252114 ) ) ( not ( = ?auto_252108 ?auto_252115 ) ) ( not ( = ?auto_252108 ?auto_252116 ) ) ( not ( = ?auto_252108 ?auto_252117 ) ) ( not ( = ?auto_252108 ?auto_252118 ) ) ( not ( = ?auto_252109 ?auto_252110 ) ) ( not ( = ?auto_252109 ?auto_252111 ) ) ( not ( = ?auto_252109 ?auto_252112 ) ) ( not ( = ?auto_252109 ?auto_252113 ) ) ( not ( = ?auto_252109 ?auto_252114 ) ) ( not ( = ?auto_252109 ?auto_252115 ) ) ( not ( = ?auto_252109 ?auto_252116 ) ) ( not ( = ?auto_252109 ?auto_252117 ) ) ( not ( = ?auto_252109 ?auto_252118 ) ) ( not ( = ?auto_252110 ?auto_252111 ) ) ( not ( = ?auto_252110 ?auto_252112 ) ) ( not ( = ?auto_252110 ?auto_252113 ) ) ( not ( = ?auto_252110 ?auto_252114 ) ) ( not ( = ?auto_252110 ?auto_252115 ) ) ( not ( = ?auto_252110 ?auto_252116 ) ) ( not ( = ?auto_252110 ?auto_252117 ) ) ( not ( = ?auto_252110 ?auto_252118 ) ) ( not ( = ?auto_252111 ?auto_252112 ) ) ( not ( = ?auto_252111 ?auto_252113 ) ) ( not ( = ?auto_252111 ?auto_252114 ) ) ( not ( = ?auto_252111 ?auto_252115 ) ) ( not ( = ?auto_252111 ?auto_252116 ) ) ( not ( = ?auto_252111 ?auto_252117 ) ) ( not ( = ?auto_252111 ?auto_252118 ) ) ( not ( = ?auto_252112 ?auto_252113 ) ) ( not ( = ?auto_252112 ?auto_252114 ) ) ( not ( = ?auto_252112 ?auto_252115 ) ) ( not ( = ?auto_252112 ?auto_252116 ) ) ( not ( = ?auto_252112 ?auto_252117 ) ) ( not ( = ?auto_252112 ?auto_252118 ) ) ( not ( = ?auto_252113 ?auto_252114 ) ) ( not ( = ?auto_252113 ?auto_252115 ) ) ( not ( = ?auto_252113 ?auto_252116 ) ) ( not ( = ?auto_252113 ?auto_252117 ) ) ( not ( = ?auto_252113 ?auto_252118 ) ) ( not ( = ?auto_252114 ?auto_252115 ) ) ( not ( = ?auto_252114 ?auto_252116 ) ) ( not ( = ?auto_252114 ?auto_252117 ) ) ( not ( = ?auto_252114 ?auto_252118 ) ) ( not ( = ?auto_252115 ?auto_252116 ) ) ( not ( = ?auto_252115 ?auto_252117 ) ) ( not ( = ?auto_252115 ?auto_252118 ) ) ( not ( = ?auto_252116 ?auto_252117 ) ) ( not ( = ?auto_252116 ?auto_252118 ) ) ( not ( = ?auto_252117 ?auto_252118 ) ) ( ON ?auto_252116 ?auto_252117 ) ( ON ?auto_252115 ?auto_252116 ) ( ON ?auto_252114 ?auto_252115 ) ( ON ?auto_252113 ?auto_252114 ) ( ON ?auto_252112 ?auto_252113 ) ( CLEAR ?auto_252110 ) ( ON ?auto_252111 ?auto_252112 ) ( CLEAR ?auto_252111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_252108 ?auto_252109 ?auto_252110 ?auto_252111 )
      ( MAKE-10PILE ?auto_252108 ?auto_252109 ?auto_252110 ?auto_252111 ?auto_252112 ?auto_252113 ?auto_252114 ?auto_252115 ?auto_252116 ?auto_252117 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_252150 - BLOCK
      ?auto_252151 - BLOCK
      ?auto_252152 - BLOCK
      ?auto_252153 - BLOCK
      ?auto_252154 - BLOCK
      ?auto_252155 - BLOCK
      ?auto_252156 - BLOCK
      ?auto_252157 - BLOCK
      ?auto_252158 - BLOCK
      ?auto_252159 - BLOCK
    )
    :vars
    (
      ?auto_252160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252159 ?auto_252160 ) ( ON-TABLE ?auto_252150 ) ( ON ?auto_252151 ?auto_252150 ) ( not ( = ?auto_252150 ?auto_252151 ) ) ( not ( = ?auto_252150 ?auto_252152 ) ) ( not ( = ?auto_252150 ?auto_252153 ) ) ( not ( = ?auto_252150 ?auto_252154 ) ) ( not ( = ?auto_252150 ?auto_252155 ) ) ( not ( = ?auto_252150 ?auto_252156 ) ) ( not ( = ?auto_252150 ?auto_252157 ) ) ( not ( = ?auto_252150 ?auto_252158 ) ) ( not ( = ?auto_252150 ?auto_252159 ) ) ( not ( = ?auto_252150 ?auto_252160 ) ) ( not ( = ?auto_252151 ?auto_252152 ) ) ( not ( = ?auto_252151 ?auto_252153 ) ) ( not ( = ?auto_252151 ?auto_252154 ) ) ( not ( = ?auto_252151 ?auto_252155 ) ) ( not ( = ?auto_252151 ?auto_252156 ) ) ( not ( = ?auto_252151 ?auto_252157 ) ) ( not ( = ?auto_252151 ?auto_252158 ) ) ( not ( = ?auto_252151 ?auto_252159 ) ) ( not ( = ?auto_252151 ?auto_252160 ) ) ( not ( = ?auto_252152 ?auto_252153 ) ) ( not ( = ?auto_252152 ?auto_252154 ) ) ( not ( = ?auto_252152 ?auto_252155 ) ) ( not ( = ?auto_252152 ?auto_252156 ) ) ( not ( = ?auto_252152 ?auto_252157 ) ) ( not ( = ?auto_252152 ?auto_252158 ) ) ( not ( = ?auto_252152 ?auto_252159 ) ) ( not ( = ?auto_252152 ?auto_252160 ) ) ( not ( = ?auto_252153 ?auto_252154 ) ) ( not ( = ?auto_252153 ?auto_252155 ) ) ( not ( = ?auto_252153 ?auto_252156 ) ) ( not ( = ?auto_252153 ?auto_252157 ) ) ( not ( = ?auto_252153 ?auto_252158 ) ) ( not ( = ?auto_252153 ?auto_252159 ) ) ( not ( = ?auto_252153 ?auto_252160 ) ) ( not ( = ?auto_252154 ?auto_252155 ) ) ( not ( = ?auto_252154 ?auto_252156 ) ) ( not ( = ?auto_252154 ?auto_252157 ) ) ( not ( = ?auto_252154 ?auto_252158 ) ) ( not ( = ?auto_252154 ?auto_252159 ) ) ( not ( = ?auto_252154 ?auto_252160 ) ) ( not ( = ?auto_252155 ?auto_252156 ) ) ( not ( = ?auto_252155 ?auto_252157 ) ) ( not ( = ?auto_252155 ?auto_252158 ) ) ( not ( = ?auto_252155 ?auto_252159 ) ) ( not ( = ?auto_252155 ?auto_252160 ) ) ( not ( = ?auto_252156 ?auto_252157 ) ) ( not ( = ?auto_252156 ?auto_252158 ) ) ( not ( = ?auto_252156 ?auto_252159 ) ) ( not ( = ?auto_252156 ?auto_252160 ) ) ( not ( = ?auto_252157 ?auto_252158 ) ) ( not ( = ?auto_252157 ?auto_252159 ) ) ( not ( = ?auto_252157 ?auto_252160 ) ) ( not ( = ?auto_252158 ?auto_252159 ) ) ( not ( = ?auto_252158 ?auto_252160 ) ) ( not ( = ?auto_252159 ?auto_252160 ) ) ( ON ?auto_252158 ?auto_252159 ) ( ON ?auto_252157 ?auto_252158 ) ( ON ?auto_252156 ?auto_252157 ) ( ON ?auto_252155 ?auto_252156 ) ( ON ?auto_252154 ?auto_252155 ) ( ON ?auto_252153 ?auto_252154 ) ( CLEAR ?auto_252151 ) ( ON ?auto_252152 ?auto_252153 ) ( CLEAR ?auto_252152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_252150 ?auto_252151 ?auto_252152 )
      ( MAKE-10PILE ?auto_252150 ?auto_252151 ?auto_252152 ?auto_252153 ?auto_252154 ?auto_252155 ?auto_252156 ?auto_252157 ?auto_252158 ?auto_252159 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_252192 - BLOCK
      ?auto_252193 - BLOCK
      ?auto_252194 - BLOCK
      ?auto_252195 - BLOCK
      ?auto_252196 - BLOCK
      ?auto_252197 - BLOCK
      ?auto_252198 - BLOCK
      ?auto_252199 - BLOCK
      ?auto_252200 - BLOCK
      ?auto_252201 - BLOCK
    )
    :vars
    (
      ?auto_252202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252201 ?auto_252202 ) ( ON-TABLE ?auto_252192 ) ( not ( = ?auto_252192 ?auto_252193 ) ) ( not ( = ?auto_252192 ?auto_252194 ) ) ( not ( = ?auto_252192 ?auto_252195 ) ) ( not ( = ?auto_252192 ?auto_252196 ) ) ( not ( = ?auto_252192 ?auto_252197 ) ) ( not ( = ?auto_252192 ?auto_252198 ) ) ( not ( = ?auto_252192 ?auto_252199 ) ) ( not ( = ?auto_252192 ?auto_252200 ) ) ( not ( = ?auto_252192 ?auto_252201 ) ) ( not ( = ?auto_252192 ?auto_252202 ) ) ( not ( = ?auto_252193 ?auto_252194 ) ) ( not ( = ?auto_252193 ?auto_252195 ) ) ( not ( = ?auto_252193 ?auto_252196 ) ) ( not ( = ?auto_252193 ?auto_252197 ) ) ( not ( = ?auto_252193 ?auto_252198 ) ) ( not ( = ?auto_252193 ?auto_252199 ) ) ( not ( = ?auto_252193 ?auto_252200 ) ) ( not ( = ?auto_252193 ?auto_252201 ) ) ( not ( = ?auto_252193 ?auto_252202 ) ) ( not ( = ?auto_252194 ?auto_252195 ) ) ( not ( = ?auto_252194 ?auto_252196 ) ) ( not ( = ?auto_252194 ?auto_252197 ) ) ( not ( = ?auto_252194 ?auto_252198 ) ) ( not ( = ?auto_252194 ?auto_252199 ) ) ( not ( = ?auto_252194 ?auto_252200 ) ) ( not ( = ?auto_252194 ?auto_252201 ) ) ( not ( = ?auto_252194 ?auto_252202 ) ) ( not ( = ?auto_252195 ?auto_252196 ) ) ( not ( = ?auto_252195 ?auto_252197 ) ) ( not ( = ?auto_252195 ?auto_252198 ) ) ( not ( = ?auto_252195 ?auto_252199 ) ) ( not ( = ?auto_252195 ?auto_252200 ) ) ( not ( = ?auto_252195 ?auto_252201 ) ) ( not ( = ?auto_252195 ?auto_252202 ) ) ( not ( = ?auto_252196 ?auto_252197 ) ) ( not ( = ?auto_252196 ?auto_252198 ) ) ( not ( = ?auto_252196 ?auto_252199 ) ) ( not ( = ?auto_252196 ?auto_252200 ) ) ( not ( = ?auto_252196 ?auto_252201 ) ) ( not ( = ?auto_252196 ?auto_252202 ) ) ( not ( = ?auto_252197 ?auto_252198 ) ) ( not ( = ?auto_252197 ?auto_252199 ) ) ( not ( = ?auto_252197 ?auto_252200 ) ) ( not ( = ?auto_252197 ?auto_252201 ) ) ( not ( = ?auto_252197 ?auto_252202 ) ) ( not ( = ?auto_252198 ?auto_252199 ) ) ( not ( = ?auto_252198 ?auto_252200 ) ) ( not ( = ?auto_252198 ?auto_252201 ) ) ( not ( = ?auto_252198 ?auto_252202 ) ) ( not ( = ?auto_252199 ?auto_252200 ) ) ( not ( = ?auto_252199 ?auto_252201 ) ) ( not ( = ?auto_252199 ?auto_252202 ) ) ( not ( = ?auto_252200 ?auto_252201 ) ) ( not ( = ?auto_252200 ?auto_252202 ) ) ( not ( = ?auto_252201 ?auto_252202 ) ) ( ON ?auto_252200 ?auto_252201 ) ( ON ?auto_252199 ?auto_252200 ) ( ON ?auto_252198 ?auto_252199 ) ( ON ?auto_252197 ?auto_252198 ) ( ON ?auto_252196 ?auto_252197 ) ( ON ?auto_252195 ?auto_252196 ) ( ON ?auto_252194 ?auto_252195 ) ( CLEAR ?auto_252192 ) ( ON ?auto_252193 ?auto_252194 ) ( CLEAR ?auto_252193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_252192 ?auto_252193 )
      ( MAKE-10PILE ?auto_252192 ?auto_252193 ?auto_252194 ?auto_252195 ?auto_252196 ?auto_252197 ?auto_252198 ?auto_252199 ?auto_252200 ?auto_252201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_252234 - BLOCK
      ?auto_252235 - BLOCK
      ?auto_252236 - BLOCK
      ?auto_252237 - BLOCK
      ?auto_252238 - BLOCK
      ?auto_252239 - BLOCK
      ?auto_252240 - BLOCK
      ?auto_252241 - BLOCK
      ?auto_252242 - BLOCK
      ?auto_252243 - BLOCK
    )
    :vars
    (
      ?auto_252244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252243 ?auto_252244 ) ( not ( = ?auto_252234 ?auto_252235 ) ) ( not ( = ?auto_252234 ?auto_252236 ) ) ( not ( = ?auto_252234 ?auto_252237 ) ) ( not ( = ?auto_252234 ?auto_252238 ) ) ( not ( = ?auto_252234 ?auto_252239 ) ) ( not ( = ?auto_252234 ?auto_252240 ) ) ( not ( = ?auto_252234 ?auto_252241 ) ) ( not ( = ?auto_252234 ?auto_252242 ) ) ( not ( = ?auto_252234 ?auto_252243 ) ) ( not ( = ?auto_252234 ?auto_252244 ) ) ( not ( = ?auto_252235 ?auto_252236 ) ) ( not ( = ?auto_252235 ?auto_252237 ) ) ( not ( = ?auto_252235 ?auto_252238 ) ) ( not ( = ?auto_252235 ?auto_252239 ) ) ( not ( = ?auto_252235 ?auto_252240 ) ) ( not ( = ?auto_252235 ?auto_252241 ) ) ( not ( = ?auto_252235 ?auto_252242 ) ) ( not ( = ?auto_252235 ?auto_252243 ) ) ( not ( = ?auto_252235 ?auto_252244 ) ) ( not ( = ?auto_252236 ?auto_252237 ) ) ( not ( = ?auto_252236 ?auto_252238 ) ) ( not ( = ?auto_252236 ?auto_252239 ) ) ( not ( = ?auto_252236 ?auto_252240 ) ) ( not ( = ?auto_252236 ?auto_252241 ) ) ( not ( = ?auto_252236 ?auto_252242 ) ) ( not ( = ?auto_252236 ?auto_252243 ) ) ( not ( = ?auto_252236 ?auto_252244 ) ) ( not ( = ?auto_252237 ?auto_252238 ) ) ( not ( = ?auto_252237 ?auto_252239 ) ) ( not ( = ?auto_252237 ?auto_252240 ) ) ( not ( = ?auto_252237 ?auto_252241 ) ) ( not ( = ?auto_252237 ?auto_252242 ) ) ( not ( = ?auto_252237 ?auto_252243 ) ) ( not ( = ?auto_252237 ?auto_252244 ) ) ( not ( = ?auto_252238 ?auto_252239 ) ) ( not ( = ?auto_252238 ?auto_252240 ) ) ( not ( = ?auto_252238 ?auto_252241 ) ) ( not ( = ?auto_252238 ?auto_252242 ) ) ( not ( = ?auto_252238 ?auto_252243 ) ) ( not ( = ?auto_252238 ?auto_252244 ) ) ( not ( = ?auto_252239 ?auto_252240 ) ) ( not ( = ?auto_252239 ?auto_252241 ) ) ( not ( = ?auto_252239 ?auto_252242 ) ) ( not ( = ?auto_252239 ?auto_252243 ) ) ( not ( = ?auto_252239 ?auto_252244 ) ) ( not ( = ?auto_252240 ?auto_252241 ) ) ( not ( = ?auto_252240 ?auto_252242 ) ) ( not ( = ?auto_252240 ?auto_252243 ) ) ( not ( = ?auto_252240 ?auto_252244 ) ) ( not ( = ?auto_252241 ?auto_252242 ) ) ( not ( = ?auto_252241 ?auto_252243 ) ) ( not ( = ?auto_252241 ?auto_252244 ) ) ( not ( = ?auto_252242 ?auto_252243 ) ) ( not ( = ?auto_252242 ?auto_252244 ) ) ( not ( = ?auto_252243 ?auto_252244 ) ) ( ON ?auto_252242 ?auto_252243 ) ( ON ?auto_252241 ?auto_252242 ) ( ON ?auto_252240 ?auto_252241 ) ( ON ?auto_252239 ?auto_252240 ) ( ON ?auto_252238 ?auto_252239 ) ( ON ?auto_252237 ?auto_252238 ) ( ON ?auto_252236 ?auto_252237 ) ( ON ?auto_252235 ?auto_252236 ) ( ON ?auto_252234 ?auto_252235 ) ( CLEAR ?auto_252234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_252234 )
      ( MAKE-10PILE ?auto_252234 ?auto_252235 ?auto_252236 ?auto_252237 ?auto_252238 ?auto_252239 ?auto_252240 ?auto_252241 ?auto_252242 ?auto_252243 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252277 - BLOCK
      ?auto_252278 - BLOCK
      ?auto_252279 - BLOCK
      ?auto_252280 - BLOCK
      ?auto_252281 - BLOCK
      ?auto_252282 - BLOCK
      ?auto_252283 - BLOCK
      ?auto_252284 - BLOCK
      ?auto_252285 - BLOCK
      ?auto_252286 - BLOCK
      ?auto_252287 - BLOCK
    )
    :vars
    (
      ?auto_252288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_252286 ) ( ON ?auto_252287 ?auto_252288 ) ( CLEAR ?auto_252287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_252277 ) ( ON ?auto_252278 ?auto_252277 ) ( ON ?auto_252279 ?auto_252278 ) ( ON ?auto_252280 ?auto_252279 ) ( ON ?auto_252281 ?auto_252280 ) ( ON ?auto_252282 ?auto_252281 ) ( ON ?auto_252283 ?auto_252282 ) ( ON ?auto_252284 ?auto_252283 ) ( ON ?auto_252285 ?auto_252284 ) ( ON ?auto_252286 ?auto_252285 ) ( not ( = ?auto_252277 ?auto_252278 ) ) ( not ( = ?auto_252277 ?auto_252279 ) ) ( not ( = ?auto_252277 ?auto_252280 ) ) ( not ( = ?auto_252277 ?auto_252281 ) ) ( not ( = ?auto_252277 ?auto_252282 ) ) ( not ( = ?auto_252277 ?auto_252283 ) ) ( not ( = ?auto_252277 ?auto_252284 ) ) ( not ( = ?auto_252277 ?auto_252285 ) ) ( not ( = ?auto_252277 ?auto_252286 ) ) ( not ( = ?auto_252277 ?auto_252287 ) ) ( not ( = ?auto_252277 ?auto_252288 ) ) ( not ( = ?auto_252278 ?auto_252279 ) ) ( not ( = ?auto_252278 ?auto_252280 ) ) ( not ( = ?auto_252278 ?auto_252281 ) ) ( not ( = ?auto_252278 ?auto_252282 ) ) ( not ( = ?auto_252278 ?auto_252283 ) ) ( not ( = ?auto_252278 ?auto_252284 ) ) ( not ( = ?auto_252278 ?auto_252285 ) ) ( not ( = ?auto_252278 ?auto_252286 ) ) ( not ( = ?auto_252278 ?auto_252287 ) ) ( not ( = ?auto_252278 ?auto_252288 ) ) ( not ( = ?auto_252279 ?auto_252280 ) ) ( not ( = ?auto_252279 ?auto_252281 ) ) ( not ( = ?auto_252279 ?auto_252282 ) ) ( not ( = ?auto_252279 ?auto_252283 ) ) ( not ( = ?auto_252279 ?auto_252284 ) ) ( not ( = ?auto_252279 ?auto_252285 ) ) ( not ( = ?auto_252279 ?auto_252286 ) ) ( not ( = ?auto_252279 ?auto_252287 ) ) ( not ( = ?auto_252279 ?auto_252288 ) ) ( not ( = ?auto_252280 ?auto_252281 ) ) ( not ( = ?auto_252280 ?auto_252282 ) ) ( not ( = ?auto_252280 ?auto_252283 ) ) ( not ( = ?auto_252280 ?auto_252284 ) ) ( not ( = ?auto_252280 ?auto_252285 ) ) ( not ( = ?auto_252280 ?auto_252286 ) ) ( not ( = ?auto_252280 ?auto_252287 ) ) ( not ( = ?auto_252280 ?auto_252288 ) ) ( not ( = ?auto_252281 ?auto_252282 ) ) ( not ( = ?auto_252281 ?auto_252283 ) ) ( not ( = ?auto_252281 ?auto_252284 ) ) ( not ( = ?auto_252281 ?auto_252285 ) ) ( not ( = ?auto_252281 ?auto_252286 ) ) ( not ( = ?auto_252281 ?auto_252287 ) ) ( not ( = ?auto_252281 ?auto_252288 ) ) ( not ( = ?auto_252282 ?auto_252283 ) ) ( not ( = ?auto_252282 ?auto_252284 ) ) ( not ( = ?auto_252282 ?auto_252285 ) ) ( not ( = ?auto_252282 ?auto_252286 ) ) ( not ( = ?auto_252282 ?auto_252287 ) ) ( not ( = ?auto_252282 ?auto_252288 ) ) ( not ( = ?auto_252283 ?auto_252284 ) ) ( not ( = ?auto_252283 ?auto_252285 ) ) ( not ( = ?auto_252283 ?auto_252286 ) ) ( not ( = ?auto_252283 ?auto_252287 ) ) ( not ( = ?auto_252283 ?auto_252288 ) ) ( not ( = ?auto_252284 ?auto_252285 ) ) ( not ( = ?auto_252284 ?auto_252286 ) ) ( not ( = ?auto_252284 ?auto_252287 ) ) ( not ( = ?auto_252284 ?auto_252288 ) ) ( not ( = ?auto_252285 ?auto_252286 ) ) ( not ( = ?auto_252285 ?auto_252287 ) ) ( not ( = ?auto_252285 ?auto_252288 ) ) ( not ( = ?auto_252286 ?auto_252287 ) ) ( not ( = ?auto_252286 ?auto_252288 ) ) ( not ( = ?auto_252287 ?auto_252288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_252287 ?auto_252288 )
      ( !STACK ?auto_252287 ?auto_252286 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252323 - BLOCK
      ?auto_252324 - BLOCK
      ?auto_252325 - BLOCK
      ?auto_252326 - BLOCK
      ?auto_252327 - BLOCK
      ?auto_252328 - BLOCK
      ?auto_252329 - BLOCK
      ?auto_252330 - BLOCK
      ?auto_252331 - BLOCK
      ?auto_252332 - BLOCK
      ?auto_252333 - BLOCK
    )
    :vars
    (
      ?auto_252334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252333 ?auto_252334 ) ( ON-TABLE ?auto_252323 ) ( ON ?auto_252324 ?auto_252323 ) ( ON ?auto_252325 ?auto_252324 ) ( ON ?auto_252326 ?auto_252325 ) ( ON ?auto_252327 ?auto_252326 ) ( ON ?auto_252328 ?auto_252327 ) ( ON ?auto_252329 ?auto_252328 ) ( ON ?auto_252330 ?auto_252329 ) ( ON ?auto_252331 ?auto_252330 ) ( not ( = ?auto_252323 ?auto_252324 ) ) ( not ( = ?auto_252323 ?auto_252325 ) ) ( not ( = ?auto_252323 ?auto_252326 ) ) ( not ( = ?auto_252323 ?auto_252327 ) ) ( not ( = ?auto_252323 ?auto_252328 ) ) ( not ( = ?auto_252323 ?auto_252329 ) ) ( not ( = ?auto_252323 ?auto_252330 ) ) ( not ( = ?auto_252323 ?auto_252331 ) ) ( not ( = ?auto_252323 ?auto_252332 ) ) ( not ( = ?auto_252323 ?auto_252333 ) ) ( not ( = ?auto_252323 ?auto_252334 ) ) ( not ( = ?auto_252324 ?auto_252325 ) ) ( not ( = ?auto_252324 ?auto_252326 ) ) ( not ( = ?auto_252324 ?auto_252327 ) ) ( not ( = ?auto_252324 ?auto_252328 ) ) ( not ( = ?auto_252324 ?auto_252329 ) ) ( not ( = ?auto_252324 ?auto_252330 ) ) ( not ( = ?auto_252324 ?auto_252331 ) ) ( not ( = ?auto_252324 ?auto_252332 ) ) ( not ( = ?auto_252324 ?auto_252333 ) ) ( not ( = ?auto_252324 ?auto_252334 ) ) ( not ( = ?auto_252325 ?auto_252326 ) ) ( not ( = ?auto_252325 ?auto_252327 ) ) ( not ( = ?auto_252325 ?auto_252328 ) ) ( not ( = ?auto_252325 ?auto_252329 ) ) ( not ( = ?auto_252325 ?auto_252330 ) ) ( not ( = ?auto_252325 ?auto_252331 ) ) ( not ( = ?auto_252325 ?auto_252332 ) ) ( not ( = ?auto_252325 ?auto_252333 ) ) ( not ( = ?auto_252325 ?auto_252334 ) ) ( not ( = ?auto_252326 ?auto_252327 ) ) ( not ( = ?auto_252326 ?auto_252328 ) ) ( not ( = ?auto_252326 ?auto_252329 ) ) ( not ( = ?auto_252326 ?auto_252330 ) ) ( not ( = ?auto_252326 ?auto_252331 ) ) ( not ( = ?auto_252326 ?auto_252332 ) ) ( not ( = ?auto_252326 ?auto_252333 ) ) ( not ( = ?auto_252326 ?auto_252334 ) ) ( not ( = ?auto_252327 ?auto_252328 ) ) ( not ( = ?auto_252327 ?auto_252329 ) ) ( not ( = ?auto_252327 ?auto_252330 ) ) ( not ( = ?auto_252327 ?auto_252331 ) ) ( not ( = ?auto_252327 ?auto_252332 ) ) ( not ( = ?auto_252327 ?auto_252333 ) ) ( not ( = ?auto_252327 ?auto_252334 ) ) ( not ( = ?auto_252328 ?auto_252329 ) ) ( not ( = ?auto_252328 ?auto_252330 ) ) ( not ( = ?auto_252328 ?auto_252331 ) ) ( not ( = ?auto_252328 ?auto_252332 ) ) ( not ( = ?auto_252328 ?auto_252333 ) ) ( not ( = ?auto_252328 ?auto_252334 ) ) ( not ( = ?auto_252329 ?auto_252330 ) ) ( not ( = ?auto_252329 ?auto_252331 ) ) ( not ( = ?auto_252329 ?auto_252332 ) ) ( not ( = ?auto_252329 ?auto_252333 ) ) ( not ( = ?auto_252329 ?auto_252334 ) ) ( not ( = ?auto_252330 ?auto_252331 ) ) ( not ( = ?auto_252330 ?auto_252332 ) ) ( not ( = ?auto_252330 ?auto_252333 ) ) ( not ( = ?auto_252330 ?auto_252334 ) ) ( not ( = ?auto_252331 ?auto_252332 ) ) ( not ( = ?auto_252331 ?auto_252333 ) ) ( not ( = ?auto_252331 ?auto_252334 ) ) ( not ( = ?auto_252332 ?auto_252333 ) ) ( not ( = ?auto_252332 ?auto_252334 ) ) ( not ( = ?auto_252333 ?auto_252334 ) ) ( CLEAR ?auto_252331 ) ( ON ?auto_252332 ?auto_252333 ) ( CLEAR ?auto_252332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_252323 ?auto_252324 ?auto_252325 ?auto_252326 ?auto_252327 ?auto_252328 ?auto_252329 ?auto_252330 ?auto_252331 ?auto_252332 )
      ( MAKE-11PILE ?auto_252323 ?auto_252324 ?auto_252325 ?auto_252326 ?auto_252327 ?auto_252328 ?auto_252329 ?auto_252330 ?auto_252331 ?auto_252332 ?auto_252333 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252369 - BLOCK
      ?auto_252370 - BLOCK
      ?auto_252371 - BLOCK
      ?auto_252372 - BLOCK
      ?auto_252373 - BLOCK
      ?auto_252374 - BLOCK
      ?auto_252375 - BLOCK
      ?auto_252376 - BLOCK
      ?auto_252377 - BLOCK
      ?auto_252378 - BLOCK
      ?auto_252379 - BLOCK
    )
    :vars
    (
      ?auto_252380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252379 ?auto_252380 ) ( ON-TABLE ?auto_252369 ) ( ON ?auto_252370 ?auto_252369 ) ( ON ?auto_252371 ?auto_252370 ) ( ON ?auto_252372 ?auto_252371 ) ( ON ?auto_252373 ?auto_252372 ) ( ON ?auto_252374 ?auto_252373 ) ( ON ?auto_252375 ?auto_252374 ) ( ON ?auto_252376 ?auto_252375 ) ( not ( = ?auto_252369 ?auto_252370 ) ) ( not ( = ?auto_252369 ?auto_252371 ) ) ( not ( = ?auto_252369 ?auto_252372 ) ) ( not ( = ?auto_252369 ?auto_252373 ) ) ( not ( = ?auto_252369 ?auto_252374 ) ) ( not ( = ?auto_252369 ?auto_252375 ) ) ( not ( = ?auto_252369 ?auto_252376 ) ) ( not ( = ?auto_252369 ?auto_252377 ) ) ( not ( = ?auto_252369 ?auto_252378 ) ) ( not ( = ?auto_252369 ?auto_252379 ) ) ( not ( = ?auto_252369 ?auto_252380 ) ) ( not ( = ?auto_252370 ?auto_252371 ) ) ( not ( = ?auto_252370 ?auto_252372 ) ) ( not ( = ?auto_252370 ?auto_252373 ) ) ( not ( = ?auto_252370 ?auto_252374 ) ) ( not ( = ?auto_252370 ?auto_252375 ) ) ( not ( = ?auto_252370 ?auto_252376 ) ) ( not ( = ?auto_252370 ?auto_252377 ) ) ( not ( = ?auto_252370 ?auto_252378 ) ) ( not ( = ?auto_252370 ?auto_252379 ) ) ( not ( = ?auto_252370 ?auto_252380 ) ) ( not ( = ?auto_252371 ?auto_252372 ) ) ( not ( = ?auto_252371 ?auto_252373 ) ) ( not ( = ?auto_252371 ?auto_252374 ) ) ( not ( = ?auto_252371 ?auto_252375 ) ) ( not ( = ?auto_252371 ?auto_252376 ) ) ( not ( = ?auto_252371 ?auto_252377 ) ) ( not ( = ?auto_252371 ?auto_252378 ) ) ( not ( = ?auto_252371 ?auto_252379 ) ) ( not ( = ?auto_252371 ?auto_252380 ) ) ( not ( = ?auto_252372 ?auto_252373 ) ) ( not ( = ?auto_252372 ?auto_252374 ) ) ( not ( = ?auto_252372 ?auto_252375 ) ) ( not ( = ?auto_252372 ?auto_252376 ) ) ( not ( = ?auto_252372 ?auto_252377 ) ) ( not ( = ?auto_252372 ?auto_252378 ) ) ( not ( = ?auto_252372 ?auto_252379 ) ) ( not ( = ?auto_252372 ?auto_252380 ) ) ( not ( = ?auto_252373 ?auto_252374 ) ) ( not ( = ?auto_252373 ?auto_252375 ) ) ( not ( = ?auto_252373 ?auto_252376 ) ) ( not ( = ?auto_252373 ?auto_252377 ) ) ( not ( = ?auto_252373 ?auto_252378 ) ) ( not ( = ?auto_252373 ?auto_252379 ) ) ( not ( = ?auto_252373 ?auto_252380 ) ) ( not ( = ?auto_252374 ?auto_252375 ) ) ( not ( = ?auto_252374 ?auto_252376 ) ) ( not ( = ?auto_252374 ?auto_252377 ) ) ( not ( = ?auto_252374 ?auto_252378 ) ) ( not ( = ?auto_252374 ?auto_252379 ) ) ( not ( = ?auto_252374 ?auto_252380 ) ) ( not ( = ?auto_252375 ?auto_252376 ) ) ( not ( = ?auto_252375 ?auto_252377 ) ) ( not ( = ?auto_252375 ?auto_252378 ) ) ( not ( = ?auto_252375 ?auto_252379 ) ) ( not ( = ?auto_252375 ?auto_252380 ) ) ( not ( = ?auto_252376 ?auto_252377 ) ) ( not ( = ?auto_252376 ?auto_252378 ) ) ( not ( = ?auto_252376 ?auto_252379 ) ) ( not ( = ?auto_252376 ?auto_252380 ) ) ( not ( = ?auto_252377 ?auto_252378 ) ) ( not ( = ?auto_252377 ?auto_252379 ) ) ( not ( = ?auto_252377 ?auto_252380 ) ) ( not ( = ?auto_252378 ?auto_252379 ) ) ( not ( = ?auto_252378 ?auto_252380 ) ) ( not ( = ?auto_252379 ?auto_252380 ) ) ( ON ?auto_252378 ?auto_252379 ) ( CLEAR ?auto_252376 ) ( ON ?auto_252377 ?auto_252378 ) ( CLEAR ?auto_252377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_252369 ?auto_252370 ?auto_252371 ?auto_252372 ?auto_252373 ?auto_252374 ?auto_252375 ?auto_252376 ?auto_252377 )
      ( MAKE-11PILE ?auto_252369 ?auto_252370 ?auto_252371 ?auto_252372 ?auto_252373 ?auto_252374 ?auto_252375 ?auto_252376 ?auto_252377 ?auto_252378 ?auto_252379 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252415 - BLOCK
      ?auto_252416 - BLOCK
      ?auto_252417 - BLOCK
      ?auto_252418 - BLOCK
      ?auto_252419 - BLOCK
      ?auto_252420 - BLOCK
      ?auto_252421 - BLOCK
      ?auto_252422 - BLOCK
      ?auto_252423 - BLOCK
      ?auto_252424 - BLOCK
      ?auto_252425 - BLOCK
    )
    :vars
    (
      ?auto_252426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252425 ?auto_252426 ) ( ON-TABLE ?auto_252415 ) ( ON ?auto_252416 ?auto_252415 ) ( ON ?auto_252417 ?auto_252416 ) ( ON ?auto_252418 ?auto_252417 ) ( ON ?auto_252419 ?auto_252418 ) ( ON ?auto_252420 ?auto_252419 ) ( ON ?auto_252421 ?auto_252420 ) ( not ( = ?auto_252415 ?auto_252416 ) ) ( not ( = ?auto_252415 ?auto_252417 ) ) ( not ( = ?auto_252415 ?auto_252418 ) ) ( not ( = ?auto_252415 ?auto_252419 ) ) ( not ( = ?auto_252415 ?auto_252420 ) ) ( not ( = ?auto_252415 ?auto_252421 ) ) ( not ( = ?auto_252415 ?auto_252422 ) ) ( not ( = ?auto_252415 ?auto_252423 ) ) ( not ( = ?auto_252415 ?auto_252424 ) ) ( not ( = ?auto_252415 ?auto_252425 ) ) ( not ( = ?auto_252415 ?auto_252426 ) ) ( not ( = ?auto_252416 ?auto_252417 ) ) ( not ( = ?auto_252416 ?auto_252418 ) ) ( not ( = ?auto_252416 ?auto_252419 ) ) ( not ( = ?auto_252416 ?auto_252420 ) ) ( not ( = ?auto_252416 ?auto_252421 ) ) ( not ( = ?auto_252416 ?auto_252422 ) ) ( not ( = ?auto_252416 ?auto_252423 ) ) ( not ( = ?auto_252416 ?auto_252424 ) ) ( not ( = ?auto_252416 ?auto_252425 ) ) ( not ( = ?auto_252416 ?auto_252426 ) ) ( not ( = ?auto_252417 ?auto_252418 ) ) ( not ( = ?auto_252417 ?auto_252419 ) ) ( not ( = ?auto_252417 ?auto_252420 ) ) ( not ( = ?auto_252417 ?auto_252421 ) ) ( not ( = ?auto_252417 ?auto_252422 ) ) ( not ( = ?auto_252417 ?auto_252423 ) ) ( not ( = ?auto_252417 ?auto_252424 ) ) ( not ( = ?auto_252417 ?auto_252425 ) ) ( not ( = ?auto_252417 ?auto_252426 ) ) ( not ( = ?auto_252418 ?auto_252419 ) ) ( not ( = ?auto_252418 ?auto_252420 ) ) ( not ( = ?auto_252418 ?auto_252421 ) ) ( not ( = ?auto_252418 ?auto_252422 ) ) ( not ( = ?auto_252418 ?auto_252423 ) ) ( not ( = ?auto_252418 ?auto_252424 ) ) ( not ( = ?auto_252418 ?auto_252425 ) ) ( not ( = ?auto_252418 ?auto_252426 ) ) ( not ( = ?auto_252419 ?auto_252420 ) ) ( not ( = ?auto_252419 ?auto_252421 ) ) ( not ( = ?auto_252419 ?auto_252422 ) ) ( not ( = ?auto_252419 ?auto_252423 ) ) ( not ( = ?auto_252419 ?auto_252424 ) ) ( not ( = ?auto_252419 ?auto_252425 ) ) ( not ( = ?auto_252419 ?auto_252426 ) ) ( not ( = ?auto_252420 ?auto_252421 ) ) ( not ( = ?auto_252420 ?auto_252422 ) ) ( not ( = ?auto_252420 ?auto_252423 ) ) ( not ( = ?auto_252420 ?auto_252424 ) ) ( not ( = ?auto_252420 ?auto_252425 ) ) ( not ( = ?auto_252420 ?auto_252426 ) ) ( not ( = ?auto_252421 ?auto_252422 ) ) ( not ( = ?auto_252421 ?auto_252423 ) ) ( not ( = ?auto_252421 ?auto_252424 ) ) ( not ( = ?auto_252421 ?auto_252425 ) ) ( not ( = ?auto_252421 ?auto_252426 ) ) ( not ( = ?auto_252422 ?auto_252423 ) ) ( not ( = ?auto_252422 ?auto_252424 ) ) ( not ( = ?auto_252422 ?auto_252425 ) ) ( not ( = ?auto_252422 ?auto_252426 ) ) ( not ( = ?auto_252423 ?auto_252424 ) ) ( not ( = ?auto_252423 ?auto_252425 ) ) ( not ( = ?auto_252423 ?auto_252426 ) ) ( not ( = ?auto_252424 ?auto_252425 ) ) ( not ( = ?auto_252424 ?auto_252426 ) ) ( not ( = ?auto_252425 ?auto_252426 ) ) ( ON ?auto_252424 ?auto_252425 ) ( ON ?auto_252423 ?auto_252424 ) ( CLEAR ?auto_252421 ) ( ON ?auto_252422 ?auto_252423 ) ( CLEAR ?auto_252422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_252415 ?auto_252416 ?auto_252417 ?auto_252418 ?auto_252419 ?auto_252420 ?auto_252421 ?auto_252422 )
      ( MAKE-11PILE ?auto_252415 ?auto_252416 ?auto_252417 ?auto_252418 ?auto_252419 ?auto_252420 ?auto_252421 ?auto_252422 ?auto_252423 ?auto_252424 ?auto_252425 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252461 - BLOCK
      ?auto_252462 - BLOCK
      ?auto_252463 - BLOCK
      ?auto_252464 - BLOCK
      ?auto_252465 - BLOCK
      ?auto_252466 - BLOCK
      ?auto_252467 - BLOCK
      ?auto_252468 - BLOCK
      ?auto_252469 - BLOCK
      ?auto_252470 - BLOCK
      ?auto_252471 - BLOCK
    )
    :vars
    (
      ?auto_252472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252471 ?auto_252472 ) ( ON-TABLE ?auto_252461 ) ( ON ?auto_252462 ?auto_252461 ) ( ON ?auto_252463 ?auto_252462 ) ( ON ?auto_252464 ?auto_252463 ) ( ON ?auto_252465 ?auto_252464 ) ( ON ?auto_252466 ?auto_252465 ) ( not ( = ?auto_252461 ?auto_252462 ) ) ( not ( = ?auto_252461 ?auto_252463 ) ) ( not ( = ?auto_252461 ?auto_252464 ) ) ( not ( = ?auto_252461 ?auto_252465 ) ) ( not ( = ?auto_252461 ?auto_252466 ) ) ( not ( = ?auto_252461 ?auto_252467 ) ) ( not ( = ?auto_252461 ?auto_252468 ) ) ( not ( = ?auto_252461 ?auto_252469 ) ) ( not ( = ?auto_252461 ?auto_252470 ) ) ( not ( = ?auto_252461 ?auto_252471 ) ) ( not ( = ?auto_252461 ?auto_252472 ) ) ( not ( = ?auto_252462 ?auto_252463 ) ) ( not ( = ?auto_252462 ?auto_252464 ) ) ( not ( = ?auto_252462 ?auto_252465 ) ) ( not ( = ?auto_252462 ?auto_252466 ) ) ( not ( = ?auto_252462 ?auto_252467 ) ) ( not ( = ?auto_252462 ?auto_252468 ) ) ( not ( = ?auto_252462 ?auto_252469 ) ) ( not ( = ?auto_252462 ?auto_252470 ) ) ( not ( = ?auto_252462 ?auto_252471 ) ) ( not ( = ?auto_252462 ?auto_252472 ) ) ( not ( = ?auto_252463 ?auto_252464 ) ) ( not ( = ?auto_252463 ?auto_252465 ) ) ( not ( = ?auto_252463 ?auto_252466 ) ) ( not ( = ?auto_252463 ?auto_252467 ) ) ( not ( = ?auto_252463 ?auto_252468 ) ) ( not ( = ?auto_252463 ?auto_252469 ) ) ( not ( = ?auto_252463 ?auto_252470 ) ) ( not ( = ?auto_252463 ?auto_252471 ) ) ( not ( = ?auto_252463 ?auto_252472 ) ) ( not ( = ?auto_252464 ?auto_252465 ) ) ( not ( = ?auto_252464 ?auto_252466 ) ) ( not ( = ?auto_252464 ?auto_252467 ) ) ( not ( = ?auto_252464 ?auto_252468 ) ) ( not ( = ?auto_252464 ?auto_252469 ) ) ( not ( = ?auto_252464 ?auto_252470 ) ) ( not ( = ?auto_252464 ?auto_252471 ) ) ( not ( = ?auto_252464 ?auto_252472 ) ) ( not ( = ?auto_252465 ?auto_252466 ) ) ( not ( = ?auto_252465 ?auto_252467 ) ) ( not ( = ?auto_252465 ?auto_252468 ) ) ( not ( = ?auto_252465 ?auto_252469 ) ) ( not ( = ?auto_252465 ?auto_252470 ) ) ( not ( = ?auto_252465 ?auto_252471 ) ) ( not ( = ?auto_252465 ?auto_252472 ) ) ( not ( = ?auto_252466 ?auto_252467 ) ) ( not ( = ?auto_252466 ?auto_252468 ) ) ( not ( = ?auto_252466 ?auto_252469 ) ) ( not ( = ?auto_252466 ?auto_252470 ) ) ( not ( = ?auto_252466 ?auto_252471 ) ) ( not ( = ?auto_252466 ?auto_252472 ) ) ( not ( = ?auto_252467 ?auto_252468 ) ) ( not ( = ?auto_252467 ?auto_252469 ) ) ( not ( = ?auto_252467 ?auto_252470 ) ) ( not ( = ?auto_252467 ?auto_252471 ) ) ( not ( = ?auto_252467 ?auto_252472 ) ) ( not ( = ?auto_252468 ?auto_252469 ) ) ( not ( = ?auto_252468 ?auto_252470 ) ) ( not ( = ?auto_252468 ?auto_252471 ) ) ( not ( = ?auto_252468 ?auto_252472 ) ) ( not ( = ?auto_252469 ?auto_252470 ) ) ( not ( = ?auto_252469 ?auto_252471 ) ) ( not ( = ?auto_252469 ?auto_252472 ) ) ( not ( = ?auto_252470 ?auto_252471 ) ) ( not ( = ?auto_252470 ?auto_252472 ) ) ( not ( = ?auto_252471 ?auto_252472 ) ) ( ON ?auto_252470 ?auto_252471 ) ( ON ?auto_252469 ?auto_252470 ) ( ON ?auto_252468 ?auto_252469 ) ( CLEAR ?auto_252466 ) ( ON ?auto_252467 ?auto_252468 ) ( CLEAR ?auto_252467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_252461 ?auto_252462 ?auto_252463 ?auto_252464 ?auto_252465 ?auto_252466 ?auto_252467 )
      ( MAKE-11PILE ?auto_252461 ?auto_252462 ?auto_252463 ?auto_252464 ?auto_252465 ?auto_252466 ?auto_252467 ?auto_252468 ?auto_252469 ?auto_252470 ?auto_252471 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252507 - BLOCK
      ?auto_252508 - BLOCK
      ?auto_252509 - BLOCK
      ?auto_252510 - BLOCK
      ?auto_252511 - BLOCK
      ?auto_252512 - BLOCK
      ?auto_252513 - BLOCK
      ?auto_252514 - BLOCK
      ?auto_252515 - BLOCK
      ?auto_252516 - BLOCK
      ?auto_252517 - BLOCK
    )
    :vars
    (
      ?auto_252518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252517 ?auto_252518 ) ( ON-TABLE ?auto_252507 ) ( ON ?auto_252508 ?auto_252507 ) ( ON ?auto_252509 ?auto_252508 ) ( ON ?auto_252510 ?auto_252509 ) ( ON ?auto_252511 ?auto_252510 ) ( not ( = ?auto_252507 ?auto_252508 ) ) ( not ( = ?auto_252507 ?auto_252509 ) ) ( not ( = ?auto_252507 ?auto_252510 ) ) ( not ( = ?auto_252507 ?auto_252511 ) ) ( not ( = ?auto_252507 ?auto_252512 ) ) ( not ( = ?auto_252507 ?auto_252513 ) ) ( not ( = ?auto_252507 ?auto_252514 ) ) ( not ( = ?auto_252507 ?auto_252515 ) ) ( not ( = ?auto_252507 ?auto_252516 ) ) ( not ( = ?auto_252507 ?auto_252517 ) ) ( not ( = ?auto_252507 ?auto_252518 ) ) ( not ( = ?auto_252508 ?auto_252509 ) ) ( not ( = ?auto_252508 ?auto_252510 ) ) ( not ( = ?auto_252508 ?auto_252511 ) ) ( not ( = ?auto_252508 ?auto_252512 ) ) ( not ( = ?auto_252508 ?auto_252513 ) ) ( not ( = ?auto_252508 ?auto_252514 ) ) ( not ( = ?auto_252508 ?auto_252515 ) ) ( not ( = ?auto_252508 ?auto_252516 ) ) ( not ( = ?auto_252508 ?auto_252517 ) ) ( not ( = ?auto_252508 ?auto_252518 ) ) ( not ( = ?auto_252509 ?auto_252510 ) ) ( not ( = ?auto_252509 ?auto_252511 ) ) ( not ( = ?auto_252509 ?auto_252512 ) ) ( not ( = ?auto_252509 ?auto_252513 ) ) ( not ( = ?auto_252509 ?auto_252514 ) ) ( not ( = ?auto_252509 ?auto_252515 ) ) ( not ( = ?auto_252509 ?auto_252516 ) ) ( not ( = ?auto_252509 ?auto_252517 ) ) ( not ( = ?auto_252509 ?auto_252518 ) ) ( not ( = ?auto_252510 ?auto_252511 ) ) ( not ( = ?auto_252510 ?auto_252512 ) ) ( not ( = ?auto_252510 ?auto_252513 ) ) ( not ( = ?auto_252510 ?auto_252514 ) ) ( not ( = ?auto_252510 ?auto_252515 ) ) ( not ( = ?auto_252510 ?auto_252516 ) ) ( not ( = ?auto_252510 ?auto_252517 ) ) ( not ( = ?auto_252510 ?auto_252518 ) ) ( not ( = ?auto_252511 ?auto_252512 ) ) ( not ( = ?auto_252511 ?auto_252513 ) ) ( not ( = ?auto_252511 ?auto_252514 ) ) ( not ( = ?auto_252511 ?auto_252515 ) ) ( not ( = ?auto_252511 ?auto_252516 ) ) ( not ( = ?auto_252511 ?auto_252517 ) ) ( not ( = ?auto_252511 ?auto_252518 ) ) ( not ( = ?auto_252512 ?auto_252513 ) ) ( not ( = ?auto_252512 ?auto_252514 ) ) ( not ( = ?auto_252512 ?auto_252515 ) ) ( not ( = ?auto_252512 ?auto_252516 ) ) ( not ( = ?auto_252512 ?auto_252517 ) ) ( not ( = ?auto_252512 ?auto_252518 ) ) ( not ( = ?auto_252513 ?auto_252514 ) ) ( not ( = ?auto_252513 ?auto_252515 ) ) ( not ( = ?auto_252513 ?auto_252516 ) ) ( not ( = ?auto_252513 ?auto_252517 ) ) ( not ( = ?auto_252513 ?auto_252518 ) ) ( not ( = ?auto_252514 ?auto_252515 ) ) ( not ( = ?auto_252514 ?auto_252516 ) ) ( not ( = ?auto_252514 ?auto_252517 ) ) ( not ( = ?auto_252514 ?auto_252518 ) ) ( not ( = ?auto_252515 ?auto_252516 ) ) ( not ( = ?auto_252515 ?auto_252517 ) ) ( not ( = ?auto_252515 ?auto_252518 ) ) ( not ( = ?auto_252516 ?auto_252517 ) ) ( not ( = ?auto_252516 ?auto_252518 ) ) ( not ( = ?auto_252517 ?auto_252518 ) ) ( ON ?auto_252516 ?auto_252517 ) ( ON ?auto_252515 ?auto_252516 ) ( ON ?auto_252514 ?auto_252515 ) ( ON ?auto_252513 ?auto_252514 ) ( CLEAR ?auto_252511 ) ( ON ?auto_252512 ?auto_252513 ) ( CLEAR ?auto_252512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_252507 ?auto_252508 ?auto_252509 ?auto_252510 ?auto_252511 ?auto_252512 )
      ( MAKE-11PILE ?auto_252507 ?auto_252508 ?auto_252509 ?auto_252510 ?auto_252511 ?auto_252512 ?auto_252513 ?auto_252514 ?auto_252515 ?auto_252516 ?auto_252517 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252553 - BLOCK
      ?auto_252554 - BLOCK
      ?auto_252555 - BLOCK
      ?auto_252556 - BLOCK
      ?auto_252557 - BLOCK
      ?auto_252558 - BLOCK
      ?auto_252559 - BLOCK
      ?auto_252560 - BLOCK
      ?auto_252561 - BLOCK
      ?auto_252562 - BLOCK
      ?auto_252563 - BLOCK
    )
    :vars
    (
      ?auto_252564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252563 ?auto_252564 ) ( ON-TABLE ?auto_252553 ) ( ON ?auto_252554 ?auto_252553 ) ( ON ?auto_252555 ?auto_252554 ) ( ON ?auto_252556 ?auto_252555 ) ( not ( = ?auto_252553 ?auto_252554 ) ) ( not ( = ?auto_252553 ?auto_252555 ) ) ( not ( = ?auto_252553 ?auto_252556 ) ) ( not ( = ?auto_252553 ?auto_252557 ) ) ( not ( = ?auto_252553 ?auto_252558 ) ) ( not ( = ?auto_252553 ?auto_252559 ) ) ( not ( = ?auto_252553 ?auto_252560 ) ) ( not ( = ?auto_252553 ?auto_252561 ) ) ( not ( = ?auto_252553 ?auto_252562 ) ) ( not ( = ?auto_252553 ?auto_252563 ) ) ( not ( = ?auto_252553 ?auto_252564 ) ) ( not ( = ?auto_252554 ?auto_252555 ) ) ( not ( = ?auto_252554 ?auto_252556 ) ) ( not ( = ?auto_252554 ?auto_252557 ) ) ( not ( = ?auto_252554 ?auto_252558 ) ) ( not ( = ?auto_252554 ?auto_252559 ) ) ( not ( = ?auto_252554 ?auto_252560 ) ) ( not ( = ?auto_252554 ?auto_252561 ) ) ( not ( = ?auto_252554 ?auto_252562 ) ) ( not ( = ?auto_252554 ?auto_252563 ) ) ( not ( = ?auto_252554 ?auto_252564 ) ) ( not ( = ?auto_252555 ?auto_252556 ) ) ( not ( = ?auto_252555 ?auto_252557 ) ) ( not ( = ?auto_252555 ?auto_252558 ) ) ( not ( = ?auto_252555 ?auto_252559 ) ) ( not ( = ?auto_252555 ?auto_252560 ) ) ( not ( = ?auto_252555 ?auto_252561 ) ) ( not ( = ?auto_252555 ?auto_252562 ) ) ( not ( = ?auto_252555 ?auto_252563 ) ) ( not ( = ?auto_252555 ?auto_252564 ) ) ( not ( = ?auto_252556 ?auto_252557 ) ) ( not ( = ?auto_252556 ?auto_252558 ) ) ( not ( = ?auto_252556 ?auto_252559 ) ) ( not ( = ?auto_252556 ?auto_252560 ) ) ( not ( = ?auto_252556 ?auto_252561 ) ) ( not ( = ?auto_252556 ?auto_252562 ) ) ( not ( = ?auto_252556 ?auto_252563 ) ) ( not ( = ?auto_252556 ?auto_252564 ) ) ( not ( = ?auto_252557 ?auto_252558 ) ) ( not ( = ?auto_252557 ?auto_252559 ) ) ( not ( = ?auto_252557 ?auto_252560 ) ) ( not ( = ?auto_252557 ?auto_252561 ) ) ( not ( = ?auto_252557 ?auto_252562 ) ) ( not ( = ?auto_252557 ?auto_252563 ) ) ( not ( = ?auto_252557 ?auto_252564 ) ) ( not ( = ?auto_252558 ?auto_252559 ) ) ( not ( = ?auto_252558 ?auto_252560 ) ) ( not ( = ?auto_252558 ?auto_252561 ) ) ( not ( = ?auto_252558 ?auto_252562 ) ) ( not ( = ?auto_252558 ?auto_252563 ) ) ( not ( = ?auto_252558 ?auto_252564 ) ) ( not ( = ?auto_252559 ?auto_252560 ) ) ( not ( = ?auto_252559 ?auto_252561 ) ) ( not ( = ?auto_252559 ?auto_252562 ) ) ( not ( = ?auto_252559 ?auto_252563 ) ) ( not ( = ?auto_252559 ?auto_252564 ) ) ( not ( = ?auto_252560 ?auto_252561 ) ) ( not ( = ?auto_252560 ?auto_252562 ) ) ( not ( = ?auto_252560 ?auto_252563 ) ) ( not ( = ?auto_252560 ?auto_252564 ) ) ( not ( = ?auto_252561 ?auto_252562 ) ) ( not ( = ?auto_252561 ?auto_252563 ) ) ( not ( = ?auto_252561 ?auto_252564 ) ) ( not ( = ?auto_252562 ?auto_252563 ) ) ( not ( = ?auto_252562 ?auto_252564 ) ) ( not ( = ?auto_252563 ?auto_252564 ) ) ( ON ?auto_252562 ?auto_252563 ) ( ON ?auto_252561 ?auto_252562 ) ( ON ?auto_252560 ?auto_252561 ) ( ON ?auto_252559 ?auto_252560 ) ( ON ?auto_252558 ?auto_252559 ) ( CLEAR ?auto_252556 ) ( ON ?auto_252557 ?auto_252558 ) ( CLEAR ?auto_252557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_252553 ?auto_252554 ?auto_252555 ?auto_252556 ?auto_252557 )
      ( MAKE-11PILE ?auto_252553 ?auto_252554 ?auto_252555 ?auto_252556 ?auto_252557 ?auto_252558 ?auto_252559 ?auto_252560 ?auto_252561 ?auto_252562 ?auto_252563 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252599 - BLOCK
      ?auto_252600 - BLOCK
      ?auto_252601 - BLOCK
      ?auto_252602 - BLOCK
      ?auto_252603 - BLOCK
      ?auto_252604 - BLOCK
      ?auto_252605 - BLOCK
      ?auto_252606 - BLOCK
      ?auto_252607 - BLOCK
      ?auto_252608 - BLOCK
      ?auto_252609 - BLOCK
    )
    :vars
    (
      ?auto_252610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252609 ?auto_252610 ) ( ON-TABLE ?auto_252599 ) ( ON ?auto_252600 ?auto_252599 ) ( ON ?auto_252601 ?auto_252600 ) ( not ( = ?auto_252599 ?auto_252600 ) ) ( not ( = ?auto_252599 ?auto_252601 ) ) ( not ( = ?auto_252599 ?auto_252602 ) ) ( not ( = ?auto_252599 ?auto_252603 ) ) ( not ( = ?auto_252599 ?auto_252604 ) ) ( not ( = ?auto_252599 ?auto_252605 ) ) ( not ( = ?auto_252599 ?auto_252606 ) ) ( not ( = ?auto_252599 ?auto_252607 ) ) ( not ( = ?auto_252599 ?auto_252608 ) ) ( not ( = ?auto_252599 ?auto_252609 ) ) ( not ( = ?auto_252599 ?auto_252610 ) ) ( not ( = ?auto_252600 ?auto_252601 ) ) ( not ( = ?auto_252600 ?auto_252602 ) ) ( not ( = ?auto_252600 ?auto_252603 ) ) ( not ( = ?auto_252600 ?auto_252604 ) ) ( not ( = ?auto_252600 ?auto_252605 ) ) ( not ( = ?auto_252600 ?auto_252606 ) ) ( not ( = ?auto_252600 ?auto_252607 ) ) ( not ( = ?auto_252600 ?auto_252608 ) ) ( not ( = ?auto_252600 ?auto_252609 ) ) ( not ( = ?auto_252600 ?auto_252610 ) ) ( not ( = ?auto_252601 ?auto_252602 ) ) ( not ( = ?auto_252601 ?auto_252603 ) ) ( not ( = ?auto_252601 ?auto_252604 ) ) ( not ( = ?auto_252601 ?auto_252605 ) ) ( not ( = ?auto_252601 ?auto_252606 ) ) ( not ( = ?auto_252601 ?auto_252607 ) ) ( not ( = ?auto_252601 ?auto_252608 ) ) ( not ( = ?auto_252601 ?auto_252609 ) ) ( not ( = ?auto_252601 ?auto_252610 ) ) ( not ( = ?auto_252602 ?auto_252603 ) ) ( not ( = ?auto_252602 ?auto_252604 ) ) ( not ( = ?auto_252602 ?auto_252605 ) ) ( not ( = ?auto_252602 ?auto_252606 ) ) ( not ( = ?auto_252602 ?auto_252607 ) ) ( not ( = ?auto_252602 ?auto_252608 ) ) ( not ( = ?auto_252602 ?auto_252609 ) ) ( not ( = ?auto_252602 ?auto_252610 ) ) ( not ( = ?auto_252603 ?auto_252604 ) ) ( not ( = ?auto_252603 ?auto_252605 ) ) ( not ( = ?auto_252603 ?auto_252606 ) ) ( not ( = ?auto_252603 ?auto_252607 ) ) ( not ( = ?auto_252603 ?auto_252608 ) ) ( not ( = ?auto_252603 ?auto_252609 ) ) ( not ( = ?auto_252603 ?auto_252610 ) ) ( not ( = ?auto_252604 ?auto_252605 ) ) ( not ( = ?auto_252604 ?auto_252606 ) ) ( not ( = ?auto_252604 ?auto_252607 ) ) ( not ( = ?auto_252604 ?auto_252608 ) ) ( not ( = ?auto_252604 ?auto_252609 ) ) ( not ( = ?auto_252604 ?auto_252610 ) ) ( not ( = ?auto_252605 ?auto_252606 ) ) ( not ( = ?auto_252605 ?auto_252607 ) ) ( not ( = ?auto_252605 ?auto_252608 ) ) ( not ( = ?auto_252605 ?auto_252609 ) ) ( not ( = ?auto_252605 ?auto_252610 ) ) ( not ( = ?auto_252606 ?auto_252607 ) ) ( not ( = ?auto_252606 ?auto_252608 ) ) ( not ( = ?auto_252606 ?auto_252609 ) ) ( not ( = ?auto_252606 ?auto_252610 ) ) ( not ( = ?auto_252607 ?auto_252608 ) ) ( not ( = ?auto_252607 ?auto_252609 ) ) ( not ( = ?auto_252607 ?auto_252610 ) ) ( not ( = ?auto_252608 ?auto_252609 ) ) ( not ( = ?auto_252608 ?auto_252610 ) ) ( not ( = ?auto_252609 ?auto_252610 ) ) ( ON ?auto_252608 ?auto_252609 ) ( ON ?auto_252607 ?auto_252608 ) ( ON ?auto_252606 ?auto_252607 ) ( ON ?auto_252605 ?auto_252606 ) ( ON ?auto_252604 ?auto_252605 ) ( ON ?auto_252603 ?auto_252604 ) ( CLEAR ?auto_252601 ) ( ON ?auto_252602 ?auto_252603 ) ( CLEAR ?auto_252602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_252599 ?auto_252600 ?auto_252601 ?auto_252602 )
      ( MAKE-11PILE ?auto_252599 ?auto_252600 ?auto_252601 ?auto_252602 ?auto_252603 ?auto_252604 ?auto_252605 ?auto_252606 ?auto_252607 ?auto_252608 ?auto_252609 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252645 - BLOCK
      ?auto_252646 - BLOCK
      ?auto_252647 - BLOCK
      ?auto_252648 - BLOCK
      ?auto_252649 - BLOCK
      ?auto_252650 - BLOCK
      ?auto_252651 - BLOCK
      ?auto_252652 - BLOCK
      ?auto_252653 - BLOCK
      ?auto_252654 - BLOCK
      ?auto_252655 - BLOCK
    )
    :vars
    (
      ?auto_252656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252655 ?auto_252656 ) ( ON-TABLE ?auto_252645 ) ( ON ?auto_252646 ?auto_252645 ) ( not ( = ?auto_252645 ?auto_252646 ) ) ( not ( = ?auto_252645 ?auto_252647 ) ) ( not ( = ?auto_252645 ?auto_252648 ) ) ( not ( = ?auto_252645 ?auto_252649 ) ) ( not ( = ?auto_252645 ?auto_252650 ) ) ( not ( = ?auto_252645 ?auto_252651 ) ) ( not ( = ?auto_252645 ?auto_252652 ) ) ( not ( = ?auto_252645 ?auto_252653 ) ) ( not ( = ?auto_252645 ?auto_252654 ) ) ( not ( = ?auto_252645 ?auto_252655 ) ) ( not ( = ?auto_252645 ?auto_252656 ) ) ( not ( = ?auto_252646 ?auto_252647 ) ) ( not ( = ?auto_252646 ?auto_252648 ) ) ( not ( = ?auto_252646 ?auto_252649 ) ) ( not ( = ?auto_252646 ?auto_252650 ) ) ( not ( = ?auto_252646 ?auto_252651 ) ) ( not ( = ?auto_252646 ?auto_252652 ) ) ( not ( = ?auto_252646 ?auto_252653 ) ) ( not ( = ?auto_252646 ?auto_252654 ) ) ( not ( = ?auto_252646 ?auto_252655 ) ) ( not ( = ?auto_252646 ?auto_252656 ) ) ( not ( = ?auto_252647 ?auto_252648 ) ) ( not ( = ?auto_252647 ?auto_252649 ) ) ( not ( = ?auto_252647 ?auto_252650 ) ) ( not ( = ?auto_252647 ?auto_252651 ) ) ( not ( = ?auto_252647 ?auto_252652 ) ) ( not ( = ?auto_252647 ?auto_252653 ) ) ( not ( = ?auto_252647 ?auto_252654 ) ) ( not ( = ?auto_252647 ?auto_252655 ) ) ( not ( = ?auto_252647 ?auto_252656 ) ) ( not ( = ?auto_252648 ?auto_252649 ) ) ( not ( = ?auto_252648 ?auto_252650 ) ) ( not ( = ?auto_252648 ?auto_252651 ) ) ( not ( = ?auto_252648 ?auto_252652 ) ) ( not ( = ?auto_252648 ?auto_252653 ) ) ( not ( = ?auto_252648 ?auto_252654 ) ) ( not ( = ?auto_252648 ?auto_252655 ) ) ( not ( = ?auto_252648 ?auto_252656 ) ) ( not ( = ?auto_252649 ?auto_252650 ) ) ( not ( = ?auto_252649 ?auto_252651 ) ) ( not ( = ?auto_252649 ?auto_252652 ) ) ( not ( = ?auto_252649 ?auto_252653 ) ) ( not ( = ?auto_252649 ?auto_252654 ) ) ( not ( = ?auto_252649 ?auto_252655 ) ) ( not ( = ?auto_252649 ?auto_252656 ) ) ( not ( = ?auto_252650 ?auto_252651 ) ) ( not ( = ?auto_252650 ?auto_252652 ) ) ( not ( = ?auto_252650 ?auto_252653 ) ) ( not ( = ?auto_252650 ?auto_252654 ) ) ( not ( = ?auto_252650 ?auto_252655 ) ) ( not ( = ?auto_252650 ?auto_252656 ) ) ( not ( = ?auto_252651 ?auto_252652 ) ) ( not ( = ?auto_252651 ?auto_252653 ) ) ( not ( = ?auto_252651 ?auto_252654 ) ) ( not ( = ?auto_252651 ?auto_252655 ) ) ( not ( = ?auto_252651 ?auto_252656 ) ) ( not ( = ?auto_252652 ?auto_252653 ) ) ( not ( = ?auto_252652 ?auto_252654 ) ) ( not ( = ?auto_252652 ?auto_252655 ) ) ( not ( = ?auto_252652 ?auto_252656 ) ) ( not ( = ?auto_252653 ?auto_252654 ) ) ( not ( = ?auto_252653 ?auto_252655 ) ) ( not ( = ?auto_252653 ?auto_252656 ) ) ( not ( = ?auto_252654 ?auto_252655 ) ) ( not ( = ?auto_252654 ?auto_252656 ) ) ( not ( = ?auto_252655 ?auto_252656 ) ) ( ON ?auto_252654 ?auto_252655 ) ( ON ?auto_252653 ?auto_252654 ) ( ON ?auto_252652 ?auto_252653 ) ( ON ?auto_252651 ?auto_252652 ) ( ON ?auto_252650 ?auto_252651 ) ( ON ?auto_252649 ?auto_252650 ) ( ON ?auto_252648 ?auto_252649 ) ( CLEAR ?auto_252646 ) ( ON ?auto_252647 ?auto_252648 ) ( CLEAR ?auto_252647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_252645 ?auto_252646 ?auto_252647 )
      ( MAKE-11PILE ?auto_252645 ?auto_252646 ?auto_252647 ?auto_252648 ?auto_252649 ?auto_252650 ?auto_252651 ?auto_252652 ?auto_252653 ?auto_252654 ?auto_252655 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252691 - BLOCK
      ?auto_252692 - BLOCK
      ?auto_252693 - BLOCK
      ?auto_252694 - BLOCK
      ?auto_252695 - BLOCK
      ?auto_252696 - BLOCK
      ?auto_252697 - BLOCK
      ?auto_252698 - BLOCK
      ?auto_252699 - BLOCK
      ?auto_252700 - BLOCK
      ?auto_252701 - BLOCK
    )
    :vars
    (
      ?auto_252702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252701 ?auto_252702 ) ( ON-TABLE ?auto_252691 ) ( not ( = ?auto_252691 ?auto_252692 ) ) ( not ( = ?auto_252691 ?auto_252693 ) ) ( not ( = ?auto_252691 ?auto_252694 ) ) ( not ( = ?auto_252691 ?auto_252695 ) ) ( not ( = ?auto_252691 ?auto_252696 ) ) ( not ( = ?auto_252691 ?auto_252697 ) ) ( not ( = ?auto_252691 ?auto_252698 ) ) ( not ( = ?auto_252691 ?auto_252699 ) ) ( not ( = ?auto_252691 ?auto_252700 ) ) ( not ( = ?auto_252691 ?auto_252701 ) ) ( not ( = ?auto_252691 ?auto_252702 ) ) ( not ( = ?auto_252692 ?auto_252693 ) ) ( not ( = ?auto_252692 ?auto_252694 ) ) ( not ( = ?auto_252692 ?auto_252695 ) ) ( not ( = ?auto_252692 ?auto_252696 ) ) ( not ( = ?auto_252692 ?auto_252697 ) ) ( not ( = ?auto_252692 ?auto_252698 ) ) ( not ( = ?auto_252692 ?auto_252699 ) ) ( not ( = ?auto_252692 ?auto_252700 ) ) ( not ( = ?auto_252692 ?auto_252701 ) ) ( not ( = ?auto_252692 ?auto_252702 ) ) ( not ( = ?auto_252693 ?auto_252694 ) ) ( not ( = ?auto_252693 ?auto_252695 ) ) ( not ( = ?auto_252693 ?auto_252696 ) ) ( not ( = ?auto_252693 ?auto_252697 ) ) ( not ( = ?auto_252693 ?auto_252698 ) ) ( not ( = ?auto_252693 ?auto_252699 ) ) ( not ( = ?auto_252693 ?auto_252700 ) ) ( not ( = ?auto_252693 ?auto_252701 ) ) ( not ( = ?auto_252693 ?auto_252702 ) ) ( not ( = ?auto_252694 ?auto_252695 ) ) ( not ( = ?auto_252694 ?auto_252696 ) ) ( not ( = ?auto_252694 ?auto_252697 ) ) ( not ( = ?auto_252694 ?auto_252698 ) ) ( not ( = ?auto_252694 ?auto_252699 ) ) ( not ( = ?auto_252694 ?auto_252700 ) ) ( not ( = ?auto_252694 ?auto_252701 ) ) ( not ( = ?auto_252694 ?auto_252702 ) ) ( not ( = ?auto_252695 ?auto_252696 ) ) ( not ( = ?auto_252695 ?auto_252697 ) ) ( not ( = ?auto_252695 ?auto_252698 ) ) ( not ( = ?auto_252695 ?auto_252699 ) ) ( not ( = ?auto_252695 ?auto_252700 ) ) ( not ( = ?auto_252695 ?auto_252701 ) ) ( not ( = ?auto_252695 ?auto_252702 ) ) ( not ( = ?auto_252696 ?auto_252697 ) ) ( not ( = ?auto_252696 ?auto_252698 ) ) ( not ( = ?auto_252696 ?auto_252699 ) ) ( not ( = ?auto_252696 ?auto_252700 ) ) ( not ( = ?auto_252696 ?auto_252701 ) ) ( not ( = ?auto_252696 ?auto_252702 ) ) ( not ( = ?auto_252697 ?auto_252698 ) ) ( not ( = ?auto_252697 ?auto_252699 ) ) ( not ( = ?auto_252697 ?auto_252700 ) ) ( not ( = ?auto_252697 ?auto_252701 ) ) ( not ( = ?auto_252697 ?auto_252702 ) ) ( not ( = ?auto_252698 ?auto_252699 ) ) ( not ( = ?auto_252698 ?auto_252700 ) ) ( not ( = ?auto_252698 ?auto_252701 ) ) ( not ( = ?auto_252698 ?auto_252702 ) ) ( not ( = ?auto_252699 ?auto_252700 ) ) ( not ( = ?auto_252699 ?auto_252701 ) ) ( not ( = ?auto_252699 ?auto_252702 ) ) ( not ( = ?auto_252700 ?auto_252701 ) ) ( not ( = ?auto_252700 ?auto_252702 ) ) ( not ( = ?auto_252701 ?auto_252702 ) ) ( ON ?auto_252700 ?auto_252701 ) ( ON ?auto_252699 ?auto_252700 ) ( ON ?auto_252698 ?auto_252699 ) ( ON ?auto_252697 ?auto_252698 ) ( ON ?auto_252696 ?auto_252697 ) ( ON ?auto_252695 ?auto_252696 ) ( ON ?auto_252694 ?auto_252695 ) ( ON ?auto_252693 ?auto_252694 ) ( CLEAR ?auto_252691 ) ( ON ?auto_252692 ?auto_252693 ) ( CLEAR ?auto_252692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_252691 ?auto_252692 )
      ( MAKE-11PILE ?auto_252691 ?auto_252692 ?auto_252693 ?auto_252694 ?auto_252695 ?auto_252696 ?auto_252697 ?auto_252698 ?auto_252699 ?auto_252700 ?auto_252701 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_252737 - BLOCK
      ?auto_252738 - BLOCK
      ?auto_252739 - BLOCK
      ?auto_252740 - BLOCK
      ?auto_252741 - BLOCK
      ?auto_252742 - BLOCK
      ?auto_252743 - BLOCK
      ?auto_252744 - BLOCK
      ?auto_252745 - BLOCK
      ?auto_252746 - BLOCK
      ?auto_252747 - BLOCK
    )
    :vars
    (
      ?auto_252748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252747 ?auto_252748 ) ( not ( = ?auto_252737 ?auto_252738 ) ) ( not ( = ?auto_252737 ?auto_252739 ) ) ( not ( = ?auto_252737 ?auto_252740 ) ) ( not ( = ?auto_252737 ?auto_252741 ) ) ( not ( = ?auto_252737 ?auto_252742 ) ) ( not ( = ?auto_252737 ?auto_252743 ) ) ( not ( = ?auto_252737 ?auto_252744 ) ) ( not ( = ?auto_252737 ?auto_252745 ) ) ( not ( = ?auto_252737 ?auto_252746 ) ) ( not ( = ?auto_252737 ?auto_252747 ) ) ( not ( = ?auto_252737 ?auto_252748 ) ) ( not ( = ?auto_252738 ?auto_252739 ) ) ( not ( = ?auto_252738 ?auto_252740 ) ) ( not ( = ?auto_252738 ?auto_252741 ) ) ( not ( = ?auto_252738 ?auto_252742 ) ) ( not ( = ?auto_252738 ?auto_252743 ) ) ( not ( = ?auto_252738 ?auto_252744 ) ) ( not ( = ?auto_252738 ?auto_252745 ) ) ( not ( = ?auto_252738 ?auto_252746 ) ) ( not ( = ?auto_252738 ?auto_252747 ) ) ( not ( = ?auto_252738 ?auto_252748 ) ) ( not ( = ?auto_252739 ?auto_252740 ) ) ( not ( = ?auto_252739 ?auto_252741 ) ) ( not ( = ?auto_252739 ?auto_252742 ) ) ( not ( = ?auto_252739 ?auto_252743 ) ) ( not ( = ?auto_252739 ?auto_252744 ) ) ( not ( = ?auto_252739 ?auto_252745 ) ) ( not ( = ?auto_252739 ?auto_252746 ) ) ( not ( = ?auto_252739 ?auto_252747 ) ) ( not ( = ?auto_252739 ?auto_252748 ) ) ( not ( = ?auto_252740 ?auto_252741 ) ) ( not ( = ?auto_252740 ?auto_252742 ) ) ( not ( = ?auto_252740 ?auto_252743 ) ) ( not ( = ?auto_252740 ?auto_252744 ) ) ( not ( = ?auto_252740 ?auto_252745 ) ) ( not ( = ?auto_252740 ?auto_252746 ) ) ( not ( = ?auto_252740 ?auto_252747 ) ) ( not ( = ?auto_252740 ?auto_252748 ) ) ( not ( = ?auto_252741 ?auto_252742 ) ) ( not ( = ?auto_252741 ?auto_252743 ) ) ( not ( = ?auto_252741 ?auto_252744 ) ) ( not ( = ?auto_252741 ?auto_252745 ) ) ( not ( = ?auto_252741 ?auto_252746 ) ) ( not ( = ?auto_252741 ?auto_252747 ) ) ( not ( = ?auto_252741 ?auto_252748 ) ) ( not ( = ?auto_252742 ?auto_252743 ) ) ( not ( = ?auto_252742 ?auto_252744 ) ) ( not ( = ?auto_252742 ?auto_252745 ) ) ( not ( = ?auto_252742 ?auto_252746 ) ) ( not ( = ?auto_252742 ?auto_252747 ) ) ( not ( = ?auto_252742 ?auto_252748 ) ) ( not ( = ?auto_252743 ?auto_252744 ) ) ( not ( = ?auto_252743 ?auto_252745 ) ) ( not ( = ?auto_252743 ?auto_252746 ) ) ( not ( = ?auto_252743 ?auto_252747 ) ) ( not ( = ?auto_252743 ?auto_252748 ) ) ( not ( = ?auto_252744 ?auto_252745 ) ) ( not ( = ?auto_252744 ?auto_252746 ) ) ( not ( = ?auto_252744 ?auto_252747 ) ) ( not ( = ?auto_252744 ?auto_252748 ) ) ( not ( = ?auto_252745 ?auto_252746 ) ) ( not ( = ?auto_252745 ?auto_252747 ) ) ( not ( = ?auto_252745 ?auto_252748 ) ) ( not ( = ?auto_252746 ?auto_252747 ) ) ( not ( = ?auto_252746 ?auto_252748 ) ) ( not ( = ?auto_252747 ?auto_252748 ) ) ( ON ?auto_252746 ?auto_252747 ) ( ON ?auto_252745 ?auto_252746 ) ( ON ?auto_252744 ?auto_252745 ) ( ON ?auto_252743 ?auto_252744 ) ( ON ?auto_252742 ?auto_252743 ) ( ON ?auto_252741 ?auto_252742 ) ( ON ?auto_252740 ?auto_252741 ) ( ON ?auto_252739 ?auto_252740 ) ( ON ?auto_252738 ?auto_252739 ) ( ON ?auto_252737 ?auto_252738 ) ( CLEAR ?auto_252737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_252737 )
      ( MAKE-11PILE ?auto_252737 ?auto_252738 ?auto_252739 ?auto_252740 ?auto_252741 ?auto_252742 ?auto_252743 ?auto_252744 ?auto_252745 ?auto_252746 ?auto_252747 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_252784 - BLOCK
      ?auto_252785 - BLOCK
      ?auto_252786 - BLOCK
      ?auto_252787 - BLOCK
      ?auto_252788 - BLOCK
      ?auto_252789 - BLOCK
      ?auto_252790 - BLOCK
      ?auto_252791 - BLOCK
      ?auto_252792 - BLOCK
      ?auto_252793 - BLOCK
      ?auto_252794 - BLOCK
      ?auto_252795 - BLOCK
    )
    :vars
    (
      ?auto_252796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_252794 ) ( ON ?auto_252795 ?auto_252796 ) ( CLEAR ?auto_252795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_252784 ) ( ON ?auto_252785 ?auto_252784 ) ( ON ?auto_252786 ?auto_252785 ) ( ON ?auto_252787 ?auto_252786 ) ( ON ?auto_252788 ?auto_252787 ) ( ON ?auto_252789 ?auto_252788 ) ( ON ?auto_252790 ?auto_252789 ) ( ON ?auto_252791 ?auto_252790 ) ( ON ?auto_252792 ?auto_252791 ) ( ON ?auto_252793 ?auto_252792 ) ( ON ?auto_252794 ?auto_252793 ) ( not ( = ?auto_252784 ?auto_252785 ) ) ( not ( = ?auto_252784 ?auto_252786 ) ) ( not ( = ?auto_252784 ?auto_252787 ) ) ( not ( = ?auto_252784 ?auto_252788 ) ) ( not ( = ?auto_252784 ?auto_252789 ) ) ( not ( = ?auto_252784 ?auto_252790 ) ) ( not ( = ?auto_252784 ?auto_252791 ) ) ( not ( = ?auto_252784 ?auto_252792 ) ) ( not ( = ?auto_252784 ?auto_252793 ) ) ( not ( = ?auto_252784 ?auto_252794 ) ) ( not ( = ?auto_252784 ?auto_252795 ) ) ( not ( = ?auto_252784 ?auto_252796 ) ) ( not ( = ?auto_252785 ?auto_252786 ) ) ( not ( = ?auto_252785 ?auto_252787 ) ) ( not ( = ?auto_252785 ?auto_252788 ) ) ( not ( = ?auto_252785 ?auto_252789 ) ) ( not ( = ?auto_252785 ?auto_252790 ) ) ( not ( = ?auto_252785 ?auto_252791 ) ) ( not ( = ?auto_252785 ?auto_252792 ) ) ( not ( = ?auto_252785 ?auto_252793 ) ) ( not ( = ?auto_252785 ?auto_252794 ) ) ( not ( = ?auto_252785 ?auto_252795 ) ) ( not ( = ?auto_252785 ?auto_252796 ) ) ( not ( = ?auto_252786 ?auto_252787 ) ) ( not ( = ?auto_252786 ?auto_252788 ) ) ( not ( = ?auto_252786 ?auto_252789 ) ) ( not ( = ?auto_252786 ?auto_252790 ) ) ( not ( = ?auto_252786 ?auto_252791 ) ) ( not ( = ?auto_252786 ?auto_252792 ) ) ( not ( = ?auto_252786 ?auto_252793 ) ) ( not ( = ?auto_252786 ?auto_252794 ) ) ( not ( = ?auto_252786 ?auto_252795 ) ) ( not ( = ?auto_252786 ?auto_252796 ) ) ( not ( = ?auto_252787 ?auto_252788 ) ) ( not ( = ?auto_252787 ?auto_252789 ) ) ( not ( = ?auto_252787 ?auto_252790 ) ) ( not ( = ?auto_252787 ?auto_252791 ) ) ( not ( = ?auto_252787 ?auto_252792 ) ) ( not ( = ?auto_252787 ?auto_252793 ) ) ( not ( = ?auto_252787 ?auto_252794 ) ) ( not ( = ?auto_252787 ?auto_252795 ) ) ( not ( = ?auto_252787 ?auto_252796 ) ) ( not ( = ?auto_252788 ?auto_252789 ) ) ( not ( = ?auto_252788 ?auto_252790 ) ) ( not ( = ?auto_252788 ?auto_252791 ) ) ( not ( = ?auto_252788 ?auto_252792 ) ) ( not ( = ?auto_252788 ?auto_252793 ) ) ( not ( = ?auto_252788 ?auto_252794 ) ) ( not ( = ?auto_252788 ?auto_252795 ) ) ( not ( = ?auto_252788 ?auto_252796 ) ) ( not ( = ?auto_252789 ?auto_252790 ) ) ( not ( = ?auto_252789 ?auto_252791 ) ) ( not ( = ?auto_252789 ?auto_252792 ) ) ( not ( = ?auto_252789 ?auto_252793 ) ) ( not ( = ?auto_252789 ?auto_252794 ) ) ( not ( = ?auto_252789 ?auto_252795 ) ) ( not ( = ?auto_252789 ?auto_252796 ) ) ( not ( = ?auto_252790 ?auto_252791 ) ) ( not ( = ?auto_252790 ?auto_252792 ) ) ( not ( = ?auto_252790 ?auto_252793 ) ) ( not ( = ?auto_252790 ?auto_252794 ) ) ( not ( = ?auto_252790 ?auto_252795 ) ) ( not ( = ?auto_252790 ?auto_252796 ) ) ( not ( = ?auto_252791 ?auto_252792 ) ) ( not ( = ?auto_252791 ?auto_252793 ) ) ( not ( = ?auto_252791 ?auto_252794 ) ) ( not ( = ?auto_252791 ?auto_252795 ) ) ( not ( = ?auto_252791 ?auto_252796 ) ) ( not ( = ?auto_252792 ?auto_252793 ) ) ( not ( = ?auto_252792 ?auto_252794 ) ) ( not ( = ?auto_252792 ?auto_252795 ) ) ( not ( = ?auto_252792 ?auto_252796 ) ) ( not ( = ?auto_252793 ?auto_252794 ) ) ( not ( = ?auto_252793 ?auto_252795 ) ) ( not ( = ?auto_252793 ?auto_252796 ) ) ( not ( = ?auto_252794 ?auto_252795 ) ) ( not ( = ?auto_252794 ?auto_252796 ) ) ( not ( = ?auto_252795 ?auto_252796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_252795 ?auto_252796 )
      ( !STACK ?auto_252795 ?auto_252794 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_252834 - BLOCK
      ?auto_252835 - BLOCK
      ?auto_252836 - BLOCK
      ?auto_252837 - BLOCK
      ?auto_252838 - BLOCK
      ?auto_252839 - BLOCK
      ?auto_252840 - BLOCK
      ?auto_252841 - BLOCK
      ?auto_252842 - BLOCK
      ?auto_252843 - BLOCK
      ?auto_252844 - BLOCK
      ?auto_252845 - BLOCK
    )
    :vars
    (
      ?auto_252846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252845 ?auto_252846 ) ( ON-TABLE ?auto_252834 ) ( ON ?auto_252835 ?auto_252834 ) ( ON ?auto_252836 ?auto_252835 ) ( ON ?auto_252837 ?auto_252836 ) ( ON ?auto_252838 ?auto_252837 ) ( ON ?auto_252839 ?auto_252838 ) ( ON ?auto_252840 ?auto_252839 ) ( ON ?auto_252841 ?auto_252840 ) ( ON ?auto_252842 ?auto_252841 ) ( ON ?auto_252843 ?auto_252842 ) ( not ( = ?auto_252834 ?auto_252835 ) ) ( not ( = ?auto_252834 ?auto_252836 ) ) ( not ( = ?auto_252834 ?auto_252837 ) ) ( not ( = ?auto_252834 ?auto_252838 ) ) ( not ( = ?auto_252834 ?auto_252839 ) ) ( not ( = ?auto_252834 ?auto_252840 ) ) ( not ( = ?auto_252834 ?auto_252841 ) ) ( not ( = ?auto_252834 ?auto_252842 ) ) ( not ( = ?auto_252834 ?auto_252843 ) ) ( not ( = ?auto_252834 ?auto_252844 ) ) ( not ( = ?auto_252834 ?auto_252845 ) ) ( not ( = ?auto_252834 ?auto_252846 ) ) ( not ( = ?auto_252835 ?auto_252836 ) ) ( not ( = ?auto_252835 ?auto_252837 ) ) ( not ( = ?auto_252835 ?auto_252838 ) ) ( not ( = ?auto_252835 ?auto_252839 ) ) ( not ( = ?auto_252835 ?auto_252840 ) ) ( not ( = ?auto_252835 ?auto_252841 ) ) ( not ( = ?auto_252835 ?auto_252842 ) ) ( not ( = ?auto_252835 ?auto_252843 ) ) ( not ( = ?auto_252835 ?auto_252844 ) ) ( not ( = ?auto_252835 ?auto_252845 ) ) ( not ( = ?auto_252835 ?auto_252846 ) ) ( not ( = ?auto_252836 ?auto_252837 ) ) ( not ( = ?auto_252836 ?auto_252838 ) ) ( not ( = ?auto_252836 ?auto_252839 ) ) ( not ( = ?auto_252836 ?auto_252840 ) ) ( not ( = ?auto_252836 ?auto_252841 ) ) ( not ( = ?auto_252836 ?auto_252842 ) ) ( not ( = ?auto_252836 ?auto_252843 ) ) ( not ( = ?auto_252836 ?auto_252844 ) ) ( not ( = ?auto_252836 ?auto_252845 ) ) ( not ( = ?auto_252836 ?auto_252846 ) ) ( not ( = ?auto_252837 ?auto_252838 ) ) ( not ( = ?auto_252837 ?auto_252839 ) ) ( not ( = ?auto_252837 ?auto_252840 ) ) ( not ( = ?auto_252837 ?auto_252841 ) ) ( not ( = ?auto_252837 ?auto_252842 ) ) ( not ( = ?auto_252837 ?auto_252843 ) ) ( not ( = ?auto_252837 ?auto_252844 ) ) ( not ( = ?auto_252837 ?auto_252845 ) ) ( not ( = ?auto_252837 ?auto_252846 ) ) ( not ( = ?auto_252838 ?auto_252839 ) ) ( not ( = ?auto_252838 ?auto_252840 ) ) ( not ( = ?auto_252838 ?auto_252841 ) ) ( not ( = ?auto_252838 ?auto_252842 ) ) ( not ( = ?auto_252838 ?auto_252843 ) ) ( not ( = ?auto_252838 ?auto_252844 ) ) ( not ( = ?auto_252838 ?auto_252845 ) ) ( not ( = ?auto_252838 ?auto_252846 ) ) ( not ( = ?auto_252839 ?auto_252840 ) ) ( not ( = ?auto_252839 ?auto_252841 ) ) ( not ( = ?auto_252839 ?auto_252842 ) ) ( not ( = ?auto_252839 ?auto_252843 ) ) ( not ( = ?auto_252839 ?auto_252844 ) ) ( not ( = ?auto_252839 ?auto_252845 ) ) ( not ( = ?auto_252839 ?auto_252846 ) ) ( not ( = ?auto_252840 ?auto_252841 ) ) ( not ( = ?auto_252840 ?auto_252842 ) ) ( not ( = ?auto_252840 ?auto_252843 ) ) ( not ( = ?auto_252840 ?auto_252844 ) ) ( not ( = ?auto_252840 ?auto_252845 ) ) ( not ( = ?auto_252840 ?auto_252846 ) ) ( not ( = ?auto_252841 ?auto_252842 ) ) ( not ( = ?auto_252841 ?auto_252843 ) ) ( not ( = ?auto_252841 ?auto_252844 ) ) ( not ( = ?auto_252841 ?auto_252845 ) ) ( not ( = ?auto_252841 ?auto_252846 ) ) ( not ( = ?auto_252842 ?auto_252843 ) ) ( not ( = ?auto_252842 ?auto_252844 ) ) ( not ( = ?auto_252842 ?auto_252845 ) ) ( not ( = ?auto_252842 ?auto_252846 ) ) ( not ( = ?auto_252843 ?auto_252844 ) ) ( not ( = ?auto_252843 ?auto_252845 ) ) ( not ( = ?auto_252843 ?auto_252846 ) ) ( not ( = ?auto_252844 ?auto_252845 ) ) ( not ( = ?auto_252844 ?auto_252846 ) ) ( not ( = ?auto_252845 ?auto_252846 ) ) ( CLEAR ?auto_252843 ) ( ON ?auto_252844 ?auto_252845 ) ( CLEAR ?auto_252844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_252834 ?auto_252835 ?auto_252836 ?auto_252837 ?auto_252838 ?auto_252839 ?auto_252840 ?auto_252841 ?auto_252842 ?auto_252843 ?auto_252844 )
      ( MAKE-12PILE ?auto_252834 ?auto_252835 ?auto_252836 ?auto_252837 ?auto_252838 ?auto_252839 ?auto_252840 ?auto_252841 ?auto_252842 ?auto_252843 ?auto_252844 ?auto_252845 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_252884 - BLOCK
      ?auto_252885 - BLOCK
      ?auto_252886 - BLOCK
      ?auto_252887 - BLOCK
      ?auto_252888 - BLOCK
      ?auto_252889 - BLOCK
      ?auto_252890 - BLOCK
      ?auto_252891 - BLOCK
      ?auto_252892 - BLOCK
      ?auto_252893 - BLOCK
      ?auto_252894 - BLOCK
      ?auto_252895 - BLOCK
    )
    :vars
    (
      ?auto_252896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252895 ?auto_252896 ) ( ON-TABLE ?auto_252884 ) ( ON ?auto_252885 ?auto_252884 ) ( ON ?auto_252886 ?auto_252885 ) ( ON ?auto_252887 ?auto_252886 ) ( ON ?auto_252888 ?auto_252887 ) ( ON ?auto_252889 ?auto_252888 ) ( ON ?auto_252890 ?auto_252889 ) ( ON ?auto_252891 ?auto_252890 ) ( ON ?auto_252892 ?auto_252891 ) ( not ( = ?auto_252884 ?auto_252885 ) ) ( not ( = ?auto_252884 ?auto_252886 ) ) ( not ( = ?auto_252884 ?auto_252887 ) ) ( not ( = ?auto_252884 ?auto_252888 ) ) ( not ( = ?auto_252884 ?auto_252889 ) ) ( not ( = ?auto_252884 ?auto_252890 ) ) ( not ( = ?auto_252884 ?auto_252891 ) ) ( not ( = ?auto_252884 ?auto_252892 ) ) ( not ( = ?auto_252884 ?auto_252893 ) ) ( not ( = ?auto_252884 ?auto_252894 ) ) ( not ( = ?auto_252884 ?auto_252895 ) ) ( not ( = ?auto_252884 ?auto_252896 ) ) ( not ( = ?auto_252885 ?auto_252886 ) ) ( not ( = ?auto_252885 ?auto_252887 ) ) ( not ( = ?auto_252885 ?auto_252888 ) ) ( not ( = ?auto_252885 ?auto_252889 ) ) ( not ( = ?auto_252885 ?auto_252890 ) ) ( not ( = ?auto_252885 ?auto_252891 ) ) ( not ( = ?auto_252885 ?auto_252892 ) ) ( not ( = ?auto_252885 ?auto_252893 ) ) ( not ( = ?auto_252885 ?auto_252894 ) ) ( not ( = ?auto_252885 ?auto_252895 ) ) ( not ( = ?auto_252885 ?auto_252896 ) ) ( not ( = ?auto_252886 ?auto_252887 ) ) ( not ( = ?auto_252886 ?auto_252888 ) ) ( not ( = ?auto_252886 ?auto_252889 ) ) ( not ( = ?auto_252886 ?auto_252890 ) ) ( not ( = ?auto_252886 ?auto_252891 ) ) ( not ( = ?auto_252886 ?auto_252892 ) ) ( not ( = ?auto_252886 ?auto_252893 ) ) ( not ( = ?auto_252886 ?auto_252894 ) ) ( not ( = ?auto_252886 ?auto_252895 ) ) ( not ( = ?auto_252886 ?auto_252896 ) ) ( not ( = ?auto_252887 ?auto_252888 ) ) ( not ( = ?auto_252887 ?auto_252889 ) ) ( not ( = ?auto_252887 ?auto_252890 ) ) ( not ( = ?auto_252887 ?auto_252891 ) ) ( not ( = ?auto_252887 ?auto_252892 ) ) ( not ( = ?auto_252887 ?auto_252893 ) ) ( not ( = ?auto_252887 ?auto_252894 ) ) ( not ( = ?auto_252887 ?auto_252895 ) ) ( not ( = ?auto_252887 ?auto_252896 ) ) ( not ( = ?auto_252888 ?auto_252889 ) ) ( not ( = ?auto_252888 ?auto_252890 ) ) ( not ( = ?auto_252888 ?auto_252891 ) ) ( not ( = ?auto_252888 ?auto_252892 ) ) ( not ( = ?auto_252888 ?auto_252893 ) ) ( not ( = ?auto_252888 ?auto_252894 ) ) ( not ( = ?auto_252888 ?auto_252895 ) ) ( not ( = ?auto_252888 ?auto_252896 ) ) ( not ( = ?auto_252889 ?auto_252890 ) ) ( not ( = ?auto_252889 ?auto_252891 ) ) ( not ( = ?auto_252889 ?auto_252892 ) ) ( not ( = ?auto_252889 ?auto_252893 ) ) ( not ( = ?auto_252889 ?auto_252894 ) ) ( not ( = ?auto_252889 ?auto_252895 ) ) ( not ( = ?auto_252889 ?auto_252896 ) ) ( not ( = ?auto_252890 ?auto_252891 ) ) ( not ( = ?auto_252890 ?auto_252892 ) ) ( not ( = ?auto_252890 ?auto_252893 ) ) ( not ( = ?auto_252890 ?auto_252894 ) ) ( not ( = ?auto_252890 ?auto_252895 ) ) ( not ( = ?auto_252890 ?auto_252896 ) ) ( not ( = ?auto_252891 ?auto_252892 ) ) ( not ( = ?auto_252891 ?auto_252893 ) ) ( not ( = ?auto_252891 ?auto_252894 ) ) ( not ( = ?auto_252891 ?auto_252895 ) ) ( not ( = ?auto_252891 ?auto_252896 ) ) ( not ( = ?auto_252892 ?auto_252893 ) ) ( not ( = ?auto_252892 ?auto_252894 ) ) ( not ( = ?auto_252892 ?auto_252895 ) ) ( not ( = ?auto_252892 ?auto_252896 ) ) ( not ( = ?auto_252893 ?auto_252894 ) ) ( not ( = ?auto_252893 ?auto_252895 ) ) ( not ( = ?auto_252893 ?auto_252896 ) ) ( not ( = ?auto_252894 ?auto_252895 ) ) ( not ( = ?auto_252894 ?auto_252896 ) ) ( not ( = ?auto_252895 ?auto_252896 ) ) ( ON ?auto_252894 ?auto_252895 ) ( CLEAR ?auto_252892 ) ( ON ?auto_252893 ?auto_252894 ) ( CLEAR ?auto_252893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_252884 ?auto_252885 ?auto_252886 ?auto_252887 ?auto_252888 ?auto_252889 ?auto_252890 ?auto_252891 ?auto_252892 ?auto_252893 )
      ( MAKE-12PILE ?auto_252884 ?auto_252885 ?auto_252886 ?auto_252887 ?auto_252888 ?auto_252889 ?auto_252890 ?auto_252891 ?auto_252892 ?auto_252893 ?auto_252894 ?auto_252895 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_252934 - BLOCK
      ?auto_252935 - BLOCK
      ?auto_252936 - BLOCK
      ?auto_252937 - BLOCK
      ?auto_252938 - BLOCK
      ?auto_252939 - BLOCK
      ?auto_252940 - BLOCK
      ?auto_252941 - BLOCK
      ?auto_252942 - BLOCK
      ?auto_252943 - BLOCK
      ?auto_252944 - BLOCK
      ?auto_252945 - BLOCK
    )
    :vars
    (
      ?auto_252946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252945 ?auto_252946 ) ( ON-TABLE ?auto_252934 ) ( ON ?auto_252935 ?auto_252934 ) ( ON ?auto_252936 ?auto_252935 ) ( ON ?auto_252937 ?auto_252936 ) ( ON ?auto_252938 ?auto_252937 ) ( ON ?auto_252939 ?auto_252938 ) ( ON ?auto_252940 ?auto_252939 ) ( ON ?auto_252941 ?auto_252940 ) ( not ( = ?auto_252934 ?auto_252935 ) ) ( not ( = ?auto_252934 ?auto_252936 ) ) ( not ( = ?auto_252934 ?auto_252937 ) ) ( not ( = ?auto_252934 ?auto_252938 ) ) ( not ( = ?auto_252934 ?auto_252939 ) ) ( not ( = ?auto_252934 ?auto_252940 ) ) ( not ( = ?auto_252934 ?auto_252941 ) ) ( not ( = ?auto_252934 ?auto_252942 ) ) ( not ( = ?auto_252934 ?auto_252943 ) ) ( not ( = ?auto_252934 ?auto_252944 ) ) ( not ( = ?auto_252934 ?auto_252945 ) ) ( not ( = ?auto_252934 ?auto_252946 ) ) ( not ( = ?auto_252935 ?auto_252936 ) ) ( not ( = ?auto_252935 ?auto_252937 ) ) ( not ( = ?auto_252935 ?auto_252938 ) ) ( not ( = ?auto_252935 ?auto_252939 ) ) ( not ( = ?auto_252935 ?auto_252940 ) ) ( not ( = ?auto_252935 ?auto_252941 ) ) ( not ( = ?auto_252935 ?auto_252942 ) ) ( not ( = ?auto_252935 ?auto_252943 ) ) ( not ( = ?auto_252935 ?auto_252944 ) ) ( not ( = ?auto_252935 ?auto_252945 ) ) ( not ( = ?auto_252935 ?auto_252946 ) ) ( not ( = ?auto_252936 ?auto_252937 ) ) ( not ( = ?auto_252936 ?auto_252938 ) ) ( not ( = ?auto_252936 ?auto_252939 ) ) ( not ( = ?auto_252936 ?auto_252940 ) ) ( not ( = ?auto_252936 ?auto_252941 ) ) ( not ( = ?auto_252936 ?auto_252942 ) ) ( not ( = ?auto_252936 ?auto_252943 ) ) ( not ( = ?auto_252936 ?auto_252944 ) ) ( not ( = ?auto_252936 ?auto_252945 ) ) ( not ( = ?auto_252936 ?auto_252946 ) ) ( not ( = ?auto_252937 ?auto_252938 ) ) ( not ( = ?auto_252937 ?auto_252939 ) ) ( not ( = ?auto_252937 ?auto_252940 ) ) ( not ( = ?auto_252937 ?auto_252941 ) ) ( not ( = ?auto_252937 ?auto_252942 ) ) ( not ( = ?auto_252937 ?auto_252943 ) ) ( not ( = ?auto_252937 ?auto_252944 ) ) ( not ( = ?auto_252937 ?auto_252945 ) ) ( not ( = ?auto_252937 ?auto_252946 ) ) ( not ( = ?auto_252938 ?auto_252939 ) ) ( not ( = ?auto_252938 ?auto_252940 ) ) ( not ( = ?auto_252938 ?auto_252941 ) ) ( not ( = ?auto_252938 ?auto_252942 ) ) ( not ( = ?auto_252938 ?auto_252943 ) ) ( not ( = ?auto_252938 ?auto_252944 ) ) ( not ( = ?auto_252938 ?auto_252945 ) ) ( not ( = ?auto_252938 ?auto_252946 ) ) ( not ( = ?auto_252939 ?auto_252940 ) ) ( not ( = ?auto_252939 ?auto_252941 ) ) ( not ( = ?auto_252939 ?auto_252942 ) ) ( not ( = ?auto_252939 ?auto_252943 ) ) ( not ( = ?auto_252939 ?auto_252944 ) ) ( not ( = ?auto_252939 ?auto_252945 ) ) ( not ( = ?auto_252939 ?auto_252946 ) ) ( not ( = ?auto_252940 ?auto_252941 ) ) ( not ( = ?auto_252940 ?auto_252942 ) ) ( not ( = ?auto_252940 ?auto_252943 ) ) ( not ( = ?auto_252940 ?auto_252944 ) ) ( not ( = ?auto_252940 ?auto_252945 ) ) ( not ( = ?auto_252940 ?auto_252946 ) ) ( not ( = ?auto_252941 ?auto_252942 ) ) ( not ( = ?auto_252941 ?auto_252943 ) ) ( not ( = ?auto_252941 ?auto_252944 ) ) ( not ( = ?auto_252941 ?auto_252945 ) ) ( not ( = ?auto_252941 ?auto_252946 ) ) ( not ( = ?auto_252942 ?auto_252943 ) ) ( not ( = ?auto_252942 ?auto_252944 ) ) ( not ( = ?auto_252942 ?auto_252945 ) ) ( not ( = ?auto_252942 ?auto_252946 ) ) ( not ( = ?auto_252943 ?auto_252944 ) ) ( not ( = ?auto_252943 ?auto_252945 ) ) ( not ( = ?auto_252943 ?auto_252946 ) ) ( not ( = ?auto_252944 ?auto_252945 ) ) ( not ( = ?auto_252944 ?auto_252946 ) ) ( not ( = ?auto_252945 ?auto_252946 ) ) ( ON ?auto_252944 ?auto_252945 ) ( ON ?auto_252943 ?auto_252944 ) ( CLEAR ?auto_252941 ) ( ON ?auto_252942 ?auto_252943 ) ( CLEAR ?auto_252942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_252934 ?auto_252935 ?auto_252936 ?auto_252937 ?auto_252938 ?auto_252939 ?auto_252940 ?auto_252941 ?auto_252942 )
      ( MAKE-12PILE ?auto_252934 ?auto_252935 ?auto_252936 ?auto_252937 ?auto_252938 ?auto_252939 ?auto_252940 ?auto_252941 ?auto_252942 ?auto_252943 ?auto_252944 ?auto_252945 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_252984 - BLOCK
      ?auto_252985 - BLOCK
      ?auto_252986 - BLOCK
      ?auto_252987 - BLOCK
      ?auto_252988 - BLOCK
      ?auto_252989 - BLOCK
      ?auto_252990 - BLOCK
      ?auto_252991 - BLOCK
      ?auto_252992 - BLOCK
      ?auto_252993 - BLOCK
      ?auto_252994 - BLOCK
      ?auto_252995 - BLOCK
    )
    :vars
    (
      ?auto_252996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_252995 ?auto_252996 ) ( ON-TABLE ?auto_252984 ) ( ON ?auto_252985 ?auto_252984 ) ( ON ?auto_252986 ?auto_252985 ) ( ON ?auto_252987 ?auto_252986 ) ( ON ?auto_252988 ?auto_252987 ) ( ON ?auto_252989 ?auto_252988 ) ( ON ?auto_252990 ?auto_252989 ) ( not ( = ?auto_252984 ?auto_252985 ) ) ( not ( = ?auto_252984 ?auto_252986 ) ) ( not ( = ?auto_252984 ?auto_252987 ) ) ( not ( = ?auto_252984 ?auto_252988 ) ) ( not ( = ?auto_252984 ?auto_252989 ) ) ( not ( = ?auto_252984 ?auto_252990 ) ) ( not ( = ?auto_252984 ?auto_252991 ) ) ( not ( = ?auto_252984 ?auto_252992 ) ) ( not ( = ?auto_252984 ?auto_252993 ) ) ( not ( = ?auto_252984 ?auto_252994 ) ) ( not ( = ?auto_252984 ?auto_252995 ) ) ( not ( = ?auto_252984 ?auto_252996 ) ) ( not ( = ?auto_252985 ?auto_252986 ) ) ( not ( = ?auto_252985 ?auto_252987 ) ) ( not ( = ?auto_252985 ?auto_252988 ) ) ( not ( = ?auto_252985 ?auto_252989 ) ) ( not ( = ?auto_252985 ?auto_252990 ) ) ( not ( = ?auto_252985 ?auto_252991 ) ) ( not ( = ?auto_252985 ?auto_252992 ) ) ( not ( = ?auto_252985 ?auto_252993 ) ) ( not ( = ?auto_252985 ?auto_252994 ) ) ( not ( = ?auto_252985 ?auto_252995 ) ) ( not ( = ?auto_252985 ?auto_252996 ) ) ( not ( = ?auto_252986 ?auto_252987 ) ) ( not ( = ?auto_252986 ?auto_252988 ) ) ( not ( = ?auto_252986 ?auto_252989 ) ) ( not ( = ?auto_252986 ?auto_252990 ) ) ( not ( = ?auto_252986 ?auto_252991 ) ) ( not ( = ?auto_252986 ?auto_252992 ) ) ( not ( = ?auto_252986 ?auto_252993 ) ) ( not ( = ?auto_252986 ?auto_252994 ) ) ( not ( = ?auto_252986 ?auto_252995 ) ) ( not ( = ?auto_252986 ?auto_252996 ) ) ( not ( = ?auto_252987 ?auto_252988 ) ) ( not ( = ?auto_252987 ?auto_252989 ) ) ( not ( = ?auto_252987 ?auto_252990 ) ) ( not ( = ?auto_252987 ?auto_252991 ) ) ( not ( = ?auto_252987 ?auto_252992 ) ) ( not ( = ?auto_252987 ?auto_252993 ) ) ( not ( = ?auto_252987 ?auto_252994 ) ) ( not ( = ?auto_252987 ?auto_252995 ) ) ( not ( = ?auto_252987 ?auto_252996 ) ) ( not ( = ?auto_252988 ?auto_252989 ) ) ( not ( = ?auto_252988 ?auto_252990 ) ) ( not ( = ?auto_252988 ?auto_252991 ) ) ( not ( = ?auto_252988 ?auto_252992 ) ) ( not ( = ?auto_252988 ?auto_252993 ) ) ( not ( = ?auto_252988 ?auto_252994 ) ) ( not ( = ?auto_252988 ?auto_252995 ) ) ( not ( = ?auto_252988 ?auto_252996 ) ) ( not ( = ?auto_252989 ?auto_252990 ) ) ( not ( = ?auto_252989 ?auto_252991 ) ) ( not ( = ?auto_252989 ?auto_252992 ) ) ( not ( = ?auto_252989 ?auto_252993 ) ) ( not ( = ?auto_252989 ?auto_252994 ) ) ( not ( = ?auto_252989 ?auto_252995 ) ) ( not ( = ?auto_252989 ?auto_252996 ) ) ( not ( = ?auto_252990 ?auto_252991 ) ) ( not ( = ?auto_252990 ?auto_252992 ) ) ( not ( = ?auto_252990 ?auto_252993 ) ) ( not ( = ?auto_252990 ?auto_252994 ) ) ( not ( = ?auto_252990 ?auto_252995 ) ) ( not ( = ?auto_252990 ?auto_252996 ) ) ( not ( = ?auto_252991 ?auto_252992 ) ) ( not ( = ?auto_252991 ?auto_252993 ) ) ( not ( = ?auto_252991 ?auto_252994 ) ) ( not ( = ?auto_252991 ?auto_252995 ) ) ( not ( = ?auto_252991 ?auto_252996 ) ) ( not ( = ?auto_252992 ?auto_252993 ) ) ( not ( = ?auto_252992 ?auto_252994 ) ) ( not ( = ?auto_252992 ?auto_252995 ) ) ( not ( = ?auto_252992 ?auto_252996 ) ) ( not ( = ?auto_252993 ?auto_252994 ) ) ( not ( = ?auto_252993 ?auto_252995 ) ) ( not ( = ?auto_252993 ?auto_252996 ) ) ( not ( = ?auto_252994 ?auto_252995 ) ) ( not ( = ?auto_252994 ?auto_252996 ) ) ( not ( = ?auto_252995 ?auto_252996 ) ) ( ON ?auto_252994 ?auto_252995 ) ( ON ?auto_252993 ?auto_252994 ) ( ON ?auto_252992 ?auto_252993 ) ( CLEAR ?auto_252990 ) ( ON ?auto_252991 ?auto_252992 ) ( CLEAR ?auto_252991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_252984 ?auto_252985 ?auto_252986 ?auto_252987 ?auto_252988 ?auto_252989 ?auto_252990 ?auto_252991 )
      ( MAKE-12PILE ?auto_252984 ?auto_252985 ?auto_252986 ?auto_252987 ?auto_252988 ?auto_252989 ?auto_252990 ?auto_252991 ?auto_252992 ?auto_252993 ?auto_252994 ?auto_252995 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_253034 - BLOCK
      ?auto_253035 - BLOCK
      ?auto_253036 - BLOCK
      ?auto_253037 - BLOCK
      ?auto_253038 - BLOCK
      ?auto_253039 - BLOCK
      ?auto_253040 - BLOCK
      ?auto_253041 - BLOCK
      ?auto_253042 - BLOCK
      ?auto_253043 - BLOCK
      ?auto_253044 - BLOCK
      ?auto_253045 - BLOCK
    )
    :vars
    (
      ?auto_253046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253045 ?auto_253046 ) ( ON-TABLE ?auto_253034 ) ( ON ?auto_253035 ?auto_253034 ) ( ON ?auto_253036 ?auto_253035 ) ( ON ?auto_253037 ?auto_253036 ) ( ON ?auto_253038 ?auto_253037 ) ( ON ?auto_253039 ?auto_253038 ) ( not ( = ?auto_253034 ?auto_253035 ) ) ( not ( = ?auto_253034 ?auto_253036 ) ) ( not ( = ?auto_253034 ?auto_253037 ) ) ( not ( = ?auto_253034 ?auto_253038 ) ) ( not ( = ?auto_253034 ?auto_253039 ) ) ( not ( = ?auto_253034 ?auto_253040 ) ) ( not ( = ?auto_253034 ?auto_253041 ) ) ( not ( = ?auto_253034 ?auto_253042 ) ) ( not ( = ?auto_253034 ?auto_253043 ) ) ( not ( = ?auto_253034 ?auto_253044 ) ) ( not ( = ?auto_253034 ?auto_253045 ) ) ( not ( = ?auto_253034 ?auto_253046 ) ) ( not ( = ?auto_253035 ?auto_253036 ) ) ( not ( = ?auto_253035 ?auto_253037 ) ) ( not ( = ?auto_253035 ?auto_253038 ) ) ( not ( = ?auto_253035 ?auto_253039 ) ) ( not ( = ?auto_253035 ?auto_253040 ) ) ( not ( = ?auto_253035 ?auto_253041 ) ) ( not ( = ?auto_253035 ?auto_253042 ) ) ( not ( = ?auto_253035 ?auto_253043 ) ) ( not ( = ?auto_253035 ?auto_253044 ) ) ( not ( = ?auto_253035 ?auto_253045 ) ) ( not ( = ?auto_253035 ?auto_253046 ) ) ( not ( = ?auto_253036 ?auto_253037 ) ) ( not ( = ?auto_253036 ?auto_253038 ) ) ( not ( = ?auto_253036 ?auto_253039 ) ) ( not ( = ?auto_253036 ?auto_253040 ) ) ( not ( = ?auto_253036 ?auto_253041 ) ) ( not ( = ?auto_253036 ?auto_253042 ) ) ( not ( = ?auto_253036 ?auto_253043 ) ) ( not ( = ?auto_253036 ?auto_253044 ) ) ( not ( = ?auto_253036 ?auto_253045 ) ) ( not ( = ?auto_253036 ?auto_253046 ) ) ( not ( = ?auto_253037 ?auto_253038 ) ) ( not ( = ?auto_253037 ?auto_253039 ) ) ( not ( = ?auto_253037 ?auto_253040 ) ) ( not ( = ?auto_253037 ?auto_253041 ) ) ( not ( = ?auto_253037 ?auto_253042 ) ) ( not ( = ?auto_253037 ?auto_253043 ) ) ( not ( = ?auto_253037 ?auto_253044 ) ) ( not ( = ?auto_253037 ?auto_253045 ) ) ( not ( = ?auto_253037 ?auto_253046 ) ) ( not ( = ?auto_253038 ?auto_253039 ) ) ( not ( = ?auto_253038 ?auto_253040 ) ) ( not ( = ?auto_253038 ?auto_253041 ) ) ( not ( = ?auto_253038 ?auto_253042 ) ) ( not ( = ?auto_253038 ?auto_253043 ) ) ( not ( = ?auto_253038 ?auto_253044 ) ) ( not ( = ?auto_253038 ?auto_253045 ) ) ( not ( = ?auto_253038 ?auto_253046 ) ) ( not ( = ?auto_253039 ?auto_253040 ) ) ( not ( = ?auto_253039 ?auto_253041 ) ) ( not ( = ?auto_253039 ?auto_253042 ) ) ( not ( = ?auto_253039 ?auto_253043 ) ) ( not ( = ?auto_253039 ?auto_253044 ) ) ( not ( = ?auto_253039 ?auto_253045 ) ) ( not ( = ?auto_253039 ?auto_253046 ) ) ( not ( = ?auto_253040 ?auto_253041 ) ) ( not ( = ?auto_253040 ?auto_253042 ) ) ( not ( = ?auto_253040 ?auto_253043 ) ) ( not ( = ?auto_253040 ?auto_253044 ) ) ( not ( = ?auto_253040 ?auto_253045 ) ) ( not ( = ?auto_253040 ?auto_253046 ) ) ( not ( = ?auto_253041 ?auto_253042 ) ) ( not ( = ?auto_253041 ?auto_253043 ) ) ( not ( = ?auto_253041 ?auto_253044 ) ) ( not ( = ?auto_253041 ?auto_253045 ) ) ( not ( = ?auto_253041 ?auto_253046 ) ) ( not ( = ?auto_253042 ?auto_253043 ) ) ( not ( = ?auto_253042 ?auto_253044 ) ) ( not ( = ?auto_253042 ?auto_253045 ) ) ( not ( = ?auto_253042 ?auto_253046 ) ) ( not ( = ?auto_253043 ?auto_253044 ) ) ( not ( = ?auto_253043 ?auto_253045 ) ) ( not ( = ?auto_253043 ?auto_253046 ) ) ( not ( = ?auto_253044 ?auto_253045 ) ) ( not ( = ?auto_253044 ?auto_253046 ) ) ( not ( = ?auto_253045 ?auto_253046 ) ) ( ON ?auto_253044 ?auto_253045 ) ( ON ?auto_253043 ?auto_253044 ) ( ON ?auto_253042 ?auto_253043 ) ( ON ?auto_253041 ?auto_253042 ) ( CLEAR ?auto_253039 ) ( ON ?auto_253040 ?auto_253041 ) ( CLEAR ?auto_253040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_253034 ?auto_253035 ?auto_253036 ?auto_253037 ?auto_253038 ?auto_253039 ?auto_253040 )
      ( MAKE-12PILE ?auto_253034 ?auto_253035 ?auto_253036 ?auto_253037 ?auto_253038 ?auto_253039 ?auto_253040 ?auto_253041 ?auto_253042 ?auto_253043 ?auto_253044 ?auto_253045 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_253084 - BLOCK
      ?auto_253085 - BLOCK
      ?auto_253086 - BLOCK
      ?auto_253087 - BLOCK
      ?auto_253088 - BLOCK
      ?auto_253089 - BLOCK
      ?auto_253090 - BLOCK
      ?auto_253091 - BLOCK
      ?auto_253092 - BLOCK
      ?auto_253093 - BLOCK
      ?auto_253094 - BLOCK
      ?auto_253095 - BLOCK
    )
    :vars
    (
      ?auto_253096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253095 ?auto_253096 ) ( ON-TABLE ?auto_253084 ) ( ON ?auto_253085 ?auto_253084 ) ( ON ?auto_253086 ?auto_253085 ) ( ON ?auto_253087 ?auto_253086 ) ( ON ?auto_253088 ?auto_253087 ) ( not ( = ?auto_253084 ?auto_253085 ) ) ( not ( = ?auto_253084 ?auto_253086 ) ) ( not ( = ?auto_253084 ?auto_253087 ) ) ( not ( = ?auto_253084 ?auto_253088 ) ) ( not ( = ?auto_253084 ?auto_253089 ) ) ( not ( = ?auto_253084 ?auto_253090 ) ) ( not ( = ?auto_253084 ?auto_253091 ) ) ( not ( = ?auto_253084 ?auto_253092 ) ) ( not ( = ?auto_253084 ?auto_253093 ) ) ( not ( = ?auto_253084 ?auto_253094 ) ) ( not ( = ?auto_253084 ?auto_253095 ) ) ( not ( = ?auto_253084 ?auto_253096 ) ) ( not ( = ?auto_253085 ?auto_253086 ) ) ( not ( = ?auto_253085 ?auto_253087 ) ) ( not ( = ?auto_253085 ?auto_253088 ) ) ( not ( = ?auto_253085 ?auto_253089 ) ) ( not ( = ?auto_253085 ?auto_253090 ) ) ( not ( = ?auto_253085 ?auto_253091 ) ) ( not ( = ?auto_253085 ?auto_253092 ) ) ( not ( = ?auto_253085 ?auto_253093 ) ) ( not ( = ?auto_253085 ?auto_253094 ) ) ( not ( = ?auto_253085 ?auto_253095 ) ) ( not ( = ?auto_253085 ?auto_253096 ) ) ( not ( = ?auto_253086 ?auto_253087 ) ) ( not ( = ?auto_253086 ?auto_253088 ) ) ( not ( = ?auto_253086 ?auto_253089 ) ) ( not ( = ?auto_253086 ?auto_253090 ) ) ( not ( = ?auto_253086 ?auto_253091 ) ) ( not ( = ?auto_253086 ?auto_253092 ) ) ( not ( = ?auto_253086 ?auto_253093 ) ) ( not ( = ?auto_253086 ?auto_253094 ) ) ( not ( = ?auto_253086 ?auto_253095 ) ) ( not ( = ?auto_253086 ?auto_253096 ) ) ( not ( = ?auto_253087 ?auto_253088 ) ) ( not ( = ?auto_253087 ?auto_253089 ) ) ( not ( = ?auto_253087 ?auto_253090 ) ) ( not ( = ?auto_253087 ?auto_253091 ) ) ( not ( = ?auto_253087 ?auto_253092 ) ) ( not ( = ?auto_253087 ?auto_253093 ) ) ( not ( = ?auto_253087 ?auto_253094 ) ) ( not ( = ?auto_253087 ?auto_253095 ) ) ( not ( = ?auto_253087 ?auto_253096 ) ) ( not ( = ?auto_253088 ?auto_253089 ) ) ( not ( = ?auto_253088 ?auto_253090 ) ) ( not ( = ?auto_253088 ?auto_253091 ) ) ( not ( = ?auto_253088 ?auto_253092 ) ) ( not ( = ?auto_253088 ?auto_253093 ) ) ( not ( = ?auto_253088 ?auto_253094 ) ) ( not ( = ?auto_253088 ?auto_253095 ) ) ( not ( = ?auto_253088 ?auto_253096 ) ) ( not ( = ?auto_253089 ?auto_253090 ) ) ( not ( = ?auto_253089 ?auto_253091 ) ) ( not ( = ?auto_253089 ?auto_253092 ) ) ( not ( = ?auto_253089 ?auto_253093 ) ) ( not ( = ?auto_253089 ?auto_253094 ) ) ( not ( = ?auto_253089 ?auto_253095 ) ) ( not ( = ?auto_253089 ?auto_253096 ) ) ( not ( = ?auto_253090 ?auto_253091 ) ) ( not ( = ?auto_253090 ?auto_253092 ) ) ( not ( = ?auto_253090 ?auto_253093 ) ) ( not ( = ?auto_253090 ?auto_253094 ) ) ( not ( = ?auto_253090 ?auto_253095 ) ) ( not ( = ?auto_253090 ?auto_253096 ) ) ( not ( = ?auto_253091 ?auto_253092 ) ) ( not ( = ?auto_253091 ?auto_253093 ) ) ( not ( = ?auto_253091 ?auto_253094 ) ) ( not ( = ?auto_253091 ?auto_253095 ) ) ( not ( = ?auto_253091 ?auto_253096 ) ) ( not ( = ?auto_253092 ?auto_253093 ) ) ( not ( = ?auto_253092 ?auto_253094 ) ) ( not ( = ?auto_253092 ?auto_253095 ) ) ( not ( = ?auto_253092 ?auto_253096 ) ) ( not ( = ?auto_253093 ?auto_253094 ) ) ( not ( = ?auto_253093 ?auto_253095 ) ) ( not ( = ?auto_253093 ?auto_253096 ) ) ( not ( = ?auto_253094 ?auto_253095 ) ) ( not ( = ?auto_253094 ?auto_253096 ) ) ( not ( = ?auto_253095 ?auto_253096 ) ) ( ON ?auto_253094 ?auto_253095 ) ( ON ?auto_253093 ?auto_253094 ) ( ON ?auto_253092 ?auto_253093 ) ( ON ?auto_253091 ?auto_253092 ) ( ON ?auto_253090 ?auto_253091 ) ( CLEAR ?auto_253088 ) ( ON ?auto_253089 ?auto_253090 ) ( CLEAR ?auto_253089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_253084 ?auto_253085 ?auto_253086 ?auto_253087 ?auto_253088 ?auto_253089 )
      ( MAKE-12PILE ?auto_253084 ?auto_253085 ?auto_253086 ?auto_253087 ?auto_253088 ?auto_253089 ?auto_253090 ?auto_253091 ?auto_253092 ?auto_253093 ?auto_253094 ?auto_253095 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_253134 - BLOCK
      ?auto_253135 - BLOCK
      ?auto_253136 - BLOCK
      ?auto_253137 - BLOCK
      ?auto_253138 - BLOCK
      ?auto_253139 - BLOCK
      ?auto_253140 - BLOCK
      ?auto_253141 - BLOCK
      ?auto_253142 - BLOCK
      ?auto_253143 - BLOCK
      ?auto_253144 - BLOCK
      ?auto_253145 - BLOCK
    )
    :vars
    (
      ?auto_253146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253145 ?auto_253146 ) ( ON-TABLE ?auto_253134 ) ( ON ?auto_253135 ?auto_253134 ) ( ON ?auto_253136 ?auto_253135 ) ( ON ?auto_253137 ?auto_253136 ) ( not ( = ?auto_253134 ?auto_253135 ) ) ( not ( = ?auto_253134 ?auto_253136 ) ) ( not ( = ?auto_253134 ?auto_253137 ) ) ( not ( = ?auto_253134 ?auto_253138 ) ) ( not ( = ?auto_253134 ?auto_253139 ) ) ( not ( = ?auto_253134 ?auto_253140 ) ) ( not ( = ?auto_253134 ?auto_253141 ) ) ( not ( = ?auto_253134 ?auto_253142 ) ) ( not ( = ?auto_253134 ?auto_253143 ) ) ( not ( = ?auto_253134 ?auto_253144 ) ) ( not ( = ?auto_253134 ?auto_253145 ) ) ( not ( = ?auto_253134 ?auto_253146 ) ) ( not ( = ?auto_253135 ?auto_253136 ) ) ( not ( = ?auto_253135 ?auto_253137 ) ) ( not ( = ?auto_253135 ?auto_253138 ) ) ( not ( = ?auto_253135 ?auto_253139 ) ) ( not ( = ?auto_253135 ?auto_253140 ) ) ( not ( = ?auto_253135 ?auto_253141 ) ) ( not ( = ?auto_253135 ?auto_253142 ) ) ( not ( = ?auto_253135 ?auto_253143 ) ) ( not ( = ?auto_253135 ?auto_253144 ) ) ( not ( = ?auto_253135 ?auto_253145 ) ) ( not ( = ?auto_253135 ?auto_253146 ) ) ( not ( = ?auto_253136 ?auto_253137 ) ) ( not ( = ?auto_253136 ?auto_253138 ) ) ( not ( = ?auto_253136 ?auto_253139 ) ) ( not ( = ?auto_253136 ?auto_253140 ) ) ( not ( = ?auto_253136 ?auto_253141 ) ) ( not ( = ?auto_253136 ?auto_253142 ) ) ( not ( = ?auto_253136 ?auto_253143 ) ) ( not ( = ?auto_253136 ?auto_253144 ) ) ( not ( = ?auto_253136 ?auto_253145 ) ) ( not ( = ?auto_253136 ?auto_253146 ) ) ( not ( = ?auto_253137 ?auto_253138 ) ) ( not ( = ?auto_253137 ?auto_253139 ) ) ( not ( = ?auto_253137 ?auto_253140 ) ) ( not ( = ?auto_253137 ?auto_253141 ) ) ( not ( = ?auto_253137 ?auto_253142 ) ) ( not ( = ?auto_253137 ?auto_253143 ) ) ( not ( = ?auto_253137 ?auto_253144 ) ) ( not ( = ?auto_253137 ?auto_253145 ) ) ( not ( = ?auto_253137 ?auto_253146 ) ) ( not ( = ?auto_253138 ?auto_253139 ) ) ( not ( = ?auto_253138 ?auto_253140 ) ) ( not ( = ?auto_253138 ?auto_253141 ) ) ( not ( = ?auto_253138 ?auto_253142 ) ) ( not ( = ?auto_253138 ?auto_253143 ) ) ( not ( = ?auto_253138 ?auto_253144 ) ) ( not ( = ?auto_253138 ?auto_253145 ) ) ( not ( = ?auto_253138 ?auto_253146 ) ) ( not ( = ?auto_253139 ?auto_253140 ) ) ( not ( = ?auto_253139 ?auto_253141 ) ) ( not ( = ?auto_253139 ?auto_253142 ) ) ( not ( = ?auto_253139 ?auto_253143 ) ) ( not ( = ?auto_253139 ?auto_253144 ) ) ( not ( = ?auto_253139 ?auto_253145 ) ) ( not ( = ?auto_253139 ?auto_253146 ) ) ( not ( = ?auto_253140 ?auto_253141 ) ) ( not ( = ?auto_253140 ?auto_253142 ) ) ( not ( = ?auto_253140 ?auto_253143 ) ) ( not ( = ?auto_253140 ?auto_253144 ) ) ( not ( = ?auto_253140 ?auto_253145 ) ) ( not ( = ?auto_253140 ?auto_253146 ) ) ( not ( = ?auto_253141 ?auto_253142 ) ) ( not ( = ?auto_253141 ?auto_253143 ) ) ( not ( = ?auto_253141 ?auto_253144 ) ) ( not ( = ?auto_253141 ?auto_253145 ) ) ( not ( = ?auto_253141 ?auto_253146 ) ) ( not ( = ?auto_253142 ?auto_253143 ) ) ( not ( = ?auto_253142 ?auto_253144 ) ) ( not ( = ?auto_253142 ?auto_253145 ) ) ( not ( = ?auto_253142 ?auto_253146 ) ) ( not ( = ?auto_253143 ?auto_253144 ) ) ( not ( = ?auto_253143 ?auto_253145 ) ) ( not ( = ?auto_253143 ?auto_253146 ) ) ( not ( = ?auto_253144 ?auto_253145 ) ) ( not ( = ?auto_253144 ?auto_253146 ) ) ( not ( = ?auto_253145 ?auto_253146 ) ) ( ON ?auto_253144 ?auto_253145 ) ( ON ?auto_253143 ?auto_253144 ) ( ON ?auto_253142 ?auto_253143 ) ( ON ?auto_253141 ?auto_253142 ) ( ON ?auto_253140 ?auto_253141 ) ( ON ?auto_253139 ?auto_253140 ) ( CLEAR ?auto_253137 ) ( ON ?auto_253138 ?auto_253139 ) ( CLEAR ?auto_253138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_253134 ?auto_253135 ?auto_253136 ?auto_253137 ?auto_253138 )
      ( MAKE-12PILE ?auto_253134 ?auto_253135 ?auto_253136 ?auto_253137 ?auto_253138 ?auto_253139 ?auto_253140 ?auto_253141 ?auto_253142 ?auto_253143 ?auto_253144 ?auto_253145 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_253184 - BLOCK
      ?auto_253185 - BLOCK
      ?auto_253186 - BLOCK
      ?auto_253187 - BLOCK
      ?auto_253188 - BLOCK
      ?auto_253189 - BLOCK
      ?auto_253190 - BLOCK
      ?auto_253191 - BLOCK
      ?auto_253192 - BLOCK
      ?auto_253193 - BLOCK
      ?auto_253194 - BLOCK
      ?auto_253195 - BLOCK
    )
    :vars
    (
      ?auto_253196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253195 ?auto_253196 ) ( ON-TABLE ?auto_253184 ) ( ON ?auto_253185 ?auto_253184 ) ( ON ?auto_253186 ?auto_253185 ) ( not ( = ?auto_253184 ?auto_253185 ) ) ( not ( = ?auto_253184 ?auto_253186 ) ) ( not ( = ?auto_253184 ?auto_253187 ) ) ( not ( = ?auto_253184 ?auto_253188 ) ) ( not ( = ?auto_253184 ?auto_253189 ) ) ( not ( = ?auto_253184 ?auto_253190 ) ) ( not ( = ?auto_253184 ?auto_253191 ) ) ( not ( = ?auto_253184 ?auto_253192 ) ) ( not ( = ?auto_253184 ?auto_253193 ) ) ( not ( = ?auto_253184 ?auto_253194 ) ) ( not ( = ?auto_253184 ?auto_253195 ) ) ( not ( = ?auto_253184 ?auto_253196 ) ) ( not ( = ?auto_253185 ?auto_253186 ) ) ( not ( = ?auto_253185 ?auto_253187 ) ) ( not ( = ?auto_253185 ?auto_253188 ) ) ( not ( = ?auto_253185 ?auto_253189 ) ) ( not ( = ?auto_253185 ?auto_253190 ) ) ( not ( = ?auto_253185 ?auto_253191 ) ) ( not ( = ?auto_253185 ?auto_253192 ) ) ( not ( = ?auto_253185 ?auto_253193 ) ) ( not ( = ?auto_253185 ?auto_253194 ) ) ( not ( = ?auto_253185 ?auto_253195 ) ) ( not ( = ?auto_253185 ?auto_253196 ) ) ( not ( = ?auto_253186 ?auto_253187 ) ) ( not ( = ?auto_253186 ?auto_253188 ) ) ( not ( = ?auto_253186 ?auto_253189 ) ) ( not ( = ?auto_253186 ?auto_253190 ) ) ( not ( = ?auto_253186 ?auto_253191 ) ) ( not ( = ?auto_253186 ?auto_253192 ) ) ( not ( = ?auto_253186 ?auto_253193 ) ) ( not ( = ?auto_253186 ?auto_253194 ) ) ( not ( = ?auto_253186 ?auto_253195 ) ) ( not ( = ?auto_253186 ?auto_253196 ) ) ( not ( = ?auto_253187 ?auto_253188 ) ) ( not ( = ?auto_253187 ?auto_253189 ) ) ( not ( = ?auto_253187 ?auto_253190 ) ) ( not ( = ?auto_253187 ?auto_253191 ) ) ( not ( = ?auto_253187 ?auto_253192 ) ) ( not ( = ?auto_253187 ?auto_253193 ) ) ( not ( = ?auto_253187 ?auto_253194 ) ) ( not ( = ?auto_253187 ?auto_253195 ) ) ( not ( = ?auto_253187 ?auto_253196 ) ) ( not ( = ?auto_253188 ?auto_253189 ) ) ( not ( = ?auto_253188 ?auto_253190 ) ) ( not ( = ?auto_253188 ?auto_253191 ) ) ( not ( = ?auto_253188 ?auto_253192 ) ) ( not ( = ?auto_253188 ?auto_253193 ) ) ( not ( = ?auto_253188 ?auto_253194 ) ) ( not ( = ?auto_253188 ?auto_253195 ) ) ( not ( = ?auto_253188 ?auto_253196 ) ) ( not ( = ?auto_253189 ?auto_253190 ) ) ( not ( = ?auto_253189 ?auto_253191 ) ) ( not ( = ?auto_253189 ?auto_253192 ) ) ( not ( = ?auto_253189 ?auto_253193 ) ) ( not ( = ?auto_253189 ?auto_253194 ) ) ( not ( = ?auto_253189 ?auto_253195 ) ) ( not ( = ?auto_253189 ?auto_253196 ) ) ( not ( = ?auto_253190 ?auto_253191 ) ) ( not ( = ?auto_253190 ?auto_253192 ) ) ( not ( = ?auto_253190 ?auto_253193 ) ) ( not ( = ?auto_253190 ?auto_253194 ) ) ( not ( = ?auto_253190 ?auto_253195 ) ) ( not ( = ?auto_253190 ?auto_253196 ) ) ( not ( = ?auto_253191 ?auto_253192 ) ) ( not ( = ?auto_253191 ?auto_253193 ) ) ( not ( = ?auto_253191 ?auto_253194 ) ) ( not ( = ?auto_253191 ?auto_253195 ) ) ( not ( = ?auto_253191 ?auto_253196 ) ) ( not ( = ?auto_253192 ?auto_253193 ) ) ( not ( = ?auto_253192 ?auto_253194 ) ) ( not ( = ?auto_253192 ?auto_253195 ) ) ( not ( = ?auto_253192 ?auto_253196 ) ) ( not ( = ?auto_253193 ?auto_253194 ) ) ( not ( = ?auto_253193 ?auto_253195 ) ) ( not ( = ?auto_253193 ?auto_253196 ) ) ( not ( = ?auto_253194 ?auto_253195 ) ) ( not ( = ?auto_253194 ?auto_253196 ) ) ( not ( = ?auto_253195 ?auto_253196 ) ) ( ON ?auto_253194 ?auto_253195 ) ( ON ?auto_253193 ?auto_253194 ) ( ON ?auto_253192 ?auto_253193 ) ( ON ?auto_253191 ?auto_253192 ) ( ON ?auto_253190 ?auto_253191 ) ( ON ?auto_253189 ?auto_253190 ) ( ON ?auto_253188 ?auto_253189 ) ( CLEAR ?auto_253186 ) ( ON ?auto_253187 ?auto_253188 ) ( CLEAR ?auto_253187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_253184 ?auto_253185 ?auto_253186 ?auto_253187 )
      ( MAKE-12PILE ?auto_253184 ?auto_253185 ?auto_253186 ?auto_253187 ?auto_253188 ?auto_253189 ?auto_253190 ?auto_253191 ?auto_253192 ?auto_253193 ?auto_253194 ?auto_253195 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_253234 - BLOCK
      ?auto_253235 - BLOCK
      ?auto_253236 - BLOCK
      ?auto_253237 - BLOCK
      ?auto_253238 - BLOCK
      ?auto_253239 - BLOCK
      ?auto_253240 - BLOCK
      ?auto_253241 - BLOCK
      ?auto_253242 - BLOCK
      ?auto_253243 - BLOCK
      ?auto_253244 - BLOCK
      ?auto_253245 - BLOCK
    )
    :vars
    (
      ?auto_253246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253245 ?auto_253246 ) ( ON-TABLE ?auto_253234 ) ( ON ?auto_253235 ?auto_253234 ) ( not ( = ?auto_253234 ?auto_253235 ) ) ( not ( = ?auto_253234 ?auto_253236 ) ) ( not ( = ?auto_253234 ?auto_253237 ) ) ( not ( = ?auto_253234 ?auto_253238 ) ) ( not ( = ?auto_253234 ?auto_253239 ) ) ( not ( = ?auto_253234 ?auto_253240 ) ) ( not ( = ?auto_253234 ?auto_253241 ) ) ( not ( = ?auto_253234 ?auto_253242 ) ) ( not ( = ?auto_253234 ?auto_253243 ) ) ( not ( = ?auto_253234 ?auto_253244 ) ) ( not ( = ?auto_253234 ?auto_253245 ) ) ( not ( = ?auto_253234 ?auto_253246 ) ) ( not ( = ?auto_253235 ?auto_253236 ) ) ( not ( = ?auto_253235 ?auto_253237 ) ) ( not ( = ?auto_253235 ?auto_253238 ) ) ( not ( = ?auto_253235 ?auto_253239 ) ) ( not ( = ?auto_253235 ?auto_253240 ) ) ( not ( = ?auto_253235 ?auto_253241 ) ) ( not ( = ?auto_253235 ?auto_253242 ) ) ( not ( = ?auto_253235 ?auto_253243 ) ) ( not ( = ?auto_253235 ?auto_253244 ) ) ( not ( = ?auto_253235 ?auto_253245 ) ) ( not ( = ?auto_253235 ?auto_253246 ) ) ( not ( = ?auto_253236 ?auto_253237 ) ) ( not ( = ?auto_253236 ?auto_253238 ) ) ( not ( = ?auto_253236 ?auto_253239 ) ) ( not ( = ?auto_253236 ?auto_253240 ) ) ( not ( = ?auto_253236 ?auto_253241 ) ) ( not ( = ?auto_253236 ?auto_253242 ) ) ( not ( = ?auto_253236 ?auto_253243 ) ) ( not ( = ?auto_253236 ?auto_253244 ) ) ( not ( = ?auto_253236 ?auto_253245 ) ) ( not ( = ?auto_253236 ?auto_253246 ) ) ( not ( = ?auto_253237 ?auto_253238 ) ) ( not ( = ?auto_253237 ?auto_253239 ) ) ( not ( = ?auto_253237 ?auto_253240 ) ) ( not ( = ?auto_253237 ?auto_253241 ) ) ( not ( = ?auto_253237 ?auto_253242 ) ) ( not ( = ?auto_253237 ?auto_253243 ) ) ( not ( = ?auto_253237 ?auto_253244 ) ) ( not ( = ?auto_253237 ?auto_253245 ) ) ( not ( = ?auto_253237 ?auto_253246 ) ) ( not ( = ?auto_253238 ?auto_253239 ) ) ( not ( = ?auto_253238 ?auto_253240 ) ) ( not ( = ?auto_253238 ?auto_253241 ) ) ( not ( = ?auto_253238 ?auto_253242 ) ) ( not ( = ?auto_253238 ?auto_253243 ) ) ( not ( = ?auto_253238 ?auto_253244 ) ) ( not ( = ?auto_253238 ?auto_253245 ) ) ( not ( = ?auto_253238 ?auto_253246 ) ) ( not ( = ?auto_253239 ?auto_253240 ) ) ( not ( = ?auto_253239 ?auto_253241 ) ) ( not ( = ?auto_253239 ?auto_253242 ) ) ( not ( = ?auto_253239 ?auto_253243 ) ) ( not ( = ?auto_253239 ?auto_253244 ) ) ( not ( = ?auto_253239 ?auto_253245 ) ) ( not ( = ?auto_253239 ?auto_253246 ) ) ( not ( = ?auto_253240 ?auto_253241 ) ) ( not ( = ?auto_253240 ?auto_253242 ) ) ( not ( = ?auto_253240 ?auto_253243 ) ) ( not ( = ?auto_253240 ?auto_253244 ) ) ( not ( = ?auto_253240 ?auto_253245 ) ) ( not ( = ?auto_253240 ?auto_253246 ) ) ( not ( = ?auto_253241 ?auto_253242 ) ) ( not ( = ?auto_253241 ?auto_253243 ) ) ( not ( = ?auto_253241 ?auto_253244 ) ) ( not ( = ?auto_253241 ?auto_253245 ) ) ( not ( = ?auto_253241 ?auto_253246 ) ) ( not ( = ?auto_253242 ?auto_253243 ) ) ( not ( = ?auto_253242 ?auto_253244 ) ) ( not ( = ?auto_253242 ?auto_253245 ) ) ( not ( = ?auto_253242 ?auto_253246 ) ) ( not ( = ?auto_253243 ?auto_253244 ) ) ( not ( = ?auto_253243 ?auto_253245 ) ) ( not ( = ?auto_253243 ?auto_253246 ) ) ( not ( = ?auto_253244 ?auto_253245 ) ) ( not ( = ?auto_253244 ?auto_253246 ) ) ( not ( = ?auto_253245 ?auto_253246 ) ) ( ON ?auto_253244 ?auto_253245 ) ( ON ?auto_253243 ?auto_253244 ) ( ON ?auto_253242 ?auto_253243 ) ( ON ?auto_253241 ?auto_253242 ) ( ON ?auto_253240 ?auto_253241 ) ( ON ?auto_253239 ?auto_253240 ) ( ON ?auto_253238 ?auto_253239 ) ( ON ?auto_253237 ?auto_253238 ) ( CLEAR ?auto_253235 ) ( ON ?auto_253236 ?auto_253237 ) ( CLEAR ?auto_253236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_253234 ?auto_253235 ?auto_253236 )
      ( MAKE-12PILE ?auto_253234 ?auto_253235 ?auto_253236 ?auto_253237 ?auto_253238 ?auto_253239 ?auto_253240 ?auto_253241 ?auto_253242 ?auto_253243 ?auto_253244 ?auto_253245 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_253284 - BLOCK
      ?auto_253285 - BLOCK
      ?auto_253286 - BLOCK
      ?auto_253287 - BLOCK
      ?auto_253288 - BLOCK
      ?auto_253289 - BLOCK
      ?auto_253290 - BLOCK
      ?auto_253291 - BLOCK
      ?auto_253292 - BLOCK
      ?auto_253293 - BLOCK
      ?auto_253294 - BLOCK
      ?auto_253295 - BLOCK
    )
    :vars
    (
      ?auto_253296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253295 ?auto_253296 ) ( ON-TABLE ?auto_253284 ) ( not ( = ?auto_253284 ?auto_253285 ) ) ( not ( = ?auto_253284 ?auto_253286 ) ) ( not ( = ?auto_253284 ?auto_253287 ) ) ( not ( = ?auto_253284 ?auto_253288 ) ) ( not ( = ?auto_253284 ?auto_253289 ) ) ( not ( = ?auto_253284 ?auto_253290 ) ) ( not ( = ?auto_253284 ?auto_253291 ) ) ( not ( = ?auto_253284 ?auto_253292 ) ) ( not ( = ?auto_253284 ?auto_253293 ) ) ( not ( = ?auto_253284 ?auto_253294 ) ) ( not ( = ?auto_253284 ?auto_253295 ) ) ( not ( = ?auto_253284 ?auto_253296 ) ) ( not ( = ?auto_253285 ?auto_253286 ) ) ( not ( = ?auto_253285 ?auto_253287 ) ) ( not ( = ?auto_253285 ?auto_253288 ) ) ( not ( = ?auto_253285 ?auto_253289 ) ) ( not ( = ?auto_253285 ?auto_253290 ) ) ( not ( = ?auto_253285 ?auto_253291 ) ) ( not ( = ?auto_253285 ?auto_253292 ) ) ( not ( = ?auto_253285 ?auto_253293 ) ) ( not ( = ?auto_253285 ?auto_253294 ) ) ( not ( = ?auto_253285 ?auto_253295 ) ) ( not ( = ?auto_253285 ?auto_253296 ) ) ( not ( = ?auto_253286 ?auto_253287 ) ) ( not ( = ?auto_253286 ?auto_253288 ) ) ( not ( = ?auto_253286 ?auto_253289 ) ) ( not ( = ?auto_253286 ?auto_253290 ) ) ( not ( = ?auto_253286 ?auto_253291 ) ) ( not ( = ?auto_253286 ?auto_253292 ) ) ( not ( = ?auto_253286 ?auto_253293 ) ) ( not ( = ?auto_253286 ?auto_253294 ) ) ( not ( = ?auto_253286 ?auto_253295 ) ) ( not ( = ?auto_253286 ?auto_253296 ) ) ( not ( = ?auto_253287 ?auto_253288 ) ) ( not ( = ?auto_253287 ?auto_253289 ) ) ( not ( = ?auto_253287 ?auto_253290 ) ) ( not ( = ?auto_253287 ?auto_253291 ) ) ( not ( = ?auto_253287 ?auto_253292 ) ) ( not ( = ?auto_253287 ?auto_253293 ) ) ( not ( = ?auto_253287 ?auto_253294 ) ) ( not ( = ?auto_253287 ?auto_253295 ) ) ( not ( = ?auto_253287 ?auto_253296 ) ) ( not ( = ?auto_253288 ?auto_253289 ) ) ( not ( = ?auto_253288 ?auto_253290 ) ) ( not ( = ?auto_253288 ?auto_253291 ) ) ( not ( = ?auto_253288 ?auto_253292 ) ) ( not ( = ?auto_253288 ?auto_253293 ) ) ( not ( = ?auto_253288 ?auto_253294 ) ) ( not ( = ?auto_253288 ?auto_253295 ) ) ( not ( = ?auto_253288 ?auto_253296 ) ) ( not ( = ?auto_253289 ?auto_253290 ) ) ( not ( = ?auto_253289 ?auto_253291 ) ) ( not ( = ?auto_253289 ?auto_253292 ) ) ( not ( = ?auto_253289 ?auto_253293 ) ) ( not ( = ?auto_253289 ?auto_253294 ) ) ( not ( = ?auto_253289 ?auto_253295 ) ) ( not ( = ?auto_253289 ?auto_253296 ) ) ( not ( = ?auto_253290 ?auto_253291 ) ) ( not ( = ?auto_253290 ?auto_253292 ) ) ( not ( = ?auto_253290 ?auto_253293 ) ) ( not ( = ?auto_253290 ?auto_253294 ) ) ( not ( = ?auto_253290 ?auto_253295 ) ) ( not ( = ?auto_253290 ?auto_253296 ) ) ( not ( = ?auto_253291 ?auto_253292 ) ) ( not ( = ?auto_253291 ?auto_253293 ) ) ( not ( = ?auto_253291 ?auto_253294 ) ) ( not ( = ?auto_253291 ?auto_253295 ) ) ( not ( = ?auto_253291 ?auto_253296 ) ) ( not ( = ?auto_253292 ?auto_253293 ) ) ( not ( = ?auto_253292 ?auto_253294 ) ) ( not ( = ?auto_253292 ?auto_253295 ) ) ( not ( = ?auto_253292 ?auto_253296 ) ) ( not ( = ?auto_253293 ?auto_253294 ) ) ( not ( = ?auto_253293 ?auto_253295 ) ) ( not ( = ?auto_253293 ?auto_253296 ) ) ( not ( = ?auto_253294 ?auto_253295 ) ) ( not ( = ?auto_253294 ?auto_253296 ) ) ( not ( = ?auto_253295 ?auto_253296 ) ) ( ON ?auto_253294 ?auto_253295 ) ( ON ?auto_253293 ?auto_253294 ) ( ON ?auto_253292 ?auto_253293 ) ( ON ?auto_253291 ?auto_253292 ) ( ON ?auto_253290 ?auto_253291 ) ( ON ?auto_253289 ?auto_253290 ) ( ON ?auto_253288 ?auto_253289 ) ( ON ?auto_253287 ?auto_253288 ) ( ON ?auto_253286 ?auto_253287 ) ( CLEAR ?auto_253284 ) ( ON ?auto_253285 ?auto_253286 ) ( CLEAR ?auto_253285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_253284 ?auto_253285 )
      ( MAKE-12PILE ?auto_253284 ?auto_253285 ?auto_253286 ?auto_253287 ?auto_253288 ?auto_253289 ?auto_253290 ?auto_253291 ?auto_253292 ?auto_253293 ?auto_253294 ?auto_253295 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_253334 - BLOCK
      ?auto_253335 - BLOCK
      ?auto_253336 - BLOCK
      ?auto_253337 - BLOCK
      ?auto_253338 - BLOCK
      ?auto_253339 - BLOCK
      ?auto_253340 - BLOCK
      ?auto_253341 - BLOCK
      ?auto_253342 - BLOCK
      ?auto_253343 - BLOCK
      ?auto_253344 - BLOCK
      ?auto_253345 - BLOCK
    )
    :vars
    (
      ?auto_253346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253345 ?auto_253346 ) ( not ( = ?auto_253334 ?auto_253335 ) ) ( not ( = ?auto_253334 ?auto_253336 ) ) ( not ( = ?auto_253334 ?auto_253337 ) ) ( not ( = ?auto_253334 ?auto_253338 ) ) ( not ( = ?auto_253334 ?auto_253339 ) ) ( not ( = ?auto_253334 ?auto_253340 ) ) ( not ( = ?auto_253334 ?auto_253341 ) ) ( not ( = ?auto_253334 ?auto_253342 ) ) ( not ( = ?auto_253334 ?auto_253343 ) ) ( not ( = ?auto_253334 ?auto_253344 ) ) ( not ( = ?auto_253334 ?auto_253345 ) ) ( not ( = ?auto_253334 ?auto_253346 ) ) ( not ( = ?auto_253335 ?auto_253336 ) ) ( not ( = ?auto_253335 ?auto_253337 ) ) ( not ( = ?auto_253335 ?auto_253338 ) ) ( not ( = ?auto_253335 ?auto_253339 ) ) ( not ( = ?auto_253335 ?auto_253340 ) ) ( not ( = ?auto_253335 ?auto_253341 ) ) ( not ( = ?auto_253335 ?auto_253342 ) ) ( not ( = ?auto_253335 ?auto_253343 ) ) ( not ( = ?auto_253335 ?auto_253344 ) ) ( not ( = ?auto_253335 ?auto_253345 ) ) ( not ( = ?auto_253335 ?auto_253346 ) ) ( not ( = ?auto_253336 ?auto_253337 ) ) ( not ( = ?auto_253336 ?auto_253338 ) ) ( not ( = ?auto_253336 ?auto_253339 ) ) ( not ( = ?auto_253336 ?auto_253340 ) ) ( not ( = ?auto_253336 ?auto_253341 ) ) ( not ( = ?auto_253336 ?auto_253342 ) ) ( not ( = ?auto_253336 ?auto_253343 ) ) ( not ( = ?auto_253336 ?auto_253344 ) ) ( not ( = ?auto_253336 ?auto_253345 ) ) ( not ( = ?auto_253336 ?auto_253346 ) ) ( not ( = ?auto_253337 ?auto_253338 ) ) ( not ( = ?auto_253337 ?auto_253339 ) ) ( not ( = ?auto_253337 ?auto_253340 ) ) ( not ( = ?auto_253337 ?auto_253341 ) ) ( not ( = ?auto_253337 ?auto_253342 ) ) ( not ( = ?auto_253337 ?auto_253343 ) ) ( not ( = ?auto_253337 ?auto_253344 ) ) ( not ( = ?auto_253337 ?auto_253345 ) ) ( not ( = ?auto_253337 ?auto_253346 ) ) ( not ( = ?auto_253338 ?auto_253339 ) ) ( not ( = ?auto_253338 ?auto_253340 ) ) ( not ( = ?auto_253338 ?auto_253341 ) ) ( not ( = ?auto_253338 ?auto_253342 ) ) ( not ( = ?auto_253338 ?auto_253343 ) ) ( not ( = ?auto_253338 ?auto_253344 ) ) ( not ( = ?auto_253338 ?auto_253345 ) ) ( not ( = ?auto_253338 ?auto_253346 ) ) ( not ( = ?auto_253339 ?auto_253340 ) ) ( not ( = ?auto_253339 ?auto_253341 ) ) ( not ( = ?auto_253339 ?auto_253342 ) ) ( not ( = ?auto_253339 ?auto_253343 ) ) ( not ( = ?auto_253339 ?auto_253344 ) ) ( not ( = ?auto_253339 ?auto_253345 ) ) ( not ( = ?auto_253339 ?auto_253346 ) ) ( not ( = ?auto_253340 ?auto_253341 ) ) ( not ( = ?auto_253340 ?auto_253342 ) ) ( not ( = ?auto_253340 ?auto_253343 ) ) ( not ( = ?auto_253340 ?auto_253344 ) ) ( not ( = ?auto_253340 ?auto_253345 ) ) ( not ( = ?auto_253340 ?auto_253346 ) ) ( not ( = ?auto_253341 ?auto_253342 ) ) ( not ( = ?auto_253341 ?auto_253343 ) ) ( not ( = ?auto_253341 ?auto_253344 ) ) ( not ( = ?auto_253341 ?auto_253345 ) ) ( not ( = ?auto_253341 ?auto_253346 ) ) ( not ( = ?auto_253342 ?auto_253343 ) ) ( not ( = ?auto_253342 ?auto_253344 ) ) ( not ( = ?auto_253342 ?auto_253345 ) ) ( not ( = ?auto_253342 ?auto_253346 ) ) ( not ( = ?auto_253343 ?auto_253344 ) ) ( not ( = ?auto_253343 ?auto_253345 ) ) ( not ( = ?auto_253343 ?auto_253346 ) ) ( not ( = ?auto_253344 ?auto_253345 ) ) ( not ( = ?auto_253344 ?auto_253346 ) ) ( not ( = ?auto_253345 ?auto_253346 ) ) ( ON ?auto_253344 ?auto_253345 ) ( ON ?auto_253343 ?auto_253344 ) ( ON ?auto_253342 ?auto_253343 ) ( ON ?auto_253341 ?auto_253342 ) ( ON ?auto_253340 ?auto_253341 ) ( ON ?auto_253339 ?auto_253340 ) ( ON ?auto_253338 ?auto_253339 ) ( ON ?auto_253337 ?auto_253338 ) ( ON ?auto_253336 ?auto_253337 ) ( ON ?auto_253335 ?auto_253336 ) ( ON ?auto_253334 ?auto_253335 ) ( CLEAR ?auto_253334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_253334 )
      ( MAKE-12PILE ?auto_253334 ?auto_253335 ?auto_253336 ?auto_253337 ?auto_253338 ?auto_253339 ?auto_253340 ?auto_253341 ?auto_253342 ?auto_253343 ?auto_253344 ?auto_253345 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253385 - BLOCK
      ?auto_253386 - BLOCK
      ?auto_253387 - BLOCK
      ?auto_253388 - BLOCK
      ?auto_253389 - BLOCK
      ?auto_253390 - BLOCK
      ?auto_253391 - BLOCK
      ?auto_253392 - BLOCK
      ?auto_253393 - BLOCK
      ?auto_253394 - BLOCK
      ?auto_253395 - BLOCK
      ?auto_253396 - BLOCK
      ?auto_253397 - BLOCK
    )
    :vars
    (
      ?auto_253398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_253396 ) ( ON ?auto_253397 ?auto_253398 ) ( CLEAR ?auto_253397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_253385 ) ( ON ?auto_253386 ?auto_253385 ) ( ON ?auto_253387 ?auto_253386 ) ( ON ?auto_253388 ?auto_253387 ) ( ON ?auto_253389 ?auto_253388 ) ( ON ?auto_253390 ?auto_253389 ) ( ON ?auto_253391 ?auto_253390 ) ( ON ?auto_253392 ?auto_253391 ) ( ON ?auto_253393 ?auto_253392 ) ( ON ?auto_253394 ?auto_253393 ) ( ON ?auto_253395 ?auto_253394 ) ( ON ?auto_253396 ?auto_253395 ) ( not ( = ?auto_253385 ?auto_253386 ) ) ( not ( = ?auto_253385 ?auto_253387 ) ) ( not ( = ?auto_253385 ?auto_253388 ) ) ( not ( = ?auto_253385 ?auto_253389 ) ) ( not ( = ?auto_253385 ?auto_253390 ) ) ( not ( = ?auto_253385 ?auto_253391 ) ) ( not ( = ?auto_253385 ?auto_253392 ) ) ( not ( = ?auto_253385 ?auto_253393 ) ) ( not ( = ?auto_253385 ?auto_253394 ) ) ( not ( = ?auto_253385 ?auto_253395 ) ) ( not ( = ?auto_253385 ?auto_253396 ) ) ( not ( = ?auto_253385 ?auto_253397 ) ) ( not ( = ?auto_253385 ?auto_253398 ) ) ( not ( = ?auto_253386 ?auto_253387 ) ) ( not ( = ?auto_253386 ?auto_253388 ) ) ( not ( = ?auto_253386 ?auto_253389 ) ) ( not ( = ?auto_253386 ?auto_253390 ) ) ( not ( = ?auto_253386 ?auto_253391 ) ) ( not ( = ?auto_253386 ?auto_253392 ) ) ( not ( = ?auto_253386 ?auto_253393 ) ) ( not ( = ?auto_253386 ?auto_253394 ) ) ( not ( = ?auto_253386 ?auto_253395 ) ) ( not ( = ?auto_253386 ?auto_253396 ) ) ( not ( = ?auto_253386 ?auto_253397 ) ) ( not ( = ?auto_253386 ?auto_253398 ) ) ( not ( = ?auto_253387 ?auto_253388 ) ) ( not ( = ?auto_253387 ?auto_253389 ) ) ( not ( = ?auto_253387 ?auto_253390 ) ) ( not ( = ?auto_253387 ?auto_253391 ) ) ( not ( = ?auto_253387 ?auto_253392 ) ) ( not ( = ?auto_253387 ?auto_253393 ) ) ( not ( = ?auto_253387 ?auto_253394 ) ) ( not ( = ?auto_253387 ?auto_253395 ) ) ( not ( = ?auto_253387 ?auto_253396 ) ) ( not ( = ?auto_253387 ?auto_253397 ) ) ( not ( = ?auto_253387 ?auto_253398 ) ) ( not ( = ?auto_253388 ?auto_253389 ) ) ( not ( = ?auto_253388 ?auto_253390 ) ) ( not ( = ?auto_253388 ?auto_253391 ) ) ( not ( = ?auto_253388 ?auto_253392 ) ) ( not ( = ?auto_253388 ?auto_253393 ) ) ( not ( = ?auto_253388 ?auto_253394 ) ) ( not ( = ?auto_253388 ?auto_253395 ) ) ( not ( = ?auto_253388 ?auto_253396 ) ) ( not ( = ?auto_253388 ?auto_253397 ) ) ( not ( = ?auto_253388 ?auto_253398 ) ) ( not ( = ?auto_253389 ?auto_253390 ) ) ( not ( = ?auto_253389 ?auto_253391 ) ) ( not ( = ?auto_253389 ?auto_253392 ) ) ( not ( = ?auto_253389 ?auto_253393 ) ) ( not ( = ?auto_253389 ?auto_253394 ) ) ( not ( = ?auto_253389 ?auto_253395 ) ) ( not ( = ?auto_253389 ?auto_253396 ) ) ( not ( = ?auto_253389 ?auto_253397 ) ) ( not ( = ?auto_253389 ?auto_253398 ) ) ( not ( = ?auto_253390 ?auto_253391 ) ) ( not ( = ?auto_253390 ?auto_253392 ) ) ( not ( = ?auto_253390 ?auto_253393 ) ) ( not ( = ?auto_253390 ?auto_253394 ) ) ( not ( = ?auto_253390 ?auto_253395 ) ) ( not ( = ?auto_253390 ?auto_253396 ) ) ( not ( = ?auto_253390 ?auto_253397 ) ) ( not ( = ?auto_253390 ?auto_253398 ) ) ( not ( = ?auto_253391 ?auto_253392 ) ) ( not ( = ?auto_253391 ?auto_253393 ) ) ( not ( = ?auto_253391 ?auto_253394 ) ) ( not ( = ?auto_253391 ?auto_253395 ) ) ( not ( = ?auto_253391 ?auto_253396 ) ) ( not ( = ?auto_253391 ?auto_253397 ) ) ( not ( = ?auto_253391 ?auto_253398 ) ) ( not ( = ?auto_253392 ?auto_253393 ) ) ( not ( = ?auto_253392 ?auto_253394 ) ) ( not ( = ?auto_253392 ?auto_253395 ) ) ( not ( = ?auto_253392 ?auto_253396 ) ) ( not ( = ?auto_253392 ?auto_253397 ) ) ( not ( = ?auto_253392 ?auto_253398 ) ) ( not ( = ?auto_253393 ?auto_253394 ) ) ( not ( = ?auto_253393 ?auto_253395 ) ) ( not ( = ?auto_253393 ?auto_253396 ) ) ( not ( = ?auto_253393 ?auto_253397 ) ) ( not ( = ?auto_253393 ?auto_253398 ) ) ( not ( = ?auto_253394 ?auto_253395 ) ) ( not ( = ?auto_253394 ?auto_253396 ) ) ( not ( = ?auto_253394 ?auto_253397 ) ) ( not ( = ?auto_253394 ?auto_253398 ) ) ( not ( = ?auto_253395 ?auto_253396 ) ) ( not ( = ?auto_253395 ?auto_253397 ) ) ( not ( = ?auto_253395 ?auto_253398 ) ) ( not ( = ?auto_253396 ?auto_253397 ) ) ( not ( = ?auto_253396 ?auto_253398 ) ) ( not ( = ?auto_253397 ?auto_253398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_253397 ?auto_253398 )
      ( !STACK ?auto_253397 ?auto_253396 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253412 - BLOCK
      ?auto_253413 - BLOCK
      ?auto_253414 - BLOCK
      ?auto_253415 - BLOCK
      ?auto_253416 - BLOCK
      ?auto_253417 - BLOCK
      ?auto_253418 - BLOCK
      ?auto_253419 - BLOCK
      ?auto_253420 - BLOCK
      ?auto_253421 - BLOCK
      ?auto_253422 - BLOCK
      ?auto_253423 - BLOCK
      ?auto_253424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_253423 ) ( ON-TABLE ?auto_253424 ) ( CLEAR ?auto_253424 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_253412 ) ( ON ?auto_253413 ?auto_253412 ) ( ON ?auto_253414 ?auto_253413 ) ( ON ?auto_253415 ?auto_253414 ) ( ON ?auto_253416 ?auto_253415 ) ( ON ?auto_253417 ?auto_253416 ) ( ON ?auto_253418 ?auto_253417 ) ( ON ?auto_253419 ?auto_253418 ) ( ON ?auto_253420 ?auto_253419 ) ( ON ?auto_253421 ?auto_253420 ) ( ON ?auto_253422 ?auto_253421 ) ( ON ?auto_253423 ?auto_253422 ) ( not ( = ?auto_253412 ?auto_253413 ) ) ( not ( = ?auto_253412 ?auto_253414 ) ) ( not ( = ?auto_253412 ?auto_253415 ) ) ( not ( = ?auto_253412 ?auto_253416 ) ) ( not ( = ?auto_253412 ?auto_253417 ) ) ( not ( = ?auto_253412 ?auto_253418 ) ) ( not ( = ?auto_253412 ?auto_253419 ) ) ( not ( = ?auto_253412 ?auto_253420 ) ) ( not ( = ?auto_253412 ?auto_253421 ) ) ( not ( = ?auto_253412 ?auto_253422 ) ) ( not ( = ?auto_253412 ?auto_253423 ) ) ( not ( = ?auto_253412 ?auto_253424 ) ) ( not ( = ?auto_253413 ?auto_253414 ) ) ( not ( = ?auto_253413 ?auto_253415 ) ) ( not ( = ?auto_253413 ?auto_253416 ) ) ( not ( = ?auto_253413 ?auto_253417 ) ) ( not ( = ?auto_253413 ?auto_253418 ) ) ( not ( = ?auto_253413 ?auto_253419 ) ) ( not ( = ?auto_253413 ?auto_253420 ) ) ( not ( = ?auto_253413 ?auto_253421 ) ) ( not ( = ?auto_253413 ?auto_253422 ) ) ( not ( = ?auto_253413 ?auto_253423 ) ) ( not ( = ?auto_253413 ?auto_253424 ) ) ( not ( = ?auto_253414 ?auto_253415 ) ) ( not ( = ?auto_253414 ?auto_253416 ) ) ( not ( = ?auto_253414 ?auto_253417 ) ) ( not ( = ?auto_253414 ?auto_253418 ) ) ( not ( = ?auto_253414 ?auto_253419 ) ) ( not ( = ?auto_253414 ?auto_253420 ) ) ( not ( = ?auto_253414 ?auto_253421 ) ) ( not ( = ?auto_253414 ?auto_253422 ) ) ( not ( = ?auto_253414 ?auto_253423 ) ) ( not ( = ?auto_253414 ?auto_253424 ) ) ( not ( = ?auto_253415 ?auto_253416 ) ) ( not ( = ?auto_253415 ?auto_253417 ) ) ( not ( = ?auto_253415 ?auto_253418 ) ) ( not ( = ?auto_253415 ?auto_253419 ) ) ( not ( = ?auto_253415 ?auto_253420 ) ) ( not ( = ?auto_253415 ?auto_253421 ) ) ( not ( = ?auto_253415 ?auto_253422 ) ) ( not ( = ?auto_253415 ?auto_253423 ) ) ( not ( = ?auto_253415 ?auto_253424 ) ) ( not ( = ?auto_253416 ?auto_253417 ) ) ( not ( = ?auto_253416 ?auto_253418 ) ) ( not ( = ?auto_253416 ?auto_253419 ) ) ( not ( = ?auto_253416 ?auto_253420 ) ) ( not ( = ?auto_253416 ?auto_253421 ) ) ( not ( = ?auto_253416 ?auto_253422 ) ) ( not ( = ?auto_253416 ?auto_253423 ) ) ( not ( = ?auto_253416 ?auto_253424 ) ) ( not ( = ?auto_253417 ?auto_253418 ) ) ( not ( = ?auto_253417 ?auto_253419 ) ) ( not ( = ?auto_253417 ?auto_253420 ) ) ( not ( = ?auto_253417 ?auto_253421 ) ) ( not ( = ?auto_253417 ?auto_253422 ) ) ( not ( = ?auto_253417 ?auto_253423 ) ) ( not ( = ?auto_253417 ?auto_253424 ) ) ( not ( = ?auto_253418 ?auto_253419 ) ) ( not ( = ?auto_253418 ?auto_253420 ) ) ( not ( = ?auto_253418 ?auto_253421 ) ) ( not ( = ?auto_253418 ?auto_253422 ) ) ( not ( = ?auto_253418 ?auto_253423 ) ) ( not ( = ?auto_253418 ?auto_253424 ) ) ( not ( = ?auto_253419 ?auto_253420 ) ) ( not ( = ?auto_253419 ?auto_253421 ) ) ( not ( = ?auto_253419 ?auto_253422 ) ) ( not ( = ?auto_253419 ?auto_253423 ) ) ( not ( = ?auto_253419 ?auto_253424 ) ) ( not ( = ?auto_253420 ?auto_253421 ) ) ( not ( = ?auto_253420 ?auto_253422 ) ) ( not ( = ?auto_253420 ?auto_253423 ) ) ( not ( = ?auto_253420 ?auto_253424 ) ) ( not ( = ?auto_253421 ?auto_253422 ) ) ( not ( = ?auto_253421 ?auto_253423 ) ) ( not ( = ?auto_253421 ?auto_253424 ) ) ( not ( = ?auto_253422 ?auto_253423 ) ) ( not ( = ?auto_253422 ?auto_253424 ) ) ( not ( = ?auto_253423 ?auto_253424 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_253424 )
      ( !STACK ?auto_253424 ?auto_253423 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253438 - BLOCK
      ?auto_253439 - BLOCK
      ?auto_253440 - BLOCK
      ?auto_253441 - BLOCK
      ?auto_253442 - BLOCK
      ?auto_253443 - BLOCK
      ?auto_253444 - BLOCK
      ?auto_253445 - BLOCK
      ?auto_253446 - BLOCK
      ?auto_253447 - BLOCK
      ?auto_253448 - BLOCK
      ?auto_253449 - BLOCK
      ?auto_253450 - BLOCK
    )
    :vars
    (
      ?auto_253451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253450 ?auto_253451 ) ( ON-TABLE ?auto_253438 ) ( ON ?auto_253439 ?auto_253438 ) ( ON ?auto_253440 ?auto_253439 ) ( ON ?auto_253441 ?auto_253440 ) ( ON ?auto_253442 ?auto_253441 ) ( ON ?auto_253443 ?auto_253442 ) ( ON ?auto_253444 ?auto_253443 ) ( ON ?auto_253445 ?auto_253444 ) ( ON ?auto_253446 ?auto_253445 ) ( ON ?auto_253447 ?auto_253446 ) ( ON ?auto_253448 ?auto_253447 ) ( not ( = ?auto_253438 ?auto_253439 ) ) ( not ( = ?auto_253438 ?auto_253440 ) ) ( not ( = ?auto_253438 ?auto_253441 ) ) ( not ( = ?auto_253438 ?auto_253442 ) ) ( not ( = ?auto_253438 ?auto_253443 ) ) ( not ( = ?auto_253438 ?auto_253444 ) ) ( not ( = ?auto_253438 ?auto_253445 ) ) ( not ( = ?auto_253438 ?auto_253446 ) ) ( not ( = ?auto_253438 ?auto_253447 ) ) ( not ( = ?auto_253438 ?auto_253448 ) ) ( not ( = ?auto_253438 ?auto_253449 ) ) ( not ( = ?auto_253438 ?auto_253450 ) ) ( not ( = ?auto_253438 ?auto_253451 ) ) ( not ( = ?auto_253439 ?auto_253440 ) ) ( not ( = ?auto_253439 ?auto_253441 ) ) ( not ( = ?auto_253439 ?auto_253442 ) ) ( not ( = ?auto_253439 ?auto_253443 ) ) ( not ( = ?auto_253439 ?auto_253444 ) ) ( not ( = ?auto_253439 ?auto_253445 ) ) ( not ( = ?auto_253439 ?auto_253446 ) ) ( not ( = ?auto_253439 ?auto_253447 ) ) ( not ( = ?auto_253439 ?auto_253448 ) ) ( not ( = ?auto_253439 ?auto_253449 ) ) ( not ( = ?auto_253439 ?auto_253450 ) ) ( not ( = ?auto_253439 ?auto_253451 ) ) ( not ( = ?auto_253440 ?auto_253441 ) ) ( not ( = ?auto_253440 ?auto_253442 ) ) ( not ( = ?auto_253440 ?auto_253443 ) ) ( not ( = ?auto_253440 ?auto_253444 ) ) ( not ( = ?auto_253440 ?auto_253445 ) ) ( not ( = ?auto_253440 ?auto_253446 ) ) ( not ( = ?auto_253440 ?auto_253447 ) ) ( not ( = ?auto_253440 ?auto_253448 ) ) ( not ( = ?auto_253440 ?auto_253449 ) ) ( not ( = ?auto_253440 ?auto_253450 ) ) ( not ( = ?auto_253440 ?auto_253451 ) ) ( not ( = ?auto_253441 ?auto_253442 ) ) ( not ( = ?auto_253441 ?auto_253443 ) ) ( not ( = ?auto_253441 ?auto_253444 ) ) ( not ( = ?auto_253441 ?auto_253445 ) ) ( not ( = ?auto_253441 ?auto_253446 ) ) ( not ( = ?auto_253441 ?auto_253447 ) ) ( not ( = ?auto_253441 ?auto_253448 ) ) ( not ( = ?auto_253441 ?auto_253449 ) ) ( not ( = ?auto_253441 ?auto_253450 ) ) ( not ( = ?auto_253441 ?auto_253451 ) ) ( not ( = ?auto_253442 ?auto_253443 ) ) ( not ( = ?auto_253442 ?auto_253444 ) ) ( not ( = ?auto_253442 ?auto_253445 ) ) ( not ( = ?auto_253442 ?auto_253446 ) ) ( not ( = ?auto_253442 ?auto_253447 ) ) ( not ( = ?auto_253442 ?auto_253448 ) ) ( not ( = ?auto_253442 ?auto_253449 ) ) ( not ( = ?auto_253442 ?auto_253450 ) ) ( not ( = ?auto_253442 ?auto_253451 ) ) ( not ( = ?auto_253443 ?auto_253444 ) ) ( not ( = ?auto_253443 ?auto_253445 ) ) ( not ( = ?auto_253443 ?auto_253446 ) ) ( not ( = ?auto_253443 ?auto_253447 ) ) ( not ( = ?auto_253443 ?auto_253448 ) ) ( not ( = ?auto_253443 ?auto_253449 ) ) ( not ( = ?auto_253443 ?auto_253450 ) ) ( not ( = ?auto_253443 ?auto_253451 ) ) ( not ( = ?auto_253444 ?auto_253445 ) ) ( not ( = ?auto_253444 ?auto_253446 ) ) ( not ( = ?auto_253444 ?auto_253447 ) ) ( not ( = ?auto_253444 ?auto_253448 ) ) ( not ( = ?auto_253444 ?auto_253449 ) ) ( not ( = ?auto_253444 ?auto_253450 ) ) ( not ( = ?auto_253444 ?auto_253451 ) ) ( not ( = ?auto_253445 ?auto_253446 ) ) ( not ( = ?auto_253445 ?auto_253447 ) ) ( not ( = ?auto_253445 ?auto_253448 ) ) ( not ( = ?auto_253445 ?auto_253449 ) ) ( not ( = ?auto_253445 ?auto_253450 ) ) ( not ( = ?auto_253445 ?auto_253451 ) ) ( not ( = ?auto_253446 ?auto_253447 ) ) ( not ( = ?auto_253446 ?auto_253448 ) ) ( not ( = ?auto_253446 ?auto_253449 ) ) ( not ( = ?auto_253446 ?auto_253450 ) ) ( not ( = ?auto_253446 ?auto_253451 ) ) ( not ( = ?auto_253447 ?auto_253448 ) ) ( not ( = ?auto_253447 ?auto_253449 ) ) ( not ( = ?auto_253447 ?auto_253450 ) ) ( not ( = ?auto_253447 ?auto_253451 ) ) ( not ( = ?auto_253448 ?auto_253449 ) ) ( not ( = ?auto_253448 ?auto_253450 ) ) ( not ( = ?auto_253448 ?auto_253451 ) ) ( not ( = ?auto_253449 ?auto_253450 ) ) ( not ( = ?auto_253449 ?auto_253451 ) ) ( not ( = ?auto_253450 ?auto_253451 ) ) ( CLEAR ?auto_253448 ) ( ON ?auto_253449 ?auto_253450 ) ( CLEAR ?auto_253449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_253438 ?auto_253439 ?auto_253440 ?auto_253441 ?auto_253442 ?auto_253443 ?auto_253444 ?auto_253445 ?auto_253446 ?auto_253447 ?auto_253448 ?auto_253449 )
      ( MAKE-13PILE ?auto_253438 ?auto_253439 ?auto_253440 ?auto_253441 ?auto_253442 ?auto_253443 ?auto_253444 ?auto_253445 ?auto_253446 ?auto_253447 ?auto_253448 ?auto_253449 ?auto_253450 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253465 - BLOCK
      ?auto_253466 - BLOCK
      ?auto_253467 - BLOCK
      ?auto_253468 - BLOCK
      ?auto_253469 - BLOCK
      ?auto_253470 - BLOCK
      ?auto_253471 - BLOCK
      ?auto_253472 - BLOCK
      ?auto_253473 - BLOCK
      ?auto_253474 - BLOCK
      ?auto_253475 - BLOCK
      ?auto_253476 - BLOCK
      ?auto_253477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253477 ) ( ON-TABLE ?auto_253465 ) ( ON ?auto_253466 ?auto_253465 ) ( ON ?auto_253467 ?auto_253466 ) ( ON ?auto_253468 ?auto_253467 ) ( ON ?auto_253469 ?auto_253468 ) ( ON ?auto_253470 ?auto_253469 ) ( ON ?auto_253471 ?auto_253470 ) ( ON ?auto_253472 ?auto_253471 ) ( ON ?auto_253473 ?auto_253472 ) ( ON ?auto_253474 ?auto_253473 ) ( ON ?auto_253475 ?auto_253474 ) ( not ( = ?auto_253465 ?auto_253466 ) ) ( not ( = ?auto_253465 ?auto_253467 ) ) ( not ( = ?auto_253465 ?auto_253468 ) ) ( not ( = ?auto_253465 ?auto_253469 ) ) ( not ( = ?auto_253465 ?auto_253470 ) ) ( not ( = ?auto_253465 ?auto_253471 ) ) ( not ( = ?auto_253465 ?auto_253472 ) ) ( not ( = ?auto_253465 ?auto_253473 ) ) ( not ( = ?auto_253465 ?auto_253474 ) ) ( not ( = ?auto_253465 ?auto_253475 ) ) ( not ( = ?auto_253465 ?auto_253476 ) ) ( not ( = ?auto_253465 ?auto_253477 ) ) ( not ( = ?auto_253466 ?auto_253467 ) ) ( not ( = ?auto_253466 ?auto_253468 ) ) ( not ( = ?auto_253466 ?auto_253469 ) ) ( not ( = ?auto_253466 ?auto_253470 ) ) ( not ( = ?auto_253466 ?auto_253471 ) ) ( not ( = ?auto_253466 ?auto_253472 ) ) ( not ( = ?auto_253466 ?auto_253473 ) ) ( not ( = ?auto_253466 ?auto_253474 ) ) ( not ( = ?auto_253466 ?auto_253475 ) ) ( not ( = ?auto_253466 ?auto_253476 ) ) ( not ( = ?auto_253466 ?auto_253477 ) ) ( not ( = ?auto_253467 ?auto_253468 ) ) ( not ( = ?auto_253467 ?auto_253469 ) ) ( not ( = ?auto_253467 ?auto_253470 ) ) ( not ( = ?auto_253467 ?auto_253471 ) ) ( not ( = ?auto_253467 ?auto_253472 ) ) ( not ( = ?auto_253467 ?auto_253473 ) ) ( not ( = ?auto_253467 ?auto_253474 ) ) ( not ( = ?auto_253467 ?auto_253475 ) ) ( not ( = ?auto_253467 ?auto_253476 ) ) ( not ( = ?auto_253467 ?auto_253477 ) ) ( not ( = ?auto_253468 ?auto_253469 ) ) ( not ( = ?auto_253468 ?auto_253470 ) ) ( not ( = ?auto_253468 ?auto_253471 ) ) ( not ( = ?auto_253468 ?auto_253472 ) ) ( not ( = ?auto_253468 ?auto_253473 ) ) ( not ( = ?auto_253468 ?auto_253474 ) ) ( not ( = ?auto_253468 ?auto_253475 ) ) ( not ( = ?auto_253468 ?auto_253476 ) ) ( not ( = ?auto_253468 ?auto_253477 ) ) ( not ( = ?auto_253469 ?auto_253470 ) ) ( not ( = ?auto_253469 ?auto_253471 ) ) ( not ( = ?auto_253469 ?auto_253472 ) ) ( not ( = ?auto_253469 ?auto_253473 ) ) ( not ( = ?auto_253469 ?auto_253474 ) ) ( not ( = ?auto_253469 ?auto_253475 ) ) ( not ( = ?auto_253469 ?auto_253476 ) ) ( not ( = ?auto_253469 ?auto_253477 ) ) ( not ( = ?auto_253470 ?auto_253471 ) ) ( not ( = ?auto_253470 ?auto_253472 ) ) ( not ( = ?auto_253470 ?auto_253473 ) ) ( not ( = ?auto_253470 ?auto_253474 ) ) ( not ( = ?auto_253470 ?auto_253475 ) ) ( not ( = ?auto_253470 ?auto_253476 ) ) ( not ( = ?auto_253470 ?auto_253477 ) ) ( not ( = ?auto_253471 ?auto_253472 ) ) ( not ( = ?auto_253471 ?auto_253473 ) ) ( not ( = ?auto_253471 ?auto_253474 ) ) ( not ( = ?auto_253471 ?auto_253475 ) ) ( not ( = ?auto_253471 ?auto_253476 ) ) ( not ( = ?auto_253471 ?auto_253477 ) ) ( not ( = ?auto_253472 ?auto_253473 ) ) ( not ( = ?auto_253472 ?auto_253474 ) ) ( not ( = ?auto_253472 ?auto_253475 ) ) ( not ( = ?auto_253472 ?auto_253476 ) ) ( not ( = ?auto_253472 ?auto_253477 ) ) ( not ( = ?auto_253473 ?auto_253474 ) ) ( not ( = ?auto_253473 ?auto_253475 ) ) ( not ( = ?auto_253473 ?auto_253476 ) ) ( not ( = ?auto_253473 ?auto_253477 ) ) ( not ( = ?auto_253474 ?auto_253475 ) ) ( not ( = ?auto_253474 ?auto_253476 ) ) ( not ( = ?auto_253474 ?auto_253477 ) ) ( not ( = ?auto_253475 ?auto_253476 ) ) ( not ( = ?auto_253475 ?auto_253477 ) ) ( not ( = ?auto_253476 ?auto_253477 ) ) ( CLEAR ?auto_253475 ) ( ON ?auto_253476 ?auto_253477 ) ( CLEAR ?auto_253476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_253465 ?auto_253466 ?auto_253467 ?auto_253468 ?auto_253469 ?auto_253470 ?auto_253471 ?auto_253472 ?auto_253473 ?auto_253474 ?auto_253475 ?auto_253476 )
      ( MAKE-13PILE ?auto_253465 ?auto_253466 ?auto_253467 ?auto_253468 ?auto_253469 ?auto_253470 ?auto_253471 ?auto_253472 ?auto_253473 ?auto_253474 ?auto_253475 ?auto_253476 ?auto_253477 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253491 - BLOCK
      ?auto_253492 - BLOCK
      ?auto_253493 - BLOCK
      ?auto_253494 - BLOCK
      ?auto_253495 - BLOCK
      ?auto_253496 - BLOCK
      ?auto_253497 - BLOCK
      ?auto_253498 - BLOCK
      ?auto_253499 - BLOCK
      ?auto_253500 - BLOCK
      ?auto_253501 - BLOCK
      ?auto_253502 - BLOCK
      ?auto_253503 - BLOCK
    )
    :vars
    (
      ?auto_253504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253503 ?auto_253504 ) ( ON-TABLE ?auto_253491 ) ( ON ?auto_253492 ?auto_253491 ) ( ON ?auto_253493 ?auto_253492 ) ( ON ?auto_253494 ?auto_253493 ) ( ON ?auto_253495 ?auto_253494 ) ( ON ?auto_253496 ?auto_253495 ) ( ON ?auto_253497 ?auto_253496 ) ( ON ?auto_253498 ?auto_253497 ) ( ON ?auto_253499 ?auto_253498 ) ( ON ?auto_253500 ?auto_253499 ) ( not ( = ?auto_253491 ?auto_253492 ) ) ( not ( = ?auto_253491 ?auto_253493 ) ) ( not ( = ?auto_253491 ?auto_253494 ) ) ( not ( = ?auto_253491 ?auto_253495 ) ) ( not ( = ?auto_253491 ?auto_253496 ) ) ( not ( = ?auto_253491 ?auto_253497 ) ) ( not ( = ?auto_253491 ?auto_253498 ) ) ( not ( = ?auto_253491 ?auto_253499 ) ) ( not ( = ?auto_253491 ?auto_253500 ) ) ( not ( = ?auto_253491 ?auto_253501 ) ) ( not ( = ?auto_253491 ?auto_253502 ) ) ( not ( = ?auto_253491 ?auto_253503 ) ) ( not ( = ?auto_253491 ?auto_253504 ) ) ( not ( = ?auto_253492 ?auto_253493 ) ) ( not ( = ?auto_253492 ?auto_253494 ) ) ( not ( = ?auto_253492 ?auto_253495 ) ) ( not ( = ?auto_253492 ?auto_253496 ) ) ( not ( = ?auto_253492 ?auto_253497 ) ) ( not ( = ?auto_253492 ?auto_253498 ) ) ( not ( = ?auto_253492 ?auto_253499 ) ) ( not ( = ?auto_253492 ?auto_253500 ) ) ( not ( = ?auto_253492 ?auto_253501 ) ) ( not ( = ?auto_253492 ?auto_253502 ) ) ( not ( = ?auto_253492 ?auto_253503 ) ) ( not ( = ?auto_253492 ?auto_253504 ) ) ( not ( = ?auto_253493 ?auto_253494 ) ) ( not ( = ?auto_253493 ?auto_253495 ) ) ( not ( = ?auto_253493 ?auto_253496 ) ) ( not ( = ?auto_253493 ?auto_253497 ) ) ( not ( = ?auto_253493 ?auto_253498 ) ) ( not ( = ?auto_253493 ?auto_253499 ) ) ( not ( = ?auto_253493 ?auto_253500 ) ) ( not ( = ?auto_253493 ?auto_253501 ) ) ( not ( = ?auto_253493 ?auto_253502 ) ) ( not ( = ?auto_253493 ?auto_253503 ) ) ( not ( = ?auto_253493 ?auto_253504 ) ) ( not ( = ?auto_253494 ?auto_253495 ) ) ( not ( = ?auto_253494 ?auto_253496 ) ) ( not ( = ?auto_253494 ?auto_253497 ) ) ( not ( = ?auto_253494 ?auto_253498 ) ) ( not ( = ?auto_253494 ?auto_253499 ) ) ( not ( = ?auto_253494 ?auto_253500 ) ) ( not ( = ?auto_253494 ?auto_253501 ) ) ( not ( = ?auto_253494 ?auto_253502 ) ) ( not ( = ?auto_253494 ?auto_253503 ) ) ( not ( = ?auto_253494 ?auto_253504 ) ) ( not ( = ?auto_253495 ?auto_253496 ) ) ( not ( = ?auto_253495 ?auto_253497 ) ) ( not ( = ?auto_253495 ?auto_253498 ) ) ( not ( = ?auto_253495 ?auto_253499 ) ) ( not ( = ?auto_253495 ?auto_253500 ) ) ( not ( = ?auto_253495 ?auto_253501 ) ) ( not ( = ?auto_253495 ?auto_253502 ) ) ( not ( = ?auto_253495 ?auto_253503 ) ) ( not ( = ?auto_253495 ?auto_253504 ) ) ( not ( = ?auto_253496 ?auto_253497 ) ) ( not ( = ?auto_253496 ?auto_253498 ) ) ( not ( = ?auto_253496 ?auto_253499 ) ) ( not ( = ?auto_253496 ?auto_253500 ) ) ( not ( = ?auto_253496 ?auto_253501 ) ) ( not ( = ?auto_253496 ?auto_253502 ) ) ( not ( = ?auto_253496 ?auto_253503 ) ) ( not ( = ?auto_253496 ?auto_253504 ) ) ( not ( = ?auto_253497 ?auto_253498 ) ) ( not ( = ?auto_253497 ?auto_253499 ) ) ( not ( = ?auto_253497 ?auto_253500 ) ) ( not ( = ?auto_253497 ?auto_253501 ) ) ( not ( = ?auto_253497 ?auto_253502 ) ) ( not ( = ?auto_253497 ?auto_253503 ) ) ( not ( = ?auto_253497 ?auto_253504 ) ) ( not ( = ?auto_253498 ?auto_253499 ) ) ( not ( = ?auto_253498 ?auto_253500 ) ) ( not ( = ?auto_253498 ?auto_253501 ) ) ( not ( = ?auto_253498 ?auto_253502 ) ) ( not ( = ?auto_253498 ?auto_253503 ) ) ( not ( = ?auto_253498 ?auto_253504 ) ) ( not ( = ?auto_253499 ?auto_253500 ) ) ( not ( = ?auto_253499 ?auto_253501 ) ) ( not ( = ?auto_253499 ?auto_253502 ) ) ( not ( = ?auto_253499 ?auto_253503 ) ) ( not ( = ?auto_253499 ?auto_253504 ) ) ( not ( = ?auto_253500 ?auto_253501 ) ) ( not ( = ?auto_253500 ?auto_253502 ) ) ( not ( = ?auto_253500 ?auto_253503 ) ) ( not ( = ?auto_253500 ?auto_253504 ) ) ( not ( = ?auto_253501 ?auto_253502 ) ) ( not ( = ?auto_253501 ?auto_253503 ) ) ( not ( = ?auto_253501 ?auto_253504 ) ) ( not ( = ?auto_253502 ?auto_253503 ) ) ( not ( = ?auto_253502 ?auto_253504 ) ) ( not ( = ?auto_253503 ?auto_253504 ) ) ( ON ?auto_253502 ?auto_253503 ) ( CLEAR ?auto_253500 ) ( ON ?auto_253501 ?auto_253502 ) ( CLEAR ?auto_253501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_253491 ?auto_253492 ?auto_253493 ?auto_253494 ?auto_253495 ?auto_253496 ?auto_253497 ?auto_253498 ?auto_253499 ?auto_253500 ?auto_253501 )
      ( MAKE-13PILE ?auto_253491 ?auto_253492 ?auto_253493 ?auto_253494 ?auto_253495 ?auto_253496 ?auto_253497 ?auto_253498 ?auto_253499 ?auto_253500 ?auto_253501 ?auto_253502 ?auto_253503 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253518 - BLOCK
      ?auto_253519 - BLOCK
      ?auto_253520 - BLOCK
      ?auto_253521 - BLOCK
      ?auto_253522 - BLOCK
      ?auto_253523 - BLOCK
      ?auto_253524 - BLOCK
      ?auto_253525 - BLOCK
      ?auto_253526 - BLOCK
      ?auto_253527 - BLOCK
      ?auto_253528 - BLOCK
      ?auto_253529 - BLOCK
      ?auto_253530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253530 ) ( ON-TABLE ?auto_253518 ) ( ON ?auto_253519 ?auto_253518 ) ( ON ?auto_253520 ?auto_253519 ) ( ON ?auto_253521 ?auto_253520 ) ( ON ?auto_253522 ?auto_253521 ) ( ON ?auto_253523 ?auto_253522 ) ( ON ?auto_253524 ?auto_253523 ) ( ON ?auto_253525 ?auto_253524 ) ( ON ?auto_253526 ?auto_253525 ) ( ON ?auto_253527 ?auto_253526 ) ( not ( = ?auto_253518 ?auto_253519 ) ) ( not ( = ?auto_253518 ?auto_253520 ) ) ( not ( = ?auto_253518 ?auto_253521 ) ) ( not ( = ?auto_253518 ?auto_253522 ) ) ( not ( = ?auto_253518 ?auto_253523 ) ) ( not ( = ?auto_253518 ?auto_253524 ) ) ( not ( = ?auto_253518 ?auto_253525 ) ) ( not ( = ?auto_253518 ?auto_253526 ) ) ( not ( = ?auto_253518 ?auto_253527 ) ) ( not ( = ?auto_253518 ?auto_253528 ) ) ( not ( = ?auto_253518 ?auto_253529 ) ) ( not ( = ?auto_253518 ?auto_253530 ) ) ( not ( = ?auto_253519 ?auto_253520 ) ) ( not ( = ?auto_253519 ?auto_253521 ) ) ( not ( = ?auto_253519 ?auto_253522 ) ) ( not ( = ?auto_253519 ?auto_253523 ) ) ( not ( = ?auto_253519 ?auto_253524 ) ) ( not ( = ?auto_253519 ?auto_253525 ) ) ( not ( = ?auto_253519 ?auto_253526 ) ) ( not ( = ?auto_253519 ?auto_253527 ) ) ( not ( = ?auto_253519 ?auto_253528 ) ) ( not ( = ?auto_253519 ?auto_253529 ) ) ( not ( = ?auto_253519 ?auto_253530 ) ) ( not ( = ?auto_253520 ?auto_253521 ) ) ( not ( = ?auto_253520 ?auto_253522 ) ) ( not ( = ?auto_253520 ?auto_253523 ) ) ( not ( = ?auto_253520 ?auto_253524 ) ) ( not ( = ?auto_253520 ?auto_253525 ) ) ( not ( = ?auto_253520 ?auto_253526 ) ) ( not ( = ?auto_253520 ?auto_253527 ) ) ( not ( = ?auto_253520 ?auto_253528 ) ) ( not ( = ?auto_253520 ?auto_253529 ) ) ( not ( = ?auto_253520 ?auto_253530 ) ) ( not ( = ?auto_253521 ?auto_253522 ) ) ( not ( = ?auto_253521 ?auto_253523 ) ) ( not ( = ?auto_253521 ?auto_253524 ) ) ( not ( = ?auto_253521 ?auto_253525 ) ) ( not ( = ?auto_253521 ?auto_253526 ) ) ( not ( = ?auto_253521 ?auto_253527 ) ) ( not ( = ?auto_253521 ?auto_253528 ) ) ( not ( = ?auto_253521 ?auto_253529 ) ) ( not ( = ?auto_253521 ?auto_253530 ) ) ( not ( = ?auto_253522 ?auto_253523 ) ) ( not ( = ?auto_253522 ?auto_253524 ) ) ( not ( = ?auto_253522 ?auto_253525 ) ) ( not ( = ?auto_253522 ?auto_253526 ) ) ( not ( = ?auto_253522 ?auto_253527 ) ) ( not ( = ?auto_253522 ?auto_253528 ) ) ( not ( = ?auto_253522 ?auto_253529 ) ) ( not ( = ?auto_253522 ?auto_253530 ) ) ( not ( = ?auto_253523 ?auto_253524 ) ) ( not ( = ?auto_253523 ?auto_253525 ) ) ( not ( = ?auto_253523 ?auto_253526 ) ) ( not ( = ?auto_253523 ?auto_253527 ) ) ( not ( = ?auto_253523 ?auto_253528 ) ) ( not ( = ?auto_253523 ?auto_253529 ) ) ( not ( = ?auto_253523 ?auto_253530 ) ) ( not ( = ?auto_253524 ?auto_253525 ) ) ( not ( = ?auto_253524 ?auto_253526 ) ) ( not ( = ?auto_253524 ?auto_253527 ) ) ( not ( = ?auto_253524 ?auto_253528 ) ) ( not ( = ?auto_253524 ?auto_253529 ) ) ( not ( = ?auto_253524 ?auto_253530 ) ) ( not ( = ?auto_253525 ?auto_253526 ) ) ( not ( = ?auto_253525 ?auto_253527 ) ) ( not ( = ?auto_253525 ?auto_253528 ) ) ( not ( = ?auto_253525 ?auto_253529 ) ) ( not ( = ?auto_253525 ?auto_253530 ) ) ( not ( = ?auto_253526 ?auto_253527 ) ) ( not ( = ?auto_253526 ?auto_253528 ) ) ( not ( = ?auto_253526 ?auto_253529 ) ) ( not ( = ?auto_253526 ?auto_253530 ) ) ( not ( = ?auto_253527 ?auto_253528 ) ) ( not ( = ?auto_253527 ?auto_253529 ) ) ( not ( = ?auto_253527 ?auto_253530 ) ) ( not ( = ?auto_253528 ?auto_253529 ) ) ( not ( = ?auto_253528 ?auto_253530 ) ) ( not ( = ?auto_253529 ?auto_253530 ) ) ( ON ?auto_253529 ?auto_253530 ) ( CLEAR ?auto_253527 ) ( ON ?auto_253528 ?auto_253529 ) ( CLEAR ?auto_253528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_253518 ?auto_253519 ?auto_253520 ?auto_253521 ?auto_253522 ?auto_253523 ?auto_253524 ?auto_253525 ?auto_253526 ?auto_253527 ?auto_253528 )
      ( MAKE-13PILE ?auto_253518 ?auto_253519 ?auto_253520 ?auto_253521 ?auto_253522 ?auto_253523 ?auto_253524 ?auto_253525 ?auto_253526 ?auto_253527 ?auto_253528 ?auto_253529 ?auto_253530 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253544 - BLOCK
      ?auto_253545 - BLOCK
      ?auto_253546 - BLOCK
      ?auto_253547 - BLOCK
      ?auto_253548 - BLOCK
      ?auto_253549 - BLOCK
      ?auto_253550 - BLOCK
      ?auto_253551 - BLOCK
      ?auto_253552 - BLOCK
      ?auto_253553 - BLOCK
      ?auto_253554 - BLOCK
      ?auto_253555 - BLOCK
      ?auto_253556 - BLOCK
    )
    :vars
    (
      ?auto_253557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253556 ?auto_253557 ) ( ON-TABLE ?auto_253544 ) ( ON ?auto_253545 ?auto_253544 ) ( ON ?auto_253546 ?auto_253545 ) ( ON ?auto_253547 ?auto_253546 ) ( ON ?auto_253548 ?auto_253547 ) ( ON ?auto_253549 ?auto_253548 ) ( ON ?auto_253550 ?auto_253549 ) ( ON ?auto_253551 ?auto_253550 ) ( ON ?auto_253552 ?auto_253551 ) ( not ( = ?auto_253544 ?auto_253545 ) ) ( not ( = ?auto_253544 ?auto_253546 ) ) ( not ( = ?auto_253544 ?auto_253547 ) ) ( not ( = ?auto_253544 ?auto_253548 ) ) ( not ( = ?auto_253544 ?auto_253549 ) ) ( not ( = ?auto_253544 ?auto_253550 ) ) ( not ( = ?auto_253544 ?auto_253551 ) ) ( not ( = ?auto_253544 ?auto_253552 ) ) ( not ( = ?auto_253544 ?auto_253553 ) ) ( not ( = ?auto_253544 ?auto_253554 ) ) ( not ( = ?auto_253544 ?auto_253555 ) ) ( not ( = ?auto_253544 ?auto_253556 ) ) ( not ( = ?auto_253544 ?auto_253557 ) ) ( not ( = ?auto_253545 ?auto_253546 ) ) ( not ( = ?auto_253545 ?auto_253547 ) ) ( not ( = ?auto_253545 ?auto_253548 ) ) ( not ( = ?auto_253545 ?auto_253549 ) ) ( not ( = ?auto_253545 ?auto_253550 ) ) ( not ( = ?auto_253545 ?auto_253551 ) ) ( not ( = ?auto_253545 ?auto_253552 ) ) ( not ( = ?auto_253545 ?auto_253553 ) ) ( not ( = ?auto_253545 ?auto_253554 ) ) ( not ( = ?auto_253545 ?auto_253555 ) ) ( not ( = ?auto_253545 ?auto_253556 ) ) ( not ( = ?auto_253545 ?auto_253557 ) ) ( not ( = ?auto_253546 ?auto_253547 ) ) ( not ( = ?auto_253546 ?auto_253548 ) ) ( not ( = ?auto_253546 ?auto_253549 ) ) ( not ( = ?auto_253546 ?auto_253550 ) ) ( not ( = ?auto_253546 ?auto_253551 ) ) ( not ( = ?auto_253546 ?auto_253552 ) ) ( not ( = ?auto_253546 ?auto_253553 ) ) ( not ( = ?auto_253546 ?auto_253554 ) ) ( not ( = ?auto_253546 ?auto_253555 ) ) ( not ( = ?auto_253546 ?auto_253556 ) ) ( not ( = ?auto_253546 ?auto_253557 ) ) ( not ( = ?auto_253547 ?auto_253548 ) ) ( not ( = ?auto_253547 ?auto_253549 ) ) ( not ( = ?auto_253547 ?auto_253550 ) ) ( not ( = ?auto_253547 ?auto_253551 ) ) ( not ( = ?auto_253547 ?auto_253552 ) ) ( not ( = ?auto_253547 ?auto_253553 ) ) ( not ( = ?auto_253547 ?auto_253554 ) ) ( not ( = ?auto_253547 ?auto_253555 ) ) ( not ( = ?auto_253547 ?auto_253556 ) ) ( not ( = ?auto_253547 ?auto_253557 ) ) ( not ( = ?auto_253548 ?auto_253549 ) ) ( not ( = ?auto_253548 ?auto_253550 ) ) ( not ( = ?auto_253548 ?auto_253551 ) ) ( not ( = ?auto_253548 ?auto_253552 ) ) ( not ( = ?auto_253548 ?auto_253553 ) ) ( not ( = ?auto_253548 ?auto_253554 ) ) ( not ( = ?auto_253548 ?auto_253555 ) ) ( not ( = ?auto_253548 ?auto_253556 ) ) ( not ( = ?auto_253548 ?auto_253557 ) ) ( not ( = ?auto_253549 ?auto_253550 ) ) ( not ( = ?auto_253549 ?auto_253551 ) ) ( not ( = ?auto_253549 ?auto_253552 ) ) ( not ( = ?auto_253549 ?auto_253553 ) ) ( not ( = ?auto_253549 ?auto_253554 ) ) ( not ( = ?auto_253549 ?auto_253555 ) ) ( not ( = ?auto_253549 ?auto_253556 ) ) ( not ( = ?auto_253549 ?auto_253557 ) ) ( not ( = ?auto_253550 ?auto_253551 ) ) ( not ( = ?auto_253550 ?auto_253552 ) ) ( not ( = ?auto_253550 ?auto_253553 ) ) ( not ( = ?auto_253550 ?auto_253554 ) ) ( not ( = ?auto_253550 ?auto_253555 ) ) ( not ( = ?auto_253550 ?auto_253556 ) ) ( not ( = ?auto_253550 ?auto_253557 ) ) ( not ( = ?auto_253551 ?auto_253552 ) ) ( not ( = ?auto_253551 ?auto_253553 ) ) ( not ( = ?auto_253551 ?auto_253554 ) ) ( not ( = ?auto_253551 ?auto_253555 ) ) ( not ( = ?auto_253551 ?auto_253556 ) ) ( not ( = ?auto_253551 ?auto_253557 ) ) ( not ( = ?auto_253552 ?auto_253553 ) ) ( not ( = ?auto_253552 ?auto_253554 ) ) ( not ( = ?auto_253552 ?auto_253555 ) ) ( not ( = ?auto_253552 ?auto_253556 ) ) ( not ( = ?auto_253552 ?auto_253557 ) ) ( not ( = ?auto_253553 ?auto_253554 ) ) ( not ( = ?auto_253553 ?auto_253555 ) ) ( not ( = ?auto_253553 ?auto_253556 ) ) ( not ( = ?auto_253553 ?auto_253557 ) ) ( not ( = ?auto_253554 ?auto_253555 ) ) ( not ( = ?auto_253554 ?auto_253556 ) ) ( not ( = ?auto_253554 ?auto_253557 ) ) ( not ( = ?auto_253555 ?auto_253556 ) ) ( not ( = ?auto_253555 ?auto_253557 ) ) ( not ( = ?auto_253556 ?auto_253557 ) ) ( ON ?auto_253555 ?auto_253556 ) ( ON ?auto_253554 ?auto_253555 ) ( CLEAR ?auto_253552 ) ( ON ?auto_253553 ?auto_253554 ) ( CLEAR ?auto_253553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_253544 ?auto_253545 ?auto_253546 ?auto_253547 ?auto_253548 ?auto_253549 ?auto_253550 ?auto_253551 ?auto_253552 ?auto_253553 )
      ( MAKE-13PILE ?auto_253544 ?auto_253545 ?auto_253546 ?auto_253547 ?auto_253548 ?auto_253549 ?auto_253550 ?auto_253551 ?auto_253552 ?auto_253553 ?auto_253554 ?auto_253555 ?auto_253556 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253571 - BLOCK
      ?auto_253572 - BLOCK
      ?auto_253573 - BLOCK
      ?auto_253574 - BLOCK
      ?auto_253575 - BLOCK
      ?auto_253576 - BLOCK
      ?auto_253577 - BLOCK
      ?auto_253578 - BLOCK
      ?auto_253579 - BLOCK
      ?auto_253580 - BLOCK
      ?auto_253581 - BLOCK
      ?auto_253582 - BLOCK
      ?auto_253583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253583 ) ( ON-TABLE ?auto_253571 ) ( ON ?auto_253572 ?auto_253571 ) ( ON ?auto_253573 ?auto_253572 ) ( ON ?auto_253574 ?auto_253573 ) ( ON ?auto_253575 ?auto_253574 ) ( ON ?auto_253576 ?auto_253575 ) ( ON ?auto_253577 ?auto_253576 ) ( ON ?auto_253578 ?auto_253577 ) ( ON ?auto_253579 ?auto_253578 ) ( not ( = ?auto_253571 ?auto_253572 ) ) ( not ( = ?auto_253571 ?auto_253573 ) ) ( not ( = ?auto_253571 ?auto_253574 ) ) ( not ( = ?auto_253571 ?auto_253575 ) ) ( not ( = ?auto_253571 ?auto_253576 ) ) ( not ( = ?auto_253571 ?auto_253577 ) ) ( not ( = ?auto_253571 ?auto_253578 ) ) ( not ( = ?auto_253571 ?auto_253579 ) ) ( not ( = ?auto_253571 ?auto_253580 ) ) ( not ( = ?auto_253571 ?auto_253581 ) ) ( not ( = ?auto_253571 ?auto_253582 ) ) ( not ( = ?auto_253571 ?auto_253583 ) ) ( not ( = ?auto_253572 ?auto_253573 ) ) ( not ( = ?auto_253572 ?auto_253574 ) ) ( not ( = ?auto_253572 ?auto_253575 ) ) ( not ( = ?auto_253572 ?auto_253576 ) ) ( not ( = ?auto_253572 ?auto_253577 ) ) ( not ( = ?auto_253572 ?auto_253578 ) ) ( not ( = ?auto_253572 ?auto_253579 ) ) ( not ( = ?auto_253572 ?auto_253580 ) ) ( not ( = ?auto_253572 ?auto_253581 ) ) ( not ( = ?auto_253572 ?auto_253582 ) ) ( not ( = ?auto_253572 ?auto_253583 ) ) ( not ( = ?auto_253573 ?auto_253574 ) ) ( not ( = ?auto_253573 ?auto_253575 ) ) ( not ( = ?auto_253573 ?auto_253576 ) ) ( not ( = ?auto_253573 ?auto_253577 ) ) ( not ( = ?auto_253573 ?auto_253578 ) ) ( not ( = ?auto_253573 ?auto_253579 ) ) ( not ( = ?auto_253573 ?auto_253580 ) ) ( not ( = ?auto_253573 ?auto_253581 ) ) ( not ( = ?auto_253573 ?auto_253582 ) ) ( not ( = ?auto_253573 ?auto_253583 ) ) ( not ( = ?auto_253574 ?auto_253575 ) ) ( not ( = ?auto_253574 ?auto_253576 ) ) ( not ( = ?auto_253574 ?auto_253577 ) ) ( not ( = ?auto_253574 ?auto_253578 ) ) ( not ( = ?auto_253574 ?auto_253579 ) ) ( not ( = ?auto_253574 ?auto_253580 ) ) ( not ( = ?auto_253574 ?auto_253581 ) ) ( not ( = ?auto_253574 ?auto_253582 ) ) ( not ( = ?auto_253574 ?auto_253583 ) ) ( not ( = ?auto_253575 ?auto_253576 ) ) ( not ( = ?auto_253575 ?auto_253577 ) ) ( not ( = ?auto_253575 ?auto_253578 ) ) ( not ( = ?auto_253575 ?auto_253579 ) ) ( not ( = ?auto_253575 ?auto_253580 ) ) ( not ( = ?auto_253575 ?auto_253581 ) ) ( not ( = ?auto_253575 ?auto_253582 ) ) ( not ( = ?auto_253575 ?auto_253583 ) ) ( not ( = ?auto_253576 ?auto_253577 ) ) ( not ( = ?auto_253576 ?auto_253578 ) ) ( not ( = ?auto_253576 ?auto_253579 ) ) ( not ( = ?auto_253576 ?auto_253580 ) ) ( not ( = ?auto_253576 ?auto_253581 ) ) ( not ( = ?auto_253576 ?auto_253582 ) ) ( not ( = ?auto_253576 ?auto_253583 ) ) ( not ( = ?auto_253577 ?auto_253578 ) ) ( not ( = ?auto_253577 ?auto_253579 ) ) ( not ( = ?auto_253577 ?auto_253580 ) ) ( not ( = ?auto_253577 ?auto_253581 ) ) ( not ( = ?auto_253577 ?auto_253582 ) ) ( not ( = ?auto_253577 ?auto_253583 ) ) ( not ( = ?auto_253578 ?auto_253579 ) ) ( not ( = ?auto_253578 ?auto_253580 ) ) ( not ( = ?auto_253578 ?auto_253581 ) ) ( not ( = ?auto_253578 ?auto_253582 ) ) ( not ( = ?auto_253578 ?auto_253583 ) ) ( not ( = ?auto_253579 ?auto_253580 ) ) ( not ( = ?auto_253579 ?auto_253581 ) ) ( not ( = ?auto_253579 ?auto_253582 ) ) ( not ( = ?auto_253579 ?auto_253583 ) ) ( not ( = ?auto_253580 ?auto_253581 ) ) ( not ( = ?auto_253580 ?auto_253582 ) ) ( not ( = ?auto_253580 ?auto_253583 ) ) ( not ( = ?auto_253581 ?auto_253582 ) ) ( not ( = ?auto_253581 ?auto_253583 ) ) ( not ( = ?auto_253582 ?auto_253583 ) ) ( ON ?auto_253582 ?auto_253583 ) ( ON ?auto_253581 ?auto_253582 ) ( CLEAR ?auto_253579 ) ( ON ?auto_253580 ?auto_253581 ) ( CLEAR ?auto_253580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_253571 ?auto_253572 ?auto_253573 ?auto_253574 ?auto_253575 ?auto_253576 ?auto_253577 ?auto_253578 ?auto_253579 ?auto_253580 )
      ( MAKE-13PILE ?auto_253571 ?auto_253572 ?auto_253573 ?auto_253574 ?auto_253575 ?auto_253576 ?auto_253577 ?auto_253578 ?auto_253579 ?auto_253580 ?auto_253581 ?auto_253582 ?auto_253583 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253597 - BLOCK
      ?auto_253598 - BLOCK
      ?auto_253599 - BLOCK
      ?auto_253600 - BLOCK
      ?auto_253601 - BLOCK
      ?auto_253602 - BLOCK
      ?auto_253603 - BLOCK
      ?auto_253604 - BLOCK
      ?auto_253605 - BLOCK
      ?auto_253606 - BLOCK
      ?auto_253607 - BLOCK
      ?auto_253608 - BLOCK
      ?auto_253609 - BLOCK
    )
    :vars
    (
      ?auto_253610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253609 ?auto_253610 ) ( ON-TABLE ?auto_253597 ) ( ON ?auto_253598 ?auto_253597 ) ( ON ?auto_253599 ?auto_253598 ) ( ON ?auto_253600 ?auto_253599 ) ( ON ?auto_253601 ?auto_253600 ) ( ON ?auto_253602 ?auto_253601 ) ( ON ?auto_253603 ?auto_253602 ) ( ON ?auto_253604 ?auto_253603 ) ( not ( = ?auto_253597 ?auto_253598 ) ) ( not ( = ?auto_253597 ?auto_253599 ) ) ( not ( = ?auto_253597 ?auto_253600 ) ) ( not ( = ?auto_253597 ?auto_253601 ) ) ( not ( = ?auto_253597 ?auto_253602 ) ) ( not ( = ?auto_253597 ?auto_253603 ) ) ( not ( = ?auto_253597 ?auto_253604 ) ) ( not ( = ?auto_253597 ?auto_253605 ) ) ( not ( = ?auto_253597 ?auto_253606 ) ) ( not ( = ?auto_253597 ?auto_253607 ) ) ( not ( = ?auto_253597 ?auto_253608 ) ) ( not ( = ?auto_253597 ?auto_253609 ) ) ( not ( = ?auto_253597 ?auto_253610 ) ) ( not ( = ?auto_253598 ?auto_253599 ) ) ( not ( = ?auto_253598 ?auto_253600 ) ) ( not ( = ?auto_253598 ?auto_253601 ) ) ( not ( = ?auto_253598 ?auto_253602 ) ) ( not ( = ?auto_253598 ?auto_253603 ) ) ( not ( = ?auto_253598 ?auto_253604 ) ) ( not ( = ?auto_253598 ?auto_253605 ) ) ( not ( = ?auto_253598 ?auto_253606 ) ) ( not ( = ?auto_253598 ?auto_253607 ) ) ( not ( = ?auto_253598 ?auto_253608 ) ) ( not ( = ?auto_253598 ?auto_253609 ) ) ( not ( = ?auto_253598 ?auto_253610 ) ) ( not ( = ?auto_253599 ?auto_253600 ) ) ( not ( = ?auto_253599 ?auto_253601 ) ) ( not ( = ?auto_253599 ?auto_253602 ) ) ( not ( = ?auto_253599 ?auto_253603 ) ) ( not ( = ?auto_253599 ?auto_253604 ) ) ( not ( = ?auto_253599 ?auto_253605 ) ) ( not ( = ?auto_253599 ?auto_253606 ) ) ( not ( = ?auto_253599 ?auto_253607 ) ) ( not ( = ?auto_253599 ?auto_253608 ) ) ( not ( = ?auto_253599 ?auto_253609 ) ) ( not ( = ?auto_253599 ?auto_253610 ) ) ( not ( = ?auto_253600 ?auto_253601 ) ) ( not ( = ?auto_253600 ?auto_253602 ) ) ( not ( = ?auto_253600 ?auto_253603 ) ) ( not ( = ?auto_253600 ?auto_253604 ) ) ( not ( = ?auto_253600 ?auto_253605 ) ) ( not ( = ?auto_253600 ?auto_253606 ) ) ( not ( = ?auto_253600 ?auto_253607 ) ) ( not ( = ?auto_253600 ?auto_253608 ) ) ( not ( = ?auto_253600 ?auto_253609 ) ) ( not ( = ?auto_253600 ?auto_253610 ) ) ( not ( = ?auto_253601 ?auto_253602 ) ) ( not ( = ?auto_253601 ?auto_253603 ) ) ( not ( = ?auto_253601 ?auto_253604 ) ) ( not ( = ?auto_253601 ?auto_253605 ) ) ( not ( = ?auto_253601 ?auto_253606 ) ) ( not ( = ?auto_253601 ?auto_253607 ) ) ( not ( = ?auto_253601 ?auto_253608 ) ) ( not ( = ?auto_253601 ?auto_253609 ) ) ( not ( = ?auto_253601 ?auto_253610 ) ) ( not ( = ?auto_253602 ?auto_253603 ) ) ( not ( = ?auto_253602 ?auto_253604 ) ) ( not ( = ?auto_253602 ?auto_253605 ) ) ( not ( = ?auto_253602 ?auto_253606 ) ) ( not ( = ?auto_253602 ?auto_253607 ) ) ( not ( = ?auto_253602 ?auto_253608 ) ) ( not ( = ?auto_253602 ?auto_253609 ) ) ( not ( = ?auto_253602 ?auto_253610 ) ) ( not ( = ?auto_253603 ?auto_253604 ) ) ( not ( = ?auto_253603 ?auto_253605 ) ) ( not ( = ?auto_253603 ?auto_253606 ) ) ( not ( = ?auto_253603 ?auto_253607 ) ) ( not ( = ?auto_253603 ?auto_253608 ) ) ( not ( = ?auto_253603 ?auto_253609 ) ) ( not ( = ?auto_253603 ?auto_253610 ) ) ( not ( = ?auto_253604 ?auto_253605 ) ) ( not ( = ?auto_253604 ?auto_253606 ) ) ( not ( = ?auto_253604 ?auto_253607 ) ) ( not ( = ?auto_253604 ?auto_253608 ) ) ( not ( = ?auto_253604 ?auto_253609 ) ) ( not ( = ?auto_253604 ?auto_253610 ) ) ( not ( = ?auto_253605 ?auto_253606 ) ) ( not ( = ?auto_253605 ?auto_253607 ) ) ( not ( = ?auto_253605 ?auto_253608 ) ) ( not ( = ?auto_253605 ?auto_253609 ) ) ( not ( = ?auto_253605 ?auto_253610 ) ) ( not ( = ?auto_253606 ?auto_253607 ) ) ( not ( = ?auto_253606 ?auto_253608 ) ) ( not ( = ?auto_253606 ?auto_253609 ) ) ( not ( = ?auto_253606 ?auto_253610 ) ) ( not ( = ?auto_253607 ?auto_253608 ) ) ( not ( = ?auto_253607 ?auto_253609 ) ) ( not ( = ?auto_253607 ?auto_253610 ) ) ( not ( = ?auto_253608 ?auto_253609 ) ) ( not ( = ?auto_253608 ?auto_253610 ) ) ( not ( = ?auto_253609 ?auto_253610 ) ) ( ON ?auto_253608 ?auto_253609 ) ( ON ?auto_253607 ?auto_253608 ) ( ON ?auto_253606 ?auto_253607 ) ( CLEAR ?auto_253604 ) ( ON ?auto_253605 ?auto_253606 ) ( CLEAR ?auto_253605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_253597 ?auto_253598 ?auto_253599 ?auto_253600 ?auto_253601 ?auto_253602 ?auto_253603 ?auto_253604 ?auto_253605 )
      ( MAKE-13PILE ?auto_253597 ?auto_253598 ?auto_253599 ?auto_253600 ?auto_253601 ?auto_253602 ?auto_253603 ?auto_253604 ?auto_253605 ?auto_253606 ?auto_253607 ?auto_253608 ?auto_253609 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253624 - BLOCK
      ?auto_253625 - BLOCK
      ?auto_253626 - BLOCK
      ?auto_253627 - BLOCK
      ?auto_253628 - BLOCK
      ?auto_253629 - BLOCK
      ?auto_253630 - BLOCK
      ?auto_253631 - BLOCK
      ?auto_253632 - BLOCK
      ?auto_253633 - BLOCK
      ?auto_253634 - BLOCK
      ?auto_253635 - BLOCK
      ?auto_253636 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253636 ) ( ON-TABLE ?auto_253624 ) ( ON ?auto_253625 ?auto_253624 ) ( ON ?auto_253626 ?auto_253625 ) ( ON ?auto_253627 ?auto_253626 ) ( ON ?auto_253628 ?auto_253627 ) ( ON ?auto_253629 ?auto_253628 ) ( ON ?auto_253630 ?auto_253629 ) ( ON ?auto_253631 ?auto_253630 ) ( not ( = ?auto_253624 ?auto_253625 ) ) ( not ( = ?auto_253624 ?auto_253626 ) ) ( not ( = ?auto_253624 ?auto_253627 ) ) ( not ( = ?auto_253624 ?auto_253628 ) ) ( not ( = ?auto_253624 ?auto_253629 ) ) ( not ( = ?auto_253624 ?auto_253630 ) ) ( not ( = ?auto_253624 ?auto_253631 ) ) ( not ( = ?auto_253624 ?auto_253632 ) ) ( not ( = ?auto_253624 ?auto_253633 ) ) ( not ( = ?auto_253624 ?auto_253634 ) ) ( not ( = ?auto_253624 ?auto_253635 ) ) ( not ( = ?auto_253624 ?auto_253636 ) ) ( not ( = ?auto_253625 ?auto_253626 ) ) ( not ( = ?auto_253625 ?auto_253627 ) ) ( not ( = ?auto_253625 ?auto_253628 ) ) ( not ( = ?auto_253625 ?auto_253629 ) ) ( not ( = ?auto_253625 ?auto_253630 ) ) ( not ( = ?auto_253625 ?auto_253631 ) ) ( not ( = ?auto_253625 ?auto_253632 ) ) ( not ( = ?auto_253625 ?auto_253633 ) ) ( not ( = ?auto_253625 ?auto_253634 ) ) ( not ( = ?auto_253625 ?auto_253635 ) ) ( not ( = ?auto_253625 ?auto_253636 ) ) ( not ( = ?auto_253626 ?auto_253627 ) ) ( not ( = ?auto_253626 ?auto_253628 ) ) ( not ( = ?auto_253626 ?auto_253629 ) ) ( not ( = ?auto_253626 ?auto_253630 ) ) ( not ( = ?auto_253626 ?auto_253631 ) ) ( not ( = ?auto_253626 ?auto_253632 ) ) ( not ( = ?auto_253626 ?auto_253633 ) ) ( not ( = ?auto_253626 ?auto_253634 ) ) ( not ( = ?auto_253626 ?auto_253635 ) ) ( not ( = ?auto_253626 ?auto_253636 ) ) ( not ( = ?auto_253627 ?auto_253628 ) ) ( not ( = ?auto_253627 ?auto_253629 ) ) ( not ( = ?auto_253627 ?auto_253630 ) ) ( not ( = ?auto_253627 ?auto_253631 ) ) ( not ( = ?auto_253627 ?auto_253632 ) ) ( not ( = ?auto_253627 ?auto_253633 ) ) ( not ( = ?auto_253627 ?auto_253634 ) ) ( not ( = ?auto_253627 ?auto_253635 ) ) ( not ( = ?auto_253627 ?auto_253636 ) ) ( not ( = ?auto_253628 ?auto_253629 ) ) ( not ( = ?auto_253628 ?auto_253630 ) ) ( not ( = ?auto_253628 ?auto_253631 ) ) ( not ( = ?auto_253628 ?auto_253632 ) ) ( not ( = ?auto_253628 ?auto_253633 ) ) ( not ( = ?auto_253628 ?auto_253634 ) ) ( not ( = ?auto_253628 ?auto_253635 ) ) ( not ( = ?auto_253628 ?auto_253636 ) ) ( not ( = ?auto_253629 ?auto_253630 ) ) ( not ( = ?auto_253629 ?auto_253631 ) ) ( not ( = ?auto_253629 ?auto_253632 ) ) ( not ( = ?auto_253629 ?auto_253633 ) ) ( not ( = ?auto_253629 ?auto_253634 ) ) ( not ( = ?auto_253629 ?auto_253635 ) ) ( not ( = ?auto_253629 ?auto_253636 ) ) ( not ( = ?auto_253630 ?auto_253631 ) ) ( not ( = ?auto_253630 ?auto_253632 ) ) ( not ( = ?auto_253630 ?auto_253633 ) ) ( not ( = ?auto_253630 ?auto_253634 ) ) ( not ( = ?auto_253630 ?auto_253635 ) ) ( not ( = ?auto_253630 ?auto_253636 ) ) ( not ( = ?auto_253631 ?auto_253632 ) ) ( not ( = ?auto_253631 ?auto_253633 ) ) ( not ( = ?auto_253631 ?auto_253634 ) ) ( not ( = ?auto_253631 ?auto_253635 ) ) ( not ( = ?auto_253631 ?auto_253636 ) ) ( not ( = ?auto_253632 ?auto_253633 ) ) ( not ( = ?auto_253632 ?auto_253634 ) ) ( not ( = ?auto_253632 ?auto_253635 ) ) ( not ( = ?auto_253632 ?auto_253636 ) ) ( not ( = ?auto_253633 ?auto_253634 ) ) ( not ( = ?auto_253633 ?auto_253635 ) ) ( not ( = ?auto_253633 ?auto_253636 ) ) ( not ( = ?auto_253634 ?auto_253635 ) ) ( not ( = ?auto_253634 ?auto_253636 ) ) ( not ( = ?auto_253635 ?auto_253636 ) ) ( ON ?auto_253635 ?auto_253636 ) ( ON ?auto_253634 ?auto_253635 ) ( ON ?auto_253633 ?auto_253634 ) ( CLEAR ?auto_253631 ) ( ON ?auto_253632 ?auto_253633 ) ( CLEAR ?auto_253632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_253624 ?auto_253625 ?auto_253626 ?auto_253627 ?auto_253628 ?auto_253629 ?auto_253630 ?auto_253631 ?auto_253632 )
      ( MAKE-13PILE ?auto_253624 ?auto_253625 ?auto_253626 ?auto_253627 ?auto_253628 ?auto_253629 ?auto_253630 ?auto_253631 ?auto_253632 ?auto_253633 ?auto_253634 ?auto_253635 ?auto_253636 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253650 - BLOCK
      ?auto_253651 - BLOCK
      ?auto_253652 - BLOCK
      ?auto_253653 - BLOCK
      ?auto_253654 - BLOCK
      ?auto_253655 - BLOCK
      ?auto_253656 - BLOCK
      ?auto_253657 - BLOCK
      ?auto_253658 - BLOCK
      ?auto_253659 - BLOCK
      ?auto_253660 - BLOCK
      ?auto_253661 - BLOCK
      ?auto_253662 - BLOCK
    )
    :vars
    (
      ?auto_253663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253662 ?auto_253663 ) ( ON-TABLE ?auto_253650 ) ( ON ?auto_253651 ?auto_253650 ) ( ON ?auto_253652 ?auto_253651 ) ( ON ?auto_253653 ?auto_253652 ) ( ON ?auto_253654 ?auto_253653 ) ( ON ?auto_253655 ?auto_253654 ) ( ON ?auto_253656 ?auto_253655 ) ( not ( = ?auto_253650 ?auto_253651 ) ) ( not ( = ?auto_253650 ?auto_253652 ) ) ( not ( = ?auto_253650 ?auto_253653 ) ) ( not ( = ?auto_253650 ?auto_253654 ) ) ( not ( = ?auto_253650 ?auto_253655 ) ) ( not ( = ?auto_253650 ?auto_253656 ) ) ( not ( = ?auto_253650 ?auto_253657 ) ) ( not ( = ?auto_253650 ?auto_253658 ) ) ( not ( = ?auto_253650 ?auto_253659 ) ) ( not ( = ?auto_253650 ?auto_253660 ) ) ( not ( = ?auto_253650 ?auto_253661 ) ) ( not ( = ?auto_253650 ?auto_253662 ) ) ( not ( = ?auto_253650 ?auto_253663 ) ) ( not ( = ?auto_253651 ?auto_253652 ) ) ( not ( = ?auto_253651 ?auto_253653 ) ) ( not ( = ?auto_253651 ?auto_253654 ) ) ( not ( = ?auto_253651 ?auto_253655 ) ) ( not ( = ?auto_253651 ?auto_253656 ) ) ( not ( = ?auto_253651 ?auto_253657 ) ) ( not ( = ?auto_253651 ?auto_253658 ) ) ( not ( = ?auto_253651 ?auto_253659 ) ) ( not ( = ?auto_253651 ?auto_253660 ) ) ( not ( = ?auto_253651 ?auto_253661 ) ) ( not ( = ?auto_253651 ?auto_253662 ) ) ( not ( = ?auto_253651 ?auto_253663 ) ) ( not ( = ?auto_253652 ?auto_253653 ) ) ( not ( = ?auto_253652 ?auto_253654 ) ) ( not ( = ?auto_253652 ?auto_253655 ) ) ( not ( = ?auto_253652 ?auto_253656 ) ) ( not ( = ?auto_253652 ?auto_253657 ) ) ( not ( = ?auto_253652 ?auto_253658 ) ) ( not ( = ?auto_253652 ?auto_253659 ) ) ( not ( = ?auto_253652 ?auto_253660 ) ) ( not ( = ?auto_253652 ?auto_253661 ) ) ( not ( = ?auto_253652 ?auto_253662 ) ) ( not ( = ?auto_253652 ?auto_253663 ) ) ( not ( = ?auto_253653 ?auto_253654 ) ) ( not ( = ?auto_253653 ?auto_253655 ) ) ( not ( = ?auto_253653 ?auto_253656 ) ) ( not ( = ?auto_253653 ?auto_253657 ) ) ( not ( = ?auto_253653 ?auto_253658 ) ) ( not ( = ?auto_253653 ?auto_253659 ) ) ( not ( = ?auto_253653 ?auto_253660 ) ) ( not ( = ?auto_253653 ?auto_253661 ) ) ( not ( = ?auto_253653 ?auto_253662 ) ) ( not ( = ?auto_253653 ?auto_253663 ) ) ( not ( = ?auto_253654 ?auto_253655 ) ) ( not ( = ?auto_253654 ?auto_253656 ) ) ( not ( = ?auto_253654 ?auto_253657 ) ) ( not ( = ?auto_253654 ?auto_253658 ) ) ( not ( = ?auto_253654 ?auto_253659 ) ) ( not ( = ?auto_253654 ?auto_253660 ) ) ( not ( = ?auto_253654 ?auto_253661 ) ) ( not ( = ?auto_253654 ?auto_253662 ) ) ( not ( = ?auto_253654 ?auto_253663 ) ) ( not ( = ?auto_253655 ?auto_253656 ) ) ( not ( = ?auto_253655 ?auto_253657 ) ) ( not ( = ?auto_253655 ?auto_253658 ) ) ( not ( = ?auto_253655 ?auto_253659 ) ) ( not ( = ?auto_253655 ?auto_253660 ) ) ( not ( = ?auto_253655 ?auto_253661 ) ) ( not ( = ?auto_253655 ?auto_253662 ) ) ( not ( = ?auto_253655 ?auto_253663 ) ) ( not ( = ?auto_253656 ?auto_253657 ) ) ( not ( = ?auto_253656 ?auto_253658 ) ) ( not ( = ?auto_253656 ?auto_253659 ) ) ( not ( = ?auto_253656 ?auto_253660 ) ) ( not ( = ?auto_253656 ?auto_253661 ) ) ( not ( = ?auto_253656 ?auto_253662 ) ) ( not ( = ?auto_253656 ?auto_253663 ) ) ( not ( = ?auto_253657 ?auto_253658 ) ) ( not ( = ?auto_253657 ?auto_253659 ) ) ( not ( = ?auto_253657 ?auto_253660 ) ) ( not ( = ?auto_253657 ?auto_253661 ) ) ( not ( = ?auto_253657 ?auto_253662 ) ) ( not ( = ?auto_253657 ?auto_253663 ) ) ( not ( = ?auto_253658 ?auto_253659 ) ) ( not ( = ?auto_253658 ?auto_253660 ) ) ( not ( = ?auto_253658 ?auto_253661 ) ) ( not ( = ?auto_253658 ?auto_253662 ) ) ( not ( = ?auto_253658 ?auto_253663 ) ) ( not ( = ?auto_253659 ?auto_253660 ) ) ( not ( = ?auto_253659 ?auto_253661 ) ) ( not ( = ?auto_253659 ?auto_253662 ) ) ( not ( = ?auto_253659 ?auto_253663 ) ) ( not ( = ?auto_253660 ?auto_253661 ) ) ( not ( = ?auto_253660 ?auto_253662 ) ) ( not ( = ?auto_253660 ?auto_253663 ) ) ( not ( = ?auto_253661 ?auto_253662 ) ) ( not ( = ?auto_253661 ?auto_253663 ) ) ( not ( = ?auto_253662 ?auto_253663 ) ) ( ON ?auto_253661 ?auto_253662 ) ( ON ?auto_253660 ?auto_253661 ) ( ON ?auto_253659 ?auto_253660 ) ( ON ?auto_253658 ?auto_253659 ) ( CLEAR ?auto_253656 ) ( ON ?auto_253657 ?auto_253658 ) ( CLEAR ?auto_253657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_253650 ?auto_253651 ?auto_253652 ?auto_253653 ?auto_253654 ?auto_253655 ?auto_253656 ?auto_253657 )
      ( MAKE-13PILE ?auto_253650 ?auto_253651 ?auto_253652 ?auto_253653 ?auto_253654 ?auto_253655 ?auto_253656 ?auto_253657 ?auto_253658 ?auto_253659 ?auto_253660 ?auto_253661 ?auto_253662 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253677 - BLOCK
      ?auto_253678 - BLOCK
      ?auto_253679 - BLOCK
      ?auto_253680 - BLOCK
      ?auto_253681 - BLOCK
      ?auto_253682 - BLOCK
      ?auto_253683 - BLOCK
      ?auto_253684 - BLOCK
      ?auto_253685 - BLOCK
      ?auto_253686 - BLOCK
      ?auto_253687 - BLOCK
      ?auto_253688 - BLOCK
      ?auto_253689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253689 ) ( ON-TABLE ?auto_253677 ) ( ON ?auto_253678 ?auto_253677 ) ( ON ?auto_253679 ?auto_253678 ) ( ON ?auto_253680 ?auto_253679 ) ( ON ?auto_253681 ?auto_253680 ) ( ON ?auto_253682 ?auto_253681 ) ( ON ?auto_253683 ?auto_253682 ) ( not ( = ?auto_253677 ?auto_253678 ) ) ( not ( = ?auto_253677 ?auto_253679 ) ) ( not ( = ?auto_253677 ?auto_253680 ) ) ( not ( = ?auto_253677 ?auto_253681 ) ) ( not ( = ?auto_253677 ?auto_253682 ) ) ( not ( = ?auto_253677 ?auto_253683 ) ) ( not ( = ?auto_253677 ?auto_253684 ) ) ( not ( = ?auto_253677 ?auto_253685 ) ) ( not ( = ?auto_253677 ?auto_253686 ) ) ( not ( = ?auto_253677 ?auto_253687 ) ) ( not ( = ?auto_253677 ?auto_253688 ) ) ( not ( = ?auto_253677 ?auto_253689 ) ) ( not ( = ?auto_253678 ?auto_253679 ) ) ( not ( = ?auto_253678 ?auto_253680 ) ) ( not ( = ?auto_253678 ?auto_253681 ) ) ( not ( = ?auto_253678 ?auto_253682 ) ) ( not ( = ?auto_253678 ?auto_253683 ) ) ( not ( = ?auto_253678 ?auto_253684 ) ) ( not ( = ?auto_253678 ?auto_253685 ) ) ( not ( = ?auto_253678 ?auto_253686 ) ) ( not ( = ?auto_253678 ?auto_253687 ) ) ( not ( = ?auto_253678 ?auto_253688 ) ) ( not ( = ?auto_253678 ?auto_253689 ) ) ( not ( = ?auto_253679 ?auto_253680 ) ) ( not ( = ?auto_253679 ?auto_253681 ) ) ( not ( = ?auto_253679 ?auto_253682 ) ) ( not ( = ?auto_253679 ?auto_253683 ) ) ( not ( = ?auto_253679 ?auto_253684 ) ) ( not ( = ?auto_253679 ?auto_253685 ) ) ( not ( = ?auto_253679 ?auto_253686 ) ) ( not ( = ?auto_253679 ?auto_253687 ) ) ( not ( = ?auto_253679 ?auto_253688 ) ) ( not ( = ?auto_253679 ?auto_253689 ) ) ( not ( = ?auto_253680 ?auto_253681 ) ) ( not ( = ?auto_253680 ?auto_253682 ) ) ( not ( = ?auto_253680 ?auto_253683 ) ) ( not ( = ?auto_253680 ?auto_253684 ) ) ( not ( = ?auto_253680 ?auto_253685 ) ) ( not ( = ?auto_253680 ?auto_253686 ) ) ( not ( = ?auto_253680 ?auto_253687 ) ) ( not ( = ?auto_253680 ?auto_253688 ) ) ( not ( = ?auto_253680 ?auto_253689 ) ) ( not ( = ?auto_253681 ?auto_253682 ) ) ( not ( = ?auto_253681 ?auto_253683 ) ) ( not ( = ?auto_253681 ?auto_253684 ) ) ( not ( = ?auto_253681 ?auto_253685 ) ) ( not ( = ?auto_253681 ?auto_253686 ) ) ( not ( = ?auto_253681 ?auto_253687 ) ) ( not ( = ?auto_253681 ?auto_253688 ) ) ( not ( = ?auto_253681 ?auto_253689 ) ) ( not ( = ?auto_253682 ?auto_253683 ) ) ( not ( = ?auto_253682 ?auto_253684 ) ) ( not ( = ?auto_253682 ?auto_253685 ) ) ( not ( = ?auto_253682 ?auto_253686 ) ) ( not ( = ?auto_253682 ?auto_253687 ) ) ( not ( = ?auto_253682 ?auto_253688 ) ) ( not ( = ?auto_253682 ?auto_253689 ) ) ( not ( = ?auto_253683 ?auto_253684 ) ) ( not ( = ?auto_253683 ?auto_253685 ) ) ( not ( = ?auto_253683 ?auto_253686 ) ) ( not ( = ?auto_253683 ?auto_253687 ) ) ( not ( = ?auto_253683 ?auto_253688 ) ) ( not ( = ?auto_253683 ?auto_253689 ) ) ( not ( = ?auto_253684 ?auto_253685 ) ) ( not ( = ?auto_253684 ?auto_253686 ) ) ( not ( = ?auto_253684 ?auto_253687 ) ) ( not ( = ?auto_253684 ?auto_253688 ) ) ( not ( = ?auto_253684 ?auto_253689 ) ) ( not ( = ?auto_253685 ?auto_253686 ) ) ( not ( = ?auto_253685 ?auto_253687 ) ) ( not ( = ?auto_253685 ?auto_253688 ) ) ( not ( = ?auto_253685 ?auto_253689 ) ) ( not ( = ?auto_253686 ?auto_253687 ) ) ( not ( = ?auto_253686 ?auto_253688 ) ) ( not ( = ?auto_253686 ?auto_253689 ) ) ( not ( = ?auto_253687 ?auto_253688 ) ) ( not ( = ?auto_253687 ?auto_253689 ) ) ( not ( = ?auto_253688 ?auto_253689 ) ) ( ON ?auto_253688 ?auto_253689 ) ( ON ?auto_253687 ?auto_253688 ) ( ON ?auto_253686 ?auto_253687 ) ( ON ?auto_253685 ?auto_253686 ) ( CLEAR ?auto_253683 ) ( ON ?auto_253684 ?auto_253685 ) ( CLEAR ?auto_253684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_253677 ?auto_253678 ?auto_253679 ?auto_253680 ?auto_253681 ?auto_253682 ?auto_253683 ?auto_253684 )
      ( MAKE-13PILE ?auto_253677 ?auto_253678 ?auto_253679 ?auto_253680 ?auto_253681 ?auto_253682 ?auto_253683 ?auto_253684 ?auto_253685 ?auto_253686 ?auto_253687 ?auto_253688 ?auto_253689 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253703 - BLOCK
      ?auto_253704 - BLOCK
      ?auto_253705 - BLOCK
      ?auto_253706 - BLOCK
      ?auto_253707 - BLOCK
      ?auto_253708 - BLOCK
      ?auto_253709 - BLOCK
      ?auto_253710 - BLOCK
      ?auto_253711 - BLOCK
      ?auto_253712 - BLOCK
      ?auto_253713 - BLOCK
      ?auto_253714 - BLOCK
      ?auto_253715 - BLOCK
    )
    :vars
    (
      ?auto_253716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253715 ?auto_253716 ) ( ON-TABLE ?auto_253703 ) ( ON ?auto_253704 ?auto_253703 ) ( ON ?auto_253705 ?auto_253704 ) ( ON ?auto_253706 ?auto_253705 ) ( ON ?auto_253707 ?auto_253706 ) ( ON ?auto_253708 ?auto_253707 ) ( not ( = ?auto_253703 ?auto_253704 ) ) ( not ( = ?auto_253703 ?auto_253705 ) ) ( not ( = ?auto_253703 ?auto_253706 ) ) ( not ( = ?auto_253703 ?auto_253707 ) ) ( not ( = ?auto_253703 ?auto_253708 ) ) ( not ( = ?auto_253703 ?auto_253709 ) ) ( not ( = ?auto_253703 ?auto_253710 ) ) ( not ( = ?auto_253703 ?auto_253711 ) ) ( not ( = ?auto_253703 ?auto_253712 ) ) ( not ( = ?auto_253703 ?auto_253713 ) ) ( not ( = ?auto_253703 ?auto_253714 ) ) ( not ( = ?auto_253703 ?auto_253715 ) ) ( not ( = ?auto_253703 ?auto_253716 ) ) ( not ( = ?auto_253704 ?auto_253705 ) ) ( not ( = ?auto_253704 ?auto_253706 ) ) ( not ( = ?auto_253704 ?auto_253707 ) ) ( not ( = ?auto_253704 ?auto_253708 ) ) ( not ( = ?auto_253704 ?auto_253709 ) ) ( not ( = ?auto_253704 ?auto_253710 ) ) ( not ( = ?auto_253704 ?auto_253711 ) ) ( not ( = ?auto_253704 ?auto_253712 ) ) ( not ( = ?auto_253704 ?auto_253713 ) ) ( not ( = ?auto_253704 ?auto_253714 ) ) ( not ( = ?auto_253704 ?auto_253715 ) ) ( not ( = ?auto_253704 ?auto_253716 ) ) ( not ( = ?auto_253705 ?auto_253706 ) ) ( not ( = ?auto_253705 ?auto_253707 ) ) ( not ( = ?auto_253705 ?auto_253708 ) ) ( not ( = ?auto_253705 ?auto_253709 ) ) ( not ( = ?auto_253705 ?auto_253710 ) ) ( not ( = ?auto_253705 ?auto_253711 ) ) ( not ( = ?auto_253705 ?auto_253712 ) ) ( not ( = ?auto_253705 ?auto_253713 ) ) ( not ( = ?auto_253705 ?auto_253714 ) ) ( not ( = ?auto_253705 ?auto_253715 ) ) ( not ( = ?auto_253705 ?auto_253716 ) ) ( not ( = ?auto_253706 ?auto_253707 ) ) ( not ( = ?auto_253706 ?auto_253708 ) ) ( not ( = ?auto_253706 ?auto_253709 ) ) ( not ( = ?auto_253706 ?auto_253710 ) ) ( not ( = ?auto_253706 ?auto_253711 ) ) ( not ( = ?auto_253706 ?auto_253712 ) ) ( not ( = ?auto_253706 ?auto_253713 ) ) ( not ( = ?auto_253706 ?auto_253714 ) ) ( not ( = ?auto_253706 ?auto_253715 ) ) ( not ( = ?auto_253706 ?auto_253716 ) ) ( not ( = ?auto_253707 ?auto_253708 ) ) ( not ( = ?auto_253707 ?auto_253709 ) ) ( not ( = ?auto_253707 ?auto_253710 ) ) ( not ( = ?auto_253707 ?auto_253711 ) ) ( not ( = ?auto_253707 ?auto_253712 ) ) ( not ( = ?auto_253707 ?auto_253713 ) ) ( not ( = ?auto_253707 ?auto_253714 ) ) ( not ( = ?auto_253707 ?auto_253715 ) ) ( not ( = ?auto_253707 ?auto_253716 ) ) ( not ( = ?auto_253708 ?auto_253709 ) ) ( not ( = ?auto_253708 ?auto_253710 ) ) ( not ( = ?auto_253708 ?auto_253711 ) ) ( not ( = ?auto_253708 ?auto_253712 ) ) ( not ( = ?auto_253708 ?auto_253713 ) ) ( not ( = ?auto_253708 ?auto_253714 ) ) ( not ( = ?auto_253708 ?auto_253715 ) ) ( not ( = ?auto_253708 ?auto_253716 ) ) ( not ( = ?auto_253709 ?auto_253710 ) ) ( not ( = ?auto_253709 ?auto_253711 ) ) ( not ( = ?auto_253709 ?auto_253712 ) ) ( not ( = ?auto_253709 ?auto_253713 ) ) ( not ( = ?auto_253709 ?auto_253714 ) ) ( not ( = ?auto_253709 ?auto_253715 ) ) ( not ( = ?auto_253709 ?auto_253716 ) ) ( not ( = ?auto_253710 ?auto_253711 ) ) ( not ( = ?auto_253710 ?auto_253712 ) ) ( not ( = ?auto_253710 ?auto_253713 ) ) ( not ( = ?auto_253710 ?auto_253714 ) ) ( not ( = ?auto_253710 ?auto_253715 ) ) ( not ( = ?auto_253710 ?auto_253716 ) ) ( not ( = ?auto_253711 ?auto_253712 ) ) ( not ( = ?auto_253711 ?auto_253713 ) ) ( not ( = ?auto_253711 ?auto_253714 ) ) ( not ( = ?auto_253711 ?auto_253715 ) ) ( not ( = ?auto_253711 ?auto_253716 ) ) ( not ( = ?auto_253712 ?auto_253713 ) ) ( not ( = ?auto_253712 ?auto_253714 ) ) ( not ( = ?auto_253712 ?auto_253715 ) ) ( not ( = ?auto_253712 ?auto_253716 ) ) ( not ( = ?auto_253713 ?auto_253714 ) ) ( not ( = ?auto_253713 ?auto_253715 ) ) ( not ( = ?auto_253713 ?auto_253716 ) ) ( not ( = ?auto_253714 ?auto_253715 ) ) ( not ( = ?auto_253714 ?auto_253716 ) ) ( not ( = ?auto_253715 ?auto_253716 ) ) ( ON ?auto_253714 ?auto_253715 ) ( ON ?auto_253713 ?auto_253714 ) ( ON ?auto_253712 ?auto_253713 ) ( ON ?auto_253711 ?auto_253712 ) ( ON ?auto_253710 ?auto_253711 ) ( CLEAR ?auto_253708 ) ( ON ?auto_253709 ?auto_253710 ) ( CLEAR ?auto_253709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_253703 ?auto_253704 ?auto_253705 ?auto_253706 ?auto_253707 ?auto_253708 ?auto_253709 )
      ( MAKE-13PILE ?auto_253703 ?auto_253704 ?auto_253705 ?auto_253706 ?auto_253707 ?auto_253708 ?auto_253709 ?auto_253710 ?auto_253711 ?auto_253712 ?auto_253713 ?auto_253714 ?auto_253715 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253730 - BLOCK
      ?auto_253731 - BLOCK
      ?auto_253732 - BLOCK
      ?auto_253733 - BLOCK
      ?auto_253734 - BLOCK
      ?auto_253735 - BLOCK
      ?auto_253736 - BLOCK
      ?auto_253737 - BLOCK
      ?auto_253738 - BLOCK
      ?auto_253739 - BLOCK
      ?auto_253740 - BLOCK
      ?auto_253741 - BLOCK
      ?auto_253742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253742 ) ( ON-TABLE ?auto_253730 ) ( ON ?auto_253731 ?auto_253730 ) ( ON ?auto_253732 ?auto_253731 ) ( ON ?auto_253733 ?auto_253732 ) ( ON ?auto_253734 ?auto_253733 ) ( ON ?auto_253735 ?auto_253734 ) ( not ( = ?auto_253730 ?auto_253731 ) ) ( not ( = ?auto_253730 ?auto_253732 ) ) ( not ( = ?auto_253730 ?auto_253733 ) ) ( not ( = ?auto_253730 ?auto_253734 ) ) ( not ( = ?auto_253730 ?auto_253735 ) ) ( not ( = ?auto_253730 ?auto_253736 ) ) ( not ( = ?auto_253730 ?auto_253737 ) ) ( not ( = ?auto_253730 ?auto_253738 ) ) ( not ( = ?auto_253730 ?auto_253739 ) ) ( not ( = ?auto_253730 ?auto_253740 ) ) ( not ( = ?auto_253730 ?auto_253741 ) ) ( not ( = ?auto_253730 ?auto_253742 ) ) ( not ( = ?auto_253731 ?auto_253732 ) ) ( not ( = ?auto_253731 ?auto_253733 ) ) ( not ( = ?auto_253731 ?auto_253734 ) ) ( not ( = ?auto_253731 ?auto_253735 ) ) ( not ( = ?auto_253731 ?auto_253736 ) ) ( not ( = ?auto_253731 ?auto_253737 ) ) ( not ( = ?auto_253731 ?auto_253738 ) ) ( not ( = ?auto_253731 ?auto_253739 ) ) ( not ( = ?auto_253731 ?auto_253740 ) ) ( not ( = ?auto_253731 ?auto_253741 ) ) ( not ( = ?auto_253731 ?auto_253742 ) ) ( not ( = ?auto_253732 ?auto_253733 ) ) ( not ( = ?auto_253732 ?auto_253734 ) ) ( not ( = ?auto_253732 ?auto_253735 ) ) ( not ( = ?auto_253732 ?auto_253736 ) ) ( not ( = ?auto_253732 ?auto_253737 ) ) ( not ( = ?auto_253732 ?auto_253738 ) ) ( not ( = ?auto_253732 ?auto_253739 ) ) ( not ( = ?auto_253732 ?auto_253740 ) ) ( not ( = ?auto_253732 ?auto_253741 ) ) ( not ( = ?auto_253732 ?auto_253742 ) ) ( not ( = ?auto_253733 ?auto_253734 ) ) ( not ( = ?auto_253733 ?auto_253735 ) ) ( not ( = ?auto_253733 ?auto_253736 ) ) ( not ( = ?auto_253733 ?auto_253737 ) ) ( not ( = ?auto_253733 ?auto_253738 ) ) ( not ( = ?auto_253733 ?auto_253739 ) ) ( not ( = ?auto_253733 ?auto_253740 ) ) ( not ( = ?auto_253733 ?auto_253741 ) ) ( not ( = ?auto_253733 ?auto_253742 ) ) ( not ( = ?auto_253734 ?auto_253735 ) ) ( not ( = ?auto_253734 ?auto_253736 ) ) ( not ( = ?auto_253734 ?auto_253737 ) ) ( not ( = ?auto_253734 ?auto_253738 ) ) ( not ( = ?auto_253734 ?auto_253739 ) ) ( not ( = ?auto_253734 ?auto_253740 ) ) ( not ( = ?auto_253734 ?auto_253741 ) ) ( not ( = ?auto_253734 ?auto_253742 ) ) ( not ( = ?auto_253735 ?auto_253736 ) ) ( not ( = ?auto_253735 ?auto_253737 ) ) ( not ( = ?auto_253735 ?auto_253738 ) ) ( not ( = ?auto_253735 ?auto_253739 ) ) ( not ( = ?auto_253735 ?auto_253740 ) ) ( not ( = ?auto_253735 ?auto_253741 ) ) ( not ( = ?auto_253735 ?auto_253742 ) ) ( not ( = ?auto_253736 ?auto_253737 ) ) ( not ( = ?auto_253736 ?auto_253738 ) ) ( not ( = ?auto_253736 ?auto_253739 ) ) ( not ( = ?auto_253736 ?auto_253740 ) ) ( not ( = ?auto_253736 ?auto_253741 ) ) ( not ( = ?auto_253736 ?auto_253742 ) ) ( not ( = ?auto_253737 ?auto_253738 ) ) ( not ( = ?auto_253737 ?auto_253739 ) ) ( not ( = ?auto_253737 ?auto_253740 ) ) ( not ( = ?auto_253737 ?auto_253741 ) ) ( not ( = ?auto_253737 ?auto_253742 ) ) ( not ( = ?auto_253738 ?auto_253739 ) ) ( not ( = ?auto_253738 ?auto_253740 ) ) ( not ( = ?auto_253738 ?auto_253741 ) ) ( not ( = ?auto_253738 ?auto_253742 ) ) ( not ( = ?auto_253739 ?auto_253740 ) ) ( not ( = ?auto_253739 ?auto_253741 ) ) ( not ( = ?auto_253739 ?auto_253742 ) ) ( not ( = ?auto_253740 ?auto_253741 ) ) ( not ( = ?auto_253740 ?auto_253742 ) ) ( not ( = ?auto_253741 ?auto_253742 ) ) ( ON ?auto_253741 ?auto_253742 ) ( ON ?auto_253740 ?auto_253741 ) ( ON ?auto_253739 ?auto_253740 ) ( ON ?auto_253738 ?auto_253739 ) ( ON ?auto_253737 ?auto_253738 ) ( CLEAR ?auto_253735 ) ( ON ?auto_253736 ?auto_253737 ) ( CLEAR ?auto_253736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_253730 ?auto_253731 ?auto_253732 ?auto_253733 ?auto_253734 ?auto_253735 ?auto_253736 )
      ( MAKE-13PILE ?auto_253730 ?auto_253731 ?auto_253732 ?auto_253733 ?auto_253734 ?auto_253735 ?auto_253736 ?auto_253737 ?auto_253738 ?auto_253739 ?auto_253740 ?auto_253741 ?auto_253742 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253756 - BLOCK
      ?auto_253757 - BLOCK
      ?auto_253758 - BLOCK
      ?auto_253759 - BLOCK
      ?auto_253760 - BLOCK
      ?auto_253761 - BLOCK
      ?auto_253762 - BLOCK
      ?auto_253763 - BLOCK
      ?auto_253764 - BLOCK
      ?auto_253765 - BLOCK
      ?auto_253766 - BLOCK
      ?auto_253767 - BLOCK
      ?auto_253768 - BLOCK
    )
    :vars
    (
      ?auto_253769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253768 ?auto_253769 ) ( ON-TABLE ?auto_253756 ) ( ON ?auto_253757 ?auto_253756 ) ( ON ?auto_253758 ?auto_253757 ) ( ON ?auto_253759 ?auto_253758 ) ( ON ?auto_253760 ?auto_253759 ) ( not ( = ?auto_253756 ?auto_253757 ) ) ( not ( = ?auto_253756 ?auto_253758 ) ) ( not ( = ?auto_253756 ?auto_253759 ) ) ( not ( = ?auto_253756 ?auto_253760 ) ) ( not ( = ?auto_253756 ?auto_253761 ) ) ( not ( = ?auto_253756 ?auto_253762 ) ) ( not ( = ?auto_253756 ?auto_253763 ) ) ( not ( = ?auto_253756 ?auto_253764 ) ) ( not ( = ?auto_253756 ?auto_253765 ) ) ( not ( = ?auto_253756 ?auto_253766 ) ) ( not ( = ?auto_253756 ?auto_253767 ) ) ( not ( = ?auto_253756 ?auto_253768 ) ) ( not ( = ?auto_253756 ?auto_253769 ) ) ( not ( = ?auto_253757 ?auto_253758 ) ) ( not ( = ?auto_253757 ?auto_253759 ) ) ( not ( = ?auto_253757 ?auto_253760 ) ) ( not ( = ?auto_253757 ?auto_253761 ) ) ( not ( = ?auto_253757 ?auto_253762 ) ) ( not ( = ?auto_253757 ?auto_253763 ) ) ( not ( = ?auto_253757 ?auto_253764 ) ) ( not ( = ?auto_253757 ?auto_253765 ) ) ( not ( = ?auto_253757 ?auto_253766 ) ) ( not ( = ?auto_253757 ?auto_253767 ) ) ( not ( = ?auto_253757 ?auto_253768 ) ) ( not ( = ?auto_253757 ?auto_253769 ) ) ( not ( = ?auto_253758 ?auto_253759 ) ) ( not ( = ?auto_253758 ?auto_253760 ) ) ( not ( = ?auto_253758 ?auto_253761 ) ) ( not ( = ?auto_253758 ?auto_253762 ) ) ( not ( = ?auto_253758 ?auto_253763 ) ) ( not ( = ?auto_253758 ?auto_253764 ) ) ( not ( = ?auto_253758 ?auto_253765 ) ) ( not ( = ?auto_253758 ?auto_253766 ) ) ( not ( = ?auto_253758 ?auto_253767 ) ) ( not ( = ?auto_253758 ?auto_253768 ) ) ( not ( = ?auto_253758 ?auto_253769 ) ) ( not ( = ?auto_253759 ?auto_253760 ) ) ( not ( = ?auto_253759 ?auto_253761 ) ) ( not ( = ?auto_253759 ?auto_253762 ) ) ( not ( = ?auto_253759 ?auto_253763 ) ) ( not ( = ?auto_253759 ?auto_253764 ) ) ( not ( = ?auto_253759 ?auto_253765 ) ) ( not ( = ?auto_253759 ?auto_253766 ) ) ( not ( = ?auto_253759 ?auto_253767 ) ) ( not ( = ?auto_253759 ?auto_253768 ) ) ( not ( = ?auto_253759 ?auto_253769 ) ) ( not ( = ?auto_253760 ?auto_253761 ) ) ( not ( = ?auto_253760 ?auto_253762 ) ) ( not ( = ?auto_253760 ?auto_253763 ) ) ( not ( = ?auto_253760 ?auto_253764 ) ) ( not ( = ?auto_253760 ?auto_253765 ) ) ( not ( = ?auto_253760 ?auto_253766 ) ) ( not ( = ?auto_253760 ?auto_253767 ) ) ( not ( = ?auto_253760 ?auto_253768 ) ) ( not ( = ?auto_253760 ?auto_253769 ) ) ( not ( = ?auto_253761 ?auto_253762 ) ) ( not ( = ?auto_253761 ?auto_253763 ) ) ( not ( = ?auto_253761 ?auto_253764 ) ) ( not ( = ?auto_253761 ?auto_253765 ) ) ( not ( = ?auto_253761 ?auto_253766 ) ) ( not ( = ?auto_253761 ?auto_253767 ) ) ( not ( = ?auto_253761 ?auto_253768 ) ) ( not ( = ?auto_253761 ?auto_253769 ) ) ( not ( = ?auto_253762 ?auto_253763 ) ) ( not ( = ?auto_253762 ?auto_253764 ) ) ( not ( = ?auto_253762 ?auto_253765 ) ) ( not ( = ?auto_253762 ?auto_253766 ) ) ( not ( = ?auto_253762 ?auto_253767 ) ) ( not ( = ?auto_253762 ?auto_253768 ) ) ( not ( = ?auto_253762 ?auto_253769 ) ) ( not ( = ?auto_253763 ?auto_253764 ) ) ( not ( = ?auto_253763 ?auto_253765 ) ) ( not ( = ?auto_253763 ?auto_253766 ) ) ( not ( = ?auto_253763 ?auto_253767 ) ) ( not ( = ?auto_253763 ?auto_253768 ) ) ( not ( = ?auto_253763 ?auto_253769 ) ) ( not ( = ?auto_253764 ?auto_253765 ) ) ( not ( = ?auto_253764 ?auto_253766 ) ) ( not ( = ?auto_253764 ?auto_253767 ) ) ( not ( = ?auto_253764 ?auto_253768 ) ) ( not ( = ?auto_253764 ?auto_253769 ) ) ( not ( = ?auto_253765 ?auto_253766 ) ) ( not ( = ?auto_253765 ?auto_253767 ) ) ( not ( = ?auto_253765 ?auto_253768 ) ) ( not ( = ?auto_253765 ?auto_253769 ) ) ( not ( = ?auto_253766 ?auto_253767 ) ) ( not ( = ?auto_253766 ?auto_253768 ) ) ( not ( = ?auto_253766 ?auto_253769 ) ) ( not ( = ?auto_253767 ?auto_253768 ) ) ( not ( = ?auto_253767 ?auto_253769 ) ) ( not ( = ?auto_253768 ?auto_253769 ) ) ( ON ?auto_253767 ?auto_253768 ) ( ON ?auto_253766 ?auto_253767 ) ( ON ?auto_253765 ?auto_253766 ) ( ON ?auto_253764 ?auto_253765 ) ( ON ?auto_253763 ?auto_253764 ) ( ON ?auto_253762 ?auto_253763 ) ( CLEAR ?auto_253760 ) ( ON ?auto_253761 ?auto_253762 ) ( CLEAR ?auto_253761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_253756 ?auto_253757 ?auto_253758 ?auto_253759 ?auto_253760 ?auto_253761 )
      ( MAKE-13PILE ?auto_253756 ?auto_253757 ?auto_253758 ?auto_253759 ?auto_253760 ?auto_253761 ?auto_253762 ?auto_253763 ?auto_253764 ?auto_253765 ?auto_253766 ?auto_253767 ?auto_253768 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253783 - BLOCK
      ?auto_253784 - BLOCK
      ?auto_253785 - BLOCK
      ?auto_253786 - BLOCK
      ?auto_253787 - BLOCK
      ?auto_253788 - BLOCK
      ?auto_253789 - BLOCK
      ?auto_253790 - BLOCK
      ?auto_253791 - BLOCK
      ?auto_253792 - BLOCK
      ?auto_253793 - BLOCK
      ?auto_253794 - BLOCK
      ?auto_253795 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253795 ) ( ON-TABLE ?auto_253783 ) ( ON ?auto_253784 ?auto_253783 ) ( ON ?auto_253785 ?auto_253784 ) ( ON ?auto_253786 ?auto_253785 ) ( ON ?auto_253787 ?auto_253786 ) ( not ( = ?auto_253783 ?auto_253784 ) ) ( not ( = ?auto_253783 ?auto_253785 ) ) ( not ( = ?auto_253783 ?auto_253786 ) ) ( not ( = ?auto_253783 ?auto_253787 ) ) ( not ( = ?auto_253783 ?auto_253788 ) ) ( not ( = ?auto_253783 ?auto_253789 ) ) ( not ( = ?auto_253783 ?auto_253790 ) ) ( not ( = ?auto_253783 ?auto_253791 ) ) ( not ( = ?auto_253783 ?auto_253792 ) ) ( not ( = ?auto_253783 ?auto_253793 ) ) ( not ( = ?auto_253783 ?auto_253794 ) ) ( not ( = ?auto_253783 ?auto_253795 ) ) ( not ( = ?auto_253784 ?auto_253785 ) ) ( not ( = ?auto_253784 ?auto_253786 ) ) ( not ( = ?auto_253784 ?auto_253787 ) ) ( not ( = ?auto_253784 ?auto_253788 ) ) ( not ( = ?auto_253784 ?auto_253789 ) ) ( not ( = ?auto_253784 ?auto_253790 ) ) ( not ( = ?auto_253784 ?auto_253791 ) ) ( not ( = ?auto_253784 ?auto_253792 ) ) ( not ( = ?auto_253784 ?auto_253793 ) ) ( not ( = ?auto_253784 ?auto_253794 ) ) ( not ( = ?auto_253784 ?auto_253795 ) ) ( not ( = ?auto_253785 ?auto_253786 ) ) ( not ( = ?auto_253785 ?auto_253787 ) ) ( not ( = ?auto_253785 ?auto_253788 ) ) ( not ( = ?auto_253785 ?auto_253789 ) ) ( not ( = ?auto_253785 ?auto_253790 ) ) ( not ( = ?auto_253785 ?auto_253791 ) ) ( not ( = ?auto_253785 ?auto_253792 ) ) ( not ( = ?auto_253785 ?auto_253793 ) ) ( not ( = ?auto_253785 ?auto_253794 ) ) ( not ( = ?auto_253785 ?auto_253795 ) ) ( not ( = ?auto_253786 ?auto_253787 ) ) ( not ( = ?auto_253786 ?auto_253788 ) ) ( not ( = ?auto_253786 ?auto_253789 ) ) ( not ( = ?auto_253786 ?auto_253790 ) ) ( not ( = ?auto_253786 ?auto_253791 ) ) ( not ( = ?auto_253786 ?auto_253792 ) ) ( not ( = ?auto_253786 ?auto_253793 ) ) ( not ( = ?auto_253786 ?auto_253794 ) ) ( not ( = ?auto_253786 ?auto_253795 ) ) ( not ( = ?auto_253787 ?auto_253788 ) ) ( not ( = ?auto_253787 ?auto_253789 ) ) ( not ( = ?auto_253787 ?auto_253790 ) ) ( not ( = ?auto_253787 ?auto_253791 ) ) ( not ( = ?auto_253787 ?auto_253792 ) ) ( not ( = ?auto_253787 ?auto_253793 ) ) ( not ( = ?auto_253787 ?auto_253794 ) ) ( not ( = ?auto_253787 ?auto_253795 ) ) ( not ( = ?auto_253788 ?auto_253789 ) ) ( not ( = ?auto_253788 ?auto_253790 ) ) ( not ( = ?auto_253788 ?auto_253791 ) ) ( not ( = ?auto_253788 ?auto_253792 ) ) ( not ( = ?auto_253788 ?auto_253793 ) ) ( not ( = ?auto_253788 ?auto_253794 ) ) ( not ( = ?auto_253788 ?auto_253795 ) ) ( not ( = ?auto_253789 ?auto_253790 ) ) ( not ( = ?auto_253789 ?auto_253791 ) ) ( not ( = ?auto_253789 ?auto_253792 ) ) ( not ( = ?auto_253789 ?auto_253793 ) ) ( not ( = ?auto_253789 ?auto_253794 ) ) ( not ( = ?auto_253789 ?auto_253795 ) ) ( not ( = ?auto_253790 ?auto_253791 ) ) ( not ( = ?auto_253790 ?auto_253792 ) ) ( not ( = ?auto_253790 ?auto_253793 ) ) ( not ( = ?auto_253790 ?auto_253794 ) ) ( not ( = ?auto_253790 ?auto_253795 ) ) ( not ( = ?auto_253791 ?auto_253792 ) ) ( not ( = ?auto_253791 ?auto_253793 ) ) ( not ( = ?auto_253791 ?auto_253794 ) ) ( not ( = ?auto_253791 ?auto_253795 ) ) ( not ( = ?auto_253792 ?auto_253793 ) ) ( not ( = ?auto_253792 ?auto_253794 ) ) ( not ( = ?auto_253792 ?auto_253795 ) ) ( not ( = ?auto_253793 ?auto_253794 ) ) ( not ( = ?auto_253793 ?auto_253795 ) ) ( not ( = ?auto_253794 ?auto_253795 ) ) ( ON ?auto_253794 ?auto_253795 ) ( ON ?auto_253793 ?auto_253794 ) ( ON ?auto_253792 ?auto_253793 ) ( ON ?auto_253791 ?auto_253792 ) ( ON ?auto_253790 ?auto_253791 ) ( ON ?auto_253789 ?auto_253790 ) ( CLEAR ?auto_253787 ) ( ON ?auto_253788 ?auto_253789 ) ( CLEAR ?auto_253788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_253783 ?auto_253784 ?auto_253785 ?auto_253786 ?auto_253787 ?auto_253788 )
      ( MAKE-13PILE ?auto_253783 ?auto_253784 ?auto_253785 ?auto_253786 ?auto_253787 ?auto_253788 ?auto_253789 ?auto_253790 ?auto_253791 ?auto_253792 ?auto_253793 ?auto_253794 ?auto_253795 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253809 - BLOCK
      ?auto_253810 - BLOCK
      ?auto_253811 - BLOCK
      ?auto_253812 - BLOCK
      ?auto_253813 - BLOCK
      ?auto_253814 - BLOCK
      ?auto_253815 - BLOCK
      ?auto_253816 - BLOCK
      ?auto_253817 - BLOCK
      ?auto_253818 - BLOCK
      ?auto_253819 - BLOCK
      ?auto_253820 - BLOCK
      ?auto_253821 - BLOCK
    )
    :vars
    (
      ?auto_253822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253821 ?auto_253822 ) ( ON-TABLE ?auto_253809 ) ( ON ?auto_253810 ?auto_253809 ) ( ON ?auto_253811 ?auto_253810 ) ( ON ?auto_253812 ?auto_253811 ) ( not ( = ?auto_253809 ?auto_253810 ) ) ( not ( = ?auto_253809 ?auto_253811 ) ) ( not ( = ?auto_253809 ?auto_253812 ) ) ( not ( = ?auto_253809 ?auto_253813 ) ) ( not ( = ?auto_253809 ?auto_253814 ) ) ( not ( = ?auto_253809 ?auto_253815 ) ) ( not ( = ?auto_253809 ?auto_253816 ) ) ( not ( = ?auto_253809 ?auto_253817 ) ) ( not ( = ?auto_253809 ?auto_253818 ) ) ( not ( = ?auto_253809 ?auto_253819 ) ) ( not ( = ?auto_253809 ?auto_253820 ) ) ( not ( = ?auto_253809 ?auto_253821 ) ) ( not ( = ?auto_253809 ?auto_253822 ) ) ( not ( = ?auto_253810 ?auto_253811 ) ) ( not ( = ?auto_253810 ?auto_253812 ) ) ( not ( = ?auto_253810 ?auto_253813 ) ) ( not ( = ?auto_253810 ?auto_253814 ) ) ( not ( = ?auto_253810 ?auto_253815 ) ) ( not ( = ?auto_253810 ?auto_253816 ) ) ( not ( = ?auto_253810 ?auto_253817 ) ) ( not ( = ?auto_253810 ?auto_253818 ) ) ( not ( = ?auto_253810 ?auto_253819 ) ) ( not ( = ?auto_253810 ?auto_253820 ) ) ( not ( = ?auto_253810 ?auto_253821 ) ) ( not ( = ?auto_253810 ?auto_253822 ) ) ( not ( = ?auto_253811 ?auto_253812 ) ) ( not ( = ?auto_253811 ?auto_253813 ) ) ( not ( = ?auto_253811 ?auto_253814 ) ) ( not ( = ?auto_253811 ?auto_253815 ) ) ( not ( = ?auto_253811 ?auto_253816 ) ) ( not ( = ?auto_253811 ?auto_253817 ) ) ( not ( = ?auto_253811 ?auto_253818 ) ) ( not ( = ?auto_253811 ?auto_253819 ) ) ( not ( = ?auto_253811 ?auto_253820 ) ) ( not ( = ?auto_253811 ?auto_253821 ) ) ( not ( = ?auto_253811 ?auto_253822 ) ) ( not ( = ?auto_253812 ?auto_253813 ) ) ( not ( = ?auto_253812 ?auto_253814 ) ) ( not ( = ?auto_253812 ?auto_253815 ) ) ( not ( = ?auto_253812 ?auto_253816 ) ) ( not ( = ?auto_253812 ?auto_253817 ) ) ( not ( = ?auto_253812 ?auto_253818 ) ) ( not ( = ?auto_253812 ?auto_253819 ) ) ( not ( = ?auto_253812 ?auto_253820 ) ) ( not ( = ?auto_253812 ?auto_253821 ) ) ( not ( = ?auto_253812 ?auto_253822 ) ) ( not ( = ?auto_253813 ?auto_253814 ) ) ( not ( = ?auto_253813 ?auto_253815 ) ) ( not ( = ?auto_253813 ?auto_253816 ) ) ( not ( = ?auto_253813 ?auto_253817 ) ) ( not ( = ?auto_253813 ?auto_253818 ) ) ( not ( = ?auto_253813 ?auto_253819 ) ) ( not ( = ?auto_253813 ?auto_253820 ) ) ( not ( = ?auto_253813 ?auto_253821 ) ) ( not ( = ?auto_253813 ?auto_253822 ) ) ( not ( = ?auto_253814 ?auto_253815 ) ) ( not ( = ?auto_253814 ?auto_253816 ) ) ( not ( = ?auto_253814 ?auto_253817 ) ) ( not ( = ?auto_253814 ?auto_253818 ) ) ( not ( = ?auto_253814 ?auto_253819 ) ) ( not ( = ?auto_253814 ?auto_253820 ) ) ( not ( = ?auto_253814 ?auto_253821 ) ) ( not ( = ?auto_253814 ?auto_253822 ) ) ( not ( = ?auto_253815 ?auto_253816 ) ) ( not ( = ?auto_253815 ?auto_253817 ) ) ( not ( = ?auto_253815 ?auto_253818 ) ) ( not ( = ?auto_253815 ?auto_253819 ) ) ( not ( = ?auto_253815 ?auto_253820 ) ) ( not ( = ?auto_253815 ?auto_253821 ) ) ( not ( = ?auto_253815 ?auto_253822 ) ) ( not ( = ?auto_253816 ?auto_253817 ) ) ( not ( = ?auto_253816 ?auto_253818 ) ) ( not ( = ?auto_253816 ?auto_253819 ) ) ( not ( = ?auto_253816 ?auto_253820 ) ) ( not ( = ?auto_253816 ?auto_253821 ) ) ( not ( = ?auto_253816 ?auto_253822 ) ) ( not ( = ?auto_253817 ?auto_253818 ) ) ( not ( = ?auto_253817 ?auto_253819 ) ) ( not ( = ?auto_253817 ?auto_253820 ) ) ( not ( = ?auto_253817 ?auto_253821 ) ) ( not ( = ?auto_253817 ?auto_253822 ) ) ( not ( = ?auto_253818 ?auto_253819 ) ) ( not ( = ?auto_253818 ?auto_253820 ) ) ( not ( = ?auto_253818 ?auto_253821 ) ) ( not ( = ?auto_253818 ?auto_253822 ) ) ( not ( = ?auto_253819 ?auto_253820 ) ) ( not ( = ?auto_253819 ?auto_253821 ) ) ( not ( = ?auto_253819 ?auto_253822 ) ) ( not ( = ?auto_253820 ?auto_253821 ) ) ( not ( = ?auto_253820 ?auto_253822 ) ) ( not ( = ?auto_253821 ?auto_253822 ) ) ( ON ?auto_253820 ?auto_253821 ) ( ON ?auto_253819 ?auto_253820 ) ( ON ?auto_253818 ?auto_253819 ) ( ON ?auto_253817 ?auto_253818 ) ( ON ?auto_253816 ?auto_253817 ) ( ON ?auto_253815 ?auto_253816 ) ( ON ?auto_253814 ?auto_253815 ) ( CLEAR ?auto_253812 ) ( ON ?auto_253813 ?auto_253814 ) ( CLEAR ?auto_253813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_253809 ?auto_253810 ?auto_253811 ?auto_253812 ?auto_253813 )
      ( MAKE-13PILE ?auto_253809 ?auto_253810 ?auto_253811 ?auto_253812 ?auto_253813 ?auto_253814 ?auto_253815 ?auto_253816 ?auto_253817 ?auto_253818 ?auto_253819 ?auto_253820 ?auto_253821 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253836 - BLOCK
      ?auto_253837 - BLOCK
      ?auto_253838 - BLOCK
      ?auto_253839 - BLOCK
      ?auto_253840 - BLOCK
      ?auto_253841 - BLOCK
      ?auto_253842 - BLOCK
      ?auto_253843 - BLOCK
      ?auto_253844 - BLOCK
      ?auto_253845 - BLOCK
      ?auto_253846 - BLOCK
      ?auto_253847 - BLOCK
      ?auto_253848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253848 ) ( ON-TABLE ?auto_253836 ) ( ON ?auto_253837 ?auto_253836 ) ( ON ?auto_253838 ?auto_253837 ) ( ON ?auto_253839 ?auto_253838 ) ( not ( = ?auto_253836 ?auto_253837 ) ) ( not ( = ?auto_253836 ?auto_253838 ) ) ( not ( = ?auto_253836 ?auto_253839 ) ) ( not ( = ?auto_253836 ?auto_253840 ) ) ( not ( = ?auto_253836 ?auto_253841 ) ) ( not ( = ?auto_253836 ?auto_253842 ) ) ( not ( = ?auto_253836 ?auto_253843 ) ) ( not ( = ?auto_253836 ?auto_253844 ) ) ( not ( = ?auto_253836 ?auto_253845 ) ) ( not ( = ?auto_253836 ?auto_253846 ) ) ( not ( = ?auto_253836 ?auto_253847 ) ) ( not ( = ?auto_253836 ?auto_253848 ) ) ( not ( = ?auto_253837 ?auto_253838 ) ) ( not ( = ?auto_253837 ?auto_253839 ) ) ( not ( = ?auto_253837 ?auto_253840 ) ) ( not ( = ?auto_253837 ?auto_253841 ) ) ( not ( = ?auto_253837 ?auto_253842 ) ) ( not ( = ?auto_253837 ?auto_253843 ) ) ( not ( = ?auto_253837 ?auto_253844 ) ) ( not ( = ?auto_253837 ?auto_253845 ) ) ( not ( = ?auto_253837 ?auto_253846 ) ) ( not ( = ?auto_253837 ?auto_253847 ) ) ( not ( = ?auto_253837 ?auto_253848 ) ) ( not ( = ?auto_253838 ?auto_253839 ) ) ( not ( = ?auto_253838 ?auto_253840 ) ) ( not ( = ?auto_253838 ?auto_253841 ) ) ( not ( = ?auto_253838 ?auto_253842 ) ) ( not ( = ?auto_253838 ?auto_253843 ) ) ( not ( = ?auto_253838 ?auto_253844 ) ) ( not ( = ?auto_253838 ?auto_253845 ) ) ( not ( = ?auto_253838 ?auto_253846 ) ) ( not ( = ?auto_253838 ?auto_253847 ) ) ( not ( = ?auto_253838 ?auto_253848 ) ) ( not ( = ?auto_253839 ?auto_253840 ) ) ( not ( = ?auto_253839 ?auto_253841 ) ) ( not ( = ?auto_253839 ?auto_253842 ) ) ( not ( = ?auto_253839 ?auto_253843 ) ) ( not ( = ?auto_253839 ?auto_253844 ) ) ( not ( = ?auto_253839 ?auto_253845 ) ) ( not ( = ?auto_253839 ?auto_253846 ) ) ( not ( = ?auto_253839 ?auto_253847 ) ) ( not ( = ?auto_253839 ?auto_253848 ) ) ( not ( = ?auto_253840 ?auto_253841 ) ) ( not ( = ?auto_253840 ?auto_253842 ) ) ( not ( = ?auto_253840 ?auto_253843 ) ) ( not ( = ?auto_253840 ?auto_253844 ) ) ( not ( = ?auto_253840 ?auto_253845 ) ) ( not ( = ?auto_253840 ?auto_253846 ) ) ( not ( = ?auto_253840 ?auto_253847 ) ) ( not ( = ?auto_253840 ?auto_253848 ) ) ( not ( = ?auto_253841 ?auto_253842 ) ) ( not ( = ?auto_253841 ?auto_253843 ) ) ( not ( = ?auto_253841 ?auto_253844 ) ) ( not ( = ?auto_253841 ?auto_253845 ) ) ( not ( = ?auto_253841 ?auto_253846 ) ) ( not ( = ?auto_253841 ?auto_253847 ) ) ( not ( = ?auto_253841 ?auto_253848 ) ) ( not ( = ?auto_253842 ?auto_253843 ) ) ( not ( = ?auto_253842 ?auto_253844 ) ) ( not ( = ?auto_253842 ?auto_253845 ) ) ( not ( = ?auto_253842 ?auto_253846 ) ) ( not ( = ?auto_253842 ?auto_253847 ) ) ( not ( = ?auto_253842 ?auto_253848 ) ) ( not ( = ?auto_253843 ?auto_253844 ) ) ( not ( = ?auto_253843 ?auto_253845 ) ) ( not ( = ?auto_253843 ?auto_253846 ) ) ( not ( = ?auto_253843 ?auto_253847 ) ) ( not ( = ?auto_253843 ?auto_253848 ) ) ( not ( = ?auto_253844 ?auto_253845 ) ) ( not ( = ?auto_253844 ?auto_253846 ) ) ( not ( = ?auto_253844 ?auto_253847 ) ) ( not ( = ?auto_253844 ?auto_253848 ) ) ( not ( = ?auto_253845 ?auto_253846 ) ) ( not ( = ?auto_253845 ?auto_253847 ) ) ( not ( = ?auto_253845 ?auto_253848 ) ) ( not ( = ?auto_253846 ?auto_253847 ) ) ( not ( = ?auto_253846 ?auto_253848 ) ) ( not ( = ?auto_253847 ?auto_253848 ) ) ( ON ?auto_253847 ?auto_253848 ) ( ON ?auto_253846 ?auto_253847 ) ( ON ?auto_253845 ?auto_253846 ) ( ON ?auto_253844 ?auto_253845 ) ( ON ?auto_253843 ?auto_253844 ) ( ON ?auto_253842 ?auto_253843 ) ( ON ?auto_253841 ?auto_253842 ) ( CLEAR ?auto_253839 ) ( ON ?auto_253840 ?auto_253841 ) ( CLEAR ?auto_253840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_253836 ?auto_253837 ?auto_253838 ?auto_253839 ?auto_253840 )
      ( MAKE-13PILE ?auto_253836 ?auto_253837 ?auto_253838 ?auto_253839 ?auto_253840 ?auto_253841 ?auto_253842 ?auto_253843 ?auto_253844 ?auto_253845 ?auto_253846 ?auto_253847 ?auto_253848 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253862 - BLOCK
      ?auto_253863 - BLOCK
      ?auto_253864 - BLOCK
      ?auto_253865 - BLOCK
      ?auto_253866 - BLOCK
      ?auto_253867 - BLOCK
      ?auto_253868 - BLOCK
      ?auto_253869 - BLOCK
      ?auto_253870 - BLOCK
      ?auto_253871 - BLOCK
      ?auto_253872 - BLOCK
      ?auto_253873 - BLOCK
      ?auto_253874 - BLOCK
    )
    :vars
    (
      ?auto_253875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253874 ?auto_253875 ) ( ON-TABLE ?auto_253862 ) ( ON ?auto_253863 ?auto_253862 ) ( ON ?auto_253864 ?auto_253863 ) ( not ( = ?auto_253862 ?auto_253863 ) ) ( not ( = ?auto_253862 ?auto_253864 ) ) ( not ( = ?auto_253862 ?auto_253865 ) ) ( not ( = ?auto_253862 ?auto_253866 ) ) ( not ( = ?auto_253862 ?auto_253867 ) ) ( not ( = ?auto_253862 ?auto_253868 ) ) ( not ( = ?auto_253862 ?auto_253869 ) ) ( not ( = ?auto_253862 ?auto_253870 ) ) ( not ( = ?auto_253862 ?auto_253871 ) ) ( not ( = ?auto_253862 ?auto_253872 ) ) ( not ( = ?auto_253862 ?auto_253873 ) ) ( not ( = ?auto_253862 ?auto_253874 ) ) ( not ( = ?auto_253862 ?auto_253875 ) ) ( not ( = ?auto_253863 ?auto_253864 ) ) ( not ( = ?auto_253863 ?auto_253865 ) ) ( not ( = ?auto_253863 ?auto_253866 ) ) ( not ( = ?auto_253863 ?auto_253867 ) ) ( not ( = ?auto_253863 ?auto_253868 ) ) ( not ( = ?auto_253863 ?auto_253869 ) ) ( not ( = ?auto_253863 ?auto_253870 ) ) ( not ( = ?auto_253863 ?auto_253871 ) ) ( not ( = ?auto_253863 ?auto_253872 ) ) ( not ( = ?auto_253863 ?auto_253873 ) ) ( not ( = ?auto_253863 ?auto_253874 ) ) ( not ( = ?auto_253863 ?auto_253875 ) ) ( not ( = ?auto_253864 ?auto_253865 ) ) ( not ( = ?auto_253864 ?auto_253866 ) ) ( not ( = ?auto_253864 ?auto_253867 ) ) ( not ( = ?auto_253864 ?auto_253868 ) ) ( not ( = ?auto_253864 ?auto_253869 ) ) ( not ( = ?auto_253864 ?auto_253870 ) ) ( not ( = ?auto_253864 ?auto_253871 ) ) ( not ( = ?auto_253864 ?auto_253872 ) ) ( not ( = ?auto_253864 ?auto_253873 ) ) ( not ( = ?auto_253864 ?auto_253874 ) ) ( not ( = ?auto_253864 ?auto_253875 ) ) ( not ( = ?auto_253865 ?auto_253866 ) ) ( not ( = ?auto_253865 ?auto_253867 ) ) ( not ( = ?auto_253865 ?auto_253868 ) ) ( not ( = ?auto_253865 ?auto_253869 ) ) ( not ( = ?auto_253865 ?auto_253870 ) ) ( not ( = ?auto_253865 ?auto_253871 ) ) ( not ( = ?auto_253865 ?auto_253872 ) ) ( not ( = ?auto_253865 ?auto_253873 ) ) ( not ( = ?auto_253865 ?auto_253874 ) ) ( not ( = ?auto_253865 ?auto_253875 ) ) ( not ( = ?auto_253866 ?auto_253867 ) ) ( not ( = ?auto_253866 ?auto_253868 ) ) ( not ( = ?auto_253866 ?auto_253869 ) ) ( not ( = ?auto_253866 ?auto_253870 ) ) ( not ( = ?auto_253866 ?auto_253871 ) ) ( not ( = ?auto_253866 ?auto_253872 ) ) ( not ( = ?auto_253866 ?auto_253873 ) ) ( not ( = ?auto_253866 ?auto_253874 ) ) ( not ( = ?auto_253866 ?auto_253875 ) ) ( not ( = ?auto_253867 ?auto_253868 ) ) ( not ( = ?auto_253867 ?auto_253869 ) ) ( not ( = ?auto_253867 ?auto_253870 ) ) ( not ( = ?auto_253867 ?auto_253871 ) ) ( not ( = ?auto_253867 ?auto_253872 ) ) ( not ( = ?auto_253867 ?auto_253873 ) ) ( not ( = ?auto_253867 ?auto_253874 ) ) ( not ( = ?auto_253867 ?auto_253875 ) ) ( not ( = ?auto_253868 ?auto_253869 ) ) ( not ( = ?auto_253868 ?auto_253870 ) ) ( not ( = ?auto_253868 ?auto_253871 ) ) ( not ( = ?auto_253868 ?auto_253872 ) ) ( not ( = ?auto_253868 ?auto_253873 ) ) ( not ( = ?auto_253868 ?auto_253874 ) ) ( not ( = ?auto_253868 ?auto_253875 ) ) ( not ( = ?auto_253869 ?auto_253870 ) ) ( not ( = ?auto_253869 ?auto_253871 ) ) ( not ( = ?auto_253869 ?auto_253872 ) ) ( not ( = ?auto_253869 ?auto_253873 ) ) ( not ( = ?auto_253869 ?auto_253874 ) ) ( not ( = ?auto_253869 ?auto_253875 ) ) ( not ( = ?auto_253870 ?auto_253871 ) ) ( not ( = ?auto_253870 ?auto_253872 ) ) ( not ( = ?auto_253870 ?auto_253873 ) ) ( not ( = ?auto_253870 ?auto_253874 ) ) ( not ( = ?auto_253870 ?auto_253875 ) ) ( not ( = ?auto_253871 ?auto_253872 ) ) ( not ( = ?auto_253871 ?auto_253873 ) ) ( not ( = ?auto_253871 ?auto_253874 ) ) ( not ( = ?auto_253871 ?auto_253875 ) ) ( not ( = ?auto_253872 ?auto_253873 ) ) ( not ( = ?auto_253872 ?auto_253874 ) ) ( not ( = ?auto_253872 ?auto_253875 ) ) ( not ( = ?auto_253873 ?auto_253874 ) ) ( not ( = ?auto_253873 ?auto_253875 ) ) ( not ( = ?auto_253874 ?auto_253875 ) ) ( ON ?auto_253873 ?auto_253874 ) ( ON ?auto_253872 ?auto_253873 ) ( ON ?auto_253871 ?auto_253872 ) ( ON ?auto_253870 ?auto_253871 ) ( ON ?auto_253869 ?auto_253870 ) ( ON ?auto_253868 ?auto_253869 ) ( ON ?auto_253867 ?auto_253868 ) ( ON ?auto_253866 ?auto_253867 ) ( CLEAR ?auto_253864 ) ( ON ?auto_253865 ?auto_253866 ) ( CLEAR ?auto_253865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_253862 ?auto_253863 ?auto_253864 ?auto_253865 )
      ( MAKE-13PILE ?auto_253862 ?auto_253863 ?auto_253864 ?auto_253865 ?auto_253866 ?auto_253867 ?auto_253868 ?auto_253869 ?auto_253870 ?auto_253871 ?auto_253872 ?auto_253873 ?auto_253874 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253889 - BLOCK
      ?auto_253890 - BLOCK
      ?auto_253891 - BLOCK
      ?auto_253892 - BLOCK
      ?auto_253893 - BLOCK
      ?auto_253894 - BLOCK
      ?auto_253895 - BLOCK
      ?auto_253896 - BLOCK
      ?auto_253897 - BLOCK
      ?auto_253898 - BLOCK
      ?auto_253899 - BLOCK
      ?auto_253900 - BLOCK
      ?auto_253901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253901 ) ( ON-TABLE ?auto_253889 ) ( ON ?auto_253890 ?auto_253889 ) ( ON ?auto_253891 ?auto_253890 ) ( not ( = ?auto_253889 ?auto_253890 ) ) ( not ( = ?auto_253889 ?auto_253891 ) ) ( not ( = ?auto_253889 ?auto_253892 ) ) ( not ( = ?auto_253889 ?auto_253893 ) ) ( not ( = ?auto_253889 ?auto_253894 ) ) ( not ( = ?auto_253889 ?auto_253895 ) ) ( not ( = ?auto_253889 ?auto_253896 ) ) ( not ( = ?auto_253889 ?auto_253897 ) ) ( not ( = ?auto_253889 ?auto_253898 ) ) ( not ( = ?auto_253889 ?auto_253899 ) ) ( not ( = ?auto_253889 ?auto_253900 ) ) ( not ( = ?auto_253889 ?auto_253901 ) ) ( not ( = ?auto_253890 ?auto_253891 ) ) ( not ( = ?auto_253890 ?auto_253892 ) ) ( not ( = ?auto_253890 ?auto_253893 ) ) ( not ( = ?auto_253890 ?auto_253894 ) ) ( not ( = ?auto_253890 ?auto_253895 ) ) ( not ( = ?auto_253890 ?auto_253896 ) ) ( not ( = ?auto_253890 ?auto_253897 ) ) ( not ( = ?auto_253890 ?auto_253898 ) ) ( not ( = ?auto_253890 ?auto_253899 ) ) ( not ( = ?auto_253890 ?auto_253900 ) ) ( not ( = ?auto_253890 ?auto_253901 ) ) ( not ( = ?auto_253891 ?auto_253892 ) ) ( not ( = ?auto_253891 ?auto_253893 ) ) ( not ( = ?auto_253891 ?auto_253894 ) ) ( not ( = ?auto_253891 ?auto_253895 ) ) ( not ( = ?auto_253891 ?auto_253896 ) ) ( not ( = ?auto_253891 ?auto_253897 ) ) ( not ( = ?auto_253891 ?auto_253898 ) ) ( not ( = ?auto_253891 ?auto_253899 ) ) ( not ( = ?auto_253891 ?auto_253900 ) ) ( not ( = ?auto_253891 ?auto_253901 ) ) ( not ( = ?auto_253892 ?auto_253893 ) ) ( not ( = ?auto_253892 ?auto_253894 ) ) ( not ( = ?auto_253892 ?auto_253895 ) ) ( not ( = ?auto_253892 ?auto_253896 ) ) ( not ( = ?auto_253892 ?auto_253897 ) ) ( not ( = ?auto_253892 ?auto_253898 ) ) ( not ( = ?auto_253892 ?auto_253899 ) ) ( not ( = ?auto_253892 ?auto_253900 ) ) ( not ( = ?auto_253892 ?auto_253901 ) ) ( not ( = ?auto_253893 ?auto_253894 ) ) ( not ( = ?auto_253893 ?auto_253895 ) ) ( not ( = ?auto_253893 ?auto_253896 ) ) ( not ( = ?auto_253893 ?auto_253897 ) ) ( not ( = ?auto_253893 ?auto_253898 ) ) ( not ( = ?auto_253893 ?auto_253899 ) ) ( not ( = ?auto_253893 ?auto_253900 ) ) ( not ( = ?auto_253893 ?auto_253901 ) ) ( not ( = ?auto_253894 ?auto_253895 ) ) ( not ( = ?auto_253894 ?auto_253896 ) ) ( not ( = ?auto_253894 ?auto_253897 ) ) ( not ( = ?auto_253894 ?auto_253898 ) ) ( not ( = ?auto_253894 ?auto_253899 ) ) ( not ( = ?auto_253894 ?auto_253900 ) ) ( not ( = ?auto_253894 ?auto_253901 ) ) ( not ( = ?auto_253895 ?auto_253896 ) ) ( not ( = ?auto_253895 ?auto_253897 ) ) ( not ( = ?auto_253895 ?auto_253898 ) ) ( not ( = ?auto_253895 ?auto_253899 ) ) ( not ( = ?auto_253895 ?auto_253900 ) ) ( not ( = ?auto_253895 ?auto_253901 ) ) ( not ( = ?auto_253896 ?auto_253897 ) ) ( not ( = ?auto_253896 ?auto_253898 ) ) ( not ( = ?auto_253896 ?auto_253899 ) ) ( not ( = ?auto_253896 ?auto_253900 ) ) ( not ( = ?auto_253896 ?auto_253901 ) ) ( not ( = ?auto_253897 ?auto_253898 ) ) ( not ( = ?auto_253897 ?auto_253899 ) ) ( not ( = ?auto_253897 ?auto_253900 ) ) ( not ( = ?auto_253897 ?auto_253901 ) ) ( not ( = ?auto_253898 ?auto_253899 ) ) ( not ( = ?auto_253898 ?auto_253900 ) ) ( not ( = ?auto_253898 ?auto_253901 ) ) ( not ( = ?auto_253899 ?auto_253900 ) ) ( not ( = ?auto_253899 ?auto_253901 ) ) ( not ( = ?auto_253900 ?auto_253901 ) ) ( ON ?auto_253900 ?auto_253901 ) ( ON ?auto_253899 ?auto_253900 ) ( ON ?auto_253898 ?auto_253899 ) ( ON ?auto_253897 ?auto_253898 ) ( ON ?auto_253896 ?auto_253897 ) ( ON ?auto_253895 ?auto_253896 ) ( ON ?auto_253894 ?auto_253895 ) ( ON ?auto_253893 ?auto_253894 ) ( CLEAR ?auto_253891 ) ( ON ?auto_253892 ?auto_253893 ) ( CLEAR ?auto_253892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_253889 ?auto_253890 ?auto_253891 ?auto_253892 )
      ( MAKE-13PILE ?auto_253889 ?auto_253890 ?auto_253891 ?auto_253892 ?auto_253893 ?auto_253894 ?auto_253895 ?auto_253896 ?auto_253897 ?auto_253898 ?auto_253899 ?auto_253900 ?auto_253901 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253915 - BLOCK
      ?auto_253916 - BLOCK
      ?auto_253917 - BLOCK
      ?auto_253918 - BLOCK
      ?auto_253919 - BLOCK
      ?auto_253920 - BLOCK
      ?auto_253921 - BLOCK
      ?auto_253922 - BLOCK
      ?auto_253923 - BLOCK
      ?auto_253924 - BLOCK
      ?auto_253925 - BLOCK
      ?auto_253926 - BLOCK
      ?auto_253927 - BLOCK
    )
    :vars
    (
      ?auto_253928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253927 ?auto_253928 ) ( ON-TABLE ?auto_253915 ) ( ON ?auto_253916 ?auto_253915 ) ( not ( = ?auto_253915 ?auto_253916 ) ) ( not ( = ?auto_253915 ?auto_253917 ) ) ( not ( = ?auto_253915 ?auto_253918 ) ) ( not ( = ?auto_253915 ?auto_253919 ) ) ( not ( = ?auto_253915 ?auto_253920 ) ) ( not ( = ?auto_253915 ?auto_253921 ) ) ( not ( = ?auto_253915 ?auto_253922 ) ) ( not ( = ?auto_253915 ?auto_253923 ) ) ( not ( = ?auto_253915 ?auto_253924 ) ) ( not ( = ?auto_253915 ?auto_253925 ) ) ( not ( = ?auto_253915 ?auto_253926 ) ) ( not ( = ?auto_253915 ?auto_253927 ) ) ( not ( = ?auto_253915 ?auto_253928 ) ) ( not ( = ?auto_253916 ?auto_253917 ) ) ( not ( = ?auto_253916 ?auto_253918 ) ) ( not ( = ?auto_253916 ?auto_253919 ) ) ( not ( = ?auto_253916 ?auto_253920 ) ) ( not ( = ?auto_253916 ?auto_253921 ) ) ( not ( = ?auto_253916 ?auto_253922 ) ) ( not ( = ?auto_253916 ?auto_253923 ) ) ( not ( = ?auto_253916 ?auto_253924 ) ) ( not ( = ?auto_253916 ?auto_253925 ) ) ( not ( = ?auto_253916 ?auto_253926 ) ) ( not ( = ?auto_253916 ?auto_253927 ) ) ( not ( = ?auto_253916 ?auto_253928 ) ) ( not ( = ?auto_253917 ?auto_253918 ) ) ( not ( = ?auto_253917 ?auto_253919 ) ) ( not ( = ?auto_253917 ?auto_253920 ) ) ( not ( = ?auto_253917 ?auto_253921 ) ) ( not ( = ?auto_253917 ?auto_253922 ) ) ( not ( = ?auto_253917 ?auto_253923 ) ) ( not ( = ?auto_253917 ?auto_253924 ) ) ( not ( = ?auto_253917 ?auto_253925 ) ) ( not ( = ?auto_253917 ?auto_253926 ) ) ( not ( = ?auto_253917 ?auto_253927 ) ) ( not ( = ?auto_253917 ?auto_253928 ) ) ( not ( = ?auto_253918 ?auto_253919 ) ) ( not ( = ?auto_253918 ?auto_253920 ) ) ( not ( = ?auto_253918 ?auto_253921 ) ) ( not ( = ?auto_253918 ?auto_253922 ) ) ( not ( = ?auto_253918 ?auto_253923 ) ) ( not ( = ?auto_253918 ?auto_253924 ) ) ( not ( = ?auto_253918 ?auto_253925 ) ) ( not ( = ?auto_253918 ?auto_253926 ) ) ( not ( = ?auto_253918 ?auto_253927 ) ) ( not ( = ?auto_253918 ?auto_253928 ) ) ( not ( = ?auto_253919 ?auto_253920 ) ) ( not ( = ?auto_253919 ?auto_253921 ) ) ( not ( = ?auto_253919 ?auto_253922 ) ) ( not ( = ?auto_253919 ?auto_253923 ) ) ( not ( = ?auto_253919 ?auto_253924 ) ) ( not ( = ?auto_253919 ?auto_253925 ) ) ( not ( = ?auto_253919 ?auto_253926 ) ) ( not ( = ?auto_253919 ?auto_253927 ) ) ( not ( = ?auto_253919 ?auto_253928 ) ) ( not ( = ?auto_253920 ?auto_253921 ) ) ( not ( = ?auto_253920 ?auto_253922 ) ) ( not ( = ?auto_253920 ?auto_253923 ) ) ( not ( = ?auto_253920 ?auto_253924 ) ) ( not ( = ?auto_253920 ?auto_253925 ) ) ( not ( = ?auto_253920 ?auto_253926 ) ) ( not ( = ?auto_253920 ?auto_253927 ) ) ( not ( = ?auto_253920 ?auto_253928 ) ) ( not ( = ?auto_253921 ?auto_253922 ) ) ( not ( = ?auto_253921 ?auto_253923 ) ) ( not ( = ?auto_253921 ?auto_253924 ) ) ( not ( = ?auto_253921 ?auto_253925 ) ) ( not ( = ?auto_253921 ?auto_253926 ) ) ( not ( = ?auto_253921 ?auto_253927 ) ) ( not ( = ?auto_253921 ?auto_253928 ) ) ( not ( = ?auto_253922 ?auto_253923 ) ) ( not ( = ?auto_253922 ?auto_253924 ) ) ( not ( = ?auto_253922 ?auto_253925 ) ) ( not ( = ?auto_253922 ?auto_253926 ) ) ( not ( = ?auto_253922 ?auto_253927 ) ) ( not ( = ?auto_253922 ?auto_253928 ) ) ( not ( = ?auto_253923 ?auto_253924 ) ) ( not ( = ?auto_253923 ?auto_253925 ) ) ( not ( = ?auto_253923 ?auto_253926 ) ) ( not ( = ?auto_253923 ?auto_253927 ) ) ( not ( = ?auto_253923 ?auto_253928 ) ) ( not ( = ?auto_253924 ?auto_253925 ) ) ( not ( = ?auto_253924 ?auto_253926 ) ) ( not ( = ?auto_253924 ?auto_253927 ) ) ( not ( = ?auto_253924 ?auto_253928 ) ) ( not ( = ?auto_253925 ?auto_253926 ) ) ( not ( = ?auto_253925 ?auto_253927 ) ) ( not ( = ?auto_253925 ?auto_253928 ) ) ( not ( = ?auto_253926 ?auto_253927 ) ) ( not ( = ?auto_253926 ?auto_253928 ) ) ( not ( = ?auto_253927 ?auto_253928 ) ) ( ON ?auto_253926 ?auto_253927 ) ( ON ?auto_253925 ?auto_253926 ) ( ON ?auto_253924 ?auto_253925 ) ( ON ?auto_253923 ?auto_253924 ) ( ON ?auto_253922 ?auto_253923 ) ( ON ?auto_253921 ?auto_253922 ) ( ON ?auto_253920 ?auto_253921 ) ( ON ?auto_253919 ?auto_253920 ) ( ON ?auto_253918 ?auto_253919 ) ( CLEAR ?auto_253916 ) ( ON ?auto_253917 ?auto_253918 ) ( CLEAR ?auto_253917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_253915 ?auto_253916 ?auto_253917 )
      ( MAKE-13PILE ?auto_253915 ?auto_253916 ?auto_253917 ?auto_253918 ?auto_253919 ?auto_253920 ?auto_253921 ?auto_253922 ?auto_253923 ?auto_253924 ?auto_253925 ?auto_253926 ?auto_253927 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253942 - BLOCK
      ?auto_253943 - BLOCK
      ?auto_253944 - BLOCK
      ?auto_253945 - BLOCK
      ?auto_253946 - BLOCK
      ?auto_253947 - BLOCK
      ?auto_253948 - BLOCK
      ?auto_253949 - BLOCK
      ?auto_253950 - BLOCK
      ?auto_253951 - BLOCK
      ?auto_253952 - BLOCK
      ?auto_253953 - BLOCK
      ?auto_253954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_253954 ) ( ON-TABLE ?auto_253942 ) ( ON ?auto_253943 ?auto_253942 ) ( not ( = ?auto_253942 ?auto_253943 ) ) ( not ( = ?auto_253942 ?auto_253944 ) ) ( not ( = ?auto_253942 ?auto_253945 ) ) ( not ( = ?auto_253942 ?auto_253946 ) ) ( not ( = ?auto_253942 ?auto_253947 ) ) ( not ( = ?auto_253942 ?auto_253948 ) ) ( not ( = ?auto_253942 ?auto_253949 ) ) ( not ( = ?auto_253942 ?auto_253950 ) ) ( not ( = ?auto_253942 ?auto_253951 ) ) ( not ( = ?auto_253942 ?auto_253952 ) ) ( not ( = ?auto_253942 ?auto_253953 ) ) ( not ( = ?auto_253942 ?auto_253954 ) ) ( not ( = ?auto_253943 ?auto_253944 ) ) ( not ( = ?auto_253943 ?auto_253945 ) ) ( not ( = ?auto_253943 ?auto_253946 ) ) ( not ( = ?auto_253943 ?auto_253947 ) ) ( not ( = ?auto_253943 ?auto_253948 ) ) ( not ( = ?auto_253943 ?auto_253949 ) ) ( not ( = ?auto_253943 ?auto_253950 ) ) ( not ( = ?auto_253943 ?auto_253951 ) ) ( not ( = ?auto_253943 ?auto_253952 ) ) ( not ( = ?auto_253943 ?auto_253953 ) ) ( not ( = ?auto_253943 ?auto_253954 ) ) ( not ( = ?auto_253944 ?auto_253945 ) ) ( not ( = ?auto_253944 ?auto_253946 ) ) ( not ( = ?auto_253944 ?auto_253947 ) ) ( not ( = ?auto_253944 ?auto_253948 ) ) ( not ( = ?auto_253944 ?auto_253949 ) ) ( not ( = ?auto_253944 ?auto_253950 ) ) ( not ( = ?auto_253944 ?auto_253951 ) ) ( not ( = ?auto_253944 ?auto_253952 ) ) ( not ( = ?auto_253944 ?auto_253953 ) ) ( not ( = ?auto_253944 ?auto_253954 ) ) ( not ( = ?auto_253945 ?auto_253946 ) ) ( not ( = ?auto_253945 ?auto_253947 ) ) ( not ( = ?auto_253945 ?auto_253948 ) ) ( not ( = ?auto_253945 ?auto_253949 ) ) ( not ( = ?auto_253945 ?auto_253950 ) ) ( not ( = ?auto_253945 ?auto_253951 ) ) ( not ( = ?auto_253945 ?auto_253952 ) ) ( not ( = ?auto_253945 ?auto_253953 ) ) ( not ( = ?auto_253945 ?auto_253954 ) ) ( not ( = ?auto_253946 ?auto_253947 ) ) ( not ( = ?auto_253946 ?auto_253948 ) ) ( not ( = ?auto_253946 ?auto_253949 ) ) ( not ( = ?auto_253946 ?auto_253950 ) ) ( not ( = ?auto_253946 ?auto_253951 ) ) ( not ( = ?auto_253946 ?auto_253952 ) ) ( not ( = ?auto_253946 ?auto_253953 ) ) ( not ( = ?auto_253946 ?auto_253954 ) ) ( not ( = ?auto_253947 ?auto_253948 ) ) ( not ( = ?auto_253947 ?auto_253949 ) ) ( not ( = ?auto_253947 ?auto_253950 ) ) ( not ( = ?auto_253947 ?auto_253951 ) ) ( not ( = ?auto_253947 ?auto_253952 ) ) ( not ( = ?auto_253947 ?auto_253953 ) ) ( not ( = ?auto_253947 ?auto_253954 ) ) ( not ( = ?auto_253948 ?auto_253949 ) ) ( not ( = ?auto_253948 ?auto_253950 ) ) ( not ( = ?auto_253948 ?auto_253951 ) ) ( not ( = ?auto_253948 ?auto_253952 ) ) ( not ( = ?auto_253948 ?auto_253953 ) ) ( not ( = ?auto_253948 ?auto_253954 ) ) ( not ( = ?auto_253949 ?auto_253950 ) ) ( not ( = ?auto_253949 ?auto_253951 ) ) ( not ( = ?auto_253949 ?auto_253952 ) ) ( not ( = ?auto_253949 ?auto_253953 ) ) ( not ( = ?auto_253949 ?auto_253954 ) ) ( not ( = ?auto_253950 ?auto_253951 ) ) ( not ( = ?auto_253950 ?auto_253952 ) ) ( not ( = ?auto_253950 ?auto_253953 ) ) ( not ( = ?auto_253950 ?auto_253954 ) ) ( not ( = ?auto_253951 ?auto_253952 ) ) ( not ( = ?auto_253951 ?auto_253953 ) ) ( not ( = ?auto_253951 ?auto_253954 ) ) ( not ( = ?auto_253952 ?auto_253953 ) ) ( not ( = ?auto_253952 ?auto_253954 ) ) ( not ( = ?auto_253953 ?auto_253954 ) ) ( ON ?auto_253953 ?auto_253954 ) ( ON ?auto_253952 ?auto_253953 ) ( ON ?auto_253951 ?auto_253952 ) ( ON ?auto_253950 ?auto_253951 ) ( ON ?auto_253949 ?auto_253950 ) ( ON ?auto_253948 ?auto_253949 ) ( ON ?auto_253947 ?auto_253948 ) ( ON ?auto_253946 ?auto_253947 ) ( ON ?auto_253945 ?auto_253946 ) ( CLEAR ?auto_253943 ) ( ON ?auto_253944 ?auto_253945 ) ( CLEAR ?auto_253944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_253942 ?auto_253943 ?auto_253944 )
      ( MAKE-13PILE ?auto_253942 ?auto_253943 ?auto_253944 ?auto_253945 ?auto_253946 ?auto_253947 ?auto_253948 ?auto_253949 ?auto_253950 ?auto_253951 ?auto_253952 ?auto_253953 ?auto_253954 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253968 - BLOCK
      ?auto_253969 - BLOCK
      ?auto_253970 - BLOCK
      ?auto_253971 - BLOCK
      ?auto_253972 - BLOCK
      ?auto_253973 - BLOCK
      ?auto_253974 - BLOCK
      ?auto_253975 - BLOCK
      ?auto_253976 - BLOCK
      ?auto_253977 - BLOCK
      ?auto_253978 - BLOCK
      ?auto_253979 - BLOCK
      ?auto_253980 - BLOCK
    )
    :vars
    (
      ?auto_253981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_253980 ?auto_253981 ) ( ON-TABLE ?auto_253968 ) ( not ( = ?auto_253968 ?auto_253969 ) ) ( not ( = ?auto_253968 ?auto_253970 ) ) ( not ( = ?auto_253968 ?auto_253971 ) ) ( not ( = ?auto_253968 ?auto_253972 ) ) ( not ( = ?auto_253968 ?auto_253973 ) ) ( not ( = ?auto_253968 ?auto_253974 ) ) ( not ( = ?auto_253968 ?auto_253975 ) ) ( not ( = ?auto_253968 ?auto_253976 ) ) ( not ( = ?auto_253968 ?auto_253977 ) ) ( not ( = ?auto_253968 ?auto_253978 ) ) ( not ( = ?auto_253968 ?auto_253979 ) ) ( not ( = ?auto_253968 ?auto_253980 ) ) ( not ( = ?auto_253968 ?auto_253981 ) ) ( not ( = ?auto_253969 ?auto_253970 ) ) ( not ( = ?auto_253969 ?auto_253971 ) ) ( not ( = ?auto_253969 ?auto_253972 ) ) ( not ( = ?auto_253969 ?auto_253973 ) ) ( not ( = ?auto_253969 ?auto_253974 ) ) ( not ( = ?auto_253969 ?auto_253975 ) ) ( not ( = ?auto_253969 ?auto_253976 ) ) ( not ( = ?auto_253969 ?auto_253977 ) ) ( not ( = ?auto_253969 ?auto_253978 ) ) ( not ( = ?auto_253969 ?auto_253979 ) ) ( not ( = ?auto_253969 ?auto_253980 ) ) ( not ( = ?auto_253969 ?auto_253981 ) ) ( not ( = ?auto_253970 ?auto_253971 ) ) ( not ( = ?auto_253970 ?auto_253972 ) ) ( not ( = ?auto_253970 ?auto_253973 ) ) ( not ( = ?auto_253970 ?auto_253974 ) ) ( not ( = ?auto_253970 ?auto_253975 ) ) ( not ( = ?auto_253970 ?auto_253976 ) ) ( not ( = ?auto_253970 ?auto_253977 ) ) ( not ( = ?auto_253970 ?auto_253978 ) ) ( not ( = ?auto_253970 ?auto_253979 ) ) ( not ( = ?auto_253970 ?auto_253980 ) ) ( not ( = ?auto_253970 ?auto_253981 ) ) ( not ( = ?auto_253971 ?auto_253972 ) ) ( not ( = ?auto_253971 ?auto_253973 ) ) ( not ( = ?auto_253971 ?auto_253974 ) ) ( not ( = ?auto_253971 ?auto_253975 ) ) ( not ( = ?auto_253971 ?auto_253976 ) ) ( not ( = ?auto_253971 ?auto_253977 ) ) ( not ( = ?auto_253971 ?auto_253978 ) ) ( not ( = ?auto_253971 ?auto_253979 ) ) ( not ( = ?auto_253971 ?auto_253980 ) ) ( not ( = ?auto_253971 ?auto_253981 ) ) ( not ( = ?auto_253972 ?auto_253973 ) ) ( not ( = ?auto_253972 ?auto_253974 ) ) ( not ( = ?auto_253972 ?auto_253975 ) ) ( not ( = ?auto_253972 ?auto_253976 ) ) ( not ( = ?auto_253972 ?auto_253977 ) ) ( not ( = ?auto_253972 ?auto_253978 ) ) ( not ( = ?auto_253972 ?auto_253979 ) ) ( not ( = ?auto_253972 ?auto_253980 ) ) ( not ( = ?auto_253972 ?auto_253981 ) ) ( not ( = ?auto_253973 ?auto_253974 ) ) ( not ( = ?auto_253973 ?auto_253975 ) ) ( not ( = ?auto_253973 ?auto_253976 ) ) ( not ( = ?auto_253973 ?auto_253977 ) ) ( not ( = ?auto_253973 ?auto_253978 ) ) ( not ( = ?auto_253973 ?auto_253979 ) ) ( not ( = ?auto_253973 ?auto_253980 ) ) ( not ( = ?auto_253973 ?auto_253981 ) ) ( not ( = ?auto_253974 ?auto_253975 ) ) ( not ( = ?auto_253974 ?auto_253976 ) ) ( not ( = ?auto_253974 ?auto_253977 ) ) ( not ( = ?auto_253974 ?auto_253978 ) ) ( not ( = ?auto_253974 ?auto_253979 ) ) ( not ( = ?auto_253974 ?auto_253980 ) ) ( not ( = ?auto_253974 ?auto_253981 ) ) ( not ( = ?auto_253975 ?auto_253976 ) ) ( not ( = ?auto_253975 ?auto_253977 ) ) ( not ( = ?auto_253975 ?auto_253978 ) ) ( not ( = ?auto_253975 ?auto_253979 ) ) ( not ( = ?auto_253975 ?auto_253980 ) ) ( not ( = ?auto_253975 ?auto_253981 ) ) ( not ( = ?auto_253976 ?auto_253977 ) ) ( not ( = ?auto_253976 ?auto_253978 ) ) ( not ( = ?auto_253976 ?auto_253979 ) ) ( not ( = ?auto_253976 ?auto_253980 ) ) ( not ( = ?auto_253976 ?auto_253981 ) ) ( not ( = ?auto_253977 ?auto_253978 ) ) ( not ( = ?auto_253977 ?auto_253979 ) ) ( not ( = ?auto_253977 ?auto_253980 ) ) ( not ( = ?auto_253977 ?auto_253981 ) ) ( not ( = ?auto_253978 ?auto_253979 ) ) ( not ( = ?auto_253978 ?auto_253980 ) ) ( not ( = ?auto_253978 ?auto_253981 ) ) ( not ( = ?auto_253979 ?auto_253980 ) ) ( not ( = ?auto_253979 ?auto_253981 ) ) ( not ( = ?auto_253980 ?auto_253981 ) ) ( ON ?auto_253979 ?auto_253980 ) ( ON ?auto_253978 ?auto_253979 ) ( ON ?auto_253977 ?auto_253978 ) ( ON ?auto_253976 ?auto_253977 ) ( ON ?auto_253975 ?auto_253976 ) ( ON ?auto_253974 ?auto_253975 ) ( ON ?auto_253973 ?auto_253974 ) ( ON ?auto_253972 ?auto_253973 ) ( ON ?auto_253971 ?auto_253972 ) ( ON ?auto_253970 ?auto_253971 ) ( CLEAR ?auto_253968 ) ( ON ?auto_253969 ?auto_253970 ) ( CLEAR ?auto_253969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_253968 ?auto_253969 )
      ( MAKE-13PILE ?auto_253968 ?auto_253969 ?auto_253970 ?auto_253971 ?auto_253972 ?auto_253973 ?auto_253974 ?auto_253975 ?auto_253976 ?auto_253977 ?auto_253978 ?auto_253979 ?auto_253980 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_253995 - BLOCK
      ?auto_253996 - BLOCK
      ?auto_253997 - BLOCK
      ?auto_253998 - BLOCK
      ?auto_253999 - BLOCK
      ?auto_254000 - BLOCK
      ?auto_254001 - BLOCK
      ?auto_254002 - BLOCK
      ?auto_254003 - BLOCK
      ?auto_254004 - BLOCK
      ?auto_254005 - BLOCK
      ?auto_254006 - BLOCK
      ?auto_254007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_254007 ) ( ON-TABLE ?auto_253995 ) ( not ( = ?auto_253995 ?auto_253996 ) ) ( not ( = ?auto_253995 ?auto_253997 ) ) ( not ( = ?auto_253995 ?auto_253998 ) ) ( not ( = ?auto_253995 ?auto_253999 ) ) ( not ( = ?auto_253995 ?auto_254000 ) ) ( not ( = ?auto_253995 ?auto_254001 ) ) ( not ( = ?auto_253995 ?auto_254002 ) ) ( not ( = ?auto_253995 ?auto_254003 ) ) ( not ( = ?auto_253995 ?auto_254004 ) ) ( not ( = ?auto_253995 ?auto_254005 ) ) ( not ( = ?auto_253995 ?auto_254006 ) ) ( not ( = ?auto_253995 ?auto_254007 ) ) ( not ( = ?auto_253996 ?auto_253997 ) ) ( not ( = ?auto_253996 ?auto_253998 ) ) ( not ( = ?auto_253996 ?auto_253999 ) ) ( not ( = ?auto_253996 ?auto_254000 ) ) ( not ( = ?auto_253996 ?auto_254001 ) ) ( not ( = ?auto_253996 ?auto_254002 ) ) ( not ( = ?auto_253996 ?auto_254003 ) ) ( not ( = ?auto_253996 ?auto_254004 ) ) ( not ( = ?auto_253996 ?auto_254005 ) ) ( not ( = ?auto_253996 ?auto_254006 ) ) ( not ( = ?auto_253996 ?auto_254007 ) ) ( not ( = ?auto_253997 ?auto_253998 ) ) ( not ( = ?auto_253997 ?auto_253999 ) ) ( not ( = ?auto_253997 ?auto_254000 ) ) ( not ( = ?auto_253997 ?auto_254001 ) ) ( not ( = ?auto_253997 ?auto_254002 ) ) ( not ( = ?auto_253997 ?auto_254003 ) ) ( not ( = ?auto_253997 ?auto_254004 ) ) ( not ( = ?auto_253997 ?auto_254005 ) ) ( not ( = ?auto_253997 ?auto_254006 ) ) ( not ( = ?auto_253997 ?auto_254007 ) ) ( not ( = ?auto_253998 ?auto_253999 ) ) ( not ( = ?auto_253998 ?auto_254000 ) ) ( not ( = ?auto_253998 ?auto_254001 ) ) ( not ( = ?auto_253998 ?auto_254002 ) ) ( not ( = ?auto_253998 ?auto_254003 ) ) ( not ( = ?auto_253998 ?auto_254004 ) ) ( not ( = ?auto_253998 ?auto_254005 ) ) ( not ( = ?auto_253998 ?auto_254006 ) ) ( not ( = ?auto_253998 ?auto_254007 ) ) ( not ( = ?auto_253999 ?auto_254000 ) ) ( not ( = ?auto_253999 ?auto_254001 ) ) ( not ( = ?auto_253999 ?auto_254002 ) ) ( not ( = ?auto_253999 ?auto_254003 ) ) ( not ( = ?auto_253999 ?auto_254004 ) ) ( not ( = ?auto_253999 ?auto_254005 ) ) ( not ( = ?auto_253999 ?auto_254006 ) ) ( not ( = ?auto_253999 ?auto_254007 ) ) ( not ( = ?auto_254000 ?auto_254001 ) ) ( not ( = ?auto_254000 ?auto_254002 ) ) ( not ( = ?auto_254000 ?auto_254003 ) ) ( not ( = ?auto_254000 ?auto_254004 ) ) ( not ( = ?auto_254000 ?auto_254005 ) ) ( not ( = ?auto_254000 ?auto_254006 ) ) ( not ( = ?auto_254000 ?auto_254007 ) ) ( not ( = ?auto_254001 ?auto_254002 ) ) ( not ( = ?auto_254001 ?auto_254003 ) ) ( not ( = ?auto_254001 ?auto_254004 ) ) ( not ( = ?auto_254001 ?auto_254005 ) ) ( not ( = ?auto_254001 ?auto_254006 ) ) ( not ( = ?auto_254001 ?auto_254007 ) ) ( not ( = ?auto_254002 ?auto_254003 ) ) ( not ( = ?auto_254002 ?auto_254004 ) ) ( not ( = ?auto_254002 ?auto_254005 ) ) ( not ( = ?auto_254002 ?auto_254006 ) ) ( not ( = ?auto_254002 ?auto_254007 ) ) ( not ( = ?auto_254003 ?auto_254004 ) ) ( not ( = ?auto_254003 ?auto_254005 ) ) ( not ( = ?auto_254003 ?auto_254006 ) ) ( not ( = ?auto_254003 ?auto_254007 ) ) ( not ( = ?auto_254004 ?auto_254005 ) ) ( not ( = ?auto_254004 ?auto_254006 ) ) ( not ( = ?auto_254004 ?auto_254007 ) ) ( not ( = ?auto_254005 ?auto_254006 ) ) ( not ( = ?auto_254005 ?auto_254007 ) ) ( not ( = ?auto_254006 ?auto_254007 ) ) ( ON ?auto_254006 ?auto_254007 ) ( ON ?auto_254005 ?auto_254006 ) ( ON ?auto_254004 ?auto_254005 ) ( ON ?auto_254003 ?auto_254004 ) ( ON ?auto_254002 ?auto_254003 ) ( ON ?auto_254001 ?auto_254002 ) ( ON ?auto_254000 ?auto_254001 ) ( ON ?auto_253999 ?auto_254000 ) ( ON ?auto_253998 ?auto_253999 ) ( ON ?auto_253997 ?auto_253998 ) ( CLEAR ?auto_253995 ) ( ON ?auto_253996 ?auto_253997 ) ( CLEAR ?auto_253996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_253995 ?auto_253996 )
      ( MAKE-13PILE ?auto_253995 ?auto_253996 ?auto_253997 ?auto_253998 ?auto_253999 ?auto_254000 ?auto_254001 ?auto_254002 ?auto_254003 ?auto_254004 ?auto_254005 ?auto_254006 ?auto_254007 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_254021 - BLOCK
      ?auto_254022 - BLOCK
      ?auto_254023 - BLOCK
      ?auto_254024 - BLOCK
      ?auto_254025 - BLOCK
      ?auto_254026 - BLOCK
      ?auto_254027 - BLOCK
      ?auto_254028 - BLOCK
      ?auto_254029 - BLOCK
      ?auto_254030 - BLOCK
      ?auto_254031 - BLOCK
      ?auto_254032 - BLOCK
      ?auto_254033 - BLOCK
    )
    :vars
    (
      ?auto_254034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254033 ?auto_254034 ) ( not ( = ?auto_254021 ?auto_254022 ) ) ( not ( = ?auto_254021 ?auto_254023 ) ) ( not ( = ?auto_254021 ?auto_254024 ) ) ( not ( = ?auto_254021 ?auto_254025 ) ) ( not ( = ?auto_254021 ?auto_254026 ) ) ( not ( = ?auto_254021 ?auto_254027 ) ) ( not ( = ?auto_254021 ?auto_254028 ) ) ( not ( = ?auto_254021 ?auto_254029 ) ) ( not ( = ?auto_254021 ?auto_254030 ) ) ( not ( = ?auto_254021 ?auto_254031 ) ) ( not ( = ?auto_254021 ?auto_254032 ) ) ( not ( = ?auto_254021 ?auto_254033 ) ) ( not ( = ?auto_254021 ?auto_254034 ) ) ( not ( = ?auto_254022 ?auto_254023 ) ) ( not ( = ?auto_254022 ?auto_254024 ) ) ( not ( = ?auto_254022 ?auto_254025 ) ) ( not ( = ?auto_254022 ?auto_254026 ) ) ( not ( = ?auto_254022 ?auto_254027 ) ) ( not ( = ?auto_254022 ?auto_254028 ) ) ( not ( = ?auto_254022 ?auto_254029 ) ) ( not ( = ?auto_254022 ?auto_254030 ) ) ( not ( = ?auto_254022 ?auto_254031 ) ) ( not ( = ?auto_254022 ?auto_254032 ) ) ( not ( = ?auto_254022 ?auto_254033 ) ) ( not ( = ?auto_254022 ?auto_254034 ) ) ( not ( = ?auto_254023 ?auto_254024 ) ) ( not ( = ?auto_254023 ?auto_254025 ) ) ( not ( = ?auto_254023 ?auto_254026 ) ) ( not ( = ?auto_254023 ?auto_254027 ) ) ( not ( = ?auto_254023 ?auto_254028 ) ) ( not ( = ?auto_254023 ?auto_254029 ) ) ( not ( = ?auto_254023 ?auto_254030 ) ) ( not ( = ?auto_254023 ?auto_254031 ) ) ( not ( = ?auto_254023 ?auto_254032 ) ) ( not ( = ?auto_254023 ?auto_254033 ) ) ( not ( = ?auto_254023 ?auto_254034 ) ) ( not ( = ?auto_254024 ?auto_254025 ) ) ( not ( = ?auto_254024 ?auto_254026 ) ) ( not ( = ?auto_254024 ?auto_254027 ) ) ( not ( = ?auto_254024 ?auto_254028 ) ) ( not ( = ?auto_254024 ?auto_254029 ) ) ( not ( = ?auto_254024 ?auto_254030 ) ) ( not ( = ?auto_254024 ?auto_254031 ) ) ( not ( = ?auto_254024 ?auto_254032 ) ) ( not ( = ?auto_254024 ?auto_254033 ) ) ( not ( = ?auto_254024 ?auto_254034 ) ) ( not ( = ?auto_254025 ?auto_254026 ) ) ( not ( = ?auto_254025 ?auto_254027 ) ) ( not ( = ?auto_254025 ?auto_254028 ) ) ( not ( = ?auto_254025 ?auto_254029 ) ) ( not ( = ?auto_254025 ?auto_254030 ) ) ( not ( = ?auto_254025 ?auto_254031 ) ) ( not ( = ?auto_254025 ?auto_254032 ) ) ( not ( = ?auto_254025 ?auto_254033 ) ) ( not ( = ?auto_254025 ?auto_254034 ) ) ( not ( = ?auto_254026 ?auto_254027 ) ) ( not ( = ?auto_254026 ?auto_254028 ) ) ( not ( = ?auto_254026 ?auto_254029 ) ) ( not ( = ?auto_254026 ?auto_254030 ) ) ( not ( = ?auto_254026 ?auto_254031 ) ) ( not ( = ?auto_254026 ?auto_254032 ) ) ( not ( = ?auto_254026 ?auto_254033 ) ) ( not ( = ?auto_254026 ?auto_254034 ) ) ( not ( = ?auto_254027 ?auto_254028 ) ) ( not ( = ?auto_254027 ?auto_254029 ) ) ( not ( = ?auto_254027 ?auto_254030 ) ) ( not ( = ?auto_254027 ?auto_254031 ) ) ( not ( = ?auto_254027 ?auto_254032 ) ) ( not ( = ?auto_254027 ?auto_254033 ) ) ( not ( = ?auto_254027 ?auto_254034 ) ) ( not ( = ?auto_254028 ?auto_254029 ) ) ( not ( = ?auto_254028 ?auto_254030 ) ) ( not ( = ?auto_254028 ?auto_254031 ) ) ( not ( = ?auto_254028 ?auto_254032 ) ) ( not ( = ?auto_254028 ?auto_254033 ) ) ( not ( = ?auto_254028 ?auto_254034 ) ) ( not ( = ?auto_254029 ?auto_254030 ) ) ( not ( = ?auto_254029 ?auto_254031 ) ) ( not ( = ?auto_254029 ?auto_254032 ) ) ( not ( = ?auto_254029 ?auto_254033 ) ) ( not ( = ?auto_254029 ?auto_254034 ) ) ( not ( = ?auto_254030 ?auto_254031 ) ) ( not ( = ?auto_254030 ?auto_254032 ) ) ( not ( = ?auto_254030 ?auto_254033 ) ) ( not ( = ?auto_254030 ?auto_254034 ) ) ( not ( = ?auto_254031 ?auto_254032 ) ) ( not ( = ?auto_254031 ?auto_254033 ) ) ( not ( = ?auto_254031 ?auto_254034 ) ) ( not ( = ?auto_254032 ?auto_254033 ) ) ( not ( = ?auto_254032 ?auto_254034 ) ) ( not ( = ?auto_254033 ?auto_254034 ) ) ( ON ?auto_254032 ?auto_254033 ) ( ON ?auto_254031 ?auto_254032 ) ( ON ?auto_254030 ?auto_254031 ) ( ON ?auto_254029 ?auto_254030 ) ( ON ?auto_254028 ?auto_254029 ) ( ON ?auto_254027 ?auto_254028 ) ( ON ?auto_254026 ?auto_254027 ) ( ON ?auto_254025 ?auto_254026 ) ( ON ?auto_254024 ?auto_254025 ) ( ON ?auto_254023 ?auto_254024 ) ( ON ?auto_254022 ?auto_254023 ) ( ON ?auto_254021 ?auto_254022 ) ( CLEAR ?auto_254021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254021 )
      ( MAKE-13PILE ?auto_254021 ?auto_254022 ?auto_254023 ?auto_254024 ?auto_254025 ?auto_254026 ?auto_254027 ?auto_254028 ?auto_254029 ?auto_254030 ?auto_254031 ?auto_254032 ?auto_254033 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_254048 - BLOCK
      ?auto_254049 - BLOCK
      ?auto_254050 - BLOCK
      ?auto_254051 - BLOCK
      ?auto_254052 - BLOCK
      ?auto_254053 - BLOCK
      ?auto_254054 - BLOCK
      ?auto_254055 - BLOCK
      ?auto_254056 - BLOCK
      ?auto_254057 - BLOCK
      ?auto_254058 - BLOCK
      ?auto_254059 - BLOCK
      ?auto_254060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_254060 ) ( not ( = ?auto_254048 ?auto_254049 ) ) ( not ( = ?auto_254048 ?auto_254050 ) ) ( not ( = ?auto_254048 ?auto_254051 ) ) ( not ( = ?auto_254048 ?auto_254052 ) ) ( not ( = ?auto_254048 ?auto_254053 ) ) ( not ( = ?auto_254048 ?auto_254054 ) ) ( not ( = ?auto_254048 ?auto_254055 ) ) ( not ( = ?auto_254048 ?auto_254056 ) ) ( not ( = ?auto_254048 ?auto_254057 ) ) ( not ( = ?auto_254048 ?auto_254058 ) ) ( not ( = ?auto_254048 ?auto_254059 ) ) ( not ( = ?auto_254048 ?auto_254060 ) ) ( not ( = ?auto_254049 ?auto_254050 ) ) ( not ( = ?auto_254049 ?auto_254051 ) ) ( not ( = ?auto_254049 ?auto_254052 ) ) ( not ( = ?auto_254049 ?auto_254053 ) ) ( not ( = ?auto_254049 ?auto_254054 ) ) ( not ( = ?auto_254049 ?auto_254055 ) ) ( not ( = ?auto_254049 ?auto_254056 ) ) ( not ( = ?auto_254049 ?auto_254057 ) ) ( not ( = ?auto_254049 ?auto_254058 ) ) ( not ( = ?auto_254049 ?auto_254059 ) ) ( not ( = ?auto_254049 ?auto_254060 ) ) ( not ( = ?auto_254050 ?auto_254051 ) ) ( not ( = ?auto_254050 ?auto_254052 ) ) ( not ( = ?auto_254050 ?auto_254053 ) ) ( not ( = ?auto_254050 ?auto_254054 ) ) ( not ( = ?auto_254050 ?auto_254055 ) ) ( not ( = ?auto_254050 ?auto_254056 ) ) ( not ( = ?auto_254050 ?auto_254057 ) ) ( not ( = ?auto_254050 ?auto_254058 ) ) ( not ( = ?auto_254050 ?auto_254059 ) ) ( not ( = ?auto_254050 ?auto_254060 ) ) ( not ( = ?auto_254051 ?auto_254052 ) ) ( not ( = ?auto_254051 ?auto_254053 ) ) ( not ( = ?auto_254051 ?auto_254054 ) ) ( not ( = ?auto_254051 ?auto_254055 ) ) ( not ( = ?auto_254051 ?auto_254056 ) ) ( not ( = ?auto_254051 ?auto_254057 ) ) ( not ( = ?auto_254051 ?auto_254058 ) ) ( not ( = ?auto_254051 ?auto_254059 ) ) ( not ( = ?auto_254051 ?auto_254060 ) ) ( not ( = ?auto_254052 ?auto_254053 ) ) ( not ( = ?auto_254052 ?auto_254054 ) ) ( not ( = ?auto_254052 ?auto_254055 ) ) ( not ( = ?auto_254052 ?auto_254056 ) ) ( not ( = ?auto_254052 ?auto_254057 ) ) ( not ( = ?auto_254052 ?auto_254058 ) ) ( not ( = ?auto_254052 ?auto_254059 ) ) ( not ( = ?auto_254052 ?auto_254060 ) ) ( not ( = ?auto_254053 ?auto_254054 ) ) ( not ( = ?auto_254053 ?auto_254055 ) ) ( not ( = ?auto_254053 ?auto_254056 ) ) ( not ( = ?auto_254053 ?auto_254057 ) ) ( not ( = ?auto_254053 ?auto_254058 ) ) ( not ( = ?auto_254053 ?auto_254059 ) ) ( not ( = ?auto_254053 ?auto_254060 ) ) ( not ( = ?auto_254054 ?auto_254055 ) ) ( not ( = ?auto_254054 ?auto_254056 ) ) ( not ( = ?auto_254054 ?auto_254057 ) ) ( not ( = ?auto_254054 ?auto_254058 ) ) ( not ( = ?auto_254054 ?auto_254059 ) ) ( not ( = ?auto_254054 ?auto_254060 ) ) ( not ( = ?auto_254055 ?auto_254056 ) ) ( not ( = ?auto_254055 ?auto_254057 ) ) ( not ( = ?auto_254055 ?auto_254058 ) ) ( not ( = ?auto_254055 ?auto_254059 ) ) ( not ( = ?auto_254055 ?auto_254060 ) ) ( not ( = ?auto_254056 ?auto_254057 ) ) ( not ( = ?auto_254056 ?auto_254058 ) ) ( not ( = ?auto_254056 ?auto_254059 ) ) ( not ( = ?auto_254056 ?auto_254060 ) ) ( not ( = ?auto_254057 ?auto_254058 ) ) ( not ( = ?auto_254057 ?auto_254059 ) ) ( not ( = ?auto_254057 ?auto_254060 ) ) ( not ( = ?auto_254058 ?auto_254059 ) ) ( not ( = ?auto_254058 ?auto_254060 ) ) ( not ( = ?auto_254059 ?auto_254060 ) ) ( ON ?auto_254059 ?auto_254060 ) ( ON ?auto_254058 ?auto_254059 ) ( ON ?auto_254057 ?auto_254058 ) ( ON ?auto_254056 ?auto_254057 ) ( ON ?auto_254055 ?auto_254056 ) ( ON ?auto_254054 ?auto_254055 ) ( ON ?auto_254053 ?auto_254054 ) ( ON ?auto_254052 ?auto_254053 ) ( ON ?auto_254051 ?auto_254052 ) ( ON ?auto_254050 ?auto_254051 ) ( ON ?auto_254049 ?auto_254050 ) ( ON ?auto_254048 ?auto_254049 ) ( CLEAR ?auto_254048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_254048 )
      ( MAKE-13PILE ?auto_254048 ?auto_254049 ?auto_254050 ?auto_254051 ?auto_254052 ?auto_254053 ?auto_254054 ?auto_254055 ?auto_254056 ?auto_254057 ?auto_254058 ?auto_254059 ?auto_254060 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_254074 - BLOCK
      ?auto_254075 - BLOCK
      ?auto_254076 - BLOCK
      ?auto_254077 - BLOCK
      ?auto_254078 - BLOCK
      ?auto_254079 - BLOCK
      ?auto_254080 - BLOCK
      ?auto_254081 - BLOCK
      ?auto_254082 - BLOCK
      ?auto_254083 - BLOCK
      ?auto_254084 - BLOCK
      ?auto_254085 - BLOCK
      ?auto_254086 - BLOCK
    )
    :vars
    (
      ?auto_254087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_254074 ?auto_254075 ) ) ( not ( = ?auto_254074 ?auto_254076 ) ) ( not ( = ?auto_254074 ?auto_254077 ) ) ( not ( = ?auto_254074 ?auto_254078 ) ) ( not ( = ?auto_254074 ?auto_254079 ) ) ( not ( = ?auto_254074 ?auto_254080 ) ) ( not ( = ?auto_254074 ?auto_254081 ) ) ( not ( = ?auto_254074 ?auto_254082 ) ) ( not ( = ?auto_254074 ?auto_254083 ) ) ( not ( = ?auto_254074 ?auto_254084 ) ) ( not ( = ?auto_254074 ?auto_254085 ) ) ( not ( = ?auto_254074 ?auto_254086 ) ) ( not ( = ?auto_254075 ?auto_254076 ) ) ( not ( = ?auto_254075 ?auto_254077 ) ) ( not ( = ?auto_254075 ?auto_254078 ) ) ( not ( = ?auto_254075 ?auto_254079 ) ) ( not ( = ?auto_254075 ?auto_254080 ) ) ( not ( = ?auto_254075 ?auto_254081 ) ) ( not ( = ?auto_254075 ?auto_254082 ) ) ( not ( = ?auto_254075 ?auto_254083 ) ) ( not ( = ?auto_254075 ?auto_254084 ) ) ( not ( = ?auto_254075 ?auto_254085 ) ) ( not ( = ?auto_254075 ?auto_254086 ) ) ( not ( = ?auto_254076 ?auto_254077 ) ) ( not ( = ?auto_254076 ?auto_254078 ) ) ( not ( = ?auto_254076 ?auto_254079 ) ) ( not ( = ?auto_254076 ?auto_254080 ) ) ( not ( = ?auto_254076 ?auto_254081 ) ) ( not ( = ?auto_254076 ?auto_254082 ) ) ( not ( = ?auto_254076 ?auto_254083 ) ) ( not ( = ?auto_254076 ?auto_254084 ) ) ( not ( = ?auto_254076 ?auto_254085 ) ) ( not ( = ?auto_254076 ?auto_254086 ) ) ( not ( = ?auto_254077 ?auto_254078 ) ) ( not ( = ?auto_254077 ?auto_254079 ) ) ( not ( = ?auto_254077 ?auto_254080 ) ) ( not ( = ?auto_254077 ?auto_254081 ) ) ( not ( = ?auto_254077 ?auto_254082 ) ) ( not ( = ?auto_254077 ?auto_254083 ) ) ( not ( = ?auto_254077 ?auto_254084 ) ) ( not ( = ?auto_254077 ?auto_254085 ) ) ( not ( = ?auto_254077 ?auto_254086 ) ) ( not ( = ?auto_254078 ?auto_254079 ) ) ( not ( = ?auto_254078 ?auto_254080 ) ) ( not ( = ?auto_254078 ?auto_254081 ) ) ( not ( = ?auto_254078 ?auto_254082 ) ) ( not ( = ?auto_254078 ?auto_254083 ) ) ( not ( = ?auto_254078 ?auto_254084 ) ) ( not ( = ?auto_254078 ?auto_254085 ) ) ( not ( = ?auto_254078 ?auto_254086 ) ) ( not ( = ?auto_254079 ?auto_254080 ) ) ( not ( = ?auto_254079 ?auto_254081 ) ) ( not ( = ?auto_254079 ?auto_254082 ) ) ( not ( = ?auto_254079 ?auto_254083 ) ) ( not ( = ?auto_254079 ?auto_254084 ) ) ( not ( = ?auto_254079 ?auto_254085 ) ) ( not ( = ?auto_254079 ?auto_254086 ) ) ( not ( = ?auto_254080 ?auto_254081 ) ) ( not ( = ?auto_254080 ?auto_254082 ) ) ( not ( = ?auto_254080 ?auto_254083 ) ) ( not ( = ?auto_254080 ?auto_254084 ) ) ( not ( = ?auto_254080 ?auto_254085 ) ) ( not ( = ?auto_254080 ?auto_254086 ) ) ( not ( = ?auto_254081 ?auto_254082 ) ) ( not ( = ?auto_254081 ?auto_254083 ) ) ( not ( = ?auto_254081 ?auto_254084 ) ) ( not ( = ?auto_254081 ?auto_254085 ) ) ( not ( = ?auto_254081 ?auto_254086 ) ) ( not ( = ?auto_254082 ?auto_254083 ) ) ( not ( = ?auto_254082 ?auto_254084 ) ) ( not ( = ?auto_254082 ?auto_254085 ) ) ( not ( = ?auto_254082 ?auto_254086 ) ) ( not ( = ?auto_254083 ?auto_254084 ) ) ( not ( = ?auto_254083 ?auto_254085 ) ) ( not ( = ?auto_254083 ?auto_254086 ) ) ( not ( = ?auto_254084 ?auto_254085 ) ) ( not ( = ?auto_254084 ?auto_254086 ) ) ( not ( = ?auto_254085 ?auto_254086 ) ) ( ON ?auto_254074 ?auto_254087 ) ( not ( = ?auto_254086 ?auto_254087 ) ) ( not ( = ?auto_254085 ?auto_254087 ) ) ( not ( = ?auto_254084 ?auto_254087 ) ) ( not ( = ?auto_254083 ?auto_254087 ) ) ( not ( = ?auto_254082 ?auto_254087 ) ) ( not ( = ?auto_254081 ?auto_254087 ) ) ( not ( = ?auto_254080 ?auto_254087 ) ) ( not ( = ?auto_254079 ?auto_254087 ) ) ( not ( = ?auto_254078 ?auto_254087 ) ) ( not ( = ?auto_254077 ?auto_254087 ) ) ( not ( = ?auto_254076 ?auto_254087 ) ) ( not ( = ?auto_254075 ?auto_254087 ) ) ( not ( = ?auto_254074 ?auto_254087 ) ) ( ON ?auto_254075 ?auto_254074 ) ( ON ?auto_254076 ?auto_254075 ) ( ON ?auto_254077 ?auto_254076 ) ( ON ?auto_254078 ?auto_254077 ) ( ON ?auto_254079 ?auto_254078 ) ( ON ?auto_254080 ?auto_254079 ) ( ON ?auto_254081 ?auto_254080 ) ( ON ?auto_254082 ?auto_254081 ) ( ON ?auto_254083 ?auto_254082 ) ( ON ?auto_254084 ?auto_254083 ) ( ON ?auto_254085 ?auto_254084 ) ( ON ?auto_254086 ?auto_254085 ) ( CLEAR ?auto_254086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_254086 ?auto_254085 ?auto_254084 ?auto_254083 ?auto_254082 ?auto_254081 ?auto_254080 ?auto_254079 ?auto_254078 ?auto_254077 ?auto_254076 ?auto_254075 ?auto_254074 )
      ( MAKE-13PILE ?auto_254074 ?auto_254075 ?auto_254076 ?auto_254077 ?auto_254078 ?auto_254079 ?auto_254080 ?auto_254081 ?auto_254082 ?auto_254083 ?auto_254084 ?auto_254085 ?auto_254086 ) )
  )

)

