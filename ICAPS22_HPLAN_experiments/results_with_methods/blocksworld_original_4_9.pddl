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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11709 - BLOCK
      ?auto_11710 - BLOCK
      ?auto_11711 - BLOCK
      ?auto_11712 - BLOCK
    )
    :vars
    (
      ?auto_11713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11713 ?auto_11712 ) ( CLEAR ?auto_11713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11709 ) ( ON ?auto_11710 ?auto_11709 ) ( ON ?auto_11711 ?auto_11710 ) ( ON ?auto_11712 ?auto_11711 ) ( not ( = ?auto_11709 ?auto_11710 ) ) ( not ( = ?auto_11709 ?auto_11711 ) ) ( not ( = ?auto_11709 ?auto_11712 ) ) ( not ( = ?auto_11709 ?auto_11713 ) ) ( not ( = ?auto_11710 ?auto_11711 ) ) ( not ( = ?auto_11710 ?auto_11712 ) ) ( not ( = ?auto_11710 ?auto_11713 ) ) ( not ( = ?auto_11711 ?auto_11712 ) ) ( not ( = ?auto_11711 ?auto_11713 ) ) ( not ( = ?auto_11712 ?auto_11713 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11713 ?auto_11712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11715 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11715 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11716 - BLOCK
    )
    :vars
    (
      ?auto_11717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11716 ?auto_11717 ) ( CLEAR ?auto_11716 ) ( HAND-EMPTY ) ( not ( = ?auto_11716 ?auto_11717 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11716 ?auto_11717 )
      ( MAKE-1PILE ?auto_11716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11721 - BLOCK
      ?auto_11722 - BLOCK
      ?auto_11723 - BLOCK
    )
    :vars
    (
      ?auto_11724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11724 ?auto_11723 ) ( CLEAR ?auto_11724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11721 ) ( ON ?auto_11722 ?auto_11721 ) ( ON ?auto_11723 ?auto_11722 ) ( not ( = ?auto_11721 ?auto_11722 ) ) ( not ( = ?auto_11721 ?auto_11723 ) ) ( not ( = ?auto_11721 ?auto_11724 ) ) ( not ( = ?auto_11722 ?auto_11723 ) ) ( not ( = ?auto_11722 ?auto_11724 ) ) ( not ( = ?auto_11723 ?auto_11724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11724 ?auto_11723 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11725 - BLOCK
      ?auto_11726 - BLOCK
      ?auto_11727 - BLOCK
    )
    :vars
    (
      ?auto_11728 - BLOCK
      ?auto_11729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11728 ?auto_11727 ) ( CLEAR ?auto_11728 ) ( ON-TABLE ?auto_11725 ) ( ON ?auto_11726 ?auto_11725 ) ( ON ?auto_11727 ?auto_11726 ) ( not ( = ?auto_11725 ?auto_11726 ) ) ( not ( = ?auto_11725 ?auto_11727 ) ) ( not ( = ?auto_11725 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( HOLDING ?auto_11729 ) ( not ( = ?auto_11725 ?auto_11729 ) ) ( not ( = ?auto_11726 ?auto_11729 ) ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( not ( = ?auto_11728 ?auto_11729 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11729 )
      ( MAKE-3PILE ?auto_11725 ?auto_11726 ?auto_11727 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11730 - BLOCK
      ?auto_11731 - BLOCK
      ?auto_11732 - BLOCK
    )
    :vars
    (
      ?auto_11734 - BLOCK
      ?auto_11733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11734 ?auto_11732 ) ( ON-TABLE ?auto_11730 ) ( ON ?auto_11731 ?auto_11730 ) ( ON ?auto_11732 ?auto_11731 ) ( not ( = ?auto_11730 ?auto_11731 ) ) ( not ( = ?auto_11730 ?auto_11732 ) ) ( not ( = ?auto_11730 ?auto_11734 ) ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11734 ) ) ( not ( = ?auto_11732 ?auto_11734 ) ) ( not ( = ?auto_11730 ?auto_11733 ) ) ( not ( = ?auto_11731 ?auto_11733 ) ) ( not ( = ?auto_11732 ?auto_11733 ) ) ( not ( = ?auto_11734 ?auto_11733 ) ) ( ON ?auto_11733 ?auto_11734 ) ( CLEAR ?auto_11733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11730 ?auto_11731 ?auto_11732 ?auto_11734 )
      ( MAKE-3PILE ?auto_11730 ?auto_11731 ?auto_11732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11737 - BLOCK
      ?auto_11738 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11738 ) ( CLEAR ?auto_11737 ) ( ON-TABLE ?auto_11737 ) ( not ( = ?auto_11737 ?auto_11738 ) ) )
    :subtasks
    ( ( !STACK ?auto_11738 ?auto_11737 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11739 - BLOCK
      ?auto_11740 - BLOCK
    )
    :vars
    (
      ?auto_11741 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11739 ) ( ON-TABLE ?auto_11739 ) ( not ( = ?auto_11739 ?auto_11740 ) ) ( ON ?auto_11740 ?auto_11741 ) ( CLEAR ?auto_11740 ) ( HAND-EMPTY ) ( not ( = ?auto_11739 ?auto_11741 ) ) ( not ( = ?auto_11740 ?auto_11741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11740 ?auto_11741 )
      ( MAKE-2PILE ?auto_11739 ?auto_11740 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11742 - BLOCK
      ?auto_11743 - BLOCK
    )
    :vars
    (
      ?auto_11744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11742 ?auto_11743 ) ) ( ON ?auto_11743 ?auto_11744 ) ( CLEAR ?auto_11743 ) ( not ( = ?auto_11742 ?auto_11744 ) ) ( not ( = ?auto_11743 ?auto_11744 ) ) ( HOLDING ?auto_11742 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11742 )
      ( MAKE-2PILE ?auto_11742 ?auto_11743 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11745 - BLOCK
      ?auto_11746 - BLOCK
    )
    :vars
    (
      ?auto_11747 - BLOCK
      ?auto_11749 - BLOCK
      ?auto_11748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11745 ?auto_11746 ) ) ( ON ?auto_11746 ?auto_11747 ) ( not ( = ?auto_11745 ?auto_11747 ) ) ( not ( = ?auto_11746 ?auto_11747 ) ) ( ON ?auto_11745 ?auto_11746 ) ( CLEAR ?auto_11745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11749 ) ( ON ?auto_11748 ?auto_11749 ) ( ON ?auto_11747 ?auto_11748 ) ( not ( = ?auto_11749 ?auto_11748 ) ) ( not ( = ?auto_11749 ?auto_11747 ) ) ( not ( = ?auto_11749 ?auto_11746 ) ) ( not ( = ?auto_11749 ?auto_11745 ) ) ( not ( = ?auto_11748 ?auto_11747 ) ) ( not ( = ?auto_11748 ?auto_11746 ) ) ( not ( = ?auto_11748 ?auto_11745 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11749 ?auto_11748 ?auto_11747 ?auto_11746 )
      ( MAKE-2PILE ?auto_11745 ?auto_11746 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11752 - BLOCK
      ?auto_11753 - BLOCK
    )
    :vars
    (
      ?auto_11754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11754 ?auto_11753 ) ( CLEAR ?auto_11754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11752 ) ( ON ?auto_11753 ?auto_11752 ) ( not ( = ?auto_11752 ?auto_11753 ) ) ( not ( = ?auto_11752 ?auto_11754 ) ) ( not ( = ?auto_11753 ?auto_11754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11754 ?auto_11753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11755 - BLOCK
      ?auto_11756 - BLOCK
    )
    :vars
    (
      ?auto_11757 - BLOCK
      ?auto_11758 - BLOCK
      ?auto_11759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11757 ?auto_11756 ) ( CLEAR ?auto_11757 ) ( ON-TABLE ?auto_11755 ) ( ON ?auto_11756 ?auto_11755 ) ( not ( = ?auto_11755 ?auto_11756 ) ) ( not ( = ?auto_11755 ?auto_11757 ) ) ( not ( = ?auto_11756 ?auto_11757 ) ) ( HOLDING ?auto_11758 ) ( CLEAR ?auto_11759 ) ( not ( = ?auto_11755 ?auto_11758 ) ) ( not ( = ?auto_11755 ?auto_11759 ) ) ( not ( = ?auto_11756 ?auto_11758 ) ) ( not ( = ?auto_11756 ?auto_11759 ) ) ( not ( = ?auto_11757 ?auto_11758 ) ) ( not ( = ?auto_11757 ?auto_11759 ) ) ( not ( = ?auto_11758 ?auto_11759 ) ) )
    :subtasks
    ( ( !STACK ?auto_11758 ?auto_11759 )
      ( MAKE-2PILE ?auto_11755 ?auto_11756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11760 - BLOCK
      ?auto_11761 - BLOCK
    )
    :vars
    (
      ?auto_11762 - BLOCK
      ?auto_11764 - BLOCK
      ?auto_11763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11762 ?auto_11761 ) ( ON-TABLE ?auto_11760 ) ( ON ?auto_11761 ?auto_11760 ) ( not ( = ?auto_11760 ?auto_11761 ) ) ( not ( = ?auto_11760 ?auto_11762 ) ) ( not ( = ?auto_11761 ?auto_11762 ) ) ( CLEAR ?auto_11764 ) ( not ( = ?auto_11760 ?auto_11763 ) ) ( not ( = ?auto_11760 ?auto_11764 ) ) ( not ( = ?auto_11761 ?auto_11763 ) ) ( not ( = ?auto_11761 ?auto_11764 ) ) ( not ( = ?auto_11762 ?auto_11763 ) ) ( not ( = ?auto_11762 ?auto_11764 ) ) ( not ( = ?auto_11763 ?auto_11764 ) ) ( ON ?auto_11763 ?auto_11762 ) ( CLEAR ?auto_11763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11760 ?auto_11761 ?auto_11762 )
      ( MAKE-2PILE ?auto_11760 ?auto_11761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11765 - BLOCK
      ?auto_11766 - BLOCK
    )
    :vars
    (
      ?auto_11768 - BLOCK
      ?auto_11767 - BLOCK
      ?auto_11769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11768 ?auto_11766 ) ( ON-TABLE ?auto_11765 ) ( ON ?auto_11766 ?auto_11765 ) ( not ( = ?auto_11765 ?auto_11766 ) ) ( not ( = ?auto_11765 ?auto_11768 ) ) ( not ( = ?auto_11766 ?auto_11768 ) ) ( not ( = ?auto_11765 ?auto_11767 ) ) ( not ( = ?auto_11765 ?auto_11769 ) ) ( not ( = ?auto_11766 ?auto_11767 ) ) ( not ( = ?auto_11766 ?auto_11769 ) ) ( not ( = ?auto_11768 ?auto_11767 ) ) ( not ( = ?auto_11768 ?auto_11769 ) ) ( not ( = ?auto_11767 ?auto_11769 ) ) ( ON ?auto_11767 ?auto_11768 ) ( CLEAR ?auto_11767 ) ( HOLDING ?auto_11769 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11769 )
      ( MAKE-2PILE ?auto_11765 ?auto_11766 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11770 - BLOCK
      ?auto_11771 - BLOCK
    )
    :vars
    (
      ?auto_11774 - BLOCK
      ?auto_11772 - BLOCK
      ?auto_11773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11774 ?auto_11771 ) ( ON-TABLE ?auto_11770 ) ( ON ?auto_11771 ?auto_11770 ) ( not ( = ?auto_11770 ?auto_11771 ) ) ( not ( = ?auto_11770 ?auto_11774 ) ) ( not ( = ?auto_11771 ?auto_11774 ) ) ( not ( = ?auto_11770 ?auto_11772 ) ) ( not ( = ?auto_11770 ?auto_11773 ) ) ( not ( = ?auto_11771 ?auto_11772 ) ) ( not ( = ?auto_11771 ?auto_11773 ) ) ( not ( = ?auto_11774 ?auto_11772 ) ) ( not ( = ?auto_11774 ?auto_11773 ) ) ( not ( = ?auto_11772 ?auto_11773 ) ) ( ON ?auto_11772 ?auto_11774 ) ( ON ?auto_11773 ?auto_11772 ) ( CLEAR ?auto_11773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11770 ?auto_11771 ?auto_11774 ?auto_11772 )
      ( MAKE-2PILE ?auto_11770 ?auto_11771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11778 - BLOCK
      ?auto_11779 - BLOCK
      ?auto_11780 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11780 ) ( CLEAR ?auto_11779 ) ( ON-TABLE ?auto_11778 ) ( ON ?auto_11779 ?auto_11778 ) ( not ( = ?auto_11778 ?auto_11779 ) ) ( not ( = ?auto_11778 ?auto_11780 ) ) ( not ( = ?auto_11779 ?auto_11780 ) ) )
    :subtasks
    ( ( !STACK ?auto_11780 ?auto_11779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11781 - BLOCK
      ?auto_11782 - BLOCK
      ?auto_11783 - BLOCK
    )
    :vars
    (
      ?auto_11784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11782 ) ( ON-TABLE ?auto_11781 ) ( ON ?auto_11782 ?auto_11781 ) ( not ( = ?auto_11781 ?auto_11782 ) ) ( not ( = ?auto_11781 ?auto_11783 ) ) ( not ( = ?auto_11782 ?auto_11783 ) ) ( ON ?auto_11783 ?auto_11784 ) ( CLEAR ?auto_11783 ) ( HAND-EMPTY ) ( not ( = ?auto_11781 ?auto_11784 ) ) ( not ( = ?auto_11782 ?auto_11784 ) ) ( not ( = ?auto_11783 ?auto_11784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11783 ?auto_11784 )
      ( MAKE-3PILE ?auto_11781 ?auto_11782 ?auto_11783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11785 - BLOCK
      ?auto_11786 - BLOCK
      ?auto_11787 - BLOCK
    )
    :vars
    (
      ?auto_11788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11785 ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( not ( = ?auto_11785 ?auto_11787 ) ) ( not ( = ?auto_11786 ?auto_11787 ) ) ( ON ?auto_11787 ?auto_11788 ) ( CLEAR ?auto_11787 ) ( not ( = ?auto_11785 ?auto_11788 ) ) ( not ( = ?auto_11786 ?auto_11788 ) ) ( not ( = ?auto_11787 ?auto_11788 ) ) ( HOLDING ?auto_11786 ) ( CLEAR ?auto_11785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11785 ?auto_11786 )
      ( MAKE-3PILE ?auto_11785 ?auto_11786 ?auto_11787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11789 - BLOCK
      ?auto_11790 - BLOCK
      ?auto_11791 - BLOCK
    )
    :vars
    (
      ?auto_11792 - BLOCK
      ?auto_11793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11789 ) ( not ( = ?auto_11789 ?auto_11790 ) ) ( not ( = ?auto_11789 ?auto_11791 ) ) ( not ( = ?auto_11790 ?auto_11791 ) ) ( ON ?auto_11791 ?auto_11792 ) ( not ( = ?auto_11789 ?auto_11792 ) ) ( not ( = ?auto_11790 ?auto_11792 ) ) ( not ( = ?auto_11791 ?auto_11792 ) ) ( CLEAR ?auto_11789 ) ( ON ?auto_11790 ?auto_11791 ) ( CLEAR ?auto_11790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11793 ) ( ON ?auto_11792 ?auto_11793 ) ( not ( = ?auto_11793 ?auto_11792 ) ) ( not ( = ?auto_11793 ?auto_11791 ) ) ( not ( = ?auto_11793 ?auto_11790 ) ) ( not ( = ?auto_11789 ?auto_11793 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11793 ?auto_11792 ?auto_11791 )
      ( MAKE-3PILE ?auto_11789 ?auto_11790 ?auto_11791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11794 - BLOCK
      ?auto_11795 - BLOCK
      ?auto_11796 - BLOCK
    )
    :vars
    (
      ?auto_11797 - BLOCK
      ?auto_11798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11794 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11796 ) ) ( not ( = ?auto_11795 ?auto_11796 ) ) ( ON ?auto_11796 ?auto_11797 ) ( not ( = ?auto_11794 ?auto_11797 ) ) ( not ( = ?auto_11795 ?auto_11797 ) ) ( not ( = ?auto_11796 ?auto_11797 ) ) ( ON ?auto_11795 ?auto_11796 ) ( CLEAR ?auto_11795 ) ( ON-TABLE ?auto_11798 ) ( ON ?auto_11797 ?auto_11798 ) ( not ( = ?auto_11798 ?auto_11797 ) ) ( not ( = ?auto_11798 ?auto_11796 ) ) ( not ( = ?auto_11798 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11798 ) ) ( HOLDING ?auto_11794 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11794 )
      ( MAKE-3PILE ?auto_11794 ?auto_11795 ?auto_11796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11799 - BLOCK
      ?auto_11800 - BLOCK
      ?auto_11801 - BLOCK
    )
    :vars
    (
      ?auto_11803 - BLOCK
      ?auto_11802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11799 ?auto_11800 ) ) ( not ( = ?auto_11799 ?auto_11801 ) ) ( not ( = ?auto_11800 ?auto_11801 ) ) ( ON ?auto_11801 ?auto_11803 ) ( not ( = ?auto_11799 ?auto_11803 ) ) ( not ( = ?auto_11800 ?auto_11803 ) ) ( not ( = ?auto_11801 ?auto_11803 ) ) ( ON ?auto_11800 ?auto_11801 ) ( ON-TABLE ?auto_11802 ) ( ON ?auto_11803 ?auto_11802 ) ( not ( = ?auto_11802 ?auto_11803 ) ) ( not ( = ?auto_11802 ?auto_11801 ) ) ( not ( = ?auto_11802 ?auto_11800 ) ) ( not ( = ?auto_11799 ?auto_11802 ) ) ( ON ?auto_11799 ?auto_11800 ) ( CLEAR ?auto_11799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11802 ?auto_11803 ?auto_11801 ?auto_11800 )
      ( MAKE-3PILE ?auto_11799 ?auto_11800 ?auto_11801 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11805 - BLOCK
    )
    :vars
    (
      ?auto_11806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11806 ?auto_11805 ) ( CLEAR ?auto_11806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11805 ) ( not ( = ?auto_11805 ?auto_11806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11806 ?auto_11805 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11807 - BLOCK
    )
    :vars
    (
      ?auto_11808 - BLOCK
      ?auto_11809 - BLOCK
      ?auto_11810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11808 ?auto_11807 ) ( CLEAR ?auto_11808 ) ( ON-TABLE ?auto_11807 ) ( not ( = ?auto_11807 ?auto_11808 ) ) ( HOLDING ?auto_11809 ) ( CLEAR ?auto_11810 ) ( not ( = ?auto_11807 ?auto_11809 ) ) ( not ( = ?auto_11807 ?auto_11810 ) ) ( not ( = ?auto_11808 ?auto_11809 ) ) ( not ( = ?auto_11808 ?auto_11810 ) ) ( not ( = ?auto_11809 ?auto_11810 ) ) )
    :subtasks
    ( ( !STACK ?auto_11809 ?auto_11810 )
      ( MAKE-1PILE ?auto_11807 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11811 - BLOCK
    )
    :vars
    (
      ?auto_11812 - BLOCK
      ?auto_11813 - BLOCK
      ?auto_11814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11812 ?auto_11811 ) ( ON-TABLE ?auto_11811 ) ( not ( = ?auto_11811 ?auto_11812 ) ) ( CLEAR ?auto_11813 ) ( not ( = ?auto_11811 ?auto_11814 ) ) ( not ( = ?auto_11811 ?auto_11813 ) ) ( not ( = ?auto_11812 ?auto_11814 ) ) ( not ( = ?auto_11812 ?auto_11813 ) ) ( not ( = ?auto_11814 ?auto_11813 ) ) ( ON ?auto_11814 ?auto_11812 ) ( CLEAR ?auto_11814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11811 ?auto_11812 )
      ( MAKE-1PILE ?auto_11811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11815 - BLOCK
    )
    :vars
    (
      ?auto_11818 - BLOCK
      ?auto_11816 - BLOCK
      ?auto_11817 - BLOCK
      ?auto_11819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11818 ?auto_11815 ) ( ON-TABLE ?auto_11815 ) ( not ( = ?auto_11815 ?auto_11818 ) ) ( not ( = ?auto_11815 ?auto_11816 ) ) ( not ( = ?auto_11815 ?auto_11817 ) ) ( not ( = ?auto_11818 ?auto_11816 ) ) ( not ( = ?auto_11818 ?auto_11817 ) ) ( not ( = ?auto_11816 ?auto_11817 ) ) ( ON ?auto_11816 ?auto_11818 ) ( CLEAR ?auto_11816 ) ( HOLDING ?auto_11817 ) ( CLEAR ?auto_11819 ) ( ON-TABLE ?auto_11819 ) ( not ( = ?auto_11819 ?auto_11817 ) ) ( not ( = ?auto_11815 ?auto_11819 ) ) ( not ( = ?auto_11818 ?auto_11819 ) ) ( not ( = ?auto_11816 ?auto_11819 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11819 ?auto_11817 )
      ( MAKE-1PILE ?auto_11815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11820 - BLOCK
    )
    :vars
    (
      ?auto_11823 - BLOCK
      ?auto_11821 - BLOCK
      ?auto_11824 - BLOCK
      ?auto_11822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11823 ?auto_11820 ) ( ON-TABLE ?auto_11820 ) ( not ( = ?auto_11820 ?auto_11823 ) ) ( not ( = ?auto_11820 ?auto_11821 ) ) ( not ( = ?auto_11820 ?auto_11824 ) ) ( not ( = ?auto_11823 ?auto_11821 ) ) ( not ( = ?auto_11823 ?auto_11824 ) ) ( not ( = ?auto_11821 ?auto_11824 ) ) ( ON ?auto_11821 ?auto_11823 ) ( CLEAR ?auto_11822 ) ( ON-TABLE ?auto_11822 ) ( not ( = ?auto_11822 ?auto_11824 ) ) ( not ( = ?auto_11820 ?auto_11822 ) ) ( not ( = ?auto_11823 ?auto_11822 ) ) ( not ( = ?auto_11821 ?auto_11822 ) ) ( ON ?auto_11824 ?auto_11821 ) ( CLEAR ?auto_11824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11820 ?auto_11823 ?auto_11821 )
      ( MAKE-1PILE ?auto_11820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11825 - BLOCK
    )
    :vars
    (
      ?auto_11827 - BLOCK
      ?auto_11828 - BLOCK
      ?auto_11829 - BLOCK
      ?auto_11826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11827 ?auto_11825 ) ( ON-TABLE ?auto_11825 ) ( not ( = ?auto_11825 ?auto_11827 ) ) ( not ( = ?auto_11825 ?auto_11828 ) ) ( not ( = ?auto_11825 ?auto_11829 ) ) ( not ( = ?auto_11827 ?auto_11828 ) ) ( not ( = ?auto_11827 ?auto_11829 ) ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( ON ?auto_11828 ?auto_11827 ) ( not ( = ?auto_11826 ?auto_11829 ) ) ( not ( = ?auto_11825 ?auto_11826 ) ) ( not ( = ?auto_11827 ?auto_11826 ) ) ( not ( = ?auto_11828 ?auto_11826 ) ) ( ON ?auto_11829 ?auto_11828 ) ( CLEAR ?auto_11829 ) ( HOLDING ?auto_11826 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11826 )
      ( MAKE-1PILE ?auto_11825 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11830 - BLOCK
    )
    :vars
    (
      ?auto_11833 - BLOCK
      ?auto_11831 - BLOCK
      ?auto_11832 - BLOCK
      ?auto_11834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11833 ?auto_11830 ) ( ON-TABLE ?auto_11830 ) ( not ( = ?auto_11830 ?auto_11833 ) ) ( not ( = ?auto_11830 ?auto_11831 ) ) ( not ( = ?auto_11830 ?auto_11832 ) ) ( not ( = ?auto_11833 ?auto_11831 ) ) ( not ( = ?auto_11833 ?auto_11832 ) ) ( not ( = ?auto_11831 ?auto_11832 ) ) ( ON ?auto_11831 ?auto_11833 ) ( not ( = ?auto_11834 ?auto_11832 ) ) ( not ( = ?auto_11830 ?auto_11834 ) ) ( not ( = ?auto_11833 ?auto_11834 ) ) ( not ( = ?auto_11831 ?auto_11834 ) ) ( ON ?auto_11832 ?auto_11831 ) ( ON ?auto_11834 ?auto_11832 ) ( CLEAR ?auto_11834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11830 ?auto_11833 ?auto_11831 ?auto_11832 )
      ( MAKE-1PILE ?auto_11830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11839 - BLOCK
      ?auto_11840 - BLOCK
      ?auto_11841 - BLOCK
      ?auto_11842 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11842 ) ( CLEAR ?auto_11841 ) ( ON-TABLE ?auto_11839 ) ( ON ?auto_11840 ?auto_11839 ) ( ON ?auto_11841 ?auto_11840 ) ( not ( = ?auto_11839 ?auto_11840 ) ) ( not ( = ?auto_11839 ?auto_11841 ) ) ( not ( = ?auto_11839 ?auto_11842 ) ) ( not ( = ?auto_11840 ?auto_11841 ) ) ( not ( = ?auto_11840 ?auto_11842 ) ) ( not ( = ?auto_11841 ?auto_11842 ) ) )
    :subtasks
    ( ( !STACK ?auto_11842 ?auto_11841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11843 - BLOCK
      ?auto_11844 - BLOCK
      ?auto_11845 - BLOCK
      ?auto_11846 - BLOCK
    )
    :vars
    (
      ?auto_11847 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11845 ) ( ON-TABLE ?auto_11843 ) ( ON ?auto_11844 ?auto_11843 ) ( ON ?auto_11845 ?auto_11844 ) ( not ( = ?auto_11843 ?auto_11844 ) ) ( not ( = ?auto_11843 ?auto_11845 ) ) ( not ( = ?auto_11843 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( not ( = ?auto_11844 ?auto_11846 ) ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( ON ?auto_11846 ?auto_11847 ) ( CLEAR ?auto_11846 ) ( HAND-EMPTY ) ( not ( = ?auto_11843 ?auto_11847 ) ) ( not ( = ?auto_11844 ?auto_11847 ) ) ( not ( = ?auto_11845 ?auto_11847 ) ) ( not ( = ?auto_11846 ?auto_11847 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11846 ?auto_11847 )
      ( MAKE-4PILE ?auto_11843 ?auto_11844 ?auto_11845 ?auto_11846 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11848 - BLOCK
      ?auto_11849 - BLOCK
      ?auto_11850 - BLOCK
      ?auto_11851 - BLOCK
    )
    :vars
    (
      ?auto_11852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11848 ) ( ON ?auto_11849 ?auto_11848 ) ( not ( = ?auto_11848 ?auto_11849 ) ) ( not ( = ?auto_11848 ?auto_11850 ) ) ( not ( = ?auto_11848 ?auto_11851 ) ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( not ( = ?auto_11849 ?auto_11851 ) ) ( not ( = ?auto_11850 ?auto_11851 ) ) ( ON ?auto_11851 ?auto_11852 ) ( CLEAR ?auto_11851 ) ( not ( = ?auto_11848 ?auto_11852 ) ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11852 ) ) ( not ( = ?auto_11851 ?auto_11852 ) ) ( HOLDING ?auto_11850 ) ( CLEAR ?auto_11849 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11848 ?auto_11849 ?auto_11850 )
      ( MAKE-4PILE ?auto_11848 ?auto_11849 ?auto_11850 ?auto_11851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11853 - BLOCK
      ?auto_11854 - BLOCK
      ?auto_11855 - BLOCK
      ?auto_11856 - BLOCK
    )
    :vars
    (
      ?auto_11857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11853 ) ( ON ?auto_11854 ?auto_11853 ) ( not ( = ?auto_11853 ?auto_11854 ) ) ( not ( = ?auto_11853 ?auto_11855 ) ) ( not ( = ?auto_11853 ?auto_11856 ) ) ( not ( = ?auto_11854 ?auto_11855 ) ) ( not ( = ?auto_11854 ?auto_11856 ) ) ( not ( = ?auto_11855 ?auto_11856 ) ) ( ON ?auto_11856 ?auto_11857 ) ( not ( = ?auto_11853 ?auto_11857 ) ) ( not ( = ?auto_11854 ?auto_11857 ) ) ( not ( = ?auto_11855 ?auto_11857 ) ) ( not ( = ?auto_11856 ?auto_11857 ) ) ( CLEAR ?auto_11854 ) ( ON ?auto_11855 ?auto_11856 ) ( CLEAR ?auto_11855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11857 ?auto_11856 )
      ( MAKE-4PILE ?auto_11853 ?auto_11854 ?auto_11855 ?auto_11856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11858 - BLOCK
      ?auto_11859 - BLOCK
      ?auto_11860 - BLOCK
      ?auto_11861 - BLOCK
    )
    :vars
    (
      ?auto_11862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11858 ) ( not ( = ?auto_11858 ?auto_11859 ) ) ( not ( = ?auto_11858 ?auto_11860 ) ) ( not ( = ?auto_11858 ?auto_11861 ) ) ( not ( = ?auto_11859 ?auto_11860 ) ) ( not ( = ?auto_11859 ?auto_11861 ) ) ( not ( = ?auto_11860 ?auto_11861 ) ) ( ON ?auto_11861 ?auto_11862 ) ( not ( = ?auto_11858 ?auto_11862 ) ) ( not ( = ?auto_11859 ?auto_11862 ) ) ( not ( = ?auto_11860 ?auto_11862 ) ) ( not ( = ?auto_11861 ?auto_11862 ) ) ( ON ?auto_11860 ?auto_11861 ) ( CLEAR ?auto_11860 ) ( ON-TABLE ?auto_11862 ) ( HOLDING ?auto_11859 ) ( CLEAR ?auto_11858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11858 ?auto_11859 )
      ( MAKE-4PILE ?auto_11858 ?auto_11859 ?auto_11860 ?auto_11861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11863 - BLOCK
      ?auto_11864 - BLOCK
      ?auto_11865 - BLOCK
      ?auto_11866 - BLOCK
    )
    :vars
    (
      ?auto_11867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11863 ) ( not ( = ?auto_11863 ?auto_11864 ) ) ( not ( = ?auto_11863 ?auto_11865 ) ) ( not ( = ?auto_11863 ?auto_11866 ) ) ( not ( = ?auto_11864 ?auto_11865 ) ) ( not ( = ?auto_11864 ?auto_11866 ) ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( ON ?auto_11866 ?auto_11867 ) ( not ( = ?auto_11863 ?auto_11867 ) ) ( not ( = ?auto_11864 ?auto_11867 ) ) ( not ( = ?auto_11865 ?auto_11867 ) ) ( not ( = ?auto_11866 ?auto_11867 ) ) ( ON ?auto_11865 ?auto_11866 ) ( ON-TABLE ?auto_11867 ) ( CLEAR ?auto_11863 ) ( ON ?auto_11864 ?auto_11865 ) ( CLEAR ?auto_11864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11867 ?auto_11866 ?auto_11865 )
      ( MAKE-4PILE ?auto_11863 ?auto_11864 ?auto_11865 ?auto_11866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11868 - BLOCK
      ?auto_11869 - BLOCK
      ?auto_11870 - BLOCK
      ?auto_11871 - BLOCK
    )
    :vars
    (
      ?auto_11872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11868 ?auto_11869 ) ) ( not ( = ?auto_11868 ?auto_11870 ) ) ( not ( = ?auto_11868 ?auto_11871 ) ) ( not ( = ?auto_11869 ?auto_11870 ) ) ( not ( = ?auto_11869 ?auto_11871 ) ) ( not ( = ?auto_11870 ?auto_11871 ) ) ( ON ?auto_11871 ?auto_11872 ) ( not ( = ?auto_11868 ?auto_11872 ) ) ( not ( = ?auto_11869 ?auto_11872 ) ) ( not ( = ?auto_11870 ?auto_11872 ) ) ( not ( = ?auto_11871 ?auto_11872 ) ) ( ON ?auto_11870 ?auto_11871 ) ( ON-TABLE ?auto_11872 ) ( ON ?auto_11869 ?auto_11870 ) ( CLEAR ?auto_11869 ) ( HOLDING ?auto_11868 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11868 )
      ( MAKE-4PILE ?auto_11868 ?auto_11869 ?auto_11870 ?auto_11871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11873 - BLOCK
      ?auto_11874 - BLOCK
      ?auto_11875 - BLOCK
      ?auto_11876 - BLOCK
    )
    :vars
    (
      ?auto_11877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11873 ?auto_11874 ) ) ( not ( = ?auto_11873 ?auto_11875 ) ) ( not ( = ?auto_11873 ?auto_11876 ) ) ( not ( = ?auto_11874 ?auto_11875 ) ) ( not ( = ?auto_11874 ?auto_11876 ) ) ( not ( = ?auto_11875 ?auto_11876 ) ) ( ON ?auto_11876 ?auto_11877 ) ( not ( = ?auto_11873 ?auto_11877 ) ) ( not ( = ?auto_11874 ?auto_11877 ) ) ( not ( = ?auto_11875 ?auto_11877 ) ) ( not ( = ?auto_11876 ?auto_11877 ) ) ( ON ?auto_11875 ?auto_11876 ) ( ON-TABLE ?auto_11877 ) ( ON ?auto_11874 ?auto_11875 ) ( ON ?auto_11873 ?auto_11874 ) ( CLEAR ?auto_11873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11877 ?auto_11876 ?auto_11875 ?auto_11874 )
      ( MAKE-4PILE ?auto_11873 ?auto_11874 ?auto_11875 ?auto_11876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11881 - BLOCK
      ?auto_11882 - BLOCK
      ?auto_11883 - BLOCK
    )
    :vars
    (
      ?auto_11884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11884 ?auto_11883 ) ( CLEAR ?auto_11884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11881 ) ( ON ?auto_11882 ?auto_11881 ) ( ON ?auto_11883 ?auto_11882 ) ( not ( = ?auto_11881 ?auto_11882 ) ) ( not ( = ?auto_11881 ?auto_11883 ) ) ( not ( = ?auto_11881 ?auto_11884 ) ) ( not ( = ?auto_11882 ?auto_11883 ) ) ( not ( = ?auto_11882 ?auto_11884 ) ) ( not ( = ?auto_11883 ?auto_11884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11884 ?auto_11883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11894 - BLOCK
      ?auto_11895 - BLOCK
      ?auto_11896 - BLOCK
    )
    :vars
    (
      ?auto_11897 - BLOCK
      ?auto_11898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11894 ) ( ON ?auto_11895 ?auto_11894 ) ( not ( = ?auto_11894 ?auto_11895 ) ) ( not ( = ?auto_11894 ?auto_11896 ) ) ( not ( = ?auto_11894 ?auto_11897 ) ) ( not ( = ?auto_11895 ?auto_11896 ) ) ( not ( = ?auto_11895 ?auto_11897 ) ) ( not ( = ?auto_11896 ?auto_11897 ) ) ( ON ?auto_11897 ?auto_11898 ) ( CLEAR ?auto_11897 ) ( not ( = ?auto_11894 ?auto_11898 ) ) ( not ( = ?auto_11895 ?auto_11898 ) ) ( not ( = ?auto_11896 ?auto_11898 ) ) ( not ( = ?auto_11897 ?auto_11898 ) ) ( HOLDING ?auto_11896 ) ( CLEAR ?auto_11895 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11894 ?auto_11895 ?auto_11896 ?auto_11897 )
      ( MAKE-3PILE ?auto_11894 ?auto_11895 ?auto_11896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11899 - BLOCK
      ?auto_11900 - BLOCK
      ?auto_11901 - BLOCK
    )
    :vars
    (
      ?auto_11902 - BLOCK
      ?auto_11903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11899 ) ( ON ?auto_11900 ?auto_11899 ) ( not ( = ?auto_11899 ?auto_11900 ) ) ( not ( = ?auto_11899 ?auto_11901 ) ) ( not ( = ?auto_11899 ?auto_11902 ) ) ( not ( = ?auto_11900 ?auto_11901 ) ) ( not ( = ?auto_11900 ?auto_11902 ) ) ( not ( = ?auto_11901 ?auto_11902 ) ) ( ON ?auto_11902 ?auto_11903 ) ( not ( = ?auto_11899 ?auto_11903 ) ) ( not ( = ?auto_11900 ?auto_11903 ) ) ( not ( = ?auto_11901 ?auto_11903 ) ) ( not ( = ?auto_11902 ?auto_11903 ) ) ( CLEAR ?auto_11900 ) ( ON ?auto_11901 ?auto_11902 ) ( CLEAR ?auto_11901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11903 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11903 ?auto_11902 )
      ( MAKE-3PILE ?auto_11899 ?auto_11900 ?auto_11901 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11904 - BLOCK
      ?auto_11905 - BLOCK
      ?auto_11906 - BLOCK
    )
    :vars
    (
      ?auto_11907 - BLOCK
      ?auto_11908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11904 ) ( not ( = ?auto_11904 ?auto_11905 ) ) ( not ( = ?auto_11904 ?auto_11906 ) ) ( not ( = ?auto_11904 ?auto_11907 ) ) ( not ( = ?auto_11905 ?auto_11906 ) ) ( not ( = ?auto_11905 ?auto_11907 ) ) ( not ( = ?auto_11906 ?auto_11907 ) ) ( ON ?auto_11907 ?auto_11908 ) ( not ( = ?auto_11904 ?auto_11908 ) ) ( not ( = ?auto_11905 ?auto_11908 ) ) ( not ( = ?auto_11906 ?auto_11908 ) ) ( not ( = ?auto_11907 ?auto_11908 ) ) ( ON ?auto_11906 ?auto_11907 ) ( CLEAR ?auto_11906 ) ( ON-TABLE ?auto_11908 ) ( HOLDING ?auto_11905 ) ( CLEAR ?auto_11904 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11904 ?auto_11905 )
      ( MAKE-3PILE ?auto_11904 ?auto_11905 ?auto_11906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11909 - BLOCK
      ?auto_11910 - BLOCK
      ?auto_11911 - BLOCK
    )
    :vars
    (
      ?auto_11913 - BLOCK
      ?auto_11912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11909 ) ( not ( = ?auto_11909 ?auto_11910 ) ) ( not ( = ?auto_11909 ?auto_11911 ) ) ( not ( = ?auto_11909 ?auto_11913 ) ) ( not ( = ?auto_11910 ?auto_11911 ) ) ( not ( = ?auto_11910 ?auto_11913 ) ) ( not ( = ?auto_11911 ?auto_11913 ) ) ( ON ?auto_11913 ?auto_11912 ) ( not ( = ?auto_11909 ?auto_11912 ) ) ( not ( = ?auto_11910 ?auto_11912 ) ) ( not ( = ?auto_11911 ?auto_11912 ) ) ( not ( = ?auto_11913 ?auto_11912 ) ) ( ON ?auto_11911 ?auto_11913 ) ( ON-TABLE ?auto_11912 ) ( CLEAR ?auto_11909 ) ( ON ?auto_11910 ?auto_11911 ) ( CLEAR ?auto_11910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11912 ?auto_11913 ?auto_11911 )
      ( MAKE-3PILE ?auto_11909 ?auto_11910 ?auto_11911 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11914 - BLOCK
      ?auto_11915 - BLOCK
      ?auto_11916 - BLOCK
    )
    :vars
    (
      ?auto_11918 - BLOCK
      ?auto_11917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11914 ?auto_11915 ) ) ( not ( = ?auto_11914 ?auto_11916 ) ) ( not ( = ?auto_11914 ?auto_11918 ) ) ( not ( = ?auto_11915 ?auto_11916 ) ) ( not ( = ?auto_11915 ?auto_11918 ) ) ( not ( = ?auto_11916 ?auto_11918 ) ) ( ON ?auto_11918 ?auto_11917 ) ( not ( = ?auto_11914 ?auto_11917 ) ) ( not ( = ?auto_11915 ?auto_11917 ) ) ( not ( = ?auto_11916 ?auto_11917 ) ) ( not ( = ?auto_11918 ?auto_11917 ) ) ( ON ?auto_11916 ?auto_11918 ) ( ON-TABLE ?auto_11917 ) ( ON ?auto_11915 ?auto_11916 ) ( CLEAR ?auto_11915 ) ( HOLDING ?auto_11914 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11914 )
      ( MAKE-3PILE ?auto_11914 ?auto_11915 ?auto_11916 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11919 - BLOCK
      ?auto_11920 - BLOCK
      ?auto_11921 - BLOCK
    )
    :vars
    (
      ?auto_11922 - BLOCK
      ?auto_11923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11919 ?auto_11920 ) ) ( not ( = ?auto_11919 ?auto_11921 ) ) ( not ( = ?auto_11919 ?auto_11922 ) ) ( not ( = ?auto_11920 ?auto_11921 ) ) ( not ( = ?auto_11920 ?auto_11922 ) ) ( not ( = ?auto_11921 ?auto_11922 ) ) ( ON ?auto_11922 ?auto_11923 ) ( not ( = ?auto_11919 ?auto_11923 ) ) ( not ( = ?auto_11920 ?auto_11923 ) ) ( not ( = ?auto_11921 ?auto_11923 ) ) ( not ( = ?auto_11922 ?auto_11923 ) ) ( ON ?auto_11921 ?auto_11922 ) ( ON-TABLE ?auto_11923 ) ( ON ?auto_11920 ?auto_11921 ) ( ON ?auto_11919 ?auto_11920 ) ( CLEAR ?auto_11919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11923 ?auto_11922 ?auto_11921 ?auto_11920 )
      ( MAKE-3PILE ?auto_11919 ?auto_11920 ?auto_11921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11925 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_11925 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11925 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11926 - BLOCK
    )
    :vars
    (
      ?auto_11927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11926 ?auto_11927 ) ( CLEAR ?auto_11926 ) ( HAND-EMPTY ) ( not ( = ?auto_11926 ?auto_11927 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11926 ?auto_11927 )
      ( MAKE-1PILE ?auto_11926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11928 - BLOCK
    )
    :vars
    (
      ?auto_11929 - BLOCK
      ?auto_11930 - BLOCK
      ?auto_11931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11928 ?auto_11929 ) ) ( HOLDING ?auto_11928 ) ( CLEAR ?auto_11929 ) ( ON-TABLE ?auto_11930 ) ( ON ?auto_11931 ?auto_11930 ) ( ON ?auto_11929 ?auto_11931 ) ( not ( = ?auto_11930 ?auto_11931 ) ) ( not ( = ?auto_11930 ?auto_11929 ) ) ( not ( = ?auto_11930 ?auto_11928 ) ) ( not ( = ?auto_11931 ?auto_11929 ) ) ( not ( = ?auto_11931 ?auto_11928 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11930 ?auto_11931 ?auto_11929 ?auto_11928 )
      ( MAKE-1PILE ?auto_11928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11932 - BLOCK
    )
    :vars
    (
      ?auto_11934 - BLOCK
      ?auto_11933 - BLOCK
      ?auto_11935 - BLOCK
      ?auto_11936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11932 ?auto_11934 ) ) ( CLEAR ?auto_11934 ) ( ON-TABLE ?auto_11933 ) ( ON ?auto_11935 ?auto_11933 ) ( ON ?auto_11934 ?auto_11935 ) ( not ( = ?auto_11933 ?auto_11935 ) ) ( not ( = ?auto_11933 ?auto_11934 ) ) ( not ( = ?auto_11933 ?auto_11932 ) ) ( not ( = ?auto_11935 ?auto_11934 ) ) ( not ( = ?auto_11935 ?auto_11932 ) ) ( ON ?auto_11932 ?auto_11936 ) ( CLEAR ?auto_11932 ) ( HAND-EMPTY ) ( not ( = ?auto_11932 ?auto_11936 ) ) ( not ( = ?auto_11934 ?auto_11936 ) ) ( not ( = ?auto_11933 ?auto_11936 ) ) ( not ( = ?auto_11935 ?auto_11936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11932 ?auto_11936 )
      ( MAKE-1PILE ?auto_11932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11937 - BLOCK
    )
    :vars
    (
      ?auto_11940 - BLOCK
      ?auto_11938 - BLOCK
      ?auto_11939 - BLOCK
      ?auto_11941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11937 ?auto_11940 ) ) ( ON-TABLE ?auto_11938 ) ( ON ?auto_11939 ?auto_11938 ) ( not ( = ?auto_11938 ?auto_11939 ) ) ( not ( = ?auto_11938 ?auto_11940 ) ) ( not ( = ?auto_11938 ?auto_11937 ) ) ( not ( = ?auto_11939 ?auto_11940 ) ) ( not ( = ?auto_11939 ?auto_11937 ) ) ( ON ?auto_11937 ?auto_11941 ) ( CLEAR ?auto_11937 ) ( not ( = ?auto_11937 ?auto_11941 ) ) ( not ( = ?auto_11940 ?auto_11941 ) ) ( not ( = ?auto_11938 ?auto_11941 ) ) ( not ( = ?auto_11939 ?auto_11941 ) ) ( HOLDING ?auto_11940 ) ( CLEAR ?auto_11939 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11938 ?auto_11939 ?auto_11940 )
      ( MAKE-1PILE ?auto_11937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11942 - BLOCK
    )
    :vars
    (
      ?auto_11946 - BLOCK
      ?auto_11944 - BLOCK
      ?auto_11943 - BLOCK
      ?auto_11945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11942 ?auto_11946 ) ) ( ON-TABLE ?auto_11944 ) ( ON ?auto_11943 ?auto_11944 ) ( not ( = ?auto_11944 ?auto_11943 ) ) ( not ( = ?auto_11944 ?auto_11946 ) ) ( not ( = ?auto_11944 ?auto_11942 ) ) ( not ( = ?auto_11943 ?auto_11946 ) ) ( not ( = ?auto_11943 ?auto_11942 ) ) ( ON ?auto_11942 ?auto_11945 ) ( not ( = ?auto_11942 ?auto_11945 ) ) ( not ( = ?auto_11946 ?auto_11945 ) ) ( not ( = ?auto_11944 ?auto_11945 ) ) ( not ( = ?auto_11943 ?auto_11945 ) ) ( CLEAR ?auto_11943 ) ( ON ?auto_11946 ?auto_11942 ) ( CLEAR ?auto_11946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11945 ?auto_11942 )
      ( MAKE-1PILE ?auto_11942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11947 - BLOCK
    )
    :vars
    (
      ?auto_11951 - BLOCK
      ?auto_11949 - BLOCK
      ?auto_11950 - BLOCK
      ?auto_11948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11947 ?auto_11951 ) ) ( ON-TABLE ?auto_11949 ) ( not ( = ?auto_11949 ?auto_11950 ) ) ( not ( = ?auto_11949 ?auto_11951 ) ) ( not ( = ?auto_11949 ?auto_11947 ) ) ( not ( = ?auto_11950 ?auto_11951 ) ) ( not ( = ?auto_11950 ?auto_11947 ) ) ( ON ?auto_11947 ?auto_11948 ) ( not ( = ?auto_11947 ?auto_11948 ) ) ( not ( = ?auto_11951 ?auto_11948 ) ) ( not ( = ?auto_11949 ?auto_11948 ) ) ( not ( = ?auto_11950 ?auto_11948 ) ) ( ON ?auto_11951 ?auto_11947 ) ( CLEAR ?auto_11951 ) ( ON-TABLE ?auto_11948 ) ( HOLDING ?auto_11950 ) ( CLEAR ?auto_11949 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11949 ?auto_11950 )
      ( MAKE-1PILE ?auto_11947 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11952 - BLOCK
    )
    :vars
    (
      ?auto_11953 - BLOCK
      ?auto_11954 - BLOCK
      ?auto_11956 - BLOCK
      ?auto_11955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11952 ?auto_11953 ) ) ( ON-TABLE ?auto_11954 ) ( not ( = ?auto_11954 ?auto_11956 ) ) ( not ( = ?auto_11954 ?auto_11953 ) ) ( not ( = ?auto_11954 ?auto_11952 ) ) ( not ( = ?auto_11956 ?auto_11953 ) ) ( not ( = ?auto_11956 ?auto_11952 ) ) ( ON ?auto_11952 ?auto_11955 ) ( not ( = ?auto_11952 ?auto_11955 ) ) ( not ( = ?auto_11953 ?auto_11955 ) ) ( not ( = ?auto_11954 ?auto_11955 ) ) ( not ( = ?auto_11956 ?auto_11955 ) ) ( ON ?auto_11953 ?auto_11952 ) ( ON-TABLE ?auto_11955 ) ( CLEAR ?auto_11954 ) ( ON ?auto_11956 ?auto_11953 ) ( CLEAR ?auto_11956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11955 ?auto_11952 ?auto_11953 )
      ( MAKE-1PILE ?auto_11952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11957 - BLOCK
    )
    :vars
    (
      ?auto_11960 - BLOCK
      ?auto_11961 - BLOCK
      ?auto_11958 - BLOCK
      ?auto_11959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11957 ?auto_11960 ) ) ( not ( = ?auto_11961 ?auto_11958 ) ) ( not ( = ?auto_11961 ?auto_11960 ) ) ( not ( = ?auto_11961 ?auto_11957 ) ) ( not ( = ?auto_11958 ?auto_11960 ) ) ( not ( = ?auto_11958 ?auto_11957 ) ) ( ON ?auto_11957 ?auto_11959 ) ( not ( = ?auto_11957 ?auto_11959 ) ) ( not ( = ?auto_11960 ?auto_11959 ) ) ( not ( = ?auto_11961 ?auto_11959 ) ) ( not ( = ?auto_11958 ?auto_11959 ) ) ( ON ?auto_11960 ?auto_11957 ) ( ON-TABLE ?auto_11959 ) ( ON ?auto_11958 ?auto_11960 ) ( CLEAR ?auto_11958 ) ( HOLDING ?auto_11961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11961 )
      ( MAKE-1PILE ?auto_11957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11962 - BLOCK
    )
    :vars
    (
      ?auto_11965 - BLOCK
      ?auto_11964 - BLOCK
      ?auto_11963 - BLOCK
      ?auto_11966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11962 ?auto_11965 ) ) ( not ( = ?auto_11964 ?auto_11963 ) ) ( not ( = ?auto_11964 ?auto_11965 ) ) ( not ( = ?auto_11964 ?auto_11962 ) ) ( not ( = ?auto_11963 ?auto_11965 ) ) ( not ( = ?auto_11963 ?auto_11962 ) ) ( ON ?auto_11962 ?auto_11966 ) ( not ( = ?auto_11962 ?auto_11966 ) ) ( not ( = ?auto_11965 ?auto_11966 ) ) ( not ( = ?auto_11964 ?auto_11966 ) ) ( not ( = ?auto_11963 ?auto_11966 ) ) ( ON ?auto_11965 ?auto_11962 ) ( ON-TABLE ?auto_11966 ) ( ON ?auto_11963 ?auto_11965 ) ( ON ?auto_11964 ?auto_11963 ) ( CLEAR ?auto_11964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11966 ?auto_11962 ?auto_11965 ?auto_11963 )
      ( MAKE-1PILE ?auto_11962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11969 - BLOCK
      ?auto_11970 - BLOCK
    )
    :vars
    (
      ?auto_11971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11971 ?auto_11970 ) ( CLEAR ?auto_11971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11969 ) ( ON ?auto_11970 ?auto_11969 ) ( not ( = ?auto_11969 ?auto_11970 ) ) ( not ( = ?auto_11969 ?auto_11971 ) ) ( not ( = ?auto_11970 ?auto_11971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11971 ?auto_11970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11972 - BLOCK
      ?auto_11973 - BLOCK
    )
    :vars
    (
      ?auto_11974 - BLOCK
      ?auto_11975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11974 ?auto_11973 ) ( CLEAR ?auto_11974 ) ( ON-TABLE ?auto_11972 ) ( ON ?auto_11973 ?auto_11972 ) ( not ( = ?auto_11972 ?auto_11973 ) ) ( not ( = ?auto_11972 ?auto_11974 ) ) ( not ( = ?auto_11973 ?auto_11974 ) ) ( HOLDING ?auto_11975 ) ( not ( = ?auto_11972 ?auto_11975 ) ) ( not ( = ?auto_11973 ?auto_11975 ) ) ( not ( = ?auto_11974 ?auto_11975 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_11975 )
      ( MAKE-2PILE ?auto_11972 ?auto_11973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11976 - BLOCK
      ?auto_11977 - BLOCK
    )
    :vars
    (
      ?auto_11979 - BLOCK
      ?auto_11978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11979 ?auto_11977 ) ( ON-TABLE ?auto_11976 ) ( ON ?auto_11977 ?auto_11976 ) ( not ( = ?auto_11976 ?auto_11977 ) ) ( not ( = ?auto_11976 ?auto_11979 ) ) ( not ( = ?auto_11977 ?auto_11979 ) ) ( not ( = ?auto_11976 ?auto_11978 ) ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( not ( = ?auto_11979 ?auto_11978 ) ) ( ON ?auto_11978 ?auto_11979 ) ( CLEAR ?auto_11978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11976 ?auto_11977 ?auto_11979 )
      ( MAKE-2PILE ?auto_11976 ?auto_11977 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11980 - BLOCK
      ?auto_11981 - BLOCK
    )
    :vars
    (
      ?auto_11982 - BLOCK
      ?auto_11983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11982 ?auto_11981 ) ( ON-TABLE ?auto_11980 ) ( ON ?auto_11981 ?auto_11980 ) ( not ( = ?auto_11980 ?auto_11981 ) ) ( not ( = ?auto_11980 ?auto_11982 ) ) ( not ( = ?auto_11981 ?auto_11982 ) ) ( not ( = ?auto_11980 ?auto_11983 ) ) ( not ( = ?auto_11981 ?auto_11983 ) ) ( not ( = ?auto_11982 ?auto_11983 ) ) ( HOLDING ?auto_11983 ) ( CLEAR ?auto_11982 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11980 ?auto_11981 ?auto_11982 ?auto_11983 )
      ( MAKE-2PILE ?auto_11980 ?auto_11981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11984 - BLOCK
      ?auto_11985 - BLOCK
    )
    :vars
    (
      ?auto_11986 - BLOCK
      ?auto_11987 - BLOCK
      ?auto_11988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11986 ?auto_11985 ) ( ON-TABLE ?auto_11984 ) ( ON ?auto_11985 ?auto_11984 ) ( not ( = ?auto_11984 ?auto_11985 ) ) ( not ( = ?auto_11984 ?auto_11986 ) ) ( not ( = ?auto_11985 ?auto_11986 ) ) ( not ( = ?auto_11984 ?auto_11987 ) ) ( not ( = ?auto_11985 ?auto_11987 ) ) ( not ( = ?auto_11986 ?auto_11987 ) ) ( CLEAR ?auto_11986 ) ( ON ?auto_11987 ?auto_11988 ) ( CLEAR ?auto_11987 ) ( HAND-EMPTY ) ( not ( = ?auto_11984 ?auto_11988 ) ) ( not ( = ?auto_11985 ?auto_11988 ) ) ( not ( = ?auto_11986 ?auto_11988 ) ) ( not ( = ?auto_11987 ?auto_11988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11987 ?auto_11988 )
      ( MAKE-2PILE ?auto_11984 ?auto_11985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11999 - BLOCK
      ?auto_12000 - BLOCK
    )
    :vars
    (
      ?auto_12001 - BLOCK
      ?auto_12003 - BLOCK
      ?auto_12002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11999 ) ( not ( = ?auto_11999 ?auto_12000 ) ) ( not ( = ?auto_11999 ?auto_12001 ) ) ( not ( = ?auto_12000 ?auto_12001 ) ) ( not ( = ?auto_11999 ?auto_12003 ) ) ( not ( = ?auto_12000 ?auto_12003 ) ) ( not ( = ?auto_12001 ?auto_12003 ) ) ( ON ?auto_12003 ?auto_12002 ) ( not ( = ?auto_11999 ?auto_12002 ) ) ( not ( = ?auto_12000 ?auto_12002 ) ) ( not ( = ?auto_12001 ?auto_12002 ) ) ( not ( = ?auto_12003 ?auto_12002 ) ) ( ON ?auto_12001 ?auto_12003 ) ( CLEAR ?auto_12001 ) ( HOLDING ?auto_12000 ) ( CLEAR ?auto_11999 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11999 ?auto_12000 ?auto_12001 )
      ( MAKE-2PILE ?auto_11999 ?auto_12000 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12004 - BLOCK
      ?auto_12005 - BLOCK
    )
    :vars
    (
      ?auto_12006 - BLOCK
      ?auto_12008 - BLOCK
      ?auto_12007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12004 ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12006 ) ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12004 ?auto_12008 ) ) ( not ( = ?auto_12005 ?auto_12008 ) ) ( not ( = ?auto_12006 ?auto_12008 ) ) ( ON ?auto_12008 ?auto_12007 ) ( not ( = ?auto_12004 ?auto_12007 ) ) ( not ( = ?auto_12005 ?auto_12007 ) ) ( not ( = ?auto_12006 ?auto_12007 ) ) ( not ( = ?auto_12008 ?auto_12007 ) ) ( ON ?auto_12006 ?auto_12008 ) ( CLEAR ?auto_12004 ) ( ON ?auto_12005 ?auto_12006 ) ( CLEAR ?auto_12005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12007 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12007 ?auto_12008 ?auto_12006 )
      ( MAKE-2PILE ?auto_12004 ?auto_12005 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12009 - BLOCK
      ?auto_12010 - BLOCK
    )
    :vars
    (
      ?auto_12013 - BLOCK
      ?auto_12011 - BLOCK
      ?auto_12012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12009 ?auto_12010 ) ) ( not ( = ?auto_12009 ?auto_12013 ) ) ( not ( = ?auto_12010 ?auto_12013 ) ) ( not ( = ?auto_12009 ?auto_12011 ) ) ( not ( = ?auto_12010 ?auto_12011 ) ) ( not ( = ?auto_12013 ?auto_12011 ) ) ( ON ?auto_12011 ?auto_12012 ) ( not ( = ?auto_12009 ?auto_12012 ) ) ( not ( = ?auto_12010 ?auto_12012 ) ) ( not ( = ?auto_12013 ?auto_12012 ) ) ( not ( = ?auto_12011 ?auto_12012 ) ) ( ON ?auto_12013 ?auto_12011 ) ( ON ?auto_12010 ?auto_12013 ) ( CLEAR ?auto_12010 ) ( ON-TABLE ?auto_12012 ) ( HOLDING ?auto_12009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12009 )
      ( MAKE-2PILE ?auto_12009 ?auto_12010 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12014 - BLOCK
      ?auto_12015 - BLOCK
    )
    :vars
    (
      ?auto_12018 - BLOCK
      ?auto_12017 - BLOCK
      ?auto_12016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12014 ?auto_12015 ) ) ( not ( = ?auto_12014 ?auto_12018 ) ) ( not ( = ?auto_12015 ?auto_12018 ) ) ( not ( = ?auto_12014 ?auto_12017 ) ) ( not ( = ?auto_12015 ?auto_12017 ) ) ( not ( = ?auto_12018 ?auto_12017 ) ) ( ON ?auto_12017 ?auto_12016 ) ( not ( = ?auto_12014 ?auto_12016 ) ) ( not ( = ?auto_12015 ?auto_12016 ) ) ( not ( = ?auto_12018 ?auto_12016 ) ) ( not ( = ?auto_12017 ?auto_12016 ) ) ( ON ?auto_12018 ?auto_12017 ) ( ON ?auto_12015 ?auto_12018 ) ( ON-TABLE ?auto_12016 ) ( ON ?auto_12014 ?auto_12015 ) ( CLEAR ?auto_12014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12016 ?auto_12017 ?auto_12018 ?auto_12015 )
      ( MAKE-2PILE ?auto_12014 ?auto_12015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12021 - BLOCK
      ?auto_12022 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12022 ) ( CLEAR ?auto_12021 ) ( ON-TABLE ?auto_12021 ) ( not ( = ?auto_12021 ?auto_12022 ) ) )
    :subtasks
    ( ( !STACK ?auto_12022 ?auto_12021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12023 - BLOCK
      ?auto_12024 - BLOCK
    )
    :vars
    (
      ?auto_12025 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12023 ) ( ON-TABLE ?auto_12023 ) ( not ( = ?auto_12023 ?auto_12024 ) ) ( ON ?auto_12024 ?auto_12025 ) ( CLEAR ?auto_12024 ) ( HAND-EMPTY ) ( not ( = ?auto_12023 ?auto_12025 ) ) ( not ( = ?auto_12024 ?auto_12025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12024 ?auto_12025 )
      ( MAKE-2PILE ?auto_12023 ?auto_12024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12026 - BLOCK
      ?auto_12027 - BLOCK
    )
    :vars
    (
      ?auto_12028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12026 ?auto_12027 ) ) ( ON ?auto_12027 ?auto_12028 ) ( CLEAR ?auto_12027 ) ( not ( = ?auto_12026 ?auto_12028 ) ) ( not ( = ?auto_12027 ?auto_12028 ) ) ( HOLDING ?auto_12026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12026 )
      ( MAKE-2PILE ?auto_12026 ?auto_12027 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12029 - BLOCK
      ?auto_12030 - BLOCK
    )
    :vars
    (
      ?auto_12031 - BLOCK
      ?auto_12032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12029 ?auto_12030 ) ) ( ON ?auto_12030 ?auto_12031 ) ( not ( = ?auto_12029 ?auto_12031 ) ) ( not ( = ?auto_12030 ?auto_12031 ) ) ( ON ?auto_12029 ?auto_12030 ) ( CLEAR ?auto_12029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12032 ) ( ON ?auto_12031 ?auto_12032 ) ( not ( = ?auto_12032 ?auto_12031 ) ) ( not ( = ?auto_12032 ?auto_12030 ) ) ( not ( = ?auto_12032 ?auto_12029 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12032 ?auto_12031 ?auto_12030 )
      ( MAKE-2PILE ?auto_12029 ?auto_12030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12033 - BLOCK
      ?auto_12034 - BLOCK
    )
    :vars
    (
      ?auto_12035 - BLOCK
      ?auto_12036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12033 ?auto_12034 ) ) ( ON ?auto_12034 ?auto_12035 ) ( not ( = ?auto_12033 ?auto_12035 ) ) ( not ( = ?auto_12034 ?auto_12035 ) ) ( ON-TABLE ?auto_12036 ) ( ON ?auto_12035 ?auto_12036 ) ( not ( = ?auto_12036 ?auto_12035 ) ) ( not ( = ?auto_12036 ?auto_12034 ) ) ( not ( = ?auto_12036 ?auto_12033 ) ) ( HOLDING ?auto_12033 ) ( CLEAR ?auto_12034 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12036 ?auto_12035 ?auto_12034 ?auto_12033 )
      ( MAKE-2PILE ?auto_12033 ?auto_12034 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12037 - BLOCK
      ?auto_12038 - BLOCK
    )
    :vars
    (
      ?auto_12039 - BLOCK
      ?auto_12040 - BLOCK
      ?auto_12041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12037 ?auto_12038 ) ) ( ON ?auto_12038 ?auto_12039 ) ( not ( = ?auto_12037 ?auto_12039 ) ) ( not ( = ?auto_12038 ?auto_12039 ) ) ( ON-TABLE ?auto_12040 ) ( ON ?auto_12039 ?auto_12040 ) ( not ( = ?auto_12040 ?auto_12039 ) ) ( not ( = ?auto_12040 ?auto_12038 ) ) ( not ( = ?auto_12040 ?auto_12037 ) ) ( CLEAR ?auto_12038 ) ( ON ?auto_12037 ?auto_12041 ) ( CLEAR ?auto_12037 ) ( HAND-EMPTY ) ( not ( = ?auto_12037 ?auto_12041 ) ) ( not ( = ?auto_12038 ?auto_12041 ) ) ( not ( = ?auto_12039 ?auto_12041 ) ) ( not ( = ?auto_12040 ?auto_12041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12037 ?auto_12041 )
      ( MAKE-2PILE ?auto_12037 ?auto_12038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12042 - BLOCK
      ?auto_12043 - BLOCK
    )
    :vars
    (
      ?auto_12046 - BLOCK
      ?auto_12045 - BLOCK
      ?auto_12044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12042 ?auto_12043 ) ) ( not ( = ?auto_12042 ?auto_12046 ) ) ( not ( = ?auto_12043 ?auto_12046 ) ) ( ON-TABLE ?auto_12045 ) ( ON ?auto_12046 ?auto_12045 ) ( not ( = ?auto_12045 ?auto_12046 ) ) ( not ( = ?auto_12045 ?auto_12043 ) ) ( not ( = ?auto_12045 ?auto_12042 ) ) ( ON ?auto_12042 ?auto_12044 ) ( CLEAR ?auto_12042 ) ( not ( = ?auto_12042 ?auto_12044 ) ) ( not ( = ?auto_12043 ?auto_12044 ) ) ( not ( = ?auto_12046 ?auto_12044 ) ) ( not ( = ?auto_12045 ?auto_12044 ) ) ( HOLDING ?auto_12043 ) ( CLEAR ?auto_12046 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12045 ?auto_12046 ?auto_12043 )
      ( MAKE-2PILE ?auto_12042 ?auto_12043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12047 - BLOCK
      ?auto_12048 - BLOCK
    )
    :vars
    (
      ?auto_12049 - BLOCK
      ?auto_12050 - BLOCK
      ?auto_12051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12047 ?auto_12048 ) ) ( not ( = ?auto_12047 ?auto_12049 ) ) ( not ( = ?auto_12048 ?auto_12049 ) ) ( ON-TABLE ?auto_12050 ) ( ON ?auto_12049 ?auto_12050 ) ( not ( = ?auto_12050 ?auto_12049 ) ) ( not ( = ?auto_12050 ?auto_12048 ) ) ( not ( = ?auto_12050 ?auto_12047 ) ) ( ON ?auto_12047 ?auto_12051 ) ( not ( = ?auto_12047 ?auto_12051 ) ) ( not ( = ?auto_12048 ?auto_12051 ) ) ( not ( = ?auto_12049 ?auto_12051 ) ) ( not ( = ?auto_12050 ?auto_12051 ) ) ( CLEAR ?auto_12049 ) ( ON ?auto_12048 ?auto_12047 ) ( CLEAR ?auto_12048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12051 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12051 ?auto_12047 )
      ( MAKE-2PILE ?auto_12047 ?auto_12048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12052 - BLOCK
      ?auto_12053 - BLOCK
    )
    :vars
    (
      ?auto_12055 - BLOCK
      ?auto_12056 - BLOCK
      ?auto_12054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12052 ?auto_12053 ) ) ( not ( = ?auto_12052 ?auto_12055 ) ) ( not ( = ?auto_12053 ?auto_12055 ) ) ( ON-TABLE ?auto_12056 ) ( not ( = ?auto_12056 ?auto_12055 ) ) ( not ( = ?auto_12056 ?auto_12053 ) ) ( not ( = ?auto_12056 ?auto_12052 ) ) ( ON ?auto_12052 ?auto_12054 ) ( not ( = ?auto_12052 ?auto_12054 ) ) ( not ( = ?auto_12053 ?auto_12054 ) ) ( not ( = ?auto_12055 ?auto_12054 ) ) ( not ( = ?auto_12056 ?auto_12054 ) ) ( ON ?auto_12053 ?auto_12052 ) ( CLEAR ?auto_12053 ) ( ON-TABLE ?auto_12054 ) ( HOLDING ?auto_12055 ) ( CLEAR ?auto_12056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12056 ?auto_12055 )
      ( MAKE-2PILE ?auto_12052 ?auto_12053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12057 - BLOCK
      ?auto_12058 - BLOCK
    )
    :vars
    (
      ?auto_12061 - BLOCK
      ?auto_12060 - BLOCK
      ?auto_12059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12057 ?auto_12058 ) ) ( not ( = ?auto_12057 ?auto_12061 ) ) ( not ( = ?auto_12058 ?auto_12061 ) ) ( ON-TABLE ?auto_12060 ) ( not ( = ?auto_12060 ?auto_12061 ) ) ( not ( = ?auto_12060 ?auto_12058 ) ) ( not ( = ?auto_12060 ?auto_12057 ) ) ( ON ?auto_12057 ?auto_12059 ) ( not ( = ?auto_12057 ?auto_12059 ) ) ( not ( = ?auto_12058 ?auto_12059 ) ) ( not ( = ?auto_12061 ?auto_12059 ) ) ( not ( = ?auto_12060 ?auto_12059 ) ) ( ON ?auto_12058 ?auto_12057 ) ( ON-TABLE ?auto_12059 ) ( CLEAR ?auto_12060 ) ( ON ?auto_12061 ?auto_12058 ) ( CLEAR ?auto_12061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12059 ?auto_12057 ?auto_12058 )
      ( MAKE-2PILE ?auto_12057 ?auto_12058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12062 - BLOCK
      ?auto_12063 - BLOCK
    )
    :vars
    (
      ?auto_12066 - BLOCK
      ?auto_12065 - BLOCK
      ?auto_12064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12062 ?auto_12063 ) ) ( not ( = ?auto_12062 ?auto_12066 ) ) ( not ( = ?auto_12063 ?auto_12066 ) ) ( not ( = ?auto_12065 ?auto_12066 ) ) ( not ( = ?auto_12065 ?auto_12063 ) ) ( not ( = ?auto_12065 ?auto_12062 ) ) ( ON ?auto_12062 ?auto_12064 ) ( not ( = ?auto_12062 ?auto_12064 ) ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12066 ?auto_12064 ) ) ( not ( = ?auto_12065 ?auto_12064 ) ) ( ON ?auto_12063 ?auto_12062 ) ( ON-TABLE ?auto_12064 ) ( ON ?auto_12066 ?auto_12063 ) ( CLEAR ?auto_12066 ) ( HOLDING ?auto_12065 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12065 )
      ( MAKE-2PILE ?auto_12062 ?auto_12063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12067 - BLOCK
      ?auto_12068 - BLOCK
    )
    :vars
    (
      ?auto_12069 - BLOCK
      ?auto_12070 - BLOCK
      ?auto_12071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12067 ?auto_12068 ) ) ( not ( = ?auto_12067 ?auto_12069 ) ) ( not ( = ?auto_12068 ?auto_12069 ) ) ( not ( = ?auto_12070 ?auto_12069 ) ) ( not ( = ?auto_12070 ?auto_12068 ) ) ( not ( = ?auto_12070 ?auto_12067 ) ) ( ON ?auto_12067 ?auto_12071 ) ( not ( = ?auto_12067 ?auto_12071 ) ) ( not ( = ?auto_12068 ?auto_12071 ) ) ( not ( = ?auto_12069 ?auto_12071 ) ) ( not ( = ?auto_12070 ?auto_12071 ) ) ( ON ?auto_12068 ?auto_12067 ) ( ON-TABLE ?auto_12071 ) ( ON ?auto_12069 ?auto_12068 ) ( ON ?auto_12070 ?auto_12069 ) ( CLEAR ?auto_12070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12071 ?auto_12067 ?auto_12068 ?auto_12069 )
      ( MAKE-2PILE ?auto_12067 ?auto_12068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12073 - BLOCK
    )
    :vars
    (
      ?auto_12074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12074 ?auto_12073 ) ( CLEAR ?auto_12074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12073 ) ( not ( = ?auto_12073 ?auto_12074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12074 ?auto_12073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12075 - BLOCK
    )
    :vars
    (
      ?auto_12076 - BLOCK
      ?auto_12077 - BLOCK
      ?auto_12078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12076 ?auto_12075 ) ( CLEAR ?auto_12076 ) ( ON-TABLE ?auto_12075 ) ( not ( = ?auto_12075 ?auto_12076 ) ) ( HOLDING ?auto_12077 ) ( CLEAR ?auto_12078 ) ( not ( = ?auto_12075 ?auto_12077 ) ) ( not ( = ?auto_12075 ?auto_12078 ) ) ( not ( = ?auto_12076 ?auto_12077 ) ) ( not ( = ?auto_12076 ?auto_12078 ) ) ( not ( = ?auto_12077 ?auto_12078 ) ) )
    :subtasks
    ( ( !STACK ?auto_12077 ?auto_12078 )
      ( MAKE-1PILE ?auto_12075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12079 - BLOCK
    )
    :vars
    (
      ?auto_12081 - BLOCK
      ?auto_12080 - BLOCK
      ?auto_12082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12081 ?auto_12079 ) ( ON-TABLE ?auto_12079 ) ( not ( = ?auto_12079 ?auto_12081 ) ) ( CLEAR ?auto_12080 ) ( not ( = ?auto_12079 ?auto_12082 ) ) ( not ( = ?auto_12079 ?auto_12080 ) ) ( not ( = ?auto_12081 ?auto_12082 ) ) ( not ( = ?auto_12081 ?auto_12080 ) ) ( not ( = ?auto_12082 ?auto_12080 ) ) ( ON ?auto_12082 ?auto_12081 ) ( CLEAR ?auto_12082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12079 ?auto_12081 )
      ( MAKE-1PILE ?auto_12079 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12083 - BLOCK
    )
    :vars
    (
      ?auto_12085 - BLOCK
      ?auto_12086 - BLOCK
      ?auto_12084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12085 ?auto_12083 ) ( ON-TABLE ?auto_12083 ) ( not ( = ?auto_12083 ?auto_12085 ) ) ( not ( = ?auto_12083 ?auto_12086 ) ) ( not ( = ?auto_12083 ?auto_12084 ) ) ( not ( = ?auto_12085 ?auto_12086 ) ) ( not ( = ?auto_12085 ?auto_12084 ) ) ( not ( = ?auto_12086 ?auto_12084 ) ) ( ON ?auto_12086 ?auto_12085 ) ( CLEAR ?auto_12086 ) ( HOLDING ?auto_12084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12084 )
      ( MAKE-1PILE ?auto_12083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12087 - BLOCK
    )
    :vars
    (
      ?auto_12088 - BLOCK
      ?auto_12089 - BLOCK
      ?auto_12090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12088 ?auto_12087 ) ( ON-TABLE ?auto_12087 ) ( not ( = ?auto_12087 ?auto_12088 ) ) ( not ( = ?auto_12087 ?auto_12089 ) ) ( not ( = ?auto_12087 ?auto_12090 ) ) ( not ( = ?auto_12088 ?auto_12089 ) ) ( not ( = ?auto_12088 ?auto_12090 ) ) ( not ( = ?auto_12089 ?auto_12090 ) ) ( ON ?auto_12089 ?auto_12088 ) ( ON ?auto_12090 ?auto_12089 ) ( CLEAR ?auto_12090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12087 ?auto_12088 ?auto_12089 )
      ( MAKE-1PILE ?auto_12087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12091 - BLOCK
    )
    :vars
    (
      ?auto_12093 - BLOCK
      ?auto_12092 - BLOCK
      ?auto_12094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12093 ?auto_12091 ) ( ON-TABLE ?auto_12091 ) ( not ( = ?auto_12091 ?auto_12093 ) ) ( not ( = ?auto_12091 ?auto_12092 ) ) ( not ( = ?auto_12091 ?auto_12094 ) ) ( not ( = ?auto_12093 ?auto_12092 ) ) ( not ( = ?auto_12093 ?auto_12094 ) ) ( not ( = ?auto_12092 ?auto_12094 ) ) ( ON ?auto_12092 ?auto_12093 ) ( HOLDING ?auto_12094 ) ( CLEAR ?auto_12092 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12091 ?auto_12093 ?auto_12092 ?auto_12094 )
      ( MAKE-1PILE ?auto_12091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12095 - BLOCK
    )
    :vars
    (
      ?auto_12096 - BLOCK
      ?auto_12098 - BLOCK
      ?auto_12097 - BLOCK
      ?auto_12099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12096 ?auto_12095 ) ( ON-TABLE ?auto_12095 ) ( not ( = ?auto_12095 ?auto_12096 ) ) ( not ( = ?auto_12095 ?auto_12098 ) ) ( not ( = ?auto_12095 ?auto_12097 ) ) ( not ( = ?auto_12096 ?auto_12098 ) ) ( not ( = ?auto_12096 ?auto_12097 ) ) ( not ( = ?auto_12098 ?auto_12097 ) ) ( ON ?auto_12098 ?auto_12096 ) ( CLEAR ?auto_12098 ) ( ON ?auto_12097 ?auto_12099 ) ( CLEAR ?auto_12097 ) ( HAND-EMPTY ) ( not ( = ?auto_12095 ?auto_12099 ) ) ( not ( = ?auto_12096 ?auto_12099 ) ) ( not ( = ?auto_12098 ?auto_12099 ) ) ( not ( = ?auto_12097 ?auto_12099 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12097 ?auto_12099 )
      ( MAKE-1PILE ?auto_12095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12100 - BLOCK
    )
    :vars
    (
      ?auto_12103 - BLOCK
      ?auto_12104 - BLOCK
      ?auto_12102 - BLOCK
      ?auto_12101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12103 ?auto_12100 ) ( ON-TABLE ?auto_12100 ) ( not ( = ?auto_12100 ?auto_12103 ) ) ( not ( = ?auto_12100 ?auto_12104 ) ) ( not ( = ?auto_12100 ?auto_12102 ) ) ( not ( = ?auto_12103 ?auto_12104 ) ) ( not ( = ?auto_12103 ?auto_12102 ) ) ( not ( = ?auto_12104 ?auto_12102 ) ) ( ON ?auto_12102 ?auto_12101 ) ( CLEAR ?auto_12102 ) ( not ( = ?auto_12100 ?auto_12101 ) ) ( not ( = ?auto_12103 ?auto_12101 ) ) ( not ( = ?auto_12104 ?auto_12101 ) ) ( not ( = ?auto_12102 ?auto_12101 ) ) ( HOLDING ?auto_12104 ) ( CLEAR ?auto_12103 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12100 ?auto_12103 ?auto_12104 )
      ( MAKE-1PILE ?auto_12100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12105 - BLOCK
    )
    :vars
    (
      ?auto_12108 - BLOCK
      ?auto_12109 - BLOCK
      ?auto_12106 - BLOCK
      ?auto_12107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12108 ?auto_12105 ) ( ON-TABLE ?auto_12105 ) ( not ( = ?auto_12105 ?auto_12108 ) ) ( not ( = ?auto_12105 ?auto_12109 ) ) ( not ( = ?auto_12105 ?auto_12106 ) ) ( not ( = ?auto_12108 ?auto_12109 ) ) ( not ( = ?auto_12108 ?auto_12106 ) ) ( not ( = ?auto_12109 ?auto_12106 ) ) ( ON ?auto_12106 ?auto_12107 ) ( not ( = ?auto_12105 ?auto_12107 ) ) ( not ( = ?auto_12108 ?auto_12107 ) ) ( not ( = ?auto_12109 ?auto_12107 ) ) ( not ( = ?auto_12106 ?auto_12107 ) ) ( CLEAR ?auto_12108 ) ( ON ?auto_12109 ?auto_12106 ) ( CLEAR ?auto_12109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12107 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12107 ?auto_12106 )
      ( MAKE-1PILE ?auto_12105 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12120 - BLOCK
    )
    :vars
    (
      ?auto_12123 - BLOCK
      ?auto_12122 - BLOCK
      ?auto_12124 - BLOCK
      ?auto_12121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12120 ?auto_12123 ) ) ( not ( = ?auto_12120 ?auto_12122 ) ) ( not ( = ?auto_12120 ?auto_12124 ) ) ( not ( = ?auto_12123 ?auto_12122 ) ) ( not ( = ?auto_12123 ?auto_12124 ) ) ( not ( = ?auto_12122 ?auto_12124 ) ) ( ON ?auto_12124 ?auto_12121 ) ( not ( = ?auto_12120 ?auto_12121 ) ) ( not ( = ?auto_12123 ?auto_12121 ) ) ( not ( = ?auto_12122 ?auto_12121 ) ) ( not ( = ?auto_12124 ?auto_12121 ) ) ( ON ?auto_12122 ?auto_12124 ) ( ON-TABLE ?auto_12121 ) ( ON ?auto_12123 ?auto_12122 ) ( CLEAR ?auto_12123 ) ( HOLDING ?auto_12120 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12120 ?auto_12123 )
      ( MAKE-1PILE ?auto_12120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12125 - BLOCK
    )
    :vars
    (
      ?auto_12127 - BLOCK
      ?auto_12129 - BLOCK
      ?auto_12126 - BLOCK
      ?auto_12128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12125 ?auto_12127 ) ) ( not ( = ?auto_12125 ?auto_12129 ) ) ( not ( = ?auto_12125 ?auto_12126 ) ) ( not ( = ?auto_12127 ?auto_12129 ) ) ( not ( = ?auto_12127 ?auto_12126 ) ) ( not ( = ?auto_12129 ?auto_12126 ) ) ( ON ?auto_12126 ?auto_12128 ) ( not ( = ?auto_12125 ?auto_12128 ) ) ( not ( = ?auto_12127 ?auto_12128 ) ) ( not ( = ?auto_12129 ?auto_12128 ) ) ( not ( = ?auto_12126 ?auto_12128 ) ) ( ON ?auto_12129 ?auto_12126 ) ( ON-TABLE ?auto_12128 ) ( ON ?auto_12127 ?auto_12129 ) ( ON ?auto_12125 ?auto_12127 ) ( CLEAR ?auto_12125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12128 ?auto_12126 ?auto_12129 ?auto_12127 )
      ( MAKE-1PILE ?auto_12125 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12133 - BLOCK
      ?auto_12134 - BLOCK
      ?auto_12135 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12135 ) ( CLEAR ?auto_12134 ) ( ON-TABLE ?auto_12133 ) ( ON ?auto_12134 ?auto_12133 ) ( not ( = ?auto_12133 ?auto_12134 ) ) ( not ( = ?auto_12133 ?auto_12135 ) ) ( not ( = ?auto_12134 ?auto_12135 ) ) )
    :subtasks
    ( ( !STACK ?auto_12135 ?auto_12134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12136 - BLOCK
      ?auto_12137 - BLOCK
      ?auto_12138 - BLOCK
    )
    :vars
    (
      ?auto_12139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12137 ) ( ON-TABLE ?auto_12136 ) ( ON ?auto_12137 ?auto_12136 ) ( not ( = ?auto_12136 ?auto_12137 ) ) ( not ( = ?auto_12136 ?auto_12138 ) ) ( not ( = ?auto_12137 ?auto_12138 ) ) ( ON ?auto_12138 ?auto_12139 ) ( CLEAR ?auto_12138 ) ( HAND-EMPTY ) ( not ( = ?auto_12136 ?auto_12139 ) ) ( not ( = ?auto_12137 ?auto_12139 ) ) ( not ( = ?auto_12138 ?auto_12139 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12138 ?auto_12139 )
      ( MAKE-3PILE ?auto_12136 ?auto_12137 ?auto_12138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12140 - BLOCK
      ?auto_12141 - BLOCK
      ?auto_12142 - BLOCK
    )
    :vars
    (
      ?auto_12143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12140 ) ( not ( = ?auto_12140 ?auto_12141 ) ) ( not ( = ?auto_12140 ?auto_12142 ) ) ( not ( = ?auto_12141 ?auto_12142 ) ) ( ON ?auto_12142 ?auto_12143 ) ( CLEAR ?auto_12142 ) ( not ( = ?auto_12140 ?auto_12143 ) ) ( not ( = ?auto_12141 ?auto_12143 ) ) ( not ( = ?auto_12142 ?auto_12143 ) ) ( HOLDING ?auto_12141 ) ( CLEAR ?auto_12140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12140 ?auto_12141 )
      ( MAKE-3PILE ?auto_12140 ?auto_12141 ?auto_12142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12144 - BLOCK
      ?auto_12145 - BLOCK
      ?auto_12146 - BLOCK
    )
    :vars
    (
      ?auto_12147 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12144 ) ( not ( = ?auto_12144 ?auto_12145 ) ) ( not ( = ?auto_12144 ?auto_12146 ) ) ( not ( = ?auto_12145 ?auto_12146 ) ) ( ON ?auto_12146 ?auto_12147 ) ( not ( = ?auto_12144 ?auto_12147 ) ) ( not ( = ?auto_12145 ?auto_12147 ) ) ( not ( = ?auto_12146 ?auto_12147 ) ) ( CLEAR ?auto_12144 ) ( ON ?auto_12145 ?auto_12146 ) ( CLEAR ?auto_12145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12147 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12147 ?auto_12146 )
      ( MAKE-3PILE ?auto_12144 ?auto_12145 ?auto_12146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12148 - BLOCK
      ?auto_12149 - BLOCK
      ?auto_12150 - BLOCK
    )
    :vars
    (
      ?auto_12151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12148 ?auto_12149 ) ) ( not ( = ?auto_12148 ?auto_12150 ) ) ( not ( = ?auto_12149 ?auto_12150 ) ) ( ON ?auto_12150 ?auto_12151 ) ( not ( = ?auto_12148 ?auto_12151 ) ) ( not ( = ?auto_12149 ?auto_12151 ) ) ( not ( = ?auto_12150 ?auto_12151 ) ) ( ON ?auto_12149 ?auto_12150 ) ( CLEAR ?auto_12149 ) ( ON-TABLE ?auto_12151 ) ( HOLDING ?auto_12148 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12148 )
      ( MAKE-3PILE ?auto_12148 ?auto_12149 ?auto_12150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12152 - BLOCK
      ?auto_12153 - BLOCK
      ?auto_12154 - BLOCK
    )
    :vars
    (
      ?auto_12155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12152 ?auto_12153 ) ) ( not ( = ?auto_12152 ?auto_12154 ) ) ( not ( = ?auto_12153 ?auto_12154 ) ) ( ON ?auto_12154 ?auto_12155 ) ( not ( = ?auto_12152 ?auto_12155 ) ) ( not ( = ?auto_12153 ?auto_12155 ) ) ( not ( = ?auto_12154 ?auto_12155 ) ) ( ON ?auto_12153 ?auto_12154 ) ( ON-TABLE ?auto_12155 ) ( ON ?auto_12152 ?auto_12153 ) ( CLEAR ?auto_12152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12155 ?auto_12154 ?auto_12153 )
      ( MAKE-3PILE ?auto_12152 ?auto_12153 ?auto_12154 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12156 - BLOCK
      ?auto_12157 - BLOCK
      ?auto_12158 - BLOCK
    )
    :vars
    (
      ?auto_12159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12156 ?auto_12157 ) ) ( not ( = ?auto_12156 ?auto_12158 ) ) ( not ( = ?auto_12157 ?auto_12158 ) ) ( ON ?auto_12158 ?auto_12159 ) ( not ( = ?auto_12156 ?auto_12159 ) ) ( not ( = ?auto_12157 ?auto_12159 ) ) ( not ( = ?auto_12158 ?auto_12159 ) ) ( ON ?auto_12157 ?auto_12158 ) ( ON-TABLE ?auto_12159 ) ( HOLDING ?auto_12156 ) ( CLEAR ?auto_12157 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12159 ?auto_12158 ?auto_12157 ?auto_12156 )
      ( MAKE-3PILE ?auto_12156 ?auto_12157 ?auto_12158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12160 - BLOCK
      ?auto_12161 - BLOCK
      ?auto_12162 - BLOCK
    )
    :vars
    (
      ?auto_12163 - BLOCK
      ?auto_12164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12160 ?auto_12161 ) ) ( not ( = ?auto_12160 ?auto_12162 ) ) ( not ( = ?auto_12161 ?auto_12162 ) ) ( ON ?auto_12162 ?auto_12163 ) ( not ( = ?auto_12160 ?auto_12163 ) ) ( not ( = ?auto_12161 ?auto_12163 ) ) ( not ( = ?auto_12162 ?auto_12163 ) ) ( ON ?auto_12161 ?auto_12162 ) ( ON-TABLE ?auto_12163 ) ( CLEAR ?auto_12161 ) ( ON ?auto_12160 ?auto_12164 ) ( CLEAR ?auto_12160 ) ( HAND-EMPTY ) ( not ( = ?auto_12160 ?auto_12164 ) ) ( not ( = ?auto_12161 ?auto_12164 ) ) ( not ( = ?auto_12162 ?auto_12164 ) ) ( not ( = ?auto_12163 ?auto_12164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12160 ?auto_12164 )
      ( MAKE-3PILE ?auto_12160 ?auto_12161 ?auto_12162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12165 - BLOCK
      ?auto_12166 - BLOCK
      ?auto_12167 - BLOCK
    )
    :vars
    (
      ?auto_12169 - BLOCK
      ?auto_12168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12165 ?auto_12166 ) ) ( not ( = ?auto_12165 ?auto_12167 ) ) ( not ( = ?auto_12166 ?auto_12167 ) ) ( ON ?auto_12167 ?auto_12169 ) ( not ( = ?auto_12165 ?auto_12169 ) ) ( not ( = ?auto_12166 ?auto_12169 ) ) ( not ( = ?auto_12167 ?auto_12169 ) ) ( ON-TABLE ?auto_12169 ) ( ON ?auto_12165 ?auto_12168 ) ( CLEAR ?auto_12165 ) ( not ( = ?auto_12165 ?auto_12168 ) ) ( not ( = ?auto_12166 ?auto_12168 ) ) ( not ( = ?auto_12167 ?auto_12168 ) ) ( not ( = ?auto_12169 ?auto_12168 ) ) ( HOLDING ?auto_12166 ) ( CLEAR ?auto_12167 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12169 ?auto_12167 ?auto_12166 )
      ( MAKE-3PILE ?auto_12165 ?auto_12166 ?auto_12167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12170 - BLOCK
      ?auto_12171 - BLOCK
      ?auto_12172 - BLOCK
    )
    :vars
    (
      ?auto_12173 - BLOCK
      ?auto_12174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12170 ?auto_12171 ) ) ( not ( = ?auto_12170 ?auto_12172 ) ) ( not ( = ?auto_12171 ?auto_12172 ) ) ( ON ?auto_12172 ?auto_12173 ) ( not ( = ?auto_12170 ?auto_12173 ) ) ( not ( = ?auto_12171 ?auto_12173 ) ) ( not ( = ?auto_12172 ?auto_12173 ) ) ( ON-TABLE ?auto_12173 ) ( ON ?auto_12170 ?auto_12174 ) ( not ( = ?auto_12170 ?auto_12174 ) ) ( not ( = ?auto_12171 ?auto_12174 ) ) ( not ( = ?auto_12172 ?auto_12174 ) ) ( not ( = ?auto_12173 ?auto_12174 ) ) ( CLEAR ?auto_12172 ) ( ON ?auto_12171 ?auto_12170 ) ( CLEAR ?auto_12171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12174 ?auto_12170 )
      ( MAKE-3PILE ?auto_12170 ?auto_12171 ?auto_12172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12175 - BLOCK
      ?auto_12176 - BLOCK
      ?auto_12177 - BLOCK
    )
    :vars
    (
      ?auto_12179 - BLOCK
      ?auto_12178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12175 ?auto_12176 ) ) ( not ( = ?auto_12175 ?auto_12177 ) ) ( not ( = ?auto_12176 ?auto_12177 ) ) ( not ( = ?auto_12175 ?auto_12179 ) ) ( not ( = ?auto_12176 ?auto_12179 ) ) ( not ( = ?auto_12177 ?auto_12179 ) ) ( ON-TABLE ?auto_12179 ) ( ON ?auto_12175 ?auto_12178 ) ( not ( = ?auto_12175 ?auto_12178 ) ) ( not ( = ?auto_12176 ?auto_12178 ) ) ( not ( = ?auto_12177 ?auto_12178 ) ) ( not ( = ?auto_12179 ?auto_12178 ) ) ( ON ?auto_12176 ?auto_12175 ) ( CLEAR ?auto_12176 ) ( ON-TABLE ?auto_12178 ) ( HOLDING ?auto_12177 ) ( CLEAR ?auto_12179 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12179 ?auto_12177 )
      ( MAKE-3PILE ?auto_12175 ?auto_12176 ?auto_12177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12180 - BLOCK
      ?auto_12181 - BLOCK
      ?auto_12182 - BLOCK
    )
    :vars
    (
      ?auto_12183 - BLOCK
      ?auto_12184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12180 ?auto_12181 ) ) ( not ( = ?auto_12180 ?auto_12182 ) ) ( not ( = ?auto_12181 ?auto_12182 ) ) ( not ( = ?auto_12180 ?auto_12183 ) ) ( not ( = ?auto_12181 ?auto_12183 ) ) ( not ( = ?auto_12182 ?auto_12183 ) ) ( ON-TABLE ?auto_12183 ) ( ON ?auto_12180 ?auto_12184 ) ( not ( = ?auto_12180 ?auto_12184 ) ) ( not ( = ?auto_12181 ?auto_12184 ) ) ( not ( = ?auto_12182 ?auto_12184 ) ) ( not ( = ?auto_12183 ?auto_12184 ) ) ( ON ?auto_12181 ?auto_12180 ) ( ON-TABLE ?auto_12184 ) ( CLEAR ?auto_12183 ) ( ON ?auto_12182 ?auto_12181 ) ( CLEAR ?auto_12182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12184 ?auto_12180 ?auto_12181 )
      ( MAKE-3PILE ?auto_12180 ?auto_12181 ?auto_12182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12185 - BLOCK
      ?auto_12186 - BLOCK
      ?auto_12187 - BLOCK
    )
    :vars
    (
      ?auto_12188 - BLOCK
      ?auto_12189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12185 ?auto_12186 ) ) ( not ( = ?auto_12185 ?auto_12187 ) ) ( not ( = ?auto_12186 ?auto_12187 ) ) ( not ( = ?auto_12185 ?auto_12188 ) ) ( not ( = ?auto_12186 ?auto_12188 ) ) ( not ( = ?auto_12187 ?auto_12188 ) ) ( ON ?auto_12185 ?auto_12189 ) ( not ( = ?auto_12185 ?auto_12189 ) ) ( not ( = ?auto_12186 ?auto_12189 ) ) ( not ( = ?auto_12187 ?auto_12189 ) ) ( not ( = ?auto_12188 ?auto_12189 ) ) ( ON ?auto_12186 ?auto_12185 ) ( ON-TABLE ?auto_12189 ) ( ON ?auto_12187 ?auto_12186 ) ( CLEAR ?auto_12187 ) ( HOLDING ?auto_12188 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12188 )
      ( MAKE-3PILE ?auto_12185 ?auto_12186 ?auto_12187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12190 - BLOCK
      ?auto_12191 - BLOCK
      ?auto_12192 - BLOCK
    )
    :vars
    (
      ?auto_12194 - BLOCK
      ?auto_12193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12190 ?auto_12191 ) ) ( not ( = ?auto_12190 ?auto_12192 ) ) ( not ( = ?auto_12191 ?auto_12192 ) ) ( not ( = ?auto_12190 ?auto_12194 ) ) ( not ( = ?auto_12191 ?auto_12194 ) ) ( not ( = ?auto_12192 ?auto_12194 ) ) ( ON ?auto_12190 ?auto_12193 ) ( not ( = ?auto_12190 ?auto_12193 ) ) ( not ( = ?auto_12191 ?auto_12193 ) ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( not ( = ?auto_12194 ?auto_12193 ) ) ( ON ?auto_12191 ?auto_12190 ) ( ON-TABLE ?auto_12193 ) ( ON ?auto_12192 ?auto_12191 ) ( ON ?auto_12194 ?auto_12192 ) ( CLEAR ?auto_12194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12193 ?auto_12190 ?auto_12191 ?auto_12192 )
      ( MAKE-3PILE ?auto_12190 ?auto_12191 ?auto_12192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12199 - BLOCK
      ?auto_12200 - BLOCK
      ?auto_12201 - BLOCK
      ?auto_12202 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12202 ) ( CLEAR ?auto_12201 ) ( ON-TABLE ?auto_12199 ) ( ON ?auto_12200 ?auto_12199 ) ( ON ?auto_12201 ?auto_12200 ) ( not ( = ?auto_12199 ?auto_12200 ) ) ( not ( = ?auto_12199 ?auto_12201 ) ) ( not ( = ?auto_12199 ?auto_12202 ) ) ( not ( = ?auto_12200 ?auto_12201 ) ) ( not ( = ?auto_12200 ?auto_12202 ) ) ( not ( = ?auto_12201 ?auto_12202 ) ) )
    :subtasks
    ( ( !STACK ?auto_12202 ?auto_12201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12203 - BLOCK
      ?auto_12204 - BLOCK
      ?auto_12205 - BLOCK
      ?auto_12206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12205 ) ( ON-TABLE ?auto_12203 ) ( ON ?auto_12204 ?auto_12203 ) ( ON ?auto_12205 ?auto_12204 ) ( not ( = ?auto_12203 ?auto_12204 ) ) ( not ( = ?auto_12203 ?auto_12205 ) ) ( not ( = ?auto_12203 ?auto_12206 ) ) ( not ( = ?auto_12204 ?auto_12205 ) ) ( not ( = ?auto_12204 ?auto_12206 ) ) ( not ( = ?auto_12205 ?auto_12206 ) ) ( ON-TABLE ?auto_12206 ) ( CLEAR ?auto_12206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_12206 )
      ( MAKE-4PILE ?auto_12203 ?auto_12204 ?auto_12205 ?auto_12206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12207 - BLOCK
      ?auto_12208 - BLOCK
      ?auto_12209 - BLOCK
      ?auto_12210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12207 ) ( ON ?auto_12208 ?auto_12207 ) ( not ( = ?auto_12207 ?auto_12208 ) ) ( not ( = ?auto_12207 ?auto_12209 ) ) ( not ( = ?auto_12207 ?auto_12210 ) ) ( not ( = ?auto_12208 ?auto_12209 ) ) ( not ( = ?auto_12208 ?auto_12210 ) ) ( not ( = ?auto_12209 ?auto_12210 ) ) ( ON-TABLE ?auto_12210 ) ( CLEAR ?auto_12210 ) ( HOLDING ?auto_12209 ) ( CLEAR ?auto_12208 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12207 ?auto_12208 ?auto_12209 )
      ( MAKE-4PILE ?auto_12207 ?auto_12208 ?auto_12209 ?auto_12210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12211 - BLOCK
      ?auto_12212 - BLOCK
      ?auto_12213 - BLOCK
      ?auto_12214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12211 ) ( ON ?auto_12212 ?auto_12211 ) ( not ( = ?auto_12211 ?auto_12212 ) ) ( not ( = ?auto_12211 ?auto_12213 ) ) ( not ( = ?auto_12211 ?auto_12214 ) ) ( not ( = ?auto_12212 ?auto_12213 ) ) ( not ( = ?auto_12212 ?auto_12214 ) ) ( not ( = ?auto_12213 ?auto_12214 ) ) ( ON-TABLE ?auto_12214 ) ( CLEAR ?auto_12212 ) ( ON ?auto_12213 ?auto_12214 ) ( CLEAR ?auto_12213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12214 )
      ( MAKE-4PILE ?auto_12211 ?auto_12212 ?auto_12213 ?auto_12214 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12215 - BLOCK
      ?auto_12216 - BLOCK
      ?auto_12217 - BLOCK
      ?auto_12218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12215 ) ( not ( = ?auto_12215 ?auto_12216 ) ) ( not ( = ?auto_12215 ?auto_12217 ) ) ( not ( = ?auto_12215 ?auto_12218 ) ) ( not ( = ?auto_12216 ?auto_12217 ) ) ( not ( = ?auto_12216 ?auto_12218 ) ) ( not ( = ?auto_12217 ?auto_12218 ) ) ( ON-TABLE ?auto_12218 ) ( ON ?auto_12217 ?auto_12218 ) ( CLEAR ?auto_12217 ) ( HOLDING ?auto_12216 ) ( CLEAR ?auto_12215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12215 ?auto_12216 )
      ( MAKE-4PILE ?auto_12215 ?auto_12216 ?auto_12217 ?auto_12218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12219 - BLOCK
      ?auto_12220 - BLOCK
      ?auto_12221 - BLOCK
      ?auto_12222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12219 ) ( not ( = ?auto_12219 ?auto_12220 ) ) ( not ( = ?auto_12219 ?auto_12221 ) ) ( not ( = ?auto_12219 ?auto_12222 ) ) ( not ( = ?auto_12220 ?auto_12221 ) ) ( not ( = ?auto_12220 ?auto_12222 ) ) ( not ( = ?auto_12221 ?auto_12222 ) ) ( ON-TABLE ?auto_12222 ) ( ON ?auto_12221 ?auto_12222 ) ( CLEAR ?auto_12219 ) ( ON ?auto_12220 ?auto_12221 ) ( CLEAR ?auto_12220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12222 ?auto_12221 )
      ( MAKE-4PILE ?auto_12219 ?auto_12220 ?auto_12221 ?auto_12222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12223 - BLOCK
      ?auto_12224 - BLOCK
      ?auto_12225 - BLOCK
      ?auto_12226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12223 ?auto_12224 ) ) ( not ( = ?auto_12223 ?auto_12225 ) ) ( not ( = ?auto_12223 ?auto_12226 ) ) ( not ( = ?auto_12224 ?auto_12225 ) ) ( not ( = ?auto_12224 ?auto_12226 ) ) ( not ( = ?auto_12225 ?auto_12226 ) ) ( ON-TABLE ?auto_12226 ) ( ON ?auto_12225 ?auto_12226 ) ( ON ?auto_12224 ?auto_12225 ) ( CLEAR ?auto_12224 ) ( HOLDING ?auto_12223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12223 )
      ( MAKE-4PILE ?auto_12223 ?auto_12224 ?auto_12225 ?auto_12226 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12227 - BLOCK
      ?auto_12228 - BLOCK
      ?auto_12229 - BLOCK
      ?auto_12230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12227 ?auto_12228 ) ) ( not ( = ?auto_12227 ?auto_12229 ) ) ( not ( = ?auto_12227 ?auto_12230 ) ) ( not ( = ?auto_12228 ?auto_12229 ) ) ( not ( = ?auto_12228 ?auto_12230 ) ) ( not ( = ?auto_12229 ?auto_12230 ) ) ( ON-TABLE ?auto_12230 ) ( ON ?auto_12229 ?auto_12230 ) ( ON ?auto_12228 ?auto_12229 ) ( ON ?auto_12227 ?auto_12228 ) ( CLEAR ?auto_12227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12230 ?auto_12229 ?auto_12228 )
      ( MAKE-4PILE ?auto_12227 ?auto_12228 ?auto_12229 ?auto_12230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12231 - BLOCK
      ?auto_12232 - BLOCK
      ?auto_12233 - BLOCK
      ?auto_12234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12231 ?auto_12232 ) ) ( not ( = ?auto_12231 ?auto_12233 ) ) ( not ( = ?auto_12231 ?auto_12234 ) ) ( not ( = ?auto_12232 ?auto_12233 ) ) ( not ( = ?auto_12232 ?auto_12234 ) ) ( not ( = ?auto_12233 ?auto_12234 ) ) ( ON-TABLE ?auto_12234 ) ( ON ?auto_12233 ?auto_12234 ) ( ON ?auto_12232 ?auto_12233 ) ( HOLDING ?auto_12231 ) ( CLEAR ?auto_12232 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12234 ?auto_12233 ?auto_12232 ?auto_12231 )
      ( MAKE-4PILE ?auto_12231 ?auto_12232 ?auto_12233 ?auto_12234 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12235 - BLOCK
      ?auto_12236 - BLOCK
      ?auto_12237 - BLOCK
      ?auto_12238 - BLOCK
    )
    :vars
    (
      ?auto_12239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12235 ?auto_12236 ) ) ( not ( = ?auto_12235 ?auto_12237 ) ) ( not ( = ?auto_12235 ?auto_12238 ) ) ( not ( = ?auto_12236 ?auto_12237 ) ) ( not ( = ?auto_12236 ?auto_12238 ) ) ( not ( = ?auto_12237 ?auto_12238 ) ) ( ON-TABLE ?auto_12238 ) ( ON ?auto_12237 ?auto_12238 ) ( ON ?auto_12236 ?auto_12237 ) ( CLEAR ?auto_12236 ) ( ON ?auto_12235 ?auto_12239 ) ( CLEAR ?auto_12235 ) ( HAND-EMPTY ) ( not ( = ?auto_12235 ?auto_12239 ) ) ( not ( = ?auto_12236 ?auto_12239 ) ) ( not ( = ?auto_12237 ?auto_12239 ) ) ( not ( = ?auto_12238 ?auto_12239 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12235 ?auto_12239 )
      ( MAKE-4PILE ?auto_12235 ?auto_12236 ?auto_12237 ?auto_12238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12240 - BLOCK
      ?auto_12241 - BLOCK
      ?auto_12242 - BLOCK
      ?auto_12243 - BLOCK
    )
    :vars
    (
      ?auto_12244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12240 ?auto_12241 ) ) ( not ( = ?auto_12240 ?auto_12242 ) ) ( not ( = ?auto_12240 ?auto_12243 ) ) ( not ( = ?auto_12241 ?auto_12242 ) ) ( not ( = ?auto_12241 ?auto_12243 ) ) ( not ( = ?auto_12242 ?auto_12243 ) ) ( ON-TABLE ?auto_12243 ) ( ON ?auto_12242 ?auto_12243 ) ( ON ?auto_12240 ?auto_12244 ) ( CLEAR ?auto_12240 ) ( not ( = ?auto_12240 ?auto_12244 ) ) ( not ( = ?auto_12241 ?auto_12244 ) ) ( not ( = ?auto_12242 ?auto_12244 ) ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( HOLDING ?auto_12241 ) ( CLEAR ?auto_12242 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12243 ?auto_12242 ?auto_12241 )
      ( MAKE-4PILE ?auto_12240 ?auto_12241 ?auto_12242 ?auto_12243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12245 - BLOCK
      ?auto_12246 - BLOCK
      ?auto_12247 - BLOCK
      ?auto_12248 - BLOCK
    )
    :vars
    (
      ?auto_12249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12245 ?auto_12246 ) ) ( not ( = ?auto_12245 ?auto_12247 ) ) ( not ( = ?auto_12245 ?auto_12248 ) ) ( not ( = ?auto_12246 ?auto_12247 ) ) ( not ( = ?auto_12246 ?auto_12248 ) ) ( not ( = ?auto_12247 ?auto_12248 ) ) ( ON-TABLE ?auto_12248 ) ( ON ?auto_12247 ?auto_12248 ) ( ON ?auto_12245 ?auto_12249 ) ( not ( = ?auto_12245 ?auto_12249 ) ) ( not ( = ?auto_12246 ?auto_12249 ) ) ( not ( = ?auto_12247 ?auto_12249 ) ) ( not ( = ?auto_12248 ?auto_12249 ) ) ( CLEAR ?auto_12247 ) ( ON ?auto_12246 ?auto_12245 ) ( CLEAR ?auto_12246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12249 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12249 ?auto_12245 )
      ( MAKE-4PILE ?auto_12245 ?auto_12246 ?auto_12247 ?auto_12248 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12250 - BLOCK
      ?auto_12251 - BLOCK
      ?auto_12252 - BLOCK
      ?auto_12253 - BLOCK
    )
    :vars
    (
      ?auto_12254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12250 ?auto_12251 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12253 ) ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( not ( = ?auto_12251 ?auto_12253 ) ) ( not ( = ?auto_12252 ?auto_12253 ) ) ( ON-TABLE ?auto_12253 ) ( ON ?auto_12250 ?auto_12254 ) ( not ( = ?auto_12250 ?auto_12254 ) ) ( not ( = ?auto_12251 ?auto_12254 ) ) ( not ( = ?auto_12252 ?auto_12254 ) ) ( not ( = ?auto_12253 ?auto_12254 ) ) ( ON ?auto_12251 ?auto_12250 ) ( CLEAR ?auto_12251 ) ( ON-TABLE ?auto_12254 ) ( HOLDING ?auto_12252 ) ( CLEAR ?auto_12253 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12253 ?auto_12252 )
      ( MAKE-4PILE ?auto_12250 ?auto_12251 ?auto_12252 ?auto_12253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12255 - BLOCK
      ?auto_12256 - BLOCK
      ?auto_12257 - BLOCK
      ?auto_12258 - BLOCK
    )
    :vars
    (
      ?auto_12259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12255 ?auto_12256 ) ) ( not ( = ?auto_12255 ?auto_12257 ) ) ( not ( = ?auto_12255 ?auto_12258 ) ) ( not ( = ?auto_12256 ?auto_12257 ) ) ( not ( = ?auto_12256 ?auto_12258 ) ) ( not ( = ?auto_12257 ?auto_12258 ) ) ( ON-TABLE ?auto_12258 ) ( ON ?auto_12255 ?auto_12259 ) ( not ( = ?auto_12255 ?auto_12259 ) ) ( not ( = ?auto_12256 ?auto_12259 ) ) ( not ( = ?auto_12257 ?auto_12259 ) ) ( not ( = ?auto_12258 ?auto_12259 ) ) ( ON ?auto_12256 ?auto_12255 ) ( ON-TABLE ?auto_12259 ) ( CLEAR ?auto_12258 ) ( ON ?auto_12257 ?auto_12256 ) ( CLEAR ?auto_12257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12259 ?auto_12255 ?auto_12256 )
      ( MAKE-4PILE ?auto_12255 ?auto_12256 ?auto_12257 ?auto_12258 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12260 - BLOCK
      ?auto_12261 - BLOCK
      ?auto_12262 - BLOCK
      ?auto_12263 - BLOCK
    )
    :vars
    (
      ?auto_12264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12260 ?auto_12261 ) ) ( not ( = ?auto_12260 ?auto_12262 ) ) ( not ( = ?auto_12260 ?auto_12263 ) ) ( not ( = ?auto_12261 ?auto_12262 ) ) ( not ( = ?auto_12261 ?auto_12263 ) ) ( not ( = ?auto_12262 ?auto_12263 ) ) ( ON ?auto_12260 ?auto_12264 ) ( not ( = ?auto_12260 ?auto_12264 ) ) ( not ( = ?auto_12261 ?auto_12264 ) ) ( not ( = ?auto_12262 ?auto_12264 ) ) ( not ( = ?auto_12263 ?auto_12264 ) ) ( ON ?auto_12261 ?auto_12260 ) ( ON-TABLE ?auto_12264 ) ( ON ?auto_12262 ?auto_12261 ) ( CLEAR ?auto_12262 ) ( HOLDING ?auto_12263 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12263 )
      ( MAKE-4PILE ?auto_12260 ?auto_12261 ?auto_12262 ?auto_12263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12265 - BLOCK
      ?auto_12266 - BLOCK
      ?auto_12267 - BLOCK
      ?auto_12268 - BLOCK
    )
    :vars
    (
      ?auto_12269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12265 ?auto_12266 ) ) ( not ( = ?auto_12265 ?auto_12267 ) ) ( not ( = ?auto_12265 ?auto_12268 ) ) ( not ( = ?auto_12266 ?auto_12267 ) ) ( not ( = ?auto_12266 ?auto_12268 ) ) ( not ( = ?auto_12267 ?auto_12268 ) ) ( ON ?auto_12265 ?auto_12269 ) ( not ( = ?auto_12265 ?auto_12269 ) ) ( not ( = ?auto_12266 ?auto_12269 ) ) ( not ( = ?auto_12267 ?auto_12269 ) ) ( not ( = ?auto_12268 ?auto_12269 ) ) ( ON ?auto_12266 ?auto_12265 ) ( ON-TABLE ?auto_12269 ) ( ON ?auto_12267 ?auto_12266 ) ( ON ?auto_12268 ?auto_12267 ) ( CLEAR ?auto_12268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12269 ?auto_12265 ?auto_12266 ?auto_12267 )
      ( MAKE-4PILE ?auto_12265 ?auto_12266 ?auto_12267 ?auto_12268 ) )
  )

)

